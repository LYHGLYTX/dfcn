0x1401bf520: mov    QWORD PTR [rsp+0x10],rbx
0x1401bf525: mov    QWORD PTR [rsp+0x18],rsi
0x1401bf52a: mov    QWORD PTR [rsp+0x20],rdi
0x1401bf52f: push   rbp
0x1401bf530: push   r12
0x1401bf532: push   r13
0x1401bf534: push   r14
0x1401bf536: push   r15
0x1401bf538: lea    rbp,[rsp-0xf0]
0x1401bf540: sub    rsp,0x1f0
0x1401bf547: mov    rax,QWORD PTR [rip+0x16dcaf2]        # 0x14189c040
0x1401bf54e: xor    rax,rsp
0x1401bf551: mov    QWORD PTR [rbp+0xe0],rax
0x1401bf558: mov    r14,rcx
0x1401bf55b: mov    QWORD PTR [rbp-0x80],rcx
0x1401bf55f: cmp    BYTE PTR [rip+0x248b10e],0x0        # 0x14264a674
0x1401bf566: jne    0x1401c178d
0x1401bf56c: and    DWORD PTR [rip+0x21d1055],0xfffffffd        # 0x1423905c8
0x1401bf573: mov    edx,0x63
0x1401bf578: lea    rcx,[rip+0x16e2051]        # 0x1418a15d0
0x1401bf57f: call   0x14040b5e0
0x1401bf584: or     DWORD PTR [rip+0x21d103d],0x1        # 0x1423905c8
0x1401bf58b: movzx  ebx,BYTE PTR [rip+0x21d1043]        # 0x1423905d5
0x1401bf592: test   bl,bl
0x1401bf594: je     0x1401bf5ae
0x1401bf596: cmp    BYTE PTR [rip+0x21d1036],0x0        # 0x1423905d3
0x1401bf59d: jne    0x1401bf5ae
0x1401bf59f: mov    BYTE PTR [r14+0x1a0],0x0
0x1401bf5a7: movzx  ebx,BYTE PTR [rip+0x21d1027]        # 0x1423905d5
0x1401bf5ae: mov    eax,DWORD PTR [r14+0x1b4]
0x1401bf5b5: dec    eax
0x1401bf5b7: cmp    eax,0x6
0x1401bf5ba: ja     0x1401c178d
0x1401bf5c0: cdqe
0x1401bf5c2: lea    rdx,[rip+0xffffffffffe40a37]        # 0x140000000
0x1401bf5c9: mov    ecx,DWORD PTR [rdx+rax*4+0x1c17c0]
0x1401bf5d0: add    rcx,rdx
0x1401bf5d3: jmp    rcx
0x1401bf5d5: mov    esi,0xffffffff
0x1401bf5da: test   bl,bl
0x1401bf5dc: cmovne esi,DWORD PTR [rip+0x248afd1]        # 0x14264a5b4
0x1401bf5e3: lea    rdx,[rsp+0x64]
0x1401bf5e8: lea    rcx,[rsp+0x60]
0x1401bf5ed: call   0x140c33370
0x1401bf5f2: mov    ecx,0x14
0x1401bf5f7: mov    eax,DWORD PTR [rip+0x220e18b]        # 0x1423cd788
0x1401bf5fd: cmp    eax,0x2e
0x1401bf600: jle    0x1401bf60f
0x1401bf602: lea    ecx,[rax-0x1a]
0x1401bf605: mov    eax,0x1e
0x1401bf60a: cmp    ecx,eax
0x1401bf60c: cmovg  ecx,eax
0x1401bf60f: dec    ecx
0x1401bf611: mov    eax,0x55555556
0x1401bf616: imul   ecx
0x1401bf618: mov    eax,edx
0x1401bf61a: shr    eax,0x1f
0x1401bf61d: add    edx,eax
0x1401bf61f: cmp    BYTE PTR [r14+0x2b4],0x0
0x1401bf627: je     0x1401c178d
0x1401bf62d: test   bl,bl
0x1401bf62f: je     0x1401bf72d
0x1401bf635: cmp    BYTE PTR [rip+0x21d0f92],0x0        # 0x1423905ce
0x1401bf63c: je     0x1401bf72d
0x1401bf642: xor    ebx,ebx
0x1401bf644: mov    QWORD PTR [rsp+0x50],rbx
0x1401bf649: mov    eax,DWORD PTR [r14+0x2b0]
0x1401bf650: mov    DWORD PTR [rsp+0x38],eax
0x1401bf654: mov    DWORD PTR [rsp+0x3c],ebx
0x1401bf658: mov    rax,QWORD PTR [r14+0x238]
0x1401bf65f: sub    rax,QWORD PTR [r14+0x230]
0x1401bf666: sar    rax,0x3
0x1401bf66a: dec    eax
0x1401bf66c: mov    DWORD PTR [rsp+0x40],eax
0x1401bf670: mov    r9d,0x2
0x1401bf676: mov    DWORD PTR [rsp+0x48],r9d
0x1401bf67b: lea    eax,[rdx*2-0x1]
0x1401bf682: add    eax,edx
0x1401bf684: mov    DWORD PTR [rsp+0x4c],eax
0x1401bf688: mov    DWORD PTR [rsp+0x44],edx
0x1401bf68c: lea    rcx,[rsp+0x38]
0x1401bf691: call   0x1400bb3b0
0x1401bf696: mov    eax,DWORD PTR [rsp+0x48]
0x1401bf69a: cmp    esi,eax
0x1401bf69c: jg     0x1401bf6a8
0x1401bf69e: mov    eax,DWORD PTR [rsp+0x3c]
0x1401bf6a2: mov    DWORD PTR [rsp+0x38],eax
0x1401bf6a6: jmp    0x1401bf713
0x1401bf6a8: mov    r10d,DWORD PTR [rsp+0x4c]
0x1401bf6ad: cmp    esi,r10d
0x1401bf6b0: jl     0x1401bf6ca
0x1401bf6b2: mov    eax,DWORD PTR [rsp+0x40]
0x1401bf6b6: sub    eax,DWORD PTR [rsp+0x44]
0x1401bf6ba: inc    eax
0x1401bf6bc: mov    DWORD PTR [rsp+0x38],eax
0x1401bf6c0: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401bf6c4: cmp    eax,ecx
0x1401bf6c6: jge    0x1401bf713
0x1401bf6c8: jmp    0x1401bf70f
0x1401bf6ca: cmp    r10d,eax
0x1401bf6cd: jle    0x1401bf713
0x1401bf6cf: mov    r8d,DWORD PTR [rsp+0x40]
0x1401bf6d4: sub    r8d,DWORD PTR [rsp+0x44]
0x1401bf6d9: mov    ecx,r8d
0x1401bf6dc: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401bf6e1: sub    ecx,r9d
0x1401bf6e4: add    ecx,0x1
0x1401bf6e7: cmovns ebx,ecx
0x1401bf6ea: sub    esi,eax
0x1401bf6ec: imul   ebx,esi
0x1401bf6ef: sub    r10d,eax
0x1401bf6f2: inc    r10d
0x1401bf6f5: mov    eax,ebx
0x1401bf6f7: cdq
0x1401bf6f8: idiv   r10d
0x1401bf6fb: lea    ecx,[rax+r9*1]
0x1401bf6ff: lea    eax,[r8+0x1]
0x1401bf703: cmp    ecx,eax
0x1401bf705: cmovg  ecx,eax
0x1401bf708: cmp    ecx,r9d
0x1401bf70b: cmovl  ecx,r9d
0x1401bf70f: mov    DWORD PTR [rsp+0x38],ecx
0x1401bf713: lea    rcx,[rsp+0x38]
0x1401bf718: call   0x1400bb3b0
0x1401bf71d: mov    eax,DWORD PTR [rsp+0x38]
0x1401bf721: mov    DWORD PTR [r14+0x2b0],eax
0x1401bf728: jmp    0x1401c178d
0x1401bf72d: mov    BYTE PTR [r14+0x2b4],0x0
0x1401bf735: jmp    0x1401c178d
0x1401bf73a: mov    esi,0xffffffff
0x1401bf73f: test   bl,bl
0x1401bf741: cmovne esi,DWORD PTR [rip+0x248ae6c]        # 0x14264a5b4
0x1401bf748: lea    rdx,[rsp+0x64]
0x1401bf74d: lea    rcx,[rsp+0x60]
0x1401bf752: call   0x140c33370
0x1401bf757: mov    ecx,0x14
0x1401bf75c: mov    eax,DWORD PTR [rip+0x220e026]        # 0x1423cd788
0x1401bf762: cmp    eax,0x2e
0x1401bf765: jle    0x1401bf774
0x1401bf767: lea    ecx,[rax-0x1a]
0x1401bf76a: mov    eax,0x1e
0x1401bf76f: cmp    ecx,eax
0x1401bf771: cmovg  ecx,eax
0x1401bf774: dec    ecx
0x1401bf776: mov    eax,0x55555556
0x1401bf77b: imul   ecx
0x1401bf77d: mov    eax,edx
0x1401bf77f: shr    eax,0x1f
0x1401bf782: add    edx,eax
0x1401bf784: cmp    BYTE PTR [r14+0x2dc],0x0
0x1401bf78c: je     0x1401c178d
0x1401bf792: test   bl,bl
0x1401bf794: je     0x1401bf88c
0x1401bf79a: cmp    BYTE PTR [rip+0x21d0e2d],0x0        # 0x1423905ce
0x1401bf7a1: je     0x1401bf88c
0x1401bf7a7: xor    ebx,ebx
0x1401bf7a9: mov    QWORD PTR [rsp+0x50],rbx
0x1401bf7ae: mov    eax,DWORD PTR [r14+0x2e0]
0x1401bf7b5: mov    DWORD PTR [rsp+0x38],eax
0x1401bf7b9: mov    DWORD PTR [rsp+0x3c],ebx
0x1401bf7bd: mov    rax,QWORD PTR [r14+0x2c0]
0x1401bf7c4: sub    rax,QWORD PTR [r14+0x2b8]
0x1401bf7cb: sar    rax,0x3
0x1401bf7cf: dec    eax
0x1401bf7d1: mov    DWORD PTR [rsp+0x40],eax
0x1401bf7d5: mov    r9d,0x2
0x1401bf7db: mov    DWORD PTR [rsp+0x48],r9d
0x1401bf7e0: lea    eax,[rdx*2-0x1]
0x1401bf7e7: add    eax,edx
0x1401bf7e9: mov    DWORD PTR [rsp+0x4c],eax
0x1401bf7ed: mov    DWORD PTR [rsp+0x44],edx
0x1401bf7f1: lea    rcx,[rsp+0x38]
0x1401bf7f6: call   0x1400bb3b0
0x1401bf7fb: mov    edx,DWORD PTR [rsp+0x48]
0x1401bf7ff: cmp    esi,edx
0x1401bf801: jg     0x1401bf80d
0x1401bf803: mov    eax,DWORD PTR [rsp+0x3c]
0x1401bf807: mov    DWORD PTR [rsp+0x38],eax
0x1401bf80b: jmp    0x1401bf872
0x1401bf80d: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401bf811: cmp    esi,ecx
0x1401bf813: jl     0x1401bf82d
0x1401bf815: mov    eax,DWORD PTR [rsp+0x40]
0x1401bf819: sub    eax,DWORD PTR [rsp+0x44]
0x1401bf81d: inc    eax
0x1401bf81f: mov    DWORD PTR [rsp+0x38],eax
0x1401bf823: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401bf827: cmp    eax,ecx
0x1401bf829: jge    0x1401bf872
0x1401bf82b: jmp    0x1401bf86e
0x1401bf82d: cmp    ecx,edx
0x1401bf82f: jle    0x1401bf872
0x1401bf831: mov    r8d,DWORD PTR [rsp+0x40]
0x1401bf836: sub    r8d,DWORD PTR [rsp+0x44]
0x1401bf83b: mov    eax,r8d
0x1401bf83e: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401bf843: sub    eax,r9d
0x1401bf846: add    eax,0x1
0x1401bf849: cmovns ebx,eax
0x1401bf84c: sub    esi,edx
0x1401bf84e: imul   ebx,esi
0x1401bf851: sub    ecx,edx
0x1401bf853: inc    ecx
0x1401bf855: mov    eax,ebx
0x1401bf857: cdq
0x1401bf858: idiv   ecx
0x1401bf85a: lea    ecx,[rax+r9*1]
0x1401bf85e: lea    eax,[r8+0x1]
0x1401bf862: cmp    ecx,eax
0x1401bf864: cmovg  ecx,eax
0x1401bf867: cmp    ecx,r9d
0x1401bf86a: cmovl  ecx,r9d
0x1401bf86e: mov    DWORD PTR [rsp+0x38],ecx
0x1401bf872: lea    rcx,[rsp+0x38]
0x1401bf877: call   0x1400bb3b0
0x1401bf87c: mov    eax,DWORD PTR [rsp+0x38]
0x1401bf880: mov    DWORD PTR [r14+0x2e0],eax
0x1401bf887: jmp    0x1401c178d
0x1401bf88c: mov    BYTE PTR [r14+0x2dc],0x0
0x1401bf894: jmp    0x1401c178d
0x1401bf899: mov    r12d,0xffffffff
0x1401bf89f: test   bl,bl
0x1401bf8a1: cmovne r12d,DWORD PTR [rip+0x248ad0b]        # 0x14264a5b4
0x1401bf8a9: lea    rdx,[rsp+0x64]
0x1401bf8ae: lea    rcx,[rsp+0x60]
0x1401bf8b3: call   0x140c33370
0x1401bf8b8: mov    edi,DWORD PTR [rip+0x220deca]        # 0x1423cd788
0x1401bf8be: dec    edi
0x1401bf8c0: mov    eax,0x2a
0x1401bf8c5: cmp    edi,eax
0x1401bf8c7: cmovg  edi,eax
0x1401bf8ca: movsxd rcx,DWORD PTR [r14+0x2d8]
0x1401bf8d1: mov    rax,QWORD PTR [r14+0x2b8]
0x1401bf8d8: mov    rsi,QWORD PTR [rax+rcx*8]
0x1401bf8dc: xor    r15d,r15d
0x1401bf8df: cmp    DWORD PTR [rsi+0x138],0x13
0x1401bf8e6: jne    0x1401bfa20
0x1401bf8ec: mov    r8,QWORD PTR [r14+0x3e0]
0x1401bf8f3: sub    r8,QWORD PTR [r14+0x3d8]
0x1401bf8fa: sar    r8,0x3
0x1401bf8fe: test   r8,r8
0x1401bf901: je     0x1401bfa20
0x1401bf907: lea    ecx,[rdi-0x5]
0x1401bf90a: mov    eax,0x55555556
0x1401bf90f: imul   ecx
0x1401bf911: mov    eax,edx
0x1401bf913: shr    eax,0x1f
0x1401bf916: add    edx,eax
0x1401bf918: cmp    BYTE PTR [r14+0x3f4],r15b
0x1401bf91f: je     0x1401bfa20
0x1401bf925: test   bl,bl
0x1401bf927: je     0x1401bfa12
0x1401bf92d: cmp    BYTE PTR [rip+0x21d0c9a],r15b        # 0x1423905ce
0x1401bf934: je     0x1401bfa12
0x1401bf93a: mov    QWORD PTR [rsp+0x50],r15
0x1401bf93f: mov    eax,DWORD PTR [r14+0x3f0]
0x1401bf946: mov    DWORD PTR [rsp+0x38],eax
0x1401bf94a: mov    DWORD PTR [rsp+0x3c],r15d
0x1401bf94f: lea    eax,[r8-0x1]
0x1401bf953: mov    DWORD PTR [rsp+0x40],eax
0x1401bf957: mov    DWORD PTR [rsp+0x48],0x6
0x1401bf95f: lea    eax,[rdx+0x1]
0x1401bf962: lea    ecx,[rax+rax*2]
0x1401bf965: mov    DWORD PTR [rsp+0x4c],ecx
0x1401bf969: mov    DWORD PTR [rsp+0x44],edx
0x1401bf96d: lea    rcx,[rsp+0x38]
0x1401bf972: call   0x1400bb3b0
0x1401bf977: mov    r11d,DWORD PTR [rsp+0x48]
0x1401bf97c: cmp    r12d,r11d
0x1401bf97f: jg     0x1401bf98b
0x1401bf981: mov    eax,DWORD PTR [rsp+0x3c]
0x1401bf985: mov    DWORD PTR [rsp+0x38],eax
0x1401bf989: jmp    0x1401bf9fb
0x1401bf98b: mov    r10d,DWORD PTR [rsp+0x4c]
0x1401bf990: cmp    r12d,r10d
0x1401bf993: jl     0x1401bf9ad
0x1401bf995: mov    eax,DWORD PTR [rsp+0x40]
0x1401bf999: sub    eax,DWORD PTR [rsp+0x44]
0x1401bf99d: inc    eax
0x1401bf99f: mov    DWORD PTR [rsp+0x38],eax
0x1401bf9a3: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401bf9a7: cmp    eax,ecx
0x1401bf9a9: jge    0x1401bf9fb
0x1401bf9ab: jmp    0x1401bf9f7
0x1401bf9ad: cmp    r10d,r11d
0x1401bf9b0: jle    0x1401bf9fb
0x1401bf9b2: mov    r8d,DWORD PTR [rsp+0x40]
0x1401bf9b7: sub    r8d,DWORD PTR [rsp+0x44]
0x1401bf9bc: mov    eax,r8d
0x1401bf9bf: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401bf9c4: sub    eax,r9d
0x1401bf9c7: add    eax,0x1
0x1401bf9ca: mov    edx,r15d
0x1401bf9cd: cmovns edx,eax
0x1401bf9d0: mov    eax,r12d
0x1401bf9d3: sub    eax,r11d
0x1401bf9d6: imul   eax,edx
0x1401bf9d9: sub    r10d,r11d
0x1401bf9dc: inc    r10d
0x1401bf9df: cdq
0x1401bf9e0: idiv   r10d
0x1401bf9e3: lea    ecx,[rax+r9*1]
0x1401bf9e7: lea    eax,[r8+0x1]
0x1401bf9eb: cmp    ecx,eax
0x1401bf9ed: cmovg  ecx,eax
0x1401bf9f0: cmp    ecx,r9d
0x1401bf9f3: cmovl  ecx,r9d
0x1401bf9f7: mov    DWORD PTR [rsp+0x38],ecx
0x1401bf9fb: lea    rcx,[rsp+0x38]
0x1401bfa00: call   0x1400bb3b0
0x1401bfa05: mov    eax,DWORD PTR [rsp+0x38]
0x1401bfa09: mov    DWORD PTR [r14+0x3f0],eax
0x1401bfa10: jmp    0x1401bfa19
0x1401bfa12: mov    BYTE PTR [r14+0x3f4],r15b
0x1401bfa19: movzx  ebx,BYTE PTR [rip+0x21d0bb5]        # 0x1423905d5
0x1401bfa20: mov    eax,DWORD PTR [rsi+0x138]
0x1401bfa26: cmp    eax,0x13
0x1401bfa29: je     0x1401bfb6c
0x1401bfa2f: cmp    eax,0x19
0x1401bfa32: je     0x1401bfb6c
0x1401bfa38: mov    r8,QWORD PTR [r14+0x358]
0x1401bfa3f: sub    r8,QWORD PTR [r14+0x350]
0x1401bfa46: sar    r8,0x3
0x1401bfa4a: test   r8,r8
0x1401bfa4d: je     0x1401c178d
0x1401bfa53: lea    ecx,[rdi-0x7]
0x1401bfa56: mov    eax,0x55555556
0x1401bfa5b: imul   ecx
0x1401bfa5d: mov    eax,edx
0x1401bfa5f: shr    eax,0x1f
0x1401bfa62: add    edx,eax
0x1401bfa64: cmp    BYTE PTR [r14+0x3cc],r15b
0x1401bfa6b: je     0x1401c178d
0x1401bfa71: test   bl,bl
0x1401bfa73: je     0x1401bfb60
0x1401bfa79: cmp    BYTE PTR [rip+0x21d0b4e],r15b        # 0x1423905ce
0x1401bfa80: je     0x1401bfb60
0x1401bfa86: mov    QWORD PTR [rsp+0x50],r15
0x1401bfa8b: mov    eax,DWORD PTR [r14+0x3c8]
0x1401bfa92: mov    DWORD PTR [rsp+0x38],eax
0x1401bfa96: mov    DWORD PTR [rsp+0x3c],r15d
0x1401bfa9b: lea    eax,[r8-0x1]
0x1401bfa9f: mov    DWORD PTR [rsp+0x40],eax
0x1401bfaa3: mov    r9d,0x2
0x1401bfaa9: mov    DWORD PTR [rsp+0x48],r9d
0x1401bfaae: lea    eax,[rdx*2-0x1]
0x1401bfab5: add    eax,edx
0x1401bfab7: mov    DWORD PTR [rsp+0x4c],eax
0x1401bfabb: mov    DWORD PTR [rsp+0x44],edx
0x1401bfabf: lea    rcx,[rsp+0x38]
0x1401bfac4: call   0x1400bb3b0
0x1401bfac9: mov    edx,DWORD PTR [rsp+0x48]
0x1401bfacd: cmp    r12d,edx
0x1401bfad0: jg     0x1401bfadc
0x1401bfad2: mov    eax,DWORD PTR [rsp+0x3c]
0x1401bfad6: mov    DWORD PTR [rsp+0x38],eax
0x1401bfada: jmp    0x1401bfb46
0x1401bfadc: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401bfae0: cmp    r12d,ecx
0x1401bfae3: jl     0x1401bfafd
0x1401bfae5: mov    eax,DWORD PTR [rsp+0x40]
0x1401bfae9: sub    eax,DWORD PTR [rsp+0x44]
0x1401bfaed: inc    eax
0x1401bfaef: mov    DWORD PTR [rsp+0x38],eax
0x1401bfaf3: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401bfaf7: cmp    eax,ecx
0x1401bfaf9: jge    0x1401bfb46
0x1401bfafb: jmp    0x1401bfb42
0x1401bfafd: cmp    ecx,edx
0x1401bfaff: jle    0x1401bfb46
0x1401bfb01: mov    r8d,DWORD PTR [rsp+0x40]
0x1401bfb06: sub    r8d,DWORD PTR [rsp+0x44]
0x1401bfb0b: mov    eax,r8d
0x1401bfb0e: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401bfb13: sub    eax,r9d
0x1401bfb16: add    eax,0x1
0x1401bfb19: cmovns r15d,eax
0x1401bfb1d: sub    r12d,edx
0x1401bfb20: imul   r15d,r12d
0x1401bfb24: sub    ecx,edx
0x1401bfb26: inc    ecx
0x1401bfb28: mov    eax,r15d
0x1401bfb2b: cdq
0x1401bfb2c: idiv   ecx
0x1401bfb2e: lea    ecx,[rax+r9*1]
0x1401bfb32: lea    eax,[r8+0x1]
0x1401bfb36: cmp    ecx,eax
0x1401bfb38: cmovg  ecx,eax
0x1401bfb3b: cmp    ecx,r9d
0x1401bfb3e: cmovl  ecx,r9d
0x1401bfb42: mov    DWORD PTR [rsp+0x38],ecx
0x1401bfb46: lea    rcx,[rsp+0x38]
0x1401bfb4b: call   0x1400bb3b0
0x1401bfb50: mov    eax,DWORD PTR [rsp+0x38]
0x1401bfb54: mov    DWORD PTR [r14+0x3c8],eax
0x1401bfb5b: jmp    0x1401c178d
0x1401bfb60: mov    BYTE PTR [r14+0x3cc],r15b
0x1401bfb67: jmp    0x1401c178d
0x1401bfb6c: mov    r8,QWORD PTR [r14+0x388]
0x1401bfb73: sub    r8,QWORD PTR [r14+0x380]
0x1401bfb7a: sar    r8,0x3
0x1401bfb7e: test   r8,r8
0x1401bfb81: je     0x1401c178d
0x1401bfb87: lea    ecx,[rdi-0x7]
0x1401bfb8a: mov    eax,0x55555556
0x1401bfb8f: imul   ecx
0x1401bfb91: mov    eax,edx
0x1401bfb93: shr    eax,0x1f
0x1401bfb96: add    edx,eax
0x1401bfb98: cmp    BYTE PTR [r14+0x3d4],r15b
0x1401bfb9f: je     0x1401c178d
0x1401bfba5: test   bl,bl
0x1401bfba7: je     0x1401bfc94
0x1401bfbad: cmp    BYTE PTR [rip+0x21d0a1a],r15b        # 0x1423905ce
0x1401bfbb4: je     0x1401bfc94
0x1401bfbba: mov    QWORD PTR [rsp+0x50],r15
0x1401bfbbf: mov    eax,DWORD PTR [r14+0x3d0]
0x1401bfbc6: mov    DWORD PTR [rsp+0x38],eax
0x1401bfbca: mov    DWORD PTR [rsp+0x3c],r15d
0x1401bfbcf: lea    eax,[r8-0x1]
0x1401bfbd3: mov    DWORD PTR [rsp+0x40],eax
0x1401bfbd7: mov    r9d,0x2
0x1401bfbdd: mov    DWORD PTR [rsp+0x48],r9d
0x1401bfbe2: lea    eax,[rdx*2-0x1]
0x1401bfbe9: add    eax,edx
0x1401bfbeb: mov    DWORD PTR [rsp+0x4c],eax
0x1401bfbef: mov    DWORD PTR [rsp+0x44],edx
0x1401bfbf3: lea    rcx,[rsp+0x38]
0x1401bfbf8: call   0x1400bb3b0
0x1401bfbfd: mov    edx,DWORD PTR [rsp+0x48]
0x1401bfc01: cmp    r12d,edx
0x1401bfc04: jg     0x1401bfc10
0x1401bfc06: mov    eax,DWORD PTR [rsp+0x3c]
0x1401bfc0a: mov    DWORD PTR [rsp+0x38],eax
0x1401bfc0e: jmp    0x1401bfc7a
0x1401bfc10: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401bfc14: cmp    r12d,ecx
0x1401bfc17: jl     0x1401bfc31
0x1401bfc19: mov    eax,DWORD PTR [rsp+0x40]
0x1401bfc1d: sub    eax,DWORD PTR [rsp+0x44]
0x1401bfc21: inc    eax
0x1401bfc23: mov    DWORD PTR [rsp+0x38],eax
0x1401bfc27: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401bfc2b: cmp    eax,ecx
0x1401bfc2d: jge    0x1401bfc7a
0x1401bfc2f: jmp    0x1401bfc76
0x1401bfc31: cmp    ecx,edx
0x1401bfc33: jle    0x1401bfc7a
0x1401bfc35: mov    r8d,DWORD PTR [rsp+0x40]
0x1401bfc3a: sub    r8d,DWORD PTR [rsp+0x44]
0x1401bfc3f: mov    eax,r8d
0x1401bfc42: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401bfc47: sub    eax,r9d
0x1401bfc4a: add    eax,0x1
0x1401bfc4d: cmovns r15d,eax
0x1401bfc51: sub    r12d,edx
0x1401bfc54: imul   r15d,r12d
0x1401bfc58: sub    ecx,edx
0x1401bfc5a: inc    ecx
0x1401bfc5c: mov    eax,r15d
0x1401bfc5f: cdq
0x1401bfc60: idiv   ecx
0x1401bfc62: lea    ecx,[rax+r9*1]
0x1401bfc66: lea    eax,[r8+0x1]
0x1401bfc6a: cmp    ecx,eax
0x1401bfc6c: cmovg  ecx,eax
0x1401bfc6f: cmp    ecx,r9d
0x1401bfc72: cmovl  ecx,r9d
0x1401bfc76: mov    DWORD PTR [rsp+0x38],ecx
0x1401bfc7a: lea    rcx,[rsp+0x38]
0x1401bfc7f: call   0x1400bb3b0
0x1401bfc84: mov    eax,DWORD PTR [rsp+0x38]
0x1401bfc88: mov    DWORD PTR [r14+0x3d0],eax
0x1401bfc8f: jmp    0x1401c178d
0x1401bfc94: mov    BYTE PTR [r14+0x3d4],r15b
0x1401bfc9b: jmp    0x1401c178d
0x1401bfca0: cmp    BYTE PTR [r14+0x8308],0x0
0x1401bfca8: je     0x1401c178d
0x1401bfcae: cmp    BYTE PTR [r14+0x832c],0x0
0x1401bfcb6: je     0x1401c178d
0x1401bfcbc: mov    esi,0xffffffff
0x1401bfcc1: test   bl,bl
0x1401bfcc3: cmovne esi,DWORD PTR [rip+0x248a8ea]        # 0x14264a5b4
0x1401bfcca: lea    rdx,[rsp+0x64]
0x1401bfccf: lea    rcx,[rsp+0x60]
0x1401bfcd4: call   0x140c33370
0x1401bfcd9: mov    ecx,0x14
0x1401bfcde: mov    eax,DWORD PTR [rip+0x220daa4]        # 0x1423cd788
0x1401bfce4: cmp    eax,0x2e
0x1401bfce7: jle    0x1401bfcf6
0x1401bfce9: lea    ecx,[rax-0x1a]
0x1401bfcec: mov    eax,0x1e
0x1401bfcf1: cmp    ecx,eax
0x1401bfcf3: cmovg  ecx,eax
0x1401bfcf6: lea    r8d,[rcx-0x1]
0x1401bfcfa: mov    rdx,QWORD PTR [r14+0x8318]
0x1401bfd01: sub    rdx,QWORD PTR [r14+0x8310]
0x1401bfd08: sar    rdx,0x3
0x1401bfd0c: test   edx,edx
0x1401bfd0e: jle    0x1401c178d
0x1401bfd14: test   bl,bl
0x1401bfd16: je     0x1401bfdf8
0x1401bfd1c: cmp    BYTE PTR [rip+0x21d08ab],0x0        # 0x1423905ce
0x1401bfd23: je     0x1401bfdf8
0x1401bfd29: xor    ebx,ebx
0x1401bfd2b: mov    QWORD PTR [rsp+0x50],rbx
0x1401bfd30: mov    eax,DWORD PTR [r14+0x8328]
0x1401bfd37: mov    DWORD PTR [rsp+0x38],eax
0x1401bfd3b: mov    DWORD PTR [rsp+0x3c],ebx
0x1401bfd3f: lea    eax,[rdx-0x1]
0x1401bfd42: mov    DWORD PTR [rsp+0x40],eax
0x1401bfd46: mov    r9d,0x2
0x1401bfd4c: mov    DWORD PTR [rsp+0x48],r9d
0x1401bfd51: lea    eax,[rcx-0x2]
0x1401bfd54: mov    DWORD PTR [rsp+0x4c],eax
0x1401bfd58: mov    DWORD PTR [rsp+0x44],r8d
0x1401bfd5d: lea    rcx,[rsp+0x38]
0x1401bfd62: call   0x1400bb3b0
0x1401bfd67: mov    edx,DWORD PTR [rsp+0x48]
0x1401bfd6b: cmp    esi,edx
0x1401bfd6d: jg     0x1401bfd79
0x1401bfd6f: mov    eax,DWORD PTR [rsp+0x3c]
0x1401bfd73: mov    DWORD PTR [rsp+0x38],eax
0x1401bfd77: jmp    0x1401bfdde
0x1401bfd79: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401bfd7d: cmp    esi,ecx
0x1401bfd7f: jl     0x1401bfd99
0x1401bfd81: mov    eax,DWORD PTR [rsp+0x40]
0x1401bfd85: sub    eax,DWORD PTR [rsp+0x44]
0x1401bfd89: inc    eax
0x1401bfd8b: mov    DWORD PTR [rsp+0x38],eax
0x1401bfd8f: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401bfd93: cmp    eax,ecx
0x1401bfd95: jge    0x1401bfdde
0x1401bfd97: jmp    0x1401bfdda
0x1401bfd99: cmp    ecx,edx
0x1401bfd9b: jle    0x1401bfdde
0x1401bfd9d: mov    r8d,DWORD PTR [rsp+0x40]
0x1401bfda2: sub    r8d,DWORD PTR [rsp+0x44]
0x1401bfda7: mov    eax,r8d
0x1401bfdaa: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401bfdaf: sub    eax,r9d
0x1401bfdb2: add    eax,0x1
0x1401bfdb5: cmovns ebx,eax
0x1401bfdb8: sub    esi,edx
0x1401bfdba: imul   ebx,esi
0x1401bfdbd: sub    ecx,edx
0x1401bfdbf: inc    ecx
0x1401bfdc1: mov    eax,ebx
0x1401bfdc3: cdq
0x1401bfdc4: idiv   ecx
0x1401bfdc6: lea    ecx,[rax+r9*1]
0x1401bfdca: lea    eax,[r8+0x1]
0x1401bfdce: cmp    ecx,eax
0x1401bfdd0: cmovg  ecx,eax
0x1401bfdd3: cmp    ecx,r9d
0x1401bfdd6: cmovl  ecx,r9d
0x1401bfdda: mov    DWORD PTR [rsp+0x38],ecx
0x1401bfdde: lea    rcx,[rsp+0x38]
0x1401bfde3: call   0x1400bb3b0
0x1401bfde8: mov    eax,DWORD PTR [rsp+0x38]
0x1401bfdec: mov    DWORD PTR [r14+0x8328],eax
0x1401bfdf3: jmp    0x1401c178d
0x1401bfdf8: mov    BYTE PTR [r14+0x832c],0x0
0x1401bfe00: jmp    0x1401c178d
0x1401bfe05: mov    edi,0xffffffff
0x1401bfe0a: test   bl,bl
0x1401bfe0c: cmovne edi,DWORD PTR [rip+0x248a7a1]        # 0x14264a5b4
0x1401bfe13: mov    DWORD PTR [rsp+0x64],edi
0x1401bfe17: lea    rdx,[rsp+0x60]
0x1401bfe1c: lea    rcx,[rsp+0x5c]
0x1401bfe21: call   0x140c33370
0x1401bfe26: mov    eax,DWORD PTR [rip+0x220d95c]        # 0x1423cd788
0x1401bfe2c: lea    ecx,[rax-0x1]
0x1401bfe2f: lea    edx,[rax-0x1a]
0x1401bfe32: cmp    ecx,edx
0x1401bfe34: cmovle edx,ecx
0x1401bfe37: mov    r8,QWORD PTR [r14+0x8368]
0x1401bfe3e: test   r8,r8
0x1401bfe41: je     0x1401c125d
0x1401bfe47: lea    r13d,[rdx-0x5]
0x1401bfe4b: mov    DWORD PTR [rsp+0x60],r13d
0x1401bfe50: lea    r15,[r14+0x8388]
0x1401bfe57: mov    rsi,QWORD PTR [r15+0x8]
0x1401bfe5b: sub    rsi,QWORD PTR [r15]
0x1401bfe5e: sar    rsi,0x3
0x1401bfe62: mov    eax,DWORD PTR [r14+0x83c8]
0x1401bfe69: xor    edi,edi
0x1401bfe6b: test   eax,eax
0x1401bfe6d: jle    0x1401c0689
0x1401bfe73: sub    eax,0x1
0x1401bfe76: mov    DWORD PTR [r14+0x83c8],eax
0x1401bfe7d: jne    0x1401bfe98
0x1401bfe7f: cmp    BYTE PTR [r14+0x83c4],dil
0x1401bfe86: je     0x1401bfe98
0x1401bfe88: mov    DWORD PTR [r14+0x83c8],0x1
0x1401bfe93: jmp    0x1401c114e
0x1401bfe98: test   eax,eax
0x1401bfe9a: jne    0x1401c114e
0x1401bfea0: mov    BYTE PTR [rsp+0x30],dil
0x1401bfea5: mov    r9d,DWORD PTR [r14+0x8380]
0x1401bfeac: test   r9d,r9d
0x1401bfeaf: js     0x1401c114e
0x1401bfeb5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x1401bfec0: mov    r10,QWORD PTR [r8]
0x1401bfec3: mov    ecx,r9d
0x1401bfec6: mov    rax,QWORD PTR [r8+0x8]
0x1401bfeca: sub    rax,r10
0x1401bfecd: sar    rax,0x3
0x1401bfed1: cmp    rcx,rax
0x1401bfed4: jae    0x1401c114e
0x1401bfeda: lea    rdx,[rcx*8+0x0]
0x1401bfee2: movsxd r9,DWORD PTR [r14+0x8384]
0x1401bfee9: mov    rcx,QWORD PTR [rdx+r10*1]
0x1401bfeed: cmp    r9d,DWORD PTR [rcx+0x704]
0x1401bfef4: jge    0x1401c114e
0x1401bfefa: mov    rax,QWORD PTR [r10+rdx*1]
0x1401bfefe: mov    rdx,r9
0x1401bff01: mov    ecx,DWORD PTR [rax+r9*4+0x504]
0x1401bff09: mov    r9d,DWORD PTR [rax+r9*4+0x604]
0x1401bff11: cmp    ecx,DWORD PTR [r14+0x83b8]
0x1401bff18: jg     0x1401c114e
0x1401bff1e: jne    0x1401bff2d
0x1401bff20: cmp    r9d,DWORD PTR [r14+0x83bc]
0x1401bff27: jg     0x1401c114e
0x1401bff2d: xor    bl,bl
0x1401bff2f: mov    edx,DWORD PTR [rax+rdx*4+0x404]
0x1401bff36: lea    rcx,[rip+0x2339d7b]        # 0x1424f9cb8
0x1401bff3d: call   0x14007da30
0x1401bff42: mov    r10,rax
0x1401bff45: mov    QWORD PTR [rsp+0x70],rax
0x1401bff4a: test   rax,rax
0x1401bff4d: je     0x1401c05f3
0x1401bff53: xorps  xmm0,xmm0
0x1401bff56: movups XMMWORD PTR [rbp+0xa0],xmm0
0x1401bff5d: mov    QWORD PTR [rbp+0xb0],rdi
0x1401bff64: mov    QWORD PTR [rbp+0xb8],0xf
0x1401bff6f: mov    BYTE PTR [rbp+0xa0],bl
0x1401bff75: lea    rcx,[rbp-0x70]
0x1401bff79: call   0x140072080
0x1401bff7e: mov    rcx,QWORD PTR [r10]
0x1401bff81: mov    rax,QWORD PTR [rcx+0xd0]
0x1401bff88: mov    BYTE PTR [rsp+0x20],bl
0x1401bff8c: mov    r9b,0x1
0x1401bff8f: lea    r8,[rbp-0x70]
0x1401bff93: lea    rdx,[rbp+0xa0]
0x1401bff9a: mov    rcx,r10
0x1401bff9d: call   rax
0x1401bff9f: cmp    QWORD PTR [rbp+0xb0],0x0
0x1401bffa7: je     0x1401c05e7
0x1401bffad: mov    rax,QWORD PTR [r15+0x8]
0x1401bffb1: sub    rax,QWORD PTR [r15]
0x1401bffb4: sar    rax,0x3
0x1401bffb8: mov    DWORD PTR [r14+0x83cc],eax
0x1401bffbf: xorps  xmm0,xmm0
0x1401bffc2: movdqu XMMWORD PTR [rsp+0x38],xmm0
0x1401bffc8: mov    QWORD PTR [rsp+0x48],rdi
0x1401bffcd: mov    ecx,0x20
0x1401bffd2: call   0x141539690
0x1401bffd7: xorps  xmm0,xmm0
0x1401bffda: movups XMMWORD PTR [rax],xmm0
0x1401bffdd: mov    QWORD PTR [rax+0x10],rdi
0x1401bffe1: mov    QWORD PTR [rax+0x18],0xf
0x1401bffe9: mov    BYTE PTR [rax],bl
0x1401bffeb: mov    QWORD PTR [rsp+0x68],rax
0x1401bfff0: lea    rcx,[rbp+0xa0]
0x1401bfff7: cmp    rax,rcx
0x1401bfffa: je     0x1401c0022
0x1401bfffc: lea    rdx,[rbp+0xa0]
0x1401c0003: cmp    QWORD PTR [rbp+0xb8],0xf
0x1401c000b: cmova  rdx,QWORD PTR [rbp+0xa0]
0x1401c0013: mov    r8,QWORD PTR [rbp+0xb0]
0x1401c001a: mov    rcx,rax
0x1401c001d: call   0x14006f8d0
0x1401c0022: lea    r8,[rsp+0x68]
0x1401c0027: xor    edx,edx
0x1401c0029: lea    rcx,[rsp+0x38]
0x1401c002e: call   0x1400bad30
0x1401c0033: xor    bl,bl
0x1401c0035: xorps  xmm0,xmm0
0x1401c0038: movups XMMWORD PTR [rbp+0x60],xmm0
0x1401c003c: mov    rsi,rdi
0x1401c003f: mov    QWORD PTR [rbp+0x70],rdi
0x1401c0043: mov    QWORD PTR [rbp+0x78],0xf
0x1401c004b: mov    BYTE PTR [rbp+0x60],bl
0x1401c004e: mov    r13d,edi
0x1401c0051: mov    DWORD PTR [rsp+0x5c],edi
0x1401c0055: mov    r14,QWORD PTR [rsp+0x40]
0x1401c005a: mov    rax,r14
0x1401c005d: mov    r12,QWORD PTR [rsp+0x38]
0x1401c0062: sub    rax,r12
0x1401c0065: sar    rax,0x3
0x1401c0069: mov    QWORD PTR [rsp+0x68],rax
0x1401c006e: test   rax,rax
0x1401c0071: je     0x1401c02bc
0x1401c0077: jmp    0x1401c0082
0x1401c0079: nop    DWORD PTR [rax+0x0]
0x1401c0080: xor    edi,edi
0x1401c0082: mov    r14d,edi
0x1401c0085: mov    rcx,QWORD PTR [r12]
0x1401c0089: cmp    QWORD PTR [rcx+0x10],0x0
0x1401c008e: jbe    0x1401c020c
0x1401c0094: xor    r13d,r13d
0x1401c0097: test   bl,bl
0x1401c0099: je     0x1401c00b4
0x1401c009b: mov    rax,rcx
0x1401c009e: cmp    QWORD PTR [rcx+0x18],0xf
0x1401c00a3: jbe    0x1401c00a8
0x1401c00a5: mov    rax,QWORD PTR [rcx]
0x1401c00a8: cmp    BYTE PTR [rax+rdi*1],0x20
0x1401c00ac: je     0x1401c01f0
0x1401c00b2: xor    bl,bl
0x1401c00b4: cmp    QWORD PTR [rcx+0x18],0xf
0x1401c00b9: jbe    0x1401c00be
0x1401c00bb: mov    rcx,QWORD PTR [rcx]
0x1401c00be: movzx  edx,BYTE PTR [rcx+rdi*1]
0x1401c00c2: lea    rcx,[rbp+0x60]
0x1401c00c6: call   0x1400b9b80
0x1401c00cb: mov    rsi,QWORD PTR [rbp+0x70]
0x1401c00cf: cmp    rsi,0x35
0x1401c00d3: jbe    0x1401c01f0
0x1401c00d9: mov    r10d,r14d
0x1401c00dc: mov    edx,r13d
0x1401c00df: mov    r8,r13
0x1401c00e2: mov    rcx,QWORD PTR [r12]
0x1401c00e6: mov    r9,QWORD PTR [rcx+0x18]
0x1401c00ea: nop    WORD PTR [rax+rax*1+0x0]
0x1401c00f0: dec    r14d
0x1401c00f3: dec    rdi
0x1401c00f6: inc    edx
0x1401c00f8: inc    r8
0x1401c00fb: mov    rax,rcx
0x1401c00fe: cmp    r9,0xf
0x1401c0102: jbe    0x1401c0107
0x1401c0104: mov    rax,QWORD PTR [rcx]
0x1401c0107: cmp    BYTE PTR [rax+rdi*1],0x20
0x1401c010b: je     0x1401c0112
0x1401c010d: test   rdi,rdi
0x1401c0110: jg     0x1401c00f0
0x1401c0112: movsxd rax,edx
0x1401c0115: cmp    rax,rsi
0x1401c0118: jne    0x1401c0138
0x1401c011a: lea    eax,[r10-0x1]
0x1401c011e: movsxd rdx,eax
0x1401c0121: mov    r9d,0x1
0x1401c0127: lea    r8,[rip+0x142860e]        # 0x1415e873c  ' '
0x1401c012e: call   0x1404f0930
0x1401c0133: jmp    0x1401c01d7
0x1401c0138: mov    rdx,rsi
0x1401c013b: sub    rdx,r8
0x1401c013e: cmp    rdx,rsi
0x1401c0141: ja     0x1401c015b
0x1401c0143: mov    QWORD PTR [rbp+0x70],rdx
0x1401c0147: lea    rax,[rbp+0x60]
0x1401c014b: cmp    QWORD PTR [rbp+0x78],0xf
0x1401c0150: cmova  rax,QWORD PTR [rbp+0x60]
0x1401c0155: mov    BYTE PTR [rdx+rax*1],r13b
0x1401c0159: jmp    0x1401c016a
0x1401c015b: sub    rdx,rsi
0x1401c015e: xor    r8d,r8d
0x1401c0161: lea    rcx,[rbp+0x60]
0x1401c0165: call   0x1400e12b0
0x1401c016a: mov    ecx,0x20
0x1401c016f: call   0x141539690
0x1401c0174: mov    rbx,rax
0x1401c0177: xorps  xmm0,xmm0
0x1401c017a: movups XMMWORD PTR [rax],xmm0
0x1401c017d: mov    QWORD PTR [rax+0x10],r13
0x1401c0181: mov    QWORD PTR [rax+0x18],0xf
0x1401c0189: mov    BYTE PTR [rax],r13b
0x1401c018c: mov    QWORD PTR [rsp+0x78],rax
0x1401c0191: lea    rax,[rbp+0x60]
0x1401c0195: cmp    rbx,rax
0x1401c0198: je     0x1401c01b4
0x1401c019a: lea    rdx,[rbp+0x60]
0x1401c019e: cmp    QWORD PTR [rbp+0x78],0xf
0x1401c01a3: cmova  rdx,QWORD PTR [rbp+0x60]
0x1401c01a8: mov    r8,QWORD PTR [rbp+0x70]
0x1401c01ac: mov    rcx,rbx
0x1401c01af: call   0x14006f8d0
0x1401c01b4: mov    rdx,QWORD PTR [r15+0x8]
0x1401c01b8: cmp    rdx,QWORD PTR [r15+0x10]
0x1401c01bc: je     0x1401c01c8
0x1401c01be: mov    QWORD PTR [rdx],rbx
0x1401c01c1: add    QWORD PTR [r15+0x8],0x8
0x1401c01c6: jmp    0x1401c01d5
0x1401c01c8: lea    r8,[rsp+0x78]
0x1401c01cd: mov    rcx,r15
0x1401c01d0: call   0x1400bad30
0x1401c01d5: mov    bl,0x1
0x1401c01d7: mov    QWORD PTR [rbp+0x70],r13
0x1401c01db: lea    rax,[rbp+0x60]
0x1401c01df: cmp    QWORD PTR [rbp+0x78],0xf
0x1401c01e4: cmova  rax,QWORD PTR [rbp+0x60]
0x1401c01e9: mov    BYTE PTR [rax],r13b
0x1401c01ec: mov    rsi,QWORD PTR [rbp+0x70]
0x1401c01f0: inc    r14d
0x1401c01f3: inc    rdi
0x1401c01f6: mov    rcx,QWORD PTR [r12]
0x1401c01fa: movsxd rax,r14d
0x1401c01fd: cmp    rax,QWORD PTR [rcx+0x10]
0x1401c0201: jb     0x1401c0097
0x1401c0207: mov    r13d,DWORD PTR [rsp+0x5c]
0x1401c020c: inc    r13d
0x1401c020f: mov    DWORD PTR [rsp+0x5c],r13d
0x1401c0214: add    r12,0x8
0x1401c0218: movsxd rax,r13d
0x1401c021b: cmp    rax,QWORD PTR [rsp+0x68]
0x1401c0220: jb     0x1401c0080
0x1401c0226: test   rsi,rsi
0x1401c0229: je     0x1401c02b2
0x1401c022f: mov    ecx,0x20
0x1401c0234: call   0x141539690
0x1401c0239: mov    rbx,rax
0x1401c023c: xorps  xmm0,xmm0
0x1401c023f: movups XMMWORD PTR [rax],xmm0
0x1401c0242: xor    r13d,r13d
0x1401c0245: mov    QWORD PTR [rax+0x10],r13
0x1401c0249: mov    QWORD PTR [rax+0x18],0xf
0x1401c0251: mov    BYTE PTR [rax],r13b
0x1401c0254: mov    QWORD PTR [rsp+0x78],rax
0x1401c0259: lea    rax,[rbp+0x60]
0x1401c025d: cmp    rbx,rax
0x1401c0260: je     0x1401c027b
0x1401c0262: lea    rdx,[rbp+0x60]
0x1401c0266: cmp    QWORD PTR [rbp+0x78],0xf
0x1401c026b: cmova  rdx,QWORD PTR [rbp+0x60]
0x1401c0270: mov    r8,rsi
0x1401c0273: mov    rcx,rbx
0x1401c0276: call   0x14006f8d0
0x1401c027b: mov    rdx,QWORD PTR [r15+0x8]
0x1401c027f: cmp    rdx,QWORD PTR [r15+0x10]
0x1401c0283: je     0x1401c0299
0x1401c0285: mov    QWORD PTR [rdx],rbx
0x1401c0288: add    QWORD PTR [r15+0x8],0x8
0x1401c028d: mov    r14,QWORD PTR [rsp+0x40]
0x1401c0292: mov    r12,QWORD PTR [rsp+0x38]
0x1401c0297: jmp    0x1401c02bf
0x1401c0299: lea    r8,[rsp+0x78]
0x1401c029e: mov    rcx,r15
0x1401c02a1: call   0x1400bad30
0x1401c02a6: mov    r14,QWORD PTR [rsp+0x40]
0x1401c02ab: mov    r12,QWORD PTR [rsp+0x38]
0x1401c02b0: jmp    0x1401c02bf
0x1401c02b2: mov    r14,QWORD PTR [rsp+0x40]
0x1401c02b7: mov    r12,QWORD PTR [rsp+0x38]
0x1401c02bc: xor    r13d,r13d
0x1401c02bf: lea    rcx,[rbp+0x60]
0x1401c02c3: call   0x14006f850
0x1401c02c8: nop
0x1401c02c9: cmp    QWORD PTR [rsp+0x68],0x0
0x1401c02cf: jbe    0x1401c0325
0x1401c02d1: lea    rdi,[r12+0x8]
0x1401c02d6: mov    rsi,r12
0x1401c02d9: neg    rsi
0x1401c02dc: nop    DWORD PTR [rax+0x0]
0x1401c02e0: mov    rbx,QWORD PTR [r12]
0x1401c02e4: test   rbx,rbx
0x1401c02e7: je     0x1401c02fe
0x1401c02e9: mov    rcx,rbx
0x1401c02ec: call   0x14006f850
0x1401c02f1: mov    edx,0x20
0x1401c02f6: mov    rcx,rbx
0x1401c02f9: call   0x141539680
0x1401c02fe: mov    r8,r14
0x1401c0301: sub    r8,rdi
0x1401c0304: mov    rdx,rdi
0x1401c0307: mov    rcx,r12
0x1401c030a: call   0x14153ae1a
0x1401c030f: sub    r14,0x8
0x1401c0313: lea    rax,[r14+rsi*1]
0x1401c0317: sar    rax,0x3
0x1401c031b: test   rax,rax
0x1401c031e: jne    0x1401c02e0
0x1401c0320: mov    QWORD PTR [rsp+0x40],r14
0x1401c0325: lea    rcx,[rsp+0x38]
0x1401c032a: call   0x140066b70
0x1401c032f: mov    esi,0xf
0x1401c0334: mov    DWORD PTR [rsp+0x5c],esi
0x1401c0338: mov    rbx,QWORD PTR [rsp+0x70]
0x1401c033d: mov    rax,QWORD PTR [rbx]
0x1401c0340: mov    rcx,rbx
0x1401c0343: call   QWORD PTR [rax]
0x1401c0345: movsx  ecx,ax
0x1401c0348: sub    ecx,0x3
0x1401c034b: je     0x1401c04f3
0x1401c0351: sub    ecx,0x1
0x1401c0354: je     0x1401c040e
0x1401c035a: sub    ecx,0x34
0x1401c035d: je     0x1401c0372
0x1401c035f: cmp    ecx,0x1
0x1401c0362: jne    0x1401c04a6
0x1401c0368: mov    esi,0xe
0x1401c036d: jmp    0x1401c04a2
0x1401c0372: mov    r10d,DWORD PTR [rbx+0x28]
0x1401c0376: mov    rdx,QWORD PTR [rip+0x23399a3]        # 0x1424f9d20
0x1401c037d: mov    rbx,QWORD PTR [rip+0x2339994]        # 0x1424f9d18
0x1401c0384: sub    rdx,rbx
0x1401c0387: sar    rdx,0x3
0x1401c038b: test   rdx,rdx
0x1401c038e: je     0x1401c04a6
0x1401c0394: cmp    r10d,0xffffffff
0x1401c0398: je     0x1401c04a6
0x1401c039e: mov    r8d,r13d
0x1401c03a1: sub    edx,0x1
0x1401c03a4: js     0x1401c04a6
0x1401c03aa: nop    WORD PTR [rax+rax*1+0x0]
0x1401c03b0: mov    r11d,edx
0x1401c03b3: lea    ecx,[rdx+r8*1]
0x1401c03b7: sar    ecx,1
0x1401c03b9: movsxd rax,ecx
0x1401c03bc: mov    rdx,QWORD PTR [rbx+rax*8]
0x1401c03c0: cmp    DWORD PTR [rdx+0xe0],r10d
0x1401c03c7: je     0x1401c03e1
0x1401c03c9: lea    edx,[rcx-0x1]
0x1401c03cc: cmovle edx,r11d
0x1401c03d0: lea    eax,[rcx+0x1]
0x1401c03d3: cmovle r8d,eax
0x1401c03d7: cmp    r8d,edx
0x1401c03da: jle    0x1401c03b0
0x1401c03dc: jmp    0x1401c04a6
0x1401c03e1: test   rdx,rdx
0x1401c03e4: je     0x1401c04a6
0x1401c03ea: mov    eax,DWORD PTR [rdx+0xb0]
0x1401c03f0: cmp    eax,DWORD PTR [rip+0x21d327a]        # 0x142393670
0x1401c03f6: je     0x1401c0404
0x1401c03f8: cmp    eax,DWORD PTR [rip+0x21d327a]        # 0x142393678
0x1401c03fe: jne    0x1401c04a6
0x1401c0404: mov    esi,0xc
0x1401c0409: jmp    0x1401c04a2
0x1401c040e: mov    eax,DWORD PTR [rbx+0x30]
0x1401c0411: cmp    eax,0x6
0x1401c0414: je     0x1401c041f
0x1401c0416: cmp    eax,0x4
0x1401c0419: jne    0x1401c04a6
0x1401c041f: mov    r10d,DWORD PTR [rbx+0x2c]
0x1401c0423: mov    rdx,QWORD PTR [rip+0x23398f6]        # 0x1424f9d20
0x1401c042a: mov    rbx,QWORD PTR [rip+0x23398e7]        # 0x1424f9d18
0x1401c0431: sub    rdx,rbx
0x1401c0434: sar    rdx,0x3
0x1401c0438: test   rdx,rdx
0x1401c043b: je     0x1401c04a6
0x1401c043d: cmp    r10d,0xffffffff
0x1401c0441: je     0x1401c04a6
0x1401c0443: mov    r8d,r13d
0x1401c0446: sub    edx,0x1
0x1401c0449: js     0x1401c04a6
0x1401c044b: nop    DWORD PTR [rax+rax*1+0x0]
0x1401c0450: mov    r11d,edx
0x1401c0453: lea    ecx,[rdx+r8*1]
0x1401c0457: sar    ecx,1
0x1401c0459: movsxd rax,ecx
0x1401c045c: mov    rdx,QWORD PTR [rbx+rax*8]
0x1401c0460: cmp    DWORD PTR [rdx+0xe0],r10d
0x1401c0467: je     0x1401c047e
0x1401c0469: lea    edx,[rcx-0x1]
0x1401c046c: cmovle edx,r11d
0x1401c0470: lea    eax,[rcx+0x1]
0x1401c0473: cmovle r8d,eax
0x1401c0477: cmp    r8d,edx
0x1401c047a: jle    0x1401c0450
0x1401c047c: jmp    0x1401c04a6
0x1401c047e: test   rdx,rdx
0x1401c0481: je     0x1401c04a6
0x1401c0483: mov    eax,DWORD PTR [rdx+0xb0]
0x1401c0489: cmp    eax,DWORD PTR [rip+0x21d31e1]        # 0x142393670
0x1401c048f: je     0x1401c049d
0x1401c0491: cmp    eax,DWORD PTR [rip+0x21d31e1]        # 0x142393678
0x1401c0497: jne    0x1401c0578
0x1401c049d: mov    esi,0xd
0x1401c04a2: mov    DWORD PTR [rsp+0x5c],esi
0x1401c04a6: mov    r14,QWORD PTR [rbp-0x80]
0x1401c04aa: movsxd rbx,DWORD PTR [r14+0x83cc]
0x1401c04b1: mov    rdx,QWORD PTR [r15]
0x1401c04b4: mov    rcx,QWORD PTR [r15+0x8]
0x1401c04b8: sub    rcx,rdx
0x1401c04bb: sar    rcx,0x3
0x1401c04bf: cmp    rbx,rcx
0x1401c04c2: jae    0x1401c05af
0x1401c04c8: nop    DWORD PTR [rax+rax*1+0x0]
0x1401c04d0: mov    rdx,QWORD PTR [r14+0x83a8]
0x1401c04d7: cmp    rdx,QWORD PTR [r14+0x83b0]
0x1401c04de: je     0x1401c0582
0x1401c04e4: mov    DWORD PTR [rdx],esi
0x1401c04e6: add    QWORD PTR [r14+0x83a8],0x4
0x1401c04ee: jmp    0x1401c0593
0x1401c04f3: mov    r10d,DWORD PTR [rbx+0x28]
0x1401c04f7: mov    rdx,QWORD PTR [rip+0x2339822]        # 0x1424f9d20
0x1401c04fe: mov    rbx,QWORD PTR [rip+0x2339813]        # 0x1424f9d18
0x1401c0505: sub    rdx,rbx
0x1401c0508: sar    rdx,0x3
0x1401c050c: test   rdx,rdx
0x1401c050f: je     0x1401c04a6
0x1401c0511: cmp    r10d,0xffffffff
0x1401c0515: je     0x1401c04a6
0x1401c0517: mov    r8d,r13d
0x1401c051a: sub    edx,0x1
0x1401c051d: js     0x1401c04a6
0x1401c051f: nop
0x1401c0520: mov    r11d,edx
0x1401c0523: lea    ecx,[rdx+r8*1]
0x1401c0527: sar    ecx,1
0x1401c0529: movsxd rax,ecx
0x1401c052c: mov    rdx,QWORD PTR [rbx+rax*8]
0x1401c0530: cmp    DWORD PTR [rdx+0xe0],r10d
0x1401c0537: je     0x1401c0551
0x1401c0539: lea    edx,[rcx-0x1]
0x1401c053c: cmovle edx,r11d
0x1401c0540: lea    eax,[rcx+0x1]
0x1401c0543: cmovle r8d,eax
0x1401c0547: cmp    r8d,edx
0x1401c054a: jle    0x1401c0520
0x1401c054c: jmp    0x1401c04a6
0x1401c0551: test   rdx,rdx
0x1401c0554: je     0x1401c04a6
0x1401c055a: mov    eax,DWORD PTR [rdx+0xb0]
0x1401c0560: cmp    eax,DWORD PTR [rip+0x21d310a]        # 0x142393670
0x1401c0566: je     0x1401c049d
0x1401c056c: cmp    eax,DWORD PTR [rip+0x21d3106]        # 0x142393678
0x1401c0572: je     0x1401c049d
0x1401c0578: mov    esi,0xb
0x1401c057d: jmp    0x1401c04a2
0x1401c0582: lea    r8,[rsp+0x5c]
0x1401c0587: lea    rcx,[r14+0x83a0]
0x1401c058e: call   0x140070e20
0x1401c0593: inc    ebx
0x1401c0595: mov    rdx,QWORD PTR [r15]
0x1401c0598: mov    rcx,QWORD PTR [r15+0x8]
0x1401c059c: sub    rcx,rdx
0x1401c059f: sar    rcx,0x3
0x1401c05a3: movsxd rax,ebx
0x1401c05a6: cmp    rax,rcx
0x1401c05a9: jb     0x1401c04d0
0x1401c05af: mov    DWORD PTR [r14+0x83c8],0x64
0x1401c05ba: mov    bl,0x1
0x1401c05bc: mov    rax,QWORD PTR [r15+0x8]
0x1401c05c0: sub    rax,rdx
0x1401c05c3: sar    rax,0x3
0x1401c05c7: mov    esi,eax
0x1401c05c9: mov    r13d,DWORD PTR [rsp+0x60]
0x1401c05ce: sub    eax,r13d
0x1401c05d1: mov    DWORD PTR [r14+0x83d0],eax
0x1401c05d8: jns    0x1401c05e5
0x1401c05da: xor    edi,edi
0x1401c05dc: mov    DWORD PTR [r14+0x83d0],edi
0x1401c05e3: jmp    0x1401c05e7
0x1401c05e5: xor    edi,edi
0x1401c05e7: lea    rcx,[rbp+0xa0]
0x1401c05ee: call   0x14006f850
0x1401c05f3: inc    DWORD PTR [r14+0x8384]
0x1401c05fa: mov    edx,DWORD PTR [r14+0x8384]
0x1401c0601: movsxd r9,DWORD PTR [r14+0x8380]
0x1401c0608: mov    r8,QWORD PTR [r14+0x8368]
0x1401c060f: mov    rax,QWORD PTR [r8]
0x1401c0612: mov    rcx,QWORD PTR [rax+r9*8]
0x1401c0616: cmp    edx,DWORD PTR [rcx+0x704]
0x1401c061c: jl     0x1401c0666
0x1401c061e: lea    eax,[r9+0x1]
0x1401c0622: mov    r9d,eax
0x1401c0625: mov    DWORD PTR [r14+0x8380],eax
0x1401c062c: mov    DWORD PTR [r14+0x8384],edi
0x1401c0633: mov    rdx,QWORD PTR [r8]
0x1401c0636: movsxd r10,eax
0x1401c0639: mov    rax,QWORD PTR [r8+0x8]
0x1401c063d: sub    rax,rdx
0x1401c0640: sar    rax,0x3
0x1401c0644: cmp    r10,rax
0x1401c0647: jb     0x1401c0651
0x1401c0649: mov    dl,0x1
0x1401c064b: mov    BYTE PTR [rsp+0x30],dl
0x1401c064f: jmp    0x1401c066b
0x1401c0651: mov    rax,QWORD PTR [rdx+r10*8]
0x1401c0655: cmp    DWORD PTR [rax+0x704],0x0
0x1401c065c: jg     0x1401c0666
0x1401c065e: mov    dl,0x1
0x1401c0660: mov    BYTE PTR [rsp+0x30],dl
0x1401c0664: jmp    0x1401c066b
0x1401c0666: movzx  edx,BYTE PTR [rsp+0x30]
0x1401c066b: test   bl,bl
0x1401c066d: jne    0x1401c114e
0x1401c0673: test   dl,dl
0x1401c0675: jne    0x1401c114e
0x1401c067b: test   r9d,r9d
0x1401c067e: jns    0x1401bfec0
0x1401c0684: jmp    0x1401c114e
0x1401c0689: mov    edx,DWORD PTR [r14+0x83b8]
0x1401c0690: cmp    edx,0xffffffff
0x1401c0693: je     0x1401c1155
0x1401c0699: mov    ecx,DWORD PTR [r14+0x83c0]
0x1401c06a0: test   ecx,ecx
0x1401c06a2: jle    0x1401c1155
0x1401c06a8: cmp    BYTE PTR [r14+0x83c4],dil
0x1401c06af: jne    0x1401c1155
0x1401c06b5: add    ecx,DWORD PTR [r14+0x83bc]
0x1401c06bc: mov    DWORD PTR [r14+0x83bc],ecx
0x1401c06c3: cmp    ecx,0x62700
0x1401c06c9: jl     0x1401c06e2
0x1401c06cb: lea    eax,[rdx+0x1]
0x1401c06ce: mov    DWORD PTR [r14+0x83b8],eax
0x1401c06d5: lea    eax,[rcx-0x62700]
0x1401c06db: mov    DWORD PTR [r14+0x83bc],eax
0x1401c06e2: mov    BYTE PTR [rsp+0x30],dil
0x1401c06e7: mov    eax,DWORD PTR [r14+0x8378]
0x1401c06ee: test   eax,eax
0x1401c06f0: js     0x1401c08fd
0x1401c06f6: mov    r9d,0x2
0x1401c06fc: nop    DWORD PTR [rax+0x0]
0x1401c0700: mov    r8d,eax
0x1401c0703: mov    rdx,QWORD PTR [r14+0x8368]
0x1401c070a: mov    r11,QWORD PTR [rdx]
0x1401c070d: mov    rax,QWORD PTR [rdx+0x8]
0x1401c0711: sub    rax,r11
0x1401c0714: sar    rax,0x3
0x1401c0718: cmp    r8,rax
0x1401c071b: jae    0x1401c08f8
0x1401c0721: mov    rbx,QWORD PTR [r11+r8*8]
0x1401c0725: movsxd r10,DWORD PTR [r14+0x837c]
0x1401c072c: cmp    r10d,DWORD PTR [rbx+0x400]
0x1401c0733: jge    0x1401c08f8
0x1401c0739: mov    ebx,DWORD PTR [rbx+r10*4+0x200]
0x1401c0741: mov    rax,QWORD PTR [r11+r8*8]
0x1401c0745: mov    r11d,DWORD PTR [rax+r10*4+0x300]
0x1401c074d: cmp    ebx,DWORD PTR [r14+0x83b8]
0x1401c0754: jg     0x1401c08fd
0x1401c075a: jne    0x1401c0769
0x1401c075c: cmp    r11d,DWORD PTR [r14+0x83bc]
0x1401c0763: jg     0x1401c08fd
0x1401c0769: lea    ecx,[r10+0x1]
0x1401c076d: mov    DWORD PTR [r14+0x837c],ecx
0x1401c0774: mov    rax,QWORD PTR [rdx]
0x1401c0777: mov    r11,QWORD PTR [rax+r8*8]
0x1401c077b: cmp    ecx,DWORD PTR [r11+0x400]
0x1401c0782: jl     0x1401c0859
0x1401c0788: lea    eax,[r8+0x1]
0x1401c078c: mov    DWORD PTR [r14+0x8378],eax
0x1401c0793: mov    DWORD PTR [r14+0x837c],edi
0x1401c079a: mov    r10,QWORD PTR [rdx]
0x1401c079d: lea    rcx,[r8+0x1]
0x1401c07a1: mov    rax,QWORD PTR [rdx+0x8]
0x1401c07a5: sub    rax,r10
0x1401c07a8: sar    rax,0x3
0x1401c07ac: cmp    rcx,rax
0x1401c07af: jae    0x1401c08f8
0x1401c07b5: mov    r8,QWORD PTR [r10+rcx*8]
0x1401c07b9: cmp    DWORD PTR [r8+0x400],0x0
0x1401c07c1: jle    0x1401c08f8
0x1401c07c7: mov    eax,DWORD PTR [rip+0x220cfb7]        # 0x1423cd784
0x1401c07cd: lea    edx,[rax*8+0x0]
0x1401c07d4: mov    eax,DWORD PTR [rip+0x220cfae]        # 0x1423cd788
0x1401c07da: lea    r11d,[rax+rax*2]
0x1401c07de: shl    r11d,0x2
0x1401c07e2: mov    ebx,DWORD PTR [r8]
0x1401c07e5: mov    r10d,DWORD PTR [r8+0x100]
0x1401c07ec: mov    ecx,ebx
0x1401c07ee: sub    ecx,DWORD PTR [r14+0x8370]
0x1401c07f5: mov    r8d,ecx
0x1401c07f8: neg    r8d
0x1401c07fb: cmovs  r8d,ecx
0x1401c07ff: mov    eax,edx
0x1401c0801: cdq
0x1401c0802: and    edx,0x1f
0x1401c0805: add    eax,edx
0x1401c0807: sar    eax,0x5
0x1401c080a: cmp    r8d,eax
0x1401c080d: jge    0x1401c0838
0x1401c080f: mov    ecx,r10d
0x1401c0812: sub    ecx,DWORD PTR [r14+0x8374]
0x1401c0819: mov    r8d,ecx
0x1401c081c: neg    r8d
0x1401c081f: cmovs  r8d,ecx
0x1401c0823: mov    eax,r11d
0x1401c0826: cdq
0x1401c0827: and    edx,0x1f
0x1401c082a: add    eax,edx
0x1401c082c: sar    eax,0x5
0x1401c082f: cmp    r8d,eax
0x1401c0832: jl     0x1401c08e6
0x1401c0838: mov    DWORD PTR [r14+0x8370],ebx
0x1401c083f: mov    DWORD PTR [r14+0x8374],r10d
0x1401c0846: cmp    WORD PTR [rip+0x248a2aa],r9w        # 0x14264aaf8
0x1401c084e: jl     0x1401c08de
0x1401c0854: jmp    0x1401c08e6
0x1401c0859: mov    eax,DWORD PTR [rip+0x220cf25]        # 0x1423cd784
0x1401c085f: lea    edx,[rax*8+0x0]
0x1401c0866: mov    eax,DWORD PTR [rip+0x220cf1c]        # 0x1423cd788
0x1401c086c: lea    ebx,[rax+rax*2]
0x1401c086f: shl    ebx,0x2
0x1401c0872: mov    edi,DWORD PTR [r11+r10*4+0x4]
0x1401c0877: mov    r10d,DWORD PTR [r11+r10*4+0x104]
0x1401c087f: mov    ecx,edi
0x1401c0881: sub    ecx,DWORD PTR [r14+0x8370]
0x1401c0888: mov    r8d,ecx
0x1401c088b: neg    r8d
0x1401c088e: cmovs  r8d,ecx
0x1401c0892: mov    eax,edx
0x1401c0894: cdq
0x1401c0895: and    edx,0x1f
0x1401c0898: add    eax,edx
0x1401c089a: sar    eax,0x5
0x1401c089d: cmp    r8d,eax
0x1401c08a0: jge    0x1401c08c6
0x1401c08a2: mov    ecx,r10d
0x1401c08a5: sub    ecx,DWORD PTR [r14+0x8374]
0x1401c08ac: mov    r8d,ecx
0x1401c08af: neg    r8d
0x1401c08b2: cmovs  r8d,ecx
0x1401c08b6: mov    eax,ebx
0x1401c08b8: cdq
0x1401c08b9: and    edx,0x1f
0x1401c08bc: add    eax,edx
0x1401c08be: sar    eax,0x5
0x1401c08c1: cmp    r8d,eax
0x1401c08c4: jl     0x1401c08e6
0x1401c08c6: mov    DWORD PTR [r14+0x8370],edi
0x1401c08cd: mov    DWORD PTR [r14+0x8374],r10d
0x1401c08d4: cmp    WORD PTR [rip+0x248a21c],r9w        # 0x14264aaf8
0x1401c08dc: jge    0x1401c08e6
0x1401c08de: mov    WORD PTR [rip+0x248a212],r9w        # 0x14264aaf8
0x1401c08e6: mov    eax,DWORD PTR [r14+0x8378]
0x1401c08ed: xor    edi,edi
0x1401c08ef: test   eax,eax
0x1401c08f1: js     0x1401c08fd
0x1401c08f3: jmp    0x1401c0700
0x1401c08f8: mov    BYTE PTR [rsp+0x30],0x1
0x1401c08fd: xor    al,al
0x1401c08ff: mov    BYTE PTR [rsp+0x58],al
0x1401c0903: mov    r8d,DWORD PTR [r14+0x8380]
0x1401c090a: test   r8d,r8d
0x1401c090d: js     0x1401c113c
0x1401c0913: lea    r12,[r14+0x8388]
0x1401c091a: nop    WORD PTR [rax+rax*1+0x0]
0x1401c0920: mov    rax,QWORD PTR [r14+0x8368]
0x1401c0927: mov    rcx,QWORD PTR [rax]
0x1401c092a: mov    edx,r8d
0x1401c092d: mov    rax,QWORD PTR [rax+0x8]
0x1401c0931: sub    rax,rcx
0x1401c0934: sar    rax,0x3
0x1401c0938: cmp    rdx,rax
0x1401c093b: jae    0x1401c1133
0x1401c0941: mov    rax,QWORD PTR [rcx+rdx*8]
0x1401c0945: movsxd rcx,DWORD PTR [r14+0x8384]
0x1401c094c: cmp    ecx,DWORD PTR [rax+0x704]
0x1401c0952: jge    0x1401c1133
0x1401c0958: mov    rdx,rcx
0x1401c095b: mov    ecx,DWORD PTR [rax+rcx*4+0x504]
0x1401c0962: mov    r9d,DWORD PTR [rax+rdx*4+0x604]
0x1401c096a: cmp    ecx,DWORD PTR [r14+0x83b8]
0x1401c0971: jg     0x1401c1137
0x1401c0977: jne    0x1401c0986
0x1401c0979: cmp    r9d,DWORD PTR [r14+0x83bc]
0x1401c0980: jg     0x1401c1137
0x1401c0986: xor    bl,bl
0x1401c0988: mov    edx,DWORD PTR [rax+rdx*4+0x404]
0x1401c098f: lea    rcx,[rip+0x2339322]        # 0x1424f9cb8
0x1401c0996: call   0x14007da30
0x1401c099b: mov    r15,rax
0x1401c099e: mov    QWORD PTR [rsp+0x68],rax
0x1401c09a3: test   rax,rax
0x1401c09a6: je     0x1401c10a6
0x1401c09ac: xorps  xmm0,xmm0
0x1401c09af: movups XMMWORD PTR [rbp+0xc0],xmm0
0x1401c09b6: mov    QWORD PTR [rbp+0xd0],rdi
0x1401c09bd: mov    QWORD PTR [rbp+0xd8],0xf
0x1401c09c8: mov    BYTE PTR [rbp+0xc0],bl
0x1401c09ce: lea    rcx,[rbp-0x70]
0x1401c09d2: call   0x140072080
0x1401c09d7: mov    rcx,QWORD PTR [r15]
0x1401c09da: mov    rax,QWORD PTR [rcx+0xd0]
0x1401c09e1: mov    BYTE PTR [rsp+0x20],bl
0x1401c09e5: mov    r9b,0x1
0x1401c09e8: lea    r8,[rbp-0x70]
0x1401c09ec: lea    rdx,[rbp+0xc0]
0x1401c09f3: mov    rcx,r15
0x1401c09f6: call   rax
0x1401c09f8: cmp    QWORD PTR [rbp+0xd0],0x0
0x1401c0a00: je     0x1401c109a
0x1401c0a06: mov    rax,QWORD PTR [r12+0x8]
0x1401c0a0b: sub    rax,QWORD PTR [r12]
0x1401c0a0f: sar    rax,0x3
0x1401c0a13: mov    DWORD PTR [r14+0x83cc],eax
0x1401c0a1a: xorps  xmm0,xmm0
0x1401c0a1d: movdqu XMMWORD PTR [rsp+0x38],xmm0
0x1401c0a23: mov    QWORD PTR [rsp+0x48],rdi
0x1401c0a28: mov    ecx,0x20
0x1401c0a2d: call   0x141539690
0x1401c0a32: xorps  xmm0,xmm0
0x1401c0a35: movups XMMWORD PTR [rax],xmm0
0x1401c0a38: mov    QWORD PTR [rax+0x10],rdi
0x1401c0a3c: mov    QWORD PTR [rax+0x18],0xf
0x1401c0a44: mov    BYTE PTR [rax],bl
0x1401c0a46: mov    QWORD PTR [rsp+0x70],rax
0x1401c0a4b: lea    rcx,[rbp+0xc0]
0x1401c0a52: cmp    rax,rcx
0x1401c0a55: je     0x1401c0a7d
0x1401c0a57: lea    rdx,[rbp+0xc0]
0x1401c0a5e: cmp    QWORD PTR [rbp+0xd8],0xf
0x1401c0a66: cmova  rdx,QWORD PTR [rbp+0xc0]
0x1401c0a6e: mov    r8,QWORD PTR [rbp+0xd0]
0x1401c0a75: mov    rcx,rax
0x1401c0a78: call   0x14006f8d0
0x1401c0a7d: lea    r8,[rsp+0x70]
0x1401c0a82: xor    edx,edx
0x1401c0a84: lea    rcx,[rsp+0x38]
0x1401c0a89: call   0x1400bad30
0x1401c0a8e: xor    bl,bl
0x1401c0a90: xorps  xmm0,xmm0
0x1401c0a93: movups XMMWORD PTR [rbp+0x80],xmm0
0x1401c0a9a: mov    rsi,rdi
0x1401c0a9d: mov    QWORD PTR [rbp+0x90],rdi
0x1401c0aa4: mov    QWORD PTR [rbp+0x98],0xf
0x1401c0aaf: mov    BYTE PTR [rbp+0x80],bl
0x1401c0ab5: mov    DWORD PTR [rsp+0x5c],edi
0x1401c0ab9: mov    r13,QWORD PTR [rsp+0x40]
0x1401c0abe: mov    rax,r13
0x1401c0ac1: mov    r14,QWORD PTR [rsp+0x38]
0x1401c0ac6: sub    rax,r14
0x1401c0ac9: sar    rax,0x3
0x1401c0acd: mov    QWORD PTR [rsp+0x78],rax
0x1401c0ad2: test   rax,rax
0x1401c0ad5: je     0x1401c0d6e
0x1401c0adb: mov    r15,r14
0x1401c0ade: mov    r13d,edi
0x1401c0ae1: jmp    0x1401c0ae5
0x1401c0ae3: xor    edi,edi
0x1401c0ae5: mov    r14d,edi
0x1401c0ae8: mov    rcx,QWORD PTR [r15]
0x1401c0aeb: cmp    QWORD PTR [rcx+0x10],0x0
0x1401c0af0: jbe    0x1401c0cb7
0x1401c0af6: mov    r13,QWORD PTR [rbp-0x80]
0x1401c0afa: nop    WORD PTR [rax+rax*1+0x0]
0x1401c0b00: test   bl,bl
0x1401c0b02: je     0x1401c0b1d
0x1401c0b04: mov    rax,rcx
0x1401c0b07: cmp    QWORD PTR [rcx+0x18],0xf
0x1401c0b0c: jbe    0x1401c0b11
0x1401c0b0e: mov    rax,QWORD PTR [rcx]
0x1401c0b11: cmp    BYTE PTR [rax+rdi*1],0x20
0x1401c0b15: je     0x1401c0c9c
0x1401c0b1b: xor    bl,bl
0x1401c0b1d: cmp    QWORD PTR [rcx+0x18],0xf
0x1401c0b22: jbe    0x1401c0b27
0x1401c0b24: mov    rcx,QWORD PTR [rcx]
0x1401c0b27: movzx  edx,BYTE PTR [rcx+rdi*1]
0x1401c0b2b: lea    rcx,[rbp+0x80]
0x1401c0b32: call   0x1400b9b80
0x1401c0b37: mov    rsi,QWORD PTR [rbp+0x90]
0x1401c0b3e: cmp    rsi,0x35
0x1401c0b42: jbe    0x1401c0c9c
0x1401c0b48: mov    r10d,r14d
0x1401c0b4b: xor    eax,eax
0x1401c0b4d: mov    edx,eax
0x1401c0b4f: mov    r8d,eax
0x1401c0b52: mov    rcx,QWORD PTR [r15]
0x1401c0b55: mov    r9,QWORD PTR [rcx+0x18]
0x1401c0b59: nop    DWORD PTR [rax+0x0]
0x1401c0b60: dec    r14d
0x1401c0b63: dec    rdi
0x1401c0b66: inc    edx
0x1401c0b68: inc    r8
0x1401c0b6b: mov    rax,rcx
0x1401c0b6e: cmp    r9,0xf
0x1401c0b72: jbe    0x1401c0b77
0x1401c0b74: mov    rax,QWORD PTR [rcx]
0x1401c0b77: cmp    BYTE PTR [rax+rdi*1],0x20
0x1401c0b7b: je     0x1401c0b82
0x1401c0b7d: test   rdi,rdi
0x1401c0b80: jg     0x1401c0b60
0x1401c0b82: movsxd rax,edx
0x1401c0b85: cmp    rax,rsi
0x1401c0b88: jne    0x1401c0ba8
0x1401c0b8a: lea    eax,[r10-0x1]
0x1401c0b8e: movsxd rdx,eax
0x1401c0b91: mov    r9d,0x1
0x1401c0b97: lea    r8,[rip+0x1427b9e]        # 0x1415e873c  ' '
0x1401c0b9e: call   0x1404f0930
0x1401c0ba3: jmp    0x1401c0c70
0x1401c0ba8: mov    rdx,rsi
0x1401c0bab: sub    rdx,r8
0x1401c0bae: cmp    rdx,rsi
0x1401c0bb1: ja     0x1401c0bd7
0x1401c0bb3: mov    QWORD PTR [rbp+0x90],rdx
0x1401c0bba: lea    rax,[rbp+0x80]
0x1401c0bc1: cmp    QWORD PTR [rbp+0x98],0xf
0x1401c0bc9: cmova  rax,QWORD PTR [rbp+0x80]
0x1401c0bd1: mov    BYTE PTR [rax+rdx*1],0x0
0x1401c0bd5: jmp    0x1401c0be9
0x1401c0bd7: sub    rdx,rsi
0x1401c0bda: xor    r8d,r8d
0x1401c0bdd: lea    rcx,[rbp+0x80]
0x1401c0be4: call   0x1400e12b0
0x1401c0be9: mov    ecx,0x20
0x1401c0bee: call   0x141539690
0x1401c0bf3: mov    rbx,rax
0x1401c0bf6: xorps  xmm0,xmm0
0x1401c0bf9: movups XMMWORD PTR [rax],xmm0
0x1401c0bfc: mov    QWORD PTR [rax+0x10],0x0
0x1401c0c04: mov    QWORD PTR [rax+0x18],0xf
0x1401c0c0c: mov    BYTE PTR [rax],0x0
0x1401c0c0f: mov    QWORD PTR [rsp+0x70],rax
0x1401c0c14: lea    rax,[rbp+0x80]
0x1401c0c1b: cmp    rbx,rax
0x1401c0c1e: je     0x1401c0c46
0x1401c0c20: lea    rdx,[rbp+0x80]
0x1401c0c27: cmp    QWORD PTR [rbp+0x98],0xf
0x1401c0c2f: cmova  rdx,QWORD PTR [rbp+0x80]
0x1401c0c37: mov    r8,QWORD PTR [rbp+0x90]
0x1401c0c3e: mov    rcx,rbx
0x1401c0c41: call   0x14006f8d0
0x1401c0c46: mov    rdx,QWORD PTR [r13+0x8390]
0x1401c0c4d: cmp    rdx,QWORD PTR [r13+0x8398]
0x1401c0c54: je     0x1401c0c61
0x1401c0c56: mov    QWORD PTR [rdx],rbx
0x1401c0c59: add    QWORD PTR [r12+0x8],0x8
0x1401c0c5f: jmp    0x1401c0c6e
0x1401c0c61: lea    r8,[rsp+0x70]
0x1401c0c66: mov    rcx,r12
0x1401c0c69: call   0x1400bad30
0x1401c0c6e: mov    bl,0x1
0x1401c0c70: mov    QWORD PTR [rbp+0x90],0x0
0x1401c0c7b: lea    rax,[rbp+0x80]
0x1401c0c82: cmp    QWORD PTR [rbp+0x98],0xf
0x1401c0c8a: cmova  rax,QWORD PTR [rbp+0x80]
0x1401c0c92: mov    BYTE PTR [rax],0x0
0x1401c0c95: mov    rsi,QWORD PTR [rbp+0x90]
0x1401c0c9c: inc    r14d
0x1401c0c9f: inc    rdi
0x1401c0ca2: mov    rcx,QWORD PTR [r15]
0x1401c0ca5: movsxd rax,r14d
0x1401c0ca8: cmp    rax,QWORD PTR [rcx+0x10]
0x1401c0cac: jb     0x1401c0b00
0x1401c0cb2: mov    r13d,DWORD PTR [rsp+0x5c]
0x1401c0cb7: inc    r13d
0x1401c0cba: mov    DWORD PTR [rsp+0x5c],r13d
0x1401c0cbf: add    r15,0x8
0x1401c0cc3: movsxd rax,r13d
0x1401c0cc6: cmp    rax,QWORD PTR [rsp+0x78]
0x1401c0ccb: jb     0x1401c0ae3
0x1401c0cd1: mov    r13,QWORD PTR [rsp+0x40]
0x1401c0cd6: test   rsi,rsi
0x1401c0cd9: je     0x1401c0d64
0x1401c0cdf: mov    ecx,0x20
0x1401c0ce4: call   0x141539690
0x1401c0ce9: mov    rbx,rax
0x1401c0cec: xorps  xmm0,xmm0
0x1401c0cef: movups XMMWORD PTR [rax],xmm0
0x1401c0cf2: mov    QWORD PTR [rax+0x10],0x0
0x1401c0cfa: mov    QWORD PTR [rax+0x18],0xf
0x1401c0d02: mov    BYTE PTR [rax],0x0
0x1401c0d05: mov    QWORD PTR [rsp+0x70],rax
0x1401c0d0a: lea    rax,[rbp+0x80]
0x1401c0d11: cmp    rbx,rax
0x1401c0d14: je     0x1401c0d38
0x1401c0d16: lea    rdx,[rbp+0x80]
0x1401c0d1d: cmp    QWORD PTR [rbp+0x98],0xf
0x1401c0d25: cmova  rdx,QWORD PTR [rbp+0x80]
0x1401c0d2d: mov    r8,rsi
0x1401c0d30: mov    rcx,rbx
0x1401c0d33: call   0x14006f8d0
0x1401c0d38: mov    rax,QWORD PTR [rbp-0x80]
0x1401c0d3c: mov    rdx,QWORD PTR [rax+0x8390]
0x1401c0d43: cmp    rdx,QWORD PTR [rax+0x8398]
0x1401c0d4a: je     0x1401c0d57
0x1401c0d4c: mov    QWORD PTR [rdx],rbx
0x1401c0d4f: add    QWORD PTR [r12+0x8],0x8
0x1401c0d55: jmp    0x1401c0d64
0x1401c0d57: lea    r8,[rsp+0x70]
0x1401c0d5c: mov    rcx,r12
0x1401c0d5f: call   0x1400bad30
0x1401c0d64: mov    r14,QWORD PTR [rsp+0x38]
0x1401c0d69: mov    r15,QWORD PTR [rsp+0x68]
0x1401c0d6e: lea    rcx,[rbp+0x80]
0x1401c0d75: call   0x14006f850
0x1401c0d7a: nop
0x1401c0d7b: mov    rax,r13
0x1401c0d7e: sub    rax,r14
0x1401c0d81: sar    rax,0x3
0x1401c0d85: test   rax,rax
0x1401c0d88: je     0x1401c0dd8
0x1401c0d8a: lea    rdi,[r14+0x8]
0x1401c0d8e: mov    rsi,r14
0x1401c0d91: neg    rsi
0x1401c0d94: mov    rbx,QWORD PTR [r14]
0x1401c0d97: test   rbx,rbx
0x1401c0d9a: je     0x1401c0db1
0x1401c0d9c: mov    rcx,rbx
0x1401c0d9f: call   0x14006f850
0x1401c0da4: mov    edx,0x20
0x1401c0da9: mov    rcx,rbx
0x1401c0dac: call   0x141539680
0x1401c0db1: mov    r8,r13
0x1401c0db4: sub    r8,rdi
0x1401c0db7: mov    rdx,rdi
0x1401c0dba: mov    rcx,r14
0x1401c0dbd: call   0x14153ae1a
0x1401c0dc2: sub    r13,0x8
0x1401c0dc6: lea    rax,[rsi+r13*1]
0x1401c0dca: sar    rax,0x3
0x1401c0dce: test   rax,rax
0x1401c0dd1: jne    0x1401c0d94
0x1401c0dd3: mov    QWORD PTR [rsp+0x40],r13
0x1401c0dd8: lea    rcx,[rsp+0x38]
0x1401c0ddd: call   0x140066b70
0x1401c0de2: mov    esi,0xf
0x1401c0de7: mov    DWORD PTR [rsp+0x5c],esi
0x1401c0deb: mov    rax,QWORD PTR [r15]
0x1401c0dee: mov    rcx,r15
0x1401c0df1: call   QWORD PTR [rax]
0x1401c0df3: movsx  ecx,ax
0x1401c0df6: sub    ecx,0x3
0x1401c0df9: je     0x1401c0fa3
0x1401c0dff: sub    ecx,0x1
0x1401c0e02: je     0x1401c0ebe
0x1401c0e08: sub    ecx,0x34
0x1401c0e0b: je     0x1401c0e20
0x1401c0e0d: cmp    ecx,0x1
0x1401c0e10: jne    0x1401c0f56
0x1401c0e16: mov    esi,0xe
0x1401c0e1b: jmp    0x1401c0f52
0x1401c0e20: mov    r10d,DWORD PTR [r15+0x28]
0x1401c0e24: mov    rdx,QWORD PTR [rip+0x2338ef5]        # 0x1424f9d20
0x1401c0e2b: mov    rbx,QWORD PTR [rip+0x2338ee6]        # 0x1424f9d18
0x1401c0e32: sub    rdx,rbx
0x1401c0e35: sar    rdx,0x3
0x1401c0e39: test   rdx,rdx
0x1401c0e3c: je     0x1401c0f56
0x1401c0e42: cmp    r10d,0xffffffff
0x1401c0e46: je     0x1401c0f56
0x1401c0e4c: xor    r8d,r8d
0x1401c0e4f: sub    edx,0x1
0x1401c0e52: js     0x1401c0f56
0x1401c0e58: nop    DWORD PTR [rax+rax*1+0x0]
0x1401c0e60: mov    r11d,edx
0x1401c0e63: lea    ecx,[rdx+r8*1]
0x1401c0e67: sar    ecx,1
0x1401c0e69: movsxd rax,ecx
0x1401c0e6c: mov    rdx,QWORD PTR [rbx+rax*8]
0x1401c0e70: cmp    DWORD PTR [rdx+0xe0],r10d
0x1401c0e77: je     0x1401c0e91
0x1401c0e79: lea    edx,[rcx-0x1]
0x1401c0e7c: cmovle edx,r11d
0x1401c0e80: lea    eax,[rcx+0x1]
0x1401c0e83: cmovle r8d,eax
0x1401c0e87: cmp    r8d,edx
0x1401c0e8a: jle    0x1401c0e60
0x1401c0e8c: jmp    0x1401c0f56
0x1401c0e91: test   rdx,rdx
0x1401c0e94: je     0x1401c0f56
0x1401c0e9a: mov    eax,DWORD PTR [rdx+0xb0]
0x1401c0ea0: cmp    eax,DWORD PTR [rip+0x21d27ca]        # 0x142393670
0x1401c0ea6: je     0x1401c0eb4
0x1401c0ea8: cmp    eax,DWORD PTR [rip+0x21d27ca]        # 0x142393678
0x1401c0eae: jne    0x1401c0f56
0x1401c0eb4: mov    esi,0xc
0x1401c0eb9: jmp    0x1401c0f52
0x1401c0ebe: mov    eax,DWORD PTR [r15+0x30]
0x1401c0ec2: cmp    eax,0x6
0x1401c0ec5: je     0x1401c0ed0
0x1401c0ec7: cmp    eax,0x4
0x1401c0eca: jne    0x1401c0f56
0x1401c0ed0: mov    r10d,DWORD PTR [r15+0x2c]
0x1401c0ed4: mov    rdx,QWORD PTR [rip+0x2338e45]        # 0x1424f9d20
0x1401c0edb: mov    rbx,QWORD PTR [rip+0x2338e36]        # 0x1424f9d18
0x1401c0ee2: sub    rdx,rbx
0x1401c0ee5: sar    rdx,0x3
0x1401c0ee9: test   rdx,rdx
0x1401c0eec: je     0x1401c0f56
0x1401c0eee: cmp    r10d,0xffffffff
0x1401c0ef2: je     0x1401c0f56
0x1401c0ef4: xor    r8d,r8d
0x1401c0ef7: sub    edx,0x1
0x1401c0efa: js     0x1401c0f56
0x1401c0efc: nop    DWORD PTR [rax+0x0]
0x1401c0f00: mov    r11d,edx
0x1401c0f03: lea    ecx,[rdx+r8*1]
0x1401c0f07: sar    ecx,1
0x1401c0f09: movsxd rax,ecx
0x1401c0f0c: mov    rdx,QWORD PTR [rbx+rax*8]
0x1401c0f10: cmp    DWORD PTR [rdx+0xe0],r10d
0x1401c0f17: je     0x1401c0f2e
0x1401c0f19: lea    edx,[rcx-0x1]
0x1401c0f1c: cmovle edx,r11d
0x1401c0f20: lea    eax,[rcx+0x1]
0x1401c0f23: cmovle r8d,eax
0x1401c0f27: cmp    r8d,edx
0x1401c0f2a: jle    0x1401c0f00
0x1401c0f2c: jmp    0x1401c0f56
0x1401c0f2e: test   rdx,rdx
0x1401c0f31: je     0x1401c0f56
0x1401c0f33: mov    eax,DWORD PTR [rdx+0xb0]
0x1401c0f39: cmp    eax,DWORD PTR [rip+0x21d2731]        # 0x142393670
0x1401c0f3f: je     0x1401c0f4d
0x1401c0f41: cmp    eax,DWORD PTR [rip+0x21d2731]        # 0x142393678
0x1401c0f47: jne    0x1401c1028
0x1401c0f4d: mov    esi,0xd
0x1401c0f52: mov    DWORD PTR [rsp+0x5c],esi
0x1401c0f56: mov    r14,QWORD PTR [rbp-0x80]
0x1401c0f5a: movsxd rdi,DWORD PTR [r14+0x83cc]
0x1401c0f61: mov    rdx,QWORD PTR [r12]
0x1401c0f65: mov    rcx,QWORD PTR [r12+0x8]
0x1401c0f6a: sub    rcx,rdx
0x1401c0f6d: sar    rcx,0x3
0x1401c0f71: cmp    rdi,rcx
0x1401c0f74: jae    0x1401c1061
0x1401c0f7a: nop    WORD PTR [rax+rax*1+0x0]
0x1401c0f80: mov    rdx,QWORD PTR [r14+0x83a8]
0x1401c0f87: cmp    rdx,QWORD PTR [r14+0x83b0]
0x1401c0f8e: je     0x1401c1032
0x1401c0f94: mov    DWORD PTR [rdx],esi
0x1401c0f96: add    QWORD PTR [r14+0x83a8],0x4
0x1401c0f9e: jmp    0x1401c1043
0x1401c0fa3: mov    r10d,DWORD PTR [r15+0x28]
0x1401c0fa7: mov    rdx,QWORD PTR [rip+0x2338d72]        # 0x1424f9d20
0x1401c0fae: mov    rbx,QWORD PTR [rip+0x2338d63]        # 0x1424f9d18
0x1401c0fb5: sub    rdx,rbx
0x1401c0fb8: sar    rdx,0x3
0x1401c0fbc: test   rdx,rdx
0x1401c0fbf: je     0x1401c0f56
0x1401c0fc1: cmp    r10d,0xffffffff
0x1401c0fc5: je     0x1401c0f56
0x1401c0fc7: xor    r8d,r8d
0x1401c0fca: sub    edx,0x1
0x1401c0fcd: js     0x1401c0f56
0x1401c0fcf: nop
0x1401c0fd0: mov    r11d,edx
0x1401c0fd3: lea    ecx,[rdx+r8*1]
0x1401c0fd7: sar    ecx,1
0x1401c0fd9: movsxd rax,ecx
0x1401c0fdc: mov    rdx,QWORD PTR [rbx+rax*8]
0x1401c0fe0: cmp    DWORD PTR [rdx+0xe0],r10d
0x1401c0fe7: je     0x1401c1001
0x1401c0fe9: lea    edx,[rcx-0x1]
0x1401c0fec: cmovle edx,r11d
0x1401c0ff0: lea    eax,[rcx+0x1]
0x1401c0ff3: cmovle r8d,eax
0x1401c0ff7: cmp    r8d,edx
0x1401c0ffa: jle    0x1401c0fd0
0x1401c0ffc: jmp    0x1401c0f56
0x1401c1001: test   rdx,rdx
0x1401c1004: je     0x1401c0f56
0x1401c100a: mov    eax,DWORD PTR [rdx+0xb0]
0x1401c1010: cmp    eax,DWORD PTR [rip+0x21d265a]        # 0x142393670
0x1401c1016: je     0x1401c0f4d
0x1401c101c: cmp    eax,DWORD PTR [rip+0x21d2656]        # 0x142393678
0x1401c1022: je     0x1401c0f4d
0x1401c1028: mov    esi,0xb
0x1401c102d: jmp    0x1401c0f52
0x1401c1032: lea    r8,[rsp+0x5c]
0x1401c1037: lea    rcx,[r14+0x83a0]
0x1401c103e: call   0x140070e20
0x1401c1043: inc    edi
0x1401c1045: mov    rdx,QWORD PTR [r12]
0x1401c1049: mov    rcx,QWORD PTR [r12+0x8]
0x1401c104e: sub    rcx,rdx
0x1401c1051: sar    rcx,0x3
0x1401c1055: movsxd rax,edi
0x1401c1058: cmp    rax,rcx
0x1401c105b: jb     0x1401c0f80
0x1401c1061: mov    DWORD PTR [r14+0x83c8],0x64
0x1401c106c: mov    bl,0x1
0x1401c106e: mov    rax,QWORD PTR [r12+0x8]
0x1401c1073: sub    rax,rdx
0x1401c1076: sar    rax,0x3
0x1401c107a: mov    esi,eax
0x1401c107c: mov    r13d,DWORD PTR [rsp+0x60]
0x1401c1081: sub    eax,r13d
0x1401c1084: mov    DWORD PTR [r14+0x83d0],eax
0x1401c108b: jns    0x1401c1098
0x1401c108d: xor    edi,edi
0x1401c108f: mov    DWORD PTR [r14+0x83d0],edi
0x1401c1096: jmp    0x1401c109a
0x1401c1098: xor    edi,edi
0x1401c109a: lea    rcx,[rbp+0xc0]
0x1401c10a1: call   0x14006f850
0x1401c10a6: mov    edx,DWORD PTR [r14+0x8384]
0x1401c10ad: inc    edx
0x1401c10af: mov    DWORD PTR [r14+0x8384],edx
0x1401c10b6: movsxd r8,DWORD PTR [r14+0x8380]
0x1401c10bd: mov    r9,QWORD PTR [r14+0x8368]
0x1401c10c4: mov    rax,QWORD PTR [r9]
0x1401c10c7: mov    rcx,QWORD PTR [rax+r8*8]
0x1401c10cb: cmp    edx,DWORD PTR [rcx+0x704]
0x1401c10d1: jl     0x1401c111b
0x1401c10d3: lea    eax,[r8+0x1]
0x1401c10d7: mov    r8d,eax
0x1401c10da: mov    DWORD PTR [r14+0x8380],eax
0x1401c10e1: mov    DWORD PTR [r14+0x8384],edi
0x1401c10e8: mov    rcx,QWORD PTR [r9]
0x1401c10eb: movsxd rdx,eax
0x1401c10ee: mov    rax,QWORD PTR [r9+0x8]
0x1401c10f2: sub    rax,rcx
0x1401c10f5: sar    rax,0x3
0x1401c10f9: cmp    rdx,rax
0x1401c10fc: jb     0x1401c1106
0x1401c10fe: mov    al,0x1
0x1401c1100: mov    BYTE PTR [rsp+0x58],al
0x1401c1104: jmp    0x1401c1120
0x1401c1106: mov    rax,QWORD PTR [rcx+rdx*8]
0x1401c110a: cmp    DWORD PTR [rax+0x704],0x0
0x1401c1111: jg     0x1401c111b
0x1401c1113: mov    al,0x1
0x1401c1115: mov    BYTE PTR [rsp+0x58],al
0x1401c1119: jmp    0x1401c1120
0x1401c111b: movzx  eax,BYTE PTR [rsp+0x58]
0x1401c1120: test   bl,bl
0x1401c1122: jne    0x1401c113c
0x1401c1124: test   al,al
0x1401c1126: jne    0x1401c113c
0x1401c1128: test   r8d,r8d
0x1401c112b: jns    0x1401c0920
0x1401c1131: jmp    0x1401c113c
0x1401c1133: mov    al,0x1
0x1401c1135: jmp    0x1401c113c
0x1401c1137: movzx  eax,BYTE PTR [rsp+0x58]
0x1401c113c: cmp    BYTE PTR [rsp+0x30],0x0
0x1401c1141: je     0x1401c114e
0x1401c1143: test   al,al
0x1401c1145: je     0x1401c114e
0x1401c1147: mov    DWORD PTR [r14+0x83c0],edi
0x1401c114e: movzx  ebx,BYTE PTR [rip+0x21cf480]        # 0x1423905d5
0x1401c1155: cmp    BYTE PTR [r14+0x83d4],0x0
0x1401c115d: je     0x1401c178d
0x1401c1163: test   bl,bl
0x1401c1165: je     0x1401c1250
0x1401c116b: cmp    BYTE PTR [rip+0x21cf45c],0x0        # 0x1423905ce
0x1401c1172: je     0x1401c1250
0x1401c1178: mov    QWORD PTR [rsp+0x50],0x0
0x1401c1181: mov    eax,DWORD PTR [r14+0x83d0]
0x1401c1188: mov    DWORD PTR [rsp+0x38],eax
0x1401c118c: mov    DWORD PTR [rsp+0x3c],edi
0x1401c1190: lea    eax,[rsi-0x1]
0x1401c1193: mov    DWORD PTR [rsp+0x40],eax
0x1401c1197: mov    DWORD PTR [rsp+0x48],0x6
0x1401c119f: lea    eax,[r13+0x3]
0x1401c11a3: mov    DWORD PTR [rsp+0x4c],eax
0x1401c11a7: mov    DWORD PTR [rsp+0x44],r13d
0x1401c11ac: lea    rcx,[rsp+0x38]
0x1401c11b1: call   0x1400bb3b0
0x1401c11b6: mov    edx,DWORD PTR [rsp+0x48]
0x1401c11ba: mov    esi,DWORD PTR [rsp+0x64]
0x1401c11be: cmp    esi,edx
0x1401c11c0: jg     0x1401c11cc
0x1401c11c2: mov    eax,DWORD PTR [rsp+0x3c]
0x1401c11c6: mov    DWORD PTR [rsp+0x38],eax
0x1401c11ca: jmp    0x1401c1236
0x1401c11cc: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401c11d0: cmp    esi,ecx
0x1401c11d2: jl     0x1401c11ec
0x1401c11d4: mov    eax,DWORD PTR [rsp+0x40]
0x1401c11d8: sub    eax,DWORD PTR [rsp+0x44]
0x1401c11dc: inc    eax
0x1401c11de: mov    DWORD PTR [rsp+0x38],eax
0x1401c11e2: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401c11e6: cmp    eax,ecx
0x1401c11e8: jge    0x1401c1236
0x1401c11ea: jmp    0x1401c1232
0x1401c11ec: cmp    ecx,edx
0x1401c11ee: jle    0x1401c1236
0x1401c11f0: mov    r9d,DWORD PTR [rsp+0x40]
0x1401c11f5: mov    eax,r9d
0x1401c11f8: mov    r10d,DWORD PTR [rsp+0x3c]
0x1401c11fd: sub    eax,r10d
0x1401c1200: sub    eax,DWORD PTR [rsp+0x44]
0x1401c1204: add    eax,0x1
0x1401c1207: cmovns edi,eax
0x1401c120a: sub    esi,edx
0x1401c120c: imul   edi,esi
0x1401c120f: sub    ecx,edx
0x1401c1211: inc    ecx
0x1401c1213: mov    eax,edi
0x1401c1215: cdq
0x1401c1216: idiv   ecx
0x1401c1218: lea    ecx,[rax+r10*1]
0x1401c121c: sub    r9d,DWORD PTR [rsp+0x44]
0x1401c1221: inc    r9d
0x1401c1224: cmp    ecx,r9d
0x1401c1227: cmovg  ecx,r9d
0x1401c122b: cmp    ecx,r10d
0x1401c122e: cmovl  ecx,r10d
0x1401c1232: mov    DWORD PTR [rsp+0x38],ecx
0x1401c1236: lea    rcx,[rsp+0x38]
0x1401c123b: call   0x1400bb3b0
0x1401c1240: mov    eax,DWORD PTR [rsp+0x38]
0x1401c1244: mov    DWORD PTR [r14+0x83d0],eax
0x1401c124b: jmp    0x1401c178d
0x1401c1250: mov    BYTE PTR [r14+0x83d4],0x0
0x1401c1258: jmp    0x1401c178d
0x1401c125d: mov    r8,QWORD PTR [r14+0x83d8]
0x1401c1264: test   r8,r8
0x1401c1267: je     0x1401c1394
0x1401c126d: lea    r9d,[rdx-0x5]
0x1401c1271: mov    rcx,QWORD PTR [r8+0xb0]
0x1401c1278: sub    rcx,QWORD PTR [r8+0xa8]
0x1401c127f: sar    rcx,0x2
0x1401c1283: mov    rax,QWORD PTR [r8+0x38]
0x1401c1287: sub    rax,QWORD PTR [r8+0x30]
0x1401c128b: sar    rax,1
0x1401c128e: add    ecx,eax
0x1401c1290: test   ecx,ecx
0x1401c1292: jle    0x1401c178d
0x1401c1298: cmp    BYTE PTR [r14+0x83e4],0x0
0x1401c12a0: je     0x1401c178d
0x1401c12a6: test   bl,bl
0x1401c12a8: je     0x1401c1387
0x1401c12ae: cmp    BYTE PTR [rip+0x21cf319],0x0        # 0x1423905ce
0x1401c12b5: je     0x1401c1387
0x1401c12bb: xor    ebx,ebx
0x1401c12bd: mov    QWORD PTR [rsp+0x50],rbx
0x1401c12c2: mov    eax,DWORD PTR [r14+0x83e0]
0x1401c12c9: mov    DWORD PTR [rsp+0x38],eax
0x1401c12cd: mov    DWORD PTR [rsp+0x3c],ebx
0x1401c12d1: lea    eax,[rcx-0x1]
0x1401c12d4: mov    DWORD PTR [rsp+0x40],eax
0x1401c12d8: mov    DWORD PTR [rsp+0x48],0x6
0x1401c12e0: lea    eax,[rdx-0x2]
0x1401c12e3: mov    DWORD PTR [rsp+0x4c],eax
0x1401c12e7: mov    DWORD PTR [rsp+0x44],r9d
0x1401c12ec: lea    rcx,[rsp+0x38]
0x1401c12f1: call   0x1400bb3b0
0x1401c12f6: mov    edx,DWORD PTR [rsp+0x48]
0x1401c12fa: cmp    edi,edx
0x1401c12fc: jg     0x1401c1308
0x1401c12fe: mov    eax,DWORD PTR [rsp+0x3c]
0x1401c1302: mov    DWORD PTR [rsp+0x38],eax
0x1401c1306: jmp    0x1401c136d
0x1401c1308: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401c130c: cmp    edi,ecx
0x1401c130e: jl     0x1401c1328
0x1401c1310: mov    eax,DWORD PTR [rsp+0x40]
0x1401c1314: sub    eax,DWORD PTR [rsp+0x44]
0x1401c1318: inc    eax
0x1401c131a: mov    DWORD PTR [rsp+0x38],eax
0x1401c131e: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401c1322: cmp    eax,ecx
0x1401c1324: jge    0x1401c136d
0x1401c1326: jmp    0x1401c1369
0x1401c1328: cmp    ecx,edx
0x1401c132a: jle    0x1401c136d
0x1401c132c: mov    r8d,DWORD PTR [rsp+0x40]
0x1401c1331: sub    r8d,DWORD PTR [rsp+0x44]
0x1401c1336: mov    eax,r8d
0x1401c1339: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401c133e: sub    eax,r9d
0x1401c1341: add    eax,0x1
0x1401c1344: cmovns ebx,eax
0x1401c1347: sub    edi,edx
0x1401c1349: imul   ebx,edi
0x1401c134c: sub    ecx,edx
0x1401c134e: inc    ecx
0x1401c1350: mov    eax,ebx
0x1401c1352: cdq
0x1401c1353: idiv   ecx
0x1401c1355: lea    ecx,[rax+r9*1]
0x1401c1359: lea    eax,[r8+0x1]
0x1401c135d: cmp    ecx,eax
0x1401c135f: cmovg  ecx,eax
0x1401c1362: cmp    ecx,r9d
0x1401c1365: cmovl  ecx,r9d
0x1401c1369: mov    DWORD PTR [rsp+0x38],ecx
0x1401c136d: lea    rcx,[rsp+0x38]
0x1401c1372: call   0x1400bb3b0
0x1401c1377: mov    eax,DWORD PTR [rsp+0x38]
0x1401c137b: mov    DWORD PTR [r14+0x83e0],eax
0x1401c1382: jmp    0x1401c178d
0x1401c1387: mov    BYTE PTR [r14+0x83e4],0x0
0x1401c138f: jmp    0x1401c178d
0x1401c1394: lea    ecx,[rdx-0x1]
0x1401c1397: mov    eax,0x55555556
0x1401c139c: imul   ecx
0x1401c139e: mov    eax,edx
0x1401c13a0: shr    eax,0x1f
0x1401c13a3: add    edx,eax
0x1401c13a5: mov    rcx,QWORD PTR [r14+0x8350]
0x1401c13ac: sub    rcx,QWORD PTR [r14+0x8348]
0x1401c13b3: sar    rcx,0x2
0x1401c13b7: mov    rax,QWORD PTR [r14+0x8338]
0x1401c13be: sub    rax,QWORD PTR [r14+0x8330]
0x1401c13c5: sar    rax,0x2
0x1401c13c9: add    ecx,eax
0x1401c13cb: test   ecx,ecx
0x1401c13cd: jle    0x1401c178d
0x1401c13d3: cmp    BYTE PTR [r14+0x8364],0x0
0x1401c13db: je     0x1401c178d
0x1401c13e1: test   bl,bl
0x1401c13e3: je     0x1401c14ca
0x1401c13e9: cmp    BYTE PTR [rip+0x21cf1de],0x0        # 0x1423905ce
0x1401c13f0: je     0x1401c14ca
0x1401c13f6: xor    ebx,ebx
0x1401c13f8: mov    QWORD PTR [rsp+0x50],rbx
0x1401c13fd: mov    eax,DWORD PTR [r14+0x8360]
0x1401c1404: mov    DWORD PTR [rsp+0x38],eax
0x1401c1408: mov    DWORD PTR [rsp+0x3c],ebx
0x1401c140c: lea    eax,[rcx-0x1]
0x1401c140f: mov    DWORD PTR [rsp+0x40],eax
0x1401c1413: mov    r9d,0x2
0x1401c1419: mov    DWORD PTR [rsp+0x48],r9d
0x1401c141e: lea    eax,[rdx*2-0x1]
0x1401c1425: add    eax,edx
0x1401c1427: mov    DWORD PTR [rsp+0x4c],eax
0x1401c142b: mov    DWORD PTR [rsp+0x44],edx
0x1401c142f: lea    rcx,[rsp+0x38]
0x1401c1434: call   0x1400bb3b0
0x1401c1439: mov    edx,DWORD PTR [rsp+0x48]
0x1401c143d: cmp    edi,edx
0x1401c143f: jg     0x1401c144b
0x1401c1441: mov    eax,DWORD PTR [rsp+0x3c]
0x1401c1445: mov    DWORD PTR [rsp+0x38],eax
0x1401c1449: jmp    0x1401c14b0
0x1401c144b: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401c144f: cmp    edi,ecx
0x1401c1451: jl     0x1401c146b
0x1401c1453: mov    eax,DWORD PTR [rsp+0x40]
0x1401c1457: sub    eax,DWORD PTR [rsp+0x44]
0x1401c145b: inc    eax
0x1401c145d: mov    DWORD PTR [rsp+0x38],eax
0x1401c1461: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401c1465: cmp    eax,ecx
0x1401c1467: jge    0x1401c14b0
0x1401c1469: jmp    0x1401c14ac
0x1401c146b: cmp    ecx,edx
0x1401c146d: jle    0x1401c14b0
0x1401c146f: mov    r8d,DWORD PTR [rsp+0x40]
0x1401c1474: sub    r8d,DWORD PTR [rsp+0x44]
0x1401c1479: mov    eax,r8d
0x1401c147c: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401c1481: sub    eax,r9d
0x1401c1484: add    eax,0x1
0x1401c1487: cmovns ebx,eax
0x1401c148a: sub    edi,edx
0x1401c148c: imul   ebx,edi
0x1401c148f: sub    ecx,edx
0x1401c1491: inc    ecx
0x1401c1493: mov    eax,ebx
0x1401c1495: cdq
0x1401c1496: idiv   ecx
0x1401c1498: lea    ecx,[rax+r9*1]
0x1401c149c: lea    eax,[r8+0x1]
0x1401c14a0: cmp    ecx,eax
0x1401c14a2: cmovg  ecx,eax
0x1401c14a5: cmp    ecx,r9d
0x1401c14a8: cmovl  ecx,r9d
0x1401c14ac: mov    DWORD PTR [rsp+0x38],ecx
0x1401c14b0: lea    rcx,[rsp+0x38]
0x1401c14b5: call   0x1400bb3b0
0x1401c14ba: mov    eax,DWORD PTR [rsp+0x38]
0x1401c14be: mov    DWORD PTR [r14+0x8360],eax
0x1401c14c5: jmp    0x1401c178d
0x1401c14ca: mov    BYTE PTR [r14+0x8364],0x0
0x1401c14d2: jmp    0x1401c178d
0x1401c14d7: mov    esi,0xffffffff
0x1401c14dc: test   bl,bl
0x1401c14de: cmovne esi,DWORD PTR [rip+0x24890cf]        # 0x14264a5b4
0x1401c14e5: lea    rdx,[rsp+0x64]
0x1401c14ea: lea    rcx,[rsp+0x60]
0x1401c14ef: call   0x140c33370
0x1401c14f4: mov    ecx,0x14
0x1401c14f9: mov    eax,DWORD PTR [rip+0x220c289]        # 0x1423cd788
0x1401c14ff: cmp    eax,0x2e
0x1401c1502: jle    0x1401c1511
0x1401c1504: lea    ecx,[rax-0x1a]
0x1401c1507: mov    eax,0x1e
0x1401c150c: cmp    ecx,eax
0x1401c150e: cmovg  ecx,eax
0x1401c1511: dec    ecx
0x1401c1513: mov    eax,0x55555556
0x1401c1518: imul   ecx
0x1401c151a: mov    eax,edx
0x1401c151c: shr    eax,0x1f
0x1401c151f: add    edx,eax
0x1401c1521: cmp    BYTE PTR [r14+0x8404],0x0
0x1401c1529: je     0x1401c178d
0x1401c152f: test   bl,bl
0x1401c1531: je     0x1401c1629
0x1401c1537: cmp    BYTE PTR [rip+0x21cf090],0x0        # 0x1423905ce
0x1401c153e: je     0x1401c1629
0x1401c1544: xor    ebx,ebx
0x1401c1546: mov    QWORD PTR [rsp+0x50],rbx
0x1401c154b: mov    eax,DWORD PTR [r14+0x8400]
0x1401c1552: mov    DWORD PTR [rsp+0x38],eax
0x1401c1556: mov    DWORD PTR [rsp+0x3c],ebx
0x1401c155a: mov    rax,QWORD PTR [r14+0x83f0]
0x1401c1561: sub    rax,QWORD PTR [r14+0x83e8]
0x1401c1568: sar    rax,0x3
0x1401c156c: dec    eax
0x1401c156e: mov    DWORD PTR [rsp+0x40],eax
0x1401c1572: mov    r9d,0x2
0x1401c1578: mov    DWORD PTR [rsp+0x48],r9d
0x1401c157d: lea    eax,[rdx*2-0x1]
0x1401c1584: add    eax,edx
0x1401c1586: mov    DWORD PTR [rsp+0x4c],eax
0x1401c158a: mov    DWORD PTR [rsp+0x44],edx
0x1401c158e: lea    rcx,[rsp+0x38]
0x1401c1593: call   0x1400bb3b0
0x1401c1598: mov    edx,DWORD PTR [rsp+0x48]
0x1401c159c: cmp    esi,edx
0x1401c159e: jg     0x1401c15aa
0x1401c15a0: mov    eax,DWORD PTR [rsp+0x3c]
0x1401c15a4: mov    DWORD PTR [rsp+0x38],eax
0x1401c15a8: jmp    0x1401c160f
0x1401c15aa: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401c15ae: cmp    esi,ecx
0x1401c15b0: jl     0x1401c15ca
0x1401c15b2: mov    eax,DWORD PTR [rsp+0x40]
0x1401c15b6: sub    eax,DWORD PTR [rsp+0x44]
0x1401c15ba: inc    eax
0x1401c15bc: mov    DWORD PTR [rsp+0x38],eax
0x1401c15c0: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401c15c4: cmp    eax,ecx
0x1401c15c6: jge    0x1401c160f
0x1401c15c8: jmp    0x1401c160b
0x1401c15ca: cmp    ecx,edx
0x1401c15cc: jle    0x1401c160f
0x1401c15ce: mov    r8d,DWORD PTR [rsp+0x40]
0x1401c15d3: sub    r8d,DWORD PTR [rsp+0x44]
0x1401c15d8: mov    eax,r8d
0x1401c15db: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401c15e0: sub    eax,r9d
0x1401c15e3: add    eax,0x1
0x1401c15e6: cmovns ebx,eax
0x1401c15e9: sub    esi,edx
0x1401c15eb: imul   ebx,esi
0x1401c15ee: sub    ecx,edx
0x1401c15f0: inc    ecx
0x1401c15f2: mov    eax,ebx
0x1401c15f4: cdq
0x1401c15f5: idiv   ecx
0x1401c15f7: lea    ecx,[rax+r9*1]
0x1401c15fb: lea    eax,[r8+0x1]
0x1401c15ff: cmp    ecx,eax
0x1401c1601: cmovg  ecx,eax
0x1401c1604: cmp    ecx,r9d
0x1401c1607: cmovl  ecx,r9d
0x1401c160b: mov    DWORD PTR [rsp+0x38],ecx
0x1401c160f: lea    rcx,[rsp+0x38]
0x1401c1614: call   0x1400bb3b0
0x1401c1619: mov    eax,DWORD PTR [rsp+0x38]
0x1401c161d: mov    DWORD PTR [r14+0x8400],eax
0x1401c1624: jmp    0x1401c178d
0x1401c1629: mov    BYTE PTR [r14+0x8404],0x0
0x1401c1631: jmp    0x1401c178d
0x1401c1636: mov    esi,0xffffffff
0x1401c163b: test   bl,bl
0x1401c163d: cmovne esi,DWORD PTR [rip+0x2488f70]        # 0x14264a5b4
0x1401c1644: lea    rdx,[rsp+0x64]
0x1401c1649: lea    rcx,[rsp+0x60]
0x1401c164e: call   0x140c33370
0x1401c1653: mov    ecx,0x14
0x1401c1658: mov    eax,DWORD PTR [rip+0x220c12a]        # 0x1423cd788
0x1401c165e: cmp    eax,0x2e
0x1401c1661: jle    0x1401c1670
0x1401c1663: lea    ecx,[rax-0x1a]
0x1401c1666: mov    eax,0x1e
0x1401c166b: cmp    ecx,eax
0x1401c166d: cmovg  ecx,eax
0x1401c1670: dec    ecx
0x1401c1672: mov    eax,0x55555556
0x1401c1677: imul   ecx
0x1401c1679: mov    eax,edx
0x1401c167b: shr    eax,0x1f
0x1401c167e: add    edx,eax
0x1401c1680: cmp    BYTE PTR [r14+0x8444],0x0
0x1401c1688: je     0x1401c178d
0x1401c168e: test   bl,bl
0x1401c1690: je     0x1401c1785
0x1401c1696: cmp    BYTE PTR [rip+0x21cef31],0x0        # 0x1423905ce
0x1401c169d: je     0x1401c1785
0x1401c16a3: xor    ebx,ebx
0x1401c16a5: mov    QWORD PTR [rsp+0x50],rbx
0x1401c16aa: mov    eax,DWORD PTR [r14+0x8440]
0x1401c16b1: mov    DWORD PTR [rsp+0x38],eax
0x1401c16b5: mov    DWORD PTR [rsp+0x3c],ebx
0x1401c16b9: mov    rax,QWORD PTR [r14+0x8418]
0x1401c16c0: sub    rax,QWORD PTR [r14+0x8410]
0x1401c16c7: sar    rax,0x3
0x1401c16cb: dec    eax
0x1401c16cd: mov    DWORD PTR [rsp+0x40],eax
0x1401c16d1: mov    r9d,0x2
0x1401c16d7: mov    DWORD PTR [rsp+0x48],r9d
0x1401c16dc: lea    eax,[rdx*2-0x1]
0x1401c16e3: add    eax,edx
0x1401c16e5: mov    DWORD PTR [rsp+0x4c],eax
0x1401c16e9: mov    DWORD PTR [rsp+0x44],edx
0x1401c16ed: lea    rcx,[rsp+0x38]
0x1401c16f2: call   0x1400bb3b0
0x1401c16f7: mov    edx,DWORD PTR [rsp+0x48]
0x1401c16fb: cmp    esi,edx
0x1401c16fd: jg     0x1401c1709
0x1401c16ff: mov    eax,DWORD PTR [rsp+0x3c]
0x1401c1703: mov    DWORD PTR [rsp+0x38],eax
0x1401c1707: jmp    0x1401c176e
0x1401c1709: mov    ecx,DWORD PTR [rsp+0x4c]
0x1401c170d: cmp    esi,ecx
0x1401c170f: jl     0x1401c1729
0x1401c1711: mov    eax,DWORD PTR [rsp+0x40]
0x1401c1715: sub    eax,DWORD PTR [rsp+0x44]
0x1401c1719: inc    eax
0x1401c171b: mov    DWORD PTR [rsp+0x38],eax
0x1401c171f: mov    ecx,DWORD PTR [rsp+0x3c]
0x1401c1723: cmp    eax,ecx
0x1401c1725: jge    0x1401c176e
0x1401c1727: jmp    0x1401c176a
0x1401c1729: cmp    ecx,edx
0x1401c172b: jle    0x1401c176e
0x1401c172d: mov    r8d,DWORD PTR [rsp+0x40]
0x1401c1732: sub    r8d,DWORD PTR [rsp+0x44]
0x1401c1737: mov    eax,r8d
0x1401c173a: mov    r9d,DWORD PTR [rsp+0x3c]
0x1401c173f: sub    eax,r9d
0x1401c1742: add    eax,0x1
0x1401c1745: cmovns ebx,eax
0x1401c1748: sub    esi,edx
0x1401c174a: imul   ebx,esi
0x1401c174d: sub    ecx,edx
0x1401c174f: inc    ecx
0x1401c1751: mov    eax,ebx
0x1401c1753: cdq
0x1401c1754: idiv   ecx
0x1401c1756: lea    ecx,[rax+r9*1]
0x1401c175a: lea    eax,[r8+0x1]
0x1401c175e: cmp    ecx,eax
0x1401c1760: cmovg  ecx,eax
0x1401c1763: cmp    ecx,r9d
0x1401c1766: cmovl  ecx,r9d
0x1401c176a: mov    DWORD PTR [rsp+0x38],ecx
0x1401c176e: lea    rcx,[rsp+0x38]
0x1401c1773: call   0x1400bb3b0
0x1401c1778: mov    eax,DWORD PTR [rsp+0x38]
0x1401c177c: mov    DWORD PTR [r14+0x8440],eax
0x1401c1783: jmp    0x1401c178d
0x1401c1785: mov    BYTE PTR [r14+0x8444],0x0
0x1401c178d: mov    rcx,QWORD PTR [rbp+0xe0]
0x1401c1794: xor    rcx,rsp
0x1401c1797: call   0x141539660
0x1401c179c: lea    r11,[rsp+0x1f0]
0x1401c17a4: mov    rbx,QWORD PTR [r11+0x38]
0x1401c17a8: mov    rsi,QWORD PTR [r11+0x40]
0x1401c17ac: mov    rdi,QWORD PTR [r11+0x48]
0x1401c17b0: mov    rsp,r11
0x1401c17b3: pop    r15
0x1401c17b5: pop    r14
0x1401c17b7: pop    r13
0x1401c17b9: pop    r12
0x1401c17bb: pop    rbp
0x1401c17bc: ret
0x1401c17bd: nop    DWORD PTR [rax]
0x1401c17c0: {rex2 0xf5} bndstx [r24],(bad)
0x1401c17c4: cmp    dh,bh
0x1401c17c6: sbb    eax,DWORD PTR [rax]
0x1401c17c8: cdq
0x1401c17c9: clc
0x1401c17ca: sbb    eax,DWORD PTR [rax]
0x1401c17cc: movabs al,ds:0xd7001bfe05001bfc
0x1401c17d5: adc    al,0x1c
0x1401c17d7: add    BYTE PTR [rsi],dh
0x1401c17d9: (bad)
0x1401c17da: sbb    al,0x0
