#include <sfr52.inc>

led1 bit P0.0
led2 bit P0.1
led3 bit P0.2
led4 bit P0.3
led5 bit P0.4
led6 bit P0.5
led7 bit P0.6
led8 bit P0.7

led9  bit P2.7
led10 bit P2.6
led11 bit P2.5
led12 bit P2.4
led13 bit P2.3
led14 bit P2.2
led15 bit P2.1
led16 bit P2.0

led17 bit P1.0
led18 bit P1.1
led19 bit P1.2
led20 bit P1.3
led21 bit P1.4
led22 bit P1.5
led23 bit P1.6
led24 bit P1.7

led25 bit P3.0
led26 bit P3.1
led27 bit P3.2
led28 bit P3.3
led29 bit P3.4
led30 bit P3.5
led31 bit P3.6
led32 bit P3.7

; --- khoi tao ---
maxdosang equ 1
; --- chuong trinh ---
org 0000h
main:
; -- ban dau tat led --
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh

start1:
; --- nhay led bam xung ---16 led ben phai sang---
mov r0, #10; tao tre truoc khi chuyen hieu ung
lcall hu_led1
lcall hu_led2
lcall hu_led3
lcall hu_led4
lcall hu_led5
lcall hu_led6
lcall hu_led7
lcall hu_led8
lcall hu_led9
lcall hu_led10
lcall hu_led11
lcall hu_led12
lcall hu_led13
lcall hu_led14
lcall hu_led15
lcall hu_led16


; --- giu xung tao duoi sao bang ---
lcall duoi1
lcall duoi2
lcall duoi3
lcall duoi4
lcall duoi5
lcall duoi6
lcall duoi7
lcall duoi8
lcall duoi9
lcall duoi10
lcall duoi11
lcall duoi12
lcall duoi13
lcall duoi14
lcall duoi15
lcall duoi16

setb led16
mov time, #200
lcall delay

;--- bam xung cho 16 led ben trai sang ---
lcall hu_led17
lcall hu_led18
lcall hu_led19
lcall hu_led20
lcall hu_led21
lcall hu_led22
lcall hu_led23
lcall hu_led24
lcall hu_led25
lcall hu_led26
lcall hu_led27
lcall hu_led28
lcall hu_led29
lcall hu_led30
lcall hu_led31
lcall hu_led32

lcall duoi17
lcall duoi18
lcall duoi19
lcall duoi20
lcall duoi21
lcall duoi22
lcall duoi23
lcall duoi24
lcall duoi25
lcall duoi26
lcall duoi27
lcall duoi28
lcall duoi29
lcall duoi30
lcall duoi31
lcall duoi32

setb led32

; ---ca hai ben led deu sang cung luc----
lcall hu_led33
lcall hu_led34
lcall hu_led35
lcall hu_led36
lcall hu_led37
lcall hu_led38
lcall hu_led39
lcall hu_led40
lcall hu_led41
lcall hu_led42
lcall hu_led43
lcall hu_led44
lcall hu_led45
lcall hu_led46
lcall hu_led47
lcall hu_led48


; --- giu xung tao duoi sao bang ---
lcall duoi33
lcall duoi34
lcall duoi35
lcall duoi36
lcall duoi37
lcall duoi38
lcall duoi39
lcall duoi40
lcall duoi41
lcall duoi42
lcall duoi43
lcall duoi44
lcall duoi45
lcall duoi46
lcall duoi47
lcall duoi48

setb led32
ljmp start1

; --- bam xung cho led 1 - 16 voi 16 muc sang ---
hu_led1:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led1
    mov time, #16
    lcall delay
    djnz r0, hu_led1
mov r0, #10
ret

hu_led2:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led2
    mov time, #maxdosang
    lcall delay
    
    clr led1
    mov time, #15
    lcall delay
    djnz r0, hu_led2
mov r0, #10
ret

