0x140b91440: mov    QWORD PTR [rsp+0x8],rbx
0x140b91445: mov    QWORD PTR [rsp+0x18],rbp
0x140b9144a: push   rsi
0x140b9144b: push   rdi
0x140b9144c: push   r14
0x140b9144e: sub    rsp,0x50
0x140b91452: mov    rax,QWORD PTR [rip+0xd04be7]        # 0x141896040
0x140b91459: xor    rax,rsp
0x140b9145c: mov    QWORD PTR [rsp+0x40],rax
0x140b91461: mov    r14d,r9d
0x140b91464: mov    rbp,rdx
0x140b91467: mov    r9,QWORD PTR [rip+0x184ec0a]        # 0x1423e0078
0x140b9146e: mov    r11,QWORD PTR [rip+0x184ebfb]        # 0x1423e0070
0x140b91475: sub    r9,r11
0x140b91478: sar    r9,0x3
0x140b9147c: test   r9d,r9d
0x140b9147f: je     0x140b914b6
0x140b91481: cmp    r8d,0xffffffff
0x140b91485: je     0x140b914b6
0x140b91487: xor    edx,edx
0x140b91489: sub    r9d,0x1
0x140b9148d: js     0x140b914b6
0x140b9148f: nop
0x140b91490: lea    ecx,[rdx+r9*1]
0x140b91494: sar    ecx,1
0x140b91496: movsxd rax,ecx
0x140b91499: mov    rbx,QWORD PTR [r11+rax*8]
0x140b9149d: cmp    DWORD PTR [rbx],r8d
0x140b914a0: je     0x140b914b8
0x140b914a2: lea    eax,[rcx+0x1]
0x140b914a5: cmovle edx,eax
0x140b914a8: lea    eax,[rcx-0x1]
0x140b914ab: cmovle eax,r9d
0x140b914af: mov    r9d,eax
0x140b914b2: cmp    edx,eax
0x140b914b4: jle    0x140b91490
0x140b914b6: xor    ebx,ebx
0x140b914b8: test   rbx,rbx
0x140b914bb: je     0x140b91718
0x140b914c1: and    r14d,0x2
0x140b914c5: lea    rdi,[rbx+0x90]
0x140b914cc: je     0x140b91542
0x140b914ce: mov    rcx,QWORD PTR [rdi]
0x140b914d1: mov    rax,QWORD PTR [rcx]
0x140b914d4: call   QWORD PTR [rax]
0x140b914d6: cmp    ax,0x59
0x140b914da: je     0x140b9150e
0x140b914dc: mov    rcx,QWORD PTR [rdi]
0x140b914df: mov    rax,QWORD PTR [rcx]
0x140b914e2: mov    edx,0x14
0x140b914e7: call   QWORD PTR [rax+0xe0]
0x140b914ed: test   al,al
0x140b914ef: jne    0x140b9150e
0x140b914f1: mov    rcx,QWORD PTR [rdi]
0x140b914f4: mov    rax,QWORD PTR [rcx]
0x140b914f7: call   QWORD PTR [rax]
0x140b914f9: cmp    ax,0x57
0x140b914fd: je     0x140b9150e
0x140b914ff: lea    rdx,[rip+0xa6751a]        # 0x1415f8a20  '[LPAGE:ARTIFACT:'
0x140b91506: mov    r8d,0x10
0x140b9150c: jmp    0x140b9151b
0x140b9150e: lea    rdx,[rip+0xb48fd3]        # 0x1416da4e8  '[LPAGE:BOOK:'
0x140b91515: mov    r8d,0xc
0x140b9151b: mov    rcx,rbp
0x140b9151e: call   0x14006f9a0
0x140b91523: mov    rdx,rbp
0x140b91526: mov    ecx,DWORD PTR [rbx]
0x140b91528: call   0x140529cf0
0x140b9152d: mov    r8d,0x1
0x140b91533: lea    rdx,[rip+0xa6712a]        # 0x1415f8664  ']'
0x140b9153a: mov    rcx,rbp
0x140b9153d: call   0x14006f9a0
0x140b91542: xorps  xmm0,xmm0
0x140b91545: movups XMMWORD PTR [rsp+0x20],xmm0
0x140b9154a: mov    QWORD PTR [rsp+0x30],0x0
0x140b91553: mov    QWORD PTR [rsp+0x38],0xf
0x140b9155c: mov    BYTE PTR [rsp+0x20],0x0
0x140b91561: lea    rcx,[rbx+0x8]
0x140b91565: xor    r9d,r9d
0x140b91568: mov    r8b,0x1
0x140b9156b: lea    rdx,[rsp+0x20]
0x140b91570: call   0x140a91760
0x140b91575: cmp    QWORD PTR [rsp+0x30],0x0
0x140b9157b: jne    0x140b9169d
0x140b91581: mov    rcx,QWORD PTR [rdi]
0x140b91584: mov    rax,QWORD PTR [rcx]
0x140b91587: call   QWORD PTR [rax]
0x140b91589: cmp    ax,0x59
0x140b9158d: je     0x140b915cd
0x140b9158f: mov    rcx,QWORD PTR [rdi]
0x140b91592: mov    rax,QWORD PTR [rcx]
0x140b91595: mov    edx,0x14
0x140b9159a: call   QWORD PTR [rax+0xe0]
0x140b915a0: test   al,al
0x140b915a2: jne    0x140b915cd
0x140b915a4: mov    rcx,QWORD PTR [rdi]
0x140b915a7: mov    rax,QWORD PTR [rcx]
0x140b915aa: call   QWORD PTR [rax]
0x140b915ac: cmp    ax,0x57
0x140b915b0: je     0x140b915cd
0x140b915b2: mov    r9d,0x1
0x140b915b8: xor    r8d,r8d
0x140b915bb: lea    rdx,[rsp+0x20]
0x140b915c0: mov    rcx,QWORD PTR [rdi]
0x140b915c3: call   0x140c62490
0x140b915c8: jmp    0x140b9169d
0x140b915cd: mov    rbx,QWORD PTR [rsp+0x38]
0x140b915d2: cmp    rbx,0x8
0x140b915d6: jb     0x140b91606
0x140b915d8: lea    rax,[rsp+0x20]
0x140b915dd: cmp    rbx,0xf
0x140b915e1: cmova  rax,QWORD PTR [rsp+0x20]
0x140b915e7: mov    QWORD PTR [rsp+0x30],0x8
0x140b915f0: movabs rcx,0x64656c7469746e55
0x140b915fa: mov    QWORD PTR [rax],rcx
0x140b915fd: mov    BYTE PTR [rax+0x8],0x0
0x140b91601: jmp    0x140b9169d
0x140b91606: mov    rcx,rbx
0x140b91609: shr    rcx,1
0x140b9160c: movabs rdi,0x7fffffffffffffff
0x140b91616: mov    rax,rdi
0x140b91619: sub    rax,rcx
0x140b9161c: cmp    rbx,rax
0x140b9161f: ja     0x140b91631
0x140b91621: lea    rax,[rcx+rbx*1]
0x140b91625: mov    edi,0xf
0x140b9162a: cmp    rax,rdi
0x140b9162d: cmova  rdi,rax
0x140b91631: lea    rcx,[rdi+0x1]
0x140b91635: call   0x140070760
0x140b9163a: mov    rsi,rax
0x140b9163d: mov    QWORD PTR [rsp+0x30],0x8
0x140b91646: mov    QWORD PTR [rsp+0x38],rdi
0x140b9164b: movabs rcx,0x64656c7469746e55
0x140b91655: mov    QWORD PTR [rax],rcx
0x140b91658: mov    BYTE PTR [rax+0x8],0x0
0x140b9165c: cmp    rbx,0xf
0x140b91660: jbe    0x140b91698
0x140b91662: lea    rdx,[rbx+0x1]
0x140b91666: mov    rcx,QWORD PTR [rsp+0x20]
0x140b9166b: mov    rax,rcx
0x140b9166e: cmp    rdx,0x1000
0x140b91675: jb     0x140b91693
0x140b91677: add    rdx,0x27
0x140b9167b: mov    rcx,QWORD PTR [rcx-0x8]
0x140b9167f: sub    rax,rcx
0x140b91682: add    rax,0xfffffffffffffff8
0x140b91686: cmp    rax,0x1f
0x140b9168a: jbe    0x140b91693
0x140b9168c: call   QWORD PTR [rip+0xa4f40e]        # 0x1415e0aa0
0x140b91692: int3
0x140b91693: call   0x1415345f0
0x140b91698: mov    QWORD PTR [rsp+0x20],rsi
0x140b9169d: lea    rdx,[rsp+0x20]
0x140b916a2: cmp    QWORD PTR [rsp+0x38],0xf
0x140b916a8: cmova  rdx,QWORD PTR [rsp+0x20]
0x140b916ae: mov    r8,QWORD PTR [rsp+0x30]
0x140b916b3: mov    rcx,rbp
0x140b916b6: call   0x14006f9a0
0x140b916bb: test   r14d,r14d
0x140b916be: je     0x140b916d6
0x140b916c0: mov    r8d,0x8
0x140b916c6: lea    rdx,[rip+0xa67483]        # 0x1415f8b50  '[/LPAGE]'
0x140b916cd: mov    rcx,rbp
0x140b916d0: call   0x14006f9a0
0x140b916d5: nop
0x140b916d6: mov    rdx,QWORD PTR [rsp+0x38]
0x140b916db: cmp    rdx,0xf
0x140b916df: jbe    0x140b9172d
0x140b916e1: inc    rdx
0x140b916e4: mov    rcx,QWORD PTR [rsp+0x20]
0x140b916e9: mov    rax,rcx
0x140b916ec: cmp    rdx,0x1000
0x140b916f3: jb     0x140b91711
0x140b916f5: add    rdx,0x27
0x140b916f9: mov    rcx,QWORD PTR [rcx-0x8]
0x140b916fd: sub    rax,rcx
0x140b91700: add    rax,0xfffffffffffffff8
0x140b91704: cmp    rax,0x1f
0x140b91708: jbe    0x140b91711
0x140b9170a: call   QWORD PTR [rip+0xa4f390]        # 0x1415e0aa0
0x140b91710: int3
0x140b91711: call   0x1415345f0
0x140b91716: jmp    0x140b9172d
0x140b91718: mov    r8d,0x13
0x140b9171e: lea    rdx,[rip+0xb48dab]        # 0x1416da4d0  'an unknown artifact'
0x140b91725: mov    rcx,rbp
0x140b91728: call   0x14006f9a0
0x140b9172d: mov    rcx,QWORD PTR [rsp+0x40]
0x140b91732: xor    rcx,rsp
0x140b91735: call   0x1415345d0
0x140b9173a: mov    rbx,QWORD PTR [rsp+0x70]
0x140b9173f: mov    rbp,QWORD PTR [rsp+0x80]
0x140b91747: add    rsp,0x50
0x140b9174b: pop    r14
0x140b9174d: pop    rdi
0x140b9174e: pop    rsi
0x140b9174f: ret
