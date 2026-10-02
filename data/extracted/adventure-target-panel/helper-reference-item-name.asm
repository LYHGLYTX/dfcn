
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140c65450 <.text+0xc64450>:
   140c65450:	44 89 4c 24 20       	mov    DWORD PTR [rsp+0x20],r9d
   140c65455:	44 88 44 24 18       	mov    BYTE PTR [rsp+0x18],r8b
   140c6545a:	55                   	push   rbp
   140c6545b:	53                   	push   rbx
   140c6545c:	56                   	push   rsi
   140c6545d:	57                   	push   rdi
   140c6545e:	41 55                	push   r13
   140c65460:	41 57                	push   r15
   140c65462:	48 8b ec             	mov    rbp,rsp
   140c65465:	48 83 ec 38          	sub    rsp,0x38
   140c65469:	48 c7 42 10 00 00 00 	mov    QWORD PTR [rdx+0x10],0x0
   140c65470:	00 
   140c65471:	41 8b f1             	mov    esi,r9d
   140c65474:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   140c65479:	4c 8b fa             	mov    r15,rdx
   140c6547c:	4c 8b e9             	mov    r13,rcx
   140c6547f:	48 8b c2             	mov    rax,rdx
   140c65482:	76 03                	jbe    0x140c65487
   140c65484:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140c65487:	c6 00 00             	mov    BYTE PTR [rax],0x0
   140c6548a:	48 8b 59 38          	mov    rbx,QWORD PTR [rcx+0x38]
   140c6548e:	48 8b 79 40          	mov    rdi,QWORD PTR [rcx+0x40]
   140c65492:	48 3b df             	cmp    rbx,rdi
   140c65495:	73 50                	jae    0x140c654e7
   140c65497:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c6549a:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c6549d:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140c654a0:	83 f8 01             	cmp    eax,0x1
   140c654a3:	74 06                	je     0x140c654ab
   140c654a5:	48 83 c3 08          	add    rbx,0x8
   140c654a9:	eb e7                	jmp    0x140c65492
   140c654ab:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c654ae:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c654b1:	ff 50 40             	call   QWORD PTR [rax+0x40]
   140c654b4:	48 85 c0             	test   rax,rax
   140c654b7:	74 2e                	je     0x140c654e7
   140c654b9:	80 78 7a 00          	cmp    BYTE PTR [rax+0x7a],0x0
   140c654bd:	0f b6 5d 48          	movzx  ebx,BYTE PTR [rbp+0x48]
   140c654c1:	0f 84 4f 02 00 00    	je     0x140c65716
   140c654c7:	84 db                	test   bl,bl
   140c654c9:	0f 85 47 02 00 00    	jne    0x140c65716
   140c654cf:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140c654d3:	49 8b d7             	mov    rdx,r15
   140c654d6:	48 83 c4 38          	add    rsp,0x38
   140c654da:	41 5f                	pop    r15
   140c654dc:	41 5d                	pop    r13
   140c654de:	5f                   	pop    rdi
   140c654df:	5e                   	pop    rsi
   140c654e0:	5b                   	pop    rbx
   140c654e1:	5d                   	pop    rbp
   140c654e2:	e9 49 eb e2 ff       	jmp    0x140a94030
   140c654e7:	0f b6 5d 48          	movzx  ebx,BYTE PTR [rbp+0x48]
   140c654eb:	84 db                	test   bl,bl
   140c654ed:	0f 85 23 02 00 00    	jne    0x140c65716
   140c654f3:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c654f7:	49 8b cd             	mov    rcx,r13
   140c654fa:	ff 10                	call   QWORD PTR [rax]
   140c654fc:	66 83 f8 59          	cmp    ax,0x59
   140c65500:	75 16                	jne    0x140c65518
   140c65502:	49 83 bd f8 00 00 00 	cmp    QWORD PTR [r13+0xf8],0x0
   140c65509:	00 
   140c6550a:	74 0c                	je     0x140c65518
   140c6550c:	49 8d 95 e8 00 00 00 	lea    rdx,[r13+0xe8]
   140c65513:	e9 bb 01 00 00       	jmp    0x140c656d3
   140c65518:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c6551c:	49 8b cd             	mov    rcx,r13
   140c6551f:	ff 10                	call   QWORD PTR [rax]
   140c65521:	66 83 f8 56          	cmp    ax,0x56
   140c65525:	0f 85 eb 01 00 00    	jne    0x140c65716
   140c6552b:	49 8b 9d d0 00 00 00 	mov    rbx,QWORD PTR [r13+0xd0]
   140c65532:	49 8b bd d8 00 00 00 	mov    rdi,QWORD PTR [r13+0xd8]
   140c65539:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140c65540:	48 3b df             	cmp    rbx,rdi
   140c65543:	0f 83 c6 01 00 00    	jae    0x140c6570f
   140c65549:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c6554c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c6554f:	ff 50 28             	call   QWORD PTR [rax+0x28]
   140c65552:	83 f8 0c             	cmp    eax,0xc
   140c65555:	0f 85 a8 00 00 00    	jne    0x140c65603
   140c6555b:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140c6555e:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
   140c65562:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
   140c65566:	48 2b ce             	sub    rcx,rsi
   140c65569:	48 c1 f9 02          	sar    rcx,0x2
   140c6556d:	48 85 c9             	test   rcx,rcx
   140c65570:	0f 84 8d 00 00 00    	je     0x140c65603
   140c65576:	4c 8b 15 43 27 88 01 	mov    r10,QWORD PTR [rip+0x1882743]        # 0x1424e7cc0
   140c6557d:	4c 8b 1d 34 27 88 01 	mov    r11,QWORD PTR [rip+0x1882734]        # 0x1424e7cb8
   140c65584:	8b 36                	mov    esi,DWORD PTR [rsi]
   140c65586:	4d 2b d3             	sub    r10,r11
   140c65589:	49 c1 fa 03          	sar    r10,0x3
   140c6558d:	45 85 d2             	test   r10d,r10d
   140c65590:	74 71                	je     0x140c65603
   140c65592:	45 33 c9             	xor    r9d,r9d
   140c65595:	41 83 fa 40          	cmp    r10d,0x40
   140c65599:	7e 28                	jle    0x140c655c3
   140c6559b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140c655a0:	45 8b c2             	mov    r8d,r10d
   140c655a3:	41 d1 e8             	shr    r8d,1
   140c655a6:	43 8d 14 08          	lea    edx,[r8+r9*1]
   140c655aa:	48 63 c2             	movsxd rax,edx
   140c655ad:	49 8b 0c c3          	mov    rcx,QWORD PTR [r11+rax*8]
   140c655b1:	3b 31                	cmp    esi,DWORD PTR [rcx]
   140c655b3:	41 0f 4c d1          	cmovl  edx,r9d
   140c655b7:	45 2b d0             	sub    r10d,r8d
   140c655ba:	44 8b ca             	mov    r9d,edx
   140c655bd:	41 83 fa 40          	cmp    r10d,0x40
   140c655c1:	7f dd                	jg     0x140c655a0
   140c655c3:	43 8d 04 11          	lea    eax,[r9+r10*1]
   140c655c7:	83 f8 ff             	cmp    eax,0xffffffff
   140c655ca:	74 37                	je     0x140c65603
   140c655cc:	44 3b c8             	cmp    r9d,eax
   140c655cf:	7d 32                	jge    0x140c65603
   140c655d1:	49 63 c9             	movsxd rcx,r9d
   140c655d4:	48 63 d0             	movsxd rdx,eax
   140c655d7:	49 8b 04 cb          	mov    rax,QWORD PTR [r11+rcx*8]
   140c655db:	3b 30                	cmp    esi,DWORD PTR [rax]
   140c655dd:	74 0d                	je     0x140c655ec
   140c655df:	41 ff c1             	inc    r9d
   140c655e2:	48 ff c1             	inc    rcx
   140c655e5:	48 3b ca             	cmp    rcx,rdx
   140c655e8:	7c ed                	jl     0x140c655d7
   140c655ea:	eb 17                	jmp    0x140c65603
   140c655ec:	49 63 c1             	movsxd rax,r9d
   140c655ef:	49 8b 14 c3          	mov    rdx,QWORD PTR [r11+rax*8]
   140c655f3:	48 85 d2             	test   rdx,rdx
   140c655f6:	74 0b                	je     0x140c65603
   140c655f8:	48 83 7a 18 00       	cmp    QWORD PTR [rdx+0x18],0x0
   140c655fd:	0f 85 cc 00 00 00    	jne    0x140c656cf
   140c65603:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c65606:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c65609:	ff 50 28             	call   QWORD PTR [rax+0x28]
   140c6560c:	83 f8 09             	cmp    eax,0x9
   140c6560f:	0f 85 b1 00 00 00    	jne    0x140c656c6
   140c65615:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140c65618:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
   140c6561c:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   140c65620:	48 2b ce             	sub    rcx,rsi
   140c65623:	48 c1 f9 02          	sar    rcx,0x2
   140c65627:	48 85 c9             	test   rcx,rcx
   140c6562a:	0f 84 96 00 00 00    	je     0x140c656c6
   140c65630:	4c 8b 15 89 26 88 01 	mov    r10,QWORD PTR [rip+0x1882689]        # 0x1424e7cc0
   140c65637:	4c 8b 1d 7a 26 88 01 	mov    r11,QWORD PTR [rip+0x188267a]        # 0x1424e7cb8
   140c6563e:	8b 36                	mov    esi,DWORD PTR [rsi]
   140c65640:	4d 2b d3             	sub    r10,r11
   140c65643:	49 c1 fa 03          	sar    r10,0x3
   140c65647:	45 85 d2             	test   r10d,r10d
   140c6564a:	74 7a                	je     0x140c656c6
   140c6564c:	45 33 c9             	xor    r9d,r9d
   140c6564f:	41 83 fa 40          	cmp    r10d,0x40
   140c65653:	7e 2e                	jle    0x140c65683
   140c65655:	66 66 66 0f 1f 84 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140c6565c:	00 00 00 00 
   140c65660:	45 8b c2             	mov    r8d,r10d
   140c65663:	41 d1 e8             	shr    r8d,1
   140c65666:	43 8d 14 08          	lea    edx,[r8+r9*1]
   140c6566a:	48 63 c2             	movsxd rax,edx
   140c6566d:	49 8b 0c c3          	mov    rcx,QWORD PTR [r11+rax*8]
   140c65671:	3b 31                	cmp    esi,DWORD PTR [rcx]
   140c65673:	41 0f 4c d1          	cmovl  edx,r9d
   140c65677:	45 2b d0             	sub    r10d,r8d
   140c6567a:	44 8b ca             	mov    r9d,edx
   140c6567d:	41 83 fa 40          	cmp    r10d,0x40
   140c65681:	7f dd                	jg     0x140c65660
   140c65683:	43 8d 04 11          	lea    eax,[r9+r10*1]
   140c65687:	83 f8 ff             	cmp    eax,0xffffffff
   140c6568a:	74 3a                	je     0x140c656c6
   140c6568c:	44 3b c8             	cmp    r9d,eax
   140c6568f:	7d 35                	jge    0x140c656c6
   140c65691:	49 63 c9             	movsxd rcx,r9d
   140c65694:	48 63 d0             	movsxd rdx,eax
   140c65697:	49 8b 04 cb          	mov    rax,QWORD PTR [r11+rcx*8]
   140c6569b:	3b 30                	cmp    esi,DWORD PTR [rax]
   140c6569d:	74 14                	je     0x140c656b3
   140c6569f:	41 ff c1             	inc    r9d
   140c656a2:	48 ff c1             	inc    rcx
   140c656a5:	48 3b ca             	cmp    rcx,rdx
   140c656a8:	7c ed                	jl     0x140c65697
   140c656aa:	48 83 c3 08          	add    rbx,0x8
   140c656ae:	e9 8d fe ff ff       	jmp    0x140c65540
   140c656b3:	49 63 c1             	movsxd rax,r9d
   140c656b6:	49 8b 14 c3          	mov    rdx,QWORD PTR [r11+rax*8]
   140c656ba:	48 85 d2             	test   rdx,rdx
   140c656bd:	74 07                	je     0x140c656c6
   140c656bf:	48 83 7a 18 00       	cmp    QWORD PTR [rdx+0x18],0x0
   140c656c4:	75 09                	jne    0x140c656cf
   140c656c6:	48 83 c3 08          	add    rbx,0x8
   140c656ca:	e9 71 fe ff ff       	jmp    0x140c65540
   140c656cf:	48 83 c2 08          	add    rdx,0x8
   140c656d3:	4c 3b fa             	cmp    r15,rdx
   140c656d6:	74 16                	je     0x140c656ee
   140c656d8:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   140c656dd:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   140c656e1:	76 03                	jbe    0x140c656e6
   140c656e3:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   140c656e6:	49 8b cf             	mov    rcx,r15
   140c656e9:	e8 e2 a1 40 ff       	call   0x14006f8d0
   140c656ee:	41 b8 07 00 00 00    	mov    r8d,0x7
   140c656f4:	48 8d 15 1d 8c a8 00 	lea    rdx,[rip+0xa88c1d]        # 0x1416ee318
   140c656fb:	49 8b cf             	mov    rcx,r15
   140c656fe:	48 83 c4 38          	add    rsp,0x38
   140c65702:	41 5f                	pop    r15
   140c65704:	41 5d                	pop    r13
   140c65706:	5f                   	pop    rdi
   140c65707:	5e                   	pop    rsi
   140c65708:	5b                   	pop    rbx
   140c65709:	5d                   	pop    rbp
   140c6570a:	e9 01 a3 40 ff       	jmp    0x14006fa10
   140c6570f:	0f b6 5d 48          	movzx  ebx,BYTE PTR [rbp+0x48]
   140c65713:	8b 75 50             	mov    esi,DWORD PTR [rbp+0x50]
   140c65716:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c6571a:	49 8b cd             	mov    rcx,r13
   140c6571d:	4c 89 64 24 70       	mov    QWORD PTR [rsp+0x70],r12
   140c65722:	4c 89 74 24 30       	mov    QWORD PTR [rsp+0x30],r14
   140c65727:	ff 90 08 05 00 00    	call   QWORD PTR [rax+0x508]
   140c6572d:	49 8b 55 00          	mov    rdx,QWORD PTR [r13+0x0]
   140c65731:	49 8b cd             	mov    rcx,r13
   140c65734:	44 0f b7 f0          	movzx  r14d,ax
   140c65738:	ff 92 18 05 00 00    	call   QWORD PTR [rdx+0x518]
   140c6573e:	49 8b 55 00          	mov    rdx,QWORD PTR [r13+0x0]
   140c65742:	49 8b cd             	mov    rcx,r13
   140c65745:	44 0f b7 e0          	movzx  r12d,ax
   140c65749:	ff 92 d8 05 00 00    	call   QWORD PTR [rdx+0x5d8]
   140c6574f:	84 c0                	test   al,al
   140c65751:	75 09                	jne    0x140c6575c
   140c65753:	66 45 3b f4          	cmp    r14w,r12w
   140c65757:	66 45 0f 4c f4       	cmovl  r14w,r12w
   140c6575c:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65760:	44 8b c6             	mov    r8d,esi
   140c65763:	49 8b d7             	mov    rdx,r15
   140c65766:	49 8b cd             	mov    rcx,r13
   140c65769:	ff 90 f0 05 00 00    	call   QWORD PTR [rax+0x5f0]
   140c6576f:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
   140c65776:	84 db                	test   bl,bl
   140c65778:	0f 85 35 04 00 00    	jne    0x140c65bb3
   140c6577e:	83 3d 13 6b c3 00 01 	cmp    DWORD PTR [rip+0xc36b13],0x1        # 0x14189c298
   140c65785:	75 30                	jne    0x140c657b7
   140c65787:	49 8b 5d 38          	mov    rbx,QWORD PTR [r13+0x38]
   140c6578b:	49 8b 7d 40          	mov    rdi,QWORD PTR [r13+0x40]
   140c6578f:	90                   	nop
   140c65790:	48 3b df             	cmp    rbx,rdi
   140c65793:	73 1e                	jae    0x140c657b3
   140c65795:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c65798:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c6579b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140c6579e:	83 f8 1f             	cmp    eax,0x1f
   140c657a1:	74 06                	je     0x140c657a9
   140c657a3:	48 83 c3 08          	add    rbx,0x8
   140c657a7:	eb e7                	jmp    0x140c65790
   140c657a9:	b2 24                	mov    dl,0x24
   140c657ab:	49 8b cf             	mov    rcx,r15
   140c657ae:	e8 cd 43 45 ff       	call   0x1400b9b80
   140c657b3:	0f b6 5d 48          	movzx  ebx,BYTE PTR [rbp+0x48]
   140c657b7:	41 f7 45 10 00 00 40 	test   DWORD PTR [r13+0x10],0x400000
   140c657be:	00 
   140c657bf:	74 0a                	je     0x140c657cb
   140c657c1:	b2 13                	mov    dl,0x13
   140c657c3:	49 8b cf             	mov    rcx,r15
   140c657c6:	e8 b5 43 45 ff       	call   0x1400b9b80
   140c657cb:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c657cf:	49 8b cd             	mov    rcx,r13
   140c657d2:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c657d8:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c657dc:	66 83 f8 03          	cmp    ax,0x3
   140c657e0:	7c 3a                	jl     0x140c6581c
   140c657e2:	c6 45 40 58          	mov    BYTE PTR [rbp+0x40],0x58
   140c657e6:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c657ea:	4c 8b c6             	mov    r8,rsi
   140c657ed:	0f 1f 00             	nop    DWORD PTR [rax]
   140c657f0:	49 ff c0             	inc    r8
   140c657f3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c657f8:	75 f6                	jne    0x140c657f0
   140c657fa:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c657fe:	49 8b cf             	mov    rcx,r15
   140c65801:	e8 0a a2 40 ff       	call   0x14006fa10
   140c65806:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6580a:	4c 8b c6             	mov    r8,rsi
   140c6580d:	0f 1f 00             	nop    DWORD PTR [rax]
   140c65810:	49 ff c0             	inc    r8
   140c65813:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65818:	75 f6                	jne    0x140c65810
   140c6581a:	eb 3e                	jmp    0x140c6585a
   140c6581c:	66 83 f8 02          	cmp    ax,0x2
   140c65820:	75 1a                	jne    0x140c6583c
   140c65822:	c6 45 40 58          	mov    BYTE PTR [rbp+0x40],0x58
   140c65826:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6582a:	4c 8b c6             	mov    r8,rsi
   140c6582d:	0f 1f 00             	nop    DWORD PTR [rax]
   140c65830:	49 ff c0             	inc    r8
   140c65833:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65838:	75 f6                	jne    0x140c65830
   140c6583a:	eb 1e                	jmp    0x140c6585a
   140c6583c:	66 83 f8 01          	cmp    ax,0x1
   140c65840:	75 24                	jne    0x140c65866
   140c65842:	c6 45 40 78          	mov    BYTE PTR [rbp+0x40],0x78
   140c65846:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6584a:	4c 8b c6             	mov    r8,rsi
   140c6584d:	0f 1f 00             	nop    DWORD PTR [rax]
   140c65850:	49 ff c0             	inc    r8
   140c65853:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65858:	75 f6                	jne    0x140c65850
   140c6585a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c6585e:	49 8b cf             	mov    rcx,r15
   140c65861:	e8 aa a1 40 ff       	call   0x14006fa10
   140c65866:	83 3d 2b 6a c3 00 00 	cmp    DWORD PTR [rip+0xc36a2b],0x0        # 0x14189c298
   140c6586d:	75 57                	jne    0x140c658c6
   140c6586f:	41 f7 45 10 00 40 00 	test   DWORD PTR [r13+0x10],0x4000
   140c65876:	00 
   140c65877:	74 21                	je     0x140c6589a
   140c65879:	c6 45 40 28          	mov    BYTE PTR [rbp+0x40],0x28
   140c6587d:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65881:	4c 8b c6             	mov    r8,rsi
   140c65884:	49 ff c0             	inc    r8
   140c65887:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c6588c:	75 f6                	jne    0x140c65884
   140c6588e:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65892:	49 8b cf             	mov    rcx,r15
   140c65895:	e8 76 a1 40 ff       	call   0x14006fa10
   140c6589a:	41 f7 45 10 00 00 08 	test   DWORD PTR [r13+0x10],0x80000
   140c658a1:	00 
   140c658a2:	74 22                	je     0x140c658c6
   140c658a4:	c6 45 40 7b          	mov    BYTE PTR [rbp+0x40],0x7b
   140c658a8:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c658ac:	4c 8b c6             	mov    r8,rsi
   140c658af:	90                   	nop
   140c658b0:	49 ff c0             	inc    r8
   140c658b3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c658b8:	75 f6                	jne    0x140c658b0
   140c658ba:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c658be:	49 8b cf             	mov    rcx,r15
   140c658c1:	e8 4a a1 40 ff       	call   0x14006fa10
   140c658c6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c658ca:	49 8b cd             	mov    rcx,r13
   140c658cd:	ff 90 d8 05 00 00    	call   QWORD PTR [rax+0x5d8]
   140c658d3:	84 c0                	test   al,al
   140c658d5:	0f 84 ec 00 00 00    	je     0x140c659c7
   140c658db:	83 3d f6 b1 72 01 00 	cmp    DWORD PTR [rip+0x172b1f6],0x0        # 0x142390ad8
   140c658e2:	0f 8e be 00 00 00    	jle    0x140c659a6
   140c658e8:	48 8b 05 e1 b1 72 01 	mov    rax,QWORD PTR [rip+0x172b1e1]        # 0x142390ad0
   140c658ef:	f6 00 04             	test   BYTE PTR [rax],0x4
   140c658f2:	0f 84 ae 00 00 00    	je     0x140c659a6
   140c658f8:	66 41 83 fc 05       	cmp    r12w,0x5
   140c658fd:	75 1d                	jne    0x140c6591c
   140c658ff:	c6 45 40 0f          	mov    BYTE PTR [rbp+0x40],0xf
   140c65903:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65907:	4c 8b c6             	mov    r8,rsi
   140c6590a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140c65910:	49 ff c0             	inc    r8
   140c65913:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65918:	75 f6                	jne    0x140c65910
   140c6591a:	eb 7e                	jmp    0x140c6599a
   140c6591c:	66 41 83 fc 04       	cmp    r12w,0x4
   140c65921:	75 19                	jne    0x140c6593c
   140c65923:	c6 45 40 f0          	mov    BYTE PTR [rbp+0x40],0xf0
   140c65927:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6592b:	4c 8b c6             	mov    r8,rsi
   140c6592e:	66 90                	xchg   ax,ax
   140c65930:	49 ff c0             	inc    r8
   140c65933:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65938:	75 f6                	jne    0x140c65930
   140c6593a:	eb 5e                	jmp    0x140c6599a
   140c6593c:	66 41 83 fc 03       	cmp    r12w,0x3
   140c65941:	75 19                	jne    0x140c6595c
   140c65943:	c6 45 40 2a          	mov    BYTE PTR [rbp+0x40],0x2a
   140c65947:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6594b:	4c 8b c6             	mov    r8,rsi
   140c6594e:	66 90                	xchg   ax,ax
   140c65950:	49 ff c0             	inc    r8
   140c65953:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65958:	75 f6                	jne    0x140c65950
   140c6595a:	eb 3e                	jmp    0x140c6599a
   140c6595c:	66 41 83 fc 02       	cmp    r12w,0x2
   140c65961:	75 19                	jne    0x140c6597c
   140c65963:	c6 45 40 2b          	mov    BYTE PTR [rbp+0x40],0x2b
   140c65967:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6596b:	4c 8b c6             	mov    r8,rsi
   140c6596e:	66 90                	xchg   ax,ax
   140c65970:	49 ff c0             	inc    r8
   140c65973:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65978:	75 f6                	jne    0x140c65970
   140c6597a:	eb 1e                	jmp    0x140c6599a
   140c6597c:	66 41 83 fc 01       	cmp    r12w,0x1
   140c65981:	75 23                	jne    0x140c659a6
   140c65983:	c6 45 40 2d          	mov    BYTE PTR [rbp+0x40],0x2d
   140c65987:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c6598b:	4c 8b c6             	mov    r8,rsi
   140c6598e:	66 90                	xchg   ax,ax
   140c65990:	49 ff c0             	inc    r8
   140c65993:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65998:	75 f6                	jne    0x140c65990
   140c6599a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c6599e:	49 8b cf             	mov    rcx,r15
   140c659a1:	e8 6a a0 40 ff       	call   0x14006fa10
   140c659a6:	c6 45 40 ae          	mov    BYTE PTR [rbp+0x40],0xae
   140c659aa:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c659ae:	4c 8b c6             	mov    r8,rsi
   140c659b1:	49 ff c0             	inc    r8
   140c659b4:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c659b9:	75 f6                	jne    0x140c659b1
   140c659bb:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c659bf:	49 8b cf             	mov    rcx,r15
   140c659c2:	e8 49 a0 40 ff       	call   0x14006fa10
   140c659c7:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c659cb:	49 8b cd             	mov    rcx,r13
   140c659ce:	ff 90 e0 05 00 00    	call   QWORD PTR [rax+0x5e0]
   140c659d4:	48 85 c0             	test   rax,rax
   140c659d7:	74 21                	je     0x140c659fa
   140c659d9:	c6 45 40 11          	mov    BYTE PTR [rbp+0x40],0x11
   140c659dd:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c659e1:	4c 8b c6             	mov    r8,rsi
   140c659e4:	49 ff c0             	inc    r8
   140c659e7:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c659ec:	75 f6                	jne    0x140c659e4
   140c659ee:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c659f2:	49 8b cf             	mov    rcx,r15
   140c659f5:	e8 16 a0 40 ff       	call   0x14006fa10
   140c659fa:	66 41 83 fe 05       	cmp    r14w,0x5
   140c659ff:	75 52                	jne    0x140c65a53
   140c65a01:	c6 45 40 0f          	mov    BYTE PTR [rbp+0x40],0xf
   140c65a05:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65a09:	4c 8b c6             	mov    r8,rsi
   140c65a0c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140c65a10:	49 ff c0             	inc    r8
   140c65a13:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65a18:	75 f6                	jne    0x140c65a10
   140c65a1a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65a1e:	49 8b cf             	mov    rcx,r15
   140c65a21:	e8 ea 9f 40 ff       	call   0x14006fa10
   140c65a26:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65a2a:	44 0f b6 c3          	movzx  r8d,bl
   140c65a2e:	49 8b d7             	mov    rdx,r15
   140c65a31:	49 8b cd             	mov    rcx,r13
   140c65a34:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c65a3a:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65a3e:	49 8b cd             	mov    rcx,r13
   140c65a41:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c65a45:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c65a4b:	0f b7 d8             	movzx  ebx,ax
   140c65a4e:	e9 97 01 00 00       	jmp    0x140c65bea
   140c65a53:	66 41 83 fe 04       	cmp    r14w,0x4
   140c65a58:	75 4e                	jne    0x140c65aa8
   140c65a5a:	c6 45 40 f0          	mov    BYTE PTR [rbp+0x40],0xf0
   140c65a5e:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65a62:	4c 8b c6             	mov    r8,rsi
   140c65a65:	49 ff c0             	inc    r8
   140c65a68:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65a6d:	75 f6                	jne    0x140c65a65
   140c65a6f:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65a73:	49 8b cf             	mov    rcx,r15
   140c65a76:	e8 95 9f 40 ff       	call   0x14006fa10
   140c65a7b:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65a7f:	44 0f b6 c3          	movzx  r8d,bl
   140c65a83:	49 8b d7             	mov    rdx,r15
   140c65a86:	49 8b cd             	mov    rcx,r13
   140c65a89:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c65a8f:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65a93:	49 8b cd             	mov    rcx,r13
   140c65a96:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c65a9a:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c65aa0:	0f b7 d8             	movzx  ebx,ax
   140c65aa3:	e9 60 01 00 00       	jmp    0x140c65c08
   140c65aa8:	66 41 83 fe 03       	cmp    r14w,0x3
   140c65aad:	75 54                	jne    0x140c65b03
   140c65aaf:	c6 45 40 2a          	mov    BYTE PTR [rbp+0x40],0x2a
   140c65ab3:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65ab7:	4c 8b c6             	mov    r8,rsi
   140c65aba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140c65ac0:	49 ff c0             	inc    r8
   140c65ac3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65ac8:	75 f6                	jne    0x140c65ac0
   140c65aca:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65ace:	49 8b cf             	mov    rcx,r15
   140c65ad1:	e8 3a 9f 40 ff       	call   0x14006fa10
   140c65ad6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65ada:	44 0f b6 c3          	movzx  r8d,bl
   140c65ade:	49 8b d7             	mov    rdx,r15
   140c65ae1:	49 8b cd             	mov    rcx,r13
   140c65ae4:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c65aea:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65aee:	49 8b cd             	mov    rcx,r13
   140c65af1:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c65af5:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c65afb:	0f b7 d8             	movzx  ebx,ax
   140c65afe:	e9 23 01 00 00       	jmp    0x140c65c26
   140c65b03:	66 41 83 fe 02       	cmp    r14w,0x2
   140c65b08:	75 4e                	jne    0x140c65b58
   140c65b0a:	c6 45 40 2b          	mov    BYTE PTR [rbp+0x40],0x2b
   140c65b0e:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65b12:	4c 8b c6             	mov    r8,rsi
   140c65b15:	49 ff c0             	inc    r8
   140c65b18:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65b1d:	75 f6                	jne    0x140c65b15
   140c65b1f:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65b23:	49 8b cf             	mov    rcx,r15
   140c65b26:	e8 e5 9e 40 ff       	call   0x14006fa10
   140c65b2b:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65b2f:	44 0f b6 c3          	movzx  r8d,bl
   140c65b33:	49 8b d7             	mov    rdx,r15
   140c65b36:	49 8b cd             	mov    rcx,r13
   140c65b39:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c65b3f:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65b43:	49 8b cd             	mov    rcx,r13
   140c65b46:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c65b4a:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c65b50:	0f b7 d8             	movzx  ebx,ax
   140c65b53:	e9 ec 00 00 00       	jmp    0x140c65c44
   140c65b58:	66 41 83 fe 01       	cmp    r14w,0x1
   140c65b5d:	75 54                	jne    0x140c65bb3
   140c65b5f:	c6 45 40 2d          	mov    BYTE PTR [rbp+0x40],0x2d
   140c65b63:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65b67:	4c 8b c6             	mov    r8,rsi
   140c65b6a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140c65b70:	49 ff c0             	inc    r8
   140c65b73:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65b78:	75 f6                	jne    0x140c65b70
   140c65b7a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65b7e:	49 8b cf             	mov    rcx,r15
   140c65b81:	e8 8a 9e 40 ff       	call   0x14006fa10
   140c65b86:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65b8a:	44 0f b6 c3          	movzx  r8d,bl
   140c65b8e:	49 8b d7             	mov    rdx,r15
   140c65b91:	49 8b cd             	mov    rcx,r13
   140c65b94:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c65b9a:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65b9e:	49 8b cd             	mov    rcx,r13
   140c65ba1:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c65ba5:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c65bab:	0f b7 d8             	movzx  ebx,ax
   140c65bae:	e9 b0 00 00 00       	jmp    0x140c65c63
   140c65bb3:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65bb7:	44 0f b6 c3          	movzx  r8d,bl
   140c65bbb:	49 8b d7             	mov    rdx,r15
   140c65bbe:	49 8b cd             	mov    rcx,r13
   140c65bc1:	ff 90 e8 05 00 00    	call   QWORD PTR [rax+0x5e8]
   140c65bc7:	84 db                	test   bl,bl
   140c65bc9:	0f 85 24 03 00 00    	jne    0x140c65ef3
   140c65bcf:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65bd3:	49 8b cd             	mov    rcx,r13
   140c65bd6:	ff 90 d8 01 00 00    	call   QWORD PTR [rax+0x1d8]
   140c65bdc:	c6 45 41 00          	mov    BYTE PTR [rbp+0x41],0x0
   140c65be0:	0f b7 d8             	movzx  ebx,ax
   140c65be3:	66 41 83 fe 05       	cmp    r14w,0x5
   140c65be8:	75 17                	jne    0x140c65c01
   140c65bea:	c6 45 40 0f          	mov    BYTE PTR [rbp+0x40],0xf
   140c65bee:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65bf2:	4c 8b c6             	mov    r8,rsi
   140c65bf5:	49 ff c0             	inc    r8
   140c65bf8:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65bfd:	75 f6                	jne    0x140c65bf5
   140c65bff:	eb 79                	jmp    0x140c65c7a
   140c65c01:	66 41 83 fe 04       	cmp    r14w,0x4
   140c65c06:	75 17                	jne    0x140c65c1f
   140c65c08:	c6 45 40 f0          	mov    BYTE PTR [rbp+0x40],0xf0
   140c65c0c:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65c10:	4c 8b c6             	mov    r8,rsi
   140c65c13:	49 ff c0             	inc    r8
   140c65c16:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65c1b:	75 f6                	jne    0x140c65c13
   140c65c1d:	eb 5b                	jmp    0x140c65c7a
   140c65c1f:	66 41 83 fe 03       	cmp    r14w,0x3
   140c65c24:	75 17                	jne    0x140c65c3d
   140c65c26:	c6 45 40 2a          	mov    BYTE PTR [rbp+0x40],0x2a
   140c65c2a:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65c2e:	4c 8b c6             	mov    r8,rsi
   140c65c31:	49 ff c0             	inc    r8
   140c65c34:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65c39:	75 f6                	jne    0x140c65c31
   140c65c3b:	eb 3d                	jmp    0x140c65c7a
   140c65c3d:	66 41 83 fe 02       	cmp    r14w,0x2
   140c65c42:	75 18                	jne    0x140c65c5c
   140c65c44:	c6 45 40 2b          	mov    BYTE PTR [rbp+0x40],0x2b
   140c65c48:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65c4c:	4c 8b c6             	mov    r8,rsi
   140c65c4f:	90                   	nop
   140c65c50:	49 ff c0             	inc    r8
   140c65c53:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65c58:	75 f6                	jne    0x140c65c50
   140c65c5a:	eb 1e                	jmp    0x140c65c7a
   140c65c5c:	66 41 83 fe 01       	cmp    r14w,0x1
   140c65c61:	75 23                	jne    0x140c65c86
   140c65c63:	c6 45 40 2d          	mov    BYTE PTR [rbp+0x40],0x2d
   140c65c67:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65c6b:	4c 8b c6             	mov    r8,rsi
   140c65c6e:	66 90                	xchg   ax,ax
   140c65c70:	49 ff c0             	inc    r8
   140c65c73:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65c78:	75 f6                	jne    0x140c65c70
   140c65c7a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65c7e:	49 8b cf             	mov    rcx,r15
   140c65c81:	e8 8a 9d 40 ff       	call   0x14006fa10
   140c65c86:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65c8a:	49 8b cd             	mov    rcx,r13
   140c65c8d:	ff 90 e0 05 00 00    	call   QWORD PTR [rax+0x5e0]
   140c65c93:	48 85 c0             	test   rax,rax
   140c65c96:	74 21                	je     0x140c65cb9
   140c65c98:	c6 45 40 10          	mov    BYTE PTR [rbp+0x40],0x10
   140c65c9c:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65ca0:	4c 8b c6             	mov    r8,rsi
   140c65ca3:	49 ff c0             	inc    r8
   140c65ca6:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65cab:	75 f6                	jne    0x140c65ca3
   140c65cad:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65cb1:	49 8b cf             	mov    rcx,r15
   140c65cb4:	e8 57 9d 40 ff       	call   0x14006fa10
   140c65cb9:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   140c65cbd:	49 8b cd             	mov    rcx,r13
   140c65cc0:	ff 90 d8 05 00 00    	call   QWORD PTR [rax+0x5d8]
   140c65cc6:	84 c0                	test   al,al
   140c65cc8:	0f 84 e8 00 00 00    	je     0x140c65db6
   140c65cce:	c6 45 40 af          	mov    BYTE PTR [rbp+0x40],0xaf
   140c65cd2:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65cd6:	4c 8b c6             	mov    r8,rsi
   140c65cd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140c65ce0:	49 ff c0             	inc    r8
   140c65ce3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65ce8:	75 f6                	jne    0x140c65ce0
   140c65cea:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65cee:	49 8b cf             	mov    rcx,r15
   140c65cf1:	e8 1a 9d 40 ff       	call   0x14006fa10
   140c65cf6:	83 3d db ad 72 01 00 	cmp    DWORD PTR [rip+0x172addb],0x0        # 0x142390ad8
   140c65cfd:	0f 8e b3 00 00 00    	jle    0x140c65db6
   140c65d03:	48 8b 05 c6 ad 72 01 	mov    rax,QWORD PTR [rip+0x172adc6]        # 0x142390ad0
   140c65d0a:	f6 00 04             	test   BYTE PTR [rax],0x4
   140c65d0d:	0f 84 a3 00 00 00    	je     0x140c65db6
   140c65d13:	66 41 83 fc 05       	cmp    r12w,0x5
   140c65d18:	75 17                	jne    0x140c65d31
   140c65d1a:	c6 45 40 0f          	mov    BYTE PTR [rbp+0x40],0xf
   140c65d1e:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65d22:	4c 8b c6             	mov    r8,rsi
   140c65d25:	49 ff c0             	inc    r8
   140c65d28:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65d2d:	75 f6                	jne    0x140c65d25
   140c65d2f:	eb 79                	jmp    0x140c65daa
   140c65d31:	66 41 83 fc 04       	cmp    r12w,0x4
   140c65d36:	75 17                	jne    0x140c65d4f
   140c65d38:	c6 45 40 f0          	mov    BYTE PTR [rbp+0x40],0xf0
   140c65d3c:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65d40:	4c 8b c6             	mov    r8,rsi
   140c65d43:	49 ff c0             	inc    r8
   140c65d46:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65d4b:	75 f6                	jne    0x140c65d43
   140c65d4d:	eb 5b                	jmp    0x140c65daa
   140c65d4f:	66 41 83 fc 03       	cmp    r12w,0x3
   140c65d54:	75 17                	jne    0x140c65d6d
   140c65d56:	c6 45 40 2a          	mov    BYTE PTR [rbp+0x40],0x2a
   140c65d5a:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65d5e:	4c 8b c6             	mov    r8,rsi
   140c65d61:	49 ff c0             	inc    r8
   140c65d64:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65d69:	75 f6                	jne    0x140c65d61
   140c65d6b:	eb 3d                	jmp    0x140c65daa
   140c65d6d:	66 41 83 fc 02       	cmp    r12w,0x2
   140c65d72:	75 18                	jne    0x140c65d8c
   140c65d74:	c6 45 40 2b          	mov    BYTE PTR [rbp+0x40],0x2b
   140c65d78:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65d7c:	4c 8b c6             	mov    r8,rsi
   140c65d7f:	90                   	nop
   140c65d80:	49 ff c0             	inc    r8
   140c65d83:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65d88:	75 f6                	jne    0x140c65d80
   140c65d8a:	eb 1e                	jmp    0x140c65daa
   140c65d8c:	66 41 83 fc 01       	cmp    r12w,0x1
   140c65d91:	75 23                	jne    0x140c65db6
   140c65d93:	c6 45 40 2d          	mov    BYTE PTR [rbp+0x40],0x2d
   140c65d97:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65d9b:	4c 8b c6             	mov    r8,rsi
   140c65d9e:	66 90                	xchg   ax,ax
   140c65da0:	49 ff c0             	inc    r8
   140c65da3:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65da8:	75 f6                	jne    0x140c65da0
   140c65daa:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65dae:	49 8b cf             	mov    rcx,r15
   140c65db1:	e8 5a 9c 40 ff       	call   0x14006fa10
   140c65db6:	83 3d db 64 c3 00 00 	cmp    DWORD PTR [rip+0xc364db],0x0        # 0x14189c298
   140c65dbd:	75 57                	jne    0x140c65e16
   140c65dbf:	41 f7 45 10 00 00 08 	test   DWORD PTR [r13+0x10],0x80000
   140c65dc6:	00 
   140c65dc7:	74 21                	je     0x140c65dea
   140c65dc9:	c6 45 40 7d          	mov    BYTE PTR [rbp+0x40],0x7d
   140c65dcd:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65dd1:	4c 8b c6             	mov    r8,rsi
   140c65dd4:	49 ff c0             	inc    r8
   140c65dd7:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65ddc:	75 f6                	jne    0x140c65dd4
   140c65dde:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65de2:	49 8b cf             	mov    rcx,r15
   140c65de5:	e8 26 9c 40 ff       	call   0x14006fa10
   140c65dea:	41 f7 45 10 00 40 00 	test   DWORD PTR [r13+0x10],0x4000
   140c65df1:	00 
   140c65df2:	74 22                	je     0x140c65e16
   140c65df4:	c6 45 40 29          	mov    BYTE PTR [rbp+0x40],0x29
   140c65df8:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65dfc:	4c 8b c6             	mov    r8,rsi
   140c65dff:	90                   	nop
   140c65e00:	49 ff c0             	inc    r8
   140c65e03:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65e08:	75 f6                	jne    0x140c65e00
   140c65e0a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65e0e:	49 8b cf             	mov    rcx,r15
   140c65e11:	e8 fa 9b 40 ff       	call   0x14006fa10
   140c65e16:	66 83 fb 03          	cmp    bx,0x3
   140c65e1a:	7c 3f                	jl     0x140c65e5b
   140c65e1c:	c6 45 40 58          	mov    BYTE PTR [rbp+0x40],0x58
   140c65e20:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65e24:	4c 8b c6             	mov    r8,rsi
   140c65e27:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140c65e2e:	00 00 
   140c65e30:	49 ff c0             	inc    r8
   140c65e33:	42 80 3c 00 00       	cmp    BYTE PTR [rax+r8*1],0x0
   140c65e38:	75 f6                	jne    0x140c65e30
   140c65e3a:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65e3e:	49 8b cf             	mov    rcx,r15
   140c65e41:	e8 ca 9b 40 ff       	call   0x14006fa10
   140c65e46:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65e4a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140c65e50:	48 ff c6             	inc    rsi
   140c65e53:	80 3c 30 00          	cmp    BYTE PTR [rax+rsi*1],0x0
   140c65e57:	75 f7                	jne    0x140c65e50
   140c65e59:	eb 3e                	jmp    0x140c65e99
   140c65e5b:	66 83 fb 02          	cmp    bx,0x2
   140c65e5f:	75 1a                	jne    0x140c65e7b
   140c65e61:	c6 45 40 58          	mov    BYTE PTR [rbp+0x40],0x58
   140c65e65:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65e69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140c65e70:	48 ff c6             	inc    rsi
   140c65e73:	80 3c 30 00          	cmp    BYTE PTR [rax+rsi*1],0x0
   140c65e77:	75 f7                	jne    0x140c65e70
   140c65e79:	eb 1e                	jmp    0x140c65e99
   140c65e7b:	66 83 fb 01          	cmp    bx,0x1
   140c65e7f:	75 27                	jne    0x140c65ea8
   140c65e81:	c6 45 40 78          	mov    BYTE PTR [rbp+0x40],0x78
   140c65e85:	48 8d 45 40          	lea    rax,[rbp+0x40]
   140c65e89:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140c65e90:	48 ff c6             	inc    rsi
   140c65e93:	80 3c 30 00          	cmp    BYTE PTR [rax+rsi*1],0x0
   140c65e97:	75 f7                	jne    0x140c65e90
   140c65e99:	4c 8b c6             	mov    r8,rsi
   140c65e9c:	48 8d 55 40          	lea    rdx,[rbp+0x40]
   140c65ea0:	49 8b cf             	mov    rcx,r15
   140c65ea3:	e8 68 9b 40 ff       	call   0x14006fa10
   140c65ea8:	41 f7 45 10 00 00 40 	test   DWORD PTR [r13+0x10],0x400000
   140c65eaf:	00 
   140c65eb0:	74 0a                	je     0x140c65ebc
   140c65eb2:	b2 13                	mov    dl,0x13
   140c65eb4:	49 8b cf             	mov    rcx,r15
   140c65eb7:	e8 c4 3c 45 ff       	call   0x1400b9b80
   140c65ebc:	83 3d d5 63 c3 00 01 	cmp    DWORD PTR [rip+0xc363d5],0x1        # 0x14189c298
   140c65ec3:	75 2e                	jne    0x140c65ef3
   140c65ec5:	49 8b 5d 38          	mov    rbx,QWORD PTR [r13+0x38]
   140c65ec9:	49 8b 7d 40          	mov    rdi,QWORD PTR [r13+0x40]
   140c65ecd:	0f 1f 00             	nop    DWORD PTR [rax]
   140c65ed0:	48 3b df             	cmp    rbx,rdi
   140c65ed3:	73 1e                	jae    0x140c65ef3
   140c65ed5:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140c65ed8:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140c65edb:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140c65ede:	83 f8 1f             	cmp    eax,0x1f
   140c65ee1:	74 06                	je     0x140c65ee9
   140c65ee3:	48 83 c3 08          	add    rbx,0x8
   140c65ee7:	eb e7                	jmp    0x140c65ed0
   140c65ee9:	b2 24                	mov    dl,0x24
   140c65eeb:	49 8b cf             	mov    rcx,r15
   140c65eee:	e8 8d 3c 45 ff       	call   0x1400b9b80
   140c65ef3:	4c 8b 64 24 70       	mov    r12,QWORD PTR [rsp+0x70]
   140c65ef8:	4c 8b 74 24 30       	mov    r14,QWORD PTR [rsp+0x30]
   140c65efd:	48 83 c4 38          	add    rsp,0x38
   140c65f01:	41 5f                	pop    r15
   140c65f03:	41 5d                	pop    r13
   140c65f05:	5f                   	pop    rdi
   140c65f06:	5e                   	pop    rsi
   140c65f07:	5b                   	pop    rbx
   140c65f08:	5d                   	pop    rbp
   140c65f09:	c3                   	ret
