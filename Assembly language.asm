Print_Str macro string                        ;output string
		lea dx,string
		mov ah,09h
		int 21h
		endm
.8086
.model small
.stack 1024
.data
	str1 db "Row of block: $"
	str2 db 10,13,"Column of block: $"
	str3 db 10,13,"Edge word: $"
	str4 db 10,13,"Edge word color: $"
	str5 db 10,13,"Edge word background: $"
	str6 db "Block content word: $"
	str7 db 10,13,"Block content word color: $"
	str8 db 10,13,"Block content word background: $"
	chl db 10,13,'$'
	w1 db 0
	w2 db 0
	w3 db 0
	w4 db 0
	w5 db 0
	w6 db 0
	w7 db 0
	w8 db 0
	w3x3 db 0
.code
.startup
	Print_Str str1						;input row(0~9)
	call input
	mov w1,al							
	Print_Str str2						;input column(0~9)	
	call input
	mov w2,al
	Print_Str str3						;input	sign(1bit) 
	call input
	add al,30h
	mov w3,al
	Print_Str str4						;input	word color(4bit)
	xor bx,bx
	mov cx,4
	L4:
		call inputbit
		loop L4
	mov w4,bl
	Print_Str str5						;input	background(3bit)
	xor bx,bx
	mov cx,3
	L5:
		call inputbit
		loop L5
	mov w5,bl
	Print_Str chl
	cmp w1,3h							;judge 3X3 or not
	jb  Output
	cmp w2,3h
	jb	Output
	mov w3x3,0ah
	Print_Str str6						;input	sign(1bit)
	call input
	add al,30h
	mov w6,al
	Print_Str str7						;input	word color outside(4bit)
	xor bx,bx
	mov cx,4
	L7:
		call inputbit
		loop L7
	mov w7,bl
	Print_Str str8						;input	background outside(3bit)
	xor bx,bx
	mov cx,3
	L8:
		call inputbit
		loop L8
	mov w8,bl
	Print_Str chl
	Output:								;output
		cmp w1,0h
		je Exit
		call Output1
		dec w1
		Print_Str chl
		cmp w3x3,0ah
		je	Outputin
		jmp Output
	Outputin:
		cmp w1,1
		je	Outputin2
		call Output11
		call Output2
		call ReadptrMOV
		call Output2
		Print_Str chl
		dec w1
		jmp	Outputin	
	Outputin2:
		mov	w3x3,0h
		jmp Output
	Exit:
.exit
input	proc near                         	;produce number
		mov ah,01h
		int 21h
		sub al,30h
		ret
	input endp
inputbit proc near                          ;produce number2
		shl bl,1
		mov ah,01h
		int 21h
		sub al,30h
		add bl,al
		ret
	inputbit endp
Output0		proc near						;input signal outside
		mov ah,09h
		mov al,w3
		mov bl,w5
		mov cl,4
		shl	bl,cl
		add bl,w4
		ret
	Output0 endp
Output1 proc near                        	 ;output1 and last
		call Output0
		mov cl,w2
		int 10h
		ret
	Output1 endp
Output2 proc near                         	;Output 1bit
		call Output0
		xor cx,cx
		mov cl,1
		int 10h
		ret
	Output2 endp
Output00	proc near						;input signal inside
		mov ah,09h
		mov al,w6
		mov bl,w8
		mov cl,4
		shl	bl,cl
		add bl,w7
		ret
	Output00 endp
Output11 proc near                        	 ;output1 and last
		call Output00
		mov cl,w2
		int 10h
		ret
	Output11 endp
ReadptrMOV proc near						 ;ptr mov
		mov ah,03h
		int 10h
		mov ah,02h
		mov dl,w2
		dec dl
		int 10h
		ret
	ReadptrMOV endp
end
