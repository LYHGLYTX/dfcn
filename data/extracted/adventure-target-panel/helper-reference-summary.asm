
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140872f10 <.text+0x871f10>:
   140872f10:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140872f15:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
   140872f1a:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   140872f1f:	57                   	push   rdi
   140872f20:	41 54                	push   r12
   140872f22:	41 55                	push   r13
   140872f24:	41 56                	push   r14
   140872f26:	41 57                	push   r15
   140872f28:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
   140872f2f:	48 8b 05 0a 91 02 01 	mov    rax,QWORD PTR [rip+0x102910a]        # 0x14189c040
   140872f36:	48 33 c4             	xor    rax,rsp
   140872f39:	48 89 84 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],rax
   140872f40:	00 
   140872f41:	45 8b e1             	mov    r12d,r9d
   140872f44:	45 8b e8             	mov    r13d,r8d
   140872f47:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
   140872f4c:	c7 05 26 75 dd 01 07 	mov    DWORD PTR [rip+0x1dd7526],0x1010007        # 0x14264a47c
   140872f53:	00 01 01 
   140872f56:	41 8b f8             	mov    edi,r8d
   140872f59:	45 33 ff             	xor    r15d,r15d
   140872f5c:	ba 02 00 00 00       	mov    edx,0x2
   140872f61:	48 8d 0d 88 74 dd 01 	lea    rcx,[rip+0x1dd7488]        # 0x14264a3f0
   140872f68:	8b b4 24 00 01 00 00 	mov    esi,DWORD PTR [rsp+0x100]
   140872f6f:	45 3b c1             	cmp    r8d,r9d
   140872f72:	0f 8f b3 00 00 00    	jg     0x14087302b
   140872f78:	44 8d 76 08          	lea    r14d,[rsi+0x8]
   140872f7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140872f80:	8b de                	mov    ebx,esi
   140872f82:	41 3b f6             	cmp    esi,r14d
   140872f85:	0f 8d 95 00 00 00    	jge    0x140873020
   140872f8b:	8d 6e 07             	lea    ebp,[rsi+0x7]
   140872f8e:	66 90                	xchg   ax,ax
   140872f90:	3b de                	cmp    ebx,esi
   140872f92:	7e 0b                	jle    0x140872f9f
   140872f94:	3b dd                	cmp    ebx,ebp
   140872f96:	7d 07                	jge    0x140872f9f
   140872f98:	b8 01 00 00 00       	mov    eax,0x1
   140872f9d:	eb 09                	jmp    0x140872fa8
   140872f9f:	49 8b c7             	mov    rax,r15
   140872fa2:	3b dd                	cmp    ebx,ebp
   140872fa4:	48 0f 44 c2          	cmove  rax,rdx
   140872fa8:	89 3d c6 74 dd 01    	mov    DWORD PTR [rip+0x1dd74c6],edi        # 0x14264a474
   140872fae:	89 1d c4 74 dd 01    	mov    DWORD PTR [rip+0x1dd74c4],ebx        # 0x14264a478
   140872fb4:	41 3b fd             	cmp    edi,r13d
   140872fb7:	75 09                	jne    0x140872fc2
   140872fb9:	8b 94 81 a8 19 00 00 	mov    edx,DWORD PTR [rcx+rax*4+0x19a8]
   140872fc0:	eb 15                	jmp    0x140872fd7
   140872fc2:	41 3b fc             	cmp    edi,r12d
   140872fc5:	75 09                	jne    0x140872fd0
   140872fc7:	8b 94 81 c0 19 00 00 	mov    edx,DWORD PTR [rcx+rax*4+0x19c0]
   140872fce:	eb 07                	jmp    0x140872fd7
   140872fd0:	8b 94 81 b4 19 00 00 	mov    edx,DWORD PTR [rcx+rax*4+0x19b4]
   140872fd7:	e8 f4 7a 26 00       	call   0x140adaad0
   140872fdc:	44 39 3d 95 a7 b5 01 	cmp    DWORD PTR [rip+0x1b5a795],r15d        # 0x1423cd778
   140872fe3:	7e 1d                	jle    0x140873002
   140872fe5:	48 8b 05 84 a7 b5 01 	mov    rax,QWORD PTR [rip+0x1b5a784]        # 0x1423cd770
   140872fec:	f6 00 01             	test   BYTE PTR [rax],0x1
   140872fef:	74 11                	je     0x140873002
   140872ff1:	41 b0 01             	mov    r8b,0x1
   140872ff4:	33 d2                	xor    edx,edx
   140872ff6:	48 8d 0d f3 73 dd 01 	lea    rcx,[rip+0x1dd73f3]        # 0x14264a3f0
   140872ffd:	e8 8e 81 84 ff       	call   0x1400bb190
   140873002:	ff c3                	inc    ebx
   140873004:	41 3b de             	cmp    ebx,r14d
   140873007:	48 8d 0d e2 73 dd 01 	lea    rcx,[rip+0x1dd73e2]        # 0x14264a3f0
   14087300e:	ba 02 00 00 00       	mov    edx,0x2
   140873013:	0f 8c 77 ff ff ff    	jl     0x140872f90
   140873019:	48 8d 0d d0 73 dd 01 	lea    rcx,[rip+0x1dd73d0]        # 0x14264a3f0
   140873020:	ff c7                	inc    edi
   140873022:	41 3b fc             	cmp    edi,r12d
   140873025:	0f 8e 55 ff ff ff    	jle    0x140872f80
   14087302b:	41 8d 6d 0b          	lea    ebp,[r13+0xb]
   14087302f:	8d 7e 05             	lea    edi,[rsi+0x5]
   140873032:	41 8b dd             	mov    ebx,r13d
   140873035:	44 3b ed             	cmp    r13d,ebp
   140873038:	7f 7f                	jg     0x1408730b9
   14087303a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140873040:	41 3b dd             	cmp    ebx,r13d
   140873043:	75 05                	jne    0x14087304a
   140873045:	49 8b c7             	mov    rax,r15
   140873048:	eb 0b                	jmp    0x140873055
   14087304a:	b8 01 00 00 00       	mov    eax,0x1
   14087304f:	3b dd                	cmp    ebx,ebp
   140873051:	48 0f 44 c2          	cmove  rax,rdx
   140873055:	44 8b de             	mov    r11d,esi
   140873058:	3b f7                	cmp    esi,edi
   14087305a:	7f 4b                	jg     0x1408730a7
   14087305c:	4c 8d 34 40          	lea    r14,[rax+rax*2]
   140873060:	89 1d 0e 74 dd 01    	mov    DWORD PTR [rip+0x1dd740e],ebx        # 0x14264a474
   140873066:	44 89 1d 0b 74 dd 01 	mov    DWORD PTR [rip+0x1dd740b],r11d        # 0x14264a478
   14087306d:	44 3b de             	cmp    r11d,esi
   140873070:	75 05                	jne    0x140873077
   140873072:	49 8b c7             	mov    rax,r15
   140873075:	eb 0c                	jmp    0x140873083
   140873077:	b8 01 00 00 00       	mov    eax,0x1
   14087307c:	44 3b df             	cmp    r11d,edi
   14087307f:	48 0f 44 c2          	cmove  rax,rdx
   140873083:	49 8d 14 06          	lea    rdx,[r14+rax*1]
   140873087:	8b 94 91 a0 1b 00 00 	mov    edx,DWORD PTR [rcx+rdx*4+0x1ba0]
   14087308e:	e8 3d 7a 26 00       	call   0x140adaad0
   140873093:	41 ff c3             	inc    r11d
   140873096:	44 3b df             	cmp    r11d,edi
   140873099:	48 8d 0d 50 73 dd 01 	lea    rcx,[rip+0x1dd7350]        # 0x14264a3f0
   1408730a0:	ba 02 00 00 00       	mov    edx,0x2
   1408730a5:	7e b9                	jle    0x140873060
   1408730a7:	ff c3                	inc    ebx
   1408730a9:	3b dd                	cmp    ebx,ebp
   1408730ab:	48 8d 0d 3e 73 dd 01 	lea    rcx,[rip+0x1dd733e]        # 0x14264a3f0
   1408730b2:	ba 02 00 00 00       	mov    edx,0x2
   1408730b7:	7e 87                	jle    0x140873040
   1408730b9:	44 39 3d b8 a6 b5 01 	cmp    DWORD PTR [rip+0x1b5a6b8],r15d        # 0x1423cd778
   1408730c0:	0f 8e ac 01 00 00    	jle    0x140873272
   1408730c6:	48 8b 05 a3 a6 b5 01 	mov    rax,QWORD PTR [rip+0x1b5a6a3]        # 0x1423cd770
   1408730cd:	f6 00 01             	test   BYTE PTR [rax],0x1
   1408730d0:	0f 84 9c 01 00 00    	je     0x140873272
   1408730d6:	4c 8b 74 24 58       	mov    r14,QWORD PTR [rsp+0x58]
   1408730db:	45 39 be 2c 14 00 00 	cmp    DWORD PTR [r14+0x142c],r15d
   1408730e2:	74 0d                	je     0x1408730f1
   1408730e4:	41 f7 86 1c 01 00 00 	test   DWORD PTR [r14+0x11c],0x4000
   1408730eb:	00 40 00 00 
   1408730ef:	74 08                	je     0x1408730f9
   1408730f1:	49 8b ce             	mov    rcx,r14
   1408730f4:	e8 27 69 94 ff       	call   0x1401b9a20
   1408730f9:	45 39 be 2c 14 00 00 	cmp    DWORD PTR [r14+0x142c],r15d
   140873100:	74 50                	je     0x140873152
   140873102:	c7 05 70 73 dd 01 07 	mov    DWORD PTR [rip+0x1dd7370],0x1010007        # 0x14264a47c
   140873109:	00 01 01 
   14087310c:	44 89 2d 61 73 dd 01 	mov    DWORD PTR [rip+0x1dd7361],r13d        # 0x14264a474
   140873113:	89 35 5f 73 dd 01    	mov    DWORD PTR [rip+0x1dd735f],esi        # 0x14264a478
   140873119:	44 88 7c 24 30       	mov    BYTE PTR [rsp+0x30],r15b
   14087311e:	c7 44 24 28 08 00 00 	mov    DWORD PTR [rsp+0x28],0x8
   140873125:	00 
   140873126:	c7 44 24 20 0c 00 00 	mov    DWORD PTR [rsp+0x20],0xc
   14087312d:	00 
   14087312e:	45 33 c9             	xor    r9d,r9d
   140873131:	45 33 c0             	xor    r8d,r8d
   140873134:	41 8b 96 2c 14 00 00 	mov    edx,DWORD PTR [r14+0x142c]
   14087313b:	48 8d 3d ae 72 dd 01 	lea    rdi,[rip+0x1dd72ae]        # 0x14264a3f0
   140873142:	48 8b cf             	mov    rcx,rdi
   140873145:	e8 26 7c 26 00       	call   0x140adad70
   14087314a:	8d 5e 01             	lea    ebx,[rsi+0x1]
   14087314d:	e9 67 01 00 00       	jmp    0x1408732b9
   140873152:	0f 57 c0             	xorps  xmm0,xmm0
   140873155:	0f 11 84 24 80 00 00 	movups XMMWORD PTR [rsp+0x80],xmm0
   14087315c:	00 
   14087315d:	66 0f 6f 0d bb 7f f1 	movdqa xmm1,XMMWORD PTR [rip+0xf17fbb]        # 0x14178b120
   140873164:	00 
   140873165:	f3 0f 7f 8c 24 90 00 	movdqu XMMWORD PTR [rsp+0x90],xmm1
   14087316c:	00 00 
   14087316e:	44 88 bc 24 80 00 00 	mov    BYTE PTR [rsp+0x80],r15b
   140873175:	00 
   140873176:	45 0f b7 86 a0 00 00 	movzx  r8d,WORD PTR [r14+0xa0]
   14087317d:	00 
   14087317e:	49 0f bf 8e a4 00 00 	movsx  rcx,WORD PTR [r14+0xa4]
   140873185:	00 
   140873186:	66 85 c9             	test   cx,cx
   140873189:	78 68                	js     0x1408731f3
   14087318b:	4c 8b 15 d6 98 c7 01 	mov    r10,QWORD PTR [rip+0x1c798d6]        # 0x1424eca68
   140873192:	48 8b 05 d7 98 c7 01 	mov    rax,QWORD PTR [rip+0x1c798d7]        # 0x1424eca70
   140873199:	49 2b c2             	sub    rax,r10
   14087319c:	48 c1 f8 03          	sar    rax,0x3
   1408731a0:	66 3b c8             	cmp    cx,ax
   1408731a3:	7d 4e                	jge    0x1408731f3
   1408731a5:	48 8b c1             	mov    rax,rcx
   1408731a8:	ba ff ff ff ff       	mov    edx,0xffffffff
   1408731ad:	44 8b ca             	mov    r9d,edx
   1408731b0:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
   1408731b5:	48 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],rcx
   1408731ba:	4c 89 7c 24 40       	mov    QWORD PTR [rsp+0x40],r15
   1408731bf:	4c 89 74 24 38       	mov    QWORD PTR [rsp+0x38],r14
   1408731c4:	c7 44 24 30 00 08 00 	mov    DWORD PTR [rsp+0x30],0x800
   1408731cb:	00 
   1408731cc:	66 44 89 44 24 28    	mov    WORD PTR [rsp+0x28],r8w
   1408731d2:	66 89 54 24 20       	mov    WORD PTR [rsp+0x20],dx
   1408731d7:	4c 8d 84 24 80 00 00 	lea    r8,[rsp+0x80]
   1408731de:	00 
   1408731df:	41 0f b7 96 2c 01 00 	movzx  edx,WORD PTR [r14+0x12c]
   1408731e6:	00 
   1408731e7:	49 8b 0c c2          	mov    rcx,QWORD PTR [r10+rax*8]
   1408731eb:	e8 70 33 e6 ff       	call   0x1406d6560
   1408731f0:	44 8b f8             	mov    r15d,eax
   1408731f3:	48 8d 3d f6 71 dd 01 	lea    rdi,[rip+0x1dd71f6]        # 0x14264a3f0
   1408731fa:	80 7c 24 50 00       	cmp    BYTE PTR [rsp+0x50],0x0
   1408731ff:	74 1d                	je     0x14087321e
   140873201:	44 89 2d 6c 72 dd 01 	mov    DWORD PTR [rip+0x1dd726c],r13d        # 0x14264a474
   140873208:	89 35 6a 72 dd 01    	mov    DWORD PTR [rip+0x1dd726a],esi        # 0x14264a478
   14087320e:	45 85 ff             	test   r15d,r15d
   140873211:	74 4d                	je     0x140873260
   140873213:	41 b9 06 00 00 00    	mov    r9d,0x6
   140873219:	45 33 c0             	xor    r8d,r8d
   14087321c:	eb 21                	jmp    0x14087323f
   14087321e:	41 8d 45 04          	lea    eax,[r13+0x4]
   140873222:	89 05 4c 72 dd 01    	mov    DWORD PTR [rip+0x1dd724c],eax        # 0x14264a474
   140873228:	8d 46 03             	lea    eax,[rsi+0x3]
   14087322b:	89 05 47 72 dd 01    	mov    DWORD PTR [rip+0x1dd7247],eax        # 0x14264a478
   140873231:	45 85 ff             	test   r15d,r15d
   140873234:	74 2a                	je     0x140873260
   140873236:	41 b9 02 00 00 00    	mov    r9d,0x2
   14087323c:	45 8b c1             	mov    r8d,r9d
   14087323f:	c6 44 24 30 00       	mov    BYTE PTR [rsp+0x30],0x0
   140873244:	c7 44 24 28 03 00 00 	mov    DWORD PTR [rsp+0x28],0x3
   14087324b:	00 
   14087324c:	c7 44 24 20 05 00 00 	mov    DWORD PTR [rsp+0x20],0x5
   140873253:	00 
   140873254:	41 8b d7             	mov    edx,r15d
   140873257:	48 8b cf             	mov    rcx,rdi
   14087325a:	e8 11 7b 26 00       	call   0x140adad70
   14087325f:	90                   	nop
   140873260:	48 8d 8c 24 80 00 00 	lea    rcx,[rsp+0x80]
   140873267:	00 
   140873268:	e8 e3 c5 7f ff       	call   0x14006f850
   14087326d:	8d 5e 01             	lea    ebx,[rsi+0x1]
   140873270:	eb 47                	jmp    0x1408732b9
   140873272:	41 8d 45 02          	lea    eax,[r13+0x2]
   140873276:	89 05 f8 71 dd 01    	mov    DWORD PTR [rip+0x1dd71f8],eax        # 0x14264a474
   14087327c:	8d 5e 01             	lea    ebx,[rsi+0x1]
   14087327f:	89 1d f3 71 dd 01    	mov    DWORD PTR [rip+0x1dd71f3],ebx        # 0x14264a478
   140873285:	33 d2                	xor    edx,edx
   140873287:	45 33 c9             	xor    r9d,r9d
   14087328a:	41 b0 01             	mov    r8b,0x1
   14087328d:	4c 8b 74 24 58       	mov    r14,QWORD PTR [rsp+0x58]
   140873292:	49 8b ce             	mov    rcx,r14
   140873295:	e8 26 09 ac 00       	call   0x141333bc0
   14087329a:	49 8b 06             	mov    rax,QWORD PTR [r14]
   14087329d:	33 d2                	xor    edx,edx
   14087329f:	49 8b ce             	mov    rcx,r14
   1408732a2:	ff 10                	call   QWORD PTR [rax]
   1408732a4:	0f b6 d0             	movzx  edx,al
   1408732a7:	41 b0 01             	mov    r8b,0x1
   1408732aa:	48 8d 3d 3f 71 dd 01 	lea    rdi,[rip+0x1dd713f]        # 0x14264a3f0
   1408732b1:	48 8b cf             	mov    rcx,rdi
   1408732b4:	e8 d7 7e 84 ff       	call   0x1400bb190
   1408732b9:	41 8d 45 0d          	lea    eax,[r13+0xd]
   1408732bd:	89 05 b1 71 dd 01    	mov    DWORD PTR [rip+0x1dd71b1],eax        # 0x14264a474
   1408732c3:	89 1d af 71 dd 01    	mov    DWORD PTR [rip+0x1dd71af],ebx        # 0x14264a478
   1408732c9:	49 8b ce             	mov    rcx,r14
   1408732cc:	e8 8f 15 f7 ff       	call   0x1407e4860
   1408732d1:	0f 57 c0             	xorps  xmm0,xmm0
   1408732d4:	0f 11 44 24 60       	movups XMMWORD PTR [rsp+0x60],xmm0
   1408732d9:	66 0f 6f 0d 3f 7e f1 	movdqa xmm1,XMMWORD PTR [rip+0xf17e3f]        # 0x14178b120
   1408732e0:	00 
   1408732e1:	f3 0f 7f 4c 24 70    	movdqu XMMWORD PTR [rsp+0x70],xmm1
   1408732e7:	c6 44 24 60 00       	mov    BYTE PTR [rsp+0x60],0x0
   1408732ec:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1408732f1:	41 b1 01             	mov    r9b,0x1
   1408732f4:	41 b8 01 00 00 00    	mov    r8d,0x1
   1408732fa:	48 8d 54 24 60       	lea    rdx,[rsp+0x60]
   1408732ff:	49 8b ce             	mov    rcx,r14
   140873302:	e8 29 b1 ab 00       	call   0x14132e430
   140873307:	c7 05 6b 71 dd 01 07 	mov    DWORD PTR [rip+0x1dd716b],0x1000007        # 0x14264a47c
   14087330e:	00 00 01 
   140873311:	45 33 c9             	xor    r9d,r9d
   140873314:	48 8d 54 24 60       	lea    rdx,[rsp+0x60]
   140873319:	48 8b cf             	mov    rcx,rdi
   14087331c:	e8 3f 66 26 00       	call   0x140ad9960
   140873321:	8d 6e 02             	lea    ebp,[rsi+0x2]
   140873324:	49 8b 9e d0 07 00 00 	mov    rbx,QWORD PTR [r14+0x7d0]
   14087332b:	49 8b be d8 07 00 00 	mov    rdi,QWORD PTR [r14+0x7d8]
   140873332:	48 3b df             	cmp    rbx,rdi
   140873335:	73 32                	jae    0x140873369
   140873337:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   14087333a:	83 38 ff             	cmp    DWORD PTR [rax],0xffffffff
   14087333d:	74 24                	je     0x140873363
   14087333f:	41 8d 45 10          	lea    eax,[r13+0x10]
   140873343:	89 05 2b 71 dd 01    	mov    DWORD PTR [rip+0x1dd712b],eax        # 0x14264a474
   140873349:	89 2d 29 71 dd 01    	mov    DWORD PTR [rip+0x1dd7129],ebp        # 0x14264a478
   14087334f:	49 8b d6             	mov    rdx,r14
   140873352:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140873355:	e8 e6 f2 fd ff       	call   0x140852640
   14087335a:	ff c5                	inc    ebp
   14087335c:	8d 46 08             	lea    eax,[rsi+0x8]
   14087335f:	3b e8                	cmp    ebp,eax
   140873361:	7d 06                	jge    0x140873369
   140873363:	48 83 c3 08          	add    rbx,0x8
   140873367:	eb c9                	jmp    0x140873332
   140873369:	48 8d 4c 24 60       	lea    rcx,[rsp+0x60]
   14087336e:	e8 dd c4 7f ff       	call   0x14006f850
   140873373:	48 8b 8c 24 a0 00 00 	mov    rcx,QWORD PTR [rsp+0xa0]
   14087337a:	00 
   14087337b:	48 33 cc             	xor    rcx,rsp
   14087337e:	e8 dd 62 cc 00       	call   0x141539660
   140873383:	4c 8d 9c 24 b0 00 00 	lea    r11,[rsp+0xb0]
   14087338a:	00 
   14087338b:	49 8b 5b 30          	mov    rbx,QWORD PTR [r11+0x30]
   14087338f:	49 8b 6b 40          	mov    rbp,QWORD PTR [r11+0x40]
   140873393:	49 8b 73 48          	mov    rsi,QWORD PTR [r11+0x48]
   140873397:	49 8b e3             	mov    rsp,r11
   14087339a:	41 5f                	pop    r15
   14087339c:	41 5e                	pop    r14
   14087339e:	41 5d                	pop    r13
   1408733a0:	41 5c                	pop    r12
   1408733a2:	5f                   	pop    rdi
   1408733a3:	c3                   	ret
