
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140c653e0 <.text+0xc643e0>:
   140c653e0:	rex push rbx
   140c653e2:	sub    rsp,0x20
   140c653e6:	mov    rbx,rdx
   140c653e9:	cmp    r8d,0x1
   140c653ed:	jne    0x140c65409
   140c653ef:	mov    r8d,0x4
   140c653f5:	lea    rdx,[rip+0x983a4c]        # 0x1415e8e48
   140c653fc:	mov    rcx,rbx
   140c653ff:	add    rsp,0x20
   140c65403:	pop    rbx
   140c65404:	jmp    0x14006fa10
   140c65409:	test   r8d,r8d
   140c6540c:	jne    0x140c6543f
   140c6540e:	test   DWORD PTR [rcx+0x10],0x40000
   140c65415:	jne    0x140c6543f
   140c65417:	mov    rax,QWORD PTR [rcx]
   140c6541a:	call   QWORD PTR [rax+0x478]
   140c65420:	cmp    eax,0x1
   140c65423:	jne    0x140c6543f
   140c65425:	mov    r8d,0x2
   140c6542b:	lea    rdx,[rip+0x9881ee]        # 0x1415ed620
   140c65432:	mov    rcx,rbx
   140c65435:	add    rsp,0x20
   140c65439:	pop    rbx
   140c6543a:	jmp    0x14006fa10
   140c6543f:	add    rsp,0x20
   140c65443:	pop    rbx
   140c65444:	ret
