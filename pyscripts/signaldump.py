import csv
import re
from functools import reduce
from bitstring import BitArray

import argparse

def dumpBinaryDataByHierarchyPath(data:list,header:list,path:str,ValidIndex:int):
    RealOut=[]
    dataIndex= [i for i,v in enumerate(header) if len(re.findall(path,v)) !=0]
    print("Find data %s \n width %d"%(path,len(dataIndex)))

    def checkvalid (row):
        return reduce(lambda x,y:x and y,map(lambda x:'1'in row[x],ValidIndex) ,True)


    for row in data:
        if checkvalid(row):
            RealData = reduce(lambda x,y:x+str(row[y]),dataIndex,'')
            RealData=RealData.replace(' ','')
            RealData=RealData[::-1]
            RealData=BitArray(bin= RealData).int
            RealOut.append(RealData)
    return RealOut

def findHeaderIndex(rawDataBuffer:list):
    return [i+1 for i,v in enumerate(rawDataBuffer) if 'Data:'in v ][0]

def findValidIndex(header,path):
    return reduce(lambda x,y:x+(y[0] if path in y[1] else 0),enumerate(header),0)

def dumpSession(signalPattern:list,validPattern,outputName):
    with open('../stp1.csv','r') as csvfile:
        csvObj = csv.reader(csvfile) 
        csvBuffer=list(csvObj)
        headerIndex =  findHeaderIndex(csvBuffer)
        dataStartIndex =  headerIndex + 2

        header = csvBuffer[headerIndex]
        data  = csvBuffer[dataStartIndex:]

        ValidIndex = [findValidIndex(header,i) for i in validPattern]
        print(ValidIndex)

        tSignalOut= [dumpBinaryDataByHierarchyPath(data=data,header=header,path=i,ValidIndex=ValidIndex) for i in signalPattern]
        with open('./%s.csv'%outputName, 'w', newline='') as csvfile:
                spamwriter = csv.writer(csvfile, delimiter=',',
                                                    quotechar='|', quoting=csv.QUOTE_MINIMAL)
                for i in tSignalOut:
                    spamwriter.writerow(i)




dumpSession(["ofdmfft\|source_real\[\d+\]","ofdmfft\|source_imag\[\d+\]"],["ofdmfft|source_valid"],"TransiverFFTOut")

#dumpSession(["ofdmfft\|sink_real\[\d+\]","ofdmfft\|sink_imag\[\d+\]"],["ofdmfft|sink_valid"],"TransiverFFTInput")

#dumpSession(["fftdataadapter\|asi_in_data\[\d+\]"],"FFTDataAdapter:fftdataadapter|aso_out_valid","FFTDataApapterIn")


#dumpSession(["packetsymbolwidthadapter\|asi_in0_data\[\d+\]"],["packetsymbolwidthadapter|asi_in0_ready","packetsymbolwidthadapter|asi_in0_valid"],"QAMOutput")






