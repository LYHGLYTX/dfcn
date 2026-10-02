
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140b93930 <.text+0xb92930>:
   140b93930:	mov    QWORD PTR [rsp+0x8],rbx
   140b93935:	mov    QWORD PTR [rsp+0x20],rsi
   140b9393a:	push   rdi
   140b9393b:	sub    rsp,0x50
   140b9393f:	mov    rax,QWORD PTR [rip+0xd086fa]        # 0x14189c040
   140b93946:	xor    rax,rsp
   140b93949:	mov    QWORD PTR [rsp+0x40],rax
   140b9394e:	mov    edi,r9d
   140b93951:	mov    rbx,rdx
   140b93954:	mov    edx,r8d
   140b93957:	mov    rcx,QWORD PTR [rip+0x19581fa]        # 0x1424ebb58
   140b9395e:	call   0x14007db20
   140b93963:	mov    rsi,rax
   140b93966:	test   rax,rax
   140b93969:	je     0x140b93a58
   140b9396f:	and    edi,0x2
   140b93972:	je     0x140b939ac
   140b93974:	mov    r8d,0xc
   140b9397a:	lea    rdx,[rip+0xb4bf9f]        # 0x1416df920
   140b93981:	mov    rcx,rbx
   140b93984:	call   0x14006fa10
   140b93989:	mov    rdx,rbx
   140b9398c:	mov    ecx,DWORD PTR [rsi+0x88]
   140b93992:	call   0x14052c130
   140b93997:	mov    r8d,0x1
   140b9399d:	lea    rdx,[rip+0xa69cec]        # 0x1415fd690
   140b939a4:	mov    rcx,rbx
   140b939a7:	call   0x14006fa10
   140b939ac:	xorps  xmm0,xmm0
   140b939af:	movups XMMWORD PTR [rsp+0x20],xmm0
   140b939b4:	mov    QWORD PTR [rsp+0x30],0x0
   140b939bd:	mov    QWORD PTR [rsp+0x38],0xf
   140b939c6:	mov    BYTE PTR [rsp+0x20],0x0
   140b939cb:	xor    r9d,r9d
   140b939ce:	mov    r8b,0x1
   140b939d1:	lea    rdx,[rsp+0x20]
   140b939d6:	mov    rcx,rsi
   140b939d9:	call   0x140a946e0
   140b939de:	lea    rdx,[rsp+0x20]
   140b939e3:	cmp    QWORD PTR [rsp+0x38],0xf
   140b939e9:	cmova  rdx,QWORD PTR [rsp+0x20]
   140b939ef:	mov    r8,QWORD PTR [rsp+0x30]
   140b939f4:	mov    rcx,rbx
   140b939f7:	call   0x14006fa10
   140b939fc:	test   edi,edi
   140b939fe:	je     0x140b93a16
   140b93a00:	mov    r8d,0x8
   140b93a06:	lea    rdx,[rip+0xa6a07b]        # 0x1415fda88
   140b93a0d:	mov    rcx,rbx
   140b93a10:	call   0x14006fa10
   140b93a15:	nop
   140b93a16:	mov    rdx,QWORD PTR [rsp+0x38]
   140b93a1b:	cmp    rdx,0xf
   140b93a1f:	jbe    0x140b93a6d
   140b93a21:	inc    rdx
   140b93a24:	mov    rcx,QWORD PTR [rsp+0x20]
   140b93a29:	mov    rax,rcx
   140b93a2c:	cmp    rdx,0x1000
   140b93a33:	jb     0x140b93a51
   140b93a35:	add    rdx,0x27
   140b93a39:	mov    rcx,QWORD PTR [rcx-0x8]
   140b93a3d:	sub    rax,rcx
   140b93a40:	add    rax,0xfffffffffffffff8
   140b93a44:	cmp    rax,0x1f
   140b93a48:	jbe    0x140b93a51
   140b93a4a:	call   QWORD PTR [rip+0xa520d8]        # 0x1415e5b28
   140b93a50:	int3
   140b93a51:	call   0x141539680
   140b93a56:	jmp    0x140b93a6d
   140b93a58:	mov    r8d,0xf
   140b93a5e:	lea    rdx,[rip+0xb4beab]        # 0x1416df910
   140b93a65:	mov    rcx,rbx
   140b93a68:	call   0x14006fa10
   140b93a6d:	mov    rcx,QWORD PTR [rsp+0x40]
   140b93a72:	xor    rcx,rsp
   140b93a75:	call   0x141539660
   140b93a7a:	mov    rbx,QWORD PTR [rsp+0x60]
   140b93a7f:	mov    rsi,QWORD PTR [rsp+0x78]
   140b93a84:	add    rsp,0x50
   140b93a88:	pop    rdi
   140b93a89:	ret
