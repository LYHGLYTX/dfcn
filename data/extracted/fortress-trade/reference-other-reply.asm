
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

00000001408b73d0 <.text+0x8b63d0>:
   1408b73d0:	inc    BYTE PTR [rax]
   1408b73d2:	add    BYTE PTR [rax-0x148acc3],al
   1408b73d8:	add    BYTE PTR [rax],al
   1408b73da:	je     0x1408b9049
   1408b73e0:	cmp    BYTE PTR [rip+0x1ad91ee],0x0        # 0x1423905d5
   1408b73e7:	je     0x1408b7448
   1408b73e9:	cmp    BYTE PTR [rip+0x1ad91de],0x0        # 0x1423905ce
   1408b73f0:	je     0x1408b7448
   1408b73f2:	lea    rcx,[rbp-0x50]
   1408b73f6:	call   0x1400bb360
   1408b73fb:	lea    ecx,[rbx-0x1]
   1408b73fe:	lea    ecx,[rcx+rcx*2]
   1408b7401:	lea    eax,[rcx+0x7]
   1408b7404:	mov    r9d,DWORD PTR [rip+0xfeb82d]        # 0x1418a2c38
   1408b740b:	dec    r9d
   1408b740e:	mov    DWORD PTR [rsp+0x30],eax
   1408b7412:	mov    DWORD PTR [rsp+0x28],r12d
   1408b7417:	mov    DWORD PTR [rsp+0x20],ecx
   1408b741b:	xor    r8d,r8d
   1408b741e:	mov    edx,DWORD PTR [rip+0xfeb704]        # 0x1418a2b28
   1408b7424:	lea    rcx,[rbp-0x50]
   1408b7428:	call   0x1400bb380
   1408b742d:	mov    edx,DWORD PTR [rsp+0x40]
   1408b7431:	lea    rcx,[rbp-0x50]
   1408b7435:	call   0x14140f200
   1408b743a:	mov    eax,DWORD PTR [rbp-0x50]
   1408b743d:	mov    DWORD PTR [rip+0xfeb6e5],eax        # 0x1418a2b28
   1408b7443:	jmp    0x1408b9049
   1408b7448:	mov    BYTE PTR [rip+0xfeb6de],0x0        # 0x1418a2b2d
   1408b744f:	jmp    0x1408b9049
   1408b7454:	cmp    BYTE PTR [rip+0xfead55],0x0        # 0x1418a21b0
   1408b745b:	je     0x1408b7840
   1408b7461:	cmp    BYTE PTR [rip+0xfead49],0x0        # 0x1418a21b1
   1408b7468:	je     0x1408b753e
   1408b746e:	mov    DWORD PTR [rsp+0x68],0xffffffff
   1408b7476:	mov    DWORD PTR [rsp+0x40],0xffffffff
   1408b747e:	cmp    BYTE PTR [rip+0x1ad9150],0x0        # 0x1423905d5
   1408b7485:	je     0x1408b749d
   1408b7487:	lea    r8,[rsp+0x40]
   1408b748c:	lea    rdx,[rsp+0x68]
   1408b7491:	lea    rcx,[rip+0x1d92f58]        # 0x14264a3f0
   1408b7498:	call   0x1400bb340
   1408b749d:	mov    ecx,DWORD PTR [rip+0x1b162e5]        # 0x1423cd788
   1408b74a3:	add    ecx,0xfffffff3
   1408b74a6:	mov    eax,0x55555556
   1408b74ab:	imul   ecx
   1408b74ad:	mov    ebx,edx
   1408b74af:	shr    ebx,0x1f
   1408b74b2:	add    ebx,edx
   1408b74b4:	lea    rcx,[rip+0xfeacfd]        # 0x1418a21b8
   1408b74bb:	call   0x14006ee50
   1408b74c0:	mov    rdi,rax
   1408b74c3:	cmp    BYTE PTR [rip+0xfead0a],0x0        # 0x1418a21d4
   1408b74ca:	je     0x1408b9049
   1408b74d0:	cmp    BYTE PTR [rip+0x1ad90fe],0x0        # 0x1423905d5
   1408b74d7:	je     0x1408b7532
   1408b74d9:	cmp    BYTE PTR [rip+0x1ad90ee],0x0        # 0x1423905ce
   1408b74e0:	je     0x1408b7532
   1408b74e2:	lea    rcx,[rbp-0x50]
   1408b74e6:	call   0x1400bb360
   1408b74eb:	lea    ecx,[rbx+0x2]
   1408b74ee:	lea    eax,[rcx+rcx*2]
   1408b74f1:	lea    r9d,[rdi-0x1]
   1408b74f5:	mov    DWORD PTR [rsp+0x30],eax
   1408b74f9:	mov    DWORD PTR [rsp+0x28],0x9
   1408b7501:	mov    DWORD PTR [rsp+0x20],ebx
   1408b7505:	xor    r8d,r8d
   1408b7508:	mov    edx,DWORD PTR [rip+0xfeacc2]        # 0x1418a21d0
   1408b750e:	lea    rcx,[rbp-0x50]
   1408b7512:	call   0x1400bb380
   1408b7517:	mov    edx,DWORD PTR [rsp+0x40]
   1408b751b:	lea    rcx,[rbp-0x50]
   1408b751f:	call   0x14140f200
   1408b7524:	mov    eax,DWORD PTR [rbp-0x50]
   1408b7527:	mov    DWORD PTR [rip+0xfeaca3],eax        # 0x1418a21d0
   1408b752d:	jmp    0x1408b9049
   1408b7532:	mov    BYTE PTR [rip+0xfeac9b],0x0        # 0x1418a21d4
   1408b7539:	jmp    0x1408b9049
   1408b753e:	cmp    BYTE PTR [rip+0xfeaf9b],0x0        # 0x1418a24e0
   1408b7545:	jne    0x1408b758c
   1408b7547:	cmp    BYTE PTR [rip+0xfeaf93],0x0        # 0x1418a24e1
   1408b754e:	jne    0x1408b758c
   1408b7550:	lea    rcx,[rip+0xfeb019]        # 0x1418a2570
   1408b7557:	call   0x14006ee50
   1408b755c:	test   rax,rax
   1408b755f:	je     0x1408b756a
   1408b7561:	cmp    BYTE PTR [rip+0xfeb024],0x0        # 0x1418a258c
   1408b7568:	jne    0x1408b758c
   1408b756a:	lea    rcx,[rip+0xfeafbf]        # 0x1418a2530
   1408b7571:	call   0x14006ee50
   1408b7576:	test   rax,rax
   1408b7579:	je     0x1408b9049
   1408b757f:	cmp    BYTE PTR [rip+0xfeafc6],0x0        # 0x1418a254c
   1408b7586:	je     0x1408b9049
   1408b758c:	mov    DWORD PTR [rsp+0x68],0xffffffff
   1408b7594:	mov    DWORD PTR [rsp+0x40],0xffffffff
   1408b759c:	cmp    BYTE PTR [rip+0x1ad9032],0x0        # 0x1423905d5
   1408b75a3:	je     0x1408b75bb
   1408b75a5:	lea    r8,[rsp+0x40]
   1408b75aa:	lea    rdx,[rsp+0x68]
   1408b75af:	lea    rcx,[rip+0x1d92e3a]        # 0x14264a3f0
   1408b75b6:	call   0x1400bb340
   1408b75bb:	mov    ebx,DWORD PTR [rip+0x1b161c7]        # 0x1423cd788
   1408b75c1:	add    ebx,0xfffffffc
   1408b75c4:	cmp    WORD PTR [rip+0xfeaf5e],0xffff        # 0x1418a252a
   1408b75cc:	jne    0x1408b7601
   1408b75ce:	lea    rcx,[rip+0xfeaf9b]        # 0x1418a2570
   1408b75d5:	call   0x14006ee50
   1408b75da:	test   rax,rax
   1408b75dd:	je     0x1408b7601
   1408b75df:	lea    rcx,[rip+0xfeaf8a]        # 0x1418a2570
   1408b75e6:	call   0x14006ee50
   1408b75eb:	xor    ecx,ecx
   1408b75ed:	add    eax,0xfffffffe
   1408b75f0:	cmovns ecx,eax
   1408b75f3:	mov    edx,0x5
   1408b75f8:	cmp    ecx,edx
   1408b75fa:	cmovg  ecx,edx
   1408b75fd:	lea    r12d,[rcx+0xa]
   1408b7601:	lea    esi,[r12+0x2]
   1408b7606:	sub    ebx,esi
   1408b7608:	sub    ebx,0x7
   1408b760b:	mov    eax,0x55555556
   1408b7610:	imul   ebx
   1408b7612:	mov    edi,edx
   1408b7614:	shr    edi,0x1f
   1408b7617:	add    edi,edx
   1408b7619:	lea    rcx,[rip+0xfeaf50]        # 0x1418a2570
   1408b7620:	call   0x14006ee50
   1408b7625:	test   rax,rax
   1408b7628:	je     0x1408b76a7
   1408b762a:	cmp    BYTE PTR [rip+0xfeaf5b],0x0        # 0x1418a258c
   1408b7631:	je     0x1408b76a7
   1408b7633:	cmp    BYTE PTR [rip+0x1ad8f9b],0x0        # 0x1423905d5
   1408b763a:	je     0x1408b76a0
   1408b763c:	cmp    BYTE PTR [rip+0x1ad8f8b],0x0        # 0x1423905ce
   1408b7643:	je     0x1408b76a0
   1408b7645:	lea    ebx,[r12-0x1]
   1408b764a:	lea    rcx,[rbp-0x50]
   1408b764e:	call   0x1400bb360
   1408b7653:	lea    rcx,[rip+0xfeaf16]        # 0x1418a2570
   1408b765a:	call   0x14006ee50
   1408b765f:	lea    r9d,[rax-0x1]
   1408b7663:	lea    ecx,[rbx-0x6]
   1408b7666:	mov    DWORD PTR [rsp+0x30],ebx
   1408b766a:	mov    DWORD PTR [rsp+0x28],0x7
   1408b7672:	mov    DWORD PTR [rsp+0x20],ecx
   1408b7676:	xor    r8d,r8d
   1408b7679:	mov    edx,DWORD PTR [rip+0xfeaf09]        # 0x1418a2588
   1408b767f:	lea    rcx,[rbp-0x50]
   1408b7683:	call   0x1400bb380
   1408b7688:	mov    edx,DWORD PTR [rsp+0x40]
   1408b768c:	lea    rcx,[rbp-0x50]
   1408b7690:	call   0x14140f200
   1408b7695:	mov    eax,DWORD PTR [rbp-0x50]
   1408b7698:	mov    DWORD PTR [rip+0xfeaeea],eax        # 0x1418a2588
   1408b769e:	jmp    0x1408b76a7
   1408b76a0:	mov    BYTE PTR [rip+0xfeaee5],0x0        # 0x1418a258c
   1408b76a7:	lea    rcx,[rip+0xfeae82]        # 0x1418a2530
   1408b76ae:	call   0x14006ee50
   1408b76b3:	test   rax,rax
   1408b76b6:	je     0x1408b7742
   1408b76bc:	cmp    BYTE PTR [rip+0xfeae89],0x0        # 0x1418a254c
   1408b76c3:	je     0x1408b7742
   1408b76c5:	cmp    BYTE PTR [rip+0x1ad8f09],0x0        # 0x1423905d5
   1408b76cc:	je     0x1408b773b
   1408b76ce:	cmp    BYTE PTR [rip+0x1ad8ef9],0x0        # 0x1423905ce
   1408b76d5:	je     0x1408b773b
   1408b76d7:	lea    rcx,[rbp-0x50]
   1408b76db:	call   0x1400bb360
   1408b76e0:	lea    rcx,[rip+0xfeae49]        # 0x1418a2530
   1408b76e7:	call   0x14006ee50
   1408b76ec:	lea    r9d,[rax*2-0x1]
   1408b76f4:	add    r9d,eax
   1408b76f7:	lea    edx,[rdi-0x1]
   1408b76fa:	lea    edx,[rdx+rdx*2]
   1408b76fd:	lea    eax,[rdx+0x1]
