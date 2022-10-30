| Instruction         | RTL                                |
| ------------------- | ---------------------------------- |
| ORI $rt, $rs, #imm  | $rt <- $rs \| 000#imm              |
| ORUI $rt, $rs, #imm | $rt <- $rs \| imm000               |
| ADD $rd, $rs, $rt   | $rd <- $rs + $rt                   |
| LW $rt, x($rs)      | $rt <- mem($rs + x)                |
| SW $rt, x($rs)      | mem($rs + x) <- $rt                |
| BEQ $rs, $rt, #imm  | if(rs == rt) pc <- pc + 4 + imm\*4 |
| JMP FLAG            | pc <- flag addr                    |
| FLAG:               | flag for JMP                       |