hu_led3:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led3
    mov time, #maxdosang
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #14
    lcall delay
    djnz r0, hu_led3
mov r0, #10
ret

hu_led4:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led4
    mov time, #maxdosang
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #13
    lcall delay
    djnz r0, hu_led4
mov r0, #10
ret

hu_led5:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led5
    mov time, #maxdosang
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #12
    lcall delay
    djnz r0, hu_led5
mov r0, #10
ret

hu_led6:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led6
    mov time, #maxdosang
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #11
    lcall delay
    djnz r0, hu_led6
mov r0, #10
ret


hu_led7:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led7
    mov time, #maxdosang
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #10
    lcall delay
    djnz r0, hu_led7
mov r0, #10
ret

hu_led8:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led8
    mov time, #maxdosang
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #9
    lcall delay
    djnz r0, hu_led8
mov r0, #10
ret

hu_led9:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led9
    mov time, #maxdosang
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #8
    lcall delay
    djnz r0, hu_led9
mov r0, #10
ret

hu_led10:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led10
    mov time, #maxdosang
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #7
    lcall delay
    djnz r0, hu_led10
mov r0, #10
ret

hu_led11:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led11
    mov time, #maxdosang
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #6
    lcall delay
    djnz r0, hu_led11
mov r0, #10
ret

hu_led12:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led12
    mov time, #maxdosang
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #5
    lcall delay
    djnz r0, hu_led12
mov r0, #10
ret

hu_led13:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led13
    mov time, #maxdosang
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #4
    lcall delay
    djnz r0, hu_led13
mov r0, #10
ret

hu_led14:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led14
    mov time, #maxdosang
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #3
    lcall delay
    djnz r0, hu_led14
mov r0, #10
ret

hu_led15:
mov P0, #0ffh
mov P2, #0ffh
    lcall hu15; khuc nay bi vuot qua gioi han lap cho phep nen phai goi ngoai
    djnz r0, hu_led15
mov r0, #10
ret

hu_led16:
mov P0, #0ffh
mov P2, #0ffh
    lcall hu16; khuc nay bi vuot qua gioi han lap cho phep nen phai goi ngoai
    djnz r0, hu_led16
mov r0, #10
ret
hu15:
    mov time, #maxdosang
    lcall delay

    clr led15
    mov time, #maxdosang
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #2
    lcall delay
ret

hu16:
    mov time, #maxdosang
    lcall delay
    
    clr led16
    mov time, #maxdosang
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #1
    lcall delay
ret

; -------- ham con giu xung -----------
; khi moi led bi tat dan di se tang them 1 delay de dam bao xung ko bi thay doi
duoi1:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #maxdosang
    lcall delay
    lcall duoi1_1
    djnz r0, duoi1
    mov r0, #10
ret
duoi1_1:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay

    clr led1
    mov time, #1
    lcall delay
ret

duoi2:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #2
    lcall delay
    lcall duoi1_2
    djnz r0, duoi2
    mov r0, #10
ret
duoi1_2:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay

    clr led2
    mov time, #1
    lcall delay
ret

duoi3:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #3
    lcall delay
    lcall duoi1_3
    djnz r0, duoi3
    mov r0, #10
ret
duoi1_3:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay

    clr led3
    mov time, #1
    lcall delay
ret

duoi4:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #4
    lcall delay
    lcall duoi1_4
    djnz r0, duoi4
    mov r0, #10
ret
duoi1_4:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay

    clr led4
    mov time, #1
    lcall delay
ret

duoi5:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #5
    lcall delay
    lcall duoi1_5
    djnz r0, duoi5
    mov r0, #10
ret
duoi1_5:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay

    clr led5
    mov time, #1
    lcall delay
ret

duoi6:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #6
    lcall delay
    lcall duoi1_6
    djnz r0, duoi6
    mov r0, #10
ret
duoi1_6:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay

    clr led6
    mov time, #1
    lcall delay
ret

