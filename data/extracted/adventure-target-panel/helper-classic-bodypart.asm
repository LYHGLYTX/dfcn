
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014132f540 <.text+0x132e540>:
   14132f540:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   14132f545:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
   14132f54a:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   14132f54f:	57                   	push   rdi
   14132f550:	48 83 ec 20          	sub    rsp,0x20
   14132f554:	49 63 f9             	movsxd rdi,r9d
   14132f557:	48 8b da             	mov    rbx,rdx
   14132f55a:	48 8b f1             	mov    rsi,rcx
   14132f55d:	66 45 85 c0          	test   r8w,r8w
   14132f561:	0f 88 e6 01 00 00    	js     0x14132f74d
   14132f567:	48 8b 81 f8 05 00 00 	mov    rax,QWORD PTR [rcx+0x5f8]
   14132f56e:	49 0f bf e8          	movsx  rbp,r8w
   14132f572:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14132f575:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   14132f579:	4c 2b c1             	sub    r8,rcx
   14132f57c:	49 c1 f8 03          	sar    r8,0x3
   14132f580:	49 3b e8             	cmp    rbp,r8
   14132f583:	0f 83 c4 01 00 00    	jae    0x14132f74d
   14132f589:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   14132f58d:	48 8b 88 98 00 00 00 	mov    rcx,QWORD PTR [rax+0x98]
   14132f594:	48 2b 88 90 00 00 00 	sub    rcx,QWORD PTR [rax+0x90]
   14132f59b:	48 c1 f9 03          	sar    rcx,0x3
   14132f59f:	48 85 c9             	test   rcx,rcx
   14132f5a2:	0f 84 32 01 00 00    	je     0x14132f6da
   14132f5a8:	45 85 c9             	test   r9d,r9d
   14132f5ab:	7e 6b                	jle    0x14132f618
   14132f5ad:	48 3b cf             	cmp    rcx,rdi
   14132f5b0:	76 66                	jbe    0x14132f618
   14132f5b2:	66 83 7c 24 50 00    	cmp    WORD PTR [rsp+0x50],0x0
   14132f5b8:	75 2f                	jne    0x14132f5e9
   14132f5ba:	48 8b 80 a8 00 00 00 	mov    rax,QWORD PTR [rax+0xa8]
   14132f5c1:	48 8b 14 f8          	mov    rdx,QWORD PTR [rax+rdi*8]
   14132f5c5:	48 3b da             	cmp    rbx,rdx
   14132f5c8:	0f 84 a6 01 00 00    	je     0x14132f774
   14132f5ce:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f5d3:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f5d7:	76 03                	jbe    0x14132f5dc
   14132f5d9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f5dc:	48 8b cb             	mov    rcx,rbx
   14132f5df:	e8 7c 02 d4 fe       	call   0x14006f860
   14132f5e4:	e9 8b 01 00 00       	jmp    0x14132f774
   14132f5e9:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
   14132f5f0:	48 8b 14 f8          	mov    rdx,QWORD PTR [rax+rdi*8]
   14132f5f4:	48 3b da             	cmp    rbx,rdx
   14132f5f7:	0f 84 77 01 00 00    	je     0x14132f774
   14132f5fd:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f602:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f606:	76 03                	jbe    0x14132f60b
   14132f608:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f60b:	48 8b cb             	mov    rcx,rbx
   14132f60e:	e8 4d 02 d4 fe       	call   0x14006f860
   14132f613:	e9 5c 01 00 00       	jmp    0x14132f774
   14132f618:	48 c7 42 10 00 00 00 	mov    QWORD PTR [rdx+0x10],0x0
   14132f61f:	00 
   14132f620:	48 8b c3             	mov    rax,rbx
   14132f623:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f628:	76 03                	jbe    0x14132f62d
   14132f62a:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14132f62d:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14132f630:	45 85 c9             	test   r9d,r9d
   14132f633:	7e 14                	jle    0x14132f649
   14132f635:	45 33 c0             	xor    r8d,r8d
   14132f638:	8b cf                	mov    ecx,edi
   14132f63a:	e8 51 cf 1f ff       	call   0x14052c590
   14132f63f:	b2 20                	mov    dl,0x20
   14132f641:	48 8b cb             	mov    rcx,rbx
   14132f644:	e8 c7 a4 d8 fe       	call   0x1400b9b10
   14132f649:	0f b7 54 24 50       	movzx  edx,WORD PTR [rsp+0x50]
   14132f64e:	66 85 d2             	test   dx,dx
   14132f651:	74 54                	je     0x14132f6a7
   14132f653:	85 ff                	test   edi,edi
   14132f655:	75 1d                	jne    0x14132f674
   14132f657:	48 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [rsi+0x5f8]
   14132f65e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14132f661:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   14132f665:	83 b8 84 00 00 00 01 	cmp    DWORD PTR [rax+0x84],0x1
   14132f66c:	7e 06                	jle    0x14132f674
   14132f66e:	66 83 fa 02          	cmp    dx,0x2
   14132f672:	74 33                	je     0x14132f6a7
   14132f674:	48 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [rsi+0x5f8]
   14132f67b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14132f67e:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   14132f682:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
   14132f689:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   14132f68c:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f691:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f695:	76 03                	jbe    0x14132f69a
   14132f697:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f69a:	48 8b cb             	mov    rcx,rbx
   14132f69d:	e8 fe 02 d4 fe       	call   0x14006f9a0
   14132f6a2:	e9 cd 00 00 00       	jmp    0x14132f774
   14132f6a7:	48 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [rsi+0x5f8]
   14132f6ae:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14132f6b1:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   14132f6b5:	48 8b 88 a8 00 00 00 	mov    rcx,QWORD PTR [rax+0xa8]
   14132f6bc:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   14132f6bf:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f6c4:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132f6c8:	76 03                	jbe    0x14132f6cd
   14132f6ca:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132f6cd:	48 8b cb             	mov    rcx,rbx
   14132f6d0:	e8 cb 02 d4 fe       	call   0x14006f9a0
   14132f6d5:	e9 9a 00 00 00       	jmp    0x14132f774
   14132f6da:	48 c7 42 10 00 00 00 	mov    QWORD PTR [rdx+0x10],0x0
   14132f6e1:	00 
   14132f6e2:	48 8b c3             	mov    rax,rbx
   14132f6e5:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132f6ea:	76 03                	jbe    0x14132f6ef
   14132f6ec:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14132f6ef:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14132f6f2:	45 85 c9             	test   r9d,r9d
   14132f6f5:	7e 14                	jle    0x14132f70b
   14132f6f7:	45 33 c0             	xor    r8d,r8d
   14132f6fa:	8b cf                	mov    ecx,edi
   14132f6fc:	e8 8f ce 1f ff       	call   0x14052c590
   14132f701:	b2 20                	mov    dl,0x20
   14132f703:	48 8b cb             	mov    rcx,rbx
   14132f706:	e8 05 a4 d8 fe       	call   0x1400b9b10
   14132f70b:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132f711:	48 8d 15 d8 c6 34 00 	lea    rdx,[rip+0x34c6d8]        # 0x14167bdf0
   14132f718:	48 8b cb             	mov    rcx,rbx
   14132f71b:	e8 80 02 d4 fe       	call   0x14006f9a0
   14132f720:	0f b7 54 24 50       	movzx  edx,WORD PTR [rsp+0x50]
   14132f725:	66 85 d2             	test   dx,dx
   14132f728:	74 40                	je     0x14132f76a
   14132f72a:	85 ff                	test   edi,edi
   14132f72c:	75 46                	jne    0x14132f774
   14132f72e:	48 8b 86 f8 05 00 00 	mov    rax,QWORD PTR [rsi+0x5f8]
   14132f735:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14132f738:	48 8b 04 e9          	mov    rax,QWORD PTR [rcx+rbp*8]
   14132f73c:	83 b8 84 00 00 00 01 	cmp    DWORD PTR [rax+0x84],0x1
   14132f743:	7e 2f                	jle    0x14132f774
   14132f745:	66 83 fa 02          	cmp    dx,0x2
   14132f749:	74 1f                	je     0x14132f76a
   14132f74b:	eb 27                	jmp    0x14132f774
   14132f74d:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132f753:	48 8d 15 96 c6 34 00 	lea    rdx,[rip+0x34c696]        # 0x14167bdf0
   14132f75a:	48 8b cb             	mov    rcx,rbx
   14132f75d:	e8 fe 00 d4 fe       	call   0x14006f860
   14132f762:	66 83 7c 24 50 00    	cmp    WORD PTR [rsp+0x50],0x0
   14132f768:	75 0a                	jne    0x14132f774
   14132f76a:	b2 73                	mov    dl,0x73
   14132f76c:	48 8b cb             	mov    rcx,rbx
   14132f76f:	e8 9c a3 d8 fe       	call   0x1400b9b10
   14132f774:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14132f779:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
   14132f77e:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   14132f783:	48 83 c4 20          	add    rsp,0x20
   14132f787:	5f                   	pop    rdi
   14132f788:	c3                   	ret
