
C:/Users/WIN11/Downloads/df_53_16_win/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140c62420 <.text+0xc61420>:
   140c62420:	rex push rbx
   140c62422:	sub    rsp,0x20
   140c62426:	mov    rbx,rdx
   140c62429:	cmp    r8d,0x1
   140c6242d:	jne    0x140c62449
   140c6242f:	mov    r8d,0x4
   140c62435:	lea    rdx,[rip+0x9819f8]        # 0x1415e3e34
   140c6243c:	mov    rcx,rbx
   140c6243f:	add    rsp,0x20
   140c62443:	pop    rbx
   140c62444:	jmp    0x14006f9a0
   140c62449:	test   r8d,r8d
   140c6244c:	jne    0x140c6247f
   140c6244e:	test   DWORD PTR [rcx+0x10],0x40000
   140c62455:	jne    0x140c6247f
   140c62457:	mov    rax,QWORD PTR [rcx]
   140c6245a:	call   QWORD PTR [rax+0x478]
   140c62460:	cmp    eax,0x1
   140c62463:	jne    0x140c6247f
   140c62465:	mov    r8d,0x2
   140c6246b:	lea    rdx,[rip+0x9861a6]        # 0x1415e8618
   140c62472:	mov    rcx,rbx
   140c62475:	add    rsp,0x20
   140c62479:	pop    rbx
   140c6247a:	jmp    0x14006f9a0
   140c6247f:	add    rsp,0x20
   140c62483:	pop    rbx
   140c62484:	ret
