import csv
import re
from functools import reduce,partial
from bitstring import BitArray

import os
import argparse

class signaltapCsvDumper():
    def __init__(self,fp):
        with open(fp,'r') as csvfile:
            if not os.path.isfile(fp):
                raise NameError("Invalid stp file path")
            self._data = list(csv.reader(csvfile) )
        self._headerIndex  = self.__findHeaderIndex()
        self._header = self._data[self._headerIndex]
        self._dataRowStartIndex =  self._headerIndex + 2
        self._data=self._data[self._dataRowStartIndex:]

    def __findHeaderIndex(self):
        return [i+1 for i,v in enumerate(self._data) if 'Data:'in v ][0]

    def __findSignalBySubstringMatch(self,substr):
        return reduce(lambda x,y:x+(y[0] if substr in y[1] else 0),enumerate(self._header),0)

    def __findSiganalByRegxpMatch(self,pattern):
        return [i for i,v in enumerate(self._header) if len(re.findall(pattern,v)) !=0]

    def __getConditionCheckFunction(self,condition,**kwargs):
        def checkActiveHighSignal (row,validIndex):
            return reduce(lambda x,y:x and y,map(lambda x:'1'in row[x],validIndex) ,True)

        def checkRange(row,inf,sup):
            return (int(row[0])<=sup) and (int(row[0])>=inf)

        if condition == 'active-high':
            if kwargs.get('validSignalIndex') == None:
                raise AttributeError('must set validSignalIndex')

            return partial(checkActiveHighSignal,validIndex=kwargs.get('validSignalIndex'))

        elif condition == 'range':
            checkvalid = checkRange
            inf=kwargs.get('inf') 
            sup=kwargs.get('sup') 
            if inf == None:
                raise AttributeError('must set inf')
            if sup == None:
                raise AttributeError('must set sup')
            return partial(checkRange,inf=inf,sup=sup)
        
    def dumpSession(self,signalPattern:list,outputName:str,condition,**kwargs):
        if(condition == 'active-high'):
            pattern = kwargs.get('validPattern',[])
            validIndex = [self.__findSignalBySubstringMatch(i) for i in pattern]
            tSignalOut= [self.dumpBinaryDataByHierarchyPath(path=i,condition=condition,validSignalIndex = validIndex) for i in signalPattern]

        elif(condition == "range"):
            sup = kwargs.get('sup',0)
            inf = kwargs.get('inf',0)
            tSignalOut= [self.dumpBinaryDataByHierarchyPath(path=i,condition=condition,inf=inf,sup=sup) for i in signalPattern]

        with open('./%s.csv'%outputName, 'w', newline='') as csvfile:
                csvwritter= csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
                for i in tSignalOut:
                    csvwritter.writerow(i)

    def dumpBinaryDataByHierarchyPath(self,path:str,condition='active-high',**kwargs):
        RealOut=[]
        dataIndex = self.__findSiganalByRegxpMatch(path)
        checkvalid = self.__getConditionCheckFunction(condition,**kwargs)
        for row in self._data:
            if checkvalid(row):
                RealData = reduce(lambda x,y:x+str(row[y]),dataIndex,'')
                RealData=RealData.replace(' ','')
                RealData=RealData[::-1]
                RealData=BitArray(bin= RealData).int
                RealOut.append(RealData)
        return RealOut



#dumpSession(["ofdmfft\|source_real\[\d+\]","ofdmfft\|source_imag\[\d+\]"],["ofdmfft|source_valid"],"TransiverFFTOut")

#dumpSession(["ofdmfft\|sink_real\[\d+\]","ofdmfft\|sink_imag\[\d+\]"],["ofdmfft|sink_valid"],"TransiverFFTInput")

#dumpSession(["fftdataadapter\|asi_in_data\[\d+\]"],"FFTDataAdapter:fftdataadapter|aso_out_valid","FFTDataApapterIn")


#dumpSession(["packetsymbolwidthadapter\|asi_in0_data\[\d+\]"],["packetsymbolwidthadapter|asi_in0_ready","packetsymbolwidthadapter|asi_in0_valid"],"QAMOutput")



a=signaltapCsvDumper('../stp1.csv')

a.dumpSession(signalPattern=["ADA_D\[\d+\]","ADB_D\[\d+\]"],condition="range",inf=309,sup=309+960,outputName="ReceiverADInput")


