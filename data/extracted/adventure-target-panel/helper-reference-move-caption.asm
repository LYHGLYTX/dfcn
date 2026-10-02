
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014074f220 <.text+0x74e220>:
   14074f220:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   14074f225:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
   14074f22a:	48 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],rdi
   14074f22f:	41 54                	push   r12
   14074f231:	41 56                	push   r14
   14074f233:	41 57                	push   r15
   14074f235:	48 83 ec 20          	sub    rsp,0x20
   14074f239:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14074f23e:	45 0f b7 f9          	movzx  r15d,r9w
   14074f242:	44 0f b7 74 24 68    	movzx  r14d,WORD PTR [rsp+0x68]
   14074f248:	41 0f b7 e8          	movzx  ebp,r8w
   14074f24c:	0f b7 da             	movzx  ebx,dx
   14074f24f:	44 0f b7 e1          	movzx  r12d,cx
   14074f253:	66 44 3b c9          	cmp    r9w,cx
   14074f257:	7d 51                	jge    0x14074f2aa
   14074f259:	48 8b cf             	mov    rcx,rdi
   14074f25c:	66 39 54 24 60       	cmp    WORD PTR [rsp+0x60],dx
   14074f261:	7d 17                	jge    0x14074f27a
   14074f263:	41 b8 02 00 00 00    	mov    r8d,0x2
   14074f269:	48 8d 15 b4 02 f5 00 	lea    rdx,[rip+0xf502b4]        # 0x14169f524
   14074f270:	e8 9b 07 92 ff       	call   0x14006fa10
   14074f275:	e9 ef 00 00 00       	jmp    0x14074f369
   14074f27a:	7e 17                	jle    0x14074f293
   14074f27c:	41 b8 02 00 00 00    	mov    r8d,0x2
   14074f282:	48 8d 15 a3 02 f5 00 	lea    rdx,[rip+0xf502a3]        # 0x14169f52c
   14074f289:	e8 82 07 92 ff       	call   0x14006fa10
   14074f28e:	e9 d6 00 00 00       	jmp    0x14074f369
   14074f293:	41 b8 04 00 00 00    	mov    r8d,0x4
   14074f299:	48 8d 15 94 02 f5 00 	lea    rdx,[rip+0xf50294]        # 0x14169f534
   14074f2a0:	e8 6b 07 92 ff       	call   0x14006fa10
   14074f2a5:	e9 bf 00 00 00       	jmp    0x14074f369
   14074f2aa:	7e 4e                	jle    0x14074f2fa
   14074f2ac:	48 8b cf             	mov    rcx,rdi
   14074f2af:	66 39 5c 24 60       	cmp    WORD PTR [rsp+0x60],bx
   14074f2b4:	7d 17                	jge    0x14074f2cd
   14074f2b6:	41 b8 02 00 00 00    	mov    r8d,0x2
   14074f2bc:	48 8d 15 65 02 f5 00 	lea    rdx,[rip+0xf50265]        # 0x14169f528
   14074f2c3:	e8 48 07 92 ff       	call   0x14006fa10
   14074f2c8:	e9 9c 00 00 00       	jmp    0x14074f369
   14074f2cd:	7e 17                	jle    0x14074f2e6
   14074f2cf:	41 b8 02 00 00 00    	mov    r8d,0x2
   14074f2d5:	48 8d 15 54 02 f5 00 	lea    rdx,[rip+0xf50254]        # 0x14169f530
   14074f2dc:	e8 2f 07 92 ff       	call   0x14006fa10
   14074f2e1:	e9 83 00 00 00       	jmp    0x14074f369
   14074f2e6:	41 b8 04 00 00 00    	mov    r8d,0x4
   14074f2ec:	48 8d 15 49 02 f5 00 	lea    rdx,[rip+0xf50249]        # 0x14169f53c
   14074f2f3:	e8 18 07 92 ff       	call   0x14006fa10
   14074f2f8:	eb 6f                	jmp    0x14074f369
   14074f2fa:	66 39 5c 24 60       	cmp    WORD PTR [rsp+0x60],bx
   14074f2ff:	7d 0f                	jge    0x14074f310
   14074f301:	48 8d 15 3c 02 f5 00 	lea    rdx,[rip+0xf5023c]        # 0x14169f544
   14074f308:	41 b8 05 00 00 00    	mov    r8d,0x5
   14074f30e:	eb 44                	jmp    0x14074f354
   14074f310:	7e 0f                	jle    0x14074f321
   14074f312:	48 8d 15 33 02 f5 00 	lea    rdx,[rip+0xf50233]        # 0x14169f54c
   14074f319:	41 b8 05 00 00 00    	mov    r8d,0x5
   14074f31f:	eb 33                	jmp    0x14074f354
   14074f321:	66 44 3b f5          	cmp    r14w,bp
   14074f325:	7d 0f                	jge    0x14074f336
   14074f327:	48 8d 15 26 02 f5 00 	lea    rdx,[rip+0xf50226]        # 0x14169f554
   14074f32e:	41 b8 05 00 00 00    	mov    r8d,0x5
   14074f334:	eb 1e                	jmp    0x14074f354
   14074f336:	7e 0f                	jle    0x14074f347
   14074f338:	48 8d 15 1d 02 f5 00 	lea    rdx,[rip+0xf5021d]        # 0x14169f55c
   14074f33f:	41 b8 05 00 00 00    	mov    r8d,0x5
   14074f345:	eb 0d                	jmp    0x14074f354
   14074f347:	48 8d 15 16 02 f5 00 	lea    rdx,[rip+0xf50216]        # 0x14169f564
   14074f34e:	41 b8 04 00 00 00    	mov    r8d,0x4
   14074f354:	48 8b cf             	mov    rcx,rdi
   14074f357:	e8 b4 06 92 ff       	call   0x14006fa10
   14074f35c:	66 45 3b fc          	cmp    r15w,r12w
   14074f360:	75 07                	jne    0x14074f369
   14074f362:	66 39 5c 24 60       	cmp    WORD PTR [rsp+0x60],bx
   14074f367:	74 26                	je     0x14074f38f
   14074f369:	66 44 3b f5          	cmp    r14w,bp
   14074f36d:	7d 09                	jge    0x14074f378
   14074f36f:	48 8d 15 f6 01 f5 00 	lea    rdx,[rip+0xf501f6]        # 0x14169f56c
   14074f376:	eb 09                	jmp    0x14074f381
   14074f378:	7e 15                	jle    0x14074f38f
   14074f37a:	48 8d 15 f3 01 f5 00 	lea    rdx,[rip+0xf501f3]        # 0x14169f574
   14074f381:	41 b8 06 00 00 00    	mov    r8d,0x6
   14074f387:	48 8b cf             	mov    rcx,rdi
   14074f38a:	e8 81 06 92 ff       	call   0x14006fa10
   14074f38f:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   14074f394:	48 8b 6c 24 48       	mov    rbp,QWORD PTR [rsp+0x48]
   14074f399:	48 8b 7c 24 50       	mov    rdi,QWORD PTR [rsp+0x50]
   14074f39e:	48 83 c4 20          	add    rsp,0x20
   14074f3a2:	41 5f                	pop    r15
   14074f3a4:	41 5e                	pop    r14
   14074f3a6:	41 5c                	pop    r12
   14074f3a8:	c3                   	ret
