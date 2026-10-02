
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

00000001408705f0 <.text+0x86f5f0>:
   1408705f0:	42 8d 04 02          	lea    eax,[rdx+r8*1]
   1408705f4:	4c 8b d1             	mov    r10,rcx
   1408705f7:	99                   	cdq
   1408705f8:	2b c2                	sub    eax,edx
   1408705fa:	d1 f8                	sar    eax,1
   1408705fc:	8d 50 ce             	lea    edx,[rax-0x32]
   1408705ff:	41 89 11             	mov    DWORD PTR [r9],edx
   140870602:	8d 50 32             	lea    edx,[rax+0x32]
   140870605:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   14087060a:	4c 8b 4c 24 30       	mov    r9,QWORD PTR [rsp+0x30]
   14087060f:	89 10                	mov    DWORD PTR [rax],edx
   140870611:	ba 27 00 00 00       	mov    edx,0x27
   140870616:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
   14087061b:	41 c7 01 06 00 00 00 	mov    DWORD PTR [r9],0x6
   140870622:	44 8b 05 4f 70 b5 01 	mov    r8d,DWORD PTR [rip+0x1b5704f]        # 0x1423c7678
   140870629:	41 83 c0 fb          	add    r8d,0xfffffffb
   14087062d:	44 89 00             	mov    DWORD PTR [rax],r8d
   140870630:	48 63 41 04          	movsxd rax,DWORD PTR [rcx+0x4]
   140870634:	83 f8 09             	cmp    eax,0x9
   140870637:	0f 87 07 01 00 00    	ja     0x140870744
   14087063d:	4c 8d 1d bc f9 78 ff 	lea    r11,[rip+0xffffffffff78f9bc]        # 0x140000000
   140870644:	41 8b 8c 83 5c 07 87 	mov    ecx,DWORD PTR [r11+rax*4+0x87075c]
   14087064b:	00 
   14087064c:	49 03 cb             	add    rcx,r11
   14087064f:	ff e1                	jmp    rcx
   140870651:	49 8b 42 18          	mov    rax,QWORD PTR [r10+0x18]
   140870655:	49 2b 42 10          	sub    rax,QWORD PTR [r10+0x10]
   140870659:	48 c1 f8 03          	sar    rax,0x3
   14087065d:	8d 04 c5 06 00 00 00 	lea    eax,[rax*8+0x6]
   140870664:	3b c2                	cmp    eax,edx
   140870666:	0f 8d d8 00 00 00    	jge    0x140870744
   14087066c:	8b d0                	mov    edx,eax
   14087066e:	e9 d1 00 00 00       	jmp    0x140870744
   140870673:	ba 07 00 00 00       	mov    edx,0x7
   140870678:	e9 c7 00 00 00       	jmp    0x140870744
   14087067d:	49 8b 82 e0 00 00 00 	mov    rax,QWORD PTR [r10+0xe0]
   140870684:	49 2b 82 d8 00 00 00 	sub    rax,QWORD PTR [r10+0xd8]
   14087068b:	48 c1 f8 02          	sar    rax,0x2
   14087068f:	83 c0 06             	add    eax,0x6
   140870692:	8d 0c 40             	lea    ecx,[rax+rax*2]
   140870695:	3b ca                	cmp    ecx,edx
   140870697:	0f 8d a7 00 00 00    	jge    0x140870744
   14087069d:	8b d1                	mov    edx,ecx
   14087069f:	e9 a0 00 00 00       	jmp    0x140870744
   1408706a4:	49 8b 42 48          	mov    rax,QWORD PTR [r10+0x48]
   1408706a8:	49 2b 42 40          	sub    rax,QWORD PTR [r10+0x40]
   1408706ac:	48 c1 f8 03          	sar    rax,0x3
   1408706b0:	eb dd                	jmp    0x14087068f
   1408706b2:	49 8b 42 78          	mov    rax,QWORD PTR [r10+0x78]
   1408706b6:	49 2b 42 70          	sub    rax,QWORD PTR [r10+0x70]
   1408706ba:	48 c1 f8 03          	sar    rax,0x3
   1408706be:	eb cf                	jmp    0x14087068f
   1408706c0:	49 8b 82 b0 00 00 00 	mov    rax,QWORD PTR [r10+0xb0]
   1408706c7:	49 2b 82 a8 00 00 00 	sub    rax,QWORD PTR [r10+0xa8]
   1408706ce:	48 d1 f8             	sar    rax,1
   1408706d1:	eb bc                	jmp    0x14087068f
   1408706d3:	8b 05 4f a3 dc 01    	mov    eax,DWORD PTR [rip+0x1dca34f]        # 0x14263aa28
   1408706d9:	83 c0 02             	add    eax,0x2
   1408706dc:	eb b4                	jmp    0x140870692
   1408706de:	49 8b 82 08 01 00 00 	mov    rax,QWORD PTR [r10+0x108]
   1408706e5:	49 2b 82 00 01 00 00 	sub    rax,QWORD PTR [r10+0x100]
   1408706ec:	48 c1 f8 03          	sar    rax,0x3
   1408706f0:	83 c0 08             	add    eax,0x8
   1408706f3:	eb 9d                	jmp    0x140870692
   1408706f5:	49 8b 8a 48 01 00 00 	mov    rcx,QWORD PTR [r10+0x148]
   1408706fc:	49 2b 8a 40 01 00 00 	sub    rcx,QWORD PTR [r10+0x140]
   140870703:	49 8b 82 30 01 00 00 	mov    rax,QWORD PTR [r10+0x130]
   14087070a:	49 2b 82 28 01 00 00 	sub    rax,QWORD PTR [r10+0x128]
   140870711:	48 c1 f8 03          	sar    rax,0x3
   140870715:	48 c1 f9 03          	sar    rcx,0x3
   140870719:	03 c8                	add    ecx,eax
   14087071b:	b8 05 00 00 00       	mov    eax,0x5
   140870720:	3b c8                	cmp    ecx,eax
   140870722:	0f 4f c8             	cmovg  ecx,eax
   140870725:	49 8b 82 70 01 00 00 	mov    rax,QWORD PTR [r10+0x170]
   14087072c:	49 2b 82 68 01 00 00 	sub    rax,QWORD PTR [r10+0x168]
   140870733:	48 c1 f8 02          	sar    rax,0x2
   140870737:	03 c1                	add    eax,ecx
   140870739:	8d 04 40             	lea    eax,[rax+rax*2]
   14087073c:	83 c0 07             	add    eax,0x7
   14087073f:	3b c2                	cmp    eax,edx
   140870741:	0f 4c d0             	cmovl  edx,eax
   140870744:	41 8b c0             	mov    eax,r8d
   140870747:	41 2b 01             	sub    eax,DWORD PTR [r9]
   14087074a:	ff c0                	inc    eax
   14087074c:	3b c2                	cmp    eax,edx
   14087074e:	7e 09                	jle    0x140870759
   140870750:	44 2b c2             	sub    r8d,edx
   140870753:	41 ff c0             	inc    r8d
   140870756:	45 89 01             	mov    DWORD PTR [r9],r8d
   140870759:	c3                   	ret
   14087075a:	66 90                	xchg   ax,ax
   14087075c:	51                   	push   rcx
   14087075d:	06                   	(bad)
   14087075e:	87 00                	xchg   DWORD PTR [rax],eax
   140870760:	73 06                	jae    0x140870768
   140870762:	87 00                	xchg   DWORD PTR [rax],eax
   140870764:	7d 06                	jge    0x14087076c
   140870766:	87 00                	xchg   DWORD PTR [rax],eax
   140870768:	d3 06                	rol    DWORD PTR [rsi],cl
   14087076a:	87 00                	xchg   DWORD PTR [rax],eax
   14087076c:	de 06                	fiadd  WORD PTR [rsi]
   14087076e:	87 00                	xchg   DWORD PTR [rax],eax
   140870770:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   140870771:	06                   	(bad)
   140870772:	87 00                	xchg   DWORD PTR [rax],eax
   140870774:	b2 06                	mov    dl,0x6
   140870776:	87 00                	xchg   DWORD PTR [rax],eax
   140870778:	c0 06 87             	rol    BYTE PTR [rsi],0x87
   14087077b:	00 f5                	add    ch,dh
   14087077d:	06                   	(bad)
   14087077e:	87 00                	xchg   DWORD PTR [rax],eax
   140870780:	f5                   	cmc
   140870781:	06                   	(bad)
   140870782:	87 00                	xchg   DWORD PTR [rax],eax
   140870784:	cc                   	int3
   140870785:	cc                   	int3
   140870786:	cc                   	int3
   140870787:	cc                   	int3
   140870788:	cc                   	int3
   140870789:	cc                   	int3
   14087078a:	cc                   	int3
   14087078b:	cc                   	int3
   14087078c:	cc                   	int3
   14087078d:	cc                   	int3
   14087078e:	cc                   	int3
   14087078f:	cc                   	int3
