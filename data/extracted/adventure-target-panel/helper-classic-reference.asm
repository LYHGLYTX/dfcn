
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014132c470 <.text+0x132b470>:
   14132c470:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   14132c475:	55                   	push   rbp
   14132c476:	56                   	push   rsi
   14132c477:	57                   	push   rdi
   14132c478:	41 54                	push   r12
   14132c47a:	41 55                	push   r13
   14132c47c:	41 56                	push   r14
   14132c47e:	41 57                	push   r15
   14132c480:	48 8d 6c 24 d9       	lea    rbp,[rsp-0x27]
   14132c485:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
   14132c48c:	48 8b 05 ad 9b 56 00 	mov    rax,QWORD PTR [rip+0x569bad]        # 0x141896040
   14132c493:	48 33 c4             	xor    rax,rsp
   14132c496:	48 89 45 1f          	mov    QWORD PTR [rbp+0x1f],rax
   14132c49a:	4c 8b f2             	mov    r14,rdx
   14132c49d:	4c 8b e9             	mov    r13,rcx
   14132c4a0:	8b 05 ee 9d 56 00    	mov    eax,DWORD PTR [rip+0x569dee]        # 0x141896294
   14132c4a6:	83 c0 fc             	add    eax,0xfffffffc
   14132c4a9:	83 f8 01             	cmp    eax,0x1
   14132c4ac:	0f 86 66 1f 00 00    	jbe    0x14132e418
   14132c4b2:	48 8d 71 08          	lea    rsi,[rcx+0x8]
   14132c4b6:	48 89 74 24 48       	mov    QWORD PTR [rsp+0x48],rsi
   14132c4bb:	0f b7 81 a0 00 00 00 	movzx  eax,WORD PTR [rcx+0xa0]
   14132c4c2:	66 89 44 24 32       	mov    WORD PTR [rsp+0x32],ax
   14132c4c7:	4c 8d 81 74 12 00 00 	lea    r8,[rcx+0x1274]
   14132c4ce:	8b 91 30 0c 00 00    	mov    edx,DWORD PTR [rcx+0xc30]
   14132c4d4:	48 8d 0d cd 76 1c 01 	lea    rcx,[rip+0x11c76cd]        # 0x1424f3ba8
   14132c4db:	e8 10 3c 82 ff       	call   0x140b500f0
   14132c4e0:	45 33 e4             	xor    r12d,r12d
   14132c4e3:	48 85 c0             	test   rax,rax
   14132c4e6:	0f 84 4c 05 00 00    	je     0x14132ca38
   14132c4ec:	48 8b 80 30 01 00 00 	mov    rax,QWORD PTR [rax+0x130]
   14132c4f3:	48 85 c0             	test   rax,rax
   14132c4f6:	75 05                	jne    0x14132c4fd
   14132c4f8:	45 8b fc             	mov    r15d,r12d
   14132c4fb:	eb 2a                	jmp    0x14132c527
   14132c4fd:	48 8b 48 58          	mov    rcx,QWORD PTR [rax+0x58]
   14132c501:	48 85 c9             	test   rcx,rcx
   14132c504:	75 05                	jne    0x14132c50b
   14132c506:	4d 8b fc             	mov    r15,r12
   14132c509:	eb 1c                	jmp    0x14132c527
   14132c50b:	8b 51 30             	mov    edx,DWORD PTR [rcx+0x30]
   14132c50e:	83 fa ff             	cmp    edx,0xffffffff
   14132c511:	75 05                	jne    0x14132c518
   14132c513:	4d 8b fc             	mov    r15,r12
   14132c516:	eb 0f                	jmp    0x14132c527
   14132c518:	48 8d 0d b9 56 1b 01 	lea    rcx,[rip+0x11b56b9]        # 0x1424e1bd8
   14132c51f:	e8 dc 5f d4 fe       	call   0x140072500
   14132c524:	4c 8b f8             	mov    r15,rax
   14132c527:	4c 89 7c 24 40       	mov    QWORD PTR [rsp+0x40],r15
   14132c52c:	4d 85 ff             	test   r15,r15
   14132c52f:	0f 84 08 05 00 00    	je     0x14132ca3d
   14132c535:	49 8b cf             	mov    rcx,r15
   14132c538:	e8 f3 af 90 ff       	call   0x140c37530
   14132c53d:	48 8b f8             	mov    rdi,rax
   14132c540:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   14132c545:	45 8b 9f 88 00 00 00 	mov    r11d,DWORD PTR [r15+0x88]
   14132c54c:	41 83 fb ff          	cmp    r11d,0xffffffff
   14132c550:	0f 84 c9 04 00 00    	je     0x14132ca1f
   14132c556:	4c 8b 0d b3 76 1c 01 	mov    r9,QWORD PTR [rip+0x11c76b3]        # 0x1424f3c10
   14132c55d:	48 8b 1d a4 76 1c 01 	mov    rbx,QWORD PTR [rip+0x11c76a4]        # 0x1424f3c08
   14132c564:	4c 2b cb             	sub    r9,rbx
   14132c567:	49 c1 f9 03          	sar    r9,0x3
   14132c56b:	4d 85 c9             	test   r9,r9
   14132c56e:	74 3c                	je     0x14132c5ac
   14132c570:	45 8b c4             	mov    r8d,r12d
   14132c573:	41 83 e9 01          	sub    r9d,0x1
   14132c577:	78 33                	js     0x14132c5ac
   14132c579:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   14132c580:	43 8d 0c 01          	lea    ecx,[r9+r8*1]
   14132c584:	d1 f9                	sar    ecx,1
   14132c586:	48 63 c1             	movsxd rax,ecx
   14132c589:	48 8b 14 c3          	mov    rdx,QWORD PTR [rbx+rax*8]
   14132c58d:	44 39 9a e0 00 00 00 	cmp    DWORD PTR [rdx+0xe0],r11d
   14132c594:	74 19                	je     0x14132c5af
   14132c596:	8d 41 ff             	lea    eax,[rcx-0x1]
   14132c599:	41 0f 4e c1          	cmovle eax,r9d
   14132c59d:	44 8b c8             	mov    r9d,eax
   14132c5a0:	8d 41 01             	lea    eax,[rcx+0x1]
   14132c5a3:	44 0f 4e c0          	cmovle r8d,eax
   14132c5a7:	45 3b c1             	cmp    r8d,r9d
   14132c5aa:	7e d4                	jle    0x14132c580
   14132c5ac:	49 8b d4             	mov    rdx,r12
   14132c5af:	48 85 d2             	test   rdx,rdx
   14132c5b2:	0f 84 67 04 00 00    	je     0x14132ca1f
   14132c5b8:	44 39 a2 d0 00 00 00 	cmp    DWORD PTR [rdx+0xd0],r12d
   14132c5bf:	0f 8e 5a 04 00 00    	jle    0x14132ca1f
   14132c5c5:	48 8b 82 c8 00 00 00 	mov    rax,QWORD PTR [rdx+0xc8]
   14132c5cc:	f6 00 04             	test   BYTE PTR [rax],0x4
   14132c5cf:	0f 85 08 02 00 00    	jne    0x14132c7dd
   14132c5d5:	f6 00 08             	test   BYTE PTR [rax],0x8
   14132c5d8:	0f 84 41 04 00 00    	je     0x14132ca1f
   14132c5de:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132c5e4:	48 8d 15 1d 04 45 00 	lea    rdx,[rip+0x45041d]        # 0x14177ca08
   14132c5eb:	49 8b ce             	mov    rcx,r14
   14132c5ee:	e8 6d 32 d4 fe       	call   0x14006f860
   14132c5f3:	83 3d 9a 9c 56 00 01 	cmp    DWORD PTR [rip+0x569c9a],0x1        # 0x141896294
   14132c5fa:	0f 85 87 01 00 00    	jne    0x14132c787
   14132c600:	48 8b 05 b9 29 0b 01 	mov    rax,QWORD PTR [rip+0x10b29b9]        # 0x1423defc0
   14132c607:	48 2b 05 aa 29 0b 01 	sub    rax,QWORD PTR [rip+0x10b29aa]        # 0x1423defb8
   14132c60e:	48 c1 f8 03          	sar    rax,0x3
   14132c612:	48 85 c0             	test   rax,rax
   14132c615:	0f 84 35 1e 00 00    	je     0x14132e450
   14132c61b:	48 8b 15 de 29 0b 01 	mov    rdx,QWORD PTR [rip+0x10b29de]        # 0x1423df000
   14132c622:	48 85 d2             	test   rdx,rdx
   14132c625:	0f 84 25 1e 00 00    	je     0x14132e450
   14132c62b:	32 db                	xor    bl,bl
   14132c62d:	4c 8d 82 74 12 00 00 	lea    r8,[rdx+0x1274]
   14132c634:	8b 92 30 0c 00 00    	mov    edx,DWORD PTR [rdx+0xc30]
   14132c63a:	48 8d 0d 67 75 1c 01 	lea    rcx,[rip+0x11c7567]        # 0x1424f3ba8
   14132c641:	e8 aa 3a 82 ff       	call   0x140b500f0
   14132c646:	48 8b f8             	mov    rdi,rax
   14132c649:	48 85 c0             	test   rax,rax
   14132c64c:	0f 84 fe 1d 00 00    	je     0x14132e450
   14132c652:	41 8b 8d 30 0c 00 00 	mov    ecx,DWORD PTR [r13+0xc30]
   14132c659:	83 f9 ff             	cmp    ecx,0xffffffff
   14132c65c:	74 40                	je     0x14132c69e
   14132c65e:	48 8b 90 30 01 00 00 	mov    rdx,QWORD PTR [rax+0x130]
   14132c665:	48 85 d2             	test   rdx,rdx
   14132c668:	74 34                	je     0x14132c69e
   14132c66a:	4c 39 62 60          	cmp    QWORD PTR [rdx+0x60],r12
   14132c66e:	74 2e                	je     0x14132c69e
   14132c670:	48 8b 52 60          	mov    rdx,QWORD PTR [rdx+0x60]
   14132c674:	e8 d7 d6 d8 fe       	call   0x1400b9d50
   14132c679:	48 85 c0             	test   rax,rax
   14132c67c:	74 20                	je     0x14132c69e
   14132c67e:	f6 40 04 01          	test   BYTE PTR [rax+0x4],0x1
   14132c682:	75 76                	jne    0x14132c6fa
   14132c684:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14132c688:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
   14132c68b:	e8 70 d8 d8 fe       	call   0x1400b9f00
   14132c690:	0f b6 db             	movzx  ebx,bl
   14132c693:	b9 01 00 00 00       	mov    ecx,0x1
   14132c698:	83 f8 ff             	cmp    eax,0xffffffff
   14132c69b:	0f 45 d9             	cmovne ebx,ecx
   14132c69e:	45 8b 85 4c 01 00 00 	mov    r8d,DWORD PTR [r13+0x14c]
   14132c6a5:	41 83 f8 ff          	cmp    r8d,0xffffffff
   14132c6a9:	74 42                	je     0x14132c6ed
   14132c6ab:	48 8b 87 30 01 00 00 	mov    rax,QWORD PTR [rdi+0x130]
   14132c6b2:	48 85 c0             	test   rax,rax
   14132c6b5:	74 36                	je     0x14132c6ed
   14132c6b7:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   14132c6bb:	48 85 d2             	test   rdx,rdx
   14132c6be:	74 2d                	je     0x14132c6ed
   14132c6c0:	48 83 c2 48          	add    rdx,0x48
   14132c6c4:	48 8d 4d 87          	lea    rcx,[rbp-0x79]
   14132c6c8:	e8 a3 e4 d8 fe       	call   0x1400bab70
   14132c6cd:	c7 44 24 40 ff ff ff 	mov    DWORD PTR [rsp+0x40],0xffffffff
   14132c6d4:	ff 
   14132c6d5:	44 89 64 24 44       	mov    DWORD PTR [rsp+0x44],r12d
   14132c6da:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   14132c6df:	44 38 65 8f          	cmp    BYTE PTR [rbp-0x71],r12b
   14132c6e3:	48 0f 45 45 87       	cmovne rax,QWORD PTR [rbp-0x79]
   14132c6e8:	83 f8 ff             	cmp    eax,0xffffffff
   14132c6eb:	75 0d                	jne    0x14132c6fa
   14132c6ed:	84 db                	test   bl,bl
   14132c6ef:	0f 84 5b 1d 00 00    	je     0x14132e450
   14132c6f5:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   14132c6fa:	b2 20                	mov    dl,0x20
   14132c6fc:	49 8b ce             	mov    rcx,r14
   14132c6ff:	e8 0c d4 d8 fe       	call   0x1400b9b10
   14132c704:	0f 57 c0             	xorps  xmm0,xmm0
   14132c707:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14132c70b:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14132c70f:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   14132c716:	00 
   14132c717:	44 88 65 bf          	mov    BYTE PTR [rbp-0x41],r12b
   14132c71b:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132c71f:	48 8b ce             	mov    rcx,rsi
   14132c722:	e8 89 49 76 ff       	call   0x140a910b0
   14132c727:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132c72b:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   14132c730:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   14132c735:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   14132c739:	49 8b ce             	mov    rcx,r14
   14132c73c:	e8 5f 32 d4 fe       	call   0x14006f9a0
   14132c741:	90                   	nop
   14132c742:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   14132c746:	48 83 fa 0f          	cmp    rdx,0xf
   14132c74a:	0f 86 00 1d 00 00    	jbe    0x14132e450
   14132c750:	48 ff c2             	inc    rdx
   14132c753:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   14132c757:	48 8b c1             	mov    rax,rcx
   14132c75a:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132c761:	0f 82 ae 02 00 00    	jb     0x14132ca15
   14132c767:	48 83 c2 27          	add    rdx,0x27
   14132c76b:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132c76f:	48 2b c1             	sub    rax,rcx
   14132c772:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132c776:	48 83 f8 1f          	cmp    rax,0x1f
   14132c77a:	0f 86 95 02 00 00    	jbe    0x14132ca15
   14132c780:	ff 15 1a 43 2b 00    	call   QWORD PTR [rip+0x2b431a]        # 0x1415e0aa0
   14132c786:	cc                   	int3
   14132c787:	b2 20                	mov    dl,0x20
   14132c789:	49 8b ce             	mov    rcx,r14
   14132c78c:	e8 7f d3 d8 fe       	call   0x1400b9b10
   14132c791:	0f 57 c0             	xorps  xmm0,xmm0
   14132c794:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14132c798:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14132c79c:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   14132c7a3:	00 
   14132c7a4:	44 88 65 bf          	mov    BYTE PTR [rbp-0x41],r12b
   14132c7a8:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132c7ac:	48 8b cf             	mov    rcx,rdi
   14132c7af:	e8 fc 48 76 ff       	call   0x140a910b0
   14132c7b4:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132c7b8:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   14132c7bd:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   14132c7c2:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   14132c7c6:	49 8b ce             	mov    rcx,r14
   14132c7c9:	e8 d2 31 d4 fe       	call   0x14006f9a0
   14132c7ce:	90                   	nop
   14132c7cf:	48 8d 4d bf          	lea    rcx,[rbp-0x41]
   14132c7d3:	e8 08 30 d4 fe       	call   0x14006f7e0
   14132c7d8:	e9 73 1c 00 00       	jmp    0x14132e450
   14132c7dd:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132c7e3:	48 8d 15 2e 02 45 00 	lea    rdx,[rip+0x45022e]        # 0x14177ca18
   14132c7ea:	49 8b ce             	mov    rcx,r14
   14132c7ed:	e8 6e 30 d4 fe       	call   0x14006f860
   14132c7f2:	44 38 67 72          	cmp    BYTE PTR [rdi+0x72],r12b
   14132c7f6:	0f 84 54 1c 00 00    	je     0x14132e450
   14132c7fc:	83 3d 91 9a 56 00 01 	cmp    DWORD PTR [rip+0x569a91],0x1        # 0x141896294
   14132c803:	0f 85 87 01 00 00    	jne    0x14132c990
   14132c809:	48 8b 05 b0 27 0b 01 	mov    rax,QWORD PTR [rip+0x10b27b0]        # 0x1423defc0
   14132c810:	48 2b 05 a1 27 0b 01 	sub    rax,QWORD PTR [rip+0x10b27a1]        # 0x1423defb8
   14132c817:	48 c1 f8 03          	sar    rax,0x3
   14132c81b:	48 85 c0             	test   rax,rax
   14132c81e:	0f 84 2c 1c 00 00    	je     0x14132e450
   14132c824:	48 8b 15 d5 27 0b 01 	mov    rdx,QWORD PTR [rip+0x10b27d5]        # 0x1423df000
   14132c82b:	48 85 d2             	test   rdx,rdx
   14132c82e:	0f 84 1c 1c 00 00    	je     0x14132e450
   14132c834:	32 db                	xor    bl,bl
   14132c836:	4c 8d 82 74 12 00 00 	lea    r8,[rdx+0x1274]
   14132c83d:	8b 92 30 0c 00 00    	mov    edx,DWORD PTR [rdx+0xc30]
   14132c843:	48 8d 0d 5e 73 1c 01 	lea    rcx,[rip+0x11c735e]        # 0x1424f3ba8
   14132c84a:	e8 a1 38 82 ff       	call   0x140b500f0
   14132c84f:	48 8b f8             	mov    rdi,rax
   14132c852:	48 85 c0             	test   rax,rax
   14132c855:	0f 84 f5 1b 00 00    	je     0x14132e450
   14132c85b:	41 8b 8d 30 0c 00 00 	mov    ecx,DWORD PTR [r13+0xc30]
   14132c862:	83 f9 ff             	cmp    ecx,0xffffffff
   14132c865:	74 40                	je     0x14132c8a7
   14132c867:	48 8b 90 30 01 00 00 	mov    rdx,QWORD PTR [rax+0x130]
   14132c86e:	48 85 d2             	test   rdx,rdx
   14132c871:	74 34                	je     0x14132c8a7
   14132c873:	4c 39 62 60          	cmp    QWORD PTR [rdx+0x60],r12
   14132c877:	74 2e                	je     0x14132c8a7
   14132c879:	48 8b 52 60          	mov    rdx,QWORD PTR [rdx+0x60]
   14132c87d:	e8 ce d4 d8 fe       	call   0x1400b9d50
   14132c882:	48 85 c0             	test   rax,rax
   14132c885:	74 20                	je     0x14132c8a7
   14132c887:	f6 40 04 01          	test   BYTE PTR [rax+0x4],0x1
   14132c88b:	75 76                	jne    0x14132c903
   14132c88d:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14132c891:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
   14132c894:	e8 67 d6 d8 fe       	call   0x1400b9f00
   14132c899:	0f b6 db             	movzx  ebx,bl
   14132c89c:	b9 01 00 00 00       	mov    ecx,0x1
   14132c8a1:	83 f8 ff             	cmp    eax,0xffffffff
   14132c8a4:	0f 45 d9             	cmovne ebx,ecx
   14132c8a7:	45 8b 85 4c 01 00 00 	mov    r8d,DWORD PTR [r13+0x14c]
   14132c8ae:	41 83 f8 ff          	cmp    r8d,0xffffffff
   14132c8b2:	74 42                	je     0x14132c8f6
   14132c8b4:	48 8b 87 30 01 00 00 	mov    rax,QWORD PTR [rdi+0x130]
   14132c8bb:	48 85 c0             	test   rax,rax
   14132c8be:	74 36                	je     0x14132c8f6
   14132c8c0:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   14132c8c4:	48 85 d2             	test   rdx,rdx
   14132c8c7:	74 2d                	je     0x14132c8f6
   14132c8c9:	48 83 c2 48          	add    rdx,0x48
   14132c8cd:	48 8d 4d 87          	lea    rcx,[rbp-0x79]
   14132c8d1:	e8 9a e2 d8 fe       	call   0x1400bab70
   14132c8d6:	c7 44 24 40 ff ff ff 	mov    DWORD PTR [rsp+0x40],0xffffffff
   14132c8dd:	ff 
   14132c8de:	44 89 64 24 44       	mov    DWORD PTR [rsp+0x44],r12d
   14132c8e3:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   14132c8e8:	44 38 65 8f          	cmp    BYTE PTR [rbp-0x71],r12b
   14132c8ec:	48 0f 45 45 87       	cmovne rax,QWORD PTR [rbp-0x79]
   14132c8f1:	83 f8 ff             	cmp    eax,0xffffffff
   14132c8f4:	75 0d                	jne    0x14132c903
   14132c8f6:	84 db                	test   bl,bl
   14132c8f8:	0f 84 52 1b 00 00    	je     0x14132e450
   14132c8fe:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   14132c903:	b2 20                	mov    dl,0x20
   14132c905:	49 8b ce             	mov    rcx,r14
   14132c908:	e8 03 d2 d8 fe       	call   0x1400b9b10
   14132c90d:	0f 57 c0             	xorps  xmm0,xmm0
   14132c910:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14132c914:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14132c918:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   14132c91f:	00 
   14132c920:	44 88 65 bf          	mov    BYTE PTR [rbp-0x41],r12b
   14132c924:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132c928:	48 8b ce             	mov    rcx,rsi
   14132c92b:	e8 80 47 76 ff       	call   0x140a910b0
   14132c930:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132c934:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   14132c939:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   14132c93e:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   14132c942:	49 8b ce             	mov    rcx,r14
   14132c945:	e8 56 30 d4 fe       	call   0x14006f9a0
   14132c94a:	90                   	nop
   14132c94b:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   14132c94f:	48 83 fa 0f          	cmp    rdx,0xf
   14132c953:	0f 86 f7 1a 00 00    	jbe    0x14132e450
   14132c959:	48 ff c2             	inc    rdx
   14132c95c:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   14132c960:	48 8b c1             	mov    rax,rcx
   14132c963:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132c96a:	0f 82 a5 00 00 00    	jb     0x14132ca15
   14132c970:	48 83 c2 27          	add    rdx,0x27
   14132c974:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132c978:	48 2b c1             	sub    rax,rcx
   14132c97b:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132c97f:	48 83 f8 1f          	cmp    rax,0x1f
   14132c983:	0f 86 8c 00 00 00    	jbe    0x14132ca15
   14132c989:	ff 15 11 41 2b 00    	call   QWORD PTR [rip+0x2b4111]        # 0x1415e0aa0
   14132c98f:	cc                   	int3
   14132c990:	b2 20                	mov    dl,0x20
   14132c992:	49 8b ce             	mov    rcx,r14
   14132c995:	e8 76 d1 d8 fe       	call   0x1400b9b10
   14132c99a:	0f 57 c0             	xorps  xmm0,xmm0
   14132c99d:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14132c9a1:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14132c9a5:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   14132c9ac:	00 
   14132c9ad:	44 88 65 bf          	mov    BYTE PTR [rbp-0x41],r12b
   14132c9b1:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132c9b5:	48 8b cf             	mov    rcx,rdi
   14132c9b8:	e8 f3 46 76 ff       	call   0x140a910b0
   14132c9bd:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132c9c1:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   14132c9c6:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   14132c9cb:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   14132c9cf:	49 8b ce             	mov    rcx,r14
   14132c9d2:	e8 c9 2f d4 fe       	call   0x14006f9a0
   14132c9d7:	90                   	nop
   14132c9d8:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   14132c9dc:	48 83 fa 0f          	cmp    rdx,0xf
   14132c9e0:	0f 86 6a 1a 00 00    	jbe    0x14132e450
   14132c9e6:	48 ff c2             	inc    rdx
   14132c9e9:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   14132c9ed:	48 8b c1             	mov    rax,rcx
   14132c9f0:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132c9f7:	72 1c                	jb     0x14132ca15
   14132c9f9:	48 83 c2 27          	add    rdx,0x27
   14132c9fd:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132ca01:	48 2b c1             	sub    rax,rcx
   14132ca04:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132ca08:	48 83 f8 1f          	cmp    rax,0x1f
   14132ca0c:	76 07                	jbe    0x14132ca15
   14132ca0e:	ff 15 8c 40 2b 00    	call   QWORD PTR [rip+0x2b408c]        # 0x1415e0aa0
   14132ca14:	cc                   	int3
   14132ca15:	e8 d6 7b 20 00       	call   0x1415345f0
   14132ca1a:	e9 31 1a 00 00       	jmp    0x14132e450
   14132ca1f:	41 0f b7 87 ac 00 00 	movzx  eax,WORD PTR [r15+0xac]
   14132ca26:	00 
   14132ca27:	66 83 f8 ff          	cmp    ax,0xffff
   14132ca2b:	74 10                	je     0x14132ca3d
   14132ca2d:	44 0f b7 c8          	movzx  r9d,ax
   14132ca31:	66 89 44 24 32       	mov    WORD PTR [rsp+0x32],ax
   14132ca36:	eb 0b                	jmp    0x14132ca43
   14132ca38:	4c 89 64 24 40       	mov    QWORD PTR [rsp+0x40],r12
   14132ca3d:	44 0f b7 4c 24 32    	movzx  r9d,WORD PTR [rsp+0x32]
   14132ca43:	0f 57 c0             	xorps  xmm0,xmm0
   14132ca46:	0f 11 45 ff          	movups XMMWORD PTR [rbp-0x1],xmm0
   14132ca4a:	4c 89 65 0f          	mov    QWORD PTR [rbp+0xf],r12
   14132ca4e:	48 c7 45 17 0f 00 00 	mov    QWORD PTR [rbp+0x17],0xf
   14132ca55:	00 
   14132ca56:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
   14132ca5a:	49 8b 85 80 0d 00 00 	mov    rax,QWORD PTR [r13+0xd80]
   14132ca61:	bb 01 00 00 00       	mov    ebx,0x1
   14132ca66:	48 85 c0             	test   rax,rax
   14132ca69:	74 42                	je     0x14132caad
   14132ca6b:	48 83 78 30 00       	cmp    QWORD PTR [rax+0x30],0x0
   14132ca70:	74 3b                	je     0x14132caad
   14132ca72:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132ca78:	48 8d 15 b5 73 2b 00 	lea    rdx,[rip+0x2b73b5]        # 0x1415e3e34
   14132ca7f:	49 8b ce             	mov    rcx,r14
   14132ca82:	e8 d9 2d d4 fe       	call   0x14006f860
   14132ca87:	49 8b 95 80 0d 00 00 	mov    rdx,QWORD PTR [r13+0xd80]
   14132ca8e:	48 83 c2 20          	add    rdx,0x20
   14132ca92:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132ca96:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132ca9b:	76 03                	jbe    0x14132caa0
   14132ca9d:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132caa0:	49 8b ce             	mov    rcx,r14
   14132caa3:	e8 f8 2e d4 fe       	call   0x14006f9a0
   14132caa8:	e9 21 17 00 00       	jmp    0x14132e1ce
   14132caad:	8b 05 b5 97 56 00    	mov    eax,DWORD PTR [rip+0x5697b5]        # 0x141896268
   14132cab3:	3b c3                	cmp    eax,ebx
   14132cab5:	75 30                	jne    0x14132cae7
   14132cab7:	48 8b 05 02 25 0b 01 	mov    rax,QWORD PTR [rip+0x10b2502]        # 0x1423defc0
   14132cabe:	48 2b 05 f3 24 0b 01 	sub    rax,QWORD PTR [rip+0x10b24f3]        # 0x1423defb8
   14132cac5:	48 c1 f8 03          	sar    rax,0x3
   14132cac9:	48 85 c0             	test   rax,rax
   14132cacc:	74 2a                	je     0x14132caf8
   14132cace:	48 8b 05 2b 25 0b 01 	mov    rax,QWORD PTR [rip+0x10b252b]        # 0x1423df000
   14132cad5:	48 85 c0             	test   rax,rax
   14132cad8:	74 1e                	je     0x14132caf8
   14132cada:	0f b7 80 a4 00 00 00 	movzx  eax,WORD PTR [rax+0xa4]
   14132cae1:	89 44 24 38          	mov    DWORD PTR [rsp+0x38],eax
   14132cae5:	eb 19                	jmp    0x14132cb00
   14132cae7:	85 c0                	test   eax,eax
   14132cae9:	75 0d                	jne    0x14132caf8
   14132caeb:	0f b7 05 7a 0a 06 01 	movzx  eax,WORD PTR [rip+0x1060a7a]        # 0x14238d56c
   14132caf2:	89 44 24 38          	mov    DWORD PTR [rsp+0x38],eax
   14132caf6:	eb 08                	jmp    0x14132cb00
   14132caf8:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [rsp+0x38],0xffffffff
   14132caff:	ff 
   14132cb00:	0f 11 45 9f          	movups XMMWORD PTR [rbp-0x61],xmm0
   14132cb04:	4d 8b fc             	mov    r15,r12
   14132cb07:	4c 89 65 af          	mov    QWORD PTR [rbp-0x51],r12
   14132cb0b:	be 0f 00 00 00       	mov    esi,0xf
   14132cb10:	48 89 75 b7          	mov    QWORD PTR [rbp-0x49],rsi
   14132cb14:	c6 45 9f 00          	mov    BYTE PTR [rbp-0x61],0x0
   14132cb18:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14132cb1c:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14132cb20:	48 89 75 d7          	mov    QWORD PTR [rbp-0x29],rsi
   14132cb24:	c6 45 bf 00          	mov    BYTE PTR [rbp-0x41],0x0
   14132cb28:	40 32 ff             	xor    dil,dil
   14132cb2b:	40 88 7c 24 30       	mov    BYTE PTR [rsp+0x30],dil
   14132cb30:	49 83 bd 90 00 00 00 	cmp    QWORD PTR [r13+0x90],0x0
   14132cb37:	00 
   14132cb38:	74 2f                	je     0x14132cb69
   14132cb3a:	49 8d 95 80 00 00 00 	lea    rdx,[r13+0x80]
   14132cb41:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132cb45:	48 3b c2             	cmp    rax,rdx
   14132cb48:	0f 84 e8 12 00 00    	je     0x14132de36
   14132cb4e:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132cb52:	48 39 72 18          	cmp    QWORD PTR [rdx+0x18],rsi
   14132cb56:	76 03                	jbe    0x14132cb5b
   14132cb58:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132cb5b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cb5f:	e8 fc 2c d4 fe       	call   0x14006f860
   14132cb64:	e9 cd 12 00 00       	jmp    0x14132de36
   14132cb69:	49 0f bf bd 2c 01 00 	movsx  rdi,WORD PTR [r13+0x12c]
   14132cb70:	00 
   14132cb71:	49 0f bf 9d a4 00 00 	movsx  rbx,WORD PTR [r13+0xa4]
   14132cb78:	00 
   14132cb79:	44 0f b7 c7          	movzx  r8d,di
   14132cb7d:	0f b7 d3             	movzx  edx,bx
   14132cb80:	48 8d 0d b1 9d 1b 01 	lea    rcx,[rip+0x11b9db1]        # 0x1424e6938
   14132cb87:	e8 d4 de fd fe       	call   0x14030aa60
   14132cb8c:	84 c0                	test   al,al
   14132cb8e:	0f 84 ca 01 00 00    	je     0x14132cd5e
   14132cb94:	66 85 db             	test   bx,bx
   14132cb97:	0f 88 b9 01 00 00    	js     0x14132cd56
   14132cb9d:	4c 8b 05 b4 9d 1b 01 	mov    r8,QWORD PTR [rip+0x11b9db4]        # 0x1424e6958
   14132cba4:	48 8b 0d b5 9d 1b 01 	mov    rcx,QWORD PTR [rip+0x11b9db5]        # 0x1424e6960
   14132cbab:	48 8b c1             	mov    rax,rcx
   14132cbae:	49 2b c0             	sub    rax,r8
   14132cbb1:	48 c1 f8 03          	sar    rax,0x3
   14132cbb5:	48 3b d8             	cmp    rbx,rax
   14132cbb8:	0f 83 98 01 00 00    	jae    0x14132cd56
   14132cbbe:	b8 86 00 00 00       	mov    eax,0x86
   14132cbc3:	66 44 3b c8          	cmp    r9w,ax
   14132cbc7:	0f 87 89 01 00 00    	ja     0x14132cd56
   14132cbcd:	4d 8b c8             	mov    r9,r8
   14132cbd0:	66 85 ff             	test   di,di
   14132cbd3:	0f 88 0b 01 00 00    	js     0x14132cce4
   14132cbd9:	49 8b 04 d8          	mov    rax,QWORD PTR [r8+rbx*8]
   14132cbdd:	4c 8b 90 78 01 00 00 	mov    r10,QWORD PTR [rax+0x178]
   14132cbe4:	4c 8b df             	mov    r11,rdi
   14132cbe7:	48 8b 80 80 01 00 00 	mov    rax,QWORD PTR [rax+0x180]
   14132cbee:	49 2b c2             	sub    rax,r10
   14132cbf1:	48 c1 f8 03          	sar    rax,0x3
   14132cbf5:	48 3b f8             	cmp    rdi,rax
   14132cbf8:	0f 83 e6 00 00 00    	jae    0x14132cce4
   14132cbfe:	48 0f bf 7c 24 32    	movsx  rdi,WORD PTR [rsp+0x32]
   14132cc04:	48 8d 97 c1 00 00 00 	lea    rdx,[rdi+0xc1]
   14132cc0b:	48 c1 e2 05          	shl    rdx,0x5
   14132cc0f:	4b 03 14 da          	add    rdx,QWORD PTR [r10+r11*8]
   14132cc13:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132cc17:	48 3b c2             	cmp    rax,rdx
   14132cc1a:	74 36                	je     0x14132cc52
   14132cc1c:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132cc20:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132cc25:	76 03                	jbe    0x14132cc2a
   14132cc27:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132cc2a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cc2e:	e8 2d 2c d4 fe       	call   0x14006f860
   14132cc33:	4c 8b 7d af          	mov    r15,QWORD PTR [rbp-0x51]
   14132cc37:	4d 85 ff             	test   r15,r15
   14132cc3a:	0f 85 dd 00 00 00    	jne    0x14132cd1d
   14132cc40:	48 8b 75 b7          	mov    rsi,QWORD PTR [rbp-0x49]
   14132cc44:	48 8b 0d 15 9d 1b 01 	mov    rcx,QWORD PTR [rip+0x11b9d15]        # 0x1424e6960
   14132cc4b:	4c 8b 05 06 9d 1b 01 	mov    r8,QWORD PTR [rip+0x11b9d06]        # 0x1424e6958
   14132cc52:	49 2b c8             	sub    rcx,r8
   14132cc55:	48 c1 f9 03          	sar    rcx,0x3
   14132cc59:	48 3b d9             	cmp    rbx,rcx
   14132cc5c:	0f 83 f4 00 00 00    	jae    0x14132cd56
   14132cc62:	48 8d 57 11          	lea    rdx,[rdi+0x11]
   14132cc66:	48 c1 e2 05          	shl    rdx,0x5
   14132cc6a:	49 03 14 d8          	add    rdx,QWORD PTR [r8+rbx*8]
   14132cc6e:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132cc72:	48 3b c2             	cmp    rax,rdx
   14132cc75:	74 1f                	je     0x14132cc96
   14132cc77:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132cc7b:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132cc80:	76 03                	jbe    0x14132cc85
   14132cc82:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132cc85:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cc89:	e8 d2 2b d4 fe       	call   0x14006f860
   14132cc8e:	48 8b 75 b7          	mov    rsi,QWORD PTR [rbp-0x49]
   14132cc92:	4c 8b 7d af          	mov    r15,QWORD PTR [rbp-0x51]
   14132cc96:	4d 85 ff             	test   r15,r15
   14132cc99:	0f 84 b7 00 00 00    	je     0x14132cd56
   14132cc9f:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132cca3:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   14132cca7:	48 83 fe 0f          	cmp    rsi,0xf
   14132ccab:	48 0f 47 c1          	cmova  rax,rcx
   14132ccaf:	80 38 61             	cmp    BYTE PTR [rax],0x61
   14132ccb2:	0f 8c 9e 00 00 00    	jl     0x14132cd56
   14132ccb8:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132ccbc:	48 83 fe 0f          	cmp    rsi,0xf
   14132ccc0:	48 0f 47 c1          	cmova  rax,rcx
   14132ccc4:	80 38 7a             	cmp    BYTE PTR [rax],0x7a
   14132ccc7:	0f 8f 89 00 00 00    	jg     0x14132cd56
   14132cccd:	48 83 fe 0f          	cmp    rsi,0xf
   14132ccd1:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132ccd5:	48 0f 47 c1          	cmova  rax,rcx
   14132ccd9:	80 00 e0             	add    BYTE PTR [rax],0xe0
   14132ccdc:	40 b7 01             	mov    dil,0x1
   14132ccdf:	e9 4d 11 00 00       	jmp    0x14132de31
   14132cce4:	48 0f bf 54 24 32    	movsx  rdx,WORD PTR [rsp+0x32]
   14132ccea:	48 83 c2 11          	add    rdx,0x11
   14132ccee:	48 c1 e2 05          	shl    rdx,0x5
   14132ccf2:	49 03 14 d9          	add    rdx,QWORD PTR [r9+rbx*8]
   14132ccf6:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132ccfa:	48 3b c2             	cmp    rax,rdx
   14132ccfd:	74 57                	je     0x14132cd56
   14132ccff:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132cd03:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132cd08:	76 03                	jbe    0x14132cd0d
   14132cd0a:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132cd0d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cd11:	e8 4a 2b d4 fe       	call   0x14006f860
   14132cd16:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   14132cd1b:	76 39                	jbe    0x14132cd56
   14132cd1d:	48 8b 55 b7          	mov    rdx,QWORD PTR [rbp-0x49]
   14132cd21:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132cd25:	48 83 fa 0f          	cmp    rdx,0xf
   14132cd29:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   14132cd2d:	48 0f 47 c1          	cmova  rax,rcx
   14132cd31:	80 38 61             	cmp    BYTE PTR [rax],0x61
   14132cd34:	7c 20                	jl     0x14132cd56
   14132cd36:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132cd3a:	48 83 fa 0f          	cmp    rdx,0xf
   14132cd3e:	48 0f 47 c1          	cmova  rax,rcx
   14132cd42:	80 38 7a             	cmp    BYTE PTR [rax],0x7a
   14132cd45:	7f 0f                	jg     0x14132cd56
   14132cd47:	48 83 fa 0f          	cmp    rdx,0xf
   14132cd4b:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132cd4f:	48 0f 47 c1          	cmova  rax,rcx
   14132cd53:	80 00 e0             	add    BYTE PTR [rax],0xe0
   14132cd56:	40 b7 01             	mov    dil,0x1
   14132cd59:	e9 d3 10 00 00       	jmp    0x14132de31
   14132cd5e:	49 0f bf c9          	movsx  rcx,r9w
   14132cd62:	b8 86 00 00 00       	mov    eax,0x86
   14132cd67:	3b c8                	cmp    ecx,eax
   14132cd69:	0f 87 93 0c 00 00    	ja     0x14132da02
   14132cd6f:	48 8d 15 8a 32 cd fe 	lea    rdx,[rip+0xfffffffffecd328a]        # 0x140000000
   14132cd76:	8b 8c 8a 78 e4 32 01 	mov    ecx,DWORD PTR [rdx+rcx*4+0x132e478]
   14132cd7d:	48 03 ca             	add    rcx,rdx
   14132cd80:	ff e1                	jmp    rcx
   14132cd82:	48 c7 45 af 05 00 00 	mov    QWORD PTR [rbp-0x51],0x5
   14132cd89:	00 
   14132cd8a:	8b 05 60 6b 2d 00    	mov    eax,DWORD PTR [rip+0x2d6b60]        # 0x1416038f0
   14132cd90:	89 45 9f             	mov    DWORD PTR [rbp-0x61],eax
   14132cd93:	0f b6 05 5a 6b 2d 00 	movzx  eax,BYTE PTR [rip+0x2d6b5a]        # 0x1416038f4
   14132cd9a:	88 45 a3             	mov    BYTE PTR [rbp-0x5d],al
   14132cd9d:	c6 45 a4 00          	mov    BYTE PTR [rbp-0x5c],0x0
   14132cda1:	e9 95 0c 00 00       	jmp    0x14132da3b
   14132cda6:	48 c7 45 af 0a 00 00 	mov    QWORD PTR [rbp-0x51],0xa
   14132cdad:	00 
   14132cdae:	f2 0f 10 05 7a fc 44 	movsd  xmm0,QWORD PTR [rip+0x44fc7a]        # 0x14177ca30
   14132cdb5:	00 
   14132cdb6:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   14132cdbb:	0f b7 05 76 fc 44 00 	movzx  eax,WORD PTR [rip+0x44fc76]        # 0x14177ca38
   14132cdc2:	66 89 45 a7          	mov    WORD PTR [rbp-0x59],ax
   14132cdc6:	c6 45 a9 00          	mov    BYTE PTR [rbp-0x57],0x0
   14132cdca:	e9 6c 0c 00 00       	jmp    0x14132da3b
   14132cdcf:	48 c7 45 af 09 00 00 	mov    QWORD PTR [rbp-0x51],0x9
   14132cdd6:	00 
   14132cdd7:	f2 0f 10 05 21 b2 2f 	movsd  xmm0,QWORD PTR [rip+0x2fb221]        # 0x141628000
   14132cdde:	00 
   14132cddf:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   14132cde4:	0f b6 05 1d b2 2f 00 	movzx  eax,BYTE PTR [rip+0x2fb21d]        # 0x141628008
   14132cdeb:	88 45 a7             	mov    BYTE PTR [rbp-0x59],al
   14132cdee:	c6 45 a8 00          	mov    BYTE PTR [rbp-0x58],0x0
   14132cdf2:	e9 44 0c 00 00       	jmp    0x14132da3b
   14132cdf7:	48 c7 45 af 06 00 00 	mov    QWORD PTR [rbp-0x51],0x6
   14132cdfe:	00 
   14132cdff:	8b 05 07 b2 2f 00    	mov    eax,DWORD PTR [rip+0x2fb207]        # 0x14162800c
   14132ce05:	89 45 9f             	mov    DWORD PTR [rbp-0x61],eax
   14132ce08:	0f b7 05 01 b2 2f 00 	movzx  eax,WORD PTR [rip+0x2fb201]        # 0x141628010
   14132ce0f:	66 89 45 a3          	mov    WORD PTR [rbp-0x5d],ax
   14132ce13:	c6 45 a5 00          	mov    BYTE PTR [rbp-0x5b],0x0
   14132ce17:	e9 1f 0c 00 00       	jmp    0x14132da3b
   14132ce1c:	48 c7 45 af 0a 00 00 	mov    QWORD PTR [rbp-0x51],0xa
   14132ce23:	00 
   14132ce24:	f2 0f 10 05 e4 6a 2d 	movsd  xmm0,QWORD PTR [rip+0x2d6ae4]        # 0x141603910
   14132ce2b:	00 
   14132ce2c:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   14132ce31:	0f b7 05 e0 6a 2d 00 	movzx  eax,WORD PTR [rip+0x2d6ae0]        # 0x141603918
   14132ce38:	66 89 45 a7          	mov    WORD PTR [rbp-0x59],ax
   14132ce3c:	c6 45 a9 00          	mov    BYTE PTR [rbp-0x57],0x0
   14132ce40:	e9 f6 0b 00 00       	jmp    0x14132da3b
   14132ce45:	48 c7 45 af 0b 00 00 	mov    QWORD PTR [rbp-0x51],0xb
   14132ce4c:	00 
   14132ce4d:	f2 0f 10 05 43 b1 2f 	movsd  xmm0,QWORD PTR [rip+0x2fb143]        # 0x141627f98
   14132ce54:	00 
   14132ce55:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   14132ce5a:	0f b7 05 3f b1 2f 00 	movzx  eax,WORD PTR [rip+0x2fb13f]        # 0x141627fa0
   14132ce61:	66 89 45 a7          	mov    WORD PTR [rbp-0x59],ax
   14132ce65:	0f b6 05 36 b1 2f 00 	movzx  eax,BYTE PTR [rip+0x2fb136]        # 0x141627fa2
   14132ce6c:	88 45 a9             	mov    BYTE PTR [rbp-0x57],al
   14132ce6f:	c6 45 aa 00          	mov    BYTE PTR [rbp-0x56],0x0
   14132ce73:	e9 c3 0b 00 00       	jmp    0x14132da3b
   14132ce78:	48 c7 45 af 08 00 00 	mov    QWORD PTR [rbp-0x51],0x8
   14132ce7f:	00 
   14132ce80:	48 b8 45 6e 67 72 61 	movabs rax,0x7265766172676e45
   14132ce87:	76 65 72 
   14132ce8a:	48 89 45 9f          	mov    QWORD PTR [rbp-0x61],rax
   14132ce8e:	c6 45 a7 00          	mov    BYTE PTR [rbp-0x59],0x0
   14132ce92:	e9 a4 0b 00 00       	jmp    0x14132da3b
   14132ce97:	48 8d 15 62 33 37 00 	lea    rdx,[rip+0x373362]        # 0x1416a0200
   14132ce9e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cea2:	e8 69 26 d4 fe       	call   0x14006f510
   14132cea7:	e9 8f 0b 00 00       	jmp    0x14132da3b
   14132ceac:	48 8d 15 3d 33 37 00 	lea    rdx,[rip+0x37333d]        # 0x1416a01f0
   14132ceb3:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132ceb7:	e8 54 26 d4 fe       	call   0x14006f510
   14132cebc:	e9 7a 0b 00 00       	jmp    0x14132da3b
   14132cec1:	48 8d 15 8c 38 37 00 	lea    rdx,[rip+0x37388c]        # 0x1416a0754
   14132cec8:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cecc:	e8 3f 26 d4 fe       	call   0x14006f510
   14132ced1:	e9 65 0b 00 00       	jmp    0x14132da3b
   14132ced6:	48 8d 15 47 fb 44 00 	lea    rdx,[rip+0x44fb47]        # 0x14177ca24
   14132cedd:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cee1:	e8 2a 26 d4 fe       	call   0x14006f510
   14132cee6:	e9 50 0b 00 00       	jmp    0x14132da3b
   14132ceeb:	48 8d 15 7e 38 37 00 	lea    rdx,[rip+0x37387e]        # 0x1416a0770
   14132cef2:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cef6:	e8 15 26 d4 fe       	call   0x14006f510
   14132cefb:	e9 3b 0b 00 00       	jmp    0x14132da3b
   14132cf00:	48 8d 15 59 38 37 00 	lea    rdx,[rip+0x373859]        # 0x1416a0760
   14132cf07:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cf0b:	e8 00 26 d4 fe       	call   0x14006f510
   14132cf10:	e9 26 0b 00 00       	jmp    0x14132da3b
   14132cf15:	48 8d 15 cc e2 2c 00 	lea    rdx,[rip+0x2ce2cc]        # 0x1415fb1e8
   14132cf1c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cf20:	e8 eb 25 d4 fe       	call   0x14006f510
   14132cf25:	e9 11 0b 00 00       	jmp    0x14132da3b
   14132cf2a:	48 8d 15 8f 38 37 00 	lea    rdx,[rip+0x37388f]        # 0x1416a07c0
   14132cf31:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cf35:	e8 d6 25 d4 fe       	call   0x14006f510
   14132cf3a:	e9 fc 0a 00 00       	jmp    0x14132da3b
   14132cf3f:	48 8d 15 52 38 37 00 	lea    rdx,[rip+0x373852]        # 0x1416a0798
   14132cf46:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cf4a:	e8 c1 25 d4 fe       	call   0x14006f510
   14132cf4f:	e9 e7 0a 00 00       	jmp    0x14132da3b
   14132cf54:	48 8d 15 f5 b0 2f 00 	lea    rdx,[rip+0x2fb0f5]        # 0x141628050
   14132cf5b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cf5f:	e8 ac 25 d4 fe       	call   0x14006f510
   14132cf64:	e9 d2 0a 00 00       	jmp    0x14132da3b
   14132cf69:	48 8d 15 80 37 37 00 	lea    rdx,[rip+0x373780]        # 0x1416a06f0
   14132cf70:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cf74:	e8 97 25 d4 fe       	call   0x14006f510
   14132cf79:	e9 bd 0a 00 00       	jmp    0x14132da3b
   14132cf7e:	48 8d 15 e3 35 37 00 	lea    rdx,[rip+0x3735e3]        # 0x1416a0568
   14132cf85:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cf89:	e8 82 25 d4 fe       	call   0x14006f510
   14132cf8e:	e9 a8 0a 00 00       	jmp    0x14132da3b
   14132cf93:	48 8d 15 6e fb 44 00 	lea    rdx,[rip+0x44fb6e]        # 0x14177cb08
   14132cf9a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132cf9e:	e8 6d 25 d4 fe       	call   0x14006f510
   14132cfa3:	e9 93 0a 00 00       	jmp    0x14132da3b
   14132cfa8:	48 c7 45 af 0a 00 00 	mov    QWORD PTR [rbp-0x51],0xa
   14132cfaf:	00 
   14132cfb0:	f2 0f 10 05 d0 35 37 	movsd  xmm0,QWORD PTR [rip+0x3735d0]        # 0x1416a0588
   14132cfb7:	00 
   14132cfb8:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   14132cfbd:	0f b7 05 cc 35 37 00 	movzx  eax,WORD PTR [rip+0x3735cc]        # 0x1416a0590
   14132cfc4:	66 89 45 a7          	mov    WORD PTR [rbp-0x59],ax
   14132cfc8:	c6 45 a9 00          	mov    BYTE PTR [rbp-0x57],0x0
   14132cfcc:	e9 6a 0a 00 00       	jmp    0x14132da3b
   14132cfd1:	48 c7 45 af 0c 00 00 	mov    QWORD PTR [rbp-0x51],0xc
   14132cfd8:	00 
   14132cfd9:	f2 0f 10 05 17 fb 44 	movsd  xmm0,QWORD PTR [rip+0x44fb17]        # 0x14177caf8
   14132cfe0:	00 
   14132cfe1:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   14132cfe6:	8b 05 14 fb 44 00    	mov    eax,DWORD PTR [rip+0x44fb14]        # 0x14177cb00
   14132cfec:	89 45 a7             	mov    DWORD PTR [rbp-0x59],eax
   14132cfef:	c6 45 ab 00          	mov    BYTE PTR [rbp-0x55],0x0
   14132cff3:	e9 43 0a 00 00       	jmp    0x14132da3b
   14132cff8:	48 8d 15 19 b0 2f 00 	lea    rdx,[rip+0x2fb019]        # 0x141628018
   14132cfff:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d003:	e8 08 25 d4 fe       	call   0x14006f510
   14132d008:	e9 2e 0a 00 00       	jmp    0x14132da3b
   14132d00d:	48 8d 15 84 35 37 00 	lea    rdx,[rip+0x373584]        # 0x1416a0598
   14132d014:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d018:	e8 f3 24 d4 fe       	call   0x14006f510
   14132d01d:	e9 19 0a 00 00       	jmp    0x14132da3b
   14132d022:	48 8d 15 7f 35 37 00 	lea    rdx,[rip+0x37357f]        # 0x1416a05a8
   14132d029:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d02d:	e8 de 24 d4 fe       	call   0x14006f510
   14132d032:	e9 04 0a 00 00       	jmp    0x14132da3b
   14132d037:	48 8d 15 aa fb 31 00 	lea    rdx,[rip+0x31fbaa]        # 0x14164cbe8
   14132d03e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d042:	e8 c9 24 d4 fe       	call   0x14006f510
   14132d047:	e9 ef 09 00 00       	jmp    0x14132da3b
   14132d04c:	48 8d 15 65 35 37 00 	lea    rdx,[rip+0x373565]        # 0x1416a05b8
   14132d053:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d057:	e8 b4 24 d4 fe       	call   0x14006f510
   14132d05c:	e9 da 09 00 00       	jmp    0x14132da3b
   14132d061:	48 8d 15 60 35 37 00 	lea    rdx,[rip+0x373560]        # 0x1416a05c8
   14132d068:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d06c:	e8 9f 24 d4 fe       	call   0x14006f510
   14132d071:	e9 c5 09 00 00       	jmp    0x14132da3b
   14132d076:	48 8d 15 5b 35 37 00 	lea    rdx,[rip+0x37355b]        # 0x1416a05d8
   14132d07d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d081:	e8 8a 24 d4 fe       	call   0x14006f510
   14132d086:	e9 b0 09 00 00       	jmp    0x14132da3b
   14132d08b:	48 8d 15 52 35 37 00 	lea    rdx,[rip+0x373552]        # 0x1416a05e4
   14132d092:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d096:	e8 75 24 d4 fe       	call   0x14006f510
   14132d09b:	e9 9b 09 00 00       	jmp    0x14132da3b
   14132d0a0:	48 8d 15 c5 39 37 00 	lea    rdx,[rip+0x3739c5]        # 0x1416a0a6c
   14132d0a7:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d0ab:	e8 60 24 d4 fe       	call   0x14006f510
   14132d0b0:	e9 86 09 00 00       	jmp    0x14132da3b
   14132d0b5:	48 8d 15 34 35 37 00 	lea    rdx,[rip+0x373534]        # 0x1416a05f0
   14132d0bc:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d0c0:	e8 4b 24 d4 fe       	call   0x14006f510
   14132d0c5:	e9 71 09 00 00       	jmp    0x14132da3b
   14132d0ca:	48 8d 15 4f fa 44 00 	lea    rdx,[rip+0x44fa4f]        # 0x14177cb20
   14132d0d1:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d0d5:	e8 36 24 d4 fe       	call   0x14006f510
   14132d0da:	e9 5c 09 00 00       	jmp    0x14132da3b
   14132d0df:	48 8d 15 62 39 37 00 	lea    rdx,[rip+0x373962]        # 0x1416a0a48
   14132d0e6:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d0ea:	e8 21 24 d4 fe       	call   0x14006f510
   14132d0ef:	e9 47 09 00 00       	jmp    0x14132da3b
   14132d0f4:	48 8d 15 7d 39 37 00 	lea    rdx,[rip+0x37397d]        # 0x1416a0a78
   14132d0fb:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d0ff:	e8 0c 24 d4 fe       	call   0x14006f510
   14132d104:	e9 32 09 00 00       	jmp    0x14132da3b
   14132d109:	48 8d 15 74 39 37 00 	lea    rdx,[rip+0x373974]        # 0x1416a0a84
   14132d110:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d114:	e8 f7 23 d4 fe       	call   0x14006f510
   14132d119:	e9 1d 09 00 00       	jmp    0x14132da3b
   14132d11e:	48 8d 15 5b fb 31 00 	lea    rdx,[rip+0x31fb5b]        # 0x14164cc80
   14132d125:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d129:	e8 e2 23 d4 fe       	call   0x14006f510
   14132d12e:	e9 08 09 00 00       	jmp    0x14132da3b
   14132d133:	48 8d 15 e6 34 37 00 	lea    rdx,[rip+0x3734e6]        # 0x1416a0620
   14132d13a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d13e:	e8 cd 23 d4 fe       	call   0x14006f510
   14132d143:	e9 f3 08 00 00       	jmp    0x14132da3b
   14132d148:	48 8d 15 b9 35 37 00 	lea    rdx,[rip+0x3735b9]        # 0x1416a0708
   14132d14f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d153:	e8 98 23 d4 fe       	call   0x14006f4f0
   14132d158:	e9 de 08 00 00       	jmp    0x14132da3b
   14132d15d:	48 8d 15 ac f9 44 00 	lea    rdx,[rip+0x44f9ac]        # 0x14177cb10
   14132d164:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d168:	e8 a3 23 d4 fe       	call   0x14006f510
   14132d16d:	e9 c9 08 00 00       	jmp    0x14132da3b
   14132d172:	48 8d 15 67 35 37 00 	lea    rdx,[rip+0x373567]        # 0x1416a06e0
   14132d179:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d17d:	e8 8e 23 d4 fe       	call   0x14006f510
   14132d182:	e9 b4 08 00 00       	jmp    0x14132da3b
   14132d187:	48 8d 15 fa 35 37 00 	lea    rdx,[rip+0x3735fa]        # 0x1416a0788
   14132d18e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d192:	e8 79 23 d4 fe       	call   0x14006f510
   14132d197:	e9 9f 08 00 00       	jmp    0x14132da3b
   14132d19c:	48 8d 15 0d 36 37 00 	lea    rdx,[rip+0x37360d]        # 0x1416a07b0
   14132d1a3:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d1a7:	e8 64 23 d4 fe       	call   0x14006f510
   14132d1ac:	e9 8a 08 00 00       	jmp    0x14132da3b
   14132d1b1:	48 8d 15 38 ad 2f 00 	lea    rdx,[rip+0x2fad38]        # 0x141627ef0
   14132d1b8:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d1bc:	e8 4f 23 d4 fe       	call   0x14006f510
   14132d1c1:	e9 75 08 00 00       	jmp    0x14132da3b
   14132d1c6:	48 8d 15 8b 37 37 00 	lea    rdx,[rip+0x37378b]        # 0x1416a0958
   14132d1cd:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d1d1:	e8 3a 23 d4 fe       	call   0x14006f510
   14132d1d6:	e9 60 08 00 00       	jmp    0x14132da3b
   14132d1db:	48 8d 15 82 37 37 00 	lea    rdx,[rip+0x373782]        # 0x1416a0964
   14132d1e2:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d1e6:	e8 25 23 d4 fe       	call   0x14006f510
   14132d1eb:	e9 4b 08 00 00       	jmp    0x14132da3b
   14132d1f0:	48 8d 15 75 37 37 00 	lea    rdx,[rip+0x373775]        # 0x1416a096c
   14132d1f7:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d1fb:	e8 10 23 d4 fe       	call   0x14006f510
   14132d200:	e9 36 08 00 00       	jmp    0x14132da3b
   14132d205:	48 8d 15 6c 37 37 00 	lea    rdx,[rip+0x37376c]        # 0x1416a0978
   14132d20c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d210:	e8 fb 22 d4 fe       	call   0x14006f510
   14132d215:	e9 21 08 00 00       	jmp    0x14132da3b
   14132d21a:	48 8d 15 5f 37 37 00 	lea    rdx,[rip+0x37375f]        # 0x1416a0980
   14132d221:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d225:	e8 e6 22 d4 fe       	call   0x14006f510
   14132d22a:	e9 0c 08 00 00       	jmp    0x14132da3b
   14132d22f:	48 8d 15 f2 ae 30 00 	lea    rdx,[rip+0x30aef2]        # 0x141638128
   14132d236:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d23a:	e8 d1 22 d4 fe       	call   0x14006f510
   14132d23f:	e9 f7 07 00 00       	jmp    0x14132da3b
   14132d244:	48 8d 15 c5 36 37 00 	lea    rdx,[rip+0x3736c5]        # 0x1416a0910
   14132d24b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d24f:	e8 bc 22 d4 fe       	call   0x14006f510
   14132d254:	e9 e2 07 00 00       	jmp    0x14132da3b
   14132d259:	48 8d 15 a4 36 37 00 	lea    rdx,[rip+0x3736a4]        # 0x1416a0904
   14132d260:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d264:	e8 a7 22 d4 fe       	call   0x14006f510
   14132d269:	e9 cd 07 00 00       	jmp    0x14132da3b
   14132d26e:	48 8d 15 53 9d 2e 00 	lea    rdx,[rip+0x2e9d53]        # 0x141616fc8
   14132d275:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d279:	e8 92 22 d4 fe       	call   0x14006f510
   14132d27e:	e9 b8 07 00 00       	jmp    0x14132da3b
   14132d283:	48 8d 15 da ac 2f 00 	lea    rdx,[rip+0x2facda]        # 0x141627f64
   14132d28a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d28e:	e8 7d 22 d4 fe       	call   0x14006f510
   14132d293:	e9 a3 07 00 00       	jmp    0x14132da3b
   14132d298:	48 8d 15 bd ac 2f 00 	lea    rdx,[rip+0x2facbd]        # 0x141627f5c
   14132d29f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d2a3:	e8 68 22 d4 fe       	call   0x14006f510
   14132d2a8:	e9 8e 07 00 00       	jmp    0x14132da3b
   14132d2ad:	48 8d 15 a4 37 37 00 	lea    rdx,[rip+0x3737a4]        # 0x1416a0a58
   14132d2b4:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d2b8:	e8 53 22 d4 fe       	call   0x14006f510
   14132d2bd:	e9 79 07 00 00       	jmp    0x14132da3b
   14132d2c2:	48 8d 15 97 37 37 00 	lea    rdx,[rip+0x373797]        # 0x1416a0a60
   14132d2c9:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d2cd:	e8 3e 22 d4 fe       	call   0x14006f510
   14132d2d2:	e9 64 07 00 00       	jmp    0x14132da3b
   14132d2d7:	48 8d 15 ea 34 37 00 	lea    rdx,[rip+0x3734ea]        # 0x1416a07c8
   14132d2de:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d2e2:	e8 29 22 d4 fe       	call   0x14006f510
   14132d2e7:	e9 4f 07 00 00       	jmp    0x14132da3b
   14132d2ec:	48 8d 15 dd 34 37 00 	lea    rdx,[rip+0x3734dd]        # 0x1416a07d0
   14132d2f3:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d2f7:	e8 14 22 d4 fe       	call   0x14006f510
   14132d2fc:	e9 3a 07 00 00       	jmp    0x14132da3b
   14132d301:	48 8d 15 84 37 37 00 	lea    rdx,[rip+0x373784]        # 0x1416a0a8c
   14132d308:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d30c:	e8 ff 21 d4 fe       	call   0x14006f510
   14132d311:	e9 25 07 00 00       	jmp    0x14132da3b
   14132d316:	48 8d 15 23 f8 44 00 	lea    rdx,[rip+0x44f823]        # 0x14177cb40
   14132d31d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d321:	e8 ea 21 d4 fe       	call   0x14006f510
   14132d326:	e9 10 07 00 00       	jmp    0x14132da3b
   14132d32b:	48 8d 15 f6 33 37 00 	lea    rdx,[rip+0x3733f6]        # 0x1416a0728
   14132d332:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d336:	e8 d5 21 d4 fe       	call   0x14006f510
   14132d33b:	e9 fb 06 00 00       	jmp    0x14132da3b
   14132d340:	48 8d 15 f1 33 37 00 	lea    rdx,[rip+0x3733f1]        # 0x1416a0738
   14132d347:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d34b:	e8 c0 21 d4 fe       	call   0x14006f510
   14132d350:	e9 e6 06 00 00       	jmp    0x14132da3b
   14132d355:	48 8d 15 ec 33 37 00 	lea    rdx,[rip+0x3733ec]        # 0x1416a0748
   14132d35c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d360:	e8 ab 21 d4 fe       	call   0x14006f510
   14132d365:	e9 d1 06 00 00       	jmp    0x14132da3b
   14132d36a:	48 8d 15 bf f7 44 00 	lea    rdx,[rip+0x44f7bf]        # 0x14177cb30
   14132d371:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d375:	e8 96 21 d4 fe       	call   0x14006f510
   14132d37a:	e9 bc 06 00 00       	jmp    0x14132da3b
   14132d37f:	48 8d 15 a2 ac 2f 00 	lea    rdx,[rip+0x2faca2]        # 0x141628028
   14132d386:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d38a:	e8 81 21 d4 fe       	call   0x14006f510
   14132d38f:	e9 a7 06 00 00       	jmp    0x14132da3b
   14132d394:	48 8d 15 7d 36 37 00 	lea    rdx,[rip+0x37367d]        # 0x1416a0a18
   14132d39b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d39f:	e8 6c 21 d4 fe       	call   0x14006f510
   14132d3a4:	e9 92 06 00 00       	jmp    0x14132da3b
   14132d3a9:	48 8d 15 78 36 37 00 	lea    rdx,[rip+0x373678]        # 0x1416a0a28
   14132d3b0:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d3b4:	e8 57 21 d4 fe       	call   0x14006f510
   14132d3b9:	e9 7d 06 00 00       	jmp    0x14132da3b
   14132d3be:	48 8d 15 73 36 37 00 	lea    rdx,[rip+0x373673]        # 0x1416a0a38
   14132d3c5:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d3c9:	e8 42 21 d4 fe       	call   0x14006f510
   14132d3ce:	e9 68 06 00 00       	jmp    0x14132da3b
   14132d3d3:	48 8d 15 86 f7 44 00 	lea    rdx,[rip+0x44f786]        # 0x14177cb60
   14132d3da:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d3de:	e8 2d 21 d4 fe       	call   0x14006f510
   14132d3e3:	e9 53 06 00 00       	jmp    0x14132da3b
   14132d3e8:	48 8d 15 61 f7 44 00 	lea    rdx,[rip+0x44f761]        # 0x14177cb50
   14132d3ef:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d3f3:	e8 18 21 d4 fe       	call   0x14006f510
   14132d3f8:	e9 3e 06 00 00       	jmp    0x14132da3b
   14132d3fd:	48 8d 15 9c f6 44 00 	lea    rdx,[rip+0x44f69c]        # 0x14177caa0
   14132d404:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d408:	e8 03 21 d4 fe       	call   0x14006f510
   14132d40d:	e9 29 06 00 00       	jmp    0x14132da3b
   14132d412:	48 8d 15 6b 30 37 00 	lea    rdx,[rip+0x37306b]        # 0x1416a0484
   14132d419:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d41d:	e8 ee 20 d4 fe       	call   0x14006f510
   14132d422:	e9 14 06 00 00       	jmp    0x14132da3b
   14132d427:	48 8d 15 6a f6 44 00 	lea    rdx,[rip+0x44f66a]        # 0x14177ca98
   14132d42e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d432:	e8 d9 20 d4 fe       	call   0x14006f510
   14132d437:	e9 ff 05 00 00       	jmp    0x14132da3b
   14132d43c:	48 8d 15 65 30 37 00 	lea    rdx,[rip+0x373065]        # 0x1416a04a8
   14132d443:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d447:	e8 c4 20 d4 fe       	call   0x14006f510
   14132d44c:	e9 ea 05 00 00       	jmp    0x14132da3b
   14132d451:	48 8d 15 b8 d9 2c 00 	lea    rdx,[rip+0x2cd9b8]        # 0x1415fae10
   14132d458:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d45c:	e8 af 20 d4 fe       	call   0x14006f510
   14132d461:	e9 d5 05 00 00       	jmp    0x14132da3b
   14132d466:	48 8d 15 8f d9 2c 00 	lea    rdx,[rip+0x2cd98f]        # 0x1415fadfc
   14132d46d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d471:	e8 9a 20 d4 fe       	call   0x14006f510
   14132d476:	e9 c0 05 00 00       	jmp    0x14132da3b
   14132d47b:	48 8d 15 b6 a5 2f 00 	lea    rdx,[rip+0x2fa5b6]        # 0x141627a38
   14132d482:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d486:	e8 85 20 d4 fe       	call   0x14006f510
   14132d48b:	e9 ab 05 00 00       	jmp    0x14132da3b
   14132d490:	48 8d 15 1d f6 44 00 	lea    rdx,[rip+0x44f61d]        # 0x14177cab4
   14132d497:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d49b:	e8 70 20 d4 fe       	call   0x14006f510
   14132d4a0:	e9 96 05 00 00       	jmp    0x14132da3b
   14132d4a5:	48 8d 15 5c d9 2c 00 	lea    rdx,[rip+0x2cd95c]        # 0x1415fae08
   14132d4ac:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d4b0:	e8 5b 20 d4 fe       	call   0x14006f510
   14132d4b5:	e9 81 05 00 00       	jmp    0x14132da3b
   14132d4ba:	48 8d 15 e7 f5 44 00 	lea    rdx,[rip+0x44f5e7]        # 0x14177caa8
   14132d4c1:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d4c5:	e8 46 20 d4 fe       	call   0x14006f510
   14132d4ca:	e9 6c 05 00 00       	jmp    0x14132da3b
   14132d4cf:	48 8d 15 72 30 37 00 	lea    rdx,[rip+0x373072]        # 0x1416a0548
   14132d4d6:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d4da:	e8 31 20 d4 fe       	call   0x14006f510
   14132d4df:	e9 57 05 00 00       	jmp    0x14132da3b
   14132d4e4:	48 8d 15 e5 f5 44 00 	lea    rdx,[rip+0x44f5e5]        # 0x14177cad0
   14132d4eb:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d4ef:	e8 1c 20 d4 fe       	call   0x14006f510
   14132d4f4:	e9 42 05 00 00       	jmp    0x14132da3b
   14132d4f9:	48 8d 15 58 30 37 00 	lea    rdx,[rip+0x373058]        # 0x1416a0558
   14132d500:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d504:	e8 07 20 d4 fe       	call   0x14006f510
   14132d509:	e9 2d 05 00 00       	jmp    0x14132da3b
   14132d50e:	48 8d 15 ab f5 44 00 	lea    rdx,[rip+0x44f5ab]        # 0x14177cac0
   14132d515:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d519:	e8 f2 1f d4 fe       	call   0x14006f510
   14132d51e:	e9 18 05 00 00       	jmp    0x14132da3b
   14132d523:	48 8d 15 6e 35 37 00 	lea    rdx,[rip+0x37356e]        # 0x1416a0a98
   14132d52a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d52e:	e8 dd 1f d4 fe       	call   0x14006f510
   14132d533:	e9 03 05 00 00       	jmp    0x14132da3b
   14132d538:	48 8d 15 61 35 37 00 	lea    rdx,[rip+0x373561]        # 0x1416a0aa0
   14132d53f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d543:	e8 c8 1f d4 fe       	call   0x14006f510
   14132d548:	e9 ee 04 00 00       	jmp    0x14132da3b
   14132d54d:	48 8d 15 84 d8 2c 00 	lea    rdx,[rip+0x2cd884]        # 0x1415fadd8
   14132d554:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d558:	e8 b3 1f d4 fe       	call   0x14006f510
   14132d55d:	e9 d9 04 00 00       	jmp    0x14132da3b
   14132d562:	48 8d 15 5f d8 2c 00 	lea    rdx,[rip+0x2cd85f]        # 0x1415fadc8
   14132d569:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d56d:	e8 9e 1f d4 fe       	call   0x14006f510
   14132d572:	e9 c4 04 00 00       	jmp    0x14132da3b
   14132d577:	48 8d 15 ba a3 2f 00 	lea    rdx,[rip+0x2fa3ba]        # 0x141627938
   14132d57e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d582:	e8 89 1f d4 fe       	call   0x14006f510
   14132d587:	e9 af 04 00 00       	jmp    0x14132da3b
   14132d58c:	48 8d 15 1d 34 37 00 	lea    rdx,[rip+0x37341d]        # 0x1416a09b0
   14132d593:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d597:	e8 74 1f d4 fe       	call   0x14006f510
   14132d59c:	e9 9a 04 00 00       	jmp    0x14132da3b
   14132d5a1:	48 8d 15 18 d8 2c 00 	lea    rdx,[rip+0x2cd818]        # 0x1415fadc0
   14132d5a8:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d5ac:	e8 5f 1f d4 fe       	call   0x14006f510
   14132d5b1:	e9 85 04 00 00       	jmp    0x14132da3b
   14132d5b6:	48 8d 15 2b f5 44 00 	lea    rdx,[rip+0x44f52b]        # 0x14177cae8
   14132d5bd:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d5c1:	e8 4a 1f d4 fe       	call   0x14006f510
   14132d5c6:	e9 70 04 00 00       	jmp    0x14132da3b
   14132d5cb:	48 8d 15 0a f5 44 00 	lea    rdx,[rip+0x44f50a]        # 0x14177cadc
   14132d5d2:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d5d6:	e8 35 1f d4 fe       	call   0x14006f510
   14132d5db:	e9 5b 04 00 00       	jmp    0x14132da3b
   14132d5e0:	48 8d 15 61 a3 2f 00 	lea    rdx,[rip+0x2fa361]        # 0x141627948
   14132d5e7:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d5eb:	e8 20 1f d4 fe       	call   0x14006f510
   14132d5f0:	e9 46 04 00 00       	jmp    0x14132da3b
   14132d5f5:	48 8d 15 14 f6 44 00 	lea    rdx,[rip+0x44f614]        # 0x14177cc10
   14132d5fc:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d600:	e8 0b 1f d4 fe       	call   0x14006f510
   14132d605:	e9 31 04 00 00       	jmp    0x14132da3b
   14132d60a:	48 8d 15 ef f5 44 00 	lea    rdx,[rip+0x44f5ef]        # 0x14177cc00
   14132d611:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d615:	e8 f6 1e d4 fe       	call   0x14006f510
   14132d61a:	e9 1c 04 00 00       	jmp    0x14132da3b
   14132d61f:	48 8d 15 6a be 36 00 	lea    rdx,[rip+0x36be6a]        # 0x141699490
   14132d626:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d62a:	e8 e1 1e d4 fe       	call   0x14006f510
   14132d62f:	e9 07 04 00 00       	jmp    0x14132da3b
   14132d634:	48 8d 15 b5 d7 2c 00 	lea    rdx,[rip+0x2cd7b5]        # 0x1415fadf0
   14132d63b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d63f:	e8 cc 1e d4 fe       	call   0x14006f510
   14132d644:	e9 f2 03 00 00       	jmp    0x14132da3b
   14132d649:	48 8d 15 e0 34 37 00 	lea    rdx,[rip+0x3734e0]        # 0x1416a0b30
   14132d650:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d654:	e8 b7 1e d4 fe       	call   0x14006f510
   14132d659:	e9 dd 03 00 00       	jmp    0x14132da3b
   14132d65e:	48 8d 15 bb f6 44 00 	lea    rdx,[rip+0x44f6bb]        # 0x14177cd20
   14132d665:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d669:	e8 a2 1e d4 fe       	call   0x14006f510
   14132d66e:	e9 c8 03 00 00       	jmp    0x14132da3b
   14132d673:	48 8d 15 4e 33 37 00 	lea    rdx,[rip+0x37334e]        # 0x1416a09c8
   14132d67a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d67e:	e8 8d 1e d4 fe       	call   0x14006f510
   14132d683:	e9 b3 03 00 00       	jmp    0x14132da3b
   14132d688:	48 8d 15 e1 f6 44 00 	lea    rdx,[rip+0x44f6e1]        # 0x14177cd70
   14132d68f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d693:	e8 78 1e d4 fe       	call   0x14006f510
   14132d698:	e9 9e 03 00 00       	jmp    0x14132da3b
   14132d69d:	48 8d 15 34 33 37 00 	lea    rdx,[rip+0x373334]        # 0x1416a09d8
   14132d6a4:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d6a8:	e8 63 1e d4 fe       	call   0x14006f510
   14132d6ad:	e9 89 03 00 00       	jmp    0x14132da3b
   14132d6b2:	48 8d 15 97 f7 44 00 	lea    rdx,[rip+0x44f797]        # 0x14177ce50
   14132d6b9:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d6bd:	e8 4e 1e d4 fe       	call   0x14006f510
   14132d6c2:	e9 74 03 00 00       	jmp    0x14132da3b
   14132d6c7:	48 8d 15 12 34 37 00 	lea    rdx,[rip+0x373412]        # 0x1416a0ae0
   14132d6ce:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d6d2:	e8 39 1e d4 fe       	call   0x14006f510
   14132d6d7:	e9 5f 03 00 00       	jmp    0x14132da3b
   14132d6dc:	48 8d 15 c5 f7 44 00 	lea    rdx,[rip+0x44f7c5]        # 0x14177cea8
   14132d6e3:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d6e7:	e8 24 1e d4 fe       	call   0x14006f510
   14132d6ec:	e9 4a 03 00 00       	jmp    0x14132da3b
   14132d6f1:	48 8d 15 18 34 37 00 	lea    rdx,[rip+0x373418]        # 0x1416a0b10
   14132d6f8:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d6fc:	e8 0f 1e d4 fe       	call   0x14006f510
   14132d701:	e9 35 03 00 00       	jmp    0x14132da3b
   14132d706:	48 8d 15 ab f7 44 00 	lea    rdx,[rip+0x44f7ab]        # 0x14177ceb8
   14132d70d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d711:	e8 fa 1d d4 fe       	call   0x14006f510
   14132d716:	e9 20 03 00 00       	jmp    0x14132da3b
   14132d71b:	48 8d 15 f6 33 37 00 	lea    rdx,[rip+0x3733f6]        # 0x1416a0b18
   14132d722:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d726:	e8 e5 1d d4 fe       	call   0x14006f510
   14132d72b:	e9 0b 03 00 00       	jmp    0x14132da3b
   14132d730:	48 8d 15 e1 f6 44 00 	lea    rdx,[rip+0x44f6e1]        # 0x14177ce18
   14132d737:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d73b:	e8 d0 1d d4 fe       	call   0x14006f510
   14132d740:	e9 f6 02 00 00       	jmp    0x14132da3b
   14132d745:	48 8d 15 dc 33 37 00 	lea    rdx,[rip+0x3733dc]        # 0x1416a0b28
   14132d74c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d750:	e8 bb 1d d4 fe       	call   0x14006f510
   14132d755:	e9 e1 02 00 00       	jmp    0x14132da3b
   14132d75a:	48 8d 15 c7 f6 44 00 	lea    rdx,[rip+0x44f6c7]        # 0x14177ce28
   14132d761:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d765:	e8 a6 1d d4 fe       	call   0x14006f510
   14132d76a:	e9 cc 02 00 00       	jmp    0x14132da3b
   14132d76f:	48 8d 15 72 32 37 00 	lea    rdx,[rip+0x373272]        # 0x1416a09e8
   14132d776:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d77a:	e8 91 1d d4 fe       	call   0x14006f510
   14132d77f:	e9 b7 02 00 00       	jmp    0x14132da3b
   14132d784:	48 8d 15 bd f7 44 00 	lea    rdx,[rip+0x44f7bd]        # 0x14177cf48
   14132d78b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d78f:	e8 7c 1d d4 fe       	call   0x14006f510
   14132d794:	e9 a2 02 00 00       	jmp    0x14132da3b
   14132d799:	48 8d 15 50 32 37 00 	lea    rdx,[rip+0x373250]        # 0x1416a09f0
   14132d7a0:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d7a4:	e8 67 1d d4 fe       	call   0x14006f510
   14132d7a9:	e9 8d 02 00 00       	jmp    0x14132da3b
   14132d7ae:	48 8d 15 cb f7 44 00 	lea    rdx,[rip+0x44f7cb]        # 0x14177cf80
   14132d7b5:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d7b9:	e8 52 1d d4 fe       	call   0x14006f510
   14132d7be:	e9 78 02 00 00       	jmp    0x14132da3b
   14132d7c3:	48 8d 15 56 31 37 00 	lea    rdx,[rip+0x373156]        # 0x1416a0920
   14132d7ca:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d7ce:	e8 3d 1d d4 fe       	call   0x14006f510
   14132d7d3:	e9 63 02 00 00       	jmp    0x14132da3b
   14132d7d8:	48 8d 15 b9 f7 44 00 	lea    rdx,[rip+0x44f7b9]        # 0x14177cf98
   14132d7df:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d7e3:	e8 28 1d d4 fe       	call   0x14006f510
   14132d7e8:	e9 4e 02 00 00       	jmp    0x14132da3b
   14132d7ed:	48 8d 15 58 31 37 00 	lea    rdx,[rip+0x373158]        # 0x1416a094c
   14132d7f4:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d7f8:	e8 13 1d d4 fe       	call   0x14006f510
   14132d7fd:	e9 39 02 00 00       	jmp    0x14132da3b
   14132d802:	48 8d 15 cf f6 44 00 	lea    rdx,[rip+0x44f6cf]        # 0x14177ced8
   14132d809:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d80d:	e8 fe 1c d4 fe       	call   0x14006f510
   14132d812:	e9 24 02 00 00       	jmp    0x14132da3b
   14132d817:	48 8d 15 02 f4 44 00 	lea    rdx,[rip+0x44f402]        # 0x14177cc20
   14132d81e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d822:	e8 e9 1c d4 fe       	call   0x14006f510
   14132d827:	e9 0f 02 00 00       	jmp    0x14132da3b
   14132d82c:	48 8d 15 2d 49 2c 00 	lea    rdx,[rip+0x2c492d]        # 0x1415f2160
   14132d833:	48 8d 4d bf          	lea    rcx,[rbp-0x41]
   14132d837:	e8 d4 1c d4 fe       	call   0x14006f510
   14132d83c:	e9 fa 01 00 00       	jmp    0x14132da3b
   14132d841:	48 8d 15 84 0e 2d 00 	lea    rdx,[rip+0x2d0e84]        # 0x1415fe6cc
   14132d848:	48 8d 4d bf          	lea    rcx,[rbp-0x41]
   14132d84c:	e8 bf 1c d4 fe       	call   0x14006f510
   14132d851:	e9 e5 01 00 00       	jmp    0x14132da3b
   14132d856:	48 8d 15 9b f6 44 00 	lea    rdx,[rip+0x44f69b]        # 0x14177cef8
   14132d85d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d861:	e8 aa 1c d4 fe       	call   0x14006f510
   14132d866:	e9 d0 01 00 00       	jmp    0x14132da3b
   14132d86b:	48 8d 15 2a d9 2c 00 	lea    rdx,[rip+0x2cd92a]        # 0x1415fb19c
   14132d872:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d876:	e8 95 1c d4 fe       	call   0x14006f510
   14132d87b:	e9 bb 01 00 00       	jmp    0x14132da3b
   14132d880:	48 8d 15 c1 a0 2b 00 	lea    rdx,[rip+0x2ba0c1]        # 0x1415e7948
   14132d887:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d88b:	e8 80 1c d4 fe       	call   0x14006f510
   14132d890:	e9 a6 01 00 00       	jmp    0x14132da3b
   14132d895:	48 8d 15 7c f3 44 00 	lea    rdx,[rip+0x44f37c]        # 0x14177cc18
   14132d89c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d8a0:	e8 6b 1c d4 fe       	call   0x14006f510
   14132d8a5:	e9 91 01 00 00       	jmp    0x14132da3b
   14132d8aa:	48 8d 15 7f f3 44 00 	lea    rdx,[rip+0x44f37f]        # 0x14177cc30
   14132d8b1:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d8b5:	e8 56 1c d4 fe       	call   0x14006f510
   14132d8ba:	e9 7c 01 00 00       	jmp    0x14132da3b
   14132d8bf:	48 8d 15 62 f3 44 00 	lea    rdx,[rip+0x44f362]        # 0x14177cc28
   14132d8c6:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d8ca:	e8 41 1c d4 fe       	call   0x14006f510
   14132d8cf:	e9 67 01 00 00       	jmp    0x14132da3b
   14132d8d4:	48 8d 15 69 f3 44 00 	lea    rdx,[rip+0x44f369]        # 0x14177cc44
   14132d8db:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d8df:	e8 2c 1c d4 fe       	call   0x14006f510
   14132d8e4:	e9 52 01 00 00       	jmp    0x14132da3b
   14132d8e9:	48 8d 15 48 f3 44 00 	lea    rdx,[rip+0x44f348]        # 0x14177cc38
   14132d8f0:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d8f4:	e8 17 1c d4 fe       	call   0x14006f510
   14132d8f9:	e9 3d 01 00 00       	jmp    0x14132da3b
   14132d8fe:	0f b7 d3             	movzx  edx,bx
   14132d901:	48 8d 0d 30 90 1b 01 	lea    rcx,[rip+0x11b9030]        # 0x1424e6938
   14132d908:	66 83 ff ff          	cmp    di,0xffff
   14132d90c:	75 35                	jne    0x14132d943
   14132d90e:	41 b8 06 00 00 00    	mov    r8d,0x6
   14132d914:	e8 77 db 38 ff       	call   0x1406bb490
   14132d919:	84 c0                	test   al,al
   14132d91b:	74 6a                	je     0x14132d987
   14132d91d:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   14132d922:	45 8b c8             	mov    r9d,r8d
   14132d925:	44 0f b7 c3          	movzx  r8d,bx
   14132d929:	48 8d 55 9f          	lea    rdx,[rbp-0x61]
   14132d92d:	48 8d 0d 04 90 1b 01 	lea    rcx,[rip+0x11b9004]        # 0x1424e6938
   14132d934:	e8 e7 8d f2 fe       	call   0x140256720
   14132d939:	c6 44 24 30 01       	mov    BYTE PTR [rsp+0x30],0x1
   14132d93e:	e9 f8 00 00 00       	jmp    0x14132da3b
   14132d943:	41 b9 08 00 00 00    	mov    r9d,0x8
   14132d949:	44 0f b7 c7          	movzx  r8d,di
   14132d94d:	e8 de cc fe ff       	call   0x14131a630
   14132d952:	48 8d 0d df 8f 1b 01 	lea    rcx,[rip+0x11b8fdf]        # 0x1424e6938
   14132d959:	84 c0                	test   al,al
   14132d95b:	74 25                	je     0x14132d982
   14132d95d:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   14132d962:	44 89 4c 24 20       	mov    DWORD PTR [rsp+0x20],r9d
   14132d967:	44 0f b7 cf          	movzx  r9d,di
   14132d96b:	44 0f b7 c3          	movzx  r8d,bx
   14132d96f:	48 8d 55 9f          	lea    rdx,[rbp-0x61]
   14132d973:	e8 b8 74 e1 fe       	call   0x140144e30
   14132d978:	c6 44 24 30 01       	mov    BYTE PTR [rsp+0x30],0x1
   14132d97d:	e9 b9 00 00 00       	jmp    0x14132da3b
   14132d982:	0f b7 d3             	movzx  edx,bx
   14132d985:	eb 87                	jmp    0x14132d90e
   14132d987:	48 8d 15 76 d5 2c 00 	lea    rdx,[rip+0x2cd576]        # 0x1415faf04
   14132d98e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d992:	e8 79 1b d4 fe       	call   0x14006f510
   14132d997:	e9 9f 00 00 00       	jmp    0x14132da3b
   14132d99c:	0f b7 d3             	movzx  edx,bx
   14132d99f:	48 8d 0d 92 8f 1b 01 	lea    rcx,[rip+0x11b8f92]        # 0x1424e6938
   14132d9a6:	66 83 ff ff          	cmp    di,0xffff
   14132d9aa:	75 14                	jne    0x14132d9c0
   14132d9ac:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132d9b2:	e8 d9 da 38 ff       	call   0x1406bb490
   14132d9b7:	84 c0                	test   al,al
   14132d9b9:	74 35                	je     0x14132d9f0
   14132d9bb:	e9 5d ff ff ff       	jmp    0x14132d91d
   14132d9c0:	41 b9 06 00 00 00    	mov    r9d,0x6
   14132d9c6:	44 0f b7 c7          	movzx  r8d,di
   14132d9ca:	e8 61 cc fe ff       	call   0x14131a630
   14132d9cf:	48 8d 0d 62 8f 1b 01 	lea    rcx,[rip+0x11b8f62]        # 0x1424e6938
   14132d9d6:	84 c0                	test   al,al
   14132d9d8:	75 83                	jne    0x14132d95d
   14132d9da:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132d9e0:	0f b7 d3             	movzx  edx,bx
   14132d9e3:	e8 a8 da 38 ff       	call   0x1406bb490
   14132d9e8:	84 c0                	test   al,al
   14132d9ea:	0f 85 2d ff ff ff    	jne    0x14132d91d
   14132d9f0:	48 8d 15 75 f1 44 00 	lea    rdx,[rip+0x44f175]        # 0x14177cb6c
   14132d9f7:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132d9fb:	e8 10 1b d4 fe       	call   0x14006f510
   14132da00:	eb 39                	jmp    0x14132da3b
   14132da02:	0f bf 44 24 38       	movsx  eax,WORD PTR [rsp+0x38]
   14132da07:	41 39 85 a4 00 00 00 	cmp    DWORD PTR [r13+0xa4],eax
   14132da0e:	75 2b                	jne    0x14132da3b
   14132da10:	48 c7 45 af 07 00 00 	mov    QWORD PTR [rbp-0x51],0x7
   14132da17:	00 
   14132da18:	48 8b 05 21 ef 44 00 	mov    rax,QWORD PTR [rip+0x44ef21]        # 0x14177c940
   14132da1f:	89 45 9f             	mov    DWORD PTR [rbp-0x61],eax
   14132da22:	0f b7 05 1b ef 44 00 	movzx  eax,WORD PTR [rip+0x44ef1b]        # 0x14177c944
   14132da29:	66 89 45 a3          	mov    WORD PTR [rbp-0x5d],ax
   14132da2d:	0f b6 05 12 ef 44 00 	movzx  eax,BYTE PTR [rip+0x44ef12]        # 0x14177c946
   14132da34:	88 45 a5             	mov    BYTE PTR [rbp-0x5b],al
   14132da37:	c6 45 a6 00          	mov    BYTE PTR [rbp-0x5a],0x0
   14132da3b:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   14132da42:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   14132da49:	48 8d 0d 58 61 1c 01 	lea    rcx,[rip+0x11c6158]        # 0x1424f3ba8
   14132da50:	e8 9b 26 82 ff       	call   0x140b500f0
   14132da55:	48 85 c0             	test   rax,rax
   14132da58:	0f 84 24 01 00 00    	je     0x14132db82
   14132da5e:	48 8d 4d 97          	lea    rcx,[rbp-0x69]
   14132da62:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   14132da67:	4c 8d 4d 87          	lea    r9,[rbp-0x79]
   14132da6b:	4c 8d 44 24 34       	lea    r8,[rsp+0x34]
   14132da70:	ba ff ff ff ff       	mov    edx,0xffffffff
   14132da75:	48 8b c8             	mov    rcx,rax
   14132da78:	e8 e3 ab 8b ff       	call   0x140be8660
   14132da7d:	48 8b d8             	mov    rbx,rax
   14132da80:	48 85 c0             	test   rax,rax
   14132da83:	0f 84 f9 00 00 00    	je     0x14132db82
   14132da89:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   14132da90:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   14132da97:	48 8d 0d 0a 61 1c 01 	lea    rcx,[rip+0x11c610a]        # 0x1424f3ba8
   14132da9e:	e8 4d 26 82 ff       	call   0x140b500f0
   14132daa3:	48 85 c0             	test   rax,rax
   14132daa6:	0f 84 d6 00 00 00    	je     0x14132db82
   14132daac:	0f be 48 06          	movsx  ecx,BYTE PTR [rax+0x6]
   14132dab0:	80 7c 24 34 00       	cmp    BYTE PTR [rsp+0x34],0x0
   14132dab5:	74 4a                	je     0x14132db01
   14132dab7:	85 c9                	test   ecx,ecx
   14132dab9:	74 2a                	je     0x14132dae5
   14132dabb:	83 f9 01             	cmp    ecx,0x1
   14132dabe:	74 09                	je     0x14132dac9
   14132dac0:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   14132dac7:	eb 7e                	jmp    0x14132db47
   14132dac9:	48 83 bb e8 01 00 00 	cmp    QWORD PTR [rbx+0x1e8],0x0
   14132dad0:	00 
   14132dad1:	75 09                	jne    0x14132dadc
   14132dad3:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   14132dada:	eb 6b                	jmp    0x14132db47
   14132dadc:	48 8d 93 d8 01 00 00 	lea    rdx,[rbx+0x1d8]
   14132dae3:	eb 62                	jmp    0x14132db47
   14132dae5:	48 83 bb a8 01 00 00 	cmp    QWORD PTR [rbx+0x1a8],0x0
   14132daec:	00 
   14132daed:	75 09                	jne    0x14132daf8
   14132daef:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   14132daf6:	eb 4f                	jmp    0x14132db47
   14132daf8:	48 8d 93 98 01 00 00 	lea    rdx,[rbx+0x198]
   14132daff:	eb 46                	jmp    0x14132db47
   14132db01:	85 c9                	test   ecx,ecx
   14132db03:	74 2a                	je     0x14132db2f
   14132db05:	83 f9 01             	cmp    ecx,0x1
   14132db08:	74 09                	je     0x14132db13
   14132db0a:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   14132db11:	eb 34                	jmp    0x14132db47
   14132db13:	48 83 bb 28 01 00 00 	cmp    QWORD PTR [rbx+0x128],0x0
   14132db1a:	00 
   14132db1b:	75 09                	jne    0x14132db26
   14132db1d:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   14132db24:	eb 21                	jmp    0x14132db47
   14132db26:	48 8d 93 18 01 00 00 	lea    rdx,[rbx+0x118]
   14132db2d:	eb 18                	jmp    0x14132db47
   14132db2f:	48 83 bb e8 00 00 00 	cmp    QWORD PTR [rbx+0xe8],0x0
   14132db36:	00 
   14132db37:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   14132db3e:	74 07                	je     0x14132db47
   14132db40:	48 8d 93 d8 00 00 00 	lea    rdx,[rbx+0xd8]
   14132db47:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132db4b:	48 3b c2             	cmp    rax,rdx
   14132db4e:	74 17                	je     0x14132db67
   14132db50:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132db54:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132db59:	76 03                	jbe    0x14132db5e
   14132db5b:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132db5e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132db62:	e8 f9 1c d4 fe       	call   0x14006f860
   14132db67:	66 83 bb c8 02 00 00 	cmp    WORD PTR [rbx+0x2c8],0x0
   14132db6e:	00 
   14132db6f:	7e 11                	jle    0x14132db82
   14132db71:	4c 8d 45 ff          	lea    r8,[rbp-0x1]
   14132db75:	48 8b 55 97          	mov    rdx,QWORD PTR [rbp-0x69]
   14132db79:	48 8b 4d 87          	mov    rcx,QWORD PTR [rbp-0x79]
   14132db7d:	e8 5e dc 68 ff       	call   0x1409bb7e0
   14132db82:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   14132db89:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   14132db90:	48 8d 0d 11 60 1c 01 	lea    rcx,[rip+0x11c6011]        # 0x1424f3ba8
   14132db97:	e8 54 25 82 ff       	call   0x140b500f0
   14132db9c:	48 be ff ff ff ff ff 	movabs rsi,0x7fffffffffffffff
   14132dba3:	ff ff 7f 
   14132dba6:	48 85 c0             	test   rax,rax
   14132dba9:	0f 84 19 01 00 00    	je     0x14132dcc8
   14132dbaf:	ba 04 00 00 00       	mov    edx,0x4
   14132dbb4:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
   14132dbba:	48 8b c8             	mov    rcx,rax
   14132dbbd:	e8 3e 68 86 ff       	call   0x140b94400
   14132dbc2:	0f b7 5c 24 32       	movzx  ebx,WORD PTR [rsp+0x32]
   14132dbc7:	66 85 c0             	test   ax,ax
   14132dbca:	0f 8e fd 00 00 00    	jle    0x14132dccd
   14132dbd0:	8d 43 99             	lea    eax,[rbx-0x67]
   14132dbd3:	66 83 f8 01          	cmp    ax,0x1
   14132dbd7:	77 22                	ja     0x14132dbfb
   14132dbd9:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   14132dbde:	74 1b                	je     0x14132dbfb
   14132dbe0:	41 b8 06 00 00 00    	mov    r8d,0x6
   14132dbe6:	48 8d 15 5f ee 44 00 	lea    rdx,[rip+0x44ee5f]        # 0x14177ca4c
   14132dbed:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132dbf1:	e8 aa 1d d4 fe       	call   0x14006f9a0
   14132dbf6:	e9 d2 00 00 00       	jmp    0x14132dccd
   14132dbfb:	48 8b 7d b7          	mov    rdi,QWORD PTR [rbp-0x49]
   14132dbff:	48 83 ff 05          	cmp    rdi,0x5
   14132dc03:	72 33                	jb     0x14132dc38
   14132dc05:	48 8d 5d 9f          	lea    rbx,[rbp-0x61]
   14132dc09:	48 83 ff 0f          	cmp    rdi,0xf
   14132dc0d:	48 0f 47 5d 9f       	cmova  rbx,QWORD PTR [rbp-0x61]
   14132dc12:	48 c7 45 af 05 00 00 	mov    QWORD PTR [rbp-0x51],0x5
   14132dc19:	00 
   14132dc1a:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132dc20:	48 8d 15 a1 e0 2c 00 	lea    rdx,[rip+0x2ce0a1]        # 0x1415fbcc8
   14132dc27:	48 8b cb             	mov    rcx,rbx
   14132dc2a:	e8 5b 81 20 00       	call   0x141535d8a
   14132dc2f:	c6 43 05 00          	mov    BYTE PTR [rbx+0x5],0x0
   14132dc33:	e9 90 00 00 00       	jmp    0x14132dcc8
   14132dc38:	48 8b cf             	mov    rcx,rdi
   14132dc3b:	48 d1 e9             	shr    rcx,1
   14132dc3e:	48 8b c6             	mov    rax,rsi
   14132dc41:	48 2b c1             	sub    rax,rcx
   14132dc44:	48 3b f8             	cmp    rdi,rax
   14132dc47:	76 05                	jbe    0x14132dc4e
   14132dc49:	48 8b de             	mov    rbx,rsi
   14132dc4c:	eb 10                	jmp    0x14132dc5e
   14132dc4e:	48 8d 04 39          	lea    rax,[rcx+rdi*1]
   14132dc52:	bb 0f 00 00 00       	mov    ebx,0xf
   14132dc57:	48 3b c3             	cmp    rax,rbx
   14132dc5a:	48 0f 47 d8          	cmova  rbx,rax
   14132dc5e:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   14132dc62:	e8 f9 2a d4 fe       	call   0x140070760
   14132dc67:	4c 8b f8             	mov    r15,rax
   14132dc6a:	48 c7 45 af 05 00 00 	mov    QWORD PTR [rbp-0x51],0x5
   14132dc71:	00 
   14132dc72:	48 89 5d b7          	mov    QWORD PTR [rbp-0x49],rbx
   14132dc76:	8b 0d 4c e0 2c 00    	mov    ecx,DWORD PTR [rip+0x2ce04c]        # 0x1415fbcc8
   14132dc7c:	89 08                	mov    DWORD PTR [rax],ecx
   14132dc7e:	0f b6 0d 47 e0 2c 00 	movzx  ecx,BYTE PTR [rip+0x2ce047]        # 0x1415fbccc
   14132dc85:	88 48 04             	mov    BYTE PTR [rax+0x4],cl
   14132dc88:	c6 40 05 00          	mov    BYTE PTR [rax+0x5],0x0
   14132dc8c:	48 83 ff 0f          	cmp    rdi,0xf
   14132dc90:	76 32                	jbe    0x14132dcc4
   14132dc92:	48 8d 57 01          	lea    rdx,[rdi+0x1]
   14132dc96:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   14132dc9a:	48 8b c1             	mov    rax,rcx
   14132dc9d:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132dca4:	72 19                	jb     0x14132dcbf
   14132dca6:	48 83 c2 27          	add    rdx,0x27
   14132dcaa:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132dcae:	48 2b c1             	sub    rax,rcx
   14132dcb1:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132dcb5:	48 83 f8 1f          	cmp    rax,0x1f
   14132dcb9:	0f 87 5d 01 00 00    	ja     0x14132de1c
   14132dcbf:	e8 2c 69 20 00       	call   0x1415345f0
   14132dcc4:	4c 89 7d 9f          	mov    QWORD PTR [rbp-0x61],r15
   14132dcc8:	0f b7 5c 24 32       	movzx  ebx,WORD PTR [rsp+0x32]
   14132dccd:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   14132dcd4:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   14132dcdb:	48 8d 0d c6 5e 1c 01 	lea    rcx,[rip+0x11c5ec6]        # 0x1424f3ba8
   14132dce2:	e8 09 24 82 ff       	call   0x140b500f0
   14132dce7:	48 85 c0             	test   rax,rax
   14132dcea:	74 18                	je     0x14132dd04
   14132dcec:	ba 06 00 00 00       	mov    edx,0x6
   14132dcf1:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
   14132dcf7:	48 8b c8             	mov    rcx,rax
   14132dcfa:	e8 01 67 86 ff       	call   0x140b94400
   14132dcff:	66 85 c0             	test   ax,ax
   14132dd02:	7f 3f                	jg     0x14132dd43
   14132dd04:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   14132dd0b:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   14132dd12:	48 8d 0d 8f 5e 1c 01 	lea    rcx,[rip+0x11c5e8f]        # 0x1424f3ba8
   14132dd19:	e8 d2 23 82 ff       	call   0x140b500f0
   14132dd1e:	48 85 c0             	test   rax,rax
   14132dd21:	0f 84 05 01 00 00    	je     0x14132de2c
   14132dd27:	ba 07 00 00 00       	mov    edx,0x7
   14132dd2c:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
   14132dd32:	48 8b c8             	mov    rcx,rax
   14132dd35:	e8 96 80 86 ff       	call   0x140b95dd0
   14132dd3a:	66 85 c0             	test   ax,ax
   14132dd3d:	0f 8e e9 00 00 00    	jle    0x14132de2c
   14132dd43:	8d 43 99             	lea    eax,[rbx-0x67]
   14132dd46:	66 83 f8 01          	cmp    ax,0x1
   14132dd4a:	77 22                	ja     0x14132dd6e
   14132dd4c:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   14132dd51:	74 1b                	je     0x14132dd6e
   14132dd53:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132dd59:	48 8d 15 e0 ec 44 00 	lea    rdx,[rip+0x44ece0]        # 0x14177ca40
   14132dd60:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132dd64:	e8 37 1c d4 fe       	call   0x14006f9a0
   14132dd69:	e9 be 00 00 00       	jmp    0x14132de2c
   14132dd6e:	48 8b 5d b7          	mov    rbx,QWORD PTR [rbp-0x49]
   14132dd72:	48 83 fb 08          	cmp    rbx,0x8
   14132dd76:	72 2b                	jb     0x14132dda3
   14132dd78:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   14132dd7c:	48 83 fb 0f          	cmp    rbx,0xf
   14132dd80:	48 0f 47 45 9f       	cmova  rax,QWORD PTR [rbp-0x61]
   14132dd85:	48 c7 45 af 08 00 00 	mov    QWORD PTR [rbp-0x51],0x8
   14132dd8c:	00 
   14132dd8d:	48 b9 50 72 69 73 6f 	movabs rcx,0x72656e6f73697250
   14132dd94:	6e 65 72 
   14132dd97:	48 89 08             	mov    QWORD PTR [rax],rcx
   14132dd9a:	c6 40 08 00          	mov    BYTE PTR [rax+0x8],0x0
   14132dd9e:	e9 89 00 00 00       	jmp    0x14132de2c
   14132dda3:	48 8b cb             	mov    rcx,rbx
   14132dda6:	48 d1 e9             	shr    rcx,1
   14132dda9:	48 8b c6             	mov    rax,rsi
   14132ddac:	48 2b c1             	sub    rax,rcx
   14132ddaf:	48 3b d8             	cmp    rbx,rax
   14132ddb2:	77 10                	ja     0x14132ddc4
   14132ddb4:	48 8d 04 0b          	lea    rax,[rbx+rcx*1]
   14132ddb8:	be 0f 00 00 00       	mov    esi,0xf
   14132ddbd:	48 3b c6             	cmp    rax,rsi
   14132ddc0:	48 0f 47 f0          	cmova  rsi,rax
   14132ddc4:	48 8d 4e 01          	lea    rcx,[rsi+0x1]
   14132ddc8:	e8 93 29 d4 fe       	call   0x140070760
   14132ddcd:	48 8b f8             	mov    rdi,rax
   14132ddd0:	48 c7 45 af 08 00 00 	mov    QWORD PTR [rbp-0x51],0x8
   14132ddd7:	00 
   14132ddd8:	48 89 75 b7          	mov    QWORD PTR [rbp-0x49],rsi
   14132dddc:	48 b9 50 72 69 73 6f 	movabs rcx,0x72656e6f73697250
   14132dde3:	6e 65 72 
   14132dde6:	48 89 08             	mov    QWORD PTR [rax],rcx
   14132dde9:	c6 40 08 00          	mov    BYTE PTR [rax+0x8],0x0
   14132dded:	48 83 fb 0f          	cmp    rbx,0xf
   14132ddf1:	76 35                	jbe    0x14132de28
   14132ddf3:	48 8d 53 01          	lea    rdx,[rbx+0x1]
   14132ddf7:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   14132ddfb:	48 8b c1             	mov    rax,rcx
   14132ddfe:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132de05:	72 1c                	jb     0x14132de23
   14132de07:	48 83 c2 27          	add    rdx,0x27
   14132de0b:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132de0f:	48 2b c1             	sub    rax,rcx
   14132de12:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132de16:	48 83 f8 1f          	cmp    rax,0x1f
   14132de1a:	76 07                	jbe    0x14132de23
   14132de1c:	ff 15 7e 2c 2b 00    	call   QWORD PTR [rip+0x2b2c7e]        # 0x1415e0aa0
   14132de22:	cc                   	int3
   14132de23:	e8 c8 67 20 00       	call   0x1415345f0
   14132de28:	48 89 7d 9f          	mov    QWORD PTR [rbp-0x61],rdi
   14132de2c:	0f b6 7c 24 30       	movzx  edi,BYTE PTR [rsp+0x30]
   14132de31:	bb 01 00 00 00       	mov    ebx,0x1
   14132de36:	66 83 7c 24 32 68    	cmp    WORD PTR [rsp+0x32],0x68
   14132de3c:	75 20                	jne    0x14132de5e
   14132de3e:	49 83 bd 90 00 00 00 	cmp    QWORD PTR [r13+0x90],0x0
   14132de45:	00 
   14132de46:	75 16                	jne    0x14132de5e
   14132de48:	4d 89 66 10          	mov    QWORD PTR [r14+0x10],r12
   14132de4c:	49 8b c6             	mov    rax,r14
   14132de4f:	49 83 7e 18 0f       	cmp    QWORD PTR [r14+0x18],0xf
   14132de54:	76 03                	jbe    0x14132de59
   14132de56:	49 8b 06             	mov    rax,QWORD PTR [r14]
   14132de59:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14132de5c:	eb 15                	jmp    0x14132de73
   14132de5e:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132de64:	48 8d 15 c9 5f 2b 00 	lea    rdx,[rip+0x2b5fc9]        # 0x1415e3e34
   14132de6b:	49 8b ce             	mov    rcx,r14
   14132de6e:	e8 ed 19 d4 fe       	call   0x14006f860
   14132de73:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   14132de77:	4d 85 c0             	test   r8,r8
   14132de7a:	74 28                	je     0x14132dea4
   14132de7c:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132de80:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   14132de85:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   14132de8a:	49 8b ce             	mov    rcx,r14
   14132de8d:	e8 0e 1b d4 fe       	call   0x14006f9a0
   14132de92:	4c 8b c3             	mov    r8,rbx
   14132de95:	48 8d 15 84 58 2b 00 	lea    rdx,[rip+0x2b5884]        # 0x1415e3720
   14132de9c:	49 8b ce             	mov    rcx,r14
   14132de9f:	e8 fc 1a d4 fe       	call   0x14006f9a0
   14132dea4:	41 f7 85 18 01 00 00 	test   DWORD PTR [r13+0x118],0x1000
   14132deab:	00 10 00 00 
   14132deaf:	74 6a                	je     0x14132df1b
   14132deb1:	41 80 bd 38 08 00 00 	cmp    BYTE PTR [r13+0x838],0x0
   14132deb8:	00 
   14132deb9:	75 6a                	jne    0x14132df25
   14132debb:	49 8b 4e 10          	mov    rcx,QWORD PTR [r14+0x10]
   14132debf:	48 85 c9             	test   rcx,rcx
   14132dec2:	74 1e                	je     0x14132dee2
   14132dec4:	49 8b c6             	mov    rax,r14
   14132dec7:	49 83 7e 18 0f       	cmp    QWORD PTR [r14+0x18],0xf
   14132decc:	76 03                	jbe    0x14132ded1
   14132dece:	49 8b 06             	mov    rax,QWORD PTR [r14]
   14132ded1:	80 7c 08 ff 20       	cmp    BYTE PTR [rax+rcx*1-0x1],0x20
   14132ded6:	74 0a                	je     0x14132dee2
   14132ded8:	b2 20                	mov    dl,0x20
   14132deda:	49 8b ce             	mov    rcx,r14
   14132dedd:	e8 2e bc d8 fe       	call   0x1400b9b10
   14132dee2:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   14132dee7:	75 1d                	jne    0x14132df06
   14132dee9:	0f bf 44 24 38       	movsx  eax,WORD PTR [rsp+0x38]
   14132deee:	41 39 85 a4 00 00 00 	cmp    DWORD PTR [r13+0xa4],eax
   14132def5:	75 0f                	jne    0x14132df06
   14132def7:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132defd:	48 8d 15 28 be 38 00 	lea    rdx,[rip+0x38be28]        # 0x1416b9d2c
   14132df04:	eb 0d                	jmp    0x14132df13
   14132df06:	41 b8 08 00 00 00    	mov    r8d,0x8
   14132df0c:	48 8d 15 7d 72 2f 00 	lea    rdx,[rip+0x2f727d]        # 0x141625190
   14132df13:	49 8b ce             	mov    rcx,r14
   14132df16:	e8 85 1a d4 fe       	call   0x14006f9a0
   14132df1b:	41 80 bd 38 08 00 00 	cmp    BYTE PTR [r13+0x838],0x0
   14132df22:	00 
   14132df23:	74 66                	je     0x14132df8b
   14132df25:	49 83 bd 50 08 00 00 	cmp    QWORD PTR [r13+0x850],0x0
   14132df2c:	00 
   14132df2d:	75 5c                	jne    0x14132df8b
   14132df2f:	49 83 bd 90 08 00 00 	cmp    QWORD PTR [r13+0x890],0x0
   14132df36:	00 
   14132df37:	74 52                	je     0x14132df8b
   14132df39:	49 8d 95 80 08 00 00 	lea    rdx,[r13+0x880]
   14132df40:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132df44:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132df49:	76 03                	jbe    0x14132df4e
   14132df4b:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132df4e:	49 8b ce             	mov    rcx,r14
   14132df51:	e8 4a 1a d4 fe       	call   0x14006f9a0
   14132df56:	4c 8b c3             	mov    r8,rbx
   14132df59:	48 8d 15 c0 57 2b 00 	lea    rdx,[rip+0x2b57c0]        # 0x1415e3720
   14132df60:	49 8b ce             	mov    rcx,r14
   14132df63:	e8 38 1a d4 fe       	call   0x14006f9a0
   14132df68:	0f bf 44 24 38       	movsx  eax,WORD PTR [rsp+0x38]
   14132df6d:	41 39 85 a4 00 00 00 	cmp    DWORD PTR [r13+0xa4],eax
   14132df74:	75 15                	jne    0x14132df8b
   14132df76:	41 b8 03 00 00 00    	mov    r8d,0x3
   14132df7c:	48 8d 15 e5 eb 44 00 	lea    rdx,[rip+0x44ebe5]        # 0x14177cb68
   14132df83:	49 8b ce             	mov    rcx,r14
   14132df86:	e8 15 1a d4 fe       	call   0x14006f9a0
   14132df8b:	49 63 9d a4 00 00 00 	movsxd rbx,DWORD PTR [r13+0xa4]
   14132df92:	0f bf 44 24 38       	movsx  eax,WORD PTR [rsp+0x38]
   14132df97:	3b d8                	cmp    ebx,eax
   14132df99:	0f 84 35 01 00 00    	je     0x14132e0d4
   14132df9f:	40 84 ff             	test   dil,dil
   14132dfa2:	0f 85 2c 01 00 00    	jne    0x14132e0d4
   14132dfa8:	0f 57 c0             	xorps  xmm0,xmm0
   14132dfab:	0f 11 45 df          	movups XMMWORD PTR [rbp-0x21],xmm0
   14132dfaf:	48 c7 45 f7 0f 00 00 	mov    QWORD PTR [rbp-0x9],0xf
   14132dfb6:	00 
   14132dfb7:	49 0f bf 95 2c 01 00 	movsx  rdx,WORD PTR [r13+0x12c]
   14132dfbe:	00 
   14132dfbf:	4c 89 65 ef          	mov    QWORD PTR [rbp-0x11],r12
   14132dfc3:	40 88 7d df          	mov    BYTE PTR [rbp-0x21],dil
   14132dfc7:	66 83 fa ff          	cmp    dx,0xffff
   14132dfcb:	74 7e                	je     0x14132e04b
   14132dfcd:	66 85 db             	test   bx,bx
   14132dfd0:	0f 88 c0 00 00 00    	js     0x14132e096
   14132dfd6:	4c 8b 05 7b 89 1b 01 	mov    r8,QWORD PTR [rip+0x11b897b]        # 0x1424e6958
   14132dfdd:	4c 0f bf cb          	movsx  r9,bx
   14132dfe1:	48 8b 0d 78 89 1b 01 	mov    rcx,QWORD PTR [rip+0x11b8978]        # 0x1424e6960
   14132dfe8:	48 8b c1             	mov    rax,rcx
   14132dfeb:	49 2b c0             	sub    rax,r8
   14132dfee:	48 c1 f8 03          	sar    rax,0x3
   14132dff2:	4c 3b c8             	cmp    r9,rax
   14132dff5:	73 67                	jae    0x14132e05e
   14132dff7:	66 85 d2             	test   dx,dx
   14132dffa:	78 62                	js     0x14132e05e
   14132dffc:	4b 8b 04 c8          	mov    rax,QWORD PTR [r8+r9*8]
   14132e000:	4c 8b 88 78 01 00 00 	mov    r9,QWORD PTR [rax+0x178]
   14132e007:	48 8b 80 80 01 00 00 	mov    rax,QWORD PTR [rax+0x180]
   14132e00e:	49 2b c1             	sub    rax,r9
   14132e011:	48 c1 f8 03          	sar    rax,0x3
   14132e015:	48 3b d0             	cmp    rdx,rax
   14132e018:	73 44                	jae    0x14132e05e
   14132e01a:	49 8b 14 d1          	mov    rdx,QWORD PTR [r9+rdx*8]
   14132e01e:	48 83 c2 20          	add    rdx,0x20
   14132e022:	48 8d 45 df          	lea    rax,[rbp-0x21]
   14132e026:	48 3b c2             	cmp    rax,rdx
   14132e029:	74 33                	je     0x14132e05e
   14132e02b:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132e02f:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132e034:	76 03                	jbe    0x14132e039
   14132e036:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132e039:	48 8d 4d df          	lea    rcx,[rbp-0x21]
   14132e03d:	e8 1e 18 d4 fe       	call   0x14006f860
   14132e042:	48 83 7d ef 00       	cmp    QWORD PTR [rbp-0x11],0x0
   14132e047:	76 07                	jbe    0x14132e050
   14132e049:	eb 4b                	jmp    0x14132e096
   14132e04b:	66 85 db             	test   bx,bx
   14132e04e:	78 46                	js     0x14132e096
   14132e050:	48 8b 0d 09 89 1b 01 	mov    rcx,QWORD PTR [rip+0x11b8909]        # 0x1424e6960
   14132e057:	4c 8b 05 fa 88 1b 01 	mov    r8,QWORD PTR [rip+0x11b88fa]        # 0x1424e6958
   14132e05e:	48 0f bf d3          	movsx  rdx,bx
   14132e062:	49 2b c8             	sub    rcx,r8
   14132e065:	48 c1 f9 03          	sar    rcx,0x3
   14132e069:	48 3b d1             	cmp    rdx,rcx
   14132e06c:	73 28                	jae    0x14132e096
   14132e06e:	49 8b 14 d0          	mov    rdx,QWORD PTR [r8+rdx*8]
   14132e072:	48 83 c2 20          	add    rdx,0x20
   14132e076:	48 8d 45 df          	lea    rax,[rbp-0x21]
   14132e07a:	48 3b c2             	cmp    rax,rdx
   14132e07d:	74 17                	je     0x14132e096
   14132e07f:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132e083:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132e088:	76 03                	jbe    0x14132e08d
   14132e08a:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132e08d:	48 8d 4d df          	lea    rcx,[rbp-0x21]
   14132e091:	e8 ca 17 d4 fe       	call   0x14006f860
   14132e096:	48 8d 4d df          	lea    rcx,[rbp-0x21]
   14132e09a:	e8 41 cd 1f ff       	call   0x14052ade0
   14132e09f:	48 8d 55 df          	lea    rdx,[rbp-0x21]
   14132e0a3:	48 83 7d f7 0f       	cmp    QWORD PTR [rbp-0x9],0xf
   14132e0a8:	48 0f 47 55 df       	cmova  rdx,QWORD PTR [rbp-0x21]
   14132e0ad:	4c 8b 45 ef          	mov    r8,QWORD PTR [rbp-0x11]
   14132e0b1:	49 8b ce             	mov    rcx,r14
   14132e0b4:	e8 e7 18 d4 fe       	call   0x14006f9a0
   14132e0b9:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   14132e0be:	74 0b                	je     0x14132e0cb
   14132e0c0:	b2 20                	mov    dl,0x20
   14132e0c2:	49 8b ce             	mov    rcx,r14
   14132e0c5:	e8 46 ba d8 fe       	call   0x1400b9b10
   14132e0ca:	90                   	nop
   14132e0cb:	48 8d 4d df          	lea    rcx,[rbp-0x21]
   14132e0cf:	e8 0c 17 d4 fe       	call   0x14006f7e0
   14132e0d4:	41 80 bd 38 08 00 00 	cmp    BYTE PTR [r13+0x838],0x0
   14132e0db:	00 
   14132e0dc:	74 49                	je     0x14132e127
   14132e0de:	49 83 bd 50 08 00 00 	cmp    QWORD PTR [r13+0x850],0x0
   14132e0e5:	00 
   14132e0e6:	74 3f                	je     0x14132e127
   14132e0e8:	49 83 7e 10 00       	cmp    QWORD PTR [r14+0x10],0x0
   14132e0ed:	74 0a                	je     0x14132e0f9
   14132e0ef:	b2 20                	mov    dl,0x20
   14132e0f1:	49 8b ce             	mov    rcx,r14
   14132e0f4:	e8 17 ba d8 fe       	call   0x1400b9b10
   14132e0f9:	49 8d 95 40 08 00 00 	lea    rdx,[r13+0x840]
   14132e100:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132e104:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132e109:	76 03                	jbe    0x14132e10e
   14132e10b:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132e10e:	49 8b ce             	mov    rcx,r14
   14132e111:	e8 8a 18 d4 fe       	call   0x14006f9a0
   14132e116:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   14132e11b:	74 0a                	je     0x14132e127
   14132e11d:	b2 20                	mov    dl,0x20
   14132e11f:	49 8b ce             	mov    rcx,r14
   14132e122:	e8 e9 b9 d8 fe       	call   0x1400b9b10
   14132e127:	48 8d 55 9f          	lea    rdx,[rbp-0x61]
   14132e12b:	48 83 7d b7 0f       	cmp    QWORD PTR [rbp-0x49],0xf
   14132e130:	48 0f 47 55 9f       	cmova  rdx,QWORD PTR [rbp-0x61]
   14132e135:	4c 8b 45 af          	mov    r8,QWORD PTR [rbp-0x51]
   14132e139:	49 8b ce             	mov    rcx,r14
   14132e13c:	e8 5f 18 d4 fe       	call   0x14006f9a0
   14132e141:	90                   	nop
   14132e142:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   14132e146:	48 83 fa 0f          	cmp    rdx,0xf
   14132e14a:	76 34                	jbe    0x14132e180
   14132e14c:	48 ff c2             	inc    rdx
   14132e14f:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   14132e153:	48 8b c1             	mov    rax,rcx
   14132e156:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132e15d:	72 1c                	jb     0x14132e17b
   14132e15f:	48 83 c2 27          	add    rdx,0x27
   14132e163:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132e167:	48 2b c1             	sub    rax,rcx
   14132e16a:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132e16e:	48 83 f8 1f          	cmp    rax,0x1f
   14132e172:	76 07                	jbe    0x14132e17b
   14132e174:	ff 15 26 29 2b 00    	call   QWORD PTR [rip+0x2b2926]        # 0x1415e0aa0
   14132e17a:	cc                   	int3
   14132e17b:	e8 70 64 20 00       	call   0x1415345f0
   14132e180:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14132e184:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   14132e18b:	00 
   14132e18c:	c6 45 bf 00          	mov    BYTE PTR [rbp-0x41],0x0
   14132e190:	48 8b 55 b7          	mov    rdx,QWORD PTR [rbp-0x49]
   14132e194:	48 83 fa 0f          	cmp    rdx,0xf
   14132e198:	76 34                	jbe    0x14132e1ce
   14132e19a:	48 ff c2             	inc    rdx
   14132e19d:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   14132e1a1:	48 8b c1             	mov    rax,rcx
   14132e1a4:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132e1ab:	72 1c                	jb     0x14132e1c9
   14132e1ad:	48 83 c2 27          	add    rdx,0x27
   14132e1b1:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132e1b5:	48 2b c1             	sub    rax,rcx
   14132e1b8:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132e1bc:	48 83 f8 1f          	cmp    rax,0x1f
   14132e1c0:	76 07                	jbe    0x14132e1c9
   14132e1c2:	ff 15 d8 28 2b 00    	call   QWORD PTR [rip+0x2b28d8]        # 0x1415e0aa0
   14132e1c8:	cc                   	int3
   14132e1c9:	e8 22 64 20 00       	call   0x1415345f0
   14132e1ce:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   14132e1d3:	80 7e 72 00          	cmp    BYTE PTR [rsi+0x72],0x0
   14132e1d7:	0f 84 10 02 00 00    	je     0x14132e3ed
   14132e1dd:	83 3d b0 80 56 00 01 	cmp    DWORD PTR [rip+0x5680b0],0x1        # 0x141896294
   14132e1e4:	0f 85 b2 01 00 00    	jne    0x14132e39c
   14132e1ea:	48 8b 05 cf 0d 0b 01 	mov    rax,QWORD PTR [rip+0x10b0dcf]        # 0x1423defc0
   14132e1f1:	48 2b 05 c0 0d 0b 01 	sub    rax,QWORD PTR [rip+0x10b0dc0]        # 0x1423defb8
   14132e1f8:	48 c1 f8 03          	sar    rax,0x3
   14132e1fc:	48 85 c0             	test   rax,rax
   14132e1ff:	0f 84 e8 01 00 00    	je     0x14132e3ed
   14132e205:	48 8b 15 f4 0d 0b 01 	mov    rdx,QWORD PTR [rip+0x10b0df4]        # 0x1423df000
   14132e20c:	48 85 d2             	test   rdx,rdx
   14132e20f:	0f 84 d8 01 00 00    	je     0x14132e3ed
   14132e215:	32 db                	xor    bl,bl
   14132e217:	4c 8d 82 74 12 00 00 	lea    r8,[rdx+0x1274]
   14132e21e:	8b 92 30 0c 00 00    	mov    edx,DWORD PTR [rdx+0xc30]
   14132e224:	48 8d 0d 7d 59 1c 01 	lea    rcx,[rip+0x11c597d]        # 0x1424f3ba8
   14132e22b:	e8 c0 1e 82 ff       	call   0x140b500f0
   14132e230:	48 8b f8             	mov    rdi,rax
   14132e233:	48 85 c0             	test   rax,rax
   14132e236:	0f 84 b1 01 00 00    	je     0x14132e3ed
   14132e23c:	41 8b 8d 30 0c 00 00 	mov    ecx,DWORD PTR [r13+0xc30]
   14132e243:	83 f9 ff             	cmp    ecx,0xffffffff
   14132e246:	74 6c                	je     0x14132e2b4
   14132e248:	48 8b 90 30 01 00 00 	mov    rdx,QWORD PTR [rax+0x130]
   14132e24f:	48 85 d2             	test   rdx,rdx
   14132e252:	74 60                	je     0x14132e2b4
   14132e254:	48 83 7a 60 00       	cmp    QWORD PTR [rdx+0x60],0x0
   14132e259:	74 59                	je     0x14132e2b4
   14132e25b:	48 8b 52 60          	mov    rdx,QWORD PTR [rdx+0x60]
   14132e25f:	e8 ec ba d8 fe       	call   0x1400b9d50
   14132e264:	48 85 c0             	test   rax,rax
   14132e267:	74 4b                	je     0x14132e2b4
   14132e269:	f6 40 04 01          	test   BYTE PTR [rax+0x4],0x1
   14132e26d:	0f 85 8f 00 00 00    	jne    0x14132e302
   14132e273:	4c 8b 44 24 40       	mov    r8,QWORD PTR [rsp+0x40]
   14132e278:	4d 85 c0             	test   r8,r8
   14132e27b:	74 37                	je     0x14132e2b4
   14132e27d:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14132e281:	45 8b 00             	mov    r8d,DWORD PTR [r8]
   14132e284:	48 8d 4d 87          	lea    rcx,[rbp-0x79]
   14132e288:	e8 e3 c8 d8 fe       	call   0x1400bab70
   14132e28d:	c7 44 24 48 ff ff ff 	mov    DWORD PTR [rsp+0x48],0xffffffff
   14132e294:	ff 
   14132e295:	44 89 65 83          	mov    DWORD PTR [rbp-0x7d],r12d
   14132e299:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   14132e29e:	38 5d 8f             	cmp    BYTE PTR [rbp-0x71],bl
   14132e2a1:	48 0f 45 45 87       	cmovne rax,QWORD PTR [rbp-0x79]
   14132e2a6:	0f b6 db             	movzx  ebx,bl
   14132e2a9:	83 f8 ff             	cmp    eax,0xffffffff
   14132e2ac:	b9 01 00 00 00       	mov    ecx,0x1
   14132e2b1:	0f 45 d9             	cmovne ebx,ecx
   14132e2b4:	45 8b 85 4c 01 00 00 	mov    r8d,DWORD PTR [r13+0x14c]
   14132e2bb:	41 83 f8 ff          	cmp    r8d,0xffffffff
   14132e2bf:	74 47                	je     0x14132e308
   14132e2c1:	48 8b 87 30 01 00 00 	mov    rax,QWORD PTR [rdi+0x130]
   14132e2c8:	48 85 c0             	test   rax,rax
   14132e2cb:	74 3b                	je     0x14132e308
   14132e2cd:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   14132e2d1:	48 85 d2             	test   rdx,rdx
   14132e2d4:	74 32                	je     0x14132e308
   14132e2d6:	48 83 c2 48          	add    rdx,0x48
   14132e2da:	48 8d 4d 87          	lea    rcx,[rbp-0x79]
   14132e2de:	e8 8d c8 d8 fe       	call   0x1400bab70
   14132e2e3:	c7 44 24 48 ff ff ff 	mov    DWORD PTR [rsp+0x48],0xffffffff
   14132e2ea:	ff 
   14132e2eb:	44 89 65 83          	mov    DWORD PTR [rbp-0x7d],r12d
   14132e2ef:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   14132e2f4:	80 7d 8f 00          	cmp    BYTE PTR [rbp-0x71],0x0
   14132e2f8:	48 0f 45 45 87       	cmovne rax,QWORD PTR [rbp-0x79]
   14132e2fd:	83 f8 ff             	cmp    eax,0xffffffff
   14132e300:	74 06                	je     0x14132e308
   14132e302:	49 8d 75 08          	lea    rsi,[r13+0x8]
   14132e306:	eb 08                	jmp    0x14132e310
   14132e308:	84 db                	test   bl,bl
   14132e30a:	0f 84 dd 00 00 00    	je     0x14132e3ed
   14132e310:	b2 20                	mov    dl,0x20
   14132e312:	49 8b ce             	mov    rcx,r14
   14132e315:	e8 f6 b7 d8 fe       	call   0x1400b9b10
   14132e31a:	0f 57 c0             	xorps  xmm0,xmm0
   14132e31d:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14132e321:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14132e325:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   14132e32c:	00 
   14132e32d:	c6 45 bf 00          	mov    BYTE PTR [rbp-0x41],0x0
   14132e331:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132e335:	48 8b ce             	mov    rcx,rsi
   14132e338:	e8 73 2d 76 ff       	call   0x140a910b0
   14132e33d:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132e341:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   14132e346:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   14132e34b:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   14132e34f:	49 8b ce             	mov    rcx,r14
   14132e352:	e8 49 16 d4 fe       	call   0x14006f9a0
   14132e357:	90                   	nop
   14132e358:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   14132e35c:	48 83 fa 0f          	cmp    rdx,0xf
   14132e360:	0f 86 87 00 00 00    	jbe    0x14132e3ed
   14132e366:	48 ff c2             	inc    rdx
   14132e369:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   14132e36d:	48 8b c1             	mov    rax,rcx
   14132e370:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132e377:	72 1c                	jb     0x14132e395
   14132e379:	48 83 c2 27          	add    rdx,0x27
   14132e37d:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132e381:	48 2b c1             	sub    rax,rcx
   14132e384:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132e388:	48 83 f8 1f          	cmp    rax,0x1f
   14132e38c:	76 07                	jbe    0x14132e395
   14132e38e:	ff 15 0c 27 2b 00    	call   QWORD PTR [rip+0x2b270c]        # 0x1415e0aa0
   14132e394:	cc                   	int3
   14132e395:	e8 56 62 20 00       	call   0x1415345f0
   14132e39a:	eb 51                	jmp    0x14132e3ed
   14132e39c:	b2 20                	mov    dl,0x20
   14132e39e:	49 8b ce             	mov    rcx,r14
   14132e3a1:	e8 6a b7 d8 fe       	call   0x1400b9b10
   14132e3a6:	0f 57 c0             	xorps  xmm0,xmm0
   14132e3a9:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14132e3ad:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14132e3b1:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   14132e3b8:	00 
   14132e3b9:	c6 45 bf 00          	mov    BYTE PTR [rbp-0x41],0x0
   14132e3bd:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132e3c1:	48 8b ce             	mov    rcx,rsi
   14132e3c4:	e8 e7 2c 76 ff       	call   0x140a910b0
   14132e3c9:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14132e3cd:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   14132e3d2:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   14132e3d7:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   14132e3db:	49 8b ce             	mov    rcx,r14
   14132e3de:	e8 bd 15 d4 fe       	call   0x14006f9a0
   14132e3e3:	90                   	nop
   14132e3e4:	48 8d 4d bf          	lea    rcx,[rbp-0x41]
   14132e3e8:	e8 f3 13 d4 fe       	call   0x14006f7e0
   14132e3ed:	4c 8b 45 0f          	mov    r8,QWORD PTR [rbp+0xf]
   14132e3f1:	4d 85 c0             	test   r8,r8
   14132e3f4:	74 17                	je     0x14132e40d
   14132e3f6:	48 8d 55 ff          	lea    rdx,[rbp-0x1]
   14132e3fa:	48 83 7d 17 0f       	cmp    QWORD PTR [rbp+0x17],0xf
   14132e3ff:	48 0f 47 55 ff       	cmova  rdx,QWORD PTR [rbp-0x1]
   14132e404:	49 8b ce             	mov    rcx,r14
   14132e407:	e8 94 15 d4 fe       	call   0x14006f9a0
   14132e40c:	90                   	nop
   14132e40d:	48 8d 4d ff          	lea    rcx,[rbp-0x1]
   14132e411:	e8 ca 13 d4 fe       	call   0x14006f7e0
   14132e416:	eb 38                	jmp    0x14132e450
   14132e418:	48 8b 91 80 0d 00 00 	mov    rdx,QWORD PTR [rcx+0xd80]
   14132e41f:	48 85 d2             	test   rdx,rdx
   14132e422:	74 0d                	je     0x14132e431
   14132e424:	48 83 7a 30 00       	cmp    QWORD PTR [rdx+0x30],0x0
   14132e429:	74 06                	je     0x14132e431
   14132e42b:	48 83 c2 20          	add    rdx,0x20
   14132e42f:	eb 04                	jmp    0x14132e435
   14132e431:	48 8d 51 08          	lea    rdx,[rcx+0x8]
   14132e435:	4c 3b f2             	cmp    r14,rdx
   14132e438:	74 16                	je     0x14132e450
   14132e43a:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132e43f:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132e443:	76 03                	jbe    0x14132e448
   14132e445:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132e448:	49 8b ce             	mov    rcx,r14
   14132e44b:	e8 10 14 d4 fe       	call   0x14006f860
   14132e450:	48 8b 4d 1f          	mov    rcx,QWORD PTR [rbp+0x1f]
   14132e454:	48 33 cc             	xor    rcx,rsp
   14132e457:	e8 74 61 20 00       	call   0x1415345d0
   14132e45c:	48 8b 9c 24 40 01 00 	mov    rbx,QWORD PTR [rsp+0x140]
   14132e463:	00 
   14132e464:	48 81 c4 f0 00 00 00 	add    rsp,0xf0
   14132e46b:	41 5f                	pop    r15
   14132e46d:	41 5e                	pop    r14
   14132e46f:	41 5d                	pop    r13
   14132e471:	41 5c                	pop    r12
   14132e473:	5f                   	pop    rdi
   14132e474:	5e                   	pop    rsi
   14132e475:	5d                   	pop    rbp
   14132e476:	c3                   	ret
