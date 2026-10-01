0x14070f070: rex push rbp
0x14070f072: push   rbx
0x14070f073: push   rsi
0x14070f074: push   rdi
0x14070f075: push   r12
0x14070f077: push   r13
0x14070f079: push   r14
0x14070f07b: push   r15
0x14070f07d: lea    rbp,[rsp-0x48]
0x14070f082: sub    rsp,0x148
0x14070f089: mov    r12,rcx
0x14070f08c: cmp    QWORD PTR [rcx],0x0
0x14070f090: je     0x14071221b
0x14070f096: cmp    QWORD PTR [rcx+0x8],0x0
0x14070f09b: je     0x14071221b
0x14070f0a1: cmp    QWORD PTR [rcx+0x48],0x0
0x14070f0a6: je     0x14071221b
0x14070f0ac: call   0x1405c0b20
0x14070f0b1: mov    r14d,DWORD PTR [r12+0x10]
0x14070f0b6: neg    r14d
0x14070f0b9: cmovs  r14d,DWORD PTR [r12+0x10]
0x14070f0bf: mov    eax,DWORD PTR [r12+0x14]
0x14070f0c4: neg    eax
0x14070f0c6: cmovs  eax,DWORD PTR [r12+0x14]
0x14070f0cc: cmp    eax,r14d
0x14070f0cf: jle    0x14070f0d4
0x14070f0d1: mov    r14d,eax
0x14070f0d4: xorps  xmm0,xmm0
0x14070f0d7: movdqu XMMWORD PTR [rsp+0x78],xmm0
0x14070f0dd: xor    r13d,r13d
0x14070f0e0: mov    QWORD PTR [rbp-0x78],r13
0x14070f0e4: movdqu XMMWORD PTR [rbp-0x70],xmm0
0x14070f0e9: mov    QWORD PTR [rbp-0x60],r13
0x14070f0ed: movdqu XMMWORD PTR [rsp+0x58],xmm0
0x14070f0f3: mov    QWORD PTR [rsp+0x68],r13
0x14070f0f8: mov    DWORD PTR [rbp+0x98],r13d
0x14070f0ff: mov    rcx,QWORD PTR [r12+0x8]
0x14070f104: mov    rax,QWORD PTR [rcx+0x16d0]
0x14070f10b: sub    rax,QWORD PTR [rcx+0x16c8]
0x14070f112: sar    rax,0x3
0x14070f116: test   rax,rax
0x14070f119: je     0x14070f196
0x14070f11b: mov    BYTE PTR [rbp+0x90],0x2
0x14070f122: mov    edi,r13d
0x14070f125: mov    ebx,r13d
0x14070f128: nop    DWORD PTR [rax+rax*1+0x0]
0x14070f130: lea    rdx,[rbp+0x90]
0x14070f137: lea    rcx,[rsp+0x78]
0x14070f13c: call   0x1401f9b00
0x14070f141: lea    rdx,[rbp+0x98]
0x14070f148: lea    rcx,[rbp-0x70]
0x14070f14c: call   0x14006f410
0x14070f151: mov    rax,QWORD PTR [r12+0x8]
0x14070f156: mov    rax,QWORD PTR [rax+0x16c8]
0x14070f15d: mov    rdx,QWORD PTR [rax+rdi*8]
0x14070f161: add    rdx,0x6c
0x14070f165: lea    rcx,[rsp+0x58]
0x14070f16a: call   0x14006f410
0x14070f16f: inc    ebx
0x14070f171: mov    DWORD PTR [rbp+0x98],ebx
0x14070f177: mov    rcx,QWORD PTR [r12+0x8]
0x14070f17c: movsxd rdi,ebx
0x14070f17f: mov    rax,QWORD PTR [rcx+0x16d0]
0x14070f186: sub    rax,QWORD PTR [rcx+0x16c8]
0x14070f18d: sar    rax,0x3
0x14070f191: cmp    rdi,rax
0x14070f194: jb     0x14070f130
0x14070f196: mov    esi,r13d
0x14070f199: mov    DWORD PTR [rbp+0x98],r13d
0x14070f1a0: mov    rax,QWORD PTR [rcx+0x1610]
0x14070f1a7: sub    rax,QWORD PTR [rcx+0x1608]
0x14070f1ae: sar    rax,0x3
0x14070f1b2: test   rax,rax
0x14070f1b5: je     0x14070f313
0x14070f1bb: mov    r8,r13
0x14070f1be: xchg   ax,ax
0x14070f1c0: mov    rax,QWORD PTR [rcx+0x1608]
0x14070f1c7: mov    rdx,QWORD PTR [rax+r8*8]
0x14070f1cb: mov    ecx,DWORD PTR [rdx+0x28]
0x14070f1ce: mov    r10d,DWORD PTR [rdx+0x2c]
0x14070f1d2: mov    rax,QWORD PTR [r12+0x18]
0x14070f1d7: mov    r9d,DWORD PTR [rax+r8*4]
0x14070f1db: cmp    r9d,ecx
0x14070f1de: jg     0x14070f1e5
0x14070f1e0: sub    ecx,r9d
0x14070f1e3: jmp    0x14070f1f4
0x14070f1e5: cmp    r9d,r10d
0x14070f1e8: jl     0x14070f2e8
0x14070f1ee: mov    ecx,r9d
0x14070f1f1: sub    ecx,r10d
0x14070f1f4: mov    r8d,DWORD PTR [rdx+0x50]
0x14070f1f8: inc    ecx
0x14070f1fa: imul   ecx,r8d
0x14070f1fe: mov    DWORD PTR [rbp+0xa0],ecx
0x14070f204: movsx  edx,WORD PTR [rdx]
0x14070f207: test   edx,edx
0x14070f209: je     0x14070f215
0x14070f20b: sub    edx,0x1
0x14070f20e: je     0x14070f215
0x14070f210: cmp    edx,0x1
0x14070f213: jne    0x14070f222
0x14070f215: imul   r8d,r14d
0x14070f219: add    ecx,r8d
0x14070f21c: mov    DWORD PTR [rbp+0xa0],ecx
0x14070f222: mov    edi,r13d
0x14070f225: mov    r8,QWORD PTR [rsp+0x60]
0x14070f22a: mov    rdx,QWORD PTR [rsp+0x58]
0x14070f22f: sub    r8,rdx
0x14070f232: sar    r8,0x2
0x14070f236: test   r8,r8
0x14070f239: je     0x14070f299
0x14070f23b: nop    DWORD PTR [rax+rax*1+0x0]
0x14070f240: cmp    ecx,DWORD PTR [rdx]
0x14070f242: jg     0x14070f254
0x14070f244: inc    edi
0x14070f246: add    rdx,0x4
0x14070f24a: movsxd rax,edi
0x14070f24d: cmp    rax,r8
0x14070f250: jb     0x14070f240
0x14070f252: jmp    0x14070f299
0x14070f254: mov    BYTE PTR [rbp+0x90],0x0
0x14070f25b: movsxd rbx,edi
0x14070f25e: lea    r8,[rbp+0x90]
0x14070f265: mov    rdx,rbx
0x14070f268: lea    rcx,[rsp+0x78]
0x14070f26d: call   0x140283e40
0x14070f272: lea    r8,[rbp+0x98]
0x14070f279: mov    rdx,rbx
0x14070f27c: lea    rcx,[rbp-0x70]
0x14070f280: call   0x1400b9a10
0x14070f285: lea    r8,[rbp+0xa0]
0x14070f28c: mov    rdx,rbx
0x14070f28f: lea    rcx,[rsp+0x58]
0x14070f294: call   0x1400b9a10
0x14070f299: mov    rcx,QWORD PTR [rsp+0x60]
0x14070f29e: sub    rcx,QWORD PTR [rsp+0x58]
0x14070f2a3: sar    rcx,0x2
0x14070f2a7: movsxd rax,edi
0x14070f2aa: cmp    rax,rcx
0x14070f2ad: jne    0x14070f2e8
0x14070f2af: mov    BYTE PTR [rbp+0x90],0x0
0x14070f2b6: lea    rdx,[rbp+0x90]
0x14070f2bd: lea    rcx,[rsp+0x78]
0x14070f2c2: call   0x1401f9b00
0x14070f2c7: lea    rdx,[rbp+0x98]
0x14070f2ce: lea    rcx,[rbp-0x70]
0x14070f2d2: call   0x14006f410
0x14070f2d7: lea    rdx,[rbp+0xa0]
0x14070f2de: lea    rcx,[rsp+0x58]
0x14070f2e3: call   0x14006f410
0x14070f2e8: inc    esi
0x14070f2ea: mov    DWORD PTR [rbp+0x98],esi
0x14070f2f0: mov    rcx,QWORD PTR [r12+0x8]
0x14070f2f5: movsxd r8,esi
0x14070f2f8: mov    rax,QWORD PTR [rcx+0x1610]
0x14070f2ff: sub    rax,QWORD PTR [rcx+0x1608]
0x14070f306: sar    rax,0x3
0x14070f30a: cmp    r8,rax
0x14070f30d: jb     0x14070f1c0
0x14070f313: mov    rdx,QWORD PTR [rcx+0x1628]
0x14070f31a: sub    rdx,QWORD PTR [rcx+0x1620]
0x14070f321: sar    rdx,0x3
0x14070f325: test   rdx,rdx
0x14070f328: je     0x14070f54b
0x14070f32e: xorps  xmm0,xmm0
0x14070f331: movdqu XMMWORD PTR [rbp-0x58],xmm0
0x14070f336: mov    QWORD PTR [rbp-0x48],r13
0x14070f33a: lea    rcx,[rbp-0x58]
0x14070f33e: call   0x14006f380
0x14070f343: mov    rcx,QWORD PTR [rbp-0x50]
0x14070f347: mov    r15,QWORD PTR [rbp-0x58]
0x14070f34b: sub    rcx,r15
0x14070f34e: sar    rcx,0x2
0x14070f352: sub    ecx,0x1
0x14070f355: js     0x14070f370
0x14070f357: movsxd rax,ecx
0x14070f35a: lea    rdx,[r15+rax*4]
0x14070f35e: xchg   ax,ax
0x14070f360: mov    DWORD PTR [rdx],r13d
0x14070f363: lea    eax,[rcx-0x1]
0x14070f366: lea    rdx,[rdx-0x4]
0x14070f36a: mov    ecx,eax
0x14070f36c: test   eax,eax
0x14070f36e: jns    0x14070f360
0x14070f370: mov    r10d,r13d
0x14070f373: mov    r8,QWORD PTR [r12+0x30]
0x14070f378: mov    rax,QWORD PTR [r12+0x38]
0x14070f37d: sub    rax,r8
0x14070f380: sar    rax,0x2
0x14070f384: test   rax,rax
0x14070f387: je     0x14070f3f4
0x14070f389: mov    r9,r13
0x14070f38c: nop    DWORD PTR [rax+0x0]
0x14070f390: mov    rcx,QWORD PTR [r12+0x8]
0x14070f395: mov    rax,QWORD PTR [rcx+0x1638]
0x14070f39c: movsxd rbx,DWORD PTR [rax+r9*4]
0x14070f3a0: mov    rax,QWORD PTR [rcx+0x1620]
0x14070f3a7: mov    rdx,QWORD PTR [rax+rbx*8]
0x14070f3ab: mov    eax,DWORD PTR [rdx+0x28]
0x14070f3ae: mov    r11d,DWORD PTR [rdx+0x2c]
0x14070f3b2: mov    ecx,DWORD PTR [r8+r9*4]
0x14070f3b6: cmp    ecx,eax
0x14070f3b8: jg     0x14070f3be
0x14070f3ba: sub    eax,ecx
0x14070f3bc: jmp    0x14070f3c8
0x14070f3be: cmp    ecx,r11d
0x14070f3c1: jl     0x14070f3d8
0x14070f3c3: mov    eax,ecx
0x14070f3c5: sub    eax,r11d
0x14070f3c8: inc    eax
0x14070f3ca: imul   eax,DWORD PTR [rdx+0x50]
0x14070f3ce: cmp    DWORD PTR [r15+rbx*4],eax
0x14070f3d2: jge    0x14070f3d8
0x14070f3d4: mov    DWORD PTR [r15+rbx*4],eax
0x14070f3d8: inc    r10d
0x14070f3db: mov    r8,QWORD PTR [r12+0x30]
0x14070f3e0: movsxd r9,r10d
0x14070f3e3: mov    rax,QWORD PTR [r12+0x38]
0x14070f3e8: sub    rax,r8
0x14070f3eb: sar    rax,0x2
0x14070f3ef: cmp    r9,rax
0x14070f3f2: jb     0x14070f390
0x14070f3f4: mov    r14d,r13d
0x14070f3f7: mov    DWORD PTR [rbp+0x98],r13d
0x14070f3fe: mov    rax,QWORD PTR [r12+0x8]
0x14070f403: mov    rcx,QWORD PTR [rax+0x1628]
0x14070f40a: sub    rcx,QWORD PTR [rax+0x1620]
0x14070f411: sar    rcx,0x3
0x14070f415: test   rcx,rcx
0x14070f418: je     0x14070f542
0x14070f41e: mov    rdx,r13
0x14070f421: mov    esi,DWORD PTR [r15+rdx*4]
0x14070f425: mov    DWORD PTR [rbp+0xa0],esi
0x14070f42b: mov    edi,r13d
0x14070f42e: mov    rdx,QWORD PTR [rsp+0x60]
0x14070f433: mov    rcx,QWORD PTR [rsp+0x58]
0x14070f438: sub    rdx,rcx
0x14070f43b: sar    rdx,0x2
0x14070f43f: test   rdx,rdx
0x14070f442: je     0x14070f49d
0x14070f444: cmp    esi,DWORD PTR [rcx]
0x14070f446: jg     0x14070f458
0x14070f448: inc    edi
0x14070f44a: add    rcx,0x4
0x14070f44e: movsxd rax,edi
0x14070f451: cmp    rax,rdx
0x14070f454: jb     0x14070f444
0x14070f456: jmp    0x14070f49d
0x14070f458: mov    BYTE PTR [rbp+0x90],0x1
0x14070f45f: movsxd rbx,edi
0x14070f462: lea    r8,[rbp+0x90]
0x14070f469: mov    rdx,rbx
0x14070f46c: lea    rcx,[rsp+0x78]
0x14070f471: call   0x140283e40
0x14070f476: lea    r8,[rbp+0x98]
0x14070f47d: mov    rdx,rbx
0x14070f480: lea    rcx,[rbp-0x70]
0x14070f484: call   0x1400b9a10
0x14070f489: lea    r8,[rbp+0xa0]
0x14070f490: mov    rdx,rbx
0x14070f493: lea    rcx,[rsp+0x58]
0x14070f498: call   0x1400b9a10
0x14070f49d: mov    rcx,QWORD PTR [rsp+0x60]
0x14070f4a2: sub    rcx,QWORD PTR [rsp+0x58]
0x14070f4a7: sar    rcx,0x2
0x14070f4ab: movsxd rax,edi
0x14070f4ae: cmp    rax,rcx
0x14070f4b1: jne    0x14070f515
0x14070f4b3: mov    BYTE PTR [rbp+0x90],0x1
0x14070f4ba: mov    rdx,QWORD PTR [rbp-0x80]
0x14070f4be: cmp    rdx,QWORD PTR [rbp-0x78]
0x14070f4c2: je     0x14070f4cd
0x14070f4c4: mov    BYTE PTR [rdx],0x1
0x14070f4c7: inc    QWORD PTR [rbp-0x80]
0x14070f4cb: jmp    0x14070f4de
0x14070f4cd: lea    r8,[rbp+0x90]
0x14070f4d4: lea    rcx,[rsp+0x78]
0x14070f4d9: call   0x1401fa250
0x14070f4de: lea    rdx,[rbp+0x98]
0x14070f4e5: lea    rcx,[rbp-0x70]
0x14070f4e9: call   0x14006f410
0x14070f4ee: mov    rdx,QWORD PTR [rsp+0x60]
0x14070f4f3: cmp    rdx,QWORD PTR [rsp+0x68]
0x14070f4f8: je     0x14070f504
0x14070f4fa: mov    DWORD PTR [rdx],esi
0x14070f4fc: add    QWORD PTR [rsp+0x60],0x4
0x14070f502: jmp    0x14070f515
0x14070f504: lea    r8,[rbp+0xa0]
0x14070f50b: lea    rcx,[rsp+0x58]
0x14070f510: call   0x140070e20
0x14070f515: inc    r14d
0x14070f518: mov    DWORD PTR [rbp+0x98],r14d
0x14070f51f: mov    rcx,QWORD PTR [r12+0x8]
0x14070f524: movsxd rdx,r14d
0x14070f527: mov    rax,QWORD PTR [rcx+0x1628]
0x14070f52e: sub    rax,QWORD PTR [rcx+0x1620]
0x14070f535: sar    rax,0x3
0x14070f539: cmp    rdx,rax
0x14070f53c: jb     0x14070f421
0x14070f542: lea    rcx,[rbp-0x58]
0x14070f546: call   0x14006f750
0x14070f54b: mov    ebx,r13d
0x14070f54e: mov    DWORD PTR [rbp+0xa8],ebx
0x14070f554: mov    rax,QWORD PTR [rbp-0x80]
0x14070f558: mov    r11d,0x2
0x14070f55e: mov    r10d,0x1
0x14070f564: mov    rsi,QWORD PTR [rsp+0x78]
0x14070f569: sub    rax,rsi
0x14070f56c: je     0x14070fbea
0x14070f572: mov    rdx,r13
0x14070f575: mov    QWORD PTR [rsp+0x30],rdx
0x14070f57a: lea    r14,[rip+0xffffffffff8f0a7f]        # 0x140000000
0x14070f581: mov    r8d,0x3
0x14070f587: mov    r9d,0x4
0x14070f58d: mov    rdi,QWORD PTR [rbp-0x70]
0x14070f591: movzx  eax,WORD PTR [rbp+0x90]
0x14070f598: mov    DWORD PTR [rbp+0x98],eax
0x14070f59e: movzx  eax,WORD PTR [rbp+0x90]
0x14070f5a5: mov    DWORD PTR [rbp+0x90],eax
0x14070f5ab: nop    DWORD PTR [rax+rax*1+0x0]
0x14070f5b0: mov    rax,QWORD PTR [rsp+0x58]
0x14070f5b5: mov    ecx,DWORD PTR [rax+rdx*4]
0x14070f5b8: cmp    ecx,0xffffffff
0x14070f5bb: je     0x14070fbca
0x14070f5c1: cmp    ecx,0x7d0
0x14070f5c7: jl     0x14070fbca
0x14070f5cd: movsx  ecx,BYTE PTR [rsi+rdx*1]
0x14070f5d1: test   ecx,ecx
0x14070f5d3: je     0x14070f640
0x14070f5d5: sub    ecx,0x1
0x14070f5d8: je     0x14070f5ef
0x14070f5da: cmp    ecx,0x1
0x14070f5dd: jne    0x14070f685
0x14070f5e3: mov    DWORD PTR [rbp+0x98],r11d
0x14070f5ea: jmp    0x14070f685
0x14070f5ef: mov    rax,QWORD PTR [r12+0x8]
0x14070f5f4: movsxd rcx,DWORD PTR [rdi+rdx*4]
0x14070f5f8: mov    rax,QWORD PTR [rax+0x1620]
0x14070f5ff: mov    rcx,QWORD PTR [rax+rcx*8]
0x14070f603: movsx  rax,WORD PTR [rcx]
0x14070f607: cmp    eax,0x17
0x14070f60a: ja     0x14070f685
0x14070f60c: movzx  eax,BYTE PTR [r14+rax*1+0x71223c]
0x14070f615: mov    ecx,DWORD PTR [r14+rax*4+0x712230]
0x14070f61d: add    rcx,r14
0x14070f620: jmp    rcx
0x14070f622: mov    WORD PTR [rbp+0x98],r11w
0x14070f62a: jmp    0x14070f685
0x14070f62c: mov    WORD PTR [rbp+0x98],r8w
0x14070f634: jmp    0x14070f685
0x14070f636: mov    WORD PTR [rbp+0x98],r9w
0x14070f63e: jmp    0x14070f685
0x14070f640: mov    rax,QWORD PTR [r12+0x8]
0x14070f645: movsxd rcx,DWORD PTR [rdi+rdx*4]
0x14070f649: mov    rax,QWORD PTR [rax+0x1608]
0x14070f650: mov    rcx,QWORD PTR [rax+rcx*8]
0x14070f654: movsx  rax,WORD PTR [rcx]
0x14070f658: cmp    eax,0x17
0x14070f65b: ja     0x14070f685
0x14070f65d: movzx  eax,BYTE PTR [r14+rax*1+0x71225c]
0x14070f666: mov    ecx,DWORD PTR [r14+rax*4+0x712254]
0x14070f66e: add    rcx,r14
0x14070f671: jmp    rcx
0x14070f673: mov    WORD PTR [rbp+0x98],r13w
0x14070f67b: jmp    0x14070f685
0x14070f67d: mov    WORD PTR [rbp+0x98],r10w
0x14070f685: mov    ecx,0xf8
0x14070f68a: call   0x141539690
0x14070f68f: mov    rcx,rax
0x14070f692: call   0x1407122c0
0x14070f697: mov    r15,rax
0x14070f69a: mov    QWORD PTR [rbp+0xa0],rax
0x14070f6a1: mov    eax,DWORD PTR [rbp+0x98]
0x14070f6a7: mov    WORD PTR [r15],ax
0x14070f6ab: lea    rcx,[r12+0x148]
0x14070f6b3: lea    rdx,[rbp+0xa0]
0x14070f6ba: call   0x14013bbf0
0x14070f6bf: mov    DWORD PTR [rbp+0xa0],ebx
0x14070f6c5: mov    rcx,QWORD PTR [rbp-0x80]
0x14070f6c9: mov    rsi,QWORD PTR [rsp+0x78]
0x14070f6ce: sub    rcx,rsi
0x14070f6d1: mov    r8,QWORD PTR [rsp+0x30]
0x14070f6d6: mov    rdi,QWORD PTR [rbp-0x70]
0x14070f6da: cmp    r8,rcx
0x14070f6dd: jae    0x14070fbb2
0x14070f6e3: mov    rbx,r8
0x14070f6e6: mov    r13,r8
0x14070f6e9: mov    QWORD PTR [rsp+0x40],r8
0x14070f6ee: lea    r14,[r8*4+0x0]
0x14070f6f6: mov    QWORD PTR [rsp+0x38],r14
0x14070f6fb: lea    rdx,[r8*4+0x0]
0x14070f703: mov    QWORD PTR [rsp+0x50],rdx
0x14070f708: nop    DWORD PTR [rax+rax*1+0x0]
0x14070f710: mov    rax,QWORD PTR [rsp+0x58]
0x14070f715: cmp    DWORD PTR [r14+rax*1],0xffffffff
0x14070f71a: je     0x14070fb65
0x14070f720: movsx  ecx,BYTE PTR [rbx+rsi*1]
0x14070f724: test   ecx,ecx
0x14070f726: je     0x14070f79c
0x14070f728: sub    ecx,0x1
0x14070f72b: je     0x14070f746
0x14070f72d: cmp    ecx,0x1
0x14070f730: jne    0x14070f7eb
0x14070f736: mov    eax,0x2
0x14070f73b: mov    DWORD PTR [rbp+0x90],eax
0x14070f741: jmp    0x14070f7f1
0x14070f746: mov    rax,QWORD PTR [r12+0x8]
0x14070f74b: movsxd rcx,DWORD PTR [rdx+rdi*1]
0x14070f74f: mov    rax,QWORD PTR [rax+0x1620]
0x14070f756: mov    rcx,QWORD PTR [rax+rcx*8]
0x14070f75a: movsx  rax,WORD PTR [rcx]
0x14070f75e: cmp    eax,0x17
0x14070f761: ja     0x14070f7eb
0x14070f767: lea    rdx,[rip+0xffffffffff8f0892]        # 0x140000000
0x14070f76e: movzx  eax,BYTE PTR [rdx+rax*1+0x712280]
0x14070f776: mov    ecx,DWORD PTR [rdx+rax*4+0x712274]
0x14070f77d: add    rcx,rdx
0x14070f780: jmp    rcx
0x14070f782: mov    eax,0x3
0x14070f787: mov    DWORD PTR [rbp+0x90],eax
0x14070f78d: jmp    0x14070f7f1
0x14070f78f: mov    eax,0x4
0x14070f794: mov    DWORD PTR [rbp+0x90],eax
0x14070f79a: jmp    0x14070f7f1
0x14070f79c: mov    rax,QWORD PTR [r12+0x8]
0x14070f7a1: movsxd rcx,DWORD PTR [rdi+rbx*4]
0x14070f7a5: mov    rax,QWORD PTR [rax+0x1608]
0x14070f7ac: mov    rcx,QWORD PTR [rax+rcx*8]
0x14070f7b0: movsx  rax,WORD PTR [rcx]
0x14070f7b4: cmp    eax,0x17
0x14070f7b7: ja     0x14070f7eb
0x14070f7b9: lea    rdx,[rip+0xffffffffff8f0840]        # 0x140000000
0x14070f7c0: movzx  eax,BYTE PTR [rdx+rax*1+0x7122a0]
0x14070f7c8: mov    ecx,DWORD PTR [rdx+rax*4+0x712298]
0x14070f7cf: add    rcx,rdx
0x14070f7d2: jmp    rcx
0x14070f7d4: xor    eax,eax
0x14070f7d6: mov    DWORD PTR [rbp+0x90],eax
0x14070f7dc: jmp    0x14070f7f1
0x14070f7de: mov    eax,0x1
0x14070f7e3: mov    DWORD PTR [rbp+0x90],eax
0x14070f7e9: jmp    0x14070f7f1
0x14070f7eb: mov    eax,DWORD PTR [rbp+0x90]
0x14070f7f1: cmp    ax,WORD PTR [r15]
0x14070f7f5: jne    0x14070fb65
0x14070f7fb: mov    rax,QWORD PTR [rsp+0x58]
0x14070f800: cmp    DWORD PTR [rax+rbx*4],0x7d0
0x14070f807: jge    0x14070f822
0x14070f809: mov    eax,DWORD PTR [rbp+0x90]
0x14070f80f: test   ax,ax
0x14070f812: je     0x14070f822
0x14070f814: sub    ax,0x3
0x14070f818: cmp    ax,0x1
0x14070f81c: ja     0x14070fb65
0x14070f822: movsx  edx,BYTE PTR [rbx+rsi*1]
0x14070f826: mov    ecx,edx
0x14070f828: test   dl,dl
0x14070f82a: je     0x14070fce7
0x14070f830: sub    ecx,0x1
0x14070f833: je     0x14070f83e
0x14070f835: cmp    ecx,0x1
0x14070f838: jne    0x14070fb65
0x14070f83e: cmp    BYTE PTR [rsi+r8*1],0x1
0x14070f843: jne    0x14070f9e8
0x14070f849: mov    rcx,QWORD PTR [r12+0x8]
0x14070f84e: movsxd rax,DWORD PTR [rdi+r8*4]
0x14070f852: mov    r13,QWORD PTR [rcx+0x1620]
0x14070f859: mov    r14,QWORD PTR [r13+rax*8+0x0]
0x14070f85e: cmp    dl,0x1
0x14070f861: jne    0x14070f90f
0x14070f867: mov    rax,QWORD PTR [r15+0x10]
0x14070f86b: sub    rax,QWORD PTR [r15+0x8]
0x14070f86f: sar    rax,0x2
0x14070f873: cmp    rax,0x3
0x14070f877: jae    0x14070fb60
0x14070f87d: movsxd rax,DWORD PTR [rdi+rbx*4]
0x14070f881: mov    r13,QWORD PTR [r13+rax*8+0x0]
0x14070f886: lea    rdx,[r13+0x80]
0x14070f88d: lea    rcx,[r14+0x80]
0x14070f894: call   0x140725940
0x14070f899: test   al,al
0x14070f89b: je     0x14070f90a
0x14070f89d: lea    rdx,[r13+0x98]
0x14070f8a4: lea    rcx,[r14+0x98]
0x14070f8ab: call   0x140725940
0x14070f8b0: test   al,al
0x14070f8b2: je     0x14070f90a
0x14070f8b4: lea    rdx,[r13+0x58]
0x14070f8b8: lea    rcx,[r14+0x58]
0x14070f8bc: call   0x14006fe40
0x14070f8c1: test   al,al
0x14070f8c3: je     0x14070f90a
0x14070f8c5: movzx  eax,WORD PTR [r13+0x78]
0x14070f8ca: cmp    WORD PTR [r14+0x78],ax
0x14070f8cf: jne    0x14070f90a
0x14070f8d1: mov    r13,QWORD PTR [rsp+0x40]
0x14070f8d6: lea    rdx,[rdi+r13*4]
0x14070f8da: lea    rcx,[r15+0x8]
0x14070f8de: call   0x14006f410
0x14070f8e3: lea    rcx,[r15+0x20]
0x14070f8e7: mov    rax,QWORD PTR [rsp+0x58]
0x14070f8ec: lea    rdx,[rax+r13*4]
0x14070f8f0: call   0x14006f410
0x14070f8f5: mov    rax,QWORD PTR [rsp+0x58]
0x14070f8fa: mov    DWORD PTR [rax+rbx*4],0xffffffff
0x14070f901: mov    rsi,QWORD PTR [rsp+0x78]
0x14070f906: mov    rdi,QWORD PTR [rbp-0x70]
0x14070f90a: mov    r8,QWORD PTR [rsp+0x30]
0x14070f90f: cmp    BYTE PTR [rbx+rsi*1],0x2
0x14070f913: jne    0x14070f9e3
0x14070f919: mov    rax,QWORD PTR [r12+0x8]
0x14070f91e: movsxd rcx,DWORD PTR [rdi+rbx*4]
0x14070f922: mov    rax,QWORD PTR [rax+0x16c8]
0x14070f929: mov    r13,QWORD PTR [rax+rcx*8]
0x14070f92d: lea    rcx,[r14+0x80]
0x14070f934: lea    rdx,[r13+0x30]
0x14070f938: call   0x140725940
0x14070f93d: test   al,al
0x14070f93f: je     0x14070f9de
0x14070f945: lea    rdx,[r13+0x48]
0x14070f949: lea    rcx,[r14+0x98]
0x14070f950: call   0x140725940
0x14070f955: test   al,al
0x14070f957: jne    0x14070f982
0x14070f959: mov    rdx,QWORD PTR [r12+0x48]
0x14070f95e: mov    rax,QWORD PTR [r14+0x80]
0x14070f965: movsx  rcx,WORD PTR [rax]
0x14070f969: mov    rax,QWORD PTR [rdx]
0x14070f96c: mov    rdx,QWORD PTR [rax+rcx*8]
0x14070f970: mov    rax,QWORD PTR [rdx+0x60]
0x14070f974: sub    rax,QWORD PTR [rdx+0x58]
0x14070f978: and    rax,0xfffffffffffffff8
0x14070f97c: cmp    rax,0x8
0x14070f980: jne    0x14070f9de
0x14070f982: lea    rdx,[r13+0x70]
0x14070f986: lea    rcx,[r14+0x58]
0x14070f98a: call   0x14006fe40
0x14070f98f: test   al,al
0x14070f991: je     0x14070f9de
0x14070f993: movzx  eax,WORD PTR [r13+0x90]
0x14070f99b: cmp    WORD PTR [r14+0x78],ax
0x14070f9a0: jne    0x14070f9de
0x14070f9a2: lea    rcx,[r15+0x68]
0x14070f9a6: mov    rsi,QWORD PTR [rsp+0x40]
0x14070f9ab: lea    rdx,[rdi+rsi*4]
0x14070f9af: call   0x14006f410
0x14070f9b4: lea    rcx,[r15+0x80]
0x14070f9bb: mov    rax,QWORD PTR [rsp+0x58]
0x14070f9c0: lea    rdx,[rax+rsi*4]
0x14070f9c4: call   0x14006f410
0x14070f9c9: mov    rax,QWORD PTR [rsp+0x58]
0x14070f9ce: mov    DWORD PTR [rax+rbx*4],0xffffffff
0x14070f9d5: mov    rsi,QWORD PTR [rsp+0x78]
0x14070f9da: mov    rdi,QWORD PTR [rbp-0x70]
0x14070f9de: mov    r8,QWORD PTR [rsp+0x30]
0x14070f9e3: mov    r14,QWORD PTR [rsp+0x38]
0x14070f9e8: cmp    BYTE PTR [rsi+r8*1],0x2
0x14070f9ed: jne    0x14070fb65
0x14070f9f3: mov    rdx,QWORD PTR [r12+0x8]
0x14070f9f8: movsxd rcx,DWORD PTR [rdi+r8*4]
0x14070f9fc: mov    rax,QWORD PTR [rdx+0x16c8]
0x14070fa03: mov    r14,QWORD PTR [rax+rcx*8]
0x14070fa07: cmp    BYTE PTR [rbx+rsi*1],0x1
0x14070fa0b: jne    0x14070fabc
0x14070fa11: mov    rax,QWORD PTR [r15+0x10]
0x14070fa15: sub    rax,QWORD PTR [r15+0x8]
0x14070fa19: sar    rax,0x2
0x14070fa1d: cmp    rax,0x3
0x14070fa21: jae    0x14070fb60
0x14070fa27: movsxd rcx,DWORD PTR [rdi+rbx*4]
0x14070fa2b: mov    rax,QWORD PTR [rdx+0x1620]
0x14070fa32: mov    r13,QWORD PTR [rax+rcx*8]
0x14070fa36: lea    rdx,[r13+0x80]
0x14070fa3d: lea    rcx,[r14+0x30]
0x14070fa41: call   0x140725940
0x14070fa46: test   al,al
0x14070fa48: je     0x14070fab7
0x14070fa4a: lea    rdx,[r13+0x98]
0x14070fa51: lea    rcx,[r14+0x48]
0x14070fa55: call   0x140725940
0x14070fa5a: test   al,al
0x14070fa5c: je     0x14070fab7
0x14070fa5e: lea    rdx,[r13+0x58]
0x14070fa62: lea    rcx,[r14+0x70]
0x14070fa66: call   0x14006fe40
0x14070fa6b: test   al,al
0x14070fa6d: je     0x14070fab7
0x14070fa6f: movzx  eax,WORD PTR [r13+0x78]
0x14070fa74: cmp    WORD PTR [r14+0x90],ax
0x14070fa7c: jne    0x14070fab7
0x14070fa7e: mov    rsi,QWORD PTR [rsp+0x40]
0x14070fa83: lea    rdx,[rdi+rsi*4]
0x14070fa87: lea    rcx,[r15+0x8]
0x14070fa8b: call   0x14006f410
0x14070fa90: lea    rcx,[r15+0x20]
0x14070fa94: mov    rax,QWORD PTR [rsp+0x58]
0x14070fa99: lea    rdx,[rax+rsi*4]
0x14070fa9d: call   0x14006f410
0x14070faa2: mov    rax,QWORD PTR [rsp+0x58]
0x14070faa7: mov    DWORD PTR [rax+rbx*4],0xffffffff
0x14070faae: mov    rsi,QWORD PTR [rsp+0x78]
0x14070fab3: mov    rdi,QWORD PTR [rbp-0x70]
0x14070fab7: mov    r8,QWORD PTR [rsp+0x30]
0x14070fabc: cmp    BYTE PTR [rbx+rsi*1],0x2
0x14070fac0: jne    0x14070fb60
0x14070fac6: mov    rax,QWORD PTR [r12+0x8]
0x14070facb: movsxd rcx,DWORD PTR [rdi+rbx*4]
0x14070facf: mov    rax,QWORD PTR [rax+0x16c8]
0x14070fad6: mov    r13,QWORD PTR [rax+rcx*8]
0x14070fada: lea    rdx,[r13+0x30]
0x14070fade: lea    rcx,[r14+0x30]
0x14070fae2: call   0x140725940
0x14070fae7: test   al,al
0x14070fae9: je     0x14070fb5b
0x14070faeb: lea    rdx,[r13+0x48]
0x14070faef: lea    rcx,[r14+0x48]
0x14070faf3: call   0x140725940
0x14070faf8: test   al,al
0x14070fafa: je     0x14070fb5b
0x14070fafc: lea    rdx,[r13+0x70]
0x14070fb00: lea    rcx,[r14+0x70]
0x14070fb04: call   0x14006fe40
0x14070fb09: test   al,al
0x14070fb0b: je     0x14070fb5b
0x14070fb0d: movzx  eax,WORD PTR [r13+0x90]
0x14070fb15: cmp    WORD PTR [r14+0x90],ax
0x14070fb1d: jne    0x14070fb5b
0x14070fb1f: lea    rcx,[r15+0x68]
0x14070fb23: mov    rsi,QWORD PTR [rsp+0x40]
0x14070fb28: lea    rdx,[rdi+rsi*4]
0x14070fb2c: call   0x14006f410
0x14070fb31: lea    rcx,[r15+0x80]
0x14070fb38: mov    rax,QWORD PTR [rsp+0x58]
0x14070fb3d: lea    rdx,[rax+rsi*4]
0x14070fb41: call   0x14006f410
0x14070fb46: mov    rax,QWORD PTR [rsp+0x58]
0x14070fb4b: mov    DWORD PTR [rax+rbx*4],0xffffffff
0x14070fb52: mov    rsi,QWORD PTR [rsp+0x78]
0x14070fb57: mov    rdi,QWORD PTR [rbp-0x70]
0x14070fb5b: mov    r8,QWORD PTR [rsp+0x30]
0x14070fb60: mov    r14,QWORD PTR [rsp+0x38]
0x14070fb65: mov    eax,DWORD PTR [rbp+0xa0]
0x14070fb6b: inc    eax
0x14070fb6d: mov    DWORD PTR [rbp+0xa0],eax
0x14070fb73: inc    rbx
0x14070fb76: movsxd r13,eax
0x14070fb79: mov    QWORD PTR [rsp+0x40],r13
0x14070fb7e: add    r14,0x4
0x14070fb82: mov    QWORD PTR [rsp+0x38],r14
0x14070fb87: add    QWORD PTR [rsp+0x50],0x4
0x14070fb8d: mov    rax,QWORD PTR [rbp-0x80]
0x14070fb91: sub    rax,rsi
0x14070fb94: cmp    r13,rax
0x14070fb97: mov    rdx,QWORD PTR [rsp+0x50]
0x14070fb9c: jb     0x14070f710
0x14070fba2: mov    ebx,DWORD PTR [rbp+0xa8]
0x14070fba8: lea    r14,[rip+0xffffffffff8f0451]        # 0x140000000
0x14070fbaf: xor    r13d,r13d
0x14070fbb2: mov    r11d,0x2
0x14070fbb8: mov    r10d,0x1
0x14070fbbe: mov    r9d,0x4
0x14070fbc4: mov    r8d,0x3
0x14070fbca: inc    ebx
0x14070fbcc: mov    DWORD PTR [rbp+0xa8],ebx
0x14070fbd2: movsxd rdx,ebx
0x14070fbd5: mov    QWORD PTR [rsp+0x30],rdx
0x14070fbda: mov    rax,QWORD PTR [rbp-0x80]
0x14070fbde: sub    rax,rsi
0x14070fbe1: cmp    rdx,rax
0x14070fbe4: jb     0x14070f5b0
0x14070fbea: xorps  xmm0,xmm0
0x14070fbed: movdqu XMMWORD PTR [rbp-0x10],xmm0
0x14070fbf2: mov    QWORD PTR [rbp+0x0],r13
0x14070fbf6: mov    rax,QWORD PTR [r12+0x48]
0x14070fbfb: mov    rdx,QWORD PTR [rax+0x8]
0x14070fbff: sub    rdx,QWORD PTR [rax]
0x14070fc02: sar    rdx,0x3
0x14070fc06: test   rdx,rdx
0x14070fc09: je     0x14070fc14
0x14070fc0b: lea    rcx,[rbp-0x10]
0x14070fc0f: call   0x140070d30
0x14070fc14: mov    r14,QWORD PTR [rbp-0x8]
0x14070fc18: mov    rcx,QWORD PTR [rbp-0x10]
0x14070fc1c: sub    r14,rcx
0x14070fc1f: sar    r14,0x2
0x14070fc23: sub    r14d,0x1
0x14070fc27: js     0x14070fd5a
0x14070fc2d: movsxd rax,r14d
0x14070fc30: lea    rbx,[rax*8+0x0]
0x14070fc38: lea    rsi,[rcx+rax*4]
0x14070fc3c: mov    r15,rcx
0x14070fc3f: neg    r15
0x14070fc42: mov    DWORD PTR [rsi],0xffffffff
0x14070fc48: mov    rcx,QWORD PTR [r12+0x50]
0x14070fc4d: add    rcx,r15
0x14070fc50: test   BYTE PTR [rcx+rsi*1],0x2
0x14070fc54: jne    0x14070fd48
0x14070fc5a: mov    rax,QWORD PTR [r12+0x48]
0x14070fc5f: mov    rdi,QWORD PTR [rax]
0x14070fc62: mov    rcx,QWORD PTR [rdi+rbx*1]
0x14070fc66: cmp    DWORD PTR [rcx+0x50],0x0
0x14070fc6a: jle    0x14070fc79
0x14070fc6c: mov    rax,QWORD PTR [rcx+0x48]
0x14070fc70: test   BYTE PTR [rax],0x20
0x14070fc73: jne    0x14070fd48
0x14070fc79: mov    r9d,r13d
0x14070fc7c: mov    rax,QWORD PTR [rcx+0x60]
0x14070fc80: sub    rax,QWORD PTR [rcx+0x58]
0x14070fc84: sar    rax,0x3
0x14070fc88: test   rax,rax
0x14070fc8b: je     0x14070fd48
0x14070fc91: lea    r10,[rcx+0x58]
0x14070fc95: mov    r11,r10
0x14070fc98: mov    r8,r13
0x14070fc9b: nop    DWORD PTR [rax+rax*1+0x0]
0x14070fca0: mov    rax,QWORD PTR [r10]
0x14070fca3: mov    rcx,QWORD PTR [r8+rax*1]
0x14070fca7: cmp    DWORD PTR [rcx+0x70],0xffffffff
0x14070fcab: jne    0x14070fccb
0x14070fcad: mov    r10,QWORD PTR [rdi+rbx*1]
0x14070fcb1: add    r10,0x58
0x14070fcb5: mov    rax,QWORD PTR [r10]
0x14070fcb8: mov    rcx,QWORD PTR [rax+r8*1]
0x14070fcbc: movsxd rdx,DWORD PTR [rcx+0x68]
0x14070fcc0: mov    rax,QWORD PTR [r12+0x68]
0x14070fcc5: test   BYTE PTR [rax+rdx*4],0x1
0x14070fcc9: je     0x14070fd45
0x14070fccb: inc    r9d
0x14070fcce: add    r8,0x8
0x14070fcd2: mov    rcx,QWORD PTR [r11+0x8]
0x14070fcd6: sub    rcx,QWORD PTR [r11]
0x14070fcd9: sar    rcx,0x3
0x14070fcdd: movsxd rax,r9d
0x14070fce0: cmp    rax,rcx
0x14070fce3: jb     0x14070fca0
0x14070fce5: jmp    0x14070fd48
0x14070fce7: cmp    BYTE PTR [rsi+r8*1],0x0
0x14070fcec: jne    0x14070fb65
0x14070fcf2: lea    rcx,[r15+0x38]
0x14070fcf6: mov    rax,QWORD PTR [rcx+0x8]
0x14070fcfa: sub    rax,QWORD PTR [rcx]
0x14070fcfd: sar    rax,0x2
0x14070fd01: cmp    rax,0x3
0x14070fd05: jae    0x14070fb65
0x14070fd0b: lea    rdx,[rdi+r13*4]
0x14070fd0f: call   0x14006f410
0x14070fd14: lea    rcx,[r15+0x50]
0x14070fd18: mov    rax,QWORD PTR [rsp+0x58]
0x14070fd1d: lea    rdx,[rax+r13*4]
0x14070fd21: call   0x14006f410
0x14070fd26: mov    rax,QWORD PTR [rsp+0x58]
0x14070fd2b: mov    DWORD PTR [rax+rbx*4],0xffffffff
0x14070fd32: mov    rsi,QWORD PTR [rsp+0x78]
0x14070fd37: mov    rdi,QWORD PTR [rbp-0x70]
0x14070fd3b: mov    r8,QWORD PTR [rsp+0x30]
0x14070fd40: jmp    0x14070fb65
0x14070fd45: mov    DWORD PTR [rsi],r9d
0x14070fd48: sub    rbx,0x8
0x14070fd4c: sub    rsi,0x4
0x14070fd50: sub    r14d,0x1
0x14070fd54: jns    0x14070fc42
0x14070fd5a: xorps  xmm0,xmm0
0x14070fd5d: movdqu XMMWORD PTR [rbp-0x28],xmm0
0x14070fd62: xor    r14d,r14d
0x14070fd65: mov    QWORD PTR [rbp-0x18],r14
0x14070fd69: mov    rdx,QWORD PTR [r12+0x88]
0x14070fd71: sub    rdx,QWORD PTR [r12+0x80]
0x14070fd79: sar    rdx,1
0x14070fd7c: je     0x14070fd87
0x14070fd7e: lea    rcx,[rbp-0x28]
0x14070fd82: call   0x1401ba240
0x14070fd87: mov    rdx,QWORD PTR [rbp-0x20]
0x14070fd8b: mov    rsi,QWORD PTR [rbp-0x28]
0x14070fd8f: sub    rdx,rsi
0x14070fd92: je     0x14070fdae
0x14070fd94: mov    rcx,r14
0x14070fd97: mov    eax,r14d
0x14070fd9a: nop    WORD PTR [rax+rax*1+0x0]
0x14070fda0: mov    BYTE PTR [rsi+rcx*1],0x0
0x14070fda4: inc    eax
0x14070fda6: movsxd rcx,eax
0x14070fda9: cmp    rcx,rdx
0x14070fdac: jb     0x14070fda0
0x14070fdae: xorps  xmm0,xmm0
0x14070fdb1: movdqu XMMWORD PTR [rbp-0x58],xmm0
0x14070fdb6: mov    QWORD PTR [rbp-0x48],r14
0x14070fdba: movdqu XMMWORD PTR [rbp+0x20],xmm0
0x14070fdbf: mov    QWORD PTR [rbp+0x30],r14
0x14070fdc3: movdqu XMMWORD PTR [rbp+0x8],xmm0
0x14070fdc8: mov    QWORD PTR [rbp+0x18],r14
0x14070fdcc: movdqu XMMWORD PTR [rbp-0x40],xmm0
0x14070fdd1: mov    QWORD PTR [rbp-0x30],r14
0x14070fdd5: mov    rax,QWORD PTR [r12+0x8]
0x14070fdda: mov    rdx,QWORD PTR [rax+0x6c8]
0x14070fde1: sub    rdx,QWORD PTR [rax+0x6c0]
0x14070fde8: sar    rdx,0x3
0x14070fdec: test   rdx,rdx
0x14070fdef: je     0x14070fdfa
0x14070fdf1: lea    rcx,[rbp-0x58]
0x14070fdf5: call   0x1401ba240
0x14070fdfa: mov    rbx,QWORD PTR [rbp-0x50]
0x14070fdfe: mov    rdx,rbx
0x14070fe01: mov    rdi,QWORD PTR [rbp-0x58]
0x14070fe05: sub    rdx,rdi
0x14070fe08: je     0x14070fe1e
0x14070fe0a: mov    rcx,r14
0x14070fe0d: mov    eax,r14d
0x14070fe10: mov    BYTE PTR [rdi+rcx*1],0x0
0x14070fe14: inc    eax
0x14070fe16: movsxd rcx,eax
0x14070fe19: cmp    rcx,rdx
0x14070fe1c: jb     0x14070fe10
0x14070fe1e: mov    rax,QWORD PTR [r12+0x8]
0x14070fe23: mov    rdx,QWORD PTR [rax+0x730]
0x14070fe2a: sub    rdx,QWORD PTR [rax+0x728]
0x14070fe31: sar    rdx,1
0x14070fe34: je     0x14070fe3f
0x14070fe36: lea    rcx,[rbp+0x20]
0x14070fe3a: call   0x1401ba240
0x14070fe3f: mov    rax,QWORD PTR [r12+0x8]
0x14070fe44: mov    rdx,QWORD PTR [rax+0x730]
0x14070fe4b: sub    rdx,QWORD PTR [rax+0x728]
0x14070fe52: sar    rdx,1
0x14070fe55: je     0x14070fe60
0x14070fe57: lea    rcx,[rbp+0x8]
0x14070fe5b: call   0x1401ba240
0x14070fe60: mov    rax,QWORD PTR [r12+0x8]
0x14070fe65: mov    rdx,QWORD PTR [rax+0x730]
0x14070fe6c: sub    rdx,QWORD PTR [rax+0x728]
0x14070fe73: sar    rdx,1
0x14070fe76: je     0x14070fe81
0x14070fe78: lea    rcx,[rbp-0x40]
0x14070fe7c: call   0x1401ba240
0x14070fe81: cmp    rbx,rdi
0x14070fe84: je     0x14070feb7
0x14070fe86: mov    rax,r14
0x14070fe89: sub    rbx,rdi
0x14070fe8c: mov    ecx,r14d
0x14070fe8f: mov    rdx,QWORD PTR [rbp+0x8]
0x14070fe93: mov    rdi,QWORD PTR [rbp-0x40]
0x14070fe97: mov    r8,QWORD PTR [rbp+0x20]
0x14070fe9b: nop    DWORD PTR [rax+rax*1+0x0]
0x14070fea0: mov    BYTE PTR [r8+rax*1],0x0
0x14070fea5: mov    BYTE PTR [rdx+rax*1],0x0
0x14070fea9: mov    BYTE PTR [rdi+rax*1],0x0
0x14070fead: inc    ecx
0x14070feaf: movsxd rax,ecx
0x14070feb2: cmp    rax,rbx
0x14070feb5: jb     0x14070fea0
0x14070feb7: mov    edx,r14d
0x14070feba: mov    DWORD PTR [rbp+0xa0],edx
0x14070fec0: lea    r13,[r12+0x148]
0x14070fec8: mov    r8,QWORD PTR [r13+0x0]
0x14070fecc: mov    rax,QWORD PTR [r13+0x8]
0x14070fed0: sub    rax,r8
0x14070fed3: sar    rax,0x3
0x14070fed7: test   rax,rax
0x14070feda: je     0x140710b0c
0x14070fee0: mov    r15,r14
0x14070fee3: mov    QWORD PTR [rsp+0x50],r14
0x14070fee8: nop    DWORD PTR [rax+rax*1+0x0]
0x14070fef0: mov    rax,QWORD PTR [r8+r15*8]
0x14070fef4: mov    rcx,QWORD PTR [rax+0x10]
0x14070fef8: sub    rcx,QWORD PTR [rax+0x8]
0x14070fefc: sar    rcx,0x2
0x14070ff00: test   rcx,rcx
0x14070ff03: je     0x140710538
0x14070ff09: mov    edi,r14d
0x14070ff0c: mov    DWORD PTR [rsp+0x38],r14d
0x14070ff11: mov    r9,r14
0x14070ff14: mov    QWORD PTR [rsp+0x70],r14
0x14070ff19: nop    DWORD PTR [rax+0x0]
0x14070ff20: xor    r10b,r10b
0x14070ff23: mov    DWORD PTR [rbp+0xa8],r10d
0x14070ff2a: mov    rdx,QWORD PTR [r12+0x8]
0x14070ff2f: mov    rax,QWORD PTR [r8+r15*8]
0x14070ff33: mov    rax,QWORD PTR [rax+0x8]
0x14070ff37: movsxd rcx,DWORD PTR [r9+rax*1]
0x14070ff3b: mov    rax,QWORD PTR [rdx+0x1620]
0x14070ff42: mov    r8,QWORD PTR [rax+rcx*8]
0x14070ff46: mov    QWORD PTR [rsp+0x40],r8
0x14070ff4b: mov    ebx,r14d
0x14070ff4e: mov    DWORD PTR [rbp+0x98],ebx
0x14070ff54: mov    rdx,QWORD PTR [r8+0x80]
0x14070ff5b: mov    rax,QWORD PTR [r8+0x88]
0x14070ff62: sub    rax,rdx
0x14070ff65: sar    rax,1
0x14070ff68: je     0x1407104cb
0x14070ff6e: mov    r11,r14
0x14070ff71: mov    QWORD PTR [rsp+0x48],r14
0x14070ff76: jmp    0x14070ff87
0x14070ff78: nop    DWORD PTR [rax+rax*1+0x0]
0x14070ff80: mov    r10d,DWORD PTR [rbp+0xa8]
0x14070ff87: movsx  r9,WORD PTR [rdx+r11*1]
0x14070ff8c: mov    WORD PTR [rbp+0x90],r9w
0x14070ff94: mov    rax,QWORD PTR [r8+0x98]
0x14070ff9b: movsx  r14,WORD PTR [r11+rax*1]
0x14070ffa0: cmp    r14w,0xffff
0x14070ffa5: je     0x140710118
0x14070ffab: mov    rax,QWORD PTR [r12+0x48]
0x14070ffb0: mov    rax,QWORD PTR [rax]
0x14070ffb3: mov    rax,QWORD PTR [rax+r9*8]
0x14070ffb7: mov    rax,QWORD PTR [rax+0x58]
0x14070ffbb: mov    rcx,QWORD PTR [rax+r14*8]
0x14070ffbf: movsxd rbx,DWORD PTR [rcx+0x80]
0x14070ffc6: mov    DWORD PTR [rsp+0x30],ebx
0x14070ffca: cmp    ebx,0xffffffff
0x14070ffcd: je     0x140710112
0x14070ffd3: mov    rax,QWORD PTR [r12+0x80]
0x14070ffdb: cmp    WORD PTR [rax+rbx*2],0xffff
0x14070ffe0: je     0x140710112
0x14070ffe6: mov    rax,QWORD PTR [r12+0x98]
0x14070ffee: cmp    DWORD PTR [rax+rbx*4],0xffffffff
0x14070fff2: je     0x140710112
0x14070fff8: mov    rax,QWORD PTR [r12+0xb0]
0x140710000: cmp    DWORD PTR [rax+rbx*4],0xffffffff
0x140710004: je     0x140710112
0x14071000a: mov    rax,QWORD PTR [r12+0xc8]
0x140710012: cmp    DWORD PTR [rax+rbx*4],0xffffffff
0x140710016: je     0x140710112
0x14071001c: cmp    WORD PTR [r8],0x2
0x140710021: jne    0x14071002c
0x140710023: mov    BYTE PTR [rbp+0xa8],0x1
0x14071002a: jmp    0x14071005e
0x14071002c: mov    rax,QWORD PTR [r12+0x8]
0x140710031: mov    rax,QWORD PTR [rax+0x16b0]
0x140710038: movsxd rdx,DWORD PTR [rax+rbx*4]
0x14071003c: cmp    edx,0xffffffff
0x14071003f: je     0x14071005e
0x140710041: mov    rax,QWORD PTR [r12+0x30]
0x140710046: movzx  r10d,r10b
0x14071004a: cmp    DWORD PTR [rax+rdx*4],0x5
0x14071004e: mov    eax,0x1
0x140710053: cmovl  r10d,eax
0x140710057: mov    DWORD PTR [rbp+0xa8],r10d
0x14071005e: cmp    BYTE PTR [rbx+rsi*1],0x0
0x140710062: jne    0x14071010e
0x140710068: mov    rax,QWORD PTR [r13+0x0]
0x14071006c: mov    rcx,QWORD PTR [rax+r15*8]
0x140710070: add    rcx,0x98
0x140710077: mov    rdx,QWORD PTR [rcx+0x8]
0x14071007b: cmp    rdx,QWORD PTR [rcx+0x10]
0x14071007f: je     0x14071008a
0x140710081: mov    DWORD PTR [rdx],ebx
0x140710083: add    QWORD PTR [rcx+0x8],0x4
0x140710088: jmp    0x140710099
0x14071008a: lea    r8,[rsp+0x30]
0x14071008f: call   0x140070e20
0x140710094: mov    r11,QWORD PTR [rsp+0x48]
0x140710099: mov    r8,QWORD PTR [r12+0x98]
0x1407100a1: mov    rax,QWORD PTR [r12+0xa0]
0x1407100a9: sub    rax,r8
0x1407100ac: sar    rax,0x2
0x1407100b0: sub    eax,0x1
0x1407100b3: movsxd r9,eax
0x1407100b6: js     0x140710101
0x1407100b8: lea    r10,[rbx*4+0x0]
0x1407100c0: mov    eax,DWORD PTR [r10+r8*1]
0x1407100c4: cmp    DWORD PTR [r8+r9*4],eax
0x1407100c8: jne    0x1407100fb
0x1407100ca: mov    rcx,QWORD PTR [r12+0xb0]
0x1407100d2: mov    eax,DWORD PTR [r10+rcx*1]
0x1407100d6: cmp    DWORD PTR [rcx+r9*4],eax
0x1407100da: jne    0x1407100fb
0x1407100dc: mov    rcx,QWORD PTR [r12+0xc8]
0x1407100e4: mov    eax,DWORD PTR [r10+rcx*1]
0x1407100e8: cmp    DWORD PTR [rcx+r9*4],eax
0x1407100ec: jne    0x1407100fb
0x1407100ee: mov    BYTE PTR [r9+rsi*1],0x1
0x1407100f3: mov    r8,QWORD PTR [r12+0x98]
0x1407100fb: sub    r9,0x1
0x1407100ff: jns    0x1407100c0
0x140710101: mov    r8,QWORD PTR [rsp+0x40]
0x140710106: movzx  r9d,WORD PTR [rbp+0x90]
0x14071010e: mov    BYTE PTR [rbx+rsi*1],0x1
0x140710112: mov    ebx,DWORD PTR [rbp+0x98]
0x140710118: mov    rax,QWORD PTR [r12+0x148]
0x140710120: mov    rdx,QWORD PTR [rax+r15*8]
0x140710124: cmp    WORD PTR [rdx],0x2
0x140710128: jne    0x14071043e
0x14071012e: movsx  rcx,r9w
0x140710132: mov    rbx,QWORD PTR [rbp-0x58]
0x140710136: add    rbx,rcx
0x140710139: cmp    BYTE PTR [rbx],0x0
0x14071013c: jne    0x14071029a
0x140710142: mov    rax,QWORD PTR [r12+0x50]
0x140710147: test   BYTE PTR [rax+rcx*4],0x2
0x14071014b: je     0x1407101c0
0x14071014d: lea    rcx,[rdx+0xb0]
0x140710154: movsx  eax,r9w
0x140710158: mov    DWORD PTR [rsp+0x30],eax
0x14071015c: mov    rdx,QWORD PTR [rcx+0x8]
0x140710160: cmp    rdx,QWORD PTR [rcx+0x10]
0x140710164: je     0x14071016f
0x140710166: mov    DWORD PTR [rdx],eax
0x140710168: add    QWORD PTR [rcx+0x8],0x4
0x14071016d: jmp    0x140710179
0x14071016f: lea    r8,[rsp+0x30]
0x140710174: call   0x140070e20
0x140710179: mov    rax,QWORD PTR [r12+0x148]
0x140710181: mov    rcx,QWORD PTR [rax+r15*8]
0x140710185: add    rcx,0xc8
0x14071018c: mov    eax,0xffffffff
0x140710191: mov    DWORD PTR [rsp+0x30],eax
0x140710195: mov    rdx,QWORD PTR [rcx+0x8]
0x140710199: cmp    rdx,QWORD PTR [rcx+0x10]
0x14071019d: je     0x1407101ae
0x14071019f: mov    DWORD PTR [rdx],eax
0x1407101a1: add    QWORD PTR [rcx+0x8],0x4
0x1407101a6: mov    BYTE PTR [rbx],0x1
0x1407101a9: jmp    0x140710292
0x1407101ae: lea    r8,[rsp+0x30]
0x1407101b3: call   0x140070e20
0x1407101b8: mov    BYTE PTR [rbx],0x1
0x1407101bb: jmp    0x140710292
0x1407101c0: cmp    r14w,0xffff
0x1407101c5: je     0x14071029a
0x1407101cb: mov    rax,QWORD PTR [r12+0x48]
0x1407101d0: lea    rbx,[rcx*8+0x0]
0x1407101d8: mov    rax,QWORD PTR [rax]
0x1407101db: mov    rcx,QWORD PTR [rbx+rax*1]
0x1407101df: lea    rdi,[r14*8+0x0]
0x1407101e7: mov    rax,QWORD PTR [rcx+0x58]
0x1407101eb: mov    rcx,QWORD PTR [rdi+rax*1]
0x1407101ef: movsxd r8,DWORD PTR [rcx+0x68]
0x1407101f3: mov    r13,QWORD PTR [rbp+0x20]
0x1407101f7: cmp    BYTE PTR [r8+r13*1],0x0
0x1407101fc: jne    0x14071029a
0x140710202: mov    rax,QWORD PTR [r12+0x68]
0x140710207: test   BYTE PTR [rax+r8*4],0x1
0x14071020c: je     0x14071029a
0x140710212: lea    rcx,[rdx+0xb0]
0x140710219: movsx  eax,r9w
0x14071021d: mov    DWORD PTR [rsp+0x30],eax
0x140710221: mov    rdx,QWORD PTR [rcx+0x8]
0x140710225: cmp    rdx,QWORD PTR [rcx+0x10]
0x140710229: je     0x140710234
0x14071022b: mov    DWORD PTR [rdx],eax
0x14071022d: add    QWORD PTR [rcx+0x8],0x4
0x140710232: jmp    0x14071023e
0x140710234: lea    r8,[rsp+0x30]
0x140710239: call   0x140070e20
0x14071023e: mov    rax,QWORD PTR [r12+0x148]
0x140710246: mov    rcx,QWORD PTR [rax+r15*8]
0x14071024a: add    rcx,0xc8
0x140710251: mov    eax,r14d
0x140710254: mov    DWORD PTR [rsp+0x30],eax
0x140710258: mov    rdx,QWORD PTR [rcx+0x8]
0x14071025c: cmp    rdx,QWORD PTR [rcx+0x10]
0x140710260: je     0x14071026b
0x140710262: mov    DWORD PTR [rdx],eax
0x140710264: add    QWORD PTR [rcx+0x8],0x4
0x140710269: jmp    0x140710275
0x14071026b: lea    r8,[rsp+0x30]
0x140710270: call   0x140070e20
0x140710275: mov    rax,QWORD PTR [r12+0x48]
0x14071027a: mov    rcx,QWORD PTR [rax]
0x14071027d: mov    rax,QWORD PTR [rbx+rcx*1]
0x140710281: mov    rax,QWORD PTR [rax+0x58]
0x140710285: mov    rcx,QWORD PTR [rax+rdi*1]
0x140710289: movsxd rax,DWORD PTR [rcx+0x68]
0x14071028d: mov    BYTE PTR [rax+r13*1],0x1
0x140710292: movzx  r9d,WORD PTR [rbp+0x90]
0x14071029a: mov    rcx,QWORD PTR [r12+0x110]
0x1407102a2: test   rcx,rcx
0x1407102a5: je     0x14071042e
0x1407102ab: mov    rax,QWORD PTR [rcx+0x8]
0x1407102af: sub    rax,QWORD PTR [rcx]
0x1407102b2: sar    rax,0x3
0x1407102b6: sub    eax,0x1
0x1407102b9: movsxd r13,eax
0x1407102bc: mov    QWORD PTR [rsp+0x30],r13
0x1407102c1: js     0x14071042e
0x1407102c7: movsx  r15,r9w
0x1407102cb: nop    DWORD PTR [rax+rax*1+0x0]
0x1407102d0: mov    rax,QWORD PTR [r12+0x110]
0x1407102d8: mov    rcx,QWORD PTR [rax]
0x1407102db: mov    rsi,QWORD PTR [rcx+r13*8]
0x1407102df: mov    rax,QWORD PTR [rsi+0x10]
0x1407102e3: sub    rax,QWORD PTR [rsi+0x8]
0x1407102e7: sar    rax,0x3
0x1407102eb: sub    eax,0x1
0x1407102ee: movsxd rdi,eax
0x1407102f1: js     0x140710416
0x1407102f7: mov    r13,QWORD PTR [rsp+0x50]
0x1407102fc: nop    DWORD PTR [rax+0x0]
0x140710300: mov    rax,QWORD PTR [rsi+0x8]
0x140710304: mov    rbx,QWORD PTR [rax+rdi*8]
0x140710308: cmp    WORD PTR [rbx+0x4],r9w
0x14071030d: jne    0x140710407
0x140710313: mov    r8d,DWORD PTR [rbx+0x64]
0x140710317: test   r8d,0x492000c
0x14071031e: je     0x140710407
0x140710324: cmp    WORD PTR [rbx+0x98],0x0
0x14071032c: jne    0x140710407
0x140710332: movsx  rdx,WORD PTR [rbx+0x6]
0x140710337: cmp    dx,r14w
0x14071033b: je     0x140710352
0x14071033d: cmp    r14w,0xffff
0x140710342: jne    0x140710407
0x140710348: cmp    dx,r14w
0x14071034c: je     0x140710407
0x140710352: mov    rax,QWORD PTR [rbp-0x10]
0x140710356: mov    ecx,DWORD PTR [rax+r15*4]
0x14071035a: cmp    edx,ecx
0x14071035c: je     0x14071037e
0x14071035e: cmp    ecx,0xffffffff
0x140710361: je     0x140710407
0x140710367: test   r8d,0x100008
0x14071036e: je     0x140710407
0x140710374: test   r8b,0x4
0x140710378: jne    0x140710407
0x14071037e: mov    rax,QWORD PTR [r12+0x48]
0x140710383: movsx  r8,WORD PTR [rbx+0x4]
0x140710388: mov    rax,QWORD PTR [rax]
0x14071038b: mov    rax,QWORD PTR [rax+r8*8]
0x14071038f: mov    rax,QWORD PTR [rax+0x58]
0x140710393: mov    rcx,QWORD PTR [rax+rdx*8]
0x140710397: movsxd rdx,DWORD PTR [rcx+0x68]
0x14071039b: mov    rax,QWORD PTR [rbp+0x8]
0x14071039f: cmp    BYTE PTR [rdx+rax*1],0x0
0x1407103a3: jne    0x140710407
0x1407103a5: mov    rax,QWORD PTR [r12+0x68]
0x1407103aa: test   BYTE PTR [rax+rdx*4],0x1
0x1407103ae: jne    0x140710407
0x1407103b0: mov    rax,QWORD PTR [r12+0x148]
0x1407103b8: mov    rcx,QWORD PTR [rax+r13*8]
0x1407103bc: movsx  eax,WORD PTR [rbx+0x60]
0x1407103c0: movsx  r9d,WORD PTR [rbx+0xc]
0x1407103c5: mov    edx,r8d
0x1407103c8: mov    DWORD PTR [rsp+0x20],eax
0x1407103cc: mov    r8d,DWORD PTR [rbx+0x64]
0x1407103d0: call   0x1406ba400
0x1407103d5: mov    rax,QWORD PTR [r12+0x48]
0x1407103da: movsx  rcx,WORD PTR [rbx+0x4]
0x1407103df: mov    rax,QWORD PTR [rax]
0x1407103e2: mov    rax,QWORD PTR [rax+rcx*8]
0x1407103e6: movsx  rcx,WORD PTR [rbx+0x6]
0x1407103eb: mov    rax,QWORD PTR [rax+0x58]
0x1407103ef: mov    rcx,QWORD PTR [rax+rcx*8]
0x1407103f3: movsxd rax,DWORD PTR [rcx+0x68]
0x1407103f7: mov    rcx,QWORD PTR [rbp-0x40]
0x1407103fb: mov    BYTE PTR [rcx+rax*1],0x1
0x1407103ff: movzx  r9d,WORD PTR [rbp+0x90]
0x140710407: sub    rdi,0x1
0x14071040b: jns    0x140710300
0x140710411: mov    r13,QWORD PTR [rsp+0x30]
0x140710416: sub    r13,0x1
0x14071041a: mov    QWORD PTR [rsp+0x30],r13
0x14071041f: jns    0x1407102d0
0x140710425: mov    r15,QWORD PTR [rsp+0x50]
0x14071042a: mov    rsi,QWORD PTR [rbp-0x28]
0x14071042e: mov    r8,QWORD PTR [rsp+0x40]
0x140710433: mov    r11,QWORD PTR [rsp+0x48]
0x140710438: mov    ebx,DWORD PTR [rbp+0x98]
0x14071043e: inc    ebx
0x140710440: mov    DWORD PTR [rbp+0x98],ebx
0x140710446: add    r11,0x2
0x14071044a: mov    QWORD PTR [rsp+0x48],r11
0x14071044f: mov    rdx,QWORD PTR [r8+0x80]
0x140710456: mov    rcx,QWORD PTR [r8+0x88]
0x14071045d: sub    rcx,rdx
0x140710460: sar    rcx,1
0x140710463: movsxd rax,ebx
0x140710466: cmp    rax,rcx
0x140710469: lea    r13,[r12+0x148]
0x140710471: jb     0x14070ff80
0x140710477: lea    r13,[r12+0x148]
0x14071047f: cmp    BYTE PTR [rbp+0xa8],0x0
0x140710486: je     0x1407104bf
0x140710488: mov    rax,QWORD PTR [r13+0x0]
0x14071048c: mov    rbx,QWORD PTR [rax+r15*8]
0x140710490: mov    rax,QWORD PTR [rbx+0x8]
0x140710494: movsxd rdi,DWORD PTR [rsp+0x38]
0x140710499: lea    rcx,[rax+rdi*4]
0x14071049d: mov    r8,QWORD PTR [rbx+0x10]
0x1407104a1: lea    rdx,[rcx+0x4]
0x1407104a5: sub    r8,rdx
0x1407104a8: call   0x14153ae1a
0x1407104ad: add    QWORD PTR [rbx+0x10],0xfffffffffffffffc
0x1407104b2: dec    edi
0x1407104b4: mov    r9,QWORD PTR [rsp+0x70]
0x1407104b9: sub    r9,0x4
0x1407104bd: jmp    0x1407104c8
0x1407104bf: mov    edi,DWORD PTR [rsp+0x38]
0x1407104c3: mov    r9,QWORD PTR [rsp+0x70]
0x1407104c8: xor    r14d,r14d
0x1407104cb: inc    edi
0x1407104cd: mov    DWORD PTR [rsp+0x38],edi
0x1407104d1: add    r9,0x4
0x1407104d5: mov    QWORD PTR [rsp+0x70],r9
0x1407104da: mov    r8,QWORD PTR [r13+0x0]
0x1407104de: mov    rax,QWORD PTR [r8+r15*8]
0x1407104e2: mov    rcx,QWORD PTR [rax+0x10]
0x1407104e6: sub    rcx,QWORD PTR [rax+0x8]
0x1407104ea: sar    rcx,0x2
0x1407104ee: movsxd rax,edi
0x1407104f1: cmp    rax,rcx
0x1407104f4: jb     0x14070ff20
0x1407104fa: mov    eax,DWORD PTR [rbp-0x38]
0x1407104fd: mov    rdi,QWORD PTR [rbp-0x40]
0x140710501: sub    eax,edi
0x140710503: sub    eax,0x1
0x140710506: movsxd rcx,eax
0x140710509: js     0x140710532
0x14071050b: mov    r8,QWORD PTR [rbp+0x8]
0x14071050f: lea    rax,[rcx+r8*1]
0x140710513: mov    rdx,rdi
0x140710516: sub    rdx,r8
0x140710519: nop    DWORD PTR [rax+0x0]
0x140710520: cmp    BYTE PTR [rax+rdx*1],0x0
0x140710524: je     0x140710529
0x140710526: mov    BYTE PTR [rax],0x1
0x140710529: dec    rax
0x14071052c: sub    rcx,0x1
0x140710530: jns    0x140710520
0x140710532: mov    edx,DWORD PTR [rbp+0xa0]
0x140710538: mov    r8,QWORD PTR [r13+0x0]
0x14071053c: mov    rax,QWORD PTR [r8+r15*8]
0x140710540: mov    rcx,QWORD PTR [rax+0x70]
0x140710544: sub    rcx,QWORD PTR [rax+0x68]
0x140710548: sar    rcx,0x2
0x14071054c: test   rcx,rcx
0x14071054f: je     0x140710ad8
0x140710555: mov    r9d,r14d
0x140710558: mov    DWORD PTR [rbp+0xa8],r14d
0x14071055f: mov    r10,r14
0x140710562: mov    QWORD PTR [rsp+0x40],r14
0x140710567: nop    WORD PTR [rax+rax*1+0x0]
0x140710570: mov    rdx,QWORD PTR [r12+0x8]
0x140710575: mov    rax,QWORD PTR [r8+r15*8]
0x140710579: mov    rax,QWORD PTR [rax+0x68]
0x14071057d: movsxd rcx,DWORD PTR [r10+rax*1]
0x140710581: mov    rax,QWORD PTR [rdx+0x16c8]
0x140710588: mov    r10,QWORD PTR [rax+rcx*8]
0x14071058c: mov    QWORD PTR [rsp+0x48],r10
0x140710591: mov    r11d,r14d
0x140710594: mov    DWORD PTR [rbp+0x98],r14d
0x14071059b: mov    rdx,QWORD PTR [r10+0x30]
0x14071059f: mov    rax,QWORD PTR [r10+0x38]
0x1407105a3: sub    rax,rdx
0x1407105a6: sar    rax,1
0x1407105a9: je     0x140710a67
0x1407105af: mov    r8,r14
0x1407105b2: mov    QWORD PTR [rsp+0x38],r14
0x1407105b7: nop    WORD PTR [rax+rax*1+0x0]
0x1407105c0: movsx  r9,WORD PTR [r8+rdx*1]
0x1407105c5: mov    WORD PTR [rbp+0x90],r9w
0x1407105cd: mov    rax,QWORD PTR [r10+0x48]
0x1407105d1: movsx  rsi,WORD PTR [r8+rax*1]
0x1407105d6: cmp    si,0xffff
0x1407105da: je     0x140710711
0x1407105e0: mov    rax,QWORD PTR [r12+0x48]
0x1407105e5: mov    rax,QWORD PTR [rax]
0x1407105e8: mov    rax,QWORD PTR [rax+r9*8]
0x1407105ec: mov    rax,QWORD PTR [rax+0x58]
0x1407105f0: mov    rcx,QWORD PTR [rax+rsi*8]
0x1407105f4: movsxd rdi,DWORD PTR [rcx+0x80]
0x1407105fb: mov    DWORD PTR [rsp+0x30],edi
0x1407105ff: cmp    edi,0xffffffff
0x140710602: je     0x140710711
0x140710608: mov    r14,QWORD PTR [rbp-0x28]
0x14071060c: cmp    BYTE PTR [r14+rdi*1],0x0
0x140710611: jne    0x140710711
0x140710617: mov    rax,QWORD PTR [r12+0x80]
0x14071061f: cmp    WORD PTR [rax+rdi*2],0xffff
0x140710624: je     0x14071070c
0x14071062a: mov    rax,QWORD PTR [r12+0x98]
0x140710632: cmp    DWORD PTR [rax+rdi*4],0xffffffff
0x140710636: je     0x14071070c
0x14071063c: mov    rax,QWORD PTR [r12+0xb0]
0x140710644: cmp    DWORD PTR [rax+rdi*4],0xffffffff
0x140710648: je     0x14071070c
0x14071064e: mov    rax,QWORD PTR [r12+0xc8]
0x140710656: cmp    DWORD PTR [rax+rdi*4],0xffffffff
0x14071065a: je     0x14071070c
0x140710660: mov    rax,QWORD PTR [r13+0x0]
0x140710664: mov    rcx,QWORD PTR [rax+r15*8]
0x140710668: add    rcx,0x98
0x14071066f: mov    rdx,QWORD PTR [rcx+0x8]
0x140710673: cmp    rdx,QWORD PTR [rcx+0x10]
0x140710677: je     0x140710682
0x140710679: mov    DWORD PTR [rdx],edi
0x14071067b: add    QWORD PTR [rcx+0x8],0x4
0x140710680: jmp    0x140710698
0x140710682: lea    r8,[rsp+0x30]
0x140710687: call   0x140070e20
0x14071068c: mov    r10,QWORD PTR [rsp+0x48]
0x140710691: mov    r11d,DWORD PTR [rbp+0x98]
0x140710698: mov    r8,QWORD PTR [r12+0x98]
0x1407106a0: mov    rax,QWORD PTR [r12+0xa0]
0x1407106a8: sub    rax,r8
0x1407106ab: sar    rax,0x2
0x1407106af: sub    eax,0x1
0x1407106b2: movsxd r9,eax
0x1407106b5: js     0x1407106ff
0x1407106b7: nop    WORD PTR [rax+rax*1+0x0]
0x1407106c0: mov    eax,DWORD PTR [r8+rdi*4]
0x1407106c4: cmp    DWORD PTR [r8+r9*4],eax
0x1407106c8: jne    0x1407106f9
0x1407106ca: mov    rcx,QWORD PTR [r12+0xb0]
0x1407106d2: mov    eax,DWORD PTR [rcx+rdi*4]
0x1407106d5: cmp    DWORD PTR [rcx+r9*4],eax
0x1407106d9: jne    0x1407106f9
0x1407106db: mov    rcx,QWORD PTR [r12+0xc8]
0x1407106e3: mov    eax,DWORD PTR [rcx+rdi*4]
0x1407106e6: cmp    DWORD PTR [rcx+r9*4],eax
0x1407106ea: jne    0x1407106f9
0x1407106ec: mov    BYTE PTR [r9+r14*1],0x1
0x1407106f1: mov    r8,QWORD PTR [r12+0x98]
0x1407106f9: sub    r9,0x1
0x1407106fd: jns    0x1407106c0
0x1407106ff: mov    r8,QWORD PTR [rsp+0x38]
0x140710704: movzx  r9d,WORD PTR [rbp+0x90]
0x14071070c: mov    BYTE PTR [rdi+r14*1],0x1
0x140710711: mov    rax,QWORD PTR [r13+0x0]
0x140710715: mov    rdx,QWORD PTR [rax+r15*8]
0x140710719: cmp    WORD PTR [rdx],0x2
0x14071071d: jne    0x140710a30
0x140710723: movsx  rcx,r9w
0x140710727: mov    rbx,QWORD PTR [rbp-0x58]
0x14071072b: add    rbx,rcx
0x14071072e: cmp    BYTE PTR [rbx],0x0
0x140710731: jne    0x140710885
0x140710737: mov    rax,QWORD PTR [r12+0x50]
0x14071073c: test   BYTE PTR [rax+rcx*4],0x2
0x140710740: je     0x1407107b1
0x140710742: lea    rcx,[rdx+0xb0]
0x140710749: movsx  eax,r9w
0x14071074d: mov    DWORD PTR [rsp+0x30],eax
0x140710751: mov    rdx,QWORD PTR [rcx+0x8]
0x140710755: cmp    rdx,QWORD PTR [rcx+0x10]
0x140710759: je     0x140710764
0x14071075b: mov    DWORD PTR [rdx],eax
0x14071075d: add    QWORD PTR [rcx+0x8],0x4
0x140710762: jmp    0x14071076e
0x140710764: lea    r8,[rsp+0x30]
0x140710769: call   0x140070e20
0x14071076e: mov    rax,QWORD PTR [r13+0x0]
0x140710772: mov    rcx,QWORD PTR [rax+r15*8]
0x140710776: add    rcx,0xc8
0x14071077d: mov    eax,0xffffffff
0x140710782: mov    DWORD PTR [rsp+0x30],eax
0x140710786: mov    rdx,QWORD PTR [rcx+0x8]
0x14071078a: cmp    rdx,QWORD PTR [rcx+0x10]
0x14071078e: je     0x14071079f
0x140710790: mov    DWORD PTR [rdx],eax
0x140710792: add    QWORD PTR [rcx+0x8],0x4
0x140710797: mov    BYTE PTR [rbx],0x1
0x14071079a: jmp    0x14071087d
0x14071079f: lea    r8,[rsp+0x30]
0x1407107a4: call   0x140070e20
0x1407107a9: mov    BYTE PTR [rbx],0x1
0x1407107ac: jmp    0x14071087d
0x1407107b1: cmp    si,0xffff
0x1407107b5: je     0x140710885
0x1407107bb: mov    rax,QWORD PTR [r12+0x48]
0x1407107c0: lea    rbx,[rcx*8+0x0]
0x1407107c8: mov    rax,QWORD PTR [rax]
0x1407107cb: mov    rcx,QWORD PTR [rbx+rax*1]
0x1407107cf: lea    rdi,[rsi*8+0x0]
0x1407107d7: mov    rax,QWORD PTR [rcx+0x58]
0x1407107db: mov    rcx,QWORD PTR [rax+rdi*1]
0x1407107df: movsxd r8,DWORD PTR [rcx+0x68]
0x1407107e3: mov    r14,QWORD PTR [rbp+0x20]
0x1407107e7: cmp    BYTE PTR [r8+r14*1],0x0
0x1407107ec: jne    0x140710885
0x1407107f2: mov    rax,QWORD PTR [r12+0x68]
0x1407107f7: test   BYTE PTR [rax+r8*4],0x1
0x1407107fc: je     0x140710885
0x140710802: lea    rcx,[rdx+0xb0]
0x140710809: movsx  eax,r9w
0x14071080d: mov    DWORD PTR [rsp+0x30],eax
0x140710811: mov    rdx,QWORD PTR [rcx+0x8]
0x140710815: cmp    rdx,QWORD PTR [rcx+0x10]
0x140710819: je     0x140710824
0x14071081b: mov    DWORD PTR [rdx],eax
0x14071081d: add    QWORD PTR [rcx+0x8],0x4
0x140710822: jmp    0x14071082e
0x140710824: lea    r8,[rsp+0x30]
0x140710829: call   0x140070e20
0x14071082e: mov    rax,QWORD PTR [r13+0x0]
0x140710832: mov    rcx,QWORD PTR [rax+r15*8]
0x140710836: add    rcx,0xc8
0x14071083d: mov    eax,esi
0x14071083f: mov    DWORD PTR [rsp+0x30],eax
0x140710843: mov    rdx,QWORD PTR [rcx+0x8]
0x140710847: cmp    rdx,QWORD PTR [rcx+0x10]
0x14071084b: je     0x140710856
0x14071084d: mov    DWORD PTR [rdx],eax
0x14071084f: add    QWORD PTR [rcx+0x8],0x4
0x140710854: jmp    0x140710860
0x140710856: lea    r8,[rsp+0x30]
0x14071085b: call   0x140070e20
0x140710860: mov    rax,QWORD PTR [r12+0x48]
0x140710865: mov    rcx,QWORD PTR [rax]
0x140710868: mov    rax,QWORD PTR [rbx+rcx*1]
0x14071086c: mov    rax,QWORD PTR [rax+0x58]
0x140710870: mov    rcx,QWORD PTR [rax+rdi*1]
0x140710874: movsxd rax,DWORD PTR [rcx+0x68]
0x140710878: mov    BYTE PTR [rax+r14*1],0x1
0x14071087d: movzx  r9d,WORD PTR [rbp+0x90]
0x140710885: mov    rcx,QWORD PTR [r12+0x110]
0x14071088d: test   rcx,rcx
0x140710890: je     0x140710a1f
0x140710896: mov    rax,QWORD PTR [rcx+0x8]
0x14071089a: sub    rax,QWORD PTR [rcx]
0x14071089d: sar    rax,0x3
0x1407108a1: sub    eax,0x1
0x1407108a4: movsxd r13,eax
0x1407108a7: mov    QWORD PTR [rsp+0x70],r13
0x1407108ac: js     0x140710a17
0x1407108b2: movsx  r15,r9w
0x1407108b6: data16 nop WORD PTR [rax+rax*1+0x0]
0x1407108c0: mov    rax,QWORD PTR [r12+0x110]
0x1407108c8: mov    rcx,QWORD PTR [rax]
0x1407108cb: mov    r14,QWORD PTR [rcx+r13*8]
0x1407108cf: mov    rax,QWORD PTR [r14+0x10]
0x1407108d3: sub    rax,QWORD PTR [r14+0x8]
0x1407108d7: sar    rax,0x3
0x1407108db: sub    eax,0x1
0x1407108de: movsxd rdi,eax
0x1407108e1: js     0x140710a03
0x1407108e7: mov    r13,QWORD PTR [rsp+0x50]
0x1407108ec: nop    DWORD PTR [rax+0x0]
0x1407108f0: mov    rbx,QWORD PTR [r14+0x8]
0x1407108f4: mov    rbx,QWORD PTR [rbx+rdi*8]
0x1407108f8: cmp    WORD PTR [rbx+0x4],r9w
0x1407108fd: jne    0x1407109f4
0x140710903: mov    r8d,DWORD PTR [rbx+0x64]
0x140710907: test   r8d,0x492000c
0x14071090e: je     0x1407109f4
0x140710914: cmp    WORD PTR [rbx+0x98],0x0
0x14071091c: jne    0x1407109f4
0x140710922: movsx  rdx,WORD PTR [rbx+0x6]
0x140710927: cmp    dx,si
0x14071092a: je     0x14071093f
0x14071092c: cmp    si,0xffff
0x140710930: jne    0x1407109f4
0x140710936: cmp    dx,si
0x140710939: je     0x1407109f4
0x14071093f: mov    rax,QWORD PTR [rbp-0x10]
0x140710943: mov    ecx,DWORD PTR [rax+r15*4]
0x140710947: cmp    edx,ecx
0x140710949: je     0x14071096b
0x14071094b: cmp    ecx,0xffffffff
0x14071094e: je     0x1407109f4
0x140710954: test   r8d,0x100008
0x14071095b: je     0x1407109f4
0x140710961: test   r8b,0x4
0x140710965: jne    0x1407109f4
0x14071096b: mov    rax,QWORD PTR [r12+0x48]
0x140710970: movsx  r8,WORD PTR [rbx+0x4]
0x140710975: mov    rax,QWORD PTR [rax]
0x140710978: mov    rax,QWORD PTR [rax+r8*8]
0x14071097c: mov    rax,QWORD PTR [rax+0x58]
0x140710980: mov    rcx,QWORD PTR [rax+rdx*8]
0x140710984: movsxd rdx,DWORD PTR [rcx+0x68]
0x140710988: mov    rax,QWORD PTR [rbp+0x8]
0x14071098c: cmp    BYTE PTR [rdx+rax*1],0x0
0x140710990: jne    0x1407109f4
0x140710992: mov    rax,QWORD PTR [r12+0x68]
0x140710997: test   BYTE PTR [rax+rdx*4],0x1
0x14071099b: jne    0x1407109f4
0x14071099d: mov    rax,QWORD PTR [r12+0x148]
0x1407109a5: mov    rcx,QWORD PTR [rax+r13*8]
0x1407109a9: movsx  eax,WORD PTR [rbx+0x60]
0x1407109ad: movsx  r9d,WORD PTR [rbx+0xc]
0x1407109b2: mov    edx,r8d
0x1407109b5: mov    DWORD PTR [rsp+0x20],eax
0x1407109b9: mov    r8d,DWORD PTR [rbx+0x64]
0x1407109bd: call   0x1406ba400
0x1407109c2: mov    rax,QWORD PTR [r12+0x48]
0x1407109c7: movsx  rcx,WORD PTR [rbx+0x4]
0x1407109cc: mov    rax,QWORD PTR [rax]
0x1407109cf: mov    rax,QWORD PTR [rax+rcx*8]
0x1407109d3: movsx  rcx,WORD PTR [rbx+0x6]
0x1407109d8: mov    rax,QWORD PTR [rax+0x58]
0x1407109dc: mov    rcx,QWORD PTR [rax+rcx*8]
0x1407109e0: movsxd rax,DWORD PTR [rcx+0x68]
0x1407109e4: mov    rcx,QWORD PTR [rbp-0x40]
0x1407109e8: mov    BYTE PTR [rax+rcx*1],0x1
0x1407109ec: movzx  r9d,WORD PTR [rbp+0x90]
0x1407109f4: sub    rdi,0x1
0x1407109f8: jns    0x1407108f0
0x1407109fe: mov    r13,QWORD PTR [rsp+0x70]
0x140710a03: sub    r13,0x1
0x140710a07: mov    QWORD PTR [rsp+0x70],r13
0x140710a0c: jns    0x1407108c0
0x140710a12: mov    r15,QWORD PTR [rsp+0x50]
0x140710a17: lea    r13,[r12+0x148]
0x140710a1f: mov    r8,QWORD PTR [rsp+0x38]
0x140710a24: mov    r10,QWORD PTR [rsp+0x48]
0x140710a29: mov    r11d,DWORD PTR [rbp+0x98]
0x140710a30: inc    r11d
0x140710a33: mov    DWORD PTR [rbp+0x98],r11d
0x140710a3a: add    r8,0x2
0x140710a3e: mov    QWORD PTR [rsp+0x38],r8
0x140710a43: mov    rdx,QWORD PTR [r10+0x30]
0x140710a47: mov    rcx,QWORD PTR [r10+0x38]
0x140710a4b: sub    rcx,rdx
0x140710a4e: sar    rcx,1
0x140710a51: movsxd rax,r11d
0x140710a54: cmp    rax,rcx
0x140710a57: jb     0x1407105c0
0x140710a5d: mov    r9d,DWORD PTR [rbp+0xa8]
0x140710a64: xor    r14d,r14d
0x140710a67: inc    r9d
0x140710a6a: mov    DWORD PTR [rbp+0xa8],r9d
0x140710a71: mov    r10,QWORD PTR [rsp+0x40]
0x140710a76: add    r10,0x4
0x140710a7a: mov    QWORD PTR [rsp+0x40],r10
0x140710a7f: mov    r8,QWORD PTR [r13+0x0]
0x140710a83: mov    rax,QWORD PTR [r8+r15*8]
0x140710a87: mov    rcx,QWORD PTR [rax+0x70]
0x140710a8b: sub    rcx,QWORD PTR [rax+0x68]
0x140710a8f: sar    rcx,0x2
0x140710a93: movsxd rax,r9d
0x140710a96: cmp    rax,rcx
0x140710a99: jb     0x140710570
0x140710a9f: mov    eax,DWORD PTR [rbp-0x38]
0x140710aa2: mov    rdi,QWORD PTR [rbp-0x40]
0x140710aa6: sub    eax,edi
0x140710aa8: sub    eax,0x1
0x140710aab: movsxd rcx,eax
0x140710aae: js     0x140710ad2
0x140710ab0: mov    r8,QWORD PTR [rbp+0x8]
0x140710ab4: lea    rax,[rcx+r8*1]
0x140710ab8: mov    rdx,rdi
0x140710abb: sub    rdx,r8
0x140710abe: xchg   ax,ax
0x140710ac0: cmp    BYTE PTR [rax+rdx*1],0x0
0x140710ac4: je     0x140710ac9
0x140710ac6: mov    BYTE PTR [rax],0x1
0x140710ac9: dec    rax
0x140710acc: sub    rcx,0x1
0x140710ad0: jns    0x140710ac0
0x140710ad2: mov    edx,DWORD PTR [rbp+0xa0]
0x140710ad8: inc    edx
0x140710ada: mov    DWORD PTR [rbp+0xa0],edx
0x140710ae0: mov    r8,QWORD PTR [r13+0x0]
0x140710ae4: movsxd r15,edx
0x140710ae7: mov    QWORD PTR [rsp+0x50],r15
0x140710aec: mov    rax,QWORD PTR [r13+0x8]
0x140710af0: sub    rax,r8
0x140710af3: sar    rax,0x3
0x140710af7: cmp    r15,rax
0x140710afa: mov    rsi,QWORD PTR [rbp-0x28]
0x140710afe: jb     0x14070fef0
0x140710b04: lea    r13,[r12+0x148]
0x140710b0c: lea    r15,[r12+0x160]
0x140710b14: mov    rax,QWORD PTR [r12+0x48]
0x140710b19: mov    rbx,QWORD PTR [rax+0x8]
0x140710b1d: sub    rbx,QWORD PTR [rax]
0x140710b20: sar    rbx,0x3
0x140710b24: mov    rdx,QWORD PTR [r15]
0x140710b27: mov    rdi,QWORD PTR [r15+0x8]
0x140710b2b: mov    rcx,rdi
0x140710b2e: sub    rcx,rdx
0x140710b31: cmp    rbx,rcx
0x140710b34: jae    0x140710b3c
0x140710b36: lea    rax,[rdx+rbx*1]
0x140710b3a: jmp    0x140710b6b
0x140710b3c: jbe    0x140710b6f
0x140710b3e: mov    rax,QWORD PTR [r15+0x10]
0x140710b42: sub    rax,rdx
0x140710b45: cmp    rbx,rax
0x140710b48: jbe    0x140710b57
0x140710b4a: mov    rdx,rbx
0x140710b4d: mov    rcx,r15
0x140710b50: call   0x1401ba240
0x140710b55: jmp    0x140710b6f
0x140710b57: sub    rbx,rcx
0x140710b5a: mov    r8,rbx
0x140710b5d: xor    edx,edx
0x140710b5f: mov    rcx,rdi
0x140710b62: call   0x14153aa96
0x140710b67: lea    rax,[rbx+rdi*1]
0x140710b6b: mov    QWORD PTR [r15+0x8],rax
0x140710b6f: mov    r8,QWORD PTR [r15+0x8]
0x140710b73: mov    rcx,QWORD PTR [r15]
0x140710b76: sub    r8,rcx
0x140710b79: xor    edx,edx
0x140710b7b: call   0x14153aa96
0x140710b80: xor    r10d,r10d
0x140710b83: mov    r14d,r10d
0x140710b86: mov    DWORD PTR [rbp+0x90],r10d
0x140710b8d: mov    r8,QWORD PTR [rbp-0x20]
0x140710b91: cmp    r8,rsi
0x140710b94: je     0x1407111a5
0x140710b9a: lea    rsi,[r12+0x148]
0x140710ba2: mov    edi,r10d
0x140710ba5: mov    QWORD PTR [rbp+0xa0],r10
0x140710bac: mov    r13,QWORD PTR [rbp-0x28]
0x140710bb0: sub    r8,r13
0x140710bb3: mov    QWORD PTR [rsp+0x40],r8
0x140710bb8: nop    DWORD PTR [rax+rax*1+0x0]
0x140710bc0: cmp    BYTE PTR [rdi+r13*1],0x0
0x140710bc5: jne    0x140711144
0x140710bcb: mov    rax,QWORD PTR [r12+0x80]
0x140710bd3: cmp    WORD PTR [rax+rdi*2],0xffff
0x140710bd8: je     0x14071110c
0x140710bde: mov    rax,QWORD PTR [r12+0x98]
0x140710be6: cmp    DWORD PTR [rax+rdi*4],0xffffffff
0x140710bea: je     0x14071110c
0x140710bf0: mov    rax,QWORD PTR [r12+0xb0]
0x140710bf8: cmp    DWORD PTR [rax+rdi*4],0xffffffff
0x140710bfc: je     0x14071110c
0x140710c02: mov    rax,QWORD PTR [r12+0xc8]
0x140710c0a: cmp    DWORD PTR [rax+rdi*4],0xffffffff
0x140710c0e: je     0x14071110c
0x140710c14: mov    ecx,0xf8
0x140710c19: call   0x141539690
0x140710c1e: mov    rbx,rax
0x140710c21: xor    eax,eax
0x140710c23: mov    QWORD PTR [rbx+0x8],rax
0x140710c27: mov    QWORD PTR [rbx+0x10],rax
0x140710c2b: mov    QWORD PTR [rbx+0x18],rax
0x140710c2f: mov    QWORD PTR [rbx+0x20],rax
0x140710c33: mov    QWORD PTR [rbx+0x28],rax
0x140710c37: mov    QWORD PTR [rbx+0x30],rax
0x140710c3b: mov    QWORD PTR [rbx+0x38],rax
0x140710c3f: mov    QWORD PTR [rbx+0x40],rax
0x140710c43: mov    QWORD PTR [rbx+0x48],rax
0x140710c47: mov    QWORD PTR [rbx+0x50],rax
0x140710c4b: mov    QWORD PTR [rbx+0x58],rax
0x140710c4f: mov    QWORD PTR [rbx+0x60],rax
0x140710c53: mov    QWORD PTR [rbx+0x68],rax
0x140710c57: mov    QWORD PTR [rbx+0x70],rax
0x140710c5b: mov    QWORD PTR [rbx+0x78],rax
0x140710c5f: mov    QWORD PTR [rbx+0x80],rax
0x140710c66: mov    QWORD PTR [rbx+0x88],rax
0x140710c6d: mov    QWORD PTR [rbx+0x90],rax
0x140710c74: lea    rcx,[rbx+0x98]
0x140710c7b: mov    QWORD PTR [rcx],rax
0x140710c7e: mov    QWORD PTR [rcx+0x8],rax
0x140710c82: mov    QWORD PTR [rcx+0x10],rax
0x140710c86: mov    QWORD PTR [rbx+0xb0],rax
0x140710c8d: mov    QWORD PTR [rbx+0xb8],rax
0x140710c94: mov    QWORD PTR [rbx+0xc0],rax
0x140710c9b: mov    QWORD PTR [rbx+0xc8],rax
0x140710ca2: mov    QWORD PTR [rbx+0xd0],rax
0x140710ca9: mov    QWORD PTR [rbx+0xd8],rax
0x140710cb0: mov    QWORD PTR [rbx+0xe0],rax
0x140710cb7: mov    QWORD PTR [rbx+0xe8],rax
0x140710cbe: mov    QWORD PTR [rbx+0xf0],rax
0x140710cc5: mov    QWORD PTR [rbp+0x98],rbx
0x140710ccc: mov    WORD PTR [rbx],0x2
0x140710cd1: mov    rdx,QWORD PTR [rcx+0x8]
0x140710cd5: cmp    rdx,QWORD PTR [rcx+0x10]
0x140710cd9: je     0x140710ce5
0x140710cdb: mov    DWORD PTR [rdx],r14d
0x140710cde: add    QWORD PTR [rcx+0x8],0x4
0x140710ce3: jmp    0x140710cf1
0x140710ce5: lea    r8,[rbp+0x90]
0x140710cec: call   0x140070e20
0x140710cf1: mov    rdx,QWORD PTR [rsi+0x8]
0x140710cf5: cmp    rdx,QWORD PTR [rsi+0x10]
0x140710cf9: je     0x140710d05
0x140710cfb: mov    QWORD PTR [rdx],rbx
0x140710cfe: add    QWORD PTR [rsi+0x8],0x8
0x140710d03: jmp    0x140710d14
0x140710d05: lea    r8,[rbp+0x98]
0x140710d0c: mov    rcx,rsi
0x140710d0f: call   0x140070bd0
0x140710d14: mov    r8,QWORD PTR [r12+0x98]
0x140710d1c: mov    rax,QWORD PTR [r12+0xa0]
0x140710d24: sub    rax,r8
0x140710d27: sar    rax,0x2
0x140710d2b: sub    eax,0x1
0x140710d2e: movsxd r9,eax
0x140710d31: js     0x140710d72
0x140710d33: mov    eax,DWORD PTR [r8+rdi*4]
0x140710d37: cmp    DWORD PTR [r8+r9*4],eax
0x140710d3b: jne    0x140710d6c
0x140710d3d: mov    rcx,QWORD PTR [r12+0xb0]
0x140710d45: mov    eax,DWORD PTR [rcx+rdi*4]
0x140710d48: cmp    DWORD PTR [rcx+r9*4],eax
0x140710d4c: jne    0x140710d6c
0x140710d4e: mov    rcx,QWORD PTR [r12+0xc8]
0x140710d56: mov    eax,DWORD PTR [rcx+rdi*4]
0x140710d59: cmp    DWORD PTR [rcx+r9*4],eax
0x140710d5d: jne    0x140710d6c
0x140710d5f: mov    BYTE PTR [r9+r13*1],0x1
0x140710d64: mov    r8,QWORD PTR [r12+0x98]
0x140710d6c: sub    r9,0x1
0x140710d70: jns    0x140710d33
0x140710d72: mov    rdx,QWORD PTR [r12+0x8]
0x140710d77: add    rdx,0x16e0
0x140710d7e: mov    rax,QWORD PTR [r12+0xc8]
0x140710d86: mov    ecx,DWORD PTR [rax+rdi*4]
0x140710d89: call   0x1400e1560
0x140710d8e: mov    rdx,rax
0x140710d91: mov    QWORD PTR [rsp+0x48],rax
0x140710d96: test   rax,rax
0x140710d99: je     0x14071110c
0x140710d9f: mov    rcx,QWORD PTR [rax+0x28]
0x140710da3: sub    rcx,QWORD PTR [rax+0x20]
0x140710da7: sar    rcx,1
0x140710daa: sub    ecx,0x1
0x140710dad: movsxd rcx,ecx
0x140710db0: mov    QWORD PTR [rbp+0xa8],rcx
0x140710db7: js     0x14071110c
0x140710dbd: lea    r9,[rbx+0xb0]
0x140710dc4: mov    QWORD PTR [rsp+0x50],r9
0x140710dc9: lea    r14,[rbx+0xc8]
0x140710dd0: mov    QWORD PTR [rsp+0x70],r14
0x140710dd5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x140710de0: mov    rax,QWORD PTR [rdx+0x20]
0x140710de4: movsx  r15,WORD PTR [rax+rcx*2]
0x140710de9: mov    rax,QWORD PTR [rdx+0x38]
0x140710ded: movsx  rsi,WORD PTR [rax+rcx*2]
0x140710df2: mov    rbx,QWORD PTR [rbp-0x58]
0x140710df6: cmp    BYTE PTR [rbx+r15*1],0x0
0x140710dfb: jne    0x140710f34
0x140710e01: mov    rax,QWORD PTR [r12+0x50]
0x140710e06: test   BYTE PTR [rax+r15*4],0x2
0x140710e0b: je     0x140710e7a
0x140710e0d: mov    eax,r15d
0x140710e10: mov    DWORD PTR [rbp+0x98],eax
0x140710e16: mov    rdx,QWORD PTR [r9+0x8]
0x140710e1a: cmp    rdx,QWORD PTR [r9+0x10]
0x140710e1e: je     0x140710e29
0x140710e20: mov    DWORD PTR [rdx],eax
0x140710e22: add    QWORD PTR [r9+0x8],0x4
0x140710e27: jmp    0x140710e38
0x140710e29: lea    r8,[rbp+0x98]
0x140710e30: mov    rcx,r9
0x140710e33: call   0x140070e20
0x140710e38: mov    DWORD PTR [rbp+0x98],0xffffffff
0x140710e42: mov    rdx,QWORD PTR [r14+0x8]
0x140710e46: cmp    rdx,QWORD PTR [r14+0x10]
0x140710e4a: je     0x140710e61
0x140710e4c: mov    DWORD PTR [rdx],0xffffffff
0x140710e52: add    QWORD PTR [r14+0x8],0x4
0x140710e57: mov    BYTE PTR [rbx+r15*1],0x1
0x140710e5c: jmp    0x140710f34
0x140710e61: lea    r8,[rbp+0x98]
0x140710e68: mov    rcx,r14
0x140710e6b: call   0x140070e20
0x140710e70: mov    BYTE PTR [rbx+r15*1],0x1
0x140710e75: jmp    0x140710f34
0x140710e7a: cmp    si,0xffff
0x140710e7e: je     0x140710f34
0x140710e84: mov    rax,QWORD PTR [r12+0x48]
0x140710e89: lea    rbx,[r15*8+0x0]
0x140710e91: mov    rax,QWORD PTR [rax]
0x140710e94: mov    rcx,QWORD PTR [rbx+rax*1]
0x140710e98: lea    rdi,[rsi*8+0x0]
0x140710ea0: mov    rax,QWORD PTR [rcx+0x58]
0x140710ea4: mov    rcx,QWORD PTR [rax+rdi*1]
0x140710ea8: movsxd rdx,DWORD PTR [rcx+0x68]
0x140710eac: mov    r13,QWORD PTR [rbp+0x20]
0x140710eb0: cmp    BYTE PTR [rdx+r13*1],0x0
0x140710eb5: jne    0x140710f34
0x140710eb7: mov    rax,QWORD PTR [r12+0x68]
0x140710ebc: test   BYTE PTR [rax+rdx*4],0x1
0x140710ec0: je     0x140710f34
0x140710ec2: mov    eax,r15d
0x140710ec5: mov    DWORD PTR [rbp+0x98],eax
0x140710ecb: mov    rdx,QWORD PTR [r9+0x8]
0x140710ecf: cmp    rdx,QWORD PTR [r9+0x10]
0x140710ed3: je     0x140710ede
0x140710ed5: mov    DWORD PTR [rdx],eax
0x140710ed7: add    QWORD PTR [r9+0x8],0x4
0x140710edc: jmp    0x140710eed
0x140710ede: lea    r8,[rbp+0x98]
0x140710ee5: mov    rcx,r9
0x140710ee8: call   0x140070e20
0x140710eed: mov    eax,esi
0x140710eef: mov    DWORD PTR [rbp+0x98],eax
0x140710ef5: mov    rdx,QWORD PTR [r14+0x8]
0x140710ef9: cmp    rdx,QWORD PTR [r14+0x10]
0x140710efd: je     0x140710f08
0x140710eff: mov    DWORD PTR [rdx],eax
0x140710f01: add    QWORD PTR [r14+0x8],0x4
0x140710f06: jmp    0x140710f17
0x140710f08: lea    r8,[rbp+0x98]
0x140710f0f: mov    rcx,r14
0x140710f12: call   0x140070e20
0x140710f17: mov    rax,QWORD PTR [r12+0x48]
0x140710f1c: mov    rcx,QWORD PTR [rax]
0x140710f1f: mov    rax,QWORD PTR [rcx+rbx*1]
0x140710f23: mov    rax,QWORD PTR [rax+0x58]
0x140710f27: mov    rcx,QWORD PTR [rax+rdi*1]
0x140710f2b: movsxd rax,DWORD PTR [rcx+0x68]
0x140710f2f: mov    BYTE PTR [rax+r13*1],0x1
0x140710f34: mov    rcx,QWORD PTR [r12+0x110]
0x140710f3c: test   rcx,rcx
0x140710f3f: je     0x1407110c8
0x140710f45: mov    rax,QWORD PTR [rcx+0x8]
0x140710f49: sub    rax,QWORD PTR [rcx]
0x140710f4c: sar    rax,0x3
0x140710f50: sub    eax,0x1
0x140710f53: movsxd rdx,eax
0x140710f56: mov    QWORD PTR [rbp+0x98],rdx
0x140710f5d: js     0x1407110c8
0x140710f63: nop    DWORD PTR [rax+0x0]
0x140710f67: nop    WORD PTR [rax+rax*1+0x0]
0x140710f70: mov    rax,QWORD PTR [r12+0x110]
0x140710f78: mov    rcx,QWORD PTR [rax]
0x140710f7b: mov    r14,QWORD PTR [rcx+rdx*8]
0x140710f7f: mov    rax,QWORD PTR [r14+0x10]
0x140710f83: sub    rax,QWORD PTR [r14+0x8]
0x140710f87: sar    rax,0x3
0x140710f8b: sub    eax,0x1
0x140710f8e: movsxd rdi,eax
0x140710f91: js     0x1407110b2
0x140710f97: nop    WORD PTR [rax+rax*1+0x0]
0x140710fa0: mov    rax,QWORD PTR [r14+0x8]
0x140710fa4: mov    rbx,QWORD PTR [rax+rdi*8]
0x140710fa8: cmp    WORD PTR [rbx+0x4],r15w
0x140710fad: jne    0x1407110a1
0x140710fb3: mov    ecx,DWORD PTR [rbx+0x64]
0x140710fb6: test   ecx,0x492000c
0x140710fbc: je     0x1407110a1
0x140710fc2: cmp    WORD PTR [rbx+0x98],0x0
0x140710fca: jne    0x1407110a1
0x140710fd0: movsx  rdx,WORD PTR [rbx+0x6]
0x140710fd5: cmp    dx,si
0x140710fd8: je     0x140710fed
0x140710fda: cmp    si,0xffff
0x140710fde: jne    0x1407110a1
0x140710fe4: cmp    dx,si
0x140710fe7: je     0x1407110a1
0x140710fed: mov    rax,QWORD PTR [rbp-0x10]
0x140710ff1: mov    r8d,DWORD PTR [rax+r15*4]
0x140710ff5: cmp    edx,r8d
0x140710ff8: je     0x140711019
0x140710ffa: cmp    r8d,0xffffffff
0x140710ffe: je     0x1407110a1
0x140711004: test   ecx,0x100008
0x14071100a: je     0x1407110a1
0x140711010: test   cl,0x4
0x140711013: jne    0x1407110a1
0x140711019: mov    rax,QWORD PTR [r12+0x48]
0x14071101e: movsx  r8,WORD PTR [rbx+0x4]
0x140711023: mov    rax,QWORD PTR [rax]
0x140711026: mov    rax,QWORD PTR [rax+r8*8]
0x14071102a: mov    rax,QWORD PTR [rax+0x58]
0x14071102e: mov    rcx,QWORD PTR [rax+rdx*8]
0x140711032: movsxd rdx,DWORD PTR [rcx+0x68]
0x140711036: mov    rax,QWORD PTR [rbp+0x8]
0x14071103a: cmp    BYTE PTR [rax+rdx*1],0x0
0x14071103e: jne    0x1407110a1
0x140711040: mov    rax,QWORD PTR [r12+0x68]
0x140711045: test   BYTE PTR [rax+rdx*4],0x1
0x140711049: jne    0x1407110a1
0x14071104b: mov    rax,QWORD PTR [r12+0x148]
0x140711053: mov    rcx,QWORD PTR [rbp+0xa0]
0x14071105a: mov    rcx,QWORD PTR [rax+rcx*8]
0x14071105e: movsx  eax,WORD PTR [rbx+0x60]
0x140711062: movsx  r9d,WORD PTR [rbx+0xc]
0x140711067: mov    edx,r8d
0x14071106a: mov    DWORD PTR [rsp+0x20],eax
0x14071106e: mov    r8d,DWORD PTR [rbx+0x64]
0x140711072: call   0x1406ba400
0x140711077: mov    rax,QWORD PTR [r12+0x48]
0x14071107c: movsx  rcx,WORD PTR [rbx+0x4]
0x140711081: mov    rax,QWORD PTR [rax]
0x140711084: mov    rax,QWORD PTR [rax+rcx*8]
0x140711088: movsx  rcx,WORD PTR [rbx+0x6]
0x14071108d: mov    rax,QWORD PTR [rax+0x58]
0x140711091: mov    rcx,QWORD PTR [rax+rcx*8]
0x140711095: movsxd rax,DWORD PTR [rcx+0x68]
0x140711099: mov    rcx,QWORD PTR [rbp-0x40]
0x14071109d: mov    BYTE PTR [rax+rcx*1],0x1
0x1407110a1: sub    rdi,0x1
0x1407110a5: jns    0x140710fa0
0x1407110ab: mov    rdx,QWORD PTR [rbp+0x98]
0x1407110b2: sub    rdx,0x1
0x1407110b6: mov    QWORD PTR [rbp+0x98],rdx
0x1407110bd: jns    0x140710f70
0x1407110c3: mov    r14,QWORD PTR [rsp+0x70]
0x1407110c8: mov    rcx,QWORD PTR [rbp+0xa8]
0x1407110cf: sub    rcx,0x1
0x1407110d3: mov    QWORD PTR [rbp+0xa8],rcx
0x1407110da: mov    r9,QWORD PTR [rsp+0x50]
0x1407110df: mov    rdx,QWORD PTR [rsp+0x48]
0x1407110e4: jns    0x140710de0
0x1407110ea: mov    rdi,QWORD PTR [rbp+0xa0]
0x1407110f1: lea    rsi,[r12+0x148]
0x1407110f9: mov    r14d,DWORD PTR [rbp+0x90]
0x140711100: lea    r15,[r12+0x160]
0x140711108: mov    r13,QWORD PTR [rbp-0x28]
0x14071110c: mov    eax,DWORD PTR [rbp-0x38]
0x14071110f: mov    rdx,QWORD PTR [rbp-0x40]
0x140711113: sub    eax,edx
0x140711115: sub    eax,0x1
0x140711118: movsxd rcx,eax
0x14071111b: js     0x14071113a
0x14071111d: mov    r8,QWORD PTR [rbp+0x8]
0x140711121: lea    rax,[rcx+r8*1]
0x140711125: sub    rdx,r8
0x140711128: cmp    BYTE PTR [rdx+rax*1],0x0
0x14071112c: je     0x140711131
0x14071112e: mov    BYTE PTR [rax],0x1
0x140711131: dec    rax
0x140711134: sub    rcx,0x1
0x140711138: jns    0x140711128
0x14071113a: mov    BYTE PTR [rdi+r13*1],0x1
0x14071113f: mov    r8,QWORD PTR [rsp+0x40]
0x140711144: mov    rcx,QWORD PTR [r12+0x8]
0x140711149: mov    rax,QWORD PTR [rcx+0x1680]
0x140711150: movsx  rdx,WORD PTR [rax+rdi*2]
0x140711155: mov    rax,QWORD PTR [rcx+0x16b0]
0x14071115c: movsxd rcx,DWORD PTR [rax+rdi*4]
0x140711160: cmp    ecx,0xffffffff
0x140711163: je     0x14071117d
0x140711165: mov    rax,QWORD PTR [r12+0x30]
0x14071116a: cmp    DWORD PTR [rax+rcx*4],0x5
0x14071116e: jge    0x14071117d
0x140711170: cmp    dx,0xffff
0x140711174: je     0x14071117d
0x140711176: mov    rax,QWORD PTR [r15]
0x140711179: mov    BYTE PTR [rdx+rax*1],0x1
0x14071117d: inc    r14d
0x140711180: mov    DWORD PTR [rbp+0x90],r14d
0x140711187: movsxd rdi,r14d
0x14071118a: mov    QWORD PTR [rbp+0xa0],rdi
0x140711191: cmp    rdi,r8
0x140711194: jb     0x140710bc0
0x14071119a: lea    r13,[r12+0x148]
0x1407111a2: xor    r10d,r10d
0x1407111a5: movzx  r15d,r10w
0x1407111a9: mov    rdx,QWORD PTR [r12+0x48]
0x1407111ae: mov    rax,QWORD PTR [rdx+0x8]
0x1407111b2: sub    rax,QWORD PTR [rdx]
0x1407111b5: sar    rax,0x3
0x1407111b9: test   rax,rax
0x1407111bc: je     0x14071155c
0x1407111c2: mov    r14,r10
0x1407111c5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x1407111d0: mov    rbx,r10
0x1407111d3: mov    rax,QWORD PTR [r12+0x50]
0x1407111d8: test   BYTE PTR [rax+r14*4],0x2
0x1407111dd: je     0x140711344
0x1407111e3: mov    rsi,QWORD PTR [rbp-0x58]
0x1407111e7: cmp    BYTE PTR [r14+rsi*1],0x0
0x1407111ec: jne    0x140711538
0x1407111f2: mov    ecx,0xf8
0x1407111f7: call   0x141539690
0x1407111fc: xor    ecx,ecx
0x1407111fe: mov    QWORD PTR [rax+0x8],rcx
0x140711202: mov    QWORD PTR [rax+0x10],rcx
0x140711206: mov    QWORD PTR [rax+0x18],rcx
0x14071120a: mov    QWORD PTR [rax+0x20],rcx
0x14071120e: mov    QWORD PTR [rax+0x28],rcx
0x140711212: mov    QWORD PTR [rax+0x30],rcx
0x140711216: mov    QWORD PTR [rax+0x38],rcx
0x14071121a: mov    QWORD PTR [rax+0x40],rcx
0x14071121e: mov    QWORD PTR [rax+0x48],rcx
0x140711222: mov    QWORD PTR [rax+0x50],rcx
0x140711226: mov    QWORD PTR [rax+0x58],rcx
0x14071122a: mov    QWORD PTR [rax+0x60],rcx
0x14071122e: mov    QWORD PTR [rax+0x68],rcx
0x140711232: mov    QWORD PTR [rax+0x70],rcx
0x140711236: mov    QWORD PTR [rax+0x78],rcx
0x14071123a: mov    QWORD PTR [rax+0x80],rcx
0x140711241: mov    QWORD PTR [rax+0x88],rcx
0x140711248: mov    QWORD PTR [rax+0x90],rcx
0x14071124f: mov    QWORD PTR [rax+0x98],rcx
0x140711256: mov    QWORD PTR [rax+0xa0],rcx
0x14071125d: mov    QWORD PTR [rax+0xa8],rcx
0x140711264: lea    rdi,[rax+0xb0]
0x14071126b: mov    QWORD PTR [rdi],rcx
0x14071126e: mov    QWORD PTR [rdi+0x8],rcx
0x140711272: mov    QWORD PTR [rdi+0x10],rcx
0x140711276: lea    rbx,[rax+0xc8]
0x14071127d: mov    QWORD PTR [rbx],rcx
0x140711280: mov    QWORD PTR [rbx+0x8],rcx
0x140711284: mov    QWORD PTR [rbx+0x10],rcx
0x140711288: mov    QWORD PTR [rax+0xe0],rcx
0x14071128f: mov    QWORD PTR [rax+0xe8],rcx
0x140711296: mov    QWORD PTR [rax+0xf0],rcx
0x14071129d: mov    QWORD PTR [rbp+0x90],rax
0x1407112a4: mov    WORD PTR [rax],0x2
0x1407112a9: mov    rdx,QWORD PTR [r13+0x8]
0x1407112ad: cmp    rdx,QWORD PTR [r13+0x10]
0x1407112b1: je     0x1407112bd
0x1407112b3: mov    QWORD PTR [rdx],rax
0x1407112b6: add    QWORD PTR [r13+0x8],0x8
0x1407112bb: jmp    0x1407112cc
0x1407112bd: lea    r8,[rbp+0x90]
0x1407112c4: mov    rcx,r13
0x1407112c7: call   0x140070bd0
0x1407112cc: movsx  eax,r15w
0x1407112d0: mov    DWORD PTR [rbp+0x90],eax
0x1407112d6: mov    rdx,QWORD PTR [rdi+0x8]
0x1407112da: cmp    rdx,QWORD PTR [rdi+0x10]
0x1407112de: je     0x1407112e9
0x1407112e0: mov    DWORD PTR [rdx],eax
0x1407112e2: add    QWORD PTR [rdi+0x8],0x4
0x1407112e7: jmp    0x1407112f8
0x1407112e9: lea    r8,[rbp+0x90]
0x1407112f0: mov    rcx,rdi
0x1407112f3: call   0x140070e20
0x1407112f8: mov    DWORD PTR [rbp+0x90],0xffffffff
0x140711302: mov    rdx,QWORD PTR [rbx+0x8]
0x140711306: cmp    rdx,QWORD PTR [rbx+0x10]
0x14071130a: je     0x140711326
0x14071130c: mov    DWORD PTR [rdx],0xffffffff
0x140711312: add    QWORD PTR [rbx+0x8],0x4
0x140711317: mov    BYTE PTR [r14+rsi*1],0x1
0x14071131c: mov    rdx,QWORD PTR [r12+0x48]
0x140711321: jmp    0x140711535
0x140711326: lea    r8,[rbp+0x90]
0x14071132d: mov    rcx,rbx
0x140711330: call   0x140070e20
0x140711335: mov    BYTE PTR [r14+rsi*1],0x1
0x14071133a: mov    rdx,QWORD PTR [r12+0x48]
0x14071133f: jmp    0x140711535
0x140711344: movzx  esi,r10w
0x140711348: mov    rax,QWORD PTR [rdx]
0x14071134b: mov    rcx,QWORD PTR [rax+r14*8]
0x14071134f: mov    rax,QWORD PTR [rcx+0x60]
0x140711353: sub    rax,QWORD PTR [rcx+0x58]
0x140711357: sar    rax,0x3
0x14071135b: test   rax,rax
0x14071135e: je     0x140711538
0x140711364: mov    rdi,r10
0x140711367: nop    WORD PTR [rax+rax*1+0x0]
0x140711370: mov    rax,QWORD PTR [rdx]
0x140711373: mov    rax,QWORD PTR [rax+r14*8]
0x140711377: mov    rax,QWORD PTR [rax+0x58]
0x14071137b: mov    rcx,QWORD PTR [rax+rdi*8]
0x14071137f: movsxd rdx,DWORD PTR [rcx+0x68]
0x140711383: mov    rax,QWORD PTR [r12+0x68]
0x140711388: test   BYTE PTR [rax+rdx*4],0x1
0x14071138c: je     0x14071150d
0x140711392: mov    rax,QWORD PTR [rbp+0x20]
0x140711396: cmp    BYTE PTR [rdx+rax*1],0x0
0x14071139a: jne    0x14071150d
0x1407113a0: test   rbx,rbx
0x1407113a3: jne    0x14071148d
0x1407113a9: mov    ecx,0xf8
0x1407113ae: call   0x141539690
0x1407113b3: mov    rbx,rax
0x1407113b6: xor    r10d,r10d
0x1407113b9: mov    QWORD PTR [rax+0x8],r10
0x1407113bd: mov    QWORD PTR [rax+0x10],r10
0x1407113c1: mov    QWORD PTR [rax+0x18],r10
0x1407113c5: mov    QWORD PTR [rax+0x20],r10
0x1407113c9: mov    QWORD PTR [rax+0x28],r10
0x1407113cd: mov    QWORD PTR [rax+0x30],r10
0x1407113d1: mov    QWORD PTR [rax+0x38],r10
0x1407113d5: mov    QWORD PTR [rax+0x40],r10
0x1407113d9: mov    QWORD PTR [rax+0x48],r10
0x1407113dd: mov    QWORD PTR [rax+0x50],r10
0x1407113e1: mov    QWORD PTR [rax+0x58],r10
0x1407113e5: mov    QWORD PTR [rax+0x60],r10
0x1407113e9: mov    QWORD PTR [rax+0x68],r10
0x1407113ed: mov    QWORD PTR [rax+0x70],r10
0x1407113f1: mov    QWORD PTR [rax+0x78],r10
0x1407113f5: mov    QWORD PTR [rax+0x80],r10
0x1407113fc: mov    QWORD PTR [rax+0x88],r10
0x140711403: mov    QWORD PTR [rax+0x90],r10
0x14071140a: mov    QWORD PTR [rax+0x98],r10
0x140711411: mov    QWORD PTR [rax+0xa0],r10
0x140711418: mov    QWORD PTR [rax+0xa8],r10
0x14071141f: mov    QWORD PTR [rax+0xb0],r10
0x140711426: mov    QWORD PTR [rax+0xb8],r10
0x14071142d: mov    QWORD PTR [rax+0xc0],r10
0x140711434: mov    QWORD PTR [rax+0xc8],r10
0x14071143b: mov    QWORD PTR [rax+0xd0],r10
0x140711442: mov    QWORD PTR [rax+0xd8],r10
0x140711449: mov    QWORD PTR [rax+0xe0],r10
0x140711450: mov    QWORD PTR [rax+0xe8],r10
0x140711457: mov    QWORD PTR [rax+0xf0],r10
0x14071145e: mov    QWORD PTR [rbp+0x90],rax
0x140711465: mov    WORD PTR [rax],0x2
0x14071146a: mov    rdx,QWORD PTR [r13+0x8]
0x14071146e: cmp    rdx,QWORD PTR [r13+0x10]
0x140711472: je     0x14071147e
0x140711474: mov    QWORD PTR [rdx],rax
0x140711477: add    QWORD PTR [r13+0x8],0x8
0x14071147c: jmp    0x14071148d
0x14071147e: lea    r8,[rbp+0x90]
0x140711485: mov    rcx,r13
0x140711488: call   0x140070bd0
0x14071148d: lea    rcx,[rbx+0xb0]
0x140711494: movsx  eax,r15w
0x140711498: mov    DWORD PTR [rbp+0x90],eax
0x14071149e: mov    rdx,QWORD PTR [rcx+0x8]
0x1407114a2: cmp    rdx,QWORD PTR [rcx+0x10]
0x1407114a6: je     0x1407114b1
0x1407114a8: mov    DWORD PTR [rdx],eax
0x1407114aa: add    QWORD PTR [rcx+0x8],0x4
0x1407114af: jmp    0x1407114bd
0x1407114b1: lea    r8,[rbp+0x90]
0x1407114b8: call   0x140070e20
0x1407114bd: lea    rcx,[rbx+0xc8]
0x1407114c4: movsx  eax,si
0x1407114c7: mov    DWORD PTR [rbp+0x90],eax
0x1407114cd: mov    rdx,QWORD PTR [rcx+0x8]
0x1407114d1: cmp    rdx,QWORD PTR [rcx+0x10]
0x1407114d5: je     0x1407114e0
0x1407114d7: mov    DWORD PTR [rdx],eax
0x1407114d9: add    QWORD PTR [rcx+0x8],0x4
0x1407114de: jmp    0x1407114ec
0x1407114e0: lea    r8,[rbp+0x90]
0x1407114e7: call   0x140070e20
0x1407114ec: mov    rax,QWORD PTR [r12+0x48]
0x1407114f1: mov    rcx,QWORD PTR [rax]
0x1407114f4: mov    rax,QWORD PTR [rcx+r14*8]
0x1407114f8: mov    rax,QWORD PTR [rax+0x58]
0x1407114fc: mov    rcx,QWORD PTR [rax+rdi*8]
0x140711500: movsxd rax,DWORD PTR [rcx+0x68]
0x140711504: mov    r8,QWORD PTR [rbp+0x20]
0x140711508: mov    BYTE PTR [rax+r8*1],0x1
0x14071150d: inc    si
0x140711510: mov    rdx,QWORD PTR [r12+0x48]
0x140711515: mov    rax,QWORD PTR [rdx]
0x140711518: mov    rcx,QWORD PTR [rax+r14*8]
0x14071151c: movsx  rdi,si
0x140711520: mov    rax,QWORD PTR [rcx+0x60]
0x140711524: sub    rax,QWORD PTR [rcx+0x58]
0x140711528: sar    rax,0x3
0x14071152c: cmp    rdi,rax
0x14071152f: jb     0x140711370
0x140711535: xor    r10d,r10d
0x140711538: inc    r15w
0x14071153c: movsx  r14,r15w
0x140711540: mov    rax,QWORD PTR [rdx+0x8]
0x140711544: sub    rax,QWORD PTR [rdx]
0x140711547: sar    rax,0x3
0x14071154b: cmp    r14,rax
0x14071154e: jb     0x1407111d0
0x140711554: lea    r13,[r12+0x148]
0x14071155c: mov    rcx,QWORD PTR [r12+0x110]
0x140711564: mov    r15,r13
0x140711567: test   rcx,rcx
0x14071156a: je     0x140711aa3
0x140711570: mov    rax,QWORD PTR [rcx+0x8]
0x140711574: sub    rax,QWORD PTR [rcx]
0x140711577: sar    rax,0x3
0x14071157b: sub    eax,0x1
0x14071157e: movsxd r13,eax
0x140711581: mov    QWORD PTR [rbp+0x98],r13
0x140711588: lea    r15,[r12+0x148]
0x140711590: js     0x140711aa3
0x140711596: mov    rbx,QWORD PTR [rbp+0x90]
0x14071159d: nop    DWORD PTR [rax]
0x1407115a0: mov    rsi,r10
0x1407115a3: mov    rax,QWORD PTR [r12+0x110]
0x1407115ab: mov    rcx,QWORD PTR [rax]
0x1407115ae: mov    r15,QWORD PTR [rcx+r13*8]
0x1407115b2: mov    rax,QWORD PTR [r15+0x10]
0x1407115b6: sub    rax,QWORD PTR [r15+0x8]
0x1407115ba: sar    rax,0x3
0x1407115be: sub    eax,0x1
0x1407115c1: movsxd r14,eax
0x1407115c4: js     0x140711a8a
0x1407115ca: nop    WORD PTR [rax+rax*1+0x0]
0x1407115d0: mov    rax,QWORD PTR [r15+0x8]
0x1407115d4: mov    rdi,QWORD PTR [rax+r14*8]
0x1407115d8: movsx  rax,WORD PTR [rdi+0x4]
0x1407115dd: cmp    ax,0xffff
0x1407115e1: je     0x140711a76
0x1407115e7: mov    ecx,DWORD PTR [rdi+0x64]
0x1407115ea: test   ecx,0x492000c
0x1407115f0: je     0x140711791
0x1407115f6: cmp    WORD PTR [rdi+0x98],0x0
0x1407115fe: jne    0x140711791
0x140711604: movsx  rdx,WORD PTR [rdi+0x6]
0x140711609: cmp    dx,0xffff
0x14071160d: je     0x140711791
0x140711613: mov    r9,rax
0x140711616: mov    r10,QWORD PTR [rbp-0x10]
0x14071161a: mov    r8d,DWORD PTR [r10+rax*4]
0x14071161e: cmp    edx,r8d
0x140711621: je     0x140711642
0x140711623: cmp    r8d,0xffffffff
0x140711627: je     0x140711a76
0x14071162d: test   ecx,0x100008
0x140711633: je     0x140711a76
0x140711639: test   cl,0x4
0x14071163c: jne    0x140711a76
0x140711642: mov    rax,QWORD PTR [r12+0x48]
0x140711647: mov    rcx,QWORD PTR [rax]
0x14071164a: mov    rax,QWORD PTR [rcx+r9*8]
0x14071164e: mov    rax,QWORD PTR [rax+0x58]
0x140711652: mov    rcx,QWORD PTR [rax+rdx*8]
0x140711656: movsxd rdx,DWORD PTR [rcx+0x68]
0x14071165a: mov    rax,QWORD PTR [rbp+0x8]
0x14071165e: cmp    BYTE PTR [rdx+rax*1],0x0
0x140711662: jne    0x140711791
0x140711668: mov    rax,QWORD PTR [r12+0x68]
0x14071166d: test   BYTE PTR [rax+rdx*4],0x1
0x140711671: jne    0x140711791
0x140711677: test   rsi,rsi
0x14071167a: jne    0x140711774
0x140711680: mov    ecx,0xf8
0x140711685: call   0x141539690
0x14071168a: mov    rsi,rax
0x14071168d: xor    eax,eax
0x14071168f: mov    QWORD PTR [rsi+0x8],rax
0x140711693: mov    QWORD PTR [rsi+0x10],rax
0x140711697: mov    QWORD PTR [rsi+0x18],rax
0x14071169b: mov    QWORD PTR [rsi+0x20],rax
0x14071169f: mov    QWORD PTR [rsi+0x28],rax
0x1407116a3: mov    QWORD PTR [rsi+0x30],rax
0x1407116a7: mov    QWORD PTR [rsi+0x38],rax
0x1407116ab: mov    QWORD PTR [rsi+0x40],rax
0x1407116af: mov    QWORD PTR [rsi+0x48],rax
0x1407116b3: mov    QWORD PTR [rsi+0x50],rax
0x1407116b7: mov    QWORD PTR [rsi+0x58],rax
0x1407116bb: mov    QWORD PTR [rsi+0x60],rax
0x1407116bf: mov    QWORD PTR [rsi+0x68],rax
0x1407116c3: mov    QWORD PTR [rsi+0x70],rax
0x1407116c7: mov    QWORD PTR [rsi+0x78],rax
0x1407116cb: mov    QWORD PTR [rsi+0x80],rax
0x1407116d2: mov    QWORD PTR [rsi+0x88],rax
0x1407116d9: mov    QWORD PTR [rsi+0x90],rax
0x1407116e0: mov    QWORD PTR [rsi+0x98],rax
0x1407116e7: mov    QWORD PTR [rsi+0xa0],rax
0x1407116ee: mov    QWORD PTR [rsi+0xa8],rax
0x1407116f5: mov    QWORD PTR [rsi+0xb0],rax
0x1407116fc: mov    QWORD PTR [rsi+0xb8],rax
0x140711703: mov    QWORD PTR [rsi+0xc0],rax
0x14071170a: mov    QWORD PTR [rsi+0xc8],rax
0x140711711: mov    QWORD PTR [rsi+0xd0],rax
0x140711718: mov    QWORD PTR [rsi+0xd8],rax
0x14071171f: mov    QWORD PTR [rsi+0xe0],rax
0x140711726: mov    QWORD PTR [rsi+0xe8],rax
0x14071172d: mov    QWORD PTR [rsi+0xf0],rax
0x140711734: mov    QWORD PTR [rbp+0x90],rsi
0x14071173b: mov    WORD PTR [rsi],0x2
0x140711740: mov    rdx,QWORD PTR [r12+0x150]
0x140711748: cmp    rdx,QWORD PTR [r12+0x158]
0x140711750: je     0x140711760
0x140711752: mov    QWORD PTR [rdx],rsi
0x140711755: add    QWORD PTR [r12+0x150],0x8
0x14071175e: jmp    0x140711774
0x140711760: lea    r8,[rbp+0x90]
0x140711767: lea    rcx,[r12+0x148]
0x14071176f: call   0x140070bd0
0x140711774: movsx  eax,WORD PTR [rdi+0x60]
0x140711778: movsx  r9d,WORD PTR [rdi+0xc]
0x14071177d: movsx  edx,WORD PTR [rdi+0x4]
0x140711781: mov    DWORD PTR [rsp+0x20],eax
0x140711785: mov    r8d,DWORD PTR [rdi+0x64]
0x140711789: mov    rcx,rsi
0x14071178c: call   0x1406ba400
0x140711791: mov    r8,QWORD PTR [r12+0x130]
0x140711799: mov    rdx,QWORD PTR [r12+0x138]
0x1407117a1: sub    rdx,r8
0x1407117a4: sar    rdx,0x3
0x1407117a8: sub    edx,0x1
0x1407117ab: js     0x1407117d8
0x1407117ad: movzx  r9d,WORD PTR [rdi+0x4]
0x1407117b2: movsxd rcx,edx
0x1407117b5: mov    rax,QWORD PTR [r8+rcx*8]
0x1407117b9: cmp    WORD PTR [rax],r9w
0x1407117bd: je     0x1407117c9
0x1407117bf: dec    edx
0x1407117c1: sub    rcx,0x1
0x1407117c5: jns    0x1407117b5
0x1407117c7: jmp    0x1407117d8
0x1407117c9: movsxd rcx,edx
0x1407117cc: mov    rax,QWORD PTR [r12+0x130]
0x1407117d4: mov    rbx,QWORD PTR [rax+rcx*8]
0x1407117d8: cmp    edx,0xffffffff
0x1407117db: jne    0x140711881
0x1407117e1: mov    ecx,0x50
0x1407117e6: call   0x141539690
0x1407117eb: mov    rbx,rax
0x1407117ee: mov    QWORD PTR [rbp+0x90],rax
0x1407117f5: mov    ecx,0xffffffff
0x1407117fa: mov    WORD PTR [rax],cx
0x1407117fd: xor    eax,eax
0x1407117ff: mov    QWORD PTR [rbx+0x4],rax
0x140711803: mov    QWORD PTR [rbx+0xc],rax
0x140711807: mov    WORD PTR [rbx+0x14],cx
0x14071180b: mov    QWORD PTR [rbx+0x18],rax
0x14071180f: mov    QWORD PTR [rbx+0x20],0xffffffffffffffff
0x140711817: mov    DWORD PTR [rbx+0x28],eax
0x14071181a: mov    WORD PTR [rbx+0x2c],ax
0x14071181e: mov    DWORD PTR [rbx+0x30],eax
0x140711821: mov    WORD PTR [rbx+0x34],ax
0x140711825: mov    QWORD PTR [rbx+0x38],rax
0x140711829: mov    DWORD PTR [rbx+0x40],eax
0x14071182c: mov    WORD PTR [rbx+0x44],ax
0x140711830: mov    QWORD PTR [rbx+0x48],rax
0x140711834: mov    QWORD PTR [rbp+0x90],rbx
0x14071183b: movzx  eax,WORD PTR [rdi+0x4]
0x14071183f: mov    WORD PTR [rbx],ax
0x140711842: movsx  rcx,WORD PTR [rdi+0x4]
0x140711847: mov    rax,QWORD PTR [r12+0x50]
0x14071184c: test   DWORD PTR [rax+rcx*4],0x200000
0x140711853: je     0x140711859
0x140711855: mov    BYTE PTR [rbx+0x28],0x1
0x140711859: lea    rcx,[r12+0x130]
0x140711861: mov    rdx,QWORD PTR [rcx+0x8]
0x140711865: cmp    rdx,QWORD PTR [rcx+0x10]
0x140711869: je     0x140711875
0x14071186b: mov    QWORD PTR [rdx],rbx
0x14071186e: add    QWORD PTR [rcx+0x8],0x8
0x140711873: jmp    0x140711881
0x140711875: lea    r8,[rbp+0x90]
0x14071187c: call   0x140070bd0
0x140711881: mov    eax,DWORD PTR [rdi+0x6c]
0x140711884: add    DWORD PTR [rbx+0x8],eax
0x140711887: mov    eax,DWORD PTR [rdi+0x84]
0x14071188d: add    DWORD PTR [rbx+0xc],eax
0x140711890: test   DWORD PTR [rdi+0x64],0x8000
0x140711897: je     0x14071189d
0x140711899: mov    BYTE PTR [rbx+0x29],0x1
0x14071189d: test   BYTE PTR [rdi+0x68],0x4
0x1407118a1: je     0x1407118a7
0x1407118a3: mov    BYTE PTR [rbx+0x2a],0x1
0x1407118a7: mov    rax,QWORD PTR [rdi+0x50]
0x1407118ab: sub    rax,QWORD PTR [rdi+0x48]
0x1407118af: sar    rax,1
0x1407118b2: sub    eax,0x1
0x1407118b5: movsxd r8,eax
0x1407118b8: js     0x1407118fd
0x1407118ba: lea    r9,[r8+r8*1]
0x1407118be: xchg   ax,ax
0x1407118c0: mov    rcx,QWORD PTR [rdi+0x18]
0x1407118c4: lea    rdx,[r8+r8*1]
0x1407118c8: movsx  eax,WORD PTR [r9+rcx*1]
0x1407118cd: cmp    eax,DWORD PTR [rbx+0x10]
0x1407118d0: jle    0x1407118e5
0x1407118d2: movsx  eax,WORD PTR [rdx+rcx*1]
0x1407118d6: mov    DWORD PTR [rbx+0x10],eax
0x1407118d9: mov    rax,QWORD PTR [rdi+0x48]
0x1407118dd: movzx  ecx,WORD PTR [rdx+rax*1]
0x1407118e1: mov    WORD PTR [rbx+0x14],cx
0x1407118e5: mov    rax,QWORD PTR [rdi+0x18]
0x1407118e9: cmp    WORD PTR [rdx+rax*1],0x0
0x1407118ee: jle    0x1407118f3
0x1407118f0: inc    DWORD PTR [rbx+0x18]
0x1407118f3: sub    r8,0x1
0x1407118f7: lea    r9,[r9-0x2]
0x1407118fb: jns    0x1407118c0
0x1407118fd: movsx  r9,WORD PTR [rdi+0x6]
0x140711902: cmp    r9w,0xffff
0x140711907: je     0x140711a76
0x14071190d: movsx  rax,WORD PTR [r12+0x11c]
0x140711916: test   ax,ax
0x140711919: js     0x140711994
0x14071191b: mov    rcx,rax
0x14071191e: mov    rax,QWORD PTR [rip+0x1ddb14b]        # 0x1424eca70
0x140711925: mov    rdx,QWORD PTR [rip+0x1ddb13c]        # 0x1424eca68
0x14071192c: sub    rax,rdx
0x14071192f: sar    rax,0x3
0x140711933: cmp    rcx,rax
0x140711936: jae    0x140711994
0x140711938: mov    r8,QWORD PTR [rdx+rcx*8]
0x14071193c: test   r8,r8
0x14071193f: je     0x140711994
0x140711941: mov    rax,QWORD PTR [r12+0x48]
0x140711946: movsx  rcx,WORD PTR [rdi+0x4]
0x14071194b: mov    rax,QWORD PTR [rax]
0x14071194e: mov    rax,QWORD PTR [rax+rcx*8]
0x140711952: mov    rax,QWORD PTR [rax+0x58]
0x140711956: mov    rcx,QWORD PTR [rax+r9*8]
0x14071195a: movsxd rdx,DWORD PTR [rcx+0x20]
0x14071195e: mov    rax,QWORD PTR [r8+0x208]
0x140711965: mov    rax,QWORD PTR [rax+rdx*8]
0x140711969: cmp    DWORD PTR [rax+0x28],0x0
0x14071196d: jle    0x140711994
0x14071196f: mov    rax,QWORD PTR [rax+0x20]
0x140711973: test   BYTE PTR [rax],0x10
0x140711976: je     0x140711994
0x140711978: movzx  eax,WORD PTR [rdi+0x98]
0x14071197f: cmp    ax,0x64
0x140711983: jl     0x14071198b
0x140711985: mov    BYTE PTR [rbx+0x2b],0x1
0x140711989: jmp    0x140711994
0x14071198b: test   ax,ax
0x14071198e: jle    0x140711994
0x140711990: mov    BYTE PTR [rbx+0x2c],0x1
0x140711994: cmp    DWORD PTR [rdi+0xa0],0x0
0x14071199b: jle    0x1407119a1
0x14071199d: mov    BYTE PTR [rbx+0x2d],0x1
0x1407119a1: movsx  edx,WORD PTR [rdi+0x98]
0x1407119a8: test   dx,dx
0x1407119ab: jle    0x1407119e9
0x1407119ad: movsx  rcx,WORD PTR [rdi+0x4]
0x1407119b2: movsx  eax,WORD PTR [rdi+0x6]
0x1407119b6: mov    r10,QWORD PTR [rbp-0x10]
0x1407119ba: cmp    DWORD PTR [r10+rcx*4],eax
0x1407119be: jne    0x140711a0a
0x1407119c0: cmp    edx,DWORD PTR [rbx+0x3c]
0x1407119c3: jle    0x1407119e4
0x1407119c5: mov    eax,DWORD PTR [rdi+0x64]
0x1407119c8: mov    DWORD PTR [rbx+0x30],eax
0x1407119cb: movzx  eax,WORD PTR [rdi+0xc]
0x1407119cf: mov    WORD PTR [rbx+0x34],ax
0x1407119d3: movsx  eax,WORD PTR [rdi+0x60]
0x1407119d7: mov    DWORD PTR [rbx+0x38],eax
0x1407119da: movsx  eax,WORD PTR [rdi+0x98]
0x1407119e1: mov    DWORD PTR [rbx+0x3c],eax
0x1407119e4: inc    DWORD PTR [rbx+0x40]
0x1407119e7: jmp    0x140711a0a
0x1407119e9: mov    eax,DWORD PTR [rdi+0x10]
0x1407119ec: test   eax,eax
0x1407119ee: jle    0x140711a06
0x1407119f0: cmp    eax,DWORD PTR [rbx+0x48]
0x1407119f3: jle    0x140711a03
0x1407119f5: movzx  eax,WORD PTR [rdi+0xc]
0x1407119f9: mov    WORD PTR [rbx+0x44],ax
0x1407119fd: mov    eax,DWORD PTR [rdi+0x10]
0x140711a00: mov    DWORD PTR [rbx+0x48],eax
0x140711a03: inc    DWORD PTR [rbx+0x4c]
0x140711a06: mov    r10,QWORD PTR [rbp-0x10]
0x140711a0a: test   DWORD PTR [rdi+0x64],0x10000000
0x140711a11: je     0x140711a76
0x140711a13: movsx  rax,WORD PTR [rdi+0x4]
0x140711a18: mov    r8d,DWORD PTR [r10+rax*4]
0x140711a1c: cmp    r8d,0xffffffff
0x140711a20: je     0x140711a76
0x140711a22: mov    r9,QWORD PTR [r15+0x8]
0x140711a26: mov    rcx,QWORD PTR [r15+0x10]
0x140711a2a: sub    rcx,r9
0x140711a2d: sar    rcx,0x3
0x140711a31: sub    ecx,0x1
0x140711a34: js     0x140711a55
0x140711a36: movsxd rdx,ecx
0x140711a39: nop    DWORD PTR [rax+0x0]
0x140711a40: mov    rax,QWORD PTR [r9+rdx*8]
0x140711a44: cmp    DWORD PTR [rax+0x9c],r8d
0x140711a4b: je     0x140711a55
0x140711a4d: dec    ecx
0x140711a4f: sub    rdx,0x1
0x140711a53: jns    0x140711a40
0x140711a55: cmp    ecx,0xffffffff
0x140711a58: je     0x140711a76
0x140711a5a: inc    DWORD PTR [rbx+0x1c]
0x140711a5d: cmp    DWORD PTR [rbx+0x20],0xffffffff
0x140711a61: je     0x140711a76
0x140711a63: movsx  eax,WORD PTR [rdi+0x6]
0x140711a67: mov    DWORD PTR [rbx+0x20],eax
0x140711a6a: movsx  rax,WORD PTR [rdi+0x4]
0x140711a6f: mov    ecx,DWORD PTR [r10+rax*4]
0x140711a73: mov    DWORD PTR [rbx+0x24],ecx
0x140711a76: sub    r14,0x1
0x140711a7a: jns    0x1407115d0
0x140711a80: mov    r13,QWORD PTR [rbp+0x98]
0x140711a87: xor    r10d,r10d
0x140711a8a: sub    r13,0x1
0x140711a8e: mov    QWORD PTR [rbp+0x98],r13
0x140711a95: jns    0x1407115a0
0x140711a9b: lea    r15,[r12+0x148]
0x140711aa3: mov    rax,QWORD PTR [r12+0x138]
0x140711aab: sub    rax,QWORD PTR [r12+0x130]
0x140711ab3: sar    rax,0x3
0x140711ab7: test   rax,rax
0x140711aba: je     0x140711bc1
0x140711ac0: sub    eax,0x1
0x140711ac3: movsxd r10,eax
0x140711ac6: js     0x140711b97
0x140711acc: nop    DWORD PTR [rax+0x0]
0x140711ad0: mov    rax,QWORD PTR [r12+0x130]
0x140711ad8: mov    r9,QWORD PTR [rax+r10*8]
0x140711adc: mov    ecx,DWORD PTR [r9+0xc]
0x140711ae0: add    ecx,0x3e7
0x140711ae6: mov    eax,0x10624dd3
0x140711aeb: imul   ecx
0x140711aed: mov    r8d,edx
0x140711af0: sar    r8d,0x6
0x140711af4: mov    eax,r8d
0x140711af7: shr    eax,0x1f
0x140711afa: add    r8d,eax
0x140711afd: mov    ecx,DWORD PTR [r9+0x8]
0x140711b01: add    ecx,0x9
0x140711b04: mov    eax,0x66666667
0x140711b09: imul   ecx
0x140711b0b: sar    edx,0x2
0x140711b0e: mov    ecx,edx
0x140711b10: shr    ecx,0x1f
0x140711b13: add    r8d,edx
0x140711b16: add    r8d,ecx
0x140711b19: add    r8d,DWORD PTR [r9+0x10]
0x140711b1d: cmp    DWORD PTR [r9+0x1c],0x0
0x140711b22: jle    0x140711b28
0x140711b24: add    r8d,0x32
0x140711b28: cmp    BYTE PTR [r9+0x29],0x0
0x140711b2d: je     0x140711b33
0x140711b2f: add    r8d,0x64
0x140711b33: cmp    BYTE PTR [r9+0x2d],0x0
0x140711b38: je     0x140711b3e
0x140711b3a: add    r8d,0x64
0x140711b3e: cmp    BYTE PTR [r9+0x2a],0x0
0x140711b43: je     0x140711b49
0x140711b45: add    r8d,0x4b
0x140711b49: cmp    BYTE PTR [r9+0x2b],0x0
0x140711b4e: je     0x140711b54
0x140711b50: add    r8d,0x32
0x140711b54: cmp    BYTE PTR [r9+0x2c],0x0
0x140711b59: je     0x140711b5f
0x140711b5b: add    r8d,0x19
0x140711b5f: mov    ecx,DWORD PTR [r9+0x48]
0x140711b63: add    ecx,0xf423f
0x140711b69: mov    eax,0x431bde83
0x140711b6e: imul   ecx
0x140711b70: sar    edx,0x12
0x140711b73: mov    eax,edx
0x140711b75: shr    eax,0x1f
0x140711b78: add    edx,eax
0x140711b7a: add    edx,DWORD PTR [r9+0x3c]
0x140711b7e: add    edx,r8d
0x140711b81: mov    DWORD PTR [r9+0x4],edx
0x140711b85: sub    r10,0x1
0x140711b89: jns    0x140711ad0
0x140711b8f: lea    r15,[r12+0x148]
0x140711b97: mov    rcx,QWORD PTR [r12+0x130]
0x140711b9f: mov    rdx,QWORD PTR [r12+0x138]
0x140711ba7: sub    rdx,rcx
0x140711baa: sar    rdx,0x3
0x140711bae: lea    r9,[rip+0xffffffffffffa66b]        # 0x14070c220
0x140711bb5: mov    r8d,0x8
0x140711bbb: call   QWORD PTR [rip+0xed419f]        # 0x1415e5d60
0x140711bc1: mov    rdx,QWORD PTR [r15+0x8]
0x140711bc5: sub    rdx,QWORD PTR [r15]
0x140711bc8: sar    rdx,0x3
0x140711bcc: sub    edx,0x1
0x140711bcf: mov    DWORD PTR [rbp+0x90],edx
0x140711bd5: js     0x1407121c0
0x140711bdb: movsxd rbx,edx
0x140711bde: shl    rbx,0x3
0x140711be2: mov    QWORD PTR [rbp+0x98],rbx
0x140711be9: nop    DWORD PTR [rax+0x0]
0x140711bf0: mov    rax,QWORD PTR [r15]
0x140711bf3: mov    rcx,QWORD PTR [rax+rbx*1]
0x140711bf7: mov    rax,QWORD PTR [rcx+0x10]
0x140711bfb: sub    rax,QWORD PTR [rcx+0x8]
0x140711bff: sar    rax,0x2
0x140711c03: test   rax,rax
0x140711c06: je     0x140711d17
0x140711c0c: lea    esi,[rax-0x1]
0x140711c0f: test   esi,esi
0x140711c11: js     0x140711d17
0x140711c17: movsxd rax,esi
0x140711c1a: lea    r14,[rax*4+0x0]
0x140711c22: mov    r13,r14
0x140711c25: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x140711c30: mov    rdx,QWORD PTR [r12+0x8]
0x140711c35: mov    rax,QWORD PTR [r15]
0x140711c38: mov    rax,QWORD PTR [rax+rbx*1]
0x140711c3c: mov    rax,QWORD PTR [rax+0x8]
0x140711c40: movsxd rcx,DWORD PTR [r14+rax*1]
0x140711c44: mov    rax,QWORD PTR [rdx+0x1620]
0x140711c4b: mov    rdx,QWORD PTR [rax+rcx*8]
0x140711c4f: mov    r11,QWORD PTR [rdx+0x80]
0x140711c56: mov    r9,QWORD PTR [rdx+0x88]
0x140711c5d: sub    r9,r11
0x140711c60: sar    r9,1
0x140711c63: sub    r9d,0x1
0x140711c67: movsxd r10,r9d
0x140711c6a: js     0x140711cd6
0x140711c6c: mov    rbx,QWORD PTR [rdx+0x98]
0x140711c73: mov    rdi,QWORD PTR [r12+0x160]
0x140711c7b: nop    DWORD PTR [rax+rax*1+0x0]
0x140711c80: movsx  rdx,WORD PTR [rbx+r10*2]
0x140711c85: movsx  r8,WORD PTR [r11+r10*2]
0x140711c8a: cmp    BYTE PTR [rdi+r8*1],0x0
0x140711c8f: jne    0x140711cc6
0x140711c91: cmp    dx,0xffff
0x140711c95: je     0x140711cba
0x140711c97: mov    rax,QWORD PTR [r12+0x48]
0x140711c9c: mov    rcx,QWORD PTR [rax]
0x140711c9f: mov    rax,QWORD PTR [rcx+r8*8]
0x140711ca3: mov    rax,QWORD PTR [rax+0x58]
0x140711ca7: mov    rcx,QWORD PTR [rax+rdx*8]
0x140711cab: movsxd rdx,DWORD PTR [rcx+0x68]
0x140711caf: mov    rax,QWORD PTR [r12+0x68]
0x140711cb4: test   BYTE PTR [rax+rdx*4],0x1
0x140711cb8: je     0x140711ccf
0x140711cba: mov    rax,QWORD PTR [r12+0x50]
0x140711cbf: test   BYTE PTR [rax+r8*4],0x2
0x140711cc4: je     0x140711ccf
0x140711cc6: dec    r9d
0x140711cc9: sub    r10,0x1
0x140711ccd: jns    0x140711c80
0x140711ccf: mov    rbx,QWORD PTR [rbp+0x98]
0x140711cd6: cmp    r9d,0xffffffff
0x140711cda: jne    0x140711cff
0x140711cdc: mov    rax,QWORD PTR [r15]
0x140711cdf: mov    rbx,QWORD PTR [rax+rbx*1]
0x140711ce3: mov    rcx,QWORD PTR [rbx+0x8]
0x140711ce7: add    rcx,r13
0x140711cea: mov    r8,QWORD PTR [rbx+0x10]
0x140711cee: lea    rdx,[rcx+0x4]
0x140711cf2: sub    r8,rdx
0x140711cf5: call   0x14153ae1a
0x140711cfa: add    QWORD PTR [rbx+0x10],0xfffffffffffffffc
0x140711cff: sub    r13,0x4
0x140711d03: sub    r14,0x4
0x140711d07: sub    esi,0x1
0x140711d0a: mov    rbx,QWORD PTR [rbp+0x98]
0x140711d11: jns    0x140711c30
0x140711d17: mov    rax,QWORD PTR [r15]
0x140711d1a: mov    rcx,QWORD PTR [rax+rbx*1]
0x140711d1e: mov    rax,QWORD PTR [rcx+0x70]
0x140711d22: sub    rax,QWORD PTR [rcx+0x68]
0x140711d26: sar    rax,0x2
0x140711d2a: test   rax,rax
0x140711d2d: je     0x140711e37
0x140711d33: lea    esi,[rax-0x1]
0x140711d36: test   esi,esi
0x140711d38: js     0x140711e37
0x140711d3e: movsxd rax,esi
0x140711d41: lea    r14,[rax*4+0x0]
0x140711d49: mov    r13,r14
0x140711d4c: nop    DWORD PTR [rax+0x0]
0x140711d50: mov    rdx,QWORD PTR [r12+0x8]
0x140711d55: mov    rax,QWORD PTR [r15]
0x140711d58: mov    rax,QWORD PTR [rbx+rax*1]
0x140711d5c: mov    rax,QWORD PTR [rax+0x68]
0x140711d60: movsxd rcx,DWORD PTR [r14+rax*1]
0x140711d64: mov    rax,QWORD PTR [rdx+0x16c8]
0x140711d6b: mov    rdx,QWORD PTR [rax+rcx*8]
0x140711d6f: mov    r11,QWORD PTR [rdx+0x30]
0x140711d73: mov    r9,QWORD PTR [rdx+0x38]
0x140711d77: sub    r9,r11
0x140711d7a: sar    r9,1
0x140711d7d: sub    r9d,0x1
0x140711d81: movsxd r10,r9d
0x140711d84: js     0x140711df6
0x140711d86: mov    rbx,QWORD PTR [rdx+0x48]
0x140711d8a: mov    rdi,QWORD PTR [r12+0x160]
0x140711d92: nop    DWORD PTR [rax+0x0]
0x140711d96: data16 nop WORD PTR [rax+rax*1+0x0]
0x140711da0: movsx  rdx,WORD PTR [rbx+r10*2]
0x140711da5: movsx  r8,WORD PTR [r11+r10*2]
0x140711daa: cmp    BYTE PTR [rdi+r8*1],0x0
0x140711daf: jne    0x140711de6
0x140711db1: cmp    dx,0xffff
0x140711db5: je     0x140711dda
0x140711db7: mov    rax,QWORD PTR [r12+0x48]
0x140711dbc: mov    rcx,QWORD PTR [rax]
0x140711dbf: mov    rax,QWORD PTR [rcx+r8*8]
0x140711dc3: mov    rax,QWORD PTR [rax+0x58]
0x140711dc7: mov    rcx,QWORD PTR [rax+rdx*8]
0x140711dcb: movsxd rdx,DWORD PTR [rcx+0x68]
0x140711dcf: mov    rax,QWORD PTR [r12+0x68]
0x140711dd4: test   BYTE PTR [rax+rdx*4],0x1
0x140711dd8: je     0x140711def
0x140711dda: mov    rax,QWORD PTR [r12+0x50]
0x140711ddf: test   BYTE PTR [rax+r8*4],0x2
0x140711de4: je     0x140711def
0x140711de6: dec    r9d
0x140711de9: sub    r10,0x1
0x140711ded: jns    0x140711da0
0x140711def: mov    rbx,QWORD PTR [rbp+0x98]
0x140711df6: cmp    r9d,0xffffffff
0x140711dfa: jne    0x140711e1f
0x140711dfc: mov    rax,QWORD PTR [r15]
0x140711dff: mov    rbx,QWORD PTR [rbx+rax*1]
0x140711e03: mov    rcx,QWORD PTR [rbx+0x68]
0x140711e07: add    rcx,r13
0x140711e0a: mov    r8,QWORD PTR [rbx+0x70]
0x140711e0e: lea    rdx,[rcx+0x4]
0x140711e12: sub    r8,rdx
0x140711e15: call   0x14153ae1a
0x140711e1a: add    QWORD PTR [rbx+0x70],0xfffffffffffffffc
0x140711e1f: sub    r13,0x4
0x140711e23: sub    r14,0x4
0x140711e27: sub    esi,0x1
0x140711e2a: mov    rbx,QWORD PTR [rbp+0x98]
0x140711e31: jns    0x140711d50
0x140711e37: mov    rax,QWORD PTR [r15]
0x140711e3a: mov    rcx,QWORD PTR [rbx+rax*1]
0x140711e3e: mov    rax,QWORD PTR [rcx+0xa0]
0x140711e45: sub    rax,QWORD PTR [rcx+0x98]
0x140711e4c: sar    rax,0x2
0x140711e50: test   rax,rax
0x140711e53: je     0x140711f79
0x140711e59: lea    edi,[rax-0x1]
0x140711e5c: test   edi,edi
0x140711e5e: js     0x140711f79
0x140711e64: movsxd rax,edi
0x140711e67: lea    rsi,[rax*4+0x0]
0x140711e6f: mov    r14,rsi
0x140711e72: nop    DWORD PTR [rax+0x0]
0x140711e76: data16 nop WORD PTR [rax+rax*1+0x0]
0x140711e80: mov    rdx,QWORD PTR [r12+0x8]
0x140711e85: add    rdx,0x16e0
0x140711e8c: mov    rax,QWORD PTR [r15]
0x140711e8f: mov    rax,QWORD PTR [rbx+rax*1]
0x140711e93: mov    rax,QWORD PTR [rax+0x98]
0x140711e9a: movsxd rcx,DWORD PTR [rsi+rax*1]
0x140711e9e: mov    rax,QWORD PTR [r12+0xc8]
0x140711ea6: mov    ecx,DWORD PTR [rax+rcx*4]
0x140711ea9: call   0x1400e1560
0x140711eae: test   rax,rax
0x140711eb1: je     0x140711f61
0x140711eb7: mov    r11,QWORD PTR [rax+0x20]
0x140711ebb: mov    r9,QWORD PTR [rax+0x28]
0x140711ebf: sub    r9,r11
0x140711ec2: sar    r9,1
0x140711ec5: sub    r9d,0x1
0x140711ec9: movsxd r10,r9d
0x140711ecc: js     0x140711f2f
0x140711ece: mov    rbx,QWORD PTR [rax+0x38]
0x140711ed2: nop    DWORD PTR [rax+0x0]
0x140711ed6: data16 nop WORD PTR [rax+rax*1+0x0]
0x140711ee0: movsx  rdx,WORD PTR [rbx+r10*2]
0x140711ee5: movsx  r8,WORD PTR [r11+r10*2]
0x140711eea: cmp    dx,0xffff
0x140711eee: je     0x140711f13
0x140711ef0: mov    rax,QWORD PTR [r12+0x48]
0x140711ef5: mov    rcx,QWORD PTR [rax]
0x140711ef8: mov    rax,QWORD PTR [rcx+r8*8]
0x140711efc: mov    rax,QWORD PTR [rax+0x58]
0x140711f00: mov    rcx,QWORD PTR [rax+rdx*8]
0x140711f04: movsxd rdx,DWORD PTR [rcx+0x68]
0x140711f08: mov    rax,QWORD PTR [r12+0x68]
0x140711f0d: test   BYTE PTR [rax+rdx*4],0x1
0x140711f11: je     0x140711f28
0x140711f13: mov    rax,QWORD PTR [r12+0x50]
0x140711f18: test   BYTE PTR [rax+r8*4],0x2
0x140711f1d: je     0x140711f28
0x140711f1f: dec    r9d
0x140711f22: sub    r10,0x1
0x140711f26: jns    0x140711ee0
0x140711f28: mov    rbx,QWORD PTR [rbp+0x98]
0x140711f2f: cmp    r9d,0xffffffff
0x140711f33: jne    0x140711f61
0x140711f35: mov    rax,QWORD PTR [r15]
0x140711f38: mov    rbx,QWORD PTR [rax+rbx*1]
0x140711f3c: mov    rcx,QWORD PTR [rbx+0x98]
0x140711f43: add    rcx,r14
0x140711f46: mov    r8,QWORD PTR [rbx+0xa0]
0x140711f4d: lea    rdx,[rcx+0x4]
0x140711f51: sub    r8,rdx
0x140711f54: call   0x14153ae1a
0x140711f59: add    QWORD PTR [rbx+0xa0],0xfffffffffffffffc
0x140711f61: sub    r14,0x4
0x140711f65: sub    rsi,0x4
0x140711f69: sub    edi,0x1
0x140711f6c: mov    rbx,QWORD PTR [rbp+0x98]
0x140711f73: jns    0x140711e80
0x140711f79: mov    rax,QWORD PTR [r15]
0x140711f7c: mov    rcx,QWORD PTR [rbx+rax*1]
0x140711f80: mov    rdi,QWORD PTR [rcx+0xb8]
0x140711f87: sub    rdi,QWORD PTR [rcx+0xb0]
0x140711f8e: sar    rdi,0x2
0x140711f92: test   rdi,rdi
0x140711f95: je     0x140712054
0x140711f9b: sub    edi,0x1
0x140711f9e: js     0x140712054
0x140711fa4: movsxd rax,edi
0x140711fa7: lea    rsi,[rax*4+0x0]
0x140711faf: mov    r14,rsi
0x140711fb2: mov    rax,QWORD PTR [r15]
0x140711fb5: mov    rbx,QWORD PTR [rbx+rax*1]
0x140711fb9: mov    rax,QWORD PTR [rbx+0xb0]
0x140711fc0: mov    rcx,QWORD PTR [r12+0x48]
0x140711fc5: movsx  rdx,WORD PTR [rsi+rax*1]
0x140711fca: mov    rcx,QWORD PTR [rcx]
0x140711fcd: mov    rdx,QWORD PTR [rcx+rdx*8]
0x140711fd1: movsx  rcx,WORD PTR [rdx+0x40]
0x140711fd6: cmp    cx,0xffff
0x140711fda: je     0x14071203c
0x140711fdc: mov    rdx,rcx
0x140711fdf: mov    rcx,QWORD PTR [r12+0x50]
0x140711fe4: test   BYTE PTR [rcx+rdx*4],0x2
0x140711fe8: je     0x14071203c
0x140711fea: lea    rcx,[r14+rax*1]
0x140711fee: mov    r8,QWORD PTR [rbx+0xb8]
0x140711ff5: lea    rdx,[rcx+0x4]
0x140711ff9: sub    r8,rdx
0x140711ffc: call   0x14153ae1a
0x140712001: add    QWORD PTR [rbx+0xb8],0xfffffffffffffffc
0x140712009: mov    rax,QWORD PTR [r15]
0x14071200c: mov    rbx,QWORD PTR [rbp+0x98]
0x140712013: mov    rbx,QWORD PTR [rbx+rax*1]
0x140712017: mov    rcx,QWORD PTR [rbx+0xc8]
0x14071201e: add    rcx,r14
0x140712021: mov    r8,QWORD PTR [rbx+0xd0]
0x140712028: lea    rdx,[rcx+0x4]
0x14071202c: sub    r8,rdx
0x14071202f: call   0x14153ae1a
0x140712034: add    QWORD PTR [rbx+0xd0],0xfffffffffffffffc
0x14071203c: sub    r14,0x4
0x140712040: sub    rsi,0x4
0x140712044: sub    edi,0x1
0x140712047: mov    rbx,QWORD PTR [rbp+0x98]
0x14071204e: jns    0x140711fb2
0x140712054: mov    rax,QWORD PTR [r15]
0x140712057: mov    rcx,QWORD PTR [rax+rbx*1]
0x14071205b: mov    rdi,QWORD PTR [rcx+0xe8]
0x140712062: sub    rdi,QWORD PTR [rcx+0xe0]
0x140712069: sar    rdi,0x3
0x14071206d: test   rdi,rdi
0x140712070: je     0x1407120fd
0x140712076: sub    edi,0x1
0x140712079: js     0x1407120fd
0x14071207f: movsxd rax,edi
0x140712082: lea    rsi,[rax*8+0x0]
0x14071208a: mov    r14,rsi
0x14071208d: nop    DWORD PTR [rax]
0x140712090: mov    rax,QWORD PTR [r15]
0x140712093: mov    rax,QWORD PTR [rax+rbx*1]
0x140712097: mov    rax,QWORD PTR [rax+0xe0]
0x14071209e: mov    rcx,QWORD PTR [rsi+rax*1]
0x1407120a2: movsxd rdx,DWORD PTR [rcx]
0x1407120a5: mov    rax,QWORD PTR [r12+0x160]
0x1407120ad: cmp    BYTE PTR [rdx+rax*1],0x0
0x1407120b1: je     0x1407120f0
0x1407120b3: mov    edx,0x14
0x1407120b8: call   0x141539680
0x1407120bd: mov    rax,QWORD PTR [r15]
0x1407120c0: mov    rbx,QWORD PTR [rax+rbx*1]
0x1407120c4: mov    rcx,QWORD PTR [rbx+0xe0]
0x1407120cb: add    rcx,r14
0x1407120ce: mov    r8,QWORD PTR [rbx+0xe8]
0x1407120d5: lea    rdx,[rcx+0x8]
0x1407120d9: sub    r8,rdx
0x1407120dc: call   0x14153ae1a
0x1407120e1: add    QWORD PTR [rbx+0xe8],0xfffffffffffffff8
0x1407120e9: mov    rbx,QWORD PTR [rbp+0x98]
0x1407120f0: sub    r14,0x8
0x1407120f4: sub    rsi,0x8
0x1407120f8: sub    edi,0x1
0x1407120fb: jns    0x140712090
0x1407120fd: mov    rax,QWORD PTR [r15]
0x140712100: mov    rcx,QWORD PTR [rbx+rax*1]
0x140712104: mov    rax,QWORD PTR [rcx+0x40]
0x140712108: sub    rax,QWORD PTR [rcx+0x38]
0x14071210c: test   rax,0xfffffffffffffffc
0x140712112: jne    0x14071219f
0x140712118: mov    rax,QWORD PTR [rcx+0x10]
0x14071211c: sub    rax,QWORD PTR [rcx+0x8]
0x140712120: test   rax,0xfffffffffffffffc
0x140712126: jne    0x14071219f
0x140712128: mov    rax,QWORD PTR [rcx+0x70]
0x14071212c: sub    rax,QWORD PTR [rcx+0x68]
0x140712130: test   rax,0xfffffffffffffffc
0x140712136: jne    0x14071219f
0x140712138: mov    rax,QWORD PTR [rcx+0xb8]
0x14071213f: sub    rax,QWORD PTR [rcx+0xb0]
0x140712146: test   rax,0xfffffffffffffffc
0x14071214c: jne    0x14071219f
0x14071214e: mov    rax,QWORD PTR [rcx+0xe8]
0x140712155: sub    rax,QWORD PTR [rcx+0xe0]
0x14071215c: test   rax,0xfffffffffffffff8
0x140712162: jne    0x14071219f
0x140712164: mov    rax,QWORD PTR [rcx+0xa0]
0x14071216b: sub    rax,QWORD PTR [rcx+0x98]
0x140712172: test   rax,0xfffffffffffffffc
0x140712178: jne    0x14071219f
0x14071217a: test   rcx,rcx
0x14071217d: je     0x140712184
0x14071217f: call   0x1405c0bc0
0x140712184: mov    rcx,QWORD PTR [r15]
0x140712187: add    rcx,rbx
0x14071218a: mov    r8,QWORD PTR [r15+0x8]
0x14071218e: lea    rdx,[rcx+0x8]
0x140712192: sub    r8,rdx
0x140712195: call   0x14153ae1a
0x14071219a: add    QWORD PTR [r15+0x8],0xfffffffffffffff8
0x14071219f: mov    edx,DWORD PTR [rbp+0x90]
0x1407121a5: dec    edx
0x1407121a7: mov    DWORD PTR [rbp+0x90],edx
0x1407121ad: sub    rbx,0x8
0x1407121b1: mov    QWORD PTR [rbp+0x98],rbx
0x1407121b8: test   edx,edx
0x1407121ba: jns    0x140711bf0
0x1407121c0: lea    rcx,[rbp-0x40]
0x1407121c4: call   0x14013bc30
0x1407121c9: nop
0x1407121ca: lea    rcx,[rbp+0x8]
0x1407121ce: call   0x14013bc30
0x1407121d3: nop
0x1407121d4: lea    rcx,[rbp+0x20]
0x1407121d8: call   0x14013bc30
0x1407121dd: nop
0x1407121de: lea    rcx,[rbp-0x58]
0x1407121e2: call   0x14013bc30
0x1407121e7: nop
0x1407121e8: lea    rcx,[rbp-0x28]
0x1407121ec: call   0x14013bc30
0x1407121f1: nop
0x1407121f2: lea    rcx,[rbp-0x10]
0x1407121f6: call   0x14006f750
0x1407121fb: nop
0x1407121fc: lea    rcx,[rsp+0x58]
0x140712201: call   0x14006f750
0x140712206: nop
0x140712207: lea    rcx,[rbp-0x70]
0x14071220b: call   0x14006f750
0x140712210: nop
0x140712211: lea    rcx,[rsp+0x78]
0x140712216: call   0x14013bc30
0x14071221b: add    rsp,0x148
0x140712222: pop    r15
0x140712224: pop    r14
0x140712226: pop    r13
0x140712228: pop    r12
0x14071222a: pop    rdi
0x14071222b: pop    rsi
0x14071222c: pop    rbx
0x14071222d: pop    rbp
0x14071222e: ret
0x14071222f: nop
0x140712230: and    dh,dh
0x140712232: jo     0x140712234
0x140712234: ss div BYTE PTR [rax+0x0]
0x140712238: sub    al,0xf6
0x14071223a: jo     0x14071223c
0x14071224c: add    DWORD PTR [rcx],eax
0x14071224e: add    DWORD PTR [rcx],eax
0x140712250: add    BYTE PTR [rax],al
0x140712252: add    al,BYTE PTR [rdx]
0x140712254: jae    0x14071224c
0x140712256: jo     0x140712258
0x140712258: jge    0x140712250
0x14071225a: jo     0x14071225c
0x14071225c: add    BYTE PTR [rax],al
0x14071225e: add    BYTE PTR [rcx],al
0x140712260: add    DWORD PTR [rcx],eax
0x140712262: add    DWORD PTR [rcx],eax
0x140712264: add    DWORD PTR [rcx],eax
0x140712266: add    DWORD PTR [rcx],eax
0x140712268: add    DWORD PTR [rcx],eax
0x14071226a: add    DWORD PTR [rcx],eax
0x14071226c: add    DWORD PTR [rcx],eax
0x14071226e: add    DWORD PTR [rcx],eax
0x140712270: add    DWORD PTR [rcx],eax
0x140712272: add    DWORD PTR [rcx],eax
0x140712274: ss div DWORD PTR [rax+0x0]
0x140712278: (bad)
0x140712279: div    DWORD PTR [rax+0x0]
0x14071227c: (bad)
0x14071227d: div    DWORD PTR [rax+0x0]
0x140712290: add    DWORD PTR [rcx],eax
0x140712292: add    DWORD PTR [rcx],eax
0x140712294: add    BYTE PTR [rax],al
0x140712296: add    al,BYTE PTR [rdx]
0x140712298: (bad)
0x140712299: div    DWORD PTR [rax+0x0]
0x14071229c: fdivrp st(7),st
0x14071229e: jo     0x1407122a0
0x1407122a0: add    BYTE PTR [rax],al
0x1407122a2: add    BYTE PTR [rcx],al
0x1407122a4: add    DWORD PTR [rcx],eax
0x1407122a6: add    DWORD PTR [rcx],eax
0x1407122a8: add    DWORD PTR [rcx],eax
0x1407122aa: add    DWORD PTR [rcx],eax
0x1407122ac: add    DWORD PTR [rcx],eax
0x1407122ae: add    DWORD PTR [rcx],eax
0x1407122b0: add    DWORD PTR [rcx],eax
0x1407122b2: add    DWORD PTR [rcx],eax
0x1407122b4: add    DWORD PTR [rcx],eax
0x1407122b6: add    DWORD PTR [rcx],eax