duoi7:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #7
    lcall delay
    lcall duoi1_7
    djnz r0, duoi7
    mov r0, #10
ret
duoi1_7:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay

    clr led7
    mov time, #1
    lcall delay
ret

duoi8:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #8
    lcall delay
    lcall duoi1_8
    djnz r0, duoi8
    mov r0, #10
ret
duoi1_8:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay

    clr led8
    mov time, #1
    lcall delay
ret

duoi9:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #9
    lcall delay
    lcall duoi1_9
    djnz r0, duoi9
    mov r0, #10
ret
duoi1_9:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay

    clr led9
    mov time, #1
    lcall delay
ret

duoi10:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #10
    lcall delay
    lcall duoi1_10
    djnz r0, duoi10
    mov r0, #10
ret
duoi1_10:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay

    clr led10
    mov time, #1
    lcall delay
ret

duoi11:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #11
    lcall delay
    lcall duoi1_11
    djnz r0, duoi11
    mov r0, #10
ret
duoi1_11:
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay

    clr led11
    mov time, #1
    lcall delay
ret

duoi12:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #12
    lcall delay
    
	clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay

    clr led12
    mov time, #1
    lcall delay
	
    djnz r0, duoi12
    mov r0, #10
ret

duoi13:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #13
    lcall delay
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay

    clr led13
    mov time, #1
    lcall delay
	
    djnz r0, duoi13
    mov r0, #10
ret

duoi14:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #14
    lcall delay
	
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay

    clr led14
    mov time, #1
    lcall delay
	
    djnz r0, duoi14
    mov r0, #10
ret


duoi15:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #15
    lcall delay
	
    clr led16
    mov time, #1
    lcall delay

    clr led15
    mov time, #1
    lcall delay
	
    djnz r0, duoi15
    mov r0, #10
ret


duoi16:
mov P0, #0ffh
mov P2, #0ffh
    mov time, #16
    lcall delay
	
    clr led16
    mov time, #1
    lcall delay
	
    djnz r0, duoi16
    mov r0, #10
ret


; --- bam xung cho led 17 - 32 tiep theo -- day led ben trai
hu_led17:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led17
    mov time, #16
    lcall delay
    djnz r0, hu_led17
mov r0, #10
ret

hu_led18:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led18
    mov time, #maxdosang
    lcall delay
    
    clr led17
    mov time, #15
    lcall delay
    djnz r0, hu_led18
mov r0, #10
ret

hu_led19:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led19
    mov time, #maxdosang
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #14
    lcall delay
    djnz r0, hu_led19
mov r0, #10
ret

hu_led20:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led20
    mov time, #maxdosang
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #13
    lcall delay
    djnz r0, hu_led20
mov r0, #10
ret

hu_led21:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led21
    mov time, #maxdosang
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #12
    lcall delay
    djnz r0, hu_led21
mov r0, #10
ret

hu_led22:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led22
    mov time, #maxdosang
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #11
    lcall delay
    djnz r0, hu_led22
mov r0, #10
ret


hu_led23:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led23
    mov time, #maxdosang
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #10
    lcall delay
    djnz r0, hu_led23
mov r0, #10
ret

hu_led24:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led24
    mov time, #maxdosang
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #9
    lcall delay
    djnz r0, hu_led24
mov r0, #10
ret

hu_led25:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led25
    mov time, #maxdosang
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #8
    lcall delay
    djnz r0, hu_led25
mov r0, #10
ret

hu_led26:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led26
    mov time, #maxdosang
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #7
    lcall delay
    djnz r0, hu_led26
mov r0, #10
ret

hu_led27:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led27
    mov time, #maxdosang
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #6
    lcall delay
    djnz r0, hu_led27
mov r0, #10
ret

hu_led28:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led28
    mov time, #maxdosang
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #5
    lcall delay
    djnz r0, hu_led28
mov r0, #10
ret

hu_led29:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led29
    mov time, #maxdosang
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #4
    lcall delay
    djnz r0, hu_led29
