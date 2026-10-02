
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140adad70 <.text+0xad9d70>:
   140adad70:	40 56                	rex push rsi
   140adad72:	41 54                	push   r12
   140adad74:	41 55                	push   r13
   140adad76:	41 57                	push   r15
   140adad78:	44 8b 99 84 00 00 00 	mov    r11d,DWORD PTR [rcx+0x84]
   140adad7f:	45 8b f9             	mov    r15d,r9d
   140adad82:	8b 44 24 48          	mov    eax,DWORD PTR [rsp+0x48]
   140adad86:	45 33 c9             	xor    r9d,r9d
   140adad89:	41 03 c3             	add    eax,r11d
   140adad8c:	45 8b e0             	mov    r12d,r8d
   140adad8f:	44 8b ea             	mov    r13d,edx
   140adad92:	41 8b f1             	mov    esi,r9d
   140adad95:	44 3b d8             	cmp    r11d,eax
   140adad98:	0f 8d ec 02 00 00    	jge    0x140adb08a
   140adad9e:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
   140adada3:	48 89 6c 24 30       	mov    QWORD PTR [rsp+0x30],rbp
   140adada8:	0f b6 6c 24 58       	movzx  ebp,BYTE PTR [rsp+0x58]
   140adadad:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   140adadb2:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   140adadb7:	44 8b 74 24 50       	mov    r14d,DWORD PTR [rsp+0x50]
   140adadbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140adadc0:	44 8b 91 88 00 00 00 	mov    r10d,DWORD PTR [rcx+0x88]
   140adadc7:	41 8b f9             	mov    edi,r9d
   140adadca:	43 8d 04 32          	lea    eax,[r10+r14*1]
   140adadce:	44 3b d0             	cmp    r10d,eax
   140adadd1:	0f 8d 87 02 00 00    	jge    0x140adb05e
   140adadd7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140adadde:	00 00 
   140adade0:	44 3b 99 88 02 00 00 	cmp    r11d,DWORD PTR [rcx+0x288]
   140adade7:	0f 8c 5a 02 00 00    	jl     0x140adb047
   140adaded:	44 3b 99 8c 02 00 00 	cmp    r11d,DWORD PTR [rcx+0x28c]
   140adadf4:	0f 8f 4d 02 00 00    	jg     0x140adb047
   140adadfa:	44 3b 91 90 02 00 00 	cmp    r10d,DWORD PTR [rcx+0x290]
   140adae01:	0f 8c 40 02 00 00    	jl     0x140adb047
   140adae07:	44 3b 91 94 02 00 00 	cmp    r10d,DWORD PTR [rcx+0x294]
   140adae0e:	0f 8f 33 02 00 00    	jg     0x140adb047
   140adae14:	41 8b c3             	mov    eax,r11d
   140adae17:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140adae1e:	41 03 c2             	add    eax,r10d
   140adae21:	48 63 d0             	movsxd rdx,eax
   140adae24:	48 8b 81 00 02 00 00 	mov    rax,QWORD PTR [rcx+0x200]
   140adae2b:	44 89 2c 90          	mov    DWORD PTR [rax+rdx*4],r13d
   140adae2f:	41 8b c3             	mov    eax,r11d
   140adae32:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140adae39:	41 03 c2             	add    eax,r10d
   140adae3c:	48 63 d0             	movsxd rdx,eax
   140adae3f:	48 8b 81 08 02 00 00 	mov    rax,QWORD PTR [rcx+0x208]
   140adae46:	44 89 24 90          	mov    DWORD PTR [rax+rdx*4],r12d
   140adae4a:	41 8b c3             	mov    eax,r11d
   140adae4d:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140adae54:	41 03 c2             	add    eax,r10d
   140adae57:	48 63 d0             	movsxd rdx,eax
   140adae5a:	48 8b 81 10 02 00 00 	mov    rax,QWORD PTR [rcx+0x210]
   140adae61:	44 89 3c 90          	mov    DWORD PTR [rax+rdx*4],r15d
   140adae65:	44 3b 99 84 00 00 00 	cmp    r11d,DWORD PTR [rcx+0x84]
   140adae6c:	75 26                	jne    0x140adae94
   140adae6e:	44 3b 91 88 00 00 00 	cmp    r10d,DWORD PTR [rcx+0x88]
   140adae75:	75 1d                	jne    0x140adae94
   140adae77:	41 8b c3             	mov    eax,r11d
   140adae7a:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140adae81:	41 03 c2             	add    eax,r10d
   140adae84:	48 63 d0             	movsxd rdx,eax
   140adae87:	48 8b 81 18 02 00 00 	mov    rax,QWORD PTR [rcx+0x218]
   140adae8e:	83 24 90 fb          	and    DWORD PTR [rax+rdx*4],0xfffffffb
   140adae92:	eb 3b                	jmp    0x140adaecf
   140adae94:	41 8b c3             	mov    eax,r11d
   140adae97:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140adae9e:	41 03 c2             	add    eax,r10d
   140adaea1:	48 63 d0             	movsxd rdx,eax
   140adaea4:	83 ff 3f             	cmp    edi,0x3f
   140adaea7:	48 8b 81 18 02 00 00 	mov    rax,QWORD PTR [rcx+0x218]
   140adaeae:	4c 8d 04 90          	lea    r8,[rax+rdx*4]
   140adaeb2:	8b d7                	mov    edx,edi
   140adaeb4:	41 0f 47 d1          	cmova  edx,r9d
   140adaeb8:	8b c6                	mov    eax,esi
   140adaeba:	c1 e2 06             	shl    edx,0x6
   140adaebd:	83 fe 3f             	cmp    esi,0x3f
   140adaec0:	41 0f 47 c1          	cmova  eax,r9d
   140adaec4:	0b d0                	or     edx,eax
   140adaec6:	c1 e2 06             	shl    edx,0x6
   140adaec9:	83 ca 04             	or     edx,0x4
   140adaecc:	41 89 10             	mov    DWORD PTR [r8],edx
   140adaecf:	8b 81 14 07 00 00    	mov    eax,DWORD PTR [rcx+0x714]
   140adaed5:	41 0f af c3          	imul   eax,r11d
   140adaed9:	41 03 c2             	add    eax,r10d
   140adaedc:	40 84 ed             	test   bpl,bpl
   140adaedf:	0f 84 54 01 00 00    	je     0x140adb039
   140adaee5:	c1 e0 03             	shl    eax,0x3
   140adaee8:	80 b9 8f 00 00 00 00 	cmp    BYTE PTR [rcx+0x8f],0x0
   140adaeef:	48 63 d8             	movsxd rbx,eax
   140adaef2:	0f 84 b8 00 00 00    	je     0x140adafb0
   140adaef8:	0f b6 81 8e 00 00 00 	movzx  eax,BYTE PTR [rcx+0x8e]
   140adaeff:	f6 d8                	neg    al
   140adaf01:	0f be 81 8c 00 00 00 	movsx  eax,BYTE PTR [rcx+0x8c]
   140adaf08:	1b d2                	sbb    edx,edx
   140adaf0a:	83 e2 08             	and    edx,0x8
   140adaf0d:	03 d0                	add    edx,eax
   140adaf0f:	4c 63 c2             	movsxd r8,edx
   140adaf12:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adaf19:	4e 8d 0c 41          	lea    r9,[rcx+r8*2]
   140adaf1d:	43 0f b6 84 01 58 01 	movzx  eax,BYTE PTR [r9+r8*1+0x158]
   140adaf24:	00 00 
   140adaf26:	88 44 1a 01          	mov    BYTE PTR [rdx+rbx*1+0x1],al
   140adaf2a:	4a 8d 04 41          	lea    rax,[rcx+r8*2]
   140adaf2e:	41 0f b6 84 00 59 01 	movzx  eax,BYTE PTR [r8+rax*1+0x159]
   140adaf35:	00 00 
   140adaf37:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adaf3e:	88 44 1a 02          	mov    BYTE PTR [rdx+rbx*1+0x2],al
   140adaf42:	43 0f b6 84 01 5a 01 	movzx  eax,BYTE PTR [r9+r8*1+0x15a]
   140adaf49:	00 00 
   140adaf4b:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adaf52:	88 44 1a 03          	mov    BYTE PTR [rdx+rbx*1+0x3],al
   140adaf56:	4c 0f be 81 8d 00 00 	movsx  r8,BYTE PTR [rcx+0x8d]
   140adaf5d:	00 
   140adaf5e:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adaf65:	4a 8d 04 41          	lea    rax,[rcx+r8*2]
   140adaf69:	41 0f b6 84 00 58 01 	movzx  eax,BYTE PTR [r8+rax*1+0x158]
   140adaf70:	00 00 
   140adaf72:	88 44 13 04          	mov    BYTE PTR [rbx+rdx*1+0x4],al
   140adaf76:	4c 0f be 81 8d 00 00 	movsx  r8,BYTE PTR [rcx+0x8d]
   140adaf7d:	00 
   140adaf7e:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adaf85:	49 83 c0 73          	add    r8,0x73
   140adaf89:	45 33 c9             	xor    r9d,r9d
   140adaf8c:	4a 8d 04 41          	lea    rax,[rcx+r8*2]
   140adaf90:	41 0f b6 04 00       	movzx  eax,BYTE PTR [r8+rax*1]
   140adaf95:	88 44 13 05          	mov    BYTE PTR [rbx+rdx*1+0x5],al
   140adaf99:	4c 0f be 81 8d 00 00 	movsx  r8,BYTE PTR [rcx+0x8d]
   140adafa0:	00 
   140adafa1:	4a 8d 04 41          	lea    rax,[rcx+r8*2]
   140adafa5:	41 0f b6 84 00 5a 01 	movzx  eax,BYTE PTR [r8+rax*1+0x15a]
   140adafac:	00 00 
   140adafae:	eb 61                	jmp    0x140adb011
   140adafb0:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adafb7:	0f b6 81 90 00 00 00 	movzx  eax,BYTE PTR [rcx+0x90]
   140adafbe:	88 44 1a 01          	mov    BYTE PTR [rdx+rbx*1+0x1],al
   140adafc2:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adafc9:	0f b6 81 91 00 00 00 	movzx  eax,BYTE PTR [rcx+0x91]
   140adafd0:	88 44 1a 02          	mov    BYTE PTR [rdx+rbx*1+0x2],al
   140adafd4:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adafdb:	0f b6 81 92 00 00 00 	movzx  eax,BYTE PTR [rcx+0x92]
   140adafe2:	88 44 1a 03          	mov    BYTE PTR [rdx+rbx*1+0x3],al
   140adafe6:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adafed:	0f b6 81 93 00 00 00 	movzx  eax,BYTE PTR [rcx+0x93]
   140adaff4:	88 44 13 04          	mov    BYTE PTR [rbx+rdx*1+0x4],al
   140adaff8:	0f b6 81 94 00 00 00 	movzx  eax,BYTE PTR [rcx+0x94]
   140adafff:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adb006:	88 44 13 05          	mov    BYTE PTR [rbx+rdx*1+0x5],al
   140adb00a:	0f b6 81 95 00 00 00 	movzx  eax,BYTE PTR [rcx+0x95]
   140adb011:	48 8b 91 e0 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1e0]
   140adb018:	88 44 13 06          	mov    BYTE PTR [rbx+rdx*1+0x6],al
   140adb01c:	41 8b c3             	mov    eax,r11d
   140adb01f:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   140adb026:	41 03 c2             	add    eax,r10d
   140adb029:	48 63 d0             	movsxd rdx,eax
   140adb02c:	48 8b 81 18 02 00 00 	mov    rax,QWORD PTR [rcx+0x218]
   140adb033:	83 0c 90 20          	or     DWORD PTR [rax+rdx*4],0x20
   140adb037:	eb 0e                	jmp    0x140adb047
   140adb039:	48 63 d0             	movsxd rdx,eax
   140adb03c:	48 8b 81 18 02 00 00 	mov    rax,QWORD PTR [rcx+0x218]
   140adb043:	83 24 90 df          	and    DWORD PTR [rax+rdx*4],0xffffffdf
   140adb047:	8b 91 88 00 00 00    	mov    edx,DWORD PTR [rcx+0x88]
   140adb04d:	41 ff c2             	inc    r10d
   140adb050:	41 03 d6             	add    edx,r14d
   140adb053:	ff c7                	inc    edi
   140adb055:	44 3b d2             	cmp    r10d,edx
   140adb058:	0f 8c 82 fd ff ff    	jl     0x140adade0
   140adb05e:	8b 54 24 48          	mov    edx,DWORD PTR [rsp+0x48]
   140adb062:	41 ff c3             	inc    r11d
   140adb065:	03 91 84 00 00 00    	add    edx,DWORD PTR [rcx+0x84]
   140adb06b:	ff c6                	inc    esi
   140adb06d:	44 3b da             	cmp    r11d,edx
   140adb070:	0f 8c 4a fd ff ff    	jl     0x140adadc0
   140adb076:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
   140adb07b:	48 8b 7c 24 38       	mov    rdi,QWORD PTR [rsp+0x38]
   140adb080:	48 8b 6c 24 30       	mov    rbp,QWORD PTR [rsp+0x30]
   140adb085:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
   140adb08a:	41 5f                	pop    r15
   140adb08c:	41 5d                	pop    r13
   140adb08e:	41 5c                	pop    r12
   140adb090:	5e                   	pop    rsi
   140adb091:	c3                   	ret
