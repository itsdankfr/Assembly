.model small
.stack 100H
.data
    mang db 28, 7, 14, 1, 6, 28, 30, 9, 28, 20
    CRLF db 13, 10, '$' 
.code
Main Proc
    MOV AX, @data
    MOV DS, AX
    
    XOR AX, AX
    LEA SI, mang
    MOV BL, 7
    MOV BH, 0
    MOV CX, 10
    XOR DX, DX
    lap:
        MOV AL, 0
        MOV AH, 0
        MOV AL, [SI]
        DIV BL
        
        CMP AH, 0
        JNE continue
        ADD DL, [SI]
        
        continue:
            INC SI
            LOOP lap
    CALL inso
    MOV AH, 4CH
    INT 21H
Main endp
    
    
inso Proc
    XOR AX, AX
    MOV AX, DX
    XOR CX, CX
    XOR BX, BX
    MOV BX, 10D
    XOR DX, DX
   
    LAP2:
        MOV DX, 0
        DIV BX
        PUSH DX
        INC CX
        CMP AX, 0
        JNE LAP2
    LAP3:
        POP DX
        ADD DX, '0'
        MOV AH, 02H
        INT 21H
        LOOP LAP3
    Ret
inso endp
END