
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140756500 <.text+0x755500>:
   140756500:	mov    QWORD PTR [rsp+0x18],rbx
   140756505:	push   rdi
   140756506:	sub    rsp,0x50
   14075650a:	mov    rax,QWORD PTR [rip+0x1145b2f]        # 0x14189c040
   140756511:	xor    rax,rsp
   140756514:	mov    QWORD PTR [rsp+0x40],rax
   140756519:	mov    rbx,rdx
   14075651c:	movsx  edi,cx
   14075651f:	xorps  xmm0,xmm0
   140756522:	movups XMMWORD PTR [rsp+0x20],xmm0
   140756527:	xor    r8d,r8d
   14075652a:	mov    QWORD PTR [rsp+0x30],r8
   14075652f:	mov    QWORD PTR [rsp+0x38],0xf
   140756538:	mov    BYTE PTR [rsp+0x20],r8b
   14075653d:	lea    eax,[rdi-0x13]
   140756540:	cmp    eax,0x6b
   140756543:	ja     0x140756579
   140756545:	cdqe
   140756547:	lea    rdx,[rip+0xffffffffff8a9ab2]        # 0x140000000
   14075654e:	movzx  eax,BYTE PTR [rdx+rax*1+0x75661c]
   140756556:	mov    ecx,DWORD PTR [rdx+rax*4+0x756614]
   14075655d:	add    rcx,rdx
   140756560:	jmp    rcx
   140756562:	mov    r8d,0x4
   140756568:	lea    rdx,[rip+0xe928d9]        # 0x1415e8e48
   14075656f:	mov    rcx,rbx
   140756572:	call   0x14006f8d0
   140756577:	jmp    0x14075658d
   140756579:	mov    QWORD PTR [rbx+0x10],r8
   14075657d:	mov    rax,rbx
   140756580:	cmp    QWORD PTR [rbx+0x18],0xf
   140756585:	jbe    0x14075658a
   140756587:	mov    rax,QWORD PTR [rbx]
   14075658a:	mov    BYTE PTR [rax],0x0
   14075658d:	lea    rdx,[rsp+0x20]
   140756592:	movzx  ecx,di
   140756595:	call   0x140756690
   14075659a:	lea    rdx,[rsp+0x20]
   14075659f:	cmp    QWORD PTR [rsp+0x38],0xf
   1407565a5:	cmova  rdx,QWORD PTR [rsp+0x20]
   1407565ab:	mov    r8,QWORD PTR [rsp+0x30]
   1407565b0:	mov    rcx,rbx
   1407565b3:	call   0x14006fa10
   1407565b8:	nop
   1407565b9:	mov    rdx,QWORD PTR [rsp+0x38]
   1407565be:	cmp    rdx,0xf
   1407565c2:	jbe    0x1407565f9
   1407565c4:	inc    rdx
   1407565c7:	mov    rcx,QWORD PTR [rsp+0x20]
   1407565cc:	mov    rax,rcx
   1407565cf:	cmp    rdx,0x1000
   1407565d6:	jb     0x1407565f4
   1407565d8:	add    rdx,0x27
   1407565dc:	mov    rcx,QWORD PTR [rcx-0x8]
   1407565e0:	sub    rax,rcx
   1407565e3:	add    rax,0xfffffffffffffff8
   1407565e7:	cmp    rax,0x1f
   1407565eb:	jbe    0x1407565f4
   1407565ed:	call   QWORD PTR [rip+0xe8f535]        # 0x1415e5b28
   1407565f3:	int3
   1407565f4:	call   0x141539680
   1407565f9:	mov    rcx,QWORD PTR [rsp+0x40]
   1407565fe:	xor    rcx,rsp
   140756601:	call   0x141539660
   140756606:	mov    rbx,QWORD PTR [rsp+0x70]
   14075660b:	add    rsp,0x50
   14075660f:	pop    rdi
   140756610:	ret
   140756611:	nop    DWORD PTR [rax]
   140756614:	(bad)
   140756619:	gs jne 0x14075661c
   14075661c:	add    BYTE PTR [rcx],al
   14075661e:	add    DWORD PTR [rcx],eax
   140756620:	add    DWORD PTR [rcx],eax
   140756622:	add    DWORD PTR [rcx],eax
   140756624:	add    DWORD PTR [rcx],eax
   140756626:	add    DWORD PTR [rcx],eax
   140756628:	add    DWORD PTR [rcx],eax
   14075662a:	add    DWORD PTR [rcx],eax
   14075662c:	add    DWORD PTR [rcx],eax
   14075662e:	add    DWORD PTR [rcx],eax
   140756630:	add    DWORD PTR [rcx],eax
   140756632:	add    DWORD PTR [rcx],eax
   140756634:	add    DWORD PTR [rcx],eax
   140756636:	add    DWORD PTR [rcx],eax
   140756638:	add    DWORD PTR [rcx],eax
   14075663a:	add    DWORD PTR [rcx],eax
   14075663c:	add    DWORD PTR [rcx],eax
   14075663e:	add    DWORD PTR [rcx],eax
   140756640:	add    DWORD PTR [rcx],eax
   140756642:	add    DWORD PTR [rcx],eax
   140756644:	add    DWORD PTR [rcx],eax
   140756646:	add    DWORD PTR [rcx],eax
   140756648:	add    DWORD PTR [rcx],eax
   14075664a:	add    DWORD PTR [rcx],eax
   14075664c:	add    DWORD PTR [rcx],eax
   14075664e:	add    DWORD PTR [rax],eax
   140756650:	add    DWORD PTR [rcx],eax
   140756652:	add    DWORD PTR [rcx],eax
   140756654:	add    DWORD PTR [rax],eax
   140756656:	add    DWORD PTR [rcx],eax
   140756658:	add    DWORD PTR [rcx],eax
   14075665a:	add    DWORD PTR [rcx],eax
   14075665c:	add    DWORD PTR [rcx],eax
   14075665e:	add    DWORD PTR [rcx],eax
   140756660:	add    BYTE PTR [rcx],al
   140756662:	add    DWORD PTR [rcx],eax
   140756664:	add    DWORD PTR [rcx],eax
   140756666:	add    DWORD PTR [rcx],eax
   140756668:	add    DWORD PTR [rcx],eax
   14075666a:	add    DWORD PTR [rax],eax
   14075666c:	add    DWORD PTR [rax],eax
   14075666e:	add    DWORD PTR [rcx],eax
   140756670:	add    BYTE PTR [rcx],al
   140756672:	add    DWORD PTR [rcx],eax
   140756674:	add    BYTE PTR [rcx],al
   140756676:	add    DWORD PTR [rcx],eax
   140756678:	add    DWORD PTR [rcx],eax
   14075667a:	add    DWORD PTR [rcx],eax
   14075667c:	add    DWORD PTR [rcx],eax
   14075667e:	add    DWORD PTR [rcx],eax
   140756680:	add    DWORD PTR [rcx],eax
   140756682:	add    DWORD PTR [rcx],eax
   140756684:	add    DWORD PTR [rcx],eax
	...
