
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000141331500 <.text+0x1330500>:
   141331500:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   141331505:	55                   	push   rbp
   141331506:	56                   	push   rsi
   141331507:	57                   	push   rdi
   141331508:	41 54                	push   r12
   14133150a:	41 55                	push   r13
   14133150c:	41 56                	push   r14
   14133150e:	41 57                	push   r15
   141331510:	48 8d 6c 24 d9       	lea    rbp,[rsp-0x27]
   141331515:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
   14133151c:	48 8b 05 1d ab 56 00 	mov    rax,QWORD PTR [rip+0x56ab1d]        # 0x14189c040
   141331523:	48 33 c4             	xor    rax,rsp
   141331526:	48 89 45 1f          	mov    QWORD PTR [rbp+0x1f],rax
   14133152a:	4c 8b f2             	mov    r14,rdx
   14133152d:	4c 8b e9             	mov    r13,rcx
   141331530:	8b 05 8e ad 56 00    	mov    eax,DWORD PTR [rip+0x56ad8e]        # 0x14189c2c4
   141331536:	83 c0 fc             	add    eax,0xfffffffc
   141331539:	83 f8 01             	cmp    eax,0x1
   14133153c:	0f 86 66 1f 00 00    	jbe    0x1413334a8
   141331542:	48 8d 71 08          	lea    rsi,[rcx+0x8]
   141331546:	48 89 74 24 48       	mov    QWORD PTR [rsp+0x48],rsi
   14133154b:	0f b7 81 a0 00 00 00 	movzx  eax,WORD PTR [rcx+0xa0]
   141331552:	66 89 44 24 32       	mov    WORD PTR [rsp+0x32],ax
   141331557:	4c 8d 81 74 12 00 00 	lea    r8,[rcx+0x1274]
   14133155e:	8b 91 30 0c 00 00    	mov    edx,DWORD PTR [rcx+0xc30]
   141331564:	48 8d 0d 4d 87 1c 01 	lea    rcx,[rip+0x11c874d]        # 0x1424f9cb8
   14133156b:	e8 40 1b 82 ff       	call   0x140b530b0
   141331570:	45 33 e4             	xor    r12d,r12d
   141331573:	48 85 c0             	test   rax,rax
   141331576:	0f 84 4c 05 00 00    	je     0x141331ac8
   14133157c:	48 8b 80 30 01 00 00 	mov    rax,QWORD PTR [rax+0x130]
   141331583:	48 85 c0             	test   rax,rax
   141331586:	75 05                	jne    0x14133158d
   141331588:	45 8b fc             	mov    r15d,r12d
   14133158b:	eb 2a                	jmp    0x1413315b7
   14133158d:	48 8b 48 58          	mov    rcx,QWORD PTR [rax+0x58]
   141331591:	48 85 c9             	test   rcx,rcx
   141331594:	75 05                	jne    0x14133159b
   141331596:	4d 8b fc             	mov    r15,r12
   141331599:	eb 1c                	jmp    0x1413315b7
   14133159b:	8b 51 30             	mov    edx,DWORD PTR [rcx+0x30]
   14133159e:	83 fa ff             	cmp    edx,0xffffffff
   1413315a1:	75 05                	jne    0x1413315a8
   1413315a3:	4d 8b fc             	mov    r15,r12
   1413315a6:	eb 0f                	jmp    0x1413315b7
   1413315a8:	48 8d 0d 39 67 1b 01 	lea    rcx,[rip+0x11b6739]        # 0x1424e7ce8
   1413315af:	e8 bc 0f d4 fe       	call   0x140072570
   1413315b4:	4c 8b f8             	mov    r15,rax
   1413315b7:	4c 89 7c 24 40       	mov    QWORD PTR [rsp+0x40],r15
   1413315bc:	4d 85 ff             	test   r15,r15
   1413315bf:	0f 84 08 05 00 00    	je     0x141331acd
   1413315c5:	49 8b cf             	mov    rcx,r15
   1413315c8:	e8 23 8f 90 ff       	call   0x140c3a4f0
   1413315cd:	48 8b f8             	mov    rdi,rax
   1413315d0:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   1413315d5:	45 8b 9f 88 00 00 00 	mov    r11d,DWORD PTR [r15+0x88]
   1413315dc:	41 83 fb ff          	cmp    r11d,0xffffffff
   1413315e0:	0f 84 c9 04 00 00    	je     0x141331aaf
   1413315e6:	4c 8b 0d 33 87 1c 01 	mov    r9,QWORD PTR [rip+0x11c8733]        # 0x1424f9d20
   1413315ed:	48 8b 1d 24 87 1c 01 	mov    rbx,QWORD PTR [rip+0x11c8724]        # 0x1424f9d18
   1413315f4:	4c 2b cb             	sub    r9,rbx
   1413315f7:	49 c1 f9 03          	sar    r9,0x3
   1413315fb:	4d 85 c9             	test   r9,r9
   1413315fe:	74 3c                	je     0x14133163c
   141331600:	45 8b c4             	mov    r8d,r12d
   141331603:	41 83 e9 01          	sub    r9d,0x1
   141331607:	78 33                	js     0x14133163c
   141331609:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   141331610:	43 8d 0c 01          	lea    ecx,[r9+r8*1]
   141331614:	d1 f9                	sar    ecx,1
   141331616:	48 63 c1             	movsxd rax,ecx
   141331619:	48 8b 14 c3          	mov    rdx,QWORD PTR [rbx+rax*8]
   14133161d:	44 39 9a e0 00 00 00 	cmp    DWORD PTR [rdx+0xe0],r11d
   141331624:	74 19                	je     0x14133163f
   141331626:	8d 41 ff             	lea    eax,[rcx-0x1]
   141331629:	41 0f 4e c1          	cmovle eax,r9d
   14133162d:	44 8b c8             	mov    r9d,eax
   141331630:	8d 41 01             	lea    eax,[rcx+0x1]
   141331633:	44 0f 4e c0          	cmovle r8d,eax
   141331637:	45 3b c1             	cmp    r8d,r9d
   14133163a:	7e d4                	jle    0x141331610
   14133163c:	49 8b d4             	mov    rdx,r12
   14133163f:	48 85 d2             	test   rdx,rdx
   141331642:	0f 84 67 04 00 00    	je     0x141331aaf
   141331648:	44 39 a2 d0 00 00 00 	cmp    DWORD PTR [rdx+0xd0],r12d
   14133164f:	0f 8e 5a 04 00 00    	jle    0x141331aaf
   141331655:	48 8b 82 c8 00 00 00 	mov    rax,QWORD PTR [rdx+0xc8]
   14133165c:	f6 00 04             	test   BYTE PTR [rax],0x4
   14133165f:	0f 85 08 02 00 00    	jne    0x14133186d
   141331665:	f6 00 08             	test   BYTE PTR [rax],0x8
   141331668:	0f 84 41 04 00 00    	je     0x141331aaf
   14133166e:	41 b8 09 00 00 00    	mov    r8d,0x9
   141331674:	48 8d 15 7d 15 45 00 	lea    rdx,[rip+0x45157d]        # 0x141782bf8
   14133167b:	49 8b ce             	mov    rcx,r14
   14133167e:	e8 4d e2 d3 fe       	call   0x14006f8d0
   141331683:	83 3d 3a ac 56 00 01 	cmp    DWORD PTR [rip+0x56ac3a],0x1        # 0x14189c2c4
   14133168a:	0f 85 87 01 00 00    	jne    0x141331817
   141331690:	48 8b 05 39 3a 0b 01 	mov    rax,QWORD PTR [rip+0x10b3a39]        # 0x1423e50d0
   141331697:	48 2b 05 2a 3a 0b 01 	sub    rax,QWORD PTR [rip+0x10b3a2a]        # 0x1423e50c8
   14133169e:	48 c1 f8 03          	sar    rax,0x3
   1413316a2:	48 85 c0             	test   rax,rax
   1413316a5:	0f 84 35 1e 00 00    	je     0x1413334e0
   1413316ab:	48 8b 15 5e 3a 0b 01 	mov    rdx,QWORD PTR [rip+0x10b3a5e]        # 0x1423e5110
   1413316b2:	48 85 d2             	test   rdx,rdx
   1413316b5:	0f 84 25 1e 00 00    	je     0x1413334e0
   1413316bb:	32 db                	xor    bl,bl
   1413316bd:	4c 8d 82 74 12 00 00 	lea    r8,[rdx+0x1274]
   1413316c4:	8b 92 30 0c 00 00    	mov    edx,DWORD PTR [rdx+0xc30]
   1413316ca:	48 8d 0d e7 85 1c 01 	lea    rcx,[rip+0x11c85e7]        # 0x1424f9cb8
   1413316d1:	e8 da 19 82 ff       	call   0x140b530b0
   1413316d6:	48 8b f8             	mov    rdi,rax
   1413316d9:	48 85 c0             	test   rax,rax
   1413316dc:	0f 84 fe 1d 00 00    	je     0x1413334e0
   1413316e2:	41 8b 8d 30 0c 00 00 	mov    ecx,DWORD PTR [r13+0xc30]
   1413316e9:	83 f9 ff             	cmp    ecx,0xffffffff
   1413316ec:	74 40                	je     0x14133172e
   1413316ee:	48 8b 90 30 01 00 00 	mov    rdx,QWORD PTR [rax+0x130]
   1413316f5:	48 85 d2             	test   rdx,rdx
   1413316f8:	74 34                	je     0x14133172e
   1413316fa:	4c 39 62 60          	cmp    QWORD PTR [rdx+0x60],r12
   1413316fe:	74 2e                	je     0x14133172e
   141331700:	48 8b 52 60          	mov    rdx,QWORD PTR [rdx+0x60]
   141331704:	e8 b7 86 d8 fe       	call   0x1400b9dc0
   141331709:	48 85 c0             	test   rax,rax
   14133170c:	74 20                	je     0x14133172e
   14133170e:	f6 40 04 01          	test   BYTE PTR [rax+0x4],0x1
   141331712:	75 76                	jne    0x14133178a
   141331714:	48 8d 50 08          	lea    rdx,[rax+0x8]
   141331718:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
   14133171b:	e8 50 88 d8 fe       	call   0x1400b9f70
   141331720:	0f b6 db             	movzx  ebx,bl
   141331723:	b9 01 00 00 00       	mov    ecx,0x1
   141331728:	83 f8 ff             	cmp    eax,0xffffffff
   14133172b:	0f 45 d9             	cmovne ebx,ecx
   14133172e:	45 8b 85 4c 01 00 00 	mov    r8d,DWORD PTR [r13+0x14c]
   141331735:	41 83 f8 ff          	cmp    r8d,0xffffffff
   141331739:	74 42                	je     0x14133177d
   14133173b:	48 8b 87 30 01 00 00 	mov    rax,QWORD PTR [rdi+0x130]
   141331742:	48 85 c0             	test   rax,rax
   141331745:	74 36                	je     0x14133177d
   141331747:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   14133174b:	48 85 d2             	test   rdx,rdx
   14133174e:	74 2d                	je     0x14133177d
   141331750:	48 83 c2 48          	add    rdx,0x48
   141331754:	48 8d 4d 87          	lea    rcx,[rbp-0x79]
   141331758:	e8 83 94 d8 fe       	call   0x1400babe0
   14133175d:	c7 44 24 40 ff ff ff 	mov    DWORD PTR [rsp+0x40],0xffffffff
   141331764:	ff 
   141331765:	44 89 64 24 44       	mov    DWORD PTR [rsp+0x44],r12d
   14133176a:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   14133176f:	44 38 65 8f          	cmp    BYTE PTR [rbp-0x71],r12b
   141331773:	48 0f 45 45 87       	cmovne rax,QWORD PTR [rbp-0x79]
   141331778:	83 f8 ff             	cmp    eax,0xffffffff
   14133177b:	75 0d                	jne    0x14133178a
   14133177d:	84 db                	test   bl,bl
   14133177f:	0f 84 5b 1d 00 00    	je     0x1413334e0
   141331785:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   14133178a:	b2 20                	mov    dl,0x20
   14133178c:	49 8b ce             	mov    rcx,r14
   14133178f:	e8 ec 83 d8 fe       	call   0x1400b9b80
   141331794:	0f 57 c0             	xorps  xmm0,xmm0
   141331797:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14133179b:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14133179f:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   1413317a6:	00 
   1413317a7:	44 88 65 bf          	mov    BYTE PTR [rbp-0x41],r12b
   1413317ab:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   1413317af:	48 8b ce             	mov    rcx,rsi
   1413317b2:	e8 79 28 76 ff       	call   0x140a94030
   1413317b7:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   1413317bb:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   1413317c0:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   1413317c5:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   1413317c9:	49 8b ce             	mov    rcx,r14
   1413317cc:	e8 3f e2 d3 fe       	call   0x14006fa10
   1413317d1:	90                   	nop
   1413317d2:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   1413317d6:	48 83 fa 0f          	cmp    rdx,0xf
   1413317da:	0f 86 00 1d 00 00    	jbe    0x1413334e0
   1413317e0:	48 ff c2             	inc    rdx
   1413317e3:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   1413317e7:	48 8b c1             	mov    rax,rcx
   1413317ea:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1413317f1:	0f 82 ae 02 00 00    	jb     0x141331aa5
   1413317f7:	48 83 c2 27          	add    rdx,0x27
   1413317fb:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1413317ff:	48 2b c1             	sub    rax,rcx
   141331802:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141331806:	48 83 f8 1f          	cmp    rax,0x1f
   14133180a:	0f 86 95 02 00 00    	jbe    0x141331aa5
   141331810:	ff 15 12 43 2b 00    	call   QWORD PTR [rip+0x2b4312]        # 0x1415e5b28
   141331816:	cc                   	int3
   141331817:	b2 20                	mov    dl,0x20
   141331819:	49 8b ce             	mov    rcx,r14
   14133181c:	e8 5f 83 d8 fe       	call   0x1400b9b80
   141331821:	0f 57 c0             	xorps  xmm0,xmm0
   141331824:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   141331828:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   14133182c:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   141331833:	00 
   141331834:	44 88 65 bf          	mov    BYTE PTR [rbp-0x41],r12b
   141331838:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14133183c:	48 8b cf             	mov    rcx,rdi
   14133183f:	e8 ec 27 76 ff       	call   0x140a94030
   141331844:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   141331848:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   14133184d:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   141331852:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   141331856:	49 8b ce             	mov    rcx,r14
   141331859:	e8 b2 e1 d3 fe       	call   0x14006fa10
   14133185e:	90                   	nop
   14133185f:	48 8d 4d bf          	lea    rcx,[rbp-0x41]
   141331863:	e8 e8 df d3 fe       	call   0x14006f850
   141331868:	e9 73 1c 00 00       	jmp    0x1413334e0
   14133186d:	41 b8 09 00 00 00    	mov    r8d,0x9
   141331873:	48 8d 15 26 14 45 00 	lea    rdx,[rip+0x451426]        # 0x141782ca0
   14133187a:	49 8b ce             	mov    rcx,r14
   14133187d:	e8 4e e0 d3 fe       	call   0x14006f8d0
   141331882:	44 38 67 72          	cmp    BYTE PTR [rdi+0x72],r12b
   141331886:	0f 84 54 1c 00 00    	je     0x1413334e0
   14133188c:	83 3d 31 aa 56 00 01 	cmp    DWORD PTR [rip+0x56aa31],0x1        # 0x14189c2c4
   141331893:	0f 85 87 01 00 00    	jne    0x141331a20
   141331899:	48 8b 05 30 38 0b 01 	mov    rax,QWORD PTR [rip+0x10b3830]        # 0x1423e50d0
   1413318a0:	48 2b 05 21 38 0b 01 	sub    rax,QWORD PTR [rip+0x10b3821]        # 0x1423e50c8
   1413318a7:	48 c1 f8 03          	sar    rax,0x3
   1413318ab:	48 85 c0             	test   rax,rax
   1413318ae:	0f 84 2c 1c 00 00    	je     0x1413334e0
   1413318b4:	48 8b 15 55 38 0b 01 	mov    rdx,QWORD PTR [rip+0x10b3855]        # 0x1423e5110
   1413318bb:	48 85 d2             	test   rdx,rdx
   1413318be:	0f 84 1c 1c 00 00    	je     0x1413334e0
   1413318c4:	32 db                	xor    bl,bl
   1413318c6:	4c 8d 82 74 12 00 00 	lea    r8,[rdx+0x1274]
   1413318cd:	8b 92 30 0c 00 00    	mov    edx,DWORD PTR [rdx+0xc30]
   1413318d3:	48 8d 0d de 83 1c 01 	lea    rcx,[rip+0x11c83de]        # 0x1424f9cb8
   1413318da:	e8 d1 17 82 ff       	call   0x140b530b0
   1413318df:	48 8b f8             	mov    rdi,rax
   1413318e2:	48 85 c0             	test   rax,rax
   1413318e5:	0f 84 f5 1b 00 00    	je     0x1413334e0
   1413318eb:	41 8b 8d 30 0c 00 00 	mov    ecx,DWORD PTR [r13+0xc30]
   1413318f2:	83 f9 ff             	cmp    ecx,0xffffffff
   1413318f5:	74 40                	je     0x141331937
   1413318f7:	48 8b 90 30 01 00 00 	mov    rdx,QWORD PTR [rax+0x130]
   1413318fe:	48 85 d2             	test   rdx,rdx
   141331901:	74 34                	je     0x141331937
   141331903:	4c 39 62 60          	cmp    QWORD PTR [rdx+0x60],r12
   141331907:	74 2e                	je     0x141331937
   141331909:	48 8b 52 60          	mov    rdx,QWORD PTR [rdx+0x60]
   14133190d:	e8 ae 84 d8 fe       	call   0x1400b9dc0
   141331912:	48 85 c0             	test   rax,rax
   141331915:	74 20                	je     0x141331937
   141331917:	f6 40 04 01          	test   BYTE PTR [rax+0x4],0x1
   14133191b:	75 76                	jne    0x141331993
   14133191d:	48 8d 50 08          	lea    rdx,[rax+0x8]
   141331921:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
   141331924:	e8 47 86 d8 fe       	call   0x1400b9f70
   141331929:	0f b6 db             	movzx  ebx,bl
   14133192c:	b9 01 00 00 00       	mov    ecx,0x1
   141331931:	83 f8 ff             	cmp    eax,0xffffffff
   141331934:	0f 45 d9             	cmovne ebx,ecx
   141331937:	45 8b 85 4c 01 00 00 	mov    r8d,DWORD PTR [r13+0x14c]
   14133193e:	41 83 f8 ff          	cmp    r8d,0xffffffff
   141331942:	74 42                	je     0x141331986
   141331944:	48 8b 87 30 01 00 00 	mov    rax,QWORD PTR [rdi+0x130]
   14133194b:	48 85 c0             	test   rax,rax
   14133194e:	74 36                	je     0x141331986
   141331950:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   141331954:	48 85 d2             	test   rdx,rdx
   141331957:	74 2d                	je     0x141331986
   141331959:	48 83 c2 48          	add    rdx,0x48
   14133195d:	48 8d 4d 87          	lea    rcx,[rbp-0x79]
   141331961:	e8 7a 92 d8 fe       	call   0x1400babe0
   141331966:	c7 44 24 40 ff ff ff 	mov    DWORD PTR [rsp+0x40],0xffffffff
   14133196d:	ff 
   14133196e:	44 89 64 24 44       	mov    DWORD PTR [rsp+0x44],r12d
   141331973:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   141331978:	44 38 65 8f          	cmp    BYTE PTR [rbp-0x71],r12b
   14133197c:	48 0f 45 45 87       	cmovne rax,QWORD PTR [rbp-0x79]
   141331981:	83 f8 ff             	cmp    eax,0xffffffff
   141331984:	75 0d                	jne    0x141331993
   141331986:	84 db                	test   bl,bl
   141331988:	0f 84 52 1b 00 00    	je     0x1413334e0
   14133198e:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   141331993:	b2 20                	mov    dl,0x20
   141331995:	49 8b ce             	mov    rcx,r14
   141331998:	e8 e3 81 d8 fe       	call   0x1400b9b80
   14133199d:	0f 57 c0             	xorps  xmm0,xmm0
   1413319a0:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   1413319a4:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   1413319a8:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   1413319af:	00 
   1413319b0:	44 88 65 bf          	mov    BYTE PTR [rbp-0x41],r12b
   1413319b4:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   1413319b8:	48 8b ce             	mov    rcx,rsi
   1413319bb:	e8 70 26 76 ff       	call   0x140a94030
   1413319c0:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   1413319c4:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   1413319c9:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   1413319ce:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   1413319d2:	49 8b ce             	mov    rcx,r14
   1413319d5:	e8 36 e0 d3 fe       	call   0x14006fa10
   1413319da:	90                   	nop
   1413319db:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   1413319df:	48 83 fa 0f          	cmp    rdx,0xf
   1413319e3:	0f 86 f7 1a 00 00    	jbe    0x1413334e0
   1413319e9:	48 ff c2             	inc    rdx
   1413319ec:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   1413319f0:	48 8b c1             	mov    rax,rcx
   1413319f3:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1413319fa:	0f 82 a5 00 00 00    	jb     0x141331aa5
   141331a00:	48 83 c2 27          	add    rdx,0x27
   141331a04:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141331a08:	48 2b c1             	sub    rax,rcx
   141331a0b:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141331a0f:	48 83 f8 1f          	cmp    rax,0x1f
   141331a13:	0f 86 8c 00 00 00    	jbe    0x141331aa5
   141331a19:	ff 15 09 41 2b 00    	call   QWORD PTR [rip+0x2b4109]        # 0x1415e5b28
   141331a1f:	cc                   	int3
   141331a20:	b2 20                	mov    dl,0x20
   141331a22:	49 8b ce             	mov    rcx,r14
   141331a25:	e8 56 81 d8 fe       	call   0x1400b9b80
   141331a2a:	0f 57 c0             	xorps  xmm0,xmm0
   141331a2d:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   141331a31:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   141331a35:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   141331a3c:	00 
   141331a3d:	44 88 65 bf          	mov    BYTE PTR [rbp-0x41],r12b
   141331a41:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   141331a45:	48 8b cf             	mov    rcx,rdi
   141331a48:	e8 e3 25 76 ff       	call   0x140a94030
   141331a4d:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   141331a51:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   141331a56:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   141331a5b:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   141331a5f:	49 8b ce             	mov    rcx,r14
   141331a62:	e8 a9 df d3 fe       	call   0x14006fa10
   141331a67:	90                   	nop
   141331a68:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   141331a6c:	48 83 fa 0f          	cmp    rdx,0xf
   141331a70:	0f 86 6a 1a 00 00    	jbe    0x1413334e0
   141331a76:	48 ff c2             	inc    rdx
   141331a79:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   141331a7d:	48 8b c1             	mov    rax,rcx
   141331a80:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141331a87:	72 1c                	jb     0x141331aa5
   141331a89:	48 83 c2 27          	add    rdx,0x27
   141331a8d:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141331a91:	48 2b c1             	sub    rax,rcx
   141331a94:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141331a98:	48 83 f8 1f          	cmp    rax,0x1f
   141331a9c:	76 07                	jbe    0x141331aa5
   141331a9e:	ff 15 84 40 2b 00    	call   QWORD PTR [rip+0x2b4084]        # 0x1415e5b28
   141331aa4:	cc                   	int3
   141331aa5:	e8 d6 7b 20 00       	call   0x141539680
   141331aaa:	e9 31 1a 00 00       	jmp    0x1413334e0
   141331aaf:	41 0f b7 87 ac 00 00 	movzx  eax,WORD PTR [r15+0xac]
   141331ab6:	00 
   141331ab7:	66 83 f8 ff          	cmp    ax,0xffff
   141331abb:	74 10                	je     0x141331acd
   141331abd:	44 0f b7 c8          	movzx  r9d,ax
   141331ac1:	66 89 44 24 32       	mov    WORD PTR [rsp+0x32],ax
   141331ac6:	eb 0b                	jmp    0x141331ad3
   141331ac8:	4c 89 64 24 40       	mov    QWORD PTR [rsp+0x40],r12
   141331acd:	44 0f b7 4c 24 32    	movzx  r9d,WORD PTR [rsp+0x32]
   141331ad3:	0f 57 c0             	xorps  xmm0,xmm0
   141331ad6:	0f 11 45 ff          	movups XMMWORD PTR [rbp-0x1],xmm0
   141331ada:	4c 89 65 0f          	mov    QWORD PTR [rbp+0xf],r12
   141331ade:	48 c7 45 17 0f 00 00 	mov    QWORD PTR [rbp+0x17],0xf
   141331ae5:	00 
   141331ae6:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
   141331aea:	49 8b 85 80 0d 00 00 	mov    rax,QWORD PTR [r13+0xd80]
   141331af1:	bb 01 00 00 00       	mov    ebx,0x1
   141331af6:	48 85 c0             	test   rax,rax
   141331af9:	74 42                	je     0x141331b3d
   141331afb:	48 83 78 30 00       	cmp    QWORD PTR [rax+0x30],0x0
   141331b00:	74 3b                	je     0x141331b3d
   141331b02:	41 b8 04 00 00 00    	mov    r8d,0x4
   141331b08:	48 8d 15 39 73 2b 00 	lea    rdx,[rip+0x2b7339]        # 0x1415e8e48
   141331b0f:	49 8b ce             	mov    rcx,r14
   141331b12:	e8 b9 dd d3 fe       	call   0x14006f8d0
   141331b17:	49 8b 95 80 0d 00 00 	mov    rdx,QWORD PTR [r13+0xd80]
   141331b1e:	48 83 c2 20          	add    rdx,0x20
   141331b22:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141331b26:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141331b2b:	76 03                	jbe    0x141331b30
   141331b2d:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   141331b30:	49 8b ce             	mov    rcx,r14
   141331b33:	e8 d8 de d3 fe       	call   0x14006fa10
   141331b38:	e9 21 17 00 00       	jmp    0x14133325e
   141331b3d:	8b 05 55 a7 56 00    	mov    eax,DWORD PTR [rip+0x56a755]        # 0x14189c298
   141331b43:	3b c3                	cmp    eax,ebx
   141331b45:	75 30                	jne    0x141331b77
   141331b47:	48 8b 05 82 35 0b 01 	mov    rax,QWORD PTR [rip+0x10b3582]        # 0x1423e50d0
   141331b4e:	48 2b 05 73 35 0b 01 	sub    rax,QWORD PTR [rip+0x10b3573]        # 0x1423e50c8
   141331b55:	48 c1 f8 03          	sar    rax,0x3
   141331b59:	48 85 c0             	test   rax,rax
   141331b5c:	74 2a                	je     0x141331b88
   141331b5e:	48 8b 05 ab 35 0b 01 	mov    rax,QWORD PTR [rip+0x10b35ab]        # 0x1423e5110
   141331b65:	48 85 c0             	test   rax,rax
   141331b68:	74 1e                	je     0x141331b88
   141331b6a:	0f b7 80 a4 00 00 00 	movzx  eax,WORD PTR [rax+0xa4]
   141331b71:	89 44 24 38          	mov    DWORD PTR [rsp+0x38],eax
   141331b75:	eb 19                	jmp    0x141331b90
   141331b77:	85 c0                	test   eax,eax
   141331b79:	75 0d                	jne    0x141331b88
   141331b7b:	0f b7 05 fa 1a 06 01 	movzx  eax,WORD PTR [rip+0x1061afa]        # 0x14239367c
   141331b82:	89 44 24 38          	mov    DWORD PTR [rsp+0x38],eax
   141331b86:	eb 08                	jmp    0x141331b90
   141331b88:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [rsp+0x38],0xffffffff
   141331b8f:	ff 
   141331b90:	0f 11 45 9f          	movups XMMWORD PTR [rbp-0x61],xmm0
   141331b94:	4d 8b fc             	mov    r15,r12
   141331b97:	4c 89 65 af          	mov    QWORD PTR [rbp-0x51],r12
   141331b9b:	be 0f 00 00 00       	mov    esi,0xf
   141331ba0:	48 89 75 b7          	mov    QWORD PTR [rbp-0x49],rsi
   141331ba4:	c6 45 9f 00          	mov    BYTE PTR [rbp-0x61],0x0
   141331ba8:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   141331bac:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   141331bb0:	48 89 75 d7          	mov    QWORD PTR [rbp-0x29],rsi
   141331bb4:	c6 45 bf 00          	mov    BYTE PTR [rbp-0x41],0x0
   141331bb8:	40 32 ff             	xor    dil,dil
   141331bbb:	40 88 7c 24 30       	mov    BYTE PTR [rsp+0x30],dil
   141331bc0:	49 83 bd 90 00 00 00 	cmp    QWORD PTR [r13+0x90],0x0
   141331bc7:	00 
   141331bc8:	74 2f                	je     0x141331bf9
   141331bca:	49 8d 95 80 00 00 00 	lea    rdx,[r13+0x80]
   141331bd1:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331bd5:	48 3b c2             	cmp    rax,rdx
   141331bd8:	0f 84 e8 12 00 00    	je     0x141332ec6
   141331bde:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141331be2:	48 39 72 18          	cmp    QWORD PTR [rdx+0x18],rsi
   141331be6:	76 03                	jbe    0x141331beb
   141331be8:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   141331beb:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331bef:	e8 dc dc d3 fe       	call   0x14006f8d0
   141331bf4:	e9 cd 12 00 00       	jmp    0x141332ec6
   141331bf9:	49 0f bf bd 2c 01 00 	movsx  rdi,WORD PTR [r13+0x12c]
   141331c00:	00 
   141331c01:	49 0f bf 9d a4 00 00 	movsx  rbx,WORD PTR [r13+0xa4]
   141331c08:	00 
   141331c09:	44 0f b7 c7          	movzx  r8d,di
   141331c0d:	0f b7 d3             	movzx  edx,bx
   141331c10:	48 8d 0d 31 ae 1b 01 	lea    rcx,[rip+0x11bae31]        # 0x1424eca48
   141331c17:	e8 84 b2 fd fe       	call   0x14030cea0
   141331c1c:	84 c0                	test   al,al
   141331c1e:	0f 84 ca 01 00 00    	je     0x141331dee
   141331c24:	66 85 db             	test   bx,bx
   141331c27:	0f 88 b9 01 00 00    	js     0x141331de6
   141331c2d:	4c 8b 05 34 ae 1b 01 	mov    r8,QWORD PTR [rip+0x11bae34]        # 0x1424eca68
   141331c34:	48 8b 0d 35 ae 1b 01 	mov    rcx,QWORD PTR [rip+0x11bae35]        # 0x1424eca70
   141331c3b:	48 8b c1             	mov    rax,rcx
   141331c3e:	49 2b c0             	sub    rax,r8
   141331c41:	48 c1 f8 03          	sar    rax,0x3
   141331c45:	48 3b d8             	cmp    rbx,rax
   141331c48:	0f 83 98 01 00 00    	jae    0x141331de6
   141331c4e:	b8 86 00 00 00       	mov    eax,0x86
   141331c53:	66 44 3b c8          	cmp    r9w,ax
   141331c57:	0f 87 89 01 00 00    	ja     0x141331de6
   141331c5d:	4d 8b c8             	mov    r9,r8
   141331c60:	66 85 ff             	test   di,di
   141331c63:	0f 88 0b 01 00 00    	js     0x141331d74
   141331c69:	49 8b 04 d8          	mov    rax,QWORD PTR [r8+rbx*8]
   141331c6d:	4c 8b 90 78 01 00 00 	mov    r10,QWORD PTR [rax+0x178]
   141331c74:	4c 8b df             	mov    r11,rdi
   141331c77:	48 8b 80 80 01 00 00 	mov    rax,QWORD PTR [rax+0x180]
   141331c7e:	49 2b c2             	sub    rax,r10
   141331c81:	48 c1 f8 03          	sar    rax,0x3
   141331c85:	48 3b f8             	cmp    rdi,rax
   141331c88:	0f 83 e6 00 00 00    	jae    0x141331d74
   141331c8e:	48 0f bf 7c 24 32    	movsx  rdi,WORD PTR [rsp+0x32]
   141331c94:	48 8d 97 c1 00 00 00 	lea    rdx,[rdi+0xc1]
   141331c9b:	48 c1 e2 05          	shl    rdx,0x5
   141331c9f:	4b 03 14 da          	add    rdx,QWORD PTR [r10+r11*8]
   141331ca3:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331ca7:	48 3b c2             	cmp    rax,rdx
   141331caa:	74 36                	je     0x141331ce2
   141331cac:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141331cb0:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141331cb5:	76 03                	jbe    0x141331cba
   141331cb7:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   141331cba:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331cbe:	e8 0d dc d3 fe       	call   0x14006f8d0
   141331cc3:	4c 8b 7d af          	mov    r15,QWORD PTR [rbp-0x51]
   141331cc7:	4d 85 ff             	test   r15,r15
   141331cca:	0f 85 dd 00 00 00    	jne    0x141331dad
   141331cd0:	48 8b 75 b7          	mov    rsi,QWORD PTR [rbp-0x49]
   141331cd4:	48 8b 0d 95 ad 1b 01 	mov    rcx,QWORD PTR [rip+0x11bad95]        # 0x1424eca70
   141331cdb:	4c 8b 05 86 ad 1b 01 	mov    r8,QWORD PTR [rip+0x11bad86]        # 0x1424eca68
   141331ce2:	49 2b c8             	sub    rcx,r8
   141331ce5:	48 c1 f9 03          	sar    rcx,0x3
   141331ce9:	48 3b d9             	cmp    rbx,rcx
   141331cec:	0f 83 f4 00 00 00    	jae    0x141331de6
   141331cf2:	48 8d 57 11          	lea    rdx,[rdi+0x11]
   141331cf6:	48 c1 e2 05          	shl    rdx,0x5
   141331cfa:	49 03 14 d8          	add    rdx,QWORD PTR [r8+rbx*8]
   141331cfe:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331d02:	48 3b c2             	cmp    rax,rdx
   141331d05:	74 1f                	je     0x141331d26
   141331d07:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141331d0b:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141331d10:	76 03                	jbe    0x141331d15
   141331d12:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   141331d15:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331d19:	e8 b2 db d3 fe       	call   0x14006f8d0
   141331d1e:	48 8b 75 b7          	mov    rsi,QWORD PTR [rbp-0x49]
   141331d22:	4c 8b 7d af          	mov    r15,QWORD PTR [rbp-0x51]
   141331d26:	4d 85 ff             	test   r15,r15
   141331d29:	0f 84 b7 00 00 00    	je     0x141331de6
   141331d2f:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331d33:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   141331d37:	48 83 fe 0f          	cmp    rsi,0xf
   141331d3b:	48 0f 47 c1          	cmova  rax,rcx
   141331d3f:	80 38 61             	cmp    BYTE PTR [rax],0x61
   141331d42:	0f 8c 9e 00 00 00    	jl     0x141331de6
   141331d48:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331d4c:	48 83 fe 0f          	cmp    rsi,0xf
   141331d50:	48 0f 47 c1          	cmova  rax,rcx
   141331d54:	80 38 7a             	cmp    BYTE PTR [rax],0x7a
   141331d57:	0f 8f 89 00 00 00    	jg     0x141331de6
   141331d5d:	48 83 fe 0f          	cmp    rsi,0xf
   141331d61:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331d65:	48 0f 47 c1          	cmova  rax,rcx
   141331d69:	80 00 e0             	add    BYTE PTR [rax],0xe0
   141331d6c:	40 b7 01             	mov    dil,0x1
   141331d6f:	e9 4d 11 00 00       	jmp    0x141332ec1
   141331d74:	48 0f bf 54 24 32    	movsx  rdx,WORD PTR [rsp+0x32]
   141331d7a:	48 83 c2 11          	add    rdx,0x11
   141331d7e:	48 c1 e2 05          	shl    rdx,0x5
   141331d82:	49 03 14 d9          	add    rdx,QWORD PTR [r9+rbx*8]
   141331d86:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331d8a:	48 3b c2             	cmp    rax,rdx
   141331d8d:	74 57                	je     0x141331de6
   141331d8f:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141331d93:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141331d98:	76 03                	jbe    0x141331d9d
   141331d9a:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   141331d9d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331da1:	e8 2a db d3 fe       	call   0x14006f8d0
   141331da6:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   141331dab:	76 39                	jbe    0x141331de6
   141331dad:	48 8b 55 b7          	mov    rdx,QWORD PTR [rbp-0x49]
   141331db1:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331db5:	48 83 fa 0f          	cmp    rdx,0xf
   141331db9:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   141331dbd:	48 0f 47 c1          	cmova  rax,rcx
   141331dc1:	80 38 61             	cmp    BYTE PTR [rax],0x61
   141331dc4:	7c 20                	jl     0x141331de6
   141331dc6:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331dca:	48 83 fa 0f          	cmp    rdx,0xf
   141331dce:	48 0f 47 c1          	cmova  rax,rcx
   141331dd2:	80 38 7a             	cmp    BYTE PTR [rax],0x7a
   141331dd5:	7f 0f                	jg     0x141331de6
   141331dd7:	48 83 fa 0f          	cmp    rdx,0xf
   141331ddb:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141331ddf:	48 0f 47 c1          	cmova  rax,rcx
   141331de3:	80 00 e0             	add    BYTE PTR [rax],0xe0
   141331de6:	40 b7 01             	mov    dil,0x1
   141331de9:	e9 d3 10 00 00       	jmp    0x141332ec1
   141331dee:	49 0f bf c9          	movsx  rcx,r9w
   141331df2:	b8 86 00 00 00       	mov    eax,0x86
   141331df7:	3b c8                	cmp    ecx,eax
   141331df9:	0f 87 93 0c 00 00    	ja     0x141332a92
   141331dff:	48 8d 15 fa e1 cc fe 	lea    rdx,[rip+0xfffffffffecce1fa]        # 0x140000000
   141331e06:	8b 8c 8a 08 35 33 01 	mov    ecx,DWORD PTR [rdx+rcx*4+0x1333508]
   141331e0d:	48 03 ca             	add    rcx,rdx
   141331e10:	ff e1                	jmp    rcx
   141331e12:	48 c7 45 af 05 00 00 	mov    QWORD PTR [rbp-0x51],0x5
   141331e19:	00 
   141331e1a:	8b 05 20 6b 2d 00    	mov    eax,DWORD PTR [rip+0x2d6b20]        # 0x141608940
   141331e20:	89 45 9f             	mov    DWORD PTR [rbp-0x61],eax
   141331e23:	0f b6 05 1a 6b 2d 00 	movzx  eax,BYTE PTR [rip+0x2d6b1a]        # 0x141608944
   141331e2a:	88 45 a3             	mov    BYTE PTR [rbp-0x5d],al
   141331e2d:	c6 45 a4 00          	mov    BYTE PTR [rbp-0x5c],0x0
   141331e31:	e9 95 0c 00 00       	jmp    0x141332acb
   141331e36:	48 c7 45 af 0a 00 00 	mov    QWORD PTR [rbp-0x51],0xa
   141331e3d:	00 
   141331e3e:	f2 0f 10 05 a2 0d 45 	movsd  xmm0,QWORD PTR [rip+0x450da2]        # 0x141782be8
   141331e45:	00 
   141331e46:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   141331e4b:	0f b7 05 9e 0d 45 00 	movzx  eax,WORD PTR [rip+0x450d9e]        # 0x141782bf0
   141331e52:	66 89 45 a7          	mov    WORD PTR [rbp-0x59],ax
   141331e56:	c6 45 a9 00          	mov    BYTE PTR [rbp-0x57],0x0
   141331e5a:	e9 6c 0c 00 00       	jmp    0x141332acb
   141331e5f:	48 c7 45 af 09 00 00 	mov    QWORD PTR [rbp-0x51],0x9
   141331e66:	00 
   141331e67:	f2 0f 10 05 71 ab 2f 	movsd  xmm0,QWORD PTR [rip+0x2fab71]        # 0x14162c9e0
   141331e6e:	00 
   141331e6f:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   141331e74:	0f b6 05 6d ab 2f 00 	movzx  eax,BYTE PTR [rip+0x2fab6d]        # 0x14162c9e8
   141331e7b:	88 45 a7             	mov    BYTE PTR [rbp-0x59],al
   141331e7e:	c6 45 a8 00          	mov    BYTE PTR [rbp-0x58],0x0
   141331e82:	e9 44 0c 00 00       	jmp    0x141332acb
   141331e87:	48 c7 45 af 06 00 00 	mov    QWORD PTR [rbp-0x51],0x6
   141331e8e:	00 
   141331e8f:	8b 05 33 ab 2f 00    	mov    eax,DWORD PTR [rip+0x2fab33]        # 0x14162c9c8
   141331e95:	89 45 9f             	mov    DWORD PTR [rbp-0x61],eax
   141331e98:	0f b7 05 2d ab 2f 00 	movzx  eax,WORD PTR [rip+0x2fab2d]        # 0x14162c9cc
   141331e9f:	66 89 45 a3          	mov    WORD PTR [rbp-0x5d],ax
   141331ea3:	c6 45 a5 00          	mov    BYTE PTR [rbp-0x5b],0x0
   141331ea7:	e9 1f 0c 00 00       	jmp    0x141332acb
   141331eac:	48 c7 45 af 0a 00 00 	mov    QWORD PTR [rbp-0x51],0xa
   141331eb3:	00 
   141331eb4:	f2 0f 10 05 a4 6a 2d 	movsd  xmm0,QWORD PTR [rip+0x2d6aa4]        # 0x141608960
   141331ebb:	00 
   141331ebc:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   141331ec1:	0f b7 05 a0 6a 2d 00 	movzx  eax,WORD PTR [rip+0x2d6aa0]        # 0x141608968
   141331ec8:	66 89 45 a7          	mov    WORD PTR [rbp-0x59],ax
   141331ecc:	c6 45 a9 00          	mov    BYTE PTR [rbp-0x57],0x0
   141331ed0:	e9 f6 0b 00 00       	jmp    0x141332acb
   141331ed5:	48 c7 45 af 0b 00 00 	mov    QWORD PTR [rbp-0x51],0xb
   141331edc:	00 
   141331edd:	f2 0f 10 05 73 aa 2f 	movsd  xmm0,QWORD PTR [rip+0x2faa73]        # 0x14162c958
   141331ee4:	00 
   141331ee5:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   141331eea:	0f b7 05 6f aa 2f 00 	movzx  eax,WORD PTR [rip+0x2faa6f]        # 0x14162c960
   141331ef1:	66 89 45 a7          	mov    WORD PTR [rbp-0x59],ax
   141331ef5:	0f b6 05 66 aa 2f 00 	movzx  eax,BYTE PTR [rip+0x2faa66]        # 0x14162c962
   141331efc:	88 45 a9             	mov    BYTE PTR [rbp-0x57],al
   141331eff:	c6 45 aa 00          	mov    BYTE PTR [rbp-0x56],0x0
   141331f03:	e9 c3 0b 00 00       	jmp    0x141332acb
   141331f08:	48 c7 45 af 08 00 00 	mov    QWORD PTR [rbp-0x51],0x8
   141331f0f:	00 
   141331f10:	48 b8 45 6e 67 72 61 	movabs rax,0x7265766172676e45
   141331f17:	76 65 72 
   141331f1a:	48 89 45 9f          	mov    QWORD PTR [rbp-0x61],rax
   141331f1e:	c6 45 a7 00          	mov    BYTE PTR [rbp-0x59],0x0
   141331f22:	e9 a4 0b 00 00       	jmp    0x141332acb
   141331f27:	48 8d 15 1a 39 37 00 	lea    rdx,[rip+0x37391a]        # 0x1416a5848
   141331f2e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331f32:	e8 49 d6 d3 fe       	call   0x14006f580
   141331f37:	e9 8f 0b 00 00       	jmp    0x141332acb
   141331f3c:	48 8d 15 f5 38 37 00 	lea    rdx,[rip+0x3738f5]        # 0x1416a5838
   141331f43:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331f47:	e8 34 d6 d3 fe       	call   0x14006f580
   141331f4c:	e9 7a 0b 00 00       	jmp    0x141332acb
   141331f51:	48 8d 15 0c 39 37 00 	lea    rdx,[rip+0x37390c]        # 0x1416a5864
   141331f58:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331f5c:	e8 1f d6 d3 fe       	call   0x14006f580
   141331f61:	e9 65 0b 00 00       	jmp    0x141332acb
   141331f66:	48 8d 15 a3 0c 45 00 	lea    rdx,[rip+0x450ca3]        # 0x141782c10
   141331f6d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331f71:	e8 0a d6 d3 fe       	call   0x14006f580
   141331f76:	e9 50 0b 00 00       	jmp    0x141332acb
   141331f7b:	48 8d 15 fe 38 37 00 	lea    rdx,[rip+0x3738fe]        # 0x1416a5880
   141331f82:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331f86:	e8 f5 d5 d3 fe       	call   0x14006f580
   141331f8b:	e9 3b 0b 00 00       	jmp    0x141332acb
   141331f90:	48 8d 15 d9 38 37 00 	lea    rdx,[rip+0x3738d9]        # 0x1416a5870
   141331f97:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331f9b:	e8 e0 d5 d3 fe       	call   0x14006f580
   141331fa0:	e9 26 0b 00 00       	jmp    0x141332acb
   141331fa5:	48 8d 15 cc e3 2c 00 	lea    rdx,[rip+0x2ce3cc]        # 0x141600378
   141331fac:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331fb0:	e8 cb d5 d3 fe       	call   0x14006f580
   141331fb5:	e9 11 0b 00 00       	jmp    0x141332acb
   141331fba:	48 8d 15 37 37 37 00 	lea    rdx,[rip+0x373737]        # 0x1416a56f8
   141331fc1:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331fc5:	e8 b6 d5 d3 fe       	call   0x14006f580
   141331fca:	e9 fc 0a 00 00       	jmp    0x141332acb
   141331fcf:	48 8d 15 fa 36 37 00 	lea    rdx,[rip+0x3736fa]        # 0x1416a56d0
   141331fd6:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331fda:	e8 a1 d5 d3 fe       	call   0x14006f580
   141331fdf:	e9 e7 0a 00 00       	jmp    0x141332acb
   141331fe4:	48 8d 15 4d a9 2f 00 	lea    rdx,[rip+0x2fa94d]        # 0x14162c938
   141331feb:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141331fef:	e8 8c d5 d3 fe       	call   0x14006f580
   141331ff4:	e9 d2 0a 00 00       	jmp    0x141332acb
   141331ff9:	48 8d 15 28 36 37 00 	lea    rdx,[rip+0x373628]        # 0x1416a5628
   141332000:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332004:	e8 77 d5 d3 fe       	call   0x14006f580
   141332009:	e9 bd 0a 00 00       	jmp    0x141332acb
   14133200e:	48 8d 15 7b 36 37 00 	lea    rdx,[rip+0x37367b]        # 0x1416a5690
   141332015:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332019:	e8 62 d5 d3 fe       	call   0x14006f580
   14133201e:	e9 a8 0a 00 00       	jmp    0x141332acb
   141332023:	48 8d 15 de 0b 45 00 	lea    rdx,[rip+0x450bde]        # 0x141782c08
   14133202a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133202e:	e8 4d d5 d3 fe       	call   0x14006f580
   141332033:	e9 93 0a 00 00       	jmp    0x141332acb
   141332038:	48 c7 45 af 0a 00 00 	mov    QWORD PTR [rbp-0x51],0xa
   14133203f:	00 
   141332040:	f2 0f 10 05 68 36 37 	movsd  xmm0,QWORD PTR [rip+0x373668]        # 0x1416a56b0
   141332047:	00 
   141332048:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   14133204d:	0f b7 05 64 36 37 00 	movzx  eax,WORD PTR [rip+0x373664]        # 0x1416a56b8
   141332054:	66 89 45 a7          	mov    WORD PTR [rbp-0x59],ax
   141332058:	c6 45 a9 00          	mov    BYTE PTR [rbp-0x57],0x0
   14133205c:	e9 6a 0a 00 00       	jmp    0x141332acb
   141332061:	48 c7 45 af 0c 00 00 	mov    QWORD PTR [rbp-0x51],0xc
   141332068:	00 
   141332069:	f2 0f 10 05 b7 0b 45 	movsd  xmm0,QWORD PTR [rip+0x450bb7]        # 0x141782c28
   141332070:	00 
   141332071:	f2 0f 11 45 9f       	movsd  QWORD PTR [rbp-0x61],xmm0
   141332076:	8b 05 b4 0b 45 00    	mov    eax,DWORD PTR [rip+0x450bb4]        # 0x141782c30
   14133207c:	89 45 a7             	mov    DWORD PTR [rbp-0x59],eax
   14133207f:	c6 45 ab 00          	mov    BYTE PTR [rbp-0x55],0x0
   141332083:	e9 43 0a 00 00       	jmp    0x141332acb
   141332088:	48 8d 15 a1 a8 2f 00 	lea    rdx,[rip+0x2fa8a1]        # 0x14162c930
   14133208f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332093:	e8 e8 d4 d3 fe       	call   0x14006f580
   141332098:	e9 2e 0a 00 00       	jmp    0x141332acb
   14133209d:	48 8d 15 3c 34 37 00 	lea    rdx,[rip+0x37343c]        # 0x1416a54e0
   1413320a4:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413320a8:	e8 d3 d4 d3 fe       	call   0x14006f580
   1413320ad:	e9 19 0a 00 00       	jmp    0x141332acb
   1413320b2:	48 8d 15 37 34 37 00 	lea    rdx,[rip+0x373437]        # 0x1416a54f0
   1413320b9:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413320bd:	e8 be d4 d3 fe       	call   0x14006f580
   1413320c2:	e9 04 0a 00 00       	jmp    0x141332acb
   1413320c7:	48 8d 15 6a fb 31 00 	lea    rdx,[rip+0x31fb6a]        # 0x141651c38
   1413320ce:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413320d2:	e8 a9 d4 d3 fe       	call   0x14006f580
   1413320d7:	e9 ef 09 00 00       	jmp    0x141332acb
   1413320dc:	48 8d 15 1d 34 37 00 	lea    rdx,[rip+0x37341d]        # 0x1416a5500
   1413320e3:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413320e7:	e8 94 d4 d3 fe       	call   0x14006f580
   1413320ec:	e9 da 09 00 00       	jmp    0x141332acb
   1413320f1:	48 8d 15 18 34 37 00 	lea    rdx,[rip+0x373418]        # 0x1416a5510
   1413320f8:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413320fc:	e8 7f d4 d3 fe       	call   0x14006f580
   141332101:	e9 c5 09 00 00       	jmp    0x141332acb
   141332106:	48 8d 15 13 34 37 00 	lea    rdx,[rip+0x373413]        # 0x1416a5520
   14133210d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332111:	e8 6a d4 d3 fe       	call   0x14006f580
   141332116:	e9 b0 09 00 00       	jmp    0x141332acb
   14133211b:	48 8d 15 0a 34 37 00 	lea    rdx,[rip+0x37340a]        # 0x1416a552c
   141332122:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332126:	e8 55 d4 d3 fe       	call   0x14006f580
   14133212b:	e9 9b 09 00 00       	jmp    0x141332acb
   141332130:	48 8d 15 8d 38 37 00 	lea    rdx,[rip+0x37388d]        # 0x1416a59c4
   141332137:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133213b:	e8 40 d4 d3 fe       	call   0x14006f580
   141332140:	e9 86 09 00 00       	jmp    0x141332acb
   141332145:	48 8d 15 ec 33 37 00 	lea    rdx,[rip+0x3733ec]        # 0x1416a5538
   14133214c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332150:	e8 2b d4 d3 fe       	call   0x14006f580
   141332155:	e9 71 09 00 00       	jmp    0x141332acb
   14133215a:	48 8d 15 b7 0a 45 00 	lea    rdx,[rip+0x450ab7]        # 0x141782c18
   141332161:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332165:	e8 16 d4 d3 fe       	call   0x14006f580
   14133216a:	e9 5c 09 00 00       	jmp    0x141332acb
   14133216f:	48 8d 15 2a 38 37 00 	lea    rdx,[rip+0x37382a]        # 0x1416a59a0
   141332176:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133217a:	e8 01 d4 d3 fe       	call   0x14006f580
   14133217f:	e9 47 09 00 00       	jmp    0x141332acb
   141332184:	48 8d 15 45 38 37 00 	lea    rdx,[rip+0x373845]        # 0x1416a59d0
   14133218b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133218f:	e8 ec d3 d3 fe       	call   0x14006f580
   141332194:	e9 32 09 00 00       	jmp    0x141332acb
   141332199:	48 8d 15 3c 38 37 00 	lea    rdx,[rip+0x37383c]        # 0x1416a59dc
   1413321a0:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413321a4:	e8 d7 d3 d3 fe       	call   0x14006f580
   1413321a9:	e9 1d 09 00 00       	jmp    0x141332acb
   1413321ae:	48 8d 15 1b fb 31 00 	lea    rdx,[rip+0x31fb1b]        # 0x141651cd0
   1413321b5:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413321b9:	e8 c2 d3 d3 fe       	call   0x14006f580
   1413321be:	e9 08 09 00 00       	jmp    0x141332acb
   1413321c3:	48 8d 15 9e 33 37 00 	lea    rdx,[rip+0x37339e]        # 0x1416a5568
   1413321ca:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413321ce:	e8 ad d3 d3 fe       	call   0x14006f580
   1413321d3:	e9 f3 08 00 00       	jmp    0x141332acb
   1413321d8:	48 8d 15 61 34 37 00 	lea    rdx,[rip+0x373461]        # 0x1416a5640
   1413321df:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413321e3:	e8 78 d3 d3 fe       	call   0x14006f560
   1413321e8:	e9 de 08 00 00       	jmp    0x141332acb
   1413321ed:	48 8d 15 54 0a 45 00 	lea    rdx,[rip+0x450a54]        # 0x141782c48
   1413321f4:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413321f8:	e8 83 d3 d3 fe       	call   0x14006f580
   1413321fd:	e9 c9 08 00 00       	jmp    0x141332acb
   141332202:	48 8d 15 0f 34 37 00 	lea    rdx,[rip+0x37340f]        # 0x1416a5618
   141332209:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133220d:	e8 6e d3 d3 fe       	call   0x14006f580
   141332212:	e9 b4 08 00 00       	jmp    0x141332acb
   141332217:	48 8d 15 a2 34 37 00 	lea    rdx,[rip+0x3734a2]        # 0x1416a56c0
   14133221e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332222:	e8 59 d3 d3 fe       	call   0x14006f580
   141332227:	e9 9f 08 00 00       	jmp    0x141332acb
   14133222c:	48 8d 15 b5 34 37 00 	lea    rdx,[rip+0x3734b5]        # 0x1416a56e8
   141332233:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332237:	e8 44 d3 d3 fe       	call   0x14006f580
   14133223c:	e9 8a 08 00 00       	jmp    0x141332acb
   141332241:	48 8d 15 40 a9 2f 00 	lea    rdx,[rip+0x2fa940]        # 0x14162cb88
   141332248:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133224c:	e8 2f d3 d3 fe       	call   0x14006f580
   141332251:	e9 75 08 00 00       	jmp    0x141332acb
   141332256:	48 8d 15 63 36 37 00 	lea    rdx,[rip+0x373663]        # 0x1416a58c0
   14133225d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332261:	e8 1a d3 d3 fe       	call   0x14006f580
   141332266:	e9 60 08 00 00       	jmp    0x141332acb
   14133226b:	48 8d 15 5a 36 37 00 	lea    rdx,[rip+0x37365a]        # 0x1416a58cc
   141332272:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332276:	e8 05 d3 d3 fe       	call   0x14006f580
   14133227b:	e9 4b 08 00 00       	jmp    0x141332acb
   141332280:	48 8d 15 4d 36 37 00 	lea    rdx,[rip+0x37364d]        # 0x1416a58d4
   141332287:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133228b:	e8 f0 d2 d3 fe       	call   0x14006f580
   141332290:	e9 36 08 00 00       	jmp    0x141332acb
   141332295:	48 8d 15 44 36 37 00 	lea    rdx,[rip+0x373644]        # 0x1416a58e0
   14133229c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413322a0:	e8 db d2 d3 fe       	call   0x14006f580
   1413322a5:	e9 21 08 00 00       	jmp    0x141332acb
   1413322aa:	48 8d 15 37 36 37 00 	lea    rdx,[rip+0x373637]        # 0x1416a58e8
   1413322b1:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413322b5:	e8 c6 d2 d3 fe       	call   0x14006f580
   1413322ba:	e9 0c 08 00 00       	jmp    0x141332acb
   1413322bf:	48 8d 15 be ac 30 00 	lea    rdx,[rip+0x30acbe]        # 0x14163cf84
   1413322c6:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413322ca:	e8 b1 d2 d3 fe       	call   0x14006f580
   1413322cf:	e9 f7 07 00 00       	jmp    0x141332acb
   1413322d4:	48 8d 15 1d 37 37 00 	lea    rdx,[rip+0x37371d]        # 0x1416a59f8
   1413322db:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413322df:	e8 9c d2 d3 fe       	call   0x14006f580
   1413322e4:	e9 e2 07 00 00       	jmp    0x141332acb
   1413322e9:	48 8d 15 fc 36 37 00 	lea    rdx,[rip+0x3736fc]        # 0x1416a59ec
   1413322f0:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413322f4:	e8 87 d2 d3 fe       	call   0x14006f580
   1413322f9:	e9 cd 07 00 00       	jmp    0x141332acb
   1413322fe:	48 8d 15 23 9b 2e 00 	lea    rdx,[rip+0x2e9b23]        # 0x14161be28
   141332305:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332309:	e8 72 d2 d3 fe       	call   0x14006f580
   14133230e:	e9 b8 07 00 00       	jmp    0x141332acb
   141332313:	48 8d 15 66 a8 2f 00 	lea    rdx,[rip+0x2fa866]        # 0x14162cb80
   14133231a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133231e:	e8 5d d2 d3 fe       	call   0x14006f580
   141332323:	e9 a3 07 00 00       	jmp    0x141332acb
   141332328:	48 8d 15 e1 a5 2f 00 	lea    rdx,[rip+0x2fa5e1]        # 0x14162c910
   14133232f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332333:	e8 48 d2 d3 fe       	call   0x14006f580
   141332338:	e9 8e 07 00 00       	jmp    0x141332acb
   14133233d:	48 8d 15 6c 36 37 00 	lea    rdx,[rip+0x37366c]        # 0x1416a59b0
   141332344:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332348:	e8 33 d2 d3 fe       	call   0x14006f580
   14133234d:	e9 79 07 00 00       	jmp    0x141332acb
   141332352:	48 8d 15 5f 36 37 00 	lea    rdx,[rip+0x37365f]        # 0x1416a59b8
   141332359:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133235d:	e8 1e d2 d3 fe       	call   0x14006f580
   141332362:	e9 64 07 00 00       	jmp    0x141332acb
   141332367:	48 8d 15 92 33 37 00 	lea    rdx,[rip+0x373392]        # 0x1416a5700
   14133236e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332372:	e8 09 d2 d3 fe       	call   0x14006f580
   141332377:	e9 4f 07 00 00       	jmp    0x141332acb
   14133237c:	48 8d 15 85 33 37 00 	lea    rdx,[rip+0x373385]        # 0x1416a5708
   141332383:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332387:	e8 f4 d1 d3 fe       	call   0x14006f580
   14133238c:	e9 3a 07 00 00       	jmp    0x141332acb
   141332391:	48 8d 15 4c 36 37 00 	lea    rdx,[rip+0x37364c]        # 0x1416a59e4
   141332398:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133239c:	e8 df d1 d3 fe       	call   0x14006f580
   1413323a1:	e9 25 07 00 00       	jmp    0x141332acb
   1413323a6:	48 8d 15 8b 08 45 00 	lea    rdx,[rip+0x45088b]        # 0x141782c38
   1413323ad:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413323b1:	e8 ca d1 d3 fe       	call   0x14006f580
   1413323b6:	e9 10 07 00 00       	jmp    0x141332acb
   1413323bb:	48 8d 15 9e 32 37 00 	lea    rdx,[rip+0x37329e]        # 0x1416a5660
   1413323c2:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413323c6:	e8 b5 d1 d3 fe       	call   0x14006f580
   1413323cb:	e9 fb 06 00 00       	jmp    0x141332acb
   1413323d0:	48 8d 15 99 32 37 00 	lea    rdx,[rip+0x373299]        # 0x1416a5670
   1413323d7:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413323db:	e8 a0 d1 d3 fe       	call   0x14006f580
   1413323e0:	e9 e6 06 00 00       	jmp    0x141332acb
   1413323e5:	48 8d 15 94 32 37 00 	lea    rdx,[rip+0x373294]        # 0x1416a5680
   1413323ec:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413323f0:	e8 8b d1 d3 fe       	call   0x14006f580
   1413323f5:	e9 d1 06 00 00       	jmp    0x141332acb
   1413323fa:	48 8d 15 1f 09 45 00 	lea    rdx,[rip+0x45091f]        # 0x141782d20
   141332401:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332405:	e8 76 d1 d3 fe       	call   0x14006f580
   14133240a:	e9 bc 06 00 00       	jmp    0x141332acb
   14133240f:	48 8d 15 32 a5 2f 00 	lea    rdx,[rip+0x2fa532]        # 0x14162c948
   141332416:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133241a:	e8 61 d1 d3 fe       	call   0x14006f580
   14133241f:	e9 a7 06 00 00       	jmp    0x141332acb
   141332424:	48 8d 15 45 35 37 00 	lea    rdx,[rip+0x373545]        # 0x1416a5970
   14133242b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133242f:	e8 4c d1 d3 fe       	call   0x14006f580
   141332434:	e9 92 06 00 00       	jmp    0x141332acb
   141332439:	48 8d 15 40 35 37 00 	lea    rdx,[rip+0x373540]        # 0x1416a5980
   141332440:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332444:	e8 37 d1 d3 fe       	call   0x14006f580
   141332449:	e9 7d 06 00 00       	jmp    0x141332acb
   14133244e:	48 8d 15 3b 35 37 00 	lea    rdx,[rip+0x37353b]        # 0x1416a5990
   141332455:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332459:	e8 22 d1 d3 fe       	call   0x14006f580
   14133245e:	e9 68 06 00 00       	jmp    0x141332acb
   141332463:	48 8d 15 ae 08 45 00 	lea    rdx,[rip+0x4508ae]        # 0x141782d18
   14133246a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133246e:	e8 0d d1 d3 fe       	call   0x14006f580
   141332473:	e9 53 06 00 00       	jmp    0x141332acb
   141332478:	48 8d 15 b9 08 45 00 	lea    rdx,[rip+0x4508b9]        # 0x141782d38
   14133247f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332483:	e8 f8 d0 d3 fe       	call   0x14006f580
   141332488:	e9 3e 06 00 00       	jmp    0x141332acb
   14133248d:	48 8d 15 98 08 45 00 	lea    rdx,[rip+0x450898]        # 0x141782d2c
   141332494:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332498:	e8 e3 d0 d3 fe       	call   0x14006f580
   14133249d:	e9 29 06 00 00       	jmp    0x141332acb
   1413324a2:	48 8d 15 fb 30 37 00 	lea    rdx,[rip+0x3730fb]        # 0x1416a55a4
   1413324a9:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413324ad:	e8 ce d0 d3 fe       	call   0x14006f580
   1413324b2:	e9 14 06 00 00       	jmp    0x141332acb
   1413324b7:	48 8d 15 92 08 45 00 	lea    rdx,[rip+0x450892]        # 0x141782d50
   1413324be:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413324c2:	e8 b9 d0 d3 fe       	call   0x14006f580
   1413324c7:	e9 ff 05 00 00       	jmp    0x141332acb
   1413324cc:	48 8d 15 05 36 37 00 	lea    rdx,[rip+0x373605]        # 0x1416a5ad8
   1413324d3:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413324d7:	e8 a4 d0 d3 fe       	call   0x14006f580
   1413324dc:	e9 ea 05 00 00       	jmp    0x141332acb
   1413324e1:	48 8d 15 48 d8 2c 00 	lea    rdx,[rip+0x2cd848]        # 0x1415ffd30
   1413324e8:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413324ec:	e8 8f d0 d3 fe       	call   0x14006f580
   1413324f1:	e9 d5 05 00 00       	jmp    0x141332acb
   1413324f6:	48 8d 15 1f d8 2c 00 	lea    rdx,[rip+0x2cd81f]        # 0x1415ffd1c
   1413324fd:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332501:	e8 7a d0 d3 fe       	call   0x14006f580
   141332506:	e9 c0 05 00 00       	jmp    0x141332acb
   14133250b:	48 8d 15 7e a3 2f 00 	lea    rdx,[rip+0x2fa37e]        # 0x14162c890
   141332512:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332516:	e8 65 d0 d3 fe       	call   0x14006f580
   14133251b:	e9 ab 05 00 00       	jmp    0x141332acb
   141332520:	48 8d 15 21 08 45 00 	lea    rdx,[rip+0x450821]        # 0x141782d48
   141332527:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133252b:	e8 50 d0 d3 fe       	call   0x14006f580
   141332530:	e9 96 05 00 00       	jmp    0x141332acb
   141332535:	48 8d 15 ec d7 2c 00 	lea    rdx,[rip+0x2cd7ec]        # 0x1415ffd28
   14133253c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332540:	e8 3b d0 d3 fe       	call   0x14006f580
   141332545:	e9 81 05 00 00       	jmp    0x141332acb
   14133254a:	48 8d 15 17 08 45 00 	lea    rdx,[rip+0x450817]        # 0x141782d68
   141332551:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332555:	e8 26 d0 d3 fe       	call   0x14006f580
   14133255a:	e9 6c 05 00 00       	jmp    0x141332acb
   14133255f:	48 8d 15 12 36 37 00 	lea    rdx,[rip+0x373612]        # 0x1416a5b78
   141332566:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133256a:	e8 11 d0 d3 fe       	call   0x14006f580
   14133256f:	e9 57 05 00 00       	jmp    0x141332acb
   141332574:	48 8d 15 dd 07 45 00 	lea    rdx,[rip+0x4507dd]        # 0x141782d58
   14133257b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133257f:	e8 fc cf d3 fe       	call   0x14006f580
   141332584:	e9 42 05 00 00       	jmp    0x141332acb
   141332589:	48 8d 15 f8 35 37 00 	lea    rdx,[rip+0x3735f8]        # 0x1416a5b88
   141332590:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332594:	e8 e7 cf d3 fe       	call   0x14006f580
   141332599:	e9 2d 05 00 00       	jmp    0x141332acb
   14133259e:	48 8d 15 2b 07 45 00 	lea    rdx,[rip+0x45072b]        # 0x141782cd0
   1413325a5:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413325a9:	e8 d2 cf d3 fe       	call   0x14006f580
   1413325ae:	e9 18 05 00 00       	jmp    0x141332acb
   1413325b3:	48 8d 15 de 35 37 00 	lea    rdx,[rip+0x3735de]        # 0x1416a5b98
   1413325ba:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413325be:	e8 bd cf d3 fe       	call   0x14006f580
   1413325c3:	e9 03 05 00 00       	jmp    0x141332acb
   1413325c8:	48 8d 15 d1 35 37 00 	lea    rdx,[rip+0x3735d1]        # 0x1416a5ba0
   1413325cf:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413325d3:	e8 a8 cf d3 fe       	call   0x14006f580
   1413325d8:	e9 ee 04 00 00       	jmp    0x141332acb
   1413325dd:	48 8d 15 14 d7 2c 00 	lea    rdx,[rip+0x2cd714]        # 0x1415ffcf8
   1413325e4:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413325e8:	e8 93 cf d3 fe       	call   0x14006f580
   1413325ed:	e9 d9 04 00 00       	jmp    0x141332acb
   1413325f2:	48 8d 15 ef d6 2c 00 	lea    rdx,[rip+0x2cd6ef]        # 0x1415ffce8
   1413325f9:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413325fd:	e8 7e cf d3 fe       	call   0x14006f580
   141332602:	e9 c4 04 00 00       	jmp    0x141332acb
   141332607:	48 8d 15 9a a2 2f 00 	lea    rdx,[rip+0x2fa29a]        # 0x14162c8a8
   14133260e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332612:	e8 69 cf d3 fe       	call   0x14006f580
   141332617:	e9 af 04 00 00       	jmp    0x141332acb
   14133261c:	48 8d 15 f5 32 37 00 	lea    rdx,[rip+0x3732f5]        # 0x1416a5918
   141332623:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332627:	e8 54 cf d3 fe       	call   0x14006f580
   14133262c:	e9 9a 04 00 00       	jmp    0x141332acb
   141332631:	48 8d 15 d8 d8 2c 00 	lea    rdx,[rip+0x2cd8d8]        # 0x1415fff10
   141332638:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133263c:	e8 3f cf d3 fe       	call   0x14006f580
   141332641:	e9 85 04 00 00       	jmp    0x141332acb
   141332646:	48 8d 15 73 06 45 00 	lea    rdx,[rip+0x450673]        # 0x141782cc0
   14133264d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332651:	e8 2a cf d3 fe       	call   0x14006f580
   141332656:	e9 70 04 00 00       	jmp    0x141332acb
   14133265b:	48 8d 15 82 06 45 00 	lea    rdx,[rip+0x450682]        # 0x141782ce4
   141332662:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332666:	e8 15 cf d3 fe       	call   0x14006f580
   14133266b:	e9 5b 04 00 00       	jmp    0x141332acb
   141332670:	48 8d 15 09 a2 2f 00 	lea    rdx,[rip+0x2fa209]        # 0x14162c880
   141332677:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133267b:	e8 00 cf d3 fe       	call   0x14006f580
   141332680:	e9 46 04 00 00       	jmp    0x141332acb
   141332685:	48 8d 15 50 06 45 00 	lea    rdx,[rip+0x450650]        # 0x141782cdc
   14133268c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332690:	e8 eb ce d3 fe       	call   0x14006f580
   141332695:	e9 31 04 00 00       	jmp    0x141332acb
   14133269a:	48 8d 15 57 06 45 00 	lea    rdx,[rip+0x450657]        # 0x141782cf8
   1413326a1:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413326a5:	e8 d6 ce d3 fe       	call   0x14006f580
   1413326aa:	e9 1c 04 00 00       	jmp    0x141332acb
   1413326af:	48 8d 15 3a bc 36 00 	lea    rdx,[rip+0x36bc3a]        # 0x14169e2f0
   1413326b6:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413326ba:	e8 c1 ce d3 fe       	call   0x14006f580
   1413326bf:	e9 07 04 00 00       	jmp    0x141332acb
   1413326c4:	48 8d 15 45 d6 2c 00 	lea    rdx,[rip+0x2cd645]        # 0x1415ffd10
   1413326cb:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413326cf:	e8 ac ce d3 fe       	call   0x14006f580
   1413326d4:	e9 f2 03 00 00       	jmp    0x141332acb
   1413326d9:	48 8d 15 b0 33 37 00 	lea    rdx,[rip+0x3733b0]        # 0x1416a5a90
   1413326e0:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413326e4:	e8 97 ce d3 fe       	call   0x14006f580
   1413326e9:	e9 dd 03 00 00       	jmp    0x141332acb
   1413326ee:	48 8d 15 53 f7 44 00 	lea    rdx,[rip+0x44f753]        # 0x141781e48
   1413326f5:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413326f9:	e8 82 ce d3 fe       	call   0x14006f580
   1413326fe:	e9 c8 03 00 00       	jmp    0x141332acb
   141332703:	48 8d 15 96 33 37 00 	lea    rdx,[rip+0x373396]        # 0x1416a5aa0
   14133270a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133270e:	e8 6d ce d3 fe       	call   0x14006f580
   141332713:	e9 b3 03 00 00       	jmp    0x141332acb
   141332718:	48 8d 15 41 f6 44 00 	lea    rdx,[rip+0x44f641]        # 0x141781d60
   14133271f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332723:	e8 58 ce d3 fe       	call   0x14006f580
   141332728:	e9 9e 03 00 00       	jmp    0x141332acb
   14133272d:	48 8d 15 7c 33 37 00 	lea    rdx,[rip+0x37337c]        # 0x1416a5ab0
   141332734:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332738:	e8 43 ce d3 fe       	call   0x14006f580
   14133273d:	e9 89 03 00 00       	jmp    0x141332acb
   141332742:	48 8d 15 6f f6 44 00 	lea    rdx,[rip+0x44f66f]        # 0x141781db8
   141332749:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133274d:	e8 2e ce d3 fe       	call   0x14006f580
   141332752:	e9 74 03 00 00       	jmp    0x141332acb
   141332757:	48 8d 15 e2 32 37 00 	lea    rdx,[rip+0x3732e2]        # 0x1416a5a40
   14133275e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332762:	e8 19 ce d3 fe       	call   0x14006f580
   141332767:	e9 5f 03 00 00       	jmp    0x141332acb
   14133276c:	48 8d 15 5d f6 44 00 	lea    rdx,[rip+0x44f65d]        # 0x141781dd0
   141332773:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332777:	e8 04 ce d3 fe       	call   0x14006f580
   14133277c:	e9 4a 03 00 00       	jmp    0x141332acb
   141332781:	48 8d 15 e8 32 37 00 	lea    rdx,[rip+0x3732e8]        # 0x1416a5a70
   141332788:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133278c:	e8 ef cd d3 fe       	call   0x14006f580
   141332791:	e9 35 03 00 00       	jmp    0x141332acb
   141332796:	48 8d 15 3b f7 44 00 	lea    rdx,[rip+0x44f73b]        # 0x141781ed8
   14133279d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413327a1:	e8 da cd d3 fe       	call   0x14006f580
   1413327a6:	e9 20 03 00 00       	jmp    0x141332acb
   1413327ab:	48 8d 15 c6 32 37 00 	lea    rdx,[rip+0x3732c6]        # 0x1416a5a78
   1413327b2:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413327b6:	e8 c5 cd d3 fe       	call   0x14006f580
   1413327bb:	e9 0b 03 00 00       	jmp    0x141332acb
   1413327c0:	48 8d 15 21 f7 44 00 	lea    rdx,[rip+0x44f721]        # 0x141781ee8
   1413327c7:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413327cb:	e8 b0 cd d3 fe       	call   0x14006f580
   1413327d0:	e9 f6 02 00 00       	jmp    0x141332acb
   1413327d5:	48 8d 15 ac 32 37 00 	lea    rdx,[rip+0x3732ac]        # 0x1416a5a88
   1413327dc:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413327e0:	e8 9b cd d3 fe       	call   0x14006f580
   1413327e5:	e9 e1 02 00 00       	jmp    0x141332acb
   1413327ea:	48 8d 15 6f f6 44 00 	lea    rdx,[rip+0x44f66f]        # 0x141781e60
   1413327f1:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413327f5:	e8 86 cd d3 fe       	call   0x14006f580
   1413327fa:	e9 cc 02 00 00       	jmp    0x141332acb
   1413327ff:	48 8d 15 ba 32 37 00 	lea    rdx,[rip+0x3732ba]        # 0x1416a5ac0
   141332806:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133280a:	e8 71 cd d3 fe       	call   0x14006f580
   14133280f:	e9 b7 02 00 00       	jmp    0x141332acb
   141332814:	48 8d 15 55 f6 44 00 	lea    rdx,[rip+0x44f655]        # 0x141781e70
   14133281b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133281f:	e8 5c cd d3 fe       	call   0x14006f580
   141332824:	e9 a2 02 00 00       	jmp    0x141332acb
   141332829:	48 8d 15 18 31 37 00 	lea    rdx,[rip+0x373118]        # 0x1416a5948
   141332830:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332834:	e8 47 cd d3 fe       	call   0x14006f580
   141332839:	e9 8d 02 00 00       	jmp    0x141332acb
   14133283e:	48 8d 15 53 f6 44 00 	lea    rdx,[rip+0x44f653]        # 0x141781e98
   141332845:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332849:	e8 32 cd d3 fe       	call   0x14006f580
   14133284e:	e9 78 02 00 00       	jmp    0x141332acb
   141332853:	48 8d 15 ae 31 37 00 	lea    rdx,[rip+0x3731ae]        # 0x1416a5a08
   14133285a:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133285e:	e8 1d cd d3 fe       	call   0x14006f580
   141332863:	e9 63 02 00 00       	jmp    0x141332acb
   141332868:	48 8d 15 19 f7 44 00 	lea    rdx,[rip+0x44f719]        # 0x141781f88
   14133286f:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332873:	e8 08 cd d3 fe       	call   0x14006f580
   141332878:	e9 4e 02 00 00       	jmp    0x141332acb
   14133287d:	48 8d 15 30 30 37 00 	lea    rdx,[rip+0x373030]        # 0x1416a58b4
   141332884:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332888:	e8 f3 cc d3 fe       	call   0x14006f580
   14133288d:	e9 39 02 00 00       	jmp    0x141332acb
   141332892:	48 8d 15 17 f7 44 00 	lea    rdx,[rip+0x44f717]        # 0x141781fb0
   141332899:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133289d:	e8 de cc d3 fe       	call   0x14006f580
   1413328a2:	e9 24 02 00 00       	jmp    0x141332acb
   1413328a7:	48 8d 15 42 04 45 00 	lea    rdx,[rip+0x450442]        # 0x141782cf0
   1413328ae:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413328b2:	e8 c9 cc d3 fe       	call   0x14006f580
   1413328b7:	e9 0f 02 00 00       	jmp    0x141332acb
   1413328bc:	48 8d 15 85 48 2c 00 	lea    rdx,[rip+0x2c4885]        # 0x1415f7148
   1413328c3:	48 8d 4d bf          	lea    rcx,[rbp-0x41]
   1413328c7:	e8 b4 cc d3 fe       	call   0x14006f580
   1413328cc:	e9 fa 01 00 00       	jmp    0x141332acb
   1413328d1:	48 8d 15 24 0e 2d 00 	lea    rdx,[rip+0x2d0e24]        # 0x1416036fc
   1413328d8:	48 8d 4d bf          	lea    rcx,[rbp-0x41]
   1413328dc:	e8 9f cc d3 fe       	call   0x14006f580
   1413328e1:	e9 e5 01 00 00       	jmp    0x141332acb
   1413328e6:	48 8d 15 db f6 44 00 	lea    rdx,[rip+0x44f6db]        # 0x141781fc8
   1413328ed:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413328f1:	e8 8a cc d3 fe       	call   0x14006f580
   1413328f6:	e9 d0 01 00 00       	jmp    0x141332acb
   1413328fb:	48 8d 15 2a da 2c 00 	lea    rdx,[rip+0x2cda2a]        # 0x14160032c
   141332902:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332906:	e8 75 cc d3 fe       	call   0x14006f580
   14133290b:	e9 bb 01 00 00       	jmp    0x141332acb
   141332910:	48 8d 15 49 a0 2b 00 	lea    rdx,[rip+0x2ba049]        # 0x1415ec960
   141332917:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133291b:	e8 60 cc d3 fe       	call   0x14006f580
   141332920:	e9 a6 01 00 00       	jmp    0x141332acb
   141332925:	48 8d 15 e4 03 45 00 	lea    rdx,[rip+0x4503e4]        # 0x141782d10
   14133292c:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332930:	e8 4b cc d3 fe       	call   0x14006f580
   141332935:	e9 91 01 00 00       	jmp    0x141332acb
   14133293a:	48 8d 15 c7 03 45 00 	lea    rdx,[rip+0x4503c7]        # 0x141782d08
   141332941:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332945:	e8 36 cc d3 fe       	call   0x14006f580
   14133294a:	e9 7c 01 00 00       	jmp    0x141332acb
   14133294f:	48 8d 15 a2 04 45 00 	lea    rdx,[rip+0x4504a2]        # 0x141782df8
   141332956:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133295a:	e8 21 cc d3 fe       	call   0x14006f580
   14133295f:	e9 67 01 00 00       	jmp    0x141332acb
   141332964:	48 8d 15 81 04 45 00 	lea    rdx,[rip+0x450481]        # 0x141782dec
   14133296b:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14133296f:	e8 0c cc d3 fe       	call   0x14006f580
   141332974:	e9 52 01 00 00       	jmp    0x141332acb
   141332979:	48 8d 15 88 04 45 00 	lea    rdx,[rip+0x450488]        # 0x141782e08
   141332980:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332984:	e8 f7 cb d3 fe       	call   0x14006f580
   141332989:	e9 3d 01 00 00       	jmp    0x141332acb
   14133298e:	0f b7 d3             	movzx  edx,bx
   141332991:	48 8d 0d b0 a0 1b 01 	lea    rcx,[rip+0x11ba0b0]        # 0x1424eca48
   141332998:	66 83 ff ff          	cmp    di,0xffff
   14133299c:	75 35                	jne    0x1413329d3
   14133299e:	41 b8 06 00 00 00    	mov    r8d,0x6
   1413329a4:	e8 c7 b0 38 ff       	call   0x1406bda70
   1413329a9:	84 c0                	test   al,al
   1413329ab:	74 6a                	je     0x141332a17
   1413329ad:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1413329b2:	45 8b c8             	mov    r9d,r8d
   1413329b5:	44 0f b7 c3          	movzx  r8d,bx
   1413329b9:	48 8d 55 9f          	lea    rdx,[rbp-0x61]
   1413329bd:	48 8d 0d 84 a0 1b 01 	lea    rcx,[rip+0x11ba084]        # 0x1424eca48
   1413329c4:	e8 b7 3e f2 fe       	call   0x140256880
   1413329c9:	c6 44 24 30 01       	mov    BYTE PTR [rsp+0x30],0x1
   1413329ce:	e9 f8 00 00 00       	jmp    0x141332acb
   1413329d3:	41 b9 08 00 00 00    	mov    r9d,0x8
   1413329d9:	44 0f b7 c7          	movzx  r8d,di
   1413329dd:	e8 de cc fe ff       	call   0x14131f6c0
   1413329e2:	48 8d 0d 5f a0 1b 01 	lea    rcx,[rip+0x11ba05f]        # 0x1424eca48
   1413329e9:	84 c0                	test   al,al
   1413329eb:	74 25                	je     0x141332a12
   1413329ed:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1413329f2:	44 89 4c 24 20       	mov    DWORD PTR [rsp+0x20],r9d
   1413329f7:	44 0f b7 cf          	movzx  r9d,di
   1413329fb:	44 0f b7 c3          	movzx  r8d,bx
   1413329ff:	48 8d 55 9f          	lea    rdx,[rbp-0x61]
   141332a03:	e8 98 24 e1 fe       	call   0x140144ea0
   141332a08:	c6 44 24 30 01       	mov    BYTE PTR [rsp+0x30],0x1
   141332a0d:	e9 b9 00 00 00       	jmp    0x141332acb
   141332a12:	0f b7 d3             	movzx  edx,bx
   141332a15:	eb 87                	jmp    0x14133299e
   141332a17:	48 8d 15 46 d4 2c 00 	lea    rdx,[rip+0x2cd446]        # 0x1415ffe64
   141332a1e:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332a22:	e8 59 cb d3 fe       	call   0x14006f580
   141332a27:	e9 9f 00 00 00       	jmp    0x141332acb
   141332a2c:	0f b7 d3             	movzx  edx,bx
   141332a2f:	48 8d 0d 12 a0 1b 01 	lea    rcx,[rip+0x11ba012]        # 0x1424eca48
   141332a36:	66 83 ff ff          	cmp    di,0xffff
   141332a3a:	75 14                	jne    0x141332a50
   141332a3c:	41 b8 04 00 00 00    	mov    r8d,0x4
   141332a42:	e8 29 b0 38 ff       	call   0x1406bda70
   141332a47:	84 c0                	test   al,al
   141332a49:	74 35                	je     0x141332a80
   141332a4b:	e9 5d ff ff ff       	jmp    0x1413329ad
   141332a50:	41 b9 06 00 00 00    	mov    r9d,0x6
   141332a56:	44 0f b7 c7          	movzx  r8d,di
   141332a5a:	e8 61 cc fe ff       	call   0x14131f6c0
   141332a5f:	48 8d 0d e2 9f 1b 01 	lea    rcx,[rip+0x11b9fe2]        # 0x1424eca48
   141332a66:	84 c0                	test   al,al
   141332a68:	75 83                	jne    0x1413329ed
   141332a6a:	41 b8 04 00 00 00    	mov    r8d,0x4
   141332a70:	0f b7 d3             	movzx  edx,bx
   141332a73:	e8 f8 af 38 ff       	call   0x1406bda70
   141332a78:	84 c0                	test   al,al
   141332a7a:	0f 85 2d ff ff ff    	jne    0x1413329ad
   141332a80:	48 8d 15 79 03 45 00 	lea    rdx,[rip+0x450379]        # 0x141782e00
   141332a87:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332a8b:	e8 f0 ca d3 fe       	call   0x14006f580
   141332a90:	eb 39                	jmp    0x141332acb
   141332a92:	0f bf 44 24 38       	movsx  eax,WORD PTR [rsp+0x38]
   141332a97:	41 39 85 a4 00 00 00 	cmp    DWORD PTR [r13+0xa4],eax
   141332a9e:	75 2b                	jne    0x141332acb
   141332aa0:	48 c7 45 af 07 00 00 	mov    QWORD PTR [rbp-0x51],0x7
   141332aa7:	00 
   141332aa8:	48 8b 05 11 01 45 00 	mov    rax,QWORD PTR [rip+0x450111]        # 0x141782bc0
   141332aaf:	89 45 9f             	mov    DWORD PTR [rbp-0x61],eax
   141332ab2:	0f b7 05 0b 01 45 00 	movzx  eax,WORD PTR [rip+0x45010b]        # 0x141782bc4
   141332ab9:	66 89 45 a3          	mov    WORD PTR [rbp-0x5d],ax
   141332abd:	0f b6 05 02 01 45 00 	movzx  eax,BYTE PTR [rip+0x450102]        # 0x141782bc6
   141332ac4:	88 45 a5             	mov    BYTE PTR [rbp-0x5b],al
   141332ac7:	c6 45 a6 00          	mov    BYTE PTR [rbp-0x5a],0x0
   141332acb:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   141332ad2:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   141332ad9:	48 8d 0d d8 71 1c 01 	lea    rcx,[rip+0x11c71d8]        # 0x1424f9cb8
   141332ae0:	e8 cb 05 82 ff       	call   0x140b530b0
   141332ae5:	48 85 c0             	test   rax,rax
   141332ae8:	0f 84 24 01 00 00    	je     0x141332c12
   141332aee:	48 8d 4d 97          	lea    rcx,[rbp-0x69]
   141332af2:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   141332af7:	4c 8d 4d 87          	lea    r9,[rbp-0x79]
   141332afb:	4c 8d 44 24 34       	lea    r8,[rsp+0x34]
   141332b00:	ba ff ff ff ff       	mov    edx,0xffffffff
   141332b05:	48 8b c8             	mov    rcx,rax
   141332b08:	e8 13 8b 8b ff       	call   0x140beb620
   141332b0d:	48 8b d8             	mov    rbx,rax
   141332b10:	48 85 c0             	test   rax,rax
   141332b13:	0f 84 f9 00 00 00    	je     0x141332c12
   141332b19:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   141332b20:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   141332b27:	48 8d 0d 8a 71 1c 01 	lea    rcx,[rip+0x11c718a]        # 0x1424f9cb8
   141332b2e:	e8 7d 05 82 ff       	call   0x140b530b0
   141332b33:	48 85 c0             	test   rax,rax
   141332b36:	0f 84 d6 00 00 00    	je     0x141332c12
   141332b3c:	0f be 48 06          	movsx  ecx,BYTE PTR [rax+0x6]
   141332b40:	80 7c 24 34 00       	cmp    BYTE PTR [rsp+0x34],0x0
   141332b45:	74 4a                	je     0x141332b91
   141332b47:	85 c9                	test   ecx,ecx
   141332b49:	74 2a                	je     0x141332b75
   141332b4b:	83 f9 01             	cmp    ecx,0x1
   141332b4e:	74 09                	je     0x141332b59
   141332b50:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   141332b57:	eb 7e                	jmp    0x141332bd7
   141332b59:	48 83 bb e8 01 00 00 	cmp    QWORD PTR [rbx+0x1e8],0x0
   141332b60:	00 
   141332b61:	75 09                	jne    0x141332b6c
   141332b63:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   141332b6a:	eb 6b                	jmp    0x141332bd7
   141332b6c:	48 8d 93 d8 01 00 00 	lea    rdx,[rbx+0x1d8]
   141332b73:	eb 62                	jmp    0x141332bd7
   141332b75:	48 83 bb a8 01 00 00 	cmp    QWORD PTR [rbx+0x1a8],0x0
   141332b7c:	00 
   141332b7d:	75 09                	jne    0x141332b88
   141332b7f:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   141332b86:	eb 4f                	jmp    0x141332bd7
   141332b88:	48 8d 93 98 01 00 00 	lea    rdx,[rbx+0x198]
   141332b8f:	eb 46                	jmp    0x141332bd7
   141332b91:	85 c9                	test   ecx,ecx
   141332b93:	74 2a                	je     0x141332bbf
   141332b95:	83 f9 01             	cmp    ecx,0x1
   141332b98:	74 09                	je     0x141332ba3
   141332b9a:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   141332ba1:	eb 34                	jmp    0x141332bd7
   141332ba3:	48 83 bb 28 01 00 00 	cmp    QWORD PTR [rbx+0x128],0x0
   141332baa:	00 
   141332bab:	75 09                	jne    0x141332bb6
   141332bad:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   141332bb4:	eb 21                	jmp    0x141332bd7
   141332bb6:	48 8d 93 18 01 00 00 	lea    rdx,[rbx+0x118]
   141332bbd:	eb 18                	jmp    0x141332bd7
   141332bbf:	48 83 bb e8 00 00 00 	cmp    QWORD PTR [rbx+0xe8],0x0
   141332bc6:	00 
   141332bc7:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   141332bce:	74 07                	je     0x141332bd7
   141332bd0:	48 8d 93 d8 00 00 00 	lea    rdx,[rbx+0xd8]
   141332bd7:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141332bdb:	48 3b c2             	cmp    rax,rdx
   141332bde:	74 17                	je     0x141332bf7
   141332be0:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141332be4:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141332be9:	76 03                	jbe    0x141332bee
   141332beb:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   141332bee:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332bf2:	e8 d9 cc d3 fe       	call   0x14006f8d0
   141332bf7:	66 83 bb c8 02 00 00 	cmp    WORD PTR [rbx+0x2c8],0x0
   141332bfe:	00 
   141332bff:	7e 11                	jle    0x141332c12
   141332c01:	4c 8d 45 ff          	lea    r8,[rbp-0x1]
   141332c05:	48 8b 55 97          	mov    rdx,QWORD PTR [rbp-0x69]
   141332c09:	48 8b 4d 87          	mov    rcx,QWORD PTR [rbp-0x79]
   141332c0d:	e8 9e b3 68 ff       	call   0x1409bdfb0
   141332c12:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   141332c19:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   141332c20:	48 8d 0d 91 70 1c 01 	lea    rcx,[rip+0x11c7091]        # 0x1424f9cb8
   141332c27:	e8 84 04 82 ff       	call   0x140b530b0
   141332c2c:	48 be ff ff ff ff ff 	movabs rsi,0x7fffffffffffffff
   141332c33:	ff ff 7f 
   141332c36:	48 85 c0             	test   rax,rax
   141332c39:	0f 84 19 01 00 00    	je     0x141332d58
   141332c3f:	ba 04 00 00 00       	mov    edx,0x4
   141332c44:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
   141332c4a:	48 8b c8             	mov    rcx,rax
   141332c4d:	e8 6e 47 86 ff       	call   0x140b973c0
   141332c52:	0f b7 5c 24 32       	movzx  ebx,WORD PTR [rsp+0x32]
   141332c57:	66 85 c0             	test   ax,ax
   141332c5a:	0f 8e fd 00 00 00    	jle    0x141332d5d
   141332c60:	8d 43 99             	lea    eax,[rbx-0x67]
   141332c63:	66 83 f8 01          	cmp    ax,0x1
   141332c67:	77 22                	ja     0x141332c8b
   141332c69:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   141332c6e:	74 1b                	je     0x141332c8b
   141332c70:	41 b8 06 00 00 00    	mov    r8d,0x6
   141332c76:	48 8d 15 d3 fe 44 00 	lea    rdx,[rip+0x44fed3]        # 0x141782b50
   141332c7d:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332c81:	e8 8a cd d3 fe       	call   0x14006fa10
   141332c86:	e9 d2 00 00 00       	jmp    0x141332d5d
   141332c8b:	48 8b 7d b7          	mov    rdi,QWORD PTR [rbp-0x49]
   141332c8f:	48 83 ff 05          	cmp    rdi,0x5
   141332c93:	72 33                	jb     0x141332cc8
   141332c95:	48 8d 5d 9f          	lea    rbx,[rbp-0x61]
   141332c99:	48 83 ff 0f          	cmp    rdi,0xf
   141332c9d:	48 0f 47 5d 9f       	cmova  rbx,QWORD PTR [rbp-0x61]
   141332ca2:	48 c7 45 af 05 00 00 	mov    QWORD PTR [rbp-0x51],0x5
   141332ca9:	00 
   141332caa:	41 b8 05 00 00 00    	mov    r8d,0x5
   141332cb0:	48 8d 15 79 df 2c 00 	lea    rdx,[rip+0x2cdf79]        # 0x141600c30
   141332cb7:	48 8b cb             	mov    rcx,rbx
   141332cba:	e8 5b 81 20 00       	call   0x14153ae1a
   141332cbf:	c6 43 05 00          	mov    BYTE PTR [rbx+0x5],0x0
   141332cc3:	e9 90 00 00 00       	jmp    0x141332d58
   141332cc8:	48 8b cf             	mov    rcx,rdi
   141332ccb:	48 d1 e9             	shr    rcx,1
   141332cce:	48 8b c6             	mov    rax,rsi
   141332cd1:	48 2b c1             	sub    rax,rcx
   141332cd4:	48 3b f8             	cmp    rdi,rax
   141332cd7:	76 05                	jbe    0x141332cde
   141332cd9:	48 8b de             	mov    rbx,rsi
   141332cdc:	eb 10                	jmp    0x141332cee
   141332cde:	48 8d 04 39          	lea    rax,[rcx+rdi*1]
   141332ce2:	bb 0f 00 00 00       	mov    ebx,0xf
   141332ce7:	48 3b c3             	cmp    rax,rbx
   141332cea:	48 0f 47 d8          	cmova  rbx,rax
   141332cee:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   141332cf2:	e8 d9 da d3 fe       	call   0x1400707d0
   141332cf7:	4c 8b f8             	mov    r15,rax
   141332cfa:	48 c7 45 af 05 00 00 	mov    QWORD PTR [rbp-0x51],0x5
   141332d01:	00 
   141332d02:	48 89 5d b7          	mov    QWORD PTR [rbp-0x49],rbx
   141332d06:	8b 0d 24 df 2c 00    	mov    ecx,DWORD PTR [rip+0x2cdf24]        # 0x141600c30
   141332d0c:	89 08                	mov    DWORD PTR [rax],ecx
   141332d0e:	0f b6 0d 1f df 2c 00 	movzx  ecx,BYTE PTR [rip+0x2cdf1f]        # 0x141600c34
   141332d15:	88 48 04             	mov    BYTE PTR [rax+0x4],cl
   141332d18:	c6 40 05 00          	mov    BYTE PTR [rax+0x5],0x0
   141332d1c:	48 83 ff 0f          	cmp    rdi,0xf
   141332d20:	76 32                	jbe    0x141332d54
   141332d22:	48 8d 57 01          	lea    rdx,[rdi+0x1]
   141332d26:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   141332d2a:	48 8b c1             	mov    rax,rcx
   141332d2d:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141332d34:	72 19                	jb     0x141332d4f
   141332d36:	48 83 c2 27          	add    rdx,0x27
   141332d3a:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141332d3e:	48 2b c1             	sub    rax,rcx
   141332d41:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141332d45:	48 83 f8 1f          	cmp    rax,0x1f
   141332d49:	0f 87 5d 01 00 00    	ja     0x141332eac
   141332d4f:	e8 2c 69 20 00       	call   0x141539680
   141332d54:	4c 89 7d 9f          	mov    QWORD PTR [rbp-0x61],r15
   141332d58:	0f b7 5c 24 32       	movzx  ebx,WORD PTR [rsp+0x32]
   141332d5d:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   141332d64:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   141332d6b:	48 8d 0d 46 6f 1c 01 	lea    rcx,[rip+0x11c6f46]        # 0x1424f9cb8
   141332d72:	e8 39 03 82 ff       	call   0x140b530b0
   141332d77:	48 85 c0             	test   rax,rax
   141332d7a:	74 18                	je     0x141332d94
   141332d7c:	ba 06 00 00 00       	mov    edx,0x6
   141332d81:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
   141332d87:	48 8b c8             	mov    rcx,rax
   141332d8a:	e8 31 46 86 ff       	call   0x140b973c0
   141332d8f:	66 85 c0             	test   ax,ax
   141332d92:	7f 3f                	jg     0x141332dd3
   141332d94:	4d 8d 85 74 12 00 00 	lea    r8,[r13+0x1274]
   141332d9b:	41 8b 95 30 0c 00 00 	mov    edx,DWORD PTR [r13+0xc30]
   141332da2:	48 8d 0d 0f 6f 1c 01 	lea    rcx,[rip+0x11c6f0f]        # 0x1424f9cb8
   141332da9:	e8 02 03 82 ff       	call   0x140b530b0
   141332dae:	48 85 c0             	test   rax,rax
   141332db1:	0f 84 05 01 00 00    	je     0x141332ebc
   141332db7:	ba 07 00 00 00       	mov    edx,0x7
   141332dbc:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
   141332dc2:	48 8b c8             	mov    rcx,rax
   141332dc5:	e8 c6 5f 86 ff       	call   0x140b98d90
   141332dca:	66 85 c0             	test   ax,ax
   141332dcd:	0f 8e e9 00 00 00    	jle    0x141332ebc
   141332dd3:	8d 43 99             	lea    eax,[rbx-0x67]
   141332dd6:	66 83 f8 01          	cmp    ax,0x1
   141332dda:	77 22                	ja     0x141332dfe
   141332ddc:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   141332de1:	74 1b                	je     0x141332dfe
   141332de3:	41 b8 09 00 00 00    	mov    r8d,0x9
   141332de9:	48 8d 15 80 fd 44 00 	lea    rdx,[rip+0x44fd80]        # 0x141782b70
   141332df0:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   141332df4:	e8 17 cc d3 fe       	call   0x14006fa10
   141332df9:	e9 be 00 00 00       	jmp    0x141332ebc
   141332dfe:	48 8b 5d b7          	mov    rbx,QWORD PTR [rbp-0x49]
   141332e02:	48 83 fb 08          	cmp    rbx,0x8
   141332e06:	72 2b                	jb     0x141332e33
   141332e08:	48 8d 45 9f          	lea    rax,[rbp-0x61]
   141332e0c:	48 83 fb 0f          	cmp    rbx,0xf
   141332e10:	48 0f 47 45 9f       	cmova  rax,QWORD PTR [rbp-0x61]
   141332e15:	48 c7 45 af 08 00 00 	mov    QWORD PTR [rbp-0x51],0x8
   141332e1c:	00 
   141332e1d:	48 b9 50 72 69 73 6f 	movabs rcx,0x72656e6f73697250
   141332e24:	6e 65 72 
   141332e27:	48 89 08             	mov    QWORD PTR [rax],rcx
   141332e2a:	c6 40 08 00          	mov    BYTE PTR [rax+0x8],0x0
   141332e2e:	e9 89 00 00 00       	jmp    0x141332ebc
   141332e33:	48 8b cb             	mov    rcx,rbx
   141332e36:	48 d1 e9             	shr    rcx,1
   141332e39:	48 8b c6             	mov    rax,rsi
   141332e3c:	48 2b c1             	sub    rax,rcx
   141332e3f:	48 3b d8             	cmp    rbx,rax
   141332e42:	77 10                	ja     0x141332e54
   141332e44:	48 8d 04 0b          	lea    rax,[rbx+rcx*1]
   141332e48:	be 0f 00 00 00       	mov    esi,0xf
   141332e4d:	48 3b c6             	cmp    rax,rsi
   141332e50:	48 0f 47 f0          	cmova  rsi,rax
   141332e54:	48 8d 4e 01          	lea    rcx,[rsi+0x1]
   141332e58:	e8 73 d9 d3 fe       	call   0x1400707d0
   141332e5d:	48 8b f8             	mov    rdi,rax
   141332e60:	48 c7 45 af 08 00 00 	mov    QWORD PTR [rbp-0x51],0x8
   141332e67:	00 
   141332e68:	48 89 75 b7          	mov    QWORD PTR [rbp-0x49],rsi
   141332e6c:	48 b9 50 72 69 73 6f 	movabs rcx,0x72656e6f73697250
   141332e73:	6e 65 72 
   141332e76:	48 89 08             	mov    QWORD PTR [rax],rcx
   141332e79:	c6 40 08 00          	mov    BYTE PTR [rax+0x8],0x0
   141332e7d:	48 83 fb 0f          	cmp    rbx,0xf
   141332e81:	76 35                	jbe    0x141332eb8
   141332e83:	48 8d 53 01          	lea    rdx,[rbx+0x1]
   141332e87:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   141332e8b:	48 8b c1             	mov    rax,rcx
   141332e8e:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141332e95:	72 1c                	jb     0x141332eb3
   141332e97:	48 83 c2 27          	add    rdx,0x27
   141332e9b:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141332e9f:	48 2b c1             	sub    rax,rcx
   141332ea2:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141332ea6:	48 83 f8 1f          	cmp    rax,0x1f
   141332eaa:	76 07                	jbe    0x141332eb3
   141332eac:	ff 15 76 2c 2b 00    	call   QWORD PTR [rip+0x2b2c76]        # 0x1415e5b28
   141332eb2:	cc                   	int3
   141332eb3:	e8 c8 67 20 00       	call   0x141539680
   141332eb8:	48 89 7d 9f          	mov    QWORD PTR [rbp-0x61],rdi
   141332ebc:	0f b6 7c 24 30       	movzx  edi,BYTE PTR [rsp+0x30]
   141332ec1:	bb 01 00 00 00       	mov    ebx,0x1
   141332ec6:	66 83 7c 24 32 68    	cmp    WORD PTR [rsp+0x32],0x68
   141332ecc:	75 20                	jne    0x141332eee
   141332ece:	49 83 bd 90 00 00 00 	cmp    QWORD PTR [r13+0x90],0x0
   141332ed5:	00 
   141332ed6:	75 16                	jne    0x141332eee
   141332ed8:	4d 89 66 10          	mov    QWORD PTR [r14+0x10],r12
   141332edc:	49 8b c6             	mov    rax,r14
   141332edf:	49 83 7e 18 0f       	cmp    QWORD PTR [r14+0x18],0xf
   141332ee4:	76 03                	jbe    0x141332ee9
   141332ee6:	49 8b 06             	mov    rax,QWORD PTR [r14]
   141332ee9:	c6 00 00             	mov    BYTE PTR [rax],0x0
   141332eec:	eb 15                	jmp    0x141332f03
   141332eee:	41 b8 04 00 00 00    	mov    r8d,0x4
   141332ef4:	48 8d 15 4d 5f 2b 00 	lea    rdx,[rip+0x2b5f4d]        # 0x1415e8e48
   141332efb:	49 8b ce             	mov    rcx,r14
   141332efe:	e8 cd c9 d3 fe       	call   0x14006f8d0
   141332f03:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   141332f07:	4d 85 c0             	test   r8,r8
   141332f0a:	74 28                	je     0x141332f34
   141332f0c:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   141332f10:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   141332f15:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   141332f1a:	49 8b ce             	mov    rcx,r14
   141332f1d:	e8 ee ca d3 fe       	call   0x14006fa10
   141332f22:	4c 8b c3             	mov    r8,rbx
   141332f25:	48 8d 15 10 58 2b 00 	lea    rdx,[rip+0x2b5810]        # 0x1415e873c
   141332f2c:	49 8b ce             	mov    rcx,r14
   141332f2f:	e8 dc ca d3 fe       	call   0x14006fa10
   141332f34:	41 f7 85 18 01 00 00 	test   DWORD PTR [r13+0x118],0x1000
   141332f3b:	00 10 00 00 
   141332f3f:	74 6a                	je     0x141332fab
   141332f41:	41 80 bd 38 08 00 00 	cmp    BYTE PTR [r13+0x838],0x0
   141332f48:	00 
   141332f49:	75 6a                	jne    0x141332fb5
   141332f4b:	49 8b 4e 10          	mov    rcx,QWORD PTR [r14+0x10]
   141332f4f:	48 85 c9             	test   rcx,rcx
   141332f52:	74 1e                	je     0x141332f72
   141332f54:	49 8b c6             	mov    rax,r14
   141332f57:	49 83 7e 18 0f       	cmp    QWORD PTR [r14+0x18],0xf
   141332f5c:	76 03                	jbe    0x141332f61
   141332f5e:	49 8b 06             	mov    rax,QWORD PTR [r14]
   141332f61:	80 7c 08 ff 20       	cmp    BYTE PTR [rax+rcx*1-0x1],0x20
   141332f66:	74 0a                	je     0x141332f72
   141332f68:	b2 20                	mov    dl,0x20
   141332f6a:	49 8b ce             	mov    rcx,r14
   141332f6d:	e8 0e 6c d8 fe       	call   0x1400b9b80
   141332f72:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   141332f77:	75 1d                	jne    0x141332f96
   141332f79:	0f bf 44 24 38       	movsx  eax,WORD PTR [rsp+0x38]
   141332f7e:	41 39 85 a4 00 00 00 	cmp    DWORD PTR [r13+0xa4],eax
   141332f85:	75 0f                	jne    0x141332f96
   141332f87:	41 b8 05 00 00 00    	mov    r8d,0x5
   141332f8d:	48 8d 15 fc bc 38 00 	lea    rdx,[rip+0x38bcfc]        # 0x1416bec90
   141332f94:	eb 0d                	jmp    0x141332fa3
   141332f96:	41 b8 08 00 00 00    	mov    r8d,0x8
   141332f9c:	48 8d 15 ad 6b 2f 00 	lea    rdx,[rip+0x2f6bad]        # 0x141629b50
   141332fa3:	49 8b ce             	mov    rcx,r14
   141332fa6:	e8 65 ca d3 fe       	call   0x14006fa10
   141332fab:	41 80 bd 38 08 00 00 	cmp    BYTE PTR [r13+0x838],0x0
   141332fb2:	00 
   141332fb3:	74 66                	je     0x14133301b
   141332fb5:	49 83 bd 50 08 00 00 	cmp    QWORD PTR [r13+0x850],0x0
   141332fbc:	00 
   141332fbd:	75 5c                	jne    0x14133301b
   141332fbf:	49 83 bd 90 08 00 00 	cmp    QWORD PTR [r13+0x890],0x0
   141332fc6:	00 
   141332fc7:	74 52                	je     0x14133301b
   141332fc9:	49 8d 95 80 08 00 00 	lea    rdx,[r13+0x880]
   141332fd0:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141332fd4:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141332fd9:	76 03                	jbe    0x141332fde
   141332fdb:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   141332fde:	49 8b ce             	mov    rcx,r14
   141332fe1:	e8 2a ca d3 fe       	call   0x14006fa10
   141332fe6:	4c 8b c3             	mov    r8,rbx
   141332fe9:	48 8d 15 4c 57 2b 00 	lea    rdx,[rip+0x2b574c]        # 0x1415e873c
   141332ff0:	49 8b ce             	mov    rcx,r14
   141332ff3:	e8 18 ca d3 fe       	call   0x14006fa10
   141332ff8:	0f bf 44 24 38       	movsx  eax,WORD PTR [rsp+0x38]
   141332ffd:	41 39 85 a4 00 00 00 	cmp    DWORD PTR [r13+0xa4],eax
   141333004:	75 15                	jne    0x14133301b
   141333006:	41 b8 03 00 00 00    	mov    r8d,0x3
   14133300c:	48 8d 15 25 fe 44 00 	lea    rdx,[rip+0x44fe25]        # 0x141782e38
   141333013:	49 8b ce             	mov    rcx,r14
   141333016:	e8 f5 c9 d3 fe       	call   0x14006fa10
   14133301b:	49 63 9d a4 00 00 00 	movsxd rbx,DWORD PTR [r13+0xa4]
   141333022:	0f bf 44 24 38       	movsx  eax,WORD PTR [rsp+0x38]
   141333027:	3b d8                	cmp    ebx,eax
   141333029:	0f 84 35 01 00 00    	je     0x141333164
   14133302f:	40 84 ff             	test   dil,dil
   141333032:	0f 85 2c 01 00 00    	jne    0x141333164
   141333038:	0f 57 c0             	xorps  xmm0,xmm0
   14133303b:	0f 11 45 df          	movups XMMWORD PTR [rbp-0x21],xmm0
   14133303f:	48 c7 45 f7 0f 00 00 	mov    QWORD PTR [rbp-0x9],0xf
   141333046:	00 
   141333047:	49 0f bf 95 2c 01 00 	movsx  rdx,WORD PTR [r13+0x12c]
   14133304e:	00 
   14133304f:	4c 89 65 ef          	mov    QWORD PTR [rbp-0x11],r12
   141333053:	40 88 7d df          	mov    BYTE PTR [rbp-0x21],dil
   141333057:	66 83 fa ff          	cmp    dx,0xffff
   14133305b:	74 7e                	je     0x1413330db
   14133305d:	66 85 db             	test   bx,bx
   141333060:	0f 88 c0 00 00 00    	js     0x141333126
   141333066:	4c 8b 05 fb 99 1b 01 	mov    r8,QWORD PTR [rip+0x11b99fb]        # 0x1424eca68
   14133306d:	4c 0f bf cb          	movsx  r9,bx
   141333071:	48 8b 0d f8 99 1b 01 	mov    rcx,QWORD PTR [rip+0x11b99f8]        # 0x1424eca70
   141333078:	48 8b c1             	mov    rax,rcx
   14133307b:	49 2b c0             	sub    rax,r8
   14133307e:	48 c1 f8 03          	sar    rax,0x3
   141333082:	4c 3b c8             	cmp    r9,rax
   141333085:	73 67                	jae    0x1413330ee
   141333087:	66 85 d2             	test   dx,dx
   14133308a:	78 62                	js     0x1413330ee
   14133308c:	4b 8b 04 c8          	mov    rax,QWORD PTR [r8+r9*8]
   141333090:	4c 8b 88 78 01 00 00 	mov    r9,QWORD PTR [rax+0x178]
   141333097:	48 8b 80 80 01 00 00 	mov    rax,QWORD PTR [rax+0x180]
   14133309e:	49 2b c1             	sub    rax,r9
   1413330a1:	48 c1 f8 03          	sar    rax,0x3
   1413330a5:	48 3b d0             	cmp    rdx,rax
   1413330a8:	73 44                	jae    0x1413330ee
   1413330aa:	49 8b 14 d1          	mov    rdx,QWORD PTR [r9+rdx*8]
   1413330ae:	48 83 c2 20          	add    rdx,0x20
   1413330b2:	48 8d 45 df          	lea    rax,[rbp-0x21]
   1413330b6:	48 3b c2             	cmp    rax,rdx
   1413330b9:	74 33                	je     0x1413330ee
   1413330bb:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   1413330bf:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   1413330c4:	76 03                	jbe    0x1413330c9
   1413330c6:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   1413330c9:	48 8d 4d df          	lea    rcx,[rbp-0x21]
   1413330cd:	e8 fe c7 d3 fe       	call   0x14006f8d0
   1413330d2:	48 83 7d ef 00       	cmp    QWORD PTR [rbp-0x11],0x0
   1413330d7:	76 07                	jbe    0x1413330e0
   1413330d9:	eb 4b                	jmp    0x141333126
   1413330db:	66 85 db             	test   bx,bx
   1413330de:	78 46                	js     0x141333126
   1413330e0:	48 8b 0d 89 99 1b 01 	mov    rcx,QWORD PTR [rip+0x11b9989]        # 0x1424eca70
   1413330e7:	4c 8b 05 7a 99 1b 01 	mov    r8,QWORD PTR [rip+0x11b997a]        # 0x1424eca68
   1413330ee:	48 0f bf d3          	movsx  rdx,bx
   1413330f2:	49 2b c8             	sub    rcx,r8
   1413330f5:	48 c1 f9 03          	sar    rcx,0x3
   1413330f9:	48 3b d1             	cmp    rdx,rcx
   1413330fc:	73 28                	jae    0x141333126
   1413330fe:	49 8b 14 d0          	mov    rdx,QWORD PTR [r8+rdx*8]
   141333102:	48 83 c2 20          	add    rdx,0x20
   141333106:	48 8d 45 df          	lea    rax,[rbp-0x21]
   14133310a:	48 3b c2             	cmp    rax,rdx
   14133310d:	74 17                	je     0x141333126
   14133310f:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141333113:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141333118:	76 03                	jbe    0x14133311d
   14133311a:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14133311d:	48 8d 4d df          	lea    rcx,[rbp-0x21]
   141333121:	e8 aa c7 d3 fe       	call   0x14006f8d0
   141333126:	48 8d 4d df          	lea    rcx,[rbp-0x21]
   14133312a:	e8 91 a2 1f ff       	call   0x14052d3c0
   14133312f:	48 8d 55 df          	lea    rdx,[rbp-0x21]
   141333133:	48 83 7d f7 0f       	cmp    QWORD PTR [rbp-0x9],0xf
   141333138:	48 0f 47 55 df       	cmova  rdx,QWORD PTR [rbp-0x21]
   14133313d:	4c 8b 45 ef          	mov    r8,QWORD PTR [rbp-0x11]
   141333141:	49 8b ce             	mov    rcx,r14
   141333144:	e8 c7 c8 d3 fe       	call   0x14006fa10
   141333149:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   14133314e:	74 0b                	je     0x14133315b
   141333150:	b2 20                	mov    dl,0x20
   141333152:	49 8b ce             	mov    rcx,r14
   141333155:	e8 26 6a d8 fe       	call   0x1400b9b80
   14133315a:	90                   	nop
   14133315b:	48 8d 4d df          	lea    rcx,[rbp-0x21]
   14133315f:	e8 ec c6 d3 fe       	call   0x14006f850
   141333164:	41 80 bd 38 08 00 00 	cmp    BYTE PTR [r13+0x838],0x0
   14133316b:	00 
   14133316c:	74 49                	je     0x1413331b7
   14133316e:	49 83 bd 50 08 00 00 	cmp    QWORD PTR [r13+0x850],0x0
   141333175:	00 
   141333176:	74 3f                	je     0x1413331b7
   141333178:	49 83 7e 10 00       	cmp    QWORD PTR [r14+0x10],0x0
   14133317d:	74 0a                	je     0x141333189
   14133317f:	b2 20                	mov    dl,0x20
   141333181:	49 8b ce             	mov    rcx,r14
   141333184:	e8 f7 69 d8 fe       	call   0x1400b9b80
   141333189:	49 8d 95 40 08 00 00 	lea    rdx,[r13+0x840]
   141333190:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141333194:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141333199:	76 03                	jbe    0x14133319e
   14133319b:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14133319e:	49 8b ce             	mov    rcx,r14
   1413331a1:	e8 6a c8 d3 fe       	call   0x14006fa10
   1413331a6:	48 83 7d af 00       	cmp    QWORD PTR [rbp-0x51],0x0
   1413331ab:	74 0a                	je     0x1413331b7
   1413331ad:	b2 20                	mov    dl,0x20
   1413331af:	49 8b ce             	mov    rcx,r14
   1413331b2:	e8 c9 69 d8 fe       	call   0x1400b9b80
   1413331b7:	48 8d 55 9f          	lea    rdx,[rbp-0x61]
   1413331bb:	48 83 7d b7 0f       	cmp    QWORD PTR [rbp-0x49],0xf
   1413331c0:	48 0f 47 55 9f       	cmova  rdx,QWORD PTR [rbp-0x61]
   1413331c5:	4c 8b 45 af          	mov    r8,QWORD PTR [rbp-0x51]
   1413331c9:	49 8b ce             	mov    rcx,r14
   1413331cc:	e8 3f c8 d3 fe       	call   0x14006fa10
   1413331d1:	90                   	nop
   1413331d2:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   1413331d6:	48 83 fa 0f          	cmp    rdx,0xf
   1413331da:	76 34                	jbe    0x141333210
   1413331dc:	48 ff c2             	inc    rdx
   1413331df:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   1413331e3:	48 8b c1             	mov    rax,rcx
   1413331e6:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1413331ed:	72 1c                	jb     0x14133320b
   1413331ef:	48 83 c2 27          	add    rdx,0x27
   1413331f3:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1413331f7:	48 2b c1             	sub    rax,rcx
   1413331fa:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1413331fe:	48 83 f8 1f          	cmp    rax,0x1f
   141333202:	76 07                	jbe    0x14133320b
   141333204:	ff 15 1e 29 2b 00    	call   QWORD PTR [rip+0x2b291e]        # 0x1415e5b28
   14133320a:	cc                   	int3
   14133320b:	e8 70 64 20 00       	call   0x141539680
   141333210:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   141333214:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   14133321b:	00 
   14133321c:	c6 45 bf 00          	mov    BYTE PTR [rbp-0x41],0x0
   141333220:	48 8b 55 b7          	mov    rdx,QWORD PTR [rbp-0x49]
   141333224:	48 83 fa 0f          	cmp    rdx,0xf
   141333228:	76 34                	jbe    0x14133325e
   14133322a:	48 ff c2             	inc    rdx
   14133322d:	48 8b 4d 9f          	mov    rcx,QWORD PTR [rbp-0x61]
   141333231:	48 8b c1             	mov    rax,rcx
   141333234:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14133323b:	72 1c                	jb     0x141333259
   14133323d:	48 83 c2 27          	add    rdx,0x27
   141333241:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141333245:	48 2b c1             	sub    rax,rcx
   141333248:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14133324c:	48 83 f8 1f          	cmp    rax,0x1f
   141333250:	76 07                	jbe    0x141333259
   141333252:	ff 15 d0 28 2b 00    	call   QWORD PTR [rip+0x2b28d0]        # 0x1415e5b28
   141333258:	cc                   	int3
   141333259:	e8 22 64 20 00       	call   0x141539680
   14133325e:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   141333263:	80 7e 72 00          	cmp    BYTE PTR [rsi+0x72],0x0
   141333267:	0f 84 10 02 00 00    	je     0x14133347d
   14133326d:	83 3d 50 90 56 00 01 	cmp    DWORD PTR [rip+0x569050],0x1        # 0x14189c2c4
   141333274:	0f 85 b2 01 00 00    	jne    0x14133342c
   14133327a:	48 8b 05 4f 1e 0b 01 	mov    rax,QWORD PTR [rip+0x10b1e4f]        # 0x1423e50d0
   141333281:	48 2b 05 40 1e 0b 01 	sub    rax,QWORD PTR [rip+0x10b1e40]        # 0x1423e50c8
   141333288:	48 c1 f8 03          	sar    rax,0x3
   14133328c:	48 85 c0             	test   rax,rax
   14133328f:	0f 84 e8 01 00 00    	je     0x14133347d
   141333295:	48 8b 15 74 1e 0b 01 	mov    rdx,QWORD PTR [rip+0x10b1e74]        # 0x1423e5110
   14133329c:	48 85 d2             	test   rdx,rdx
   14133329f:	0f 84 d8 01 00 00    	je     0x14133347d
   1413332a5:	32 db                	xor    bl,bl
   1413332a7:	4c 8d 82 74 12 00 00 	lea    r8,[rdx+0x1274]
   1413332ae:	8b 92 30 0c 00 00    	mov    edx,DWORD PTR [rdx+0xc30]
   1413332b4:	48 8d 0d fd 69 1c 01 	lea    rcx,[rip+0x11c69fd]        # 0x1424f9cb8
   1413332bb:	e8 f0 fd 81 ff       	call   0x140b530b0
   1413332c0:	48 8b f8             	mov    rdi,rax
   1413332c3:	48 85 c0             	test   rax,rax
   1413332c6:	0f 84 b1 01 00 00    	je     0x14133347d
   1413332cc:	41 8b 8d 30 0c 00 00 	mov    ecx,DWORD PTR [r13+0xc30]
   1413332d3:	83 f9 ff             	cmp    ecx,0xffffffff
   1413332d6:	74 6c                	je     0x141333344
   1413332d8:	48 8b 90 30 01 00 00 	mov    rdx,QWORD PTR [rax+0x130]
   1413332df:	48 85 d2             	test   rdx,rdx
   1413332e2:	74 60                	je     0x141333344
   1413332e4:	48 83 7a 60 00       	cmp    QWORD PTR [rdx+0x60],0x0
   1413332e9:	74 59                	je     0x141333344
   1413332eb:	48 8b 52 60          	mov    rdx,QWORD PTR [rdx+0x60]
   1413332ef:	e8 cc 6a d8 fe       	call   0x1400b9dc0
   1413332f4:	48 85 c0             	test   rax,rax
   1413332f7:	74 4b                	je     0x141333344
   1413332f9:	f6 40 04 01          	test   BYTE PTR [rax+0x4],0x1
   1413332fd:	0f 85 8f 00 00 00    	jne    0x141333392
   141333303:	4c 8b 44 24 40       	mov    r8,QWORD PTR [rsp+0x40]
   141333308:	4d 85 c0             	test   r8,r8
   14133330b:	74 37                	je     0x141333344
   14133330d:	48 8d 50 08          	lea    rdx,[rax+0x8]
   141333311:	45 8b 00             	mov    r8d,DWORD PTR [r8]
   141333314:	48 8d 4d 87          	lea    rcx,[rbp-0x79]
   141333318:	e8 c3 78 d8 fe       	call   0x1400babe0
   14133331d:	c7 44 24 48 ff ff ff 	mov    DWORD PTR [rsp+0x48],0xffffffff
   141333324:	ff 
   141333325:	44 89 65 83          	mov    DWORD PTR [rbp-0x7d],r12d
   141333329:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   14133332e:	38 5d 8f             	cmp    BYTE PTR [rbp-0x71],bl
   141333331:	48 0f 45 45 87       	cmovne rax,QWORD PTR [rbp-0x79]
   141333336:	0f b6 db             	movzx  ebx,bl
   141333339:	83 f8 ff             	cmp    eax,0xffffffff
   14133333c:	b9 01 00 00 00       	mov    ecx,0x1
   141333341:	0f 45 d9             	cmovne ebx,ecx
   141333344:	45 8b 85 4c 01 00 00 	mov    r8d,DWORD PTR [r13+0x14c]
   14133334b:	41 83 f8 ff          	cmp    r8d,0xffffffff
   14133334f:	74 47                	je     0x141333398
   141333351:	48 8b 87 30 01 00 00 	mov    rax,QWORD PTR [rdi+0x130]
   141333358:	48 85 c0             	test   rax,rax
   14133335b:	74 3b                	je     0x141333398
   14133335d:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   141333361:	48 85 d2             	test   rdx,rdx
   141333364:	74 32                	je     0x141333398
   141333366:	48 83 c2 48          	add    rdx,0x48
   14133336a:	48 8d 4d 87          	lea    rcx,[rbp-0x79]
   14133336e:	e8 6d 78 d8 fe       	call   0x1400babe0
   141333373:	c7 44 24 48 ff ff ff 	mov    DWORD PTR [rsp+0x48],0xffffffff
   14133337a:	ff 
   14133337b:	44 89 65 83          	mov    DWORD PTR [rbp-0x7d],r12d
   14133337f:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   141333384:	80 7d 8f 00          	cmp    BYTE PTR [rbp-0x71],0x0
   141333388:	48 0f 45 45 87       	cmovne rax,QWORD PTR [rbp-0x79]
   14133338d:	83 f8 ff             	cmp    eax,0xffffffff
   141333390:	74 06                	je     0x141333398
   141333392:	49 8d 75 08          	lea    rsi,[r13+0x8]
   141333396:	eb 08                	jmp    0x1413333a0
   141333398:	84 db                	test   bl,bl
   14133339a:	0f 84 dd 00 00 00    	je     0x14133347d
   1413333a0:	b2 20                	mov    dl,0x20
   1413333a2:	49 8b ce             	mov    rcx,r14
   1413333a5:	e8 d6 67 d8 fe       	call   0x1400b9b80
   1413333aa:	0f 57 c0             	xorps  xmm0,xmm0
   1413333ad:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   1413333b1:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   1413333b5:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   1413333bc:	00 
   1413333bd:	c6 45 bf 00          	mov    BYTE PTR [rbp-0x41],0x0
   1413333c1:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   1413333c5:	48 8b ce             	mov    rcx,rsi
   1413333c8:	e8 63 0c 76 ff       	call   0x140a94030
   1413333cd:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   1413333d1:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   1413333d6:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   1413333db:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   1413333df:	49 8b ce             	mov    rcx,r14
   1413333e2:	e8 29 c6 d3 fe       	call   0x14006fa10
   1413333e7:	90                   	nop
   1413333e8:	48 8b 55 d7          	mov    rdx,QWORD PTR [rbp-0x29]
   1413333ec:	48 83 fa 0f          	cmp    rdx,0xf
   1413333f0:	0f 86 87 00 00 00    	jbe    0x14133347d
   1413333f6:	48 ff c2             	inc    rdx
   1413333f9:	48 8b 4d bf          	mov    rcx,QWORD PTR [rbp-0x41]
   1413333fd:	48 8b c1             	mov    rax,rcx
   141333400:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141333407:	72 1c                	jb     0x141333425
   141333409:	48 83 c2 27          	add    rdx,0x27
   14133340d:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141333411:	48 2b c1             	sub    rax,rcx
   141333414:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141333418:	48 83 f8 1f          	cmp    rax,0x1f
   14133341c:	76 07                	jbe    0x141333425
   14133341e:	ff 15 04 27 2b 00    	call   QWORD PTR [rip+0x2b2704]        # 0x1415e5b28
   141333424:	cc                   	int3
   141333425:	e8 56 62 20 00       	call   0x141539680
   14133342a:	eb 51                	jmp    0x14133347d
   14133342c:	b2 20                	mov    dl,0x20
   14133342e:	49 8b ce             	mov    rcx,r14
   141333431:	e8 4a 67 d8 fe       	call   0x1400b9b80
   141333436:	0f 57 c0             	xorps  xmm0,xmm0
   141333439:	0f 11 45 bf          	movups XMMWORD PTR [rbp-0x41],xmm0
   14133343d:	4c 89 65 cf          	mov    QWORD PTR [rbp-0x31],r12
   141333441:	48 c7 45 d7 0f 00 00 	mov    QWORD PTR [rbp-0x29],0xf
   141333448:	00 
   141333449:	c6 45 bf 00          	mov    BYTE PTR [rbp-0x41],0x0
   14133344d:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   141333451:	48 8b ce             	mov    rcx,rsi
   141333454:	e8 d7 0b 76 ff       	call   0x140a94030
   141333459:	48 8d 55 bf          	lea    rdx,[rbp-0x41]
   14133345d:	48 83 7d d7 0f       	cmp    QWORD PTR [rbp-0x29],0xf
   141333462:	48 0f 47 55 bf       	cmova  rdx,QWORD PTR [rbp-0x41]
   141333467:	4c 8b 45 cf          	mov    r8,QWORD PTR [rbp-0x31]
   14133346b:	49 8b ce             	mov    rcx,r14
   14133346e:	e8 9d c5 d3 fe       	call   0x14006fa10
   141333473:	90                   	nop
   141333474:	48 8d 4d bf          	lea    rcx,[rbp-0x41]
   141333478:	e8 d3 c3 d3 fe       	call   0x14006f850
   14133347d:	4c 8b 45 0f          	mov    r8,QWORD PTR [rbp+0xf]
   141333481:	4d 85 c0             	test   r8,r8
   141333484:	74 17                	je     0x14133349d
   141333486:	48 8d 55 ff          	lea    rdx,[rbp-0x1]
   14133348a:	48 83 7d 17 0f       	cmp    QWORD PTR [rbp+0x17],0xf
   14133348f:	48 0f 47 55 ff       	cmova  rdx,QWORD PTR [rbp-0x1]
   141333494:	49 8b ce             	mov    rcx,r14
   141333497:	e8 74 c5 d3 fe       	call   0x14006fa10
   14133349c:	90                   	nop
   14133349d:	48 8d 4d ff          	lea    rcx,[rbp-0x1]
   1413334a1:	e8 aa c3 d3 fe       	call   0x14006f850
   1413334a6:	eb 38                	jmp    0x1413334e0
   1413334a8:	48 8b 91 80 0d 00 00 	mov    rdx,QWORD PTR [rcx+0xd80]
   1413334af:	48 85 d2             	test   rdx,rdx
   1413334b2:	74 0d                	je     0x1413334c1
   1413334b4:	48 83 7a 30 00       	cmp    QWORD PTR [rdx+0x30],0x0
   1413334b9:	74 06                	je     0x1413334c1
   1413334bb:	48 83 c2 20          	add    rdx,0x20
   1413334bf:	eb 04                	jmp    0x1413334c5
   1413334c1:	48 8d 51 08          	lea    rdx,[rcx+0x8]
   1413334c5:	4c 3b f2             	cmp    r14,rdx
   1413334c8:	74 16                	je     0x1413334e0
   1413334ca:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   1413334cf:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   1413334d3:	76 03                	jbe    0x1413334d8
   1413334d5:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   1413334d8:	49 8b ce             	mov    rcx,r14
   1413334db:	e8 f0 c3 d3 fe       	call   0x14006f8d0
   1413334e0:	48 8b 4d 1f          	mov    rcx,QWORD PTR [rbp+0x1f]
   1413334e4:	48 33 cc             	xor    rcx,rsp
   1413334e7:	e8 74 61 20 00       	call   0x141539660
   1413334ec:	48 8b 9c 24 40 01 00 	mov    rbx,QWORD PTR [rsp+0x140]
   1413334f3:	00 
   1413334f4:	48 81 c4 f0 00 00 00 	add    rsp,0xf0
   1413334fb:	41 5f                	pop    r15
   1413334fd:	41 5e                	pop    r14
   1413334ff:	41 5d                	pop    r13
   141333501:	41 5c                	pop    r12
   141333503:	5f                   	pop    rdi
   141333504:	5e                   	pop    rsi
   141333505:	5d                   	pop    rbp
   141333506:	c3                   	ret
