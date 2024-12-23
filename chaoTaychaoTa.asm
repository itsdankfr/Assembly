.model small
.stack 100h
.data
    CRLF DB 13, 10, '$'
    chaoTay DB 'hello$'
    chaoTa DB 'xin chao$'
    
.code
Main Proc
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 9
    
    LEA DX, chaoTay
    INT 21H
    
    LEA DX, CRLF
    INT 21H
    
    LEA DX, chaoTa
    INT 21H
    
    MOV AH, 4CH
    INT 21H
Main endp  
END Main
    