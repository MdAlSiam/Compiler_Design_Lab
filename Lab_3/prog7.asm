.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib
.stack 100h

printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Sdword, inputlist:VARARG

.data
    in1fmt byte "%d",0

    msg1fmt byte 0Ah,"%s", 0
    msg1 byte "Current: ", 0

    msg2fmt byte 0Ah,"%s", 0
    msg2 byte "Resistance: ", 0

    msg3fmt byte 0Ah,"%s %d",0
    msg3 byte "Voltage: ", 0

    msg4fmt byte 0Ah,"%s %d",0
    msg4 byte ">> Now: ", 0

    val1 dword ? ; current
    val2 dword ? ; resistance
    answer dword ? ; voltage
    temp dword ?

.code
main PROC
    INVOKE printf, ADDR msg1fmt, ADDR msg1
    INVOKE scanf, ADDR in1fmt, ADDR val1

    INVOKE printf, ADDR msg2fmt, ADDR msg2
    INVOKE scanf, ADDR in1fmt, ADDR val2

    push val2 ; res
    push val1 ; curr
    call MulTwo 
    pop val1
    pop val2

    ret
main ENDP

MulTwo PROC
    push ebp
    mov ebp, esp

    mov edx, [ebp+12]
    mov eax, [ebp+8]

    GO:
        cmp eax, 1
        jle OUT_
        add edx, [ebp+12]

        ; mov temp, edx
        ; push eax
        ; push edx
        ; INVOKE printf, ADDR msg4fmt, ADDR msg4, temp
        ; pop edx
        ; pop eax

        sub eax, 1
        jmp GO

    OUT_:
        mov answer, edx
        INVOKE printf, ADDR msg3fmt, ADDR msg3, answer

    pop ebp
    ret
MulTwo ENDP

END main