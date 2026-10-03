
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140b94400 <.text+0xb93400>:
   140b94400:	mov    QWORD PTR [rsp+0x8],rbx
   140b94405:	mov    QWORD PTR [rsp+0x18],rbp
   140b9440a:	push   rsi
   140b9440b:	push   rdi
   140b9440c:	push   r14
   140b9440e:	sub    rsp,0x50
   140b94412:	mov    rax,QWORD PTR [rip+0xd07c27]        # 0x14189c040
   140b94419:	xor    rax,rsp
   140b9441c:	mov    QWORD PTR [rsp+0x40],rax
   140b94421:	mov    r14d,r9d
   140b94424:	mov    rbp,rdx
   140b94427:	mov    r9,QWORD PTR [rip+0x1851d5a]        # 0x1423e6188
   140b9442e:	mov    r11,QWORD PTR [rip+0x1851d4b]        # 0x1423e6180
   140b94435:	sub    r9,r11
   140b94438:	sar    r9,0x3
   140b9443c:	test   r9d,r9d
   140b9443f:	je     0x140b94476
   140b94441:	cmp    r8d,0xffffffff
   140b94445:	je     0x140b94476
   140b94447:	xor    edx,edx
   140b94449:	sub    r9d,0x1
   140b9444d:	js     0x140b94476
   140b9444f:	nop
   140b94450:	lea    ecx,[rdx+r9*1]
   140b94454:	sar    ecx,1
   140b94456:	movsxd rax,ecx
   140b94459:	mov    rbx,QWORD PTR [r11+rax*8]
   140b9445d:	cmp    DWORD PTR [rbx],r8d
   140b94460:	je     0x140b94478
   140b94462:	lea    eax,[rcx+0x1]
   140b94465:	cmovle edx,eax
   140b94468:	lea    eax,[rcx-0x1]
   140b9446b:	cmovle eax,r9d
   140b9446f:	mov    r9d,eax
   140b94472:	cmp    edx,eax
   140b94474:	jle    0x140b94450
   140b94476:	xor    ebx,ebx
   140b94478:	test   rbx,rbx
   140b9447b:	je     0x140b946d8
   140b94481:	and    r14d,0x2
   140b94485:	lea    rdi,[rbx+0x90]
   140b9448c:	je     0x140b94502
   140b9448e:	mov    rcx,QWORD PTR [rdi]
   140b94491:	mov    rax,QWORD PTR [rcx]
   140b94494:	call   QWORD PTR [rax]
   140b94496:	cmp    ax,0x59
   140b9449a:	je     0x140b944ce
   140b9449c:	mov    rcx,QWORD PTR [rdi]
   140b9449f:	mov    rax,QWORD PTR [rcx]
   140b944a2:	mov    edx,0x14
   140b944a7:	call   QWORD PTR [rax+0xe0]
   140b944ad:	test   al,al
   140b944af:	jne    0x140b944ce
   140b944b1:	mov    rcx,QWORD PTR [rdi]
   140b944b4:	mov    rax,QWORD PTR [rcx]
   140b944b7:	call   QWORD PTR [rax]
   140b944b9:	cmp    ax,0x57
   140b944bd:	je     0x140b944ce
   140b944bf:	lea    rdx,[rip+0xa695e2]        # 0x1415fdaa8
   140b944c6:	mov    r8d,0x10
   140b944cc:	jmp    0x140b944db
   140b944ce:	lea    rdx,[rip+0xb4b243]        # 0x1416df718
   140b944d5:	mov    r8d,0xc
   140b944db:	mov    rcx,rbp
   140b944de:	call   0x14006fa10
   140b944e3:	mov    rdx,rbp
   140b944e6:	mov    ecx,DWORD PTR [rbx]
   140b944e8:	call   0x14052c130
   140b944ed:	mov    r8d,0x1
   140b944f3:	lea    rdx,[rip+0xa69196]        # 0x1415fd690
   140b944fa:	mov    rcx,rbp
   140b944fd:	call   0x14006fa10
   140b94502:	xorps  xmm0,xmm0
   140b94505:	movups XMMWORD PTR [rsp+0x20],xmm0
   140b9450a:	mov    QWORD PTR [rsp+0x30],0x0
   140b94513:	mov    QWORD PTR [rsp+0x38],0xf
   140b9451c:	mov    BYTE PTR [rsp+0x20],0x0
   140b94521:	lea    rcx,[rbx+0x8]
   140b94525:	xor    r9d,r9d
   140b94528:	mov    r8b,0x1
   140b9452b:	lea    rdx,[rsp+0x20]
   140b94530:	call   0x140a946e0
   140b94535:	cmp    QWORD PTR [rsp+0x30],0x0
   140b9453b:	jne    0x140b9465d
   140b94541:	mov    rcx,QWORD PTR [rdi]
   140b94544:	mov    rax,QWORD PTR [rcx]
   140b94547:	call   QWORD PTR [rax]
   140b94549:	cmp    ax,0x59
   140b9454d:	je     0x140b9458d
   140b9454f:	mov    rcx,QWORD PTR [rdi]
   140b94552:	mov    rax,QWORD PTR [rcx]
   140b94555:	mov    edx,0x14
   140b9455a:	call   QWORD PTR [rax+0xe0]
   140b94560:	test   al,al
   140b94562:	jne    0x140b9458d
   140b94564:	mov    rcx,QWORD PTR [rdi]
   140b94567:	mov    rax,QWORD PTR [rcx]
   140b9456a:	call   QWORD PTR [rax]
   140b9456c:	cmp    ax,0x57
   140b94570:	je     0x140b9458d
   140b94572:	mov    r9d,0x1
   140b94578:	xor    r8d,r8d
   140b9457b:	lea    rdx,[rsp+0x20]
   140b94580:	mov    rcx,QWORD PTR [rdi]
   140b94583:	call   0x140c65450
   140b94588:	jmp    0x140b9465d
   140b9458d:	mov    rbx,QWORD PTR [rsp+0x38]
   140b94592:	cmp    rbx,0x8
   140b94596:	jb     0x140b945c6
   140b94598:	lea    rax,[rsp+0x20]
   140b9459d:	cmp    rbx,0xf
   140b945a1:	cmova  rax,QWORD PTR [rsp+0x20]
   140b945a7:	mov    QWORD PTR [rsp+0x30],0x8
   140b945b0:	movabs rcx,0x64656c7469746e55
   140b945ba:	mov    QWORD PTR [rax],rcx
   140b945bd:	mov    BYTE PTR [rax+0x8],0x0
   140b945c1:	jmp    0x140b9465d
   140b945c6:	mov    rcx,rbx
   140b945c9:	shr    rcx,1
   140b945cc:	movabs rdi,0x7fffffffffffffff
   140b945d6:	mov    rax,rdi
   140b945d9:	sub    rax,rcx
   140b945dc:	cmp    rbx,rax
   140b945df:	ja     0x140b945f1
   140b945e1:	lea    rax,[rcx+rbx*1]
   140b945e5:	mov    edi,0xf
   140b945ea:	cmp    rax,rdi
   140b945ed:	cmova  rdi,rax
   140b945f1:	lea    rcx,[rdi+0x1]
   140b945f5:	call   0x1400707d0
   140b945fa:	mov    rsi,rax
   140b945fd:	mov    QWORD PTR [rsp+0x30],0x8
   140b94606:	mov    QWORD PTR [rsp+0x38],rdi
   140b9460b:	movabs rcx,0x64656c7469746e55
   140b94615:	mov    QWORD PTR [rax],rcx
   140b94618:	mov    BYTE PTR [rax+0x8],0x0
   140b9461c:	cmp    rbx,0xf
   140b94620:	jbe    0x140b94658
   140b94622:	lea    rdx,[rbx+0x1]
   140b94626:	mov    rcx,QWORD PTR [rsp+0x20]
   140b9462b:	mov    rax,rcx
   140b9462e:	cmp    rdx,0x1000
   140b94635:	jb     0x140b94653
   140b94637:	add    rdx,0x27
   140b9463b:	mov    rcx,QWORD PTR [rcx-0x8]
   140b9463f:	sub    rax,rcx
   140b94642:	add    rax,0xfffffffffffffff8
   140b94646:	cmp    rax,0x1f
   140b9464a:	jbe    0x140b94653
   140b9464c:	call   QWORD PTR [rip+0xa514d6]        # 0x1415e5b28
   140b94652:	int3
   140b94653:	call   0x141539680
   140b94658:	mov    QWORD PTR [rsp+0x20],rsi
   140b9465d:	lea    rdx,[rsp+0x20]
   140b94662:	cmp    QWORD PTR [rsp+0x38],0xf
   140b94668:	cmova  rdx,QWORD PTR [rsp+0x20]
   140b9466e:	mov    r8,QWORD PTR [rsp+0x30]
   140b94673:	mov    rcx,rbp
   140b94676:	call   0x14006fa10
   140b9467b:	test   r14d,r14d
   140b9467e:	je     0x140b94696
   140b94680:	mov    r8d,0x8
   140b94686:	lea    rdx,[rip+0xa693fb]        # 0x1415fda88
   140b9468d:	mov    rcx,rbp
   140b94690:	call   0x14006fa10
   140b94695:	nop
   140b94696:	mov    rdx,QWORD PTR [rsp+0x38]
   140b9469b:	cmp    rdx,0xf
   140b9469f:	jbe    0x140b946ed
   140b946a1:	inc    rdx
   140b946a4:	mov    rcx,QWORD PTR [rsp+0x20]
   140b946a9:	mov    rax,rcx
   140b946ac:	cmp    rdx,0x1000
   140b946b3:	jb     0x140b946d1
   140b946b5:	add    rdx,0x27
   140b946b9:	mov    rcx,QWORD PTR [rcx-0x8]
   140b946bd:	sub    rax,rcx
   140b946c0:	add    rax,0xfffffffffffffff8
   140b946c4:	cmp    rax,0x1f
   140b946c8:	jbe    0x140b946d1
   140b946ca:	call   QWORD PTR [rip+0xa51458]        # 0x1415e5b28
   140b946d0:	int3
   140b946d1:	call   0x141539680
   140b946d6:	jmp    0x140b946ed
   140b946d8:	mov    r8d,0x13
   140b946de:	lea    rdx,[rip+0xb4b01b]        # 0x1416df700
   140b946e5:	mov    rcx,rbp
   140b946e8:	call   0x14006fa10
   140b946ed:	mov    rcx,QWORD PTR [rsp+0x40]
   140b946f2:	xor    rcx,rsp
   140b946f5:	call   0x141539660
   140b946fa:	mov    rbx,QWORD PTR [rsp+0x70]
   140b946ff:	mov    rbp,QWORD PTR [rsp+0x80]
   140b94707:	add    rsp,0x50
   140b9470b:	pop    r14
   140b9470d:	pop    rdi
   140b9470e:	pop    rsi
   140b9470f:	ret
