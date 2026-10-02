
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140adaad0 <.text+0xad9ad0>:
   140adaad0:	4c 8b c1             	mov    r8,rcx
   140adaad3:	44 8b d2             	mov    r10d,edx
   140adaad6:	8b 89 84 00 00 00    	mov    ecx,DWORD PTR [rcx+0x84]
   140adaadc:	41 3b 88 88 02 00 00 	cmp    ecx,DWORD PTR [r8+0x288]
   140adaae3:	0f 8c 32 01 00 00    	jl     0x140adac1b
   140adaae9:	41 3b 88 8c 02 00 00 	cmp    ecx,DWORD PTR [r8+0x28c]
   140adaaf0:	0f 8f 25 01 00 00    	jg     0x140adac1b
   140adaaf6:	41 8b 90 88 00 00 00 	mov    edx,DWORD PTR [r8+0x88]
   140adaafd:	41 3b 90 90 02 00 00 	cmp    edx,DWORD PTR [r8+0x290]
   140adab04:	0f 8c 11 01 00 00    	jl     0x140adac1b
   140adab0a:	41 3b 90 94 02 00 00 	cmp    edx,DWORD PTR [r8+0x294]
   140adab11:	0f 8f 04 01 00 00    	jg     0x140adac1b
   140adab17:	83 3d 5a 2c 8f 01 00 	cmp    DWORD PTR [rip+0x18f2c5a],0x0        # 0x1423cd778
   140adab1e:	7e 25                	jle    0x140adab45
   140adab20:	48 8b 05 49 2c 8f 01 	mov    rax,QWORD PTR [rip+0x18f2c49]        # 0x1423cd770
   140adab27:	f6 00 01             	test   BYTE PTR [rax],0x1
   140adab2a:	74 19                	je     0x140adab45
   140adab2c:	41 0f af 88 14 07 00 	imul   ecx,DWORD PTR [r8+0x714]
   140adab33:	00 
   140adab34:	49 8b 80 f8 01 00 00 	mov    rax,QWORD PTR [r8+0x1f8]
   140adab3b:	03 ca                	add    ecx,edx
   140adab3d:	48 63 c9             	movsxd rcx,ecx
   140adab40:	44 89 14 88          	mov    DWORD PTR [rax+rcx*4],r10d
   140adab44:	c3                   	ret
   140adab45:	41 0f af 88 14 07 00 	imul   ecx,DWORD PTR [r8+0x714]
   140adab4c:	00 
   140adab4d:	8d 04 d5 00 00 00 00 	lea    eax,[rdx*8+0x0]
   140adab54:	c1 e1 03             	shl    ecx,0x3
   140adab57:	4c 63 c9             	movsxd r9,ecx
   140adab5a:	48 63 c8             	movsxd rcx,eax
   140adab5d:	4c 03 c9             	add    r9,rcx
   140adab60:	4d 03 88 e0 01 00 00 	add    r9,QWORD PTR [r8+0x1e0]
   140adab67:	4d 3b 88 e8 01 00 00 	cmp    r9,QWORD PTR [r8+0x1e8]
   140adab6e:	0f 83 a7 00 00 00    	jae    0x140adac1b
   140adab74:	45 88 11             	mov    BYTE PTR [r9],r10b
   140adab77:	41 8b c2             	mov    eax,r10d
   140adab7a:	c1 f8 08             	sar    eax,0x8
   140adab7d:	41 8b ca             	mov    ecx,r10d
   140adab80:	83 e0 07             	and    eax,0x7
   140adab83:	c1 f9 0e             	sar    ecx,0xe
   140adab86:	83 e1 01             	and    ecx,0x1
   140adab89:	41 c1 fa 0b          	sar    r10d,0xb
   140adab8d:	41 83 e2 07          	and    r10d,0x7
   140adab91:	8d 04 c8             	lea    eax,[rax+rcx*8]
   140adab94:	8b c8                	mov    ecx,eax
   140adab96:	49 8d 14 40          	lea    rdx,[r8+rax*2]
   140adab9a:	48 03 d1             	add    rdx,rcx
   140adab9d:	0f b6 82 58 01 00 00 	movzx  eax,BYTE PTR [rdx+0x158]
   140adaba4:	41 88 41 01          	mov    BYTE PTR [r9+0x1],al
   140adaba8:	49 8d 04 48          	lea    rax,[r8+rcx*2]
   140adabac:	0f b6 8c 01 59 01 00 	movzx  ecx,BYTE PTR [rcx+rax*1+0x159]
   140adabb3:	00 
   140adabb4:	41 88 49 02          	mov    BYTE PTR [r9+0x2],cl
   140adabb8:	0f b6 82 5a 01 00 00 	movzx  eax,BYTE PTR [rdx+0x15a]
   140adabbf:	4b 8d 14 50          	lea    rdx,[r8+r10*2]
   140adabc3:	41 88 41 03          	mov    BYTE PTR [r9+0x3],al
   140adabc7:	41 8b ca             	mov    ecx,r10d
   140adabca:	48 03 d1             	add    rdx,rcx
   140adabcd:	0f b6 82 58 01 00 00 	movzx  eax,BYTE PTR [rdx+0x158]
   140adabd4:	41 88 41 04          	mov    BYTE PTR [r9+0x4],al
   140adabd8:	4b 8d 04 50          	lea    rax,[r8+r10*2]
   140adabdc:	41 0f b6 8c 02 59 01 	movzx  ecx,BYTE PTR [r10+rax*1+0x159]
   140adabe3:	00 00 
   140adabe5:	41 88 49 05          	mov    BYTE PTR [r9+0x5],cl
   140adabe9:	0f b6 82 5a 01 00 00 	movzx  eax,BYTE PTR [rdx+0x15a]
   140adabf0:	41 88 41 06          	mov    BYTE PTR [r9+0x6],al
   140adabf4:	41 8b 80 14 07 00 00 	mov    eax,DWORD PTR [r8+0x714]
   140adabfb:	41 0f af 80 84 00 00 	imul   eax,DWORD PTR [r8+0x84]
   140adac02:	00 
   140adac03:	41 03 80 88 00 00 00 	add    eax,DWORD PTR [r8+0x88]
   140adac0a:	48 63 c8             	movsxd rcx,eax
   140adac0d:	49 8b 80 f0 01 00 00 	mov    rax,QWORD PTR [r8+0x1f0]
   140adac14:	c7 04 88 00 00 00 00 	mov    DWORD PTR [rax+rcx*4],0x0
   140adac1b:	c3                   	ret
