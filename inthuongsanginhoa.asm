.model small
.stack 100h
.data
    CRLF DB 13, 10, '$'
    TBao1 DB 'Nhap mot ky tu thuong $'
    Tbao2 DB 'Ky tu in hoa cua no la $'
    Char DB ?
.code
Main Proc
    MOV AX, @data
    MOV DS, AX
            
    MOV AH, 9
    LEA DX, TBao1
    INT 21H          
            
    MOV AH, 1
    INT 21H
    MOV Char, AL
    
    MOV AH, 9
    LEA DX, CRLF
    INT 21H
    LEA DX, TBao2
    INT 21H
    
    MOV AH, 2   
    ;SUB Char, 32D
    MOV DL, Char - 20H
    INT 21H
    
    MOV AH, 4CH
    INT 21H
Main endp
END Main