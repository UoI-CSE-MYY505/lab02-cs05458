
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
    #-----------------------------
    # Write your code here!
    # Do not remove the prog label or write code above it!
    #-----------------------------
    beq a1, zero, notfound #if size is 0, don't even try
    addi a1, a1, -1 #decrement once to get the offset of the end
    slli a1, a1, 2 #multiply size by 4 to get the size in bytes 
    add a1, a0, a1 #set a1 to the end of the array (for reverse iteration)
loop:
    
    lw  t1, 0(a1) #load current value
    beq a2, t1, found #if you find the value, break
    beq a1, a0, notfound #if iterator reached the start of the array, quit
    addi a1, a1, -4 #decrement iterator
    j loop #loop
notfound:
    add a1, zero, zero #set final ptr to 0
found:
    add s0, a1, zero #copy the address to s0
done:
    addi a7, zero, 10 
    ecall
