
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140c62490 <.text+0xc61490>:
   140c62490:	44 89 4c 24 20       	mov    DWORD PTR [rsp+0x20],r9d
   140c62495:	44 88 44 24 18       	mov    BYTE PTR [rsp+0x18],r8b
   140c6249a:	55                   	push   rbp
   140c6249b:	53                   	push   rbx
   140c6249c:	56                   	push   rsi
   140c6249d:	57                   	push   rdi
   140c6249e:	41 55                	push   r13
   140c624a0:	41 57                	push   r15
   140c624a2:	48 8b ec             	mov    rbp,rsp
   140c624a5:	48 83 ec 38          	sub    rsp,0x38
   140c624a9:	48 c7 42 10 00 00 00 	mov    QWORD PTR [rdx+0x10],0x0
   140c624b0:	00 
   140c624b1:	41 8b f1             	mov    esi,r9d
   140c624b4:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   140c624b9:	4c 8b fa             	mov    r15,rdx
   140c624bc:	4c 8b e9             	mov    r13,rcx
   140c624bf:	48 8b c2             	mov    rax,rdx
   140c624c2:	76 03                	jbe    0x140c624c7
   140c624c4:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140c624c7:	c6 00 00             	mov    BYTE PTR [rax],0x0
   140c624ca:	48 8b 59 38          	mov    rbx,QWORD PTR [rcx+0x38]
   140c624ce:	48 8b 79 40          	mov    rdi,QWORD PTR [rcx+0x40]
   140c624d2:	48 3b df             	cmp    rbx,rdi
   140c624d5:	73 50                	jae    0x140c62527
   140c624d7:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c624da:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c624dd:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140c624e0:	83 f8 01             	cmp    eax,0x1
   140c624e3:	74 06                	je     0x140c624eb
   140c624e5:	48 83 c3 08          	add    rbx,0x8
   140c624e9:	eb e7                	jmp    0x140c624d2
   140c624eb:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c624ee:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c624f1:	ff 50 40             	call   QWORD PTR [rax+0x40]
   140c624f4:	48 85 c0             	test   rax,rax
   140c624f7:	74 2e                	je     0x140c62527
   140c624f9:	80 78 7a 00          	cmp    BYTE PTR [rax+0x7a],0x0
   140c624fd:	0f b6 5d 48          	movzx  ebx,BYTE PTR [rbp+0x48]
   140c62501:	0f 84 4f 02 00 00    	je     0x140c62756
   140c62507:	84 db                	test   bl,bl
   140c62509:	0f 85 47 02 00 00    	jne    0x140c62756
   140c6250f:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140c62513:	49 8b d7             	mov    rdx,r15
   140c62516:	48 83 c4 38          	add    rsp,0x38
   140c6251a:	41 5f                	pop    r15
   140c6251c:	41 5d                	pop    r13
   140c6251e:	5f                   	pop    rdi
   140c6251f:	5e                   	pop    rsi
   140c62520:	5b                   	pop    rbx
   140c62521:	5d                   	pop    rbp
   140c62522:	e9 89 eb e2 ff       	jmp    0x140a910b0
   140c62527:	0f b6 5d 48          	movzx  ebx,BYTE PTR [rbp+0x48]
   140c6252b:	84 db                	test   bl,bl
   140c6252d:	0f 85 23 02 00 00    	jne    0x140c62756
   140c62533:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62537:	49 8b cd             	mov    rcx,r13
   140c6253a:	ff 10                	call   QWORD PTR [rax]
   140c6253c:	66 83 f8 59          	cmp    ax,0x59
   140c62540:	75 16                	jne    0x140c62558
   140c62542:	49 83 bd f8 00 00 00 	cmp    QWORD PTR [r13+0xf8],0x0
   140c62549:	00 
   140c6254a:	74 0c                	je     0x140c62558
   140c6254c:	49 8d 95 e8 00 00 00 	lea    rdx,[r13+0xe8]
   140c62553:	e9 bb 01 00 00       	jmp    0x140c62713
   140c62558:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c6255c:	49 8b cd             	mov    rcx,r13
   140c6255f:	ff 10                	call   QWORD PTR [rax]
   140c62561:	66 83 f8 56          	cmp    ax,0x56
   140c62565:	0f 85 eb 01 00 00    	jne    0x140c62756
   140c6256b:	49 8b 9d d0 00 00 00 	mov    rbx,QWORD PTR [r13+0xd0]
   140c62572:	49 8b bd d8 00 00 00 	mov    rdi,QWORD PTR [r13+0xd8]
   140c62579:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140c62580:	48 3b df             	cmp    rbx,rdi
   140c62583:	0f 83 c6 01 00 00    	jae    0x140c6274f
   140c62589:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c6258c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c6258f:	ff 50 28             	call   QWORD PTR [rax+0x28]
   140c62592:	83 f8 0c             	cmp    eax,0xc
   140c62595:	0f 85 a8 00 00 00    	jne    0x140c62643
   140c6259b:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140c6259e:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
   140c625a2:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
   140c625a6:	48 2b ce             	sub    rcx,rsi
   140c625a9:	48 c1 f9 02          	sar    rcx,0x2
   140c625ad:	48 85 c9             	test   rcx,rcx
   140c625b0:	0f 84 8d 00 00 00    	je     0x140c62643
   140c625b6:	4c 8b 15 f3 f5 87 01 	mov    r10,QWORD PTR [rip+0x187f5f3]        # 0x1424e1bb0
   140c625bd:	4c 8b 1d e4 f5 87 01 	mov    r11,QWORD PTR [rip+0x187f5e4]        # 0x1424e1ba8
   140c625c4:	8b 36                	mov    esi,DWORD PTR [rsi]
   140c625c6:	4d 2b d3             	sub    r10,r11
   140c625c9:	49 c1 fa 03          	sar    r10,0x3
   140c625cd:	45 85 d2             	test   r10d,r10d
   140c625d0:	74 71                	je     0x140c62643
   140c625d2:	45 33 c9             	xor    r9d,r9d
   140c625d5:	41 83 fa 40          	cmp    r10d,0x40
   140c625d9:	7e 28                	jle    0x140c62603
   140c625db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140c625e0:	45 8b c2             	mov    r8d,r10d
   140c625e3:	41 d1 e8             	shr    r8d,1
   140c625e6:	43 8d 14 08          	lea    edx,[r8+r9*1]
   140c625ea:	48 63 c2             	movsxd rax,edx
   140c625ed:	49 8b 0c c3          	mov    rcx,QWORD PTR [r11+rax*8]
   140c625f1:	3b 31                	cmp    esi,DWORD PTR [rcx]
   140c625f3:	41 0f 4c d1          	cmovl  edx,r9d
   140c625f7:	45 2b d0             	sub    r10d,r8d
   140c625fa:	44 8b ca             	mov    r9d,edx
   140c625fd:	41 83 fa 40          	cmp    r10d,0x40
   140c62601:	7f dd                	jg     0x140c625e0
   140c62603:	43 8d 04 11          	lea    eax,[r9+r10*1]
   140c62607:	83 f8 ff             	cmp    eax,0xffffffff
   140c6260a:	74 37                	je     0x140c62643
   140c6260c:	44 3b c8             	cmp    r9d,eax
   140c6260f:	7d 32                	jge    0x140c62643
   140c62611:	49 63 c9             	movsxd rcx,r9d
   140c62614:	48 63 d0             	movsxd rdx,eax
   140c62617:	49 8b 04 cb          	mov    rax,QWORD PTR [r11+rcx*8]
   140c6261b:	3b 30                	cmp    esi,DWORD PTR [rax]
   140c6261d:	74 0d                	je     0x140c6262c
   140c6261f:	41 ff c1             	inc    r9d
   140c62622:	48 ff c1             	inc    rcx
   140c62625:	48 3b ca             	cmp    rcx,rdx
   140c62628:	7c ed                	jl     0x140c62617
   140c6262a:	eb 17                	jmp    0x140c62643
   140c6262c:	49 63 c1             	movsxd rax,r9d
   140c6262f:	49 8b 14 c3          	mov    rdx,QWORD PTR [r11+rax*8]
   140c62633:	48 85 d2             	test   rdx,rdx
   140c62636:	74 0b                	je     0x140c62643
   140c62638:	48 83 7a 18 00       	cmp    QWORD PTR [rdx+0x18],0x0
   140c6263d:	0f 85 cc 00 00 00    	jne    0x140c6270f
   140c62643:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c62646:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c62649:	ff 50 28             	call   QWORD PTR [rax+0x28]
   140c6264c:	83 f8 09             	cmp    eax,0x9
   140c6264f:	0f 85 b1 00 00 00    	jne    0x140c62706
   140c62655:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140c62658:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
   140c6265c:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   140c62660:	48 2b ce             	sub    rcx,rsi
   140c62663:	48 c1 f9 02          	sar    rcx,0x2
   140c62667:	48 85 c9             	test   rcx,rcx
   140c6266a:	0f 84 96 00 00 00    	je     0x140c62706
   140c62670:	4c 8b 15 39 f5 87 01 	mov    r10,QWORD PTR [rip+0x187f539]        # 0x1424e1bb0
   140c62677:	4c 8b 1d 2a f5 87 01 	mov    r11,QWORD PTR [rip+0x187f52a]        # 0x1424e1ba8
   140c6267e:	8b 36                	mov    esi,DWORD PTR [rsi]
   140c62680:	4d 2b d3             	sub    r10,r11
   140c62683:	49 c1 fa 03          	sar    r10,0x3
   140c62687:	45 85 d2             	test   r10d,r10d
   140c6268a:	74 7a                	je     0x140c62706
   140c6268c:	45 33 c9             	xor    r9d,r9d
   140c6268f:	41 83 fa 40          	cmp    r10d,0x40
   140c62693:	7e 2e                	jle    0x140c626c3
   140c62695:	66 66 66 0f 1f 84 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140c6269c:	00 00 00 00 
   140c626a0:	45 8b c2             	mov    r8d,r10d
   140c626a3:	41 d1 e8             	shr    r8d,1
   140c626a6:	43 8d 14 08          	lea    edx,[r8+r9*1]
   140c626aa:	48 63 c2             	movsxd rax,edx
   140c626ad:	49 8b 0c c3          	mov    rcx,QWORD PTR [r11+rax*8]
   140c626b1:	3b 31                	cmp    esi,DWORD PTR [rcx]
   140c626b3:	41 0f 4c d1          	cmovl  edx,r9d
   140c626b7:	45 2b d0             	sub    r10d,r8d
   140c626ba:	44 8b ca             	mov    r9d,edx
   140c626bd:	41 83 fa 40          	cmp    r10d,0x40
   140c626c1:	7f dd                	jg     0x140c626a0
   140c626c3:	43 8d 04 11          	lea    eax,[r9+r10*1]
   140c626c7:	83 f8 ff             	cmp    eax,0xffffffff
   140c626ca:	74 3a                	je     0x140c62706
   140c626cc:	44 3b c8             	cmp    r9d,eax
   140c626cf:	7d 35                	jge    0x140c62706
   140c626d1:	49 63 c9             	movsxd rcx,r9d
   140c626d4:	48 63 d0             	movsxd rdx,eax
   140c626d7:	49 8b 04 cb          	mov    rax,QWORD PTR [r11+rcx*8]
   140c626db:	3b 30                	cmp    esi,DWORD PTR [rax]
   140c626dd:	74 14                	je     0x140c626f3
   140c626df:	41 ff c1             	inc    r9d
   140c626e2:	48 ff c1             	inc    rcx
   140c626e5:	48 3b ca             	cmp    rcx,rdx
   140c626e8:	7c ed                	jl     0x140c626d7
   140c626ea:	48 83 c3 08          	add    rbx,0x8
   140c626ee:	e9 8d fe ff ff       	jmp    0x140c62580
   140c626f3:	49 63 c1             	movsxd rax,r9d
   140c626f6:	49 8b 14 c3          	mov    rdx,QWORD PTR [r11+rax*8]
   140c626fa:	48 85 d2             	test   rdx,rdx
   140c626fd:	74 07                	je     0x140c62706
   140c626ff:	48 83 7a 18 00       	cmp    QWORD PTR [rdx+0x18],0x0
   140c62704:	75 09                	jne    0x140c6270f
   140c62706:	48 83 c3 08          	add    rbx,0x8
   140c6270a:	e9 71 fe ff ff       	jmp    0x140c62580
   140c6270f:	48 83 c2 08          	add    rdx,0x8
   140c62713:	4c 3b fa             	cmp    r15,rdx
   140c62716:	74 16                	je     0x140c6272e
   140c62718:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   140c6271d:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   140c62721:	76 03                	jbe    0x140c62726
   140c62723:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   140c62726:	49 8b cf             	mov    rcx,r15
   140c62729:	e8 32 d1 40 ff       	call   0x14006f860
   140c6272e:	41 b8 07 00 00 00    	mov    r8d,0x7
   140c62734:	48 8d 15 fd 66 a8 00 	lea    rdx,[rip+0xa866fd]        # 0x1416e8e38
   140c6273b:	49 8b cf             	mov    rcx,r15
   140c6273e:	48 83 c4 38          	add    rsp,0x38
   140c62742:	41 5f                	pop    r15
   140c62744:	41 5d                	pop    r13
   140c62746:	5f                   	pop    rdi
   140c62747:	5e                   	pop    rsi
   140c62748:	5b                   	pop    rbx
   140c62749:	5d                   	pop    rbp
   140c6274a:	e9 51 d2 40 ff       	jmp    0x14006f9a0
   140c6274f:	0f b6 5d 48          	movzx  ebx,BYTE PTR [rbp+0x48]
   140c62753:	8b 75 50             	mov    esi,DWORD PTR [rbp+0x50]
   140c62756:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c6275a:	49 8b cd             	mov    rcx,r13
   140c6275d:	4c 89 64 24 70       	mov    QWORD PTR [rsp+0x70],r12
   140c62762:	4c 89 74 24 30       	mov    QWORD PTR [rsp+0x30],r14
   140c62767:	ff 90 08 05 00 00    	call   QWORD PTR [rax+0x508]
   140c6276d:	49 8b 55 00          	mov    rdx,QWORD PTR [r13+0x0]
   140c62771:	49 8b cd             	mov    rcx,r13
   140c62774:	44 0f b7 f0          	movzx  r14d,ax
   140c62778:	ff 92 18 05 00 00    	call   QWORD PTR [rdx+0x518]
   140c6277e:	49 8b 55 00          	mov    rdx,QWORD PTR [r13+0x0]
   140c62782:	49 8b cd             	mov    rcx,r13
   140c62785:	44 0f b7 e0          	movzx  r12d,ax
   140c62789:	ff 92 d8 05 00 00    	call   QWORD PTR [rdx+0x5d8]
   140c6278f:	84 c0                	test   al,al
   140c62791:	75 09                	jne    0x140c6279c
   140c62793:	66 45 3b f4          	cmp    r14w,r12w
   140c62797:	66 45 0f 4c f4       	cmovl  r14w,r12w
   140c6279c:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c627a0:	44 8b c6             	mov    r8d,esi
   140c627a3:	49 8b d7             	mov    rdx,r15
   140c627a6:	49 8b cd             	mov    rcx,r13
   140c627a9:	ff 90 f0 05 00 00    	call   QWORD PTR [rax+0x5f0]
   140c627af:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
   140c627b6:	84 db                	test   bl,bl
   140c627b8:	0f 85 35 04 00 00    	jne    0x140c62bf3
   140c627be:	83 3d a3 3a c3 00 01 	cmp    DWORD PTR [rip+0xc33aa3],0x1        # 0x141896268
   140c627c5:	75 30                	jne    0x140c627f7
   140c627c7:	49 8b 5d 38          	mov    rbx,QWORD PTR [r13+0x38]
   140c627cb:	49 8b 7d 40          	mov    rdi,QWORD PTR [r13+0x40]
   140c627cf:	90                   	nop
   140c627d0:	48 3b df             	cmp    rbx,rdi
   140c627d3:	73 1e                	jae    0x140c627f3
   140c627d5:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c627d8:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c627db:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140c627de:	83 f8 1f             	cmp    eax,0x1f
   140c627e1:	74 06                	je     0x140c627e9
   140c627e3:	48 83 c3 08          	add    rbx,0x8
   140c627e7:	eb e7                	jmp    0x140c627d0
   140c627e9:	b2 24                	mov    dl,0x24
   140c627eb:	49 8b cf             	mov    rcx,r15
   140c627ee:	e8 1d 73 45 ff       	call   0x1400b9b10
   140c627f3:	0f b6 5d 48          	movzx  ebx,BYTE PTR [rbp+0x48]
   140c627f7:	41 f7 45 10 00 00 40 	test   DWORD PTR [r13+0x10],0x400000
   140c627fe:	00 
   140c627ff:	74 0a                	je     0x140c6280b
   140c62801:	b2 13                	mov    dl,0x13
   140c62803:	49 8b cf             	mov    rcx,r15
   140c62806:	e8 05 73 45 ff       	call   0x1400b9b10
   140c6280b:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c6280f:	49 8b cd             	mov    rcx,r13
   140c62812:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c62818:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c6281c:	66 83 f8 03          	cmp    ax,0x3
   140c62820:	7c 3a                	jl     0x140c6285c
   140c62822:	c6 45 40 58          	mov    BYTE PTR [rbp+0x40],0x58
   140c62826:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6282a:	4c 8b c6             	mov    r8,rsi
   140c6282d:	0f 1f 00             	nop    DWORD PTR [rax]
   140c62830:	49 ff c0             	inc    r8
   140c62833:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62838:	75 f6                	jne    0x140c62830
   140c6283a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c6283e:	49 8b cf             	mov    rcx,r15
   140c62841:	e8 5a d1 40 ff       	call   0x14006f9a0
   140c62846:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6284a:	4c 8b c6             	mov    r8,rsi
   140c6284d:	0f 1f 00             	nop    DWORD PTR [rax]
   140c62850:	49 ff c0             	inc    r8
   140c62853:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62858:	75 f6                	jne    0x140c62850
   140c6285a:	eb 3e                	jmp    0x140c6289a
   140c6285c:	66 83 f8 02          	cmp    ax,0x2
   140c62860:	75 1a                	jne    0x140c6287c
   140c62862:	c6 45 40 58          	mov    BYTE PTR [rbp+0x40],0x58
   140c62866:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6286a:	4c 8b c6             	mov    r8,rsi
   140c6286d:	0f 1f 00             	nop    DWORD PTR [rax]
   140c62870:	49 ff c0             	inc    r8
   140c62873:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62878:	75 f6                	jne    0x140c62870
   140c6287a:	eb 1e                	jmp    0x140c6289a
   140c6287c:	66 83 f8 01          	cmp    ax,0x1
   140c62880:	75 24                	jne    0x140c628a6
   140c62882:	c6 45 40 78          	mov    BYTE PTR [rbp+0x40],0x78
   140c62886:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6288a:	4c 8b c6             	mov    r8,rsi
   140c6288d:	0f 1f 00             	nop    DWORD PTR [rax]
   140c62890:	49 ff c0             	inc    r8
   140c62893:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62898:	75 f6                	jne    0x140c62890
   140c6289a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c6289e:	49 8b cf             	mov    rcx,r15
   140c628a1:	e8 fa d0 40 ff       	call   0x14006f9a0
   140c628a6:	83 3d bb 39 c3 00 00 	cmp    DWORD PTR [rip+0xc339bb],0x0        # 0x141896268
   140c628ad:	75 57                	jne    0x140c62906
   140c628af:	41 f7 45 10 00 40 00 	test   DWORD PTR [r13+0x10],0x4000
   140c628b6:	00 
   140c628b7:	74 21                	je     0x140c628da
   140c628b9:	c6 45 40 28          	mov    BYTE PTR [rbp+0x40],0x28
   140c628bd:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c628c1:	4c 8b c6             	mov    r8,rsi
   140c628c4:	49 ff c0             	inc    r8
   140c628c7:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c628cc:	75 f6                	jne    0x140c628c4
   140c628ce:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c628d2:	49 8b cf             	mov    rcx,r15
   140c628d5:	e8 c6 d0 40 ff       	call   0x14006f9a0
   140c628da:	41 f7 45 10 00 00 08 	test   DWORD PTR [r13+0x10],0x80000
   140c628e1:	00 
   140c628e2:	74 22                	je     0x140c62906
   140c628e4:	c6 45 40 7b          	mov    BYTE PTR [rbp+0x40],0x7b
   140c628e8:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c628ec:	4c 8b c6             	mov    r8,rsi
   140c628ef:	90                   	nop
   140c628f0:	49 ff c0             	inc    r8
   140c628f3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c628f8:	75 f6                	jne    0x140c628f0
   140c628fa:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c628fe:	49 8b cf             	mov    rcx,r15
   140c62901:	e8 9a d0 40 ff       	call   0x14006f9a0
   140c62906:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c6290a:	49 8b cd             	mov    rcx,r13
   140c6290d:	ff 90 d8 05 00 00    	call   QWORD PTR [rax+0x5d8]
   140c62913:	84 c0                	test   al,al
   140c62915:	0f 84 ec 00 00 00    	je     0x140c62a07
   140c6291b:	83 3d a6 80 72 01 00 	cmp    DWORD PTR [rip+0x17280a6],0x0        # 0x14238a9c8
   140c62922:	0f 8e be 00 00 00    	jle    0x140c629e6
   140c62928:	48 8b 05 91 80 72 01 	mov    rax,QWORD PTR [rip+0x1728091]        # 0x14238a9c0
   140c6292f:	f6 00 04             	test   BYTE PTR [rax],0x4
   140c62932:	0f 84 ae 00 00 00    	je     0x140c629e6
   140c62938:	66 41 83 fc 05       	cmp    r12w,0x5
   140c6293d:	75 1d                	jne    0x140c6295c
   140c6293f:	c6 45 40 0f          	mov    BYTE PTR [rbp+0x40],0xf
   140c62943:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62947:	4c 8b c6             	mov    r8,rsi
   140c6294a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140c62950:	49 ff c0             	inc    r8
   140c62953:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62958:	75 f6                	jne    0x140c62950
   140c6295a:	eb 7e                	jmp    0x140c629da
   140c6295c:	66 41 83 fc 04       	cmp    r12w,0x4
   140c62961:	75 19                	jne    0x140c6297c
   140c62963:	c6 45 40 f0          	mov    BYTE PTR [rbp+0x40],0xf0
   140c62967:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6296b:	4c 8b c6             	mov    r8,rsi
   140c6296e:	66 90                	xchg   ax,ax
   140c62970:	49 ff c0             	inc    r8
   140c62973:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62978:	75 f6                	jne    0x140c62970
   140c6297a:	eb 5e                	jmp    0x140c629da
   140c6297c:	66 41 83 fc 03       	cmp    r12w,0x3
   140c62981:	75 19                	jne    0x140c6299c
   140c62983:	c6 45 40 2a          	mov    BYTE PTR [rbp+0x40],0x2a
   140c62987:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6298b:	4c 8b c6             	mov    r8,rsi
   140c6298e:	66 90                	xchg   ax,ax
   140c62990:	49 ff c0             	inc    r8
   140c62993:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62998:	75 f6                	jne    0x140c62990
   140c6299a:	eb 3e                	jmp    0x140c629da
   140c6299c:	66 41 83 fc 02       	cmp    r12w,0x2
   140c629a1:	75 19                	jne    0x140c629bc
   140c629a3:	c6 45 40 2b          	mov    BYTE PTR [rbp+0x40],0x2b
   140c629a7:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c629ab:	4c 8b c6             	mov    r8,rsi
   140c629ae:	66 90                	xchg   ax,ax
   140c629b0:	49 ff c0             	inc    r8
   140c629b3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c629b8:	75 f6                	jne    0x140c629b0
   140c629ba:	eb 1e                	jmp    0x140c629da
   140c629bc:	66 41 83 fc 01       	cmp    r12w,0x1
   140c629c1:	75 23                	jne    0x140c629e6
   140c629c3:	c6 45 40 2d          	mov    BYTE PTR [rbp+0x40],0x2d
   140c629c7:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c629cb:	4c 8b c6             	mov    r8,rsi
   140c629ce:	66 90                	xchg   ax,ax
   140c629d0:	49 ff c0             	inc    r8
   140c629d3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c629d8:	75 f6                	jne    0x140c629d0
   140c629da:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c629de:	49 8b cf             	mov    rcx,r15
   140c629e1:	e8 ba cf 40 ff       	call   0x14006f9a0
   140c629e6:	c6 45 40 ae          	mov    BYTE PTR [rbp+0x40],0xae
   140c629ea:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c629ee:	4c 8b c6             	mov    r8,rsi
   140c629f1:	49 ff c0             	inc    r8
   140c629f4:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c629f9:	75 f6                	jne    0x140c629f1
   140c629fb:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c629ff:	49 8b cf             	mov    rcx,r15
   140c62a02:	e8 99 cf 40 ff       	call   0x14006f9a0
   140c62a07:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62a0b:	49 8b cd             	mov    rcx,r13
   140c62a0e:	ff 90 e0 05 00 00    	call   QWORD PTR [rax+0x5e0]
   140c62a14:	48 85 c0             	test   rax,rax
   140c62a17:	74 21                	je     0x140c62a3a
   140c62a19:	c6 45 40 11          	mov    BYTE PTR [rbp+0x40],0x11
   140c62a1d:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62a21:	4c 8b c6             	mov    r8,rsi
   140c62a24:	49 ff c0             	inc    r8
   140c62a27:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62a2c:	75 f6                	jne    0x140c62a24
   140c62a2e:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62a32:	49 8b cf             	mov    rcx,r15
   140c62a35:	e8 66 cf 40 ff       	call   0x14006f9a0
   140c62a3a:	66 41 83 fe 05       	cmp    r14w,0x5
   140c62a3f:	75 52                	jne    0x140c62a93
   140c62a41:	c6 45 40 0f          	mov    BYTE PTR [rbp+0x40],0xf
   140c62a45:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62a49:	4c 8b c6             	mov    r8,rsi
   140c62a4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140c62a50:	49 ff c0             	inc    r8
   140c62a53:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62a58:	75 f6                	jne    0x140c62a50
   140c62a5a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62a5e:	49 8b cf             	mov    rcx,r15
   140c62a61:	e8 3a cf 40 ff       	call   0x14006f9a0
   140c62a66:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62a6a:	44 0f b6 c3          	movzx  r8d,bl
   140c62a6e:	49 8b d7             	mov    rdx,r15
   140c62a71:	49 8b cd             	mov    rcx,r13
   140c62a74:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c62a7a:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62a7e:	49 8b cd             	mov    rcx,r13
   140c62a81:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c62a85:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c62a8b:	0f b7 d8             	movzx  ebx,ax
   140c62a8e:	e9 97 01 00 00       	jmp    0x140c62c2a
   140c62a93:	66 41 83 fe 04       	cmp    r14w,0x4
   140c62a98:	75 4e                	jne    0x140c62ae8
   140c62a9a:	c6 45 40 f0          	mov    BYTE PTR [rbp+0x40],0xf0
   140c62a9e:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62aa2:	4c 8b c6             	mov    r8,rsi
   140c62aa5:	49 ff c0             	inc    r8
   140c62aa8:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62aad:	75 f6                	jne    0x140c62aa5
   140c62aaf:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62ab3:	49 8b cf             	mov    rcx,r15
   140c62ab6:	e8 e5 ce 40 ff       	call   0x14006f9a0
   140c62abb:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62abf:	44 0f b6 c3          	movzx  r8d,bl
   140c62ac3:	49 8b d7             	mov    rdx,r15
   140c62ac6:	49 8b cd             	mov    rcx,r13
   140c62ac9:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c62acf:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62ad3:	49 8b cd             	mov    rcx,r13
   140c62ad6:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c62ada:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c62ae0:	0f b7 d8             	movzx  ebx,ax
   140c62ae3:	e9 60 01 00 00       	jmp    0x140c62c48
   140c62ae8:	66 41 83 fe 03       	cmp    r14w,0x3
   140c62aed:	75 54                	jne    0x140c62b43
   140c62aef:	c6 45 40 2a          	mov    BYTE PTR [rbp+0x40],0x2a
   140c62af3:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62af7:	4c 8b c6             	mov    r8,rsi
   140c62afa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140c62b00:	49 ff c0             	inc    r8
   140c62b03:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62b08:	75 f6                	jne    0x140c62b00
   140c62b0a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62b0e:	49 8b cf             	mov    rcx,r15
   140c62b11:	e8 8a ce 40 ff       	call   0x14006f9a0
   140c62b16:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62b1a:	44 0f b6 c3          	movzx  r8d,bl
   140c62b1e:	49 8b d7             	mov    rdx,r15
   140c62b21:	49 8b cd             	mov    rcx,r13
   140c62b24:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c62b2a:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62b2e:	49 8b cd             	mov    rcx,r13
   140c62b31:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c62b35:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c62b3b:	0f b7 d8             	movzx  ebx,ax
   140c62b3e:	e9 23 01 00 00       	jmp    0x140c62c66
   140c62b43:	66 41 83 fe 02       	cmp    r14w,0x2
   140c62b48:	75 4e                	jne    0x140c62b98
   140c62b4a:	c6 45 40 2b          	mov    BYTE PTR [rbp+0x40],0x2b
   140c62b4e:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62b52:	4c 8b c6             	mov    r8,rsi
   140c62b55:	49 ff c0             	inc    r8
   140c62b58:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62b5d:	75 f6                	jne    0x140c62b55
   140c62b5f:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62b63:	49 8b cf             	mov    rcx,r15
   140c62b66:	e8 35 ce 40 ff       	call   0x14006f9a0
   140c62b6b:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62b6f:	44 0f b6 c3          	movzx  r8d,bl
   140c62b73:	49 8b d7             	mov    rdx,r15
   140c62b76:	49 8b cd             	mov    rcx,r13
   140c62b79:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c62b7f:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62b83:	49 8b cd             	mov    rcx,r13
   140c62b86:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c62b8a:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c62b90:	0f b7 d8             	movzx  ebx,ax
   140c62b93:	e9 ec 00 00 00       	jmp    0x140c62c84
   140c62b98:	66 41 83 fe 01       	cmp    r14w,0x1
   140c62b9d:	75 54                	jne    0x140c62bf3
   140c62b9f:	c6 45 40 2d          	mov    BYTE PTR [rbp+0x40],0x2d
   140c62ba3:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62ba7:	4c 8b c6             	mov    r8,rsi
   140c62baa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140c62bb0:	49 ff c0             	inc    r8
   140c62bb3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62bb8:	75 f6                	jne    0x140c62bb0
   140c62bba:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62bbe:	49 8b cf             	mov    rcx,r15
   140c62bc1:	e8 da cd 40 ff       	call   0x14006f9a0
   140c62bc6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62bca:	44 0f b6 c3          	movzx  r8d,bl
   140c62bce:	49 8b d7             	mov    rdx,r15
   140c62bd1:	49 8b cd             	mov    rcx,r13
   140c62bd4:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c62bda:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62bde:	49 8b cd             	mov    rcx,r13
   140c62be1:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c62be5:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c62beb:	0f b7 d8             	movzx  ebx,ax
   140c62bee:	e9 b0 00 00 00       	jmp    0x140c62ca3
   140c62bf3:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62bf7:	44 0f b6 c3          	movzx  r8d,bl
   140c62bfb:	49 8b d7             	mov    rdx,r15
   140c62bfe:	49 8b cd             	mov    rcx,r13
   140c62c01:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c62c07:	84 db                	test   bl,bl
   140c62c09:	0f 85 24 03 00 00    	jne    0x140c62f33
   140c62c0f:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62c13:	49 8b cd             	mov    rcx,r13
   140c62c16:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c62c1c:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c62c20:	0f b7 d8             	movzx  ebx,ax
   140c62c23:	66 41 83 fe 05       	cmp    r14w,0x5
   140c62c28:	75 17                	jne    0x140c62c41
   140c62c2a:	c6 45 40 0f          	mov    BYTE PTR [rbp+0x40],0xf
   140c62c2e:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62c32:	4c 8b c6             	mov    r8,rsi
   140c62c35:	49 ff c0             	inc    r8
   140c62c38:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62c3d:	75 f6                	jne    0x140c62c35
   140c62c3f:	eb 79                	jmp    0x140c62cba
   140c62c41:	66 41 83 fe 04       	cmp    r14w,0x4
   140c62c46:	75 17                	jne    0x140c62c5f
   140c62c48:	c6 45 40 f0          	mov    BYTE PTR [rbp+0x40],0xf0
   140c62c4c:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62c50:	4c 8b c6             	mov    r8,rsi
   140c62c53:	49 ff c0             	inc    r8
   140c62c56:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62c5b:	75 f6                	jne    0x140c62c53
   140c62c5d:	eb 5b                	jmp    0x140c62cba
   140c62c5f:	66 41 83 fe 03       	cmp    r14w,0x3
   140c62c64:	75 17                	jne    0x140c62c7d
   140c62c66:	c6 45 40 2a          	mov    BYTE PTR [rbp+0x40],0x2a
   140c62c6a:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62c6e:	4c 8b c6             	mov    r8,rsi
   140c62c71:	49 ff c0             	inc    r8
   140c62c74:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62c79:	75 f6                	jne    0x140c62c71
   140c62c7b:	eb 3d                	jmp    0x140c62cba
   140c62c7d:	66 41 83 fe 02       	cmp    r14w,0x2
   140c62c82:	75 18                	jne    0x140c62c9c
   140c62c84:	c6 45 40 2b          	mov    BYTE PTR [rbp+0x40],0x2b
   140c62c88:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62c8c:	4c 8b c6             	mov    r8,rsi
   140c62c8f:	90                   	nop
   140c62c90:	49 ff c0             	inc    r8
   140c62c93:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62c98:	75 f6                	jne    0x140c62c90
   140c62c9a:	eb 1e                	jmp    0x140c62cba
   140c62c9c:	66 41 83 fe 01       	cmp    r14w,0x1
   140c62ca1:	75 23                	jne    0x140c62cc6
   140c62ca3:	c6 45 40 2d          	mov    BYTE PTR [rbp+0x40],0x2d
   140c62ca7:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62cab:	4c 8b c6             	mov    r8,rsi
   140c62cae:	66 90                	xchg   ax,ax
   140c62cb0:	49 ff c0             	inc    r8
   140c62cb3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62cb8:	75 f6                	jne    0x140c62cb0
   140c62cba:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62cbe:	49 8b cf             	mov    rcx,r15
   140c62cc1:	e8 da cc 40 ff       	call   0x14006f9a0
   140c62cc6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62cca:	49 8b cd             	mov    rcx,r13
   140c62ccd:	ff 90 e0 05 00 00    	call   QWORD PTR [rax+0x5e0]
   140c62cd3:	48 85 c0             	test   rax,rax
   140c62cd6:	74 21                	je     0x140c62cf9
   140c62cd8:	c6 45 40 10          	mov    BYTE PTR [rbp+0x40],0x10
   140c62cdc:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62ce0:	4c 8b c6             	mov    r8,rsi
   140c62ce3:	49 ff c0             	inc    r8
   140c62ce6:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62ceb:	75 f6                	jne    0x140c62ce3
   140c62ced:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62cf1:	49 8b cf             	mov    rcx,r15
   140c62cf4:	e8 a7 cc 40 ff       	call   0x14006f9a0
   140c62cf9:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c62cfd:	49 8b cd             	mov    rcx,r13
   140c62d00:	ff 90 d8 05 00 00    	call   QWORD PTR [rax+0x5d8]
   140c62d06:	84 c0                	test   al,al
   140c62d08:	0f 84 e8 00 00 00    	je     0x140c62df6
   140c62d0e:	c6 45 40 af          	mov    BYTE PTR [rbp+0x40],0xaf
   140c62d12:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62d16:	4c 8b c6             	mov    r8,rsi
   140c62d19:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140c62d20:	49 ff c0             	inc    r8
   140c62d23:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62d28:	75 f6                	jne    0x140c62d20
   140c62d2a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62d2e:	49 8b cf             	mov    rcx,r15
   140c62d31:	e8 6a cc 40 ff       	call   0x14006f9a0
   140c62d36:	83 3d 8b 7c 72 01 00 	cmp    DWORD PTR [rip+0x1727c8b],0x0        # 0x14238a9c8
   140c62d3d:	0f 8e b3 00 00 00    	jle    0x140c62df6
   140c62d43:	48 8b 05 76 7c 72 01 	mov    rax,QWORD PTR [rip+0x1727c76]        # 0x14238a9c0
   140c62d4a:	f6 00 04             	test   BYTE PTR [rax],0x4
   140c62d4d:	0f 84 a3 00 00 00    	je     0x140c62df6
   140c62d53:	66 41 83 fc 05       	cmp    r12w,0x5
   140c62d58:	75 17                	jne    0x140c62d71
   140c62d5a:	c6 45 40 0f          	mov    BYTE PTR [rbp+0x40],0xf
   140c62d5e:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62d62:	4c 8b c6             	mov    r8,rsi
   140c62d65:	49 ff c0             	inc    r8
   140c62d68:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62d6d:	75 f6                	jne    0x140c62d65
   140c62d6f:	eb 79                	jmp    0x140c62dea
   140c62d71:	66 41 83 fc 04       	cmp    r12w,0x4
   140c62d76:	75 17                	jne    0x140c62d8f
   140c62d78:	c6 45 40 f0          	mov    BYTE PTR [rbp+0x40],0xf0
   140c62d7c:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62d80:	4c 8b c6             	mov    r8,rsi
   140c62d83:	49 ff c0             	inc    r8
   140c62d86:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62d8b:	75 f6                	jne    0x140c62d83
   140c62d8d:	eb 5b                	jmp    0x140c62dea
   140c62d8f:	66 41 83 fc 03       	cmp    r12w,0x3
   140c62d94:	75 17                	jne    0x140c62dad
   140c62d96:	c6 45 40 2a          	mov    BYTE PTR [rbp+0x40],0x2a
   140c62d9a:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62d9e:	4c 8b c6             	mov    r8,rsi
   140c62da1:	49 ff c0             	inc    r8
   140c62da4:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62da9:	75 f6                	jne    0x140c62da1
   140c62dab:	eb 3d                	jmp    0x140c62dea
   140c62dad:	66 41 83 fc 02       	cmp    r12w,0x2
   140c62db2:	75 18                	jne    0x140c62dcc
   140c62db4:	c6 45 40 2b          	mov    BYTE PTR [rbp+0x40],0x2b
   140c62db8:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62dbc:	4c 8b c6             	mov    r8,rsi
   140c62dbf:	90                   	nop
   140c62dc0:	49 ff c0             	inc    r8
   140c62dc3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62dc8:	75 f6                	jne    0x140c62dc0
   140c62dca:	eb 1e                	jmp    0x140c62dea
   140c62dcc:	66 41 83 fc 01       	cmp    r12w,0x1
   140c62dd1:	75 23                	jne    0x140c62df6
   140c62dd3:	c6 45 40 2d          	mov    BYTE PTR [rbp+0x40],0x2d
   140c62dd7:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62ddb:	4c 8b c6             	mov    r8,rsi
   140c62dde:	66 90                	xchg   ax,ax
   140c62de0:	49 ff c0             	inc    r8
   140c62de3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62de8:	75 f6                	jne    0x140c62de0
   140c62dea:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62dee:	49 8b cf             	mov    rcx,r15
   140c62df1:	e8 aa cb 40 ff       	call   0x14006f9a0
   140c62df6:	83 3d 6b 34 c3 00 00 	cmp    DWORD PTR [rip+0xc3346b],0x0        # 0x141896268
   140c62dfd:	75 57                	jne    0x140c62e56
   140c62dff:	41 f7 45 10 00 00 08 	test   DWORD PTR [r13+0x10],0x80000
   140c62e06:	00 
   140c62e07:	74 21                	je     0x140c62e2a
   140c62e09:	c6 45 40 7d          	mov    BYTE PTR [rbp+0x40],0x7d
   140c62e0d:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62e11:	4c 8b c6             	mov    r8,rsi
   140c62e14:	49 ff c0             	inc    r8
   140c62e17:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62e1c:	75 f6                	jne    0x140c62e14
   140c62e1e:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62e22:	49 8b cf             	mov    rcx,r15
   140c62e25:	e8 76 cb 40 ff       	call   0x14006f9a0
   140c62e2a:	41 f7 45 10 00 40 00 	test   DWORD PTR [r13+0x10],0x4000
   140c62e31:	00 
   140c62e32:	74 22                	je     0x140c62e56
   140c62e34:	c6 45 40 29          	mov    BYTE PTR [rbp+0x40],0x29
   140c62e38:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62e3c:	4c 8b c6             	mov    r8,rsi
   140c62e3f:	90                   	nop
   140c62e40:	49 ff c0             	inc    r8
   140c62e43:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62e48:	75 f6                	jne    0x140c62e40
   140c62e4a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62e4e:	49 8b cf             	mov    rcx,r15
   140c62e51:	e8 4a cb 40 ff       	call   0x14006f9a0
   140c62e56:	66 83 fb 03          	cmp    bx,0x3
   140c62e5a:	7c 3f                	jl     0x140c62e9b
   140c62e5c:	c6 45 40 58          	mov    BYTE PTR [rbp+0x40],0x58
   140c62e60:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62e64:	4c 8b c6             	mov    r8,rsi
   140c62e67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140c62e6e:	00 00 
   140c62e70:	49 ff c0             	inc    r8
   140c62e73:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c62e78:	75 f6                	jne    0x140c62e70
   140c62e7a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62e7e:	49 8b cf             	mov    rcx,r15
   140c62e81:	e8 1a cb 40 ff       	call   0x14006f9a0
   140c62e86:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62e8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140c62e90:	48 ff c6             	inc    rsi
   140c62e93:	80 3c 30 00          	cmp    BYTE PTR [rax+rsi*1],0x0
   140c62e97:	75 f7                	jne    0x140c62e90
   140c62e99:	eb 3e                	jmp    0x140c62ed9
   140c62e9b:	66 83 fb 02          	cmp    bx,0x2
   140c62e9f:	75 1a                	jne    0x140c62ebb
   140c62ea1:	c6 45 40 58          	mov    BYTE PTR [rbp+0x40],0x58
   140c62ea5:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62ea9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140c62eb0:	48 ff c6             	inc    rsi
   140c62eb3:	80 3c 30 00          	cmp    BYTE PTR [rax+rsi*1],0x0
   140c62eb7:	75 f7                	jne    0x140c62eb0
   140c62eb9:	eb 1e                	jmp    0x140c62ed9
   140c62ebb:	66 83 fb 01          	cmp    bx,0x1
   140c62ebf:	75 27                	jne    0x140c62ee8
   140c62ec1:	c6 45 40 78          	mov    BYTE PTR [rbp+0x40],0x78
   140c62ec5:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c62ec9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140c62ed0:	48 ff c6             	inc    rsi
   140c62ed3:	80 3c 30 00          	cmp    BYTE PTR [rax+rsi*1],0x0
   140c62ed7:	75 f7                	jne    0x140c62ed0
   140c62ed9:	4c 8b c6             	mov    r8,rsi
   140c62edc:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c62ee0:	49 8b cf             	mov    rcx,r15
   140c62ee3:	e8 b8 ca 40 ff       	call   0x14006f9a0
   140c62ee8:	41 f7 45 10 00 00 40 	test   DWORD PTR [r13+0x10],0x400000
   140c62eef:	00 
   140c62ef0:	74 0a                	je     0x140c62efc
   140c62ef2:	b2 13                	mov    dl,0x13
   140c62ef4:	49 8b cf             	mov    rcx,r15
   140c62ef7:	e8 14 6c 45 ff       	call   0x1400b9b10
   140c62efc:	83 3d 65 33 c3 00 01 	cmp    DWORD PTR [rip+0xc33365],0x1        # 0x141896268
   140c62f03:	75 2e                	jne    0x140c62f33
   140c62f05:	49 8b 5d 38          	mov    rbx,QWORD PTR [r13+0x38]
   140c62f09:	49 8b 7d 40          	mov    rdi,QWORD PTR [r13+0x40]
   140c62f0d:	0f 1f 00             	nop    DWORD PTR [rax]
   140c62f10:	48 3b df             	cmp    rbx,rdi
   140c62f13:	73 1e                	jae    0x140c62f33
   140c62f15:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c62f18:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c62f1b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140c62f1e:	83 f8 1f             	cmp    eax,0x1f
   140c62f21:	74 06                	je     0x140c62f29
   140c62f23:	48 83 c3 08          	add    rbx,0x8
   140c62f27:	eb e7                	jmp    0x140c62f10
   140c62f29:	b2 24                	mov    dl,0x24
   140c62f2b:	49 8b cf             	mov    rcx,r15
   140c62f2e:	e8 dd 6b 45 ff       	call   0x1400b9b10
   140c62f33:	4c 8b 64 24 70       	mov    r12,QWORD PTR [rsp+0x70]
   140c62f38:	4c 8b 74 24 30       	mov    r14,QWORD PTR [rsp+0x30]
   140c62f3d:	48 83 c4 38          	add    rsp,0x38
   140c62f41:	41 5f                	pop    r15
   140c62f43:	41 5d                	pop    r13
   140c62f45:	5f                   	pop    rdi
   140c62f46:	5e                   	pop    rsi
   140c62f47:	5b                   	pop    rbx
   140c62f48:	5d                   	pop    rbp
   140c62f49:	c3                   	ret
