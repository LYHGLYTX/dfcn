
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

00000001413345d0 <.text+0x13335d0>:
   1413345d0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1413345d5:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
   1413345da:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   1413345df:	57                   	push   rdi
   1413345e0:	48 83 ec 20          	sub    rsp,0x20
   1413345e4:	49 63 f9             	movsxd rdi,r9d
   1413345e7:	48 8b da             	mov    rbx,rdx
   1413345ea:	48 8b f1             	mov    rsi,rcx
   1413345ed:	66 45 85 c0          	test   r8w,r8w
   1413345f1:	0f 88 e6 01 00 00    	js     0x1413347dd
   1413345f7:	48 8b 81 f8 05 00 00 	mov    rax,QWORD PTR [rcx+0x5f8]
   1413345fe:	49 0f bf e8          	movsx  rbp,r8w
   141334602:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   141334605:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   141334609:	4c 2b c1             	sub    r8,rcx
   14133460c:	49 c1 f8 03          	sar    r8,0x3
   141334610:	49 3b e8             	cmp    rbp,r8
   141334613:	0f 83 c4 01 00 00    	jae    0x1413347dd
   141334619:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   14133461d:	48 8b 88 98 00 00 00 	mov    rcx,QWORD PTR [rax+0x98]
   141334624:	48 2b 88 90 00 00 00 	sub    rcx,QWORD PTR [rax+0x90]
   14133462b:	48 c1 f9 03          	sar    rcx,0x3
   14133462f:	48 85 c9             	test   rcx,rcx
   141334632:	0f 84 32 01 00 00    	je     0x14133476a
   141334638:	45 85 c9             	test   r9d,r9d
   14133463b:	7e 6b                	jle    0x1413346a8
   14133463d:	48 3b cf             	cmp    rcx,rdi
   141334640:	76 66                	jbe    0x1413346a8
   141334642:	66 83 7c 24 50 00    	cmp    WORD PTR [rsp+0x50],0x0
   141334648:	75 2f                	jne    0x141334679
   14133464a:	48 8b 80 a8 00 00 00 	mov    rax,QWORD PTR [rax+0xa8]
   141334651:	48 8b 14 f8          	mov    rdx,QWORD PTR [rax+rdi*8]
   141334655:	48 3b da             	cmp    rbx,rdx
   141334658:	0f 84 a6 01 00 00    	je     0x141334804
   14133465e:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141334663:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141334667:	76 03                	jbe    0x14133466c
   141334669:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14133466c:	48 8b cb             	mov    rcx,rbx
   14133466f:	e8 5c b2 d3 fe       	call   0x14006f8d0
   141334674:	e9 8b 01 00 00       	jmp    0x141334804
   141334679:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
   141334680:	48 8b 14 f8          	mov    rdx,QWORD PTR [rax+rdi*8]
   141334684:	48 3b da             	cmp    rbx,rdx
   141334687:	0f 84 77 01 00 00    	je     0x141334804
   14133468d:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141334692:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141334696:	76 03                	jbe    0x14133469b
   141334698:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14133469b:	48 8b cb             	mov    rcx,rbx
   14133469e:	e8 2d b2 d3 fe       	call   0x14006f8d0
   1413346a3:	e9 5c 01 00 00       	jmp    0x141334804
   1413346a8:	48 c7 42 10 00 00 00 	mov    QWORD PTR [rdx+0x10],0x0
   1413346af:	00 
   1413346b0:	48 8b c3             	mov    rax,rbx
   1413346b3:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   1413346b8:	76 03                	jbe    0x1413346bd
   1413346ba:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   1413346bd:	c6 00 00             	mov    BYTE PTR [rax],0x0
   1413346c0:	45 85 c9             	test   r9d,r9d
   1413346c3:	7e 14                	jle    0x1413346d9
   1413346c5:	45 33 c0             	xor    r8d,r8d
   1413346c8:	8b cf                	mov    ecx,edi
   1413346ca:	e8 a1 a4 1f ff       	call   0x14052eb70
   1413346cf:	b2 20                	mov    dl,0x20
   1413346d1:	48 8b cb             	mov    rcx,rbx
   1413346d4:	e8 a7 54 d8 fe       	call   0x1400b9b80
   1413346d9:	0f b7 54 24 50       	movzx  edx,WORD PTR [rsp+0x50]
   1413346de:	66 85 d2             	test   dx,dx
   1413346e1:	74 54                	je     0x141334737
   1413346e3:	85 ff                	test   edi,edi
   1413346e5:	75 1d                	jne    0x141334704
   1413346e7:	48 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [rsi+0x5f8]
   1413346ee:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1413346f1:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   1413346f5:	83 b8 84 00 00 00 01 	cmp    DWORD PTR [rax+0x84],0x1
   1413346fc:	7e 06                	jle    0x141334704
   1413346fe:	66 83 fa 02          	cmp    dx,0x2
   141334702:	74 33                	je     0x141334737
   141334704:	48 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [rsi+0x5f8]
   14133470b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14133470e:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   141334712:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
   141334719:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   14133471c:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141334721:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141334725:	76 03                	jbe    0x14133472a
   141334727:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14133472a:	48 8b cb             	mov    rcx,rbx
   14133472d:	e8 de b2 d3 fe       	call   0x14006fa10
   141334732:	e9 cd 00 00 00       	jmp    0x141334804
   141334737:	48 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [rsi+0x5f8]
   14133473e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   141334741:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   141334745:	48 8b 88 a8 00 00 00 	mov    rcx,QWORD PTR [rax+0xa8]
   14133474c:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   14133474f:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141334754:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141334758:	76 03                	jbe    0x14133475d
   14133475a:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14133475d:	48 8b cb             	mov    rcx,rbx
   141334760:	e8 ab b2 d3 fe       	call   0x14006fa10
   141334765:	e9 9a 00 00 00       	jmp    0x141334804
   14133476a:	48 c7 42 10 00 00 00 	mov    QWORD PTR [rdx+0x10],0x0
   141334771:	00 
   141334772:	48 8b c3             	mov    rax,rbx
   141334775:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14133477a:	76 03                	jbe    0x14133477f
   14133477c:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14133477f:	c6 00 00             	mov    BYTE PTR [rax],0x0
   141334782:	45 85 c9             	test   r9d,r9d
   141334785:	7e 14                	jle    0x14133479b
   141334787:	45 33 c0             	xor    r8d,r8d
   14133478a:	8b cf                	mov    ecx,edi
   14133478c:	e8 df a3 1f ff       	call   0x14052eb70
   141334791:	b2 20                	mov    dl,0x20
   141334793:	48 8b cb             	mov    rcx,rbx
   141334796:	e8 e5 53 d8 fe       	call   0x1400b9b80
   14133479b:	41 b8 09 00 00 00    	mov    r8d,0x9
   1413347a1:	48 8d 15 a8 c8 34 00 	lea    rdx,[rip+0x34c8a8]        # 0x141681050
   1413347a8:	48 8b cb             	mov    rcx,rbx
   1413347ab:	e8 60 b2 d3 fe       	call   0x14006fa10
   1413347b0:	0f b7 54 24 50       	movzx  edx,WORD PTR [rsp+0x50]
   1413347b5:	66 85 d2             	test   dx,dx
   1413347b8:	74 40                	je     0x1413347fa
   1413347ba:	85 ff                	test   edi,edi
   1413347bc:	75 46                	jne    0x141334804
   1413347be:	48 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [rsi+0x5f8]
   1413347c5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1413347c8:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   1413347cc:	83 b8 84 00 00 00 01 	cmp    DWORD PTR [rax+0x84],0x1
   1413347d3:	7e 2f                	jle    0x141334804
   1413347d5:	66 83 fa 02          	cmp    dx,0x2
   1413347d9:	74 1f                	je     0x1413347fa
   1413347db:	eb 27                	jmp    0x141334804
   1413347dd:	41 b8 09 00 00 00    	mov    r8d,0x9
   1413347e3:	48 8d 15 66 c8 34 00 	lea    rdx,[rip+0x34c866]        # 0x141681050
   1413347ea:	48 8b cb             	mov    rcx,rbx
   1413347ed:	e8 de b0 d3 fe       	call   0x14006f8d0
   1413347f2:	66 83 7c 24 50 00    	cmp    WORD PTR [rsp+0x50],0x0
   1413347f8:	75 0a                	jne    0x141334804
   1413347fa:	b2 73                	mov    dl,0x73
   1413347fc:	48 8b cb             	mov    rcx,rbx
   1413347ff:	e8 7c 53 d8 fe       	call   0x1400b9b80
   141334804:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   141334809:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
   14133480e:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   141334813:	48 83 c4 20          	add    rsp,0x20
   141334817:	5f                   	pop    rdi
   141334818:	c3                   	ret