mov r0, #10
ret

hu_led30:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led30
    mov time, #maxdosang
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #3
    lcall delay
    djnz r0, hu_led30
mov r0, #10
ret

hu_led31:
mov P1, #0ffh
mov P3, #0ffh
    lcall hu31; khuc nay bi vuot qua gioi han lap cho phep nen phai goi ngoai
    djnz r0, hu_led31
mov r0, #10
ret

hu_led32:
mov P1, #0ffh
mov P3, #0ffh
    lcall hu32; khuc nay bi vuot qua gioi han lap cho phep nen phai goi ngoai
    djnz r0, hu_led32
mov r0, #10
ret
hu31:
    mov time, #maxdosang
    lcall delay

    clr led31
    mov time, #maxdosang
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #2
    lcall delay
ret

hu32:
    mov time, #maxdosang
    lcall delay
    
    clr led32
    mov time, #maxdosang
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #1
    lcall delay
ret

; -------- ham con giu xung -----------
; khi moi led bi tat dan di se tang them 1 delay de dam bao xung ko bi thay doi
duoi17:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay
    lcall duoi1_17
    djnz r0, duoi17
    mov r0, #10
ret
duoi1_17:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18
    mov time, #1
    lcall delay

    clr led17
    mov time, #1
    lcall delay
ret

duoi18:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #2
    lcall delay
    lcall duoi1_18
    djnz r0, duoi18
    mov r0, #10
ret
duoi1_18:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay

    clr led18    mov time, #1
    lcall delay
ret

duoi19:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #3
    lcall delay
    lcall duoi1_19
    djnz r0, duoi19
    mov r0, #10
ret
duoi1_19:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay

    clr led19
    mov time, #1
    lcall delay
ret

duoi20:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #4
    lcall delay
    lcall duoi1_20
    djnz r0, duoi20
    mov r0, #10
ret
duoi1_20:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay

    clr led20
    mov time, #1
    lcall delay
ret

duoi21:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #5
    lcall delay
    lcall duoi1_21
    djnz r0, duoi21
    mov r0, #10
ret
duoi1_21:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay

    clr led21
    mov time, #1
    lcall delay
ret

duoi22:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #6
    lcall delay
    lcall duoi1_22
    djnz r0, duoi22
    mov r0, #10
ret
duoi1_22:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay

    clr led22
    mov time, #1
    lcall delay
ret

duoi23:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #7
    lcall delay
    lcall duoi1_23
    djnz r0, duoi23
    mov r0, #10
ret
duoi1_23:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay

    clr led23
    mov time, #1
    lcall delay
ret

duoi24:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #8
    lcall delay
    lcall duoi1_24
    djnz r0, duoi24
    mov r0, #10
ret
duoi1_24:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay

    clr led24
    mov time, #1
    lcall delay
ret

duoi25:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #9
    lcall delay
    lcall duoi1_25
    djnz r0, duoi25
    mov r0, #10
ret
duoi1_25:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay

    clr led25
    mov time, #1
    lcall delay
ret

duoi26:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #10
    lcall delay
    lcall duoi1_26
    djnz r0, duoi26
    mov r0, #10
ret
duoi1_26:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay

    clr led26
    mov time, #1
    lcall delay
ret

duoi27:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #11
    lcall delay
    lcall duoi1_27
    djnz r0, duoi27
    mov r0, #10
ret
duoi1_27:
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay

    clr led27
    mov time, #1
    lcall delay
ret

duoi28:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #12
    lcall delay
    
	clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay

    clr led28
    mov time, #1
    lcall delay
	
    djnz r0, duoi28
    mov r0, #10
ret

duoi29:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #13
    lcall delay
	
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay

    clr led29
    mov time, #1
    lcall delay
	
    djnz r0, duoi29
    mov r0, #10
ret

