if (A > B)
{
    if (C > D)
        Max = C;
    else
        Max = D;
}
else
{
    Max = B;
}

# mapping: A=$s0, B=$s1, C=$s2, D=$s3, Max=$s4

    # --- Outer if: if (A > B) ---
slt $t0, $s1, $s0       # if B < A (meaning A > B), $t0 = 1; else $t0 = 0
beq $t0, $zero, ELSE_1  # if $t0 == 0 (A <= B), jump to outer else (ELSE_A)

    # --- Inner if: if (C > D) ---
    slt $t1, $s3, $s2   # if D < C (meaning C > D), $t1 = 1; else $t1 = 0
    beq $t1, $zero, ELSE_2 # if $t1 == 0 (C <= D), jump to inner else (ELSE_C)
    
    # Inner IF Body: Max = C
    move $s4, $s2       # Max = C
    j EXIT              # Jump to end of structures

    ELSE_2:
    # Inner ELSE Body: Max = D
    move $s4, $s3       # Max = D
    j EXIT              # Jump to end of structures

ELSE_1:
# Outer ELSE Body: Max = B
move $s4, $s1           # Max = B

EXIT:
# End of conditional block
