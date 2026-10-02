
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140870790 <.text+0x86f790>:
   140870790:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140870795:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
   14087079a:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14087079f:	57                   	push   rdi
   1408707a0:	41 54                	push   r12
   1408707a2:	41 55                	push   r13
   1408707a4:	41 56                	push   r14
   1408707a6:	41 57                	push   r15
   1408707a8:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
   1408707af:	48 8b 05 8a 58 02 01 	mov    rax,QWORD PTR [rip+0x102588a]        # 0x141896040
   1408707b6:	48 33 c4             	xor    rax,rsp
   1408707b9:	48 89 84 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],rax
   1408707c0:	00 
   1408707c1:	45 8b e1             	mov    r12d,r9d
   1408707c4:	45 8b e8             	mov    r13d,r8d
   1408707c7:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
   1408707cc:	c7 05 96 3b dd 01 07 	mov    DWORD PTR [rip+0x1dd3b96],0x1010007        # 0x14264436c
   1408707d3:	00 01 01 
   1408707d6:	41 8b f8             	mov    edi,r8d
   1408707d9:	45 33 ff             	xor    r15d,r15d
   1408707dc:	ba 02 00 00 00       	mov    edx,0x2
   1408707e1:	48 8d 0d f8 3a dd 01 	lea    rcx,[rip+0x1dd3af8]        # 0x1426442e0
   1408707e8:	8b b4 24 00 01 00 00 	mov    esi,DWORD PTR [rsp+0x100]
   1408707ef:	45 3b c1             	cmp    r8d,r9d
   1408707f2:	0f 8f b3 00 00 00    	jg     0x1408708ab
   1408707f8:	44 8d 76 08          	lea    r14d,[rsi+0x8]
   1408707fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140870800:	8b de                	mov    ebx,esi
   140870802:	41 3b f6             	cmp    esi,r14d
   140870805:	0f 8d 95 00 00 00    	jge    0x1408708a0
   14087080b:	8d 6e 07             	lea    ebp,[rsi+0x7]
   14087080e:	66 90                	xchg   ax,ax
   140870810:	3b de                	cmp    ebx,esi
   140870812:	7e 0b                	jle    0x14087081f
   140870814:	3b dd                	cmp    ebx,ebp
   140870816:	7d 07                	jge    0x14087081f
   140870818:	b8 01 00 00 00       	mov    eax,0x1
   14087081d:	eb 09                	jmp    0x140870828
   14087081f:	49 8b c7             	mov    rax,r15
   140870822:	3b dd                	cmp    ebx,ebp
   140870824:	48 0f 44 c2          	cmove  rax,rdx
   140870828:	89 3d 36 3b dd 01    	mov    DWORD PTR [rip+0x1dd3b36],edi        # 0x142644364
   14087082e:	89 1d 34 3b dd 01    	mov    DWORD PTR [rip+0x1dd3b34],ebx        # 0x142644368
   140870834:	41 3b fd             	cmp    edi,r13d
   140870837:	75 09                	jne    0x140870842
   140870839:	8b 94 81 a8 19 00 00 	mov    edx,DWORD PTR [rcx+rax*4+0x19a8]
   140870840:	eb 15                	jmp    0x140870857
   140870842:	41 3b fc             	cmp    edi,r12d
   140870845:	75 09                	jne    0x140870850
   140870847:	8b 94 81 c0 19 00 00 	mov    edx,DWORD PTR [rcx+rax*4+0x19c0]
   14087084e:	eb 07                	jmp    0x140870857
   140870850:	8b 94 81 b4 19 00 00 	mov    edx,DWORD PTR [rcx+rax*4+0x19b4]
   140870857:	e8 b4 72 26 00       	call   0x140ad7b10
   14087085c:	44 39 3d 05 6e b5 01 	cmp    DWORD PTR [rip+0x1b56e05],r15d        # 0x1423c7668
   140870863:	7e 1d                	jle    0x140870882
   140870865:	48 8b 05 f4 6d b5 01 	mov    rax,QWORD PTR [rip+0x1b56df4]        # 0x1423c7660
   14087086c:	f6 00 01             	test   BYTE PTR [rax],0x1
   14087086f:	74 11                	je     0x140870882
   140870871:	41 b0 01             	mov    r8b,0x1
   140870874:	33 d2                	xor    edx,edx
   140870876:	48 8d 0d 63 3a dd 01 	lea    rcx,[rip+0x1dd3a63]        # 0x1426442e0
   14087087d:	e8 9e a8 84 ff       	call   0x1400bb120
   140870882:	ff c3                	inc    ebx
   140870884:	41 3b de             	cmp    ebx,r14d
   140870887:	48 8d 0d 52 3a dd 01 	lea    rcx,[rip+0x1dd3a52]        # 0x1426442e0
   14087088e:	ba 02 00 00 00       	mov    edx,0x2
   140870893:	0f 8c 77 ff ff ff    	jl     0x140870810
   140870899:	48 8d 0d 40 3a dd 01 	lea    rcx,[rip+0x1dd3a40]        # 0x1426442e0
   1408708a0:	ff c7                	inc    edi
   1408708a2:	41 3b fc             	cmp    edi,r12d
   1408708a5:	0f 8e 55 ff ff ff    	jle    0x140870800
   1408708ab:	41 8d 6d 0b          	lea    ebp,[r13+0xb]
   1408708af:	8d 7e 05             	lea    edi,[rsi+0x5]
   1408708b2:	41 8b dd             	mov    ebx,r13d
   1408708b5:	44 3b ed             	cmp    r13d,ebp
   1408708b8:	7f 7f                	jg     0x140870939
   1408708ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1408708c0:	41 3b dd             	cmp    ebx,r13d
   1408708c3:	75 05                	jne    0x1408708ca
   1408708c5:	49 8b c7             	mov    rax,r15
   1408708c8:	eb 0b                	jmp    0x1408708d5
   1408708ca:	b8 01 00 00 00       	mov    eax,0x1
   1408708cf:	3b dd                	cmp    ebx,ebp
   1408708d1:	48 0f 44 c2          	cmove  rax,rdx
   1408708d5:	44 8b de             	mov    r11d,esi
   1408708d8:	3b f7                	cmp    esi,edi
   1408708da:	7f 4b                	jg     0x140870927
   1408708dc:	4c 8d 34 40          	lea    r14,[rax+rax*2]
   1408708e0:	89 1d 7e 3a dd 01    	mov    DWORD PTR [rip+0x1dd3a7e],ebx        # 0x142644364
   1408708e6:	44 89 1d 7b 3a dd 01 	mov    DWORD PTR [rip+0x1dd3a7b],r11d        # 0x142644368
   1408708ed:	44 3b de             	cmp    r11d,esi
   1408708f0:	75 05                	jne    0x1408708f7
   1408708f2:	49 8b c7             	mov    rax,r15
   1408708f5:	eb 0c                	jmp    0x140870903
   1408708f7:	b8 01 00 00 00       	mov    eax,0x1
   1408708fc:	44 3b df             	cmp    r11d,edi
   1408708ff:	48 0f 44 c2          	cmove  rax,rdx
   140870903:	49 8d 14 06          	lea    rdx,[r14+rax*1]
   140870907:	8b 94 91 a0 1b 00 00 	mov    edx,DWORD PTR [rcx+rdx*4+0x1ba0]
   14087090e:	e8 fd 71 26 00       	call   0x140ad7b10
   140870913:	41 ff c3             	inc    r11d
   140870916:	44 3b df             	cmp    r11d,edi
   140870919:	48 8d 0d c0 39 dd 01 	lea    rcx,[rip+0x1dd39c0]        # 0x1426442e0
   140870920:	ba 02 00 00 00       	mov    edx,0x2
   140870925:	7e b9                	jle    0x1408708e0
   140870927:	ff c3                	inc    ebx
   140870929:	3b dd                	cmp    ebx,ebp
   14087092b:	48 8d 0d ae 39 dd 01 	lea    rcx,[rip+0x1dd39ae]        # 0x1426442e0
   140870932:	ba 02 00 00 00       	mov    edx,0x2
   140870937:	7e 87                	jle    0x1408708c0
   140870939:	44 39 3d 28 6d b5 01 	cmp    DWORD PTR [rip+0x1b56d28],r15d        # 0x1423c7668
   140870940:	0f 8e ac 01 00 00    	jle    0x140870af2
   140870946:	48 8b 05 13 6d b5 01 	mov    rax,QWORD PTR [rip+0x1b56d13]        # 0x1423c7660
   14087094d:	f6 00 01             	test   BYTE PTR [rax],0x1
   140870950:	0f 84 9c 01 00 00    	je     0x140870af2
   140870956:	4c 8b 74 24 58       	mov    r14,QWORD PTR [rsp+0x58]
   14087095b:	45 39 be 2c 14 00 00 	cmp    DWORD PTR [r14+0x142c],r15d
   140870962:	74 0d                	je     0x140870971
   140870964:	41 f7 86 1c 01 00 00 	test   DWORD PTR [r14+0x11c],0x4000
   14087096b:	00 40 00 00 
   14087096f:	74 08                	je     0x140870979
   140870971:	49 8b ce             	mov    rcx,r14
   140870974:	e8 37 90 94 ff       	call   0x1401b99b0
   140870979:	45 39 be 2c 14 00 00 	cmp    DWORD PTR [r14+0x142c],r15d
   140870980:	74 50                	je     0x1408709d2
   140870982:	c7 05 e0 39 dd 01 07 	mov    DWORD PTR [rip+0x1dd39e0],0x1010007        # 0x14264436c
   140870989:	00 01 01 
   14087098c:	44 89 2d d1 39 dd 01 	mov    DWORD PTR [rip+0x1dd39d1],r13d        # 0x142644364
   140870993:	89 35 cf 39 dd 01    	mov    DWORD PTR [rip+0x1dd39cf],esi        # 0x142644368
   140870999:	44 88 7c 24 30       	mov    BYTE PTR [rsp+0x30],r15b
   14087099e:	c7 44 24 28 08 00 00 	mov    DWORD PTR [rsp+0x28],0x8
   1408709a5:	00 
   1408709a6:	c7 44 24 20 0c 00 00 	mov    DWORD PTR [rsp+0x20],0xc
   1408709ad:	00 
   1408709ae:	45 33 c9             	xor    r9d,r9d
   1408709b1:	45 33 c0             	xor    r8d,r8d
   1408709b4:	41 8b 96 2c 14 00 00 	mov    edx,DWORD PTR [r14+0x142c]
   1408709bb:	48 8d 3d 1e 39 dd 01 	lea    rdi,[rip+0x1dd391e]        # 0x1426442e0
   1408709c2:	48 8b cf             	mov    rcx,rdi
   1408709c5:	e8 e6 73 26 00       	call   0x140ad7db0
   1408709ca:	8d 5e 01             	lea    ebx,[rsi+0x1]
   1408709cd:	e9 67 01 00 00       	jmp    0x140870b39
   1408709d2:	0f 57 c0             	xorps  xmm0,xmm0
   1408709d5:	0f 11 84 24 80 00 00 	movups XMMWORD PTR [rsp+0x80],xmm0
   1408709dc:	00 
   1408709dd:	66 0f 6f 0d 3b 50 f1 	movdqa xmm1,XMMWORD PTR [rip+0xf1503b]        # 0x141785a20
   1408709e4:	00 
   1408709e5:	f3 0f 7f 8c 24 90 00 	movdqu XMMWORD PTR [rsp+0x90],xmm1
   1408709ec:	00 00 
   1408709ee:	44 88 bc 24 80 00 00 	mov    BYTE PTR [rsp+0x80],r15b
   1408709f5:	00 
   1408709f6:	45 0f b7 86 a0 00 00 	movzx  r8d,WORD PTR [r14+0xa0]
   1408709fd:	00 
   1408709fe:	49 0f bf 8e a4 00 00 	movsx  rcx,WORD PTR [r14+0xa4]
   140870a05:	00 
   140870a06:	66 85 c9             	test   cx,cx
   140870a09:	78 68                	js     0x140870a73
   140870a0b:	4c 8b 15 46 5f c7 01 	mov    r10,QWORD PTR [rip+0x1c75f46]        # 0x1424e6958
   140870a12:	48 8b 05 47 5f c7 01 	mov    rax,QWORD PTR [rip+0x1c75f47]        # 0x1424e6960
   140870a19:	49 2b c2             	sub    rax,r10
   140870a1c:	48 c1 f8 03          	sar    rax,0x3
   140870a20:	66 3b c8             	cmp    cx,ax
   140870a23:	7d 4e                	jge    0x140870a73
   140870a25:	48 8b c1             	mov    rax,rcx
   140870a28:	ba ff ff ff ff       	mov    edx,0xffffffff
   140870a2d:	44 8b ca             	mov    r9d,edx
   140870a30:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
   140870a35:	48 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],rcx
   140870a3a:	4c 89 7c 24 40       	mov    QWORD PTR [rsp+0x40],r15
   140870a3f:	4c 89 74 24 38       	mov    QWORD PTR [rsp+0x38],r14
   140870a44:	c7 44 24 30 00 08 00 	mov    DWORD PTR [rsp+0x30],0x800
   140870a4b:	00 
   140870a4c:	66 44 89 44 24 28    	mov    WORD PTR [rsp+0x28],r8w
   140870a52:	66 89 54 24 20       	mov    WORD PTR [rsp+0x20],dx
   140870a57:	4c 8d 84 24 80 00 00 	lea    r8,[rsp+0x80]
   140870a5e:	00 
   140870a5f:	41 0f b7 96 2c 01 00 	movzx  edx,WORD PTR [r14+0x12c]
   140870a66:	00 
   140870a67:	49 8b 0c c2          	mov    rcx,QWORD PTR [r10+rax*8]
   140870a6b:	e8 10 35 e6 ff       	call   0x1406d3f80
   140870a70:	44 8b f8             	mov    r15d,eax
   140870a73:	48 8d 3d 66 38 dd 01 	lea    rdi,[rip+0x1dd3866]        # 0x1426442e0
   140870a7a:	80 7c 24 50 00       	cmp    BYTE PTR [rsp+0x50],0x0
   140870a7f:	74 1d                	je     0x140870a9e
   140870a81:	44 89 2d dc 38 dd 01 	mov    DWORD PTR [rip+0x1dd38dc],r13d        # 0x142644364
   140870a88:	89 35 da 38 dd 01    	mov    DWORD PTR [rip+0x1dd38da],esi        # 0x142644368
   140870a8e:	45 85 ff             	test   r15d,r15d
   140870a91:	74 4d                	je     0x140870ae0
   140870a93:	41 b9 06 00 00 00    	mov    r9d,0x6
   140870a99:	45 33 c0             	xor    r8d,r8d
   140870a9c:	eb 21                	jmp    0x140870abf
   140870a9e:	41 8d 45 04          	lea    eax,[r13+0x4]
   140870aa2:	89 05 bc 38 dd 01    	mov    DWORD PTR [rip+0x1dd38bc],eax        # 0x142644364
   140870aa8:	8d 46 03             	lea    eax,[rsi+0x3]
   140870aab:	89 05 b7 38 dd 01    	mov    DWORD PTR [rip+0x1dd38b7],eax        # 0x142644368
   140870ab1:	45 85 ff             	test   r15d,r15d
   140870ab4:	74 2a                	je     0x140870ae0
   140870ab6:	41 b9 02 00 00 00    	mov    r9d,0x2
   140870abc:	45 8b c1             	mov    r8d,r9d
   140870abf:	c6 44 24 30 00       	mov    BYTE PTR [rsp+0x30],0x0
   140870ac4:	c7 44 24 28 03 00 00 	mov    DWORD PTR [rsp+0x28],0x3
   140870acb:	00 
   140870acc:	c7 44 24 20 05 00 00 	mov    DWORD PTR [rsp+0x20],0x5
   140870ad3:	00 
   140870ad4:	41 8b d7             	mov    edx,r15d
   140870ad7:	48 8b cf             	mov    rcx,rdi
   140870ada:	e8 d1 72 26 00       	call   0x140ad7db0
   140870adf:	90                   	nop
   140870ae0:	48 8d 8c 24 80 00 00 	lea    rcx,[rsp+0x80]
   140870ae7:	00 
   140870ae8:	e8 f3 ec 7f ff       	call   0x14006f7e0
   140870aed:	8d 5e 01             	lea    ebx,[rsi+0x1]
   140870af0:	eb 47                	jmp    0x140870b39
   140870af2:	41 8d 45 02          	lea    eax,[r13+0x2]
   140870af6:	89 05 68 38 dd 01    	mov    DWORD PTR [rip+0x1dd3868],eax        # 0x142644364
   140870afc:	8d 5e 01             	lea    ebx,[rsi+0x1]
   140870aff:	89 1d 63 38 dd 01    	mov    DWORD PTR [rip+0x1dd3863],ebx        # 0x142644368
   140870b05:	33 d2                	xor    edx,edx
   140870b07:	45 33 c9             	xor    r9d,r9d
   140870b0a:	41 b0 01             	mov    r8b,0x1
   140870b0d:	4c 8b 74 24 58       	mov    r14,QWORD PTR [rsp+0x58]
   140870b12:	49 8b ce             	mov    rcx,r14
   140870b15:	e8 16 e0 ab 00       	call   0x14132eb30
   140870b1a:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140870b1d:	33 d2                	xor    edx,edx
   140870b1f:	49 8b ce             	mov    rcx,r14
   140870b22:	ff 10                	call   QWORD PTR [rax]
   140870b24:	0f b6 d0             	movzx  edx,al
   140870b27:	41 b0 01             	mov    r8b,0x1
   140870b2a:	48 8d 3d af 37 dd 01 	lea    rdi,[rip+0x1dd37af]        # 0x1426442e0
   140870b31:	48 8b cf             	mov    rcx,rdi
   140870b34:	e8 e7 a5 84 ff       	call   0x1400bb120
   140870b39:	41 8d 45 0d          	lea    eax,[r13+0xd]
   140870b3d:	89 05 21 38 dd 01    	mov    DWORD PTR [rip+0x1dd3821],eax        # 0x142644364
   140870b43:	89 1d 1f 38 dd 01    	mov    DWORD PTR [rip+0x1dd381f],ebx        # 0x142644368
   140870b49:	49 8b ce             	mov    rcx,r14
   140870b4c:	e8 8f 15 f7 ff       	call   0x1407e20e0
   140870b51:	0f 57 c0             	xorps  xmm0,xmm0
   140870b54:	0f 11 44 24 60       	movups XMMWORD PTR [rsp+0x60],xmm0
   140870b59:	66 0f 6f 0d bf 4e f1 	movdqa xmm1,XMMWORD PTR [rip+0xf14ebf]        # 0x141785a20
   140870b60:	00 
   140870b61:	f3 0f 7f 4c 24 70    	movdqu XMMWORD PTR [rsp+0x70],xmm1
   140870b67:	c6 44 24 60 00       	mov    BYTE PTR [rsp+0x60],0x0
   140870b6c:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   140870b71:	41 b1 01             	mov    r9b,0x1
   140870b74:	41 b8 01 00 00 00    	mov    r8d,0x1
   140870b7a:	48 8d 54 24 60       	lea    rdx,[rsp+0x60]
   140870b7f:	49 8b ce             	mov    rcx,r14
   140870b82:	e8 19 88 ab 00       	call   0x1413293a0
   140870b87:	c7 05 db 37 dd 01 07 	mov    DWORD PTR [rip+0x1dd37db],0x1000007        # 0x14264436c
   140870b8e:	00 00 01 
   140870b91:	45 33 c9             	xor    r9d,r9d
   140870b94:	48 8d 54 24 60       	lea    rdx,[rsp+0x60]
   140870b99:	48 8b cf             	mov    rcx,rdi
   140870b9c:	e8 ff 5d 26 00       	call   0x140ad69a0
   140870ba1:	8d 6e 02             	lea    ebp,[rsi+0x2]
   140870ba4:	49 8b 9e d0 07 00 00 	mov    rbx,QWORD PTR [r14+0x7d0]
   140870bab:	49 8b be d8 07 00 00 	mov    rdi,QWORD PTR [r14+0x7d8]
   140870bb2:	48 3b df             	cmp    rbx,rdi
   140870bb5:	73 32                	jae    0x140870be9
   140870bb7:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140870bba:	83 38 ff             	cmp    DWORD PTR [rax],0xffffffff
   140870bbd:	74 24                	je     0x140870be3
   140870bbf:	41 8d 45 10          	lea    eax,[r13+0x10]
   140870bc3:	89 05 9b 37 dd 01    	mov    DWORD PTR [rip+0x1dd379b],eax        # 0x142644364
   140870bc9:	89 2d 99 37 dd 01    	mov    DWORD PTR [rip+0x1dd3799],ebp        # 0x142644368
   140870bcf:	49 8b d6             	mov    rdx,r14
   140870bd2:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140870bd5:	e8 e6 f2 fd ff       	call   0x14084fec0
   140870bda:	ff c5                	inc    ebp
   140870bdc:	8d 46 08             	lea    eax,[rsi+0x8]
   140870bdf:	3b e8                	cmp    ebp,eax
   140870be1:	7d 06                	jge    0x140870be9
   140870be3:	48 83 c3 08          	add    rbx,0x8
   140870be7:	eb c9                	jmp    0x140870bb2
   140870be9:	48 8d 4c 24 60       	lea    rcx,[rsp+0x60]
   140870bee:	e8 ed eb 7f ff       	call   0x14006f7e0
   140870bf3:	48 8b 8c 24 a0 00 00 	mov    rcx,QWORD PTR [rsp+0xa0]
   140870bfa:	00 
   140870bfb:	48 33 cc             	xor    rcx,rsp
   140870bfe:	e8 cd 39 cc 00       	call   0x1415345d0
   140870c03:	4c 8d 9c 24 b0 00 00 	lea    r11,[rsp+0xb0]
   140870c0a:	00 
   140870c0b:	49 8b 5b 30          	mov    rbx,QWORD PTR [r11+0x30]
   140870c0f:	49 8b 6b 40          	mov    rbp,QWORD PTR [r11+0x40]
   140870c13:	49 8b 73 48          	mov    rsi,QWORD PTR [r11+0x48]
   140870c17:	49 8b e3             	mov    rsp,r11
   140870c1a:	41 5f                	pop    r15
   140870c1c:	41 5e                	pop    r14
   140870c1e:	41 5d                	pop    r13
   140870c20:	41 5c                	pop    r12
   140870c22:	5f                   	pop    rdi
   140870c23:	c3                   	ret