duoi30:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #14
    lcall delay
	
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay

    clr led30
    mov time, #1
    lcall delay
	
    djnz r0, duoi30
    mov r0, #10
ret


duoi31:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #15
    lcall delay
	
    clr led32
    mov time, #1
    lcall delay

    clr led31
    mov time, #1
    lcall delay
	
    djnz r0, duoi31
    mov r0, #10
ret

duoi32:
mov P1, #0ffh
mov P3, #0ffh
    mov time, #16
    lcall delay
	
    clr led32
    mov time, #1
    lcall delay
	
    djnz r0, duoi32
    mov r0, #10
ret
; ---

hu_led33:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led1
    clr led17
    mov time, #16
    lcall delay
    djnz r0, hu_led33
mov r0, #10
ret

hu_led34:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led2
	clr led18
    mov time, #maxdosang
    lcall delay
    
    clr led1
    clr led17
    mov time, #15
    lcall delay
    djnz r0, hu_led34
mov r0, #10
ret

hu_led35:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led3
	clr led19
    mov time, #maxdosang
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #14
    lcall delay
    djnz r0, hu_led35
mov r0, #10
ret

hu_led36:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led4
	clr led20
    mov time, #maxdosang
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #13
    lcall delay
    djnz r0, hu_led36
mov r0, #10
ret

hu_led37:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led5
	clr led21
    mov time, #maxdosang
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #12
    lcall delay
    djnz r0, hu_led37
mov r0, #10
ret

hu_led38:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led6
	clr led22
    mov time, #maxdosang
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #11
    lcall delay
    djnz r0, hu_led38
mov r0, #10
ret


hu_led39:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led7
	clr led23
    mov time, #maxdosang
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #10
    lcall delay
    djnz r0, hu_led39
mov r0, #10
ret

hu_led40:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led8
	clr led24
    mov time, #maxdosang
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #9
    lcall delay
    djnz r0, hu_led40
mov r0, #10
ret

hu_led41:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led9
	clr led25
    mov time, #maxdosang
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #8
    lcall delay
    djnz r0, hu_led41
mov r0, #10
ret

hu_led42:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay

    clr led10
	clr led26
    mov time, #maxdosang
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #7
    lcall delay
    djnz r0, hu_led42
mov r0, #10
ret

hu_led43:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay
    lcall hu_43
    djnz r0, hu_led43
mov r0, #10
ret
hu_43:
clr led11
	clr led27
    mov time, #maxdosang
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #6
    lcall delay
ret
hu_led44:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay
    lcall hu_44
    djnz r0, hu_led44
mov r0, #10
ret
hu_44:
clr led12
	clr led28
    mov time, #maxdosang
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #5
    lcall delay
ret

hu_led45:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay
    lcall hu_45
    djnz r0, hu_led45
mov r0, #10
ret
hu_45:
clr led13
	clr led29
    mov time, #maxdosang
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #4
    lcall delay
ret

hu_led46:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay
    lcall hu_46    
    djnz r0, hu_led46
mov r0, #10
ret
hu_46:
    clr led14
	clr led30
    mov time, #maxdosang
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #3
    lcall delay
ret
hu_led47:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    lcall hu47; khuc nay bi vuot qua gioi han lap cho phep nen phai goi ngoai
    djnz r0, hu_led47
mov r0, #10
ret

hu_led48:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    lcall hu48; khuc nay bi vuot qua gioi han lap cho phep nen phai goi ngoai
    djnz r0, hu_led48
mov r0, #10
ret
hu47:
    mov time, #maxdosang
    lcall delay

    clr led15
	clr led31
    mov time, #maxdosang
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #2
    lcall delay
ret

hu48:
    mov time, #maxdosang
    lcall delay
    
    clr led16
	clr led32
    mov time, #maxdosang
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #1
    lcall delay
ret

;-- giu xung
duoi33:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #maxdosang
    lcall delay
    lcall duoi1_33
    djnz r0, duoi33
    mov r0, #10
