def ConstellationMapping(duo):
    if duo=='00':
        return '0101'
    elif duo=='01':
        return '1101'
    elif duo=='11':
        return '1111'
    elif duo=='10':
        return '0111'

def ConstellationDeMapping(real,imag):
    bitstream=[]
    for r,i in zip(real,imag):
        if(r>0 and i>0):
            bitstream.append('00')
        elif (r<0 and i>0):
            bitstream.append('01')
        elif (r<0 and i<0):
            bitstream.append('11')
        elif (r>0 and i<0):
            bitstream.append('10')
    return ''.join(bitstream)

