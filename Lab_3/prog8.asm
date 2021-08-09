.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib
.stack 100h

printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Sdword, inputlist:VARARG

.data
    ; in1fmt byte "%d",0

    ; msg1fmt byte 0Ah,"%s", 0
    ; msg1 byte "Current: ", 0

    ; msg2fmt byte 0Ah,"%s", 0
    ; msg2 byte "Resistance: ", 0

    msg3fmt byte 0Ah,"%s %d",0
    msg3 byte "Voltage: ", 0

    msg4fmt byte 0Ah,"%s %d",0
    msg4 byte ">> Now: ", 0

    ; val1 dword ? ; current
    ; val2 dword ? ; resistance
    answer dword ? ; voltage
    ; temp dword ?

    a dword 10
    count dword 0

.code
main PROC
    ; INVOKE printf, ADDR msg1fmt, ADDR msg1
    ; INVOKE scanf, ADDR in1fmt, ADDR val1

    ; INVOKE printf, ADDR msg2fmt, ADDR msg2
    ; INVOKE scanf, ADDR in1fmt, ADDR val2

    INVOKE printf, ADDR msg4fmt, ADDR msg4, a
    INVOKE printf, ADDR msg4fmt, ADDR msg4, count

    xor eax, eax
    GO:
        cmp eax, 10
        jge OUTER

        cmp eax, 5
        je TA

        cmp eax, 7
        jge TB

        jmp TC
    TA:
        add count, 1
        jmp LOOP_ENDER
    TB:
        mov count, eax
        add eax, 1
        jmp LOOP_ENDER
    TC:
        mov count, eax
        sub count, 1
        jmp LOOP_ENDER
    LOOP_ENDER:
        add eax, 1
        jmp GO
    OUTER:
        mov answer, eax
        INVOKE printf, ADDR msg3fmt, ADDR msg3, answer
        INVOKE printf, ADDR msg3fmt, ADDR msg3, count

    ret
main ENDP

END main