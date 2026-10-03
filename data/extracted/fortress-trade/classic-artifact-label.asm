
C:/Users/WIN11/Downloads/df_53_16_win/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140b91440 <.text+0xb90440>:
   140b91440:	mov    QWORD PTR [rsp+0x8],rbx
   140b91445:	mov    QWORD PTR [rsp+0x18],rbp
   140b9144a:	push   rsi
   140b9144b:	push   rdi
   140b9144c:	push   r14
   140b9144e:	sub    rsp,0x50
   140b91452:	mov    rax,QWORD PTR [rip+0xd04be7]        # 0x141896040
   140b91459:	xor    rax,rsp
   140b9145c:	mov    QWORD PTR [rsp+0x40],rax
   140b91461:	mov    r14d,r9d
   140b91464:	mov    rbp,rdx
   140b91467:	mov    r9,QWORD PTR [rip+0x184ec0a]        # 0x1423e0078
   140b9146e:	mov    r11,QWORD PTR [rip+0x184ebfb]        # 0x1423e0070
   140b91475:	sub    r9,r11
   140b91478:	sar    r9,0x3
   140b9147c:	test   r9d,r9d
   140b9147f:	je     0x140b914b6
   140b91481:	cmp    r8d,0xffffffff
   140b91485:	je     0x140b914b6
   140b91487:	xor    edx,edx
   140b91489:	sub    r9d,0x1
   140b9148d:	js     0x140b914b6
   140b9148f:	nop
   140b91490:	lea    ecx,[rdx+r9*1]
   140b91494:	sar    ecx,1
   140b91496:	movsxd rax,ecx
   140b91499:	mov    rbx,QWORD PTR [r11+rax*8]
   140b9149d:	cmp    DWORD PTR [rbx],r8d
   140b914a0:	je     0x140b914b8
   140b914a2:	lea    eax,[rcx+0x1]
   140b914a5:	cmovle edx,eax
   140b914a8:	lea    eax,[rcx-0x1]
   140b914ab:	cmovle eax,r9d
   140b914af:	mov    r9d,eax
   140b914b2:	cmp    edx,eax
   140b914b4:	jle    0x140b91490
   140b914b6:	xor    ebx,ebx
   140b914b8:	test   rbx,rbx
   140b914bb:	je     0x140b91718
   140b914c1:	and    r14d,0x2
   140b914c5:	lea    rdi,[rbx+0x90]
   140b914cc:	je     0x140b91542
   140b914ce:	mov    rcx,QWORD PTR [rdi]
   140b914d1:	mov    rax,QWORD PTR [rcx]
   140b914d4:	call   QWORD PTR [rax]
   140b914d6:	cmp    ax,0x59
   140b914da:	je     0x140b9150e
   140b914dc:	mov    rcx,QWORD PTR [rdi]
   140b914df:	mov    rax,QWORD PTR [rcx]
   140b914e2:	mov    edx,0x14
   140b914e7:	call   QWORD PTR [rax+0xe0]
   140b914ed:	test   al,al
   140b914ef:	jne    0x140b9150e
   140b914f1:	mov    rcx,QWORD PTR [rdi]
   140b914f4:	mov    rax,QWORD PTR [rcx]
   140b914f7:	call   QWORD PTR [rax]
   140b914f9:	cmp    ax,0x57
   140b914fd:	je     0x140b9150e
   140b914ff:	lea    rdx,[rip+0xa6751a]        # 0x1415f8a20
   140b91506:	mov    r8d,0x10
   140b9150c:	jmp    0x140b9151b
   140b9150e:	lea    rdx,[rip+0xb48fd3]        # 0x1416da4e8
   140b91515:	mov    r8d,0xc
   140b9151b:	mov    rcx,rbp
   140b9151e:	call   0x14006f9a0
   140b91523:	mov    rdx,rbp
   140b91526:	mov    ecx,DWORD PTR [rbx]
   140b91528:	call   0x140529cf0
   140b9152d:	mov    r8d,0x1
   140b91533:	lea    rdx,[rip+0xa6712a]        # 0x1415f8664
   140b9153a:	mov    rcx,rbp
   140b9153d:	call   0x14006f9a0
   140b91542:	xorps  xmm0,xmm0
   140b91545:	movups XMMWORD PTR [rsp+0x20],xmm0
   140b9154a:	mov    QWORD PTR [rsp+0x30],0x0
   140b91553:	mov    QWORD PTR [rsp+0x38],0xf
   140b9155c:	mov    BYTE PTR [rsp+0x20],0x0
   140b91561:	lea    rcx,[rbx+0x8]
   140b91565:	xor    r9d,r9d
   140b91568:	mov    r8b,0x1
   140b9156b:	lea    rdx,[rsp+0x20]
   140b91570:	call   0x140a91760
   140b91575:	cmp    QWORD PTR [rsp+0x30],0x0
   140b9157b:	jne    0x140b9169d
   140b91581:	mov    rcx,QWORD PTR [rdi]
   140b91584:	mov    rax,QWORD PTR [rcx]
   140b91587:	call   QWORD PTR [rax]
   140b91589:	cmp    ax,0x59
   140b9158d:	je     0x140b915cd
   140b9158f:	mov    rcx,QWORD PTR [rdi]
   140b91592:	mov    rax,QWORD PTR [rcx]
   140b91595:	mov    edx,0x14
   140b9159a:	call   QWORD PTR [rax+0xe0]
   140b915a0:	test   al,al
   140b915a2:	jne    0x140b915cd
   140b915a4:	mov    rcx,QWORD PTR [rdi]
   140b915a7:	mov    rax,QWORD PTR [rcx]
   140b915aa:	call   QWORD PTR [rax]
   140b915ac:	cmp    ax,0x57
   140b915b0:	je     0x140b915cd
   140b915b2:	mov    r9d,0x1
   140b915b8:	xor    r8d,r8d
   140b915bb:	lea    rdx,[rsp+0x20]
   140b915c0:	mov    rcx,QWORD PTR [rdi]
   140b915c3:	call   0x140c62490
   140b915c8:	jmp    0x140b9169d
   140b915cd:	mov    rbx,QWORD PTR [rsp+0x38]
   140b915d2:	cmp    rbx,0x8
   140b915d6:	jb     0x140b91606
   140b915d8:	lea    rax,[rsp+0x20]
   140b915dd:	cmp    rbx,0xf
   140b915e1:	cmova  rax,QWORD PTR [rsp+0x20]
   140b915e7:	mov    QWORD PTR [rsp+0x30],0x8
   140b915f0:	movabs rcx,0x64656c7469746e55
   140b915fa:	mov    QWORD PTR [rax],rcx
   140b915fd:	mov    BYTE PTR [rax+0x8],0x0
   140b91601:	jmp    0x140b9169d
   140b91606:	mov    rcx,rbx
   140b91609:	shr    rcx,1
   140b9160c:	movabs rdi,0x7fffffffffffffff
   140b91616:	mov    rax,rdi
   140b91619:	sub    rax,rcx
   140b9161c:	cmp    rbx,rax
   140b9161f:	ja     0x140b91631
   140b91621:	lea    rax,[rcx+rbx*1]
   140b91625:	mov    edi,0xf
   140b9162a:	cmp    rax,rdi
   140b9162d:	cmova  rdi,rax
   140b91631:	lea    rcx,[rdi+0x1]
   140b91635:	call   0x140070760
   140b9163a:	mov    rsi,rax
   140b9163d:	mov    QWORD PTR [rsp+0x30],0x8
   140b91646:	mov    QWORD PTR [rsp+0x38],rdi
   140b9164b:	movabs rcx,0x64656c7469746e55
   140b91655:	mov    QWORD PTR [rax],rcx
   140b91658:	mov    BYTE PTR [rax+0x8],0x0
   140b9165c:	cmp    rbx,0xf
   140b91660:	jbe    0x140b91698
   140b91662:	lea    rdx,[rbx+0x1]
   140b91666:	mov    rcx,QWORD PTR [rsp+0x20]
   140b9166b:	mov    rax,rcx
   140b9166e:	cmp    rdx,0x1000
   140b91675:	jb     0x140b91693
   140b91677:	add    rdx,0x27
   140b9167b:	mov    rcx,QWORD PTR [rcx-0x8]
   140b9167f:	sub    rax,rcx
   140b91682:	add    rax,0xfffffffffffffff8
   140b91686:	cmp    rax,0x1f
   140b9168a:	jbe    0x140b91693
   140b9168c:	call   QWORD PTR [rip+0xa4f40e]        # 0x1415e0aa0
   140b91692:	int3
   140b91693:	call   0x1415345f0
   140b91698:	mov    QWORD PTR [rsp+0x20],rsi
   140b9169d:	lea    rdx,[rsp+0x20]
   140b916a2:	cmp    QWORD PTR [rsp+0x38],0xf
   140b916a8:	cmova  rdx,QWORD PTR [rsp+0x20]
   140b916ae:	mov    r8,QWORD PTR [rsp+0x30]
   140b916b3:	mov    rcx,rbp
   140b916b6:	call   0x14006f9a0
   140b916bb:	test   r14d,r14d
   140b916be:	je     0x140b916d6
   140b916c0:	mov    r8d,0x8
   140b916c6:	lea    rdx,[rip+0xa67483]        # 0x1415f8b50
   140b916cd:	mov    rcx,rbp
   140b916d0:	call   0x14006f9a0
   140b916d5:	nop
   140b916d6:	mov    rdx,QWORD PTR [rsp+0x38]
   140b916db:	cmp    rdx,0xf
   140b916df:	jbe    0x140b9172d
   140b916e1:	inc    rdx
   140b916e4:	mov    rcx,QWORD PTR [rsp+0x20]
   140b916e9:	mov    rax,rcx
   140b916ec:	cmp    rdx,0x1000
   140b916f3:	jb     0x140b91711
   140b916f5:	add    rdx,0x27
   140b916f9:	mov    rcx,QWORD PTR [rcx-0x8]
   140b916fd:	sub    rax,rcx
   140b91700:	add    rax,0xfffffffffffffff8
   140b91704:	cmp    rax,0x1f
   140b91708:	jbe    0x140b91711
   140b9170a:	call   QWORD PTR [rip+0xa4f390]        # 0x1415e0aa0
   140b91710:	int3
   140b91711:	call   0x1415345f0
   140b91716:	jmp    0x140b9172d
   140b91718:	mov    r8d,0x13
   140b9171e:	lea    rdx,[rip+0xb48dab]        # 0x1416da4d0
   140b91725:	mov    rcx,rbp
   140b91728:	call   0x14006f9a0
   140b9172d:	mov    rcx,QWORD PTR [rsp+0x40]
   140b91732:	xor    rcx,rsp
   140b91735:	call   0x1415345d0
   140b9173a:	mov    rbx,QWORD PTR [rsp+0x70]
   140b9173f:	mov    rbp,QWORD PTR [rsp+0x80]
   140b91747:	add    rsp,0x50
   140b9174b:	pop    r14
   140b9174d:	pop    rdi
   140b9174e:	pop    rsi
   140b9174f:	ret
