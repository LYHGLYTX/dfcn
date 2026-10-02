
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140ad7db0 <.text+0xad6db0>:
   140ad7db0:	40 56                	rex push rsi
   140ad7db2:	41 54                	push   r12
   140ad7db4:	41 55                	push   r13
   140ad7db6:	41 57                	push   r15
   140ad7db8:	44 8b 99 84 00 00 00 	mov    r11d,DWORD PTR [rcx+0x84]
   140ad7dbf:	45 8b f9             	mov    r15d,r9d
   140ad7dc2:	8b 44 24 48          	mov    eax,DWORD PTR [rsp+0x48]
   140ad7dc6:	45 33 c9             	xor    r9d,r9d
   140ad7dc9:	41 03 c3             	add    eax,r11d
   140ad7dcc:	45 8b e0             	mov    r12d,r8d
   140ad7dcf:	44 8b ea             	mov    r13d,edx
   140ad7dd2:	41 8b f1             	mov    esi,r9d
   140ad7dd5:	44 3b d8             	cmp    r11d,eax
   140ad7dd8:	0f 8d ec 02 00 00    	jge    0x140ad80ca
   140ad7dde:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
   140ad7de3:	48 89 6c 24 30       	mov    QWORD PTR [rsp+0x30],rbp
   140ad7de8:	0f b6 6c 24 58       	movzx  ebp,BYTE PTR [rsp+0x58]
   140ad7ded:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   140ad7df2:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   140ad7df7:	44 8b 74 24 50       	mov    r14d,DWORD PTR [rsp+0x50]
   140ad7dfc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140ad7e00:	44 8b 91 88 00 00 00 	mov    r10d,DWORD PTR [rcx+0x88]
   140ad7e07:	41 8b f9             	mov    edi,r9d
   140ad7e0a:	43 8d 04 32          	lea    eax,[r10+r14*1]
   140ad7e0e:	44 3b d0             	cmp    r10d,eax
   140ad7e11:	0f 8d 87 02 00 00    	jge    0x140ad809e
   140ad7e17:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140ad7e1e:	00 00 
   140ad7e20:	44 3b 99 88 02 00 00 	cmp    r11d,DWORD PTR [rcx+0x288]
   140ad7e27:	0f 8c 5a 02 00 00    	jl     0x140ad8087
   140ad7e2d:	44 3b 99 8c 02 00 00 	cmp    r11d,DWORD PTR [rcx+0x28c]
   140ad7e34:	0f 8f 4d 02 00 00    	jg     0x140ad8087
   140ad7e3a:	44 3b 91 90 02 00 00 	cmp    r10d,DWORD PTR [rcx+0x290]
   140ad7e41:	0f 8c 40 02 00 00    	jl     0x140ad8087
   140ad7e47:	44 3b 91 94 02 00 00 	cmp    r10d,DWORD PTR [rcx+0x294]
   140ad7e4e:	0f 8f 33 02 00 00    	jg     0x140ad8087
   140ad7e54:	41 8b c3             	mov    eax,r11d
   140ad7e57:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140ad7e5e:	41 03 c2             	add    eax,r10d
   140ad7e61:	48 63 d0             	movsxd rdx,eax
   140ad7e64:	48 8b 81 00 02 00 00 	mov    rax,QWORD PTR [rcx+0x200]
   140ad7e6b:	44 89 2c 90          	mov    DWORD PTR [rax+rdx*4],r13d
   140ad7e6f:	41 8b c3             	mov    eax,r11d
   140ad7e72:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140ad7e79:	41 03 c2             	add    eax,r10d
   140ad7e7c:	48 63 d0             	movsxd rdx,eax
   140ad7e7f:	48 8b 81 08 02 00 00 	mov    rax,QWORD PTR [rcx+0x208]
   140ad7e86:	44 89 24 90          	mov    DWORD PTR [rax+rdx*4],r12d
   140ad7e8a:	41 8b c3             	mov    eax,r11d
   140ad7e8d:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140ad7e94:	41 03 c2             	add    eax,r10d
   140ad7e97:	48 63 d0             	movsxd rdx,eax
   140ad7e9a:	48 8b 81 10 02 00 00 	mov    rax,QWORD PTR [rcx+0x210]
   140ad7ea1:	44 89 3c 90          	mov    DWORD PTR [rax+rdx*4],r15d
   140ad7ea5:	44 3b 99 84 00 00 00 	cmp    r11d,DWORD PTR [rcx+0x84]
   140ad7eac:	75 26                	jne    0x140ad7ed4
   140ad7eae:	44 3b 91 88 00 00 00 	cmp    r10d,DWORD PTR [rcx+0x88]
   140ad7eb5:	75 1d                	jne    0x140ad7ed4
   140ad7eb7:	41 8b c3             	mov    eax,r11d
   140ad7eba:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140ad7ec1:	41 03 c2             	add    eax,r10d
   140ad7ec4:	48 63 d0             	movsxd rdx,eax
   140ad7ec7:	48 8b 81 18 02 00 00 	mov    rax,QWORD PTR [rcx+0x218]
   140ad7ece:	83 24 90 fb          	and    DWORD PTR [rax+rdx*4],0xfffffffb
   140ad7ed2:	eb 3b                	jmp    0x140ad7f0f
   140ad7ed4:	41 8b c3             	mov    eax,r11d
   140ad7ed7:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140ad7ede:	41 03 c2             	add    eax,r10d
   140ad7ee1:	48 63 d0             	movsxd rdx,eax
   140ad7ee4:	83 ff 3f             	cmp    edi,0x3f
   140ad7ee7:	48 8b 81 18 02 00 00 	mov    rax,QWORD PTR [rcx+0x218]
   140ad7eee:	4c 8d 04 90          	lea    r8,[rax+rdx*4]
   140ad7ef2:	8b d7                	mov    edx,edi
   140ad7ef4:	41 0f 47 d1          	cmova  edx,r9d
   140ad7ef8:	8b c6                	mov    eax,esi
   140ad7efa:	c1 e2 06             	shl    edx,0x6
   140ad7efd:	83 fe 3f             	cmp    esi,0x3f
   140ad7f00:	41 0f 47 c1          	cmova  eax,r9d
   140ad7f04:	0b d0                	or     edx,eax
   140ad7f06:	c1 e2 06             	shl    edx,0x6
   140ad7f09:	83 ca 04             	or     edx,0x4
   140ad7f0c:	41 89 10             	mov    DWORD PTR [r8],edx
   140ad7f0f:	8b 81 14 07 00 00    	mov    eax,DWORD PTR [rcx+0x714]
   140ad7f15:	41 0f af c3          	imul   eax,r11d
   140ad7f19:	41 03 c2             	add    eax,r10d
   140ad7f1c:	40 84 ed             	test   bpl,bpl
   140ad7f1f:	0f 84 54 01 00 00    	je     0x140ad8079
   140ad7f25:	c1 e0 03             	shl    eax,0x3
   140ad7f28:	80 b9 8f 00 00 00 00 	cmp    BYTE PTR [rcx+0x8f],0x0
   140ad7f2f:	48 63 d8             	movsxd rbx,eax
   140ad7f32:	0f 84 b8 00 00 00    	je     0x140ad7ff0
   140ad7f38:	0f b6 81 8e 00 00 00 	movzx  eax,BYTE PTR [rcx+0x8e]
   140ad7f3f:	f6 d8                	neg    al
   140ad7f41:	0f be 81 8c 00 00 00 	movsx  eax,BYTE PTR [rcx+0x8c]
   140ad7f48:	1b d2                	sbb    edx,edx
   140ad7f4a:	83 e2 08             	and    edx,0x8
   140ad7f4d:	03 d0                	add    edx,eax
   140ad7f4f:	4c 63 c2             	movsxd r8,edx
   140ad7f52:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad7f59:	4e 8d 0c 41          	lea    r9,[rcx+r8*2]
   140ad7f5d:	43 0f b6 84 01 58 01 	movzx  eax,BYTE PTR [r9+r8*1+0x158]
   140ad7f64:	00 00 
   140ad7f66:	88 44 1a 01          	mov    BYTE PTR [rdx+rbx*1+0x1],al
   140ad7f6a:	4a 8d 04 41          	lea    rax,[rcx+r8*2]
   140ad7f6e:	41 0f b6 84 00 59 01 	movzx  eax,BYTE PTR [r8+rax*1+0x159]
   140ad7f75:	00 00 
   140ad7f77:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad7f7e:	88 44 1a 02          	mov    BYTE PTR [rdx+rbx*1+0x2],al
   140ad7f82:	43 0f b6 84 01 5a 01 	movzx  eax,BYTE PTR [r9+r8*1+0x15a]
   140ad7f89:	00 00 
   140ad7f8b:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad7f92:	88 44 1a 03          	mov    BYTE PTR [rdx+rbx*1+0x3],al
   140ad7f96:	4c 0f be 81 8d 00 00 	movsx  r8,BYTE PTR [rcx+0x8d]
   140ad7f9d:	00 
   140ad7f9e:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad7fa5:	4a 8d 04 41          	lea    rax,[rcx+r8*2]
   140ad7fa9:	41 0f b6 84 00 58 01 	movzx  eax,BYTE PTR [r8+rax*1+0x158]
   140ad7fb0:	00 00 
   140ad7fb2:	88 44 13 04          	mov    BYTE PTR [rbx+rdx*1+0x4],al
   140ad7fb6:	4c 0f be 81 8d 00 00 	movsx  r8,BYTE PTR [rcx+0x8d]
   140ad7fbd:	00 
   140ad7fbe:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad7fc5:	49 83 c0 73          	add    r8,0x73
   140ad7fc9:	45 33 c9             	xor    r9d,r9d
   140ad7fcc:	4a 8d 04 41          	lea    rax,[rcx+r8*2]
   140ad7fd0:	41 0f b6 04 00       	movzx  eax,BYTE PTR [r8+rax*1]
   140ad7fd5:	88 44 13 05          	mov    BYTE PTR [rbx+rdx*1+0x5],al
   140ad7fd9:	4c 0f be 81 8d 00 00 	movsx  r8,BYTE PTR [rcx+0x8d]
   140ad7fe0:	00 
   140ad7fe1:	4a 8d 04 41          	lea    rax,[rcx+r8*2]
   140ad7fe5:	41 0f b6 84 00 5a 01 	movzx  eax,BYTE PTR [r8+rax*1+0x15a]
   140ad7fec:	00 00 
   140ad7fee:	eb 61                	jmp    0x140ad8051
   140ad7ff0:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad7ff7:	0f b6 81 90 00 00 00 	movzx  eax,BYTE PTR [rcx+0x90]
   140ad7ffe:	88 44 1a 01          	mov    BYTE PTR [rdx+rbx*1+0x1],al
   140ad8002:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad8009:	0f b6 81 91 00 00 00 	movzx  eax,BYTE PTR [rcx+0x91]
   140ad8010:	88 44 1a 02          	mov    BYTE PTR [rdx+rbx*1+0x2],al
   140ad8014:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad801b:	0f b6 81 92 00 00 00 	movzx  eax,BYTE PTR [rcx+0x92]
   140ad8022:	88 44 1a 03          	mov    BYTE PTR [rdx+rbx*1+0x3],al
   140ad8026:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad802d:	0f b6 81 93 00 00 00 	movzx  eax,BYTE PTR [rcx+0x93]
   140ad8034:	88 44 13 04          	mov    BYTE PTR [rbx+rdx*1+0x4],al
   140ad8038:	0f b6 81 94 00 00 00 	movzx  eax,BYTE PTR [rcx+0x94]
   140ad803f:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad8046:	88 44 13 05          	mov    BYTE PTR [rbx+rdx*1+0x5],al
   140ad804a:	0f b6 81 95 00 00 00 	movzx  eax,BYTE PTR [rcx+0x95]
   140ad8051:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140ad8058:	88 44 13 06          	mov    BYTE PTR [rbx+rdx*1+0x6],al
   140ad805c:	41 8b c3             	mov    eax,r11d
   140ad805f:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140ad8066:	41 03 c2             	add    eax,r10d
   140ad8069:	48 63 d0             	movsxd rdx,eax
   140ad806c:	48 8b 81 18 02 00 00 	mov    rax,QWORD PTR [rcx+0x218]
   140ad8073:	83 0c 90 20          	or     DWORD PTR [rax+rdx*4],0x20
   140ad8077:	eb 0e                	jmp    0x140ad8087
   140ad8079:	48 63 d0             	movsxd rdx,eax
   140ad807c:	48 8b 81 18 02 00 00 	mov    rax,QWORD PTR [rcx+0x218]
   140ad8083:	83 24 90 df          	and    DWORD PTR [rax+rdx*4],0xffffffdf
   140ad8087:	8b 91 88 00 00 00    	mov    edx,DWORD PTR [rcx+0x88]
   140ad808d:	41 ff c2             	inc    r10d
   140ad8090:	41 03 d6             	add    edx,r14d
   140ad8093:	ff c7                	inc    edi
   140ad8095:	44 3b d2             	cmp    r10d,edx
   140ad8098:	0f 8c 82 fd ff ff    	jl     0x140ad7e20
   140ad809e:	8b 54 24 48          	mov    edx,DWORD PTR [rsp+0x48]
   140ad80a2:	41 ff c3             	inc    r11d
   140ad80a5:	03 91 84 00 00 00    	add    edx,DWORD PTR [rcx+0x84]
   140ad80ab:	ff c6                	inc    esi
   140ad80ad:	44 3b da             	cmp    r11d,edx
   140ad80b0:	0f 8c 4a fd ff ff    	jl     0x140ad7e00
   140ad80b6:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
   140ad80bb:	48 8b 7c 24 38       	mov    rdi,QWORD PTR [rsp+0x38]
   140ad80c0:	48 8b 6c 24 30       	mov    rbp,QWORD PTR [rsp+0x30]
   140ad80c5:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
   140ad80ca:	41 5f                	pop    r15
   140ad80cc:	41 5d                	pop    r13
   140ad80ce:	41 5c                	pop    r12
   140ad80d0:	5e                   	pop    rsi
   140ad80d1:	c3                   	ret
