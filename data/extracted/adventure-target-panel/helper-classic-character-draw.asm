
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

00000001400bb190 <.text+0xba190>:
   1400bb190:	0f 8c 24 01 00 00    	jl     0x1400bb2ba
   1400bb196:	41 3b 99 94 02 00 00 	cmp    ebx,DWORD PTR [r9+0x294]
   1400bb19d:	0f 8f 17 01 00 00    	jg     0x1400bb2ba
   1400bb1a3:	41 88 12             	mov    BYTE PTR [r10],dl
   1400bb1a6:	4d 8d 42 02          	lea    r8,[r10+0x2]
   1400bb1aa:	41 80 b9 8f 00 00 00 	cmp    BYTE PTR [r9+0x8f],0x0
   1400bb1b1:	00 
   1400bb1b2:	0f 84 91 00 00 00    	je     0x1400bb249
   1400bb1b8:	41 0f b6 81 8e 00 00 	movzx  eax,BYTE PTR [r9+0x8e]
   1400bb1bf:	00 
   1400bb1c0:	f6 d8                	neg    al
   1400bb1c2:	41 0f be 81 8c 00 00 	movsx  eax,BYTE PTR [r9+0x8c]
   1400bb1c9:	00 
   1400bb1ca:	1b c9                	sbb    ecx,ecx
   1400bb1cc:	83 e1 08             	and    ecx,0x8
   1400bb1cf:	03 c8                	add    ecx,eax
   1400bb1d1:	48 63 c9             	movsxd rcx,ecx
   1400bb1d4:	49 8d 14 49          	lea    rdx,[r9+rcx*2]
   1400bb1d8:	48 03 d1             	add    rdx,rcx
   1400bb1db:	0f b6 82 58 01 00 00 	movzx  eax,BYTE PTR [rdx+0x158]
   1400bb1e2:	41 88 42 01          	mov    BYTE PTR [r10+0x1],al
   1400bb1e6:	49 8d 04 49          	lea    rax,[r9+rcx*2]
   1400bb1ea:	0f b6 8c 01 59 01 00 	movzx  ecx,BYTE PTR [rcx+rax*1+0x159]
   1400bb1f1:	00 
   1400bb1f2:	41 88 08             	mov    BYTE PTR [r8],cl
   1400bb1f5:	0f b6 82 5a 01 00 00 	movzx  eax,BYTE PTR [rdx+0x15a]
   1400bb1fc:	41 88 40 01          	mov    BYTE PTR [r8+0x1],al
   1400bb200:	49 0f be 89 8d 00 00 	movsx  rcx,BYTE PTR [r9+0x8d]
   1400bb207:	00 
   1400bb208:	49 8d 04 49          	lea    rax,[r9+rcx*2]
   1400bb20c:	0f b6 8c 01 58 01 00 	movzx  ecx,BYTE PTR [rcx+rax*1+0x158]
   1400bb213:	00 
   1400bb214:	41 88 48 02          	mov    BYTE PTR [r8+0x2],cl
   1400bb218:	49 83 c0 03          	add    r8,0x3
   1400bb21c:	49 0f be 89 8d 00 00 	movsx  rcx,BYTE PTR [r9+0x8d]
   1400bb223:	00 
   1400bb224:	48 83 c1 73          	add    rcx,0x73
   1400bb228:	49 8d 04 49          	lea    rax,[r9+rcx*2]
   1400bb22c:	0f b6 0c 01          	movzx  ecx,BYTE PTR [rcx+rax*1]
   1400bb230:	41 88 08             	mov    BYTE PTR [r8],cl
   1400bb233:	49 0f be 89 8d 00 00 	movsx  rcx,BYTE PTR [r9+0x8d]
   1400bb23a:	00 
   1400bb23b:	49 8d 04 49          	lea    rax,[r9+rcx*2]
   1400bb23f:	0f b6 94 01 5a 01 00 	movzx  edx,BYTE PTR [rcx+rax*1+0x15a]
   1400bb246:	00 
   1400bb247:	eb 46                	jmp    0x1400bb28f
   1400bb249:	41 0f b6 81 90 00 00 	movzx  eax,BYTE PTR [r9+0x90]
   1400bb250:	00 
   1400bb251:	41 88 42 01          	mov    BYTE PTR [r10+0x1],al
   1400bb255:	41 0f b6 81 91 00 00 	movzx  eax,BYTE PTR [r9+0x91]
   1400bb25c:	00 
   1400bb25d:	41 88 00             	mov    BYTE PTR [r8],al
   1400bb260:	41 0f b6 81 92 00 00 	movzx  eax,BYTE PTR [r9+0x92]
   1400bb267:	00 
   1400bb268:	41 88 40 01          	mov    BYTE PTR [r8+0x1],al
   1400bb26c:	41 0f b6 81 93 00 00 	movzx  eax,BYTE PTR [r9+0x93]
   1400bb273:	00 
   1400bb274:	41 88 40 02          	mov    BYTE PTR [r8+0x2],al
   1400bb278:	49 83 c0 03          	add    r8,0x3
   1400bb27c:	41 0f b6 81 94 00 00 	movzx  eax,BYTE PTR [r9+0x94]
   1400bb283:	00 
   1400bb284:	41 88 00             	mov    BYTE PTR [r8],al
   1400bb287:	41 0f b6 91 95 00 00 	movzx  edx,BYTE PTR [r9+0x95]
   1400bb28e:	00 
   1400bb28f:	41 88 50 01          	mov    BYTE PTR [r8+0x1],dl
   1400bb293:	41 8b 81 14 07 00 00 	mov    eax,DWORD PTR [r9+0x714]
   1400bb29a:	41 0f af 81 84 00 00 	imul   eax,DWORD PTR [r9+0x84]
   1400bb2a1:	00 
   1400bb2a2:	41 03 81 88 00 00 00 	add    eax,DWORD PTR [r9+0x88]
   1400bb2a9:	48 63 c8             	movsxd rcx,eax
   1400bb2ac:	49 8b 81 f0 01 00 00 	mov    rax,QWORD PTR [r9+0x1f0]
   1400bb2b3:	c7 04 88 00 00 00 00 	mov    DWORD PTR [rax+rcx*4],0x0
   1400bb2ba:	41 01 b9 84 00 00 00 	add    DWORD PTR [r9+0x84],edi
   1400bb2c1:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
   1400bb2c6:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
   1400bb2cb:	c3                   	ret
   1400bb2cc:	cc                   	int3
   1400bb2cd:	cc                   	int3
   1400bb2ce:	cc                   	int3
   1400bb2cf:	cc                   	int3
   1400bb2d0:	8b 81 c0 01 00 00    	mov    eax,DWORD PTR [rcx+0x1c0]
   1400bb2d6:	89 02                	mov    DWORD PTR [rdx],eax
   1400bb2d8:	8b 81 c4 01 00 00    	mov    eax,DWORD PTR [rcx+0x1c4]
   1400bb2de:	41 89 00             	mov    DWORD PTR [r8],eax
   1400bb2e1:	c3                   	ret
   1400bb2e2:	cc                   	int3
   1400bb2e3:	cc                   	int3
   1400bb2e4:	cc                   	int3
   1400bb2e5:	cc                   	int3
   1400bb2e6:	cc                   	int3
   1400bb2e7:	cc                   	int3
   1400bb2e8:	cc                   	int3
   1400bb2e9:	cc                   	int3
   1400bb2ea:	cc                   	int3
   1400bb2eb:	cc                   	int3
   1400bb2ec:	cc                   	int3
   1400bb2ed:	cc                   	int3
   1400bb2ee:	cc                   	int3
   1400bb2ef:	cc                   	int3
   1400bb2f0:	33 c0                	xor    eax,eax
   1400bb2f2:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400bb2f5:	89 41 08             	mov    DWORD PTR [rcx+0x8],eax
   1400bb2f8:	48 89 41 10          	mov    QWORD PTR [rcx+0x10],rax
   1400bb2fc:	48 89 41 18          	mov    QWORD PTR [rcx+0x18],rax
   1400bb300:	48 8b c1             	mov    rax,rcx
   1400bb303:	c3                   	ret
   1400bb304:	cc                   	int3
   1400bb305:	cc                   	int3
   1400bb306:	cc                   	int3
   1400bb307:	cc                   	int3
   1400bb308:	cc                   	int3
   1400bb309:	cc                   	int3
   1400bb30a:	cc                   	int3
   1400bb30b:	cc                   	int3
   1400bb30c:	cc                   	int3
   1400bb30d:	cc                   	int3
   1400bb30e:	cc                   	int3
   1400bb30f:	cc                   	int3
   1400bb310:	8b 44 24 30          	mov    eax,DWORD PTR [rsp+0x30]
   1400bb314:	89 41 10             	mov    DWORD PTR [rcx+0x10],eax
   1400bb317:	8b 44 24 38          	mov    eax,DWORD PTR [rsp+0x38]
   1400bb31b:	89 41 14             	mov    DWORD PTR [rcx+0x14],eax
   1400bb31e:	8b 44 24 28          	mov    eax,DWORD PTR [rsp+0x28]
   1400bb322:	89 41 0c             	mov    DWORD PTR [rcx+0xc],eax
   1400bb325:	89 11                	mov    DWORD PTR [rcx],edx
   1400bb327:	44 89 41 04          	mov    DWORD PTR [rcx+0x4],r8d
   1400bb32b:	44 89 49 08          	mov    DWORD PTR [rcx+0x8],r9d
   1400bb32f:	e9 0c 00 00 00       	jmp    0x1400bb340
   1400bb334:	cc                   	int3
   1400bb335:	cc                   	int3
   1400bb336:	cc                   	int3
   1400bb337:	cc                   	int3
   1400bb338:	cc                   	int3
   1400bb339:	cc                   	int3
   1400bb33a:	cc                   	int3
   1400bb33b:	cc                   	int3
