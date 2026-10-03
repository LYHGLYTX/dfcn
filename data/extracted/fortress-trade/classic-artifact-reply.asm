
C:/Users/WIN11/Downloads/df_53_16_win/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140368580 <.text+0x367580>:
   140368580:	test   rdx,rdx
   140368583:	je     0x140368c67
   140368589:	mov    QWORD PTR [rsp+0x10],rbx
   14036858e:	mov    QWORD PTR [rsp+0x18],rsi
   140368593:	mov    QWORD PTR [rsp+0x20],rdi
   140368598:	push   rbp
   140368599:	push   r12
   14036859b:	push   r13
   14036859d:	push   r14
   14036859f:	push   r15
   1403685a1:	lea    rbp,[rsp-0x27]
   1403685a6:	sub    rsp,0xa0
   1403685ad:	mov    rax,QWORD PTR [rip+0x152da8c]        # 0x141896040
   1403685b4:	xor    rax,rsp
   1403685b7:	mov    QWORD PTR [rbp+0x1f],rax
   1403685bb:	mov    r12,rcx
   1403685be:	mov    QWORD PTR [rbp-0x49],rcx
   1403685c2:	test   r8,r8
   1403685c5:	je     0x140368c3b
   1403685cb:	test   r9,r9
   1403685ce:	je     0x140368c3b
   1403685d4:	cmp    QWORD PTR [rcx+0xd0],0x0
   1403685dc:	je     0x140368c3b
   1403685e2:	movzx  esi,BYTE PTR [rbp+0x7f]
   1403685e6:	cmp    r8,QWORD PTR [rcx+0xc0]
   1403685ed:	je     0x1403685f8
   1403685ef:	test   sil,sil
   1403685f2:	je     0x140368c3b
   1403685f8:	test   DWORD PTR [rdx+0x10],0x40000
   1403685ff:	je     0x140368c3b
   140368605:	mov    rbx,QWORD PTR [rdx+0x38]
   140368609:	mov    rdi,QWORD PTR [rdx+0x40]
   14036860d:	nop    DWORD PTR [rax]
   140368610:	cmp    rbx,rdi
   140368613:	jae    0x140368c3b
   140368619:	mov    rcx,QWORD PTR [rbx]
   14036861c:	mov    rax,QWORD PTR [rcx]
   14036861f:	call   QWORD PTR [rax+0x10]
   140368622:	cmp    eax,0x1
   140368625:	je     0x14036862d
   140368627:	add    rbx,0x8
   14036862b:	jmp    0x140368610
   14036862d:	mov    rcx,QWORD PTR [rbx]
   140368630:	mov    rax,QWORD PTR [rcx]
   140368633:	call   QWORD PTR [rax+0x40]
   140368636:	mov    rbx,rax
   140368639:	test   rax,rax
   14036863c:	je     0x140368c3b
   140368642:	mov    rcx,QWORD PTR [rax+0xc8]
   140368649:	sub    rcx,QWORD PTR [rax+0xc0]
   140368650:	sar    rcx,0x2
   140368654:	test   rcx,rcx
   140368657:	jne    0x14036868b
   140368659:	mov    rax,QWORD PTR [rax+0xe0]
   140368660:	sub    rax,QWORD PTR [rbx+0xd8]
   140368667:	sar    rax,0x2
   14036866b:	test   rax,rax
   14036866e:	jne    0x14036868b
   140368670:	mov    rax,QWORD PTR [rbx+0xf8]
   140368677:	sub    rax,QWORD PTR [rbx+0xf0]
   14036867e:	sar    rax,0x2
   140368682:	test   rax,rax
   140368685:	je     0x140368c3b
   14036868b:	xorps  xmm0,xmm0
   14036868e:	movups XMMWORD PTR [rbp-0x1],xmm0
   140368692:	mov    QWORD PTR [rbp+0xf],0x0
   14036869a:	mov    QWORD PTR [rbp+0x17],0xf
   1403686a2:	mov    BYTE PTR [rbp-0x1],0x0
   1403686a6:	lea    r15,[r12+0x3c0]
   1403686ae:	mov    rax,QWORD PTR [r15+0x8]
   1403686b2:	sub    rax,QWORD PTR [r15]
   1403686b5:	test   rax,0xfffffffffffffff8
   1403686bb:	jne    0x1403686d4
   1403686bd:	mov    DWORD PTR [r12+0x3d8],0x0
   1403686c9:	mov    BYTE PTR [r12+0x3dc],0x0
   1403686d2:	jmp    0x140368730
   1403686d4:	mov    ecx,0x20
   1403686d9:	call   0x141534600
   1403686de:	mov    rdi,rax
   1403686e1:	xorps  xmm0,xmm0
   1403686e4:	movups XMMWORD PTR [rax],xmm0
   1403686e7:	mov    QWORD PTR [rax+0x10],0x0
   1403686ef:	mov    QWORD PTR [rax+0x18],0xf
   1403686f7:	mov    BYTE PTR [rax],0x0
   1403686fa:	mov    QWORD PTR [rbp-0x59],rax
   1403686fe:	xor    r8d,r8d
   140368701:	lea    rdx,[rip+0x127dda8]        # 0x1415e64b0
   140368708:	mov    rcx,rax
   14036870b:	call   0x14006f860
   140368710:	mov    rdx,QWORD PTR [r15+0x8]
   140368714:	cmp    rdx,QWORD PTR [r15+0x10]
   140368718:	je     0x140368724
   14036871a:	mov    QWORD PTR [rdx],rdi
   14036871d:	add    QWORD PTR [r15+0x8],0x8
   140368722:	jmp    0x140368730
   140368724:	lea    r8,[rbp-0x59]
   140368728:	mov    rcx,r15
   14036872b:	call   0x1400bacc0
   140368730:	cmp    BYTE PTR [rbp+0x77],0x0
   140368734:	je     0x1403687a4
   140368736:	mov    r8d,0xa
   14036873c:	lea    rdx,[rip+0x12bca65]        # 0x1416251a8
   140368743:	lea    rcx,[rbp-0x1]
   140368747:	call   0x14006f9a0
   14036874c:	mov    r8,QWORD PTR [r12+0xc0]
   140368754:	xor    r9d,r9d
   140368757:	mov    r8d,DWORD PTR [r8+0x4]
   14036875b:	lea    rdx,[rbp-0x1]
   14036875f:	call   0x140b8f940
   140368764:	mov    r8d,0x1a
   14036876a:	lea    rdx,[rip+0x12bca7f]        # 0x1416251f0
   140368771:	lea    rcx,[rbp-0x1]
   140368775:	call   0x14006f9a0
   14036877a:	xor    r9d,r9d
   14036877d:	mov    r8d,DWORD PTR [rbx]
   140368780:	lea    rdx,[rbp-0x1]
   140368784:	call   0x140b91440
   140368789:	mov    r8d,0x1
   14036878f:	lea    rdx,[rip+0x127adde]        # 0x1415e3574
   140368796:	lea    rcx,[rbp-0x1]
   14036879a:	call   0x14006f9a0
   14036879f:	jmp    0x14036888c
   1403687a4:	test   sil,sil
   1403687a7:	je     0x1403687e9
   1403687a9:	mov    r8d,0x1a
   1403687af:	lea    rdx,[rip+0x12bca1a]        # 0x1416251d0
   1403687b6:	lea    rcx,[rbp-0x1]
   1403687ba:	call   0x14006f9a0
   1403687bf:	xor    r9d,r9d
   1403687c2:	mov    r8d,DWORD PTR [rbx]
   1403687c5:	lea    rdx,[rbp-0x1]
   1403687c9:	call   0x140b91440
   1403687ce:	mov    r8d,0x18
   1403687d4:	lea    rdx,[rip+0x12bca75]        # 0x141625250
   1403687db:	lea    rcx,[rbp-0x1]
   1403687df:	call   0x14006f9a0
   1403687e4:	jmp    0x14036888c
   1403687e9:	xorps  xmm0,xmm0
   1403687ec:	movups XMMWORD PTR [rbp-0x21],xmm0
   1403687f0:	mov    QWORD PTR [rbp-0x11],0x0
   1403687f8:	mov    QWORD PTR [rbp-0x9],0xf
   140368800:	mov    BYTE PTR [rbp-0x21],0x0
   140368804:	xor    r9d,r9d
   140368807:	mov    r8d,DWORD PTR [rbx]
   14036880a:	lea    rdx,[rbp-0x21]
   14036880e:	call   0x140b91440
   140368813:	lea    rcx,[rbp-0x21]
   140368817:	call   0x14052b070
   14036881c:	lea    rdx,[rbp-0x21]
   140368820:	cmp    QWORD PTR [rbp-0x9],0xf
   140368825:	cmova  rdx,QWORD PTR [rbp-0x21]
   14036882a:	mov    r8,QWORD PTR [rbp-0x11]
   14036882e:	lea    rcx,[rbp-0x1]
   140368832:	call   0x14006f9a0
   140368837:	mov    r8d,0x3d
   14036883d:	lea    rdx,[rip+0x12bc9cc]        # 0x141625210
   140368844:	lea    rcx,[rbp-0x1]
   140368848:	call   0x14006f9a0
   14036884d:	nop
   14036884e:	mov    rdx,QWORD PTR [rbp-0x9]
   140368852:	cmp    rdx,0xf
   140368856:	jbe    0x14036888c
   140368858:	inc    rdx
   14036885b:	mov    rcx,QWORD PTR [rbp-0x21]
   14036885f:	mov    rax,rcx
   140368862:	cmp    rdx,0x1000
   140368869:	jb     0x140368887
   14036886b:	add    rdx,0x27
   14036886f:	mov    rcx,QWORD PTR [rcx-0x8]
   140368873:	sub    rax,rcx
   140368876:	add    rax,0xfffffffffffffff8
   14036887a:	cmp    rax,0x1f
   14036887e:	jbe    0x140368887
   140368880:	call   QWORD PTR [rip+0x127821a]        # 0x1415e0aa0
   140368886:	int3
   140368887:	call   0x1415345f0
   14036888c:	xorps  xmm0,xmm0
   14036888f:	movdqu XMMWORD PTR [rbp-0x21],xmm0
   140368894:	mov    QWORD PTR [rbp-0x11],0x0
   14036889c:	mov    ecx,0x20
   1403688a1:	call   0x141534600
   1403688a6:	xorps  xmm0,xmm0
   1403688a9:	movups XMMWORD PTR [rax],xmm0
   1403688ac:	mov    QWORD PTR [rax+0x10],0x0
   1403688b4:	mov    QWORD PTR [rax+0x18],0xf
   1403688bc:	mov    BYTE PTR [rax],0x0
   1403688bf:	mov    QWORD PTR [rbp-0x59],rax
   1403688c3:	lea    rcx,[rbp-0x1]
   1403688c7:	cmp    rax,rcx
   1403688ca:	je     0x1403688e6
   1403688cc:	lea    rdx,[rbp-0x1]
   1403688d0:	cmp    QWORD PTR [rbp+0x17],0xf
   1403688d5:	cmova  rdx,QWORD PTR [rbp-0x1]
   1403688da:	mov    r8,QWORD PTR [rbp+0xf]
   1403688de:	mov    rcx,rax
   1403688e1:	call   0x14006f860
   1403688e6:	lea    r8,[rbp-0x59]
   1403688ea:	xor    edx,edx
   1403688ec:	lea    rcx,[rbp-0x21]
   1403688f0:	call   0x1400bacc0
   1403688f5:	xor    bl,bl
   1403688f7:	xorps  xmm0,xmm0
   1403688fa:	movups XMMWORD PTR [rbp-0x41],xmm0
   1403688fe:	xor    esi,esi
   140368900:	mov    QWORD PTR [rbp-0x31],rsi
   140368904:	mov    QWORD PTR [rbp-0x29],0xf
   14036890c:	mov    BYTE PTR [rbp-0x41],bl
   14036890f:	mov    DWORD PTR [rbp-0x51],esi
   140368912:	mov    r13,QWORD PTR [rbp-0x19]
   140368916:	mov    rax,r13
   140368919:	mov    r14,QWORD PTR [rbp-0x21]
   14036891d:	sub    rax,r14
   140368920:	sar    rax,0x3
   140368924:	mov    QWORD PTR [rbp-0x59],rax
   140368928:	test   rax,rax
   14036892b:	je     0x140368b5e
   140368931:	mov    r12,r14
   140368934:	mov    r13d,esi
   140368937:	nop    WORD PTR [rax+rax*1+0x0]
   140368940:	xor    r14d,r14d
   140368943:	xor    edi,edi
   140368945:	mov    rcx,QWORD PTR [r12]
   140368949:	cmp    QWORD PTR [rcx+0x10],rdi
   14036894d:	jbe    0x140368acd
   140368953:	test   bl,bl
   140368955:	je     0x140368970
   140368957:	mov    rax,rcx
   14036895a:	cmp    QWORD PTR [rcx+0x18],0xf
   14036895f:	jbe    0x140368964
   140368961:	mov    rax,QWORD PTR [rcx]
   140368964:	cmp    BYTE PTR [rdi+rax*1],0x20
   140368968:	je     0x140368ab6
   14036896e:	xor    bl,bl
   140368970:	cmp    QWORD PTR [rcx+0x18],0xf
   140368975:	jbe    0x14036897a
   140368977:	mov    rcx,QWORD PTR [rcx]
   14036897a:	movzx  edx,BYTE PTR [rdi+rcx*1]
   14036897e:	lea    rcx,[rbp-0x41]
   140368982:	call   0x1400b9b10
   140368987:	mov    rsi,QWORD PTR [rbp-0x31]
   14036898b:	cmp    rsi,0x44
   14036898f:	jbe    0x140368ab6
   140368995:	mov    r10d,r14d
   140368998:	xor    edx,edx
   14036899a:	xor    r8d,r8d
   14036899d:	mov    rcx,QWORD PTR [r12]
   1403689a1:	mov    r9,QWORD PTR [rcx+0x18]
   1403689a5:	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   1403689b0:	dec    r14d
   1403689b3:	dec    rdi
   1403689b6:	inc    edx
   1403689b8:	inc    r8
   1403689bb:	mov    rax,rcx
   1403689be:	cmp    r9,0xf
   1403689c2:	jbe    0x1403689c7
   1403689c4:	mov    rax,QWORD PTR [rcx]
   1403689c7:	cmp    BYTE PTR [rdi+rax*1],0x20
   1403689cb:	je     0x1403689d2
   1403689cd:	test   rdi,rdi
   1403689d0:	jg     0x1403689b0
   1403689d2:	movsxd rax,edx
   1403689d5:	cmp    rax,rsi
   1403689d8:	jne    0x1403689f8
   1403689da:	lea    eax,[r10-0x1]
   1403689de:	movsxd rdx,eax
   1403689e1:	mov    r9d,0x1
   1403689e7:	lea    r8,[rip+0x127ad32]        # 0x1415e3720
   1403689ee:	call   0x1404ee4f0
   1403689f3:	jmp    0x140368a99
   1403689f8:	mov    rdx,rsi
   1403689fb:	sub    rdx,r8
   1403689fe:	cmp    rdx,rsi
   140368a01:	ja     0x140368a1b
   140368a03:	mov    QWORD PTR [rbp-0x31],rdx
   140368a07:	lea    rax,[rbp-0x41]
   140368a0b:	cmp    QWORD PTR [rbp-0x29],0xf
   140368a10:	cmova  rax,QWORD PTR [rbp-0x41]
   140368a15:	mov    BYTE PTR [rax+rdx*1],0x0
   140368a19:	jmp    0x140368a2a
   140368a1b:	sub    rdx,rsi
   140368a1e:	xor    r8d,r8d
   140368a21:	lea    rcx,[rbp-0x41]
   140368a25:	call   0x1400e1240
   140368a2a:	mov    ecx,0x20
   140368a2f:	call   0x141534600
   140368a34:	mov    rbx,rax
   140368a37:	xorps  xmm0,xmm0
   140368a3a:	movups XMMWORD PTR [rax],xmm0
   140368a3d:	mov    QWORD PTR [rax+0x10],0x0
   140368a45:	mov    QWORD PTR [rax+0x18],0xf
   140368a4d:	mov    BYTE PTR [rax],0x0
   140368a50:	mov    QWORD PTR [rbp-0x51],rax
   140368a54:	lea    rax,[rbp-0x41]
   140368a58:	cmp    rbx,rax
   140368a5b:	je     0x140368a77
   140368a5d:	lea    rdx,[rbp-0x41]
   140368a61:	cmp    QWORD PTR [rbp-0x29],0xf
   140368a66:	cmova  rdx,QWORD PTR [rbp-0x41]
   140368a6b:	mov    r8,QWORD PTR [rbp-0x31]
   140368a6f:	mov    rcx,rbx
   140368a72:	call   0x14006f860
   140368a77:	mov    rdx,QWORD PTR [r15+0x8]
   140368a7b:	cmp    rdx,QWORD PTR [r15+0x10]
   140368a7f:	je     0x140368a8b
   140368a81:	mov    QWORD PTR [rdx],rbx
   140368a84:	add    QWORD PTR [r15+0x8],0x8
   140368a89:	jmp    0x140368a97
   140368a8b:	lea    r8,[rbp-0x51]
   140368a8f:	mov    rcx,r15
   140368a92:	call   0x1400bacc0
   140368a97:	mov    bl,0x1
   140368a99:	mov    QWORD PTR [rbp-0x31],0x0
   140368aa1:	lea    rax,[rbp-0x41]
   140368aa5:	cmp    QWORD PTR [rbp-0x29],0xf
   140368aaa:	cmova  rax,QWORD PTR [rbp-0x41]
   140368aaf:	mov    BYTE PTR [rax],0x0
   140368ab2:	mov    rsi,QWORD PTR [rbp-0x31]
   140368ab6:	inc    r14d
   140368ab9:	inc    rdi
   140368abc:	mov    rcx,QWORD PTR [r12]
   140368ac0:	movsxd rax,r14d
   140368ac3:	cmp    rax,QWORD PTR [rcx+0x10]
   140368ac7:	jb     0x140368953
   140368acd:	inc    r13d
   140368ad0:	add    r12,0x8
   140368ad4:	movsxd rax,r13d
   140368ad7:	cmp    rax,QWORD PTR [rbp-0x59]
   140368adb:	jb     0x140368940
   140368ae1:	test   rsi,rsi
   140368ae4:	mov    r13,QWORD PTR [rbp-0x19]
   140368ae8:	je     0x140368b56
   140368aea:	mov    ecx,0x20
   140368aef:	call   0x141534600
   140368af4:	mov    rbx,rax
   140368af7:	xorps  xmm0,xmm0
   140368afa:	movups XMMWORD PTR [rax],xmm0
   140368afd:	mov    QWORD PTR [rax+0x10],0x0
   140368b05:	mov    QWORD PTR [rax+0x18],0xf
   140368b0d:	mov    BYTE PTR [rax],0x0
   140368b10:	mov    QWORD PTR [rbp-0x51],rax
   140368b14:	lea    rax,[rbp-0x41]
   140368b18:	cmp    rbx,rax
   140368b1b:	je     0x140368b36
   140368b1d:	lea    rdx,[rbp-0x41]
   140368b21:	cmp    QWORD PTR [rbp-0x29],0xf
   140368b26:	cmova  rdx,QWORD PTR [rbp-0x41]
   140368b2b:	mov    r8,rsi
   140368b2e:	mov    rcx,rbx
   140368b31:	call   0x14006f860
   140368b36:	mov    rdx,QWORD PTR [r15+0x8]
   140368b3a:	cmp    rdx,QWORD PTR [r15+0x10]
   140368b3e:	je     0x140368b4a
   140368b40:	mov    QWORD PTR [rdx],rbx
   140368b43:	add    QWORD PTR [r15+0x8],0x8
   140368b48:	jmp    0x140368b56
   140368b4a:	lea    r8,[rbp-0x51]
   140368b4e:	mov    rcx,r15
   140368b51:	call   0x1400bacc0
   140368b56:	mov    r14,QWORD PTR [rbp-0x21]
   140368b5a:	mov    r12,QWORD PTR [rbp-0x49]
   140368b5e:	lea    rcx,[rbp-0x41]
   140368b62:	call   0x14006f7e0
   140368b67:	nop
   140368b68:	cmp    QWORD PTR [rbp-0x59],0x0
   140368b6d:	jbe    0x140368bc3
   140368b6f:	lea    rdi,[r14+0x8]
   140368b73:	mov    rsi,r14
   140368b76:	neg    rsi
   140368b79:	nop    DWORD PTR [rax+0x0]
   140368b80:	mov    rbx,QWORD PTR [r14]
   140368b83:	test   rbx,rbx
   140368b86:	je     0x140368b9d
   140368b88:	mov    rcx,rbx
   140368b8b:	call   0x14006f7e0
   140368b90:	mov    edx,0x20
   140368b95:	mov    rcx,rbx
   140368b98:	call   0x1415345f0
   140368b9d:	mov    r8,r13
   140368ba0:	sub    r8,rdi
   140368ba3:	mov    rdx,rdi
   140368ba6:	mov    rcx,r14
   140368ba9:	call   0x141535d8a
   140368bae:	sub    r13,0x8
   140368bb2:	lea    rax,[rsi+r13*1]
   140368bb6:	sar    rax,0x3
   140368bba:	test   rax,rax
   140368bbd:	jne    0x140368b80
   140368bbf:	mov    QWORD PTR [rbp-0x19],r13
   140368bc3:	lea    rcx,[rbp-0x21]
   140368bc7:	call   0x140066b00
   140368bcc:	mov    rax,QWORD PTR [r15+0x8]
   140368bd0:	sub    rax,QWORD PTR [r15]
   140368bd3:	sar    rax,0x3
   140368bd7:	test   rax,rax
   140368bda:	je     0x140368be7
   140368bdc:	mov    WORD PTR [r12+0x37a],0xffff
   140368be7:	cmp    WORD PTR [rip+0x22dbdf9],0x2        # 0x1426449e8
   140368bef:	jge    0x140368bfd
   140368bf1:	mov    eax,0x2
   140368bf6:	mov    WORD PTR [rip+0x22dbdeb],ax        # 0x1426449e8
   140368bfd:	mov    rdx,QWORD PTR [rbp+0x17]
   140368c01:	cmp    rdx,0xf
   140368c05:	jbe    0x140368c3b
   140368c07:	inc    rdx
   140368c0a:	mov    rcx,QWORD PTR [rbp-0x1]
   140368c0e:	mov    rax,rcx
   140368c11:	cmp    rdx,0x1000
   140368c18:	jb     0x140368c36
   140368c1a:	add    rdx,0x27
   140368c1e:	mov    rcx,QWORD PTR [rcx-0x8]
   140368c22:	sub    rax,rcx
   140368c25:	add    rax,0xfffffffffffffff8
   140368c29:	cmp    rax,0x1f
   140368c2d:	jbe    0x140368c36
   140368c2f:	call   QWORD PTR [rip+0x1277e6b]        # 0x1415e0aa0
   140368c35:	int3
   140368c36:	call   0x1415345f0
   140368c3b:	mov    rcx,QWORD PTR [rbp+0x1f]
   140368c3f:	xor    rcx,rsp
   140368c42:	call   0x1415345d0
   140368c47:	lea    r11,[rsp+0xa0]
   140368c4f:	mov    rbx,QWORD PTR [r11+0x38]
   140368c53:	mov    rsi,QWORD PTR [r11+0x40]
   140368c57:	mov    rdi,QWORD PTR [r11+0x48]
   140368c5b:	mov    rsp,r11
   140368c5e:	pop    r15
   140368c60:	pop    r14
   140368c62:	pop    r13
   140368c64:	pop    r12
   140368c66:	pop    rbp
   140368c67:	ret
