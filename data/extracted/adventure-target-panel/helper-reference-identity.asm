
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014132e430 <.text+0x132d430>:
   14132e430:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   14132e435:	55                   	push   rbp
   14132e436:	56                   	push   rsi
   14132e437:	57                   	push   rdi
   14132e438:	41 54                	push   r12
   14132e43a:	41 55                	push   r13
   14132e43c:	41 56                	push   r14
   14132e43e:	41 57                	push   r15
   14132e440:	48 8d 6c 24 e1       	lea    rbp,[rsp-0x1f]
   14132e445:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
   14132e44c:	48 8b 05 ed db 56 00 	mov    rax,QWORD PTR [rip+0x56dbed]        # 0x14189c040
   14132e453:	48 33 c4             	xor    rax,rsp
   14132e456:	48 89 45 0f          	mov    QWORD PTR [rbp+0xf],rax
   14132e45a:	41 0f b6 d9          	movzx  ebx,r9b
   14132e45e:	88 5c 24 40          	mov    BYTE PTR [rsp+0x40],bl
   14132e462:	45 8b f8             	mov    r15d,r8d
   14132e465:	44 89 44 24 44       	mov    DWORD PTR [rsp+0x44],r8d
   14132e46a:	48 8b f2             	mov    rsi,rdx
   14132e46d:	48 89 55 8f          	mov    QWORD PTR [rbp-0x71],rdx
   14132e471:	4c 8b f1             	mov    r14,rcx
   14132e474:	4c 8b 15 95 6c 0b 01 	mov    r10,QWORD PTR [rip+0x10b6c95]        # 0x1423e5110
   14132e47b:	48 8b 0d 4e 6c 0b 01 	mov    rcx,QWORD PTR [rip+0x10b6c4e]        # 0x1423e50d0
   14132e482:	4c 8b 1d 3f 6c 0b 01 	mov    r11,QWORD PTR [rip+0x10b6c3f]        # 0x1423e50c8
   14132e489:	44 8b 0d 08 de 56 00 	mov    r9d,DWORD PTR [rip+0x56de08]        # 0x14189c298
   14132e490:	41 83 f9 01          	cmp    r9d,0x1
   14132e494:	75 40                	jne    0x14132e4d6
   14132e496:	48 8b c1             	mov    rax,rcx
   14132e499:	49 2b c3             	sub    rax,r11
   14132e49c:	48 c1 f8 03          	sar    rax,0x3
   14132e4a0:	48 85 c0             	test   rax,rax
   14132e4a3:	74 31                	je     0x14132e4d6
   14132e4a5:	4d 85 d2             	test   r10,r10
   14132e4a8:	74 2c                	je     0x14132e4d6
   14132e4aa:	4d 3b f2             	cmp    r14,r10
   14132e4ad:	75 27                	jne    0x14132e4d6
   14132e4af:	48 8d 05 9a e0 2b 00 	lea    rax,[rip+0x2be09a]        # 0x1415ec550
   14132e4b6:	48 8d 15 e3 a7 2b 00 	lea    rdx,[rip+0x2ba7e3]        # 0x1415e8ca0
   14132e4bd:	84 db                	test   bl,bl
   14132e4bf:	48 0f 44 d0          	cmove  rdx,rax
   14132e4c3:	41 b8 03 00 00 00    	mov    r8d,0x3
   14132e4c9:	48 8b ce             	mov    rcx,rsi
   14132e4cc:	e8 ff 13 d4 fe       	call   0x14006f8d0
   14132e4d1:	e9 74 14 00 00       	jmp    0x14132f94a
   14132e4d6:	49 8b 96 80 0d 00 00 	mov    rdx,QWORD PTR [r14+0xd80]
   14132e4dd:	48 85 d2             	test   rdx,rdx
   14132e4e0:	74 10                	je     0x14132e4f2
   14132e4e2:	48 83 7a 30 00       	cmp    QWORD PTR [rdx+0x30],0x0
   14132e4e7:	74 09                	je     0x14132e4f2
   14132e4e9:	48 83 c2 20          	add    rdx,0x20
   14132e4ed:	e9 31 14 00 00       	jmp    0x14132f923
   14132e4f2:	8b 05 cc dd 56 00    	mov    eax,DWORD PTR [rip+0x56ddcc]        # 0x14189c2c4
   14132e4f8:	83 c0 fc             	add    eax,0xfffffffc
   14132e4fb:	83 f8 01             	cmp    eax,0x1
   14132e4fe:	0f 86 1b 14 00 00    	jbe    0x14132f91f
   14132e504:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   14132e50a:	41 83 f9 01          	cmp    r9d,0x1
   14132e50e:	0f 85 ed 07 00 00    	jne    0x14132ed01
   14132e514:	49 2b cb             	sub    rcx,r11
   14132e517:	48 c1 f9 03          	sar    rcx,0x3
   14132e51b:	48 85 c9             	test   rcx,rcx
   14132e51e:	0f 84 dd 07 00 00    	je     0x14132ed01
   14132e524:	4d 85 d2             	test   r10,r10
   14132e527:	0f 84 d4 07 00 00    	je     0x14132ed01
   14132e52d:	4d 8d 7e 08          	lea    r15,[r14+0x8]
   14132e531:	4c 89 7c 24 48       	mov    QWORD PTR [rsp+0x48],r15
   14132e536:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   14132e53d:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132e544:	48 8d 0d 6d b7 1c 01 	lea    rcx,[rip+0x11cb76d]        # 0x1424f9cb8
   14132e54b:	e8 60 4b 82 ff       	call   0x140b530b0
   14132e550:	48 89 45 97          	mov    QWORD PTR [rbp-0x69],rax
   14132e554:	48 85 c0             	test   rax,rax
   14132e557:	74 56                	je     0x14132e5af
   14132e559:	48 8b 88 30 01 00 00 	mov    rcx,QWORD PTR [rax+0x130]
   14132e560:	48 85 c9             	test   rcx,rcx
   14132e563:	75 05                	jne    0x14132e56a
   14132e565:	45 33 e4             	xor    r12d,r12d
   14132e568:	eb 2a                	jmp    0x14132e594
   14132e56a:	48 8b 41 58          	mov    rax,QWORD PTR [rcx+0x58]
   14132e56e:	48 85 c0             	test   rax,rax
   14132e571:	75 05                	jne    0x14132e578
   14132e573:	45 33 e4             	xor    r12d,r12d
   14132e576:	eb 1c                	jmp    0x14132e594
   14132e578:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
   14132e57b:	41 3b d5             	cmp    edx,r13d
   14132e57e:	75 05                	jne    0x14132e585
   14132e580:	45 33 e4             	xor    r12d,r12d
   14132e583:	eb 0f                	jmp    0x14132e594
   14132e585:	48 8d 0d 5c 97 1b 01 	lea    rcx,[rip+0x11b975c]        # 0x1424e7ce8
   14132e58c:	e8 df 3f d4 fe       	call   0x140072570
   14132e591:	4c 8b e0             	mov    r12,rax
   14132e594:	4c 89 65 87          	mov    QWORD PTR [rbp-0x79],r12
   14132e598:	4d 85 e4             	test   r12,r12
   14132e59b:	74 19                	je     0x14132e5b6
   14132e59d:	49 8b cc             	mov    rcx,r12
   14132e5a0:	e8 4b bf 90 ff       	call   0x140c3a4f0
   14132e5a5:	4c 8b c8             	mov    r9,rax
   14132e5a8:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   14132e5ad:	eb 0a                	jmp    0x14132e5b9
   14132e5af:	45 33 e4             	xor    r12d,r12d
   14132e5b2:	4c 89 65 87          	mov    QWORD PTR [rbp-0x79],r12
   14132e5b6:	4d 8b cf             	mov    r9,r15
   14132e5b9:	41 80 79 72 00       	cmp    BYTE PTR [r9+0x72],0x0
   14132e5be:	0f 84 38 07 00 00    	je     0x14132ecfc
   14132e5c4:	83 3d f9 dc 56 00 01 	cmp    DWORD PTR [rip+0x56dcf9],0x1        # 0x14189c2c4
   14132e5cb:	0f 85 08 01 00 00    	jne    0x14132e6d9
   14132e5d1:	32 db                	xor    bl,bl
   14132e5d3:	48 8b 15 36 6b 0b 01 	mov    rdx,QWORD PTR [rip+0x10b6b36]        # 0x1423e5110
   14132e5da:	4c 8d 82 74 12 00 00 	lea    r8,[rdx+0x1274]
   14132e5e1:	8b 92 30 0c 00 00    	mov    edx,DWORD PTR [rdx+0xc30]
   14132e5e7:	48 8d 0d ca b6 1c 01 	lea    rcx,[rip+0x11cb6ca]        # 0x1424f9cb8
   14132e5ee:	e8 bd 4a 82 ff       	call   0x140b530b0
   14132e5f3:	48 8b f8             	mov    rdi,rax
   14132e5f6:	48 85 c0             	test   rax,rax
   14132e5f9:	0f 84 cd 00 00 00    	je     0x14132e6cc
   14132e5ff:	41 8b 8e 30 0c 00 00 	mov    ecx,DWORD PTR [r14+0xc30]
   14132e606:	41 3b cd             	cmp    ecx,r13d
   14132e609:	74 68                	je     0x14132e673
   14132e60b:	48 8b 90 30 01 00 00 	mov    rdx,QWORD PTR [rax+0x130]
   14132e612:	48 85 d2             	test   rdx,rdx
   14132e615:	74 5c                	je     0x14132e673
   14132e617:	48 83 7a 60 00       	cmp    QWORD PTR [rdx+0x60],0x0
   14132e61c:	74 55                	je     0x14132e673
   14132e61e:	48 8b 52 60          	mov    rdx,QWORD PTR [rdx+0x60]
   14132e622:	e8 99 b7 d8 fe       	call   0x1400b9dc0
   14132e627:	48 85 c0             	test   rax,rax
   14132e62a:	74 47                	je     0x14132e673
   14132e62c:	f6 40 04 01          	test   BYTE PTR [rax+0x4],0x1
   14132e630:	0f 85 8a 00 00 00    	jne    0x14132e6c0
   14132e636:	4d 85 e4             	test   r12,r12
   14132e639:	74 38                	je     0x14132e673
   14132e63b:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14132e63f:	45 8b 04 24          	mov    r8d,DWORD PTR [r12]
   14132e643:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132e647:	e8 94 c5 d8 fe       	call   0x1400babe0
   14132e64c:	44 89 6c 24 50       	mov    DWORD PTR [rsp+0x50],r13d
   14132e651:	c7 45 83 00 00 00 00 	mov    DWORD PTR [rbp-0x7d],0x0
   14132e658:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   14132e65d:	38 5d a7             	cmp    BYTE PTR [rbp-0x59],bl
   14132e660:	48 0f 45 45 9f       	cmovne rax,QWORD PTR [rbp-0x61]
   14132e665:	0f b6 db             	movzx  ebx,bl
   14132e668:	41 3b c5             	cmp    eax,r13d
   14132e66b:	b8 01 00 00 00       	mov    eax,0x1
   14132e670:	0f 45 d8             	cmovne ebx,eax
   14132e673:	45 8b 86 4c 01 00 00 	mov    r8d,DWORD PTR [r14+0x14c]
   14132e67a:	45 3b c5             	cmp    r8d,r13d
   14132e67d:	74 4d                	je     0x14132e6cc
   14132e67f:	48 8b 87 30 01 00 00 	mov    rax,QWORD PTR [rdi+0x130]
   14132e686:	48 85 c0             	test   rax,rax
   14132e689:	74 41                	je     0x14132e6cc
   14132e68b:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   14132e68f:	48 85 d2             	test   rdx,rdx
   14132e692:	74 38                	je     0x14132e6cc
   14132e694:	48 83 c2 48          	add    rdx,0x48
   14132e698:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132e69c:	e8 3f c5 d8 fe       	call   0x1400babe0
   14132e6a1:	44 89 6c 24 50       	mov    DWORD PTR [rsp+0x50],r13d
   14132e6a6:	c7 45 83 00 00 00 00 	mov    DWORD PTR [rbp-0x7d],0x0
   14132e6ad:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   14132e6b2:	80 7d a7 00          	cmp    BYTE PTR [rbp-0x59],0x0
   14132e6b6:	48 0f 45 45 9f       	cmovne rax,QWORD PTR [rbp-0x61]
   14132e6bb:	41 3b c5             	cmp    eax,r13d
   14132e6be:	74 0c                	je     0x14132e6cc
   14132e6c0:	4d 8b cf             	mov    r9,r15
   14132e6c3:	4c 89 7c 24 48       	mov    QWORD PTR [rsp+0x48],r15
   14132e6c8:	b3 01                	mov    bl,0x1
   14132e6ca:	eb 05                	jmp    0x14132e6d1
   14132e6cc:	4c 8b 4c 24 48       	mov    r9,QWORD PTR [rsp+0x48]
   14132e6d1:	84 db                	test   bl,bl
   14132e6d3:	0f 84 23 06 00 00    	je     0x14132ecfc
   14132e6d9:	45 32 ff             	xor    r15b,r15b
   14132e6dc:	45 8b ae d0 03 00 00 	mov    r13d,DWORD PTR [r14+0x3d0]
   14132e6e3:	48 8b 05 26 6a 0b 01 	mov    rax,QWORD PTR [rip+0x10b6a26]        # 0x1423e5110
   14132e6ea:	44 8b a0 30 01 00 00 	mov    r12d,DWORD PTR [rax+0x130]
   14132e6f1:	45 3b ec             	cmp    r13d,r12d
   14132e6f4:	0f 84 8e 07 00 00    	je     0x14132ee88
   14132e6fa:	45 8b 86 30 0c 00 00 	mov    r8d,DWORD PTR [r14+0xc30]
   14132e701:	48 8b 05 18 af 31 01 	mov    rax,QWORD PTR [rip+0x131af18]        # 0x142649620
   14132e708:	48 8b 0d 19 af 31 01 	mov    rcx,QWORD PTR [rip+0x131af19]        # 0x142649628
   14132e70f:	48 8b d0             	mov    rdx,rax
   14132e712:	48 3b c1             	cmp    rax,rcx
   14132e715:	73 6d                	jae    0x14132e784
   14132e717:	44 39 00             	cmp    DWORD PTR [rax],r8d
   14132e71a:	74 06                	je     0x14132e722
   14132e71c:	48 83 c0 04          	add    rax,0x4
   14132e720:	eb f0                	jmp    0x14132e712
   14132e722:	48 2b c2             	sub    rax,rdx
   14132e725:	48 c1 f8 02          	sar    rax,0x2
   14132e729:	83 f8 ff             	cmp    eax,0xffffffff
   14132e72c:	74 56                	je     0x14132e784
   14132e72e:	48 8b 1d d3 ae 31 01 	mov    rbx,QWORD PTR [rip+0x131aed3]        # 0x142649608
   14132e735:	48 8b 3d d4 ae 31 01 	mov    rdi,QWORD PTR [rip+0x131aed4]        # 0x142649610
   14132e73c:	be 01 00 00 00       	mov    esi,0x1
   14132e741:	48 3b df             	cmp    rbx,rdi
   14132e744:	73 31                	jae    0x14132e777
   14132e746:	8b 13                	mov    edx,DWORD PTR [rbx]
   14132e748:	48 8d 0d 61 69 0b 01 	lea    rcx,[rip+0x10b6961]        # 0x1423e50b0
   14132e74f:	e8 7c dd 09 00       	call   0x1413cc4d0
   14132e754:	48 85 c0             	test   rax,rax
   14132e757:	74 18                	je     0x14132e771
   14132e759:	44 39 a0 d0 03 00 00 	cmp    DWORD PTR [rax+0x3d0],r12d
   14132e760:	75 0f                	jne    0x14132e771
   14132e762:	45 0f b6 ff          	movzx  r15d,r15b
   14132e766:	44 3b a8 30 01 00 00 	cmp    r13d,DWORD PTR [rax+0x130]
   14132e76d:	44 0f 44 fe          	cmove  r15d,esi
   14132e771:	48 83 c3 04          	add    rbx,0x4
   14132e775:	eb ca                	jmp    0x14132e741
   14132e777:	45 84 ff             	test   r15b,r15b
   14132e77a:	48 8b 75 8f          	mov    rsi,QWORD PTR [rbp-0x71]
   14132e77e:	0f 85 ff 06 00 00    	jne    0x14132ee83
   14132e784:	0f 57 c0             	xorps  xmm0,xmm0
   14132e787:	0f 11 45 af          	movups XMMWORD PTR [rbp-0x51],xmm0
   14132e78b:	48 c7 45 bf 00 00 00 	mov    QWORD PTR [rbp-0x41],0x0
   14132e792:	00 
   14132e793:	48 c7 45 c7 0f 00 00 	mov    QWORD PTR [rbp-0x39],0xf
   14132e79a:	00 
   14132e79b:	c6 45 af 00          	mov    BYTE PTR [rbp-0x51],0x0
   14132e79f:	49 83 be 80 0d 00 00 	cmp    QWORD PTR [r14+0xd80],0x0
   14132e7a6:	00 
   14132e7a7:	75 16                	jne    0x14132e7bf
   14132e7a9:	41 80 be 38 08 00 00 	cmp    BYTE PTR [r14+0x838],0x0
   14132e7b0:	00 
   14132e7b1:	75 0c                	jne    0x14132e7bf
   14132e7b3:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   14132e7b8:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14132e7bd:	eb 07                	jmp    0x14132e7c6
   14132e7bf:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14132e7c4:	8b c3                	mov    eax,ebx
   14132e7c6:	4d 8b ee             	mov    r13,r14
   14132e7c9:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   14132e7ce:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   14132e7d3:	c6 44 24 20 00       	mov    BYTE PTR [rsp+0x20],0x0
   14132e7d8:	45 0f b7 8e 2c 01 00 	movzx  r9d,WORD PTR [r14+0x12c]
   14132e7df:	00 
   14132e7e0:	45 0f b7 86 a4 00 00 	movzx  r8d,WORD PTR [r14+0xa4]
   14132e7e7:	00 
   14132e7e8:	41 0f b7 96 a0 00 00 	movzx  edx,WORD PTR [r14+0xa0]
   14132e7ef:	00 
   14132e7f0:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   14132e7f4:	e8 c7 f8 ff ff       	call   0x14132e0c0
   14132e7f9:	48 8b 45 87          	mov    rax,QWORD PTR [rbp-0x79]
   14132e7fd:	48 85 c0             	test   rax,rax
   14132e800:	74 0e                	je     0x14132e810
   14132e802:	66 83 b8 ac 00 00 00 	cmp    WORD PTR [rax+0xac],0xffff
   14132e809:	ff 
   14132e80a:	0f 85 eb 03 00 00    	jne    0x14132ebfb
   14132e810:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   14132e817:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132e81e:	48 8d 0d 93 b4 1c 01 	lea    rcx,[rip+0x11cb493]        # 0x1424f9cb8
   14132e825:	e8 86 48 82 ff       	call   0x140b530b0
   14132e82a:	48 85 c0             	test   rax,rax
   14132e82d:	0f 84 0d 01 00 00    	je     0x14132e940
   14132e833:	48 8d 4d 8f          	lea    rcx,[rbp-0x71]
   14132e837:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   14132e83c:	4c 8d 4c 24 50       	lea    r9,[rsp+0x50]
   14132e841:	4c 8d 44 24 41       	lea    r8,[rsp+0x41]
   14132e846:	8b d3                	mov    edx,ebx
   14132e848:	48 8b c8             	mov    rcx,rax
   14132e84b:	e8 d0 cd 8b ff       	call   0x140beb620
   14132e850:	48 8b d8             	mov    rbx,rax
   14132e853:	48 85 c0             	test   rax,rax
   14132e856:	0f 84 e4 00 00 00    	je     0x14132e940
   14132e85c:	48 8b 45 97          	mov    rax,QWORD PTR [rbp-0x69]
   14132e860:	48 85 c0             	test   rax,rax
   14132e863:	0f 84 d7 00 00 00    	je     0x14132e940
   14132e869:	0f be 50 06          	movsx  edx,BYTE PTR [rax+0x6]
   14132e86d:	80 7c 24 41 00       	cmp    BYTE PTR [rsp+0x41],0x0
   14132e872:	74 4a                	je     0x14132e8be
   14132e874:	85 d2                	test   edx,edx
   14132e876:	74 2a                	je     0x14132e8a2
   14132e878:	83 fa 01             	cmp    edx,0x1
   14132e87b:	74 09                	je     0x14132e886
   14132e87d:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   14132e884:	eb 7e                	jmp    0x14132e904
   14132e886:	48 83 bb e8 01 00 00 	cmp    QWORD PTR [rbx+0x1e8],0x0
   14132e88d:	00 
   14132e88e:	75 09                	jne    0x14132e899
   14132e890:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   14132e897:	eb 6b                	jmp    0x14132e904
   14132e899:	48 8d 93 d8 01 00 00 	lea    rdx,[rbx+0x1d8]
   14132e8a0:	eb 62                	jmp    0x14132e904
   14132e8a2:	48 83 bb a8 01 00 00 	cmp    QWORD PTR [rbx+0x1a8],0x0
   14132e8a9:	00 
   14132e8aa:	75 09                	jne    0x14132e8b5
   14132e8ac:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   14132e8b3:	eb 4f                	jmp    0x14132e904
   14132e8b5:	48 8d 93 98 01 00 00 	lea    rdx,[rbx+0x198]
   14132e8bc:	eb 46                	jmp    0x14132e904
   14132e8be:	85 d2                	test   edx,edx
   14132e8c0:	74 2a                	je     0x14132e8ec
   14132e8c2:	83 fa 01             	cmp    edx,0x1
   14132e8c5:	74 09                	je     0x14132e8d0
   14132e8c7:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   14132e8ce:	eb 34                	jmp    0x14132e904
   14132e8d0:	48 83 bb 28 01 00 00 	cmp    QWORD PTR [rbx+0x128],0x0
   14132e8d7:	00 
   14132e8d8:	75 09                	jne    0x14132e8e3
   14132e8da:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   14132e8e1:	eb 21                	jmp    0x14132e904
   14132e8e3:	48 8d 93 18 01 00 00 	lea    rdx,[rbx+0x118]
   14132e8ea:	eb 18                	jmp    0x14132e904
   14132e8ec:	48 83 bb e8 00 00 00 	cmp    QWORD PTR [rbx+0xe8],0x0
   14132e8f3:	00 
   14132e8f4:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   14132e8fb:	74 07                	je     0x14132e904
   14132e8fd:	48 8d 93 d8 00 00 00 	lea    rdx,[rbx+0xd8]
   14132e904:	48 8d 45 af          	lea    rax,[rbp-0x51]
   14132e908:	48 3b c2             	cmp    rax,rdx
   14132e90b:	74 17                	je     0x14132e924
   14132e90d:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132e911:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132e916:	76 03                	jbe    0x14132e91b
   14132e918:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132e91b:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   14132e91f:	e8 ac 0f d4 fe       	call   0x14006f8d0
   14132e924:	66 83 bb c8 02 00 00 	cmp    WORD PTR [rbx+0x2c8],0x0
   14132e92b:	00 
   14132e92c:	7e 12                	jle    0x14132e940
   14132e92e:	4c 8d 45 af          	lea    r8,[rbp-0x51]
   14132e932:	48 8b 55 8f          	mov    rdx,QWORD PTR [rbp-0x71]
   14132e936:	48 8b 4c 24 50       	mov    rcx,QWORD PTR [rsp+0x50]
   14132e93b:	e8 70 f6 68 ff       	call   0x1409bdfb0
   14132e940:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   14132e947:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132e94e:	48 8d 0d 63 b3 1c 01 	lea    rcx,[rip+0x11cb363]        # 0x1424f9cb8
   14132e955:	e8 56 47 82 ff       	call   0x140b530b0
   14132e95a:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14132e95f:	48 85 c0             	test   rax,rax
   14132e962:	0f 84 24 01 00 00    	je     0x14132ea8c
   14132e968:	ba 04 00 00 00       	mov    edx,0x4
   14132e96d:	44 8b c3             	mov    r8d,ebx
   14132e970:	48 8b c8             	mov    rcx,rax
   14132e973:	e8 48 8a 86 ff       	call   0x140b973c0
   14132e978:	66 85 c0             	test   ax,ax
   14132e97b:	0f 8e 0b 01 00 00    	jle    0x14132ea8c
   14132e981:	41 0f b7 85 a0 00 00 	movzx  eax,WORD PTR [r13+0xa0]
   14132e988:	00 
   14132e989:	66 83 e8 67          	sub    ax,0x67
   14132e98d:	66 83 f8 01          	cmp    ax,0x1
   14132e991:	77 22                	ja     0x14132e9b5
   14132e993:	48 83 7d bf 00       	cmp    QWORD PTR [rbp-0x41],0x0
   14132e998:	74 1b                	je     0x14132e9b5
   14132e99a:	41 b8 06 00 00 00    	mov    r8d,0x6
   14132e9a0:	48 8d 15 55 e0 2b 00 	lea    rdx,[rip+0x2be055]        # 0x1415ec9fc
   14132e9a7:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   14132e9ab:	e8 60 10 d4 fe       	call   0x14006fa10
   14132e9b0:	e9 d7 00 00 00       	jmp    0x14132ea8c
   14132e9b5:	48 8b 7d c7          	mov    rdi,QWORD PTR [rbp-0x39]
   14132e9b9:	48 83 ff 05          	cmp    rdi,0x5
   14132e9bd:	72 33                	jb     0x14132e9f2
   14132e9bf:	48 8d 5d af          	lea    rbx,[rbp-0x51]
   14132e9c3:	48 83 ff 0f          	cmp    rdi,0xf
   14132e9c7:	48 0f 47 5d af       	cmova  rbx,QWORD PTR [rbp-0x51]
   14132e9cc:	48 c7 45 bf 05 00 00 	mov    QWORD PTR [rbp-0x41],0x5
   14132e9d3:	00 
   14132e9d4:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132e9da:	48 8d 15 47 e0 2b 00 	lea    rdx,[rip+0x2be047]        # 0x1415eca28
   14132e9e1:	48 8b cb             	mov    rcx,rbx
   14132e9e4:	e8 31 c4 20 00       	call   0x14153ae1a
   14132e9e9:	c6 43 05 00          	mov    BYTE PTR [rbx+0x5],0x0
   14132e9ed:	e9 95 00 00 00       	jmp    0x14132ea87
   14132e9f2:	48 8b cf             	mov    rcx,rdi
   14132e9f5:	48 d1 e9             	shr    rcx,1
   14132e9f8:	48 bb ff ff ff ff ff 	movabs rbx,0x7fffffffffffffff
   14132e9ff:	ff ff 7f 
   14132ea02:	48 8b c3             	mov    rax,rbx
   14132ea05:	48 2b c1             	sub    rax,rcx
   14132ea08:	48 3b f8             	cmp    rdi,rax
   14132ea0b:	77 10                	ja     0x14132ea1d
   14132ea0d:	48 8d 04 39          	lea    rax,[rcx+rdi*1]
   14132ea11:	bb 0f 00 00 00       	mov    ebx,0xf
   14132ea16:	48 3b c3             	cmp    rax,rbx
   14132ea19:	48 0f 47 d8          	cmova  rbx,rax
   14132ea1d:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   14132ea21:	e8 aa 1d d4 fe       	call   0x1400707d0
   14132ea26:	4c 8b f8             	mov    r15,rax
   14132ea29:	48 c7 45 bf 05 00 00 	mov    QWORD PTR [rbp-0x41],0x5
   14132ea30:	00 
   14132ea31:	48 89 5d c7          	mov    QWORD PTR [rbp-0x39],rbx
   14132ea35:	8b 0d ed df 2b 00    	mov    ecx,DWORD PTR [rip+0x2bdfed]        # 0x1415eca28
   14132ea3b:	89 08                	mov    DWORD PTR [rax],ecx
   14132ea3d:	0f b6 0d e8 df 2b 00 	movzx  ecx,BYTE PTR [rip+0x2bdfe8]        # 0x1415eca2c
   14132ea44:	88 48 04             	mov    BYTE PTR [rax+0x4],cl
   14132ea47:	c6 40 05 00          	mov    BYTE PTR [rax+0x5],0x0
   14132ea4b:	48 83 ff 0f          	cmp    rdi,0xf
   14132ea4f:	76 32                	jbe    0x14132ea83
   14132ea51:	48 8d 57 01          	lea    rdx,[rdi+0x1]
   14132ea55:	48 8b 4d af          	mov    rcx,QWORD PTR [rbp-0x51]
   14132ea59:	48 8b c1             	mov    rax,rcx
   14132ea5c:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132ea63:	72 19                	jb     0x14132ea7e
   14132ea65:	48 83 c2 27          	add    rdx,0x27
   14132ea69:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132ea6d:	48 2b c1             	sub    rax,rcx
   14132ea70:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132ea74:	48 83 f8 1f          	cmp    rax,0x1f
   14132ea78:	0f 87 a0 03 00 00    	ja     0x14132ee1e
   14132ea7e:	e8 fd ab 20 00       	call   0x141539680
   14132ea83:	4c 89 7d af          	mov    QWORD PTR [rbp-0x51],r15
   14132ea87:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14132ea8c:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   14132ea93:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132ea9a:	48 8d 0d 17 b2 1c 01 	lea    rcx,[rip+0x11cb217]        # 0x1424f9cb8
   14132eaa1:	e8 0a 46 82 ff       	call   0x140b530b0
   14132eaa6:	48 85 c0             	test   rax,rax
   14132eaa9:	74 15                	je     0x14132eac0
   14132eaab:	ba 06 00 00 00       	mov    edx,0x6
   14132eab0:	44 8b c3             	mov    r8d,ebx
   14132eab3:	48 8b c8             	mov    rcx,rax
   14132eab6:	e8 05 89 86 ff       	call   0x140b973c0
   14132eabb:	66 85 c0             	test   ax,ax
   14132eabe:	7f 3c                	jg     0x14132eafc
   14132eac0:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   14132eac7:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132eace:	48 8d 0d e3 b1 1c 01 	lea    rcx,[rip+0x11cb1e3]        # 0x1424f9cb8
   14132ead5:	e8 d6 45 82 ff       	call   0x140b530b0
   14132eada:	48 85 c0             	test   rax,rax
   14132eadd:	0f 84 18 01 00 00    	je     0x14132ebfb
   14132eae3:	ba 07 00 00 00       	mov    edx,0x7
   14132eae8:	44 8b c3             	mov    r8d,ebx
   14132eaeb:	48 8b c8             	mov    rcx,rax
   14132eaee:	e8 9d a2 86 ff       	call   0x140b98d90
   14132eaf3:	66 85 c0             	test   ax,ax
   14132eaf6:	0f 8e ff 00 00 00    	jle    0x14132ebfb
   14132eafc:	41 0f b7 85 a0 00 00 	movzx  eax,WORD PTR [r13+0xa0]
   14132eb03:	00 
   14132eb04:	66 83 e8 67          	sub    ax,0x67
   14132eb08:	66 83 f8 01          	cmp    ax,0x1
   14132eb0c:	77 22                	ja     0x14132eb30
   14132eb0e:	48 83 7d bf 00       	cmp    QWORD PTR [rbp-0x41],0x0
   14132eb13:	74 1b                	je     0x14132eb30
   14132eb15:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132eb1b:	48 8d 15 ae 40 45 00 	lea    rdx,[rip+0x4540ae]        # 0x141782bd0
   14132eb22:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   14132eb26:	e8 e5 0e d4 fe       	call   0x14006fa10
   14132eb2b:	e9 cb 00 00 00       	jmp    0x14132ebfb
   14132eb30:	48 8b 5d c7          	mov    rbx,QWORD PTR [rbp-0x39]
   14132eb34:	48 83 fb 08          	cmp    rbx,0x8
   14132eb38:	72 2b                	jb     0x14132eb65
   14132eb3a:	48 8d 45 af          	lea    rax,[rbp-0x51]
   14132eb3e:	48 83 fb 0f          	cmp    rbx,0xf
   14132eb42:	48 0f 47 45 af       	cmova  rax,QWORD PTR [rbp-0x51]
   14132eb47:	48 c7 45 bf 08 00 00 	mov    QWORD PTR [rbp-0x41],0x8
   14132eb4e:	00 
   14132eb4f:	48 b9 70 72 69 73 6f 	movabs rcx,0x72656e6f73697270
   14132eb56:	6e 65 72 
   14132eb59:	48 89 08             	mov    QWORD PTR [rax],rcx
   14132eb5c:	c6 40 08 00          	mov    BYTE PTR [rax+0x8],0x0
   14132eb60:	e9 96 00 00 00       	jmp    0x14132ebfb
   14132eb65:	48 8b cb             	mov    rcx,rbx
   14132eb68:	48 d1 e9             	shr    rcx,1
   14132eb6b:	48 ba ff ff ff ff ff 	movabs rdx,0x7fffffffffffffff
   14132eb72:	ff ff 7f 
   14132eb75:	48 8b c2             	mov    rax,rdx
   14132eb78:	48 2b c1             	sub    rax,rcx
   14132eb7b:	48 3b d8             	cmp    rbx,rax
   14132eb7e:	76 05                	jbe    0x14132eb85
   14132eb80:	48 8b fa             	mov    rdi,rdx
   14132eb83:	eb 10                	jmp    0x14132eb95
   14132eb85:	48 8d 04 19          	lea    rax,[rcx+rbx*1]
   14132eb89:	bf 0f 00 00 00       	mov    edi,0xf
   14132eb8e:	48 3b c7             	cmp    rax,rdi
   14132eb91:	48 0f 47 f8          	cmova  rdi,rax
   14132eb95:	48 8d 4f 01          	lea    rcx,[rdi+0x1]
   14132eb99:	e8 32 1c d4 fe       	call   0x1400707d0
   14132eb9e:	4c 8b f8             	mov    r15,rax
   14132eba1:	48 c7 45 bf 08 00 00 	mov    QWORD PTR [rbp-0x41],0x8
   14132eba8:	00 
   14132eba9:	48 89 7d c7          	mov    QWORD PTR [rbp-0x39],rdi
   14132ebad:	48 b8 70 72 69 73 6f 	movabs rax,0x72656e6f73697270
   14132ebb4:	6e 65 72 
   14132ebb7:	49 89 07             	mov    QWORD PTR [r15],rax
   14132ebba:	41 c6 47 08 00       	mov    BYTE PTR [r15+0x8],0x0
   14132ebbf:	48 83 fb 0f          	cmp    rbx,0xf
   14132ebc3:	76 32                	jbe    0x14132ebf7
   14132ebc5:	48 8d 53 01          	lea    rdx,[rbx+0x1]
   14132ebc9:	48 8b 4d af          	mov    rcx,QWORD PTR [rbp-0x51]
   14132ebcd:	48 8b c1             	mov    rax,rcx
   14132ebd0:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132ebd7:	72 19                	jb     0x14132ebf2
   14132ebd9:	48 83 c2 27          	add    rdx,0x27
   14132ebdd:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132ebe1:	48 2b c1             	sub    rax,rcx
   14132ebe4:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132ebe8:	48 83 f8 1f          	cmp    rax,0x1f
   14132ebec:	0f 87 2c 02 00 00    	ja     0x14132ee1e
   14132ebf2:	e8 89 aa 20 00       	call   0x141539680
   14132ebf7:	4c 89 7d af          	mov    QWORD PTR [rbp-0x51],r15
   14132ebfb:	49 83 be 90 00 00 00 	cmp    QWORD PTR [r14+0x90],0x0
   14132ec02:	00 
   14132ec03:	74 2d                	je     0x14132ec32
   14132ec05:	80 7d 7f 00          	cmp    BYTE PTR [rbp+0x7f],0x0
   14132ec09:	74 27                	je     0x14132ec32
   14132ec0b:	49 8d 96 80 00 00 00 	lea    rdx,[r14+0x80]
   14132ec12:	48 8d 45 af          	lea    rax,[rbp-0x51]
   14132ec16:	48 3b c2             	cmp    rax,rdx
   14132ec19:	74 17                	je     0x14132ec32
   14132ec1b:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132ec1f:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132ec24:	76 03                	jbe    0x14132ec29
   14132ec26:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132ec29:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   14132ec2d:	e8 9e 0c d4 fe       	call   0x14006f8d0
   14132ec32:	0f 57 c0             	xorps  xmm0,xmm0
   14132ec35:	0f 11 45 ef          	movups XMMWORD PTR [rbp-0x11],xmm0
   14132ec39:	48 c7 45 ff 00 00 00 	mov    QWORD PTR [rbp-0x1],0x0
   14132ec40:	00 
   14132ec41:	48 c7 45 07 0f 00 00 	mov    QWORD PTR [rbp+0x7],0xf
   14132ec48:	00 
   14132ec49:	c6 45 ef 00          	mov    BYTE PTR [rbp-0x11],0x0
   14132ec4d:	48 8d 55 ef          	lea    rdx,[rbp-0x11]
   14132ec51:	48 8b 4c 24 48       	mov    rcx,QWORD PTR [rsp+0x48]
   14132ec56:	e8 d5 53 76 ff       	call   0x140a94030
   14132ec5b:	4c 8b 45 ff          	mov    r8,QWORD PTR [rbp-0x1]
   14132ec5f:	4d 85 c0             	test   r8,r8
   14132ec62:	0f 85 de 00 00 00    	jne    0x14132ed46
   14132ec68:	4c 39 45 bf          	cmp    QWORD PTR [rbp-0x41],r8
   14132ec6c:	0f 85 04 01 00 00    	jne    0x14132ed76
   14132ec72:	48 8b 55 07          	mov    rdx,QWORD PTR [rbp+0x7]
   14132ec76:	48 83 fa 0f          	cmp    rdx,0xf
   14132ec7a:	76 31                	jbe    0x14132ecad
   14132ec7c:	48 ff c2             	inc    rdx
   14132ec7f:	48 8b 4d ef          	mov    rcx,QWORD PTR [rbp-0x11]
   14132ec83:	48 8b c1             	mov    rax,rcx
   14132ec86:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132ec8d:	72 19                	jb     0x14132eca8
   14132ec8f:	48 83 c2 27          	add    rdx,0x27
   14132ec93:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132ec97:	48 2b c1             	sub    rax,rcx
   14132ec9a:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132ec9e:	48 83 f8 1f          	cmp    rax,0x1f
   14132eca2:	0f 87 76 01 00 00    	ja     0x14132ee1e
   14132eca8:	e8 d3 a9 20 00       	call   0x141539680
   14132ecad:	48 c7 45 ff 00 00 00 	mov    QWORD PTR [rbp-0x1],0x0
   14132ecb4:	00 
   14132ecb5:	48 c7 45 07 0f 00 00 	mov    QWORD PTR [rbp+0x7],0xf
   14132ecbc:	00 
   14132ecbd:	c6 45 ef 00          	mov    BYTE PTR [rbp-0x11],0x0
   14132ecc1:	48 8b 55 c7          	mov    rdx,QWORD PTR [rbp-0x39]
   14132ecc5:	48 83 fa 0f          	cmp    rdx,0xf
   14132ecc9:	76 31                	jbe    0x14132ecfc
   14132eccb:	48 ff c2             	inc    rdx
   14132ecce:	48 8b 4d af          	mov    rcx,QWORD PTR [rbp-0x51]
   14132ecd2:	48 8b c1             	mov    rax,rcx
   14132ecd5:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132ecdc:	72 19                	jb     0x14132ecf7
   14132ecde:	48 83 c2 27          	add    rdx,0x27
   14132ece2:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132ece6:	48 2b c1             	sub    rax,rcx
   14132ece9:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132eced:	48 83 f8 1f          	cmp    rax,0x1f
   14132ecf1:	0f 87 85 01 00 00    	ja     0x14132ee7c
   14132ecf7:	e8 84 a9 20 00       	call   0x141539680
   14132ecfc:	44 8b 7c 24 44       	mov    r15d,DWORD PTR [rsp+0x44]
   14132ed01:	45 0f b7 a6 a0 00 00 	movzx  r12d,WORD PTR [r14+0xa0]
   14132ed08:	00 
   14132ed09:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   14132ed10:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132ed17:	48 8d 0d 9a af 1c 01 	lea    rcx,[rip+0x11caf9a]        # 0x1424f9cb8
   14132ed1e:	e8 8d 43 82 ff       	call   0x140b530b0
   14132ed23:	4c 8b e8             	mov    r13,rax
   14132ed26:	48 85 c0             	test   rax,rax
   14132ed29:	0f 84 09 03 00 00    	je     0x14132f038
   14132ed2f:	48 8b 88 30 01 00 00 	mov    rcx,QWORD PTR [rax+0x130]
   14132ed36:	48 85 c9             	test   rcx,rcx
   14132ed39:	0f 85 85 01 00 00    	jne    0x14132eec4
   14132ed3f:	33 db                	xor    ebx,ebx
   14132ed41:	e9 a6 01 00 00       	jmp    0x14132eeec
   14132ed46:	48 83 7d bf 00       	cmp    QWORD PTR [rbp-0x41],0x0
   14132ed4b:	75 29                	jne    0x14132ed76
   14132ed4d:	48 8d 45 ef          	lea    rax,[rbp-0x11]
   14132ed51:	48 3b f0             	cmp    rsi,rax
   14132ed54:	74 16                	je     0x14132ed6c
   14132ed56:	48 8d 55 ef          	lea    rdx,[rbp-0x11]
   14132ed5a:	48 83 7d 07 0f       	cmp    QWORD PTR [rbp+0x7],0xf
   14132ed5f:	48 0f 47 55 ef       	cmova  rdx,QWORD PTR [rbp-0x11]
   14132ed64:	48 8b ce             	mov    rcx,rsi
   14132ed67:	e8 64 0b d4 fe       	call   0x14006f8d0
   14132ed6c:	48 8b ce             	mov    rcx,rsi
   14132ed6f:	e8 dc e8 1f ff       	call   0x14052d650
   14132ed74:	eb 76                	jmp    0x14132edec
   14132ed76:	48 8d 1d cb a0 2b 00 	lea    rbx,[rip+0x2ba0cb]        # 0x1415e8e48
   14132ed7d:	48 8d 15 38 ec 2b 00 	lea    rdx,[rip+0x2bec38]        # 0x1415ed9bc
   14132ed84:	80 7c 24 40 00       	cmp    BYTE PTR [rsp+0x40],0x0
   14132ed89:	48 0f 44 d3          	cmove  rdx,rbx
   14132ed8d:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132ed93:	48 8b ce             	mov    rcx,rsi
   14132ed96:	e8 35 0b d4 fe       	call   0x14006f8d0
   14132ed9b:	48 8d 55 af          	lea    rdx,[rbp-0x51]
   14132ed9f:	48 83 7d c7 0f       	cmp    QWORD PTR [rbp-0x39],0xf
   14132eda4:	48 0f 47 55 af       	cmova  rdx,QWORD PTR [rbp-0x51]
   14132eda9:	4c 8b 45 bf          	mov    r8,QWORD PTR [rbp-0x41]
   14132edad:	48 8b ce             	mov    rcx,rsi
   14132edb0:	e8 5b 0c d4 fe       	call   0x14006fa10
   14132edb5:	48 83 7d ff 00       	cmp    QWORD PTR [rbp-0x1],0x0
   14132edba:	74 30                	je     0x14132edec
   14132edbc:	41 b8 01 00 00 00    	mov    r8d,0x1
   14132edc2:	48 8d 15 73 99 2b 00 	lea    rdx,[rip+0x2b9973]        # 0x1415e873c
   14132edc9:	48 8b ce             	mov    rcx,rsi
   14132edcc:	e8 3f 0c d4 fe       	call   0x14006fa10
   14132edd1:	48 8d 55 ef          	lea    rdx,[rbp-0x11]
   14132edd5:	48 83 7d 07 0f       	cmp    QWORD PTR [rbp+0x7],0xf
   14132edda:	48 0f 47 55 ef       	cmova  rdx,QWORD PTR [rbp-0x11]
   14132eddf:	4c 8b 45 ff          	mov    r8,QWORD PTR [rbp-0x1]
   14132ede3:	48 8b ce             	mov    rcx,rsi
   14132ede6:	e8 25 0c d4 fe       	call   0x14006fa10
   14132edeb:	90                   	nop
   14132edec:	48 8b 55 07          	mov    rdx,QWORD PTR [rbp+0x7]
   14132edf0:	48 83 fa 0f          	cmp    rdx,0xf
   14132edf4:	76 34                	jbe    0x14132ee2a
   14132edf6:	48 ff c2             	inc    rdx
   14132edf9:	48 8b 4d ef          	mov    rcx,QWORD PTR [rbp-0x11]
   14132edfd:	48 8b c1             	mov    rax,rcx
   14132ee00:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132ee07:	72 1c                	jb     0x14132ee25
   14132ee09:	48 83 c2 27          	add    rdx,0x27
   14132ee0d:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132ee11:	48 2b c1             	sub    rax,rcx
   14132ee14:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132ee18:	48 83 f8 1f          	cmp    rax,0x1f
   14132ee1c:	76 07                	jbe    0x14132ee25
   14132ee1e:	ff 15 04 6d 2b 00    	call   QWORD PTR [rip+0x2b6d04]        # 0x1415e5b28
   14132ee24:	cc                   	int3
   14132ee25:	e8 56 a8 20 00       	call   0x141539680
   14132ee2a:	48 c7 45 ff 00 00 00 	mov    QWORD PTR [rbp-0x1],0x0
   14132ee31:	00 
   14132ee32:	48 c7 45 07 0f 00 00 	mov    QWORD PTR [rbp+0x7],0xf
   14132ee39:	00 
   14132ee3a:	c6 45 ef 00          	mov    BYTE PTR [rbp-0x11],0x0
   14132ee3e:	48 8b 55 c7          	mov    rdx,QWORD PTR [rbp-0x39]
   14132ee42:	48 83 fa 0f          	cmp    rdx,0xf
   14132ee46:	0f 86 fe 0a 00 00    	jbe    0x14132f94a
   14132ee4c:	48 ff c2             	inc    rdx
   14132ee4f:	48 8b 4d af          	mov    rcx,QWORD PTR [rbp-0x51]
   14132ee53:	48 8b c1             	mov    rax,rcx
   14132ee56:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132ee5d:	0f 82 b5 0a 00 00    	jb     0x14132f918
   14132ee63:	48 83 c2 27          	add    rdx,0x27
   14132ee67:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132ee6b:	48 2b c1             	sub    rax,rcx
   14132ee6e:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132ee72:	48 83 f8 1f          	cmp    rax,0x1f
   14132ee76:	0f 86 9c 0a 00 00    	jbe    0x14132f918
   14132ee7c:	ff 15 a6 6c 2b 00    	call   QWORD PTR [rip+0x2b6ca6]        # 0x1415e5b28
   14132ee82:	cc                   	int3
   14132ee83:	4c 8b 4c 24 48       	mov    r9,QWORD PTR [rsp+0x48]
   14132ee88:	4d 8b 41 10          	mov    r8,QWORD PTR [r9+0x10]
   14132ee8c:	4d 85 c0             	test   r8,r8
   14132ee8f:	74 23                	je     0x14132eeb4
   14132ee91:	49 3b f1             	cmp    rsi,r9
   14132ee94:	0f 84 a8 0a 00 00    	je     0x14132f942
   14132ee9a:	49 83 79 18 0f       	cmp    QWORD PTR [r9+0x18],0xf
   14132ee9f:	76 03                	jbe    0x14132eea4
   14132eea1:	4d 8b 09             	mov    r9,QWORD PTR [r9]
   14132eea4:	49 8b d1             	mov    rdx,r9
   14132eea7:	48 8b ce             	mov    rcx,rsi
   14132eeaa:	e8 21 0a d4 fe       	call   0x14006f8d0
   14132eeaf:	e9 8e 0a 00 00       	jmp    0x14132f942
   14132eeb4:	48 8b d6             	mov    rdx,rsi
   14132eeb7:	49 8b c9             	mov    rcx,r9
   14132eeba:	e8 71 51 76 ff       	call   0x140a94030
   14132eebf:	e9 7e 0a 00 00       	jmp    0x14132f942
   14132eec4:	48 8b 41 58          	mov    rax,QWORD PTR [rcx+0x58]
   14132eec8:	48 85 c0             	test   rax,rax
   14132eecb:	75 04                	jne    0x14132eed1
   14132eecd:	33 db                	xor    ebx,ebx
   14132eecf:	eb 1b                	jmp    0x14132eeec
   14132eed1:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
   14132eed4:	83 fa ff             	cmp    edx,0xffffffff
   14132eed7:	75 04                	jne    0x14132eedd
   14132eed9:	33 db                	xor    ebx,ebx
   14132eedb:	eb 0f                	jmp    0x14132eeec
   14132eedd:	48 8d 0d 04 8e 1b 01 	lea    rcx,[rip+0x11b8e04]        # 0x1424e7ce8
   14132eee4:	e8 87 36 d4 fe       	call   0x140072570
   14132eee9:	48 8b d8             	mov    rbx,rax
   14132eeec:	48 85 db             	test   rbx,rbx
   14132eeef:	0f 84 45 01 00 00    	je     0x14132f03a
   14132eef5:	44 8b 9b 88 00 00 00 	mov    r11d,DWORD PTR [rbx+0x88]
   14132eefc:	41 83 fb ff          	cmp    r11d,0xffffffff
   14132ef00:	0f 84 1f 01 00 00    	je     0x14132f025
   14132ef06:	4c 8b 15 13 ae 1c 01 	mov    r10,QWORD PTR [rip+0x11cae13]        # 0x1424f9d20
   14132ef0d:	48 8b 3d 04 ae 1c 01 	mov    rdi,QWORD PTR [rip+0x11cae04]        # 0x1424f9d18
   14132ef14:	4c 2b d7             	sub    r10,rdi
   14132ef17:	49 c1 fa 03          	sar    r10,0x3
   14132ef1b:	4d 85 d2             	test   r10,r10
   14132ef1e:	74 3c                	je     0x14132ef5c
   14132ef20:	45 33 c0             	xor    r8d,r8d
   14132ef23:	41 83 ea 01          	sub    r10d,0x1
   14132ef27:	78 33                	js     0x14132ef5c
   14132ef29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   14132ef30:	43 8d 0c 02          	lea    ecx,[r10+r8*1]
   14132ef34:	d1 f9                	sar    ecx,1
   14132ef36:	48 63 c1             	movsxd rax,ecx
   14132ef39:	48 8b 14 c7          	mov    rdx,QWORD PTR [rdi+rax*8]
   14132ef3d:	44 39 9a e0 00 00 00 	cmp    DWORD PTR [rdx+0xe0],r11d
   14132ef44:	74 18                	je     0x14132ef5e
   14132ef46:	8d 41 ff             	lea    eax,[rcx-0x1]
   14132ef49:	41 0f 4e c2          	cmovle eax,r10d
   14132ef4d:	44 8b d0             	mov    r10d,eax
   14132ef50:	8d 41 01             	lea    eax,[rcx+0x1]
   14132ef53:	44 0f 4e c0          	cmovle r8d,eax
   14132ef57:	45 3b c2             	cmp    r8d,r10d
   14132ef5a:	7e d4                	jle    0x14132ef30
   14132ef5c:	33 d2                	xor    edx,edx
   14132ef5e:	48 85 d2             	test   rdx,rdx
   14132ef61:	0f 84 be 00 00 00    	je     0x14132f025
   14132ef67:	83 ba d0 00 00 00 00 	cmp    DWORD PTR [rdx+0xd0],0x0
   14132ef6e:	0f 8e b1 00 00 00    	jle    0x14132f025
   14132ef74:	48 8b 82 c8 00 00 00 	mov    rax,QWORD PTR [rdx+0xc8]
   14132ef7b:	f6 00 04             	test   BYTE PTR [rax],0x4
   14132ef7e:	75 57                	jne    0x14132efd7
   14132ef80:	f6 00 08             	test   BYTE PTR [rax],0x8
   14132ef83:	0f 84 9c 00 00 00    	je     0x14132f025
   14132ef89:	41 83 ff 01          	cmp    r15d,0x1
   14132ef8d:	75 0f                	jne    0x14132ef9e
   14132ef8f:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132ef95:	48 8d 15 ac 9e 2b 00 	lea    rdx,[rip+0x2b9eac]        # 0x1415e8e48
   14132ef9c:	eb 12                	jmp    0x14132efb0
   14132ef9e:	45 85 ff             	test   r15d,r15d
   14132efa1:	75 15                	jne    0x14132efb8
   14132efa3:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132efa9:	48 8d 15 70 e6 2b 00 	lea    rdx,[rip+0x2be670]        # 0x1415ed620
   14132efb0:	48 8b ce             	mov    rcx,rsi
   14132efb3:	e8 58 0a d4 fe       	call   0x14006fa10
   14132efb8:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132efbe:	48 8d 15 1f 68 34 00 	lea    rdx,[rip+0x34681f]        # 0x1416757e4
   14132efc5:	48 8b ce             	mov    rcx,rsi
   14132efc8:	e8 43 0a d4 fe       	call   0x14006fa10
   14132efcd:	80 7c 24 40 00       	cmp    BYTE PTR [rsp+0x40],0x0
   14132efd2:	e9 69 09 00 00       	jmp    0x14132f940
   14132efd7:	41 83 ff 01          	cmp    r15d,0x1
   14132efdb:	75 0f                	jne    0x14132efec
   14132efdd:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132efe3:	48 8d 15 5e 9e 2b 00 	lea    rdx,[rip+0x2b9e5e]        # 0x1415e8e48
   14132efea:	eb 12                	jmp    0x14132effe
   14132efec:	45 85 ff             	test   r15d,r15d
   14132efef:	75 15                	jne    0x14132f006
   14132eff1:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132eff7:	48 8d 15 22 e6 2b 00 	lea    rdx,[rip+0x2be622]        # 0x1415ed620
   14132effe:	48 8b ce             	mov    rcx,rsi
   14132f001:	e8 0a 0a d4 fe       	call   0x14006fa10
   14132f006:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132f00c:	48 8d 15 91 2f 33 00 	lea    rdx,[rip+0x332f91]        # 0x141661fa4
   14132f013:	48 8b ce             	mov    rcx,rsi
   14132f016:	e8 f5 09 d4 fe       	call   0x14006fa10
   14132f01b:	80 7c 24 40 00       	cmp    BYTE PTR [rsp+0x40],0x0
   14132f020:	e9 1b 09 00 00       	jmp    0x14132f940
   14132f025:	0f b7 83 ac 00 00 00 	movzx  eax,WORD PTR [rbx+0xac]
   14132f02c:	66 83 f8 ff          	cmp    ax,0xffff
   14132f030:	74 08                	je     0x14132f03a
   14132f032:	44 0f b7 e0          	movzx  r12d,ax
   14132f036:	eb 02                	jmp    0x14132f03a
   14132f038:	33 db                	xor    ebx,ebx
   14132f03a:	0f 57 c0             	xorps  xmm0,xmm0
   14132f03d:	0f 11 45 cf          	movups XMMWORD PTR [rbp-0x31],xmm0
   14132f041:	48 c7 45 df 00 00 00 	mov    QWORD PTR [rbp-0x21],0x0
   14132f048:	00 
   14132f049:	48 c7 45 e7 0f 00 00 	mov    QWORD PTR [rbp-0x19],0xf
   14132f050:	00 
   14132f051:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   14132f055:	49 83 be 80 0d 00 00 	cmp    QWORD PTR [r14+0xd80],0x0
   14132f05c:	00 
   14132f05d:	75 0f                	jne    0x14132f06e
   14132f05f:	41 80 be 38 08 00 00 	cmp    BYTE PTR [r14+0x838],0x0
   14132f066:	00 
   14132f067:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   14132f06c:	74 05                	je     0x14132f073
   14132f06e:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14132f073:	4d 8b c6             	mov    r8,r14
   14132f076:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   14132f07b:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   14132f080:	c6 44 24 20 00       	mov    BYTE PTR [rsp+0x20],0x0
   14132f085:	45 0f b7 8e 2c 01 00 	movzx  r9d,WORD PTR [r14+0x12c]
   14132f08c:	00 
   14132f08d:	45 0f b7 86 a4 00 00 	movzx  r8d,WORD PTR [r14+0xa4]
   14132f094:	00 
   14132f095:	41 0f b7 d4          	movzx  edx,r12w
   14132f099:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132f09d:	e8 1e f0 ff ff       	call   0x14132e0c0
   14132f0a2:	44 0f b6 f8          	movzx  r15d,al
   14132f0a6:	48 85 db             	test   rbx,rbx
   14132f0a9:	74 11                	je     0x14132f0bc
   14132f0ab:	0f b6 f8             	movzx  edi,al
   14132f0ae:	66 83 bb ac 00 00 00 	cmp    WORD PTR [rbx+0xac],0xffff
   14132f0b5:	ff 
   14132f0b6:	0f 85 f0 03 00 00    	jne    0x14132f4ac
   14132f0bc:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   14132f0c3:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132f0ca:	48 8d 0d e7 ab 1c 01 	lea    rcx,[rip+0x11cabe7]        # 0x1424f9cb8
   14132f0d1:	e8 da 3f 82 ff       	call   0x140b530b0
   14132f0d6:	48 85 c0             	test   rax,rax
   14132f0d9:	0f 84 14 01 00 00    	je     0x14132f1f3
   14132f0df:	48 8d 4d 97          	lea    rcx,[rbp-0x69]
   14132f0e3:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   14132f0e8:	4c 8d 4d 8f          	lea    r9,[rbp-0x71]
   14132f0ec:	4c 8d 44 24 41       	lea    r8,[rsp+0x41]
   14132f0f1:	ba ff ff ff ff       	mov    edx,0xffffffff
   14132f0f6:	48 8b c8             	mov    rcx,rax
   14132f0f9:	e8 22 c5 8b ff       	call   0x140beb620
   14132f0fe:	48 8b d8             	mov    rbx,rax
   14132f101:	41 0f b6 ff          	movzx  edi,r15b
   14132f105:	48 85 c0             	test   rax,rax
   14132f108:	0f 84 e9 00 00 00    	je     0x14132f1f7
   14132f10e:	4d 85 ed             	test   r13,r13
   14132f111:	0f 84 e0 00 00 00    	je     0x14132f1f7
   14132f117:	41 0f be 4d 06       	movsx  ecx,BYTE PTR [r13+0x6]
   14132f11c:	80 7c 24 41 00       	cmp    BYTE PTR [rsp+0x41],0x0
   14132f121:	74 4a                	je     0x14132f16d
   14132f123:	85 c9                	test   ecx,ecx
   14132f125:	74 2a                	je     0x14132f151
   14132f127:	83 f9 01             	cmp    ecx,0x1
   14132f12a:	74 09                	je     0x14132f135
   14132f12c:	48 8d 90 58 01 00 00 	lea    rdx,[rax+0x158]
   14132f133:	eb 7e                	jmp    0x14132f1b3
   14132f135:	48 83 b8 e8 01 00 00 	cmp    QWORD PTR [rax+0x1e8],0x0
   14132f13c:	00 
   14132f13d:	75 09                	jne    0x14132f148
   14132f13f:	48 8d 90 58 01 00 00 	lea    rdx,[rax+0x158]
   14132f146:	eb 6b                	jmp    0x14132f1b3
   14132f148:	48 8d 90 d8 01 00 00 	lea    rdx,[rax+0x1d8]
   14132f14f:	eb 62                	jmp    0x14132f1b3
   14132f151:	48 83 b8 a8 01 00 00 	cmp    QWORD PTR [rax+0x1a8],0x0
   14132f158:	00 
   14132f159:	75 09                	jne    0x14132f164
   14132f15b:	48 8d 90 58 01 00 00 	lea    rdx,[rax+0x158]
   14132f162:	eb 4f                	jmp    0x14132f1b3
   14132f164:	48 8d 90 98 01 00 00 	lea    rdx,[rax+0x198]
   14132f16b:	eb 46                	jmp    0x14132f1b3
   14132f16d:	85 c9                	test   ecx,ecx
   14132f16f:	74 2a                	je     0x14132f19b
   14132f171:	83 f9 01             	cmp    ecx,0x1
   14132f174:	74 09                	je     0x14132f17f
   14132f176:	48 8d 90 98 00 00 00 	lea    rdx,[rax+0x98]
   14132f17d:	eb 34                	jmp    0x14132f1b3
   14132f17f:	48 83 b8 28 01 00 00 	cmp    QWORD PTR [rax+0x128],0x0
   14132f186:	00 
   14132f187:	75 09                	jne    0x14132f192
   14132f189:	48 8d 90 98 00 00 00 	lea    rdx,[rax+0x98]
   14132f190:	eb 21                	jmp    0x14132f1b3
   14132f192:	48 8d 90 18 01 00 00 	lea    rdx,[rax+0x118]
   14132f199:	eb 18                	jmp    0x14132f1b3
   14132f19b:	48 83 b8 e8 00 00 00 	cmp    QWORD PTR [rax+0xe8],0x0
   14132f1a2:	00 
   14132f1a3:	48 8d 90 98 00 00 00 	lea    rdx,[rax+0x98]
   14132f1aa:	74 07                	je     0x14132f1b3
   14132f1ac:	48 8d 90 d8 00 00 00 	lea    rdx,[rax+0xd8]
   14132f1b3:	48 8d 45 cf          	lea    rax,[rbp-0x31]
   14132f1b7:	48 3b c2             	cmp    rax,rdx
   14132f1ba:	74 17                	je     0x14132f1d3
   14132f1bc:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f1c0:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f1c5:	76 03                	jbe    0x14132f1ca
   14132f1c7:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f1ca:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132f1ce:	e8 fd 06 d4 fe       	call   0x14006f8d0
   14132f1d3:	66 83 bb c8 02 00 00 	cmp    WORD PTR [rbx+0x2c8],0x0
   14132f1da:	00 
   14132f1db:	7e 11                	jle    0x14132f1ee
   14132f1dd:	4c 8d 45 cf          	lea    r8,[rbp-0x31]
   14132f1e1:	48 8b 55 97          	mov    rdx,QWORD PTR [rbp-0x69]
   14132f1e5:	48 8b 4d 8f          	mov    rcx,QWORD PTR [rbp-0x71]
   14132f1e9:	e8 c2 ed 68 ff       	call   0x1409bdfb0
   14132f1ee:	40 32 ff             	xor    dil,dil
   14132f1f1:	eb 04                	jmp    0x14132f1f7
   14132f1f3:	41 0f b6 ff          	movzx  edi,r15b
   14132f1f7:	4d 8d be 74 12 00 00 	lea    r15,[r14+0x1274]
   14132f1fe:	4d 8b c7             	mov    r8,r15
   14132f201:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132f208:	48 8d 0d a9 aa 1c 01 	lea    rcx,[rip+0x11caaa9]        # 0x1424f9cb8
   14132f20f:	e8 9c 3e 82 ff       	call   0x140b530b0
   14132f214:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   14132f21a:	48 85 c0             	test   rax,rax
   14132f21d:	0f 84 27 01 00 00    	je     0x14132f34a
   14132f223:	ba 04 00 00 00       	mov    edx,0x4
   14132f228:	45 8b c5             	mov    r8d,r13d
   14132f22b:	48 8b c8             	mov    rcx,rax
   14132f22e:	e8 8d 81 86 ff       	call   0x140b973c0
   14132f233:	66 85 c0             	test   ax,ax
   14132f236:	0f 8e 0e 01 00 00    	jle    0x14132f34a
   14132f23c:	41 8d 44 24 99       	lea    eax,[r12-0x67]
   14132f241:	66 83 f8 01          	cmp    ax,0x1
   14132f245:	77 22                	ja     0x14132f269
   14132f247:	48 83 7d df 00       	cmp    QWORD PTR [rbp-0x21],0x0
   14132f24c:	74 1b                	je     0x14132f269
   14132f24e:	41 b8 06 00 00 00    	mov    r8d,0x6
   14132f254:	48 8d 15 a1 d7 2b 00 	lea    rdx,[rip+0x2bd7a1]        # 0x1415ec9fc
   14132f25b:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132f25f:	e8 ac 07 d4 fe       	call   0x14006fa10
   14132f264:	e9 de 00 00 00       	jmp    0x14132f347
   14132f269:	48 8b 7d e7          	mov    rdi,QWORD PTR [rbp-0x19]
   14132f26d:	48 83 ff 05          	cmp    rdi,0x5
   14132f271:	72 33                	jb     0x14132f2a6
   14132f273:	48 8d 5d cf          	lea    rbx,[rbp-0x31]
   14132f277:	48 83 ff 0f          	cmp    rdi,0xf
   14132f27b:	48 0f 47 5d cf       	cmova  rbx,QWORD PTR [rbp-0x31]
   14132f280:	48 c7 45 df 05 00 00 	mov    QWORD PTR [rbp-0x21],0x5
   14132f287:	00 
   14132f288:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132f28e:	48 8d 15 93 d7 2b 00 	lea    rdx,[rip+0x2bd793]        # 0x1415eca28
   14132f295:	48 8b cb             	mov    rcx,rbx
   14132f298:	e8 7d bb 20 00       	call   0x14153ae1a
   14132f29d:	c6 43 05 00          	mov    BYTE PTR [rbx+0x5],0x0
   14132f2a1:	e9 a1 00 00 00       	jmp    0x14132f347
   14132f2a6:	48 8b cf             	mov    rcx,rdi
   14132f2a9:	48 d1 e9             	shr    rcx,1
   14132f2ac:	48 ba ff ff ff ff ff 	movabs rdx,0x7fffffffffffffff
   14132f2b3:	ff ff 7f 
   14132f2b6:	48 8b c2             	mov    rax,rdx
   14132f2b9:	48 2b c1             	sub    rax,rcx
   14132f2bc:	48 3b f8             	cmp    rdi,rax
   14132f2bf:	76 05                	jbe    0x14132f2c6
   14132f2c1:	48 8b da             	mov    rbx,rdx
   14132f2c4:	eb 10                	jmp    0x14132f2d6
   14132f2c6:	48 8d 04 39          	lea    rax,[rcx+rdi*1]
   14132f2ca:	bb 0f 00 00 00       	mov    ebx,0xf
   14132f2cf:	48 3b c3             	cmp    rax,rbx
   14132f2d2:	48 0f 47 d8          	cmova  rbx,rax
   14132f2d6:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   14132f2da:	e8 f1 14 d4 fe       	call   0x1400707d0
   14132f2df:	4c 8b f8             	mov    r15,rax
   14132f2e2:	48 c7 45 df 05 00 00 	mov    QWORD PTR [rbp-0x21],0x5
   14132f2e9:	00 
   14132f2ea:	48 89 5d e7          	mov    QWORD PTR [rbp-0x19],rbx
   14132f2ee:	8b 0d 34 d7 2b 00    	mov    ecx,DWORD PTR [rip+0x2bd734]        # 0x1415eca28
   14132f2f4:	89 08                	mov    DWORD PTR [rax],ecx
   14132f2f6:	0f b6 0d 2f d7 2b 00 	movzx  ecx,BYTE PTR [rip+0x2bd72f]        # 0x1415eca2c
   14132f2fd:	88 48 04             	mov    BYTE PTR [rax+0x4],cl
   14132f300:	c6 40 05 00          	mov    BYTE PTR [rax+0x5],0x0
   14132f304:	48 83 ff 0f          	cmp    rdi,0xf
   14132f308:	76 32                	jbe    0x14132f33c
   14132f30a:	48 8d 57 01          	lea    rdx,[rdi+0x1]
   14132f30e:	48 8b 4d cf          	mov    rcx,QWORD PTR [rbp-0x31]
   14132f312:	48 8b c1             	mov    rax,rcx
   14132f315:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132f31c:	72 19                	jb     0x14132f337
   14132f31e:	48 83 c2 27          	add    rdx,0x27
   14132f322:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132f326:	48 2b c1             	sub    rax,rcx
   14132f329:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132f32d:	48 83 f8 1f          	cmp    rax,0x1f
   14132f331:	0f 87 62 01 00 00    	ja     0x14132f499
   14132f337:	e8 44 a3 20 00       	call   0x141539680
   14132f33c:	4c 89 7d cf          	mov    QWORD PTR [rbp-0x31],r15
   14132f340:	4d 8d be 74 12 00 00 	lea    r15,[r14+0x1274]
   14132f347:	40 32 ff             	xor    dil,dil
   14132f34a:	4d 8b c7             	mov    r8,r15
   14132f34d:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132f354:	48 8d 0d 5d a9 1c 01 	lea    rcx,[rip+0x11ca95d]        # 0x1424f9cb8
   14132f35b:	e8 50 3d 82 ff       	call   0x140b530b0
   14132f360:	48 85 c0             	test   rax,rax
   14132f363:	74 15                	je     0x14132f37a
   14132f365:	ba 06 00 00 00       	mov    edx,0x6
   14132f36a:	45 8b c5             	mov    r8d,r13d
   14132f36d:	48 8b c8             	mov    rcx,rax
   14132f370:	e8 4b 80 86 ff       	call   0x140b973c0
   14132f375:	66 85 c0             	test   ax,ax
   14132f378:	7f 38                	jg     0x14132f3b2
   14132f37a:	4d 8b c7             	mov    r8,r15
   14132f37d:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132f384:	48 8d 0d 2d a9 1c 01 	lea    rcx,[rip+0x11ca92d]        # 0x1424f9cb8
   14132f38b:	e8 20 3d 82 ff       	call   0x140b530b0
   14132f390:	48 85 c0             	test   rax,rax
   14132f393:	0f 84 13 01 00 00    	je     0x14132f4ac
   14132f399:	ba 07 00 00 00       	mov    edx,0x7
   14132f39e:	45 8b c5             	mov    r8d,r13d
   14132f3a1:	48 8b c8             	mov    rcx,rax
   14132f3a4:	e8 e7 99 86 ff       	call   0x140b98d90
   14132f3a9:	66 85 c0             	test   ax,ax
   14132f3ac:	0f 8e fa 00 00 00    	jle    0x14132f4ac
   14132f3b2:	66 41 83 ec 67       	sub    r12w,0x67
   14132f3b7:	66 41 83 fc 01       	cmp    r12w,0x1
   14132f3bc:	77 22                	ja     0x14132f3e0
   14132f3be:	48 83 7d df 00       	cmp    QWORD PTR [rbp-0x21],0x0
   14132f3c3:	74 1b                	je     0x14132f3e0
   14132f3c5:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132f3cb:	48 8d 15 fe 37 45 00 	lea    rdx,[rip+0x4537fe]        # 0x141782bd0
   14132f3d2:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132f3d6:	e8 35 06 d4 fe       	call   0x14006fa10
   14132f3db:	e9 c9 00 00 00       	jmp    0x14132f4a9
   14132f3e0:	48 8b 5d e7          	mov    rbx,QWORD PTR [rbp-0x19]
   14132f3e4:	48 83 fb 08          	cmp    rbx,0x8
   14132f3e8:	72 2b                	jb     0x14132f415
   14132f3ea:	48 8d 45 cf          	lea    rax,[rbp-0x31]
   14132f3ee:	48 83 fb 0f          	cmp    rbx,0xf
   14132f3f2:	48 0f 47 45 cf       	cmova  rax,QWORD PTR [rbp-0x31]
   14132f3f7:	48 c7 45 df 08 00 00 	mov    QWORD PTR [rbp-0x21],0x8
   14132f3fe:	00 
   14132f3ff:	48 b9 70 72 69 73 6f 	movabs rcx,0x72656e6f73697270
   14132f406:	6e 65 72 
   14132f409:	48 89 08             	mov    QWORD PTR [rax],rcx
   14132f40c:	c6 40 08 00          	mov    BYTE PTR [rax+0x8],0x0
   14132f410:	e9 94 00 00 00       	jmp    0x14132f4a9
   14132f415:	48 8b cb             	mov    rcx,rbx
   14132f418:	48 d1 e9             	shr    rcx,1
   14132f41b:	49 bf ff ff ff ff ff 	movabs r15,0x7fffffffffffffff
   14132f422:	ff ff 7f 
   14132f425:	49 8b c7             	mov    rax,r15
   14132f428:	48 2b c1             	sub    rax,rcx
   14132f42b:	48 3b d8             	cmp    rbx,rax
   14132f42e:	77 11                	ja     0x14132f441
   14132f430:	48 8d 04 19          	lea    rax,[rcx+rbx*1]
   14132f434:	41 bf 0f 00 00 00    	mov    r15d,0xf
   14132f43a:	49 3b c7             	cmp    rax,r15
   14132f43d:	4c 0f 47 f8          	cmova  r15,rax
   14132f441:	49 8d 4f 01          	lea    rcx,[r15+0x1]
   14132f445:	e8 86 13 d4 fe       	call   0x1400707d0
   14132f44a:	48 8b f8             	mov    rdi,rax
   14132f44d:	48 c7 45 df 08 00 00 	mov    QWORD PTR [rbp-0x21],0x8
   14132f454:	00 
   14132f455:	4c 89 7d e7          	mov    QWORD PTR [rbp-0x19],r15
   14132f459:	48 b8 70 72 69 73 6f 	movabs rax,0x72656e6f73697270
   14132f460:	6e 65 72 
   14132f463:	48 89 07             	mov    QWORD PTR [rdi],rax
   14132f466:	c6 47 08 00          	mov    BYTE PTR [rdi+0x8],0x0
   14132f46a:	48 83 fb 0f          	cmp    rbx,0xf
   14132f46e:	76 35                	jbe    0x14132f4a5
   14132f470:	48 8d 53 01          	lea    rdx,[rbx+0x1]
   14132f474:	48 8b 4d cf          	mov    rcx,QWORD PTR [rbp-0x31]
   14132f478:	48 8b c1             	mov    rax,rcx
   14132f47b:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132f482:	72 1c                	jb     0x14132f4a0
   14132f484:	48 83 c2 27          	add    rdx,0x27
   14132f488:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132f48c:	48 2b c1             	sub    rax,rcx
   14132f48f:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132f493:	48 83 f8 1f          	cmp    rax,0x1f
   14132f497:	76 07                	jbe    0x14132f4a0
   14132f499:	ff 15 89 66 2b 00    	call   QWORD PTR [rip+0x2b6689]        # 0x1415e5b28
   14132f49f:	cc                   	int3
   14132f4a0:	e8 db a1 20 00       	call   0x141539680
   14132f4a5:	48 89 7d cf          	mov    QWORD PTR [rbp-0x31],rdi
   14132f4a9:	40 32 ff             	xor    dil,dil
   14132f4ac:	49 83 be 90 00 00 00 	cmp    QWORD PTR [r14+0x90],0x0
   14132f4b3:	00 
   14132f4b4:	74 30                	je     0x14132f4e6
   14132f4b6:	80 7d 7f 00          	cmp    BYTE PTR [rbp+0x7f],0x0
   14132f4ba:	74 2a                	je     0x14132f4e6
   14132f4bc:	49 8d 96 80 00 00 00 	lea    rdx,[r14+0x80]
   14132f4c3:	48 8d 45 cf          	lea    rax,[rbp-0x31]
   14132f4c7:	48 3b c2             	cmp    rax,rdx
   14132f4ca:	74 17                	je     0x14132f4e3
   14132f4cc:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f4d0:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f4d5:	76 03                	jbe    0x14132f4da
   14132f4d7:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f4da:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132f4de:	e8 ed 03 d4 fe       	call   0x14006f8d0
   14132f4e3:	40 32 ff             	xor    dil,dil
   14132f4e6:	48 c7 46 10 00 00 00 	mov    QWORD PTR [rsi+0x10],0x0
   14132f4ed:	00 
   14132f4ee:	48 8b c6             	mov    rax,rsi
   14132f4f1:	48 83 7e 18 0f       	cmp    QWORD PTR [rsi+0x18],0xf
   14132f4f6:	76 03                	jbe    0x14132f4fb
   14132f4f8:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   14132f4fb:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14132f4fe:	41 0f b7 96 2c 01 00 	movzx  edx,WORD PTR [r14+0x12c]
   14132f505:	00 
   14132f506:	41 0f b7 8e a4 00 00 	movzx  ecx,WORD PTR [r14+0xa4]
   14132f50d:	00 
   14132f50e:	e8 ed 6f 04 00       	call   0x141376500
   14132f513:	48 8d 1d 2e 99 2b 00 	lea    rbx,[rip+0x2b992e]        # 0x1415e8e48
   14132f51a:	84 c0                	test   al,al
   14132f51c:	0f 84 c7 00 00 00    	je     0x14132f5e9
   14132f522:	41 83 be bc 03 00 00 	cmp    DWORD PTR [r14+0x3bc],0xffffffff
   14132f529:	ff 
   14132f52a:	0f 85 b9 00 00 00    	jne    0x14132f5e9
   14132f530:	41 f7 86 10 01 00 00 	test   DWORD PTR [r14+0x110],0x4000000
   14132f537:	00 00 00 04 
   14132f53b:	0f 84 a8 00 00 00    	je     0x14132f5e9
   14132f541:	44 8b 6c 24 44       	mov    r13d,DWORD PTR [rsp+0x44]
   14132f546:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132f54b:	75 2b                	jne    0x14132f578
   14132f54d:	41 83 fd 01          	cmp    r13d,0x1
   14132f551:	75 0b                	jne    0x14132f55e
   14132f553:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132f559:	48 8b d3             	mov    rdx,rbx
   14132f55c:	eb 12                	jmp    0x14132f570
   14132f55e:	45 85 ed             	test   r13d,r13d
   14132f561:	75 15                	jne    0x14132f578
   14132f563:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132f569:	48 8d 15 b0 e0 2b 00 	lea    rdx,[rip+0x2be0b0]        # 0x1415ed620
   14132f570:	48 8b ce             	mov    rcx,rsi
   14132f573:	e8 98 04 d4 fe       	call   0x14006fa10
   14132f578:	41 8b 8e 40 01 00 00 	mov    ecx,DWORD PTR [r14+0x140]
   14132f57f:	48 8b 05 7a 22 0a 01 	mov    rax,QWORD PTR [rip+0x10a227a]        # 0x1423d1800
   14132f586:	48 2b 05 6b 22 0a 01 	sub    rax,QWORD PTR [rip+0x10a226b]        # 0x1423d17f8
   14132f58d:	48 a9 f8 ff ff ff    	test   rax,0xfffffffffffffff8
   14132f593:	74 34                	je     0x14132f5c9
   14132f595:	83 f9 ff             	cmp    ecx,0xffffffff
   14132f598:	74 2f                	je     0x14132f5c9
   14132f59a:	48 8d 15 57 22 0a 01 	lea    rdx,[rip+0x10a2257]        # 0x1423d17f8
   14132f5a1:	e8 fa aa d8 fe       	call   0x1400ba0a0
   14132f5a6:	48 85 c0             	test   rax,rax
   14132f5a9:	74 1e                	je     0x14132f5c9
   14132f5ab:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   14132f5af:	83 b8 a8 03 00 00 07 	cmp    DWORD PTR [rax+0x3a8],0x7
   14132f5b6:	7e 11                	jle    0x14132f5c9
   14132f5b8:	48 8b 80 a0 03 00 00 	mov    rax,QWORD PTR [rax+0x3a0]
   14132f5bf:	f6 40 07 10          	test   BYTE PTR [rax+0x7],0x10
   14132f5c3:	74 04                	je     0x14132f5c9
   14132f5c5:	b0 01                	mov    al,0x1
   14132f5c7:	eb 02                	jmp    0x14132f5cb
   14132f5c9:	32 c0                	xor    al,al
   14132f5cb:	44 0f b6 c0          	movzx  r8d,al
   14132f5cf:	49 83 c0 06          	add    r8,0x6
   14132f5d3:	48 8d 0d 62 35 45 00 	lea    rcx,[rip+0x453562]        # 0x141782b3c
   14132f5da:	48 8d 15 67 35 45 00 	lea    rdx,[rip+0x453567]        # 0x141782b48
   14132f5e1:	84 c0                	test   al,al
   14132f5e3:	48 0f 44 d1          	cmove  rdx,rcx
   14132f5e7:	eb 51                	jmp    0x14132f63a
   14132f5e9:	44 8b 6c 24 44       	mov    r13d,DWORD PTR [rsp+0x44]
   14132f5ee:	41 f7 86 1c 01 00 00 	test   DWORD PTR [r14+0x11c],0x1000
   14132f5f5:	00 10 00 00 
   14132f5f9:	74 47                	je     0x14132f642
   14132f5fb:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132f600:	75 2b                	jne    0x14132f62d
   14132f602:	41 83 fd 01          	cmp    r13d,0x1
   14132f606:	75 0b                	jne    0x14132f613
   14132f608:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132f60e:	48 8b d3             	mov    rdx,rbx
   14132f611:	eb 12                	jmp    0x14132f625
   14132f613:	45 85 ed             	test   r13d,r13d
   14132f616:	75 15                	jne    0x14132f62d
   14132f618:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132f61e:	48 8d 15 fb df 2b 00 	lea    rdx,[rip+0x2bdffb]        # 0x1415ed620
   14132f625:	48 8b ce             	mov    rcx,rsi
   14132f628:	e8 e3 03 d4 fe       	call   0x14006fa10
   14132f62d:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132f633:	48 8d 15 1e 35 45 00 	lea    rdx,[rip+0x45351e]        # 0x141782b58
   14132f63a:	48 8b ce             	mov    rcx,rsi
   14132f63d:	e8 ce 03 d4 fe       	call   0x14006fa10
   14132f642:	41 f7 86 18 01 00 00 	test   DWORD PTR [r14+0x118],0x1000
   14132f649:	00 10 00 00 
   14132f64d:	0f 84 90 00 00 00    	je     0x14132f6e3
   14132f653:	40 84 ff             	test   dil,dil
   14132f656:	74 44                	je     0x14132f69c
   14132f658:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132f65d:	75 6f                	jne    0x14132f6ce
   14132f65f:	41 83 fd 01          	cmp    r13d,0x1
   14132f663:	75 0b                	jne    0x14132f670
   14132f665:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132f66b:	48 8b d3             	mov    rdx,rbx
   14132f66e:	eb 12                	jmp    0x14132f682
   14132f670:	45 85 ed             	test   r13d,r13d
   14132f673:	75 15                	jne    0x14132f68a
   14132f675:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132f67b:	48 8d 15 9e df 2b 00 	lea    rdx,[rip+0x2bdf9e]        # 0x1415ed620
   14132f682:	48 8b ce             	mov    rcx,rsi
   14132f685:	e8 86 03 d4 fe       	call   0x14006fa10
   14132f68a:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132f690:	48 8d 15 c5 67 37 00 	lea    rdx,[rip+0x3767c5]        # 0x1416a5e5c
   14132f697:	e9 2b 02 00 00       	jmp    0x14132f8c7
   14132f69c:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132f6a1:	75 2b                	jne    0x14132f6ce
   14132f6a3:	41 83 fd 01          	cmp    r13d,0x1
   14132f6a7:	75 0b                	jne    0x14132f6b4
   14132f6a9:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132f6af:	48 8b d3             	mov    rdx,rbx
   14132f6b2:	eb 12                	jmp    0x14132f6c6
   14132f6b4:	45 85 ed             	test   r13d,r13d
   14132f6b7:	75 15                	jne    0x14132f6ce
   14132f6b9:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132f6bf:	48 8d 15 5a df 2b 00 	lea    rdx,[rip+0x2bdf5a]        # 0x1415ed620
   14132f6c6:	48 8b ce             	mov    rcx,rsi
   14132f6c9:	e8 42 03 d4 fe       	call   0x14006fa10
   14132f6ce:	41 b8 08 00 00 00    	mov    r8d,0x8
   14132f6d4:	48 8d 15 dd e4 2c 00 	lea    rdx,[rip+0x2ce4dd]        # 0x1415fdbb8
   14132f6db:	48 8b ce             	mov    rcx,rsi
   14132f6de:	e8 2d 03 d4 fe       	call   0x14006fa10
   14132f6e3:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132f6e8:	75 2b                	jne    0x14132f715
   14132f6ea:	41 83 fd 01          	cmp    r13d,0x1
   14132f6ee:	75 0b                	jne    0x14132f6fb
   14132f6f0:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132f6f6:	48 8b d3             	mov    rdx,rbx
   14132f6f9:	eb 12                	jmp    0x14132f70d
   14132f6fb:	45 85 ed             	test   r13d,r13d
   14132f6fe:	75 15                	jne    0x14132f715
   14132f700:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132f706:	48 8d 15 13 df 2b 00 	lea    rdx,[rip+0x2bdf13]        # 0x1415ed620
   14132f70d:	48 8b ce             	mov    rcx,rsi
   14132f710:	e8 fb 02 d4 fe       	call   0x14006fa10
   14132f715:	83 3d 7c cb 56 00 01 	cmp    DWORD PTR [rip+0x56cb7c],0x1        # 0x14189c298
   14132f71c:	75 76                	jne    0x14132f794
   14132f71e:	49 83 be f8 13 00 00 	cmp    QWORD PTR [r14+0x13f8],0x0
   14132f725:	00 
   14132f726:	75 08                	jne    0x14132f730
   14132f728:	49 8b ce             	mov    rcx,r14
   14132f72b:	e8 00 86 3e ff       	call   0x140717d30
   14132f730:	49 8d be e8 13 00 00 	lea    rdi,[r14+0x13e8]
   14132f737:	4c 8b 7f 10          	mov    r15,QWORD PTR [rdi+0x10]
   14132f73b:	48 8b cf             	mov    rcx,rdi
   14132f73e:	4c 8b 67 18          	mov    r12,QWORD PTR [rdi+0x18]
   14132f742:	49 83 fc 0f          	cmp    r12,0xf
   14132f746:	76 03                	jbe    0x14132f74b
   14132f748:	48 8b 0f             	mov    rcx,QWORD PTR [rdi]
   14132f74b:	49 83 ff 07          	cmp    r15,0x7
   14132f74f:	75 13                	jne    0x14132f764
   14132f751:	4d 8b c7             	mov    r8,r15
   14132f754:	48 8d 15 ed 6b 35 00 	lea    rdx,[rip+0x356bed]        # 0x141686348
   14132f75b:	e8 b4 b6 20 00       	call   0x14153ae14
   14132f760:	85 c0                	test   eax,eax
   14132f762:	74 30                	je     0x14132f794
   14132f764:	49 83 fc 0f          	cmp    r12,0xf
   14132f768:	76 03                	jbe    0x14132f76d
   14132f76a:	48 8b 3f             	mov    rdi,QWORD PTR [rdi]
   14132f76d:	4d 8b c7             	mov    r8,r15
   14132f770:	48 8b d7             	mov    rdx,rdi
   14132f773:	48 8b ce             	mov    rcx,rsi
   14132f776:	e8 95 02 d4 fe       	call   0x14006fa10
   14132f77b:	bf 01 00 00 00       	mov    edi,0x1
   14132f780:	44 8b c7             	mov    r8d,edi
   14132f783:	48 8d 15 b2 8f 2b 00 	lea    rdx,[rip+0x2b8fb2]        # 0x1415e873c
   14132f78a:	48 8b ce             	mov    rcx,rsi
   14132f78d:	e8 7e 02 d4 fe       	call   0x14006fa10
   14132f792:	eb 05                	jmp    0x14132f799
   14132f794:	bf 01 00 00 00       	mov    edi,0x1
   14132f799:	41 80 be 38 08 00 00 	cmp    BYTE PTR [r14+0x838],0x0
   14132f7a0:	00 
   14132f7a1:	74 43                	je     0x14132f7e6
   14132f7a3:	49 83 be 50 08 00 00 	cmp    QWORD PTR [r14+0x850],0x0
   14132f7aa:	00 
   14132f7ab:	75 39                	jne    0x14132f7e6
   14132f7ad:	49 83 be 90 08 00 00 	cmp    QWORD PTR [r14+0x890],0x0
   14132f7b4:	00 
   14132f7b5:	74 2f                	je     0x14132f7e6
   14132f7b7:	49 8d 96 80 08 00 00 	lea    rdx,[r14+0x880]
   14132f7be:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f7c2:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f7c7:	76 03                	jbe    0x14132f7cc
   14132f7c9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f7cc:	48 8b ce             	mov    rcx,rsi
   14132f7cf:	e8 3c 02 d4 fe       	call   0x14006fa10
   14132f7d4:	4c 8b c7             	mov    r8,rdi
   14132f7d7:	48 8d 15 5e 8f 2b 00 	lea    rdx,[rip+0x2b8f5e]        # 0x1415e873c
   14132f7de:	48 8b ce             	mov    rcx,rsi
   14132f7e1:	e8 2a 02 d4 fe       	call   0x14006fa10
   14132f7e6:	48 8d 55 cf          	lea    rdx,[rbp-0x31]
   14132f7ea:	48 83 7d e7 0f       	cmp    QWORD PTR [rbp-0x19],0xf
   14132f7ef:	48 0f 47 55 cf       	cmova  rdx,QWORD PTR [rbp-0x31]
   14132f7f4:	4c 8b 45 df          	mov    r8,QWORD PTR [rbp-0x21]
   14132f7f8:	48 8b ce             	mov    rcx,rsi
   14132f7fb:	e8 10 02 d4 fe       	call   0x14006fa10
   14132f800:	41 80 be 38 08 00 00 	cmp    BYTE PTR [r14+0x838],0x0
   14132f807:	00 
   14132f808:	74 65                	je     0x14132f86f
   14132f80a:	49 83 be 50 08 00 00 	cmp    QWORD PTR [r14+0x850],0x0
   14132f811:	00 
   14132f812:	74 5b                	je     0x14132f86f
   14132f814:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132f819:	74 0c                	je     0x14132f827
   14132f81b:	4c 8b c7             	mov    r8,rdi
   14132f81e:	48 8d 15 17 8f 2b 00 	lea    rdx,[rip+0x2b8f17]        # 0x1415e873c
   14132f825:	eb 23                	jmp    0x14132f84a
   14132f827:	41 83 fd 01          	cmp    r13d,0x1
   14132f82b:	75 0b                	jne    0x14132f838
   14132f82d:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132f833:	48 8b d3             	mov    rdx,rbx
   14132f836:	eb 12                	jmp    0x14132f84a
   14132f838:	45 85 ed             	test   r13d,r13d
   14132f83b:	75 15                	jne    0x14132f852
   14132f83d:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132f843:	48 8d 15 d6 dd 2b 00 	lea    rdx,[rip+0x2bddd6]        # 0x1415ed620
   14132f84a:	48 8b ce             	mov    rcx,rsi
   14132f84d:	e8 be 01 d4 fe       	call   0x14006fa10
   14132f852:	49 8d 96 40 08 00 00 	lea    rdx,[r14+0x840]
   14132f859:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f85d:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f862:	76 03                	jbe    0x14132f867
   14132f864:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f867:	48 8b ce             	mov    rcx,rsi
   14132f86a:	e8 a1 01 d4 fe       	call   0x14006fa10
   14132f86f:	49 83 be 80 0d 00 00 	cmp    QWORD PTR [r14+0xd80],0x0
   14132f876:	00 
   14132f877:	74 56                	je     0x14132f8cf
   14132f879:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132f87e:	75 3a                	jne    0x14132f8ba
   14132f880:	41 83 fd 01          	cmp    r13d,0x1
   14132f884:	75 0b                	jne    0x14132f891
   14132f886:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132f88c:	48 8b d3             	mov    rdx,rbx
   14132f88f:	eb 12                	jmp    0x14132f8a3
   14132f891:	45 85 ed             	test   r13d,r13d
   14132f894:	75 15                	jne    0x14132f8ab
   14132f896:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132f89c:	48 8d 15 7d dd 2b 00 	lea    rdx,[rip+0x2bdd7d]        # 0x1415ed620
   14132f8a3:	48 8b ce             	mov    rcx,rsi
   14132f8a6:	e8 65 01 d4 fe       	call   0x14006fa10
   14132f8ab:	41 b8 06 00 00 00    	mov    r8d,0x6
   14132f8b1:	48 8d 15 84 f7 39 00 	lea    rdx,[rip+0x39f784]        # 0x1416cf03c
   14132f8b8:	eb 0d                	jmp    0x14132f8c7
   14132f8ba:	41 b8 07 00 00 00    	mov    r8d,0x7
   14132f8c0:	48 8d 15 19 f0 40 00 	lea    rdx,[rip+0x40f019]        # 0x14173e8e0
   14132f8c7:	48 8b ce             	mov    rcx,rsi
   14132f8ca:	e8 41 01 d4 fe       	call   0x14006fa10
   14132f8cf:	80 7c 24 40 00       	cmp    BYTE PTR [rsp+0x40],0x0
   14132f8d4:	74 09                	je     0x14132f8df
   14132f8d6:	48 8b ce             	mov    rcx,rsi
   14132f8d9:	e8 72 dd 1f ff       	call   0x14052d650
   14132f8de:	90                   	nop
   14132f8df:	48 8b 55 e7          	mov    rdx,QWORD PTR [rbp-0x19]
   14132f8e3:	48 83 fa 0f          	cmp    rdx,0xf
   14132f8e7:	76 61                	jbe    0x14132f94a
   14132f8e9:	48 ff c2             	inc    rdx
   14132f8ec:	48 8b 4d cf          	mov    rcx,QWORD PTR [rbp-0x31]
   14132f8f0:	48 8b c1             	mov    rax,rcx
   14132f8f3:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132f8fa:	72 1c                	jb     0x14132f918
   14132f8fc:	48 83 c2 27          	add    rdx,0x27
   14132f900:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132f904:	48 2b c1             	sub    rax,rcx
   14132f907:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132f90b:	48 83 f8 1f          	cmp    rax,0x1f
   14132f90f:	76 07                	jbe    0x14132f918
   14132f911:	ff 15 11 62 2b 00    	call   QWORD PTR [rip+0x2b6211]        # 0x1415e5b28
   14132f917:	cc                   	int3
   14132f918:	e8 63 9d 20 00       	call   0x141539680
   14132f91d:	eb 2b                	jmp    0x14132f94a
   14132f91f:	49 8d 56 08          	lea    rdx,[r14+0x8]
   14132f923:	48 3b f2             	cmp    rsi,rdx
   14132f926:	74 16                	je     0x14132f93e
   14132f928:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f92d:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f931:	76 03                	jbe    0x14132f936
   14132f933:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f936:	48 8b ce             	mov    rcx,rsi
   14132f939:	e8 92 ff d3 fe       	call   0x14006f8d0
   14132f93e:	84 db                	test   bl,bl
   14132f940:	74 08                	je     0x14132f94a
   14132f942:	48 8b ce             	mov    rcx,rsi
   14132f945:	e8 06 dd 1f ff       	call   0x14052d650
   14132f94a:	48 8b 4d 0f          	mov    rcx,QWORD PTR [rbp+0xf]
   14132f94e:	48 33 cc             	xor    rcx,rsp
   14132f951:	e8 0a 9d 20 00       	call   0x141539660
   14132f956:	48 8b 9c 24 40 01 00 	mov    rbx,QWORD PTR [rsp+0x140]
   14132f95d:	00 
   14132f95e:	48 81 c4 f0 00 00 00 	add    rsp,0xf0
   14132f965:	41 5f                	pop    r15
   14132f967:	41 5e                	pop    r14
   14132f969:	41 5d                	pop    r13
   14132f96b:	41 5c                	pop    r12
   14132f96d:	5f                   	pop    rdi
   14132f96e:	5e                   	pop    rsi
   14132f96f:	5d                   	pop    rbp
   14132f970:	c3                   	ret
