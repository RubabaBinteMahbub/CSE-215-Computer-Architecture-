int A, B, C, D, E, F; // Let A=$s0, B=$s1, C=$s2, D=$s3, E=$s4, F=$s5
A = B + C;
D = A - E;
F = (D + B) - C;

# mapping: A=$s0, B=$s1, C=$s2, D=$s3, E=$s4, F=$s5

add $s0, $s1, $s2    # A = B + C
sub $s3, $s0, $s4    # D = A - E

add $t0, $s3, $s1    # $t0 = D + B
sub $s5, $t0, $s2    # F = $t0 - C
