Let,
1000: Loop:
1004: beq  $t0, $t1, Exit ×
1008: addi $t0, $t0, 1~
1012: j    Loop
1016: Exit:~

beq $t0, $t1, Exit
lebel থাকলে তার offset বের করা
# offset = (Target - (PC + 4)) / 4
offset = (1016 - 1008) / 4
       = 8 / 4
       = 2
opcode (beq) = 000100
rs = $t0 = 8 = 01000
rt = $t1 = 9 = 01001
immediate = 2 = 0000000000000010
000100 01000 01001 0000000000000010

addi $t0, $t0, 1
opcode (addi) = 001000
rs = $t0 = 01000
rt = $t0 = 01000
immediate = 1 = 0000000000000001
001000 01000 01000 0000000000000001

j Loop
J-type format
opcode(6) | target(26)
opcode (j) = 000010
Target address = 1000
Target field : 1000 / 4 = 250
000010 00000000000000000011111010
