	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 3	sdk_version 13, 3
	.globl	_calculateSubsequenceSum        ; -- Begin function calculateSubsequenceSum
	.p2align	2
_calculateSubsequenceSum:               ; @calculateSubsequenceSum
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	w1, [x29, #-20]
	stur	w2, [x29, #-24]
	stur	w3, [x29, #-28]
	stur	w4, [x29, #-32]
	str	x5, [sp, #40]
	str	w6, [sp, #36]
	ldur	w8, [x29, #-28]
	subs	w8, w8, #0
	cset	w8, lt
	tbnz	w8, #0, LBB0_4
	b	LBB0_1
LBB0_1:
	ldur	w8, [x29, #-28]
	ldur	w9, [x29, #-20]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_4
	b	LBB0_2
LBB0_2:
	ldur	w8, [x29, #-32]
	subs	w8, w8, #0
	cset	w8, lt
	tbnz	w8, #0, LBB0_4
	b	LBB0_3
LBB0_3:
	ldur	w8, [x29, #-32]
	ldur	w9, [x29, #-24]
	subs	w8, w8, w9
	cset	w8, lt
	tbnz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
	stur	wzr, [x29, #-4]
	b	LBB0_15
LBB0_5:
	ldr	x8, [sp, #40]
	ldursw	x9, [x29, #-28]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x9, [x29, #-32]
	ldr	w8, [x8, x9, lsl #2]
	adds	w8, w8, #1
	cset	w8, eq
	tbnz	w8, #0, LBB0_7
	b	LBB0_6
LBB0_6:
	ldr	x8, [sp, #40]
	ldursw	x9, [x29, #-28]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x9, [x29, #-32]
	ldr	w8, [x8, x9, lsl #2]
	stur	w8, [x29, #-4]
	b	LBB0_15
LBB0_7:
	str	wzr, [sp, #32]
	ldr	w8, [sp, #36]
	subs	w8, w8, #0
                                        ; kill: def $x8 killed $w8
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	subs	x8, x8, #3
	cset	w8, hi
	tbnz	w8, #0, LBB0_13
; %bb.8:
	ldr	x11, [sp, #24]                  ; 8-byte Folded Reload
	adrp	x10, lJTI0_0@PAGE
	add	x10, x10, lJTI0_0@PAGEOFF
Ltmp0:
	adr	x8, Ltmp0
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB0_9:
	ldur	x8, [x29, #-16]
	ldursw	x9, [x29, #-28]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x9, [x29, #-32]
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-20]
	ldur	w2, [x29, #-24]
	ldur	w8, [x29, #-28]
	subs	w3, w8, #1
	ldur	w4, [x29, #-32]
	ldr	x5, [sp, #40]
	ldr	w6, [sp, #36]
	bl	_calculateSubsequenceSum
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	add	w8, w8, w0
	str	w8, [sp, #32]
	b	LBB0_14
LBB0_10:
	ldur	x8, [x29, #-16]
	ldursw	x9, [x29, #-28]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x9, [x29, #-32]
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #16]                   ; 4-byte Folded Spill
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-20]
	ldur	w2, [x29, #-24]
	ldur	w8, [x29, #-28]
	add	w3, w8, #1
	ldur	w4, [x29, #-32]
	ldr	x5, [sp, #40]
	ldr	w6, [sp, #36]
	bl	_calculateSubsequenceSum
	ldr	w8, [sp, #16]                   ; 4-byte Folded Reload
	add	w8, w8, w0
	str	w8, [sp, #32]
	b	LBB0_14
LBB0_11:
	ldur	x8, [x29, #-16]
	ldursw	x9, [x29, #-28]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x9, [x29, #-32]
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-20]
	ldur	w2, [x29, #-24]
	ldur	w3, [x29, #-28]
	ldur	w8, [x29, #-32]
	subs	w4, w8, #1
	ldr	x5, [sp, #40]
	ldr	w6, [sp, #36]
	bl	_calculateSubsequenceSum
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	add	w8, w8, w0
	str	w8, [sp, #32]
	b	LBB0_14
LBB0_12:
	ldur	x8, [x29, #-16]
	ldursw	x9, [x29, #-28]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x9, [x29, #-32]
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-20]
	ldur	w2, [x29, #-24]
	ldur	w3, [x29, #-28]
	ldur	w8, [x29, #-32]
	add	w4, w8, #1
	ldr	x5, [sp, #40]
	ldr	w6, [sp, #36]
	bl	_calculateSubsequenceSum
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	add	w8, w8, w0
	str	w8, [sp, #32]
	b	LBB0_14
LBB0_13:
	b	LBB0_14
LBB0_14:
	ldr	w8, [sp, #32]
	ldr	x9, [sp, #40]
	ldursw	x10, [x29, #-28]
	ldr	x9, [x9, x10, lsl #3]
	ldursw	x10, [x29, #-32]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #32]
	stur	w8, [x29, #-4]
	b	LBB0_15
LBB0_15:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
	.p2align	2
lJTI0_0:
	.long	LBB0_9-Ltmp0
	.long	LBB0_10-Ltmp0
	.long	LBB0_11-Ltmp0
	.long	LBB0_12-Ltmp0
                                        ; -- End function
	.globl	_matrixMultiply                 ; -- Begin function matrixMultiply
	.p2align	2
_matrixMultiply:                        ; @matrixMultiply
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	str	w3, [sp, #20]
	str	wzr, [sp, #16]
	b	LBB1_1
LBB1_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_3 Depth 2
                                        ;       Child Loop BB1_5 Depth 3
	ldr	w8, [sp, #16]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB1_12
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	str	wzr, [sp, #12]
	b	LBB1_3
LBB1_3:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_5 Depth 3
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB1_10
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #16]
	ldr	x9, [x8, x9, lsl #3]
	ldrsw	x10, [sp, #12]
	mov	w8, #0
	str	w8, [x9, x10, lsl #2]
	str	wzr, [sp, #8]
	b	LBB1_5
LBB1_5:                                 ;   Parent Loop BB1_1 Depth=1
                                        ;     Parent Loop BB1_3 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB1_8
	b	LBB1_6
LBB1_6:                                 ;   in Loop: Header=BB1_5 Depth=3
	ldr	x8, [sp, #40]
	ldrsw	x9, [sp, #16]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #8]
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #32]
	ldrsw	x10, [sp, #8]
	ldr	x9, [x9, x10, lsl #3]
	ldrsw	x10, [sp, #12]
	ldr	w9, [x9, x10, lsl #2]
	mul	w10, w8, w9
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #16]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #12]
	add	x9, x8, x9, lsl #2
	ldr	w8, [x9]
	add	w8, w8, w10
	str	w8, [x9]
	b	LBB1_7
LBB1_7:                                 ;   in Loop: Header=BB1_5 Depth=3
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB1_5
LBB1_8:                                 ;   in Loop: Header=BB1_3 Depth=2
	b	LBB1_9
LBB1_9:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_3
LBB1_10:                                ;   in Loop: Header=BB1_1 Depth=1
	b	LBB1_11
LBB1_11:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB1_1
LBB1_12:
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_rotateMatrix                   ; -- Begin function rotateMatrix
	.p2align	2
_rotateMatrix:                          ; @rotateMatrix
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	w1, [sp, #20]
	str	wzr, [sp, #16]
	b	LBB2_1
LBB2_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_3 Depth 2
	ldr	w8, [sp, #16]
	ldr	w9, [sp, #20]
	mov	w10, #2
	sdiv	w9, w9, w10
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB2_8
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #16]
	str	w8, [sp, #12]
	b	LBB2_3
LBB2_3:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #20]
	ldr	w10, [sp, #16]
	subs	w9, w9, w10
	subs	w9, w9, #1
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB2_6
	b	LBB2_4
LBB2_4:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #16]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #12]
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #8]
	ldr	x8, [sp, #24]
	ldr	w9, [sp, #20]
	ldr	w10, [sp, #12]
	subs	w9, w9, w10
	subs	w9, w9, #1
	ldr	x8, [x8, w9, sxtw #3]
	ldrsw	x9, [sp, #16]
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #16]
	ldr	x9, [x9, x10, lsl #3]
	ldrsw	x10, [sp, #12]
	str	w8, [x9, x10, lsl #2]
	ldr	x8, [sp, #24]
	ldr	w9, [sp, #20]
	ldr	w10, [sp, #16]
	subs	w9, w9, w10
	subs	w9, w9, #1
	ldr	x8, [x8, w9, sxtw #3]
	ldr	w9, [sp, #20]
	ldr	w10, [sp, #12]
	subs	w9, w9, w10
	subs	w9, w9, #1
	ldr	w8, [x8, w9, sxtw #2]
	ldr	x9, [sp, #24]
	ldr	w10, [sp, #20]
	ldr	w11, [sp, #12]
	subs	w10, w10, w11
	subs	w10, w10, #1
	ldr	x9, [x9, w10, sxtw #3]
	ldrsw	x10, [sp, #16]
	str	w8, [x9, x10, lsl #2]
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #12]
	ldr	x8, [x8, x9, lsl #3]
	ldr	w9, [sp, #20]
	ldr	w10, [sp, #16]
	subs	w9, w9, w10
	subs	w9, w9, #1
	ldr	w8, [x8, w9, sxtw #2]
	ldr	x9, [sp, #24]
	ldr	w10, [sp, #20]
	ldr	w11, [sp, #16]
	subs	w10, w10, w11
	subs	w10, w10, #1
	ldr	x9, [x9, w10, sxtw #3]
	ldr	w10, [sp, #20]
	ldr	w11, [sp, #12]
	subs	w10, w10, w11
	subs	w10, w10, #1
	str	w8, [x9, w10, sxtw #2]
	ldr	w8, [sp, #8]
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #12]
	ldr	x9, [x9, x10, lsl #3]
	ldr	w10, [sp, #20]
	ldr	w11, [sp, #16]
	subs	w10, w10, w11
	subs	w10, w10, #1
	str	w8, [x9, w10, sxtw #2]
	b	LBB2_5
LBB2_5:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB2_3
LBB2_6:                                 ;   in Loop: Header=BB2_1 Depth=1
	b	LBB2_7
LBB2_7:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB2_1
LBB2_8:
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_sortRowsBySum                  ; -- Begin function sortRowsBySum
	.p2align	2
_sortRowsBySum:                         ; @sortRowsBySum
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	stur	w2, [x29, #-16]
	ldursw	x8, [x29, #-12]
	lsl	x0, x8, #2
	bl	_malloc
	stur	x0, [x29, #-24]
	stur	wzr, [x29, #-28]
	b	LBB3_1
LBB3_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_3 Depth 2
	ldur	w8, [x29, #-28]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB3_8
	b	LBB3_2
LBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldur	x9, [x29, #-24]
	ldursw	x10, [x29, #-28]
	mov	w8, #0
	str	w8, [x9, x10, lsl #2]
	str	wzr, [sp, #32]
	b	LBB3_3
LBB3_3:                                 ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #32]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB3_6
	b	LBB3_4
LBB3_4:                                 ;   in Loop: Header=BB3_3 Depth=2
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-28]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #32]
	ldr	w10, [x8, x9, lsl #2]
	ldur	x8, [x29, #-24]
	ldursw	x9, [x29, #-28]
	add	x9, x8, x9, lsl #2
	ldr	w8, [x9]
	add	w8, w8, w10
	str	w8, [x9]
	b	LBB3_5
LBB3_5:                                 ;   in Loop: Header=BB3_3 Depth=2
	ldr	w8, [sp, #32]
	add	w8, w8, #1
	str	w8, [sp, #32]
	b	LBB3_3
LBB3_6:                                 ;   in Loop: Header=BB3_1 Depth=1
	b	LBB3_7
LBB3_7:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldur	w8, [x29, #-28]
	add	w8, w8, #1
	stur	w8, [x29, #-28]
	b	LBB3_1
LBB3_8:
	str	wzr, [sp, #28]
	b	LBB3_9
LBB3_9:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_11 Depth 2
                                        ;       Child Loop BB3_14 Depth 3
	ldr	w8, [sp, #28]
	ldur	w9, [x29, #-12]
	subs	w9, w9, #1
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB3_22
	b	LBB3_10
LBB3_10:                                ;   in Loop: Header=BB3_9 Depth=1
	str	wzr, [sp, #24]
	b	LBB3_11
LBB3_11:                                ;   Parent Loop BB3_9 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_14 Depth 3
	ldr	w8, [sp, #24]
	ldur	w9, [x29, #-12]
	ldr	w10, [sp, #28]
	subs	w9, w9, w10
	subs	w9, w9, #1
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB3_20
	b	LBB3_12
LBB3_12:                                ;   in Loop: Header=BB3_11 Depth=2
	ldur	x8, [x29, #-24]
	ldrsw	x9, [sp, #24]
	ldr	w8, [x8, x9, lsl #2]
	ldur	x9, [x29, #-24]
	ldr	w10, [sp, #24]
	add	w10, w10, #1
	ldr	w9, [x9, w10, sxtw #2]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB3_18
	b	LBB3_13
LBB3_13:                                ;   in Loop: Header=BB3_11 Depth=2
	str	wzr, [sp, #20]
	b	LBB3_14
LBB3_14:                                ;   Parent Loop BB3_9 Depth=1
                                        ;     Parent Loop BB3_11 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #20]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB3_17
	b	LBB3_15
LBB3_15:                                ;   in Loop: Header=BB3_14 Depth=3
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #24]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #20]
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #16]
	ldur	x8, [x29, #-8]
	ldr	w9, [sp, #24]
	add	w9, w9, #1
	ldr	x8, [x8, w9, sxtw #3]
	ldrsw	x9, [sp, #20]
	ldr	w8, [x8, x9, lsl #2]
	ldur	x9, [x29, #-8]
	ldrsw	x10, [sp, #24]
	ldr	x9, [x9, x10, lsl #3]
	ldrsw	x10, [sp, #20]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #16]
	ldur	x9, [x29, #-8]
	ldr	w10, [sp, #24]
	add	w10, w10, #1
	ldr	x9, [x9, w10, sxtw #3]
	ldrsw	x10, [sp, #20]
	str	w8, [x9, x10, lsl #2]
	b	LBB3_16
LBB3_16:                                ;   in Loop: Header=BB3_14 Depth=3
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB3_14
LBB3_17:                                ;   in Loop: Header=BB3_11 Depth=2
	ldur	x8, [x29, #-24]
	ldrsw	x9, [sp, #24]
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #12]
	ldur	x8, [x29, #-24]
	ldr	w9, [sp, #24]
	add	w9, w9, #1
	ldr	w8, [x8, w9, sxtw #2]
	ldur	x9, [x29, #-24]
	ldrsw	x10, [sp, #24]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #12]
	ldur	x9, [x29, #-24]
	ldr	w10, [sp, #24]
	add	w10, w10, #1
	str	w8, [x9, w10, sxtw #2]
	b	LBB3_18
LBB3_18:                                ;   in Loop: Header=BB3_11 Depth=2
	b	LBB3_19
LBB3_19:                                ;   in Loop: Header=BB3_11 Depth=2
	ldr	w8, [sp, #24]
	add	w8, w8, #1
	str	w8, [sp, #24]
	b	LBB3_11
LBB3_20:                                ;   in Loop: Header=BB3_9 Depth=1
	b	LBB3_21
LBB3_21:                                ;   in Loop: Header=BB3_9 Depth=1
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB3_9
LBB3_22:
	ldur	x0, [x29, #-24]
	bl	_free
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_toggleBits                     ; -- Begin function toggleBits
	.p2align	2
_toggleBits:                            ; @toggleBits
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	ldr	w9, [sp, #4]
	mov	w8, #1
	lsl	w10, w8, w9
	ldr	x9, [sp, #8]
	ldr	w8, [x9]
	eor	w8, w8, w10
	str	w8, [x9]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_generateRandomMatrix           ; -- Begin function generateRandomMatrix
	.p2align	2
_generateRandomMatrix:                  ; @generateRandomMatrix
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	str	w2, [sp, #16]
	str	w3, [sp, #12]
	str	wzr, [sp, #8]
	b	LBB5_1
LBB5_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_3 Depth 2
	ldr	w8, [sp, #8]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB5_8
	b	LBB5_2
LBB5_2:                                 ;   in Loop: Header=BB5_1 Depth=1
	str	wzr, [sp, #4]
	b	LBB5_3
LBB5_3:                                 ;   Parent Loop BB5_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #4]
	ldr	w9, [sp, #16]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB5_6
	b	LBB5_4
LBB5_4:                                 ;   in Loop: Header=BB5_3 Depth=2
	bl	_rand
	ldr	w9, [sp, #12]
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	ldur	x9, [x29, #-8]
	ldrsw	x10, [sp, #8]
	ldr	x9, [x9, x10, lsl #3]
	ldrsw	x10, [sp, #4]
	str	w8, [x9, x10, lsl #2]
	b	LBB5_5
LBB5_5:                                 ;   in Loop: Header=BB5_3 Depth=2
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB5_3
LBB5_6:                                 ;   in Loop: Header=BB5_1 Depth=1
	b	LBB5_7
LBB5_7:                                 ;   in Loop: Header=BB5_1 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB5_1
LBB5_8:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_printMatrix                    ; -- Begin function printMatrix
	.p2align	2
_printMatrix:                           ; @printMatrix
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	str	w2, [sp, #16]
	str	wzr, [sp, #12]
	b	LBB6_1
LBB6_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_3 Depth 2
	ldr	w8, [sp, #12]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB6_8
	b	LBB6_2
LBB6_2:                                 ;   in Loop: Header=BB6_1 Depth=1
	str	wzr, [sp, #8]
	b	LBB6_3
LBB6_3:                                 ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #16]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB6_6
	b	LBB6_4
LBB6_4:                                 ;   in Loop: Header=BB6_3 Depth=2
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #12]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #8]
	ldr	w9, [x8, x9, lsl #2]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	b	LBB6_5
LBB6_5:                                 ;   in Loop: Header=BB6_3 Depth=2
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB6_3
LBB6_6:                                 ;   in Loop: Header=BB6_1 Depth=1
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	b	LBB6_7
LBB6_7:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB6_1
LBB6_8:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_complexFunction                ; -- Begin function complexFunction
	.p2align	2
_complexFunction:                       ; @complexFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	ldursw	x8, [x29, #-4]
	lsl	x0, x8, #3
	bl	_malloc
	stur	x0, [x29, #-16]
	stur	wzr, [x29, #-20]
	b	LBB7_1
LBB7_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB7_4
	b	LBB7_2
LBB7_2:                                 ;   in Loop: Header=BB7_1 Depth=1
	ldursw	x8, [x29, #-8]
	lsl	x0, x8, #2
	bl	_malloc
	ldur	x8, [x29, #-16]
	ldursw	x9, [x29, #-20]
	str	x0, [x8, x9, lsl #3]
	b	LBB7_3
LBB7_3:                                 ;   in Loop: Header=BB7_1 Depth=1
	ldur	w8, [x29, #-20]
	add	w8, w8, #1
	stur	w8, [x29, #-20]
	b	LBB7_1
LBB7_4:
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-4]
	ldur	w2, [x29, #-8]
	mov	w3, #100
	bl	_generateRandomMatrix
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-4]
	ldur	w2, [x29, #-8]
	bl	_printMatrix
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-4]
	ldur	w2, [x29, #-8]
	bl	_sortRowsBySum
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-4]
	ldur	w2, [x29, #-8]
	bl	_printMatrix
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-8]
	bl	_rotateMatrix
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-8]
	ldur	w2, [x29, #-8]
	bl	_printMatrix
	ldursw	x8, [x29, #-4]
	lsl	x0, x8, #3
	bl	_malloc
	stur	x0, [x29, #-32]
	stur	wzr, [x29, #-36]
	b	LBB7_5
LBB7_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_7 Depth 2
	ldur	w8, [x29, #-36]
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB7_12
	b	LBB7_6
LBB7_6:                                 ;   in Loop: Header=BB7_5 Depth=1
	ldursw	x8, [x29, #-8]
	lsl	x0, x8, #2
	bl	_malloc
	ldur	x8, [x29, #-32]
	ldursw	x9, [x29, #-36]
	str	x0, [x8, x9, lsl #3]
	str	wzr, [sp, #40]
	b	LBB7_7
LBB7_7:                                 ;   Parent Loop BB7_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #40]
	ldur	w9, [x29, #-8]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB7_10
	b	LBB7_8
LBB7_8:                                 ;   in Loop: Header=BB7_7 Depth=2
	ldur	x8, [x29, #-32]
	ldursw	x9, [x29, #-36]
	ldr	x9, [x8, x9, lsl #3]
	ldrsw	x10, [sp, #40]
	mov	w8, #-1
	str	w8, [x9, x10, lsl #2]
	b	LBB7_9
LBB7_9:                                 ;   in Loop: Header=BB7_7 Depth=2
	ldr	w8, [sp, #40]
	add	w8, w8, #1
	str	w8, [sp, #40]
	b	LBB7_7
LBB7_10:                                ;   in Loop: Header=BB7_5 Depth=1
	b	LBB7_11
LBB7_11:                                ;   in Loop: Header=BB7_5 Depth=1
	ldur	w8, [x29, #-36]
	add	w8, w8, #1
	stur	w8, [x29, #-36]
	b	LBB7_5
LBB7_12:
	mov	w8, #-2147483648
	str	w8, [sp, #36]
	str	wzr, [sp, #32]
	b	LBB7_13
LBB7_13:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_15 Depth 2
	ldr	w8, [sp, #32]
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB7_22
	b	LBB7_14
LBB7_14:                                ;   in Loop: Header=BB7_13 Depth=1
	str	wzr, [sp, #28]
	b	LBB7_15
LBB7_15:                                ;   Parent Loop BB7_13 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #28]
	ldur	w9, [x29, #-8]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB7_20
	b	LBB7_16
LBB7_16:                                ;   in Loop: Header=BB7_15 Depth=2
	ldur	x0, [x29, #-16]
	ldur	w1, [x29, #-4]
	ldur	w2, [x29, #-8]
	ldr	w3, [sp, #32]
	ldr	w4, [sp, #28]
	ldur	x5, [x29, #-32]
	mov	w6, #0
	bl	_calculateSubsequenceSum
	str	w0, [sp, #24]
	ldr	w8, [sp, #24]
	ldr	w9, [sp, #36]
	subs	w8, w8, w9
	cset	w8, le
	tbnz	w8, #0, LBB7_18
	b	LBB7_17
LBB7_17:                                ;   in Loop: Header=BB7_15 Depth=2
	ldr	w8, [sp, #24]
	str	w8, [sp, #36]
	b	LBB7_18
LBB7_18:                                ;   in Loop: Header=BB7_15 Depth=2
	b	LBB7_19
LBB7_19:                                ;   in Loop: Header=BB7_15 Depth=2
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB7_15
LBB7_20:                                ;   in Loop: Header=BB7_13 Depth=1
	b	LBB7_21
LBB7_21:                                ;   in Loop: Header=BB7_13 Depth=1
	ldr	w8, [sp, #32]
	add	w8, w8, #1
	str	w8, [sp, #32]
	b	LBB7_13
LBB7_22:
	ldr	w9, [sp, #36]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	str	wzr, [sp, #20]
	b	LBB7_23
LBB7_23:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB7_26
	b	LBB7_24
LBB7_24:                                ;   in Loop: Header=BB7_23 Depth=1
	ldur	x8, [x29, #-16]
	ldrsw	x9, [sp, #20]
	ldr	x0, [x8, x9, lsl #3]
	bl	_free
	ldur	x8, [x29, #-32]
	ldrsw	x9, [sp, #20]
	ldr	x0, [x8, x9, lsl #3]
	bl	_free
	b	LBB7_25
LBB7_25:                                ;   in Loop: Header=BB7_23 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB7_23
LBB7_26:
	ldur	x0, [x29, #-16]
	bl	_free
	ldur	x0, [x29, #-32]
	bl	_free
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_schmunguss                     ; -- Begin function schmunguss
	.p2align	2
_schmunguss:                            ; @schmunguss
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w1, #5
	mov	x0, x1
	bl	_complexFunction
	mov	w0, #0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_insert_10_elements             ; -- Begin function insert_10_elements
	.p2align	2
_insert_10_elements:                    ; @insert_10_elements
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-8]
	stur	x8, [x29, #-16]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #24]
	adrp	x0, _duck@PAGE
	add	x0, x0, _duck@PAGEOFF
	bl	_pthread_mutex_lock
	b	LBB9_1
LBB9_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #24]
	ldr	x8, [x8, #8]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB9_3
	b	LBB9_2
LBB9_2:                                 ;   in Loop: Header=BB9_1 Depth=1
	ldr	x8, [sp, #24]
	ldr	x8, [x8, #8]
	str	x8, [sp, #24]
	mov	w0, #1000
	bl	_usleep
	b	LBB9_1
LBB9_3:
	str	wzr, [sp, #20]
	b	LBB9_4
LBB9_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	subs	w8, w8, #10
	cset	w8, ge
	tbnz	w8, #0, LBB9_7
	b	LBB9_5
LBB9_5:                                 ;   in Loop: Header=BB9_4 Depth=1
	mov	x0, #16
	bl	_malloc
	str	x0, [sp, #8]
	adrp	x10, _global_i@PAGE
	ldr	w8, [x10, _global_i@PAGEOFF]
	add	w9, w8, #1
	str	w9, [x10, _global_i@PAGEOFF]
	ldr	x9, [sp, #8]
	str	w8, [x9]
	ldr	x8, [sp, #8]
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #24]
	str	x8, [x9, #8]
	ldr	x8, [sp, #24]
	ldr	x8, [x8, #8]
	str	x8, [sp, #24]
	mov	w0, #1000
	bl	_usleep
	b	LBB9_6
LBB9_6:                                 ;   in Loop: Header=BB9_4 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB9_4
LBB9_7:
	adrp	x0, _duck@PAGE
	add	x0, x0, _duck@PAGEOFF
	bl	_pthread_mutex_unlock
	mov	x0, #0
	bl	_pthread_exit
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	bl	_schmunguss
	mov	x0, #16
	bl	_malloc
	stur	x0, [x29, #-16]
	ldur	x8, [x29, #-16]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB10_2
	b	LBB10_1
LBB10_1:
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	mov	w8, #-1
	stur	w8, [x29, #-4]
	b	LBB10_9
LBB10_2:
	adrp	x10, _global_i@PAGE
	ldr	w8, [x10, _global_i@PAGEOFF]
	add	w9, w8, #1
	str	w9, [x10, _global_i@PAGEOFF]
	ldur	x9, [x29, #-16]
	str	w8, [x9]
	ldur	x8, [x29, #-16]
	mov	x1, #0
	str	x1, [sp, #16]                   ; 8-byte Folded Spill
	str	xzr, [x8, #8]
	ldur	x3, [x29, #-16]
	sub	x0, x29, #40
	adrp	x2, _insert_10_elements@PAGE
	add	x2, x2, _insert_10_elements@PAGEOFF
	str	x2, [sp, #24]                   ; 8-byte Folded Spill
	bl	_pthread_create
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #24]                   ; 8-byte Folded Reload
	ldur	x3, [x29, #-16]
	add	x0, sp, #48
	bl	_pthread_create
	ldur	x0, [x29, #-40]
	sub	x1, x29, #24
	bl	_pthread_join
	ldr	x0, [sp, #48]
	sub	x1, x29, #32
	bl	_pthread_join
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-16]
	str	x8, [sp, #40]
	b	LBB10_3
LBB10_3:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #40]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB10_5
	b	LBB10_4
LBB10_4:                                ;   in Loop: Header=BB10_3 Depth=1
	ldr	x8, [sp, #40]
	ldr	w9, [x8]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #40]
	ldr	x8, [x8, #8]
	str	x8, [sp, #40]
	b	LBB10_3
LBB10_5:
	ldur	x8, [x29, #-16]
	str	x8, [sp, #40]
	b	LBB10_6
LBB10_6:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #40]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB10_8
	b	LBB10_7
LBB10_7:                                ;   in Loop: Header=BB10_6 Depth=1
	ldr	x8, [sp, #40]
	ldr	x8, [x8, #8]
	str	x8, [sp, #32]
	ldr	x0, [sp, #40]
	bl	_free
	ldr	x8, [sp, #32]
	str	x8, [sp, #40]
	b	LBB10_6
LBB10_8:
	stur	wzr, [x29, #-4]
	b	LBB10_9
LBB10_9:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%d "

l_.str.1:                               ; @.str.1
	.asciz	"\n"

l_.str.2:                               ; @.str.2
	.asciz	"Original Matrix:\n"

l_.str.3:                               ; @.str.3
	.asciz	"\nMatrix After Sorting Rows by Sum:\n"

l_.str.4:                               ; @.str.4
	.asciz	"\nMatrix After Rotation (90 degrees):\n"

l_.str.5:                               ; @.str.5
	.asciz	"\nMaximum subsequence sum: %d\n"

	.section	__DATA,__data
	.globl	_duck                           ; @duck
	.p2align	3
_duck:
	.quad	850045863                       ; 0x32aaaba7
	.space	56

	.globl	_global_i                       ; @global_i
.zerofill __DATA,__common,_global_i,4,2
	.section	__TEXT,__cstring,cstring_literals
l_.str.6:                               ; @.str.6
	.asciz	"running thread...\n"

l_.str.7:                               ; @.str.7
	.asciz	"memory allocation failure\n"

l_.str.8:                               ; @.str.8
	.asciz	"thread joined...\n"

l_.str.9:                               ; @.str.9
	.asciz	"%d\n"

.subsections_via_symbols