ret
duoi1_33:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay

    clr led1
	clr led17
    mov time, #1
    lcall delay
ret

duoi34:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #2
    lcall delay
    lcall duoi1_34
    djnz r0, duoi34
    mov r0, #10
ret
duoi1_34:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay

    clr led2
	clr led18
    mov time, #1
    lcall delay
ret

duoi35:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #3
    lcall delay
    lcall duoi1_35
    djnz r0, duoi35
    mov r0, #10
ret
duoi1_35:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay

    clr led3
	clr led19
    mov time, #1
    lcall delay
ret

duoi36:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #4
    lcall delay
    lcall duoi1_36
    djnz r0, duoi36
    mov r0, #10
ret
duoi1_36:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay

    clr led4
	clr led20
    mov time, #1
    lcall delay
ret

duoi37:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #5
    lcall delay
    lcall duoi1_37
    djnz r0, duoi37
    mov r0, #10
ret
duoi1_37:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay

    clr led5
	clr led21
    mov time, #1
    lcall delay
ret

duoi38:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #6
    lcall delay
    lcall duoi1_38
    djnz r0, duoi38
    mov r0, #10
ret
duoi1_38:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay

    clr led6
	clr led22
    mov time, #1
    lcall delay
ret

duoi39:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #7
    lcall delay
    lcall duoi1_39
    djnz r0, duoi39
    mov r0, #10
ret
duoi1_39:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay

    clr led7
	clr led23
    mov time, #1
    lcall delay
ret

duoi40:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #8
    lcall delay
    lcall duoi1_40
    djnz r0, duoi40
    mov r0, #10
ret
duoi1_40:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay

    clr led8
	clr led24
    mov time, #1
    lcall delay
ret

duoi41:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #9
    lcall delay
    lcall duoi1_41
    djnz r0, duoi41
    mov r0, #10
ret
duoi1_41:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay

    clr led9
	clr led25
    mov time, #1
    lcall delay
ret

duoi42:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #10
    lcall delay
    lcall duoi1_42
    djnz r0, duoi42
    mov r0, #10
ret
duoi1_42:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay

    clr led10
	clr led26
    mov time, #1
    lcall delay
ret

duoi43:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #11
    lcall delay
    lcall duoi1_43
    djnz r0, duoi43
    mov r0, #10
ret
duoi1_43:
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay

    clr led11
	clr led27
    mov time, #1
    lcall delay
ret

duoi44:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #12
    lcall delay
    
	clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay

    clr led12
	clr led28
    mov time, #1
    lcall delay
	
    djnz r0, duoi44
    mov r0, #10
ret

duoi45:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #13
    lcall delay
	
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay

    clr led13
	clr led29
    mov time, #1
    lcall delay
	
    djnz r0, duoi45
    mov r0, #10
ret

duoi46:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #14
    lcall delay
	
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay

    clr led14
	clr led30
    mov time, #1
    lcall delay
	
    djnz r0, duoi46
    mov r0, #10
ret


duoi47:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #15
    lcall delay
	
    clr led16
	clr led32
    mov time, #1
    lcall delay

    clr led15
	clr led31
    mov time, #1
    lcall delay
	
    djnz r0, duoi47
    mov r0, #10
ret


duoi48:
mov P0, #0ffh
mov P1, #0ffh
mov P2, #0ffh
mov P3, #0ffh
    mov time, #16
    lcall delay
	
    clr led16
	clr led32
    mov time, #1
    lcall delay
	
    djnz r0, duoi48
    mov r0, #10
ret


time data 38h
mov time, #1
lcall delay

delay: ;tan so = 12Mhz, T chu ky may = 1us
mov TMOD, #01h
mov TH0, #high(-200)
mov TL0, #low(-200)
setb TR0
wait: jnb TF0, wait
clr TR0
clr TF0
djnz time, delay
ret
end

