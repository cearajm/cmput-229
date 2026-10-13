.data
ARRAY:
	.word 45
	.word -210
	.word 93
	.word 93219
	.word -132913
	.word 0
	.word 5
.text
# start of our program
la a0, ARRAY # get our array address into our argument register
addi a1, zero, 7 # store length of our array in a1
la a2, smallest
jal ra, findBest
jal zero, fin # Since we haven't learned ecalls yet, let the simulator end for us by dropping off end of program.

largest:
	# comparator function that returns 1 if a0 > a1 else 0
	slt a0, a1, a0
	add a2, zero, zero
	jalr zero, 0(ra)
	
smallest:
	# comparator fn that returns 1 if a1 < a0 else 0
	slt a0, a0, a1
	jalr zero, 0(ra)
# find largest of an array of ints
findBest:
	# a0 is an array of integers
	# a1 is the length of that array
	# a2 is the address of a comparator function
	#    a2 stores the address of a subroutine
	#    which expects in a0 and a1 two values
	#    to compare and returns 1 in a0
	#    if the a0 argument > a1
	#    0 otherwise
	# Since this is a leaf function... if we can
	# we should only use t registers to avoid
	# having to save anything
	# s0 the largest value I've seen in my array
	#    so far
	# s1 will store the address of my current elem
	# s2 will store the current index
	# s3 will store length
	# s4 will store the address of the comparator fn
	# s0-s3 are callee save registers.. we promise
	# whoever called us that they will have their
	# original values when we return to them...
	# so we must save them!
	# of course, we must also save our ra so we
	# know who to go back to!
	# we need enough space to save 4 s-registers
	# and our ra register, so we need 5 words
	# so 20 bytes
	sw ra -4(sp)
	sw s0 -8(sp)
	sw s1 -12(sp)
	sw s2 -16(sp)
	sw s3 -20(sp)
	sw s4, -24(sp)
	addi sp, sp -24
	mv s4, a2 # s4 <- comparator fn address
	mv s1, a0 # a0 <- &ARR[0]
	lw s0, 0(s1) # init s0 to be largest value seen so far
	add s2, zero, zero # s2 initialized to current index (0)
	mv s3, a1 # initialize s3 with length of array so we don't lose it
	# array should never be of length zero, so we don't need
	# to check our loop condition first!
loop:	lw a1, 0(s1) # store current elem in a1
	mv a0, s0 # largest so far stored in a0 for comparison
	jalr ra, 0(s4) # call our comparator fn
	# Now a0 will be 1 if the value we gave in a0 > a1
	# or 0 otherwise
	bnez a0, loopUpdate # if cmp(a0, a1) > 0 then maxSoFar > current
	# if we don't branch then this currentElem >= maxSoFar so
	# let's update our maxSoFar
#	mv s0, a1 # WRONG! a1 not guaranteed to still hold currentElem. It is caller save!
	lw s0, 0(s1) # maxSoFar <- currentElem... loading from memory a second time... subideal
loopUpdate:
	addi s1, s1, 4 # address of current element incremented by 4
	addi s2, s2, 1 # curIndex <- curIndex + 4
	blt s2, s3, loop # curIndex < loop keep looping...
	mv a0, s0 # write our largest seen so far as our return value
	addi sp, sp, 24
	lw ra -4(sp)
	lw s0 -8(sp)
	lw s1 -12(sp)
	lw s2 -16(sp)
	lw s3 -20(sp)
	lw s4 -24(sp)
	ret
	
	
fin:
