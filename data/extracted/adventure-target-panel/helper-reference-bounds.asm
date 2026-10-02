
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140872d70 <.text+0x871d70>:
   140872d70:	42 8d 04 02          	lea    eax,[rdx+r8*1]
   140872d74:	4c 8b d1             	mov    r10,rcx
   140872d77:	99                   	cdq
   140872d78:	2b c2                	sub    eax,edx
   140872d7a:	d1 f8                	sar    eax,1
   140872d7c:	8d 50 ce             	lea    edx,[rax-0x32]
   140872d7f:	41 89 11             	mov    DWORD PTR [r9],edx
   140872d82:	8d 50 32             	lea    edx,[rax+0x32]
   140872d85:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140872d8a:	4c 8b 4c 24 30       	mov    r9,QWORD PTR [rsp+0x30]
   140872d8f:	89 10                	mov    DWORD PTR [rax],edx
   140872d91:	ba 27 00 00 00       	mov    edx,0x27
   140872d96:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
   140872d9b:	41 c7 01 06 00 00 00 	mov    DWORD PTR [r9],0x6
   140872da2:	44 8b 05 df a9 b5 01 	mov    r8d,DWORD PTR [rip+0x1b5a9df]        # 0x1423cd788
   140872da9:	41 83 c0 fb          	add    r8d,0xfffffffb
   140872dad:	44 89 00             	mov    DWORD PTR [rax],r8d
   140872db0:	48 63 41 04          	movsxd rax,DWORD PTR [rcx+0x4]
   140872db4:	83 f8 09             	cmp    eax,0x9
   140872db7:	0f 87 07 01 00 00    	ja     0x140872ec4
   140872dbd:	4c 8d 1d 3c d2 78 ff 	lea    r11,[rip+0xffffffffff78d23c]        # 0x140000000
   140872dc4:	41 8b 8c 83 dc 2e 87 	mov    ecx,DWORD PTR [r11+rax*4+0x872edc]
   140872dcb:	00 
   140872dcc:	49 03 cb             	add    rcx,r11
   140872dcf:	ff e1                	jmp    rcx
   140872dd1:	49 8b 42 18          	mov    rax,QWORD PTR [r10+0x18]
   140872dd5:	49 2b 42 10          	sub    rax,QWORD PTR [r10+0x10]
   140872dd9:	48 c1 f8 03          	sar    rax,0x3
   140872ddd:	8d 04 c5 06 00 00 00 	lea    eax,[rax*8+0x6]
   140872de4:	3b c2                	cmp    eax,edx
   140872de6:	0f 8d d8 00 00 00    	jge    0x140872ec4
   140872dec:	8b d0                	mov    edx,eax
   140872dee:	e9 d1 00 00 00       	jmp    0x140872ec4
   140872df3:	ba 07 00 00 00       	mov    edx,0x7
   140872df8:	e9 c7 00 00 00       	jmp    0x140872ec4
   140872dfd:	49 8b 82 e0 00 00 00 	mov    rax,QWORD PTR [r10+0xe0]
   140872e04:	49 2b 82 d8 00 00 00 	sub    rax,QWORD PTR [r10+0xd8]
   140872e0b:	48 c1 f8 02          	sar    rax,0x2
   140872e0f:	83 c0 06             	add    eax,0x6
   140872e12:	8d 0c 40             	lea    ecx,[rax+rax*2]
   140872e15:	3b ca                	cmp    ecx,edx
   140872e17:	0f 8d a7 00 00 00    	jge    0x140872ec4
   140872e1d:	8b d1                	mov    edx,ecx
   140872e1f:	e9 a0 00 00 00       	jmp    0x140872ec4
   140872e24:	49 8b 42 48          	mov    rax,QWORD PTR [r10+0x48]
   140872e28:	49 2b 42 40          	sub    rax,QWORD PTR [r10+0x40]
   140872e2c:	48 c1 f8 03          	sar    rax,0x3
   140872e30:	eb dd                	jmp    0x140872e0f
   140872e32:	49 8b 42 78          	mov    rax,QWORD PTR [r10+0x78]
   140872e36:	49 2b 42 70          	sub    rax,QWORD PTR [r10+0x70]
   140872e3a:	48 c1 f8 03          	sar    rax,0x3
   140872e3e:	eb cf                	jmp    0x140872e0f
   140872e40:	49 8b 82 b0 00 00 00 	mov    rax,QWORD PTR [r10+0xb0]
   140872e47:	49 2b 82 a8 00 00 00 	sub    rax,QWORD PTR [r10+0xa8]
   140872e4e:	48 d1 f8             	sar    rax,1
   140872e51:	eb bc                	jmp    0x140872e0f
   140872e53:	8b 05 df dc dc 01    	mov    eax,DWORD PTR [rip+0x1dcdcdf]        # 0x142640b38
   140872e59:	83 c0 02             	add    eax,0x2
   140872e5c:	eb b4                	jmp    0x140872e12
   140872e5e:	49 8b 82 08 01 00 00 	mov    rax,QWORD PTR [r10+0x108]
   140872e65:	49 2b 82 00 01 00 00 	sub    rax,QWORD PTR [r10+0x100]
   140872e6c:	48 c1 f8 03          	sar    rax,0x3
   140872e70:	83 c0 08             	add    eax,0x8
   140872e73:	eb 9d                	jmp    0x140872e12
   140872e75:	49 8b 8a 48 01 00 00 	mov    rcx,QWORD PTR [r10+0x148]
   140872e7c:	49 2b 8a 40 01 00 00 	sub    rcx,QWORD PTR [r10+0x140]
   140872e83:	49 8b 82 30 01 00 00 	mov    rax,QWORD PTR [r10+0x130]
   140872e8a:	49 2b 82 28 01 00 00 	sub    rax,QWORD PTR [r10+0x128]
   140872e91:	48 c1 f8 03          	sar    rax,0x3
   140872e95:	48 c1 f9 03          	sar    rcx,0x3
   140872e99:	03 c8                	add    ecx,eax
   140872e9b:	b8 05 00 00 00       	mov    eax,0x5
   140872ea0:	3b c8                	cmp    ecx,eax
   140872ea2:	0f 4f c8             	cmovg  ecx,eax
   140872ea5:	49 8b 82 70 01 00 00 	mov    rax,QWORD PTR [r10+0x170]
   140872eac:	49 2b 82 68 01 00 00 	sub    rax,QWORD PTR [r10+0x168]
   140872eb3:	48 c1 f8 02          	sar    rax,0x2
   140872eb7:	03 c1                	add    eax,ecx
   140872eb9:	8d 04 40             	lea    eax,[rax+rax*2]
   140872ebc:	83 c0 07             	add    eax,0x7
   140872ebf:	3b c2                	cmp    eax,edx
   140872ec1:	0f 4c d0             	cmovl  edx,eax
   140872ec4:	41 8b c0             	mov    eax,r8d
   140872ec7:	41 2b 01             	sub    eax,DWORD PTR [r9]
   140872eca:	ff c0                	inc    eax
   140872ecc:	3b c2                	cmp    eax,edx
   140872ece:	7e 09                	jle    0x140872ed9
   140872ed0:	44 2b c2             	sub    r8d,edx
   140872ed3:	41 ff c0             	inc    r8d
   140872ed6:	45 89 01             	mov    DWORD PTR [r9],r8d
   140872ed9:	c3                   	ret
   140872eda:	66 90                	xchg   ax,ax
   140872edc:	d1 2d 87 00 f3 2d    	shr    DWORD PTR [rip+0x2df30087],1        # 0x16e7a2f69
   140872ee2:	87 00                	xchg   DWORD PTR [rax],eax
   140872ee4:	fd                   	std
   140872ee5:	2d 87 00 53 2e       	sub    eax,0x2e530087
   140872eea:	87 00                	xchg   DWORD PTR [rax],eax
   140872eec:	5e                   	pop    rsi
   140872eed:	2e 87 00             	cs xchg DWORD PTR [rax],eax
   140872ef0:	24 2e                	and    al,0x2e
   140872ef2:	87 00                	xchg   DWORD PTR [rax],eax
   140872ef4:	32 2e                	xor    ch,BYTE PTR [rsi]
   140872ef6:	87 00                	xchg   DWORD PTR [rax],eax
   140872ef8:	40                   	rex
   140872ef9:	2e 87 00             	cs xchg DWORD PTR [rax],eax
   140872efc:	75 2e                	jne    0x140872f2c
   140872efe:	87 00                	xchg   DWORD PTR [rax],eax
   140872f00:	75 2e                	jne    0x140872f30
   140872f02:	87 00                	xchg   DWORD PTR [rax],eax
   140872f04:	cc                   	int3
   140872f05:	cc                   	int3
   140872f06:	cc                   	int3
   140872f07:	cc                   	int3
   140872f08:	cc                   	int3
   140872f09:	cc                   	int3
   140872f0a:	cc                   	int3
   140872f0b:	cc                   	int3
   140872f0c:	cc                   	int3
   140872f0d:	cc                   	int3
   140872f0e:	cc                   	int3
   140872f0f:	cc                   	int3
