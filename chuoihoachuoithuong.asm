.model small
.stack 100H
.data
    CRLF DB 13, 10, '$'
    tb1 DB 'chuoi thuong $'
    tb2 DB 'chuoi hoa $'
    string DB 100 dup ('$')
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
    LEA DX, tb1
    INT 21H
    CALL inthuong
    
    MOV AH, 09H
    LEA DX, CRLF
    INT 21H
    LEA DX, tb2
    INT 21H
    CALL inhoa
    
    
    MOV AH, 4CH
    INT 21H
Main endp
    
    
    
inthuong proc
    LEA SI, string + 2
    LAP:
        MOV DL, [SI]
        CMP DL, 'A'
        JL in1
        CMP DL, 'Z'
        JG in1
        ADD DL, 32
    in1:
        MOV AH, 2
        INT 21H
        INC SI
        CMP [SI], '$'
        JNE LAP
    RET
inthuong endp  
         
inhoa Proc
    LEA SI, string + 2
    LAP2:
        MOV DL, [SI]
        CMP DL, 'a'
        JL in2
        CMP DL, 'z'
        JG in2
        SUB DL, 32
        
    in2:
        MOV AH, 2
        INT 21H
        INC SI
        CMP [SI], '$'
        JNE LAP2
    Ret
inhoa endp         
         
         
END