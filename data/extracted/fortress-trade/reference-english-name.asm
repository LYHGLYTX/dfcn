
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140a946e0 <.text+0xa936e0>:
   140a946e0:	mov    QWORD PTR [rsp+0x18],rbx
   140a946e5:	push   rbp
   140a946e6:	push   rsi
   140a946e7:	push   rdi
   140a946e8:	push   r12
   140a946ea:	push   r13
   140a946ec:	push   r14
   140a946ee:	push   r15
   140a946f0:	lea    rbp,[rsp-0x27]
   140a946f5:	sub    rsp,0x90
   140a946fc:	mov    rax,QWORD PTR [rip+0xe0793d]        # 0x14189c040
   140a94703:	xor    rax,rsp
   140a94706:	mov    QWORD PTR [rbp+0x17],rax
   140a9470a:	movzx  r14d,r9b
   140a9470e:	mov    BYTE PTR [rbp-0x38],r9b
   140a94712:	movzx  r15d,r8b
   140a94716:	mov    BYTE PTR [rbp-0x39],r8b
   140a9471a:	mov    rdi,rdx
   140a9471d:	mov    rsi,rcx
   140a94720:	xor    r13d,r13d
   140a94723:	cmp    BYTE PTR [rcx+0x72],r13b
   140a94727:	je     0x140a94e6f
   140a9472d:	mov    r12d,r13d
   140a94730:	movsxd rax,DWORD PTR [rip+0xe07b8d]        # 0x14189c2c4
   140a94737:	cmp    eax,0xa
   140a9473a:	ja     0x140a94747
   140a9473c:	lea    r12,[rip+0x18fc39d]        # 0x142390ae0
   140a94743:	mov    r12d,DWORD PTR [r12+rax*4]
   140a94747:	mov    QWORD PTR [rdx+0x10],r13
   140a9474b:	mov    rax,rdi
   140a9474e:	cmp    QWORD PTR [rdx+0x18],0xf
   140a94753:	jbe    0x140a94758
   140a94755:	mov    rax,QWORD PTR [rdx]
   140a94758:	mov    BYTE PTR [rax],r13b
   140a9475b:	movabs rax,0x7fffffffffffffff
   140a94765:	mov    ecx,0x16
   140a9476a:	cmp    QWORD PTR [rsi+0x30],r13
   140a9476e:	je     0x140a947ae
   140a94770:	test   r12d,0xfffffffd
   140a94777:	jne    0x140a947ae
   140a94779:	mov    dl,0x60
   140a9477b:	mov    rcx,rdi
   140a9477e:	call   0x1400b9b80
   140a94783:	lea    rdx,[rsi+0x20]
   140a94787:	mov    r8,QWORD PTR [rdx+0x10]
   140a9478b:	cmp    QWORD PTR [rdx+0x18],0xf
   140a94790:	jbe    0x140a94795
   140a94792:	mov    rdx,QWORD PTR [rdx]
   140a94795:	mov    rcx,rdi
   140a94798:	call   0x14006fa10
   140a9479d:	mov    dl,0x27
   140a9479f:	mov    rcx,rdi
   140a947a2:	call   0x1400b9b80
   140a947a7:	mov    bl,0x1
   140a947a9:	jmp    0x140a9488c
   140a947ae:	xorps  xmm0,xmm0
   140a947b1:	movups XMMWORD PTR [rbp-0x29],xmm0
   140a947b5:	mov    QWORD PTR [rbp-0x19],r13
   140a947b9:	mov    QWORD PTR [rbp-0x11],r13
   140a947bd:	mov    r14,QWORD PTR [rsi+0x10]
   140a947c1:	mov    r13,rsi
   140a947c4:	cmp    QWORD PTR [rsi+0x18],0xf
   140a947c9:	jbe    0x140a947ce
   140a947cb:	mov    r13,QWORD PTR [rsi]
   140a947ce:	cmp    r14,rax
   140a947d1:	ja     0x140a94e9c
   140a947d7:	cmp    r14,0xf
   140a947db:	ja     0x140a947fa
   140a947dd:	mov    QWORD PTR [rbp-0x19],r14
   140a947e1:	mov    ebx,0xf
   140a947e6:	mov    QWORD PTR [rbp-0x11],rbx
   140a947ea:	movups xmm0,XMMWORD PTR [r13+0x0]
   140a947ef:	movups XMMWORD PTR [rbp-0x29],xmm0
   140a947f3:	movq   r15,xmm0
   140a947f8:	jmp    0x140a9483a
   140a947fa:	mov    rbx,r14
   140a947fd:	or     rbx,0xf
   140a94801:	cmp    rbx,rax
   140a94804:	jbe    0x140a9480b
   140a94806:	mov    rbx,rax
   140a94809:	jmp    0x140a94812
   140a9480b:	cmp    rbx,rcx
   140a9480e:	cmovb  rbx,rcx
   140a94812:	lea    rcx,[rbx+0x1]
   140a94816:	call   0x1400707d0
   140a9481b:	mov    r15,rax
   140a9481e:	mov    QWORD PTR [rbp-0x29],rax
   140a94822:	mov    QWORD PTR [rbp-0x19],r14
   140a94826:	mov    QWORD PTR [rbp-0x11],rbx
   140a9482a:	lea    r8,[r14+0x1]
   140a9482e:	mov    rdx,r13
   140a94831:	mov    rcx,rax
   140a94834:	call   0x14153aa78
   140a94839:	nop
   140a9483a:	cmp    BYTE PTR [rbp-0x39],0x0
   140a9483e:	je     0x140a94855
   140a94840:	lea    rcx,[rbp-0x29]
   140a94844:	call   0x14052d3c0
   140a94849:	mov    rbx,QWORD PTR [rbp-0x11]
   140a9484d:	mov    r14,QWORD PTR [rbp-0x19]
   140a94851:	mov    r15,QWORD PTR [rbp-0x29]
   140a94855:	lea    rdx,[rbp-0x29]
   140a94859:	cmp    rbx,0xf
   140a9485d:	cmova  rdx,r15
   140a94861:	mov    r8,r14
   140a94864:	mov    rcx,rdi
   140a94867:	call   0x14006fa10
   140a9486c:	mov    rbx,QWORD PTR [rsi+0x10]
   140a94870:	lea    rcx,[rbp-0x29]
   140a94874:	call   0x14006f850
   140a94879:	test   rbx,rbx
   140a9487c:	setne  bl
   140a9487f:	movzx  r15d,BYTE PTR [rbp-0x39]
   140a94884:	movzx  r14d,BYTE PTR [rbp-0x38]
   140a94889:	xor    r13d,r13d
   140a9488c:	cmp    QWORD PTR [rsi+0x30],0x0
   140a94891:	je     0x140a948f3
   140a94893:	cmp    r12d,0x1
   140a94897:	jne    0x140a948e2
   140a94899:	test   bl,bl
   140a9489b:	je     0x140a948b2
   140a9489d:	mov    r8d,0x1
   140a948a3:	lea    rdx,[rip+0xb53e92]        # 0x1415e873c
   140a948aa:	mov    rcx,rdi
   140a948ad:	call   0x14006fa10
   140a948b2:	mov    dl,0x60
   140a948b4:	mov    rcx,rdi
   140a948b7:	call   0x1400b9b80
   140a948bc:	lea    rdx,[rsi+0x20]
   140a948c0:	mov    r8,QWORD PTR [rdx+0x10]
   140a948c4:	cmp    QWORD PTR [rdx+0x18],0xf
   140a948c9:	jbe    0x140a948ce
   140a948cb:	mov    rdx,QWORD PTR [rdx]
   140a948ce:	mov    rcx,rdi
   140a948d1:	call   0x14006fa10
   140a948d6:	mov    dl,0x27
   140a948d8:	mov    rcx,rdi
   140a948db:	call   0x1400b9b80
   140a948e0:	mov    bl,0x1
   140a948e2:	cmp    QWORD PTR [rsi+0x30],0x0
   140a948e7:	je     0x140a948f3
   140a948e9:	cmp    r12d,0x2
   140a948ed:	je     0x140a94e6f
   140a948f3:	mov    edx,DWORD PTR [rsi+0x40]
   140a948f6:	cmp    edx,0xffffffff
   140a948f9:	jne    0x140a94904
   140a948fb:	cmp    DWORD PTR [rsi+0x44],edx
   140a948fe:	je     0x140a949d5
   140a94904:	test   bl,bl
   140a94906:	je     0x140a94911
   140a94908:	test   r14b,r14b
   140a9490b:	jne    0x140a949d5
   140a94911:	xorps  xmm0,xmm0
   140a94914:	movups XMMWORD PTR [rbp-0x29],xmm0
   140a94918:	mov    QWORD PTR [rbp-0x19],r13
   140a9491c:	mov    QWORD PTR [rbp-0x11],0xf
   140a94924:	mov    BYTE PTR [rbp-0x29],0x0
   140a94928:	movsx  eax,WORD PTR [rsi+0x5c]
   140a9492c:	mov    DWORD PTR [rsp+0x20],eax
   140a94930:	lea    r8,[rbp-0x29]
   140a94934:	call   0x140d2cb50
   140a94939:	movsx  eax,WORD PTR [rsi+0x5e]
   140a9493d:	mov    DWORD PTR [rsp+0x20],eax
   140a94941:	lea    r8,[rbp-0x29]
   140a94945:	mov    edx,DWORD PTR [rsi+0x44]
   140a94948:	call   0x140d2cb50
   140a9494d:	cmp    QWORD PTR [rbp-0x19],0x0
   140a94952:	je     0x140a94997
   140a94954:	test   bl,bl
   140a94956:	je     0x140a9496d
   140a94958:	mov    r8d,0x1
   140a9495e:	lea    rdx,[rip+0xb53dd7]        # 0x1415e873c
   140a94965:	mov    rcx,rdi
   140a94968:	call   0x14006fa10
   140a9496d:	test   r15b,r15b
   140a94970:	je     0x140a9497b
   140a94972:	lea    rcx,[rbp-0x29]
   140a94976:	call   0x14052d3c0
   140a9497b:	lea    rdx,[rbp-0x29]
   140a9497f:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94984:	cmova  rdx,QWORD PTR [rbp-0x29]
   140a94989:	mov    r8,QWORD PTR [rbp-0x19]
   140a9498d:	mov    rcx,rdi
   140a94990:	call   0x14006fa10
   140a94995:	mov    bl,0x1
   140a94997:	mov    rdx,QWORD PTR [rbp-0x11]
   140a9499b:	cmp    rdx,0xf
   140a9499f:	jbe    0x140a949d5
   140a949a1:	inc    rdx
   140a949a4:	mov    rcx,QWORD PTR [rbp-0x29]
   140a949a8:	mov    rax,rcx
   140a949ab:	cmp    rdx,0x1000
   140a949b2:	jb     0x140a949d0
   140a949b4:	add    rdx,0x27
   140a949b8:	mov    rcx,QWORD PTR [rcx-0x8]
   140a949bc:	sub    rax,rcx
   140a949bf:	add    rax,0xfffffffffffffff8
   140a949c3:	cmp    rax,0x1f
   140a949c7:	jbe    0x140a949d0
   140a949c9:	call   QWORD PTR [rip+0xb51159]        # 0x1415e5b28
   140a949cf:	int3
   140a949d0:	call   0x141539680
   140a949d5:	cmp    DWORD PTR [rsi+0x54],0xffffffff
   140a949d9:	jne    0x140a949eb
   140a949db:	cmp    DWORD PTR [rsi+0x48],0xffffffff
   140a949df:	jne    0x140a949eb
   140a949e1:	cmp    DWORD PTR [rsi+0x4c],0xffffffff
   140a949e5:	je     0x140a94dad
   140a949eb:	test   bl,bl
   140a949ed:	je     0x140a949f8
   140a949ef:	test   r14b,r14b
   140a949f2:	jne    0x140a94dad
   140a949f8:	xor    r14b,r14b
   140a949fb:	xorps  xmm0,xmm0
   140a949fe:	movups XMMWORD PTR [rbp-0x29],xmm0
   140a94a02:	mov    QWORD PTR [rbp-0x19],r13
   140a94a06:	mov    QWORD PTR [rbp-0x11],0xf
   140a94a0e:	mov    BYTE PTR [rbp-0x29],r14b
   140a94a12:	movsx  eax,WORD PTR [rsi+0x60]
   140a94a16:	mov    DWORD PTR [rsp+0x20],eax
   140a94a1a:	lea    r8,[rbp-0x29]
   140a94a1e:	mov    edx,DWORD PTR [rsi+0x48]
   140a94a21:	call   0x140d2cb50
   140a94a26:	cmp    QWORD PTR [rbp-0x19],0x0
   140a94a2b:	je     0x140a94ac9
   140a94a31:	test   bl,bl
   140a94a33:	je     0x140a94a4a
   140a94a35:	mov    r8d,0x1
   140a94a3b:	lea    rdx,[rip+0xb53cfa]        # 0x1415e873c
   140a94a42:	mov    rcx,rdi
   140a94a45:	call   0x14006fa10
   140a94a4a:	cmp    QWORD PTR [rdi+0x10],0x0
   140a94a4f:	jne    0x140a94a72
   140a94a51:	cmp    r15b,0x1
   140a94a55:	jne    0x140a94a72
   140a94a57:	mov    r8d,0x4
   140a94a5d:	lea    rdx,[rip+0xb58f58]        # 0x1415ed9bc
   140a94a64:	mov    rcx,rdi
   140a94a67:	call   0x14006fa10
   140a94a6c:	movzx  r14d,r15b
   140a94a70:	jmp    0x140a94a8f
   140a94a72:	mov    r8d,0x4
   140a94a78:	lea    rdx,[rip+0xb543c9]        # 0x1415e8e48
   140a94a7f:	mov    rcx,rdi
   140a94a82:	call   0x14006fa10
   140a94a87:	mov    r14b,0x1
   140a94a8a:	test   r15b,r15b
   140a94a8d:	je     0x140a94a98
   140a94a8f:	lea    rcx,[rbp-0x29]
   140a94a93:	call   0x14052d3c0
   140a94a98:	lea    rdx,[rbp-0x29]
   140a94a9c:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94aa1:	cmova  rdx,QWORD PTR [rbp-0x29]
   140a94aa6:	mov    r8,QWORD PTR [rbp-0x19]
   140a94aaa:	mov    rcx,rdi
   140a94aad:	call   0x14006fa10
   140a94ab2:	mov    bl,0x1
   140a94ab4:	mov    QWORD PTR [rbp-0x19],r13
   140a94ab8:	lea    rax,[rbp-0x29]
   140a94abc:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94ac1:	cmova  rax,QWORD PTR [rbp-0x29]
   140a94ac6:	mov    BYTE PTR [rax],0x0
   140a94ac9:	movsx  eax,WORD PTR [rsi+0x62]
   140a94acd:	mov    DWORD PTR [rsp+0x20],eax
   140a94ad1:	lea    r8,[rbp-0x29]
   140a94ad5:	mov    edx,DWORD PTR [rsi+0x4c]
   140a94ad8:	call   0x140d2cb50
   140a94add:	cmp    QWORD PTR [rbp-0x19],0x0
   140a94ae2:	je     0x140a94b71
   140a94ae8:	test   bl,bl
   140a94aea:	je     0x140a94b01
   140a94aec:	mov    r8d,0x1
   140a94af2:	lea    rdx,[rip+0xb53c43]        # 0x1415e873c
   140a94af9:	mov    rcx,rdi
   140a94afc:	call   0x14006fa10
   140a94b01:	test   r14b,r14b
   140a94b04:	jne    0x140a94b32
   140a94b06:	cmp    QWORD PTR [rdi+0x10],0x0
   140a94b0b:	jne    0x140a94b1a
   140a94b0d:	cmp    r15b,0x1
   140a94b11:	lea    rdx,[rip+0xb58ea4]        # 0x1415ed9bc
   140a94b18:	je     0x140a94b21
   140a94b1a:	lea    rdx,[rip+0xb54327]        # 0x1415e8e48
   140a94b21:	mov    r8d,0x4
   140a94b27:	mov    rcx,rdi
   140a94b2a:	call   0x14006fa10
   140a94b2f:	mov    r14b,0x1
   140a94b32:	test   r15b,r15b
   140a94b35:	je     0x140a94b40
   140a94b37:	lea    rcx,[rbp-0x29]
   140a94b3b:	call   0x14052d3c0
   140a94b40:	lea    rdx,[rbp-0x29]
   140a94b44:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94b49:	cmova  rdx,QWORD PTR [rbp-0x29]
   140a94b4e:	mov    r8,QWORD PTR [rbp-0x19]
   140a94b52:	mov    rcx,rdi
   140a94b55:	call   0x14006fa10
   140a94b5a:	mov    bl,0x1
   140a94b5c:	mov    QWORD PTR [rbp-0x19],r13
   140a94b60:	lea    rax,[rbp-0x29]
   140a94b64:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94b69:	cmova  rax,QWORD PTR [rbp-0x29]
   140a94b6e:	mov    BYTE PTR [rax],0x0
   140a94b71:	movsx  eax,WORD PTR [rsi+0x64]
   140a94b75:	mov    DWORD PTR [rsp+0x20],eax
   140a94b79:	lea    r8,[rbp-0x29]
   140a94b7d:	mov    edx,DWORD PTR [rsi+0x50]
   140a94b80:	call   0x140d2cb50
   140a94b85:	cmp    QWORD PTR [rbp-0x19],0x0
   140a94b8a:	je     0x140a94cf6
   140a94b90:	test   bl,bl
   140a94b92:	je     0x140a94ba9
   140a94b94:	mov    r8d,0x1
   140a94b9a:	lea    rdx,[rip+0xb53b9b]        # 0x1415e873c
   140a94ba1:	mov    rcx,rdi
   140a94ba4:	call   0x14006fa10
   140a94ba9:	test   r14b,r14b
   140a94bac:	jne    0x140a94bda
   140a94bae:	cmp    QWORD PTR [rdi+0x10],0x0
   140a94bb3:	jne    0x140a94bc2
   140a94bb5:	cmp    r15b,0x1
   140a94bb9:	lea    rdx,[rip+0xb58dfc]        # 0x1415ed9bc
   140a94bc0:	je     0x140a94bc9
   140a94bc2:	lea    rdx,[rip+0xb5427f]        # 0x1415e8e48
   140a94bc9:	mov    r8d,0x4
   140a94bcf:	mov    rcx,rdi
   140a94bd2:	call   0x14006fa10
   140a94bd7:	mov    r14b,0x1
   140a94bda:	test   r15b,r15b
   140a94bdd:	je     0x140a94be8
   140a94bdf:	lea    rcx,[rbp-0x29]
   140a94be3:	call   0x14052d3c0
   140a94be8:	mov    r13,QWORD PTR [rbp-0x19]
   140a94bec:	movabs rcx,0x7fffffffffffffff
   140a94bf6:	mov    rax,rcx
   140a94bf9:	sub    rax,r13
   140a94bfc:	cmp    rax,0x1
   140a94c00:	jb     0x140a94e96
   140a94c06:	lea    rax,[rbp-0x29]
   140a94c0a:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94c0f:	cmova  rax,QWORD PTR [rbp-0x29]
   140a94c14:	mov    QWORD PTR [rbp-0x31],rax
   140a94c18:	xorps  xmm0,xmm0
   140a94c1b:	movups XMMWORD PTR [rbp-0x9],xmm0
   140a94c1f:	lea    r12,[r13+0x1]
   140a94c23:	mov    ebx,0xf
   140a94c28:	lea    r15,[rbp-0x9]
   140a94c2c:	cmp    r12,rbx
   140a94c2f:	jbe    0x140a94c63
   140a94c31:	mov    rbx,r12
   140a94c34:	or     rbx,0xf
   140a94c38:	cmp    rbx,rcx
   140a94c3b:	jbe    0x140a94c42
   140a94c3d:	mov    rbx,rcx
   140a94c40:	jmp    0x140a94c4f
   140a94c42:	cmp    rbx,0x16
   140a94c46:	mov    eax,0x16
   140a94c4b:	cmovb  rbx,rax
   140a94c4f:	lea    rcx,[rbx+0x1]
   140a94c53:	call   0x1400707d0
   140a94c58:	mov    r15,rax
   140a94c5b:	mov    QWORD PTR [rbp-0x9],rax
   140a94c5f:	mov    rax,QWORD PTR [rbp-0x31]
   140a94c63:	mov    QWORD PTR [rbp+0x7],r12
   140a94c67:	mov    QWORD PTR [rbp+0xf],rbx
   140a94c6b:	mov    r8,r13
   140a94c6e:	mov    rdx,rax
   140a94c71:	mov    rcx,r15
   140a94c74:	call   0x14153aa78
   140a94c79:	mov    BYTE PTR [r15+r13*1],0x2d
   140a94c7e:	mov    BYTE PTR [r15+r12*1],0x0
   140a94c83:	lea    rdx,[rbp-0x9]
   140a94c87:	cmp    QWORD PTR [rbp+0xf],0xf
   140a94c8c:	cmova  rdx,QWORD PTR [rbp-0x9]
   140a94c91:	mov    r8,QWORD PTR [rbp+0x7]
   140a94c95:	mov    rcx,rdi
   140a94c98:	call   0x14006fa10
   140a94c9d:	nop
   140a94c9e:	mov    rdx,QWORD PTR [rbp+0xf]
   140a94ca2:	cmp    rdx,0xf
   140a94ca6:	jbe    0x140a94cdc
   140a94ca8:	inc    rdx
   140a94cab:	mov    rcx,QWORD PTR [rbp-0x9]
   140a94caf:	mov    rax,rcx
   140a94cb2:	cmp    rdx,0x1000
   140a94cb9:	jb     0x140a94cd7
   140a94cbb:	add    rdx,0x27
   140a94cbf:	mov    rcx,QWORD PTR [rcx-0x8]
   140a94cc3:	sub    rax,rcx
   140a94cc6:	add    rax,0xfffffffffffffff8
   140a94cca:	cmp    rax,0x1f
   140a94cce:	jbe    0x140a94cd7
   140a94cd0:	call   QWORD PTR [rip+0xb50e52]        # 0x1415e5b28
   140a94cd6:	int3
   140a94cd7:	call   0x141539680
   140a94cdc:	xor    bl,bl
   140a94cde:	mov    QWORD PTR [rbp-0x19],0x0
   140a94ce6:	lea    rax,[rbp-0x29]
   140a94cea:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94cef:	cmova  rax,QWORD PTR [rbp-0x29]
   140a94cf4:	mov    BYTE PTR [rax],bl
   140a94cf6:	movsx  eax,WORD PTR [rsi+0x66]
   140a94cfa:	mov    DWORD PTR [rsp+0x20],eax
   140a94cfe:	lea    r8,[rbp-0x29]
   140a94d02:	mov    edx,DWORD PTR [rsi+0x54]
   140a94d05:	call   0x140d2cb50
   140a94d0a:	cmp    QWORD PTR [rbp-0x19],0x0
   140a94d0f:	je     0x140a94d9d
   140a94d15:	test   bl,bl
   140a94d17:	je     0x140a94d2e
   140a94d19:	mov    r8d,0x1
   140a94d1f:	lea    rdx,[rip+0xb53a16]        # 0x1415e873c
   140a94d26:	mov    rcx,rdi
   140a94d29:	call   0x14006fa10
   140a94d2e:	movzx  r13d,BYTE PTR [rbp-0x39]
   140a94d33:	test   r14b,r14b
   140a94d36:	jne    0x140a94d71
   140a94d38:	cmp    QWORD PTR [rdi+0x10],0x0
   140a94d3d:	jne    0x140a94d5c
   140a94d3f:	cmp    r13b,0x1
   140a94d43:	jne    0x140a94d5c
   140a94d45:	mov    r8d,0x4
   140a94d4b:	lea    rdx,[rip+0xb58c6a]        # 0x1415ed9bc
   140a94d52:	mov    rcx,rdi
   140a94d55:	call   0x14006fa10
   140a94d5a:	jmp    0x140a94d76
   140a94d5c:	mov    r8d,0x4
   140a94d62:	lea    rdx,[rip+0xb540df]        # 0x1415e8e48
   140a94d69:	mov    rcx,rdi
   140a94d6c:	call   0x14006fa10
   140a94d71:	test   r13b,r13b
   140a94d74:	je     0x140a94d7f
   140a94d76:	lea    rcx,[rbp-0x29]
   140a94d7a:	call   0x14052d3c0
   140a94d7f:	lea    rdx,[rbp-0x29]
   140a94d83:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94d88:	cmova  rdx,QWORD PTR [rbp-0x29]
   140a94d8d:	mov    r8,QWORD PTR [rbp-0x19]
   140a94d91:	mov    rcx,rdi
   140a94d94:	call   0x14006fa10
   140a94d99:	mov    bl,0x1
   140a94d9b:	jmp    0x140a94da2
   140a94d9d:	movzx  r13d,BYTE PTR [rbp-0x39]
   140a94da2:	lea    rcx,[rbp-0x29]
   140a94da6:	call   0x14006f850
   140a94dab:	jmp    0x140a94db2
   140a94dad:	movzx  r13d,BYTE PTR [rbp-0x39]
   140a94db2:	mov    edx,DWORD PTR [rsi+0x58]
   140a94db5:	cmp    edx,0xffffffff
   140a94db8:	je     0x140a94e6f
   140a94dbe:	test   bl,bl
   140a94dc0:	je     0x140a94dcc
   140a94dc2:	cmp    BYTE PTR [rbp-0x38],0x0
   140a94dc6:	jne    0x140a94e6f
   140a94dcc:	xorps  xmm0,xmm0
   140a94dcf:	movups XMMWORD PTR [rbp-0x29],xmm0
   140a94dd3:	mov    QWORD PTR [rbp-0x19],0x0
   140a94ddb:	mov    QWORD PTR [rbp-0x11],0xf
   140a94de3:	mov    BYTE PTR [rbp-0x29],0x0
   140a94de7:	movsx  eax,WORD PTR [rsi+0x68]
   140a94deb:	mov    DWORD PTR [rsp+0x20],eax
   140a94def:	lea    r8,[rbp-0x29]
   140a94df3:	call   0x140d2cb50
   140a94df8:	cmp    QWORD PTR [rbp-0x19],0x0
   140a94dfd:	je     0x140a94e66
   140a94dff:	test   bl,bl
   140a94e01:	je     0x140a94e18
   140a94e03:	mov    r8d,0x1
   140a94e09:	lea    rdx,[rip+0xb5392c]        # 0x1415e873c
   140a94e10:	mov    rcx,rdi
   140a94e13:	call   0x14006fa10
   140a94e18:	lea    rax,[rip+0xc39f71]        # 0x1416ced90
   140a94e1f:	lea    rdx,[rip+0xc39ff6]        # 0x1416cee1c
   140a94e26:	cmp    QWORD PTR [rdi+0x10],0x0
   140a94e2b:	cmovne rdx,rax
   140a94e2f:	mov    r8d,0x3
   140a94e35:	mov    rcx,rdi
   140a94e38:	call   0x14006fa10
   140a94e3d:	test   r13b,r13b
   140a94e40:	je     0x140a94e4b
   140a94e42:	lea    rcx,[rbp-0x29]
   140a94e46:	call   0x14052d3c0
   140a94e4b:	lea    rdx,[rbp-0x29]
   140a94e4f:	cmp    QWORD PTR [rbp-0x11],0xf
   140a94e54:	cmova  rdx,QWORD PTR [rbp-0x29]
   140a94e59:	mov    r8,QWORD PTR [rbp-0x19]
   140a94e5d:	mov    rcx,rdi
   140a94e60:	call   0x14006fa10
   140a94e65:	nop
   140a94e66:	lea    rcx,[rbp-0x29]
   140a94e6a:	call   0x14006f850
   140a94e6f:	mov    rcx,QWORD PTR [rbp+0x17]
   140a94e73:	xor    rcx,rsp
   140a94e76:	call   0x141539660
   140a94e7b:	mov    rbx,QWORD PTR [rsp+0xe0]
   140a94e83:	add    rsp,0x90
   140a94e8a:	pop    r15
   140a94e8c:	pop    r14
   140a94e8e:	pop    r13
   140a94e90:	pop    r12
   140a94e92:	pop    rdi
   140a94e93:	pop    rsi
   140a94e94:	pop    rbp
   140a94e95:	ret
   140a94e96:	call   0x140065890
   140a94e9b:	nop
   140a94e9c:	call   0x140065890
   140a94ea1:	int3
