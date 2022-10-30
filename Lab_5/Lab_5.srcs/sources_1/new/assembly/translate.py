

opcode = {
    'ORI': '010000', 'ORUI': '010001', 'ADD': '000001', 'SUB': '000001',
    'OR': '000001', 'AND': '000001', 'XOR': '000001', 'NEG': '000001',
    'NOT': '000001', 'LW': '011000', 'SW': '011100', 'BEQ': '100100', 'JMP': '110000'
}

instructionFormat = {
    'r': ['ADD', 'SUB', 'OR', 'AND', 'XOR', 'NEG', 'NOT'],
    'i': ['ORI', 'ORUI', 'LW', 'SW', 'BEQ'],
    'j': ['JMP'],
}

f = open('Lab_5/Lab_5.srcs/sources_1/new/assembly.s', 'r')
assembly = [s for s in f.read().split('\n') if len(s) > 0]

def translate():
  if
