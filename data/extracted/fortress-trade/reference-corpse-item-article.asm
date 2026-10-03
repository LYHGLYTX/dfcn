
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140ca0d60 <.text+0xc9fd60>:
   140ca0d60:	mov    r11,rsp
   140ca0d63:	mov    QWORD PTR [r11+0x10],rbx
   140ca0d67:	mov    QWORD PTR [r11+0x18],rsi
   140ca0d6b:	push   rdi
   140ca0d6c:	sub    rsp,0x40
   140ca0d70:	mov    rax,QWORD PTR [rcx]
   140ca0d73:	lea    r9,[r11-0x10]
   140ca0d77:	mov    rbx,rcx
   140ca0d7a:	mov    edi,r8d
   140ca0d7d:	lea    rcx,[r11-0x18]
   140ca0d81:	mov    rsi,rdx
   140ca0d84:	mov    QWORD PTR [r11-0x28],rcx
   140ca0d88:	lea    r8,[r11+0x8]
   140ca0d8c:	mov    rcx,rbx
   140ca0d8f:	lea    rdx,[r11+0x20]
   140ca0d93:	call   QWORD PTR [rax+0x1f8]
   140ca0d99:	mov    rcx,QWORD PTR [rsp+0x30]
   140ca0d9e:	test   rcx,rcx
   140ca0da1:	je     0x140ca0dda
   140ca0da3:	cmp    DWORD PTR [rip+0xbfb4ee],0x1        # 0x14189c298
   140ca0daa:	jne    0x140ca0dd4
   140ca0dac:	mov    rax,QWORD PTR [rip+0x174431d]        # 0x1423e50d0
   140ca0db3:	sub    rax,QWORD PTR [rip+0x174430e]        # 0x1423e50c8
   140ca0dba:	sar    rax,0x3
   140ca0dbe:	test   rax,rax
   140ca0dc1:	je     0x140ca0dd4
   140ca0dc3:	mov    rax,QWORD PTR [rip+0x1744346]        # 0x1423e5110
   140ca0dca:	test   rax,rax
   140ca0dcd:	je     0x140ca0dd4
   140ca0dcf:	cmp    rcx,rax
   140ca0dd2:	je     0x140ca0e34
   140ca0dd4:	cmp    BYTE PTR [rcx+0x7a],0x0
   140ca0dd8:	jmp    0x140ca0deb
   140ca0dda:	mov    rax,QWORD PTR [rsp+0x38]
   140ca0ddf:	test   rax,rax
   140ca0de2:	je     0x140ca0ded
   140ca0de4:	cmp    BYTE PTR [rax+0xaa],0x0
   140ca0deb:	jne    0x140ca0e34
   140ca0ded:	cmp    edi,0x1
   140ca0df0:	jne    0x140ca0e01
   140ca0df2:	mov    r8d,0x4
   140ca0df8:	lea    rdx,[rip+0x948049]        # 0x1415e8e48
   140ca0dff:	jmp    0x140ca0e2c
   140ca0e01:	test   edi,edi
   140ca0e03:	jne    0x140ca0e34
   140ca0e05:	test   DWORD PTR [rbx+0x10],0x40000
   140ca0e0c:	jne    0x140ca0e34
   140ca0e0e:	mov    rax,QWORD PTR [rbx]
   140ca0e11:	mov    rcx,rbx
   140ca0e14:	call   QWORD PTR [rax+0x478]
   140ca0e1a:	cmp    eax,0x1
   140ca0e1d:	jne    0x140ca0e34
   140ca0e1f:	mov    r8d,0x2
   140ca0e25:	lea    rdx,[rip+0x94c7f4]        # 0x1415ed620
   140ca0e2c:	mov    rcx,rsi
   140ca0e2f:	call   0x14006fa10
   140ca0e34:	mov    rbx,QWORD PTR [rsp+0x58]
   140ca0e39:	mov    rsi,QWORD PTR [rsp+0x60]
   140ca0e3e:	add    rsp,0x40
   140ca0e42:	pop    rdi
   140ca0e43:	ret
