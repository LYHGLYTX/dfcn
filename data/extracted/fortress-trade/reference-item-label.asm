
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140c65450 <.text+0xc64450>:
   140c65450:	mov    DWORD PTR [rsp+0x20],r9d
   140c65455:	mov    BYTE PTR [rsp+0x18],r8b
   140c6545a:	push   rbp
   140c6545b:	push   rbx
   140c6545c:	push   rsi
   140c6545d:	push   rdi
   140c6545e:	push   r13
   140c65460:	push   r15
   140c65462:	mov    rbp,rsp
   140c65465:	sub    rsp,0x38
   140c65469:	mov    QWORD PTR [rdx+0x10],0x0
   140c65471:	mov    esi,r9d
   140c65474:	cmp    QWORD PTR [rdx+0x18],0xf
   140c65479:	mov    r15,rdx
   140c6547c:	mov    r13,rcx
   140c6547f:	mov    rax,rdx
   140c65482:	jbe    0x140c65487
   140c65484:	mov    rax,QWORD PTR [rdx]
   140c65487:	mov    BYTE PTR [rax],0x0
   140c6548a:	mov    rbx,QWORD PTR [rcx+0x38]
   140c6548e:	mov    rdi,QWORD PTR [rcx+0x40]
   140c65492:	cmp    rbx,rdi
   140c65495:	jae    0x140c654e7
   140c65497:	mov    rcx,QWORD PTR [rbx]
   140c6549a:	mov    rax,QWORD PTR [rcx]
   140c6549d:	call   QWORD PTR [rax+0x10]
   140c654a0:	cmp    eax,0x1
   140c654a3:	je     0x140c654ab
   140c654a5:	add    rbx,0x8
   140c654a9:	jmp    0x140c65492
   140c654ab:	mov    rcx,QWORD PTR [rbx]
   140c654ae:	mov    rax,QWORD PTR [rcx]
   140c654b1:	call   QWORD PTR [rax+0x40]
   140c654b4:	test   rax,rax
   140c654b7:	je     0x140c654e7
   140c654b9:	cmp    BYTE PTR [rax+0x7a],0x0
   140c654bd:	movzx  ebx,BYTE PTR [rbp+0x48]
   140c654c1:	je     0x140c65716
   140c654c7:	test   bl,bl
   140c654c9:	jne    0x140c65716
   140c654cf:	lea    rcx,[rax+0x8]
   140c654d3:	mov    rdx,r15
   140c654d6:	add    rsp,0x38
   140c654da:	pop    r15
   140c654dc:	pop    r13
   140c654de:	pop    rdi
   140c654df:	pop    rsi
   140c654e0:	pop    rbx
   140c654e1:	pop    rbp
   140c654e2:	jmp    0x140a94030
   140c654e7:	movzx  ebx,BYTE PTR [rbp+0x48]
   140c654eb:	test   bl,bl
   140c654ed:	jne    0x140c65716
   140c654f3:	mov    rax,QWORD PTR [r13+0x0]
   140c654f7:	mov    rcx,r13
   140c654fa:	call   QWORD PTR [rax]
   140c654fc:	cmp    ax,0x59
   140c65500:	jne    0x140c65518
   140c65502:	cmp    QWORD PTR [r13+0xf8],0x0
   140c6550a:	je     0x140c65518
   140c6550c:	lea    rdx,[r13+0xe8]
   140c65513:	jmp    0x140c656d3
   140c65518:	mov    rax,QWORD PTR [r13+0x0]
   140c6551c:	mov    rcx,r13
   140c6551f:	call   QWORD PTR [rax]
   140c65521:	cmp    ax,0x56
   140c65525:	jne    0x140c65716
   140c6552b:	mov    rbx,QWORD PTR [r13+0xd0]
   140c65532:	mov    rdi,QWORD PTR [r13+0xd8]
   140c65539:	nop    DWORD PTR [rax+0x0]
   140c65540:	cmp    rbx,rdi
   140c65543:	jae    0x140c6570f
   140c65549:	mov    rcx,QWORD PTR [rbx]
   140c6554c:	mov    rax,QWORD PTR [rcx]
   140c6554f:	call   QWORD PTR [rax+0x28]
   140c65552:	cmp    eax,0xc
   140c65555:	jne    0x140c65603
   140c6555b:	mov    rax,QWORD PTR [rbx]
   140c6555e:	mov    rsi,QWORD PTR [rax+0x28]
   140c65562:	mov    rcx,QWORD PTR [rax+0x30]
   140c65566:	sub    rcx,rsi
   140c65569:	sar    rcx,0x2
   140c6556d:	test   rcx,rcx
   140c65570:	je     0x140c65603
   140c65576:	mov    r10,QWORD PTR [rip+0x1882743]        # 0x1424e7cc0
   140c6557d:	mov    r11,QWORD PTR [rip+0x1882734]        # 0x1424e7cb8
   140c65584:	mov    esi,DWORD PTR [rsi]
   140c65586:	sub    r10,r11
   140c65589:	sar    r10,0x3
   140c6558d:	test   r10d,r10d
   140c65590:	je     0x140c65603
   140c65592:	xor    r9d,r9d
   140c65595:	cmp    r10d,0x40
   140c65599:	jle    0x140c655c3
   140c6559b:	nop    DWORD PTR [rax+rax*1+0x0]
   140c655a0:	mov    r8d,r10d
   140c655a3:	shr    r8d,1
   140c655a6:	lea    edx,[r8+r9*1]
   140c655aa:	movsxd rax,edx
   140c655ad:	mov    rcx,QWORD PTR [r11+rax*8]
   140c655b1:	cmp    esi,DWORD PTR [rcx]
   140c655b3:	cmovl  edx,r9d
   140c655b7:	sub    r10d,r8d
   140c655ba:	mov    r9d,edx
   140c655bd:	cmp    r10d,0x40
   140c655c1:	jg     0x140c655a0
   140c655c3:	lea    eax,[r9+r10*1]
   140c655c7:	cmp    eax,0xffffffff
   140c655ca:	je     0x140c65603
   140c655cc:	cmp    r9d,eax
   140c655cf:	jge    0x140c65603
   140c655d1:	movsxd rcx,r9d
   140c655d4:	movsxd rdx,eax
   140c655d7:	mov    rax,QWORD PTR [r11+rcx*8]
   140c655db:	cmp    esi,DWORD PTR [rax]
   140c655dd:	je     0x140c655ec
   140c655df:	inc    r9d
   140c655e2:	inc    rcx
   140c655e5:	cmp    rcx,rdx
   140c655e8:	jl     0x140c655d7
   140c655ea:	jmp    0x140c65603
   140c655ec:	movsxd rax,r9d
   140c655ef:	mov    rdx,QWORD PTR [r11+rax*8]
   140c655f3:	test   rdx,rdx
   140c655f6:	je     0x140c65603
   140c655f8:	cmp    QWORD PTR [rdx+0x18],0x0
   140c655fd:	jne    0x140c656cf
   140c65603:	mov    rcx,QWORD PTR [rbx]
   140c65606:	mov    rax,QWORD PTR [rcx]
   140c65609:	call   QWORD PTR [rax+0x28]
   140c6560c:	cmp    eax,0x9
   140c6560f:	jne    0x140c656c6
   140c65615:	mov    rax,QWORD PTR [rbx]
   140c65618:	mov    rsi,QWORD PTR [rax+0x30]
   140c6561c:	mov    rcx,QWORD PTR [rax+0x38]
   140c65620:	sub    rcx,rsi
   140c65623:	sar    rcx,0x2
   140c65627:	test   rcx,rcx
   140c6562a:	je     0x140c656c6
   140c65630:	mov    r10,QWORD PTR [rip+0x1882689]        # 0x1424e7cc0
   140c65637:	mov    r11,QWORD PTR [rip+0x188267a]        # 0x1424e7cb8
   140c6563e:	mov    esi,DWORD PTR [rsi]
   140c65640:	sub    r10,r11
   140c65643:	sar    r10,0x3
   140c65647:	test   r10d,r10d
   140c6564a:	je     0x140c656c6
   140c6564c:	xor    r9d,r9d
   140c6564f:	cmp    r10d,0x40
   140c65653:	jle    0x140c65683
   140c65655:	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140c65660:	mov    r8d,r10d
   140c65663:	shr    r8d,1
   140c65666:	lea    edx,[r8+r9*1]
   140c6566a:	movsxd rax,edx
   140c6566d:	mov    rcx,QWORD PTR [r11+rax*8]
   140c65671:	cmp    esi,DWORD PTR [rcx]
   140c65673:	cmovl  edx,r9d
   140c65677:	sub    r10d,r8d
   140c6567a:	mov    r9d,edx
   140c6567d:	cmp    r10d,0x40
   140c65681:	jg     0x140c65660
   140c65683:	lea    eax,[r9+r10*1]
   140c65687:	cmp    eax,0xffffffff
   140c6568a:	je     0x140c656c6
   140c6568c:	cmp    r9d,eax
   140c6568f:	jge    0x140c656c6
   140c65691:	movsxd rcx,r9d
   140c65694:	movsxd rdx,eax
   140c65697:	mov    rax,QWORD PTR [r11+rcx*8]
   140c6569b:	cmp    esi,DWORD PTR [rax]
   140c6569d:	je     0x140c656b3
   140c6569f:	inc    r9d
   140c656a2:	inc    rcx
   140c656a5:	cmp    rcx,rdx
   140c656a8:	jl     0x140c65697
   140c656aa:	add    rbx,0x8
   140c656ae:	jmp    0x140c65540
   140c656b3:	movsxd rax,r9d
   140c656b6:	mov    rdx,QWORD PTR [r11+rax*8]
   140c656ba:	test   rdx,rdx
   140c656bd:	je     0x140c656c6
   140c656bf:	cmp    QWORD PTR [rdx+0x18],0x0
   140c656c4:	jne    0x140c656cf
   140c656c6:	add    rbx,0x8
   140c656ca:	jmp    0x140c65540
   140c656cf:	add    rdx,0x8
   140c656d3:	cmp    r15,rdx
   140c656d6:	je     0x140c656ee
   140c656d8:	cmp    QWORD PTR [rdx+0x18],0xf
   140c656dd:	mov    r8,QWORD PTR [rdx+0x10]
   140c656e1:	jbe    0x140c656e6
   140c656e3:	mov    rdx,QWORD PTR [rdx]
   140c656e6:	mov    rcx,r15
   140c656e9:	call   0x14006f8d0
   140c656ee:	mov    r8d,0x7
   140c656f4:	lea    rdx,[rip+0xa88c1d]        # 0x1416ee318
   140c656fb:	mov    rcx,r15
   140c656fe:	add    rsp,0x38
   140c65702:	pop    r15
   140c65704:	pop    r13
   140c65706:	pop    rdi
   140c65707:	pop    rsi
   140c65708:	pop    rbx
   140c65709:	pop    rbp
   140c6570a:	jmp    0x14006fa10
   140c6570f:	movzx  ebx,BYTE PTR [rbp+0x48]
   140c65713:	mov    esi,DWORD PTR [rbp+0x50]
   140c65716:	mov    rax,QWORD PTR [r13+0x0]
   140c6571a:	mov    rcx,r13
   140c6571d:	mov    QWORD PTR [rsp+0x70],r12
   140c65722:	mov    QWORD PTR [rsp+0x30],r14
   140c65727:	call   QWORD PTR [rax+0x508]
   140c6572d:	mov    rdx,QWORD PTR [r13+0x0]
   140c65731:	mov    rcx,r13
   140c65734:	movzx  r14d,ax
   140c65738:	call   QWORD PTR [rdx+0x518]
   140c6573e:	mov    rdx,QWORD PTR [r13+0x0]
   140c65742:	mov    rcx,r13
   140c65745:	movzx  r12d,ax
   140c65749:	call   QWORD PTR [rdx+0x5d8]
   140c6574f:	test   al,al
   140c65751:	jne    0x140c6575c
   140c65753:	cmp    r14w,r12w
   140c65757:	cmovl  r14w,r12w
   140c6575c:	mov    rax,QWORD PTR [r13+0x0]
   140c65760:	mov    r8d,esi
   140c65763:	mov    rdx,r15
   140c65766:	mov    rcx,r13
   140c65769:	call   QWORD PTR [rax+0x5f0]
   140c6576f:	mov    rsi,0xffffffffffffffff
   140c65776:	test   bl,bl
   140c65778:	jne    0x140c65bb3
   140c6577e:	cmp    DWORD PTR [rip+0xc36b13],0x1        # 0x14189c298
   140c65785:	jne    0x140c657b7
   140c65787:	mov    rbx,QWORD PTR [r13+0x38]
   140c6578b:	mov    rdi,QWORD PTR [r13+0x40]
   140c6578f:	nop
   140c65790:	cmp    rbx,rdi
   140c65793:	jae    0x140c657b3
   140c65795:	mov    rcx,QWORD PTR [rbx]
   140c65798:	mov    rax,QWORD PTR [rcx]
   140c6579b:	call   QWORD PTR [rax+0x10]
   140c6579e:	cmp    eax,0x1f
   140c657a1:	je     0x140c657a9
   140c657a3:	add    rbx,0x8
   140c657a7:	jmp    0x140c65790
   140c657a9:	mov    dl,0x24
   140c657ab:	mov    rcx,r15
   140c657ae:	call   0x1400b9b80
   140c657b3:	movzx  ebx,BYTE PTR [rbp+0x48]
   140c657b7:	test   DWORD PTR [r13+0x10],0x400000
   140c657bf:	je     0x140c657cb
   140c657c1:	mov    dl,0x13
   140c657c3:	mov    rcx,r15
   140c657c6:	call   0x1400b9b80
   140c657cb:	mov    rax,QWORD PTR [r13+0x0]
   140c657cf:	mov    rcx,r13
   140c657d2:	call   QWORD PTR [rax+0x1d8]
   140c657d8:	mov    BYTE PTR [rbp+0x41],0x0
   140c657dc:	cmp    ax,0x3
   140c657e0:	jl     0x140c6581c
   140c657e2:	mov    BYTE PTR [rbp+0x40],0x58
   140c657e6:	lea    rax,[rbp+0x40]
   140c657ea:	mov    r8,rsi
   140c657ed:	nop    DWORD PTR [rax]
   140c657f0:	inc    r8
   140c657f3:	cmp    BYTE PTR [rax+r8*1],0x0
   140c657f8:	jne    0x140c657f0
   140c657fa:	lea    rdx,[rbp+0x40]
   140c657fe:	mov    rcx,r15
   140c65801:	call   0x14006fa10
   140c65806:	lea    rax,[rbp+0x40]
   140c6580a:	mov    r8,rsi
   140c6580d:	nop    DWORD PTR [rax]
   140c65810:	inc    r8
   140c65813:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65818:	jne    0x140c65810
   140c6581a:	jmp    0x140c6585a
   140c6581c:	cmp    ax,0x2
   140c65820:	jne    0x140c6583c
   140c65822:	mov    BYTE PTR [rbp+0x40],0x58
   140c65826:	lea    rax,[rbp+0x40]
   140c6582a:	mov    r8,rsi
   140c6582d:	nop    DWORD PTR [rax]
   140c65830:	inc    r8
   140c65833:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65838:	jne    0x140c65830
   140c6583a:	jmp    0x140c6585a
   140c6583c:	cmp    ax,0x1
   140c65840:	jne    0x140c65866
   140c65842:	mov    BYTE PTR [rbp+0x40],0x78
   140c65846:	lea    rax,[rbp+0x40]
   140c6584a:	mov    r8,rsi
   140c6584d:	nop    DWORD PTR [rax]
   140c65850:	inc    r8
   140c65853:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65858:	jne    0x140c65850
   140c6585a:	lea    rdx,[rbp+0x40]
   140c6585e:	mov    rcx,r15
   140c65861:	call   0x14006fa10
   140c65866:	cmp    DWORD PTR [rip+0xc36a2b],0x0        # 0x14189c298
   140c6586d:	jne    0x140c658c6
   140c6586f:	test   DWORD PTR [r13+0x10],0x4000
   140c65877:	je     0x140c6589a
   140c65879:	mov    BYTE PTR [rbp+0x40],0x28
   140c6587d:	lea    rax,[rbp+0x40]
   140c65881:	mov    r8,rsi
   140c65884:	inc    r8
   140c65887:	cmp    BYTE PTR [rax+r8*1],0x0
   140c6588c:	jne    0x140c65884
   140c6588e:	lea    rdx,[rbp+0x40]
   140c65892:	mov    rcx,r15
   140c65895:	call   0x14006fa10
   140c6589a:	test   DWORD PTR [r13+0x10],0x80000
   140c658a2:	je     0x140c658c6
   140c658a4:	mov    BYTE PTR [rbp+0x40],0x7b
   140c658a8:	lea    rax,[rbp+0x40]
   140c658ac:	mov    r8,rsi
   140c658af:	nop
   140c658b0:	inc    r8
   140c658b3:	cmp    BYTE PTR [rax+r8*1],0x0
   140c658b8:	jne    0x140c658b0
   140c658ba:	lea    rdx,[rbp+0x40]
   140c658be:	mov    rcx,r15
   140c658c1:	call   0x14006fa10
   140c658c6:	mov    rax,QWORD PTR [r13+0x0]
   140c658ca:	mov    rcx,r13
   140c658cd:	call   QWORD PTR [rax+0x5d8]
   140c658d3:	test   al,al
   140c658d5:	je     0x140c659c7
   140c658db:	cmp    DWORD PTR [rip+0x172b1f6],0x0        # 0x142390ad8
   140c658e2:	jle    0x140c659a6
   140c658e8:	mov    rax,QWORD PTR [rip+0x172b1e1]        # 0x142390ad0
   140c658ef:	test   BYTE PTR [rax],0x4
   140c658f2:	je     0x140c659a6
   140c658f8:	cmp    r12w,0x5
   140c658fd:	jne    0x140c6591c
   140c658ff:	mov    BYTE PTR [rbp+0x40],0xf
   140c65903:	lea    rax,[rbp+0x40]
   140c65907:	mov    r8,rsi
   140c6590a:	nop    WORD PTR [rax+rax*1+0x0]
   140c65910:	inc    r8
   140c65913:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65918:	jne    0x140c65910
   140c6591a:	jmp    0x140c6599a
   140c6591c:	cmp    r12w,0x4
   140c65921:	jne    0x140c6593c
   140c65923:	mov    BYTE PTR [rbp+0x40],0xf0
   140c65927:	lea    rax,[rbp+0x40]
   140c6592b:	mov    r8,rsi
   140c6592e:	xchg   ax,ax
   140c65930:	inc    r8
   140c65933:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65938:	jne    0x140c65930
   140c6593a:	jmp    0x140c6599a
   140c6593c:	cmp    r12w,0x3
   140c65941:	jne    0x140c6595c
   140c65943:	mov    BYTE PTR [rbp+0x40],0x2a
   140c65947:	lea    rax,[rbp+0x40]
   140c6594b:	mov    r8,rsi
   140c6594e:	xchg   ax,ax
   140c65950:	inc    r8
   140c65953:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65958:	jne    0x140c65950
   140c6595a:	jmp    0x140c6599a
   140c6595c:	cmp    r12w,0x2
   140c65961:	jne    0x140c6597c
   140c65963:	mov    BYTE PTR [rbp+0x40],0x2b
   140c65967:	lea    rax,[rbp+0x40]
   140c6596b:	mov    r8,rsi
   140c6596e:	xchg   ax,ax
   140c65970:	inc    r8
   140c65973:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65978:	jne    0x140c65970
   140c6597a:	jmp    0x140c6599a
   140c6597c:	cmp    r12w,0x1
   140c65981:	jne    0x140c659a6
   140c65983:	mov    BYTE PTR [rbp+0x40],0x2d
   140c65987:	lea    rax,[rbp+0x40]
   140c6598b:	mov    r8,rsi
   140c6598e:	xchg   ax,ax
   140c65990:	inc    r8
   140c65993:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65998:	jne    0x140c65990
   140c6599a:	lea    rdx,[rbp+0x40]
   140c6599e:	mov    rcx,r15
   140c659a1:	call   0x14006fa10
   140c659a6:	mov    BYTE PTR [rbp+0x40],0xae
   140c659aa:	lea    rax,[rbp+0x40]
   140c659ae:	mov    r8,rsi
   140c659b1:	inc    r8
   140c659b4:	cmp    BYTE PTR [rax+r8*1],0x0
   140c659b9:	jne    0x140c659b1
   140c659bb:	lea    rdx,[rbp+0x40]
   140c659bf:	mov    rcx,r15
   140c659c2:	call   0x14006fa10
   140c659c7:	mov    rax,QWORD PTR [r13+0x0]
   140c659cb:	mov    rcx,r13
   140c659ce:	call   QWORD PTR [rax+0x5e0]
   140c659d4:	test   rax,rax
   140c659d7:	je     0x140c659fa
   140c659d9:	mov    BYTE PTR [rbp+0x40],0x11
   140c659dd:	lea    rax,[rbp+0x40]
   140c659e1:	mov    r8,rsi
   140c659e4:	inc    r8
   140c659e7:	cmp    BYTE PTR [rax+r8*1],0x0
   140c659ec:	jne    0x140c659e4
   140c659ee:	lea    rdx,[rbp+0x40]
   140c659f2:	mov    rcx,r15
   140c659f5:	call   0x14006fa10
   140c659fa:	cmp    r14w,0x5
   140c659ff:	jne    0x140c65a53
   140c65a01:	mov    BYTE PTR [rbp+0x40],0xf
   140c65a05:	lea    rax,[rbp+0x40]
   140c65a09:	mov    r8,rsi
   140c65a0c:	nop    DWORD PTR [rax+0x0]
   140c65a10:	inc    r8
   140c65a13:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65a18:	jne    0x140c65a10
   140c65a1a:	lea    rdx,[rbp+0x40]
   140c65a1e:	mov    rcx,r15
   140c65a21:	call   0x14006fa10
   140c65a26:	mov    rax,QWORD PTR [r13+0x0]
   140c65a2a:	movzx  r8d,bl
   140c65a2e:	mov    rdx,r15
   140c65a31:	mov    rcx,r13
   140c65a34:	call   QWORD PTR [rax+0x5e8]
   140c65a3a:	mov    rax,QWORD PTR [r13+0x0]
   140c65a3e:	mov    rcx,r13
   140c65a41:	mov    BYTE PTR [rbp+0x41],0x0
   140c65a45:	call   QWORD PTR [rax+0x1d8]
   140c65a4b:	movzx  ebx,ax
   140c65a4e:	jmp    0x140c65bea
   140c65a53:	cmp    r14w,0x4
   140c65a58:	jne    0x140c65aa8
   140c65a5a:	mov    BYTE PTR [rbp+0x40],0xf0
   140c65a5e:	lea    rax,[rbp+0x40]
   140c65a62:	mov    r8,rsi
   140c65a65:	inc    r8
   140c65a68:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65a6d:	jne    0x140c65a65
   140c65a6f:	lea    rdx,[rbp+0x40]
   140c65a73:	mov    rcx,r15
   140c65a76:	call   0x14006fa10
   140c65a7b:	mov    rax,QWORD PTR [r13+0x0]
   140c65a7f:	movzx  r8d,bl
   140c65a83:	mov    rdx,r15
   140c65a86:	mov    rcx,r13
   140c65a89:	call   QWORD PTR [rax+0x5e8]
   140c65a8f:	mov    rax,QWORD PTR [r13+0x0]
   140c65a93:	mov    rcx,r13
   140c65a96:	mov    BYTE PTR [rbp+0x41],0x0
   140c65a9a:	call   QWORD PTR [rax+0x1d8]
   140c65aa0:	movzx  ebx,ax
   140c65aa3:	jmp    0x140c65c08
   140c65aa8:	cmp    r14w,0x3
   140c65aad:	jne    0x140c65b03
   140c65aaf:	mov    BYTE PTR [rbp+0x40],0x2a
   140c65ab3:	lea    rax,[rbp+0x40]
   140c65ab7:	mov    r8,rsi
   140c65aba:	nop    WORD PTR [rax+rax*1+0x0]
   140c65ac0:	inc    r8
   140c65ac3:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65ac8:	jne    0x140c65ac0
   140c65aca:	lea    rdx,[rbp+0x40]
   140c65ace:	mov    rcx,r15
   140c65ad1:	call   0x14006fa10
   140c65ad6:	mov    rax,QWORD PTR [r13+0x0]
   140c65ada:	movzx  r8d,bl
   140c65ade:	mov    rdx,r15
   140c65ae1:	mov    rcx,r13
   140c65ae4:	call   QWORD PTR [rax+0x5e8]
   140c65aea:	mov    rax,QWORD PTR [r13+0x0]
   140c65aee:	mov    rcx,r13
   140c65af1:	mov    BYTE PTR [rbp+0x41],0x0
   140c65af5:	call   QWORD PTR [rax+0x1d8]
   140c65afb:	movzx  ebx,ax
   140c65afe:	jmp    0x140c65c26
   140c65b03:	cmp    r14w,0x2
   140c65b08:	jne    0x140c65b58
   140c65b0a:	mov    BYTE PTR [rbp+0x40],0x2b
   140c65b0e:	lea    rax,[rbp+0x40]
   140c65b12:	mov    r8,rsi
   140c65b15:	inc    r8
   140c65b18:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65b1d:	jne    0x140c65b15
   140c65b1f:	lea    rdx,[rbp+0x40]
   140c65b23:	mov    rcx,r15
   140c65b26:	call   0x14006fa10
   140c65b2b:	mov    rax,QWORD PTR [r13+0x0]
   140c65b2f:	movzx  r8d,bl
   140c65b33:	mov    rdx,r15
   140c65b36:	mov    rcx,r13
   140c65b39:	call   QWORD PTR [rax+0x5e8]
   140c65b3f:	mov    rax,QWORD PTR [r13+0x0]
   140c65b43:	mov    rcx,r13
   140c65b46:	mov    BYTE PTR [rbp+0x41],0x0
   140c65b4a:	call   QWORD PTR [rax+0x1d8]
   140c65b50:	movzx  ebx,ax
   140c65b53:	jmp    0x140c65c44
   140c65b58:	cmp    r14w,0x1
   140c65b5d:	jne    0x140c65bb3
   140c65b5f:	mov    BYTE PTR [rbp+0x40],0x2d
   140c65b63:	lea    rax,[rbp+0x40]
   140c65b67:	mov    r8,rsi
   140c65b6a:	nop    WORD PTR [rax+rax*1+0x0]
   140c65b70:	inc    r8
   140c65b73:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65b78:	jne    0x140c65b70
   140c65b7a:	lea    rdx,[rbp+0x40]
   140c65b7e:	mov    rcx,r15
   140c65b81:	call   0x14006fa10
   140c65b86:	mov    rax,QWORD PTR [r13+0x0]
   140c65b8a:	movzx  r8d,bl
   140c65b8e:	mov    rdx,r15
   140c65b91:	mov    rcx,r13
   140c65b94:	call   QWORD PTR [rax+0x5e8]
   140c65b9a:	mov    rax,QWORD PTR [r13+0x0]
   140c65b9e:	mov    rcx,r13
   140c65ba1:	mov    BYTE PTR [rbp+0x41],0x0
   140c65ba5:	call   QWORD PTR [rax+0x1d8]
   140c65bab:	movzx  ebx,ax
   140c65bae:	jmp    0x140c65c63
   140c65bb3:	mov    rax,QWORD PTR [r13+0x0]
   140c65bb7:	movzx  r8d,bl
   140c65bbb:	mov    rdx,r15
   140c65bbe:	mov    rcx,r13
   140c65bc1:	call   QWORD PTR [rax+0x5e8]
   140c65bc7:	test   bl,bl
   140c65bc9:	jne    0x140c65ef3
   140c65bcf:	mov    rax,QWORD PTR [r13+0x0]
   140c65bd3:	mov    rcx,r13
   140c65bd6:	call   QWORD PTR [rax+0x1d8]
   140c65bdc:	mov    BYTE PTR [rbp+0x41],0x0
   140c65be0:	movzx  ebx,ax
   140c65be3:	cmp    r14w,0x5
   140c65be8:	jne    0x140c65c01
   140c65bea:	mov    BYTE PTR [rbp+0x40],0xf
   140c65bee:	lea    rax,[rbp+0x40]
   140c65bf2:	mov    r8,rsi
   140c65bf5:	inc    r8
   140c65bf8:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65bfd:	jne    0x140c65bf5
   140c65bff:	jmp    0x140c65c7a
   140c65c01:	cmp    r14w,0x4
   140c65c06:	jne    0x140c65c1f
   140c65c08:	mov    BYTE PTR [rbp+0x40],0xf0
   140c65c0c:	lea    rax,[rbp+0x40]
   140c65c10:	mov    r8,rsi
   140c65c13:	inc    r8
   140c65c16:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65c1b:	jne    0x140c65c13
   140c65c1d:	jmp    0x140c65c7a
   140c65c1f:	cmp    r14w,0x3
   140c65c24:	jne    0x140c65c3d
   140c65c26:	mov    BYTE PTR [rbp+0x40],0x2a
   140c65c2a:	lea    rax,[rbp+0x40]
   140c65c2e:	mov    r8,rsi
   140c65c31:	inc    r8
   140c65c34:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65c39:	jne    0x140c65c31
   140c65c3b:	jmp    0x140c65c7a
   140c65c3d:	cmp    r14w,0x2
   140c65c42:	jne    0x140c65c5c
   140c65c44:	mov    BYTE PTR [rbp+0x40],0x2b
   140c65c48:	lea    rax,[rbp+0x40]
   140c65c4c:	mov    r8,rsi
   140c65c4f:	nop
   140c65c50:	inc    r8
   140c65c53:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65c58:	jne    0x140c65c50
   140c65c5a:	jmp    0x140c65c7a
   140c65c5c:	cmp    r14w,0x1
   140c65c61:	jne    0x140c65c86
   140c65c63:	mov    BYTE PTR [rbp+0x40],0x2d
   140c65c67:	lea    rax,[rbp+0x40]
   140c65c6b:	mov    r8,rsi
   140c65c6e:	xchg   ax,ax
   140c65c70:	inc    r8
   140c65c73:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65c78:	jne    0x140c65c70
   140c65c7a:	lea    rdx,[rbp+0x40]
   140c65c7e:	mov    rcx,r15
   140c65c81:	call   0x14006fa10
   140c65c86:	mov    rax,QWORD PTR [r13+0x0]
   140c65c8a:	mov    rcx,r13
   140c65c8d:	call   QWORD PTR [rax+0x5e0]
   140c65c93:	test   rax,rax
   140c65c96:	je     0x140c65cb9
   140c65c98:	mov    BYTE PTR [rbp+0x40],0x10
   140c65c9c:	lea    rax,[rbp+0x40]
   140c65ca0:	mov    r8,rsi
   140c65ca3:	inc    r8
   140c65ca6:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65cab:	jne    0x140c65ca3
   140c65cad:	lea    rdx,[rbp+0x40]
   140c65cb1:	mov    rcx,r15
   140c65cb4:	call   0x14006fa10
   140c65cb9:	mov    rax,QWORD PTR [r13+0x0]
   140c65cbd:	mov    rcx,r13
   140c65cc0:	call   QWORD PTR [rax+0x5d8]
   140c65cc6:	test   al,al
   140c65cc8:	je     0x140c65db6
   140c65cce:	mov    BYTE PTR [rbp+0x40],0xaf
   140c65cd2:	lea    rax,[rbp+0x40]
   140c65cd6:	mov    r8,rsi
   140c65cd9:	nop    DWORD PTR [rax+0x0]
   140c65ce0:	inc    r8
   140c65ce3:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65ce8:	jne    0x140c65ce0
   140c65cea:	lea    rdx,[rbp+0x40]
   140c65cee:	mov    rcx,r15
   140c65cf1:	call   0x14006fa10
   140c65cf6:	cmp    DWORD PTR [rip+0x172addb],0x0        # 0x142390ad8
   140c65cfd:	jle    0x140c65db6
   140c65d03:	mov    rax,QWORD PTR [rip+0x172adc6]        # 0x142390ad0
   140c65d0a:	test   BYTE PTR [rax],0x4
   140c65d0d:	je     0x140c65db6
   140c65d13:	cmp    r12w,0x5
   140c65d18:	jne    0x140c65d31
   140c65d1a:	mov    BYTE PTR [rbp+0x40],0xf
   140c65d1e:	lea    rax,[rbp+0x40]
   140c65d22:	mov    r8,rsi
   140c65d25:	inc    r8
   140c65d28:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65d2d:	jne    0x140c65d25
   140c65d2f:	jmp    0x140c65daa
   140c65d31:	cmp    r12w,0x4
   140c65d36:	jne    0x140c65d4f
   140c65d38:	mov    BYTE PTR [rbp+0x40],0xf0
   140c65d3c:	lea    rax,[rbp+0x40]
   140c65d40:	mov    r8,rsi
   140c65d43:	inc    r8
   140c65d46:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65d4b:	jne    0x140c65d43
   140c65d4d:	jmp    0x140c65daa
   140c65d4f:	cmp    r12w,0x3
   140c65d54:	jne    0x140c65d6d
   140c65d56:	mov    BYTE PTR [rbp+0x40],0x2a
   140c65d5a:	lea    rax,[rbp+0x40]
   140c65d5e:	mov    r8,rsi
   140c65d61:	inc    r8
   140c65d64:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65d69:	jne    0x140c65d61
   140c65d6b:	jmp    0x140c65daa
   140c65d6d:	cmp    r12w,0x2
   140c65d72:	jne    0x140c65d8c
   140c65d74:	mov    BYTE PTR [rbp+0x40],0x2b
   140c65d78:	lea    rax,[rbp+0x40]
   140c65d7c:	mov    r8,rsi
   140c65d7f:	nop
   140c65d80:	inc    r8
   140c65d83:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65d88:	jne    0x140c65d80
   140c65d8a:	jmp    0x140c65daa
   140c65d8c:	cmp    r12w,0x1
   140c65d91:	jne    0x140c65db6
   140c65d93:	mov    BYTE PTR [rbp+0x40],0x2d
   140c65d97:	lea    rax,[rbp+0x40]
   140c65d9b:	mov    r8,rsi
   140c65d9e:	xchg   ax,ax
   140c65da0:	inc    r8
   140c65da3:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65da8:	jne    0x140c65da0
   140c65daa:	lea    rdx,[rbp+0x40]
   140c65dae:	mov    rcx,r15
   140c65db1:	call   0x14006fa10
   140c65db6:	cmp    DWORD PTR [rip+0xc364db],0x0        # 0x14189c298
   140c65dbd:	jne    0x140c65e16
   140c65dbf:	test   DWORD PTR [r13+0x10],0x80000
   140c65dc7:	je     0x140c65dea
   140c65dc9:	mov    BYTE PTR [rbp+0x40],0x7d
   140c65dcd:	lea    rax,[rbp+0x40]
   140c65dd1:	mov    r8,rsi
   140c65dd4:	inc    r8
   140c65dd7:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65ddc:	jne    0x140c65dd4
   140c65dde:	lea    rdx,[rbp+0x40]
   140c65de2:	mov    rcx,r15
   140c65de5:	call   0x14006fa10
   140c65dea:	test   DWORD PTR [r13+0x10],0x4000
   140c65df2:	je     0x140c65e16
   140c65df4:	mov    BYTE PTR [rbp+0x40],0x29
   140c65df8:	lea    rax,[rbp+0x40]
   140c65dfc:	mov    r8,rsi
   140c65dff:	nop
   140c65e00:	inc    r8
   140c65e03:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65e08:	jne    0x140c65e00
   140c65e0a:	lea    rdx,[rbp+0x40]
   140c65e0e:	mov    rcx,r15
   140c65e11:	call   0x14006fa10
   140c65e16:	cmp    bx,0x3
   140c65e1a:	jl     0x140c65e5b
   140c65e1c:	mov    BYTE PTR [rbp+0x40],0x58
   140c65e20:	lea    rax,[rbp+0x40]
   140c65e24:	mov    r8,rsi
   140c65e27:	nop    WORD PTR [rax+rax*1+0x0]
   140c65e30:	inc    r8
   140c65e33:	cmp    BYTE PTR [rax+r8*1],0x0
   140c65e38:	jne    0x140c65e30
   140c65e3a:	lea    rdx,[rbp+0x40]
   140c65e3e:	mov    rcx,r15
   140c65e41:	call   0x14006fa10
   140c65e46:	lea    rax,[rbp+0x40]
   140c65e4a:	nop    WORD PTR [rax+rax*1+0x0]
   140c65e50:	inc    rsi
   140c65e53:	cmp    BYTE PTR [rax+rsi*1],0x0
   140c65e57:	jne    0x140c65e50
   140c65e59:	jmp    0x140c65e99
   140c65e5b:	cmp    bx,0x2
   140c65e5f:	jne    0x140c65e7b
   140c65e61:	mov    BYTE PTR [rbp+0x40],0x58
   140c65e65:	lea    rax,[rbp+0x40]
   140c65e69:	nop    DWORD PTR [rax+0x0]
   140c65e70:	inc    rsi
   140c65e73:	cmp    BYTE PTR [rax+rsi*1],0x0
   140c65e77:	jne    0x140c65e70
   140c65e79:	jmp    0x140c65e99
   140c65e7b:	cmp    bx,0x1
   140c65e7f:	jne    0x140c65ea8
   140c65e81:	mov    BYTE PTR [rbp+0x40],0x78
   140c65e85:	lea    rax,[rbp+0x40]
   140c65e89:	nop    DWORD PTR [rax+0x0]
   140c65e90:	inc    rsi
   140c65e93:	cmp    BYTE PTR [rax+rsi*1],0x0
   140c65e97:	jne    0x140c65e90
   140c65e99:	mov    r8,rsi
   140c65e9c:	lea    rdx,[rbp+0x40]
   140c65ea0:	mov    rcx,r15
   140c65ea3:	call   0x14006fa10
   140c65ea8:	test   DWORD PTR [r13+0x10],0x400000
   140c65eb0:	je     0x140c65ebc
   140c65eb2:	mov    dl,0x13
   140c65eb4:	mov    rcx,r15
   140c65eb7:	call   0x1400b9b80
   140c65ebc:	cmp    DWORD PTR [rip+0xc363d5],0x1        # 0x14189c298
   140c65ec3:	jne    0x140c65ef3
   140c65ec5:	mov    rbx,QWORD PTR [r13+0x38]
   140c65ec9:	mov    rdi,QWORD PTR [r13+0x40]
   140c65ecd:	nop    DWORD PTR [rax]
   140c65ed0:	cmp    rbx,rdi
   140c65ed3:	jae    0x140c65ef3
   140c65ed5:	mov    rcx,QWORD PTR [rbx]
   140c65ed8:	mov    rax,QWORD PTR [rcx]
   140c65edb:	call   QWORD PTR [rax+0x10]
   140c65ede:	cmp    eax,0x1f
   140c65ee1:	je     0x140c65ee9
   140c65ee3:	add    rbx,0x8
   140c65ee7:	jmp    0x140c65ed0
   140c65ee9:	mov    dl,0x24
   140c65eeb:	mov    rcx,r15
   140c65eee:	call   0x1400b9b80
   140c65ef3:	mov    r12,QWORD PTR [rsp+0x70]
   140c65ef8:	mov    r14,QWORD PTR [rsp+0x30]
   140c65efd:	add    rsp,0x38
   140c65f01:	pop    r15
   140c65f03:	pop    r13
   140c65f05:	pop    rdi
   140c65f06:	pop    rsi
   140c65f07:	pop    rbx
   140c65f08:	pop    rbp
   140c65f09:	ret
