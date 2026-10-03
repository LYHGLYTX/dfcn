
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

00000001403152a0 <.text+0x3142a0>:
   1403152a0:	adc    BYTE PTR [rax],al
   1403152a2:	add    BYTE PTR [rcx],bh
   1403152a4:	rex.R and al,0x60
   1403152a7:	jl     0x1403152f4
   1403152a9:	mov    eax,DWORD PTR [rsp+0x1034]
   1403152b0:	add    eax,0x2
   1403152b3:	cmp    DWORD PTR [rsp+0x60],eax
   1403152b7:	jg     0x1403152f4
   1403152b9:	mov    BYTE PTR [rip+0x207b30c],0x0        # 0x1423905cc
   1403152c0:	mov    BYTE PTR [rip+0x158ceea],0x0        # 0x1418a21b1
   1403152c7:	movsxd rax,DWORD PTR [rsp+0xd80]
   1403152cf:	mov    rdx,rax
   1403152d2:	lea    rcx,[rip+0x158cedf]        # 0x1418a21b8
   1403152d9:	call   0x14006f220
   1403152de:	mov    rdx,QWORD PTR [rax]
   1403152e1:	lea    rcx,[rip+0x158cec8]        # 0x1418a21b0
   1403152e8:	call   0x14036b590
   1403152ed:	xor    al,al
   1403152ef:	jmp    0x14035e98a
   1403152f4:	mov    eax,DWORD PTR [rsp+0x1034]
   1403152fb:	add    eax,0x3
   1403152fe:	mov    DWORD PTR [rsp+0x1034],eax
   140315305:	jmp    0x14031523f
   14031530a:	jmp    0x140315388
   14031530c:	movsx  eax,BYTE PTR [rip+0x207b2c2]        # 0x1423905d5
   140315313:	test   eax,eax
   140315315:	je     0x140315322
   140315317:	movsx  eax,BYTE PTR [rip+0x207b2af]        # 0x1423905cd
   14031531e:	test   eax,eax
   140315320:	jne    0x140315347
   140315322:	mov    DWORD PTR [rsp+0x2dc4],0x5
   14031532d:	lea    rdx,[rsp+0x2dc4]
   140315335:	mov    rcx,QWORD PTR [rsp+0x6ae8]
   14031533d:	call   0x1400e1130
   140315342:	test   rax,rax
   140315345:	je     0x140315388
   140315347:	mov    ecx,0x232a
   14031534c:	call   0x1407e43c0
   140315351:	mov    BYTE PTR [rip+0x207b275],0x0        # 0x1423905cd
   140315358:	mov    rcx,QWORD PTR [rsp+0x6ae8]
   140315360:	call   0x1400e1170
   140315365:	lea    rcx,[rip+0x158ce44]        # 0x1418a21b0
   14031536c:	call   0x14036b0b0
   140315371:	mov    dx,0x2
   140315375:	lea    rcx,[rip+0x2335074]        # 0x14264a3f0
   14031537c:	call   0x140ae7c00
   140315381:	xor    al,al
   140315383:	jmp    0x14035e98a
   140315388:	jmp    0x14031c30f
   14031538d:	mov    eax,DWORD PTR [rsp+0x78c]
   140315394:	inc    eax
   140315396:	mov    DWORD PTR [rsp+0x1038],eax
   14031539d:	mov    eax,DWORD PTR [rsp+0x78c]
   1403153a4:	add    eax,0x6
   1403153a7:	mov    DWORD PTR [rsp+0x988],eax
   1403153ae:	movsx  eax,WORD PTR [rip+0x158d175]        # 0x1418a252a
   1403153b5:	cmp    eax,0xffffffff
   1403153b8:	jne    0x140315424
   1403153ba:	lea    rcx,[rip+0x158d1af]        # 0x1418a2570
   1403153c1:	call   0x14006ee50
   1403153c6:	test   rax,rax
   1403153c9:	jbe    0x140315424
   1403153cb:	lea    rcx,[rip+0x158d19e]        # 0x1418a2570
   1403153d2:	call   0x14006ee50
   1403153d7:	sub    eax,0x2
   1403153da:	mov    DWORD PTR [rsp+0xd84],eax
   1403153e1:	cmp    DWORD PTR [rsp+0xd84],0x0
   1403153e9:	jge    0x1403153f6
   1403153eb:	mov    DWORD PTR [rsp+0xd84],0x0
   1403153f6:	cmp    DWORD PTR [rsp+0xd84],0x5
   1403153fe:	jle    0x14031540b
   140315400:	mov    DWORD PTR [rsp+0xd84],0x5
   14031540b:	mov    eax,DWORD PTR [rsp+0xd84]
   140315412:	mov    ecx,DWORD PTR [rsp+0x988]
   140315419:	add    ecx,eax
   14031541b:	mov    eax,ecx
   14031541d:	mov    DWORD PTR [rsp+0x988],eax
   140315424:	mov    eax,DWORD PTR [rsp+0x788]
   14031542b:	sub    eax,0x6
   14031542e:	mov    DWORD PTR [rsp+0xbf0],eax
   140315435:	mov    eax,DWORD PTR [rsp+0x788]
   14031543c:	sub    eax,0x2
   14031543f:	mov    DWORD PTR [rsp+0x3bb8],eax
   140315446:	mov    eax,DWORD PTR [rsp+0x660]
   14031544d:	mov    ecx,DWORD PTR [rsp+0x790]
   140315454:	sub    ecx,eax
   140315456:	mov    eax,ecx
   140315458:	inc    eax
   14031545a:	cdq
   14031545b:	sub    eax,edx
   14031545d:	sar    eax,1
   14031545f:	add    eax,DWORD PTR [rsp+0x660]
   140315466:	mov    DWORD PTR [rsp+0x59c],eax
   14031546d:	mov    eax,DWORD PTR [rsp+0x660]
   140315474:	add    eax,0x2
   140315477:	mov    DWORD PTR [rsp+0x2e58],eax
   14031547e:	mov    eax,DWORD PTR [rsp+0x59c]
   140315485:	sub    eax,0x2
   140315488:	mov    DWORD PTR [rsp+0x2e5c],eax
   14031548f:	mov    eax,DWORD PTR [rsp+0x59c]
   140315496:	add    eax,0x2
   140315499:	mov    DWORD PTR [rsp+0x2e60],eax
   1403154a0:	mov    eax,DWORD PTR [rsp+0x790]
   1403154a7:	sub    eax,0x2
   1403154aa:	mov    DWORD PTR [rsp+0x2e64],eax
   1403154b1:	mov    eax,DWORD PTR [rsp+0x988]
   1403154b8:	add    eax,0x2
   1403154bb:	mov    DWORD PTR [rsp+0x148],eax
   1403154c2:	mov    eax,DWORD PTR [rsp+0xbf0]
   1403154c9:	sub    eax,0x2
   1403154cc:	mov    DWORD PTR [rsp+0x2dc8],eax
   1403154d3:	mov    eax,DWORD PTR [rsp+0x148]
   1403154da:	mov    ecx,DWORD PTR [rsp+0x2dc8]
   1403154e1:	sub    ecx,eax
   1403154e3:	mov    eax,ecx
   1403154e5:	inc    eax
   1403154e7:	mov    DWORD PTR [rsp+0x2dcc],eax
   1403154ee:	mov    eax,DWORD PTR [rsp+0x2dcc]
   1403154f5:	cdq
   1403154f6:	mov    ecx,0x3
   1403154fb:	idiv   ecx
   1403154fd:	mov    DWORD PTR [rsp+0x2dd0],eax
   140315504:	mov    eax,DWORD PTR [rsp+0x2dd0]
   14031550b:	dec    eax
   14031550d:	mov    DWORD PTR [rsp+0x2a4],eax
   140315514:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   14031551c:	mov    DWORD PTR [rsp+0x4b4],eax
   140315523:	lea    rcx,[rip+0x158d046]        # 0x1418a2570
   14031552a:	call   0x14006ee50
   14031552f:	test   rax,rax
   140315532:	jbe    0x1403156a8
   140315538:	movsx  eax,BYTE PTR [rip+0x207b096]        # 0x1423905d5
   14031553f:	test   eax,eax
   140315541:	je     0x1403156a3
   140315547:	mov    eax,DWORD PTR [rsp+0x660]
   14031554e:	add    eax,0xa
   140315551:	cmp    DWORD PTR [rsp+0x64],eax
   140315555:	jl     0x1403156a3
   14031555b:	mov    eax,DWORD PTR [rsp+0x660]
   140315562:	add    eax,0x55
   140315565:	cmp    DWORD PTR [rsp+0x64],eax
   140315569:	jg     0x1403156a3
   14031556f:	mov    eax,DWORD PTR [rsp+0x78c]
   140315576:	cmp    DWORD PTR [rsp+0x60],eax
   14031557a:	jl     0x1403156a3
   140315580:	mov    eax,DWORD PTR [rsp+0x788]
   140315587:	cmp    DWORD PTR [rsp+0x60],eax
   14031558b:	jg     0x1403156a3
   140315591:	mov    eax,DWORD PTR [rsp+0x1038]
   140315598:	add    eax,0x2
   14031559b:	mov    DWORD PTR [rsp+0x1d1c],eax
   1403155a2:	mov    eax,DWORD PTR [rsp+0x988]
   1403155a9:	dec    eax
   1403155ab:	mov    DWORD PTR [rsp+0x1d20],eax
   1403155b2:	mov    eax,DWORD PTR [rsp+0x1d1c]
   1403155b9:	mov    ecx,DWORD PTR [rsp+0x1d20]
   1403155c0:	sub    ecx,eax
   1403155c2:	mov    eax,ecx
   1403155c4:	inc    eax
   1403155c6:	mov    DWORD PTR [rsp+0x1d24],eax
   1403155cd:	lea    rcx,[rip+0x158cf9c]        # 0x1418a2570
   1403155d4:	call   0x14006ee50
   1403155d9:	cmp    eax,DWORD PTR [rsp+0x1d24]
   1403155e0:	jle    0x1403156a3
   1403155e6:	mov    eax,DWORD PTR [rsp+0x1d1c]
   1403155ed:	mov    DWORD PTR [rsp+0x2dd8],eax
   1403155f4:	mov    eax,DWORD PTR [rsp+0x1d20]
   1403155fb:	mov    DWORD PTR [rsp+0x2dd4],eax
   140315602:	lea    rcx,[rsp+0x5ed0]
   14031560a:	call   0x1400bb360
   14031560f:	lea    rcx,[rip+0x158cf5a]        # 0x1418a2570
   140315616:	call   0x14006ee50
   14031561b:	dec    eax
   14031561d:	mov    DWORD PTR [rsp+0x2ddc],eax
   140315624:	mov    eax,DWORD PTR [rip+0x158cf5e]        # 0x1418a2588
   14031562a:	mov    DWORD PTR [rsp+0x2de0],eax
   140315631:	mov    eax,DWORD PTR [rsp+0x2dd4]
   140315638:	mov    DWORD PTR [rsp+0x30],eax
   14031563c:	mov    eax,DWORD PTR [rsp+0x2dd8]
   140315643:	mov    DWORD PTR [rsp+0x28],eax
   140315647:	mov    eax,DWORD PTR [rsp+0x1d24]
   14031564e:	mov    DWORD PTR [rsp+0x20],eax
   140315652:	mov    r9d,DWORD PTR [rsp+0x2ddc]
   14031565a:	xor    r8d,r8d
   14031565d:	mov    edx,DWORD PTR [rsp+0x2de0]
   140315664:	lea    rcx,[rsp+0x5ed0]
   14031566c:	call   0x1400bb380
   140315671:	nop
   140315672:	lea    r9,[rip+0x158cf13]        # 0x1418a258c
   140315679:	lea    r8,[rip+0x158cf08]        # 0x1418a2588
   140315680:	mov    rdx,QWORD PTR [rsp+0x6ae8]
   140315688:	lea    rcx,[rsp+0x5ed0]
   140315690:	call   0x14140f2b0
   140315695:	movzx  eax,al
   140315698:	test   eax,eax
   14031569a:	je     0x1403156a3
   14031569c:	xor    al,al
   14031569e:	jmp    0x14035e98a
   1403156a3:	jmp    0x140315ad3
   1403156a8:	lea    rcx,[rip+0x158ce81]        # 0x1418a2530
   1403156af:	call   0x14006ee50
   1403156b4:	test   rax,rax
   1403156b7:	jbe    0x140315803
   1403156bd:	movsx  eax,BYTE PTR [rip+0x207af11]        # 0x1423905d5
   1403156c4:	test   eax,eax
   1403156c6:	je     0x1403157fe
   1403156cc:	lea    rcx,[rip+0x158ce5d]        # 0x1418a2530
   1403156d3:	call   0x14006ee50
   1403156d8:	imul   eax,eax,0x3
   1403156db:	cmp    eax,DWORD PTR [rsp+0x4b4]
   1403156e2:	jle    0x1403157fe
   1403156e8:	mov    eax,DWORD PTR [rsp+0x59c]
   1403156ef:	inc    eax
   1403156f1:	cmp    DWORD PTR [rsp+0x64],eax
   1403156f5:	jl     0x1403157fe
   1403156fb:	mov    eax,DWORD PTR [rsp+0x790]
   140315702:	cmp    DWORD PTR [rsp+0x64],eax
   140315706:	jg     0x1403157fe
   14031570c:	mov    eax,DWORD PTR [rsp+0x78c]
   140315713:	cmp    DWORD PTR [rsp+0x60],eax
   140315717:	jl     0x1403157fe
   14031571d:	mov    eax,DWORD PTR [rsp+0x788]
   140315724:	cmp    DWORD PTR [rsp+0x60],eax
   140315728:	jg     0x1403157fe
   14031572e:	mov    eax,DWORD PTR [rsp+0x148]
   140315735:	add    eax,0x4
   140315738:	mov    DWORD PTR [rsp+0x2de8],eax
   14031573f:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315747:	mov    ecx,DWORD PTR [rsp+0x148]
   14031574e:	lea    eax,[rcx+rax*1+0x1]
   140315752:	mov    DWORD PTR [rsp+0x2de4],eax
   140315759:	lea    rcx,[rsp+0x5ef0]
   140315761:	call   0x1400bb360
   140315766:	lea    rcx,[rip+0x158cdc3]        # 0x1418a2530
   14031576d:	call   0x14006ee50
   140315772:	imul   eax,eax,0x3
   140315775:	dec    eax
   140315777:	mov    DWORD PTR [rsp+0x2dec],eax
   14031577e:	mov    eax,DWORD PTR [rip+0x158cdc4]        # 0x1418a2548
   140315784:	mov    DWORD PTR [rsp+0x2df0],eax
   14031578b:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315793:	mov    ecx,DWORD PTR [rsp+0x2de4]
   14031579a:	mov    DWORD PTR [rsp+0x30],ecx
   14031579e:	mov    ecx,DWORD PTR [rsp+0x2de8]
   1403157a5:	mov    DWORD PTR [rsp+0x28],ecx
   1403157a9:	mov    DWORD PTR [rsp+0x20],eax
   1403157ad:	mov    r9d,DWORD PTR [rsp+0x2dec]
   1403157b5:	xor    r8d,r8d
   1403157b8:	mov    edx,DWORD PTR [rsp+0x2df0]
   1403157bf:	lea    rcx,[rsp+0x5ef0]
   1403157c7:	call   0x1400bb380
   1403157cc:	nop
   1403157cd:	lea    r9,[rip+0x158cd78]        # 0x1418a254c
   1403157d4:	lea    r8,[rip+0x158cd6d]        # 0x1418a2548
   1403157db:	mov    rdx,QWORD PTR [rsp+0x6ae8]
   1403157e3:	lea    rcx,[rsp+0x5ef0]
   1403157eb:	call   0x14140f2b0
   1403157f0:	movzx  eax,al
   1403157f3:	test   eax,eax
   1403157f5:	je     0x1403157fe
   1403157f7:	xor    al,al
   1403157f9:	jmp    0x14035e98a
   1403157fe:	jmp    0x140315ad3
   140315803:	mov    DWORD PTR [rsp+0x590],0x0
   14031580e:	movsx  eax,BYTE PTR [rip+0x207adc0]        # 0x1423905d5
   140315815:	test   eax,eax
   140315817:	je     0x14031596b
   14031581d:	movsxd rax,DWORD PTR [rsp+0x590]
   140315825:	lea    rcx,[rip+0x158caf4]        # 0x1418a2320
   14031582c:	mov    edx,DWORD PTR [rsp+0x4b4]
   140315833:	cmp    DWORD PTR [rcx+rax*4],edx
   140315836:	jle    0x14031596b
   14031583c:	mov    eax,DWORD PTR [rsp+0x660]
   140315843:	cmp    DWORD PTR [rsp+0x64],eax
   140315847:	jl     0x14031596b
   14031584d:	mov    eax,DWORD PTR [rsp+0x59c]
   140315854:	dec    eax
   140315856:	cmp    DWORD PTR [rsp+0x64],eax
   14031585a:	jg     0x14031596b
   140315860:	mov    eax,DWORD PTR [rsp+0x78c]
   140315867:	cmp    DWORD PTR [rsp+0x60],eax
   14031586b:	jl     0x14031596b
   140315871:	mov    eax,DWORD PTR [rsp+0x788]
   140315878:	cmp    DWORD PTR [rsp+0x60],eax
   14031587c:	jg     0x14031596b
   140315882:	mov    eax,DWORD PTR [rsp+0x148]
   140315889:	add    eax,0x4
   14031588c:	mov    DWORD PTR [rsp+0x2df8],eax
   140315893:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   14031589b:	mov    ecx,DWORD PTR [rsp+0x148]
   1403158a2:	lea    eax,[rcx+rax*1+0x1]
   1403158a6:	mov    DWORD PTR [rsp+0x2df4],eax
   1403158ad:	lea    rcx,[rsp+0x5f10]
   1403158b5:	call   0x1400bb360
   1403158ba:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   1403158c2:	movsxd rcx,DWORD PTR [rsp+0x590]
   1403158ca:	lea    rdx,[rip+0x158ca4f]        # 0x1418a2320
   1403158d1:	mov    ecx,DWORD PTR [rdx+rcx*4]
   1403158d4:	dec    ecx
   1403158d6:	movsxd rdx,DWORD PTR [rsp+0x590]
   1403158de:	lea    rdi,[rip+0x158cbf3]        # 0x1418a24d8
   1403158e5:	mov    r8d,DWORD PTR [rsp+0x2df4]
   1403158ed:	mov    DWORD PTR [rsp+0x30],r8d
   1403158f2:	mov    r8d,DWORD PTR [rsp+0x2df8]
   1403158fa:	mov    DWORD PTR [rsp+0x28],r8d
   1403158ff:	mov    DWORD PTR [rsp+0x20],eax
   140315903:	mov    r9d,ecx
   140315906:	xor    r8d,r8d
   140315909:	mov    edx,DWORD PTR [rdi+rdx*4]
   14031590c:	lea    rcx,[rsp+0x5f10]
   140315914:	call   0x1400bb380
   140315919:	nop
   14031591a:	movsxd rax,DWORD PTR [rsp+0x590]
   140315922:	lea    rcx,[rip+0x158cbb7]        # 0x1418a24e0
   140315929:	add    rcx,rax
   14031592c:	mov    rax,rcx
   14031592f:	movsxd rcx,DWORD PTR [rsp+0x590]
   140315937:	lea    rdx,[rip+0x158cb9a]        # 0x1418a24d8
   14031593e:	lea    rcx,[rdx+rcx*4]
   140315942:	mov    r9,rax
   140315945:	mov    r8,rcx
   140315948:	mov    rdx,QWORD PTR [rsp+0x6ae8]
   140315950:	lea    rcx,[rsp+0x5f10]
   140315958:	call   0x14140f2b0
   14031595d:	movzx  eax,al
   140315960:	test   eax,eax
   140315962:	je     0x14031596b
   140315964:	xor    al,al
   140315966:	jmp    0x14035e98a
   14031596b:	mov    DWORD PTR [rsp+0x590],0x1
   140315976:	movsx  eax,BYTE PTR [rip+0x207ac58]        # 0x1423905d5
   14031597d:	test   eax,eax
   14031597f:	je     0x140315ad3
   140315985:	movsxd rax,DWORD PTR [rsp+0x590]
   14031598d:	lea    rcx,[rip+0x158c98c]        # 0x1418a2320
   140315994:	mov    edx,DWORD PTR [rsp+0x4b4]
   14031599b:	cmp    DWORD PTR [rcx+rax*4],edx
   14031599e:	jle    0x140315ad3
   1403159a4:	mov    eax,DWORD PTR [rsp+0x59c]
   1403159ab:	inc    eax
   1403159ad:	cmp    DWORD PTR [rsp+0x64],eax
   1403159b1:	jl     0x140315ad3
   1403159b7:	mov    eax,DWORD PTR [rsp+0x790]
   1403159be:	cmp    DWORD PTR [rsp+0x64],eax
   1403159c2:	jg     0x140315ad3
   1403159c8:	mov    eax,DWORD PTR [rsp+0x78c]
   1403159cf:	cmp    DWORD PTR [rsp+0x60],eax
   1403159d3:	jl     0x140315ad3
   1403159d9:	mov    eax,DWORD PTR [rsp+0x788]
   1403159e0:	cmp    DWORD PTR [rsp+0x60],eax
   1403159e4:	jg     0x140315ad3
   1403159ea:	mov    eax,DWORD PTR [rsp+0x148]
   1403159f1:	add    eax,0x4
   1403159f4:	mov    DWORD PTR [rsp+0x2e00],eax
   1403159fb:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315a03:	mov    ecx,DWORD PTR [rsp+0x148]
   140315a0a:	lea    eax,[rcx+rax*1+0x1]
   140315a0e:	mov    DWORD PTR [rsp+0x2dfc],eax
   140315a15:	lea    rcx,[rsp+0x5f30]
   140315a1d:	call   0x1400bb360
   140315a22:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315a2a:	movsxd rcx,DWORD PTR [rsp+0x590]
   140315a32:	lea    rdx,[rip+0x158c8e7]        # 0x1418a2320
   140315a39:	mov    ecx,DWORD PTR [rdx+rcx*4]
   140315a3c:	dec    ecx
   140315a3e:	movsxd rdx,DWORD PTR [rsp+0x590]
   140315a46:	lea    rdi,[rip+0x158ca8b]        # 0x1418a24d8
   140315a4d:	mov    r8d,DWORD PTR [rsp+0x2dfc]
   140315a55:	mov    DWORD PTR [rsp+0x30],r8d
   140315a5a:	mov    r8d,DWORD PTR [rsp+0x2e00]
   140315a62:	mov    DWORD PTR [rsp+0x28],r8d
   140315a67:	mov    DWORD PTR [rsp+0x20],eax
   140315a6b:	mov    r9d,ecx
   140315a6e:	xor    r8d,r8d
   140315a71:	mov    edx,DWORD PTR [rdi+rdx*4]
   140315a74:	lea    rcx,[rsp+0x5f30]
   140315a7c:	call   0x1400bb380
   140315a81:	nop
   140315a82:	movsxd rax,DWORD PTR [rsp+0x590]
   140315a8a:	lea    rcx,[rip+0x158ca4f]        # 0x1418a24e0
   140315a91:	add    rcx,rax
   140315a94:	mov    rax,rcx
   140315a97:	movsxd rcx,DWORD PTR [rsp+0x590]
   140315a9f:	lea    rdx,[rip+0x158ca32]        # 0x1418a24d8
   140315aa6:	lea    rcx,[rdx+rcx*4]
   140315aaa:	mov    r9,rax
   140315aad:	mov    r8,rcx
   140315ab0:	mov    rdx,QWORD PTR [rsp+0x6ae8]
   140315ab8:	lea    rcx,[rsp+0x5f30]
   140315ac0:	call   0x14140f2b0
   140315ac5:	movzx  eax,al
   140315ac8:	test   eax,eax
   140315aca:	je     0x140315ad3
   140315acc:	xor    al,al
   140315ace:	jmp    0x14035e98a
   140315ad3:	lea    rcx,[rip+0x158ca96]        # 0x1418a2570
   140315ada:	call   0x14006ee50
   140315adf:	test   rax,rax
   140315ae2:	jbe    0x140315c11
   140315ae8:	movzx  eax,BYTE PTR [rip+0x158ca9d]        # 0x1418a258c
   140315aef:	test   eax,eax
   140315af1:	je     0x140315c11
   140315af7:	movsx  eax,BYTE PTR [rip+0x207aad7]        # 0x1423905d5
   140315afe:	test   eax,eax
   140315b00:	je     0x140315c05
   140315b06:	movsx  eax,BYTE PTR [rip+0x207aac1]        # 0x1423905ce
   140315b0d:	test   eax,eax
   140315b0f:	je     0x140315bfc
   140315b15:	mov    eax,DWORD PTR [rsp+0x1038]
   140315b1c:	add    eax,0x2
   140315b1f:	mov    DWORD PTR [rsp+0x1d28],eax
   140315b26:	mov    eax,DWORD PTR [rsp+0x988]
   140315b2d:	dec    eax
   140315b2f:	mov    DWORD PTR [rsp+0x1d2c],eax
   140315b36:	mov    eax,DWORD PTR [rsp+0x1d28]
   140315b3d:	mov    ecx,DWORD PTR [rsp+0x1d2c]
   140315b44:	sub    ecx,eax
   140315b46:	mov    eax,ecx
   140315b48:	inc    eax
   140315b4a:	mov    DWORD PTR [rsp+0x2e0c],eax
   140315b51:	mov    eax,DWORD PTR [rsp+0x1d28]
   140315b58:	mov    DWORD PTR [rsp+0x2e08],eax
   140315b5f:	mov    eax,DWORD PTR [rsp+0x1d2c]
   140315b66:	mov    DWORD PTR [rsp+0x2e04],eax
   140315b6d:	lea    rcx,[rsp+0x5708]
   140315b75:	call   0x1400bb360
   140315b7a:	lea    rcx,[rip+0x158c9ef]        # 0x1418a2570
   140315b81:	call   0x14006ee50
   140315b86:	dec    eax
   140315b88:	mov    DWORD PTR [rsp+0x2e10],eax
   140315b8f:	mov    eax,DWORD PTR [rip+0x158c9f3]        # 0x1418a2588
   140315b95:	mov    DWORD PTR [rsp+0x2e14],eax
   140315b9c:	mov    eax,DWORD PTR [rsp+0x2e04]
   140315ba3:	mov    DWORD PTR [rsp+0x30],eax
   140315ba7:	mov    eax,DWORD PTR [rsp+0x2e08]
   140315bae:	mov    DWORD PTR [rsp+0x28],eax
   140315bb2:	mov    eax,DWORD PTR [rsp+0x2e0c]
   140315bb9:	mov    DWORD PTR [rsp+0x20],eax
   140315bbd:	mov    r9d,DWORD PTR [rsp+0x2e10]
   140315bc5:	xor    r8d,r8d
   140315bc8:	mov    edx,DWORD PTR [rsp+0x2e14]
   140315bcf:	lea    rcx,[rsp+0x5708]
   140315bd7:	call   0x1400bb380
   140315bdc:	mov    edx,DWORD PTR [rsp+0x60]
   140315be0:	lea    rcx,[rsp+0x5708]
   140315be8:	call   0x14140f200
   140315bed:	mov    eax,DWORD PTR [rsp+0x5708]
   140315bf4:	mov    DWORD PTR [rip+0x158c98e],eax        # 0x1418a2588
   140315bfa:	jmp    0x140315c03
   140315bfc:	mov    BYTE PTR [rip+0x158c989],0x0        # 0x1418a258c
   140315c03:	jmp    0x140315c0c
   140315c05:	mov    BYTE PTR [rip+0x158c980],0x0        # 0x1418a258c
   140315c0c:	jmp    0x14031c30f
   140315c11:	lea    rcx,[rip+0x158c918]        # 0x1418a2530
   140315c18:	call   0x14006ee50
   140315c1d:	test   rax,rax
   140315c20:	jbe    0x140315d26
   140315c26:	movzx  eax,BYTE PTR [rip+0x158c91f]        # 0x1418a254c
   140315c2d:	test   eax,eax
   140315c2f:	je     0x140315d26
   140315c35:	movsx  eax,BYTE PTR [rip+0x207a999]        # 0x1423905d5
   140315c3c:	test   eax,eax
   140315c3e:	je     0x140315d1a
   140315c44:	movsx  eax,BYTE PTR [rip+0x207a983]        # 0x1423905ce
   140315c4b:	test   eax,eax
   140315c4d:	je     0x140315d11
   140315c53:	mov    eax,DWORD PTR [rsp+0x148]
   140315c5a:	add    eax,0x4
   140315c5d:	mov    DWORD PTR [rsp+0x2e1c],eax
   140315c64:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315c6c:	mov    ecx,DWORD PTR [rsp+0x148]
   140315c73:	lea    eax,[rcx+rax*1+0x1]
   140315c77:	mov    DWORD PTR [rsp+0x2e18],eax
   140315c7e:	lea    rcx,[rsp+0x5728]
   140315c86:	call   0x1400bb360
   140315c8b:	lea    rcx,[rip+0x158c89e]        # 0x1418a2530
   140315c92:	call   0x14006ee50
   140315c97:	imul   eax,eax,0x3
   140315c9a:	dec    eax
   140315c9c:	mov    DWORD PTR [rsp+0x2e20],eax
   140315ca3:	mov    eax,DWORD PTR [rip+0x158c89f]        # 0x1418a2548
   140315ca9:	mov    DWORD PTR [rsp+0x2e24],eax
   140315cb0:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315cb8:	mov    ecx,DWORD PTR [rsp+0x2e18]
   140315cbf:	mov    DWORD PTR [rsp+0x30],ecx
   140315cc3:	mov    ecx,DWORD PTR [rsp+0x2e1c]
   140315cca:	mov    DWORD PTR [rsp+0x28],ecx
   140315cce:	mov    DWORD PTR [rsp+0x20],eax
   140315cd2:	mov    r9d,DWORD PTR [rsp+0x2e20]
   140315cda:	xor    r8d,r8d
   140315cdd:	mov    edx,DWORD PTR [rsp+0x2e24]
   140315ce4:	lea    rcx,[rsp+0x5728]
   140315cec:	call   0x1400bb380
   140315cf1:	mov    edx,DWORD PTR [rsp+0x60]
   140315cf5:	lea    rcx,[rsp+0x5728]
   140315cfd:	call   0x14140f200
   140315d02:	mov    eax,DWORD PTR [rsp+0x5728]
   140315d09:	mov    DWORD PTR [rip+0x158c839],eax        # 0x1418a2548
   140315d0f:	jmp    0x140315d18
   140315d11:	mov    BYTE PTR [rip+0x158c834],0x0        # 0x1418a254c
   140315d18:	jmp    0x140315d21
   140315d1a:	mov    BYTE PTR [rip+0x158c82b],0x0        # 0x1418a254c
   140315d21:	jmp    0x14031c30f
   140315d26:	mov    eax,0x1
   140315d2b:	imul   rax,rax,0x0
   140315d2f:	lea    rcx,[rip+0x158c7aa]        # 0x1418a24e0
   140315d36:	movzx  eax,BYTE PTR [rcx+rax*1]
   140315d3a:	test   eax,eax
   140315d3c:	je     0x140315e55
   140315d42:	movsx  eax,BYTE PTR [rip+0x207a88c]        # 0x1423905d5
   140315d49:	test   eax,eax
   140315d4b:	je     0x140315e3c
   140315d51:	movsx  eax,BYTE PTR [rip+0x207a876]        # 0x1423905ce
   140315d58:	test   eax,eax
   140315d5a:	je     0x140315e26
   140315d60:	mov    eax,DWORD PTR [rsp+0x148]
   140315d67:	add    eax,0x4
   140315d6a:	mov    DWORD PTR [rsp+0x2e2c],eax
   140315d71:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315d79:	mov    ecx,DWORD PTR [rsp+0x148]
   140315d80:	lea    eax,[rcx+rax*1+0x1]
   140315d84:	mov    DWORD PTR [rsp+0x2e28],eax
   140315d8b:	lea    rcx,[rsp+0x5768]
   140315d93:	call   0x1400bb360
   140315d98:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315da0:	mov    ecx,0x4
   140315da5:	imul   rcx,rcx,0x0
   140315da9:	lea    rdx,[rip+0x158c570]        # 0x1418a2320
   140315db0:	mov    ecx,DWORD PTR [rdx+rcx*1]
   140315db3:	dec    ecx
   140315db5:	mov    edx,0x4
   140315dba:	imul   rdx,rdx,0x0
   140315dbe:	lea    rdi,[rip+0x158c713]        # 0x1418a24d8
   140315dc5:	mov    r8d,DWORD PTR [rsp+0x2e28]
   140315dcd:	mov    DWORD PTR [rsp+0x30],r8d
   140315dd2:	mov    r8d,DWORD PTR [rsp+0x2e2c]
   140315dda:	mov    DWORD PTR [rsp+0x28],r8d
   140315ddf:	mov    DWORD PTR [rsp+0x20],eax
   140315de3:	mov    r9d,ecx
   140315de6:	xor    r8d,r8d
   140315de9:	mov    edx,DWORD PTR [rdi+rdx*1]
   140315dec:	lea    rcx,[rsp+0x5768]
   140315df4:	call   0x1400bb380
   140315df9:	mov    edx,DWORD PTR [rsp+0x60]
   140315dfd:	lea    rcx,[rsp+0x5768]
   140315e05:	call   0x14140f200
   140315e0a:	mov    eax,0x4
   140315e0f:	imul   rax,rax,0x0
   140315e13:	lea    rcx,[rip+0x158c6be]        # 0x1418a24d8
   140315e1a:	mov    edx,DWORD PTR [rsp+0x5768]
   140315e21:	mov    DWORD PTR [rcx+rax*1],edx
   140315e24:	jmp    0x140315e3a
   140315e26:	mov    eax,0x1
   140315e2b:	imul   rax,rax,0x0
   140315e2f:	lea    rcx,[rip+0x158c6aa]        # 0x1418a24e0
   140315e36:	mov    BYTE PTR [rcx+rax*1],0x0
   140315e3a:	jmp    0x140315e50
   140315e3c:	mov    eax,0x1
   140315e41:	imul   rax,rax,0x0
   140315e45:	lea    rcx,[rip+0x158c694]        # 0x1418a24e0
   140315e4c:	mov    BYTE PTR [rcx+rax*1],0x0
   140315e50:	jmp    0x14031c30f
   140315e55:	mov    eax,0x1
   140315e5a:	imul   rax,rax,0x1
   140315e5e:	lea    rcx,[rip+0x158c67b]        # 0x1418a24e0
   140315e65:	movzx  eax,BYTE PTR [rcx+rax*1]
   140315e69:	test   eax,eax
   140315e6b:	je     0x140315f84
   140315e71:	movsx  eax,BYTE PTR [rip+0x207a75d]        # 0x1423905d5
   140315e78:	test   eax,eax
   140315e7a:	je     0x140315f6b
   140315e80:	movsx  eax,BYTE PTR [rip+0x207a747]        # 0x1423905ce
   140315e87:	test   eax,eax
   140315e89:	je     0x140315f55
   140315e8f:	mov    eax,DWORD PTR [rsp+0x148]
   140315e96:	add    eax,0x4
   140315e99:	mov    DWORD PTR [rsp+0x2e34],eax
   140315ea0:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315ea8:	mov    ecx,DWORD PTR [rsp+0x148]
   140315eaf:	lea    eax,[rcx+rax*1+0x1]
   140315eb3:	mov    DWORD PTR [rsp+0x2e30],eax
   140315eba:	lea    rcx,[rsp+0x5788]
   140315ec2:	call   0x1400bb360
   140315ec7:	imul   eax,DWORD PTR [rsp+0x2a4],0x3
   140315ecf:	mov    ecx,0x4
   140315ed4:	imul   rcx,rcx,0x1
   140315ed8:	lea    rdx,[rip+0x158c441]        # 0x1418a2320
   140315edf:	mov    ecx,DWORD PTR [rdx+rcx*1]
   140315ee2:	dec    ecx
   140315ee4:	mov    edx,0x4
   140315ee9:	imul   rdx,rdx,0x1
   140315eed:	lea    rdi,[rip+0x158c5e4]        # 0x1418a24d8
   140315ef4:	mov    r8d,DWORD PTR [rsp+0x2e30]
   140315efc:	mov    DWORD PTR [rsp+0x30],r8d
   140315f01:	mov    r8d,DWORD PTR [rsp+0x2e34]
   140315f09:	mov    DWORD PTR [rsp+0x28],r8d
   140315f0e:	mov    DWORD PTR [rsp+0x20],eax
   140315f12:	mov    r9d,ecx
   140315f15:	xor    r8d,r8d
   140315f18:	mov    edx,DWORD PTR [rdi+rdx*1]
   140315f1b:	lea    rcx,[rsp+0x5788]
   140315f23:	call   0x1400bb380
   140315f28:	mov    edx,DWORD PTR [rsp+0x60]
   140315f2c:	lea    rcx,[rsp+0x5788]
   140315f34:	call   0x14140f200
   140315f39:	mov    eax,0x4
   140315f3e:	imul   rax,rax,0x1
   140315f42:	lea    rcx,[rip+0x158c58f]        # 0x1418a24d8
   140315f49:	mov    edx,DWORD PTR [rsp+0x5788]
   140315f50:	mov    DWORD PTR [rcx+rax*1],edx
   140315f53:	jmp    0x140315f69
   140315f55:	mov    eax,0x1
   140315f5a:	imul   rax,rax,0x1
   140315f5e:	lea    rcx,[rip+0x158c57b]        # 0x1418a24e0
   140315f65:	mov    BYTE PTR [rcx+rax*1],0x0
   140315f69:	jmp    0x140315f7f
   140315f6b:	mov    eax,0x1
   140315f70:	imul   rax,rax,0x1
   140315f74:	lea    rcx,[rip+0x158c565]        # 0x1418a24e0
   140315f7b:	mov    BYTE PTR [rcx+rax*1],0x0
   140315f7f:	jmp    0x14031c30f
   140315f84:	movsx  eax,BYTE PTR [rip+0x207a64a]        # 0x1423905d5
   140315f8b:	test   eax,eax
   140315f8d:	je     0x14031c293
   140315f93:	movsx  eax,BYTE PTR [rip+0x207a632]        # 0x1423905cc
   140315f9a:	test   eax,eax
   140315f9c:	je     0x14031c293
   140315fa2:	mov    BYTE PTR [rip+0x207a623],0x0        # 0x1423905cc
   140315fa9:	lea    rcx,[rip+0x158c5c0]        # 0x1418a2570
   140315fb0:	call   0x14006ee50
   140315fb5:	test   rax,rax
   140315fb8:	jbe    0x1403161ad
   140315fbe:	mov    eax,DWORD PTR [rsp+0x1038]
   140315fc5:	add    eax,0x2
   140315fc8:	mov    DWORD PTR [rsp+0x1d30],eax
   140315fcf:	mov    eax,DWORD PTR [rsp+0x988]
   140315fd6:	dec    eax
   140315fd8:	mov    DWORD PTR [rsp+0x1d34],eax
   140315fdf:	mov    eax,DWORD PTR [rsp+0x1d30]
   140315fe6:	mov    ecx,DWORD PTR [rsp+0x1d34]
   140315fed:	sub    ecx,eax
   140315fef:	mov    eax,ecx
   140315ff1:	inc    eax
   140315ff3:	mov    DWORD PTR [rsp+0x2e38],eax
   140315ffa:	lea    rcx,[rip+0x158c56f]        # 0x1418a2570
   140316001:	call   0x14006ee50
   140316006:	cmp    eax,DWORD PTR [rsp+0x2e38]
   14031600d:	jle    0x1403161ad
   140316013:	mov    eax,DWORD PTR [rsp+0x660]
   14031601a:	add    eax,0x53
   14031601d:	mov    DWORD PTR [rsp+0x1d38],eax
   140316024:	mov    eax,DWORD PTR [rsp+0x1d30]
   14031602b:	mov    DWORD PTR [rsp+0x2e3c],eax
   140316032:	mov    eax,DWORD PTR [rsp+0x1d34]
   140316039:	mov    DWORD PTR [rsp+0x2e40],eax
   140316040:	mov    eax,DWORD PTR [rsp+0x1d38]
   140316047:	cmp    DWORD PTR [rsp+0x64],eax
   14031604b:	jl     0x1403161ad
   140316051:	mov    eax,DWORD PTR [rsp+0x1d38]
   140316058:	inc    eax
   14031605a:	cmp    DWORD PTR [rsp+0x64],eax
   14031605e:	jg     0x1403161ad
   140316064:	mov    eax,DWORD PTR [rsp+0x2e3c]
   14031606b:	dec    eax
   14031606d:	cmp    DWORD PTR [rsp+0x60],eax
   140316071:	jl     0x1403161ad
   140316077:	mov    eax,DWORD PTR [rsp+0x2e40]
   14031607e:	inc    eax
   140316080:	cmp    DWORD PTR [rsp+0x60],eax
   140316084:	jg     0x1403161ad
   14031608a:	mov    BYTE PTR [rip+0x207a53b],0x0        # 0x1423905cc
   140316091:	mov    BYTE PTR [rip+0x158c4f4],0x0        # 0x1418a258c
   140316098:	mov    eax,0x1
   14031609d:	imul   rax,rax,0x0
   1403160a1:	lea    rcx,[rip+0x158c438]        # 0x1418a24e0
   1403160a8:	mov    BYTE PTR [rcx+rax*1],0x0
   1403160ac:	mov    eax,0x1
   1403160b1:	imul   rax,rax,0x1
   1403160b5:	lea    rcx,[rip+0x158c424]        # 0x1418a24e0
   1403160bc:	mov    BYTE PTR [rcx+rax*1],0x0
   1403160c0:	mov    eax,DWORD PTR [rsp+0x1038]
   1403160c7:	add    eax,0x2
   1403160ca:	mov    DWORD PTR [rsp+0x1d3c],eax
   1403160d1:	mov    eax,DWORD PTR [rsp+0x988]
   1403160d8:	dec    eax
   1403160da:	mov    DWORD PTR [rsp+0x1d40],eax
   1403160e1:	mov    eax,DWORD PTR [rsp+0x1d3c]
   1403160e8:	mov    ecx,DWORD PTR [rsp+0x1d40]
   1403160ef:	sub    ecx,eax
   1403160f1:	mov    eax,ecx
   1403160f3:	inc    eax
   1403160f5:	mov    DWORD PTR [rsp+0x2e4c],eax
   1403160fc:	mov    eax,DWORD PTR [rsp+0x1d3c]
   140316103:	mov    DWORD PTR [rsp+0x2e48],eax
   14031610a:	mov    eax,DWORD PTR [rsp+0x1d40]
   140316111:	mov    DWORD PTR [rsp+0x2e44],eax
   140316118:	lea    rcx,[rsp+0x5f50]
   140316120:	call   0x1400bb360
   140316125:	lea    rcx,[rip+0x158c444]        # 0x1418a2570
   14031612c:	call   0x14006ee50
   140316131:	dec    eax
   140316133:	mov    DWORD PTR [rsp+0x2e50],eax
   14031613a:	mov    eax,DWORD PTR [rip+0x158c448]        # 0x1418a2588
   140316140:	mov    DWORD PTR [rsp+0x2e54],eax
   140316147:	mov    eax,DWORD PTR [rsp+0x2e44]
   14031614e:	mov    DWORD PTR [rsp+0x30],eax
   140316152:	mov    eax,DWORD PTR [rsp+0x2e48]
   140316159:	mov    DWORD PTR [rsp+0x28],eax
   14031615d:	mov    eax,DWORD PTR [rsp+0x2e4c]
   140316164:	mov    DWORD PTR [rsp+0x20],eax
   140316168:	mov    r9d,DWORD PTR [rsp+0x2e50]
   140316170:	xor    r8d,r8d
   140316173:	mov    edx,DWORD PTR [rsp+0x2e54]
   14031617a:	lea    rcx,[rsp+0x5f50]
   140316182:	call   0x1400bb380
   140316187:	lea    r9,[rip+0x158c3fe]        # 0x1418a258c
   14031618e:	lea    r8,[rip+0x158c3f3]        # 0x1418a2588
   140316195:	mov    edx,DWORD PTR [rsp+0x60]
   140316199:	lea    rcx,[rsp+0x5f50]
   1403161a1:	call   0x14140f450
   1403161a6:	xor    al,al
   1403161a8:	jmp    0x14035e98a
   1403161ad:	mov    DWORD PTR [rsp+0xb8],0x0
   1403161b8:	jmp    0x1403161ca
   1403161ba:	mov    eax,DWORD PTR [rsp+0xb8]
   1403161c1:	inc    eax
   1403161c3:	mov    DWORD PTR [rsp+0xb8],eax
   1403161ca:	cmp    DWORD PTR [rsp+0xb8],0x2
   1403161d2:	jge    0x14031757a
   1403161d8:	cmp    DWORD PTR [rsp+0xb8],0x0
   1403161e0:	jne    0x140316200
   1403161e2:	mov    eax,DWORD PTR [rsp+0x2e58]
   1403161e9:	mov    DWORD PTR [rsp+0xd8c],eax
   1403161f0:	mov    eax,DWORD PTR [rsp+0x2e5c]
   1403161f7:	mov    DWORD PTR [rsp+0x3a0],eax
   1403161fe:	jmp    0x14031621c
   140316200:	mov    eax,DWORD PTR [rsp+0x2e60]
   140316207:	mov    DWORD PTR [rsp+0xd8c],eax
   14031620e:	mov    eax,DWORD PTR [rsp+0x2e64]
   140316215:	mov    DWORD PTR [rsp+0x3a0],eax
   14031621c:	.byte 0x83
   14031621d:	.byte 0xbc
   14031621e:	and    al,0xb8
