
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140369490 <.text+0x368490>:
   140369490:	mov    QWORD PTR [rsp+0x18],rbx
   140369495:	mov    QWORD PTR [rsp+0x20],r9
   14036949a:	push   rbp
   14036949b:	push   rsi
   14036949c:	push   rdi
   14036949d:	push   r12
   14036949f:	push   r13
   1403694a1:	push   r14
   1403694a3:	push   r15
   1403694a5:	lea    rbp,[rsp-0x27]
   1403694aa:	sub    rsp,0xa0
   1403694b1:	mov    r12d,r8d
   1403694b4:	mov    r14d,edx
   1403694b7:	mov    rbx,rcx
   1403694ba:	mov    edx,0x3
   1403694bf:	mov    rcx,QWORD PTR [rcx+0xd0]
   1403694c6:	call   0x1413687b0
   1403694cb:	mov    r15d,eax
   1403694ce:	mov    edx,0x3
   1403694d3:	mov    rcx,QWORD PTR [rbx+0xd8]
   1403694da:	call   0x1413687b0
   1403694df:	mov    esi,eax
   1403694e1:	mov    edi,0x32
   1403694e6:	mov    r8d,0x3
   1403694ec:	mov    edx,edi
   1403694ee:	mov    rcx,QWORD PTR [rbx+0xd0]
   1403694f5:	call   0x1413b1230
   1403694fa:	mov    r8d,0x3
   140369500:	mov    edx,edi
   140369502:	mov    rcx,QWORD PTR [rbx+0xd8]
   140369509:	call   0x1413b1230
   14036950e:	xor    r8d,r8d
   140369511:	test   r14d,r14d
   140369514:	jle    0x140369526
   140369516:	mov    eax,r12d
   140369519:	sub    eax,r14d
   14036951c:	imul   eax,eax,0x64
   14036951f:	cdq
   140369520:	idiv   r14d
   140369523:	mov    r8d,eax
   140369526:	mov    r9d,0x64
   14036952c:	test   esi,esi
   14036952e:	jle    0x14036953e
   140369530:	mov    eax,r15d
   140369533:	sub    eax,esi
   140369535:	imul   eax,eax,0x64
   140369538:	cdq
   140369539:	idiv   esi
   14036953b:	mov    r9d,eax
   14036953e:	cmp    r8d,edi
   140369541:	jge    0x14036a0bc
   140369547:	cmp    r15d,esi
   14036954a:	jl     0x14036a0bc
   140369550:	cmp    r9d,r8d
   140369553:	jl     0x14036a0bc
   140369559:	cmp    BYTE PTR [rbx+0x37e],0x0
   140369560:	jne    0x14036a0bc
   140369566:	mov    BYTE PTR [rbx+0x37e],0x0
   14036956d:	mov    rax,QWORD PTR [rbx+0xb8]
   140369574:	inc    DWORD PTR [rax+0x211c]
   14036957a:	mov    rdx,QWORD PTR [rbx+0xb8]
   140369581:	mov    eax,DWORD PTR [rdx+0x211c]
   140369587:	mov    r15d,0x1
   14036958d:	cmp    eax,r15d
   140369590:	jle    0x1403695d3
   140369592:	lea    ecx,[rax+rax*4]
   140369595:	add    ecx,ecx
   140369597:	mov    eax,DWORD PTR [rdx+0x2118]
   14036959d:	sub    eax,ecx
   14036959f:	add    eax,0xa
   1403695a2:	mov    DWORD PTR [rdx+0x2118],eax
   1403695a8:	test   eax,eax
   1403695aa:	jg     0x1403695c4
   1403695ac:	or     DWORD PTR [rdx+0x20c0],0x20
   1403695b3:	mov    DWORD PTR [rdx+0x2118],0x0
   1403695bd:	mov    WORD PTR [rdx+0xa],r15w
   1403695c2:	jmp    0x1403695d3
   1403695c4:	cmp    eax,0x64
   1403695c7:	jle    0x1403695d3
   1403695c9:	mov    DWORD PTR [rdx+0x2118],0x64
   1403695d3:	mov    rax,QWORD PTR [rbx+0xb8]
   1403695da:	test   BYTE PTR [rax+0x20c0],0x20
   1403695e1:	je     0x1403695f1
   1403695e3:	mov    WORD PTR [rbx+0x37a],0x1c
   1403695ec:	jmp    0x14036a6e5
   1403695f1:	cmp    r9d,edi
   1403695f4:	jge    0x140369600
   1403695f6:	mov    edi,r9d
   1403695f9:	test   r9d,r9d
   1403695fc:	cmovle edi,r15d
   140369600:	imul   edi,r14d
   140369604:	mov    eax,0x51eb851f
   140369609:	imul   edi
   14036960b:	mov    r9d,edx
   14036960e:	sar    r9d,0x5
   140369612:	mov    eax,r9d
   140369615:	shr    eax,0x1f
   140369618:	add    r9d,eax
   14036961b:	cmp    r9d,r15d
   14036961e:	cmovl  r9d,r15d
   140369622:	mov    DWORD PTR [rbp-0x49],r9d
   140369626:	xorps  xmm0,xmm0
   140369629:	movdqu XMMWORD PTR [rbp-0x19],xmm0
   14036962e:	mov    QWORD PTR [rbp-0x9],0x0
   140369636:	movdqu XMMWORD PTR [rbp-0x39],xmm0
   14036963b:	mov    QWORD PTR [rbp-0x29],0x0
   140369643:	movdqu XMMWORD PTR [rbp+0x7],xmm0
   140369648:	mov    QWORD PTR [rbp+0x17],0x0
   140369650:	xor    r13d,r13d
   140369653:	mov    DWORD PTR [rbp-0x41],r13d
   140369657:	mov    rdx,QWORD PTR [rbx+0xf8]
   14036965e:	mov    rax,QWORD PTR [rbx+0x100]
   140369665:	sub    rax,rdx
   140369668:	sar    rax,0x3
   14036966c:	lea    r14,[rip+0xffffffffffc9698d]        # 0x140000000
   140369673:	mov    r12,QWORD PTR [rbp-0x11]
   140369677:	test   rax,rax
   14036967a:	je     0x140369876
   140369680:	xor    r8d,r8d
   140369683:	xor    r9d,r9d
   140369686:	movsxd rsi,r9d
   140369689:	movsxd rax,r8d
   14036968c:	mov    rdi,QWORD PTR [rdx+rax*8]
   140369690:	test   DWORD PTR [rdi+0x10],0x20000000
   140369697:	jne    0x1403696a8
   140369699:	mov    rcx,rdi
   14036969c:	call   0x140c65f10
   1403696a1:	mov    rdx,QWORD PTR [rbx+0xf8]
   1403696a8:	mov    eax,DWORD PTR [rdi+0x74]
   1403696ab:	mov    r8,QWORD PTR [rbp+0x7f]
   1403696af:	cmp    DWORD PTR [r8],eax
   1403696b2:	jl     0x140369841
   1403696b8:	jg     0x1403696c7
   1403696ba:	mov    eax,DWORD PTR [rdi+0x78]
   1403696bd:	cmp    DWORD PTR [r8+0x4],eax
   1403696c1:	jl     0x140369841
   1403696c7:	mov    rax,QWORD PTR [rbx+0x128]
   1403696ce:	test   BYTE PTR [rsi+rax*1],0x1
   1403696d2:	jne    0x140369841
   1403696d8:	mov    rsi,QWORD PTR [rdx+rsi*8]
   1403696dc:	mov    rdx,QWORD PTR [rbx+0xc0]
   1403696e3:	test   rdx,rdx
   1403696e6:	je     0x14036975a
   1403696e8:	movsx  edx,WORD PTR [rdx+0xcf2]
   1403696ef:	lea    eax,[rdx-0x8]
   1403696f2:	cmp    eax,0x7
   1403696f5:	ja     0x140369706
   1403696f7:	cdqe
   1403696f9:	mov    ecx,DWORD PTR [r14+rax*4+0x36a700]
   140369701:	add    rcx,r14
   140369704:	jmp    rcx
   140369706:	sub    dx,0x5
   14036970a:	cmp    dx,0x1
   14036970e:	ja     0x140369724
   140369710:	mov    rax,QWORD PTR [rsi]
   140369713:	mov    rcx,rsi
   140369716:	call   QWORD PTR [rax+0x3c8]
   14036971c:	test   al,al
   14036971e:	jne    0x140369841
   140369724:	mov    rax,QWORD PTR [rbx+0xc0]
   14036972b:	movsx  ecx,WORD PTR [rax+0xcf4]
   140369732:	add    ecx,0xfffffff8
   140369735:	cmp    ecx,0x7
   140369738:	ja     0x14036975a
   14036973a:	movsxd rax,ecx
   14036973d:	mov    ecx,DWORD PTR [r14+rax*4+0x36a720]
   140369745:	add    rcx,r14
   140369748:	jmp    rcx
   14036974a:	mov    rcx,rsi
   14036974d:	call   0x140c90bc0
   140369752:	test   al,al
   140369754:	jne    0x140369841
   14036975a:	mov    r15b,0x1
   14036975d:	xor    r14d,r14d
   140369760:	mov    rdx,QWORD PTR [rsi+0x38]
   140369764:	mov    rax,QWORD PTR [rsi+0x40]
   140369768:	sub    rax,rdx
   14036976b:	sar    rax,0x3
   14036976f:	test   rax,rax
   140369772:	je     0x140369812
   140369778:	xor    edi,edi
   14036977a:	nop    WORD PTR [rax+rax*1+0x0]
   140369780:	mov    rcx,QWORD PTR [rdx+rdi*1]
   140369784:	mov    rax,QWORD PTR [rcx]
   140369787:	call   QWORD PTR [rax+0x10]
   14036978a:	cmp    eax,0xa
   14036978d:	jne    0x1403697eb
   14036978f:	mov    rax,QWORD PTR [rsi+0x38]
   140369793:	mov    rcx,QWORD PTR [rdi+rax*1]
   140369797:	mov    rax,QWORD PTR [rcx]
   14036979a:	call   QWORD PTR [rax+0x18]
   14036979d:	mov    r10,rax
   1403697a0:	test   rax,rax
   1403697a3:	je     0x1403697eb
   1403697a5:	xor    r8d,r8d
   1403697a8:	mov    r11,QWORD PTR [rbx+0x100]
   1403697af:	mov    r9,QWORD PTR [rbx+0xf8]
   1403697b6:	mov    rax,r11
   1403697b9:	sub    rax,r9
   1403697bc:	sar    rax,0x3
   1403697c0:	test   rax,rax
   1403697c3:	je     0x1403697eb
   1403697c5:	mov    rdx,r9
   1403697c8:	cmp    QWORD PTR [rdx],r10
   1403697cb:	je     0x1403697e8
   1403697cd:	inc    r8d
   1403697d0:	add    rdx,0x8
   1403697d4:	mov    rcx,r11
   1403697d7:	sub    rcx,r9
   1403697da:	sar    rcx,0x3
   1403697de:	movsxd rax,r8d
   1403697e1:	cmp    rax,rcx
   1403697e4:	jb     0x1403697c8
   1403697e6:	jmp    0x1403697eb
   1403697e8:	xor    r15b,r15b
   1403697eb:	inc    r14d
   1403697ee:	add    rdi,0x8
   1403697f2:	mov    rdx,QWORD PTR [rsi+0x38]
   1403697f6:	mov    rcx,QWORD PTR [rsi+0x40]
   1403697fa:	sub    rcx,rdx
   1403697fd:	sar    rcx,0x3
   140369801:	movsxd rax,r14d
   140369804:	cmp    rax,rcx
   140369807:	jb     0x140369780
   14036980d:	test   r15b,r15b
   140369810:	je     0x14036983a
   140369812:	cmp    r12,QWORD PTR [rbp-0x9]
   140369816:	je     0x140369826
   140369818:	mov    DWORD PTR [r12],r13d
   14036981c:	add    r12,0x4
   140369820:	mov    QWORD PTR [rbp-0x11],r12
   140369824:	jmp    0x14036983a
   140369826:	lea    r8,[rbp-0x41]
   14036982a:	mov    rdx,r12
   14036982d:	lea    rcx,[rbp-0x19]
   140369831:	call   0x140070e20
   140369836:	mov    r12,QWORD PTR [rbp-0x11]
   14036983a:	lea    r14,[rip+0xffffffffffc967bf]        # 0x140000000
   140369841:	inc    r13d
   140369844:	movsxd r8,r13d
   140369847:	mov    DWORD PTR [rbp-0x41],r13d
   14036984b:	mov    rdx,QWORD PTR [rbx+0xf8]
   140369852:	mov    r9d,r13d
   140369855:	mov    rcx,QWORD PTR [rbx+0x100]
   14036985c:	sub    rcx,rdx
   14036985f:	sar    rcx,0x3
   140369863:	cmp    r8,rcx
   140369866:	jb     0x140369686
   14036986c:	mov    r9d,DWORD PTR [rbp-0x49]
   140369870:	mov    r15d,0x1
   140369876:	mov    r13,QWORD PTR [rbp-0x31]
   14036987a:	test   r9d,r9d
   14036987d:	je     0x140369b4f
   140369883:	mov    QWORD PTR [rbp+0x67],r13
   140369887:	nop    WORD PTR [rax+rax*1+0x0]
   140369890:	mov    rsi,r12
   140369893:	mov    rdx,QWORD PTR [rbp-0x19]
   140369897:	sub    rsi,rdx
   14036989a:	sar    rsi,0x2
   14036989e:	sub    esi,0x1
   1403698a1:	js     0x14036991c
   1403698a3:	mov    eax,esi
   1403698a5:	mov    r13,rdx
   1403698a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1403698b0:	lea    r14,[rax*4+0x0]
   1403698b8:	add    r14,r13
   1403698bb:	movsxd rcx,DWORD PTR [r14]
   1403698be:	mov    rax,QWORD PTR [rbx+0xf8]
   1403698c5:	mov    rdi,QWORD PTR [rax+rcx*8]
   1403698c9:	test   DWORD PTR [rdi+0x10],0x20000000
   1403698d0:	jne    0x1403698da
   1403698d2:	mov    rcx,rdi
   1403698d5:	call   0x140c65f10
   1403698da:	mov    eax,DWORD PTR [rdi+0x74]
   1403698dd:	mov    rdx,QWORD PTR [rbp+0x7f]
   1403698e1:	cmp    DWORD PTR [rdx],eax
   1403698e3:	jl     0x1403698ef
   1403698e5:	jg     0x140369909
   1403698e7:	mov    eax,DWORD PTR [rdi+0x78]
   1403698ea:	cmp    DWORD PTR [rdx+0x4],eax
   1403698ed:	jge    0x140369909
   1403698ef:	lea    rdx,[r14+0x4]
   1403698f3:	mov    r8,r12
   1403698f6:	sub    r8,rdx
   1403698f9:	mov    rcx,r14
   1403698fc:	call   0x14153ae1a
   140369901:	sub    r12,0x4
   140369905:	mov    QWORD PTR [rbp-0x11],r12
   140369909:	sub    esi,0x1
   14036990c:	mov    eax,esi
   14036990e:	jns    0x1403698b0
   140369910:	mov    r13,QWORD PTR [rbp+0x67]
   140369914:	mov    rdx,QWORD PTR [rbp-0x19]
   140369918:	mov    r9d,DWORD PTR [rbp-0x49]
   14036991c:	mov    DWORD PTR [rbp+0x6f],0xffffffff
   140369923:	mov    rdi,r12
   140369926:	sub    rdi,rdx
   140369929:	sar    rdi,0x2
   14036992d:	sub    edi,0x1
   140369930:	js     0x140369b4f
   140369936:	mov    eax,edi
   140369938:	mov    esi,edi
   14036993a:	mov    r13d,edi
   14036993d:	mov    r14d,edi
   140369940:	mov    r12d,edi
   140369943:	nop    DWORD PTR [rax+0x0]
   140369947:	nop    WORD PTR [rax+rax*1+0x0]
   140369950:	movsxd rcx,DWORD PTR [rdx+rax*4]
   140369954:	mov    rax,QWORD PTR [rbx+0xf8]
   14036995b:	mov    BYTE PTR [rsp+0x20],0x1
   140369960:	xor    r9d,r9d
   140369963:	mov    r8,QWORD PTR [rbx+0xc0]
   14036996a:	mov    rdx,QWORD PTR [rbx+0xb8]
   140369971:	mov    rcx,QWORD PTR [rax+rcx*8]
   140369975:	call   0x140c66020
   14036997a:	mov    ecx,eax
   14036997c:	mov    edx,eax
   14036997e:	mov    r9d,DWORD PTR [rbp-0x49]
   140369982:	cmp    eax,r9d
   140369985:	jle    0x140369990
   140369987:	mov    eax,r9d
   14036998a:	sub    eax,edx
   14036998c:	mov    ecx,eax
   14036998e:	jmp    0x140369993
   140369990:	sub    ecx,r9d
   140369993:	cmp    edx,r9d
   140369996:	cmovle r14d,r12d
   14036999a:	cmovle esi,r13d
   14036999e:	cmp    ecx,r15d
   1403699a1:	jg     0x1403699ac
   1403699a3:	mov    esi,r14d
   1403699a6:	cmp    r15d,0x1
   1403699aa:	jne    0x1403699b6
   1403699ac:	mov    r15d,ecx
   1403699af:	mov    ecx,esi
   1403699b1:	mov    DWORD PTR [rbp+0x6f],ecx
   1403699b4:	jmp    0x1403699b9
   1403699b6:	mov    ecx,DWORD PTR [rbp+0x6f]
   1403699b9:	sub    edi,0x1
   1403699bc:	mov    eax,edi
   1403699be:	mov    esi,edi
   1403699c0:	mov    r13d,edi
   1403699c3:	mov    r14d,edi
   1403699c6:	mov    r12d,edi
   1403699c9:	mov    rdx,QWORD PTR [rbp-0x19]
   1403699cd:	jns    0x140369950
   1403699cf:	mov    r12,QWORD PTR [rbp-0x11]
   1403699d3:	mov    r13,QWORD PTR [rbp+0x67]
   1403699d7:	cmp    ecx,0xffffffff
   1403699da:	je     0x140369b4f
   1403699e0:	movsxd rax,ecx
   1403699e3:	mov    r15,rdx
   1403699e6:	movsxd rdi,DWORD PTR [rdx+rax*4]
   1403699ea:	mov    DWORD PTR [rbp-0x41],edi
   1403699ed:	cmp    r13,QWORD PTR [rbp-0x29]
   1403699f1:	je     0x140369a01
   1403699f3:	mov    DWORD PTR [r13+0x0],edi
   1403699f7:	add    r13,0x4
   1403699fb:	mov    QWORD PTR [rbp-0x31],r13
   1403699ff:	jmp    0x140369a15
   140369a01:	lea    r8,[rbp-0x41]
   140369a05:	mov    rdx,r13
   140369a08:	lea    rcx,[rbp-0x39]
   140369a0c:	call   0x140070e20
   140369a11:	mov    r13,QWORD PTR [rbp-0x31]
   140369a15:	mov    QWORD PTR [rbp+0x67],r13
   140369a19:	mov    rax,QWORD PTR [rbx+0xf8]
   140369a20:	mov    BYTE PTR [rsp+0x20],0x1
   140369a25:	xor    r9d,r9d
   140369a28:	mov    r8,QWORD PTR [rbx+0xc0]
   140369a2f:	mov    rdx,QWORD PTR [rbx+0xb8]
   140369a36:	mov    rcx,QWORD PTR [rax+rdi*8]
   140369a3a:	call   0x140c66020
   140369a3f:	sub    DWORD PTR [rbp-0x49],eax
   140369a42:	lea    rsi,[rdi*8+0x0]
   140369a4a:	mov    rax,QWORD PTR [rbx+0xf8]
   140369a51:	mov    rdi,QWORD PTR [rsi+rax*1]
   140369a55:	test   DWORD PTR [rdi+0x10],0x20000000
   140369a5c:	jne    0x140369a66
   140369a5e:	mov    rcx,rdi
   140369a61:	call   0x140c65f10
   140369a66:	mov    r14d,DWORD PTR [rdi+0x78]
   140369a6a:	mov    rax,QWORD PTR [rbx+0xf8]
   140369a71:	mov    rdi,QWORD PTR [rsi+rax*1]
   140369a75:	test   DWORD PTR [rdi+0x10],0x20000000
   140369a7c:	jne    0x140369a86
   140369a7e:	mov    rcx,rdi
   140369a81:	call   0x140c65f10
   140369a86:	mov    rax,QWORD PTR [rbp+0x7f]
   140369a8a:	mov    r8d,DWORD PTR [rax]
   140369a8d:	sub    r8d,DWORD PTR [rdi+0x74]
   140369a91:	mov    DWORD PTR [rax],r8d
   140369a94:	mov    ecx,DWORD PTR [rax+0x4]
   140369a97:	sub    ecx,r14d
   140369a9a:	mov    r14,rax
   140369a9d:	mov    DWORD PTR [rax+0x4],ecx
   140369aa0:	cmp    ecx,0xf4240
   140369aa6:	jle    0x140369ace
   140369aa8:	mov    eax,0x431bde83
   140369aad:	imul   ecx
   140369aaf:	sar    edx,0x12
   140369ab2:	mov    eax,edx
   140369ab4:	shr    eax,0x1f
   140369ab7:	add    edx,eax
   140369ab9:	imul   eax,edx,0xf4240
   140369abf:	sub    ecx,eax
   140369ac1:	lea    eax,[r8+rdx*1]
   140369ac5:	mov    DWORD PTR [r14],eax
   140369ac8:	mov    DWORD PTR [r14+0x4],ecx
   140369acc:	jmp    0x140369b1d
   140369ace:	test   ecx,ecx
   140369ad0:	jns    0x140369b1d
   140369ad2:	neg    ecx
   140369ad4:	mov    eax,0x431bde83
   140369ad9:	imul   ecx
   140369adb:	sar    edx,0x12
   140369ade:	mov    eax,edx
   140369ae0:	shr    eax,0x1f
   140369ae3:	add    edx,eax
   140369ae5:	sub    r8d,edx
   140369ae8:	mov    DWORD PTR [r14],r8d
   140369aeb:	mov    eax,0x431bde83
   140369af0:	imul   ecx
   140369af2:	sar    edx,0x12
   140369af5:	mov    eax,edx
   140369af7:	shr    eax,0x1f
   140369afa:	add    edx,eax
   140369afc:	imul   eax,edx,0xf4240
   140369b02:	sub    ecx,eax
   140369b04:	neg    ecx
   140369b06:	mov    DWORD PTR [r14+0x4],ecx
   140369b0a:	jns    0x140369b1d
   140369b0c:	lea    eax,[r8-0x1]
   140369b10:	mov    DWORD PTR [r14],eax
   140369b13:	lea    eax,[rcx+0xf4240]
   140369b19:	mov    DWORD PTR [r14+0x4],eax
   140369b1d:	movsxd rax,DWORD PTR [rbp+0x6f]
   140369b21:	lea    rcx,[r15+rax*4]
   140369b25:	lea    rdx,[rcx+0x4]
   140369b29:	mov    r8,r12
   140369b2c:	sub    r8,rdx
   140369b2f:	call   0x14153ae1a
   140369b34:	sub    r12,0x4
   140369b38:	mov    QWORD PTR [rbp-0x11],r12
   140369b3c:	mov    r9d,DWORD PTR [rbp-0x49]
   140369b40:	test   r9d,r9d
   140369b43:	mov    r15d,0x1
   140369b49:	jg     0x140369890
   140369b4f:	xor    edi,edi
   140369b51:	mov    DWORD PTR [rbp-0x45],edi
   140369b54:	mov    DWORD PTR [rbp-0x41],edi
   140369b57:	mov    rdx,QWORD PTR [rbx+0xf8]
   140369b5e:	mov    rax,QWORD PTR [rbx+0x100]
   140369b65:	sub    rax,rdx
   140369b68:	sar    rax,0x3
   140369b6c:	test   rax,rax
   140369b6f:	je     0x140369f79
   140369b75:	xor    r8d,r8d
   140369b78:	mov    rsi,QWORD PTR [rbp-0x39]
   140369b7c:	nop    DWORD PTR [rax+0x0]
   140369b80:	test   r9d,r9d
   140369b83:	jle    0x140369f9e
   140369b89:	movsxd rax,r8d
   140369b8c:	mov    r12,QWORD PTR [rdx+rax*8]
   140369b90:	mov    rdx,QWORD PTR [rbx+0xc0]
   140369b97:	test   rdx,rdx
   140369b9a:	je     0x140369c21
   140369ba0:	movsx  edx,WORD PTR [rdx+0xcf2]
   140369ba7:	lea    eax,[rdx-0x8]
   140369baa:	cmp    eax,0x7
   140369bad:	ja     0x140369bc5
   140369baf:	cdqe
   140369bb1:	lea    r14,[rip+0xffffffffffc96448]        # 0x140000000
   140369bb8:	mov    ecx,DWORD PTR [r14+rax*4+0x36a740]
   140369bc0:	add    rcx,r14
   140369bc3:	jmp    rcx
   140369bc5:	lea    r14,[rip+0xffffffffffc96434]        # 0x140000000
   140369bcc:	sub    dx,0x5
   140369bd0:	cmp    dx,0x1
   140369bd4:	ja     0x140369beb
   140369bd6:	mov    rax,QWORD PTR [r12]
   140369bda:	mov    rcx,r12
   140369bdd:	call   QWORD PTR [rax+0x3c8]
   140369be3:	test   al,al
   140369be5:	jne    0x140369f4c
   140369beb:	mov    rax,QWORD PTR [rbx+0xc0]
   140369bf2:	movsx  ecx,WORD PTR [rax+0xcf4]
   140369bf9:	add    ecx,0xfffffff8
   140369bfc:	cmp    ecx,0x7
   140369bff:	ja     0x140369c21
   140369c01:	movsxd rax,ecx
   140369c04:	mov    ecx,DWORD PTR [r14+rax*4+0x36a760]
   140369c0c:	add    rcx,r14
   140369c0f:	jmp    rcx
   140369c11:	mov    rcx,r12
   140369c14:	call   0x140c90bc0
   140369c19:	test   al,al
   140369c1b:	jne    0x140369f4c
   140369c21:	test   DWORD PTR [r12+0x10],0x20000000
   140369c2a:	jne    0x140369c34
   140369c2c:	mov    rcx,r12
   140369c2f:	call   0x140c65f10
   140369c34:	mov    r15d,DWORD PTR [r12+0x74]
   140369c39:	mov    r14d,DWORD PTR [r12+0x78]
   140369c3e:	mov    rax,rsi
   140369c41:	mov    edx,0xff
   140369c46:	cmp    rax,r13
   140369c49:	je     0x140369c71
   140369c4b:	mov    ecx,0x1
   140369c50:	cmovb  ecx,edx
   140369c53:	test   cl,cl
   140369c55:	jns    0x140369c71
   140369c57:	cmp    DWORD PTR [rax],edi
   140369c59:	je     0x140369c61
   140369c5b:	add    rax,0x4
   140369c5f:	jmp    0x140369c46
   140369c61:	sub    rax,rsi
   140369c64:	sar    rax,0x2
   140369c68:	cmp    eax,0xffffffff
   140369c6b:	jne    0x140369f4c
   140369c71:	mov    BYTE PTR [rbp+0x6f],0x1
   140369c75:	xor    dil,dil
   140369c78:	mov    BYTE PTR [rbp+0x67],dil
   140369c7c:	mov    DWORD PTR [rbp-0x21],0x0
   140369c83:	mov    rdx,QWORD PTR [r12+0x38]
   140369c88:	mov    rax,QWORD PTR [r12+0x40]
   140369c8d:	sub    rax,rdx
   140369c90:	sar    rax,0x3
   140369c94:	test   rax,rax
   140369c97:	je     0x140369f49
   140369c9d:	xor    r8d,r8d
   140369ca0:	mov    QWORD PTR [rbp-0x1],r8
   140369ca4:	mov    rcx,QWORD PTR [rdx+r8*1]
   140369ca8:	mov    rax,QWORD PTR [rcx]
   140369cab:	call   QWORD PTR [rax+0x10]
   140369cae:	cmp    eax,0xa
   140369cb1:	jne    0x140369d16
   140369cb3:	mov    rax,QWORD PTR [r12+0x38]
   140369cb8:	mov    rcx,QWORD PTR [rbp-0x1]
   140369cbc:	mov    rcx,QWORD PTR [rcx+rax*1]
   140369cc0:	mov    rax,QWORD PTR [rcx]
   140369cc3:	call   QWORD PTR [rax+0x18]
   140369cc6:	mov    rdi,rax
   140369cc9:	test   rax,rax
   140369ccc:	je     0x140369d12
   140369cce:	xor    r8d,r8d
   140369cd1:	xor    edx,edx
   140369cd3:	mov    r10,QWORD PTR [rbx+0x100]
   140369cda:	mov    r9,QWORD PTR [rbx+0xf8]
   140369ce1:	mov    rax,r10
   140369ce4:	sub    rax,r9
   140369ce7:	sar    rax,0x3
   140369ceb:	test   rax,rax
   140369cee:	je     0x140369d12
   140369cf0:	cmp    QWORD PTR [r9+rdx*8],rdi
   140369cf4:	je     0x140369db4
   140369cfa:	inc    r8d
   140369cfd:	inc    rdx
   140369d00:	mov    rcx,r10
   140369d03:	sub    rcx,r9
   140369d06:	sar    rcx,0x3
   140369d0a:	movsxd rax,r8d
   140369d0d:	cmp    rax,rcx
   140369d10:	jb     0x140369cf0
   140369d12:	movzx  edi,BYTE PTR [rbp+0x67]
   140369d16:	movzx  r9d,BYTE PTR [rbp+0x6f]
   140369d1b:	mov    eax,DWORD PTR [rbp-0x21]
   140369d1e:	inc    eax
   140369d20:	mov    DWORD PTR [rbp-0x21],eax
   140369d23:	mov    r8,QWORD PTR [rbp-0x1]
   140369d27:	add    r8,0x8
   140369d2b:	mov    QWORD PTR [rbp-0x1],r8
   140369d2f:	mov    rdx,QWORD PTR [r12+0x38]
   140369d34:	mov    rcx,QWORD PTR [r12+0x40]
   140369d39:	sub    rcx,rdx
   140369d3c:	sar    rcx,0x3
   140369d40:	cdqe
   140369d42:	cmp    rax,rcx
   140369d45:	jb     0x140369ca4
   140369d4b:	test   r9b,r9b
   140369d4e:	je     0x140369f49
   140369d54:	test   dil,dil
   140369d57:	je     0x140369f49
   140369d5d:	mov    rax,QWORD PTR [rbp+0x7f]
   140369d61:	mov    r8d,DWORD PTR [rax]
   140369d64:	cmp    r8d,r15d
   140369d67:	jl     0x140369f49
   140369d6d:	sub    r8d,r15d
   140369d70:	mov    DWORD PTR [rax],r8d
   140369d73:	mov    ecx,DWORD PTR [rax+0x4]
   140369d76:	sub    ecx,r14d
   140369d79:	mov    r14,rax
   140369d7c:	mov    DWORD PTR [rax+0x4],ecx
   140369d7f:	cmp    ecx,0xf4240
   140369d85:	jle    0x140369eaa
   140369d8b:	mov    eax,0x431bde83
   140369d90:	imul   ecx
   140369d92:	sar    edx,0x12
   140369d95:	mov    eax,edx
   140369d97:	shr    eax,0x1f
   140369d9a:	add    edx,eax
   140369d9c:	imul   eax,edx,0xf4240
   140369da2:	sub    ecx,eax
   140369da4:	lea    eax,[r8+rdx*1]
   140369da8:	mov    DWORD PTR [r14],eax
   140369dab:	mov    DWORD PTR [r14+0x4],ecx
   140369daf:	jmp    0x140369ef9
   140369db4:	mov    rax,QWORD PTR [rbx+0x128]
   140369dbb:	test   BYTE PTR [rdx+rax*1],0x1
   140369dbf:	jne    0x140369e08
   140369dc1:	mov    rax,rsi
   140369dc4:	mov    edx,0xff
   140369dc9:	nop    DWORD PTR [rax+0x0]
   140369dd0:	cmp    rax,r13
   140369dd3:	je     0x140369df8
   140369dd5:	mov    ecx,0x1
   140369dda:	cmovb  ecx,edx
   140369ddd:	test   cl,cl
   140369ddf:	jns    0x140369df8
   140369de1:	cmp    DWORD PTR [rax],r8d
   140369de4:	je     0x140369dec
   140369de6:	add    rax,0x4
   140369dea:	jmp    0x140369dd0
   140369dec:	sub    rax,rsi
   140369def:	sar    rax,0x2
   140369df3:	cmp    eax,0xffffffff
   140369df6:	jne    0x140369e08
   140369df8:	xor    r9b,r9b
   140369dfb:	mov    BYTE PTR [rbp+0x6f],r9b
   140369dff:	movzx  edi,BYTE PTR [rbp+0x67]
   140369e03:	jmp    0x140369d1b
   140369e08:	test   DWORD PTR [rdi+0x10],0x20000000
   140369e0f:	jne    0x140369e19
   140369e11:	mov    rcx,rdi
   140369e14:	call   0x140c65f10
   140369e19:	mov    esi,DWORD PTR [rdi+0x78]
   140369e1c:	test   DWORD PTR [rdi+0x10],0x20000000
   140369e23:	jne    0x140369e2d
   140369e25:	mov    rcx,rdi
   140369e28:	call   0x140c65f10
   140369e2d:	sub    r15d,DWORD PTR [rdi+0x74]
   140369e31:	sub    r14d,esi
   140369e34:	cmp    r14d,0xf4240
   140369e3b:	jle    0x140369e6b
   140369e3d:	mov    eax,0x431bde83
   140369e42:	imul   r14d
   140369e45:	sar    edx,0x12
   140369e48:	mov    eax,edx
   140369e4a:	shr    eax,0x1f
   140369e4d:	add    edx,eax
   140369e4f:	add    r15d,edx
   140369e52:	imul   eax,edx,0xf4240
   140369e58:	sub    r14d,eax
   140369e5b:	mov    dil,0x1
   140369e5e:	mov    BYTE PTR [rbp+0x67],dil
   140369e62:	mov    rsi,QWORD PTR [rbp-0x39]
   140369e66:	jmp    0x140369d16
   140369e6b:	test   r14d,r14d
   140369e6e:	jns    0x140369e9a
   140369e70:	mov    eax,0xbce4217d
   140369e75:	imul   r14d
   140369e78:	sar    edx,0x12
   140369e7b:	mov    eax,edx
   140369e7d:	shr    eax,0x1f
   140369e80:	add    edx,eax
   140369e82:	sub    r15d,edx
   140369e85:	imul   eax,edx,0xf4240
   140369e8b:	add    r14d,eax
   140369e8e:	jns    0x140369e9a
   140369e90:	dec    r15d
   140369e93:	add    r14d,0xf4240
   140369e9a:	mov    dil,0x1
   140369e9d:	mov    BYTE PTR [rbp+0x67],dil
   140369ea1:	mov    rsi,QWORD PTR [rbp-0x39]
   140369ea5:	jmp    0x140369d16
   140369eaa:	test   ecx,ecx
   140369eac:	jns    0x140369ef9
   140369eae:	neg    ecx
   140369eb0:	mov    eax,0x431bde83
   140369eb5:	imul   ecx
   140369eb7:	sar    edx,0x12
   140369eba:	mov    eax,edx
   140369ebc:	shr    eax,0x1f
   140369ebf:	add    edx,eax
   140369ec1:	sub    r8d,edx
   140369ec4:	mov    DWORD PTR [r14],r8d
   140369ec7:	mov    eax,0x431bde83
   140369ecc:	imul   ecx
   140369ece:	sar    edx,0x12
   140369ed1:	mov    eax,edx
   140369ed3:	shr    eax,0x1f
   140369ed6:	add    edx,eax
   140369ed8:	imul   eax,edx,0xf4240
   140369ede:	sub    ecx,eax
   140369ee0:	neg    ecx
   140369ee2:	mov    DWORD PTR [r14+0x4],ecx
   140369ee6:	jns    0x140369ef9
   140369ee8:	lea    eax,[r8-0x1]
   140369eec:	mov    DWORD PTR [r14],eax
   140369eef:	lea    eax,[rcx+0xf4240]
   140369ef5:	mov    DWORD PTR [r14+0x4],eax
   140369ef9:	mov    r8,QWORD PTR [rbx+0xc0]
   140369f00:	mov    rdx,QWORD PTR [rbx+0xb8]
   140369f07:	mov    rcx,r12
   140369f0a:	call   0x140c66c30
   140369f0f:	mov    r9d,DWORD PTR [rbp-0x49]
   140369f13:	sub    r9d,eax
   140369f16:	mov    DWORD PTR [rbp-0x49],r9d
   140369f1a:	cmp    r13,QWORD PTR [rbp-0x29]
   140369f1e:	je     0x140369f31
   140369f20:	mov    edi,DWORD PTR [rbp-0x45]
   140369f23:	mov    DWORD PTR [r13+0x0],edi
   140369f27:	add    r13,0x4
   140369f2b:	mov    QWORD PTR [rbp-0x31],r13
   140369f2f:	jmp    0x140369f50
   140369f31:	lea    r8,[rbp-0x41]
   140369f35:	mov    rdx,r13
   140369f38:	lea    rcx,[rbp-0x39]
   140369f3c:	call   0x140070e20
   140369f41:	mov    r13,QWORD PTR [rbp-0x31]
   140369f45:	mov    rsi,QWORD PTR [rbp-0x39]
   140369f49:	mov    edi,DWORD PTR [rbp-0x45]
   140369f4c:	mov    r9d,DWORD PTR [rbp-0x49]
   140369f50:	inc    edi
   140369f52:	mov    DWORD PTR [rbp-0x45],edi
   140369f55:	movsxd r8,edi
   140369f58:	mov    DWORD PTR [rbp-0x41],edi
   140369f5b:	mov    rdx,QWORD PTR [rbx+0xf8]
   140369f62:	mov    rcx,QWORD PTR [rbx+0x100]
   140369f69:	sub    rcx,rdx
   140369f6c:	sar    rcx,0x3
   140369f70:	cmp    r8,rcx
   140369f73:	jb     0x140369b80
   140369f79:	mov    r14,QWORD PTR [rbp-0x39]
   140369f7d:	test   r9d,r9d
   140369f80:	jle    0x140369fa2
   140369f82:	movzx  eax,WORD PTR [rbx+0x37a]
   140369f89:	cmp    ax,0x19
   140369f8d:	jne    0x14036a054
   140369f93:	mov    r8d,0x1a
   140369f99:	jmp    0x14036a090
   140369f9e:	mov    r14,QWORD PTR [rbp-0x39]
   140369fa2:	mov    BYTE PTR [rbx+0x37e],0x1
   140369fa9:	lea    rdi,[rbx+0x380]
   140369fb0:	mov    rax,QWORD PTR [rdi]
   140369fb3:	cmp    rax,QWORD PTR [rdi+0x8]
   140369fb7:	je     0x140369fbd
   140369fb9:	mov    QWORD PTR [rdi+0x8],rax
   140369fbd:	mov    DWORD PTR [rbx+0x398],0x0
   140369fc7:	mov    BYTE PTR [rbx+0x39c],0x0
   140369fce:	cmp    WORD PTR [rip+0x22e0b22],0x2        # 0x14264aaf8
   140369fd6:	jge    0x140369fe4
   140369fd8:	mov    eax,0x2
   140369fdd:	mov    WORD PTR [rip+0x22e0b14],ax        # 0x14264aaf8
   140369fe4:	xor    esi,esi
   140369fe6:	sub    r13,r14
   140369fe9:	sar    r13,0x2
   140369fed:	test   r13,r13
   140369ff0:	je     0x14036a04c
   140369ff2:	movsxd rcx,DWORD PTR [r14]
   140369ff5:	mov    rax,QWORD PTR [rbx+0xf8]
   140369ffc:	lea    r8,[rax+rcx*8]
   14036a000:	mov    rdx,QWORD PTR [rdi+0x8]
   14036a004:	cmp    rdx,QWORD PTR [rdi+0x10]
   14036a008:	je     0x14036a017
   14036a00a:	mov    rax,QWORD PTR [r8]
   14036a00d:	mov    QWORD PTR [rdx],rax
   14036a010:	add    QWORD PTR [rdi+0x8],0x8
   14036a015:	jmp    0x14036a01f
   14036a017:	mov    rcx,rdi
   14036a01a:	call   0x1400bad30
   14036a01f:	movsxd rcx,DWORD PTR [r14]
   14036a022:	mov    rax,QWORD PTR [rbx+0x128]
   14036a029:	or     BYTE PTR [rcx+rax*1],0x1
   14036a02d:	movsxd rcx,DWORD PTR [r14]
   14036a030:	mov    rax,QWORD PTR [rbx+0x158]
   14036a037:	mov    DWORD PTR [rax+rcx*4],0x0
   14036a03e:	inc    esi
   14036a040:	add    r14,0x4
   14036a044:	movsxd rax,esi
   14036a047:	cmp    rax,r13
   14036a04a:	jb     0x140369ff2
   14036a04c:	mov    r8d,0x18
   14036a052:	jmp    0x14036a090
   14036a054:	cmp    ax,0x1a
   14036a058:	jne    0x14036a062
   14036a05a:	mov    r8d,0x19
   14036a060:	jmp    0x14036a090
   14036a062:	call   0x140eb68b0
   14036a067:	mov    r8d,eax
   14036a06a:	mov    eax,0x3
   14036a06f:	mul    r8d
   14036a072:	mov    ecx,r8d
   14036a075:	sub    ecx,edx
   14036a077:	shr    ecx,1
   14036a079:	add    ecx,edx
   14036a07b:	shr    ecx,0x1e
   14036a07e:	imul   ecx,ecx,0x80000001
   14036a084:	add    r8d,ecx
   14036a087:	shr    r8d,0x1e
   14036a08b:	add    r8w,0x19
   14036a090:	mov    eax,0x37a
   14036a095:	mov    WORD PTR [rax+rbx*1],r8w
   14036a09a:	lea    rcx,[rbp+0x7]
   14036a09e:	call   0x14006f750
   14036a0a3:	nop
   14036a0a4:	lea    rcx,[rbp-0x39]
   14036a0a8:	call   0x14006f750
   14036a0ad:	nop
   14036a0ae:	lea    rcx,[rbp-0x19]
   14036a0b2:	call   0x14006f750
   14036a0b7:	jmp    0x14036a6e5
   14036a0bc:	mov    BYTE PTR [rbx+0x37e],0x0
   14036a0c3:	mov    rax,QWORD PTR [rbx+0xb0]
   14036a0ca:	test   rax,rax
   14036a0cd:	je     0x14036a0d5
   14036a0cf:	inc    DWORD PTR [rax+0x14c]
   14036a0d5:	mov    rax,QWORD PTR [rbx+0xb8]
   14036a0dc:	mov    DWORD PTR [rax+0x211c],0x0
   14036a0e6:	mov    eax,0x51eb851f
   14036a0eb:	imul   r12d
   14036a0ee:	sar    edx,0x5
   14036a0f1:	mov    ecx,edx
   14036a0f3:	shr    ecx,0x1f
   14036a0f6:	inc    edx
   14036a0f8:	add    ecx,edx
   14036a0fa:	cmp    r8d,ecx
   14036a0fd:	cmovg  r8d,ecx
   14036a101:	mov    rcx,QWORD PTR [rbx+0xb8]
   14036a108:	mov    edx,DWORD PTR [rcx+0x2118]
   14036a10e:	add    edx,r8d
   14036a111:	mov    DWORD PTR [rcx+0x2118],edx
   14036a117:	test   edx,edx
   14036a119:	jg     0x14036a134
   14036a11b:	or     DWORD PTR [rcx+0x20c0],0x20
   14036a122:	mov    DWORD PTR [rcx+0x2118],0x0
   14036a12c:	mov    WORD PTR [rcx+0xa],0x1
   14036a132:	jmp    0x14036a143
   14036a134:	cmp    edx,0x64
   14036a137:	jle    0x14036a143
   14036a139:	mov    DWORD PTR [rcx+0x2118],0x64
   14036a143:	mov    WORD PTR [rbx+0x37a],0x7
   14036a14c:	xor    r12d,r12d
   14036a14f:	mov    rax,QWORD PTR [rbx+0xe8]
   14036a156:	sub    rax,QWORD PTR [rbx+0xe0]
   14036a15d:	sar    rax,0x3
   14036a161:	test   eax,eax
   14036a163:	jle    0x14036a40e
   14036a169:	xor    r15d,r15d
   14036a16c:	xor    r13d,r13d
   14036a16f:	xor    r14d,r14d
   14036a172:	mov    QWORD PTR [rbp+0x67],r14
   14036a176:	data16 nop WORD PTR [rax+rax*1+0x0]
   14036a180:	mov    rax,QWORD PTR [rbx+0x110]
   14036a187:	test   BYTE PTR [r15+rax*1],0x1
   14036a18c:	je     0x14036a311
   14036a192:	inc    DWORD PTR [rip+0x219bf60]        # 0x1425060f8
   14036a198:	mov    rax,QWORD PTR [rbx+0x140]
   14036a19f:	lea    rdi,[rax+r15*4]
   14036a1a3:	cmp    DWORD PTR [rdi],0x0
   14036a1a6:	jle    0x14036a207
   14036a1a8:	mov    rax,QWORD PTR [rbx+0xe0]
   14036a1af:	mov    rcx,QWORD PTR [rax+r13*1]
   14036a1b3:	mov    rax,QWORD PTR [rcx]
   14036a1b6:	call   QWORD PTR [rax+0x478]
   14036a1bc:	cmp    DWORD PTR [rdi],eax
   14036a1be:	jge    0x14036a207
   14036a1c0:	mov    rax,QWORD PTR [rbx+0xe0]
   14036a1c7:	mov    rsi,QWORD PTR [r14+rax*1]
   14036a1cb:	mov    r14,QWORD PTR [rsi]
   14036a1ce:	mov    rax,QWORD PTR [rbx+0x140]
   14036a1d5:	lea    rdi,[rax+r15*4]
   14036a1d9:	mov    rcx,rsi
   14036a1dc:	call   QWORD PTR [r14+0x478]
   14036a1e3:	sub    eax,DWORD PTR [rdi]
   14036a1e5:	mov    r8b,0x1
   14036a1e8:	mov    edx,eax
   14036a1ea:	mov    rcx,rsi
   14036a1ed:	call   QWORD PTR [r14+0x388]
   14036a1f4:	mov    r8,QWORD PTR [rax]
   14036a1f7:	mov    dl,0x1
   14036a1f9:	mov    rcx,rax
   14036a1fc:	call   QWORD PTR [r8+0x328]
   14036a203:	mov    r14,QWORD PTR [rbp+0x67]
   14036a207:	mov    rcx,QWORD PTR [rbx+0xe0]
   14036a20e:	mov    dl,0x1
   14036a210:	mov    rcx,QWORD PTR [rcx+r15*8]
   14036a214:	call   0x140c90540
   14036a219:	xor    esi,esi
   14036a21b:	mov    rdx,QWORD PTR [rbx+0xe0]
   14036a222:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a226:	mov    rcx,QWORD PTR [rax+0x40]
   14036a22a:	sub    rcx,QWORD PTR [rax+0x38]
   14036a22e:	sar    rcx,0x3
   14036a232:	test   rcx,rcx
   14036a235:	je     0x14036a2cc
   14036a23b:	xor    edi,edi
   14036a23d:	nop    DWORD PTR [rax]
   14036a240:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a244:	mov    rcx,QWORD PTR [rax+0x38]
   14036a248:	mov    rcx,QWORD PTR [rdi+rcx*1]
   14036a24c:	mov    rax,QWORD PTR [rcx]
   14036a24f:	call   QWORD PTR [rax+0x10]
   14036a252:	cmp    eax,0xb
   14036a255:	jne    0x14036a27e
   14036a257:	mov    rax,QWORD PTR [rbx+0xe0]
   14036a25e:	mov    rcx,QWORD PTR [rax+r15*8]
   14036a262:	mov    rax,QWORD PTR [rcx+0x38]
   14036a266:	mov    rcx,QWORD PTR [rdi+rax*1]
   14036a26a:	mov    rax,QWORD PTR [rcx]
   14036a26d:	call   QWORD PTR [rax+0x18]
   14036a270:	test   rax,rax
   14036a273:	je     0x14036a27e
   14036a275:	test   DWORD PTR [rax+0x10],0x8000
   14036a27c:	jne    0x14036a2a5
   14036a27e:	inc    esi
   14036a280:	add    rdi,0x8
   14036a284:	mov    rdx,QWORD PTR [rbx+0xe0]
   14036a28b:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a28f:	mov    rcx,QWORD PTR [rax+0x40]
   14036a293:	sub    rcx,QWORD PTR [rax+0x38]
   14036a297:	sar    rcx,0x3
   14036a29b:	movsxd rax,esi
   14036a29e:	cmp    rax,rcx
   14036a2a1:	jb     0x14036a240
   14036a2a3:	jmp    0x14036a2cc
   14036a2a5:	mov    rcx,QWORD PTR [rbx+0xe0]
   14036a2ac:	mov    rcx,QWORD PTR [rcx+r15*8]
   14036a2b0:	call   0x140c88300
   14036a2b5:	mov    rdx,QWORD PTR [rbx+0xe0]
   14036a2bc:	mov    rdx,QWORD PTR [rdx+r15*8]
   14036a2c0:	mov    rcx,QWORD PTR [rbx+0xb0]
   14036a2c7:	call   0x14054bdc0
   14036a2cc:	mov    rax,QWORD PTR [rbx+0xe0]
   14036a2d3:	mov    rcx,QWORD PTR [rax+r15*8]
   14036a2d7:	and    DWORD PTR [rcx+0x10],0xffffffdf
   14036a2db:	dec    DWORD PTR [rip+0x219be17]        # 0x1425060f8
   14036a2e1:	mov    rdx,QWORD PTR [rbx+0xe0]
   14036a2e8:	mov    BYTE PTR [rsp+0x28],0x0
   14036a2ed:	mov    BYTE PTR [rsp+0x20],0x0
   14036a2f2:	mov    r9,QWORD PTR [rbx+0xc0]
   14036a2f9:	mov    r8,QWORD PTR [rip+0x202fee8]        # 0x14239a1e8
   14036a300:	mov    rdx,QWORD PTR [rdx+r15*8]
   14036a304:	mov    rcx,rbx
   14036a307:	call   0x14036a9c0
   14036a30c:	jmp    0x14036a3e1
   14036a311:	inc    DWORD PTR [rip+0x219bde1]        # 0x1425060f8
   14036a317:	xor    esi,esi
   14036a319:	mov    rdx,QWORD PTR [rbx+0xe0]
   14036a320:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a324:	mov    rcx,QWORD PTR [rax+0x40]
   14036a328:	sub    rcx,QWORD PTR [rax+0x38]
   14036a32c:	sar    rcx,0x3
   14036a330:	test   rcx,rcx
   14036a333:	je     0x14036a3db
   14036a339:	xor    edi,edi
   14036a33b:	nop    DWORD PTR [rax+rax*1+0x0]
   14036a340:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a344:	mov    rcx,QWORD PTR [rax+0x38]
   14036a348:	mov    rcx,QWORD PTR [rdi+rcx*1]
   14036a34c:	mov    rax,QWORD PTR [rcx]
   14036a34f:	call   QWORD PTR [rax+0x10]
   14036a352:	cmp    eax,0xb
   14036a355:	jne    0x14036a37e
   14036a357:	mov    rax,QWORD PTR [rbx+0xe0]
   14036a35e:	mov    rcx,QWORD PTR [rax+r15*8]
   14036a362:	mov    rax,QWORD PTR [rcx+0x38]
   14036a366:	mov    rcx,QWORD PTR [rdi+rax*1]
   14036a36a:	mov    rax,QWORD PTR [rcx]
   14036a36d:	call   QWORD PTR [rax+0x18]
   14036a370:	test   rax,rax
   14036a373:	je     0x14036a37e
   14036a375:	test   DWORD PTR [rax+0x10],0x8000
   14036a37c:	je     0x14036a3a5
   14036a37e:	inc    esi
   14036a380:	add    rdi,0x8
   14036a384:	mov    rdx,QWORD PTR [rbx+0xe0]
   14036a38b:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a38f:	mov    rcx,QWORD PTR [rax+0x40]
   14036a393:	sub    rcx,QWORD PTR [rax+0x38]
   14036a397:	sar    rcx,0x3
   14036a39b:	movsxd rax,esi
   14036a39e:	cmp    rax,rcx
   14036a3a1:	jb     0x14036a340
   14036a3a3:	jmp    0x14036a3db
   14036a3a5:	mov    rcx,QWORD PTR [rbx+0xe0]
   14036a3ac:	mov    rcx,QWORD PTR [rcx+r15*8]
   14036a3b0:	call   0x140c88300
   14036a3b5:	mov    rdx,QWORD PTR [rbx+0xe0]
   14036a3bc:	mov    rdx,QWORD PTR [rdx+r15*8]
   14036a3c0:	mov    rcx,QWORD PTR [rbx+0xb0]
   14036a3c7:	call   0x14054bdc0
   14036a3cc:	mov    rax,QWORD PTR [rbx+0xe0]
   14036a3d3:	mov    rcx,QWORD PTR [rax+r15*8]
   14036a3d7:	or     DWORD PTR [rcx+0x10],0x20
   14036a3db:	dec    DWORD PTR [rip+0x219bd17]        # 0x1425060f8
   14036a3e1:	inc    r12d
   14036a3e4:	inc    r15
   14036a3e7:	add    r13,0x8
   14036a3eb:	add    r14,0x8
   14036a3ef:	mov    QWORD PTR [rbp+0x67],r14
   14036a3f3:	mov    rax,QWORD PTR [rbx+0xe8]
   14036a3fa:	sub    rax,QWORD PTR [rbx+0xe0]
   14036a401:	sar    rax,0x3
   14036a405:	cmp    r12d,eax
   14036a408:	jl     0x14036a180
   14036a40e:	xor    r12d,r12d
   14036a411:	mov    rax,QWORD PTR [rbx+0x100]
   14036a418:	sub    rax,QWORD PTR [rbx+0xf8]
   14036a41f:	sar    rax,0x3
   14036a423:	test   eax,eax
   14036a425:	jle    0x14036a6de
   14036a42b:	xor    r15d,r15d
   14036a42e:	xor    r13d,r13d
   14036a431:	xor    r14d,r14d
   14036a434:	mov    QWORD PTR [rbp+0x67],r14
   14036a438:	nop    DWORD PTR [rax+rax*1+0x0]
   14036a440:	mov    rax,QWORD PTR [rbx+0x128]
   14036a447:	test   BYTE PTR [r15+rax*1],0x1
   14036a44c:	je     0x14036a5e1
   14036a452:	inc    DWORD PTR [rip+0x219bca0]        # 0x1425060f8
   14036a458:	mov    rax,QWORD PTR [rbx+0x158]
   14036a45f:	lea    rdi,[rax+r15*4]
   14036a463:	cmp    DWORD PTR [rdi],0x0
   14036a466:	jle    0x14036a4c7
   14036a468:	mov    rax,QWORD PTR [rbx+0xf8]
   14036a46f:	mov    rcx,QWORD PTR [rax+r13*1]
   14036a473:	mov    rax,QWORD PTR [rcx]
   14036a476:	call   QWORD PTR [rax+0x478]
   14036a47c:	cmp    DWORD PTR [rdi],eax
   14036a47e:	jge    0x14036a4c7
   14036a480:	mov    rax,QWORD PTR [rbx+0xf8]
   14036a487:	mov    rsi,QWORD PTR [r14+rax*1]
   14036a48b:	mov    r14,QWORD PTR [rsi]
   14036a48e:	mov    rax,QWORD PTR [rbx+0x158]
   14036a495:	lea    rdi,[rax+r15*4]
   14036a499:	mov    rcx,rsi
   14036a49c:	call   QWORD PTR [r14+0x478]
   14036a4a3:	sub    eax,DWORD PTR [rdi]
   14036a4a5:	mov    r8b,0x1
   14036a4a8:	mov    edx,eax
   14036a4aa:	mov    rcx,rsi
   14036a4ad:	call   QWORD PTR [r14+0x388]
   14036a4b4:	mov    r8,QWORD PTR [rax]
   14036a4b7:	mov    dl,0x1
   14036a4b9:	mov    rcx,rax
   14036a4bc:	call   QWORD PTR [r8+0x328]
   14036a4c3:	mov    r14,QWORD PTR [rbp+0x67]
   14036a4c7:	mov    rcx,QWORD PTR [rbx+0xf8]
   14036a4ce:	mov    r8b,0x1
   14036a4d1:	mov    rdx,QWORD PTR [rbx+0xc0]
   14036a4d8:	mov    rcx,QWORD PTR [rcx+r15*8]
   14036a4dc:	call   0x140c90690
   14036a4e1:	xor    esi,esi
   14036a4e3:	mov    rdx,QWORD PTR [rbx+0xf8]
   14036a4ea:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a4ee:	mov    rcx,QWORD PTR [rax+0x40]
   14036a4f2:	sub    rcx,QWORD PTR [rax+0x38]
   14036a4f6:	sar    rcx,0x3
   14036a4fa:	test   rcx,rcx
   14036a4fd:	je     0x14036a5ab
   14036a503:	xor    edi,edi
   14036a505:	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14036a510:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a514:	mov    rcx,QWORD PTR [rax+0x38]
   14036a518:	mov    rcx,QWORD PTR [rdi+rcx*1]
   14036a51c:	mov    rax,QWORD PTR [rcx]
   14036a51f:	call   QWORD PTR [rax+0x10]
   14036a522:	cmp    eax,0xb
   14036a525:	jne    0x14036a54e
   14036a527:	mov    rax,QWORD PTR [rbx+0xf8]
   14036a52e:	mov    rcx,QWORD PTR [rax+r15*8]
   14036a532:	mov    rax,QWORD PTR [rcx+0x38]
   14036a536:	mov    rcx,QWORD PTR [rdi+rax*1]
   14036a53a:	mov    rax,QWORD PTR [rcx]
   14036a53d:	call   QWORD PTR [rax+0x18]
   14036a540:	test   rax,rax
   14036a543:	je     0x14036a54e
   14036a545:	test   DWORD PTR [rax+0x10],0x8000
   14036a54c:	je     0x14036a575
   14036a54e:	inc    esi
   14036a550:	add    rdi,0x8
   14036a554:	mov    rdx,QWORD PTR [rbx+0xf8]
   14036a55b:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a55f:	mov    rcx,QWORD PTR [rax+0x40]
   14036a563:	sub    rcx,QWORD PTR [rax+0x38]
   14036a567:	sar    rcx,0x3
   14036a56b:	movsxd rax,esi
   14036a56e:	cmp    rax,rcx
   14036a571:	jb     0x14036a510
   14036a573:	jmp    0x14036a5ab
   14036a575:	mov    rcx,QWORD PTR [rbx+0xf8]
   14036a57c:	mov    rcx,QWORD PTR [rcx+r15*8]
   14036a580:	call   0x140c88300
   14036a585:	mov    rdx,QWORD PTR [rbx+0xf8]
   14036a58c:	mov    rdx,QWORD PTR [rdx+r15*8]
   14036a590:	mov    rcx,QWORD PTR [rbx+0xb0]
   14036a597:	call   0x14054bdc0
   14036a59c:	mov    rax,QWORD PTR [rbx+0xf8]
   14036a5a3:	mov    rcx,QWORD PTR [rax+r15*8]
   14036a5a7:	or     DWORD PTR [rcx+0x10],0x20
   14036a5ab:	dec    DWORD PTR [rip+0x219bb47]        # 0x1425060f8
   14036a5b1:	mov    rdx,QWORD PTR [rbx+0xf8]
   14036a5b8:	mov    BYTE PTR [rsp+0x28],0x0
   14036a5bd:	mov    BYTE PTR [rsp+0x20],0x0
   14036a5c2:	mov    r9,QWORD PTR [rip+0x202fc1f]        # 0x14239a1e8
   14036a5c9:	mov    r8,QWORD PTR [rbx+0xc0]
   14036a5d0:	mov    rdx,QWORD PTR [rdx+r15*8]
   14036a5d4:	mov    rcx,rbx
   14036a5d7:	call   0x14036a9c0
   14036a5dc:	jmp    0x14036a6b1
   14036a5e1:	inc    DWORD PTR [rip+0x219bb11]        # 0x1425060f8
   14036a5e7:	xor    esi,esi
   14036a5e9:	mov    rdx,QWORD PTR [rbx+0xf8]
   14036a5f0:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a5f4:	mov    rcx,QWORD PTR [rax+0x40]
   14036a5f8:	sub    rcx,QWORD PTR [rax+0x38]
   14036a5fc:	sar    rcx,0x3
   14036a600:	test   rcx,rcx
   14036a603:	je     0x14036a6ab
   14036a609:	xor    edi,edi
   14036a60b:	nop    DWORD PTR [rax+rax*1+0x0]
   14036a610:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a614:	mov    rcx,QWORD PTR [rax+0x38]
   14036a618:	mov    rcx,QWORD PTR [rdi+rcx*1]
   14036a61c:	mov    rax,QWORD PTR [rcx]
   14036a61f:	call   QWORD PTR [rax+0x10]
   14036a622:	cmp    eax,0xb
   14036a625:	jne    0x14036a64e
   14036a627:	mov    rax,QWORD PTR [rbx+0xf8]
   14036a62e:	mov    rcx,QWORD PTR [rax+r15*8]
   14036a632:	mov    rax,QWORD PTR [rcx+0x38]
   14036a636:	mov    rcx,QWORD PTR [rdi+rax*1]
   14036a63a:	mov    rax,QWORD PTR [rcx]
   14036a63d:	call   QWORD PTR [rax+0x18]
   14036a640:	test   rax,rax
   14036a643:	je     0x14036a64e
   14036a645:	test   DWORD PTR [rax+0x10],0x8000
   14036a64c:	jne    0x14036a675
   14036a64e:	inc    esi
   14036a650:	add    rdi,0x8
   14036a654:	mov    rdx,QWORD PTR [rbx+0xf8]
   14036a65b:	mov    rax,QWORD PTR [rdx+r15*8]
   14036a65f:	mov    rcx,QWORD PTR [rax+0x40]
   14036a663:	sub    rcx,QWORD PTR [rax+0x38]
   14036a667:	sar    rcx,0x3
   14036a66b:	movsxd rax,esi
   14036a66e:	cmp    rax,rcx
   14036a671:	jb     0x14036a610
   14036a673:	jmp    0x14036a6ab
   14036a675:	mov    rcx,QWORD PTR [rbx+0xf8]
   14036a67c:	mov    rcx,QWORD PTR [rcx+r15*8]
   14036a680:	call   0x140c88300
   14036a685:	mov    rdx,QWORD PTR [rbx+0xf8]
   14036a68c:	mov    rdx,QWORD PTR [rdx+r15*8]
   14036a690:	mov    rcx,QWORD PTR [rbx+0xb0]
   14036a697:	call   0x14054bdc0
   14036a69c:	mov    rax,QWORD PTR [rbx+0xf8]
   14036a6a3:	mov    rcx,QWORD PTR [rax+r15*8]
   14036a6a7:	or     DWORD PTR [rcx+0x10],0x20
   14036a6ab:	dec    DWORD PTR [rip+0x219ba47]        # 0x1425060f8
   14036a6b1:	inc    r12d
   14036a6b4:	inc    r15
   14036a6b7:	add    r13,0x8
   14036a6bb:	add    r14,0x8
   14036a6bf:	mov    QWORD PTR [rbp+0x67],r14
   14036a6c3:	mov    rax,QWORD PTR [rbx+0x100]
   14036a6ca:	sub    rax,QWORD PTR [rbx+0xf8]
   14036a6d1:	sar    rax,0x3
   14036a6d5:	cmp    r12d,eax
   14036a6d8:	jl     0x14036a440
   14036a6de:	mov    BYTE PTR [rbx+0x37c],0x1
   14036a6e5:	mov    rbx,QWORD PTR [rsp+0xf0]
   14036a6ed:	add    rsp,0xa0
   14036a6f4:	pop    r15
   14036a6f6:	pop    r14
   14036a6f8:	pop    r13
   14036a6fa:	pop    r12
   14036a6fc:	pop    rdi
   14036a6fd:	pop    rsi
   14036a6fe:	pop    rbp
   14036a6ff:	ret
   14036a700:	adc    BYTE PTR [rdi-0x68efffca],dl
   14036a706:	ss add BYTE PTR [rax],dl
   14036a709:	xchg   edi,eax
   14036a70a:	ss add BYTE PTR [rax],dl
   14036a70d:	xchg   edi,eax
   14036a70e:	ss add BYTE PTR [rax],dl
   14036a711:	xchg   edi,eax
   14036a712:	ss add BYTE PTR [rax],dl
   14036a715:	xchg   edi,eax
   14036a716:	ss add BYTE PTR [rax],dl
   14036a719:	xchg   edi,eax
   14036a71a:	ss add BYTE PTR [rax],dl
   14036a71d:	xchg   edi,eax
   14036a71e:	ss add BYTE PTR [rdx-0x69],cl
   14036a722:	ss add BYTE PTR [rdx-0x69],cl
   14036a726:	ss add BYTE PTR [rdx-0x69],cl
   14036a72a:	ss add BYTE PTR [rdx-0x69],cl
   14036a72e:	ss add BYTE PTR [rdx-0x69],cl
   14036a732:	ss add BYTE PTR [rdx-0x69],cl
   14036a736:	ss add BYTE PTR [rdx-0x69],cl
   14036a73a:	ss add BYTE PTR [rdx-0x69],cl
   14036a73e:	ss add dh,dl
   14036a741:	fwait
   14036a742:	ss add dh,dl
   14036a745:	fwait
   14036a746:	ss add dh,dl
   14036a749:	fwait
   14036a74a:	ss add dh,dl
   14036a74d:	fwait
   14036a74e:	ss add dh,dl
   14036a751:	fwait
   14036a752:	ss add dh,dl
   14036a755:	fwait
   14036a756:	ss add dh,dl
   14036a759:	fwait
   14036a75a:	ss add dh,dl
   14036a75d:	fwait
   14036a75e:	ss add BYTE PTR [rcx],dl
   14036a761:	pushf
   14036a762:	ss add BYTE PTR [rcx],dl
   14036a765:	pushf
   14036a766:	ss add BYTE PTR [rcx],dl
   14036a769:	pushf
   14036a76a:	ss add BYTE PTR [rcx],dl
   14036a76d:	pushf
   14036a76e:	ss add BYTE PTR [rcx],dl
   14036a771:	pushf
   14036a772:	ss add BYTE PTR [rcx],dl
   14036a775:	pushf
   14036a776:	ss add BYTE PTR [rcx],dl
   14036a779:	pushf
   14036a77a:	ss add BYTE PTR [rcx],dl
   14036a77d:	pushf
   14036a77e:	ss
	...
