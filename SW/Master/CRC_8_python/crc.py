

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

def table_to_c_array_init(ctype, variable_name, crctable):
    result = "{} {}[256] =".format(ctype, variable_name) + " {\n"
    for row in range(16):
        result += "\t0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, ".format(*crctable[row*16:row*16+8])
        result += "0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}, 0x{:02x}\n".format(*crctable[row*16+8:row*16+16])
    result += "};\n"
    print result

if __name__ == "__main__":
    crctable = []
    CalulateTable_CRC8(0x07, crctable)
    print len(crctable)
    message = [0x01,0x3B,0x01]
    expected_crc = 0x02
    crc = Compute_CRC8(message, crctable)
    print "test 1: expected crc: " + hex(expected_crc) + " got: " + hex(crc)

    message = [0x02,0x03,0x02,0x19,0x9A]
    expected_crc = 0x0D
    crc = Compute_CRC8(message, crctable)
    print "test 1: expected crc: " + hex(expected_crc) + " got: " + hex(crc)

    table_to_c_array_init("uint8_t", "crc8_lookup_table", crctable)

    print len(crctable)
    print crctable
