
C:/Users/WIN11/Downloads/df_53_16_win/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140c9dda0 <.text+0xc9cda0>:
   140c9dda0:	mov    r11,rsp
   140c9dda3:	mov    QWORD PTR [r11+0x10],rbx
   140c9dda7:	mov    QWORD PTR [r11+0x18],rsi
   140c9ddab:	push   rdi
   140c9ddac:	sub    rsp,0x40
   140c9ddb0:	mov    rax,QWORD PTR [rcx]
   140c9ddb3:	lea    r9,[r11-0x10]
   140c9ddb7:	mov    rbx,rcx
   140c9ddba:	mov    edi,r8d
   140c9ddbd:	lea    rcx,[r11-0x18]
   140c9ddc1:	mov    rsi,rdx
   140c9ddc4:	mov    QWORD PTR [r11-0x28],rcx
   140c9ddc8:	lea    r8,[r11+0x8]
   140c9ddcc:	mov    rcx,rbx
   140c9ddcf:	lea    rdx,[r11+0x20]
   140c9ddd3:	call   QWORD PTR [rax+0x1f8]
   140c9ddd9:	mov    rcx,QWORD PTR [rsp+0x30]
   140c9ddde:	test   rcx,rcx
   140c9dde1:	je     0x140c9de1a
   140c9dde3:	cmp    DWORD PTR [rip+0xbf847e],0x1        # 0x141896268
   140c9ddea:	jne    0x140c9de14
   140c9ddec:	mov    rax,QWORD PTR [rip+0x17411cd]        # 0x1423defc0
   140c9ddf3:	sub    rax,QWORD PTR [rip+0x17411be]        # 0x1423defb8
   140c9ddfa:	sar    rax,0x3
   140c9ddfe:	test   rax,rax
   140c9de01:	je     0x140c9de14
   140c9de03:	mov    rax,QWORD PTR [rip+0x17411f6]        # 0x1423df000
   140c9de0a:	test   rax,rax
   140c9de0d:	je     0x140c9de14
   140c9de0f:	cmp    rcx,rax
   140c9de12:	je     0x140c9de74
   140c9de14:	cmp    BYTE PTR [rcx+0x7a],0x0
   140c9de18:	jmp    0x140c9de2b
   140c9de1a:	mov    rax,QWORD PTR [rsp+0x38]
   140c9de1f:	test   rax,rax
   140c9de22:	je     0x140c9de2d
   140c9de24:	cmp    BYTE PTR [rax+0xaa],0x0
   140c9de2b:	jne    0x140c9de74
   140c9de2d:	cmp    edi,0x1
   140c9de30:	jne    0x140c9de41
   140c9de32:	mov    r8d,0x4
   140c9de38:	lea    rdx,[rip+0x945ff5]        # 0x1415e3e34
   140c9de3f:	jmp    0x140c9de6c
   140c9de41:	test   edi,edi
   140c9de43:	jne    0x140c9de74
   140c9de45:	test   DWORD PTR [rbx+0x10],0x40000
   140c9de4c:	jne    0x140c9de74
   140c9de4e:	mov    rax,QWORD PTR [rbx]
   140c9de51:	mov    rcx,rbx
   140c9de54:	call   QWORD PTR [rax+0x478]
   140c9de5a:	cmp    eax,0x1
   140c9de5d:	jne    0x140c9de74
   140c9de5f:	mov    r8d,0x2
   140c9de65:	lea    rdx,[rip+0x94a7ac]        # 0x1415e8618
   140c9de6c:	mov    rcx,rsi
   140c9de6f:	call   0x14006f9a0
   140c9de74:	mov    rbx,QWORD PTR [rsp+0x58]
   140c9de79:	mov    rsi,QWORD PTR [rsp+0x60]
   140c9de7e:	add    rsp,0x40
   140c9de82:	pop    rdi
   140c9de83:	ret
