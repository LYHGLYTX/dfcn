
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

00000001400bb190 <.text+0xba190>:
   1400bb190:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   1400bb195:	48 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],rdi
   1400bb19a:	44 8b 99 84 00 00 00 	mov    r11d,DWORD PTR [rcx+0x84]
   1400bb1a1:	4c 8b c9             	mov    r9,rcx
   1400bb1a4:	8b 99 88 00 00 00    	mov    ebx,DWORD PTR [rcx+0x88]
   1400bb1aa:	41 8b c3             	mov    eax,r11d
   1400bb1ad:	0f af 81 14 07 00 00 	imul   eax,DWORD PTR [rcx+0x714]
   1400bb1b4:	41 0f be f8          	movsx  edi,r8b
   1400bb1b8:	c1 e0 03             	shl    eax,0x3
   1400bb1bb:	4c 63 d0             	movsxd r10,eax
   1400bb1be:	8d 04 dd 00 00 00 00 	lea    eax,[rbx*8+0x0]
   1400bb1c5:	48 63 c8             	movsxd rcx,eax
   1400bb1c8:	4c 03 d1             	add    r10,rcx
   1400bb1cb:	4d 03 91 e0 01 00 00 	add    r10,QWORD PTR [r9+0x1e0]
   1400bb1d2:	4d 3b 91 e8 01 00 00 	cmp    r10,QWORD PTR [r9+0x1e8]
   1400bb1d9:	0f 83 4b 01 00 00    	jae    0x1400bb32a
   1400bb1df:	45 3b 99 88 02 00 00 	cmp    r11d,DWORD PTR [r9+0x288]
   1400bb1e6:	0f 8c 3e 01 00 00    	jl     0x1400bb32a
   1400bb1ec:	45 3b 99 8c 02 00 00 	cmp    r11d,DWORD PTR [r9+0x28c]
   1400bb1f3:	0f 8f 31 01 00 00    	jg     0x1400bb32a
   1400bb1f9:	41 3b 99 90 02 00 00 	cmp    ebx,DWORD PTR [r9+0x290]
   1400bb200:	0f 8c 24 01 00 00    	jl     0x1400bb32a
   1400bb206:	41 3b 99 94 02 00 00 	cmp    ebx,DWORD PTR [r9+0x294]
   1400bb20d:	0f 8f 17 01 00 00    	jg     0x1400bb32a
   1400bb213:	41 88 12             	mov    BYTE PTR [r10],dl
   1400bb216:	4d 8d 42 02          	lea    r8,[r10+0x2]
   1400bb21a:	41 80 b9 8f 00 00 00 	cmp    BYTE PTR [r9+0x8f],0x0
   1400bb221:	00 
   1400bb222:	0f 84 91 00 00 00    	je     0x1400bb2b9
   1400bb228:	41 0f b6 81 8e 00 00 	movzx  eax,BYTE PTR [r9+0x8e]
   1400bb22f:	00 
   1400bb230:	f6 d8                	neg    al
   1400bb232:	41 0f be 81 8c 00 00 	movsx  eax,BYTE PTR [r9+0x8c]
   1400bb239:	00 
   1400bb23a:	1b c9                	sbb    ecx,ecx
   1400bb23c:	83 e1 08             	and    ecx,0x8
   1400bb23f:	03 c8                	add    ecx,eax
   1400bb241:	48 63 c9             	movsxd rcx,ecx
   1400bb244:	49 8d 14 49          	lea    rdx,[r9+rcx*2]
   1400bb248:	48 03 d1             	add    rdx,rcx
   1400bb24b:	0f b6 82 58 01 00 00 	movzx  eax,BYTE PTR [rdx+0x158]
   1400bb252:	41 88 42 01          	mov    BYTE PTR [r10+0x1],al
   1400bb256:	49 8d 04 49          	lea    rax,[r9+rcx*2]
   1400bb25a:	0f b6 8c 01 59 01 00 	movzx  ecx,BYTE PTR [rcx+rax*1+0x159]
   1400bb261:	00 
   1400bb262:	41 88 08             	mov    BYTE PTR [r8],cl
   1400bb265:	0f b6 82 5a 01 00 00 	movzx  eax,BYTE PTR [rdx+0x15a]
   1400bb26c:	41 88 40 01          	mov    BYTE PTR [r8+0x1],al
   1400bb270:	49 0f be 89 8d 00 00 	movsx  rcx,BYTE PTR [r9+0x8d]
   1400bb277:	00 
   1400bb278:	49 8d 04 49          	lea    rax,[r9+rcx*2]
   1400bb27c:	0f b6 8c 01 58 01 00 	movzx  ecx,BYTE PTR [rcx+rax*1+0x158]
   1400bb283:	00 
   1400bb284:	41 88 48 02          	mov    BYTE PTR [r8+0x2],cl
   1400bb288:	49 83 c0 03          	add    r8,0x3
   1400bb28c:	49 0f be 89 8d 00 00 	movsx  rcx,BYTE PTR [r9+0x8d]
   1400bb293:	00 
   1400bb294:	48 83 c1 73          	add    rcx,0x73
   1400bb298:	49 8d 04 49          	lea    rax,[r9+rcx*2]
   1400bb29c:	0f b6 0c 01          	movzx  ecx,BYTE PTR [rcx+rax*1]
   1400bb2a0:	41 88 08             	mov    BYTE PTR [r8],cl
   1400bb2a3:	49 0f be 89 8d 00 00 	movsx  rcx,BYTE PTR [r9+0x8d]
   1400bb2aa:	00 
   1400bb2ab:	49 8d 04 49          	lea    rax,[r9+rcx*2]
   1400bb2af:	0f b6 94 01 5a 01 00 	movzx  edx,BYTE PTR [rcx+rax*1+0x15a]
   1400bb2b6:	00 
   1400bb2b7:	eb 46                	jmp    0x1400bb2ff
   1400bb2b9:	41 0f b6 81 90 00 00 	movzx  eax,BYTE PTR [r9+0x90]
   1400bb2c0:	00 
   1400bb2c1:	41 88 42 01          	mov    BYTE PTR [r10+0x1],al
   1400bb2c5:	41 0f b6 81 91 00 00 	movzx  eax,BYTE PTR [r9+0x91]
   1400bb2cc:	00 
   1400bb2cd:	41 88 00             	mov    BYTE PTR [r8],al
   1400bb2d0:	41 0f b6 81 92 00 00 	movzx  eax,BYTE PTR [r9+0x92]
   1400bb2d7:	00 
   1400bb2d8:	41 88 40 01          	mov    BYTE PTR [r8+0x1],al
   1400bb2dc:	41 0f b6 81 93 00 00 	movzx  eax,BYTE PTR [r9+0x93]
   1400bb2e3:	00 
   1400bb2e4:	41 88 40 02          	mov    BYTE PTR [r8+0x2],al
   1400bb2e8:	49 83 c0 03          	add    r8,0x3
   1400bb2ec:	41 0f b6 81 94 00 00 	movzx  eax,BYTE PTR [r9+0x94]
   1400bb2f3:	00 
   1400bb2f4:	41 88 00             	mov    BYTE PTR [r8],al
   1400bb2f7:	41 0f b6 91 95 00 00 	movzx  edx,BYTE PTR [r9+0x95]
   1400bb2fe:	00 
   1400bb2ff:	41 88 50 01          	mov    BYTE PTR [r8+0x1],dl
   1400bb303:	41 8b 81 14 07 00 00 	mov    eax,DWORD PTR [r9+0x714]
   1400bb30a:	41 0f af 81 84 00 00 	imul   eax,DWORD PTR [r9+0x84]
   1400bb311:	00 
   1400bb312:	41 03 81 88 00 00 00 	add    eax,DWORD PTR [r9+0x88]
   1400bb319:	48 63 c8             	movsxd rcx,eax
   1400bb31c:	49 8b 81 f0 01 00 00 	mov    rax,QWORD PTR [r9+0x1f0]
   1400bb323:	c7 04 88 00 00 00 00 	mov    DWORD PTR [rax+rcx*4],0x0
   1400bb32a:	41 01 b9 84 00 00 00 	add    DWORD PTR [r9+0x84],edi
   1400bb331:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
   1400bb336:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
   1400bb33b:	c3                   	ret
