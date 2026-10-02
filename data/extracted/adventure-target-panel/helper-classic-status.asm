
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014084fec0 <.text+0x84eec0>:
   14084fec0:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   14084fec5:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14084feca:	55                   	push   rbp
   14084fecb:	57                   	push   rdi
   14084fecc:	41 54                	push   r12
   14084fece:	41 56                	push   r14
   14084fed0:	41 57                	push   r15
   14084fed2:	48 8d 6c 24 c9       	lea    rbp,[rsp-0x37]
   14084fed7:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
   14084fede:	48 8b 05 5b 61 04 01 	mov    rax,QWORD PTR [rip+0x104615b]        # 0x141896040
   14084fee5:	48 33 c4             	xor    rax,rsp
   14084fee8:	48 89 45 27          	mov    QWORD PTR [rbp+0x27],rax
   14084feec:	4c 8b f2             	mov    r14,rdx
   14084feef:	48 8b d9             	mov    rbx,rcx
   14084fef2:	48 63 01             	movsxd rax,DWORD PTR [rcx]
   14084fef5:	83 f8 1b             	cmp    eax,0x1b
   14084fef8:	0f 87 36 0b 00 00    	ja     0x140850a34
   14084fefe:	48 8d 0d fb 00 7b ff 	lea    rcx,[rip+0xffffffffff7b00fb]        # 0x140000000
   14084ff05:	8b 94 81 7c 19 85 00 	mov    edx,DWORD PTR [rcx+rax*4+0x85197c]
   14084ff0c:	48 03 d1             	add    rdx,rcx
   14084ff0f:	ff e2                	jmp    rdx
   14084ff11:	c7 05 51 44 df 01 07 	mov    DWORD PTR [rip+0x1df4451],0x1010007        # 0x14264436c
   14084ff18:	00 01 01 
   14084ff1b:	0f 57 c0             	xorps  xmm0,xmm0
   14084ff1e:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   14084ff22:	f6 43 1c 01          	test   BYTE PTR [rbx+0x1c],0x1
   14084ff26:	74 35                	je     0x14084ff5d
   14084ff28:	66 0f 6f 0d 70 5b f3 	movdqa xmm1,XMMWORD PTR [rip+0xf35b70]        # 0x141785aa0
   14084ff2f:	00 
   14084ff30:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   14084ff35:	48 b8 43 68 61 72 67 	movabs rax,0x676e696772616843
   14084ff3c:	69 6e 67 
   14084ff3f:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   14084ff43:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   14084ff47:	45 33 c9             	xor    r9d,r9d
   14084ff4a:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14084ff4e:	48 8d 0d 8b 43 df 01 	lea    rcx,[rip+0x1df438b]        # 0x1426442e0
   14084ff55:	e8 46 6a 28 00       	call   0x140ad69a0
   14084ff5a:	90                   	nop
   14084ff5b:	eb 39                	jmp    0x14084ff96
   14084ff5d:	66 0f 6f 0d 1b 5b f3 	movdqa xmm1,XMMWORD PTR [rip+0xf35b1b]        # 0x141785a80
   14084ff64:	00 
   14084ff65:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   14084ff6a:	8b 05 2c c8 e5 00    	mov    eax,DWORD PTR [rip+0xe5c82c]        # 0x1416ac79c
   14084ff70:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   14084ff73:	0f b7 05 26 c8 e5 00 	movzx  eax,WORD PTR [rip+0xe5c826]        # 0x1416ac7a0
   14084ff7a:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   14084ff7e:	c6 45 cd 00          	mov    BYTE PTR [rbp-0x33],0x0
   14084ff82:	45 33 c9             	xor    r9d,r9d
   14084ff85:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14084ff89:	48 8d 0d 50 43 df 01 	lea    rcx,[rip+0x1df4350]        # 0x1426442e0
   14084ff90:	e8 0b 6a 28 00       	call   0x140ad69a0
   14084ff95:	90                   	nop
   14084ff96:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   14084ff9a:	48 83 fa 0f          	cmp    rdx,0xf
   14084ff9e:	76 31                	jbe    0x14084ffd1
   14084ffa0:	48 ff c2             	inc    rdx
   14084ffa3:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   14084ffa7:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14084ffae:	48 8b c1             	mov    rax,rcx
   14084ffb1:	72 19                	jb     0x14084ffcc
   14084ffb3:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14084ffb7:	48 2b c1             	sub    rax,rcx
   14084ffba:	48 83 c2 27          	add    rdx,0x27
   14084ffbe:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14084ffc2:	48 83 f8 1f          	cmp    rax,0x1f
   14084ffc6:	0f 87 3f 10 00 00    	ja     0x14085100b
   14084ffcc:	e8 1f 46 ce 00       	call   0x1415345f0
   14084ffd1:	49 8b 86 d0 00 00 00 	mov    rax,QWORD PTR [r14+0xd0]
   14084ffd8:	49 2b 86 c8 00 00 00 	sub    rax,QWORD PTR [r14+0xc8]
   14084ffdf:	48 d1 f8             	sar    rax,1
   14084ffe2:	0f 84 4c 0a 00 00    	je     0x140850a34
   14084ffe8:	b8 d0 8a ff ff       	mov    eax,0xffff8ad0
   14084ffed:	66 89 45 b7          	mov    WORD PTR [rbp-0x49],ax
   14084fff1:	41 f7 86 10 01 00 00 	test   DWORD PTR [r14+0x110],0x2000000
   14084fff8:	00 00 00 02 
   14084fffc:	74 4f                	je     0x14085004d
   14084fffe:	49 8b 9e d8 01 00 00 	mov    rbx,QWORD PTR [r14+0x1d8]
   140850005:	49 8b be e0 01 00 00 	mov    rdi,QWORD PTR [r14+0x1e0]
   14085000c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140850010:	48 3b df             	cmp    rbx,rdi
   140850013:	73 5c                	jae    0x140850071
   140850015:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140850018:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14085001b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   14085001e:	83 f8 0b             	cmp    eax,0xb
   140850021:	75 0e                	jne    0x140850031
   140850023:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140850026:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140850029:	ff 50 18             	call   QWORD PTR [rax+0x18]
   14085002c:	48 85 c0             	test   rax,rax
   14085002f:	75 06                	jne    0x140850037
   140850031:	48 83 c3 08          	add    rbx,0x8
   140850035:	eb d9                	jmp    0x140850010
   140850037:	4c 8d 4d bf          	lea    r9,[rbp-0x41]
   14085003b:	4c 8d 45 bb          	lea    r8,[rbp-0x45]
   14085003f:	48 8d 55 b7          	lea    rdx,[rbp-0x49]
   140850043:	48 8b c8             	mov    rcx,rax
   140850046:	e8 95 8a 43 00       	call   0x140c88ae0
   14085004b:	eb 24                	jmp    0x140850071
   14085004d:	41 0f b7 86 a8 00 00 	movzx  eax,WORD PTR [r14+0xa8]
   140850054:	00 
   140850055:	66 89 45 b7          	mov    WORD PTR [rbp-0x49],ax
   140850059:	41 0f b7 86 aa 00 00 	movzx  eax,WORD PTR [r14+0xaa]
   140850060:	00 
   140850061:	66 89 45 bb          	mov    WORD PTR [rbp-0x45],ax
   140850065:	41 0f b7 86 ac 00 00 	movzx  eax,WORD PTR [r14+0xac]
   14085006c:	00 
   14085006d:	66 89 45 bf          	mov    WORD PTR [rbp-0x41],ax
   140850071:	49 8b 86 c8 00 00 00 	mov    rax,QWORD PTR [r14+0xc8]
   140850078:	0f b7 18             	movzx  ebx,WORD PTR [rax]
   14085007b:	49 8b 86 e0 00 00 00 	mov    rax,QWORD PTR [r14+0xe0]
   140850082:	0f b7 38             	movzx  edi,WORD PTR [rax]
   140850085:	49 8b 86 f8 00 00 00 	mov    rax,QWORD PTR [r14+0xf8]
   14085008c:	0f b7 30             	movzx  esi,WORD PTR [rax]
   14085008f:	0f 57 c0             	xorps  xmm0,xmm0
   140850092:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850096:	66 0f 6f 0d 92 59 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf35992]        # 0x141785a30
   14085009d:	00 
   14085009e:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408500a3:	66 c7 45 c7 20 00    	mov    WORD PTR [rbp-0x39],0x20
   1408500a9:	45 33 c9             	xor    r9d,r9d
   1408500ac:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408500b0:	48 8d 0d 29 42 df 01 	lea    rcx,[rip+0x1df4229]        # 0x1426442e0
   1408500b7:	e8 e4 68 28 00       	call   0x140ad69a0
   1408500bc:	90                   	nop
   1408500bd:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   1408500c1:	48 83 fa 0f          	cmp    rdx,0xf
   1408500c5:	76 34                	jbe    0x1408500fb
   1408500c7:	48 ff c2             	inc    rdx
   1408500ca:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   1408500ce:	48 8b c1             	mov    rax,rcx
   1408500d1:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1408500d8:	72 1c                	jb     0x1408500f6
   1408500da:	48 83 c2 27          	add    rdx,0x27
   1408500de:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1408500e2:	48 2b c1             	sub    rax,rcx
   1408500e5:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1408500e9:	48 83 f8 1f          	cmp    rax,0x1f
   1408500ed:	76 07                	jbe    0x1408500f6
   1408500ef:	ff 15 ab 09 d9 00    	call   QWORD PTR [rip+0xd909ab]        # 0x1415e0aa0
   1408500f5:	cc                   	int3
   1408500f6:	e8 f5 44 ce 00       	call   0x1415345f0
   1408500fb:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408500ff:	66 3b c7             	cmp    ax,di
   140850102:	7d 78                	jge    0x14085017c
   140850104:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   140850108:	7d 32                	jge    0x14085013c
   14085010a:	48 8d 15 e7 1a df 00 	lea    rdx,[rip+0xdf1ae7]        # 0x141641bf8
   140850111:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850115:	e8 c6 7f 81 ff       	call   0x1400680e0
   14085011a:	90                   	nop
   14085011b:	45 33 c9             	xor    r9d,r9d
   14085011e:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140850122:	48 8d 0d b7 41 df 01 	lea    rcx,[rip+0x1df41b7]        # 0x1426442e0
   140850129:	e8 72 68 28 00       	call   0x140ad69a0
   14085012e:	90                   	nop
   14085012f:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850133:	e8 a8 f6 81 ff       	call   0x14006f7e0
   140850138:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   14085013c:	66 3b c7             	cmp    ax,di
   14085013f:	7d 3b                	jge    0x14085017c
   140850141:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   140850145:	7e 32                	jle    0x140850179
   140850147:	48 8d 15 2a 1b df 00 	lea    rdx,[rip+0xdf1b2a]        # 0x141641c78
   14085014e:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850152:	e8 89 7f 81 ff       	call   0x1400680e0
   140850157:	90                   	nop
   140850158:	45 33 c9             	xor    r9d,r9d
   14085015b:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   14085015f:	48 8d 0d 7a 41 df 01 	lea    rcx,[rip+0x1df417a]        # 0x1426442e0
   140850166:	e8 35 68 28 00       	call   0x140ad69a0
   14085016b:	90                   	nop
   14085016c:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850170:	e8 6b f6 81 ff       	call   0x14006f7e0
   140850175:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   140850179:	66 3b c7             	cmp    ax,di
   14085017c:	7e 75                	jle    0x1408501f3
   14085017e:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   140850182:	7d 32                	jge    0x1408501b6
   140850184:	48 8d 15 dd 1a df 00 	lea    rdx,[rip+0xdf1add]        # 0x141641c68
   14085018b:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085018f:	e8 4c 7f 81 ff       	call   0x1400680e0
   140850194:	90                   	nop
   140850195:	45 33 c9             	xor    r9d,r9d
   140850198:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   14085019c:	48 8d 0d 3d 41 df 01 	lea    rcx,[rip+0x1df413d]        # 0x1426442e0
   1408501a3:	e8 f8 67 28 00       	call   0x140ad69a0
   1408501a8:	90                   	nop
   1408501a9:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408501ad:	e8 2e f6 81 ff       	call   0x14006f7e0
   1408501b2:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408501b6:	66 3b c7             	cmp    ax,di
   1408501b9:	7e 3b                	jle    0x1408501f6
   1408501bb:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   1408501bf:	7e 32                	jle    0x1408501f3
   1408501c1:	48 8d 15 90 1a df 00 	lea    rdx,[rip+0xdf1a90]        # 0x141641c58
   1408501c8:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408501cc:	e8 0f 7f 81 ff       	call   0x1400680e0
   1408501d1:	90                   	nop
   1408501d2:	45 33 c9             	xor    r9d,r9d
   1408501d5:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408501d9:	48 8d 0d 00 41 df 01 	lea    rcx,[rip+0x1df4100]        # 0x1426442e0
   1408501e0:	e8 bb 67 28 00       	call   0x140ad69a0
   1408501e5:	90                   	nop
   1408501e6:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408501ea:	e8 f1 f5 81 ff       	call   0x14006f7e0
   1408501ef:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408501f3:	66 3b c7             	cmp    ax,di
   1408501f6:	7d 38                	jge    0x140850230
   1408501f8:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   1408501fc:	75 32                	jne    0x140850230
   1408501fe:	48 8d 15 3f 68 de 00 	lea    rdx,[rip+0xde683f]        # 0x141636a44
   140850205:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850209:	e8 d2 7e 81 ff       	call   0x1400680e0
   14085020e:	90                   	nop
   14085020f:	45 33 c9             	xor    r9d,r9d
   140850212:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140850216:	48 8d 0d c3 40 df 01 	lea    rcx,[rip+0x1df40c3]        # 0x1426442e0
   14085021d:	e8 7e 67 28 00       	call   0x140ad69a0
   140850222:	90                   	nop
   140850223:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850227:	e8 b4 f5 81 ff       	call   0x14006f7e0
   14085022c:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   140850230:	66 3b c7             	cmp    ax,di
   140850233:	7e 3b                	jle    0x140850270
   140850235:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   140850239:	75 32                	jne    0x14085026d
   14085023b:	48 8d 15 fa 67 de 00 	lea    rdx,[rip+0xde67fa]        # 0x141636a3c
   140850242:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850246:	e8 95 7e 81 ff       	call   0x1400680e0
   14085024b:	90                   	nop
   14085024c:	45 33 c9             	xor    r9d,r9d
   14085024f:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140850253:	48 8d 0d 86 40 df 01 	lea    rcx,[rip+0x1df4086]        # 0x1426442e0
   14085025a:	e8 41 67 28 00       	call   0x140ad69a0
   14085025f:	90                   	nop
   140850260:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850264:	e8 77 f5 81 ff       	call   0x14006f7e0
   140850269:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   14085026d:	66 3b c7             	cmp    ax,di
   140850270:	0f 85 f6 00 00 00    	jne    0x14085036c
   140850276:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   14085027a:	7d 32                	jge    0x1408502ae
   14085027c:	48 8d 15 a9 67 de 00 	lea    rdx,[rip+0xde67a9]        # 0x141636a2c
   140850283:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850287:	e8 54 7e 81 ff       	call   0x1400680e0
   14085028c:	90                   	nop
   14085028d:	45 33 c9             	xor    r9d,r9d
   140850290:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140850294:	48 8d 0d 45 40 df 01 	lea    rcx,[rip+0x1df4045]        # 0x1426442e0
   14085029b:	e8 00 67 28 00       	call   0x140ad69a0
   1408502a0:	90                   	nop
   1408502a1:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408502a5:	e8 36 f5 81 ff       	call   0x14006f7e0
   1408502aa:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408502ae:	66 3b c7             	cmp    ax,di
   1408502b1:	0f 85 b5 00 00 00    	jne    0x14085036c
   1408502b7:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   1408502bb:	7e 32                	jle    0x1408502ef
   1408502bd:	48 8d 15 70 67 de 00 	lea    rdx,[rip+0xde6770]        # 0x141636a34
   1408502c4:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408502c8:	e8 13 7e 81 ff       	call   0x1400680e0
   1408502cd:	90                   	nop
   1408502ce:	45 33 c9             	xor    r9d,r9d
   1408502d1:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408502d5:	48 8d 0d 04 40 df 01 	lea    rcx,[rip+0x1df4004]        # 0x1426442e0
   1408502dc:	e8 bf 66 28 00       	call   0x140ad69a0
   1408502e1:	90                   	nop
   1408502e2:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408502e6:	e8 f5 f4 81 ff       	call   0x14006f7e0
   1408502eb:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408502ef:	66 3b c7             	cmp    ax,di
   1408502f2:	75 78                	jne    0x14085036c
   1408502f4:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   1408502f8:	75 72                	jne    0x14085036c
   1408502fa:	66 3b 75 bf          	cmp    si,WORD PTR [rbp-0x41]
   1408502fe:	7e 33                	jle    0x140850333
   140850300:	48 8d 15 51 c4 e5 00 	lea    rdx,[rip+0xe5c451]        # 0x1416ac758
   140850307:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085030b:	e8 d0 7d 81 ff       	call   0x1400680e0
   140850310:	90                   	nop
   140850311:	45 33 c9             	xor    r9d,r9d
   140850314:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140850318:	48 8d 0d c1 3f df 01 	lea    rcx,[rip+0x1df3fc1]        # 0x1426442e0
   14085031f:	e8 7c 66 28 00       	call   0x140ad69a0
   140850324:	90                   	nop
   140850325:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850329:	e8 b2 f4 81 ff       	call   0x14006f7e0
   14085032e:	e9 01 07 00 00       	jmp    0x140850a34
   140850333:	0f 8d fb 06 00 00    	jge    0x140850a34
   140850339:	48 8d 15 40 c4 e5 00 	lea    rdx,[rip+0xe5c440]        # 0x1416ac780
   140850340:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850344:	e8 97 7d 81 ff       	call   0x1400680e0
   140850349:	90                   	nop
   14085034a:	45 33 c9             	xor    r9d,r9d
   14085034d:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140850351:	48 8d 0d 88 3f df 01 	lea    rcx,[rip+0x1df3f88]        # 0x1426442e0
   140850358:	e8 43 66 28 00       	call   0x140ad69a0
   14085035d:	90                   	nop
   14085035e:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850362:	e8 79 f4 81 ff       	call   0x14006f7e0
   140850367:	e9 c8 06 00 00       	jmp    0x140850a34
   14085036c:	66 3b 75 bf          	cmp    si,WORD PTR [rbp-0x41]
   140850370:	7e 33                	jle    0x1408503a5
   140850372:	48 8d 15 17 c4 e5 00 	lea    rdx,[rip+0xe5c417]        # 0x1416ac790
   140850379:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085037d:	e8 5e 7d 81 ff       	call   0x1400680e0
   140850382:	90                   	nop
   140850383:	45 33 c9             	xor    r9d,r9d
   140850386:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   14085038a:	48 8d 0d 4f 3f df 01 	lea    rcx,[rip+0x1df3f4f]        # 0x1426442e0
   140850391:	e8 0a 66 28 00       	call   0x140ad69a0
   140850396:	90                   	nop
   140850397:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085039b:	e8 40 f4 81 ff       	call   0x14006f7e0
   1408503a0:	e9 8f 06 00 00       	jmp    0x140850a34
   1408503a5:	0f 8d 89 06 00 00    	jge    0x140850a34
   1408503ab:	48 8d 15 ae c3 e5 00 	lea    rdx,[rip+0xe5c3ae]        # 0x1416ac760
   1408503b2:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408503b6:	e8 25 7d 81 ff       	call   0x1400680e0
   1408503bb:	90                   	nop
   1408503bc:	45 33 c9             	xor    r9d,r9d
   1408503bf:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408503c3:	48 8d 0d 16 3f df 01 	lea    rcx,[rip+0x1df3f16]        # 0x1426442e0
   1408503ca:	e8 d1 65 28 00       	call   0x140ad69a0
   1408503cf:	90                   	nop
   1408503d0:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408503d4:	e8 07 f4 81 ff       	call   0x14006f7e0
   1408503d9:	e9 56 06 00 00       	jmp    0x140850a34
   1408503de:	0f 57 c0             	xorps  xmm0,xmm0
   1408503e1:	0f 11 45 07          	movups XMMWORD PTR [rbp+0x7],xmm0
   1408503e5:	33 ff                	xor    edi,edi
   1408503e7:	48 89 7d 17          	mov    QWORD PTR [rbp+0x17],rdi
   1408503eb:	48 c7 45 1f 0f 00 00 	mov    QWORD PTR [rbp+0x1f],0xf
   1408503f2:	00 
   1408503f3:	40 88 7d 07          	mov    BYTE PTR [rbp+0x7],dil
   1408503f7:	44 8b 53 08          	mov    r10d,DWORD PTR [rbx+0x8]
   1408503fb:	4c 8b 05 a6 eb b8 01 	mov    r8,QWORD PTR [rip+0x1b8eba6]        # 0x1423defa8
   140850402:	4c 8b 1d 97 eb b8 01 	mov    r11,QWORD PTR [rip+0x1b8eb97]        # 0x1423defa0
   140850409:	4d 2b c3             	sub    r8,r11
   14085040c:	49 c1 f8 03          	sar    r8,0x3
   140850410:	45 85 c0             	test   r8d,r8d
   140850413:	74 38                	je     0x14085044d
   140850415:	41 83 fa ff          	cmp    r10d,0xffffffff
   140850419:	74 32                	je     0x14085044d
   14085041b:	41 83 e8 01          	sub    r8d,0x1
   14085041f:	8b d7                	mov    edx,edi
   140850421:	78 2a                	js     0x14085044d
   140850423:	42 8d 0c 02          	lea    ecx,[rdx+r8*1]
   140850427:	d1 f9                	sar    ecx,1
   140850429:	48 63 c1             	movsxd rax,ecx
   14085042c:	49 8b 34 c3          	mov    rsi,QWORD PTR [r11+rax*8]
   140850430:	44 39 96 30 01 00 00 	cmp    DWORD PTR [rsi+0x130],r10d
   140850437:	74 17                	je     0x140850450
   140850439:	8d 41 01             	lea    eax,[rcx+0x1]
   14085043c:	0f 4e d0             	cmovle edx,eax
   14085043f:	8d 41 ff             	lea    eax,[rcx-0x1]
   140850442:	41 0f 4e c0          	cmovle eax,r8d
   140850446:	44 8b c0             	mov    r8d,eax
   140850449:	3b d0                	cmp    edx,eax
   14085044b:	7e d6                	jle    0x140850423
   14085044d:	48 8b f7             	mov    rsi,rdi
   140850450:	48 85 f6             	test   rsi,rsi
   140850453:	0f 84 ec 04 00 00    	je     0x140850945
   140850459:	0f 57 c0             	xorps  xmm0,xmm0
   14085045c:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850460:	48 89 7d d7          	mov    QWORD PTR [rbp-0x29],rdi
   140850464:	48 c7 45 df 0f 00 00 	mov    QWORD PTR [rbp-0x21],0xf
   14085046b:	00 
   14085046c:	c6 45 c7 00          	mov    BYTE PTR [rbp-0x39],0x0
   140850470:	4c 8b 15 89 eb b8 01 	mov    r10,QWORD PTR [rip+0x1b8eb89]        # 0x1423df000
   140850477:	49 3b f2             	cmp    rsi,r10
   14085047a:	75 56                	jne    0x1408504d2
   14085047c:	44 8b c7             	mov    r8d,edi
   14085047f:	45 8b 8e 30 01 00 00 	mov    r9d,DWORD PTR [r14+0x130]
   140850486:	48 8b d7             	mov    rdx,rdi
   140850489:	49 8d 8a 24 0e 00 00 	lea    rcx,[r10+0xe24]
   140850490:	44 39 49 d8          	cmp    DWORD PTR [rcx-0x28],r9d
   140850494:	75 07                	jne    0x14085049d
   140850496:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
   140850499:	39 01                	cmp    DWORD PTR [rcx],eax
   14085049b:	74 12                	je     0x1408504af
   14085049d:	41 ff c0             	inc    r8d
   1408504a0:	48 ff c2             	inc    rdx
   1408504a3:	48 83 c1 04          	add    rcx,0x4
   1408504a7:	48 83 fa 0a          	cmp    rdx,0xa
   1408504ab:	7c e3                	jl     0x140850490
   1408504ad:	eb 0b                	jmp    0x1408504ba
   1408504af:	49 63 c0             	movsxd rax,r8d
   1408504b2:	41 8b bc 82 9c 0e 00 	mov    edi,DWORD PTR [r10+rax*4+0xe9c]
   1408504b9:	00 
   1408504ba:	41 b8 03 00 00 00    	mov    r8d,0x3
   1408504c0:	48 8d 15 f1 6f d9 00 	lea    rdx,[rip+0xd96ff1]        # 0x1415e74b8
   1408504c7:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408504cb:	e8 90 f3 81 ff       	call   0x14006f860
   1408504d0:	eb 0c                	jmp    0x1408504de
   1408504d2:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408504d6:	48 8b ce             	mov    rcx,rsi
   1408504d9:	e8 92 bf ad 00       	call   0x14132c470
   1408504de:	8b 43 48             	mov    eax,DWORD PTR [rbx+0x48]
   1408504e1:	85 c0                	test   eax,eax
   1408504e3:	7e 73                	jle    0x140850558
   1408504e5:	40 f6 c7 04          	test   dil,0x4
   1408504e9:	74 6d                	je     0x140850558
   1408504eb:	83 f8 05             	cmp    eax,0x5
   1408504ee:	7c 10                	jl     0x140850500
   1408504f0:	48 8d 15 79 c2 e5 00 	lea    rdx,[rip+0xe5c279]        # 0x1416ac770
   1408504f7:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408504fb:	e8 f0 ef 81 ff       	call   0x14006f4f0
   140850500:	83 7b 48 04          	cmp    DWORD PTR [rbx+0x48],0x4
   140850504:	75 10                	jne    0x140850516
   140850506:	48 8d 15 fb c2 e5 00 	lea    rdx,[rip+0xe5c2fb]        # 0x1416ac808
   14085050d:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850511:	e8 da ef 81 ff       	call   0x14006f4f0
   140850516:	83 7b 48 03          	cmp    DWORD PTR [rbx+0x48],0x3
   14085051a:	75 10                	jne    0x14085052c
   14085051c:	48 8d 15 d5 c2 e5 00 	lea    rdx,[rip+0xe5c2d5]        # 0x1416ac7f8
   140850523:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850527:	e8 c4 ef 81 ff       	call   0x14006f4f0
   14085052c:	83 7b 48 02          	cmp    DWORD PTR [rbx+0x48],0x2
   140850530:	75 10                	jne    0x140850542
   140850532:	48 8d 15 ef c2 e5 00 	lea    rdx,[rip+0xe5c2ef]        # 0x1416ac828
   140850539:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085053d:	e8 ae ef 81 ff       	call   0x14006f4f0
   140850542:	83 7b 48 01          	cmp    DWORD PTR [rbx+0x48],0x1
   140850546:	75 10                	jne    0x140850558
   140850548:	48 8d 15 c9 c2 e5 00 	lea    rdx,[rip+0xe5c2c9]        # 0x1416ac818
   14085054f:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850553:	e8 98 ef 81 ff       	call   0x14006f4f0
   140850558:	8b 43 48             	mov    eax,DWORD PTR [rbx+0x48]
   14085055b:	b9 09 00 00 00       	mov    ecx,0x9
   140850560:	41 b8 19 00 00 00    	mov    r8d,0x19
   140850566:	85 c0                	test   eax,eax
   140850568:	44 0f 4f c1          	cmovg  r8d,ecx
   14085056c:	48 8d 0d 35 c2 e5 00 	lea    rcx,[rip+0xe5c235]        # 0x1416ac7a8
   140850573:	48 8d 15 3e c2 e5 00 	lea    rdx,[rip+0xe5c23e]        # 0x1416ac7b8
   14085057a:	48 0f 4f d1          	cmovg  rdx,rcx
   14085057e:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850582:	e8 19 f4 81 ff       	call   0x14006f9a0
   140850587:	41 b8 01 00 00 00    	mov    r8d,0x1
   14085058d:	48 8d 15 8c 31 d9 00 	lea    rdx,[rip+0xd9318c]        # 0x1415e3720
   140850594:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850598:	e8 03 f4 81 ff       	call   0x14006f9a0
   14085059d:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408505a1:	48 83 7d df 0f       	cmp    QWORD PTR [rbp-0x21],0xf
   1408505a6:	48 0f 47 55 c7       	cmova  rdx,QWORD PTR [rbp-0x39]
   1408505ab:	4c 8b 45 d7          	mov    r8,QWORD PTR [rbp-0x29]
   1408505af:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408505b3:	e8 e8 f3 81 ff       	call   0x14006f9a0
   1408505b8:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   1408505bb:	41 bc 02 00 00 00    	mov    r12d,0x2
   1408505c1:	85 c0                	test   eax,eax
   1408505c3:	75 1b                	jne    0x1408505e0
   1408505c5:	41 b8 0f 00 00 00    	mov    r8d,0xf
   1408505cb:	48 8d 15 16 c2 e5 00 	lea    rdx,[rip+0xe5c216]        # 0x1416ac7e8
   1408505d2:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408505d6:	e8 c5 f3 81 ff       	call   0x14006f9a0
   1408505db:	e9 fb 02 00 00       	jmp    0x1408508db
   1408505e0:	83 f8 01             	cmp    eax,0x1
   1408505e3:	75 1b                	jne    0x140850600
   1408505e5:	41 b8 0a 00 00 00    	mov    r8d,0xa
   1408505eb:	48 8d 15 e6 c1 e5 00 	lea    rdx,[rip+0xe5c1e6]        # 0x1416ac7d8
   1408505f2:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408505f6:	e8 a5 f3 81 ff       	call   0x14006f9a0
   1408505fb:	e9 db 02 00 00       	jmp    0x1408508db
   140850600:	8b 53 24             	mov    edx,DWORD PTR [rbx+0x24]
   140850603:	83 fa ff             	cmp    edx,0xffffffff
   140850606:	0f 84 9e 01 00 00    	je     0x1408507aa
   14085060c:	48 8d 0d 2d ed b8 01 	lea    rcx,[rip+0x1b8ed2d]        # 0x1423df340
   140850613:	e8 58 20 82 ff       	call   0x140072670
   140850618:	4c 8b f0             	mov    r14,rax
   14085061b:	48 85 c0             	test   rax,rax
   14085061e:	0f 84 b7 02 00 00    	je     0x1408508db
   140850624:	48 8d 15 65 8f d9 00 	lea    rdx,[rip+0xd98f65]        # 0x1415e9590
   14085062b:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085062f:	e8 bc ee 81 ff       	call   0x14006f4f0
   140850634:	40 f6 c7 08          	test   dil,0x8
   140850638:	0f 84 83 00 00 00    	je     0x1408506c1
   14085063e:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   140850642:	0f 8e 79 00 00 00    	jle    0x1408506c1
   140850648:	32 c0                	xor    al,al
   14085064a:	f6 43 3c 20          	test   BYTE PTR [rbx+0x3c],0x20
   14085064e:	74 12                	je     0x140850662
   140850650:	48 8d 15 51 c0 e5 00 	lea    rdx,[rip+0xe5c051]        # 0x1416ac6a8
   140850657:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085065b:	e8 90 ee 81 ff       	call   0x14006f4f0
   140850660:	b0 01                	mov    al,0x1
   140850662:	f6 43 3c 40          	test   BYTE PTR [rbx+0x3c],0x40
   140850666:	74 12                	je     0x14085067a
   140850668:	48 8d 15 d5 0c e5 00 	lea    rdx,[rip+0xe50cd5]        # 0x1416a1344
   14085066f:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850673:	e8 78 ee 81 ff       	call   0x14006f4f0
   140850678:	b0 01                	mov    al,0x1
   14085067a:	f6 43 3c 80          	test   BYTE PTR [rbx+0x3c],0x80
   14085067e:	74 12                	je     0x140850692
   140850680:	48 8d 15 19 c0 e5 00 	lea    rdx,[rip+0xe5c019]        # 0x1416ac6a0
   140850687:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085068b:	e8 60 ee 81 ff       	call   0x14006f4f0
   140850690:	b0 01                	mov    al,0x1
   140850692:	f7 43 3c 00 01 00 00 	test   DWORD PTR [rbx+0x3c],0x100
   140850699:	74 12                	je     0x1408506ad
   14085069b:	48 8d 15 1e c0 e5 00 	lea    rdx,[rip+0xe5c01e]        # 0x1416ac6c0
   1408506a2:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408506a6:	e8 45 ee 81 ff       	call   0x14006f4f0
   1408506ab:	eb 04                	jmp    0x1408506b1
   1408506ad:	84 c0                	test   al,al
   1408506af:	74 10                	je     0x1408506c1
   1408506b1:	48 8d 15 68 30 d9 00 	lea    rdx,[rip+0xd93068]        # 0x1415e3720
   1408506b8:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408506bc:	e8 2f ee 81 ff       	call   0x14006f4f0
   1408506c1:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408506c5:	e8 56 ef 81 ff       	call   0x14006f620
   1408506ca:	90                   	nop
   1408506cb:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   1408506d1:	45 33 c0             	xor    r8d,r8d
   1408506d4:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408506d8:	49 8b ce             	mov    rcx,r14
   1408506db:	e8 b0 1d 41 00       	call   0x140c62490
   1408506e0:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408506e4:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408506e8:	e8 b3 95 86 ff       	call   0x1400b9ca0
   1408506ed:	40 f6 c7 01          	test   dil,0x1
   1408506f1:	0f 84 a5 00 00 00    	je     0x14085079c
   1408506f7:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   1408506fb:	0f 8e 9b 00 00 00    	jle    0x14085079c
   140850701:	48 8d 15 18 30 d9 00 	lea    rdx,[rip+0xd93018]        # 0x1415e3720
   140850708:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085070c:	e8 df ed 81 ff       	call   0x14006f4f0
   140850711:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140850714:	49 8b ce             	mov    rcx,r14
   140850717:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   14085071d:	4c 8b f0             	mov    r14,rax
   140850720:	48 85 c0             	test   rax,rax
   140850723:	74 66                	je     0x14085078b
   140850725:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   140850729:	48 2b 08             	sub    rcx,QWORD PTR [rax]
   14085072c:	48 c1 f9 03          	sar    rcx,0x3
   140850730:	48 85 c9             	test   rcx,rcx
   140850733:	74 56                	je     0x14085078b
   140850735:	48 63 4b 2c          	movsxd rcx,DWORD PTR [rbx+0x2c]
   140850739:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14085073c:	4c 8b 3c c8          	mov    r15,QWORD PTR [rax+rcx*8]
   140850740:	48 8d 15 99 ce e0 00 	lea    rdx,[rip+0xe0ce99]        # 0x14165d5e0
   140850747:	49 8d 4f 50          	lea    rcx,[r15+0x50]
   14085074b:	e8 c0 f6 81 ff       	call   0x14006fe10
   140850750:	84 c0                	test   al,al
   140850752:	75 1d                	jne    0x140850771
   140850754:	49 8d 57 50          	lea    rdx,[r15+0x50]
   140850758:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085075c:	e8 3f 95 86 ff       	call   0x1400b9ca0
   140850761:	48 8d 15 b8 2f d9 00 	lea    rdx,[rip+0xd92fb8]        # 0x1415e3720
   140850768:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085076c:	e8 7f ed 81 ff       	call   0x14006f4f0
   140850771:	48 63 4b 2c          	movsxd rcx,DWORD PTR [rbx+0x2c]
   140850775:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140850778:	48 8b 14 c8          	mov    rdx,QWORD PTR [rax+rcx*8]
   14085077c:	48 83 c2 10          	add    rdx,0x10
   140850780:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850784:	e8 17 95 86 ff       	call   0x1400b9ca0
   140850789:	eb 11                	jmp    0x14085079c
   14085078b:	48 8d 15 56 ce e0 00 	lea    rdx,[rip+0xe0ce56]        # 0x14165d5e8
   140850792:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850796:	e8 55 ed 81 ff       	call   0x14006f4f0
   14085079b:	90                   	nop
   14085079c:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408507a0:	e8 3b f0 81 ff       	call   0x14006f7e0
   1408507a5:	e9 31 01 00 00       	jmp    0x1408508db
   1408507aa:	40 f6 c7 01          	test   dil,0x1
   1408507ae:	0f 84 27 01 00 00    	je     0x1408508db
   1408507b4:	48 8d 15 d5 8d d9 00 	lea    rdx,[rip+0xd98dd5]        # 0x1415e9590
   1408507bb:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408507bf:	e8 2c ed 81 ff       	call   0x14006f4f0
   1408507c4:	40 f6 c7 08          	test   dil,0x8
   1408507c8:	0f 84 83 00 00 00    	je     0x140850851
   1408507ce:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   1408507d2:	0f 8e 79 00 00 00    	jle    0x140850851
   1408507d8:	32 c0                	xor    al,al
   1408507da:	f6 43 3c 20          	test   BYTE PTR [rbx+0x3c],0x20
   1408507de:	74 12                	je     0x1408507f2
   1408507e0:	48 8d 15 c1 be e5 00 	lea    rdx,[rip+0xe5bec1]        # 0x1416ac6a8
   1408507e7:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408507eb:	e8 00 ed 81 ff       	call   0x14006f4f0
   1408507f0:	b0 01                	mov    al,0x1
   1408507f2:	f6 43 3c 40          	test   BYTE PTR [rbx+0x3c],0x40
   1408507f6:	74 12                	je     0x14085080a
   1408507f8:	48 8d 15 45 0b e5 00 	lea    rdx,[rip+0xe50b45]        # 0x1416a1344
   1408507ff:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850803:	e8 e8 ec 81 ff       	call   0x14006f4f0
   140850808:	b0 01                	mov    al,0x1
   14085080a:	f6 43 3c 80          	test   BYTE PTR [rbx+0x3c],0x80
   14085080e:	74 12                	je     0x140850822
   140850810:	48 8d 15 89 be e5 00 	lea    rdx,[rip+0xe5be89]        # 0x1416ac6a0
   140850817:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085081b:	e8 d0 ec 81 ff       	call   0x14006f4f0
   140850820:	b0 01                	mov    al,0x1
   140850822:	f7 43 3c 00 01 00 00 	test   DWORD PTR [rbx+0x3c],0x100
   140850829:	74 12                	je     0x14085083d
   14085082b:	48 8d 15 8e be e5 00 	lea    rdx,[rip+0xe5be8e]        # 0x1416ac6c0
   140850832:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850836:	e8 b5 ec 81 ff       	call   0x14006f4f0
   14085083b:	eb 04                	jmp    0x140850841
   14085083d:	84 c0                	test   al,al
   14085083f:	74 10                	je     0x140850851
   140850841:	48 8d 15 d8 2e d9 00 	lea    rdx,[rip+0xd92ed8]        # 0x1415e3720
   140850848:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085084c:	e8 9f ec 81 ff       	call   0x14006f4f0
   140850851:	48 63 4b 2c          	movsxd rcx,DWORD PTR [rbx+0x2c]
   140850855:	83 f9 ff             	cmp    ecx,0xffffffff
   140850858:	74 71                	je     0x1408508cb
   14085085a:	49 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [r14+0x5f8]
   140850861:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   140850865:	4c 8b 3c c8          	mov    r15,QWORD PTR [rax+rcx*8]
   140850869:	41 f6 47 60 01       	test   BYTE PTR [r15+0x60],0x1
   14085086e:	74 4c                	je     0x1408508bc
   140850870:	4d 8b 87 50 01 00 00 	mov    r8,QWORD PTR [r15+0x150]
   140850877:	49 8b 87 58 01 00 00 	mov    rax,QWORD PTR [r15+0x158]
   14085087e:	49 2b c0             	sub    rax,r8
   140850881:	48 d1 f8             	sar    rax,1
   140850884:	74 36                	je     0x1408508bc
   140850886:	66 44 89 64 24 20    	mov    WORD PTR [rsp+0x20],r12w
   14085088c:	45 33 c9             	xor    r9d,r9d
   14085088f:	45 0f b7 00          	movzx  r8d,WORD PTR [r8]
   140850893:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850897:	49 8b ce             	mov    rcx,r14
   14085089a:	e8 a1 ec ad 00       	call   0x14132f540
   14085089f:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408508a3:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408508a7:	e8 f4 93 86 ff       	call   0x1400b9ca0
   1408508ac:	48 8d 15 6d 2e d9 00 	lea    rdx,[rip+0xd92e6d]        # 0x1415e3720
   1408508b3:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408508b7:	e8 34 ec 81 ff       	call   0x14006f4f0
   1408508bc:	49 8d 57 40          	lea    rdx,[r15+0x40]
   1408508c0:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408508c4:	e8 d7 93 86 ff       	call   0x1400b9ca0
   1408508c9:	eb 10                	jmp    0x1408508db
   1408508cb:	48 8d 15 6a d1 e0 00 	lea    rdx,[rip+0xe0d16a]        # 0x14165da3c
   1408508d2:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408508d6:	e8 15 ec 81 ff       	call   0x14006f4f0
   1408508db:	40 f6 c7 02          	test   dil,0x2
   1408508df:	74 59                	je     0x14085093a
   1408508e1:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   1408508e5:	7e 53                	jle    0x14085093a
   1408508e7:	66 83 7b 28 ff       	cmp    WORD PTR [rbx+0x28],0xffff
   1408508ec:	74 4c                	je     0x14085093a
   1408508ee:	48 8d 15 bb bd e5 00 	lea    rdx,[rip+0xe5bdbb]        # 0x1416ac6b0
   1408508f5:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408508f9:	e8 f2 eb 81 ff       	call   0x14006f4f0
   1408508fe:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850902:	e8 19 ed 81 ff       	call   0x14006f620
   140850907:	90                   	nop
   140850908:	66 44 89 64 24 20    	mov    WORD PTR [rsp+0x20],r12w
   14085090e:	45 33 c9             	xor    r9d,r9d
   140850911:	44 0f b7 43 28       	movzx  r8d,WORD PTR [rbx+0x28]
   140850916:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   14085091a:	48 8b ce             	mov    rcx,rsi
   14085091d:	e8 1e ec ad 00       	call   0x14132f540
   140850922:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140850926:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085092a:	e8 71 93 86 ff       	call   0x1400b9ca0
   14085092f:	90                   	nop
   140850930:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140850934:	e8 a7 ee 81 ff       	call   0x14006f7e0
   140850939:	90                   	nop
   14085093a:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085093e:	e8 9d ee 81 ff       	call   0x14006f7e0
   140850943:	eb 1d                	jmp    0x140850962
   140850945:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140850949:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   14085094d:	48 8d 15 64 be e5 00 	lea    rdx,[rip+0xe5be64]        # 0x1416ac7b8
   140850954:	7e 07                	jle    0x14085095d
   140850956:	48 8d 15 4b be e5 00 	lea    rdx,[rip+0xe5be4b]        # 0x1416ac7a8
   14085095d:	e8 8e eb 81 ff       	call   0x14006f4f0
   140850962:	c7 05 00 3a df 01 04 	mov    DWORD PTR [rip+0x1df3a00],0x1010004        # 0x14264436c
   140850969:	00 01 01 
   14085096c:	48 63 15 01 6d b7 01 	movsxd rdx,DWORD PTR [rip+0x1b76d01]        # 0x1423c7674
   140850973:	48 39 55 17          	cmp    QWORD PTR [rbp+0x17],rdx
   140850977:	76 09                	jbe    0x140850982
   140850979:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085097d:	e8 ae a9 cd ff       	call   0x14052b330
   140850982:	45 33 c9             	xor    r9d,r9d
   140850985:	48 8d 55 07          	lea    rdx,[rbp+0x7]
   140850989:	48 8d 0d 50 39 df 01 	lea    rcx,[rip+0x1df3950]        # 0x1426442e0
   140850990:	e8 0b 60 28 00       	call   0x140ad69a0
   140850995:	90                   	nop
   140850996:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085099a:	e8 41 ee 81 ff       	call   0x14006f7e0
   14085099f:	e9 90 00 00 00       	jmp    0x140850a34
   1408509a4:	c7 05 be 39 df 01 03 	mov    DWORD PTR [rip+0x1df39be],0x1010003        # 0x14264436c
   1408509ab:	00 01 01 
   1408509ae:	0f 57 c0             	xorps  xmm0,xmm0
   1408509b1:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408509b5:	66 0f 6f 0d d3 50 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf350d3]        # 0x141785a90
   1408509bc:	00 
   1408509bd:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408509c2:	48 8b 05 9f bc e5 00 	mov    rax,QWORD PTR [rip+0xe5bc9f]        # 0x1416ac668
   1408509c9:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   1408509cc:	0f b7 05 99 bc e5 00 	movzx  eax,WORD PTR [rip+0xe5bc99]        # 0x1416ac66c
   1408509d3:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   1408509d7:	0f b6 05 90 bc e5 00 	movzx  eax,BYTE PTR [rip+0xe5bc90]        # 0x1416ac66e
   1408509de:	88 45 cd             	mov    BYTE PTR [rbp-0x33],al
   1408509e1:	c6 45 ce 00          	mov    BYTE PTR [rbp-0x32],0x0
   1408509e5:	45 33 c9             	xor    r9d,r9d
   1408509e8:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408509ec:	48 8d 0d ed 38 df 01 	lea    rcx,[rip+0x1df38ed]        # 0x1426442e0
   1408509f3:	e8 a8 5f 28 00       	call   0x140ad69a0
   1408509f8:	90                   	nop
   1408509f9:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   1408509fd:	48 83 fa 0f          	cmp    rdx,0xf
   140850a01:	76 31                	jbe    0x140850a34
   140850a03:	48 ff c2             	inc    rdx
   140850a06:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   140850a0a:	48 8b c1             	mov    rax,rcx
   140850a0d:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140850a14:	72 19                	jb     0x140850a2f
   140850a16:	48 83 c2 27          	add    rdx,0x27
   140850a1a:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   140850a1e:	48 2b c1             	sub    rax,rcx
   140850a21:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   140850a25:	48 83 f8 1f          	cmp    rax,0x1f
   140850a29:	0f 87 dc 05 00 00    	ja     0x14085100b
   140850a2f:	e8 bc 3b ce 00       	call   0x1415345f0
   140850a34:	48 8b 4d 27          	mov    rcx,QWORD PTR [rbp+0x27]
   140850a38:	48 33 cc             	xor    rcx,rsp
   140850a3b:	e8 90 3b ce 00       	call   0x1415345d0
   140850a40:	4c 8d 9c 24 b0 00 00 	lea    r11,[rsp+0xb0]
   140850a47:	00 
   140850a48:	49 8b 5b 40          	mov    rbx,QWORD PTR [r11+0x40]
   140850a4c:	49 8b 73 48          	mov    rsi,QWORD PTR [r11+0x48]
   140850a50:	49 8b e3             	mov    rsp,r11
   140850a53:	41 5f                	pop    r15
   140850a55:	41 5e                	pop    r14
   140850a57:	41 5c                	pop    r12
   140850a59:	5f                   	pop    rdi
   140850a5a:	5d                   	pop    rbp
   140850a5b:	c3                   	ret
   140850a5c:	c7 05 06 39 df 01 06 	mov    DWORD PTR [rip+0x1df3906],0x1010006        # 0x14264436c
   140850a63:	00 01 01 
   140850a66:	0f 57 c0             	xorps  xmm0,xmm0
   140850a69:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850a6d:	66 0f 6f 0d 8b 50 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3508b]        # 0x141785b00
   140850a74:	00 
   140850a75:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850a7a:	f2 0f 10 05 d6 bb e5 	movsd  xmm0,QWORD PTR [rip+0xe5bbd6]        # 0x1416ac658
   140850a81:	00 
   140850a82:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140850a87:	8b 05 d3 bb e5 00    	mov    eax,DWORD PTR [rip+0xe5bbd3]        # 0x1416ac660
   140850a8d:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140850a90:	0f b7 05 cd bb e5 00 	movzx  eax,WORD PTR [rip+0xe5bbcd]        # 0x1416ac664
   140850a97:	66 89 45 d3          	mov    WORD PTR [rbp-0x2d],ax
   140850a9b:	c6 45 d5 00          	mov    BYTE PTR [rbp-0x2b],0x0
   140850a9f:	45 33 c9             	xor    r9d,r9d
   140850aa2:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850aa6:	48 8d 0d 33 38 df 01 	lea    rcx,[rip+0x1df3833]        # 0x1426442e0
   140850aad:	e8 ee 5e 28 00       	call   0x140ad69a0
   140850ab2:	90                   	nop
   140850ab3:	e9 41 ff ff ff       	jmp    0x1408509f9
   140850ab8:	c7 05 aa 38 df 01 02 	mov    DWORD PTR [rip+0x1df38aa],0x1010002        # 0x14264436c
   140850abf:	00 01 01 
   140850ac2:	0f 57 c0             	xorps  xmm0,xmm0
   140850ac5:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850ac9:	66 0f 6f 0d 3f 50 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3503f]        # 0x141785b10
   140850ad0:	00 
   140850ad1:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850ad6:	f2 0f 10 05 b2 bb e5 	movsd  xmm0,QWORD PTR [rip+0xe5bbb2]        # 0x1416ac690
   140850add:	00 
   140850ade:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140850ae3:	8b 05 af bb e5 00    	mov    eax,DWORD PTR [rip+0xe5bbaf]        # 0x1416ac698
   140850ae9:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140850aec:	0f b7 05 a9 bb e5 00 	movzx  eax,WORD PTR [rip+0xe5bba9]        # 0x1416ac69c
   140850af3:	66 89 45 d3          	mov    WORD PTR [rbp-0x2d],ax
   140850af7:	0f b6 05 a0 bb e5 00 	movzx  eax,BYTE PTR [rip+0xe5bba0]        # 0x1416ac69e
   140850afe:	88 45 d5             	mov    BYTE PTR [rbp-0x2b],al
   140850b01:	c6 45 d6 00          	mov    BYTE PTR [rbp-0x2a],0x0
   140850b05:	45 33 c9             	xor    r9d,r9d
   140850b08:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850b0c:	48 8d 0d cd 37 df 01 	lea    rcx,[rip+0x1df37cd]        # 0x1426442e0
   140850b13:	e8 88 5e 28 00       	call   0x140ad69a0
   140850b18:	90                   	nop
   140850b19:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850b1d:	e8 be ec 81 ff       	call   0x14006f7e0
   140850b22:	e9 0d ff ff ff       	jmp    0x140850a34
   140850b27:	c7 05 3b 38 df 01 02 	mov    DWORD PTR [rip+0x1df383b],0x1010002        # 0x14264436c
   140850b2e:	00 01 01 
   140850b31:	0f 57 c0             	xorps  xmm0,xmm0
   140850b34:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850b38:	b9 20 00 00 00       	mov    ecx,0x20
   140850b3d:	e8 1e fc 81 ff       	call   0x140070760
   140850b42:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140850b46:	66 0f 6f 05 62 50 f3 	movdqa xmm0,XMMWORD PTR [rip+0xf35062]        # 0x141785bb0
   140850b4d:	00 
   140850b4e:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   140850b53:	0f 10 05 16 bb e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5bb16]        # 0x1416ac670
   140850b5a:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   140850b5d:	f2 0f 10 05 1b bb e5 	movsd  xmm0,QWORD PTR [rip+0xe5bb1b]        # 0x1416ac680
   140850b64:	00 
   140850b65:	f2 0f 11 40 10       	movsd  QWORD PTR [rax+0x10],xmm0
   140850b6a:	0f b6 0d 17 bb e5 00 	movzx  ecx,BYTE PTR [rip+0xe5bb17]        # 0x1416ac688
   140850b71:	88 48 18             	mov    BYTE PTR [rax+0x18],cl
   140850b74:	c6 40 19 00          	mov    BYTE PTR [rax+0x19],0x0
   140850b78:	45 33 c9             	xor    r9d,r9d
   140850b7b:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850b7f:	48 8d 0d 5a 37 df 01 	lea    rcx,[rip+0x1df375a]        # 0x1426442e0
   140850b86:	e8 15 5e 28 00       	call   0x140ad69a0
   140850b8b:	90                   	nop
   140850b8c:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850b90:	e8 4b ec 81 ff       	call   0x14006f7e0
   140850b95:	e9 9a fe ff ff       	jmp    0x140850a34
   140850b9a:	c7 05 c8 37 df 01 03 	mov    DWORD PTR [rip+0x1df37c8],0x1010003        # 0x14264436c
   140850ba1:	00 01 01 
   140850ba4:	0f 57 c0             	xorps  xmm0,xmm0
   140850ba7:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850bab:	66 0f 6f 0d ed 4e f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34eed]        # 0x141785aa0
   140850bb2:	00 
   140850bb3:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850bb8:	48 b8 4d 6f 75 6e 74 	movabs rax,0x676e69746e756f4d
   140850bbf:	69 6e 67 
   140850bc2:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140850bc6:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   140850bca:	45 33 c9             	xor    r9d,r9d
   140850bcd:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850bd1:	48 8d 0d 08 37 df 01 	lea    rcx,[rip+0x1df3708]        # 0x1426442e0
   140850bd8:	e8 c3 5d 28 00       	call   0x140ad69a0
   140850bdd:	90                   	nop
   140850bde:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850be2:	e8 f9 eb 81 ff       	call   0x14006f7e0
   140850be7:	e9 48 fe ff ff       	jmp    0x140850a34
   140850bec:	c7 05 76 37 df 01 03 	mov    DWORD PTR [rip+0x1df3776],0x1010003        # 0x14264436c
   140850bf3:	00 01 01 
   140850bf6:	0f 57 c0             	xorps  xmm0,xmm0
   140850bf9:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850bfd:	66 0f 6f 0d cb 4e f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34ecb]        # 0x141785ad0
   140850c04:	00 
   140850c05:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850c0a:	f2 0f 10 05 16 bb e5 	movsd  xmm0,QWORD PTR [rip+0xe5bb16]        # 0x1416ac728
   140850c11:	00 
   140850c12:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140850c17:	0f b7 05 12 bb e5 00 	movzx  eax,WORD PTR [rip+0xe5bb12]        # 0x1416ac730
   140850c1e:	66 89 45 cf          	mov    WORD PTR [rbp-0x31],ax
   140850c22:	0f b6 05 09 bb e5 00 	movzx  eax,BYTE PTR [rip+0xe5bb09]        # 0x1416ac732
   140850c29:	88 45 d1             	mov    BYTE PTR [rbp-0x2f],al
   140850c2c:	c6 45 d2 00          	mov    BYTE PTR [rbp-0x2e],0x0
   140850c30:	45 33 c9             	xor    r9d,r9d
   140850c33:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850c37:	48 8d 0d a2 36 df 01 	lea    rcx,[rip+0x1df36a2]        # 0x1426442e0
   140850c3e:	e8 5d 5d 28 00       	call   0x140ad69a0
   140850c43:	90                   	nop
   140850c44:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850c48:	e8 93 eb 81 ff       	call   0x14006f7e0
   140850c4d:	e9 e2 fd ff ff       	jmp    0x140850a34
   140850c52:	c7 05 10 37 df 01 03 	mov    DWORD PTR [rip+0x1df3710],0x1010003        # 0x14264436c
   140850c59:	00 01 01 
   140850c5c:	0f 57 c0             	xorps  xmm0,xmm0
   140850c5f:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850c63:	66 0f 6f 0d 95 4e f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34e95]        # 0x141785b00
   140850c6a:	00 
   140850c6b:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850c70:	f2 0f 10 05 d0 ba e5 	movsd  xmm0,QWORD PTR [rip+0xe5bad0]        # 0x1416ac748
   140850c77:	00 
   140850c78:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140850c7d:	8b 05 cd ba e5 00    	mov    eax,DWORD PTR [rip+0xe5bacd]        # 0x1416ac750
   140850c83:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140850c86:	0f b7 05 c7 ba e5 00 	movzx  eax,WORD PTR [rip+0xe5bac7]        # 0x1416ac754
   140850c8d:	66 89 45 d3          	mov    WORD PTR [rbp-0x2d],ax
   140850c91:	c6 45 d5 00          	mov    BYTE PTR [rbp-0x2b],0x0
   140850c95:	45 33 c9             	xor    r9d,r9d
   140850c98:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850c9c:	48 8d 0d 3d 36 df 01 	lea    rcx,[rip+0x1df363d]        # 0x1426442e0
   140850ca3:	e8 f8 5c 28 00       	call   0x140ad69a0
   140850ca8:	90                   	nop
   140850ca9:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850cad:	e8 2e eb 81 ff       	call   0x14006f7e0
   140850cb2:	e9 7d fd ff ff       	jmp    0x140850a34
   140850cb7:	c7 05 ab 36 df 01 03 	mov    DWORD PTR [rip+0x1df36ab],0x1010003        # 0x14264436c
   140850cbe:	00 01 01 
   140850cc1:	0f 57 c0             	xorps  xmm0,xmm0
   140850cc4:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850cc8:	b9 20 00 00 00       	mov    ecx,0x20
   140850ccd:	e8 8e fa 81 ff       	call   0x140070760
   140850cd2:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140850cd6:	66 0f 6f 05 72 4e f3 	movdqa xmm0,XMMWORD PTR [rip+0xf34e72]        # 0x141785b50
   140850cdd:	00 
   140850cde:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   140850ce3:	0f 10 05 96 b4 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5b496]        # 0x1416ac180
   140850cea:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   140850ced:	0f b7 0d 9c b4 e5 00 	movzx  ecx,WORD PTR [rip+0xe5b49c]        # 0x1416ac190
   140850cf4:	66 89 48 10          	mov    WORD PTR [rax+0x10],cx
   140850cf8:	0f b6 0d 93 b4 e5 00 	movzx  ecx,BYTE PTR [rip+0xe5b493]        # 0x1416ac192
   140850cff:	88 48 12             	mov    BYTE PTR [rax+0x12],cl
   140850d02:	c6 40 13 00          	mov    BYTE PTR [rax+0x13],0x0
   140850d06:	45 33 c9             	xor    r9d,r9d
   140850d09:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850d0d:	48 8d 0d cc 35 df 01 	lea    rcx,[rip+0x1df35cc]        # 0x1426442e0
   140850d14:	e8 87 5c 28 00       	call   0x140ad69a0
   140850d19:	90                   	nop
   140850d1a:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850d1e:	e8 bd ea 81 ff       	call   0x14006f7e0
   140850d23:	e9 0c fd ff ff       	jmp    0x140850a34
   140850d28:	c7 05 3a 36 df 01 02 	mov    DWORD PTR [rip+0x1df363a],0x1010002        # 0x14264436c
   140850d2f:	00 01 01 
   140850d32:	0f 57 c0             	xorps  xmm0,xmm0
   140850d35:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850d39:	66 0f 6f 0d 9f 4d f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34d9f]        # 0x141785ae0
   140850d40:	00 
   140850d41:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850d46:	f2 0f 10 05 ea b9 e5 	movsd  xmm0,QWORD PTR [rip+0xe5b9ea]        # 0x1416ac738
   140850d4d:	00 
   140850d4e:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140850d53:	8b 05 e7 b9 e5 00    	mov    eax,DWORD PTR [rip+0xe5b9e7]        # 0x1416ac740
   140850d59:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140850d5c:	c6 45 d3 00          	mov    BYTE PTR [rbp-0x2d],0x0
   140850d60:	45 33 c9             	xor    r9d,r9d
   140850d63:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850d67:	48 8d 0d 72 35 df 01 	lea    rcx,[rip+0x1df3572]        # 0x1426442e0
   140850d6e:	e8 2d 5c 28 00       	call   0x140ad69a0
   140850d73:	90                   	nop
   140850d74:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850d78:	e8 63 ea 81 ff       	call   0x14006f7e0
   140850d7d:	e9 b2 fc ff ff       	jmp    0x140850a34
   140850d82:	c7 05 e0 35 df 01 02 	mov    DWORD PTR [rip+0x1df35e0],0x1010002        # 0x14264436c
   140850d89:	00 01 01 
   140850d8c:	0f 57 c0             	xorps  xmm0,xmm0
   140850d8f:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850d93:	b9 20 00 00 00       	mov    ecx,0x20
   140850d98:	e8 c3 f9 81 ff       	call   0x140070760
   140850d9d:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140850da1:	66 0f 6f 05 d7 4d f3 	movdqa xmm0,XMMWORD PTR [rip+0xf34dd7]        # 0x141785b80
   140850da8:	00 
   140850da9:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   140850dae:	0f 10 05 33 b9 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5b933]        # 0x1416ac6e8
   140850db5:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   140850db8:	8b 0d 3a b9 e5 00    	mov    ecx,DWORD PTR [rip+0xe5b93a]        # 0x1416ac6f8
   140850dbe:	89 48 10             	mov    DWORD PTR [rax+0x10],ecx
   140850dc1:	0f b7 0d 34 b9 e5 00 	movzx  ecx,WORD PTR [rip+0xe5b934]        # 0x1416ac6fc
   140850dc8:	66 89 48 14          	mov    WORD PTR [rax+0x14],cx
   140850dcc:	c6 40 16 00          	mov    BYTE PTR [rax+0x16],0x0
   140850dd0:	45 33 c9             	xor    r9d,r9d
   140850dd3:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850dd7:	48 8d 0d 02 35 df 01 	lea    rcx,[rip+0x1df3502]        # 0x1426442e0
   140850dde:	e8 bd 5b 28 00       	call   0x140ad69a0
   140850de3:	90                   	nop
   140850de4:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850de8:	e8 f3 e9 81 ff       	call   0x14006f7e0
   140850ded:	e9 42 fc ff ff       	jmp    0x140850a34
   140850df2:	c7 05 70 35 df 01 03 	mov    DWORD PTR [rip+0x1df3570],0x1010003        # 0x14264436c
   140850df9:	00 01 01 
   140850dfc:	0f 57 c0             	xorps  xmm0,xmm0
   140850dff:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850e03:	b9 20 00 00 00       	mov    ecx,0x20
   140850e08:	e8 53 f9 81 ff       	call   0x140070760
   140850e0d:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140850e11:	66 0f 6f 05 97 4d f3 	movdqa xmm0,XMMWORD PTR [rip+0xf34d97]        # 0x141785bb0
   140850e18:	00 
   140850e19:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   140850e1e:	0f 10 05 a3 b8 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5b8a3]        # 0x1416ac6c8
   140850e25:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   140850e28:	f2 0f 10 05 a8 b8 e5 	movsd  xmm0,QWORD PTR [rip+0xe5b8a8]        # 0x1416ac6d8
   140850e2f:	00 
   140850e30:	f2 0f 11 40 10       	movsd  QWORD PTR [rax+0x10],xmm0
   140850e35:	0f b6 0d a4 b8 e5 00 	movzx  ecx,BYTE PTR [rip+0xe5b8a4]        # 0x1416ac6e0
   140850e3c:	88 48 18             	mov    BYTE PTR [rax+0x18],cl
   140850e3f:	c6 40 19 00          	mov    BYTE PTR [rax+0x19],0x0
   140850e43:	45 33 c9             	xor    r9d,r9d
   140850e46:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850e4a:	48 8d 0d 8f 34 df 01 	lea    rcx,[rip+0x1df348f]        # 0x1426442e0
   140850e51:	e8 4a 5b 28 00       	call   0x140ad69a0
   140850e56:	90                   	nop
   140850e57:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850e5b:	e8 80 e9 81 ff       	call   0x14006f7e0
   140850e60:	e9 cf fb ff ff       	jmp    0x140850a34
   140850e65:	c7 05 fd 34 df 01 03 	mov    DWORD PTR [rip+0x1df34fd],0x1010003        # 0x14264436c
   140850e6c:	00 01 01 
   140850e6f:	0f 57 c0             	xorps  xmm0,xmm0
   140850e72:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850e76:	b9 20 00 00 00       	mov    ecx,0x20
   140850e7b:	e8 e0 f8 81 ff       	call   0x140070760
   140850e80:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140850e84:	66 0f 6f 05 a4 4c f3 	movdqa xmm0,XMMWORD PTR [rip+0xf34ca4]        # 0x141785b30
   140850e8b:	00 
   140850e8c:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   140850e91:	0f 10 05 78 b8 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5b878]        # 0x1416ac710
   140850e98:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   140850e9b:	0f b6 0d 7e b8 e5 00 	movzx  ecx,BYTE PTR [rip+0xe5b87e]        # 0x1416ac720
   140850ea2:	88 48 10             	mov    BYTE PTR [rax+0x10],cl
   140850ea5:	c6 40 11 00          	mov    BYTE PTR [rax+0x11],0x0
   140850ea9:	45 33 c9             	xor    r9d,r9d
   140850eac:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850eb0:	48 8d 0d 29 34 df 01 	lea    rcx,[rip+0x1df3429]        # 0x1426442e0
   140850eb7:	e8 e4 5a 28 00       	call   0x140ad69a0
   140850ebc:	90                   	nop
   140850ebd:	e9 37 fb ff ff       	jmp    0x1408509f9
   140850ec2:	c7 05 a0 34 df 01 02 	mov    DWORD PTR [rip+0x1df34a0],0x1010002        # 0x14264436c
   140850ec9:	00 01 01 
   140850ecc:	0f 57 c0             	xorps  xmm0,xmm0
   140850ecf:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850ed3:	66 0f 6f 0d c5 4b f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34bc5]        # 0x141785aa0
   140850eda:	00 
   140850edb:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850ee0:	48 b8 43 6c 69 6d 62 	movabs rax,0x676e69626d696c43
   140850ee7:	69 6e 67 
   140850eea:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140850eee:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   140850ef2:	45 33 c9             	xor    r9d,r9d
   140850ef5:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850ef9:	48 8d 0d e0 33 df 01 	lea    rcx,[rip+0x1df33e0]        # 0x1426442e0
   140850f00:	e8 9b 5a 28 00       	call   0x140ad69a0
   140850f05:	90                   	nop
   140850f06:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850f0a:	e8 d1 e8 81 ff       	call   0x14006f7e0
   140850f0f:	e9 20 fb ff ff       	jmp    0x140850a34
   140850f14:	c7 05 4e 34 df 01 04 	mov    DWORD PTR [rip+0x1df344e],0x1010004        # 0x14264436c
   140850f1b:	00 01 01 
   140850f1e:	0f 57 c0             	xorps  xmm0,xmm0
   140850f21:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850f25:	66 0f 6f 0d c3 4b f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34bc3]        # 0x141785af0
   140850f2c:	00 
   140850f2d:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850f32:	f2 0f 10 05 c6 b7 e5 	movsd  xmm0,QWORD PTR [rip+0xe5b7c6]        # 0x1416ac700
   140850f39:	00 
   140850f3a:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140850f3f:	8b 05 c3 b7 e5 00    	mov    eax,DWORD PTR [rip+0xe5b7c3]        # 0x1416ac708
   140850f45:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140850f48:	0f b6 05 bd b7 e5 00 	movzx  eax,BYTE PTR [rip+0xe5b7bd]        # 0x1416ac70c
   140850f4f:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
   140850f52:	c6 45 d4 00          	mov    BYTE PTR [rbp-0x2c],0x0
   140850f56:	45 33 c9             	xor    r9d,r9d
   140850f59:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850f5d:	48 8d 0d 7c 33 df 01 	lea    rcx,[rip+0x1df337c]        # 0x1426442e0
   140850f64:	e8 37 5a 28 00       	call   0x140ad69a0
   140850f69:	90                   	nop
   140850f6a:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140850f6e:	e8 6d e8 81 ff       	call   0x14006f7e0
   140850f73:	e9 bc fa ff ff       	jmp    0x140850a34
   140850f78:	c7 05 ea 33 df 01 03 	mov    DWORD PTR [rip+0x1df33ea],0x1010003        # 0x14264436c
   140850f7f:	00 01 01 
   140850f82:	0f 57 c0             	xorps  xmm0,xmm0
   140850f85:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140850f89:	66 0f 6f 0d ff 4a f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34aff]        # 0x141785a90
   140850f90:	00 
   140850f91:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140850f96:	48 8b 05 33 b6 e5 00 	mov    rax,QWORD PTR [rip+0xe5b633]        # 0x1416ac5d0
   140850f9d:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   140850fa0:	0f b7 05 2d b6 e5 00 	movzx  eax,WORD PTR [rip+0xe5b62d]        # 0x1416ac5d4
   140850fa7:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   140850fab:	0f b6 05 24 b6 e5 00 	movzx  eax,BYTE PTR [rip+0xe5b624]        # 0x1416ac5d6
   140850fb2:	88 45 cd             	mov    BYTE PTR [rbp-0x33],al
   140850fb5:	c6 45 ce 00          	mov    BYTE PTR [rbp-0x32],0x0
   140850fb9:	45 33 c9             	xor    r9d,r9d
   140850fbc:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140850fc0:	48 8d 0d 19 33 df 01 	lea    rcx,[rip+0x1df3319]        # 0x1426442e0
   140850fc7:	e8 d4 59 28 00       	call   0x140ad69a0
   140850fcc:	90                   	nop
   140850fcd:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   140850fd1:	48 83 fa 0f          	cmp    rdx,0xf
   140850fd5:	0f 86 59 fa ff ff    	jbe    0x140850a34
   140850fdb:	48 ff c2             	inc    rdx
   140850fde:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   140850fe2:	48 8b c1             	mov    rax,rcx
   140850fe5:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140850fec:	0f 82 3d fa ff ff    	jb     0x140850a2f
   140850ff2:	48 83 c2 27          	add    rdx,0x27
   140850ff6:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   140850ffa:	48 2b c1             	sub    rax,rcx
   140850ffd:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   140851001:	48 83 f8 1f          	cmp    rax,0x1f
   140851005:	0f 86 24 fa ff ff    	jbe    0x140850a2f
   14085100b:	ff 15 8f fa d8 00    	call   QWORD PTR [rip+0xd8fa8f]        # 0x1415e0aa0
   140851011:	cc                   	int3
   140851012:	c7 05 50 33 df 01 03 	mov    DWORD PTR [rip+0x1df3350],0x1010003        # 0x14264436c
   140851019:	00 01 01 
   14085101c:	0f 57 c0             	xorps  xmm0,xmm0
   14085101f:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140851023:	66 0f 6f 0d 65 4a f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34a65]        # 0x141785a90
   14085102a:	00 
   14085102b:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140851030:	48 8b 05 91 b5 e5 00 	mov    rax,QWORD PTR [rip+0xe5b591]        # 0x1416ac5c8
   140851037:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   14085103a:	0f b7 05 8b b5 e5 00 	movzx  eax,WORD PTR [rip+0xe5b58b]        # 0x1416ac5cc
   140851041:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   140851045:	0f b6 05 82 b5 e5 00 	movzx  eax,BYTE PTR [rip+0xe5b582]        # 0x1416ac5ce
   14085104c:	88 45 cd             	mov    BYTE PTR [rbp-0x33],al
   14085104f:	c6 45 ce 00          	mov    BYTE PTR [rbp-0x32],0x0
   140851053:	45 33 c9             	xor    r9d,r9d
   140851056:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085105a:	48 8d 0d 7f 32 df 01 	lea    rcx,[rip+0x1df327f]        # 0x1426442e0
   140851061:	e8 3a 59 28 00       	call   0x140ad69a0
   140851066:	90                   	nop
   140851067:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085106b:	e8 70 e7 81 ff       	call   0x14006f7e0
   140851070:	e9 bf f9 ff ff       	jmp    0x140850a34
   140851075:	c7 05 ed 32 df 01 06 	mov    DWORD PTR [rip+0x1df32ed],0x1010006        # 0x14264436c
   14085107c:	00 01 01 
   14085107f:	0f 57 c0             	xorps  xmm0,xmm0
   140851082:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140851086:	66 0f 6f 0d 12 4a f3 	movdqa xmm1,XMMWORD PTR [rip+0xf34a12]        # 0x141785aa0
   14085108d:	00 
   14085108e:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140851093:	48 b8 50 61 72 72 79 	movabs rax,0x676e697972726150
   14085109a:	69 6e 67 
   14085109d:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   1408510a1:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   1408510a5:	45 33 c9             	xor    r9d,r9d
   1408510a8:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408510ac:	48 8d 0d 2d 32 df 01 	lea    rcx,[rip+0x1df322d]        # 0x1426442e0
   1408510b3:	e8 e8 58 28 00       	call   0x140ad69a0
   1408510b8:	90                   	nop
   1408510b9:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408510bd:	e8 1e e7 81 ff       	call   0x14006f7e0
   1408510c2:	e9 6d f9 ff ff       	jmp    0x140850a34
   1408510c7:	c7 05 9b 32 df 01 06 	mov    DWORD PTR [rip+0x1df329b],0x1010006        # 0x14264436c
   1408510ce:	00 01 01 
   1408510d1:	0f 57 c0             	xorps  xmm0,xmm0
   1408510d4:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408510d8:	66 0f 6f 0d c0 49 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf349c0]        # 0x141785aa0
   1408510df:	00 
   1408510e0:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408510e5:	48 b8 42 6c 6f 63 6b 	movabs rax,0x676e696b636f6c42
   1408510ec:	69 6e 67 
   1408510ef:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   1408510f3:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   1408510f7:	45 33 c9             	xor    r9d,r9d
   1408510fa:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408510fe:	48 8d 0d db 31 df 01 	lea    rcx,[rip+0x1df31db]        # 0x1426442e0
   140851105:	e8 96 58 28 00       	call   0x140ad69a0
   14085110a:	90                   	nop
   14085110b:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085110f:	e8 cc e6 81 ff       	call   0x14006f7e0
   140851114:	e9 1b f9 ff ff       	jmp    0x140850a34
   140851119:	c7 05 49 32 df 01 03 	mov    DWORD PTR [rip+0x1df3249],0x1010003        # 0x14264436c
   140851120:	00 01 01 
   140851123:	0f 57 c0             	xorps  xmm0,xmm0
   140851126:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   14085112a:	66 0f 6f 0d 5e 49 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3495e]        # 0x141785a90
   140851131:	00 
   140851132:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140851137:	48 8b 05 aa f1 e4 00 	mov    rax,QWORD PTR [rip+0xe4f1aa]        # 0x1416a02e8
   14085113e:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   140851141:	0f b7 05 a4 f1 e4 00 	movzx  eax,WORD PTR [rip+0xe4f1a4]        # 0x1416a02ec
   140851148:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   14085114c:	0f b6 05 9b f1 e4 00 	movzx  eax,BYTE PTR [rip+0xe4f19b]        # 0x1416a02ee
   140851153:	88 45 cd             	mov    BYTE PTR [rbp-0x33],al
   140851156:	c6 45 ce 00          	mov    BYTE PTR [rbp-0x32],0x0
   14085115a:	45 33 c9             	xor    r9d,r9d
   14085115d:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140851161:	48 8d 0d 78 31 df 01 	lea    rcx,[rip+0x1df3178]        # 0x1426442e0
   140851168:	e8 33 58 28 00       	call   0x140ad69a0
   14085116d:	90                   	nop
   14085116e:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140851172:	e8 69 e6 81 ff       	call   0x14006f7e0
   140851177:	0f b7 7b 08          	movzx  edi,WORD PTR [rbx+0x8]
   14085117b:	44 0f b7 7b 0a       	movzx  r15d,WORD PTR [rbx+0xa]
   140851180:	44 0f b7 73 0c       	movzx  r14d,WORD PTR [rbx+0xc]
   140851185:	0f b7 73 14          	movzx  esi,WORD PTR [rbx+0x14]
   140851189:	44 0f b7 63 16       	movzx  r12d,WORD PTR [rbx+0x16]
   14085118e:	0f b7 5b 18          	movzx  ebx,WORD PTR [rbx+0x18]
   140851192:	0f 57 c0             	xorps  xmm0,xmm0
   140851195:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140851199:	66 0f 6f 0d 8f 48 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3488f]        # 0x141785a30
   1408511a0:	00 
   1408511a1:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408511a6:	66 c7 45 c7 20 00    	mov    WORD PTR [rbp-0x39],0x20
   1408511ac:	45 33 c9             	xor    r9d,r9d
   1408511af:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408511b3:	48 8d 0d 26 31 df 01 	lea    rcx,[rip+0x1df3126]        # 0x1426442e0
   1408511ba:	e8 e1 57 28 00       	call   0x140ad69a0
   1408511bf:	90                   	nop
   1408511c0:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408511c4:	e8 17 e6 81 ff       	call   0x14006f7e0
   1408511c9:	66 45 3b fc          	cmp    r15w,r12w
   1408511cd:	0f 8d eb 00 00 00    	jge    0x1408512be
   1408511d3:	66 3b fe             	cmp    di,si
   1408511d6:	7d 31                	jge    0x140851209
   1408511d8:	48 8d 15 19 0a df 00 	lea    rdx,[rip+0xdf0a19]        # 0x141641bf8
   1408511df:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408511e3:	e8 f8 6e 81 ff       	call   0x1400680e0
   1408511e8:	90                   	nop
   1408511e9:	45 33 c9             	xor    r9d,r9d
   1408511ec:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408511f0:	48 8d 0d e9 30 df 01 	lea    rcx,[rip+0x1df30e9]        # 0x1426442e0
   1408511f7:	e8 a4 57 28 00       	call   0x140ad69a0
   1408511fc:	90                   	nop
   1408511fd:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851201:	e8 da e5 81 ff       	call   0x14006f7e0
   140851206:	66 3b fe             	cmp    di,si
   140851209:	7e 2e                	jle    0x140851239
   14085120b:	48 8d 15 66 0a df 00 	lea    rdx,[rip+0xdf0a66]        # 0x141641c78
   140851212:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851216:	e8 c5 6e 81 ff       	call   0x1400680e0
   14085121b:	90                   	nop
   14085121c:	45 33 c9             	xor    r9d,r9d
   14085121f:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140851223:	48 8d 0d b6 30 df 01 	lea    rcx,[rip+0x1df30b6]        # 0x1426442e0
   14085122a:	e8 71 57 28 00       	call   0x140ad69a0
   14085122f:	90                   	nop
   140851230:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851234:	e8 a7 e5 81 ff       	call   0x14006f7e0
   140851239:	66 3b fe             	cmp    di,si
   14085123c:	75 2e                	jne    0x14085126c
   14085123e:	48 8d 15 ff 57 de 00 	lea    rdx,[rip+0xde57ff]        # 0x141636a44
   140851245:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851249:	e8 92 6e 81 ff       	call   0x1400680e0
   14085124e:	90                   	nop
   14085124f:	45 33 c9             	xor    r9d,r9d
   140851252:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140851256:	48 8d 0d 83 30 df 01 	lea    rcx,[rip+0x1df3083]        # 0x1426442e0
   14085125d:	e8 3e 57 28 00       	call   0x140ad69a0
   140851262:	90                   	nop
   140851263:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851267:	e8 74 e5 81 ff       	call   0x14006f7e0
   14085126c:	66 41 3b de          	cmp    bx,r14w
   140851270:	0f 8e c7 01 00 00    	jle    0x14085143d
   140851276:	0f 57 c0             	xorps  xmm0,xmm0
   140851279:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   14085127d:	66 0f 6f 0d 1b 48 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3481b]        # 0x141785aa0
   140851284:	00 
   140851285:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   14085128a:	48 b8 20 28 61 62 6f 	movabs rax,0x2965766f62612820
   140851291:	76 65 29 
   140851294:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140851298:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   14085129c:	45 33 c9             	xor    r9d,r9d
   14085129f:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408512a3:	48 8d 0d 36 30 df 01 	lea    rcx,[rip+0x1df3036]        # 0x1426442e0
   1408512aa:	e8 f1 56 28 00       	call   0x140ad69a0
   1408512af:	90                   	nop
   1408512b0:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408512b4:	e8 27 e5 81 ff       	call   0x14006f7e0
   1408512b9:	e9 76 f7 ff ff       	jmp    0x140850a34
   1408512be:	0f 8e 99 00 00 00    	jle    0x14085135d
   1408512c4:	66 3b fe             	cmp    di,si
   1408512c7:	7d 31                	jge    0x1408512fa
   1408512c9:	48 8d 15 98 09 df 00 	lea    rdx,[rip+0xdf0998]        # 0x141641c68
   1408512d0:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408512d4:	e8 07 6e 81 ff       	call   0x1400680e0
   1408512d9:	90                   	nop
   1408512da:	45 33 c9             	xor    r9d,r9d
   1408512dd:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408512e1:	48 8d 0d f8 2f df 01 	lea    rcx,[rip+0x1df2ff8]        # 0x1426442e0
   1408512e8:	e8 b3 56 28 00       	call   0x140ad69a0
   1408512ed:	90                   	nop
   1408512ee:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408512f2:	e8 e9 e4 81 ff       	call   0x14006f7e0
   1408512f7:	66 3b fe             	cmp    di,si
   1408512fa:	7e 2e                	jle    0x14085132a
   1408512fc:	48 8d 15 55 09 df 00 	lea    rdx,[rip+0xdf0955]        # 0x141641c58
   140851303:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851307:	e8 d4 6d 81 ff       	call   0x1400680e0
   14085130c:	90                   	nop
   14085130d:	45 33 c9             	xor    r9d,r9d
   140851310:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140851314:	48 8d 0d c5 2f df 01 	lea    rcx,[rip+0x1df2fc5]        # 0x1426442e0
   14085131b:	e8 80 56 28 00       	call   0x140ad69a0
   140851320:	90                   	nop
   140851321:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851325:	e8 b6 e4 81 ff       	call   0x14006f7e0
   14085132a:	66 3b fe             	cmp    di,si
   14085132d:	0f 85 39 ff ff ff    	jne    0x14085126c
   140851333:	48 8d 15 02 57 de 00 	lea    rdx,[rip+0xde5702]        # 0x141636a3c
   14085133a:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085133e:	e8 9d 6d 81 ff       	call   0x1400680e0
   140851343:	90                   	nop
   140851344:	45 33 c9             	xor    r9d,r9d
   140851347:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   14085134b:	48 8d 0d 8e 2f df 01 	lea    rcx,[rip+0x1df2f8e]        # 0x1426442e0
   140851352:	e8 49 56 28 00       	call   0x140ad69a0
   140851357:	90                   	nop
   140851358:	e9 06 ff ff ff       	jmp    0x140851263
   14085135d:	0f 85 09 ff ff ff    	jne    0x14085126c
   140851363:	66 3b fe             	cmp    di,si
   140851366:	7d 31                	jge    0x140851399
   140851368:	48 8d 15 bd 56 de 00 	lea    rdx,[rip+0xde56bd]        # 0x141636a2c
   14085136f:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851373:	e8 68 6d 81 ff       	call   0x1400680e0
   140851378:	90                   	nop
   140851379:	45 33 c9             	xor    r9d,r9d
   14085137c:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140851380:	48 8d 0d 59 2f df 01 	lea    rcx,[rip+0x1df2f59]        # 0x1426442e0
   140851387:	e8 14 56 28 00       	call   0x140ad69a0
   14085138c:	90                   	nop
   14085138d:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851391:	e8 4a e4 81 ff       	call   0x14006f7e0
   140851396:	66 3b fe             	cmp    di,si
   140851399:	7e 2a                	jle    0x1408513c5
   14085139b:	48 8d 15 92 56 de 00 	lea    rdx,[rip+0xde5692]        # 0x141636a34
   1408513a2:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408513a6:	e8 35 6d 81 ff       	call   0x1400680e0
   1408513ab:	90                   	nop
   1408513ac:	45 33 c9             	xor    r9d,r9d
   1408513af:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408513b3:	48 8d 0d 26 2f df 01 	lea    rcx,[rip+0x1df2f26]        # 0x1426442e0
   1408513ba:	e8 e1 55 28 00       	call   0x140ad69a0
   1408513bf:	90                   	nop
   1408513c0:	e9 9e fe ff ff       	jmp    0x140851263
   1408513c5:	0f 85 a1 fe ff ff    	jne    0x14085126c
   1408513cb:	66 41 3b de          	cmp    bx,r14w
   1408513cf:	7e 33                	jle    0x140851404
   1408513d1:	48 8d 15 80 b3 e5 00 	lea    rdx,[rip+0xe5b380]        # 0x1416ac758
   1408513d8:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408513dc:	e8 ff 6c 81 ff       	call   0x1400680e0
   1408513e1:	90                   	nop
   1408513e2:	45 33 c9             	xor    r9d,r9d
   1408513e5:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408513e9:	48 8d 0d f0 2e df 01 	lea    rcx,[rip+0x1df2ef0]        # 0x1426442e0
   1408513f0:	e8 ab 55 28 00       	call   0x140ad69a0
   1408513f5:	90                   	nop
   1408513f6:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408513fa:	e8 e1 e3 81 ff       	call   0x14006f7e0
   1408513ff:	e9 30 f6 ff ff       	jmp    0x140850a34
   140851404:	0f 8d 2a f6 ff ff    	jge    0x140850a34
   14085140a:	48 8d 15 6f b3 e5 00 	lea    rdx,[rip+0xe5b36f]        # 0x1416ac780
   140851411:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851415:	e8 c6 6c 81 ff       	call   0x1400680e0
   14085141a:	90                   	nop
   14085141b:	45 33 c9             	xor    r9d,r9d
   14085141e:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140851422:	48 8d 0d b7 2e df 01 	lea    rcx,[rip+0x1df2eb7]        # 0x1426442e0
   140851429:	e8 72 55 28 00       	call   0x140ad69a0
   14085142e:	90                   	nop
   14085142f:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851433:	e8 a8 e3 81 ff       	call   0x14006f7e0
   140851438:	e9 f7 f5 ff ff       	jmp    0x140850a34
   14085143d:	0f 8d f1 f5 ff ff    	jge    0x140850a34
   140851443:	48 8d 15 16 b3 e5 00 	lea    rdx,[rip+0xe5b316]        # 0x1416ac760
   14085144a:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085144e:	e8 8d 6c 81 ff       	call   0x1400680e0
   140851453:	90                   	nop
   140851454:	45 33 c9             	xor    r9d,r9d
   140851457:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   14085145b:	48 8d 0d 7e 2e df 01 	lea    rcx,[rip+0x1df2e7e]        # 0x1426442e0
   140851462:	e8 39 55 28 00       	call   0x140ad69a0
   140851467:	90                   	nop
   140851468:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085146c:	e8 6f e3 81 ff       	call   0x14006f7e0
   140851471:	e9 be f5 ff ff       	jmp    0x140850a34
   140851476:	c7 05 ec 2e df 01 03 	mov    DWORD PTR [rip+0x1df2eec],0x1010003        # 0x14264436c
   14085147d:	00 01 01 
   140851480:	0f 57 c0             	xorps  xmm0,xmm0
   140851483:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140851487:	0f 57 c9             	xorps  xmm1,xmm1
   14085148a:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   14085148f:	b9 20 00 00 00       	mov    ecx,0x20
   140851494:	e8 c7 f2 81 ff       	call   0x140070760
   140851499:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   14085149d:	66 0f 6f 05 1b 47 f3 	movdqa xmm0,XMMWORD PTR [rip+0xf3471b]        # 0x141785bc0
   1408514a4:	00 
   1408514a5:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   1408514aa:	0f 10 05 df b0 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5b0df]        # 0x1416ac590
   1408514b1:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   1408514b4:	f2 0f 10 05 e4 b0 e5 	movsd  xmm0,QWORD PTR [rip+0xe5b0e4]        # 0x1416ac5a0
   1408514bb:	00 
   1408514bc:	f2 0f 11 40 10       	movsd  QWORD PTR [rax+0x10],xmm0
   1408514c1:	0f b7 0d e0 b0 e5 00 	movzx  ecx,WORD PTR [rip+0xe5b0e0]        # 0x1416ac5a8
   1408514c8:	66 89 48 18          	mov    WORD PTR [rax+0x18],cx
   1408514cc:	c6 40 1a 00          	mov    BYTE PTR [rax+0x1a],0x0
   1408514d0:	44 8b 53 0c          	mov    r10d,DWORD PTR [rbx+0xc]
   1408514d4:	41 83 fa ff          	cmp    r10d,0xffffffff
   1408514d8:	0f 84 99 00 00 00    	je     0x140851577
   1408514de:	4c 8b 05 63 de b8 01 	mov    r8,QWORD PTR [rip+0x1b8de63]        # 0x1423df348
   1408514e5:	4c 8b 1d 54 de b8 01 	mov    r11,QWORD PTR [rip+0x1b8de54]        # 0x1423df340
   1408514ec:	4d 2b c3             	sub    r8,r11
   1408514ef:	49 c1 f8 03          	sar    r8,0x3
   1408514f3:	33 ff                	xor    edi,edi
   1408514f5:	45 85 c0             	test   r8d,r8d
   1408514f8:	74 2f                	je     0x140851529
   1408514fa:	8b d7                	mov    edx,edi
   1408514fc:	41 83 e8 01          	sub    r8d,0x1
   140851500:	78 27                	js     0x140851529
   140851502:	42 8d 0c 02          	lea    ecx,[rdx+r8*1]
   140851506:	d1 f9                	sar    ecx,1
   140851508:	48 63 c1             	movsxd rax,ecx
   14085150b:	49 8b 1c c3          	mov    rbx,QWORD PTR [r11+rax*8]
   14085150f:	44 39 53 1c          	cmp    DWORD PTR [rbx+0x1c],r10d
   140851513:	74 17                	je     0x14085152c
   140851515:	8d 41 01             	lea    eax,[rcx+0x1]
   140851518:	0f 4e d0             	cmovle edx,eax
   14085151b:	8d 41 ff             	lea    eax,[rcx-0x1]
   14085151e:	41 0f 4e c0          	cmovle eax,r8d
   140851522:	44 8b c0             	mov    r8d,eax
   140851525:	3b d0                	cmp    edx,eax
   140851527:	7e d9                	jle    0x140851502
   140851529:	48 8b df             	mov    rbx,rdi
   14085152c:	48 85 db             	test   rbx,rbx
   14085152f:	74 46                	je     0x140851577
   140851531:	48 8d 15 58 80 d9 00 	lea    rdx,[rip+0xd98058]        # 0x1415e9590
   140851538:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085153c:	e8 af df 81 ff       	call   0x14006f4f0
   140851541:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851545:	e8 d6 e0 81 ff       	call   0x14006f620
   14085154a:	90                   	nop
   14085154b:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140851551:	45 33 c0             	xor    r8d,r8d
   140851554:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140851558:	48 8b cb             	mov    rcx,rbx
   14085155b:	e8 30 0f 41 00       	call   0x140c62490
   140851560:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140851564:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140851568:	e8 33 87 86 ff       	call   0x1400b9ca0
   14085156d:	90                   	nop
   14085156e:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140851572:	e8 69 e2 81 ff       	call   0x14006f7e0
   140851577:	45 33 c9             	xor    r9d,r9d
   14085157a:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085157e:	48 8d 0d 5b 2d df 01 	lea    rcx,[rip+0x1df2d5b]        # 0x1426442e0
   140851585:	e8 16 54 28 00       	call   0x140ad69a0
   14085158a:	90                   	nop
   14085158b:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085158f:	e8 4c e2 81 ff       	call   0x14006f7e0
   140851594:	e9 9b f4 ff ff       	jmp    0x140850a34
   140851599:	c7 05 c9 2d df 01 06 	mov    DWORD PTR [rip+0x1df2dc9],0x1000006        # 0x14264436c
   1408515a0:	00 00 01 
   1408515a3:	0f 57 c0             	xorps  xmm0,xmm0
   1408515a6:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408515aa:	66 0f 6f 0d 1e 45 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3451e]        # 0x141785ad0
   1408515b1:	00 
   1408515b2:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408515b7:	f2 0f 10 05 c1 af e5 	movsd  xmm0,QWORD PTR [rip+0xe5afc1]        # 0x1416ac580
   1408515be:	00 
   1408515bf:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   1408515c4:	0f b7 05 bd af e5 00 	movzx  eax,WORD PTR [rip+0xe5afbd]        # 0x1416ac588
   1408515cb:	66 89 45 cf          	mov    WORD PTR [rbp-0x31],ax
   1408515cf:	0f b6 05 b4 af e5 00 	movzx  eax,BYTE PTR [rip+0xe5afb4]        # 0x1416ac58a
   1408515d6:	88 45 d1             	mov    BYTE PTR [rbp-0x2f],al
   1408515d9:	c6 45 d2 00          	mov    BYTE PTR [rbp-0x2e],0x0
   1408515dd:	45 33 c9             	xor    r9d,r9d
   1408515e0:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408515e4:	48 8d 0d f5 2c df 01 	lea    rcx,[rip+0x1df2cf5]        # 0x1426442e0
   1408515eb:	e8 b0 53 28 00       	call   0x140ad69a0
   1408515f0:	90                   	nop
   1408515f1:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408515f5:	e8 e6 e1 81 ff       	call   0x14006f7e0
   1408515fa:	e9 35 f4 ff ff       	jmp    0x140850a34
   1408515ff:	c7 05 63 2d df 01 06 	mov    DWORD PTR [rip+0x1df2d63],0x1000006        # 0x14264436c
   140851606:	00 00 01 
   140851609:	0f 57 c0             	xorps  xmm0,xmm0
   14085160c:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140851610:	66 0f 6f 0d a8 44 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf344a8]        # 0x141785ac0
   140851617:	00 
   140851618:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   14085161d:	f2 0f 10 05 93 af e5 	movsd  xmm0,QWORD PTR [rip+0xe5af93]        # 0x1416ac5b8
   140851624:	00 
   140851625:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   14085162a:	0f b7 05 8f af e5 00 	movzx  eax,WORD PTR [rip+0xe5af8f]        # 0x1416ac5c0
   140851631:	66 89 45 cf          	mov    WORD PTR [rbp-0x31],ax
   140851635:	c6 45 d1 00          	mov    BYTE PTR [rbp-0x2f],0x0
   140851639:	45 33 c9             	xor    r9d,r9d
   14085163c:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140851640:	48 8d 0d 99 2c df 01 	lea    rcx,[rip+0x1df2c99]        # 0x1426442e0
   140851647:	e8 54 53 28 00       	call   0x140ad69a0
   14085164c:	90                   	nop
   14085164d:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140851651:	e8 8a e1 81 ff       	call   0x14006f7e0
   140851656:	e9 d9 f3 ff ff       	jmp    0x140850a34
   14085165b:	0f 57 c0             	xorps  xmm0,xmm0
   14085165e:	0f 11 45 07          	movups XMMWORD PTR [rbp+0x7],xmm0
   140851662:	33 ff                	xor    edi,edi
   140851664:	48 89 7d 17          	mov    QWORD PTR [rbp+0x17],rdi
   140851668:	be 0f 00 00 00       	mov    esi,0xf
   14085166d:	48 89 75 1f          	mov    QWORD PTR [rbp+0x1f],rsi
   140851671:	40 88 7d 07          	mov    BYTE PTR [rbp+0x7],dil
   140851675:	44 8b 53 0c          	mov    r10d,DWORD PTR [rbx+0xc]
   140851679:	4c 8b 05 c8 dc b8 01 	mov    r8,QWORD PTR [rip+0x1b8dcc8]        # 0x1423df348
   140851680:	4c 8b 1d b9 dc b8 01 	mov    r11,QWORD PTR [rip+0x1b8dcb9]        # 0x1423df340
   140851687:	4d 2b c3             	sub    r8,r11
   14085168a:	49 c1 f8 03          	sar    r8,0x3
   14085168e:	45 85 c0             	test   r8d,r8d
   140851691:	0f 84 7a 00 00 00    	je     0x140851711
   140851697:	41 83 fa ff          	cmp    r10d,0xffffffff
   14085169b:	0f 84 70 00 00 00    	je     0x140851711
   1408516a1:	41 83 e8 01          	sub    r8d,0x1
   1408516a5:	8b d7                	mov    edx,edi
   1408516a7:	78 2e                	js     0x1408516d7
   1408516a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1408516b0:	42 8d 0c 02          	lea    ecx,[rdx+r8*1]
   1408516b4:	d1 f9                	sar    ecx,1
   1408516b6:	48 63 c1             	movsxd rax,ecx
   1408516b9:	49 8b 1c c3          	mov    rbx,QWORD PTR [r11+rax*8]
   1408516bd:	44 39 53 1c          	cmp    DWORD PTR [rbx+0x1c],r10d
   1408516c1:	74 17                	je     0x1408516da
   1408516c3:	8d 41 01             	lea    eax,[rcx+0x1]
   1408516c6:	0f 4e d0             	cmovle edx,eax
   1408516c9:	8d 41 ff             	lea    eax,[rcx-0x1]
   1408516cc:	41 0f 4e c0          	cmovle eax,r8d
   1408516d0:	44 8b c0             	mov    r8d,eax
   1408516d3:	3b d0                	cmp    edx,eax
   1408516d5:	7e d9                	jle    0x1408516b0
   1408516d7:	48 8b df             	mov    rbx,rdi
   1408516da:	48 85 db             	test   rbx,rbx
   1408516dd:	74 32                	je     0x140851711
   1408516df:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1408516e2:	48 8b cb             	mov    rcx,rbx
   1408516e5:	ff 10                	call   QWORD PTR [rax]
   1408516e7:	66 83 f8 18          	cmp    ax,0x18
   1408516eb:	75 20                	jne    0x14085170d
   1408516ed:	48 8b 83 e8 00 00 00 	mov    rax,QWORD PTR [rbx+0xe8]
   1408516f4:	83 b8 cc 01 00 00 00 	cmp    DWORD PTR [rax+0x1cc],0x0
   1408516fb:	75 10                	jne    0x14085170d
   1408516fd:	48 8d 15 ac ae e5 00 	lea    rdx,[rip+0xe5aeac]        # 0x1416ac5b0
   140851704:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140851708:	e8 03 de 81 ff       	call   0x14006f510
   14085170d:	48 8b 75 1f          	mov    rsi,QWORD PTR [rbp+0x1f]
   140851711:	48 83 7d 17 00       	cmp    QWORD PTR [rbp+0x17],0x0
   140851716:	0f 85 dd 00 00 00    	jne    0x1408517f9
   14085171c:	48 83 fe 07          	cmp    rsi,0x7
   140851720:	72 33                	jb     0x140851755
   140851722:	48 8d 5d 07          	lea    rbx,[rbp+0x7]
   140851726:	48 83 fe 0f          	cmp    rsi,0xf
   14085172a:	48 0f 47 5d 07       	cmova  rbx,QWORD PTR [rbp+0x7]
   14085172f:	48 c7 45 17 07 00 00 	mov    QWORD PTR [rbp+0x17],0x7
   140851736:	00 
   140851737:	41 b8 07 00 00 00    	mov    r8d,0x7
   14085173d:	48 8d 15 74 5c dd 00 	lea    rdx,[rip+0xdd5c74]        # 0x1416273b8
   140851744:	48 8b cb             	mov    rcx,rbx
   140851747:	e8 3e 46 ce 00       	call   0x141535d8a
   14085174c:	c6 43 07 00          	mov    BYTE PTR [rbx+0x7],0x0
   140851750:	e9 a4 00 00 00       	jmp    0x1408517f9
   140851755:	48 8b ce             	mov    rcx,rsi
   140851758:	48 d1 e9             	shr    rcx,1
   14085175b:	48 bb ff ff ff ff ff 	movabs rbx,0x7fffffffffffffff
   140851762:	ff ff 7f 
   140851765:	48 8b c3             	mov    rax,rbx
   140851768:	48 2b c1             	sub    rax,rcx
   14085176b:	48 3b f0             	cmp    rsi,rax
   14085176e:	77 10                	ja     0x140851780
   140851770:	48 8d 04 0e          	lea    rax,[rsi+rcx*1]
   140851774:	bb 0f 00 00 00       	mov    ebx,0xf
   140851779:	48 3b c3             	cmp    rax,rbx
   14085177c:	48 0f 47 d8          	cmova  rbx,rax
   140851780:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   140851784:	e8 d7 ef 81 ff       	call   0x140070760
   140851789:	48 8b f8             	mov    rdi,rax
   14085178c:	48 c7 45 17 07 00 00 	mov    QWORD PTR [rbp+0x17],0x7
   140851793:	00 
   140851794:	48 89 5d 1f          	mov    QWORD PTR [rbp+0x1f],rbx
   140851798:	48 8b 0d 19 5c dd 00 	mov    rcx,QWORD PTR [rip+0xdd5c19]        # 0x1416273b8
   14085179f:	89 08                	mov    DWORD PTR [rax],ecx
   1408517a1:	0f b7 0d 14 5c dd 00 	movzx  ecx,WORD PTR [rip+0xdd5c14]        # 0x1416273bc
   1408517a8:	66 89 48 04          	mov    WORD PTR [rax+0x4],cx
   1408517ac:	0f b6 0d 0b 5c dd 00 	movzx  ecx,BYTE PTR [rip+0xdd5c0b]        # 0x1416273be
   1408517b3:	88 48 06             	mov    BYTE PTR [rax+0x6],cl
   1408517b6:	c6 40 07 00          	mov    BYTE PTR [rax+0x7],0x0
   1408517ba:	48 83 fe 0f          	cmp    rsi,0xf
   1408517be:	76 35                	jbe    0x1408517f5
   1408517c0:	48 8d 56 01          	lea    rdx,[rsi+0x1]
   1408517c4:	48 8b 4d 07          	mov    rcx,QWORD PTR [rbp+0x7]
   1408517c8:	48 8b c1             	mov    rax,rcx
   1408517cb:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1408517d2:	72 1c                	jb     0x1408517f0
   1408517d4:	48 83 c2 27          	add    rdx,0x27
   1408517d8:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1408517dc:	48 2b c1             	sub    rax,rcx
   1408517df:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1408517e3:	48 83 f8 1f          	cmp    rax,0x1f
   1408517e7:	76 07                	jbe    0x1408517f0
   1408517e9:	ff 15 b1 f2 d8 00    	call   QWORD PTR [rip+0xd8f2b1]        # 0x1415e0aa0
   1408517ef:	cc                   	int3
   1408517f0:	e8 fb 2d ce 00       	call   0x1415345f0
   1408517f5:	48 89 7d 07          	mov    QWORD PTR [rbp+0x7],rdi
   1408517f9:	41 b8 05 00 00 00    	mov    r8d,0x5
   1408517ff:	48 8d 15 5e a8 e5 00 	lea    rdx,[rip+0xe5a85e]        # 0x1416ac064
   140851806:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085180a:	e8 91 e1 81 ff       	call   0x14006f9a0
   14085180f:	c7 05 53 2b df 01 06 	mov    DWORD PTR [rip+0x1df2b53],0x1010006        # 0x14264436c
   140851816:	00 01 01 
   140851819:	45 33 c9             	xor    r9d,r9d
   14085181c:	48 8d 55 07          	lea    rdx,[rbp+0x7]
   140851820:	48 8d 0d b9 2a df 01 	lea    rcx,[rip+0x1df2ab9]        # 0x1426442e0
   140851827:	e8 74 51 28 00       	call   0x140ad69a0
   14085182c:	90                   	nop
   14085182d:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140851831:	e8 aa df 81 ff       	call   0x14006f7e0
   140851836:	e9 f9 f1 ff ff       	jmp    0x140850a34
   14085183b:	c7 05 27 2b df 01 04 	mov    DWORD PTR [rip+0x1df2b27],0x1010004        # 0x14264436c
   140851842:	00 01 01 
   140851845:	0f 57 c0             	xorps  xmm0,xmm0
   140851848:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   14085184c:	66 0f 6f 0d bc 42 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf342bc]        # 0x141785b10
   140851853:	00 
   140851854:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140851859:	f2 0f 10 05 c7 ad e5 	movsd  xmm0,QWORD PTR [rip+0xe5adc7]        # 0x1416ac628
   140851860:	00 
   140851861:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140851866:	8b 05 c4 ad e5 00    	mov    eax,DWORD PTR [rip+0xe5adc4]        # 0x1416ac630
   14085186c:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   14085186f:	0f b7 05 be ad e5 00 	movzx  eax,WORD PTR [rip+0xe5adbe]        # 0x1416ac634
   140851876:	66 89 45 d3          	mov    WORD PTR [rbp-0x2d],ax
   14085187a:	0f b6 05 b5 ad e5 00 	movzx  eax,BYTE PTR [rip+0xe5adb5]        # 0x1416ac636
   140851881:	88 45 d5             	mov    BYTE PTR [rbp-0x2b],al
   140851884:	c6 45 d6 00          	mov    BYTE PTR [rbp-0x2a],0x0
   140851888:	45 33 c9             	xor    r9d,r9d
   14085188b:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085188f:	48 8d 0d 4a 2a df 01 	lea    rcx,[rip+0x1df2a4a]        # 0x1426442e0
   140851896:	e8 05 51 28 00       	call   0x140ad69a0
   14085189b:	90                   	nop
   14085189c:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   1408518a0:	48 83 fa 0f          	cmp    rdx,0xf
   1408518a4:	0f 86 8a f1 ff ff    	jbe    0x140850a34
   1408518aa:	48 ff c2             	inc    rdx
   1408518ad:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   1408518b1:	48 8b c1             	mov    rax,rcx
   1408518b4:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1408518bb:	0f 82 6e f1 ff ff    	jb     0x140850a2f
   1408518c1:	48 83 c2 27          	add    rdx,0x27
   1408518c5:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1408518c9:	48 2b c1             	sub    rax,rcx
   1408518cc:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1408518d0:	48 83 f8 1f          	cmp    rax,0x1f
   1408518d4:	0f 87 99 00 00 00    	ja     0x140851973
   1408518da:	e9 50 f1 ff ff       	jmp    0x140850a2f
   1408518df:	c7 05 83 2a df 01 04 	mov    DWORD PTR [rip+0x1df2a83],0x1010004        # 0x14264436c
   1408518e6:	00 01 01 
   1408518e9:	0f 57 c0             	xorps  xmm0,xmm0
   1408518ec:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408518f0:	66 0f 6f 0d f8 41 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf341f8]        # 0x141785af0
   1408518f7:	00 
   1408518f8:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408518fd:	f2 0f 10 05 13 ad e5 	movsd  xmm0,QWORD PTR [rip+0xe5ad13]        # 0x1416ac618
   140851904:	00 
   140851905:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   14085190a:	8b 05 10 ad e5 00    	mov    eax,DWORD PTR [rip+0xe5ad10]        # 0x1416ac620
   140851910:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140851913:	0f b6 05 0a ad e5 00 	movzx  eax,BYTE PTR [rip+0xe5ad0a]        # 0x1416ac624
   14085191a:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
   14085191d:	c6 45 d4 00          	mov    BYTE PTR [rbp-0x2c],0x0
   140851921:	45 33 c9             	xor    r9d,r9d
   140851924:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140851928:	48 8d 0d b1 29 df 01 	lea    rcx,[rip+0x1df29b1]        # 0x1426442e0
   14085192f:	e8 6c 50 28 00       	call   0x140ad69a0
   140851934:	90                   	nop
   140851935:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   140851939:	48 83 fa 0f          	cmp    rdx,0xf
   14085193d:	0f 86 f1 f0 ff ff    	jbe    0x140850a34
   140851943:	48 ff c2             	inc    rdx
   140851946:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   14085194a:	48 8b c1             	mov    rax,rcx
   14085194d:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140851954:	0f 82 d5 f0 ff ff    	jb     0x140850a2f
   14085195a:	48 83 c2 27          	add    rdx,0x27
   14085195e:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   140851962:	48 2b c1             	sub    rax,rcx
   140851965:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   140851969:	48 83 f8 1f          	cmp    rax,0x1f
   14085196d:	0f 86 bc f0 ff ff    	jbe    0x140850a2f
   140851973:	ff 15 27 f1 d8 00    	call   QWORD PTR [rip+0xd8f127]        # 0x1415e0aa0
   140851979:	cc                   	int3
   14085197a:	66 90                	xchg   ax,ax
   14085197c:	11 ff                	adc    edi,edi
   14085197e:	84 00                	test   BYTE PTR [rax],al
   140851980:	de 03                	fiadd  WORD PTR [rbx]
   140851982:	85 00                	test   DWORD PTR [rax],eax
   140851984:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   140851985:	09 85 00 b8 0a 85    	or     DWORD PTR [rbp-0x7af54800],eax
   14085198b:	00 27                	add    BYTE PTR [rdi],ah
   14085198d:	0b 85 00 c2 0e 85    	or     eax,DWORD PTR [rbp-0x7af13e00]
   140851993:	00 78 0f             	add    BYTE PTR [rax+0xf],bh
   140851996:	85 00                	test   DWORD PTR [rax],eax
   140851998:	12 10                	adc    dl,BYTE PTR [rax]
   14085199a:	85 00                	test   DWORD PTR [rax],eax
   14085199c:	65 0e                	gs (bad)
   14085199e:	85 00                	test   DWORD PTR [rax],eax
   1408519a0:	75 10                	jne    0x1408519b2
   1408519a2:	85 00                	test   DWORD PTR [rax],eax
   1408519a4:	c7                   	(bad)
   1408519a5:	10 85 00 19 11 85    	adc    BYTE PTR [rbp-0x7aeee700],al
   1408519ab:	00 76 14             	add    BYTE PTR [rsi+0x14],dh
   1408519ae:	85 00                	test   DWORD PTR [rax],eax
   1408519b0:	99                   	cdq
   1408519b1:	15 85 00 ff 15       	adc    eax,0x15ff0085
   1408519b6:	85 00                	test   DWORD PTR [rax],eax
   1408519b8:	78 0f                	js     0x1408519c9
   1408519ba:	85 00                	test   DWORD PTR [rax],eax
   1408519bc:	5c                   	pop    rsp
   1408519bd:	0a 85 00 14 0f 85    	or     al,BYTE PTR [rbp-0x7af0ec00]
   1408519c3:	00 28                	add    BYTE PTR [rax],ch
   1408519c5:	0d 85 00 82 0d       	or     eax,0xd820085
   1408519ca:	85 00                	test   DWORD PTR [rax],eax
   1408519cc:	9a                   	(bad)
   1408519cd:	0b 85 00 ec 0b 85    	or     eax,DWORD PTR [rbp-0x7af41400]
   1408519d3:	00 52 0c             	add    BYTE PTR [rdx+0xc],dl
   1408519d6:	85 00                	test   DWORD PTR [rax],eax
   1408519d8:	b7 0c                	mov    bh,0xc
   1408519da:	85 00                	test   DWORD PTR [rax],eax
   1408519dc:	5b                   	pop    rbx
   1408519dd:	16                   	(bad)
   1408519de:	85 00                	test   DWORD PTR [rax],eax
   1408519e0:	3b 18                	cmp    ebx,DWORD PTR [rax]
   1408519e2:	85 00                	test   DWORD PTR [rax],eax
   1408519e4:	df 18                	fistp  WORD PTR [rax]
   1408519e6:	85 00                	test   DWORD PTR [rax],eax
   1408519e8:	f2                   	repnz
   1408519e9:	0d                   	.byte 0xd
   1408519ea:	85 00                	test   DWORD PTR [rax],eax
