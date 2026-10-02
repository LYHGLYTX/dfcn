
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140852640 <.text+0x851640>:
   140852640:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   140852645:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14085264a:	55                   	push   rbp
   14085264b:	57                   	push   rdi
   14085264c:	41 54                	push   r12
   14085264e:	41 56                	push   r14
   140852650:	41 57                	push   r15
   140852652:	48 8d 6c 24 c9       	lea    rbp,[rsp-0x37]
   140852657:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
   14085265e:	48 8b 05 db 99 04 01 	mov    rax,QWORD PTR [rip+0x10499db]        # 0x14189c040
   140852665:	48 33 c4             	xor    rax,rsp
   140852668:	48 89 45 27          	mov    QWORD PTR [rbp+0x27],rax
   14085266c:	4c 8b f2             	mov    r14,rdx
   14085266f:	48 8b d9             	mov    rbx,rcx
   140852672:	48 63 01             	movsxd rax,DWORD PTR [rcx]
   140852675:	83 f8 1b             	cmp    eax,0x1b
   140852678:	0f 87 36 0b 00 00    	ja     0x1408531b4
   14085267e:	48 8d 0d 7b d9 7a ff 	lea    rcx,[rip+0xffffffffff7ad97b]        # 0x140000000
   140852685:	8b 94 81 fc 40 85 00 	mov    edx,DWORD PTR [rcx+rax*4+0x8540fc]
   14085268c:	48 03 d1             	add    rdx,rcx
   14085268f:	ff e2                	jmp    rdx
   140852691:	c7 05 e1 7d df 01 07 	mov    DWORD PTR [rip+0x1df7de1],0x1010007        # 0x14264a47c
   140852698:	00 01 01 
   14085269b:	0f 57 c0             	xorps  xmm0,xmm0
   14085269e:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408526a2:	f6 43 1c 01          	test   BYTE PTR [rbx+0x1c],0x1
   1408526a6:	74 35                	je     0x1408526dd
   1408526a8:	66 0f 6f 0d f0 8a f3 	movdqa xmm1,XMMWORD PTR [rip+0xf38af0]        # 0x14178b1a0
   1408526af:	00 
   1408526b0:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408526b5:	48 b8 43 68 61 72 67 	movabs rax,0x676e696772616843
   1408526bc:	69 6e 67 
   1408526bf:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   1408526c3:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   1408526c7:	45 33 c9             	xor    r9d,r9d
   1408526ca:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408526ce:	48 8d 0d 1b 7d df 01 	lea    rcx,[rip+0x1df7d1b]        # 0x14264a3f0
   1408526d5:	e8 86 72 28 00       	call   0x140ad9960
   1408526da:	90                   	nop
   1408526db:	eb 39                	jmp    0x140852716
   1408526dd:	66 0f 6f 0d 9b 8a f3 	movdqa xmm1,XMMWORD PTR [rip+0xf38a9b]        # 0x14178b180
   1408526e4:	00 
   1408526e5:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408526ea:	8b 05 f4 f0 e5 00    	mov    eax,DWORD PTR [rip+0xe5f0f4]        # 0x1416b17e4
   1408526f0:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   1408526f3:	0f b7 05 ee f0 e5 00 	movzx  eax,WORD PTR [rip+0xe5f0ee]        # 0x1416b17e8
   1408526fa:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   1408526fe:	c6 45 cd 00          	mov    BYTE PTR [rbp-0x33],0x0
   140852702:	45 33 c9             	xor    r9d,r9d
   140852705:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140852709:	48 8d 0d e0 7c df 01 	lea    rcx,[rip+0x1df7ce0]        # 0x14264a3f0
   140852710:	e8 4b 72 28 00       	call   0x140ad9960
   140852715:	90                   	nop
   140852716:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   14085271a:	48 83 fa 0f          	cmp    rdx,0xf
   14085271e:	76 31                	jbe    0x140852751
   140852720:	48 ff c2             	inc    rdx
   140852723:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   140852727:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14085272e:	48 8b c1             	mov    rax,rcx
   140852731:	72 19                	jb     0x14085274c
   140852733:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   140852737:	48 2b c1             	sub    rax,rcx
   14085273a:	48 83 c2 27          	add    rdx,0x27
   14085273e:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   140852742:	48 83 f8 1f          	cmp    rax,0x1f
   140852746:	0f 87 3f 10 00 00    	ja     0x14085378b
   14085274c:	e8 2f 6f ce 00       	call   0x141539680
   140852751:	49 8b 86 d0 00 00 00 	mov    rax,QWORD PTR [r14+0xd0]
   140852758:	49 2b 86 c8 00 00 00 	sub    rax,QWORD PTR [r14+0xc8]
   14085275f:	48 d1 f8             	sar    rax,1
   140852762:	0f 84 4c 0a 00 00    	je     0x1408531b4
   140852768:	b8 d0 8a ff ff       	mov    eax,0xffff8ad0
   14085276d:	66 89 45 b7          	mov    WORD PTR [rbp-0x49],ax
   140852771:	41 f7 86 10 01 00 00 	test   DWORD PTR [r14+0x110],0x2000000
   140852778:	00 00 00 02 
   14085277c:	74 4f                	je     0x1408527cd
   14085277e:	49 8b 9e d8 01 00 00 	mov    rbx,QWORD PTR [r14+0x1d8]
   140852785:	49 8b be e0 01 00 00 	mov    rdi,QWORD PTR [r14+0x1e0]
   14085278c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140852790:	48 3b df             	cmp    rbx,rdi
   140852793:	73 5c                	jae    0x1408527f1
   140852795:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140852798:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14085279b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   14085279e:	83 f8 0b             	cmp    eax,0xb
   1408527a1:	75 0e                	jne    0x1408527b1
   1408527a3:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   1408527a6:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   1408527a9:	ff 50 18             	call   QWORD PTR [rax+0x18]
   1408527ac:	48 85 c0             	test   rax,rax
   1408527af:	75 06                	jne    0x1408527b7
   1408527b1:	48 83 c3 08          	add    rbx,0x8
   1408527b5:	eb d9                	jmp    0x140852790
   1408527b7:	4c 8d 4d bf          	lea    r9,[rbp-0x41]
   1408527bb:	4c 8d 45 bb          	lea    r8,[rbp-0x45]
   1408527bf:	48 8d 55 b7          	lea    rdx,[rbp-0x49]
   1408527c3:	48 8b c8             	mov    rcx,rax
   1408527c6:	e8 d5 92 43 00       	call   0x140c8baa0
   1408527cb:	eb 24                	jmp    0x1408527f1
   1408527cd:	41 0f b7 86 a8 00 00 	movzx  eax,WORD PTR [r14+0xa8]
   1408527d4:	00 
   1408527d5:	66 89 45 b7          	mov    WORD PTR [rbp-0x49],ax
   1408527d9:	41 0f b7 86 aa 00 00 	movzx  eax,WORD PTR [r14+0xaa]
   1408527e0:	00 
   1408527e1:	66 89 45 bb          	mov    WORD PTR [rbp-0x45],ax
   1408527e5:	41 0f b7 86 ac 00 00 	movzx  eax,WORD PTR [r14+0xac]
   1408527ec:	00 
   1408527ed:	66 89 45 bf          	mov    WORD PTR [rbp-0x41],ax
   1408527f1:	49 8b 86 c8 00 00 00 	mov    rax,QWORD PTR [r14+0xc8]
   1408527f8:	0f b7 18             	movzx  ebx,WORD PTR [rax]
   1408527fb:	49 8b 86 e0 00 00 00 	mov    rax,QWORD PTR [r14+0xe0]
   140852802:	0f b7 38             	movzx  edi,WORD PTR [rax]
   140852805:	49 8b 86 f8 00 00 00 	mov    rax,QWORD PTR [r14+0xf8]
   14085280c:	0f b7 30             	movzx  esi,WORD PTR [rax]
   14085280f:	0f 57 c0             	xorps  xmm0,xmm0
   140852812:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140852816:	66 0f 6f 0d 12 89 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf38912]        # 0x14178b130
   14085281d:	00 
   14085281e:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140852823:	66 c7 45 c7 20 00    	mov    WORD PTR [rbp-0x39],0x20
   140852829:	45 33 c9             	xor    r9d,r9d
   14085282c:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140852830:	48 8d 0d b9 7b df 01 	lea    rcx,[rip+0x1df7bb9]        # 0x14264a3f0
   140852837:	e8 24 71 28 00       	call   0x140ad9960
   14085283c:	90                   	nop
   14085283d:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   140852841:	48 83 fa 0f          	cmp    rdx,0xf
   140852845:	76 34                	jbe    0x14085287b
   140852847:	48 ff c2             	inc    rdx
   14085284a:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   14085284e:	48 8b c1             	mov    rax,rcx
   140852851:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140852858:	72 1c                	jb     0x140852876
   14085285a:	48 83 c2 27          	add    rdx,0x27
   14085285e:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   140852862:	48 2b c1             	sub    rax,rcx
   140852865:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   140852869:	48 83 f8 1f          	cmp    rax,0x1f
   14085286d:	76 07                	jbe    0x140852876
   14085286f:	ff 15 b3 32 d9 00    	call   QWORD PTR [rip+0xd932b3]        # 0x1415e5b28
   140852875:	cc                   	int3
   140852876:	e8 05 6e ce 00       	call   0x141539680
   14085287b:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   14085287f:	66 3b c7             	cmp    ax,di
   140852882:	7d 78                	jge    0x1408528fc
   140852884:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   140852888:	7d 32                	jge    0x1408528bc
   14085288a:	48 8d 15 f7 42 df 00 	lea    rdx,[rip+0xdf42f7]        # 0x141646b88
   140852891:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852895:	e8 b6 58 81 ff       	call   0x140068150
   14085289a:	90                   	nop
   14085289b:	45 33 c9             	xor    r9d,r9d
   14085289e:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408528a2:	48 8d 0d 47 7b df 01 	lea    rcx,[rip+0x1df7b47]        # 0x14264a3f0
   1408528a9:	e8 b2 70 28 00       	call   0x140ad9960
   1408528ae:	90                   	nop
   1408528af:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408528b3:	e8 98 cf 81 ff       	call   0x14006f850
   1408528b8:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408528bc:	66 3b c7             	cmp    ax,di
   1408528bf:	7d 3b                	jge    0x1408528fc
   1408528c1:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   1408528c5:	7e 32                	jle    0x1408528f9
   1408528c7:	48 8d 15 aa 42 df 00 	lea    rdx,[rip+0xdf42aa]        # 0x141646b78
   1408528ce:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408528d2:	e8 79 58 81 ff       	call   0x140068150
   1408528d7:	90                   	nop
   1408528d8:	45 33 c9             	xor    r9d,r9d
   1408528db:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408528df:	48 8d 0d 0a 7b df 01 	lea    rcx,[rip+0x1df7b0a]        # 0x14264a3f0
   1408528e6:	e8 75 70 28 00       	call   0x140ad9960
   1408528eb:	90                   	nop
   1408528ec:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408528f0:	e8 5b cf 81 ff       	call   0x14006f850
   1408528f5:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408528f9:	66 3b c7             	cmp    ax,di
   1408528fc:	7e 75                	jle    0x140852973
   1408528fe:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   140852902:	7d 32                	jge    0x140852936
   140852904:	48 8d 15 ed 42 df 00 	lea    rdx,[rip+0xdf42ed]        # 0x141646bf8
   14085290b:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085290f:	e8 3c 58 81 ff       	call   0x140068150
   140852914:	90                   	nop
   140852915:	45 33 c9             	xor    r9d,r9d
   140852918:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   14085291c:	48 8d 0d cd 7a df 01 	lea    rcx,[rip+0x1df7acd]        # 0x14264a3f0
   140852923:	e8 38 70 28 00       	call   0x140ad9960
   140852928:	90                   	nop
   140852929:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085292d:	e8 1e cf 81 ff       	call   0x14006f850
   140852932:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   140852936:	66 3b c7             	cmp    ax,di
   140852939:	7e 3b                	jle    0x140852976
   14085293b:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   14085293f:	7e 32                	jle    0x140852973
   140852941:	48 8d 15 a0 42 df 00 	lea    rdx,[rip+0xdf42a0]        # 0x141646be8
   140852948:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085294c:	e8 ff 57 81 ff       	call   0x140068150
   140852951:	90                   	nop
   140852952:	45 33 c9             	xor    r9d,r9d
   140852955:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852959:	48 8d 0d 90 7a df 01 	lea    rcx,[rip+0x1df7a90]        # 0x14264a3f0
   140852960:	e8 fb 6f 28 00       	call   0x140ad9960
   140852965:	90                   	nop
   140852966:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   14085296a:	e8 e1 ce 81 ff       	call   0x14006f850
   14085296f:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   140852973:	66 3b c7             	cmp    ax,di
   140852976:	7d 38                	jge    0x1408529b0
   140852978:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   14085297c:	75 32                	jne    0x1408529b0
   14085297e:	48 8d 15 67 8f de 00 	lea    rdx,[rip+0xde8f67]        # 0x14163b8ec
   140852985:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852989:	e8 c2 57 81 ff       	call   0x140068150
   14085298e:	90                   	nop
   14085298f:	45 33 c9             	xor    r9d,r9d
   140852992:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852996:	48 8d 0d 53 7a df 01 	lea    rcx,[rip+0x1df7a53]        # 0x14264a3f0
   14085299d:	e8 be 6f 28 00       	call   0x140ad9960
   1408529a2:	90                   	nop
   1408529a3:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408529a7:	e8 a4 ce 81 ff       	call   0x14006f850
   1408529ac:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408529b0:	66 3b c7             	cmp    ax,di
   1408529b3:	7e 3b                	jle    0x1408529f0
   1408529b5:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   1408529b9:	75 32                	jne    0x1408529ed
   1408529bb:	48 8d 15 3a 8f de 00 	lea    rdx,[rip+0xde8f3a]        # 0x14163b8fc
   1408529c2:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408529c6:	e8 85 57 81 ff       	call   0x140068150
   1408529cb:	90                   	nop
   1408529cc:	45 33 c9             	xor    r9d,r9d
   1408529cf:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408529d3:	48 8d 0d 16 7a df 01 	lea    rcx,[rip+0x1df7a16]        # 0x14264a3f0
   1408529da:	e8 81 6f 28 00       	call   0x140ad9960
   1408529df:	90                   	nop
   1408529e0:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408529e4:	e8 67 ce 81 ff       	call   0x14006f850
   1408529e9:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   1408529ed:	66 3b c7             	cmp    ax,di
   1408529f0:	0f 85 f6 00 00 00    	jne    0x140852aec
   1408529f6:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   1408529fa:	7d 32                	jge    0x140852a2e
   1408529fc:	48 8d 15 f1 8e de 00 	lea    rdx,[rip+0xde8ef1]        # 0x14163b8f4
   140852a03:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852a07:	e8 44 57 81 ff       	call   0x140068150
   140852a0c:	90                   	nop
   140852a0d:	45 33 c9             	xor    r9d,r9d
   140852a10:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852a14:	48 8d 0d d5 79 df 01 	lea    rcx,[rip+0x1df79d5]        # 0x14264a3f0
   140852a1b:	e8 40 6f 28 00       	call   0x140ad9960
   140852a20:	90                   	nop
   140852a21:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852a25:	e8 26 ce 81 ff       	call   0x14006f850
   140852a2a:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   140852a2e:	66 3b c7             	cmp    ax,di
   140852a31:	0f 85 b5 00 00 00    	jne    0x140852aec
   140852a37:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   140852a3b:	7e 32                	jle    0x140852a6f
   140852a3d:	48 8d 15 f0 8d de 00 	lea    rdx,[rip+0xde8df0]        # 0x14163b834
   140852a44:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852a48:	e8 03 57 81 ff       	call   0x140068150
   140852a4d:	90                   	nop
   140852a4e:	45 33 c9             	xor    r9d,r9d
   140852a51:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852a55:	48 8d 0d 94 79 df 01 	lea    rcx,[rip+0x1df7994]        # 0x14264a3f0
   140852a5c:	e8 ff 6e 28 00       	call   0x140ad9960
   140852a61:	90                   	nop
   140852a62:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852a66:	e8 e5 cd 81 ff       	call   0x14006f850
   140852a6b:	0f b7 45 bb          	movzx  eax,WORD PTR [rbp-0x45]
   140852a6f:	66 3b c7             	cmp    ax,di
   140852a72:	75 78                	jne    0x140852aec
   140852a74:	66 39 5d b7          	cmp    WORD PTR [rbp-0x49],bx
   140852a78:	75 72                	jne    0x140852aec
   140852a7a:	66 3b 75 bf          	cmp    si,WORD PTR [rbp-0x41]
   140852a7e:	7e 33                	jle    0x140852ab3
   140852a80:	48 8d 15 fd eb e5 00 	lea    rdx,[rip+0xe5ebfd]        # 0x1416b1684
   140852a87:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852a8b:	e8 c0 56 81 ff       	call   0x140068150
   140852a90:	90                   	nop
   140852a91:	45 33 c9             	xor    r9d,r9d
   140852a94:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852a98:	48 8d 0d 51 79 df 01 	lea    rcx,[rip+0x1df7951]        # 0x14264a3f0
   140852a9f:	e8 bc 6e 28 00       	call   0x140ad9960
   140852aa4:	90                   	nop
   140852aa5:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852aa9:	e8 a2 cd 81 ff       	call   0x14006f850
   140852aae:	e9 01 07 00 00       	jmp    0x1408531b4
   140852ab3:	0f 8d fb 06 00 00    	jge    0x1408531b4
   140852ab9:	48 8d 15 f0 eb e5 00 	lea    rdx,[rip+0xe5ebf0]        # 0x1416b16b0
   140852ac0:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852ac4:	e8 87 56 81 ff       	call   0x140068150
   140852ac9:	90                   	nop
   140852aca:	45 33 c9             	xor    r9d,r9d
   140852acd:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852ad1:	48 8d 0d 18 79 df 01 	lea    rcx,[rip+0x1df7918]        # 0x14264a3f0
   140852ad8:	e8 83 6e 28 00       	call   0x140ad9960
   140852add:	90                   	nop
   140852ade:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852ae2:	e8 69 cd 81 ff       	call   0x14006f850
   140852ae7:	e9 c8 06 00 00       	jmp    0x1408531b4
   140852aec:	66 3b 75 bf          	cmp    si,WORD PTR [rbp-0x41]
   140852af0:	7e 33                	jle    0x140852b25
   140852af2:	48 8d 15 df ec e5 00 	lea    rdx,[rip+0xe5ecdf]        # 0x1416b17d8
   140852af9:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852afd:	e8 4e 56 81 ff       	call   0x140068150
   140852b02:	90                   	nop
   140852b03:	45 33 c9             	xor    r9d,r9d
   140852b06:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852b0a:	48 8d 0d df 78 df 01 	lea    rcx,[rip+0x1df78df]        # 0x14264a3f0
   140852b11:	e8 4a 6e 28 00       	call   0x140ad9960
   140852b16:	90                   	nop
   140852b17:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852b1b:	e8 30 cd 81 ff       	call   0x14006f850
   140852b20:	e9 8f 06 00 00       	jmp    0x1408531b4
   140852b25:	0f 8d 89 06 00 00    	jge    0x1408531b4
   140852b2b:	48 8d 15 5e eb e5 00 	lea    rdx,[rip+0xe5eb5e]        # 0x1416b1690
   140852b32:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852b36:	e8 15 56 81 ff       	call   0x140068150
   140852b3b:	90                   	nop
   140852b3c:	45 33 c9             	xor    r9d,r9d
   140852b3f:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852b43:	48 8d 0d a6 78 df 01 	lea    rcx,[rip+0x1df78a6]        # 0x14264a3f0
   140852b4a:	e8 11 6e 28 00       	call   0x140ad9960
   140852b4f:	90                   	nop
   140852b50:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852b54:	e8 f7 cc 81 ff       	call   0x14006f850
   140852b59:	e9 56 06 00 00       	jmp    0x1408531b4
   140852b5e:	0f 57 c0             	xorps  xmm0,xmm0
   140852b61:	0f 11 45 07          	movups XMMWORD PTR [rbp+0x7],xmm0
   140852b65:	33 ff                	xor    edi,edi
   140852b67:	48 89 7d 17          	mov    QWORD PTR [rbp+0x17],rdi
   140852b6b:	48 c7 45 1f 0f 00 00 	mov    QWORD PTR [rbp+0x1f],0xf
   140852b72:	00 
   140852b73:	40 88 7d 07          	mov    BYTE PTR [rbp+0x7],dil
   140852b77:	44 8b 53 08          	mov    r10d,DWORD PTR [rbx+0x8]
   140852b7b:	4c 8b 05 36 25 b9 01 	mov    r8,QWORD PTR [rip+0x1b92536]        # 0x1423e50b8
   140852b82:	4c 8b 1d 27 25 b9 01 	mov    r11,QWORD PTR [rip+0x1b92527]        # 0x1423e50b0
   140852b89:	4d 2b c3             	sub    r8,r11
   140852b8c:	49 c1 f8 03          	sar    r8,0x3
   140852b90:	45 85 c0             	test   r8d,r8d
   140852b93:	74 38                	je     0x140852bcd
   140852b95:	41 83 fa ff          	cmp    r10d,0xffffffff
   140852b99:	74 32                	je     0x140852bcd
   140852b9b:	41 83 e8 01          	sub    r8d,0x1
   140852b9f:	8b d7                	mov    edx,edi
   140852ba1:	78 2a                	js     0x140852bcd
   140852ba3:	42 8d 0c 02          	lea    ecx,[rdx+r8*1]
   140852ba7:	d1 f9                	sar    ecx,1
   140852ba9:	48 63 c1             	movsxd rax,ecx
   140852bac:	49 8b 34 c3          	mov    rsi,QWORD PTR [r11+rax*8]
   140852bb0:	44 39 96 30 01 00 00 	cmp    DWORD PTR [rsi+0x130],r10d
   140852bb7:	74 17                	je     0x140852bd0
   140852bb9:	8d 41 01             	lea    eax,[rcx+0x1]
   140852bbc:	0f 4e d0             	cmovle edx,eax
   140852bbf:	8d 41 ff             	lea    eax,[rcx-0x1]
   140852bc2:	41 0f 4e c0          	cmovle eax,r8d
   140852bc6:	44 8b c0             	mov    r8d,eax
   140852bc9:	3b d0                	cmp    edx,eax
   140852bcb:	7e d6                	jle    0x140852ba3
   140852bcd:	48 8b f7             	mov    rsi,rdi
   140852bd0:	48 85 f6             	test   rsi,rsi
   140852bd3:	0f 84 ec 04 00 00    	je     0x1408530c5
   140852bd9:	0f 57 c0             	xorps  xmm0,xmm0
   140852bdc:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140852be0:	48 89 7d d7          	mov    QWORD PTR [rbp-0x29],rdi
   140852be4:	48 c7 45 df 0f 00 00 	mov    QWORD PTR [rbp-0x21],0xf
   140852beb:	00 
   140852bec:	c6 45 c7 00          	mov    BYTE PTR [rbp-0x39],0x0
   140852bf0:	4c 8b 15 19 25 b9 01 	mov    r10,QWORD PTR [rip+0x1b92519]        # 0x1423e5110
   140852bf7:	49 3b f2             	cmp    rsi,r10
   140852bfa:	75 56                	jne    0x140852c52
   140852bfc:	44 8b c7             	mov    r8d,edi
   140852bff:	45 8b 8e 30 01 00 00 	mov    r9d,DWORD PTR [r14+0x130]
   140852c06:	48 8b d7             	mov    rdx,rdi
   140852c09:	49 8d 8a 24 0e 00 00 	lea    rcx,[r10+0xe24]
   140852c10:	44 39 49 d8          	cmp    DWORD PTR [rcx-0x28],r9d
   140852c14:	75 07                	jne    0x140852c1d
   140852c16:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
   140852c19:	39 01                	cmp    DWORD PTR [rcx],eax
   140852c1b:	74 12                	je     0x140852c2f
   140852c1d:	41 ff c0             	inc    r8d
   140852c20:	48 ff c2             	inc    rdx
   140852c23:	48 83 c1 04          	add    rcx,0x4
   140852c27:	48 83 fa 0a          	cmp    rdx,0xa
   140852c2b:	7c e3                	jl     0x140852c10
   140852c2d:	eb 0b                	jmp    0x140852c3a
   140852c2f:	49 63 c0             	movsxd rax,r8d
   140852c32:	41 8b bc 82 9c 0e 00 	mov    edi,DWORD PTR [r10+rax*4+0xe9c]
   140852c39:	00 
   140852c3a:	41 b8 03 00 00 00    	mov    r8d,0x3
   140852c40:	48 8d 15 09 99 d9 00 	lea    rdx,[rip+0xd99909]        # 0x1415ec550
   140852c47:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140852c4b:	e8 80 cc 81 ff       	call   0x14006f8d0
   140852c50:	eb 0c                	jmp    0x140852c5e
   140852c52:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140852c56:	48 8b ce             	mov    rcx,rsi
   140852c59:	e8 a2 e8 ad 00       	call   0x141331500
   140852c5e:	8b 43 48             	mov    eax,DWORD PTR [rbx+0x48]
   140852c61:	85 c0                	test   eax,eax
   140852c63:	7e 73                	jle    0x140852cd8
   140852c65:	40 f6 c7 04          	test   dil,0x4
   140852c69:	74 6d                	je     0x140852cd8
   140852c6b:	83 f8 05             	cmp    eax,0x5
   140852c6e:	7c 10                	jl     0x140852c80
   140852c70:	48 8d 15 29 ea e5 00 	lea    rdx,[rip+0xe5ea29]        # 0x1416b16a0
   140852c77:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852c7b:	e8 e0 c8 81 ff       	call   0x14006f560
   140852c80:	83 7b 48 04          	cmp    DWORD PTR [rbx+0x48],0x4
   140852c84:	75 10                	jne    0x140852c96
   140852c86:	48 8d 15 cb e9 e5 00 	lea    rdx,[rip+0xe5e9cb]        # 0x1416b1658
   140852c8d:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852c91:	e8 ca c8 81 ff       	call   0x14006f560
   140852c96:	83 7b 48 03          	cmp    DWORD PTR [rbx+0x48],0x3
   140852c9a:	75 10                	jne    0x140852cac
   140852c9c:	48 8d 15 a5 e9 e5 00 	lea    rdx,[rip+0xe5e9a5]        # 0x1416b1648
   140852ca3:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852ca7:	e8 b4 c8 81 ff       	call   0x14006f560
   140852cac:	83 7b 48 02          	cmp    DWORD PTR [rbx+0x48],0x2
   140852cb0:	75 10                	jne    0x140852cc2
   140852cb2:	48 8d 15 bf e9 e5 00 	lea    rdx,[rip+0xe5e9bf]        # 0x1416b1678
   140852cb9:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852cbd:	e8 9e c8 81 ff       	call   0x14006f560
   140852cc2:	83 7b 48 01          	cmp    DWORD PTR [rbx+0x48],0x1
   140852cc6:	75 10                	jne    0x140852cd8
   140852cc8:	48 8d 15 99 e9 e5 00 	lea    rdx,[rip+0xe5e999]        # 0x1416b1668
   140852ccf:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852cd3:	e8 88 c8 81 ff       	call   0x14006f560
   140852cd8:	8b 43 48             	mov    eax,DWORD PTR [rbx+0x48]
   140852cdb:	b9 09 00 00 00       	mov    ecx,0x9
   140852ce0:	41 b8 19 00 00 00    	mov    r8d,0x19
   140852ce6:	85 c0                	test   eax,eax
   140852ce8:	44 0f 4f c1          	cmovg  r8d,ecx
   140852cec:	48 8d 0d f5 e9 e5 00 	lea    rcx,[rip+0xe5e9f5]        # 0x1416b16e8
   140852cf3:	48 8d 15 fe e9 e5 00 	lea    rdx,[rip+0xe5e9fe]        # 0x1416b16f8
   140852cfa:	48 0f 4f d1          	cmovg  rdx,rcx
   140852cfe:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852d02:	e8 09 cd 81 ff       	call   0x14006fa10
   140852d07:	41 b8 01 00 00 00    	mov    r8d,0x1
   140852d0d:	48 8d 15 28 5a d9 00 	lea    rdx,[rip+0xd95a28]        # 0x1415e873c
   140852d14:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852d18:	e8 f3 cc 81 ff       	call   0x14006fa10
   140852d1d:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140852d21:	48 83 7d df 0f       	cmp    QWORD PTR [rbp-0x21],0xf
   140852d26:	48 0f 47 55 c7       	cmova  rdx,QWORD PTR [rbp-0x39]
   140852d2b:	4c 8b 45 d7          	mov    r8,QWORD PTR [rbp-0x29]
   140852d2f:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852d33:	e8 d8 cc 81 ff       	call   0x14006fa10
   140852d38:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140852d3b:	41 bc 02 00 00 00    	mov    r12d,0x2
   140852d41:	85 c0                	test   eax,eax
   140852d43:	75 1b                	jne    0x140852d60
   140852d45:	41 b8 0f 00 00 00    	mov    r8d,0xf
   140852d4b:	48 8d 15 d6 e9 e5 00 	lea    rdx,[rip+0xe5e9d6]        # 0x1416b1728
   140852d52:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852d56:	e8 b5 cc 81 ff       	call   0x14006fa10
   140852d5b:	e9 fb 02 00 00       	jmp    0x14085305b
   140852d60:	83 f8 01             	cmp    eax,0x1
   140852d63:	75 1b                	jne    0x140852d80
   140852d65:	41 b8 0a 00 00 00    	mov    r8d,0xa
   140852d6b:	48 8d 15 a6 e9 e5 00 	lea    rdx,[rip+0xe5e9a6]        # 0x1416b1718
   140852d72:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852d76:	e8 95 cc 81 ff       	call   0x14006fa10
   140852d7b:	e9 db 02 00 00       	jmp    0x14085305b
   140852d80:	8b 53 24             	mov    edx,DWORD PTR [rbx+0x24]
   140852d83:	83 fa ff             	cmp    edx,0xffffffff
   140852d86:	0f 84 9e 01 00 00    	je     0x140852f2a
   140852d8c:	48 8d 0d bd 26 b9 01 	lea    rcx,[rip+0x1b926bd]        # 0x1423e5450
   140852d93:	e8 48 f9 81 ff       	call   0x1400726e0
   140852d98:	4c 8b f0             	mov    r14,rax
   140852d9b:	48 85 c0             	test   rax,rax
   140852d9e:	0f 84 b7 02 00 00    	je     0x14085305b
   140852da4:	48 8d 15 35 b8 d9 00 	lea    rdx,[rip+0xd9b835]        # 0x1415ee5e0
   140852dab:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852daf:	e8 ac c7 81 ff       	call   0x14006f560
   140852db4:	40 f6 c7 08          	test   dil,0x8
   140852db8:	0f 84 83 00 00 00    	je     0x140852e41
   140852dbe:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   140852dc2:	0f 8e 79 00 00 00    	jle    0x140852e41
   140852dc8:	32 c0                	xor    al,al
   140852dca:	f6 43 3c 20          	test   BYTE PTR [rbx+0x3c],0x20
   140852dce:	74 12                	je     0x140852de2
   140852dd0:	48 8d 15 ed e8 e5 00 	lea    rdx,[rip+0xe5e8ed]        # 0x1416b16c4
   140852dd7:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852ddb:	e8 80 c7 81 ff       	call   0x14006f560
   140852de0:	b0 01                	mov    al,0x1
   140852de2:	f6 43 3c 40          	test   BYTE PTR [rbx+0x3c],0x40
   140852de6:	74 12                	je     0x140852dfa
   140852de8:	48 8d 15 2d 35 e5 00 	lea    rdx,[rip+0xe5352d]        # 0x1416a631c
   140852def:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852df3:	e8 68 c7 81 ff       	call   0x14006f560
   140852df8:	b0 01                	mov    al,0x1
   140852dfa:	f6 43 3c 80          	test   BYTE PTR [rbx+0x3c],0x80
   140852dfe:	74 12                	je     0x140852e12
   140852e00:	48 8d 15 b5 e8 e5 00 	lea    rdx,[rip+0xe5e8b5]        # 0x1416b16bc
   140852e07:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852e0b:	e8 50 c7 81 ff       	call   0x14006f560
   140852e10:	b0 01                	mov    al,0x1
   140852e12:	f7 43 3c 00 01 00 00 	test   DWORD PTR [rbx+0x3c],0x100
   140852e19:	74 12                	je     0x140852e2d
   140852e1b:	48 8d 15 be e8 e5 00 	lea    rdx,[rip+0xe5e8be]        # 0x1416b16e0
   140852e22:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852e26:	e8 35 c7 81 ff       	call   0x14006f560
   140852e2b:	eb 04                	jmp    0x140852e31
   140852e2d:	84 c0                	test   al,al
   140852e2f:	74 10                	je     0x140852e41
   140852e31:	48 8d 15 04 59 d9 00 	lea    rdx,[rip+0xd95904]        # 0x1415e873c
   140852e38:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852e3c:	e8 1f c7 81 ff       	call   0x14006f560
   140852e41:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852e45:	e8 46 c8 81 ff       	call   0x14006f690
   140852e4a:	90                   	nop
   140852e4b:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140852e51:	45 33 c0             	xor    r8d,r8d
   140852e54:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852e58:	49 8b ce             	mov    rcx,r14
   140852e5b:	e8 f0 25 41 00       	call   0x140c65450
   140852e60:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140852e64:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852e68:	e8 a3 6e 86 ff       	call   0x1400b9d10
   140852e6d:	40 f6 c7 01          	test   dil,0x1
   140852e71:	0f 84 a5 00 00 00    	je     0x140852f1c
   140852e77:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   140852e7b:	0f 8e 9b 00 00 00    	jle    0x140852f1c
   140852e81:	48 8d 15 b4 58 d9 00 	lea    rdx,[rip+0xd958b4]        # 0x1415e873c
   140852e88:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852e8c:	e8 cf c6 81 ff       	call   0x14006f560
   140852e91:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140852e94:	49 8b ce             	mov    rcx,r14
   140852e97:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   140852e9d:	4c 8b f0             	mov    r14,rax
   140852ea0:	48 85 c0             	test   rax,rax
   140852ea3:	74 66                	je     0x140852f0b
   140852ea5:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   140852ea9:	48 2b 08             	sub    rcx,QWORD PTR [rax]
   140852eac:	48 c1 f9 03          	sar    rcx,0x3
   140852eb0:	48 85 c9             	test   rcx,rcx
   140852eb3:	74 56                	je     0x140852f0b
   140852eb5:	48 63 4b 2c          	movsxd rcx,DWORD PTR [rbx+0x2c]
   140852eb9:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140852ebc:	4c 8b 3c c8          	mov    r15,QWORD PTR [rax+rcx*8]
   140852ec0:	48 8d 15 39 f8 e0 00 	lea    rdx,[rip+0xe0f839]        # 0x141662700
   140852ec7:	49 8d 4f 50          	lea    rcx,[r15+0x50]
   140852ecb:	e8 b0 cf 81 ff       	call   0x14006fe80
   140852ed0:	84 c0                	test   al,al
   140852ed2:	75 1d                	jne    0x140852ef1
   140852ed4:	49 8d 57 50          	lea    rdx,[r15+0x50]
   140852ed8:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852edc:	e8 2f 6e 86 ff       	call   0x1400b9d10
   140852ee1:	48 8d 15 54 58 d9 00 	lea    rdx,[rip+0xd95854]        # 0x1415e873c
   140852ee8:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852eec:	e8 6f c6 81 ff       	call   0x14006f560
   140852ef1:	48 63 4b 2c          	movsxd rcx,DWORD PTR [rbx+0x2c]
   140852ef5:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140852ef8:	48 8b 14 c8          	mov    rdx,QWORD PTR [rax+rcx*8]
   140852efc:	48 83 c2 10          	add    rdx,0x10
   140852f00:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852f04:	e8 07 6e 86 ff       	call   0x1400b9d10
   140852f09:	eb 11                	jmp    0x140852f1c
   140852f0b:	48 8d 15 f6 f7 e0 00 	lea    rdx,[rip+0xe0f7f6]        # 0x141662708
   140852f12:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852f16:	e8 45 c6 81 ff       	call   0x14006f560
   140852f1b:	90                   	nop
   140852f1c:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140852f20:	e8 2b c9 81 ff       	call   0x14006f850
   140852f25:	e9 31 01 00 00       	jmp    0x14085305b
   140852f2a:	40 f6 c7 01          	test   dil,0x1
   140852f2e:	0f 84 27 01 00 00    	je     0x14085305b
   140852f34:	48 8d 15 a5 b6 d9 00 	lea    rdx,[rip+0xd9b6a5]        # 0x1415ee5e0
   140852f3b:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852f3f:	e8 1c c6 81 ff       	call   0x14006f560
   140852f44:	40 f6 c7 08          	test   dil,0x8
   140852f48:	0f 84 83 00 00 00    	je     0x140852fd1
   140852f4e:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   140852f52:	0f 8e 79 00 00 00    	jle    0x140852fd1
   140852f58:	32 c0                	xor    al,al
   140852f5a:	f6 43 3c 20          	test   BYTE PTR [rbx+0x3c],0x20
   140852f5e:	74 12                	je     0x140852f72
   140852f60:	48 8d 15 5d e7 e5 00 	lea    rdx,[rip+0xe5e75d]        # 0x1416b16c4
   140852f67:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852f6b:	e8 f0 c5 81 ff       	call   0x14006f560
   140852f70:	b0 01                	mov    al,0x1
   140852f72:	f6 43 3c 40          	test   BYTE PTR [rbx+0x3c],0x40
   140852f76:	74 12                	je     0x140852f8a
   140852f78:	48 8d 15 9d 33 e5 00 	lea    rdx,[rip+0xe5339d]        # 0x1416a631c
   140852f7f:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852f83:	e8 d8 c5 81 ff       	call   0x14006f560
   140852f88:	b0 01                	mov    al,0x1
   140852f8a:	f6 43 3c 80          	test   BYTE PTR [rbx+0x3c],0x80
   140852f8e:	74 12                	je     0x140852fa2
   140852f90:	48 8d 15 25 e7 e5 00 	lea    rdx,[rip+0xe5e725]        # 0x1416b16bc
   140852f97:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852f9b:	e8 c0 c5 81 ff       	call   0x14006f560
   140852fa0:	b0 01                	mov    al,0x1
   140852fa2:	f7 43 3c 00 01 00 00 	test   DWORD PTR [rbx+0x3c],0x100
   140852fa9:	74 12                	je     0x140852fbd
   140852fab:	48 8d 15 2e e7 e5 00 	lea    rdx,[rip+0xe5e72e]        # 0x1416b16e0
   140852fb2:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852fb6:	e8 a5 c5 81 ff       	call   0x14006f560
   140852fbb:	eb 04                	jmp    0x140852fc1
   140852fbd:	84 c0                	test   al,al
   140852fbf:	74 10                	je     0x140852fd1
   140852fc1:	48 8d 15 74 57 d9 00 	lea    rdx,[rip+0xd95774]        # 0x1415e873c
   140852fc8:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140852fcc:	e8 8f c5 81 ff       	call   0x14006f560
   140852fd1:	48 63 4b 2c          	movsxd rcx,DWORD PTR [rbx+0x2c]
   140852fd5:	83 f9 ff             	cmp    ecx,0xffffffff
   140852fd8:	74 71                	je     0x14085304b
   140852fda:	49 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [r14+0x5f8]
   140852fe1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   140852fe5:	4c 8b 3c c8          	mov    r15,QWORD PTR [rax+rcx*8]
   140852fe9:	41 f6 47 60 01       	test   BYTE PTR [r15+0x60],0x1
   140852fee:	74 4c                	je     0x14085303c
   140852ff0:	4d 8b 87 50 01 00 00 	mov    r8,QWORD PTR [r15+0x150]
   140852ff7:	49 8b 87 58 01 00 00 	mov    rax,QWORD PTR [r15+0x158]
   140852ffe:	49 2b c0             	sub    rax,r8
   140853001:	48 d1 f8             	sar    rax,1
   140853004:	74 36                	je     0x14085303c
   140853006:	66 44 89 64 24 20    	mov    WORD PTR [rsp+0x20],r12w
   14085300c:	45 33 c9             	xor    r9d,r9d
   14085300f:	45 0f b7 00          	movzx  r8d,WORD PTR [r8]
   140853013:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853017:	49 8b ce             	mov    rcx,r14
   14085301a:	e8 b1 15 ae 00       	call   0x1413345d0
   14085301f:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853023:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140853027:	e8 e4 6c 86 ff       	call   0x1400b9d10
   14085302c:	48 8d 15 09 57 d9 00 	lea    rdx,[rip+0xd95709]        # 0x1415e873c
   140853033:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140853037:	e8 24 c5 81 ff       	call   0x14006f560
   14085303c:	49 8d 57 40          	lea    rdx,[r15+0x40]
   140853040:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140853044:	e8 c7 6c 86 ff       	call   0x1400b9d10
   140853049:	eb 10                	jmp    0x14085305b
   14085304b:	48 8d 15 a2 f7 e0 00 	lea    rdx,[rip+0xe0f7a2]        # 0x1416627f4
   140853052:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140853056:	e8 05 c5 81 ff       	call   0x14006f560
   14085305b:	40 f6 c7 02          	test   dil,0x2
   14085305f:	74 59                	je     0x1408530ba
   140853061:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   140853065:	7e 53                	jle    0x1408530ba
   140853067:	66 83 7b 28 ff       	cmp    WORD PTR [rbx+0x28],0xffff
   14085306c:	74 4c                	je     0x1408530ba
   14085306e:	48 8d 15 5b e6 e5 00 	lea    rdx,[rip+0xe5e65b]        # 0x1416b16d0
   140853075:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140853079:	e8 e2 c4 81 ff       	call   0x14006f560
   14085307e:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853082:	e8 09 c6 81 ff       	call   0x14006f690
   140853087:	90                   	nop
   140853088:	66 44 89 64 24 20    	mov    WORD PTR [rsp+0x20],r12w
   14085308e:	45 33 c9             	xor    r9d,r9d
   140853091:	44 0f b7 43 28       	movzx  r8d,WORD PTR [rbx+0x28]
   140853096:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   14085309a:	48 8b ce             	mov    rcx,rsi
   14085309d:	e8 2e 15 ae 00       	call   0x1413345d0
   1408530a2:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408530a6:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408530aa:	e8 61 6c 86 ff       	call   0x1400b9d10
   1408530af:	90                   	nop
   1408530b0:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408530b4:	e8 97 c7 81 ff       	call   0x14006f850
   1408530b9:	90                   	nop
   1408530ba:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408530be:	e8 8d c7 81 ff       	call   0x14006f850
   1408530c3:	eb 1d                	jmp    0x1408530e2
   1408530c5:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408530c9:	83 7b 48 00          	cmp    DWORD PTR [rbx+0x48],0x0
   1408530cd:	48 8d 15 24 e6 e5 00 	lea    rdx,[rip+0xe5e624]        # 0x1416b16f8
   1408530d4:	7e 07                	jle    0x1408530dd
   1408530d6:	48 8d 15 0b e6 e5 00 	lea    rdx,[rip+0xe5e60b]        # 0x1416b16e8
   1408530dd:	e8 7e c4 81 ff       	call   0x14006f560
   1408530e2:	c7 05 90 73 df 01 04 	mov    DWORD PTR [rip+0x1df7390],0x1010004        # 0x14264a47c
   1408530e9:	00 01 01 
   1408530ec:	48 63 15 91 a6 b7 01 	movsxd rdx,DWORD PTR [rip+0x1b7a691]        # 0x1423cd784
   1408530f3:	48 39 55 17          	cmp    QWORD PTR [rbp+0x17],rdx
   1408530f7:	76 09                	jbe    0x140853102
   1408530f9:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   1408530fd:	e8 0e a8 cd ff       	call   0x14052d910
   140853102:	45 33 c9             	xor    r9d,r9d
   140853105:	48 8d 55 07          	lea    rdx,[rbp+0x7]
   140853109:	48 8d 0d e0 72 df 01 	lea    rcx,[rip+0x1df72e0]        # 0x14264a3f0
   140853110:	e8 4b 68 28 00       	call   0x140ad9960
   140853115:	90                   	nop
   140853116:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   14085311a:	e8 31 c7 81 ff       	call   0x14006f850
   14085311f:	e9 90 00 00 00       	jmp    0x1408531b4
   140853124:	c7 05 4e 73 df 01 03 	mov    DWORD PTR [rip+0x1df734e],0x1010003        # 0x14264a47c
   14085312b:	00 01 01 
   14085312e:	0f 57 c0             	xorps  xmm0,xmm0
   140853131:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853135:	66 0f 6f 0d 53 80 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf38053]        # 0x14178b190
   14085313c:	00 
   14085313d:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853142:	48 8b 05 57 e4 e5 00 	mov    rax,QWORD PTR [rip+0xe5e457]        # 0x1416b15a0
   140853149:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   14085314c:	0f b7 05 51 e4 e5 00 	movzx  eax,WORD PTR [rip+0xe5e451]        # 0x1416b15a4
   140853153:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   140853157:	0f b6 05 48 e4 e5 00 	movzx  eax,BYTE PTR [rip+0xe5e448]        # 0x1416b15a6
   14085315e:	88 45 cd             	mov    BYTE PTR [rbp-0x33],al
   140853161:	c6 45 ce 00          	mov    BYTE PTR [rbp-0x32],0x0
   140853165:	45 33 c9             	xor    r9d,r9d
   140853168:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085316c:	48 8d 0d 7d 72 df 01 	lea    rcx,[rip+0x1df727d]        # 0x14264a3f0
   140853173:	e8 e8 67 28 00       	call   0x140ad9960
   140853178:	90                   	nop
   140853179:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   14085317d:	48 83 fa 0f          	cmp    rdx,0xf
   140853181:	76 31                	jbe    0x1408531b4
   140853183:	48 ff c2             	inc    rdx
   140853186:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   14085318a:	48 8b c1             	mov    rax,rcx
   14085318d:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140853194:	72 19                	jb     0x1408531af
   140853196:	48 83 c2 27          	add    rdx,0x27
   14085319a:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14085319e:	48 2b c1             	sub    rax,rcx
   1408531a1:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1408531a5:	48 83 f8 1f          	cmp    rax,0x1f
   1408531a9:	0f 87 dc 05 00 00    	ja     0x14085378b
   1408531af:	e8 cc 64 ce 00       	call   0x141539680
   1408531b4:	48 8b 4d 27          	mov    rcx,QWORD PTR [rbp+0x27]
   1408531b8:	48 33 cc             	xor    rcx,rsp
   1408531bb:	e8 a0 64 ce 00       	call   0x141539660
   1408531c0:	4c 8d 9c 24 b0 00 00 	lea    r11,[rsp+0xb0]
   1408531c7:	00 
   1408531c8:	49 8b 5b 40          	mov    rbx,QWORD PTR [r11+0x40]
   1408531cc:	49 8b 73 48          	mov    rsi,QWORD PTR [r11+0x48]
   1408531d0:	49 8b e3             	mov    rsp,r11
   1408531d3:	41 5f                	pop    r15
   1408531d5:	41 5e                	pop    r14
   1408531d7:	41 5c                	pop    r12
   1408531d9:	5f                   	pop    rdi
   1408531da:	5d                   	pop    rbp
   1408531db:	c3                   	ret
   1408531dc:	c7 05 96 72 df 01 06 	mov    DWORD PTR [rip+0x1df7296],0x1010006        # 0x14264a47c
   1408531e3:	00 01 01 
   1408531e6:	0f 57 c0             	xorps  xmm0,xmm0
   1408531e9:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408531ed:	66 0f 6f 0d 0b 80 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3800b]        # 0x14178b200
   1408531f4:	00 
   1408531f5:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408531fa:	f2 0f 10 05 8e e3 e5 	movsd  xmm0,QWORD PTR [rip+0xe5e38e]        # 0x1416b1590
   140853201:	00 
   140853202:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140853207:	8b 05 8b e3 e5 00    	mov    eax,DWORD PTR [rip+0xe5e38b]        # 0x1416b1598
   14085320d:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140853210:	0f b7 05 85 e3 e5 00 	movzx  eax,WORD PTR [rip+0xe5e385]        # 0x1416b159c
   140853217:	66 89 45 d3          	mov    WORD PTR [rbp-0x2d],ax
   14085321b:	c6 45 d5 00          	mov    BYTE PTR [rbp-0x2b],0x0
   14085321f:	45 33 c9             	xor    r9d,r9d
   140853222:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853226:	48 8d 0d c3 71 df 01 	lea    rcx,[rip+0x1df71c3]        # 0x14264a3f0
   14085322d:	e8 2e 67 28 00       	call   0x140ad9960
   140853232:	90                   	nop
   140853233:	e9 41 ff ff ff       	jmp    0x140853179
   140853238:	c7 05 3a 72 df 01 02 	mov    DWORD PTR [rip+0x1df723a],0x1010002        # 0x14264a47c
   14085323f:	00 01 01 
   140853242:	0f 57 c0             	xorps  xmm0,xmm0
   140853245:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853249:	66 0f 6f 0d bf 7f f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37fbf]        # 0x14178b210
   140853250:	00 
   140853251:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853256:	f2 0f 10 05 6a e3 e5 	movsd  xmm0,QWORD PTR [rip+0xe5e36a]        # 0x1416b15c8
   14085325d:	00 
   14085325e:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140853263:	8b 05 67 e3 e5 00    	mov    eax,DWORD PTR [rip+0xe5e367]        # 0x1416b15d0
   140853269:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   14085326c:	0f b7 05 61 e3 e5 00 	movzx  eax,WORD PTR [rip+0xe5e361]        # 0x1416b15d4
   140853273:	66 89 45 d3          	mov    WORD PTR [rbp-0x2d],ax
   140853277:	0f b6 05 58 e3 e5 00 	movzx  eax,BYTE PTR [rip+0xe5e358]        # 0x1416b15d6
   14085327e:	88 45 d5             	mov    BYTE PTR [rbp-0x2b],al
   140853281:	c6 45 d6 00          	mov    BYTE PTR [rbp-0x2a],0x0
   140853285:	45 33 c9             	xor    r9d,r9d
   140853288:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085328c:	48 8d 0d 5d 71 df 01 	lea    rcx,[rip+0x1df715d]        # 0x14264a3f0
   140853293:	e8 c8 66 28 00       	call   0x140ad9960
   140853298:	90                   	nop
   140853299:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085329d:	e8 ae c5 81 ff       	call   0x14006f850
   1408532a2:	e9 0d ff ff ff       	jmp    0x1408531b4
   1408532a7:	c7 05 cb 71 df 01 02 	mov    DWORD PTR [rip+0x1df71cb],0x1010002        # 0x14264a47c
   1408532ae:	00 01 01 
   1408532b1:	0f 57 c0             	xorps  xmm0,xmm0
   1408532b4:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408532b8:	b9 20 00 00 00       	mov    ecx,0x20
   1408532bd:	e8 0e d5 81 ff       	call   0x1400707d0
   1408532c2:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   1408532c6:	66 0f 6f 05 e2 7f f3 	movdqa xmm0,XMMWORD PTR [rip+0xf37fe2]        # 0x14178b2b0
   1408532cd:	00 
   1408532ce:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   1408532d3:	0f 10 05 ce e2 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5e2ce]        # 0x1416b15a8
   1408532da:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   1408532dd:	f2 0f 10 05 d3 e2 e5 	movsd  xmm0,QWORD PTR [rip+0xe5e2d3]        # 0x1416b15b8
   1408532e4:	00 
   1408532e5:	f2 0f 11 40 10       	movsd  QWORD PTR [rax+0x10],xmm0
   1408532ea:	0f b6 0d cf e2 e5 00 	movzx  ecx,BYTE PTR [rip+0xe5e2cf]        # 0x1416b15c0
   1408532f1:	88 48 18             	mov    BYTE PTR [rax+0x18],cl
   1408532f4:	c6 40 19 00          	mov    BYTE PTR [rax+0x19],0x0
   1408532f8:	45 33 c9             	xor    r9d,r9d
   1408532fb:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408532ff:	48 8d 0d ea 70 df 01 	lea    rcx,[rip+0x1df70ea]        # 0x14264a3f0
   140853306:	e8 55 66 28 00       	call   0x140ad9960
   14085330b:	90                   	nop
   14085330c:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853310:	e8 3b c5 81 ff       	call   0x14006f850
   140853315:	e9 9a fe ff ff       	jmp    0x1408531b4
   14085331a:	c7 05 58 71 df 01 03 	mov    DWORD PTR [rip+0x1df7158],0x1010003        # 0x14264a47c
   140853321:	00 01 01 
   140853324:	0f 57 c0             	xorps  xmm0,xmm0
   140853327:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   14085332b:	66 0f 6f 0d 6d 7e f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37e6d]        # 0x14178b1a0
   140853332:	00 
   140853333:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853338:	48 b8 4d 6f 75 6e 74 	movabs rax,0x676e69746e756f4d
   14085333f:	69 6e 67 
   140853342:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853346:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   14085334a:	45 33 c9             	xor    r9d,r9d
   14085334d:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853351:	48 8d 0d 98 70 df 01 	lea    rcx,[rip+0x1df7098]        # 0x14264a3f0
   140853358:	e8 03 66 28 00       	call   0x140ad9960
   14085335d:	90                   	nop
   14085335e:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853362:	e8 e9 c4 81 ff       	call   0x14006f850
   140853367:	e9 48 fe ff ff       	jmp    0x1408531b4
   14085336c:	c7 05 06 71 df 01 03 	mov    DWORD PTR [rip+0x1df7106],0x1010003        # 0x14264a47c
   140853373:	00 01 01 
   140853376:	0f 57 c0             	xorps  xmm0,xmm0
   140853379:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   14085337d:	66 0f 6f 0d 4b 7e f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37e4b]        # 0x14178b1d0
   140853384:	00 
   140853385:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   14085338a:	f2 0f 10 05 ce e1 e5 	movsd  xmm0,QWORD PTR [rip+0xe5e1ce]        # 0x1416b1560
   140853391:	00 
   140853392:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140853397:	0f b7 05 ca e1 e5 00 	movzx  eax,WORD PTR [rip+0xe5e1ca]        # 0x1416b1568
   14085339e:	66 89 45 cf          	mov    WORD PTR [rbp-0x31],ax
   1408533a2:	0f b6 05 c1 e1 e5 00 	movzx  eax,BYTE PTR [rip+0xe5e1c1]        # 0x1416b156a
   1408533a9:	88 45 d1             	mov    BYTE PTR [rbp-0x2f],al
   1408533ac:	c6 45 d2 00          	mov    BYTE PTR [rbp-0x2e],0x0
   1408533b0:	45 33 c9             	xor    r9d,r9d
   1408533b3:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408533b7:	48 8d 0d 32 70 df 01 	lea    rcx,[rip+0x1df7032]        # 0x14264a3f0
   1408533be:	e8 9d 65 28 00       	call   0x140ad9960
   1408533c3:	90                   	nop
   1408533c4:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408533c8:	e8 83 c4 81 ff       	call   0x14006f850
   1408533cd:	e9 e2 fd ff ff       	jmp    0x1408531b4
   1408533d2:	c7 05 a0 70 df 01 03 	mov    DWORD PTR [rip+0x1df70a0],0x1010003        # 0x14264a47c
   1408533d9:	00 01 01 
   1408533dc:	0f 57 c0             	xorps  xmm0,xmm0
   1408533df:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408533e3:	66 0f 6f 0d 15 7e f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37e15]        # 0x14178b200
   1408533ea:	00 
   1408533eb:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408533f0:	f2 0f 10 05 88 e1 e5 	movsd  xmm0,QWORD PTR [rip+0xe5e188]        # 0x1416b1580
   1408533f7:	00 
   1408533f8:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   1408533fd:	8b 05 85 e1 e5 00    	mov    eax,DWORD PTR [rip+0xe5e185]        # 0x1416b1588
   140853403:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140853406:	0f b7 05 7f e1 e5 00 	movzx  eax,WORD PTR [rip+0xe5e17f]        # 0x1416b158c
   14085340d:	66 89 45 d3          	mov    WORD PTR [rbp-0x2d],ax
   140853411:	c6 45 d5 00          	mov    BYTE PTR [rbp-0x2b],0x0
   140853415:	45 33 c9             	xor    r9d,r9d
   140853418:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085341c:	48 8d 0d cd 6f df 01 	lea    rcx,[rip+0x1df6fcd]        # 0x14264a3f0
   140853423:	e8 38 65 28 00       	call   0x140ad9960
   140853428:	90                   	nop
   140853429:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085342d:	e8 1e c4 81 ff       	call   0x14006f850
   140853432:	e9 7d fd ff ff       	jmp    0x1408531b4
   140853437:	c7 05 3b 70 df 01 03 	mov    DWORD PTR [rip+0x1df703b],0x1010003        # 0x14264a47c
   14085343e:	00 01 01 
   140853441:	0f 57 c0             	xorps  xmm0,xmm0
   140853444:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853448:	b9 20 00 00 00       	mov    ecx,0x20
   14085344d:	e8 7e d3 81 ff       	call   0x1400707d0
   140853452:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853456:	66 0f 6f 05 f2 7d f3 	movdqa xmm0,XMMWORD PTR [rip+0xf37df2]        # 0x14178b250
   14085345d:	00 
   14085345e:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   140853463:	0f 10 05 1e dc e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5dc1e]        # 0x1416b1088
   14085346a:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   14085346d:	0f b7 0d 24 dc e5 00 	movzx  ecx,WORD PTR [rip+0xe5dc24]        # 0x1416b1098
   140853474:	66 89 48 10          	mov    WORD PTR [rax+0x10],cx
   140853478:	0f b6 0d 1b dc e5 00 	movzx  ecx,BYTE PTR [rip+0xe5dc1b]        # 0x1416b109a
   14085347f:	88 48 12             	mov    BYTE PTR [rax+0x12],cl
   140853482:	c6 40 13 00          	mov    BYTE PTR [rax+0x13],0x0
   140853486:	45 33 c9             	xor    r9d,r9d
   140853489:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085348d:	48 8d 0d 5c 6f df 01 	lea    rcx,[rip+0x1df6f5c]        # 0x14264a3f0
   140853494:	e8 c7 64 28 00       	call   0x140ad9960
   140853499:	90                   	nop
   14085349a:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085349e:	e8 ad c3 81 ff       	call   0x14006f850
   1408534a3:	e9 0c fd ff ff       	jmp    0x1408531b4
   1408534a8:	c7 05 ca 6f df 01 02 	mov    DWORD PTR [rip+0x1df6fca],0x1010002        # 0x14264a47c
   1408534af:	00 01 01 
   1408534b2:	0f 57 c0             	xorps  xmm0,xmm0
   1408534b5:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408534b9:	66 0f 6f 0d 1f 7d f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37d1f]        # 0x14178b1e0
   1408534c0:	00 
   1408534c1:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408534c6:	f2 0f 10 05 a2 e0 e5 	movsd  xmm0,QWORD PTR [rip+0xe5e0a2]        # 0x1416b1570
   1408534cd:	00 
   1408534ce:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   1408534d3:	8b 05 9f e0 e5 00    	mov    eax,DWORD PTR [rip+0xe5e09f]        # 0x1416b1578
   1408534d9:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   1408534dc:	c6 45 d3 00          	mov    BYTE PTR [rbp-0x2d],0x0
   1408534e0:	45 33 c9             	xor    r9d,r9d
   1408534e3:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408534e7:	48 8d 0d 02 6f df 01 	lea    rcx,[rip+0x1df6f02]        # 0x14264a3f0
   1408534ee:	e8 6d 64 28 00       	call   0x140ad9960
   1408534f3:	90                   	nop
   1408534f4:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408534f8:	e8 53 c3 81 ff       	call   0x14006f850
   1408534fd:	e9 b2 fc ff ff       	jmp    0x1408531b4
   140853502:	c7 05 70 6f df 01 02 	mov    DWORD PTR [rip+0x1df6f70],0x1010002        # 0x14264a47c
   140853509:	00 01 01 
   14085350c:	0f 57 c0             	xorps  xmm0,xmm0
   14085350f:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853513:	b9 20 00 00 00       	mov    ecx,0x20
   140853518:	e8 b3 d2 81 ff       	call   0x1400707d0
   14085351d:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853521:	66 0f 6f 05 57 7d f3 	movdqa xmm0,XMMWORD PTR [rip+0xf37d57]        # 0x14178b280
   140853528:	00 
   140853529:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   14085352e:	0f 10 05 d3 e0 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5e0d3]        # 0x1416b1608
   140853535:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   140853538:	8b 0d da e0 e5 00    	mov    ecx,DWORD PTR [rip+0xe5e0da]        # 0x1416b1618
   14085353e:	89 48 10             	mov    DWORD PTR [rax+0x10],ecx
   140853541:	0f b7 0d d4 e0 e5 00 	movzx  ecx,WORD PTR [rip+0xe5e0d4]        # 0x1416b161c
   140853548:	66 89 48 14          	mov    WORD PTR [rax+0x14],cx
   14085354c:	c6 40 16 00          	mov    BYTE PTR [rax+0x16],0x0
   140853550:	45 33 c9             	xor    r9d,r9d
   140853553:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853557:	48 8d 0d 92 6e df 01 	lea    rcx,[rip+0x1df6e92]        # 0x14264a3f0
   14085355e:	e8 fd 63 28 00       	call   0x140ad9960
   140853563:	90                   	nop
   140853564:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853568:	e8 e3 c2 81 ff       	call   0x14006f850
   14085356d:	e9 42 fc ff ff       	jmp    0x1408531b4
   140853572:	c7 05 00 6f df 01 03 	mov    DWORD PTR [rip+0x1df6f00],0x1010003        # 0x14264a47c
   140853579:	00 01 01 
   14085357c:	0f 57 c0             	xorps  xmm0,xmm0
   14085357f:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853583:	b9 20 00 00 00       	mov    ecx,0x20
   140853588:	e8 43 d2 81 ff       	call   0x1400707d0
   14085358d:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853591:	66 0f 6f 05 17 7d f3 	movdqa xmm0,XMMWORD PTR [rip+0xf37d17]        # 0x14178b2b0
   140853598:	00 
   140853599:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   14085359e:	0f 10 05 43 e0 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5e043]        # 0x1416b15e8
   1408535a5:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   1408535a8:	f2 0f 10 05 48 e0 e5 	movsd  xmm0,QWORD PTR [rip+0xe5e048]        # 0x1416b15f8
   1408535af:	00 
   1408535b0:	f2 0f 11 40 10       	movsd  QWORD PTR [rax+0x10],xmm0
   1408535b5:	0f b6 0d 44 e0 e5 00 	movzx  ecx,BYTE PTR [rip+0xe5e044]        # 0x1416b1600
   1408535bc:	88 48 18             	mov    BYTE PTR [rax+0x18],cl
   1408535bf:	c6 40 19 00          	mov    BYTE PTR [rax+0x19],0x0
   1408535c3:	45 33 c9             	xor    r9d,r9d
   1408535c6:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408535ca:	48 8d 0d 1f 6e df 01 	lea    rcx,[rip+0x1df6e1f]        # 0x14264a3f0
   1408535d1:	e8 8a 63 28 00       	call   0x140ad9960
   1408535d6:	90                   	nop
   1408535d7:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408535db:	e8 70 c2 81 ff       	call   0x14006f850
   1408535e0:	e9 cf fb ff ff       	jmp    0x1408531b4
   1408535e5:	c7 05 8d 6e df 01 03 	mov    DWORD PTR [rip+0x1df6e8d],0x1010003        # 0x14264a47c
   1408535ec:	00 01 01 
   1408535ef:	0f 57 c0             	xorps  xmm0,xmm0
   1408535f2:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408535f6:	b9 20 00 00 00       	mov    ecx,0x20
   1408535fb:	e8 d0 d1 81 ff       	call   0x1400707d0
   140853600:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853604:	66 0f 6f 05 24 7c f3 	movdqa xmm0,XMMWORD PTR [rip+0xf37c24]        # 0x14178b230
   14085360b:	00 
   14085360c:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   140853611:	0f 10 05 18 e0 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5e018]        # 0x1416b1630
   140853618:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   14085361b:	0f b6 0d 1e e0 e5 00 	movzx  ecx,BYTE PTR [rip+0xe5e01e]        # 0x1416b1640
   140853622:	88 48 10             	mov    BYTE PTR [rax+0x10],cl
   140853625:	c6 40 11 00          	mov    BYTE PTR [rax+0x11],0x0
   140853629:	45 33 c9             	xor    r9d,r9d
   14085362c:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853630:	48 8d 0d b9 6d df 01 	lea    rcx,[rip+0x1df6db9]        # 0x14264a3f0
   140853637:	e8 24 63 28 00       	call   0x140ad9960
   14085363c:	90                   	nop
   14085363d:	e9 37 fb ff ff       	jmp    0x140853179
   140853642:	c7 05 30 6e df 01 02 	mov    DWORD PTR [rip+0x1df6e30],0x1010002        # 0x14264a47c
   140853649:	00 01 01 
   14085364c:	0f 57 c0             	xorps  xmm0,xmm0
   14085364f:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853653:	66 0f 6f 0d 45 7b f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37b45]        # 0x14178b1a0
   14085365a:	00 
   14085365b:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853660:	48 b8 43 6c 69 6d 62 	movabs rax,0x676e69626d696c43
   140853667:	69 6e 67 
   14085366a:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   14085366e:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   140853672:	45 33 c9             	xor    r9d,r9d
   140853675:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853679:	48 8d 0d 70 6d df 01 	lea    rcx,[rip+0x1df6d70]        # 0x14264a3f0
   140853680:	e8 db 62 28 00       	call   0x140ad9960
   140853685:	90                   	nop
   140853686:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085368a:	e8 c1 c1 81 ff       	call   0x14006f850
   14085368f:	e9 20 fb ff ff       	jmp    0x1408531b4
   140853694:	c7 05 de 6d df 01 04 	mov    DWORD PTR [rip+0x1df6dde],0x1010004        # 0x14264a47c
   14085369b:	00 01 01 
   14085369e:	0f 57 c0             	xorps  xmm0,xmm0
   1408536a1:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408536a5:	66 0f 6f 0d 43 7b f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37b43]        # 0x14178b1f0
   1408536ac:	00 
   1408536ad:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408536b2:	f2 0f 10 05 66 df e5 	movsd  xmm0,QWORD PTR [rip+0xe5df66]        # 0x1416b1620
   1408536b9:	00 
   1408536ba:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   1408536bf:	8b 05 63 df e5 00    	mov    eax,DWORD PTR [rip+0xe5df63]        # 0x1416b1628
   1408536c5:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   1408536c8:	0f b6 05 5d df e5 00 	movzx  eax,BYTE PTR [rip+0xe5df5d]        # 0x1416b162c
   1408536cf:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
   1408536d2:	c6 45 d4 00          	mov    BYTE PTR [rbp-0x2c],0x0
   1408536d6:	45 33 c9             	xor    r9d,r9d
   1408536d9:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408536dd:	48 8d 0d 0c 6d df 01 	lea    rcx,[rip+0x1df6d0c]        # 0x14264a3f0
   1408536e4:	e8 77 62 28 00       	call   0x140ad9960
   1408536e9:	90                   	nop
   1408536ea:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408536ee:	e8 5d c1 81 ff       	call   0x14006f850
   1408536f3:	e9 bc fa ff ff       	jmp    0x1408531b4
   1408536f8:	c7 05 7a 6d df 01 03 	mov    DWORD PTR [rip+0x1df6d7a],0x1010003        # 0x14264a47c
   1408536ff:	00 01 01 
   140853702:	0f 57 c0             	xorps  xmm0,xmm0
   140853705:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853709:	66 0f 6f 0d 7f 7a f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37a7f]        # 0x14178b190
   140853710:	00 
   140853711:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853716:	48 8b 05 c3 de e5 00 	mov    rax,QWORD PTR [rip+0xe5dec3]        # 0x1416b15e0
   14085371d:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   140853720:	0f b7 05 bd de e5 00 	movzx  eax,WORD PTR [rip+0xe5debd]        # 0x1416b15e4
   140853727:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   14085372b:	0f b6 05 b4 de e5 00 	movzx  eax,BYTE PTR [rip+0xe5deb4]        # 0x1416b15e6
   140853732:	88 45 cd             	mov    BYTE PTR [rbp-0x33],al
   140853735:	c6 45 ce 00          	mov    BYTE PTR [rbp-0x32],0x0
   140853739:	45 33 c9             	xor    r9d,r9d
   14085373c:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853740:	48 8d 0d a9 6c df 01 	lea    rcx,[rip+0x1df6ca9]        # 0x14264a3f0
   140853747:	e8 14 62 28 00       	call   0x140ad9960
   14085374c:	90                   	nop
   14085374d:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   140853751:	48 83 fa 0f          	cmp    rdx,0xf
   140853755:	0f 86 59 fa ff ff    	jbe    0x1408531b4
   14085375b:	48 ff c2             	inc    rdx
   14085375e:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   140853762:	48 8b c1             	mov    rax,rcx
   140853765:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14085376c:	0f 82 3d fa ff ff    	jb     0x1408531af
   140853772:	48 83 c2 27          	add    rdx,0x27
   140853776:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14085377a:	48 2b c1             	sub    rax,rcx
   14085377d:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   140853781:	48 83 f8 1f          	cmp    rax,0x1f
   140853785:	0f 86 24 fa ff ff    	jbe    0x1408531af
   14085378b:	ff 15 97 23 d9 00    	call   QWORD PTR [rip+0xd92397]        # 0x1415e5b28
   140853791:	cc                   	int3
   140853792:	c7 05 e0 6c df 01 03 	mov    DWORD PTR [rip+0x1df6ce0],0x1010003        # 0x14264a47c
   140853799:	00 01 01 
   14085379c:	0f 57 c0             	xorps  xmm0,xmm0
   14085379f:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408537a3:	66 0f 6f 0d e5 79 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf379e5]        # 0x14178b190
   1408537aa:	00 
   1408537ab:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408537b0:	48 8b 05 21 de e5 00 	mov    rax,QWORD PTR [rip+0xe5de21]        # 0x1416b15d8
   1408537b7:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   1408537ba:	0f b7 05 1b de e5 00 	movzx  eax,WORD PTR [rip+0xe5de1b]        # 0x1416b15dc
   1408537c1:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   1408537c5:	0f b6 05 12 de e5 00 	movzx  eax,BYTE PTR [rip+0xe5de12]        # 0x1416b15de
   1408537cc:	88 45 cd             	mov    BYTE PTR [rbp-0x33],al
   1408537cf:	c6 45 ce 00          	mov    BYTE PTR [rbp-0x32],0x0
   1408537d3:	45 33 c9             	xor    r9d,r9d
   1408537d6:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408537da:	48 8d 0d 0f 6c df 01 	lea    rcx,[rip+0x1df6c0f]        # 0x14264a3f0
   1408537e1:	e8 7a 61 28 00       	call   0x140ad9960
   1408537e6:	90                   	nop
   1408537e7:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408537eb:	e8 60 c0 81 ff       	call   0x14006f850
   1408537f0:	e9 bf f9 ff ff       	jmp    0x1408531b4
   1408537f5:	c7 05 7d 6c df 01 06 	mov    DWORD PTR [rip+0x1df6c7d],0x1010006        # 0x14264a47c
   1408537fc:	00 01 01 
   1408537ff:	0f 57 c0             	xorps  xmm0,xmm0
   140853802:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853806:	66 0f 6f 0d 92 79 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37992]        # 0x14178b1a0
   14085380d:	00 
   14085380e:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853813:	48 b8 50 61 72 72 79 	movabs rax,0x676e697972726150
   14085381a:	69 6e 67 
   14085381d:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853821:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   140853825:	45 33 c9             	xor    r9d,r9d
   140853828:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085382c:	48 8d 0d bd 6b df 01 	lea    rcx,[rip+0x1df6bbd]        # 0x14264a3f0
   140853833:	e8 28 61 28 00       	call   0x140ad9960
   140853838:	90                   	nop
   140853839:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085383d:	e8 0e c0 81 ff       	call   0x14006f850
   140853842:	e9 6d f9 ff ff       	jmp    0x1408531b4
   140853847:	c7 05 2b 6c df 01 06 	mov    DWORD PTR [rip+0x1df6c2b],0x1010006        # 0x14264a47c
   14085384e:	00 01 01 
   140853851:	0f 57 c0             	xorps  xmm0,xmm0
   140853854:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853858:	66 0f 6f 0d 40 79 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37940]        # 0x14178b1a0
   14085385f:	00 
   140853860:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853865:	48 b8 42 6c 6f 63 6b 	movabs rax,0x676e696b636f6c42
   14085386c:	69 6e 67 
   14085386f:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853873:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   140853877:	45 33 c9             	xor    r9d,r9d
   14085387a:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085387e:	48 8d 0d 6b 6b df 01 	lea    rcx,[rip+0x1df6b6b]        # 0x14264a3f0
   140853885:	e8 d6 60 28 00       	call   0x140ad9960
   14085388a:	90                   	nop
   14085388b:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   14085388f:	e8 bc bf 81 ff       	call   0x14006f850
   140853894:	e9 1b f9 ff ff       	jmp    0x1408531b4
   140853899:	c7 05 d9 6b df 01 03 	mov    DWORD PTR [rip+0x1df6bd9],0x1010003        # 0x14264a47c
   1408538a0:	00 01 01 
   1408538a3:	0f 57 c0             	xorps  xmm0,xmm0
   1408538a6:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408538aa:	66 0f 6f 0d de 78 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf378de]        # 0x14178b190
   1408538b1:	00 
   1408538b2:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   1408538b7:	48 8b 05 22 1b e5 00 	mov    rax,QWORD PTR [rip+0xe51b22]        # 0x1416a53e0
   1408538be:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   1408538c1:	0f b7 05 1c 1b e5 00 	movzx  eax,WORD PTR [rip+0xe51b1c]        # 0x1416a53e4
   1408538c8:	66 89 45 cb          	mov    WORD PTR [rbp-0x35],ax
   1408538cc:	0f b6 05 13 1b e5 00 	movzx  eax,BYTE PTR [rip+0xe51b13]        # 0x1416a53e6
   1408538d3:	88 45 cd             	mov    BYTE PTR [rbp-0x33],al
   1408538d6:	c6 45 ce 00          	mov    BYTE PTR [rbp-0x32],0x0
   1408538da:	45 33 c9             	xor    r9d,r9d
   1408538dd:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408538e1:	48 8d 0d 08 6b df 01 	lea    rcx,[rip+0x1df6b08]        # 0x14264a3f0
   1408538e8:	e8 73 60 28 00       	call   0x140ad9960
   1408538ed:	90                   	nop
   1408538ee:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   1408538f2:	e8 59 bf 81 ff       	call   0x14006f850
   1408538f7:	0f b7 7b 08          	movzx  edi,WORD PTR [rbx+0x8]
   1408538fb:	44 0f b7 7b 0a       	movzx  r15d,WORD PTR [rbx+0xa]
   140853900:	44 0f b7 73 0c       	movzx  r14d,WORD PTR [rbx+0xc]
   140853905:	0f b7 73 14          	movzx  esi,WORD PTR [rbx+0x14]
   140853909:	44 0f b7 63 16       	movzx  r12d,WORD PTR [rbx+0x16]
   14085390e:	0f b7 5b 18          	movzx  ebx,WORD PTR [rbx+0x18]
   140853912:	0f 57 c0             	xorps  xmm0,xmm0
   140853915:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853919:	66 0f 6f 0d 0f 78 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3780f]        # 0x14178b130
   140853920:	00 
   140853921:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853926:	66 c7 45 c7 20 00    	mov    WORD PTR [rbp-0x39],0x20
   14085392c:	45 33 c9             	xor    r9d,r9d
   14085392f:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853933:	48 8d 0d b6 6a df 01 	lea    rcx,[rip+0x1df6ab6]        # 0x14264a3f0
   14085393a:	e8 21 60 28 00       	call   0x140ad9960
   14085393f:	90                   	nop
   140853940:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853944:	e8 07 bf 81 ff       	call   0x14006f850
   140853949:	66 45 3b fc          	cmp    r15w,r12w
   14085394d:	0f 8d eb 00 00 00    	jge    0x140853a3e
   140853953:	66 3b fe             	cmp    di,si
   140853956:	7d 31                	jge    0x140853989
   140853958:	48 8d 15 29 32 df 00 	lea    rdx,[rip+0xdf3229]        # 0x141646b88
   14085395f:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853963:	e8 e8 47 81 ff       	call   0x140068150
   140853968:	90                   	nop
   140853969:	45 33 c9             	xor    r9d,r9d
   14085396c:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853970:	48 8d 0d 79 6a df 01 	lea    rcx,[rip+0x1df6a79]        # 0x14264a3f0
   140853977:	e8 e4 5f 28 00       	call   0x140ad9960
   14085397c:	90                   	nop
   14085397d:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853981:	e8 ca be 81 ff       	call   0x14006f850
   140853986:	66 3b fe             	cmp    di,si
   140853989:	7e 2e                	jle    0x1408539b9
   14085398b:	48 8d 15 e6 31 df 00 	lea    rdx,[rip+0xdf31e6]        # 0x141646b78
   140853992:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853996:	e8 b5 47 81 ff       	call   0x140068150
   14085399b:	90                   	nop
   14085399c:	45 33 c9             	xor    r9d,r9d
   14085399f:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408539a3:	48 8d 0d 46 6a df 01 	lea    rcx,[rip+0x1df6a46]        # 0x14264a3f0
   1408539aa:	e8 b1 5f 28 00       	call   0x140ad9960
   1408539af:	90                   	nop
   1408539b0:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408539b4:	e8 97 be 81 ff       	call   0x14006f850
   1408539b9:	66 3b fe             	cmp    di,si
   1408539bc:	75 2e                	jne    0x1408539ec
   1408539be:	48 8d 15 27 7f de 00 	lea    rdx,[rip+0xde7f27]        # 0x14163b8ec
   1408539c5:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408539c9:	e8 82 47 81 ff       	call   0x140068150
   1408539ce:	90                   	nop
   1408539cf:	45 33 c9             	xor    r9d,r9d
   1408539d2:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   1408539d6:	48 8d 0d 13 6a df 01 	lea    rcx,[rip+0x1df6a13]        # 0x14264a3f0
   1408539dd:	e8 7e 5f 28 00       	call   0x140ad9960
   1408539e2:	90                   	nop
   1408539e3:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   1408539e7:	e8 64 be 81 ff       	call   0x14006f850
   1408539ec:	66 41 3b de          	cmp    bx,r14w
   1408539f0:	0f 8e c7 01 00 00    	jle    0x140853bbd
   1408539f6:	0f 57 c0             	xorps  xmm0,xmm0
   1408539f9:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   1408539fd:	66 0f 6f 0d 9b 77 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3779b]        # 0x14178b1a0
   140853a04:	00 
   140853a05:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853a0a:	48 b8 20 28 61 62 6f 	movabs rax,0x2965766f62612820
   140853a11:	76 65 29 
   140853a14:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853a18:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   140853a1c:	45 33 c9             	xor    r9d,r9d
   140853a1f:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853a23:	48 8d 0d c6 69 df 01 	lea    rcx,[rip+0x1df69c6]        # 0x14264a3f0
   140853a2a:	e8 31 5f 28 00       	call   0x140ad9960
   140853a2f:	90                   	nop
   140853a30:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853a34:	e8 17 be 81 ff       	call   0x14006f850
   140853a39:	e9 76 f7 ff ff       	jmp    0x1408531b4
   140853a3e:	0f 8e 99 00 00 00    	jle    0x140853add
   140853a44:	66 3b fe             	cmp    di,si
   140853a47:	7d 31                	jge    0x140853a7a
   140853a49:	48 8d 15 a8 31 df 00 	lea    rdx,[rip+0xdf31a8]        # 0x141646bf8
   140853a50:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853a54:	e8 f7 46 81 ff       	call   0x140068150
   140853a59:	90                   	nop
   140853a5a:	45 33 c9             	xor    r9d,r9d
   140853a5d:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853a61:	48 8d 0d 88 69 df 01 	lea    rcx,[rip+0x1df6988]        # 0x14264a3f0
   140853a68:	e8 f3 5e 28 00       	call   0x140ad9960
   140853a6d:	90                   	nop
   140853a6e:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853a72:	e8 d9 bd 81 ff       	call   0x14006f850
   140853a77:	66 3b fe             	cmp    di,si
   140853a7a:	7e 2e                	jle    0x140853aaa
   140853a7c:	48 8d 15 65 31 df 00 	lea    rdx,[rip+0xdf3165]        # 0x141646be8
   140853a83:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853a87:	e8 c4 46 81 ff       	call   0x140068150
   140853a8c:	90                   	nop
   140853a8d:	45 33 c9             	xor    r9d,r9d
   140853a90:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853a94:	48 8d 0d 55 69 df 01 	lea    rcx,[rip+0x1df6955]        # 0x14264a3f0
   140853a9b:	e8 c0 5e 28 00       	call   0x140ad9960
   140853aa0:	90                   	nop
   140853aa1:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853aa5:	e8 a6 bd 81 ff       	call   0x14006f850
   140853aaa:	66 3b fe             	cmp    di,si
   140853aad:	0f 85 39 ff ff ff    	jne    0x1408539ec
   140853ab3:	48 8d 15 42 7e de 00 	lea    rdx,[rip+0xde7e42]        # 0x14163b8fc
   140853aba:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853abe:	e8 8d 46 81 ff       	call   0x140068150
   140853ac3:	90                   	nop
   140853ac4:	45 33 c9             	xor    r9d,r9d
   140853ac7:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853acb:	48 8d 0d 1e 69 df 01 	lea    rcx,[rip+0x1df691e]        # 0x14264a3f0
   140853ad2:	e8 89 5e 28 00       	call   0x140ad9960
   140853ad7:	90                   	nop
   140853ad8:	e9 06 ff ff ff       	jmp    0x1408539e3
   140853add:	0f 85 09 ff ff ff    	jne    0x1408539ec
   140853ae3:	66 3b fe             	cmp    di,si
   140853ae6:	7d 31                	jge    0x140853b19
   140853ae8:	48 8d 15 05 7e de 00 	lea    rdx,[rip+0xde7e05]        # 0x14163b8f4
   140853aef:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853af3:	e8 58 46 81 ff       	call   0x140068150
   140853af8:	90                   	nop
   140853af9:	45 33 c9             	xor    r9d,r9d
   140853afc:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853b00:	48 8d 0d e9 68 df 01 	lea    rcx,[rip+0x1df68e9]        # 0x14264a3f0
   140853b07:	e8 54 5e 28 00       	call   0x140ad9960
   140853b0c:	90                   	nop
   140853b0d:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853b11:	e8 3a bd 81 ff       	call   0x14006f850
   140853b16:	66 3b fe             	cmp    di,si
   140853b19:	7e 2a                	jle    0x140853b45
   140853b1b:	48 8d 15 12 7d de 00 	lea    rdx,[rip+0xde7d12]        # 0x14163b834
   140853b22:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853b26:	e8 25 46 81 ff       	call   0x140068150
   140853b2b:	90                   	nop
   140853b2c:	45 33 c9             	xor    r9d,r9d
   140853b2f:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853b33:	48 8d 0d b6 68 df 01 	lea    rcx,[rip+0x1df68b6]        # 0x14264a3f0
   140853b3a:	e8 21 5e 28 00       	call   0x140ad9960
   140853b3f:	90                   	nop
   140853b40:	e9 9e fe ff ff       	jmp    0x1408539e3
   140853b45:	0f 85 a1 fe ff ff    	jne    0x1408539ec
   140853b4b:	66 41 3b de          	cmp    bx,r14w
   140853b4f:	7e 33                	jle    0x140853b84
   140853b51:	48 8d 15 2c db e5 00 	lea    rdx,[rip+0xe5db2c]        # 0x1416b1684
   140853b58:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853b5c:	e8 ef 45 81 ff       	call   0x140068150
   140853b61:	90                   	nop
   140853b62:	45 33 c9             	xor    r9d,r9d
   140853b65:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853b69:	48 8d 0d 80 68 df 01 	lea    rcx,[rip+0x1df6880]        # 0x14264a3f0
   140853b70:	e8 eb 5d 28 00       	call   0x140ad9960
   140853b75:	90                   	nop
   140853b76:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853b7a:	e8 d1 bc 81 ff       	call   0x14006f850
   140853b7f:	e9 30 f6 ff ff       	jmp    0x1408531b4
   140853b84:	0f 8d 2a f6 ff ff    	jge    0x1408531b4
   140853b8a:	48 8d 15 1f db e5 00 	lea    rdx,[rip+0xe5db1f]        # 0x1416b16b0
   140853b91:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853b95:	e8 b6 45 81 ff       	call   0x140068150
   140853b9a:	90                   	nop
   140853b9b:	45 33 c9             	xor    r9d,r9d
   140853b9e:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853ba2:	48 8d 0d 47 68 df 01 	lea    rcx,[rip+0x1df6847]        # 0x14264a3f0
   140853ba9:	e8 b2 5d 28 00       	call   0x140ad9960
   140853bae:	90                   	nop
   140853baf:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853bb3:	e8 98 bc 81 ff       	call   0x14006f850
   140853bb8:	e9 f7 f5 ff ff       	jmp    0x1408531b4
   140853bbd:	0f 8d f1 f5 ff ff    	jge    0x1408531b4
   140853bc3:	48 8d 15 c6 da e5 00 	lea    rdx,[rip+0xe5dac6]        # 0x1416b1690
   140853bca:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853bce:	e8 7d 45 81 ff       	call   0x140068150
   140853bd3:	90                   	nop
   140853bd4:	45 33 c9             	xor    r9d,r9d
   140853bd7:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853bdb:	48 8d 0d 0e 68 df 01 	lea    rcx,[rip+0x1df680e]        # 0x14264a3f0
   140853be2:	e8 79 5d 28 00       	call   0x140ad9960
   140853be7:	90                   	nop
   140853be8:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853bec:	e8 5f bc 81 ff       	call   0x14006f850
   140853bf1:	e9 be f5 ff ff       	jmp    0x1408531b4
   140853bf6:	c7 05 7c 68 df 01 03 	mov    DWORD PTR [rip+0x1df687c],0x1010003        # 0x14264a47c
   140853bfd:	00 01 01 
   140853c00:	0f 57 c0             	xorps  xmm0,xmm0
   140853c03:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853c07:	0f 57 c9             	xorps  xmm1,xmm1
   140853c0a:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853c0f:	b9 20 00 00 00       	mov    ecx,0x20
   140853c14:	e8 b7 cb 81 ff       	call   0x1400707d0
   140853c19:	48 89 45 c7          	mov    QWORD PTR [rbp-0x39],rax
   140853c1d:	66 0f 6f 05 9b 76 f3 	movdqa xmm0,XMMWORD PTR [rip+0xf3769b]        # 0x14178b2c0
   140853c24:	00 
   140853c25:	f3 0f 7f 45 d7       	movdqu XMMWORD PTR [rbp-0x29],xmm0
   140853c2a:	0f 10 05 1f d8 e5 00 	movups xmm0,XMMWORD PTR [rip+0xe5d81f]        # 0x1416b1450
   140853c31:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   140853c34:	f2 0f 10 05 24 d8 e5 	movsd  xmm0,QWORD PTR [rip+0xe5d824]        # 0x1416b1460
   140853c3b:	00 
   140853c3c:	f2 0f 11 40 10       	movsd  QWORD PTR [rax+0x10],xmm0
   140853c41:	0f b7 0d 20 d8 e5 00 	movzx  ecx,WORD PTR [rip+0xe5d820]        # 0x1416b1468
   140853c48:	66 89 48 18          	mov    WORD PTR [rax+0x18],cx
   140853c4c:	c6 40 1a 00          	mov    BYTE PTR [rax+0x1a],0x0
   140853c50:	44 8b 53 0c          	mov    r10d,DWORD PTR [rbx+0xc]
   140853c54:	41 83 fa ff          	cmp    r10d,0xffffffff
   140853c58:	0f 84 99 00 00 00    	je     0x140853cf7
   140853c5e:	4c 8b 05 f3 17 b9 01 	mov    r8,QWORD PTR [rip+0x1b917f3]        # 0x1423e5458
   140853c65:	4c 8b 1d e4 17 b9 01 	mov    r11,QWORD PTR [rip+0x1b917e4]        # 0x1423e5450
   140853c6c:	4d 2b c3             	sub    r8,r11
   140853c6f:	49 c1 f8 03          	sar    r8,0x3
   140853c73:	33 ff                	xor    edi,edi
   140853c75:	45 85 c0             	test   r8d,r8d
   140853c78:	74 2f                	je     0x140853ca9
   140853c7a:	8b d7                	mov    edx,edi
   140853c7c:	41 83 e8 01          	sub    r8d,0x1
   140853c80:	78 27                	js     0x140853ca9
   140853c82:	42 8d 0c 02          	lea    ecx,[rdx+r8*1]
   140853c86:	d1 f9                	sar    ecx,1
   140853c88:	48 63 c1             	movsxd rax,ecx
   140853c8b:	49 8b 1c c3          	mov    rbx,QWORD PTR [r11+rax*8]
   140853c8f:	44 39 53 1c          	cmp    DWORD PTR [rbx+0x1c],r10d
   140853c93:	74 17                	je     0x140853cac
   140853c95:	8d 41 01             	lea    eax,[rcx+0x1]
   140853c98:	0f 4e d0             	cmovle edx,eax
   140853c9b:	8d 41 ff             	lea    eax,[rcx-0x1]
   140853c9e:	41 0f 4e c0          	cmovle eax,r8d
   140853ca2:	44 8b c0             	mov    r8d,eax
   140853ca5:	3b d0                	cmp    edx,eax
   140853ca7:	7e d9                	jle    0x140853c82
   140853ca9:	48 8b df             	mov    rbx,rdi
   140853cac:	48 85 db             	test   rbx,rbx
   140853caf:	74 46                	je     0x140853cf7
   140853cb1:	48 8d 15 28 a9 d9 00 	lea    rdx,[rip+0xd9a928]        # 0x1415ee5e0
   140853cb8:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853cbc:	e8 9f b8 81 ff       	call   0x14006f560
   140853cc1:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853cc5:	e8 c6 b9 81 ff       	call   0x14006f690
   140853cca:	90                   	nop
   140853ccb:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140853cd1:	45 33 c0             	xor    r8d,r8d
   140853cd4:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853cd8:	48 8b cb             	mov    rcx,rbx
   140853cdb:	e8 70 17 41 00       	call   0x140c65450
   140853ce0:	48 8d 55 e7          	lea    rdx,[rbp-0x19]
   140853ce4:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853ce8:	e8 23 60 86 ff       	call   0x1400b9d10
   140853ced:	90                   	nop
   140853cee:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
   140853cf2:	e8 59 bb 81 ff       	call   0x14006f850
   140853cf7:	45 33 c9             	xor    r9d,r9d
   140853cfa:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853cfe:	48 8d 0d eb 66 df 01 	lea    rcx,[rip+0x1df66eb]        # 0x14264a3f0
   140853d05:	e8 56 5c 28 00       	call   0x140ad9960
   140853d0a:	90                   	nop
   140853d0b:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853d0f:	e8 3c bb 81 ff       	call   0x14006f850
   140853d14:	e9 9b f4 ff ff       	jmp    0x1408531b4
   140853d19:	c7 05 59 67 df 01 06 	mov    DWORD PTR [rip+0x1df6759],0x1000006        # 0x14264a47c
   140853d20:	00 00 01 
   140853d23:	0f 57 c0             	xorps  xmm0,xmm0
   140853d26:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853d2a:	66 0f 6f 0d 9e 74 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3749e]        # 0x14178b1d0
   140853d31:	00 
   140853d32:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853d37:	f2 0f 10 05 01 d7 e5 	movsd  xmm0,QWORD PTR [rip+0xe5d701]        # 0x1416b1440
   140853d3e:	00 
   140853d3f:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140853d44:	0f b7 05 fd d6 e5 00 	movzx  eax,WORD PTR [rip+0xe5d6fd]        # 0x1416b1448
   140853d4b:	66 89 45 cf          	mov    WORD PTR [rbp-0x31],ax
   140853d4f:	0f b6 05 f4 d6 e5 00 	movzx  eax,BYTE PTR [rip+0xe5d6f4]        # 0x1416b144a
   140853d56:	88 45 d1             	mov    BYTE PTR [rbp-0x2f],al
   140853d59:	c6 45 d2 00          	mov    BYTE PTR [rbp-0x2e],0x0
   140853d5d:	45 33 c9             	xor    r9d,r9d
   140853d60:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853d64:	48 8d 0d 85 66 df 01 	lea    rcx,[rip+0x1df6685]        # 0x14264a3f0
   140853d6b:	e8 f0 5b 28 00       	call   0x140ad9960
   140853d70:	90                   	nop
   140853d71:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853d75:	e8 d6 ba 81 ff       	call   0x14006f850
   140853d7a:	e9 35 f4 ff ff       	jmp    0x1408531b4
   140853d7f:	c7 05 f3 66 df 01 06 	mov    DWORD PTR [rip+0x1df66f3],0x1000006        # 0x14264a47c
   140853d86:	00 00 01 
   140853d89:	0f 57 c0             	xorps  xmm0,xmm0
   140853d8c:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853d90:	66 0f 6f 0d 28 74 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37428]        # 0x14178b1c0
   140853d97:	00 
   140853d98:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853d9d:	f2 0f 10 05 d3 d6 e5 	movsd  xmm0,QWORD PTR [rip+0xe5d6d3]        # 0x1416b1478
   140853da4:	00 
   140853da5:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140853daa:	0f b7 05 cf d6 e5 00 	movzx  eax,WORD PTR [rip+0xe5d6cf]        # 0x1416b1480
   140853db1:	66 89 45 cf          	mov    WORD PTR [rbp-0x31],ax
   140853db5:	c6 45 d1 00          	mov    BYTE PTR [rbp-0x2f],0x0
   140853db9:	45 33 c9             	xor    r9d,r9d
   140853dbc:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140853dc0:	48 8d 0d 29 66 df 01 	lea    rcx,[rip+0x1df6629]        # 0x14264a3f0
   140853dc7:	e8 94 5b 28 00       	call   0x140ad9960
   140853dcc:	90                   	nop
   140853dcd:	48 8d 4d c7          	lea    rcx,[rbp-0x39]
   140853dd1:	e8 7a ba 81 ff       	call   0x14006f850
   140853dd6:	e9 d9 f3 ff ff       	jmp    0x1408531b4
   140853ddb:	0f 57 c0             	xorps  xmm0,xmm0
   140853dde:	0f 11 45 07          	movups XMMWORD PTR [rbp+0x7],xmm0
   140853de2:	33 ff                	xor    edi,edi
   140853de4:	48 89 7d 17          	mov    QWORD PTR [rbp+0x17],rdi
   140853de8:	be 0f 00 00 00       	mov    esi,0xf
   140853ded:	48 89 75 1f          	mov    QWORD PTR [rbp+0x1f],rsi
   140853df1:	40 88 7d 07          	mov    BYTE PTR [rbp+0x7],dil
   140853df5:	44 8b 53 0c          	mov    r10d,DWORD PTR [rbx+0xc]
   140853df9:	4c 8b 05 58 16 b9 01 	mov    r8,QWORD PTR [rip+0x1b91658]        # 0x1423e5458
   140853e00:	4c 8b 1d 49 16 b9 01 	mov    r11,QWORD PTR [rip+0x1b91649]        # 0x1423e5450
   140853e07:	4d 2b c3             	sub    r8,r11
   140853e0a:	49 c1 f8 03          	sar    r8,0x3
   140853e0e:	45 85 c0             	test   r8d,r8d
   140853e11:	0f 84 7a 00 00 00    	je     0x140853e91
   140853e17:	41 83 fa ff          	cmp    r10d,0xffffffff
   140853e1b:	0f 84 70 00 00 00    	je     0x140853e91
   140853e21:	41 83 e8 01          	sub    r8d,0x1
   140853e25:	8b d7                	mov    edx,edi
   140853e27:	78 2e                	js     0x140853e57
   140853e29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140853e30:	42 8d 0c 02          	lea    ecx,[rdx+r8*1]
   140853e34:	d1 f9                	sar    ecx,1
   140853e36:	48 63 c1             	movsxd rax,ecx
   140853e39:	49 8b 1c c3          	mov    rbx,QWORD PTR [r11+rax*8]
   140853e3d:	44 39 53 1c          	cmp    DWORD PTR [rbx+0x1c],r10d
   140853e41:	74 17                	je     0x140853e5a
   140853e43:	8d 41 01             	lea    eax,[rcx+0x1]
   140853e46:	0f 4e d0             	cmovle edx,eax
   140853e49:	8d 41 ff             	lea    eax,[rcx-0x1]
   140853e4c:	41 0f 4e c0          	cmovle eax,r8d
   140853e50:	44 8b c0             	mov    r8d,eax
   140853e53:	3b d0                	cmp    edx,eax
   140853e55:	7e d9                	jle    0x140853e30
   140853e57:	48 8b df             	mov    rbx,rdi
   140853e5a:	48 85 db             	test   rbx,rbx
   140853e5d:	74 32                	je     0x140853e91
   140853e5f:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140853e62:	48 8b cb             	mov    rcx,rbx
   140853e65:	ff 10                	call   QWORD PTR [rax]
   140853e67:	66 83 f8 18          	cmp    ax,0x18
   140853e6b:	75 20                	jne    0x140853e8d
   140853e6d:	48 8b 83 e8 00 00 00 	mov    rax,QWORD PTR [rbx+0xe8]
   140853e74:	83 b8 cc 01 00 00 00 	cmp    DWORD PTR [rax+0x1cc],0x0
   140853e7b:	75 10                	jne    0x140853e8d
   140853e7d:	48 8d 15 ec d5 e5 00 	lea    rdx,[rip+0xe5d5ec]        # 0x1416b1470
   140853e84:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140853e88:	e8 f3 b6 81 ff       	call   0x14006f580
   140853e8d:	48 8b 75 1f          	mov    rsi,QWORD PTR [rbp+0x1f]
   140853e91:	48 83 7d 17 00       	cmp    QWORD PTR [rbp+0x17],0x0
   140853e96:	0f 85 dd 00 00 00    	jne    0x140853f79
   140853e9c:	48 83 fe 07          	cmp    rsi,0x7
   140853ea0:	72 33                	jb     0x140853ed5
   140853ea2:	48 8d 5d 07          	lea    rbx,[rbp+0x7]
   140853ea6:	48 83 fe 0f          	cmp    rsi,0xf
   140853eaa:	48 0f 47 5d 07       	cmova  rbx,QWORD PTR [rbp+0x7]
   140853eaf:	48 c7 45 17 07 00 00 	mov    QWORD PTR [rbp+0x17],0x7
   140853eb6:	00 
   140853eb7:	41 b8 07 00 00 00    	mov    r8d,0x7
   140853ebd:	48 8d 15 0c 7e dd 00 	lea    rdx,[rip+0xdd7e0c]        # 0x14162bcd0
   140853ec4:	48 8b cb             	mov    rcx,rbx
   140853ec7:	e8 4e 6f ce 00       	call   0x14153ae1a
   140853ecc:	c6 43 07 00          	mov    BYTE PTR [rbx+0x7],0x0
   140853ed0:	e9 a4 00 00 00       	jmp    0x140853f79
   140853ed5:	48 8b ce             	mov    rcx,rsi
   140853ed8:	48 d1 e9             	shr    rcx,1
   140853edb:	48 bb ff ff ff ff ff 	movabs rbx,0x7fffffffffffffff
   140853ee2:	ff ff 7f 
   140853ee5:	48 8b c3             	mov    rax,rbx
   140853ee8:	48 2b c1             	sub    rax,rcx
   140853eeb:	48 3b f0             	cmp    rsi,rax
   140853eee:	77 10                	ja     0x140853f00
   140853ef0:	48 8d 04 0e          	lea    rax,[rsi+rcx*1]
   140853ef4:	bb 0f 00 00 00       	mov    ebx,0xf
   140853ef9:	48 3b c3             	cmp    rax,rbx
   140853efc:	48 0f 47 d8          	cmova  rbx,rax
   140853f00:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   140853f04:	e8 c7 c8 81 ff       	call   0x1400707d0
   140853f09:	48 8b f8             	mov    rdi,rax
   140853f0c:	48 c7 45 17 07 00 00 	mov    QWORD PTR [rbp+0x17],0x7
   140853f13:	00 
   140853f14:	48 89 5d 1f          	mov    QWORD PTR [rbp+0x1f],rbx
   140853f18:	48 8b 0d b1 7d dd 00 	mov    rcx,QWORD PTR [rip+0xdd7db1]        # 0x14162bcd0
   140853f1f:	89 08                	mov    DWORD PTR [rax],ecx
   140853f21:	0f b7 0d ac 7d dd 00 	movzx  ecx,WORD PTR [rip+0xdd7dac]        # 0x14162bcd4
   140853f28:	66 89 48 04          	mov    WORD PTR [rax+0x4],cx
   140853f2c:	0f b6 0d a3 7d dd 00 	movzx  ecx,BYTE PTR [rip+0xdd7da3]        # 0x14162bcd6
   140853f33:	88 48 06             	mov    BYTE PTR [rax+0x6],cl
   140853f36:	c6 40 07 00          	mov    BYTE PTR [rax+0x7],0x0
   140853f3a:	48 83 fe 0f          	cmp    rsi,0xf
   140853f3e:	76 35                	jbe    0x140853f75
   140853f40:	48 8d 56 01          	lea    rdx,[rsi+0x1]
   140853f44:	48 8b 4d 07          	mov    rcx,QWORD PTR [rbp+0x7]
   140853f48:	48 8b c1             	mov    rax,rcx
   140853f4b:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140853f52:	72 1c                	jb     0x140853f70
   140853f54:	48 83 c2 27          	add    rdx,0x27
   140853f58:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   140853f5c:	48 2b c1             	sub    rax,rcx
   140853f5f:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   140853f63:	48 83 f8 1f          	cmp    rax,0x1f
   140853f67:	76 07                	jbe    0x140853f70
   140853f69:	ff 15 b9 1b d9 00    	call   QWORD PTR [rip+0xd91bb9]        # 0x1415e5b28
   140853f6f:	cc                   	int3
   140853f70:	e8 0b 57 ce 00       	call   0x141539680
   140853f75:	48 89 7d 07          	mov    QWORD PTR [rbp+0x7],rdi
   140853f79:	41 b8 05 00 00 00    	mov    r8d,0x5
   140853f7f:	48 8d 15 6e d1 e5 00 	lea    rdx,[rip+0xe5d16e]        # 0x1416b10f4
   140853f86:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140853f8a:	e8 81 ba 81 ff       	call   0x14006fa10
   140853f8f:	c7 05 e3 64 df 01 06 	mov    DWORD PTR [rip+0x1df64e3],0x1010006        # 0x14264a47c
   140853f96:	00 01 01 
   140853f99:	45 33 c9             	xor    r9d,r9d
   140853f9c:	48 8d 55 07          	lea    rdx,[rbp+0x7]
   140853fa0:	48 8d 0d 49 64 df 01 	lea    rcx,[rip+0x1df6449]        # 0x14264a3f0
   140853fa7:	e8 b4 59 28 00       	call   0x140ad9960
   140853fac:	90                   	nop
   140853fad:	48 8d 4d 07          	lea    rcx,[rbp+0x7]
   140853fb1:	e8 9a b8 81 ff       	call   0x14006f850
   140853fb6:	e9 f9 f1 ff ff       	jmp    0x1408531b4
   140853fbb:	c7 05 b7 64 df 01 04 	mov    DWORD PTR [rip+0x1df64b7],0x1010004        # 0x14264a47c
   140853fc2:	00 01 01 
   140853fc5:	0f 57 c0             	xorps  xmm0,xmm0
   140853fc8:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140853fcc:	66 0f 6f 0d 3c 72 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf3723c]        # 0x14178b210
   140853fd3:	00 
   140853fd4:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   140853fd9:	f2 0f 10 05 2f d4 e5 	movsd  xmm0,QWORD PTR [rip+0xe5d42f]        # 0x1416b1410
   140853fe0:	00 
   140853fe1:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   140853fe6:	8b 05 2c d4 e5 00    	mov    eax,DWORD PTR [rip+0xe5d42c]        # 0x1416b1418
   140853fec:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140853fef:	0f b7 05 26 d4 e5 00 	movzx  eax,WORD PTR [rip+0xe5d426]        # 0x1416b141c
   140853ff6:	66 89 45 d3          	mov    WORD PTR [rbp-0x2d],ax
   140853ffa:	0f b6 05 1d d4 e5 00 	movzx  eax,BYTE PTR [rip+0xe5d41d]        # 0x1416b141e
   140854001:	88 45 d5             	mov    BYTE PTR [rbp-0x2b],al
   140854004:	c6 45 d6 00          	mov    BYTE PTR [rbp-0x2a],0x0
   140854008:	45 33 c9             	xor    r9d,r9d
   14085400b:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   14085400f:	48 8d 0d da 63 df 01 	lea    rcx,[rip+0x1df63da]        # 0x14264a3f0
   140854016:	e8 45 59 28 00       	call   0x140ad9960
   14085401b:	90                   	nop
   14085401c:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   140854020:	48 83 fa 0f          	cmp    rdx,0xf
   140854024:	0f 86 8a f1 ff ff    	jbe    0x1408531b4
   14085402a:	48 ff c2             	inc    rdx
   14085402d:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   140854031:	48 8b c1             	mov    rax,rcx
   140854034:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14085403b:	0f 82 6e f1 ff ff    	jb     0x1408531af
   140854041:	48 83 c2 27          	add    rdx,0x27
   140854045:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   140854049:	48 2b c1             	sub    rax,rcx
   14085404c:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   140854050:	48 83 f8 1f          	cmp    rax,0x1f
   140854054:	0f 87 99 00 00 00    	ja     0x1408540f3
   14085405a:	e9 50 f1 ff ff       	jmp    0x1408531af
   14085405f:	c7 05 13 64 df 01 04 	mov    DWORD PTR [rip+0x1df6413],0x1010004        # 0x14264a47c
   140854066:	00 01 01 
   140854069:	0f 57 c0             	xorps  xmm0,xmm0
   14085406c:	0f 11 45 c7          	movups XMMWORD PTR [rbp-0x39],xmm0
   140854070:	66 0f 6f 0d 78 71 f3 	movdqa xmm1,XMMWORD PTR [rip+0xf37178]        # 0x14178b1f0
   140854077:	00 
   140854078:	f3 0f 7f 4d d7       	movdqu XMMWORD PTR [rbp-0x29],xmm1
   14085407d:	f2 0f 10 05 7b d3 e5 	movsd  xmm0,QWORD PTR [rip+0xe5d37b]        # 0x1416b1400
   140854084:	00 
   140854085:	f2 0f 11 45 c7       	movsd  QWORD PTR [rbp-0x39],xmm0
   14085408a:	8b 05 78 d3 e5 00    	mov    eax,DWORD PTR [rip+0xe5d378]        # 0x1416b1408
   140854090:	89 45 cf             	mov    DWORD PTR [rbp-0x31],eax
   140854093:	0f b6 05 72 d3 e5 00 	movzx  eax,BYTE PTR [rip+0xe5d372]        # 0x1416b140c
   14085409a:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
   14085409d:	c6 45 d4 00          	mov    BYTE PTR [rbp-0x2c],0x0
   1408540a1:	45 33 c9             	xor    r9d,r9d
   1408540a4:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   1408540a8:	48 8d 0d 41 63 df 01 	lea    rcx,[rip+0x1df6341]        # 0x14264a3f0
   1408540af:	e8 ac 58 28 00       	call   0x140ad9960
   1408540b4:	90                   	nop
   1408540b5:	48 8b 55 df          	mov    rdx,QWORD PTR [rbp-0x21]
   1408540b9:	48 83 fa 0f          	cmp    rdx,0xf
   1408540bd:	0f 86 f1 f0 ff ff    	jbe    0x1408531b4
   1408540c3:	48 ff c2             	inc    rdx
   1408540c6:	48 8b 4d c7          	mov    rcx,QWORD PTR [rbp-0x39]
   1408540ca:	48 8b c1             	mov    rax,rcx
   1408540cd:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1408540d4:	0f 82 d5 f0 ff ff    	jb     0x1408531af
   1408540da:	48 83 c2 27          	add    rdx,0x27
   1408540de:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1408540e2:	48 2b c1             	sub    rax,rcx
   1408540e5:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1408540e9:	48 83 f8 1f          	cmp    rax,0x1f
   1408540ed:	0f 86 bc f0 ff ff    	jbe    0x1408531af
   1408540f3:	ff 15 2f 1a d9 00    	call   QWORD PTR [rip+0xd91a2f]        # 0x1415e5b28
   1408540f9:	cc                   	int3
   1408540fa:	66 90                	xchg   ax,ax
   1408540fc:	91                   	xchg   ecx,eax
   1408540fd:	26 85 00             	es test DWORD PTR [rax],eax
   140854100:	5e                   	pop    rsi
   140854101:	2b 85 00 24 31 85    	sub    eax,DWORD PTR [rbp-0x7acedc00]
   140854107:	00 38                	add    BYTE PTR [rax],bh
   140854109:	32 85 00 a7 32 85    	xor    al,BYTE PTR [rbp-0x7acd5900]
   14085410f:	00 42 36             	add    BYTE PTR [rdx+0x36],al
   140854112:	85 00                	test   DWORD PTR [rax],eax
   140854114:	f8                   	clc
   140854115:	36 85 00             	ss test DWORD PTR [rax],eax
   140854118:	92                   	xchg   edx,eax
   140854119:	37                   	(bad)
   14085411a:	85 00                	test   DWORD PTR [rax],eax
   14085411c:	e5 35                	in     eax,0x35
   14085411e:	85 00                	test   DWORD PTR [rax],eax
   140854120:	f5                   	cmc
   140854121:	37                   	(bad)
   140854122:	85 00                	test   DWORD PTR [rax],eax
   140854124:	47 38 85 00 99 38 85 	rex.RXB cmp BYTE PTR [r13-0x7ac76700],r8b
   14085412b:	00 f6                	add    dh,dh
   14085412d:	3b 85 00 19 3d 85    	cmp    eax,DWORD PTR [rbp-0x7ac2e700]
   140854133:	00 7f 3d             	add    BYTE PTR [rdi+0x3d],bh
   140854136:	85 00                	test   DWORD PTR [rax],eax
   140854138:	f8                   	clc
   140854139:	36 85 00             	ss test DWORD PTR [rax],eax
   14085413c:	dc 31                	fdiv   QWORD PTR [rcx]
   14085413e:	85 00                	test   DWORD PTR [rax],eax
   140854140:	94                   	xchg   esp,eax
   140854141:	36 85 00             	ss test DWORD PTR [rax],eax
   140854144:	a8 34                	test   al,0x34
   140854146:	85 00                	test   DWORD PTR [rax],eax
   140854148:	02 35 85 00 1a 33    	add    dh,BYTE PTR [rip+0x331a0085]        # 0x1739f41d3
   14085414e:	85 00                	test   DWORD PTR [rax],eax
   140854150:	6c                   	ins    BYTE PTR [rdi],dx
   140854151:	33 85 00 d2 33 85    	xor    eax,DWORD PTR [rbp-0x7acc2e00]
   140854157:	00 37                	add    BYTE PTR [rdi],dh
   140854159:	34 85                	xor    al,0x85
   14085415b:	00 db                	add    bl,bl
   14085415d:	3d 85 00 bb 3f       	cmp    eax,0x3fbb0085
   140854162:	85 00                	test   DWORD PTR [rax],eax
   140854164:	5f                   	pop    rdi
   140854165:	40 85 00             	rex test DWORD PTR [rax],eax
   140854168:	72 35                	jb     0x14085419f
   14085416a:	85 00                	test   DWORD PTR [rax],eax
