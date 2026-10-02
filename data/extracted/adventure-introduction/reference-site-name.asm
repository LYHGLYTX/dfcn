
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140a94030 <.text+0xa93030>:
   140a94030:	mov    QWORD PTR [rsp+0x18],rbx
   140a94035:	mov    QWORD PTR [rsp+0x20],rsi
   140a9403a:	push   rbp
   140a9403b:	push   rdi
   140a9403c:	push   r12
   140a9403e:	push   r14
   140a94040:	push   r15
   140a94042:	mov    rbp,rsp
   140a94045:	sub    rsp,0x50
   140a94049:	mov    rax,QWORD PTR [rip+0xe07ff0]        # 0x14189c040
   140a94050:	xor    rax,rsp
   140a94053:	mov    QWORD PTR [rbp-0x10],rax
   140a94057:	mov    rsi,rdx
   140a9405a:	mov    rdi,rcx
   140a9405d:	cmp    BYTE PTR [rcx+0x72],0x0
   140a94061:	je     0x140a946ac
   140a94067:	xor    r12d,r12d
   140a9406a:	mov    r14d,r12d
   140a9406d:	movsxd rax,DWORD PTR [rip+0xe08250]        # 0x14189c2c4
   140a94074:	cmp    eax,0xa
   140a94077:	ja     0x140a94084
   140a94079:	lea    r14,[rip+0x18fca60]        # 0x142390ae0
   140a94080:	mov    r14d,DWORD PTR [r14+rax*4]
   140a94084:	mov    QWORD PTR [rdx+0x10],r12
   140a94088:	mov    rax,rsi
   140a9408b:	cmp    QWORD PTR [rdx+0x18],0xf
   140a94090:	jbe    0x140a94095
   140a94092:	mov    rax,QWORD PTR [rdx]
   140a94095:	mov    BYTE PTR [rax],r12b
   140a94098:	cmp    QWORD PTR [rcx+0x30],r12
   140a9409c:	je     0x140a940dd
   140a9409e:	test   r14d,0xfffffffd
   140a940a5:	jne    0x140a940dd
   140a940a7:	mov    dl,0x60
   140a940a9:	mov    rcx,rsi
   140a940ac:	call   0x1400b9b80
   140a940b1:	lea    rbx,[rdi+0x20]
   140a940b5:	mov    rdx,rbx
   140a940b8:	cmp    QWORD PTR [rbx+0x18],0xf
   140a940bd:	jbe    0x140a940c2
   140a940bf:	mov    rdx,QWORD PTR [rbx]
   140a940c2:	mov    r8,QWORD PTR [rbx+0x10]
   140a940c6:	mov    rcx,rsi
   140a940c9:	call   0x14006fa10
   140a940ce:	mov    dl,0x27
   140a940d0:	mov    rcx,rsi
   140a940d3:	call   0x1400b9b80
   140a940d8:	mov    r15b,0x1
   140a940db:	jmp    0x140a94125
   140a940dd:	mov    rdx,rdi
   140a940e0:	lea    rcx,[rbp-0x30]
   140a940e4:	call   0x14006f5d0
   140a940e9:	nop
   140a940ea:	lea    rcx,[rbp-0x30]
   140a940ee:	call   0x14052d3c0
   140a940f3:	lea    rdx,[rbp-0x30]
   140a940f7:	cmp    QWORD PTR [rbp-0x18],0xf
   140a940fc:	cmova  rdx,QWORD PTR [rbp-0x30]
   140a94101:	mov    r8,QWORD PTR [rbp-0x20]
   140a94105:	mov    rcx,rsi
   140a94108:	call   0x14006fa10
   140a9410d:	mov    rbx,QWORD PTR [rdi+0x10]
   140a94111:	lea    rcx,[rbp-0x30]
   140a94115:	call   0x14006f850
   140a9411a:	test   rbx,rbx
   140a9411d:	setne  r15b
   140a94121:	lea    rbx,[rdi+0x20]
   140a94125:	cmp    QWORD PTR [rdi+0x30],0x0
   140a9412a:	je     0x140a9418d
   140a9412c:	cmp    r14d,0x1
   140a94130:	jne    0x140a9417c
   140a94132:	test   r15b,r15b
   140a94135:	je     0x140a9414c
   140a94137:	mov    r8d,0x1
   140a9413d:	lea    rdx,[rip+0xb545f8]        # 0x1415e873c
   140a94144:	mov    rcx,rsi
   140a94147:	call   0x14006fa10
   140a9414c:	mov    dl,0x60
   140a9414e:	mov    rcx,rsi
   140a94151:	call   0x1400b9b80
   140a94156:	mov    r8,QWORD PTR [rbx+0x10]
   140a9415a:	cmp    QWORD PTR [rbx+0x18],0xf
   140a9415f:	jbe    0x140a94164
   140a94161:	mov    rbx,QWORD PTR [rbx]
   140a94164:	mov    rdx,rbx
   140a94167:	mov    rcx,rsi
   140a9416a:	call   0x14006fa10
   140a9416f:	mov    dl,0x27
   140a94171:	mov    rcx,rsi
   140a94174:	call   0x1400b9b80
   140a94179:	mov    r15b,0x1
   140a9417c:	cmp    QWORD PTR [rdi+0x30],0x0
   140a94181:	je     0x140a9418d
   140a94183:	cmp    r14d,0x2
   140a94187:	je     0x140a946ac
   140a9418d:	movsxd rax,DWORD PTR [rdi+0x40]
   140a94191:	mov    ebx,0xf
   140a94196:	cmp    eax,0xffffffff
   140a94199:	jne    0x140a941a4
   140a9419b:	cmp    DWORD PTR [rdi+0x44],eax
   140a9419e:	je     0x140a942f1
   140a941a4:	xorps  xmm0,xmm0
   140a941a7:	movups XMMWORD PTR [rbp-0x30],xmm0
   140a941ab:	mov    QWORD PTR [rbp-0x20],r12
   140a941af:	mov    QWORD PTR [rbp-0x18],rbx
   140a941b3:	mov    BYTE PTR [rbp-0x30],0x0
   140a941b7:	movsxd rcx,DWORD PTR [rdi+0x6c]
   140a941bb:	test   eax,eax
   140a941bd:	js     0x140a9422a
   140a941bf:	mov    r8,rax
   140a941c2:	mov    rax,QWORD PTR [rip+0x1a595af]        # 0x1424ed778
   140a941c9:	sub    rax,QWORD PTR [rip+0x1a595a0]        # 0x1424ed770
   140a941d0:	sar    rax,0x3
   140a941d4:	cmp    r8,rax
   140a941d7:	jae    0x140a9422a
   140a941d9:	test   ecx,ecx
   140a941db:	js     0x140a9422a
   140a941dd:	mov    rax,QWORD PTR [rip+0x1a595c4]        # 0x1424ed7a8
   140a941e4:	mov    rdx,QWORD PTR [rip+0x1a595b5]        # 0x1424ed7a0
   140a941eb:	sub    rax,rdx
   140a941ee:	sar    rax,0x3
   140a941f2:	cmp    rcx,rax
   140a941f5:	jae    0x140a94231
   140a941f7:	mov    rax,QWORD PTR [rdx+rcx*8]
   140a941fb:	mov    r9,QWORD PTR [rax+0x50]
   140a941ff:	mov    rcx,QWORD PTR [rax+0x58]
   140a94203:	sub    rcx,r9
   140a94206:	sar    rcx,0x3
   140a9420a:	cmp    rcx,r8
   140a9420d:	jb     0x140a94231
   140a9420f:	mov    rdx,QWORD PTR [r9+r8*8]
   140a94213:	mov    r8,QWORD PTR [rdx+0x10]
   140a94217:	cmp    QWORD PTR [rdx+0x18],0xf
   140a9421c:	jbe    0x140a94221
   140a9421e:	mov    rdx,QWORD PTR [rdx]
   140a94221:	lea    rcx,[rbp-0x30]
   140a94225:	call   0x14006fa10
   140a9422a:	mov    rdx,QWORD PTR [rip+0x1a5956f]        # 0x1424ed7a0
   140a94231:	movsxd rcx,DWORD PTR [rdi+0x6c]
   140a94235:	movsxd rax,DWORD PTR [rdi+0x44]
   140a94239:	test   eax,eax
   140a9423b:	js     0x140a942a1
   140a9423d:	mov    r8,rax
   140a94240:	mov    rax,QWORD PTR [rip+0x1a59531]        # 0x1424ed778
   140a94247:	sub    rax,QWORD PTR [rip+0x1a59522]        # 0x1424ed770
   140a9424e:	sar    rax,0x3
   140a94252:	cmp    r8,rax
   140a94255:	jae    0x140a942a1
   140a94257:	test   ecx,ecx
   140a94259:	js     0x140a942a1
   140a9425b:	mov    rax,QWORD PTR [rip+0x1a59546]        # 0x1424ed7a8
   140a94262:	sub    rax,rdx
   140a94265:	sar    rax,0x3
   140a94269:	cmp    rcx,rax
   140a9426c:	jae    0x140a942a1
   140a9426e:	mov    rax,QWORD PTR [rdx+rcx*8]
   140a94272:	mov    rdx,QWORD PTR [rax+0x50]
   140a94276:	mov    rcx,QWORD PTR [rax+0x58]
   140a9427a:	sub    rcx,rdx
   140a9427d:	sar    rcx,0x3
   140a94281:	cmp    rcx,r8
   140a94284:	jb     0x140a942a1
   140a94286:	mov    rdx,QWORD PTR [rdx+r8*8]
   140a9428a:	mov    r8,QWORD PTR [rdx+0x10]
   140a9428e:	cmp    QWORD PTR [rdx+0x18],0xf
   140a94293:	jbe    0x140a94298
   140a94295:	mov    rdx,QWORD PTR [rdx]
   140a94298:	lea    rcx,[rbp-0x30]
   140a9429c:	call   0x14006fa10
   140a942a1:	cmp    QWORD PTR [rbp-0x20],0x0
   140a942a6:	je     0x140a942e8
   140a942a8:	test   r15b,r15b
   140a942ab:	je     0x140a942c2
   140a942ad:	mov    r8d,0x1
   140a942b3:	lea    rdx,[rip+0xb54482]        # 0x1415e873c
   140a942ba:	mov    rcx,rsi
   140a942bd:	call   0x14006fa10
   140a942c2:	lea    rcx,[rbp-0x30]
   140a942c6:	call   0x14052d3c0
   140a942cb:	lea    rdx,[rbp-0x30]
   140a942cf:	cmp    QWORD PTR [rbp-0x18],0xf
   140a942d4:	cmova  rdx,QWORD PTR [rbp-0x30]
   140a942d9:	mov    r8,QWORD PTR [rbp-0x20]
   140a942dd:	mov    rcx,rsi
   140a942e0:	call   0x14006fa10
   140a942e5:	mov    r15b,0x1
   140a942e8:	lea    rcx,[rbp-0x30]
   140a942ec:	call   0x14006f850
   140a942f1:	cmp    DWORD PTR [rdi+0x54],0xffffffff
   140a942f5:	jne    0x140a94307
   140a942f7:	cmp    DWORD PTR [rdi+0x48],0xffffffff
   140a942fb:	jne    0x140a94307
   140a942fd:	cmp    DWORD PTR [rdi+0x4c],0xffffffff
   140a94301:	je     0x140a9458a
   140a94307:	xorps  xmm0,xmm0
   140a9430a:	movups XMMWORD PTR [rbp-0x30],xmm0
   140a9430e:	mov    QWORD PTR [rbp-0x20],r12
   140a94312:	mov    QWORD PTR [rbp-0x18],rbx
   140a94316:	mov    BYTE PTR [rbp-0x30],0x0
   140a9431a:	movsxd rcx,DWORD PTR [rdi+0x6c]
   140a9431e:	movsxd rax,DWORD PTR [rdi+0x48]
   140a94322:	test   eax,eax
   140a94324:	js     0x140a94391
   140a94326:	mov    r8,rax
   140a94329:	mov    rax,QWORD PTR [rip+0x1a59448]        # 0x1424ed778
   140a94330:	sub    rax,QWORD PTR [rip+0x1a59439]        # 0x1424ed770
   140a94337:	sar    rax,0x3
   140a9433b:	cmp    r8,rax
   140a9433e:	jae    0x140a94391
   140a94340:	test   ecx,ecx
   140a94342:	js     0x140a94391
   140a94344:	mov    rax,QWORD PTR [rip+0x1a5945d]        # 0x1424ed7a8
   140a9434b:	mov    rdx,QWORD PTR [rip+0x1a5944e]        # 0x1424ed7a0
   140a94352:	sub    rax,rdx
   140a94355:	sar    rax,0x3
   140a94359:	cmp    rcx,rax
   140a9435c:	jae    0x140a94398
   140a9435e:	mov    rax,QWORD PTR [rdx+rcx*8]
   140a94362:	mov    r9,QWORD PTR [rax+0x50]
   140a94366:	mov    rcx,QWORD PTR [rax+0x58]
   140a9436a:	sub    rcx,r9
   140a9436d:	sar    rcx,0x3
   140a94371:	cmp    rcx,r8
   140a94374:	jb     0x140a94398
   140a94376:	mov    rdx,QWORD PTR [r9+r8*8]
   140a9437a:	mov    r8,QWORD PTR [rdx+0x10]
   140a9437e:	cmp    QWORD PTR [rdx+0x18],0xf
   140a94383:	jbe    0x140a94388
   140a94385:	mov    rdx,QWORD PTR [rdx]
   140a94388:	lea    rcx,[rbp-0x30]
   140a9438c:	call   0x14006fa10
   140a94391:	mov    rdx,QWORD PTR [rip+0x1a59408]        # 0x1424ed7a0
   140a94398:	movsxd rcx,DWORD PTR [rdi+0x6c]
   140a9439c:	movsxd rax,DWORD PTR [rdi+0x4c]
   140a943a0:	test   eax,eax
   140a943a2:	js     0x140a9440f
   140a943a4:	mov    r8,rax
   140a943a7:	mov    rax,QWORD PTR [rip+0x1a593ca]        # 0x1424ed778
   140a943ae:	sub    rax,QWORD PTR [rip+0x1a593bb]        # 0x1424ed770
   140a943b5:	sar    rax,0x3
   140a943b9:	cmp    r8,rax
   140a943bc:	jae    0x140a9440f
   140a943be:	test   ecx,ecx
   140a943c0:	js     0x140a9440f
   140a943c2:	mov    rax,QWORD PTR [rip+0x1a593df]        # 0x1424ed7a8
   140a943c9:	sub    rax,rdx
   140a943cc:	sar    rax,0x3
   140a943d0:	cmp    rcx,rax
   140a943d3:	jae    0x140a9440f
   140a943d5:	mov    rax,QWORD PTR [rdx+rcx*8]
   140a943d9:	mov    r9,QWORD PTR [rax+0x50]
   140a943dd:	mov    rcx,QWORD PTR [rax+0x58]
   140a943e1:	sub    rcx,r9
   140a943e4:	sar    rcx,0x3
   140a943e8:	cmp    rcx,r8
   140a943eb:	jb     0x140a9440f
   140a943ed:	mov    rdx,QWORD PTR [r9+r8*8]
   140a943f1:	mov    r8,QWORD PTR [rdx+0x10]
   140a943f5:	cmp    QWORD PTR [rdx+0x18],0xf
   140a943fa:	jbe    0x140a943ff
   140a943fc:	mov    rdx,QWORD PTR [rdx]
   140a943ff:	lea    rcx,[rbp-0x30]
   140a94403:	call   0x14006fa10
   140a94408:	mov    rdx,QWORD PTR [rip+0x1a59391]        # 0x1424ed7a0
   140a9440f:	movsxd rcx,DWORD PTR [rdi+0x6c]
   140a94413:	movsxd rax,DWORD PTR [rdi+0x50]
   140a94417:	test   eax,eax
   140a94419:	js     0x140a94486
   140a9441b:	mov    r8,rax
   140a9441e:	mov    rax,QWORD PTR [rip+0x1a59353]        # 0x1424ed778
   140a94425:	sub    rax,QWORD PTR [rip+0x1a59344]        # 0x1424ed770
   140a9442c:	sar    rax,0x3
   140a94430:	cmp    r8,rax
   140a94433:	jae    0x140a94486
   140a94435:	test   ecx,ecx
   140a94437:	js     0x140a94486
   140a94439:	mov    rax,QWORD PTR [rip+0x1a59368]        # 0x1424ed7a8
   140a94440:	sub    rax,rdx
   140a94443:	sar    rax,0x3
   140a94447:	cmp    rcx,rax
   140a9444a:	jae    0x140a94486
   140a9444c:	mov    rax,QWORD PTR [rdx+rcx*8]
   140a94450:	mov    r9,QWORD PTR [rax+0x50]
   140a94454:	mov    rcx,QWORD PTR [rax+0x58]
   140a94458:	sub    rcx,r9
   140a9445b:	sar    rcx,0x3
   140a9445f:	cmp    rcx,r8
   140a94462:	jb     0x140a94486
   140a94464:	mov    rdx,QWORD PTR [r9+r8*8]
   140a94468:	mov    r8,QWORD PTR [rdx+0x10]
   140a9446c:	cmp    QWORD PTR [rdx+0x18],0xf
   140a94471:	jbe    0x140a94476
   140a94473:	mov    rdx,QWORD PTR [rdx]
   140a94476:	lea    rcx,[rbp-0x30]
   140a9447a:	call   0x14006fa10
   140a9447f:	mov    rdx,QWORD PTR [rip+0x1a5931a]        # 0x1424ed7a0
   140a94486:	movsxd rcx,DWORD PTR [rdi+0x6c]
   140a9448a:	movsxd rax,DWORD PTR [rdi+0x54]
   140a9448e:	test   eax,eax
   140a94490:	js     0x140a944fd
   140a94492:	mov    r8,rax
   140a94495:	mov    rax,QWORD PTR [rip+0x1a592dc]        # 0x1424ed778
   140a9449c:	sub    rax,QWORD PTR [rip+0x1a592cd]        # 0x1424ed770
   140a944a3:	sar    rax,0x3
   140a944a7:	cmp    r8,rax
   140a944aa:	jae    0x140a944fd
   140a944ac:	test   ecx,ecx
   140a944ae:	js     0x140a944fd
   140a944b0:	mov    rax,QWORD PTR [rip+0x1a592f1]        # 0x1424ed7a8
   140a944b7:	sub    rax,rdx
   140a944ba:	sar    rax,0x3
   140a944be:	cmp    rcx,rax
   140a944c1:	jae    0x140a944fd
   140a944c3:	mov    rax,QWORD PTR [rdx+rcx*8]
   140a944c7:	mov    r9,QWORD PTR [rax+0x50]
   140a944cb:	mov    rcx,QWORD PTR [rax+0x58]
   140a944cf:	sub    rcx,r9
   140a944d2:	sar    rcx,0x3
   140a944d6:	cmp    rcx,r8
   140a944d9:	jb     0x140a944fd
   140a944db:	mov    rdx,QWORD PTR [r9+r8*8]
   140a944df:	mov    r8,QWORD PTR [rdx+0x10]
   140a944e3:	cmp    QWORD PTR [rdx+0x18],0xf
   140a944e8:	jbe    0x140a944ed
   140a944ea:	mov    rdx,QWORD PTR [rdx]
   140a944ed:	lea    rcx,[rbp-0x30]
   140a944f1:	call   0x14006fa10
   140a944f6:	mov    rdx,QWORD PTR [rip+0x1a592a3]        # 0x1424ed7a0
   140a944fd:	cmp    QWORD PTR [rbp-0x20],0x0
   140a94502:	je     0x140a9454b
   140a94504:	test   r15b,r15b
   140a94507:	je     0x140a9451e
   140a94509:	mov    r8d,0x1
   140a9450f:	lea    rdx,[rip+0xb54226]        # 0x1415e873c
   140a94516:	mov    rcx,rsi
   140a94519:	call   0x14006fa10
   140a9451e:	lea    rcx,[rbp-0x30]
   140a94522:	call   0x14052d3c0
   140a94527:	lea    rdx,[rbp-0x30]
   140a9452b:	cmp    QWORD PTR [rbp-0x18],0xf
   140a94530:	cmova  rdx,QWORD PTR [rbp-0x30]
   140a94535:	mov    r8,QWORD PTR [rbp-0x20]
   140a94539:	mov    rcx,rsi
   140a9453c:	call   0x14006fa10
   140a94541:	mov    r15b,0x1
   140a94544:	mov    rdx,QWORD PTR [rip+0x1a59255]        # 0x1424ed7a0
   140a9454b:	mov    rax,QWORD PTR [rbp-0x18]
   140a9454f:	cmp    rax,0xf
   140a94553:	jbe    0x140a94591
   140a94555:	lea    rdx,[rax+0x1]
   140a94559:	mov    rcx,QWORD PTR [rbp-0x30]
   140a9455d:	mov    rax,rcx
   140a94560:	cmp    rdx,0x1000
   140a94567:	jb     0x140a94585
   140a94569:	add    rdx,0x27
   140a9456d:	mov    rcx,QWORD PTR [rcx-0x8]
   140a94571:	sub    rax,rcx
   140a94574:	add    rax,0xfffffffffffffff8
   140a94578:	cmp    rax,0x1f
   140a9457c:	jbe    0x140a94585
   140a9457e:	call   QWORD PTR [rip+0xb515a4]        # 0x1415e5b28
   140a94584:	int3
   140a94585:	call   0x141539680
   140a9458a:	mov    rdx,QWORD PTR [rip+0x1a5920f]        # 0x1424ed7a0
   140a94591:	movsxd rax,DWORD PTR [rdi+0x58]
   140a94595:	cmp    eax,0xffffffff
   140a94598:	je     0x140a946ac
   140a9459e:	xorps  xmm0,xmm0
   140a945a1:	movups XMMWORD PTR [rbp-0x30],xmm0
   140a945a5:	mov    QWORD PTR [rbp-0x20],r12
   140a945a9:	mov    QWORD PTR [rbp-0x18],rbx
   140a945ad:	mov    BYTE PTR [rbp-0x30],0x0
   140a945b1:	movsxd rcx,DWORD PTR [rdi+0x6c]
   140a945b5:	test   eax,eax
   140a945b7:	js     0x140a94671
   140a945bd:	mov    r8,rax
   140a945c0:	mov    rax,QWORD PTR [rip+0x1a591b1]        # 0x1424ed778
   140a945c7:	sub    rax,QWORD PTR [rip+0x1a591a2]        # 0x1424ed770
   140a945ce:	sar    rax,0x3
   140a945d2:	cmp    r8,rax
   140a945d5:	jae    0x140a94671
   140a945db:	test   ecx,ecx
   140a945dd:	js     0x140a94671
   140a945e3:	mov    rax,QWORD PTR [rip+0x1a591be]        # 0x1424ed7a8
   140a945ea:	sub    rax,rdx
   140a945ed:	sar    rax,0x3
   140a945f1:	cmp    rcx,rax
   140a945f4:	jae    0x140a94671
   140a945f6:	mov    rax,QWORD PTR [rdx+rcx*8]
   140a945fa:	mov    rdx,QWORD PTR [rax+0x50]
   140a945fe:	mov    rcx,QWORD PTR [rax+0x58]
   140a94602:	sub    rcx,rdx
   140a94605:	sar    rcx,0x3
   140a94609:	cmp    rcx,r8
   140a9460c:	jb     0x140a94671
   140a9460e:	mov    rdx,QWORD PTR [rdx+r8*8]
   140a94612:	mov    r8,QWORD PTR [rdx+0x10]
   140a94616:	cmp    QWORD PTR [rdx+0x18],0xf
   140a9461b:	jbe    0x140a94620
   140a9461d:	mov    rdx,QWORD PTR [rdx]
   140a94620:	lea    rcx,[rbp-0x30]
   140a94624:	call   0x14006fa10
   140a94629:	cmp    QWORD PTR [rbp-0x20],0x0
   140a9462e:	je     0x140a9466d
   140a94630:	test   r15b,r15b
   140a94633:	je     0x140a9464a
   140a94635:	mov    r8d,0x1
   140a9463b:	lea    rdx,[rip+0xb540fa]        # 0x1415e873c
   140a94642:	mov    rcx,rsi
   140a94645:	call   0x14006fa10
   140a9464a:	lea    rcx,[rbp-0x30]
   140a9464e:	call   0x14052d3c0
   140a94653:	lea    rdx,[rbp-0x30]
   140a94657:	cmp    QWORD PTR [rbp-0x18],0xf
   140a9465c:	cmova  rdx,QWORD PTR [rbp-0x30]
   140a94661:	mov    r8,QWORD PTR [rbp-0x20]
   140a94665:	mov    rcx,rsi
   140a94668:	call   0x14006fa10
   140a9466d:	mov    rbx,QWORD PTR [rbp-0x18]
   140a94671:	cmp    rbx,0xf
   140a94675:	jbe    0x140a946ac
   140a94677:	lea    rdx,[rbx+0x1]
   140a9467b:	mov    rcx,QWORD PTR [rbp-0x30]
   140a9467f:	mov    rax,rcx
   140a94682:	cmp    rdx,0x1000
   140a94689:	jb     0x140a946a7
   140a9468b:	add    rdx,0x27
   140a9468f:	mov    rcx,QWORD PTR [rcx-0x8]
   140a94693:	sub    rax,rcx
   140a94696:	add    rax,0xfffffffffffffff8
   140a9469a:	cmp    rax,0x1f
   140a9469e:	jbe    0x140a946a7
   140a946a0:	call   QWORD PTR [rip+0xb51482]        # 0x1415e5b28
   140a946a6:	int3
   140a946a7:	call   0x141539680
   140a946ac:	mov    rcx,QWORD PTR [rbp-0x10]
   140a946b0:	xor    rcx,rsp
   140a946b3:	call   0x141539660
   140a946b8:	lea    r11,[rsp+0x50]
   140a946bd:	mov    rbx,QWORD PTR [r11+0x40]
   140a946c1:	mov    rsi,QWORD PTR [r11+0x48]
   140a946c5:	mov    rsp,r11
   140a946c8:	pop    r15
   140a946ca:	pop    r14
   140a946cc:	pop    r12
   140a946ce:	pop    rdi
   140a946cf:	pop    rbp
   140a946d0:	ret
