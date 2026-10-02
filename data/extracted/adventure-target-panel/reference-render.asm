
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140878600 <.text+0x877600>:
   140878600:	40 55                	rex push rbp
   140878602:	53                   	push   rbx
   140878603:	56                   	push   rsi
   140878604:	57                   	push   rdi
   140878605:	41 54                	push   r12
   140878607:	41 55                	push   r13
   140878609:	41 56                	push   r14
   14087860b:	41 57                	push   r15
   14087860d:	48 8d ac 24 58 ff ff ff 	lea    rbp,[rsp-0xa8]
   140878615:	48 81 ec a8 01 00 00 	sub    rsp,0x1a8
   14087861c:	48 8b 05 1d 3a 02 01 	mov    rax,QWORD PTR [rip+0x1023a1d]        # 0x14189c040
   140878623:	48 33 c4             	xor    rax,rsp
   140878626:	48 89 85 98 00 00 00 	mov    QWORD PTR [rbp+0x98],rax
   14087862d:	41 8b f9             	mov    edi,r9d
   140878630:	41 8b d8             	mov    ebx,r8d
   140878633:	89 54 24 78          	mov    DWORD PTR [rsp+0x78],edx
   140878637:	4c 8b e9             	mov    r13,rcx
   14087863a:	48 89 4c 24 70       	mov    QWORD PTR [rsp+0x70],rcx
   14087863f:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140878644:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
   140878647:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
   14087864a:	48 8d 05 9f 1d dd 01 	lea    rax,[rip+0x1dd1d9f]        # 0x14264a3f0
   140878651:	80 3d 7d 7f b1 01 00 	cmp    BYTE PTR [rip+0x1b17f7d],0x0        # 0x1423905d5
   140878658:	74 10                	je     0x14087866a
   14087865a:	4c 8d 45 b4          	lea    r8,[rbp-0x4c]
   14087865e:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   140878662:	48 8b c8             	mov    rcx,rax
   140878665:	e8 d6 2c 84 ff       	call   0x1400bb340
   14087866a:	48 8d 45 b0          	lea    rax,[rbp-0x50]
   14087866e:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140878673:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   140878677:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   14087867c:	48 8d 45 90          	lea    rax,[rbp-0x70]
   140878680:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140878685:	4c 8d 4c 24 68       	lea    r9,[rsp+0x68]
   14087868a:	44 8b c7             	mov    r8d,edi
   14087868d:	8b d3                	mov    edx,ebx
   14087868f:	49 8b cd             	mov    rcx,r13
   140878692:	e8 d9 a6 ff ff       	call   0x140872d70
   140878697:	44 8b 74 24 68       	mov    r14d,DWORD PTR [rsp+0x68]
   14087869c:	8b 7d 90             	mov    edi,DWORD PTR [rbp-0x70]
   14087869f:	44 8b 65 d0          	mov    r12d,DWORD PTR [rbp-0x30]
   1408786a3:	44 8b 7d b0          	mov    r15d,DWORD PTR [rbp-0x50]
   1408786a7:	45 3b e7             	cmp    r12d,r15d
   1408786aa:	0f 8f ca 00 00 00    	jg     0x14087877a
   1408786b0:	41 8b f4             	mov    esi,r12d
   1408786b3:	41 8b de             	mov    ebx,r14d
   1408786b6:	44 3b f7             	cmp    r14d,edi
   1408786b9:	0f 8f b0 00 00 00    	jg     0x14087876f
   1408786bf:	90                   	nop
   1408786c0:	44 8b c3             	mov    r8d,ebx
   1408786c3:	8b d6                	mov    edx,esi
   1408786c5:	48 8d 0d 24 1d dd 01 	lea    rcx,[rip+0x1dd1d24]        # 0x14264a3f0
   1408786cc:	e8 4f 2a 84 ff       	call   0x1400bb120
   1408786d1:	45 33 c0             	xor    r8d,r8d
   1408786d4:	33 d2                	xor    edx,edx
   1408786d6:	48 8d 0d 13 1d dd 01 	lea    rcx,[rip+0x1dd1d13]        # 0x14264a3f0
   1408786dd:	e8 ae 2a 84 ff       	call   0x1400bb190
   1408786e2:	41 3b f4             	cmp    esi,r12d
   1408786e5:	75 28                	jne    0x14087870f
   1408786e7:	41 3b de             	cmp    ebx,r14d
   1408786ea:	75 08                	jne    0x1408786f4
   1408786ec:	8b 15 22 36 dd 01    	mov    edx,DWORD PTR [rip+0x1dd3622]        # 0x14264bd14
   1408786f2:	eb 65                	jmp    0x140878759
   1408786f4:	48 8d 0d f5 1c dd 01 	lea    rcx,[rip+0x1dd1cf5]        # 0x14264a3f0
   1408786fb:	3b df                	cmp    ebx,edi
   1408786fd:	75 08                	jne    0x140878707
   1408786ff:	8b 15 27 36 dd 01    	mov    edx,DWORD PTR [rip+0x1dd3627]        # 0x14264bd2c
   140878705:	eb 59                	jmp    0x140878760
   140878707:	8b 15 13 36 dd 01    	mov    edx,DWORD PTR [rip+0x1dd3613]        # 0x14264bd20
   14087870d:	eb 51                	jmp    0x140878760
   14087870f:	41 3b f7             	cmp    esi,r15d
   140878712:	75 28                	jne    0x14087873c
   140878714:	41 3b de             	cmp    ebx,r14d
   140878717:	75 08                	jne    0x140878721
   140878719:	8b 15 fd 35 dd 01    	mov    edx,DWORD PTR [rip+0x1dd35fd]        # 0x14264bd1c
   14087871f:	eb 38                	jmp    0x140878759
   140878721:	48 8d 0d c8 1c dd 01 	lea    rcx,[rip+0x1dd1cc8]        # 0x14264a3f0
   140878728:	3b df                	cmp    ebx,edi
   14087872a:	75 08                	jne    0x140878734
   14087872c:	8b 15 02 36 dd 01    	mov    edx,DWORD PTR [rip+0x1dd3602]        # 0x14264bd34
   140878732:	eb 2c                	jmp    0x140878760
   140878734:	8b 15 ee 35 dd 01    	mov    edx,DWORD PTR [rip+0x1dd35ee]        # 0x14264bd28
   14087873a:	eb 24                	jmp    0x140878760
   14087873c:	41 3b de             	cmp    ebx,r14d
   14087873f:	75 08                	jne    0x140878749
   140878741:	8b 15 d1 35 dd 01    	mov    edx,DWORD PTR [rip+0x1dd35d1]        # 0x14264bd18
   140878747:	eb 10                	jmp    0x140878759
   140878749:	3b df                	cmp    ebx,edi
   14087874b:	8b 15 df 35 dd 01    	mov    edx,DWORD PTR [rip+0x1dd35df]        # 0x14264bd30
   140878751:	74 06                	je     0x140878759
   140878753:	8b 15 cb 35 dd 01    	mov    edx,DWORD PTR [rip+0x1dd35cb]        # 0x14264bd24
   140878759:	48 8d 0d 90 1c dd 01 	lea    rcx,[rip+0x1dd1c90]        # 0x14264a3f0
   140878760:	e8 6b 23 26 00       	call   0x140adaad0
   140878765:	ff c3                	inc    ebx
   140878767:	3b df                	cmp    ebx,edi
   140878769:	0f 8e 51 ff ff ff    	jle    0x1408786c0
   14087876f:	ff c6                	inc    esi
   140878771:	41 3b f7             	cmp    esi,r15d
   140878774:	0f 8e 39 ff ff ff    	jle    0x1408786b3
   14087877a:	4c 8d 3d 6f 1c dd 01 	lea    r15,[rip+0x1dd1c6f]        # 0x14264a3f0
   140878781:	41 83 7d 04 01       	cmp    DWORD PTR [r13+0x4],0x1
   140878786:	0f 84 bf 00 00 00    	je     0x14087884b
   14087878c:	33 f6                	xor    esi,esi
   14087878e:	4c 8d 25 83 c4 dd 01 	lea    r12,[rip+0x1ddc483]        # 0x142654c18
   140878795:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   1408787a0:	33 ff                	xor    edi,edi
   1408787a2:	44 8d 76 f8          	lea    r14d,[rsi-0x8]
   1408787a6:	48 8d 1d 5f c4 dd 01 	lea    rbx,[rip+0x1ddc45f]        # 0x142654c0c
   1408787ad:	0f 1f 00             	nop    DWORD PTR [rax]
   1408787b0:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   1408787b4:	45 03 c6             	add    r8d,r14d
   1408787b7:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
   1408787ba:	ff c2                	inc    edx
   1408787bc:	03 d7                	add    edx,edi
   1408787be:	49 8b cf             	mov    rcx,r15
   1408787c1:	e8 5a 29 84 ff       	call   0x1400bb120
   1408787c6:	85 f6                	test   esi,esi
   1408787c8:	75 05                	jne    0x1408787cf
   1408787ca:	8b 53 e8             	mov    edx,DWORD PTR [rbx-0x18]
   1408787cd:	eb 0c                	jmp    0x1408787db
   1408787cf:	83 fe 07             	cmp    esi,0x7
   1408787d2:	75 04                	jne    0x1408787d8
   1408787d4:	8b 13                	mov    edx,DWORD PTR [rbx]
   1408787d6:	eb 03                	jmp    0x1408787db
   1408787d8:	8b 53 f4             	mov    edx,DWORD PTR [rbx-0xc]
   1408787db:	49 8b cf             	mov    rcx,r15
   1408787de:	e8 ed 22 26 00       	call   0x140adaad0
   1408787e3:	ff c7                	inc    edi
   1408787e5:	48 83 c3 04          	add    rbx,0x4
   1408787e9:	49 3b dc             	cmp    rbx,r12
   1408787ec:	7c c2                	jl     0x1408787b0
   1408787ee:	ff c6                	inc    esi
   1408787f0:	83 fe 08             	cmp    esi,0x8
   1408787f3:	7c ab                	jl     0x1408787a0
   1408787f5:	45 33 c0             	xor    r8d,r8d
   1408787f8:	ba 07 00 00 00       	mov    edx,0x7
   1408787fd:	41 b1 01             	mov    r9b,0x1
   140878800:	49 8b cf             	mov    rcx,r15
   140878803:	e8 28 29 84 ff       	call   0x1400bb130
   140878808:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   14087880c:	41 83 c0 fa          	add    r8d,0xfffffffa
   140878810:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
   140878813:	83 c2 02             	add    edx,0x2
   140878816:	49 8b cf             	mov    rcx,r15
   140878819:	e8 02 29 84 ff       	call   0x1400bb120
   14087881e:	48 8d 15 9b bc d8 00 	lea    rdx,[rip+0xd8bc9b]        # 0x1416044c0
   140878825:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878829:	e8 22 f9 7e ff       	call   0x140068150
   14087882e:	90                   	nop
   14087882f:	45 33 c9             	xor    r9d,r9d
   140878832:	45 33 c0             	xor    r8d,r8d
   140878835:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878839:	49 8b cf             	mov    rcx,r15
   14087883c:	e8 1f 11 26 00       	call   0x140ad9960
   140878841:	90                   	nop
   140878842:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878846:	e8 e5 f5 7e ff       	call   0x140067e30
   14087884b:	8b 7d d0             	mov    edi,DWORD PTR [rbp-0x30]
   14087884e:	83 c7 02             	add    edi,0x2
   140878851:	45 33 c0             	xor    r8d,r8d
   140878854:	ba 07 00 00 00       	mov    edx,0x7
   140878859:	41 b1 01             	mov    r9b,0x1
   14087885c:	49 8b cf             	mov    rcx,r15
   14087885f:	e8 cc 28 84 ff       	call   0x1400bb130
   140878864:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   140878869:	41 83 c0 02          	add    r8d,0x2
   14087886d:	8b d7                	mov    edx,edi
   14087886f:	49 8b cf             	mov    rcx,r15
   140878872:	e8 a9 28 84 ff       	call   0x1400bb120
   140878877:	49 63 45 04          	movsxd rax,DWORD PTR [r13+0x4]
   14087887b:	bb 01 00 00 00       	mov    ebx,0x1
   140878880:	4c 8d 05 79 77 78 ff 	lea    r8,[rip+0xffffffffff787779]        # 0x140000000
   140878887:	83 f8 09             	cmp    eax,0x9
   14087888a:	0f 87 91 03 00 00    	ja     0x140878c21
   140878890:	41 8b 8c 80 44 00 88 00 	mov    ecx,DWORD PTR [r8+rax*4+0x880044]
   140878898:	49 03 c8             	add    rcx,r8
   14087889b:	ff e1                	jmp    rcx
   14087889d:	41 80 bd 1d 03 00 00 00 	cmp    BYTE PTR [r13+0x31d],0x0
   1408788a5:	74 37                	je     0x1408788de
   1408788a7:	41 80 bd 1c 03 00 00 00 	cmp    BYTE PTR [r13+0x31c],0x0
   1408788af:	75 2d                	jne    0x1408788de
   1408788b1:	48 8d 15 50 b0 e3 00 	lea    rdx,[rip+0xe3b050]        # 0x1416b3908
   1408788b8:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408788bc:	e8 8f f8 7e ff       	call   0x140068150
   1408788c1:	90                   	nop
   1408788c2:	45 33 c9             	xor    r9d,r9d
   1408788c5:	45 33 c0             	xor    r8d,r8d
   1408788c8:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408788cc:	49 8b cf             	mov    rcx,r15
   1408788cf:	e8 8c 10 26 00       	call   0x140ad9960
   1408788d4:	90                   	nop
   1408788d5:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408788d9:	e9 37 03 00 00       	jmp    0x140878c15
   1408788de:	48 8d 15 0b b0 e3 00 	lea    rdx,[rip+0xe3b00b]        # 0x1416b38f0
   1408788e5:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408788e9:	e8 62 f8 7e ff       	call   0x140068150
   1408788ee:	90                   	nop
   1408788ef:	45 33 c9             	xor    r9d,r9d
   1408788f2:	45 33 c0             	xor    r8d,r8d
   1408788f5:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408788f9:	49 8b cf             	mov    rcx,r15
   1408788fc:	e8 5f 10 26 00       	call   0x140ad9960
   140878901:	90                   	nop
   140878902:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878906:	e9 0a 03 00 00       	jmp    0x140878c15
   14087890b:	4d 8b 45 30          	mov    r8,QWORD PTR [r13+0x30]
   14087890f:	41 f7 80 18 01 00 00 00 00 40 00 	test   DWORD PTR [r8+0x118],0x400000
   14087891a:	74 6b                	je     0x140878987
   14087891c:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878920:	e8 6b 6d 7f ff       	call   0x14006f690
   140878925:	90                   	nop
   140878926:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   14087892b:	41 b1 01             	mov    r9b,0x1
   14087892e:	44 8b c3             	mov    r8d,ebx
   140878931:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878935:	49 8b 4d 30          	mov    rcx,QWORD PTR [r13+0x30]
   140878939:	e8 f2 5a ab 00       	call   0x14132e430
   14087893e:	45 33 c9             	xor    r9d,r9d
   140878941:	41 b0 03             	mov    r8b,0x3
   140878944:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878948:	49 8b cf             	mov    rcx,r15
   14087894b:	e8 10 10 26 00       	call   0x140ad9960
   140878950:	48 8d 15 69 b0 e3 00 	lea    rdx,[rip+0xe3b069]        # 0x1416b39c0
   140878957:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087895b:	e8 f0 f7 7e ff       	call   0x140068150
   140878960:	90                   	nop
   140878961:	45 33 c9             	xor    r9d,r9d
   140878964:	45 33 c0             	xor    r8d,r8d
   140878967:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087896b:	49 8b cf             	mov    rcx,r15
   14087896e:	e8 ed 0f 26 00       	call   0x140ad9960
   140878973:	90                   	nop
   140878974:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878978:	e8 b3 f4 7e ff       	call   0x140067e30
   14087897d:	90                   	nop
   14087897e:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878982:	e9 8e 02 00 00       	jmp    0x140878c15
   140878987:	48 8b 15 82 c7 b6 01 	mov    rdx,QWORD PTR [rip+0x1b6c782]        # 0x1423e5110
   14087898e:	48 8d 0d 5b 8b b5 01 	lea    rcx,[rip+0x1b58b5b]        # 0x1423d14f0
   140878995:	e8 76 a6 c6 00       	call   0x1414e3010
   14087899a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087899e:	83 f8 ff             	cmp    eax,0xffffffff
   1408789a1:	0f 85 94 00 00 00    	jne    0x140878a3b
   1408789a7:	48 8d 15 f2 af e3 00 	lea    rdx,[rip+0xe3aff2]        # 0x1416b39a0
   1408789ae:	e8 9d f7 7e ff       	call   0x140068150
   1408789b3:	90                   	nop
   1408789b4:	45 33 c9             	xor    r9d,r9d
   1408789b7:	41 b0 03             	mov    r8b,0x3
   1408789ba:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408789be:	49 8b cf             	mov    rcx,r15
   1408789c1:	e8 9a 0f 26 00       	call   0x140ad9960
   1408789c6:	90                   	nop
   1408789c7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408789cb:	e8 60 f4 7e ff       	call   0x140067e30
   1408789d0:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408789d4:	e8 b7 6c 7f ff       	call   0x14006f690
   1408789d9:	90                   	nop
   1408789da:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1408789df:	45 33 c9             	xor    r9d,r9d
   1408789e2:	44 8b c3             	mov    r8d,ebx
   1408789e5:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408789e9:	49 8b 4d 30          	mov    rcx,QWORD PTR [r13+0x30]
   1408789ed:	e8 3e 5a ab 00       	call   0x14132e430
   1408789f2:	45 33 c9             	xor    r9d,r9d
   1408789f5:	41 b0 03             	mov    r8b,0x3
   1408789f8:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408789fc:	49 8b cf             	mov    rcx,r15
   1408789ff:	e8 5c 0f 26 00       	call   0x140ad9960
   140878a04:	48 8d 15 45 c3 d9 00 	lea    rdx,[rip+0xd9c345]        # 0x141614d50
   140878a0b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878a0f:	e8 3c f7 7e ff       	call   0x140068150
   140878a14:	90                   	nop
   140878a15:	45 33 c9             	xor    r9d,r9d
   140878a18:	45 33 c0             	xor    r8d,r8d
   140878a1b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878a1f:	49 8b cf             	mov    rcx,r15
   140878a22:	e8 39 0f 26 00       	call   0x140ad9960
   140878a27:	90                   	nop
   140878a28:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878a2c:	e8 ff f3 7e ff       	call   0x140067e30
   140878a31:	90                   	nop
   140878a32:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878a36:	e9 da 01 00 00       	jmp    0x140878c15
   140878a3b:	48 8d 15 be af e3 00 	lea    rdx,[rip+0xe3afbe]        # 0x1416b3a00
   140878a42:	e8 09 f7 7e ff       	call   0x140068150
   140878a47:	90                   	nop
   140878a48:	45 33 c9             	xor    r9d,r9d
   140878a4b:	41 b0 03             	mov    r8b,0x3
   140878a4e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878a52:	49 8b cf             	mov    rcx,r15
   140878a55:	e8 06 0f 26 00       	call   0x140ad9960
   140878a5a:	90                   	nop
   140878a5b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878a5f:	e8 cc f3 7e ff       	call   0x140067e30
   140878a64:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878a68:	e8 23 6c 7f ff       	call   0x14006f690
   140878a6d:	90                   	nop
   140878a6e:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   140878a73:	45 33 c9             	xor    r9d,r9d
   140878a76:	44 8b c3             	mov    r8d,ebx
   140878a79:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878a7d:	49 8b 4d 30          	mov    rcx,QWORD PTR [r13+0x30]
   140878a81:	e8 aa 59 ab 00       	call   0x14132e430
   140878a86:	45 33 c9             	xor    r9d,r9d
   140878a89:	41 b0 03             	mov    r8b,0x3
   140878a8c:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878a90:	49 8b cf             	mov    rcx,r15
   140878a93:	e8 c8 0e 26 00       	call   0x140ad9960
   140878a98:	48 8d 15 b1 c2 d9 00 	lea    rdx,[rip+0xd9c2b1]        # 0x141614d50
   140878a9f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878aa3:	e8 a8 f6 7e ff       	call   0x140068150
   140878aa8:	90                   	nop
   140878aa9:	45 33 c9             	xor    r9d,r9d
   140878aac:	45 33 c0             	xor    r8d,r8d
   140878aaf:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878ab3:	49 8b cf             	mov    rcx,r15
   140878ab6:	e8 a5 0e 26 00       	call   0x140ad9960
   140878abb:	90                   	nop
   140878abc:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878ac0:	e8 6b f3 7e ff       	call   0x140067e30
   140878ac5:	90                   	nop
   140878ac6:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878aca:	e9 46 01 00 00       	jmp    0x140878c15
   140878acf:	44 8b 4d 90          	mov    r9d,DWORD PTR [rbp-0x70]
   140878ad3:	41 83 c1 f6          	add    r9d,0xfffffff6
   140878ad7:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   140878adc:	41 83 c0 02          	add    r8d,0x2
   140878ae0:	89 7c 24 20          	mov    DWORD PTR [rsp+0x20],edi
   140878ae4:	49 8b 55 38          	mov    rdx,QWORD PTR [r13+0x38]
   140878ae8:	49 8b cd             	mov    rcx,r13
   140878aeb:	e8 20 a4 ff ff       	call   0x140872f10
   140878af0:	e9 25 01 00 00       	jmp    0x140878c1a
   140878af5:	48 8d 15 e4 ae e3 00 	lea    rdx,[rip+0xe3aee4]        # 0x1416b39e0
   140878afc:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878b00:	e8 4b f6 7e ff       	call   0x140068150
   140878b05:	90                   	nop
   140878b06:	45 33 c9             	xor    r9d,r9d
   140878b09:	45 33 c0             	xor    r8d,r8d
   140878b0c:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878b10:	49 8b cf             	mov    rcx,r15
   140878b13:	e8 48 0e 26 00       	call   0x140ad9960
   140878b18:	90                   	nop
   140878b19:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878b1d:	e9 f3 00 00 00       	jmp    0x140878c15
   140878b22:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878b26:	e8 65 6b 7f ff       	call   0x14006f690
   140878b2b:	90                   	nop
   140878b2c:	48 8d 15 35 5b e0 00 	lea    rdx,[rip+0xe05b35]        # 0x14167e668
   140878b33:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878b37:	e8 44 6a 7f ff       	call   0x14006f580
   140878b3c:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878b40:	e8 4b 6b 7f ff       	call   0x14006f690
   140878b45:	90                   	nop
   140878b46:	49 8b 5d 38          	mov    rbx,QWORD PTR [r13+0x38]
   140878b4a:	49 8d 8d 00 01 00 00 	lea    rcx,[r13+0x100]
   140878b51:	33 d2                	xor    edx,edx
   140878b53:	e8 c8 66 7f ff       	call   0x14006f220
   140878b58:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140878b5b:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   140878b62:	45 33 c9             	xor    r9d,r9d
   140878b65:	44 0f b7 42 0c       	movzx  r8d,WORD PTR [rdx+0xc]
   140878b6a:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   140878b6e:	48 8b cb             	mov    rcx,rbx
   140878b71:	e8 5a ba ab 00       	call   0x1413345d0
   140878b76:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   140878b7a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878b7e:	e8 8d 11 84 ff       	call   0x1400b9d10
   140878b83:	48 8d 15 aa f8 d9 00 	lea    rdx,[rip+0xd9f8aa]        # 0x141618434
   140878b8a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878b8e:	e8 cd 69 7f ff       	call   0x14006f560
   140878b93:	45 33 c9             	xor    r9d,r9d
   140878b96:	45 33 c0             	xor    r8d,r8d
   140878b99:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878b9d:	49 8b cf             	mov    rcx,r15
   140878ba0:	e8 bb 0d 26 00       	call   0x140ad9960
   140878ba5:	90                   	nop
   140878ba6:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878baa:	e8 81 f2 7e ff       	call   0x140067e30
   140878baf:	90                   	nop
   140878bb0:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878bb4:	eb 5f                	jmp    0x140878c15
   140878bb6:	48 8d 15 c3 ad e3 00 	lea    rdx,[rip+0xe3adc3]        # 0x1416b3980
   140878bbd:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878bc1:	e8 8a f5 7e ff       	call   0x140068150
   140878bc6:	90                   	nop
   140878bc7:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878bcb:	e8 c0 6a 7f ff       	call   0x14006f690
   140878bd0:	90                   	nop
   140878bd1:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878bd5:	49 8b 4d 38          	mov    rcx,QWORD PTR [r13+0x38]
   140878bd9:	e8 22 89 ab 00       	call   0x141331500
   140878bde:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878be2:	e8 d9 47 cb ff       	call   0x14052d3c0
   140878be7:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878beb:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878bef:	e8 1c 11 84 ff       	call   0x1400b9d10
   140878bf4:	45 33 c9             	xor    r9d,r9d
   140878bf7:	45 33 c0             	xor    r8d,r8d
   140878bfa:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   140878bfe:	49 8b cf             	mov    rcx,r15
   140878c01:	e8 5a 0d 26 00       	call   0x140ad9960
   140878c06:	90                   	nop
   140878c07:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878c0b:	e8 20 f2 7e ff       	call   0x140067e30
   140878c10:	90                   	nop
   140878c11:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878c15:	e8 16 f2 7e ff       	call   0x140067e30
   140878c1a:	4c 8d 05 df 73 78 ff 	lea    r8,[rip+0xffffffffff7873df]        # 0x140000000
   140878c21:	49 63 55 04          	movsxd rdx,DWORD PTR [r13+0x4]
   140878c25:	83 fa 09             	cmp    edx,0x9
   140878c28:	0f 87 f1 73 00 00    	ja     0x14088001f
   140878c2e:	41 8b 8c 90 6c 00 88 00 	mov    ecx,DWORD PTR [r8+rdx*4+0x88006c]
   140878c36:	49 03 c8             	add    rcx,r8
   140878c39:	ff e1                	jmp    rcx
   140878c3b:	44 8b 6c 24 68       	mov    r13d,DWORD PTR [rsp+0x68]
   140878c40:	41 ff c5             	inc    r13d
   140878c43:	8b 5d 90             	mov    ebx,DWORD PTR [rbp-0x70]
   140878c46:	ff cb                	dec    ebx
   140878c48:	44 8d 7f 02          	lea    r15d,[rdi+0x2]
   140878c4c:	44 89 7d 8c          	mov    DWORD PTR [rbp-0x74],r15d
   140878c50:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140878c53:	ff c8                	dec    eax
   140878c55:	41 2b c7             	sub    eax,r15d
   140878c58:	ff c0                	inc    eax
   140878c5a:	99                   	cdq
   140878c5b:	83 e2 07             	and    edx,0x7
   140878c5e:	44 8d 24 02          	lea    r12d,[rdx+rax*1]
   140878c62:	41 c1 fc 03          	sar    r12d,0x3
   140878c66:	44 89 64 24 60       	mov    DWORD PTR [rsp+0x60],r12d
   140878c6b:	48 8b 74 24 70       	mov    rsi,QWORD PTR [rsp+0x70]
   140878c70:	48 83 c6 10          	add    rsi,0x10
   140878c74:	48 8b ce             	mov    rcx,rsi
   140878c77:	e8 d4 61 7f ff       	call   0x14006ee50
   140878c7c:	8d 7b fe             	lea    edi,[rbx-0x2]
   140878c7f:	41 3b c4             	cmp    eax,r12d
   140878c82:	0f 4e fb             	cmovle edi,ebx
   140878c85:	89 7c 24 7c          	mov    DWORD PTR [rsp+0x7c],edi
   140878c89:	45 8b f7             	mov    r14d,r15d
   140878c8c:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   140878c91:	8b 58 28             	mov    ebx,DWORD PTR [rax+0x28]
   140878c94:	48 8b ce             	mov    rcx,rsi
   140878c97:	e8 b4 61 7f ff       	call   0x14006ee50
   140878c9c:	41 2b c4             	sub    eax,r12d
   140878c9f:	3b d8                	cmp    ebx,eax
   140878ca1:	7e 0e                	jle    0x140878cb1
   140878ca3:	48 8b ce             	mov    rcx,rsi
   140878ca6:	e8 a5 61 7f ff       	call   0x14006ee50
   140878cab:	48 8b d8             	mov    rbx,rax
   140878cae:	41 2b dc             	sub    ebx,r12d
   140878cb1:	33 c0                	xor    eax,eax
   140878cb3:	85 db                	test   ebx,ebx
   140878cb5:	0f 49 c3             	cmovns eax,ebx
   140878cb8:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140878cbc:	42 8d 0c 20          	lea    ecx,[rax+r12*1]
   140878cc0:	89 4c 24 64          	mov    DWORD PTR [rsp+0x64],ecx
   140878cc4:	3b c1                	cmp    eax,ecx
   140878cc6:	0f 8d 30 05 00 00    	jge    0x1408791fc
   140878ccc:	c7 45 80 52 00 00 00 	mov    DWORD PTR [rbp-0x80],0x52
   140878cd3:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140878cd7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140878ce0:	4c 63 f8             	movsxd r15,eax
   140878ce3:	4c 89 7d a8          	mov    QWORD PTR [rbp-0x58],r15
   140878ce7:	48 8b ce             	mov    rcx,rsi
   140878cea:	e8 61 61 7f ff       	call   0x14006ee50
   140878cef:	4c 3b f8             	cmp    r15,rax
   140878cf2:	0f 83 fb 04 00 00    	jae    0x1408791f3
   140878cf8:	45 33 c0             	xor    r8d,r8d
   140878cfb:	ba 07 00 00 00       	mov    edx,0x7
   140878d00:	41 b1 01             	mov    r9b,0x1
   140878d03:	48 8d 0d e6 16 dd 01 	lea    rcx,[rip+0x1dd16e6]        # 0x14264a3f0
   140878d0a:	e8 21 24 84 ff       	call   0x1400bb130
   140878d0f:	41 8b f5             	mov    esi,r13d
   140878d12:	44 3b ef             	cmp    r13d,edi
   140878d15:	0f 8f ba 00 00 00    	jg     0x140878dd5
   140878d1b:	45 8d 66 08          	lea    r12d,[r14+0x8]
   140878d1f:	90                   	nop
   140878d20:	41 8b de             	mov    ebx,r14d
   140878d23:	45 3b f4             	cmp    r14d,r12d
   140878d26:	0f 8d 9b 00 00 00    	jge    0x140878dc7
   140878d2c:	45 8d 7e 07          	lea    r15d,[r14+0x7]
   140878d30:	41 3b de             	cmp    ebx,r14d
   140878d33:	7e 0c                	jle    0x140878d41
   140878d35:	41 3b df             	cmp    ebx,r15d
   140878d38:	7d 07                	jge    0x140878d41
   140878d3a:	bf 01 00 00 00       	mov    edi,0x1
   140878d3f:	eb 0d                	jmp    0x140878d4e
   140878d41:	33 ff                	xor    edi,edi
   140878d43:	41 3b df             	cmp    ebx,r15d
   140878d46:	b8 02 00 00 00       	mov    eax,0x2
   140878d4b:	0f 44 f8             	cmove  edi,eax
   140878d4e:	44 8b c6             	mov    r8d,esi
   140878d51:	8b d3                	mov    edx,ebx
   140878d53:	48 8d 0d 96 16 dd 01 	lea    rcx,[rip+0x1dd1696]        # 0x14264a3f0
   140878d5a:	e8 c1 23 84 ff       	call   0x1400bb120
   140878d5f:	48 8d 05 8a 16 dd 01 	lea    rax,[rip+0x1dd168a]        # 0x14264a3f0
   140878d66:	41 3b f5             	cmp    esi,r13d
   140878d69:	75 09                	jne    0x140878d74
   140878d6b:	8b 94 b8 a8 19 00 00 	mov    edx,DWORD PTR [rax+rdi*4+0x19a8]
   140878d72:	eb 16                	jmp    0x140878d8a
   140878d74:	3b 74 24 7c          	cmp    esi,DWORD PTR [rsp+0x7c]
   140878d78:	75 09                	jne    0x140878d83
   140878d7a:	8b 94 b8 c0 19 00 00 	mov    edx,DWORD PTR [rax+rdi*4+0x19c0]
   140878d81:	eb 07                	jmp    0x140878d8a
   140878d83:	8b 94 b8 b4 19 00 00 	mov    edx,DWORD PTR [rax+rdi*4+0x19b4]
   140878d8a:	48 8d 3d 5f 16 dd 01 	lea    rdi,[rip+0x1dd165f]        # 0x14264a3f0
   140878d91:	48 8b cf             	mov    rcx,rdi
   140878d94:	e8 37 1d 26 00       	call   0x140adaad0
   140878d99:	33 d2                	xor    edx,edx
   140878d9b:	48 8d 0d ce 49 b5 01 	lea    rcx,[rip+0x1b549ce]        # 0x1423cd770
   140878da2:	e8 e9 91 7f ff       	call   0x140071f90
   140878da7:	84 c0                	test   al,al
   140878da9:	74 0d                	je     0x140878db8
   140878dab:	41 b0 01             	mov    r8b,0x1
   140878dae:	33 d2                	xor    edx,edx
   140878db0:	48 8b cf             	mov    rcx,rdi
   140878db3:	e8 d8 23 84 ff       	call   0x1400bb190
   140878db8:	ff c3                	inc    ebx
   140878dba:	41 3b dc             	cmp    ebx,r12d
   140878dbd:	0f 8c 6d ff ff ff    	jl     0x140878d30
   140878dc3:	8b 7c 24 7c          	mov    edi,DWORD PTR [rsp+0x7c]
   140878dc7:	ff c6                	inc    esi
   140878dc9:	3b f7                	cmp    esi,edi
   140878dcb:	0f 8e 4f ff ff ff    	jle    0x140878d20
   140878dd1:	4c 8b 7d a8          	mov    r15,QWORD PTR [rbp-0x58]
   140878dd5:	49 8b d7             	mov    rdx,r15
   140878dd8:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   140878ddd:	48 83 c1 10          	add    rcx,0x10
   140878de1:	e8 3a 64 7f ff       	call   0x14006f220
   140878de6:	4c 8b 20             	mov    r12,QWORD PTR [rax]
   140878de9:	4c 89 65 d8          	mov    QWORD PTR [rbp-0x28],r12
   140878ded:	41 8d 4d 0b          	lea    ecx,[r13+0xb]
   140878df1:	41 8d 76 05          	lea    esi,[r14+0x5]
   140878df5:	41 8b fd             	mov    edi,r13d
   140878df8:	44 3b e9             	cmp    r13d,ecx
   140878dfb:	0f 8f 80 00 00 00    	jg     0x140878e81
   140878e01:	4c 8d 25 e8 15 dd 01 	lea    r12,[rip+0x1dd15e8]        # 0x14264a3f0
   140878e08:	41 3b fd             	cmp    edi,r13d
   140878e0b:	75 04                	jne    0x140878e11
   140878e0d:	33 c0                	xor    eax,eax
   140878e0f:	eb 0f                	jmp    0x140878e20
   140878e11:	b8 01 00 00 00       	mov    eax,0x1
   140878e16:	3b f9                	cmp    edi,ecx
   140878e18:	ba 02 00 00 00       	mov    edx,0x2
   140878e1d:	0f 44 c2             	cmove  eax,edx
   140878e20:	41 8b de             	mov    ebx,r14d
   140878e23:	44 3b f6             	cmp    r14d,esi
   140878e26:	7f 4b                	jg     0x140878e73
   140878e28:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   140878e2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140878e30:	44 8b c7             	mov    r8d,edi
   140878e33:	8b d3                	mov    edx,ebx
   140878e35:	49 8b cc             	mov    rcx,r12
   140878e38:	e8 e3 22 84 ff       	call   0x1400bb120
   140878e3d:	41 3b de             	cmp    ebx,r14d
   140878e40:	75 04                	jne    0x140878e46
   140878e42:	33 c0                	xor    eax,eax
   140878e44:	eb 0f                	jmp    0x140878e55
   140878e46:	b8 01 00 00 00       	mov    eax,0x1
   140878e4b:	3b de                	cmp    ebx,esi
   140878e4d:	b9 02 00 00 00       	mov    ecx,0x2
   140878e52:	0f 44 c1             	cmove  eax,ecx
   140878e55:	49 8d 14 07          	lea    rdx,[r15+rax*1]
   140878e59:	41 8b 94 94 a0 1b 00 00 	mov    edx,DWORD PTR [r12+rdx*4+0x1ba0]
   140878e61:	49 8b cc             	mov    rcx,r12
   140878e64:	e8 67 1c 26 00       	call   0x140adaad0
   140878e69:	ff c3                	inc    ebx
   140878e6b:	3b de                	cmp    ebx,esi
   140878e6d:	7e c1                	jle    0x140878e30
   140878e6f:	41 8d 4d 0b          	lea    ecx,[r13+0xb]
   140878e73:	ff c7                	inc    edi
   140878e75:	3b f9                	cmp    edi,ecx
   140878e77:	7e 8f                	jle    0x140878e08
   140878e79:	4c 8b 65 d8          	mov    r12,QWORD PTR [rbp-0x28]
   140878e7d:	4c 8b 7d a8          	mov    r15,QWORD PTR [rbp-0x58]
   140878e81:	33 d2                	xor    edx,edx
   140878e83:	48 8d 0d e6 48 b5 01 	lea    rcx,[rip+0x1b548e6]        # 0x1423cd770
   140878e8a:	e8 01 91 7f ff       	call   0x140071f90
   140878e8f:	84 c0                	test   al,al
   140878e91:	0f 84 67 01 00 00    	je     0x140878ffe
   140878e97:	41 83 bc 24 2c 14 00 00 00 	cmp    DWORD PTR [r12+0x142c],0x0
   140878ea0:	74 0e                	je     0x140878eb0
   140878ea2:	41 f7 84 24 1c 01 00 00 00 40 00 00 	test   DWORD PTR [r12+0x11c],0x4000
   140878eae:	74 08                	je     0x140878eb8
   140878eb0:	49 8b cc             	mov    rcx,r12
   140878eb3:	e8 68 0b 94 ff       	call   0x1401b9a20
   140878eb8:	41 83 bc 24 2c 14 00 00 00 	cmp    DWORD PTR [r12+0x142c],0x0
   140878ec1:	74 5c                	je     0x140878f1f
   140878ec3:	45 33 c0             	xor    r8d,r8d
   140878ec6:	ba 07 00 00 00       	mov    edx,0x7
   140878ecb:	41 b1 01             	mov    r9b,0x1
   140878ece:	48 8d 3d 1b 15 dd 01 	lea    rdi,[rip+0x1dd151b]        # 0x14264a3f0
   140878ed5:	48 8b cf             	mov    rcx,rdi
   140878ed8:	e8 53 22 84 ff       	call   0x1400bb130
   140878edd:	45 8b c5             	mov    r8d,r13d
   140878ee0:	41 8b d6             	mov    edx,r14d
   140878ee3:	48 8b cf             	mov    rcx,rdi
   140878ee6:	e8 35 22 84 ff       	call   0x1400bb120
   140878eeb:	c6 44 24 30 00       	mov    BYTE PTR [rsp+0x30],0x0
   140878ef0:	c7 44 24 28 08 00 00 00 	mov    DWORD PTR [rsp+0x28],0x8
   140878ef8:	c7 44 24 20 0c 00 00 00 	mov    DWORD PTR [rsp+0x20],0xc
   140878f00:	45 33 c9             	xor    r9d,r9d
   140878f03:	45 33 c0             	xor    r8d,r8d
   140878f06:	41 8b 94 24 2c 14 00 00 	mov    edx,DWORD PTR [r12+0x142c]
   140878f0e:	48 8b cf             	mov    rcx,rdi
   140878f11:	e8 5a 1e 26 00       	call   0x140adad70
   140878f16:	41 8d 5e 01          	lea    ebx,[r14+0x1]
   140878f1a:	e9 21 01 00 00       	jmp    0x140879040
   140878f1f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878f23:	e8 68 67 7f ff       	call   0x14006f690
   140878f28:	90                   	nop
   140878f29:	48 8d 45 98          	lea    rax,[rbp-0x68]
   140878f2d:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   140878f32:	48 c7 44 24 48 00 00 00 00 	mov    QWORD PTR [rsp+0x48],0x0
   140878f3b:	4c 89 64 24 40       	mov    QWORD PTR [rsp+0x40],r12
   140878f40:	c7 44 24 38 00 08 00 00 	mov    DWORD PTR [rsp+0x38],0x800
   140878f48:	41 0f b7 84 24 a0 00 00 00 	movzx  eax,WORD PTR [r12+0xa0]
   140878f51:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   140878f56:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140878f5b:	66 89 44 24 28       	mov    WORD PTR [rsp+0x28],ax
   140878f60:	66 89 44 24 20       	mov    WORD PTR [rsp+0x20],ax
   140878f65:	45 0f b7 8c 24 2c 01 00 00 	movzx  r9d,WORD PTR [r12+0x12c]
   140878f6e:	45 0f b7 84 24 a4 00 00 00 	movzx  r8d,WORD PTR [r12+0xa4]
   140878f77:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878f7b:	48 8d 0d c6 3a c7 01 	lea    rcx,[rip+0x1c73ac6]        # 0x1424eca48
   140878f82:	e8 59 97 87 ff       	call   0x1400f26e0
   140878f87:	8b d8                	mov    ebx,eax
   140878f89:	48 8d 3d 60 14 dd 01 	lea    rdi,[rip+0x1dd1460]        # 0x14264a3f0
   140878f90:	48 8b cf             	mov    rcx,rdi
   140878f93:	80 7d 98 00          	cmp    BYTE PTR [rbp-0x68],0x0
   140878f97:	74 1a                	je     0x140878fb3
   140878f99:	45 8b c5             	mov    r8d,r13d
   140878f9c:	41 8b d6             	mov    edx,r14d
   140878f9f:	e8 7c 21 84 ff       	call   0x1400bb120
   140878fa4:	85 db                	test   ebx,ebx
   140878fa6:	74 47                	je     0x140878fef
   140878fa8:	41 b9 06 00 00 00    	mov    r9d,0x6
   140878fae:	45 33 c0             	xor    r8d,r8d
   140878fb1:	eb 1c                	jmp    0x140878fcf
   140878fb3:	45 8d 45 04          	lea    r8d,[r13+0x4]
   140878fb7:	41 8d 56 03          	lea    edx,[r14+0x3]
   140878fbb:	e8 60 21 84 ff       	call   0x1400bb120
   140878fc0:	85 db                	test   ebx,ebx
   140878fc2:	74 2b                	je     0x140878fef
   140878fc4:	b8 02 00 00 00       	mov    eax,0x2
   140878fc9:	44 8b c8             	mov    r9d,eax
   140878fcc:	44 8b c0             	mov    r8d,eax
   140878fcf:	c6 44 24 30 00       	mov    BYTE PTR [rsp+0x30],0x0
   140878fd4:	c7 44 24 28 03 00 00 00 	mov    DWORD PTR [rsp+0x28],0x3
   140878fdc:	c7 44 24 20 05 00 00 00 	mov    DWORD PTR [rsp+0x20],0x5
   140878fe4:	8b d3                	mov    edx,ebx
   140878fe6:	48 8b cf             	mov    rcx,rdi
   140878fe9:	e8 82 1d 26 00       	call   0x140adad70
   140878fee:	90                   	nop
   140878fef:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878ff3:	e8 38 ee 7e ff       	call   0x140067e30
   140878ff8:	41 8d 5e 01          	lea    ebx,[r14+0x1]
   140878ffc:	eb 42                	jmp    0x140879040
   140878ffe:	41 8d 5e 01          	lea    ebx,[r14+0x1]
   140879002:	45 8d 45 02          	lea    r8d,[r13+0x2]
   140879006:	8b d3                	mov    edx,ebx
   140879008:	48 8d 3d e1 13 dd 01 	lea    rdi,[rip+0x1dd13e1]        # 0x14264a3f0
   14087900f:	48 8b cf             	mov    rcx,rdi
   140879012:	e8 09 21 84 ff       	call   0x1400bb120
   140879017:	33 d2                	xor    edx,edx
   140879019:	45 33 c9             	xor    r9d,r9d
   14087901c:	41 b0 01             	mov    r8b,0x1
   14087901f:	49 8b cc             	mov    rcx,r12
   140879022:	e8 99 ab ab 00       	call   0x141333bc0
   140879027:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
   14087902b:	33 d2                	xor    edx,edx
   14087902d:	49 8b cc             	mov    rcx,r12
   140879030:	ff 10                	call   QWORD PTR [rax]
   140879032:	0f b6 d0             	movzx  edx,al
   140879035:	41 b0 01             	mov    r8b,0x1
   140879038:	48 8b cf             	mov    rcx,rdi
   14087903b:	e8 50 21 84 ff       	call   0x1400bb190
   140879040:	45 8d 45 0d          	lea    r8d,[r13+0xd]
   140879044:	8b d3                	mov    edx,ebx
   140879046:	48 8b cf             	mov    rcx,rdi
   140879049:	e8 d2 20 84 ff       	call   0x1400bb120
   14087904e:	45 33 c0             	xor    r8d,r8d
   140879051:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   140879055:	41 8b d4             	mov    edx,r12d
   140879058:	48 8d 0d 91 51 03 01 	lea    rcx,[rip+0x1035191]        # 0x1418ae1f0
   14087905f:	e8 4c 04 3c 00       	call   0x140c394b0
   140879064:	45 8d 45 0f          	lea    r8d,[r13+0xf]
   140879068:	8b d3                	mov    edx,ebx
   14087906a:	48 8b cf             	mov    rcx,rdi
   14087906d:	e8 ae 20 84 ff       	call   0x1400bb120
   140879072:	49 8b d7             	mov    rdx,r15
   140879075:	48 8b 74 24 70       	mov    rsi,QWORD PTR [rsp+0x70]
   14087907a:	48 83 c6 10          	add    rsi,0x10
   14087907e:	48 8b ce             	mov    rcx,rsi
   140879081:	e8 9a 61 7f ff       	call   0x14006f220
   140879086:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879089:	e8 d2 b7 f6 ff       	call   0x1407e4860
   14087908e:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879092:	e8 f9 65 7f ff       	call   0x14006f690
   140879097:	90                   	nop
   140879098:	49 8b d7             	mov    rdx,r15
   14087909b:	48 8b ce             	mov    rcx,rsi
   14087909e:	e8 7d 61 7f ff       	call   0x14006f220
   1408790a3:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1408790a8:	41 b1 01             	mov    r9b,0x1
   1408790ab:	41 b8 01 00 00 00    	mov    r8d,0x1
   1408790b1:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408790b5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408790b8:	e8 73 53 ab 00       	call   0x14132e430
   1408790bd:	45 33 c0             	xor    r8d,r8d
   1408790c0:	ba 07 00 00 00       	mov    edx,0x7
   1408790c5:	45 33 c9             	xor    r9d,r9d
   1408790c8:	48 8b cf             	mov    rcx,rdi
   1408790cb:	e8 60 20 84 ff       	call   0x1400bb130
   1408790d0:	45 33 c9             	xor    r9d,r9d
   1408790d3:	45 33 c0             	xor    r8d,r8d
   1408790d6:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408790da:	48 8b cf             	mov    rcx,rdi
   1408790dd:	e8 7e 08 26 00       	call   0x140ad9960
   1408790e2:	41 8d 7e 02          	lea    edi,[r14+0x2]
   1408790e6:	49 8b d7             	mov    rdx,r15
   1408790e9:	48 8b ce             	mov    rcx,rsi
   1408790ec:	e8 2f 61 7f ff       	call   0x14006f220
   1408790f1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408790f4:	48 81 c1 d0 07 00 00 	add    rcx,0x7d0
   1408790fb:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1408790ff:	e8 3c 61 7f ff       	call   0x14006f240
   140879104:	49 8b d7             	mov    rdx,r15
   140879107:	48 8b ce             	mov    rcx,rsi
   14087910a:	e8 11 61 7f ff       	call   0x14006f220
   14087910f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879112:	48 81 c1 d0 07 00 00 	add    rcx,0x7d0
   140879119:	48 8d 55 c8          	lea    rdx,[rbp-0x38]
   14087911d:	e8 0e 61 7f ff       	call   0x14006f230
   140879122:	4c 8d 45 c8          	lea    r8,[rbp-0x38]
   140879126:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   14087912a:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   14087912e:	e8 ed 5c 7f ff       	call   0x14006ee20
   140879133:	33 d2                	xor    edx,edx
   140879135:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   140879138:	e8 73 c6 7e ff       	call   0x1400657b0
   14087913d:	84 c0                	test   al,al
   14087913f:	0f 84 82 00 00 00    	je     0x1408791c7
   140879145:	4c 8d 25 a4 12 dd 01 	lea    r12,[rip+0x1dd12a4]        # 0x14264a3f0
   14087914c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140879150:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   140879154:	e8 b7 5c 7f ff       	call   0x14006ee10
   140879159:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087915c:	83 39 ff             	cmp    DWORD PTR [rcx],0xffffffff
   14087915f:	74 3a                	je     0x14087919b
   140879161:	45 8d 45 12          	lea    r8d,[r13+0x12]
   140879165:	8b d7                	mov    edx,edi
   140879167:	49 8b cc             	mov    rcx,r12
   14087916a:	e8 b1 1f 84 ff       	call   0x1400bb120
   14087916f:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   140879173:	e8 98 5c 7f ff       	call   0x14006ee10
   140879178:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   14087917b:	49 8b d7             	mov    rdx,r15
   14087917e:	48 8b ce             	mov    rcx,rsi
   140879181:	e8 9a 60 7f ff       	call   0x14006f220
   140879186:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140879189:	48 8b cb             	mov    rcx,rbx
   14087918c:	e8 af 94 fd ff       	call   0x140852640
   140879191:	ff c7                	inc    edi
   140879193:	41 8d 46 08          	lea    eax,[r14+0x8]
   140879197:	3b f8                	cmp    edi,eax
   140879199:	7d 28                	jge    0x1408791c3
   14087919b:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   14087919f:	e8 5c 5c 7f ff       	call   0x14006ee00
   1408791a4:	4c 8d 45 c8          	lea    r8,[rbp-0x38]
   1408791a8:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   1408791ac:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   1408791b0:	e8 6b 5c 7f ff       	call   0x14006ee20
   1408791b5:	33 d2                	xor    edx,edx
   1408791b7:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   1408791ba:	e8 f1 c5 7e ff       	call   0x1400657b0
   1408791bf:	84 c0                	test   al,al
   1408791c1:	75 8d                	jne    0x140879150
   1408791c3:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   1408791c7:	41 83 c6 08          	add    r14d,0x8
   1408791cb:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408791cf:	e8 5c ec 7e ff       	call   0x140067e30
   1408791d4:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   1408791d8:	ff c0                	inc    eax
   1408791da:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   1408791de:	41 ff c4             	inc    r12d
   1408791e1:	44 89 65 80          	mov    DWORD PTR [rbp-0x80],r12d
   1408791e5:	3b 44 24 64          	cmp    eax,DWORD PTR [rsp+0x64]
   1408791e9:	8b 7c 24 7c          	mov    edi,DWORD PTR [rsp+0x7c]
   1408791ed:	0f 8c ed fa ff ff    	jl     0x140878ce0
   1408791f3:	44 8b 64 24 60       	mov    r12d,DWORD PTR [rsp+0x60]
   1408791f8:	44 8b 7d 8c          	mov    r15d,DWORD PTR [rbp-0x74]
   1408791fc:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   140879201:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   140879205:	e8 46 5c 7f ff       	call   0x14006ee50
   14087920a:	41 3b c4             	cmp    eax,r12d
   14087920d:	0f 8e 0c 6e 00 00    	jle    0x14088001f
   140879213:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879217:	e8 44 21 84 ff       	call   0x1400bb360
   14087921c:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   140879220:	e8 2b 5c 7f ff       	call   0x14006ee50
   140879225:	44 8d 48 ff          	lea    r9d,[rax-0x1]
   140879229:	42 8d 0c e5 fe ff ff ff 	lea    ecx,[r12*8-0x2]
   140879231:	41 03 cf             	add    ecx,r15d
   140879234:	41 8d 57 01          	lea    edx,[r15+0x1]
   140879238:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   14087923c:	89 54 24 28          	mov    DWORD PTR [rsp+0x28],edx
   140879240:	44 89 64 24 20       	mov    DWORD PTR [rsp+0x20],r12d
   140879245:	45 33 c0             	xor    r8d,r8d
   140879248:	8b 53 28             	mov    edx,DWORD PTR [rbx+0x28]
   14087924b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087924f:	e8 2c 21 84 ff       	call   0x1400bb380
   140879254:	44 8d 4f 01          	lea    r9d,[rdi+0x1]
   140879258:	0f b6 43 2c          	movzx  eax,BYTE PTR [rbx+0x2c]
   14087925c:	e9 a2 6d 00 00       	jmp    0x140880003
   140879261:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879265:	44 8d 78 02          	lea    r15d,[rax+0x2]
   140879269:	8d 70 0c             	lea    esi,[rax+0xc]
   14087926c:	44 8b 65 b0          	mov    r12d,DWORD PTR [rbp-0x50]
   140879270:	41 83 c4 fd          	add    r12d,0xfffffffd
   140879274:	44 89 65 8c          	mov    DWORD PTR [rbp-0x74],r12d
   140879278:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
   14087927b:	44 8d 68 f5          	lea    r13d,[rax-0xb]
   14087927f:	44 89 6d 80          	mov    DWORD PTR [rbp-0x80],r13d
   140879283:	44 8d 70 fe          	lea    r14d,[rax-0x2]
   140879287:	48 8d 3d e2 b8 dd 01 	lea    rdi,[rip+0x1ddb8e2]        # 0x142654b70
   14087928e:	48 8d 05 e7 b8 dd 01 	lea    rax,[rip+0x1ddb8e7]        # 0x142654b7c
   140879295:	4c 8d 2d 54 11 dd 01 	lea    r13,[rip+0x1dd1154]        # 0x14264a3f0
   14087929c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1408792a0:	41 8b df             	mov    ebx,r15d
   1408792a3:	44 3b fe             	cmp    r15d,esi
   1408792a6:	7f 5f                	jg     0x140879307
   1408792a8:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1408792b0:	44 8b c3             	mov    r8d,ebx
   1408792b3:	41 8b d4             	mov    edx,r12d
   1408792b6:	49 8b cd             	mov    rcx,r13
   1408792b9:	e8 62 1e 84 ff       	call   0x1400bb120
   1408792be:	41 3b df             	cmp    ebx,r15d
   1408792c1:	75 05                	jne    0x1408792c8
   1408792c3:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   1408792c6:	eb 0b                	jmp    0x1408792d3
   1408792c8:	3b de                	cmp    ebx,esi
   1408792ca:	75 04                	jne    0x1408792d0
   1408792cc:	8b 17                	mov    edx,DWORD PTR [rdi]
   1408792ce:	eb 03                	jmp    0x1408792d3
   1408792d0:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   1408792d3:	49 8b cd             	mov    rcx,r13
   1408792d6:	e8 f5 17 26 00       	call   0x140adaad0
   1408792db:	33 d2                	xor    edx,edx
   1408792dd:	48 8d 0d 8c 44 b5 01 	lea    rcx,[rip+0x1b5448c]        # 0x1423cd770
   1408792e4:	e8 a7 8c 7f ff       	call   0x140071f90
   1408792e9:	84 c0                	test   al,al
   1408792eb:	74 0d                	je     0x1408792fa
   1408792ed:	41 b0 01             	mov    r8b,0x1
   1408792f0:	33 d2                	xor    edx,edx
   1408792f2:	49 8b cd             	mov    rcx,r13
   1408792f5:	e8 96 1e 84 ff       	call   0x1400bb190
   1408792fa:	ff c3                	inc    ebx
   1408792fc:	3b de                	cmp    ebx,esi
   1408792fe:	7e b0                	jle    0x1408792b0
   140879300:	48 8d 05 75 b8 dd 01 	lea    rax,[rip+0x1ddb875]        # 0x142654b7c
   140879307:	41 ff c4             	inc    r12d
   14087930a:	48 83 c7 04          	add    rdi,0x4
   14087930e:	48 3b f8             	cmp    rdi,rax
   140879311:	7c 8d                	jl     0x1408792a0
   140879313:	45 33 c0             	xor    r8d,r8d
   140879316:	ba 07 00 00 00       	mov    edx,0x7
   14087931b:	41 b1 01             	mov    r9b,0x1
   14087931e:	4c 8d 25 cb 10 dd 01 	lea    r12,[rip+0x1dd10cb]        # 0x14264a3f0
   140879325:	49 8b cc             	mov    rcx,r12
   140879328:	e8 03 1e 84 ff       	call   0x1400bb130
   14087932d:	41 8d 5f 02          	lea    ebx,[r15+0x2]
   140879331:	44 8b 7d 8c          	mov    r15d,DWORD PTR [rbp-0x74]
   140879335:	41 8d 57 01          	lea    edx,[r15+0x1]
   140879339:	44 8b c3             	mov    r8d,ebx
   14087933c:	49 8b cc             	mov    rcx,r12
   14087933f:	e8 dc 1d 84 ff       	call   0x1400bb120
   140879344:	48 8d 15 6d 2a db 00 	lea    rdx,[rip+0xdb2a6d]        # 0x14162bdb8
   14087934b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087934f:	e8 fc ed 7e ff       	call   0x140068150
   140879354:	90                   	nop
   140879355:	45 33 c9             	xor    r9d,r9d
   140879358:	45 33 c0             	xor    r8d,r8d
   14087935b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087935f:	49 8b cc             	mov    rcx,r12
   140879362:	e8 f9 05 26 00       	call   0x140ad9960
   140879367:	90                   	nop
   140879368:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087936c:	e8 bf ea 7e ff       	call   0x140067e30
   140879371:	41 8d 57 02          	lea    edx,[r15+0x2]
   140879375:	44 8b c3             	mov    r8d,ebx
   140879378:	49 8b cc             	mov    rcx,r12
   14087937b:	e8 a0 1d 84 ff       	call   0x1400bb120
   140879380:	45 33 c0             	xor    r8d,r8d
   140879383:	ba 5b 01 00 00       	mov    edx,0x15b
   140879388:	48 8d 0d 61 4e 03 01 	lea    rcx,[rip+0x1034e61]        # 0x1418ae1f0
   14087938f:	e8 1c 01 3c 00       	call   0x140c394b0
   140879394:	41 8b f7             	mov    esi,r15d
   140879397:	48 8d 3d 4a b8 dd 01 	lea    rdi,[rip+0x1ddb84a]        # 0x142654be8
   14087939e:	48 8d 05 4f b8 dd 01 	lea    rax,[rip+0x1ddb84f]        # 0x142654bf4
   1408793a5:	44 8b 6d 80          	mov    r13d,DWORD PTR [rbp-0x80]
   1408793a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1408793b0:	41 8b dd             	mov    ebx,r13d
   1408793b3:	45 3b ee             	cmp    r13d,r14d
   1408793b6:	7f 60                	jg     0x140879418
   1408793b8:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1408793c0:	44 8b c3             	mov    r8d,ebx
   1408793c3:	8b d6                	mov    edx,esi
   1408793c5:	49 8b cc             	mov    rcx,r12
   1408793c8:	e8 53 1d 84 ff       	call   0x1400bb120
   1408793cd:	41 3b dd             	cmp    ebx,r13d
   1408793d0:	75 05                	jne    0x1408793d7
   1408793d2:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   1408793d5:	eb 0c                	jmp    0x1408793e3
   1408793d7:	41 3b de             	cmp    ebx,r14d
   1408793da:	75 04                	jne    0x1408793e0
   1408793dc:	8b 17                	mov    edx,DWORD PTR [rdi]
   1408793de:	eb 03                	jmp    0x1408793e3
   1408793e0:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   1408793e3:	49 8b cc             	mov    rcx,r12
   1408793e6:	e8 e5 16 26 00       	call   0x140adaad0
   1408793eb:	33 d2                	xor    edx,edx
   1408793ed:	48 8d 0d 7c 43 b5 01 	lea    rcx,[rip+0x1b5437c]        # 0x1423cd770
   1408793f4:	e8 97 8b 7f ff       	call   0x140071f90
   1408793f9:	84 c0                	test   al,al
   1408793fb:	74 0d                	je     0x14087940a
   1408793fd:	41 b0 01             	mov    r8b,0x1
   140879400:	33 d2                	xor    edx,edx
   140879402:	49 8b cc             	mov    rcx,r12
   140879405:	e8 86 1d 84 ff       	call   0x1400bb190
   14087940a:	ff c3                	inc    ebx
   14087940c:	41 3b de             	cmp    ebx,r14d
   14087940f:	7e af                	jle    0x1408793c0
   140879411:	48 8d 05 dc b7 dd 01 	lea    rax,[rip+0x1ddb7dc]        # 0x142654bf4
   140879418:	ff c6                	inc    esi
   14087941a:	48 83 c7 04          	add    rdi,0x4
   14087941e:	48 3b f8             	cmp    rdi,rax
   140879421:	7c 8d                	jl     0x1408793b0
   140879423:	45 33 c0             	xor    r8d,r8d
   140879426:	ba 07 00 00 00       	mov    edx,0x7
   14087942b:	41 b1 01             	mov    r9b,0x1
   14087942e:	49 8b cc             	mov    rcx,r12
   140879431:	e8 fa 1c 84 ff       	call   0x1400bb130
   140879436:	41 8d 57 01          	lea    edx,[r15+0x1]
   14087943a:	45 8d 45 02          	lea    r8d,[r13+0x2]
   14087943e:	49 8b cc             	mov    rcx,r12
   140879441:	e8 da 1c 84 ff       	call   0x1400bb120
   140879446:	48 8d 15 d7 52 d8 00 	lea    rdx,[rip+0xd852d7]        # 0x1415fe724
   14087944d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879451:	e8 fa ec 7e ff       	call   0x140068150
   140879456:	90                   	nop
   140879457:	45 33 c9             	xor    r9d,r9d
   14087945a:	45 33 c0             	xor    r8d,r8d
   14087945d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879461:	49 8b cc             	mov    rcx,r12
   140879464:	e8 f7 04 26 00       	call   0x140ad9960
   140879469:	90                   	nop
   14087946a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087946e:	e8 bd e9 7e ff       	call   0x140067e30
   140879473:	41 8d 57 02          	lea    edx,[r15+0x2]
   140879477:	45 8d 45 02          	lea    r8d,[r13+0x2]
   14087947b:	49 8b cc             	mov    rcx,r12
   14087947e:	e8 9d 1c 84 ff       	call   0x1400bb120
   140879483:	45 33 c0             	xor    r8d,r8d
   140879486:	ba 05 00 00 00       	mov    edx,0x5
   14087948b:	48 8d 0d 5e 4d 03 01 	lea    rcx,[rip+0x1034d5e]        # 0x1418ae1f0
   140879492:	e8 19 00 3c 00       	call   0x140c394b0
   140879497:	e9 83 6b 00 00       	jmp    0x14088001f
   14087949c:	33 db                	xor    ebx,ebx
   14087949e:	48 89 5d a0          	mov    QWORD PTR [rbp-0x60],rbx
   1408794a2:	83 ea 02             	sub    edx,0x2
   1408794a5:	74 3a                	je     0x1408794e1
   1408794a7:	83 ea 03             	sub    edx,0x3
   1408794aa:	74 2a                	je     0x1408794d6
   1408794ac:	83 ea 01             	sub    edx,0x1
   1408794af:	74 1a                	je     0x1408794cb
   1408794b1:	83 fa 01             	cmp    edx,0x1
   1408794b4:	75 3d                	jne    0x1408794f3
   1408794b6:	49 8d 8d a8 00 00 00 	lea    rcx,[r13+0xa8]
   1408794bd:	e8 8e 5f 7f ff       	call   0x14006f450
   1408794c2:	48 8b d8             	mov    rbx,rax
   1408794c5:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
   1408794c9:	eb 28                	jmp    0x1408794f3
   1408794cb:	49 8d 4d 70          	lea    rcx,[r13+0x70]
   1408794cf:	e8 7c 59 7f ff       	call   0x14006ee50
   1408794d4:	eb 17                	jmp    0x1408794ed
   1408794d6:	49 8d 4d 40          	lea    rcx,[r13+0x40]
   1408794da:	e8 71 59 7f ff       	call   0x14006ee50
   1408794df:	eb 0c                	jmp    0x1408794ed
   1408794e1:	49 8d 8d d8 00 00 00 	lea    rcx,[r13+0xd8]
   1408794e8:	e8 83 5e 7f ff       	call   0x14006f370
   1408794ed:	8b d8                	mov    ebx,eax
   1408794ef:	48 89 5d a0          	mov    QWORD PTR [rbp-0x60],rbx
   1408794f3:	44 8b 7c 24 68       	mov    r15d,DWORD PTR [rsp+0x68]
   1408794f8:	41 ff c7             	inc    r15d
   1408794fb:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   1408794ff:	41 ff c8             	dec    r8d
   140879502:	8d 77 0b             	lea    esi,[rdi+0xb]
   140879505:	89 75 98             	mov    DWORD PTR [rbp-0x68],esi
   140879508:	8b 4d b0             	mov    ecx,DWORD PTR [rbp-0x50]
   14087950b:	ff c9                	dec    ecx
   14087950d:	2b ce                	sub    ecx,esi
   14087950f:	ff c1                	inc    ecx
   140879511:	b8 56 55 55 55       	mov    eax,0x55555556
   140879516:	f7 e9                	imul   ecx
   140879518:	8b fa                	mov    edi,edx
   14087951a:	c1 ef 1f             	shr    edi,0x1f
   14087951d:	03 fa                	add    edi,edx
   14087951f:	89 7c 24 60          	mov    DWORD PTR [rsp+0x60],edi
   140879523:	45 8d 70 fe          	lea    r14d,[r8-0x2]
   140879527:	3b df                	cmp    ebx,edi
   140879529:	45 0f 4e f0          	cmovle r14d,r8d
   14087952d:	44 89 74 24 7c       	mov    DWORD PTR [rsp+0x7c],r14d
   140879532:	41 8b 85 f0 00 00 00 	mov    eax,DWORD PTR [r13+0xf0]
   140879539:	8b cb                	mov    ecx,ebx
   14087953b:	2b cf                	sub    ecx,edi
   14087953d:	3b c1                	cmp    eax,ecx
   14087953f:	0f 4e c8             	cmovle ecx,eax
   140879542:	33 c0                	xor    eax,eax
   140879544:	85 c9                	test   ecx,ecx
   140879546:	0f 49 c1             	cmovns eax,ecx
   140879549:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
   14087954c:	44 8b e8             	mov    r13d,eax
   14087954f:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140879553:	03 c7                	add    eax,edi
   140879555:	89 44 24 64          	mov    DWORD PTR [rsp+0x64],eax
   140879559:	44 3b e8             	cmp    r13d,eax
   14087955c:	0f 8d c3 09 00 00    	jge    0x140879f25
   140879562:	44 8d 66 01          	lea    r12d,[rsi+0x1]
   140879566:	44 89 65 80          	mov    DWORD PTR [rbp-0x80],r12d
   14087956a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140879570:	44 3b eb             	cmp    r13d,ebx
   140879573:	0f 8d a5 09 00 00    	jge    0x140879f1e
   140879579:	45 33 c0             	xor    r8d,r8d
   14087957c:	ba 07 00 00 00       	mov    edx,0x7
   140879581:	41 b1 01             	mov    r9b,0x1
   140879584:	48 8d 0d 65 0e dd 01 	lea    rcx,[rip+0x1dd0e65]        # 0x14264a3f0
   14087958b:	e8 a0 1b 84 ff       	call   0x1400bb130
   140879590:	41 8b ff             	mov    edi,r15d
   140879593:	45 3b fe             	cmp    r15d,r14d
   140879596:	0f 8f fe 00 00 00    	jg     0x14087969a
   14087959c:	45 8d 74 24 02       	lea    r14d,[r12+0x2]
   1408795a1:	41 ff cc             	dec    r12d
   1408795a4:	44 8b 6c 24 7c       	mov    r13d,DWORD PTR [rsp+0x7c]
   1408795a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1408795b0:	41 8b dc             	mov    ebx,r12d
   1408795b3:	45 3b e6             	cmp    r12d,r14d
   1408795b6:	0f 8d c5 00 00 00    	jge    0x140879681
   1408795bc:	41 3b fd             	cmp    edi,r13d
   1408795bf:	4c 8d 2d 2a 0e dd 01 	lea    r13,[rip+0x1dd0e2a]        # 0x14264a3f0
   1408795c6:	75 56                	jne    0x14087961e
   1408795c8:	48 8d 35 e1 27 dd 01 	lea    rsi,[rip+0x1dd27e1]        # 0x14264bdb0
   1408795cf:	90                   	nop
   1408795d0:	44 8b c7             	mov    r8d,edi
   1408795d3:	8b d3                	mov    edx,ebx
   1408795d5:	49 8b cd             	mov    rcx,r13
   1408795d8:	e8 43 1b 84 ff       	call   0x1400bb120
   1408795dd:	48 8d 56 e8          	lea    rdx,[rsi-0x18]
   1408795e1:	41 3b ff             	cmp    edi,r15d
   1408795e4:	48 0f 45 d6          	cmovne rdx,rsi
   1408795e8:	8b 12                	mov    edx,DWORD PTR [rdx]
   1408795ea:	49 8b cd             	mov    rcx,r13
   1408795ed:	e8 de 14 26 00       	call   0x140adaad0
   1408795f2:	33 d2                	xor    edx,edx
   1408795f4:	48 8d 0d 75 41 b5 01 	lea    rcx,[rip+0x1b54175]        # 0x1423cd770
   1408795fb:	e8 90 89 7f ff       	call   0x140071f90
   140879600:	84 c0                	test   al,al
   140879602:	74 0d                	je     0x140879611
   140879604:	41 b0 01             	mov    r8b,0x1
   140879607:	33 d2                	xor    edx,edx
   140879609:	49 8b cd             	mov    rcx,r13
   14087960c:	e8 7f 1b 84 ff       	call   0x1400bb190
   140879611:	ff c3                	inc    ebx
   140879613:	48 83 c6 04          	add    rsi,0x4
   140879617:	41 3b de             	cmp    ebx,r14d
   14087961a:	7c b4                	jl     0x1408795d0
   14087961c:	eb 5e                	jmp    0x14087967c
   14087961e:	48 8d 35 7f 27 dd 01 	lea    rsi,[rip+0x1dd277f]        # 0x14264bda4
   140879625:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140879630:	44 8b c7             	mov    r8d,edi
   140879633:	8b d3                	mov    edx,ebx
   140879635:	49 8b cd             	mov    rcx,r13
   140879638:	e8 e3 1a 84 ff       	call   0x1400bb120
   14087963d:	48 8d 56 f4          	lea    rdx,[rsi-0xc]
   140879641:	41 3b ff             	cmp    edi,r15d
   140879644:	48 0f 45 d6          	cmovne rdx,rsi
   140879648:	8b 12                	mov    edx,DWORD PTR [rdx]
   14087964a:	49 8b cd             	mov    rcx,r13
   14087964d:	e8 7e 14 26 00       	call   0x140adaad0
   140879652:	33 d2                	xor    edx,edx
   140879654:	48 8d 0d 15 41 b5 01 	lea    rcx,[rip+0x1b54115]        # 0x1423cd770
   14087965b:	e8 30 89 7f ff       	call   0x140071f90
   140879660:	84 c0                	test   al,al
   140879662:	74 0d                	je     0x140879671
   140879664:	41 b0 01             	mov    r8b,0x1
   140879667:	33 d2                	xor    edx,edx
   140879669:	49 8b cd             	mov    rcx,r13
   14087966c:	e8 1f 1b 84 ff       	call   0x1400bb190
   140879671:	ff c3                	inc    ebx
   140879673:	48 83 c6 04          	add    rsi,0x4
   140879677:	41 3b de             	cmp    ebx,r14d
   14087967a:	7c b4                	jl     0x140879630
   14087967c:	44 8b 6c 24 7c       	mov    r13d,DWORD PTR [rsp+0x7c]
   140879681:	ff c7                	inc    edi
   140879683:	41 3b fd             	cmp    edi,r13d
   140879686:	0f 8e 24 ff ff ff    	jle    0x1408795b0
   14087968c:	44 8b 6c 24 78       	mov    r13d,DWORD PTR [rsp+0x78]
   140879691:	44 8b 74 24 7c       	mov    r14d,DWORD PTR [rsp+0x7c]
   140879696:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   14087969a:	45 8b c7             	mov    r8d,r15d
   14087969d:	41 8b d4             	mov    edx,r12d
   1408796a0:	48 8d 3d 49 0d dd 01 	lea    rdi,[rip+0x1dd0d49]        # 0x14264a3f0
   1408796a7:	48 8b cf             	mov    rcx,rdi
   1408796aa:	e8 71 1a 84 ff       	call   0x1400bb120
   1408796af:	41 8b d5             	mov    edx,r13d
   1408796b2:	2b 55 8c             	sub    edx,DWORD PTR [rbp-0x74]
   1408796b5:	83 c2 52             	add    edx,0x52
   1408796b8:	45 33 c0             	xor    r8d,r8d
   1408796bb:	48 8d 0d 2e 4b 03 01 	lea    rcx,[rip+0x1034b2e]        # 0x1418ae1f0
   1408796c2:	e8 e9 fd 3b 00       	call   0x140c394b0
   1408796c7:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408796cb:	e8 c0 5f 7f ff       	call   0x14006f690
   1408796d0:	90                   	nop
   1408796d1:	45 8d 47 02          	lea    r8d,[r15+0x2]
   1408796d5:	41 8b d4             	mov    edx,r12d
   1408796d8:	48 8b cf             	mov    rcx,rdi
   1408796db:	e8 40 1a 84 ff       	call   0x1400bb120
   1408796e0:	45 33 c0             	xor    r8d,r8d
   1408796e3:	ba 07 00 00 00       	mov    edx,0x7
   1408796e8:	41 b1 01             	mov    r9b,0x1
   1408796eb:	48 8b cf             	mov    rcx,rdi
   1408796ee:	e8 3d 1a 84 ff       	call   0x1400bb130
   1408796f3:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   1408796f8:	8b 4f 04             	mov    ecx,DWORD PTR [rdi+0x4]
   1408796fb:	83 e9 02             	sub    ecx,0x2
   1408796fe:	0f 84 d1 05 00 00    	je     0x140879cd5
   140879704:	83 e9 03             	sub    ecx,0x3
   140879707:	0f 84 21 03 00 00    	je     0x140879a2e
   14087970d:	83 e9 01             	sub    ecx,0x1
   140879710:	0f 84 8e 00 00 00    	je     0x1408797a4
   140879716:	83 f9 01             	cmp    ecx,0x1
   140879719:	0f 85 c1 07 00 00    	jne    0x140879ee0
   14087971f:	48 8d 15 0e a1 e3 00 	lea    rdx,[rip+0xe3a10e]        # 0x1416b3834
   140879726:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087972a:	e8 51 5e 7f ff       	call   0x14006f580
   14087972f:	48 8b 05 da b9 b6 01 	mov    rax,QWORD PTR [rip+0x1b6b9da]        # 0x1423e5110
   140879736:	0f b7 b0 ac 00 00 00 	movzx  esi,WORD PTR [rax+0xac]
   14087973d:	48 8d 8f c0 00 00 00 	lea    rcx,[rdi+0xc0]
   140879744:	49 63 dd             	movsxd rbx,r13d
   140879747:	48 8b d3             	mov    rdx,rbx
   14087974a:	e8 f1 5c 7f ff       	call   0x14006f440
   14087974f:	0f b7 38             	movzx  edi,WORD PTR [rax]
   140879752:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   140879757:	48 81 c1 a8 00 00 00 	add    rcx,0xa8
   14087975e:	48 8b d3             	mov    rdx,rbx
   140879761:	e8 da 5c 7f ff       	call   0x14006f440
   140879766:	44 0f b7 08          	movzx  r9d,WORD PTR [rax]
   14087976a:	48 8b 05 9f b9 b6 01 	mov    rax,QWORD PTR [rip+0x1b6b99f]        # 0x1423e5110
   140879771:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879775:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   14087977a:	66 89 74 24 28       	mov    WORD PTR [rsp+0x28],si
   14087977f:	66 89 7c 24 20       	mov    WORD PTR [rsp+0x20],di
   140879784:	44 0f b7 80 ac 00 00 00 	movzx  r8d,WORD PTR [rax+0xac]
   14087978c:	0f b7 90 aa 00 00 00 	movzx  edx,WORD PTR [rax+0xaa]
   140879793:	0f b7 88 a8 00 00 00 	movzx  ecx,WORD PTR [rax+0xa8]
   14087979a:	e8 81 5a ed ff       	call   0x14074f220
   14087979f:	e9 3c 07 00 00       	jmp    0x140879ee0
   1408797a4:	48 8d 15 4d a0 e3 00 	lea    rdx,[rip+0xe3a04d]        # 0x1416b37f8
   1408797ab:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408797af:	e8 cc 5d 7f ff       	call   0x14006f580
   1408797b4:	48 8d b7 88 00 00 00 	lea    rsi,[rdi+0x88]
   1408797bb:	49 63 fd             	movsxd rdi,r13d
   1408797be:	48 8b d7             	mov    rdx,rdi
   1408797c1:	48 8b ce             	mov    rcx,rsi
   1408797c4:	e8 57 5a 7f ff       	call   0x14006f220
   1408797c9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408797cc:	48 8b d7             	mov    rdx,rdi
   1408797cf:	83 79 24 ff          	cmp    DWORD PTR [rcx+0x24],0xffffffff
   1408797d3:	48 8b ce             	mov    rcx,rsi
   1408797d6:	0f 84 ed 01 00 00    	je     0x1408799c9
   1408797dc:	e8 3f 5a 7f ff       	call   0x14006f220
   1408797e1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408797e4:	8b 52 24             	mov    edx,DWORD PTR [rdx+0x24]
   1408797e7:	48 8d 0d 62 bc b6 01 	lea    rcx,[rip+0x1b6bc62]        # 0x1423e5450
   1408797ee:	e8 ed 8e 7f ff       	call   0x1400726e0
   1408797f3:	48 8b d8             	mov    rbx,rax
   1408797f6:	48 85 c0             	test   rax,rax
   1408797f9:	0f 84 0f 01 00 00    	je     0x14087990e
   1408797ff:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879803:	e8 88 5e 7f ff       	call   0x14006f690
   140879808:	90                   	nop
   140879809:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087980f:	45 33 c0             	xor    r8d,r8d
   140879812:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879816:	48 8b cb             	mov    rcx,rbx
   140879819:	e8 32 bc 3e 00       	call   0x140c65450
   14087981e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879822:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879826:	e8 e5 04 84 ff       	call   0x1400b9d10
   14087982b:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   14087982e:	48 8b cb             	mov    rcx,rbx
   140879831:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   140879837:	48 8b d8             	mov    rbx,rax
   14087983a:	48 85 c0             	test   rax,rax
   14087983d:	0f 84 c2 00 00 00    	je     0x140879905
   140879843:	48 8b d7             	mov    rdx,rdi
   140879846:	48 8b ce             	mov    rcx,rsi
   140879849:	e8 d2 59 7f ff       	call   0x14006f220
   14087984e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879851:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140879855:	85 c0                	test   eax,eax
   140879857:	0f 88 a8 00 00 00    	js     0x140879905
   14087985d:	48 8b f8             	mov    rdi,rax
   140879860:	48 8b cb             	mov    rcx,rbx
   140879863:	e8 e8 55 7f ff       	call   0x14006ee50
   140879868:	48 3b f8             	cmp    rdi,rax
   14087986b:	0f 83 94 00 00 00    	jae    0x140879905
   140879871:	48 8d 15 c4 ee d6 00 	lea    rdx,[rip+0xd6eec4]        # 0x1415e873c
   140879878:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087987c:	e8 df 5c 7f ff       	call   0x14006f560
   140879881:	48 8b d7             	mov    rdx,rdi
   140879884:	48 8b cb             	mov    rcx,rbx
   140879887:	e8 94 59 7f ff       	call   0x14006f220
   14087988c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087988f:	48 83 c1 50          	add    rcx,0x50
   140879893:	e8 88 5c 7f ff       	call   0x14006f520
   140879898:	84 c0                	test   al,al
   14087989a:	75 4d                	jne    0x1408798e9
   14087989c:	48 8b d7             	mov    rdx,rdi
   14087989f:	48 8b cb             	mov    rcx,rbx
   1408798a2:	e8 79 59 7f ff       	call   0x14006f220
   1408798a7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408798aa:	48 83 c1 50          	add    rcx,0x50
   1408798ae:	48 8d 15 4b 8e de 00 	lea    rdx,[rip+0xde8e4b]        # 0x141662700
   1408798b5:	e8 c6 65 7f ff       	call   0x14006fe80
   1408798ba:	84 c0                	test   al,al
   1408798bc:	75 2b                	jne    0x1408798e9
   1408798be:	48 8b d7             	mov    rdx,rdi
   1408798c1:	48 8b cb             	mov    rcx,rbx
   1408798c4:	e8 57 59 7f ff       	call   0x14006f220
   1408798c9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408798cc:	48 83 c2 50          	add    rdx,0x50
   1408798d0:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408798d4:	e8 37 04 84 ff       	call   0x1400b9d10
   1408798d9:	48 8d 15 5c ee d6 00 	lea    rdx,[rip+0xd6ee5c]        # 0x1415e873c
   1408798e0:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408798e4:	e8 77 5c 7f ff       	call   0x14006f560
   1408798e9:	48 8b d7             	mov    rdx,rdi
   1408798ec:	48 8b cb             	mov    rcx,rbx
   1408798ef:	e8 2c 59 7f ff       	call   0x14006f220
   1408798f4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408798f7:	48 83 c2 10          	add    rdx,0x10
   1408798fb:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408798ff:	e8 0c 04 84 ff       	call   0x1400b9d10
   140879904:	90                   	nop
   140879905:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879909:	e8 22 e5 7e ff       	call   0x140067e30
   14087990e:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   140879913:	48 8d 15 c6 4c d7 00 	lea    rdx,[rip+0xd74cc6]        # 0x1415ee5e0
   14087991a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087991e:	e8 3d 5c 7f ff       	call   0x14006f560
   140879923:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140879927:	e8 64 5d 7f ff       	call   0x14006f690
   14087992c:	90                   	nop
   14087992d:	48 8d 4f 70          	lea    rcx,[rdi+0x70]
   140879931:	49 63 d5             	movsxd rdx,r13d
   140879934:	e8 e7 58 7f ff       	call   0x14006f220
   140879939:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087993f:	45 33 c0             	xor    r8d,r8d
   140879942:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   140879946:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879949:	e8 02 bb 3e 00       	call   0x140c65450
   14087994e:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   140879952:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879956:	e8 b5 03 84 ff       	call   0x1400b9d10
   14087995b:	48 8d 15 de bb d9 00 	lea    rdx,[rip+0xd9bbde]        # 0x141615540
   140879962:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879966:	e8 f5 5b 7f ff       	call   0x14006f560
   14087996b:	ba 2c 00 00 00       	mov    edx,0x2c
   140879970:	48 8b 0d 99 b7 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6b799]        # 0x1423e5110
   140879977:	e8 24 4e ac 00       	call   0x14133e7a0
   14087997c:	8b d8                	mov    ebx,eax
   14087997e:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879982:	e8 09 5d 7f ff       	call   0x14006f690
   140879987:	90                   	nop
   140879988:	8b d3                	mov    edx,ebx
   14087998a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087998e:	e8 2d 9e ef ff       	call   0x1407737c0
   140879993:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879997:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087999b:	e8 70 03 84 ff       	call   0x1400b9d10
   1408799a0:	90                   	nop
   1408799a1:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408799a5:	e8 86 e4 7e ff       	call   0x140067e30
   1408799aa:	48 8d 15 cf bb d9 00 	lea    rdx,[rip+0xd9bbcf]        # 0x141615580
   1408799b1:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408799b5:	e8 a6 5b 7f ff       	call   0x14006f560
   1408799ba:	90                   	nop
   1408799bb:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   1408799bf:	e8 6c e4 7e ff       	call   0x140067e30
   1408799c4:	e9 17 05 00 00       	jmp    0x140879ee0
   1408799c9:	e8 52 58 7f ff       	call   0x14006f220
   1408799ce:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408799d1:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   1408799d5:	85 c0                	test   eax,eax
   1408799d7:	0f 88 31 ff ff ff    	js     0x14087990e
   1408799dd:	48 8b d8             	mov    rbx,rax
   1408799e0:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   1408799e5:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
   1408799e9:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   1408799f0:	48 83 c1 18          	add    rcx,0x18
   1408799f4:	e8 57 54 7f ff       	call   0x14006ee50
   1408799f9:	48 3b d8             	cmp    rbx,rax
   1408799fc:	0f 83 11 ff ff ff    	jae    0x140879913
   140879a02:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
   140879a06:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   140879a0d:	48 83 c1 18          	add    rcx,0x18
   140879a11:	48 8b d3             	mov    rdx,rbx
   140879a14:	e8 07 58 7f ff       	call   0x14006f220
   140879a19:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140879a1c:	48 83 c2 40          	add    rdx,0x40
   140879a20:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879a24:	e8 e7 02 84 ff       	call   0x1400b9d10
   140879a29:	e9 e5 fe ff ff       	jmp    0x140879913
   140879a2e:	48 8d 15 cb 9d e3 00 	lea    rdx,[rip+0xe39dcb]        # 0x1416b3800
   140879a35:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879a39:	e8 42 5b 7f ff       	call   0x14006f580
   140879a3e:	48 8d 77 58          	lea    rsi,[rdi+0x58]
   140879a42:	49 63 fd             	movsxd rdi,r13d
   140879a45:	48 8b d7             	mov    rdx,rdi
   140879a48:	48 8b ce             	mov    rcx,rsi
   140879a4b:	e8 d0 57 7f ff       	call   0x14006f220
   140879a50:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879a53:	48 8b d7             	mov    rdx,rdi
   140879a56:	83 79 24 ff          	cmp    DWORD PTR [rcx+0x24],0xffffffff
   140879a5a:	48 8b ce             	mov    rcx,rsi
   140879a5d:	0f 84 34 01 00 00    	je     0x140879b97
   140879a63:	e8 b8 57 7f ff       	call   0x14006f220
   140879a68:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140879a6b:	8b 52 24             	mov    edx,DWORD PTR [rdx+0x24]
   140879a6e:	48 8d 0d db b9 b6 01 	lea    rcx,[rip+0x1b6b9db]        # 0x1423e5450
   140879a75:	e8 66 8c 7f ff       	call   0x1400726e0
   140879a7a:	48 8b d8             	mov    rbx,rax
   140879a7d:	48 85 c0             	test   rax,rax
   140879a80:	0f 84 69 01 00 00    	je     0x140879bef
   140879a86:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879a8a:	e8 01 5c 7f ff       	call   0x14006f690
   140879a8f:	90                   	nop
   140879a90:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140879a96:	45 33 c0             	xor    r8d,r8d
   140879a99:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879a9d:	48 8b cb             	mov    rcx,rbx
   140879aa0:	e8 ab b9 3e 00       	call   0x140c65450
   140879aa5:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879aa9:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879aad:	e8 5e 02 84 ff       	call   0x1400b9d10
   140879ab2:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140879ab5:	48 8b cb             	mov    rcx,rbx
   140879ab8:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   140879abe:	48 8b d8             	mov    rbx,rax
   140879ac1:	48 85 c0             	test   rax,rax
   140879ac4:	0f 84 c2 00 00 00    	je     0x140879b8c
   140879aca:	48 8b d7             	mov    rdx,rdi
   140879acd:	48 8b ce             	mov    rcx,rsi
   140879ad0:	e8 4b 57 7f ff       	call   0x14006f220
   140879ad5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879ad8:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140879adc:	85 c0                	test   eax,eax
   140879ade:	0f 88 a8 00 00 00    	js     0x140879b8c
   140879ae4:	48 8b f8             	mov    rdi,rax
   140879ae7:	48 8b cb             	mov    rcx,rbx
   140879aea:	e8 61 53 7f ff       	call   0x14006ee50
   140879aef:	48 3b f8             	cmp    rdi,rax
   140879af2:	0f 83 94 00 00 00    	jae    0x140879b8c
   140879af8:	48 8d 15 3d ec d6 00 	lea    rdx,[rip+0xd6ec3d]        # 0x1415e873c
   140879aff:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879b03:	e8 58 5a 7f ff       	call   0x14006f560
   140879b08:	48 8b d7             	mov    rdx,rdi
   140879b0b:	48 8b cb             	mov    rcx,rbx
   140879b0e:	e8 0d 57 7f ff       	call   0x14006f220
   140879b13:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879b16:	48 83 c1 50          	add    rcx,0x50
   140879b1a:	e8 01 5a 7f ff       	call   0x14006f520
   140879b1f:	84 c0                	test   al,al
   140879b21:	75 4d                	jne    0x140879b70
   140879b23:	48 8b d7             	mov    rdx,rdi
   140879b26:	48 8b cb             	mov    rcx,rbx
   140879b29:	e8 f2 56 7f ff       	call   0x14006f220
   140879b2e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879b31:	48 83 c1 50          	add    rcx,0x50
   140879b35:	48 8d 15 c4 8b de 00 	lea    rdx,[rip+0xde8bc4]        # 0x141662700
   140879b3c:	e8 3f 63 7f ff       	call   0x14006fe80
   140879b41:	84 c0                	test   al,al
   140879b43:	75 2b                	jne    0x140879b70
   140879b45:	48 8b d7             	mov    rdx,rdi
   140879b48:	48 8b cb             	mov    rcx,rbx
   140879b4b:	e8 d0 56 7f ff       	call   0x14006f220
   140879b50:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140879b53:	48 83 c2 50          	add    rdx,0x50
   140879b57:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879b5b:	e8 b0 01 84 ff       	call   0x1400b9d10
   140879b60:	48 8d 15 d5 eb d6 00 	lea    rdx,[rip+0xd6ebd5]        # 0x1415e873c
   140879b67:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879b6b:	e8 f0 59 7f ff       	call   0x14006f560
   140879b70:	48 8b d7             	mov    rdx,rdi
   140879b73:	48 8b cb             	mov    rcx,rbx
   140879b76:	e8 a5 56 7f ff       	call   0x14006f220
   140879b7b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140879b7e:	48 83 c2 10          	add    rdx,0x10
   140879b82:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879b86:	e8 85 01 84 ff       	call   0x1400b9d10
   140879b8b:	90                   	nop
   140879b8c:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879b90:	e8 9b e2 7e ff       	call   0x140067e30
   140879b95:	eb 58                	jmp    0x140879bef
   140879b97:	e8 84 56 7f ff       	call   0x14006f220
   140879b9c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879b9f:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140879ba3:	85 c0                	test   eax,eax
   140879ba5:	78 48                	js     0x140879bef
   140879ba7:	48 8b d8             	mov    rbx,rax
   140879baa:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   140879baf:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
   140879bb3:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   140879bba:	48 83 c1 18          	add    rcx,0x18
   140879bbe:	e8 8d 52 7f ff       	call   0x14006ee50
   140879bc3:	48 3b d8             	cmp    rbx,rax
   140879bc6:	73 27                	jae    0x140879bef
   140879bc8:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
   140879bcc:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   140879bd3:	48 83 c1 18          	add    rcx,0x18
   140879bd7:	48 8b d3             	mov    rdx,rbx
   140879bda:	e8 41 56 7f ff       	call   0x14006f220
   140879bdf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140879be2:	48 83 c2 40          	add    rdx,0x40
   140879be6:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879bea:	e8 21 01 84 ff       	call   0x1400b9d10
   140879bef:	48 8d 15 ea 49 d7 00 	lea    rdx,[rip+0xd749ea]        # 0x1415ee5e0
   140879bf6:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879bfa:	e8 61 59 7f ff       	call   0x14006f560
   140879bff:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140879c03:	e8 88 5a 7f ff       	call   0x14006f690
   140879c08:	90                   	nop
   140879c09:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   140879c0e:	49 63 dd             	movsxd rbx,r13d
   140879c11:	48 8b d3             	mov    rdx,rbx
   140879c14:	48 8d 4f 40          	lea    rcx,[rdi+0x40]
   140879c18:	e8 03 56 7f ff       	call   0x14006f220
   140879c1d:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140879c23:	45 33 c0             	xor    r8d,r8d
   140879c26:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   140879c2a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140879c2d:	e8 1e b8 3e 00       	call   0x140c65450
   140879c32:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   140879c36:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879c3a:	e8 d1 00 84 ff       	call   0x1400b9d10
   140879c3f:	48 8d 15 fa b8 d9 00 	lea    rdx,[rip+0xd9b8fa]        # 0x141615540
   140879c46:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879c4a:	e8 11 59 7f ff       	call   0x14006f560
   140879c4f:	48 8b d3             	mov    rdx,rbx
   140879c52:	48 8d 4f 40          	lea    rcx,[rdi+0x40]
   140879c56:	e8 c5 55 7f ff       	call   0x14006f220
   140879c5b:	41 b0 01             	mov    r8b,0x1
   140879c5e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140879c61:	48 8b 0d a8 b4 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6b4a8]        # 0x1423e5110
   140879c68:	e8 93 4a ac 00       	call   0x14133e700
   140879c6d:	8b d8                	mov    ebx,eax
   140879c6f:	ba 61 00 00 00       	mov    edx,0x61
   140879c74:	48 8b 0d 95 b4 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6b495]        # 0x1423e5110
   140879c7b:	e8 20 4b ac 00       	call   0x14133e7a0
   140879c80:	8b f8                	mov    edi,eax
   140879c82:	c1 ff 02             	sar    edi,0x2
   140879c85:	3b fb                	cmp    edi,ebx
   140879c87:	0f 4e fb             	cmovle edi,ebx
   140879c8a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879c8e:	e8 fd 59 7f ff       	call   0x14006f690
   140879c93:	90                   	nop
   140879c94:	8b d7                	mov    edx,edi
   140879c96:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879c9a:	e8 21 9b ef ff       	call   0x1407737c0
   140879c9f:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879ca3:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879ca7:	e8 64 00 84 ff       	call   0x1400b9d10
   140879cac:	90                   	nop
   140879cad:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879cb1:	e8 7a e1 7e ff       	call   0x140067e30
   140879cb6:	48 8d 15 c3 b8 d9 00 	lea    rdx,[rip+0xd9b8c3]        # 0x141615580
   140879cbd:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879cc1:	e8 9a 58 7f ff       	call   0x14006f560
   140879cc6:	90                   	nop
   140879cc7:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140879ccb:	e8 60 e1 7e ff       	call   0x140067e30
   140879cd0:	e9 0b 02 00 00       	jmp    0x140879ee0
   140879cd5:	48 8d 8f d8 00 00 00 	lea    rcx,[rdi+0xd8]
   140879cdc:	49 63 d5             	movsxd rdx,r13d
   140879cdf:	e8 7c 56 7f ff       	call   0x14006f360
   140879ce4:	8b 10                	mov    edx,DWORD PTR [rax]
   140879ce6:	85 d2                	test   edx,edx
   140879ce8:	0f 84 e2 01 00 00    	je     0x140879ed0
   140879cee:	83 ea 01             	sub    edx,0x1
   140879cf1:	0f 84 d0 01 00 00    	je     0x140879ec7
   140879cf7:	83 ea 01             	sub    edx,0x1
   140879cfa:	0f 84 d6 00 00 00    	je     0x140879dd6
   140879d00:	83 ea 01             	sub    edx,0x1
   140879d03:	74 6d                	je     0x140879d72
   140879d05:	83 fa 01             	cmp    edx,0x1
   140879d08:	0f 85 d2 01 00 00    	jne    0x140879ee0
   140879d0e:	48 8d 15 7b 9c e3 00 	lea    rdx,[rip+0xe39c7b]        # 0x1416b3990
   140879d15:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879d19:	e8 62 58 7f ff       	call   0x14006f580
   140879d1e:	ba 67 00 00 00       	mov    edx,0x67
   140879d23:	48 8b 0d e6 b3 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6b3e6]        # 0x1423e5110
   140879d2a:	e8 71 4a ac 00       	call   0x14133e7a0
   140879d2f:	8b d8                	mov    ebx,eax
   140879d31:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879d35:	e8 56 59 7f ff       	call   0x14006f690
   140879d3a:	90                   	nop
   140879d3b:	8b d3                	mov    edx,ebx
   140879d3d:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879d41:	e8 7a 9a ef ff       	call   0x1407737c0
   140879d46:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879d4a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879d4e:	e8 bd ff 83 ff       	call   0x1400b9d10
   140879d53:	48 8d 15 26 b8 d9 00 	lea    rdx,[rip+0xd9b826]        # 0x141615580
   140879d5a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879d5e:	e8 fd 57 7f ff       	call   0x14006f560
   140879d63:	90                   	nop
   140879d64:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879d68:	e8 c3 e0 7e ff       	call   0x140067e30
   140879d6d:	e9 6e 01 00 00       	jmp    0x140879ee0
   140879d72:	48 8d 15 1f 9c e3 00 	lea    rdx,[rip+0xe39c1f]        # 0x1416b3998
   140879d79:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879d7d:	e8 fe 57 7f ff       	call   0x14006f580
   140879d82:	ba 2c 00 00 00       	mov    edx,0x2c
   140879d87:	48 8b 0d 82 b3 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6b382]        # 0x1423e5110
   140879d8e:	e8 0d 4a ac 00       	call   0x14133e7a0
   140879d93:	8b d8                	mov    ebx,eax
   140879d95:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879d99:	e8 f2 58 7f ff       	call   0x14006f690
   140879d9e:	90                   	nop
   140879d9f:	8b d3                	mov    edx,ebx
   140879da1:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879da5:	e8 16 9a ef ff       	call   0x1407737c0
   140879daa:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879dae:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879db2:	e8 59 ff 83 ff       	call   0x1400b9d10
   140879db7:	48 8d 15 c2 b7 d9 00 	lea    rdx,[rip+0xd9b7c2]        # 0x141615580
   140879dbe:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879dc2:	e8 99 57 7f ff       	call   0x14006f560
   140879dc7:	90                   	nop
   140879dc8:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879dcc:	e8 5f e0 7e ff       	call   0x140067e30
   140879dd1:	e9 0a 01 00 00       	jmp    0x140879ee0
   140879dd6:	48 8d 15 9b 9b e3 00 	lea    rdx,[rip+0xe39b9b]        # 0x1416b3978
   140879ddd:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879de1:	e8 9a 57 7f ff       	call   0x14006f580
   140879de6:	33 ff                	xor    edi,edi
   140879de8:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   140879ded:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   140879df1:	48 8d 4b 40          	lea    rcx,[rbx+0x40]
   140879df5:	e8 46 54 7f ff       	call   0x14006f240
   140879dfa:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   140879dfe:	48 8d 4b 40          	lea    rcx,[rbx+0x40]
   140879e02:	e8 29 54 7f ff       	call   0x14006f230
   140879e07:	4c 8d 45 a8          	lea    r8,[rbp-0x58]
   140879e0b:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   140879e0f:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   140879e13:	e8 08 50 7f ff       	call   0x14006ee20
   140879e18:	33 d2                	xor    edx,edx
   140879e1a:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   140879e1d:	e8 8e b9 7e ff       	call   0x1400657b0
   140879e22:	84 c0                	test   al,al
   140879e24:	74 63                	je     0x140879e89
   140879e26:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   140879e2a:	e8 e1 4f 7f ff       	call   0x14006ee10
   140879e2f:	41 b0 01             	mov    r8b,0x1
   140879e32:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140879e35:	48 8b 0d d4 b2 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6b2d4]        # 0x1423e5110
   140879e3c:	e8 bf 48 ac 00       	call   0x14133e700
   140879e41:	8b d8                	mov    ebx,eax
   140879e43:	ba 61 00 00 00       	mov    edx,0x61
   140879e48:	48 8b 0d c1 b2 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6b2c1]        # 0x1423e5110
   140879e4f:	e8 4c 49 ac 00       	call   0x14133e7a0
   140879e54:	c1 f8 02             	sar    eax,0x2
   140879e57:	3b c3                	cmp    eax,ebx
   140879e59:	0f 4e c3             	cmovle eax,ebx
   140879e5c:	3b c7                	cmp    eax,edi
   140879e5e:	0f 4f f8             	cmovg  edi,eax
   140879e61:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   140879e65:	e8 96 4f 7f ff       	call   0x14006ee00
   140879e6a:	4c 8d 45 a8          	lea    r8,[rbp-0x58]
   140879e6e:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   140879e72:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   140879e76:	e8 a5 4f 7f ff       	call   0x14006ee20
   140879e7b:	33 d2                	xor    edx,edx
   140879e7d:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   140879e80:	e8 2b b9 7e ff       	call   0x1400657b0
   140879e85:	84 c0                	test   al,al
   140879e87:	75 9d                	jne    0x140879e26
   140879e89:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879e8d:	e8 fe 57 7f ff       	call   0x14006f690
   140879e92:	90                   	nop
   140879e93:	8b d7                	mov    edx,edi
   140879e95:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879e99:	e8 22 99 ef ff       	call   0x1407737c0
   140879e9e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140879ea2:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879ea6:	e8 65 fe 83 ff       	call   0x1400b9d10
   140879eab:	48 8d 15 ce b6 d9 00 	lea    rdx,[rip+0xd9b6ce]        # 0x141615580
   140879eb2:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879eb6:	e8 a5 56 7f ff       	call   0x14006f560
   140879ebb:	90                   	nop
   140879ebc:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879ec0:	e8 6b df 7e ff       	call   0x140067e30
   140879ec5:	eb 19                	jmp    0x140879ee0
   140879ec7:	48 8d 15 d2 a0 d9 00 	lea    rdx,[rip+0xd9a0d2]        # 0x141613fa0
   140879ece:	eb 07                	jmp    0x140879ed7
   140879ed0:	48 8d 15 c5 aa d9 00 	lea    rdx,[rip+0xd9aac5]        # 0x14161499c
   140879ed7:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879edb:	e8 a0 56 7f ff       	call   0x14006f580
   140879ee0:	45 33 c9             	xor    r9d,r9d
   140879ee3:	45 33 c0             	xor    r8d,r8d
   140879ee6:	48 8d 55 38          	lea    rdx,[rbp+0x38]
   140879eea:	48 8d 0d ff 04 dd 01 	lea    rcx,[rip+0x1dd04ff]        # 0x14264a3f0
   140879ef1:	e8 6a fa 25 00       	call   0x140ad9960
   140879ef6:	41 83 c4 03          	add    r12d,0x3
   140879efa:	44 89 65 80          	mov    DWORD PTR [rbp-0x80],r12d
   140879efe:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140879f02:	e8 29 df 7e ff       	call   0x140067e30
   140879f07:	41 ff c5             	inc    r13d
   140879f0a:	44 89 6c 24 78       	mov    DWORD PTR [rsp+0x78],r13d
   140879f0f:	44 3b 6c 24 64       	cmp    r13d,DWORD PTR [rsp+0x64]
   140879f14:	48 8b 5d a0          	mov    rbx,QWORD PTR [rbp-0x60]
   140879f18:	0f 8c 52 f6 ff ff    	jl     0x140879570
   140879f1e:	8b 7c 24 60          	mov    edi,DWORD PTR [rsp+0x60]
   140879f22:	8b 75 98             	mov    esi,DWORD PTR [rbp-0x68]
   140879f25:	3b df                	cmp    ebx,edi
   140879f27:	0f 8e f2 60 00 00    	jle    0x14088001f
   140879f2d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879f31:	e8 2a 14 84 ff       	call   0x1400bb360
   140879f36:	8d 4f ff             	lea    ecx,[rdi-0x1]
   140879f39:	8d 0c 4e             	lea    ecx,[rsi+rcx*2]
   140879f3c:	03 cf                	add    ecx,edi
   140879f3e:	8d 46 01             	lea    eax,[rsi+0x1]
   140879f41:	44 8d 4b ff          	lea    r9d,[rbx-0x1]
   140879f45:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   140879f49:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   140879f4d:	89 7c 24 20          	mov    DWORD PTR [rsp+0x20],edi
   140879f51:	45 33 c0             	xor    r8d,r8d
   140879f54:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   140879f59:	8b 93 f0 00 00 00    	mov    edx,DWORD PTR [rbx+0xf0]
   140879f5f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879f63:	e8 18 14 84 ff       	call   0x1400bb380
   140879f68:	45 8d 4e 01          	lea    r9d,[r14+0x1]
   140879f6c:	0f b6 83 f4 00 00 00 	movzx  eax,BYTE PTR [rbx+0xf4]
   140879f73:	e9 8b 60 00 00       	jmp    0x140880003
   140879f78:	44 8b 35 b9 6b dc 01 	mov    r14d,DWORD PTR [rip+0x1dc6bb9]        # 0x142640b38
   140879f7f:	44 89 75 88          	mov    DWORD PTR [rbp-0x78],r14d
   140879f83:	44 8b 7c 24 68       	mov    r15d,DWORD PTR [rsp+0x68]
   140879f88:	41 ff c7             	inc    r15d
   140879f8b:	44 89 7d 8c          	mov    DWORD PTR [rbp-0x74],r15d
   140879f8f:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   140879f93:	41 ff c8             	dec    r8d
   140879f96:	44 8d 67 02          	lea    r12d,[rdi+0x2]
   140879f9a:	44 89 65 84          	mov    DWORD PTR [rbp-0x7c],r12d
   140879f9e:	8b 4d b0             	mov    ecx,DWORD PTR [rbp-0x50]
   140879fa1:	ff c9                	dec    ecx
   140879fa3:	41 2b cc             	sub    ecx,r12d
   140879fa6:	ff c1                	inc    ecx
   140879fa8:	b8 56 55 55 55       	mov    eax,0x55555556
   140879fad:	f7 e9                	imul   ecx
   140879faf:	8b da                	mov    ebx,edx
   140879fb1:	c1 eb 1f             	shr    ebx,0x1f
   140879fb4:	03 da                	add    ebx,edx
   140879fb6:	89 5d 98             	mov    DWORD PTR [rbp-0x68],ebx
   140879fb9:	41 8d 70 fe          	lea    esi,[r8-0x2]
   140879fbd:	44 3b f3             	cmp    r14d,ebx
   140879fc0:	41 0f 4e f0          	cmovle esi,r8d
   140879fc4:	89 75 80             	mov    DWORD PTR [rbp-0x80],esi
   140879fc7:	41 8b 85 f8 00 00 00 	mov    eax,DWORD PTR [r13+0xf8]
   140879fce:	41 8b ce             	mov    ecx,r14d
   140879fd1:	2b cb                	sub    ecx,ebx
   140879fd3:	3b c1                	cmp    eax,ecx
   140879fd5:	0f 4e c8             	cmovle ecx,eax
   140879fd8:	33 c0                	xor    eax,eax
   140879fda:	85 c9                	test   ecx,ecx
   140879fdc:	0f 49 c1             	cmovns eax,ecx
   140879fdf:	89 44 24 64          	mov    DWORD PTR [rsp+0x64],eax
   140879fe3:	8b f8                	mov    edi,eax
   140879fe5:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140879fe9:	03 c3                	add    eax,ebx
   140879feb:	89 44 24 60          	mov    DWORD PTR [rsp+0x60],eax
   140879fef:	3b f8                	cmp    edi,eax
   140879ff1:	0f 8d 77 08 00 00    	jge    0x14087a86e
   140879ff7:	41 ff c4             	inc    r12d
   140879ffa:	44 89 64 24 7c       	mov    DWORD PTR [rsp+0x7c],r12d
   140879fff:	48 8d 1d 42 24 dd 01 	lea    rbx,[rip+0x1dd2442]        # 0x14264c448
   14087a006:	41 3b fe             	cmp    edi,r14d
   14087a009:	0f 8d 53 08 00 00    	jge    0x14087a862
   14087a00f:	48 63 d7             	movsxd rdx,edi
   14087a012:	48 8d 0d ff 6a dc 01 	lea    rcx,[rip+0x1dc6aff]        # 0x142640b18
   14087a019:	e8 02 52 7f ff       	call   0x14006f220
   14087a01e:	4c 8b 28             	mov    r13,QWORD PTR [rax]
   14087a021:	4c 89 6d a8          	mov    QWORD PTR [rbp-0x58],r13
   14087a025:	45 33 c0             	xor    r8d,r8d
   14087a028:	ba 07 00 00 00       	mov    edx,0x7
   14087a02d:	41 b1 01             	mov    r9b,0x1
   14087a030:	48 8d 0d b9 03 dd 01 	lea    rcx,[rip+0x1dd03b9]        # 0x14264a3f0
   14087a037:	e8 f4 10 84 ff       	call   0x1400bb130
   14087a03c:	41 8b ff             	mov    edi,r15d
   14087a03f:	44 3b fe             	cmp    r15d,esi
   14087a042:	0f 8f 00 01 00 00    	jg     0x14087a148
   14087a048:	45 8d 74 24 02       	lea    r14d,[r12+0x2]
   14087a04d:	41 ff cc             	dec    r12d
   14087a050:	4c 8d 2d 99 03 dd 01 	lea    r13,[rip+0x1dd0399]        # 0x14264a3f0
   14087a057:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087a060:	41 8b dc             	mov    ebx,r12d
   14087a063:	45 3b e6             	cmp    r12d,r14d
   14087a066:	0f 8d c2 00 00 00    	jge    0x14087a12e
   14087a06c:	3b fe                	cmp    edi,esi
   14087a06e:	75 5d                	jne    0x14087a0cd
   14087a070:	48 8d 35 39 1d dd 01 	lea    rsi,[rip+0x1dd1d39]        # 0x14264bdb0
   14087a077:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087a080:	44 8b c7             	mov    r8d,edi
   14087a083:	8b d3                	mov    edx,ebx
   14087a085:	49 8b cd             	mov    rcx,r13
   14087a088:	e8 93 10 84 ff       	call   0x1400bb120
   14087a08d:	49 8b cd             	mov    rcx,r13
   14087a090:	41 3b ff             	cmp    edi,r15d
   14087a093:	75 05                	jne    0x14087a09a
   14087a095:	8b 56 e8             	mov    edx,DWORD PTR [rsi-0x18]
   14087a098:	eb 02                	jmp    0x14087a09c
   14087a09a:	8b 16                	mov    edx,DWORD PTR [rsi]
   14087a09c:	e8 2f 0a 26 00       	call   0x140adaad0
   14087a0a1:	33 d2                	xor    edx,edx
   14087a0a3:	48 8d 0d c6 36 b5 01 	lea    rcx,[rip+0x1b536c6]        # 0x1423cd770
   14087a0aa:	e8 e1 7e 7f ff       	call   0x140071f90
   14087a0af:	84 c0                	test   al,al
   14087a0b1:	74 0d                	je     0x14087a0c0
   14087a0b3:	41 b0 01             	mov    r8b,0x1
   14087a0b6:	33 d2                	xor    edx,edx
   14087a0b8:	49 8b cd             	mov    rcx,r13
   14087a0bb:	e8 d0 10 84 ff       	call   0x1400bb190
   14087a0c0:	ff c3                	inc    ebx
   14087a0c2:	48 83 c6 04          	add    rsi,0x4
   14087a0c6:	41 3b de             	cmp    ebx,r14d
   14087a0c9:	7c b5                	jl     0x14087a080
   14087a0cb:	eb 5e                	jmp    0x14087a12b
   14087a0cd:	48 8d 35 d0 1c dd 01 	lea    rsi,[rip+0x1dd1cd0]        # 0x14264bda4
   14087a0d4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087a0d8:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14087a0e0:	44 8b c7             	mov    r8d,edi
   14087a0e3:	8b d3                	mov    edx,ebx
   14087a0e5:	49 8b cd             	mov    rcx,r13
   14087a0e8:	e8 33 10 84 ff       	call   0x1400bb120
   14087a0ed:	49 8b cd             	mov    rcx,r13
   14087a0f0:	41 3b ff             	cmp    edi,r15d
   14087a0f3:	75 05                	jne    0x14087a0fa
   14087a0f5:	8b 56 f4             	mov    edx,DWORD PTR [rsi-0xc]
   14087a0f8:	eb 02                	jmp    0x14087a0fc
   14087a0fa:	8b 16                	mov    edx,DWORD PTR [rsi]
   14087a0fc:	e8 cf 09 26 00       	call   0x140adaad0
   14087a101:	33 d2                	xor    edx,edx
   14087a103:	48 8d 0d 66 36 b5 01 	lea    rcx,[rip+0x1b53666]        # 0x1423cd770
   14087a10a:	e8 81 7e 7f ff       	call   0x140071f90
   14087a10f:	84 c0                	test   al,al
   14087a111:	74 0d                	je     0x14087a120
   14087a113:	41 b0 01             	mov    r8b,0x1
   14087a116:	33 d2                	xor    edx,edx
   14087a118:	49 8b cd             	mov    rcx,r13
   14087a11b:	e8 70 10 84 ff       	call   0x1400bb190
   14087a120:	ff c3                	inc    ebx
   14087a122:	48 83 c6 04          	add    rsi,0x4
   14087a126:	41 3b de             	cmp    ebx,r14d
   14087a129:	7c b5                	jl     0x14087a0e0
   14087a12b:	8b 75 80             	mov    esi,DWORD PTR [rbp-0x80]
   14087a12e:	ff c7                	inc    edi
   14087a130:	3b fe                	cmp    edi,esi
   14087a132:	0f 8e 28 ff ff ff    	jle    0x14087a060
   14087a138:	4c 8b 6d a8          	mov    r13,QWORD PTR [rbp-0x58]
   14087a13c:	44 8b 64 24 7c       	mov    r12d,DWORD PTR [rsp+0x7c]
   14087a141:	48 8d 1d 00 23 dd 01 	lea    rbx,[rip+0x1dd2300]        # 0x14264c448
   14087a148:	41 0f bf 55 00       	movsx  edx,WORD PTR [r13+0x0]
   14087a14d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087a152:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087a156:	e8 05 37 9f ff       	call   0x14026d860
   14087a15b:	83 f8 ff             	cmp    eax,0xffffffff
   14087a15e:	0f 84 8e 00 00 00    	je     0x14087a1f2
   14087a164:	48 98                	cdqe
   14087a166:	45 8d 74 24 ff       	lea    r14d,[r12-0x1]
   14087a16b:	4c 8d 24 40          	lea    r12,[rax+rax*2]
   14087a16f:	49 c1 e4 04          	shl    r12,0x4
   14087a173:	4c 03 e3             	add    r12,rbx
   14087a176:	41 bd 03 00 00 00    	mov    r13d,0x3
   14087a17c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087a180:	41 8b df             	mov    ebx,r15d
   14087a183:	49 8b fc             	mov    rdi,r12
   14087a186:	be 04 00 00 00       	mov    esi,0x4
   14087a18b:	4c 8d 3d 5e 02 dd 01 	lea    r15,[rip+0x1dd025e]        # 0x14264a3f0
   14087a192:	44 8b c3             	mov    r8d,ebx
   14087a195:	41 8b d6             	mov    edx,r14d
   14087a198:	49 8b cf             	mov    rcx,r15
   14087a19b:	e8 80 0f 84 ff       	call   0x1400bb120
   14087a1a0:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087a1a2:	49 8b cf             	mov    rcx,r15
   14087a1a5:	e8 26 09 26 00       	call   0x140adaad0
   14087a1aa:	33 d2                	xor    edx,edx
   14087a1ac:	48 8d 0d bd 35 b5 01 	lea    rcx,[rip+0x1b535bd]        # 0x1423cd770
   14087a1b3:	e8 d8 7d 7f ff       	call   0x140071f90
   14087a1b8:	84 c0                	test   al,al
   14087a1ba:	74 0d                	je     0x14087a1c9
   14087a1bc:	41 b0 01             	mov    r8b,0x1
   14087a1bf:	33 d2                	xor    edx,edx
   14087a1c1:	49 8b cf             	mov    rcx,r15
   14087a1c4:	e8 c7 0f 84 ff       	call   0x1400bb190
   14087a1c9:	ff c3                	inc    ebx
   14087a1cb:	48 83 c7 0c          	add    rdi,0xc
   14087a1cf:	48 83 ee 01          	sub    rsi,0x1
   14087a1d3:	75 bd                	jne    0x14087a192
   14087a1d5:	41 ff c6             	inc    r14d
   14087a1d8:	49 83 c4 04          	add    r12,0x4
   14087a1dc:	49 83 ed 01          	sub    r13,0x1
   14087a1e0:	44 8b 7d 8c          	mov    r15d,DWORD PTR [rbp-0x74]
   14087a1e4:	75 9a                	jne    0x14087a180
   14087a1e6:	4c 8b 6d a8          	mov    r13,QWORD PTR [rbp-0x58]
   14087a1ea:	8b 75 80             	mov    esi,DWORD PTR [rbp-0x80]
   14087a1ed:	44 8b 64 24 7c       	mov    r12d,DWORD PTR [rsp+0x7c]
   14087a1f2:	45 8d 47 04          	lea    r8d,[r15+0x4]
   14087a1f6:	41 8b d4             	mov    edx,r12d
   14087a1f9:	4c 8d 35 f0 01 dd 01 	lea    r14,[rip+0x1dd01f0]        # 0x14264a3f0
   14087a200:	49 8b ce             	mov    rcx,r14
   14087a203:	e8 18 0f 84 ff       	call   0x1400bb120
   14087a208:	8b 7c 24 78          	mov    edi,DWORD PTR [rsp+0x78]
   14087a20c:	8b d7                	mov    edx,edi
   14087a20e:	2b 54 24 64          	sub    edx,DWORD PTR [rsp+0x64]
   14087a212:	83 c2 52             	add    edx,0x52
   14087a215:	45 33 c0             	xor    r8d,r8d
   14087a218:	48 8d 0d d1 3f 03 01 	lea    rcx,[rip+0x1033fd1]        # 0x1418ae1f0
   14087a21f:	e8 8c f2 3b 00       	call   0x140c394b0
   14087a224:	45 8d 47 06          	lea    r8d,[r15+0x6]
   14087a228:	41 8b d4             	mov    edx,r12d
   14087a22b:	49 8b ce             	mov    rcx,r14
   14087a22e:	e8 ed 0e 84 ff       	call   0x1400bb120
   14087a233:	48 8d 15 ce 95 e3 00 	lea    rdx,[rip+0xe395ce]        # 0x1416b3808
   14087a23a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a23e:	e8 0d df 7e ff       	call   0x140068150
   14087a243:	90                   	nop
   14087a244:	45 33 c9             	xor    r9d,r9d
   14087a247:	45 33 c0             	xor    r8d,r8d
   14087a24a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a24e:	49 8b ce             	mov    rcx,r14
   14087a251:	e8 0a f7 25 00       	call   0x140ad9960
   14087a256:	90                   	nop
   14087a257:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a25b:	e8 d0 db 7e ff       	call   0x140067e30
   14087a260:	45 33 c0             	xor    r8d,r8d
   14087a263:	ba 01 00 00 00       	mov    edx,0x1
   14087a268:	44 0f b6 ca          	movzx  r9d,dl
   14087a26c:	49 8b ce             	mov    rcx,r14
   14087a26f:	e8 bc 0e 84 ff       	call   0x1400bb130
   14087a274:	45 8d 47 06          	lea    r8d,[r15+0x6]
   14087a278:	41 8b d4             	mov    edx,r12d
   14087a27b:	49 8b ce             	mov    rcx,r14
   14087a27e:	e8 9d 0e 84 ff       	call   0x1400bb120
   14087a283:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a287:	e8 04 54 7f ff       	call   0x14006f690
   14087a28c:	90                   	nop
   14087a28d:	bb 02 00 00 00       	mov    ebx,0x2
   14087a292:	66 89 5c 24 20       	mov    WORD PTR [rsp+0x20],bx
   14087a297:	45 33 c9             	xor    r9d,r9d
   14087a29a:	45 0f b7 45 00       	movzx  r8d,WORD PTR [r13+0x0]
   14087a29f:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087a2a3:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087a2a8:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087a2ac:	e8 1f a3 ab 00       	call   0x1413345d0
   14087a2b1:	41 b9 24 00 00 00    	mov    r9d,0x24
   14087a2b7:	45 33 c0             	xor    r8d,r8d
   14087a2ba:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087a2be:	49 8b ce             	mov    rcx,r14
   14087a2c1:	e8 9a f6 25 00       	call   0x140ad9960
   14087a2c6:	45 8d 47 2c          	lea    r8d,[r15+0x2c]
   14087a2ca:	41 8b d4             	mov    edx,r12d
   14087a2cd:	49 8b ce             	mov    rcx,r14
   14087a2d0:	e8 4b 0e 84 ff       	call   0x1400bb120
   14087a2d5:	41 8b 45 04          	mov    eax,DWORD PTR [r13+0x4]
   14087a2d9:	41 f7 45 0c 00 80 00 00 	test   DWORD PTR [r13+0xc],0x8000
   14087a2e1:	8d 48 ff             	lea    ecx,[rax-0x1]
   14087a2e4:	0f 44 c8             	cmove  ecx,eax
   14087a2e7:	83 f9 fd             	cmp    ecx,0xfffffffd
   14087a2ea:	7f 3c                	jg     0x14087a328
   14087a2ec:	45 33 c0             	xor    r8d,r8d
   14087a2ef:	ba 05 00 00 00       	mov    edx,0x5
   14087a2f4:	41 b1 01             	mov    r9b,0x1
   14087a2f7:	49 8b ce             	mov    rcx,r14
   14087a2fa:	e8 31 0e 84 ff       	call   0x1400bb130
   14087a2ff:	48 8d 15 ba 94 e3 00 	lea    rdx,[rip+0xe394ba]        # 0x1416b37c0
   14087a306:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a30a:	e8 41 de 7e ff       	call   0x140068150
   14087a30f:	90                   	nop
   14087a310:	45 33 c9             	xor    r9d,r9d
   14087a313:	41 b0 03             	mov    r8b,0x3
   14087a316:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a31a:	49 8b ce             	mov    rcx,r14
   14087a31d:	e8 3e f6 25 00       	call   0x140ad9960
   14087a322:	90                   	nop
   14087a323:	e9 73 01 00 00       	jmp    0x14087a49b
   14087a328:	83 f9 fe             	cmp    ecx,0xfffffffe
   14087a32b:	75 3c                	jne    0x14087a369
   14087a32d:	45 33 c0             	xor    r8d,r8d
   14087a330:	ba 04 00 00 00       	mov    edx,0x4
   14087a335:	41 b1 01             	mov    r9b,0x1
   14087a338:	49 8b ce             	mov    rcx,r14
   14087a33b:	e8 f0 0d 84 ff       	call   0x1400bb130
   14087a340:	48 8d 15 61 94 e3 00 	lea    rdx,[rip+0xe39461]        # 0x1416b37a8
   14087a347:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a34b:	e8 00 de 7e ff       	call   0x140068150
   14087a350:	90                   	nop
   14087a351:	45 33 c9             	xor    r9d,r9d
   14087a354:	41 b0 03             	mov    r8b,0x3
   14087a357:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a35b:	49 8b ce             	mov    rcx,r14
   14087a35e:	e8 fd f5 25 00       	call   0x140ad9960
   14087a363:	90                   	nop
   14087a364:	e9 32 01 00 00       	jmp    0x14087a49b
   14087a369:	83 f9 ff             	cmp    ecx,0xffffffff
   14087a36c:	75 3c                	jne    0x14087a3aa
   14087a36e:	45 33 c0             	xor    r8d,r8d
   14087a371:	ba 06 00 00 00       	mov    edx,0x6
   14087a376:	41 b1 01             	mov    r9b,0x1
   14087a379:	49 8b ce             	mov    rcx,r14
   14087a37c:	e8 af 0d 84 ff       	call   0x1400bb130
   14087a381:	48 8d 15 60 94 e3 00 	lea    rdx,[rip+0xe39460]        # 0x1416b37e8
   14087a388:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a38c:	e8 bf dd 7e ff       	call   0x140068150
   14087a391:	90                   	nop
   14087a392:	45 33 c9             	xor    r9d,r9d
   14087a395:	41 b0 03             	mov    r8b,0x3
   14087a398:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a39c:	49 8b ce             	mov    rcx,r14
   14087a39f:	e8 bc f5 25 00       	call   0x140ad9960
   14087a3a4:	90                   	nop
   14087a3a5:	e9 f1 00 00 00       	jmp    0x14087a49b
   14087a3aa:	85 c9                	test   ecx,ecx
   14087a3ac:	75 3c                	jne    0x14087a3ea
   14087a3ae:	45 33 c0             	xor    r8d,r8d
   14087a3b1:	ba 07 00 00 00       	mov    edx,0x7
   14087a3b6:	41 b1 01             	mov    r9b,0x1
   14087a3b9:	49 8b ce             	mov    rcx,r14
   14087a3bc:	e8 6f 0d 84 ff       	call   0x1400bb130
   14087a3c1:	48 8d 15 10 94 e3 00 	lea    rdx,[rip+0xe39410]        # 0x1416b37d8
   14087a3c8:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a3cc:	e8 7f dd 7e ff       	call   0x140068150
   14087a3d1:	90                   	nop
   14087a3d2:	45 33 c9             	xor    r9d,r9d
   14087a3d5:	41 b0 03             	mov    r8b,0x3
   14087a3d8:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a3dc:	49 8b ce             	mov    rcx,r14
   14087a3df:	e8 7c f5 25 00       	call   0x140ad9960
   14087a3e4:	90                   	nop
   14087a3e5:	e9 b1 00 00 00       	jmp    0x14087a49b
   14087a3ea:	83 f9 01             	cmp    ecx,0x1
   14087a3ed:	75 36                	jne    0x14087a425
   14087a3ef:	45 33 c0             	xor    r8d,r8d
   14087a3f2:	8b d3                	mov    edx,ebx
   14087a3f4:	45 33 c9             	xor    r9d,r9d
   14087a3f7:	49 8b ce             	mov    rcx,r14
   14087a3fa:	e8 31 0d 84 ff       	call   0x1400bb130
   14087a3ff:	48 8d 15 92 94 e3 00 	lea    rdx,[rip+0xe39492]        # 0x1416b3898
   14087a406:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a40a:	e8 41 dd 7e ff       	call   0x140068150
   14087a40f:	90                   	nop
   14087a410:	45 33 c9             	xor    r9d,r9d
   14087a413:	41 b0 03             	mov    r8b,0x3
   14087a416:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a41a:	49 8b ce             	mov    rcx,r14
   14087a41d:	e8 3e f5 25 00       	call   0x140ad9960
   14087a422:	90                   	nop
   14087a423:	eb 76                	jmp    0x14087a49b
   14087a425:	3b cb                	cmp    ecx,ebx
   14087a427:	75 36                	jne    0x14087a45f
   14087a429:	45 33 c0             	xor    r8d,r8d
   14087a42c:	8b d3                	mov    edx,ebx
   14087a42e:	41 b1 01             	mov    r9b,0x1
   14087a431:	49 8b ce             	mov    rcx,r14
   14087a434:	e8 f7 0c 84 ff       	call   0x1400bb130
   14087a439:	48 8d 15 48 94 e3 00 	lea    rdx,[rip+0xe39448]        # 0x1416b3888
   14087a440:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a444:	e8 07 dd 7e ff       	call   0x140068150
   14087a449:	90                   	nop
   14087a44a:	45 33 c9             	xor    r9d,r9d
   14087a44d:	41 b0 03             	mov    r8b,0x3
   14087a450:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a454:	49 8b ce             	mov    rcx,r14
   14087a457:	e8 04 f5 25 00       	call   0x140ad9960
   14087a45c:	90                   	nop
   14087a45d:	eb 3c                	jmp    0x14087a49b
   14087a45f:	83 f9 03             	cmp    ecx,0x3
   14087a462:	7c 40                	jl     0x14087a4a4
   14087a464:	45 33 c0             	xor    r8d,r8d
   14087a467:	ba 03 00 00 00       	mov    edx,0x3
   14087a46c:	41 b1 01             	mov    r9b,0x1
   14087a46f:	49 8b ce             	mov    rcx,r14
   14087a472:	e8 b9 0c 84 ff       	call   0x1400bb130
   14087a477:	48 8d 15 3a 94 e3 00 	lea    rdx,[rip+0xe3943a]        # 0x1416b38b8
   14087a47e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a482:	e8 c9 dc 7e ff       	call   0x140068150
   14087a487:	90                   	nop
   14087a488:	45 33 c9             	xor    r9d,r9d
   14087a48b:	41 b0 03             	mov    r8b,0x3
   14087a48e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a492:	49 8b ce             	mov    rcx,r14
   14087a495:	e8 c6 f4 25 00       	call   0x140ad9960
   14087a49a:	90                   	nop
   14087a49b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a49f:	e8 8c d9 7e ff       	call   0x140067e30
   14087a4a4:	45 33 c0             	xor    r8d,r8d
   14087a4a7:	ba 07 00 00 00       	mov    edx,0x7
   14087a4ac:	41 b1 01             	mov    r9b,0x1
   14087a4af:	49 8b ce             	mov    rcx,r14
   14087a4b2:	e8 79 0c 84 ff       	call   0x1400bb130
   14087a4b7:	48 8d 15 1a ec d6 00 	lea    rdx,[rip+0xd6ec1a]        # 0x1415e90d8
   14087a4be:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a4c2:	e8 89 dc 7e ff       	call   0x140068150
   14087a4c7:	90                   	nop
   14087a4c8:	45 33 c9             	xor    r9d,r9d
   14087a4cb:	41 b0 03             	mov    r8b,0x3
   14087a4ce:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a4d2:	49 8b ce             	mov    rcx,r14
   14087a4d5:	e8 86 f4 25 00       	call   0x140ad9960
   14087a4da:	90                   	nop
   14087a4db:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a4df:	e8 4c d9 7e ff       	call   0x140067e30
   14087a4e4:	41 83 7d 08 fd       	cmp    DWORD PTR [r13+0x8],0xfffffffd
   14087a4e9:	7f 40                	jg     0x14087a52b
   14087a4eb:	45 33 c0             	xor    r8d,r8d
   14087a4ee:	ba 05 00 00 00       	mov    edx,0x5
   14087a4f3:	41 b1 01             	mov    r9b,0x1
   14087a4f6:	49 8b ce             	mov    rcx,r14
   14087a4f9:	e8 32 0c 84 ff       	call   0x1400bb130
   14087a4fe:	48 8d 15 a3 93 e3 00 	lea    rdx,[rip+0xe393a3]        # 0x1416b38a8
   14087a505:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a509:	e8 42 dc 7e ff       	call   0x140068150
   14087a50e:	90                   	nop
   14087a50f:	45 33 c9             	xor    r9d,r9d
   14087a512:	45 33 c0             	xor    r8d,r8d
   14087a515:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a519:	49 8b ce             	mov    rcx,r14
   14087a51c:	e8 3f f4 25 00       	call   0x140ad9960
   14087a521:	90                   	nop
   14087a522:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a526:	e8 05 d9 7e ff       	call   0x140067e30
   14087a52b:	41 83 7d 08 fe       	cmp    DWORD PTR [r13+0x8],0xfffffffe
   14087a530:	75 40                	jne    0x14087a572
   14087a532:	45 33 c0             	xor    r8d,r8d
   14087a535:	ba 04 00 00 00       	mov    edx,0x4
   14087a53a:	41 b1 01             	mov    r9b,0x1
   14087a53d:	49 8b ce             	mov    rcx,r14
   14087a540:	e8 eb 0b 84 ff       	call   0x1400bb130
   14087a545:	48 8d 15 0c 93 e3 00 	lea    rdx,[rip+0xe3930c]        # 0x1416b3858
   14087a54c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a550:	e8 fb db 7e ff       	call   0x140068150
   14087a555:	90                   	nop
   14087a556:	45 33 c9             	xor    r9d,r9d
   14087a559:	45 33 c0             	xor    r8d,r8d
   14087a55c:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a560:	49 8b ce             	mov    rcx,r14
   14087a563:	e8 f8 f3 25 00       	call   0x140ad9960
   14087a568:	90                   	nop
   14087a569:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a56d:	e8 be d8 7e ff       	call   0x140067e30
   14087a572:	41 83 7d 08 ff       	cmp    DWORD PTR [r13+0x8],0xffffffff
   14087a577:	75 40                	jne    0x14087a5b9
   14087a579:	45 33 c0             	xor    r8d,r8d
   14087a57c:	ba 06 00 00 00       	mov    edx,0x6
   14087a581:	41 b1 01             	mov    r9b,0x1
   14087a584:	49 8b ce             	mov    rcx,r14
   14087a587:	e8 a4 0b 84 ff       	call   0x1400bb130
   14087a58c:	48 8d 15 ad 92 e3 00 	lea    rdx,[rip+0xe392ad]        # 0x1416b3840
   14087a593:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a597:	e8 b4 db 7e ff       	call   0x140068150
   14087a59c:	90                   	nop
   14087a59d:	45 33 c9             	xor    r9d,r9d
   14087a5a0:	45 33 c0             	xor    r8d,r8d
   14087a5a3:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a5a7:	49 8b ce             	mov    rcx,r14
   14087a5aa:	e8 b1 f3 25 00       	call   0x140ad9960
   14087a5af:	90                   	nop
   14087a5b0:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a5b4:	e8 77 d8 7e ff       	call   0x140067e30
   14087a5b9:	41 83 7d 08 00       	cmp    DWORD PTR [r13+0x8],0x0
   14087a5be:	75 40                	jne    0x14087a600
   14087a5c0:	45 33 c0             	xor    r8d,r8d
   14087a5c3:	ba 07 00 00 00       	mov    edx,0x7
   14087a5c8:	41 b1 01             	mov    r9b,0x1
   14087a5cb:	49 8b ce             	mov    rcx,r14
   14087a5ce:	e8 5d 0b 84 ff       	call   0x1400bb130
   14087a5d3:	48 8d 15 9e 92 e3 00 	lea    rdx,[rip+0xe3929e]        # 0x1416b3878
   14087a5da:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a5de:	e8 6d db 7e ff       	call   0x140068150
   14087a5e3:	90                   	nop
   14087a5e4:	45 33 c9             	xor    r9d,r9d
   14087a5e7:	45 33 c0             	xor    r8d,r8d
   14087a5ea:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a5ee:	49 8b ce             	mov    rcx,r14
   14087a5f1:	e8 6a f3 25 00       	call   0x140ad9960
   14087a5f6:	90                   	nop
   14087a5f7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a5fb:	e8 30 d8 7e ff       	call   0x140067e30
   14087a600:	41 83 7d 08 01       	cmp    DWORD PTR [r13+0x8],0x1
   14087a605:	75 3d                	jne    0x14087a644
   14087a607:	45 33 c0             	xor    r8d,r8d
   14087a60a:	8b d3                	mov    edx,ebx
   14087a60c:	45 33 c9             	xor    r9d,r9d
   14087a60f:	49 8b ce             	mov    rcx,r14
   14087a612:	e8 19 0b 84 ff       	call   0x1400bb130
   14087a617:	48 8d 15 4e 92 e3 00 	lea    rdx,[rip+0xe3924e]        # 0x1416b386c
   14087a61e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a622:	e8 29 db 7e ff       	call   0x140068150
   14087a627:	90                   	nop
   14087a628:	45 33 c9             	xor    r9d,r9d
   14087a62b:	45 33 c0             	xor    r8d,r8d
   14087a62e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a632:	49 8b ce             	mov    rcx,r14
   14087a635:	e8 26 f3 25 00       	call   0x140ad9960
   14087a63a:	90                   	nop
   14087a63b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a63f:	e8 ec d7 7e ff       	call   0x140067e30
   14087a644:	41 83 7d 08 02       	cmp    DWORD PTR [r13+0x8],0x2
   14087a649:	75 3d                	jne    0x14087a688
   14087a64b:	45 33 c0             	xor    r8d,r8d
   14087a64e:	8b d3                	mov    edx,ebx
   14087a650:	41 b1 01             	mov    r9b,0x1
   14087a653:	49 8b ce             	mov    rcx,r14
   14087a656:	e8 d5 0a 84 ff       	call   0x1400bb130
   14087a65b:	48 8d 15 76 9c e3 00 	lea    rdx,[rip+0xe39c76]        # 0x1416b42d8
   14087a662:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a666:	e8 e5 da 7e ff       	call   0x140068150
   14087a66b:	90                   	nop
   14087a66c:	45 33 c9             	xor    r9d,r9d
   14087a66f:	45 33 c0             	xor    r8d,r8d
   14087a672:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a676:	49 8b ce             	mov    rcx,r14
   14087a679:	e8 e2 f2 25 00       	call   0x140ad9960
   14087a67e:	90                   	nop
   14087a67f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a683:	e8 a8 d7 7e ff       	call   0x140067e30
   14087a688:	41 83 7d 08 03       	cmp    DWORD PTR [r13+0x8],0x3
   14087a68d:	7c 40                	jl     0x14087a6cf
   14087a68f:	45 33 c0             	xor    r8d,r8d
   14087a692:	ba 03 00 00 00       	mov    edx,0x3
   14087a697:	41 b1 01             	mov    r9b,0x1
   14087a69a:	49 8b ce             	mov    rcx,r14
   14087a69d:	e8 8e 0a 84 ff       	call   0x1400bb130
   14087a6a2:	48 8d 15 1f 9c e3 00 	lea    rdx,[rip+0xe39c1f]        # 0x1416b42c8
   14087a6a9:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a6ad:	e8 9e da 7e ff       	call   0x140068150
   14087a6b2:	90                   	nop
   14087a6b3:	45 33 c9             	xor    r9d,r9d
   14087a6b6:	45 33 c0             	xor    r8d,r8d
   14087a6b9:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a6bd:	49 8b ce             	mov    rcx,r14
   14087a6c0:	e8 9b f2 25 00       	call   0x140ad9960
   14087a6c5:	90                   	nop
   14087a6c6:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a6ca:	e8 61 d7 7e ff       	call   0x140067e30
   14087a6cf:	44 8d 46 fe          	lea    r8d,[rsi-0x2]
   14087a6d3:	41 8b d4             	mov    edx,r12d
   14087a6d6:	49 8b ce             	mov    rcx,r14
   14087a6d9:	e8 42 0a 84 ff       	call   0x1400bb120
   14087a6de:	41 8b 45 0c          	mov    eax,DWORD PTR [r13+0xc]
   14087a6e2:	a8 20                	test   al,0x20
   14087a6e4:	74 39                	je     0x14087a71f
   14087a6e6:	45 33 c0             	xor    r8d,r8d
   14087a6e9:	8b d3                	mov    edx,ebx
   14087a6eb:	41 b1 01             	mov    r9b,0x1
   14087a6ee:	49 8b ce             	mov    rcx,r14
   14087a6f1:	e8 3a 0a 84 ff       	call   0x1400bb130
   14087a6f6:	48 8d 15 af 38 d7 00 	lea    rdx,[rip+0xd738af]        # 0x1415edfac
   14087a6fd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a701:	e8 4a da 7e ff       	call   0x140068150
   14087a706:	90                   	nop
   14087a707:	45 33 c9             	xor    r9d,r9d
   14087a70a:	45 33 c0             	xor    r8d,r8d
   14087a70d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a711:	49 8b ce             	mov    rcx,r14
   14087a714:	e8 47 f2 25 00       	call   0x140ad9960
   14087a719:	90                   	nop
   14087a71a:	e9 b4 00 00 00       	jmp    0x14087a7d3
   14087a71f:	a8 40                	test   al,0x40
   14087a721:	74 36                	je     0x14087a759
   14087a723:	45 33 c0             	xor    r8d,r8d
   14087a726:	8b d3                	mov    edx,ebx
   14087a728:	45 33 c9             	xor    r9d,r9d
   14087a72b:	49 8b ce             	mov    rcx,r14
   14087a72e:	e8 fd 09 84 ff       	call   0x1400bb130
   14087a733:	48 8d 15 72 38 d7 00 	lea    rdx,[rip+0xd73872]        # 0x1415edfac
   14087a73a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a73e:	e8 0d da 7e ff       	call   0x140068150
   14087a743:	90                   	nop
   14087a744:	45 33 c9             	xor    r9d,r9d
   14087a747:	45 33 c0             	xor    r8d,r8d
   14087a74a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a74e:	49 8b ce             	mov    rcx,r14
   14087a751:	e8 0a f2 25 00       	call   0x140ad9960
   14087a756:	90                   	nop
   14087a757:	eb 7a                	jmp    0x14087a7d3
   14087a759:	84 c0                	test   al,al
   14087a75b:	79 39                	jns    0x14087a796
   14087a75d:	45 33 c0             	xor    r8d,r8d
   14087a760:	ba 06 00 00 00       	mov    edx,0x6
   14087a765:	41 b1 01             	mov    r9b,0x1
   14087a768:	49 8b ce             	mov    rcx,r14
   14087a76b:	e8 c0 09 84 ff       	call   0x1400bb130
   14087a770:	48 8d 15 d5 0f dd 00 	lea    rdx,[rip+0xdd0fd5]        # 0x14164b74c
   14087a777:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a77b:	e8 d0 d9 7e ff       	call   0x140068150
   14087a780:	90                   	nop
   14087a781:	45 33 c9             	xor    r9d,r9d
   14087a784:	45 33 c0             	xor    r8d,r8d
   14087a787:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a78b:	49 8b ce             	mov    rcx,r14
   14087a78e:	e8 cd f1 25 00       	call   0x140ad9960
   14087a793:	90                   	nop
   14087a794:	eb 3d                	jmp    0x14087a7d3
   14087a796:	0f ba e0 08          	bt     eax,0x8
   14087a79a:	73 40                	jae    0x14087a7dc
   14087a79c:	45 33 c0             	xor    r8d,r8d
   14087a79f:	ba 04 00 00 00       	mov    edx,0x4
   14087a7a4:	41 b1 01             	mov    r9b,0x1
   14087a7a7:	49 8b ce             	mov    rcx,r14
   14087a7aa:	e8 81 09 84 ff       	call   0x1400bb130
   14087a7af:	48 8d 15 96 0f dd 00 	lea    rdx,[rip+0xdd0f96]        # 0x14164b74c
   14087a7b6:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a7ba:	e8 91 d9 7e ff       	call   0x140068150
   14087a7bf:	90                   	nop
   14087a7c0:	45 33 c9             	xor    r9d,r9d
   14087a7c3:	45 33 c0             	xor    r8d,r8d
   14087a7c6:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a7ca:	49 8b ce             	mov    rcx,r14
   14087a7cd:	e8 8e f1 25 00       	call   0x140ad9960
   14087a7d2:	90                   	nop
   14087a7d3:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a7d7:	e8 54 d6 7e ff       	call   0x140067e30
   14087a7dc:	41 f7 45 0c 00 02 00 00 	test   DWORD PTR [r13+0xc],0x200
   14087a7e4:	74 4f                	je     0x14087a835
   14087a7e6:	44 8d 46 ff          	lea    r8d,[rsi-0x1]
   14087a7ea:	41 8b d4             	mov    edx,r12d
   14087a7ed:	49 8b ce             	mov    rcx,r14
   14087a7f0:	e8 2b 09 84 ff       	call   0x1400bb120
   14087a7f5:	45 33 c0             	xor    r8d,r8d
   14087a7f8:	ba 03 00 00 00       	mov    edx,0x3
   14087a7fd:	41 b1 01             	mov    r9b,0x1
   14087a800:	49 8b ce             	mov    rcx,r14
   14087a803:	e8 28 09 84 ff       	call   0x1400bb130
   14087a808:	48 8d 15 29 3c d7 00 	lea    rdx,[rip+0xd73c29]        # 0x1415ee438
   14087a80f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a813:	e8 38 d9 7e ff       	call   0x140068150
   14087a818:	90                   	nop
   14087a819:	45 33 c9             	xor    r9d,r9d
   14087a81c:	45 33 c0             	xor    r8d,r8d
   14087a81f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a823:	49 8b ce             	mov    rcx,r14
   14087a826:	e8 35 f1 25 00       	call   0x140ad9960
   14087a82b:	90                   	nop
   14087a82c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a830:	e8 fb d5 7e ff       	call   0x140067e30
   14087a835:	41 83 c4 03          	add    r12d,0x3
   14087a839:	44 89 64 24 7c       	mov    DWORD PTR [rsp+0x7c],r12d
   14087a83e:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a842:	e8 e9 d5 7e ff       	call   0x140067e30
   14087a847:	ff c7                	inc    edi
   14087a849:	89 7c 24 78          	mov    DWORD PTR [rsp+0x78],edi
   14087a84d:	3b 7c 24 60          	cmp    edi,DWORD PTR [rsp+0x60]
   14087a851:	44 8b 75 88          	mov    r14d,DWORD PTR [rbp-0x78]
   14087a855:	48 8d 1d ec 1b dd 01 	lea    rbx,[rip+0x1dd1bec]        # 0x14264c448
   14087a85c:	0f 8c a4 f7 ff ff    	jl     0x14087a006
   14087a862:	8b 5d 98             	mov    ebx,DWORD PTR [rbp-0x68]
   14087a865:	44 8b 65 84          	mov    r12d,DWORD PTR [rbp-0x7c]
   14087a869:	4c 8b 6c 24 70       	mov    r13,QWORD PTR [rsp+0x70]
   14087a86e:	44 3b f3             	cmp    r14d,ebx
   14087a871:	0f 8e a8 57 00 00    	jle    0x14088001f
   14087a877:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a87b:	e8 e0 0a 84 ff       	call   0x1400bb360
   14087a880:	8d 4b ff             	lea    ecx,[rbx-0x1]
   14087a883:	41 8d 0c 4c          	lea    ecx,[r12+rcx*2]
   14087a887:	03 cb                	add    ecx,ebx
   14087a889:	41 8d 44 24 01       	lea    eax,[r12+0x1]
   14087a88e:	45 8d 4e ff          	lea    r9d,[r14-0x1]
   14087a892:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   14087a896:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   14087a89a:	89 5c 24 20          	mov    DWORD PTR [rsp+0x20],ebx
   14087a89e:	45 33 c0             	xor    r8d,r8d
   14087a8a1:	41 8b 95 f8 00 00 00 	mov    edx,DWORD PTR [r13+0xf8]
   14087a8a8:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a8ac:	e8 cf 0a 84 ff       	call   0x1400bb380
   14087a8b1:	44 8d 4e 01          	lea    r9d,[rsi+0x1]
   14087a8b5:	41 0f b6 85 fc 00 00 00 	movzx  eax,BYTE PTR [r13+0xfc]
   14087a8bd:	e9 41 57 00 00       	jmp    0x140880003
   14087a8c2:	49 8d 9d 00 01 00 00 	lea    rbx,[r13+0x100]
   14087a8c9:	48 89 5d d8          	mov    QWORD PTR [rbp-0x28],rbx
   14087a8cd:	48 8b cb             	mov    rcx,rbx
   14087a8d0:	e8 7b 45 7f ff       	call   0x14006ee50
   14087a8d5:	4c 8b c8             	mov    r9,rax
   14087a8d8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14087a8dc:	44 8b 6c 24 68       	mov    r13d,DWORD PTR [rsp+0x68]
   14087a8e1:	41 ff c5             	inc    r13d
   14087a8e4:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087a8e8:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   14087a8ec:	41 ff c8             	dec    r8d
   14087a8ef:	44 8d 57 02          	lea    r10d,[rdi+0x2]
   14087a8f3:	44 89 55 88          	mov    DWORD PTR [rbp-0x78],r10d
   14087a8f7:	8b 4d b0             	mov    ecx,DWORD PTR [rbp-0x50]
   14087a8fa:	83 c1 ed             	add    ecx,0xffffffed
   14087a8fd:	41 2b ca             	sub    ecx,r10d
   14087a900:	ff c1                	inc    ecx
   14087a902:	b8 56 55 55 55       	mov    eax,0x55555556
   14087a907:	f7 e9                	imul   ecx
   14087a909:	8b f2                	mov    esi,edx
   14087a90b:	c1 ee 1f             	shr    esi,0x1f
   14087a90e:	03 f2                	add    esi,edx
   14087a910:	89 74 24 60          	mov    DWORD PTR [rsp+0x60],esi
   14087a914:	45 8d 70 fe          	lea    r14d,[r8-0x2]
   14087a918:	44 3b ce             	cmp    r9d,esi
   14087a91b:	45 0f 4e f0          	cmovle r14d,r8d
   14087a91f:	44 89 74 24 7c       	mov    DWORD PTR [rsp+0x7c],r14d
   14087a924:	45 8b e2             	mov    r12d,r10d
   14087a927:	44 89 55 80          	mov    DWORD PTR [rbp-0x80],r10d
   14087a92b:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087a930:	8b 80 20 01 00 00    	mov    eax,DWORD PTR [rax+0x120]
   14087a936:	41 8b c9             	mov    ecx,r9d
   14087a939:	2b ce                	sub    ecx,esi
   14087a93b:	3b c1                	cmp    eax,ecx
   14087a93d:	0f 4e c8             	cmovle ecx,eax
   14087a940:	33 c0                	xor    eax,eax
   14087a942:	85 c9                	test   ecx,ecx
   14087a944:	0f 49 c1             	cmovns eax,ecx
   14087a947:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
   14087a94a:	44 8b f8             	mov    r15d,eax
   14087a94d:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   14087a951:	03 c6                	add    eax,esi
   14087a953:	89 44 24 64          	mov    DWORD PTR [rsp+0x64],eax
   14087a957:	44 3b f8             	cmp    r15d,eax
   14087a95a:	0f 8d 52 0e 00 00    	jge    0x14087b7b2
   14087a960:	45 3b f9             	cmp    r15d,r9d
   14087a963:	0f 8d 41 0e 00 00    	jge    0x14087b7aa
   14087a969:	49 63 d7             	movsxd rdx,r15d
   14087a96c:	48 8b cb             	mov    rcx,rbx
   14087a96f:	e8 ac 48 7f ff       	call   0x14006f220
   14087a974:	4c 8b 38             	mov    r15,QWORD PTR [rax]
   14087a977:	4c 89 7d a8          	mov    QWORD PTR [rbp-0x58],r15
   14087a97b:	45 33 c0             	xor    r8d,r8d
   14087a97e:	ba 07 00 00 00       	mov    edx,0x7
   14087a983:	41 b1 01             	mov    r9b,0x1
   14087a986:	48 8d 0d 63 fa dc 01 	lea    rcx,[rip+0x1dcfa63]        # 0x14264a3f0
   14087a98d:	e8 9e 07 84 ff       	call   0x1400bb130
   14087a992:	41 8b f5             	mov    esi,r13d
   14087a995:	45 3b ee             	cmp    r13d,r14d
   14087a998:	0f 8f fa 00 00 00    	jg     0x14087aa98
   14087a99e:	45 8d 74 24 03       	lea    r14d,[r12+0x3]
   14087a9a3:	8b 44 24 7c          	mov    eax,DWORD PTR [rsp+0x7c]
   14087a9a7:	4c 8d 3d 42 fa dc 01 	lea    r15,[rip+0x1dcfa42]        # 0x14264a3f0
   14087a9ae:	66 90                	xchg   ax,ax
   14087a9b0:	41 8b dc             	mov    ebx,r12d
   14087a9b3:	45 3b e6             	cmp    r12d,r14d
   14087a9b6:	0f 8d ce 00 00 00    	jge    0x14087aa8a
   14087a9bc:	3b f0                	cmp    esi,eax
   14087a9be:	75 5d                	jne    0x14087aa1d
   14087a9c0:	48 8d 3d e9 13 dd 01 	lea    rdi,[rip+0x1dd13e9]        # 0x14264bdb0
   14087a9c7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087a9d0:	44 8b c6             	mov    r8d,esi
   14087a9d3:	8b d3                	mov    edx,ebx
   14087a9d5:	49 8b cf             	mov    rcx,r15
   14087a9d8:	e8 43 07 84 ff       	call   0x1400bb120
   14087a9dd:	49 8b cf             	mov    rcx,r15
   14087a9e0:	41 3b f5             	cmp    esi,r13d
   14087a9e3:	75 05                	jne    0x14087a9ea
   14087a9e5:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087a9e8:	eb 02                	jmp    0x14087a9ec
   14087a9ea:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087a9ec:	e8 df 00 26 00       	call   0x140adaad0
   14087a9f1:	33 d2                	xor    edx,edx
   14087a9f3:	48 8d 0d 76 2d b5 01 	lea    rcx,[rip+0x1b52d76]        # 0x1423cd770
   14087a9fa:	e8 91 75 7f ff       	call   0x140071f90
   14087a9ff:	84 c0                	test   al,al
   14087aa01:	74 0d                	je     0x14087aa10
   14087aa03:	41 b0 01             	mov    r8b,0x1
   14087aa06:	33 d2                	xor    edx,edx
   14087aa08:	49 8b cf             	mov    rcx,r15
   14087aa0b:	e8 80 07 84 ff       	call   0x1400bb190
   14087aa10:	ff c3                	inc    ebx
   14087aa12:	48 83 c7 04          	add    rdi,0x4
   14087aa16:	41 3b de             	cmp    ebx,r14d
   14087aa19:	7c b5                	jl     0x14087a9d0
   14087aa1b:	eb 69                	jmp    0x14087aa86
   14087aa1d:	48 8d 3d 80 13 dd 01 	lea    rdi,[rip+0x1dd1380]        # 0x14264bda4
   14087aa24:	4c 8d 25 c5 f9 dc 01 	lea    r12,[rip+0x1dcf9c5]        # 0x14264a3f0
   14087aa2b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087aa30:	44 8b c6             	mov    r8d,esi
   14087aa33:	8b d3                	mov    edx,ebx
   14087aa35:	49 8b cc             	mov    rcx,r12
   14087aa38:	e8 e3 06 84 ff       	call   0x1400bb120
   14087aa3d:	49 8b cc             	mov    rcx,r12
   14087aa40:	41 3b f5             	cmp    esi,r13d
   14087aa43:	75 05                	jne    0x14087aa4a
   14087aa45:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087aa48:	eb 02                	jmp    0x14087aa4c
   14087aa4a:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087aa4c:	e8 7f 00 26 00       	call   0x140adaad0
   14087aa51:	33 d2                	xor    edx,edx
   14087aa53:	48 8d 0d 16 2d b5 01 	lea    rcx,[rip+0x1b52d16]        # 0x1423cd770
   14087aa5a:	e8 31 75 7f ff       	call   0x140071f90
   14087aa5f:	84 c0                	test   al,al
   14087aa61:	74 0d                	je     0x14087aa70
   14087aa63:	41 b0 01             	mov    r8b,0x1
   14087aa66:	33 d2                	xor    edx,edx
   14087aa68:	49 8b cc             	mov    rcx,r12
   14087aa6b:	e8 20 07 84 ff       	call   0x1400bb190
   14087aa70:	ff c3                	inc    ebx
   14087aa72:	48 83 c7 04          	add    rdi,0x4
   14087aa76:	41 3b de             	cmp    ebx,r14d
   14087aa79:	7c b5                	jl     0x14087aa30
   14087aa7b:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   14087aa7f:	4c 8d 3d 6a f9 dc 01 	lea    r15,[rip+0x1dcf96a]        # 0x14264a3f0
   14087aa86:	8b 44 24 7c          	mov    eax,DWORD PTR [rsp+0x7c]
   14087aa8a:	ff c6                	inc    esi
   14087aa8c:	3b f0                	cmp    esi,eax
   14087aa8e:	0f 8e 1c ff ff ff    	jle    0x14087a9b0
   14087aa94:	4c 8b 7d a8          	mov    r15,QWORD PTR [rbp-0x58]
   14087aa98:	bb 6e 02 00 00       	mov    ebx,0x26e
   14087aa9d:	49 8b 0f             	mov    rcx,QWORD PTR [r15]
   14087aaa0:	48 85 c9             	test   rcx,rcx
   14087aaa3:	0f 84 6a 01 00 00    	je     0x14087ac13
   14087aaa9:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14087aaac:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   14087aab2:	48 8b f8             	mov    rdi,rax
   14087aab5:	48 85 c0             	test   rax,rax
   14087aab8:	0f 84 02 02 00 00    	je     0x14087acc0
   14087aabe:	48 8b c8             	mov    rcx,rax
   14087aac1:	e8 8a 43 7f ff       	call   0x14006ee50
   14087aac6:	48 85 c0             	test   rax,rax
   14087aac9:	0f 84 02 01 00 00    	je     0x14087abd1
   14087aacf:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087aad3:	48 8b cf             	mov    rcx,rdi
   14087aad6:	e8 45 47 7f ff       	call   0x14006f220
   14087aadb:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087aade:	48 83 c1 10          	add    rcx,0x10
   14087aae2:	48 8d 15 03 98 e3 00 	lea    rdx,[rip+0xe39803]        # 0x1416b42ec
   14087aae9:	e8 92 53 7f ff       	call   0x14006fe80
   14087aaee:	84 c0                	test   al,al
   14087aaf0:	74 0a                	je     0x14087aafc
   14087aaf2:	bb 62 02 00 00       	mov    ebx,0x262
   14087aaf7:	e9 d5 00 00 00       	jmp    0x14087abd1
   14087aafc:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087ab00:	48 8b cf             	mov    rcx,rdi
   14087ab03:	e8 18 47 7f ff       	call   0x14006f220
   14087ab08:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab0b:	48 83 c1 10          	add    rcx,0x10
   14087ab0f:	48 8d 15 ce 97 e3 00 	lea    rdx,[rip+0xe397ce]        # 0x1416b42e4
   14087ab16:	e8 65 53 7f ff       	call   0x14006fe80
   14087ab1b:	84 c0                	test   al,al
   14087ab1d:	74 0a                	je     0x14087ab29
   14087ab1f:	bb 63 02 00 00       	mov    ebx,0x263
   14087ab24:	e9 a8 00 00 00       	jmp    0x14087abd1
   14087ab29:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087ab2d:	48 8b cf             	mov    rcx,rdi
   14087ab30:	e8 eb 46 7f ff       	call   0x14006f220
   14087ab35:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab38:	48 83 c1 10          	add    rcx,0x10
   14087ab3c:	48 8d 15 69 97 e3 00 	lea    rdx,[rip+0xe39769]        # 0x1416b42ac
   14087ab43:	e8 38 53 7f ff       	call   0x14006fe80
   14087ab48:	84 c0                	test   al,al
   14087ab4a:	74 07                	je     0x14087ab53
   14087ab4c:	bb 64 02 00 00       	mov    ebx,0x264
   14087ab51:	eb 7e                	jmp    0x14087abd1
   14087ab53:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087ab57:	48 8b cf             	mov    rcx,rdi
   14087ab5a:	e8 c1 46 7f ff       	call   0x14006f220
   14087ab5f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab62:	48 83 c1 10          	add    rcx,0x10
   14087ab66:	48 8d 15 37 97 e3 00 	lea    rdx,[rip+0xe39737]        # 0x1416b42a4
   14087ab6d:	e8 0e 53 7f ff       	call   0x14006fe80
   14087ab72:	84 c0                	test   al,al
   14087ab74:	74 07                	je     0x14087ab7d
   14087ab76:	bb 65 02 00 00       	mov    ebx,0x265
   14087ab7b:	eb 54                	jmp    0x14087abd1
   14087ab7d:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087ab81:	48 8b cf             	mov    rcx,rdi
   14087ab84:	e8 97 46 7f ff       	call   0x14006f220
   14087ab89:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab8c:	48 83 c1 10          	add    rcx,0x10
   14087ab90:	48 8d 15 25 97 e3 00 	lea    rdx,[rip+0xe39725]        # 0x1416b42bc
   14087ab97:	e8 e4 52 7f ff       	call   0x14006fe80
   14087ab9c:	84 c0                	test   al,al
   14087ab9e:	74 07                	je     0x14087aba7
   14087aba0:	bb 66 02 00 00       	mov    ebx,0x266
   14087aba5:	eb 2a                	jmp    0x14087abd1
   14087aba7:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087abab:	48 8b cf             	mov    rcx,rdi
   14087abae:	e8 6d 46 7f ff       	call   0x14006f220
   14087abb3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087abb6:	48 83 c1 10          	add    rcx,0x10
   14087abba:	48 8d 15 f3 96 e3 00 	lea    rdx,[rip+0xe396f3]        # 0x1416b42b4
   14087abc1:	e8 ba 52 7f ff       	call   0x14006fe80
   14087abc6:	84 c0                	test   al,al
   14087abc8:	b8 67 02 00 00       	mov    eax,0x267
   14087abcd:	48 0f 45 d8          	cmovne rbx,rax
   14087abd1:	48 8b cf             	mov    rcx,rdi
   14087abd4:	e8 77 42 7f ff       	call   0x14006ee50
   14087abd9:	48 85 c0             	test   rax,rax
   14087abdc:	0f 84 de 00 00 00    	je     0x14087acc0
   14087abe2:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087abe6:	48 8b cf             	mov    rcx,rdi
   14087abe9:	e8 32 46 7f ff       	call   0x14006f220
   14087abee:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087abf1:	48 83 c1 50          	add    rcx,0x50
   14087abf5:	48 8d 15 28 97 e3 00 	lea    rdx,[rip+0xe39728]        # 0x1416b4324
   14087abfc:	e8 7f 52 7f ff       	call   0x14006fe80
   14087ac01:	84 c0                	test   al,al
   14087ac03:	0f 84 b7 00 00 00    	je     0x14087acc0
   14087ac09:	bb 68 02 00 00       	mov    ebx,0x268
   14087ac0e:	e9 ad 00 00 00       	jmp    0x14087acc0
   14087ac13:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087ac17:	83 fa ff             	cmp    edx,0xffffffff
   14087ac1a:	0f 84 a0 00 00 00    	je     0x14087acc0
   14087ac20:	48 8b 05 e9 a4 b6 01 	mov    rax,QWORD PTR [rip+0x1b6a4e9]        # 0x1423e5110
   14087ac27:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   14087ac2e:	48 83 c1 18          	add    rcx,0x18
   14087ac32:	e8 e9 45 7f ff       	call   0x14006f220
   14087ac37:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   14087ac3a:	48 83 c7 40          	add    rdi,0x40
   14087ac3e:	48 8d 15 d7 96 e3 00 	lea    rdx,[rip+0xe396d7]        # 0x1416b431c
   14087ac45:	48 8b cf             	mov    rcx,rdi
   14087ac48:	e8 33 52 7f ff       	call   0x14006fe80
   14087ac4d:	84 c0                	test   al,al
   14087ac4f:	74 07                	je     0x14087ac58
   14087ac51:	bb 69 02 00 00       	mov    ebx,0x269
   14087ac56:	eb 68                	jmp    0x14087acc0
   14087ac58:	48 8d 15 b9 a4 df 00 	lea    rdx,[rip+0xdfa4b9]        # 0x141675118
   14087ac5f:	48 8b cf             	mov    rcx,rdi
   14087ac62:	e8 19 52 7f ff       	call   0x14006fe80
   14087ac67:	84 c0                	test   al,al
   14087ac69:	74 07                	je     0x14087ac72
   14087ac6b:	bb 6a 02 00 00       	mov    ebx,0x26a
   14087ac70:	eb 4e                	jmp    0x14087acc0
   14087ac72:	48 8d 15 bb 96 e3 00 	lea    rdx,[rip+0xe396bb]        # 0x1416b4334
   14087ac79:	48 8b cf             	mov    rcx,rdi
   14087ac7c:	e8 ff 51 7f ff       	call   0x14006fe80
   14087ac81:	84 c0                	test   al,al
   14087ac83:	74 07                	je     0x14087ac8c
   14087ac85:	bb 6b 02 00 00       	mov    ebx,0x26b
   14087ac8a:	eb 34                	jmp    0x14087acc0
   14087ac8c:	48 8d 15 99 96 e3 00 	lea    rdx,[rip+0xe39699]        # 0x1416b432c
   14087ac93:	48 8b cf             	mov    rcx,rdi
   14087ac96:	e8 e5 51 7f ff       	call   0x14006fe80
   14087ac9b:	84 c0                	test   al,al
   14087ac9d:	74 07                	je     0x14087aca6
   14087ac9f:	bb 6c 02 00 00       	mov    ebx,0x26c
   14087aca4:	eb 1a                	jmp    0x14087acc0
   14087aca6:	48 8d 15 57 96 e3 00 	lea    rdx,[rip+0xe39657]        # 0x1416b4304
   14087acad:	48 8b cf             	mov    rcx,rdi
   14087acb0:	e8 cb 51 7f ff       	call   0x14006fe80
   14087acb5:	84 c0                	test   al,al
   14087acb7:	b8 6d 02 00 00       	mov    eax,0x26d
   14087acbc:	48 0f 45 d8          	cmovne rbx,rax
   14087acc0:	45 8b f4             	mov    r14d,r12d
   14087acc3:	4c 8d 3c 5b          	lea    r15,[rbx+rbx*2]
   14087acc7:	49 c1 e7 04          	shl    r15,0x4
   14087accb:	48 8d 05 76 17 dd 01 	lea    rax,[rip+0x1dd1776]        # 0x14264c448
   14087acd2:	4c 03 f8             	add    r15,rax
   14087acd5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087acdb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087ace0:	41 8b dd             	mov    ebx,r13d
   14087ace3:	49 8b ff             	mov    rdi,r15
   14087ace6:	be 04 00 00 00       	mov    esi,0x4
   14087aceb:	4c 8d 2d fe f6 dc 01 	lea    r13,[rip+0x1dcf6fe]        # 0x14264a3f0
   14087acf2:	44 8b c3             	mov    r8d,ebx
   14087acf5:	41 8b d6             	mov    edx,r14d
   14087acf8:	49 8b cd             	mov    rcx,r13
   14087acfb:	e8 20 04 84 ff       	call   0x1400bb120
   14087ad00:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ad02:	49 8b cd             	mov    rcx,r13
   14087ad05:	e8 c6 fd 25 00       	call   0x140adaad0
   14087ad0a:	33 d2                	xor    edx,edx
   14087ad0c:	48 8d 0d 5d 2a b5 01 	lea    rcx,[rip+0x1b52a5d]        # 0x1423cd770
   14087ad13:	e8 78 72 7f ff       	call   0x140071f90
   14087ad18:	84 c0                	test   al,al
   14087ad1a:	74 0d                	je     0x14087ad29
   14087ad1c:	41 b0 01             	mov    r8b,0x1
   14087ad1f:	33 d2                	xor    edx,edx
   14087ad21:	49 8b cd             	mov    rcx,r13
   14087ad24:	e8 67 04 84 ff       	call   0x1400bb190
   14087ad29:	ff c3                	inc    ebx
   14087ad2b:	48 83 c7 0c          	add    rdi,0xc
   14087ad2f:	48 83 ee 01          	sub    rsi,0x1
   14087ad33:	75 bd                	jne    0x14087acf2
   14087ad35:	41 ff c6             	inc    r14d
   14087ad38:	49 83 c7 04          	add    r15,0x4
   14087ad3c:	49 83 ec 01          	sub    r12,0x1
   14087ad40:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087ad44:	75 9a                	jne    0x14087ace0
   14087ad46:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   14087ad4a:	45 8d 45 04          	lea    r8d,[r13+0x4]
   14087ad4e:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   14087ad53:	4c 8d 35 96 f6 dc 01 	lea    r14,[rip+0x1dcf696]        # 0x14264a3f0
   14087ad5a:	49 8b ce             	mov    rcx,r14
   14087ad5d:	e8 be 03 84 ff       	call   0x1400bb120
   14087ad62:	44 8b 7c 24 78       	mov    r15d,DWORD PTR [rsp+0x78]
   14087ad67:	41 8b d7             	mov    edx,r15d
   14087ad6a:	2b 55 8c             	sub    edx,DWORD PTR [rbp-0x74]
   14087ad6d:	83 c2 52             	add    edx,0x52
   14087ad70:	45 33 c0             	xor    r8d,r8d
   14087ad73:	48 8d 0d 76 34 03 01 	lea    rcx,[rip+0x1033476]        # 0x1418ae1f0
   14087ad7a:	e8 31 e7 3b 00       	call   0x140c394b0
   14087ad7f:	45 8d 45 06          	lea    r8d,[r13+0x6]
   14087ad83:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   14087ad88:	49 8b ce             	mov    rcx,r14
   14087ad8b:	e8 90 03 84 ff       	call   0x1400bb120
   14087ad90:	48 8d 15 71 8a e3 00 	lea    rdx,[rip+0xe38a71]        # 0x1416b3808
   14087ad97:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087ad9b:	e8 b0 d3 7e ff       	call   0x140068150
   14087ada0:	90                   	nop
   14087ada1:	45 33 c9             	xor    r9d,r9d
   14087ada4:	45 33 c0             	xor    r8d,r8d
   14087ada7:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087adab:	49 8b ce             	mov    rcx,r14
   14087adae:	e8 ad eb 25 00       	call   0x140ad9960
   14087adb3:	90                   	nop
   14087adb4:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087adb8:	e8 73 d0 7e ff       	call   0x140067e30
   14087adbd:	45 33 c0             	xor    r8d,r8d
   14087adc0:	ba 01 00 00 00       	mov    edx,0x1
   14087adc5:	44 0f b6 ca          	movzx  r9d,dl
   14087adc9:	49 8b ce             	mov    rcx,r14
   14087adcc:	e8 5f 03 84 ff       	call   0x1400bb130
   14087add1:	45 8d 45 06          	lea    r8d,[r13+0x6]
   14087add5:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   14087adda:	49 8b ce             	mov    rcx,r14
   14087addd:	e8 3e 03 84 ff       	call   0x1400bb120
   14087ade2:	bf 03 00 00 00       	mov    edi,0x3
   14087ade7:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087adeb:	e8 a0 48 7f ff       	call   0x14006f690
   14087adf0:	90                   	nop
   14087adf1:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087adf5:	e8 96 48 7f ff       	call   0x14006f690
   14087adfa:	90                   	nop
   14087adfb:	48 8b 75 a8          	mov    rsi,QWORD PTR [rbp-0x58]
   14087adff:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   14087ae02:	48 85 c9             	test   rcx,rcx
   14087ae05:	0f 84 06 01 00 00    	je     0x14087af11
   14087ae0b:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14087ae0e:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   14087ae14:	48 8b d8             	mov    rbx,rax
   14087ae17:	48 85 c0             	test   rax,rax
   14087ae1a:	74 4d                	je     0x14087ae69
   14087ae1c:	48 8b c8             	mov    rcx,rax
   14087ae1f:	e8 2c 40 7f ff       	call   0x14006ee50
   14087ae24:	48 85 c0             	test   rax,rax
   14087ae27:	74 40                	je     0x14087ae69
   14087ae29:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   14087ae2d:	48 8b cb             	mov    rcx,rbx
   14087ae30:	e8 eb 43 7f ff       	call   0x14006f220
   14087ae35:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087ae38:	48 83 c2 10          	add    rdx,0x10
   14087ae3c:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087ae40:	e8 5b 47 7f ff       	call   0x14006f5a0
   14087ae45:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   14087ae49:	48 8b cb             	mov    rcx,rbx
   14087ae4c:	e8 cf 43 7f ff       	call   0x14006f220
   14087ae51:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ae54:	8b 79 70             	mov    edi,DWORD PTR [rcx+0x70]
   14087ae57:	48 8d 15 b6 06 d7 00 	lea    rdx,[rip+0xd706b6]        # 0x1415eb514
   14087ae5e:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087ae62:	e8 f9 46 7f ff       	call   0x14006f560
   14087ae67:	eb 25                	jmp    0x14087ae8e
   14087ae69:	48 8d 15 98 78 de 00 	lea    rdx,[rip+0xde7898]        # 0x141662708
   14087ae70:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087ae74:	e8 07 47 7f ff       	call   0x14006f580
   14087ae79:	48 8d 15 94 06 d7 00 	lea    rdx,[rip+0xd70694]        # 0x1415eb514
   14087ae80:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087ae84:	e8 d7 46 7f ff       	call   0x14006f560
   14087ae89:	48 85 db             	test   rbx,rbx
   14087ae8c:	74 5c                	je     0x14087aeea
   14087ae8e:	48 8b cb             	mov    rcx,rbx
   14087ae91:	e8 ba 3f 7f ff       	call   0x14006ee50
   14087ae96:	48 85 c0             	test   rax,rax
   14087ae99:	74 4f                	je     0x14087aeea
   14087ae9b:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   14087ae9f:	48 8b cb             	mov    rcx,rbx
   14087aea2:	e8 79 43 7f ff       	call   0x14006f220
   14087aea7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087aeaa:	48 83 c1 50          	add    rcx,0x50
   14087aeae:	48 8d 15 4b 78 de 00 	lea    rdx,[rip+0xde784b]        # 0x141662700
   14087aeb5:	e8 c6 4f 7f ff       	call   0x14006fe80
   14087aeba:	84 c0                	test   al,al
   14087aebc:	75 2c                	jne    0x14087aeea
   14087aebe:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   14087aec2:	48 8b cb             	mov    rcx,rbx
   14087aec5:	e8 56 43 7f ff       	call   0x14006f220
   14087aeca:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087aecd:	48 83 c2 50          	add    rdx,0x50
   14087aed1:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087aed5:	e8 36 ee 83 ff       	call   0x1400b9d10
   14087aeda:	48 8d 15 33 06 d7 00 	lea    rdx,[rip+0xd70633]        # 0x1415eb514
   14087aee1:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087aee5:	e8 76 46 7f ff       	call   0x14006f560
   14087aeea:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087aef0:	45 33 c0             	xor    r8d,r8d
   14087aef3:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087aef7:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   14087aefa:	e8 51 a5 3e 00       	call   0x140c65450
   14087aeff:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087af03:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087af07:	e8 04 ee 83 ff       	call   0x1400b9d10
   14087af0c:	e9 ac 00 00 00       	jmp    0x14087afbd
   14087af11:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   14087af15:	83 fa ff             	cmp    edx,0xffffffff
   14087af18:	0f 84 8f 00 00 00    	je     0x14087afad
   14087af1e:	48 8b 05 eb a1 b6 01 	mov    rax,QWORD PTR [rip+0x1b6a1eb]        # 0x1423e5110
   14087af25:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   14087af2c:	48 83 c1 18          	add    rcx,0x18
   14087af30:	e8 eb 42 7f ff       	call   0x14006f220
   14087af35:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   14087af38:	48 8d 53 40          	lea    rdx,[rbx+0x40]
   14087af3c:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087af40:	e8 5b 46 7f ff       	call   0x14006f5a0
   14087af45:	8b bb b8 01 00 00    	mov    edi,DWORD PTR [rbx+0x1b8]
   14087af4b:	f6 43 60 01          	test   BYTE PTR [rbx+0x60],0x1
   14087af4f:	74 6c                	je     0x14087afbd
   14087af51:	48 8d 8b 50 01 00 00 	lea    rcx,[rbx+0x150]
   14087af58:	e8 f3 44 7f ff       	call   0x14006f450
   14087af5d:	48 85 c0             	test   rax,rax
   14087af60:	74 5b                	je     0x14087afbd
   14087af62:	48 8d 15 ab 05 d7 00 	lea    rdx,[rip+0xd705ab]        # 0x1415eb514
   14087af69:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087af6d:	e8 ee 45 7f ff       	call   0x14006f560
   14087af72:	33 d2                	xor    edx,edx
   14087af74:	48 8d 8b 50 01 00 00 	lea    rcx,[rbx+0x150]
   14087af7b:	e8 c0 44 7f ff       	call   0x14006f440
   14087af80:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087af87:	45 33 c9             	xor    r9d,r9d
   14087af8a:	44 0f b7 00          	movzx  r8d,WORD PTR [rax]
   14087af8e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087af92:	48 8b 0d 77 a1 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6a177]        # 0x1423e5110
   14087af99:	e8 32 96 ab 00       	call   0x1413345d0
   14087af9e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087afa2:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087afa6:	e8 65 ed 83 ff       	call   0x1400b9d10
   14087afab:	eb 10                	jmp    0x14087afbd
   14087afad:	48 8d 15 40 78 de 00 	lea    rdx,[rip+0xde7840]        # 0x1416627f4
   14087afb4:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087afb8:	e8 a3 45 7f ff       	call   0x14006f560
   14087afbd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087afc2:	8b 90 18 01 00 00    	mov    edx,DWORD PTR [rax+0x118]
   14087afc8:	f6 c2 04             	test   dl,0x4
   14087afcb:	74 07                	je     0x14087afd4
   14087afcd:	83 ff 03             	cmp    edi,0x3
   14087afd0:	7c 02                	jl     0x14087afd4
   14087afd2:	ff cf                	dec    edi
   14087afd4:	f6 c2 08             	test   dl,0x8
   14087afd7:	8d 47 01             	lea    eax,[rdi+0x1]
   14087afda:	0f 44 c7             	cmove  eax,edi
   14087afdd:	8b c8                	mov    ecx,eax
   14087afdf:	f6 c2 10             	test   dl,0x10
   14087afe2:	74 08                	je     0x14087afec
   14087afe4:	83 f8 03             	cmp    eax,0x3
   14087afe7:	7c 03                	jl     0x14087afec
   14087afe9:	8d 48 ff             	lea    ecx,[rax-0x1]
   14087afec:	f6 c2 20             	test   dl,0x20
   14087afef:	8d 59 02             	lea    ebx,[rcx+0x2]
   14087aff2:	0f 44 d9             	cmove  ebx,ecx
   14087aff5:	41 b9 24 00 00 00    	mov    r9d,0x24
   14087affb:	45 33 c0             	xor    r8d,r8d
   14087affe:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087b002:	49 8b ce             	mov    rcx,r14
   14087b005:	e8 56 e9 25 00       	call   0x140ad9960
   14087b00a:	45 8d 45 2c          	lea    r8d,[r13+0x2c]
   14087b00e:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   14087b013:	49 8b ce             	mov    rcx,r14
   14087b016:	e8 05 01 84 ff       	call   0x1400bb120
   14087b01b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
   14087b01e:	f7 46 18 00 80 00 00 	test   DWORD PTR [rsi+0x18],0x8000
   14087b025:	8d 78 ff             	lea    edi,[rax-0x1]
   14087b028:	0f 44 f8             	cmove  edi,eax
   14087b02b:	83 ff fd             	cmp    edi,0xfffffffd
   14087b02e:	7f 3c                	jg     0x14087b06c
   14087b030:	45 33 c0             	xor    r8d,r8d
   14087b033:	ba 05 00 00 00       	mov    edx,0x5
   14087b038:	41 b1 01             	mov    r9b,0x1
   14087b03b:	49 8b ce             	mov    rcx,r14
   14087b03e:	e8 ed 00 84 ff       	call   0x1400bb130
   14087b043:	48 8d 15 56 7c e3 00 	lea    rdx,[rip+0xe37c56]        # 0x1416b2ca0
   14087b04a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b04e:	e8 fd d0 7e ff       	call   0x140068150
   14087b053:	90                   	nop
   14087b054:	45 33 c9             	xor    r9d,r9d
   14087b057:	41 b0 03             	mov    r8b,0x3
   14087b05a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b05e:	49 8b ce             	mov    rcx,r14
   14087b061:	e8 fa e8 25 00       	call   0x140ad9960
   14087b066:	90                   	nop
   14087b067:	e9 a0 01 00 00       	jmp    0x14087b20c
   14087b06c:	83 ff fe             	cmp    edi,0xfffffffe
   14087b06f:	75 3c                	jne    0x14087b0ad
   14087b071:	45 33 c0             	xor    r8d,r8d
   14087b074:	ba 04 00 00 00       	mov    edx,0x4
   14087b079:	41 b1 01             	mov    r9b,0x1
   14087b07c:	49 8b ce             	mov    rcx,r14
   14087b07f:	e8 ac 00 84 ff       	call   0x1400bb130
   14087b084:	48 8d 15 6d 92 e3 00 	lea    rdx,[rip+0xe3926d]        # 0x1416b42f8
   14087b08b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b08f:	e8 bc d0 7e ff       	call   0x140068150
   14087b094:	90                   	nop
   14087b095:	45 33 c9             	xor    r9d,r9d
   14087b098:	41 b0 03             	mov    r8b,0x3
   14087b09b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b09f:	49 8b ce             	mov    rcx,r14
   14087b0a2:	e8 b9 e8 25 00       	call   0x140ad9960
   14087b0a7:	90                   	nop
   14087b0a8:	e9 5f 01 00 00       	jmp    0x14087b20c
   14087b0ad:	83 ff ff             	cmp    edi,0xffffffff
   14087b0b0:	75 3c                	jne    0x14087b0ee
   14087b0b2:	45 33 c0             	xor    r8d,r8d
   14087b0b5:	ba 06 00 00 00       	mov    edx,0x6
   14087b0ba:	41 b1 01             	mov    r9b,0x1
   14087b0bd:	49 8b ce             	mov    rcx,r14
   14087b0c0:	e8 6b 00 84 ff       	call   0x1400bb130
   14087b0c5:	48 8d 15 48 92 e3 00 	lea    rdx,[rip+0xe39248]        # 0x1416b4314
   14087b0cc:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b0d0:	e8 7b d0 7e ff       	call   0x140068150
   14087b0d5:	90                   	nop
   14087b0d6:	45 33 c9             	xor    r9d,r9d
   14087b0d9:	41 b0 03             	mov    r8b,0x3
   14087b0dc:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b0e0:	49 8b ce             	mov    rcx,r14
   14087b0e3:	e8 78 e8 25 00       	call   0x140ad9960
   14087b0e8:	90                   	nop
   14087b0e9:	e9 1e 01 00 00       	jmp    0x14087b20c
   14087b0ee:	85 ff                	test   edi,edi
   14087b0f0:	75 62                	jne    0x14087b154
   14087b0f2:	83 fb 03             	cmp    ebx,0x3
   14087b0f5:	0f 85 63 01 00 00    	jne    0x14087b25e
   14087b0fb:	45 33 c0             	xor    r8d,r8d
   14087b0fe:	ba 07 00 00 00       	mov    edx,0x7
   14087b103:	41 b1 01             	mov    r9b,0x1
   14087b106:	49 8b ce             	mov    rcx,r14
   14087b109:	e8 22 00 84 ff       	call   0x1400bb130
   14087b10e:	48 8d 15 a3 b3 d9 00 	lea    rdx,[rip+0xd9b3a3]        # 0x1416164b8
   14087b115:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b119:	e8 32 d0 7e ff       	call   0x140068150
   14087b11e:	90                   	nop
   14087b11f:	45 33 c9             	xor    r9d,r9d
   14087b122:	44 0f b6 c3          	movzx  r8d,bl
   14087b126:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b12a:	49 8b ce             	mov    rcx,r14
   14087b12d:	e8 2e e8 25 00       	call   0x140ad9960
   14087b132:	90                   	nop
   14087b133:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b137:	e8 f4 cc 7e ff       	call   0x140067e30
   14087b13c:	45 33 c0             	xor    r8d,r8d
   14087b13f:	ba 07 00 00 00       	mov    edx,0x7
   14087b144:	41 b1 01             	mov    r9b,0x1
   14087b147:	49 8b ce             	mov    rcx,r14
   14087b14a:	e8 e1 ff 83 ff       	call   0x1400bb130
   14087b14f:	e9 69 02 00 00       	jmp    0x14087b3bd
   14087b154:	83 ff 01             	cmp    edi,0x1
   14087b157:	75 39                	jne    0x14087b192
   14087b159:	45 33 c0             	xor    r8d,r8d
   14087b15c:	ba 02 00 00 00       	mov    edx,0x2
   14087b161:	45 33 c9             	xor    r9d,r9d
   14087b164:	49 8b ce             	mov    rcx,r14
   14087b167:	e8 c4 ff 83 ff       	call   0x1400bb130
   14087b16c:	48 8d 15 99 91 e3 00 	lea    rdx,[rip+0xe39199]        # 0x1416b430c
   14087b173:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b177:	e8 d4 cf 7e ff       	call   0x140068150
   14087b17c:	90                   	nop
   14087b17d:	45 33 c9             	xor    r9d,r9d
   14087b180:	41 b0 03             	mov    r8b,0x3
   14087b183:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b187:	49 8b ce             	mov    rcx,r14
   14087b18a:	e8 d1 e7 25 00       	call   0x140ad9960
   14087b18f:	90                   	nop
   14087b190:	eb 7a                	jmp    0x14087b20c
   14087b192:	83 ff 02             	cmp    edi,0x2
   14087b195:	75 39                	jne    0x14087b1d0
   14087b197:	45 33 c0             	xor    r8d,r8d
   14087b19a:	ba 02 00 00 00       	mov    edx,0x2
   14087b19f:	41 b1 01             	mov    r9b,0x1
   14087b1a2:	49 8b ce             	mov    rcx,r14
   14087b1a5:	e8 86 ff 83 ff       	call   0x1400bb130
   14087b1aa:	48 8d 15 4f 8f e3 00 	lea    rdx,[rip+0xe38f4f]        # 0x1416b4100
   14087b1b1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b1b5:	e8 96 cf 7e ff       	call   0x140068150
   14087b1ba:	90                   	nop
   14087b1bb:	45 33 c9             	xor    r9d,r9d
   14087b1be:	41 b0 03             	mov    r8b,0x3
   14087b1c1:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b1c5:	49 8b ce             	mov    rcx,r14
   14087b1c8:	e8 93 e7 25 00       	call   0x140ad9960
   14087b1cd:	90                   	nop
   14087b1ce:	eb 3c                	jmp    0x14087b20c
   14087b1d0:	83 ff 03             	cmp    edi,0x3
   14087b1d3:	7c 40                	jl     0x14087b215
   14087b1d5:	45 33 c0             	xor    r8d,r8d
   14087b1d8:	ba 03 00 00 00       	mov    edx,0x3
   14087b1dd:	41 b1 01             	mov    r9b,0x1
   14087b1e0:	49 8b ce             	mov    rcx,r14
   14087b1e3:	e8 48 ff 83 ff       	call   0x1400bb130
   14087b1e8:	48 8d 15 09 8f e3 00 	lea    rdx,[rip+0xe38f09]        # 0x1416b40f8
   14087b1ef:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b1f3:	e8 58 cf 7e ff       	call   0x140068150
   14087b1f8:	90                   	nop
   14087b1f9:	45 33 c9             	xor    r9d,r9d
   14087b1fc:	41 b0 03             	mov    r8b,0x3
   14087b1ff:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b203:	49 8b ce             	mov    rcx,r14
   14087b206:	e8 55 e7 25 00       	call   0x140ad9960
   14087b20b:	90                   	nop
   14087b20c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b210:	e8 1b cc 7e ff       	call   0x140067e30
   14087b215:	83 fb 03             	cmp    ebx,0x3
   14087b218:	0f 84 00 01 00 00    	je     0x14087b31e
   14087b21e:	45 33 c0             	xor    r8d,r8d
   14087b221:	ba 07 00 00 00       	mov    edx,0x7
   14087b226:	41 b1 01             	mov    r9b,0x1
   14087b229:	49 8b ce             	mov    rcx,r14
   14087b22c:	e8 ff fe 83 ff       	call   0x1400bb130
   14087b231:	48 8d 15 04 d5 d6 00 	lea    rdx,[rip+0xd6d504]        # 0x1415e873c
   14087b238:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b23c:	e8 0f cf 7e ff       	call   0x140068150
   14087b241:	90                   	nop
   14087b242:	45 33 c9             	xor    r9d,r9d
   14087b245:	41 b0 03             	mov    r8b,0x3
   14087b248:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b24c:	49 8b ce             	mov    rcx,r14
   14087b24f:	e8 0c e7 25 00       	call   0x140ad9960
   14087b254:	90                   	nop
   14087b255:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b259:	e8 d2 cb 7e ff       	call   0x140067e30
   14087b25e:	83 fb 06             	cmp    ebx,0x6
   14087b261:	7c 3c                	jl     0x14087b29f
   14087b263:	45 33 c0             	xor    r8d,r8d
   14087b266:	ba 05 00 00 00       	mov    edx,0x5
   14087b26b:	41 b1 01             	mov    r9b,0x1
   14087b26e:	49 8b ce             	mov    rcx,r14
   14087b271:	e8 ba fe 83 ff       	call   0x1400bb130
   14087b276:	48 8d 15 93 8e e3 00 	lea    rdx,[rip+0xe38e93]        # 0x1416b4110
   14087b27d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b281:	e8 ca ce 7e ff       	call   0x140068150
   14087b286:	90                   	nop
   14087b287:	45 33 c9             	xor    r9d,r9d
   14087b28a:	41 b0 03             	mov    r8b,0x3
   14087b28d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b291:	49 8b ce             	mov    rcx,r14
   14087b294:	e8 c7 e6 25 00       	call   0x140ad9960
   14087b299:	90                   	nop
   14087b29a:	e9 f9 00 00 00       	jmp    0x14087b398
   14087b29f:	83 fb 05             	cmp    ebx,0x5
   14087b2a2:	75 3c                	jne    0x14087b2e0
   14087b2a4:	45 33 c0             	xor    r8d,r8d
   14087b2a7:	ba 04 00 00 00       	mov    edx,0x4
   14087b2ac:	41 b1 01             	mov    r9b,0x1
   14087b2af:	49 8b ce             	mov    rcx,r14
   14087b2b2:	e8 79 fe 83 ff       	call   0x1400bb130
   14087b2b7:	48 8d 15 4a 8e e3 00 	lea    rdx,[rip+0xe38e4a]        # 0x1416b4108
   14087b2be:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b2c2:	e8 89 ce 7e ff       	call   0x140068150
   14087b2c7:	90                   	nop
   14087b2c8:	45 33 c9             	xor    r9d,r9d
   14087b2cb:	41 b0 03             	mov    r8b,0x3
   14087b2ce:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b2d2:	49 8b ce             	mov    rcx,r14
   14087b2d5:	e8 86 e6 25 00       	call   0x140ad9960
   14087b2da:	90                   	nop
   14087b2db:	e9 b8 00 00 00       	jmp    0x14087b398
   14087b2e0:	83 fb 04             	cmp    ebx,0x4
   14087b2e3:	75 39                	jne    0x14087b31e
   14087b2e5:	45 33 c0             	xor    r8d,r8d
   14087b2e8:	ba 06 00 00 00       	mov    edx,0x6
   14087b2ed:	41 b1 01             	mov    r9b,0x1
   14087b2f0:	49 8b ce             	mov    rcx,r14
   14087b2f3:	e8 38 fe 83 ff       	call   0x1400bb130
   14087b2f8:	48 8d 15 dd 8d e3 00 	lea    rdx,[rip+0xe38ddd]        # 0x1416b40dc
   14087b2ff:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b303:	e8 48 ce 7e ff       	call   0x140068150
   14087b308:	90                   	nop
   14087b309:	45 33 c9             	xor    r9d,r9d
   14087b30c:	41 b0 03             	mov    r8b,0x3
   14087b30f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b313:	49 8b ce             	mov    rcx,r14
   14087b316:	e8 45 e6 25 00       	call   0x140ad9960
   14087b31b:	90                   	nop
   14087b31c:	eb 7a                	jmp    0x14087b398
   14087b31e:	83 fb 02             	cmp    ebx,0x2
   14087b321:	75 39                	jne    0x14087b35c
   14087b323:	45 33 c0             	xor    r8d,r8d
   14087b326:	ba 02 00 00 00       	mov    edx,0x2
   14087b32b:	41 b1 01             	mov    r9b,0x1
   14087b32e:	49 8b ce             	mov    rcx,r14
   14087b331:	e8 fa fd 83 ff       	call   0x1400bb130
   14087b336:	48 8d 15 97 8d e3 00 	lea    rdx,[rip+0xe38d97]        # 0x1416b40d4
   14087b33d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b341:	e8 0a ce 7e ff       	call   0x140068150
   14087b346:	90                   	nop
   14087b347:	45 33 c9             	xor    r9d,r9d
   14087b34a:	41 b0 03             	mov    r8b,0x3
   14087b34d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b351:	49 8b ce             	mov    rcx,r14
   14087b354:	e8 07 e6 25 00       	call   0x140ad9960
   14087b359:	90                   	nop
   14087b35a:	eb 3c                	jmp    0x14087b398
   14087b35c:	83 fb 01             	cmp    ebx,0x1
   14087b35f:	7f 40                	jg     0x14087b3a1
   14087b361:	45 33 c0             	xor    r8d,r8d
   14087b364:	ba 03 00 00 00       	mov    edx,0x3
   14087b369:	41 b1 01             	mov    r9b,0x1
   14087b36c:	49 8b ce             	mov    rcx,r14
   14087b36f:	e8 bc fd 83 ff       	call   0x1400bb130
   14087b374:	48 8d 15 75 8d e3 00 	lea    rdx,[rip+0xe38d75]        # 0x1416b40f0
   14087b37b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b37f:	e8 cc cd 7e ff       	call   0x140068150
   14087b384:	90                   	nop
   14087b385:	45 33 c9             	xor    r9d,r9d
   14087b388:	41 b0 03             	mov    r8b,0x3
   14087b38b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b38f:	49 8b ce             	mov    rcx,r14
   14087b392:	e8 c9 e5 25 00       	call   0x140ad9960
   14087b397:	90                   	nop
   14087b398:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b39c:	e8 8f ca 7e ff       	call   0x140067e30
   14087b3a1:	45 33 c0             	xor    r8d,r8d
   14087b3a4:	ba 07 00 00 00       	mov    edx,0x7
   14087b3a9:	41 b1 01             	mov    r9b,0x1
   14087b3ac:	49 8b ce             	mov    rcx,r14
   14087b3af:	e8 7c fd 83 ff       	call   0x1400bb130
   14087b3b4:	85 ff                	test   edi,edi
   14087b3b6:	74 05                	je     0x14087b3bd
   14087b3b8:	83 fb 03             	cmp    ebx,0x3
   14087b3bb:	75 2d                	jne    0x14087b3ea
   14087b3bd:	48 8d 15 24 8d e3 00 	lea    rdx,[rip+0xe38d24]        # 0x1416b40e8
   14087b3c4:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b3c8:	e8 83 cd 7e ff       	call   0x140068150
   14087b3cd:	90                   	nop
   14087b3ce:	45 33 c9             	xor    r9d,r9d
   14087b3d1:	41 b0 03             	mov    r8b,0x3
   14087b3d4:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b3d8:	49 8b ce             	mov    rcx,r14
   14087b3db:	e8 80 e5 25 00       	call   0x140ad9960
   14087b3e0:	90                   	nop
   14087b3e1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b3e5:	e8 46 ca 7e ff       	call   0x140067e30
   14087b3ea:	48 8d 15 e7 dc d6 00 	lea    rdx,[rip+0xd6dce7]        # 0x1415e90d8
   14087b3f1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b3f5:	e8 56 cd 7e ff       	call   0x140068150
   14087b3fa:	90                   	nop
   14087b3fb:	45 33 c9             	xor    r9d,r9d
   14087b3fe:	41 b0 03             	mov    r8b,0x3
   14087b401:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b405:	49 8b ce             	mov    rcx,r14
   14087b408:	e8 53 e5 25 00       	call   0x140ad9960
   14087b40d:	90                   	nop
   14087b40e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b412:	e8 19 ca 7e ff       	call   0x140067e30
   14087b417:	83 7e 14 fd          	cmp    DWORD PTR [rsi+0x14],0xfffffffd
   14087b41b:	7f 40                	jg     0x14087b45d
   14087b41d:	45 33 c0             	xor    r8d,r8d
   14087b420:	ba 05 00 00 00       	mov    edx,0x5
   14087b425:	41 b1 01             	mov    r9b,0x1
   14087b428:	49 8b ce             	mov    rcx,r14
   14087b42b:	e8 00 fd 83 ff       	call   0x1400bb130
   14087b430:	48 8d 15 71 84 e3 00 	lea    rdx,[rip+0xe38471]        # 0x1416b38a8
   14087b437:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b43b:	e8 10 cd 7e ff       	call   0x140068150
   14087b440:	90                   	nop
   14087b441:	45 33 c9             	xor    r9d,r9d
   14087b444:	45 33 c0             	xor    r8d,r8d
   14087b447:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b44b:	49 8b ce             	mov    rcx,r14
   14087b44e:	e8 0d e5 25 00       	call   0x140ad9960
   14087b453:	90                   	nop
   14087b454:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b458:	e8 d3 c9 7e ff       	call   0x140067e30
   14087b45d:	83 7e 14 fe          	cmp    DWORD PTR [rsi+0x14],0xfffffffe
   14087b461:	75 40                	jne    0x14087b4a3
   14087b463:	45 33 c0             	xor    r8d,r8d
   14087b466:	ba 04 00 00 00       	mov    edx,0x4
   14087b46b:	41 b1 01             	mov    r9b,0x1
   14087b46e:	49 8b ce             	mov    rcx,r14
   14087b471:	e8 ba fc 83 ff       	call   0x1400bb130
   14087b476:	48 8d 15 db 83 e3 00 	lea    rdx,[rip+0xe383db]        # 0x1416b3858
   14087b47d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b481:	e8 ca cc 7e ff       	call   0x140068150
   14087b486:	90                   	nop
   14087b487:	45 33 c9             	xor    r9d,r9d
   14087b48a:	45 33 c0             	xor    r8d,r8d
   14087b48d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b491:	49 8b ce             	mov    rcx,r14
   14087b494:	e8 c7 e4 25 00       	call   0x140ad9960
   14087b499:	90                   	nop
   14087b49a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b49e:	e8 8d c9 7e ff       	call   0x140067e30
   14087b4a3:	83 7e 14 ff          	cmp    DWORD PTR [rsi+0x14],0xffffffff
   14087b4a7:	75 40                	jne    0x14087b4e9
   14087b4a9:	45 33 c0             	xor    r8d,r8d
   14087b4ac:	ba 06 00 00 00       	mov    edx,0x6
   14087b4b1:	41 b1 01             	mov    r9b,0x1
   14087b4b4:	49 8b ce             	mov    rcx,r14
   14087b4b7:	e8 74 fc 83 ff       	call   0x1400bb130
   14087b4bc:	48 8d 15 7d 83 e3 00 	lea    rdx,[rip+0xe3837d]        # 0x1416b3840
   14087b4c3:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b4c7:	e8 84 cc 7e ff       	call   0x140068150
   14087b4cc:	90                   	nop
   14087b4cd:	45 33 c9             	xor    r9d,r9d
   14087b4d0:	45 33 c0             	xor    r8d,r8d
   14087b4d3:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b4d7:	49 8b ce             	mov    rcx,r14
   14087b4da:	e8 81 e4 25 00       	call   0x140ad9960
   14087b4df:	90                   	nop
   14087b4e0:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b4e4:	e8 47 c9 7e ff       	call   0x140067e30
   14087b4e9:	83 7e 14 00          	cmp    DWORD PTR [rsi+0x14],0x0
   14087b4ed:	75 40                	jne    0x14087b52f
   14087b4ef:	45 33 c0             	xor    r8d,r8d
   14087b4f2:	ba 07 00 00 00       	mov    edx,0x7
   14087b4f7:	41 b1 01             	mov    r9b,0x1
   14087b4fa:	49 8b ce             	mov    rcx,r14
   14087b4fd:	e8 2e fc 83 ff       	call   0x1400bb130
   14087b502:	48 8d 15 6f 83 e3 00 	lea    rdx,[rip+0xe3836f]        # 0x1416b3878
   14087b509:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b50d:	e8 3e cc 7e ff       	call   0x140068150
   14087b512:	90                   	nop
   14087b513:	45 33 c9             	xor    r9d,r9d
   14087b516:	45 33 c0             	xor    r8d,r8d
   14087b519:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b51d:	49 8b ce             	mov    rcx,r14
   14087b520:	e8 3b e4 25 00       	call   0x140ad9960
   14087b525:	90                   	nop
   14087b526:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b52a:	e8 01 c9 7e ff       	call   0x140067e30
   14087b52f:	bf 02 00 00 00       	mov    edi,0x2
   14087b534:	83 7e 14 01          	cmp    DWORD PTR [rsi+0x14],0x1
   14087b538:	75 3d                	jne    0x14087b577
   14087b53a:	45 33 c0             	xor    r8d,r8d
   14087b53d:	8b d7                	mov    edx,edi
   14087b53f:	45 33 c9             	xor    r9d,r9d
   14087b542:	49 8b ce             	mov    rcx,r14
   14087b545:	e8 e6 fb 83 ff       	call   0x1400bb130
   14087b54a:	48 8d 15 1b 83 e3 00 	lea    rdx,[rip+0xe3831b]        # 0x1416b386c
   14087b551:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b555:	e8 f6 cb 7e ff       	call   0x140068150
   14087b55a:	90                   	nop
   14087b55b:	45 33 c9             	xor    r9d,r9d
   14087b55e:	45 33 c0             	xor    r8d,r8d
   14087b561:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b565:	49 8b ce             	mov    rcx,r14
   14087b568:	e8 f3 e3 25 00       	call   0x140ad9960
   14087b56d:	90                   	nop
   14087b56e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b572:	e8 b9 c8 7e ff       	call   0x140067e30
   14087b577:	83 7e 14 02          	cmp    DWORD PTR [rsi+0x14],0x2
   14087b57b:	75 3d                	jne    0x14087b5ba
   14087b57d:	45 33 c0             	xor    r8d,r8d
   14087b580:	8b d7                	mov    edx,edi
   14087b582:	41 b1 01             	mov    r9b,0x1
   14087b585:	49 8b ce             	mov    rcx,r14
   14087b588:	e8 a3 fb 83 ff       	call   0x1400bb130
   14087b58d:	48 8d 15 44 8d e3 00 	lea    rdx,[rip+0xe38d44]        # 0x1416b42d8
   14087b594:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b598:	e8 b3 cb 7e ff       	call   0x140068150
   14087b59d:	90                   	nop
   14087b59e:	45 33 c9             	xor    r9d,r9d
   14087b5a1:	45 33 c0             	xor    r8d,r8d
   14087b5a4:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b5a8:	49 8b ce             	mov    rcx,r14
   14087b5ab:	e8 b0 e3 25 00       	call   0x140ad9960
   14087b5b0:	90                   	nop
   14087b5b1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b5b5:	e8 76 c8 7e ff       	call   0x140067e30
   14087b5ba:	83 7e 14 03          	cmp    DWORD PTR [rsi+0x14],0x3
   14087b5be:	7c 40                	jl     0x14087b600
   14087b5c0:	45 33 c0             	xor    r8d,r8d
   14087b5c3:	ba 03 00 00 00       	mov    edx,0x3
   14087b5c8:	41 b1 01             	mov    r9b,0x1
   14087b5cb:	49 8b ce             	mov    rcx,r14
   14087b5ce:	e8 5d fb 83 ff       	call   0x1400bb130
   14087b5d3:	48 8d 15 ee 8c e3 00 	lea    rdx,[rip+0xe38cee]        # 0x1416b42c8
   14087b5da:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b5de:	e8 6d cb 7e ff       	call   0x140068150
   14087b5e3:	90                   	nop
   14087b5e4:	45 33 c9             	xor    r9d,r9d
   14087b5e7:	45 33 c0             	xor    r8d,r8d
   14087b5ea:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b5ee:	49 8b ce             	mov    rcx,r14
   14087b5f1:	e8 6a e3 25 00       	call   0x140ad9960
   14087b5f6:	90                   	nop
   14087b5f7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b5fb:	e8 30 c8 7e ff       	call   0x140067e30
   14087b600:	44 8b 74 24 7c       	mov    r14d,DWORD PTR [rsp+0x7c]
   14087b605:	45 8d 46 fe          	lea    r8d,[r14-0x2]
   14087b609:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   14087b60e:	48 8d 1d db ed dc 01 	lea    rbx,[rip+0x1dceddb]        # 0x14264a3f0
   14087b615:	48 8b cb             	mov    rcx,rbx
   14087b618:	e8 03 fb 83 ff       	call   0x1400bb120
   14087b61d:	8b 46 18             	mov    eax,DWORD PTR [rsi+0x18]
   14087b620:	a8 20                	test   al,0x20
   14087b622:	74 39                	je     0x14087b65d
   14087b624:	45 33 c0             	xor    r8d,r8d
   14087b627:	8b d7                	mov    edx,edi
   14087b629:	41 b1 01             	mov    r9b,0x1
   14087b62c:	48 8b cb             	mov    rcx,rbx
   14087b62f:	e8 fc fa 83 ff       	call   0x1400bb130
   14087b634:	48 8d 15 71 29 d7 00 	lea    rdx,[rip+0xd72971]        # 0x1415edfac
   14087b63b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b63f:	e8 0c cb 7e ff       	call   0x140068150
   14087b644:	90                   	nop
   14087b645:	45 33 c9             	xor    r9d,r9d
   14087b648:	45 33 c0             	xor    r8d,r8d
   14087b64b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b64f:	48 8b cb             	mov    rcx,rbx
   14087b652:	e8 09 e3 25 00       	call   0x140ad9960
   14087b657:	90                   	nop
   14087b658:	e9 b4 00 00 00       	jmp    0x14087b711
   14087b65d:	a8 40                	test   al,0x40
   14087b65f:	74 36                	je     0x14087b697
   14087b661:	45 33 c0             	xor    r8d,r8d
   14087b664:	8b d7                	mov    edx,edi
   14087b666:	45 33 c9             	xor    r9d,r9d
   14087b669:	48 8b cb             	mov    rcx,rbx
   14087b66c:	e8 bf fa 83 ff       	call   0x1400bb130
   14087b671:	48 8d 15 34 29 d7 00 	lea    rdx,[rip+0xd72934]        # 0x1415edfac
   14087b678:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b67c:	e8 cf ca 7e ff       	call   0x140068150
   14087b681:	90                   	nop
   14087b682:	45 33 c9             	xor    r9d,r9d
   14087b685:	45 33 c0             	xor    r8d,r8d
   14087b688:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b68c:	48 8b cb             	mov    rcx,rbx
   14087b68f:	e8 cc e2 25 00       	call   0x140ad9960
   14087b694:	90                   	nop
   14087b695:	eb 7a                	jmp    0x14087b711
   14087b697:	84 c0                	test   al,al
   14087b699:	79 39                	jns    0x14087b6d4
   14087b69b:	45 33 c0             	xor    r8d,r8d
   14087b69e:	ba 06 00 00 00       	mov    edx,0x6
   14087b6a3:	41 b1 01             	mov    r9b,0x1
   14087b6a6:	48 8b cb             	mov    rcx,rbx
   14087b6a9:	e8 82 fa 83 ff       	call   0x1400bb130
   14087b6ae:	48 8d 15 97 00 dd 00 	lea    rdx,[rip+0xdd0097]        # 0x14164b74c
   14087b6b5:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b6b9:	e8 92 ca 7e ff       	call   0x140068150
   14087b6be:	90                   	nop
   14087b6bf:	45 33 c9             	xor    r9d,r9d
   14087b6c2:	45 33 c0             	xor    r8d,r8d
   14087b6c5:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b6c9:	48 8b cb             	mov    rcx,rbx
   14087b6cc:	e8 8f e2 25 00       	call   0x140ad9960
   14087b6d1:	90                   	nop
   14087b6d2:	eb 3d                	jmp    0x14087b711
   14087b6d4:	0f ba e0 08          	bt     eax,0x8
   14087b6d8:	73 40                	jae    0x14087b71a
   14087b6da:	45 33 c0             	xor    r8d,r8d
   14087b6dd:	ba 04 00 00 00       	mov    edx,0x4
   14087b6e2:	41 b1 01             	mov    r9b,0x1
   14087b6e5:	48 8b cb             	mov    rcx,rbx
   14087b6e8:	e8 43 fa 83 ff       	call   0x1400bb130
   14087b6ed:	48 8d 15 58 00 dd 00 	lea    rdx,[rip+0xdd0058]        # 0x14164b74c
   14087b6f4:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b6f8:	e8 53 ca 7e ff       	call   0x140068150
   14087b6fd:	90                   	nop
   14087b6fe:	45 33 c9             	xor    r9d,r9d
   14087b701:	45 33 c0             	xor    r8d,r8d
   14087b704:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b708:	48 8b cb             	mov    rcx,rbx
   14087b70b:	e8 50 e2 25 00       	call   0x140ad9960
   14087b710:	90                   	nop
   14087b711:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b715:	e8 16 c7 7e ff       	call   0x140067e30
   14087b71a:	f7 46 18 00 02 00 00 	test   DWORD PTR [rsi+0x18],0x200
   14087b721:	74 51                	je     0x14087b774
   14087b723:	45 8d 46 ff          	lea    r8d,[r14-0x1]
   14087b727:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   14087b72c:	48 8b cb             	mov    rcx,rbx
   14087b72f:	e8 ec f9 83 ff       	call   0x1400bb120
   14087b734:	45 33 c0             	xor    r8d,r8d
   14087b737:	ba 03 00 00 00       	mov    edx,0x3
   14087b73c:	41 b1 01             	mov    r9b,0x1
   14087b73f:	48 8b cb             	mov    rcx,rbx
   14087b742:	e8 e9 f9 83 ff       	call   0x1400bb130
   14087b747:	48 8d 15 ea 2c d7 00 	lea    rdx,[rip+0xd72cea]        # 0x1415ee438
   14087b74e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b752:	e8 f9 c9 7e ff       	call   0x140068150
   14087b757:	90                   	nop
   14087b758:	45 33 c9             	xor    r9d,r9d
   14087b75b:	45 33 c0             	xor    r8d,r8d
   14087b75e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087b762:	48 8b cb             	mov    rcx,rbx
   14087b765:	e8 f6 e1 25 00       	call   0x140ad9960
   14087b76a:	90                   	nop
   14087b76b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b76f:	e8 bc c6 7e ff       	call   0x140067e30
   14087b774:	41 83 c4 03          	add    r12d,0x3
   14087b778:	44 89 65 80          	mov    DWORD PTR [rbp-0x80],r12d
   14087b77c:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087b780:	e8 ab c6 7e ff       	call   0x140067e30
   14087b785:	90                   	nop
   14087b786:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b78a:	e8 a1 c6 7e ff       	call   0x140067e30
   14087b78f:	41 ff c7             	inc    r15d
   14087b792:	44 89 7c 24 78       	mov    DWORD PTR [rsp+0x78],r15d
   14087b797:	44 3b 7c 24 64       	cmp    r15d,DWORD PTR [rsp+0x64]
   14087b79c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
   14087b7a0:	48 8b 5d d8          	mov    rbx,QWORD PTR [rbp-0x28]
   14087b7a4:	0f 8c b6 f1 ff ff    	jl     0x14087a960
   14087b7aa:	8b 74 24 60          	mov    esi,DWORD PTR [rsp+0x60]
   14087b7ae:	44 8b 55 88          	mov    r10d,DWORD PTR [rbp-0x78]
   14087b7b2:	44 3b ce             	cmp    r9d,esi
   14087b7b5:	7e 67                	jle    0x14087b81e
   14087b7b7:	41 8d 7a 01          	lea    edi,[r10+0x1]
   14087b7bb:	41 8d 5a fe          	lea    ebx,[r10-0x2]
   14087b7bf:	8d 1c 73             	lea    ebx,[rbx+rsi*2]
   14087b7c2:	03 de                	add    ebx,esi
   14087b7c4:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b7c8:	e8 93 fb 83 ff       	call   0x1400bb360
   14087b7cd:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
   14087b7d1:	41 ff c9             	dec    r9d
   14087b7d4:	89 5c 24 30          	mov    DWORD PTR [rsp+0x30],ebx
   14087b7d8:	89 7c 24 28          	mov    DWORD PTR [rsp+0x28],edi
   14087b7dc:	89 74 24 20          	mov    DWORD PTR [rsp+0x20],esi
   14087b7e0:	45 33 c0             	xor    r8d,r8d
   14087b7e3:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087b7e8:	8b 93 20 01 00 00    	mov    edx,DWORD PTR [rbx+0x120]
   14087b7ee:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b7f2:	e8 89 fb 83 ff       	call   0x1400bb380
   14087b7f7:	45 8d 4e 01          	lea    r9d,[r14+0x1]
   14087b7fb:	c7 44 24 28 00 00 00 00 	mov    DWORD PTR [rsp+0x28],0x0
   14087b803:	0f b6 83 24 01 00 00 	movzx  eax,BYTE PTR [rbx+0x124]
   14087b80a:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   14087b80e:	44 8b 45 b4          	mov    r8d,DWORD PTR [rbp-0x4c]
   14087b812:	8b 55 b8             	mov    edx,DWORD PTR [rbp-0x48]
   14087b815:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b819:	e8 b2 3c b9 00       	call   0x14140f4d0
   14087b81e:	44 8b 6d b0          	mov    r13d,DWORD PTR [rbp-0x50]
   14087b822:	41 8d 45 fa          	lea    eax,[r13-0x6]
   14087b826:	89 45 84             	mov    DWORD PTR [rbp-0x7c],eax
   14087b829:	41 8d 4d fd          	lea    ecx,[r13-0x3]
   14087b82d:	89 4d 80             	mov    DWORD PTR [rbp-0x80],ecx
   14087b830:	45 8d 75 ee          	lea    r14d,[r13-0x12]
   14087b834:	4c 8d 3d 4d 7d dd 01 	lea    r15,[rip+0x1dd7d4d]        # 0x142653588
   14087b83b:	4c 8d 25 ae eb dc 01 	lea    r12,[rip+0x1dcebae]        # 0x14264a3f0
   14087b842:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087b846:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087b850:	33 db                	xor    ebx,ebx
   14087b852:	49 8b ff             	mov    rdi,r15
   14087b855:	be 04 00 00 00       	mov    esi,0x4
   14087b85a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087b860:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   14087b865:	41 ff c0             	inc    r8d
   14087b868:	44 03 c3             	add    r8d,ebx
   14087b86b:	41 8b d6             	mov    edx,r14d
   14087b86e:	49 8b cc             	mov    rcx,r12
   14087b871:	e8 aa f8 83 ff       	call   0x1400bb120
   14087b876:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b878:	49 8b cc             	mov    rcx,r12
   14087b87b:	e8 50 f2 25 00       	call   0x140adaad0
   14087b880:	33 d2                	xor    edx,edx
   14087b882:	48 8d 0d e7 1e b5 01 	lea    rcx,[rip+0x1b51ee7]        # 0x1423cd770
   14087b889:	e8 02 67 7f ff       	call   0x140071f90
   14087b88e:	84 c0                	test   al,al
   14087b890:	74 0d                	je     0x14087b89f
   14087b892:	41 b0 01             	mov    r8b,0x1
   14087b895:	33 d2                	xor    edx,edx
   14087b897:	49 8b cc             	mov    rcx,r12
   14087b89a:	e8 f1 f8 83 ff       	call   0x1400bb190
   14087b89f:	ff c3                	inc    ebx
   14087b8a1:	48 83 c7 0c          	add    rdi,0xc
   14087b8a5:	48 83 ee 01          	sub    rsi,0x1
   14087b8a9:	75 b5                	jne    0x14087b860
   14087b8ab:	41 ff c6             	inc    r14d
   14087b8ae:	49 83 c7 04          	add    r15,0x4
   14087b8b2:	48 8d 05 db 7c dd 01 	lea    rax,[rip+0x1dd7cdb]        # 0x142653594
   14087b8b9:	4c 3b f8             	cmp    r15,rax
   14087b8bc:	7c 92                	jl     0x14087b850
   14087b8be:	45 8d 75 f1          	lea    r14d,[r13-0xf]
   14087b8c2:	4c 8d 3d ef 7c dd 01 	lea    r15,[rip+0x1dd7cef]        # 0x1426535b8
   14087b8c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   14087b8d0:	33 db                	xor    ebx,ebx
   14087b8d2:	49 8b ff             	mov    rdi,r15
   14087b8d5:	be 04 00 00 00       	mov    esi,0x4
   14087b8da:	4c 8d 25 0f eb dc 01 	lea    r12,[rip+0x1dceb0f]        # 0x14264a3f0
   14087b8e1:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   14087b8e6:	41 ff c0             	inc    r8d
   14087b8e9:	44 03 c3             	add    r8d,ebx
   14087b8ec:	41 8b d6             	mov    edx,r14d
   14087b8ef:	49 8b cc             	mov    rcx,r12
   14087b8f2:	e8 29 f8 83 ff       	call   0x1400bb120
   14087b8f7:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b8f9:	49 8b cc             	mov    rcx,r12
   14087b8fc:	e8 cf f1 25 00       	call   0x140adaad0
   14087b901:	33 d2                	xor    edx,edx
   14087b903:	48 8d 0d 66 1e b5 01 	lea    rcx,[rip+0x1b51e66]        # 0x1423cd770
   14087b90a:	e8 81 66 7f ff       	call   0x140071f90
   14087b90f:	84 c0                	test   al,al
   14087b911:	74 0d                	je     0x14087b920
   14087b913:	41 b0 01             	mov    r8b,0x1
   14087b916:	33 d2                	xor    edx,edx
   14087b918:	49 8b cc             	mov    rcx,r12
   14087b91b:	e8 70 f8 83 ff       	call   0x1400bb190
   14087b920:	ff c3                	inc    ebx
   14087b922:	48 83 c7 0c          	add    rdi,0xc
   14087b926:	48 83 ee 01          	sub    rsi,0x1
   14087b92a:	75 b5                	jne    0x14087b8e1
   14087b92c:	41 ff c6             	inc    r14d
   14087b92f:	49 83 c7 04          	add    r15,0x4
   14087b933:	48 8d 05 8a 7c dd 01 	lea    rax,[rip+0x1dd7c8a]        # 0x1426535c4
   14087b93a:	4c 3b f8             	cmp    r15,rax
   14087b93d:	7c 91                	jl     0x14087b8d0
   14087b93f:	45 8d 75 f4          	lea    r14d,[r13-0xc]
   14087b943:	4c 8d 3d 9e 7c dd 01 	lea    r15,[rip+0x1dd7c9e]        # 0x1426535e8
   14087b94a:	4c 8d 25 9f ea dc 01 	lea    r12,[rip+0x1dcea9f]        # 0x14264a3f0
   14087b951:	33 db                	xor    ebx,ebx
   14087b953:	49 8b ff             	mov    rdi,r15
   14087b956:	be 04 00 00 00       	mov    esi,0x4
   14087b95b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087b960:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   14087b965:	41 ff c0             	inc    r8d
   14087b968:	44 03 c3             	add    r8d,ebx
   14087b96b:	41 8b d6             	mov    edx,r14d
   14087b96e:	49 8b cc             	mov    rcx,r12
   14087b971:	e8 aa f7 83 ff       	call   0x1400bb120
   14087b976:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b978:	49 8b cc             	mov    rcx,r12
   14087b97b:	e8 50 f1 25 00       	call   0x140adaad0
   14087b980:	33 d2                	xor    edx,edx
   14087b982:	48 8d 0d e7 1d b5 01 	lea    rcx,[rip+0x1b51de7]        # 0x1423cd770
   14087b989:	e8 02 66 7f ff       	call   0x140071f90
   14087b98e:	84 c0                	test   al,al
   14087b990:	74 0d                	je     0x14087b99f
   14087b992:	41 b0 01             	mov    r8b,0x1
   14087b995:	33 d2                	xor    edx,edx
   14087b997:	49 8b cc             	mov    rcx,r12
   14087b99a:	e8 f1 f7 83 ff       	call   0x1400bb190
   14087b99f:	ff c3                	inc    ebx
   14087b9a1:	48 83 c7 0c          	add    rdi,0xc
   14087b9a5:	48 83 ee 01          	sub    rsi,0x1
   14087b9a9:	75 b5                	jne    0x14087b960
   14087b9ab:	41 ff c6             	inc    r14d
   14087b9ae:	49 83 c7 04          	add    r15,0x4
   14087b9b2:	48 8d 05 3b 7c dd 01 	lea    rax,[rip+0x1dd7c3b]        # 0x1426535f4
   14087b9b9:	4c 3b f8             	cmp    r15,rax
   14087b9bc:	7c 93                	jl     0x14087b951
   14087b9be:	45 8d 75 f7          	lea    r14d,[r13-0x9]
   14087b9c2:	4c 8d 3d 4f 7c dd 01 	lea    r15,[rip+0x1dd7c4f]        # 0x142653618
   14087b9c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   14087b9d0:	33 db                	xor    ebx,ebx
   14087b9d2:	49 8b ff             	mov    rdi,r15
   14087b9d5:	be 04 00 00 00       	mov    esi,0x4
   14087b9da:	4c 8d 25 0f ea dc 01 	lea    r12,[rip+0x1dcea0f]        # 0x14264a3f0
   14087b9e1:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   14087b9e6:	41 ff c0             	inc    r8d
   14087b9e9:	44 03 c3             	add    r8d,ebx
   14087b9ec:	41 8b d6             	mov    edx,r14d
   14087b9ef:	49 8b cc             	mov    rcx,r12
   14087b9f2:	e8 29 f7 83 ff       	call   0x1400bb120
   14087b9f7:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b9f9:	49 8b cc             	mov    rcx,r12
   14087b9fc:	e8 cf f0 25 00       	call   0x140adaad0
   14087ba01:	33 d2                	xor    edx,edx
   14087ba03:	48 8d 0d 66 1d b5 01 	lea    rcx,[rip+0x1b51d66]        # 0x1423cd770
   14087ba0a:	e8 81 65 7f ff       	call   0x140071f90
   14087ba0f:	84 c0                	test   al,al
   14087ba11:	74 0d                	je     0x14087ba20
   14087ba13:	41 b0 01             	mov    r8b,0x1
   14087ba16:	33 d2                	xor    edx,edx
   14087ba18:	49 8b cc             	mov    rcx,r12
   14087ba1b:	e8 70 f7 83 ff       	call   0x1400bb190
   14087ba20:	ff c3                	inc    ebx
   14087ba22:	48 83 c7 0c          	add    rdi,0xc
   14087ba26:	48 83 ee 01          	sub    rsi,0x1
   14087ba2a:	75 b5                	jne    0x14087b9e1
   14087ba2c:	41 ff c6             	inc    r14d
   14087ba2f:	49 83 c7 04          	add    r15,0x4
   14087ba33:	48 8d 05 ea 7b dd 01 	lea    rax,[rip+0x1dd7bea]        # 0x142653624
   14087ba3a:	4c 3b f8             	cmp    r15,rax
   14087ba3d:	7c 91                	jl     0x14087b9d0
   14087ba3f:	45 8d 75 fa          	lea    r14d,[r13-0x6]
   14087ba43:	4c 8d 3d fe 7b dd 01 	lea    r15,[rip+0x1dd7bfe]        # 0x142653648
   14087ba4a:	4c 8d 25 9f e9 dc 01 	lea    r12,[rip+0x1dce99f]        # 0x14264a3f0
   14087ba51:	33 db                	xor    ebx,ebx
   14087ba53:	49 8b ff             	mov    rdi,r15
   14087ba56:	be 04 00 00 00       	mov    esi,0x4
   14087ba5b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087ba60:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   14087ba65:	41 ff c0             	inc    r8d
   14087ba68:	44 03 c3             	add    r8d,ebx
   14087ba6b:	41 8b d6             	mov    edx,r14d
   14087ba6e:	49 8b cc             	mov    rcx,r12
   14087ba71:	e8 aa f6 83 ff       	call   0x1400bb120
   14087ba76:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ba78:	49 8b cc             	mov    rcx,r12
   14087ba7b:	e8 50 f0 25 00       	call   0x140adaad0
   14087ba80:	33 d2                	xor    edx,edx
   14087ba82:	48 8d 0d e7 1c b5 01 	lea    rcx,[rip+0x1b51ce7]        # 0x1423cd770
   14087ba89:	e8 02 65 7f ff       	call   0x140071f90
   14087ba8e:	84 c0                	test   al,al
   14087ba90:	74 0d                	je     0x14087ba9f
   14087ba92:	41 b0 01             	mov    r8b,0x1
   14087ba95:	33 d2                	xor    edx,edx
   14087ba97:	49 8b cc             	mov    rcx,r12
   14087ba9a:	e8 f1 f6 83 ff       	call   0x1400bb190
   14087ba9f:	ff c3                	inc    ebx
   14087baa1:	48 83 c7 0c          	add    rdi,0xc
   14087baa5:	48 83 ee 01          	sub    rsi,0x1
   14087baa9:	75 b5                	jne    0x14087ba60
   14087baab:	41 ff c6             	inc    r14d
   14087baae:	49 83 c7 04          	add    r15,0x4
   14087bab2:	48 8d 05 9b 7b dd 01 	lea    rax,[rip+0x1dd7b9b]        # 0x142653654
   14087bab9:	4c 3b f8             	cmp    r15,rax
   14087babc:	7c 93                	jl     0x14087ba51
   14087babe:	45 8d 7d fd          	lea    r15d,[r13-0x3]
   14087bac2:	41 8b ff             	mov    edi,r15d
   14087bac5:	48 8d 1d b8 7b dd 01 	lea    rbx,[rip+0x1dd7bb8]        # 0x142653684
   14087bacc:	4c 8d 35 bd 7b dd 01 	lea    r14,[rip+0x1dd7bbd]        # 0x142653690
   14087bad3:	48 8d 35 16 e9 dc 01 	lea    rsi,[rip+0x1dce916]        # 0x14264a3f0
   14087bada:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087bae0:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bae4:	ff c0                	inc    eax
   14087bae6:	89 05 88 e9 dc 01    	mov    DWORD PTR [rip+0x1dce988],eax        # 0x14264a474
   14087baec:	89 3d 86 e9 dc 01    	mov    DWORD PTR [rip+0x1dce986],edi        # 0x14264a478
   14087baf2:	8b 53 f4             	mov    edx,DWORD PTR [rbx-0xc]
   14087baf5:	48 8b ce             	mov    rcx,rsi
   14087baf8:	e8 d3 ef 25 00       	call   0x140adaad0
   14087bafd:	83 3d 74 1c b5 01 00 	cmp    DWORD PTR [rip+0x1b51c74],0x0        # 0x1423cd778
   14087bb04:	7e 19                	jle    0x14087bb1f
   14087bb06:	48 8b 05 63 1c b5 01 	mov    rax,QWORD PTR [rip+0x1b51c63]        # 0x1423cd770
   14087bb0d:	f6 00 01             	test   BYTE PTR [rax],0x1
   14087bb10:	74 0d                	je     0x14087bb1f
   14087bb12:	41 b0 01             	mov    r8b,0x1
   14087bb15:	33 d2                	xor    edx,edx
   14087bb17:	48 8b ce             	mov    rcx,rsi
   14087bb1a:	e8 71 f6 83 ff       	call   0x1400bb190
   14087bb1f:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bb23:	83 c0 02             	add    eax,0x2
   14087bb26:	89 05 48 e9 dc 01    	mov    DWORD PTR [rip+0x1dce948],eax        # 0x14264a474
   14087bb2c:	89 3d 46 e9 dc 01    	mov    DWORD PTR [rip+0x1dce946],edi        # 0x14264a478
   14087bb32:	8b 13                	mov    edx,DWORD PTR [rbx]
   14087bb34:	48 8b ce             	mov    rcx,rsi
   14087bb37:	e8 94 ef 25 00       	call   0x140adaad0
   14087bb3c:	83 3d 35 1c b5 01 00 	cmp    DWORD PTR [rip+0x1b51c35],0x0        # 0x1423cd778
   14087bb43:	7e 19                	jle    0x14087bb5e
   14087bb45:	48 8b 05 24 1c b5 01 	mov    rax,QWORD PTR [rip+0x1b51c24]        # 0x1423cd770
   14087bb4c:	f6 00 01             	test   BYTE PTR [rax],0x1
   14087bb4f:	74 0d                	je     0x14087bb5e
   14087bb51:	41 b0 01             	mov    r8b,0x1
   14087bb54:	33 d2                	xor    edx,edx
   14087bb56:	48 8b ce             	mov    rcx,rsi
   14087bb59:	e8 32 f6 83 ff       	call   0x1400bb190
   14087bb5e:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bb62:	83 c0 03             	add    eax,0x3
   14087bb65:	89 05 09 e9 dc 01    	mov    DWORD PTR [rip+0x1dce909],eax        # 0x14264a474
   14087bb6b:	89 3d 07 e9 dc 01    	mov    DWORD PTR [rip+0x1dce907],edi        # 0x14264a478
   14087bb71:	8b 53 0c             	mov    edx,DWORD PTR [rbx+0xc]
   14087bb74:	48 8b ce             	mov    rcx,rsi
   14087bb77:	e8 54 ef 25 00       	call   0x140adaad0
   14087bb7c:	83 3d f5 1b b5 01 00 	cmp    DWORD PTR [rip+0x1b51bf5],0x0        # 0x1423cd778
   14087bb83:	7e 19                	jle    0x14087bb9e
   14087bb85:	48 8b 05 e4 1b b5 01 	mov    rax,QWORD PTR [rip+0x1b51be4]        # 0x1423cd770
   14087bb8c:	f6 00 01             	test   BYTE PTR [rax],0x1
   14087bb8f:	74 0d                	je     0x14087bb9e
   14087bb91:	41 b0 01             	mov    r8b,0x1
   14087bb94:	33 d2                	xor    edx,edx
   14087bb96:	48 8b ce             	mov    rcx,rsi
   14087bb99:	e8 f2 f5 83 ff       	call   0x1400bb190
   14087bb9e:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bba2:	83 c0 04             	add    eax,0x4
   14087bba5:	89 05 c9 e8 dc 01    	mov    DWORD PTR [rip+0x1dce8c9],eax        # 0x14264a474
   14087bbab:	89 3d c7 e8 dc 01    	mov    DWORD PTR [rip+0x1dce8c7],edi        # 0x14264a478
   14087bbb1:	8b 53 18             	mov    edx,DWORD PTR [rbx+0x18]
   14087bbb4:	48 8b ce             	mov    rcx,rsi
   14087bbb7:	e8 14 ef 25 00       	call   0x140adaad0
   14087bbbc:	83 3d b5 1b b5 01 00 	cmp    DWORD PTR [rip+0x1b51bb5],0x0        # 0x1423cd778
   14087bbc3:	7e 19                	jle    0x14087bbde
   14087bbc5:	48 8b 05 a4 1b b5 01 	mov    rax,QWORD PTR [rip+0x1b51ba4]        # 0x1423cd770
   14087bbcc:	f6 00 01             	test   BYTE PTR [rax],0x1
   14087bbcf:	74 0d                	je     0x14087bbde
   14087bbd1:	41 b0 01             	mov    r8b,0x1
   14087bbd4:	33 d2                	xor    edx,edx
   14087bbd6:	48 8b ce             	mov    rcx,rsi
   14087bbd9:	e8 b2 f5 83 ff       	call   0x1400bb190
   14087bbde:	ff c7                	inc    edi
   14087bbe0:	48 83 c3 04          	add    rbx,0x4
   14087bbe4:	49 3b de             	cmp    rbx,r14
   14087bbe7:	0f 8c f3 fe ff ff    	jl     0x14087bae0
   14087bbed:	48 8b 0d 1c 95 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6951c]        # 0x1423e5110
   14087bbf4:	0f b7 81 14 08 00 00 	movzx  eax,WORD PTR [rcx+0x814]
   14087bbfb:	66 ff c8             	dec    ax
   14087bbfe:	48 8d 1d cf 4b dd 01 	lea    rbx,[rip+0x1dd4bcf]        # 0x1426507d4
   14087bc05:	66 83 f8 01          	cmp    ax,0x1
   14087bc09:	0f 86 5c 06 00 00    	jbe    0x14087c26b
   14087bc0f:	66 83 b9 60 03 00 00 07 	cmp    WORD PTR [rcx+0x360],0x7
   14087bc17:	0f 84 4e 06 00 00    	je     0x14087c26b
   14087bc1d:	45 33 c0             	xor    r8d,r8d
   14087bc20:	ba 07 00 00 00       	mov    edx,0x7
   14087bc25:	41 b1 01             	mov    r9b,0x1
   14087bc28:	48 8b ce             	mov    rcx,rsi
   14087bc2b:	e8 00 f5 83 ff       	call   0x1400bb130
   14087bc30:	41 8d 75 ee          	lea    esi,[r13-0x12]
   14087bc34:	48 8b fb             	mov    rdi,rbx
   14087bc37:	4c 8b 74 24 70       	mov    r14,QWORD PTR [rsp+0x70]
   14087bc3c:	4c 8d 25 ad e7 dc 01 	lea    r12,[rip+0x1dce7ad]        # 0x14264a3f0
   14087bc43:	48 8d 1d 96 4b dd 01 	lea    rbx,[rip+0x1dd4b96]        # 0x1426507e0
   14087bc4a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087bc50:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bc54:	83 c0 05             	add    eax,0x5
   14087bc57:	89 05 17 e8 dc 01    	mov    DWORD PTR [rip+0x1dce817],eax        # 0x14264a474
   14087bc5d:	89 35 15 e8 dc 01    	mov    DWORD PTR [rip+0x1dce815],esi        # 0x14264a478
   14087bc63:	45 33 c0             	xor    r8d,r8d
   14087bc66:	49 8b cc             	mov    rcx,r12
   14087bc69:	41 f6 86 18 01 00 00 04 	test   BYTE PTR [r14+0x118],0x4
   14087bc71:	74 05                	je     0x14087bc78
   14087bc73:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   14087bc76:	eb 03                	jmp    0x14087bc7b
   14087bc78:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087bc7b:	e8 80 f4 25 00       	call   0x140adb100
   14087bc80:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bc84:	83 c0 06             	add    eax,0x6
   14087bc87:	89 05 e7 e7 dc 01    	mov    DWORD PTR [rip+0x1dce7e7],eax        # 0x14264a474
   14087bc8d:	89 35 e5 e7 dc 01    	mov    DWORD PTR [rip+0x1dce7e5],esi        # 0x14264a478
   14087bc93:	45 33 c0             	xor    r8d,r8d
   14087bc96:	49 8b cc             	mov    rcx,r12
   14087bc99:	41 f6 86 18 01 00 00 04 	test   BYTE PTR [r14+0x118],0x4
   14087bca1:	74 05                	je     0x14087bca8
   14087bca3:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   14087bca6:	eb 02                	jmp    0x14087bcaa
   14087bca8:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087bcaa:	e8 51 f4 25 00       	call   0x140adb100
   14087bcaf:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bcb3:	83 c0 07             	add    eax,0x7
   14087bcb6:	89 05 b8 e7 dc 01    	mov    DWORD PTR [rip+0x1dce7b8],eax        # 0x14264a474
   14087bcbc:	89 35 b6 e7 dc 01    	mov    DWORD PTR [rip+0x1dce7b6],esi        # 0x14264a478
   14087bcc2:	45 33 c0             	xor    r8d,r8d
   14087bcc5:	49 8b cc             	mov    rcx,r12
   14087bcc8:	41 f6 86 18 01 00 00 04 	test   BYTE PTR [r14+0x118],0x4
   14087bcd0:	74 05                	je     0x14087bcd7
   14087bcd2:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   14087bcd5:	eb 03                	jmp    0x14087bcda
   14087bcd7:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   14087bcda:	e8 21 f4 25 00       	call   0x140adb100
   14087bcdf:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bce3:	83 c0 08             	add    eax,0x8
   14087bce6:	89 05 88 e7 dc 01    	mov    DWORD PTR [rip+0x1dce788],eax        # 0x14264a474
   14087bcec:	89 35 86 e7 dc 01    	mov    DWORD PTR [rip+0x1dce786],esi        # 0x14264a478
   14087bcf2:	45 33 c0             	xor    r8d,r8d
   14087bcf5:	49 8b cc             	mov    rcx,r12
   14087bcf8:	41 f6 86 18 01 00 00 04 	test   BYTE PTR [r14+0x118],0x4
   14087bd00:	74 05                	je     0x14087bd07
   14087bd02:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087bd05:	eb 03                	jmp    0x14087bd0a
   14087bd07:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   14087bd0a:	e8 f1 f3 25 00       	call   0x140adb100
   14087bd0f:	ff c6                	inc    esi
   14087bd11:	48 83 c7 04          	add    rdi,0x4
   14087bd15:	48 3b fb             	cmp    rdi,rbx
   14087bd18:	0f 8c 32 ff ff ff    	jl     0x14087bc50
   14087bd1e:	c7 05 54 e7 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dce754],0x1010007        # 0x14264a47c
   14087bd28:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bd2c:	83 c0 09             	add    eax,0x9
   14087bd2f:	89 05 3f e7 dc 01    	mov    DWORD PTR [rip+0x1dce73f],eax        # 0x14264a474
   14087bd35:	41 8d 45 ef          	lea    eax,[r13-0x11]
   14087bd39:	89 05 39 e7 dc 01    	mov    DWORD PTR [rip+0x1dce739],eax        # 0x14264a478
   14087bd3f:	41 b0 03             	mov    r8b,0x3
   14087bd42:	ba 5c 01 00 00       	mov    edx,0x15c
   14087bd47:	48 8d 0d a2 24 03 01 	lea    rcx,[rip+0x10324a2]        # 0x1418ae1f0
   14087bd4e:	e8 5d d7 3b 00       	call   0x140c394b0
   14087bd53:	48 8d 15 e2 c9 d6 00 	lea    rdx,[rip+0xd6c9e2]        # 0x1415e873c
   14087bd5a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bd5e:	e8 ed c3 7e ff       	call   0x140068150
   14087bd63:	90                   	nop
   14087bd64:	45 33 c9             	xor    r9d,r9d
   14087bd67:	41 b0 03             	mov    r8b,0x3
   14087bd6a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087bd6e:	48 8d 3d 7b e6 dc 01 	lea    rdi,[rip+0x1dce67b]        # 0x14264a3f0
   14087bd75:	48 8b cf             	mov    rcx,rdi
   14087bd78:	e8 e3 db 25 00       	call   0x140ad9960
   14087bd7d:	90                   	nop
   14087bd7e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bd82:	e8 c9 3a 7f ff       	call   0x14006f850
   14087bd87:	48 8d 15 5a 84 e3 00 	lea    rdx,[rip+0xe3845a]        # 0x1416b41e8
   14087bd8e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bd92:	e8 b9 c3 7e ff       	call   0x140068150
   14087bd97:	90                   	nop
   14087bd98:	45 33 c9             	xor    r9d,r9d
   14087bd9b:	45 33 c0             	xor    r8d,r8d
   14087bd9e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087bda2:	48 8b cf             	mov    rcx,rdi
   14087bda5:	e8 b6 db 25 00       	call   0x140ad9960
   14087bdaa:	90                   	nop
   14087bdab:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bdaf:	e8 9c 3a 7f ff       	call   0x14006f850
   14087bdb4:	45 33 c0             	xor    r8d,r8d
   14087bdb7:	ba 07 00 00 00       	mov    edx,0x7
   14087bdbc:	41 b1 01             	mov    r9b,0x1
   14087bdbf:	48 8b cf             	mov    rcx,rdi
   14087bdc2:	e8 69 f3 83 ff       	call   0x1400bb130
   14087bdc7:	41 8d 75 f1          	lea    esi,[r13-0xf]
   14087bdcb:	48 8d 1d 02 4a dd 01 	lea    rbx,[rip+0x1dd4a02]        # 0x1426507d4
   14087bdd2:	48 8b fb             	mov    rdi,rbx
   14087bdd5:	4c 8d 25 14 e6 dc 01 	lea    r12,[rip+0x1dce614]        # 0x14264a3f0
   14087bddc:	4c 8d 3d fd 49 dd 01 	lea    r15,[rip+0x1dd49fd]        # 0x1426507e0
   14087bde3:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bde7:	83 c0 05             	add    eax,0x5
   14087bdea:	89 05 84 e6 dc 01    	mov    DWORD PTR [rip+0x1dce684],eax        # 0x14264a474
   14087bdf0:	89 35 82 e6 dc 01    	mov    DWORD PTR [rip+0x1dce682],esi        # 0x14264a478
   14087bdf6:	45 33 c0             	xor    r8d,r8d
   14087bdf9:	49 8b cc             	mov    rcx,r12
   14087bdfc:	41 f6 86 18 01 00 00 08 	test   BYTE PTR [r14+0x118],0x8
   14087be04:	74 05                	je     0x14087be0b
   14087be06:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   14087be09:	eb 03                	jmp    0x14087be0e
   14087be0b:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087be0e:	e8 ed f2 25 00       	call   0x140adb100
   14087be13:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087be17:	83 c0 06             	add    eax,0x6
   14087be1a:	89 05 54 e6 dc 01    	mov    DWORD PTR [rip+0x1dce654],eax        # 0x14264a474
   14087be20:	89 35 52 e6 dc 01    	mov    DWORD PTR [rip+0x1dce652],esi        # 0x14264a478
   14087be26:	45 33 c0             	xor    r8d,r8d
   14087be29:	49 8b cc             	mov    rcx,r12
   14087be2c:	41 f6 86 18 01 00 00 08 	test   BYTE PTR [r14+0x118],0x8
   14087be34:	74 05                	je     0x14087be3b
   14087be36:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   14087be39:	eb 02                	jmp    0x14087be3d
   14087be3b:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087be3d:	e8 be f2 25 00       	call   0x140adb100
   14087be42:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087be46:	83 c0 07             	add    eax,0x7
   14087be49:	89 05 25 e6 dc 01    	mov    DWORD PTR [rip+0x1dce625],eax        # 0x14264a474
   14087be4f:	89 35 23 e6 dc 01    	mov    DWORD PTR [rip+0x1dce623],esi        # 0x14264a478
   14087be55:	45 33 c0             	xor    r8d,r8d
   14087be58:	49 8b cc             	mov    rcx,r12
   14087be5b:	41 f6 86 18 01 00 00 08 	test   BYTE PTR [r14+0x118],0x8
   14087be63:	74 05                	je     0x14087be6a
   14087be65:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   14087be68:	eb 03                	jmp    0x14087be6d
   14087be6a:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   14087be6d:	e8 8e f2 25 00       	call   0x140adb100
   14087be72:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087be76:	83 c0 08             	add    eax,0x8
   14087be79:	89 05 f5 e5 dc 01    	mov    DWORD PTR [rip+0x1dce5f5],eax        # 0x14264a474
   14087be7f:	89 35 f3 e5 dc 01    	mov    DWORD PTR [rip+0x1dce5f3],esi        # 0x14264a478
   14087be85:	45 33 c0             	xor    r8d,r8d
   14087be88:	49 8b cc             	mov    rcx,r12
   14087be8b:	41 f6 86 18 01 00 00 08 	test   BYTE PTR [r14+0x118],0x8
   14087be93:	74 05                	je     0x14087be9a
   14087be95:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087be98:	eb 03                	jmp    0x14087be9d
   14087be9a:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   14087be9d:	e8 5e f2 25 00       	call   0x140adb100
   14087bea2:	ff c6                	inc    esi
   14087bea4:	48 83 c7 04          	add    rdi,0x4
   14087bea8:	49 3b ff             	cmp    rdi,r15
   14087beab:	0f 8c 32 ff ff ff    	jl     0x14087bde3
   14087beb1:	c7 05 c1 e5 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dce5c1],0x1010007        # 0x14264a47c
   14087bebb:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bebf:	83 c0 09             	add    eax,0x9
   14087bec2:	89 05 ac e5 dc 01    	mov    DWORD PTR [rip+0x1dce5ac],eax        # 0x14264a474
   14087bec8:	41 8d 45 f2          	lea    eax,[r13-0xe]
   14087becc:	89 05 a6 e5 dc 01    	mov    DWORD PTR [rip+0x1dce5a6],eax        # 0x14264a478
   14087bed2:	41 b0 03             	mov    r8b,0x3
   14087bed5:	ba 5d 01 00 00       	mov    edx,0x15d
   14087beda:	48 8d 0d 0f 23 03 01 	lea    rcx,[rip+0x103230f]        # 0x1418ae1f0
   14087bee1:	e8 ca d5 3b 00       	call   0x140c394b0
   14087bee6:	48 8d 15 4f c8 d6 00 	lea    rdx,[rip+0xd6c84f]        # 0x1415e873c
   14087beed:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bef1:	e8 5a c2 7e ff       	call   0x140068150
   14087bef6:	90                   	nop
   14087bef7:	45 33 c9             	xor    r9d,r9d
   14087befa:	41 b0 03             	mov    r8b,0x3
   14087befd:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087bf01:	48 8d 3d e8 e4 dc 01 	lea    rdi,[rip+0x1dce4e8]        # 0x14264a3f0
   14087bf08:	48 8b cf             	mov    rcx,rdi
   14087bf0b:	e8 50 da 25 00       	call   0x140ad9960
   14087bf10:	90                   	nop
   14087bf11:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bf15:	e8 36 39 7f ff       	call   0x14006f850
   14087bf1a:	48 8d 15 27 83 e3 00 	lea    rdx,[rip+0xe38327]        # 0x1416b4248
   14087bf21:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bf25:	e8 26 c2 7e ff       	call   0x140068150
   14087bf2a:	90                   	nop
   14087bf2b:	45 33 c9             	xor    r9d,r9d
   14087bf2e:	45 33 c0             	xor    r8d,r8d
   14087bf31:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087bf35:	48 8b cf             	mov    rcx,rdi
   14087bf38:	e8 23 da 25 00       	call   0x140ad9960
   14087bf3d:	90                   	nop
   14087bf3e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bf42:	e8 09 39 7f ff       	call   0x14006f850
   14087bf47:	c7 05 2b e5 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dce52b],0x1010007        # 0x14264a47c
   14087bf51:	41 8d 75 f4          	lea    esi,[r13-0xc]
   14087bf55:	48 8b fb             	mov    rdi,rbx
   14087bf58:	4c 8b 64 24 70       	mov    r12,QWORD PTR [rsp+0x70]
   14087bf5d:	4c 8d 35 8c e4 dc 01 	lea    r14,[rip+0x1dce48c]        # 0x14264a3f0
   14087bf64:	48 8d 1d 75 48 dd 01 	lea    rbx,[rip+0x1dd4875]        # 0x1426507e0
   14087bf6b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087bf70:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bf74:	83 c0 05             	add    eax,0x5
   14087bf77:	89 05 f7 e4 dc 01    	mov    DWORD PTR [rip+0x1dce4f7],eax        # 0x14264a474
   14087bf7d:	89 35 f5 e4 dc 01    	mov    DWORD PTR [rip+0x1dce4f5],esi        # 0x14264a478
   14087bf83:	45 33 c0             	xor    r8d,r8d
   14087bf86:	49 8b ce             	mov    rcx,r14
   14087bf89:	41 f6 84 24 18 01 00 00 10 	test   BYTE PTR [r12+0x118],0x10
   14087bf92:	74 05                	je     0x14087bf99
   14087bf94:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   14087bf97:	eb 03                	jmp    0x14087bf9c
   14087bf99:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087bf9c:	e8 5f f1 25 00       	call   0x140adb100
   14087bfa1:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bfa5:	83 c0 06             	add    eax,0x6
   14087bfa8:	89 05 c6 e4 dc 01    	mov    DWORD PTR [rip+0x1dce4c6],eax        # 0x14264a474
   14087bfae:	89 35 c4 e4 dc 01    	mov    DWORD PTR [rip+0x1dce4c4],esi        # 0x14264a478
   14087bfb4:	45 33 c0             	xor    r8d,r8d
   14087bfb7:	49 8b ce             	mov    rcx,r14
   14087bfba:	41 f6 84 24 18 01 00 00 10 	test   BYTE PTR [r12+0x118],0x10
   14087bfc3:	74 05                	je     0x14087bfca
   14087bfc5:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   14087bfc8:	eb 02                	jmp    0x14087bfcc
   14087bfca:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087bfcc:	e8 2f f1 25 00       	call   0x140adb100
   14087bfd1:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087bfd5:	83 c0 07             	add    eax,0x7
   14087bfd8:	89 05 96 e4 dc 01    	mov    DWORD PTR [rip+0x1dce496],eax        # 0x14264a474
   14087bfde:	89 35 94 e4 dc 01    	mov    DWORD PTR [rip+0x1dce494],esi        # 0x14264a478
   14087bfe4:	45 33 c0             	xor    r8d,r8d
   14087bfe7:	49 8b ce             	mov    rcx,r14
   14087bfea:	41 f6 84 24 18 01 00 00 10 	test   BYTE PTR [r12+0x118],0x10
   14087bff3:	74 05                	je     0x14087bffa
   14087bff5:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   14087bff8:	eb 03                	jmp    0x14087bffd
   14087bffa:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   14087bffd:	e8 fe f0 25 00       	call   0x140adb100
   14087c002:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c006:	83 c0 08             	add    eax,0x8
   14087c009:	89 05 65 e4 dc 01    	mov    DWORD PTR [rip+0x1dce465],eax        # 0x14264a474
   14087c00f:	89 35 63 e4 dc 01    	mov    DWORD PTR [rip+0x1dce463],esi        # 0x14264a478
   14087c015:	45 33 c0             	xor    r8d,r8d
   14087c018:	49 8b ce             	mov    rcx,r14
   14087c01b:	41 f6 84 24 18 01 00 00 10 	test   BYTE PTR [r12+0x118],0x10
   14087c024:	74 05                	je     0x14087c02b
   14087c026:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087c029:	eb 03                	jmp    0x14087c02e
   14087c02b:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   14087c02e:	e8 cd f0 25 00       	call   0x140adb100
   14087c033:	ff c6                	inc    esi
   14087c035:	48 83 c7 04          	add    rdi,0x4
   14087c039:	48 3b fb             	cmp    rdi,rbx
   14087c03c:	0f 8c 2e ff ff ff    	jl     0x14087bf70
   14087c042:	c7 05 30 e4 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dce430],0x1010007        # 0x14264a47c
   14087c04c:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c050:	83 c0 09             	add    eax,0x9
   14087c053:	89 05 1b e4 dc 01    	mov    DWORD PTR [rip+0x1dce41b],eax        # 0x14264a474
   14087c059:	41 8d 45 f5          	lea    eax,[r13-0xb]
   14087c05d:	89 05 15 e4 dc 01    	mov    DWORD PTR [rip+0x1dce415],eax        # 0x14264a478
   14087c063:	41 b0 03             	mov    r8b,0x3
   14087c066:	ba 5e 01 00 00       	mov    edx,0x15e
   14087c06b:	48 8d 0d 7e 21 03 01 	lea    rcx,[rip+0x103217e]        # 0x1418ae1f0
   14087c072:	e8 39 d4 3b 00       	call   0x140c394b0
   14087c077:	48 8d 15 be c6 d6 00 	lea    rdx,[rip+0xd6c6be]        # 0x1415e873c
   14087c07e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c082:	e8 c9 c0 7e ff       	call   0x140068150
   14087c087:	90                   	nop
   14087c088:	45 33 c9             	xor    r9d,r9d
   14087c08b:	41 b0 03             	mov    r8b,0x3
   14087c08e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c092:	48 8d 3d 57 e3 dc 01 	lea    rdi,[rip+0x1dce357]        # 0x14264a3f0
   14087c099:	48 8b cf             	mov    rcx,rdi
   14087c09c:	e8 bf d8 25 00       	call   0x140ad9960
   14087c0a1:	90                   	nop
   14087c0a2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c0a6:	e8 a5 37 7f ff       	call   0x14006f850
   14087c0ab:	48 8d 15 6e 80 e3 00 	lea    rdx,[rip+0xe3806e]        # 0x1416b4120
   14087c0b2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c0b6:	e8 95 c0 7e ff       	call   0x140068150
   14087c0bb:	90                   	nop
   14087c0bc:	45 33 c9             	xor    r9d,r9d
   14087c0bf:	45 33 c0             	xor    r8d,r8d
   14087c0c2:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c0c6:	48 8b cf             	mov    rcx,rdi
   14087c0c9:	e8 92 d8 25 00       	call   0x140ad9960
   14087c0ce:	90                   	nop
   14087c0cf:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c0d3:	e8 78 37 7f ff       	call   0x14006f850
   14087c0d8:	c7 05 9a e3 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dce39a],0x1010007        # 0x14264a47c
   14087c0e2:	45 8d 75 f7          	lea    r14d,[r13-0x9]
   14087c0e6:	41 8b f6             	mov    esi,r14d
   14087c0e9:	48 8d 1d e4 46 dd 01 	lea    rbx,[rip+0x1dd46e4]        # 0x1426507d4
   14087c0f0:	48 8b fb             	mov    rdi,rbx
   14087c0f3:	4c 8d 2d f6 e2 dc 01 	lea    r13,[rip+0x1dce2f6]        # 0x14264a3f0
   14087c0fa:	4c 8d 3d df 46 dd 01 	lea    r15,[rip+0x1dd46df]        # 0x1426507e0
   14087c101:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c105:	83 c0 05             	add    eax,0x5
   14087c108:	89 05 66 e3 dc 01    	mov    DWORD PTR [rip+0x1dce366],eax        # 0x14264a474
   14087c10e:	89 35 64 e3 dc 01    	mov    DWORD PTR [rip+0x1dce364],esi        # 0x14264a478
   14087c114:	45 33 c0             	xor    r8d,r8d
   14087c117:	49 8b cd             	mov    rcx,r13
   14087c11a:	41 f6 84 24 18 01 00 00 20 	test   BYTE PTR [r12+0x118],0x20
   14087c123:	74 05                	je     0x14087c12a
   14087c125:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   14087c128:	eb 03                	jmp    0x14087c12d
   14087c12a:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087c12d:	e8 ce ef 25 00       	call   0x140adb100
   14087c132:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c136:	83 c0 06             	add    eax,0x6
   14087c139:	89 05 35 e3 dc 01    	mov    DWORD PTR [rip+0x1dce335],eax        # 0x14264a474
   14087c13f:	89 35 33 e3 dc 01    	mov    DWORD PTR [rip+0x1dce333],esi        # 0x14264a478
   14087c145:	45 33 c0             	xor    r8d,r8d
   14087c148:	49 8b cd             	mov    rcx,r13
   14087c14b:	41 f6 84 24 18 01 00 00 20 	test   BYTE PTR [r12+0x118],0x20
   14087c154:	74 05                	je     0x14087c15b
   14087c156:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   14087c159:	eb 02                	jmp    0x14087c15d
   14087c15b:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c15d:	e8 9e ef 25 00       	call   0x140adb100
   14087c162:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c166:	83 c0 07             	add    eax,0x7
   14087c169:	89 05 05 e3 dc 01    	mov    DWORD PTR [rip+0x1dce305],eax        # 0x14264a474
   14087c16f:	89 35 03 e3 dc 01    	mov    DWORD PTR [rip+0x1dce303],esi        # 0x14264a478
   14087c175:	45 33 c0             	xor    r8d,r8d
   14087c178:	49 8b cd             	mov    rcx,r13
   14087c17b:	41 f6 84 24 18 01 00 00 20 	test   BYTE PTR [r12+0x118],0x20
   14087c184:	74 05                	je     0x14087c18b
   14087c186:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   14087c189:	eb 03                	jmp    0x14087c18e
   14087c18b:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   14087c18e:	e8 6d ef 25 00       	call   0x140adb100
   14087c193:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c197:	83 c0 08             	add    eax,0x8
   14087c19a:	89 05 d4 e2 dc 01    	mov    DWORD PTR [rip+0x1dce2d4],eax        # 0x14264a474
   14087c1a0:	89 35 d2 e2 dc 01    	mov    DWORD PTR [rip+0x1dce2d2],esi        # 0x14264a478
   14087c1a6:	45 33 c0             	xor    r8d,r8d
   14087c1a9:	49 8b cd             	mov    rcx,r13
   14087c1ac:	41 f6 84 24 18 01 00 00 20 	test   BYTE PTR [r12+0x118],0x20
   14087c1b5:	74 05                	je     0x14087c1bc
   14087c1b7:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087c1ba:	eb 03                	jmp    0x14087c1bf
   14087c1bc:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   14087c1bf:	e8 3c ef 25 00       	call   0x140adb100
   14087c1c4:	ff c6                	inc    esi
   14087c1c6:	48 83 c7 04          	add    rdi,0x4
   14087c1ca:	49 3b ff             	cmp    rdi,r15
   14087c1cd:	0f 8c 2e ff ff ff    	jl     0x14087c101
   14087c1d3:	c7 05 9f e2 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dce29f],0x1010007        # 0x14264a47c
   14087c1dd:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c1e1:	83 c0 09             	add    eax,0x9
   14087c1e4:	89 05 8a e2 dc 01    	mov    DWORD PTR [rip+0x1dce28a],eax        # 0x14264a474
   14087c1ea:	41 8d 46 01          	lea    eax,[r14+0x1]
   14087c1ee:	89 05 84 e2 dc 01    	mov    DWORD PTR [rip+0x1dce284],eax        # 0x14264a478
   14087c1f4:	41 b0 03             	mov    r8b,0x3
   14087c1f7:	ba 5f 01 00 00       	mov    edx,0x15f
   14087c1fc:	48 8d 0d ed 1f 03 01 	lea    rcx,[rip+0x1031fed]        # 0x1418ae1f0
   14087c203:	e8 a8 d2 3b 00       	call   0x140c394b0
   14087c208:	48 8d 15 2d c5 d6 00 	lea    rdx,[rip+0xd6c52d]        # 0x1415e873c
   14087c20f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c213:	e8 38 bf 7e ff       	call   0x140068150
   14087c218:	90                   	nop
   14087c219:	45 33 c9             	xor    r9d,r9d
   14087c21c:	41 b0 03             	mov    r8b,0x3
   14087c21f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c223:	49 8b cd             	mov    rcx,r13
   14087c226:	e8 35 d7 25 00       	call   0x140ad9960
   14087c22b:	90                   	nop
   14087c22c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c230:	e8 1b 36 7f ff       	call   0x14006f850
   14087c235:	48 8d 15 54 7f e3 00 	lea    rdx,[rip+0xe37f54]        # 0x1416b4190
   14087c23c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c240:	e8 0b bf 7e ff       	call   0x140068150
   14087c245:	90                   	nop
   14087c246:	45 33 c9             	xor    r9d,r9d
   14087c249:	45 33 c0             	xor    r8d,r8d
   14087c24c:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c250:	49 8b cd             	mov    rcx,r13
   14087c253:	e8 08 d7 25 00       	call   0x140ad9960
   14087c258:	90                   	nop
   14087c259:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c25d:	e8 ee 35 7f ff       	call   0x14006f850
   14087c262:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087c266:	e9 52 01 00 00       	jmp    0x14087c3bd
   14087c26b:	45 33 c0             	xor    r8d,r8d
   14087c26e:	ba 06 00 00 00       	mov    edx,0x6
   14087c273:	41 b1 01             	mov    r9b,0x1
   14087c276:	48 8b ce             	mov    rcx,rsi
   14087c279:	e8 b2 ee 83 ff       	call   0x1400bb130
   14087c27e:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   14087c283:	41 83 c0 09          	add    r8d,0x9
   14087c287:	41 8d 55 ef          	lea    edx,[r13-0x11]
   14087c28b:	48 8b ce             	mov    rcx,rsi
   14087c28e:	e8 8d ee 83 ff       	call   0x1400bb120
   14087c293:	48 8d 15 8e 7f e3 00 	lea    rdx,[rip+0xe37f8e]        # 0x1416b4228
   14087c29a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c29e:	e8 ad be 7e ff       	call   0x140068150
   14087c2a3:	90                   	nop
   14087c2a4:	45 33 c9             	xor    r9d,r9d
   14087c2a7:	45 33 c0             	xor    r8d,r8d
   14087c2aa:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c2ae:	48 8b ce             	mov    rcx,rsi
   14087c2b1:	e8 aa d6 25 00       	call   0x140ad9960
   14087c2b6:	90                   	nop
   14087c2b7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c2bb:	e8 70 bb 7e ff       	call   0x140067e30
   14087c2c0:	45 33 c0             	xor    r8d,r8d
   14087c2c3:	ba 06 00 00 00       	mov    edx,0x6
   14087c2c8:	41 b1 01             	mov    r9b,0x1
   14087c2cb:	48 8b ce             	mov    rcx,rsi
   14087c2ce:	e8 5d ee 83 ff       	call   0x1400bb130
   14087c2d3:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   14087c2d8:	41 83 c0 09          	add    r8d,0x9
   14087c2dc:	41 8d 55 f2          	lea    edx,[r13-0xe]
   14087c2e0:	48 8b ce             	mov    rcx,rsi
   14087c2e3:	e8 38 ee 83 ff       	call   0x1400bb120
   14087c2e8:	48 8d 15 99 7f e3 00 	lea    rdx,[rip+0xe37f99]        # 0x1416b4288
   14087c2ef:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c2f3:	e8 58 be 7e ff       	call   0x140068150
   14087c2f8:	90                   	nop
   14087c2f9:	45 33 c9             	xor    r9d,r9d
   14087c2fc:	45 33 c0             	xor    r8d,r8d
   14087c2ff:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c303:	48 8b ce             	mov    rcx,rsi
   14087c306:	e8 55 d6 25 00       	call   0x140ad9960
   14087c30b:	90                   	nop
   14087c30c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c310:	e8 1b bb 7e ff       	call   0x140067e30
   14087c315:	c7 05 5d e1 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dce15d],0x1010007        # 0x14264a47c
   14087c31f:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c323:	83 c0 09             	add    eax,0x9
   14087c326:	89 05 48 e1 dc 01    	mov    DWORD PTR [rip+0x1dce148],eax        # 0x14264a474
   14087c32c:	41 8d 45 f5          	lea    eax,[r13-0xb]
   14087c330:	89 05 42 e1 dc 01    	mov    DWORD PTR [rip+0x1dce142],eax        # 0x14264a478
   14087c336:	48 8d 15 33 7e e3 00 	lea    rdx,[rip+0xe37e33]        # 0x1416b4170
   14087c33d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c341:	e8 0a be 7e ff       	call   0x140068150
   14087c346:	90                   	nop
   14087c347:	45 33 c9             	xor    r9d,r9d
   14087c34a:	45 33 c0             	xor    r8d,r8d
   14087c34d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c351:	48 8b ce             	mov    rcx,rsi
   14087c354:	e8 07 d6 25 00       	call   0x140ad9960
   14087c359:	90                   	nop
   14087c35a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c35e:	e8 ed 34 7f ff       	call   0x14006f850
   14087c363:	c7 05 0f e1 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dce10f],0x1010006        # 0x14264a47c
   14087c36d:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c371:	83 c0 09             	add    eax,0x9
   14087c374:	89 05 fa e0 dc 01    	mov    DWORD PTR [rip+0x1dce0fa],eax        # 0x14264a474
   14087c37a:	41 8d 45 f8          	lea    eax,[r13-0x8]
   14087c37e:	89 05 f4 e0 dc 01    	mov    DWORD PTR [rip+0x1dce0f4],eax        # 0x14264a478
   14087c384:	48 8d 15 3d 7e e3 00 	lea    rdx,[rip+0xe37e3d]        # 0x1416b41c8
   14087c38b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c38f:	e8 bc bd 7e ff       	call   0x140068150
   14087c394:	90                   	nop
   14087c395:	45 33 c9             	xor    r9d,r9d
   14087c398:	45 33 c0             	xor    r8d,r8d
   14087c39b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c39f:	4c 8d 2d 4a e0 dc 01 	lea    r13,[rip+0x1dce04a]        # 0x14264a3f0
   14087c3a6:	49 8b cd             	mov    rcx,r13
   14087c3a9:	e8 b2 d5 25 00       	call   0x140ad9960
   14087c3ae:	90                   	nop
   14087c3af:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c3b3:	e8 98 34 7f ff       	call   0x14006f850
   14087c3b8:	4c 8b 64 24 70       	mov    r12,QWORD PTR [rsp+0x70]
   14087c3bd:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c3c1:	83 c0 09             	add    eax,0x9
   14087c3c4:	89 05 aa e0 dc 01    	mov    DWORD PTR [rip+0x1dce0aa],eax        # 0x14264a474
   14087c3ca:	44 8b 75 84          	mov    r14d,DWORD PTR [rbp-0x7c]
   14087c3ce:	41 8d 46 01          	lea    eax,[r14+0x1]
   14087c3d2:	89 05 a0 e0 dc 01    	mov    DWORD PTR [rip+0x1dce0a0],eax        # 0x14264a478
   14087c3d8:	41 8b 84 24 1c 01 00 00 	mov    eax,DWORD PTR [r12+0x11c]
   14087c3e0:	ff c0                	inc    eax
   14087c3e2:	83 f8 12             	cmp    eax,0x12
   14087c3e5:	0f 87 f0 05 00 00    	ja     0x14087c9db
   14087c3eb:	48 98                	cdqe
   14087c3ed:	48 8d 15 0c 3c 78 ff 	lea    rdx,[rip+0xffffffffff783c0c]        # 0x140000000
   14087c3f4:	8b 8c 82 94 00 88 00 	mov    ecx,DWORD PTR [rdx+rax*4+0x880094]
   14087c3fb:	48 03 ca             	add    rcx,rdx
   14087c3fe:	ff e1                	jmp    rcx
   14087c400:	c7 05 72 e0 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dce072],0x1010006        # 0x14264a47c
   14087c40a:	48 8d 15 e7 7a e3 00 	lea    rdx,[rip+0xe37ae7]        # 0x1416b3ef8
   14087c411:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c415:	e8 36 bd 7e ff       	call   0x140068150
   14087c41a:	90                   	nop
   14087c41b:	45 33 c9             	xor    r9d,r9d
   14087c41e:	45 33 c0             	xor    r8d,r8d
   14087c421:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c425:	49 8b cd             	mov    rcx,r13
   14087c428:	e8 33 d5 25 00       	call   0x140ad9960
   14087c42d:	90                   	nop
   14087c42e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c432:	e8 19 34 7f ff       	call   0x14006f850
   14087c437:	e9 9f 05 00 00       	jmp    0x14087c9db
   14087c43c:	c7 05 36 e0 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dce036],0x1010006        # 0x14264a47c
   14087c446:	48 8d 15 83 7a e3 00 	lea    rdx,[rip+0xe37a83]        # 0x1416b3ed0
   14087c44d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c451:	e8 fa bc 7e ff       	call   0x140068150
   14087c456:	90                   	nop
   14087c457:	45 33 c9             	xor    r9d,r9d
   14087c45a:	45 33 c0             	xor    r8d,r8d
   14087c45d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c461:	49 8b cd             	mov    rcx,r13
   14087c464:	e8 f7 d4 25 00       	call   0x140ad9960
   14087c469:	90                   	nop
   14087c46a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c46e:	e8 dd 33 7f ff       	call   0x14006f850
   14087c473:	e9 63 05 00 00       	jmp    0x14087c9db
   14087c478:	c7 05 fa df dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdffa],0x1010006        # 0x14264a47c
   14087c482:	48 8d 15 b7 7a e3 00 	lea    rdx,[rip+0xe37ab7]        # 0x1416b3f40
   14087c489:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c48d:	e8 be bc 7e ff       	call   0x140068150
   14087c492:	90                   	nop
   14087c493:	45 33 c9             	xor    r9d,r9d
   14087c496:	45 33 c0             	xor    r8d,r8d
   14087c499:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c49d:	49 8b cd             	mov    rcx,r13
   14087c4a0:	e8 bb d4 25 00       	call   0x140ad9960
   14087c4a5:	90                   	nop
   14087c4a6:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c4aa:	e8 a1 33 7f ff       	call   0x14006f850
   14087c4af:	e9 27 05 00 00       	jmp    0x14087c9db
   14087c4b4:	c7 05 be df dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdfbe],0x1010006        # 0x14264a47c
   14087c4be:	48 8d 15 53 7a e3 00 	lea    rdx,[rip+0xe37a53]        # 0x1416b3f18
   14087c4c5:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c4c9:	e8 82 bc 7e ff       	call   0x140068150
   14087c4ce:	90                   	nop
   14087c4cf:	45 33 c9             	xor    r9d,r9d
   14087c4d2:	45 33 c0             	xor    r8d,r8d
   14087c4d5:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c4d9:	49 8b cd             	mov    rcx,r13
   14087c4dc:	e8 7f d4 25 00       	call   0x140ad9960
   14087c4e1:	90                   	nop
   14087c4e2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c4e6:	e8 65 33 7f ff       	call   0x14006f850
   14087c4eb:	e9 eb 04 00 00       	jmp    0x14087c9db
   14087c4f0:	c7 05 82 df dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdf82],0x1010006        # 0x14264a47c
   14087c4fa:	48 8d 15 3f 79 e3 00 	lea    rdx,[rip+0xe3793f]        # 0x1416b3e40
   14087c501:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c505:	e8 46 bc 7e ff       	call   0x140068150
   14087c50a:	90                   	nop
   14087c50b:	45 33 c9             	xor    r9d,r9d
   14087c50e:	45 33 c0             	xor    r8d,r8d
   14087c511:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c515:	49 8b cd             	mov    rcx,r13
   14087c518:	e8 43 d4 25 00       	call   0x140ad9960
   14087c51d:	90                   	nop
   14087c51e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c522:	e8 29 33 7f ff       	call   0x14006f850
   14087c527:	e9 af 04 00 00       	jmp    0x14087c9db
   14087c52c:	c7 05 46 df dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdf46],0x1010006        # 0x14264a47c
   14087c536:	48 8d 15 db 78 e3 00 	lea    rdx,[rip+0xe378db]        # 0x1416b3e18
   14087c53d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c541:	e8 0a bc 7e ff       	call   0x140068150
   14087c546:	90                   	nop
   14087c547:	45 33 c9             	xor    r9d,r9d
   14087c54a:	45 33 c0             	xor    r8d,r8d
   14087c54d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c551:	49 8b cd             	mov    rcx,r13
   14087c554:	e8 07 d4 25 00       	call   0x140ad9960
   14087c559:	90                   	nop
   14087c55a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c55e:	e8 ed 32 7f ff       	call   0x14006f850
   14087c563:	e9 73 04 00 00       	jmp    0x14087c9db
   14087c568:	c7 05 0a df dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdf0a],0x1010006        # 0x14264a47c
   14087c572:	48 8d 15 27 79 e3 00 	lea    rdx,[rip+0xe37927]        # 0x1416b3ea0
   14087c579:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c57d:	e8 ce bb 7e ff       	call   0x140068150
   14087c582:	90                   	nop
   14087c583:	45 33 c9             	xor    r9d,r9d
   14087c586:	45 33 c0             	xor    r8d,r8d
   14087c589:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c58d:	49 8b cd             	mov    rcx,r13
   14087c590:	e8 cb d3 25 00       	call   0x140ad9960
   14087c595:	90                   	nop
   14087c596:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c59a:	e8 b1 32 7f ff       	call   0x14006f850
   14087c59f:	e9 37 04 00 00       	jmp    0x14087c9db
   14087c5a4:	c7 05 ce de dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdece],0x1010006        # 0x14264a47c
   14087c5ae:	48 8d 15 c3 78 e3 00 	lea    rdx,[rip+0xe378c3]        # 0x1416b3e78
   14087c5b5:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c5b9:	e8 92 bb 7e ff       	call   0x140068150
   14087c5be:	90                   	nop
   14087c5bf:	45 33 c9             	xor    r9d,r9d
   14087c5c2:	45 33 c0             	xor    r8d,r8d
   14087c5c5:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c5c9:	49 8b cd             	mov    rcx,r13
   14087c5cc:	e8 8f d3 25 00       	call   0x140ad9960
   14087c5d1:	90                   	nop
   14087c5d2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c5d6:	e8 75 32 7f ff       	call   0x14006f850
   14087c5db:	e9 fb 03 00 00       	jmp    0x14087c9db
   14087c5e0:	c7 05 92 de dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcde92],0x1010006        # 0x14264a47c
   14087c5ea:	48 8d 15 57 7a e3 00 	lea    rdx,[rip+0xe37a57]        # 0x1416b4048
   14087c5f1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c5f5:	e8 56 bb 7e ff       	call   0x140068150
   14087c5fa:	90                   	nop
   14087c5fb:	45 33 c9             	xor    r9d,r9d
   14087c5fe:	45 33 c0             	xor    r8d,r8d
   14087c601:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c605:	49 8b cd             	mov    rcx,r13
   14087c608:	e8 53 d3 25 00       	call   0x140ad9960
   14087c60d:	90                   	nop
   14087c60e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c612:	e8 39 32 7f ff       	call   0x14006f850
   14087c617:	e9 bf 03 00 00       	jmp    0x14087c9db
   14087c61c:	c7 05 56 de dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcde56],0x1010006        # 0x14264a47c
   14087c626:	48 8d 15 f3 79 e3 00 	lea    rdx,[rip+0xe379f3]        # 0x1416b4020
   14087c62d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c631:	e8 1a bb 7e ff       	call   0x140068150
   14087c636:	90                   	nop
   14087c637:	45 33 c9             	xor    r9d,r9d
   14087c63a:	45 33 c0             	xor    r8d,r8d
   14087c63d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c641:	49 8b cd             	mov    rcx,r13
   14087c644:	e8 17 d3 25 00       	call   0x140ad9960
   14087c649:	90                   	nop
   14087c64a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c64e:	e8 dd b7 7e ff       	call   0x140067e30
   14087c653:	e9 83 03 00 00       	jmp    0x14087c9db
   14087c658:	45 33 c0             	xor    r8d,r8d
   14087c65b:	ba 06 00 00 00       	mov    edx,0x6
   14087c660:	41 b1 01             	mov    r9b,0x1
   14087c663:	49 8b cd             	mov    rcx,r13
   14087c666:	e8 c5 ea 83 ff       	call   0x1400bb130
   14087c66b:	48 8d 15 3e 7a e3 00 	lea    rdx,[rip+0xe37a3e]        # 0x1416b40b0
   14087c672:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c676:	e8 d5 ba 7e ff       	call   0x140068150
   14087c67b:	90                   	nop
   14087c67c:	45 33 c9             	xor    r9d,r9d
   14087c67f:	45 33 c0             	xor    r8d,r8d
   14087c682:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c686:	49 8b cd             	mov    rcx,r13
   14087c689:	e8 d2 d2 25 00       	call   0x140ad9960
   14087c68e:	90                   	nop
   14087c68f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c693:	e8 98 b7 7e ff       	call   0x140067e30
   14087c698:	e9 3e 03 00 00       	jmp    0x14087c9db
   14087c69d:	45 33 c0             	xor    r8d,r8d
   14087c6a0:	ba 06 00 00 00       	mov    edx,0x6
   14087c6a5:	41 b1 01             	mov    r9b,0x1
   14087c6a8:	49 8b cd             	mov    rcx,r13
   14087c6ab:	e8 80 ea 83 ff       	call   0x1400bb130
   14087c6b0:	48 8d 15 c1 79 e3 00 	lea    rdx,[rip+0xe379c1]        # 0x1416b4078
   14087c6b7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c6bb:	e8 90 ba 7e ff       	call   0x140068150
   14087c6c0:	90                   	nop
   14087c6c1:	45 33 c9             	xor    r9d,r9d
   14087c6c4:	45 33 c0             	xor    r8d,r8d
   14087c6c7:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c6cb:	49 8b cd             	mov    rcx,r13
   14087c6ce:	e8 8d d2 25 00       	call   0x140ad9960
   14087c6d3:	90                   	nop
   14087c6d4:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c6d8:	e8 53 b7 7e ff       	call   0x140067e30
   14087c6dd:	e9 f9 02 00 00       	jmp    0x14087c9db
   14087c6e2:	45 33 c0             	xor    r8d,r8d
   14087c6e5:	ba 06 00 00 00       	mov    edx,0x6
   14087c6ea:	41 b1 01             	mov    r9b,0x1
   14087c6ed:	49 8b cd             	mov    rcx,r13
   14087c6f0:	e8 3b ea 83 ff       	call   0x1400bb130
   14087c6f5:	48 8d 15 9c 78 e3 00 	lea    rdx,[rip+0xe3789c]        # 0x1416b3f98
   14087c6fc:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c700:	e8 4b ba 7e ff       	call   0x140068150
   14087c705:	90                   	nop
   14087c706:	45 33 c9             	xor    r9d,r9d
   14087c709:	45 33 c0             	xor    r8d,r8d
   14087c70c:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c710:	49 8b cd             	mov    rcx,r13
   14087c713:	e8 48 d2 25 00       	call   0x140ad9960
   14087c718:	90                   	nop
   14087c719:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c71d:	e8 0e b7 7e ff       	call   0x140067e30
   14087c722:	e9 b4 02 00 00       	jmp    0x14087c9db
   14087c727:	45 33 c0             	xor    r8d,r8d
   14087c72a:	ba 06 00 00 00       	mov    edx,0x6
   14087c72f:	41 b1 01             	mov    r9b,0x1
   14087c732:	49 8b cd             	mov    rcx,r13
   14087c735:	e8 f6 e9 83 ff       	call   0x1400bb130
   14087c73a:	48 8d 15 27 78 e3 00 	lea    rdx,[rip+0xe37827]        # 0x1416b3f68
   14087c741:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c745:	e8 06 ba 7e ff       	call   0x140068150
   14087c74a:	90                   	nop
   14087c74b:	45 33 c9             	xor    r9d,r9d
   14087c74e:	45 33 c0             	xor    r8d,r8d
   14087c751:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c755:	49 8b cd             	mov    rcx,r13
   14087c758:	e8 03 d2 25 00       	call   0x140ad9960
   14087c75d:	90                   	nop
   14087c75e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c762:	e8 c9 b6 7e ff       	call   0x140067e30
   14087c767:	e9 6f 02 00 00       	jmp    0x14087c9db
   14087c76c:	45 33 c0             	xor    r8d,r8d
   14087c76f:	ba 06 00 00 00       	mov    edx,0x6
   14087c774:	41 b1 01             	mov    r9b,0x1
   14087c777:	49 8b cd             	mov    rcx,r13
   14087c77a:	e8 b1 e9 83 ff       	call   0x1400bb130
   14087c77f:	48 8d 15 72 78 e3 00 	lea    rdx,[rip+0xe37872]        # 0x1416b3ff8
   14087c786:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c78a:	e8 c1 b9 7e ff       	call   0x140068150
   14087c78f:	90                   	nop
   14087c790:	45 33 c9             	xor    r9d,r9d
   14087c793:	45 33 c0             	xor    r8d,r8d
   14087c796:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c79a:	49 8b cd             	mov    rcx,r13
   14087c79d:	e8 be d1 25 00       	call   0x140ad9960
   14087c7a2:	90                   	nop
   14087c7a3:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c7a7:	e8 84 b6 7e ff       	call   0x140067e30
   14087c7ac:	e9 2a 02 00 00       	jmp    0x14087c9db
   14087c7b1:	c7 05 c1 dc dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdcc1],0x1010006        # 0x14264a47c
   14087c7bb:	48 8d 15 06 78 e3 00 	lea    rdx,[rip+0xe37806]        # 0x1416b3fc8
   14087c7c2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c7c6:	e8 85 b9 7e ff       	call   0x140068150
   14087c7cb:	90                   	nop
   14087c7cc:	45 33 c9             	xor    r9d,r9d
   14087c7cf:	45 33 c0             	xor    r8d,r8d
   14087c7d2:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c7d6:	49 8b cd             	mov    rcx,r13
   14087c7d9:	e8 82 d1 25 00       	call   0x140ad9960
   14087c7de:	90                   	nop
   14087c7df:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c7e3:	e8 68 30 7f ff       	call   0x14006f850
   14087c7e8:	e9 ee 01 00 00       	jmp    0x14087c9db
   14087c7ed:	c7 05 85 dc dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdc85],0x1010006        # 0x14264a47c
   14087c7f7:	48 8d 15 0a 75 e3 00 	lea    rdx,[rip+0xe3750a]        # 0x1416b3d08
   14087c7fe:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c802:	e8 49 b9 7e ff       	call   0x140068150
   14087c807:	90                   	nop
   14087c808:	45 33 c9             	xor    r9d,r9d
   14087c80b:	45 33 c0             	xor    r8d,r8d
   14087c80e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c812:	49 8b cd             	mov    rcx,r13
   14087c815:	e8 46 d1 25 00       	call   0x140ad9960
   14087c81a:	90                   	nop
   14087c81b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c81f:	e8 0c b6 7e ff       	call   0x140067e30
   14087c824:	e9 b2 01 00 00       	jmp    0x14087c9db
   14087c829:	c7 05 49 dc dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dcdc49],0x1010006        # 0x14264a47c
   14087c833:	48 8d 15 a6 74 e3 00 	lea    rdx,[rip+0xe374a6]        # 0x1416b3ce0
   14087c83a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c83e:	e8 0d b9 7e ff       	call   0x140068150
   14087c843:	90                   	nop
   14087c844:	45 33 c9             	xor    r9d,r9d
   14087c847:	45 33 c0             	xor    r8d,r8d
   14087c84a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c84e:	49 8b cd             	mov    rcx,r13
   14087c851:	e8 0a d1 25 00       	call   0x140ad9960
   14087c856:	90                   	nop
   14087c857:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c85b:	e8 f0 2f 7f ff       	call   0x14006f850
   14087c860:	e9 76 01 00 00       	jmp    0x14087c9db
   14087c865:	c7 05 0d dc dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dcdc0d],0x1010007        # 0x14264a47c
   14087c86f:	41 8b f6             	mov    esi,r14d
   14087c872:	48 8b fb             	mov    rdi,rbx
   14087c875:	4c 8d 3d 64 3f dd 01 	lea    r15,[rip+0x1dd3f64]        # 0x1426507e0
   14087c87c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c880:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c884:	83 c0 05             	add    eax,0x5
   14087c887:	89 05 e7 db dc 01    	mov    DWORD PTR [rip+0x1dcdbe7],eax        # 0x14264a474
   14087c88d:	89 35 e5 db dc 01    	mov    DWORD PTR [rip+0x1dcdbe5],esi        # 0x14264a478
   14087c893:	45 33 c0             	xor    r8d,r8d
   14087c896:	49 8b cd             	mov    rcx,r13
   14087c899:	41 f6 84 24 18 01 00 00 01 	test   BYTE PTR [r12+0x118],0x1
   14087c8a2:	74 05                	je     0x14087c8a9
   14087c8a4:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   14087c8a7:	eb 03                	jmp    0x14087c8ac
   14087c8a9:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087c8ac:	e8 4f e8 25 00       	call   0x140adb100
   14087c8b1:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c8b5:	83 c0 06             	add    eax,0x6
   14087c8b8:	89 05 b6 db dc 01    	mov    DWORD PTR [rip+0x1dcdbb6],eax        # 0x14264a474
   14087c8be:	89 35 b4 db dc 01    	mov    DWORD PTR [rip+0x1dcdbb4],esi        # 0x14264a478
   14087c8c4:	45 33 c0             	xor    r8d,r8d
   14087c8c7:	49 8b cd             	mov    rcx,r13
   14087c8ca:	41 f6 84 24 18 01 00 00 01 	test   BYTE PTR [r12+0x118],0x1
   14087c8d3:	74 05                	je     0x14087c8da
   14087c8d5:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   14087c8d8:	eb 02                	jmp    0x14087c8dc
   14087c8da:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c8dc:	e8 1f e8 25 00       	call   0x140adb100
   14087c8e1:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c8e5:	83 c0 07             	add    eax,0x7
   14087c8e8:	89 05 86 db dc 01    	mov    DWORD PTR [rip+0x1dcdb86],eax        # 0x14264a474
   14087c8ee:	89 35 84 db dc 01    	mov    DWORD PTR [rip+0x1dcdb84],esi        # 0x14264a478
   14087c8f4:	45 33 c0             	xor    r8d,r8d
   14087c8f7:	49 8b cd             	mov    rcx,r13
   14087c8fa:	41 f6 84 24 18 01 00 00 01 	test   BYTE PTR [r12+0x118],0x1
   14087c903:	74 05                	je     0x14087c90a
   14087c905:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   14087c908:	eb 03                	jmp    0x14087c90d
   14087c90a:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   14087c90d:	e8 ee e7 25 00       	call   0x140adb100
   14087c912:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c916:	83 c0 08             	add    eax,0x8
   14087c919:	89 05 55 db dc 01    	mov    DWORD PTR [rip+0x1dcdb55],eax        # 0x14264a474
   14087c91f:	89 35 53 db dc 01    	mov    DWORD PTR [rip+0x1dcdb53],esi        # 0x14264a478
   14087c925:	45 33 c0             	xor    r8d,r8d
   14087c928:	49 8b cd             	mov    rcx,r13
   14087c92b:	41 f6 84 24 18 01 00 00 01 	test   BYTE PTR [r12+0x118],0x1
   14087c934:	74 05                	je     0x14087c93b
   14087c936:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087c939:	eb 03                	jmp    0x14087c93e
   14087c93b:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   14087c93e:	e8 bd e7 25 00       	call   0x140adb100
   14087c943:	ff c6                	inc    esi
   14087c945:	48 83 c7 04          	add    rdi,0x4
   14087c949:	49 3b ff             	cmp    rdi,r15
   14087c94c:	0f 8c 2e ff ff ff    	jl     0x14087c880
   14087c952:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c956:	83 c0 09             	add    eax,0x9
   14087c959:	89 05 15 db dc 01    	mov    DWORD PTR [rip+0x1dcdb15],eax        # 0x14264a474
   14087c95f:	41 8d 46 01          	lea    eax,[r14+0x1]
   14087c963:	89 05 0f db dc 01    	mov    DWORD PTR [rip+0x1dcdb0f],eax        # 0x14264a478
   14087c969:	41 b0 03             	mov    r8b,0x3
   14087c96c:	ba 60 01 00 00       	mov    edx,0x160
   14087c971:	48 8d 0d 78 18 03 01 	lea    rcx,[rip+0x1031878]        # 0x1418ae1f0
   14087c978:	e8 33 cb 3b 00       	call   0x140c394b0
   14087c97d:	48 8d 15 b8 bd d6 00 	lea    rdx,[rip+0xd6bdb8]        # 0x1415e873c
   14087c984:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c988:	e8 c3 b7 7e ff       	call   0x140068150
   14087c98d:	90                   	nop
   14087c98e:	45 33 c9             	xor    r9d,r9d
   14087c991:	41 b0 03             	mov    r8b,0x3
   14087c994:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c998:	49 8b cd             	mov    rcx,r13
   14087c99b:	e8 c0 cf 25 00       	call   0x140ad9960
   14087c9a0:	90                   	nop
   14087c9a1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c9a5:	e8 a6 2e 7f ff       	call   0x14006f850
   14087c9aa:	48 8d 15 cf 73 e3 00 	lea    rdx,[rip+0xe373cf]        # 0x1416b3d80
   14087c9b1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c9b5:	e8 96 b7 7e ff       	call   0x140068150
   14087c9ba:	90                   	nop
   14087c9bb:	45 33 c9             	xor    r9d,r9d
   14087c9be:	45 33 c0             	xor    r8d,r8d
   14087c9c1:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087c9c5:	49 8b cd             	mov    rcx,r13
   14087c9c8:	e8 93 cf 25 00       	call   0x140ad9960
   14087c9cd:	90                   	nop
   14087c9ce:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087c9d2:	e8 79 2e 7f ff       	call   0x14006f850
   14087c9d7:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087c9db:	c7 05 97 da dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dcda97],0x1010007        # 0x14264a47c
   14087c9e5:	41 8b ff             	mov    edi,r15d
   14087c9e8:	4c 8d 3d f1 3d dd 01 	lea    r15,[rip+0x1dd3df1]        # 0x1426507e0
   14087c9ef:	90                   	nop
   14087c9f0:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087c9f4:	83 c0 05             	add    eax,0x5
   14087c9f7:	89 05 77 da dc 01    	mov    DWORD PTR [rip+0x1dcda77],eax        # 0x14264a474
   14087c9fd:	89 3d 75 da dc 01    	mov    DWORD PTR [rip+0x1dcda75],edi        # 0x14264a478
   14087ca03:	45 33 c0             	xor    r8d,r8d
   14087ca06:	49 8b cd             	mov    rcx,r13
   14087ca09:	41 f6 84 24 18 01 00 00 02 	test   BYTE PTR [r12+0x118],0x2
   14087ca12:	74 05                	je     0x14087ca19
   14087ca14:	8b 53 c4             	mov    edx,DWORD PTR [rbx-0x3c]
   14087ca17:	eb 03                	jmp    0x14087ca1c
   14087ca19:	8b 53 f4             	mov    edx,DWORD PTR [rbx-0xc]
   14087ca1c:	e8 df e6 25 00       	call   0x140adb100
   14087ca21:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087ca25:	83 c0 06             	add    eax,0x6
   14087ca28:	89 05 46 da dc 01    	mov    DWORD PTR [rip+0x1dcda46],eax        # 0x14264a474
   14087ca2e:	89 3d 44 da dc 01    	mov    DWORD PTR [rip+0x1dcda44],edi        # 0x14264a478
   14087ca34:	45 33 c0             	xor    r8d,r8d
   14087ca37:	49 8b cd             	mov    rcx,r13
   14087ca3a:	41 f6 84 24 18 01 00 00 02 	test   BYTE PTR [r12+0x118],0x2
   14087ca43:	74 05                	je     0x14087ca4a
   14087ca45:	8b 53 d0             	mov    edx,DWORD PTR [rbx-0x30]
   14087ca48:	eb 02                	jmp    0x14087ca4c
   14087ca4a:	8b 13                	mov    edx,DWORD PTR [rbx]
   14087ca4c:	e8 af e6 25 00       	call   0x140adb100
   14087ca51:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087ca55:	83 c0 07             	add    eax,0x7
   14087ca58:	89 05 16 da dc 01    	mov    DWORD PTR [rip+0x1dcda16],eax        # 0x14264a474
   14087ca5e:	89 3d 14 da dc 01    	mov    DWORD PTR [rip+0x1dcda14],edi        # 0x14264a478
   14087ca64:	45 33 c0             	xor    r8d,r8d
   14087ca67:	49 8b cd             	mov    rcx,r13
   14087ca6a:	41 f6 84 24 18 01 00 00 02 	test   BYTE PTR [r12+0x118],0x2
   14087ca73:	74 05                	je     0x14087ca7a
   14087ca75:	8b 53 dc             	mov    edx,DWORD PTR [rbx-0x24]
   14087ca78:	eb 03                	jmp    0x14087ca7d
   14087ca7a:	8b 53 0c             	mov    edx,DWORD PTR [rbx+0xc]
   14087ca7d:	e8 7e e6 25 00       	call   0x140adb100
   14087ca82:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087ca86:	83 c0 08             	add    eax,0x8
   14087ca89:	89 05 e5 d9 dc 01    	mov    DWORD PTR [rip+0x1dcd9e5],eax        # 0x14264a474
   14087ca8f:	89 3d e3 d9 dc 01    	mov    DWORD PTR [rip+0x1dcd9e3],edi        # 0x14264a478
   14087ca95:	45 33 c0             	xor    r8d,r8d
   14087ca98:	49 8b cd             	mov    rcx,r13
   14087ca9b:	41 f6 84 24 18 01 00 00 02 	test   BYTE PTR [r12+0x118],0x2
   14087caa4:	74 05                	je     0x14087caab
   14087caa6:	8b 53 e8             	mov    edx,DWORD PTR [rbx-0x18]
   14087caa9:	eb 03                	jmp    0x14087caae
   14087caab:	8b 53 18             	mov    edx,DWORD PTR [rbx+0x18]
   14087caae:	e8 4d e6 25 00       	call   0x140adb100
   14087cab3:	ff c7                	inc    edi
   14087cab5:	48 83 c3 04          	add    rbx,0x4
   14087cab9:	49 3b df             	cmp    rbx,r15
   14087cabc:	0f 8c 2e ff ff ff    	jl     0x14087c9f0
   14087cac2:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087cac6:	83 c0 09             	add    eax,0x9
   14087cac9:	89 05 a5 d9 dc 01    	mov    DWORD PTR [rip+0x1dcd9a5],eax        # 0x14264a474
   14087cacf:	8b 45 80             	mov    eax,DWORD PTR [rbp-0x80]
   14087cad2:	ff c0                	inc    eax
   14087cad4:	89 05 9e d9 dc 01    	mov    DWORD PTR [rip+0x1dcd99e],eax        # 0x14264a478
   14087cada:	41 b0 03             	mov    r8b,0x3
   14087cadd:	ba 61 01 00 00       	mov    edx,0x161
   14087cae2:	48 8d 0d 07 17 03 01 	lea    rcx,[rip+0x1031707]        # 0x1418ae1f0
   14087cae9:	e8 c2 c9 3b 00       	call   0x140c394b0
   14087caee:	48 8d 15 47 bc d6 00 	lea    rdx,[rip+0xd6bc47]        # 0x1415e873c
   14087caf5:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087caf9:	e8 52 b6 7e ff       	call   0x140068150
   14087cafe:	90                   	nop
   14087caff:	45 33 c9             	xor    r9d,r9d
   14087cb02:	41 b0 03             	mov    r8b,0x3
   14087cb05:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087cb09:	49 8b cd             	mov    rcx,r13
   14087cb0c:	e8 4f ce 25 00       	call   0x140ad9960
   14087cb11:	90                   	nop
   14087cb12:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087cb16:	e8 35 2d 7f ff       	call   0x14006f850
   14087cb1b:	48 8d 15 1e 72 e3 00 	lea    rdx,[rip+0xe3721e]        # 0x1416b3d40
   14087cb22:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087cb26:	e8 25 b6 7e ff       	call   0x140068150
   14087cb2b:	90                   	nop
   14087cb2c:	45 33 c9             	xor    r9d,r9d
   14087cb2f:	45 33 c0             	xor    r8d,r8d
   14087cb32:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087cb36:	49 8b cd             	mov    rcx,r13
   14087cb39:	e8 22 ce 25 00       	call   0x140ad9960
   14087cb3e:	90                   	nop
   14087cb3f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087cb43:	e8 08 2d 7f ff       	call   0x14006f850
   14087cb48:	e9 d2 34 00 00       	jmp    0x14088001f
   14087cb4d:	44 8d 6f 10          	lea    r13d,[rdi+0x10]
   14087cb51:	4c 8b 74 24 70       	mov    r14,QWORD PTR [rsp+0x70]
   14087cb56:	49 8d b6 40 01 00 00 	lea    rsi,[r14+0x140]
   14087cb5d:	48 8b ce             	mov    rcx,rsi
   14087cb60:	e8 eb 22 7f ff       	call   0x14006ee50
   14087cb65:	48 8b d8             	mov    rbx,rax
   14087cb68:	49 81 c6 28 01 00 00 	add    r14,0x128
   14087cb6f:	49 8b ce             	mov    rcx,r14
   14087cb72:	e8 d9 22 7f ff       	call   0x14006ee50
   14087cb77:	03 c3                	add    eax,ebx
   14087cb79:	83 f8 05             	cmp    eax,0x5
   14087cb7c:	7d 21                	jge    0x14087cb9f
   14087cb7e:	48 8b ce             	mov    rcx,rsi
   14087cb81:	e8 ca 22 7f ff       	call   0x14006ee50
   14087cb86:	48 8b d8             	mov    rbx,rax
   14087cb89:	49 8b ce             	mov    rcx,r14
   14087cb8c:	e8 bf 22 7f ff       	call   0x14006ee50
   14087cb91:	03 c3                	add    eax,ebx
   14087cb93:	44 8d 6f 01          	lea    r13d,[rdi+0x1]
   14087cb97:	45 8d 6c 45 00       	lea    r13d,[r13+rax*2+0x0]
   14087cb9c:	44 03 e8             	add    r13d,eax
   14087cb9f:	48 8b ce             	mov    rcx,rsi
   14087cba2:	e8 a9 22 7f ff       	call   0x14006ee50
   14087cba7:	48 8b d8             	mov    rbx,rax
   14087cbaa:	49 8b ce             	mov    rcx,r14
   14087cbad:	e8 9e 22 7f ff       	call   0x14006ee50
   14087cbb2:	48 03 c3             	add    rax,rbx
   14087cbb5:	44 0f 44 ef          	cmove  r13d,edi
   14087cbb9:	44 89 6d e0          	mov    DWORD PTR [rbp-0x20],r13d
   14087cbbd:	48 8b ce             	mov    rcx,rsi
   14087cbc0:	e8 8b 22 7f ff       	call   0x14006ee50
   14087cbc5:	48 8b d8             	mov    rbx,rax
   14087cbc8:	49 8b ce             	mov    rcx,r14
   14087cbcb:	e8 80 22 7f ff       	call   0x14006ee50
   14087cbd0:	44 8d 34 03          	lea    r14d,[rbx+rax*1]
   14087cbd4:	b8 05 00 00 00       	mov    eax,0x5
   14087cbd9:	44 3b f0             	cmp    r14d,eax
   14087cbdc:	44 0f 4f f0          	cmovg  r14d,eax
   14087cbe0:	4c 89 75 f0          	mov    QWORD PTR [rbp-0x10],r14
   14087cbe4:	44 8b 7c 24 68       	mov    r15d,DWORD PTR [rsp+0x68]
   14087cbe9:	41 ff c7             	inc    r15d
   14087cbec:	44 89 7d 80          	mov    DWORD PTR [rbp-0x80],r15d
   14087cbf0:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   14087cbf4:	41 ff c8             	dec    r8d
   14087cbf7:	44 8d 4f 02          	lea    r9d,[rdi+0x2]
   14087cbfb:	44 89 4d 8c          	mov    DWORD PTR [rbp-0x74],r9d
   14087cbff:	41 8b cd             	mov    ecx,r13d
   14087cc02:	41 2b c9             	sub    ecx,r9d
   14087cc05:	ff c1                	inc    ecx
   14087cc07:	b8 56 55 55 55       	mov    eax,0x55555556
   14087cc0c:	f7 e9                	imul   ecx
   14087cc0e:	8b c2                	mov    eax,edx
   14087cc10:	c1 e8 1f             	shr    eax,0x1f
   14087cc13:	03 d0                	add    edx,eax
   14087cc15:	89 55 98             	mov    DWORD PTR [rbp-0x68],edx
   14087cc18:	41 8d 70 fe          	lea    esi,[r8-0x2]
   14087cc1c:	44 3b f2             	cmp    r14d,edx
   14087cc1f:	41 0f 4e f0          	cmovle esi,r8d
   14087cc23:	89 74 24 64          	mov    DWORD PTR [rsp+0x64],esi
   14087cc27:	45 8b e9             	mov    r13d,r9d
   14087cc2a:	44 89 4c 24 60       	mov    DWORD PTR [rsp+0x60],r9d
   14087cc2f:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087cc34:	8b 83 58 01 00 00    	mov    eax,DWORD PTR [rbx+0x158]
   14087cc3a:	41 8b ce             	mov    ecx,r14d
   14087cc3d:	2b ca                	sub    ecx,edx
   14087cc3f:	3b c1                	cmp    eax,ecx
   14087cc41:	0f 4e c8             	cmovle ecx,eax
   14087cc44:	45 33 e4             	xor    r12d,r12d
   14087cc47:	85 c9                	test   ecx,ecx
   14087cc49:	44 0f 49 e1          	cmovns r12d,ecx
   14087cc4d:	44 89 65 88          	mov    DWORD PTR [rbp-0x78],r12d
   14087cc51:	41 8d 04 14          	lea    eax,[r12+rdx*1]
   14087cc55:	89 45 84             	mov    DWORD PTR [rbp-0x7c],eax
   14087cc58:	44 3b e0             	cmp    r12d,eax
   14087cc5b:	0f 8d 40 0d 00 00    	jge    0x14087d9a1
   14087cc61:	48 8d 83 28 01 00 00 	lea    rax,[rbx+0x128]
   14087cc68:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
   14087cc6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087cc70:	45 3b e6             	cmp    r12d,r14d
   14087cc73:	0f 8d 21 0d 00 00    	jge    0x14087d99a
   14087cc79:	45 33 c0             	xor    r8d,r8d
   14087cc7c:	ba 07 00 00 00       	mov    edx,0x7
   14087cc81:	41 b1 01             	mov    r9b,0x1
   14087cc84:	4c 8d 35 65 d7 dc 01 	lea    r14,[rip+0x1dcd765]        # 0x14264a3f0
   14087cc8b:	49 8b ce             	mov    rcx,r14
   14087cc8e:	e8 9d e4 83 ff       	call   0x1400bb130
   14087cc93:	41 8b ff             	mov    edi,r15d
   14087cc96:	44 3b fe             	cmp    r15d,esi
   14087cc99:	0f 8f 06 01 00 00    	jg     0x14087cda5
   14087cc9f:	45 8d 75 03          	lea    r14d,[r13+0x3]
   14087cca3:	4c 8d 25 46 d7 dc 01 	lea    r12,[rip+0x1dcd746]        # 0x14264a3f0
   14087ccaa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087ccb0:	41 8b dd             	mov    ebx,r13d
   14087ccb3:	45 3b ee             	cmp    r13d,r14d
   14087ccb6:	0f 8d cf 00 00 00    	jge    0x14087cd8b
   14087ccbc:	3b fe                	cmp    edi,esi
   14087ccbe:	75 5d                	jne    0x14087cd1d
   14087ccc0:	48 8d 35 e9 f0 dc 01 	lea    rsi,[rip+0x1dcf0e9]        # 0x14264bdb0
   14087ccc7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087ccd0:	44 8b c7             	mov    r8d,edi
   14087ccd3:	8b d3                	mov    edx,ebx
   14087ccd5:	49 8b cc             	mov    rcx,r12
   14087ccd8:	e8 43 e4 83 ff       	call   0x1400bb120
   14087ccdd:	49 8b cc             	mov    rcx,r12
   14087cce0:	41 3b ff             	cmp    edi,r15d
   14087cce3:	75 05                	jne    0x14087ccea
   14087cce5:	8b 56 e8             	mov    edx,DWORD PTR [rsi-0x18]
   14087cce8:	eb 02                	jmp    0x14087ccec
   14087ccea:	8b 16                	mov    edx,DWORD PTR [rsi]
   14087ccec:	e8 df dd 25 00       	call   0x140adaad0
   14087ccf1:	33 d2                	xor    edx,edx
   14087ccf3:	48 8d 0d 76 0a b5 01 	lea    rcx,[rip+0x1b50a76]        # 0x1423cd770
   14087ccfa:	e8 91 52 7f ff       	call   0x140071f90
   14087ccff:	84 c0                	test   al,al
   14087cd01:	74 0d                	je     0x14087cd10
   14087cd03:	41 b0 01             	mov    r8b,0x1
   14087cd06:	33 d2                	xor    edx,edx
   14087cd08:	49 8b cc             	mov    rcx,r12
   14087cd0b:	e8 80 e4 83 ff       	call   0x1400bb190
   14087cd10:	ff c3                	inc    ebx
   14087cd12:	48 83 c6 04          	add    rsi,0x4
   14087cd16:	41 3b de             	cmp    ebx,r14d
   14087cd19:	7c b5                	jl     0x14087ccd0
   14087cd1b:	eb 6a                	jmp    0x14087cd87
   14087cd1d:	48 8d 35 80 f0 dc 01 	lea    rsi,[rip+0x1dcf080]        # 0x14264bda4
   14087cd24:	4c 8d 2d c5 d6 dc 01 	lea    r13,[rip+0x1dcd6c5]        # 0x14264a3f0
   14087cd2b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087cd30:	44 8b c7             	mov    r8d,edi
   14087cd33:	8b d3                	mov    edx,ebx
   14087cd35:	49 8b cd             	mov    rcx,r13
   14087cd38:	e8 e3 e3 83 ff       	call   0x1400bb120
   14087cd3d:	49 8b cd             	mov    rcx,r13
   14087cd40:	41 3b ff             	cmp    edi,r15d
   14087cd43:	75 05                	jne    0x14087cd4a
   14087cd45:	8b 56 f4             	mov    edx,DWORD PTR [rsi-0xc]
   14087cd48:	eb 02                	jmp    0x14087cd4c
   14087cd4a:	8b 16                	mov    edx,DWORD PTR [rsi]
   14087cd4c:	e8 7f dd 25 00       	call   0x140adaad0
   14087cd51:	33 d2                	xor    edx,edx
   14087cd53:	48 8d 0d 16 0a b5 01 	lea    rcx,[rip+0x1b50a16]        # 0x1423cd770
   14087cd5a:	e8 31 52 7f ff       	call   0x140071f90
   14087cd5f:	84 c0                	test   al,al
   14087cd61:	74 0d                	je     0x14087cd70
   14087cd63:	41 b0 01             	mov    r8b,0x1
   14087cd66:	33 d2                	xor    edx,edx
   14087cd68:	49 8b cd             	mov    rcx,r13
   14087cd6b:	e8 20 e4 83 ff       	call   0x1400bb190
   14087cd70:	ff c3                	inc    ebx
   14087cd72:	48 83 c6 04          	add    rsi,0x4
   14087cd76:	41 3b de             	cmp    ebx,r14d
   14087cd79:	7c b5                	jl     0x14087cd30
   14087cd7b:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087cd80:	4c 8d 25 69 d6 dc 01 	lea    r12,[rip+0x1dcd669]        # 0x14264a3f0
   14087cd87:	8b 74 24 64          	mov    esi,DWORD PTR [rsp+0x64]
   14087cd8b:	ff c7                	inc    edi
   14087cd8d:	3b fe                	cmp    edi,esi
   14087cd8f:	0f 8e 1b ff ff ff    	jle    0x14087ccb0
   14087cd95:	44 8b 65 88          	mov    r12d,DWORD PTR [rbp-0x78]
   14087cd99:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087cd9e:	4c 8d 35 4b d6 dc 01 	lea    r14,[rip+0x1dcd64b]        # 0x14264a3f0
   14087cda5:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
   14087cda9:	e8 a2 20 7f ff       	call   0x14006ee50
   14087cdae:	48 8d 8b 28 01 00 00 	lea    rcx,[rbx+0x128]
   14087cdb5:	44 3b e0             	cmp    r12d,eax
   14087cdb8:	0f 8c 04 02 00 00    	jl     0x14087cfc2
   14087cdbe:	e8 8d 20 7f ff       	call   0x14006ee50
   14087cdc3:	41 8b cc             	mov    ecx,r12d
   14087cdc6:	2b c8                	sub    ecx,eax
   14087cdc8:	48 63 d1             	movsxd rdx,ecx
   14087cdcb:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087cdd0:	48 81 c1 40 01 00 00 	add    rcx,0x140
   14087cdd7:	e8 44 24 7f ff       	call   0x14006f220
   14087cddc:	4c 8b 30             	mov    r14,QWORD PTR [rax]
   14087cddf:	45 33 c0             	xor    r8d,r8d
   14087cde2:	ba 06 00 00 00       	mov    edx,0x6
   14087cde7:	41 b1 01             	mov    r9b,0x1
   14087cdea:	48 8d 0d ff d5 dc 01 	lea    rcx,[rip+0x1dcd5ff]        # 0x14264a3f0
   14087cdf1:	e8 3a e3 83 ff       	call   0x1400bb130
   14087cdf6:	40 32 f6             	xor    sil,sil
   14087cdf9:	40 32 ff             	xor    dil,dil
   14087cdfc:	48 8b 1d 0d 83 b6 01 	mov    rbx,QWORD PTR [rip+0x1b6830d]        # 0x1423e5110
   14087ce03:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   14087ce07:	48 8d 8b 08 04 00 00 	lea    rcx,[rbx+0x408]
   14087ce0e:	e8 2d 24 7f ff       	call   0x14006f240
   14087ce13:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   14087ce17:	48 8d 8b 08 04 00 00 	lea    rcx,[rbx+0x408]
   14087ce1e:	e8 0d 24 7f ff       	call   0x14006f230
   14087ce23:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   14087ce27:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   14087ce2b:	e8 40 cb 83 ff       	call   0x1400b9970
   14087ce30:	84 c0                	test   al,al
   14087ce32:	75 49                	jne    0x14087ce7d
   14087ce34:	41 bd 01 00 00 00    	mov    r13d,0x1
   14087ce3a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087ce40:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   14087ce44:	e8 c7 1f 7f ff       	call   0x14006ee10
   14087ce49:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ce4c:	4c 39 31             	cmp    QWORD PTR [rcx],r14
   14087ce4f:	75 0d                	jne    0x14087ce5e
   14087ce51:	40 0f b6 f6          	movzx  esi,sil
   14087ce55:	66 44 39 69 08       	cmp    WORD PTR [rcx+0x8],r13w
   14087ce5a:	41 0f 44 f5          	cmove  esi,r13d
   14087ce5e:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   14087ce62:	e8 99 1f 7f ff       	call   0x14006ee00
   14087ce67:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   14087ce6b:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   14087ce6f:	e8 fc ca 83 ff       	call   0x1400b9970
   14087ce74:	84 c0                	test   al,al
   14087ce76:	74 c8                	je     0x14087ce40
   14087ce78:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087ce7d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087ce82:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
   14087ce86:	48 85 db             	test   rbx,rbx
   14087ce89:	74 73                	je     0x14087cefe
   14087ce8b:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
   14087ce8f:	48 8d 8b 08 04 00 00 	lea    rcx,[rbx+0x408]
   14087ce96:	e8 a5 23 7f ff       	call   0x14006f240
   14087ce9b:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
   14087ce9f:	48 8d 8b 08 04 00 00 	lea    rcx,[rbx+0x408]
   14087cea6:	e8 85 23 7f ff       	call   0x14006f230
   14087ceab:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
   14087ceaf:	48 8d 4d e8          	lea    rcx,[rbp-0x18]
   14087ceb3:	e8 b8 ca 83 ff       	call   0x1400b9970
   14087ceb8:	84 c0                	test   al,al
   14087ceba:	75 42                	jne    0x14087cefe
   14087cebc:	41 bc 01 00 00 00    	mov    r12d,0x1
   14087cec2:	48 8d 4d e8          	lea    rcx,[rbp-0x18]
   14087cec6:	e8 45 1f 7f ff       	call   0x14006ee10
   14087cecb:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087cece:	4c 39 31             	cmp    QWORD PTR [rcx],r14
   14087ced1:	75 0d                	jne    0x14087cee0
   14087ced3:	40 0f b6 ff          	movzx  edi,dil
   14087ced7:	66 44 39 61 08       	cmp    WORD PTR [rcx+0x8],r12w
   14087cedc:	41 0f 44 fc          	cmove  edi,r12d
   14087cee0:	48 8d 4d e8          	lea    rcx,[rbp-0x18]
   14087cee4:	e8 17 1f 7f ff       	call   0x14006ee00
   14087cee9:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
   14087ceed:	48 8d 4d e8          	lea    rcx,[rbp-0x18]
   14087cef1:	e8 7a ca 83 ff       	call   0x1400b9970
   14087cef6:	84 c0                	test   al,al
   14087cef8:	74 c8                	je     0x14087cec2
   14087cefa:	44 8b 65 88          	mov    r12d,DWORD PTR [rbp-0x78]
   14087cefe:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087cf02:	e8 89 27 7f ff       	call   0x14006f690
   14087cf07:	90                   	nop
   14087cf08:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087cf0c:	e8 7f 27 7f ff       	call   0x14006f690
   14087cf11:	90                   	nop
   14087cf12:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087cf16:	40 84 f6             	test   sil,sil
   14087cf19:	74 17                	je     0x14087cf32
   14087cf1b:	40 84 ff             	test   dil,dil
   14087cf1e:	74 09                	je     0x14087cf29
   14087cf20:	48 8d 15 89 6d e3 00 	lea    rdx,[rip+0xe36d89]        # 0x1416b3cb0
   14087cf27:	eb 1c                	jmp    0x14087cf45
   14087cf29:	48 8d 15 70 6d e3 00 	lea    rdx,[rip+0xe36d70]        # 0x1416b3ca0
   14087cf30:	eb 13                	jmp    0x14087cf45
   14087cf32:	40 84 ff             	test   dil,dil
   14087cf35:	48 8d 15 94 6d e3 00 	lea    rdx,[rip+0xe36d94]        # 0x1416b3cd0
   14087cf3c:	75 07                	jne    0x14087cf45
   14087cf3e:	48 8d 15 7b 6d e3 00 	lea    rdx,[rip+0xe36d7b]        # 0x1416b3cc0
   14087cf45:	e8 36 26 7f ff       	call   0x14006f580
   14087cf4a:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087cf50:	45 33 c0             	xor    r8d,r8d
   14087cf53:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087cf57:	49 8b ce             	mov    rcx,r14
   14087cf5a:	e8 f1 84 3e 00       	call   0x140c65450
   14087cf5f:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087cf63:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087cf67:	e8 a4 cd 83 ff       	call   0x1400b9d10
   14087cf6c:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087cf70:	e8 bb 23 7f ff       	call   0x14006f330
   14087cf75:	99                   	cdq
   14087cf76:	2b c2                	sub    eax,edx
   14087cf78:	d1 f8                	sar    eax,1
   14087cf7a:	8b c8                	mov    ecx,eax
   14087cf7c:	8b 44 24 64          	mov    eax,DWORD PTR [rsp+0x64]
   14087cf80:	41 03 c7             	add    eax,r15d
   14087cf83:	99                   	cdq
   14087cf84:	2b c2                	sub    eax,edx
   14087cf86:	d1 f8                	sar    eax,1
   14087cf88:	2b c1                	sub    eax,ecx
   14087cf8a:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087cf8e:	44 8b c0             	mov    r8d,eax
   14087cf91:	48 8d 1d 58 d4 dc 01 	lea    rbx,[rip+0x1dcd458]        # 0x14264a3f0
   14087cf98:	48 8b cb             	mov    rcx,rbx
   14087cf9b:	e8 80 e1 83 ff       	call   0x1400bb120
   14087cfa0:	45 33 c9             	xor    r9d,r9d
   14087cfa3:	45 33 c0             	xor    r8d,r8d
   14087cfa6:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087cfaa:	48 8b cb             	mov    rcx,rbx
   14087cfad:	e8 ae c9 25 00       	call   0x140ad9960
   14087cfb2:	90                   	nop
   14087cfb3:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087cfb7:	e8 74 ae 7e ff       	call   0x140067e30
   14087cfbc:	90                   	nop
   14087cfbd:	e9 a8 09 00 00       	jmp    0x14087d96a
   14087cfc2:	49 63 fc             	movsxd rdi,r12d
   14087cfc5:	48 8b d7             	mov    rdx,rdi
   14087cfc8:	e8 53 22 7f ff       	call   0x14006f220
   14087cfcd:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087cfd0:	0f bf 51 1c          	movsx  edx,WORD PTR [rcx+0x1c]
   14087cfd4:	85 d2                	test   edx,edx
   14087cfd6:	74 27                	je     0x14087cfff
   14087cfd8:	83 ea 01             	sub    edx,0x1
   14087cfdb:	74 1b                	je     0x14087cff8
   14087cfdd:	83 ea 01             	sub    edx,0x1
   14087cfe0:	74 0f                	je     0x14087cff1
   14087cfe2:	83 fa 01             	cmp    edx,0x1
   14087cfe5:	75 2b                	jne    0x14087d012
   14087cfe7:	ba 07 00 00 00       	mov    edx,0x7
   14087cfec:	45 33 c9             	xor    r9d,r9d
   14087cfef:	eb 16                	jmp    0x14087d007
   14087cff1:	ba 06 00 00 00       	mov    edx,0x6
   14087cff6:	eb 0c                	jmp    0x14087d004
   14087cff8:	ba 07 00 00 00       	mov    edx,0x7
   14087cffd:	eb 05                	jmp    0x14087d004
   14087cfff:	ba 04 00 00 00       	mov    edx,0x4
   14087d004:	41 b1 01             	mov    r9b,0x1
   14087d007:	45 33 c0             	xor    r8d,r8d
   14087d00a:	49 8b ce             	mov    rcx,r14
   14087d00d:	e8 1e e1 83 ff       	call   0x1400bb130
   14087d012:	45 8d 47 01          	lea    r8d,[r15+0x1]
   14087d016:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d01a:	48 8d 0d cf d3 dc 01 	lea    rcx,[rip+0x1dcd3cf]        # 0x14264a3f0
   14087d021:	e8 fa e0 83 ff       	call   0x1400bb120
   14087d026:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087d02a:	e8 61 26 7f ff       	call   0x14006f690
   14087d02f:	90                   	nop
   14087d030:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   14087d035:	41 b1 01             	mov    r9b,0x1
   14087d038:	41 b8 01 00 00 00    	mov    r8d,0x1
   14087d03e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087d042:	48 8b 0d c7 80 b6 01 	mov    rcx,QWORD PTR [rip+0x1b680c7]        # 0x1423e5110
   14087d049:	e8 e2 13 ab 00       	call   0x14132e430
   14087d04e:	8b de                	mov    ebx,esi
   14087d050:	41 2b df             	sub    ebx,r15d
   14087d053:	83 c3 01             	add    ebx,0x1
   14087d056:	79 02                	jns    0x14087d05a
   14087d058:	ff c3                	inc    ebx
   14087d05a:	d1 fb                	sar    ebx,1
   14087d05c:	8d 53 ff             	lea    edx,[rbx-0x1]
   14087d05f:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087d063:	e8 78 0e cb ff       	call   0x14052dee0
   14087d068:	45 33 c9             	xor    r9d,r9d
   14087d06b:	45 33 c0             	xor    r8d,r8d
   14087d06e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087d072:	48 8d 0d 77 d3 dc 01 	lea    rcx,[rip+0x1dcd377]        # 0x14264a3f0
   14087d079:	e8 e2 c8 25 00       	call   0x140ad9960
   14087d07e:	48 8b d7             	mov    rdx,rdi
   14087d081:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
   14087d085:	e8 96 21 7f ff       	call   0x14006f220
   14087d08a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087d08d:	8b 12                	mov    edx,DWORD PTR [rdx]
   14087d08f:	48 8d 0d 1a 80 b6 01 	lea    rcx,[rip+0x1b6801a]        # 0x1423e50b0
   14087d096:	e8 d5 6a 7f ff       	call   0x140073b70
   14087d09b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14087d09f:	48 85 c0             	test   rax,rax
   14087d0a2:	75 0e                	jne    0x14087d0b2
   14087d0a4:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087d0a8:	e8 83 ad 7e ff       	call   0x140067e30
   14087d0ad:	e9 ca 08 00 00       	jmp    0x14087d97c
   14087d0b2:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   14087d0b7:	41 b1 01             	mov    r9b,0x1
   14087d0ba:	41 b8 01 00 00 00    	mov    r8d,0x1
   14087d0c0:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087d0c4:	48 8b c8             	mov    rcx,rax
   14087d0c7:	e8 64 13 ab 00       	call   0x14132e430
   14087d0cc:	8d 53 ff             	lea    edx,[rbx-0x1]
   14087d0cf:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087d0d3:	e8 08 0e cb ff       	call   0x14052dee0
   14087d0d8:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087d0dc:	e8 4f 22 7f ff       	call   0x14006f330
   14087d0e1:	44 8b 44 24 64       	mov    r8d,DWORD PTR [rsp+0x64]
   14087d0e6:	44 2b c0             	sub    r8d,eax
   14087d0e9:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d0ed:	48 8d 35 fc d2 dc 01 	lea    rsi,[rip+0x1dcd2fc]        # 0x14264a3f0
   14087d0f4:	48 8b ce             	mov    rcx,rsi
   14087d0f7:	e8 24 e0 83 ff       	call   0x1400bb120
   14087d0fc:	45 33 c9             	xor    r9d,r9d
   14087d0ff:	45 33 c0             	xor    r8d,r8d
   14087d102:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087d106:	48 8b ce             	mov    rcx,rsi
   14087d109:	e8 52 c8 25 00       	call   0x140ad9960
   14087d10e:	83 c3 f9             	add    ebx,0xfffffff9
   14087d111:	41 03 df             	add    ebx,r15d
   14087d114:	89 5c 24 7c          	mov    DWORD PTR [rsp+0x7c],ebx
   14087d118:	48 8b d7             	mov    rdx,rdi
   14087d11b:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
   14087d11f:	48 8b ce             	mov    rcx,rsi
   14087d122:	e8 f9 20 7f ff       	call   0x14006f220
   14087d127:	4c 8b 74 24 70       	mov    r14,QWORD PTR [rsp+0x70]
   14087d12c:	49 8d 8e 28 01 00 00 	lea    rcx,[r14+0x128]
   14087d133:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087d136:	48 8b d7             	mov    rdx,rdi
   14087d139:	83 78 14 ff          	cmp    DWORD PTR [rax+0x14],0xffffffff
   14087d13d:	74 26                	je     0x14087d165
   14087d13f:	e8 dc 20 7f ff       	call   0x14006f220
   14087d144:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087d147:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087d14b:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087d14f:	45 8b cd             	mov    r9d,r13d
   14087d152:	44 8b c3             	mov    r8d,ebx
   14087d155:	8b 52 14             	mov    edx,DWORD PTR [rdx+0x14]
   14087d158:	49 8b ce             	mov    rcx,r14
   14087d15b:	e8 50 73 02 00       	call   0x1408a44b0
   14087d160:	e9 e3 00 00 00       	jmp    0x14087d248
   14087d165:	e8 b6 20 7f ff       	call   0x14006f220
   14087d16a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087d16d:	49 8d 8e 28 01 00 00 	lea    rcx,[r14+0x128]
   14087d174:	83 7a 0c ff          	cmp    DWORD PTR [rdx+0xc],0xffffffff
   14087d178:	48 8b d7             	mov    rdx,rdi
   14087d17b:	74 0d                	je     0x14087d18a
   14087d17d:	e8 9e 20 7f ff       	call   0x14006f220
   14087d182:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d185:	8b 51 0c             	mov    edx,DWORD PTR [rcx+0xc]
   14087d188:	eb 0b                	jmp    0x14087d195
   14087d18a:	e8 91 20 7f ff       	call   0x14006f220
   14087d18f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d192:	8b 51 04             	mov    edx,DWORD PTR [rcx+0x4]
   14087d195:	48 8b 0d 74 7f b6 01 	mov    rcx,QWORD PTR [rip+0x1b67f74]        # 0x1423e5110
   14087d19c:	e8 bf 06 9f ff       	call   0x14026d860
   14087d1a1:	83 f8 ff             	cmp    eax,0xffffffff
   14087d1a4:	0f 84 9e 00 00 00    	je     0x14087d248
   14087d1aa:	48 98                	cdqe
   14087d1ac:	45 8b f5             	mov    r14d,r13d
   14087d1af:	4c 8d 24 40          	lea    r12,[rax+rax*2]
   14087d1b3:	49 c1 e4 04          	shl    r12,0x4
   14087d1b7:	48 8d 05 8a f2 dc 01 	lea    rax,[rip+0x1dcf28a]        # 0x14264c448
   14087d1be:	4c 03 e0             	add    r12,rax
   14087d1c1:	41 bd 03 00 00 00    	mov    r13d,0x3
   14087d1c7:	44 8b fb             	mov    r15d,ebx
   14087d1ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087d1d0:	41 8b df             	mov    ebx,r15d
   14087d1d3:	49 8b fc             	mov    rdi,r12
   14087d1d6:	be 04 00 00 00       	mov    esi,0x4
   14087d1db:	4c 8d 3d 0e d2 dc 01 	lea    r15,[rip+0x1dcd20e]        # 0x14264a3f0
   14087d1e2:	44 8b c3             	mov    r8d,ebx
   14087d1e5:	41 8b d6             	mov    edx,r14d
   14087d1e8:	49 8b cf             	mov    rcx,r15
   14087d1eb:	e8 30 df 83 ff       	call   0x1400bb120
   14087d1f0:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d1f2:	49 8b cf             	mov    rcx,r15
   14087d1f5:	e8 d6 d8 25 00       	call   0x140adaad0
   14087d1fa:	33 d2                	xor    edx,edx
   14087d1fc:	48 8d 0d 6d 05 b5 01 	lea    rcx,[rip+0x1b5056d]        # 0x1423cd770
   14087d203:	e8 88 4d 7f ff       	call   0x140071f90
   14087d208:	84 c0                	test   al,al
   14087d20a:	74 0d                	je     0x14087d219
   14087d20c:	41 b0 01             	mov    r8b,0x1
   14087d20f:	33 d2                	xor    edx,edx
   14087d211:	49 8b cf             	mov    rcx,r15
   14087d214:	e8 77 df 83 ff       	call   0x1400bb190
   14087d219:	ff c3                	inc    ebx
   14087d21b:	48 83 c7 0c          	add    rdi,0xc
   14087d21f:	48 83 ee 01          	sub    rsi,0x1
   14087d223:	75 bd                	jne    0x14087d1e2
   14087d225:	41 ff c6             	inc    r14d
   14087d228:	49 83 c4 04          	add    r12,0x4
   14087d22c:	49 83 ed 01          	sub    r13,0x1
   14087d230:	44 8b 7c 24 7c       	mov    r15d,DWORD PTR [rsp+0x7c]
   14087d235:	75 99                	jne    0x14087d1d0
   14087d237:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087d23b:	44 8b 65 88          	mov    r12d,DWORD PTR [rbp-0x78]
   14087d23f:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087d244:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
   14087d248:	8b 7c 24 64          	mov    edi,DWORD PTR [rsp+0x64]
   14087d24c:	8b c7                	mov    eax,edi
   14087d24e:	41 2b c7             	sub    eax,r15d
   14087d251:	83 c0 01             	add    eax,0x1
   14087d254:	79 02                	jns    0x14087d258
   14087d256:	ff c0                	inc    eax
   14087d258:	d1 f8                	sar    eax,1
   14087d25a:	8d 58 fd             	lea    ebx,[rax-0x3]
   14087d25d:	41 03 df             	add    ebx,r15d
   14087d260:	44 8b c3             	mov    r8d,ebx
   14087d263:	41 8b d5             	mov    edx,r13d
   14087d266:	4c 8d 35 83 d1 dc 01 	lea    r14,[rip+0x1dcd183]        # 0x14264a3f0
   14087d26d:	49 8b ce             	mov    rcx,r14
   14087d270:	e8 ab de 83 ff       	call   0x1400bb120
   14087d275:	49 63 d4             	movsxd rdx,r12d
   14087d278:	48 8b ce             	mov    rcx,rsi
   14087d27b:	e8 a0 1f 7f ff       	call   0x14006f220
   14087d280:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d283:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087d287:	75 0e                	jne    0x14087d297
   14087d289:	8b 15 01 7b dd 01    	mov    edx,DWORD PTR [rip+0x1dd7b01]        # 0x142654d90
   14087d28f:	49 8b ce             	mov    rcx,r14
   14087d292:	e8 39 d8 25 00       	call   0x140adaad0
   14087d297:	49 63 d4             	movsxd rdx,r12d
   14087d29a:	48 8b ce             	mov    rcx,rsi
   14087d29d:	e8 7e 1f 7f ff       	call   0x14006f220
   14087d2a2:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d2a5:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087d2a9:	75 0e                	jne    0x14087d2b9
   14087d2ab:	8b 15 eb 7a dd 01    	mov    edx,DWORD PTR [rip+0x1dd7aeb]        # 0x142654d9c
   14087d2b1:	49 8b ce             	mov    rcx,r14
   14087d2b4:	e8 17 d8 25 00       	call   0x140adaad0
   14087d2b9:	49 63 d4             	movsxd rdx,r12d
   14087d2bc:	48 8b ce             	mov    rcx,rsi
   14087d2bf:	e8 5c 1f 7f ff       	call   0x14006f220
   14087d2c4:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d2c7:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087d2cb:	75 0e                	jne    0x14087d2db
   14087d2cd:	8b 15 d5 7a dd 01    	mov    edx,DWORD PTR [rip+0x1dd7ad5]        # 0x142654da8
   14087d2d3:	49 8b ce             	mov    rcx,r14
   14087d2d6:	e8 f5 d7 25 00       	call   0x140adaad0
   14087d2db:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d2df:	44 8b c3             	mov    r8d,ebx
   14087d2e2:	49 8b ce             	mov    rcx,r14
   14087d2e5:	e8 36 de 83 ff       	call   0x1400bb120
   14087d2ea:	49 63 d4             	movsxd rdx,r12d
   14087d2ed:	48 8b ce             	mov    rcx,rsi
   14087d2f0:	e8 2b 1f 7f ff       	call   0x14006f220
   14087d2f5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d2f8:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087d2fc:	75 0e                	jne    0x14087d30c
   14087d2fe:	8b 15 90 7a dd 01    	mov    edx,DWORD PTR [rip+0x1dd7a90]        # 0x142654d94
   14087d304:	49 8b ce             	mov    rcx,r14
   14087d307:	e8 c4 d7 25 00       	call   0x140adaad0
   14087d30c:	49 63 d4             	movsxd rdx,r12d
   14087d30f:	48 8b ce             	mov    rcx,rsi
   14087d312:	e8 09 1f 7f ff       	call   0x14006f220
   14087d317:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d31a:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087d31e:	75 0e                	jne    0x14087d32e
   14087d320:	8b 15 7a 7a dd 01    	mov    edx,DWORD PTR [rip+0x1dd7a7a]        # 0x142654da0
   14087d326:	49 8b ce             	mov    rcx,r14
   14087d329:	e8 a2 d7 25 00       	call   0x140adaad0
   14087d32e:	49 63 d4             	movsxd rdx,r12d
   14087d331:	48 8b ce             	mov    rcx,rsi
   14087d334:	e8 e7 1e 7f ff       	call   0x14006f220
   14087d339:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d33c:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087d340:	75 0e                	jne    0x14087d350
   14087d342:	8b 15 64 7a dd 01    	mov    edx,DWORD PTR [rip+0x1dd7a64]        # 0x142654dac
   14087d348:	49 8b ce             	mov    rcx,r14
   14087d34b:	e8 80 d7 25 00       	call   0x140adaad0
   14087d350:	41 8d 55 02          	lea    edx,[r13+0x2]
   14087d354:	44 8b c3             	mov    r8d,ebx
   14087d357:	49 8b ce             	mov    rcx,r14
   14087d35a:	e8 c1 dd 83 ff       	call   0x1400bb120
   14087d35f:	49 63 d4             	movsxd rdx,r12d
   14087d362:	48 8b ce             	mov    rcx,rsi
   14087d365:	e8 b6 1e 7f ff       	call   0x14006f220
   14087d36a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d36d:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087d371:	75 0e                	jne    0x14087d381
   14087d373:	8b 15 1f 7a dd 01    	mov    edx,DWORD PTR [rip+0x1dd7a1f]        # 0x142654d98
   14087d379:	49 8b ce             	mov    rcx,r14
   14087d37c:	e8 4f d7 25 00       	call   0x140adaad0
   14087d381:	49 63 d4             	movsxd rdx,r12d
   14087d384:	48 8b ce             	mov    rcx,rsi
   14087d387:	e8 94 1e 7f ff       	call   0x14006f220
   14087d38c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d38f:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087d393:	75 0e                	jne    0x14087d3a3
   14087d395:	8b 15 09 7a dd 01    	mov    edx,DWORD PTR [rip+0x1dd7a09]        # 0x142654da4
   14087d39b:	49 8b ce             	mov    rcx,r14
   14087d39e:	e8 2d d7 25 00       	call   0x140adaad0
   14087d3a3:	49 63 d4             	movsxd rdx,r12d
   14087d3a6:	48 8b ce             	mov    rcx,rsi
   14087d3a9:	e8 72 1e 7f ff       	call   0x14006f220
   14087d3ae:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d3b1:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087d3b5:	75 0e                	jne    0x14087d3c5
   14087d3b7:	8b 15 f3 79 dd 01    	mov    edx,DWORD PTR [rip+0x1dd79f3]        # 0x142654db0
   14087d3bd:	49 8b ce             	mov    rcx,r14
   14087d3c0:	e8 0b d7 25 00       	call   0x140adaad0
   14087d3c5:	49 63 d4             	movsxd rdx,r12d
   14087d3c8:	48 8b ce             	mov    rcx,rsi
   14087d3cb:	e8 50 1e 7f ff       	call   0x14006f220
   14087d3d0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d3d3:	0f bf 51 1c          	movsx  edx,WORD PTR [rcx+0x1c]
   14087d3d7:	85 d2                	test   edx,edx
   14087d3d9:	74 2a                	je     0x14087d405
   14087d3db:	83 ea 01             	sub    edx,0x1
   14087d3de:	74 1c                	je     0x14087d3fc
   14087d3e0:	83 ea 01             	sub    edx,0x1
   14087d3e3:	74 0e                	je     0x14087d3f3
   14087d3e5:	83 fa 01             	cmp    edx,0x1
   14087d3e8:	75 12                	jne    0x14087d3fc
   14087d3ea:	4c 8d 25 f7 5b dd 01 	lea    r12,[rip+0x1dd5bf7]        # 0x142652fe8
   14087d3f1:	eb 19                	jmp    0x14087d40c
   14087d3f3:	4c 8d 25 be 5b dd 01 	lea    r12,[rip+0x1dd5bbe]        # 0x142652fb8
   14087d3fa:	eb 10                	jmp    0x14087d40c
   14087d3fc:	4c 8d 25 85 5b dd 01 	lea    r12,[rip+0x1dd5b85]        # 0x142652f88
   14087d403:	eb 07                	jmp    0x14087d40c
   14087d405:	4c 8d 25 8c 5d dd 01 	lea    r12,[rip+0x1dd5d8c]        # 0x142653198
   14087d40c:	8b c7                	mov    eax,edi
   14087d40e:	41 2b c7             	sub    eax,r15d
   14087d411:	83 c0 01             	add    eax,0x1
   14087d414:	79 02                	jns    0x14087d418
   14087d416:	ff c0                	inc    eax
   14087d418:	d1 f8                	sar    eax,1
   14087d41a:	41 8d 4f fe          	lea    ecx,[r15-0x2]
   14087d41e:	03 c8                	add    ecx,eax
   14087d420:	89 4c 24 7c          	mov    DWORD PTR [rsp+0x7c],ecx
   14087d424:	45 8b f5             	mov    r14d,r13d
   14087d427:	41 bd 03 00 00 00    	mov    r13d,0x3
   14087d42d:	44 8b f9             	mov    r15d,ecx
   14087d430:	41 8b df             	mov    ebx,r15d
   14087d433:	49 8b fc             	mov    rdi,r12
   14087d436:	be 04 00 00 00       	mov    esi,0x4
   14087d43b:	4c 8d 3d ae cf dc 01 	lea    r15,[rip+0x1dccfae]        # 0x14264a3f0
   14087d442:	44 8b c3             	mov    r8d,ebx
   14087d445:	41 8b d6             	mov    edx,r14d
   14087d448:	49 8b cf             	mov    rcx,r15
   14087d44b:	e8 d0 dc 83 ff       	call   0x1400bb120
   14087d450:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d452:	49 8b cf             	mov    rcx,r15
   14087d455:	e8 76 d6 25 00       	call   0x140adaad0
   14087d45a:	33 d2                	xor    edx,edx
   14087d45c:	48 8d 0d 0d 03 b5 01 	lea    rcx,[rip+0x1b5030d]        # 0x1423cd770
   14087d463:	e8 28 4b 7f ff       	call   0x140071f90
   14087d468:	84 c0                	test   al,al
   14087d46a:	74 0d                	je     0x14087d479
   14087d46c:	41 b0 01             	mov    r8b,0x1
   14087d46f:	33 d2                	xor    edx,edx
   14087d471:	49 8b cf             	mov    rcx,r15
   14087d474:	e8 17 dd 83 ff       	call   0x1400bb190
   14087d479:	ff c3                	inc    ebx
   14087d47b:	48 83 c7 0c          	add    rdi,0xc
   14087d47f:	48 83 ee 01          	sub    rsi,0x1
   14087d483:	75 bd                	jne    0x14087d442
   14087d485:	41 ff c6             	inc    r14d
   14087d488:	49 83 c4 04          	add    r12,0x4
   14087d48c:	49 83 ed 01          	sub    r13,0x1
   14087d490:	44 8b 7c 24 7c       	mov    r15d,DWORD PTR [rsp+0x7c]
   14087d495:	75 99                	jne    0x14087d430
   14087d497:	44 8b 74 24 64       	mov    r14d,DWORD PTR [rsp+0x64]
   14087d49c:	41 8b c6             	mov    eax,r14d
   14087d49f:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087d4a3:	41 2b c7             	sub    eax,r15d
   14087d4a6:	83 c0 01             	add    eax,0x1
   14087d4a9:	79 02                	jns    0x14087d4ad
   14087d4ab:	ff c0                	inc    eax
   14087d4ad:	d1 f8                	sar    eax,1
   14087d4af:	41 8d 5f 02          	lea    ebx,[r15+0x2]
   14087d4b3:	03 d8                	add    ebx,eax
   14087d4b5:	44 8b c3             	mov    r8d,ebx
   14087d4b8:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087d4bd:	41 8b d5             	mov    edx,r13d
   14087d4c0:	48 8d 3d 29 cf dc 01 	lea    rdi,[rip+0x1dccf29]        # 0x14264a3f0
   14087d4c7:	48 8b cf             	mov    rcx,rdi
   14087d4ca:	e8 51 dc 83 ff       	call   0x1400bb120
   14087d4cf:	4c 63 65 88          	movsxd r12,DWORD PTR [rbp-0x78]
   14087d4d3:	49 8b d4             	mov    rdx,r12
   14087d4d6:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
   14087d4da:	48 8b ce             	mov    rcx,rsi
   14087d4dd:	e8 3e 1d 7f ff       	call   0x14006f220
   14087d4e2:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d4e5:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087d4e9:	75 0e                	jne    0x14087d4f9
   14087d4eb:	8b 15 9f 78 dd 01    	mov    edx,DWORD PTR [rip+0x1dd789f]        # 0x142654d90
   14087d4f1:	48 8b cf             	mov    rcx,rdi
   14087d4f4:	e8 d7 d5 25 00       	call   0x140adaad0
   14087d4f9:	49 8b d4             	mov    rdx,r12
   14087d4fc:	48 8b ce             	mov    rcx,rsi
   14087d4ff:	e8 1c 1d 7f ff       	call   0x14006f220
   14087d504:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d507:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087d50b:	75 0e                	jne    0x14087d51b
   14087d50d:	8b 15 89 78 dd 01    	mov    edx,DWORD PTR [rip+0x1dd7889]        # 0x142654d9c
   14087d513:	48 8b cf             	mov    rcx,rdi
   14087d516:	e8 b5 d5 25 00       	call   0x140adaad0
   14087d51b:	49 8b d4             	mov    rdx,r12
   14087d51e:	48 8b ce             	mov    rcx,rsi
   14087d521:	e8 fa 1c 7f ff       	call   0x14006f220
   14087d526:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d529:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087d52d:	75 0e                	jne    0x14087d53d
   14087d52f:	8b 15 73 78 dd 01    	mov    edx,DWORD PTR [rip+0x1dd7873]        # 0x142654da8
   14087d535:	48 8b cf             	mov    rcx,rdi
   14087d538:	e8 93 d5 25 00       	call   0x140adaad0
   14087d53d:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d541:	44 8b c3             	mov    r8d,ebx
   14087d544:	48 8b cf             	mov    rcx,rdi
   14087d547:	e8 d4 db 83 ff       	call   0x1400bb120
   14087d54c:	49 8b d4             	mov    rdx,r12
   14087d54f:	48 8b ce             	mov    rcx,rsi
   14087d552:	e8 c9 1c 7f ff       	call   0x14006f220
   14087d557:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d55a:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087d55e:	75 0e                	jne    0x14087d56e
   14087d560:	8b 15 2e 78 dd 01    	mov    edx,DWORD PTR [rip+0x1dd782e]        # 0x142654d94
   14087d566:	48 8b cf             	mov    rcx,rdi
   14087d569:	e8 62 d5 25 00       	call   0x140adaad0
   14087d56e:	49 8b d4             	mov    rdx,r12
   14087d571:	48 8b ce             	mov    rcx,rsi
   14087d574:	e8 a7 1c 7f ff       	call   0x14006f220
   14087d579:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d57c:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087d580:	75 0e                	jne    0x14087d590
   14087d582:	8b 15 18 78 dd 01    	mov    edx,DWORD PTR [rip+0x1dd7818]        # 0x142654da0
   14087d588:	48 8b cf             	mov    rcx,rdi
   14087d58b:	e8 40 d5 25 00       	call   0x140adaad0
   14087d590:	49 8b d4             	mov    rdx,r12
   14087d593:	48 8b ce             	mov    rcx,rsi
   14087d596:	e8 85 1c 7f ff       	call   0x14006f220
   14087d59b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d59e:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087d5a2:	75 0e                	jne    0x14087d5b2
   14087d5a4:	8b 15 02 78 dd 01    	mov    edx,DWORD PTR [rip+0x1dd7802]        # 0x142654dac
   14087d5aa:	48 8b cf             	mov    rcx,rdi
   14087d5ad:	e8 1e d5 25 00       	call   0x140adaad0
   14087d5b2:	41 8d 55 02          	lea    edx,[r13+0x2]
   14087d5b6:	44 8b c3             	mov    r8d,ebx
   14087d5b9:	48 8b cf             	mov    rcx,rdi
   14087d5bc:	e8 5f db 83 ff       	call   0x1400bb120
   14087d5c1:	49 8b d4             	mov    rdx,r12
   14087d5c4:	48 8b ce             	mov    rcx,rsi
   14087d5c7:	e8 54 1c 7f ff       	call   0x14006f220
   14087d5cc:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d5cf:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087d5d3:	75 0e                	jne    0x14087d5e3
   14087d5d5:	8b 15 bd 77 dd 01    	mov    edx,DWORD PTR [rip+0x1dd77bd]        # 0x142654d98
   14087d5db:	48 8b cf             	mov    rcx,rdi
   14087d5de:	e8 ed d4 25 00       	call   0x140adaad0
   14087d5e3:	49 8b d4             	mov    rdx,r12
   14087d5e6:	48 8b ce             	mov    rcx,rsi
   14087d5e9:	e8 32 1c 7f ff       	call   0x14006f220
   14087d5ee:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d5f1:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087d5f5:	75 0e                	jne    0x14087d605
   14087d5f7:	8b 15 a7 77 dd 01    	mov    edx,DWORD PTR [rip+0x1dd77a7]        # 0x142654da4
   14087d5fd:	48 8b cf             	mov    rcx,rdi
   14087d600:	e8 cb d4 25 00       	call   0x140adaad0
   14087d605:	49 8b d4             	mov    rdx,r12
   14087d608:	48 8b ce             	mov    rcx,rsi
   14087d60b:	e8 10 1c 7f ff       	call   0x14006f220
   14087d610:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d613:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087d617:	75 0e                	jne    0x14087d627
   14087d619:	8b 15 91 77 dd 01    	mov    edx,DWORD PTR [rip+0x1dd7791]        # 0x142654db0
   14087d61f:	48 8b cf             	mov    rcx,rdi
   14087d622:	e8 a9 d4 25 00       	call   0x140adaad0
   14087d627:	41 8b c6             	mov    eax,r14d
   14087d62a:	41 2b c7             	sub    eax,r15d
   14087d62d:	83 c0 01             	add    eax,0x1
   14087d630:	79 02                	jns    0x14087d634
   14087d632:	ff c0                	inc    eax
   14087d634:	d1 f8                	sar    eax,1
   14087d636:	41 8d 5f 03          	lea    ebx,[r15+0x3]
   14087d63a:	03 d8                	add    ebx,eax
   14087d63c:	89 5c 24 7c          	mov    DWORD PTR [rsp+0x7c],ebx
   14087d640:	49 8b d4             	mov    rdx,r12
   14087d643:	48 8b ce             	mov    rcx,rsi
   14087d646:	e8 d5 1b 7f ff       	call   0x14006f220
   14087d64b:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14087d650:	48 8d 8f 28 01 00 00 	lea    rcx,[rdi+0x128]
   14087d657:	49 8b d4             	mov    rdx,r12
   14087d65a:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087d65d:	83 78 18 ff          	cmp    DWORD PTR [rax+0x18],0xffffffff
   14087d661:	74 26                	je     0x14087d689
   14087d663:	e8 b8 1b 7f ff       	call   0x14006f220
   14087d668:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087d66b:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087d66f:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087d673:	45 8b cd             	mov    r9d,r13d
   14087d676:	44 8b c3             	mov    r8d,ebx
   14087d679:	8b 52 18             	mov    edx,DWORD PTR [rdx+0x18]
   14087d67c:	48 8b cf             	mov    rcx,rdi
   14087d67f:	e8 2c 6e 02 00       	call   0x1408a44b0
   14087d684:	e9 e9 00 00 00       	jmp    0x14087d772
   14087d689:	e8 92 1b 7f ff       	call   0x14006f220
   14087d68e:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087d691:	49 8b d4             	mov    rdx,r12
   14087d694:	48 8d 8f 28 01 00 00 	lea    rcx,[rdi+0x128]
   14087d69b:	41 83 78 10 ff       	cmp    DWORD PTR [r8+0x10],0xffffffff
   14087d6a0:	74 0d                	je     0x14087d6af
   14087d6a2:	e8 79 1b 7f ff       	call   0x14006f220
   14087d6a7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087d6aa:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
   14087d6ad:	eb 0b                	jmp    0x14087d6ba
   14087d6af:	e8 6c 1b 7f ff       	call   0x14006f220
   14087d6b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087d6b7:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
   14087d6ba:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   14087d6be:	e8 9d 01 9f ff       	call   0x14026d860
   14087d6c3:	83 f8 ff             	cmp    eax,0xffffffff
   14087d6c6:	0f 84 a6 00 00 00    	je     0x14087d772
   14087d6cc:	48 98                	cdqe
   14087d6ce:	45 8b f5             	mov    r14d,r13d
   14087d6d1:	4c 8d 24 40          	lea    r12,[rax+rax*2]
   14087d6d5:	49 c1 e4 04          	shl    r12,0x4
   14087d6d9:	48 8d 05 68 ed dc 01 	lea    rax,[rip+0x1dced68]        # 0x14264c448
   14087d6e0:	4c 03 e0             	add    r12,rax
   14087d6e3:	41 bd 03 00 00 00    	mov    r13d,0x3
   14087d6e9:	44 8b fb             	mov    r15d,ebx
   14087d6ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d6f0:	41 8b df             	mov    ebx,r15d
   14087d6f3:	49 8b fc             	mov    rdi,r12
   14087d6f6:	be 04 00 00 00       	mov    esi,0x4
   14087d6fb:	4c 8d 3d ee cc dc 01 	lea    r15,[rip+0x1dcccee]        # 0x14264a3f0
   14087d702:	44 8b c3             	mov    r8d,ebx
   14087d705:	41 8b d6             	mov    edx,r14d
   14087d708:	49 8b cf             	mov    rcx,r15
   14087d70b:	e8 10 da 83 ff       	call   0x1400bb120
   14087d710:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d712:	49 8b cf             	mov    rcx,r15
   14087d715:	e8 b6 d3 25 00       	call   0x140adaad0
   14087d71a:	33 d2                	xor    edx,edx
   14087d71c:	48 8d 0d 4d 00 b5 01 	lea    rcx,[rip+0x1b5004d]        # 0x1423cd770
   14087d723:	e8 68 48 7f ff       	call   0x140071f90
   14087d728:	84 c0                	test   al,al
   14087d72a:	74 0d                	je     0x14087d739
   14087d72c:	41 b0 01             	mov    r8b,0x1
   14087d72f:	33 d2                	xor    edx,edx
   14087d731:	49 8b cf             	mov    rcx,r15
   14087d734:	e8 57 da 83 ff       	call   0x1400bb190
   14087d739:	ff c3                	inc    ebx
   14087d73b:	48 83 c7 0c          	add    rdi,0xc
   14087d73f:	48 83 ee 01          	sub    rsi,0x1
   14087d743:	75 bd                	jne    0x14087d702
   14087d745:	41 ff c6             	inc    r14d
   14087d748:	49 83 c4 04          	add    r12,0x4
   14087d74c:	49 83 ed 01          	sub    r13,0x1
   14087d750:	44 8b 7c 24 7c       	mov    r15d,DWORD PTR [rsp+0x7c]
   14087d755:	75 99                	jne    0x14087d6f0
   14087d757:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087d75b:	44 8b 65 88          	mov    r12d,DWORD PTR [rbp-0x78]
   14087d75f:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087d764:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
   14087d768:	44 8b 74 24 64       	mov    r14d,DWORD PTR [rsp+0x64]
   14087d76d:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14087d772:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087d776:	e8 15 1f 7f ff       	call   0x14006f690
   14087d77b:	90                   	nop
   14087d77c:	49 63 d4             	movsxd rdx,r12d
   14087d77f:	48 8b ce             	mov    rcx,rsi
   14087d782:	e8 99 1a 7f ff       	call   0x14006f220
   14087d787:	48 8d 8f 28 01 00 00 	lea    rcx,[rdi+0x128]
   14087d78e:	49 63 d4             	movsxd rdx,r12d
   14087d791:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087d794:	83 78 14 ff          	cmp    DWORD PTR [rax+0x14],0xffffffff
   14087d798:	74 35                	je     0x14087d7cf
   14087d79a:	e8 81 1a 7f ff       	call   0x14006f220
   14087d79f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087d7a2:	8b 52 14             	mov    edx,DWORD PTR [rdx+0x14]
   14087d7a5:	48 8d 0d a4 7c b6 01 	lea    rcx,[rip+0x1b67ca4]        # 0x1423e5450
   14087d7ac:	e8 2f 4f 7f ff       	call   0x1400726e0
   14087d7b1:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14087d7b6:	48 85 c0             	test   rax,rax
   14087d7b9:	74 73                	je     0x14087d82e
   14087d7bb:	44 8b cb             	mov    r9d,ebx
   14087d7be:	45 33 c0             	xor    r8d,r8d
   14087d7c1:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087d7c5:	48 8b c8             	mov    rcx,rax
   14087d7c8:	e8 83 7c 3e 00       	call   0x140c65450
   14087d7cd:	eb 5f                	jmp    0x14087d82e
   14087d7cf:	48 8d 9f 28 01 00 00 	lea    rbx,[rdi+0x128]
   14087d7d6:	49 63 fc             	movsxd rdi,r12d
   14087d7d9:	e8 42 1a 7f ff       	call   0x14006f220
   14087d7de:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087d7e1:	48 8b d7             	mov    rdx,rdi
   14087d7e4:	48 8b cb             	mov    rcx,rbx
   14087d7e7:	41 83 78 0c ff       	cmp    DWORD PTR [r8+0xc],0xffffffff
   14087d7ec:	74 0f                	je     0x14087d7fd
   14087d7ee:	e8 2d 1a 7f ff       	call   0x14006f220
   14087d7f3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d7f6:	44 0f b7 41 0c       	movzx  r8d,WORD PTR [rcx+0xc]
   14087d7fb:	eb 0d                	jmp    0x14087d80a
   14087d7fd:	e8 1e 1a 7f ff       	call   0x14006f220
   14087d802:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087d805:	44 0f b7 41 04       	movzx  r8d,WORD PTR [rcx+0x4]
   14087d80a:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087d811:	45 33 c9             	xor    r9d,r9d
   14087d814:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087d818:	48 8b 0d f1 78 b6 01 	mov    rcx,QWORD PTR [rip+0x1b678f1]        # 0x1423e5110
   14087d81f:	e8 ac 6d ab 00       	call   0x1413345d0
   14087d824:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14087d829:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14087d82e:	48 8d 4d 78          	lea    rcx,[rbp+0x78]
   14087d832:	e8 59 1e 7f ff       	call   0x14006f690
   14087d837:	90                   	nop
   14087d838:	49 63 d4             	movsxd rdx,r12d
   14087d83b:	48 8b ce             	mov    rcx,rsi
   14087d83e:	e8 dd 19 7f ff       	call   0x14006f220
   14087d843:	48 8d 8f 28 01 00 00 	lea    rcx,[rdi+0x128]
   14087d84a:	49 63 d4             	movsxd rdx,r12d
   14087d84d:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087d850:	83 78 18 ff          	cmp    DWORD PTR [rax+0x18],0xffffffff
   14087d854:	74 30                	je     0x14087d886
   14087d856:	e8 c5 19 7f ff       	call   0x14006f220
   14087d85b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087d85e:	8b 52 18             	mov    edx,DWORD PTR [rdx+0x18]
   14087d861:	48 8d 0d e8 7b b6 01 	lea    rcx,[rip+0x1b67be8]        # 0x1423e5450
   14087d868:	e8 73 4e 7f ff       	call   0x1400726e0
   14087d86d:	48 85 c0             	test   rax,rax
   14087d870:	74 66                	je     0x14087d8d8
   14087d872:	44 8b cb             	mov    r9d,ebx
   14087d875:	45 33 c0             	xor    r8d,r8d
   14087d878:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087d87c:	48 8b c8             	mov    rcx,rax
   14087d87f:	e8 cc 7b 3e 00       	call   0x140c65450
   14087d884:	eb 52                	jmp    0x14087d8d8
   14087d886:	48 8d 9f 28 01 00 00 	lea    rbx,[rdi+0x128]
   14087d88d:	49 63 fc             	movsxd rdi,r12d
   14087d890:	e8 8b 19 7f ff       	call   0x14006f220
   14087d895:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087d898:	48 8b d7             	mov    rdx,rdi
   14087d89b:	48 8b cb             	mov    rcx,rbx
   14087d89e:	41 83 78 10 ff       	cmp    DWORD PTR [r8+0x10],0xffffffff
   14087d8a3:	74 0f                	je     0x14087d8b4
   14087d8a5:	e8 76 19 7f ff       	call   0x14006f220
   14087d8aa:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087d8ad:	45 0f b7 40 10       	movzx  r8d,WORD PTR [r8+0x10]
   14087d8b2:	eb 0d                	jmp    0x14087d8c1
   14087d8b4:	e8 67 19 7f ff       	call   0x14006f220
   14087d8b9:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087d8bc:	45 0f b7 40 08       	movzx  r8d,WORD PTR [r8+0x8]
   14087d8c1:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087d8c8:	45 33 c9             	xor    r9d,r9d
   14087d8cb:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087d8cf:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   14087d8d3:	e8 f8 6c ab 00       	call   0x1413345d0
   14087d8d8:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087d8dc:	e8 4f 1a 7f ff       	call   0x14006f330
   14087d8e1:	48 8b c8             	mov    rcx,rax
   14087d8e4:	41 8b c6             	mov    eax,r14d
   14087d8e7:	41 2b c7             	sub    eax,r15d
   14087d8ea:	ff c0                	inc    eax
   14087d8ec:	99                   	cdq
   14087d8ed:	2b c2                	sub    eax,edx
   14087d8ef:	d1 f8                	sar    eax,1
   14087d8f1:	45 8d 04 07          	lea    r8d,[r15+rax*1]
   14087d8f5:	44 2b c1             	sub    r8d,ecx
   14087d8f8:	41 83 e8 07          	sub    r8d,0x7
   14087d8fc:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d900:	48 8d 1d e9 ca dc 01 	lea    rbx,[rip+0x1dccae9]        # 0x14264a3f0
   14087d907:	48 8b cb             	mov    rcx,rbx
   14087d90a:	e8 11 d8 83 ff       	call   0x1400bb120
   14087d90f:	45 33 c9             	xor    r9d,r9d
   14087d912:	45 33 c0             	xor    r8d,r8d
   14087d915:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087d919:	48 8b cb             	mov    rcx,rbx
   14087d91c:	e8 3f c0 25 00       	call   0x140ad9960
   14087d921:	41 8b c6             	mov    eax,r14d
   14087d924:	41 2b c7             	sub    eax,r15d
   14087d927:	83 c0 01             	add    eax,0x1
   14087d92a:	79 02                	jns    0x14087d92e
   14087d92c:	ff c0                	inc    eax
   14087d92e:	d1 f8                	sar    eax,1
   14087d930:	44 8d 40 07          	lea    r8d,[rax+0x7]
   14087d934:	45 03 c7             	add    r8d,r15d
   14087d937:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d93b:	48 8b cb             	mov    rcx,rbx
   14087d93e:	e8 dd d7 83 ff       	call   0x1400bb120
   14087d943:	45 33 c9             	xor    r9d,r9d
   14087d946:	45 33 c0             	xor    r8d,r8d
   14087d949:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087d94d:	48 8b cb             	mov    rcx,rbx
   14087d950:	e8 0b c0 25 00       	call   0x140ad9960
   14087d955:	90                   	nop
   14087d956:	48 8d 4d 78          	lea    rcx,[rbp+0x78]
   14087d95a:	e8 d1 a4 7e ff       	call   0x140067e30
   14087d95f:	90                   	nop
   14087d960:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087d964:	e8 c7 a4 7e ff       	call   0x140067e30
   14087d969:	90                   	nop
   14087d96a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087d96e:	e8 bd a4 7e ff       	call   0x140067e30
   14087d973:	41 83 c5 03          	add    r13d,0x3
   14087d977:	44 89 6c 24 60       	mov    DWORD PTR [rsp+0x60],r13d
   14087d97c:	41 ff c4             	inc    r12d
   14087d97f:	44 89 65 88          	mov    DWORD PTR [rbp-0x78],r12d
   14087d983:	44 3b 65 84          	cmp    r12d,DWORD PTR [rbp-0x7c]
   14087d987:	8b 74 24 64          	mov    esi,DWORD PTR [rsp+0x64]
   14087d98b:	4c 8b 75 f0          	mov    r14,QWORD PTR [rbp-0x10]
   14087d98f:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087d994:	0f 8c d6 f2 ff ff    	jl     0x14087cc70
   14087d99a:	8b 55 98             	mov    edx,DWORD PTR [rbp-0x68]
   14087d99d:	44 8b 4d 8c          	mov    r9d,DWORD PTR [rbp-0x74]
   14087d9a1:	44 3b f2             	cmp    r14d,edx
   14087d9a4:	7e 67                	jle    0x14087da0d
   14087d9a6:	41 8d 79 01          	lea    edi,[r9+0x1]
   14087d9aa:	41 8d 1c 51          	lea    ebx,[r9+rdx*2]
   14087d9ae:	83 c2 fe             	add    edx,0xfffffffe
   14087d9b1:	03 da                	add    ebx,edx
   14087d9b3:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087d9b7:	e8 a4 d9 83 ff       	call   0x1400bb360
   14087d9bc:	45 8d 4e ff          	lea    r9d,[r14-0x1]
   14087d9c0:	89 5c 24 30          	mov    DWORD PTR [rsp+0x30],ebx
   14087d9c4:	89 7c 24 28          	mov    DWORD PTR [rsp+0x28],edi
   14087d9c8:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
   14087d9cb:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087d9cf:	45 33 c0             	xor    r8d,r8d
   14087d9d2:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087d9d7:	8b 93 58 01 00 00    	mov    edx,DWORD PTR [rbx+0x158]
   14087d9dd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087d9e1:	e8 9a d9 83 ff       	call   0x1400bb380
   14087d9e6:	44 8d 4e 01          	lea    r9d,[rsi+0x1]
   14087d9ea:	c7 44 24 28 00 00 00 00 	mov    DWORD PTR [rsp+0x28],0x0
   14087d9f2:	0f b6 83 5c 01 00 00 	movzx  eax,BYTE PTR [rbx+0x15c]
   14087d9f9:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   14087d9fd:	44 8b 45 b4          	mov    r8d,DWORD PTR [rbp-0x4c]
   14087da01:	8b 55 b8             	mov    edx,DWORD PTR [rbp-0x48]
   14087da04:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087da08:	e8 c3 1a b9 00       	call   0x14140f4d0
   14087da0d:	4c 8d b3 68 01 00 00 	lea    r14,[rbx+0x168]
   14087da14:	4c 89 75 a8          	mov    QWORD PTR [rbp-0x58],r14
   14087da18:	49 8b ce             	mov    rcx,r14
   14087da1b:	e8 50 19 7f ff       	call   0x14006f370
   14087da20:	48 8b f8             	mov    rdi,rax
   14087da23:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14087da27:	44 8b 64 24 68       	mov    r12d,DWORD PTR [rsp+0x68]
   14087da2c:	41 ff c4             	inc    r12d
   14087da2f:	44 89 64 24 64       	mov    DWORD PTR [rsp+0x64],r12d
   14087da34:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   14087da38:	41 ff c8             	dec    r8d
   14087da3b:	8b 75 e0             	mov    esi,DWORD PTR [rbp-0x20]
   14087da3e:	83 c6 02             	add    esi,0x2
   14087da41:	89 75 a0             	mov    DWORD PTR [rbp-0x60],esi
   14087da44:	8b 4d b0             	mov    ecx,DWORD PTR [rbp-0x50]
   14087da47:	ff c9                	dec    ecx
   14087da49:	2b ce                	sub    ecx,esi
   14087da4b:	ff c1                	inc    ecx
   14087da4d:	b8 56 55 55 55       	mov    eax,0x55555556
   14087da52:	f7 e9                	imul   ecx
   14087da54:	8b da                	mov    ebx,edx
   14087da56:	c1 eb 1f             	shr    ebx,0x1f
   14087da59:	03 da                	add    ebx,edx
   14087da5b:	89 5d e8             	mov    DWORD PTR [rbp-0x18],ebx
   14087da5e:	45 8d 78 fe          	lea    r15d,[r8-0x2]
   14087da62:	3b fb                	cmp    edi,ebx
   14087da64:	45 0f 4e f8          	cmovle r15d,r8d
   14087da68:	44 89 7d 80          	mov    DWORD PTR [rbp-0x80],r15d
   14087da6c:	44 8b ee             	mov    r13d,esi
   14087da6f:	89 74 24 60          	mov    DWORD PTR [rsp+0x60],esi
   14087da73:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087da78:	8b 80 10 03 00 00    	mov    eax,DWORD PTR [rax+0x310]
   14087da7e:	8b cf                	mov    ecx,edi
   14087da80:	2b cb                	sub    ecx,ebx
   14087da82:	3b c1                	cmp    eax,ecx
   14087da84:	0f 4e c8             	cmovle ecx,eax
   14087da87:	33 d2                	xor    edx,edx
   14087da89:	85 c9                	test   ecx,ecx
   14087da8b:	0f 49 d1             	cmovns edx,ecx
   14087da8e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
   14087da91:	8b c2                	mov    eax,edx
   14087da93:	89 54 24 7c          	mov    DWORD PTR [rsp+0x7c],edx
   14087da97:	8d 0c 1a             	lea    ecx,[rdx+rbx*1]
   14087da9a:	89 4d 8c             	mov    DWORD PTR [rbp-0x74],ecx
   14087da9d:	3b d1                	cmp    edx,ecx
   14087da9f:	0f 8d 14 25 00 00    	jge    0x14087ffb9
   14087daa5:	3b c7                	cmp    eax,edi
   14087daa7:	0f 8d 06 25 00 00    	jge    0x14087ffb3
   14087daad:	45 33 c0             	xor    r8d,r8d
   14087dab0:	ba 07 00 00 00       	mov    edx,0x7
   14087dab5:	41 b1 01             	mov    r9b,0x1
   14087dab8:	48 8d 0d 31 c9 dc 01 	lea    rcx,[rip+0x1dcc931]        # 0x14264a3f0
   14087dabf:	e8 6c d6 83 ff       	call   0x1400bb130
   14087dac4:	41 8b f4             	mov    esi,r12d
   14087dac7:	45 3b e7             	cmp    r12d,r15d
   14087daca:	0f 8f dd 00 00 00    	jg     0x14087dbad
   14087dad0:	45 8d 75 03          	lea    r14d,[r13+0x3]
   14087dad4:	41 8b dd             	mov    ebx,r13d
   14087dad7:	45 3b ee             	cmp    r13d,r14d
   14087dada:	0f 8d c2 00 00 00    	jge    0x14087dba2
   14087dae0:	41 3b f7             	cmp    esi,r15d
   14087dae3:	75 5f                	jne    0x14087db44
   14087dae5:	48 8d 3d c4 e2 dc 01 	lea    rdi,[rip+0x1dce2c4]        # 0x14264bdb0
   14087daec:	4c 8d 3d fd c8 dc 01 	lea    r15,[rip+0x1dcc8fd]        # 0x14264a3f0
   14087daf3:	44 8b c6             	mov    r8d,esi
   14087daf6:	8b d3                	mov    edx,ebx
   14087daf8:	49 8b cf             	mov    rcx,r15
   14087dafb:	e8 20 d6 83 ff       	call   0x1400bb120
   14087db00:	49 8b cf             	mov    rcx,r15
   14087db03:	41 3b f4             	cmp    esi,r12d
   14087db06:	75 05                	jne    0x14087db0d
   14087db08:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087db0b:	eb 02                	jmp    0x14087db0f
   14087db0d:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087db0f:	e8 bc cf 25 00       	call   0x140adaad0
   14087db14:	33 d2                	xor    edx,edx
   14087db16:	48 8d 0d 53 fc b4 01 	lea    rcx,[rip+0x1b4fc53]        # 0x1423cd770
   14087db1d:	e8 6e 44 7f ff       	call   0x140071f90
   14087db22:	84 c0                	test   al,al
   14087db24:	74 0d                	je     0x14087db33
   14087db26:	41 b0 01             	mov    r8b,0x1
   14087db29:	33 d2                	xor    edx,edx
   14087db2b:	49 8b cf             	mov    rcx,r15
   14087db2e:	e8 5d d6 83 ff       	call   0x1400bb190
   14087db33:	ff c3                	inc    ebx
   14087db35:	48 83 c7 04          	add    rdi,0x4
   14087db39:	41 3b de             	cmp    ebx,r14d
   14087db3c:	7c b5                	jl     0x14087daf3
   14087db3e:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087db42:	eb 5e                	jmp    0x14087dba2
   14087db44:	48 8d 3d 59 e2 dc 01 	lea    rdi,[rip+0x1dce259]        # 0x14264bda4
   14087db4b:	4c 8d 2d 9e c8 dc 01 	lea    r13,[rip+0x1dcc89e]        # 0x14264a3f0
   14087db52:	44 8b c6             	mov    r8d,esi
   14087db55:	8b d3                	mov    edx,ebx
   14087db57:	49 8b cd             	mov    rcx,r13
   14087db5a:	e8 c1 d5 83 ff       	call   0x1400bb120
   14087db5f:	49 8b cd             	mov    rcx,r13
   14087db62:	41 3b f4             	cmp    esi,r12d
   14087db65:	75 05                	jne    0x14087db6c
   14087db67:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087db6a:	eb 02                	jmp    0x14087db6e
   14087db6c:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087db6e:	e8 5d cf 25 00       	call   0x140adaad0
   14087db73:	33 d2                	xor    edx,edx
   14087db75:	48 8d 0d f4 fb b4 01 	lea    rcx,[rip+0x1b4fbf4]        # 0x1423cd770
   14087db7c:	e8 0f 44 7f ff       	call   0x140071f90
   14087db81:	84 c0                	test   al,al
   14087db83:	74 0d                	je     0x14087db92
   14087db85:	41 b0 01             	mov    r8b,0x1
   14087db88:	33 d2                	xor    edx,edx
   14087db8a:	49 8b cd             	mov    rcx,r13
   14087db8d:	e8 fe d5 83 ff       	call   0x1400bb190
   14087db92:	ff c3                	inc    ebx
   14087db94:	48 83 c7 04          	add    rdi,0x4
   14087db98:	41 3b de             	cmp    ebx,r14d
   14087db9b:	7c b5                	jl     0x14087db52
   14087db9d:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087dba2:	ff c6                	inc    esi
   14087dba4:	41 3b f7             	cmp    esi,r15d
   14087dba7:	0f 8e 27 ff ff ff    	jle    0x14087dad4
   14087dbad:	45 8d 44 24 0c       	lea    r8d,[r12+0xc]
   14087dbb2:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087dbb6:	48 8d 35 33 c8 dc 01 	lea    rsi,[rip+0x1dcc833]        # 0x14264a3f0
   14087dbbd:	48 8b ce             	mov    rcx,rsi
   14087dbc0:	e8 5b d5 83 ff       	call   0x1400bb120
   14087dbc5:	48 63 5c 24 7c       	movsxd rbx,DWORD PTR [rsp+0x7c]
   14087dbca:	8b d3                	mov    edx,ebx
   14087dbcc:	2b 55 e0             	sub    edx,DWORD PTR [rbp-0x20]
   14087dbcf:	83 c2 52             	add    edx,0x52
   14087dbd2:	45 33 c0             	xor    r8d,r8d
   14087dbd5:	48 8d 0d 14 06 03 01 	lea    rcx,[rip+0x1030614]        # 0x1418ae1f0
   14087dbdc:	e8 cf b8 3b 00       	call   0x140c394b0
   14087dbe1:	4c 8b f3             	mov    r14,rbx
   14087dbe4:	48 8b d3             	mov    rdx,rbx
   14087dbe7:	48 8b 4d a8          	mov    rcx,QWORD PTR [rbp-0x58]
   14087dbeb:	e8 70 17 7f ff       	call   0x14006f360
   14087dbf0:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   14087dbf3:	45 85 c0             	test   r8d,r8d
   14087dbf6:	0f 84 f8 05 00 00    	je     0x14087e1f4
   14087dbfc:	41 83 e8 01          	sub    r8d,0x1
   14087dc00:	0f 84 fc 00 00 00    	je     0x14087dd02
   14087dc06:	41 83 e8 01          	sub    r8d,0x1
   14087dc0a:	0f 84 e4 05 00 00    	je     0x14087e1f4
   14087dc10:	41 83 e8 01          	sub    r8d,0x1
   14087dc14:	0f 84 e8 00 00 00    	je     0x14087dd02
   14087dc1a:	41 83 f8 01          	cmp    r8d,0x1
   14087dc1e:	0f 85 6f 23 00 00    	jne    0x14087ff93
   14087dc24:	48 8b 74 24 70       	mov    rsi,QWORD PTR [rsp+0x70]
   14087dc29:	48 8d 8e 80 01 00 00 	lea    rcx,[rsi+0x180]
   14087dc30:	48 8b d3             	mov    rdx,rbx
   14087dc33:	e8 28 17 7f ff       	call   0x14006f360
   14087dc38:	8b 10                	mov    edx,DWORD PTR [rax]
   14087dc3a:	48 8d 0d 0f 78 b6 01 	lea    rcx,[rip+0x1b6780f]        # 0x1423e5450
   14087dc41:	e8 9a 4a 7f ff       	call   0x1400726e0
   14087dc46:	48 8b d8             	mov    rbx,rax
   14087dc49:	48 85 c0             	test   rax,rax
   14087dc4c:	0f 84 41 23 00 00    	je     0x14087ff93
   14087dc52:	45 33 c0             	xor    r8d,r8d
   14087dc55:	ba 06 00 00 00       	mov    edx,0x6
   14087dc5a:	41 b1 01             	mov    r9b,0x1
   14087dc5d:	48 8d 0d 8c c7 dc 01 	lea    rcx,[rip+0x1dcc78c]        # 0x14264a3f0
   14087dc64:	e8 c7 d4 83 ff       	call   0x1400bb130
   14087dc69:	45 8d 44 24 0a       	lea    r8d,[r12+0xa]
   14087dc6e:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087dc72:	48 8d 3d 77 c7 dc 01 	lea    rdi,[rip+0x1dcc777]        # 0x14264a3f0
   14087dc79:	48 8b cf             	mov    rcx,rdi
   14087dc7c:	e8 9f d4 83 ff       	call   0x1400bb120
   14087dc81:	48 8d 15 68 61 e3 00 	lea    rdx,[rip+0xe36168]        # 0x1416b3df0
   14087dc88:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087dc8c:	e8 bf a4 7e ff       	call   0x140068150
   14087dc91:	90                   	nop
   14087dc92:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087dc96:	e8 f5 19 7f ff       	call   0x14006f690
   14087dc9b:	90                   	nop
   14087dc9c:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087dca2:	45 33 c0             	xor    r8d,r8d
   14087dca5:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087dca9:	48 8b cb             	mov    rcx,rbx
   14087dcac:	e8 9f 77 3e 00       	call   0x140c65450
   14087dcb1:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087dcb5:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087dcb9:	e8 52 c0 83 ff       	call   0x1400b9d10
   14087dcbe:	45 33 c9             	xor    r9d,r9d
   14087dcc1:	45 33 c0             	xor    r8d,r8d
   14087dcc4:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087dcc8:	48 8b cf             	mov    rcx,rdi
   14087dccb:	e8 90 bc 25 00       	call   0x140ad9960
   14087dcd0:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087dcd4:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087dcd8:	45 8b cd             	mov    r9d,r13d
   14087dcdb:	45 8b c4             	mov    r8d,r12d
   14087dcde:	8b 53 1c             	mov    edx,DWORD PTR [rbx+0x1c]
   14087dce1:	48 8b ce             	mov    rcx,rsi
   14087dce4:	e8 c7 67 02 00       	call   0x1408a44b0
   14087dce9:	90                   	nop
   14087dcea:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087dcee:	e8 3d a1 7e ff       	call   0x140067e30
   14087dcf3:	90                   	nop
   14087dcf4:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087dcf8:	e8 33 a1 7e ff       	call   0x140067e30
   14087dcfd:	e9 91 22 00 00       	jmp    0x14087ff93
   14087dd02:	45 33 c0             	xor    r8d,r8d
   14087dd05:	ba 07 00 00 00       	mov    edx,0x7
   14087dd0a:	41 b1 01             	mov    r9b,0x1
   14087dd0d:	48 8b ce             	mov    rcx,rsi
   14087dd10:	e8 1b d4 83 ff       	call   0x1400bb130
   14087dd15:	4c 8b 6c 24 70       	mov    r13,QWORD PTR [rsp+0x70]
   14087dd1a:	49 8b d6             	mov    rdx,r14
   14087dd1d:	49 8d 8d 80 01 00 00 	lea    rcx,[r13+0x180]
   14087dd24:	e8 37 16 7f ff       	call   0x14006f360
   14087dd29:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087dd2c:	49 8d 8d 68 02 00 00 	lea    rcx,[r13+0x268]
   14087dd33:	e8 08 17 7f ff       	call   0x14006f440
   14087dd38:	4c 0f bf 20          	movsx  r12,WORD PTR [rax]
   14087dd3c:	49 8b d6             	mov    rdx,r14
   14087dd3f:	49 8d 8d 80 01 00 00 	lea    rcx,[r13+0x180]
   14087dd46:	e8 15 16 7f ff       	call   0x14006f360
   14087dd4b:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087dd4e:	49 8d 8d 80 02 00 00 	lea    rcx,[r13+0x280]
   14087dd55:	e8 e6 16 7f ff       	call   0x14006f440
   14087dd5a:	48 0f bf 30          	movsx  rsi,WORD PTR [rax]
   14087dd5e:	49 8b d6             	mov    rdx,r14
   14087dd61:	49 8d 8d 80 01 00 00 	lea    rcx,[r13+0x180]
   14087dd68:	e8 f3 15 7f ff       	call   0x14006f360
   14087dd6d:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087dd70:	49 8d 8d 98 02 00 00 	lea    rcx,[r13+0x298]
   14087dd77:	e8 c4 16 7f ff       	call   0x14006f440
   14087dd7c:	4c 0f bf 38          	movsx  r15,WORD PTR [rax]
   14087dd80:	49 8b d6             	mov    rdx,r14
   14087dd83:	49 8d 8d 80 01 00 00 	lea    rcx,[r13+0x180]
   14087dd8a:	e8 d1 15 7f ff       	call   0x14006f360
   14087dd8f:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087dd92:	49 8d 8d b0 02 00 00 	lea    rcx,[r13+0x2b0]
   14087dd99:	e8 a2 16 7f ff       	call   0x14006f440
   14087dd9e:	48 0f bf 18          	movsx  rbx,WORD PTR [rax]
   14087dda2:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14087dda7:	0f b7 f8             	movzx  edi,ax
   14087ddaa:	66 89 45 98          	mov    WORD PTR [rbp-0x68],ax
   14087ddae:	66 89 45 88          	mov    WORD PTR [rbp-0x78],ax
   14087ddb2:	45 33 ed             	xor    r13d,r13d
   14087ddb5:	4c 89 6d c0          	mov    QWORD PTR [rbp-0x40],r13
   14087ddb9:	33 c0                	xor    eax,eax
   14087ddbb:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14087ddbf:	4c 8b 74 24 70       	mov    r14,QWORD PTR [rsp+0x70]
   14087ddc4:	66 44 3b e7          	cmp    r12w,di
   14087ddc8:	74 16                	je     0x14087dde0
   14087ddca:	49 8d 8e c0 01 00 00 	lea    rcx,[r14+0x1c0]
   14087ddd1:	49 8b d4             	mov    rdx,r12
   14087ddd4:	e8 67 16 7f ff       	call   0x14006f440
   14087ddd9:	0f b7 38             	movzx  edi,WORD PTR [rax]
   14087dddc:	66 89 7d 98          	mov    WORD PTR [rbp-0x68],di
   14087dde0:	66 83 fe ff          	cmp    si,0xffff
   14087dde4:	74 16                	je     0x14087ddfc
   14087dde6:	49 8d 8e a8 01 00 00 	lea    rcx,[r14+0x1a8]
   14087dded:	48 8b d6             	mov    rdx,rsi
   14087ddf0:	e8 2b 14 7f ff       	call   0x14006f220
   14087ddf5:	4c 8b 28             	mov    r13,QWORD PTR [rax]
   14087ddf8:	4c 89 6d c0          	mov    QWORD PTR [rbp-0x40],r13
   14087ddfc:	66 41 83 ff ff       	cmp    r15w,0xffff
   14087de01:	74 16                	je     0x14087de19
   14087de03:	49 8d 8e f0 01 00 00 	lea    rcx,[r14+0x1f0]
   14087de0a:	49 8b d7             	mov    rdx,r15
   14087de0d:	e8 2e 16 7f ff       	call   0x14006f440
   14087de12:	0f b7 00             	movzx  eax,WORD PTR [rax]
   14087de15:	66 89 45 88          	mov    WORD PTR [rbp-0x78],ax
   14087de19:	66 83 fb ff          	cmp    bx,0xffff
   14087de1d:	74 16                	je     0x14087de35
   14087de1f:	49 8d 8e d8 01 00 00 	lea    rcx,[r14+0x1d8]
   14087de26:	48 8b d3             	mov    rdx,rbx
   14087de29:	e8 f2 13 7f ff       	call   0x14006f220
   14087de2e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087de31:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14087de35:	4d 85 ed             	test   r13,r13
   14087de38:	74 23                	je     0x14087de5d
   14087de3a:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087de3e:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087de42:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087de47:	44 8b 44 24 64       	mov    r8d,DWORD PTR [rsp+0x64]
   14087de4c:	41 8b 55 1c          	mov    edx,DWORD PTR [r13+0x1c]
   14087de50:	49 8b ce             	mov    rcx,r14
   14087de53:	e8 58 66 02 00       	call   0x1408a44b0
   14087de58:	e9 aa 00 00 00       	jmp    0x14087df07
   14087de5d:	0f bf d7             	movsx  edx,di
   14087de60:	48 8b 0d a9 72 b6 01 	mov    rcx,QWORD PTR [rip+0x1b672a9]        # 0x1423e5110
   14087de67:	e8 f4 f9 9e ff       	call   0x14026d860
   14087de6c:	83 f8 ff             	cmp    eax,0xffffffff
   14087de6f:	0f 84 92 00 00 00    	je     0x14087df07
   14087de75:	48 98                	cdqe
   14087de77:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087de7c:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087de80:	49 c1 e7 04          	shl    r15,0x4
   14087de84:	48 8d 05 bd e5 dc 01 	lea    rax,[rip+0x1dce5bd]        # 0x14264c448
   14087de8b:	4c 03 f8             	add    r15,rax
   14087de8e:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087de94:	44 8b 6c 24 64       	mov    r13d,DWORD PTR [rsp+0x64]
   14087de99:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   14087dea0:	41 8b dd             	mov    ebx,r13d
   14087dea3:	49 8b ff             	mov    rdi,r15
   14087dea6:	be 04 00 00 00       	mov    esi,0x4
   14087deab:	4c 8d 2d 3e c5 dc 01 	lea    r13,[rip+0x1dcc53e]        # 0x14264a3f0
   14087deb2:	44 8b c3             	mov    r8d,ebx
   14087deb5:	41 8b d6             	mov    edx,r14d
   14087deb8:	49 8b cd             	mov    rcx,r13
   14087debb:	e8 60 d2 83 ff       	call   0x1400bb120
   14087dec0:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087dec2:	49 8b cd             	mov    rcx,r13
   14087dec5:	e8 06 cc 25 00       	call   0x140adaad0
   14087deca:	33 d2                	xor    edx,edx
   14087decc:	48 8d 0d 9d f8 b4 01 	lea    rcx,[rip+0x1b4f89d]        # 0x1423cd770
   14087ded3:	e8 b8 40 7f ff       	call   0x140071f90
   14087ded8:	84 c0                	test   al,al
   14087deda:	74 0d                	je     0x14087dee9
   14087dedc:	41 b0 01             	mov    r8b,0x1
   14087dedf:	33 d2                	xor    edx,edx
   14087dee1:	49 8b cd             	mov    rcx,r13
   14087dee4:	e8 a7 d2 83 ff       	call   0x1400bb190
   14087dee9:	ff c3                	inc    ebx
   14087deeb:	48 83 c7 0c          	add    rdi,0xc
   14087deef:	48 83 ee 01          	sub    rsi,0x1
   14087def3:	75 bd                	jne    0x14087deb2
   14087def5:	41 ff c6             	inc    r14d
   14087def8:	49 83 c7 04          	add    r15,0x4
   14087defc:	49 83 ec 01          	sub    r12,0x1
   14087df00:	44 8b 6c 24 64       	mov    r13d,DWORD PTR [rsp+0x64]
   14087df05:	75 99                	jne    0x14087dea0
   14087df07:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087df0c:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087df11:	4c 8d 3d 70 50 dd 01 	lea    r15,[rip+0x1dd5070]        # 0x142652f88
   14087df18:	4c 8d 2d d1 c4 dc 01 	lea    r13,[rip+0x1dcc4d1]        # 0x14264a3f0
   14087df1f:	90                   	nop
   14087df20:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087df25:	49 8b ff             	mov    rdi,r15
   14087df28:	be 04 00 00 00       	mov    esi,0x4
   14087df2d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087df30:	44 8b c3             	mov    r8d,ebx
   14087df33:	41 8b d6             	mov    edx,r14d
   14087df36:	49 8b cd             	mov    rcx,r13
   14087df39:	e8 e2 d1 83 ff       	call   0x1400bb120
   14087df3e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087df40:	49 8b cd             	mov    rcx,r13
   14087df43:	e8 88 cb 25 00       	call   0x140adaad0
   14087df48:	33 d2                	xor    edx,edx
   14087df4a:	48 8d 0d 1f f8 b4 01 	lea    rcx,[rip+0x1b4f81f]        # 0x1423cd770
   14087df51:	e8 3a 40 7f ff       	call   0x140071f90
   14087df56:	84 c0                	test   al,al
   14087df58:	74 0d                	je     0x14087df67
   14087df5a:	41 b0 01             	mov    r8b,0x1
   14087df5d:	33 d2                	xor    edx,edx
   14087df5f:	49 8b cd             	mov    rcx,r13
   14087df62:	e8 29 d2 83 ff       	call   0x1400bb190
   14087df67:	ff c3                	inc    ebx
   14087df69:	48 83 c7 0c          	add    rdi,0xc
   14087df6d:	48 83 ee 01          	sub    rsi,0x1
   14087df71:	75 bd                	jne    0x14087df30
   14087df73:	41 ff c6             	inc    r14d
   14087df76:	49 83 c7 04          	add    r15,0x4
   14087df7a:	48 8d 05 13 50 dd 01 	lea    rax,[rip+0x1dd5013]        # 0x142652f94
   14087df81:	4c 3b f8             	cmp    r15,rax
   14087df84:	7c 9a                	jl     0x14087df20
   14087df86:	48 63 74 24 7c       	movsxd rsi,DWORD PTR [rsp+0x7c]
   14087df8b:	48 8b d6             	mov    rdx,rsi
   14087df8e:	4c 8b 75 a8          	mov    r14,QWORD PTR [rbp-0x58]
   14087df92:	49 8b ce             	mov    rcx,r14
   14087df95:	e8 c6 13 7f ff       	call   0x14006f360
   14087df9a:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14087df9d:	4c 8b 6d c0          	mov    r13,QWORD PTR [rbp-0x40]
   14087dfa1:	48 8b 5d c8          	mov    rbx,QWORD PTR [rbp-0x38]
   14087dfa5:	4c 8b 7c 24 70       	mov    r15,QWORD PTR [rsp+0x70]
   14087dfaa:	0f 85 93 01 00 00    	jne    0x14087e143
   14087dfb0:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087dfb5:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087dfb9:	48 85 db             	test   rbx,rbx
   14087dfbc:	0f 84 b8 00 00 00    	je     0x14087e07a
   14087dfc2:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087dfc6:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087dfca:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087dfcf:	45 8b c5             	mov    r8d,r13d
   14087dfd2:	8b 53 1c             	mov    edx,DWORD PTR [rbx+0x1c]
   14087dfd5:	49 8b cf             	mov    rcx,r15
   14087dfd8:	e8 d3 64 02 00       	call   0x1408a44b0
   14087dfdd:	0f b7 7d 88          	movzx  edi,WORD PTR [rbp-0x78]
   14087dfe1:	4c 8b 6d c0          	mov    r13,QWORD PTR [rbp-0x40]
   14087dfe5:	48 63 d6             	movsxd rdx,esi
   14087dfe8:	49 8b ce             	mov    rcx,r14
   14087dfeb:	e8 70 13 7f ff       	call   0x14006f360
   14087dff0:	8b 54 24 60          	mov    edx,DWORD PTR [rsp+0x60]
   14087dff4:	ff c2                	inc    edx
   14087dff6:	48 8d 0d f3 c3 dc 01 	lea    rcx,[rip+0x1dcc3f3]        # 0x14264a3f0
   14087dffd:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14087e000:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087e005:	74 05                	je     0x14087e00c
   14087e007:	45 8d 44 24 0a       	lea    r8d,[r12+0xa]
   14087e00c:	e8 0f d1 83 ff       	call   0x1400bb120
   14087e011:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087e015:	e8 76 16 7f ff       	call   0x14006f690
   14087e01a:	90                   	nop
   14087e01b:	48 8d 15 76 68 e3 00 	lea    rdx,[rip+0xe36876]        # 0x1416b4898
   14087e022:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087e026:	e8 25 a1 7e ff       	call   0x140068150
   14087e02b:	90                   	nop
   14087e02c:	48 63 d6             	movsxd rdx,esi
   14087e02f:	49 8b ce             	mov    rcx,r14
   14087e032:	e8 29 13 7f ff       	call   0x14006f360
   14087e037:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14087e03a:	0f 85 2a 01 00 00    	jne    0x14087e16a
   14087e040:	48 8d 15 f5 a6 d6 00 	lea    rdx,[rip+0xd6a6f5]        # 0x1415e873c
   14087e047:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087e04b:	e8 10 15 7f ff       	call   0x14006f560
   14087e050:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087e054:	66 83 ff ff          	cmp    di,0xffff
   14087e058:	0f 84 ee 00 00 00    	je     0x14087e14c
   14087e05e:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087e065:	45 33 c9             	xor    r9d,r9d
   14087e068:	44 0f b7 c7          	movzx  r8d,di
   14087e06c:	49 8b 4f 38          	mov    rcx,QWORD PTR [r15+0x38]
   14087e070:	e8 5b 65 ab 00       	call   0x1413345d0
   14087e075:	e9 e3 00 00 00       	jmp    0x14087e15d
   14087e07a:	0f bf 7d 88          	movsx  edi,WORD PTR [rbp-0x78]
   14087e07e:	8b d7                	mov    edx,edi
   14087e080:	49 8b 4f 38          	mov    rcx,QWORD PTR [r15+0x38]
   14087e084:	e8 d7 f7 9e ff       	call   0x14026d860
   14087e089:	83 f8 ff             	cmp    eax,0xffffffff
   14087e08c:	0f 84 4f ff ff ff    	je     0x14087dfe1
   14087e092:	48 98                	cdqe
   14087e094:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087e099:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087e09d:	49 c1 e7 04          	shl    r15,0x4
   14087e0a1:	48 8d 05 a0 e3 dc 01 	lea    rax,[rip+0x1dce3a0]        # 0x14264c448
   14087e0a8:	4c 03 f8             	add    r15,rax
   14087e0ab:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087e0b1:	41 8b dd             	mov    ebx,r13d
   14087e0b4:	49 8b ff             	mov    rdi,r15
   14087e0b7:	be 04 00 00 00       	mov    esi,0x4
   14087e0bc:	4c 8d 2d 2d c3 dc 01 	lea    r13,[rip+0x1dcc32d]        # 0x14264a3f0
   14087e0c3:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087e0c7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087e0d0:	44 8b c3             	mov    r8d,ebx
   14087e0d3:	41 8b d6             	mov    edx,r14d
   14087e0d6:	49 8b cd             	mov    rcx,r13
   14087e0d9:	e8 42 d0 83 ff       	call   0x1400bb120
   14087e0de:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087e0e0:	49 8b cd             	mov    rcx,r13
   14087e0e3:	e8 e8 c9 25 00       	call   0x140adaad0
   14087e0e8:	33 d2                	xor    edx,edx
   14087e0ea:	48 8d 0d 7f f6 b4 01 	lea    rcx,[rip+0x1b4f67f]        # 0x1423cd770
   14087e0f1:	e8 9a 3e 7f ff       	call   0x140071f90
   14087e0f6:	84 c0                	test   al,al
   14087e0f8:	74 0d                	je     0x14087e107
   14087e0fa:	41 b0 01             	mov    r8b,0x1
   14087e0fd:	33 d2                	xor    edx,edx
   14087e0ff:	49 8b cd             	mov    rcx,r13
   14087e102:	e8 89 d0 83 ff       	call   0x1400bb190
   14087e107:	ff c3                	inc    ebx
   14087e109:	48 83 c7 0c          	add    rdi,0xc
   14087e10d:	48 83 ee 01          	sub    rsi,0x1
   14087e111:	75 bd                	jne    0x14087e0d0
   14087e113:	41 ff c6             	inc    r14d
   14087e116:	49 83 c7 04          	add    r15,0x4
   14087e11a:	49 83 ec 01          	sub    r12,0x1
   14087e11e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087e122:	75 8d                	jne    0x14087e0b1
   14087e124:	48 8b 5d c8          	mov    rbx,QWORD PTR [rbp-0x38]
   14087e128:	0f b7 7d 88          	movzx  edi,WORD PTR [rbp-0x78]
   14087e12c:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087e131:	8b 74 24 7c          	mov    esi,DWORD PTR [rsp+0x7c]
   14087e135:	4c 8b 75 a8          	mov    r14,QWORD PTR [rbp-0x58]
   14087e139:	4c 8b 7c 24 70       	mov    r15,QWORD PTR [rsp+0x70]
   14087e13e:	e9 9e fe ff ff       	jmp    0x14087dfe1
   14087e143:	0f b7 7d 88          	movzx  edi,WORD PTR [rbp-0x78]
   14087e147:	e9 99 fe ff ff       	jmp    0x14087dfe5
   14087e14c:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087e152:	45 33 c0             	xor    r8d,r8d
   14087e155:	48 8b cb             	mov    rcx,rbx
   14087e158:	e8 f3 72 3e 00       	call   0x140c65450
   14087e15d:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087e161:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087e165:	e8 a6 bb 83 ff       	call   0x1400b9d10
   14087e16a:	48 8d 15 6f 04 d7 00 	lea    rdx,[rip+0xd7046f]        # 0x1415ee5e0
   14087e171:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087e175:	e8 e6 13 7f ff       	call   0x14006f560
   14087e17a:	44 0f b7 45 98       	movzx  r8d,WORD PTR [rbp-0x68]
   14087e17f:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087e183:	66 41 83 f8 ff       	cmp    r8w,0xffff
   14087e188:	74 18                	je     0x14087e1a2
   14087e18a:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087e191:	45 33 c9             	xor    r9d,r9d
   14087e194:	48 8b 0d 75 6f b6 01 	mov    rcx,QWORD PTR [rip+0x1b66f75]        # 0x1423e5110
   14087e19b:	e8 30 64 ab 00       	call   0x1413345d0
   14087e1a0:	eb 11                	jmp    0x14087e1b3
   14087e1a2:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087e1a8:	45 33 c0             	xor    r8d,r8d
   14087e1ab:	49 8b cd             	mov    rcx,r13
   14087e1ae:	e8 9d 72 3e 00       	call   0x140c65450
   14087e1b3:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087e1b7:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087e1bb:	e8 50 bb 83 ff       	call   0x1400b9d10
   14087e1c0:	45 33 c9             	xor    r9d,r9d
   14087e1c3:	45 33 c0             	xor    r8d,r8d
   14087e1c6:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087e1ca:	48 8d 0d 1f c2 dc 01 	lea    rcx,[rip+0x1dcc21f]        # 0x14264a3f0
   14087e1d1:	e8 8a b7 25 00       	call   0x140ad9960
   14087e1d6:	90                   	nop
   14087e1d7:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087e1db:	e8 50 9c 7e ff       	call   0x140067e30
   14087e1e0:	90                   	nop
   14087e1e1:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087e1e5:	e8 46 9c 7e ff       	call   0x140067e30
   14087e1ea:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087e1ef:	e9 9b 1d 00 00       	jmp    0x14087ff8f
   14087e1f4:	45 33 c0             	xor    r8d,r8d
   14087e1f7:	ba 03 00 00 00       	mov    edx,0x3
   14087e1fc:	41 b1 01             	mov    r9b,0x1
   14087e1ff:	48 8b ce             	mov    rcx,rsi
   14087e202:	e8 29 cf 83 ff       	call   0x1400bb130
   14087e207:	4c 8b 6c 24 70       	mov    r13,QWORD PTR [rsp+0x70]
   14087e20c:	49 8d b5 80 01 00 00 	lea    rsi,[r13+0x180]
   14087e213:	49 8b d6             	mov    rdx,r14
   14087e216:	48 8b ce             	mov    rcx,rsi
   14087e219:	e8 42 11 7f ff       	call   0x14006f360
   14087e21e:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087e221:	49 8d 8d c8 02 00 00 	lea    rcx,[r13+0x2c8]
   14087e228:	e8 13 12 7f ff       	call   0x14006f440
   14087e22d:	48 0f bf 10          	movsx  rdx,WORD PTR [rax]
   14087e231:	49 8d 8d 08 02 00 00 	lea    rcx,[r13+0x208]
   14087e238:	e8 23 59 9c ff       	call   0x140243b60
   14087e23d:	48 8b c8             	mov    rcx,rax
   14087e240:	e8 cb 0b 7f ff       	call   0x14006ee10
   14087e245:	4c 8b f8             	mov    r15,rax
   14087e248:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   14087e24c:	49 8b d6             	mov    rdx,r14
   14087e24f:	48 8b ce             	mov    rcx,rsi
   14087e252:	e8 09 11 7f ff       	call   0x14006f360
   14087e257:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087e25a:	49 8d 8d c8 02 00 00 	lea    rcx,[r13+0x2c8]
   14087e261:	e8 da 11 7f ff       	call   0x14006f440
   14087e266:	48 0f bf 10          	movsx  rdx,WORD PTR [rax]
   14087e26a:	49 8d 8d 20 02 00 00 	lea    rcx,[r13+0x220]
   14087e271:	e8 ea 58 9c ff       	call   0x140243b60
   14087e276:	48 8b c8             	mov    rcx,rax
   14087e279:	e8 92 0b 7f ff       	call   0x14006ee10
   14087e27e:	4c 8b e8             	mov    r13,rax
   14087e281:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
   14087e285:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087e28a:	49 8b d6             	mov    rdx,r14
   14087e28d:	48 8b ce             	mov    rcx,rsi
   14087e290:	e8 cb 10 7f ff       	call   0x14006f360
   14087e295:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087e298:	48 8d 8b e0 02 00 00 	lea    rcx,[rbx+0x2e0]
   14087e29f:	e8 9c 11 7f ff       	call   0x14006f440
   14087e2a4:	48 0f bf 38          	movsx  rdi,WORD PTR [rax]
   14087e2a8:	49 8b d6             	mov    rdx,r14
   14087e2ab:	48 8b ce             	mov    rcx,rsi
   14087e2ae:	e8 ad 10 7f ff       	call   0x14006f360
   14087e2b3:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087e2b6:	48 8d 8b f8 02 00 00 	lea    rcx,[rbx+0x2f8]
   14087e2bd:	e8 7e 11 7f ff       	call   0x14006f440
   14087e2c2:	0f b7 00             	movzx  eax,WORD PTR [rax]
   14087e2c5:	66 89 45 88          	mov    WORD PTR [rbp-0x78],ax
   14087e2c9:	48 8d 4d 78          	lea    rcx,[rbp+0x78]
   14087e2cd:	e8 be 13 7f ff       	call   0x14006f690
   14087e2d2:	90                   	nop
   14087e2d3:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087e2d7:	e8 b4 13 7f ff       	call   0x14006f690
   14087e2dc:	90                   	nop
   14087e2dd:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087e2e1:	e8 aa 13 7f ff       	call   0x14006f690
   14087e2e6:	90                   	nop
   14087e2e7:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087e2eb:	83 fa ff             	cmp    edx,0xffffffff
   14087e2ee:	0f 84 a2 00 00 00    	je     0x14087e396
   14087e2f4:	48 8d 0d 55 71 b6 01 	lea    rcx,[rip+0x1b67155]        # 0x1423e5450
   14087e2fb:	e8 e0 43 7f ff       	call   0x1400726e0
   14087e300:	be ff ff ff ff       	mov    esi,0xffffffff
   14087e305:	48 85 c0             	test   rax,rax
   14087e308:	74 12                	je     0x14087e31c
   14087e30a:	44 8b ce             	mov    r9d,esi
   14087e30d:	45 33 c0             	xor    r8d,r8d
   14087e310:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087e314:	48 8b c8             	mov    rcx,rax
   14087e317:	e8 34 71 3e 00       	call   0x140c65450
   14087e31c:	bb 02 00 00 00       	mov    ebx,0x2
   14087e321:	41 8b 55 14          	mov    edx,DWORD PTR [r13+0x14]
   14087e325:	83 fa ff             	cmp    edx,0xffffffff
   14087e328:	0f 84 94 00 00 00    	je     0x14087e3c2
   14087e32e:	48 8d 0d 1b 71 b6 01 	lea    rcx,[rip+0x1b6711b]        # 0x1423e5450
   14087e335:	e8 a6 43 7f ff       	call   0x1400726e0
   14087e33a:	48 85 c0             	test   rax,rax
   14087e33d:	74 12                	je     0x14087e351
   14087e33f:	44 8b ce             	mov    r9d,esi
   14087e342:	45 33 c0             	xor    r8d,r8d
   14087e345:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087e349:	48 8b c8             	mov    rcx,rax
   14087e34c:	e8 ff 70 3e 00       	call   0x140c65450
   14087e351:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087e356:	48 63 54 24 7c       	movsxd rdx,DWORD PTR [rsp+0x7c]
   14087e35b:	48 8b 4d a8          	mov    rcx,QWORD PTR [rbp-0x58]
   14087e35f:	e8 fc 0f 7f ff       	call   0x14006f360
   14087e364:	83 38 02             	cmp    DWORD PTR [rax],0x2
   14087e367:	0f 85 05 02 00 00    	jne    0x14087e572
   14087e36d:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087e371:	83 fa ff             	cmp    edx,0xffffffff
   14087e374:	74 70                	je     0x14087e3e6
   14087e376:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087e37a:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087e37e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087e383:	45 8b cd             	mov    r9d,r13d
   14087e386:	45 8b c4             	mov    r8d,r12d
   14087e389:	48 8b cb             	mov    rcx,rbx
   14087e38c:	e8 1f 61 02 00       	call   0x1408a44b0
   14087e391:	e9 04 01 00 00       	jmp    0x14087e49a
   14087e396:	bb 02 00 00 00       	mov    ebx,0x2
   14087e39b:	66 89 5c 24 20       	mov    WORD PTR [rsp+0x20],bx
   14087e3a0:	45 33 c9             	xor    r9d,r9d
   14087e3a3:	45 0f b7 47 04       	movzx  r8d,WORD PTR [r15+0x4]
   14087e3a8:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087e3ac:	48 8b 0d 5d 6d b6 01 	mov    rcx,QWORD PTR [rip+0x1b66d5d]        # 0x1423e5110
   14087e3b3:	e8 18 62 ab 00       	call   0x1413345d0
   14087e3b8:	be ff ff ff ff       	mov    esi,0xffffffff
   14087e3bd:	e9 5f ff ff ff       	jmp    0x14087e321
   14087e3c2:	66 89 5c 24 20       	mov    WORD PTR [rsp+0x20],bx
   14087e3c7:	45 33 c9             	xor    r9d,r9d
   14087e3ca:	45 0f b7 45 04       	movzx  r8d,WORD PTR [r13+0x4]
   14087e3cf:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087e3d3:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087e3d8:	48 8b 4b 38          	mov    rcx,QWORD PTR [rbx+0x38]
   14087e3dc:	e8 ef 61 ab 00       	call   0x1413345d0
   14087e3e1:	e9 70 ff ff ff       	jmp    0x14087e356
   14087e3e6:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087e3ea:	48 8b 0d 1f 6d b6 01 	mov    rcx,QWORD PTR [rip+0x1b66d1f]        # 0x1423e5110
   14087e3f1:	e8 6a f4 9e ff       	call   0x14026d860
   14087e3f6:	83 f8 ff             	cmp    eax,0xffffffff
   14087e3f9:	0f 84 96 00 00 00    	je     0x14087e495
   14087e3ff:	48 98                	cdqe
   14087e401:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087e406:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087e40a:	49 c1 e7 04          	shl    r15,0x4
   14087e40e:	48 8d 05 33 e0 dc 01 	lea    rax,[rip+0x1dce033]        # 0x14264c448
   14087e415:	4c 03 f8             	add    r15,rax
   14087e418:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087e41e:	4c 8d 2d cb bf dc 01 	lea    r13,[rip+0x1dcbfcb]        # 0x14264a3f0
   14087e425:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087e430:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087e434:	49 8b ff             	mov    rdi,r15
   14087e437:	be 04 00 00 00       	mov    esi,0x4
   14087e43c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087e440:	44 8b c3             	mov    r8d,ebx
   14087e443:	41 8b d6             	mov    edx,r14d
   14087e446:	49 8b cd             	mov    rcx,r13
   14087e449:	e8 d2 cc 83 ff       	call   0x1400bb120
   14087e44e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087e450:	49 8b cd             	mov    rcx,r13
   14087e453:	e8 78 c6 25 00       	call   0x140adaad0
   14087e458:	33 d2                	xor    edx,edx
   14087e45a:	48 8d 0d 0f f3 b4 01 	lea    rcx,[rip+0x1b4f30f]        # 0x1423cd770
   14087e461:	e8 2a 3b 7f ff       	call   0x140071f90
   14087e466:	84 c0                	test   al,al
   14087e468:	74 0d                	je     0x14087e477
   14087e46a:	41 b0 01             	mov    r8b,0x1
   14087e46d:	33 d2                	xor    edx,edx
   14087e46f:	49 8b cd             	mov    rcx,r13
   14087e472:	e8 19 cd 83 ff       	call   0x1400bb190
   14087e477:	ff c3                	inc    ebx
   14087e479:	48 83 c7 0c          	add    rdi,0xc
   14087e47d:	48 83 ee 01          	sub    rsi,0x1
   14087e481:	75 bd                	jne    0x14087e440
   14087e483:	41 ff c6             	inc    r14d
   14087e486:	49 83 c7 04          	add    r15,0x4
   14087e48a:	49 83 ec 01          	sub    r12,0x1
   14087e48e:	75 a0                	jne    0x14087e430
   14087e490:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087e495:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087e49a:	45 8b f5             	mov    r14d,r13d
   14087e49d:	4c 8d 3d b4 4a dd 01 	lea    r15,[rip+0x1dd4ab4]        # 0x142652f58
   14087e4a4:	4c 8d 2d 45 bf dc 01 	lea    r13,[rip+0x1dcbf45]        # 0x14264a3f0
   14087e4ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087e4b0:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087e4b5:	49 8b ff             	mov    rdi,r15
   14087e4b8:	be 04 00 00 00       	mov    esi,0x4
   14087e4bd:	0f 1f 00             	nop    DWORD PTR [rax]
   14087e4c0:	44 8b c3             	mov    r8d,ebx
   14087e4c3:	41 8b d6             	mov    edx,r14d
   14087e4c6:	49 8b cd             	mov    rcx,r13
   14087e4c9:	e8 52 cc 83 ff       	call   0x1400bb120
   14087e4ce:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087e4d0:	49 8b cd             	mov    rcx,r13
   14087e4d3:	e8 f8 c5 25 00       	call   0x140adaad0
   14087e4d8:	33 d2                	xor    edx,edx
   14087e4da:	48 8d 0d 8f f2 b4 01 	lea    rcx,[rip+0x1b4f28f]        # 0x1423cd770
   14087e4e1:	e8 aa 3a 7f ff       	call   0x140071f90
   14087e4e6:	84 c0                	test   al,al
   14087e4e8:	74 0d                	je     0x14087e4f7
   14087e4ea:	41 b0 01             	mov    r8b,0x1
   14087e4ed:	33 d2                	xor    edx,edx
   14087e4ef:	49 8b cd             	mov    rcx,r13
   14087e4f2:	e8 99 cc 83 ff       	call   0x1400bb190
   14087e4f7:	ff c3                	inc    ebx
   14087e4f9:	48 83 c7 0c          	add    rdi,0xc
   14087e4fd:	48 83 ee 01          	sub    rsi,0x1
   14087e501:	75 bd                	jne    0x14087e4c0
   14087e503:	41 ff c6             	inc    r14d
   14087e506:	49 83 c7 04          	add    r15,0x4
   14087e50a:	48 8d 05 53 4a dd 01 	lea    rax,[rip+0x1dd4a53]        # 0x142652f64
   14087e511:	4c 3b f8             	cmp    r15,rax
   14087e514:	7c 9a                	jl     0x14087e4b0
   14087e516:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087e51b:	45 8d 44 24 0a       	lea    r8d,[r12+0xa]
   14087e520:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087e525:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087e529:	48 8d 3d c0 be dc 01 	lea    rdi,[rip+0x1dcbec0]        # 0x14264a3f0
   14087e530:	48 8b cf             	mov    rcx,rdi
   14087e533:	e8 e8 cb 83 ff       	call   0x1400bb120
   14087e538:	48 8d 15 a1 58 e3 00 	lea    rdx,[rip+0xe358a1]        # 0x1416b3de0
   14087e53f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087e543:	e8 08 9c 7e ff       	call   0x140068150
   14087e548:	90                   	nop
   14087e549:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087e54d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087e551:	e8 ba b7 83 ff       	call   0x1400b9d10
   14087e556:	45 33 c9             	xor    r9d,r9d
   14087e559:	45 33 c0             	xor    r8d,r8d
   14087e55c:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087e560:	48 8b cf             	mov    rcx,rdi
   14087e563:	e8 f8 b3 25 00       	call   0x140ad9960
   14087e568:	90                   	nop
   14087e569:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087e56d:	e9 fa 19 00 00       	jmp    0x14087ff6c
   14087e572:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087e576:	e8 15 11 7f ff       	call   0x14006f690
   14087e57b:	90                   	nop
   14087e57c:	83 ff 0d             	cmp    edi,0xd
   14087e57f:	0f 87 c7 19 00 00    	ja     0x14087ff4c
   14087e585:	48 8d 15 74 1a 78 ff 	lea    rdx,[rip+0xffffffffff781a74]        # 0x140000000
   14087e58c:	8b 8c ba e0 00 88 00 	mov    ecx,DWORD PTR [rdx+rdi*4+0x8800e0]
   14087e593:	48 03 ca             	add    rcx,rdx
   14087e596:	ff e1                	jmp    rcx
   14087e598:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087e59c:	83 fa ff             	cmp    edx,0xffffffff
   14087e59f:	0f 84 ce 00 00 00    	je     0x14087e673
   14087e5a5:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087e5a9:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087e5ad:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087e5b2:	45 8b c4             	mov    r8d,r12d
   14087e5b5:	48 8b cb             	mov    rcx,rbx
   14087e5b8:	e8 f3 5e 02 00       	call   0x1408a44b0
   14087e5bd:	4c 8d 2d 2c be dc 01 	lea    r13,[rip+0x1dcbe2c]        # 0x14264a3f0
   14087e5c4:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087e5c9:	4c 8d 3d e8 49 dd 01 	lea    r15,[rip+0x1dd49e8]        # 0x142652fb8
   14087e5d0:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087e5d5:	49 8b ff             	mov    rdi,r15
   14087e5d8:	be 04 00 00 00       	mov    esi,0x4
   14087e5dd:	0f 1f 00             	nop    DWORD PTR [rax]
   14087e5e0:	44 8b c3             	mov    r8d,ebx
   14087e5e3:	41 8b d6             	mov    edx,r14d
   14087e5e6:	49 8b cd             	mov    rcx,r13
   14087e5e9:	e8 32 cb 83 ff       	call   0x1400bb120
   14087e5ee:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087e5f0:	49 8b cd             	mov    rcx,r13
   14087e5f3:	e8 d8 c4 25 00       	call   0x140adaad0
   14087e5f8:	33 d2                	xor    edx,edx
   14087e5fa:	48 8d 0d 6f f1 b4 01 	lea    rcx,[rip+0x1b4f16f]        # 0x1423cd770
   14087e601:	e8 8a 39 7f ff       	call   0x140071f90
   14087e606:	84 c0                	test   al,al
   14087e608:	74 0d                	je     0x14087e617
   14087e60a:	41 b0 01             	mov    r8b,0x1
   14087e60d:	33 d2                	xor    edx,edx
   14087e60f:	49 8b cd             	mov    rcx,r13
   14087e612:	e8 79 cb 83 ff       	call   0x1400bb190
   14087e617:	ff c3                	inc    ebx
   14087e619:	48 83 c7 0c          	add    rdi,0xc
   14087e61d:	48 83 ee 01          	sub    rsi,0x1
   14087e621:	75 bd                	jne    0x14087e5e0
   14087e623:	41 ff c6             	inc    r14d
   14087e626:	49 83 c7 04          	add    r15,0x4
   14087e62a:	48 8d 05 93 49 dd 01 	lea    rax,[rip+0x1dd4993]        # 0x142652fc4
   14087e631:	4c 3b f8             	cmp    r15,rax
   14087e634:	7c 9a                	jl     0x14087e5d0
   14087e636:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087e63b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087e640:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087e644:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087e648:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087e64b:	83 fa ff             	cmp    edx,0xffffffff
   14087e64e:	0f 84 d6 00 00 00    	je     0x14087e72a
   14087e654:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087e658:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087e65c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087e661:	45 8b c5             	mov    r8d,r13d
   14087e664:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087e669:	e8 42 5e 02 00       	call   0x1408a44b0
   14087e66e:	e9 66 01 00 00       	jmp    0x14087e7d9
   14087e673:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087e677:	48 8b 0d 92 6a b6 01 	mov    rcx,QWORD PTR [rip+0x1b66a92]        # 0x1423e5110
   14087e67e:	e8 dd f1 9e ff       	call   0x14026d860
   14087e683:	83 f8 ff             	cmp    eax,0xffffffff
   14087e686:	0f 84 31 ff ff ff    	je     0x14087e5bd
   14087e68c:	48 98                	cdqe
   14087e68e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087e693:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087e697:	49 c1 e7 04          	shl    r15,0x4
   14087e69b:	48 8d 05 a6 dd dc 01 	lea    rax,[rip+0x1dcdda6]        # 0x14264c448
   14087e6a2:	4c 03 f8             	add    r15,rax
   14087e6a5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087e6ab:	4c 8d 2d 3e bd dc 01 	lea    r13,[rip+0x1dcbd3e]        # 0x14264a3f0
   14087e6b2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087e6b6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087e6c0:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087e6c4:	49 8b ff             	mov    rdi,r15
   14087e6c7:	be 04 00 00 00       	mov    esi,0x4
   14087e6cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087e6d0:	44 8b c3             	mov    r8d,ebx
   14087e6d3:	41 8b d6             	mov    edx,r14d
   14087e6d6:	49 8b cd             	mov    rcx,r13
   14087e6d9:	e8 42 ca 83 ff       	call   0x1400bb120
   14087e6de:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087e6e0:	49 8b cd             	mov    rcx,r13
   14087e6e3:	e8 e8 c3 25 00       	call   0x140adaad0
   14087e6e8:	33 d2                	xor    edx,edx
   14087e6ea:	48 8d 0d 7f f0 b4 01 	lea    rcx,[rip+0x1b4f07f]        # 0x1423cd770
   14087e6f1:	e8 9a 38 7f ff       	call   0x140071f90
   14087e6f6:	84 c0                	test   al,al
   14087e6f8:	74 0d                	je     0x14087e707
   14087e6fa:	41 b0 01             	mov    r8b,0x1
   14087e6fd:	33 d2                	xor    edx,edx
   14087e6ff:	49 8b cd             	mov    rcx,r13
   14087e702:	e8 89 ca 83 ff       	call   0x1400bb190
   14087e707:	ff c3                	inc    ebx
   14087e709:	48 83 c7 0c          	add    rdi,0xc
   14087e70d:	48 83 ee 01          	sub    rsi,0x1
   14087e711:	75 bd                	jne    0x14087e6d0
   14087e713:	41 ff c6             	inc    r14d
   14087e716:	49 83 c7 04          	add    r15,0x4
   14087e71a:	49 83 ec 01          	sub    r12,0x1
   14087e71e:	75 a0                	jne    0x14087e6c0
   14087e720:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087e725:	e9 9a fe ff ff       	jmp    0x14087e5c4
   14087e72a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087e72d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087e732:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087e736:	e8 25 f1 9e ff       	call   0x14026d860
   14087e73b:	83 f8 ff             	cmp    eax,0xffffffff
   14087e73e:	0f 84 95 00 00 00    	je     0x14087e7d9
   14087e744:	48 98                	cdqe
   14087e746:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087e74b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087e74f:	49 c1 e7 04          	shl    r15,0x4
   14087e753:	48 8d 05 ee dc dc 01 	lea    rax,[rip+0x1dcdcee]        # 0x14264c448
   14087e75a:	4c 03 f8             	add    r15,rax
   14087e75d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087e763:	41 8b dd             	mov    ebx,r13d
   14087e766:	49 8b ff             	mov    rdi,r15
   14087e769:	be 04 00 00 00       	mov    esi,0x4
   14087e76e:	4c 8d 2d 7b bc dc 01 	lea    r13,[rip+0x1dcbc7b]        # 0x14264a3f0
   14087e775:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087e780:	44 8b c3             	mov    r8d,ebx
   14087e783:	41 8b d6             	mov    edx,r14d
   14087e786:	49 8b cd             	mov    rcx,r13
   14087e789:	e8 92 c9 83 ff       	call   0x1400bb120
   14087e78e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087e790:	49 8b cd             	mov    rcx,r13
   14087e793:	e8 38 c3 25 00       	call   0x140adaad0
   14087e798:	33 d2                	xor    edx,edx
   14087e79a:	48 8d 0d cf ef b4 01 	lea    rcx,[rip+0x1b4efcf]        # 0x1423cd770
   14087e7a1:	e8 ea 37 7f ff       	call   0x140071f90
   14087e7a6:	84 c0                	test   al,al
   14087e7a8:	74 0d                	je     0x14087e7b7
   14087e7aa:	41 b0 01             	mov    r8b,0x1
   14087e7ad:	33 d2                	xor    edx,edx
   14087e7af:	49 8b cd             	mov    rcx,r13
   14087e7b2:	e8 d9 c9 83 ff       	call   0x1400bb190
   14087e7b7:	ff c3                	inc    ebx
   14087e7b9:	48 83 c7 0c          	add    rdi,0xc
   14087e7bd:	48 83 ee 01          	sub    rsi,0x1
   14087e7c1:	75 bd                	jne    0x14087e780
   14087e7c3:	41 ff c6             	inc    r14d
   14087e7c6:	49 83 c7 04          	add    r15,0x4
   14087e7ca:	49 83 ec 01          	sub    r12,0x1
   14087e7ce:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087e7d2:	75 8f                	jne    0x14087e763
   14087e7d4:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087e7d9:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087e7de:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087e7e3:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087e7e7:	48 8d 0d 02 bc dc 01 	lea    rcx,[rip+0x1dcbc02]        # 0x14264a3f0
   14087e7ee:	e8 2d c9 83 ff       	call   0x1400bb120
   14087e7f3:	48 8d 15 12 56 e3 00 	lea    rdx,[rip+0xe35612]        # 0x1416b3e0c
   14087e7fa:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087e7fe:	e8 7d 0d 7f ff       	call   0x14006f580
   14087e803:	44 0f b7 45 88       	movzx  r8d,WORD PTR [rbp-0x78]
   14087e808:	45 33 c9             	xor    r9d,r9d
   14087e80b:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087e812:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087e816:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087e81b:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087e81f:	e8 ac 5d ab 00       	call   0x1413345d0
   14087e824:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087e828:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087e82c:	e8 df b4 83 ff       	call   0x1400b9d10
   14087e831:	48 8d 15 a8 fd d6 00 	lea    rdx,[rip+0xd6fda8]        # 0x1415ee5e0
   14087e838:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087e83c:	e8 1f 0d 7f ff       	call   0x14006f560
   14087e841:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087e845:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087e849:	e8 c2 b4 83 ff       	call   0x1400b9d10
   14087e84e:	e9 fe 16 00 00       	jmp    0x14087ff51
   14087e853:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087e857:	83 fa ff             	cmp    edx,0xffffffff
   14087e85a:	0f 84 d3 00 00 00    	je     0x14087e933
   14087e860:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087e864:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087e868:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087e86d:	45 8b c4             	mov    r8d,r12d
   14087e870:	48 8b cb             	mov    rcx,rbx
   14087e873:	e8 38 5c 02 00       	call   0x1408a44b0
   14087e878:	4c 8d 2d 71 bb dc 01 	lea    r13,[rip+0x1dcbb71]        # 0x14264a3f0
   14087e87f:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087e884:	4c 8d 3d 5d 47 dd 01 	lea    r15,[rip+0x1dd475d]        # 0x142652fe8
   14087e88b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087e890:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087e895:	49 8b ff             	mov    rdi,r15
   14087e898:	be 04 00 00 00       	mov    esi,0x4
   14087e89d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087e8a0:	44 8b c3             	mov    r8d,ebx
   14087e8a3:	41 8b d6             	mov    edx,r14d
   14087e8a6:	49 8b cd             	mov    rcx,r13
   14087e8a9:	e8 72 c8 83 ff       	call   0x1400bb120
   14087e8ae:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087e8b0:	49 8b cd             	mov    rcx,r13
   14087e8b3:	e8 18 c2 25 00       	call   0x140adaad0
   14087e8b8:	33 d2                	xor    edx,edx
   14087e8ba:	48 8d 0d af ee b4 01 	lea    rcx,[rip+0x1b4eeaf]        # 0x1423cd770
   14087e8c1:	e8 ca 36 7f ff       	call   0x140071f90
   14087e8c6:	84 c0                	test   al,al
   14087e8c8:	74 0d                	je     0x14087e8d7
   14087e8ca:	41 b0 01             	mov    r8b,0x1
   14087e8cd:	33 d2                	xor    edx,edx
   14087e8cf:	49 8b cd             	mov    rcx,r13
   14087e8d2:	e8 b9 c8 83 ff       	call   0x1400bb190
   14087e8d7:	ff c3                	inc    ebx
   14087e8d9:	48 83 c7 0c          	add    rdi,0xc
   14087e8dd:	48 83 ee 01          	sub    rsi,0x1
   14087e8e1:	75 bd                	jne    0x14087e8a0
   14087e8e3:	41 ff c6             	inc    r14d
   14087e8e6:	49 83 c7 04          	add    r15,0x4
   14087e8ea:	48 8d 05 03 47 dd 01 	lea    rax,[rip+0x1dd4703]        # 0x142652ff4
   14087e8f1:	4c 3b f8             	cmp    r15,rax
   14087e8f4:	7c 9a                	jl     0x14087e890
   14087e8f6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087e8fb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087e900:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087e904:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087e908:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087e90b:	83 fa ff             	cmp    edx,0xffffffff
   14087e90e:	0f 84 d6 00 00 00    	je     0x14087e9ea
   14087e914:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087e918:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087e91c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087e921:	45 8b c5             	mov    r8d,r13d
   14087e924:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087e929:	e8 82 5b 02 00       	call   0x1408a44b0
   14087e92e:	e9 66 01 00 00       	jmp    0x14087ea99
   14087e933:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087e937:	48 8b 0d d2 67 b6 01 	mov    rcx,QWORD PTR [rip+0x1b667d2]        # 0x1423e5110
   14087e93e:	e8 1d ef 9e ff       	call   0x14026d860
   14087e943:	83 f8 ff             	cmp    eax,0xffffffff
   14087e946:	0f 84 2c ff ff ff    	je     0x14087e878
   14087e94c:	48 98                	cdqe
   14087e94e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087e953:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087e957:	49 c1 e7 04          	shl    r15,0x4
   14087e95b:	48 8d 05 e6 da dc 01 	lea    rax,[rip+0x1dcdae6]        # 0x14264c448
   14087e962:	4c 03 f8             	add    r15,rax
   14087e965:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087e96b:	4c 8d 2d 7e ba dc 01 	lea    r13,[rip+0x1dcba7e]        # 0x14264a3f0
   14087e972:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087e976:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087e980:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087e984:	49 8b ff             	mov    rdi,r15
   14087e987:	be 04 00 00 00       	mov    esi,0x4
   14087e98c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087e990:	44 8b c3             	mov    r8d,ebx
   14087e993:	41 8b d6             	mov    edx,r14d
   14087e996:	49 8b cd             	mov    rcx,r13
   14087e999:	e8 82 c7 83 ff       	call   0x1400bb120
   14087e99e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087e9a0:	49 8b cd             	mov    rcx,r13
   14087e9a3:	e8 28 c1 25 00       	call   0x140adaad0
   14087e9a8:	33 d2                	xor    edx,edx
   14087e9aa:	48 8d 0d bf ed b4 01 	lea    rcx,[rip+0x1b4edbf]        # 0x1423cd770
   14087e9b1:	e8 da 35 7f ff       	call   0x140071f90
   14087e9b6:	84 c0                	test   al,al
   14087e9b8:	74 0d                	je     0x14087e9c7
   14087e9ba:	41 b0 01             	mov    r8b,0x1
   14087e9bd:	33 d2                	xor    edx,edx
   14087e9bf:	49 8b cd             	mov    rcx,r13
   14087e9c2:	e8 c9 c7 83 ff       	call   0x1400bb190
   14087e9c7:	ff c3                	inc    ebx
   14087e9c9:	48 83 c7 0c          	add    rdi,0xc
   14087e9cd:	48 83 ee 01          	sub    rsi,0x1
   14087e9d1:	75 bd                	jne    0x14087e990
   14087e9d3:	41 ff c6             	inc    r14d
   14087e9d6:	49 83 c7 04          	add    r15,0x4
   14087e9da:	49 83 ec 01          	sub    r12,0x1
   14087e9de:	75 a0                	jne    0x14087e980
   14087e9e0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087e9e5:	e9 95 fe ff ff       	jmp    0x14087e87f
   14087e9ea:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087e9ed:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087e9f2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087e9f6:	e8 65 ee 9e ff       	call   0x14026d860
   14087e9fb:	83 f8 ff             	cmp    eax,0xffffffff
   14087e9fe:	0f 84 95 00 00 00    	je     0x14087ea99
   14087ea04:	48 98                	cdqe
   14087ea06:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087ea0b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087ea0f:	49 c1 e7 04          	shl    r15,0x4
   14087ea13:	48 8d 05 2e da dc 01 	lea    rax,[rip+0x1dcda2e]        # 0x14264c448
   14087ea1a:	4c 03 f8             	add    r15,rax
   14087ea1d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087ea23:	41 8b dd             	mov    ebx,r13d
   14087ea26:	49 8b ff             	mov    rdi,r15
   14087ea29:	be 04 00 00 00       	mov    esi,0x4
   14087ea2e:	4c 8d 2d bb b9 dc 01 	lea    r13,[rip+0x1dcb9bb]        # 0x14264a3f0
   14087ea35:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087ea40:	44 8b c3             	mov    r8d,ebx
   14087ea43:	41 8b d6             	mov    edx,r14d
   14087ea46:	49 8b cd             	mov    rcx,r13
   14087ea49:	e8 d2 c6 83 ff       	call   0x1400bb120
   14087ea4e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ea50:	49 8b cd             	mov    rcx,r13
   14087ea53:	e8 78 c0 25 00       	call   0x140adaad0
   14087ea58:	33 d2                	xor    edx,edx
   14087ea5a:	48 8d 0d 0f ed b4 01 	lea    rcx,[rip+0x1b4ed0f]        # 0x1423cd770
   14087ea61:	e8 2a 35 7f ff       	call   0x140071f90
   14087ea66:	84 c0                	test   al,al
   14087ea68:	74 0d                	je     0x14087ea77
   14087ea6a:	41 b0 01             	mov    r8b,0x1
   14087ea6d:	33 d2                	xor    edx,edx
   14087ea6f:	49 8b cd             	mov    rcx,r13
   14087ea72:	e8 19 c7 83 ff       	call   0x1400bb190
   14087ea77:	ff c3                	inc    ebx
   14087ea79:	48 83 c7 0c          	add    rdi,0xc
   14087ea7d:	48 83 ee 01          	sub    rsi,0x1
   14087ea81:	75 bd                	jne    0x14087ea40
   14087ea83:	41 ff c6             	inc    r14d
   14087ea86:	49 83 c7 04          	add    r15,0x4
   14087ea8a:	49 83 ec 01          	sub    r12,0x1
   14087ea8e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087ea92:	75 8f                	jne    0x14087ea23
   14087ea94:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087ea99:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087ea9e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087eaa3:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087eaa7:	48 8d 0d 42 b9 dc 01 	lea    rcx,[rip+0x1dcb942]        # 0x14264a3f0
   14087eaae:	e8 6d c6 83 ff       	call   0x1400bb120
   14087eab3:	48 8d 15 4a 53 e3 00 	lea    rdx,[rip+0xe3534a]        # 0x1416b3e04
   14087eaba:	e9 3b fd ff ff       	jmp    0x14087e7fa
   14087eabf:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087eac3:	83 fa ff             	cmp    edx,0xffffffff
   14087eac6:	0f 84 d7 00 00 00    	je     0x14087eba3
   14087eacc:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087ead0:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087ead4:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087ead9:	45 8b c4             	mov    r8d,r12d
   14087eadc:	48 8b cb             	mov    rcx,rbx
   14087eadf:	e8 cc 59 02 00       	call   0x1408a44b0
   14087eae4:	4c 8d 2d 05 b9 dc 01 	lea    r13,[rip+0x1dcb905]        # 0x14264a3f0
   14087eaeb:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087eaf0:	4c 8d 3d 21 45 dd 01 	lea    r15,[rip+0x1dd4521]        # 0x142653018
   14087eaf7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087eb00:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087eb05:	49 8b ff             	mov    rdi,r15
   14087eb08:	be 04 00 00 00       	mov    esi,0x4
   14087eb0d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087eb10:	44 8b c3             	mov    r8d,ebx
   14087eb13:	41 8b d6             	mov    edx,r14d
   14087eb16:	49 8b cd             	mov    rcx,r13
   14087eb19:	e8 02 c6 83 ff       	call   0x1400bb120
   14087eb1e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087eb20:	49 8b cd             	mov    rcx,r13
   14087eb23:	e8 a8 bf 25 00       	call   0x140adaad0
   14087eb28:	33 d2                	xor    edx,edx
   14087eb2a:	48 8d 0d 3f ec b4 01 	lea    rcx,[rip+0x1b4ec3f]        # 0x1423cd770
   14087eb31:	e8 5a 34 7f ff       	call   0x140071f90
   14087eb36:	84 c0                	test   al,al
   14087eb38:	74 0d                	je     0x14087eb47
   14087eb3a:	41 b0 01             	mov    r8b,0x1
   14087eb3d:	33 d2                	xor    edx,edx
   14087eb3f:	49 8b cd             	mov    rcx,r13
   14087eb42:	e8 49 c6 83 ff       	call   0x1400bb190
   14087eb47:	ff c3                	inc    ebx
   14087eb49:	48 83 c7 0c          	add    rdi,0xc
   14087eb4d:	48 83 ee 01          	sub    rsi,0x1
   14087eb51:	75 bd                	jne    0x14087eb10
   14087eb53:	41 ff c6             	inc    r14d
   14087eb56:	49 83 c7 04          	add    r15,0x4
   14087eb5a:	48 8d 05 c3 44 dd 01 	lea    rax,[rip+0x1dd44c3]        # 0x142653024
   14087eb61:	4c 3b f8             	cmp    r15,rax
   14087eb64:	7c 9a                	jl     0x14087eb00
   14087eb66:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087eb6b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087eb70:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087eb74:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087eb78:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087eb7b:	83 fa ff             	cmp    edx,0xffffffff
   14087eb7e:	0f 84 d6 00 00 00    	je     0x14087ec5a
   14087eb84:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087eb88:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087eb8c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087eb91:	45 8b c5             	mov    r8d,r13d
   14087eb94:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087eb99:	e8 12 59 02 00       	call   0x1408a44b0
   14087eb9e:	e9 66 01 00 00       	jmp    0x14087ed09
   14087eba3:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087eba7:	48 8b 0d 62 65 b6 01 	mov    rcx,QWORD PTR [rip+0x1b66562]        # 0x1423e5110
   14087ebae:	e8 ad ec 9e ff       	call   0x14026d860
   14087ebb3:	83 f8 ff             	cmp    eax,0xffffffff
   14087ebb6:	0f 84 28 ff ff ff    	je     0x14087eae4
   14087ebbc:	48 98                	cdqe
   14087ebbe:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087ebc3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087ebc7:	49 c1 e7 04          	shl    r15,0x4
   14087ebcb:	48 8d 05 76 d8 dc 01 	lea    rax,[rip+0x1dcd876]        # 0x14264c448
   14087ebd2:	4c 03 f8             	add    r15,rax
   14087ebd5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087ebdb:	4c 8d 2d 0e b8 dc 01 	lea    r13,[rip+0x1dcb80e]        # 0x14264a3f0
   14087ebe2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087ebe6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087ebf0:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087ebf4:	49 8b ff             	mov    rdi,r15
   14087ebf7:	be 04 00 00 00       	mov    esi,0x4
   14087ebfc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087ec00:	44 8b c3             	mov    r8d,ebx
   14087ec03:	41 8b d6             	mov    edx,r14d
   14087ec06:	49 8b cd             	mov    rcx,r13
   14087ec09:	e8 12 c5 83 ff       	call   0x1400bb120
   14087ec0e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ec10:	49 8b cd             	mov    rcx,r13
   14087ec13:	e8 b8 be 25 00       	call   0x140adaad0
   14087ec18:	33 d2                	xor    edx,edx
   14087ec1a:	48 8d 0d 4f eb b4 01 	lea    rcx,[rip+0x1b4eb4f]        # 0x1423cd770
   14087ec21:	e8 6a 33 7f ff       	call   0x140071f90
   14087ec26:	84 c0                	test   al,al
   14087ec28:	74 0d                	je     0x14087ec37
   14087ec2a:	41 b0 01             	mov    r8b,0x1
   14087ec2d:	33 d2                	xor    edx,edx
   14087ec2f:	49 8b cd             	mov    rcx,r13
   14087ec32:	e8 59 c5 83 ff       	call   0x1400bb190
   14087ec37:	ff c3                	inc    ebx
   14087ec39:	48 83 c7 0c          	add    rdi,0xc
   14087ec3d:	48 83 ee 01          	sub    rsi,0x1
   14087ec41:	75 bd                	jne    0x14087ec00
   14087ec43:	41 ff c6             	inc    r14d
   14087ec46:	49 83 c7 04          	add    r15,0x4
   14087ec4a:	49 83 ec 01          	sub    r12,0x1
   14087ec4e:	75 a0                	jne    0x14087ebf0
   14087ec50:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087ec55:	e9 91 fe ff ff       	jmp    0x14087eaeb
   14087ec5a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087ec5d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087ec62:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087ec66:	e8 f5 eb 9e ff       	call   0x14026d860
   14087ec6b:	83 f8 ff             	cmp    eax,0xffffffff
   14087ec6e:	0f 84 95 00 00 00    	je     0x14087ed09
   14087ec74:	48 98                	cdqe
   14087ec76:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087ec7b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087ec7f:	49 c1 e7 04          	shl    r15,0x4
   14087ec83:	48 8d 05 be d7 dc 01 	lea    rax,[rip+0x1dcd7be]        # 0x14264c448
   14087ec8a:	4c 03 f8             	add    r15,rax
   14087ec8d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087ec93:	41 8b dd             	mov    ebx,r13d
   14087ec96:	49 8b ff             	mov    rdi,r15
   14087ec99:	be 04 00 00 00       	mov    esi,0x4
   14087ec9e:	4c 8d 2d 4b b7 dc 01 	lea    r13,[rip+0x1dcb74b]        # 0x14264a3f0
   14087eca5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087ecb0:	44 8b c3             	mov    r8d,ebx
   14087ecb3:	41 8b d6             	mov    edx,r14d
   14087ecb6:	49 8b cd             	mov    rcx,r13
   14087ecb9:	e8 62 c4 83 ff       	call   0x1400bb120
   14087ecbe:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ecc0:	49 8b cd             	mov    rcx,r13
   14087ecc3:	e8 08 be 25 00       	call   0x140adaad0
   14087ecc8:	33 d2                	xor    edx,edx
   14087ecca:	48 8d 0d 9f ea b4 01 	lea    rcx,[rip+0x1b4ea9f]        # 0x1423cd770
   14087ecd1:	e8 ba 32 7f ff       	call   0x140071f90
   14087ecd6:	84 c0                	test   al,al
   14087ecd8:	74 0d                	je     0x14087ece7
   14087ecda:	41 b0 01             	mov    r8b,0x1
   14087ecdd:	33 d2                	xor    edx,edx
   14087ecdf:	49 8b cd             	mov    rcx,r13
   14087ece2:	e8 a9 c4 83 ff       	call   0x1400bb190
   14087ece7:	ff c3                	inc    ebx
   14087ece9:	48 83 c7 0c          	add    rdi,0xc
   14087eced:	48 83 ee 01          	sub    rsi,0x1
   14087ecf1:	75 bd                	jne    0x14087ecb0
   14087ecf3:	41 ff c6             	inc    r14d
   14087ecf6:	49 83 c7 04          	add    r15,0x4
   14087ecfa:	49 83 ec 01          	sub    r12,0x1
   14087ecfe:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087ed02:	75 8f                	jne    0x14087ec93
   14087ed04:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087ed09:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087ed0e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087ed13:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087ed17:	48 8d 0d d2 b6 dc 01 	lea    rcx,[rip+0x1dcb6d2]        # 0x14264a3f0
   14087ed1e:	e8 fd c3 83 ff       	call   0x1400bb120
   14087ed23:	48 8d 15 96 50 e3 00 	lea    rdx,[rip+0xe35096]        # 0x1416b3dc0
   14087ed2a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087ed2e:	e8 4d 08 7f ff       	call   0x14006f580
   14087ed33:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087ed37:	e9 ec fa ff ff       	jmp    0x14087e828
   14087ed3c:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087ed40:	83 fa ff             	cmp    edx,0xffffffff
   14087ed43:	0f 84 da 00 00 00    	je     0x14087ee23
   14087ed49:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087ed4d:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087ed51:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087ed56:	45 8b c4             	mov    r8d,r12d
   14087ed59:	48 8b cb             	mov    rcx,rbx
   14087ed5c:	e8 4f 57 02 00       	call   0x1408a44b0
   14087ed61:	4c 8d 2d 88 b6 dc 01 	lea    r13,[rip+0x1dcb688]        # 0x14264a3f0
   14087ed68:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087ed6d:	4c 8d 3d d4 42 dd 01 	lea    r15,[rip+0x1dd42d4]        # 0x142653048
   14087ed74:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087ed78:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14087ed80:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087ed85:	49 8b ff             	mov    rdi,r15
   14087ed88:	be 04 00 00 00       	mov    esi,0x4
   14087ed8d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087ed90:	44 8b c3             	mov    r8d,ebx
   14087ed93:	41 8b d6             	mov    edx,r14d
   14087ed96:	49 8b cd             	mov    rcx,r13
   14087ed99:	e8 82 c3 83 ff       	call   0x1400bb120
   14087ed9e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087eda0:	49 8b cd             	mov    rcx,r13
   14087eda3:	e8 28 bd 25 00       	call   0x140adaad0
   14087eda8:	33 d2                	xor    edx,edx
   14087edaa:	48 8d 0d bf e9 b4 01 	lea    rcx,[rip+0x1b4e9bf]        # 0x1423cd770
   14087edb1:	e8 da 31 7f ff       	call   0x140071f90
   14087edb6:	84 c0                	test   al,al
   14087edb8:	74 0d                	je     0x14087edc7
   14087edba:	41 b0 01             	mov    r8b,0x1
   14087edbd:	33 d2                	xor    edx,edx
   14087edbf:	49 8b cd             	mov    rcx,r13
   14087edc2:	e8 c9 c3 83 ff       	call   0x1400bb190
   14087edc7:	ff c3                	inc    ebx
   14087edc9:	48 83 c7 0c          	add    rdi,0xc
   14087edcd:	48 83 ee 01          	sub    rsi,0x1
   14087edd1:	75 bd                	jne    0x14087ed90
   14087edd3:	41 ff c6             	inc    r14d
   14087edd6:	49 83 c7 04          	add    r15,0x4
   14087edda:	48 8d 05 73 42 dd 01 	lea    rax,[rip+0x1dd4273]        # 0x142653054
   14087ede1:	4c 3b f8             	cmp    r15,rax
   14087ede4:	7c 9a                	jl     0x14087ed80
   14087ede6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087edeb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087edf0:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087edf4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087edf8:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087edfb:	83 fa ff             	cmp    edx,0xffffffff
   14087edfe:	0f 84 d6 00 00 00    	je     0x14087eeda
   14087ee04:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087ee08:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087ee0c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087ee11:	45 8b c5             	mov    r8d,r13d
   14087ee14:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087ee19:	e8 92 56 02 00       	call   0x1408a44b0
   14087ee1e:	e9 66 01 00 00       	jmp    0x14087ef89
   14087ee23:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087ee27:	48 8b 0d e2 62 b6 01 	mov    rcx,QWORD PTR [rip+0x1b662e2]        # 0x1423e5110
   14087ee2e:	e8 2d ea 9e ff       	call   0x14026d860
   14087ee33:	83 f8 ff             	cmp    eax,0xffffffff
   14087ee36:	0f 84 25 ff ff ff    	je     0x14087ed61
   14087ee3c:	48 98                	cdqe
   14087ee3e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087ee43:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087ee47:	49 c1 e7 04          	shl    r15,0x4
   14087ee4b:	48 8d 05 f6 d5 dc 01 	lea    rax,[rip+0x1dcd5f6]        # 0x14264c448
   14087ee52:	4c 03 f8             	add    r15,rax
   14087ee55:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087ee5b:	4c 8d 2d 8e b5 dc 01 	lea    r13,[rip+0x1dcb58e]        # 0x14264a3f0
   14087ee62:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087ee66:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087ee70:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087ee74:	49 8b ff             	mov    rdi,r15
   14087ee77:	be 04 00 00 00       	mov    esi,0x4
   14087ee7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087ee80:	44 8b c3             	mov    r8d,ebx
   14087ee83:	41 8b d6             	mov    edx,r14d
   14087ee86:	49 8b cd             	mov    rcx,r13
   14087ee89:	e8 92 c2 83 ff       	call   0x1400bb120
   14087ee8e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ee90:	49 8b cd             	mov    rcx,r13
   14087ee93:	e8 38 bc 25 00       	call   0x140adaad0
   14087ee98:	33 d2                	xor    edx,edx
   14087ee9a:	48 8d 0d cf e8 b4 01 	lea    rcx,[rip+0x1b4e8cf]        # 0x1423cd770
   14087eea1:	e8 ea 30 7f ff       	call   0x140071f90
   14087eea6:	84 c0                	test   al,al
   14087eea8:	74 0d                	je     0x14087eeb7
   14087eeaa:	41 b0 01             	mov    r8b,0x1
   14087eead:	33 d2                	xor    edx,edx
   14087eeaf:	49 8b cd             	mov    rcx,r13
   14087eeb2:	e8 d9 c2 83 ff       	call   0x1400bb190
   14087eeb7:	ff c3                	inc    ebx
   14087eeb9:	48 83 c7 0c          	add    rdi,0xc
   14087eebd:	48 83 ee 01          	sub    rsi,0x1
   14087eec1:	75 bd                	jne    0x14087ee80
   14087eec3:	41 ff c6             	inc    r14d
   14087eec6:	49 83 c7 04          	add    r15,0x4
   14087eeca:	49 83 ec 01          	sub    r12,0x1
   14087eece:	75 a0                	jne    0x14087ee70
   14087eed0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087eed5:	e9 8e fe ff ff       	jmp    0x14087ed68
   14087eeda:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087eedd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087eee2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087eee6:	e8 75 e9 9e ff       	call   0x14026d860
   14087eeeb:	83 f8 ff             	cmp    eax,0xffffffff
   14087eeee:	0f 84 95 00 00 00    	je     0x14087ef89
   14087eef4:	48 98                	cdqe
   14087eef6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087eefb:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087eeff:	49 c1 e7 04          	shl    r15,0x4
   14087ef03:	48 8d 05 3e d5 dc 01 	lea    rax,[rip+0x1dcd53e]        # 0x14264c448
   14087ef0a:	4c 03 f8             	add    r15,rax
   14087ef0d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087ef13:	41 8b dd             	mov    ebx,r13d
   14087ef16:	49 8b ff             	mov    rdi,r15
   14087ef19:	be 04 00 00 00       	mov    esi,0x4
   14087ef1e:	4c 8d 2d cb b4 dc 01 	lea    r13,[rip+0x1dcb4cb]        # 0x14264a3f0
   14087ef25:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087ef30:	44 8b c3             	mov    r8d,ebx
   14087ef33:	41 8b d6             	mov    edx,r14d
   14087ef36:	49 8b cd             	mov    rcx,r13
   14087ef39:	e8 e2 c1 83 ff       	call   0x1400bb120
   14087ef3e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ef40:	49 8b cd             	mov    rcx,r13
   14087ef43:	e8 88 bb 25 00       	call   0x140adaad0
   14087ef48:	33 d2                	xor    edx,edx
   14087ef4a:	48 8d 0d 1f e8 b4 01 	lea    rcx,[rip+0x1b4e81f]        # 0x1423cd770
   14087ef51:	e8 3a 30 7f ff       	call   0x140071f90
   14087ef56:	84 c0                	test   al,al
   14087ef58:	74 0d                	je     0x14087ef67
   14087ef5a:	41 b0 01             	mov    r8b,0x1
   14087ef5d:	33 d2                	xor    edx,edx
   14087ef5f:	49 8b cd             	mov    rcx,r13
   14087ef62:	e8 29 c2 83 ff       	call   0x1400bb190
   14087ef67:	ff c3                	inc    ebx
   14087ef69:	48 83 c7 0c          	add    rdi,0xc
   14087ef6d:	48 83 ee 01          	sub    rsi,0x1
   14087ef71:	75 bd                	jne    0x14087ef30
   14087ef73:	41 ff c6             	inc    r14d
   14087ef76:	49 83 c7 04          	add    r15,0x4
   14087ef7a:	49 83 ec 01          	sub    r12,0x1
   14087ef7e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087ef82:	75 8f                	jne    0x14087ef13
   14087ef84:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087ef89:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087ef8e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087ef93:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087ef97:	48 8d 0d 52 b4 dc 01 	lea    rcx,[rip+0x1dcb452]        # 0x14264a3f0
   14087ef9e:	e8 7d c1 83 ff       	call   0x1400bb120
   14087efa3:	48 8d 15 06 4e e3 00 	lea    rdx,[rip+0xe34e06]        # 0x1416b3db0
   14087efaa:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087efae:	e8 cd 05 7f ff       	call   0x14006f580
   14087efb3:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087efb7:	e9 6c f8 ff ff       	jmp    0x14087e828
   14087efbc:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087efc0:	83 fa ff             	cmp    edx,0xffffffff
   14087efc3:	0f 84 da 00 00 00    	je     0x14087f0a3
   14087efc9:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087efcd:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087efd1:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087efd6:	45 8b c4             	mov    r8d,r12d
   14087efd9:	48 8b cb             	mov    rcx,rbx
   14087efdc:	e8 cf 54 02 00       	call   0x1408a44b0
   14087efe1:	4c 8d 2d 08 b4 dc 01 	lea    r13,[rip+0x1dcb408]        # 0x14264a3f0
   14087efe8:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087efed:	4c 8d 3d 84 40 dd 01 	lea    r15,[rip+0x1dd4084]        # 0x142653078
   14087eff4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087eff8:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14087f000:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087f005:	49 8b ff             	mov    rdi,r15
   14087f008:	be 04 00 00 00       	mov    esi,0x4
   14087f00d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087f010:	44 8b c3             	mov    r8d,ebx
   14087f013:	41 8b d6             	mov    edx,r14d
   14087f016:	49 8b cd             	mov    rcx,r13
   14087f019:	e8 02 c1 83 ff       	call   0x1400bb120
   14087f01e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f020:	49 8b cd             	mov    rcx,r13
   14087f023:	e8 a8 ba 25 00       	call   0x140adaad0
   14087f028:	33 d2                	xor    edx,edx
   14087f02a:	48 8d 0d 3f e7 b4 01 	lea    rcx,[rip+0x1b4e73f]        # 0x1423cd770
   14087f031:	e8 5a 2f 7f ff       	call   0x140071f90
   14087f036:	84 c0                	test   al,al
   14087f038:	74 0d                	je     0x14087f047
   14087f03a:	41 b0 01             	mov    r8b,0x1
   14087f03d:	33 d2                	xor    edx,edx
   14087f03f:	49 8b cd             	mov    rcx,r13
   14087f042:	e8 49 c1 83 ff       	call   0x1400bb190
   14087f047:	ff c3                	inc    ebx
   14087f049:	48 83 c7 0c          	add    rdi,0xc
   14087f04d:	48 83 ee 01          	sub    rsi,0x1
   14087f051:	75 bd                	jne    0x14087f010
   14087f053:	41 ff c6             	inc    r14d
   14087f056:	49 83 c7 04          	add    r15,0x4
   14087f05a:	48 8d 05 23 40 dd 01 	lea    rax,[rip+0x1dd4023]        # 0x142653084
   14087f061:	4c 3b f8             	cmp    r15,rax
   14087f064:	7c 9a                	jl     0x14087f000
   14087f066:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f06b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087f070:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087f074:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087f078:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087f07b:	83 fa ff             	cmp    edx,0xffffffff
   14087f07e:	0f 84 d6 00 00 00    	je     0x14087f15a
   14087f084:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087f088:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087f08c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087f091:	45 8b c5             	mov    r8d,r13d
   14087f094:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087f099:	e8 12 54 02 00       	call   0x1408a44b0
   14087f09e:	e9 66 01 00 00       	jmp    0x14087f209
   14087f0a3:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087f0a7:	48 8b 0d 62 60 b6 01 	mov    rcx,QWORD PTR [rip+0x1b66062]        # 0x1423e5110
   14087f0ae:	e8 ad e7 9e ff       	call   0x14026d860
   14087f0b3:	83 f8 ff             	cmp    eax,0xffffffff
   14087f0b6:	0f 84 25 ff ff ff    	je     0x14087efe1
   14087f0bc:	48 98                	cdqe
   14087f0be:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f0c3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087f0c7:	49 c1 e7 04          	shl    r15,0x4
   14087f0cb:	48 8d 05 76 d3 dc 01 	lea    rax,[rip+0x1dcd376]        # 0x14264c448
   14087f0d2:	4c 03 f8             	add    r15,rax
   14087f0d5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087f0db:	4c 8d 2d 0e b3 dc 01 	lea    r13,[rip+0x1dcb30e]        # 0x14264a3f0
   14087f0e2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087f0e6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087f0f0:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087f0f4:	49 8b ff             	mov    rdi,r15
   14087f0f7:	be 04 00 00 00       	mov    esi,0x4
   14087f0fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087f100:	44 8b c3             	mov    r8d,ebx
   14087f103:	41 8b d6             	mov    edx,r14d
   14087f106:	49 8b cd             	mov    rcx,r13
   14087f109:	e8 12 c0 83 ff       	call   0x1400bb120
   14087f10e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f110:	49 8b cd             	mov    rcx,r13
   14087f113:	e8 b8 b9 25 00       	call   0x140adaad0
   14087f118:	33 d2                	xor    edx,edx
   14087f11a:	48 8d 0d 4f e6 b4 01 	lea    rcx,[rip+0x1b4e64f]        # 0x1423cd770
   14087f121:	e8 6a 2e 7f ff       	call   0x140071f90
   14087f126:	84 c0                	test   al,al
   14087f128:	74 0d                	je     0x14087f137
   14087f12a:	41 b0 01             	mov    r8b,0x1
   14087f12d:	33 d2                	xor    edx,edx
   14087f12f:	49 8b cd             	mov    rcx,r13
   14087f132:	e8 59 c0 83 ff       	call   0x1400bb190
   14087f137:	ff c3                	inc    ebx
   14087f139:	48 83 c7 0c          	add    rdi,0xc
   14087f13d:	48 83 ee 01          	sub    rsi,0x1
   14087f141:	75 bd                	jne    0x14087f100
   14087f143:	41 ff c6             	inc    r14d
   14087f146:	49 83 c7 04          	add    r15,0x4
   14087f14a:	49 83 ec 01          	sub    r12,0x1
   14087f14e:	75 a0                	jne    0x14087f0f0
   14087f150:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f155:	e9 8e fe ff ff       	jmp    0x14087efe8
   14087f15a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087f15d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087f162:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087f166:	e8 f5 e6 9e ff       	call   0x14026d860
   14087f16b:	83 f8 ff             	cmp    eax,0xffffffff
   14087f16e:	0f 84 95 00 00 00    	je     0x14087f209
   14087f174:	48 98                	cdqe
   14087f176:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f17b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087f17f:	49 c1 e7 04          	shl    r15,0x4
   14087f183:	48 8d 05 be d2 dc 01 	lea    rax,[rip+0x1dcd2be]        # 0x14264c448
   14087f18a:	4c 03 f8             	add    r15,rax
   14087f18d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087f193:	41 8b dd             	mov    ebx,r13d
   14087f196:	49 8b ff             	mov    rdi,r15
   14087f199:	be 04 00 00 00       	mov    esi,0x4
   14087f19e:	4c 8d 2d 4b b2 dc 01 	lea    r13,[rip+0x1dcb24b]        # 0x14264a3f0
   14087f1a5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087f1b0:	44 8b c3             	mov    r8d,ebx
   14087f1b3:	41 8b d6             	mov    edx,r14d
   14087f1b6:	49 8b cd             	mov    rcx,r13
   14087f1b9:	e8 62 bf 83 ff       	call   0x1400bb120
   14087f1be:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f1c0:	49 8b cd             	mov    rcx,r13
   14087f1c3:	e8 08 b9 25 00       	call   0x140adaad0
   14087f1c8:	33 d2                	xor    edx,edx
   14087f1ca:	48 8d 0d 9f e5 b4 01 	lea    rcx,[rip+0x1b4e59f]        # 0x1423cd770
   14087f1d1:	e8 ba 2d 7f ff       	call   0x140071f90
   14087f1d6:	84 c0                	test   al,al
   14087f1d8:	74 0d                	je     0x14087f1e7
   14087f1da:	41 b0 01             	mov    r8b,0x1
   14087f1dd:	33 d2                	xor    edx,edx
   14087f1df:	49 8b cd             	mov    rcx,r13
   14087f1e2:	e8 a9 bf 83 ff       	call   0x1400bb190
   14087f1e7:	ff c3                	inc    ebx
   14087f1e9:	48 83 c7 0c          	add    rdi,0xc
   14087f1ed:	48 83 ee 01          	sub    rsi,0x1
   14087f1f1:	75 bd                	jne    0x14087f1b0
   14087f1f3:	41 ff c6             	inc    r14d
   14087f1f6:	49 83 c7 04          	add    r15,0x4
   14087f1fa:	49 83 ec 01          	sub    r12,0x1
   14087f1fe:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087f202:	75 8f                	jne    0x14087f193
   14087f204:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f209:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087f20e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087f213:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087f217:	48 8d 0d d2 b1 dc 01 	lea    rcx,[rip+0x1dcb1d2]        # 0x14264a3f0
   14087f21e:	e8 fd be 83 ff       	call   0x1400bb120
   14087f223:	48 8d 15 ae 4b e3 00 	lea    rdx,[rip+0xe34bae]        # 0x1416b3dd8
   14087f22a:	e9 cb f5 ff ff       	jmp    0x14087e7fa
   14087f22f:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087f233:	83 fa ff             	cmp    edx,0xffffffff
   14087f236:	0f 84 d7 00 00 00    	je     0x14087f313
   14087f23c:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087f240:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087f244:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087f249:	45 8b c4             	mov    r8d,r12d
   14087f24c:	48 8b cb             	mov    rcx,rbx
   14087f24f:	e8 5c 52 02 00       	call   0x1408a44b0
   14087f254:	4c 8d 2d 95 b1 dc 01 	lea    r13,[rip+0x1dcb195]        # 0x14264a3f0
   14087f25b:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f260:	4c 8d 3d 41 3e dd 01 	lea    r15,[rip+0x1dd3e41]        # 0x1426530a8
   14087f267:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087f270:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087f275:	49 8b ff             	mov    rdi,r15
   14087f278:	be 04 00 00 00       	mov    esi,0x4
   14087f27d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087f280:	44 8b c3             	mov    r8d,ebx
   14087f283:	41 8b d6             	mov    edx,r14d
   14087f286:	49 8b cd             	mov    rcx,r13
   14087f289:	e8 92 be 83 ff       	call   0x1400bb120
   14087f28e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f290:	49 8b cd             	mov    rcx,r13
   14087f293:	e8 38 b8 25 00       	call   0x140adaad0
   14087f298:	33 d2                	xor    edx,edx
   14087f29a:	48 8d 0d cf e4 b4 01 	lea    rcx,[rip+0x1b4e4cf]        # 0x1423cd770
   14087f2a1:	e8 ea 2c 7f ff       	call   0x140071f90
   14087f2a6:	84 c0                	test   al,al
   14087f2a8:	74 0d                	je     0x14087f2b7
   14087f2aa:	41 b0 01             	mov    r8b,0x1
   14087f2ad:	33 d2                	xor    edx,edx
   14087f2af:	49 8b cd             	mov    rcx,r13
   14087f2b2:	e8 d9 be 83 ff       	call   0x1400bb190
   14087f2b7:	ff c3                	inc    ebx
   14087f2b9:	48 83 c7 0c          	add    rdi,0xc
   14087f2bd:	48 83 ee 01          	sub    rsi,0x1
   14087f2c1:	75 bd                	jne    0x14087f280
   14087f2c3:	41 ff c6             	inc    r14d
   14087f2c6:	49 83 c7 04          	add    r15,0x4
   14087f2ca:	48 8d 05 e3 3d dd 01 	lea    rax,[rip+0x1dd3de3]        # 0x1426530b4
   14087f2d1:	4c 3b f8             	cmp    r15,rax
   14087f2d4:	7c 9a                	jl     0x14087f270
   14087f2d6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f2db:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087f2e0:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087f2e4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087f2e8:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087f2eb:	83 fa ff             	cmp    edx,0xffffffff
   14087f2ee:	0f 84 d6 00 00 00    	je     0x14087f3ca
   14087f2f4:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087f2f8:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087f2fc:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087f301:	45 8b c5             	mov    r8d,r13d
   14087f304:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087f309:	e8 a2 51 02 00       	call   0x1408a44b0
   14087f30e:	e9 66 01 00 00       	jmp    0x14087f479
   14087f313:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087f317:	48 8b 0d f2 5d b6 01 	mov    rcx,QWORD PTR [rip+0x1b65df2]        # 0x1423e5110
   14087f31e:	e8 3d e5 9e ff       	call   0x14026d860
   14087f323:	83 f8 ff             	cmp    eax,0xffffffff
   14087f326:	0f 84 28 ff ff ff    	je     0x14087f254
   14087f32c:	48 98                	cdqe
   14087f32e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f333:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087f337:	49 c1 e7 04          	shl    r15,0x4
   14087f33b:	48 8d 05 06 d1 dc 01 	lea    rax,[rip+0x1dcd106]        # 0x14264c448
   14087f342:	4c 03 f8             	add    r15,rax
   14087f345:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087f34b:	4c 8d 2d 9e b0 dc 01 	lea    r13,[rip+0x1dcb09e]        # 0x14264a3f0
   14087f352:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087f356:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087f360:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087f364:	49 8b ff             	mov    rdi,r15
   14087f367:	be 04 00 00 00       	mov    esi,0x4
   14087f36c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087f370:	44 8b c3             	mov    r8d,ebx
   14087f373:	41 8b d6             	mov    edx,r14d
   14087f376:	49 8b cd             	mov    rcx,r13
   14087f379:	e8 a2 bd 83 ff       	call   0x1400bb120
   14087f37e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f380:	49 8b cd             	mov    rcx,r13
   14087f383:	e8 48 b7 25 00       	call   0x140adaad0
   14087f388:	33 d2                	xor    edx,edx
   14087f38a:	48 8d 0d df e3 b4 01 	lea    rcx,[rip+0x1b4e3df]        # 0x1423cd770
   14087f391:	e8 fa 2b 7f ff       	call   0x140071f90
   14087f396:	84 c0                	test   al,al
   14087f398:	74 0d                	je     0x14087f3a7
   14087f39a:	41 b0 01             	mov    r8b,0x1
   14087f39d:	33 d2                	xor    edx,edx
   14087f39f:	49 8b cd             	mov    rcx,r13
   14087f3a2:	e8 e9 bd 83 ff       	call   0x1400bb190
   14087f3a7:	ff c3                	inc    ebx
   14087f3a9:	48 83 c7 0c          	add    rdi,0xc
   14087f3ad:	48 83 ee 01          	sub    rsi,0x1
   14087f3b1:	75 bd                	jne    0x14087f370
   14087f3b3:	41 ff c6             	inc    r14d
   14087f3b6:	49 83 c7 04          	add    r15,0x4
   14087f3ba:	49 83 ec 01          	sub    r12,0x1
   14087f3be:	75 a0                	jne    0x14087f360
   14087f3c0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f3c5:	e9 91 fe ff ff       	jmp    0x14087f25b
   14087f3ca:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087f3cd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087f3d2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087f3d6:	e8 85 e4 9e ff       	call   0x14026d860
   14087f3db:	83 f8 ff             	cmp    eax,0xffffffff
   14087f3de:	0f 84 95 00 00 00    	je     0x14087f479
   14087f3e4:	48 98                	cdqe
   14087f3e6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f3eb:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087f3ef:	49 c1 e7 04          	shl    r15,0x4
   14087f3f3:	48 8d 05 4e d0 dc 01 	lea    rax,[rip+0x1dcd04e]        # 0x14264c448
   14087f3fa:	4c 03 f8             	add    r15,rax
   14087f3fd:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087f403:	41 8b dd             	mov    ebx,r13d
   14087f406:	49 8b ff             	mov    rdi,r15
   14087f409:	be 04 00 00 00       	mov    esi,0x4
   14087f40e:	4c 8d 2d db af dc 01 	lea    r13,[rip+0x1dcafdb]        # 0x14264a3f0
   14087f415:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087f420:	44 8b c3             	mov    r8d,ebx
   14087f423:	41 8b d6             	mov    edx,r14d
   14087f426:	49 8b cd             	mov    rcx,r13
   14087f429:	e8 f2 bc 83 ff       	call   0x1400bb120
   14087f42e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f430:	49 8b cd             	mov    rcx,r13
   14087f433:	e8 98 b6 25 00       	call   0x140adaad0
   14087f438:	33 d2                	xor    edx,edx
   14087f43a:	48 8d 0d 2f e3 b4 01 	lea    rcx,[rip+0x1b4e32f]        # 0x1423cd770
   14087f441:	e8 4a 2b 7f ff       	call   0x140071f90
   14087f446:	84 c0                	test   al,al
   14087f448:	74 0d                	je     0x14087f457
   14087f44a:	41 b0 01             	mov    r8b,0x1
   14087f44d:	33 d2                	xor    edx,edx
   14087f44f:	49 8b cd             	mov    rcx,r13
   14087f452:	e8 39 bd 83 ff       	call   0x1400bb190
   14087f457:	ff c3                	inc    ebx
   14087f459:	48 83 c7 0c          	add    rdi,0xc
   14087f45d:	48 83 ee 01          	sub    rsi,0x1
   14087f461:	75 bd                	jne    0x14087f420
   14087f463:	41 ff c6             	inc    r14d
   14087f466:	49 83 c7 04          	add    r15,0x4
   14087f46a:	49 83 ec 01          	sub    r12,0x1
   14087f46e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087f472:	75 8f                	jne    0x14087f403
   14087f474:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f479:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087f47e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087f483:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087f487:	48 8d 0d 62 af dc 01 	lea    rcx,[rip+0x1dcaf62]        # 0x14264a3f0
   14087f48e:	e8 8d bc 83 ff       	call   0x1400bb120
   14087f493:	48 8d 15 36 49 e3 00 	lea    rdx,[rip+0xe34936]        # 0x1416b3dd0
   14087f49a:	e9 5b f3 ff ff       	jmp    0x14087e7fa
   14087f49f:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087f4a3:	83 fa ff             	cmp    edx,0xffffffff
   14087f4a6:	0f 84 d7 00 00 00    	je     0x14087f583
   14087f4ac:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087f4b0:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087f4b4:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087f4b9:	45 8b c4             	mov    r8d,r12d
   14087f4bc:	48 8b cb             	mov    rcx,rbx
   14087f4bf:	e8 ec 4f 02 00       	call   0x1408a44b0
   14087f4c4:	4c 8d 2d 25 af dc 01 	lea    r13,[rip+0x1dcaf25]        # 0x14264a3f0
   14087f4cb:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f4d0:	4c 8d 3d 01 3c dd 01 	lea    r15,[rip+0x1dd3c01]        # 0x1426530d8
   14087f4d7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087f4e0:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087f4e5:	49 8b ff             	mov    rdi,r15
   14087f4e8:	be 04 00 00 00       	mov    esi,0x4
   14087f4ed:	0f 1f 00             	nop    DWORD PTR [rax]
   14087f4f0:	44 8b c3             	mov    r8d,ebx
   14087f4f3:	41 8b d6             	mov    edx,r14d
   14087f4f6:	49 8b cd             	mov    rcx,r13
   14087f4f9:	e8 22 bc 83 ff       	call   0x1400bb120
   14087f4fe:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f500:	49 8b cd             	mov    rcx,r13
   14087f503:	e8 c8 b5 25 00       	call   0x140adaad0
   14087f508:	33 d2                	xor    edx,edx
   14087f50a:	48 8d 0d 5f e2 b4 01 	lea    rcx,[rip+0x1b4e25f]        # 0x1423cd770
   14087f511:	e8 7a 2a 7f ff       	call   0x140071f90
   14087f516:	84 c0                	test   al,al
   14087f518:	74 0d                	je     0x14087f527
   14087f51a:	41 b0 01             	mov    r8b,0x1
   14087f51d:	33 d2                	xor    edx,edx
   14087f51f:	49 8b cd             	mov    rcx,r13
   14087f522:	e8 69 bc 83 ff       	call   0x1400bb190
   14087f527:	ff c3                	inc    ebx
   14087f529:	48 83 c7 0c          	add    rdi,0xc
   14087f52d:	48 83 ee 01          	sub    rsi,0x1
   14087f531:	75 bd                	jne    0x14087f4f0
   14087f533:	41 ff c6             	inc    r14d
   14087f536:	49 83 c7 04          	add    r15,0x4
   14087f53a:	48 8d 05 a3 3b dd 01 	lea    rax,[rip+0x1dd3ba3]        # 0x1426530e4
   14087f541:	4c 3b f8             	cmp    r15,rax
   14087f544:	7c 9a                	jl     0x14087f4e0
   14087f546:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f54b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087f550:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087f554:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087f558:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087f55b:	83 fa ff             	cmp    edx,0xffffffff
   14087f55e:	0f 84 d6 00 00 00    	je     0x14087f63a
   14087f564:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087f568:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087f56c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087f571:	45 8b c5             	mov    r8d,r13d
   14087f574:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087f579:	e8 32 4f 02 00       	call   0x1408a44b0
   14087f57e:	e9 66 01 00 00       	jmp    0x14087f6e9
   14087f583:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087f587:	48 8b 0d 82 5b b6 01 	mov    rcx,QWORD PTR [rip+0x1b65b82]        # 0x1423e5110
   14087f58e:	e8 cd e2 9e ff       	call   0x14026d860
   14087f593:	83 f8 ff             	cmp    eax,0xffffffff
   14087f596:	0f 84 28 ff ff ff    	je     0x14087f4c4
   14087f59c:	48 98                	cdqe
   14087f59e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f5a3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087f5a7:	49 c1 e7 04          	shl    r15,0x4
   14087f5ab:	48 8d 05 96 ce dc 01 	lea    rax,[rip+0x1dcce96]        # 0x14264c448
   14087f5b2:	4c 03 f8             	add    r15,rax
   14087f5b5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087f5bb:	4c 8d 2d 2e ae dc 01 	lea    r13,[rip+0x1dcae2e]        # 0x14264a3f0
   14087f5c2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087f5c6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087f5d0:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087f5d4:	49 8b ff             	mov    rdi,r15
   14087f5d7:	be 04 00 00 00       	mov    esi,0x4
   14087f5dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087f5e0:	44 8b c3             	mov    r8d,ebx
   14087f5e3:	41 8b d6             	mov    edx,r14d
   14087f5e6:	49 8b cd             	mov    rcx,r13
   14087f5e9:	e8 32 bb 83 ff       	call   0x1400bb120
   14087f5ee:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f5f0:	49 8b cd             	mov    rcx,r13
   14087f5f3:	e8 d8 b4 25 00       	call   0x140adaad0
   14087f5f8:	33 d2                	xor    edx,edx
   14087f5fa:	48 8d 0d 6f e1 b4 01 	lea    rcx,[rip+0x1b4e16f]        # 0x1423cd770
   14087f601:	e8 8a 29 7f ff       	call   0x140071f90
   14087f606:	84 c0                	test   al,al
   14087f608:	74 0d                	je     0x14087f617
   14087f60a:	41 b0 01             	mov    r8b,0x1
   14087f60d:	33 d2                	xor    edx,edx
   14087f60f:	49 8b cd             	mov    rcx,r13
   14087f612:	e8 79 bb 83 ff       	call   0x1400bb190
   14087f617:	ff c3                	inc    ebx
   14087f619:	48 83 c7 0c          	add    rdi,0xc
   14087f61d:	48 83 ee 01          	sub    rsi,0x1
   14087f621:	75 bd                	jne    0x14087f5e0
   14087f623:	41 ff c6             	inc    r14d
   14087f626:	49 83 c7 04          	add    r15,0x4
   14087f62a:	49 83 ec 01          	sub    r12,0x1
   14087f62e:	75 a0                	jne    0x14087f5d0
   14087f630:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f635:	e9 91 fe ff ff       	jmp    0x14087f4cb
   14087f63a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087f63d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087f642:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087f646:	e8 15 e2 9e ff       	call   0x14026d860
   14087f64b:	83 f8 ff             	cmp    eax,0xffffffff
   14087f64e:	0f 84 95 00 00 00    	je     0x14087f6e9
   14087f654:	48 98                	cdqe
   14087f656:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f65b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087f65f:	49 c1 e7 04          	shl    r15,0x4
   14087f663:	48 8d 05 de cd dc 01 	lea    rax,[rip+0x1dccdde]        # 0x14264c448
   14087f66a:	4c 03 f8             	add    r15,rax
   14087f66d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087f673:	41 8b dd             	mov    ebx,r13d
   14087f676:	49 8b ff             	mov    rdi,r15
   14087f679:	be 04 00 00 00       	mov    esi,0x4
   14087f67e:	4c 8d 2d 6b ad dc 01 	lea    r13,[rip+0x1dcad6b]        # 0x14264a3f0
   14087f685:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087f690:	44 8b c3             	mov    r8d,ebx
   14087f693:	41 8b d6             	mov    edx,r14d
   14087f696:	49 8b cd             	mov    rcx,r13
   14087f699:	e8 82 ba 83 ff       	call   0x1400bb120
   14087f69e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f6a0:	49 8b cd             	mov    rcx,r13
   14087f6a3:	e8 28 b4 25 00       	call   0x140adaad0
   14087f6a8:	33 d2                	xor    edx,edx
   14087f6aa:	48 8d 0d bf e0 b4 01 	lea    rcx,[rip+0x1b4e0bf]        # 0x1423cd770
   14087f6b1:	e8 da 28 7f ff       	call   0x140071f90
   14087f6b6:	84 c0                	test   al,al
   14087f6b8:	74 0d                	je     0x14087f6c7
   14087f6ba:	41 b0 01             	mov    r8b,0x1
   14087f6bd:	33 d2                	xor    edx,edx
   14087f6bf:	49 8b cd             	mov    rcx,r13
   14087f6c2:	e8 c9 ba 83 ff       	call   0x1400bb190
   14087f6c7:	ff c3                	inc    ebx
   14087f6c9:	48 83 c7 0c          	add    rdi,0xc
   14087f6cd:	48 83 ee 01          	sub    rsi,0x1
   14087f6d1:	75 bd                	jne    0x14087f690
   14087f6d3:	41 ff c6             	inc    r14d
   14087f6d6:	49 83 c7 04          	add    r15,0x4
   14087f6da:	49 83 ec 01          	sub    r12,0x1
   14087f6de:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087f6e2:	75 8f                	jne    0x14087f673
   14087f6e4:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f6e9:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087f6ee:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087f6f3:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087f6f7:	48 8d 0d f2 ac dc 01 	lea    rcx,[rip+0x1dcacf2]        # 0x14264a3f0
   14087f6fe:	e8 1d ba 83 ff       	call   0x1400bb120
   14087f703:	48 8d 15 0e 51 e3 00 	lea    rdx,[rip+0xe3510e]        # 0x1416b4818
   14087f70a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087f70e:	e8 6d fe 7e ff       	call   0x14006f580
   14087f713:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14087f717:	44 0f b7 40 10       	movzx  r8d,WORD PTR [rax+0x10]
   14087f71c:	e9 e7 f0 ff ff       	jmp    0x14087e808
   14087f721:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087f725:	83 fa ff             	cmp    edx,0xffffffff
   14087f728:	0f 84 d5 00 00 00    	je     0x14087f803
   14087f72e:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087f732:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087f736:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087f73b:	45 8b c4             	mov    r8d,r12d
   14087f73e:	48 8b cb             	mov    rcx,rbx
   14087f741:	e8 6a 4d 02 00       	call   0x1408a44b0
   14087f746:	4c 8d 2d a3 ac dc 01 	lea    r13,[rip+0x1dcaca3]        # 0x14264a3f0
   14087f74d:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f752:	4c 8d 3d af 39 dd 01 	lea    r15,[rip+0x1dd39af]        # 0x142653108
   14087f759:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   14087f760:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087f765:	49 8b ff             	mov    rdi,r15
   14087f768:	be 04 00 00 00       	mov    esi,0x4
   14087f76d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087f770:	44 8b c3             	mov    r8d,ebx
   14087f773:	41 8b d6             	mov    edx,r14d
   14087f776:	49 8b cd             	mov    rcx,r13
   14087f779:	e8 a2 b9 83 ff       	call   0x1400bb120
   14087f77e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f780:	49 8b cd             	mov    rcx,r13
   14087f783:	e8 48 b3 25 00       	call   0x140adaad0
   14087f788:	33 d2                	xor    edx,edx
   14087f78a:	48 8d 0d df df b4 01 	lea    rcx,[rip+0x1b4dfdf]        # 0x1423cd770
   14087f791:	e8 fa 27 7f ff       	call   0x140071f90
   14087f796:	84 c0                	test   al,al
   14087f798:	74 0d                	je     0x14087f7a7
   14087f79a:	41 b0 01             	mov    r8b,0x1
   14087f79d:	33 d2                	xor    edx,edx
   14087f79f:	49 8b cd             	mov    rcx,r13
   14087f7a2:	e8 e9 b9 83 ff       	call   0x1400bb190
   14087f7a7:	ff c3                	inc    ebx
   14087f7a9:	48 83 c7 0c          	add    rdi,0xc
   14087f7ad:	48 83 ee 01          	sub    rsi,0x1
   14087f7b1:	75 bd                	jne    0x14087f770
   14087f7b3:	41 ff c6             	inc    r14d
   14087f7b6:	49 83 c7 04          	add    r15,0x4
   14087f7ba:	48 8d 05 53 39 dd 01 	lea    rax,[rip+0x1dd3953]        # 0x142653114
   14087f7c1:	4c 3b f8             	cmp    r15,rax
   14087f7c4:	7c 9a                	jl     0x14087f760
   14087f7c6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f7cb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087f7d0:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087f7d4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087f7d8:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087f7db:	83 fa ff             	cmp    edx,0xffffffff
   14087f7de:	0f 84 d6 00 00 00    	je     0x14087f8ba
   14087f7e4:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087f7e8:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087f7ec:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087f7f1:	45 8b c5             	mov    r8d,r13d
   14087f7f4:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087f7f9:	e8 b2 4c 02 00       	call   0x1408a44b0
   14087f7fe:	e9 66 01 00 00       	jmp    0x14087f969
   14087f803:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087f807:	48 8b 0d 02 59 b6 01 	mov    rcx,QWORD PTR [rip+0x1b65902]        # 0x1423e5110
   14087f80e:	e8 4d e0 9e ff       	call   0x14026d860
   14087f813:	83 f8 ff             	cmp    eax,0xffffffff
   14087f816:	0f 84 2a ff ff ff    	je     0x14087f746
   14087f81c:	48 98                	cdqe
   14087f81e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f823:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087f827:	49 c1 e7 04          	shl    r15,0x4
   14087f82b:	48 8d 05 16 cc dc 01 	lea    rax,[rip+0x1dccc16]        # 0x14264c448
   14087f832:	4c 03 f8             	add    r15,rax
   14087f835:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087f83b:	4c 8d 2d ae ab dc 01 	lea    r13,[rip+0x1dcabae]        # 0x14264a3f0
   14087f842:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087f846:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087f850:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087f854:	49 8b ff             	mov    rdi,r15
   14087f857:	be 04 00 00 00       	mov    esi,0x4
   14087f85c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087f860:	44 8b c3             	mov    r8d,ebx
   14087f863:	41 8b d6             	mov    edx,r14d
   14087f866:	49 8b cd             	mov    rcx,r13
   14087f869:	e8 b2 b8 83 ff       	call   0x1400bb120
   14087f86e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f870:	49 8b cd             	mov    rcx,r13
   14087f873:	e8 58 b2 25 00       	call   0x140adaad0
   14087f878:	33 d2                	xor    edx,edx
   14087f87a:	48 8d 0d ef de b4 01 	lea    rcx,[rip+0x1b4deef]        # 0x1423cd770
   14087f881:	e8 0a 27 7f ff       	call   0x140071f90
   14087f886:	84 c0                	test   al,al
   14087f888:	74 0d                	je     0x14087f897
   14087f88a:	41 b0 01             	mov    r8b,0x1
   14087f88d:	33 d2                	xor    edx,edx
   14087f88f:	49 8b cd             	mov    rcx,r13
   14087f892:	e8 f9 b8 83 ff       	call   0x1400bb190
   14087f897:	ff c3                	inc    ebx
   14087f899:	48 83 c7 0c          	add    rdi,0xc
   14087f89d:	48 83 ee 01          	sub    rsi,0x1
   14087f8a1:	75 bd                	jne    0x14087f860
   14087f8a3:	41 ff c6             	inc    r14d
   14087f8a6:	49 83 c7 04          	add    r15,0x4
   14087f8aa:	49 83 ec 01          	sub    r12,0x1
   14087f8ae:	75 a0                	jne    0x14087f850
   14087f8b0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f8b5:	e9 93 fe ff ff       	jmp    0x14087f74d
   14087f8ba:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087f8bd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087f8c2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087f8c6:	e8 95 df 9e ff       	call   0x14026d860
   14087f8cb:	83 f8 ff             	cmp    eax,0xffffffff
   14087f8ce:	0f 84 95 00 00 00    	je     0x14087f969
   14087f8d4:	48 98                	cdqe
   14087f8d6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087f8db:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087f8df:	49 c1 e7 04          	shl    r15,0x4
   14087f8e3:	48 8d 05 5e cb dc 01 	lea    rax,[rip+0x1dccb5e]        # 0x14264c448
   14087f8ea:	4c 03 f8             	add    r15,rax
   14087f8ed:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087f8f3:	41 8b dd             	mov    ebx,r13d
   14087f8f6:	49 8b ff             	mov    rdi,r15
   14087f8f9:	be 04 00 00 00       	mov    esi,0x4
   14087f8fe:	4c 8d 2d eb aa dc 01 	lea    r13,[rip+0x1dcaaeb]        # 0x14264a3f0
   14087f905:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087f910:	44 8b c3             	mov    r8d,ebx
   14087f913:	41 8b d6             	mov    edx,r14d
   14087f916:	49 8b cd             	mov    rcx,r13
   14087f919:	e8 02 b8 83 ff       	call   0x1400bb120
   14087f91e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087f920:	49 8b cd             	mov    rcx,r13
   14087f923:	e8 a8 b1 25 00       	call   0x140adaad0
   14087f928:	33 d2                	xor    edx,edx
   14087f92a:	48 8d 0d 3f de b4 01 	lea    rcx,[rip+0x1b4de3f]        # 0x1423cd770
   14087f931:	e8 5a 26 7f ff       	call   0x140071f90
   14087f936:	84 c0                	test   al,al
   14087f938:	74 0d                	je     0x14087f947
   14087f93a:	41 b0 01             	mov    r8b,0x1
   14087f93d:	33 d2                	xor    edx,edx
   14087f93f:	49 8b cd             	mov    rcx,r13
   14087f942:	e8 49 b8 83 ff       	call   0x1400bb190
   14087f947:	ff c3                	inc    ebx
   14087f949:	48 83 c7 0c          	add    rdi,0xc
   14087f94d:	48 83 ee 01          	sub    rsi,0x1
   14087f951:	75 bd                	jne    0x14087f910
   14087f953:	41 ff c6             	inc    r14d
   14087f956:	49 83 c7 04          	add    r15,0x4
   14087f95a:	49 83 ec 01          	sub    r12,0x1
   14087f95e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087f962:	75 8f                	jne    0x14087f8f3
   14087f964:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087f969:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087f96e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087f973:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087f977:	48 8d 0d 72 aa dc 01 	lea    rcx,[rip+0x1dcaa72]        # 0x14264a3f0
   14087f97e:	e8 9d b7 83 ff       	call   0x1400bb120
   14087f983:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14087f987:	0f bf 48 1c          	movsx  ecx,WORD PTR [rax+0x1c]
   14087f98b:	80 78 1e 00          	cmp    BYTE PTR [rax+0x1e],0x0
   14087f98f:	7e 68                	jle    0x14087f9f9
   14087f991:	85 c9                	test   ecx,ecx
   14087f993:	74 5b                	je     0x14087f9f0
   14087f995:	83 e9 01             	sub    ecx,0x1
   14087f998:	74 56                	je     0x14087f9f0
   14087f99a:	83 e9 01             	sub    ecx,0x1
   14087f99d:	74 48                	je     0x14087f9e7
   14087f99f:	83 f9 01             	cmp    ecx,0x1
   14087f9a2:	0f 85 a9 05 00 00    	jne    0x14087ff51
   14087f9a8:	48 8d 15 89 4e e3 00 	lea    rdx,[rip+0xe34e89]        # 0x1416b4838
   14087f9af:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087f9b3:	e8 c8 fb 7e ff       	call   0x14006f580
   14087f9b8:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087f9bc:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087f9c0:	e8 4b a3 83 ff       	call   0x1400b9d10
   14087f9c5:	48 8d 15 60 df d6 00 	lea    rdx,[rip+0xd6df60]        # 0x1415ed92c
   14087f9cc:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087f9d0:	e8 8b fb 7e ff       	call   0x14006f560
   14087f9d5:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087f9d9:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087f9dd:	e8 2e a3 83 ff       	call   0x1400b9d10
   14087f9e2:	e9 6a 05 00 00       	jmp    0x14087ff51
   14087f9e7:	48 8d 15 12 4e e3 00 	lea    rdx,[rip+0xe34e12]        # 0x1416b4800
   14087f9ee:	eb bf                	jmp    0x14087f9af
   14087f9f0:	48 8d 15 29 4e e3 00 	lea    rdx,[rip+0xe34e29]        # 0x1416b4820
   14087f9f7:	eb b6                	jmp    0x14087f9af
   14087f9f9:	85 c9                	test   ecx,ecx
   14087f9fb:	74 25                	je     0x14087fa22
   14087f9fd:	83 e9 01             	sub    ecx,0x1
   14087fa00:	74 20                	je     0x14087fa22
   14087fa02:	83 e9 01             	sub    ecx,0x1
   14087fa05:	74 12                	je     0x14087fa19
   14087fa07:	83 f9 01             	cmp    ecx,0x1
   14087fa0a:	0f 85 41 05 00 00    	jne    0x14087ff51
   14087fa10:	48 8d 15 a1 4d e3 00 	lea    rdx,[rip+0xe34da1]        # 0x1416b47b8
   14087fa17:	eb 10                	jmp    0x14087fa29
   14087fa19:	48 8d 15 b0 4d e3 00 	lea    rdx,[rip+0xe34db0]        # 0x1416b47d0
   14087fa20:	eb 07                	jmp    0x14087fa29
   14087fa22:	48 8d 15 c7 4d e3 00 	lea    rdx,[rip+0xe34dc7]        # 0x1416b47f0
   14087fa29:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087fa2d:	e8 4e fb 7e ff       	call   0x14006f580
   14087fa32:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087fa36:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087fa3a:	e8 d1 a2 83 ff       	call   0x1400b9d10
   14087fa3f:	48 8d 15 e6 de d6 00 	lea    rdx,[rip+0xd6dee6]        # 0x1415ed92c
   14087fa46:	e9 ed ed ff ff       	jmp    0x14087e838
   14087fa4b:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087fa4f:	83 fa ff             	cmp    edx,0xffffffff
   14087fa52:	0f 84 db 00 00 00    	je     0x14087fb33
   14087fa58:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087fa5c:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087fa60:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087fa65:	45 8b c4             	mov    r8d,r12d
   14087fa68:	48 8b cb             	mov    rcx,rbx
   14087fa6b:	e8 40 4a 02 00       	call   0x1408a44b0
   14087fa70:	4c 8d 2d 79 a9 dc 01 	lea    r13,[rip+0x1dca979]        # 0x14264a3f0
   14087fa77:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087fa7c:	4c 8d 3d b5 36 dd 01 	lea    r15,[rip+0x1dd36b5]        # 0x142653138
   14087fa83:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087fa87:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087fa90:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087fa95:	49 8b ff             	mov    rdi,r15
   14087fa98:	be 04 00 00 00       	mov    esi,0x4
   14087fa9d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087faa0:	44 8b c3             	mov    r8d,ebx
   14087faa3:	41 8b d6             	mov    edx,r14d
   14087faa6:	49 8b cd             	mov    rcx,r13
   14087faa9:	e8 72 b6 83 ff       	call   0x1400bb120
   14087faae:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087fab0:	49 8b cd             	mov    rcx,r13
   14087fab3:	e8 18 b0 25 00       	call   0x140adaad0
   14087fab8:	33 d2                	xor    edx,edx
   14087faba:	48 8d 0d af dc b4 01 	lea    rcx,[rip+0x1b4dcaf]        # 0x1423cd770
   14087fac1:	e8 ca 24 7f ff       	call   0x140071f90
   14087fac6:	84 c0                	test   al,al
   14087fac8:	74 0d                	je     0x14087fad7
   14087faca:	41 b0 01             	mov    r8b,0x1
   14087facd:	33 d2                	xor    edx,edx
   14087facf:	49 8b cd             	mov    rcx,r13
   14087fad2:	e8 b9 b6 83 ff       	call   0x1400bb190
   14087fad7:	ff c3                	inc    ebx
   14087fad9:	48 83 c7 0c          	add    rdi,0xc
   14087fadd:	48 83 ee 01          	sub    rsi,0x1
   14087fae1:	75 bd                	jne    0x14087faa0
   14087fae3:	41 ff c6             	inc    r14d
   14087fae6:	49 83 c7 04          	add    r15,0x4
   14087faea:	48 8d 05 53 36 dd 01 	lea    rax,[rip+0x1dd3653]        # 0x142653144
   14087faf1:	4c 3b f8             	cmp    r15,rax
   14087faf4:	7c 9a                	jl     0x14087fa90
   14087faf6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087fafb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087fb00:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087fb04:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087fb08:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087fb0b:	83 fa ff             	cmp    edx,0xffffffff
   14087fb0e:	0f 84 d6 00 00 00    	je     0x14087fbea
   14087fb14:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087fb18:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087fb1c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087fb21:	45 8b c5             	mov    r8d,r13d
   14087fb24:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087fb29:	e8 82 49 02 00       	call   0x1408a44b0
   14087fb2e:	e9 66 01 00 00       	jmp    0x14087fc99
   14087fb33:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087fb37:	48 8b 0d d2 55 b6 01 	mov    rcx,QWORD PTR [rip+0x1b655d2]        # 0x1423e5110
   14087fb3e:	e8 1d dd 9e ff       	call   0x14026d860
   14087fb43:	83 f8 ff             	cmp    eax,0xffffffff
   14087fb46:	0f 84 24 ff ff ff    	je     0x14087fa70
   14087fb4c:	48 98                	cdqe
   14087fb4e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087fb53:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087fb57:	49 c1 e7 04          	shl    r15,0x4
   14087fb5b:	48 8d 05 e6 c8 dc 01 	lea    rax,[rip+0x1dcc8e6]        # 0x14264c448
   14087fb62:	4c 03 f8             	add    r15,rax
   14087fb65:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087fb6b:	4c 8d 2d 7e a8 dc 01 	lea    r13,[rip+0x1dca87e]        # 0x14264a3f0
   14087fb72:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087fb76:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087fb80:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087fb84:	49 8b ff             	mov    rdi,r15
   14087fb87:	be 04 00 00 00       	mov    esi,0x4
   14087fb8c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087fb90:	44 8b c3             	mov    r8d,ebx
   14087fb93:	41 8b d6             	mov    edx,r14d
   14087fb96:	49 8b cd             	mov    rcx,r13
   14087fb99:	e8 82 b5 83 ff       	call   0x1400bb120
   14087fb9e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087fba0:	49 8b cd             	mov    rcx,r13
   14087fba3:	e8 28 af 25 00       	call   0x140adaad0
   14087fba8:	33 d2                	xor    edx,edx
   14087fbaa:	48 8d 0d bf db b4 01 	lea    rcx,[rip+0x1b4dbbf]        # 0x1423cd770
   14087fbb1:	e8 da 23 7f ff       	call   0x140071f90
   14087fbb6:	84 c0                	test   al,al
   14087fbb8:	74 0d                	je     0x14087fbc7
   14087fbba:	41 b0 01             	mov    r8b,0x1
   14087fbbd:	33 d2                	xor    edx,edx
   14087fbbf:	49 8b cd             	mov    rcx,r13
   14087fbc2:	e8 c9 b5 83 ff       	call   0x1400bb190
   14087fbc7:	ff c3                	inc    ebx
   14087fbc9:	48 83 c7 0c          	add    rdi,0xc
   14087fbcd:	48 83 ee 01          	sub    rsi,0x1
   14087fbd1:	75 bd                	jne    0x14087fb90
   14087fbd3:	41 ff c6             	inc    r14d
   14087fbd6:	49 83 c7 04          	add    r15,0x4
   14087fbda:	49 83 ec 01          	sub    r12,0x1
   14087fbde:	75 a0                	jne    0x14087fb80
   14087fbe0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087fbe5:	e9 8d fe ff ff       	jmp    0x14087fa77
   14087fbea:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087fbed:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087fbf2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087fbf6:	e8 65 dc 9e ff       	call   0x14026d860
   14087fbfb:	83 f8 ff             	cmp    eax,0xffffffff
   14087fbfe:	0f 84 95 00 00 00    	je     0x14087fc99
   14087fc04:	48 98                	cdqe
   14087fc06:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087fc0b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087fc0f:	49 c1 e7 04          	shl    r15,0x4
   14087fc13:	48 8d 05 2e c8 dc 01 	lea    rax,[rip+0x1dcc82e]        # 0x14264c448
   14087fc1a:	4c 03 f8             	add    r15,rax
   14087fc1d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087fc23:	41 8b dd             	mov    ebx,r13d
   14087fc26:	49 8b ff             	mov    rdi,r15
   14087fc29:	be 04 00 00 00       	mov    esi,0x4
   14087fc2e:	4c 8d 2d bb a7 dc 01 	lea    r13,[rip+0x1dca7bb]        # 0x14264a3f0
   14087fc35:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087fc40:	44 8b c3             	mov    r8d,ebx
   14087fc43:	41 8b d6             	mov    edx,r14d
   14087fc46:	49 8b cd             	mov    rcx,r13
   14087fc49:	e8 d2 b4 83 ff       	call   0x1400bb120
   14087fc4e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087fc50:	49 8b cd             	mov    rcx,r13
   14087fc53:	e8 78 ae 25 00       	call   0x140adaad0
   14087fc58:	33 d2                	xor    edx,edx
   14087fc5a:	48 8d 0d 0f db b4 01 	lea    rcx,[rip+0x1b4db0f]        # 0x1423cd770
   14087fc61:	e8 2a 23 7f ff       	call   0x140071f90
   14087fc66:	84 c0                	test   al,al
   14087fc68:	74 0d                	je     0x14087fc77
   14087fc6a:	41 b0 01             	mov    r8b,0x1
   14087fc6d:	33 d2                	xor    edx,edx
   14087fc6f:	49 8b cd             	mov    rcx,r13
   14087fc72:	e8 19 b5 83 ff       	call   0x1400bb190
   14087fc77:	ff c3                	inc    ebx
   14087fc79:	48 83 c7 0c          	add    rdi,0xc
   14087fc7d:	48 83 ee 01          	sub    rsi,0x1
   14087fc81:	75 bd                	jne    0x14087fc40
   14087fc83:	41 ff c6             	inc    r14d
   14087fc86:	49 83 c7 04          	add    r15,0x4
   14087fc8a:	49 83 ec 01          	sub    r12,0x1
   14087fc8e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087fc92:	75 8f                	jne    0x14087fc23
   14087fc94:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087fc99:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087fc9e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087fca3:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087fca7:	48 8d 0d 42 a7 dc 01 	lea    rcx,[rip+0x1dca742]        # 0x14264a3f0
   14087fcae:	e8 6d b4 83 ff       	call   0x1400bb120
   14087fcb3:	48 8d 15 2e 4b e3 00 	lea    rdx,[rip+0xe34b2e]        # 0x1416b47e8
   14087fcba:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087fcbe:	e8 bd f8 7e ff       	call   0x14006f580
   14087fcc3:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087fcc7:	e9 5c eb ff ff       	jmp    0x14087e828
   14087fccc:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087fcd0:	83 fa ff             	cmp    edx,0xffffffff
   14087fcd3:	0f 84 da 00 00 00    	je     0x14087fdb3
   14087fcd9:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087fcdd:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087fce1:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087fce6:	45 8b c4             	mov    r8d,r12d
   14087fce9:	48 8b cb             	mov    rcx,rbx
   14087fcec:	e8 bf 47 02 00       	call   0x1408a44b0
   14087fcf1:	4c 8d 2d f8 a6 dc 01 	lea    r13,[rip+0x1dca6f8]        # 0x14264a3f0
   14087fcf8:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087fcfd:	4c 8d 3d 64 34 dd 01 	lea    r15,[rip+0x1dd3464]        # 0x142653168
   14087fd04:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087fd08:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14087fd10:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087fd15:	49 8b ff             	mov    rdi,r15
   14087fd18:	be 04 00 00 00       	mov    esi,0x4
   14087fd1d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087fd20:	44 8b c3             	mov    r8d,ebx
   14087fd23:	41 8b d6             	mov    edx,r14d
   14087fd26:	49 8b cd             	mov    rcx,r13
   14087fd29:	e8 f2 b3 83 ff       	call   0x1400bb120
   14087fd2e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087fd30:	49 8b cd             	mov    rcx,r13
   14087fd33:	e8 98 ad 25 00       	call   0x140adaad0
   14087fd38:	33 d2                	xor    edx,edx
   14087fd3a:	48 8d 0d 2f da b4 01 	lea    rcx,[rip+0x1b4da2f]        # 0x1423cd770
   14087fd41:	e8 4a 22 7f ff       	call   0x140071f90
   14087fd46:	84 c0                	test   al,al
   14087fd48:	74 0d                	je     0x14087fd57
   14087fd4a:	41 b0 01             	mov    r8b,0x1
   14087fd4d:	33 d2                	xor    edx,edx
   14087fd4f:	49 8b cd             	mov    rcx,r13
   14087fd52:	e8 39 b4 83 ff       	call   0x1400bb190
   14087fd57:	ff c3                	inc    ebx
   14087fd59:	48 83 c7 0c          	add    rdi,0xc
   14087fd5d:	48 83 ee 01          	sub    rsi,0x1
   14087fd61:	75 bd                	jne    0x14087fd20
   14087fd63:	41 ff c6             	inc    r14d
   14087fd66:	49 83 c7 04          	add    r15,0x4
   14087fd6a:	48 8d 05 03 34 dd 01 	lea    rax,[rip+0x1dd3403]        # 0x142653174
   14087fd71:	4c 3b f8             	cmp    r15,rax
   14087fd74:	7c 9a                	jl     0x14087fd10
   14087fd76:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087fd7b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087fd80:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087fd84:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087fd88:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087fd8b:	83 fa ff             	cmp    edx,0xffffffff
   14087fd8e:	0f 84 d6 00 00 00    	je     0x14087fe6a
   14087fd94:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087fd98:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087fd9c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087fda1:	45 8b c5             	mov    r8d,r13d
   14087fda4:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087fda9:	e8 02 47 02 00       	call   0x1408a44b0
   14087fdae:	e9 66 01 00 00       	jmp    0x14087ff19
   14087fdb3:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087fdb7:	48 8b 0d 52 53 b6 01 	mov    rcx,QWORD PTR [rip+0x1b65352]        # 0x1423e5110
   14087fdbe:	e8 9d da 9e ff       	call   0x14026d860
   14087fdc3:	83 f8 ff             	cmp    eax,0xffffffff
   14087fdc6:	0f 84 25 ff ff ff    	je     0x14087fcf1
   14087fdcc:	48 98                	cdqe
   14087fdce:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087fdd3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087fdd7:	49 c1 e7 04          	shl    r15,0x4
   14087fddb:	48 8d 05 66 c6 dc 01 	lea    rax,[rip+0x1dcc666]        # 0x14264c448
   14087fde2:	4c 03 f8             	add    r15,rax
   14087fde5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087fdeb:	4c 8d 2d fe a5 dc 01 	lea    r13,[rip+0x1dca5fe]        # 0x14264a3f0
   14087fdf2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087fdf6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087fe00:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087fe04:	49 8b ff             	mov    rdi,r15
   14087fe07:	be 04 00 00 00       	mov    esi,0x4
   14087fe0c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087fe10:	44 8b c3             	mov    r8d,ebx
   14087fe13:	41 8b d6             	mov    edx,r14d
   14087fe16:	49 8b cd             	mov    rcx,r13
   14087fe19:	e8 02 b3 83 ff       	call   0x1400bb120
   14087fe1e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087fe20:	49 8b cd             	mov    rcx,r13
   14087fe23:	e8 a8 ac 25 00       	call   0x140adaad0
   14087fe28:	33 d2                	xor    edx,edx
   14087fe2a:	48 8d 0d 3f d9 b4 01 	lea    rcx,[rip+0x1b4d93f]        # 0x1423cd770
   14087fe31:	e8 5a 21 7f ff       	call   0x140071f90
   14087fe36:	84 c0                	test   al,al
   14087fe38:	74 0d                	je     0x14087fe47
   14087fe3a:	41 b0 01             	mov    r8b,0x1
   14087fe3d:	33 d2                	xor    edx,edx
   14087fe3f:	49 8b cd             	mov    rcx,r13
   14087fe42:	e8 49 b3 83 ff       	call   0x1400bb190
   14087fe47:	ff c3                	inc    ebx
   14087fe49:	48 83 c7 0c          	add    rdi,0xc
   14087fe4d:	48 83 ee 01          	sub    rsi,0x1
   14087fe51:	75 bd                	jne    0x14087fe10
   14087fe53:	41 ff c6             	inc    r14d
   14087fe56:	49 83 c7 04          	add    r15,0x4
   14087fe5a:	49 83 ec 01          	sub    r12,0x1
   14087fe5e:	75 a0                	jne    0x14087fe00
   14087fe60:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087fe65:	e9 8e fe ff ff       	jmp    0x14087fcf8
   14087fe6a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087fe6d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087fe72:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087fe76:	e8 e5 d9 9e ff       	call   0x14026d860
   14087fe7b:	83 f8 ff             	cmp    eax,0xffffffff
   14087fe7e:	0f 84 95 00 00 00    	je     0x14087ff19
   14087fe84:	48 98                	cdqe
   14087fe86:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087fe8b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087fe8f:	49 c1 e7 04          	shl    r15,0x4
   14087fe93:	48 8d 05 ae c5 dc 01 	lea    rax,[rip+0x1dcc5ae]        # 0x14264c448
   14087fe9a:	4c 03 f8             	add    r15,rax
   14087fe9d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087fea3:	41 8b dd             	mov    ebx,r13d
   14087fea6:	49 8b ff             	mov    rdi,r15
   14087fea9:	be 04 00 00 00       	mov    esi,0x4
   14087feae:	4c 8d 2d 3b a5 dc 01 	lea    r13,[rip+0x1dca53b]        # 0x14264a3f0
   14087feb5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087fec0:	44 8b c3             	mov    r8d,ebx
   14087fec3:	41 8b d6             	mov    edx,r14d
   14087fec6:	49 8b cd             	mov    rcx,r13
   14087fec9:	e8 52 b2 83 ff       	call   0x1400bb120
   14087fece:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087fed0:	49 8b cd             	mov    rcx,r13
   14087fed3:	e8 f8 ab 25 00       	call   0x140adaad0
   14087fed8:	33 d2                	xor    edx,edx
   14087feda:	48 8d 0d 8f d8 b4 01 	lea    rcx,[rip+0x1b4d88f]        # 0x1423cd770
   14087fee1:	e8 aa 20 7f ff       	call   0x140071f90
   14087fee6:	84 c0                	test   al,al
   14087fee8:	74 0d                	je     0x14087fef7
   14087feea:	41 b0 01             	mov    r8b,0x1
   14087feed:	33 d2                	xor    edx,edx
   14087feef:	49 8b cd             	mov    rcx,r13
   14087fef2:	e8 99 b2 83 ff       	call   0x1400bb190
   14087fef7:	ff c3                	inc    ebx
   14087fef9:	48 83 c7 0c          	add    rdi,0xc
   14087fefd:	48 83 ee 01          	sub    rsi,0x1
   14087ff01:	75 bd                	jne    0x14087fec0
   14087ff03:	41 ff c6             	inc    r14d
   14087ff06:	49 83 c7 04          	add    r15,0x4
   14087ff0a:	49 83 ec 01          	sub    r12,0x1
   14087ff0e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087ff12:	75 8f                	jne    0x14087fea3
   14087ff14:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087ff19:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087ff1e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087ff23:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087ff27:	48 8d 0d c2 a4 dc 01 	lea    rcx,[rip+0x1dca4c2]        # 0x14264a3f0
   14087ff2e:	e8 ed b1 83 ff       	call   0x1400bb120
   14087ff33:	48 8d 15 66 49 e3 00 	lea    rdx,[rip+0xe34966]        # 0x1416b48a0
   14087ff3a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087ff3e:	e8 3d f6 7e ff       	call   0x14006f580
   14087ff43:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087ff47:	e9 dc e8 ff ff       	jmp    0x14087e828
   14087ff4c:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087ff51:	45 33 c9             	xor    r9d,r9d
   14087ff54:	45 33 c0             	xor    r8d,r8d
   14087ff57:	48 8d 55 38          	lea    rdx,[rbp+0x38]
   14087ff5b:	48 8d 0d 8e a4 dc 01 	lea    rcx,[rip+0x1dca48e]        # 0x14264a3f0
   14087ff62:	e8 f9 99 25 00       	call   0x140ad9960
   14087ff67:	90                   	nop
   14087ff68:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087ff6c:	e8 bf 7e 7e ff       	call   0x140067e30
   14087ff71:	90                   	nop
   14087ff72:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087ff76:	e8 b5 7e 7e ff       	call   0x140067e30
   14087ff7b:	90                   	nop
   14087ff7c:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087ff80:	e8 ab 7e 7e ff       	call   0x140067e30
   14087ff85:	90                   	nop
   14087ff86:	48 8d 4d 78          	lea    rcx,[rbp+0x78]
   14087ff8a:	e8 a1 7e 7e ff       	call   0x140067e30
   14087ff8f:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087ff93:	41 83 c5 03          	add    r13d,0x3
   14087ff97:	44 89 6c 24 60       	mov    DWORD PTR [rsp+0x60],r13d
   14087ff9c:	8b 44 24 7c          	mov    eax,DWORD PTR [rsp+0x7c]
   14087ffa0:	ff c0                	inc    eax
   14087ffa2:	89 44 24 7c          	mov    DWORD PTR [rsp+0x7c],eax
   14087ffa6:	3b 45 8c             	cmp    eax,DWORD PTR [rbp-0x74]
   14087ffa9:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
   14087ffad:	0f 8c f2 da ff ff    	jl     0x14087daa5
   14087ffb3:	8b 5d e8             	mov    ebx,DWORD PTR [rbp-0x18]
   14087ffb6:	8b 75 a0             	mov    esi,DWORD PTR [rbp-0x60]
   14087ffb9:	3b fb                	cmp    edi,ebx
   14087ffbb:	7e 62                	jle    0x14088001f
   14087ffbd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087ffc1:	e8 9a b3 83 ff       	call   0x1400bb360
   14087ffc6:	8d 4b ff             	lea    ecx,[rbx-0x1]
   14087ffc9:	8d 0c 4e             	lea    ecx,[rsi+rcx*2]
   14087ffcc:	03 cb                	add    ecx,ebx
   14087ffce:	8d 46 01             	lea    eax,[rsi+0x1]
   14087ffd1:	44 8d 4f ff          	lea    r9d,[rdi-0x1]
   14087ffd5:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   14087ffd9:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   14087ffdd:	89 5c 24 20          	mov    DWORD PTR [rsp+0x20],ebx
   14087ffe1:	45 33 c0             	xor    r8d,r8d
   14087ffe4:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087ffe9:	8b 93 10 03 00 00    	mov    edx,DWORD PTR [rbx+0x310]
   14087ffef:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087fff3:	e8 88 b3 83 ff       	call   0x1400bb380
   14087fff8:	45 8d 4f 01          	lea    r9d,[r15+0x1]
   14087fffc:	0f b6 83 14 03 00 00 	movzx  eax,BYTE PTR [rbx+0x314]
   140880003:	c7 44 24 28 00 00 00 00 	mov    DWORD PTR [rsp+0x28],0x0
   14088000b:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   14088000f:	44 8b 45 b4          	mov    r8d,DWORD PTR [rbp-0x4c]
   140880013:	8b 55 b8             	mov    edx,DWORD PTR [rbp-0x48]
   140880016:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14088001a:	e8 b1 f4 b8 00       	call   0x14140f4d0
   14088001f:	48 8b 8d 98 00 00 00 	mov    rcx,QWORD PTR [rbp+0x98]
   140880026:	48 33 cc             	xor    rcx,rsp
   140880029:	e8 32 96 cb 00       	call   0x141539660
   14088002e:	48 81 c4 a8 01 00 00 	add    rsp,0x1a8
   140880035:	41 5f                	pop    r15
   140880037:	41 5e                	pop    r14
   140880039:	41 5d                	pop    r13
   14088003b:	41 5c                	pop    r12
   14088003d:	5f                   	pop    rdi
   14088003e:	5e                   	pop    rsi
   14088003f:	5b                   	pop    rbx
   140880040:	5d                   	pop    rbp
   140880041:	c3                   	ret
   140880042:	66 90                	xchg   ax,ax
   140880044:	9d                   	popf
   140880045:	88 87 00 0b 89 87    	mov    BYTE PTR [rdi-0x7876f500],al
   14088004b:	00 cf                	add    bh,cl
   14088004d:	8a 87 00 f5 8a 87    	mov    al,BYTE PTR [rdi-0x78750b00]
   140880053:	00 22                	add    BYTE PTR [rdx],ah
   140880055:	8b 87 00 cf 8a 87    	mov    eax,DWORD PTR [rdi-0x78753100]
   14088005b:	00 cf                	add    bh,cl
   14088005d:	8a 87 00 cf 8a 87    	mov    al,BYTE PTR [rdi-0x78753100]
   140880063:	00 b6 8b 87 00 b6    	add    BYTE PTR [rsi-0x49ff7875],dh
   140880069:	8b 87 00 3b 8c 87    	mov    eax,DWORD PTR [rdi-0x7873c500]
   14088006f:	00 61 92             	add    BYTE PTR [rcx-0x6e],ah
   140880072:	87 00                	xchg   DWORD PTR [rax],eax
   140880074:	9c                   	pushf
   140880075:	94                   	xchg   esp,eax
   140880076:	87 00                	xchg   DWORD PTR [rax],eax
   140880078:	78 9f                	js     0x140880019
   14088007a:	87 00                	xchg   DWORD PTR [rax],eax
   14088007c:	c2 a8 87             	ret    0x87a8
   14088007f:	00 9c 94 87 00 9c 94 	add    BYTE PTR [rsp+rdx*4-0x6b63ff79],bl
   140880086:	87 00                	xchg   DWORD PTR [rax],eax
   140880088:	9c                   	pushf
   140880089:	94                   	xchg   esp,eax
   14088008a:	87 00                	xchg   DWORD PTR [rax],eax
   14088008c:	4d cb                	rex.WRB retfq
   14088008e:	87 00                	xchg   DWORD PTR [rax],eax
   140880090:	4d cb                	rex.WRB retfq
   140880092:	87 00                	xchg   DWORD PTR [rax],eax
   140880094:	65 c8 87 00 00       	gs enter 0x87,0x0
   140880099:	c4 87 00 3c          	(bad)
   14088009d:	c4 87 00 78          	(bad)
   1408800a1:	c4 87 00 b4          	(bad)
   1408800a5:	c4 87 00 f0          	(bad)
   1408800a9:	c4 87 00 2c          	(bad)
   1408800ad:	c5 87 00             	(bad)
   1408800b0:	68 c5 87 00 a4       	push   0xffffffffa40087c5
   1408800b5:	c5 87 00             	(bad)
   1408800b8:	e0 c5                	loopne 0x14088007f
   1408800ba:	87 00                	xchg   DWORD PTR [rax],eax
   1408800bc:	1c c6                	sbb    al,0xc6
   1408800be:	87 00                	xchg   DWORD PTR [rax],eax
   1408800c0:	58                   	pop    rax
   1408800c1:	c6 87 00 9d c6 87 00 	mov    BYTE PTR [rdi-0x78396300],0x0
   1408800c8:	e2 c6                	loop   0x140880090
   1408800ca:	87 00                	xchg   DWORD PTR [rax],eax
   1408800cc:	27                   	(bad)
   1408800cd:	c7 87 00 6c c7 87 00 b1 c7 87 	mov    DWORD PTR [rdi-0x78389400],0x87c7b100
   1408800d7:	00 ed                	add    ch,ch
   1408800d9:	c7 87 00 29 c8 87 00 98 e5 87 	mov    DWORD PTR [rdi-0x7837d700],0x87e59800
   1408800e3:	00 53 e8             	add    BYTE PTR [rbx-0x18],dl
   1408800e6:	87 00                	xchg   DWORD PTR [rax],eax
   1408800e8:	bf ea 87 00 3c       	mov    edi,0x3c0087ea
   1408800ed:	ed                   	in     eax,dx
   1408800ee:	87 00                	xchg   DWORD PTR [rax],eax
   1408800f0:	bc ef 87 00 2f       	mov    esp,0x2f0087ef
   1408800f5:	f2 87 00             	xacquire xchg DWORD PTR [rax],eax
   1408800f8:	4c ff 87 00 4c ff 87 	rex.WR inc QWORD PTR [rdi-0x7800b400]
   1408800ff:	00 4c ff 87          	add    BYTE PTR [rdi+rdi*8-0x79],cl
   140880103:	00 4c ff 87          	add    BYTE PTR [rdi+rdi*8-0x79],cl
   140880107:	00 9f f4 87 00 21    	add    BYTE PTR [rdi+0x210087f4],bl
   14088010d:	f7 87 00 4b fa 87 00 cc fc 87 	test   DWORD PTR [rdi-0x7805b500],0x87fccc00
   140880117:	00                   	.byte 0
