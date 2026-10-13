#
# CMPUT 229 Student Submission License
# Version 1.0
#
# Copyright 2024 <student name>
#
# Redistribution is forbidden in all circumstances. Use of this
# software without explicit authorization from the author or CMPUT 229
# Teaching Staff is prohibited.
#
# This software was produced as a solution for an assignment in the course
# CMPUT 229 - Computer Organization and Architecture I at the University of
# Alberta, Canada. This solution is confidential and remains confidential
# after it is submitted for grading.
#
# Copying any part of this solution without including this copyright notice
# is illegal.
#
# If any portion of this software is included in a solution submitted for
# grading at an educational institution, the submitter will be subject to
# the sanctions for plagiarism at that institution.
#
# If this software is found in any public website or public repository, the
# person finding it is kindly requested to immediately report, including
# the URL or other repository locating information, to the following email
# address:
#
#          cmput229@ualberta.ca
#
#------------------------------------------------------------------------------
# CCID:
# Lecture Section:
# Instructor:
# Lab Section:
# Teaching Assistant:
#-----------------------------------------------------------------------------

# This MUST be the first line
.include "common-2.s"

.data
    # Your variables here

.text

# ------------------------------------------------------------------------------
# fixBranch:
#   Fixes branch instructions in the modified program such that they
#   branch to the same target as they did in the original program. Writes the
#   binary representation of the new program with fixed branch instructions to a
#   separate array.
#
# Arguments:
#   a0: Pointer to the instructions array of the original program.
#   a1: Pointer to the instructions array of the modified program.
#   a2: Pointer to an empty array that is the same size as the instructions array
#       of the modified program. This function must write the instructions of the
#       fixed program to this array and terminate it with the sentinel value
#       0xFFFFFFFF.
#
# Register Usage:
#   --- insert your register usage here ---
#
# ------------------------------------------------------------------------------
fixBranch:
    li    t0, -1
    sw    t0, 0(a2)
    ret

# -----------------------------------------------------------------------------
# findInsertions:
#   Finds all the insertion points and how many instructions were inserted
#   after each insertion point
#
# Arguments:
#   a0: Pointer to the instruction array of the original program.
#   a1: Pointer to the instruction array of the modified program.
#
# Returns:
#   a0: Pointer to the insertion points array
#   a1: Pointer to the insertions array
#
# Register usage:
#   --- insert your register usage here ---
#
# -----------------------------------------------------------------------------
findInsertions:
    ret

#----------------------------------------------------------------------------
# findBranches:
#   Finds all branches and their respective targets in the original program
#
# Arguments:
#   a0: Pointer to the instruction array of the original program.
#
# Returns:
#   a0: Pointer to the branches array.
#   a1: Pointer to the targets array.
#
# Register usage:
#   --- insert your register usage here ---
#
#----------------------------------------------------------------------------
findBranches:
    ret
