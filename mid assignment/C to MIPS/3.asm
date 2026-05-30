// Let i=$s0, base addresses: A=$s1, B=$s2, C=$s3
for(i = 1; i <= 5; i++)
{
    A[i] = B[i] + C[i];
}

# mapping: i=$s0, base_A=$s1, base_B=$s2, base_C=$s3

li $s0, 1            # i = 1

LOOP2:
    # Condition check: i <= 5 is equivalent to !(i > 5) or i < 6
    slti $t0, $s0, 6     # if i < 6, $t0 = 1
    beq  $t0, $zero, END2 # if $t0 == 0, exit loop

    # Calculate byte offset: offset = i * 4
    sll  $t1, $s0, 2     # $t1 = i * 4

    # Load B[i]
    add  $t2, $s2, $t1   # $t2 = base_B + offset
    lw   $t3, 0($t2)     # $t3 = B[i]

    # Load C[i]
    add  $t4, $s3, $t1   # $t4 = base_C + offset
    lw   $t5, 0($t4)     # $t5 = C[i]

    # A[i] = B[i] + C[i]
    add  $t6, $t3, $t5   # $t6 = B[i] + C[i]
    add  $t7, $s1, $t1   # $t7 = base_A + offset
    sw   $t6, 0($t7)     # A[i] = $t6

    addi $s0, $s0, 1     # i++
    j LOOP2

END2:
