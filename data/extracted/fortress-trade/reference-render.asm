
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140384850 <.text+0x383850>:
   140384850:	rex push rbp
   140384852:	push   rbx
   140384853:	push   rsi
   140384854:	push   rdi
   140384855:	push   r12
   140384857:	push   r13
   140384859:	push   r14
   14038485b:	push   r15
   14038485d:	lea    rbp,[rsp-0x198]
   140384865:	sub    rsp,0x298
   14038486c:	mov    rax,QWORD PTR [rip+0x15177cd]        # 0x14189c040
   140384873:	xor    rax,rsp
   140384876:	mov    QWORD PTR [rbp+0x180],rax
   14038487d:	mov    DWORD PTR [rbp-0x60],edx
   140384880:	mov    r14,rcx
   140384883:	mov    QWORD PTR [rbp-0x80],rcx
   140384887:	lea    r15d,[r8+0x4]
   14038488b:	mov    DWORD PTR [rbp-0x78],r15d
   14038488f:	lea    esi,[r9-0x1c]
   140384893:	mov    DWORD PTR [rbp+0x10],esi
   140384896:	mov    r12d,DWORD PTR [rip+0x2048eeb]        # 0x1423cd788
   14038489d:	add    r12d,0xfffffffc
   1403848a1:	mov    DWORD PTR [rbp-0x58],r12d
   1403848a5:	mov    eax,0xffffffff
   1403848aa:	mov    DWORD PTR [rbp+0x14],eax
   1403848ad:	mov    DWORD PTR [rbp+0x18],eax
   1403848b0:	cmp    BYTE PTR [rip+0x200bd1e],0x0        # 0x1423905d5
   1403848b7:	je     0x1403848cd
   1403848b9:	lea    r8,[rbp+0x18]
   1403848bd:	lea    rdx,[rbp+0x14]
   1403848c1:	lea    rcx,[rip+0x22c5b28]        # 0x14264a3f0
   1403848c8:	call   0x1400bb340
   1403848cd:	cmp    BYTE PTR [r14+0x1],0x0
   1403848d2:	je     0x140384d4b
   1403848d8:	xor    r8d,r8d
   1403848db:	mov    edx,0x7
   1403848e0:	mov    r9b,0x1
   1403848e3:	lea    rcx,[rip+0x22c5b06]        # 0x14264a3f0
   1403848ea:	call   0x1400bb130
   1403848ef:	mov    edi,0x4
   1403848f4:	cmp    r12d,edi
   1403848f7:	jl     0x1403849ca
   1403848fd:	nop    DWORD PTR [rax]
   140384900:	mov    ebx,r15d
   140384903:	cmp    r15d,esi
   140384906:	jg     0x1403849bf
   14038490c:	nop    DWORD PTR [rax+0x0]
   140384910:	mov    r8d,ebx
   140384913:	mov    edx,edi
   140384915:	lea    rcx,[rip+0x22c5ad4]        # 0x14264a3f0
   14038491c:	call   0x1400bb120
   140384921:	xor    r8d,r8d
   140384924:	xor    edx,edx
   140384926:	lea    rcx,[rip+0x22c5ac3]        # 0x14264a3f0
   14038492d:	call   0x1400bb190
   140384932:	cmp    edi,0x4
   140384935:	jne    0x14038495f
   140384937:	cmp    ebx,r15d
   14038493a:	jne    0x140384944
   14038493c:	mov    edx,DWORD PTR [rip+0x22c73d2]        # 0x14264bd14
   140384942:	jmp    0x1403849a9
   140384944:	lea    rcx,[rip+0x22c5aa5]        # 0x14264a3f0
   14038494b:	cmp    ebx,esi
   14038494d:	jne    0x140384957
   14038494f:	mov    edx,DWORD PTR [rip+0x22c73d7]        # 0x14264bd2c
   140384955:	jmp    0x1403849b0
   140384957:	mov    edx,DWORD PTR [rip+0x22c73c3]        # 0x14264bd20
   14038495d:	jmp    0x1403849b0
   14038495f:	cmp    edi,r12d
   140384962:	jne    0x14038498c
   140384964:	cmp    ebx,r15d
   140384967:	jne    0x140384971
   140384969:	mov    edx,DWORD PTR [rip+0x22c73ad]        # 0x14264bd1c
   14038496f:	jmp    0x1403849a9
   140384971:	lea    rcx,[rip+0x22c5a78]        # 0x14264a3f0
   140384978:	cmp    ebx,esi
   14038497a:	jne    0x140384984
   14038497c:	mov    edx,DWORD PTR [rip+0x22c73b2]        # 0x14264bd34
   140384982:	jmp    0x1403849b0
   140384984:	mov    edx,DWORD PTR [rip+0x22c739e]        # 0x14264bd28
   14038498a:	jmp    0x1403849b0
   14038498c:	cmp    ebx,r15d
   14038498f:	jne    0x140384999
   140384991:	mov    edx,DWORD PTR [rip+0x22c7381]        # 0x14264bd18
   140384997:	jmp    0x1403849a9
   140384999:	cmp    ebx,esi
   14038499b:	mov    edx,DWORD PTR [rip+0x22c738f]        # 0x14264bd30
   1403849a1:	je     0x1403849a9
   1403849a3:	mov    edx,DWORD PTR [rip+0x22c737b]        # 0x14264bd24
   1403849a9:	lea    rcx,[rip+0x22c5a40]        # 0x14264a3f0
   1403849b0:	call   0x140adaad0
   1403849b5:	inc    ebx
   1403849b7:	cmp    ebx,esi
   1403849b9:	jle    0x140384910
   1403849bf:	inc    edi
   1403849c1:	cmp    edi,r12d
   1403849c4:	jle    0x140384900
   1403849ca:	xor    r8d,r8d
   1403849cd:	mov    edx,0x6
   1403849d2:	mov    r9b,0x1
   1403849d5:	lea    rcx,[rip+0x22c5a14]        # 0x14264a3f0
   1403849dc:	call   0x1400bb130
   1403849e1:	add    r15d,0x2
   1403849e5:	mov    r8d,r15d
   1403849e8:	mov    edx,0x6
   1403849ed:	lea    rcx,[rip+0x22c59fc]        # 0x14264a3f0
   1403849f4:	call   0x1400bb120
   1403849f9:	lea    rdx,[rip+0x12a5f38]        # 0x14162a938
   140384a00:	lea    rcx,[rbp+0xc0]
   140384a07:	call   0x140068150
   140384a0c:	nop
   140384a0d:	xor    r9d,r9d
   140384a10:	xor    r8d,r8d
   140384a13:	lea    rdx,[rbp+0xc0]
   140384a1a:	lea    rcx,[rip+0x22c59cf]        # 0x14264a3f0
   140384a21:	call   0x140ad9960
   140384a26:	nop
   140384a27:	lea    rcx,[rbp+0xc0]
   140384a2e:	call   0x140067e30
   140384a33:	lea    r13d,[rsi-0x2]
   140384a37:	lea    ecx,[r12-0x9]
   140384a3c:	mov    eax,0x55555556
   140384a41:	imul   ecx
   140384a43:	mov    ebx,edx
   140384a45:	shr    ebx,0x1f
   140384a48:	add    ebx,edx
   140384a4a:	mov    DWORD PTR [rbp-0x58],ebx
   140384a4d:	lea    rcx,[r14+0x8]
   140384a51:	call   0x14006ee50
   140384a56:	mov    rdi,rax
   140384a59:	mov    QWORD PTR [rbp-0x40],rax
   140384a5d:	cmp    eax,ebx
   140384a5f:	jle    0x140384a65
   140384a61:	lea    r13d,[rsi-0x4]
   140384a65:	mov    esi,0x8
   140384a6a:	mov    QWORD PTR [rbp-0x18],rsi
   140384a6e:	mov    edx,eax
   140384a70:	sub    edx,ebx
   140384a72:	cmp    DWORD PTR [r14+0x20],edx
   140384a76:	cmovle edx,DWORD PTR [r14+0x20]
   140384a7b:	xor    r12d,r12d
   140384a7e:	test   edx,edx
   140384a80:	cmovns r12d,edx
   140384a84:	lea    eax,[r12+rbx*1]
   140384a88:	mov    DWORD PTR [rbp-0x60],eax
   140384a8b:	cmp    r12d,eax
   140384a8e:	jge    0x140384cdd
   140384a94:	mov    ebx,0x1
   140384a99:	nop    DWORD PTR [rax+0x0]
   140384aa0:	cmp    r12d,edi
   140384aa3:	jge    0x140384cda
   140384aa9:	xor    r8d,r8d
   140384aac:	mov    edx,0x7
   140384ab1:	mov    r9b,0x1
   140384ab4:	lea    rcx,[rip+0x22c5935]        # 0x14264a3f0
   140384abb:	call   0x1400bb130
   140384ac0:	mov    edi,r15d
   140384ac3:	cmp    r15d,r13d
   140384ac6:	jg     0x140384bc5
   140384acc:	lea    r14d,[rsi+0x3]
   140384ad0:	mov    ebx,esi
   140384ad2:	cmp    esi,r14d
   140384ad5:	jge    0x140384bad
   140384adb:	cmp    edi,r13d
   140384ade:	jne    0x140384b4a
   140384ae0:	lea    rsi,[rip+0x22c72c9]        # 0x14264bdb0
   140384ae7:	nop    WORD PTR [rax+rax*1+0x0]
   140384af0:	mov    r8d,edi
   140384af3:	mov    edx,ebx
   140384af5:	lea    rcx,[rip+0x22c58f4]        # 0x14264a3f0
   140384afc:	call   0x1400bb120
   140384b01:	lea    rdx,[rsi-0x18]
   140384b05:	cmp    edi,r15d
   140384b08:	cmovne rdx,rsi
   140384b0c:	mov    edx,DWORD PTR [rdx]
   140384b0e:	lea    rcx,[rip+0x22c58db]        # 0x14264a3f0
   140384b15:	call   0x140adaad0
   140384b1a:	xor    edx,edx
   140384b1c:	lea    rcx,[rip+0x2048c4d]        # 0x1423cd770
   140384b23:	call   0x140071f90
   140384b28:	test   al,al
   140384b2a:	je     0x140384b3d
   140384b2c:	mov    r8b,0x1
   140384b2f:	xor    edx,edx
   140384b31:	lea    rcx,[rip+0x22c58b8]        # 0x14264a3f0
   140384b38:	call   0x1400bb190
   140384b3d:	inc    ebx
   140384b3f:	add    rsi,0x4
   140384b43:	cmp    ebx,r14d
   140384b46:	jl     0x140384af0
   140384b48:	jmp    0x140384ba9
   140384b4a:	lea    rsi,[rip+0x22c7253]        # 0x14264bda4
   140384b51:	mov    r8d,edi
   140384b54:	mov    edx,ebx
   140384b56:	lea    rcx,[rip+0x22c5893]        # 0x14264a3f0
   140384b5d:	call   0x1400bb120
   140384b62:	lea    rdx,[rsi-0xc]
   140384b66:	cmp    edi,r15d
   140384b69:	cmovne rdx,rsi
   140384b6d:	mov    edx,DWORD PTR [rdx]
   140384b6f:	lea    rcx,[rip+0x22c587a]        # 0x14264a3f0
   140384b76:	call   0x140adaad0
   140384b7b:	xor    edx,edx
   140384b7d:	lea    rcx,[rip+0x2048bec]        # 0x1423cd770
   140384b84:	call   0x140071f90
   140384b89:	test   al,al
   140384b8b:	je     0x140384b9e
   140384b8d:	mov    r8b,0x1
   140384b90:	xor    edx,edx
   140384b92:	lea    rcx,[rip+0x22c5857]        # 0x14264a3f0
   140384b99:	call   0x1400bb190
   140384b9e:	inc    ebx
   140384ba0:	add    rsi,0x4
   140384ba4:	cmp    ebx,r14d
   140384ba7:	jl     0x140384b51
   140384ba9:	mov    rsi,QWORD PTR [rbp-0x18]
   140384bad:	inc    edi
   140384baf:	cmp    edi,r13d
   140384bb2:	jle    0x140384ad0
   140384bb8:	mov    edi,esi
   140384bba:	mov    esi,0x1
   140384bbf:	mov    r14,QWORD PTR [rbp-0x80]
   140384bc3:	jmp    0x140384bc9
   140384bc5:	mov    edi,esi
   140384bc7:	mov    esi,ebx
   140384bc9:	movsxd rdx,r12d
   140384bcc:	lea    rcx,[r14+0x8]
   140384bd0:	call   0x14006f220
   140384bd5:	mov    rdx,QWORD PTR [rax]
   140384bd8:	mov    edx,DWORD PTR [rdx+0xc]
   140384bdb:	lea    rcx,[rip+0x204cc16]        # 0x1423d17f8
   140384be2:	call   0x14007daf0
   140384be7:	mov    rbx,rax
   140384bea:	lea    edx,[rdi+rsi*1]
   140384bed:	mov    r8d,r15d
   140384bf0:	lea    rcx,[rip+0x22c57f9]        # 0x14264a3f0
   140384bf7:	call   0x1400bb120
   140384bfc:	lea    rcx,[rbp+0xe0]
   140384c03:	call   0x14006f690
   140384c08:	nop
   140384c09:	mov    r9d,0xffffffff
   140384c0f:	mov    r8b,0x1
   140384c12:	lea    rdx,[rbp+0xe0]
   140384c19:	movzx  ecx,WORD PTR [rbx+0x98]
   140384c20:	call   0x140aa3bd0
   140384c25:	lea    rcx,[rbp+0xe0]
   140384c2c:	call   0x14052d650
   140384c31:	xor    r9d,r9d
   140384c34:	mov    r8b,0x3
   140384c37:	lea    rdx,[rbp+0xe0]
   140384c3e:	lea    rcx,[rip+0x22c57ab]        # 0x14264a3f0
   140384c45:	call   0x140ad9960
   140384c4a:	lea    rdx,[rip+0x1268d2b]        # 0x1415ed97c
   140384c51:	lea    rcx,[rbp+0xc0]
   140384c58:	call   0x140068150
   140384c5d:	nop
   140384c5e:	xor    r9d,r9d
   140384c61:	mov    r8b,0x3
   140384c64:	lea    rdx,[rbp+0xc0]
   140384c6b:	lea    rcx,[rip+0x22c577e]        # 0x14264a3f0
   140384c72:	call   0x140ad9960
   140384c77:	nop
   140384c78:	lea    rcx,[rbp+0xc0]
   140384c7f:	call   0x140067e30
   140384c84:	lea    rcx,[rbx+0x20]
   140384c88:	lea    rdx,[rbp+0xe0]
   140384c8f:	call   0x140a94030
   140384c94:	xor    r9d,r9d
   140384c97:	xor    r8d,r8d
   140384c9a:	lea    rdx,[rbp+0xe0]
   140384ca1:	lea    rcx,[rip+0x22c5748]        # 0x14264a3f0
   140384ca8:	call   0x140ad9960
   140384cad:	mov    rsi,QWORD PTR [rbp-0x18]
   140384cb1:	add    esi,0x3
   140384cb4:	mov    QWORD PTR [rbp-0x18],rsi
   140384cb8:	lea    rcx,[rbp+0xe0]
   140384cbf:	call   0x140067e30
   140384cc4:	inc    r12d
   140384cc7:	cmp    r12d,DWORD PTR [rbp-0x60]
   140384ccb:	mov    rdi,QWORD PTR [rbp-0x40]
   140384ccf:	mov    ebx,0x1
   140384cd4:	jl     0x140384aa0
   140384cda:	mov    ebx,DWORD PTR [rbp-0x58]
   140384cdd:	cmp    edi,ebx
   140384cdf:	jle    0x14038a518
   140384ce5:	lea    rcx,[rbp+0xc0]
   140384cec:	call   0x1400bb360
   140384cf1:	lea    eax,[rbx+0x2]
   140384cf4:	lea    ecx,[rax+rax*2]
   140384cf7:	lea    r9d,[rdi-0x1]
   140384cfb:	mov    DWORD PTR [rsp+0x30],ecx
   140384cff:	mov    DWORD PTR [rsp+0x28],0x9
   140384d07:	mov    DWORD PTR [rsp+0x20],ebx
   140384d0b:	xor    r8d,r8d
   140384d0e:	mov    edx,DWORD PTR [r14+0x20]
   140384d12:	lea    rcx,[rbp+0xc0]
   140384d19:	call   0x1400bb380
   140384d1e:	lea    r9d,[r13+0x1]
   140384d22:	mov    DWORD PTR [rsp+0x28],0x0
   140384d2a:	movzx  eax,BYTE PTR [r14+0x24]
   140384d2f:	mov    BYTE PTR [rsp+0x20],al
   140384d33:	mov    r8d,DWORD PTR [rbp+0x18]
   140384d37:	mov    edx,DWORD PTR [rbp+0x14]
   140384d3a:	lea    rcx,[rbp+0xc0]
   140384d41:	call   0x14140f4d0
   140384d46:	jmp    0x14038a518
   140384d4b:	xor    ebx,ebx
   140384d4d:	mov    r15d,0x8
   140384d53:	cmp    BYTE PTR [r14+0x37c],bl
   140384d5a:	je     0x140385603
   140384d60:	lea    r12,[r14+0xe0]
   140384d67:	mov    QWORD PTR [rbp-0x40],r12
   140384d6b:	mov    rcx,r12
   140384d6e:	call   0x14006f290
   140384d73:	lea    r13,[r14+0xf8]
   140384d7a:	mov    QWORD PTR [rbp-0x28],r13
   140384d7e:	mov    rcx,r13
   140384d81:	call   0x14006f290
   140384d86:	mov    edi,ebx
   140384d88:	mov    rcx,QWORD PTR [r14+0xb0]
   140384d8f:	add    rcx,0x128
   140384d96:	call   0x14006ee50
   140384d9b:	test   rax,rax
   140384d9e:	je     0x140384e96
   140384da4:	nop    DWORD PTR [rax+0x0]
   140384da8:	nop    DWORD PTR [rax+rax*1+0x0]
   140384db0:	mov    rcx,QWORD PTR [r14+0xb0]
   140384db7:	add    rcx,0x128
   140384dbe:	mov    rdx,rbx
   140384dc1:	call   0x14006f220
   140384dc6:	mov    rcx,QWORD PTR [rax]
   140384dc9:	cmp    WORD PTR [rcx+0x8],0x2
   140384dce:	je     0x140384e75
   140384dd4:	mov    rcx,QWORD PTR [r14+0xb0]
   140384ddb:	add    rcx,0x128
   140384de2:	mov    rdx,rbx
   140384de5:	call   0x14006f220
   140384dea:	mov    rcx,QWORD PTR [rax]
   140384ded:	mov    rax,QWORD PTR [rcx]
   140384df0:	test   BYTE PTR [rax+0x10],0x20
   140384df4:	je     0x140384e75
   140384df6:	mov    rcx,QWORD PTR [r14+0xb0]
   140384dfd:	add    rcx,0x128
   140384e04:	mov    rdx,rbx
   140384e07:	call   0x14006f220
   140384e0c:	mov    r8,QWORD PTR [r14+0xb0]
   140384e13:	mov    rax,QWORD PTR [rax]
   140384e16:	mov    rcx,QWORD PTR [rax]
   140384e19:	mov    rdx,rbx
   140384e1c:	test   DWORD PTR [rcx+0x10],0x8000
   140384e23:	lea    rcx,[r8+0x128]
   140384e2a:	je     0x140384e65
   140384e2c:	call   0x14006f220
   140384e31:	mov    rcx,QWORD PTR [rax]
   140384e34:	mov    edx,0x2d
   140384e39:	mov    rcx,QWORD PTR [rcx]
   140384e3c:	call   0x140cb1790
   140384e41:	cmp    rax,QWORD PTR [r14+0xc0]
   140384e48:	jne    0x140384e75
   140384e4a:	mov    rcx,QWORD PTR [r14+0xb0]
   140384e51:	add    rcx,0x128
   140384e58:	mov    rdx,rbx
   140384e5b:	call   0x14006f220
   140384e60:	mov    rcx,r12
   140384e63:	jmp    0x140384e6d
   140384e65:	call   0x14006f220
   140384e6a:	mov    rcx,r13
   140384e6d:	mov    rdx,QWORD PTR [rax]
   140384e70:	call   0x1400b9980
   140384e75:	inc    edi
   140384e77:	movsxd rbx,edi
   140384e7a:	mov    rcx,QWORD PTR [r14+0xb0]
   140384e81:	add    rcx,0x128
   140384e88:	call   0x14006ee50
   140384e8d:	cmp    rbx,rax
   140384e90:	jb     0x140384db0
   140384e96:	mov    rcx,r12
   140384e99:	call   0x14006ee50
   140384e9e:	test   rax,rax
   140384ea1:	je     0x140384ece
   140384ea3:	mov    rcx,r12
   140384ea6:	call   0x14006ee50
   140384eab:	mov    rbx,rax
   140384eae:	xor    edx,edx
   140384eb0:	mov    rcx,r12
   140384eb3:	call   0x14006f220
   140384eb8:	lea    r9,[rip+0xfffffffffffff8d1]        # 0x140384790
   140384ebf:	mov    r8,r15
   140384ec2:	mov    rdx,rbx
   140384ec5:	mov    rcx,rax
   140384ec8:	call   QWORD PTR [rip+0x1260e92]        # 0x1415e5d60
   140384ece:	mov    rcx,r13
   140384ed1:	call   0x14006ee50
   140384ed6:	test   rax,rax
   140384ed9:	je     0x140384f06
   140384edb:	mov    rcx,r13
   140384ede:	call   0x14006ee50
   140384ee3:	mov    rbx,rax
   140384ee6:	xor    edx,edx
   140384ee8:	mov    rcx,r13
   140384eeb:	call   0x14006f220
   140384ef0:	lea    r9,[rip+0xfffffffffffff899]        # 0x140384790
   140384ef7:	mov    r8,r15
   140384efa:	mov    rdx,rbx
   140384efd:	mov    rcx,rax
   140384f00:	call   QWORD PTR [rip+0x1260e5a]        # 0x1415e5d60
   140384f06:	lea    rsi,[r14+0x110]
   140384f0d:	mov    QWORD PTR [rbp+0x8],rsi
   140384f11:	mov    rcx,r12
   140384f14:	call   0x14006ee50
   140384f19:	mov    rdx,rax
   140384f1c:	mov    rcx,rsi
   140384f1f:	call   0x1401b9fb0
   140384f24:	mov    rcx,r12
   140384f27:	call   0x14006ee50
   140384f2c:	mov    rdx,rax
   140384f2f:	lea    rcx,[r14+0x140]
   140384f36:	call   0x14006f380
   140384f3b:	xor    ebx,ebx
   140384f3d:	mov    edi,ebx
   140384f3f:	mov    rcx,rsi
   140384f42:	call   0x1402240f0
   140384f47:	test   rax,rax
   140384f4a:	je     0x140384f84
   140384f4c:	xor    r15d,r15d
   140384f4f:	nop
   140384f50:	mov    rdx,rbx
   140384f53:	mov    rcx,rsi
   140384f56:	call   0x1401b9fa0
   140384f5b:	mov    BYTE PTR [rax],r15b
   140384f5e:	mov    rdx,rbx
   140384f61:	lea    rcx,[r14+0x140]
   140384f68:	call   0x14006f360
   140384f6d:	mov    DWORD PTR [rax],r15d
   140384f70:	inc    edi
   140384f72:	movsxd rbx,edi
   140384f75:	mov    rcx,rsi
   140384f78:	call   0x1402240f0
   140384f7d:	cmp    rbx,rax
   140384f80:	jb     0x140384f50
   140384f82:	xor    ebx,ebx
   140384f84:	mov    r15,r14
   140384f87:	lea    rsi,[r14+0x128]
   140384f8e:	mov    QWORD PTR [rbp+0x58],rsi
   140384f92:	mov    rcx,r13
   140384f95:	call   0x14006ee50
   140384f9a:	mov    rdx,rax
   140384f9d:	mov    rcx,rsi
   140384fa0:	call   0x1401b9fb0
   140384fa5:	mov    rcx,r13
   140384fa8:	call   0x14006ee50
   140384fad:	mov    rdx,rax
   140384fb0:	lea    rcx,[r14+0x158]
   140384fb7:	call   0x14006f380
   140384fbc:	mov    edi,ebx
   140384fbe:	mov    rcx,rsi
   140384fc1:	call   0x1402240f0
   140384fc6:	test   rax,rax
   140384fc9:	je     0x140385007
   140384fcb:	nop    DWORD PTR [rax+rax*1+0x0]
   140384fd0:	mov    rdx,rbx
   140384fd3:	mov    rcx,rsi
   140384fd6:	call   0x1401b9fa0
   140384fdb:	mov    BYTE PTR [rax],0x0
   140384fde:	mov    rdx,rbx
   140384fe1:	lea    rcx,[r14+0x158]
   140384fe8:	call   0x14006f360
   140384fed:	mov    DWORD PTR [rax],0x0
   140384ff3:	inc    edi
   140384ff5:	movsxd rbx,edi
   140384ff8:	mov    rcx,rsi
   140384ffb:	call   0x1402240f0
   140385000:	cmp    rbx,rax
   140385003:	jb     0x140384fd0
   140385005:	xor    ebx,ebx
   140385007:	lea    r13,[r14+0x1d8]
   14038500e:	add    r15,0x178
   140385015:	mov    QWORD PTR [rbp+0x0],0x2
   14038501d:	lea    r12,[r15-0x98]
   140385024:	nop    DWORD PTR [rax+0x0]
   140385028:	nop    DWORD PTR [rax+rax*1+0x0]
   140385030:	mov    edi,ebx
   140385032:	mov    eax,0xffffffff
   140385037:	mov    r14d,eax
   14038503a:	mov    esi,eax
   14038503c:	lea    rdx,[rbp-0x50]
   140385040:	mov    rcx,r12
   140385043:	call   0x14006f240
   140385048:	lea    rcx,[r15-0x98]
   14038504f:	lea    rdx,[rbp+0x20]
   140385053:	call   0x14006f230
   140385058:	lea    r8,[rbp+0x20]
   14038505c:	lea    rdx,[rsp+0x78]
   140385061:	lea    rcx,[rbp-0x50]
   140385065:	call   0x14006ee20
   14038506a:	xor    edx,edx
   14038506c:	movzx  ecx,BYTE PTR [rax]
   14038506f:	call   0x1400657b0
   140385074:	test   al,al
   140385076:	je     0x1403850eb
   140385078:	nop    DWORD PTR [rax+rax*1+0x0]
   140385080:	lea    rcx,[rbp-0x50]
   140385084:	call   0x14006ee10
   140385089:	mov    rbx,QWORD PTR [rax]
   14038508c:	mov    rax,QWORD PTR [rbx]
   14038508f:	mov    rcx,rbx
   140385092:	call   QWORD PTR [rax]
   140385094:	movsx  edx,ax
   140385097:	mov    rax,QWORD PTR [rbx]
   14038509a:	mov    rcx,rbx
   14038509d:	cmp    edx,r14d
   1403850a0:	je     0x1403850aa
   1403850a2:	call   QWORD PTR [rax]
   1403850a4:	movsx  r14d,ax
   1403850a8:	jmp    0x1403850b4
   1403850aa:	call   QWORD PTR [rax+0x8]
   1403850ad:	movsx  ecx,ax
   1403850b0:	cmp    ecx,esi
   1403850b2:	je     0x1403850c2
   1403850b4:	mov    rax,QWORD PTR [rbx]
   1403850b7:	mov    rcx,rbx
   1403850ba:	call   QWORD PTR [rax+0x8]
   1403850bd:	inc    edi
   1403850bf:	movsx  esi,ax
   1403850c2:	lea    rcx,[rbp-0x50]
   1403850c6:	call   0x14006ee00
   1403850cb:	lea    r8,[rbp+0x20]
   1403850cf:	lea    rdx,[rsp+0x78]
   1403850d4:	lea    rcx,[rbp-0x50]
   1403850d8:	call   0x14006ee20
   1403850dd:	xor    edx,edx
   1403850df:	movzx  ecx,BYTE PTR [rax]
   1403850e2:	call   0x1400657b0
   1403850e7:	test   al,al
   1403850e9:	jne    0x140385080
   1403850eb:	movsxd r14,edi
   1403850ee:	mov    rdx,r14
   1403850f1:	mov    rcx,r15
   1403850f4:	call   0x14006f380
   1403850f9:	lea    rbx,[r15+0x30]
   1403850fd:	mov    rdx,r14
   140385100:	mov    rcx,rbx
   140385103:	call   0x14006f380
   140385108:	xor    r8d,r8d
   14038510b:	mov    rdx,r14
   14038510e:	mov    rcx,r13
   140385111:	call   0x140283ec0
   140385116:	lea    rdx,[rbp-0x18]
   14038511a:	mov    rcx,r15
   14038511d:	call   0x14006f240
   140385122:	lea    rdx,[rbp+0x60]
   140385126:	mov    rcx,r15
   140385129:	call   0x14006f230
   14038512e:	lea    rdx,[rbp+0x28]
   140385132:	mov    rcx,rbx
   140385135:	call   0x14006f240
   14038513a:	lea    rdx,[rbp+0x80]
   140385141:	mov    rcx,r13
   140385144:	call   0x14013be70
   140385149:	mov    eax,0xffffffff
   14038514e:	mov    esi,eax
   140385150:	mov    edi,eax
   140385152:	lea    rcx,[r15-0x98]
   140385159:	lea    rdx,[rbp+0x78]
   14038515d:	call   0x14006f240
   140385162:	mov    rcx,QWORD PTR [rax]
   140385165:	mov    QWORD PTR [rbp-0x50],rcx
   140385169:	lea    r8,[rbp+0x20]
   14038516d:	lea    rdx,[rsp+0x70]
   140385172:	lea    rcx,[rbp-0x50]
   140385176:	call   0x14006ee20
   14038517b:	xor    edx,edx
   14038517d:	movzx  ecx,BYTE PTR [rax]
   140385180:	call   0x1400657b0
   140385185:	test   al,al
   140385187:	je     0x140385277
   14038518d:	nop    DWORD PTR [rax]
   140385190:	lea    rcx,[rbp-0x50]
   140385194:	call   0x14006ee10
   140385199:	mov    rbx,QWORD PTR [rax]
   14038519c:	mov    rax,QWORD PTR [rbx]
   14038519f:	mov    rcx,rbx
   1403851a2:	call   QWORD PTR [rax]
   1403851a4:	movsx  edx,ax
   1403851a7:	mov    rax,QWORD PTR [rbx]
   1403851aa:	mov    rcx,rbx
   1403851ad:	cmp    edx,esi
   1403851af:	je     0x1403851df
   1403851b1:	call   QWORD PTR [rax]
   1403851b3:	movsx  esi,ax
   1403851b6:	mov    rax,QWORD PTR [rbx]
   1403851b9:	mov    rcx,rbx
   1403851bc:	call   QWORD PTR [rax+0x8]
   1403851bf:	movsx  edi,ax
   1403851c2:	lea    rcx,[rbp-0x18]
   1403851c6:	call   0x14006ee10
   1403851cb:	mov    DWORD PTR [rax],esi
   1403851cd:	lea    rcx,[rbp+0x28]
   1403851d1:	call   0x14006ee10
   1403851d6:	lea    rdx,[rbp+0x160]
   1403851dd:	jmp    0x140385210
   1403851df:	call   QWORD PTR [rax+0x8]
   1403851e2:	movsx  ecx,ax
   1403851e5:	cmp    ecx,edi
   1403851e7:	je     0x140385246
   1403851e9:	mov    rax,QWORD PTR [rbx]
   1403851ec:	mov    rcx,rbx
   1403851ef:	call   QWORD PTR [rax+0x8]
   1403851f2:	movsx  edi,ax
   1403851f5:	lea    rcx,[rbp-0x18]
   1403851f9:	call   0x14006ee10
   1403851fe:	mov    DWORD PTR [rax],esi
   140385200:	lea    rcx,[rbp+0x28]
   140385204:	call   0x14006ee10
   140385209:	lea    rdx,[rbp+0xb0]
   140385210:	mov    DWORD PTR [rax],edi
   140385212:	lea    rcx,[rbp+0x80]
   140385219:	call   0x14013bd10
   14038521e:	mov    dl,0x1
   140385220:	mov    rcx,rax
   140385223:	call   0x14013bcb0
   140385228:	lea    rcx,[rbp-0x18]
   14038522c:	call   0x14006f350
   140385231:	lea    rcx,[rbp+0x28]
   140385235:	call   0x14006f350
   14038523a:	lea    rcx,[rbp+0x80]
   140385241:	call   0x14013bce0
   140385246:	lea    rcx,[rbp-0x50]
   14038524a:	call   0x14006ee00
   14038524f:	lea    r8,[rbp+0x20]
   140385253:	lea    rdx,[rsp+0x70]
   140385258:	lea    rcx,[rbp-0x50]
   14038525c:	call   0x14006ee20
   140385261:	xor    edx,edx
   140385263:	movzx  ecx,BYTE PTR [rax]
   140385266:	call   0x1400657b0
   14038526b:	test   al,al
   14038526d:	jne    0x140385190
   140385273:	lea    rbx,[r15+0x30]
   140385277:	lea    rcx,[r15+0xa0]
   14038527e:	mov    rdx,r15
   140385281:	call   0x140071fd0
   140385286:	lea    rcx,[r15+0xd0]
   14038528d:	mov    rdx,rbx
   140385290:	call   0x140071fd0
   140385295:	lea    rcx,[r13+0xa0]
   14038529c:	mov    rdx,r13
   14038529f:	call   0x140221450
   1403852a4:	xor    r8d,r8d
   1403852a7:	mov    rdx,r14
   1403852aa:	lea    rcx,[r13+0xe0]
   1403852b1:	call   0x140283ec0
   1403852b6:	mov    rdx,r14
   1403852b9:	lea    rcx,[r15+0x180]
   1403852c0:	call   0x14006f380
   1403852c5:	lea    rcx,[r13+0xe0]
   1403852cc:	call   0x140284e80
   1403852d1:	lea    rcx,[r15+0x180]
   1403852d8:	call   0x1400fb580
   1403852dd:	add    r13,0x20
   1403852e1:	add    r15,0x18
   1403852e5:	sub    QWORD PTR [rbp+0x0],0x1
   1403852ea:	lea    r12,[r12+0x18]
   1403852ef:	mov    ebx,0x0
   1403852f4:	jne    0x140385030
   1403852fa:	mov    r15d,ebx
   1403852fd:	mov    r12,QWORD PTR [rbp-0x40]
   140385301:	mov    rcx,r12
   140385304:	call   0x14006ee50
   140385309:	test   rax,rax
   14038530c:	mov    r13,QWORD PTR [rbp-0x28]
   140385310:	je     0x140385450
   140385316:	mov    edi,ebx
   140385318:	mov    rsi,QWORD PTR [rbp-0x80]
   14038531c:	add    rsi,0xe0
   140385323:	mov    r13,QWORD PTR [rbp+0x8]
   140385327:	nop    WORD PTR [rax+rax*1+0x0]
   140385330:	mov    rdx,rdi
   140385333:	mov    rcx,rsi
   140385336:	call   0x14006f220
   14038533b:	mov    rcx,QWORD PTR [rax]
   14038533e:	mov    rax,QWORD PTR [rcx]
   140385341:	call   QWORD PTR [rax]
   140385343:	cmp    ax,0x20
   140385347:	jne    0x140385435
   14038534d:	mov    r14d,ebx
   140385350:	mov    rdx,rdi
   140385353:	mov    rcx,rsi
   140385356:	call   0x14006f220
   14038535b:	mov    rcx,QWORD PTR [rax]
   14038535e:	add    rcx,0x38
   140385362:	call   0x14006ee50
   140385367:	test   rax,rax
   14038536a:	je     0x140385435
   140385370:	mov    rdx,rdi
   140385373:	mov    rcx,rsi
   140385376:	call   0x14006f220
   14038537b:	mov    rcx,QWORD PTR [rax]
   14038537e:	add    rcx,0x38
   140385382:	mov    rdx,rbx
   140385385:	call   0x14006f220
   14038538a:	mov    rcx,QWORD PTR [rax]
   14038538d:	mov    rax,QWORD PTR [rcx]
   140385390:	call   QWORD PTR [rax+0x10]
   140385393:	cmp    eax,0xa
   140385396:	jne    0x14038540d
   140385398:	mov    rdx,rdi
   14038539b:	mov    rcx,rsi
   14038539e:	call   0x14006f220
   1403853a3:	mov    rcx,QWORD PTR [rax]
   1403853a6:	add    rcx,0x38
   1403853aa:	mov    rdx,rbx
   1403853ad:	call   0x14006f220
   1403853b2:	mov    rcx,QWORD PTR [rax]
   1403853b5:	mov    rax,QWORD PTR [rcx]
   1403853b8:	call   QWORD PTR [rax+0x18]
   1403853bb:	mov    QWORD PTR [rbp-0x40],rax
   1403853bf:	test   rax,rax
   1403853c2:	je     0x14038540d
   1403853c4:	lea    eax,[r15+0x1]
   1403853c8:	movsxd rbx,eax
   1403853cb:	lea    r8,[rbp-0x40]
   1403853cf:	mov    rdx,rbx
   1403853d2:	mov    rcx,r12
   1403853d5:	call   0x1401b9f20
   1403853da:	mov    BYTE PTR [rsp+0x70],0x2
   1403853df:	lea    r8,[rsp+0x70]
   1403853e4:	mov    rdx,rbx
   1403853e7:	mov    rcx,r13
   1403853ea:	call   0x140283e40
   1403853ef:	mov    DWORD PTR [rbp-0x30],0x0
   1403853f6:	lea    r8,[rbp-0x30]
   1403853fa:	mov    rdx,rbx
   1403853fd:	mov    rcx,QWORD PTR [rbp-0x80]
   140385401:	add    rcx,0x140
   140385408:	call   0x1400b9a10
   14038540d:	inc    r14d
   140385410:	mov    rdx,rdi
   140385413:	mov    rcx,rsi
   140385416:	call   0x14006f220
   14038541b:	movsxd rbx,r14d
   14038541e:	mov    rcx,QWORD PTR [rax]
   140385421:	add    rcx,0x38
   140385425:	call   0x14006ee50
   14038542a:	cmp    rbx,rax
   14038542d:	jb     0x140385370
   140385433:	xor    ebx,ebx
   140385435:	inc    r15d
   140385438:	movsxd rdi,r15d
   14038543b:	mov    rcx,r12
   14038543e:	call   0x14006ee50
   140385443:	cmp    rdi,rax
   140385446:	jb     0x140385330
   14038544c:	mov    r13,QWORD PTR [rbp-0x28]
   140385450:	mov    r15d,ebx
   140385453:	mov    rcx,r13
   140385456:	call   0x14006ee50
   14038545b:	test   rax,rax
   14038545e:	je     0x14038559c
   140385464:	mov    rdi,rbx
   140385467:	mov    rsi,QWORD PTR [rbp-0x80]
   14038546b:	add    rsi,0xf8
   140385472:	mov    r12,QWORD PTR [rbp+0x58]
   140385476:	data16 nop WORD PTR [rax+rax*1+0x0]
   140385480:	mov    rdx,rdi
   140385483:	mov    rcx,rsi
   140385486:	call   0x14006f220
   14038548b:	mov    rcx,QWORD PTR [rax]
   14038548e:	mov    rax,QWORD PTR [rcx]
   140385491:	call   QWORD PTR [rax]
   140385493:	cmp    ax,0x20
   140385497:	jne    0x140385585
   14038549d:	mov    r14d,ebx
   1403854a0:	mov    rdx,rdi
   1403854a3:	mov    rcx,rsi
   1403854a6:	call   0x14006f220
   1403854ab:	mov    rcx,QWORD PTR [rax]
   1403854ae:	add    rcx,0x38
   1403854b2:	call   0x14006ee50
   1403854b7:	test   rax,rax
   1403854ba:	je     0x140385585
   1403854c0:	mov    rdx,rdi
   1403854c3:	mov    rcx,rsi
   1403854c6:	call   0x14006f220
   1403854cb:	mov    rcx,QWORD PTR [rax]
   1403854ce:	add    rcx,0x38
   1403854d2:	mov    rdx,rbx
   1403854d5:	call   0x14006f220
   1403854da:	mov    rcx,QWORD PTR [rax]
   1403854dd:	mov    rax,QWORD PTR [rcx]
   1403854e0:	call   QWORD PTR [rax+0x10]
   1403854e3:	cmp    eax,0xa
   1403854e6:	jne    0x14038555d
   1403854e8:	mov    rdx,rdi
   1403854eb:	mov    rcx,rsi
   1403854ee:	call   0x14006f220
   1403854f3:	mov    rcx,QWORD PTR [rax]
   1403854f6:	add    rcx,0x38
   1403854fa:	mov    rdx,rbx
   1403854fd:	call   0x14006f220
   140385502:	mov    rcx,QWORD PTR [rax]
   140385505:	mov    rax,QWORD PTR [rcx]
   140385508:	call   QWORD PTR [rax+0x18]
   14038550b:	mov    QWORD PTR [rbp-0x40],rax
   14038550f:	test   rax,rax
   140385512:	je     0x14038555d
   140385514:	lea    eax,[r15+0x1]
   140385518:	movsxd rbx,eax
   14038551b:	lea    r8,[rbp-0x40]
   14038551f:	mov    rdx,rbx
   140385522:	mov    rcx,r13
   140385525:	call   0x1401b9f20
   14038552a:	mov    BYTE PTR [rsp+0x70],0x2
   14038552f:	lea    r8,[rsp+0x70]
   140385534:	mov    rdx,rbx
   140385537:	mov    rcx,r12
   14038553a:	call   0x140283e40
   14038553f:	mov    DWORD PTR [rbp-0x30],0x0
   140385546:	lea    r8,[rbp-0x30]
   14038554a:	mov    rdx,rbx
   14038554d:	mov    rcx,QWORD PTR [rbp-0x80]
   140385551:	add    rcx,0x158
   140385558:	call   0x1400b9a10
   14038555d:	inc    r14d
   140385560:	mov    rdx,rdi
   140385563:	mov    rcx,rsi
   140385566:	call   0x14006f220
   14038556b:	movsxd rbx,r14d
   14038556e:	mov    rcx,QWORD PTR [rax]
   140385571:	add    rcx,0x38
   140385575:	call   0x14006ee50
   14038557a:	cmp    rbx,rax
   14038557d:	jb     0x1403854c0
   140385583:	xor    ebx,ebx
   140385585:	inc    r15d
   140385588:	movsxd rdi,r15d
   14038558b:	mov    rcx,r13
   14038558e:	call   0x14006ee50
   140385593:	cmp    rdi,rax
   140385596:	jb     0x140385480
   14038559c:	xor    edx,edx
   14038559e:	mov    r14,QWORD PTR [rbp-0x80]
   1403855a2:	mov    rcx,r14
   1403855a5:	call   0x14037c780
   1403855aa:	mov    BYTE PTR [r14+0x330],0x0
   1403855b2:	mov    DWORD PTR [r14+0x328],ebx
   1403855b9:	xor    edx,edx
   1403855bb:	mov    rcx,r14
   1403855be:	call   0x14037acc0
   1403855c3:	mov    ebx,0x1
   1403855c8:	mov    edx,ebx
   1403855ca:	mov    rcx,r14
   1403855cd:	call   0x14037c780
   1403855d2:	mov    BYTE PTR [r14+0x331],0x0
   1403855da:	mov    DWORD PTR [r14+0x32c],0x0
   1403855e5:	mov    edx,ebx
   1403855e7:	mov    rcx,r14
   1403855ea:	call   0x14037acc0
   1403855ef:	mov    BYTE PTR [r14+0x37c],0x0
   1403855f7:	mov    r12d,DWORD PTR [rbp-0x58]
   1403855fb:	xor    ebx,ebx
   1403855fd:	mov    r15d,0x8
   140385603:	cmp    BYTE PTR [r14+0x37d],0x0
   14038560b:	je     0x1403857c0
   140385611:	mov    BYTE PTR [r14+0x37d],0x0
   140385619:	cmp    QWORD PTR [r14+0xd8],0x0
   140385621:	je     0x1403857c0
   140385627:	mov    r14d,ebx
   14038562a:	mov    r13,QWORD PTR [rbp-0x80]
   14038562e:	lea    rcx,[r13+0xe0]
   140385635:	call   0x14006ee50
   14038563a:	test   rax,rax
   14038563d:	je     0x140385738
   140385643:	mov    rdi,rbx
   140385646:	mov    r12d,0x32
   14038564c:	nop    DWORD PTR [rax+0x0]
   140385650:	mov    rbx,QWORD PTR [r13+0xb8]
   140385657:	mov    rdx,rdi
   14038565a:	lea    rcx,[r13+0xe0]
   140385661:	call   0x14006f220
   140385666:	mov    rcx,QWORD PTR [rax]
   140385669:	lea    rdx,[rbx+0x2100]
   140385670:	mov    ecx,DWORD PTR [rcx+0x1c]
   140385673:	call   0x1400e1420
   140385678:	cmp    eax,0xffffffff
   14038567b:	jne    0x140385717
   140385681:	mov    rdx,rdi
   140385684:	lea    rcx,[r13+0xe0]
   14038568b:	call   0x14006f220
   140385690:	mov    r8,QWORD PTR [r13+0xc0]
   140385697:	mov    rdx,QWORD PTR [r13+0xb8]
   14038569e:	mov    rcx,QWORD PTR [rax]
   1403856a1:	call   0x140c66c30
   1403856a6:	mov    ecx,eax
   1403856a8:	mov    eax,0x66666667
   1403856ad:	imul   ecx
   1403856af:	sar    edx,0x2
   1403856b2:	mov    ebx,edx
   1403856b4:	shr    ebx,0x1f
   1403856b7:	inc    edx
   1403856b9:	add    ebx,edx
   1403856bb:	cmp    ebx,r12d
   1403856be:	cmovg  ebx,r12d
   1403856c2:	mov    edx,0x49
   1403856c7:	mov    r8d,ebx
   1403856ca:	mov    rcx,QWORD PTR [r13+0xd8]
   1403856d1:	call   0x14133baf0
   1403856d6:	lea    r8d,[rbx+rbx*2]
   1403856da:	add    r8d,r8d
   1403856dd:	mov    edx,0x49
   1403856e2:	mov    rcx,QWORD PTR [r13+0xd8]
   1403856e9:	call   0x1413d5020
   1403856ee:	mov    rbx,QWORD PTR [r13+0xb8]
   1403856f5:	mov    rdx,rdi
   1403856f8:	lea    rcx,[r13+0xe0]
   1403856ff:	call   0x14006f220
   140385704:	mov    rdx,QWORD PTR [rax]
   140385707:	add    rdx,0x1c
   14038570b:	lea    rcx,[rbx+0x2100]
   140385712:	call   0x14006f410
   140385717:	inc    r14d
   14038571a:	movsxd rdi,r14d
   14038571d:	lea    rcx,[r13+0xe0]
   140385724:	call   0x14006ee50
   140385729:	cmp    rdi,rax
   14038572c:	jb     0x140385650
   140385732:	mov    r12d,DWORD PTR [rbp-0x58]
   140385736:	xor    ebx,ebx
   140385738:	mov    r14d,ebx
   14038573b:	lea    rcx,[r13+0xf8]
   140385742:	call   0x14006ee50
   140385747:	test   rax,rax
   14038574a:	je     0x1403857bd
   14038574c:	mov    rdi,rbx
   14038574f:	nop
   140385750:	mov    rbx,QWORD PTR [r13+0xb8]
   140385757:	mov    rdx,rdi
   14038575a:	lea    rcx,[r13+0xf8]
   140385761:	call   0x14006f220
   140385766:	mov    rcx,QWORD PTR [rax]
   140385769:	lea    rdx,[rbx+0x2100]
   140385770:	mov    ecx,DWORD PTR [rcx+0x1c]
   140385773:	call   0x1400e1420
   140385778:	cmp    eax,0xffffffff
   14038577b:	jne    0x1403857a6
   14038577d:	mov    rbx,QWORD PTR [r13+0xb8]
   140385784:	mov    rdx,rdi
   140385787:	lea    rcx,[r13+0xf8]
   14038578e:	call   0x14006f220
   140385793:	mov    rdx,QWORD PTR [rax]
   140385796:	add    rdx,0x1c
   14038579a:	lea    rcx,[rbx+0x2100]
   1403857a1:	call   0x14006f410
   1403857a6:	inc    r14d
   1403857a9:	movsxd rdi,r14d
   1403857ac:	lea    rcx,[r13+0xf8]
   1403857b3:	call   0x14006ee50
   1403857b8:	cmp    rdi,rax
   1403857bb:	jb     0x140385750
   1403857bd:	mov    r14,r13
   1403857c0:	mov    edi,0x5
   1403857c5:	mov    r13d,0xa
   1403857cb:	cmp    WORD PTR [r14+0x37a],0xffff
   1403857d4:	jne    0x140385804
   1403857d6:	lea    rcx,[r14+0x3c0]
   1403857dd:	call   0x14006ee50
   1403857e2:	test   rax,rax
   1403857e5:	je     0x140385804
   1403857e7:	lea    rcx,[r14+0x3c0]
   1403857ee:	call   0x14006ee50
   1403857f3:	xor    ecx,ecx
   1403857f5:	add    eax,0xfffffffe
   1403857f8:	cmovns ecx,eax
   1403857fb:	cmp    ecx,edi
   1403857fd:	cmovg  ecx,edi
   140385800:	lea    r13d,[rcx+0xa]
   140385804:	lea    r8d,[r12-0x6]
   140385809:	mov    DWORD PTR [rbp-0x20],r8d
   14038580d:	mov    esi,DWORD PTR [rbp+0x10]
   140385810:	mov    eax,esi
   140385812:	sub    eax,DWORD PTR [rbp-0x78]
   140385815:	inc    eax
   140385817:	cdq
   140385818:	sub    eax,edx
   14038581a:	sar    eax,1
   14038581c:	add    eax,DWORD PTR [rbp-0x78]
   14038581f:	mov    DWORD PTR [rbp-0x48],eax
   140385822:	lea    eax,[r13+0x2]
   140385826:	mov    DWORD PTR [rbp-0x70],eax
   140385829:	lea    ecx,[r8-0x2]
   14038582d:	sub    ecx,eax
   14038582f:	inc    ecx
   140385831:	mov    eax,0x55555556
   140385836:	imul   ecx
   140385838:	mov    ecx,edx
   14038583a:	shr    ecx,0x1f
   14038583d:	add    ecx,edx
   14038583f:	mov    DWORD PTR [rbp+0x40],ecx
   140385842:	dec    ecx
   140385844:	lea    eax,[rcx+rcx*2]
   140385847:	mov    DWORD PTR [rbp+0x30],eax
   14038584a:	xor    r8d,r8d
   14038584d:	mov    edx,0x7
   140385852:	mov    r9b,0x1
   140385855:	lea    rcx,[rip+0x22c4b94]        # 0x14264a3f0
   14038585c:	call   0x1400bb130
   140385861:	mov    edi,0x4
   140385866:	cmp    r12d,edi
   140385869:	jl     0x140385980
   14038586f:	mov    eax,DWORD PTR [rbp-0x78]
   140385872:	mov    ebx,eax
   140385874:	cmp    eax,esi
   140385876:	jg     0x14038596b
   14038587c:	mov    r14d,DWORD PTR [rbp-0x78]
   140385880:	mov    r8d,ebx
   140385883:	mov    edx,edi
   140385885:	lea    rcx,[rip+0x22c4b64]        # 0x14264a3f0
   14038588c:	call   0x1400bb120
   140385891:	xor    r8d,r8d
   140385894:	xor    edx,edx
   140385896:	lea    rcx,[rip+0x22c4b53]        # 0x14264a3f0
   14038589d:	call   0x1400bb190
   1403858a2:	cmp    edi,0x4
   1403858a5:	jne    0x1403858d8
   1403858a7:	cmp    ebx,r14d
   1403858aa:	jne    0x1403858b7
   1403858ac:	mov    edx,DWORD PTR [rip+0x22c6462]        # 0x14264bd14
   1403858b2:	jmp    0x140385952
   1403858b7:	lea    rcx,[rip+0x22c4b32]        # 0x14264a3f0
   1403858be:	cmp    ebx,esi
   1403858c0:	jne    0x1403858cd
   1403858c2:	mov    edx,DWORD PTR [rip+0x22c6464]        # 0x14264bd2c
   1403858c8:	jmp    0x140385959
   1403858cd:	mov    edx,DWORD PTR [rip+0x22c644d]        # 0x14264bd20
   1403858d3:	jmp    0x140385959
   1403858d8:	cmp    edi,r12d
   1403858db:	jne    0x140385905
   1403858dd:	cmp    ebx,r14d
   1403858e0:	jne    0x1403858ea
   1403858e2:	mov    edx,DWORD PTR [rip+0x22c6434]        # 0x14264bd1c
   1403858e8:	jmp    0x140385952
   1403858ea:	lea    rcx,[rip+0x22c4aff]        # 0x14264a3f0
   1403858f1:	cmp    ebx,esi
   1403858f3:	jne    0x1403858fd
   1403858f5:	mov    edx,DWORD PTR [rip+0x22c6439]        # 0x14264bd34
   1403858fb:	jmp    0x140385959
   1403858fd:	mov    edx,DWORD PTR [rip+0x22c6425]        # 0x14264bd28
   140385903:	jmp    0x140385959
   140385905:	cmp    ebx,r14d
   140385908:	jne    0x140385912
   14038590a:	mov    edx,DWORD PTR [rip+0x22c6408]        # 0x14264bd18
   140385910:	jmp    0x140385952
   140385912:	cmp    ebx,esi
   140385914:	jne    0x14038591e
   140385916:	mov    edx,DWORD PTR [rip+0x22c6414]        # 0x14264bd30
   14038591c:	jmp    0x140385952
   14038591e:	lea    eax,[r13+0x1]
   140385922:	cmp    edi,eax
   140385924:	je     0x14038594c
   140385926:	lea    ecx,[r12-0x7]
   14038592b:	cmp    edi,ecx
   14038592d:	je     0x14038594c
   14038592f:	cmp    ebx,DWORD PTR [rbp-0x48]
   140385932:	jne    0x140385944
   140385934:	cmp    edi,eax
   140385936:	jle    0x140385944
   140385938:	cmp    edi,ecx
   14038593a:	jge    0x140385944
   14038593c:	mov    edx,DWORD PTR [rip+0x22c63d6]        # 0x14264bd18
   140385942:	jmp    0x140385952
   140385944:	mov    edx,DWORD PTR [rip+0x22c63da]        # 0x14264bd24
   14038594a:	jmp    0x140385952
   14038594c:	mov    edx,DWORD PTR [rip+0x22c63ce]        # 0x14264bd20
   140385952:	lea    rcx,[rip+0x22c4a97]        # 0x14264a3f0
   140385959:	call   0x140adaad0
   14038595e:	inc    ebx
   140385960:	cmp    ebx,esi
   140385962:	jle    0x140385880
   140385968:	mov    eax,r14d
   14038596b:	inc    edi
   14038596d:	cmp    edi,r12d
   140385970:	jle    0x140385872
   140385976:	mov    r15d,0x8
   14038597c:	mov    r14,QWORD PTR [rbp-0x80]
   140385980:	cmp    BYTE PTR [r14+0xc8],0x0
   140385988:	jne    0x14038a232
   14038598e:	cmp    BYTE PTR [r14+0xc9],0x0
   140385996:	je     0x14038a232
   14038599c:	cmp    QWORD PTR [r14+0xd0],0x0
   1403859a4:	je     0x140386557
   1403859aa:	xor    edx,edx
   1403859ac:	lea    rcx,[rip+0x2047dbd]        # 0x1423cd770
   1403859b3:	call   0x140071f90
   1403859b8:	test   al,al
   1403859ba:	je     0x140385ad9
   1403859c0:	lea    rcx,[rbp+0xc0]
   1403859c7:	call   0x14006f690
   1403859cc:	nop
   1403859cd:	mov    r8,QWORD PTR [r14+0xd0]
   1403859d4:	lea    rax,[rsp+0x70]
   1403859d9:	mov    QWORD PTR [rsp+0x50],rax
   1403859de:	mov    QWORD PTR [rsp+0x48],0x0
   1403859e7:	mov    QWORD PTR [rsp+0x40],r8
   1403859ec:	mov    DWORD PTR [rsp+0x38],0x800
   1403859f4:	movzx  eax,WORD PTR [r8+0xa0]
   1403859fc:	mov    WORD PTR [rsp+0x30],ax
   140385a01:	mov    eax,0xffffffff
   140385a06:	mov    WORD PTR [rsp+0x28],ax
   140385a0b:	mov    WORD PTR [rsp+0x20],ax
   140385a10:	movzx  r9d,WORD PTR [r8+0x12c]
   140385a18:	movzx  r8d,WORD PTR [r8+0xa4]
   140385a20:	lea    rdx,[rbp+0xc0]
   140385a27:	lea    rcx,[rip+0x216701a]        # 0x1424eca48
   140385a2e:	call   0x1400f26e0
   140385a33:	mov    ebx,eax
   140385a35:	lea    rcx,[rip+0x22c49b4]        # 0x14264a3f0
   140385a3c:	cmp    BYTE PTR [rsp+0x70],0x0
   140385a41:	je     0x140385a87
   140385a43:	mov    r15d,DWORD PTR [rbp-0x78]
   140385a47:	lea    r8d,[r15+0x1]
   140385a4b:	mov    edx,0x5
   140385a50:	call   0x1400bb120
   140385a55:	test   ebx,ebx
   140385a57:	je     0x140385acb
   140385a59:	mov    BYTE PTR [rsp+0x30],0x0
   140385a5e:	mov    DWORD PTR [rsp+0x28],0x3
   140385a66:	mov    DWORD PTR [rsp+0x20],0x5
   140385a6e:	mov    r9d,0x6
   140385a74:	xor    r8d,r8d
   140385a77:	mov    edx,ebx
   140385a79:	lea    rcx,[rip+0x22c4970]        # 0x14264a3f0
   140385a80:	call   0x140adad70
   140385a85:	jmp    0x140385acb
   140385a87:	mov    r8d,DWORD PTR [rbp-0x78]
   140385a8b:	add    r8d,0x5
   140385a8f:	mov    edx,r15d
   140385a92:	call   0x1400bb120
   140385a97:	test   ebx,ebx
   140385a99:	je     0x140385ac7
   140385a9b:	mov    BYTE PTR [rsp+0x30],0x0
   140385aa0:	mov    DWORD PTR [rsp+0x28],0x3
   140385aa8:	mov    DWORD PTR [rsp+0x20],0x5
   140385ab0:	mov    r9d,0x2
   140385ab6:	mov    r8d,r9d
   140385ab9:	mov    edx,ebx
   140385abb:	lea    rcx,[rip+0x22c492e]        # 0x14264a3f0
   140385ac2:	call   0x140adad70
   140385ac7:	mov    r15d,DWORD PTR [rbp-0x78]
   140385acb:	lea    rcx,[rbp+0xc0]
   140385ad2:	call   0x140067e30
   140385ad7:	jmp    0x140385b26
   140385ad9:	mov    r15d,DWORD PTR [rbp-0x78]
   140385add:	lea    r8d,[r15+0x7]
   140385ae1:	mov    edx,0x9
   140385ae6:	lea    rcx,[rip+0x22c4903]        # 0x14264a3f0
   140385aed:	call   0x1400bb120
   140385af2:	xor    edx,edx
   140385af4:	xor    r9d,r9d
   140385af7:	mov    r8b,0x1
   140385afa:	mov    rcx,QWORD PTR [r14+0xd0]
   140385b01:	call   0x141333bc0
   140385b06:	mov    rcx,QWORD PTR [r14+0xd0]
   140385b0d:	mov    rax,QWORD PTR [rcx]
   140385b10:	xor    edx,edx
   140385b12:	call   QWORD PTR [rax]
   140385b14:	movzx  edx,al
   140385b17:	mov    r8b,0x1
   140385b1a:	lea    rcx,[rip+0x22c48cf]        # 0x14264a3f0
   140385b21:	call   0x1400bb190
   140385b26:	lea    rcx,[rbp+0x160]
   140385b2d:	call   0x14006f690
   140385b32:	nop
   140385b33:	xor    r8d,r8d
   140385b36:	lea    rdx,[rbp+0x160]
   140385b3d:	mov    rcx,QWORD PTR [r14+0xd0]
   140385b44:	call   0x141330c30
   140385b49:	xor    edx,edx
   140385b4b:	xor    r9d,r9d
   140385b4e:	mov    r8b,0x1
   140385b51:	mov    rcx,QWORD PTR [r14+0xd0]
   140385b58:	call   0x141333bc0
   140385b5d:	lea    r14d,[r15+0xd]
   140385b61:	mov    r8d,r14d
   140385b64:	mov    edx,0x5
   140385b69:	lea    rcx,[rip+0x22c4880]        # 0x14264a3f0
   140385b70:	call   0x1400bb120
   140385b75:	xor    r9d,r9d
   140385b78:	xor    r8d,r8d
   140385b7b:	lea    rdx,[rbp+0x160]
   140385b82:	lea    rcx,[rip+0x22c4867]        # 0x14264a3f0
   140385b89:	call   0x140ad9960
   140385b8e:	xor    r12b,r12b
   140385b91:	mov    rbx,QWORD PTR [rbp-0x80]
   140385b95:	mov    rcx,QWORD PTR [rbx+0xd8]
   140385b9c:	test   rcx,rcx
   140385b9f:	je     0x140385bb9
   140385ba1:	mov    dx,0x48
   140385ba5:	call   0x14133e7a0
   140385baa:	movzx  r12d,r12b
   140385bae:	test   eax,eax
   140385bb0:	mov    eax,0x1
   140385bb5:	cmovg  r12d,eax
   140385bb9:	mov    edi,0x7
   140385bbe:	lea    rsi,[rbx+0x3c0]
   140385bc5:	mov    rcx,rsi
   140385bc8:	cmp    WORD PTR [rbx+0x37a],0xffff
   140385bd0:	je     0x14038628d
   140385bd6:	call   0x14014d6e0
   140385bdb:	lea    rcx,[rbp+0x140]
   140385be2:	call   0x140065b00
   140385be7:	nop
   140385be8:	lea    rdx,[rip+0x1263b29]        # 0x1415e9718
   140385bef:	lea    rcx,[rbp+0x100]
   140385bf6:	call   0x140068150
   140385bfb:	nop
   140385bfc:	mov    r14,QWORD PTR [rbp-0x80]
   140385c00:	movsx  rax,WORD PTR [r14+0x37a]
   140385c08:	cmp    eax,0x1c
   140385c0b:	ja     0x1403861b9
   140385c11:	lea    rdx,[rip+0xffffffffffc7a3e8]        # 0x140000000
   140385c18:	mov    ecx,DWORD PTR [rdx+rax*4+0x38a53c]
   140385c1f:	add    rcx,rdx
   140385c22:	jmp    rcx
   140385c24:	mov    rcx,QWORD PTR [r14+0xc0]
   140385c2b:	mov    eax,DWORD PTR [rip+0x200da3f]        # 0x142393670
   140385c31:	cmp    DWORD PTR [rcx+0x4],eax
   140385c34:	jne    0x140385c67
   140385c36:	lea    rdx,[rip+0x12a4b63]        # 0x14162a7a0
   140385c3d:	lea    rax,[rip+0x12a4b34]        # 0x14162a778
   140385c44:	cmp    BYTE PTR [rip+0x200b68f],0x0        # 0x1423912da
   140385c4b:	cmove  rdx,rax
   140385c4f:	lea    rcx,[rbp+0x100]
   140385c56:	call   0x14006f560
   140385c5b:	lea    rdx,[rip+0x12a4b8e]        # 0x14162a7f0
   140385c62:	jmp    0x1403861ad
   140385c67:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140385c6e:	call   0x14075cfd0
   140385c73:	test   al,al
   140385c75:	jne    0x140385e03
   140385c7b:	mov    rcx,QWORD PTR [r14+0xc0]
   140385c82:	movzx  eax,WORD PTR [rcx+0xcf2]
   140385c89:	sub    ax,0x5
   140385c8d:	cmp    ax,0x1
   140385c91:	jbe    0x140385e03
   140385c97:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140385c9e:	call   0x14075cfd0
   140385ca3:	test   al,al
   140385ca5:	jne    0x140385e03
   140385cab:	mov    rcx,QWORD PTR [r14+0xc0]
   140385cb2:	movzx  eax,WORD PTR [rip+0x200d9c3]        # 0x14239367c
   140385cb9:	cmp    WORD PTR [rcx+0x98],ax
   140385cc0:	lea    rcx,[rbp+0x100]
   140385cc7:	jne    0x140385cd5
   140385cc9:	lea    rdx,[rip+0x12a4b50]        # 0x14162a820
   140385cd0:	jmp    0x1403861b4
   140385cd5:	lea    rdx,[rip+0x12a4bdc]        # 0x14162a8b8
   140385cdc:	call   0x14006f560
   140385ce1:	lea    rcx,[rbp+0xe0]
   140385ce8:	call   0x14006f690
   140385ced:	nop
   140385cee:	mov    rdx,QWORD PTR [r14+0xd8]
   140385cf5:	test   rdx,rdx
   140385cf8:	je     0x140385d5c
   140385cfa:	mov    ebx,0x19
   140385cff:	mov    r9d,ebx
   140385d02:	movzx  r8d,WORD PTR [rdx+0x12c]
   140385d0a:	movzx  edx,WORD PTR [rdx+0xa4]
   140385d11:	lea    rcx,[rip+0x2166d30]        # 0x1424eca48
   140385d18:	call   0x14030cea0
   140385d1d:	test   al,al
   140385d1f:	je     0x140385d5c
   140385d21:	mov    r8,QWORD PTR [r14+0xd8]
   140385d28:	mov    BYTE PTR [rsp+0x30],0x0
   140385d2d:	mov    BYTE PTR [rsp+0x28],0x0
   140385d32:	mov    WORD PTR [rsp+0x20],bx
   140385d37:	movzx  r9d,WORD PTR [r8+0x12c]
   140385d3f:	movzx  r8d,WORD PTR [r8+0xa4]
   140385d47:	lea    rdx,[rbp+0xe0]
   140385d4e:	lea    rcx,[rip+0x2166cf3]        # 0x1424eca48
   140385d55:	call   0x14030cf70
   140385d5a:	jmp    0x140385d6f
   140385d5c:	lea    rdx,[rip+0x12a4b45]        # 0x14162a8a8
   140385d63:	lea    rcx,[rbp+0xe0]
   140385d6a:	call   0x14006f560
   140385d6f:	lea    rdx,[rbp+0xe0]
   140385d76:	lea    rcx,[rbp+0x100]
   140385d7d:	call   0x1400b9d10
   140385d82:	lea    rdx,[rip+0x12a483f]        # 0x14162a5c8
   140385d89:	lea    rcx,[rbp+0x100]
   140385d90:	call   0x14006f560
   140385d95:	lea    rcx,[rbp+0x120]
   140385d9c:	call   0x14006f690
   140385da1:	nop
   140385da2:	mov    r9d,0xffffffff
   140385da8:	mov    r8b,0x1
   140385dab:	lea    rdx,[rbp+0x120]
   140385db2:	movzx  ecx,WORD PTR [rip+0x200d8c3]        # 0x14239367c
   140385db9:	call   0x140aa3bd0
   140385dbe:	lea    rdx,[rbp+0x120]
   140385dc5:	lea    rcx,[rbp+0x100]
   140385dcc:	call   0x1400b9d10
   140385dd1:	lea    rdx,[rip+0x12a47c8]        # 0x14162a5a0
   140385dd8:	lea    rcx,[rbp+0x100]
   140385ddf:	call   0x14006f560
   140385de4:	nop
   140385de5:	lea    rcx,[rbp+0x120]
   140385dec:	call   0x140067e30
   140385df1:	nop
   140385df2:	lea    rcx,[rbp+0xe0]
   140385df9:	call   0x140067e30
   140385dfe:	jmp    0x1403861b9
   140385e03:	lea    rdx,[rip+0x12a49be]        # 0x14162a7c8
   140385e0a:	lea    rcx,[rbp+0x100]
   140385e11:	call   0x14006f560
   140385e16:	lea    rdx,[rip+0x12a4a5b]        # 0x14162a878
   140385e1d:	jmp    0x1403861ad
   140385e22:	mov    rcx,QWORD PTR [r14+0xc0]
   140385e29:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140385e30:	call   0x14075cfd0
   140385e35:	test   al,al
   140385e37:	jne    0x140385e61
   140385e39:	mov    rcx,QWORD PTR [r14+0xc0]
   140385e40:	movzx  eax,WORD PTR [rcx+0xcf2]
   140385e47:	sub    ax,0x5
   140385e4b:	cmp    ax,0x1
   140385e4f:	jbe    0x140385e61
   140385e51:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140385e58:	call   0x14075cfd0
   140385e5d:	test   al,al
   140385e5f:	je     0x140385e7c
   140385e61:	mov    rax,QWORD PTR [r14+0xb8]
   140385e68:	test   BYTE PTR [rax+0x20c0],0x80
   140385e6f:	lea    rdx,[rip+0x12a477a]        # 0x14162a5f0
   140385e76:	jne    0x1403861ad
   140385e7c:	lea    rdx,[rip+0x12a4755]        # 0x14162a5d8
   140385e83:	jmp    0x1403861ad
   140385e88:	lea    rdx,[rip+0x12a4809]        # 0x14162a698
   140385e8f:	jmp    0x1403861ad
   140385e94:	lea    rdx,[rip+0x129540d]        # 0x14161b2a8
   140385e9b:	jmp    0x1403861ad
   140385ea0:	lea    rdx,[rip+0x12a47a9]        # 0x14162a650
   140385ea7:	jmp    0x1403861ad
   140385eac:	lea    rdx,[rip+0x1295425]        # 0x14161b2d8
   140385eb3:	jmp    0x1403861ad
   140385eb8:	lea    rdx,[rip+0x12a4879]        # 0x14162a738
   140385ebf:	jmp    0x1403861ad
   140385ec4:	lea    rdx,[rip+0x129543d]        # 0x14161b308
   140385ecb:	jmp    0x1403861ad
   140385ed0:	lea    rdx,[rip+0x12a47f9]        # 0x14162a6d0
   140385ed7:	jmp    0x1403861ad
   140385edc:	mov    rcx,QWORD PTR [r14+0xc0]
   140385ee3:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140385eea:	call   0x14075cfd0
   140385eef:	test   al,al
   140385ef1:	jne    0x140385f26
   140385ef3:	mov    rcx,QWORD PTR [r14+0xc0]
   140385efa:	movzx  eax,WORD PTR [rcx+0xcf2]
   140385f01:	sub    ax,0x5
   140385f05:	cmp    ax,0x1
   140385f09:	jbe    0x140385f26
   140385f0b:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140385f12:	call   0x14075cfd0
   140385f17:	test   al,al
   140385f19:	lea    rdx,[rip+0x12a4fa0]        # 0x14162aec0
   140385f20:	je     0x1403861ad
   140385f26:	lea    rdx,[rip+0x12a4ff3]        # 0x14162af20
   140385f2d:	jmp    0x1403861ad
   140385f32:	lea    rdx,[rip+0x12a506f]        # 0x14162afa8
   140385f39:	lea    rcx,[rbp+0x100]
   140385f40:	call   0x14006f560
   140385f45:	lea    rdx,[rip+0x12a503c]        # 0x14162af88
   140385f4c:	jmp    0x1403861ad
   140385f51:	lea    rdx,[rip+0x12a50b8]        # 0x14162b010
   140385f58:	lea    rcx,[rbp+0x100]
   140385f5f:	call   0x14006f560
   140385f64:	lea    rdx,[rip+0x12a5075]        # 0x14162afe0
   140385f6b:	jmp    0x1403861ad
   140385f70:	lea    rdx,[rip+0x12955c9]        # 0x14161b540
   140385f77:	jmp    0x1403861ad
   140385f7c:	mov    rcx,QWORD PTR [r14+0xc0]
   140385f83:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140385f8a:	call   0x14075cfd0
   140385f8f:	test   al,al
   140385f91:	jne    0x140385fc6
   140385f93:	mov    rcx,QWORD PTR [r14+0xc0]
   140385f9a:	movzx  eax,WORD PTR [rcx+0xcf2]
   140385fa1:	sub    ax,0x5
   140385fa5:	cmp    ax,0x1
   140385fa9:	jbe    0x140385fc6
   140385fab:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140385fb2:	call   0x14075cfd0
   140385fb7:	test   al,al
   140385fb9:	lea    rdx,[rip+0x12a5090]        # 0x14162b050
   140385fc0:	je     0x1403861ad
   140385fc6:	lea    rdx,[rip+0x12a50b3]        # 0x14162b080
   140385fcd:	jmp    0x1403861ad
   140385fd2:	lea    rdx,[rip+0x12a4d67]        # 0x14162ad40
   140385fd9:	jmp    0x1403861ad
   140385fde:	mov    rcx,QWORD PTR [r14+0xc0]
   140385fe5:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140385fec:	call   0x14075cfd0
   140385ff1:	test   al,al
   140385ff3:	jne    0x14038603c
   140385ff5:	mov    rcx,QWORD PTR [r14+0xc0]
   140385ffc:	movzx  eax,WORD PTR [rcx+0xcf2]
   140386003:	sub    ax,0x5
   140386007:	cmp    ax,0x1
   14038600b:	jbe    0x14038603c
   14038600d:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140386014:	call   0x14075cfd0
   140386019:	test   al,al
   14038601b:	jne    0x14038603c
   14038601d:	lea    rdx,[rip+0x12a4d7c]        # 0x14162ada0
   140386024:	lea    rcx,[rbp+0x100]
   14038602b:	call   0x14006f560
   140386030:	lea    rdx,[rip+0x12a4d31]        # 0x14162ad68
   140386037:	jmp    0x1403861ad
   14038603c:	lea    rdx,[rip+0x12a4ccd]        # 0x14162ad10
   140386043:	jmp    0x1403861ad
   140386048:	mov    rcx,QWORD PTR [r14+0xc0]
   14038604f:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140386056:	call   0x14075cfd0
   14038605b:	test   al,al
   14038605d:	jne    0x1403860a6
   14038605f:	mov    rcx,QWORD PTR [r14+0xc0]
   140386066:	movzx  eax,WORD PTR [rcx+0xcf2]
   14038606d:	sub    ax,0x5
   140386071:	cmp    ax,0x1
   140386075:	jbe    0x1403860a6
   140386077:	movzx  ecx,WORD PTR [rcx+0xcf4]
   14038607e:	call   0x14075cfd0
   140386083:	test   al,al
   140386085:	jne    0x1403860a6
   140386087:	lea    rdx,[rip+0x12a4d42]        # 0x14162add0
   14038608e:	lea    rcx,[rbp+0x100]
   140386095:	call   0x14006f560
   14038609a:	lea    rdx,[rip+0x12a4dcf]        # 0x14162ae70
   1403860a1:	jmp    0x1403861ad
   1403860a6:	lea    rdx,[rip+0x12a4d4b]        # 0x14162adf8
   1403860ad:	jmp    0x1403861ad
   1403860b2:	lea    rdx,[rip+0x12a4d57]        # 0x14162ae10
   1403860b9:	jmp    0x1403861ad
   1403860be:	lea    rdx,[rip+0x12a4ad3]        # 0x14162ab98
   1403860c5:	lea    rcx,[rbp+0x100]
   1403860cc:	call   0x14006f560
   1403860d1:	lea    rdx,[rip+0x12a4a78]        # 0x14162ab50
   1403860d8:	jmp    0x1403861ad
   1403860dd:	lea    rdx,[rip+0x12a4b14]        # 0x14162abf8
   1403860e4:	jmp    0x1403861ad
   1403860e9:	lea    rdx,[rip+0x12a4ad8]        # 0x14162abc8
   1403860f0:	lea    rcx,[rbp+0x100]
   1403860f7:	call   0x14006f560
   1403860fc:	lea    rdx,[rip+0x12a4b8d]        # 0x14162ac90
   140386103:	jmp    0x1403861ad
   140386108:	lea    rdx,[rip+0x12a4b31]        # 0x14162ac40
   14038610f:	jmp    0x1403861ad
   140386114:	mov    rcx,QWORD PTR [r14+0xc0]
   14038611b:	mov    eax,DWORD PTR [rip+0x200d54f]        # 0x142393670
   140386121:	cmp    DWORD PTR [rcx+0x4],eax
   140386124:	je     0x14038613f
   140386126:	movzx  eax,WORD PTR [rip+0x200d54f]        # 0x14239367c
   14038612d:	cmp    WORD PTR [rcx+0x98],ax
   140386134:	je     0x14038613f
   140386136:	lea    rdx,[rip+0x12952eb]        # 0x14161b428
   14038613d:	jmp    0x1403861ad
   14038613f:	lea    rdx,[rip+0x12a4b9a]        # 0x14162ace0
   140386146:	lea    rcx,[rbp+0x100]
   14038614d:	call   0x14006f560
   140386152:	lea    rdx,[rip+0x12a4b4f]        # 0x14162aca8
   140386159:	jmp    0x1403861ad
   14038615b:	lea    rdx,[rip+0x12a48ee]        # 0x14162aa50
   140386162:	lea    rcx,[rbp+0x100]
   140386169:	call   0x14006f560
   14038616e:	lea    rdx,[rip+0x12a488b]        # 0x14162aa00
   140386175:	jmp    0x1403861ad
   140386177:	lea    rdx,[rip+0x12a492a]        # 0x14162aaa8
   14038617e:	lea    rcx,[rbp+0x100]
   140386185:	call   0x14006f560
   14038618a:	lea    rdx,[rip+0x12a48e7]        # 0x14162aa78
   140386191:	jmp    0x1403861ad
   140386193:	lea    rdx,[rip+0x12a4956]        # 0x14162aaf0
   14038619a:	lea    rcx,[rbp+0x100]
   1403861a1:	call   0x14006f560
   1403861a6:	lea    rdx,[rip+0x12a4923]        # 0x14162aad0
   1403861ad:	lea    rcx,[rbp+0x100]
   1403861b4:	call   0x14006f560
   1403861b9:	lea    rdx,[rip+0x1263558]        # 0x1415e9718
   1403861c0:	lea    rcx,[rbp+0x100]
   1403861c7:	call   0x14006f560
   1403861cc:	mov    r8d,DWORD PTR [rbp+0x10]
   1403861d0:	sub    r8d,r15d
   1403861d3:	sub    r8d,0xf
   1403861d7:	lea    rdx,[rbp+0x100]
   1403861de:	lea    rcx,[rbp+0x140]
   1403861e5:	call   0x1408e7310
   1403861ea:	xor    r8d,r8d
   1403861ed:	mov    edx,0x6
   1403861f2:	mov    r9b,0x1
   1403861f5:	lea    rcx,[rip+0x22c41f4]        # 0x14264a3f0
   1403861fc:	call   0x1400bb130
   140386201:	lea    rcx,[rbp+0x140]
   140386208:	call   0x14006ee50
   14038620d:	test   rax,rax
   140386210:	je     0x14038626f
   140386212:	xor    ebx,ebx
   140386214:	nop    DWORD PTR [rax+0x0]
   140386218:	nop    DWORD PTR [rax+rax*1+0x0]
   140386220:	lea    r8d,[r15+0xd]
   140386224:	mov    edx,edi
   140386226:	lea    rcx,[rip+0x22c41c3]        # 0x14264a3f0
   14038622d:	call   0x1400bb120
   140386232:	mov    rdx,rbx
   140386235:	lea    rcx,[rbp+0x140]
   14038623c:	call   0x14006f220
   140386241:	xor    r9d,r9d
   140386244:	xor    r8d,r8d
   140386247:	mov    rdx,QWORD PTR [rax]
   14038624a:	lea    rcx,[rip+0x22c419f]        # 0x14264a3f0
   140386251:	call   0x140ad9960
   140386256:	inc    edi
   140386258:	lea    eax,[rdi-0x7]
   14038625b:	movsxd rbx,eax
   14038625e:	lea    rcx,[rbp+0x140]
   140386265:	call   0x14006ee50
   14038626a:	cmp    rbx,rax
   14038626d:	jb     0x140386220
   14038626f:	lea    rcx,[rbp+0x100]
   140386276:	call   0x140067e30
   14038627b:	nop
   14038627c:	lea    rcx,[rbp+0x140]
   140386283:	call   0x1400bb990
   140386288:	jmp    0x1403863c1
   14038628d:	call   0x14006ee50
   140386292:	test   rax,rax
   140386295:	je     0x1403863b8
   14038629b:	lea    r15d,[r13-0x1]
   14038629f:	lea    edi,[r15-0x6]
   1403862a3:	mov    ebx,DWORD PTR [rbx+0x3d8]
   1403862a9:	mov    rcx,rsi
   1403862ac:	call   0x14006ee50
   1403862b1:	cmp    ebx,eax
   1403862b3:	jge    0x140386330
   1403862b5:	mov    esi,0x7
   1403862ba:	sub    esi,ebx
   1403862bc:	mov    r15,QWORD PTR [rbp-0x80]
   1403862c0:	mov    ecx,DWORD PTR [r15+0x3d8]
   1403862c7:	add    ecx,edi
   1403862c9:	cmp    ebx,ecx
   1403862cb:	jge    0x14038632c
   1403862cd:	xor    r8d,r8d
   1403862d0:	mov    edx,0x6
   1403862d5:	mov    r9b,0x1
   1403862d8:	lea    rcx,[rip+0x22c4111]        # 0x14264a3f0
   1403862df:	call   0x1400bb130
   1403862e4:	lea    edx,[rbx+rsi*1]
   1403862e7:	mov    r8d,r14d
   1403862ea:	lea    rcx,[rip+0x22c40ff]        # 0x14264a3f0
   1403862f1:	call   0x1400bb120
   1403862f6:	lea    rcx,[r15+0x3c0]
   1403862fd:	movsxd rdx,ebx
   140386300:	call   0x14006f220
   140386305:	xor    r9d,r9d
   140386308:	xor    r8d,r8d
   14038630b:	mov    rdx,QWORD PTR [rax]
   14038630e:	lea    rcx,[rip+0x22c40db]        # 0x14264a3f0
   140386315:	call   0x140ad9960
   14038631a:	inc    ebx
   14038631c:	lea    rcx,[r15+0x3c0]
   140386323:	call   0x14006ee50
   140386328:	cmp    ebx,eax
   14038632a:	jl     0x1403862c0
   14038632c:	lea    r15d,[r13-0x1]
   140386330:	mov    r14,QWORD PTR [rbp-0x80]
   140386334:	lea    rcx,[r14+0x3c0]
   14038633b:	call   0x14006ee50
   140386340:	cmp    eax,edi
   140386342:	jle    0x1403863bd
   140386344:	lea    rcx,[rbp+0xc0]
   14038634b:	call   0x1400bb360
   140386350:	lea    rcx,[r14+0x3c0]
   140386357:	call   0x14006ee50
   14038635c:	lea    r9d,[rax-0x1]
   140386360:	mov    DWORD PTR [rsp+0x30],r15d
   140386365:	mov    DWORD PTR [rsp+0x28],0x7
   14038636d:	mov    DWORD PTR [rsp+0x20],edi
   140386371:	xor    r8d,r8d
   140386374:	mov    edx,DWORD PTR [r14+0x3d8]
   14038637b:	lea    rcx,[rbp+0xc0]
   140386382:	call   0x1400bb380
   140386387:	mov    r15d,DWORD PTR [rbp-0x78]
   14038638b:	lea    r9d,[r15+0x53]
   14038638f:	mov    DWORD PTR [rsp+0x28],0x0
   140386397:	movzx  eax,BYTE PTR [r14+0x3dc]
   14038639f:	mov    BYTE PTR [rsp+0x20],al
   1403863a3:	mov    r8d,DWORD PTR [rbp+0x18]
   1403863a7:	mov    edx,DWORD PTR [rbp+0x14]
   1403863aa:	lea    rcx,[rbp+0xc0]
   1403863b1:	call   0x14140f4d0
   1403863b6:	jmp    0x1403863c1
   1403863b8:	mov    r14,rbx
   1403863bb:	jmp    0x1403863c1
   1403863bd:	mov    r15d,DWORD PTR [rbp-0x78]
   1403863c1:	test   r12b,r12b
   1403863c4:	je     0x14038654b
   1403863ca:	lea    r8d,[r15+0xd]
   1403863ce:	mov    edx,r13d
   1403863d1:	lea    rcx,[rip+0x22c4018]        # 0x14264a3f0
   1403863d8:	call   0x1400bb120
   1403863dd:	lea    rdx,[r14+0x48]
   1403863e1:	lea    rcx,[rbp+0x140]
   1403863e8:	call   0x14006f5d0
   1403863ed:	nop
   1403863ee:	mov    rax,QWORD PTR [r14+0xb8]
   1403863f5:	lea    rcx,[rbp+0x140]
   1403863fc:	cmp    DWORD PTR [rax+0x2118],0x14
   140386403:	lea    rdx,[rip+0x1270dda]        # 0x1415f71e4
   14038640a:	jl     0x140386413
   14038640c:	lea    rdx,[rip+0x12a472d]        # 0x14162ab40
   140386413:	call   0x14006f560
   140386418:	mov    rax,QWORD PTR [r14+0xb8]
   14038641f:	mov    ecx,DWORD PTR [rax+0x2118]
   140386425:	xor    r8d,r8d
   140386428:	cmp    ecx,0x64
   14038642b:	jl     0x14038644d
   14038642d:	mov    edx,0x2
   140386432:	mov    r9b,0x1
   140386435:	lea    rcx,[rip+0x22c3fb4]        # 0x14264a3f0
   14038643c:	call   0x1400bb130
   140386441:	lea    rdx,[rip+0x12a46d8]        # 0x14162ab20
   140386448:	jmp    0x140386505
   14038644d:	cmp    ecx,0x50
   140386450:	jl     0x140386472
   140386452:	mov    edx,0x3
   140386457:	mov    r9b,0x1
   14038645a:	lea    rcx,[rip+0x22c3f8f]        # 0x14264a3f0
   140386461:	call   0x1400bb130
   140386466:	lea    rdx,[rip+0x12a4ea3]        # 0x14162b310
   14038646d:	jmp    0x140386505
   140386472:	cmp    ecx,0x3c
   140386475:	jl     0x140386495
   140386477:	mov    edx,0x1
   14038647c:	movzx  r9d,dl
   140386480:	lea    rcx,[rip+0x22c3f69]        # 0x14264a3f0
   140386487:	call   0x1400bb130
   14038648c:	lea    rdx,[rip+0x12a4e5d]        # 0x14162b2f0
   140386493:	jmp    0x140386505
   140386495:	mov    r9b,0x1
   140386498:	cmp    ecx,0x28
   14038649b:	jl     0x1403864b7
   14038649d:	mov    edx,0x7
   1403864a2:	lea    rcx,[rip+0x22c3f47]        # 0x14264a3f0
   1403864a9:	call   0x1400bb130
   1403864ae:	lea    rdx,[rip+0x12a4e9b]        # 0x14162b350
   1403864b5:	jmp    0x140386505
   1403864b7:	cmp    ecx,0x14
   1403864ba:	jl     0x1403864d6
   1403864bc:	mov    edx,0x6
   1403864c1:	lea    rcx,[rip+0x22c3f28]        # 0x14264a3f0
   1403864c8:	call   0x1400bb130
   1403864cd:	lea    rdx,[rip+0x12a4e5c]        # 0x14162b330
   1403864d4:	jmp    0x140386505
   1403864d6:	test   ecx,ecx
   1403864d8:	lea    rcx,[rip+0x22c3f11]        # 0x14264a3f0
   1403864df:	jle    0x1403864f4
   1403864e1:	mov    edx,0x4
   1403864e6:	call   0x1400bb130
   1403864eb:	lea    rdx,[rip+0x12a4e8e]        # 0x14162b380
   1403864f2:	jmp    0x140386505
   1403864f4:	mov    edx,0x5
   1403864f9:	call   0x1400bb130
   1403864fe:	lea    rdx,[rip+0x12a4e63]        # 0x14162b368
   140386505:	lea    rcx,[rbp+0x140]
   14038650c:	call   0x14006f560
   140386511:	lea    rdx,[rip+0x126209c]        # 0x1415e85b4
   140386518:	lea    rcx,[rbp+0x140]
   14038651f:	call   0x14006f560
   140386524:	xor    r9d,r9d
   140386527:	xor    r8d,r8d
   14038652a:	lea    rdx,[rbp+0x140]
   140386531:	lea    rcx,[rip+0x22c3eb8]        # 0x14264a3f0
   140386538:	call   0x140ad9960
   14038653d:	nop
   14038653e:	lea    rcx,[rbp+0x140]
   140386545:	call   0x140067e30
   14038654a:	nop
   14038654b:	lea    rcx,[rbp+0x160]
   140386552:	call   0x140067e30
   140386557:	xor    eax,eax
   140386559:	mov    ecx,eax
   14038655b:	mov    DWORD PTR [rbp-0x30],eax
   14038655e:	mov    esi,eax
   140386560:	mov    QWORD PTR [rbp+0x38],rax
   140386564:	mov    r13d,DWORD PTR [rbp-0x70]
   140386568:	lea    r15d,[r13+0x1]
   14038656c:	mov    DWORD PTR [rbp+0x74],r15d
   140386570:	mov    QWORD PTR [rbp+0x0],0x5c
   140386578:	test   ecx,ecx
   14038657a:	jne    0x140386603
   140386580:	mov    ebx,DWORD PTR [rbp-0x48]
   140386583:	add    ebx,0xfffffffe
   140386586:	mov    r12d,DWORD PTR [rbp-0x78]
   14038658a:	add    r12d,0x2
   14038658e:	mov    DWORD PTR [rbp-0x68],r12d
   140386592:	mov    DWORD PTR [rbp-0x74],r12d
   140386596:	mov    DWORD PTR [rbp-0x64],r12d
   14038659a:	mov    eax,DWORD PTR [r14+rsi*4+0x170]
   1403865a2:	lea    r15d,[rbx-0x2]
   1403865a6:	cmp    eax,DWORD PTR [rbp+0x30]
   1403865a9:	cmovle r15d,ebx
   1403865ad:	mov    DWORD PTR [rbp-0x6c],r15d
   1403865b1:	mov    esi,0x2
   1403865b6:	mov    eax,0x0
   1403865bb:	cmovle esi,eax
   1403865be:	add    esi,r15d
   1403865c1:	mov    r14d,r13d
   1403865c4:	lea    rdi,[rip+0x22c5959]        # 0x14264bf24
   1403865cb:	lea    rax,[rip+0x22c595e]        # 0x14264bf30
   1403865d2:	mov    ebx,r12d
   1403865d5:	cmp    r12d,esi
   1403865d8:	jg     0x140387176
   1403865de:	xchg   ax,ax
   1403865e0:	mov    r8d,ebx
   1403865e3:	mov    edx,r14d
   1403865e6:	lea    rcx,[rip+0x22c3e03]        # 0x14264a3f0
   1403865ed:	call   0x1400bb120
   1403865f2:	cmp    ebx,r12d
   1403865f5:	jne    0x140387107
   1403865fb:	mov    edx,DWORD PTR [rdi-0x18]
   1403865fe:	jmp    0x140387136
   140386603:	mov    r12d,DWORD PTR [rbp-0x48]
   140386607:	add    r12d,0x2
   14038660b:	mov    DWORD PTR [rbp-0x68],r12d
   14038660f:	mov    DWORD PTR [rbp-0x74],r12d
   140386613:	mov    DWORD PTR [rbp-0x64],r12d
   140386617:	mov    edx,DWORD PTR [rbp+0x10]
   14038661a:	lea    ebx,[rdx-0x2]
   14038661d:	cmp    ecx,0x1
   140386620:	jne    0x14038659a
   140386626:	lea    ebx,[rdx-0x2]
   140386629:	lea    rcx,[r14+0x380]
   140386630:	call   0x14006ee50
   140386635:	test   rax,rax
   140386638:	je     0x14038659a
   14038663e:	mov    ebx,DWORD PTR [rbp+0x10]
   140386641:	lea    r12d,[rbx-0x2]
   140386645:	mov    DWORD PTR [rsp+0x74],r12d
   14038664a:	lea    rcx,[r14+0x380]
   140386651:	call   0x14006ee50
   140386656:	lea    ecx,[rax+rax*2]
   140386659:	cmp    ecx,DWORD PTR [rbp+0x30]
   14038665c:	jle    0x140386667
   14038665e:	lea    r12d,[rbx-0x4]
   140386662:	mov    DWORD PTR [rsp+0x74],r12d
   140386667:	xor    r8d,r8d
   14038666a:	mov    edx,0x7
   14038666f:	mov    r9b,0x1
   140386672:	lea    rcx,[rip+0x22c3d77]        # 0x14264a3f0
   140386679:	call   0x1400bb130
   14038667e:	mov    r8d,DWORD PTR [rbp-0x68]
   140386682:	mov    edx,r13d
   140386685:	lea    rcx,[rip+0x22c3d64]        # 0x14264a3f0
   14038668c:	call   0x1400bb120
   140386691:	lea    rdx,[rip+0x12a4d38]        # 0x14162b3d0
   140386698:	lea    rcx,[rbp+0xc0]
   14038669f:	call   0x140068150
   1403866a4:	nop
   1403866a5:	xor    r9d,r9d
   1403866a8:	xor    r8d,r8d
   1403866ab:	lea    rdx,[rbp+0xc0]
   1403866b2:	lea    rcx,[rip+0x22c3d37]        # 0x14264a3f0
   1403866b9:	call   0x140ad9960
   1403866be:	nop
   1403866bf:	lea    rcx,[rbp+0xc0]
   1403866c6:	call   0x140067e30
   1403866cb:	mov    r8d,DWORD PTR [rbp-0x68]
   1403866cf:	mov    edx,r15d
   1403866d2:	lea    rcx,[rip+0x22c3d17]        # 0x14264a3f0
   1403866d9:	call   0x1400bb120
   1403866de:	lea    rdx,[rip+0x12a4cc3]        # 0x14162b3a8
   1403866e5:	lea    rcx,[rbp+0xc0]
   1403866ec:	call   0x140068150
   1403866f1:	nop
   1403866f2:	xor    r9d,r9d
   1403866f5:	xor    r8d,r8d
   1403866f8:	lea    rdx,[rbp+0xc0]
   1403866ff:	lea    rcx,[rip+0x22c3cea]        # 0x14264a3f0
   140386706:	call   0x140ad9960
   14038670b:	nop
   14038670c:	lea    rcx,[rbp+0xc0]
   140386713:	call   0x140067e30
   140386718:	lea    r15d,[r12-0x8]
   14038671d:	lea    r14d,[r12-0x1]
   140386722:	mov    edi,r15d
   140386725:	cmp    r15d,r14d
   140386728:	jg     0x14038678a
   14038672a:	lea    r12,[rip+0x22ce4e7]        # 0x142654c18
   140386731:	mov    esi,r13d
   140386734:	lea    rbx,[rip+0x22ce4d1]        # 0x142654c0c
   14038673b:	nop    DWORD PTR [rax+rax*1+0x0]
   140386740:	mov    r8d,edi
   140386743:	mov    edx,esi
   140386745:	lea    rcx,[rip+0x22c3ca4]        # 0x14264a3f0
   14038674c:	call   0x1400bb120
   140386751:	cmp    edi,r15d
   140386754:	jne    0x14038675b
   140386756:	mov    edx,DWORD PTR [rbx-0x18]
   140386759:	jmp    0x140386767
   14038675b:	cmp    edi,r14d
   14038675e:	jne    0x140386764
   140386760:	mov    edx,DWORD PTR [rbx]
   140386762:	jmp    0x140386767
   140386764:	mov    edx,DWORD PTR [rbx-0xc]
   140386767:	lea    rcx,[rip+0x22c3c82]        # 0x14264a3f0
   14038676e:	call   0x140adaad0
   140386773:	inc    esi
   140386775:	add    rbx,0x4
   140386779:	cmp    rbx,r12
   14038677c:	jl     0x140386740
   14038677e:	inc    edi
   140386780:	cmp    edi,r14d
   140386783:	jle    0x140386731
   140386785:	mov    r12d,DWORD PTR [rsp+0x74]
   14038678a:	xor    r8d,r8d
   14038678d:	mov    edx,0x7
   140386792:	mov    r9b,0x1
   140386795:	lea    rcx,[rip+0x22c3c54]        # 0x14264a3f0
   14038679c:	call   0x1400bb130
   1403867a1:	lea    r8d,[r15+0x2]
   1403867a5:	lea    edx,[r13+0x1]
   1403867a9:	lea    rcx,[rip+0x22c3c40]        # 0x14264a3f0
   1403867b0:	call   0x1400bb120
   1403867b5:	lea    rdx,[rip+0x12685a4]        # 0x1415eed60
   1403867bc:	lea    rcx,[rbp+0xc0]
   1403867c3:	call   0x140068150
   1403867c8:	nop
   1403867c9:	xor    r9d,r9d
   1403867cc:	xor    r8d,r8d
   1403867cf:	lea    rdx,[rbp+0xc0]
   1403867d6:	lea    rcx,[rip+0x22c3c13]        # 0x14264a3f0
   1403867dd:	call   0x140ad9960
   1403867e2:	nop
   1403867e3:	lea    rcx,[rbp+0xc0]
   1403867ea:	call   0x140067e30
   1403867ef:	mov    rbx,QWORD PTR [rbp-0x80]
   1403867f3:	sub    r13d,DWORD PTR [rbx+0x398]
   1403867fa:	add    r13d,0x3
   1403867fe:	mov    DWORD PTR [rbp-0x64],r13d
   140386802:	mov    edi,DWORD PTR [rbp-0x70]
   140386805:	mov    ecx,DWORD PTR [rbp+0x40]
   140386808:	lea    esi,[rdi+rcx*2]
   14038680b:	dec    ecx
   14038680d:	add    esi,ecx
   14038680f:	mov    DWORD PTR [rbp-0x5c],esi
   140386812:	lea    rcx,[rbx+0x380]
   140386819:	lea    rdx,[rbp+0x20]
   14038681d:	call   0x14006f240
   140386822:	lea    rcx,[rbx+0x380]
   140386829:	lea    rdx,[rbp+0x90]
   140386830:	call   0x14006f230
   140386835:	movsxd rbx,r13d
   140386838:	mov    QWORD PTR [rbp-0x38],rbx
   14038683c:	mov    rax,QWORD PTR [rbp+0x20]
   140386840:	cmp    rax,QWORD PTR [rbp+0x90]
   140386847:	je     0x140386fdf
   14038684d:	mov    edx,0x1
   140386852:	mov    ecx,0xff
   140386857:	cmovb  edx,ecx
   14038685a:	test   dl,dl
   14038685c:	jns    0x140386fdf
   140386862:	lea    ecx,[rdi+0x3]
   140386865:	cmp    r13d,ecx
   140386868:	jl     0x140386872
   14038686a:	movsxd rdx,esi
   14038686d:	cmp    rbx,rdx
   140386870:	jle    0x140386892
   140386872:	lea    edx,[r13+0x1]
   140386876:	cmp    edx,ecx
   140386878:	jl     0x14038687e
   14038687a:	cmp    edx,esi
   14038687c:	jle    0x140386892
   14038687e:	lea    edx,[r13+0x2]
   140386882:	cmp    edx,ecx
   140386884:	jl     0x140386fba
   14038688a:	cmp    edx,esi
   14038688c:	jg     0x140386fba
   140386892:	lea    rcx,[rbp+0x20]
   140386896:	call   0x14006ee10
   14038689b:	mov    r14,QWORD PTR [rax]
   14038689e:	mov    QWORD PTR [rbp+0x8],r14
   1403868a2:	xor    r8d,r8d
   1403868a5:	mov    edx,0x7
   1403868aa:	mov    r9b,0x1
   1403868ad:	lea    rcx,[rip+0x22c3b3c]        # 0x14264a3f0
   1403868b4:	call   0x1400bb130
   1403868b9:	mov    r15d,DWORD PTR [rbp-0x74]
   1403868bd:	mov    edi,r15d
   1403868c0:	mov    eax,DWORD PTR [rsp+0x74]
   1403868c4:	cmp    r15d,eax
   1403868c7:	jg     0x1403869d5
   1403868cd:	lea    r15d,[r13+0x3]
   1403868d1:	mov    r12d,DWORD PTR [rbp-0x70]
   1403868d5:	add    r12d,0x3
   1403868d9:	nop    DWORD PTR [rax+0x0]
   1403868e0:	mov    esi,r13d
   1403868e3:	mov    r14,rbx
   1403868e6:	cmp    r13d,r15d
   1403868e9:	jge    0x1403869c0
   1403868ef:	lea    rbx,[rip+0x22c56a6]        # 0x14264bf9c
   1403868f6:	mov    r13d,DWORD PTR [rsp+0x74]
   1403868fb:	nop    DWORD PTR [rax+rax*1+0x0]
   140386900:	cmp    esi,r12d
   140386903:	jl     0x1403869a2
   140386909:	movsxd rcx,DWORD PTR [rbp-0x5c]
   14038690d:	cmp    r14,rcx
   140386910:	jg     0x1403869a2
   140386916:	mov    r8d,edi
   140386919:	mov    edx,esi
   14038691b:	lea    rcx,[rip+0x22c3ace]        # 0x14264a3f0
   140386922:	call   0x1400bb120
   140386927:	mov    ecx,DWORD PTR [rbp-0x68]
   14038692a:	cmp    edi,ecx
   14038692c:	jne    0x140386933
   14038692e:	mov    edx,DWORD PTR [rbx-0xc]
   140386931:	jmp    0x140386973
   140386933:	lea    eax,[rcx+0x1]
   140386936:	cmp    edi,eax
   140386938:	jne    0x14038693e
   14038693a:	mov    edx,DWORD PTR [rbx]
   14038693c:	jmp    0x140386973
   14038693e:	lea    eax,[rcx+0x2]
   140386941:	cmp    edi,eax
   140386943:	jne    0x140386949
   140386945:	mov    edx,DWORD PTR [rbx]
   140386947:	jmp    0x140386973
   140386949:	lea    eax,[rcx+0x3]
   14038694c:	cmp    edi,eax
   14038694e:	jne    0x140386954
   140386950:	mov    edx,DWORD PTR [rbx]
   140386952:	jmp    0x140386973
   140386954:	lea    eax,[rcx+0x4]
   140386957:	cmp    edi,eax
   140386959:	jne    0x140386960
   14038695b:	mov    edx,DWORD PTR [rbx+0xc]
   14038695e:	jmp    0x140386973
   140386960:	cmp    edi,r13d
   140386963:	jne    0x14038696d
   140386965:	mov    edx,DWORD PTR [rbx-0x1ec]
   14038696b:	jmp    0x140386973
   14038696d:	mov    edx,DWORD PTR [rbx-0x1f8]
   140386973:	lea    rcx,[rip+0x22c3a76]        # 0x14264a3f0
   14038697a:	call   0x140adaad0
   14038697f:	xor    edx,edx
   140386981:	lea    rcx,[rip+0x2046de8]        # 0x1423cd770
   140386988:	call   0x140071f90
   14038698d:	test   al,al
   14038698f:	je     0x1403869a2
   140386991:	mov    r8b,0x1
   140386994:	xor    edx,edx
   140386996:	lea    rcx,[rip+0x22c3a53]        # 0x14264a3f0
   14038699d:	call   0x1400bb190
   1403869a2:	inc    esi
   1403869a4:	inc    r14
   1403869a7:	add    rbx,0x4
   1403869ab:	cmp    esi,r15d
   1403869ae:	jl     0x140386900
   1403869b4:	mov    r13d,DWORD PTR [rbp-0x64]
   1403869b8:	mov    eax,DWORD PTR [rsp+0x74]
   1403869bc:	mov    rbx,QWORD PTR [rbp-0x38]
   1403869c0:	inc    edi
   1403869c2:	cmp    edi,eax
   1403869c4:	jle    0x1403868e0
   1403869ca:	mov    r14,QWORD PTR [rbp+0x8]
   1403869ce:	mov    esi,DWORD PTR [rbp-0x5c]
   1403869d1:	mov    r15d,DWORD PTR [rbp-0x74]
   1403869d5:	mov    edi,DWORD PTR [rbp-0x70]
   1403869d8:	lea    eax,[rdi+0x3]
   1403869db:	cmp    r13d,eax
   1403869de:	jl     0x140386a8a
   1403869e4:	lea    eax,[rsi-0x2]
   1403869e7:	cmp    r13d,eax
   1403869ea:	jg     0x140386a8a
   1403869f0:	xor    edx,edx
   1403869f2:	lea    rcx,[rip+0x2046d77]        # 0x1423cd770
   1403869f9:	call   0x140071f90
   1403869fe:	lea    rcx,[rip+0x22c39eb]        # 0x14264a3f0
   140386a05:	test   al,al
   140386a07:	je     0x140386a51
   140386a09:	mov    r8d,r15d
   140386a0c:	mov    edx,r13d
   140386a0f:	call   0x1400bb120
   140386a14:	mov    edx,DWORD PTR [rbp-0x60]
   140386a17:	mov    rcx,r14
   140386a1a:	call   0x140c7cbc0
   140386a1f:	test   eax,eax
   140386a21:	je     0x140386a8a
   140386a23:	mov    BYTE PTR [rsp+0x30],0x0
   140386a28:	mov    DWORD PTR [rsp+0x28],0x3
   140386a30:	mov    DWORD PTR [rsp+0x20],0x5
   140386a38:	mov    r9d,0x2
   140386a3e:	mov    r8d,r9d
   140386a41:	mov    edx,eax
   140386a43:	lea    rcx,[rip+0x22c39a6]        # 0x14264a3f0
   140386a4a:	call   0x140adad70
   140386a4f:	jmp    0x140386a8a
   140386a51:	lea    r8d,[r15+0x2]
   140386a55:	lea    edx,[r13+0x1]
   140386a59:	call   0x1400bb120
   140386a5e:	mov    rax,QWORD PTR [r14]
   140386a61:	xor    edx,edx
   140386a63:	mov    rcx,r14
   140386a66:	call   QWORD PTR [rax+0x370]
   140386a6c:	mov    rax,QWORD PTR [r14]
   140386a6f:	mov    rcx,r14
   140386a72:	call   QWORD PTR [rax+0x640]
   140386a78:	movzx  edx,al
   140386a7b:	mov    r8b,0x1
   140386a7e:	lea    rcx,[rip+0x22c396b]        # 0x14264a3f0
   140386a85:	call   0x1400bb190
   140386a8a:	lea    ecx,[rdi+0x3]
   140386a8d:	lea    eax,[r13+0x1]
   140386a91:	cmp    eax,ecx
   140386a93:	jl     0x140386c7d
   140386a99:	cmp    r13d,esi
   140386a9c:	jge    0x140386c7d
   140386aa2:	xor    sil,sil
   140386aa5:	xor    dil,dil
   140386aa8:	xor    r12b,r12b
   140386aab:	xor    ecx,ecx
   140386aad:	mov    r15d,ecx
   140386ab0:	lea    rbx,[r14+0x38]
   140386ab4:	mov    rax,QWORD PTR [rbx+0x8]
   140386ab8:	sub    rax,QWORD PTR [rbx]
   140386abb:	sar    rax,0x3
   140386abf:	test   rax,rax
   140386ac2:	je     0x140386b2c
   140386ac4:	mov    r14d,ecx
   140386ac7:	mov    r13d,0x1
   140386acd:	nop    DWORD PTR [rax]
   140386ad0:	mov    rdx,r14
   140386ad3:	mov    rcx,rbx
   140386ad6:	call   0x14006f220
   140386adb:	mov    rcx,QWORD PTR [rax]
   140386ade:	mov    rax,QWORD PTR [rcx]
   140386ae1:	call   QWORD PTR [rax+0x10]
   140386ae4:	movzx  edi,dil
   140386ae8:	cmp    eax,0x2c
   140386aeb:	cmove  edi,r13d
   140386aef:	mov    rdx,r14
   140386af2:	mov    rcx,rbx
   140386af5:	call   0x14006f220
   140386afa:	mov    rcx,QWORD PTR [rax]
   140386afd:	mov    rax,QWORD PTR [rcx]
   140386b00:	call   QWORD PTR [rax+0x10]
   140386b03:	movzx  esi,sil
   140386b07:	cmp    eax,0x2b
   140386b0a:	cmove  esi,r13d
   140386b0e:	inc    r15d
   140386b11:	movsxd r14,r15d
   140386b14:	mov    rax,QWORD PTR [rbx+0x8]
   140386b18:	sub    rax,QWORD PTR [rbx]
   140386b1b:	sar    rax,0x3
   140386b1f:	cmp    r14,rax
   140386b22:	jb     0x140386ad0
   140386b24:	mov    r13d,DWORD PTR [rbp-0x64]
   140386b28:	mov    r14,QWORD PTR [rbp+0x8]
   140386b2c:	cmp    QWORD PTR [rbp+0x38],0x1
   140386b31:	jne    0x140386b4a
   140386b33:	mov    rcx,r14
   140386b36:	call   0x140cb2210
   140386b3b:	movzx  r12d,r12b
   140386b3f:	test   al,al
   140386b41:	mov    eax,0x1
   140386b46:	cmovne r12d,eax
   140386b4a:	test   dil,dil
   140386b4d:	je     0x140386b56
   140386b4f:	mov    edx,0x2
   140386b54:	jmp    0x140386b82
   140386b56:	test   sil,sil
   140386b59:	je     0x140386b62
   140386b5b:	mov    edx,0x4
   140386b60:	jmp    0x140386b82
   140386b62:	test   r12b,r12b
   140386b65:	je     0x140386b6e
   140386b67:	mov    edx,0x5
   140386b6c:	jmp    0x140386b82
   140386b6e:	test   DWORD PTR [r14+0x10],0x4000
   140386b76:	mov    edx,0x7
   140386b7b:	jne    0x140386b82
   140386b7d:	mov    edx,0x6
   140386b82:	mov    r9b,0x1
   140386b85:	xor    r8d,r8d
   140386b88:	lea    rcx,[rip+0x22c3861]        # 0x14264a3f0
   140386b8f:	call   0x1400bb130
   140386b94:	mov    r15d,DWORD PTR [rbp-0x74]
   140386b98:	lea    r8d,[r15+0x7]
   140386b9c:	lea    edx,[r13+0x1]
   140386ba0:	lea    rcx,[rip+0x22c3849]        # 0x14264a3f0
   140386ba7:	call   0x1400bb120
   140386bac:	lea    rcx,[rbp+0xe0]
   140386bb3:	call   0x14006f690
   140386bb8:	nop
   140386bb9:	mov    r9d,0xffffffff
   140386bbf:	xor    r8d,r8d
   140386bc2:	lea    rdx,[rbp+0xe0]
   140386bc9:	mov    rcx,r14
   140386bcc:	call   0x140c65450
   140386bd1:	mov    r12d,DWORD PTR [rsp+0x74]
   140386bd6:	mov    ebx,r12d
   140386bd9:	sub    ebx,r15d
   140386bdc:	lea    rcx,[rbp+0xe0]
   140386be3:	call   0x14006f330
   140386be8:	lea    ecx,[rbx-0x16]
   140386beb:	movsxd rdx,ecx
   140386bee:	cmp    rax,rdx
   140386bf1:	jb     0x140386c52
   140386bf3:	lea    esi,[rbx-0x17]
   140386bf6:	movsxd rdi,ebx
   140386bf9:	test   esi,esi
   140386bfb:	js     0x140386c10
   140386bfd:	lea    rdx,[rdi-0x17]
   140386c01:	xor    r8d,r8d
   140386c04:	lea    rcx,[rbp+0xe0]
   140386c0b:	call   0x1400e1230
   140386c10:	cmp    esi,0x3
   140386c13:	jle    0x140386c52
   140386c15:	lea    rdx,[rdi-0x1a]
   140386c19:	lea    rcx,[rbp+0xe0]
   140386c20:	call   0x1400fb540
   140386c25:	mov    BYTE PTR [rax],0x2e
   140386c28:	lea    eax,[rbx-0x19]
   140386c2b:	movsxd rdx,eax
   140386c2e:	lea    rcx,[rbp+0xe0]
   140386c35:	call   0x1400fb540
   140386c3a:	mov    BYTE PTR [rax],0x2e
   140386c3d:	lea    eax,[rbx-0x18]
   140386c40:	movsxd rdx,eax
   140386c43:	lea    rcx,[rbp+0xe0]
   140386c4a:	call   0x1400fb540
   140386c4f:	mov    BYTE PTR [rax],0x2e
   140386c52:	xor    r9d,r9d
   140386c55:	xor    r8d,r8d
   140386c58:	lea    rdx,[rbp+0xe0]
   140386c5f:	lea    rcx,[rip+0x22c378a]        # 0x14264a3f0
   140386c66:	call   0x140ad9960
   140386c6b:	nop
   140386c6c:	lea    rcx,[rbp+0xe0]
   140386c73:	call   0x140067e30
   140386c78:	mov    edi,DWORD PTR [rbp-0x70]
   140386c7b:	jmp    0x140386c82
   140386c7d:	mov    r12d,DWORD PTR [rsp+0x74]
   140386c82:	lea    ecx,[r13+0x2]
   140386c86:	lea    eax,[rdi+0x3]
   140386c89:	mov    esi,DWORD PTR [rbp-0x5c]
   140386c8c:	cmp    ecx,eax
   140386c8e:	jl     0x140386dd4
   140386c94:	cmp    ecx,esi
   140386c96:	jg     0x140386dd4
   140386c9c:	xor    edi,edi
   140386c9e:	test   BYTE PTR [r14+0x10],0x40
   140386ca3:	je     0x140386dd4
   140386ca9:	lea    rdx,[rbp+0x68]
   140386cad:	lea    rcx,[r14+0x38]
   140386cb1:	call   0x14006f240
   140386cb6:	lea    rdx,[rbp+0x98]
   140386cbd:	lea    rcx,[r14+0x38]
   140386cc1:	call   0x14006f230
   140386cc6:	mov    r12d,0x1
   140386ccc:	mov    r14d,0xff
   140386cd2:	mov    rax,QWORD PTR [rbp+0x68]
   140386cd6:	cmp    rax,QWORD PTR [rbp+0x98]
   140386cdd:	je     0x140386d25
   140386cdf:	mov    edx,r12d
   140386ce2:	cmovb  edx,r14d
   140386ce6:	test   dl,dl
   140386ce8:	jns    0x140386d25
   140386cea:	lea    rcx,[rbp+0x68]
   140386cee:	call   0x14006ee10
   140386cf3:	mov    rcx,QWORD PTR [rax]
   140386cf6:	mov    rax,QWORD PTR [rcx]
   140386cf9:	call   QWORD PTR [rax+0x10]
   140386cfc:	cmp    eax,0xa
   140386cff:	jne    0x140386d1a
   140386d01:	lea    rcx,[rbp+0x68]
   140386d05:	call   0x14006ee10
   140386d0a:	mov    rcx,QWORD PTR [rax]
   140386d0d:	mov    rax,QWORD PTR [rcx]
   140386d10:	call   QWORD PTR [rax+0x18]
   140386d13:	test   rax,rax
   140386d16:	je     0x140386d1a
   140386d18:	inc    edi
   140386d1a:	lea    rcx,[rbp+0x68]
   140386d1e:	call   0x14006ee00
   140386d23:	jmp    0x140386cd2
   140386d25:	test   edi,edi
   140386d27:	mov    r12d,DWORD PTR [rsp+0x74]
   140386d2c:	mov    r14,QWORD PTR [rbp+0x8]
   140386d30:	jle    0x140386dd4
   140386d36:	lea    r8d,[r15+0x7]
   140386d3a:	lea    edx,[r13+0x2]
   140386d3e:	lea    rcx,[rip+0x22c36ab]        # 0x14264a3f0
   140386d45:	call   0x1400bb120
   140386d4a:	lea    rdx,[rip+0x1294dff]        # 0x14161bb50
   140386d51:	lea    rcx,[rbp+0xe0]
   140386d58:	call   0x140068150
   140386d5d:	nop
   140386d5e:	lea    rdx,[rbp+0xe0]
   140386d65:	mov    ecx,edi
   140386d67:	call   0x14052c130
   140386d6c:	lea    rdx,[rip+0x1270479]        # 0x1415f71ec
   140386d73:	lea    rcx,[rbp+0xe0]
   140386d7a:	call   0x14006f560
   140386d7f:	cmp    edi,0x1
   140386d82:	je     0x140386d97
   140386d84:	lea    rdx,[rip+0x126250d]        # 0x1415e9298
   140386d8b:	lea    rcx,[rbp+0xe0]
   140386d92:	call   0x14006f560
   140386d97:	xor    r8d,r8d
   140386d9a:	mov    edx,0x6
   140386d9f:	mov    r9b,0x1
   140386da2:	lea    rcx,[rip+0x22c3647]        # 0x14264a3f0
   140386da9:	call   0x1400bb130
   140386dae:	xor    r9d,r9d
   140386db1:	xor    r8d,r8d
   140386db4:	lea    rdx,[rbp+0xe0]
   140386dbb:	lea    rcx,[rip+0x22c362e]        # 0x14264a3f0
   140386dc2:	call   0x140ad9960
   140386dc7:	nop
   140386dc8:	lea    rcx,[rbp+0xe0]
   140386dcf:	call   0x140067e30
   140386dd4:	lea    edi,[r13+0x1]
   140386dd8:	mov    ecx,DWORD PTR [rbp-0x70]
   140386ddb:	add    ecx,0x3
   140386dde:	lea    eax,[r13+0x1]
   140386de2:	cmp    eax,ecx
   140386de4:	jl     0x140386ef9
   140386dea:	cmp    r13d,esi
   140386ded:	jge    0x140386f07
   140386df3:	lea    rcx,[rip+0x200a4a6]        # 0x1423912a0
   140386dfa:	call   0x140e64560
   140386dff:	mov    ebx,eax
   140386e01:	mov    r15,QWORD PTR [rbp-0x80]
   140386e05:	mov    rcx,QWORD PTR [r15+0xd8]
   140386e0c:	test   rcx,rcx
   140386e0f:	je     0x140386e24
   140386e11:	mov    edx,0x49
   140386e16:	call   0x14133e7a0
   140386e1b:	xor    ebx,ebx
   140386e1d:	test   eax,eax
   140386e1f:	cmovns ebx,eax
   140386e22:	inc    ebx
   140386e24:	test   ebx,ebx
   140386e26:	jle    0x140386f07
   140386e2c:	lea    edi,[r13+0x2]
   140386e30:	lea    r8d,[r12-0x19]
   140386e35:	lea    edx,[r13+0x1]
   140386e39:	lea    rcx,[rip+0x22c35b0]        # 0x14264a3f0
   140386e40:	call   0x1400bb120
   140386e45:	lea    rcx,[rbp+0xe0]
   140386e4c:	call   0x14006f690
   140386e51:	nop
   140386e52:	mov    BYTE PTR [rsp+0x20],0x1
   140386e57:	xor    r9d,r9d
   140386e5a:	mov    r8,QWORD PTR [r15+0xc0]
   140386e61:	mov    rdx,QWORD PTR [r15+0xb8]
   140386e68:	mov    rcx,r14
   140386e6b:	call   0x140c66020
   140386e70:	mov    edx,eax
   140386e72:	lea    r8d,[rbx-0x1]
   140386e76:	lea    rcx,[rbp+0xe0]
   140386e7d:	call   0x14077f920
   140386e82:	xor    r8d,r8d
   140386e85:	mov    edx,0x6
   140386e8a:	mov    r9b,0x1
   140386e8d:	lea    rcx,[rip+0x22c355c]        # 0x14264a3f0
   140386e94:	call   0x1400bb130
   140386e99:	lea    rdx,[rip+0x12771e0]        # 0x1415fe080
   140386ea0:	lea    rcx,[rbp+0xc0]
   140386ea7:	call   0x140068150
   140386eac:	nop
   140386ead:	xor    r9d,r9d
   140386eb0:	mov    r8b,0x3
   140386eb3:	lea    rdx,[rbp+0xc0]
   140386eba:	lea    rcx,[rip+0x22c352f]        # 0x14264a3f0
   140386ec1:	call   0x140ad9960
   140386ec6:	nop
   140386ec7:	lea    rcx,[rbp+0xc0]
   140386ece:	call   0x140067e30
   140386ed3:	xor    r9d,r9d
   140386ed6:	xor    r8d,r8d
   140386ed9:	lea    rdx,[rbp+0xe0]
   140386ee0:	lea    rcx,[rip+0x22c3509]        # 0x14264a3f0
   140386ee7:	call   0x140ad9960
   140386eec:	nop
   140386eed:	lea    rcx,[rbp+0xe0]
   140386ef4:	call   0x140067e30
   140386ef9:	mov    eax,DWORD PTR [rbp-0x70]
   140386efc:	add    eax,0x3
   140386eff:	cmp    edi,eax
   140386f01:	jl     0x140386faf
   140386f07:	cmp    edi,esi
   140386f09:	jg     0x140386faf
   140386f0f:	lea    r8d,[r12-0x19]
   140386f14:	mov    edx,edi
   140386f16:	lea    rcx,[rip+0x22c34d3]        # 0x14264a3f0
   140386f1d:	call   0x1400bb120
   140386f22:	xor    r8d,r8d
   140386f25:	mov    edx,0x7
   140386f2a:	mov    r9b,0x1
   140386f2d:	lea    rcx,[rip+0x22c34bc]        # 0x14264a3f0
   140386f34:	call   0x1400bb130
   140386f39:	lea    rdx,[rip+0x1277148]        # 0x1415fe088
   140386f40:	lea    rcx,[rbp+0xc0]
   140386f47:	call   0x140068150
   140386f4c:	nop
   140386f4d:	lea    rcx,[rbp+0xe0]
   140386f54:	call   0x14006f690
   140386f59:	nop
   140386f5a:	lea    rdx,[rbp+0xe0]
   140386f61:	mov    rcx,r14
   140386f64:	call   0x14014d8e0
   140386f69:	lea    rdx,[rbp+0xe0]
   140386f70:	lea    rcx,[rbp+0xc0]
   140386f77:	call   0x1400b9d10
   140386f7c:	xor    r9d,r9d
   140386f7f:	xor    r8d,r8d
   140386f82:	lea    rdx,[rbp+0xc0]
   140386f89:	lea    rcx,[rip+0x22c3460]        # 0x14264a3f0
   140386f90:	call   0x140ad9960
   140386f95:	nop
   140386f96:	lea    rcx,[rbp+0xe0]
   140386f9d:	call   0x140067e30
   140386fa2:	nop
   140386fa3:	lea    rcx,[rbp+0xc0]
   140386faa:	call   0x140067e30
   140386faf:	mov    edi,DWORD PTR [rbp-0x70]
   140386fb2:	mov    rbx,QWORD PTR [rbp-0x38]
   140386fb6:	mov    rax,QWORD PTR [rbp+0x20]
   140386fba:	add    r13d,0x3
   140386fbe:	mov    DWORD PTR [rbp-0x64],r13d
   140386fc2:	add    rbx,0x3
   140386fc6:	mov    QWORD PTR [rbp-0x38],rbx
   140386fca:	movsxd rcx,esi
   140386fcd:	cmp    rbx,rcx
   140386fd0:	jg     0x140386fdf
   140386fd2:	add    rax,0x8
   140386fd6:	mov    QWORD PTR [rbp+0x20],rax
   140386fda:	jmp    0x140386840
   140386fdf:	mov    r14,QWORD PTR [rbp-0x80]
   140386fe3:	mov    rax,QWORD PTR [r14+0x388]
   140386fea:	sub    rax,QWORD PTR [r14+0x380]
   140386ff1:	sar    rax,0x3
   140386ff5:	lea    eax,[rax+rax*2]
   140386ff8:	mov    r13d,DWORD PTR [rbp-0x70]
   140386ffc:	cmp    eax,DWORD PTR [rbp+0x30]
   140386fff:	jle    0x140387087
   140387005:	lea    edi,[r13+0x4]
   140387009:	mov    r15d,DWORD PTR [rbp+0x40]
   14038700d:	lea    ebx,[r15*2-0x2]
   140387015:	add    ebx,r13d
   140387018:	add    ebx,r15d
   14038701b:	lea    rcx,[rbp+0xc0]
   140387022:	call   0x1400bb360
   140387027:	lea    eax,[r15-0x1]
   14038702b:	lea    eax,[rax+rax*2]
   14038702e:	mov    r9,QWORD PTR [rbp+0x0]
   140387032:	mov    r9d,DWORD PTR [r14+r9*4]
   140387036:	dec    r9d
   140387039:	mov    DWORD PTR [rsp+0x30],ebx
   14038703d:	mov    DWORD PTR [rsp+0x28],edi
   140387041:	mov    DWORD PTR [rsp+0x20],eax
   140387045:	xor    r8d,r8d
   140387048:	mov    edx,DWORD PTR [r14+0x398]
   14038704f:	lea    rcx,[rbp+0xc0]
   140387056:	call   0x1400bb380
   14038705b:	lea    r9d,[r12+0x1]
   140387060:	mov    DWORD PTR [rsp+0x28],0x0
   140387068:	movzx  eax,BYTE PTR [r14+0x39c]
   140387070:	mov    BYTE PTR [rsp+0x20],al
   140387074:	mov    r8d,DWORD PTR [rbp+0x18]
   140387078:	mov    edx,DWORD PTR [rbp+0x14]
   14038707b:	lea    rcx,[rbp+0xc0]
   140387082:	call   0x14140f4d0
   140387087:	mov    rsi,QWORD PTR [rbp+0x38]
   14038708b:	mov    ecx,DWORD PTR [rbp-0x30]
   14038708e:	inc    ecx
   140387090:	mov    DWORD PTR [rbp-0x30],ecx
   140387093:	inc    rsi
   140387096:	mov    QWORD PTR [rbp+0x38],rsi
   14038709a:	inc    QWORD PTR [rbp+0x0]
   14038709e:	cmp    ecx,0x2
   1403870a1:	lea    r15d,[r13+0x1]
   1403870a5:	jl     0x140386578
   1403870ab:	lea    rcx,[r14+0x28]
   1403870af:	call   0x14006f520
   1403870b4:	test   al,al
   1403870b6:	jne    0x140388133
   1403870bc:	xor    r8d,r8d
   1403870bf:	mov    edx,0x7
   1403870c4:	mov    r9b,0x1
   1403870c7:	lea    rcx,[rip+0x22c3322]        # 0x14264a3f0
   1403870ce:	call   0x1400bb130
   1403870d3:	mov    r8d,DWORD PTR [rbp-0x78]
   1403870d7:	add    r8d,0x2
   1403870db:	mov    edi,DWORD PTR [rbp-0x20]
   1403870de:	mov    edx,edi
   1403870e0:	lea    rcx,[rip+0x22c3309]        # 0x14264a3f0
   1403870e7:	call   0x1400bb120
   1403870ec:	xor    r9d,r9d
   1403870ef:	xor    r8d,r8d
   1403870f2:	lea    rdx,[r14+0x28]
   1403870f6:	lea    rcx,[rip+0x22c32f3]        # 0x14264a3f0
   1403870fd:	call   0x140ad9960
   140387102:	jmp    0x140388136
   140387107:	lea    eax,[rsi-0x3]
   14038710a:	cmp    ebx,eax
   14038710c:	jne    0x140387112
   14038710e:	mov    edx,DWORD PTR [rdi]
   140387110:	jmp    0x140387136
   140387112:	lea    eax,[rsi-0x2]
   140387115:	cmp    ebx,eax
   140387117:	jne    0x14038711e
   140387119:	mov    edx,DWORD PTR [rdi+0xc]
   14038711c:	jmp    0x140387136
   14038711e:	lea    eax,[rsi-0x1]
   140387121:	cmp    ebx,eax
   140387123:	jne    0x14038712a
   140387125:	mov    edx,DWORD PTR [rdi+0x18]
   140387128:	jmp    0x140387136
   14038712a:	cmp    ebx,esi
   14038712c:	jne    0x140387133
   14038712e:	mov    edx,DWORD PTR [rdi+0x24]
   140387131:	jmp    0x140387136
   140387133:	mov    edx,DWORD PTR [rdi-0xc]
   140387136:	lea    rcx,[rip+0x22c32b3]        # 0x14264a3f0
   14038713d:	call   0x140adaad0
   140387142:	xor    edx,edx
   140387144:	lea    rcx,[rip+0x2046625]        # 0x1423cd770
   14038714b:	call   0x140071f90
   140387150:	test   al,al
   140387152:	je     0x140387165
   140387154:	mov    r8b,0x1
   140387157:	xor    edx,edx
   140387159:	lea    rcx,[rip+0x22c3290]        # 0x14264a3f0
   140387160:	call   0x1400bb190
   140387165:	inc    ebx
   140387167:	cmp    ebx,esi
   140387169:	jle    0x1403865e0
   14038716f:	lea    rax,[rip+0x22c4dba]        # 0x14264bf30
   140387176:	inc    r14d
   140387179:	add    rdi,0x4
   14038717d:	cmp    rdi,rax
   140387180:	jl     0x1403865d2
   140387186:	xor    r8d,r8d
   140387189:	mov    edx,0x7
   14038718e:	mov    r9b,0x1
   140387191:	lea    rcx,[rip+0x22c3258]        # 0x14264a3f0
   140387198:	call   0x1400bb130
   14038719d:	lea    r8d,[r12+0x2]
   1403871a2:	lea    edx,[r13+0x1]
   1403871a6:	lea    rcx,[rip+0x22c3243]        # 0x14264a3f0
   1403871ad:	call   0x1400bb120
   1403871b2:	mov    ebx,DWORD PTR [rbp-0x30]
   1403871b5:	mov    eax,ebx
   1403871b7:	shl    rax,0x5
   1403871bb:	mov    r13,QWORD PTR [rbp-0x80]
   1403871bf:	lea    rdx,[r13+0x338]
   1403871c6:	add    rdx,rax
   1403871c9:	lea    rcx,[rbp+0x120]
   1403871d0:	call   0x14006f5d0
   1403871d5:	nop
   1403871d6:	lea    rcx,[rbp+0x120]
   1403871dd:	call   0x14006f520
   1403871e2:	mov    rsi,QWORD PTR [rbp+0x38]
   1403871e6:	test   al,al
   1403871e8:	je     0x14038721c
   1403871ea:	cmp    BYTE PTR [rsi+r13*1+0x378],0x0
   1403871f3:	jne    0x140387227
   1403871f5:	xor    r8d,r8d
   1403871f8:	xor    edx,edx
   1403871fa:	mov    r9b,0x1
   1403871fd:	lea    rcx,[rip+0x22c31ec]        # 0x14264a3f0
   140387204:	call   0x1400bb130
   140387209:	lea    rdx,[rip+0x1265650]        # 0x1415ec860
   140387210:	lea    rcx,[rbp+0x120]
   140387217:	call   0x14006f560
   14038721c:	cmp    BYTE PTR [rsi+r13*1+0x378],0x0
   140387225:	je     0x140387260
   140387227:	call   QWORD PTR [rip+0x125dfbb]        # 0x1415e51e8
   14038722d:	mov    r8d,eax
   140387230:	mov    eax,0x10624dd3
   140387235:	mul    r8d
   140387238:	shr    edx,0x6
   14038723b:	imul   ecx,edx,0x3e8
   140387241:	sub    r8d,ecx
   140387244:	cmp    r8d,0x1f4
   14038724b:	jae    0x140387260
   14038724d:	lea    rdx,[rip+0x12655d8]        # 0x1415ec82c
   140387254:	lea    rcx,[rbp+0x120]
   14038725b:	call   0x14006f560
   140387260:	xor    r9d,r9d
   140387263:	xor    r8d,r8d
   140387266:	lea    rdx,[rbp+0x120]
   14038726d:	lea    rcx,[rip+0x22c317c]        # 0x14264a3f0
   140387274:	call   0x140ad9960
   140387279:	lea    rax,[rbx+rbx*2]
   14038727d:	lea    rdi,[rax*8+0x0]
   140387285:	add    rdi,r13
   140387288:	mov    QWORD PTR [rbp+0xa8],rdi
   14038728f:	lea    r14,[rdi+0xe0]
   140387296:	mov    QWORD PTR [rbp-0x40],r14
   14038729a:	mov    rcx,r14
   14038729d:	call   0x14006ee50
   1403872a2:	test   rax,rax
   1403872a5:	je     0x140388084
   1403872ab:	cmp    DWORD PTR [r13+rsi*4+0x170],0x0
   1403872b4:	jle    0x140388084
   1403872ba:	mov    eax,DWORD PTR [rbp-0x70]
   1403872bd:	mov    esi,eax
   1403872bf:	mov    rcx,QWORD PTR [rbp+0x38]
   1403872c3:	sub    esi,DWORD PTR [r13+rcx*4+0x328]
   1403872cb:	add    esi,0x3
   1403872ce:	mov    DWORD PTR [rsp+0x7c],esi
   1403872d2:	mov    ecx,DWORD PTR [rbp+0x40]
   1403872d5:	lea    r15d,[rax+rcx*2]
   1403872d9:	dec    ecx
   1403872db:	add    r15d,ecx
   1403872de:	mov    DWORD PTR [rsp+0x74],r15d
   1403872e3:	lea    rdx,[rbp+0x28]
   1403872e7:	lea    rcx,[rdi+0x218]
   1403872ee:	call   0x14006f240
   1403872f3:	lea    rdx,[rbp+0xa0]
   1403872fa:	lea    rcx,[rdi+0x218]
   140387301:	call   0x14006f230
   140387306:	lea    rdx,[rbp-0x28]
   14038730a:	lea    rcx,[rdi+0x248]
   140387311:	call   0x14006f240
   140387316:	lea    rdx,[rbp+0x80]
   14038731d:	lea    rcx,[rdi+0x248]
   140387324:	call   0x14006f230
   140387329:	mov    ebx,DWORD PTR [rbp-0x30]
   14038732c:	mov    ecx,ebx
   14038732e:	shl    rcx,0x5
   140387332:	add    rcx,0x278
   140387339:	add    rcx,r13
   14038733c:	lea    rdx,[rbp+0xb0]
   140387343:	call   0x14013be70
   140387348:	mov    ecx,ebx
   14038734a:	shl    rcx,0x5
   14038734e:	add    r13,0x2b8
   140387355:	add    rcx,r13
   140387358:	lea    rdx,[rbp+0x160]
   14038735f:	call   0x14013be70
   140387364:	lea    rcx,[rdi+0x2f8]
   14038736b:	lea    rdx,[rbp-0x18]
   14038736f:	call   0x14006f240
   140387374:	movsxd r13,r15d
   140387377:	mov    QWORD PTR [rbp+0x8],r13
   14038737b:	movsxd rbx,esi
   14038737e:	mov    QWORD PTR [rbp-0x50],rbx
   140387382:	lea    eax,[r12+0x2]
   140387387:	mov    DWORD PTR [rbp+0x70],eax
   14038738a:	nop    WORD PTR [rax+rax*1+0x0]
   140387390:	mov    rax,QWORD PTR [rbp+0x28]
   140387394:	cmp    rax,QWORD PTR [rbp+0xa0]
   14038739b:	je     0x14038807c
   1403873a1:	mov    edx,0x1
   1403873a6:	mov    eax,0xff
   1403873ab:	cmovb  edx,eax
   1403873ae:	test   dl,dl
   1403873b0:	jns    0x14038807c
   1403873b6:	lea    rdx,[rbp+0x100]
   1403873bd:	lea    rcx,[rbp+0x160]
   1403873c4:	call   0x14013bd10
   1403873c9:	mov    rcx,rax
   1403873cc:	call   0x14013bc90
   1403873d1:	test   al,al
   1403873d3:	je     0x14038804b
   1403873d9:	mov    eax,DWORD PTR [rbp-0x70]
   1403873dc:	add    eax,0x3
   1403873df:	cmp    esi,eax
   1403873e1:	jl     0x1403873e8
   1403873e3:	cmp    rbx,r13
   1403873e6:	jle    0x140387408
   1403873e8:	lea    ecx,[rsi+0x1]
   1403873eb:	cmp    ecx,eax
   1403873ed:	jl     0x1403873f4
   1403873ef:	cmp    ecx,r15d
   1403873f2:	jle    0x140387408
   1403873f4:	lea    ecx,[rsi+0x2]
   1403873f7:	cmp    ecx,eax
   1403873f9:	jl     0x1403876d4
   1403873ff:	cmp    ecx,r15d
   140387402:	jg     0x1403876d4
   140387408:	xor    r8d,r8d
   14038740b:	mov    edx,0x7
   140387410:	mov    r9b,0x1
   140387413:	lea    rcx,[rip+0x22c2fd6]        # 0x14264a3f0
   14038741a:	call   0x1400bb130
   14038741f:	movsxd r14,DWORD PTR [rbp-0x74]
   140387423:	mov    eax,DWORD PTR [rbp-0x6c]
   140387426:	cmp    r14d,eax
   140387429:	jg     0x1403874f2
   14038742f:	lea    r12d,[rsi+0x3]
   140387433:	mov    r13d,DWORD PTR [rbp-0x70]
   140387437:	add    r13d,0x3
   14038743b:	mov    r15,r14
   14038743e:	xchg   ax,ax
   140387440:	mov    edi,esi
   140387442:	mov    rsi,rbx
   140387445:	cmp    DWORD PTR [rsp+0x7c],r12d
   14038744a:	jge    0x1403874d2
   140387450:	lea    rbx,[rip+0x22c49f5]        # 0x14264be4c
   140387457:	cmp    edi,r13d
   14038745a:	jl     0x1403874bd
   14038745c:	cmp    rsi,QWORD PTR [rbp+0x8]
   140387460:	jg     0x1403874bd
   140387462:	mov    r8d,r14d
   140387465:	mov    edx,edi
   140387467:	lea    rcx,[rip+0x22c2f82]        # 0x14264a3f0
   14038746e:	call   0x1400bb120
   140387473:	cmp    r14d,DWORD PTR [rbp-0x68]
   140387477:	jne    0x14038747e
   140387479:	mov    edx,DWORD PTR [rbx-0x18]
   14038747c:	jmp    0x14038748e
   14038747e:	movsxd rcx,DWORD PTR [rbp-0x6c]
   140387482:	cmp    r15,rcx
   140387485:	jne    0x14038748b
   140387487:	mov    edx,DWORD PTR [rbx]
   140387489:	jmp    0x14038748e
   14038748b:	mov    edx,DWORD PTR [rbx-0xc]
   14038748e:	lea    rcx,[rip+0x22c2f5b]        # 0x14264a3f0
   140387495:	call   0x140adaad0
   14038749a:	xor    edx,edx
   14038749c:	lea    rcx,[rip+0x20462cd]        # 0x1423cd770
   1403874a3:	call   0x140071f90
   1403874a8:	test   al,al
   1403874aa:	je     0x1403874bd
   1403874ac:	mov    r8b,0x1
   1403874af:	xor    edx,edx
   1403874b1:	lea    rcx,[rip+0x22c2f38]        # 0x14264a3f0
   1403874b8:	call   0x1400bb190
   1403874bd:	inc    edi
   1403874bf:	inc    rsi
   1403874c2:	add    rbx,0x4
   1403874c6:	cmp    edi,r12d
   1403874c9:	jl     0x140387457
   1403874cb:	mov    rbx,QWORD PTR [rbp-0x50]
   1403874cf:	mov    eax,DWORD PTR [rbp-0x6c]
   1403874d2:	inc    r14d
   1403874d5:	inc    r15
   1403874d8:	cmp    r14d,eax
   1403874db:	mov    esi,DWORD PTR [rsp+0x7c]
   1403874df:	jle    0x140387440
   1403874e5:	mov    r12d,DWORD PTR [rbp-0x68]
   1403874e9:	mov    r13,QWORD PTR [rbp+0x8]
   1403874ed:	mov    r15d,DWORD PTR [rsp+0x74]
   1403874f2:	mov    eax,DWORD PTR [rbp-0x64]
   1403874f5:	mov    DWORD PTR [rbp-0x64],eax
   1403874f8:	mov    DWORD PTR [rbp-0x68],r12d
   1403874fc:	lea    edi,[rsi+0x1]
   1403874ff:	mov    r14d,DWORD PTR [rbp-0x70]
   140387503:	lea    eax,[r14+0x3]
   140387507:	cmp    edi,eax
   140387509:	jl     0x1403875e0
   14038750f:	cmp    esi,r15d
   140387512:	jge    0x1403875e0
   140387518:	lea    rcx,[rbp+0xe0]
   14038751f:	call   0x14006f690
   140387524:	nop
   140387525:	lea    rcx,[rbp-0x28]
   140387529:	call   0x14006ee10
   14038752e:	movzx  ebx,WORD PTR [rax]
   140387531:	lea    rcx,[rbp+0x28]
   140387535:	call   0x14006ee10
   14038753a:	mov    edx,0xffffffff
   14038753f:	mov    r9d,edx
   140387542:	xor    ecx,ecx
   140387544:	mov    DWORD PTR [rsp+0x68],ecx
   140387548:	mov    DWORD PTR [rsp+0x60],ecx
   14038754c:	mov    BYTE PTR [rsp+0x58],0x1
   140387551:	mov    DWORD PTR [rsp+0x50],edx
   140387555:	mov    DWORD PTR [rsp+0x48],edx
   140387559:	mov    QWORD PTR [rsp+0x40],rcx
   14038755e:	mov    BYTE PTR [rsp+0x38],cl
   140387562:	mov    DWORD PTR [rsp+0x30],ecx
   140387566:	mov    DWORD PTR [rsp+0x28],edx
   14038756a:	mov    DWORD PTR [rsp+0x20],edx
   14038756e:	movzx  r8d,bx
   140387572:	movzx  edx,WORD PTR [rax]
   140387575:	lea    rcx,[rbp+0xe0]
   14038757c:	call   0x140a82c10
   140387581:	lea    rcx,[rbp+0xe0]
   140387588:	call   0x14052d650
   14038758d:	xor    r8d,r8d
   140387590:	mov    edx,0x7
   140387595:	mov    r9b,0x1
   140387598:	lea    rcx,[rip+0x22c2e51]        # 0x14264a3f0
   14038759f:	call   0x1400bb130
   1403875a4:	mov    r8d,DWORD PTR [rbp-0x74]
   1403875a8:	add    r8d,0x2
   1403875ac:	mov    edx,edi
   1403875ae:	lea    rcx,[rip+0x22c2e3b]        # 0x14264a3f0
   1403875b5:	call   0x1400bb120
   1403875ba:	xor    r9d,r9d
   1403875bd:	xor    r8d,r8d
   1403875c0:	lea    rdx,[rbp+0xe0]
   1403875c7:	lea    rcx,[rip+0x22c2e22]        # 0x14264a3f0
   1403875ce:	call   0x140ad9960
   1403875d3:	nop
   1403875d4:	lea    rcx,[rbp+0xe0]
   1403875db:	call   0x140067e30
   1403875e0:	add    r14d,0x3
   1403875e4:	mov    esi,DWORD PTR [rbp-0x6c]
   1403875e7:	add    esi,0xfffffffc
   1403875ea:	mov    ebx,DWORD PTR [rsp+0x7c]
   1403875ee:	lea    rdi,[rip+0x22cdecb]        # 0x1426554c0
   1403875f5:	mov    eax,DWORD PTR [rbp-0x74]
   1403875f8:	mov    DWORD PTR [rbp-0x74],eax
   1403875fb:	lea    rax,[rip+0x22cdeca]        # 0x1426554cc
   140387602:	cmp    ebx,r14d
   140387605:	jl     0x1403876b9
   14038760b:	cmp    ebx,r15d
   14038760e:	jg     0x1403876b9
   140387614:	mov    DWORD PTR [rip+0x22c2e5a],esi        # 0x14264a474
   14038761a:	mov    DWORD PTR [rip+0x22c2e58],ebx        # 0x14264a478
   140387620:	mov    rax,QWORD PTR [rbp-0x18]
   140387624:	mov    ecx,DWORD PTR [rax]
   140387626:	test   cl,0x1
   140387629:	je     0x140387630
   14038762b:	mov    edx,DWORD PTR [rdi-0x30]
   14038762e:	jmp    0x140387638
   140387630:	test   cl,0x2
   140387633:	je     0x140387647
   140387635:	mov    edx,DWORD PTR [rdi-0xc]
   140387638:	xor    r8d,r8d
   14038763b:	lea    rcx,[rip+0x22c2dae]        # 0x14264a3f0
   140387642:	call   0x140adb100
   140387647:	lea    eax,[rsi+0x1]
   14038764a:	mov    DWORD PTR [rip+0x22c2e24],eax        # 0x14264a474
   140387650:	mov    DWORD PTR [rip+0x22c2e22],ebx        # 0x14264a478
   140387656:	mov    rax,QWORD PTR [rbp-0x18]
   14038765a:	mov    ecx,DWORD PTR [rax]
   14038765c:	test   cl,0x1
   14038765f:	je     0x140387666
   140387661:	mov    edx,DWORD PTR [rdi-0x24]
   140387664:	jmp    0x14038766d
   140387666:	test   cl,0x2
   140387669:	je     0x14038767c
   14038766b:	mov    edx,DWORD PTR [rdi]
   14038766d:	xor    r8d,r8d
   140387670:	lea    rcx,[rip+0x22c2d79]        # 0x14264a3f0
   140387677:	call   0x140adb100
   14038767c:	lea    eax,[rsi+0x2]
   14038767f:	mov    DWORD PTR [rip+0x22c2def],eax        # 0x14264a474
   140387685:	mov    DWORD PTR [rip+0x22c2ded],ebx        # 0x14264a478
   14038768b:	mov    rax,QWORD PTR [rbp-0x18]
   14038768f:	mov    ecx,DWORD PTR [rax]
   140387691:	test   cl,0x1
   140387694:	je     0x14038769b
   140387696:	mov    edx,DWORD PTR [rdi-0x18]
   140387699:	jmp    0x1403876a3
   14038769b:	test   cl,0x2
   14038769e:	je     0x1403876b2
   1403876a0:	mov    edx,DWORD PTR [rdi+0xc]
   1403876a3:	xor    r8d,r8d
   1403876a6:	lea    rcx,[rip+0x22c2d43]        # 0x14264a3f0
   1403876ad:	call   0x140adb100
   1403876b2:	lea    rax,[rip+0x22cde13]        # 0x1426554cc
   1403876b9:	inc    ebx
   1403876bb:	add    rdi,0x4
   1403876bf:	cmp    rdi,rax
   1403876c2:	jl     0x140387602
   1403876c8:	mov    esi,DWORD PTR [rsp+0x7c]
   1403876cc:	mov    rbx,QWORD PTR [rbp-0x50]
   1403876d0:	mov    r14,QWORD PTR [rbp-0x40]
   1403876d4:	add    esi,0x3
   1403876d7:	mov    DWORD PTR [rsp+0x7c],esi
   1403876db:	add    rbx,0x3
   1403876df:	mov    QWORD PTR [rbp-0x50],rbx
   1403876e3:	cmp    rbx,r13
   1403876e6:	jg     0x14038807c
   1403876ec:	lea    rdx,[rbp+0x140]
   1403876f3:	lea    rcx,[rbp+0xb0]
   1403876fa:	call   0x14013bd10
   1403876ff:	mov    rcx,rax
   140387702:	call   0x14013bc90
   140387707:	test   al,al
   140387709:	je     0x14038804b
   14038770f:	xor    bl,bl
   140387711:	mov    BYTE PTR [rsp+0x78],bl
   140387715:	lea    rdx,[rbp-0x10]
   140387719:	mov    rcx,r14
   14038771c:	call   0x14006f240
   140387721:	lea    rdx,[rbp+0x78]
   140387725:	mov    rcx,r14
   140387728:	call   0x14006f230
   14038772d:	mov    rcx,QWORD PTR [rbp+0xa8]
   140387734:	add    rcx,0x110
   14038773b:	lea    rdx,[rbp+0x50]
   14038773f:	call   0x14006f240
   140387744:	mov    r15d,DWORD PTR [rbp-0x70]
   140387748:	add    r15d,0x3
   14038774c:	mov    DWORD PTR [rbp-0x5c],r15d
   140387750:	mov    rax,QWORD PTR [rbp-0x10]
   140387754:	cmp    rax,QWORD PTR [rbp+0x78]
   140387758:	je     0x140388043
   14038775e:	mov    edx,0x1
   140387763:	mov    ecx,0xff
   140387768:	cmovb  edx,ecx
   14038776b:	test   dl,dl
   14038776d:	jns    0x140388043
   140387773:	mov    rcx,QWORD PTR [rbp+0x50]
   140387777:	test   BYTE PTR [rcx],0x2
   14038777a:	je     0x140387786
   14038777c:	test   bl,bl
   14038777e:	je     0x140388032
   140387784:	jmp    0x1403877e9
   140387786:	lea    rcx,[rbp-0x10]
   14038778a:	call   0x14006ee10
   14038778f:	mov    rcx,QWORD PTR [rax]
   140387792:	mov    rax,QWORD PTR [rcx]
   140387795:	call   QWORD PTR [rax]
   140387797:	movsx  ebx,ax
   14038779a:	lea    rcx,[rbp+0x28]
   14038779e:	call   0x14006ee10
   1403877a3:	cmp    ebx,DWORD PTR [rax]
   1403877a5:	jne    0x140388028
   1403877ab:	lea    rcx,[rbp-0x10]
   1403877af:	call   0x14006ee10
   1403877b4:	mov    rcx,QWORD PTR [rax]
   1403877b7:	mov    rax,QWORD PTR [rcx]
   1403877ba:	call   QWORD PTR [rax+0x8]
   1403877bd:	movsx  ebx,ax
   1403877c0:	lea    rcx,[rbp-0x28]
   1403877c4:	call   0x14006ee10
   1403877c9:	cmp    ebx,DWORD PTR [rax]
   1403877cb:	jne    0x140388028
   1403877d1:	lea    rcx,[rbp+0x50]
   1403877d5:	call   0x14006ee10
   1403877da:	movzx  ebx,BYTE PTR [rax]
   1403877dd:	shr    bl,0x2
   1403877e0:	not    bl
   1403877e2:	and    bl,0x1
   1403877e5:	mov    BYTE PTR [rsp+0x78],bl
   1403877e9:	lea    rcx,[rbp-0x10]
   1403877ed:	call   0x14006ee10
   1403877f2:	mov    r14,QWORD PTR [rax]
   1403877f5:	mov    QWORD PTR [rbp-0x38],r14
   1403877f9:	mov    rbx,QWORD PTR [rbp-0x50]
   1403877fd:	cmp    esi,DWORD PTR [rbp+0x74]
   140387800:	jl     0x14038800d
   140387806:	cmp    rbx,r13
   140387809:	jg     0x14038800d
   14038780f:	lea    rcx,[rbp+0x50]
   140387813:	call   0x14006ee10
   140387818:	movzx  r13d,BYTE PTR [rax]
   14038781c:	and    r13d,0x2
   140387820:	mov    DWORD PTR [rbp-0x58],r13d
   140387824:	xor    r8d,r8d
   140387827:	mov    edx,0x7
   14038782c:	mov    r9b,0x1
   14038782f:	lea    rcx,[rip+0x22c2bba]        # 0x14264a3f0
   140387836:	call   0x1400bb130
   14038783b:	movsxd rdi,DWORD PTR [rbp-0x74]
   14038783f:	mov    ecx,DWORD PTR [rbp-0x6c]
   140387842:	cmp    edi,ecx
   140387844:	jg     0x140387952
   14038784a:	lea    r13d,[rsi+0x3]
   14038784e:	mov    r15,rdi
   140387851:	mov    r14,rbx
   140387854:	cmp    DWORD PTR [rsp+0x7c],r13d
   140387859:	jge    0x140387935
   14038785f:	movsxd r12,r12d
   140387862:	lea    rbx,[rip+0x22c4733]        # 0x14264bf9c
   140387869:	mov    eax,DWORD PTR [rbp-0x5c]
   14038786c:	nop    DWORD PTR [rax+0x0]
   140387870:	cmp    esi,eax
   140387872:	jl     0x140387918
   140387878:	cmp    r14,QWORD PTR [rbp+0x8]
   14038787c:	jg     0x140387918
   140387882:	mov    r8d,DWORD PTR [rbp-0x58]
   140387886:	add    r8d,edi
   140387889:	mov    edx,esi
   14038788b:	lea    rcx,[rip+0x22c2b5e]        # 0x14264a3f0
   140387892:	call   0x1400bb120
   140387897:	cmp    r15,r12
   14038789a:	jne    0x1403878a1
   14038789c:	mov    edx,DWORD PTR [rbx-0xc]
   14038789f:	jmp    0x1403878e6
   1403878a1:	mov    ecx,DWORD PTR [rbp-0x68]
   1403878a4:	lea    eax,[rcx+0x1]
   1403878a7:	cmp    edi,eax
   1403878a9:	jne    0x1403878af
   1403878ab:	mov    edx,DWORD PTR [rbx]
   1403878ad:	jmp    0x1403878e6
   1403878af:	cmp    edi,DWORD PTR [rbp+0x70]
   1403878b2:	jne    0x1403878b8
   1403878b4:	mov    edx,DWORD PTR [rbx]
   1403878b6:	jmp    0x1403878e6
   1403878b8:	lea    eax,[rcx+0x3]
   1403878bb:	cmp    edi,eax
   1403878bd:	jne    0x1403878c3
   1403878bf:	mov    edx,DWORD PTR [rbx]
   1403878c1:	jmp    0x1403878e6
   1403878c3:	lea    eax,[rcx+0x4]
   1403878c6:	cmp    edi,eax
   1403878c8:	jne    0x1403878cf
   1403878ca:	mov    edx,DWORD PTR [rbx+0xc]
   1403878cd:	jmp    0x1403878e6
   1403878cf:	movsxd rcx,DWORD PTR [rbp-0x6c]
   1403878d3:	cmp    r15,rcx
   1403878d6:	jne    0x1403878e0
   1403878d8:	mov    edx,DWORD PTR [rbx-0x1ec]
   1403878de:	jmp    0x1403878e6
   1403878e0:	mov    edx,DWORD PTR [rbx-0x1f8]
   1403878e6:	lea    rcx,[rip+0x22c2b03]        # 0x14264a3f0
   1403878ed:	call   0x140adaad0
   1403878f2:	xor    edx,edx
   1403878f4:	lea    rcx,[rip+0x2045e75]        # 0x1423cd770
   1403878fb:	call   0x140071f90
   140387900:	test   al,al
   140387902:	je     0x140387915
   140387904:	mov    r8b,0x1
   140387907:	xor    edx,edx
   140387909:	lea    rcx,[rip+0x22c2ae0]        # 0x14264a3f0
   140387910:	call   0x1400bb190
   140387915:	mov    eax,DWORD PTR [rbp-0x5c]
   140387918:	inc    esi
   14038791a:	inc    r14
   14038791d:	add    rbx,0x4
   140387921:	cmp    esi,r13d
   140387924:	jl     0x140387870
   14038792a:	mov    r12d,DWORD PTR [rbp-0x68]
   14038792e:	mov    rbx,QWORD PTR [rbp-0x50]
   140387932:	mov    ecx,DWORD PTR [rbp-0x6c]
   140387935:	inc    edi
   140387937:	inc    r15
   14038793a:	cmp    edi,ecx
   14038793c:	mov    esi,DWORD PTR [rsp+0x7c]
   140387940:	jle    0x140387851
   140387946:	mov    r13d,DWORD PTR [rbp-0x58]
   14038794a:	mov    r14,QWORD PTR [rbp-0x38]
   14038794e:	mov    r15d,DWORD PTR [rbp-0x5c]
   140387952:	mov    ecx,DWORD PTR [rsp+0x74]
   140387956:	cmp    esi,r15d
   140387959:	jl     0x140387a0c
   14038795f:	lea    eax,[rcx-0x2]
   140387962:	cmp    esi,eax
   140387964:	jg     0x140387a0c
   14038796a:	mov    ebx,DWORD PTR [rbp-0x64]
   14038796d:	add    ebx,r13d
   140387970:	xor    edx,edx
   140387972:	lea    rcx,[rip+0x2045df7]        # 0x1423cd770
   140387979:	call   0x140071f90
   14038797e:	lea    rcx,[rip+0x22c2a6b]        # 0x14264a3f0
   140387985:	test   al,al
   140387987:	je     0x1403879d0
   140387989:	mov    r8d,ebx
   14038798c:	mov    edx,esi
   14038798e:	call   0x1400bb120
   140387993:	mov    edx,DWORD PTR [rbp-0x60]
   140387996:	mov    rcx,r14
   140387999:	call   0x140c7cbc0
   14038799e:	test   eax,eax
   1403879a0:	je     0x140387a08
   1403879a2:	mov    BYTE PTR [rsp+0x30],0x0
   1403879a7:	mov    DWORD PTR [rsp+0x28],0x3
   1403879af:	mov    DWORD PTR [rsp+0x20],0x5
   1403879b7:	mov    r9d,0x2
   1403879bd:	mov    r8d,r9d
   1403879c0:	mov    edx,eax
   1403879c2:	lea    rcx,[rip+0x22c2a27]        # 0x14264a3f0
   1403879c9:	call   0x140adad70
   1403879ce:	jmp    0x140387a08
   1403879d0:	lea    r8d,[rbx+0x2]
   1403879d4:	lea    edx,[rsi+0x1]
   1403879d7:	call   0x1400bb120
   1403879dc:	mov    rax,QWORD PTR [r14]
   1403879df:	xor    edx,edx
   1403879e1:	mov    rcx,r14
   1403879e4:	call   QWORD PTR [rax+0x370]
   1403879ea:	mov    rax,QWORD PTR [r14]
   1403879ed:	mov    rcx,r14
   1403879f0:	call   QWORD PTR [rax+0x640]
   1403879f6:	movzx  edx,al
   1403879f9:	mov    r8b,0x1
   1403879fc:	lea    rcx,[rip+0x22c29ed]        # 0x14264a3f0
   140387a03:	call   0x1400bb190
   140387a08:	mov    ecx,DWORD PTR [rsp+0x74]
   140387a0c:	lea    eax,[rsi+0x1]
   140387a0f:	cmp    eax,r15d
   140387a12:	jl     0x140387bf8
   140387a18:	cmp    esi,ecx
   140387a1a:	jge    0x140387bf8
   140387a20:	xor    sil,sil
   140387a23:	xor    bl,bl
   140387a25:	xor    r15b,r15b
   140387a28:	xor    ecx,ecx
   140387a2a:	mov    r14d,ecx
   140387a2d:	mov    rax,QWORD PTR [rbp-0x38]
   140387a31:	mov    rdx,QWORD PTR [rax+0x38]
   140387a35:	mov    rax,QWORD PTR [rax+0x40]
   140387a39:	sub    rax,rdx
   140387a3c:	sar    rax,0x3
   140387a40:	test   rax,rax
   140387a43:	je     0x140387aa7
   140387a45:	mov    edi,ecx
   140387a47:	mov    r12,QWORD PTR [rbp-0x38]
   140387a4b:	mov    r13d,0x1
   140387a51:	mov    rcx,QWORD PTR [rdx+rdi*1]
   140387a55:	mov    rax,QWORD PTR [rcx]
   140387a58:	call   QWORD PTR [rax+0x10]
   140387a5b:	movzx  ebx,bl
   140387a5e:	cmp    eax,0x2c
   140387a61:	cmove  ebx,r13d
   140387a65:	mov    rax,QWORD PTR [r12+0x38]
   140387a6a:	mov    rcx,QWORD PTR [rdi+rax*1]
   140387a6e:	mov    rax,QWORD PTR [rcx]
   140387a71:	call   QWORD PTR [rax+0x10]
   140387a74:	movzx  esi,sil
   140387a78:	cmp    eax,0x2b
   140387a7b:	cmove  esi,r13d
   140387a7f:	inc    r14d
   140387a82:	lea    rdi,[rdi+0x8]
   140387a86:	mov    rdx,QWORD PTR [r12+0x38]
   140387a8b:	mov    rcx,QWORD PTR [r12+0x40]
   140387a90:	sub    rcx,rdx
   140387a93:	sar    rcx,0x3
   140387a97:	movsxd rax,r14d
   140387a9a:	cmp    rax,rcx
   140387a9d:	jb     0x140387a51
   140387a9f:	mov    r12d,DWORD PTR [rbp-0x68]
   140387aa3:	mov    r13d,DWORD PTR [rbp-0x58]
   140387aa7:	mov    r14,QWORD PTR [rbp-0x38]
   140387aab:	cmp    QWORD PTR [rbp+0x38],0x1
   140387ab0:	jne    0x140387ac9
   140387ab2:	mov    rcx,r14
   140387ab5:	call   0x140cb2210
   140387aba:	movzx  r15d,r15b
   140387abe:	test   al,al
   140387ac0:	mov    eax,0x1
   140387ac5:	cmovne r15d,eax
   140387ac9:	test   bl,bl
   140387acb:	je     0x140387ad4
   140387acd:	mov    edx,0x2
   140387ad2:	jmp    0x140387b00
   140387ad4:	test   sil,sil
   140387ad7:	je     0x140387ae0
   140387ad9:	mov    edx,0x4
   140387ade:	jmp    0x140387b00
   140387ae0:	test   r15b,r15b
   140387ae3:	je     0x140387aec
   140387ae5:	mov    edx,0x5
   140387aea:	jmp    0x140387b00
   140387aec:	test   DWORD PTR [r14+0x10],0x4000
   140387af4:	mov    edx,0x7
   140387af9:	jne    0x140387b00
   140387afb:	mov    edx,0x6
   140387b00:	mov    r9b,0x1
   140387b03:	xor    r8d,r8d
   140387b06:	lea    rcx,[rip+0x22c28e3]        # 0x14264a3f0
   140387b0d:	call   0x1400bb130
   140387b12:	mov    edi,DWORD PTR [rbp-0x74]
   140387b15:	lea    r8d,[rdi+0x7]
   140387b19:	add    r8d,r13d
   140387b1c:	mov    esi,DWORD PTR [rsp+0x7c]
   140387b20:	lea    edx,[rsi+0x1]
   140387b23:	lea    rcx,[rip+0x22c28c6]        # 0x14264a3f0
   140387b2a:	call   0x1400bb120
   140387b2f:	lea    rcx,[rbp+0xe0]
   140387b36:	call   0x14006f690
   140387b3b:	nop
   140387b3c:	mov    r9d,0xffffffff
   140387b42:	xor    r8d,r8d
   140387b45:	lea    rdx,[rbp+0xe0]
   140387b4c:	mov    rcx,r14
   140387b4f:	call   0x140c65450
   140387b54:	mov    ebx,DWORD PTR [rbp-0x6c]
   140387b57:	sub    ebx,r13d
   140387b5a:	sub    ebx,edi
   140387b5c:	lea    eax,[rbx-0x16]
   140387b5f:	movsxd rcx,eax
   140387b62:	cmp    QWORD PTR [rbp+0xf0],rcx
   140387b69:	jb     0x140387bce
   140387b6b:	lea    esi,[rbx-0x17]
   140387b6e:	movsxd rdi,ebx
   140387b71:	test   esi,esi
   140387b73:	js     0x140387b88
   140387b75:	lea    rdx,[rdi-0x17]
   140387b79:	xor    r8d,r8d
   140387b7c:	lea    rcx,[rbp+0xe0]
   140387b83:	call   0x1400e1230
   140387b88:	cmp    esi,0x3
   140387b8b:	jle    0x140387bca
   140387b8d:	lea    rdx,[rdi-0x1a]
   140387b91:	lea    rcx,[rbp+0xe0]
   140387b98:	call   0x1400fb540
   140387b9d:	mov    BYTE PTR [rax],0x2e
   140387ba0:	lea    eax,[rbx-0x19]
   140387ba3:	movsxd rdx,eax
   140387ba6:	lea    rcx,[rbp+0xe0]
   140387bad:	call   0x1400fb540
   140387bb2:	mov    BYTE PTR [rax],0x2e
   140387bb5:	lea    eax,[rbx-0x18]
   140387bb8:	movsxd rdx,eax
   140387bbb:	lea    rcx,[rbp+0xe0]
   140387bc2:	call   0x1400fb540
   140387bc7:	mov    BYTE PTR [rax],0x2e
   140387bca:	mov    esi,DWORD PTR [rsp+0x7c]
   140387bce:	xor    r9d,r9d
   140387bd1:	xor    r8d,r8d
   140387bd4:	lea    rdx,[rbp+0xe0]
   140387bdb:	lea    rcx,[rip+0x22c280e]        # 0x14264a3f0
   140387be2:	call   0x140ad9960
   140387be7:	nop
   140387be8:	lea    rcx,[rbp+0xe0]
   140387bef:	call   0x14006f850
   140387bf4:	mov    r15d,DWORD PTR [rbp-0x5c]
   140387bf8:	lea    eax,[rsi+0x2]
   140387bfb:	cmp    eax,r15d
   140387bfe:	jl     0x140387d3f
   140387c04:	cmp    eax,DWORD PTR [rsp+0x74]
   140387c08:	jg     0x140387d3f
   140387c0e:	xor    edi,edi
   140387c10:	test   BYTE PTR [r14+0x10],0x40
   140387c15:	je     0x140387d3f
   140387c1b:	lea    rdx,[rbp+0x58]
   140387c1f:	lea    rcx,[r14+0x38]
   140387c23:	call   0x14006f240
   140387c28:	lea    rdx,[rbp+0x60]
   140387c2c:	lea    rcx,[r14+0x38]
   140387c30:	call   0x14006f230
   140387c35:	mov    rax,QWORD PTR [rbp+0x58]
   140387c39:	mov    r12d,0x1
   140387c3f:	mov    r14d,0xff
   140387c45:	cmp    rax,QWORD PTR [rbp+0x60]
   140387c49:	je     0x140387c8b
   140387c4b:	mov    edx,r12d
   140387c4e:	cmovb  edx,r14d
   140387c52:	test   dl,dl
   140387c54:	jns    0x140387c8b
   140387c56:	mov    rcx,QWORD PTR [rax]
   140387c59:	mov    rax,QWORD PTR [rcx]
   140387c5c:	call   QWORD PTR [rax+0x10]
   140387c5f:	cmp    eax,0xa
   140387c62:	jne    0x140387c7d
   140387c64:	lea    rcx,[rbp+0x58]
   140387c68:	call   0x14006ee10
   140387c6d:	mov    rcx,QWORD PTR [rax]
   140387c70:	mov    rax,QWORD PTR [rcx]
   140387c73:	call   QWORD PTR [rax+0x18]
   140387c76:	test   rax,rax
   140387c79:	je     0x140387c7d
   140387c7b:	inc    edi
   140387c7d:	mov    rax,QWORD PTR [rbp+0x58]
   140387c81:	add    rax,0x8
   140387c85:	mov    QWORD PTR [rbp+0x58],rax
   140387c89:	jmp    0x140387c45
   140387c8b:	test   edi,edi
   140387c8d:	mov    r12d,DWORD PTR [rbp-0x68]
   140387c91:	mov    r14,QWORD PTR [rbp-0x38]
   140387c95:	jle    0x140387d3f
   140387c9b:	mov    r8d,DWORD PTR [rbp-0x74]
   140387c9f:	add    r8d,0x7
   140387ca3:	add    r8d,r13d
   140387ca6:	lea    edx,[rsi+0x2]
   140387ca9:	lea    rcx,[rip+0x22c2740]        # 0x14264a3f0
   140387cb0:	call   0x1400bb120
   140387cb5:	lea    rdx,[rip+0x1293e94]        # 0x14161bb50
   140387cbc:	lea    rcx,[rbp+0xe0]
   140387cc3:	call   0x140068150
   140387cc8:	nop
   140387cc9:	lea    rdx,[rbp+0xe0]
   140387cd0:	mov    ecx,edi
   140387cd2:	call   0x14052c130
   140387cd7:	lea    rdx,[rip+0x126f50e]        # 0x1415f71ec
   140387cde:	lea    rcx,[rbp+0xe0]
   140387ce5:	call   0x14006f560
   140387cea:	cmp    edi,0x1
   140387ced:	je     0x140387d02
   140387cef:	lea    rdx,[rip+0x12615a2]        # 0x1415e9298
   140387cf6:	lea    rcx,[rbp+0xe0]
   140387cfd:	call   0x14006f560
   140387d02:	xor    r8d,r8d
   140387d05:	mov    edx,0x6
   140387d0a:	mov    r9b,0x1
   140387d0d:	lea    rcx,[rip+0x22c26dc]        # 0x14264a3f0
   140387d14:	call   0x1400bb130
   140387d19:	xor    r9d,r9d
   140387d1c:	xor    r8d,r8d
   140387d1f:	lea    rdx,[rbp+0xe0]
   140387d26:	lea    rcx,[rip+0x22c26c3]        # 0x14264a3f0
   140387d2d:	call   0x140ad9960
   140387d32:	nop
   140387d33:	lea    rcx,[rbp+0xe0]
   140387d3a:	call   0x140067e30
   140387d3f:	mov    eax,DWORD PTR [rbp-0x64]
   140387d42:	mov    DWORD PTR [rbp-0x64],eax
   140387d45:	mov    eax,DWORD PTR [rbp-0x74]
   140387d48:	mov    DWORD PTR [rbp-0x74],eax
   140387d4b:	mov    DWORD PTR [rbp-0x68],r12d
   140387d4f:	lea    edi,[rsi+0x1]
   140387d52:	lea    eax,[rsi+0x1]
   140387d55:	mov    r13d,DWORD PTR [rsp+0x74]
   140387d5a:	cmp    eax,r15d
   140387d5d:	jl     0x140387e77
   140387d63:	cmp    esi,r13d
   140387d66:	jge    0x140387e80
   140387d6c:	lea    rcx,[rip+0x200952d]        # 0x1423912a0
   140387d73:	call   0x140e64560
   140387d78:	mov    ebx,eax
   140387d7a:	mov    rax,QWORD PTR [rbp-0x80]
   140387d7e:	mov    rcx,QWORD PTR [rax+0xd8]
   140387d85:	test   rcx,rcx
   140387d88:	je     0x140387d9d
   140387d8a:	mov    edx,0x49
   140387d8f:	call   0x14133e7a0
   140387d94:	xor    ebx,ebx
   140387d96:	test   eax,eax
   140387d98:	cmovns ebx,eax
   140387d9b:	inc    ebx
   140387d9d:	test   ebx,ebx
   140387d9f:	jle    0x140387e80
   140387da5:	lea    edi,[rsi+0x2]
   140387da8:	mov    r8d,DWORD PTR [rbp-0x6c]
   140387dac:	add    r8d,0xffffffe7
   140387db0:	lea    edx,[rsi+0x1]
   140387db3:	lea    rcx,[rip+0x22c2636]        # 0x14264a3f0
   140387dba:	call   0x1400bb120
   140387dbf:	lea    rcx,[rbp+0xc0]
   140387dc6:	call   0x14006f690
   140387dcb:	nop
   140387dcc:	mov    BYTE PTR [rsp+0x20],0x1
   140387dd1:	xor    r9d,r9d
   140387dd4:	mov    rax,QWORD PTR [rbp-0x80]
   140387dd8:	mov    r8,QWORD PTR [rax+0xc0]
   140387ddf:	mov    rdx,QWORD PTR [rax+0xb8]
   140387de6:	mov    rcx,r14
   140387de9:	call   0x140c66020
   140387dee:	mov    edx,eax
   140387df0:	lea    r8d,[rbx-0x1]
   140387df4:	lea    rcx,[rbp+0xc0]
   140387dfb:	call   0x14077f920
   140387e00:	xor    r8d,r8d
   140387e03:	mov    edx,0x6
   140387e08:	mov    r9b,0x1
   140387e0b:	lea    rcx,[rip+0x22c25de]        # 0x14264a3f0
   140387e12:	call   0x1400bb130
   140387e17:	lea    rdx,[rip+0x1276262]        # 0x1415fe080
   140387e1e:	lea    rcx,[rbp+0xe0]
   140387e25:	call   0x140068150
   140387e2a:	nop
   140387e2b:	xor    r9d,r9d
   140387e2e:	mov    r8b,0x3
   140387e31:	lea    rdx,[rbp+0xe0]
   140387e38:	lea    rcx,[rip+0x22c25b1]        # 0x14264a3f0
   140387e3f:	call   0x140ad9960
   140387e44:	nop
   140387e45:	lea    rcx,[rbp+0xe0]
   140387e4c:	call   0x140067e30
   140387e51:	xor    r9d,r9d
   140387e54:	xor    r8d,r8d
   140387e57:	lea    rdx,[rbp+0xc0]
   140387e5e:	lea    rcx,[rip+0x22c258b]        # 0x14264a3f0
   140387e65:	call   0x140ad9960
   140387e6a:	nop
   140387e6b:	lea    rcx,[rbp+0xc0]
   140387e72:	call   0x140067e30
   140387e77:	cmp    edi,r15d
   140387e7a:	jl     0x140387f30
   140387e80:	cmp    edi,r13d
   140387e83:	jg     0x140387f30
   140387e89:	mov    r8d,DWORD PTR [rbp-0x6c]
   140387e8d:	add    r8d,0xffffffe7
   140387e91:	mov    edx,edi
   140387e93:	lea    rcx,[rip+0x22c2556]        # 0x14264a3f0
   140387e9a:	call   0x1400bb120
   140387e9f:	xor    r8d,r8d
   140387ea2:	mov    edx,0x7
   140387ea7:	mov    r9b,0x1
   140387eaa:	lea    rcx,[rip+0x22c253f]        # 0x14264a3f0
   140387eb1:	call   0x1400bb130
   140387eb6:	lea    rdx,[rip+0x12761cb]        # 0x1415fe088
   140387ebd:	lea    rcx,[rbp+0xe0]
   140387ec4:	call   0x140068150
   140387ec9:	nop
   140387eca:	lea    rcx,[rbp+0xc0]
   140387ed1:	call   0x14006f690
   140387ed6:	nop
   140387ed7:	lea    rdx,[rbp+0xc0]
   140387ede:	mov    rcx,r14
   140387ee1:	call   0x14014d8e0
   140387ee6:	lea    rdx,[rbp+0xc0]
   140387eed:	lea    rcx,[rbp+0xe0]
   140387ef4:	call   0x1400b9d10
   140387ef9:	xor    r9d,r9d
   140387efc:	xor    r8d,r8d
   140387eff:	lea    rdx,[rbp+0xe0]
   140387f06:	lea    rcx,[rip+0x22c24e3]        # 0x14264a3f0
   140387f0d:	call   0x140ad9960
   140387f12:	nop
   140387f13:	lea    rcx,[rbp+0xc0]
   140387f1a:	call   0x140067e30
   140387f1f:	nop
   140387f20:	lea    rcx,[rbp+0xe0]
   140387f27:	call   0x140067e30
   140387f2c:	nop    DWORD PTR [rax+0x0]
   140387f30:	mov    esi,DWORD PTR [rbp-0x6c]
   140387f33:	add    esi,0xfffffffc
   140387f36:	mov    ebx,DWORD PTR [rsp+0x7c]
   140387f3a:	lea    rdi,[rip+0x22cd57f]        # 0x1426554c0
   140387f41:	lea    rax,[rip+0x22cd584]        # 0x1426554cc
   140387f48:	nop    DWORD PTR [rax+rax*1+0x0]
   140387f50:	cmp    ebx,r15d
   140387f53:	jl     0x140387ff2
   140387f59:	cmp    ebx,r13d
   140387f5c:	jg     0x140387ff2
   140387f62:	mov    DWORD PTR [rip+0x22c250c],esi        # 0x14264a474
   140387f68:	mov    DWORD PTR [rip+0x22c250a],ebx        # 0x14264a478
   140387f6e:	mov    rax,QWORD PTR [rbp+0x50]
   140387f72:	xor    r8d,r8d
   140387f75:	lea    rcx,[rip+0x22c2474]        # 0x14264a3f0
   140387f7c:	test   BYTE PTR [rax],0x1
   140387f7f:	je     0x140387f86
   140387f81:	mov    edx,DWORD PTR [rdi-0x30]
   140387f84:	jmp    0x140387f89
   140387f86:	mov    edx,DWORD PTR [rdi-0xc]
   140387f89:	call   0x140adb100
   140387f8e:	lea    eax,[rsi+0x1]
   140387f91:	mov    DWORD PTR [rip+0x22c24e1],ebx        # 0x14264a478
   140387f97:	mov    DWORD PTR [rip+0x22c24d7],eax        # 0x14264a474
   140387f9d:	mov    rax,QWORD PTR [rbp+0x50]
   140387fa1:	xor    r8d,r8d
   140387fa4:	lea    rcx,[rip+0x22c2445]        # 0x14264a3f0
   140387fab:	test   BYTE PTR [rax],0x1
   140387fae:	je     0x140387fb5
   140387fb0:	mov    edx,DWORD PTR [rdi-0x24]
   140387fb3:	jmp    0x140387fb7
   140387fb5:	mov    edx,DWORD PTR [rdi]
   140387fb7:	call   0x140adb100
   140387fbc:	lea    eax,[rsi+0x2]
   140387fbf:	mov    DWORD PTR [rip+0x22c24b3],ebx        # 0x14264a478
   140387fc5:	mov    DWORD PTR [rip+0x22c24a9],eax        # 0x14264a474
   140387fcb:	mov    rax,QWORD PTR [rbp+0x50]
   140387fcf:	xor    r8d,r8d
   140387fd2:	lea    rcx,[rip+0x22c2417]        # 0x14264a3f0
   140387fd9:	test   BYTE PTR [rax],0x1
   140387fdc:	je     0x140387fe3
   140387fde:	mov    edx,DWORD PTR [rdi-0x18]
   140387fe1:	jmp    0x140387fe6
   140387fe3:	mov    edx,DWORD PTR [rdi+0xc]
   140387fe6:	call   0x140adb100
   140387feb:	lea    rax,[rip+0x22cd4da]        # 0x1426554cc
   140387ff2:	inc    ebx
   140387ff4:	add    rdi,0x4
   140387ff8:	cmp    rdi,rax
   140387ffb:	jl     0x140387f50
   140388001:	mov    esi,DWORD PTR [rsp+0x7c]
   140388005:	mov    r13,QWORD PTR [rbp+0x8]
   140388009:	mov    rbx,QWORD PTR [rbp-0x50]
   14038800d:	add    esi,0x3
   140388010:	mov    DWORD PTR [rsp+0x7c],esi
   140388014:	add    rbx,0x3
   140388018:	mov    QWORD PTR [rbp-0x50],rbx
   14038801c:	cmp    rbx,r13
   14038801f:	jg     0x140388047
   140388021:	movzx  ebx,BYTE PTR [rsp+0x78]
   140388026:	jmp    0x14038802e
   140388028:	xor    bl,bl
   14038802a:	mov    BYTE PTR [rsp+0x78],bl
   14038802e:	mov    rax,QWORD PTR [rbp-0x10]
   140388032:	add    rax,0x8
   140388036:	mov    QWORD PTR [rbp-0x10],rax
   14038803a:	inc    QWORD PTR [rbp+0x50]
   14038803e:	jmp    0x140387754
   140388043:	mov    rbx,QWORD PTR [rbp-0x50]
   140388047:	mov    r14,QWORD PTR [rbp-0x40]
   14038804b:	add    QWORD PTR [rbp+0x28],0x4
   140388050:	add    QWORD PTR [rbp-0x28],0x4
   140388055:	lea    rcx,[rbp+0xb0]
   14038805c:	call   0x14013c1c0
   140388061:	lea    rcx,[rbp+0x160]
   140388068:	call   0x14013c1c0
   14038806d:	add    QWORD PTR [rbp-0x18],0x4
   140388072:	mov    r15d,DWORD PTR [rsp+0x74]
   140388077:	jmp    0x140387390
   14038807c:	mov    r15d,DWORD PTR [rbp-0x6c]
   140388080:	mov    rsi,QWORD PTR [rbp+0x38]
   140388084:	mov    r14,QWORD PTR [rbp-0x80]
   140388088:	mov    eax,DWORD PTR [rbp+0x30]
   14038808b:	mov    r13d,DWORD PTR [rbp-0x70]
   14038808f:	cmp    DWORD PTR [r14+rsi*4+0x170],eax
   140388097:	jle    0x140388122
   14038809d:	lea    edi,[r13+0x4]
   1403880a1:	mov    r12d,DWORD PTR [rbp+0x40]
   1403880a5:	lea    ebx,[r12*2-0x2]
   1403880ad:	add    ebx,r13d
   1403880b0:	add    ebx,r12d
   1403880b3:	lea    rcx,[rbp+0xc0]
   1403880ba:	call   0x1400bb360
   1403880bf:	lea    eax,[r12-0x1]
   1403880c4:	lea    eax,[rax+rax*2]
   1403880c7:	mov    r9d,DWORD PTR [r14+rsi*4+0x170]
   1403880cf:	dec    r9d
   1403880d2:	mov    DWORD PTR [rsp+0x30],ebx
   1403880d6:	mov    DWORD PTR [rsp+0x28],edi
   1403880da:	mov    DWORD PTR [rsp+0x20],eax
   1403880de:	xor    r8d,r8d
   1403880e1:	mov    edx,DWORD PTR [r14+rsi*4+0x328]
   1403880e9:	lea    rcx,[rbp+0xc0]
   1403880f0:	call   0x1400bb380
   1403880f5:	lea    r9d,[r15+0x1]
   1403880f9:	mov    DWORD PTR [rsp+0x28],0x0
   140388101:	movzx  eax,BYTE PTR [r14+rsi*1+0x330]
   14038810a:	mov    BYTE PTR [rsp+0x20],al
   14038810e:	mov    r8d,DWORD PTR [rbp+0x18]
   140388112:	mov    edx,DWORD PTR [rbp+0x14]
   140388115:	lea    rcx,[rbp+0xc0]
   14038811c:	call   0x14140f4d0
   140388121:	nop
   140388122:	lea    rcx,[rbp+0x120]
   140388129:	call   0x140067e30
   14038812e:	jmp    0x14038708b
   140388133:	mov    edi,DWORD PTR [rbp-0x20]
   140388136:	lea    rcx,[r14+0x68]
   14038813a:	call   0x14006f520
   14038813f:	test   al,al
   140388141:	jne    0x140388186
   140388143:	xor    r8d,r8d
   140388146:	mov    edx,0x7
   14038814b:	mov    r9b,0x1
   14038814e:	lea    rcx,[rip+0x22c229b]        # 0x14264a3f0
   140388155:	call   0x1400bb130
   14038815a:	mov    r8d,DWORD PTR [rbp-0x48]
   14038815e:	add    r8d,0x2
   140388162:	mov    edx,edi
   140388164:	lea    rcx,[rip+0x22c2285]        # 0x14264a3f0
   14038816b:	call   0x1400bb120
   140388170:	xor    r9d,r9d
   140388173:	xor    r8d,r8d
   140388176:	lea    rdx,[r14+0x68]
   14038817a:	lea    rcx,[rip+0x22c226f]        # 0x14264a3f0
   140388181:	call   0x140ad9960
   140388186:	lea    rcx,[rip+0x2009113]        # 0x1423912a0
   14038818d:	call   0x140e64560
   140388192:	mov    DWORD PTR [rsp+0x7c],eax
   140388196:	mov    BYTE PTR [rbp-0x64],0x1
   14038819a:	mov    rdx,QWORD PTR [r14+0xb8]
   1403881a1:	mov    rcx,QWORD PTR [rdx]
   1403881a4:	mov    QWORD PTR [rbp-0x8],rcx
   1403881a8:	mov    rcx,QWORD PTR [rdx]
   1403881ab:	mov    QWORD PTR [rbp+0x48],rcx
   1403881af:	xor    r10d,r10d
   1403881b2:	mov    DWORD PTR [rbp-0x68],r10d
   1403881b6:	mov    DWORD PTR [rsp+0x74],r10d
   1403881bb:	mov    DWORD PTR [rbp-0x74],r10d
   1403881bf:	mov    DWORD PTR [rbp-0x6c],r10d
   1403881c3:	mov    DWORD PTR [rbp-0x58],r10d
   1403881c7:	lea    r13,[r14+0xe0]
   1403881ce:	mov    QWORD PTR [rbp-0x40],r13
   1403881d2:	mov    rax,QWORD PTR [r13+0x8]
   1403881d6:	sub    rax,QWORD PTR [r13+0x0]
   1403881da:	sar    rax,0x3
   1403881de:	test   rax,rax
   1403881e1:	je     0x1403889b8
   1403881e7:	mov    esi,r10d
   1403881ea:	mov    QWORD PTR [rbp-0x38],r10
   1403881ee:	mov    r15d,r10d
   1403881f1:	mov    QWORD PTR [rbp+0x0],r10
   1403881f5:	mov    r12d,r10d
   1403881f8:	mov    QWORD PTR [rbp-0x28],r10
   1403881fc:	mov    r14d,r10d
   1403881ff:	mov    QWORD PTR [rbp+0x8],r10
   140388203:	nop    DWORD PTR [rax+0x0]
   140388207:	nop    WORD PTR [rax+rax*1+0x0]
   140388210:	mov    edi,r10d
   140388213:	mov    rdx,r15
   140388216:	mov    rcx,r13
   140388219:	call   0x14006f220
   14038821e:	mov    rcx,QWORD PTR [rax]
   140388221:	add    rcx,0x38
   140388225:	call   0x14006ee50
   14038822a:	test   rax,rax
   14038822d:	je     0x14038827e
   14038822f:	xor    ebx,ebx
   140388231:	mov    rdx,r15
   140388234:	mov    rcx,r13
   140388237:	call   0x14006f220
   14038823c:	mov    rcx,QWORD PTR [rax]
   14038823f:	add    rcx,0x38
   140388243:	mov    rdx,rbx
   140388246:	call   0x14006f220
   14038824b:	mov    rcx,QWORD PTR [rax]
   14038824e:	mov    rax,QWORD PTR [rcx]
   140388251:	call   QWORD PTR [rax+0x10]
   140388254:	cmp    eax,0xb
   140388257:	je     0x14038886a
   14038825d:	inc    edi
   14038825f:	mov    rdx,r15
   140388262:	mov    rcx,r13
   140388265:	call   0x14006f220
   14038826a:	movsxd rbx,edi
   14038826d:	mov    rcx,QWORD PTR [rax]
   140388270:	add    rcx,0x38
   140388274:	call   0x14006ee50
   140388279:	cmp    rbx,rax
   14038827c:	jb     0x140388231
   14038827e:	mov    rdx,r15
   140388281:	lea    rcx,[rip+0x151a038]        # 0x1418a22c0
   140388288:	call   0x1401b9fa0
   14038828d:	mov    rdx,r15
   140388290:	test   BYTE PTR [rax],0x1
   140388293:	je     0x140388484
   140388299:	lea    rcx,[rip+0x1519ff0]        # 0x1418a2290
   1403882a0:	call   0x14006f220
   1403882a5:	mov    rcx,QWORD PTR [rax]
   1403882a8:	mov    rax,QWORD PTR [rcx]
   1403882ab:	call   QWORD PTR [rax]
   1403882ad:	mov    rdx,QWORD PTR [rip+0x1519fdc]        # 0x1418a2290
   1403882b4:	cmp    ax,0x20
   1403882b8:	jne    0x140388779
   1403882be:	xor    r8d,r8d
   1403882c1:	mov    edi,r8d
   1403882c4:	mov    DWORD PTR [rbp-0x60],r8d
   1403882c8:	mov    rax,QWORD PTR [r12+rdx*1]
   1403882cc:	mov    rcx,QWORD PTR [rax+0x40]
   1403882d0:	sub    rcx,QWORD PTR [rax+0x38]
   1403882d4:	sar    rcx,0x3
   1403882d8:	test   rcx,rcx
   1403882db:	je     0x140388779
   1403882e1:	mov    ebx,r8d
   1403882e4:	mov    r13d,r8d
   1403882e7:	nop    WORD PTR [rax+rax*1+0x0]
   1403882f0:	mov    rdx,r15
   1403882f3:	lea    rcx,[rip+0x1519f96]        # 0x1418a2290
   1403882fa:	call   0x14006f220
   1403882ff:	mov    rcx,QWORD PTR [rax]
   140388302:	add    rcx,0x38
   140388306:	mov    rdx,rbx
   140388309:	call   0x14006f220
   14038830e:	mov    rcx,QWORD PTR [rax]
   140388311:	mov    rax,QWORD PTR [rcx]
   140388314:	call   QWORD PTR [rax+0x10]
   140388317:	mov    rdx,QWORD PTR [rip+0x1519f72]        # 0x1418a2290
   14038831e:	cmp    eax,0xa
   140388321:	jne    0x14038845a
   140388327:	xor    r8d,r8d
   14038832a:	mov    r12d,r8d
   14038832d:	mov    r14d,r8d
   140388330:	mov    rax,QWORD PTR [rip+0x1519f61]        # 0x1418a2298
   140388337:	sub    rax,rdx
   14038833a:	sar    rax,0x3
   14038833e:	test   rax,rax
   140388341:	je     0x14038845a
   140388347:	mov    r15d,r8d
   14038834a:	nop    WORD PTR [rax+rax*1+0x0]
   140388350:	mov    rax,QWORD PTR [rip+0x1519f69]        # 0x1418a22c0
   140388357:	test   BYTE PTR [r14+rax*1],0x1
   14038835c:	jne    0x1403883a6
   14038835e:	mov    rdi,QWORD PTR [rdx+r14*8]
   140388362:	mov    rax,QWORD PTR [rdx+rsi*8]
   140388366:	mov    rax,QWORD PTR [rax+0x38]
   14038836a:	mov    rcx,QWORD PTR [rax+r13*1]
   14038836e:	mov    rax,QWORD PTR [rcx]
   140388371:	call   QWORD PTR [rax+0x60]
   140388374:	cmp    DWORD PTR [rdi+0x1c],eax
   140388377:	jne    0x14038842c
   14038837d:	mov    rcx,rdi
   140388380:	call   0x14030cb50
   140388385:	mov    ebx,eax
   140388387:	neg    ebx
   140388389:	mov    rcx,rdi
   14038838c:	call   0x14030cb20
   140388391:	neg    eax
   140388393:	mov    r8d,ebx
   140388396:	mov    edx,eax
   140388398:	lea    rcx,[rbp-0x8]
   14038839c:	call   0x14030c700
   1403883a1:	jmp    0x14038842c
   1403883a6:	mov    rax,QWORD PTR [rip+0x1519f43]        # 0x1418a22f0
   1403883ad:	cmp    DWORD PTR [rax+r14*4],0x0
   1403883b2:	jle    0x140388433
   1403883b4:	mov    rdx,r15
   1403883b7:	lea    rcx,[rip+0x1519ed2]        # 0x1418a2290
   1403883be:	call   0x14006f220
   1403883c3:	mov    rsi,QWORD PTR [rax]
   1403883c6:	mov    rax,QWORD PTR [rsi]
   1403883c9:	mov    rcx,rsi
   1403883cc:	call   QWORD PTR [rax+0x478]
   1403883d2:	mov    edi,eax
   1403883d4:	mov    rcx,QWORD PTR [rsi]
   1403883d7:	mov    rbx,QWORD PTR [rcx+0x488]
   1403883de:	mov    rdx,r15
   1403883e1:	lea    rcx,[rip+0x1519f08]        # 0x1418a22f0
   1403883e8:	call   0x14006f360
   1403883ed:	mov    edx,edi
   1403883ef:	sub    edx,DWORD PTR [rax]
   1403883f1:	mov    rcx,rsi
   1403883f4:	call   rbx
   1403883f6:	mov    rcx,rsi
   1403883f9:	call   0x14030cb50
   1403883fe:	mov    ebx,eax
   140388400:	neg    ebx
   140388402:	mov    rcx,rsi
   140388405:	call   0x14030cb20
   14038840a:	neg    eax
   14038840c:	mov    r8d,ebx
   14038840f:	mov    edx,eax
   140388411:	lea    rcx,[rbp-0x8]
   140388415:	call   0x14030c700
   14038841a:	mov    rax,QWORD PTR [rsi]
   14038841d:	mov    edx,edi
   14038841f:	mov    rcx,rsi
   140388422:	call   QWORD PTR [rax+0x488]
   140388428:	mov    rsi,QWORD PTR [rbp-0x38]
   14038842c:	mov    rdx,QWORD PTR [rip+0x1519e5d]        # 0x1418a2290
   140388433:	inc    r12d
   140388436:	inc    r14
   140388439:	movsxd r15,r12d
   14038843c:	mov    rax,QWORD PTR [rip+0x1519e55]        # 0x1418a2298
   140388443:	sub    rax,rdx
   140388446:	sar    rax,0x3
   14038844a:	cmp    r15,rax
   14038844d:	jb     0x140388350
   140388453:	mov    r15,QWORD PTR [rbp+0x0]
   140388457:	mov    edi,DWORD PTR [rbp-0x60]
   14038845a:	inc    edi
   14038845c:	mov    DWORD PTR [rbp-0x60],edi
   14038845f:	add    r13,0x8
   140388463:	mov    rcx,QWORD PTR [rdx+rsi*8]
   140388467:	movsxd rbx,edi
   14038846a:	mov    rax,QWORD PTR [rcx+0x40]
   14038846e:	sub    rax,QWORD PTR [rcx+0x38]
   140388472:	sar    rax,0x3
   140388476:	cmp    rbx,rax
   140388479:	jb     0x1403882f0
   14038847f:	jmp    0x140388771
   140388484:	lea    rcx,[rip+0x1519e65]        # 0x1418a22f0
   14038848b:	call   0x14006f360
   140388490:	mov    rdx,r15
   140388493:	lea    rcx,[rip+0x1519df6]        # 0x1418a2290
   14038849a:	cmp    DWORD PTR [rax],0x0
   14038849d:	jle    0x14038854d
   1403884a3:	call   0x14006f220
   1403884a8:	mov    rcx,QWORD PTR [rax]
   1403884ab:	mov    rax,QWORD PTR [rcx]
   1403884ae:	call   QWORD PTR [rax+0x478]
   1403884b4:	mov    esi,eax
   1403884b6:	mov    rdx,r15
   1403884b9:	lea    rcx,[rip+0x1519dd0]        # 0x1418a2290
   1403884c0:	call   0x14006f220
   1403884c5:	mov    rdi,QWORD PTR [rax]
   1403884c8:	mov    rdx,QWORD PTR [rdi]
   1403884cb:	mov    rbx,QWORD PTR [rdx+0x488]
   1403884d2:	mov    rdx,r15
   1403884d5:	lea    rcx,[rip+0x1519e14]        # 0x1418a22f0
   1403884dc:	call   0x14006f360
   1403884e1:	mov    edx,DWORD PTR [rax]
   1403884e3:	mov    rcx,rdi
   1403884e6:	call   rbx
   1403884e8:	mov    rdx,r15
   1403884eb:	lea    rcx,[rip+0x1519d9e]        # 0x1418a2290
   1403884f2:	call   0x14006f220
   1403884f7:	mov    rcx,QWORD PTR [rax]
   1403884fa:	call   0x14030cb50
   1403884ff:	mov    ebx,eax
   140388501:	neg    ebx
   140388503:	mov    rdx,r15
   140388506:	lea    rcx,[rip+0x1519d83]        # 0x1418a2290
   14038850d:	call   0x14006f220
   140388512:	mov    rcx,QWORD PTR [rax]
   140388515:	call   0x14030cb20
   14038851a:	neg    eax
   14038851c:	mov    r8d,ebx
   14038851f:	mov    edx,eax
   140388521:	lea    rcx,[rbp-0x8]
   140388525:	call   0x14030c700
   14038852a:	mov    rdx,r15
   14038852d:	lea    rcx,[rip+0x1519d5c]        # 0x1418a2290
   140388534:	call   0x14006f220
   140388539:	mov    rcx,QWORD PTR [rax]
   14038853c:	mov    rax,QWORD PTR [rcx]
   14038853f:	mov    edx,esi
   140388541:	call   QWORD PTR [rax+0x488]
   140388547:	mov    rsi,QWORD PTR [rbp-0x38]
   14038854b:	jmp    0x140388585
   14038854d:	call   0x14006f220
   140388552:	mov    rcx,QWORD PTR [rax]
   140388555:	call   0x14030cb50
   14038855a:	mov    ebx,eax
   14038855c:	neg    ebx
   14038855e:	mov    rdx,r15
   140388561:	lea    rcx,[rip+0x1519d28]        # 0x1418a2290
   140388568:	call   0x14006f220
   14038856d:	mov    rcx,QWORD PTR [rax]
   140388570:	call   0x14030cb20
   140388575:	neg    eax
   140388577:	mov    r8d,ebx
   14038857a:	mov    edx,eax
   14038857c:	lea    rcx,[rbp-0x8]
   140388580:	call   0x14030c700
   140388585:	mov    rdx,r15
   140388588:	lea    rcx,[rip+0x1519d01]        # 0x1418a2290
   14038858f:	call   0x14006f220
   140388594:	mov    rcx,QWORD PTR [rax]
   140388597:	mov    rax,QWORD PTR [rcx]
   14038859a:	call   QWORD PTR [rax]
   14038859c:	mov    rdx,QWORD PTR [rip+0x1519ced]        # 0x1418a2290
   1403885a3:	cmp    ax,0x20
   1403885a7:	jne    0x140388779
   1403885ad:	xor    r8d,r8d
   1403885b0:	mov    edi,r8d
   1403885b3:	mov    DWORD PTR [rbp-0x60],r8d
   1403885b7:	mov    rax,QWORD PTR [rdx+r14*1]
   1403885bb:	mov    rcx,QWORD PTR [rax+0x40]
   1403885bf:	sub    rcx,QWORD PTR [rax+0x38]
   1403885c3:	sar    rcx,0x3
   1403885c7:	test   rcx,rcx
   1403885ca:	je     0x140388779
   1403885d0:	mov    ebx,r8d
   1403885d3:	mov    r13d,r8d
   1403885d6:	lea    rax,[rsi*8+0x0]
   1403885de:	mov    QWORD PTR [rbp+0x60],rax
   1403885e2:	nop    DWORD PTR [rax+0x0]
   1403885e6:	data16 nop WORD PTR [rax+rax*1+0x0]
   1403885f0:	mov    rdx,r15
   1403885f3:	lea    rcx,[rip+0x1519c96]        # 0x1418a2290
   1403885fa:	call   0x14006f220
   1403885ff:	mov    rcx,QWORD PTR [rax]
   140388602:	add    rcx,0x38
   140388606:	mov    rdx,rbx
   140388609:	call   0x14006f220
   14038860e:	mov    rcx,QWORD PTR [rax]
   140388611:	mov    rax,QWORD PTR [rcx]
   140388614:	call   QWORD PTR [rax+0x10]
   140388617:	mov    rdx,QWORD PTR [rip+0x1519c72]        # 0x1418a2290
   14038861e:	cmp    eax,0xa
   140388621:	jne    0x140388744
   140388627:	xor    r8d,r8d
   14038862a:	mov    r12d,r8d
   14038862d:	mov    r14d,r8d
   140388630:	mov    rax,QWORD PTR [rip+0x1519c61]        # 0x1418a2298
   140388637:	sub    rax,rdx
   14038863a:	sar    rax,0x3
   14038863e:	test   rax,rax
   140388641:	je     0x140388744
   140388647:	mov    r15d,r8d
   14038864a:	nop    WORD PTR [rax+rax*1+0x0]
   140388650:	mov    rax,QWORD PTR [rip+0x1519c69]        # 0x1418a22c0
   140388657:	test   BYTE PTR [r14+rax*1],0x1
   14038865c:	je     0x14038871d
   140388662:	mov    rsi,QWORD PTR [rdx+r14*8]
   140388666:	mov    rax,QWORD PTR [rbp-0x38]
   14038866a:	mov    rax,QWORD PTR [rdx+rax*8]
   14038866e:	mov    rax,QWORD PTR [rax+0x38]
   140388672:	mov    rcx,QWORD PTR [rax+r13*1]
   140388676:	mov    rax,QWORD PTR [rcx]
   140388679:	call   QWORD PTR [rax+0x60]
   14038867c:	cmp    DWORD PTR [rsi+0x1c],eax
   14038867f:	jne    0x140388716
   140388685:	mov    rdx,r15
   140388688:	lea    rcx,[rip+0x1519c61]        # 0x1418a22f0
   14038868f:	call   0x14006f360
   140388694:	mov    rcx,rsi
   140388697:	cmp    DWORD PTR [rax],0x0
   14038869a:	jle    0x1403886f9
   14038869c:	mov    rax,QWORD PTR [rsi]
   14038869f:	call   QWORD PTR [rax+0x478]
   1403886a5:	mov    edi,eax
   1403886a7:	mov    rcx,QWORD PTR [rsi]
   1403886aa:	mov    rbx,QWORD PTR [rcx+0x488]
   1403886b1:	mov    rdx,r15
   1403886b4:	lea    rcx,[rip+0x1519c35]        # 0x1418a22f0
   1403886bb:	call   0x14006f360
   1403886c0:	mov    edx,edi
   1403886c2:	sub    edx,DWORD PTR [rax]
   1403886c4:	mov    rcx,rsi
   1403886c7:	call   rbx
   1403886c9:	mov    rcx,rsi
   1403886cc:	call   0x14030cb50
   1403886d1:	mov    ebx,eax
   1403886d3:	mov    rcx,rsi
   1403886d6:	call   0x14030cb20
   1403886db:	mov    r8d,ebx
   1403886de:	mov    edx,eax
   1403886e0:	lea    rcx,[rbp-0x8]
   1403886e4:	call   0x14030c700
   1403886e9:	mov    rax,QWORD PTR [rsi]
   1403886ec:	mov    edx,edi
   1403886ee:	mov    rcx,rsi
   1403886f1:	call   QWORD PTR [rax+0x488]
   1403886f7:	jmp    0x140388716
   1403886f9:	call   0x14030cb50
   1403886fe:	mov    ebx,eax
   140388700:	mov    rcx,rsi
   140388703:	call   0x14030cb20
   140388708:	mov    r8d,ebx
   14038870b:	mov    edx,eax
   14038870d:	lea    rcx,[rbp-0x8]
   140388711:	call   0x14030c700
   140388716:	mov    rdx,QWORD PTR [rip+0x1519b73]        # 0x1418a2290
   14038871d:	inc    r12d
   140388720:	inc    r14
   140388723:	movsxd r15,r12d
   140388726:	mov    rax,QWORD PTR [rip+0x1519b6b]        # 0x1418a2298
   14038872d:	sub    rax,rdx
   140388730:	sar    rax,0x3
   140388734:	cmp    r15,rax
   140388737:	jb     0x140388650
   14038873d:	mov    r15,QWORD PTR [rbp+0x0]
   140388741:	mov    edi,DWORD PTR [rbp-0x60]
   140388744:	inc    edi
   140388746:	mov    DWORD PTR [rbp-0x60],edi
   140388749:	add    r13,0x8
   14038874d:	mov    rax,QWORD PTR [rbp+0x60]
   140388751:	mov    rcx,QWORD PTR [rdx+rax*1]
   140388755:	movsxd rbx,edi
   140388758:	mov    rax,QWORD PTR [rcx+0x40]
   14038875c:	sub    rax,QWORD PTR [rcx+0x38]
   140388760:	sar    rax,0x3
   140388764:	cmp    rbx,rax
   140388767:	jb     0x1403885f0
   14038876d:	mov    rsi,QWORD PTR [rbp-0x38]
   140388771:	mov    r12,QWORD PTR [rbp-0x28]
   140388775:	mov    r13,QWORD PTR [rbp-0x40]
   140388779:	mov    rax,QWORD PTR [rip+0x1519b70]        # 0x1418a22f0
   140388780:	cmp    DWORD PTR [rax+rsi*4],0x0
   140388784:	jle    0x140388823
   14038878a:	mov    rcx,QWORD PTR [rdx+rsi*8]
   14038878e:	mov    rax,QWORD PTR [rcx]
   140388791:	call   QWORD PTR [rax+0x478]
   140388797:	mov    r14d,eax
   14038879a:	mov    rcx,QWORD PTR [rip+0x1519aef]        # 0x1418a2290
   1403887a1:	mov    rcx,QWORD PTR [rcx+rsi*8]
   1403887a5:	mov    rdx,QWORD PTR [rcx]
   1403887a8:	mov    r8,QWORD PTR [rdx+0x488]
   1403887af:	mov    rdx,QWORD PTR [rip+0x1519b3a]        # 0x1418a22f0
   1403887b6:	mov    edx,DWORD PTR [rdx+rsi*4]
   1403887b9:	call   r8
   1403887bc:	mov    rbx,QWORD PTR [rip+0x1519acd]        # 0x1418a2290
   1403887c3:	mov    rdi,QWORD PTR [rbx+rsi*8]
   1403887c7:	test   DWORD PTR [rdi+0x10],0x20000000
   1403887ce:	jne    0x1403887df
   1403887d0:	mov    rcx,rdi
   1403887d3:	call   0x140c65f10
   1403887d8:	mov    rbx,QWORD PTR [rip+0x1519ab1]        # 0x1418a2290
   1403887df:	mov    edi,DWORD PTR [rdi+0x78]
   1403887e2:	neg    edi
   1403887e4:	mov    rbx,QWORD PTR [rbx+rsi*8]
   1403887e8:	test   DWORD PTR [rbx+0x10],0x20000000
   1403887ef:	jne    0x1403887f9
   1403887f1:	mov    rcx,rbx
   1403887f4:	call   0x140c65f10
   1403887f9:	mov    edx,DWORD PTR [rbx+0x74]
   1403887fc:	neg    edx
   1403887fe:	mov    r8d,edi
   140388801:	lea    rcx,[rbp+0x48]
   140388805:	call   0x14030c700
   14038880a:	mov    rax,QWORD PTR [rip+0x1519a7f]        # 0x1418a2290
   140388811:	mov    rcx,QWORD PTR [rax+rsi*8]
   140388815:	mov    rax,QWORD PTR [rcx]
   140388818:	mov    edx,r14d
   14038881b:	call   QWORD PTR [rax+0x488]
   140388821:	jmp    0x14038886a
   140388823:	mov    rbx,QWORD PTR [rdx+rsi*8]
   140388827:	test   DWORD PTR [rbx+0x10],0x20000000
   14038882e:	jne    0x14038883f
   140388830:	mov    rcx,rbx
   140388833:	call   0x140c65f10
   140388838:	mov    rdx,QWORD PTR [rip+0x1519a51]        # 0x1418a2290
   14038883f:	mov    edi,DWORD PTR [rbx+0x78]
   140388842:	neg    edi
   140388844:	mov    rbx,QWORD PTR [rdx+rsi*8]
   140388848:	test   DWORD PTR [rbx+0x10],0x20000000
   14038884f:	jne    0x140388859
   140388851:	mov    rcx,rbx
   140388854:	call   0x140c65f10
   140388859:	mov    edx,DWORD PTR [rbx+0x74]
   14038885c:	neg    edx
   14038885e:	mov    r8d,edi
   140388861:	lea    rcx,[rbp+0x48]
   140388865:	call   0x14030c700
   14038886a:	mov    rdi,QWORD PTR [rbp-0x80]
   14038886e:	mov    rax,QWORD PTR [rdi+0x110]
   140388875:	test   BYTE PTR [rsi+rax*1],0x1
   140388879:	je     0x14038896f
   14038887f:	lea    r14,[rdi+0x140]
   140388886:	lea    rcx,[rdi+0xe0]
   14038888d:	mov    rax,QWORD PTR [r14]
   140388890:	mov    rdx,r15
   140388893:	cmp    DWORD PTR [rax+rsi*4],0x0
   140388897:	jle    0x140388939
   14038889d:	call   0x14006f220
   1403888a2:	mov    rcx,QWORD PTR [rax]
   1403888a5:	mov    rax,QWORD PTR [rcx]
   1403888a8:	call   QWORD PTR [rax+0x478]
   1403888ae:	mov    esi,eax
   1403888b0:	mov    rdx,r15
   1403888b3:	mov    rcx,r13
   1403888b6:	call   0x14006f220
   1403888bb:	mov    rdi,QWORD PTR [rax]
   1403888be:	mov    rdx,QWORD PTR [rdi]
   1403888c1:	mov    rbx,QWORD PTR [rdx+0x488]
   1403888c8:	mov    rdx,r15
   1403888cb:	mov    rcx,r14
   1403888ce:	call   0x14006f360
   1403888d3:	mov    edx,DWORD PTR [rax]
   1403888d5:	mov    rcx,rdi
   1403888d8:	call   rbx
   1403888da:	mov    rdx,r15
   1403888dd:	mov    rcx,r13
   1403888e0:	call   0x14006f220
   1403888e5:	mov    BYTE PTR [rsp+0x20],0x1
   1403888ea:	xor    r9d,r9d
   1403888ed:	mov    rcx,QWORD PTR [rbp-0x80]
   1403888f1:	mov    r8,QWORD PTR [rcx+0xc0]
   1403888f8:	mov    rdx,QWORD PTR [rcx+0xb8]
   1403888ff:	mov    rcx,QWORD PTR [rax]
   140388902:	call   0x140c66020
   140388907:	add    DWORD PTR [rbp-0x68],eax
   14038890a:	mov    edx,DWORD PTR [rsp+0x7c]
   14038890e:	dec    edx
   140388910:	mov    ecx,eax
   140388912:	call   0x14077f740
   140388917:	add    DWORD PTR [rbp-0x74],eax
   14038891a:	mov    rdx,r15
   14038891d:	mov    rcx,r13
   140388920:	call   0x14006f220
   140388925:	mov    rcx,QWORD PTR [rax]
   140388928:	mov    rax,QWORD PTR [rcx]
   14038892b:	mov    edx,esi
   14038892d:	call   QWORD PTR [rax+0x488]
   140388933:	mov    rsi,QWORD PTR [rbp-0x38]
   140388937:	jmp    0x14038896f
   140388939:	call   0x14006f220
   14038893e:	mov    BYTE PTR [rsp+0x20],0x1
   140388943:	xor    r9d,r9d
   140388946:	mov    r8,QWORD PTR [rdi+0xc0]
   14038894d:	mov    rdx,QWORD PTR [rdi+0xb8]
   140388954:	mov    rcx,QWORD PTR [rax]
   140388957:	call   0x140c66020
   14038895c:	add    DWORD PTR [rbp-0x68],eax
   14038895f:	mov    edx,DWORD PTR [rsp+0x7c]
   140388963:	dec    edx
   140388965:	mov    ecx,eax
   140388967:	call   0x14077f740
   14038896c:	add    DWORD PTR [rbp-0x74],eax
   14038896f:	mov    ebx,DWORD PTR [rbp-0x58]
   140388972:	inc    ebx
   140388974:	mov    DWORD PTR [rbp-0x58],ebx
   140388977:	inc    rsi
   14038897a:	mov    QWORD PTR [rbp-0x38],rsi
   14038897e:	movsxd r15,ebx
   140388981:	mov    QWORD PTR [rbp+0x0],r15
   140388985:	add    r12,0x8
   140388989:	mov    QWORD PTR [rbp-0x28],r12
   14038898d:	mov    r14,QWORD PTR [rbp+0x8]
   140388991:	add    r14,0x8
   140388995:	mov    QWORD PTR [rbp+0x8],r14
   140388999:	mov    rax,QWORD PTR [r13+0x8]
   14038899d:	sub    rax,QWORD PTR [r13+0x0]
   1403889a1:	sar    rax,0x3
   1403889a5:	cmp    r15,rax
   1403889a8:	mov    r10d,0x0
   1403889ae:	jb     0x140388210
   1403889b4:	mov    r14,QWORD PTR [rbp-0x80]
   1403889b8:	mov    r13d,r10d
   1403889bb:	mov    DWORD PTR [rbp-0x5c],r10d
   1403889bf:	add    r14,0xf8
   1403889c6:	mov    rdx,QWORD PTR [r14]
   1403889c9:	mov    rax,QWORD PTR [r14+0x8]
   1403889cd:	sub    rax,rdx
   1403889d0:	sar    rax,0x3
   1403889d4:	test   rax,rax
   1403889d7:	je     0x1403891b0
   1403889dd:	mov    r12,r10
   1403889e0:	mov    QWORD PTR [rbp-0x10],r10
   1403889e4:	mov    r15,r10
   1403889e7:	mov    rcx,r10
   1403889ea:	mov    QWORD PTR [rbp-0x40],rcx
   1403889ee:	mov    rsi,r10
   1403889f1:	mov    QWORD PTR [rbp-0x28],r10
   1403889f5:	mov    r8,rdx
   1403889f8:	nop    DWORD PTR [rax+rax*1+0x0]
   140388a00:	mov    edi,r10d
   140388a03:	mov    rcx,QWORD PTR [rcx+rdx*1]
   140388a07:	mov    rax,QWORD PTR [rcx+0x40]
   140388a0b:	sub    rax,QWORD PTR [rcx+0x38]
   140388a0f:	sar    rax,0x3
   140388a13:	test   rax,rax
   140388a16:	je     0x140388a5e
   140388a18:	mov    rbx,r10
   140388a1b:	nop    DWORD PTR [rax+rax*1+0x0]
   140388a20:	mov    rax,QWORD PTR [rdx+r12*8]
   140388a24:	mov    rax,QWORD PTR [rax+0x38]
   140388a28:	mov    rcx,QWORD PTR [rbx+rax*1]
   140388a2c:	mov    rax,QWORD PTR [rcx]
   140388a2f:	call   QWORD PTR [rax+0x10]
   140388a32:	cmp    eax,0xb
   140388a35:	je     0x140389073
   140388a3b:	inc    edi
   140388a3d:	add    rbx,0x8
   140388a41:	mov    rdx,QWORD PTR [r14]
   140388a44:	mov    rax,QWORD PTR [rdx+r12*8]
   140388a48:	mov    rcx,QWORD PTR [rax+0x40]
   140388a4c:	sub    rcx,QWORD PTR [rax+0x38]
   140388a50:	sar    rcx,0x3
   140388a54:	movsxd rax,edi
   140388a57:	cmp    rax,rcx
   140388a5a:	jb     0x140388a20
   140388a5c:	jmp    0x140388a61
   140388a5e:	mov    rdx,r8
   140388a61:	mov    rdi,QWORD PTR [rbp-0x80]
   140388a65:	lea    rcx,[rdi+0xf8]
   140388a6c:	mov    rax,QWORD PTR [rdi+0x128]
   140388a73:	test   BYTE PTR [r12+rax*1],0x1
   140388a78:	je     0x140388e41
   140388a7e:	lea    r13,[rdi+0x158]
   140388a85:	mov    r12,rdi
   140388a88:	mov    rax,QWORD PTR [r13+0x0]
   140388a8c:	mov    rdx,QWORD PTR [rbp-0x10]
   140388a90:	cmp    DWORD PTR [rax+rdx*4],0x0
   140388a94:	mov    rdx,r15
   140388a97:	jle    0x140388b76
   140388a9d:	call   0x14006f220
   140388aa2:	mov    rcx,QWORD PTR [rax]
   140388aa5:	mov    rax,QWORD PTR [rcx]
   140388aa8:	call   QWORD PTR [rax+0x478]
   140388aae:	mov    esi,eax
   140388ab0:	mov    rdx,r15
   140388ab3:	lea    rcx,[rdi+0xf8]
   140388aba:	call   0x14006f220
   140388abf:	mov    rdi,QWORD PTR [rax]
   140388ac2:	mov    rdx,QWORD PTR [rdi]
   140388ac5:	mov    rbx,QWORD PTR [rdx+0x488]
   140388acc:	mov    rdx,r15
   140388acf:	mov    rcx,r13
   140388ad2:	call   0x14006f360
   140388ad7:	mov    edx,DWORD PTR [rax]
   140388ad9:	mov    rcx,rdi
   140388adc:	call   rbx
   140388ade:	mov    rdx,r15
   140388ae1:	lea    rcx,[r12+0xf8]
   140388ae9:	call   0x14006f220
   140388aee:	mov    rcx,QWORD PTR [rax]
   140388af1:	call   0x14030cb50
   140388af6:	mov    ebx,eax
   140388af8:	neg    ebx
   140388afa:	mov    rdx,r15
   140388afd:	mov    rcx,r14
   140388b00:	call   0x14006f220
   140388b05:	mov    rcx,QWORD PTR [rax]
   140388b08:	call   0x14030cb20
   140388b0d:	neg    eax
   140388b0f:	mov    r8d,ebx
   140388b12:	mov    edx,eax
   140388b14:	lea    rcx,[rbp-0x8]
   140388b18:	call   0x14030c700
   140388b1d:	mov    rdx,r15
   140388b20:	mov    rcx,r14
   140388b23:	call   0x14006f220
   140388b28:	mov    rcx,QWORD PTR [rax]
   140388b2b:	call   0x14030cb50
   140388b30:	mov    ebx,eax
   140388b32:	neg    ebx
   140388b34:	mov    rdx,r15
   140388b37:	mov    rcx,r14
   140388b3a:	call   0x14006f220
   140388b3f:	mov    rcx,QWORD PTR [rax]
   140388b42:	call   0x14030cb20
   140388b47:	neg    eax
   140388b49:	mov    r8d,ebx
   140388b4c:	mov    edx,eax
   140388b4e:	lea    rcx,[rbp+0x48]
   140388b52:	call   0x14030c700
   140388b57:	mov    rdx,r15
   140388b5a:	mov    rcx,r14
   140388b5d:	call   0x14006f220
   140388b62:	mov    rcx,QWORD PTR [rax]
   140388b65:	mov    rax,QWORD PTR [rcx]
   140388b68:	mov    edx,esi
   140388b6a:	call   QWORD PTR [rax+0x488]
   140388b70:	mov    rsi,QWORD PTR [rbp-0x28]
   140388b74:	jmp    0x140388bec
   140388b76:	call   0x14006f220
   140388b7b:	mov    rcx,QWORD PTR [rax]
   140388b7e:	call   0x14030cb50
   140388b83:	mov    ebx,eax
   140388b85:	neg    ebx
   140388b87:	mov    rdx,r15
   140388b8a:	lea    rcx,[rdi+0xf8]
   140388b91:	call   0x14006f220
   140388b96:	mov    rcx,QWORD PTR [rax]
   140388b99:	call   0x14030cb20
   140388b9e:	neg    eax
   140388ba0:	mov    r8d,ebx
   140388ba3:	mov    edx,eax
   140388ba5:	lea    rcx,[rbp-0x8]
   140388ba9:	call   0x14030c700
   140388bae:	mov    rdx,r15
   140388bb1:	mov    rcx,r14
   140388bb4:	call   0x14006f220
   140388bb9:	mov    rcx,QWORD PTR [rax]
   140388bbc:	call   0x14030cb50
   140388bc1:	mov    ebx,eax
   140388bc3:	neg    ebx
   140388bc5:	mov    rdx,r15
   140388bc8:	lea    rcx,[rdi+0xf8]
   140388bcf:	call   0x14006f220
   140388bd4:	mov    rcx,QWORD PTR [rax]
   140388bd7:	call   0x14030cb20
   140388bdc:	neg    eax
   140388bde:	mov    r8d,ebx
   140388be1:	mov    edx,eax
   140388be3:	lea    rcx,[rbp+0x48]
   140388be7:	call   0x14030c700
   140388bec:	mov    rax,QWORD PTR [r14]
   140388bef:	mov    rcx,QWORD PTR [rsi+rax*1]
   140388bf3:	mov    rax,QWORD PTR [rcx]
   140388bf6:	call   QWORD PTR [rax]
   140388bf8:	xor    r10d,r10d
   140388bfb:	mov    r12,QWORD PTR [rbp-0x10]
   140388bff:	cmp    ax,0x20
   140388c03:	jne    0x140388e38
   140388c09:	mov    ebx,r10d
   140388c0c:	mov    DWORD PTR [rbp-0x60],ebx
   140388c0f:	mov    rdx,QWORD PTR [r14]
   140388c12:	lea    r8,[r12*8+0x0]
   140388c1a:	mov    QWORD PTR [rbp+0x60],r8
   140388c1e:	mov    rax,QWORD PTR [r8+rdx*1]
   140388c22:	mov    rcx,QWORD PTR [rax+0x40]
   140388c26:	sub    rcx,QWORD PTR [rax+0x38]
   140388c2a:	sar    rcx,0x3
   140388c2e:	test   rcx,rcx
   140388c31:	je     0x140388e38
   140388c37:	mov    esi,r10d
   140388c3a:	mov    QWORD PTR [rbp+0x0],r10
   140388c3e:	xchg   ax,ax
   140388c40:	mov    rax,QWORD PTR [rdx+r8*1]
   140388c44:	mov    rax,QWORD PTR [rax+0x38]
   140388c48:	mov    rcx,QWORD PTR [rsi+rax*1]
   140388c4c:	mov    rax,QWORD PTR [rcx]
   140388c4f:	call   QWORD PTR [rax+0x10]
   140388c52:	xor    r10d,r10d
   140388c55:	cmp    eax,0xa
   140388c58:	jne    0x140388e00
   140388c5e:	mov    r12d,r10d
   140388c61:	mov    edi,r10d
   140388c64:	mov    rdx,QWORD PTR [r14]
   140388c67:	mov    rax,QWORD PTR [r14+0x8]
   140388c6b:	sub    rax,rdx
   140388c6e:	sar    rax,0x3
   140388c72:	test   rax,rax
   140388c75:	je     0x140388e00
   140388c7b:	nop    DWORD PTR [rax+rax*1+0x0]
   140388c80:	mov    rax,QWORD PTR [rbp-0x80]
   140388c84:	mov    rax,QWORD PTR [rax+0x128]
   140388c8b:	test   BYTE PTR [rdi+rax*1],0x1
   140388c8f:	jne    0x140388d25
   140388c95:	mov    rbx,QWORD PTR [rdx+rdi*8]
   140388c99:	mov    rax,QWORD PTR [rbp-0x10]
   140388c9d:	mov    rax,QWORD PTR [rdx+rax*8]
   140388ca1:	mov    rax,QWORD PTR [rax+0x38]
   140388ca5:	mov    rcx,QWORD PTR [rsi+rax*1]
   140388ca9:	mov    rax,QWORD PTR [rcx]
   140388cac:	call   QWORD PTR [rax+0x60]
   140388caf:	cmp    DWORD PTR [rbx+0x1c],eax
   140388cb2:	jne    0x140388dda
   140388cb8:	test   DWORD PTR [rbx+0x10],0x20000000
   140388cbf:	jne    0x140388cc9
   140388cc1:	mov    rcx,rbx
   140388cc4:	call   0x140c65f10
   140388cc9:	mov    esi,DWORD PTR [rbx+0x78]
   140388ccc:	test   DWORD PTR [rbx+0x10],0x20000000
   140388cd3:	jne    0x140388cdd
   140388cd5:	mov    rcx,rbx
   140388cd8:	call   0x140c65f10
   140388cdd:	mov    r8d,esi
   140388ce0:	mov    edx,DWORD PTR [rbx+0x74]
   140388ce3:	lea    rcx,[rbp-0x8]
   140388ce7:	call   0x14030c700
   140388cec:	test   DWORD PTR [rbx+0x10],0x20000000
   140388cf3:	jne    0x140388cfd
   140388cf5:	mov    rcx,rbx
   140388cf8:	call   0x140c65f10
   140388cfd:	mov    esi,DWORD PTR [rbx+0x78]
   140388d00:	test   DWORD PTR [rbx+0x10],0x20000000
   140388d07:	jne    0x140388d11
   140388d09:	mov    rcx,rbx
   140388d0c:	call   0x140c65f10
   140388d11:	mov    r8d,esi
   140388d14:	mov    edx,DWORD PTR [rbx+0x74]
   140388d17:	lea    rcx,[rbp+0x48]
   140388d1b:	call   0x14030c700
   140388d20:	jmp    0x140388dd6
   140388d25:	mov    rax,QWORD PTR [r13+0x0]
   140388d29:	cmp    DWORD PTR [rax+rdi*4],0x0
   140388d2d:	jle    0x140388dda
   140388d33:	mov    rbx,QWORD PTR [rdx+rdi*8]
   140388d37:	mov    rax,QWORD PTR [rbx]
   140388d3a:	mov    rcx,rbx
   140388d3d:	call   QWORD PTR [rax+0x478]
   140388d43:	mov    esi,eax
   140388d45:	mov    rcx,QWORD PTR [rbx]
   140388d48:	mov    r8,QWORD PTR [rcx+0x488]
   140388d4f:	mov    rcx,QWORD PTR [r13+0x0]
   140388d53:	mov    edx,eax
   140388d55:	sub    edx,DWORD PTR [rcx+rdi*4]
   140388d58:	mov    rcx,rbx
   140388d5b:	call   r8
   140388d5e:	test   DWORD PTR [rbx+0x10],0x20000000
   140388d65:	jne    0x140388d6f
   140388d67:	mov    rcx,rbx
   140388d6a:	call   0x140c65f10
   140388d6f:	mov    r15d,DWORD PTR [rbx+0x78]
   140388d73:	test   DWORD PTR [rbx+0x10],0x20000000
   140388d7a:	jne    0x140388d84
   140388d7c:	mov    rcx,rbx
   140388d7f:	call   0x140c65f10
   140388d84:	mov    r8d,r15d
   140388d87:	mov    edx,DWORD PTR [rbx+0x74]
   140388d8a:	lea    rcx,[rbp-0x8]
   140388d8e:	call   0x14030c700
   140388d93:	test   DWORD PTR [rbx+0x10],0x20000000
   140388d9a:	jne    0x140388da4
   140388d9c:	mov    rcx,rbx
   140388d9f:	call   0x140c65f10
   140388da4:	mov    r15d,DWORD PTR [rbx+0x78]
   140388da8:	test   DWORD PTR [rbx+0x10],0x20000000
   140388daf:	jne    0x140388db9
   140388db1:	mov    rcx,rbx
   140388db4:	call   0x140c65f10
   140388db9:	mov    r8d,r15d
   140388dbc:	mov    edx,DWORD PTR [rbx+0x74]
   140388dbf:	lea    rcx,[rbp+0x48]
   140388dc3:	call   0x14030c700
   140388dc8:	mov    rax,QWORD PTR [rbx]
   140388dcb:	mov    edx,esi
   140388dcd:	mov    rcx,rbx
   140388dd0:	call   QWORD PTR [rax+0x488]
   140388dd6:	mov    rsi,QWORD PTR [rbp+0x0]
   140388dda:	inc    r12d
   140388ddd:	inc    rdi
   140388de0:	mov    rdx,QWORD PTR [r14]
   140388de3:	mov    rcx,QWORD PTR [r14+0x8]
   140388de7:	sub    rcx,rdx
   140388dea:	sar    rcx,0x3
   140388dee:	movsxd rax,r12d
   140388df1:	cmp    rax,rcx
   140388df4:	jb     0x140388c80
   140388dfa:	mov    ebx,DWORD PTR [rbp-0x60]
   140388dfd:	xor    r10d,r10d
   140388e00:	inc    ebx
   140388e02:	mov    DWORD PTR [rbp-0x60],ebx
   140388e05:	add    rsi,0x8
   140388e09:	mov    QWORD PTR [rbp+0x0],rsi
   140388e0d:	mov    rdx,QWORD PTR [r14]
   140388e10:	mov    r8,QWORD PTR [rbp+0x60]
   140388e14:	mov    rax,QWORD PTR [r8+rdx*1]
   140388e18:	mov    rcx,QWORD PTR [rax+0x40]
   140388e1c:	sub    rcx,QWORD PTR [rax+0x38]
   140388e20:	sar    rcx,0x3
   140388e24:	movsxd rax,ebx
   140388e27:	cmp    rax,rcx
   140388e2a:	jb     0x140388c40
   140388e30:	mov    r12,QWORD PTR [rbp-0x10]
   140388e34:	mov    rsi,QWORD PTR [rbp-0x28]
   140388e38:	mov    r13d,DWORD PTR [rbp-0x5c]
   140388e3c:	jmp    0x140389076
   140388e41:	mov    rcx,QWORD PTR [rdx+r12*8]
   140388e45:	mov    rax,QWORD PTR [rcx]
   140388e48:	call   QWORD PTR [rax]
   140388e4a:	xor    r10d,r10d
   140388e4d:	cmp    ax,0x20
   140388e51:	jne    0x140389076
   140388e57:	mov    ebx,r10d
   140388e5a:	mov    DWORD PTR [rbp-0x60],ebx
   140388e5d:	mov    rdx,QWORD PTR [r14]
   140388e60:	mov    rax,QWORD PTR [rdx+r12*8]
   140388e64:	mov    rcx,QWORD PTR [rax+0x40]
   140388e68:	sub    rcx,QWORD PTR [rax+0x38]
   140388e6c:	sar    rcx,0x3
   140388e70:	test   rcx,rcx
   140388e73:	je     0x140389076
   140388e79:	mov    r13d,r10d
   140388e7c:	nop    DWORD PTR [rax+0x0]
   140388e80:	mov    rax,QWORD PTR [rdx+r12*8]
   140388e84:	mov    rax,QWORD PTR [rax+0x38]
   140388e88:	mov    rcx,QWORD PTR [rax+r13*1]
   140388e8c:	mov    rax,QWORD PTR [rcx]
   140388e8f:	call   QWORD PTR [rax+0x10]
   140388e92:	xor    r10d,r10d
   140388e95:	cmp    eax,0xa
   140388e98:	jne    0x140389041
   140388e9e:	mov    r15d,r10d
   140388ea1:	mov    esi,r10d
   140388ea4:	mov    rdx,QWORD PTR [r14]
   140388ea7:	mov    rax,QWORD PTR [r14+0x8]
   140388eab:	sub    rax,rdx
   140388eae:	sar    rax,0x3
   140388eb2:	test   rax,rax
   140388eb5:	je     0x140389041
   140388ebb:	nop    DWORD PTR [rax+rax*1+0x0]
   140388ec0:	mov    rax,QWORD PTR [rdi+0x128]
   140388ec7:	test   BYTE PTR [rsi+rax*1],0x1
   140388ecb:	je     0x14038901b
   140388ed1:	mov    rbx,QWORD PTR [rdx+rsi*8]
   140388ed5:	mov    rax,QWORD PTR [rdx+r12*8]
   140388ed9:	mov    rcx,QWORD PTR [rax+0x38]
   140388edd:	mov    rcx,QWORD PTR [rcx+r13*1]
   140388ee1:	mov    rax,QWORD PTR [rcx]
   140388ee4:	call   QWORD PTR [rax+0x60]
   140388ee7:	cmp    DWORD PTR [rbx+0x1c],eax
   140388eea:	jne    0x14038901b
   140388ef0:	mov    rax,QWORD PTR [rdi+0x158]
   140388ef7:	cmp    DWORD PTR [rax+rsi*4],0x0
   140388efb:	jle    0x140388fa7
   140388f01:	mov    rax,QWORD PTR [rbx]
   140388f04:	mov    rcx,rbx
   140388f07:	call   QWORD PTR [rax+0x478]
   140388f0d:	mov    r12d,eax
   140388f10:	mov    rcx,QWORD PTR [rbx]
   140388f13:	mov    r8,QWORD PTR [rcx+0x488]
   140388f1a:	mov    rcx,QWORD PTR [rdi+0x158]
   140388f21:	mov    edx,DWORD PTR [rcx+rsi*4]
   140388f24:	mov    rcx,rbx
   140388f27:	call   r8
   140388f2a:	test   DWORD PTR [rbx+0x10],0x20000000
   140388f31:	jne    0x140388f3b
   140388f33:	mov    rcx,rbx
   140388f36:	call   0x140c65f10
   140388f3b:	mov    edi,DWORD PTR [rbx+0x78]
   140388f3e:	test   DWORD PTR [rbx+0x10],0x20000000
   140388f45:	jne    0x140388f4f
   140388f47:	mov    rcx,rbx
   140388f4a:	call   0x140c65f10
   140388f4f:	mov    r8d,edi
   140388f52:	mov    edx,DWORD PTR [rbx+0x74]
   140388f55:	lea    rcx,[rbp-0x8]
   140388f59:	call   0x14030c700
   140388f5e:	test   DWORD PTR [rbx+0x10],0x20000000
   140388f65:	jne    0x140388f6f
   140388f67:	mov    rcx,rbx
   140388f6a:	call   0x140c65f10
   140388f6f:	mov    edi,DWORD PTR [rbx+0x78]
   140388f72:	test   DWORD PTR [rbx+0x10],0x20000000
   140388f79:	jne    0x140388f83
   140388f7b:	mov    rcx,rbx
   140388f7e:	call   0x140c65f10
   140388f83:	mov    r8d,edi
   140388f86:	mov    edx,DWORD PTR [rbx+0x74]
   140388f89:	lea    rcx,[rbp+0x48]
   140388f8d:	call   0x14030c700
   140388f92:	mov    rax,QWORD PTR [rbx]
   140388f95:	mov    edx,r12d
   140388f98:	mov    rcx,rbx
   140388f9b:	call   QWORD PTR [rax+0x488]
   140388fa1:	mov    r12,QWORD PTR [rbp-0x10]
   140388fa5:	jmp    0x140389017
   140388fa7:	test   DWORD PTR [rbx+0x10],0x20000000
   140388fae:	jne    0x140388fb8
   140388fb0:	mov    rcx,rbx
   140388fb3:	call   0x140c65f10
   140388fb8:	mov    edi,DWORD PTR [rbx+0x78]
   140388fbb:	neg    edi
   140388fbd:	test   DWORD PTR [rbx+0x10],0x20000000
   140388fc4:	jne    0x140388fce
   140388fc6:	mov    rcx,rbx
   140388fc9:	call   0x140c65f10
   140388fce:	mov    edx,DWORD PTR [rbx+0x74]
   140388fd1:	neg    edx
   140388fd3:	mov    r8d,edi
   140388fd6:	lea    rcx,[rbp-0x8]
   140388fda:	call   0x14030c700
   140388fdf:	test   DWORD PTR [rbx+0x10],0x20000000
   140388fe6:	jne    0x140388ff0
   140388fe8:	mov    rcx,rbx
   140388feb:	call   0x140c65f10
   140388ff0:	mov    edi,DWORD PTR [rbx+0x78]
   140388ff3:	neg    edi
   140388ff5:	test   DWORD PTR [rbx+0x10],0x20000000
   140388ffc:	jne    0x140389006
   140388ffe:	mov    rcx,rbx
   140389001:	call   0x140c65f10
   140389006:	mov    edx,DWORD PTR [rbx+0x74]
   140389009:	neg    edx
   14038900b:	mov    r8d,edi
   14038900e:	lea    rcx,[rbp+0x48]
   140389012:	call   0x14030c700
   140389017:	mov    rdi,QWORD PTR [rbp-0x80]
   14038901b:	inc    r15d
   14038901e:	inc    rsi
   140389021:	mov    rdx,QWORD PTR [r14]
   140389024:	mov    rcx,QWORD PTR [r14+0x8]
   140389028:	sub    rcx,rdx
   14038902b:	sar    rcx,0x3
   14038902f:	movsxd rax,r15d
   140389032:	cmp    rax,rcx
   140389035:	jb     0x140388ec0
   14038903b:	mov    ebx,DWORD PTR [rbp-0x60]
   14038903e:	xor    r10d,r10d
   140389041:	inc    ebx
   140389043:	mov    DWORD PTR [rbp-0x60],ebx
   140389046:	add    r13,0x8
   14038904a:	mov    rdx,QWORD PTR [r14]
   14038904d:	mov    rax,QWORD PTR [rdx+r12*8]
   140389051:	mov    rcx,QWORD PTR [rax+0x40]
   140389055:	sub    rcx,QWORD PTR [rax+0x38]
   140389059:	sar    rcx,0x3
   14038905d:	movsxd rax,ebx
   140389060:	cmp    rax,rcx
   140389063:	jb     0x140388e80
   140389069:	mov    rsi,QWORD PTR [rbp-0x28]
   14038906d:	mov    r13d,DWORD PTR [rbp-0x5c]
   140389071:	jmp    0x140389076
   140389073:	xor    r10d,r10d
   140389076:	mov    rdi,QWORD PTR [rbp-0x80]
   14038907a:	mov    rax,QWORD PTR [rdi+0x128]
   140389081:	test   BYTE PTR [r12+rax*1],0x1
   140389086:	je     0x14038916f
   14038908c:	mov    rax,QWORD PTR [rdi+0xf8]
   140389093:	lea    rcx,[rax+r12*8]
   140389097:	mov    rax,QWORD PTR [rdi+0x158]
   14038909e:	mov    rcx,QWORD PTR [rcx]
   1403890a1:	cmp    DWORD PTR [rax+r12*4],0x0
   1403890a6:	jle    0x14038911c
   1403890a8:	mov    rax,QWORD PTR [rcx]
   1403890ab:	call   QWORD PTR [rax+0x478]
   1403890b1:	mov    ebx,eax
   1403890b3:	mov    rcx,QWORD PTR [r14]
   1403890b6:	mov    rcx,QWORD PTR [rcx+r12*8]
   1403890ba:	mov    rdx,QWORD PTR [rcx]
   1403890bd:	mov    r8,QWORD PTR [rdx+0x488]
   1403890c4:	mov    rdx,QWORD PTR [rdi+0x158]
   1403890cb:	mov    edx,DWORD PTR [rdx+r12*4]
   1403890cf:	call   r8
   1403890d2:	mov    rcx,QWORD PTR [r14]
   1403890d5:	mov    BYTE PTR [rsp+0x20],0x1
   1403890da:	xor    r9d,r9d
   1403890dd:	mov    r8,QWORD PTR [rdi+0xc0]
   1403890e4:	mov    rdx,QWORD PTR [rdi+0xb8]
   1403890eb:	mov    rcx,QWORD PTR [rcx+r12*8]
   1403890ef:	call   0x140c66020
   1403890f4:	add    DWORD PTR [rsp+0x74],eax
   1403890f8:	mov    edx,DWORD PTR [rsp+0x7c]
   1403890fc:	dec    edx
   1403890fe:	mov    ecx,eax
   140389100:	call   0x14077f740
   140389105:	add    DWORD PTR [rbp-0x6c],eax
   140389108:	mov    rax,QWORD PTR [r14]
   14038910b:	mov    rcx,QWORD PTR [rax+r12*8]
   14038910f:	mov    rax,QWORD PTR [rcx]
   140389112:	mov    edx,ebx
   140389114:	call   QWORD PTR [rax+0x488]
   14038911a:	jmp    0x14038914b
   14038911c:	mov    BYTE PTR [rsp+0x20],0x1
   140389121:	xor    r9d,r9d
   140389124:	mov    r8,QWORD PTR [rdi+0xc0]
   14038912b:	mov    rdx,QWORD PTR [rdi+0xb8]
   140389132:	call   0x140c66020
   140389137:	add    DWORD PTR [rsp+0x74],eax
   14038913b:	mov    edx,DWORD PTR [rsp+0x7c]
   14038913f:	dec    edx
   140389141:	mov    ecx,eax
   140389143:	call   0x14077f740
   140389148:	add    DWORD PTR [rbp-0x6c],eax
   14038914b:	mov    rax,QWORD PTR [r14]
   14038914e:	mov    rcx,QWORD PTR [rax+r12*8]
   140389152:	test   DWORD PTR [rcx+0x10],0x4000
   140389159:	mov    r9d,DWORD PTR [rbp-0x64]
   14038915d:	movzx  r9d,r9b
   140389161:	mov    r10d,0x0
   140389167:	cmovne r9d,r10d
   14038916b:	mov    DWORD PTR [rbp-0x64],r9d
   14038916f:	inc    r13d
   140389172:	mov    DWORD PTR [rbp-0x5c],r13d
   140389176:	inc    r12
   140389179:	mov    QWORD PTR [rbp-0x10],r12
   14038917d:	mov    rdx,QWORD PTR [r14]
   140389180:	movsxd r15,r13d
   140389183:	mov    rcx,QWORD PTR [rbp-0x40]
   140389187:	add    rcx,0x8
   14038918b:	mov    QWORD PTR [rbp-0x40],rcx
   14038918f:	add    rsi,0x8
   140389193:	mov    QWORD PTR [rbp-0x28],rsi
   140389197:	mov    r8,rdx
   14038919a:	mov    rax,QWORD PTR [r14+0x8]
   14038919e:	sub    rax,rdx
   1403891a1:	sar    rax,0x3
   1403891a5:	cmp    r15,rax
   1403891a8:	jb     0x140388a00
   1403891ae:	jmp    0x1403891b4
   1403891b0:	mov    rdi,QWORD PTR [rbp-0x80]
   1403891b4:	mov    r14d,DWORD PTR [rsp+0x74]
   1403891b9:	mov    r12d,DWORD PTR [rbp-0x68]
   1403891bd:	sub    r14d,r12d
   1403891c0:	mov    r15d,DWORD PTR [rbp-0x6c]
   1403891c4:	mov    esi,r15d
   1403891c7:	mov    r13d,DWORD PTR [rbp-0x74]
   1403891cb:	sub    esi,r13d
   1403891ce:	mov    rcx,QWORD PTR [rdi+0xd8]
   1403891d5:	test   rcx,rcx
   1403891d8:	je     0x1403891ef
   1403891da:	mov    edx,0x49
   1403891df:	call   0x14133e7a0
   1403891e4:	xor    ecx,ecx
   1403891e6:	test   eax,eax
   1403891e8:	cmovns ecx,eax
   1403891eb:	inc    ecx
   1403891ed:	jmp    0x1403891f3
   1403891ef:	mov    ecx,DWORD PTR [rsp+0x7c]
   1403891f3:	test   ecx,ecx
   1403891f5:	jle    0x1403894f6
   1403891fb:	mov    edi,DWORD PTR [rbp-0x78]
   1403891fe:	mov    ebx,DWORD PTR [rbp-0x20]
   140389201:	lea    r8d,[rdi+0x2]
   140389205:	lea    edx,[rbx+0x1]
   140389208:	lea    rcx,[rip+0x22c11e1]        # 0x14264a3f0
   14038920f:	call   0x1400bb120
   140389214:	xor    r8d,r8d
   140389217:	mov    edx,0x6
   14038921c:	mov    r9b,0x1
   14038921f:	lea    rcx,[rip+0x22c11ca]        # 0x14264a3f0
   140389226:	call   0x1400bb130
   14038922b:	lea    rdx,[rip+0x1274e4e]        # 0x1415fe080
   140389232:	lea    rcx,[rbp+0xc0]
   140389239:	call   0x140068150
   14038923e:	nop
   14038923f:	xor    r9d,r9d
   140389242:	mov    r8b,0x3
   140389245:	lea    rdx,[rbp+0xc0]
   14038924c:	lea    rcx,[rip+0x22c119d]        # 0x14264a3f0
   140389253:	call   0x140ad9960
   140389258:	nop
   140389259:	lea    rcx,[rbp+0xc0]
   140389260:	call   0x140067e30
   140389265:	lea    rcx,[rbp+0x120]
   14038926c:	call   0x14006f690
   140389271:	nop
   140389272:	lea    rdx,[rbp+0x120]
   140389279:	mov    ecx,r13d
   14038927c:	call   0x14052c130
   140389281:	mov    dl,0xf
   140389283:	lea    rcx,[rbp+0x120]
   14038928a:	call   0x1400b9d30
   14038928f:	xor    r9d,r9d
   140389292:	xor    r8d,r8d
   140389295:	lea    rdx,[rbp+0x120]
   14038929c:	lea    rcx,[rip+0x22c114d]        # 0x14264a3f0
   1403892a3:	call   0x140ad9960
   1403892a8:	nop
   1403892a9:	lea    rcx,[rbp+0x120]
   1403892b0:	call   0x140067e30
   1403892b5:	mov    r13d,DWORD PTR [rbp-0x48]
   1403892b9:	lea    r8d,[r13+0x2]
   1403892bd:	lea    edx,[rbx+0x1]
   1403892c0:	lea    rcx,[rip+0x22c1129]        # 0x14264a3f0
   1403892c7:	call   0x1400bb120
   1403892cc:	xor    r8d,r8d
   1403892cf:	mov    edx,0x6
   1403892d4:	mov    r9b,0x1
   1403892d7:	lea    rcx,[rip+0x22c1112]        # 0x14264a3f0
   1403892de:	call   0x1400bb130
   1403892e3:	lea    rdx,[rip+0x1274d96]        # 0x1415fe080
   1403892ea:	lea    rcx,[rbp+0xc0]
   1403892f1:	call   0x140068150
   1403892f6:	nop
   1403892f7:	xor    r9d,r9d
   1403892fa:	mov    r8b,0x3
   1403892fd:	lea    rdx,[rbp+0xc0]
   140389304:	lea    rcx,[rip+0x22c10e5]        # 0x14264a3f0
   14038930b:	call   0x140ad9960
   140389310:	nop
   140389311:	lea    rcx,[rbp+0xc0]
   140389318:	call   0x140067e30
   14038931d:	lea    rcx,[rbp+0x120]
   140389324:	call   0x14006f690
   140389329:	nop
   14038932a:	lea    rdx,[rbp+0x120]
   140389331:	mov    ecx,r15d
   140389334:	call   0x14052c130
   140389339:	mov    dl,0xf
   14038933b:	lea    rcx,[rbp+0x120]
   140389342:	call   0x1400b9d30
   140389347:	xor    r9d,r9d
   14038934a:	xor    r8d,r8d
   14038934d:	lea    rdx,[rbp+0x120]
   140389354:	lea    rcx,[rip+0x22c1095]        # 0x14264a3f0
   14038935b:	call   0x140ad9960
   140389360:	nop
   140389361:	lea    rcx,[rbp+0x120]
   140389368:	call   0x140067e30
   14038936d:	mov    edx,ebx
   14038936f:	add    edx,0x2
   140389372:	lea    r8d,[rdi+0x2]
   140389376:	lea    rcx,[rip+0x22c1073]        # 0x14264a3f0
   14038937d:	call   0x1400bb120
   140389382:	test   esi,esi
   140389384:	js     0x140389452
   14038938a:	test   r14d,r14d
   14038938d:	jns    0x140389396
   14038938f:	mov    edx,0x4
   140389394:	jmp    0x1403893b2
   140389396:	test   r12d,r12d
   140389399:	jle    0x1403893ad
   14038939b:	imul   eax,r14d,0x64
   14038939f:	cdq
   1403893a0:	idiv   r12d
   1403893a3:	cmp    eax,0x32
   1403893a6:	mov    edx,0x2
   1403893ab:	jge    0x1403893b2
   1403893ad:	mov    edx,0x6
   1403893b2:	mov    r9b,0x1
   1403893b5:	xor    r8d,r8d
   1403893b8:	lea    rcx,[rip+0x22c1031]        # 0x14264a3f0
   1403893bf:	call   0x1400bb130
   1403893c4:	lea    rdx,[rip+0x12a1ead]        # 0x14162b278
   1403893cb:	lea    rcx,[rbp+0xc0]
   1403893d2:	call   0x140068150
   1403893d7:	nop
   1403893d8:	xor    r9d,r9d
   1403893db:	mov    r8b,0x3
   1403893de:	lea    rdx,[rbp+0xc0]
   1403893e5:	lea    rcx,[rip+0x22c1004]        # 0x14264a3f0
   1403893ec:	call   0x140ad9960
   1403893f1:	nop
   1403893f2:	lea    rcx,[rbp+0xc0]
   1403893f9:	call   0x140067e30
   1403893fe:	lea    rcx,[rbp+0x120]
   140389405:	call   0x14006f690
   14038940a:	nop
   14038940b:	lea    rdx,[rbp+0x120]
   140389412:	mov    ecx,esi
   140389414:	call   0x14052c130
   140389419:	mov    dl,0xf
   14038941b:	lea    rcx,[rbp+0x120]
   140389422:	call   0x1400b9d30
   140389427:	xor    r9d,r9d
   14038942a:	xor    r8d,r8d
   14038942d:	lea    rdx,[rbp+0x120]
   140389434:	lea    rcx,[rip+0x22c0fb5]        # 0x14264a3f0
   14038943b:	call   0x140ad9960
   140389440:	nop
   140389441:	lea    rcx,[rbp+0x120]
   140389448:	call   0x140067e30
   14038944d:	jmp    0x1403894fa
   140389452:	xor    r8d,r8d
   140389455:	mov    edx,0x4
   14038945a:	mov    r9b,0x1
   14038945d:	lea    rcx,[rip+0x22c0f8c]        # 0x14264a3f0
   140389464:	call   0x1400bb130
   140389469:	lea    rdx,[rip+0x12a1df8]        # 0x14162b268
   140389470:	lea    rcx,[rbp+0xc0]
   140389477:	call   0x140068150
   14038947c:	nop
   14038947d:	xor    r9d,r9d
   140389480:	mov    r8b,0x3
   140389483:	lea    rdx,[rbp+0xc0]
   14038948a:	lea    rcx,[rip+0x22c0f5f]        # 0x14264a3f0
   140389491:	call   0x140ad9960
   140389496:	nop
   140389497:	lea    rcx,[rbp+0xc0]
   14038949e:	call   0x140067e30
   1403894a3:	lea    rcx,[rbp+0x120]
   1403894aa:	call   0x14006f690
   1403894af:	nop
   1403894b0:	neg    esi
   1403894b2:	lea    rdx,[rbp+0x120]
   1403894b9:	mov    ecx,esi
   1403894bb:	call   0x14052c130
   1403894c0:	mov    dl,0xf
   1403894c2:	lea    rcx,[rbp+0x120]
   1403894c9:	call   0x1400b9d30
   1403894ce:	xor    r9d,r9d
   1403894d1:	xor    r8d,r8d
   1403894d4:	lea    rdx,[rbp+0x120]
   1403894db:	lea    rcx,[rip+0x22c0f0e]        # 0x14264a3f0
   1403894e2:	call   0x140ad9960
   1403894e7:	nop
   1403894e8:	lea    rcx,[rbp+0x120]
   1403894ef:	call   0x140067e30
   1403894f4:	jmp    0x1403894fa
   1403894f6:	mov    r13d,DWORD PTR [rbp-0x48]
   1403894fa:	mov    r8d,DWORD PTR [rbp-0x78]
   1403894fe:	add    r8d,0x2
   140389502:	mov    r12d,DWORD PTR [rbp-0x20]
   140389506:	lea    edx,[r12+0x3]
   14038950b:	lea    rcx,[rip+0x22c0ede]        # 0x14264a3f0
   140389512:	call   0x1400bb120
   140389517:	xor    r8d,r8d
   14038951a:	mov    r9b,0x1
   14038951d:	lea    rcx,[rip+0x22c0ecc]        # 0x14264a3f0
   140389524:	cmp    DWORD PTR [rbp-0x8],r8d
   140389528:	jl     0x1403895ae
   14038952e:	mov    edx,0x7
   140389533:	call   0x1400bb130
   140389538:	lea    rdx,[rip+0x12a1d59]        # 0x14162b298
   14038953f:	lea    rcx,[rbp+0x120]
   140389546:	call   0x140068150
   14038954b:	nop
   14038954c:	xor    r9d,r9d
   14038954f:	xor    r8d,r8d
   140389552:	lea    rdx,[rbp+0x120]
   140389559:	lea    rcx,[rip+0x22c0e90]        # 0x14264a3f0
   140389560:	call   0x140ad9960
   140389565:	nop
   140389566:	lea    rcx,[rbp+0x120]
   14038956d:	call   0x140067e30
   140389572:	lea    rcx,[rbp+0xc0]
   140389579:	call   0x14006f690
   14038957e:	nop
   14038957f:	lea    rdx,[rbp+0xc0]
   140389586:	lea    rcx,[rbp-0x8]
   14038958a:	call   0x1407754d0
   14038958f:	xor    r9d,r9d
   140389592:	xor    r8d,r8d
   140389595:	lea    rdx,[rbp+0xc0]
   14038959c:	lea    rcx,[rip+0x22c0e4d]        # 0x14264a3f0
   1403895a3:	call   0x140ad9960
   1403895a8:	nop
   1403895a9:	jmp    0x140389636
   1403895ae:	mov    edx,0x4
   1403895b3:	call   0x1400bb130
   1403895b8:	lea    rdx,[rip+0x12a1cc9]        # 0x14162b288
   1403895bf:	lea    rcx,[rbp+0x120]
   1403895c6:	call   0x140068150
   1403895cb:	nop
   1403895cc:	xor    r9d,r9d
   1403895cf:	xor    r8d,r8d
   1403895d2:	lea    rdx,[rbp+0x120]
   1403895d9:	lea    rcx,[rip+0x22c0e10]        # 0x14264a3f0
   1403895e0:	call   0x140ad9960
   1403895e5:	nop
   1403895e6:	lea    rcx,[rbp+0x120]
   1403895ed:	call   0x140067e30
   1403895f2:	mov    rax,QWORD PTR [rbp-0x8]
   1403895f6:	mov    QWORD PTR [rbp-0x40],rax
   1403895fa:	neg    eax
   1403895fc:	mov    DWORD PTR [rbp-0x40],eax
   1403895ff:	lea    rcx,[rbp+0xc0]
   140389606:	call   0x14006f690
   14038960b:	nop
   14038960c:	lea    rdx,[rbp+0xc0]
   140389613:	lea    rcx,[rbp-0x40]
   140389617:	call   0x1407754d0
   14038961c:	xor    r9d,r9d
   14038961f:	xor    r8d,r8d
   140389622:	lea    rdx,[rbp+0xc0]
   140389629:	lea    rcx,[rip+0x22c0dc0]        # 0x14264a3f0
   140389630:	call   0x140ad9960
   140389635:	nop
   140389636:	lea    rcx,[rbp+0xc0]
   14038963d:	call   0x140067e30
   140389642:	lea    r15d,[r13-0x1e]
   140389646:	lea    r14d,[r15+0xb]
   14038964a:	mov    ebx,r15d
   14038964d:	cmp    r15d,r14d
   140389650:	jg     0x140389732
   140389656:	lea    edi,[r12+0x1]
   14038965b:	lea    esi,[r12+0x2]
   140389660:	mov    DWORD PTR [rip+0x22c0e0e],ebx        # 0x14264a474
   140389666:	mov    DWORD PTR [rip+0x22c0e0b],r12d        # 0x14264a478
   14038966d:	lea    rcx,[rip+0x22c0d7c]        # 0x14264a3f0
   140389674:	cmp    ebx,r15d
   140389677:	jne    0x1403896aa
   140389679:	mov    edx,DWORD PTR [rip+0x22cb575]        # 0x142654bf4
   14038967f:	call   0x140adaad0
   140389684:	mov    DWORD PTR [rip+0x22c0dea],ebx        # 0x14264a474
   14038968a:	mov    DWORD PTR [rip+0x22c0de8],edi        # 0x14264a478
   140389690:	mov    edx,DWORD PTR [rip+0x22cb562]        # 0x142654bf8
   140389696:	lea    rcx,[rip+0x22c0d53]        # 0x14264a3f0
   14038969d:	call   0x140adaad0
   1403896a2:	mov    edx,DWORD PTR [rip+0x22cb554]        # 0x142654bfc
   1403896a8:	jmp    0x14038970f
   1403896aa:	cmp    ebx,r14d
   1403896ad:	jne    0x1403896e0
   1403896af:	mov    edx,DWORD PTR [rip+0x22cb557]        # 0x142654c0c
   1403896b5:	call   0x140adaad0
   1403896ba:	mov    DWORD PTR [rip+0x22c0db4],ebx        # 0x14264a474
   1403896c0:	mov    DWORD PTR [rip+0x22c0db2],edi        # 0x14264a478
   1403896c6:	mov    edx,DWORD PTR [rip+0x22cb544]        # 0x142654c10
   1403896cc:	lea    rcx,[rip+0x22c0d1d]        # 0x14264a3f0
   1403896d3:	call   0x140adaad0
   1403896d8:	mov    edx,DWORD PTR [rip+0x22cb536]        # 0x142654c14
   1403896de:	jmp    0x14038970f
   1403896e0:	mov    edx,DWORD PTR [rip+0x22cb51a]        # 0x142654c00
   1403896e6:	call   0x140adaad0
   1403896eb:	mov    DWORD PTR [rip+0x22c0d83],ebx        # 0x14264a474
   1403896f1:	mov    DWORD PTR [rip+0x22c0d81],edi        # 0x14264a478
   1403896f7:	mov    edx,DWORD PTR [rip+0x22cb507]        # 0x142654c04
   1403896fd:	lea    rcx,[rip+0x22c0cec]        # 0x14264a3f0
   140389704:	call   0x140adaad0
   140389709:	mov    edx,DWORD PTR [rip+0x22cb4f9]        # 0x142654c08
   14038970f:	mov    DWORD PTR [rip+0x22c0d5f],ebx        # 0x14264a474
   140389715:	mov    DWORD PTR [rip+0x22c0d5d],esi        # 0x14264a478
   14038971b:	lea    rcx,[rip+0x22c0cce]        # 0x14264a3f0
   140389722:	call   0x140adaad0
   140389727:	inc    ebx
   140389729:	cmp    ebx,r14d
   14038972c:	jle    0x140389660
   140389732:	mov    DWORD PTR [rip+0x22c0d40],0x1010007        # 0x14264a47c
   14038973c:	lea    eax,[r15+0x2]
   140389740:	mov    DWORD PTR [rip+0x22c0d2e],eax        # 0x14264a474
   140389746:	lea    edi,[r12+0x1]
   14038974b:	mov    DWORD PTR [rip+0x22c0d27],edi        # 0x14264a478
   140389751:	lea    rdx,[rip+0x12925a8]        # 0x14161bd00
   140389758:	lea    rcx,[rbp+0xc0]
   14038975f:	call   0x140068150
   140389764:	nop
   140389765:	xor    r9d,r9d
   140389768:	xor    r8d,r8d
   14038976b:	lea    rdx,[rbp+0xc0]
   140389772:	lea    rcx,[rip+0x22c0c77]        # 0x14264a3f0
   140389779:	call   0x140ad9960
   14038977e:	nop
   14038977f:	lea    rcx,[rbp+0xc0]
   140389786:	call   0x14006f850
   14038978b:	lea    r15d,[r13-0xf]
   14038978f:	lea    r14d,[r15+0xd]
   140389793:	mov    ebx,r15d
   140389796:	cmp    r15d,r14d
   140389799:	jg     0x140389882
   14038979f:	lea    esi,[r12+0x2]
   1403897a4:	nop    DWORD PTR [rax+0x0]
   1403897a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1403897b0:	mov    DWORD PTR [rip+0x22c0cbe],ebx        # 0x14264a474
   1403897b6:	mov    DWORD PTR [rip+0x22c0cbb],r12d        # 0x14264a478
   1403897bd:	lea    rcx,[rip+0x22c0c2c]        # 0x14264a3f0
   1403897c4:	cmp    ebx,r15d
   1403897c7:	jne    0x1403897fa
   1403897c9:	mov    edx,DWORD PTR [rip+0x22cb425]        # 0x142654bf4
   1403897cf:	call   0x140adaad0
   1403897d4:	mov    DWORD PTR [rip+0x22c0c9a],ebx        # 0x14264a474
   1403897da:	mov    DWORD PTR [rip+0x22c0c98],edi        # 0x14264a478
   1403897e0:	mov    edx,DWORD PTR [rip+0x22cb412]        # 0x142654bf8
   1403897e6:	lea    rcx,[rip+0x22c0c03]        # 0x14264a3f0
   1403897ed:	call   0x140adaad0
   1403897f2:	mov    edx,DWORD PTR [rip+0x22cb404]        # 0x142654bfc
   1403897f8:	jmp    0x14038985f
   1403897fa:	cmp    ebx,r14d
   1403897fd:	jne    0x140389830
   1403897ff:	mov    edx,DWORD PTR [rip+0x22cb407]        # 0x142654c0c
   140389805:	call   0x140adaad0
   14038980a:	mov    DWORD PTR [rip+0x22c0c64],ebx        # 0x14264a474
   140389810:	mov    DWORD PTR [rip+0x22c0c62],edi        # 0x14264a478
   140389816:	mov    edx,DWORD PTR [rip+0x22cb3f4]        # 0x142654c10
   14038981c:	lea    rcx,[rip+0x22c0bcd]        # 0x14264a3f0
   140389823:	call   0x140adaad0
   140389828:	mov    edx,DWORD PTR [rip+0x22cb3e6]        # 0x142654c14
   14038982e:	jmp    0x14038985f
   140389830:	mov    edx,DWORD PTR [rip+0x22cb3ca]        # 0x142654c00
   140389836:	call   0x140adaad0
   14038983b:	mov    DWORD PTR [rip+0x22c0c33],ebx        # 0x14264a474
   140389841:	mov    DWORD PTR [rip+0x22c0c31],edi        # 0x14264a478
   140389847:	mov    edx,DWORD PTR [rip+0x22cb3b7]        # 0x142654c04
   14038984d:	lea    rcx,[rip+0x22c0b9c]        # 0x14264a3f0
   140389854:	call   0x140adaad0
   140389859:	mov    edx,DWORD PTR [rip+0x22cb3a9]        # 0x142654c08
   14038985f:	mov    DWORD PTR [rip+0x22c0c0f],ebx        # 0x14264a474
   140389865:	mov    DWORD PTR [rip+0x22c0c0d],esi        # 0x14264a478
   14038986b:	lea    rcx,[rip+0x22c0b7e]        # 0x14264a3f0
   140389872:	call   0x140adaad0
   140389877:	inc    ebx
   140389879:	cmp    ebx,r14d
   14038987c:	jle    0x1403897b0
   140389882:	mov    DWORD PTR [rip+0x22c0bf0],0x1010007        # 0x14264a47c
   14038988c:	lea    eax,[r15+0x2]
   140389890:	mov    DWORD PTR [rip+0x22c0bde],eax        # 0x14264a474
   140389896:	lea    eax,[r12+0x1]
   14038989b:	mov    DWORD PTR [rip+0x22c0bd7],eax        # 0x14264a478
   1403898a1:	lea    rdx,[rip+0x1292468]        # 0x14161bd10
   1403898a8:	lea    rcx,[rbp+0xc0]
   1403898af:	call   0x140068150
   1403898b4:	nop
   1403898b5:	xor    r9d,r9d
   1403898b8:	xor    r8d,r8d
   1403898bb:	lea    rdx,[rbp+0xc0]
   1403898c2:	lea    rcx,[rip+0x22c0b27]        # 0x14264a3f0
   1403898c9:	call   0x140ad9960
   1403898ce:	nop
   1403898cf:	lea    rcx,[rbp+0xc0]
   1403898d6:	call   0x14006f850
   1403898db:	mov    r13d,DWORD PTR [rbp+0x10]
   1403898df:	lea    r15d,[r13-0x1e]
   1403898e3:	lea    r14d,[r15+0xb]
   1403898e7:	mov    ebx,r15d
   1403898ea:	cmp    r15d,r14d
   1403898ed:	jg     0x1403899d2
   1403898f3:	lea    edi,[r12+0x1]
   1403898f8:	lea    esi,[r12+0x2]
   1403898fd:	nop    DWORD PTR [rax]
   140389900:	mov    DWORD PTR [rip+0x22c0b6e],ebx        # 0x14264a474
   140389906:	mov    DWORD PTR [rip+0x22c0b6b],r12d        # 0x14264a478
   14038990d:	lea    rcx,[rip+0x22c0adc]        # 0x14264a3f0
   140389914:	cmp    ebx,r15d
   140389917:	jne    0x14038994a
   140389919:	mov    edx,DWORD PTR [rip+0x22cb2d5]        # 0x142654bf4
   14038991f:	call   0x140adaad0
   140389924:	mov    DWORD PTR [rip+0x22c0b4a],ebx        # 0x14264a474
   14038992a:	mov    DWORD PTR [rip+0x22c0b48],edi        # 0x14264a478
   140389930:	mov    edx,DWORD PTR [rip+0x22cb2c2]        # 0x142654bf8
   140389936:	lea    rcx,[rip+0x22c0ab3]        # 0x14264a3f0
   14038993d:	call   0x140adaad0
   140389942:	mov    edx,DWORD PTR [rip+0x22cb2b4]        # 0x142654bfc
   140389948:	jmp    0x1403899af
   14038994a:	cmp    ebx,r14d
   14038994d:	jne    0x140389980
   14038994f:	mov    edx,DWORD PTR [rip+0x22cb2b7]        # 0x142654c0c
   140389955:	call   0x140adaad0
   14038995a:	mov    DWORD PTR [rip+0x22c0b14],ebx        # 0x14264a474
   140389960:	mov    DWORD PTR [rip+0x22c0b12],edi        # 0x14264a478
   140389966:	mov    edx,DWORD PTR [rip+0x22cb2a4]        # 0x142654c10
   14038996c:	lea    rcx,[rip+0x22c0a7d]        # 0x14264a3f0
   140389973:	call   0x140adaad0
   140389978:	mov    edx,DWORD PTR [rip+0x22cb296]        # 0x142654c14
   14038997e:	jmp    0x1403899af
   140389980:	mov    edx,DWORD PTR [rip+0x22cb27a]        # 0x142654c00
   140389986:	call   0x140adaad0
   14038998b:	mov    DWORD PTR [rip+0x22c0ae3],ebx        # 0x14264a474
   140389991:	mov    DWORD PTR [rip+0x22c0ae1],edi        # 0x14264a478
   140389997:	mov    edx,DWORD PTR [rip+0x22cb267]        # 0x142654c04
   14038999d:	lea    rcx,[rip+0x22c0a4c]        # 0x14264a3f0
   1403899a4:	call   0x140adaad0
   1403899a9:	mov    edx,DWORD PTR [rip+0x22cb259]        # 0x142654c08
   1403899af:	mov    DWORD PTR [rip+0x22c0abf],ebx        # 0x14264a474
   1403899b5:	mov    DWORD PTR [rip+0x22c0abd],esi        # 0x14264a478
   1403899bb:	lea    rcx,[rip+0x22c0a2e]        # 0x14264a3f0
   1403899c2:	call   0x140adaad0
   1403899c7:	inc    ebx
   1403899c9:	cmp    ebx,r14d
   1403899cc:	jle    0x140389900
   1403899d2:	mov    DWORD PTR [rip+0x22c0aa0],0x1010007        # 0x14264a47c
   1403899dc:	lea    eax,[r15+0x2]
   1403899e0:	mov    DWORD PTR [rip+0x22c0a8e],eax        # 0x14264a474
   1403899e6:	lea    eax,[r12+0x1]
   1403899eb:	mov    DWORD PTR [rip+0x22c0a87],eax        # 0x14264a478
   1403899f1:	lea    rdx,[rip+0x1292308]        # 0x14161bd00
   1403899f8:	lea    rcx,[rbp+0xc0]
   1403899ff:	call   0x140068150
   140389a04:	nop
   140389a05:	xor    r9d,r9d
   140389a08:	xor    r8d,r8d
   140389a0b:	lea    rdx,[rbp+0xc0]
   140389a12:	lea    rcx,[rip+0x22c09d7]        # 0x14264a3f0
   140389a19:	call   0x140ad9960
   140389a1e:	nop
   140389a1f:	lea    rcx,[rbp+0xc0]
   140389a26:	call   0x14006f850
   140389a2b:	lea    r15d,[r13-0xf]
   140389a2f:	lea    r14d,[r15+0xd]
   140389a33:	mov    ebx,r15d
   140389a36:	cmp    r15d,r14d
   140389a39:	jg     0x140389b22
   140389a3f:	lea    edi,[r12+0x1]
   140389a44:	lea    esi,[r12+0x2]
   140389a49:	nop    DWORD PTR [rax+0x0]
   140389a50:	mov    DWORD PTR [rip+0x22c0a1e],ebx        # 0x14264a474
   140389a56:	mov    DWORD PTR [rip+0x22c0a1b],r12d        # 0x14264a478
   140389a5d:	lea    rcx,[rip+0x22c098c]        # 0x14264a3f0
   140389a64:	cmp    ebx,r15d
   140389a67:	jne    0x140389a9a
   140389a69:	mov    edx,DWORD PTR [rip+0x22cb185]        # 0x142654bf4
   140389a6f:	call   0x140adaad0
   140389a74:	mov    DWORD PTR [rip+0x22c09fa],ebx        # 0x14264a474
   140389a7a:	mov    DWORD PTR [rip+0x22c09f8],edi        # 0x14264a478
   140389a80:	mov    edx,DWORD PTR [rip+0x22cb172]        # 0x142654bf8
   140389a86:	lea    rcx,[rip+0x22c0963]        # 0x14264a3f0
   140389a8d:	call   0x140adaad0
   140389a92:	mov    edx,DWORD PTR [rip+0x22cb164]        # 0x142654bfc
   140389a98:	jmp    0x140389aff
   140389a9a:	cmp    ebx,r14d
   140389a9d:	jne    0x140389ad0
   140389a9f:	mov    edx,DWORD PTR [rip+0x22cb167]        # 0x142654c0c
   140389aa5:	call   0x140adaad0
   140389aaa:	mov    DWORD PTR [rip+0x22c09c4],ebx        # 0x14264a474
   140389ab0:	mov    DWORD PTR [rip+0x22c09c2],edi        # 0x14264a478
   140389ab6:	mov    edx,DWORD PTR [rip+0x22cb154]        # 0x142654c10
   140389abc:	lea    rcx,[rip+0x22c092d]        # 0x14264a3f0
   140389ac3:	call   0x140adaad0
   140389ac8:	mov    edx,DWORD PTR [rip+0x22cb146]        # 0x142654c14
   140389ace:	jmp    0x140389aff
   140389ad0:	mov    edx,DWORD PTR [rip+0x22cb12a]        # 0x142654c00
   140389ad6:	call   0x140adaad0
   140389adb:	mov    DWORD PTR [rip+0x22c0993],ebx        # 0x14264a474
   140389ae1:	mov    DWORD PTR [rip+0x22c0991],edi        # 0x14264a478
   140389ae7:	mov    edx,DWORD PTR [rip+0x22cb117]        # 0x142654c04
   140389aed:	lea    rcx,[rip+0x22c08fc]        # 0x14264a3f0
   140389af4:	call   0x140adaad0
   140389af9:	mov    edx,DWORD PTR [rip+0x22cb109]        # 0x142654c08
   140389aff:	mov    DWORD PTR [rip+0x22c096f],ebx        # 0x14264a474
   140389b05:	mov    DWORD PTR [rip+0x22c096d],esi        # 0x14264a478
   140389b0b:	lea    rcx,[rip+0x22c08de]        # 0x14264a3f0
   140389b12:	call   0x140adaad0
   140389b17:	inc    ebx
   140389b19:	cmp    ebx,r14d
   140389b1c:	jle    0x140389a50
   140389b22:	mov    DWORD PTR [rip+0x22c0950],0x1010007        # 0x14264a47c
   140389b2c:	lea    eax,[r15+0x2]
   140389b30:	mov    DWORD PTR [rip+0x22c093e],eax        # 0x14264a474
   140389b36:	lea    eax,[r12+0x1]
   140389b3b:	mov    DWORD PTR [rip+0x22c0937],eax        # 0x14264a478
   140389b41:	lea    rdx,[rip+0x12921c8]        # 0x14161bd10
   140389b48:	lea    rcx,[rbp+0xc0]
   140389b4f:	call   0x140068150
   140389b54:	nop
   140389b55:	xor    r9d,r9d
   140389b58:	xor    r8d,r8d
   140389b5b:	lea    rdx,[rbp+0xc0]
   140389b62:	lea    rcx,[rip+0x22c0887]        # 0x14264a3f0
   140389b69:	call   0x140ad9960
   140389b6e:	nop
   140389b6f:	lea    rcx,[rbp+0xc0]
   140389b76:	call   0x14006f850
   140389b7b:	mov    r13,QWORD PTR [rbp-0x80]
   140389b7f:	cmp    QWORD PTR [r13+0xc0],0x0
   140389b87:	je     0x140389d7b
   140389b8d:	mov    esi,DWORD PTR [rbp-0x48]
   140389b90:	add    esi,0xffffffe2
   140389b93:	lea    edi,[rsi+0xa]
   140389b96:	lea    r14d,[r12+0x3]
   140389b9b:	mov    ebx,esi
   140389b9d:	cmp    esi,edi
   140389b9f:	jg     0x140389d08
   140389ba5:	lea    r15d,[r14+0x1]
   140389ba9:	lea    r12d,[r14+0x2]
   140389bad:	nop    DWORD PTR [rax]
   140389bb0:	mov    DWORD PTR [rip+0x22c08be],ebx        # 0x14264a474
   140389bb6:	mov    DWORD PTR [rip+0x22c08bb],r14d        # 0x14264a478
   140389bbd:	mov    rcx,QWORD PTR [r13+0xc0]
   140389bc4:	mov    eax,DWORD PTR [rip+0x2009aa6]        # 0x142393670
   140389bca:	cmp    DWORD PTR [rcx+0x4],eax
   140389bcd:	je     0x140389bf6
   140389bcf:	cmp    ebx,esi
   140389bd1:	jne    0x140389bdb
   140389bd3:	mov    edx,DWORD PTR [rip+0x22cb01b]        # 0x142654bf4
   140389bd9:	jmp    0x140389c12
   140389bdb:	lea    rcx,[rip+0x22c080e]        # 0x14264a3f0
   140389be2:	cmp    ebx,edi
   140389be4:	jne    0x140389bee
   140389be6:	mov    edx,DWORD PTR [rip+0x22cb020]        # 0x142654c0c
   140389bec:	jmp    0x140389c19
   140389bee:	mov    edx,DWORD PTR [rip+0x22cb00c]        # 0x142654c00
   140389bf4:	jmp    0x140389c19
   140389bf6:	cmp    ebx,esi
   140389bf8:	jne    0x140389c02
   140389bfa:	mov    edx,DWORD PTR [rip+0x22caf58]        # 0x142654b58
   140389c00:	jmp    0x140389c12
   140389c02:	cmp    ebx,edi
   140389c04:	mov    edx,DWORD PTR [rip+0x22caf66]        # 0x142654b70
   140389c0a:	je     0x140389c12
   140389c0c:	mov    edx,DWORD PTR [rip+0x22caf52]        # 0x142654b64
   140389c12:	lea    rcx,[rip+0x22c07d7]        # 0x14264a3f0
   140389c19:	call   0x140adaad0
   140389c1e:	mov    DWORD PTR [rip+0x22c0850],ebx        # 0x14264a474
   140389c24:	mov    DWORD PTR [rip+0x22c084d],r15d        # 0x14264a478
   140389c2b:	mov    rcx,QWORD PTR [r13+0xc0]
   140389c32:	mov    eax,DWORD PTR [rip+0x2009a38]        # 0x142393670
   140389c38:	cmp    DWORD PTR [rcx+0x4],eax
   140389c3b:	je     0x140389c64
   140389c3d:	cmp    ebx,esi
   140389c3f:	jne    0x140389c49
   140389c41:	mov    edx,DWORD PTR [rip+0x22cafb1]        # 0x142654bf8
   140389c47:	jmp    0x140389c80
   140389c49:	lea    rcx,[rip+0x22c07a0]        # 0x14264a3f0
   140389c50:	cmp    ebx,edi
   140389c52:	jne    0x140389c5c
   140389c54:	mov    edx,DWORD PTR [rip+0x22cafb6]        # 0x142654c10
   140389c5a:	jmp    0x140389c87
   140389c5c:	mov    edx,DWORD PTR [rip+0x22cafa2]        # 0x142654c04
   140389c62:	jmp    0x140389c87
   140389c64:	cmp    ebx,esi
   140389c66:	jne    0x140389c70
   140389c68:	mov    edx,DWORD PTR [rip+0x22caeee]        # 0x142654b5c
   140389c6e:	jmp    0x140389c80
   140389c70:	cmp    ebx,edi
   140389c72:	mov    edx,DWORD PTR [rip+0x22caefc]        # 0x142654b74
   140389c78:	je     0x140389c80
   140389c7a:	mov    edx,DWORD PTR [rip+0x22caee8]        # 0x142654b68
   140389c80:	lea    rcx,[rip+0x22c0769]        # 0x14264a3f0
   140389c87:	call   0x140adaad0
   140389c8c:	mov    DWORD PTR [rip+0x22c07e2],ebx        # 0x14264a474
   140389c92:	mov    DWORD PTR [rip+0x22c07df],r12d        # 0x14264a478
   140389c99:	mov    rcx,QWORD PTR [r13+0xc0]
   140389ca0:	mov    eax,DWORD PTR [rip+0x20099ca]        # 0x142393670
   140389ca6:	cmp    DWORD PTR [rcx+0x4],eax
   140389ca9:	je     0x140389cd2
   140389cab:	cmp    ebx,esi
   140389cad:	jne    0x140389cb7
   140389caf:	mov    edx,DWORD PTR [rip+0x22caf47]        # 0x142654bfc
   140389cb5:	jmp    0x140389cee
   140389cb7:	lea    rcx,[rip+0x22c0732]        # 0x14264a3f0
   140389cbe:	cmp    ebx,edi
   140389cc0:	jne    0x140389cca
   140389cc2:	mov    edx,DWORD PTR [rip+0x22caf4c]        # 0x142654c14
   140389cc8:	jmp    0x140389cf5
   140389cca:	mov    edx,DWORD PTR [rip+0x22caf38]        # 0x142654c08
   140389cd0:	jmp    0x140389cf5
   140389cd2:	cmp    ebx,esi
   140389cd4:	jne    0x140389cde
   140389cd6:	mov    edx,DWORD PTR [rip+0x22cae84]        # 0x142654b60
   140389cdc:	jmp    0x140389cee
   140389cde:	cmp    ebx,edi
   140389ce0:	mov    edx,DWORD PTR [rip+0x22cae92]        # 0x142654b78
   140389ce6:	je     0x140389cee
   140389ce8:	mov    edx,DWORD PTR [rip+0x22cae7e]        # 0x142654b6c
   140389cee:	lea    rcx,[rip+0x22c06fb]        # 0x14264a3f0
   140389cf5:	call   0x140adaad0
   140389cfa:	inc    ebx
   140389cfc:	cmp    ebx,edi
   140389cfe:	jle    0x140389bb0
   140389d04:	mov    r12d,DWORD PTR [rbp-0x20]
   140389d08:	mov    rcx,QWORD PTR [r13+0xc0]
   140389d0f:	mov    eax,DWORD PTR [rip+0x200995b]        # 0x142393670
   140389d15:	cmp    DWORD PTR [rcx+0x4],eax
   140389d18:	mov    DWORD PTR [rip+0x22c075a],0x1010007        # 0x14264a47c
   140389d22:	jne    0x140389d2e
   140389d24:	mov    DWORD PTR [rip+0x22c074e],0x1000000        # 0x14264a47c
   140389d2e:	lea    eax,[rsi+0x3]
   140389d31:	mov    DWORD PTR [rip+0x22c073d],eax        # 0x14264a474
   140389d37:	lea    eax,[r14+0x1]
   140389d3b:	mov    DWORD PTR [rip+0x22c0737],eax        # 0x14264a478
   140389d41:	lea    rdx,[rip+0x12a157c]        # 0x14162b2c4
   140389d48:	lea    rcx,[rbp+0xc0]
   140389d4f:	call   0x140068150
   140389d54:	nop
   140389d55:	xor    r9d,r9d
   140389d58:	xor    r8d,r8d
   140389d5b:	lea    rdx,[rbp+0xc0]
   140389d62:	lea    rcx,[rip+0x22c0687]        # 0x14264a3f0
   140389d69:	call   0x140ad9960
   140389d6e:	nop
   140389d6f:	lea    rcx,[rbp+0xc0]
   140389d76:	call   0x14006f850
   140389d7b:	mov    eax,DWORD PTR [rbp-0x48]
   140389d7e:	lea    edi,[rax-0x5]
   140389d81:	lea    esi,[rdi+0xa]
   140389d84:	cmp    BYTE PTR [r13+0x37e],0x0
   140389d8c:	je     0x140389d94
   140389d8e:	lea    edi,[rax-0xc]
   140389d91:	lea    esi,[rdi+0x18]
   140389d94:	lea    r14d,[r12+0x3]
   140389d99:	mov    ebx,edi
   140389d9b:	cmp    edi,esi
   140389d9d:	jg     0x140389f02
   140389da3:	lea    r15d,[r14+0x1]
   140389da7:	lea    r12d,[r14+0x2]
   140389dab:	nop    DWORD PTR [rax+rax*1+0x0]
   140389db0:	mov    DWORD PTR [rip+0x22c06be],ebx        # 0x14264a474
   140389db6:	mov    DWORD PTR [rip+0x22c06bb],r14d        # 0x14264a478
   140389dbd:	mov    rax,QWORD PTR [r13+0xb8]
   140389dc4:	test   BYTE PTR [rax+0x20c0],0x20
   140389dcb:	jne    0x140389df4
   140389dcd:	cmp    ebx,edi
   140389dcf:	jne    0x140389dd9
   140389dd1:	mov    edx,DWORD PTR [rip+0x22cae1d]        # 0x142654bf4
   140389dd7:	jmp    0x140389e10
   140389dd9:	lea    rcx,[rip+0x22c0610]        # 0x14264a3f0
   140389de0:	cmp    ebx,esi
   140389de2:	jne    0x140389dec
   140389de4:	mov    edx,DWORD PTR [rip+0x22cae22]        # 0x142654c0c
   140389dea:	jmp    0x140389e17
   140389dec:	mov    edx,DWORD PTR [rip+0x22cae0e]        # 0x142654c00
   140389df2:	jmp    0x140389e17
   140389df4:	cmp    ebx,edi
   140389df6:	jne    0x140389e00
   140389df8:	mov    edx,DWORD PTR [rip+0x22cad5a]        # 0x142654b58
   140389dfe:	jmp    0x140389e10
   140389e00:	cmp    ebx,esi
   140389e02:	mov    edx,DWORD PTR [rip+0x22cad68]        # 0x142654b70
   140389e08:	je     0x140389e10
   140389e0a:	mov    edx,DWORD PTR [rip+0x22cad54]        # 0x142654b64
   140389e10:	lea    rcx,[rip+0x22c05d9]        # 0x14264a3f0
   140389e17:	call   0x140adaad0
   140389e1c:	mov    DWORD PTR [rip+0x22c0652],ebx        # 0x14264a474
   140389e22:	mov    DWORD PTR [rip+0x22c064f],r15d        # 0x14264a478
   140389e29:	mov    rax,QWORD PTR [r13+0xb8]
   140389e30:	test   BYTE PTR [rax+0x20c0],0x20
   140389e37:	jne    0x140389e60
   140389e39:	cmp    ebx,edi
   140389e3b:	jne    0x140389e45
   140389e3d:	mov    edx,DWORD PTR [rip+0x22cadb5]        # 0x142654bf8
   140389e43:	jmp    0x140389e7c
   140389e45:	lea    rcx,[rip+0x22c05a4]        # 0x14264a3f0
   140389e4c:	cmp    ebx,esi
   140389e4e:	jne    0x140389e58
   140389e50:	mov    edx,DWORD PTR [rip+0x22cadba]        # 0x142654c10
   140389e56:	jmp    0x140389e83
   140389e58:	mov    edx,DWORD PTR [rip+0x22cada6]        # 0x142654c04
   140389e5e:	jmp    0x140389e83
   140389e60:	cmp    ebx,edi
   140389e62:	jne    0x140389e6c
   140389e64:	mov    edx,DWORD PTR [rip+0x22cacf2]        # 0x142654b5c
   140389e6a:	jmp    0x140389e7c
   140389e6c:	cmp    ebx,esi
   140389e6e:	mov    edx,DWORD PTR [rip+0x22cad00]        # 0x142654b74
   140389e74:	je     0x140389e7c
   140389e76:	mov    edx,DWORD PTR [rip+0x22cacec]        # 0x142654b68
   140389e7c:	lea    rcx,[rip+0x22c056d]        # 0x14264a3f0
   140389e83:	call   0x140adaad0
   140389e88:	mov    DWORD PTR [rip+0x22c05e6],ebx        # 0x14264a474
   140389e8e:	mov    DWORD PTR [rip+0x22c05e3],r12d        # 0x14264a478
   140389e95:	mov    rax,QWORD PTR [r13+0xb8]
   140389e9c:	test   BYTE PTR [rax+0x20c0],0x20
   140389ea3:	jne    0x140389ecc
   140389ea5:	cmp    ebx,edi
   140389ea7:	jne    0x140389eb1
   140389ea9:	mov    edx,DWORD PTR [rip+0x22cad4d]        # 0x142654bfc
   140389eaf:	jmp    0x140389ee8
   140389eb1:	lea    rcx,[rip+0x22c0538]        # 0x14264a3f0
   140389eb8:	cmp    ebx,esi
   140389eba:	jne    0x140389ec4
   140389ebc:	mov    edx,DWORD PTR [rip+0x22cad52]        # 0x142654c14
   140389ec2:	jmp    0x140389eef
   140389ec4:	mov    edx,DWORD PTR [rip+0x22cad3e]        # 0x142654c08
   140389eca:	jmp    0x140389eef
   140389ecc:	cmp    ebx,edi
   140389ece:	jne    0x140389ed8
   140389ed0:	mov    edx,DWORD PTR [rip+0x22cac8a]        # 0x142654b60
   140389ed6:	jmp    0x140389ee8
   140389ed8:	cmp    ebx,esi
   140389eda:	mov    edx,DWORD PTR [rip+0x22cac98]        # 0x142654b78
   140389ee0:	je     0x140389ee8
   140389ee2:	mov    edx,DWORD PTR [rip+0x22cac84]        # 0x142654b6c
   140389ee8:	lea    rcx,[rip+0x22c0501]        # 0x14264a3f0
   140389eef:	call   0x140adaad0
   140389ef4:	inc    ebx
   140389ef6:	cmp    ebx,esi
   140389ef8:	jle    0x140389db0
   140389efe:	mov    r12d,DWORD PTR [rbp-0x20]
   140389f02:	mov    rax,QWORD PTR [r13+0xb8]
   140389f09:	test   BYTE PTR [rax+0x20c0],0x20
   140389f10:	mov    DWORD PTR [rip+0x22c0562],0x1010007        # 0x14264a47c
   140389f1a:	je     0x140389f26
   140389f1c:	mov    DWORD PTR [rip+0x22c0556],0x1000000        # 0x14264a47c
   140389f26:	lea    eax,[rdi+0x3]
   140389f29:	mov    DWORD PTR [rip+0x22c0545],eax        # 0x14264a474
   140389f2f:	lea    r15d,[r14+0x1]
   140389f33:	mov    DWORD PTR [rip+0x22c053e],r15d        # 0x14264a478
   140389f3a:	lea    rcx,[rbp+0xc0]
   140389f41:	cmp    BYTE PTR [r13+0x37e],0x0
   140389f49:	je     0x140389f74
   140389f4b:	lea    rdx,[rip+0x12a135e]        # 0x14162b2b0
   140389f52:	call   0x140068150
   140389f57:	nop
   140389f58:	xor    r9d,r9d
   140389f5b:	xor    r8d,r8d
   140389f5e:	lea    rdx,[rbp+0xc0]
   140389f65:	lea    rcx,[rip+0x22c0484]        # 0x14264a3f0
   140389f6c:	call   0x140ad9960
   140389f71:	nop
   140389f72:	jmp    0x140389f9b
   140389f74:	lea    rdx,[rip+0x126d12d]        # 0x1415f70a8
   140389f7b:	call   0x140068150
   140389f80:	nop
   140389f81:	xor    r9d,r9d
   140389f84:	xor    r8d,r8d
   140389f87:	lea    rdx,[rbp+0xc0]
   140389f8e:	lea    rcx,[rip+0x22c045b]        # 0x14264a3f0
   140389f95:	call   0x140ad9960
   140389f9a:	nop
   140389f9b:	lea    rcx,[rbp+0xc0]
   140389fa2:	call   0x14006f850
   140389fa7:	cmp    QWORD PTR [r13+0xc0],0x0
   140389faf:	je     0x14038a518
   140389fb5:	mov    esi,DWORD PTR [rbp-0x48]
   140389fb8:	add    esi,0x14
   140389fbb:	lea    edi,[rsi+0x12]
   140389fbe:	lea    r14d,[r12+0x3]
   140389fc3:	mov    ebx,esi
   140389fc5:	cmp    esi,edi
   140389fc7:	jg     0x14038a19b
   140389fcd:	lea    r12d,[r14+0x2]
   140389fd1:	mov    DWORD PTR [rip+0x22c049d],ebx        # 0x14264a474
   140389fd7:	mov    DWORD PTR [rip+0x22c049a],r14d        # 0x14264a478
   140389fde:	cmp    BYTE PTR [rip+0x20072f5],0x0        # 0x1423912da
   140389fe5:	je     0x140389ff9
   140389fe7:	mov    rcx,QWORD PTR [r13+0xc0]
   140389fee:	mov    eax,DWORD PTR [rip+0x200967c]        # 0x142393670
   140389ff4:	cmp    DWORD PTR [rcx+0x4],eax
   140389ff7:	je     0x14038a039
   140389ff9:	mov    rax,QWORD PTR [r13+0xb8]
   14038a000:	mov    r13d,DWORD PTR [rbp-0x64]
   14038a004:	test   BYTE PTR [rax+0x20c0],0x20
   14038a00b:	jne    0x14038a03d
   14038a00d:	test   r13b,r13b
   14038a010:	je     0x14038a03d
   14038a012:	cmp    ebx,esi
   14038a014:	jne    0x14038a01e
   14038a016:	mov    edx,DWORD PTR [rip+0x22cabd8]        # 0x142654bf4
   14038a01c:	jmp    0x14038a059
   14038a01e:	lea    rcx,[rip+0x22c03cb]        # 0x14264a3f0
   14038a025:	cmp    ebx,edi
   14038a027:	jne    0x14038a031
   14038a029:	mov    edx,DWORD PTR [rip+0x22cabdd]        # 0x142654c0c
   14038a02f:	jmp    0x14038a060
   14038a031:	mov    edx,DWORD PTR [rip+0x22cabc9]        # 0x142654c00
   14038a037:	jmp    0x14038a060
   14038a039:	mov    r13d,DWORD PTR [rbp-0x64]
   14038a03d:	cmp    ebx,esi
   14038a03f:	jne    0x14038a049
   14038a041:	mov    edx,DWORD PTR [rip+0x22cab11]        # 0x142654b58
   14038a047:	jmp    0x14038a059
   14038a049:	cmp    ebx,edi
   14038a04b:	mov    edx,DWORD PTR [rip+0x22cab1f]        # 0x142654b70
   14038a051:	je     0x14038a059
   14038a053:	mov    edx,DWORD PTR [rip+0x22cab0b]        # 0x142654b64
   14038a059:	lea    rcx,[rip+0x22c0390]        # 0x14264a3f0
   14038a060:	call   0x140adaad0
   14038a065:	mov    DWORD PTR [rip+0x22c0409],ebx        # 0x14264a474
   14038a06b:	mov    DWORD PTR [rip+0x22c0406],r15d        # 0x14264a478
   14038a072:	cmp    BYTE PTR [rip+0x2007261],0x0        # 0x1423912da
   14038a079:	je     0x14038a091
   14038a07b:	mov    rax,QWORD PTR [rbp-0x80]
   14038a07f:	mov    rcx,QWORD PTR [rax+0xc0]
   14038a086:	mov    eax,DWORD PTR [rip+0x20095e4]        # 0x142393670
   14038a08c:	cmp    DWORD PTR [rcx+0x4],eax
   14038a08f:	je     0x14038a0d1
   14038a091:	mov    rax,QWORD PTR [rbp-0x80]
   14038a095:	mov    rax,QWORD PTR [rax+0xb8]
   14038a09c:	test   BYTE PTR [rax+0x20c0],0x20
   14038a0a3:	jne    0x14038a0d1
   14038a0a5:	test   r13b,r13b
   14038a0a8:	je     0x14038a0d1
   14038a0aa:	cmp    ebx,esi
   14038a0ac:	jne    0x14038a0b6
   14038a0ae:	mov    edx,DWORD PTR [rip+0x22cab44]        # 0x142654bf8
   14038a0b4:	jmp    0x14038a0ed
   14038a0b6:	lea    rcx,[rip+0x22c0333]        # 0x14264a3f0
   14038a0bd:	cmp    ebx,edi
   14038a0bf:	jne    0x14038a0c9
   14038a0c1:	mov    edx,DWORD PTR [rip+0x22cab49]        # 0x142654c10
   14038a0c7:	jmp    0x14038a0f4
   14038a0c9:	mov    edx,DWORD PTR [rip+0x22cab35]        # 0x142654c04
   14038a0cf:	jmp    0x14038a0f4
   14038a0d1:	cmp    ebx,esi
   14038a0d3:	jne    0x14038a0dd
   14038a0d5:	mov    edx,DWORD PTR [rip+0x22caa81]        # 0x142654b5c
   14038a0db:	jmp    0x14038a0ed
   14038a0dd:	cmp    ebx,edi
   14038a0df:	mov    edx,DWORD PTR [rip+0x22caa8f]        # 0x142654b74
   14038a0e5:	je     0x14038a0ed
   14038a0e7:	mov    edx,DWORD PTR [rip+0x22caa7b]        # 0x142654b68
   14038a0ed:	lea    rcx,[rip+0x22c02fc]        # 0x14264a3f0
   14038a0f4:	call   0x140adaad0
   14038a0f9:	mov    DWORD PTR [rip+0x22c0375],ebx        # 0x14264a474
   14038a0ff:	mov    DWORD PTR [rip+0x22c0372],r12d        # 0x14264a478
   14038a106:	cmp    BYTE PTR [rip+0x20071cd],0x0        # 0x1423912da
   14038a10d:	je     0x14038a125
   14038a10f:	mov    rax,QWORD PTR [rbp-0x80]
   14038a113:	mov    rcx,QWORD PTR [rax+0xc0]
   14038a11a:	mov    eax,DWORD PTR [rip+0x2009550]        # 0x142393670
   14038a120:	cmp    DWORD PTR [rcx+0x4],eax
   14038a123:	je     0x14038a165
   14038a125:	mov    rax,QWORD PTR [rbp-0x80]
   14038a129:	mov    rax,QWORD PTR [rax+0xb8]
   14038a130:	test   BYTE PTR [rax+0x20c0],0x20
   14038a137:	jne    0x14038a165
   14038a139:	test   r13b,r13b
   14038a13c:	je     0x14038a165
   14038a13e:	cmp    ebx,esi
   14038a140:	jne    0x14038a14a
   14038a142:	mov    edx,DWORD PTR [rip+0x22caab4]        # 0x142654bfc
   14038a148:	jmp    0x14038a181
   14038a14a:	lea    rcx,[rip+0x22c029f]        # 0x14264a3f0
   14038a151:	cmp    ebx,edi
   14038a153:	jne    0x14038a15d
   14038a155:	mov    edx,DWORD PTR [rip+0x22caab9]        # 0x142654c14
   14038a15b:	jmp    0x14038a188
   14038a15d:	mov    edx,DWORD PTR [rip+0x22caaa5]        # 0x142654c08
   14038a163:	jmp    0x14038a188
   14038a165:	cmp    ebx,esi
   14038a167:	jne    0x14038a171
   14038a169:	mov    edx,DWORD PTR [rip+0x22ca9f1]        # 0x142654b60
   14038a16f:	jmp    0x14038a181
   14038a171:	cmp    ebx,edi
   14038a173:	mov    edx,DWORD PTR [rip+0x22ca9ff]        # 0x142654b78
   14038a179:	je     0x14038a181
   14038a17b:	mov    edx,DWORD PTR [rip+0x22ca9eb]        # 0x142654b6c
   14038a181:	lea    rcx,[rip+0x22c0268]        # 0x14264a3f0
   14038a188:	call   0x140adaad0
   14038a18d:	inc    ebx
   14038a18f:	cmp    ebx,edi
   14038a191:	mov    r13,QWORD PTR [rbp-0x80]
   14038a195:	jle    0x140389fd1
   14038a19b:	cmp    BYTE PTR [rip+0x2007138],0x0        # 0x1423912da
   14038a1a2:	je     0x14038a1b6
   14038a1a4:	mov    rcx,QWORD PTR [r13+0xc0]
   14038a1ab:	mov    eax,DWORD PTR [rip+0x20094bf]        # 0x142393670
   14038a1b1:	cmp    DWORD PTR [rcx+0x4],eax
   14038a1b4:	je     0x14038a1d6
   14038a1b6:	mov    rax,QWORD PTR [r13+0xb8]
   14038a1bd:	test   BYTE PTR [rax+0x20c0],0x20
   14038a1c4:	jne    0x14038a1d6
   14038a1c6:	cmp    BYTE PTR [rbp-0x64],0x0
   14038a1ca:	mov    DWORD PTR [rip+0x22c02a8],0x1010007        # 0x14264a47c
   14038a1d4:	jne    0x14038a1e0
   14038a1d6:	mov    DWORD PTR [rip+0x22c029c],0x1000000        # 0x14264a47c
   14038a1e0:	lea    eax,[rsi+0x3]
   14038a1e3:	mov    DWORD PTR [rip+0x22c028b],eax        # 0x14264a474
   14038a1e9:	lea    eax,[r14+0x1]
   14038a1ed:	mov    DWORD PTR [rip+0x22c0285],eax        # 0x14264a478
   14038a1f3:	lea    rdx,[rip+0x12a10e6]        # 0x14162b2e0
   14038a1fa:	lea    rcx,[rbp+0xc0]
   14038a201:	call   0x140068150
   14038a206:	nop
   14038a207:	xor    r9d,r9d
   14038a20a:	xor    r8d,r8d
   14038a20d:	lea    rdx,[rbp+0xc0]
   14038a214:	lea    rcx,[rip+0x22c01d5]        # 0x14264a3f0
   14038a21b:	call   0x140ad9960
   14038a220:	nop
   14038a221:	lea    rcx,[rbp+0xc0]
   14038a228:	call   0x14006f850
   14038a22d:	jmp    0x14038a518
   14038a232:	cmp    QWORD PTR [r14+0xd0],0x0
   14038a23a:	je     0x14038a404
   14038a240:	xor    edx,edx
   14038a242:	lea    rcx,[rip+0x2043527]        # 0x1423cd770
   14038a249:	call   0x140071f90
   14038a24e:	test   al,al
   14038a250:	je     0x14038a344
   14038a256:	lea    rcx,[rbp+0x120]
   14038a25d:	call   0x14006f690
   14038a262:	nop
   14038a263:	mov    r8,QWORD PTR [r14+0xd0]
   14038a26a:	lea    rax,[rsp+0x70]
   14038a26f:	mov    QWORD PTR [rsp+0x50],rax
   14038a274:	mov    QWORD PTR [rsp+0x48],0x0
   14038a27d:	mov    QWORD PTR [rsp+0x40],r8
   14038a282:	mov    DWORD PTR [rsp+0x38],0x800
   14038a28a:	movzx  eax,WORD PTR [r8+0xa0]
   14038a292:	mov    WORD PTR [rsp+0x30],ax
   14038a297:	mov    eax,0xffffffff
   14038a29c:	mov    WORD PTR [rsp+0x28],ax
   14038a2a1:	mov    WORD PTR [rsp+0x20],ax
   14038a2a6:	movzx  r9d,WORD PTR [r8+0x12c]
   14038a2ae:	movzx  r8d,WORD PTR [r8+0xa4]
   14038a2b6:	lea    rdx,[rbp+0x120]
   14038a2bd:	lea    rcx,[rip+0x2162784]        # 0x1424eca48
   14038a2c4:	call   0x1400f26e0
   14038a2c9:	mov    ebx,eax
   14038a2cb:	mov    edi,DWORD PTR [rbp-0x78]
   14038a2ce:	lea    rcx,[rip+0x22c011b]        # 0x14264a3f0
   14038a2d5:	cmp    BYTE PTR [rsp+0x70],0x0
   14038a2da:	je     0x14038a2f9
   14038a2dc:	lea    r8d,[rdi+0x1]
   14038a2e0:	mov    edx,0x5
   14038a2e5:	call   0x1400bb120
   14038a2ea:	test   ebx,ebx
   14038a2ec:	je     0x14038a336
   14038a2ee:	mov    r9d,0x6
   14038a2f4:	xor    r8d,r8d
   14038a2f7:	jmp    0x14038a312
   14038a2f9:	lea    r8d,[rdi+0x5]
   14038a2fd:	mov    edx,r15d
   14038a300:	call   0x1400bb120
   14038a305:	test   ebx,ebx
   14038a307:	je     0x14038a336
   14038a309:	mov    r9d,0x2
   14038a30f:	mov    r8d,r9d
   14038a312:	mov    BYTE PTR [rsp+0x30],0x0
   14038a317:	mov    DWORD PTR [rsp+0x28],0x3
   14038a31f:	mov    DWORD PTR [rsp+0x20],0x5
   14038a327:	mov    edx,ebx
   14038a329:	lea    rcx,[rip+0x22c00c0]        # 0x14264a3f0
   14038a330:	call   0x140adad70
   14038a335:	nop
   14038a336:	lea    rcx,[rbp+0x120]
   14038a33d:	call   0x140067e30
   14038a342:	jmp    0x14038a390
   14038a344:	mov    edi,DWORD PTR [rbp-0x78]
   14038a347:	lea    r8d,[rdi+0x7]
   14038a34b:	mov    edx,0x9
   14038a350:	lea    rcx,[rip+0x22c0099]        # 0x14264a3f0
   14038a357:	call   0x1400bb120
   14038a35c:	xor    edx,edx
   14038a35e:	xor    r9d,r9d
   14038a361:	mov    r8b,0x1
   14038a364:	mov    rcx,QWORD PTR [r14+0xd0]
   14038a36b:	call   0x141333bc0
   14038a370:	mov    rcx,QWORD PTR [r14+0xd0]
   14038a377:	mov    rax,QWORD PTR [rcx]
   14038a37a:	xor    edx,edx
   14038a37c:	call   QWORD PTR [rax]
   14038a37e:	movzx  edx,al
   14038a381:	mov    r8b,0x1
   14038a384:	lea    rcx,[rip+0x22c0065]        # 0x14264a3f0
   14038a38b:	call   0x1400bb190
   14038a390:	lea    rcx,[rbp+0xc0]
   14038a397:	call   0x14006f690
   14038a39c:	nop
   14038a39d:	xor    r8d,r8d
   14038a3a0:	lea    rdx,[rbp+0xc0]
   14038a3a7:	mov    rcx,QWORD PTR [r14+0xd0]
   14038a3ae:	call   0x141330c30
   14038a3b3:	xor    edx,edx
   14038a3b5:	xor    r9d,r9d
   14038a3b8:	mov    r8b,0x1
   14038a3bb:	mov    rcx,QWORD PTR [r14+0xd0]
   14038a3c2:	call   0x141333bc0
   14038a3c7:	lea    r8d,[rdi+0xd]
   14038a3cb:	mov    edx,0x5
   14038a3d0:	lea    rcx,[rip+0x22c0019]        # 0x14264a3f0
   14038a3d7:	call   0x1400bb120
   14038a3dc:	xor    r9d,r9d
   14038a3df:	xor    r8d,r8d
   14038a3e2:	lea    rdx,[rbp+0xc0]
   14038a3e9:	lea    rcx,[rip+0x22c0000]        # 0x14264a3f0
   14038a3f0:	call   0x140ad9960
   14038a3f5:	nop
   14038a3f6:	lea    rcx,[rbp+0xc0]
   14038a3fd:	call   0x140067e30
   14038a402:	jmp    0x14038a407
   14038a404:	mov    edi,DWORD PTR [rbp-0x78]
   14038a407:	xor    r8d,r8d
   14038a40a:	mov    edx,0x6
   14038a40f:	mov    r9b,0x1
   14038a412:	lea    rcx,[rip+0x22bffd7]        # 0x14264a3f0
   14038a419:	call   0x1400bb130
   14038a41e:	mov    edx,0x7
   14038a423:	lea    rcx,[rip+0x22bffc6]        # 0x14264a3f0
   14038a42a:	cmp    BYTE PTR [r14+0xc9],0x0
   14038a432:	je     0x14038a4be
   14038a438:	lea    r8d,[rdi+0xd]
   14038a43c:	call   0x1400bb120
   14038a441:	lea    rdx,[rip+0x12a04c0]        # 0x14162a908
   14038a448:	lea    rcx,[rbp+0xc0]
   14038a44f:	call   0x140068150
   14038a454:	nop
   14038a455:	xor    r9d,r9d
   14038a458:	xor    r8d,r8d
   14038a45b:	lea    rdx,[rbp+0xc0]
   14038a462:	lea    rcx,[rip+0x22bff87]        # 0x14264a3f0
   14038a469:	call   0x140ad9960
   14038a46e:	nop
   14038a46f:	lea    rcx,[rbp+0xc0]
   14038a476:	call   0x140067e30
   14038a47b:	lea    r8d,[rdi+0xd]
   14038a47f:	mov    edx,r15d
   14038a482:	lea    rcx,[rip+0x22bff67]        # 0x14264a3f0
   14038a489:	call   0x1400bb120
   14038a48e:	lea    rdx,[rip+0x12a0503]        # 0x14162a998
   14038a495:	lea    rcx,[rbp+0xc0]
   14038a49c:	call   0x140068150
   14038a4a1:	nop
   14038a4a2:	xor    r9d,r9d
   14038a4a5:	xor    r8d,r8d
   14038a4a8:	lea    rdx,[rbp+0xc0]
   14038a4af:	lea    rcx,[rip+0x22bff3a]        # 0x14264a3f0
   14038a4b6:	call   0x140ad9960
   14038a4bb:	nop
   14038a4bc:	jmp    0x14038a50c
   14038a4be:	xor    r8d,r8d
   14038a4c1:	xor    r9d,r9d
   14038a4c4:	call   0x1400bb130
   14038a4c9:	lea    r8d,[rdi+0xd]
   14038a4cd:	mov    edx,0x7
   14038a4d2:	lea    rcx,[rip+0x22bff17]        # 0x14264a3f0
   14038a4d9:	call   0x1400bb120
   14038a4de:	lea    rdx,[rip+0x12a047b]        # 0x14162a960
   14038a4e5:	lea    rcx,[rbp+0xc0]
   14038a4ec:	call   0x140068150
   14038a4f1:	nop
   14038a4f2:	xor    r9d,r9d
   14038a4f5:	xor    r8d,r8d
   14038a4f8:	lea    rdx,[rbp+0xc0]
   14038a4ff:	lea    rcx,[rip+0x22bfeea]        # 0x14264a3f0
   14038a506:	call   0x140ad9960
   14038a50b:	nop
   14038a50c:	lea    rcx,[rbp+0xc0]
   14038a513:	call   0x140067e30
   14038a518:	mov    rcx,QWORD PTR [rbp+0x180]
   14038a51f:	xor    rcx,rsp
   14038a522:	call   0x141539660
   14038a527:	add    rsp,0x298
   14038a52e:	pop    r15
   14038a530:	pop    r14
   14038a532:	pop    r13
   14038a534:	pop    r12
   14038a536:	pop    rdi
   14038a537:	pop    rsi
   14038a538:	pop    rbx
   14038a539:	pop    rbp
   14038a53a:	ret
   14038a53b:	nop
   14038a53c:	and    al,0x5c
   14038a53e:	cmp    BYTE PTR [rax],al
   14038a540:	mov    BYTE PTR [rsi+0x38],bl
   14038a543:	add    BYTE PTR [rsi+rbx*2+0x5ea00038],dl
   14038a54a:	cmp    BYTE PTR [rax],al
   14038a54c:	lods   al,BYTE PTR [rsi]
   14038a54d:	pop    rsi
   14038a54e:	cmp    BYTE PTR [rax],al
   14038a550:	mov    eax,0xc400385e
   14038a555:	pop    rsi
   14038a556:	cmp    BYTE PTR [rax],al
   14038a558:	jo     0x14038a5b9
   14038a55a:	cmp    BYTE PTR [rax],al
   14038a55c:	jl     0x14038a5bd
   14038a55e:	cmp    BYTE PTR [rax],al
   14038a560:	rcr    BYTE PTR [rdi+0x38],cl
   14038a563:	add    dh,bl
   14038a565:	pop    rdi
   14038a566:	cmp    BYTE PTR [rax],al
   14038a568:	rex.W (bad)
   14038a56a:	cmp    BYTE PTR [rax],al
   14038a56c:	mov    dl,0x60
   14038a56e:	cmp    BYTE PTR [rax],al
   14038a570:	mov    esi,0xdd003860
   14038a575:	(bad)
   14038a576:	cmp    BYTE PTR [rax],al
   14038a578:	jmp    0x14838dddd
   14038a57d:	(bad)
   14038a57e:	cmp    BYTE PTR [rax],al
   14038a580:	adc    al,0x61
   14038a582:	cmp    BYTE PTR [rax],al
   14038a584:	pop    rbx
   14038a585:	(bad)
   14038a586:	cmp    BYTE PTR [rax],al
   14038a588:	xchg   ebx,eax
   14038a589:	(bad)
   14038a58a:	cmp    BYTE PTR [rax],al
   14038a58c:	ja     0x14038a5ef
   14038a58e:	cmp    BYTE PTR [rax],al
   14038a590:	mov    ecx,0xb9003861
   14038a595:	(bad)
   14038a596:	cmp    BYTE PTR [rax],al
   14038a598:	mov    ecx,0xd0003861
   14038a59d:	pop    rsi
   14038a59e:	cmp    BYTE PTR [rax],al
   14038a5a0:	xor    bl,BYTE PTR [rdi+0x38]
   14038a5a3:	add    BYTE PTR [rcx+0x5f],dl
   14038a5a6:	cmp    BYTE PTR [rax],al
   14038a5a8:	and    bl,BYTE PTR [rsi+0x38]
   14038a5ab:	add    ah,bl
   14038a5ad:	pop    rsi
   14038a5ae:	cmp    BYTE PTR [rax],al
