
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014052c590 <.text+0x52b590>:
   14052c590:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   14052c595:	57                   	push   rdi
   14052c596:	48 83 ec 20          	sub    rsp,0x20
   14052c59a:	48 c7 42 10 00 00 00 	mov    QWORD PTR [rdx+0x10],0x0
   14052c5a1:	00 
   14052c5a2:	48 8b da             	mov    rbx,rdx
   14052c5a5:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14052c5aa:	8b f9                	mov    edi,ecx
   14052c5ac:	48 8b c2             	mov    rax,rdx
   14052c5af:	76 03                	jbe    0x14052c5b4
   14052c5b1:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14052c5b4:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14052c5b7:	45 84 c0             	test   r8b,r8b
   14052c5ba:	0f 84 ea 00 00 00    	je     0x14052c6aa
   14052c5c0:	85 ff                	test   edi,edi
   14052c5c2:	79 17                	jns    0x14052c5db
   14052c5c4:	f7 df                	neg    edi
   14052c5c6:	48 8d 15 af a0 11 01 	lea    rdx,[rip+0x111a0af]        # 0x14164667c
   14052c5cd:	41 b8 01 00 00 00    	mov    r8d,0x1
   14052c5d3:	48 8b cb             	mov    rcx,rbx
   14052c5d6:	e8 85 32 b4 ff       	call   0x14006f860
   14052c5db:	48 8b d3             	mov    rdx,rbx
   14052c5de:	8b cf                	mov    ecx,edi
   14052c5e0:	e8 0b d7 ff ff       	call   0x140529cf0
   14052c5e5:	b8 67 66 66 66       	mov    eax,0x66666667
   14052c5ea:	8b cf                	mov    ecx,edi
   14052c5ec:	f7 ef                	imul   edi
   14052c5ee:	c1 fa 02             	sar    edx,0x2
   14052c5f1:	8b c2                	mov    eax,edx
   14052c5f3:	c1 e8 1f             	shr    eax,0x1f
   14052c5f6:	03 d0                	add    edx,eax
   14052c5f8:	8d 04 92             	lea    eax,[rdx+rdx*4]
   14052c5fb:	03 c0                	add    eax,eax
   14052c5fd:	2b c8                	sub    ecx,eax
   14052c5ff:	83 e9 01             	sub    ecx,0x1
   14052c602:	74 76                	je     0x14052c67a
   14052c604:	83 e9 01             	sub    ecx,0x1
   14052c607:	74 41                	je     0x14052c64a
   14052c609:	83 f9 01             	cmp    ecx,0x1
   14052c60c:	74 0c                	je     0x14052c61a
   14052c60e:	48 8d 15 6b b0 0b 01 	lea    rdx,[rip+0x10bb06b]        # 0x1415e7680
   14052c615:	e9 2c 04 00 00       	jmp    0x14052ca46
   14052c61a:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052c61f:	f7 ef                	imul   edi
   14052c621:	c1 fa 05             	sar    edx,0x5
   14052c624:	8b c2                	mov    eax,edx
   14052c626:	c1 e8 1f             	shr    eax,0x1f
   14052c629:	03 d0                	add    edx,eax
   14052c62b:	6b c2 64             	imul   eax,edx,0x64
   14052c62e:	48 8d 15 4b b0 0b 01 	lea    rdx,[rip+0x10bb04b]        # 0x1415e7680
   14052c635:	2b f8                	sub    edi,eax
   14052c637:	48 8d 05 3e b0 0b 01 	lea    rax,[rip+0x10bb03e]        # 0x1415e767c
   14052c63e:	83 ff 0d             	cmp    edi,0xd
   14052c641:	48 0f 45 d0          	cmovne rdx,rax
   14052c645:	e9 fc 03 00 00       	jmp    0x14052ca46
   14052c64a:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052c64f:	f7 ef                	imul   edi
   14052c651:	c1 fa 05             	sar    edx,0x5
   14052c654:	8b c2                	mov    eax,edx
   14052c656:	c1 e8 1f             	shr    eax,0x1f
   14052c659:	03 d0                	add    edx,eax
   14052c65b:	6b c2 64             	imul   eax,edx,0x64
   14052c65e:	48 8d 15 1b b0 0b 01 	lea    rdx,[rip+0x10bb01b]        # 0x1415e7680
   14052c665:	2b f8                	sub    edi,eax
   14052c667:	48 8d 05 aa af 0b 01 	lea    rax,[rip+0x10bafaa]        # 0x1415e7618
   14052c66e:	83 ff 0c             	cmp    edi,0xc
   14052c671:	48 0f 45 d0          	cmovne rdx,rax
   14052c675:	e9 cc 03 00 00       	jmp    0x14052ca46
   14052c67a:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052c67f:	f7 ef                	imul   edi
   14052c681:	c1 fa 05             	sar    edx,0x5
   14052c684:	8b c2                	mov    eax,edx
   14052c686:	c1 e8 1f             	shr    eax,0x1f
   14052c689:	03 d0                	add    edx,eax
   14052c68b:	6b c2 64             	imul   eax,edx,0x64
   14052c68e:	48 8d 15 eb af 0b 01 	lea    rdx,[rip+0x10bafeb]        # 0x1415e7680
   14052c695:	2b f8                	sub    edi,eax
   14052c697:	48 8d 05 76 af 0b 01 	lea    rax,[rip+0x10baf76]        # 0x1415e7614
   14052c69e:	83 ff 0b             	cmp    edi,0xb
   14052c6a1:	48 0f 45 d0          	cmovne rdx,rax
   14052c6a5:	e9 9c 03 00 00       	jmp    0x14052ca46
   14052c6aa:	85 ff                	test   edi,edi
   14052c6ac:	79 17                	jns    0x14052c6c5
   14052c6ae:	f7 df                	neg    edi
   14052c6b0:	48 8d 15 09 fe 11 01 	lea    rdx,[rip+0x111fe09]        # 0x14164c4c0
   14052c6b7:	41 b8 09 00 00 00    	mov    r8d,0x9
   14052c6bd:	48 8b cb             	mov    rcx,rbx
   14052c6c0:	e8 9b 31 b4 ff       	call   0x14006f860
   14052c6c5:	83 ff 13             	cmp    edi,0x13
   14052c6c8:	0f 87 82 02 00 00    	ja     0x14052c950
   14052c6ce:	48 8d 15 2b 39 ad ff 	lea    rdx,[rip+0xffffffffffad392b]        # 0x140000000
   14052c6d5:	48 63 c7             	movsxd rax,edi
   14052c6d8:	8b 8c 82 60 ca 52 00 	mov    ecx,DWORD PTR [rdx+rax*4+0x52ca60]
   14052c6df:	48 03 ca             	add    rcx,rdx
   14052c6e2:	ff e1                	jmp    rcx
   14052c6e4:	41 b8 06 00 00 00    	mov    r8d,0x6
   14052c6ea:	48 8d 15 db fd 11 01 	lea    rdx,[rip+0x111fddb]        # 0x14164c4cc
   14052c6f1:	48 8b cb             	mov    rcx,rbx
   14052c6f4:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c6f9:	48 83 c4 20          	add    rsp,0x20
   14052c6fd:	5f                   	pop    rdi
   14052c6fe:	e9 5d 31 b4 ff       	jmp    0x14006f860
   14052c703:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052c709:	48 8d 15 a0 fd 11 01 	lea    rdx,[rip+0x111fda0]        # 0x14164c4b0
   14052c710:	48 8b cb             	mov    rcx,rbx
   14052c713:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c718:	48 83 c4 20          	add    rsp,0x20
   14052c71c:	5f                   	pop    rdi
   14052c71d:	e9 3e 31 b4 ff       	jmp    0x14006f860
   14052c722:	41 b8 06 00 00 00    	mov    r8d,0x6
   14052c728:	48 8d 15 89 fd 11 01 	lea    rdx,[rip+0x111fd89]        # 0x14164c4b8
   14052c72f:	48 8b cb             	mov    rcx,rbx
   14052c732:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c737:	48 83 c4 20          	add    rsp,0x20
   14052c73b:	5f                   	pop    rdi
   14052c73c:	e9 1f 31 b4 ff       	jmp    0x14006f860
   14052c741:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052c747:	48 8d 15 da fd 11 01 	lea    rdx,[rip+0x111fdda]        # 0x14164c528
   14052c74e:	48 8b cb             	mov    rcx,rbx
   14052c751:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c756:	48 83 c4 20          	add    rsp,0x20
   14052c75a:	5f                   	pop    rdi
   14052c75b:	e9 00 31 b4 ff       	jmp    0x14006f860
   14052c760:	41 b8 06 00 00 00    	mov    r8d,0x6
   14052c766:	48 8d 15 c3 fd 11 01 	lea    rdx,[rip+0x111fdc3]        # 0x14164c530
   14052c76d:	48 8b cb             	mov    rcx,rbx
   14052c770:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c775:	48 83 c4 20          	add    rsp,0x20
   14052c779:	5f                   	pop    rdi
   14052c77a:	e9 e1 30 b4 ff       	jmp    0x14006f860
   14052c77f:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052c785:	48 8d 15 8c fd 11 01 	lea    rdx,[rip+0x111fd8c]        # 0x14164c518
   14052c78c:	48 8b cb             	mov    rcx,rbx
   14052c78f:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c794:	48 83 c4 20          	add    rsp,0x20
   14052c798:	5f                   	pop    rdi
   14052c799:	e9 c2 30 b4 ff       	jmp    0x14006f860
   14052c79e:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052c7a4:	48 8d 15 75 fd 11 01 	lea    rdx,[rip+0x111fd75]        # 0x14164c520
   14052c7ab:	48 8b cb             	mov    rcx,rbx
   14052c7ae:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c7b3:	48 83 c4 20          	add    rsp,0x20
   14052c7b7:	5f                   	pop    rdi
   14052c7b8:	e9 a3 30 b4 ff       	jmp    0x14006f860
   14052c7bd:	41 b8 07 00 00 00    	mov    r8d,0x7
   14052c7c3:	48 8d 15 3e fd 11 01 	lea    rdx,[rip+0x111fd3e]        # 0x14164c508
   14052c7ca:	48 8b cb             	mov    rcx,rbx
   14052c7cd:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c7d2:	48 83 c4 20          	add    rsp,0x20
   14052c7d6:	5f                   	pop    rdi
   14052c7d7:	e9 84 30 b4 ff       	jmp    0x14006f860
   14052c7dc:	41 b8 06 00 00 00    	mov    r8d,0x6
   14052c7e2:	48 8d 15 27 fd 11 01 	lea    rdx,[rip+0x111fd27]        # 0x14164c510
   14052c7e9:	48 8b cb             	mov    rcx,rbx
   14052c7ec:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c7f1:	48 83 c4 20          	add    rsp,0x20
   14052c7f5:	5f                   	pop    rdi
   14052c7f6:	e9 65 30 b4 ff       	jmp    0x14006f860
   14052c7fb:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052c801:	48 8d 15 f0 fc 11 01 	lea    rdx,[rip+0x111fcf0]        # 0x14164c4f8
   14052c808:	48 8b cb             	mov    rcx,rbx
   14052c80b:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c810:	48 83 c4 20          	add    rsp,0x20
   14052c814:	5f                   	pop    rdi
   14052c815:	e9 46 30 b4 ff       	jmp    0x14006f860
   14052c81a:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052c820:	48 8d 15 d9 fc 11 01 	lea    rdx,[rip+0x111fcd9]        # 0x14164c500
   14052c827:	48 8b cb             	mov    rcx,rbx
   14052c82a:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c82f:	48 83 c4 20          	add    rsp,0x20
   14052c833:	5f                   	pop    rdi
   14052c834:	e9 27 30 b4 ff       	jmp    0x14006f860
   14052c839:	41 b8 08 00 00 00    	mov    r8d,0x8
   14052c83f:	48 8d 15 52 fd 11 01 	lea    rdx,[rip+0x111fd52]        # 0x14164c598
   14052c846:	48 8b cb             	mov    rcx,rbx
   14052c849:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c84e:	48 83 c4 20          	add    rsp,0x20
   14052c852:	5f                   	pop    rdi
   14052c853:	e9 08 30 b4 ff       	jmp    0x14006f860
   14052c858:	41 b8 07 00 00 00    	mov    r8d,0x7
   14052c85e:	48 8d 15 43 fd 11 01 	lea    rdx,[rip+0x111fd43]        # 0x14164c5a8
   14052c865:	48 8b cb             	mov    rcx,rbx
   14052c868:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c86d:	48 83 c4 20          	add    rsp,0x20
   14052c871:	5f                   	pop    rdi
   14052c872:	e9 e9 2f b4 ff       	jmp    0x14006f860
   14052c877:	41 b8 0a 00 00 00    	mov    r8d,0xa
   14052c87d:	48 8d 15 f4 fc 11 01 	lea    rdx,[rip+0x111fcf4]        # 0x14164c578
   14052c884:	48 8b cb             	mov    rcx,rbx
   14052c887:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c88c:	48 83 c4 20          	add    rsp,0x20
   14052c890:	5f                   	pop    rdi
   14052c891:	e9 ca 2f b4 ff       	jmp    0x14006f860
   14052c896:	41 b8 0a 00 00 00    	mov    r8d,0xa
   14052c89c:	48 8d 15 e5 fc 11 01 	lea    rdx,[rip+0x111fce5]        # 0x14164c588
   14052c8a3:	48 8b cb             	mov    rcx,rbx
   14052c8a6:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c8ab:	48 83 c4 20          	add    rsp,0x20
   14052c8af:	5f                   	pop    rdi
   14052c8b0:	e9 ab 2f b4 ff       	jmp    0x14006f860
   14052c8b5:	41 b8 09 00 00 00    	mov    r8d,0x9
   14052c8bb:	48 8d 15 96 fc 11 01 	lea    rdx,[rip+0x111fc96]        # 0x14164c558
   14052c8c2:	48 8b cb             	mov    rcx,rbx
   14052c8c5:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c8ca:	48 83 c4 20          	add    rsp,0x20
   14052c8ce:	5f                   	pop    rdi
   14052c8cf:	e9 8c 2f b4 ff       	jmp    0x14006f860
   14052c8d4:	41 b8 09 00 00 00    	mov    r8d,0x9
   14052c8da:	48 8d 15 87 fc 11 01 	lea    rdx,[rip+0x111fc87]        # 0x14164c568
   14052c8e1:	48 8b cb             	mov    rcx,rbx
   14052c8e4:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c8e9:	48 83 c4 20          	add    rsp,0x20
   14052c8ed:	5f                   	pop    rdi
   14052c8ee:	e9 6d 2f b4 ff       	jmp    0x14006f860
   14052c8f3:	41 b8 0b 00 00 00    	mov    r8d,0xb
   14052c8f9:	48 8d 15 38 fc 11 01 	lea    rdx,[rip+0x111fc38]        # 0x14164c538
   14052c900:	48 8b cb             	mov    rcx,rbx
   14052c903:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c908:	48 83 c4 20          	add    rsp,0x20
   14052c90c:	5f                   	pop    rdi
   14052c90d:	e9 4e 2f b4 ff       	jmp    0x14006f860
   14052c912:	41 b8 0a 00 00 00    	mov    r8d,0xa
   14052c918:	48 8d 15 29 fc 11 01 	lea    rdx,[rip+0x111fc29]        # 0x14164c548
   14052c91f:	48 8b cb             	mov    rcx,rbx
   14052c922:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c927:	48 83 c4 20          	add    rsp,0x20
   14052c92b:	5f                   	pop    rdi
   14052c92c:	e9 2f 2f b4 ff       	jmp    0x14006f860
   14052c931:	41 b8 0a 00 00 00    	mov    r8d,0xa
   14052c937:	48 8d 15 72 fc 11 01 	lea    rdx,[rip+0x111fc72]        # 0x14164c5b0
   14052c93e:	48 8b cb             	mov    rcx,rbx
   14052c941:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c946:	48 83 c4 20          	add    rsp,0x20
   14052c94a:	5f                   	pop    rdi
   14052c94b:	e9 10 2f b4 ff       	jmp    0x14006f860
   14052c950:	48 8b d3             	mov    rdx,rbx
   14052c953:	8b cf                	mov    ecx,edi
   14052c955:	e8 96 d3 ff ff       	call   0x140529cf0
   14052c95a:	b8 67 66 66 66       	mov    eax,0x66666667
   14052c95f:	8b cf                	mov    ecx,edi
   14052c961:	f7 ef                	imul   edi
   14052c963:	c1 fa 02             	sar    edx,0x2
   14052c966:	8b c2                	mov    eax,edx
   14052c968:	c1 e8 1f             	shr    eax,0x1f
   14052c96b:	03 d0                	add    edx,eax
   14052c96d:	8d 04 92             	lea    eax,[rdx+rdx*4]
   14052c970:	03 c0                	add    eax,eax
   14052c972:	2b c8                	sub    ecx,eax
   14052c974:	83 e9 01             	sub    ecx,0x1
   14052c977:	0f 84 a0 00 00 00    	je     0x14052ca1d
   14052c97d:	41 b8 02 00 00 00    	mov    r8d,0x2
   14052c983:	83 e9 01             	sub    ecx,0x1
   14052c986:	74 58                	je     0x14052c9e0
   14052c988:	83 f9 01             	cmp    ecx,0x1
   14052c98b:	48 8b cb             	mov    rcx,rbx
   14052c98e:	74 16                	je     0x14052c9a6
   14052c990:	48 8d 15 e9 ac 0b 01 	lea    rdx,[rip+0x10bace9]        # 0x1415e7680
   14052c997:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c99c:	48 83 c4 20          	add    rsp,0x20
   14052c9a0:	5f                   	pop    rdi
   14052c9a1:	e9 fa 2f b4 ff       	jmp    0x14006f9a0
   14052c9a6:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052c9ab:	f7 ef                	imul   edi
   14052c9ad:	c1 fa 05             	sar    edx,0x5
   14052c9b0:	8b c2                	mov    eax,edx
   14052c9b2:	c1 e8 1f             	shr    eax,0x1f
   14052c9b5:	03 d0                	add    edx,eax
   14052c9b7:	6b c2 64             	imul   eax,edx,0x64
   14052c9ba:	48 8d 15 bf ac 0b 01 	lea    rdx,[rip+0x10bacbf]        # 0x1415e7680
   14052c9c1:	2b f8                	sub    edi,eax
   14052c9c3:	48 8d 05 b2 ac 0b 01 	lea    rax,[rip+0x10bacb2]        # 0x1415e767c
   14052c9ca:	83 ff 0d             	cmp    edi,0xd
   14052c9cd:	48 0f 45 d0          	cmovne rdx,rax
   14052c9d1:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052c9d6:	48 83 c4 20          	add    rsp,0x20
   14052c9da:	5f                   	pop    rdi
   14052c9db:	e9 c0 2f b4 ff       	jmp    0x14006f9a0
   14052c9e0:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052c9e5:	48 8b cb             	mov    rcx,rbx
   14052c9e8:	f7 ef                	imul   edi
   14052c9ea:	c1 fa 05             	sar    edx,0x5
   14052c9ed:	8b c2                	mov    eax,edx
   14052c9ef:	c1 e8 1f             	shr    eax,0x1f
   14052c9f2:	03 d0                	add    edx,eax
   14052c9f4:	6b c2 64             	imul   eax,edx,0x64
   14052c9f7:	48 8d 15 82 ac 0b 01 	lea    rdx,[rip+0x10bac82]        # 0x1415e7680
   14052c9fe:	2b f8                	sub    edi,eax
   14052ca00:	48 8d 05 11 ac 0b 01 	lea    rax,[rip+0x10bac11]        # 0x1415e7618
   14052ca07:	83 ff 0c             	cmp    edi,0xc
   14052ca0a:	48 0f 45 d0          	cmovne rdx,rax
   14052ca0e:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ca13:	48 83 c4 20          	add    rsp,0x20
   14052ca17:	5f                   	pop    rdi
   14052ca18:	e9 83 2f b4 ff       	jmp    0x14006f9a0
   14052ca1d:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052ca22:	f7 ef                	imul   edi
   14052ca24:	c1 fa 05             	sar    edx,0x5
   14052ca27:	8b c2                	mov    eax,edx
   14052ca29:	c1 e8 1f             	shr    eax,0x1f
   14052ca2c:	03 d0                	add    edx,eax
   14052ca2e:	6b c2 64             	imul   eax,edx,0x64
   14052ca31:	48 8d 15 48 ac 0b 01 	lea    rdx,[rip+0x10bac48]        # 0x1415e7680
   14052ca38:	2b f8                	sub    edi,eax
   14052ca3a:	83 ff 0b             	cmp    edi,0xb
   14052ca3d:	74 07                	je     0x14052ca46
   14052ca3f:	48 8d 15 ce ab 0b 01 	lea    rdx,[rip+0x10babce]        # 0x1415e7614
   14052ca46:	41 b8 02 00 00 00    	mov    r8d,0x2
   14052ca4c:	48 8b cb             	mov    rcx,rbx
   14052ca4f:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ca54:	48 83 c4 20          	add    rsp,0x20
   14052ca58:	5f                   	pop    rdi
   14052ca59:	e9 42 2f b4 ff       	jmp    0x14006f9a0
   14052ca5e:	66 90                	xchg   ax,ax
   14052ca60:	e4 c6                	in     al,0xc6
   14052ca62:	52                   	push   rdx
   14052ca63:	00 03                	add    BYTE PTR [rbx],al
   14052ca65:	c7                   	(bad)
   14052ca66:	52                   	push   rdx
   14052ca67:	00 22                	add    BYTE PTR [rdx],ah
   14052ca69:	c7                   	(bad)
   14052ca6a:	52                   	push   rdx
   14052ca6b:	00 41 c7             	add    BYTE PTR [rcx-0x39],al
   14052ca6e:	52                   	push   rdx
   14052ca6f:	00 60 c7             	add    BYTE PTR [rax-0x39],ah
   14052ca72:	52                   	push   rdx
   14052ca73:	00 7f c7             	add    BYTE PTR [rdi-0x39],bh
   14052ca76:	52                   	push   rdx
   14052ca77:	00 9e c7 52 00 bd    	add    BYTE PTR [rsi-0x42ffad39],bl
   14052ca7d:	c7                   	(bad)
   14052ca7e:	52                   	push   rdx
   14052ca7f:	00 dc                	add    ah,bl
   14052ca81:	c7                   	(bad)
   14052ca82:	52                   	push   rdx
   14052ca83:	00 fb                	add    bl,bh
   14052ca85:	c7                   	(bad)
   14052ca86:	52                   	push   rdx
   14052ca87:	00 1a                	add    BYTE PTR [rdx],bl
   14052ca89:	c8 52 00 39          	enter  0x52,0x39
   14052ca8d:	c8 52 00 58          	enter  0x52,0x58
   14052ca91:	c8 52 00 77          	enter  0x52,0x77
   14052ca95:	c8 52 00 96          	enter  0x52,0x96
   14052ca99:	c8 52 00 b5          	enter  0x52,0xb5
   14052ca9d:	c8 52 00 d4          	enter  0x52,0xd4
   14052caa1:	c8 52 00 f3          	enter  0x52,0xf3
   14052caa5:	c8 52 00 12          	enter  0x52,0x12
   14052caa9:	c9                   	leave
   14052caaa:	52                   	push   rdx
   14052caab:	00 31                	add    BYTE PTR [rcx],dh
   14052caad:	c9                   	leave
   14052caae:	52                   	push   rdx
	...
