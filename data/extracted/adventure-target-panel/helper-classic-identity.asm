
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

00000001413293a0 <.text+0x13283a0>:
   1413293a0:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   1413293a5:	55                   	push   rbp
   1413293a6:	56                   	push   rsi
   1413293a7:	57                   	push   rdi
   1413293a8:	41 54                	push   r12
   1413293aa:	41 55                	push   r13
   1413293ac:	41 56                	push   r14
   1413293ae:	41 57                	push   r15
   1413293b0:	48 8d 6c 24 e1       	lea    rbp,[rsp-0x1f]
   1413293b5:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
   1413293bc:	48 8b 05 7d cc 56 00 	mov    rax,QWORD PTR [rip+0x56cc7d]        # 0x141896040
   1413293c3:	48 33 c4             	xor    rax,rsp
   1413293c6:	48 89 45 0f          	mov    QWORD PTR [rbp+0xf],rax
   1413293ca:	41 0f b6 d9          	movzx  ebx,r9b
   1413293ce:	88 5c 24 40          	mov    BYTE PTR [rsp+0x40],bl
   1413293d2:	45 8b f8             	mov    r15d,r8d
   1413293d5:	44 89 44 24 44       	mov    DWORD PTR [rsp+0x44],r8d
   1413293da:	48 8b f2             	mov    rsi,rdx
   1413293dd:	48 89 55 8f          	mov    QWORD PTR [rbp-0x71],rdx
   1413293e1:	4c 8b f1             	mov    r14,rcx
   1413293e4:	4c 8b 15 15 5c 0b 01 	mov    r10,QWORD PTR [rip+0x10b5c15]        # 0x1423df000
   1413293eb:	48 8b 0d ce 5b 0b 01 	mov    rcx,QWORD PTR [rip+0x10b5bce]        # 0x1423defc0
   1413293f2:	4c 8b 1d bf 5b 0b 01 	mov    r11,QWORD PTR [rip+0x10b5bbf]        # 0x1423defb8
   1413293f9:	44 8b 0d 68 ce 56 00 	mov    r9d,DWORD PTR [rip+0x56ce68]        # 0x141896268
   141329400:	41 83 f9 01          	cmp    r9d,0x1
   141329404:	75 40                	jne    0x141329446
   141329406:	48 8b c1             	mov    rax,rcx
   141329409:	49 2b c3             	sub    rax,r11
   14132940c:	48 c1 f8 03          	sar    rax,0x3
   141329410:	48 85 c0             	test   rax,rax
   141329413:	74 31                	je     0x141329446
   141329415:	4d 85 d2             	test   r10,r10
   141329418:	74 2c                	je     0x141329446
   14132941a:	4d 3b f2             	cmp    r14,r10
   14132941d:	75 27                	jne    0x141329446
   14132941f:	48 8d 05 92 e0 2b 00 	lea    rax,[rip+0x2be092]        # 0x1415e74b8
   141329426:	48 8d 15 13 a8 2b 00 	lea    rdx,[rip+0x2ba813]        # 0x1415e3c40
   14132942d:	84 db                	test   bl,bl
   14132942f:	48 0f 44 d0          	cmove  rdx,rax
   141329433:	41 b8 03 00 00 00    	mov    r8d,0x3
   141329439:	48 8b ce             	mov    rcx,rsi
   14132943c:	e8 1f 64 d4 fe       	call   0x14006f860
   141329441:	e9 74 14 00 00       	jmp    0x14132a8ba
   141329446:	49 8b 96 80 0d 00 00 	mov    rdx,QWORD PTR [r14+0xd80]
   14132944d:	48 85 d2             	test   rdx,rdx
   141329450:	74 10                	je     0x141329462
   141329452:	48 83 7a 30 00       	cmp    QWORD PTR [rdx+0x30],0x0
   141329457:	74 09                	je     0x141329462
   141329459:	48 83 c2 20          	add    rdx,0x20
   14132945d:	e9 31 14 00 00       	jmp    0x14132a893
   141329462:	8b 05 2c ce 56 00    	mov    eax,DWORD PTR [rip+0x56ce2c]        # 0x141896294
   141329468:	83 c0 fc             	add    eax,0xfffffffc
   14132946b:	83 f8 01             	cmp    eax,0x1
   14132946e:	0f 86 1b 14 00 00    	jbe    0x14132a88f
   141329474:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   14132947a:	41 83 f9 01          	cmp    r9d,0x1
   14132947e:	0f 85 ed 07 00 00    	jne    0x141329c71
   141329484:	49 2b cb             	sub    rcx,r11
   141329487:	48 c1 f9 03          	sar    rcx,0x3
   14132948b:	48 85 c9             	test   rcx,rcx
   14132948e:	0f 84 dd 07 00 00    	je     0x141329c71
   141329494:	4d 85 d2             	test   r10,r10
   141329497:	0f 84 d4 07 00 00    	je     0x141329c71
   14132949d:	4d 8d 7e 08          	lea    r15,[r14+0x8]
   1413294a1:	4c 89 7c 24 48       	mov    QWORD PTR [rsp+0x48],r15
   1413294a6:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   1413294ad:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   1413294b4:	48 8d 0d ed a6 1c 01 	lea    rcx,[rip+0x11ca6ed]        # 0x1424f3ba8
   1413294bb:	e8 30 6c 82 ff       	call   0x140b500f0
   1413294c0:	48 89 45 97          	mov    QWORD PTR [rbp-0x69],rax
   1413294c4:	48 85 c0             	test   rax,rax
   1413294c7:	74 56                	je     0x14132951f
   1413294c9:	48 8b 88 30 01 00 00 	mov    rcx,QWORD PTR [rax+0x130]
   1413294d0:	48 85 c9             	test   rcx,rcx
   1413294d3:	75 05                	jne    0x1413294da
   1413294d5:	45 33 e4             	xor    r12d,r12d
   1413294d8:	eb 2a                	jmp    0x141329504
   1413294da:	48 8b 41 58          	mov    rax,QWORD PTR [rcx+0x58]
   1413294de:	48 85 c0             	test   rax,rax
   1413294e1:	75 05                	jne    0x1413294e8
   1413294e3:	45 33 e4             	xor    r12d,r12d
   1413294e6:	eb 1c                	jmp    0x141329504
   1413294e8:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
   1413294eb:	41 3b d5             	cmp    edx,r13d
   1413294ee:	75 05                	jne    0x1413294f5
   1413294f0:	45 33 e4             	xor    r12d,r12d
   1413294f3:	eb 0f                	jmp    0x141329504
   1413294f5:	48 8d 0d dc 86 1b 01 	lea    rcx,[rip+0x11b86dc]        # 0x1424e1bd8
   1413294fc:	e8 ff 8f d4 fe       	call   0x140072500
   141329501:	4c 8b e0             	mov    r12,rax
   141329504:	4c 89 65 87          	mov    QWORD PTR [rbp-0x79],r12
   141329508:	4d 85 e4             	test   r12,r12
   14132950b:	74 19                	je     0x141329526
   14132950d:	49 8b cc             	mov    rcx,r12
   141329510:	e8 1b e0 90 ff       	call   0x140c37530
   141329515:	4c 8b c8             	mov    r9,rax
   141329518:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   14132951d:	eb 0a                	jmp    0x141329529
   14132951f:	45 33 e4             	xor    r12d,r12d
   141329522:	4c 89 65 87          	mov    QWORD PTR [rbp-0x79],r12
   141329526:	4d 8b cf             	mov    r9,r15
   141329529:	41 80 79 72 00       	cmp    BYTE PTR [r9+0x72],0x0
   14132952e:	0f 84 38 07 00 00    	je     0x141329c6c
   141329534:	83 3d 59 cd 56 00 01 	cmp    DWORD PTR [rip+0x56cd59],0x1        # 0x141896294
   14132953b:	0f 85 08 01 00 00    	jne    0x141329649
   141329541:	32 db                	xor    bl,bl
   141329543:	48 8b 15 b6 5a 0b 01 	mov    rdx,QWORD PTR [rip+0x10b5ab6]        # 0x1423df000
   14132954a:	4c 8d 82 74 12 00 00 	lea    r8,[rdx+0x1274]
   141329551:	8b 92 30 0c 00 00    	mov    edx,DWORD PTR [rdx+0xc30]
   141329557:	48 8d 0d 4a a6 1c 01 	lea    rcx,[rip+0x11ca64a]        # 0x1424f3ba8
   14132955e:	e8 8d 6b 82 ff       	call   0x140b500f0
   141329563:	48 8b f8             	mov    rdi,rax
   141329566:	48 85 c0             	test   rax,rax
   141329569:	0f 84 cd 00 00 00    	je     0x14132963c
   14132956f:	41 8b 8e 30 0c 00 00 	mov    ecx,DWORD PTR [r14+0xc30]
   141329576:	41 3b cd             	cmp    ecx,r13d
   141329579:	74 68                	je     0x1413295e3
   14132957b:	48 8b 90 30 01 00 00 	mov    rdx,QWORD PTR [rax+0x130]
   141329582:	48 85 d2             	test   rdx,rdx
   141329585:	74 5c                	je     0x1413295e3
   141329587:	48 83 7a 60 00       	cmp    QWORD PTR [rdx+0x60],0x0
   14132958c:	74 55                	je     0x1413295e3
   14132958e:	48 8b 52 60          	mov    rdx,QWORD PTR [rdx+0x60]
   141329592:	e8 b9 07 d9 fe       	call   0x1400b9d50
   141329597:	48 85 c0             	test   rax,rax
   14132959a:	74 47                	je     0x1413295e3
   14132959c:	f6 40 04 01          	test   BYTE PTR [rax+0x4],0x1
   1413295a0:	0f 85 8a 00 00 00    	jne    0x141329630
   1413295a6:	4d 85 e4             	test   r12,r12
   1413295a9:	74 38                	je     0x1413295e3
   1413295ab:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1413295af:	45 8b 04 24          	mov    r8d,DWORD PTR [r12]
   1413295b3:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   1413295b7:	e8 b4 15 d9 fe       	call   0x1400bab70
   1413295bc:	44 89 6c 24 50       	mov    DWORD PTR [rsp+0x50],r13d
   1413295c1:	c7 45 83 00 00 00 00 	mov    DWORD PTR [rbp-0x7d],0x0
   1413295c8:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   1413295cd:	38 5d a7             	cmp    BYTE PTR [rbp-0x59],bl
   1413295d0:	48 0f 45 45 9f       	cmovne rax,QWORD PTR [rbp-0x61]
   1413295d5:	0f b6 db             	movzx  ebx,bl
   1413295d8:	41 3b c5             	cmp    eax,r13d
   1413295db:	b8 01 00 00 00       	mov    eax,0x1
   1413295e0:	0f 45 d8             	cmovne ebx,eax
   1413295e3:	45 8b 86 4c 01 00 00 	mov    r8d,DWORD PTR [r14+0x14c]
   1413295ea:	45 3b c5             	cmp    r8d,r13d
   1413295ed:	74 4d                	je     0x14132963c
   1413295ef:	48 8b 87 30 01 00 00 	mov    rax,QWORD PTR [rdi+0x130]
   1413295f6:	48 85 c0             	test   rax,rax
   1413295f9:	74 41                	je     0x14132963c
   1413295fb:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
   1413295ff:	48 85 d2             	test   rdx,rdx
   141329602:	74 38                	je     0x14132963c
   141329604:	48 83 c2 48          	add    rdx,0x48
   141329608:	48 8d 4d 9f          	lea    rcx,[rbp-0x61]
   14132960c:	e8 5f 15 d9 fe       	call   0x1400bab70
   141329611:	44 89 6c 24 50       	mov    DWORD PTR [rsp+0x50],r13d
   141329616:	c7 45 83 00 00 00 00 	mov    DWORD PTR [rbp-0x7d],0x0
   14132961d:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   141329622:	80 7d a7 00          	cmp    BYTE PTR [rbp-0x59],0x0
   141329626:	48 0f 45 45 9f       	cmovne rax,QWORD PTR [rbp-0x61]
   14132962b:	41 3b c5             	cmp    eax,r13d
   14132962e:	74 0c                	je     0x14132963c
   141329630:	4d 8b cf             	mov    r9,r15
   141329633:	4c 89 7c 24 48       	mov    QWORD PTR [rsp+0x48],r15
   141329638:	b3 01                	mov    bl,0x1
   14132963a:	eb 05                	jmp    0x141329641
   14132963c:	4c 8b 4c 24 48       	mov    r9,QWORD PTR [rsp+0x48]
   141329641:	84 db                	test   bl,bl
   141329643:	0f 84 23 06 00 00    	je     0x141329c6c
   141329649:	45 32 ff             	xor    r15b,r15b
   14132964c:	45 8b ae d0 03 00 00 	mov    r13d,DWORD PTR [r14+0x3d0]
   141329653:	48 8b 05 a6 59 0b 01 	mov    rax,QWORD PTR [rip+0x10b59a6]        # 0x1423df000
   14132965a:	44 8b a0 30 01 00 00 	mov    r12d,DWORD PTR [rax+0x130]
   141329661:	45 3b ec             	cmp    r13d,r12d
   141329664:	0f 84 8e 07 00 00    	je     0x141329df8
   14132966a:	45 8b 86 30 0c 00 00 	mov    r8d,DWORD PTR [r14+0xc30]
   141329671:	48 8b 05 98 9e 31 01 	mov    rax,QWORD PTR [rip+0x1319e98]        # 0x142643510
   141329678:	48 8b 0d 99 9e 31 01 	mov    rcx,QWORD PTR [rip+0x1319e99]        # 0x142643518
   14132967f:	48 8b d0             	mov    rdx,rax
   141329682:	48 3b c1             	cmp    rax,rcx
   141329685:	73 6d                	jae    0x1413296f4
   141329687:	44 39 00             	cmp    DWORD PTR [rax],r8d
   14132968a:	74 06                	je     0x141329692
   14132968c:	48 83 c0 04          	add    rax,0x4
   141329690:	eb f0                	jmp    0x141329682
   141329692:	48 2b c2             	sub    rax,rdx
   141329695:	48 c1 f8 02          	sar    rax,0x2
   141329699:	83 f8 ff             	cmp    eax,0xffffffff
   14132969c:	74 56                	je     0x1413296f4
   14132969e:	48 8b 1d 53 9e 31 01 	mov    rbx,QWORD PTR [rip+0x1319e53]        # 0x1426434f8
   1413296a5:	48 8b 3d 54 9e 31 01 	mov    rdi,QWORD PTR [rip+0x1319e54]        # 0x142643500
   1413296ac:	be 01 00 00 00       	mov    esi,0x1
   1413296b1:	48 3b df             	cmp    rbx,rdi
   1413296b4:	73 31                	jae    0x1413296e7
   1413296b6:	8b 13                	mov    edx,DWORD PTR [rbx]
   1413296b8:	48 8d 0d e1 58 0b 01 	lea    rcx,[rip+0x10b58e1]        # 0x1423defa0
   1413296bf:	e8 7c dd 09 00       	call   0x1413c7440
   1413296c4:	48 85 c0             	test   rax,rax
   1413296c7:	74 18                	je     0x1413296e1
   1413296c9:	44 39 a0 d0 03 00 00 	cmp    DWORD PTR [rax+0x3d0],r12d
   1413296d0:	75 0f                	jne    0x1413296e1
   1413296d2:	45 0f b6 ff          	movzx  r15d,r15b
   1413296d6:	44 3b a8 30 01 00 00 	cmp    r13d,DWORD PTR [rax+0x130]
   1413296dd:	44 0f 44 fe          	cmove  r15d,esi
   1413296e1:	48 83 c3 04          	add    rbx,0x4
   1413296e5:	eb ca                	jmp    0x1413296b1
   1413296e7:	45 84 ff             	test   r15b,r15b
   1413296ea:	48 8b 75 8f          	mov    rsi,QWORD PTR [rbp-0x71]
   1413296ee:	0f 85 ff 06 00 00    	jne    0x141329df3
   1413296f4:	0f 57 c0             	xorps  xmm0,xmm0
   1413296f7:	0f 11 45 af          	movups XMMWORD PTR [rbp-0x51],xmm0
   1413296fb:	48 c7 45 bf 00 00 00 	mov    QWORD PTR [rbp-0x41],0x0
   141329702:	00 
   141329703:	48 c7 45 c7 0f 00 00 	mov    QWORD PTR [rbp-0x39],0xf
   14132970a:	00 
   14132970b:	c6 45 af 00          	mov    BYTE PTR [rbp-0x51],0x0
   14132970f:	49 83 be 80 0d 00 00 	cmp    QWORD PTR [r14+0xd80],0x0
   141329716:	00 
   141329717:	75 16                	jne    0x14132972f
   141329719:	41 80 be 38 08 00 00 	cmp    BYTE PTR [r14+0x838],0x0
   141329720:	00 
   141329721:	75 0c                	jne    0x14132972f
   141329723:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   141329728:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14132972d:	eb 07                	jmp    0x141329736
   14132972f:	bb ff ff ff ff       	mov    ebx,0xffffffff
   141329734:	8b c3                	mov    eax,ebx
   141329736:	4d 8b ee             	mov    r13,r14
   141329739:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   14132973e:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   141329743:	c6 44 24 20 00       	mov    BYTE PTR [rsp+0x20],0x0
   141329748:	45 0f b7 8e 2c 01 00 	movzx  r9d,WORD PTR [r14+0x12c]
   14132974f:	00 
   141329750:	45 0f b7 86 a4 00 00 	movzx  r8d,WORD PTR [r14+0xa4]
   141329757:	00 
   141329758:	41 0f b7 96 a0 00 00 	movzx  edx,WORD PTR [r14+0xa0]
   14132975f:	00 
   141329760:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   141329764:	e8 c7 f8 ff ff       	call   0x141329030
   141329769:	48 8b 45 87          	mov    rax,QWORD PTR [rbp-0x79]
   14132976d:	48 85 c0             	test   rax,rax
   141329770:	74 0e                	je     0x141329780
   141329772:	66 83 b8 ac 00 00 00 	cmp    WORD PTR [rax+0xac],0xffff
   141329779:	ff 
   14132977a:	0f 85 eb 03 00 00    	jne    0x141329b6b
   141329780:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   141329787:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132978e:	48 8d 0d 13 a4 1c 01 	lea    rcx,[rip+0x11ca413]        # 0x1424f3ba8
   141329795:	e8 56 69 82 ff       	call   0x140b500f0
   14132979a:	48 85 c0             	test   rax,rax
   14132979d:	0f 84 0d 01 00 00    	je     0x1413298b0
   1413297a3:	48 8d 4d 8f          	lea    rcx,[rbp-0x71]
   1413297a7:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   1413297ac:	4c 8d 4c 24 50       	lea    r9,[rsp+0x50]
   1413297b1:	4c 8d 44 24 41       	lea    r8,[rsp+0x41]
   1413297b6:	8b d3                	mov    edx,ebx
   1413297b8:	48 8b c8             	mov    rcx,rax
   1413297bb:	e8 a0 ee 8b ff       	call   0x140be8660
   1413297c0:	48 8b d8             	mov    rbx,rax
   1413297c3:	48 85 c0             	test   rax,rax
   1413297c6:	0f 84 e4 00 00 00    	je     0x1413298b0
   1413297cc:	48 8b 45 97          	mov    rax,QWORD PTR [rbp-0x69]
   1413297d0:	48 85 c0             	test   rax,rax
   1413297d3:	0f 84 d7 00 00 00    	je     0x1413298b0
   1413297d9:	0f be 50 06          	movsx  edx,BYTE PTR [rax+0x6]
   1413297dd:	80 7c 24 41 00       	cmp    BYTE PTR [rsp+0x41],0x0
   1413297e2:	74 4a                	je     0x14132982e
   1413297e4:	85 d2                	test   edx,edx
   1413297e6:	74 2a                	je     0x141329812
   1413297e8:	83 fa 01             	cmp    edx,0x1
   1413297eb:	74 09                	je     0x1413297f6
   1413297ed:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   1413297f4:	eb 7e                	jmp    0x141329874
   1413297f6:	48 83 bb e8 01 00 00 	cmp    QWORD PTR [rbx+0x1e8],0x0
   1413297fd:	00 
   1413297fe:	75 09                	jne    0x141329809
   141329800:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   141329807:	eb 6b                	jmp    0x141329874
   141329809:	48 8d 93 d8 01 00 00 	lea    rdx,[rbx+0x1d8]
   141329810:	eb 62                	jmp    0x141329874
   141329812:	48 83 bb a8 01 00 00 	cmp    QWORD PTR [rbx+0x1a8],0x0
   141329819:	00 
   14132981a:	75 09                	jne    0x141329825
   14132981c:	48 8d 93 58 01 00 00 	lea    rdx,[rbx+0x158]
   141329823:	eb 4f                	jmp    0x141329874
   141329825:	48 8d 93 98 01 00 00 	lea    rdx,[rbx+0x198]
   14132982c:	eb 46                	jmp    0x141329874
   14132982e:	85 d2                	test   edx,edx
   141329830:	74 2a                	je     0x14132985c
   141329832:	83 fa 01             	cmp    edx,0x1
   141329835:	74 09                	je     0x141329840
   141329837:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   14132983e:	eb 34                	jmp    0x141329874
   141329840:	48 83 bb 28 01 00 00 	cmp    QWORD PTR [rbx+0x128],0x0
   141329847:	00 
   141329848:	75 09                	jne    0x141329853
   14132984a:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   141329851:	eb 21                	jmp    0x141329874
   141329853:	48 8d 93 18 01 00 00 	lea    rdx,[rbx+0x118]
   14132985a:	eb 18                	jmp    0x141329874
   14132985c:	48 83 bb e8 00 00 00 	cmp    QWORD PTR [rbx+0xe8],0x0
   141329863:	00 
   141329864:	48 8d 93 98 00 00 00 	lea    rdx,[rbx+0x98]
   14132986b:	74 07                	je     0x141329874
   14132986d:	48 8d 93 d8 00 00 00 	lea    rdx,[rbx+0xd8]
   141329874:	48 8d 45 af          	lea    rax,[rbp-0x51]
   141329878:	48 3b c2             	cmp    rax,rdx
   14132987b:	74 17                	je     0x141329894
   14132987d:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141329881:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141329886:	76 03                	jbe    0x14132988b
   141329888:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132988b:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   14132988f:	e8 cc 5f d4 fe       	call   0x14006f860
   141329894:	66 83 bb c8 02 00 00 	cmp    WORD PTR [rbx+0x2c8],0x0
   14132989b:	00 
   14132989c:	7e 12                	jle    0x1413298b0
   14132989e:	4c 8d 45 af          	lea    r8,[rbp-0x51]
   1413298a2:	48 8b 55 8f          	mov    rdx,QWORD PTR [rbp-0x71]
   1413298a6:	48 8b 4c 24 50       	mov    rcx,QWORD PTR [rsp+0x50]
   1413298ab:	e8 30 1f 69 ff       	call   0x1409bb7e0
   1413298b0:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   1413298b7:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   1413298be:	48 8d 0d e3 a2 1c 01 	lea    rcx,[rip+0x11ca2e3]        # 0x1424f3ba8
   1413298c5:	e8 26 68 82 ff       	call   0x140b500f0
   1413298ca:	bb ff ff ff ff       	mov    ebx,0xffffffff
   1413298cf:	48 85 c0             	test   rax,rax
   1413298d2:	0f 84 24 01 00 00    	je     0x1413299fc
   1413298d8:	ba 04 00 00 00       	mov    edx,0x4
   1413298dd:	44 8b c3             	mov    r8d,ebx
   1413298e0:	48 8b c8             	mov    rcx,rax
   1413298e3:	e8 18 ab 86 ff       	call   0x140b94400
   1413298e8:	66 85 c0             	test   ax,ax
   1413298eb:	0f 8e 0b 01 00 00    	jle    0x1413299fc
   1413298f1:	41 0f b7 85 a0 00 00 	movzx  eax,WORD PTR [r13+0xa0]
   1413298f8:	00 
   1413298f9:	66 83 e8 67          	sub    ax,0x67
   1413298fd:	66 83 f8 01          	cmp    ax,0x1
   141329901:	77 22                	ja     0x141329925
   141329903:	48 83 7d bf 00       	cmp    QWORD PTR [rbp-0x41],0x0
   141329908:	74 1b                	je     0x141329925
   14132990a:	41 b8 06 00 00 00    	mov    r8d,0x6
   141329910:	48 8d 15 71 e0 2b 00 	lea    rdx,[rip+0x2be071]        # 0x1415e7988
   141329917:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   14132991b:	e8 80 60 d4 fe       	call   0x14006f9a0
   141329920:	e9 d7 00 00 00       	jmp    0x1413299fc
   141329925:	48 8b 7d c7          	mov    rdi,QWORD PTR [rbp-0x39]
   141329929:	48 83 ff 05          	cmp    rdi,0x5
   14132992d:	72 33                	jb     0x141329962
   14132992f:	48 8d 5d af          	lea    rbx,[rbp-0x51]
   141329933:	48 83 ff 0f          	cmp    rdi,0xf
   141329937:	48 0f 47 5d af       	cmova  rbx,QWORD PTR [rbp-0x51]
   14132993c:	48 c7 45 bf 05 00 00 	mov    QWORD PTR [rbp-0x41],0x5
   141329943:	00 
   141329944:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132994a:	48 8d 15 5b e0 2b 00 	lea    rdx,[rip+0x2be05b]        # 0x1415e79ac
   141329951:	48 8b cb             	mov    rcx,rbx
   141329954:	e8 31 c4 20 00       	call   0x141535d8a
   141329959:	c6 43 05 00          	mov    BYTE PTR [rbx+0x5],0x0
   14132995d:	e9 95 00 00 00       	jmp    0x1413299f7
   141329962:	48 8b cf             	mov    rcx,rdi
   141329965:	48 d1 e9             	shr    rcx,1
   141329968:	48 bb ff ff ff ff ff 	movabs rbx,0x7fffffffffffffff
   14132996f:	ff ff 7f 
   141329972:	48 8b c3             	mov    rax,rbx
   141329975:	48 2b c1             	sub    rax,rcx
   141329978:	48 3b f8             	cmp    rdi,rax
   14132997b:	77 10                	ja     0x14132998d
   14132997d:	48 8d 04 39          	lea    rax,[rcx+rdi*1]
   141329981:	bb 0f 00 00 00       	mov    ebx,0xf
   141329986:	48 3b c3             	cmp    rax,rbx
   141329989:	48 0f 47 d8          	cmova  rbx,rax
   14132998d:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   141329991:	e8 ca 6d d4 fe       	call   0x140070760
   141329996:	4c 8b f8             	mov    r15,rax
   141329999:	48 c7 45 bf 05 00 00 	mov    QWORD PTR [rbp-0x41],0x5
   1413299a0:	00 
   1413299a1:	48 89 5d c7          	mov    QWORD PTR [rbp-0x39],rbx
   1413299a5:	8b 0d 01 e0 2b 00    	mov    ecx,DWORD PTR [rip+0x2be001]        # 0x1415e79ac
   1413299ab:	89 08                	mov    DWORD PTR [rax],ecx
   1413299ad:	0f b6 0d fc df 2b 00 	movzx  ecx,BYTE PTR [rip+0x2bdffc]        # 0x1415e79b0
   1413299b4:	88 48 04             	mov    BYTE PTR [rax+0x4],cl
   1413299b7:	c6 40 05 00          	mov    BYTE PTR [rax+0x5],0x0
   1413299bb:	48 83 ff 0f          	cmp    rdi,0xf
   1413299bf:	76 32                	jbe    0x1413299f3
   1413299c1:	48 8d 57 01          	lea    rdx,[rdi+0x1]
   1413299c5:	48 8b 4d af          	mov    rcx,QWORD PTR [rbp-0x51]
   1413299c9:	48 8b c1             	mov    rax,rcx
   1413299cc:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1413299d3:	72 19                	jb     0x1413299ee
   1413299d5:	48 83 c2 27          	add    rdx,0x27
   1413299d9:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1413299dd:	48 2b c1             	sub    rax,rcx
   1413299e0:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1413299e4:	48 83 f8 1f          	cmp    rax,0x1f
   1413299e8:	0f 87 a0 03 00 00    	ja     0x141329d8e
   1413299ee:	e8 fd ab 20 00       	call   0x1415345f0
   1413299f3:	4c 89 7d af          	mov    QWORD PTR [rbp-0x51],r15
   1413299f7:	bb ff ff ff ff       	mov    ebx,0xffffffff
   1413299fc:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   141329a03:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   141329a0a:	48 8d 0d 97 a1 1c 01 	lea    rcx,[rip+0x11ca197]        # 0x1424f3ba8
   141329a11:	e8 da 66 82 ff       	call   0x140b500f0
   141329a16:	48 85 c0             	test   rax,rax
   141329a19:	74 15                	je     0x141329a30
   141329a1b:	ba 06 00 00 00       	mov    edx,0x6
   141329a20:	44 8b c3             	mov    r8d,ebx
   141329a23:	48 8b c8             	mov    rcx,rax
   141329a26:	e8 d5 a9 86 ff       	call   0x140b94400
   141329a2b:	66 85 c0             	test   ax,ax
   141329a2e:	7f 3c                	jg     0x141329a6c
   141329a30:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   141329a37:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   141329a3e:	48 8d 0d 63 a1 1c 01 	lea    rcx,[rip+0x11ca163]        # 0x1424f3ba8
   141329a45:	e8 a6 66 82 ff       	call   0x140b500f0
   141329a4a:	48 85 c0             	test   rax,rax
   141329a4d:	0f 84 18 01 00 00    	je     0x141329b6b
   141329a53:	ba 07 00 00 00       	mov    edx,0x7
   141329a58:	44 8b c3             	mov    r8d,ebx
   141329a5b:	48 8b c8             	mov    rcx,rax
   141329a5e:	e8 6d c3 86 ff       	call   0x140b95dd0
   141329a63:	66 85 c0             	test   ax,ax
   141329a66:	0f 8e ff 00 00 00    	jle    0x141329b6b
   141329a6c:	41 0f b7 85 a0 00 00 	movzx  eax,WORD PTR [r13+0xa0]
   141329a73:	00 
   141329a74:	66 83 e8 67          	sub    ax,0x67
   141329a78:	66 83 f8 01          	cmp    ax,0x1
   141329a7c:	77 22                	ja     0x141329aa0
   141329a7e:	48 83 7d bf 00       	cmp    QWORD PTR [rbp-0x41],0x0
   141329a83:	74 1b                	je     0x141329aa0
   141329a85:	41 b8 09 00 00 00    	mov    r8d,0x9
   141329a8b:	48 8d 15 be 2e 45 00 	lea    rdx,[rip+0x452ebe]        # 0x14177c950
   141329a92:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   141329a96:	e8 05 5f d4 fe       	call   0x14006f9a0
   141329a9b:	e9 cb 00 00 00       	jmp    0x141329b6b
   141329aa0:	48 8b 5d c7          	mov    rbx,QWORD PTR [rbp-0x39]
   141329aa4:	48 83 fb 08          	cmp    rbx,0x8
   141329aa8:	72 2b                	jb     0x141329ad5
   141329aaa:	48 8d 45 af          	lea    rax,[rbp-0x51]
   141329aae:	48 83 fb 0f          	cmp    rbx,0xf
   141329ab2:	48 0f 47 45 af       	cmova  rax,QWORD PTR [rbp-0x51]
   141329ab7:	48 c7 45 bf 08 00 00 	mov    QWORD PTR [rbp-0x41],0x8
   141329abe:	00 
   141329abf:	48 b9 70 72 69 73 6f 	movabs rcx,0x72656e6f73697270
   141329ac6:	6e 65 72 
   141329ac9:	48 89 08             	mov    QWORD PTR [rax],rcx
   141329acc:	c6 40 08 00          	mov    BYTE PTR [rax+0x8],0x0
   141329ad0:	e9 96 00 00 00       	jmp    0x141329b6b
   141329ad5:	48 8b cb             	mov    rcx,rbx
   141329ad8:	48 d1 e9             	shr    rcx,1
   141329adb:	48 ba ff ff ff ff ff 	movabs rdx,0x7fffffffffffffff
   141329ae2:	ff ff 7f 
   141329ae5:	48 8b c2             	mov    rax,rdx
   141329ae8:	48 2b c1             	sub    rax,rcx
   141329aeb:	48 3b d8             	cmp    rbx,rax
   141329aee:	76 05                	jbe    0x141329af5
   141329af0:	48 8b fa             	mov    rdi,rdx
   141329af3:	eb 10                	jmp    0x141329b05
   141329af5:	48 8d 04 19          	lea    rax,[rcx+rbx*1]
   141329af9:	bf 0f 00 00 00       	mov    edi,0xf
   141329afe:	48 3b c7             	cmp    rax,rdi
   141329b01:	48 0f 47 f8          	cmova  rdi,rax
   141329b05:	48 8d 4f 01          	lea    rcx,[rdi+0x1]
   141329b09:	e8 52 6c d4 fe       	call   0x140070760
   141329b0e:	4c 8b f8             	mov    r15,rax
   141329b11:	48 c7 45 bf 08 00 00 	mov    QWORD PTR [rbp-0x41],0x8
   141329b18:	00 
   141329b19:	48 89 7d c7          	mov    QWORD PTR [rbp-0x39],rdi
   141329b1d:	48 b8 70 72 69 73 6f 	movabs rax,0x72656e6f73697270
   141329b24:	6e 65 72 
   141329b27:	49 89 07             	mov    QWORD PTR [r15],rax
   141329b2a:	41 c6 47 08 00       	mov    BYTE PTR [r15+0x8],0x0
   141329b2f:	48 83 fb 0f          	cmp    rbx,0xf
   141329b33:	76 32                	jbe    0x141329b67
   141329b35:	48 8d 53 01          	lea    rdx,[rbx+0x1]
   141329b39:	48 8b 4d af          	mov    rcx,QWORD PTR [rbp-0x51]
   141329b3d:	48 8b c1             	mov    rax,rcx
   141329b40:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141329b47:	72 19                	jb     0x141329b62
   141329b49:	48 83 c2 27          	add    rdx,0x27
   141329b4d:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141329b51:	48 2b c1             	sub    rax,rcx
   141329b54:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141329b58:	48 83 f8 1f          	cmp    rax,0x1f
   141329b5c:	0f 87 2c 02 00 00    	ja     0x141329d8e
   141329b62:	e8 89 aa 20 00       	call   0x1415345f0
   141329b67:	4c 89 7d af          	mov    QWORD PTR [rbp-0x51],r15
   141329b6b:	49 83 be 90 00 00 00 	cmp    QWORD PTR [r14+0x90],0x0
   141329b72:	00 
   141329b73:	74 2d                	je     0x141329ba2
   141329b75:	80 7d 7f 00          	cmp    BYTE PTR [rbp+0x7f],0x0
   141329b79:	74 27                	je     0x141329ba2
   141329b7b:	49 8d 96 80 00 00 00 	lea    rdx,[r14+0x80]
   141329b82:	48 8d 45 af          	lea    rax,[rbp-0x51]
   141329b86:	48 3b c2             	cmp    rax,rdx
   141329b89:	74 17                	je     0x141329ba2
   141329b8b:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   141329b8f:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   141329b94:	76 03                	jbe    0x141329b99
   141329b96:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   141329b99:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   141329b9d:	e8 be 5c d4 fe       	call   0x14006f860
   141329ba2:	0f 57 c0             	xorps  xmm0,xmm0
   141329ba5:	0f 11 45 ef          	movups XMMWORD PTR [rbp-0x11],xmm0
   141329ba9:	48 c7 45 ff 00 00 00 	mov    QWORD PTR [rbp-0x1],0x0
   141329bb0:	00 
   141329bb1:	48 c7 45 07 0f 00 00 	mov    QWORD PTR [rbp+0x7],0xf
   141329bb8:	00 
   141329bb9:	c6 45 ef 00          	mov    BYTE PTR [rbp-0x11],0x0
   141329bbd:	48 8d 55 ef          	lea    rdx,[rbp-0x11]
   141329bc1:	48 8b 4c 24 48       	mov    rcx,QWORD PTR [rsp+0x48]
   141329bc6:	e8 e5 74 76 ff       	call   0x140a910b0
   141329bcb:	4c 8b 45 ff          	mov    r8,QWORD PTR [rbp-0x1]
   141329bcf:	4d 85 c0             	test   r8,r8
   141329bd2:	0f 85 de 00 00 00    	jne    0x141329cb6
   141329bd8:	4c 39 45 bf          	cmp    QWORD PTR [rbp-0x41],r8
   141329bdc:	0f 85 04 01 00 00    	jne    0x141329ce6
   141329be2:	48 8b 55 07          	mov    rdx,QWORD PTR [rbp+0x7]
   141329be6:	48 83 fa 0f          	cmp    rdx,0xf
   141329bea:	76 31                	jbe    0x141329c1d
   141329bec:	48 ff c2             	inc    rdx
   141329bef:	48 8b 4d ef          	mov    rcx,QWORD PTR [rbp-0x11]
   141329bf3:	48 8b c1             	mov    rax,rcx
   141329bf6:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141329bfd:	72 19                	jb     0x141329c18
   141329bff:	48 83 c2 27          	add    rdx,0x27
   141329c03:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141329c07:	48 2b c1             	sub    rax,rcx
   141329c0a:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141329c0e:	48 83 f8 1f          	cmp    rax,0x1f
   141329c12:	0f 87 76 01 00 00    	ja     0x141329d8e
   141329c18:	e8 d3 a9 20 00       	call   0x1415345f0
   141329c1d:	48 c7 45 ff 00 00 00 	mov    QWORD PTR [rbp-0x1],0x0
   141329c24:	00 
   141329c25:	48 c7 45 07 0f 00 00 	mov    QWORD PTR [rbp+0x7],0xf
   141329c2c:	00 
   141329c2d:	c6 45 ef 00          	mov    BYTE PTR [rbp-0x11],0x0
   141329c31:	48 8b 55 c7          	mov    rdx,QWORD PTR [rbp-0x39]
   141329c35:	48 83 fa 0f          	cmp    rdx,0xf
   141329c39:	76 31                	jbe    0x141329c6c
   141329c3b:	48 ff c2             	inc    rdx
   141329c3e:	48 8b 4d af          	mov    rcx,QWORD PTR [rbp-0x51]
   141329c42:	48 8b c1             	mov    rax,rcx
   141329c45:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141329c4c:	72 19                	jb     0x141329c67
   141329c4e:	48 83 c2 27          	add    rdx,0x27
   141329c52:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141329c56:	48 2b c1             	sub    rax,rcx
   141329c59:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141329c5d:	48 83 f8 1f          	cmp    rax,0x1f
   141329c61:	0f 87 85 01 00 00    	ja     0x141329dec
   141329c67:	e8 84 a9 20 00       	call   0x1415345f0
   141329c6c:	44 8b 7c 24 44       	mov    r15d,DWORD PTR [rsp+0x44]
   141329c71:	45 0f b7 a6 a0 00 00 	movzx  r12d,WORD PTR [r14+0xa0]
   141329c78:	00 
   141329c79:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   141329c80:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   141329c87:	48 8d 0d 1a 9f 1c 01 	lea    rcx,[rip+0x11c9f1a]        # 0x1424f3ba8
   141329c8e:	e8 5d 64 82 ff       	call   0x140b500f0
   141329c93:	4c 8b e8             	mov    r13,rax
   141329c96:	48 85 c0             	test   rax,rax
   141329c99:	0f 84 09 03 00 00    	je     0x141329fa8
   141329c9f:	48 8b 88 30 01 00 00 	mov    rcx,QWORD PTR [rax+0x130]
   141329ca6:	48 85 c9             	test   rcx,rcx
   141329ca9:	0f 85 85 01 00 00    	jne    0x141329e34
   141329caf:	33 db                	xor    ebx,ebx
   141329cb1:	e9 a6 01 00 00       	jmp    0x141329e5c
   141329cb6:	48 83 7d bf 00       	cmp    QWORD PTR [rbp-0x41],0x0
   141329cbb:	75 29                	jne    0x141329ce6
   141329cbd:	48 8d 45 ef          	lea    rax,[rbp-0x11]
   141329cc1:	48 3b f0             	cmp    rsi,rax
   141329cc4:	74 16                	je     0x141329cdc
   141329cc6:	48 8d 55 ef          	lea    rdx,[rbp-0x11]
   141329cca:	48 83 7d 07 0f       	cmp    QWORD PTR [rbp+0x7],0xf
   141329ccf:	48 0f 47 55 ef       	cmova  rdx,QWORD PTR [rbp-0x11]
   141329cd4:	48 8b ce             	mov    rcx,rsi
   141329cd7:	e8 84 5b d4 fe       	call   0x14006f860
   141329cdc:	48 8b ce             	mov    rcx,rsi
   141329cdf:	e8 8c 13 20 ff       	call   0x14052b070
   141329ce4:	eb 76                	jmp    0x141329d5c
   141329ce6:	48 8d 1d 47 a1 2b 00 	lea    rbx,[rip+0x2ba147]        # 0x1415e3e34
   141329ced:	48 8d 15 d0 ec 2b 00 	lea    rdx,[rip+0x2becd0]        # 0x1415e89c4
   141329cf4:	80 7c 24 40 00       	cmp    BYTE PTR [rsp+0x40],0x0
   141329cf9:	48 0f 44 d3          	cmove  rdx,rbx
   141329cfd:	41 b8 04 00 00 00    	mov    r8d,0x4
   141329d03:	48 8b ce             	mov    rcx,rsi
   141329d06:	e8 55 5b d4 fe       	call   0x14006f860
   141329d0b:	48 8d 55 af          	lea    rdx,[rbp-0x51]
   141329d0f:	48 83 7d c7 0f       	cmp    QWORD PTR [rbp-0x39],0xf
   141329d14:	48 0f 47 55 af       	cmova  rdx,QWORD PTR [rbp-0x51]
   141329d19:	4c 8b 45 bf          	mov    r8,QWORD PTR [rbp-0x41]
   141329d1d:	48 8b ce             	mov    rcx,rsi
   141329d20:	e8 7b 5c d4 fe       	call   0x14006f9a0
   141329d25:	48 83 7d ff 00       	cmp    QWORD PTR [rbp-0x1],0x0
   141329d2a:	74 30                	je     0x141329d5c
   141329d2c:	41 b8 01 00 00 00    	mov    r8d,0x1
   141329d32:	48 8d 15 e7 99 2b 00 	lea    rdx,[rip+0x2b99e7]        # 0x1415e3720
   141329d39:	48 8b ce             	mov    rcx,rsi
   141329d3c:	e8 5f 5c d4 fe       	call   0x14006f9a0
   141329d41:	48 8d 55 ef          	lea    rdx,[rbp-0x11]
   141329d45:	48 83 7d 07 0f       	cmp    QWORD PTR [rbp+0x7],0xf
   141329d4a:	48 0f 47 55 ef       	cmova  rdx,QWORD PTR [rbp-0x11]
   141329d4f:	4c 8b 45 ff          	mov    r8,QWORD PTR [rbp-0x1]
   141329d53:	48 8b ce             	mov    rcx,rsi
   141329d56:	e8 45 5c d4 fe       	call   0x14006f9a0
   141329d5b:	90                   	nop
   141329d5c:	48 8b 55 07          	mov    rdx,QWORD PTR [rbp+0x7]
   141329d60:	48 83 fa 0f          	cmp    rdx,0xf
   141329d64:	76 34                	jbe    0x141329d9a
   141329d66:	48 ff c2             	inc    rdx
   141329d69:	48 8b 4d ef          	mov    rcx,QWORD PTR [rbp-0x11]
   141329d6d:	48 8b c1             	mov    rax,rcx
   141329d70:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141329d77:	72 1c                	jb     0x141329d95
   141329d79:	48 83 c2 27          	add    rdx,0x27
   141329d7d:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141329d81:	48 2b c1             	sub    rax,rcx
   141329d84:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141329d88:	48 83 f8 1f          	cmp    rax,0x1f
   141329d8c:	76 07                	jbe    0x141329d95
   141329d8e:	ff 15 0c 6d 2b 00    	call   QWORD PTR [rip+0x2b6d0c]        # 0x1415e0aa0
   141329d94:	cc                   	int3
   141329d95:	e8 56 a8 20 00       	call   0x1415345f0
   141329d9a:	48 c7 45 ff 00 00 00 	mov    QWORD PTR [rbp-0x1],0x0
   141329da1:	00 
   141329da2:	48 c7 45 07 0f 00 00 	mov    QWORD PTR [rbp+0x7],0xf
   141329da9:	00 
   141329daa:	c6 45 ef 00          	mov    BYTE PTR [rbp-0x11],0x0
   141329dae:	48 8b 55 c7          	mov    rdx,QWORD PTR [rbp-0x39]
   141329db2:	48 83 fa 0f          	cmp    rdx,0xf
   141329db6:	0f 86 fe 0a 00 00    	jbe    0x14132a8ba
   141329dbc:	48 ff c2             	inc    rdx
   141329dbf:	48 8b 4d af          	mov    rcx,QWORD PTR [rbp-0x51]
   141329dc3:	48 8b c1             	mov    rax,rcx
   141329dc6:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   141329dcd:	0f 82 b5 0a 00 00    	jb     0x14132a888
   141329dd3:	48 83 c2 27          	add    rdx,0x27
   141329dd7:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   141329ddb:	48 2b c1             	sub    rax,rcx
   141329dde:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   141329de2:	48 83 f8 1f          	cmp    rax,0x1f
   141329de6:	0f 86 9c 0a 00 00    	jbe    0x14132a888
   141329dec:	ff 15 ae 6c 2b 00    	call   QWORD PTR [rip+0x2b6cae]        # 0x1415e0aa0
   141329df2:	cc                   	int3
   141329df3:	4c 8b 4c 24 48       	mov    r9,QWORD PTR [rsp+0x48]
   141329df8:	4d 8b 41 10          	mov    r8,QWORD PTR [r9+0x10]
   141329dfc:	4d 85 c0             	test   r8,r8
   141329dff:	74 23                	je     0x141329e24
   141329e01:	49 3b f1             	cmp    rsi,r9
   141329e04:	0f 84 a8 0a 00 00    	je     0x14132a8b2
   141329e0a:	49 83 79 18 0f       	cmp    QWORD PTR [r9+0x18],0xf
   141329e0f:	76 03                	jbe    0x141329e14
   141329e11:	4d 8b 09             	mov    r9,QWORD PTR [r9]
   141329e14:	49 8b d1             	mov    rdx,r9
   141329e17:	48 8b ce             	mov    rcx,rsi
   141329e1a:	e8 41 5a d4 fe       	call   0x14006f860
   141329e1f:	e9 8e 0a 00 00       	jmp    0x14132a8b2
   141329e24:	48 8b d6             	mov    rdx,rsi
   141329e27:	49 8b c9             	mov    rcx,r9
   141329e2a:	e8 81 72 76 ff       	call   0x140a910b0
   141329e2f:	e9 7e 0a 00 00       	jmp    0x14132a8b2
   141329e34:	48 8b 41 58          	mov    rax,QWORD PTR [rcx+0x58]
   141329e38:	48 85 c0             	test   rax,rax
   141329e3b:	75 04                	jne    0x141329e41
   141329e3d:	33 db                	xor    ebx,ebx
   141329e3f:	eb 1b                	jmp    0x141329e5c
   141329e41:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
   141329e44:	83 fa ff             	cmp    edx,0xffffffff
   141329e47:	75 04                	jne    0x141329e4d
   141329e49:	33 db                	xor    ebx,ebx
   141329e4b:	eb 0f                	jmp    0x141329e5c
   141329e4d:	48 8d 0d 84 7d 1b 01 	lea    rcx,[rip+0x11b7d84]        # 0x1424e1bd8
   141329e54:	e8 a7 86 d4 fe       	call   0x140072500
   141329e59:	48 8b d8             	mov    rbx,rax
   141329e5c:	48 85 db             	test   rbx,rbx
   141329e5f:	0f 84 45 01 00 00    	je     0x141329faa
   141329e65:	44 8b 9b 88 00 00 00 	mov    r11d,DWORD PTR [rbx+0x88]
   141329e6c:	41 83 fb ff          	cmp    r11d,0xffffffff
   141329e70:	0f 84 1f 01 00 00    	je     0x141329f95
   141329e76:	4c 8b 15 93 9d 1c 01 	mov    r10,QWORD PTR [rip+0x11c9d93]        # 0x1424f3c10
   141329e7d:	48 8b 3d 84 9d 1c 01 	mov    rdi,QWORD PTR [rip+0x11c9d84]        # 0x1424f3c08
   141329e84:	4c 2b d7             	sub    r10,rdi
   141329e87:	49 c1 fa 03          	sar    r10,0x3
   141329e8b:	4d 85 d2             	test   r10,r10
   141329e8e:	74 3c                	je     0x141329ecc
   141329e90:	45 33 c0             	xor    r8d,r8d
   141329e93:	41 83 ea 01          	sub    r10d,0x1
   141329e97:	78 33                	js     0x141329ecc
   141329e99:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   141329ea0:	43 8d 0c 02          	lea    ecx,[r10+r8*1]
   141329ea4:	d1 f9                	sar    ecx,1
   141329ea6:	48 63 c1             	movsxd rax,ecx
   141329ea9:	48 8b 14 c7          	mov    rdx,QWORD PTR [rdi+rax*8]
   141329ead:	44 39 9a e0 00 00 00 	cmp    DWORD PTR [rdx+0xe0],r11d
   141329eb4:	74 18                	je     0x141329ece
   141329eb6:	8d 41 ff             	lea    eax,[rcx-0x1]
   141329eb9:	41 0f 4e c2          	cmovle eax,r10d
   141329ebd:	44 8b d0             	mov    r10d,eax
   141329ec0:	8d 41 01             	lea    eax,[rcx+0x1]
   141329ec3:	44 0f 4e c0          	cmovle r8d,eax
   141329ec7:	45 3b c2             	cmp    r8d,r10d
   141329eca:	7e d4                	jle    0x141329ea0
   141329ecc:	33 d2                	xor    edx,edx
   141329ece:	48 85 d2             	test   rdx,rdx
   141329ed1:	0f 84 be 00 00 00    	je     0x141329f95
   141329ed7:	83 ba d0 00 00 00 00 	cmp    DWORD PTR [rdx+0xd0],0x0
   141329ede:	0f 8e b1 00 00 00    	jle    0x141329f95
   141329ee4:	48 8b 82 c8 00 00 00 	mov    rax,QWORD PTR [rdx+0xc8]
   141329eeb:	f6 00 04             	test   BYTE PTR [rax],0x4
   141329eee:	75 57                	jne    0x141329f47
   141329ef0:	f6 00 08             	test   BYTE PTR [rax],0x8
   141329ef3:	0f 84 9c 00 00 00    	je     0x141329f95
   141329ef9:	41 83 ff 01          	cmp    r15d,0x1
   141329efd:	75 0f                	jne    0x141329f0e
   141329eff:	41 b8 04 00 00 00    	mov    r8d,0x4
   141329f05:	48 8d 15 28 9f 2b 00 	lea    rdx,[rip+0x2b9f28]        # 0x1415e3e34
   141329f0c:	eb 12                	jmp    0x141329f20
   141329f0e:	45 85 ff             	test   r15d,r15d
   141329f11:	75 15                	jne    0x141329f28
   141329f13:	41 b8 02 00 00 00    	mov    r8d,0x2
   141329f19:	48 8d 15 f8 e6 2b 00 	lea    rdx,[rip+0x2be6f8]        # 0x1415e8618
   141329f20:	48 8b ce             	mov    rcx,rsi
   141329f23:	e8 78 5a d4 fe       	call   0x14006f9a0
   141329f28:	41 b8 05 00 00 00    	mov    r8d,0x5
   141329f2e:	48 8d 15 27 6a 34 00 	lea    rdx,[rip+0x346a27]        # 0x14167095c
   141329f35:	48 8b ce             	mov    rcx,rsi
   141329f38:	e8 63 5a d4 fe       	call   0x14006f9a0
   141329f3d:	80 7c 24 40 00       	cmp    BYTE PTR [rsp+0x40],0x0
   141329f42:	e9 69 09 00 00       	jmp    0x14132a8b0
   141329f47:	41 83 ff 01          	cmp    r15d,0x1
   141329f4b:	75 0f                	jne    0x141329f5c
   141329f4d:	41 b8 04 00 00 00    	mov    r8d,0x4
   141329f53:	48 8d 15 da 9e 2b 00 	lea    rdx,[rip+0x2b9eda]        # 0x1415e3e34
   141329f5a:	eb 12                	jmp    0x141329f6e
   141329f5c:	45 85 ff             	test   r15d,r15d
   141329f5f:	75 15                	jne    0x141329f76
   141329f61:	41 b8 02 00 00 00    	mov    r8d,0x2
   141329f67:	48 8d 15 aa e6 2b 00 	lea    rdx,[rip+0x2be6aa]        # 0x1415e8618
   141329f6e:	48 8b ce             	mov    rcx,rsi
   141329f71:	e8 2a 5a d4 fe       	call   0x14006f9a0
   141329f76:	41 b8 05 00 00 00    	mov    r8d,0x5
   141329f7c:	48 8d 15 85 35 33 00 	lea    rdx,[rip+0x333585]        # 0x14165d508
   141329f83:	48 8b ce             	mov    rcx,rsi
   141329f86:	e8 15 5a d4 fe       	call   0x14006f9a0
   141329f8b:	80 7c 24 40 00       	cmp    BYTE PTR [rsp+0x40],0x0
   141329f90:	e9 1b 09 00 00       	jmp    0x14132a8b0
   141329f95:	0f b7 83 ac 00 00 00 	movzx  eax,WORD PTR [rbx+0xac]
   141329f9c:	66 83 f8 ff          	cmp    ax,0xffff
   141329fa0:	74 08                	je     0x141329faa
   141329fa2:	44 0f b7 e0          	movzx  r12d,ax
   141329fa6:	eb 02                	jmp    0x141329faa
   141329fa8:	33 db                	xor    ebx,ebx
   141329faa:	0f 57 c0             	xorps  xmm0,xmm0
   141329fad:	0f 11 45 cf          	movups XMMWORD PTR [rbp-0x31],xmm0
   141329fb1:	48 c7 45 df 00 00 00 	mov    QWORD PTR [rbp-0x21],0x0
   141329fb8:	00 
   141329fb9:	48 c7 45 e7 0f 00 00 	mov    QWORD PTR [rbp-0x19],0xf
   141329fc0:	00 
   141329fc1:	c6 45 cf 00          	mov    BYTE PTR [rbp-0x31],0x0
   141329fc5:	49 83 be 80 0d 00 00 	cmp    QWORD PTR [r14+0xd80],0x0
   141329fcc:	00 
   141329fcd:	75 0f                	jne    0x141329fde
   141329fcf:	41 80 be 38 08 00 00 	cmp    BYTE PTR [r14+0x838],0x0
   141329fd6:	00 
   141329fd7:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   141329fdc:	74 05                	je     0x141329fe3
   141329fde:	b8 ff ff ff ff       	mov    eax,0xffffffff
   141329fe3:	4d 8b c6             	mov    r8,r14
   141329fe6:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   141329feb:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   141329ff0:	c6 44 24 20 00       	mov    BYTE PTR [rsp+0x20],0x0
   141329ff5:	45 0f b7 8e 2c 01 00 	movzx  r9d,WORD PTR [r14+0x12c]
   141329ffc:	00 
   141329ffd:	45 0f b7 86 a4 00 00 	movzx  r8d,WORD PTR [r14+0xa4]
   14132a004:	00 
   14132a005:	41 0f b7 d4          	movzx  edx,r12w
   14132a009:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132a00d:	e8 1e f0 ff ff       	call   0x141329030
   14132a012:	44 0f b6 f8          	movzx  r15d,al
   14132a016:	48 85 db             	test   rbx,rbx
   14132a019:	74 11                	je     0x14132a02c
   14132a01b:	0f b6 f8             	movzx  edi,al
   14132a01e:	66 83 bb ac 00 00 00 	cmp    WORD PTR [rbx+0xac],0xffff
   14132a025:	ff 
   14132a026:	0f 85 f0 03 00 00    	jne    0x14132a41c
   14132a02c:	4d 8d 86 74 12 00 00 	lea    r8,[r14+0x1274]
   14132a033:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132a03a:	48 8d 0d 67 9b 1c 01 	lea    rcx,[rip+0x11c9b67]        # 0x1424f3ba8
   14132a041:	e8 aa 60 82 ff       	call   0x140b500f0
   14132a046:	48 85 c0             	test   rax,rax
   14132a049:	0f 84 14 01 00 00    	je     0x14132a163
   14132a04f:	48 8d 4d 97          	lea    rcx,[rbp-0x69]
   14132a053:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   14132a058:	4c 8d 4d 8f          	lea    r9,[rbp-0x71]
   14132a05c:	4c 8d 44 24 41       	lea    r8,[rsp+0x41]
   14132a061:	ba ff ff ff ff       	mov    edx,0xffffffff
   14132a066:	48 8b c8             	mov    rcx,rax
   14132a069:	e8 f2 e5 8b ff       	call   0x140be8660
   14132a06e:	48 8b d8             	mov    rbx,rax
   14132a071:	41 0f b6 ff          	movzx  edi,r15b
   14132a075:	48 85 c0             	test   rax,rax
   14132a078:	0f 84 e9 00 00 00    	je     0x14132a167
   14132a07e:	4d 85 ed             	test   r13,r13
   14132a081:	0f 84 e0 00 00 00    	je     0x14132a167
   14132a087:	41 0f be 4d 06       	movsx  ecx,BYTE PTR [r13+0x6]
   14132a08c:	80 7c 24 41 00       	cmp    BYTE PTR [rsp+0x41],0x0
   14132a091:	74 4a                	je     0x14132a0dd
   14132a093:	85 c9                	test   ecx,ecx
   14132a095:	74 2a                	je     0x14132a0c1
   14132a097:	83 f9 01             	cmp    ecx,0x1
   14132a09a:	74 09                	je     0x14132a0a5
   14132a09c:	48 8d 90 58 01 00 00 	lea    rdx,[rax+0x158]
   14132a0a3:	eb 7e                	jmp    0x14132a123
   14132a0a5:	48 83 b8 e8 01 00 00 	cmp    QWORD PTR [rax+0x1e8],0x0
   14132a0ac:	00 
   14132a0ad:	75 09                	jne    0x14132a0b8
   14132a0af:	48 8d 90 58 01 00 00 	lea    rdx,[rax+0x158]
   14132a0b6:	eb 6b                	jmp    0x14132a123
   14132a0b8:	48 8d 90 d8 01 00 00 	lea    rdx,[rax+0x1d8]
   14132a0bf:	eb 62                	jmp    0x14132a123
   14132a0c1:	48 83 b8 a8 01 00 00 	cmp    QWORD PTR [rax+0x1a8],0x0
   14132a0c8:	00 
   14132a0c9:	75 09                	jne    0x14132a0d4
   14132a0cb:	48 8d 90 58 01 00 00 	lea    rdx,[rax+0x158]
   14132a0d2:	eb 4f                	jmp    0x14132a123
   14132a0d4:	48 8d 90 98 01 00 00 	lea    rdx,[rax+0x198]
   14132a0db:	eb 46                	jmp    0x14132a123
   14132a0dd:	85 c9                	test   ecx,ecx
   14132a0df:	74 2a                	je     0x14132a10b
   14132a0e1:	83 f9 01             	cmp    ecx,0x1
   14132a0e4:	74 09                	je     0x14132a0ef
   14132a0e6:	48 8d 90 98 00 00 00 	lea    rdx,[rax+0x98]
   14132a0ed:	eb 34                	jmp    0x14132a123
   14132a0ef:	48 83 b8 28 01 00 00 	cmp    QWORD PTR [rax+0x128],0x0
   14132a0f6:	00 
   14132a0f7:	75 09                	jne    0x14132a102
   14132a0f9:	48 8d 90 98 00 00 00 	lea    rdx,[rax+0x98]
   14132a100:	eb 21                	jmp    0x14132a123
   14132a102:	48 8d 90 18 01 00 00 	lea    rdx,[rax+0x118]
   14132a109:	eb 18                	jmp    0x14132a123
   14132a10b:	48 83 b8 e8 00 00 00 	cmp    QWORD PTR [rax+0xe8],0x0
   14132a112:	00 
   14132a113:	48 8d 90 98 00 00 00 	lea    rdx,[rax+0x98]
   14132a11a:	74 07                	je     0x14132a123
   14132a11c:	48 8d 90 d8 00 00 00 	lea    rdx,[rax+0xd8]
   14132a123:	48 8d 45 cf          	lea    rax,[rbp-0x31]
   14132a127:	48 3b c2             	cmp    rax,rdx
   14132a12a:	74 17                	je     0x14132a143
   14132a12c:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132a130:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132a135:	76 03                	jbe    0x14132a13a
   14132a137:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132a13a:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132a13e:	e8 1d 57 d4 fe       	call   0x14006f860
   14132a143:	66 83 bb c8 02 00 00 	cmp    WORD PTR [rbx+0x2c8],0x0
   14132a14a:	00 
   14132a14b:	7e 11                	jle    0x14132a15e
   14132a14d:	4c 8d 45 cf          	lea    r8,[rbp-0x31]
   14132a151:	48 8b 55 97          	mov    rdx,QWORD PTR [rbp-0x69]
   14132a155:	48 8b 4d 8f          	mov    rcx,QWORD PTR [rbp-0x71]
   14132a159:	e8 82 16 69 ff       	call   0x1409bb7e0
   14132a15e:	40 32 ff             	xor    dil,dil
   14132a161:	eb 04                	jmp    0x14132a167
   14132a163:	41 0f b6 ff          	movzx  edi,r15b
   14132a167:	4d 8d be 74 12 00 00 	lea    r15,[r14+0x1274]
   14132a16e:	4d 8b c7             	mov    r8,r15
   14132a171:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132a178:	48 8d 0d 29 9a 1c 01 	lea    rcx,[rip+0x11c9a29]        # 0x1424f3ba8
   14132a17f:	e8 6c 5f 82 ff       	call   0x140b500f0
   14132a184:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   14132a18a:	48 85 c0             	test   rax,rax
   14132a18d:	0f 84 27 01 00 00    	je     0x14132a2ba
   14132a193:	ba 04 00 00 00       	mov    edx,0x4
   14132a198:	45 8b c5             	mov    r8d,r13d
   14132a19b:	48 8b c8             	mov    rcx,rax
   14132a19e:	e8 5d a2 86 ff       	call   0x140b94400
   14132a1a3:	66 85 c0             	test   ax,ax
   14132a1a6:	0f 8e 0e 01 00 00    	jle    0x14132a2ba
   14132a1ac:	41 8d 44 24 99       	lea    eax,[r12-0x67]
   14132a1b1:	66 83 f8 01          	cmp    ax,0x1
   14132a1b5:	77 22                	ja     0x14132a1d9
   14132a1b7:	48 83 7d df 00       	cmp    QWORD PTR [rbp-0x21],0x0
   14132a1bc:	74 1b                	je     0x14132a1d9
   14132a1be:	41 b8 06 00 00 00    	mov    r8d,0x6
   14132a1c4:	48 8d 15 bd d7 2b 00 	lea    rdx,[rip+0x2bd7bd]        # 0x1415e7988
   14132a1cb:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132a1cf:	e8 cc 57 d4 fe       	call   0x14006f9a0
   14132a1d4:	e9 de 00 00 00       	jmp    0x14132a2b7
   14132a1d9:	48 8b 7d e7          	mov    rdi,QWORD PTR [rbp-0x19]
   14132a1dd:	48 83 ff 05          	cmp    rdi,0x5
   14132a1e1:	72 33                	jb     0x14132a216
   14132a1e3:	48 8d 5d cf          	lea    rbx,[rbp-0x31]
   14132a1e7:	48 83 ff 0f          	cmp    rdi,0xf
   14132a1eb:	48 0f 47 5d cf       	cmova  rbx,QWORD PTR [rbp-0x31]
   14132a1f0:	48 c7 45 df 05 00 00 	mov    QWORD PTR [rbp-0x21],0x5
   14132a1f7:	00 
   14132a1f8:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132a1fe:	48 8d 15 a7 d7 2b 00 	lea    rdx,[rip+0x2bd7a7]        # 0x1415e79ac
   14132a205:	48 8b cb             	mov    rcx,rbx
   14132a208:	e8 7d bb 20 00       	call   0x141535d8a
   14132a20d:	c6 43 05 00          	mov    BYTE PTR [rbx+0x5],0x0
   14132a211:	e9 a1 00 00 00       	jmp    0x14132a2b7
   14132a216:	48 8b cf             	mov    rcx,rdi
   14132a219:	48 d1 e9             	shr    rcx,1
   14132a21c:	48 ba ff ff ff ff ff 	movabs rdx,0x7fffffffffffffff
   14132a223:	ff ff 7f 
   14132a226:	48 8b c2             	mov    rax,rdx
   14132a229:	48 2b c1             	sub    rax,rcx
   14132a22c:	48 3b f8             	cmp    rdi,rax
   14132a22f:	76 05                	jbe    0x14132a236
   14132a231:	48 8b da             	mov    rbx,rdx
   14132a234:	eb 10                	jmp    0x14132a246
   14132a236:	48 8d 04 39          	lea    rax,[rcx+rdi*1]
   14132a23a:	bb 0f 00 00 00       	mov    ebx,0xf
   14132a23f:	48 3b c3             	cmp    rax,rbx
   14132a242:	48 0f 47 d8          	cmova  rbx,rax
   14132a246:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   14132a24a:	e8 11 65 d4 fe       	call   0x140070760
   14132a24f:	4c 8b f8             	mov    r15,rax
   14132a252:	48 c7 45 df 05 00 00 	mov    QWORD PTR [rbp-0x21],0x5
   14132a259:	00 
   14132a25a:	48 89 5d e7          	mov    QWORD PTR [rbp-0x19],rbx
   14132a25e:	8b 0d 48 d7 2b 00    	mov    ecx,DWORD PTR [rip+0x2bd748]        # 0x1415e79ac
   14132a264:	89 08                	mov    DWORD PTR [rax],ecx
   14132a266:	0f b6 0d 43 d7 2b 00 	movzx  ecx,BYTE PTR [rip+0x2bd743]        # 0x1415e79b0
   14132a26d:	88 48 04             	mov    BYTE PTR [rax+0x4],cl
   14132a270:	c6 40 05 00          	mov    BYTE PTR [rax+0x5],0x0
   14132a274:	48 83 ff 0f          	cmp    rdi,0xf
   14132a278:	76 32                	jbe    0x14132a2ac
   14132a27a:	48 8d 57 01          	lea    rdx,[rdi+0x1]
   14132a27e:	48 8b 4d cf          	mov    rcx,QWORD PTR [rbp-0x31]
   14132a282:	48 8b c1             	mov    rax,rcx
   14132a285:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132a28c:	72 19                	jb     0x14132a2a7
   14132a28e:	48 83 c2 27          	add    rdx,0x27
   14132a292:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132a296:	48 2b c1             	sub    rax,rcx
   14132a299:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132a29d:	48 83 f8 1f          	cmp    rax,0x1f
   14132a2a1:	0f 87 62 01 00 00    	ja     0x14132a409
   14132a2a7:	e8 44 a3 20 00       	call   0x1415345f0
   14132a2ac:	4c 89 7d cf          	mov    QWORD PTR [rbp-0x31],r15
   14132a2b0:	4d 8d be 74 12 00 00 	lea    r15,[r14+0x1274]
   14132a2b7:	40 32 ff             	xor    dil,dil
   14132a2ba:	4d 8b c7             	mov    r8,r15
   14132a2bd:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132a2c4:	48 8d 0d dd 98 1c 01 	lea    rcx,[rip+0x11c98dd]        # 0x1424f3ba8
   14132a2cb:	e8 20 5e 82 ff       	call   0x140b500f0
   14132a2d0:	48 85 c0             	test   rax,rax
   14132a2d3:	74 15                	je     0x14132a2ea
   14132a2d5:	ba 06 00 00 00       	mov    edx,0x6
   14132a2da:	45 8b c5             	mov    r8d,r13d
   14132a2dd:	48 8b c8             	mov    rcx,rax
   14132a2e0:	e8 1b a1 86 ff       	call   0x140b94400
   14132a2e5:	66 85 c0             	test   ax,ax
   14132a2e8:	7f 38                	jg     0x14132a322
   14132a2ea:	4d 8b c7             	mov    r8,r15
   14132a2ed:	41 8b 96 30 0c 00 00 	mov    edx,DWORD PTR [r14+0xc30]
   14132a2f4:	48 8d 0d ad 98 1c 01 	lea    rcx,[rip+0x11c98ad]        # 0x1424f3ba8
   14132a2fb:	e8 f0 5d 82 ff       	call   0x140b500f0
   14132a300:	48 85 c0             	test   rax,rax
   14132a303:	0f 84 13 01 00 00    	je     0x14132a41c
   14132a309:	ba 07 00 00 00       	mov    edx,0x7
   14132a30e:	45 8b c5             	mov    r8d,r13d
   14132a311:	48 8b c8             	mov    rcx,rax
   14132a314:	e8 b7 ba 86 ff       	call   0x140b95dd0
   14132a319:	66 85 c0             	test   ax,ax
   14132a31c:	0f 8e fa 00 00 00    	jle    0x14132a41c
   14132a322:	66 41 83 ec 67       	sub    r12w,0x67
   14132a327:	66 41 83 fc 01       	cmp    r12w,0x1
   14132a32c:	77 22                	ja     0x14132a350
   14132a32e:	48 83 7d df 00       	cmp    QWORD PTR [rbp-0x21],0x0
   14132a333:	74 1b                	je     0x14132a350
   14132a335:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132a33b:	48 8d 15 0e 26 45 00 	lea    rdx,[rip+0x45260e]        # 0x14177c950
   14132a342:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132a346:	e8 55 56 d4 fe       	call   0x14006f9a0
   14132a34b:	e9 c9 00 00 00       	jmp    0x14132a419
   14132a350:	48 8b 5d e7          	mov    rbx,QWORD PTR [rbp-0x19]
   14132a354:	48 83 fb 08          	cmp    rbx,0x8
   14132a358:	72 2b                	jb     0x14132a385
   14132a35a:	48 8d 45 cf          	lea    rax,[rbp-0x31]
   14132a35e:	48 83 fb 0f          	cmp    rbx,0xf
   14132a362:	48 0f 47 45 cf       	cmova  rax,QWORD PTR [rbp-0x31]
   14132a367:	48 c7 45 df 08 00 00 	mov    QWORD PTR [rbp-0x21],0x8
   14132a36e:	00 
   14132a36f:	48 b9 70 72 69 73 6f 	movabs rcx,0x72656e6f73697270
   14132a376:	6e 65 72 
   14132a379:	48 89 08             	mov    QWORD PTR [rax],rcx
   14132a37c:	c6 40 08 00          	mov    BYTE PTR [rax+0x8],0x0
   14132a380:	e9 94 00 00 00       	jmp    0x14132a419
   14132a385:	48 8b cb             	mov    rcx,rbx
   14132a388:	48 d1 e9             	shr    rcx,1
   14132a38b:	49 bf ff ff ff ff ff 	movabs r15,0x7fffffffffffffff
   14132a392:	ff ff 7f 
   14132a395:	49 8b c7             	mov    rax,r15
   14132a398:	48 2b c1             	sub    rax,rcx
   14132a39b:	48 3b d8             	cmp    rbx,rax
   14132a39e:	77 11                	ja     0x14132a3b1
   14132a3a0:	48 8d 04 19          	lea    rax,[rcx+rbx*1]
   14132a3a4:	41 bf 0f 00 00 00    	mov    r15d,0xf
   14132a3aa:	49 3b c7             	cmp    rax,r15
   14132a3ad:	4c 0f 47 f8          	cmova  r15,rax
   14132a3b1:	49 8d 4f 01          	lea    rcx,[r15+0x1]
   14132a3b5:	e8 a6 63 d4 fe       	call   0x140070760
   14132a3ba:	48 8b f8             	mov    rdi,rax
   14132a3bd:	48 c7 45 df 08 00 00 	mov    QWORD PTR [rbp-0x21],0x8
   14132a3c4:	00 
   14132a3c5:	4c 89 7d e7          	mov    QWORD PTR [rbp-0x19],r15
   14132a3c9:	48 b8 70 72 69 73 6f 	movabs rax,0x72656e6f73697270
   14132a3d0:	6e 65 72 
   14132a3d3:	48 89 07             	mov    QWORD PTR [rdi],rax
   14132a3d6:	c6 47 08 00          	mov    BYTE PTR [rdi+0x8],0x0
   14132a3da:	48 83 fb 0f          	cmp    rbx,0xf
   14132a3de:	76 35                	jbe    0x14132a415
   14132a3e0:	48 8d 53 01          	lea    rdx,[rbx+0x1]
   14132a3e4:	48 8b 4d cf          	mov    rcx,QWORD PTR [rbp-0x31]
   14132a3e8:	48 8b c1             	mov    rax,rcx
   14132a3eb:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132a3f2:	72 1c                	jb     0x14132a410
   14132a3f4:	48 83 c2 27          	add    rdx,0x27
   14132a3f8:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132a3fc:	48 2b c1             	sub    rax,rcx
   14132a3ff:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132a403:	48 83 f8 1f          	cmp    rax,0x1f
   14132a407:	76 07                	jbe    0x14132a410
   14132a409:	ff 15 91 66 2b 00    	call   QWORD PTR [rip+0x2b6691]        # 0x1415e0aa0
   14132a40f:	cc                   	int3
   14132a410:	e8 db a1 20 00       	call   0x1415345f0
   14132a415:	48 89 7d cf          	mov    QWORD PTR [rbp-0x31],rdi
   14132a419:	40 32 ff             	xor    dil,dil
   14132a41c:	49 83 be 90 00 00 00 	cmp    QWORD PTR [r14+0x90],0x0
   14132a423:	00 
   14132a424:	74 30                	je     0x14132a456
   14132a426:	80 7d 7f 00          	cmp    BYTE PTR [rbp+0x7f],0x0
   14132a42a:	74 2a                	je     0x14132a456
   14132a42c:	49 8d 96 80 00 00 00 	lea    rdx,[r14+0x80]
   14132a433:	48 8d 45 cf          	lea    rax,[rbp-0x31]
   14132a437:	48 3b c2             	cmp    rax,rdx
   14132a43a:	74 17                	je     0x14132a453
   14132a43c:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132a440:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132a445:	76 03                	jbe    0x14132a44a
   14132a447:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132a44a:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   14132a44e:	e8 0d 54 d4 fe       	call   0x14006f860
   14132a453:	40 32 ff             	xor    dil,dil
   14132a456:	48 c7 46 10 00 00 00 	mov    QWORD PTR [rsi+0x10],0x0
   14132a45d:	00 
   14132a45e:	48 8b c6             	mov    rax,rsi
   14132a461:	48 83 7e 18 0f       	cmp    QWORD PTR [rsi+0x18],0xf
   14132a466:	76 03                	jbe    0x14132a46b
   14132a468:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   14132a46b:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14132a46e:	41 0f b7 96 2c 01 00 	movzx  edx,WORD PTR [r14+0x12c]
   14132a475:	00 
   14132a476:	41 0f b7 8e a4 00 00 	movzx  ecx,WORD PTR [r14+0xa4]
   14132a47d:	00 
   14132a47e:	e8 ed 6f 04 00       	call   0x141371470
   14132a483:	48 8d 1d aa 99 2b 00 	lea    rbx,[rip+0x2b99aa]        # 0x1415e3e34
   14132a48a:	84 c0                	test   al,al
   14132a48c:	0f 84 c7 00 00 00    	je     0x14132a559
   14132a492:	41 83 be bc 03 00 00 	cmp    DWORD PTR [r14+0x3bc],0xffffffff
   14132a499:	ff 
   14132a49a:	0f 85 b9 00 00 00    	jne    0x14132a559
   14132a4a0:	41 f7 86 10 01 00 00 	test   DWORD PTR [r14+0x110],0x4000000
   14132a4a7:	00 00 00 04 
   14132a4ab:	0f 84 a8 00 00 00    	je     0x14132a559
   14132a4b1:	44 8b 6c 24 44       	mov    r13d,DWORD PTR [rsp+0x44]
   14132a4b6:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132a4bb:	75 2b                	jne    0x14132a4e8
   14132a4bd:	41 83 fd 01          	cmp    r13d,0x1
   14132a4c1:	75 0b                	jne    0x14132a4ce
   14132a4c3:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132a4c9:	48 8b d3             	mov    rdx,rbx
   14132a4cc:	eb 12                	jmp    0x14132a4e0
   14132a4ce:	45 85 ed             	test   r13d,r13d
   14132a4d1:	75 15                	jne    0x14132a4e8
   14132a4d3:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132a4d9:	48 8d 15 38 e1 2b 00 	lea    rdx,[rip+0x2be138]        # 0x1415e8618
   14132a4e0:	48 8b ce             	mov    rcx,rsi
   14132a4e3:	e8 b8 54 d4 fe       	call   0x14006f9a0
   14132a4e8:	41 8b 8e 40 01 00 00 	mov    ecx,DWORD PTR [r14+0x140]
   14132a4ef:	48 8b 05 fa 11 0a 01 	mov    rax,QWORD PTR [rip+0x10a11fa]        # 0x1423cb6f0
   14132a4f6:	48 2b 05 eb 11 0a 01 	sub    rax,QWORD PTR [rip+0x10a11eb]        # 0x1423cb6e8
   14132a4fd:	48 a9 f8 ff ff ff    	test   rax,0xfffffffffffffff8
   14132a503:	74 34                	je     0x14132a539
   14132a505:	83 f9 ff             	cmp    ecx,0xffffffff
   14132a508:	74 2f                	je     0x14132a539
   14132a50a:	48 8d 15 d7 11 0a 01 	lea    rdx,[rip+0x10a11d7]        # 0x1423cb6e8
   14132a511:	e8 1a fb d8 fe       	call   0x1400ba030
   14132a516:	48 85 c0             	test   rax,rax
   14132a519:	74 1e                	je     0x14132a539
   14132a51b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   14132a51f:	83 b8 a8 03 00 00 07 	cmp    DWORD PTR [rax+0x3a8],0x7
   14132a526:	7e 11                	jle    0x14132a539
   14132a528:	48 8b 80 a0 03 00 00 	mov    rax,QWORD PTR [rax+0x3a0]
   14132a52f:	f6 40 07 10          	test   BYTE PTR [rax+0x7],0x10
   14132a533:	74 04                	je     0x14132a539
   14132a535:	b0 01                	mov    al,0x1
   14132a537:	eb 02                	jmp    0x14132a53b
   14132a539:	32 c0                	xor    al,al
   14132a53b:	44 0f b6 c0          	movzx  r8d,al
   14132a53f:	49 83 c0 06          	add    r8,0x6
   14132a543:	48 8d 0d 22 24 45 00 	lea    rcx,[rip+0x452422]        # 0x14177c96c
   14132a54a:	48 8d 15 f7 23 45 00 	lea    rdx,[rip+0x4523f7]        # 0x14177c948
   14132a551:	84 c0                	test   al,al
   14132a553:	48 0f 44 d1          	cmove  rdx,rcx
   14132a557:	eb 51                	jmp    0x14132a5aa
   14132a559:	44 8b 6c 24 44       	mov    r13d,DWORD PTR [rsp+0x44]
   14132a55e:	41 f7 86 1c 01 00 00 	test   DWORD PTR [r14+0x11c],0x1000
   14132a565:	00 10 00 00 
   14132a569:	74 47                	je     0x14132a5b2
   14132a56b:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132a570:	75 2b                	jne    0x14132a59d
   14132a572:	41 83 fd 01          	cmp    r13d,0x1
   14132a576:	75 0b                	jne    0x14132a583
   14132a578:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132a57e:	48 8b d3             	mov    rdx,rbx
   14132a581:	eb 12                	jmp    0x14132a595
   14132a583:	45 85 ed             	test   r13d,r13d
   14132a586:	75 15                	jne    0x14132a59d
   14132a588:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132a58e:	48 8d 15 83 e0 2b 00 	lea    rdx,[rip+0x2be083]        # 0x1415e8618
   14132a595:	48 8b ce             	mov    rcx,rsi
   14132a598:	e8 03 54 d4 fe       	call   0x14006f9a0
   14132a59d:	41 b8 09 00 00 00    	mov    r8d,0x9
   14132a5a3:	48 8d 15 b6 23 45 00 	lea    rdx,[rip+0x4523b6]        # 0x14177c960
   14132a5aa:	48 8b ce             	mov    rcx,rsi
   14132a5ad:	e8 ee 53 d4 fe       	call   0x14006f9a0
   14132a5b2:	41 f7 86 18 01 00 00 	test   DWORD PTR [r14+0x118],0x1000
   14132a5b9:	00 10 00 00 
   14132a5bd:	0f 84 90 00 00 00    	je     0x14132a653
   14132a5c3:	40 84 ff             	test   dil,dil
   14132a5c6:	74 44                	je     0x14132a60c
   14132a5c8:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132a5cd:	75 6f                	jne    0x14132a63e
   14132a5cf:	41 83 fd 01          	cmp    r13d,0x1
   14132a5d3:	75 0b                	jne    0x14132a5e0
   14132a5d5:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132a5db:	48 8b d3             	mov    rdx,rbx
   14132a5de:	eb 12                	jmp    0x14132a5f2
   14132a5e0:	45 85 ed             	test   r13d,r13d
   14132a5e3:	75 15                	jne    0x14132a5fa
   14132a5e5:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132a5eb:	48 8d 15 26 e0 2b 00 	lea    rdx,[rip+0x2be026]        # 0x1415e8618
   14132a5f2:	48 8b ce             	mov    rcx,rsi
   14132a5f5:	e8 a6 53 d4 fe       	call   0x14006f9a0
   14132a5fa:	41 b8 05 00 00 00    	mov    r8d,0x5
   14132a600:	48 8d 15 31 67 37 00 	lea    rdx,[rip+0x376731]        # 0x1416a0d38
   14132a607:	e9 2b 02 00 00       	jmp    0x14132a837
   14132a60c:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132a611:	75 2b                	jne    0x14132a63e
   14132a613:	41 83 fd 01          	cmp    r13d,0x1
   14132a617:	75 0b                	jne    0x14132a624
   14132a619:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132a61f:	48 8b d3             	mov    rdx,rbx
   14132a622:	eb 12                	jmp    0x14132a636
   14132a624:	45 85 ed             	test   r13d,r13d
   14132a627:	75 15                	jne    0x14132a63e
   14132a629:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132a62f:	48 8d 15 e2 df 2b 00 	lea    rdx,[rip+0x2bdfe2]        # 0x1415e8618
   14132a636:	48 8b ce             	mov    rcx,rsi
   14132a639:	e8 62 53 d4 fe       	call   0x14006f9a0
   14132a63e:	41 b8 08 00 00 00    	mov    r8d,0x8
   14132a644:	48 8d 15 25 e5 2c 00 	lea    rdx,[rip+0x2ce525]        # 0x1415f8b70
   14132a64b:	48 8b ce             	mov    rcx,rsi
   14132a64e:	e8 4d 53 d4 fe       	call   0x14006f9a0
   14132a653:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132a658:	75 2b                	jne    0x14132a685
   14132a65a:	41 83 fd 01          	cmp    r13d,0x1
   14132a65e:	75 0b                	jne    0x14132a66b
   14132a660:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132a666:	48 8b d3             	mov    rdx,rbx
   14132a669:	eb 12                	jmp    0x14132a67d
   14132a66b:	45 85 ed             	test   r13d,r13d
   14132a66e:	75 15                	jne    0x14132a685
   14132a670:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132a676:	48 8d 15 9b df 2b 00 	lea    rdx,[rip+0x2bdf9b]        # 0x1415e8618
   14132a67d:	48 8b ce             	mov    rcx,rsi
   14132a680:	e8 1b 53 d4 fe       	call   0x14006f9a0
   14132a685:	83 3d dc bb 56 00 01 	cmp    DWORD PTR [rip+0x56bbdc],0x1        # 0x141896268
   14132a68c:	75 76                	jne    0x14132a704
   14132a68e:	49 83 be f8 13 00 00 	cmp    QWORD PTR [r14+0x13f8],0x0
   14132a695:	00 
   14132a696:	75 08                	jne    0x14132a6a0
   14132a698:	49 8b ce             	mov    rcx,r14
   14132a69b:	e8 b0 b0 3e ff       	call   0x140715750
   14132a6a0:	49 8d be e8 13 00 00 	lea    rdi,[r14+0x13e8]
   14132a6a7:	4c 8b 7f 10          	mov    r15,QWORD PTR [rdi+0x10]
   14132a6ab:	48 8b cf             	mov    rcx,rdi
   14132a6ae:	4c 8b 67 18          	mov    r12,QWORD PTR [rdi+0x18]
   14132a6b2:	49 83 fc 0f          	cmp    r12,0xf
   14132a6b6:	76 03                	jbe    0x14132a6bb
   14132a6b8:	48 8b 0f             	mov    rcx,QWORD PTR [rdi]
   14132a6bb:	49 83 ff 07          	cmp    r15,0x7
   14132a6bf:	75 13                	jne    0x14132a6d4
   14132a6c1:	4d 8b c7             	mov    r8,r15
   14132a6c4:	48 8d 15 2d 6a 35 00 	lea    rdx,[rip+0x356a2d]        # 0x1416810f8
   14132a6cb:	e8 b4 b6 20 00       	call   0x141535d84
   14132a6d0:	85 c0                	test   eax,eax
   14132a6d2:	74 30                	je     0x14132a704
   14132a6d4:	49 83 fc 0f          	cmp    r12,0xf
   14132a6d8:	76 03                	jbe    0x14132a6dd
   14132a6da:	48 8b 3f             	mov    rdi,QWORD PTR [rdi]
   14132a6dd:	4d 8b c7             	mov    r8,r15
   14132a6e0:	48 8b d7             	mov    rdx,rdi
   14132a6e3:	48 8b ce             	mov    rcx,rsi
   14132a6e6:	e8 b5 52 d4 fe       	call   0x14006f9a0
   14132a6eb:	bf 01 00 00 00       	mov    edi,0x1
   14132a6f0:	44 8b c7             	mov    r8d,edi
   14132a6f3:	48 8d 15 26 90 2b 00 	lea    rdx,[rip+0x2b9026]        # 0x1415e3720
   14132a6fa:	48 8b ce             	mov    rcx,rsi
   14132a6fd:	e8 9e 52 d4 fe       	call   0x14006f9a0
   14132a702:	eb 05                	jmp    0x14132a709
   14132a704:	bf 01 00 00 00       	mov    edi,0x1
   14132a709:	41 80 be 38 08 00 00 	cmp    BYTE PTR [r14+0x838],0x0
   14132a710:	00 
   14132a711:	74 43                	je     0x14132a756
   14132a713:	49 83 be 50 08 00 00 	cmp    QWORD PTR [r14+0x850],0x0
   14132a71a:	00 
   14132a71b:	75 39                	jne    0x14132a756
   14132a71d:	49 83 be 90 08 00 00 	cmp    QWORD PTR [r14+0x890],0x0
   14132a724:	00 
   14132a725:	74 2f                	je     0x14132a756
   14132a727:	49 8d 96 80 08 00 00 	lea    rdx,[r14+0x880]
   14132a72e:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132a732:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132a737:	76 03                	jbe    0x14132a73c
   14132a739:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132a73c:	48 8b ce             	mov    rcx,rsi
   14132a73f:	e8 5c 52 d4 fe       	call   0x14006f9a0
   14132a744:	4c 8b c7             	mov    r8,rdi
   14132a747:	48 8d 15 d2 8f 2b 00 	lea    rdx,[rip+0x2b8fd2]        # 0x1415e3720
   14132a74e:	48 8b ce             	mov    rcx,rsi
   14132a751:	e8 4a 52 d4 fe       	call   0x14006f9a0
   14132a756:	48 8d 55 cf          	lea    rdx,[rbp-0x31]
   14132a75a:	48 83 7d e7 0f       	cmp    QWORD PTR [rbp-0x19],0xf
   14132a75f:	48 0f 47 55 cf       	cmova  rdx,QWORD PTR [rbp-0x31]
   14132a764:	4c 8b 45 df          	mov    r8,QWORD PTR [rbp-0x21]
   14132a768:	48 8b ce             	mov    rcx,rsi
   14132a76b:	e8 30 52 d4 fe       	call   0x14006f9a0
   14132a770:	41 80 be 38 08 00 00 	cmp    BYTE PTR [r14+0x838],0x0
   14132a777:	00 
   14132a778:	74 65                	je     0x14132a7df
   14132a77a:	49 83 be 50 08 00 00 	cmp    QWORD PTR [r14+0x850],0x0
   14132a781:	00 
   14132a782:	74 5b                	je     0x14132a7df
   14132a784:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132a789:	74 0c                	je     0x14132a797
   14132a78b:	4c 8b c7             	mov    r8,rdi
   14132a78e:	48 8d 15 8b 8f 2b 00 	lea    rdx,[rip+0x2b8f8b]        # 0x1415e3720
   14132a795:	eb 23                	jmp    0x14132a7ba
   14132a797:	41 83 fd 01          	cmp    r13d,0x1
   14132a79b:	75 0b                	jne    0x14132a7a8
   14132a79d:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132a7a3:	48 8b d3             	mov    rdx,rbx
   14132a7a6:	eb 12                	jmp    0x14132a7ba
   14132a7a8:	45 85 ed             	test   r13d,r13d
   14132a7ab:	75 15                	jne    0x14132a7c2
   14132a7ad:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132a7b3:	48 8d 15 5e de 2b 00 	lea    rdx,[rip+0x2bde5e]        # 0x1415e8618
   14132a7ba:	48 8b ce             	mov    rcx,rsi
   14132a7bd:	e8 de 51 d4 fe       	call   0x14006f9a0
   14132a7c2:	49 8d 96 40 08 00 00 	lea    rdx,[r14+0x840]
   14132a7c9:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132a7cd:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132a7d2:	76 03                	jbe    0x14132a7d7
   14132a7d4:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132a7d7:	48 8b ce             	mov    rcx,rsi
   14132a7da:	e8 c1 51 d4 fe       	call   0x14006f9a0
   14132a7df:	49 83 be 80 0d 00 00 	cmp    QWORD PTR [r14+0xd80],0x0
   14132a7e6:	00 
   14132a7e7:	74 56                	je     0x14132a83f
   14132a7e9:	48 83 7e 10 00       	cmp    QWORD PTR [rsi+0x10],0x0
   14132a7ee:	75 3a                	jne    0x14132a82a
   14132a7f0:	41 83 fd 01          	cmp    r13d,0x1
   14132a7f4:	75 0b                	jne    0x14132a801
   14132a7f6:	41 b8 04 00 00 00    	mov    r8d,0x4
   14132a7fc:	48 8b d3             	mov    rdx,rbx
   14132a7ff:	eb 12                	jmp    0x14132a813
   14132a801:	45 85 ed             	test   r13d,r13d
   14132a804:	75 15                	jne    0x14132a81b
   14132a806:	41 b8 02 00 00 00    	mov    r8d,0x2
   14132a80c:	48 8d 15 05 de 2b 00 	lea    rdx,[rip+0x2bde05]        # 0x1415e8618
   14132a813:	48 8b ce             	mov    rcx,rsi
   14132a816:	e8 85 51 d4 fe       	call   0x14006f9a0
   14132a81b:	41 b8 06 00 00 00    	mov    r8d,0x6
   14132a821:	48 8d 15 5c 04 3a 00 	lea    rdx,[rip+0x3a045c]        # 0x1416cac84
   14132a828:	eb 0d                	jmp    0x14132a837
   14132a82a:	41 b8 07 00 00 00    	mov    r8d,0x7
   14132a830:	48 8d 15 c1 f7 40 00 	lea    rdx,[rip+0x40f7c1]        # 0x141739ff8
   14132a837:	48 8b ce             	mov    rcx,rsi
   14132a83a:	e8 61 51 d4 fe       	call   0x14006f9a0
   14132a83f:	80 7c 24 40 00       	cmp    BYTE PTR [rsp+0x40],0x0
   14132a844:	74 09                	je     0x14132a84f
   14132a846:	48 8b ce             	mov    rcx,rsi
   14132a849:	e8 22 08 20 ff       	call   0x14052b070
   14132a84e:	90                   	nop
   14132a84f:	48 8b 55 e7          	mov    rdx,QWORD PTR [rbp-0x19]
   14132a853:	48 83 fa 0f          	cmp    rdx,0xf
   14132a857:	76 61                	jbe    0x14132a8ba
   14132a859:	48 ff c2             	inc    rdx
   14132a85c:	48 8b 4d cf          	mov    rcx,QWORD PTR [rbp-0x31]
   14132a860:	48 8b c1             	mov    rax,rcx
   14132a863:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14132a86a:	72 1c                	jb     0x14132a888
   14132a86c:	48 83 c2 27          	add    rdx,0x27
   14132a870:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14132a874:	48 2b c1             	sub    rax,rcx
   14132a877:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14132a87b:	48 83 f8 1f          	cmp    rax,0x1f
   14132a87f:	76 07                	jbe    0x14132a888
   14132a881:	ff 15 19 62 2b 00    	call   QWORD PTR [rip+0x2b6219]        # 0x1415e0aa0
   14132a887:	cc                   	int3
   14132a888:	e8 63 9d 20 00       	call   0x1415345f0
   14132a88d:	eb 2b                	jmp    0x14132a8ba
   14132a88f:	49 8d 56 08          	lea    rdx,[r14+0x8]
   14132a893:	48 3b f2             	cmp    rsi,rdx
   14132a896:	74 16                	je     0x14132a8ae
   14132a898:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14132a89d:	4c 8b 42 10          	mov    r8,QWORD PTR [rdx+0x10]
   14132a8a1:	76 03                	jbe    0x14132a8a6
   14132a8a3:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14132a8a6:	48 8b ce             	mov    rcx,rsi
   14132a8a9:	e8 b2 4f d4 fe       	call   0x14006f860
   14132a8ae:	84 db                	test   bl,bl
   14132a8b0:	74 08                	je     0x14132a8ba
   14132a8b2:	48 8b ce             	mov    rcx,rsi
   14132a8b5:	e8 b6 07 20 ff       	call   0x14052b070
   14132a8ba:	48 8b 4d 0f          	mov    rcx,QWORD PTR [rbp+0xf]
   14132a8be:	48 33 cc             	xor    rcx,rsp
   14132a8c1:	e8 0a 9d 20 00       	call   0x1415345d0
   14132a8c6:	48 8b 9c 24 40 01 00 	mov    rbx,QWORD PTR [rsp+0x140]
   14132a8cd:	00 
   14132a8ce:	48 81 c4 f0 00 00 00 	add    rsp,0xf0
   14132a8d5:	41 5f                	pop    r15
   14132a8d7:	41 5e                	pop    r14
   14132a8d9:	41 5d                	pop    r13
   14132a8db:	41 5c                	pop    r12
   14132a8dd:	5f                   	pop    rdi
   14132a8de:	5e                   	pop    rsi
   14132a8df:	5d                   	pop    rbp
   14132a8e0:	c3                   	ret
