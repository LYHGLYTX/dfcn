
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140ad7b10 <.text+0xad6b10>:
   140ad7b10:	4c 8b c1             	mov    r8,rcx
   140ad7b13:	44 8b d2             	mov    r10d,edx
   140ad7b16:	8b 89 84 00 00 00    	mov    ecx,DWORD PTR [rcx+0x84]
   140ad7b1c:	41 3b 88 88 02 00 00 	cmp    ecx,DWORD PTR [r8+0x288]
   140ad7b23:	0f 8c 32 01 00 00    	jl     0x140ad7c5b
   140ad7b29:	41 3b 88 8c 02 00 00 	cmp    ecx,DWORD PTR [r8+0x28c]
   140ad7b30:	0f 8f 25 01 00 00    	jg     0x140ad7c5b
   140ad7b36:	41 8b 90 88 00 00 00 	mov    edx,DWORD PTR [r8+0x88]
   140ad7b3d:	41 3b 90 90 02 00 00 	cmp    edx,DWORD PTR [r8+0x290]
   140ad7b44:	0f 8c 11 01 00 00    	jl     0x140ad7c5b
   140ad7b4a:	41 3b 90 94 02 00 00 	cmp    edx,DWORD PTR [r8+0x294]
   140ad7b51:	0f 8f 04 01 00 00    	jg     0x140ad7c5b
   140ad7b57:	83 3d 0a fb 8e 01 00 	cmp    DWORD PTR [rip+0x18efb0a],0x0        # 0x1423c7668
   140ad7b5e:	7e 25                	jle    0x140ad7b85
   140ad7b60:	48 8b 05 f9 fa 8e 01 	mov    rax,QWORD PTR [rip+0x18efaf9]        # 0x1423c7660
   140ad7b67:	f6 00 01             	test   BYTE PTR [rax],0x1
   140ad7b6a:	74 19                	je     0x140ad7b85
   140ad7b6c:	41 0f af 88 14 07 00 	imul   ecx,DWORD PTR [r8+0x714]
   140ad7b73:	00 
   140ad7b74:	49 8b 80 f8 01 00 00 	mov    rax,QWORD PTR [r8+0x1f8]
   140ad7b7b:	03 ca                	add    ecx,edx
   140ad7b7d:	48 63 c9             	movsxd rcx,ecx
   140ad7b80:	44 89 14 88          	mov    DWORD PTR [rax+rcx*4],r10d
   140ad7b84:	c3                   	ret
   140ad7b85:	41 0f af 88 14 07 00 	imul   ecx,DWORD PTR [r8+0x714]
   140ad7b8c:	00 
   140ad7b8d:	8d 04 d5 00 00 00 00 	lea    eax,[rdx*8+0x0]
   140ad7b94:	c1 e1 03             	shl    ecx,0x3
   140ad7b97:	4c 63 c9             	movsxd r9,ecx
   140ad7b9a:	48 63 c8             	movsxd rcx,eax
   140ad7b9d:	4c 03 c9             	add    r9,rcx
   140ad7ba0:	4d 03 88 e0 01 00 00 	add    r9,QWORD PTR [r8+0x1e0]
   140ad7ba7:	4d 3b 88 e8 01 00 00 	cmp    r9,QWORD PTR [r8+0x1e8]
   140ad7bae:	0f 83 a7 00 00 00    	jae    0x140ad7c5b
   140ad7bb4:	45 88 11             	mov    BYTE PTR [r9],r10b
   140ad7bb7:	41 8b c2             	mov    eax,r10d
   140ad7bba:	c1 f8 08             	sar    eax,0x8
   140ad7bbd:	41 8b ca             	mov    ecx,r10d
   140ad7bc0:	83 e0 07             	and    eax,0x7
   140ad7bc3:	c1 f9 0e             	sar    ecx,0xe
   140ad7bc6:	83 e1 01             	and    ecx,0x1
   140ad7bc9:	41 c1 fa 0b          	sar    r10d,0xb
   140ad7bcd:	41 83 e2 07          	and    r10d,0x7
   140ad7bd1:	8d 04 c8             	lea    eax,[rax+rcx*8]
   140ad7bd4:	8b c8                	mov    ecx,eax
   140ad7bd6:	49 8d 14 40          	lea    rdx,[r8+rax*2]
   140ad7bda:	48 03 d1             	add    rdx,rcx
   140ad7bdd:	0f b6 82 58 01 00 00 	movzx  eax,BYTE PTR [rdx+0x158]
   140ad7be4:	41 88 41 01          	mov    BYTE PTR [r9+0x1],al
   140ad7be8:	49 8d 04 48          	lea    rax,[r8+rcx*2]
   140ad7bec:	0f b6 8c 01 59 01 00 	movzx  ecx,BYTE PTR [rcx+rax*1+0x159]
   140ad7bf3:	00 
   140ad7bf4:	41 88 49 02          	mov    BYTE PTR [r9+0x2],cl
   140ad7bf8:	0f b6 82 5a 01 00 00 	movzx  eax,BYTE PTR [rdx+0x15a]
   140ad7bff:	4b 8d 14 50          	lea    rdx,[r8+r10*2]
   140ad7c03:	41 88 41 03          	mov    BYTE PTR [r9+0x3],al
   140ad7c07:	41 8b ca             	mov    ecx,r10d
   140ad7c0a:	48 03 d1             	add    rdx,rcx
   140ad7c0d:	0f b6 82 58 01 00 00 	movzx  eax,BYTE PTR [rdx+0x158]
   140ad7c14:	41 88 41 04          	mov    BYTE PTR [r9+0x4],al
   140ad7c18:	4b 8d 04 50          	lea    rax,[r8+r10*2]
   140ad7c1c:	41 0f b6 8c 02 59 01 	movzx  ecx,BYTE PTR [r10+rax*1+0x159]
   140ad7c23:	00 00 
   140ad7c25:	41 88 49 05          	mov    BYTE PTR [r9+0x5],cl
   140ad7c29:	0f b6 82 5a 01 00 00 	movzx  eax,BYTE PTR [rdx+0x15a]
   140ad7c30:	41 88 41 06          	mov    BYTE PTR [r9+0x6],al
   140ad7c34:	41 8b 80 14 07 00 00 	mov    eax,DWORD PTR [r8+0x714]
   140ad7c3b:	41 0f af 80 84 00 00 	imul   eax,DWORD PTR [r8+0x84]
   140ad7c42:	00 
   140ad7c43:	41 03 80 88 00 00 00 	add    eax,DWORD PTR [r8+0x88]
   140ad7c4a:	48 63 c8             	movsxd rcx,eax
   140ad7c4d:	49 8b 80 f0 01 00 00 	mov    rax,QWORD PTR [r8+0x1f0]
   140ad7c54:	c7 04 88 00 00 00 00 	mov    DWORD PTR [rax+rcx*4],0x0
   140ad7c5b:	c3                   	ret
