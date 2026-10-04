0x140c62490: mov    DWORD PTR [rsp+0x20],r9d
0x140c62495: mov    BYTE PTR [rsp+0x18],r8b
0x140c6249a: push   rbp
0x140c6249b: push   rbx
0x140c6249c: push   rsi
0x140c6249d: push   rdi
0x140c6249e: push   r13
0x140c624a0: push   r15
0x140c624a2: mov    rbp,rsp
0x140c624a5: sub    rsp,0x38
0x140c624a9: mov    QWORD PTR [rdx+0x10],0x0
0x140c624b1: mov    esi,r9d
0x140c624b4: cmp    QWORD PTR [rdx+0x18],0xf
0x140c624b9: mov    r15,rdx
0x140c624bc: mov    r13,rcx
0x140c624bf: mov    rax,rdx
0x140c624c2: jbe    0x140c624c7
0x140c624c4: mov    rax,QWORD PTR [rdx]
0x140c624c7: mov    BYTE PTR [rax],0x0
0x140c624ca: mov    rbx,QWORD PTR [rcx+0x38]
0x140c624ce: mov    rdi,QWORD PTR [rcx+0x40]
0x140c624d2: cmp    rbx,rdi
0x140c624d5: jae    0x140c62527
0x140c624d7: mov    rcx,QWORD PTR [rbx]
0x140c624da: mov    rax,QWORD PTR [rcx]
0x140c624dd: call   QWORD PTR [rax+0x10]
0x140c624e0: cmp    eax,0x1
0x140c624e3: je     0x140c624eb
0x140c624e5: add    rbx,0x8
0x140c624e9: jmp    0x140c624d2
0x140c624eb: mov    rcx,QWORD PTR [rbx]
0x140c624ee: mov    rax,QWORD PTR [rcx]
0x140c624f1: call   QWORD PTR [rax+0x40]
0x140c624f4: test   rax,rax
0x140c624f7: je     0x140c62527
0x140c624f9: cmp    BYTE PTR [rax+0x7a],0x0
0x140c624fd: movzx  ebx,BYTE PTR [rbp+0x48]
0x140c62501: je     0x140c62756
0x140c62507: test   bl,bl
0x140c62509: jne    0x140c62756
0x140c6250f: lea    rcx,[rax+0x8]
0x140c62513: mov    rdx,r15
0x140c62516: add    rsp,0x38
0x140c6251a: pop    r15
0x140c6251c: pop    r13
0x140c6251e: pop    rdi
0x140c6251f: pop    rsi
0x140c62520: pop    rbx
0x140c62521: pop    rbp
0x140c62522: jmp    0x140a910b0
0x140c62527: movzx  ebx,BYTE PTR [rbp+0x48]
0x140c6252b: test   bl,bl
0x140c6252d: jne    0x140c62756
0x140c62533: mov    rax,QWORD PTR [r13+0x0]
0x140c62537: mov    rcx,r13
0x140c6253a: call   QWORD PTR [rax]
0x140c6253c: cmp    ax,0x59
0x140c62540: jne    0x140c62558
0x140c62542: cmp    QWORD PTR [r13+0xf8],0x0
0x140c6254a: je     0x140c62558
0x140c6254c: lea    rdx,[r13+0xe8]
0x140c62553: jmp    0x140c62713
0x140c62558: mov    rax,QWORD PTR [r13+0x0]
0x140c6255c: mov    rcx,r13
0x140c6255f: call   QWORD PTR [rax]
0x140c62561: cmp    ax,0x56
0x140c62565: jne    0x140c62756
0x140c6256b: mov    rbx,QWORD PTR [r13+0xd0]
0x140c62572: mov    rdi,QWORD PTR [r13+0xd8]
0x140c62579: nop    DWORD PTR [rax+0x0]
0x140c62580: cmp    rbx,rdi
0x140c62583: jae    0x140c6274f
0x140c62589: mov    rcx,QWORD PTR [rbx]
0x140c6258c: mov    rax,QWORD PTR [rcx]
0x140c6258f: call   QWORD PTR [rax+0x28]
0x140c62592: cmp    eax,0xc
0x140c62595: jne    0x140c62643
0x140c6259b: mov    rax,QWORD PTR [rbx]
0x140c6259e: mov    rsi,QWORD PTR [rax+0x28]
0x140c625a2: mov    rcx,QWORD PTR [rax+0x30]
0x140c625a6: sub    rcx,rsi
0x140c625a9: sar    rcx,0x2
0x140c625ad: test   rcx,rcx
0x140c625b0: je     0x140c62643
0x140c625b6: mov    r10,QWORD PTR [rip+0x187f5f3]        # 0x1424e1bb0
0x140c625bd: mov    r11,QWORD PTR [rip+0x187f5e4]        # 0x1424e1ba8
0x140c625c4: mov    esi,DWORD PTR [rsi]
0x140c625c6: sub    r10,r11
0x140c625c9: sar    r10,0x3
0x140c625cd: test   r10d,r10d
0x140c625d0: je     0x140c62643
0x140c625d2: xor    r9d,r9d
0x140c625d5: cmp    r10d,0x40
0x140c625d9: jle    0x140c62603
0x140c625db: nop    DWORD PTR [rax+rax*1+0x0]
0x140c625e0: mov    r8d,r10d
0x140c625e3: shr    r8d,1
0x140c625e6: lea    edx,[r8+r9*1]
0x140c625ea: movsxd rax,edx
0x140c625ed: mov    rcx,QWORD PTR [r11+rax*8]
0x140c625f1: cmp    esi,DWORD PTR [rcx]
0x140c625f3: cmovl  edx,r9d
0x140c625f7: sub    r10d,r8d
0x140c625fa: mov    r9d,edx
0x140c625fd: cmp    r10d,0x40
0x140c62601: jg     0x140c625e0
0x140c62603: lea    eax,[r9+r10*1]
0x140c62607: cmp    eax,0xffffffff
0x140c6260a: je     0x140c62643
0x140c6260c: cmp    r9d,eax
0x140c6260f: jge    0x140c62643
0x140c62611: movsxd rcx,r9d
0x140c62614: movsxd rdx,eax
0x140c62617: mov    rax,QWORD PTR [r11+rcx*8]
0x140c6261b: cmp    esi,DWORD PTR [rax]
0x140c6261d: je     0x140c6262c
0x140c6261f: inc    r9d
0x140c62622: inc    rcx
0x140c62625: cmp    rcx,rdx
0x140c62628: jl     0x140c62617
0x140c6262a: jmp    0x140c62643
0x140c6262c: movsxd rax,r9d
0x140c6262f: mov    rdx,QWORD PTR [r11+rax*8]
0x140c62633: test   rdx,rdx
0x140c62636: je     0x140c62643
0x140c62638: cmp    QWORD PTR [rdx+0x18],0x0
0x140c6263d: jne    0x140c6270f
0x140c62643: mov    rcx,QWORD PTR [rbx]
0x140c62646: mov    rax,QWORD PTR [rcx]
0x140c62649: call   QWORD PTR [rax+0x28]
0x140c6264c: cmp    eax,0x9
0x140c6264f: jne    0x140c62706
0x140c62655: mov    rax,QWORD PTR [rbx]
0x140c62658: mov    rsi,QWORD PTR [rax+0x30]
0x140c6265c: mov    rcx,QWORD PTR [rax+0x38]
0x140c62660: sub    rcx,rsi
0x140c62663: sar    rcx,0x2
0x140c62667: test   rcx,rcx
0x140c6266a: je     0x140c62706
0x140c62670: mov    r10,QWORD PTR [rip+0x187f539]        # 0x1424e1bb0
0x140c62677: mov    r11,QWORD PTR [rip+0x187f52a]        # 0x1424e1ba8
0x140c6267e: mov    esi,DWORD PTR [rsi]
0x140c62680: sub    r10,r11
0x140c62683: sar    r10,0x3
0x140c62687: test   r10d,r10d
0x140c6268a: je     0x140c62706
0x140c6268c: xor    r9d,r9d
0x140c6268f: cmp    r10d,0x40
0x140c62693: jle    0x140c626c3
0x140c62695: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x140c626a0: mov    r8d,r10d
0x140c626a3: shr    r8d,1
0x140c626a6: lea    edx,[r8+r9*1]
0x140c626aa: movsxd rax,edx
0x140c626ad: mov    rcx,QWORD PTR [r11+rax*8]
0x140c626b1: cmp    esi,DWORD PTR [rcx]
0x140c626b3: cmovl  edx,r9d
0x140c626b7: sub    r10d,r8d
0x140c626ba: mov    r9d,edx
0x140c626bd: cmp    r10d,0x40
0x140c626c1: jg     0x140c626a0
0x140c626c3: lea    eax,[r9+r10*1]
0x140c626c7: cmp    eax,0xffffffff
0x140c626ca: je     0x140c62706
0x140c626cc: cmp    r9d,eax
0x140c626cf: jge    0x140c62706
0x140c626d1: movsxd rcx,r9d
0x140c626d4: movsxd rdx,eax
0x140c626d7: mov    rax,QWORD PTR [r11+rcx*8]
0x140c626db: cmp    esi,DWORD PTR [rax]
0x140c626dd: je     0x140c626f3
0x140c626df: inc    r9d
0x140c626e2: inc    rcx
0x140c626e5: cmp    rcx,rdx
0x140c626e8: jl     0x140c626d7
0x140c626ea: add    rbx,0x8
0x140c626ee: jmp    0x140c62580
0x140c626f3: movsxd rax,r9d
0x140c626f6: mov    rdx,QWORD PTR [r11+rax*8]
0x140c626fa: test   rdx,rdx
0x140c626fd: je     0x140c62706
0x140c626ff: cmp    QWORD PTR [rdx+0x18],0x0
0x140c62704: jne    0x140c6270f
0x140c62706: add    rbx,0x8
0x140c6270a: jmp    0x140c62580
0x140c6270f: add    rdx,0x8
0x140c62713: cmp    r15,rdx
0x140c62716: je     0x140c6272e
0x140c62718: cmp    QWORD PTR [rdx+0x18],0xf
0x140c6271d: mov    r8,QWORD PTR [rdx+0x10]
0x140c62721: jbe    0x140c62726
0x140c62723: mov    rdx,QWORD PTR [rdx]
0x140c62726: mov    rcx,r15
0x140c62729: call   0x14006f860
0x140c6272e: mov    r8d,0x7
0x140c62734: lea    rdx,[rip+0xa866fd]        # 0x1416e8e38  ' (copy)'
0x140c6273b: mov    rcx,r15
0x140c6273e: add    rsp,0x38
0x140c62742: pop    r15
0x140c62744: pop    r13
0x140c62746: pop    rdi
0x140c62747: pop    rsi
0x140c62748: pop    rbx
0x140c62749: pop    rbp
0x140c6274a: jmp    0x14006f9a0
0x140c6274f: movzx  ebx,BYTE PTR [rbp+0x48]
0x140c62753: mov    esi,DWORD PTR [rbp+0x50]
0x140c62756: mov    rax,QWORD PTR [r13+0x0]
0x140c6275a: mov    rcx,r13
0x140c6275d: mov    QWORD PTR [rsp+0x70],r12
0x140c62762: mov    QWORD PTR [rsp+0x30],r14
0x140c62767: call   QWORD PTR [rax+0x508]
0x140c6276d: mov    rdx,QWORD PTR [r13+0x0]
0x140c62771: mov    rcx,r13
0x140c62774: movzx  r14d,ax
0x140c62778: call   QWORD PTR [rdx+0x518]
0x140c6277e: mov    rdx,QWORD PTR [r13+0x0]
0x140c62782: mov    rcx,r13
0x140c62785: movzx  r12d,ax
0x140c62789: call   QWORD PTR [rdx+0x5d8]
0x140c6278f: test   al,al
0x140c62791: jne    0x140c6279c
0x140c62793: cmp    r14w,r12w
0x140c62797: cmovl  r14w,r12w
0x140c6279c: mov    rax,QWORD PTR [r13+0x0]
0x140c627a0: mov    r8d,esi
0x140c627a3: mov    rdx,r15
0x140c627a6: mov    rcx,r13
0x140c627a9: call   QWORD PTR [rax+0x5f0]
0x140c627af: mov    rsi,0xffffffffffffffff
0x140c627b6: test   bl,bl
0x140c627b8: jne    0x140c62bf3
0x140c627be: cmp    DWORD PTR [rip+0xc33aa3],0x1        # 0x141896268
0x140c627c5: jne    0x140c627f7
0x140c627c7: mov    rbx,QWORD PTR [r13+0x38]
0x140c627cb: mov    rdi,QWORD PTR [r13+0x40]
0x140c627cf: nop
0x140c627d0: cmp    rbx,rdi
0x140c627d3: jae    0x140c627f3
0x140c627d5: mov    rcx,QWORD PTR [rbx]
0x140c627d8: mov    rax,QWORD PTR [rcx]
0x140c627db: call   QWORD PTR [rax+0x10]
0x140c627de: cmp    eax,0x1f
0x140c627e1: je     0x140c627e9
0x140c627e3: add    rbx,0x8
0x140c627e7: jmp    0x140c627d0
0x140c627e9: mov    dl,0x24
0x140c627eb: mov    rcx,r15
0x140c627ee: call   0x1400b9b10
0x140c627f3: movzx  ebx,BYTE PTR [rbp+0x48]
0x140c627f7: test   DWORD PTR [r13+0x10],0x400000
0x140c627ff: je     0x140c6280b
0x140c62801: mov    dl,0x13
0x140c62803: mov    rcx,r15
0x140c62806: call   0x1400b9b10
0x140c6280b: mov    rax,QWORD PTR [r13+0x0]
0x140c6280f: mov    rcx,r13
0x140c62812: call   QWORD PTR [rax+0x1d8]
0x140c62818: mov    BYTE PTR [rbp+0x41],0x0
0x140c6281c: cmp    ax,0x3
0x140c62820: jl     0x140c6285c
0x140c62822: mov    BYTE PTR [rbp+0x40],0x58
0x140c62826: lea    rax,[rbp+0x40]
0x140c6282a: mov    r8,rsi
0x140c6282d: nop    DWORD PTR [rax]
0x140c62830: inc    r8
0x140c62833: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62838: jne    0x140c62830
0x140c6283a: lea    rdx,[rbp+0x40]
0x140c6283e: mov    rcx,r15
0x140c62841: call   0x14006f9a0
0x140c62846: lea    rax,[rbp+0x40]
0x140c6284a: mov    r8,rsi
0x140c6284d: nop    DWORD PTR [rax]
0x140c62850: inc    r8
0x140c62853: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62858: jne    0x140c62850
0x140c6285a: jmp    0x140c6289a
0x140c6285c: cmp    ax,0x2
0x140c62860: jne    0x140c6287c
0x140c62862: mov    BYTE PTR [rbp+0x40],0x58
0x140c62866: lea    rax,[rbp+0x40]
0x140c6286a: mov    r8,rsi
0x140c6286d: nop    DWORD PTR [rax]
0x140c62870: inc    r8
0x140c62873: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62878: jne    0x140c62870
0x140c6287a: jmp    0x140c6289a
0x140c6287c: cmp    ax,0x1
0x140c62880: jne    0x140c628a6
0x140c62882: mov    BYTE PTR [rbp+0x40],0x78
0x140c62886: lea    rax,[rbp+0x40]
0x140c6288a: mov    r8,rsi
0x140c6288d: nop    DWORD PTR [rax]
0x140c62890: inc    r8
0x140c62893: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62898: jne    0x140c62890
0x140c6289a: lea    rdx,[rbp+0x40]
0x140c6289e: mov    rcx,r15
0x140c628a1: call   0x14006f9a0
0x140c628a6: cmp    DWORD PTR [rip+0xc339bb],0x0        # 0x141896268
0x140c628ad: jne    0x140c62906
0x140c628af: test   DWORD PTR [r13+0x10],0x4000
0x140c628b7: je     0x140c628da
0x140c628b9: mov    BYTE PTR [rbp+0x40],0x28
0x140c628bd: lea    rax,[rbp+0x40]
0x140c628c1: mov    r8,rsi
0x140c628c4: inc    r8
0x140c628c7: cmp    BYTE PTR [rax+r8*1],0x0
0x140c628cc: jne    0x140c628c4
0x140c628ce: lea    rdx,[rbp+0x40]
0x140c628d2: mov    rcx,r15
0x140c628d5: call   0x14006f9a0
0x140c628da: test   DWORD PTR [r13+0x10],0x80000
0x140c628e2: je     0x140c62906
0x140c628e4: mov    BYTE PTR [rbp+0x40],0x7b
0x140c628e8: lea    rax,[rbp+0x40]
0x140c628ec: mov    r8,rsi
0x140c628ef: nop
0x140c628f0: inc    r8
0x140c628f3: cmp    BYTE PTR [rax+r8*1],0x0
0x140c628f8: jne    0x140c628f0
0x140c628fa: lea    rdx,[rbp+0x40]
0x140c628fe: mov    rcx,r15
0x140c62901: call   0x14006f9a0
0x140c62906: mov    rax,QWORD PTR [r13+0x0]
0x140c6290a: mov    rcx,r13
0x140c6290d: call   QWORD PTR [rax+0x5d8]
0x140c62913: test   al,al
0x140c62915: je     0x140c62a07
0x140c6291b: cmp    DWORD PTR [rip+0x17280a6],0x0        # 0x14238a9c8
0x140c62922: jle    0x140c629e6
0x140c62928: mov    rax,QWORD PTR [rip+0x1728091]        # 0x14238a9c0
0x140c6292f: test   BYTE PTR [rax],0x4
0x140c62932: je     0x140c629e6
0x140c62938: cmp    r12w,0x5
0x140c6293d: jne    0x140c6295c
0x140c6293f: mov    BYTE PTR [rbp+0x40],0xf
0x140c62943: lea    rax,[rbp+0x40]
0x140c62947: mov    r8,rsi
0x140c6294a: nop    WORD PTR [rax+rax*1+0x0]
0x140c62950: inc    r8
0x140c62953: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62958: jne    0x140c62950
0x140c6295a: jmp    0x140c629da
0x140c6295c: cmp    r12w,0x4
0x140c62961: jne    0x140c6297c
0x140c62963: mov    BYTE PTR [rbp+0x40],0xf0
0x140c62967: lea    rax,[rbp+0x40]
0x140c6296b: mov    r8,rsi
0x140c6296e: xchg   ax,ax
0x140c62970: inc    r8
0x140c62973: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62978: jne    0x140c62970
0x140c6297a: jmp    0x140c629da
0x140c6297c: cmp    r12w,0x3
0x140c62981: jne    0x140c6299c
0x140c62983: mov    BYTE PTR [rbp+0x40],0x2a
0x140c62987: lea    rax,[rbp+0x40]
0x140c6298b: mov    r8,rsi
0x140c6298e: xchg   ax,ax
0x140c62990: inc    r8
0x140c62993: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62998: jne    0x140c62990
0x140c6299a: jmp    0x140c629da
0x140c6299c: cmp    r12w,0x2
0x140c629a1: jne    0x140c629bc
0x140c629a3: mov    BYTE PTR [rbp+0x40],0x2b
0x140c629a7: lea    rax,[rbp+0x40]
0x140c629ab: mov    r8,rsi
0x140c629ae: xchg   ax,ax
0x140c629b0: inc    r8
0x140c629b3: cmp    BYTE PTR [rax+r8*1],0x0
0x140c629b8: jne    0x140c629b0
0x140c629ba: jmp    0x140c629da
0x140c629bc: cmp    r12w,0x1
0x140c629c1: jne    0x140c629e6
0x140c629c3: mov    BYTE PTR [rbp+0x40],0x2d
0x140c629c7: lea    rax,[rbp+0x40]
0x140c629cb: mov    r8,rsi
0x140c629ce: xchg   ax,ax
0x140c629d0: inc    r8
0x140c629d3: cmp    BYTE PTR [rax+r8*1],0x0
0x140c629d8: jne    0x140c629d0
0x140c629da: lea    rdx,[rbp+0x40]
0x140c629de: mov    rcx,r15
0x140c629e1: call   0x14006f9a0
0x140c629e6: mov    BYTE PTR [rbp+0x40],0xae
0x140c629ea: lea    rax,[rbp+0x40]
0x140c629ee: mov    r8,rsi
0x140c629f1: inc    r8
0x140c629f4: cmp    BYTE PTR [rax+r8*1],0x0
0x140c629f9: jne    0x140c629f1
0x140c629fb: lea    rdx,[rbp+0x40]
0x140c629ff: mov    rcx,r15
0x140c62a02: call   0x14006f9a0
0x140c62a07: mov    rax,QWORD PTR [r13+0x0]
0x140c62a0b: mov    rcx,r13
0x140c62a0e: call   QWORD PTR [rax+0x5e0]
0x140c62a14: test   rax,rax
0x140c62a17: je     0x140c62a3a
0x140c62a19: mov    BYTE PTR [rbp+0x40],0x11
0x140c62a1d: lea    rax,[rbp+0x40]
0x140c62a21: mov    r8,rsi
0x140c62a24: inc    r8
0x140c62a27: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62a2c: jne    0x140c62a24
0x140c62a2e: lea    rdx,[rbp+0x40]
0x140c62a32: mov    rcx,r15
0x140c62a35: call   0x14006f9a0
0x140c62a3a: cmp    r14w,0x5
0x140c62a3f: jne    0x140c62a93
0x140c62a41: mov    BYTE PTR [rbp+0x40],0xf
0x140c62a45: lea    rax,[rbp+0x40]
0x140c62a49: mov    r8,rsi
0x140c62a4c: nop    DWORD PTR [rax+0x0]
0x140c62a50: inc    r8
0x140c62a53: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62a58: jne    0x140c62a50
0x140c62a5a: lea    rdx,[rbp+0x40]
0x140c62a5e: mov    rcx,r15
0x140c62a61: call   0x14006f9a0
0x140c62a66: mov    rax,QWORD PTR [r13+0x0]
0x140c62a6a: movzx  r8d,bl
0x140c62a6e: mov    rdx,r15
0x140c62a71: mov    rcx,r13
0x140c62a74: call   QWORD PTR [rax+0x5e8]
0x140c62a7a: mov    rax,QWORD PTR [r13+0x0]
0x140c62a7e: mov    rcx,r13
0x140c62a81: mov    BYTE PTR [rbp+0x41],0x0
0x140c62a85: call   QWORD PTR [rax+0x1d8]
0x140c62a8b: movzx  ebx,ax
0x140c62a8e: jmp    0x140c62c2a
0x140c62a93: cmp    r14w,0x4
0x140c62a98: jne    0x140c62ae8
0x140c62a9a: mov    BYTE PTR [rbp+0x40],0xf0
0x140c62a9e: lea    rax,[rbp+0x40]
0x140c62aa2: mov    r8,rsi
0x140c62aa5: inc    r8
0x140c62aa8: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62aad: jne    0x140c62aa5
0x140c62aaf: lea    rdx,[rbp+0x40]
0x140c62ab3: mov    rcx,r15
0x140c62ab6: call   0x14006f9a0
0x140c62abb: mov    rax,QWORD PTR [r13+0x0]
0x140c62abf: movzx  r8d,bl
0x140c62ac3: mov    rdx,r15
0x140c62ac6: mov    rcx,r13
0x140c62ac9: call   QWORD PTR [rax+0x5e8]
0x140c62acf: mov    rax,QWORD PTR [r13+0x0]
0x140c62ad3: mov    rcx,r13
0x140c62ad6: mov    BYTE PTR [rbp+0x41],0x0
0x140c62ada: call   QWORD PTR [rax+0x1d8]
0x140c62ae0: movzx  ebx,ax
0x140c62ae3: jmp    0x140c62c48
0x140c62ae8: cmp    r14w,0x3
0x140c62aed: jne    0x140c62b43
0x140c62aef: mov    BYTE PTR [rbp+0x40],0x2a
0x140c62af3: lea    rax,[rbp+0x40]
0x140c62af7: mov    r8,rsi
0x140c62afa: nop    WORD PTR [rax+rax*1+0x0]
0x140c62b00: inc    r8
0x140c62b03: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62b08: jne    0x140c62b00
0x140c62b0a: lea    rdx,[rbp+0x40]
0x140c62b0e: mov    rcx,r15
0x140c62b11: call   0x14006f9a0
0x140c62b16: mov    rax,QWORD PTR [r13+0x0]
0x140c62b1a: movzx  r8d,bl
0x140c62b1e: mov    rdx,r15
0x140c62b21: mov    rcx,r13
0x140c62b24: call   QWORD PTR [rax+0x5e8]
0x140c62b2a: mov    rax,QWORD PTR [r13+0x0]
0x140c62b2e: mov    rcx,r13
0x140c62b31: mov    BYTE PTR [rbp+0x41],0x0
0x140c62b35: call   QWORD PTR [rax+0x1d8]
0x140c62b3b: movzx  ebx,ax
0x140c62b3e: jmp    0x140c62c66
0x140c62b43: cmp    r14w,0x2
0x140c62b48: jne    0x140c62b98
0x140c62b4a: mov    BYTE PTR [rbp+0x40],0x2b
0x140c62b4e: lea    rax,[rbp+0x40]
0x140c62b52: mov    r8,rsi
0x140c62b55: inc    r8
0x140c62b58: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62b5d: jne    0x140c62b55
0x140c62b5f: lea    rdx,[rbp+0x40]
0x140c62b63: mov    rcx,r15
0x140c62b66: call   0x14006f9a0
0x140c62b6b: mov    rax,QWORD PTR [r13+0x0]
0x140c62b6f: movzx  r8d,bl
0x140c62b73: mov    rdx,r15
0x140c62b76: mov    rcx,r13
0x140c62b79: call   QWORD PTR [rax+0x5e8]
0x140c62b7f: mov    rax,QWORD PTR [r13+0x0]
0x140c62b83: mov    rcx,r13
0x140c62b86: mov    BYTE PTR [rbp+0x41],0x0
0x140c62b8a: call   QWORD PTR [rax+0x1d8]
0x140c62b90: movzx  ebx,ax
0x140c62b93: jmp    0x140c62c84
0x140c62b98: cmp    r14w,0x1
0x140c62b9d: jne    0x140c62bf3
0x140c62b9f: mov    BYTE PTR [rbp+0x40],0x2d
0x140c62ba3: lea    rax,[rbp+0x40]
0x140c62ba7: mov    r8,rsi
0x140c62baa: nop    WORD PTR [rax+rax*1+0x0]
0x140c62bb0: inc    r8
0x140c62bb3: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62bb8: jne    0x140c62bb0
0x140c62bba: lea    rdx,[rbp+0x40]
0x140c62bbe: mov    rcx,r15
0x140c62bc1: call   0x14006f9a0
0x140c62bc6: mov    rax,QWORD PTR [r13+0x0]
0x140c62bca: movzx  r8d,bl
0x140c62bce: mov    rdx,r15
0x140c62bd1: mov    rcx,r13
0x140c62bd4: call   QWORD PTR [rax+0x5e8]
0x140c62bda: mov    rax,QWORD PTR [r13+0x0]
0x140c62bde: mov    rcx,r13
0x140c62be1: mov    BYTE PTR [rbp+0x41],0x0
0x140c62be5: call   QWORD PTR [rax+0x1d8]
0x140c62beb: movzx  ebx,ax
0x140c62bee: jmp    0x140c62ca3
0x140c62bf3: mov    rax,QWORD PTR [r13+0x0]
0x140c62bf7: movzx  r8d,bl
0x140c62bfb: mov    rdx,r15
0x140c62bfe: mov    rcx,r13
0x140c62c01: call   QWORD PTR [rax+0x5e8]
0x140c62c07: test   bl,bl
0x140c62c09: jne    0x140c62f33
0x140c62c0f: mov    rax,QWORD PTR [r13+0x0]
0x140c62c13: mov    rcx,r13
0x140c62c16: call   QWORD PTR [rax+0x1d8]
0x140c62c1c: mov    BYTE PTR [rbp+0x41],0x0
0x140c62c20: movzx  ebx,ax
0x140c62c23: cmp    r14w,0x5
0x140c62c28: jne    0x140c62c41
0x140c62c2a: mov    BYTE PTR [rbp+0x40],0xf
0x140c62c2e: lea    rax,[rbp+0x40]
0x140c62c32: mov    r8,rsi
0x140c62c35: inc    r8
0x140c62c38: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62c3d: jne    0x140c62c35
0x140c62c3f: jmp    0x140c62cba
0x140c62c41: cmp    r14w,0x4
0x140c62c46: jne    0x140c62c5f
0x140c62c48: mov    BYTE PTR [rbp+0x40],0xf0
0x140c62c4c: lea    rax,[rbp+0x40]
0x140c62c50: mov    r8,rsi
0x140c62c53: inc    r8
0x140c62c56: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62c5b: jne    0x140c62c53
0x140c62c5d: jmp    0x140c62cba
0x140c62c5f: cmp    r14w,0x3
0x140c62c64: jne    0x140c62c7d
0x140c62c66: mov    BYTE PTR [rbp+0x40],0x2a
0x140c62c6a: lea    rax,[rbp+0x40]
0x140c62c6e: mov    r8,rsi
0x140c62c71: inc    r8
0x140c62c74: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62c79: jne    0x140c62c71
0x140c62c7b: jmp    0x140c62cba
0x140c62c7d: cmp    r14w,0x2
0x140c62c82: jne    0x140c62c9c
0x140c62c84: mov    BYTE PTR [rbp+0x40],0x2b
0x140c62c88: lea    rax,[rbp+0x40]
0x140c62c8c: mov    r8,rsi
0x140c62c8f: nop
0x140c62c90: inc    r8
0x140c62c93: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62c98: jne    0x140c62c90
0x140c62c9a: jmp    0x140c62cba
0x140c62c9c: cmp    r14w,0x1
0x140c62ca1: jne    0x140c62cc6
0x140c62ca3: mov    BYTE PTR [rbp+0x40],0x2d
0x140c62ca7: lea    rax,[rbp+0x40]
0x140c62cab: mov    r8,rsi
0x140c62cae: xchg   ax,ax
0x140c62cb0: inc    r8
0x140c62cb3: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62cb8: jne    0x140c62cb0
0x140c62cba: lea    rdx,[rbp+0x40]
0x140c62cbe: mov    rcx,r15
0x140c62cc1: call   0x14006f9a0
0x140c62cc6: mov    rax,QWORD PTR [r13+0x0]
0x140c62cca: mov    rcx,r13
0x140c62ccd: call   QWORD PTR [rax+0x5e0]
0x140c62cd3: test   rax,rax
0x140c62cd6: je     0x140c62cf9
0x140c62cd8: mov    BYTE PTR [rbp+0x40],0x10
0x140c62cdc: lea    rax,[rbp+0x40]
0x140c62ce0: mov    r8,rsi
0x140c62ce3: inc    r8
0x140c62ce6: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62ceb: jne    0x140c62ce3
0x140c62ced: lea    rdx,[rbp+0x40]
0x140c62cf1: mov    rcx,r15
0x140c62cf4: call   0x14006f9a0
0x140c62cf9: mov    rax,QWORD PTR [r13+0x0]
0x140c62cfd: mov    rcx,r13
0x140c62d00: call   QWORD PTR [rax+0x5d8]
0x140c62d06: test   al,al
0x140c62d08: je     0x140c62df6
0x140c62d0e: mov    BYTE PTR [rbp+0x40],0xaf
0x140c62d12: lea    rax,[rbp+0x40]
0x140c62d16: mov    r8,rsi
0x140c62d19: nop    DWORD PTR [rax+0x0]
0x140c62d20: inc    r8
0x140c62d23: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62d28: jne    0x140c62d20
0x140c62d2a: lea    rdx,[rbp+0x40]
0x140c62d2e: mov    rcx,r15
0x140c62d31: call   0x14006f9a0
0x140c62d36: cmp    DWORD PTR [rip+0x1727c8b],0x0        # 0x14238a9c8
0x140c62d3d: jle    0x140c62df6
0x140c62d43: mov    rax,QWORD PTR [rip+0x1727c76]        # 0x14238a9c0
0x140c62d4a: test   BYTE PTR [rax],0x4
0x140c62d4d: je     0x140c62df6
0x140c62d53: cmp    r12w,0x5
0x140c62d58: jne    0x140c62d71
0x140c62d5a: mov    BYTE PTR [rbp+0x40],0xf
0x140c62d5e: lea    rax,[rbp+0x40]
0x140c62d62: mov    r8,rsi
0x140c62d65: inc    r8
0x140c62d68: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62d6d: jne    0x140c62d65
0x140c62d6f: jmp    0x140c62dea
0x140c62d71: cmp    r12w,0x4
0x140c62d76: jne    0x140c62d8f
0x140c62d78: mov    BYTE PTR [rbp+0x40],0xf0
0x140c62d7c: lea    rax,[rbp+0x40]
0x140c62d80: mov    r8,rsi
0x140c62d83: inc    r8
0x140c62d86: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62d8b: jne    0x140c62d83
0x140c62d8d: jmp    0x140c62dea
0x140c62d8f: cmp    r12w,0x3
0x140c62d94: jne    0x140c62dad
0x140c62d96: mov    BYTE PTR [rbp+0x40],0x2a
0x140c62d9a: lea    rax,[rbp+0x40]
0x140c62d9e: mov    r8,rsi
0x140c62da1: inc    r8
0x140c62da4: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62da9: jne    0x140c62da1
0x140c62dab: jmp    0x140c62dea
0x140c62dad: cmp    r12w,0x2
0x140c62db2: jne    0x140c62dcc
0x140c62db4: mov    BYTE PTR [rbp+0x40],0x2b
0x140c62db8: lea    rax,[rbp+0x40]
0x140c62dbc: mov    r8,rsi
0x140c62dbf: nop
0x140c62dc0: inc    r8
0x140c62dc3: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62dc8: jne    0x140c62dc0
0x140c62dca: jmp    0x140c62dea
0x140c62dcc: cmp    r12w,0x1
0x140c62dd1: jne    0x140c62df6
0x140c62dd3: mov    BYTE PTR [rbp+0x40],0x2d
0x140c62dd7: lea    rax,[rbp+0x40]
0x140c62ddb: mov    r8,rsi
0x140c62dde: xchg   ax,ax
0x140c62de0: inc    r8
0x140c62de3: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62de8: jne    0x140c62de0
0x140c62dea: lea    rdx,[rbp+0x40]
0x140c62dee: mov    rcx,r15
0x140c62df1: call   0x14006f9a0
0x140c62df6: cmp    DWORD PTR [rip+0xc3346b],0x0        # 0x141896268
0x140c62dfd: jne    0x140c62e56
0x140c62dff: test   DWORD PTR [r13+0x10],0x80000
0x140c62e07: je     0x140c62e2a
0x140c62e09: mov    BYTE PTR [rbp+0x40],0x7d
0x140c62e0d: lea    rax,[rbp+0x40]
0x140c62e11: mov    r8,rsi
0x140c62e14: inc    r8
0x140c62e17: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62e1c: jne    0x140c62e14
0x140c62e1e: lea    rdx,[rbp+0x40]
0x140c62e22: mov    rcx,r15
0x140c62e25: call   0x14006f9a0
0x140c62e2a: test   DWORD PTR [r13+0x10],0x4000
0x140c62e32: je     0x140c62e56
0x140c62e34: mov    BYTE PTR [rbp+0x40],0x29
0x140c62e38: lea    rax,[rbp+0x40]
0x140c62e3c: mov    r8,rsi
0x140c62e3f: nop
0x140c62e40: inc    r8
0x140c62e43: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62e48: jne    0x140c62e40
0x140c62e4a: lea    rdx,[rbp+0x40]
0x140c62e4e: mov    rcx,r15
0x140c62e51: call   0x14006f9a0
0x140c62e56: cmp    bx,0x3
0x140c62e5a: jl     0x140c62e9b
0x140c62e5c: mov    BYTE PTR [rbp+0x40],0x58
0x140c62e60: lea    rax,[rbp+0x40]
0x140c62e64: mov    r8,rsi
0x140c62e67: nop    WORD PTR [rax+rax*1+0x0]
0x140c62e70: inc    r8
0x140c62e73: cmp    BYTE PTR [rax+r8*1],0x0
0x140c62e78: jne    0x140c62e70
0x140c62e7a: lea    rdx,[rbp+0x40]
0x140c62e7e: mov    rcx,r15
0x140c62e81: call   0x14006f9a0
0x140c62e86: lea    rax,[rbp+0x40]
0x140c62e8a: nop    WORD PTR [rax+rax*1+0x0]
0x140c62e90: inc    rsi
0x140c62e93: cmp    BYTE PTR [rax+rsi*1],0x0
0x140c62e97: jne    0x140c62e90
0x140c62e99: jmp    0x140c62ed9
0x140c62e9b: cmp    bx,0x2
0x140c62e9f: jne    0x140c62ebb
0x140c62ea1: mov    BYTE PTR [rbp+0x40],0x58
0x140c62ea5: lea    rax,[rbp+0x40]
0x140c62ea9: nop    DWORD PTR [rax+0x0]
0x140c62eb0: inc    rsi
0x140c62eb3: cmp    BYTE PTR [rax+rsi*1],0x0
0x140c62eb7: jne    0x140c62eb0
0x140c62eb9: jmp    0x140c62ed9
0x140c62ebb: cmp    bx,0x1
0x140c62ebf: jne    0x140c62ee8
0x140c62ec1: mov    BYTE PTR [rbp+0x40],0x78
0x140c62ec5: lea    rax,[rbp+0x40]
0x140c62ec9: nop    DWORD PTR [rax+0x0]
0x140c62ed0: inc    rsi
0x140c62ed3: cmp    BYTE PTR [rax+rsi*1],0x0
0x140c62ed7: jne    0x140c62ed0
0x140c62ed9: mov    r8,rsi
0x140c62edc: lea    rdx,[rbp+0x40]
0x140c62ee0: mov    rcx,r15
0x140c62ee3: call   0x14006f9a0
0x140c62ee8: test   DWORD PTR [r13+0x10],0x400000
0x140c62ef0: je     0x140c62efc
0x140c62ef2: mov    dl,0x13
0x140c62ef4: mov    rcx,r15
0x140c62ef7: call   0x1400b9b10
0x140c62efc: cmp    DWORD PTR [rip+0xc33365],0x1        # 0x141896268
0x140c62f03: jne    0x140c62f33
0x140c62f05: mov    rbx,QWORD PTR [r13+0x38]
0x140c62f09: mov    rdi,QWORD PTR [r13+0x40]
0x140c62f0d: nop    DWORD PTR [rax]
0x140c62f10: cmp    rbx,rdi
0x140c62f13: jae    0x140c62f33
0x140c62f15: mov    rcx,QWORD PTR [rbx]
0x140c62f18: mov    rax,QWORD PTR [rcx]
0x140c62f1b: call   QWORD PTR [rax+0x10]
0x140c62f1e: cmp    eax,0x1f
0x140c62f21: je     0x140c62f29
0x140c62f23: add    rbx,0x8
0x140c62f27: jmp    0x140c62f10
0x140c62f29: mov    dl,0x24
0x140c62f2b: mov    rcx,r15
0x140c62f2e: call   0x1400b9b10
0x140c62f33: mov    r12,QWORD PTR [rsp+0x70]
0x140c62f38: mov    r14,QWORD PTR [rsp+0x30]
0x140c62f3d: add    rsp,0x38
0x140c62f41: pop    r15
0x140c62f43: pop    r13
0x140c62f45: pop    rdi
0x140c62f46: pop    rsi
0x140c62f47: pop    rbx
0x140c62f48: pop    rbp
0x140c62f49: ret
