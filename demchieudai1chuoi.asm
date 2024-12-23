.model small
.stack 100H
.data
    CRLF db 13, 10, '$'
    string db 256 dup ('$')
.code
Main Proc
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 0AH
    LEA DX, string
    INT 21H
    
    MOV AH, 09H
    LEA DX, CRLF
    INT 21H
    
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX
    MOV BX, 10D
    MOV AL, [string + 1]
    LAP1:
        MOV DX, 0
        DIV BX
        PUSH DX
        INC CX
        CMP AX, 0
        JNE LAP1
    LAP2:
        POP DX
        ADD DX, '0'
        MOV AH, 2
        INT 21H
        LOOP LAP2
        
    MOV AH, 4CH
    INT 21H
Main endp
END
    