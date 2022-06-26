;Написати на мові асемблер exe-програму, щоб перекодувати символи
;строки шляхом додавання до літер строки кодів символів таблиці.

data segment
mes db 0ah,0dh,&#39;code- &#39;,&#39;$&#39; ; перенос каретки + слово
mas db 10 dup (?) ; не ініціалізований масив з 10 елементів байт
ends

stack segment
dw 128 dup(0)
ends

code segment
start:
mov ax, data
mov ds, ax
mov es, ax
xor ax,ax
mov cx,10 ; в сх записуємо 10 (розмір масиву)
mov si,0 ; в si 0

go: ; запис в масив данні які вводяться з клавіатури
mov ah,01
int 21h
mov mas[si],al
inc si
loop go
; відновлюємо значення сх і si
mov cx,10
mov si,0

;вивід переносу та слова
mov ah,09h
lea dx,mes
int 21h

show: ; вивід зміненого масиву
mov ah,02h
mov dl,mas[si]
add dl,30h ; число яке додаємо до ASCII коду
int 21h
inc si
loop show

mov ax, 4c00h ; вихід з програми
int 21h
ends
end start ; кінцева точка
