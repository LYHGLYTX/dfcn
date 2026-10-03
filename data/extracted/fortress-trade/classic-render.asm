
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140382410 <.text+0x381410>:
   140382410:	rex push rbp
   140382412:	push   rbx
   140382413:	push   rsi
   140382414:	push   rdi
   140382415:	push   r12
   140382417:	push   r13
   140382419:	push   r14
   14038241b:	push   r15
   14038241d:	lea    rbp,[rsp-0x198]
   140382425:	sub    rsp,0x298
   14038242c:	mov    rax,QWORD PTR [rip+0x1513c0d]        # 0x141896040
   140382433:	xor    rax,rsp
   140382436:	mov    QWORD PTR [rbp+0x180],rax
   14038243d:	mov    DWORD PTR [rbp-0x60],edx
   140382440:	mov    r14,rcx
   140382443:	mov    QWORD PTR [rbp-0x80],rcx
   140382447:	lea    r15d,[r8+0x4]
   14038244b:	mov    DWORD PTR [rbp-0x78],r15d
   14038244f:	lea    esi,[r9-0x1c]
   140382453:	mov    DWORD PTR [rbp+0x10],esi
   140382456:	mov    r12d,DWORD PTR [rip+0x204521b]        # 0x1423c7678
   14038245d:	add    r12d,0xfffffffc
   140382461:	mov    DWORD PTR [rbp-0x58],r12d
   140382465:	mov    eax,0xffffffff
   14038246a:	mov    DWORD PTR [rbp+0x14],eax
   14038246d:	mov    DWORD PTR [rbp+0x18],eax
   140382470:	cmp    BYTE PTR [rip+0x200804e],0x0        # 0x14238a4c5
   140382477:	je     0x14038248d
   140382479:	lea    r8,[rbp+0x18]
   14038247d:	lea    rdx,[rbp+0x14]
   140382481:	lea    rcx,[rip+0x22c1e58]        # 0x1426442e0
   140382488:	call   0x1400bb2d0
   14038248d:	cmp    BYTE PTR [r14+0x1],0x0
   140382492:	je     0x14038290b
   140382498:	xor    r8d,r8d
   14038249b:	mov    edx,0x7
   1403824a0:	mov    r9b,0x1
   1403824a3:	lea    rcx,[rip+0x22c1e36]        # 0x1426442e0
   1403824aa:	call   0x1400bb0c0
   1403824af:	mov    edi,0x4
   1403824b4:	cmp    r12d,edi
   1403824b7:	jl     0x14038258a
   1403824bd:	nop    DWORD PTR [rax]
   1403824c0:	mov    ebx,r15d
   1403824c3:	cmp    r15d,esi
   1403824c6:	jg     0x14038257f
   1403824cc:	nop    DWORD PTR [rax+0x0]
   1403824d0:	mov    r8d,ebx
   1403824d3:	mov    edx,edi
   1403824d5:	lea    rcx,[rip+0x22c1e04]        # 0x1426442e0
   1403824dc:	call   0x1400bb0b0
   1403824e1:	xor    r8d,r8d
   1403824e4:	xor    edx,edx
   1403824e6:	lea    rcx,[rip+0x22c1df3]        # 0x1426442e0
   1403824ed:	call   0x1400bb120
   1403824f2:	cmp    edi,0x4
   1403824f5:	jne    0x14038251f
   1403824f7:	cmp    ebx,r15d
   1403824fa:	jne    0x140382504
   1403824fc:	mov    edx,DWORD PTR [rip+0x22c3702]        # 0x142645c04
   140382502:	jmp    0x140382569
   140382504:	lea    rcx,[rip+0x22c1dd5]        # 0x1426442e0
   14038250b:	cmp    ebx,esi
   14038250d:	jne    0x140382517
   14038250f:	mov    edx,DWORD PTR [rip+0x22c3707]        # 0x142645c1c
   140382515:	jmp    0x140382570
   140382517:	mov    edx,DWORD PTR [rip+0x22c36f3]        # 0x142645c10
   14038251d:	jmp    0x140382570
   14038251f:	cmp    edi,r12d
   140382522:	jne    0x14038254c
   140382524:	cmp    ebx,r15d
   140382527:	jne    0x140382531
   140382529:	mov    edx,DWORD PTR [rip+0x22c36dd]        # 0x142645c0c
   14038252f:	jmp    0x140382569
   140382531:	lea    rcx,[rip+0x22c1da8]        # 0x1426442e0
   140382538:	cmp    ebx,esi
   14038253a:	jne    0x140382544
   14038253c:	mov    edx,DWORD PTR [rip+0x22c36e2]        # 0x142645c24
   140382542:	jmp    0x140382570
   140382544:	mov    edx,DWORD PTR [rip+0x22c36ce]        # 0x142645c18
   14038254a:	jmp    0x140382570
   14038254c:	cmp    ebx,r15d
   14038254f:	jne    0x140382559
   140382551:	mov    edx,DWORD PTR [rip+0x22c36b1]        # 0x142645c08
   140382557:	jmp    0x140382569
   140382559:	cmp    ebx,esi
   14038255b:	mov    edx,DWORD PTR [rip+0x22c36bf]        # 0x142645c20
   140382561:	je     0x140382569
   140382563:	mov    edx,DWORD PTR [rip+0x22c36ab]        # 0x142645c14
   140382569:	lea    rcx,[rip+0x22c1d70]        # 0x1426442e0
   140382570:	call   0x140ad7b10
   140382575:	inc    ebx
   140382577:	cmp    ebx,esi
   140382579:	jle    0x1403824d0
   14038257f:	inc    edi
   140382581:	cmp    edi,r12d
   140382584:	jle    0x1403824c0
   14038258a:	xor    r8d,r8d
   14038258d:	mov    edx,0x6
   140382592:	mov    r9b,0x1
   140382595:	lea    rcx,[rip+0x22c1d44]        # 0x1426442e0
   14038259c:	call   0x1400bb0c0
   1403825a1:	add    r15d,0x2
   1403825a5:	mov    r8d,r15d
   1403825a8:	mov    edx,0x6
   1403825ad:	lea    rcx,[rip+0x22c1d2c]        # 0x1426442e0
   1403825b4:	call   0x1400bb0b0
   1403825b9:	lea    rdx,[rip+0x12a3490]        # 0x141625a50
   1403825c0:	lea    rcx,[rbp+0xc0]
   1403825c7:	call   0x1400680e0
   1403825cc:	nop
   1403825cd:	xor    r9d,r9d
   1403825d0:	xor    r8d,r8d
   1403825d3:	lea    rdx,[rbp+0xc0]
   1403825da:	lea    rcx,[rip+0x22c1cff]        # 0x1426442e0
   1403825e1:	call   0x140ad69a0
   1403825e6:	nop
   1403825e7:	lea    rcx,[rbp+0xc0]
   1403825ee:	call   0x140067dc0
   1403825f3:	lea    r13d,[rsi-0x2]
   1403825f7:	lea    ecx,[r12-0x9]
   1403825fc:	mov    eax,0x55555556
   140382601:	imul   ecx
   140382603:	mov    ebx,edx
   140382605:	shr    ebx,0x1f
   140382608:	add    ebx,edx
   14038260a:	mov    DWORD PTR [rbp-0x58],ebx
   14038260d:	lea    rcx,[r14+0x8]
   140382611:	call   0x14006ede0
   140382616:	mov    rdi,rax
   140382619:	mov    QWORD PTR [rbp-0x40],rax
   14038261d:	cmp    eax,ebx
   14038261f:	jle    0x140382625
   140382621:	lea    r13d,[rsi-0x4]
   140382625:	mov    esi,0x8
   14038262a:	mov    QWORD PTR [rbp-0x18],rsi
   14038262e:	mov    edx,eax
   140382630:	sub    edx,ebx
   140382632:	cmp    DWORD PTR [r14+0x20],edx
   140382636:	cmovle edx,DWORD PTR [r14+0x20]
   14038263b:	xor    r12d,r12d
   14038263e:	test   edx,edx
   140382640:	cmovns r12d,edx
   140382644:	lea    eax,[r12+rbx*1]
   140382648:	mov    DWORD PTR [rbp-0x60],eax
   14038264b:	cmp    r12d,eax
   14038264e:	jge    0x14038289d
   140382654:	mov    ebx,0x1
   140382659:	nop    DWORD PTR [rax+0x0]
   140382660:	cmp    r12d,edi
   140382663:	jge    0x14038289a
   140382669:	xor    r8d,r8d
   14038266c:	mov    edx,0x7
   140382671:	mov    r9b,0x1
   140382674:	lea    rcx,[rip+0x22c1c65]        # 0x1426442e0
   14038267b:	call   0x1400bb0c0
   140382680:	mov    edi,r15d
   140382683:	cmp    r15d,r13d
   140382686:	jg     0x140382785
   14038268c:	lea    r14d,[rsi+0x3]
   140382690:	mov    ebx,esi
   140382692:	cmp    esi,r14d
   140382695:	jge    0x14038276d
   14038269b:	cmp    edi,r13d
   14038269e:	jne    0x14038270a
   1403826a0:	lea    rsi,[rip+0x22c35f9]        # 0x142645ca0
   1403826a7:	nop    WORD PTR [rax+rax*1+0x0]
   1403826b0:	mov    r8d,edi
   1403826b3:	mov    edx,ebx
   1403826b5:	lea    rcx,[rip+0x22c1c24]        # 0x1426442e0
   1403826bc:	call   0x1400bb0b0
   1403826c1:	lea    rdx,[rsi-0x18]
   1403826c5:	cmp    edi,r15d
   1403826c8:	cmovne rdx,rsi
   1403826cc:	mov    edx,DWORD PTR [rdx]
   1403826ce:	lea    rcx,[rip+0x22c1c0b]        # 0x1426442e0
   1403826d5:	call   0x140ad7b10
   1403826da:	xor    edx,edx
   1403826dc:	lea    rcx,[rip+0x2044f7d]        # 0x1423c7660
   1403826e3:	call   0x140071f20
   1403826e8:	test   al,al
   1403826ea:	je     0x1403826fd
   1403826ec:	mov    r8b,0x1
   1403826ef:	xor    edx,edx
   1403826f1:	lea    rcx,[rip+0x22c1be8]        # 0x1426442e0
   1403826f8:	call   0x1400bb120
   1403826fd:	inc    ebx
   1403826ff:	add    rsi,0x4
   140382703:	cmp    ebx,r14d
   140382706:	jl     0x1403826b0
   140382708:	jmp    0x140382769
   14038270a:	lea    rsi,[rip+0x22c3583]        # 0x142645c94
   140382711:	mov    r8d,edi
   140382714:	mov    edx,ebx
   140382716:	lea    rcx,[rip+0x22c1bc3]        # 0x1426442e0
   14038271d:	call   0x1400bb0b0
   140382722:	lea    rdx,[rsi-0xc]
   140382726:	cmp    edi,r15d
   140382729:	cmovne rdx,rsi
   14038272d:	mov    edx,DWORD PTR [rdx]
   14038272f:	lea    rcx,[rip+0x22c1baa]        # 0x1426442e0
   140382736:	call   0x140ad7b10
   14038273b:	xor    edx,edx
   14038273d:	lea    rcx,[rip+0x2044f1c]        # 0x1423c7660
   140382744:	call   0x140071f20
   140382749:	test   al,al
   14038274b:	je     0x14038275e
   14038274d:	mov    r8b,0x1
   140382750:	xor    edx,edx
   140382752:	lea    rcx,[rip+0x22c1b87]        # 0x1426442e0
   140382759:	call   0x1400bb120
   14038275e:	inc    ebx
   140382760:	add    rsi,0x4
   140382764:	cmp    ebx,r14d
   140382767:	jl     0x140382711
   140382769:	mov    rsi,QWORD PTR [rbp-0x18]
   14038276d:	inc    edi
   14038276f:	cmp    edi,r13d
   140382772:	jle    0x140382690
   140382778:	mov    edi,esi
   14038277a:	mov    esi,0x1
   14038277f:	mov    r14,QWORD PTR [rbp-0x80]
   140382783:	jmp    0x140382789
   140382785:	mov    edi,esi
   140382787:	mov    esi,ebx
   140382789:	movsxd rdx,r12d
   14038278c:	lea    rcx,[r14+0x8]
   140382790:	call   0x14006f1b0
   140382795:	mov    rdx,QWORD PTR [rax]
   140382798:	mov    edx,DWORD PTR [rdx+0xc]
   14038279b:	lea    rcx,[rip+0x2048f46]        # 0x1423cb6e8
   1403827a2:	call   0x14007da80
   1403827a7:	mov    rbx,rax
   1403827aa:	lea    edx,[rdi+rsi*1]
   1403827ad:	mov    r8d,r15d
   1403827b0:	lea    rcx,[rip+0x22c1b29]        # 0x1426442e0
   1403827b7:	call   0x1400bb0b0
   1403827bc:	lea    rcx,[rbp+0xe0]
   1403827c3:	call   0x14006f620
   1403827c8:	nop
   1403827c9:	mov    r9d,0xffffffff
   1403827cf:	mov    r8b,0x1
   1403827d2:	lea    rdx,[rbp+0xe0]
   1403827d9:	movzx  ecx,WORD PTR [rbx+0x98]
   1403827e0:	call   0x140aa0c50
   1403827e5:	lea    rcx,[rbp+0xe0]
   1403827ec:	call   0x14052b070
   1403827f1:	xor    r9d,r9d
   1403827f4:	mov    r8b,0x3
   1403827f7:	lea    rdx,[rbp+0xe0]
   1403827fe:	lea    rcx,[rip+0x22c1adb]        # 0x1426442e0
   140382805:	call   0x140ad69a0
   14038280a:	lea    rdx,[rip+0x1266173]        # 0x1415e8984
   140382811:	lea    rcx,[rbp+0xc0]
   140382818:	call   0x1400680e0
   14038281d:	nop
   14038281e:	xor    r9d,r9d
   140382821:	mov    r8b,0x3
   140382824:	lea    rdx,[rbp+0xc0]
   14038282b:	lea    rcx,[rip+0x22c1aae]        # 0x1426442e0
   140382832:	call   0x140ad69a0
   140382837:	nop
   140382838:	lea    rcx,[rbp+0xc0]
   14038283f:	call   0x140067dc0
   140382844:	lea    rcx,[rbx+0x20]
   140382848:	lea    rdx,[rbp+0xe0]
   14038284f:	call   0x140a910b0
   140382854:	xor    r9d,r9d
   140382857:	xor    r8d,r8d
   14038285a:	lea    rdx,[rbp+0xe0]
   140382861:	lea    rcx,[rip+0x22c1a78]        # 0x1426442e0
   140382868:	call   0x140ad69a0
   14038286d:	mov    rsi,QWORD PTR [rbp-0x18]
   140382871:	add    esi,0x3
   140382874:	mov    QWORD PTR [rbp-0x18],rsi
   140382878:	lea    rcx,[rbp+0xe0]
   14038287f:	call   0x140067dc0
   140382884:	inc    r12d
   140382887:	cmp    r12d,DWORD PTR [rbp-0x60]
   14038288b:	mov    rdi,QWORD PTR [rbp-0x40]
   14038288f:	mov    ebx,0x1
   140382894:	jl     0x140382660
   14038289a:	mov    ebx,DWORD PTR [rbp-0x58]
   14038289d:	cmp    edi,ebx
   14038289f:	jle    0x1403880d8
   1403828a5:	lea    rcx,[rbp+0xc0]
   1403828ac:	call   0x1400bb2f0
   1403828b1:	lea    eax,[rbx+0x2]
   1403828b4:	lea    ecx,[rax+rax*2]
   1403828b7:	lea    r9d,[rdi-0x1]
   1403828bb:	mov    DWORD PTR [rsp+0x30],ecx
   1403828bf:	mov    DWORD PTR [rsp+0x28],0x9
   1403828c7:	mov    DWORD PTR [rsp+0x20],ebx
   1403828cb:	xor    r8d,r8d
   1403828ce:	mov    edx,DWORD PTR [r14+0x20]
   1403828d2:	lea    rcx,[rbp+0xc0]
   1403828d9:	call   0x1400bb310
   1403828de:	lea    r9d,[r13+0x1]
   1403828e2:	mov    DWORD PTR [rsp+0x28],0x0
   1403828ea:	movzx  eax,BYTE PTR [r14+0x24]
   1403828ef:	mov    BYTE PTR [rsp+0x20],al
   1403828f3:	mov    r8d,DWORD PTR [rbp+0x18]
   1403828f7:	mov    edx,DWORD PTR [rbp+0x14]
   1403828fa:	lea    rcx,[rbp+0xc0]
   140382901:	call   0x14140a440
   140382906:	jmp    0x1403880d8
   14038290b:	xor    ebx,ebx
   14038290d:	mov    r15d,0x8
   140382913:	cmp    BYTE PTR [r14+0x37c],bl
   14038291a:	je     0x1403831c3
   140382920:	lea    r12,[r14+0xe0]
   140382927:	mov    QWORD PTR [rbp-0x40],r12
   14038292b:	mov    rcx,r12
   14038292e:	call   0x14006f220
   140382933:	lea    r13,[r14+0xf8]
   14038293a:	mov    QWORD PTR [rbp-0x28],r13
   14038293e:	mov    rcx,r13
   140382941:	call   0x14006f220
   140382946:	mov    edi,ebx
   140382948:	mov    rcx,QWORD PTR [r14+0xb0]
   14038294f:	add    rcx,0x128
   140382956:	call   0x14006ede0
   14038295b:	test   rax,rax
   14038295e:	je     0x140382a56
   140382964:	nop    DWORD PTR [rax+0x0]
   140382968:	nop    DWORD PTR [rax+rax*1+0x0]
   140382970:	mov    rcx,QWORD PTR [r14+0xb0]
   140382977:	add    rcx,0x128
   14038297e:	mov    rdx,rbx
   140382981:	call   0x14006f1b0
   140382986:	mov    rcx,QWORD PTR [rax]
   140382989:	cmp    WORD PTR [rcx+0x8],0x2
   14038298e:	je     0x140382a35
   140382994:	mov    rcx,QWORD PTR [r14+0xb0]
   14038299b:	add    rcx,0x128
   1403829a2:	mov    rdx,rbx
   1403829a5:	call   0x14006f1b0
   1403829aa:	mov    rcx,QWORD PTR [rax]
   1403829ad:	mov    rax,QWORD PTR [rcx]
   1403829b0:	test   BYTE PTR [rax+0x10],0x20
   1403829b4:	je     0x140382a35
   1403829b6:	mov    rcx,QWORD PTR [r14+0xb0]
   1403829bd:	add    rcx,0x128
   1403829c4:	mov    rdx,rbx
   1403829c7:	call   0x14006f1b0
   1403829cc:	mov    r8,QWORD PTR [r14+0xb0]
   1403829d3:	mov    rax,QWORD PTR [rax]
   1403829d6:	mov    rcx,QWORD PTR [rax]
   1403829d9:	mov    rdx,rbx
   1403829dc:	test   DWORD PTR [rcx+0x10],0x8000
   1403829e3:	lea    rcx,[r8+0x128]
   1403829ea:	je     0x140382a25
   1403829ec:	call   0x14006f1b0
   1403829f1:	mov    rcx,QWORD PTR [rax]
   1403829f4:	mov    edx,0x2d
   1403829f9:	mov    rcx,QWORD PTR [rcx]
   1403829fc:	call   0x140cae7d0
   140382a01:	cmp    rax,QWORD PTR [r14+0xc0]
   140382a08:	jne    0x140382a35
   140382a0a:	mov    rcx,QWORD PTR [r14+0xb0]
   140382a11:	add    rcx,0x128
   140382a18:	mov    rdx,rbx
   140382a1b:	call   0x14006f1b0
   140382a20:	mov    rcx,r12
   140382a23:	jmp    0x140382a2d
   140382a25:	call   0x14006f1b0
   140382a2a:	mov    rcx,r13
   140382a2d:	mov    rdx,QWORD PTR [rax]
   140382a30:	call   0x1400b9910
   140382a35:	inc    edi
   140382a37:	movsxd rbx,edi
   140382a3a:	mov    rcx,QWORD PTR [r14+0xb0]
   140382a41:	add    rcx,0x128
   140382a48:	call   0x14006ede0
   140382a4d:	cmp    rbx,rax
   140382a50:	jb     0x140382970
   140382a56:	mov    rcx,r12
   140382a59:	call   0x14006ede0
   140382a5e:	test   rax,rax
   140382a61:	je     0x140382a8e
   140382a63:	mov    rcx,r12
   140382a66:	call   0x14006ede0
   140382a6b:	mov    rbx,rax
   140382a6e:	xor    edx,edx
   140382a70:	mov    rcx,r12
   140382a73:	call   0x14006f1b0
   140382a78:	lea    r9,[rip+0xfffffffffffff8d1]        # 0x140382350
   140382a7f:	mov    r8,r15
   140382a82:	mov    rdx,rbx
   140382a85:	mov    rcx,rax
   140382a88:	call   QWORD PTR [rip+0x125e2d2]        # 0x1415e0d60
   140382a8e:	mov    rcx,r13
   140382a91:	call   0x14006ede0
   140382a96:	test   rax,rax
   140382a99:	je     0x140382ac6
   140382a9b:	mov    rcx,r13
   140382a9e:	call   0x14006ede0
   140382aa3:	mov    rbx,rax
   140382aa6:	xor    edx,edx
   140382aa8:	mov    rcx,r13
   140382aab:	call   0x14006f1b0
   140382ab0:	lea    r9,[rip+0xfffffffffffff899]        # 0x140382350
   140382ab7:	mov    r8,r15
   140382aba:	mov    rdx,rbx
   140382abd:	mov    rcx,rax
   140382ac0:	call   QWORD PTR [rip+0x125e29a]        # 0x1415e0d60
   140382ac6:	lea    rsi,[r14+0x110]
   140382acd:	mov    QWORD PTR [rbp+0x8],rsi
   140382ad1:	mov    rcx,r12
   140382ad4:	call   0x14006ede0
   140382ad9:	mov    rdx,rax
   140382adc:	mov    rcx,rsi
   140382adf:	call   0x1401b9f40
   140382ae4:	mov    rcx,r12
   140382ae7:	call   0x14006ede0
   140382aec:	mov    rdx,rax
   140382aef:	lea    rcx,[r14+0x140]
   140382af6:	call   0x14006f310
   140382afb:	xor    ebx,ebx
   140382afd:	mov    edi,ebx
   140382aff:	mov    rcx,rsi
   140382b02:	call   0x140224080
   140382b07:	test   rax,rax
   140382b0a:	je     0x140382b44
   140382b0c:	xor    r15d,r15d
   140382b0f:	nop
   140382b10:	mov    rdx,rbx
   140382b13:	mov    rcx,rsi
   140382b16:	call   0x1401b9f30
   140382b1b:	mov    BYTE PTR [rax],r15b
   140382b1e:	mov    rdx,rbx
   140382b21:	lea    rcx,[r14+0x140]
   140382b28:	call   0x14006f2f0
   140382b2d:	mov    DWORD PTR [rax],r15d
   140382b30:	inc    edi
   140382b32:	movsxd rbx,edi
   140382b35:	mov    rcx,rsi
   140382b38:	call   0x140224080
   140382b3d:	cmp    rbx,rax
   140382b40:	jb     0x140382b10
   140382b42:	xor    ebx,ebx
   140382b44:	mov    r15,r14
   140382b47:	lea    rsi,[r14+0x128]
   140382b4e:	mov    QWORD PTR [rbp+0x58],rsi
   140382b52:	mov    rcx,r13
   140382b55:	call   0x14006ede0
   140382b5a:	mov    rdx,rax
   140382b5d:	mov    rcx,rsi
   140382b60:	call   0x1401b9f40
   140382b65:	mov    rcx,r13
   140382b68:	call   0x14006ede0
   140382b6d:	mov    rdx,rax
   140382b70:	lea    rcx,[r14+0x158]
   140382b77:	call   0x14006f310
   140382b7c:	mov    edi,ebx
   140382b7e:	mov    rcx,rsi
   140382b81:	call   0x140224080
   140382b86:	test   rax,rax
   140382b89:	je     0x140382bc7
   140382b8b:	nop    DWORD PTR [rax+rax*1+0x0]
   140382b90:	mov    rdx,rbx
   140382b93:	mov    rcx,rsi
   140382b96:	call   0x1401b9f30
   140382b9b:	mov    BYTE PTR [rax],0x0
   140382b9e:	mov    rdx,rbx
   140382ba1:	lea    rcx,[r14+0x158]
   140382ba8:	call   0x14006f2f0
   140382bad:	mov    DWORD PTR [rax],0x0
   140382bb3:	inc    edi
   140382bb5:	movsxd rbx,edi
   140382bb8:	mov    rcx,rsi
   140382bbb:	call   0x140224080
   140382bc0:	cmp    rbx,rax
   140382bc3:	jb     0x140382b90
   140382bc5:	xor    ebx,ebx
   140382bc7:	lea    r13,[r14+0x1d8]
   140382bce:	add    r15,0x178
   140382bd5:	mov    QWORD PTR [rbp+0x0],0x2
   140382bdd:	lea    r12,[r15-0x98]
   140382be4:	nop    DWORD PTR [rax+0x0]
   140382be8:	nop    DWORD PTR [rax+rax*1+0x0]
   140382bf0:	mov    edi,ebx
   140382bf2:	mov    eax,0xffffffff
   140382bf7:	mov    r14d,eax
   140382bfa:	mov    esi,eax
   140382bfc:	lea    rdx,[rbp-0x50]
   140382c00:	mov    rcx,r12
   140382c03:	call   0x14006f1d0
   140382c08:	lea    rcx,[r15-0x98]
   140382c0f:	lea    rdx,[rbp+0x20]
   140382c13:	call   0x14006f1c0
   140382c18:	lea    r8,[rbp+0x20]
   140382c1c:	lea    rdx,[rsp+0x78]
   140382c21:	lea    rcx,[rbp-0x50]
   140382c25:	call   0x14006edb0
   140382c2a:	xor    edx,edx
   140382c2c:	movzx  ecx,BYTE PTR [rax]
   140382c2f:	call   0x140065740
   140382c34:	test   al,al
   140382c36:	je     0x140382cab
   140382c38:	nop    DWORD PTR [rax+rax*1+0x0]
   140382c40:	lea    rcx,[rbp-0x50]
   140382c44:	call   0x14006eda0
   140382c49:	mov    rbx,QWORD PTR [rax]
   140382c4c:	mov    rax,QWORD PTR [rbx]
   140382c4f:	mov    rcx,rbx
   140382c52:	call   QWORD PTR [rax]
   140382c54:	movsx  edx,ax
   140382c57:	mov    rax,QWORD PTR [rbx]
   140382c5a:	mov    rcx,rbx
   140382c5d:	cmp    edx,r14d
   140382c60:	je     0x140382c6a
   140382c62:	call   QWORD PTR [rax]
   140382c64:	movsx  r14d,ax
   140382c68:	jmp    0x140382c74
   140382c6a:	call   QWORD PTR [rax+0x8]
   140382c6d:	movsx  ecx,ax
   140382c70:	cmp    ecx,esi
   140382c72:	je     0x140382c82
   140382c74:	mov    rax,QWORD PTR [rbx]
   140382c77:	mov    rcx,rbx
   140382c7a:	call   QWORD PTR [rax+0x8]
   140382c7d:	inc    edi
   140382c7f:	movsx  esi,ax
   140382c82:	lea    rcx,[rbp-0x50]
   140382c86:	call   0x14006ed90
   140382c8b:	lea    r8,[rbp+0x20]
   140382c8f:	lea    rdx,[rsp+0x78]
   140382c94:	lea    rcx,[rbp-0x50]
   140382c98:	call   0x14006edb0
   140382c9d:	xor    edx,edx
   140382c9f:	movzx  ecx,BYTE PTR [rax]
   140382ca2:	call   0x140065740
   140382ca7:	test   al,al
   140382ca9:	jne    0x140382c40
   140382cab:	movsxd r14,edi
   140382cae:	mov    rdx,r14
   140382cb1:	mov    rcx,r15
   140382cb4:	call   0x14006f310
   140382cb9:	lea    rbx,[r15+0x30]
   140382cbd:	mov    rdx,r14
   140382cc0:	mov    rcx,rbx
   140382cc3:	call   0x14006f310
   140382cc8:	xor    r8d,r8d
   140382ccb:	mov    rdx,r14
   140382cce:	mov    rcx,r13
   140382cd1:	call   0x140281a80
   140382cd6:	lea    rdx,[rbp-0x18]
   140382cda:	mov    rcx,r15
   140382cdd:	call   0x14006f1d0
   140382ce2:	lea    rdx,[rbp+0x60]
   140382ce6:	mov    rcx,r15
   140382ce9:	call   0x14006f1c0
   140382cee:	lea    rdx,[rbp+0x28]
   140382cf2:	mov    rcx,rbx
   140382cf5:	call   0x14006f1d0
   140382cfa:	lea    rdx,[rbp+0x80]
   140382d01:	mov    rcx,r13
   140382d04:	call   0x14013be00
   140382d09:	mov    eax,0xffffffff
   140382d0e:	mov    esi,eax
   140382d10:	mov    edi,eax
   140382d12:	lea    rcx,[r15-0x98]
   140382d19:	lea    rdx,[rbp+0x78]
   140382d1d:	call   0x14006f1d0
   140382d22:	mov    rcx,QWORD PTR [rax]
   140382d25:	mov    QWORD PTR [rbp-0x50],rcx
   140382d29:	lea    r8,[rbp+0x20]
   140382d2d:	lea    rdx,[rsp+0x70]
   140382d32:	lea    rcx,[rbp-0x50]
   140382d36:	call   0x14006edb0
   140382d3b:	xor    edx,edx
   140382d3d:	movzx  ecx,BYTE PTR [rax]
   140382d40:	call   0x140065740
   140382d45:	test   al,al
   140382d47:	je     0x140382e37
   140382d4d:	nop    DWORD PTR [rax]
   140382d50:	lea    rcx,[rbp-0x50]
   140382d54:	call   0x14006eda0
   140382d59:	mov    rbx,QWORD PTR [rax]
   140382d5c:	mov    rax,QWORD PTR [rbx]
   140382d5f:	mov    rcx,rbx
   140382d62:	call   QWORD PTR [rax]
   140382d64:	movsx  edx,ax
   140382d67:	mov    rax,QWORD PTR [rbx]
   140382d6a:	mov    rcx,rbx
   140382d6d:	cmp    edx,esi
   140382d6f:	je     0x140382d9f
   140382d71:	call   QWORD PTR [rax]
   140382d73:	movsx  esi,ax
   140382d76:	mov    rax,QWORD PTR [rbx]
   140382d79:	mov    rcx,rbx
   140382d7c:	call   QWORD PTR [rax+0x8]
   140382d7f:	movsx  edi,ax
   140382d82:	lea    rcx,[rbp-0x18]
   140382d86:	call   0x14006eda0
   140382d8b:	mov    DWORD PTR [rax],esi
   140382d8d:	lea    rcx,[rbp+0x28]
   140382d91:	call   0x14006eda0
   140382d96:	lea    rdx,[rbp+0x160]
   140382d9d:	jmp    0x140382dd0
   140382d9f:	call   QWORD PTR [rax+0x8]
   140382da2:	movsx  ecx,ax
   140382da5:	cmp    ecx,edi
   140382da7:	je     0x140382e06
   140382da9:	mov    rax,QWORD PTR [rbx]
   140382dac:	mov    rcx,rbx
   140382daf:	call   QWORD PTR [rax+0x8]
   140382db2:	movsx  edi,ax
   140382db5:	lea    rcx,[rbp-0x18]
   140382db9:	call   0x14006eda0
   140382dbe:	mov    DWORD PTR [rax],esi
   140382dc0:	lea    rcx,[rbp+0x28]
   140382dc4:	call   0x14006eda0
   140382dc9:	lea    rdx,[rbp+0xb0]
   140382dd0:	mov    DWORD PTR [rax],edi
   140382dd2:	lea    rcx,[rbp+0x80]
   140382dd9:	call   0x14013bca0
   140382dde:	mov    dl,0x1
   140382de0:	mov    rcx,rax
   140382de3:	call   0x14013bc40
   140382de8:	lea    rcx,[rbp-0x18]
   140382dec:	call   0x14006f2e0
   140382df1:	lea    rcx,[rbp+0x28]
   140382df5:	call   0x14006f2e0
   140382dfa:	lea    rcx,[rbp+0x80]
   140382e01:	call   0x14013bc70
   140382e06:	lea    rcx,[rbp-0x50]
   140382e0a:	call   0x14006ed90
   140382e0f:	lea    r8,[rbp+0x20]
   140382e13:	lea    rdx,[rsp+0x70]
   140382e18:	lea    rcx,[rbp-0x50]
   140382e1c:	call   0x14006edb0
   140382e21:	xor    edx,edx
   140382e23:	movzx  ecx,BYTE PTR [rax]
   140382e26:	call   0x140065740
   140382e2b:	test   al,al
   140382e2d:	jne    0x140382d50
   140382e33:	lea    rbx,[r15+0x30]
   140382e37:	lea    rcx,[r15+0xa0]
   140382e3e:	mov    rdx,r15
   140382e41:	call   0x140071f60
   140382e46:	lea    rcx,[r15+0xd0]
   140382e4d:	mov    rdx,rbx
   140382e50:	call   0x140071f60
   140382e55:	lea    rcx,[r13+0xa0]
   140382e5c:	mov    rdx,r13
   140382e5f:	call   0x1402213e0
   140382e64:	xor    r8d,r8d
   140382e67:	mov    rdx,r14
   140382e6a:	lea    rcx,[r13+0xe0]
   140382e71:	call   0x140281a80
   140382e76:	mov    rdx,r14
   140382e79:	lea    rcx,[r15+0x180]
   140382e80:	call   0x14006f310
   140382e85:	lea    rcx,[r13+0xe0]
   140382e8c:	call   0x140282a40
   140382e91:	lea    rcx,[r15+0x180]
   140382e98:	call   0x1400fb510
   140382e9d:	add    r13,0x20
   140382ea1:	add    r15,0x18
   140382ea5:	sub    QWORD PTR [rbp+0x0],0x1
   140382eaa:	lea    r12,[r12+0x18]
   140382eaf:	mov    ebx,0x0
   140382eb4:	jne    0x140382bf0
   140382eba:	mov    r15d,ebx
   140382ebd:	mov    r12,QWORD PTR [rbp-0x40]
   140382ec1:	mov    rcx,r12
   140382ec4:	call   0x14006ede0
   140382ec9:	test   rax,rax
   140382ecc:	mov    r13,QWORD PTR [rbp-0x28]
   140382ed0:	je     0x140383010
   140382ed6:	mov    edi,ebx
   140382ed8:	mov    rsi,QWORD PTR [rbp-0x80]
   140382edc:	add    rsi,0xe0
   140382ee3:	mov    r13,QWORD PTR [rbp+0x8]
   140382ee7:	nop    WORD PTR [rax+rax*1+0x0]
   140382ef0:	mov    rdx,rdi
   140382ef3:	mov    rcx,rsi
   140382ef6:	call   0x14006f1b0
   140382efb:	mov    rcx,QWORD PTR [rax]
   140382efe:	mov    rax,QWORD PTR [rcx]
   140382f01:	call   QWORD PTR [rax]
   140382f03:	cmp    ax,0x20
   140382f07:	jne    0x140382ff5
   140382f0d:	mov    r14d,ebx
   140382f10:	mov    rdx,rdi
   140382f13:	mov    rcx,rsi
   140382f16:	call   0x14006f1b0
   140382f1b:	mov    rcx,QWORD PTR [rax]
   140382f1e:	add    rcx,0x38
   140382f22:	call   0x14006ede0
   140382f27:	test   rax,rax
   140382f2a:	je     0x140382ff5
   140382f30:	mov    rdx,rdi
   140382f33:	mov    rcx,rsi
   140382f36:	call   0x14006f1b0
   140382f3b:	mov    rcx,QWORD PTR [rax]
   140382f3e:	add    rcx,0x38
   140382f42:	mov    rdx,rbx
   140382f45:	call   0x14006f1b0
   140382f4a:	mov    rcx,QWORD PTR [rax]
   140382f4d:	mov    rax,QWORD PTR [rcx]
   140382f50:	call   QWORD PTR [rax+0x10]
   140382f53:	cmp    eax,0xa
   140382f56:	jne    0x140382fcd
   140382f58:	mov    rdx,rdi
   140382f5b:	mov    rcx,rsi
   140382f5e:	call   0x14006f1b0
   140382f63:	mov    rcx,QWORD PTR [rax]
   140382f66:	add    rcx,0x38
   140382f6a:	mov    rdx,rbx
   140382f6d:	call   0x14006f1b0
   140382f72:	mov    rcx,QWORD PTR [rax]
   140382f75:	mov    rax,QWORD PTR [rcx]
   140382f78:	call   QWORD PTR [rax+0x18]
   140382f7b:	mov    QWORD PTR [rbp-0x40],rax
   140382f7f:	test   rax,rax
   140382f82:	je     0x140382fcd
   140382f84:	lea    eax,[r15+0x1]
   140382f88:	movsxd rbx,eax
   140382f8b:	lea    r8,[rbp-0x40]
   140382f8f:	mov    rdx,rbx
   140382f92:	mov    rcx,r12
   140382f95:	call   0x1401b9eb0
   140382f9a:	mov    BYTE PTR [rsp+0x70],0x2
   140382f9f:	lea    r8,[rsp+0x70]
   140382fa4:	mov    rdx,rbx
   140382fa7:	mov    rcx,r13
   140382faa:	call   0x140281a00
   140382faf:	mov    DWORD PTR [rbp-0x30],0x0
   140382fb6:	lea    r8,[rbp-0x30]
   140382fba:	mov    rdx,rbx
   140382fbd:	mov    rcx,QWORD PTR [rbp-0x80]
   140382fc1:	add    rcx,0x140
   140382fc8:	call   0x1400b99a0
   140382fcd:	inc    r14d
   140382fd0:	mov    rdx,rdi
   140382fd3:	mov    rcx,rsi
   140382fd6:	call   0x14006f1b0
   140382fdb:	movsxd rbx,r14d
   140382fde:	mov    rcx,QWORD PTR [rax]
   140382fe1:	add    rcx,0x38
   140382fe5:	call   0x14006ede0
   140382fea:	cmp    rbx,rax
   140382fed:	jb     0x140382f30
   140382ff3:	xor    ebx,ebx
   140382ff5:	inc    r15d
   140382ff8:	movsxd rdi,r15d
   140382ffb:	mov    rcx,r12
   140382ffe:	call   0x14006ede0
   140383003:	cmp    rdi,rax
   140383006:	jb     0x140382ef0
   14038300c:	mov    r13,QWORD PTR [rbp-0x28]
   140383010:	mov    r15d,ebx
   140383013:	mov    rcx,r13
   140383016:	call   0x14006ede0
   14038301b:	test   rax,rax
   14038301e:	je     0x14038315c
   140383024:	mov    rdi,rbx
   140383027:	mov    rsi,QWORD PTR [rbp-0x80]
   14038302b:	add    rsi,0xf8
   140383032:	mov    r12,QWORD PTR [rbp+0x58]
   140383036:	data16 nop WORD PTR [rax+rax*1+0x0]
   140383040:	mov    rdx,rdi
   140383043:	mov    rcx,rsi
   140383046:	call   0x14006f1b0
   14038304b:	mov    rcx,QWORD PTR [rax]
   14038304e:	mov    rax,QWORD PTR [rcx]
   140383051:	call   QWORD PTR [rax]
   140383053:	cmp    ax,0x20
   140383057:	jne    0x140383145
   14038305d:	mov    r14d,ebx
   140383060:	mov    rdx,rdi
   140383063:	mov    rcx,rsi
   140383066:	call   0x14006f1b0
   14038306b:	mov    rcx,QWORD PTR [rax]
   14038306e:	add    rcx,0x38
   140383072:	call   0x14006ede0
   140383077:	test   rax,rax
   14038307a:	je     0x140383145
   140383080:	mov    rdx,rdi
   140383083:	mov    rcx,rsi
   140383086:	call   0x14006f1b0
   14038308b:	mov    rcx,QWORD PTR [rax]
   14038308e:	add    rcx,0x38
   140383092:	mov    rdx,rbx
   140383095:	call   0x14006f1b0
   14038309a:	mov    rcx,QWORD PTR [rax]
   14038309d:	mov    rax,QWORD PTR [rcx]
   1403830a0:	call   QWORD PTR [rax+0x10]
   1403830a3:	cmp    eax,0xa
   1403830a6:	jne    0x14038311d
   1403830a8:	mov    rdx,rdi
   1403830ab:	mov    rcx,rsi
   1403830ae:	call   0x14006f1b0
   1403830b3:	mov    rcx,QWORD PTR [rax]
   1403830b6:	add    rcx,0x38
   1403830ba:	mov    rdx,rbx
   1403830bd:	call   0x14006f1b0
   1403830c2:	mov    rcx,QWORD PTR [rax]
   1403830c5:	mov    rax,QWORD PTR [rcx]
   1403830c8:	call   QWORD PTR [rax+0x18]
   1403830cb:	mov    QWORD PTR [rbp-0x40],rax
   1403830cf:	test   rax,rax
   1403830d2:	je     0x14038311d
   1403830d4:	lea    eax,[r15+0x1]
   1403830d8:	movsxd rbx,eax
   1403830db:	lea    r8,[rbp-0x40]
   1403830df:	mov    rdx,rbx
   1403830e2:	mov    rcx,r13
   1403830e5:	call   0x1401b9eb0
   1403830ea:	mov    BYTE PTR [rsp+0x70],0x2
   1403830ef:	lea    r8,[rsp+0x70]
   1403830f4:	mov    rdx,rbx
   1403830f7:	mov    rcx,r12
   1403830fa:	call   0x140281a00
   1403830ff:	mov    DWORD PTR [rbp-0x30],0x0
   140383106:	lea    r8,[rbp-0x30]
   14038310a:	mov    rdx,rbx
   14038310d:	mov    rcx,QWORD PTR [rbp-0x80]
   140383111:	add    rcx,0x158
   140383118:	call   0x1400b99a0
   14038311d:	inc    r14d
   140383120:	mov    rdx,rdi
   140383123:	mov    rcx,rsi
   140383126:	call   0x14006f1b0
   14038312b:	movsxd rbx,r14d
   14038312e:	mov    rcx,QWORD PTR [rax]
   140383131:	add    rcx,0x38
   140383135:	call   0x14006ede0
   14038313a:	cmp    rbx,rax
   14038313d:	jb     0x140383080
   140383143:	xor    ebx,ebx
   140383145:	inc    r15d
   140383148:	movsxd rdi,r15d
   14038314b:	mov    rcx,r13
   14038314e:	call   0x14006ede0
   140383153:	cmp    rdi,rax
   140383156:	jb     0x140383040
   14038315c:	xor    edx,edx
   14038315e:	mov    r14,QWORD PTR [rbp-0x80]
   140383162:	mov    rcx,r14
   140383165:	call   0x14037a340
   14038316a:	mov    BYTE PTR [r14+0x330],0x0
   140383172:	mov    DWORD PTR [r14+0x328],ebx
   140383179:	xor    edx,edx
   14038317b:	mov    rcx,r14
   14038317e:	call   0x140378880
   140383183:	mov    ebx,0x1
   140383188:	mov    edx,ebx
   14038318a:	mov    rcx,r14
   14038318d:	call   0x14037a340
   140383192:	mov    BYTE PTR [r14+0x331],0x0
   14038319a:	mov    DWORD PTR [r14+0x32c],0x0
   1403831a5:	mov    edx,ebx
   1403831a7:	mov    rcx,r14
   1403831aa:	call   0x140378880
   1403831af:	mov    BYTE PTR [r14+0x37c],0x0
   1403831b7:	mov    r12d,DWORD PTR [rbp-0x58]
   1403831bb:	xor    ebx,ebx
   1403831bd:	mov    r15d,0x8
   1403831c3:	cmp    BYTE PTR [r14+0x37d],0x0
   1403831cb:	je     0x140383380
   1403831d1:	mov    BYTE PTR [r14+0x37d],0x0
   1403831d9:	cmp    QWORD PTR [r14+0xd8],0x0
   1403831e1:	je     0x140383380
   1403831e7:	mov    r14d,ebx
   1403831ea:	mov    r13,QWORD PTR [rbp-0x80]
   1403831ee:	lea    rcx,[r13+0xe0]
   1403831f5:	call   0x14006ede0
   1403831fa:	test   rax,rax
   1403831fd:	je     0x1403832f8
   140383203:	mov    rdi,rbx
   140383206:	mov    r12d,0x32
   14038320c:	nop    DWORD PTR [rax+0x0]
   140383210:	mov    rbx,QWORD PTR [r13+0xb8]
   140383217:	mov    rdx,rdi
   14038321a:	lea    rcx,[r13+0xe0]
   140383221:	call   0x14006f1b0
   140383226:	mov    rcx,QWORD PTR [rax]
   140383229:	lea    rdx,[rbx+0x2100]
   140383230:	mov    ecx,DWORD PTR [rcx+0x1c]
   140383233:	call   0x1400e13b0
   140383238:	cmp    eax,0xffffffff
   14038323b:	jne    0x1403832d7
   140383241:	mov    rdx,rdi
   140383244:	lea    rcx,[r13+0xe0]
   14038324b:	call   0x14006f1b0
   140383250:	mov    r8,QWORD PTR [r13+0xc0]
   140383257:	mov    rdx,QWORD PTR [r13+0xb8]
   14038325e:	mov    rcx,QWORD PTR [rax]
   140383261:	call   0x140c63c70
   140383266:	mov    ecx,eax
   140383268:	mov    eax,0x66666667
   14038326d:	imul   ecx
   14038326f:	sar    edx,0x2
   140383272:	mov    ebx,edx
   140383274:	shr    ebx,0x1f
   140383277:	inc    edx
   140383279:	add    ebx,edx
   14038327b:	cmp    ebx,r12d
   14038327e:	cmovg  ebx,r12d
   140383282:	mov    edx,0x49
   140383287:	mov    r8d,ebx
   14038328a:	mov    rcx,QWORD PTR [r13+0xd8]
   140383291:	call   0x141336a60
   140383296:	lea    r8d,[rbx+rbx*2]
   14038329a:	add    r8d,r8d
   14038329d:	mov    edx,0x49
   1403832a2:	mov    rcx,QWORD PTR [r13+0xd8]
   1403832a9:	call   0x1413cff90
   1403832ae:	mov    rbx,QWORD PTR [r13+0xb8]
   1403832b5:	mov    rdx,rdi
   1403832b8:	lea    rcx,[r13+0xe0]
   1403832bf:	call   0x14006f1b0
   1403832c4:	mov    rdx,QWORD PTR [rax]
   1403832c7:	add    rdx,0x1c
   1403832cb:	lea    rcx,[rbx+0x2100]
   1403832d2:	call   0x14006f3a0
   1403832d7:	inc    r14d
   1403832da:	movsxd rdi,r14d
   1403832dd:	lea    rcx,[r13+0xe0]
   1403832e4:	call   0x14006ede0
   1403832e9:	cmp    rdi,rax
   1403832ec:	jb     0x140383210
   1403832f2:	mov    r12d,DWORD PTR [rbp-0x58]
   1403832f6:	xor    ebx,ebx
   1403832f8:	mov    r14d,ebx
   1403832fb:	lea    rcx,[r13+0xf8]
   140383302:	call   0x14006ede0
   140383307:	test   rax,rax
   14038330a:	je     0x14038337d
   14038330c:	mov    rdi,rbx
   14038330f:	nop
   140383310:	mov    rbx,QWORD PTR [r13+0xb8]
   140383317:	mov    rdx,rdi
   14038331a:	lea    rcx,[r13+0xf8]
   140383321:	call   0x14006f1b0
   140383326:	mov    rcx,QWORD PTR [rax]
   140383329:	lea    rdx,[rbx+0x2100]
   140383330:	mov    ecx,DWORD PTR [rcx+0x1c]
   140383333:	call   0x1400e13b0
   140383338:	cmp    eax,0xffffffff
   14038333b:	jne    0x140383366
   14038333d:	mov    rbx,QWORD PTR [r13+0xb8]
   140383344:	mov    rdx,rdi
   140383347:	lea    rcx,[r13+0xf8]
   14038334e:	call   0x14006f1b0
   140383353:	mov    rdx,QWORD PTR [rax]
   140383356:	add    rdx,0x1c
   14038335a:	lea    rcx,[rbx+0x2100]
   140383361:	call   0x14006f3a0
   140383366:	inc    r14d
   140383369:	movsxd rdi,r14d
   14038336c:	lea    rcx,[r13+0xf8]
   140383373:	call   0x14006ede0
   140383378:	cmp    rdi,rax
   14038337b:	jb     0x140383310
   14038337d:	mov    r14,r13
   140383380:	mov    edi,0x5
   140383385:	mov    r13d,0xa
   14038338b:	cmp    WORD PTR [r14+0x37a],0xffff
   140383394:	jne    0x1403833c4
   140383396:	lea    rcx,[r14+0x3c0]
   14038339d:	call   0x14006ede0
   1403833a2:	test   rax,rax
   1403833a5:	je     0x1403833c4
   1403833a7:	lea    rcx,[r14+0x3c0]
   1403833ae:	call   0x14006ede0
   1403833b3:	xor    ecx,ecx
   1403833b5:	add    eax,0xfffffffe
   1403833b8:	cmovns ecx,eax
   1403833bb:	cmp    ecx,edi
   1403833bd:	cmovg  ecx,edi
   1403833c0:	lea    r13d,[rcx+0xa]
   1403833c4:	lea    r8d,[r12-0x6]
   1403833c9:	mov    DWORD PTR [rbp-0x20],r8d
   1403833cd:	mov    esi,DWORD PTR [rbp+0x10]
   1403833d0:	mov    eax,esi
   1403833d2:	sub    eax,DWORD PTR [rbp-0x78]
   1403833d5:	inc    eax
   1403833d7:	cdq
   1403833d8:	sub    eax,edx
   1403833da:	sar    eax,1
   1403833dc:	add    eax,DWORD PTR [rbp-0x78]
   1403833df:	mov    DWORD PTR [rbp-0x48],eax
   1403833e2:	lea    eax,[r13+0x2]
   1403833e6:	mov    DWORD PTR [rbp-0x70],eax
   1403833e9:	lea    ecx,[r8-0x2]
   1403833ed:	sub    ecx,eax
   1403833ef:	inc    ecx
   1403833f1:	mov    eax,0x55555556
   1403833f6:	imul   ecx
   1403833f8:	mov    ecx,edx
   1403833fa:	shr    ecx,0x1f
   1403833fd:	add    ecx,edx
   1403833ff:	mov    DWORD PTR [rbp+0x40],ecx
   140383402:	dec    ecx
   140383404:	lea    eax,[rcx+rcx*2]
   140383407:	mov    DWORD PTR [rbp+0x30],eax
   14038340a:	xor    r8d,r8d
   14038340d:	mov    edx,0x7
   140383412:	mov    r9b,0x1
   140383415:	lea    rcx,[rip+0x22c0ec4]        # 0x1426442e0
   14038341c:	call   0x1400bb0c0
   140383421:	mov    edi,0x4
   140383426:	cmp    r12d,edi
   140383429:	jl     0x140383540
   14038342f:	mov    eax,DWORD PTR [rbp-0x78]
   140383432:	mov    ebx,eax
   140383434:	cmp    eax,esi
   140383436:	jg     0x14038352b
   14038343c:	mov    r14d,DWORD PTR [rbp-0x78]
   140383440:	mov    r8d,ebx
   140383443:	mov    edx,edi
   140383445:	lea    rcx,[rip+0x22c0e94]        # 0x1426442e0
   14038344c:	call   0x1400bb0b0
   140383451:	xor    r8d,r8d
   140383454:	xor    edx,edx
   140383456:	lea    rcx,[rip+0x22c0e83]        # 0x1426442e0
   14038345d:	call   0x1400bb120
   140383462:	cmp    edi,0x4
   140383465:	jne    0x140383498
   140383467:	cmp    ebx,r14d
   14038346a:	jne    0x140383477
   14038346c:	mov    edx,DWORD PTR [rip+0x22c2792]        # 0x142645c04
   140383472:	jmp    0x140383512
   140383477:	lea    rcx,[rip+0x22c0e62]        # 0x1426442e0
   14038347e:	cmp    ebx,esi
   140383480:	jne    0x14038348d
   140383482:	mov    edx,DWORD PTR [rip+0x22c2794]        # 0x142645c1c
   140383488:	jmp    0x140383519
   14038348d:	mov    edx,DWORD PTR [rip+0x22c277d]        # 0x142645c10
   140383493:	jmp    0x140383519
   140383498:	cmp    edi,r12d
   14038349b:	jne    0x1403834c5
   14038349d:	cmp    ebx,r14d
   1403834a0:	jne    0x1403834aa
   1403834a2:	mov    edx,DWORD PTR [rip+0x22c2764]        # 0x142645c0c
   1403834a8:	jmp    0x140383512
   1403834aa:	lea    rcx,[rip+0x22c0e2f]        # 0x1426442e0
   1403834b1:	cmp    ebx,esi
   1403834b3:	jne    0x1403834bd
   1403834b5:	mov    edx,DWORD PTR [rip+0x22c2769]        # 0x142645c24
   1403834bb:	jmp    0x140383519
   1403834bd:	mov    edx,DWORD PTR [rip+0x22c2755]        # 0x142645c18
   1403834c3:	jmp    0x140383519
   1403834c5:	cmp    ebx,r14d
   1403834c8:	jne    0x1403834d2
   1403834ca:	mov    edx,DWORD PTR [rip+0x22c2738]        # 0x142645c08
   1403834d0:	jmp    0x140383512
   1403834d2:	cmp    ebx,esi
   1403834d4:	jne    0x1403834de
   1403834d6:	mov    edx,DWORD PTR [rip+0x22c2744]        # 0x142645c20
   1403834dc:	jmp    0x140383512
   1403834de:	lea    eax,[r13+0x1]
   1403834e2:	cmp    edi,eax
   1403834e4:	je     0x14038350c
   1403834e6:	lea    ecx,[r12-0x7]
   1403834eb:	cmp    edi,ecx
   1403834ed:	je     0x14038350c
   1403834ef:	cmp    ebx,DWORD PTR [rbp-0x48]
   1403834f2:	jne    0x140383504
   1403834f4:	cmp    edi,eax
   1403834f6:	jle    0x140383504
   1403834f8:	cmp    edi,ecx
   1403834fa:	jge    0x140383504
   1403834fc:	mov    edx,DWORD PTR [rip+0x22c2706]        # 0x142645c08
   140383502:	jmp    0x140383512
   140383504:	mov    edx,DWORD PTR [rip+0x22c270a]        # 0x142645c14
   14038350a:	jmp    0x140383512
   14038350c:	mov    edx,DWORD PTR [rip+0x22c26fe]        # 0x142645c10
   140383512:	lea    rcx,[rip+0x22c0dc7]        # 0x1426442e0
   140383519:	call   0x140ad7b10
   14038351e:	inc    ebx
   140383520:	cmp    ebx,esi
   140383522:	jle    0x140383440
   140383528:	mov    eax,r14d
   14038352b:	inc    edi
   14038352d:	cmp    edi,r12d
   140383530:	jle    0x140383432
   140383536:	mov    r15d,0x8
   14038353c:	mov    r14,QWORD PTR [rbp-0x80]
   140383540:	cmp    BYTE PTR [r14+0xc8],0x0
   140383548:	jne    0x140387df2
   14038354e:	cmp    BYTE PTR [r14+0xc9],0x0
   140383556:	je     0x140387df2
   14038355c:	cmp    QWORD PTR [r14+0xd0],0x0
   140383564:	je     0x140384117
   14038356a:	xor    edx,edx
   14038356c:	lea    rcx,[rip+0x20440ed]        # 0x1423c7660
   140383573:	call   0x140071f20
   140383578:	test   al,al
   14038357a:	je     0x140383699
   140383580:	lea    rcx,[rbp+0xc0]
   140383587:	call   0x14006f620
   14038358c:	nop
   14038358d:	mov    r8,QWORD PTR [r14+0xd0]
   140383594:	lea    rax,[rsp+0x70]
   140383599:	mov    QWORD PTR [rsp+0x50],rax
   14038359e:	mov    QWORD PTR [rsp+0x48],0x0
   1403835a7:	mov    QWORD PTR [rsp+0x40],r8
   1403835ac:	mov    DWORD PTR [rsp+0x38],0x800
   1403835b4:	movzx  eax,WORD PTR [r8+0xa0]
   1403835bc:	mov    WORD PTR [rsp+0x30],ax
   1403835c1:	mov    eax,0xffffffff
   1403835c6:	mov    WORD PTR [rsp+0x28],ax
   1403835cb:	mov    WORD PTR [rsp+0x20],ax
   1403835d0:	movzx  r9d,WORD PTR [r8+0x12c]
   1403835d8:	movzx  r8d,WORD PTR [r8+0xa4]
   1403835e0:	lea    rdx,[rbp+0xc0]
   1403835e7:	lea    rcx,[rip+0x216334a]        # 0x1424e6938
   1403835ee:	call   0x1400f2670
   1403835f3:	mov    ebx,eax
   1403835f5:	lea    rcx,[rip+0x22c0ce4]        # 0x1426442e0
   1403835fc:	cmp    BYTE PTR [rsp+0x70],0x0
   140383601:	je     0x140383647
   140383603:	mov    r15d,DWORD PTR [rbp-0x78]
   140383607:	lea    r8d,[r15+0x1]
   14038360b:	mov    edx,0x5
   140383610:	call   0x1400bb0b0
   140383615:	test   ebx,ebx
   140383617:	je     0x14038368b
   140383619:	mov    BYTE PTR [rsp+0x30],0x0
   14038361e:	mov    DWORD PTR [rsp+0x28],0x3
   140383626:	mov    DWORD PTR [rsp+0x20],0x5
   14038362e:	mov    r9d,0x6
   140383634:	xor    r8d,r8d
   140383637:	mov    edx,ebx
   140383639:	lea    rcx,[rip+0x22c0ca0]        # 0x1426442e0
   140383640:	call   0x140ad7db0
   140383645:	jmp    0x14038368b
   140383647:	mov    r8d,DWORD PTR [rbp-0x78]
   14038364b:	add    r8d,0x5
   14038364f:	mov    edx,r15d
   140383652:	call   0x1400bb0b0
   140383657:	test   ebx,ebx
   140383659:	je     0x140383687
   14038365b:	mov    BYTE PTR [rsp+0x30],0x0
   140383660:	mov    DWORD PTR [rsp+0x28],0x3
   140383668:	mov    DWORD PTR [rsp+0x20],0x5
   140383670:	mov    r9d,0x2
   140383676:	mov    r8d,r9d
   140383679:	mov    edx,ebx
   14038367b:	lea    rcx,[rip+0x22c0c5e]        # 0x1426442e0
   140383682:	call   0x140ad7db0
   140383687:	mov    r15d,DWORD PTR [rbp-0x78]
   14038368b:	lea    rcx,[rbp+0xc0]
   140383692:	call   0x140067dc0
   140383697:	jmp    0x1403836e6
   140383699:	mov    r15d,DWORD PTR [rbp-0x78]
   14038369d:	lea    r8d,[r15+0x7]
   1403836a1:	mov    edx,0x9
   1403836a6:	lea    rcx,[rip+0x22c0c33]        # 0x1426442e0
   1403836ad:	call   0x1400bb0b0
   1403836b2:	xor    edx,edx
   1403836b4:	xor    r9d,r9d
   1403836b7:	mov    r8b,0x1
   1403836ba:	mov    rcx,QWORD PTR [r14+0xd0]
   1403836c1:	call   0x14132eb30
   1403836c6:	mov    rcx,QWORD PTR [r14+0xd0]
   1403836cd:	mov    rax,QWORD PTR [rcx]
   1403836d0:	xor    edx,edx
   1403836d2:	call   QWORD PTR [rax]
   1403836d4:	movzx  edx,al
   1403836d7:	mov    r8b,0x1
   1403836da:	lea    rcx,[rip+0x22c0bff]        # 0x1426442e0
   1403836e1:	call   0x1400bb120
   1403836e6:	lea    rcx,[rbp+0x160]
   1403836ed:	call   0x14006f620
   1403836f2:	nop
   1403836f3:	xor    r8d,r8d
   1403836f6:	lea    rdx,[rbp+0x160]
   1403836fd:	mov    rcx,QWORD PTR [r14+0xd0]
   140383704:	call   0x14132bba0
   140383709:	xor    edx,edx
   14038370b:	xor    r9d,r9d
   14038370e:	mov    r8b,0x1
   140383711:	mov    rcx,QWORD PTR [r14+0xd0]
   140383718:	call   0x14132eb30
   14038371d:	lea    r14d,[r15+0xd]
   140383721:	mov    r8d,r14d
   140383724:	mov    edx,0x5
   140383729:	lea    rcx,[rip+0x22c0bb0]        # 0x1426442e0
   140383730:	call   0x1400bb0b0
   140383735:	xor    r9d,r9d
   140383738:	xor    r8d,r8d
   14038373b:	lea    rdx,[rbp+0x160]
   140383742:	lea    rcx,[rip+0x22c0b97]        # 0x1426442e0
   140383749:	call   0x140ad69a0
   14038374e:	xor    r12b,r12b
   140383751:	mov    rbx,QWORD PTR [rbp-0x80]
   140383755:	mov    rcx,QWORD PTR [rbx+0xd8]
   14038375c:	test   rcx,rcx
   14038375f:	je     0x140383779
   140383761:	mov    dx,0x48
   140383765:	call   0x141339710
   14038376a:	movzx  r12d,r12b
   14038376e:	test   eax,eax
   140383770:	mov    eax,0x1
   140383775:	cmovg  r12d,eax
   140383779:	mov    edi,0x7
   14038377e:	lea    rsi,[rbx+0x3c0]
   140383785:	mov    rcx,rsi
   140383788:	cmp    WORD PTR [rbx+0x37a],0xffff
   140383790:	je     0x140383e4d
   140383796:	call   0x14014d670
   14038379b:	lea    rcx,[rbp+0x140]
   1403837a2:	call   0x140065a90
   1403837a7:	nop
   1403837a8:	lea    rdx,[rip+0x1260f4d]        # 0x1415e46fc
   1403837af:	lea    rcx,[rbp+0x100]
   1403837b6:	call   0x1400680e0
   1403837bb:	nop
   1403837bc:	mov    r14,QWORD PTR [rbp-0x80]
   1403837c0:	movsx  rax,WORD PTR [r14+0x37a]
   1403837c8:	cmp    eax,0x1c
   1403837cb:	ja     0x140383d79
   1403837d1:	lea    rdx,[rip+0xffffffffffc7c828]        # 0x140000000
   1403837d8:	mov    ecx,DWORD PTR [rdx+rax*4+0x3880fc]
   1403837df:	add    rcx,rdx
   1403837e2:	jmp    rcx
   1403837e4:	mov    rcx,QWORD PTR [r14+0xc0]
   1403837eb:	mov    eax,DWORD PTR [rip+0x2009d6f]        # 0x14238d560
   1403837f1:	cmp    DWORD PTR [rcx+0x4],eax
   1403837f4:	jne    0x140383827
   1403837f6:	lea    rdx,[rip+0x12a291b]        # 0x141626118
   1403837fd:	lea    rax,[rip+0x12a29a4]        # 0x1416261a8
   140383804:	cmp    BYTE PTR [rip+0x20079bf],0x0        # 0x14238b1ca
   14038380b:	cmove  rdx,rax
   14038380f:	lea    rcx,[rbp+0x100]
   140383816:	call   0x14006f4f0
   14038381b:	lea    rdx,[rip+0x12a2956]        # 0x141626178
   140383822:	jmp    0x140383d6d
   140383827:	movzx  ecx,WORD PTR [rcx+0xcf2]
   14038382e:	call   0x14075a9f0
   140383833:	test   al,al
   140383835:	jne    0x1403839c3
   14038383b:	mov    rcx,QWORD PTR [r14+0xc0]
   140383842:	movzx  eax,WORD PTR [rcx+0xcf2]
   140383849:	sub    ax,0x5
   14038384d:	cmp    ax,0x1
   140383851:	jbe    0x1403839c3
   140383857:	movzx  ecx,WORD PTR [rcx+0xcf4]
   14038385e:	call   0x14075a9f0
   140383863:	test   al,al
   140383865:	jne    0x1403839c3
   14038386b:	mov    rcx,QWORD PTR [r14+0xc0]
   140383872:	movzx  eax,WORD PTR [rip+0x2009cf3]        # 0x14238d56c
   140383879:	cmp    WORD PTR [rcx+0x98],ax
   140383880:	lea    rcx,[rbp+0x100]
   140383887:	jne    0x140383895
   140383889:	lea    rdx,[rip+0x12a26f0]        # 0x141625f80
   140383890:	jmp    0x140383d74
   140383895:	lea    rdx,[rip+0x12a26c4]        # 0x141625f60
   14038389c:	call   0x14006f4f0
   1403838a1:	lea    rcx,[rbp+0xe0]
   1403838a8:	call   0x14006f620
   1403838ad:	nop
   1403838ae:	mov    rdx,QWORD PTR [r14+0xd8]
   1403838b5:	test   rdx,rdx
   1403838b8:	je     0x14038391c
   1403838ba:	mov    ebx,0x19
   1403838bf:	mov    r9d,ebx
   1403838c2:	movzx  r8d,WORD PTR [rdx+0x12c]
   1403838ca:	movzx  edx,WORD PTR [rdx+0xa4]
   1403838d1:	lea    rcx,[rip+0x2163060]        # 0x1424e6938
   1403838d8:	call   0x14030aa60
   1403838dd:	test   al,al
   1403838df:	je     0x14038391c
   1403838e1:	mov    r8,QWORD PTR [r14+0xd8]
   1403838e8:	mov    BYTE PTR [rsp+0x30],0x0
   1403838ed:	mov    BYTE PTR [rsp+0x28],0x0
   1403838f2:	mov    WORD PTR [rsp+0x20],bx
   1403838f7:	movzx  r9d,WORD PTR [r8+0x12c]
   1403838ff:	movzx  r8d,WORD PTR [r8+0xa4]
   140383907:	lea    rdx,[rbp+0xe0]
   14038390e:	lea    rcx,[rip+0x2163023]        # 0x1424e6938
   140383915:	call   0x14030ab30
   14038391a:	jmp    0x14038392f
   14038391c:	lea    rdx,[rip+0x12a26c5]        # 0x141625fe8
   140383923:	lea    rcx,[rbp+0xe0]
   14038392a:	call   0x14006f4f0
   14038392f:	lea    rdx,[rbp+0xe0]
   140383936:	lea    rcx,[rbp+0x100]
   14038393d:	call   0x1400b9ca0
   140383942:	lea    rdx,[rip+0x12a268f]        # 0x141625fd8
   140383949:	lea    rcx,[rbp+0x100]
   140383950:	call   0x14006f4f0
   140383955:	lea    rcx,[rbp+0x120]
   14038395c:	call   0x14006f620
   140383961:	nop
   140383962:	mov    r9d,0xffffffff
   140383968:	mov    r8b,0x1
   14038396b:	lea    rdx,[rbp+0x120]
   140383972:	movzx  ecx,WORD PTR [rip+0x2009bf3]        # 0x14238d56c
   140383979:	call   0x140aa0c50
   14038397e:	lea    rdx,[rbp+0x120]
   140383985:	lea    rcx,[rbp+0x100]
   14038398c:	call   0x1400b9ca0
   140383991:	lea    rdx,[rip+0x12a26c0]        # 0x141626058
   140383998:	lea    rcx,[rbp+0x100]
   14038399f:	call   0x14006f4f0
   1403839a4:	nop
   1403839a5:	lea    rcx,[rbp+0x120]
   1403839ac:	call   0x140067dc0
   1403839b1:	nop
   1403839b2:	lea    rcx,[rbp+0xe0]
   1403839b9:	call   0x140067dc0
   1403839be:	jmp    0x140383d79
   1403839c3:	lea    rdx,[rip+0x12a2836]        # 0x141626200
   1403839ca:	lea    rcx,[rbp+0x100]
   1403839d1:	call   0x14006f4f0
   1403839d6:	lea    rdx,[rip+0x12a27f3]        # 0x1416261d0
   1403839dd:	jmp    0x140383d6d
   1403839e2:	mov    rcx,QWORD PTR [r14+0xc0]
   1403839e9:	movzx  ecx,WORD PTR [rcx+0xcf2]
   1403839f0:	call   0x14075a9f0
   1403839f5:	test   al,al
   1403839f7:	jne    0x140383a21
   1403839f9:	mov    rcx,QWORD PTR [r14+0xc0]
   140383a00:	movzx  eax,WORD PTR [rcx+0xcf2]
   140383a07:	sub    ax,0x5
   140383a0b:	cmp    ax,0x1
   140383a0f:	jbe    0x140383a21
   140383a11:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140383a18:	call   0x14075a9f0
   140383a1d:	test   al,al
   140383a1f:	je     0x140383a3c
   140383a21:	mov    rax,QWORD PTR [r14+0xb8]
   140383a28:	test   BYTE PTR [rax+0x20c0],0x80
   140383a2f:	lea    rdx,[rip+0x12a25ca]        # 0x141626000
   140383a36:	jne    0x140383d6d
   140383a3c:	lea    rdx,[rip+0x12a2675]        # 0x1416260b8
   140383a43:	jmp    0x140383d6d
   140383a48:	lea    rdx,[rip+0x12a2631]        # 0x141626080
   140383a4f:	jmp    0x140383d6d
   140383a54:	lea    rdx,[rip+0x12927b5]        # 0x141616210
   140383a5b:	jmp    0x140383d6d
   140383a60:	lea    rdx,[rip+0x12a22d9]        # 0x141625d40
   140383a67:	jmp    0x140383d6d
   140383a6c:	lea    rdx,[rip+0x12927cd]        # 0x141616240
   140383a73:	jmp    0x140383d6d
   140383a78:	lea    rdx,[rip+0x12a2279]        # 0x141625cf8
   140383a7f:	jmp    0x140383d6d
   140383a84:	lea    rdx,[rip+0x12927e5]        # 0x141616270
   140383a8b:	jmp    0x140383d6d
   140383a90:	lea    rdx,[rip+0x12a2369]        # 0x141625e00
   140383a97:	jmp    0x140383d6d
   140383a9c:	mov    rcx,QWORD PTR [r14+0xc0]
   140383aa3:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140383aaa:	call   0x14075a9f0
   140383aaf:	test   al,al
   140383ab1:	jne    0x140383ae6
   140383ab3:	mov    rcx,QWORD PTR [r14+0xc0]
   140383aba:	movzx  eax,WORD PTR [rcx+0xcf2]
   140383ac1:	sub    ax,0x5
   140383ac5:	cmp    ax,0x1
   140383ac9:	jbe    0x140383ae6
   140383acb:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140383ad2:	call   0x14075a9f0
   140383ad7:	test   al,al
   140383ad9:	lea    rdx,[rip+0x12a23c0]        # 0x141625ea0
   140383ae0:	je     0x140383d6d
   140383ae6:	lea    rdx,[rip+0x12a22a3]        # 0x141625d90
   140383aed:	jmp    0x140383d6d
   140383af2:	lea    rdx,[rip+0x12a236f]        # 0x141625e68
   140383af9:	lea    rcx,[rbp+0x100]
   140383b00:	call   0x14006f4f0
   140383b05:	lea    rdx,[rip+0x12a2434]        # 0x141625f40
   140383b0c:	jmp    0x140383d6d
   140383b11:	lea    rdx,[rip+0x12a23e8]        # 0x141625f00
   140383b18:	lea    rcx,[rbp+0x100]
   140383b1f:	call   0x14006f4f0
   140383b24:	lea    rdx,[rip+0x12a2095]        # 0x141625bc0
   140383b2b:	jmp    0x140383d6d
   140383b30:	lea    rdx,[rip+0x1292ce9]        # 0x141616820
   140383b37:	jmp    0x140383d6d
   140383b3c:	mov    rcx,QWORD PTR [r14+0xc0]
   140383b43:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140383b4a:	call   0x14075a9f0
   140383b4f:	test   al,al
   140383b51:	jne    0x140383b86
   140383b53:	mov    rcx,QWORD PTR [r14+0xc0]
   140383b5a:	movzx  eax,WORD PTR [rcx+0xcf2]
   140383b61:	sub    ax,0x5
   140383b65:	cmp    ax,0x1
   140383b69:	jbe    0x140383b86
   140383b6b:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140383b72:	call   0x14075a9f0
   140383b77:	test   al,al
   140383b79:	lea    rdx,[rip+0x12a2098]        # 0x141625c18
   140383b80:	je     0x140383d6d
   140383b86:	lea    rdx,[rip+0x12a201b]        # 0x141625ba8
   140383b8d:	jmp    0x140383d6d
   140383b92:	lea    rdx,[rip+0x12a2057]        # 0x141625bf0
   140383b99:	jmp    0x140383d6d
   140383b9e:	mov    rcx,QWORD PTR [r14+0xc0]
   140383ba5:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140383bac:	call   0x14075a9f0
   140383bb1:	test   al,al
   140383bb3:	jne    0x140383bfc
   140383bb5:	mov    rcx,QWORD PTR [r14+0xc0]
   140383bbc:	movzx  eax,WORD PTR [rcx+0xcf2]
   140383bc3:	sub    ax,0x5
   140383bc7:	cmp    ax,0x1
   140383bcb:	jbe    0x140383bfc
   140383bcd:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140383bd4:	call   0x14075a9f0
   140383bd9:	test   al,al
   140383bdb:	jne    0x140383bfc
   140383bdd:	lea    rdx,[rip+0x12a2064]        # 0x141625c48
   140383be4:	lea    rcx,[rbp+0x100]
   140383beb:	call   0x14006f4f0
   140383bf0:	lea    rdx,[rip+0x12a20c9]        # 0x141625cc0
   140383bf7:	jmp    0x140383d6d
   140383bfc:	lea    rdx,[rip+0x12a2075]        # 0x141625c78
   140383c03:	jmp    0x140383d6d
   140383c08:	mov    rcx,QWORD PTR [r14+0xc0]
   140383c0f:	movzx  ecx,WORD PTR [rcx+0xcf2]
   140383c16:	call   0x14075a9f0
   140383c1b:	test   al,al
   140383c1d:	jne    0x140383c66
   140383c1f:	mov    rcx,QWORD PTR [r14+0xc0]
   140383c26:	movzx  eax,WORD PTR [rcx+0xcf2]
   140383c2d:	sub    ax,0x5
   140383c31:	cmp    ax,0x1
   140383c35:	jbe    0x140383c66
   140383c37:	movzx  ecx,WORD PTR [rcx+0xcf4]
   140383c3e:	call   0x14075a9f0
   140383c43:	test   al,al
   140383c45:	jne    0x140383c66
   140383c47:	lea    rdx,[rip+0x12a2982]        # 0x1416265d0
   140383c4e:	lea    rcx,[rbp+0x100]
   140383c55:	call   0x14006f4f0
   140383c5a:	lea    rdx,[rip+0x12a291f]        # 0x141626580
   140383c61:	jmp    0x140383d6d
   140383c66:	lea    rdx,[rip+0x12a203b]        # 0x141625ca8
   140383c6d:	jmp    0x140383d6d
   140383c72:	lea    rdx,[rip+0x12a29b7]        # 0x141626630
   140383c79:	jmp    0x140383d6d
   140383c7e:	lea    rdx,[rip+0x12a2973]        # 0x1416265f8
   140383c85:	lea    rcx,[rbp+0x100]
   140383c8c:	call   0x14006f4f0
   140383c91:	lea    rdx,[rip+0x12a2a38]        # 0x1416266d0
   140383c98:	jmp    0x140383d6d
   140383c9d:	lea    rdx,[rip+0x12a29e4]        # 0x141626688
   140383ca4:	jmp    0x140383d6d
   140383ca9:	lea    rdx,[rip+0x12a2a80]        # 0x141626730
   140383cb0:	lea    rcx,[rbp+0x100]
   140383cb7:	call   0x14006f4f0
   140383cbc:	lea    rdx,[rip+0x12a2a55]        # 0x141626718
   140383cc3:	jmp    0x140383d6d
   140383cc8:	lea    rdx,[rip+0x12a2721]        # 0x1416263f0
   140383ccf:	jmp    0x140383d6d
   140383cd4:	mov    rcx,QWORD PTR [r14+0xc0]
   140383cdb:	mov    eax,DWORD PTR [rip+0x200987f]        # 0x14238d560
   140383ce1:	cmp    DWORD PTR [rcx+0x4],eax
   140383ce4:	je     0x140383cff
   140383ce6:	movzx  eax,WORD PTR [rip+0x200987f]        # 0x14238d56c
   140383ced:	cmp    WORD PTR [rcx+0x98],ax
   140383cf4:	je     0x140383cff
   140383cf6:	lea    rdx,[rip+0x1292a3b]        # 0x141616738
   140383cfd:	jmp    0x140383d6d
   140383cff:	lea    rdx,[rip+0x12a26ba]        # 0x1416263c0
   140383d06:	lea    rcx,[rbp+0x100]
   140383d0d:	call   0x14006f4f0
   140383d12:	lea    rdx,[rip+0x12a274f]        # 0x141626468
   140383d19:	jmp    0x140383d6d
   140383d1b:	lea    rdx,[rip+0x12a271e]        # 0x141626440
   140383d22:	lea    rcx,[rbp+0x100]
   140383d29:	call   0x14006f4f0
   140383d2e:	lea    rdx,[rip+0x12a279b]        # 0x1416264d0
   140383d35:	jmp    0x140383d6d
   140383d37:	lea    rdx,[rip+0x12a2762]        # 0x1416264a0
   140383d3e:	lea    rcx,[rbp+0x100]
   140383d45:	call   0x14006f4f0
   140383d4a:	lea    rdx,[rip+0x12a27ff]        # 0x141626550
   140383d51:	jmp    0x140383d6d
   140383d53:	lea    rdx,[rip+0x12a27c6]        # 0x141626520
   140383d5a:	lea    rcx,[rbp+0x100]
   140383d61:	call   0x14006f4f0
   140383d66:	lea    rdx,[rip+0x12a2573]        # 0x1416262e0
   140383d6d:	lea    rcx,[rbp+0x100]
   140383d74:	call   0x14006f4f0
   140383d79:	lea    rdx,[rip+0x126097c]        # 0x1415e46fc
   140383d80:	lea    rcx,[rbp+0x100]
   140383d87:	call   0x14006f4f0
   140383d8c:	mov    r8d,DWORD PTR [rbp+0x10]
   140383d90:	sub    r8d,r15d
   140383d93:	sub    r8d,0xf
   140383d97:	lea    rdx,[rbp+0x100]
   140383d9e:	lea    rcx,[rbp+0x140]
   140383da5:	call   0x1408e4b80
   140383daa:	xor    r8d,r8d
   140383dad:	mov    edx,0x6
   140383db2:	mov    r9b,0x1
   140383db5:	lea    rcx,[rip+0x22c0524]        # 0x1426442e0
   140383dbc:	call   0x1400bb0c0
   140383dc1:	lea    rcx,[rbp+0x140]
   140383dc8:	call   0x14006ede0
   140383dcd:	test   rax,rax
   140383dd0:	je     0x140383e2f
   140383dd2:	xor    ebx,ebx
   140383dd4:	nop    DWORD PTR [rax+0x0]
   140383dd8:	nop    DWORD PTR [rax+rax*1+0x0]
   140383de0:	lea    r8d,[r15+0xd]
   140383de4:	mov    edx,edi
   140383de6:	lea    rcx,[rip+0x22c04f3]        # 0x1426442e0
   140383ded:	call   0x1400bb0b0
   140383df2:	mov    rdx,rbx
   140383df5:	lea    rcx,[rbp+0x140]
   140383dfc:	call   0x14006f1b0
   140383e01:	xor    r9d,r9d
   140383e04:	xor    r8d,r8d
   140383e07:	mov    rdx,QWORD PTR [rax]
   140383e0a:	lea    rcx,[rip+0x22c04cf]        # 0x1426442e0
   140383e11:	call   0x140ad69a0
   140383e16:	inc    edi
   140383e18:	lea    eax,[rdi-0x7]
   140383e1b:	movsxd rbx,eax
   140383e1e:	lea    rcx,[rbp+0x140]
   140383e25:	call   0x14006ede0
   140383e2a:	cmp    rbx,rax
   140383e2d:	jb     0x140383de0
   140383e2f:	lea    rcx,[rbp+0x100]
   140383e36:	call   0x140067dc0
   140383e3b:	nop
   140383e3c:	lea    rcx,[rbp+0x140]
   140383e43:	call   0x1400bb920
   140383e48:	jmp    0x140383f81
   140383e4d:	call   0x14006ede0
   140383e52:	test   rax,rax
   140383e55:	je     0x140383f78
   140383e5b:	lea    r15d,[r13-0x1]
   140383e5f:	lea    edi,[r15-0x6]
   140383e63:	mov    ebx,DWORD PTR [rbx+0x3d8]
   140383e69:	mov    rcx,rsi
   140383e6c:	call   0x14006ede0
   140383e71:	cmp    ebx,eax
   140383e73:	jge    0x140383ef0
   140383e75:	mov    esi,0x7
   140383e7a:	sub    esi,ebx
   140383e7c:	mov    r15,QWORD PTR [rbp-0x80]
   140383e80:	mov    ecx,DWORD PTR [r15+0x3d8]
   140383e87:	add    ecx,edi
   140383e89:	cmp    ebx,ecx
   140383e8b:	jge    0x140383eec
   140383e8d:	xor    r8d,r8d
   140383e90:	mov    edx,0x6
   140383e95:	mov    r9b,0x1
   140383e98:	lea    rcx,[rip+0x22c0441]        # 0x1426442e0
   140383e9f:	call   0x1400bb0c0
   140383ea4:	lea    edx,[rbx+rsi*1]
   140383ea7:	mov    r8d,r14d
   140383eaa:	lea    rcx,[rip+0x22c042f]        # 0x1426442e0
   140383eb1:	call   0x1400bb0b0
   140383eb6:	lea    rcx,[r15+0x3c0]
   140383ebd:	movsxd rdx,ebx
   140383ec0:	call   0x14006f1b0
   140383ec5:	xor    r9d,r9d
   140383ec8:	xor    r8d,r8d
   140383ecb:	mov    rdx,QWORD PTR [rax]
   140383ece:	lea    rcx,[rip+0x22c040b]        # 0x1426442e0
   140383ed5:	call   0x140ad69a0
   140383eda:	inc    ebx
   140383edc:	lea    rcx,[r15+0x3c0]
   140383ee3:	call   0x14006ede0
   140383ee8:	cmp    ebx,eax
   140383eea:	jl     0x140383e80
   140383eec:	lea    r15d,[r13-0x1]
   140383ef0:	mov    r14,QWORD PTR [rbp-0x80]
   140383ef4:	lea    rcx,[r14+0x3c0]
   140383efb:	call   0x14006ede0
   140383f00:	cmp    eax,edi
   140383f02:	jle    0x140383f7d
   140383f04:	lea    rcx,[rbp+0xc0]
   140383f0b:	call   0x1400bb2f0
   140383f10:	lea    rcx,[r14+0x3c0]
   140383f17:	call   0x14006ede0
   140383f1c:	lea    r9d,[rax-0x1]
   140383f20:	mov    DWORD PTR [rsp+0x30],r15d
   140383f25:	mov    DWORD PTR [rsp+0x28],0x7
   140383f2d:	mov    DWORD PTR [rsp+0x20],edi
   140383f31:	xor    r8d,r8d
   140383f34:	mov    edx,DWORD PTR [r14+0x3d8]
   140383f3b:	lea    rcx,[rbp+0xc0]
   140383f42:	call   0x1400bb310
   140383f47:	mov    r15d,DWORD PTR [rbp-0x78]
   140383f4b:	lea    r9d,[r15+0x53]
   140383f4f:	mov    DWORD PTR [rsp+0x28],0x0
   140383f57:	movzx  eax,BYTE PTR [r14+0x3dc]
   140383f5f:	mov    BYTE PTR [rsp+0x20],al
   140383f63:	mov    r8d,DWORD PTR [rbp+0x18]
   140383f67:	mov    edx,DWORD PTR [rbp+0x14]
   140383f6a:	lea    rcx,[rbp+0xc0]
   140383f71:	call   0x14140a440
   140383f76:	jmp    0x140383f81
   140383f78:	mov    r14,rbx
   140383f7b:	jmp    0x140383f81
   140383f7d:	mov    r15d,DWORD PTR [rbp-0x78]
   140383f81:	test   r12b,r12b
   140383f84:	je     0x14038410b
   140383f8a:	lea    r8d,[r15+0xd]
   140383f8e:	mov    edx,r13d
   140383f91:	lea    rcx,[rip+0x22c0348]        # 0x1426442e0
   140383f98:	call   0x1400bb0b0
   140383f9d:	lea    rdx,[r14+0x48]
   140383fa1:	lea    rcx,[rbp+0x140]
   140383fa8:	call   0x14006f560
   140383fad:	nop
   140383fae:	mov    rax,QWORD PTR [r14+0xb8]
   140383fb5:	lea    rcx,[rbp+0x140]
   140383fbc:	cmp    DWORD PTR [rax+0x2118],0x14
   140383fc3:	lea    rdx,[rip+0x126e156]        # 0x1415f2120
   140383fca:	jl     0x140383fd3
   140383fcc:	lea    rdx,[rip+0x12a2305]        # 0x1416262d8
   140383fd3:	call   0x14006f4f0
   140383fd8:	mov    rax,QWORD PTR [r14+0xb8]
   140383fdf:	mov    ecx,DWORD PTR [rax+0x2118]
   140383fe5:	xor    r8d,r8d
   140383fe8:	cmp    ecx,0x64
   140383feb:	jl     0x14038400d
   140383fed:	mov    edx,0x2
   140383ff2:	mov    r9b,0x1
   140383ff5:	lea    rcx,[rip+0x22c02e4]        # 0x1426442e0
   140383ffc:	call   0x1400bb0c0
   140384001:	lea    rdx,[rip+0x12a2318]        # 0x141626320
   140384008:	jmp    0x1403840c5
   14038400d:	cmp    ecx,0x50
   140384010:	jl     0x140384032
   140384012:	mov    edx,0x3
   140384017:	mov    r9b,0x1
   14038401a:	lea    rcx,[rip+0x22c02bf]        # 0x1426442e0
   140384021:	call   0x1400bb0c0
   140384026:	lea    rdx,[rip+0x12a22d3]        # 0x141626300
   14038402d:	jmp    0x1403840c5
   140384032:	cmp    ecx,0x3c
   140384035:	jl     0x140384055
   140384037:	mov    edx,0x1
   14038403c:	movzx  r9d,dl
   140384040:	lea    rcx,[rip+0x22c0299]        # 0x1426442e0
   140384047:	call   0x1400bb0c0
   14038404c:	lea    rdx,[rip+0x12a2305]        # 0x141626358
   140384053:	jmp    0x1403840c5
   140384055:	mov    r9b,0x1
   140384058:	cmp    ecx,0x28
   14038405b:	jl     0x140384077
   14038405d:	mov    edx,0x7
   140384062:	lea    rcx,[rip+0x22c0277]        # 0x1426442e0
   140384069:	call   0x1400bb0c0
   14038406e:	lea    rdx,[rip+0x12a22cb]        # 0x141626340
   140384075:	jmp    0x1403840c5
   140384077:	cmp    ecx,0x14
   14038407a:	jl     0x140384096
   14038407c:	mov    edx,0x6
   140384081:	lea    rcx,[rip+0x22c0258]        # 0x1426442e0
   140384088:	call   0x1400bb0c0
   14038408d:	lea    rdx,[rip+0x12a230c]        # 0x1416263a0
   140384094:	jmp    0x1403840c5
   140384096:	test   ecx,ecx
   140384098:	lea    rcx,[rip+0x22c0241]        # 0x1426442e0
   14038409f:	jle    0x1403840b4
   1403840a1:	mov    edx,0x4
   1403840a6:	call   0x1400bb0c0
   1403840ab:	lea    rdx,[rip+0x12a22c6]        # 0x141626378
   1403840b2:	jmp    0x1403840c5
   1403840b4:	mov    edx,0x5
   1403840b9:	call   0x1400bb0c0
   1403840be:	lea    rdx,[rip+0x12a2183]        # 0x141626248
   1403840c5:	lea    rcx,[rbp+0x140]
   1403840cc:	call   0x14006f4f0
   1403840d1:	lea    rdx,[rip+0x125f49c]        # 0x1415e3574
   1403840d8:	lea    rcx,[rbp+0x140]
   1403840df:	call   0x14006f4f0
   1403840e4:	xor    r9d,r9d
   1403840e7:	xor    r8d,r8d
   1403840ea:	lea    rdx,[rbp+0x140]
   1403840f1:	lea    rcx,[rip+0x22c01e8]        # 0x1426442e0
   1403840f8:	call   0x140ad69a0
   1403840fd:	nop
   1403840fe:	lea    rcx,[rbp+0x140]
   140384105:	call   0x140067dc0
   14038410a:	nop
   14038410b:	lea    rcx,[rbp+0x160]
   140384112:	call   0x140067dc0
   140384117:	xor    eax,eax
   140384119:	mov    ecx,eax
   14038411b:	mov    DWORD PTR [rbp-0x30],eax
   14038411e:	mov    esi,eax
   140384120:	mov    QWORD PTR [rbp+0x38],rax
   140384124:	mov    r13d,DWORD PTR [rbp-0x70]
   140384128:	lea    r15d,[r13+0x1]
   14038412c:	mov    DWORD PTR [rbp+0x74],r15d
   140384130:	mov    QWORD PTR [rbp+0x0],0x5c
   140384138:	test   ecx,ecx
   14038413a:	jne    0x1403841c3
   140384140:	mov    ebx,DWORD PTR [rbp-0x48]
   140384143:	add    ebx,0xfffffffe
   140384146:	mov    r12d,DWORD PTR [rbp-0x78]
   14038414a:	add    r12d,0x2
   14038414e:	mov    DWORD PTR [rbp-0x68],r12d
   140384152:	mov    DWORD PTR [rbp-0x74],r12d
   140384156:	mov    DWORD PTR [rbp-0x64],r12d
   14038415a:	mov    eax,DWORD PTR [r14+rsi*4+0x170]
   140384162:	lea    r15d,[rbx-0x2]
   140384166:	cmp    eax,DWORD PTR [rbp+0x30]
   140384169:	cmovle r15d,ebx
   14038416d:	mov    DWORD PTR [rbp-0x6c],r15d
   140384171:	mov    esi,0x2
   140384176:	mov    eax,0x0
   14038417b:	cmovle esi,eax
   14038417e:	add    esi,r15d
   140384181:	mov    r14d,r13d
   140384184:	lea    rdi,[rip+0x22c1c89]        # 0x142645e14
   14038418b:	lea    rax,[rip+0x22c1c8e]        # 0x142645e20
   140384192:	mov    ebx,r12d
   140384195:	cmp    r12d,esi
   140384198:	jg     0x140384d36
   14038419e:	xchg   ax,ax
   1403841a0:	mov    r8d,ebx
   1403841a3:	mov    edx,r14d
   1403841a6:	lea    rcx,[rip+0x22c0133]        # 0x1426442e0
   1403841ad:	call   0x1400bb0b0
   1403841b2:	cmp    ebx,r12d
   1403841b5:	jne    0x140384cc7
   1403841bb:	mov    edx,DWORD PTR [rdi-0x18]
   1403841be:	jmp    0x140384cf6
   1403841c3:	mov    r12d,DWORD PTR [rbp-0x48]
   1403841c7:	add    r12d,0x2
   1403841cb:	mov    DWORD PTR [rbp-0x68],r12d
   1403841cf:	mov    DWORD PTR [rbp-0x74],r12d
   1403841d3:	mov    DWORD PTR [rbp-0x64],r12d
   1403841d7:	mov    edx,DWORD PTR [rbp+0x10]
   1403841da:	lea    ebx,[rdx-0x2]
   1403841dd:	cmp    ecx,0x1
   1403841e0:	jne    0x14038415a
   1403841e6:	lea    ebx,[rdx-0x2]
   1403841e9:	lea    rcx,[r14+0x380]
   1403841f0:	call   0x14006ede0
   1403841f5:	test   rax,rax
   1403841f8:	je     0x14038415a
   1403841fe:	mov    ebx,DWORD PTR [rbp+0x10]
   140384201:	lea    r12d,[rbx-0x2]
   140384205:	mov    DWORD PTR [rsp+0x74],r12d
   14038420a:	lea    rcx,[r14+0x380]
   140384211:	call   0x14006ede0
   140384216:	lea    ecx,[rax+rax*2]
   140384219:	cmp    ecx,DWORD PTR [rbp+0x30]
   14038421c:	jle    0x140384227
   14038421e:	lea    r12d,[rbx-0x4]
   140384222:	mov    DWORD PTR [rsp+0x74],r12d
   140384227:	xor    r8d,r8d
   14038422a:	mov    edx,0x7
   14038422f:	mov    r9b,0x1
   140384232:	lea    rcx,[rip+0x22c00a7]        # 0x1426442e0
   140384239:	call   0x1400bb0c0
   14038423e:	mov    r8d,DWORD PTR [rbp-0x68]
   140384242:	mov    edx,r13d
   140384245:	lea    rcx,[rip+0x22c0094]        # 0x1426442e0
   14038424c:	call   0x1400bb0b0
   140384251:	lea    rdx,[rip+0x12a1fd0]        # 0x141626228
   140384258:	lea    rcx,[rbp+0xc0]
   14038425f:	call   0x1400680e0
   140384264:	nop
   140384265:	xor    r9d,r9d
   140384268:	xor    r8d,r8d
   14038426b:	lea    rdx,[rbp+0xc0]
   140384272:	lea    rcx,[rip+0x22c0067]        # 0x1426442e0
   140384279:	call   0x140ad69a0
   14038427e:	nop
   14038427f:	lea    rcx,[rbp+0xc0]
   140384286:	call   0x140067dc0
   14038428b:	mov    r8d,DWORD PTR [rbp-0x68]
   14038428f:	mov    edx,r15d
   140384292:	lea    rcx,[rip+0x22c0047]        # 0x1426442e0
   140384299:	call   0x1400bb0b0
   14038429e:	lea    rdx,[rip+0x12a1fcb]        # 0x141626270
   1403842a5:	lea    rcx,[rbp+0xc0]
   1403842ac:	call   0x1400680e0
   1403842b1:	nop
   1403842b2:	xor    r9d,r9d
   1403842b5:	xor    r8d,r8d
   1403842b8:	lea    rdx,[rbp+0xc0]
   1403842bf:	lea    rcx,[rip+0x22c001a]        # 0x1426442e0
   1403842c6:	call   0x140ad69a0
   1403842cb:	nop
   1403842cc:	lea    rcx,[rbp+0xc0]
   1403842d3:	call   0x140067dc0
   1403842d8:	lea    r15d,[r12-0x8]
   1403842dd:	lea    r14d,[r12-0x1]
   1403842e2:	mov    edi,r15d
   1403842e5:	cmp    r15d,r14d
   1403842e8:	jg     0x14038434a
   1403842ea:	lea    r12,[rip+0x22ca817]        # 0x14264eb08
   1403842f1:	mov    esi,r13d
   1403842f4:	lea    rbx,[rip+0x22ca801]        # 0x14264eafc
   1403842fb:	nop    DWORD PTR [rax+rax*1+0x0]
   140384300:	mov    r8d,edi
   140384303:	mov    edx,esi
   140384305:	lea    rcx,[rip+0x22bffd4]        # 0x1426442e0
   14038430c:	call   0x1400bb0b0
   140384311:	cmp    edi,r15d
   140384314:	jne    0x14038431b
   140384316:	mov    edx,DWORD PTR [rbx-0x18]
   140384319:	jmp    0x140384327
   14038431b:	cmp    edi,r14d
   14038431e:	jne    0x140384324
   140384320:	mov    edx,DWORD PTR [rbx]
   140384322:	jmp    0x140384327
   140384324:	mov    edx,DWORD PTR [rbx-0xc]
   140384327:	lea    rcx,[rip+0x22bffb2]        # 0x1426442e0
   14038432e:	call   0x140ad7b10
   140384333:	inc    esi
   140384335:	add    rbx,0x4
   140384339:	cmp    rbx,r12
   14038433c:	jl     0x140384300
   14038433e:	inc    edi
   140384340:	cmp    edi,r14d
   140384343:	jle    0x1403842f1
   140384345:	mov    r12d,DWORD PTR [rsp+0x74]
   14038434a:	xor    r8d,r8d
   14038434d:	mov    edx,0x7
   140384352:	mov    r9b,0x1
   140384355:	lea    rcx,[rip+0x22bff84]        # 0x1426442e0
   14038435c:	call   0x1400bb0c0
   140384361:	lea    r8d,[r15+0x2]
   140384365:	lea    edx,[r13+0x1]
   140384369:	lea    rcx,[rip+0x22bff70]        # 0x1426442e0
   140384370:	call   0x1400bb0b0
   140384375:	lea    rdx,[rip+0x1265994]        # 0x1415e9d10
   14038437c:	lea    rcx,[rbp+0xc0]
   140384383:	call   0x1400680e0
   140384388:	nop
   140384389:	xor    r9d,r9d
   14038438c:	xor    r8d,r8d
   14038438f:	lea    rdx,[rbp+0xc0]
   140384396:	lea    rcx,[rip+0x22bff43]        # 0x1426442e0
   14038439d:	call   0x140ad69a0
   1403843a2:	nop
   1403843a3:	lea    rcx,[rbp+0xc0]
   1403843aa:	call   0x140067dc0
   1403843af:	mov    rbx,QWORD PTR [rbp-0x80]
   1403843b3:	sub    r13d,DWORD PTR [rbx+0x398]
   1403843ba:	add    r13d,0x3
   1403843be:	mov    DWORD PTR [rbp-0x64],r13d
   1403843c2:	mov    edi,DWORD PTR [rbp-0x70]
   1403843c5:	mov    ecx,DWORD PTR [rbp+0x40]
   1403843c8:	lea    esi,[rdi+rcx*2]
   1403843cb:	dec    ecx
   1403843cd:	add    esi,ecx
   1403843cf:	mov    DWORD PTR [rbp-0x5c],esi
   1403843d2:	lea    rcx,[rbx+0x380]
   1403843d9:	lea    rdx,[rbp+0x20]
   1403843dd:	call   0x14006f1d0
   1403843e2:	lea    rcx,[rbx+0x380]
   1403843e9:	lea    rdx,[rbp+0x90]
   1403843f0:	call   0x14006f1c0
   1403843f5:	movsxd rbx,r13d
   1403843f8:	mov    QWORD PTR [rbp-0x38],rbx
   1403843fc:	mov    rax,QWORD PTR [rbp+0x20]
   140384400:	cmp    rax,QWORD PTR [rbp+0x90]
   140384407:	je     0x140384b9f
   14038440d:	mov    edx,0x1
   140384412:	mov    ecx,0xff
   140384417:	cmovb  edx,ecx
   14038441a:	test   dl,dl
   14038441c:	jns    0x140384b9f
   140384422:	lea    ecx,[rdi+0x3]
   140384425:	cmp    r13d,ecx
   140384428:	jl     0x140384432
   14038442a:	movsxd rdx,esi
   14038442d:	cmp    rbx,rdx
   140384430:	jle    0x140384452
   140384432:	lea    edx,[r13+0x1]
   140384436:	cmp    edx,ecx
   140384438:	jl     0x14038443e
   14038443a:	cmp    edx,esi
   14038443c:	jle    0x140384452
   14038443e:	lea    edx,[r13+0x2]
   140384442:	cmp    edx,ecx
   140384444:	jl     0x140384b7a
   14038444a:	cmp    edx,esi
   14038444c:	jg     0x140384b7a
   140384452:	lea    rcx,[rbp+0x20]
   140384456:	call   0x14006eda0
   14038445b:	mov    r14,QWORD PTR [rax]
   14038445e:	mov    QWORD PTR [rbp+0x8],r14
   140384462:	xor    r8d,r8d
   140384465:	mov    edx,0x7
   14038446a:	mov    r9b,0x1
   14038446d:	lea    rcx,[rip+0x22bfe6c]        # 0x1426442e0
   140384474:	call   0x1400bb0c0
   140384479:	mov    r15d,DWORD PTR [rbp-0x74]
   14038447d:	mov    edi,r15d
   140384480:	mov    eax,DWORD PTR [rsp+0x74]
   140384484:	cmp    r15d,eax
   140384487:	jg     0x140384595
   14038448d:	lea    r15d,[r13+0x3]
   140384491:	mov    r12d,DWORD PTR [rbp-0x70]
   140384495:	add    r12d,0x3
   140384499:	nop    DWORD PTR [rax+0x0]
   1403844a0:	mov    esi,r13d
   1403844a3:	mov    r14,rbx
   1403844a6:	cmp    r13d,r15d
   1403844a9:	jge    0x140384580
   1403844af:	lea    rbx,[rip+0x22c19d6]        # 0x142645e8c
   1403844b6:	mov    r13d,DWORD PTR [rsp+0x74]
   1403844bb:	nop    DWORD PTR [rax+rax*1+0x0]
   1403844c0:	cmp    esi,r12d
   1403844c3:	jl     0x140384562
   1403844c9:	movsxd rcx,DWORD PTR [rbp-0x5c]
   1403844cd:	cmp    r14,rcx
   1403844d0:	jg     0x140384562
   1403844d6:	mov    r8d,edi
   1403844d9:	mov    edx,esi
   1403844db:	lea    rcx,[rip+0x22bfdfe]        # 0x1426442e0
   1403844e2:	call   0x1400bb0b0
   1403844e7:	mov    ecx,DWORD PTR [rbp-0x68]
   1403844ea:	cmp    edi,ecx
   1403844ec:	jne    0x1403844f3
   1403844ee:	mov    edx,DWORD PTR [rbx-0xc]
   1403844f1:	jmp    0x140384533
   1403844f3:	lea    eax,[rcx+0x1]
   1403844f6:	cmp    edi,eax
   1403844f8:	jne    0x1403844fe
   1403844fa:	mov    edx,DWORD PTR [rbx]
   1403844fc:	jmp    0x140384533
   1403844fe:	lea    eax,[rcx+0x2]
   140384501:	cmp    edi,eax
   140384503:	jne    0x140384509
   140384505:	mov    edx,DWORD PTR [rbx]
   140384507:	jmp    0x140384533
   140384509:	lea    eax,[rcx+0x3]
   14038450c:	cmp    edi,eax
   14038450e:	jne    0x140384514
   140384510:	mov    edx,DWORD PTR [rbx]
   140384512:	jmp    0x140384533
   140384514:	lea    eax,[rcx+0x4]
   140384517:	cmp    edi,eax
   140384519:	jne    0x140384520
   14038451b:	mov    edx,DWORD PTR [rbx+0xc]
   14038451e:	jmp    0x140384533
   140384520:	cmp    edi,r13d
   140384523:	jne    0x14038452d
   140384525:	mov    edx,DWORD PTR [rbx-0x1ec]
   14038452b:	jmp    0x140384533
   14038452d:	mov    edx,DWORD PTR [rbx-0x1f8]
   140384533:	lea    rcx,[rip+0x22bfda6]        # 0x1426442e0
   14038453a:	call   0x140ad7b10
   14038453f:	xor    edx,edx
   140384541:	lea    rcx,[rip+0x2043118]        # 0x1423c7660
   140384548:	call   0x140071f20
   14038454d:	test   al,al
   14038454f:	je     0x140384562
   140384551:	mov    r8b,0x1
   140384554:	xor    edx,edx
   140384556:	lea    rcx,[rip+0x22bfd83]        # 0x1426442e0
   14038455d:	call   0x1400bb120
   140384562:	inc    esi
   140384564:	inc    r14
   140384567:	add    rbx,0x4
   14038456b:	cmp    esi,r15d
   14038456e:	jl     0x1403844c0
   140384574:	mov    r13d,DWORD PTR [rbp-0x64]
   140384578:	mov    eax,DWORD PTR [rsp+0x74]
   14038457c:	mov    rbx,QWORD PTR [rbp-0x38]
   140384580:	inc    edi
   140384582:	cmp    edi,eax
   140384584:	jle    0x1403844a0
   14038458a:	mov    r14,QWORD PTR [rbp+0x8]
   14038458e:	mov    esi,DWORD PTR [rbp-0x5c]
   140384591:	mov    r15d,DWORD PTR [rbp-0x74]
   140384595:	mov    edi,DWORD PTR [rbp-0x70]
   140384598:	lea    eax,[rdi+0x3]
   14038459b:	cmp    r13d,eax
   14038459e:	jl     0x14038464a
   1403845a4:	lea    eax,[rsi-0x2]
   1403845a7:	cmp    r13d,eax
   1403845aa:	jg     0x14038464a
   1403845b0:	xor    edx,edx
   1403845b2:	lea    rcx,[rip+0x20430a7]        # 0x1423c7660
   1403845b9:	call   0x140071f20
   1403845be:	lea    rcx,[rip+0x22bfd1b]        # 0x1426442e0
   1403845c5:	test   al,al
   1403845c7:	je     0x140384611
   1403845c9:	mov    r8d,r15d
   1403845cc:	mov    edx,r13d
   1403845cf:	call   0x1400bb0b0
   1403845d4:	mov    edx,DWORD PTR [rbp-0x60]
   1403845d7:	mov    rcx,r14
   1403845da:	call   0x140c79c00
   1403845df:	test   eax,eax
   1403845e1:	je     0x14038464a
   1403845e3:	mov    BYTE PTR [rsp+0x30],0x0
   1403845e8:	mov    DWORD PTR [rsp+0x28],0x3
   1403845f0:	mov    DWORD PTR [rsp+0x20],0x5
   1403845f8:	mov    r9d,0x2
   1403845fe:	mov    r8d,r9d
   140384601:	mov    edx,eax
   140384603:	lea    rcx,[rip+0x22bfcd6]        # 0x1426442e0
   14038460a:	call   0x140ad7db0
   14038460f:	jmp    0x14038464a
   140384611:	lea    r8d,[r15+0x2]
   140384615:	lea    edx,[r13+0x1]
   140384619:	call   0x1400bb0b0
   14038461e:	mov    rax,QWORD PTR [r14]
   140384621:	xor    edx,edx
   140384623:	mov    rcx,r14
   140384626:	call   QWORD PTR [rax+0x370]
   14038462c:	mov    rax,QWORD PTR [r14]
   14038462f:	mov    rcx,r14
   140384632:	call   QWORD PTR [rax+0x640]
   140384638:	movzx  edx,al
   14038463b:	mov    r8b,0x1
   14038463e:	lea    rcx,[rip+0x22bfc9b]        # 0x1426442e0
   140384645:	call   0x1400bb120
   14038464a:	lea    ecx,[rdi+0x3]
   14038464d:	lea    eax,[r13+0x1]
   140384651:	cmp    eax,ecx
   140384653:	jl     0x14038483d
   140384659:	cmp    r13d,esi
   14038465c:	jge    0x14038483d
   140384662:	xor    sil,sil
   140384665:	xor    dil,dil
   140384668:	xor    r12b,r12b
   14038466b:	xor    ecx,ecx
   14038466d:	mov    r15d,ecx
   140384670:	lea    rbx,[r14+0x38]
   140384674:	mov    rax,QWORD PTR [rbx+0x8]
   140384678:	sub    rax,QWORD PTR [rbx]
   14038467b:	sar    rax,0x3
   14038467f:	test   rax,rax
   140384682:	je     0x1403846ec
   140384684:	mov    r14d,ecx
   140384687:	mov    r13d,0x1
   14038468d:	nop    DWORD PTR [rax]
   140384690:	mov    rdx,r14
   140384693:	mov    rcx,rbx
   140384696:	call   0x14006f1b0
   14038469b:	mov    rcx,QWORD PTR [rax]
   14038469e:	mov    rax,QWORD PTR [rcx]
   1403846a1:	call   QWORD PTR [rax+0x10]
   1403846a4:	movzx  edi,dil
   1403846a8:	cmp    eax,0x2c
   1403846ab:	cmove  edi,r13d
   1403846af:	mov    rdx,r14
   1403846b2:	mov    rcx,rbx
   1403846b5:	call   0x14006f1b0
   1403846ba:	mov    rcx,QWORD PTR [rax]
   1403846bd:	mov    rax,QWORD PTR [rcx]
   1403846c0:	call   QWORD PTR [rax+0x10]
   1403846c3:	movzx  esi,sil
   1403846c7:	cmp    eax,0x2b
   1403846ca:	cmove  esi,r13d
   1403846ce:	inc    r15d
   1403846d1:	movsxd r14,r15d
   1403846d4:	mov    rax,QWORD PTR [rbx+0x8]
   1403846d8:	sub    rax,QWORD PTR [rbx]
   1403846db:	sar    rax,0x3
   1403846df:	cmp    r14,rax
   1403846e2:	jb     0x140384690
   1403846e4:	mov    r13d,DWORD PTR [rbp-0x64]
   1403846e8:	mov    r14,QWORD PTR [rbp+0x8]
   1403846ec:	cmp    QWORD PTR [rbp+0x38],0x1
   1403846f1:	jne    0x14038470a
   1403846f3:	mov    rcx,r14
   1403846f6:	call   0x140caf250
   1403846fb:	movzx  r12d,r12b
   1403846ff:	test   al,al
   140384701:	mov    eax,0x1
   140384706:	cmovne r12d,eax
   14038470a:	test   dil,dil
   14038470d:	je     0x140384716
   14038470f:	mov    edx,0x2
   140384714:	jmp    0x140384742
   140384716:	test   sil,sil
   140384719:	je     0x140384722
   14038471b:	mov    edx,0x4
   140384720:	jmp    0x140384742
   140384722:	test   r12b,r12b
   140384725:	je     0x14038472e
   140384727:	mov    edx,0x5
   14038472c:	jmp    0x140384742
   14038472e:	test   DWORD PTR [r14+0x10],0x4000
   140384736:	mov    edx,0x7
   14038473b:	jne    0x140384742
   14038473d:	mov    edx,0x6
   140384742:	mov    r9b,0x1
   140384745:	xor    r8d,r8d
   140384748:	lea    rcx,[rip+0x22bfb91]        # 0x1426442e0
   14038474f:	call   0x1400bb0c0
   140384754:	mov    r15d,DWORD PTR [rbp-0x74]
   140384758:	lea    r8d,[r15+0x7]
   14038475c:	lea    edx,[r13+0x1]
   140384760:	lea    rcx,[rip+0x22bfb79]        # 0x1426442e0
   140384767:	call   0x1400bb0b0
   14038476c:	lea    rcx,[rbp+0xe0]
   140384773:	call   0x14006f620
   140384778:	nop
   140384779:	mov    r9d,0xffffffff
   14038477f:	xor    r8d,r8d
   140384782:	lea    rdx,[rbp+0xe0]
   140384789:	mov    rcx,r14
   14038478c:	call   0x140c62490
   140384791:	mov    r12d,DWORD PTR [rsp+0x74]
   140384796:	mov    ebx,r12d
   140384799:	sub    ebx,r15d
   14038479c:	lea    rcx,[rbp+0xe0]
   1403847a3:	call   0x14006f2c0
   1403847a8:	lea    ecx,[rbx-0x16]
   1403847ab:	movsxd rdx,ecx
   1403847ae:	cmp    rax,rdx
   1403847b1:	jb     0x140384812
   1403847b3:	lea    esi,[rbx-0x17]
   1403847b6:	movsxd rdi,ebx
   1403847b9:	test   esi,esi
   1403847bb:	js     0x1403847d0
   1403847bd:	lea    rdx,[rdi-0x17]
   1403847c1:	xor    r8d,r8d
   1403847c4:	lea    rcx,[rbp+0xe0]
   1403847cb:	call   0x1400e11c0
   1403847d0:	cmp    esi,0x3
   1403847d3:	jle    0x140384812
   1403847d5:	lea    rdx,[rdi-0x1a]
   1403847d9:	lea    rcx,[rbp+0xe0]
   1403847e0:	call   0x1400fb4d0
   1403847e5:	mov    BYTE PTR [rax],0x2e
   1403847e8:	lea    eax,[rbx-0x19]
   1403847eb:	movsxd rdx,eax
   1403847ee:	lea    rcx,[rbp+0xe0]
   1403847f5:	call   0x1400fb4d0
   1403847fa:	mov    BYTE PTR [rax],0x2e
   1403847fd:	lea    eax,[rbx-0x18]
   140384800:	movsxd rdx,eax
   140384803:	lea    rcx,[rbp+0xe0]
   14038480a:	call   0x1400fb4d0
   14038480f:	mov    BYTE PTR [rax],0x2e
   140384812:	xor    r9d,r9d
   140384815:	xor    r8d,r8d
   140384818:	lea    rdx,[rbp+0xe0]
   14038481f:	lea    rcx,[rip+0x22bfaba]        # 0x1426442e0
   140384826:	call   0x140ad69a0
   14038482b:	nop
   14038482c:	lea    rcx,[rbp+0xe0]
   140384833:	call   0x140067dc0
   140384838:	mov    edi,DWORD PTR [rbp-0x70]
   14038483b:	jmp    0x140384842
   14038483d:	mov    r12d,DWORD PTR [rsp+0x74]
   140384842:	lea    ecx,[r13+0x2]
   140384846:	lea    eax,[rdi+0x3]
   140384849:	mov    esi,DWORD PTR [rbp-0x5c]
   14038484c:	cmp    ecx,eax
   14038484e:	jl     0x140384994
   140384854:	cmp    ecx,esi
   140384856:	jg     0x140384994
   14038485c:	xor    edi,edi
   14038485e:	test   BYTE PTR [r14+0x10],0x40
   140384863:	je     0x140384994
   140384869:	lea    rdx,[rbp+0x68]
   14038486d:	lea    rcx,[r14+0x38]
   140384871:	call   0x14006f1d0
   140384876:	lea    rdx,[rbp+0x98]
   14038487d:	lea    rcx,[r14+0x38]
   140384881:	call   0x14006f1c0
   140384886:	mov    r12d,0x1
   14038488c:	mov    r14d,0xff
   140384892:	mov    rax,QWORD PTR [rbp+0x68]
   140384896:	cmp    rax,QWORD PTR [rbp+0x98]
   14038489d:	je     0x1403848e5
   14038489f:	mov    edx,r12d
   1403848a2:	cmovb  edx,r14d
   1403848a6:	test   dl,dl
   1403848a8:	jns    0x1403848e5
   1403848aa:	lea    rcx,[rbp+0x68]
   1403848ae:	call   0x14006eda0
   1403848b3:	mov    rcx,QWORD PTR [rax]
   1403848b6:	mov    rax,QWORD PTR [rcx]
   1403848b9:	call   QWORD PTR [rax+0x10]
   1403848bc:	cmp    eax,0xa
   1403848bf:	jne    0x1403848da
   1403848c1:	lea    rcx,[rbp+0x68]
   1403848c5:	call   0x14006eda0
   1403848ca:	mov    rcx,QWORD PTR [rax]
   1403848cd:	mov    rax,QWORD PTR [rcx]
   1403848d0:	call   QWORD PTR [rax+0x18]
   1403848d3:	test   rax,rax
   1403848d6:	je     0x1403848da
   1403848d8:	inc    edi
   1403848da:	lea    rcx,[rbp+0x68]
   1403848de:	call   0x14006ed90
   1403848e3:	jmp    0x140384892
   1403848e5:	test   edi,edi
   1403848e7:	mov    r12d,DWORD PTR [rsp+0x74]
   1403848ec:	mov    r14,QWORD PTR [rbp+0x8]
   1403848f0:	jle    0x140384994
   1403848f6:	lea    r8d,[r15+0x7]
   1403848fa:	lea    edx,[r13+0x2]
   1403848fe:	lea    rcx,[rip+0x22bf9db]        # 0x1426442e0
   140384905:	call   0x1400bb0b0
   14038490a:	lea    rdx,[rip+0x1291fe7]        # 0x1416168f8
   140384911:	lea    rcx,[rbp+0xe0]
   140384918:	call   0x1400680e0
   14038491d:	nop
   14038491e:	lea    rdx,[rbp+0xe0]
   140384925:	mov    ecx,edi
   140384927:	call   0x140529cf0
   14038492c:	lea    rdx,[rip+0x126d8d1]        # 0x1415f2204
   140384933:	lea    rcx,[rbp+0xe0]
   14038493a:	call   0x14006f4f0
   14038493f:	cmp    edi,0x1
   140384942:	je     0x140384957
   140384944:	lea    rdx,[rip+0x125f8d5]        # 0x1415e4220
   14038494b:	lea    rcx,[rbp+0xe0]
   140384952:	call   0x14006f4f0
   140384957:	xor    r8d,r8d
   14038495a:	mov    edx,0x6
   14038495f:	mov    r9b,0x1
   140384962:	lea    rcx,[rip+0x22bf977]        # 0x1426442e0
   140384969:	call   0x1400bb0c0
   14038496e:	xor    r9d,r9d
   140384971:	xor    r8d,r8d
   140384974:	lea    rdx,[rbp+0xe0]
   14038497b:	lea    rcx,[rip+0x22bf95e]        # 0x1426442e0
   140384982:	call   0x140ad69a0
   140384987:	nop
   140384988:	lea    rcx,[rbp+0xe0]
   14038498f:	call   0x140067dc0
   140384994:	lea    edi,[r13+0x1]
   140384998:	mov    ecx,DWORD PTR [rbp-0x70]
   14038499b:	add    ecx,0x3
   14038499e:	lea    eax,[r13+0x1]
   1403849a2:	cmp    eax,ecx
   1403849a4:	jl     0x140384ab9
   1403849aa:	cmp    r13d,esi
   1403849ad:	jge    0x140384ac7
   1403849b3:	lea    rcx,[rip+0x20067d6]        # 0x14238b190
   1403849ba:	call   0x140e5f4d0
   1403849bf:	mov    ebx,eax
   1403849c1:	mov    r15,QWORD PTR [rbp-0x80]
   1403849c5:	mov    rcx,QWORD PTR [r15+0xd8]
   1403849cc:	test   rcx,rcx
   1403849cf:	je     0x1403849e4
   1403849d1:	mov    edx,0x49
   1403849d6:	call   0x141339710
   1403849db:	xor    ebx,ebx
   1403849dd:	test   eax,eax
   1403849df:	cmovns ebx,eax
   1403849e2:	inc    ebx
   1403849e4:	test   ebx,ebx
   1403849e6:	jle    0x140384ac7
   1403849ec:	lea    edi,[r13+0x2]
   1403849f0:	lea    r8d,[r12-0x19]
   1403849f5:	lea    edx,[r13+0x1]
   1403849f9:	lea    rcx,[rip+0x22bf8e0]        # 0x1426442e0
   140384a00:	call   0x1400bb0b0
   140384a05:	lea    rcx,[rbp+0xe0]
   140384a0c:	call   0x14006f620
   140384a11:	nop
   140384a12:	mov    BYTE PTR [rsp+0x20],0x1
   140384a17:	xor    r9d,r9d
   140384a1a:	mov    r8,QWORD PTR [r15+0xc0]
   140384a21:	mov    rdx,QWORD PTR [r15+0xb8]
   140384a28:	mov    rcx,r14
   140384a2b:	call   0x140c63060
   140384a30:	mov    edx,eax
   140384a32:	lea    r8d,[rbx-0x1]
   140384a36:	lea    rcx,[rbp+0xe0]
   140384a3d:	call   0x14077d340
   140384a42:	xor    r8d,r8d
   140384a45:	mov    edx,0x6
   140384a4a:	mov    r9b,0x1
   140384a4d:	lea    rcx,[rip+0x22bf88c]        # 0x1426442e0
   140384a54:	call   0x1400bb0c0
   140384a59:	lea    rdx,[rip+0x1274668]        # 0x1415f90c8
   140384a60:	lea    rcx,[rbp+0xc0]
   140384a67:	call   0x1400680e0
   140384a6c:	nop
   140384a6d:	xor    r9d,r9d
   140384a70:	mov    r8b,0x3
   140384a73:	lea    rdx,[rbp+0xc0]
   140384a7a:	lea    rcx,[rip+0x22bf85f]        # 0x1426442e0
   140384a81:	call   0x140ad69a0
   140384a86:	nop
   140384a87:	lea    rcx,[rbp+0xc0]
   140384a8e:	call   0x140067dc0
   140384a93:	xor    r9d,r9d
   140384a96:	xor    r8d,r8d
   140384a99:	lea    rdx,[rbp+0xe0]
   140384aa0:	lea    rcx,[rip+0x22bf839]        # 0x1426442e0
   140384aa7:	call   0x140ad69a0
   140384aac:	nop
   140384aad:	lea    rcx,[rbp+0xe0]
   140384ab4:	call   0x140067dc0
   140384ab9:	mov    eax,DWORD PTR [rbp-0x70]
   140384abc:	add    eax,0x3
   140384abf:	cmp    edi,eax
   140384ac1:	jl     0x140384b6f
   140384ac7:	cmp    edi,esi
   140384ac9:	jg     0x140384b6f
   140384acf:	lea    r8d,[r12-0x19]
   140384ad4:	mov    edx,edi
   140384ad6:	lea    rcx,[rip+0x22bf803]        # 0x1426442e0
   140384add:	call   0x1400bb0b0
   140384ae2:	xor    r8d,r8d
   140384ae5:	mov    edx,0x7
   140384aea:	mov    r9b,0x1
   140384aed:	lea    rcx,[rip+0x22bf7ec]        # 0x1426442e0
   140384af4:	call   0x1400bb0c0
   140384af9:	lea    rdx,[rip+0x12745d0]        # 0x1415f90d0
   140384b00:	lea    rcx,[rbp+0xc0]
   140384b07:	call   0x1400680e0
   140384b0c:	nop
   140384b0d:	lea    rcx,[rbp+0xe0]
   140384b14:	call   0x14006f620
   140384b19:	nop
   140384b1a:	lea    rdx,[rbp+0xe0]
   140384b21:	mov    rcx,r14
   140384b24:	call   0x14014d870
   140384b29:	lea    rdx,[rbp+0xe0]
   140384b30:	lea    rcx,[rbp+0xc0]
   140384b37:	call   0x1400b9ca0
   140384b3c:	xor    r9d,r9d
   140384b3f:	xor    r8d,r8d
   140384b42:	lea    rdx,[rbp+0xc0]
   140384b49:	lea    rcx,[rip+0x22bf790]        # 0x1426442e0
   140384b50:	call   0x140ad69a0
   140384b55:	nop
   140384b56:	lea    rcx,[rbp+0xe0]
   140384b5d:	call   0x140067dc0
   140384b62:	nop
   140384b63:	lea    rcx,[rbp+0xc0]
   140384b6a:	call   0x140067dc0
   140384b6f:	mov    edi,DWORD PTR [rbp-0x70]
   140384b72:	mov    rbx,QWORD PTR [rbp-0x38]
   140384b76:	mov    rax,QWORD PTR [rbp+0x20]
   140384b7a:	add    r13d,0x3
   140384b7e:	mov    DWORD PTR [rbp-0x64],r13d
   140384b82:	add    rbx,0x3
   140384b86:	mov    QWORD PTR [rbp-0x38],rbx
   140384b8a:	movsxd rcx,esi
   140384b8d:	cmp    rbx,rcx
   140384b90:	jg     0x140384b9f
   140384b92:	add    rax,0x8
   140384b96:	mov    QWORD PTR [rbp+0x20],rax
   140384b9a:	jmp    0x140384400
   140384b9f:	mov    r14,QWORD PTR [rbp-0x80]
   140384ba3:	mov    rax,QWORD PTR [r14+0x388]
   140384baa:	sub    rax,QWORD PTR [r14+0x380]
   140384bb1:	sar    rax,0x3
   140384bb5:	lea    eax,[rax+rax*2]
   140384bb8:	mov    r13d,DWORD PTR [rbp-0x70]
   140384bbc:	cmp    eax,DWORD PTR [rbp+0x30]
   140384bbf:	jle    0x140384c47
   140384bc5:	lea    edi,[r13+0x4]
   140384bc9:	mov    r15d,DWORD PTR [rbp+0x40]
   140384bcd:	lea    ebx,[r15*2-0x2]
   140384bd5:	add    ebx,r13d
   140384bd8:	add    ebx,r15d
   140384bdb:	lea    rcx,[rbp+0xc0]
   140384be2:	call   0x1400bb2f0
   140384be7:	lea    eax,[r15-0x1]
   140384beb:	lea    eax,[rax+rax*2]
   140384bee:	mov    r9,QWORD PTR [rbp+0x0]
   140384bf2:	mov    r9d,DWORD PTR [r14+r9*4]
   140384bf6:	dec    r9d
   140384bf9:	mov    DWORD PTR [rsp+0x30],ebx
   140384bfd:	mov    DWORD PTR [rsp+0x28],edi
   140384c01:	mov    DWORD PTR [rsp+0x20],eax
   140384c05:	xor    r8d,r8d
   140384c08:	mov    edx,DWORD PTR [r14+0x398]
   140384c0f:	lea    rcx,[rbp+0xc0]
   140384c16:	call   0x1400bb310
   140384c1b:	lea    r9d,[r12+0x1]
   140384c20:	mov    DWORD PTR [rsp+0x28],0x0
   140384c28:	movzx  eax,BYTE PTR [r14+0x39c]
   140384c30:	mov    BYTE PTR [rsp+0x20],al
   140384c34:	mov    r8d,DWORD PTR [rbp+0x18]
   140384c38:	mov    edx,DWORD PTR [rbp+0x14]
   140384c3b:	lea    rcx,[rbp+0xc0]
   140384c42:	call   0x14140a440
   140384c47:	mov    rsi,QWORD PTR [rbp+0x38]
   140384c4b:	mov    ecx,DWORD PTR [rbp-0x30]
   140384c4e:	inc    ecx
   140384c50:	mov    DWORD PTR [rbp-0x30],ecx
   140384c53:	inc    rsi
   140384c56:	mov    QWORD PTR [rbp+0x38],rsi
   140384c5a:	inc    QWORD PTR [rbp+0x0]
   140384c5e:	cmp    ecx,0x2
   140384c61:	lea    r15d,[r13+0x1]
   140384c65:	jl     0x140384138
   140384c6b:	lea    rcx,[r14+0x28]
   140384c6f:	call   0x14006f4b0
   140384c74:	test   al,al
   140384c76:	jne    0x140385cf3
   140384c7c:	xor    r8d,r8d
   140384c7f:	mov    edx,0x7
   140384c84:	mov    r9b,0x1
   140384c87:	lea    rcx,[rip+0x22bf652]        # 0x1426442e0
   140384c8e:	call   0x1400bb0c0
   140384c93:	mov    r8d,DWORD PTR [rbp-0x78]
   140384c97:	add    r8d,0x2
   140384c9b:	mov    edi,DWORD PTR [rbp-0x20]
   140384c9e:	mov    edx,edi
   140384ca0:	lea    rcx,[rip+0x22bf639]        # 0x1426442e0
   140384ca7:	call   0x1400bb0b0
   140384cac:	xor    r9d,r9d
   140384caf:	xor    r8d,r8d
   140384cb2:	lea    rdx,[r14+0x28]
   140384cb6:	lea    rcx,[rip+0x22bf623]        # 0x1426442e0
   140384cbd:	call   0x140ad69a0
   140384cc2:	jmp    0x140385cf6
   140384cc7:	lea    eax,[rsi-0x3]
   140384cca:	cmp    ebx,eax
   140384ccc:	jne    0x140384cd2
   140384cce:	mov    edx,DWORD PTR [rdi]
   140384cd0:	jmp    0x140384cf6
   140384cd2:	lea    eax,[rsi-0x2]
   140384cd5:	cmp    ebx,eax
   140384cd7:	jne    0x140384cde
   140384cd9:	mov    edx,DWORD PTR [rdi+0xc]
   140384cdc:	jmp    0x140384cf6
   140384cde:	lea    eax,[rsi-0x1]
   140384ce1:	cmp    ebx,eax
   140384ce3:	jne    0x140384cea
   140384ce5:	mov    edx,DWORD PTR [rdi+0x18]
   140384ce8:	jmp    0x140384cf6
   140384cea:	cmp    ebx,esi
   140384cec:	jne    0x140384cf3
   140384cee:	mov    edx,DWORD PTR [rdi+0x24]
   140384cf1:	jmp    0x140384cf6
   140384cf3:	mov    edx,DWORD PTR [rdi-0xc]
   140384cf6:	lea    rcx,[rip+0x22bf5e3]        # 0x1426442e0
   140384cfd:	call   0x140ad7b10
   140384d02:	xor    edx,edx
   140384d04:	lea    rcx,[rip+0x2042955]        # 0x1423c7660
   140384d0b:	call   0x140071f20
   140384d10:	test   al,al
   140384d12:	je     0x140384d25
   140384d14:	mov    r8b,0x1
   140384d17:	xor    edx,edx
   140384d19:	lea    rcx,[rip+0x22bf5c0]        # 0x1426442e0
   140384d20:	call   0x1400bb120
   140384d25:	inc    ebx
   140384d27:	cmp    ebx,esi
   140384d29:	jle    0x1403841a0
   140384d2f:	lea    rax,[rip+0x22c10ea]        # 0x142645e20
   140384d36:	inc    r14d
   140384d39:	add    rdi,0x4
   140384d3d:	cmp    rdi,rax
   140384d40:	jl     0x140384192
   140384d46:	xor    r8d,r8d
   140384d49:	mov    edx,0x7
   140384d4e:	mov    r9b,0x1
   140384d51:	lea    rcx,[rip+0x22bf588]        # 0x1426442e0
   140384d58:	call   0x1400bb0c0
   140384d5d:	lea    r8d,[r12+0x2]
   140384d62:	lea    edx,[r13+0x1]
   140384d66:	lea    rcx,[rip+0x22bf573]        # 0x1426442e0
   140384d6d:	call   0x1400bb0b0
   140384d72:	mov    ebx,DWORD PTR [rbp-0x30]
   140384d75:	mov    eax,ebx
   140384d77:	shl    rax,0x5
   140384d7b:	mov    r13,QWORD PTR [rbp-0x80]
   140384d7f:	lea    rdx,[r13+0x338]
   140384d86:	add    rdx,rax
   140384d89:	lea    rcx,[rbp+0x120]
   140384d90:	call   0x14006f560
   140384d95:	nop
   140384d96:	lea    rcx,[rbp+0x120]
   140384d9d:	call   0x14006f4b0
   140384da2:	mov    rsi,QWORD PTR [rbp+0x38]
   140384da6:	test   al,al
   140384da8:	je     0x140384ddc
   140384daa:	cmp    BYTE PTR [rsi+r13*1+0x378],0x0
   140384db3:	jne    0x140384de7
   140384db5:	xor    r8d,r8d
   140384db8:	xor    edx,edx
   140384dba:	mov    r9b,0x1
   140384dbd:	lea    rcx,[rip+0x22bf51c]        # 0x1426442e0
   140384dc4:	call   0x1400bb0c0
   140384dc9:	lea    rdx,[rip+0x1262a00]        # 0x1415e77d0
   140384dd0:	lea    rcx,[rbp+0x120]
   140384dd7:	call   0x14006f4f0
   140384ddc:	cmp    BYTE PTR [rsi+r13*1+0x378],0x0
   140384de5:	je     0x140384e20
   140384de7:	call   QWORD PTR [rip+0x125b3fb]        # 0x1415e01e8
   140384ded:	mov    r8d,eax
   140384df0:	mov    eax,0x10624dd3
   140384df5:	mul    r8d
   140384df8:	shr    edx,0x6
   140384dfb:	imul   ecx,edx,0x3e8
   140384e01:	sub    r8d,ecx
   140384e04:	cmp    r8d,0x1f4
   140384e0b:	jae    0x140384e20
   140384e0d:	lea    rdx,[rip+0x1262a28]        # 0x1415e783c
   140384e14:	lea    rcx,[rbp+0x120]
   140384e1b:	call   0x14006f4f0
   140384e20:	xor    r9d,r9d
   140384e23:	xor    r8d,r8d
   140384e26:	lea    rdx,[rbp+0x120]
   140384e2d:	lea    rcx,[rip+0x22bf4ac]        # 0x1426442e0
   140384e34:	call   0x140ad69a0
   140384e39:	lea    rax,[rbx+rbx*2]
   140384e3d:	lea    rdi,[rax*8+0x0]
   140384e45:	add    rdi,r13
   140384e48:	mov    QWORD PTR [rbp+0xa8],rdi
   140384e4f:	lea    r14,[rdi+0xe0]
   140384e56:	mov    QWORD PTR [rbp-0x40],r14
   140384e5a:	mov    rcx,r14
   140384e5d:	call   0x14006ede0
   140384e62:	test   rax,rax
   140384e65:	je     0x140385c44
   140384e6b:	cmp    DWORD PTR [r13+rsi*4+0x170],0x0
   140384e74:	jle    0x140385c44
   140384e7a:	mov    eax,DWORD PTR [rbp-0x70]
   140384e7d:	mov    esi,eax
   140384e7f:	mov    rcx,QWORD PTR [rbp+0x38]
   140384e83:	sub    esi,DWORD PTR [r13+rcx*4+0x328]
   140384e8b:	add    esi,0x3
   140384e8e:	mov    DWORD PTR [rsp+0x7c],esi
   140384e92:	mov    ecx,DWORD PTR [rbp+0x40]
   140384e95:	lea    r15d,[rax+rcx*2]
   140384e99:	dec    ecx
   140384e9b:	add    r15d,ecx
   140384e9e:	mov    DWORD PTR [rsp+0x74],r15d
   140384ea3:	lea    rdx,[rbp+0x28]
   140384ea7:	lea    rcx,[rdi+0x218]
   140384eae:	call   0x14006f1d0
   140384eb3:	lea    rdx,[rbp+0xa0]
   140384eba:	lea    rcx,[rdi+0x218]
   140384ec1:	call   0x14006f1c0
   140384ec6:	lea    rdx,[rbp-0x28]
   140384eca:	lea    rcx,[rdi+0x248]
   140384ed1:	call   0x14006f1d0
   140384ed6:	lea    rdx,[rbp+0x80]
   140384edd:	lea    rcx,[rdi+0x248]
   140384ee4:	call   0x14006f1c0
   140384ee9:	mov    ebx,DWORD PTR [rbp-0x30]
   140384eec:	mov    ecx,ebx
   140384eee:	shl    rcx,0x5
   140384ef2:	add    rcx,0x278
   140384ef9:	add    rcx,r13
   140384efc:	lea    rdx,[rbp+0xb0]
   140384f03:	call   0x14013be00
   140384f08:	mov    ecx,ebx
   140384f0a:	shl    rcx,0x5
   140384f0e:	add    r13,0x2b8
   140384f15:	add    rcx,r13
   140384f18:	lea    rdx,[rbp+0x160]
   140384f1f:	call   0x14013be00
   140384f24:	lea    rcx,[rdi+0x2f8]
   140384f2b:	lea    rdx,[rbp-0x18]
   140384f2f:	call   0x14006f1d0
   140384f34:	movsxd r13,r15d
   140384f37:	mov    QWORD PTR [rbp+0x8],r13
   140384f3b:	movsxd rbx,esi
   140384f3e:	mov    QWORD PTR [rbp-0x50],rbx
   140384f42:	lea    eax,[r12+0x2]
   140384f47:	mov    DWORD PTR [rbp+0x70],eax
   140384f4a:	nop    WORD PTR [rax+rax*1+0x0]
   140384f50:	mov    rax,QWORD PTR [rbp+0x28]
   140384f54:	cmp    rax,QWORD PTR [rbp+0xa0]
   140384f5b:	je     0x140385c3c
   140384f61:	mov    edx,0x1
   140384f66:	mov    eax,0xff
   140384f6b:	cmovb  edx,eax
   140384f6e:	test   dl,dl
   140384f70:	jns    0x140385c3c
   140384f76:	lea    rdx,[rbp+0x100]
   140384f7d:	lea    rcx,[rbp+0x160]
   140384f84:	call   0x14013bca0
   140384f89:	mov    rcx,rax
   140384f8c:	call   0x14013bc20
   140384f91:	test   al,al
   140384f93:	je     0x140385c0b
   140384f99:	mov    eax,DWORD PTR [rbp-0x70]
   140384f9c:	add    eax,0x3
   140384f9f:	cmp    esi,eax
   140384fa1:	jl     0x140384fa8
   140384fa3:	cmp    rbx,r13
   140384fa6:	jle    0x140384fc8
   140384fa8:	lea    ecx,[rsi+0x1]
   140384fab:	cmp    ecx,eax
   140384fad:	jl     0x140384fb4
   140384faf:	cmp    ecx,r15d
   140384fb2:	jle    0x140384fc8
   140384fb4:	lea    ecx,[rsi+0x2]
   140384fb7:	cmp    ecx,eax
   140384fb9:	jl     0x140385294
   140384fbf:	cmp    ecx,r15d
   140384fc2:	jg     0x140385294
   140384fc8:	xor    r8d,r8d
   140384fcb:	mov    edx,0x7
   140384fd0:	mov    r9b,0x1
   140384fd3:	lea    rcx,[rip+0x22bf306]        # 0x1426442e0
   140384fda:	call   0x1400bb0c0
   140384fdf:	movsxd r14,DWORD PTR [rbp-0x74]
   140384fe3:	mov    eax,DWORD PTR [rbp-0x6c]
   140384fe6:	cmp    r14d,eax
   140384fe9:	jg     0x1403850b2
   140384fef:	lea    r12d,[rsi+0x3]
   140384ff3:	mov    r13d,DWORD PTR [rbp-0x70]
   140384ff7:	add    r13d,0x3
   140384ffb:	mov    r15,r14
   140384ffe:	xchg   ax,ax
   140385000:	mov    edi,esi
   140385002:	mov    rsi,rbx
   140385005:	cmp    DWORD PTR [rsp+0x7c],r12d
   14038500a:	jge    0x140385092
   140385010:	lea    rbx,[rip+0x22c0d25]        # 0x142645d3c
   140385017:	cmp    edi,r13d
   14038501a:	jl     0x14038507d
   14038501c:	cmp    rsi,QWORD PTR [rbp+0x8]
   140385020:	jg     0x14038507d
   140385022:	mov    r8d,r14d
   140385025:	mov    edx,edi
   140385027:	lea    rcx,[rip+0x22bf2b2]        # 0x1426442e0
   14038502e:	call   0x1400bb0b0
   140385033:	cmp    r14d,DWORD PTR [rbp-0x68]
   140385037:	jne    0x14038503e
   140385039:	mov    edx,DWORD PTR [rbx-0x18]
   14038503c:	jmp    0x14038504e
   14038503e:	movsxd rcx,DWORD PTR [rbp-0x6c]
   140385042:	cmp    r15,rcx
   140385045:	jne    0x14038504b
   140385047:	mov    edx,DWORD PTR [rbx]
   140385049:	jmp    0x14038504e
   14038504b:	mov    edx,DWORD PTR [rbx-0xc]
   14038504e:	lea    rcx,[rip+0x22bf28b]        # 0x1426442e0
   140385055:	call   0x140ad7b10
   14038505a:	xor    edx,edx
   14038505c:	lea    rcx,[rip+0x20425fd]        # 0x1423c7660
   140385063:	call   0x140071f20
   140385068:	test   al,al
   14038506a:	je     0x14038507d
   14038506c:	mov    r8b,0x1
   14038506f:	xor    edx,edx
   140385071:	lea    rcx,[rip+0x22bf268]        # 0x1426442e0
   140385078:	call   0x1400bb120
   14038507d:	inc    edi
   14038507f:	inc    rsi
   140385082:	add    rbx,0x4
   140385086:	cmp    edi,r12d
   140385089:	jl     0x140385017
   14038508b:	mov    rbx,QWORD PTR [rbp-0x50]
   14038508f:	mov    eax,DWORD PTR [rbp-0x6c]
   140385092:	inc    r14d
   140385095:	inc    r15
   140385098:	cmp    r14d,eax
   14038509b:	mov    esi,DWORD PTR [rsp+0x7c]
   14038509f:	jle    0x140385000
   1403850a5:	mov    r12d,DWORD PTR [rbp-0x68]
   1403850a9:	mov    r13,QWORD PTR [rbp+0x8]
   1403850ad:	mov    r15d,DWORD PTR [rsp+0x74]
   1403850b2:	mov    eax,DWORD PTR [rbp-0x64]
   1403850b5:	mov    DWORD PTR [rbp-0x64],eax
   1403850b8:	mov    DWORD PTR [rbp-0x68],r12d
   1403850bc:	lea    edi,[rsi+0x1]
   1403850bf:	mov    r14d,DWORD PTR [rbp-0x70]
   1403850c3:	lea    eax,[r14+0x3]
   1403850c7:	cmp    edi,eax
   1403850c9:	jl     0x1403851a0
   1403850cf:	cmp    esi,r15d
   1403850d2:	jge    0x1403851a0
   1403850d8:	lea    rcx,[rbp+0xe0]
   1403850df:	call   0x14006f620
   1403850e4:	nop
   1403850e5:	lea    rcx,[rbp-0x28]
   1403850e9:	call   0x14006eda0
   1403850ee:	movzx  ebx,WORD PTR [rax]
   1403850f1:	lea    rcx,[rbp+0x28]
   1403850f5:	call   0x14006eda0
   1403850fa:	mov    edx,0xffffffff
   1403850ff:	mov    r9d,edx
   140385102:	xor    ecx,ecx
   140385104:	mov    DWORD PTR [rsp+0x68],ecx
   140385108:	mov    DWORD PTR [rsp+0x60],ecx
   14038510c:	mov    BYTE PTR [rsp+0x58],0x1
   140385111:	mov    DWORD PTR [rsp+0x50],edx
   140385115:	mov    DWORD PTR [rsp+0x48],edx
   140385119:	mov    QWORD PTR [rsp+0x40],rcx
   14038511e:	mov    BYTE PTR [rsp+0x38],cl
   140385122:	mov    DWORD PTR [rsp+0x30],ecx
   140385126:	mov    DWORD PTR [rsp+0x28],edx
   14038512a:	mov    DWORD PTR [rsp+0x20],edx
   14038512e:	movzx  r8d,bx
   140385132:	movzx  edx,WORD PTR [rax]
   140385135:	lea    rcx,[rbp+0xe0]
   14038513c:	call   0x140a7fc90
   140385141:	lea    rcx,[rbp+0xe0]
   140385148:	call   0x14052b070
   14038514d:	xor    r8d,r8d
   140385150:	mov    edx,0x7
   140385155:	mov    r9b,0x1
   140385158:	lea    rcx,[rip+0x22bf181]        # 0x1426442e0
   14038515f:	call   0x1400bb0c0
   140385164:	mov    r8d,DWORD PTR [rbp-0x74]
   140385168:	add    r8d,0x2
   14038516c:	mov    edx,edi
   14038516e:	lea    rcx,[rip+0x22bf16b]        # 0x1426442e0
   140385175:	call   0x1400bb0b0
   14038517a:	xor    r9d,r9d
   14038517d:	xor    r8d,r8d
   140385180:	lea    rdx,[rbp+0xe0]
   140385187:	lea    rcx,[rip+0x22bf152]        # 0x1426442e0
   14038518e:	call   0x140ad69a0
   140385193:	nop
   140385194:	lea    rcx,[rbp+0xe0]
   14038519b:	call   0x140067dc0
   1403851a0:	add    r14d,0x3
   1403851a4:	mov    esi,DWORD PTR [rbp-0x6c]
   1403851a7:	add    esi,0xfffffffc
   1403851aa:	mov    ebx,DWORD PTR [rsp+0x7c]
   1403851ae:	lea    rdi,[rip+0x22ca1fb]        # 0x14264f3b0
   1403851b5:	mov    eax,DWORD PTR [rbp-0x74]
   1403851b8:	mov    DWORD PTR [rbp-0x74],eax
   1403851bb:	lea    rax,[rip+0x22ca1fa]        # 0x14264f3bc
   1403851c2:	cmp    ebx,r14d
   1403851c5:	jl     0x140385279
   1403851cb:	cmp    ebx,r15d
   1403851ce:	jg     0x140385279
   1403851d4:	mov    DWORD PTR [rip+0x22bf18a],esi        # 0x142644364
   1403851da:	mov    DWORD PTR [rip+0x22bf188],ebx        # 0x142644368
   1403851e0:	mov    rax,QWORD PTR [rbp-0x18]
   1403851e4:	mov    ecx,DWORD PTR [rax]
   1403851e6:	test   cl,0x1
   1403851e9:	je     0x1403851f0
   1403851eb:	mov    edx,DWORD PTR [rdi-0x30]
   1403851ee:	jmp    0x1403851f8
   1403851f0:	test   cl,0x2
   1403851f3:	je     0x140385207
   1403851f5:	mov    edx,DWORD PTR [rdi-0xc]
   1403851f8:	xor    r8d,r8d
   1403851fb:	lea    rcx,[rip+0x22bf0de]        # 0x1426442e0
   140385202:	call   0x140ad8140
   140385207:	lea    eax,[rsi+0x1]
   14038520a:	mov    DWORD PTR [rip+0x22bf154],eax        # 0x142644364
   140385210:	mov    DWORD PTR [rip+0x22bf152],ebx        # 0x142644368
   140385216:	mov    rax,QWORD PTR [rbp-0x18]
   14038521a:	mov    ecx,DWORD PTR [rax]
   14038521c:	test   cl,0x1
   14038521f:	je     0x140385226
   140385221:	mov    edx,DWORD PTR [rdi-0x24]
   140385224:	jmp    0x14038522d
   140385226:	test   cl,0x2
   140385229:	je     0x14038523c
   14038522b:	mov    edx,DWORD PTR [rdi]
   14038522d:	xor    r8d,r8d
   140385230:	lea    rcx,[rip+0x22bf0a9]        # 0x1426442e0
   140385237:	call   0x140ad8140
   14038523c:	lea    eax,[rsi+0x2]
   14038523f:	mov    DWORD PTR [rip+0x22bf11f],eax        # 0x142644364
   140385245:	mov    DWORD PTR [rip+0x22bf11d],ebx        # 0x142644368
   14038524b:	mov    rax,QWORD PTR [rbp-0x18]
   14038524f:	mov    ecx,DWORD PTR [rax]
   140385251:	test   cl,0x1
   140385254:	je     0x14038525b
   140385256:	mov    edx,DWORD PTR [rdi-0x18]
   140385259:	jmp    0x140385263
   14038525b:	test   cl,0x2
   14038525e:	je     0x140385272
   140385260:	mov    edx,DWORD PTR [rdi+0xc]
   140385263:	xor    r8d,r8d
   140385266:	lea    rcx,[rip+0x22bf073]        # 0x1426442e0
   14038526d:	call   0x140ad8140
   140385272:	lea    rax,[rip+0x22ca143]        # 0x14264f3bc
   140385279:	inc    ebx
   14038527b:	add    rdi,0x4
   14038527f:	cmp    rdi,rax
   140385282:	jl     0x1403851c2
   140385288:	mov    esi,DWORD PTR [rsp+0x7c]
   14038528c:	mov    rbx,QWORD PTR [rbp-0x50]
   140385290:	mov    r14,QWORD PTR [rbp-0x40]
   140385294:	add    esi,0x3
   140385297:	mov    DWORD PTR [rsp+0x7c],esi
   14038529b:	add    rbx,0x3
   14038529f:	mov    QWORD PTR [rbp-0x50],rbx
   1403852a3:	cmp    rbx,r13
   1403852a6:	jg     0x140385c3c
   1403852ac:	lea    rdx,[rbp+0x140]
   1403852b3:	lea    rcx,[rbp+0xb0]
   1403852ba:	call   0x14013bca0
   1403852bf:	mov    rcx,rax
   1403852c2:	call   0x14013bc20
   1403852c7:	test   al,al
   1403852c9:	je     0x140385c0b
   1403852cf:	xor    bl,bl
   1403852d1:	mov    BYTE PTR [rsp+0x78],bl
   1403852d5:	lea    rdx,[rbp-0x10]
   1403852d9:	mov    rcx,r14
   1403852dc:	call   0x14006f1d0
   1403852e1:	lea    rdx,[rbp+0x78]
   1403852e5:	mov    rcx,r14
   1403852e8:	call   0x14006f1c0
   1403852ed:	mov    rcx,QWORD PTR [rbp+0xa8]
   1403852f4:	add    rcx,0x110
   1403852fb:	lea    rdx,[rbp+0x50]
   1403852ff:	call   0x14006f1d0
   140385304:	mov    r15d,DWORD PTR [rbp-0x70]
   140385308:	add    r15d,0x3
   14038530c:	mov    DWORD PTR [rbp-0x5c],r15d
   140385310:	mov    rax,QWORD PTR [rbp-0x10]
   140385314:	cmp    rax,QWORD PTR [rbp+0x78]
   140385318:	je     0x140385c03
   14038531e:	mov    edx,0x1
   140385323:	mov    ecx,0xff
   140385328:	cmovb  edx,ecx
   14038532b:	test   dl,dl
   14038532d:	jns    0x140385c03
   140385333:	mov    rcx,QWORD PTR [rbp+0x50]
   140385337:	test   BYTE PTR [rcx],0x2
   14038533a:	je     0x140385346
   14038533c:	test   bl,bl
   14038533e:	je     0x140385bf2
   140385344:	jmp    0x1403853a9
   140385346:	lea    rcx,[rbp-0x10]
   14038534a:	call   0x14006eda0
   14038534f:	mov    rcx,QWORD PTR [rax]
   140385352:	mov    rax,QWORD PTR [rcx]
   140385355:	call   QWORD PTR [rax]
   140385357:	movsx  ebx,ax
   14038535a:	lea    rcx,[rbp+0x28]
   14038535e:	call   0x14006eda0
   140385363:	cmp    ebx,DWORD PTR [rax]
   140385365:	jne    0x140385be8
   14038536b:	lea    rcx,[rbp-0x10]
   14038536f:	call   0x14006eda0
   140385374:	mov    rcx,QWORD PTR [rax]
   140385377:	mov    rax,QWORD PTR [rcx]
   14038537a:	call   QWORD PTR [rax+0x8]
   14038537d:	movsx  ebx,ax
   140385380:	lea    rcx,[rbp-0x28]
   140385384:	call   0x14006eda0
   140385389:	cmp    ebx,DWORD PTR [rax]
   14038538b:	jne    0x140385be8
   140385391:	lea    rcx,[rbp+0x50]
   140385395:	call   0x14006eda0
   14038539a:	movzx  ebx,BYTE PTR [rax]
   14038539d:	shr    bl,0x2
   1403853a0:	not    bl
   1403853a2:	and    bl,0x1
   1403853a5:	mov    BYTE PTR [rsp+0x78],bl
   1403853a9:	lea    rcx,[rbp-0x10]
   1403853ad:	call   0x14006eda0
   1403853b2:	mov    r14,QWORD PTR [rax]
   1403853b5:	mov    QWORD PTR [rbp-0x38],r14
   1403853b9:	mov    rbx,QWORD PTR [rbp-0x50]
   1403853bd:	cmp    esi,DWORD PTR [rbp+0x74]
   1403853c0:	jl     0x140385bcd
   1403853c6:	cmp    rbx,r13
   1403853c9:	jg     0x140385bcd
   1403853cf:	lea    rcx,[rbp+0x50]
   1403853d3:	call   0x14006eda0
   1403853d8:	movzx  r13d,BYTE PTR [rax]
   1403853dc:	and    r13d,0x2
   1403853e0:	mov    DWORD PTR [rbp-0x58],r13d
   1403853e4:	xor    r8d,r8d
   1403853e7:	mov    edx,0x7
   1403853ec:	mov    r9b,0x1
   1403853ef:	lea    rcx,[rip+0x22beeea]        # 0x1426442e0
   1403853f6:	call   0x1400bb0c0
   1403853fb:	movsxd rdi,DWORD PTR [rbp-0x74]
   1403853ff:	mov    ecx,DWORD PTR [rbp-0x6c]
   140385402:	cmp    edi,ecx
   140385404:	jg     0x140385512
   14038540a:	lea    r13d,[rsi+0x3]
   14038540e:	mov    r15,rdi
   140385411:	mov    r14,rbx
   140385414:	cmp    DWORD PTR [rsp+0x7c],r13d
   140385419:	jge    0x1403854f5
   14038541f:	movsxd r12,r12d
   140385422:	lea    rbx,[rip+0x22c0a63]        # 0x142645e8c
   140385429:	mov    eax,DWORD PTR [rbp-0x5c]
   14038542c:	nop    DWORD PTR [rax+0x0]
   140385430:	cmp    esi,eax
   140385432:	jl     0x1403854d8
   140385438:	cmp    r14,QWORD PTR [rbp+0x8]
   14038543c:	jg     0x1403854d8
   140385442:	mov    r8d,DWORD PTR [rbp-0x58]
   140385446:	add    r8d,edi
   140385449:	mov    edx,esi
   14038544b:	lea    rcx,[rip+0x22bee8e]        # 0x1426442e0
   140385452:	call   0x1400bb0b0
   140385457:	cmp    r15,r12
   14038545a:	jne    0x140385461
   14038545c:	mov    edx,DWORD PTR [rbx-0xc]
   14038545f:	jmp    0x1403854a6
   140385461:	mov    ecx,DWORD PTR [rbp-0x68]
   140385464:	lea    eax,[rcx+0x1]
   140385467:	cmp    edi,eax
   140385469:	jne    0x14038546f
   14038546b:	mov    edx,DWORD PTR [rbx]
   14038546d:	jmp    0x1403854a6
   14038546f:	cmp    edi,DWORD PTR [rbp+0x70]
   140385472:	jne    0x140385478
   140385474:	mov    edx,DWORD PTR [rbx]
   140385476:	jmp    0x1403854a6
   140385478:	lea    eax,[rcx+0x3]
   14038547b:	cmp    edi,eax
   14038547d:	jne    0x140385483
   14038547f:	mov    edx,DWORD PTR [rbx]
   140385481:	jmp    0x1403854a6
   140385483:	lea    eax,[rcx+0x4]
   140385486:	cmp    edi,eax
   140385488:	jne    0x14038548f
   14038548a:	mov    edx,DWORD PTR [rbx+0xc]
   14038548d:	jmp    0x1403854a6
   14038548f:	movsxd rcx,DWORD PTR [rbp-0x6c]
   140385493:	cmp    r15,rcx
   140385496:	jne    0x1403854a0
   140385498:	mov    edx,DWORD PTR [rbx-0x1ec]
   14038549e:	jmp    0x1403854a6
   1403854a0:	mov    edx,DWORD PTR [rbx-0x1f8]
   1403854a6:	lea    rcx,[rip+0x22bee33]        # 0x1426442e0
   1403854ad:	call   0x140ad7b10
   1403854b2:	xor    edx,edx
   1403854b4:	lea    rcx,[rip+0x20421a5]        # 0x1423c7660
   1403854bb:	call   0x140071f20
   1403854c0:	test   al,al
   1403854c2:	je     0x1403854d5
   1403854c4:	mov    r8b,0x1
   1403854c7:	xor    edx,edx
   1403854c9:	lea    rcx,[rip+0x22bee10]        # 0x1426442e0
   1403854d0:	call   0x1400bb120
   1403854d5:	mov    eax,DWORD PTR [rbp-0x5c]
   1403854d8:	inc    esi
   1403854da:	inc    r14
   1403854dd:	add    rbx,0x4
   1403854e1:	cmp    esi,r13d
   1403854e4:	jl     0x140385430
   1403854ea:	mov    r12d,DWORD PTR [rbp-0x68]
   1403854ee:	mov    rbx,QWORD PTR [rbp-0x50]
   1403854f2:	mov    ecx,DWORD PTR [rbp-0x6c]
   1403854f5:	inc    edi
   1403854f7:	inc    r15
   1403854fa:	cmp    edi,ecx
   1403854fc:	mov    esi,DWORD PTR [rsp+0x7c]
   140385500:	jle    0x140385411
   140385506:	mov    r13d,DWORD PTR [rbp-0x58]
   14038550a:	mov    r14,QWORD PTR [rbp-0x38]
   14038550e:	mov    r15d,DWORD PTR [rbp-0x5c]
   140385512:	mov    ecx,DWORD PTR [rsp+0x74]
   140385516:	cmp    esi,r15d
   140385519:	jl     0x1403855cc
   14038551f:	lea    eax,[rcx-0x2]
   140385522:	cmp    esi,eax
   140385524:	jg     0x1403855cc
   14038552a:	mov    ebx,DWORD PTR [rbp-0x64]
   14038552d:	add    ebx,r13d
   140385530:	xor    edx,edx
   140385532:	lea    rcx,[rip+0x2042127]        # 0x1423c7660
   140385539:	call   0x140071f20
   14038553e:	lea    rcx,[rip+0x22bed9b]        # 0x1426442e0
   140385545:	test   al,al
   140385547:	je     0x140385590
   140385549:	mov    r8d,ebx
   14038554c:	mov    edx,esi
   14038554e:	call   0x1400bb0b0
   140385553:	mov    edx,DWORD PTR [rbp-0x60]
   140385556:	mov    rcx,r14
   140385559:	call   0x140c79c00
   14038555e:	test   eax,eax
   140385560:	je     0x1403855c8
   140385562:	mov    BYTE PTR [rsp+0x30],0x0
   140385567:	mov    DWORD PTR [rsp+0x28],0x3
   14038556f:	mov    DWORD PTR [rsp+0x20],0x5
   140385577:	mov    r9d,0x2
   14038557d:	mov    r8d,r9d
   140385580:	mov    edx,eax
   140385582:	lea    rcx,[rip+0x22bed57]        # 0x1426442e0
   140385589:	call   0x140ad7db0
   14038558e:	jmp    0x1403855c8
   140385590:	lea    r8d,[rbx+0x2]
   140385594:	lea    edx,[rsi+0x1]
   140385597:	call   0x1400bb0b0
   14038559c:	mov    rax,QWORD PTR [r14]
   14038559f:	xor    edx,edx
   1403855a1:	mov    rcx,r14
   1403855a4:	call   QWORD PTR [rax+0x370]
   1403855aa:	mov    rax,QWORD PTR [r14]
   1403855ad:	mov    rcx,r14
   1403855b0:	call   QWORD PTR [rax+0x640]
   1403855b6:	movzx  edx,al
   1403855b9:	mov    r8b,0x1
   1403855bc:	lea    rcx,[rip+0x22bed1d]        # 0x1426442e0
   1403855c3:	call   0x1400bb120
   1403855c8:	mov    ecx,DWORD PTR [rsp+0x74]
   1403855cc:	lea    eax,[rsi+0x1]
   1403855cf:	cmp    eax,r15d
   1403855d2:	jl     0x1403857b8
   1403855d8:	cmp    esi,ecx
   1403855da:	jge    0x1403857b8
   1403855e0:	xor    sil,sil
   1403855e3:	xor    bl,bl
   1403855e5:	xor    r15b,r15b
   1403855e8:	xor    ecx,ecx
   1403855ea:	mov    r14d,ecx
   1403855ed:	mov    rax,QWORD PTR [rbp-0x38]
   1403855f1:	mov    rdx,QWORD PTR [rax+0x38]
   1403855f5:	mov    rax,QWORD PTR [rax+0x40]
   1403855f9:	sub    rax,rdx
   1403855fc:	sar    rax,0x3
   140385600:	test   rax,rax
   140385603:	je     0x140385667
   140385605:	mov    edi,ecx
   140385607:	mov    r12,QWORD PTR [rbp-0x38]
   14038560b:	mov    r13d,0x1
   140385611:	mov    rcx,QWORD PTR [rdx+rdi*1]
   140385615:	mov    rax,QWORD PTR [rcx]
   140385618:	call   QWORD PTR [rax+0x10]
   14038561b:	movzx  ebx,bl
   14038561e:	cmp    eax,0x2c
   140385621:	cmove  ebx,r13d
   140385625:	mov    rax,QWORD PTR [r12+0x38]
   14038562a:	mov    rcx,QWORD PTR [rdi+rax*1]
   14038562e:	mov    rax,QWORD PTR [rcx]
   140385631:	call   QWORD PTR [rax+0x10]
   140385634:	movzx  esi,sil
   140385638:	cmp    eax,0x2b
   14038563b:	cmove  esi,r13d
   14038563f:	inc    r14d
   140385642:	lea    rdi,[rdi+0x8]
   140385646:	mov    rdx,QWORD PTR [r12+0x38]
   14038564b:	mov    rcx,QWORD PTR [r12+0x40]
   140385650:	sub    rcx,rdx
   140385653:	sar    rcx,0x3
   140385657:	movsxd rax,r14d
   14038565a:	cmp    rax,rcx
   14038565d:	jb     0x140385611
   14038565f:	mov    r12d,DWORD PTR [rbp-0x68]
   140385663:	mov    r13d,DWORD PTR [rbp-0x58]
   140385667:	mov    r14,QWORD PTR [rbp-0x38]
   14038566b:	cmp    QWORD PTR [rbp+0x38],0x1
   140385670:	jne    0x140385689
   140385672:	mov    rcx,r14
   140385675:	call   0x140caf250
   14038567a:	movzx  r15d,r15b
   14038567e:	test   al,al
   140385680:	mov    eax,0x1
   140385685:	cmovne r15d,eax
   140385689:	test   bl,bl
   14038568b:	je     0x140385694
   14038568d:	mov    edx,0x2
   140385692:	jmp    0x1403856c0
   140385694:	test   sil,sil
   140385697:	je     0x1403856a0
   140385699:	mov    edx,0x4
   14038569e:	jmp    0x1403856c0
   1403856a0:	test   r15b,r15b
   1403856a3:	je     0x1403856ac
   1403856a5:	mov    edx,0x5
   1403856aa:	jmp    0x1403856c0
   1403856ac:	test   DWORD PTR [r14+0x10],0x4000
   1403856b4:	mov    edx,0x7
   1403856b9:	jne    0x1403856c0
   1403856bb:	mov    edx,0x6
   1403856c0:	mov    r9b,0x1
   1403856c3:	xor    r8d,r8d
   1403856c6:	lea    rcx,[rip+0x22bec13]        # 0x1426442e0
   1403856cd:	call   0x1400bb0c0
   1403856d2:	mov    edi,DWORD PTR [rbp-0x74]
   1403856d5:	lea    r8d,[rdi+0x7]
   1403856d9:	add    r8d,r13d
   1403856dc:	mov    esi,DWORD PTR [rsp+0x7c]
   1403856e0:	lea    edx,[rsi+0x1]
   1403856e3:	lea    rcx,[rip+0x22bebf6]        # 0x1426442e0
   1403856ea:	call   0x1400bb0b0
   1403856ef:	lea    rcx,[rbp+0xe0]
   1403856f6:	call   0x14006f620
   1403856fb:	nop
   1403856fc:	mov    r9d,0xffffffff
   140385702:	xor    r8d,r8d
   140385705:	lea    rdx,[rbp+0xe0]
   14038570c:	mov    rcx,r14
   14038570f:	call   0x140c62490
   140385714:	mov    ebx,DWORD PTR [rbp-0x6c]
   140385717:	sub    ebx,r13d
   14038571a:	sub    ebx,edi
   14038571c:	lea    eax,[rbx-0x16]
   14038571f:	movsxd rcx,eax
   140385722:	cmp    QWORD PTR [rbp+0xf0],rcx
   140385729:	jb     0x14038578e
   14038572b:	lea    esi,[rbx-0x17]
   14038572e:	movsxd rdi,ebx
   140385731:	test   esi,esi
   140385733:	js     0x140385748
   140385735:	lea    rdx,[rdi-0x17]
   140385739:	xor    r8d,r8d
   14038573c:	lea    rcx,[rbp+0xe0]
   140385743:	call   0x1400e11c0
   140385748:	cmp    esi,0x3
   14038574b:	jle    0x14038578a
   14038574d:	lea    rdx,[rdi-0x1a]
   140385751:	lea    rcx,[rbp+0xe0]
   140385758:	call   0x1400fb4d0
   14038575d:	mov    BYTE PTR [rax],0x2e
   140385760:	lea    eax,[rbx-0x19]
   140385763:	movsxd rdx,eax
   140385766:	lea    rcx,[rbp+0xe0]
   14038576d:	call   0x1400fb4d0
   140385772:	mov    BYTE PTR [rax],0x2e
   140385775:	lea    eax,[rbx-0x18]
   140385778:	movsxd rdx,eax
   14038577b:	lea    rcx,[rbp+0xe0]
   140385782:	call   0x1400fb4d0
   140385787:	mov    BYTE PTR [rax],0x2e
   14038578a:	mov    esi,DWORD PTR [rsp+0x7c]
   14038578e:	xor    r9d,r9d
   140385791:	xor    r8d,r8d
   140385794:	lea    rdx,[rbp+0xe0]
   14038579b:	lea    rcx,[rip+0x22beb3e]        # 0x1426442e0
   1403857a2:	call   0x140ad69a0
   1403857a7:	nop
   1403857a8:	lea    rcx,[rbp+0xe0]
   1403857af:	call   0x14006f7e0
   1403857b4:	mov    r15d,DWORD PTR [rbp-0x5c]
   1403857b8:	lea    eax,[rsi+0x2]
   1403857bb:	cmp    eax,r15d
   1403857be:	jl     0x1403858ff
   1403857c4:	cmp    eax,DWORD PTR [rsp+0x74]
   1403857c8:	jg     0x1403858ff
   1403857ce:	xor    edi,edi
   1403857d0:	test   BYTE PTR [r14+0x10],0x40
   1403857d5:	je     0x1403858ff
   1403857db:	lea    rdx,[rbp+0x58]
   1403857df:	lea    rcx,[r14+0x38]
   1403857e3:	call   0x14006f1d0
   1403857e8:	lea    rdx,[rbp+0x60]
   1403857ec:	lea    rcx,[r14+0x38]
   1403857f0:	call   0x14006f1c0
   1403857f5:	mov    rax,QWORD PTR [rbp+0x58]
   1403857f9:	mov    r12d,0x1
   1403857ff:	mov    r14d,0xff
   140385805:	cmp    rax,QWORD PTR [rbp+0x60]
   140385809:	je     0x14038584b
   14038580b:	mov    edx,r12d
   14038580e:	cmovb  edx,r14d
   140385812:	test   dl,dl
   140385814:	jns    0x14038584b
   140385816:	mov    rcx,QWORD PTR [rax]
   140385819:	mov    rax,QWORD PTR [rcx]
   14038581c:	call   QWORD PTR [rax+0x10]
   14038581f:	cmp    eax,0xa
   140385822:	jne    0x14038583d
   140385824:	lea    rcx,[rbp+0x58]
   140385828:	call   0x14006eda0
   14038582d:	mov    rcx,QWORD PTR [rax]
   140385830:	mov    rax,QWORD PTR [rcx]
   140385833:	call   QWORD PTR [rax+0x18]
   140385836:	test   rax,rax
   140385839:	je     0x14038583d
   14038583b:	inc    edi
   14038583d:	mov    rax,QWORD PTR [rbp+0x58]
   140385841:	add    rax,0x8
   140385845:	mov    QWORD PTR [rbp+0x58],rax
   140385849:	jmp    0x140385805
   14038584b:	test   edi,edi
   14038584d:	mov    r12d,DWORD PTR [rbp-0x68]
   140385851:	mov    r14,QWORD PTR [rbp-0x38]
   140385855:	jle    0x1403858ff
   14038585b:	mov    r8d,DWORD PTR [rbp-0x74]
   14038585f:	add    r8d,0x7
   140385863:	add    r8d,r13d
   140385866:	lea    edx,[rsi+0x2]
   140385869:	lea    rcx,[rip+0x22bea70]        # 0x1426442e0
   140385870:	call   0x1400bb0b0
   140385875:	lea    rdx,[rip+0x129107c]        # 0x1416168f8
   14038587c:	lea    rcx,[rbp+0xe0]
   140385883:	call   0x1400680e0
   140385888:	nop
   140385889:	lea    rdx,[rbp+0xe0]
   140385890:	mov    ecx,edi
   140385892:	call   0x140529cf0
   140385897:	lea    rdx,[rip+0x126c966]        # 0x1415f2204
   14038589e:	lea    rcx,[rbp+0xe0]
   1403858a5:	call   0x14006f4f0
   1403858aa:	cmp    edi,0x1
   1403858ad:	je     0x1403858c2
   1403858af:	lea    rdx,[rip+0x125e96a]        # 0x1415e4220
   1403858b6:	lea    rcx,[rbp+0xe0]
   1403858bd:	call   0x14006f4f0
   1403858c2:	xor    r8d,r8d
   1403858c5:	mov    edx,0x6
   1403858ca:	mov    r9b,0x1
   1403858cd:	lea    rcx,[rip+0x22bea0c]        # 0x1426442e0
   1403858d4:	call   0x1400bb0c0
   1403858d9:	xor    r9d,r9d
   1403858dc:	xor    r8d,r8d
   1403858df:	lea    rdx,[rbp+0xe0]
   1403858e6:	lea    rcx,[rip+0x22be9f3]        # 0x1426442e0
   1403858ed:	call   0x140ad69a0
   1403858f2:	nop
   1403858f3:	lea    rcx,[rbp+0xe0]
   1403858fa:	call   0x140067dc0
   1403858ff:	mov    eax,DWORD PTR [rbp-0x64]
   140385902:	mov    DWORD PTR [rbp-0x64],eax
   140385905:	mov    eax,DWORD PTR [rbp-0x74]
   140385908:	mov    DWORD PTR [rbp-0x74],eax
   14038590b:	mov    DWORD PTR [rbp-0x68],r12d
   14038590f:	lea    edi,[rsi+0x1]
   140385912:	lea    eax,[rsi+0x1]
   140385915:	mov    r13d,DWORD PTR [rsp+0x74]
   14038591a:	cmp    eax,r15d
   14038591d:	jl     0x140385a37
   140385923:	cmp    esi,r13d
   140385926:	jge    0x140385a40
   14038592c:	lea    rcx,[rip+0x200585d]        # 0x14238b190
   140385933:	call   0x140e5f4d0
   140385938:	mov    ebx,eax
   14038593a:	mov    rax,QWORD PTR [rbp-0x80]
   14038593e:	mov    rcx,QWORD PTR [rax+0xd8]
   140385945:	test   rcx,rcx
   140385948:	je     0x14038595d
   14038594a:	mov    edx,0x49
   14038594f:	call   0x141339710
   140385954:	xor    ebx,ebx
   140385956:	test   eax,eax
   140385958:	cmovns ebx,eax
   14038595b:	inc    ebx
   14038595d:	test   ebx,ebx
   14038595f:	jle    0x140385a40
   140385965:	lea    edi,[rsi+0x2]
   140385968:	mov    r8d,DWORD PTR [rbp-0x6c]
   14038596c:	add    r8d,0xffffffe7
   140385970:	lea    edx,[rsi+0x1]
   140385973:	lea    rcx,[rip+0x22be966]        # 0x1426442e0
   14038597a:	call   0x1400bb0b0
   14038597f:	lea    rcx,[rbp+0xc0]
   140385986:	call   0x14006f620
   14038598b:	nop
   14038598c:	mov    BYTE PTR [rsp+0x20],0x1
   140385991:	xor    r9d,r9d
   140385994:	mov    rax,QWORD PTR [rbp-0x80]
   140385998:	mov    r8,QWORD PTR [rax+0xc0]
   14038599f:	mov    rdx,QWORD PTR [rax+0xb8]
   1403859a6:	mov    rcx,r14
   1403859a9:	call   0x140c63060
   1403859ae:	mov    edx,eax
   1403859b0:	lea    r8d,[rbx-0x1]
   1403859b4:	lea    rcx,[rbp+0xc0]
   1403859bb:	call   0x14077d340
   1403859c0:	xor    r8d,r8d
   1403859c3:	mov    edx,0x6
   1403859c8:	mov    r9b,0x1
   1403859cb:	lea    rcx,[rip+0x22be90e]        # 0x1426442e0
   1403859d2:	call   0x1400bb0c0
   1403859d7:	lea    rdx,[rip+0x12736ea]        # 0x1415f90c8
   1403859de:	lea    rcx,[rbp+0xe0]
   1403859e5:	call   0x1400680e0
   1403859ea:	nop
   1403859eb:	xor    r9d,r9d
   1403859ee:	mov    r8b,0x3
   1403859f1:	lea    rdx,[rbp+0xe0]
   1403859f8:	lea    rcx,[rip+0x22be8e1]        # 0x1426442e0
   1403859ff:	call   0x140ad69a0
   140385a04:	nop
   140385a05:	lea    rcx,[rbp+0xe0]
   140385a0c:	call   0x140067dc0
   140385a11:	xor    r9d,r9d
   140385a14:	xor    r8d,r8d
   140385a17:	lea    rdx,[rbp+0xc0]
   140385a1e:	lea    rcx,[rip+0x22be8bb]        # 0x1426442e0
   140385a25:	call   0x140ad69a0
   140385a2a:	nop
   140385a2b:	lea    rcx,[rbp+0xc0]
   140385a32:	call   0x140067dc0
   140385a37:	cmp    edi,r15d
   140385a3a:	jl     0x140385af0
   140385a40:	cmp    edi,r13d
   140385a43:	jg     0x140385af0
   140385a49:	mov    r8d,DWORD PTR [rbp-0x6c]
   140385a4d:	add    r8d,0xffffffe7
   140385a51:	mov    edx,edi
   140385a53:	lea    rcx,[rip+0x22be886]        # 0x1426442e0
   140385a5a:	call   0x1400bb0b0
   140385a5f:	xor    r8d,r8d
   140385a62:	mov    edx,0x7
   140385a67:	mov    r9b,0x1
   140385a6a:	lea    rcx,[rip+0x22be86f]        # 0x1426442e0
   140385a71:	call   0x1400bb0c0
   140385a76:	lea    rdx,[rip+0x1273653]        # 0x1415f90d0
   140385a7d:	lea    rcx,[rbp+0xe0]
   140385a84:	call   0x1400680e0
   140385a89:	nop
   140385a8a:	lea    rcx,[rbp+0xc0]
   140385a91:	call   0x14006f620
   140385a96:	nop
   140385a97:	lea    rdx,[rbp+0xc0]
   140385a9e:	mov    rcx,r14
   140385aa1:	call   0x14014d870
   140385aa6:	lea    rdx,[rbp+0xc0]
   140385aad:	lea    rcx,[rbp+0xe0]
   140385ab4:	call   0x1400b9ca0
   140385ab9:	xor    r9d,r9d
   140385abc:	xor    r8d,r8d
   140385abf:	lea    rdx,[rbp+0xe0]
   140385ac6:	lea    rcx,[rip+0x22be813]        # 0x1426442e0
   140385acd:	call   0x140ad69a0
   140385ad2:	nop
   140385ad3:	lea    rcx,[rbp+0xc0]
   140385ada:	call   0x140067dc0
   140385adf:	nop
   140385ae0:	lea    rcx,[rbp+0xe0]
   140385ae7:	call   0x140067dc0
   140385aec:	nop    DWORD PTR [rax+0x0]
   140385af0:	mov    esi,DWORD PTR [rbp-0x6c]
   140385af3:	add    esi,0xfffffffc
   140385af6:	mov    ebx,DWORD PTR [rsp+0x7c]
   140385afa:	lea    rdi,[rip+0x22c98af]        # 0x14264f3b0
   140385b01:	lea    rax,[rip+0x22c98b4]        # 0x14264f3bc
   140385b08:	nop    DWORD PTR [rax+rax*1+0x0]
   140385b10:	cmp    ebx,r15d
   140385b13:	jl     0x140385bb2
   140385b19:	cmp    ebx,r13d
   140385b1c:	jg     0x140385bb2
   140385b22:	mov    DWORD PTR [rip+0x22be83c],esi        # 0x142644364
   140385b28:	mov    DWORD PTR [rip+0x22be83a],ebx        # 0x142644368
   140385b2e:	mov    rax,QWORD PTR [rbp+0x50]
   140385b32:	xor    r8d,r8d
   140385b35:	lea    rcx,[rip+0x22be7a4]        # 0x1426442e0
   140385b3c:	test   BYTE PTR [rax],0x1
   140385b3f:	je     0x140385b46
   140385b41:	mov    edx,DWORD PTR [rdi-0x30]
   140385b44:	jmp    0x140385b49
   140385b46:	mov    edx,DWORD PTR [rdi-0xc]
   140385b49:	call   0x140ad8140
   140385b4e:	lea    eax,[rsi+0x1]
   140385b51:	mov    DWORD PTR [rip+0x22be811],ebx        # 0x142644368
   140385b57:	mov    DWORD PTR [rip+0x22be807],eax        # 0x142644364
   140385b5d:	mov    rax,QWORD PTR [rbp+0x50]
   140385b61:	xor    r8d,r8d
   140385b64:	lea    rcx,[rip+0x22be775]        # 0x1426442e0
   140385b6b:	test   BYTE PTR [rax],0x1
   140385b6e:	je     0x140385b75
   140385b70:	mov    edx,DWORD PTR [rdi-0x24]
   140385b73:	jmp    0x140385b77
   140385b75:	mov    edx,DWORD PTR [rdi]
   140385b77:	call   0x140ad8140
   140385b7c:	lea    eax,[rsi+0x2]
   140385b7f:	mov    DWORD PTR [rip+0x22be7e3],ebx        # 0x142644368
   140385b85:	mov    DWORD PTR [rip+0x22be7d9],eax        # 0x142644364
   140385b8b:	mov    rax,QWORD PTR [rbp+0x50]
   140385b8f:	xor    r8d,r8d
   140385b92:	lea    rcx,[rip+0x22be747]        # 0x1426442e0
   140385b99:	test   BYTE PTR [rax],0x1
   140385b9c:	je     0x140385ba3
   140385b9e:	mov    edx,DWORD PTR [rdi-0x18]
   140385ba1:	jmp    0x140385ba6
   140385ba3:	mov    edx,DWORD PTR [rdi+0xc]
   140385ba6:	call   0x140ad8140
   140385bab:	lea    rax,[rip+0x22c980a]        # 0x14264f3bc
   140385bb2:	inc    ebx
   140385bb4:	add    rdi,0x4
   140385bb8:	cmp    rdi,rax
   140385bbb:	jl     0x140385b10
   140385bc1:	mov    esi,DWORD PTR [rsp+0x7c]
   140385bc5:	mov    r13,QWORD PTR [rbp+0x8]
   140385bc9:	mov    rbx,QWORD PTR [rbp-0x50]
   140385bcd:	add    esi,0x3
   140385bd0:	mov    DWORD PTR [rsp+0x7c],esi
   140385bd4:	add    rbx,0x3
   140385bd8:	mov    QWORD PTR [rbp-0x50],rbx
   140385bdc:	cmp    rbx,r13
   140385bdf:	jg     0x140385c07
   140385be1:	movzx  ebx,BYTE PTR [rsp+0x78]
   140385be6:	jmp    0x140385bee
   140385be8:	xor    bl,bl
   140385bea:	mov    BYTE PTR [rsp+0x78],bl
   140385bee:	mov    rax,QWORD PTR [rbp-0x10]
   140385bf2:	add    rax,0x8
   140385bf6:	mov    QWORD PTR [rbp-0x10],rax
   140385bfa:	inc    QWORD PTR [rbp+0x50]
   140385bfe:	jmp    0x140385314
   140385c03:	mov    rbx,QWORD PTR [rbp-0x50]
   140385c07:	mov    r14,QWORD PTR [rbp-0x40]
   140385c0b:	add    QWORD PTR [rbp+0x28],0x4
   140385c10:	add    QWORD PTR [rbp-0x28],0x4
   140385c15:	lea    rcx,[rbp+0xb0]
   140385c1c:	call   0x14013c150
   140385c21:	lea    rcx,[rbp+0x160]
   140385c28:	call   0x14013c150
   140385c2d:	add    QWORD PTR [rbp-0x18],0x4
   140385c32:	mov    r15d,DWORD PTR [rsp+0x74]
   140385c37:	jmp    0x140384f50
   140385c3c:	mov    r15d,DWORD PTR [rbp-0x6c]
   140385c40:	mov    rsi,QWORD PTR [rbp+0x38]
   140385c44:	mov    r14,QWORD PTR [rbp-0x80]
   140385c48:	mov    eax,DWORD PTR [rbp+0x30]
   140385c4b:	mov    r13d,DWORD PTR [rbp-0x70]
   140385c4f:	cmp    DWORD PTR [r14+rsi*4+0x170],eax
   140385c57:	jle    0x140385ce2
   140385c5d:	lea    edi,[r13+0x4]
   140385c61:	mov    r12d,DWORD PTR [rbp+0x40]
   140385c65:	lea    ebx,[r12*2-0x2]
   140385c6d:	add    ebx,r13d
   140385c70:	add    ebx,r12d
   140385c73:	lea    rcx,[rbp+0xc0]
   140385c7a:	call   0x1400bb2f0
   140385c7f:	lea    eax,[r12-0x1]
   140385c84:	lea    eax,[rax+rax*2]
   140385c87:	mov    r9d,DWORD PTR [r14+rsi*4+0x170]
   140385c8f:	dec    r9d
   140385c92:	mov    DWORD PTR [rsp+0x30],ebx
   140385c96:	mov    DWORD PTR [rsp+0x28],edi
   140385c9a:	mov    DWORD PTR [rsp+0x20],eax
   140385c9e:	xor    r8d,r8d
   140385ca1:	mov    edx,DWORD PTR [r14+rsi*4+0x328]
   140385ca9:	lea    rcx,[rbp+0xc0]
   140385cb0:	call   0x1400bb310
   140385cb5:	lea    r9d,[r15+0x1]
   140385cb9:	mov    DWORD PTR [rsp+0x28],0x0
   140385cc1:	movzx  eax,BYTE PTR [r14+rsi*1+0x330]
   140385cca:	mov    BYTE PTR [rsp+0x20],al
   140385cce:	mov    r8d,DWORD PTR [rbp+0x18]
   140385cd2:	mov    edx,DWORD PTR [rbp+0x14]
   140385cd5:	lea    rcx,[rbp+0xc0]
   140385cdc:	call   0x14140a440
   140385ce1:	nop
   140385ce2:	lea    rcx,[rbp+0x120]
   140385ce9:	call   0x140067dc0
   140385cee:	jmp    0x140384c4b
   140385cf3:	mov    edi,DWORD PTR [rbp-0x20]
   140385cf6:	lea    rcx,[r14+0x68]
   140385cfa:	call   0x14006f4b0
   140385cff:	test   al,al
   140385d01:	jne    0x140385d46
   140385d03:	xor    r8d,r8d
   140385d06:	mov    edx,0x7
   140385d0b:	mov    r9b,0x1
   140385d0e:	lea    rcx,[rip+0x22be5cb]        # 0x1426442e0
   140385d15:	call   0x1400bb0c0
   140385d1a:	mov    r8d,DWORD PTR [rbp-0x48]
   140385d1e:	add    r8d,0x2
   140385d22:	mov    edx,edi
   140385d24:	lea    rcx,[rip+0x22be5b5]        # 0x1426442e0
   140385d2b:	call   0x1400bb0b0
   140385d30:	xor    r9d,r9d
   140385d33:	xor    r8d,r8d
   140385d36:	lea    rdx,[r14+0x68]
   140385d3a:	lea    rcx,[rip+0x22be59f]        # 0x1426442e0
   140385d41:	call   0x140ad69a0
   140385d46:	lea    rcx,[rip+0x2005443]        # 0x14238b190
   140385d4d:	call   0x140e5f4d0
   140385d52:	mov    DWORD PTR [rsp+0x7c],eax
   140385d56:	mov    BYTE PTR [rbp-0x64],0x1
   140385d5a:	mov    rdx,QWORD PTR [r14+0xb8]
   140385d61:	mov    rcx,QWORD PTR [rdx]
   140385d64:	mov    QWORD PTR [rbp-0x8],rcx
   140385d68:	mov    rcx,QWORD PTR [rdx]
   140385d6b:	mov    QWORD PTR [rbp+0x48],rcx
   140385d6f:	xor    r10d,r10d
   140385d72:	mov    DWORD PTR [rbp-0x68],r10d
   140385d76:	mov    DWORD PTR [rsp+0x74],r10d
   140385d7b:	mov    DWORD PTR [rbp-0x74],r10d
   140385d7f:	mov    DWORD PTR [rbp-0x6c],r10d
   140385d83:	mov    DWORD PTR [rbp-0x58],r10d
   140385d87:	lea    r13,[r14+0xe0]
   140385d8e:	mov    QWORD PTR [rbp-0x40],r13
   140385d92:	mov    rax,QWORD PTR [r13+0x8]
   140385d96:	sub    rax,QWORD PTR [r13+0x0]
   140385d9a:	sar    rax,0x3
   140385d9e:	test   rax,rax
   140385da1:	je     0x140386578
   140385da7:	mov    esi,r10d
   140385daa:	mov    QWORD PTR [rbp-0x38],r10
   140385dae:	mov    r15d,r10d
   140385db1:	mov    QWORD PTR [rbp+0x0],r10
   140385db5:	mov    r12d,r10d
   140385db8:	mov    QWORD PTR [rbp-0x28],r10
   140385dbc:	mov    r14d,r10d
   140385dbf:	mov    QWORD PTR [rbp+0x8],r10
   140385dc3:	nop    DWORD PTR [rax+0x0]
   140385dc7:	nop    WORD PTR [rax+rax*1+0x0]
   140385dd0:	mov    edi,r10d
   140385dd3:	mov    rdx,r15
   140385dd6:	mov    rcx,r13
   140385dd9:	call   0x14006f1b0
   140385dde:	mov    rcx,QWORD PTR [rax]
   140385de1:	add    rcx,0x38
   140385de5:	call   0x14006ede0
   140385dea:	test   rax,rax
   140385ded:	je     0x140385e3e
   140385def:	xor    ebx,ebx
   140385df1:	mov    rdx,r15
   140385df4:	mov    rcx,r13
   140385df7:	call   0x14006f1b0
   140385dfc:	mov    rcx,QWORD PTR [rax]
   140385dff:	add    rcx,0x38
   140385e03:	mov    rdx,rbx
   140385e06:	call   0x14006f1b0
   140385e0b:	mov    rcx,QWORD PTR [rax]
   140385e0e:	mov    rax,QWORD PTR [rcx]
   140385e11:	call   QWORD PTR [rax+0x10]
   140385e14:	cmp    eax,0xb
   140385e17:	je     0x14038642a
   140385e1d:	inc    edi
   140385e1f:	mov    rdx,r15
   140385e22:	mov    rcx,r13
   140385e25:	call   0x14006f1b0
   140385e2a:	movsxd rbx,edi
   140385e2d:	mov    rcx,QWORD PTR [rax]
   140385e30:	add    rcx,0x38
   140385e34:	call   0x14006ede0
   140385e39:	cmp    rbx,rax
   140385e3c:	jb     0x140385df1
   140385e3e:	mov    rdx,r15
   140385e41:	lea    rcx,[rip+0x1516448]        # 0x14189c290
   140385e48:	call   0x1401b9f30
   140385e4d:	mov    rdx,r15
   140385e50:	test   BYTE PTR [rax],0x1
   140385e53:	je     0x140386044
   140385e59:	lea    rcx,[rip+0x1516400]        # 0x14189c260
   140385e60:	call   0x14006f1b0
   140385e65:	mov    rcx,QWORD PTR [rax]
   140385e68:	mov    rax,QWORD PTR [rcx]
   140385e6b:	call   QWORD PTR [rax]
   140385e6d:	mov    rdx,QWORD PTR [rip+0x15163ec]        # 0x14189c260
   140385e74:	cmp    ax,0x20
   140385e78:	jne    0x140386339
   140385e7e:	xor    r8d,r8d
   140385e81:	mov    edi,r8d
   140385e84:	mov    DWORD PTR [rbp-0x60],r8d
   140385e88:	mov    rax,QWORD PTR [r12+rdx*1]
   140385e8c:	mov    rcx,QWORD PTR [rax+0x40]
   140385e90:	sub    rcx,QWORD PTR [rax+0x38]
   140385e94:	sar    rcx,0x3
   140385e98:	test   rcx,rcx
   140385e9b:	je     0x140386339
   140385ea1:	mov    ebx,r8d
   140385ea4:	mov    r13d,r8d
   140385ea7:	nop    WORD PTR [rax+rax*1+0x0]
   140385eb0:	mov    rdx,r15
   140385eb3:	lea    rcx,[rip+0x15163a6]        # 0x14189c260
   140385eba:	call   0x14006f1b0
   140385ebf:	mov    rcx,QWORD PTR [rax]
   140385ec2:	add    rcx,0x38
   140385ec6:	mov    rdx,rbx
   140385ec9:	call   0x14006f1b0
   140385ece:	mov    rcx,QWORD PTR [rax]
   140385ed1:	mov    rax,QWORD PTR [rcx]
   140385ed4:	call   QWORD PTR [rax+0x10]
   140385ed7:	mov    rdx,QWORD PTR [rip+0x1516382]        # 0x14189c260
   140385ede:	cmp    eax,0xa
   140385ee1:	jne    0x14038601a
   140385ee7:	xor    r8d,r8d
   140385eea:	mov    r12d,r8d
   140385eed:	mov    r14d,r8d
   140385ef0:	mov    rax,QWORD PTR [rip+0x1516371]        # 0x14189c268
   140385ef7:	sub    rax,rdx
   140385efa:	sar    rax,0x3
   140385efe:	test   rax,rax
   140385f01:	je     0x14038601a
   140385f07:	mov    r15d,r8d
   140385f0a:	nop    WORD PTR [rax+rax*1+0x0]
   140385f10:	mov    rax,QWORD PTR [rip+0x1516379]        # 0x14189c290
   140385f17:	test   BYTE PTR [r14+rax*1],0x1
   140385f1c:	jne    0x140385f66
   140385f1e:	mov    rdi,QWORD PTR [rdx+r14*8]
   140385f22:	mov    rax,QWORD PTR [rdx+rsi*8]
   140385f26:	mov    rax,QWORD PTR [rax+0x38]
   140385f2a:	mov    rcx,QWORD PTR [rax+r13*1]
   140385f2e:	mov    rax,QWORD PTR [rcx]
   140385f31:	call   QWORD PTR [rax+0x60]
   140385f34:	cmp    DWORD PTR [rdi+0x1c],eax
   140385f37:	jne    0x140385fec
   140385f3d:	mov    rcx,rdi
   140385f40:	call   0x14030a710
   140385f45:	mov    ebx,eax
   140385f47:	neg    ebx
   140385f49:	mov    rcx,rdi
   140385f4c:	call   0x14030a6e0
   140385f51:	neg    eax
   140385f53:	mov    r8d,ebx
   140385f56:	mov    edx,eax
   140385f58:	lea    rcx,[rbp-0x8]
   140385f5c:	call   0x14030a2c0
   140385f61:	jmp    0x140385fec
   140385f66:	mov    rax,QWORD PTR [rip+0x1516353]        # 0x14189c2c0
   140385f6d:	cmp    DWORD PTR [rax+r14*4],0x0
   140385f72:	jle    0x140385ff3
   140385f74:	mov    rdx,r15
   140385f77:	lea    rcx,[rip+0x15162e2]        # 0x14189c260
   140385f7e:	call   0x14006f1b0
   140385f83:	mov    rsi,QWORD PTR [rax]
   140385f86:	mov    rax,QWORD PTR [rsi]
   140385f89:	mov    rcx,rsi
   140385f8c:	call   QWORD PTR [rax+0x478]
   140385f92:	mov    edi,eax
   140385f94:	mov    rcx,QWORD PTR [rsi]
   140385f97:	mov    rbx,QWORD PTR [rcx+0x488]
   140385f9e:	mov    rdx,r15
   140385fa1:	lea    rcx,[rip+0x1516318]        # 0x14189c2c0
   140385fa8:	call   0x14006f2f0
   140385fad:	mov    edx,edi
   140385faf:	sub    edx,DWORD PTR [rax]
   140385fb1:	mov    rcx,rsi
   140385fb4:	call   rbx
   140385fb6:	mov    rcx,rsi
   140385fb9:	call   0x14030a710
   140385fbe:	mov    ebx,eax
   140385fc0:	neg    ebx
   140385fc2:	mov    rcx,rsi
   140385fc5:	call   0x14030a6e0
   140385fca:	neg    eax
   140385fcc:	mov    r8d,ebx
   140385fcf:	mov    edx,eax
   140385fd1:	lea    rcx,[rbp-0x8]
   140385fd5:	call   0x14030a2c0
   140385fda:	mov    rax,QWORD PTR [rsi]
   140385fdd:	mov    edx,edi
   140385fdf:	mov    rcx,rsi
   140385fe2:	call   QWORD PTR [rax+0x488]
   140385fe8:	mov    rsi,QWORD PTR [rbp-0x38]
   140385fec:	mov    rdx,QWORD PTR [rip+0x151626d]        # 0x14189c260
   140385ff3:	inc    r12d
   140385ff6:	inc    r14
   140385ff9:	movsxd r15,r12d
   140385ffc:	mov    rax,QWORD PTR [rip+0x1516265]        # 0x14189c268
   140386003:	sub    rax,rdx
   140386006:	sar    rax,0x3
   14038600a:	cmp    r15,rax
   14038600d:	jb     0x140385f10
   140386013:	mov    r15,QWORD PTR [rbp+0x0]
   140386017:	mov    edi,DWORD PTR [rbp-0x60]
   14038601a:	inc    edi
   14038601c:	mov    DWORD PTR [rbp-0x60],edi
   14038601f:	add    r13,0x8
   140386023:	mov    rcx,QWORD PTR [rdx+rsi*8]
   140386027:	movsxd rbx,edi
   14038602a:	mov    rax,QWORD PTR [rcx+0x40]
   14038602e:	sub    rax,QWORD PTR [rcx+0x38]
   140386032:	sar    rax,0x3
   140386036:	cmp    rbx,rax
   140386039:	jb     0x140385eb0
   14038603f:	jmp    0x140386331
   140386044:	lea    rcx,[rip+0x1516275]        # 0x14189c2c0
   14038604b:	call   0x14006f2f0
   140386050:	mov    rdx,r15
   140386053:	lea    rcx,[rip+0x1516206]        # 0x14189c260
   14038605a:	cmp    DWORD PTR [rax],0x0
   14038605d:	jle    0x14038610d
   140386063:	call   0x14006f1b0
   140386068:	mov    rcx,QWORD PTR [rax]
   14038606b:	mov    rax,QWORD PTR [rcx]
   14038606e:	call   QWORD PTR [rax+0x478]
   140386074:	mov    esi,eax
   140386076:	mov    rdx,r15
   140386079:	lea    rcx,[rip+0x15161e0]        # 0x14189c260
   140386080:	call   0x14006f1b0
   140386085:	mov    rdi,QWORD PTR [rax]
   140386088:	mov    rdx,QWORD PTR [rdi]
   14038608b:	mov    rbx,QWORD PTR [rdx+0x488]
   140386092:	mov    rdx,r15
   140386095:	lea    rcx,[rip+0x1516224]        # 0x14189c2c0
   14038609c:	call   0x14006f2f0
   1403860a1:	mov    edx,DWORD PTR [rax]
   1403860a3:	mov    rcx,rdi
   1403860a6:	call   rbx
   1403860a8:	mov    rdx,r15
   1403860ab:	lea    rcx,[rip+0x15161ae]        # 0x14189c260
   1403860b2:	call   0x14006f1b0
   1403860b7:	mov    rcx,QWORD PTR [rax]
   1403860ba:	call   0x14030a710
   1403860bf:	mov    ebx,eax
   1403860c1:	neg    ebx
   1403860c3:	mov    rdx,r15
   1403860c6:	lea    rcx,[rip+0x1516193]        # 0x14189c260
   1403860cd:	call   0x14006f1b0
   1403860d2:	mov    rcx,QWORD PTR [rax]
   1403860d5:	call   0x14030a6e0
   1403860da:	neg    eax
   1403860dc:	mov    r8d,ebx
   1403860df:	mov    edx,eax
   1403860e1:	lea    rcx,[rbp-0x8]
   1403860e5:	call   0x14030a2c0
   1403860ea:	mov    rdx,r15
   1403860ed:	lea    rcx,[rip+0x151616c]        # 0x14189c260
   1403860f4:	call   0x14006f1b0
   1403860f9:	mov    rcx,QWORD PTR [rax]
   1403860fc:	mov    rax,QWORD PTR [rcx]
   1403860ff:	mov    edx,esi
   140386101:	call   QWORD PTR [rax+0x488]
   140386107:	mov    rsi,QWORD PTR [rbp-0x38]
   14038610b:	jmp    0x140386145
   14038610d:	call   0x14006f1b0
   140386112:	mov    rcx,QWORD PTR [rax]
   140386115:	call   0x14030a710
   14038611a:	mov    ebx,eax
   14038611c:	neg    ebx
   14038611e:	mov    rdx,r15
   140386121:	lea    rcx,[rip+0x1516138]        # 0x14189c260
   140386128:	call   0x14006f1b0
   14038612d:	mov    rcx,QWORD PTR [rax]
   140386130:	call   0x14030a6e0
   140386135:	neg    eax
   140386137:	mov    r8d,ebx
   14038613a:	mov    edx,eax
   14038613c:	lea    rcx,[rbp-0x8]
   140386140:	call   0x14030a2c0
   140386145:	mov    rdx,r15
   140386148:	lea    rcx,[rip+0x1516111]        # 0x14189c260
   14038614f:	call   0x14006f1b0
   140386154:	mov    rcx,QWORD PTR [rax]
   140386157:	mov    rax,QWORD PTR [rcx]
   14038615a:	call   QWORD PTR [rax]
   14038615c:	mov    rdx,QWORD PTR [rip+0x15160fd]        # 0x14189c260
   140386163:	cmp    ax,0x20
   140386167:	jne    0x140386339
   14038616d:	xor    r8d,r8d
   140386170:	mov    edi,r8d
   140386173:	mov    DWORD PTR [rbp-0x60],r8d
   140386177:	mov    rax,QWORD PTR [rdx+r14*1]
   14038617b:	mov    rcx,QWORD PTR [rax+0x40]
   14038617f:	sub    rcx,QWORD PTR [rax+0x38]
   140386183:	sar    rcx,0x3
   140386187:	test   rcx,rcx
   14038618a:	je     0x140386339
   140386190:	mov    ebx,r8d
   140386193:	mov    r13d,r8d
   140386196:	lea    rax,[rsi*8+0x0]
   14038619e:	mov    QWORD PTR [rbp+0x60],rax
   1403861a2:	nop    DWORD PTR [rax+0x0]
   1403861a6:	data16 nop WORD PTR [rax+rax*1+0x0]
   1403861b0:	mov    rdx,r15
   1403861b3:	lea    rcx,[rip+0x15160a6]        # 0x14189c260
   1403861ba:	call   0x14006f1b0
   1403861bf:	mov    rcx,QWORD PTR [rax]
   1403861c2:	add    rcx,0x38
   1403861c6:	mov    rdx,rbx
   1403861c9:	call   0x14006f1b0
   1403861ce:	mov    rcx,QWORD PTR [rax]
   1403861d1:	mov    rax,QWORD PTR [rcx]
   1403861d4:	call   QWORD PTR [rax+0x10]
   1403861d7:	mov    rdx,QWORD PTR [rip+0x1516082]        # 0x14189c260
   1403861de:	cmp    eax,0xa
   1403861e1:	jne    0x140386304
   1403861e7:	xor    r8d,r8d
   1403861ea:	mov    r12d,r8d
   1403861ed:	mov    r14d,r8d
   1403861f0:	mov    rax,QWORD PTR [rip+0x1516071]        # 0x14189c268
   1403861f7:	sub    rax,rdx
   1403861fa:	sar    rax,0x3
   1403861fe:	test   rax,rax
   140386201:	je     0x140386304
   140386207:	mov    r15d,r8d
   14038620a:	nop    WORD PTR [rax+rax*1+0x0]
   140386210:	mov    rax,QWORD PTR [rip+0x1516079]        # 0x14189c290
   140386217:	test   BYTE PTR [r14+rax*1],0x1
   14038621c:	je     0x1403862dd
   140386222:	mov    rsi,QWORD PTR [rdx+r14*8]
   140386226:	mov    rax,QWORD PTR [rbp-0x38]
   14038622a:	mov    rax,QWORD PTR [rdx+rax*8]
   14038622e:	mov    rax,QWORD PTR [rax+0x38]
   140386232:	mov    rcx,QWORD PTR [rax+r13*1]
   140386236:	mov    rax,QWORD PTR [rcx]
   140386239:	call   QWORD PTR [rax+0x60]
   14038623c:	cmp    DWORD PTR [rsi+0x1c],eax
   14038623f:	jne    0x1403862d6
   140386245:	mov    rdx,r15
   140386248:	lea    rcx,[rip+0x1516071]        # 0x14189c2c0
   14038624f:	call   0x14006f2f0
   140386254:	mov    rcx,rsi
   140386257:	cmp    DWORD PTR [rax],0x0
   14038625a:	jle    0x1403862b9
   14038625c:	mov    rax,QWORD PTR [rsi]
   14038625f:	call   QWORD PTR [rax+0x478]
   140386265:	mov    edi,eax
   140386267:	mov    rcx,QWORD PTR [rsi]
   14038626a:	mov    rbx,QWORD PTR [rcx+0x488]
   140386271:	mov    rdx,r15
   140386274:	lea    rcx,[rip+0x1516045]        # 0x14189c2c0
   14038627b:	call   0x14006f2f0
   140386280:	mov    edx,edi
   140386282:	sub    edx,DWORD PTR [rax]
   140386284:	mov    rcx,rsi
   140386287:	call   rbx
   140386289:	mov    rcx,rsi
   14038628c:	call   0x14030a710
   140386291:	mov    ebx,eax
   140386293:	mov    rcx,rsi
   140386296:	call   0x14030a6e0
   14038629b:	mov    r8d,ebx
   14038629e:	mov    edx,eax
   1403862a0:	lea    rcx,[rbp-0x8]
   1403862a4:	call   0x14030a2c0
   1403862a9:	mov    rax,QWORD PTR [rsi]
   1403862ac:	mov    edx,edi
   1403862ae:	mov    rcx,rsi
   1403862b1:	call   QWORD PTR [rax+0x488]
   1403862b7:	jmp    0x1403862d6
   1403862b9:	call   0x14030a710
   1403862be:	mov    ebx,eax
   1403862c0:	mov    rcx,rsi
   1403862c3:	call   0x14030a6e0
   1403862c8:	mov    r8d,ebx
   1403862cb:	mov    edx,eax
   1403862cd:	lea    rcx,[rbp-0x8]
   1403862d1:	call   0x14030a2c0
   1403862d6:	mov    rdx,QWORD PTR [rip+0x1515f83]        # 0x14189c260
   1403862dd:	inc    r12d
   1403862e0:	inc    r14
   1403862e3:	movsxd r15,r12d
   1403862e6:	mov    rax,QWORD PTR [rip+0x1515f7b]        # 0x14189c268
   1403862ed:	sub    rax,rdx
   1403862f0:	sar    rax,0x3
   1403862f4:	cmp    r15,rax
   1403862f7:	jb     0x140386210
   1403862fd:	mov    r15,QWORD PTR [rbp+0x0]
   140386301:	mov    edi,DWORD PTR [rbp-0x60]
   140386304:	inc    edi
   140386306:	mov    DWORD PTR [rbp-0x60],edi
   140386309:	add    r13,0x8
   14038630d:	mov    rax,QWORD PTR [rbp+0x60]
   140386311:	mov    rcx,QWORD PTR [rdx+rax*1]
   140386315:	movsxd rbx,edi
   140386318:	mov    rax,QWORD PTR [rcx+0x40]
   14038631c:	sub    rax,QWORD PTR [rcx+0x38]
   140386320:	sar    rax,0x3
   140386324:	cmp    rbx,rax
   140386327:	jb     0x1403861b0
   14038632d:	mov    rsi,QWORD PTR [rbp-0x38]
   140386331:	mov    r12,QWORD PTR [rbp-0x28]
   140386335:	mov    r13,QWORD PTR [rbp-0x40]
   140386339:	mov    rax,QWORD PTR [rip+0x1515f80]        # 0x14189c2c0
   140386340:	cmp    DWORD PTR [rax+rsi*4],0x0
   140386344:	jle    0x1403863e3
   14038634a:	mov    rcx,QWORD PTR [rdx+rsi*8]
   14038634e:	mov    rax,QWORD PTR [rcx]
   140386351:	call   QWORD PTR [rax+0x478]
   140386357:	mov    r14d,eax
   14038635a:	mov    rcx,QWORD PTR [rip+0x1515eff]        # 0x14189c260
   140386361:	mov    rcx,QWORD PTR [rcx+rsi*8]
   140386365:	mov    rdx,QWORD PTR [rcx]
   140386368:	mov    r8,QWORD PTR [rdx+0x488]
   14038636f:	mov    rdx,QWORD PTR [rip+0x1515f4a]        # 0x14189c2c0
   140386376:	mov    edx,DWORD PTR [rdx+rsi*4]
   140386379:	call   r8
   14038637c:	mov    rbx,QWORD PTR [rip+0x1515edd]        # 0x14189c260
   140386383:	mov    rdi,QWORD PTR [rbx+rsi*8]
   140386387:	test   DWORD PTR [rdi+0x10],0x20000000
   14038638e:	jne    0x14038639f
   140386390:	mov    rcx,rdi
   140386393:	call   0x140c62f50
   140386398:	mov    rbx,QWORD PTR [rip+0x1515ec1]        # 0x14189c260
   14038639f:	mov    edi,DWORD PTR [rdi+0x78]
   1403863a2:	neg    edi
   1403863a4:	mov    rbx,QWORD PTR [rbx+rsi*8]
   1403863a8:	test   DWORD PTR [rbx+0x10],0x20000000
   1403863af:	jne    0x1403863b9
   1403863b1:	mov    rcx,rbx
   1403863b4:	call   0x140c62f50
   1403863b9:	mov    edx,DWORD PTR [rbx+0x74]
   1403863bc:	neg    edx
   1403863be:	mov    r8d,edi
   1403863c1:	lea    rcx,[rbp+0x48]
   1403863c5:	call   0x14030a2c0
   1403863ca:	mov    rax,QWORD PTR [rip+0x1515e8f]        # 0x14189c260
   1403863d1:	mov    rcx,QWORD PTR [rax+rsi*8]
   1403863d5:	mov    rax,QWORD PTR [rcx]
   1403863d8:	mov    edx,r14d
   1403863db:	call   QWORD PTR [rax+0x488]
   1403863e1:	jmp    0x14038642a
   1403863e3:	mov    rbx,QWORD PTR [rdx+rsi*8]
   1403863e7:	test   DWORD PTR [rbx+0x10],0x20000000
   1403863ee:	jne    0x1403863ff
   1403863f0:	mov    rcx,rbx
   1403863f3:	call   0x140c62f50
   1403863f8:	mov    rdx,QWORD PTR [rip+0x1515e61]        # 0x14189c260
   1403863ff:	mov    edi,DWORD PTR [rbx+0x78]
   140386402:	neg    edi
   140386404:	mov    rbx,QWORD PTR [rdx+rsi*8]
   140386408:	test   DWORD PTR [rbx+0x10],0x20000000
   14038640f:	jne    0x140386419
   140386411:	mov    rcx,rbx
   140386414:	call   0x140c62f50
   140386419:	mov    edx,DWORD PTR [rbx+0x74]
   14038641c:	neg    edx
   14038641e:	mov    r8d,edi
   140386421:	lea    rcx,[rbp+0x48]
   140386425:	call   0x14030a2c0
   14038642a:	mov    rdi,QWORD PTR [rbp-0x80]
   14038642e:	mov    rax,QWORD PTR [rdi+0x110]
   140386435:	test   BYTE PTR [rsi+rax*1],0x1
   140386439:	je     0x14038652f
   14038643f:	lea    r14,[rdi+0x140]
   140386446:	lea    rcx,[rdi+0xe0]
   14038644d:	mov    rax,QWORD PTR [r14]
   140386450:	mov    rdx,r15
   140386453:	cmp    DWORD PTR [rax+rsi*4],0x0
   140386457:	jle    0x1403864f9
   14038645d:	call   0x14006f1b0
   140386462:	mov    rcx,QWORD PTR [rax]
   140386465:	mov    rax,QWORD PTR [rcx]
   140386468:	call   QWORD PTR [rax+0x478]
   14038646e:	mov    esi,eax
   140386470:	mov    rdx,r15
   140386473:	mov    rcx,r13
   140386476:	call   0x14006f1b0
   14038647b:	mov    rdi,QWORD PTR [rax]
   14038647e:	mov    rdx,QWORD PTR [rdi]
   140386481:	mov    rbx,QWORD PTR [rdx+0x488]
   140386488:	mov    rdx,r15
   14038648b:	mov    rcx,r14
   14038648e:	call   0x14006f2f0
   140386493:	mov    edx,DWORD PTR [rax]
   140386495:	mov    rcx,rdi
   140386498:	call   rbx
   14038649a:	mov    rdx,r15
   14038649d:	mov    rcx,r13
   1403864a0:	call   0x14006f1b0
   1403864a5:	mov    BYTE PTR [rsp+0x20],0x1
   1403864aa:	xor    r9d,r9d
   1403864ad:	mov    rcx,QWORD PTR [rbp-0x80]
   1403864b1:	mov    r8,QWORD PTR [rcx+0xc0]
   1403864b8:	mov    rdx,QWORD PTR [rcx+0xb8]
   1403864bf:	mov    rcx,QWORD PTR [rax]
   1403864c2:	call   0x140c63060
   1403864c7:	add    DWORD PTR [rbp-0x68],eax
   1403864ca:	mov    edx,DWORD PTR [rsp+0x7c]
   1403864ce:	dec    edx
   1403864d0:	mov    ecx,eax
   1403864d2:	call   0x14077d160
   1403864d7:	add    DWORD PTR [rbp-0x74],eax
   1403864da:	mov    rdx,r15
   1403864dd:	mov    rcx,r13
   1403864e0:	call   0x14006f1b0
   1403864e5:	mov    rcx,QWORD PTR [rax]
   1403864e8:	mov    rax,QWORD PTR [rcx]
   1403864eb:	mov    edx,esi
   1403864ed:	call   QWORD PTR [rax+0x488]
   1403864f3:	mov    rsi,QWORD PTR [rbp-0x38]
   1403864f7:	jmp    0x14038652f
   1403864f9:	call   0x14006f1b0
   1403864fe:	mov    BYTE PTR [rsp+0x20],0x1
   140386503:	xor    r9d,r9d
   140386506:	mov    r8,QWORD PTR [rdi+0xc0]
   14038650d:	mov    rdx,QWORD PTR [rdi+0xb8]
   140386514:	mov    rcx,QWORD PTR [rax]
   140386517:	call   0x140c63060
   14038651c:	add    DWORD PTR [rbp-0x68],eax
   14038651f:	mov    edx,DWORD PTR [rsp+0x7c]
   140386523:	dec    edx
   140386525:	mov    ecx,eax
   140386527:	call   0x14077d160
   14038652c:	add    DWORD PTR [rbp-0x74],eax
   14038652f:	mov    ebx,DWORD PTR [rbp-0x58]
   140386532:	inc    ebx
   140386534:	mov    DWORD PTR [rbp-0x58],ebx
   140386537:	inc    rsi
   14038653a:	mov    QWORD PTR [rbp-0x38],rsi
   14038653e:	movsxd r15,ebx
   140386541:	mov    QWORD PTR [rbp+0x0],r15
   140386545:	add    r12,0x8
   140386549:	mov    QWORD PTR [rbp-0x28],r12
   14038654d:	mov    r14,QWORD PTR [rbp+0x8]
   140386551:	add    r14,0x8
   140386555:	mov    QWORD PTR [rbp+0x8],r14
   140386559:	mov    rax,QWORD PTR [r13+0x8]
   14038655d:	sub    rax,QWORD PTR [r13+0x0]
   140386561:	sar    rax,0x3
   140386565:	cmp    r15,rax
   140386568:	mov    r10d,0x0
   14038656e:	jb     0x140385dd0
   140386574:	mov    r14,QWORD PTR [rbp-0x80]
   140386578:	mov    r13d,r10d
   14038657b:	mov    DWORD PTR [rbp-0x5c],r10d
   14038657f:	add    r14,0xf8
   140386586:	mov    rdx,QWORD PTR [r14]
   140386589:	mov    rax,QWORD PTR [r14+0x8]
   14038658d:	sub    rax,rdx
   140386590:	sar    rax,0x3
   140386594:	test   rax,rax
   140386597:	je     0x140386d70
   14038659d:	mov    r12,r10
   1403865a0:	mov    QWORD PTR [rbp-0x10],r10
   1403865a4:	mov    r15,r10
   1403865a7:	mov    rcx,r10
   1403865aa:	mov    QWORD PTR [rbp-0x40],rcx
   1403865ae:	mov    rsi,r10
   1403865b1:	mov    QWORD PTR [rbp-0x28],r10
   1403865b5:	mov    r8,rdx
   1403865b8:	nop    DWORD PTR [rax+rax*1+0x0]
   1403865c0:	mov    edi,r10d
   1403865c3:	mov    rcx,QWORD PTR [rcx+rdx*1]
   1403865c7:	mov    rax,QWORD PTR [rcx+0x40]
   1403865cb:	sub    rax,QWORD PTR [rcx+0x38]
   1403865cf:	sar    rax,0x3
   1403865d3:	test   rax,rax
   1403865d6:	je     0x14038661e
   1403865d8:	mov    rbx,r10
   1403865db:	nop    DWORD PTR [rax+rax*1+0x0]
   1403865e0:	mov    rax,QWORD PTR [rdx+r12*8]
   1403865e4:	mov    rax,QWORD PTR [rax+0x38]
   1403865e8:	mov    rcx,QWORD PTR [rbx+rax*1]
   1403865ec:	mov    rax,QWORD PTR [rcx]
   1403865ef:	call   QWORD PTR [rax+0x10]
   1403865f2:	cmp    eax,0xb
   1403865f5:	je     0x140386c33
   1403865fb:	inc    edi
   1403865fd:	add    rbx,0x8
   140386601:	mov    rdx,QWORD PTR [r14]
   140386604:	mov    rax,QWORD PTR [rdx+r12*8]
   140386608:	mov    rcx,QWORD PTR [rax+0x40]
   14038660c:	sub    rcx,QWORD PTR [rax+0x38]
   140386610:	sar    rcx,0x3
   140386614:	movsxd rax,edi
   140386617:	cmp    rax,rcx
   14038661a:	jb     0x1403865e0
   14038661c:	jmp    0x140386621
   14038661e:	mov    rdx,r8
   140386621:	mov    rdi,QWORD PTR [rbp-0x80]
   140386625:	lea    rcx,[rdi+0xf8]
   14038662c:	mov    rax,QWORD PTR [rdi+0x128]
   140386633:	test   BYTE PTR [r12+rax*1],0x1
   140386638:	je     0x140386a01
   14038663e:	lea    r13,[rdi+0x158]
   140386645:	mov    r12,rdi
   140386648:	mov    rax,QWORD PTR [r13+0x0]
   14038664c:	mov    rdx,QWORD PTR [rbp-0x10]
   140386650:	cmp    DWORD PTR [rax+rdx*4],0x0
   140386654:	mov    rdx,r15
   140386657:	jle    0x140386736
   14038665d:	call   0x14006f1b0
   140386662:	mov    rcx,QWORD PTR [rax]
   140386665:	mov    rax,QWORD PTR [rcx]
   140386668:	call   QWORD PTR [rax+0x478]
   14038666e:	mov    esi,eax
   140386670:	mov    rdx,r15
   140386673:	lea    rcx,[rdi+0xf8]
   14038667a:	call   0x14006f1b0
   14038667f:	mov    rdi,QWORD PTR [rax]
   140386682:	mov    rdx,QWORD PTR [rdi]
   140386685:	mov    rbx,QWORD PTR [rdx+0x488]
   14038668c:	mov    rdx,r15
   14038668f:	mov    rcx,r13
   140386692:	call   0x14006f2f0
   140386697:	mov    edx,DWORD PTR [rax]
   140386699:	mov    rcx,rdi
   14038669c:	call   rbx
   14038669e:	mov    rdx,r15
   1403866a1:	lea    rcx,[r12+0xf8]
   1403866a9:	call   0x14006f1b0
   1403866ae:	mov    rcx,QWORD PTR [rax]
   1403866b1:	call   0x14030a710
   1403866b6:	mov    ebx,eax
   1403866b8:	neg    ebx
   1403866ba:	mov    rdx,r15
   1403866bd:	mov    rcx,r14
   1403866c0:	call   0x14006f1b0
   1403866c5:	mov    rcx,QWORD PTR [rax]
   1403866c8:	call   0x14030a6e0
   1403866cd:	neg    eax
   1403866cf:	mov    r8d,ebx
   1403866d2:	mov    edx,eax
   1403866d4:	lea    rcx,[rbp-0x8]
   1403866d8:	call   0x14030a2c0
   1403866dd:	mov    rdx,r15
   1403866e0:	mov    rcx,r14
   1403866e3:	call   0x14006f1b0
   1403866e8:	mov    rcx,QWORD PTR [rax]
   1403866eb:	call   0x14030a710
   1403866f0:	mov    ebx,eax
   1403866f2:	neg    ebx
   1403866f4:	mov    rdx,r15
   1403866f7:	mov    rcx,r14
   1403866fa:	call   0x14006f1b0
   1403866ff:	mov    rcx,QWORD PTR [rax]
   140386702:	call   0x14030a6e0
   140386707:	neg    eax
   140386709:	mov    r8d,ebx
   14038670c:	mov    edx,eax
   14038670e:	lea    rcx,[rbp+0x48]
   140386712:	call   0x14030a2c0
   140386717:	mov    rdx,r15
   14038671a:	mov    rcx,r14
   14038671d:	call   0x14006f1b0
   140386722:	mov    rcx,QWORD PTR [rax]
   140386725:	mov    rax,QWORD PTR [rcx]
   140386728:	mov    edx,esi
   14038672a:	call   QWORD PTR [rax+0x488]
   140386730:	mov    rsi,QWORD PTR [rbp-0x28]
   140386734:	jmp    0x1403867ac
   140386736:	call   0x14006f1b0
   14038673b:	mov    rcx,QWORD PTR [rax]
   14038673e:	call   0x14030a710
   140386743:	mov    ebx,eax
   140386745:	neg    ebx
   140386747:	mov    rdx,r15
   14038674a:	lea    rcx,[rdi+0xf8]
   140386751:	call   0x14006f1b0
   140386756:	mov    rcx,QWORD PTR [rax]
   140386759:	call   0x14030a6e0
   14038675e:	neg    eax
   140386760:	mov    r8d,ebx
   140386763:	mov    edx,eax
   140386765:	lea    rcx,[rbp-0x8]
   140386769:	call   0x14030a2c0
   14038676e:	mov    rdx,r15
   140386771:	mov    rcx,r14
   140386774:	call   0x14006f1b0
   140386779:	mov    rcx,QWORD PTR [rax]
   14038677c:	call   0x14030a710
   140386781:	mov    ebx,eax
   140386783:	neg    ebx
   140386785:	mov    rdx,r15
   140386788:	lea    rcx,[rdi+0xf8]
   14038678f:	call   0x14006f1b0
   140386794:	mov    rcx,QWORD PTR [rax]
   140386797:	call   0x14030a6e0
   14038679c:	neg    eax
   14038679e:	mov    r8d,ebx
   1403867a1:	mov    edx,eax
   1403867a3:	lea    rcx,[rbp+0x48]
   1403867a7:	call   0x14030a2c0
   1403867ac:	mov    rax,QWORD PTR [r14]
   1403867af:	mov    rcx,QWORD PTR [rsi+rax*1]
   1403867b3:	mov    rax,QWORD PTR [rcx]
   1403867b6:	call   QWORD PTR [rax]
   1403867b8:	xor    r10d,r10d
   1403867bb:	mov    r12,QWORD PTR [rbp-0x10]
   1403867bf:	cmp    ax,0x20
   1403867c3:	jne    0x1403869f8
   1403867c9:	mov    ebx,r10d
   1403867cc:	mov    DWORD PTR [rbp-0x60],ebx
   1403867cf:	mov    rdx,QWORD PTR [r14]
   1403867d2:	lea    r8,[r12*8+0x0]
   1403867da:	mov    QWORD PTR [rbp+0x60],r8
   1403867de:	mov    rax,QWORD PTR [r8+rdx*1]
   1403867e2:	mov    rcx,QWORD PTR [rax+0x40]
   1403867e6:	sub    rcx,QWORD PTR [rax+0x38]
   1403867ea:	sar    rcx,0x3
   1403867ee:	test   rcx,rcx
   1403867f1:	je     0x1403869f8
   1403867f7:	mov    esi,r10d
   1403867fa:	mov    QWORD PTR [rbp+0x0],r10
   1403867fe:	xchg   ax,ax
   140386800:	mov    rax,QWORD PTR [rdx+r8*1]
   140386804:	mov    rax,QWORD PTR [rax+0x38]
   140386808:	mov    rcx,QWORD PTR [rsi+rax*1]
   14038680c:	mov    rax,QWORD PTR [rcx]
   14038680f:	call   QWORD PTR [rax+0x10]
   140386812:	xor    r10d,r10d
   140386815:	cmp    eax,0xa
   140386818:	jne    0x1403869c0
   14038681e:	mov    r12d,r10d
   140386821:	mov    edi,r10d
   140386824:	mov    rdx,QWORD PTR [r14]
   140386827:	mov    rax,QWORD PTR [r14+0x8]
   14038682b:	sub    rax,rdx
   14038682e:	sar    rax,0x3
   140386832:	test   rax,rax
   140386835:	je     0x1403869c0
   14038683b:	nop    DWORD PTR [rax+rax*1+0x0]
   140386840:	mov    rax,QWORD PTR [rbp-0x80]
   140386844:	mov    rax,QWORD PTR [rax+0x128]
   14038684b:	test   BYTE PTR [rdi+rax*1],0x1
   14038684f:	jne    0x1403868e5
   140386855:	mov    rbx,QWORD PTR [rdx+rdi*8]
   140386859:	mov    rax,QWORD PTR [rbp-0x10]
   14038685d:	mov    rax,QWORD PTR [rdx+rax*8]
   140386861:	mov    rax,QWORD PTR [rax+0x38]
   140386865:	mov    rcx,QWORD PTR [rsi+rax*1]
   140386869:	mov    rax,QWORD PTR [rcx]
   14038686c:	call   QWORD PTR [rax+0x60]
   14038686f:	cmp    DWORD PTR [rbx+0x1c],eax
   140386872:	jne    0x14038699a
   140386878:	test   DWORD PTR [rbx+0x10],0x20000000
   14038687f:	jne    0x140386889
   140386881:	mov    rcx,rbx
   140386884:	call   0x140c62f50
   140386889:	mov    esi,DWORD PTR [rbx+0x78]
   14038688c:	test   DWORD PTR [rbx+0x10],0x20000000
   140386893:	jne    0x14038689d
   140386895:	mov    rcx,rbx
   140386898:	call   0x140c62f50
   14038689d:	mov    r8d,esi
   1403868a0:	mov    edx,DWORD PTR [rbx+0x74]
   1403868a3:	lea    rcx,[rbp-0x8]
   1403868a7:	call   0x14030a2c0
   1403868ac:	test   DWORD PTR [rbx+0x10],0x20000000
   1403868b3:	jne    0x1403868bd
   1403868b5:	mov    rcx,rbx
   1403868b8:	call   0x140c62f50
   1403868bd:	mov    esi,DWORD PTR [rbx+0x78]
   1403868c0:	test   DWORD PTR [rbx+0x10],0x20000000
   1403868c7:	jne    0x1403868d1
   1403868c9:	mov    rcx,rbx
   1403868cc:	call   0x140c62f50
   1403868d1:	mov    r8d,esi
   1403868d4:	mov    edx,DWORD PTR [rbx+0x74]
   1403868d7:	lea    rcx,[rbp+0x48]
   1403868db:	call   0x14030a2c0
   1403868e0:	jmp    0x140386996
   1403868e5:	mov    rax,QWORD PTR [r13+0x0]
   1403868e9:	cmp    DWORD PTR [rax+rdi*4],0x0
   1403868ed:	jle    0x14038699a
   1403868f3:	mov    rbx,QWORD PTR [rdx+rdi*8]
   1403868f7:	mov    rax,QWORD PTR [rbx]
   1403868fa:	mov    rcx,rbx
   1403868fd:	call   QWORD PTR [rax+0x478]
   140386903:	mov    esi,eax
   140386905:	mov    rcx,QWORD PTR [rbx]
   140386908:	mov    r8,QWORD PTR [rcx+0x488]
   14038690f:	mov    rcx,QWORD PTR [r13+0x0]
   140386913:	mov    edx,eax
   140386915:	sub    edx,DWORD PTR [rcx+rdi*4]
   140386918:	mov    rcx,rbx
   14038691b:	call   r8
   14038691e:	test   DWORD PTR [rbx+0x10],0x20000000
   140386925:	jne    0x14038692f
   140386927:	mov    rcx,rbx
   14038692a:	call   0x140c62f50
   14038692f:	mov    r15d,DWORD PTR [rbx+0x78]
   140386933:	test   DWORD PTR [rbx+0x10],0x20000000
   14038693a:	jne    0x140386944
   14038693c:	mov    rcx,rbx
   14038693f:	call   0x140c62f50
   140386944:	mov    r8d,r15d
   140386947:	mov    edx,DWORD PTR [rbx+0x74]
   14038694a:	lea    rcx,[rbp-0x8]
   14038694e:	call   0x14030a2c0
   140386953:	test   DWORD PTR [rbx+0x10],0x20000000
   14038695a:	jne    0x140386964
   14038695c:	mov    rcx,rbx
   14038695f:	call   0x140c62f50
   140386964:	mov    r15d,DWORD PTR [rbx+0x78]
   140386968:	test   DWORD PTR [rbx+0x10],0x20000000
   14038696f:	jne    0x140386979
   140386971:	mov    rcx,rbx
   140386974:	call   0x140c62f50
   140386979:	mov    r8d,r15d
   14038697c:	mov    edx,DWORD PTR [rbx+0x74]
   14038697f:	lea    rcx,[rbp+0x48]
   140386983:	call   0x14030a2c0
   140386988:	mov    rax,QWORD PTR [rbx]
   14038698b:	mov    edx,esi
   14038698d:	mov    rcx,rbx
   140386990:	call   QWORD PTR [rax+0x488]
   140386996:	mov    rsi,QWORD PTR [rbp+0x0]
   14038699a:	inc    r12d
   14038699d:	inc    rdi
   1403869a0:	mov    rdx,QWORD PTR [r14]
   1403869a3:	mov    rcx,QWORD PTR [r14+0x8]
   1403869a7:	sub    rcx,rdx
   1403869aa:	sar    rcx,0x3
   1403869ae:	movsxd rax,r12d
   1403869b1:	cmp    rax,rcx
   1403869b4:	jb     0x140386840
   1403869ba:	mov    ebx,DWORD PTR [rbp-0x60]
   1403869bd:	xor    r10d,r10d
   1403869c0:	inc    ebx
   1403869c2:	mov    DWORD PTR [rbp-0x60],ebx
   1403869c5:	add    rsi,0x8
   1403869c9:	mov    QWORD PTR [rbp+0x0],rsi
   1403869cd:	mov    rdx,QWORD PTR [r14]
   1403869d0:	mov    r8,QWORD PTR [rbp+0x60]
   1403869d4:	mov    rax,QWORD PTR [r8+rdx*1]
   1403869d8:	mov    rcx,QWORD PTR [rax+0x40]
   1403869dc:	sub    rcx,QWORD PTR [rax+0x38]
   1403869e0:	sar    rcx,0x3
   1403869e4:	movsxd rax,ebx
   1403869e7:	cmp    rax,rcx
   1403869ea:	jb     0x140386800
   1403869f0:	mov    r12,QWORD PTR [rbp-0x10]
   1403869f4:	mov    rsi,QWORD PTR [rbp-0x28]
   1403869f8:	mov    r13d,DWORD PTR [rbp-0x5c]
   1403869fc:	jmp    0x140386c36
   140386a01:	mov    rcx,QWORD PTR [rdx+r12*8]
   140386a05:	mov    rax,QWORD PTR [rcx]
   140386a08:	call   QWORD PTR [rax]
   140386a0a:	xor    r10d,r10d
   140386a0d:	cmp    ax,0x20
   140386a11:	jne    0x140386c36
   140386a17:	mov    ebx,r10d
   140386a1a:	mov    DWORD PTR [rbp-0x60],ebx
   140386a1d:	mov    rdx,QWORD PTR [r14]
   140386a20:	mov    rax,QWORD PTR [rdx+r12*8]
   140386a24:	mov    rcx,QWORD PTR [rax+0x40]
   140386a28:	sub    rcx,QWORD PTR [rax+0x38]
   140386a2c:	sar    rcx,0x3
   140386a30:	test   rcx,rcx
   140386a33:	je     0x140386c36
   140386a39:	mov    r13d,r10d
   140386a3c:	nop    DWORD PTR [rax+0x0]
   140386a40:	mov    rax,QWORD PTR [rdx+r12*8]
   140386a44:	mov    rax,QWORD PTR [rax+0x38]
   140386a48:	mov    rcx,QWORD PTR [rax+r13*1]
   140386a4c:	mov    rax,QWORD PTR [rcx]
   140386a4f:	call   QWORD PTR [rax+0x10]
   140386a52:	xor    r10d,r10d
   140386a55:	cmp    eax,0xa
   140386a58:	jne    0x140386c01
   140386a5e:	mov    r15d,r10d
   140386a61:	mov    esi,r10d
   140386a64:	mov    rdx,QWORD PTR [r14]
   140386a67:	mov    rax,QWORD PTR [r14+0x8]
   140386a6b:	sub    rax,rdx
   140386a6e:	sar    rax,0x3
   140386a72:	test   rax,rax
   140386a75:	je     0x140386c01
   140386a7b:	nop    DWORD PTR [rax+rax*1+0x0]
   140386a80:	mov    rax,QWORD PTR [rdi+0x128]
   140386a87:	test   BYTE PTR [rsi+rax*1],0x1
   140386a8b:	je     0x140386bdb
   140386a91:	mov    rbx,QWORD PTR [rdx+rsi*8]
   140386a95:	mov    rax,QWORD PTR [rdx+r12*8]
   140386a99:	mov    rcx,QWORD PTR [rax+0x38]
   140386a9d:	mov    rcx,QWORD PTR [rcx+r13*1]
   140386aa1:	mov    rax,QWORD PTR [rcx]
   140386aa4:	call   QWORD PTR [rax+0x60]
   140386aa7:	cmp    DWORD PTR [rbx+0x1c],eax
   140386aaa:	jne    0x140386bdb
   140386ab0:	mov    rax,QWORD PTR [rdi+0x158]
   140386ab7:	cmp    DWORD PTR [rax+rsi*4],0x0
   140386abb:	jle    0x140386b67
   140386ac1:	mov    rax,QWORD PTR [rbx]
   140386ac4:	mov    rcx,rbx
   140386ac7:	call   QWORD PTR [rax+0x478]
   140386acd:	mov    r12d,eax
   140386ad0:	mov    rcx,QWORD PTR [rbx]
   140386ad3:	mov    r8,QWORD PTR [rcx+0x488]
   140386ada:	mov    rcx,QWORD PTR [rdi+0x158]
   140386ae1:	mov    edx,DWORD PTR [rcx+rsi*4]
   140386ae4:	mov    rcx,rbx
   140386ae7:	call   r8
   140386aea:	test   DWORD PTR [rbx+0x10],0x20000000
   140386af1:	jne    0x140386afb
   140386af3:	mov    rcx,rbx
   140386af6:	call   0x140c62f50
   140386afb:	mov    edi,DWORD PTR [rbx+0x78]
   140386afe:	test   DWORD PTR [rbx+0x10],0x20000000
   140386b05:	jne    0x140386b0f
   140386b07:	mov    rcx,rbx
   140386b0a:	call   0x140c62f50
   140386b0f:	mov    r8d,edi
   140386b12:	mov    edx,DWORD PTR [rbx+0x74]
   140386b15:	lea    rcx,[rbp-0x8]
   140386b19:	call   0x14030a2c0
   140386b1e:	test   DWORD PTR [rbx+0x10],0x20000000
   140386b25:	jne    0x140386b2f
   140386b27:	mov    rcx,rbx
   140386b2a:	call   0x140c62f50
   140386b2f:	mov    edi,DWORD PTR [rbx+0x78]
   140386b32:	test   DWORD PTR [rbx+0x10],0x20000000
   140386b39:	jne    0x140386b43
   140386b3b:	mov    rcx,rbx
   140386b3e:	call   0x140c62f50
   140386b43:	mov    r8d,edi
   140386b46:	mov    edx,DWORD PTR [rbx+0x74]
   140386b49:	lea    rcx,[rbp+0x48]
   140386b4d:	call   0x14030a2c0
   140386b52:	mov    rax,QWORD PTR [rbx]
   140386b55:	mov    edx,r12d
   140386b58:	mov    rcx,rbx
   140386b5b:	call   QWORD PTR [rax+0x488]
   140386b61:	mov    r12,QWORD PTR [rbp-0x10]
   140386b65:	jmp    0x140386bd7
   140386b67:	test   DWORD PTR [rbx+0x10],0x20000000
   140386b6e:	jne    0x140386b78
   140386b70:	mov    rcx,rbx
   140386b73:	call   0x140c62f50
   140386b78:	mov    edi,DWORD PTR [rbx+0x78]
   140386b7b:	neg    edi
   140386b7d:	test   DWORD PTR [rbx+0x10],0x20000000
   140386b84:	jne    0x140386b8e
   140386b86:	mov    rcx,rbx
   140386b89:	call   0x140c62f50
   140386b8e:	mov    edx,DWORD PTR [rbx+0x74]
   140386b91:	neg    edx
   140386b93:	mov    r8d,edi
   140386b96:	lea    rcx,[rbp-0x8]
   140386b9a:	call   0x14030a2c0
   140386b9f:	test   DWORD PTR [rbx+0x10],0x20000000
   140386ba6:	jne    0x140386bb0
   140386ba8:	mov    rcx,rbx
   140386bab:	call   0x140c62f50
   140386bb0:	mov    edi,DWORD PTR [rbx+0x78]
   140386bb3:	neg    edi
   140386bb5:	test   DWORD PTR [rbx+0x10],0x20000000
   140386bbc:	jne    0x140386bc6
   140386bbe:	mov    rcx,rbx
   140386bc1:	call   0x140c62f50
   140386bc6:	mov    edx,DWORD PTR [rbx+0x74]
   140386bc9:	neg    edx
   140386bcb:	mov    r8d,edi
   140386bce:	lea    rcx,[rbp+0x48]
   140386bd2:	call   0x14030a2c0
   140386bd7:	mov    rdi,QWORD PTR [rbp-0x80]
   140386bdb:	inc    r15d
   140386bde:	inc    rsi
   140386be1:	mov    rdx,QWORD PTR [r14]
   140386be4:	mov    rcx,QWORD PTR [r14+0x8]
   140386be8:	sub    rcx,rdx
   140386beb:	sar    rcx,0x3
   140386bef:	movsxd rax,r15d
   140386bf2:	cmp    rax,rcx
   140386bf5:	jb     0x140386a80
   140386bfb:	mov    ebx,DWORD PTR [rbp-0x60]
   140386bfe:	xor    r10d,r10d
   140386c01:	inc    ebx
   140386c03:	mov    DWORD PTR [rbp-0x60],ebx
   140386c06:	add    r13,0x8
   140386c0a:	mov    rdx,QWORD PTR [r14]
   140386c0d:	mov    rax,QWORD PTR [rdx+r12*8]
   140386c11:	mov    rcx,QWORD PTR [rax+0x40]
   140386c15:	sub    rcx,QWORD PTR [rax+0x38]
   140386c19:	sar    rcx,0x3
   140386c1d:	movsxd rax,ebx
   140386c20:	cmp    rax,rcx
   140386c23:	jb     0x140386a40
   140386c29:	mov    rsi,QWORD PTR [rbp-0x28]
   140386c2d:	mov    r13d,DWORD PTR [rbp-0x5c]
   140386c31:	jmp    0x140386c36
   140386c33:	xor    r10d,r10d
   140386c36:	mov    rdi,QWORD PTR [rbp-0x80]
   140386c3a:	mov    rax,QWORD PTR [rdi+0x128]
   140386c41:	test   BYTE PTR [r12+rax*1],0x1
   140386c46:	je     0x140386d2f
   140386c4c:	mov    rax,QWORD PTR [rdi+0xf8]
   140386c53:	lea    rcx,[rax+r12*8]
   140386c57:	mov    rax,QWORD PTR [rdi+0x158]
   140386c5e:	mov    rcx,QWORD PTR [rcx]
   140386c61:	cmp    DWORD PTR [rax+r12*4],0x0
   140386c66:	jle    0x140386cdc
   140386c68:	mov    rax,QWORD PTR [rcx]
   140386c6b:	call   QWORD PTR [rax+0x478]
   140386c71:	mov    ebx,eax
   140386c73:	mov    rcx,QWORD PTR [r14]
   140386c76:	mov    rcx,QWORD PTR [rcx+r12*8]
   140386c7a:	mov    rdx,QWORD PTR [rcx]
   140386c7d:	mov    r8,QWORD PTR [rdx+0x488]
   140386c84:	mov    rdx,QWORD PTR [rdi+0x158]
   140386c8b:	mov    edx,DWORD PTR [rdx+r12*4]
   140386c8f:	call   r8
   140386c92:	mov    rcx,QWORD PTR [r14]
   140386c95:	mov    BYTE PTR [rsp+0x20],0x1
   140386c9a:	xor    r9d,r9d
   140386c9d:	mov    r8,QWORD PTR [rdi+0xc0]
   140386ca4:	mov    rdx,QWORD PTR [rdi+0xb8]
   140386cab:	mov    rcx,QWORD PTR [rcx+r12*8]
   140386caf:	call   0x140c63060
   140386cb4:	add    DWORD PTR [rsp+0x74],eax
   140386cb8:	mov    edx,DWORD PTR [rsp+0x7c]
   140386cbc:	dec    edx
   140386cbe:	mov    ecx,eax
   140386cc0:	call   0x14077d160
   140386cc5:	add    DWORD PTR [rbp-0x6c],eax
   140386cc8:	mov    rax,QWORD PTR [r14]
   140386ccb:	mov    rcx,QWORD PTR [rax+r12*8]
   140386ccf:	mov    rax,QWORD PTR [rcx]
   140386cd2:	mov    edx,ebx
   140386cd4:	call   QWORD PTR [rax+0x488]
   140386cda:	jmp    0x140386d0b
   140386cdc:	mov    BYTE PTR [rsp+0x20],0x1
   140386ce1:	xor    r9d,r9d
   140386ce4:	mov    r8,QWORD PTR [rdi+0xc0]
   140386ceb:	mov    rdx,QWORD PTR [rdi+0xb8]
   140386cf2:	call   0x140c63060
   140386cf7:	add    DWORD PTR [rsp+0x74],eax
   140386cfb:	mov    edx,DWORD PTR [rsp+0x7c]
   140386cff:	dec    edx
   140386d01:	mov    ecx,eax
   140386d03:	call   0x14077d160
   140386d08:	add    DWORD PTR [rbp-0x6c],eax
   140386d0b:	mov    rax,QWORD PTR [r14]
   140386d0e:	mov    rcx,QWORD PTR [rax+r12*8]
   140386d12:	test   DWORD PTR [rcx+0x10],0x4000
   140386d19:	mov    r9d,DWORD PTR [rbp-0x64]
   140386d1d:	movzx  r9d,r9b
   140386d21:	mov    r10d,0x0
   140386d27:	cmovne r9d,r10d
   140386d2b:	mov    DWORD PTR [rbp-0x64],r9d
   140386d2f:	inc    r13d
   140386d32:	mov    DWORD PTR [rbp-0x5c],r13d
   140386d36:	inc    r12
   140386d39:	mov    QWORD PTR [rbp-0x10],r12
   140386d3d:	mov    rdx,QWORD PTR [r14]
   140386d40:	movsxd r15,r13d
   140386d43:	mov    rcx,QWORD PTR [rbp-0x40]
   140386d47:	add    rcx,0x8
   140386d4b:	mov    QWORD PTR [rbp-0x40],rcx
   140386d4f:	add    rsi,0x8
   140386d53:	mov    QWORD PTR [rbp-0x28],rsi
   140386d57:	mov    r8,rdx
   140386d5a:	mov    rax,QWORD PTR [r14+0x8]
   140386d5e:	sub    rax,rdx
   140386d61:	sar    rax,0x3
   140386d65:	cmp    r15,rax
   140386d68:	jb     0x1403865c0
   140386d6e:	jmp    0x140386d74
   140386d70:	mov    rdi,QWORD PTR [rbp-0x80]
   140386d74:	mov    r14d,DWORD PTR [rsp+0x74]
   140386d79:	mov    r12d,DWORD PTR [rbp-0x68]
   140386d7d:	sub    r14d,r12d
   140386d80:	mov    r15d,DWORD PTR [rbp-0x6c]
   140386d84:	mov    esi,r15d
   140386d87:	mov    r13d,DWORD PTR [rbp-0x74]
   140386d8b:	sub    esi,r13d
   140386d8e:	mov    rcx,QWORD PTR [rdi+0xd8]
   140386d95:	test   rcx,rcx
   140386d98:	je     0x140386daf
   140386d9a:	mov    edx,0x49
   140386d9f:	call   0x141339710
   140386da4:	xor    ecx,ecx
   140386da6:	test   eax,eax
   140386da8:	cmovns ecx,eax
   140386dab:	inc    ecx
   140386dad:	jmp    0x140386db3
   140386daf:	mov    ecx,DWORD PTR [rsp+0x7c]
   140386db3:	test   ecx,ecx
   140386db5:	jle    0x1403870b6
   140386dbb:	mov    edi,DWORD PTR [rbp-0x78]
   140386dbe:	mov    ebx,DWORD PTR [rbp-0x20]
   140386dc1:	lea    r8d,[rdi+0x2]
   140386dc5:	lea    edx,[rbx+0x1]
   140386dc8:	lea    rcx,[rip+0x22bd511]        # 0x1426442e0
   140386dcf:	call   0x1400bb0b0
   140386dd4:	xor    r8d,r8d
   140386dd7:	mov    edx,0x6
   140386ddc:	mov    r9b,0x1
   140386ddf:	lea    rcx,[rip+0x22bd4fa]        # 0x1426442e0
   140386de6:	call   0x1400bb0c0
   140386deb:	lea    rdx,[rip+0x12722d6]        # 0x1415f90c8
   140386df2:	lea    rcx,[rbp+0xc0]
   140386df9:	call   0x1400680e0
   140386dfe:	nop
   140386dff:	xor    r9d,r9d
   140386e02:	mov    r8b,0x3
   140386e05:	lea    rdx,[rbp+0xc0]
   140386e0c:	lea    rcx,[rip+0x22bd4cd]        # 0x1426442e0
   140386e13:	call   0x140ad69a0
   140386e18:	nop
   140386e19:	lea    rcx,[rbp+0xc0]
   140386e20:	call   0x140067dc0
   140386e25:	lea    rcx,[rbp+0x120]
   140386e2c:	call   0x14006f620
   140386e31:	nop
   140386e32:	lea    rdx,[rbp+0x120]
   140386e39:	mov    ecx,r13d
   140386e3c:	call   0x140529cf0
   140386e41:	mov    dl,0xf
   140386e43:	lea    rcx,[rbp+0x120]
   140386e4a:	call   0x1400b9cc0
   140386e4f:	xor    r9d,r9d
   140386e52:	xor    r8d,r8d
   140386e55:	lea    rdx,[rbp+0x120]
   140386e5c:	lea    rcx,[rip+0x22bd47d]        # 0x1426442e0
   140386e63:	call   0x140ad69a0
   140386e68:	nop
   140386e69:	lea    rcx,[rbp+0x120]
   140386e70:	call   0x140067dc0
   140386e75:	mov    r13d,DWORD PTR [rbp-0x48]
   140386e79:	lea    r8d,[r13+0x2]
   140386e7d:	lea    edx,[rbx+0x1]
   140386e80:	lea    rcx,[rip+0x22bd459]        # 0x1426442e0
   140386e87:	call   0x1400bb0b0
   140386e8c:	xor    r8d,r8d
   140386e8f:	mov    edx,0x6
   140386e94:	mov    r9b,0x1
   140386e97:	lea    rcx,[rip+0x22bd442]        # 0x1426442e0
   140386e9e:	call   0x1400bb0c0
   140386ea3:	lea    rdx,[rip+0x127221e]        # 0x1415f90c8
   140386eaa:	lea    rcx,[rbp+0xc0]
   140386eb1:	call   0x1400680e0
   140386eb6:	nop
   140386eb7:	xor    r9d,r9d
   140386eba:	mov    r8b,0x3
   140386ebd:	lea    rdx,[rbp+0xc0]
   140386ec4:	lea    rcx,[rip+0x22bd415]        # 0x1426442e0
   140386ecb:	call   0x140ad69a0
   140386ed0:	nop
   140386ed1:	lea    rcx,[rbp+0xc0]
   140386ed8:	call   0x140067dc0
   140386edd:	lea    rcx,[rbp+0x120]
   140386ee4:	call   0x14006f620
   140386ee9:	nop
   140386eea:	lea    rdx,[rbp+0x120]
   140386ef1:	mov    ecx,r15d
   140386ef4:	call   0x140529cf0
   140386ef9:	mov    dl,0xf
   140386efb:	lea    rcx,[rbp+0x120]
   140386f02:	call   0x1400b9cc0
   140386f07:	xor    r9d,r9d
   140386f0a:	xor    r8d,r8d
   140386f0d:	lea    rdx,[rbp+0x120]
   140386f14:	lea    rcx,[rip+0x22bd3c5]        # 0x1426442e0
   140386f1b:	call   0x140ad69a0
   140386f20:	nop
   140386f21:	lea    rcx,[rbp+0x120]
   140386f28:	call   0x140067dc0
   140386f2d:	mov    edx,ebx
   140386f2f:	add    edx,0x2
   140386f32:	lea    r8d,[rdi+0x2]
   140386f36:	lea    rcx,[rip+0x22bd3a3]        # 0x1426442e0
   140386f3d:	call   0x1400bb0b0
   140386f42:	test   esi,esi
   140386f44:	js     0x140387012
   140386f4a:	test   r14d,r14d
   140386f4d:	jns    0x140386f56
   140386f4f:	mov    edx,0x4
   140386f54:	jmp    0x140386f72
   140386f56:	test   r12d,r12d
   140386f59:	jle    0x140386f6d
   140386f5b:	imul   eax,r14d,0x64
   140386f5f:	cdq
   140386f60:	idiv   r12d
   140386f63:	cmp    eax,0x32
   140386f66:	mov    edx,0x2
   140386f6b:	jge    0x140386f72
   140386f6d:	mov    edx,0x6
   140386f72:	mov    r9b,0x1
   140386f75:	xor    r8d,r8d
   140386f78:	lea    rcx,[rip+0x22bd361]        # 0x1426442e0
   140386f7f:	call   0x1400bb0c0
   140386f84:	lea    rdx,[rip+0x129f2d5]        # 0x141626260
   140386f8b:	lea    rcx,[rbp+0xc0]
   140386f92:	call   0x1400680e0
   140386f97:	nop
   140386f98:	xor    r9d,r9d
   140386f9b:	mov    r8b,0x3
   140386f9e:	lea    rdx,[rbp+0xc0]
   140386fa5:	lea    rcx,[rip+0x22bd334]        # 0x1426442e0
   140386fac:	call   0x140ad69a0
   140386fb1:	nop
   140386fb2:	lea    rcx,[rbp+0xc0]
   140386fb9:	call   0x140067dc0
   140386fbe:	lea    rcx,[rbp+0x120]
   140386fc5:	call   0x14006f620
   140386fca:	nop
   140386fcb:	lea    rdx,[rbp+0x120]
   140386fd2:	mov    ecx,esi
   140386fd4:	call   0x140529cf0
   140386fd9:	mov    dl,0xf
   140386fdb:	lea    rcx,[rbp+0x120]
   140386fe2:	call   0x1400b9cc0
   140386fe7:	xor    r9d,r9d
   140386fea:	xor    r8d,r8d
   140386fed:	lea    rdx,[rbp+0x120]
   140386ff4:	lea    rcx,[rip+0x22bd2e5]        # 0x1426442e0
   140386ffb:	call   0x140ad69a0
   140387000:	nop
   140387001:	lea    rcx,[rbp+0x120]
   140387008:	call   0x140067dc0
   14038700d:	jmp    0x1403870ba
   140387012:	xor    r8d,r8d
   140387015:	mov    edx,0x4
   14038701a:	mov    r9b,0x1
   14038701d:	lea    rcx,[rip+0x22bd2bc]        # 0x1426442e0
   140387024:	call   0x1400bb0c0
   140387029:	lea    rdx,[rip+0x129f280]        # 0x1416262b0
   140387030:	lea    rcx,[rbp+0xc0]
   140387037:	call   0x1400680e0
   14038703c:	nop
   14038703d:	xor    r9d,r9d
   140387040:	mov    r8b,0x3
   140387043:	lea    rdx,[rbp+0xc0]
   14038704a:	lea    rcx,[rip+0x22bd28f]        # 0x1426442e0
   140387051:	call   0x140ad69a0
   140387056:	nop
   140387057:	lea    rcx,[rbp+0xc0]
   14038705e:	call   0x140067dc0
   140387063:	lea    rcx,[rbp+0x120]
   14038706a:	call   0x14006f620
   14038706f:	nop
   140387070:	neg    esi
   140387072:	lea    rdx,[rbp+0x120]
   140387079:	mov    ecx,esi
   14038707b:	call   0x140529cf0
   140387080:	mov    dl,0xf
   140387082:	lea    rcx,[rbp+0x120]
   140387089:	call   0x1400b9cc0
   14038708e:	xor    r9d,r9d
   140387091:	xor    r8d,r8d
   140387094:	lea    rdx,[rbp+0x120]
   14038709b:	lea    rcx,[rip+0x22bd23e]        # 0x1426442e0
   1403870a2:	call   0x140ad69a0
   1403870a7:	nop
   1403870a8:	lea    rcx,[rbp+0x120]
   1403870af:	call   0x140067dc0
   1403870b4:	jmp    0x1403870ba
   1403870b6:	mov    r13d,DWORD PTR [rbp-0x48]
   1403870ba:	mov    r8d,DWORD PTR [rbp-0x78]
   1403870be:	add    r8d,0x2
   1403870c2:	mov    r12d,DWORD PTR [rbp-0x20]
   1403870c6:	lea    edx,[r12+0x3]
   1403870cb:	lea    rcx,[rip+0x22bd20e]        # 0x1426442e0
   1403870d2:	call   0x1400bb0b0
   1403870d7:	xor    r8d,r8d
   1403870da:	mov    r9b,0x1
   1403870dd:	lea    rcx,[rip+0x22bd1fc]        # 0x1426442e0
   1403870e4:	cmp    DWORD PTR [rbp-0x8],r8d
   1403870e8:	jl     0x14038716e
   1403870ee:	mov    edx,0x7
   1403870f3:	call   0x1400bb0c0
   1403870f8:	lea    rdx,[rip+0x129f199]        # 0x141626298
   1403870ff:	lea    rcx,[rbp+0x120]
   140387106:	call   0x1400680e0
   14038710b:	nop
   14038710c:	xor    r9d,r9d
   14038710f:	xor    r8d,r8d
   140387112:	lea    rdx,[rbp+0x120]
   140387119:	lea    rcx,[rip+0x22bd1c0]        # 0x1426442e0
   140387120:	call   0x140ad69a0
   140387125:	nop
   140387126:	lea    rcx,[rbp+0x120]
   14038712d:	call   0x140067dc0
   140387132:	lea    rcx,[rbp+0xc0]
   140387139:	call   0x14006f620
   14038713e:	nop
   14038713f:	lea    rdx,[rbp+0xc0]
   140387146:	lea    rcx,[rbp-0x8]
   14038714a:	call   0x140772ef0
   14038714f:	xor    r9d,r9d
   140387152:	xor    r8d,r8d
   140387155:	lea    rdx,[rbp+0xc0]
   14038715c:	lea    rcx,[rip+0x22bd17d]        # 0x1426442e0
   140387163:	call   0x140ad69a0
   140387168:	nop
   140387169:	jmp    0x1403871f6
   14038716e:	mov    edx,0x4
   140387173:	call   0x1400bb0c0
   140387178:	lea    rdx,[rip+0x129f149]        # 0x1416262c8
   14038717f:	lea    rcx,[rbp+0x120]
   140387186:	call   0x1400680e0
   14038718b:	nop
   14038718c:	xor    r9d,r9d
   14038718f:	xor    r8d,r8d
   140387192:	lea    rdx,[rbp+0x120]
   140387199:	lea    rcx,[rip+0x22bd140]        # 0x1426442e0
   1403871a0:	call   0x140ad69a0
   1403871a5:	nop
   1403871a6:	lea    rcx,[rbp+0x120]
   1403871ad:	call   0x140067dc0
   1403871b2:	mov    rax,QWORD PTR [rbp-0x8]
   1403871b6:	mov    QWORD PTR [rbp-0x40],rax
   1403871ba:	neg    eax
   1403871bc:	mov    DWORD PTR [rbp-0x40],eax
   1403871bf:	lea    rcx,[rbp+0xc0]
   1403871c6:	call   0x14006f620
   1403871cb:	nop
   1403871cc:	lea    rdx,[rbp+0xc0]
   1403871d3:	lea    rcx,[rbp-0x40]
   1403871d7:	call   0x140772ef0
   1403871dc:	xor    r9d,r9d
   1403871df:	xor    r8d,r8d
   1403871e2:	lea    rdx,[rbp+0xc0]
   1403871e9:	lea    rcx,[rip+0x22bd0f0]        # 0x1426442e0
   1403871f0:	call   0x140ad69a0
   1403871f5:	nop
   1403871f6:	lea    rcx,[rbp+0xc0]
   1403871fd:	call   0x140067dc0
   140387202:	lea    r15d,[r13-0x1e]
   140387206:	lea    r14d,[r15+0xb]
   14038720a:	mov    ebx,r15d
   14038720d:	cmp    r15d,r14d
   140387210:	jg     0x1403872f2
   140387216:	lea    edi,[r12+0x1]
   14038721b:	lea    esi,[r12+0x2]
   140387220:	mov    DWORD PTR [rip+0x22bd13e],ebx        # 0x142644364
   140387226:	mov    DWORD PTR [rip+0x22bd13b],r12d        # 0x142644368
   14038722d:	lea    rcx,[rip+0x22bd0ac]        # 0x1426442e0
   140387234:	cmp    ebx,r15d
   140387237:	jne    0x14038726a
   140387239:	mov    edx,DWORD PTR [rip+0x22c78a5]        # 0x14264eae4
   14038723f:	call   0x140ad7b10
   140387244:	mov    DWORD PTR [rip+0x22bd11a],ebx        # 0x142644364
   14038724a:	mov    DWORD PTR [rip+0x22bd118],edi        # 0x142644368
   140387250:	mov    edx,DWORD PTR [rip+0x22c7892]        # 0x14264eae8
   140387256:	lea    rcx,[rip+0x22bd083]        # 0x1426442e0
   14038725d:	call   0x140ad7b10
   140387262:	mov    edx,DWORD PTR [rip+0x22c7884]        # 0x14264eaec
   140387268:	jmp    0x1403872cf
   14038726a:	cmp    ebx,r14d
   14038726d:	jne    0x1403872a0
   14038726f:	mov    edx,DWORD PTR [rip+0x22c7887]        # 0x14264eafc
   140387275:	call   0x140ad7b10
   14038727a:	mov    DWORD PTR [rip+0x22bd0e4],ebx        # 0x142644364
   140387280:	mov    DWORD PTR [rip+0x22bd0e2],edi        # 0x142644368
   140387286:	mov    edx,DWORD PTR [rip+0x22c7874]        # 0x14264eb00
   14038728c:	lea    rcx,[rip+0x22bd04d]        # 0x1426442e0
   140387293:	call   0x140ad7b10
   140387298:	mov    edx,DWORD PTR [rip+0x22c7866]        # 0x14264eb04
   14038729e:	jmp    0x1403872cf
   1403872a0:	mov    edx,DWORD PTR [rip+0x22c784a]        # 0x14264eaf0
   1403872a6:	call   0x140ad7b10
   1403872ab:	mov    DWORD PTR [rip+0x22bd0b3],ebx        # 0x142644364
   1403872b1:	mov    DWORD PTR [rip+0x22bd0b1],edi        # 0x142644368
   1403872b7:	mov    edx,DWORD PTR [rip+0x22c7837]        # 0x14264eaf4
   1403872bd:	lea    rcx,[rip+0x22bd01c]        # 0x1426442e0
   1403872c4:	call   0x140ad7b10
   1403872c9:	mov    edx,DWORD PTR [rip+0x22c7829]        # 0x14264eaf8
   1403872cf:	mov    DWORD PTR [rip+0x22bd08f],ebx        # 0x142644364
   1403872d5:	mov    DWORD PTR [rip+0x22bd08d],esi        # 0x142644368
   1403872db:	lea    rcx,[rip+0x22bcffe]        # 0x1426442e0
   1403872e2:	call   0x140ad7b10
   1403872e7:	inc    ebx
   1403872e9:	cmp    ebx,r14d
   1403872ec:	jle    0x140387220
   1403872f2:	mov    DWORD PTR [rip+0x22bd070],0x1010007        # 0x14264436c
   1403872fc:	lea    eax,[r15+0x2]
   140387300:	mov    DWORD PTR [rip+0x22bd05e],eax        # 0x142644364
   140387306:	lea    edi,[r12+0x1]
   14038730b:	mov    DWORD PTR [rip+0x22bd057],edi        # 0x142644368
   140387311:	lea    rdx,[rip+0x128f228]        # 0x141616540
   140387318:	lea    rcx,[rbp+0xc0]
   14038731f:	call   0x1400680e0
   140387324:	nop
   140387325:	xor    r9d,r9d
   140387328:	xor    r8d,r8d
   14038732b:	lea    rdx,[rbp+0xc0]
   140387332:	lea    rcx,[rip+0x22bcfa7]        # 0x1426442e0
   140387339:	call   0x140ad69a0
   14038733e:	nop
   14038733f:	lea    rcx,[rbp+0xc0]
   140387346:	call   0x14006f7e0
   14038734b:	lea    r15d,[r13-0xf]
   14038734f:	lea    r14d,[r15+0xd]
   140387353:	mov    ebx,r15d
   140387356:	cmp    r15d,r14d
   140387359:	jg     0x140387442
   14038735f:	lea    esi,[r12+0x2]
   140387364:	nop    DWORD PTR [rax+0x0]
   140387368:	nop    DWORD PTR [rax+rax*1+0x0]
   140387370:	mov    DWORD PTR [rip+0x22bcfee],ebx        # 0x142644364
   140387376:	mov    DWORD PTR [rip+0x22bcfeb],r12d        # 0x142644368
   14038737d:	lea    rcx,[rip+0x22bcf5c]        # 0x1426442e0
   140387384:	cmp    ebx,r15d
   140387387:	jne    0x1403873ba
   140387389:	mov    edx,DWORD PTR [rip+0x22c7755]        # 0x14264eae4
   14038738f:	call   0x140ad7b10
   140387394:	mov    DWORD PTR [rip+0x22bcfca],ebx        # 0x142644364
   14038739a:	mov    DWORD PTR [rip+0x22bcfc8],edi        # 0x142644368
   1403873a0:	mov    edx,DWORD PTR [rip+0x22c7742]        # 0x14264eae8
   1403873a6:	lea    rcx,[rip+0x22bcf33]        # 0x1426442e0
   1403873ad:	call   0x140ad7b10
   1403873b2:	mov    edx,DWORD PTR [rip+0x22c7734]        # 0x14264eaec
   1403873b8:	jmp    0x14038741f
   1403873ba:	cmp    ebx,r14d
   1403873bd:	jne    0x1403873f0
   1403873bf:	mov    edx,DWORD PTR [rip+0x22c7737]        # 0x14264eafc
   1403873c5:	call   0x140ad7b10
   1403873ca:	mov    DWORD PTR [rip+0x22bcf94],ebx        # 0x142644364
   1403873d0:	mov    DWORD PTR [rip+0x22bcf92],edi        # 0x142644368
   1403873d6:	mov    edx,DWORD PTR [rip+0x22c7724]        # 0x14264eb00
   1403873dc:	lea    rcx,[rip+0x22bcefd]        # 0x1426442e0
   1403873e3:	call   0x140ad7b10
   1403873e8:	mov    edx,DWORD PTR [rip+0x22c7716]        # 0x14264eb04
   1403873ee:	jmp    0x14038741f
   1403873f0:	mov    edx,DWORD PTR [rip+0x22c76fa]        # 0x14264eaf0
   1403873f6:	call   0x140ad7b10
   1403873fb:	mov    DWORD PTR [rip+0x22bcf63],ebx        # 0x142644364
   140387401:	mov    DWORD PTR [rip+0x22bcf61],edi        # 0x142644368
   140387407:	mov    edx,DWORD PTR [rip+0x22c76e7]        # 0x14264eaf4
   14038740d:	lea    rcx,[rip+0x22bcecc]        # 0x1426442e0
   140387414:	call   0x140ad7b10
   140387419:	mov    edx,DWORD PTR [rip+0x22c76d9]        # 0x14264eaf8
   14038741f:	mov    DWORD PTR [rip+0x22bcf3f],ebx        # 0x142644364
   140387425:	mov    DWORD PTR [rip+0x22bcf3d],esi        # 0x142644368
   14038742b:	lea    rcx,[rip+0x22bceae]        # 0x1426442e0
   140387432:	call   0x140ad7b10
   140387437:	inc    ebx
   140387439:	cmp    ebx,r14d
   14038743c:	jle    0x140387370
   140387442:	mov    DWORD PTR [rip+0x22bcf20],0x1010007        # 0x14264436c
   14038744c:	lea    eax,[r15+0x2]
   140387450:	mov    DWORD PTR [rip+0x22bcf0e],eax        # 0x142644364
   140387456:	lea    eax,[r12+0x1]
   14038745b:	mov    DWORD PTR [rip+0x22bcf07],eax        # 0x142644368
   140387461:	lea    rdx,[rip+0x128f0e8]        # 0x141616550
   140387468:	lea    rcx,[rbp+0xc0]
   14038746f:	call   0x1400680e0
   140387474:	nop
   140387475:	xor    r9d,r9d
   140387478:	xor    r8d,r8d
   14038747b:	lea    rdx,[rbp+0xc0]
   140387482:	lea    rcx,[rip+0x22bce57]        # 0x1426442e0
   140387489:	call   0x140ad69a0
   14038748e:	nop
   14038748f:	lea    rcx,[rbp+0xc0]
   140387496:	call   0x14006f7e0
   14038749b:	mov    r13d,DWORD PTR [rbp+0x10]
   14038749f:	lea    r15d,[r13-0x1e]
   1403874a3:	lea    r14d,[r15+0xb]
   1403874a7:	mov    ebx,r15d
   1403874aa:	cmp    r15d,r14d
   1403874ad:	jg     0x140387592
   1403874b3:	lea    edi,[r12+0x1]
   1403874b8:	lea    esi,[r12+0x2]
   1403874bd:	nop    DWORD PTR [rax]
   1403874c0:	mov    DWORD PTR [rip+0x22bce9e],ebx        # 0x142644364
   1403874c6:	mov    DWORD PTR [rip+0x22bce9b],r12d        # 0x142644368
   1403874cd:	lea    rcx,[rip+0x22bce0c]        # 0x1426442e0
   1403874d4:	cmp    ebx,r15d
   1403874d7:	jne    0x14038750a
   1403874d9:	mov    edx,DWORD PTR [rip+0x22c7605]        # 0x14264eae4
   1403874df:	call   0x140ad7b10
   1403874e4:	mov    DWORD PTR [rip+0x22bce7a],ebx        # 0x142644364
   1403874ea:	mov    DWORD PTR [rip+0x22bce78],edi        # 0x142644368
   1403874f0:	mov    edx,DWORD PTR [rip+0x22c75f2]        # 0x14264eae8
   1403874f6:	lea    rcx,[rip+0x22bcde3]        # 0x1426442e0
   1403874fd:	call   0x140ad7b10
   140387502:	mov    edx,DWORD PTR [rip+0x22c75e4]        # 0x14264eaec
   140387508:	jmp    0x14038756f
   14038750a:	cmp    ebx,r14d
   14038750d:	jne    0x140387540
   14038750f:	mov    edx,DWORD PTR [rip+0x22c75e7]        # 0x14264eafc
   140387515:	call   0x140ad7b10
   14038751a:	mov    DWORD PTR [rip+0x22bce44],ebx        # 0x142644364
   140387520:	mov    DWORD PTR [rip+0x22bce42],edi        # 0x142644368
   140387526:	mov    edx,DWORD PTR [rip+0x22c75d4]        # 0x14264eb00
   14038752c:	lea    rcx,[rip+0x22bcdad]        # 0x1426442e0
   140387533:	call   0x140ad7b10
   140387538:	mov    edx,DWORD PTR [rip+0x22c75c6]        # 0x14264eb04
   14038753e:	jmp    0x14038756f
   140387540:	mov    edx,DWORD PTR [rip+0x22c75aa]        # 0x14264eaf0
   140387546:	call   0x140ad7b10
   14038754b:	mov    DWORD PTR [rip+0x22bce13],ebx        # 0x142644364
   140387551:	mov    DWORD PTR [rip+0x22bce11],edi        # 0x142644368
   140387557:	mov    edx,DWORD PTR [rip+0x22c7597]        # 0x14264eaf4
   14038755d:	lea    rcx,[rip+0x22bcd7c]        # 0x1426442e0
   140387564:	call   0x140ad7b10
   140387569:	mov    edx,DWORD PTR [rip+0x22c7589]        # 0x14264eaf8
   14038756f:	mov    DWORD PTR [rip+0x22bcdef],ebx        # 0x142644364
   140387575:	mov    DWORD PTR [rip+0x22bcded],esi        # 0x142644368
   14038757b:	lea    rcx,[rip+0x22bcd5e]        # 0x1426442e0
   140387582:	call   0x140ad7b10
   140387587:	inc    ebx
   140387589:	cmp    ebx,r14d
   14038758c:	jle    0x1403874c0
   140387592:	mov    DWORD PTR [rip+0x22bcdd0],0x1010007        # 0x14264436c
   14038759c:	lea    eax,[r15+0x2]
   1403875a0:	mov    DWORD PTR [rip+0x22bcdbe],eax        # 0x142644364
   1403875a6:	lea    eax,[r12+0x1]
   1403875ab:	mov    DWORD PTR [rip+0x22bcdb7],eax        # 0x142644368
   1403875b1:	lea    rdx,[rip+0x128ef88]        # 0x141616540
   1403875b8:	lea    rcx,[rbp+0xc0]
   1403875bf:	call   0x1400680e0
   1403875c4:	nop
   1403875c5:	xor    r9d,r9d
   1403875c8:	xor    r8d,r8d
   1403875cb:	lea    rdx,[rbp+0xc0]
   1403875d2:	lea    rcx,[rip+0x22bcd07]        # 0x1426442e0
   1403875d9:	call   0x140ad69a0
   1403875de:	nop
   1403875df:	lea    rcx,[rbp+0xc0]
   1403875e6:	call   0x14006f7e0
   1403875eb:	lea    r15d,[r13-0xf]
   1403875ef:	lea    r14d,[r15+0xd]
   1403875f3:	mov    ebx,r15d
   1403875f6:	cmp    r15d,r14d
   1403875f9:	jg     0x1403876e2
   1403875ff:	lea    edi,[r12+0x1]
   140387604:	lea    esi,[r12+0x2]
   140387609:	nop    DWORD PTR [rax+0x0]
   140387610:	mov    DWORD PTR [rip+0x22bcd4e],ebx        # 0x142644364
   140387616:	mov    DWORD PTR [rip+0x22bcd4b],r12d        # 0x142644368
   14038761d:	lea    rcx,[rip+0x22bccbc]        # 0x1426442e0
   140387624:	cmp    ebx,r15d
   140387627:	jne    0x14038765a
   140387629:	mov    edx,DWORD PTR [rip+0x22c74b5]        # 0x14264eae4
   14038762f:	call   0x140ad7b10
   140387634:	mov    DWORD PTR [rip+0x22bcd2a],ebx        # 0x142644364
   14038763a:	mov    DWORD PTR [rip+0x22bcd28],edi        # 0x142644368
   140387640:	mov    edx,DWORD PTR [rip+0x22c74a2]        # 0x14264eae8
   140387646:	lea    rcx,[rip+0x22bcc93]        # 0x1426442e0
   14038764d:	call   0x140ad7b10
   140387652:	mov    edx,DWORD PTR [rip+0x22c7494]        # 0x14264eaec
   140387658:	jmp    0x1403876bf
   14038765a:	cmp    ebx,r14d
   14038765d:	jne    0x140387690
   14038765f:	mov    edx,DWORD PTR [rip+0x22c7497]        # 0x14264eafc
   140387665:	call   0x140ad7b10
   14038766a:	mov    DWORD PTR [rip+0x22bccf4],ebx        # 0x142644364
   140387670:	mov    DWORD PTR [rip+0x22bccf2],edi        # 0x142644368
   140387676:	mov    edx,DWORD PTR [rip+0x22c7484]        # 0x14264eb00
   14038767c:	lea    rcx,[rip+0x22bcc5d]        # 0x1426442e0
   140387683:	call   0x140ad7b10
   140387688:	mov    edx,DWORD PTR [rip+0x22c7476]        # 0x14264eb04
   14038768e:	jmp    0x1403876bf
   140387690:	mov    edx,DWORD PTR [rip+0x22c745a]        # 0x14264eaf0
   140387696:	call   0x140ad7b10
   14038769b:	mov    DWORD PTR [rip+0x22bccc3],ebx        # 0x142644364
   1403876a1:	mov    DWORD PTR [rip+0x22bccc1],edi        # 0x142644368
   1403876a7:	mov    edx,DWORD PTR [rip+0x22c7447]        # 0x14264eaf4
   1403876ad:	lea    rcx,[rip+0x22bcc2c]        # 0x1426442e0
   1403876b4:	call   0x140ad7b10
   1403876b9:	mov    edx,DWORD PTR [rip+0x22c7439]        # 0x14264eaf8
   1403876bf:	mov    DWORD PTR [rip+0x22bcc9f],ebx        # 0x142644364
   1403876c5:	mov    DWORD PTR [rip+0x22bcc9d],esi        # 0x142644368
   1403876cb:	lea    rcx,[rip+0x22bcc0e]        # 0x1426442e0
   1403876d2:	call   0x140ad7b10
   1403876d7:	inc    ebx
   1403876d9:	cmp    ebx,r14d
   1403876dc:	jle    0x140387610
   1403876e2:	mov    DWORD PTR [rip+0x22bcc80],0x1010007        # 0x14264436c
   1403876ec:	lea    eax,[r15+0x2]
   1403876f0:	mov    DWORD PTR [rip+0x22bcc6e],eax        # 0x142644364
   1403876f6:	lea    eax,[r12+0x1]
   1403876fb:	mov    DWORD PTR [rip+0x22bcc67],eax        # 0x142644368
   140387701:	lea    rdx,[rip+0x128ee48]        # 0x141616550
   140387708:	lea    rcx,[rbp+0xc0]
   14038770f:	call   0x1400680e0
   140387714:	nop
   140387715:	xor    r9d,r9d
   140387718:	xor    r8d,r8d
   14038771b:	lea    rdx,[rbp+0xc0]
   140387722:	lea    rcx,[rip+0x22bcbb7]        # 0x1426442e0
   140387729:	call   0x140ad69a0
   14038772e:	nop
   14038772f:	lea    rcx,[rbp+0xc0]
   140387736:	call   0x14006f7e0
   14038773b:	mov    r13,QWORD PTR [rbp-0x80]
   14038773f:	cmp    QWORD PTR [r13+0xc0],0x0
   140387747:	je     0x14038793b
   14038774d:	mov    esi,DWORD PTR [rbp-0x48]
   140387750:	add    esi,0xffffffe2
   140387753:	lea    edi,[rsi+0xa]
   140387756:	lea    r14d,[r12+0x3]
   14038775b:	mov    ebx,esi
   14038775d:	cmp    esi,edi
   14038775f:	jg     0x1403878c8
   140387765:	lea    r15d,[r14+0x1]
   140387769:	lea    r12d,[r14+0x2]
   14038776d:	nop    DWORD PTR [rax]
   140387770:	mov    DWORD PTR [rip+0x22bcbee],ebx        # 0x142644364
   140387776:	mov    DWORD PTR [rip+0x22bcbeb],r14d        # 0x142644368
   14038777d:	mov    rcx,QWORD PTR [r13+0xc0]
   140387784:	mov    eax,DWORD PTR [rip+0x2005dd6]        # 0x14238d560
   14038778a:	cmp    DWORD PTR [rcx+0x4],eax
   14038778d:	je     0x1403877b6
   14038778f:	cmp    ebx,esi
   140387791:	jne    0x14038779b
   140387793:	mov    edx,DWORD PTR [rip+0x22c734b]        # 0x14264eae4
   140387799:	jmp    0x1403877d2
   14038779b:	lea    rcx,[rip+0x22bcb3e]        # 0x1426442e0
   1403877a2:	cmp    ebx,edi
   1403877a4:	jne    0x1403877ae
   1403877a6:	mov    edx,DWORD PTR [rip+0x22c7350]        # 0x14264eafc
   1403877ac:	jmp    0x1403877d9
   1403877ae:	mov    edx,DWORD PTR [rip+0x22c733c]        # 0x14264eaf0
   1403877b4:	jmp    0x1403877d9
   1403877b6:	cmp    ebx,esi
   1403877b8:	jne    0x1403877c2
   1403877ba:	mov    edx,DWORD PTR [rip+0x22c7288]        # 0x14264ea48
   1403877c0:	jmp    0x1403877d2
   1403877c2:	cmp    ebx,edi
   1403877c4:	mov    edx,DWORD PTR [rip+0x22c7296]        # 0x14264ea60
   1403877ca:	je     0x1403877d2
   1403877cc:	mov    edx,DWORD PTR [rip+0x22c7282]        # 0x14264ea54
   1403877d2:	lea    rcx,[rip+0x22bcb07]        # 0x1426442e0
   1403877d9:	call   0x140ad7b10
   1403877de:	mov    DWORD PTR [rip+0x22bcb80],ebx        # 0x142644364
   1403877e4:	mov    DWORD PTR [rip+0x22bcb7d],r15d        # 0x142644368
   1403877eb:	mov    rcx,QWORD PTR [r13+0xc0]
   1403877f2:	mov    eax,DWORD PTR [rip+0x2005d68]        # 0x14238d560
   1403877f8:	cmp    DWORD PTR [rcx+0x4],eax
   1403877fb:	je     0x140387824
   1403877fd:	cmp    ebx,esi
   1403877ff:	jne    0x140387809
   140387801:	mov    edx,DWORD PTR [rip+0x22c72e1]        # 0x14264eae8
   140387807:	jmp    0x140387840
   140387809:	lea    rcx,[rip+0x22bcad0]        # 0x1426442e0
   140387810:	cmp    ebx,edi
   140387812:	jne    0x14038781c
   140387814:	mov    edx,DWORD PTR [rip+0x22c72e6]        # 0x14264eb00
   14038781a:	jmp    0x140387847
   14038781c:	mov    edx,DWORD PTR [rip+0x22c72d2]        # 0x14264eaf4
   140387822:	jmp    0x140387847
   140387824:	cmp    ebx,esi
   140387826:	jne    0x140387830
   140387828:	mov    edx,DWORD PTR [rip+0x22c721e]        # 0x14264ea4c
   14038782e:	jmp    0x140387840
   140387830:	cmp    ebx,edi
   140387832:	mov    edx,DWORD PTR [rip+0x22c722c]        # 0x14264ea64
   140387838:	je     0x140387840
   14038783a:	mov    edx,DWORD PTR [rip+0x22c7218]        # 0x14264ea58
   140387840:	lea    rcx,[rip+0x22bca99]        # 0x1426442e0
   140387847:	call   0x140ad7b10
   14038784c:	mov    DWORD PTR [rip+0x22bcb12],ebx        # 0x142644364
   140387852:	mov    DWORD PTR [rip+0x22bcb0f],r12d        # 0x142644368
   140387859:	mov    rcx,QWORD PTR [r13+0xc0]
   140387860:	mov    eax,DWORD PTR [rip+0x2005cfa]        # 0x14238d560
   140387866:	cmp    DWORD PTR [rcx+0x4],eax
   140387869:	je     0x140387892
   14038786b:	cmp    ebx,esi
   14038786d:	jne    0x140387877
   14038786f:	mov    edx,DWORD PTR [rip+0x22c7277]        # 0x14264eaec
   140387875:	jmp    0x1403878ae
   140387877:	lea    rcx,[rip+0x22bca62]        # 0x1426442e0
   14038787e:	cmp    ebx,edi
   140387880:	jne    0x14038788a
   140387882:	mov    edx,DWORD PTR [rip+0x22c727c]        # 0x14264eb04
   140387888:	jmp    0x1403878b5
   14038788a:	mov    edx,DWORD PTR [rip+0x22c7268]        # 0x14264eaf8
   140387890:	jmp    0x1403878b5
   140387892:	cmp    ebx,esi
   140387894:	jne    0x14038789e
   140387896:	mov    edx,DWORD PTR [rip+0x22c71b4]        # 0x14264ea50
   14038789c:	jmp    0x1403878ae
   14038789e:	cmp    ebx,edi
   1403878a0:	mov    edx,DWORD PTR [rip+0x22c71c2]        # 0x14264ea68
   1403878a6:	je     0x1403878ae
   1403878a8:	mov    edx,DWORD PTR [rip+0x22c71ae]        # 0x14264ea5c
   1403878ae:	lea    rcx,[rip+0x22bca2b]        # 0x1426442e0
   1403878b5:	call   0x140ad7b10
   1403878ba:	inc    ebx
   1403878bc:	cmp    ebx,edi
   1403878be:	jle    0x140387770
   1403878c4:	mov    r12d,DWORD PTR [rbp-0x20]
   1403878c8:	mov    rcx,QWORD PTR [r13+0xc0]
   1403878cf:	mov    eax,DWORD PTR [rip+0x2005c8b]        # 0x14238d560
   1403878d5:	cmp    DWORD PTR [rcx+0x4],eax
   1403878d8:	mov    DWORD PTR [rip+0x22bca8a],0x1010007        # 0x14264436c
   1403878e2:	jne    0x1403878ee
   1403878e4:	mov    DWORD PTR [rip+0x22bca7e],0x1000000        # 0x14264436c
   1403878ee:	lea    eax,[rsi+0x3]
   1403878f1:	mov    DWORD PTR [rip+0x22bca6d],eax        # 0x142644364
   1403878f7:	lea    eax,[r14+0x1]
   1403878fb:	mov    DWORD PTR [rip+0x22bca67],eax        # 0x142644368
   140387901:	lea    rdx,[rip+0x129e9b8]        # 0x1416262c0
   140387908:	lea    rcx,[rbp+0xc0]
   14038790f:	call   0x1400680e0
   140387914:	nop
   140387915:	xor    r9d,r9d
   140387918:	xor    r8d,r8d
   14038791b:	lea    rdx,[rbp+0xc0]
   140387922:	lea    rcx,[rip+0x22bc9b7]        # 0x1426442e0
   140387929:	call   0x140ad69a0
   14038792e:	nop
   14038792f:	lea    rcx,[rbp+0xc0]
   140387936:	call   0x14006f7e0
   14038793b:	mov    eax,DWORD PTR [rbp-0x48]
   14038793e:	lea    edi,[rax-0x5]
   140387941:	lea    esi,[rdi+0xa]
   140387944:	cmp    BYTE PTR [r13+0x37e],0x0
   14038794c:	je     0x140387954
   14038794e:	lea    edi,[rax-0xc]
   140387951:	lea    esi,[rdi+0x18]
   140387954:	lea    r14d,[r12+0x3]
   140387959:	mov    ebx,edi
   14038795b:	cmp    edi,esi
   14038795d:	jg     0x140387ac2
   140387963:	lea    r15d,[r14+0x1]
   140387967:	lea    r12d,[r14+0x2]
   14038796b:	nop    DWORD PTR [rax+rax*1+0x0]
   140387970:	mov    DWORD PTR [rip+0x22bc9ee],ebx        # 0x142644364
   140387976:	mov    DWORD PTR [rip+0x22bc9eb],r14d        # 0x142644368
   14038797d:	mov    rax,QWORD PTR [r13+0xb8]
   140387984:	test   BYTE PTR [rax+0x20c0],0x20
   14038798b:	jne    0x1403879b4
   14038798d:	cmp    ebx,edi
   14038798f:	jne    0x140387999
   140387991:	mov    edx,DWORD PTR [rip+0x22c714d]        # 0x14264eae4
   140387997:	jmp    0x1403879d0
   140387999:	lea    rcx,[rip+0x22bc940]        # 0x1426442e0
   1403879a0:	cmp    ebx,esi
   1403879a2:	jne    0x1403879ac
   1403879a4:	mov    edx,DWORD PTR [rip+0x22c7152]        # 0x14264eafc
   1403879aa:	jmp    0x1403879d7
   1403879ac:	mov    edx,DWORD PTR [rip+0x22c713e]        # 0x14264eaf0
   1403879b2:	jmp    0x1403879d7
   1403879b4:	cmp    ebx,edi
   1403879b6:	jne    0x1403879c0
   1403879b8:	mov    edx,DWORD PTR [rip+0x22c708a]        # 0x14264ea48
   1403879be:	jmp    0x1403879d0
   1403879c0:	cmp    ebx,esi
   1403879c2:	mov    edx,DWORD PTR [rip+0x22c7098]        # 0x14264ea60
   1403879c8:	je     0x1403879d0
   1403879ca:	mov    edx,DWORD PTR [rip+0x22c7084]        # 0x14264ea54
   1403879d0:	lea    rcx,[rip+0x22bc909]        # 0x1426442e0
   1403879d7:	call   0x140ad7b10
   1403879dc:	mov    DWORD PTR [rip+0x22bc982],ebx        # 0x142644364
   1403879e2:	mov    DWORD PTR [rip+0x22bc97f],r15d        # 0x142644368
   1403879e9:	mov    rax,QWORD PTR [r13+0xb8]
   1403879f0:	test   BYTE PTR [rax+0x20c0],0x20
   1403879f7:	jne    0x140387a20
   1403879f9:	cmp    ebx,edi
   1403879fb:	jne    0x140387a05
   1403879fd:	mov    edx,DWORD PTR [rip+0x22c70e5]        # 0x14264eae8
   140387a03:	jmp    0x140387a3c
   140387a05:	lea    rcx,[rip+0x22bc8d4]        # 0x1426442e0
   140387a0c:	cmp    ebx,esi
   140387a0e:	jne    0x140387a18
   140387a10:	mov    edx,DWORD PTR [rip+0x22c70ea]        # 0x14264eb00
   140387a16:	jmp    0x140387a43
   140387a18:	mov    edx,DWORD PTR [rip+0x22c70d6]        # 0x14264eaf4
   140387a1e:	jmp    0x140387a43
   140387a20:	cmp    ebx,edi
   140387a22:	jne    0x140387a2c
   140387a24:	mov    edx,DWORD PTR [rip+0x22c7022]        # 0x14264ea4c
   140387a2a:	jmp    0x140387a3c
   140387a2c:	cmp    ebx,esi
   140387a2e:	mov    edx,DWORD PTR [rip+0x22c7030]        # 0x14264ea64
   140387a34:	je     0x140387a3c
   140387a36:	mov    edx,DWORD PTR [rip+0x22c701c]        # 0x14264ea58
   140387a3c:	lea    rcx,[rip+0x22bc89d]        # 0x1426442e0
   140387a43:	call   0x140ad7b10
   140387a48:	mov    DWORD PTR [rip+0x22bc916],ebx        # 0x142644364
   140387a4e:	mov    DWORD PTR [rip+0x22bc913],r12d        # 0x142644368
   140387a55:	mov    rax,QWORD PTR [r13+0xb8]
   140387a5c:	test   BYTE PTR [rax+0x20c0],0x20
   140387a63:	jne    0x140387a8c
   140387a65:	cmp    ebx,edi
   140387a67:	jne    0x140387a71
   140387a69:	mov    edx,DWORD PTR [rip+0x22c707d]        # 0x14264eaec
   140387a6f:	jmp    0x140387aa8
   140387a71:	lea    rcx,[rip+0x22bc868]        # 0x1426442e0
   140387a78:	cmp    ebx,esi
   140387a7a:	jne    0x140387a84
   140387a7c:	mov    edx,DWORD PTR [rip+0x22c7082]        # 0x14264eb04
   140387a82:	jmp    0x140387aaf
   140387a84:	mov    edx,DWORD PTR [rip+0x22c706e]        # 0x14264eaf8
   140387a8a:	jmp    0x140387aaf
   140387a8c:	cmp    ebx,edi
   140387a8e:	jne    0x140387a98
   140387a90:	mov    edx,DWORD PTR [rip+0x22c6fba]        # 0x14264ea50
   140387a96:	jmp    0x140387aa8
   140387a98:	cmp    ebx,esi
   140387a9a:	mov    edx,DWORD PTR [rip+0x22c6fc8]        # 0x14264ea68
   140387aa0:	je     0x140387aa8
   140387aa2:	mov    edx,DWORD PTR [rip+0x22c6fb4]        # 0x14264ea5c
   140387aa8:	lea    rcx,[rip+0x22bc831]        # 0x1426442e0
   140387aaf:	call   0x140ad7b10
   140387ab4:	inc    ebx
   140387ab6:	cmp    ebx,esi
   140387ab8:	jle    0x140387970
   140387abe:	mov    r12d,DWORD PTR [rbp-0x20]
   140387ac2:	mov    rax,QWORD PTR [r13+0xb8]
   140387ac9:	test   BYTE PTR [rax+0x20c0],0x20
   140387ad0:	mov    DWORD PTR [rip+0x22bc892],0x1010007        # 0x14264436c
   140387ada:	je     0x140387ae6
   140387adc:	mov    DWORD PTR [rip+0x22bc886],0x1000000        # 0x14264436c
   140387ae6:	lea    eax,[rdi+0x3]
   140387ae9:	mov    DWORD PTR [rip+0x22bc875],eax        # 0x142644364
   140387aef:	lea    r15d,[r14+0x1]
   140387af3:	mov    DWORD PTR [rip+0x22bc86e],r15d        # 0x142644368
   140387afa:	lea    rcx,[rbp+0xc0]
   140387b01:	cmp    BYTE PTR [r13+0x37e],0x0
   140387b09:	je     0x140387b34
   140387b0b:	lea    rdx,[rip+0x129ef1e]        # 0x141626a30
   140387b12:	call   0x1400680e0
   140387b17:	nop
   140387b18:	xor    r9d,r9d
   140387b1b:	xor    r8d,r8d
   140387b1e:	lea    rdx,[rbp+0xc0]
   140387b25:	lea    rcx,[rip+0x22bc7b4]        # 0x1426442e0
   140387b2c:	call   0x140ad69a0
   140387b31:	nop
   140387b32:	jmp    0x140387b5b
   140387b34:	lea    rdx,[rip+0x126a4e5]        # 0x1415f2020
   140387b3b:	call   0x1400680e0
   140387b40:	nop
   140387b41:	xor    r9d,r9d
   140387b44:	xor    r8d,r8d
   140387b47:	lea    rdx,[rbp+0xc0]
   140387b4e:	lea    rcx,[rip+0x22bc78b]        # 0x1426442e0
   140387b55:	call   0x140ad69a0
   140387b5a:	nop
   140387b5b:	lea    rcx,[rbp+0xc0]
   140387b62:	call   0x14006f7e0
   140387b67:	cmp    QWORD PTR [r13+0xc0],0x0
   140387b6f:	je     0x1403880d8
   140387b75:	mov    esi,DWORD PTR [rbp-0x48]
   140387b78:	add    esi,0x14
   140387b7b:	lea    edi,[rsi+0x12]
   140387b7e:	lea    r14d,[r12+0x3]
   140387b83:	mov    ebx,esi
   140387b85:	cmp    esi,edi
   140387b87:	jg     0x140387d5b
   140387b8d:	lea    r12d,[r14+0x2]
   140387b91:	mov    DWORD PTR [rip+0x22bc7cd],ebx        # 0x142644364
   140387b97:	mov    DWORD PTR [rip+0x22bc7ca],r14d        # 0x142644368
   140387b9e:	cmp    BYTE PTR [rip+0x2003625],0x0        # 0x14238b1ca
   140387ba5:	je     0x140387bb9
   140387ba7:	mov    rcx,QWORD PTR [r13+0xc0]
   140387bae:	mov    eax,DWORD PTR [rip+0x20059ac]        # 0x14238d560
   140387bb4:	cmp    DWORD PTR [rcx+0x4],eax
   140387bb7:	je     0x140387bf9
   140387bb9:	mov    rax,QWORD PTR [r13+0xb8]
   140387bc0:	mov    r13d,DWORD PTR [rbp-0x64]
   140387bc4:	test   BYTE PTR [rax+0x20c0],0x20
   140387bcb:	jne    0x140387bfd
   140387bcd:	test   r13b,r13b
   140387bd0:	je     0x140387bfd
   140387bd2:	cmp    ebx,esi
   140387bd4:	jne    0x140387bde
   140387bd6:	mov    edx,DWORD PTR [rip+0x22c6f08]        # 0x14264eae4
   140387bdc:	jmp    0x140387c19
   140387bde:	lea    rcx,[rip+0x22bc6fb]        # 0x1426442e0
   140387be5:	cmp    ebx,edi
   140387be7:	jne    0x140387bf1
   140387be9:	mov    edx,DWORD PTR [rip+0x22c6f0d]        # 0x14264eafc
   140387bef:	jmp    0x140387c20
   140387bf1:	mov    edx,DWORD PTR [rip+0x22c6ef9]        # 0x14264eaf0
   140387bf7:	jmp    0x140387c20
   140387bf9:	mov    r13d,DWORD PTR [rbp-0x64]
   140387bfd:	cmp    ebx,esi
   140387bff:	jne    0x140387c09
   140387c01:	mov    edx,DWORD PTR [rip+0x22c6e41]        # 0x14264ea48
   140387c07:	jmp    0x140387c19
   140387c09:	cmp    ebx,edi
   140387c0b:	mov    edx,DWORD PTR [rip+0x22c6e4f]        # 0x14264ea60
   140387c11:	je     0x140387c19
   140387c13:	mov    edx,DWORD PTR [rip+0x22c6e3b]        # 0x14264ea54
   140387c19:	lea    rcx,[rip+0x22bc6c0]        # 0x1426442e0
   140387c20:	call   0x140ad7b10
   140387c25:	mov    DWORD PTR [rip+0x22bc739],ebx        # 0x142644364
   140387c2b:	mov    DWORD PTR [rip+0x22bc736],r15d        # 0x142644368
   140387c32:	cmp    BYTE PTR [rip+0x2003591],0x0        # 0x14238b1ca
   140387c39:	je     0x140387c51
   140387c3b:	mov    rax,QWORD PTR [rbp-0x80]
   140387c3f:	mov    rcx,QWORD PTR [rax+0xc0]
   140387c46:	mov    eax,DWORD PTR [rip+0x2005914]        # 0x14238d560
   140387c4c:	cmp    DWORD PTR [rcx+0x4],eax
   140387c4f:	je     0x140387c91
   140387c51:	mov    rax,QWORD PTR [rbp-0x80]
   140387c55:	mov    rax,QWORD PTR [rax+0xb8]
   140387c5c:	test   BYTE PTR [rax+0x20c0],0x20
   140387c63:	jne    0x140387c91
   140387c65:	test   r13b,r13b
   140387c68:	je     0x140387c91
   140387c6a:	cmp    ebx,esi
   140387c6c:	jne    0x140387c76
   140387c6e:	mov    edx,DWORD PTR [rip+0x22c6e74]        # 0x14264eae8
   140387c74:	jmp    0x140387cad
   140387c76:	lea    rcx,[rip+0x22bc663]        # 0x1426442e0
   140387c7d:	cmp    ebx,edi
   140387c7f:	jne    0x140387c89
   140387c81:	mov    edx,DWORD PTR [rip+0x22c6e79]        # 0x14264eb00
   140387c87:	jmp    0x140387cb4
   140387c89:	mov    edx,DWORD PTR [rip+0x22c6e65]        # 0x14264eaf4
   140387c8f:	jmp    0x140387cb4
   140387c91:	cmp    ebx,esi
   140387c93:	jne    0x140387c9d
   140387c95:	mov    edx,DWORD PTR [rip+0x22c6db1]        # 0x14264ea4c
   140387c9b:	jmp    0x140387cad
   140387c9d:	cmp    ebx,edi
   140387c9f:	mov    edx,DWORD PTR [rip+0x22c6dbf]        # 0x14264ea64
   140387ca5:	je     0x140387cad
   140387ca7:	mov    edx,DWORD PTR [rip+0x22c6dab]        # 0x14264ea58
   140387cad:	lea    rcx,[rip+0x22bc62c]        # 0x1426442e0
   140387cb4:	call   0x140ad7b10
   140387cb9:	mov    DWORD PTR [rip+0x22bc6a5],ebx        # 0x142644364
   140387cbf:	mov    DWORD PTR [rip+0x22bc6a2],r12d        # 0x142644368
   140387cc6:	cmp    BYTE PTR [rip+0x20034fd],0x0        # 0x14238b1ca
   140387ccd:	je     0x140387ce5
   140387ccf:	mov    rax,QWORD PTR [rbp-0x80]
   140387cd3:	mov    rcx,QWORD PTR [rax+0xc0]
   140387cda:	mov    eax,DWORD PTR [rip+0x2005880]        # 0x14238d560
   140387ce0:	cmp    DWORD PTR [rcx+0x4],eax
   140387ce3:	je     0x140387d25
   140387ce5:	mov    rax,QWORD PTR [rbp-0x80]
   140387ce9:	mov    rax,QWORD PTR [rax+0xb8]
   140387cf0:	test   BYTE PTR [rax+0x20c0],0x20
   140387cf7:	jne    0x140387d25
   140387cf9:	test   r13b,r13b
   140387cfc:	je     0x140387d25
   140387cfe:	cmp    ebx,esi
   140387d00:	jne    0x140387d0a
   140387d02:	mov    edx,DWORD PTR [rip+0x22c6de4]        # 0x14264eaec
   140387d08:	jmp    0x140387d41
   140387d0a:	lea    rcx,[rip+0x22bc5cf]        # 0x1426442e0
   140387d11:	cmp    ebx,edi
   140387d13:	jne    0x140387d1d
   140387d15:	mov    edx,DWORD PTR [rip+0x22c6de9]        # 0x14264eb04
   140387d1b:	jmp    0x140387d48
   140387d1d:	mov    edx,DWORD PTR [rip+0x22c6dd5]        # 0x14264eaf8
   140387d23:	jmp    0x140387d48
   140387d25:	cmp    ebx,esi
   140387d27:	jne    0x140387d31
   140387d29:	mov    edx,DWORD PTR [rip+0x22c6d21]        # 0x14264ea50
   140387d2f:	jmp    0x140387d41
   140387d31:	cmp    ebx,edi
   140387d33:	mov    edx,DWORD PTR [rip+0x22c6d2f]        # 0x14264ea68
   140387d39:	je     0x140387d41
   140387d3b:	mov    edx,DWORD PTR [rip+0x22c6d1b]        # 0x14264ea5c
   140387d41:	lea    rcx,[rip+0x22bc598]        # 0x1426442e0
   140387d48:	call   0x140ad7b10
   140387d4d:	inc    ebx
   140387d4f:	cmp    ebx,edi
   140387d51:	mov    r13,QWORD PTR [rbp-0x80]
   140387d55:	jle    0x140387b91
   140387d5b:	cmp    BYTE PTR [rip+0x2003468],0x0        # 0x14238b1ca
   140387d62:	je     0x140387d76
   140387d64:	mov    rcx,QWORD PTR [r13+0xc0]
   140387d6b:	mov    eax,DWORD PTR [rip+0x20057ef]        # 0x14238d560
   140387d71:	cmp    DWORD PTR [rcx+0x4],eax
   140387d74:	je     0x140387d96
   140387d76:	mov    rax,QWORD PTR [r13+0xb8]
   140387d7d:	test   BYTE PTR [rax+0x20c0],0x20
   140387d84:	jne    0x140387d96
   140387d86:	cmp    BYTE PTR [rbp-0x64],0x0
   140387d8a:	mov    DWORD PTR [rip+0x22bc5d8],0x1010007        # 0x14264436c
   140387d94:	jne    0x140387da0
   140387d96:	mov    DWORD PTR [rip+0x22bc5cc],0x1000000        # 0x14264436c
   140387da0:	lea    eax,[rsi+0x3]
   140387da3:	mov    DWORD PTR [rip+0x22bc5bb],eax        # 0x142644364
   140387da9:	lea    eax,[r14+0x1]
   140387dad:	mov    DWORD PTR [rip+0x22bc5b5],eax        # 0x142644368
   140387db3:	lea    rdx,[rip+0x129ec66]        # 0x141626a20
   140387dba:	lea    rcx,[rbp+0xc0]
   140387dc1:	call   0x1400680e0
   140387dc6:	nop
   140387dc7:	xor    r9d,r9d
   140387dca:	xor    r8d,r8d
   140387dcd:	lea    rdx,[rbp+0xc0]
   140387dd4:	lea    rcx,[rip+0x22bc505]        # 0x1426442e0
   140387ddb:	call   0x140ad69a0
   140387de0:	nop
   140387de1:	lea    rcx,[rbp+0xc0]
   140387de8:	call   0x14006f7e0
   140387ded:	jmp    0x1403880d8
   140387df2:	cmp    QWORD PTR [r14+0xd0],0x0
   140387dfa:	je     0x140387fc4
   140387e00:	xor    edx,edx
   140387e02:	lea    rcx,[rip+0x203f857]        # 0x1423c7660
   140387e09:	call   0x140071f20
   140387e0e:	test   al,al
   140387e10:	je     0x140387f04
   140387e16:	lea    rcx,[rbp+0x120]
   140387e1d:	call   0x14006f620
   140387e22:	nop
   140387e23:	mov    r8,QWORD PTR [r14+0xd0]
   140387e2a:	lea    rax,[rsp+0x70]
   140387e2f:	mov    QWORD PTR [rsp+0x50],rax
   140387e34:	mov    QWORD PTR [rsp+0x48],0x0
   140387e3d:	mov    QWORD PTR [rsp+0x40],r8
   140387e42:	mov    DWORD PTR [rsp+0x38],0x800
   140387e4a:	movzx  eax,WORD PTR [r8+0xa0]
   140387e52:	mov    WORD PTR [rsp+0x30],ax
   140387e57:	mov    eax,0xffffffff
   140387e5c:	mov    WORD PTR [rsp+0x28],ax
   140387e61:	mov    WORD PTR [rsp+0x20],ax
   140387e66:	movzx  r9d,WORD PTR [r8+0x12c]
   140387e6e:	movzx  r8d,WORD PTR [r8+0xa4]
   140387e76:	lea    rdx,[rbp+0x120]
   140387e7d:	lea    rcx,[rip+0x215eab4]        # 0x1424e6938
   140387e84:	call   0x1400f2670
   140387e89:	mov    ebx,eax
   140387e8b:	mov    edi,DWORD PTR [rbp-0x78]
   140387e8e:	lea    rcx,[rip+0x22bc44b]        # 0x1426442e0
   140387e95:	cmp    BYTE PTR [rsp+0x70],0x0
   140387e9a:	je     0x140387eb9
   140387e9c:	lea    r8d,[rdi+0x1]
   140387ea0:	mov    edx,0x5
   140387ea5:	call   0x1400bb0b0
   140387eaa:	test   ebx,ebx
   140387eac:	je     0x140387ef6
   140387eae:	mov    r9d,0x6
   140387eb4:	xor    r8d,r8d
   140387eb7:	jmp    0x140387ed2
   140387eb9:	lea    r8d,[rdi+0x5]
   140387ebd:	mov    edx,r15d
   140387ec0:	call   0x1400bb0b0
   140387ec5:	test   ebx,ebx
   140387ec7:	je     0x140387ef6
   140387ec9:	mov    r9d,0x2
   140387ecf:	mov    r8d,r9d
   140387ed2:	mov    BYTE PTR [rsp+0x30],0x0
   140387ed7:	mov    DWORD PTR [rsp+0x28],0x3
   140387edf:	mov    DWORD PTR [rsp+0x20],0x5
   140387ee7:	mov    edx,ebx
   140387ee9:	lea    rcx,[rip+0x22bc3f0]        # 0x1426442e0
   140387ef0:	call   0x140ad7db0
   140387ef5:	nop
   140387ef6:	lea    rcx,[rbp+0x120]
   140387efd:	call   0x140067dc0
   140387f02:	jmp    0x140387f50
   140387f04:	mov    edi,DWORD PTR [rbp-0x78]
   140387f07:	lea    r8d,[rdi+0x7]
   140387f0b:	mov    edx,0x9
   140387f10:	lea    rcx,[rip+0x22bc3c9]        # 0x1426442e0
   140387f17:	call   0x1400bb0b0
   140387f1c:	xor    edx,edx
   140387f1e:	xor    r9d,r9d
   140387f21:	mov    r8b,0x1
   140387f24:	mov    rcx,QWORD PTR [r14+0xd0]
   140387f2b:	call   0x14132eb30
   140387f30:	mov    rcx,QWORD PTR [r14+0xd0]
   140387f37:	mov    rax,QWORD PTR [rcx]
   140387f3a:	xor    edx,edx
   140387f3c:	call   QWORD PTR [rax]
   140387f3e:	movzx  edx,al
   140387f41:	mov    r8b,0x1
   140387f44:	lea    rcx,[rip+0x22bc395]        # 0x1426442e0
   140387f4b:	call   0x1400bb120
   140387f50:	lea    rcx,[rbp+0xc0]
   140387f57:	call   0x14006f620
   140387f5c:	nop
   140387f5d:	xor    r8d,r8d
   140387f60:	lea    rdx,[rbp+0xc0]
   140387f67:	mov    rcx,QWORD PTR [r14+0xd0]
   140387f6e:	call   0x14132bba0
   140387f73:	xor    edx,edx
   140387f75:	xor    r9d,r9d
   140387f78:	mov    r8b,0x1
   140387f7b:	mov    rcx,QWORD PTR [r14+0xd0]
   140387f82:	call   0x14132eb30
   140387f87:	lea    r8d,[rdi+0xd]
   140387f8b:	mov    edx,0x5
   140387f90:	lea    rcx,[rip+0x22bc349]        # 0x1426442e0
   140387f97:	call   0x1400bb0b0
   140387f9c:	xor    r9d,r9d
   140387f9f:	xor    r8d,r8d
   140387fa2:	lea    rdx,[rbp+0xc0]
   140387fa9:	lea    rcx,[rip+0x22bc330]        # 0x1426442e0
   140387fb0:	call   0x140ad69a0
   140387fb5:	nop
   140387fb6:	lea    rcx,[rbp+0xc0]
   140387fbd:	call   0x140067dc0
   140387fc2:	jmp    0x140387fc7
   140387fc4:	mov    edi,DWORD PTR [rbp-0x78]
   140387fc7:	xor    r8d,r8d
   140387fca:	mov    edx,0x6
   140387fcf:	mov    r9b,0x1
   140387fd2:	lea    rcx,[rip+0x22bc307]        # 0x1426442e0
   140387fd9:	call   0x1400bb0c0
   140387fde:	mov    edx,0x7
   140387fe3:	lea    rcx,[rip+0x22bc2f6]        # 0x1426442e0
   140387fea:	cmp    BYTE PTR [r14+0xc9],0x0
   140387ff2:	je     0x14038807e
   140387ff8:	lea    r8d,[rdi+0xd]
   140387ffc:	call   0x1400bb0b0
   140388001:	lea    rdx,[rip+0x129e0e0]        # 0x1416260e8
   140388008:	lea    rcx,[rbp+0xc0]
   14038800f:	call   0x1400680e0
   140388014:	nop
   140388015:	xor    r9d,r9d
   140388018:	xor    r8d,r8d
   14038801b:	lea    rdx,[rbp+0xc0]
   140388022:	lea    rcx,[rip+0x22bc2b7]        # 0x1426442e0
   140388029:	call   0x140ad69a0
   14038802e:	nop
   14038802f:	lea    rcx,[rbp+0xc0]
   140388036:	call   0x140067dc0
   14038803b:	lea    r8d,[rdi+0xd]
   14038803f:	mov    edx,r15d
   140388042:	lea    rcx,[rip+0x22bc297]        # 0x1426442e0
   140388049:	call   0x1400bb0b0
   14038804e:	lea    rdx,[rip+0x129e07b]        # 0x1416260d0
   140388055:	lea    rcx,[rbp+0xc0]
   14038805c:	call   0x1400680e0
   140388061:	nop
   140388062:	xor    r9d,r9d
   140388065:	xor    r8d,r8d
   140388068:	lea    rdx,[rbp+0xc0]
   14038806f:	lea    rcx,[rip+0x22bc26a]        # 0x1426442e0
   140388076:	call   0x140ad69a0
   14038807b:	nop
   14038807c:	jmp    0x1403880cc
   14038807e:	xor    r8d,r8d
   140388081:	xor    r9d,r9d
   140388084:	call   0x1400bb0c0
   140388089:	lea    r8d,[rdi+0xd]
   14038808d:	mov    edx,0x7
   140388092:	lea    rcx,[rip+0x22bc247]        # 0x1426442e0
   140388099:	call   0x1400bb0b0
   14038809e:	lea    rdx,[rip+0x129e09b]        # 0x141626140
   1403880a5:	lea    rcx,[rbp+0xc0]
   1403880ac:	call   0x1400680e0
   1403880b1:	nop
   1403880b2:	xor    r9d,r9d
   1403880b5:	xor    r8d,r8d
   1403880b8:	lea    rdx,[rbp+0xc0]
   1403880bf:	lea    rcx,[rip+0x22bc21a]        # 0x1426442e0
   1403880c6:	call   0x140ad69a0
   1403880cb:	nop
   1403880cc:	lea    rcx,[rbp+0xc0]
   1403880d3:	call   0x140067dc0
   1403880d8:	mov    rcx,QWORD PTR [rbp+0x180]
   1403880df:	xor    rcx,rsp
   1403880e2:	call   0x1415345d0
   1403880e7:	add    rsp,0x298
   1403880ee:	pop    r15
   1403880f0:	pop    r14
   1403880f2:	pop    r13
   1403880f4:	pop    r12
   1403880f6:	pop    rdi
   1403880f7:	pop    rsi
   1403880f8:	pop    rbx
   1403880f9:	pop    rbp
   1403880fa:	ret
   1403880fb:	nop
   1403880fc:	in     al,0x37
   1403880fe:	cmp    BYTE PTR [rax],al
   140388100:	rex.W cmp dil,BYTE PTR [rax]
   140388103:	add    BYTE PTR [rdx+rdi*1+0x38],dl
   140388107:	add    BYTE PTR [rax+0x3a],ah
   14038810a:	cmp    BYTE PTR [rax],al
   14038810c:	ins    BYTE PTR [rdi],dx
   14038810d:	cmp    bh,BYTE PTR [rax]
   14038810f:	add    BYTE PTR [rax+0x3a],bh
   140388112:	cmp    BYTE PTR [rax],al
   140388114:	test   BYTE PTR [rdx],bh
   140388116:	cmp    BYTE PTR [rax],al
   140388118:	xor    BYTE PTR [rbx],bh
   14038811a:	cmp    BYTE PTR [rax],al
   14038811c:	cmp    al,0x3b
   14038811e:	cmp    BYTE PTR [rax],al
   140388120:	xchg   edx,eax
   140388121:	cmp    edi,DWORD PTR [rax]
   140388123:	add    BYTE PTR [rsi+0x800383b],bl
   140388129:	cmp    al,0x38
   14038812b:	add    BYTE PTR [rdx+0x3c],dh
   14038812e:	cmp    BYTE PTR [rax],al
   140388130:	jle    0x14038816e
   140388132:	cmp    BYTE PTR [rax],al
   140388134:	popf
   140388135:	cmp    al,0x38
   140388137:	add    BYTE PTR [rcx-0x37ffc7c4],ch
   14038813d:	cmp    al,0x38
   14038813f:	add    ah,dl
   140388141:	cmp    al,0x38
   140388143:	add    BYTE PTR [rbx],bl
   140388145:	cmp    eax,0x3d530038
   14038814a:	cmp    BYTE PTR [rax],al
   14038814c:	(bad)
   14038814d:	cmp    eax,0x3d790038
   140388152:	cmp    BYTE PTR [rax],al
   140388154:	jns    0x140388193
   140388156:	cmp    BYTE PTR [rax],al
   140388158:	jns    0x140388197
   14038815a:	cmp    BYTE PTR [rax],al
   14038815c:	nop
   14038815d:	cmp    bh,BYTE PTR [rax]
   14038815f:	add    dl,dh
   140388161:	cmp    bh,BYTE PTR [rax]
   140388163:	add    BYTE PTR [rcx],dl
   140388165:	cmp    edi,DWORD PTR [rax]
   140388167:	add    dl,ah
   140388169:	cmp    DWORD PTR [rax],edi
   14038816b:	.byte 0
   14038816c:	pushf
   14038816d:	cmp    bh,BYTE PTR [rax]
	...
