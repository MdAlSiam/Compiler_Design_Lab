; Roll: 1603008
; Ques Q2: 
; int main() { 
;     int i = 0; 
;     int n; 
;     for (n = 9; n != 0; n--) { 
;         if (i); 
;         else printf("Not"); 
;         printf("%d", i);
;     } 
;     return 0; 
; } 

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
    msg1fmt byte "%s", 0
    msg1 byte "Not", 0

    ; msg2fmt byte 0Ah,"%s", 0
    ; msg2 byte "Resistance: ", 0

    ; msg3fmt byte 0Ah,"%d", 0
    msg3fmt byte "%d", 0
    ; msg3 byte "Voltage: ", 0

    ; msg4fmt byte 0Ah,"%s %d",0
    ; msg4 byte ">> Now: ", 0

    ; val1 dword ? ; current
    ; val2 dword ? ; resistance
    answer dword ? ; voltage
    ; temp dword ?

    i dword 0
    n dword ?

.code
main PROC
    
    mov n, 9
    mov eax, n

    GO:
        cmp eax, 0
        je LAST

        cmp i, 0
        jg PRINTNOT

        jmp PI
    PRINTNOT:
        push eax
        push n
        push i
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        pop i
        pop n
        pop eax
    PI:
        push eax
        push n
        push i
        INVOKE printf, ADDR msg3fmt, i
        pop i
        pop n
        pop eax
    ENDER: 
        sub eax, 1
        jmp GO
    LAST:

    ret
main ENDP

END main