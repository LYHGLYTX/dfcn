; image=D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe
; identity=PE:6a70a6d9:02711000; entry=0x140659090; unwind_end=0x14065a250
0x140659090: mov    QWORD PTR [rsp+0x20],r9
0x140659095: mov    QWORD PTR [rsp+0x18],r8
0x14065909a: mov    QWORD PTR [rsp+0x10],rdx
0x14065909f: push   rbx
0x1406590a0: push   rbp
0x1406590a1: push   rsi
0x1406590a2: push   rdi
0x1406590a3: push   r12
0x1406590a5: push   r13
0x1406590a7: push   r14
0x1406590a9: push   r15
0x1406590ab: sub    rsp,0x38
0x1406590af: xor    ebp,ebp
0x1406590b1: mov    r15,r9
0x1406590b4: mov    QWORD PTR [rcx+0x10],rbp
0x1406590b8: mov    r12,r8
0x1406590bb: cmp    QWORD PTR [rcx+0x18],0xf
0x1406590c0: mov    r14,rdx
0x1406590c3: mov    rsi,rcx
0x1406590c6: mov    rax,rcx
0x1406590c9: jbe    0x1406590ce
0x1406590cb: mov    rax,QWORD PTR [rcx]
0x1406590ce: mov    BYTE PTR [rax],bpl
0x1406590d1: mov    r13,rbp
0x1406590d4: mov    rdi,QWORD PTR [rdx+0x20]
0x1406590d8: mov    rbx,QWORD PTR [rdx+0x28]
0x1406590dc: nop    DWORD PTR [rax+0x0]
0x1406590e0: cmp    rdi,rbx
0x1406590e3: jae    0x1406590fb
0x1406590e5: mov    rcx,QWORD PTR [rdi]
0x1406590e8: mov    rax,QWORD PTR [rcx]
0x1406590eb: call   QWORD PTR [rax]
0x1406590ed: cmp    eax,0x8
0x1406590f0: je     0x1406590f8
0x1406590f2: add    rdi,0x8
0x1406590f6: jmp    0x1406590e0
0x1406590f8: mov    r13,QWORD PTR [rdi]
0x1406590fb: mov    rdi,QWORD PTR [r14+0x20]
0x1406590ff: nop
0x140659100: cmp    rdi,rbx
0x140659103: jae    0x140659559
0x140659109: mov    rcx,QWORD PTR [rdi]
0x14065910c: mov    rax,QWORD PTR [rcx]
0x14065910f: call   QWORD PTR [rax]
0x140659111: cmp    eax,0x1
0x140659114: je     0x14065911c
0x140659116: add    rdi,0x8
0x14065911a: jmp    0x140659100
0x14065911c: mov    r15,QWORD PTR [rdi]
0x14065911f: movsxd rax,DWORD PTR [r15+0x14]
0x140659123: cmp    eax,0xffffffff
0x140659126: je     0x140659f7c
0x14065912c: mov    rdx,QWORD PTR [r14]
0x14065912f: mov    r8,r12
0x140659132: mov    rdi,QWORD PTR [rsp+0x98]
0x14065913a: mov    rcx,rsi
0x14065913d: mov    r9,rdi
0x140659140: mov    WORD PTR [rsp+0x20],bp
0x140659145: mov    rdx,QWORD PTR [rdx+rax*8]
0x140659149: call   0x140658e20
0x14065914e: mov    ebx,0x1
0x140659153: lea    rdx,[rip+0xf8f5e2]        # 0x1415e873c  ' '
0x14065915a: mov    r8d,ebx
0x14065915d: mov    rcx,rsi
0x140659160: call   0x14006fa10
0x140659165: mov    rax,QWORD PTR [r14]
0x140659168: xor    r12b,r12b
0x14065916b: movsxd rcx,DWORD PTR [r15+0x14]
0x14065916f: mov    rcx,QWORD PTR [rax+rcx*8]
0x140659173: mov    rax,QWORD PTR [rcx]
0x140659176: call   QWORD PTR [rax]
0x140659178: test   eax,eax
0x14065917a: jne    0x1406591a7
0x14065917c: mov    rax,QWORD PTR [r14]
0x14065917f: movsxd rcx,DWORD PTR [r15+0x14]
0x140659183: mov    rcx,QWORD PTR [rax+rcx*8]
0x140659187: mov    eax,DWORD PTR [rcx+0x10]
0x14065918a: mov    rcx,QWORD PTR [rsp+0x90]
0x140659192: cmp    eax,DWORD PTR [rcx+0x4]
0x140659195: jne    0x14065919d
0x140659197: movzx  r12d,bl
0x14065919b: jmp    0x1406591a7
0x14065919d: cmp    eax,DWORD PTR [rdi+0x4]
0x1406591a0: movzx  ebp,bpl
0x1406591a4: cmove  ebp,ebx
0x1406591a7: xor    r14b,r14b
0x1406591aa: xor    dil,dil
0x1406591ad: test   r13,r13
0x1406591b0: je     0x1406591c4
0x1406591b2: mov    eax,DWORD PTR [r13+0x18]
0x1406591b6: movzx  edi,al
0x1406591b9: and    dil,bl
0x1406591bc: test   al,0x2
0x1406591be: je     0x1406591c4
0x1406591c0: movzx  r14d,bl
0x1406591c4: test   BYTE PTR [r15+0x1c],0x1
0x1406591c9: mov    ebx,0x8
0x1406591ce: je     0x14065924e
0x1406591d0: test   r13,r13
0x1406591d3: je     0x140659214
0x1406591d5: test   dil,dil
0x1406591d8: je     0x140659203
0x1406591da: mov    rcx,rsi
0x1406591dd: test   bpl,bpl
0x1406591e0: je     0x1406591f1
0x1406591e2: mov    r8d,0x5
0x1406591e8: lea    rdx,[rip+0x1009cfd]        # 0x141662eec  'were '
0x1406591ef: jmp    0x1406591fe
0x1406591f1: mov    r8d,0x4
0x1406591f7: lea    rdx,[rip+0xfa9226]        # 0x141602424  'was '
0x1406591fe: call   0x14006fa10
0x140659203: test   r14b,r14b
0x140659206: je     0x14065926d
0x140659208: mov    r8,rbx
0x14065920b: lea    rdx,[rip+0x1009cbe]        # 0x141662ed0  'will be '
0x140659212: jmp    0x140659265
0x140659214: test   r12b,r12b
0x140659217: je     0x140659228
0x140659219: mov    r8d,0x3
0x14065921f: lea    rdx,[rip+0x1009cb6]        # 0x141662edc  'am '
0x140659226: jmp    0x140659265
0x140659228: mov    rcx,rsi
0x14065922b: test   bpl,bpl
0x14065922e: je     0x14065923f
0x140659230: mov    r8d,0x4
0x140659236: lea    rdx,[rip+0x1009c7f]        # 0x141662ebc  'are '
0x14065923d: jmp    0x140659268
0x14065923f: mov    r8d,0x3
0x140659245: lea    rdx,[rip+0xfa91d4]        # 0x141602420  'is '
0x14065924c: jmp    0x140659268
0x14065924e: test   r13,r13
0x140659251: je     0x14065926d
0x140659253: test   r14b,r14b
0x140659256: je     0x14065926d
0x140659258: mov    r8d,0x5
0x14065925e: lea    rdx,[rip+0x1009c5f]        # 0x141662ec4  'will '
0x140659265: mov    rcx,rsi
0x140659268: call   0x14006fa10
0x14065926d: movsxd rax,DWORD PTR [r15+0x10]
0x140659271: cmp    eax,0x5
0x140659274: ja     0x1406594e4
0x14065927a: lea    rcx,[rip+0xffffffffff9a6d7f]        # 0x140000000
0x140659281: mov    eax,DWORD PTR [rcx+rax*4+0x659f90]
0x140659288: add    rax,rcx
0x14065928b: jmp    rax
0x14065928d: test   BYTE PTR [r15+0x1c],0x1
0x140659292: je     0x1406592a8
0x140659294: mov    ebx,0x9
0x140659299: lea    rdx,[rip+0x1009c00]        # 0x141662ea0  'appearing'
0x1406592a0: mov    r8d,ebx
0x1406592a3: jmp    0x1406594dc
0x1406592a8: test   dil,dil
0x1406592ab: je     0x1406592bc
0x1406592ad: lea    rdx,[rip+0x1009bfc]        # 0x141662eb0  'appeared'
0x1406592b4: mov    r8,rbx
0x1406592b7: jmp    0x1406594dc
0x1406592bc: test   r14b,r14b
0x1406592bf: jne    0x1406592df
0x1406592c1: test   r12b,r12b
0x1406592c4: jne    0x1406592df
0x1406592c6: test   bpl,bpl
0x1406592c9: jne    0x1406592df
0x1406592cb: mov    ebx,0x7
0x1406592d0: lea    rdx,[rip+0x1009bc1]        # 0x141662e98  'appears'
0x1406592d7: mov    r8d,ebx
0x1406592da: jmp    0x1406594dc
0x1406592df: mov    ebx,0x6
0x1406592e4: lea    rdx,[rip+0x1009ba1]        # 0x141662e8c  'appear'
0x1406592eb: mov    r8d,ebx
0x1406592ee: jmp    0x1406594dc
0x1406592f3: test   BYTE PTR [r15+0x1c],0x1
0x1406592f8: je     0x14065930e
0x1406592fa: mov    ebx,0xa
0x1406592ff: lea    rdx,[rip+0x1009b6a]        # 0x141662e70  'destroying'
0x140659306: mov    r8d,ebx
0x140659309: jmp    0x1406594dc
0x14065930e: test   dil,dil
0x140659311: je     0x140659327
0x140659313: mov    ebx,0x9
0x140659318: lea    rdx,[rip+0x1009b61]        # 0x141662e80  'destroyed'
0x14065931f: mov    r8d,ebx
0x140659322: jmp    0x1406594dc
0x140659327: test   r14b,r14b
0x14065932a: jne    0x140659345
0x14065932c: test   r12b,r12b
0x14065932f: jne    0x140659345
0x140659331: test   bpl,bpl
0x140659334: jne    0x140659345
0x140659336: lea    rdx,[rip+0x1009b23]        # 0x141662e60  'destroys'
0x14065933d: mov    r8,rbx
0x140659340: jmp    0x1406594dc
0x140659345: mov    ebx,0x7
0x14065934a: lea    rdx,[rip+0x1009b07]        # 0x141662e58  'destroy'
0x140659351: mov    r8d,ebx
0x140659354: jmp    0x1406594dc
0x140659359: test   BYTE PTR [r15+0x1c],0x1
0x14065935e: je     0x14065936f
0x140659360: lea    rdx,[rip+0x1009c29]        # 0x141662f90  'speaking'
0x140659367: mov    r8,rbx
0x14065936a: jmp    0x1406594dc
0x14065936f: test   dil,dil
0x140659372: je     0x140659388
0x140659374: mov    ebx,0x5
0x140659379: lea    rdx,[rip+0x1009c1c]        # 0x141662f9c  'spoke'
0x140659380: mov    r8d,ebx
0x140659383: jmp    0x1406594dc
0x140659388: test   r14b,r14b
0x14065938b: jne    0x1406593ab
0x14065938d: test   r12b,r12b
0x140659390: jne    0x1406593ab
0x140659392: test   bpl,bpl
0x140659395: jne    0x1406593ab
0x140659397: mov    ebx,0x6
0x14065939c: lea    rdx,[rip+0x1009bdd]        # 0x141662f80  'speaks'
0x1406593a3: mov    r8d,ebx
0x1406593a6: jmp    0x1406594dc
0x1406593ab: mov    ebx,0x5
0x1406593b0: lea    rdx,[rip+0xff7f65]        # 0x14165131c  'speak'
0x1406593b7: mov    r8d,ebx
0x1406593ba: jmp    0x1406594dc
0x1406593bf: test   BYTE PTR [r15+0x1c],0x1
0x1406593c4: je     0x1406593da
0x1406593c6: mov    ebx,0x7
0x1406593cb: lea    rdx,[rip+0xfa4686]        # 0x1415fda58  'burning'
0x1406593d2: mov    r8d,ebx
0x1406593d5: jmp    0x1406594dc
0x1406593da: test   dil,dil
0x1406593dd: je     0x1406593f3
0x1406593df: mov    ebx,0x6
0x1406593e4: lea    rdx,[rip+0x1009b9d]        # 0x141662f88  'burned'
0x1406593eb: mov    r8d,ebx
0x1406593ee: jmp    0x1406594dc
0x1406593f3: test   r14b,r14b
0x1406593f6: jne    0x140659416
0x1406593f8: test   r12b,r12b
0x1406593fb: jne    0x140659416
0x1406593fd: test   bpl,bpl
0x140659400: jne    0x140659416
0x140659402: mov    ebx,0x5
0x140659407: lea    rdx,[rip+0x1009b6a]        # 0x141662f78  'burns'
0x14065940e: mov    r8d,ebx
0x140659411: jmp    0x1406594dc
0x140659416: mov    ebx,0x4
0x14065941b: lea    rdx,[rip+0x1009b4e]        # 0x141662f70  'burn'
0x140659422: mov    r8d,ebx
0x140659425: jmp    0x1406594dc
0x14065942a: test   BYTE PTR [r15+0x1c],0x1
0x14065942f: je     0x140659440
0x140659431: lea    rdx,[rip+0x1009b20]        # 0x141662f58  'flooding'
0x140659438: mov    r8,rbx
0x14065943b: jmp    0x1406594dc
0x140659440: test   dil,dil
0x140659443: je     0x140659459
0x140659445: mov    ebx,0x7
0x14065944a: lea    rdx,[rip+0x1009b17]        # 0x141662f68  'flooded'
0x140659451: mov    r8d,ebx
0x140659454: jmp    0x1406594dc
0x140659459: test   r14b,r14b
0x14065945c: jne    0x140659479
0x14065945e: test   r12b,r12b
0x140659461: jne    0x140659479
0x140659463: test   bpl,bpl
0x140659466: jne    0x140659479
0x140659468: mov    ebx,0x6
0x14065946d: lea    rdx,[rip+0x1009ad8]        # 0x141662f4c  'floods'
0x140659474: mov    r8d,ebx
0x140659477: jmp    0x1406594dc
0x140659479: mov    ebx,0x5
0x14065947e: lea    rdx,[rip+0x1009abf]        # 0x141662f44  'flood'
0x140659485: mov    r8d,ebx
0x140659488: jmp    0x1406594dc
0x14065948a: test   BYTE PTR [r15+0x1c],0x1
0x14065948f: je     0x1406594a0
0x140659491: mov    r8d,0x9
0x140659497: lea    rdx,[rip+0x1009a8a]        # 0x141662f28  'rewarding'
0x14065949e: jmp    0x1406594dc
0x1406594a0: test   dil,dil
0x1406594a3: je     0x1406594b1
0x1406594a5: mov    r8,rbx
0x1406594a8: lea    rdx,[rip+0x1009a89]        # 0x141662f38  'rewarded'
0x1406594af: jmp    0x1406594dc
0x1406594b1: test   r14b,r14b
0x1406594b4: jne    0x1406594cf
0x1406594b6: test   r12b,r12b
0x1406594b9: jne    0x1406594cf
0x1406594bb: test   bpl,bpl
0x1406594be: jne    0x1406594cf
0x1406594c0: mov    r8d,0x7
0x1406594c6: lea    rdx,[rip+0x1009a53]        # 0x141662f20  'rewards'
0x1406594cd: jmp    0x1406594dc
0x1406594cf: mov    r8d,0x6
0x1406594d5: lea    rdx,[rip+0x1009a3c]        # 0x141662f18  'reward'
0x1406594dc: mov    rcx,rsi
0x1406594df: call   0x14006fa10
0x1406594e4: cmp    DWORD PTR [r15+0x18],0xffffffff
0x1406594e9: mov    r12d,0x1
0x1406594ef: je     0x140659f60
0x1406594f5: mov    r8d,r12d
0x1406594f8: lea    rdx,[rip+0xf8f23d]        # 0x1415e873c  ' '
0x1406594ff: mov    rcx,rsi
0x140659502: call   0x14006fa10
0x140659507: cmp    DWORD PTR [r15+0x10],0x2
0x14065950c: jne    0x140659523
0x14065950e: mov    r8d,0x3
0x140659514: lea    rdx,[rip+0x10099e5]        # 0x141662f00  'to '
0x14065951b: mov    rcx,rsi
0x14065951e: call   0x14006fa10
0x140659523: movsxd rax,DWORD PTR [r15+0x18]
0x140659527: mov    rcx,rsi
0x14065952a: mov    rbx,QWORD PTR [rsp+0x88]
0x140659532: mov    r9,QWORD PTR [rsp+0x98]
0x14065953a: mov    r8,QWORD PTR [rsp+0x90]
0x140659542: mov    WORD PTR [rsp+0x20],r12w
0x140659548: mov    rdx,QWORD PTR [rbx]
0x14065954b: mov    rdx,QWORD PTR [rdx+rax*8]
0x14065954f: call   0x140658e20
0x140659554: jmp    0x140659f60
0x140659559: mov    rdi,QWORD PTR [r14+0x20]
0x14065955d: nop    DWORD PTR [rax]
0x140659560: cmp    rdi,rbx
0x140659563: jae    0x140659f74
0x140659569: mov    rcx,QWORD PTR [rdi]
0x14065956c: mov    rax,QWORD PTR [rcx]
0x14065956f: call   QWORD PTR [rax]
0x140659571: cmp    eax,0x3
0x140659574: je     0x14065957c
0x140659576: add    rdi,0x8
0x14065957a: jmp    0x140659560
0x14065957c: mov    rbp,QWORD PTR [rdi]
0x14065957f: movsxd rax,DWORD PTR [rbp+0x10]
0x140659583: cmp    eax,0xffffffff
0x140659586: je     0x140659f7c
0x14065958c: mov    rdx,QWORD PTR [r14]
0x14065958f: xor    ecx,ecx
0x140659591: mov    WORD PTR [rsp+0x20],cx
0x140659596: mov    r9,r15
0x140659599: mov    r8,r12
0x14065959c: mov    rcx,rsi
0x14065959f: mov    rdx,QWORD PTR [rdx+rax*8]
0x1406595a3: call   0x140658e20
0x1406595a8: mov    r12d,0x1
0x1406595ae: lea    rdx,[rip+0xf8f187]        # 0x1415e873c  ' '
0x1406595b5: mov    r8d,r12d
0x1406595b8: mov    rcx,rsi
0x1406595bb: call   0x14006fa10
0x1406595c0: movsxd rcx,DWORD PTR [rbp+0x10]
0x1406595c4: xor    r14b,r14b
0x1406595c7: mov    rbx,QWORD PTR [rsp+0x88]
0x1406595cf: xor    dil,dil
0x1406595d2: mov    rax,QWORD PTR [rbx]
0x1406595d5: mov    rcx,QWORD PTR [rax+rcx*8]
0x1406595d9: mov    rax,QWORD PTR [rcx]
0x1406595dc: call   QWORD PTR [rax]
0x1406595de: test   eax,eax
0x1406595e0: jne    0x14065960f
0x1406595e2: mov    rax,QWORD PTR [rbx]
0x1406595e5: movsxd rcx,DWORD PTR [rbp+0x10]
0x1406595e9: mov    rcx,QWORD PTR [rax+rcx*8]
0x1406595ed: mov    eax,DWORD PTR [rcx+0x10]
0x1406595f0: mov    rcx,QWORD PTR [rsp+0x90]
0x1406595f8: cmp    eax,DWORD PTR [rcx+0x4]
0x1406595fb: jne    0x140659603
0x1406595fd: movzx  r14d,r12b
0x140659601: jmp    0x14065960f
0x140659603: cmp    eax,DWORD PTR [r15+0x4]
0x140659607: movzx  edi,dil
0x14065960b: cmove  edi,r12d
0x14065960f: mov    ebx,0x8
0x140659614: test   r13,r13
0x140659617: je     0x140659655
0x140659619: mov    ecx,DWORD PTR [r13+0x18]
0x14065961d: and    ecx,0x2
0x140659620: test   BYTE PTR [r13+0x18],r12b
0x140659624: je     0x140659645
0x140659626: test   dil,dil
0x140659629: movzx  r8d,dil
0x14065962d: lea    rax,[rip+0xfa8df0]        # 0x141602424  'was '
0x140659634: lea    rdx,[rip+0x10098b1]        # 0x141662eec  'were '
0x14065963b: cmove  rdx,rax
0x14065963f: add    r8,0x4
0x140659643: jmp    0x140659684
0x140659645: test   ecx,ecx
0x140659647: je     0x140659655
0x140659649: lea    rdx,[rip+0x1009880]        # 0x141662ed0  'will be '
0x140659650: mov    r8,rbx
0x140659653: jmp    0x140659684
0x140659655: test   r14b,r14b
0x140659658: je     0x140659663
0x14065965a: lea    rdx,[rip+0x100987b]        # 0x141662edc  'am '
0x140659661: jmp    0x14065967e
0x140659663: test   dil,dil
0x140659666: je     0x140659677
0x140659668: lea    rdx,[rip+0x100984d]        # 0x141662ebc  'are '
0x14065966f: mov    r8d,0x4
0x140659675: jmp    0x140659684
0x140659677: lea    rdx,[rip+0xfa8da2]        # 0x141602420  'is '
0x14065967e: mov    r8d,0x3
0x140659684: mov    rcx,rsi
0x140659687: call   0x14006fa10
0x14065968c: mov    eax,DWORD PTR [rbp+0x14]
0x14065968f: inc    eax
0x140659691: cmp    eax,0xa9
0x140659696: ja     0x140659f60
0x14065969c: cdqe
0x14065969e: lea    rcx,[rip+0xffffffffff9a695b]        # 0x140000000
0x1406596a5: mov    eax,DWORD PTR [rcx+rax*4+0x659fa8]
0x1406596ac: add    rax,rcx
0x1406596af: jmp    rax
0x1406596b1: mov    r8d,0x7
0x1406596b7: lea    rdx,[rip+0xfa8e82]        # 0x141602540  'annoyed'
0x1406596be: jmp    0x140659f58
0x1406596c3: mov    r8d,0x9
0x1406596c9: lea    rdx,[rip+0xfa8e60]        # 0x141602530  'satisfied'
0x1406596d0: jmp    0x140659f58
0x1406596d5: mov    r8d,0x7
0x1406596db: lea    rdx,[rip+0xfa8e46]        # 0x141602528  'grouchy'
0x1406596e2: jmp    0x140659f58
0x1406596e7: mov    r8d,0x6
0x1406596ed: lea    rdx,[rip+0xfa8e28]        # 0x14160251c  'grumpy'
0x1406596f4: jmp    0x140659f58
0x1406596f9: mov    r8d,0xc
0x1406596ff: lea    rdx,[rip+0x1009802]        # 0x141662f08  'feeling fond'
0x140659706: jmp    0x140659f58
0x14065970b: mov    r8d,0xa
0x140659711: lea    rdx,[rip+0xfa8de8]        # 0x141602500  'suspicious'
0x140659718: jmp    0x140659f58
0x14065971d: mov    r8d,0x7
0x140659723: lea    rdx,[rip+0xfa8dce]        # 0x1416024f8  'alarmed'
0x14065972a: jmp    0x140659f58
0x14065972f: mov    r8d,0x7
0x140659735: lea    rdx,[rip+0xfa8db4]        # 0x1416024f0  'shocked'
0x14065973c: jmp    0x140659f58
0x140659741: mov    r8d,0x9
0x140659747: lea    rdx,[rip+0xfa8d92]        # 0x1416024e0  'horrified'
0x14065974e: jmp    0x140659f58
0x140659753: mov    r8d,0x19
0x140659759: lea    rdx,[rip+0x1009c80]        # 0x1416633e0  'feeling grim satisfaction'
0x140659760: jmp    0x140659f58
0x140659765: mov    r8,rbx
0x140659768: lea    rdx,[rip+0x1009c91]        # 0x141663400  'in grief'
0x14065976f: jmp    0x140659f58
0x140659774: mov    r8d,0x12
0x14065977a: lea    rdx,[rip+0x1009c3f]        # 0x1416633c0  'feeling triumphant'
0x140659781: jmp    0x140659f58
0x140659786: mov    r8d,0x7
0x14065978c: lea    rdx,[rip+0x1009c45]        # 0x1416633d8  'enraged'
0x140659793: jmp    0x140659f58
0x140659798: mov    r8d,0x7
0x14065979e: lea    rdx,[rip+0xfa8e73]        # 0x141602618  'excited'
0x1406597a5: jmp    0x140659f58
0x1406597aa: mov    r8d,0xe
0x1406597b0: lea    rdx,[rip+0x1009bf1]        # 0x1416633a8  'feeling gaiety'
0x1406597b7: jmp    0x140659f58
0x1406597bc: mov    r8d,0x3
0x1406597c2: lea    rdx,[rip+0xfa8e3f]        # 0x141602608  'sad'
0x1406597c9: jmp    0x140659f58
0x1406597ce: mov    r8d,0x6
0x1406597d4: lea    rdx,[rip+0x1009bdd]        # 0x1416633b8  'joyful'
0x1406597db: jmp    0x140659f58
0x1406597e0: mov    r8,rbx
0x1406597e3: lea    rdx,[rip+0xfa8e0e]        # 0x1416025f8  'blissful'
0x1406597ea: jmp    0x140659f58
0x1406597ef: mov    r8d,0xc
0x1406597f5: lea    rdx,[rip+0x1009b8c]        # 0x141663388  'feeling love'
0x1406597fc: jmp    0x140659f58
0x140659801: mov    r8,rbx
0x140659804: lea    rdx,[rip+0xfa8dd5]        # 0x1416025e0  'vengeful'
0x14065980b: jmp    0x140659f58
0x140659810: mov    r8d,0xd
0x140659816: lea    rdx,[rip+0x1009b7b]        # 0x141663398  'in acceptance'
0x14065981d: jmp    0x140659f58
0x140659822: mov    r8d,0x12
0x140659828: lea    rdx,[rip+0x1009b31]        # 0x141663360  'feeling admiration'
0x14065982f: jmp    0x140659f58
0x140659834: mov    r8d,0xc
0x14065983a: lea    rdx,[rip+0x1009b37]        # 0x141663378  'in adoration'
0x140659841: jmp    0x140659f58
0x140659846: mov    r8d,0x11
0x14065984c: lea    rdx,[rip+0x1009ae5]        # 0x141663338  'feeling affection'
0x140659853: jmp    0x140659f58
0x140659858: mov    r8,rbx
0x14065985b: lea    rdx,[rip+0xfa8d2e]        # 0x141602590  'agitated'
0x140659862: jmp    0x140659f58
0x140659867: mov    r8d,0xa
0x14065986d: lea    rdx,[rip+0xfa8d0c]        # 0x141602580  'aggravated'
0x140659874: jmp    0x140659f58
0x140659879: mov    r8,rbx
0x14065987c: lea    rdx,[rip+0x1009acd]        # 0x141663350  'in agony'
0x140659883: jmp    0x140659f58
0x140659888: mov    r8d,0x11
0x14065988e: lea    rdx,[rip+0x1009a73]        # 0x141663308  'feeling alienated'
0x140659895: jmp    0x140659f58
0x14065989a: mov    r8d,0x6
0x1406598a0: lea    rdx,[rip+0xfa8e15]        # 0x1416026bc  'amazed'
0x1406598a7: jmp    0x140659f58
0x1406598ac: mov    r8d,0x12
0x1406598b2: lea    rdx,[rip+0x1009a67]        # 0x141663320  'feeling ambivalent'
0x1406598b9: jmp    0x140659f58
0x1406598be: mov    r8d,0x6
0x1406598c4: lea    rdx,[rip+0xfa8ddd]        # 0x1416026a8  'amused'
0x1406598cb: jmp    0x140659f58
0x1406598d0: mov    r8d,0x5
0x1406598d6: lea    rdx,[rip+0xfa8dc3]        # 0x1416026a0  'angry'
0x1406598dd: jmp    0x140659f58
0x1406598e2: mov    r8d,0x9
0x1406598e8: lea    rdx,[rip+0x10099f1]        # 0x1416632e0  'anguished'
0x1406598ef: jmp    0x140659f58
0x1406598f4: mov    r8d,0x7
0x1406598fa: lea    rdx,[rip+0xfa8d8f]        # 0x141602690  'anxious'
0x140659901: jmp    0x140659f58
0x140659906: mov    r8d,0x11
0x14065990c: lea    rdx,[rip+0x10099dd]        # 0x1416632f0  'feeling apathetic'
0x140659913: jmp    0x140659f58
0x140659918: mov    r8d,0x7
0x14065991e: lea    rdx,[rip+0xfa8d53]        # 0x141602678  'aroused'
0x140659925: jmp    0x140659f58
0x14065992a: mov    r8d,0xa
0x140659930: lea    rdx,[rip+0xfa8d31]        # 0x141602668  'astonished'
0x140659937: jmp    0x140659f58
0x14065993c: mov    r8d,0x10
0x140659942: lea    rdx,[rip+0x1009bcf]        # 0x141663518  'feeling aversion'
0x140659949: jmp    0x140659f58
0x14065994e: mov    r8d,0x4
0x140659954: lea    rdx,[rip+0x1009bd1]        # 0x14166352c  'awed'
0x14065995b: jmp    0x140659f58
0x140659960: mov    r8d,0x6
0x140659966: lea    rdx,[rip+0xfa8cdf]        # 0x14160264c  'bitter'
0x14065996d: jmp    0x140659f58
0x140659972: mov    r8d,0x5
0x140659978: lea    rdx,[rip+0xfa8cc5]        # 0x141602644  'bored'
0x14065997f: jmp    0x140659f58
0x140659984: mov    r8d,0xe
0x14065998a: lea    rdx,[rip+0x1009b67]        # 0x1416634f8  'feeling caring'
0x140659991: jmp    0x140659f58
0x140659996: mov    r8,rbx
0x140659999: lea    rdx,[rip+0xfa8c90]        # 0x141602630  'confused'
0x1406599a0: jmp    0x140659f58
0x1406599a5: mov    r8d,0xc
0x1406599ab: lea    rdx,[rip+0xfa8de6]        # 0x141602798  'contemptuous'
0x1406599b2: jmp    0x140659f58
0x1406599b7: mov    r8d,0x7
0x1406599bd: lea    rdx,[rip+0xfa8dcc]        # 0x141602790  'content'
0x1406599c4: jmp    0x140659f58
0x1406599c9: mov    r8,rbx
0x1406599cc: lea    rdx,[rip+0xfa8dad]        # 0x141602780  'dejected'
0x1406599d3: jmp    0x140659f58
0x1406599d8: mov    r8d,0x9
0x1406599de: lea    rdx,[rip+0xfa8d8b]        # 0x141602770  'delighted'
0x1406599e5: jmp    0x140659f58
0x1406599ea: mov    r8d,0xa
0x1406599f0: lea    rdx,[rip+0x1009b11]        # 0x141663508  'in despair'
0x1406599f7: jmp    0x140659f58
0x1406599fc: mov    r8d,0xc
0x140659a02: lea    rdx,[rip+0xfa8d4f]        # 0x141602758  'disappointed'
0x140659a09: jmp    0x140659f58
0x140659a0e: mov    r8d,0x9
0x140659a14: lea    rdx,[rip+0xfa8d2d]        # 0x141602748  'disgusted'
0x140659a1b: jmp    0x140659f58
0x140659a20: mov    r8d,0xd
0x140659a26: lea    rdx,[rip+0xfa8d0b]        # 0x141602738  'disillusioned'
0x140659a2d: jmp    0x140659f58
0x140659a32: mov    r8d,0xf
0x140659a38: lea    rdx,[rip+0x1009a99]        # 0x1416634d8  'feeling dislike'
0x140659a3f: jmp    0x140659f58
0x140659a44: mov    r8,rbx
0x140659a47: lea    rdx,[rip+0xfa8cd2]        # 0x141602720  'dismayed'
0x140659a4e: jmp    0x140659f58
0x140659a53: mov    r8d,0xa
0x140659a59: lea    rdx,[rip+0x1009a88]        # 0x1416634e8  'displeased'
0x140659a60: jmp    0x140659f58
0x140659a65: mov    r8d,0xa
0x140659a6b: lea    rdx,[rip+0xfa8c8e]        # 0x141602700  'distressed'
0x140659a72: jmp    0x140659f58
0x140659a77: mov    r8d,0x5
0x140659a7d: lea    rdx,[rip+0xfa8c70]        # 0x1416026f4  'eager'
0x140659a84: jmp    0x140659f58
0x140659a89: mov    r8d,0x6
0x140659a8f: lea    rdx,[rip+0xfa8c56]        # 0x1416026ec  'elated'
0x140659a96: jmp    0x140659f58
0x140659a9b: lea    rdx,[rip+0xfa8c3e]        # 0x1416026e0  'embarrassed'
0x140659aa2: jmp    0x140659f52
0x140659aa7: mov    r8d,0xa
0x140659aad: lea    rdx,[rip+0x1009a04]        # 0x1416634b8  'empathetic'
0x140659ab4: jmp    0x140659f58
0x140659ab9: mov    r8d,0xd
0x140659abf: lea    rdx,[rip+0x1009a02]        # 0x1416634c8  'feeling empty'
0x140659ac6: jmp    0x140659f58
0x140659acb: mov    r8d,0x11
0x140659ad1: lea    rdx,[rip+0x10099b0]        # 0x141663488  'feeling enjoyment'
0x140659ad8: jmp    0x140659f58
0x140659add: lea    rdx,[rip+0xfa8d54]        # 0x141602838  'exasperated'
0x140659ae4: jmp    0x140659f52
0x140659ae9: lea    rdx,[rip+0xfa8d38]        # 0x141602828  'exhilarated'
0x140659af0: jmp    0x140659f52
0x140659af5: mov    r8d,0x6
0x140659afb: lea    rdx,[rip+0xfa8d1a]        # 0x14160281c  'afraid'
0x140659b02: jmp    0x140659f58
0x140659b07: mov    r8d,0x11
0x140659b0d: lea    rdx,[rip+0x100998c]        # 0x1416634a0  'feeling ferocious'
0x140659b14: jmp    0x140659f58
0x140659b19: mov    r8d,0xc
0x140659b1f: lea    rdx,[rip+0x100993a]        # 0x141663460  'feeling free'
0x140659b26: jmp    0x140659f58
0x140659b2b: mov    r8d,0xa
0x140659b31: lea    rdx,[rip+0xfa8cc0]        # 0x1416027f8  'frightened'
0x140659b38: jmp    0x140659f58
0x140659b3d: mov    r8d,0xa
0x140659b43: lea    rdx,[rip+0xfa8c9e]        # 0x1416027e8  'frustrated'
0x140659b4a: jmp    0x140659f58
0x140659b4f: mov    r8d,0x7
0x140659b55: lea    rdx,[rip+0xfa8c84]        # 0x1416027e0  'gleeful'
0x140659b5c: jmp    0x140659f58
0x140659b61: mov    r8d,0x6
0x140659b67: lea    rdx,[rip+0xfa8c66]        # 0x1416027d4  'gloomy'
0x140659b6e: jmp    0x140659f58
0x140659b73: mov    r8d,0x4
0x140659b79: lea    rdx,[rip+0xfa8c4c]        # 0x1416027cc  'glum'
0x140659b80: jmp    0x140659f58
0x140659b85: mov    r8d,0x11
0x140659b8b: lea    rdx,[rip+0x10098de]        # 0x141663470  'feeling gratitude'
0x140659b92: jmp    0x140659f58
0x140659b97: mov    r8d,0xe
0x140659b9d: lea    rdx,[rip+0x100989c]        # 0x141663440  'feeling guilty'
0x140659ba4: jmp    0x140659f58
0x140659ba9: mov    r8d,0x5
0x140659baf: lea    rdx,[rip+0xfa8bfa]        # 0x1416027b0  'happy'
0x140659bb6: jmp    0x140659f58
0x140659bbb: mov    r8d,0x7
0x140659bc1: lea    rdx,[rip+0xfa8be0]        # 0x1416027a8  'hateful'
0x140659bc8: jmp    0x140659f58
0x140659bcd: lea    rdx,[rip+0x100987c]        # 0x141663450  'taking hope'
0x140659bd4: jmp    0x140659f52
0x140659bd9: mov    r8d,0x10
0x140659bdf: lea    rdx,[rip+0x100982a]        # 0x141663410  'feeling hopeless'
0x140659be6: jmp    0x140659f58
0x140659beb: mov    r8d,0xa
0x140659bf1: lea    rdx,[rip+0xfa8d10]        # 0x141602908  'humiliated'
0x140659bf8: jmp    0x140659f58
0x140659bfd: mov    r8,rbx
0x140659c00: lea    rdx,[rip+0xfa8cf1]        # 0x1416028f8  'insulted'
0x140659c07: jmp    0x140659f58
0x140659c0c: mov    r8d,0xa
0x140659c12: lea    rdx,[rip+0xfa8ccf]        # 0x1416028e8  'interested'
0x140659c19: jmp    0x140659f58
0x140659c1e: mov    r8d,0x9
0x140659c24: lea    rdx,[rip+0xfa8cad]        # 0x1416028d8  'irritated'
0x140659c2b: jmp    0x140659f58
0x140659c30: mov    r8,rbx
0x140659c33: lea    rdx,[rip+0xfa8c8e]        # 0x1416028c8  'isolated'
0x140659c3a: jmp    0x140659f58
0x140659c3f: mov    r8d,0x5
0x140659c45: lea    rdx,[rip+0xfa8c70]        # 0x1416028bc  'jolly'
0x140659c4c: jmp    0x140659f58
0x140659c51: mov    r8d,0x6
0x140659c57: lea    rdx,[rip+0xfa8c56]        # 0x1416028b4  'jovial'
0x140659c5e: jmp    0x140659f58
0x140659c63: mov    r8,rbx
0x140659c66: lea    rdx,[rip+0xfa8c3b]        # 0x1416028a8  'jubilant'
0x140659c6d: jmp    0x140659f58
0x140659c72: mov    r8d,0x10
0x140659c78: lea    rdx,[rip+0x10097a9]        # 0x141663428  'feeling loathing'
0x140659c7f: jmp    0x140659f58
0x140659c84: mov    r8d,0x6
0x140659c8a: lea    rdx,[rip+0xfa8bff]        # 0x141602890  'lonely'
0x140659c91: jmp    0x140659f58
0x140659c96: mov    r8d,0x7
0x140659c9c: lea    rdx,[rip+0xfa8be5]        # 0x141602888  'lustful'
0x140659ca3: jmp    0x140659f58
0x140659ca8: mov    r8d,0x9
0x140659cae: lea    rdx,[rip+0xfa8bc3]        # 0x141602878  'miserable'
0x140659cb5: jmp    0x140659f58
0x140659cba: mov    r8d,0x9
0x140659cc0: lea    rdx,[rip+0xfa8ba1]        # 0x141602868  'mortified'
0x140659cc7: jmp    0x140659f58
0x140659ccc: mov    r8d,0x7
0x140659cd2: lea    rdx,[rip+0xfa8b87]        # 0x141602860  'nervous'
0x140659cd9: jmp    0x140659f58
0x140659cde: mov    r8d,0x9
0x140659ce4: lea    rdx,[rip+0xfa8d1d]        # 0x141602a08  'nostalgic'
0x140659ceb: jmp    0x140659f58
0x140659cf0: mov    r8d,0xa
0x140659cf6: lea    rdx,[rip+0xfa8cfb]        # 0x1416029f8  'optimistic'
0x140659cfd: jmp    0x140659f58
0x140659d02: mov    r8,rbx
0x140659d05: lea    rdx,[rip+0xfa8cdc]        # 0x1416029e8  'outraged'
0x140659d0c: jmp    0x140659f58
0x140659d11: mov    r8,rbx
0x140659d14: lea    rdx,[rip+0xfa8cbd]        # 0x1416029d8  'panicked'
0x140659d1b: jmp    0x140659f58
0x140659d20: mov    r8d,0x7
0x140659d26: lea    rdx,[rip+0xfa8c9b]        # 0x1416029c8  'patient'
0x140659d2d: jmp    0x140659f58
0x140659d32: mov    r8d,0xa
0x140659d38: lea    rdx,[rip+0xfa8c79]        # 0x1416029b8  'passionate'
0x140659d3f: jmp    0x140659f58
0x140659d44: mov    r8d,0x7
0x140659d4a: lea    rdx,[rip+0x10093a7]        # 0x1416630f8  'pleased'
0x140659d51: jmp    0x140659f58
0x140659d56: mov    r8d,0x5
0x140659d5c: lea    rdx,[rip+0xfa8c39]        # 0x14160299c  'proud'
0x140659d63: jmp    0x140659f58
0x140659d68: mov    r8d,0xa
0x140659d6e: lea    rdx,[rip+0xfa8c1b]        # 0x141602990  'enraptured'
0x140659d75: jmp    0x140659f58
0x140659d7a: mov    r8d,0x10
0x140659d80: lea    rdx,[rip+0x1009379]        # 0x141663100  'feeling rejected'
0x140659d87: jmp    0x140659f58
0x140659d8c: mov    r8,rbx
0x140659d8f: lea    rdx,[rip+0xfa8bda]        # 0x141602970  'relieved'
0x140659d96: jmp    0x140659f58
0x140659d9b: mov    r8d,0x9
0x140659da1: lea    rdx,[rip+0xfa8bb8]        # 0x141602960  'regretful'
0x140659da8: jmp    0x140659f58
0x140659dad: mov    r8d,0xa
0x140659db3: lea    rdx,[rip+0xfa8b96]        # 0x141602950  'remorseful'
0x140659dba: jmp    0x140659f58
0x140659dbf: mov    r8d,0x9
0x140659dc5: lea    rdx,[rip+0xfa8b74]        # 0x141602940  'repentant'
0x140659dcc: jmp    0x140659f58
0x140659dd1: mov    r8d,0x9
0x140659dd7: lea    rdx,[rip+0xfa8b52]        # 0x141602930  'resentful'
0x140659dde: jmp    0x140659f58
0x140659de3: mov    r8,rbx
0x140659de6: lea    rdx,[rip+0xfa8cdb]        # 0x141602ac8  'restless'
0x140659ded: jmp    0x140659f58
0x140659df2: mov    r8d,0x9
0x140659df8: lea    rdx,[rip+0xfa8cb9]        # 0x141602ab8  'indignant'
0x140659dff: jmp    0x140659f58
0x140659e04: mov    r8d,0x11
0x140659e0a: lea    rdx,[rip+0x10092bf]        # 0x1416630d0  'feeling self-pity'
0x140659e11: jmp    0x140659f58
0x140659e16: mov    r8d,0xf
0x140659e1c: lea    rdx,[rip+0x10092c5]        # 0x1416630e8  'feeling servile'
0x140659e23: jmp    0x140659f58
0x140659e28: mov    r8d,0x6
0x140659e2e: lea    rdx,[rip+0xfa8c63]        # 0x141602a98  'shaken'
0x140659e35: jmp    0x140659f58
0x140659e3a: mov    r8d,0x7
0x140659e40: lea    rdx,[rip+0xfa8c49]        # 0x141602a90  'ashamed'
0x140659e47: jmp    0x140659f58
0x140659e4c: lea    rdx,[rip+0x1009255]        # 0x1416630a8  'sympathetic'
0x140659e53: jmp    0x140659f52
0x140659e58: mov    r8d,0x12
0x140659e5e: lea    rdx,[rip+0x1009253]        # 0x1416630b8  'feeling tenderness'
0x140659e65: jmp    0x140659f58
0x140659e6a: mov    r8d,0x9
0x140659e70: lea    rdx,[rip+0xfa8be9]        # 0x141602a60  'terrified'
0x140659e77: jmp    0x140659f58
0x140659e7c: mov    r8,rbx
0x140659e7f: lea    rdx,[rip+0xfa8bca]        # 0x141602a50  'thrilled'
0x140659e86: jmp    0x140659f58
0x140659e8b: mov    r8d,0x6
0x140659e91: lea    rdx,[rip+0xfa8bb0]        # 0x141602a48  'uneasy'
0x140659e98: jmp    0x140659f58
0x140659e9d: mov    r8d,0x7
0x140659ea3: lea    rdx,[rip+0xfa8b96]        # 0x141602a40  'unhappy'
0x140659eaa: jmp    0x140659f58
0x140659eaf: mov    r8d,0x9
0x140659eb5: lea    rdx,[rip+0x10091c4]        # 0x141663080  'in wonder'
0x140659ebc: jmp    0x140659f58
0x140659ec1: mov    r8d,0x7
0x140659ec7: lea    rdx,[rip+0xfa8b62]        # 0x141602a30  'worried'
0x140659ece: jmp    0x140659f58
0x140659ed3: mov    r8,rbx
0x140659ed6: lea    rdx,[rip+0xfa8b43]        # 0x141602a20  'wrathful'
0x140659edd: jmp    0x140659f58
0x140659edf: mov    r8d,0x7
0x140659ee5: lea    rdx,[rip+0xfa8b2c]        # 0x141602a18  'zealous'
0x140659eec: jmp    0x140659f58
0x140659eee: mov    r8d,0x15
0x140659ef4: lea    rdx,[rip+0x1009195]        # 0x141663090  'in existential crisis'
0x140659efb: jmp    0x140659f58
0x140659efd: mov    r8d,0x10
0x140659f03: lea    rdx,[rip+0x1009146]        # 0x141663050  'feeling defeated'
0x140659f0a: jmp    0x140659f58
0x140659f0c: mov    r8d,0x11
0x140659f12: lea    rdx,[rip+0x100914f]        # 0x141663068  'feeling expectant'
0x140659f19: jmp    0x140659f58
0x140659f1b: mov    r8,rbx
0x140659f1e: lea    rdx,[rip+0x100910b]        # 0x141663030  'in doubt'
0x140659f25: jmp    0x140659f58
0x140659f27: mov    r8d,0xc
0x140659f2d: lea    rdx,[rip+0xfa8c54]        # 0x141602b88  'enthusiastic'
0x140659f34: jmp    0x140659f58
0x140659f36: lea    rdx,[rip+0xfa8c3b]        # 0x141602b78  'pessimistic'
0x140659f3d: jmp    0x140659f52
0x140659f3f: mov    r8,rbx
0x140659f42: lea    rdx,[rip+0xfa8c1f]        # 0x141602b68  'euphoric'
0x140659f49: jmp    0x140659f58
0x140659f4b: lea    rdx,[rip+0x10090ee]        # 0x141663040  'emotionless'
0x140659f52: mov    r8d,0xb
0x140659f58: mov    rcx,rsi
0x140659f5b: call   0x14006fa10
0x140659f60: mov    r8,r12
0x140659f63: lea    rdx,[rip+0xf8e64a]        # 0x1415e85b4  '.'
0x140659f6a: mov    rcx,rsi
0x140659f6d: call   0x14006fa10
0x140659f72: jmp    0x140659f7c
0x140659f74: mov    rcx,rsi
0x140659f77: call   0x14052d650
0x140659f7c: add    rsp,0x38
0x140659f80: pop    r15
0x140659f82: pop    r14
0x140659f84: pop    r13
0x140659f86: pop    r12
0x140659f88: pop    rdi
0x140659f89: pop    rsi
0x140659f8a: pop    rbp
0x140659f8b: pop    rbx
0x140659f8c: ret
; Embedded action jump-table data within unwind owner (not instructions)
0x140659f90: dd 0x65928d ; enum=0 target=0x14065928d
0x140659f94: dd 0x6592f3 ; enum=1 target=0x1406592f3
0x140659f98: dd 0x659359 ; enum=2 target=0x140659359
0x140659f9c: dd 0x6593bf ; enum=3 target=0x1406593bf
0x140659fa0: dd 0x65942a ; enum=4 target=0x14065942a
0x140659fa4: dd 0x65948a ; enum=5 target=0x14065948a
; Embedded emotion jump-table data within unwind owner (not instructions)
0x140659fa8: dd 0x659f4b ; enum=-1 target=0x140659f4b
0x140659fac: dd 0x659810 ; enum=0 target=0x140659810
0x140659fb0: dd 0x659834 ; enum=1 target=0x140659834
0x140659fb4: dd 0x659846 ; enum=2 target=0x140659846
0x140659fb8: dd 0x659858 ; enum=3 target=0x140659858
0x140659fbc: dd 0x659867 ; enum=4 target=0x140659867
0x140659fc0: dd 0x659879 ; enum=5 target=0x140659879
0x140659fc4: dd 0x65971d ; enum=6 target=0x14065971d
0x140659fc8: dd 0x659888 ; enum=7 target=0x140659888
0x140659fcc: dd 0x65989a ; enum=8 target=0x14065989a
0x140659fd0: dd 0x6598ac ; enum=9 target=0x1406598ac
0x140659fd4: dd 0x6598be ; enum=10 target=0x1406598be
0x140659fd8: dd 0x6598d0 ; enum=11 target=0x1406598d0
0x140659fdc: dd 0x659eee ; enum=12 target=0x140659eee
0x140659fe0: dd 0x6598e2 ; enum=13 target=0x1406598e2
0x140659fe4: dd 0x6596b1 ; enum=14 target=0x1406596b1
0x140659fe8: dd 0x659f60 ; enum=15 target=0x140659f60
0x140659fec: dd 0x6598f4 ; enum=16 target=0x1406598f4
0x140659ff0: dd 0x659906 ; enum=17 target=0x140659906
0x140659ff4: dd 0x659f60 ; enum=18 target=0x140659f60
0x140659ff8: dd 0x659918 ; enum=19 target=0x140659918
0x140659ffc: dd 0x65992a ; enum=20 target=0x14065992a
0x14065a000: dd 0x659f60 ; enum=21 target=0x140659f60
0x14065a004: dd 0x65993c ; enum=22 target=0x14065993c
0x14065a008: dd 0x65994e ; enum=23 target=0x14065994e
0x14065a00c: dd 0x659960 ; enum=24 target=0x140659960
0x14065a010: dd 0x6597e0 ; enum=25 target=0x1406597e0
0x14065a014: dd 0x659972 ; enum=26 target=0x140659972
0x14065a018: dd 0x659984 ; enum=27 target=0x140659984
0x14065a01c: dd 0x659f60 ; enum=28 target=0x140659f60
0x14065a020: dd 0x659996 ; enum=29 target=0x140659996
0x14065a024: dd 0x6599a5 ; enum=30 target=0x1406599a5
0x14065a028: dd 0x6599b7 ; enum=31 target=0x1406599b7
0x14065a02c: dd 0x659f60 ; enum=32 target=0x140659f60
0x14065a030: dd 0x659f60 ; enum=33 target=0x140659f60
0x14065a034: dd 0x659efd ; enum=34 target=0x140659efd
0x14065a038: dd 0x6599c9 ; enum=35 target=0x1406599c9
0x14065a03c: dd 0x6599d8 ; enum=36 target=0x1406599d8
0x14065a040: dd 0x659f60 ; enum=37 target=0x140659f60
0x14065a044: dd 0x659f60 ; enum=38 target=0x140659f60
0x14065a048: dd 0x6599ea ; enum=39 target=0x1406599ea
0x14065a04c: dd 0x6599fc ; enum=40 target=0x1406599fc
0x14065a050: dd 0x659a0e ; enum=41 target=0x140659a0e
0x14065a054: dd 0x659a20 ; enum=42 target=0x140659a20
0x14065a058: dd 0x659a32 ; enum=43 target=0x140659a32
0x14065a05c: dd 0x659a44 ; enum=44 target=0x140659a44
0x14065a060: dd 0x659a53 ; enum=45 target=0x140659a53
0x14065a064: dd 0x659a65 ; enum=46 target=0x140659a65
0x14065a068: dd 0x659f1b ; enum=47 target=0x140659f1b
0x14065a06c: dd 0x659f60 ; enum=48 target=0x140659f60
0x14065a070: dd 0x659a77 ; enum=49 target=0x140659a77
0x14065a074: dd 0x659f60 ; enum=50 target=0x140659f60
0x14065a078: dd 0x659a89 ; enum=51 target=0x140659a89
0x14065a07c: dd 0x659a9b ; enum=52 target=0x140659a9b
0x14065a080: dd 0x659aa7 ; enum=53 target=0x140659aa7
0x14065a084: dd 0x659ab9 ; enum=54 target=0x140659ab9
0x14065a088: dd 0x659acb ; enum=55 target=0x140659acb
0x14065a08c: dd 0x659f60 ; enum=56 target=0x140659f60
0x14065a090: dd 0x659f27 ; enum=57 target=0x140659f27
0x14065a094: dd 0x659f60 ; enum=58 target=0x140659f60
0x14065a098: dd 0x659f3f ; enum=59 target=0x140659f3f
0x14065a09c: dd 0x659add ; enum=60 target=0x140659add
0x14065a0a0: dd 0x659798 ; enum=61 target=0x140659798
0x14065a0a4: dd 0x659ae9 ; enum=62 target=0x140659ae9
0x14065a0a8: dd 0x659f0c ; enum=63 target=0x140659f0c
0x14065a0ac: dd 0x659af5 ; enum=64 target=0x140659af5
0x14065a0b0: dd 0x659b07 ; enum=65 target=0x140659b07
0x14065a0b4: dd 0x6596f9 ; enum=66 target=0x1406596f9
0x14065a0b8: dd 0x659b19 ; enum=67 target=0x140659b19
0x14065a0bc: dd 0x659b2b ; enum=68 target=0x140659b2b
0x14065a0c0: dd 0x659b3d ; enum=69 target=0x140659b3d
0x14065a0c4: dd 0x659f60 ; enum=70 target=0x140659f60
0x14065a0c8: dd 0x6597aa ; enum=71 target=0x1406597aa
0x14065a0cc: dd 0x659f60 ; enum=72 target=0x140659f60
0x14065a0d0: dd 0x659b4f ; enum=73 target=0x140659b4f
0x14065a0d4: dd 0x659b61 ; enum=74 target=0x140659b61
0x14065a0d8: dd 0x659b73 ; enum=75 target=0x140659b73
0x14065a0dc: dd 0x659b85 ; enum=76 target=0x140659b85
0x14065a0e0: dd 0x659f60 ; enum=77 target=0x140659f60
0x14065a0e4: dd 0x659765 ; enum=78 target=0x140659765
0x14065a0e8: dd 0x659753 ; enum=79 target=0x140659753
0x14065a0ec: dd 0x6596d5 ; enum=80 target=0x1406596d5
0x14065a0f0: dd 0x6596e7 ; enum=81 target=0x1406596e7
0x14065a0f4: dd 0x659b97 ; enum=82 target=0x140659b97
0x14065a0f8: dd 0x659ba9 ; enum=83 target=0x140659ba9
0x14065a0fc: dd 0x659bbb ; enum=84 target=0x140659bbb
0x14065a100: dd 0x659f60 ; enum=85 target=0x140659f60
0x14065a104: dd 0x659bcd ; enum=86 target=0x140659bcd
0x14065a108: dd 0x659bd9 ; enum=87 target=0x140659bd9
0x14065a10c: dd 0x659741 ; enum=88 target=0x140659741
0x14065a110: dd 0x659f60 ; enum=89 target=0x140659f60
0x14065a114: dd 0x659beb ; enum=90 target=0x140659beb
0x14065a118: dd 0x659f60 ; enum=91 target=0x140659f60
0x14065a11c: dd 0x659f60 ; enum=92 target=0x140659f60
0x14065a120: dd 0x659f60 ; enum=93 target=0x140659f60
0x14065a124: dd 0x659f60 ; enum=94 target=0x140659f60
0x14065a128: dd 0x659bfd ; enum=95 target=0x140659bfd
0x14065a12c: dd 0x659c0c ; enum=96 target=0x140659c0c
0x14065a130: dd 0x659c1e ; enum=97 target=0x140659c1e
0x14065a134: dd 0x659c30 ; enum=98 target=0x140659c30
0x14065a138: dd 0x659f60 ; enum=99 target=0x140659f60
0x14065a13c: dd 0x659c3f ; enum=100 target=0x140659c3f
0x14065a140: dd 0x659c51 ; enum=101 target=0x140659c51
0x14065a144: dd 0x6597ce ; enum=102 target=0x1406597ce
0x14065a148: dd 0x659c63 ; enum=103 target=0x140659c63
0x14065a14c: dd 0x659c72 ; enum=104 target=0x140659c72
0x14065a150: dd 0x659c84 ; enum=105 target=0x140659c84
0x14065a154: dd 0x659f60 ; enum=106 target=0x140659f60
0x14065a158: dd 0x6597ef ; enum=107 target=0x1406597ef
0x14065a15c: dd 0x659f60 ; enum=108 target=0x140659f60
0x14065a160: dd 0x659c96 ; enum=109 target=0x140659c96
0x14065a164: dd 0x659f60 ; enum=110 target=0x140659f60
0x14065a168: dd 0x659ca8 ; enum=111 target=0x140659ca8
0x14065a16c: dd 0x659cba ; enum=112 target=0x140659cba
0x14065a170: dd 0x659f60 ; enum=113 target=0x140659f60
0x14065a174: dd 0x659ccc ; enum=114 target=0x140659ccc
0x14065a178: dd 0x659cde ; enum=115 target=0x140659cde
0x14065a17c: dd 0x659cf0 ; enum=116 target=0x140659cf0
0x14065a180: dd 0x659d02 ; enum=117 target=0x140659d02
0x14065a184: dd 0x659d11 ; enum=118 target=0x140659d11
0x14065a188: dd 0x659d20 ; enum=119 target=0x140659d20
0x14065a18c: dd 0x659d32 ; enum=120 target=0x140659d32
0x14065a190: dd 0x659f36 ; enum=121 target=0x140659f36
0x14065a194: dd 0x659f60 ; enum=122 target=0x140659f60
0x14065a198: dd 0x659d44 ; enum=123 target=0x140659d44
0x14065a19c: dd 0x659d56 ; enum=124 target=0x140659d56
0x14065a1a0: dd 0x659786 ; enum=125 target=0x140659786
0x14065a1a4: dd 0x659d68 ; enum=126 target=0x140659d68
0x14065a1a8: dd 0x659d7a ; enum=127 target=0x140659d7a
0x14065a1ac: dd 0x659d8c ; enum=128 target=0x140659d8c
0x14065a1b0: dd 0x659d9b ; enum=129 target=0x140659d9b
0x14065a1b4: dd 0x659dad ; enum=130 target=0x140659dad
0x14065a1b8: dd 0x659dbf ; enum=131 target=0x140659dbf
0x14065a1bc: dd 0x659dd1 ; enum=132 target=0x140659dd1
0x14065a1c0: dd 0x659f60 ; enum=133 target=0x140659f60
0x14065a1c4: dd 0x659df2 ; enum=134 target=0x140659df2
0x14065a1c8: dd 0x6597bc ; enum=135 target=0x1406597bc
0x14065a1cc: dd 0x6596c3 ; enum=136 target=0x1406596c3
0x14065a1d0: dd 0x659f60 ; enum=137 target=0x140659f60
0x14065a1d4: dd 0x659e04 ; enum=138 target=0x140659e04
0x14065a1d8: dd 0x659f60 ; enum=139 target=0x140659f60
0x14065a1dc: dd 0x659e16 ; enum=140 target=0x140659e16
0x14065a1e0: dd 0x659e28 ; enum=141 target=0x140659e28
0x14065a1e4: dd 0x659e3a ; enum=142 target=0x140659e3a
0x14065a1e8: dd 0x65972f ; enum=143 target=0x14065972f
0x14065a1ec: dd 0x659f60 ; enum=144 target=0x140659f60
0x14065a1f0: dd 0x659f60 ; enum=145 target=0x140659f60
0x14065a1f4: dd 0x659f60 ; enum=146 target=0x140659f60
0x14065a1f8: dd 0x659f60 ; enum=147 target=0x140659f60
0x14065a1fc: dd 0x65970b ; enum=148 target=0x14065970b
0x14065a200: dd 0x659e4c ; enum=149 target=0x140659e4c
0x14065a204: dd 0x659e58 ; enum=150 target=0x140659e58
0x14065a208: dd 0x659f60 ; enum=151 target=0x140659f60
0x14065a20c: dd 0x659e6a ; enum=152 target=0x140659e6a
0x14065a210: dd 0x659e7c ; enum=153 target=0x140659e7c
0x14065a214: dd 0x659f60 ; enum=154 target=0x140659f60
0x14065a218: dd 0x659774 ; enum=155 target=0x140659774
0x14065a21c: dd 0x659e8b ; enum=156 target=0x140659e8b
0x14065a220: dd 0x659e9d ; enum=157 target=0x140659e9d
0x14065a224: dd 0x659801 ; enum=158 target=0x140659801
0x14065a228: dd 0x659f60 ; enum=159 target=0x140659f60
0x14065a22c: dd 0x659eaf ; enum=160 target=0x140659eaf
0x14065a230: dd 0x659ec1 ; enum=161 target=0x140659ec1
0x14065a234: dd 0x659ed3 ; enum=162 target=0x140659ed3
0x14065a238: dd 0x659edf ; enum=163 target=0x140659edf
0x14065a23c: dd 0x659f60 ; enum=164 target=0x140659f60
0x14065a240: dd 0x659f60 ; enum=165 target=0x140659f60
0x14065a244: dd 0x659f60 ; enum=166 target=0x140659f60
0x14065a248: dd 0x659de3 ; enum=167 target=0x140659de3
0x14065a24c: dd 0x659822 ; enum=168 target=0x140659822
