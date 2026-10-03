
C:/Users/WIN11/Downloads/df_53_16_win/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140b8f940 <.text+0xb8e940>:
   140b8f940:	mov    QWORD PTR [rsp+0x8],rbx
   140b8f945:	mov    QWORD PTR [rsp+0x20],rsi
   140b8f94a:	push   rdi
   140b8f94b:	sub    rsp,0x50
   140b8f94f:	mov    rax,QWORD PTR [rip+0xd066ea]        # 0x141896040
   140b8f956:	xor    rax,rsp
   140b8f959:	mov    QWORD PTR [rsp+0x40],rax
   140b8f95e:	mov    esi,r9d
   140b8f961:	mov    rbx,rdx
   140b8f964:	mov    rax,QWORD PTR [rip+0x183bd85]        # 0x1423cb6f0
   140b8f96b:	sub    rax,QWORD PTR [rip+0x183bd76]        # 0x1423cb6e8
   140b8f972:	test   rax,0xfffffffffffffff8
   140b8f978:	je     0x140b8f994
   140b8f97a:	cmp    r8d,0xffffffff
   140b8f97e:	je     0x140b8f994
   140b8f980:	lea    rdx,[rip+0x183bd61]        # 0x1423cb6e8
   140b8f987:	mov    ecx,r8d
   140b8f98a:	call   0x1400ba030
   140b8f98f:	mov    rdi,rax
   140b8f992:	jmp    0x140b8f996
   140b8f994:	xor    edi,edi
   140b8f996:	test   rdi,rdi
   140b8f999:	je     0x140b8fa86
   140b8f99f:	and    esi,0x2
   140b8f9a2:	je     0x140b8f9d9
   140b8f9a4:	mov    r8d,0xb
   140b8f9aa:	lea    rdx,[rip+0xac9947]        # 0x1416592f8
   140b8f9b1:	mov    rcx,rbx
   140b8f9b4:	call   0x14006f9a0
   140b8f9b9:	mov    rdx,rbx
   140b8f9bc:	mov    ecx,DWORD PTR [rdi+0x4]
   140b8f9bf:	call   0x140529cf0
   140b8f9c4:	mov    r8d,0x1
   140b8f9ca:	lea    rdx,[rip+0xa68c93]        # 0x1415f8664
   140b8f9d1:	mov    rcx,rbx
   140b8f9d4:	call   0x14006f9a0
   140b8f9d9:	xorps  xmm0,xmm0
   140b8f9dc:	movups XMMWORD PTR [rsp+0x20],xmm0
   140b8f9e1:	mov    QWORD PTR [rsp+0x30],0x0
   140b8f9ea:	mov    QWORD PTR [rsp+0x38],0xf
   140b8f9f3:	mov    BYTE PTR [rsp+0x20],0x0
   140b8f9f8:	lea    rcx,[rdi+0x20]
   140b8f9fc:	xor    r9d,r9d
   140b8f9ff:	mov    r8b,0x1
   140b8fa02:	lea    rdx,[rsp+0x20]
   140b8fa07:	call   0x140a91760
   140b8fa0c:	lea    rdx,[rsp+0x20]
   140b8fa11:	cmp    QWORD PTR [rsp+0x38],0xf
   140b8fa17:	cmova  rdx,QWORD PTR [rsp+0x20]
   140b8fa1d:	mov    r8,QWORD PTR [rsp+0x30]
   140b8fa22:	mov    rcx,rbx
   140b8fa25:	call   0x14006f9a0
   140b8fa2a:	test   esi,esi
   140b8fa2c:	je     0x140b8fa44
   140b8fa2e:	mov    r8d,0x8
   140b8fa34:	lea    rdx,[rip+0xa69115]        # 0x1415f8b50
   140b8fa3b:	mov    rcx,rbx
   140b8fa3e:	call   0x14006f9a0
   140b8fa43:	nop
   140b8fa44:	mov    rdx,QWORD PTR [rsp+0x38]
   140b8fa49:	cmp    rdx,0xf
   140b8fa4d:	jbe    0x140b8fa9b
   140b8fa4f:	inc    rdx
   140b8fa52:	mov    rcx,QWORD PTR [rsp+0x20]
   140b8fa57:	mov    rax,rcx
   140b8fa5a:	cmp    rdx,0x1000
   140b8fa61:	jb     0x140b8fa7f
   140b8fa63:	add    rdx,0x27
   140b8fa67:	mov    rcx,QWORD PTR [rcx-0x8]
   140b8fa6b:	sub    rax,rcx
   140b8fa6e:	add    rax,0xfffffffffffffff8
   140b8fa72:	cmp    rax,0x1f
   140b8fa76:	jbe    0x140b8fa7f
   140b8fa78:	call   QWORD PTR [rip+0xa51022]        # 0x1415e0aa0
   140b8fa7e:	int3
   140b8fa7f:	call   0x1415345f0
   140b8fa84:	jmp    0x140b8fa9b
   140b8fa86:	mov    r8d,0x17
   140b8fa8c:	lea    rdx,[rip+0xb4ac8d]        # 0x1416da720
   140b8fa93:	mov    rcx,rbx
   140b8fa96:	call   0x14006f9a0
   140b8fa9b:	mov    rcx,QWORD PTR [rsp+0x40]
   140b8faa0:	xor    rcx,rsp
   140b8faa3:	call   0x1415345d0
   140b8faa8:	mov    rbx,QWORD PTR [rsp+0x60]
   140b8faad:	mov    rsi,QWORD PTR [rsp+0x78]
   140b8fab2:	add    rsp,0x50
   140b8fab6:	pop    rdi
   140b8fab7:	ret
