import sys

def CalulateTable_CRC8(generator, crctable):
    for divident in range(256):
        currByte = divident
        for bit in range(8):
            if (currByte & 0x80) != 0:
                currByte <<= 1
                currByte &= 0xff
                currByte ^= generator
            else:
                currByte <<= 1;
        crctable.append(currByte)



def Compute_CRC8(bytes, crctable):
    crc = 0
    for b in bytes:
        data = b ^ crc
        #print hex(b) + "^" + hex(crc) + "=" + hex(data)
        crc = crctable[data]
    return crc;

if __name__ == "__main__":
    crctable = []
    CalulateTable_CRC8(0x07, crctable)

    if len(sys.argv) == 2:
        send_message = map(lambda x: int(x, 0), sys.argv[1].split(","))

        crc = Compute_CRC8(send_message, crctable)

        send_message += [crc]
        print "uint8_t expected_send_data[] = {" + ','.join(map(hex,send_message)) + '};'

    elif len(sys.argv) == 3:
        send_message = map(lambda x: int(x, 0), sys.argv[1].split(","))
        if len(send_message)!=3:
            print "send message is always 3 byte long"
            sys.exit()
        receive_message = map(lambda x: int(x, 0), sys.argv[2].split(","))
        message = send_message + receive_message
        crc = Compute_CRC8(message, crctable)

        send_message += [0]*(len(receive_message)+1)
        receive_message = [0]*3+receive_message+[crc]
        print "uint8_t expected_send_data[] = {" + ','.join(map(hex,send_message)) + '};'
        print "uint8_t receive_data[] = {" + ','.join(map(hex,receive_message)) + '};'

    elif len(sys.argv) == 1+2+1:
        device_addr = int(sys.argv[1],0)<<1
        first_register = int(sys.argv[2],0)
        receive_message = map(lambda x: int(x, 0), sys.argv[3].split(","))
        lenght = len (receive_message)

        send_message = [device_addr, first_register, lenght]

        message = send_message + receive_message
        crc = Compute_CRC8(message, crctable)

        send_message += [0]*(lenght+1)
        receive_message = [0]*3+receive_message+[crc]

        print "uint8_t expected_send_data[] = {" + ','.join(map(hex,send_message)) + '};'
        print "uint8_t receive_data[] = {" + ','.join(map(hex,receive_message)) + '};'

    else:
        print "wrong usage: correct <prg> send_data receive_data"
        print "or: <prg> send_data"
        print "or: <prg> device_addr first_register receive_data"
