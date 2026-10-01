; PE:6a70a6d9:02711000; native appearance constructor 0x140712370..0x140716a5b
0x140712370: mov    QWORD PTR [rsp+0x18],rbx
0x140712375: push   rbp
0x140712376: push   rsi
0x140712377: push   rdi
0x140712378: push   r12
0x14071237a: push   r13
0x14071237c: push   r14
0x14071237e: push   r15
0x140712380: lea    rbp,[rsp-0x1c0]
0x140712388: sub    rsp,0x2c0
0x14071238f: mov    rax,QWORD PTR [rip+0x1189caa]        # 0x14189c040
0x140712396: xor    rax,rsp
0x140712399: mov    QWORD PTR [rbp+0x1b0],rax
0x1407123a0: mov    r13,rdx
0x1407123a3: mov    QWORD PTR [rsp+0x70],rdx
0x1407123a8: mov    rdi,rcx
0x1407123ab: mov    QWORD PTR [rsp+0x50],rcx
0x1407123b0: xor    ebx,ebx
0x1407123b2: cmp    QWORD PTR [rcx],rbx
0x1407123b5: je     0x140712dbe
0x1407123bb: cmp    QWORD PTR [rcx+0x8],rbx
0x1407123bf: je     0x140712dbe
0x1407123c5: cmp    QWORD PTR [rcx+0x48],rbx
0x1407123c9: je     0x140712dbe
0x1407123cf: lea    rcx,[rbp+0xb0]
0x1407123d6: call   0x14006f690
0x1407123db: nop
0x1407123dc: lea    rcx,[rbp+0x50]
0x1407123e0: call   0x14006f690
0x1407123e5: nop
0x1407123e6: xor    r8d,r8d
0x1407123e9: lea    rdx,[rbp+0xb0]
0x1407123f0: movzx  ecx,BYTE PTR [rdi+0x124]
0x1407123f7: call   0x140aa4730
0x1407123fc: lea    rdx,[rbp+0xb0]
0x140712403: lea    rcx,[rbp+0x50]
0x140712407: call   0x14006f5a0
0x14071240c: lea    rcx,[rbp+0x50]
0x140712410: call   0x14052d650
0x140712415: lea    rcx,[rbp+0xd0]
0x14071241c: call   0x14006f690
0x140712421: nop
0x140712422: lea    rcx,[rbp+0x30]
0x140712426: call   0x14006f690
0x14071242b: nop
0x14071242c: xor    r8d,r8d
0x14071242f: lea    rdx,[rbp+0xd0]
0x140712436: movzx  ecx,BYTE PTR [rdi+0x124]
0x14071243d: call   0x140aa4850
0x140712442: lea    rdx,[rbp+0xd0]
0x140712449: lea    rcx,[rbp+0x30]
0x14071244d: call   0x14006f5a0
0x140712452: lea    rcx,[rbp+0x30]
0x140712456: call   0x14052d650
0x14071245b: mov    eax,DWORD PTR [rdi+0x118]
0x140712461: mov    DWORD PTR [rbp-0x5c],eax
0x140712464: lea    r14,[rdi+0x130]
0x14071246b: mov    rcx,r14
0x14071246e: call   0x14006ee50
0x140712473: test   rax,rax
0x140712476: je     0x140712af5
0x14071247c: lea    rdx,[rip+0xef00e5]        # 0x141602568  '[C:4:0:1]'
0x140712483: mov    rcx,r13
0x140712486: call   0x14006f560
0x14071248b: lea    rcx,[rbp+0x10]
0x14071248f: call   0x14006f690
0x140712494: nop
0x140712495: lea    rcx,[rbp-0x50]
0x140712499: call   0x14006f690
0x14071249e: nop
0x14071249f: movzx  r8d,WORD PTR [rdi+0x126]
0x1407124a7: cmp    r8w,0xffff
0x1407124ac: je     0x1407124d9
0x1407124ae: movzx  eax,WORD PTR [rdi+0x12c]
0x1407124b5: mov    WORD PTR [rsp+0x30],ax
0x1407124ba: mov    BYTE PTR [rsp+0x28],bl
0x1407124be: mov    DWORD PTR [rsp+0x20],ebx
0x1407124c2: mov    r9d,DWORD PTR [rdi+0x128]
0x1407124c9: lea    rdx,[rbp-0x50]
0x1407124cd: lea    rcx,[rip+0x1cbf01c]        # 0x1423d14f0
0x1407124d4: call   0x1414d1920
0x1407124d9: mov    esi,ebx
0x1407124db: mov    rcx,r14
0x1407124de: call   0x14006ee50
0x1407124e3: test   rax,rax
0x1407124e6: je     0x140712ac3
0x1407124ec: lea    r15,[rip+0xedc6dd]        # 0x1415eebd0  ' are'
0x1407124f3: lea    r12,[rip+0xf72966]        # 0x141684e60  'slightly swollen'
0x1407124fa: nop    WORD PTR [rax+rax*1+0x0]
0x140712500: mov    rdx,rbx
0x140712503: mov    rcx,r14
0x140712506: call   0x14006f220
0x14071250b: mov    rbx,QWORD PTR [rax]
0x14071250e: mov    WORD PTR [rsp+0x20],0x2
0x140712515: xor    r9d,r9d
0x140712518: movzx  r8d,WORD PTR [rbx]
0x14071251c: lea    rdx,[rbp+0x10]
0x140712520: mov    rcx,rdi
0x140712523: call   0x14070c0e0
0x140712528: movsx  rdx,WORD PTR [rbx]
0x14071252c: mov    rcx,QWORD PTR [rdi+0x48]
0x140712530: call   0x14006f220
0x140712535: mov    rcx,QWORD PTR [rax]
0x140712538: mov    edi,DWORD PTR [rcx+0x84]
0x14071253e: cmp    BYTE PTR [rbx+0x28],0x0
0x140712542: je     0x14071257a
0x140712544: lea    rdx,[rbp+0x30]
0x140712548: mov    rcx,r13
0x14071254b: call   0x1400b9d10
0x140712550: lea    rdx,[rip+0xed61e5]        # 0x1415e873c  ' '
0x140712557: mov    rcx,r13
0x14071255a: call   0x14006f560
0x14071255f: lea    rdx,[rbp+0x10]
0x140712563: mov    rcx,r13
0x140712566: call   0x1400b9d10
0x14071256b: lea    rdx,[rip+0xf72c46]        # 0x1416851b8  ' is mangled beyond recognition.  '
0x140712572: mov    rcx,r13
0x140712575: call   0x14006f560
0x14071257a: cmp    BYTE PTR [rbx+0x29],0x0
0x14071257e: je     0x1407125b6
0x140712580: lea    rdx,[rbp+0x30]
0x140712584: mov    rcx,r13
0x140712587: call   0x1400b9d10
0x14071258c: lea    rdx,[rip+0xed61a9]        # 0x1415e873c  ' '
0x140712593: mov    rcx,r13
0x140712596: call   0x14006f560
0x14071259b: lea    rdx,[rbp+0x10]
0x14071259f: mov    rcx,r13
0x1407125a2: call   0x1400b9d10
0x1407125a7: lea    rdx,[rip+0xf72bfa]        # 0x1416851a8  ' are spilled.  '
0x1407125ae: mov    rcx,r13
0x1407125b1: call   0x14006f560
0x1407125b6: cmp    BYTE PTR [rbx+0x2a],0x0
0x1407125ba: je     0x1407125d7
0x1407125bc: lea    rdx,[rbp+0x50]
0x1407125c0: mov    rcx,r13
0x1407125c3: call   0x1400b9d10
0x1407125c8: lea    rdx,[rip+0xf72bc9]        # 0x141685198  ' is gelded.  '
0x1407125cf: mov    rcx,r13
0x1407125d2: call   0x14006f560
0x1407125d7: cmp    BYTE PTR [rbx+0x2d],0x0
0x1407125db: je     0x140712613
0x1407125dd: lea    rdx,[rbp+0x30]
0x1407125e1: mov    rcx,r13
0x1407125e4: call   0x1400b9d10
0x1407125e9: lea    rdx,[rip+0xed614c]        # 0x1415e873c  ' '
0x1407125f0: mov    rcx,r13
0x1407125f3: call   0x14006f560
0x1407125f8: lea    rdx,[rbp+0x10]
0x1407125fc: mov    rcx,r13
0x1407125ff: call   0x1400b9d10
0x140712604: lea    rdx,[rip+0xf72b65]        # 0x141685170  ' has been partially butchered.  '
0x14071260b: mov    rcx,r13
0x14071260e: call   0x14006f560
0x140712613: cmp    BYTE PTR [rbx+0x28],0x0
0x140712617: jne    0x1407127b4
0x14071261d: cmp    BYTE PTR [rbx+0x2b],0x0
0x140712621: je     0x140712669
0x140712623: lea    rdx,[rbp+0x30]
0x140712627: mov    rcx,r13
0x14071262a: call   0x1400b9d10
0x14071262f: lea    rdx,[rip+0xed6106]        # 0x1415e873c  ' '
0x140712636: mov    rcx,r13
0x140712639: call   0x14006f560
0x14071263e: lea    rdx,[rbp+0x10]
0x140712642: mov    rcx,r13
0x140712645: call   0x1400b9d10
0x14071264a: lea    rdx,[rip+0xedc587]        # 0x1415eebd8  ' is'
0x140712651: cmp    edi,0x1
0x140712654: cmovg  rdx,r15
0x140712658: mov    rcx,r13
0x14071265b: call   0x14006f560
0x140712660: lea    rdx,[rip+0xf72af9]        # 0x141685160  ' broken.  '
0x140712667: jmp    0x1407126b3
0x140712669: cmp    BYTE PTR [rbx+0x2c],0x0
0x14071266d: je     0x1407126bb
0x14071266f: lea    rdx,[rbp+0x30]
0x140712673: mov    rcx,r13
0x140712676: call   0x1400b9d10
0x14071267b: lea    rdx,[rip+0xed60ba]        # 0x1415e873c  ' '
0x140712682: mov    rcx,r13
0x140712685: call   0x14006f560
0x14071268a: lea    rdx,[rbp+0x10]
0x14071268e: mov    rcx,r13
0x140712691: call   0x1400b9d10
0x140712696: lea    rdx,[rip+0xedc53b]        # 0x1415eebd8  ' is'
0x14071269d: cmp    edi,0x1
0x1407126a0: cmovg  rdx,r15
0x1407126a4: mov    rcx,r13
0x1407126a7: call   0x14006f560
0x1407126ac: lea    rdx,[rip+0xf7276d]        # 0x141684e20  ' fractured.  '
0x1407126b3: mov    rcx,r13
0x1407126b6: call   0x14006f560
0x1407126bb: cmp    DWORD PTR [rbx+0x20],0xffffffff
0x1407126bf: je     0x140712714
0x1407126c1: lea    rdx,[rbp+0x30]
0x1407126c5: mov    rcx,r13
0x1407126c8: call   0x1400b9d10
0x1407126cd: lea    rdx,[rip+0xed6068]        # 0x1415e873c  ' '
0x1407126d4: mov    rcx,r13
0x1407126d7: call   0x14006f560
0x1407126dc: lea    rdx,[rbp+0x10]
0x1407126e0: mov    rcx,r13
0x1407126e3: call   0x1400b9d10
0x1407126e8: lea    rdx,[rip+0xf72711]        # 0x141684e00  ' has a compound fracture'
0x1407126ef: cmp    edi,0x1
0x1407126f2: lea    rax,[rip+0xf726e7]        # 0x141684de0  ' have compound fractures'
0x1407126f9: cmovg  rdx,rax
0x1407126fd: mov    rcx,r13
0x140712700: call   0x14006f560
0x140712705: lea    rdx,[rip+0xeeb25c]        # 0x1415fd968  '.  '
0x14071270c: mov    rcx,r13
0x14071270f: call   0x14006f560
0x140712714: cmp    DWORD PTR [rbx+0x3c],0x0
0x140712718: jle    0x1407127b4
0x14071271e: lea    rdx,[rbp+0x30]
0x140712722: mov    rcx,r13
0x140712725: call   0x1400b9d10
0x14071272a: lea    rdx,[rip+0xed600b]        # 0x1415e873c  ' '
0x140712731: mov    rcx,r13
0x140712734: call   0x14006f560
0x140712739: lea    rdx,[rbp+0x10]
0x14071273d: mov    rcx,r13
0x140712740: call   0x1400b9d10
0x140712745: lea    rdx,[rip+0xedc48c]        # 0x1415eebd8  ' is'
0x14071274c: cmp    edi,0x1
0x14071274f: cmovg  rdx,r15
0x140712753: mov    rcx,r13
0x140712756: call   0x14006f560
0x14071275b: lea    rdx,[rip+0xed5fda]        # 0x1415e873c  ' '
0x140712762: mov    rcx,r13
0x140712765: call   0x14006f560
0x14071276a: mov    eax,DWORD PTR [rbx+0x30]
0x14071276d: test   al,0x1
0x14071276f: je     0x14071277a
0x140712771: lea    rdx,[rip+0xf72658]        # 0x141684dd0  'cut open'
0x140712778: jmp    0x14071279d
0x14071277a: test   al,0x2
0x14071277c: je     0x140712787
0x14071277e: lea    rdx,[rip+0xf7263b]        # 0x141684dc0  'smashed open'
0x140712785: jmp    0x14071279d
0x140712787: bt     eax,0x13
0x14071278b: lea    rdx,[rip+0xf7261e]        # 0x141684db0  'broken open'
0x140712792: lea    rax,[rip+0xf72607]        # 0x141684da0  'torn open'
0x140712799: cmovae rdx,rax
0x14071279d: mov    rcx,r13
0x1407127a0: call   0x14006f560
0x1407127a5: lea    rdx,[rip+0xeeb1bc]        # 0x1415fd968  '.  '
0x1407127ac: mov    rcx,r13
0x1407127af: call   0x14006f560
0x1407127b4: cmp    DWORD PTR [rbx+0x8],0x0
0x1407127b8: jle    0x14071288c
0x1407127be: lea    rdx,[rbp+0x30]
0x1407127c2: mov    rcx,r13
0x1407127c5: call   0x1400b9d10
0x1407127ca: lea    rdx,[rip+0xed5f6b]        # 0x1415e873c  ' '
0x1407127d1: mov    rcx,r13
0x1407127d4: call   0x14006f560
0x1407127d9: lea    rdx,[rbp+0x10]
0x1407127dd: mov    rcx,r13
0x1407127e0: call   0x1400b9d10
0x1407127e5: lea    rdx,[rip+0xedc3ec]        # 0x1415eebd8  ' is'
0x1407127ec: cmp    edi,0x1
0x1407127ef: cmovg  rdx,r15
0x1407127f3: mov    rcx,r13
0x1407127f6: call   0x14006f560
0x1407127fb: lea    rdx,[rip+0xed5f3a]        # 0x1415e873c  ' '
0x140712802: mov    rcx,r13
0x140712805: call   0x14006f560
0x14071280a: mov    eax,DWORD PTR [rbx+0x8]
0x14071280d: cmp    eax,0x64
0x140712810: jl     0x14071281b
0x140712812: lea    rdx,[rip+0xf7257f]        # 0x141684d98  'gouting'
0x140712819: jmp    0x14071285a
0x14071281b: cmp    eax,0x32
0x14071281e: jl     0x140712829
0x140712820: lea    rdx,[rip+0xf72569]        # 0x141684d90  'gushing'
0x140712827: jmp    0x14071285a
0x140712829: cmp    eax,0x19
0x14071282c: jl     0x140712837
0x14071282e: lea    rdx,[rip+0xf7254b]        # 0x141684d80  'spraying'
0x140712835: jmp    0x14071285a
0x140712837: cmp    eax,0xa
0x14071283a: jl     0x140712845
0x14071283c: lea    rdx,[rip+0xf7252d]        # 0x141684d70  'running with'
0x140712843: jmp    0x14071285a
0x140712845: lea    rdx,[rip+0xf72514]        # 0x141684d60  'dripping'
0x14071284c: cmp    eax,0x5
0x14071284f: lea    rax,[rip+0xf724fe]        # 0x141684d54  'oozing'
0x140712856: cmovl  rdx,rax
0x14071285a: mov    rcx,r13
0x14071285d: call   0x14006f560
0x140712862: lea    rdx,[rip+0xed5ed3]        # 0x1415e873c  ' '
0x140712869: mov    rcx,r13
0x14071286c: call   0x14006f560
0x140712871: lea    rdx,[rbp-0x50]
0x140712875: mov    rcx,r13
0x140712878: call   0x1400b9d10
0x14071287d: lea    rdx,[rip+0xeeb0e4]        # 0x1415fd968  '.  '
0x140712884: mov    rcx,r13
0x140712887: call   0x14006f560
0x14071288c: cmp    BYTE PTR [rbx+0x28],0x0
0x140712890: jne    0x140712aa6
0x140712896: cmp    DWORD PTR [rbx+0x48],0x0
0x14071289a: jle    0x1407128e8
0x14071289c: lea    rdx,[rbp+0x30]
0x1407128a0: mov    rcx,r13
0x1407128a3: call   0x1400b9d10
0x1407128a8: lea    rdx,[rip+0xed5e8d]        # 0x1415e873c  ' '
0x1407128af: mov    rcx,r13
0x1407128b2: call   0x14006f560
0x1407128b7: lea    rdx,[rbp+0x10]
0x1407128bb: mov    rcx,r13
0x1407128be: call   0x1400b9d10
0x1407128c3: lea    rdx,[rip+0xedc30e]        # 0x1415eebd8  ' is'
0x1407128ca: cmp    edi,0x1
0x1407128cd: cmovg  rdx,r15
0x1407128d1: mov    rcx,r13
0x1407128d4: call   0x14006f560
0x1407128d9: lea    rdx,[rip+0xf72468]        # 0x141684d48  ' dented.  '
0x1407128e0: mov    rcx,r13
0x1407128e3: call   0x14006f560
0x1407128e8: cmp    BYTE PTR [rbx+0x28],0x0
0x1407128ec: jne    0x140712aa6
0x1407128f2: cmp    DWORD PTR [rbx+0x10],0x0
0x1407128f6: jle    0x1407129cb
0x1407128fc: lea    rdx,[rbp+0x30]
0x140712900: mov    rcx,r13
0x140712903: call   0x1400b9d10
0x140712908: lea    rdx,[rip+0xed5e2d]        # 0x1415e873c  ' '
0x14071290f: mov    rcx,r13
0x140712912: call   0x14006f560
0x140712917: lea    rdx,[rbp+0x10]
0x14071291b: mov    rcx,r13
0x14071291e: call   0x1400b9d10
0x140712923: lea    rdx,[rip+0xedc2ae]        # 0x1415eebd8  ' is'
0x14071292a: cmp    edi,0x1
0x14071292d: cmovg  rdx,r15
0x140712931: mov    rcx,r13
0x140712934: call   0x14006f560
0x140712939: lea    rdx,[rip+0xed5dfc]        # 0x1415e873c  ' '
0x140712940: mov    rcx,r13
0x140712943: call   0x14006f560
0x140712948: movsx  rax,WORD PTR [rbx+0x14]
0x14071294d: cmp    eax,0x9
0x140712950: ja     0x1407129bc
0x140712952: lea    rdx,[rip+0xffffffffff8ed6a7]        # 0x140000000
0x140712959: mov    ecx,DWORD PTR [rdx+rax*4+0x716a5c]
0x140712960: add    rcx,rdx
0x140712963: jmp    rcx
0x140712965: lea    rdx,[rip+0xedc17c]        # 0x1415eeae8  'bruised'
0x14071296c: jmp    0x1407129b4
0x14071296e: lea    rdx,[rip+0xf723c3]        # 0x141684d38  'frost-bitten'
0x140712975: jmp    0x1407129b4
0x140712977: lea    rdx,[rip+0xf5060a]        # 0x141662f88  'burned'
0x14071297e: jmp    0x1407129b4
0x140712980: lea    rdx,[rip+0xf723a9]        # 0x141684d30  'melted'
0x140712987: jmp    0x1407129b4
0x140712989: lea    rdx,[rip+0xf7255c]        # 0x141684eec  'boiled'
0x140712990: jmp    0x1407129b4
0x140712992: lea    rdx,[rip+0xf7254b]        # 0x141684ee4  'frozen'
0x140712999: jmp    0x1407129b4
0x14071299b: lea    rdx,[rip+0xf72536]        # 0x141684ed8  'condensed'
0x1407129a2: jmp    0x1407129b4
0x1407129a4: lea    rdx,[rip+0xedbfc5]        # 0x1415ee970  'rotten'
0x1407129ab: jmp    0x1407129b4
0x1407129ad: lea    rdx,[rip+0xf72514]        # 0x141684ec8  'blistered'
0x1407129b4: mov    rcx,r13
0x1407129b7: call   0x14006f560
0x1407129bc: lea    rdx,[rip+0xeeafa5]        # 0x1415fd968  '.  '
0x1407129c3: mov    rcx,r13
0x1407129c6: call   0x14006f560
0x1407129cb: cmp    BYTE PTR [rbx+0x28],0x0
0x1407129cf: jne    0x140712aa6
0x1407129d5: cmp    DWORD PTR [rbx+0xc],0x0
0x1407129d9: jle    0x140712aa6
0x1407129df: lea    rdx,[rbp+0x30]
0x1407129e3: mov    rcx,r13
0x1407129e6: call   0x1400b9d10
0x1407129eb: lea    rdx,[rip+0xed5d4a]        # 0x1415e873c  ' '
0x1407129f2: mov    rcx,r13
0x1407129f5: call   0x14006f560
0x1407129fa: lea    rdx,[rbp+0x10]
0x1407129fe: mov    rcx,r13
0x140712a01: call   0x1400b9d10
0x140712a06: lea    rdx,[rip+0xedc1cb]        # 0x1415eebd8  ' is'
0x140712a0d: cmp    edi,0x1
0x140712a10: cmovg  rdx,r15
0x140712a14: mov    rcx,r13
0x140712a17: call   0x14006f560
0x140712a1c: lea    rdx,[rip+0xed5d19]        # 0x1415e873c  ' '
0x140712a23: mov    rcx,r13
0x140712a26: call   0x14006f560
0x140712a2b: mov    eax,DWORD PTR [rbx+0xc]
0x140712a2e: cmp    eax,0x64
0x140712a31: jl     0x140712a3c
0x140712a33: lea    rdx,[rip+0xf72476]        # 0x141684eb0  'completely swollen'
0x140712a3a: jmp    0x140712a74
0x140712a3c: cmp    eax,0x32
0x140712a3f: jl     0x140712a4a
0x140712a41: lea    rdx,[rip+0xf72458]        # 0x141684ea0  'heavily swollen'
0x140712a48: jmp    0x140712a74
0x140712a4a: cmp    eax,0x19
0x140712a4d: jl     0x140712a58
0x140712a4f: lea    rdx,[rip+0xf7243a]        # 0x141684e90  'very swollen'
0x140712a56: jmp    0x140712a74
0x140712a58: cmp    eax,0xa
0x140712a5b: jl     0x140712a66
0x140712a5d: lea    rdx,[rip+0xf7241c]        # 0x141684e80  'quite swollen'
0x140712a64: jmp    0x140712a74
0x140712a66: lea    rdx,[rip+0xf7240b]        # 0x141684e78  'swollen'
0x140712a6d: cmp    eax,0x5
0x140712a70: cmovl  rdx,r12
0x140712a74: mov    rcx,r13
0x140712a77: call   0x14006f560
0x140712a7c: lea    rdx,[rip+0xedbb5d]        # 0x1415ee5e0  ' with '
0x140712a83: mov    rcx,r13
0x140712a86: call   0x14006f560
0x140712a8b: lea    rdx,[rbp-0x50]
0x140712a8f: mov    rcx,r13
0x140712a92: call   0x1400b9d10
0x140712a97: lea    rdx,[rip+0xeeaeca]        # 0x1415fd968  '.  '
0x140712a9e: mov    rcx,r13
0x140712aa1: call   0x14006f560
0x140712aa6: inc    esi
0x140712aa8: movsxd rbx,esi
0x140712aab: mov    rcx,r14
0x140712aae: call   0x14006ee50
0x140712ab3: cmp    rbx,rax
0x140712ab6: mov    rdi,QWORD PTR [rsp+0x50]
0x140712abb: jb     0x140712500
0x140712ac1: xor    ebx,ebx
0x140712ac3: lea    rdx,[rip+0xf7238e]        # 0x141684e58  '[P]'
0x140712aca: mov    rcx,r13
0x140712acd: call   0x14006f560
0x140712ad2: lea    rdx,[rip+0xeef957]        # 0x141602430  '[C:7:0:1]'
0x140712ad9: mov    rcx,r13
0x140712adc: call   0x14006f560
0x140712ae1: nop
0x140712ae2: lea    rcx,[rbp-0x50]
0x140712ae6: call   0x140067e30
0x140712aeb: nop
0x140712aec: lea    rcx,[rbp+0x10]
0x140712af0: call   0x140067e30
0x140712af5: mov    DWORD PTR [rbp-0x60],ebx
0x140712af8: lea    rax,[rdi+0x148]
0x140712aff: mov    QWORD PTR [rbp-0x70],rax
0x140712b03: mov    rcx,QWORD PTR [rax]
0x140712b06: mov    rax,QWORD PTR [rax+0x8]
0x140712b0a: sub    rax,rcx
0x140712b0d: sar    rax,0x3
0x140712b11: test   rax,rax
0x140712b14: je     0x140712d91
0x140712b1a: mov    r9,rbx
0x140712b1d: mov    QWORD PTR [rbp-0x80],rbx
0x140712b21: mov    QWORD PTR [rbp-0x78],rbx
0x140712b25: mov    edx,0x3
0x140712b2a: lea    r8,[rip+0xffffffffff9552ff]        # 0x140067e30
0x140712b31: movzx  esi,BYTE PTR [rsp+0x40]
0x140712b36: movzx  r14d,BYTE PTR [rsp+0x40]
0x140712b3c: movzx  edi,BYTE PTR [rsp+0x40]
0x140712b41: movzx  r15d,BYTE PTR [rsp+0x40]
0x140712b47: movzx  r12d,BYTE PTR [rsp+0x40]
0x140712b4d: nop    DWORD PTR [rax]
0x140712b50: mov    rax,QWORD PTR [rcx+r9*8]
0x140712b54: mov    r9,QWORD PTR [rax+0x38]
0x140712b58: mov    rcx,QWORD PTR [rax+0x40]
0x140712b5c: sub    rcx,r9
0x140712b5f: sar    rcx,0x2
0x140712b63: mov    QWORD PTR [rbp-0x68],rcx
0x140712b67: test   rcx,rcx
0x140712b6a: je     0x140713b10
0x140712b70: cmp    WORD PTR [rax],0x0
0x140712b74: jne    0x14071365e
0x140712b7a: mov    DWORD PTR [rsp+0x44],0xffff8ad0
0x140712b82: mov    DWORD PTR [rsp+0x68],0xffff8ad0
0x140712b8a: mov    DWORD PTR [rsp+0x58],0xffff8ad0
0x140712b92: mov    r10d,0xffff8ad0
0x140712b98: mov    r13d,r10d
0x140712b9b: mov    DWORD PTR [rsp+0x60],r10d
0x140712ba0: xor    eax,eax
0x140712ba2: mov    r11d,eax
0x140712ba5: mov    rcx,QWORD PTR [rsp+0x50]
0x140712baa: mov    rax,QWORD PTR [rcx+0x8]
0x140712bae: mov    rsi,QWORD PTR [rax+0x1608]
0x140712bb5: mov    r14,QWORD PTR [rcx+0x18]
0x140712bb9: mov    rdi,QWORD PTR [rbp-0x68]
0x140712bbd: nop    DWORD PTR [rax]
0x140712bc0: movsxd rcx,DWORD PTR [r9]
0x140712bc3: mov    rax,QWORD PTR [rsi+rcx*8]
0x140712bc7: mov    edx,DWORD PTR [r14+rcx*4]
0x140712bcb: mov    r8d,DWORD PTR [rax+0x10]
0x140712bcf: movsx  ecx,WORD PTR [rax]
0x140712bd2: test   ecx,ecx
0x140712bd4: je     0x140712bfe
0x140712bd6: sub    ecx,0x1
0x140712bd9: je     0x140712bf0
0x140712bdb: cmp    ecx,0x1
0x140712bde: mov    ecx,DWORD PTR [rsp+0x68]
0x140712be2: jne    0x140712c0f
0x140712be4: mov    DWORD PTR [rsp+0x44],edx
0x140712be8: mov    r10d,edx
0x140712beb: sub    r10d,r8d
0x140712bee: jmp    0x140712c0f
0x140712bf0: mov    ecx,edx
0x140712bf2: mov    DWORD PTR [rsp+0x68],edx
0x140712bf6: mov    r13d,edx
0x140712bf9: sub    r13d,r8d
0x140712bfc: jmp    0x140712c0f
0x140712bfe: mov    DWORD PTR [rsp+0x58],edx
0x140712c02: mov    ebx,edx
0x140712c04: sub    ebx,r8d
0x140712c07: mov    DWORD PTR [rsp+0x60],ebx
0x140712c0b: mov    ecx,DWORD PTR [rsp+0x68]
0x140712c0f: inc    r11d
0x140712c12: add    r9,0x4
0x140712c16: movsxd rax,r11d
0x140712c19: cmp    rax,rdi
0x140712c1c: jb     0x140712bc0
0x140712c1e: mov    DWORD PTR [rsp+0x40],r10d
0x140712c23: cmp    r10d,0xffff8ad0
0x140712c2a: movzx  edi,BYTE PTR [rsp+0x40]
0x140712c2f: movzx  esi,BYTE PTR [rsp+0x40]
0x140712c34: movzx  r14d,BYTE PTR [rsp+0x40]
0x140712c3a: mov    eax,DWORD PTR [rsp+0x60]
0x140712c3e: je     0x140712de8
0x140712c44: cmp    eax,0xffff8ad0
0x140712c49: je     0x14071307e
0x140712c4f: cmp    r13d,0xffff8ad0
0x140712c56: je     0x140713071
0x140712c5c: movsxd r13,DWORD PTR [rsp+0x58]
0x140712c61: movsxd rax,ecx
0x140712c64: imul   r13,rax
0x140712c68: movsxd rax,DWORD PTR [rsp+0x44]
0x140712c6d: imul   r13,rax
0x140712c71: lea    rcx,[rbp-0x50]
0x140712c75: call   0x14006f690
0x140712c7a: nop
0x140712c7b: cmp    r13,0x16e360
0x140712c82: jl     0x140712c8b
0x140712c84: xor    eax,eax
0x140712c86: movzx  edx,ax
0x140712c89: jmp    0x140712ce0
0x140712c8b: cmp    r13,0x1312d0
0x140712c92: jl     0x140712c9b
0x140712c94: mov    edx,0x1
0x140712c99: jmp    0x140712ce0
0x140712c9b: cmp    r13,0x10c8e0
0x140712ca2: jl     0x140712cab
0x140712ca4: mov    edx,0x2
0x140712ca9: jmp    0x140712ce0
0x140712cab: cmp    r13,0x7c830
0x140712cb2: jge    0x140712cbb
0x140712cb4: mov    edx,0x1b
0x140712cb9: jmp    0x140712ce0
0x140712cbb: cmp    r13,0xb98c0
0x140712cc2: jge    0x140712ccb
0x140712cc4: mov    edx,0x1a
0x140712cc9: jmp    0x140712ce0
0x140712ccb: cmp    r13,0xde2b0
0x140712cd2: jge    0x140712cdb
0x140712cd4: mov    edx,0x19
0x140712cd9: jmp    0x140712ce0
0x140712cdb: mov    edx,0x18
0x140712ce0: mov    rax,QWORD PTR [rsp+0x50]
0x140712ce5: mov    r9d,DWORD PTR [rax+0x14]
0x140712ce9: mov    r8d,DWORD PTR [rax+0x10]
0x140712ced: lea    rcx,[rbp-0x50]
0x140712cf1: call   0x14070c240
0x140712cf6: lea    rcx,[rbp-0x50]
0x140712cfa: call   0x14006f520
0x140712cff: test   al,al
0x140712d01: jne    0x140712d3f
0x140712d03: lea    rdx,[rbp+0x50]
0x140712d07: mov    r13,QWORD PTR [rsp+0x70]
0x140712d0c: mov    rcx,r13
0x140712d0f: call   0x1400b9d10
0x140712d14: lea    rdx,[rip+0xed5a21]        # 0x1415e873c  ' '
0x140712d1b: mov    rcx,r13
0x140712d1e: call   0x14006f560
0x140712d23: lea    rdx,[rbp-0x50]
0x140712d27: mov    rcx,r13
0x140712d2a: call   0x1400b9d10
0x140712d2f: lea    rdx,[rip+0xeeac32]        # 0x1415fd968  '.  '
0x140712d36: mov    rcx,r13
0x140712d39: call   0x14006f560
0x140712d3e: nop
0x140712d3f: lea    rcx,[rbp-0x50]
0x140712d43: call   0x140067e30
0x140712d48: mov    r13,QWORD PTR [rsp+0x70]
0x140712d4d: mov    r10d,DWORD PTR [rbp-0x60]
0x140712d51: inc    r10d
0x140712d54: mov    DWORD PTR [rbp-0x60],r10d
0x140712d58: mov    r9,QWORD PTR [rbp-0x80]
0x140712d5c: inc    r9
0x140712d5f: mov    QWORD PTR [rbp-0x80],r9
0x140712d63: mov    r8,QWORD PTR [rbp-0x70]
0x140712d67: mov    rcx,QWORD PTR [r8]
0x140712d6a: movsxd rdx,r10d
0x140712d6d: mov    QWORD PTR [rbp-0x78],rdx
0x140712d71: mov    rax,QWORD PTR [r8+0x8]
0x140712d75: sub    rax,rcx
0x140712d78: sar    rax,0x3
0x140712d7c: cmp    rdx,rax
0x140712d7f: mov    edx,0x3
0x140712d84: lea    r8,[rip+0xffffffffff9550a5]        # 0x140067e30
0x140712d8b: jb     0x140712b50
0x140712d91: lea    rcx,[rbp+0x30]
0x140712d95: call   0x14006f850
0x140712d9a: nop
0x140712d9b: lea    rcx,[rbp+0xd0]
0x140712da2: call   0x14006f850
0x140712da7: nop
0x140712da8: lea    rcx,[rbp+0x50]
0x140712dac: call   0x14006f850
0x140712db1: nop
0x140712db2: lea    rcx,[rbp+0xb0]
0x140712db9: call   0x14006f850
0x140712dbe: mov    rcx,QWORD PTR [rbp+0x1b0]
0x140712dc5: xor    rcx,rsp
0x140712dc8: call   0x141539660
0x140712dcd: mov    rbx,QWORD PTR [rsp+0x310]
0x140712dd5: add    rsp,0x2c0
0x140712ddc: pop    r15
0x140712dde: pop    r14
0x140712de0: pop    r13
0x140712de2: pop    r12
0x140712de4: pop    rdi
0x140712de5: pop    rsi
0x140712de6: pop    rbp
0x140712de7: ret
0x140712de8: cmp    eax,0xffff8ad0
0x140712ded: je     0x1407133f5
0x140712df3: cmp    r13d,0xffff8ad0
0x140712dfa: je     0x140713071
0x140712e00: lea    rcx,[rbp-0x50]
0x140712e04: call   0x14006f690
0x140712e09: nop
0x140712e0a: mov    eax,DWORD PTR [rsp+0x60]
0x140712e0e: cmp    eax,0x32
0x140712e11: jl     0x140712e30
0x140712e13: cmp    r13d,0x32
0x140712e17: jl     0x140712e57
0x140712e19: xor    eax,eax
0x140712e1b: movzx  edx,ax
0x140712e1e: mov    r13,QWORD PTR [rsp+0x50]
0x140712e23: mov    r8d,DWORD PTR [r13+0x10]
0x140712e27: mov    r9d,DWORD PTR [r13+0x14]
0x140712e2b: jmp    0x14071301a
0x140712e30: cmp    eax,0xffffffce
0x140712e33: jg     0x140712e52
0x140712e35: cmp    r13d,0xffffffce
0x140712e39: jg     0x140712e96
0x140712e3b: mov    edx,0x1b
0x140712e40: mov    r13,QWORD PTR [rsp+0x50]
0x140712e45: mov    r8d,DWORD PTR [r13+0x10]
0x140712e49: mov    r9d,DWORD PTR [r13+0x14]
0x140712e4d: jmp    0x14071301a
0x140712e52: cmp    eax,0xa
0x140712e55: jl     0x140712e91
0x140712e57: cmp    r13d,0xa
0x140712e5b: jl     0x140712e74
0x140712e5d: mov    edx,0x2
0x140712e62: mov    r13,QWORD PTR [rsp+0x50]
0x140712e67: mov    r8d,DWORD PTR [r13+0x10]
0x140712e6b: mov    r9d,DWORD PTR [r13+0x14]
0x140712e6f: jmp    0x14071301a
0x140712e74: cmp    r13d,0xfffffff6
0x140712e78: jg     0x140712ed0
0x140712e7a: mov    edx,0x3
0x140712e7f: mov    r13,QWORD PTR [rsp+0x50]
0x140712e84: mov    r8d,DWORD PTR [r13+0x10]
0x140712e88: mov    r9d,DWORD PTR [r13+0x14]
0x140712e8c: jmp    0x14071301a
0x140712e91: cmp    eax,0xfffffff6
0x140712e94: jg     0x140712ed0
0x140712e96: cmp    r13d,0xa
0x140712e9a: jl     0x140712eb3
0x140712e9c: mov    edx,0x4
0x140712ea1: mov    r13,QWORD PTR [rsp+0x50]
0x140712ea6: mov    r8d,DWORD PTR [r13+0x10]
0x140712eaa: mov    r9d,DWORD PTR [r13+0x14]
0x140712eae: jmp    0x14071301a
0x140712eb3: cmp    r13d,0xfffffff6
0x140712eb7: jg     0x140712ed0
0x140712eb9: mov    edx,0x19
0x140712ebe: mov    r13,QWORD PTR [rsp+0x50]
0x140712ec3: mov    r8d,DWORD PTR [r13+0x10]
0x140712ec7: mov    r9d,DWORD PTR [r13+0x14]
0x140712ecb: jmp    0x14071301a
0x140712ed0: cmp    r13d,0x32
0x140712ed4: jl     0x140712eed
0x140712ed6: mov    edx,0x5
0x140712edb: mov    r13,QWORD PTR [rsp+0x50]
0x140712ee0: mov    r8d,DWORD PTR [r13+0x10]
0x140712ee4: mov    r9d,DWORD PTR [r13+0x14]
0x140712ee8: jmp    0x14071301a
0x140712eed: cmp    r13d,0x19
0x140712ef1: jl     0x140712f0a
0x140712ef3: mov    edx,0x6
0x140712ef8: mov    r13,QWORD PTR [rsp+0x50]
0x140712efd: mov    r8d,DWORD PTR [r13+0x10]
0x140712f01: mov    r9d,DWORD PTR [r13+0x14]
0x140712f05: jmp    0x14071301a
0x140712f0a: cmp    r13d,0xa
0x140712f0e: jl     0x140712f27
0x140712f10: mov    edx,0x7
0x140712f15: mov    r13,QWORD PTR [rsp+0x50]
0x140712f1a: mov    r8d,DWORD PTR [r13+0x10]
0x140712f1e: mov    r9d,DWORD PTR [r13+0x14]
0x140712f22: jmp    0x14071301a
0x140712f27: cmp    r13d,0xffffffce
0x140712f2b: jg     0x140712f44
0x140712f2d: mov    edx,0x9
0x140712f32: mov    r13,QWORD PTR [rsp+0x50]
0x140712f37: mov    r8d,DWORD PTR [r13+0x10]
0x140712f3b: mov    r9d,DWORD PTR [r13+0x14]
0x140712f3f: jmp    0x14071301a
0x140712f44: cmp    r13d,0xffffffe7
0x140712f48: jg     0x140712f61
0x140712f4a: mov    edx,0xa
0x140712f4f: mov    r13,QWORD PTR [rsp+0x50]
0x140712f54: mov    r8d,DWORD PTR [r13+0x10]
0x140712f58: mov    r9d,DWORD PTR [r13+0x14]
0x140712f5c: jmp    0x14071301a
0x140712f61: cmp    r13d,0xfffffff6
0x140712f65: jg     0x140712f7e
0x140712f67: mov    edx,0xb
0x140712f6c: mov    r13,QWORD PTR [rsp+0x50]
0x140712f71: mov    r8d,DWORD PTR [r13+0x10]
0x140712f75: mov    r9d,DWORD PTR [r13+0x14]
0x140712f79: jmp    0x14071301a
0x140712f7e: cmp    eax,0x32
0x140712f81: jl     0x140712f9a
0x140712f83: mov    edx,0xc
0x140712f88: mov    r13,QWORD PTR [rsp+0x50]
0x140712f8d: mov    r8d,DWORD PTR [r13+0x10]
0x140712f91: mov    r9d,DWORD PTR [r13+0x14]
0x140712f95: jmp    0x14071301a
0x140712f9a: cmp    eax,0x19
0x140712f9d: jl     0x140712fb3
0x140712f9f: mov    edx,0xd
0x140712fa4: mov    r13,QWORD PTR [rsp+0x50]
0x140712fa9: mov    r8d,DWORD PTR [r13+0x10]
0x140712fad: mov    r9d,DWORD PTR [r13+0x14]
0x140712fb1: jmp    0x14071301a
0x140712fb3: cmp    eax,0xa
0x140712fb6: jl     0x140712fcc
0x140712fb8: mov    edx,0xe
0x140712fbd: mov    r13,QWORD PTR [rsp+0x50]
0x140712fc2: mov    r8d,DWORD PTR [r13+0x10]
0x140712fc6: mov    r9d,DWORD PTR [r13+0x14]
0x140712fca: jmp    0x14071301a
0x140712fcc: cmp    eax,0xffffffce
0x140712fcf: jg     0x140712fe5
0x140712fd1: mov    edx,0x12
0x140712fd6: mov    r13,QWORD PTR [rsp+0x50]
0x140712fdb: mov    r8d,DWORD PTR [r13+0x10]
0x140712fdf: mov    r9d,DWORD PTR [r13+0x14]
0x140712fe3: jmp    0x14071301a
0x140712fe5: cmp    eax,0xffffffe7
0x140712fe8: jg     0x140712ffe
0x140712fea: mov    edx,0x13
0x140712fef: mov    r13,QWORD PTR [rsp+0x50]
0x140712ff4: mov    r8d,DWORD PTR [r13+0x10]
0x140712ff8: mov    r9d,DWORD PTR [r13+0x14]
0x140712ffc: jmp    0x14071301a
0x140712ffe: mov    rcx,QWORD PTR [rsp+0x50]
0x140713003: mov    r9d,DWORD PTR [rcx+0x14]
0x140713007: mov    r8d,DWORD PTR [rcx+0x10]
0x14071300b: cmp    eax,0xfffffff6
0x14071300e: mov    edx,0x14
0x140713013: jle    0x14071301a
0x140713015: mov    edx,0x18
0x14071301a: lea    rcx,[rbp-0x50]
0x14071301e: call   0x14070c240
0x140713023: lea    rcx,[rbp-0x50]
0x140713027: call   0x14006f520
0x14071302c: test   al,al
0x14071302e: jne    0x14071306c
0x140713030: lea    rdx,[rbp+0x50]
0x140713034: mov    r13,QWORD PTR [rsp+0x70]
0x140713039: mov    rcx,r13
0x14071303c: call   0x1400b9d10
0x140713041: lea    rdx,[rip+0xed56f4]        # 0x1415e873c  ' '
0x140713048: mov    rcx,r13
0x14071304b: call   0x14006f560
0x140713050: lea    rdx,[rbp-0x50]
0x140713054: mov    rcx,r13
0x140713057: call   0x1400b9d10
0x14071305c: lea    rdx,[rip+0xeea905]        # 0x1415fd968  '.  '
0x140713063: mov    rcx,r13
0x140713066: call   0x14006f560
0x14071306b: nop
0x14071306c: jmp    0x140712d3f
0x140713071: cmp    r10d,0xffff8ad0
0x140713078: je     0x1407132fc
0x14071307e: cmp    r13d,0xffff8ad0
0x140713085: je     0x1407132fc
0x14071308b: lea    rcx,[rbp-0x50]
0x14071308f: call   0x14006f690
0x140713094: nop
0x140713095: mov    eax,DWORD PTR [rsp+0x40]
0x140713099: cmp    eax,0x32
0x14071309c: jl     0x1407130bb
0x14071309e: cmp    r13d,0x32
0x1407130a2: jl     0x1407130e2
0x1407130a4: xor    eax,eax
0x1407130a6: movzx  edx,ax
0x1407130a9: mov    r13,QWORD PTR [rsp+0x50]
0x1407130ae: mov    r8d,DWORD PTR [r13+0x10]
0x1407130b2: mov    r9d,DWORD PTR [r13+0x14]
0x1407130b6: jmp    0x1407132a5
0x1407130bb: cmp    eax,0xffffffce
0x1407130be: jg     0x1407130dd
0x1407130c0: cmp    r13d,0xffffffce
0x1407130c4: jg     0x140713121
0x1407130c6: mov    edx,0x1b
0x1407130cb: mov    r13,QWORD PTR [rsp+0x50]
0x1407130d0: mov    r8d,DWORD PTR [r13+0x10]
0x1407130d4: mov    r9d,DWORD PTR [r13+0x14]
0x1407130d8: jmp    0x1407132a5
0x1407130dd: cmp    eax,0xa
0x1407130e0: jl     0x14071311c
0x1407130e2: cmp    r13d,0xa
0x1407130e6: jl     0x1407130ff
0x1407130e8: mov    edx,0x2
0x1407130ed: mov    r13,QWORD PTR [rsp+0x50]
0x1407130f2: mov    r8d,DWORD PTR [r13+0x10]
0x1407130f6: mov    r9d,DWORD PTR [r13+0x14]
0x1407130fa: jmp    0x1407132a5
0x1407130ff: cmp    r13d,0xfffffff6
0x140713103: jg     0x14071315b
0x140713105: mov    edx,0x8
0x14071310a: mov    r13,QWORD PTR [rsp+0x50]
0x14071310f: mov    r8d,DWORD PTR [r13+0x10]
0x140713113: mov    r9d,DWORD PTR [r13+0x14]
0x140713117: jmp    0x1407132a5
0x14071311c: cmp    eax,0xfffffff6
0x14071311f: jg     0x14071315b
0x140713121: cmp    r13d,0xa
0x140713125: jl     0x14071313e
0x140713127: mov    edx,0x4
0x14071312c: mov    r13,QWORD PTR [rsp+0x50]
0x140713131: mov    r8d,DWORD PTR [r13+0x10]
0x140713135: mov    r9d,DWORD PTR [r13+0x14]
0x140713139: jmp    0x1407132a5
0x14071313e: cmp    r13d,0xfffffff6
0x140713142: jg     0x14071315b
0x140713144: mov    edx,0x19
0x140713149: mov    r13,QWORD PTR [rsp+0x50]
0x14071314e: mov    r8d,DWORD PTR [r13+0x10]
0x140713152: mov    r9d,DWORD PTR [r13+0x14]
0x140713156: jmp    0x1407132a5
0x14071315b: cmp    r13d,0x32
0x14071315f: jl     0x140713178
0x140713161: mov    edx,0x5
0x140713166: mov    r13,QWORD PTR [rsp+0x50]
0x14071316b: mov    r8d,DWORD PTR [r13+0x10]
0x14071316f: mov    r9d,DWORD PTR [r13+0x14]
0x140713173: jmp    0x1407132a5
0x140713178: cmp    r13d,0x19
0x14071317c: jl     0x140713195
0x14071317e: mov    edx,0x6
0x140713183: mov    r13,QWORD PTR [rsp+0x50]
0x140713188: mov    r8d,DWORD PTR [r13+0x10]
0x14071318c: mov    r9d,DWORD PTR [r13+0x14]
0x140713190: jmp    0x1407132a5
0x140713195: cmp    r13d,0xa
0x140713199: jl     0x1407131b2
0x14071319b: mov    edx,0x7
0x1407131a0: mov    r13,QWORD PTR [rsp+0x50]
0x1407131a5: mov    r8d,DWORD PTR [r13+0x10]
0x1407131a9: mov    r9d,DWORD PTR [r13+0x14]
0x1407131ad: jmp    0x1407132a5
0x1407131b2: cmp    r13d,0xffffffce
0x1407131b6: jg     0x1407131cf
0x1407131b8: mov    edx,0x9
0x1407131bd: mov    r13,QWORD PTR [rsp+0x50]
0x1407131c2: mov    r8d,DWORD PTR [r13+0x10]
0x1407131c6: mov    r9d,DWORD PTR [r13+0x14]
0x1407131ca: jmp    0x1407132a5
0x1407131cf: cmp    r13d,0xffffffe7
0x1407131d3: jg     0x1407131ec
0x1407131d5: mov    edx,0xa
0x1407131da: mov    r13,QWORD PTR [rsp+0x50]
0x1407131df: mov    r8d,DWORD PTR [r13+0x10]
0x1407131e3: mov    r9d,DWORD PTR [r13+0x14]
0x1407131e7: jmp    0x1407132a5
0x1407131ec: cmp    r13d,0xfffffff6
0x1407131f0: jg     0x140713209
0x1407131f2: mov    edx,0xb
0x1407131f7: mov    r13,QWORD PTR [rsp+0x50]
0x1407131fc: mov    r8d,DWORD PTR [r13+0x10]
0x140713200: mov    r9d,DWORD PTR [r13+0x14]
0x140713204: jmp    0x1407132a5
0x140713209: cmp    eax,0x32
0x14071320c: jl     0x140713225
0x14071320e: mov    edx,0xf
0x140713213: mov    r13,QWORD PTR [rsp+0x50]
0x140713218: mov    r8d,DWORD PTR [r13+0x10]
0x14071321c: mov    r9d,DWORD PTR [r13+0x14]
0x140713220: jmp    0x1407132a5
0x140713225: cmp    eax,0x19
0x140713228: jl     0x14071323e
0x14071322a: mov    edx,0x10
0x14071322f: mov    r13,QWORD PTR [rsp+0x50]
0x140713234: mov    r8d,DWORD PTR [r13+0x10]
0x140713238: mov    r9d,DWORD PTR [r13+0x14]
0x14071323c: jmp    0x1407132a5
0x14071323e: cmp    eax,0xa
0x140713241: jl     0x140713257
0x140713243: mov    edx,0x11
0x140713248: mov    r13,QWORD PTR [rsp+0x50]
0x14071324d: mov    r8d,DWORD PTR [r13+0x10]
0x140713251: mov    r9d,DWORD PTR [r13+0x14]
0x140713255: jmp    0x1407132a5
0x140713257: cmp    eax,0xffffffce
0x14071325a: jg     0x140713270
0x14071325c: mov    edx,0x15
0x140713261: mov    r13,QWORD PTR [rsp+0x50]
0x140713266: mov    r8d,DWORD PTR [r13+0x10]
0x14071326a: mov    r9d,DWORD PTR [r13+0x14]
0x14071326e: jmp    0x1407132a5
0x140713270: cmp    eax,0xffffffe7
0x140713273: jg     0x140713289
0x140713275: mov    edx,0x16
0x14071327a: mov    r13,QWORD PTR [rsp+0x50]
0x14071327f: mov    r8d,DWORD PTR [r13+0x10]
0x140713283: mov    r9d,DWORD PTR [r13+0x14]
0x140713287: jmp    0x1407132a5
0x140713289: mov    rcx,QWORD PTR [rsp+0x50]
0x14071328e: mov    r9d,DWORD PTR [rcx+0x14]
0x140713292: mov    r8d,DWORD PTR [rcx+0x10]
0x140713296: cmp    eax,0xfffffff6
0x140713299: mov    edx,0x17
0x14071329e: jle    0x1407132a5
0x1407132a0: mov    edx,0x18
0x1407132a5: lea    rcx,[rbp-0x50]
0x1407132a9: call   0x14070c240
0x1407132ae: lea    rcx,[rbp-0x50]
0x1407132b2: call   0x14006f520
0x1407132b7: test   al,al
0x1407132b9: jne    0x1407132f7
0x1407132bb: lea    rdx,[rbp+0x50]
0x1407132bf: mov    r13,QWORD PTR [rsp+0x70]
0x1407132c4: mov    rcx,r13
0x1407132c7: call   0x1400b9d10
0x1407132cc: lea    rdx,[rip+0xed5469]        # 0x1415e873c  ' '
0x1407132d3: mov    rcx,r13
0x1407132d6: call   0x14006f560
0x1407132db: lea    rdx,[rbp-0x50]
0x1407132df: mov    rcx,r13
0x1407132e2: call   0x1400b9d10
0x1407132e7: lea    rdx,[rip+0xeea67a]        # 0x1415fd968  '.  '
0x1407132ee: mov    rcx,r13
0x1407132f1: call   0x14006f560
0x1407132f6: nop
0x1407132f7: jmp    0x140712d3f
0x1407132fc: cmp    eax,0xffff8ad0
0x140713301: je     0x1407133f5
0x140713307: cmp    r10d,0xffff8ad0
0x14071330e: je     0x1407134bf
0x140713314: movsxd r13,DWORD PTR [rsp+0x58]
0x140713319: movsxd rax,DWORD PTR [rsp+0x44]
0x14071331e: imul   r13,rax
0x140713322: lea    rcx,[rbp-0x50]
0x140713326: call   0x14006f690
0x14071332b: nop
0x14071332c: cmp    r13,0x3a98
0x140713333: jl     0x14071333c
0x140713335: xor    eax,eax
0x140713337: movzx  edx,ax
0x14071333a: jmp    0x140713391
0x14071333c: cmp    r13,0x30d4
0x140713343: jl     0x14071334c
0x140713345: mov    edx,0x1
0x14071334a: jmp    0x140713391
0x14071334c: cmp    r13,0x2af8
0x140713353: jl     0x14071335c
0x140713355: mov    edx,0x2
0x14071335a: jmp    0x140713391
0x14071335c: cmp    r13,0x13ec
0x140713363: jge    0x14071336c
0x140713365: mov    edx,0x1b
0x14071336a: jmp    0x140713391
0x14071336c: cmp    r13,0x1db0
0x140713373: jge    0x14071337c
0x140713375: mov    edx,0x1a
0x14071337a: jmp    0x140713391
0x14071337c: cmp    r13,0x238c
0x140713383: jge    0x14071338c
0x140713385: mov    edx,0x19
0x14071338a: jmp    0x140713391
0x14071338c: mov    edx,0x18
0x140713391: mov    rax,QWORD PTR [rsp+0x50]
0x140713396: mov    r9d,DWORD PTR [rax+0x14]
0x14071339a: mov    r8d,DWORD PTR [rax+0x10]
0x14071339e: lea    rcx,[rbp-0x50]
0x1407133a2: call   0x14070c240
0x1407133a7: lea    rcx,[rbp-0x50]
0x1407133ab: call   0x14006f520
0x1407133b0: test   al,al
0x1407133b2: jne    0x1407133f0
0x1407133b4: lea    rdx,[rbp+0x50]
0x1407133b8: mov    r13,QWORD PTR [rsp+0x70]
0x1407133bd: mov    rcx,r13
0x1407133c0: call   0x1400b9d10
0x1407133c5: lea    rdx,[rip+0xed5370]        # 0x1415e873c  ' '
0x1407133cc: mov    rcx,r13
0x1407133cf: call   0x14006f560
0x1407133d4: lea    rdx,[rbp-0x50]
0x1407133d8: mov    rcx,r13
0x1407133db: call   0x1400b9d10
0x1407133e0: lea    rdx,[rip+0xeea581]        # 0x1415fd968  '.  '
0x1407133e7: mov    rcx,r13
0x1407133ea: call   0x14006f560
0x1407133ef: nop
0x1407133f0: jmp    0x140712d3f
0x1407133f5: cmp    r10d,0xffff8ad0
0x1407133fc: je     0x1407134bf
0x140713402: lea    rcx,[rbp-0x50]
0x140713406: call   0x14006f690
0x14071340b: nop
0x14071340c: mov    eax,DWORD PTR [rsp+0x40]
0x140713410: cmp    eax,0x32
0x140713413: jl     0x14071341c
0x140713415: mov    edx,0xf
0x14071341a: jmp    0x14071345b
0x14071341c: cmp    eax,0x19
0x14071341f: jl     0x140713428
0x140713421: mov    edx,0x10
0x140713426: jmp    0x14071345b
0x140713428: cmp    eax,0xa
0x14071342b: jl     0x140713434
0x14071342d: mov    edx,0x11
0x140713432: jmp    0x14071345b
0x140713434: cmp    eax,0xffffffce
0x140713437: jg     0x140713440
0x140713439: mov    edx,0x15
0x14071343e: jmp    0x14071345b
0x140713440: cmp    eax,0xffffffe7
0x140713443: jg     0x14071344c
0x140713445: mov    edx,0x16
0x14071344a: jmp    0x14071345b
0x14071344c: cmp    eax,0xfffffff6
0x14071344f: mov    edx,0x17
0x140713454: jle    0x14071345b
0x140713456: mov    edx,0x18
0x14071345b: mov    rax,QWORD PTR [rsp+0x50]
0x140713460: mov    r9d,DWORD PTR [rax+0x14]
0x140713464: mov    r8d,DWORD PTR [rax+0x10]
0x140713468: lea    rcx,[rbp-0x50]
0x14071346c: call   0x14070c240
0x140713471: lea    rcx,[rbp-0x50]
0x140713475: call   0x14006f520
0x14071347a: test   al,al
0x14071347c: jne    0x1407134ba
0x14071347e: lea    rdx,[rbp+0x50]
0x140713482: mov    r13,QWORD PTR [rsp+0x70]
0x140713487: mov    rcx,r13
0x14071348a: call   0x1400b9d10
0x14071348f: lea    rdx,[rip+0xed52a6]        # 0x1415e873c  ' '
0x140713496: mov    rcx,r13
0x140713499: call   0x14006f560
0x14071349e: lea    rdx,[rbp-0x50]
0x1407134a2: mov    rcx,r13
0x1407134a5: call   0x1400b9d10
0x1407134aa: lea    rdx,[rip+0xeea4b7]        # 0x1415fd968  '.  '
0x1407134b1: mov    rcx,r13
0x1407134b4: call   0x14006f560
0x1407134b9: nop
0x1407134ba: jmp    0x140712d3f
0x1407134bf: cmp    r13d,0xffff8ad0
0x1407134c6: je     0x14071358d
0x1407134cc: lea    rcx,[rbp-0x50]
0x1407134d0: call   0x14006f690
0x1407134d5: nop
0x1407134d6: cmp    r13d,0x32
0x1407134da: jl     0x1407134e3
0x1407134dc: mov    edx,0x5
0x1407134e1: jmp    0x140713529
0x1407134e3: cmp    r13d,0x19
0x1407134e7: jl     0x1407134f0
0x1407134e9: mov    edx,0x6
0x1407134ee: jmp    0x140713529
0x1407134f0: cmp    r13d,0xa
0x1407134f4: jl     0x1407134fd
0x1407134f6: mov    edx,0x7
0x1407134fb: jmp    0x140713529
0x1407134fd: cmp    r13d,0xffffffce
0x140713501: jg     0x14071350a
0x140713503: mov    edx,0x9
0x140713508: jmp    0x140713529
0x14071350a: cmp    r13d,0xffffffe7
0x14071350e: jg     0x140713517
0x140713510: mov    edx,0xa
0x140713515: jmp    0x140713529
0x140713517: cmp    r13d,0xfffffff6
0x14071351b: jg     0x140713524
0x14071351d: mov    edx,0xb
0x140713522: jmp    0x140713529
0x140713524: mov    edx,0x18
0x140713529: mov    rax,QWORD PTR [rsp+0x50]
0x14071352e: mov    r9d,DWORD PTR [rax+0x14]
0x140713532: mov    r8d,DWORD PTR [rax+0x10]
0x140713536: lea    rcx,[rbp-0x50]
0x14071353a: call   0x14070c240
0x14071353f: lea    rcx,[rbp-0x50]
0x140713543: call   0x14006f520
0x140713548: test   al,al
0x14071354a: jne    0x140713588
0x14071354c: lea    rdx,[rbp+0x50]
0x140713550: mov    r13,QWORD PTR [rsp+0x70]
0x140713555: mov    rcx,r13
0x140713558: call   0x1400b9d10
0x14071355d: lea    rdx,[rip+0xed51d8]        # 0x1415e873c  ' '
0x140713564: mov    rcx,r13
0x140713567: call   0x14006f560
0x14071356c: lea    rdx,[rbp-0x50]
0x140713570: mov    rcx,r13
0x140713573: call   0x1400b9d10
0x140713578: lea    rdx,[rip+0xeea3e9]        # 0x1415fd968  '.  '
0x14071357f: mov    rcx,r13
0x140713582: call   0x14006f560
0x140713587: nop
0x140713588: jmp    0x140712d3f
0x14071358d: mov    r13d,DWORD PTR [rsp+0x60]
0x140713592: cmp    r13d,0xffff8ad0
0x140713599: je     0x140712d48
0x14071359f: lea    rcx,[rbp-0x50]
0x1407135a3: call   0x14006f690
0x1407135a8: nop
0x1407135a9: cmp    r13d,0x32
0x1407135ad: jl     0x1407135b6
0x1407135af: mov    edx,0xc
0x1407135b4: jmp    0x1407135fa
0x1407135b6: cmp    r13d,0x19
0x1407135ba: jl     0x1407135c3
0x1407135bc: mov    edx,0xd
0x1407135c1: jmp    0x1407135fa
0x1407135c3: cmp    r13d,0xa
0x1407135c7: jl     0x1407135d0
0x1407135c9: mov    edx,0xe
0x1407135ce: jmp    0x1407135fa
0x1407135d0: cmp    r13d,0xffffffce
0x1407135d4: jg     0x1407135dd
0x1407135d6: mov    edx,0x12
0x1407135db: jmp    0x1407135fa
0x1407135dd: cmp    r13d,0xffffffe7
0x1407135e1: jg     0x1407135ea
0x1407135e3: mov    edx,0x13
0x1407135e8: jmp    0x1407135fa
0x1407135ea: cmp    r13d,0xfffffff6
0x1407135ee: mov    edx,0x14
0x1407135f3: jle    0x1407135fa
0x1407135f5: mov    edx,0x18
0x1407135fa: mov    rax,QWORD PTR [rsp+0x50]
0x1407135ff: mov    r9d,DWORD PTR [rax+0x14]
0x140713603: mov    r8d,DWORD PTR [rax+0x10]
0x140713607: lea    rcx,[rbp-0x50]
0x14071360b: call   0x14070c240
0x140713610: lea    rcx,[rbp-0x50]
0x140713614: call   0x14006f520
0x140713619: test   al,al
0x14071361b: jne    0x140713659
0x14071361d: lea    rdx,[rbp+0x50]
0x140713621: mov    r13,QWORD PTR [rsp+0x70]
0x140713626: mov    rcx,r13
0x140713629: call   0x1400b9d10
0x14071362e: lea    rdx,[rip+0xed5107]        # 0x1415e873c  ' '
0x140713635: mov    rcx,r13
0x140713638: call   0x14006f560
0x14071363d: lea    rdx,[rbp-0x50]
0x140713641: mov    rcx,r13
0x140713644: call   0x1400b9d10
0x140713649: lea    rdx,[rip+0xeea318]        # 0x1415fd968  '.  '
0x140713650: mov    rcx,r13
0x140713653: call   0x14006f560
0x140713658: nop
0x140713659: jmp    0x140712d3f
0x14071365e: mov    QWORD PTR [rsp+0x20],r8
0x140713663: lea    r9,[rip+0xffffffffff95c026]        # 0x14006f690
0x14071366a: mov    r8,rdx
0x14071366d: mov    edx,0x20
0x140713672: lea    rcx,[rbp+0x150]
0x140713679: call   0x141539cb8
0x14071367e: nop
0x14071367f: xor    edx,edx
0x140713681: movzx  r13d,dx
0x140713685: mov    r8,QWORD PTR [rbp-0x70]
0x140713689: mov    r8,QWORD PTR [r8]
0x14071368c: mov    rcx,QWORD PTR [rbp-0x80]
0x140713690: mov    rax,QWORD PTR [r8+rcx*8]
0x140713694: mov    rcx,QWORD PTR [rax+0x40]
0x140713698: sub    rcx,QWORD PTR [rax+0x38]
0x14071369c: sar    rcx,0x2
0x1407136a0: test   rcx,rcx
0x1407136a3: je     0x140713a31
0x1407136a9: mov    ebx,edx
0x1407136ab: mov    edi,edx
0x1407136ad: mov    r15,QWORD PTR [rsp+0x50]
0x1407136b2: mov    r12,QWORD PTR [rbp-0x70]
0x1407136b6: mov    rsi,QWORD PTR [rbp-0x80]
0x1407136ba: lea    r14,[rip+0xffffffffff8ec93f]        # 0x140000000
0x1407136c1: nop    DWORD PTR [rax+0x0]
0x1407136c5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x1407136d0: mov    rdx,QWORD PTR [r15+0x8]
0x1407136d4: mov    rax,QWORD PTR [r8+rsi*8]
0x1407136d8: mov    rax,QWORD PTR [rax+0x38]
0x1407136dc: movsxd rcx,DWORD PTR [rbx+rax*1]
0x1407136e0: mov    rax,QWORD PTR [rdx+0x1608]
0x1407136e7: mov    rdx,QWORD PTR [rax+rcx*8]
0x1407136eb: mov    rax,QWORD PTR [r15+0x18]
0x1407136ef: mov    r8d,DWORD PTR [rax+rcx*4]
0x1407136f3: mov    r9d,DWORD PTR [rdx+0x10]
0x1407136f7: movsx  rax,WORD PTR [rdx]
0x1407136fb: cmp    eax,0x17
0x1407136fe: ja     0x1407139eb
0x140713704: mov    ecx,DWORD PTR [r14+rax*4+0x716a84]
0x14071370c: add    rcx,r14
0x14071370f: jmp    rcx
0x140713711: lea    rdx,[rip+0xf71738]        # 0x141684e50  'tall'
0x140713718: cmp    r8d,r9d
0x14071371b: lea    rax,[rip+0xf71726]        # 0x141684e48  'short'
0x140713722: cmovle rdx,rax
0x140713726: jmp    0x1407139d4
0x14071372b: lea    rdx,[rip+0xf7170e]        # 0x141684e40  'broad'
0x140713732: cmp    r8d,r9d
0x140713735: lea    rax,[rip+0xf716fc]        # 0x141684e38  'narrow'
0x14071373c: cmovle rdx,rax
0x140713740: jmp    0x1407139d4
0x140713745: lea    rdx,[rip+0xf716e4]        # 0x141684e30  'long'
0x14071374c: cmp    r8d,r9d
0x14071374f: lea    rax,[rip+0xf716f2]        # 0x141684e48  'short'
0x140713756: cmovle rdx,rax
0x14071375a: jmp    0x1407139d4
0x14071375f: lea    rdx,[rip+0xf3669a]        # 0x141649e00  'high'
0x140713766: cmp    r8d,r9d
0x140713769: lea    rax,[rip+0xf36698]        # 0x141649e08  'low'
0x140713770: cmovle rdx,rax
0x140713774: jmp    0x1407139d4
0x140713779: lea    rdx,[rip+0xf71e88]        # 0x141685608  'close-set'
0x140713780: cmp    r8d,r9d
0x140713783: lea    rax,[rip+0xf71e6e]        # 0x1416855f8  'wide-set'
0x14071378a: cmovle rdx,rax
0x14071378e: jmp    0x1407139d4
0x140713793: lea    rdx,[rip+0xf71e4e]        # 0x1416855e8  'large-irised'
0x14071379a: cmp    r8d,r9d
0x14071379d: lea    rax,[rip+0xf71e34]        # 0x1416855d8  'small-irised'
0x1407137a4: cmovle rdx,rax
0x1407137a8: jmp    0x1407139d4
0x1407137ad: lea    rdx,[rip+0xf71e18]        # 0x1416855cc  'sunken'
0x1407137b4: cmp    r8d,r9d
0x1407137b7: lea    rax,[rip+0xf71e02]        # 0x1416855c0  'protruding'
0x1407137be: cmovle rdx,rax
0x1407137c2: jmp    0x1407139d4
0x1407137c7: lea    rdx,[rip+0xf71de2]        # 0x1416855b0  'wrinkled'
0x1407137ce: cmp    r8d,r9d
0x1407137d1: lea    rax,[rip+0xf71dd0]        # 0x1416855a8  'smooth'
0x1407137d8: cmovle rdx,rax
0x1407137dc: jmp    0x1407139d4
0x1407137e1: lea    rdx,[rip+0xf71db8]        # 0x1416855a0  'convex'
0x1407137e8: cmp    r8d,r9d
0x1407137eb: lea    rax,[rip+0xf71da6]        # 0x141685598  'concave'
0x1407137f2: cmovle rdx,rax
0x1407137f6: jmp    0x1407139d4
0x1407137fb: lea    rdx,[rip+0xf71d8a]        # 0x14168558c  'curly'
0x140713802: cmp    r8d,r9d
0x140713805: lea    rax,[rip+0xf71d74]        # 0x141685580  'straight'
0x14071380c: cmovle rdx,rax
0x140713810: jmp    0x1407139d4
0x140713815: lea    rdx,[rip+0xf71d5c]        # 0x141685578  'dense'
0x14071381c: cmp    r8d,r9d
0x14071381f: lea    rax,[rip+0xf71d4a]        # 0x141685570  'sparse'
0x140713826: cmovle rdx,rax
0x14071382a: jmp    0x1407139d4
0x14071382f: lea    rdx,[rip+0xf71d32]        # 0x141685568  'thick'
0x140713836: cmp    r8d,r9d
0x140713839: lea    rax,[rip+0xf71d20]        # 0x141685560  'thin'
0x140713840: cmovle rdx,rax
0x140713844: jmp    0x1407139d4
0x140713849: lea    rdx,[rip+0xf71ea0]        # 0x1416856f0  'upturned'
0x140713850: cmp    r8d,r9d
0x140713853: lea    rax,[rip+0xf71e8a]        # 0x1416856e4  'hooked'
0x14071385a: cmovle rdx,rax
0x14071385e: jmp    0x1407139d4
0x140713863: lea    rdx,[rip+0xf71e6e]        # 0x1416856d8  'splayed out'
0x14071386a: cmp    r8d,r9d
0x14071386d: lea    rax,[rip+0xf71e54]        # 0x1416856c8  'flattened'
0x140713874: cmovle rdx,rax
0x140713878: jmp    0x1407139d4
0x14071387d: lea    rdx,[rip+0xf71e34]        # 0x1416856b8  'great-lobed'
0x140713884: cmp    r8d,r9d
0x140713887: lea    rax,[rip+0xf71e1a]        # 0x1416856a8  'fuse-lobed'
0x14071388e: cmovle rdx,rax
0x140713892: jmp    0x1407139d4
0x140713897: lea    rdx,[rip+0xf71e02]        # 0x1416856a0  'gapped'
0x14071389e: cmp    r8d,r9d
0x1407138a1: lea    rax,[rip+0xf71df0]        # 0x141685698  'crowded'
0x1407138a8: cmovle rdx,rax
0x1407138ac: jmp    0x1407139d4
0x1407138b1: lea    rdx,[rip+0xf71dd0]        # 0x141685688  'high-cheekboned'
0x1407138b8: cmp    r8d,r9d
0x1407138bb: lea    rax,[rip+0xf71db6]        # 0x141685678  'low-cheekboned'
0x1407138c2: cmovle rdx,rax
0x1407138c6: jmp    0x1407139d4
0x1407138cb: lea    rdx,[rip+0xf71d96]        # 0x141685668  'broad-chinned'
0x1407138d2: cmp    r8d,r9d
0x1407138d5: lea    rax,[rip+0xf71d7c]        # 0x141685658  'narrow-chinned'
0x1407138dc: cmovle rdx,rax
0x1407138e0: jmp    0x1407139d4
0x1407138e5: movsx  rax,r13w
0x1407138e9: lea    rcx,[rbp+0x150]
0x1407138f0: shl    rax,0x5
0x1407138f4: add    rcx,rax
0x1407138f7: cmp    r8d,r9d
0x1407138fa: jle    0x140713908
0x1407138fc: lea    rdx,[rip+0xf71d45]        # 0x141685648  'jutting-chinned'
0x140713903: jmp    0x1407139e6
0x140713908: lea    rdx,[rip+0xf71d29]        # 0x141685638  'recess-chinned'
0x14071390f: jmp    0x1407139e6
0x140713914: movsx  rax,r13w
0x140713918: lea    rcx,[rbp+0x150]
0x14071391f: shl    rax,0x5
0x140713923: add    rcx,rax
0x140713926: cmp    r8d,r9d
0x140713929: jle    0x140713937
0x14071392b: lea    rdx,[rip+0xf71cf6]        # 0x141685628  'square-chinned'
0x140713932: jmp    0x1407139e6
0x140713937: lea    rdx,[rip+0xf71cda]        # 0x141685618  'round-chinned'
0x14071393e: jmp    0x1407139e6
0x140713943: movsx  rax,r13w
0x140713947: lea    rcx,[rbp+0x150]
0x14071394e: shl    rax,0x5
0x140713952: add    rcx,rax
0x140713955: cmp    r8d,r9d
0x140713958: jle    0x140713966
0x14071395a: lea    rdx,[rip+0xf71ae7]        # 0x141685448  'round'
0x140713961: jmp    0x1407139e6
0x140713966: lea    rdx,[rip+0xf714cb]        # 0x141684e38  'narrow'
0x14071396d: jmp    0x1407139e6
0x14071396f: movsx  rax,r13w
0x140713973: lea    rcx,[rbp+0x150]
0x14071397a: shl    rax,0x5
0x14071397e: add    rcx,rax
0x140713981: cmp    r8d,r9d
0x140713984: jle    0x14071398f
0x140713986: lea    rdx,[rip+0xf71ab3]        # 0x141685440  'greasy'
0x14071398d: jmp    0x1407139e6
0x14071398f: lea    rdx,[rip+0xf71aa6]        # 0x14168543c  'dry'
0x140713996: jmp    0x1407139e6
0x140713998: movsx  rax,r13w
0x14071399c: lea    rcx,[rbp+0x150]
0x1407139a3: shl    rax,0x5
0x1407139a7: add    rcx,rax
0x1407139aa: cmp    r8d,r9d
0x1407139ad: jle    0x1407139b8
0x1407139af: lea    rdx,[rip+0xf71a7a]        # 0x141685430  'deep-voiced'
0x1407139b6: jmp    0x1407139e6
0x1407139b8: lea    rdx,[rip+0xf71a61]        # 0x141685420  'high-voiced'
0x1407139bf: jmp    0x1407139e6
0x1407139c1: cmp    r8d,r9d
0x1407139c4: lea    rdx,[rip+0xf71a45]        # 0x141685410  'raspy-voiced'
0x1407139cb: jg     0x1407139d4
0x1407139cd: lea    rdx,[rip+0xf71a2c]        # 0x141685400  'clear-voiced'
0x1407139d4: movsx  rax,r13w
0x1407139d8: shl    rax,0x5
0x1407139dc: lea    rcx,[rbp+0x150]
0x1407139e3: add    rcx,rax
0x1407139e6: call   0x14006f560
0x1407139eb: inc    r13w
0x1407139ef: inc    edi
0x1407139f1: add    rbx,0x4
0x1407139f5: mov    r8,QWORD PTR [r12]
0x1407139f9: mov    rax,QWORD PTR [r8+rsi*8]
0x1407139fd: mov    rcx,QWORD PTR [rax+0x40]
0x140713a01: sub    rcx,QWORD PTR [rax+0x38]
0x140713a05: sar    rcx,0x2
0x140713a09: movsxd rax,edi
0x140713a0c: cmp    rax,rcx
0x140713a0f: jb     0x1407136d0
0x140713a15: movzx  edi,BYTE PTR [rsp+0x40]
0x140713a1a: movzx  esi,BYTE PTR [rsp+0x40]
0x140713a1f: movzx  r14d,BYTE PTR [rsp+0x40]
0x140713a25: movzx  r15d,BYTE PTR [rsp+0x40]
0x140713a2b: movzx  r12d,BYTE PTR [rsp+0x40]
0x140713a31: lea    rdx,[rbp+0x30]
0x140713a35: mov    r13,QWORD PTR [rsp+0x70]
0x140713a3a: mov    rcx,r13
0x140713a3d: call   0x1400b9d10
0x140713a42: mov    r8d,0x1
0x140713a48: lea    rdx,[rip+0xed4ced]        # 0x1415e873c  ' '
0x140713a4f: mov    rcx,r13
0x140713a52: call   0x14006fa10
0x140713a57: cmp    QWORD PTR [rbp+0x180],0x0
0x140713a5f: je     0x140713a85
0x140713a61: lea    rdx,[rbp+0x170]
0x140713a68: mov    rcx,r13
0x140713a6b: call   0x1400b9d10
0x140713a70: mov    r8d,0x1
0x140713a76: lea    rdx,[rip+0xed4cbf]        # 0x1415e873c  ' '
0x140713a7d: mov    rcx,r13
0x140713a80: call   0x14006fa10
0x140713a85: cmp    QWORD PTR [rbp+0x1a0],0x0
0x140713a8d: je     0x140713ab3
0x140713a8f: lea    rdx,[rbp+0x190]
0x140713a96: mov    rcx,r13
0x140713a99: call   0x1400b9d10
0x140713a9e: mov    r8d,0x1
0x140713aa4: lea    rdx,[rip+0xed4c91]        # 0x1415e873c  ' '
0x140713aab: mov    rcx,r13
0x140713aae: call   0x14006fa10
0x140713ab3: mov    r8d,0x8
0x140713ab9: lea    rdx,[rip+0xf71930]        # 0x1416853f0  'body is '
0x140713ac0: mov    rcx,r13
0x140713ac3: call   0x14006fa10
0x140713ac8: lea    rdx,[rbp+0x150]
0x140713acf: mov    rcx,r13
0x140713ad2: call   0x1400b9d10
0x140713ad7: mov    r8d,0x3
0x140713add: lea    rdx,[rip+0xee9e84]        # 0x1415fd968  '.  '
0x140713ae4: mov    rcx,r13
0x140713ae7: call   0x14006fa10
0x140713aec: nop
0x140713aed: lea    r9,[rip+0xffffffffff95433c]        # 0x140067e30
0x140713af4: mov    edx,0x20
0x140713af9: mov    r8d,0x3
0x140713aff: lea    rcx,[rbp+0x150]
0x140713b06: call   0x1415396cc
0x140713b0b: jmp    0x140712d4d
0x140713b10: movzx  edx,r12b
0x140713b14: lea    rcx,[rbp+0x10]
0x140713b18: call   0x140068190
0x140713b1d: lea    rcx,[rbp+0x10]
0x140713b21: call   0x14006fb80
0x140713b26: nop
0x140713b27: movzx  edx,r15b
0x140713b2b: lea    rcx,[rbp+0x90]
0x140713b32: call   0x140068190
0x140713b37: lea    rcx,[rbp+0x90]
0x140713b3e: call   0x14006fb80
0x140713b43: nop
0x140713b44: mov    rax,QWORD PTR [rbp-0x70]
0x140713b48: mov    rax,QWORD PTR [rax]
0x140713b4b: mov    rcx,QWORD PTR [rbp-0x80]
0x140713b4f: mov    rcx,QWORD PTR [rax+rcx*8]
0x140713b53: mov    rax,QWORD PTR [rcx+0xb8]
0x140713b5a: sub    rax,QWORD PTR [rcx+0xb0]
0x140713b61: sar    rax,0x2
0x140713b65: test   rax,rax
0x140713b68: je     0x140713b79
0x140713b6a: lea    rdx,[rip+0xeee82f]        # 0x1416023a0  '[C:5:0:1]'
0x140713b71: mov    rcx,r13
0x140713b74: call   0x14006f560
0x140713b79: xor    r8d,r8d
0x140713b7c: mov    rax,QWORD PTR [rbp-0x70]
0x140713b80: mov    rdx,QWORD PTR [rax]
0x140713b83: mov    rax,QWORD PTR [rbp-0x80]
0x140713b87: mov    rcx,QWORD PTR [rdx+rax*8]
0x140713b8b: mov    rax,QWORD PTR [rcx+0xb8]
0x140713b92: sub    rax,QWORD PTR [rcx+0xb0]
0x140713b99: sar    rax,0x2
0x140713b9d: test   rax,rax
0x140713ba0: je     0x140713ce8
0x140713ba6: mov    r12d,r8d
0x140713ba9: mov    r15d,r8d
0x140713bac: mov    rsi,QWORD PTR [rsp+0x70]
0x140713bb1: mov    r14,QWORD PTR [rsp+0x50]
0x140713bb6: mov    rdi,QWORD PTR [rbp-0x70]
0x140713bba: mov    rbx,QWORD PTR [rbp-0x80]
0x140713bbe: xchg   ax,ax
0x140713bc0: mov    rcx,QWORD PTR [rdx+rbx*8]
0x140713bc4: mov    rax,QWORD PTR [rcx+0xb0]
0x140713bcb: movsx  r13,WORD PTR [r12+rax*1]
0x140713bd0: mov    rax,QWORD PTR [rcx+0xc8]
0x140713bd7: movzx  eax,WORD PTR [r12+rax*1]
0x140713bdc: mov    WORD PTR [rsp+0x44],ax
0x140713be1: lea    rdx,[rbp+0x30]
0x140713be5: mov    rcx,rsi
0x140713be8: call   0x1400b9d10
0x140713bed: mov    r8d,0x1
0x140713bf3: lea    rdx,[rip+0xed4b42]        # 0x1415e873c  ' '
0x140713bfa: mov    rcx,rsi
0x140713bfd: call   0x14006fa10
0x140713c02: mov    WORD PTR [rsp+0x20],0x2
0x140713c09: xor    r9d,r9d
0x140713c0c: movzx  r8d,r13w
0x140713c10: lea    rdx,[rbp+0x10]
0x140713c14: mov    rcx,r14
0x140713c17: call   0x14070c0e0
0x140713c1c: cmp    WORD PTR [rsp+0x44],0xffff
0x140713c22: je     0x140713c7a
0x140713c24: mov    r8,QWORD PTR [r14]
0x140713c27: mov    rax,QWORD PTR [r14+0x48]
0x140713c2b: mov    rcx,QWORD PTR [rax]
0x140713c2e: mov    rax,QWORD PTR [rcx+r13*8]
0x140713c32: movsx  rcx,WORD PTR [rsp+0x44]
0x140713c38: mov    rax,QWORD PTR [rax+0x58]
0x140713c3c: mov    rcx,QWORD PTR [rax+rcx*8]
0x140713c40: movsxd rdx,DWORD PTR [rcx+0x20]
0x140713c44: mov    rax,QWORD PTR [r8+0x208]
0x140713c4b: mov    r8,QWORD PTR [rax+rdx*8]
0x140713c4f: add    r8,0x30
0x140713c53: lea    rdx,[rip+0xed9eca]        # 0x1415edb24  "'s "
0x140713c5a: lea    rcx,[rbp-0x50]
0x140713c5e: call   0x14014af80
0x140713c63: nop
0x140713c64: mov    rdx,rax
0x140713c67: lea    rcx,[rbp+0x10]
0x140713c6b: call   0x1400b9d10
0x140713c70: nop
0x140713c71: lea    rcx,[rbp-0x50]
0x140713c75: call   0x14006f850
0x140713c7a: lea    rdx,[rbp+0x10]
0x140713c7e: mov    rcx,rsi
0x140713c81: call   0x1400b9d10
0x140713c86: mov    r8d,0xb
0x140713c8c: lea    rdx,[rip+0xf7174d]        # 0x1416853e0  ' is gone.  '
0x140713c93: mov    rcx,rsi
0x140713c96: call   0x14006fa10
0x140713c9b: inc    r15d
0x140713c9e: add    r12,0x4
0x140713ca2: mov    rdx,QWORD PTR [rdi]
0x140713ca5: mov    rax,QWORD PTR [rdx+rbx*8]
0x140713ca9: mov    rcx,QWORD PTR [rax+0xb8]
0x140713cb0: sub    rcx,QWORD PTR [rax+0xb0]
0x140713cb7: sar    rcx,0x2
0x140713cbb: movsxd rax,r15d
0x140713cbe: cmp    rax,rcx
0x140713cc1: jb     0x140713bc0
0x140713cc7: movzx  edi,BYTE PTR [rsp+0x40]
0x140713ccc: movzx  esi,BYTE PTR [rsp+0x40]
0x140713cd1: movzx  r14d,BYTE PTR [rsp+0x40]
0x140713cd7: movzx  r15d,BYTE PTR [rsp+0x40]
0x140713cdd: movzx  r12d,BYTE PTR [rsp+0x40]
0x140713ce3: mov    r13,QWORD PTR [rsp+0x70]
0x140713ce8: mov    rax,QWORD PTR [rbp-0x80]
0x140713cec: mov    rax,QWORD PTR [rdx+rax*8]
0x140713cf0: mov    rcx,QWORD PTR [rax+0xb8]
0x140713cf7: sub    rcx,QWORD PTR [rax+0xb0]
0x140713cfe: sar    rcx,0x2
0x140713d02: test   rcx,rcx
0x140713d05: je     0x140713d1c
0x140713d07: mov    r8d,0x9
0x140713d0d: lea    rdx,[rip+0xeee71c]        # 0x141602430  '[C:7:0:1]'
0x140713d14: mov    rcx,r13
0x140713d17: call   0x14006fa10
0x140713d1c: mov    r8,QWORD PTR [rbp-0x70]
0x140713d20: mov    rax,QWORD PTR [r8]
0x140713d23: mov    rcx,QWORD PTR [rbp-0x80]
0x140713d27: mov    rcx,QWORD PTR [rax+rcx*8]
0x140713d2b: mov    r9,QWORD PTR [rcx+0x8]
0x140713d2f: mov    QWORD PTR [rbp-0x58],r9
0x140713d33: mov    rdx,QWORD PTR [rcx+0x10]
0x140713d37: sub    rdx,r9
0x140713d3a: sar    rdx,0x2
0x140713d3e: mov    QWORD PTR [rbp-0x68],rdx
0x140713d42: test   rdx,rdx
0x140713d45: jne    0x140713d5b
0x140713d47: mov    rax,QWORD PTR [rcx+0x70]
0x140713d4b: sub    rax,QWORD PTR [rcx+0x68]
0x140713d4f: test   rax,0xfffffffffffffffc
0x140713d55: je     0x1407161ff
0x140713d5b: movsx  ecx,WORD PTR [rcx]
0x140713d5e: sub    ecx,0x2
0x140713d61: je     0x1407148df
0x140713d67: sub    ecx,0x1
0x140713d6a: je     0x1407144b1
0x140713d70: cmp    ecx,0x1
0x140713d73: jne    0x1407161ff
0x140713d79: xor    r10d,r10d
0x140713d7c: mov    r13d,r10d
0x140713d7f: mov    DWORD PTR [rsp+0x58],r10d
0x140713d84: mov    DWORD PTR [rsp+0x60],r10d
0x140713d89: mov    DWORD PTR [rsp+0x40],r10d
0x140713d8e: mov    DWORD PTR [rsp+0x68],r10d
0x140713d93: mov    rcx,0xffffffffffffffff
0x140713d9a: mov    WORD PTR [rsp+0x44],cx
0x140713d9f: mov    DWORD PTR [rbp-0x78],ecx
0x140713da2: mov    ecx,r10d
0x140713da5: mov    DWORD PTR [rsp+0x48],ecx
0x140713da9: test   rdx,rdx
0x140713dac: je     0x140713f57
0x140713db2: mov    rdx,QWORD PTR [rsp+0x50]
0x140713db7: mov    r14,QWORD PTR [rdx+0x8]
0x140713dbb: mov    rbx,QWORD PTR [r14+0x1620]
0x140713dc2: mov    rax,QWORD PTR [rdx+0x30]
0x140713dc6: mov    r8,QWORD PTR [rdx+0x38]
0x140713dca: sub    r8,rax
0x140713dcd: sar    r8,0x2
0x140713dd1: mov    QWORD PTR [rsp+0x58],r8
0x140713dd6: mov    rsi,rax
0x140713dd9: movzx  r15d,WORD PTR [rsp+0x44]
0x140713ddf: mov    r12,QWORD PTR [rbp-0x68]
0x140713de3: mov    edi,0x1
0x140713de8: nop    DWORD PTR [rax+rax*1+0x0]
0x140713df0: movsxd r11,DWORD PTR [r9]
0x140713df3: mov    rdx,QWORD PTR [rbx+r11*8]
0x140713df7: test   ecx,ecx
0x140713df9: jne    0x140713e18
0x140713dfb: mov    rax,QWORD PTR [rdx+0x80]
0x140713e02: movzx  r15d,WORD PTR [rax]
0x140713e06: mov    rax,QWORD PTR [rdx+0x98]
0x140713e0d: movsx  r10d,WORD PTR [rax]
0x140713e11: mov    DWORD PTR [rbp-0x78],r10d
0x140713e15: xor    r10d,r10d
0x140713e18: mov    r9d,r10d
0x140713e1b: mov    rcx,r10
0x140713e1e: test   r8,r8
0x140713e21: je     0x140713e90
0x140713e23: mov    r10,QWORD PTR [r14+0x1638]
0x140713e2a: nop    WORD PTR [rax+rax*1+0x0]
0x140713e30: lea    r8,[rcx*4+0x0]
0x140713e38: cmp    DWORD PTR [r10+r8*1],r11d
0x140713e3c: je     0x140713e53
0x140713e3e: inc    r9d
0x140713e41: inc    rcx
0x140713e44: movsxd rax,r9d
0x140713e47: mov    r8,QWORD PTR [rsp+0x58]
0x140713e4c: cmp    rax,r8
0x140713e4f: jb     0x140713e30
0x140713e51: jmp    0x140713e8d
0x140713e53: movsx  ecx,WORD PTR [rdx]
0x140713e56: sub    ecx,0x10
0x140713e59: je     0x1407140f0
0x140713e5f: sub    ecx,edi
0x140713e61: je     0x140714078
0x140713e67: sub    ecx,edi
0x140713e69: je     0x140714000
0x140713e6f: cmp    ecx,edi
0x140713e71: jne    0x140713e88
0x140713e73: mov    eax,DWORD PTR [rsi+r8*1]
0x140713e77: cmp    eax,DWORD PTR [rdx+0x20]
0x140713e7a: jg     0x140713fa6
0x140713e80: mov    DWORD PTR [rsp+0x68],0xfffffffd
0x140713e88: mov    r8,QWORD PTR [rsp+0x58]
0x140713e8d: xor    r10d,r10d
0x140713e90: mov    ecx,DWORD PTR [rsp+0x48]
0x140713e94: inc    ecx
0x140713e96: mov    DWORD PTR [rsp+0x48],ecx
0x140713e9a: mov    r9,QWORD PTR [rbp-0x58]
0x140713e9e: add    r9,0x4
0x140713ea2: mov    QWORD PTR [rbp-0x58],r9
0x140713ea6: movsxd rax,ecx
0x140713ea9: cmp    rax,r12
0x140713eac: jb     0x140713df0
0x140713eb2: mov    WORD PTR [rsp+0x44],r15w
0x140713eb8: mov    DWORD PTR [rsp+0x58],r13d
0x140713ebd: cmp    r15w,0xffff
0x140713ec2: movzx  edi,BYTE PTR [rsp+0x40]
0x140713ec7: movzx  esi,BYTE PTR [rsp+0x40]
0x140713ecc: movzx  r14d,BYTE PTR [rsp+0x40]
0x140713ed2: movzx  r15d,BYTE PTR [rsp+0x40]
0x140713ed8: movzx  r12d,BYTE PTR [rsp+0x40]
0x140713ede: je     0x140713f57
0x140713ee0: movsx  rcx,WORD PTR [rsp+0x44]
0x140713ee6: mov    QWORD PTR [rsp+0x78],rcx
0x140713eeb: mov    r8,QWORD PTR [rsp+0x50]
0x140713ef0: mov    rax,QWORD PTR [r8+0x160]
0x140713ef7: cmp    BYTE PTR [rcx+rax*1],0x0
0x140713efb: jne    0x1407161ff
0x140713f01: cmp    DWORD PTR [rbp-0x78],0xffffffff
0x140713f05: je     0x140713f49
0x140713f07: lea    r13,[r8+0x68]
0x140713f0b: mov    rdx,rcx
0x140713f0e: mov    rcx,QWORD PTR [r8+0x48]
0x140713f12: call   0x14006f220
0x140713f17: mov    rcx,QWORD PTR [rax]
0x140713f1a: add    rcx,0x58
0x140713f1e: movsxd rdx,DWORD PTR [rbp-0x78]
0x140713f22: call   0x14006f220
0x140713f27: mov    rdx,QWORD PTR [rax]
0x140713f2a: movsxd rdx,DWORD PTR [rdx+0x68]
0x140713f2e: mov    rcx,r13
0x140713f31: call   0x14006f360
0x140713f36: test   BYTE PTR [rax],0x1
0x140713f39: jne    0x1407161ff
0x140713f3f: mov    rcx,QWORD PTR [rsp+0x78]
0x140713f44: mov    r8,QWORD PTR [rsp+0x50]
0x140713f49: mov    rax,QWORD PTR [r8+0x50]
0x140713f4d: test   BYTE PTR [rax+rcx*4],0x2
0x140713f51: jne    0x1407161ff
0x140713f57: movzx  edx,r14b
0x140713f5b: lea    rcx,[rbp+0x70]
0x140713f5f: call   0x140068190
0x140713f64: lea    rcx,[rbp+0x70]
0x140713f68: call   0x14006fb80
0x140713f6d: nop
0x140713f6e: movzx  edx,sil
0x140713f72: lea    rcx,[rbp-0x30]
0x140713f76: call   0x140068190
0x140713f7b: lea    rcx,[rbp-0x30]
0x140713f7f: call   0x14006fb80
0x140713f84: nop
0x140713f85: mov    eax,DWORD PTR [rsp+0x58]
0x140713f89: test   eax,eax
0x140713f8b: je     0x140714188
0x140713f91: cmp    eax,0x3
0x140713f94: jne    0x140714156
0x140713f9a: lea    rdx,[rip+0xf72157]        # 0x1416860f8  'has very high cheekbones'
0x140713fa1: jmp    0x14071417e
0x140713fa6: cmp    eax,DWORD PTR [rdx+0x24]
0x140713fa9: jg     0x140713fb8
0x140713fab: mov    DWORD PTR [rsp+0x68],0xfffffffe
0x140713fb3: jmp    0x140713e88
0x140713fb8: cmp    eax,DWORD PTR [rdx+0x28]
0x140713fbb: jg     0x140713fca
0x140713fbd: mov    DWORD PTR [rsp+0x68],0xffffffff
0x140713fc5: jmp    0x140713e88
0x140713fca: cmp    eax,DWORD PTR [rdx+0x34]
0x140713fcd: jl     0x140713fdc
0x140713fcf: mov    DWORD PTR [rsp+0x68],0x3
0x140713fd7: jmp    0x140713e88
0x140713fdc: cmp    eax,DWORD PTR [rdx+0x30]
0x140713fdf: jl     0x140713fee
0x140713fe1: mov    DWORD PTR [rsp+0x68],0x2
0x140713fe9: jmp    0x140713e88
0x140713fee: cmp    eax,DWORD PTR [rdx+0x2c]
0x140713ff1: jl     0x140713e88
0x140713ff7: mov    DWORD PTR [rsp+0x68],edi
0x140713ffb: jmp    0x140713e88
0x140714000: mov    eax,DWORD PTR [rsi+r8*1]
0x140714004: cmp    eax,DWORD PTR [rdx+0x20]
0x140714007: jg     0x140714016
0x140714009: mov    DWORD PTR [rsp+0x40],0xfffffffd
0x140714011: jmp    0x140713e88
0x140714016: cmp    eax,DWORD PTR [rdx+0x24]
0x140714019: jg     0x140714028
0x14071401b: mov    DWORD PTR [rsp+0x40],0xfffffffe
0x140714023: jmp    0x140713e88
0x140714028: cmp    eax,DWORD PTR [rdx+0x28]
0x14071402b: jg     0x14071403a
0x14071402d: mov    DWORD PTR [rsp+0x40],0xffffffff
0x140714035: jmp    0x140713e88
0x14071403a: cmp    eax,DWORD PTR [rdx+0x34]
0x14071403d: jl     0x14071404c
0x14071403f: mov    DWORD PTR [rsp+0x40],0x3
0x140714047: jmp    0x140713e88
0x14071404c: cmp    eax,DWORD PTR [rdx+0x30]
0x14071404f: jl     0x14071405e
0x140714051: mov    DWORD PTR [rsp+0x40],0x2
0x140714059: jmp    0x140713e88
0x14071405e: mov    r8,QWORD PTR [rsp+0x58]
0x140714063: xor    r10d,r10d
0x140714066: cmp    eax,DWORD PTR [rdx+0x2c]
0x140714069: jl     0x140713e90
0x14071406f: mov    DWORD PTR [rsp+0x40],edi
0x140714073: jmp    0x140713e90
0x140714078: mov    eax,DWORD PTR [rsi+r8*1]
0x14071407c: cmp    eax,DWORD PTR [rdx+0x20]
0x14071407f: jg     0x14071408e
0x140714081: mov    DWORD PTR [rsp+0x60],0xfffffffd
0x140714089: jmp    0x140713e88
0x14071408e: cmp    eax,DWORD PTR [rdx+0x24]
0x140714091: jg     0x1407140a0
0x140714093: mov    DWORD PTR [rsp+0x60],0xfffffffe
0x14071409b: jmp    0x140713e88
0x1407140a0: cmp    eax,DWORD PTR [rdx+0x28]
0x1407140a3: jg     0x1407140b2
0x1407140a5: mov    DWORD PTR [rsp+0x60],0xffffffff
0x1407140ad: jmp    0x140713e88
0x1407140b2: cmp    eax,DWORD PTR [rdx+0x34]
0x1407140b5: jl     0x1407140c4
0x1407140b7: mov    DWORD PTR [rsp+0x60],0x3
0x1407140bf: jmp    0x140713e88
0x1407140c4: cmp    eax,DWORD PTR [rdx+0x30]
0x1407140c7: jl     0x1407140d6
0x1407140c9: mov    DWORD PTR [rsp+0x60],0x2
0x1407140d1: jmp    0x140713e88
0x1407140d6: mov    r8,QWORD PTR [rsp+0x58]
0x1407140db: xor    r10d,r10d
0x1407140de: cmp    eax,DWORD PTR [rdx+0x2c]
0x1407140e1: jl     0x140713e90
0x1407140e7: mov    DWORD PTR [rsp+0x60],edi
0x1407140eb: jmp    0x140713e90
0x1407140f0: mov    eax,DWORD PTR [rsi+r8*1]
0x1407140f4: cmp    eax,DWORD PTR [rdx+0x20]
0x1407140f7: jg     0x140714104
0x1407140f9: mov    r13d,0xfffffffd
0x1407140ff: jmp    0x140713e88
0x140714104: cmp    eax,DWORD PTR [rdx+0x24]
0x140714107: jg     0x140714114
0x140714109: mov    r13d,0xfffffffe
0x14071410f: jmp    0x140713e88
0x140714114: cmp    eax,DWORD PTR [rdx+0x28]
0x140714117: jg     0x140714125
0x140714119: mov    r13,0xffffffffffffffff
0x140714120: jmp    0x140713e88
0x140714125: cmp    eax,DWORD PTR [rdx+0x34]
0x140714128: jl     0x140714135
0x14071412a: mov    r13d,0x3
0x140714130: jmp    0x140713e88
0x140714135: mov    r8,QWORD PTR [rsp+0x58]
0x14071413a: cmp    eax,DWORD PTR [rdx+0x30]
0x14071413d: jl     0x14071414a
0x14071413f: mov    r13d,0x2
0x140714145: jmp    0x140713e8d
0x14071414a: cmp    eax,DWORD PTR [rdx+0x2c]
0x14071414d: cmovge r13d,edi
0x140714151: jmp    0x140713e8d
0x140714156: cmp    eax,0x2
0x140714159: jne    0x140714164
0x14071415b: lea    rdx,[rip+0xf71f7e]        # 0x1416860e0  'has high cheekbones'
0x140714162: jmp    0x14071417e
0x140714164: cmp    eax,0xfffffffd
0x140714167: jne    0x140714172
0x140714169: lea    rdx,[rip+0xf71f58]        # 0x1416860c8  'has low cheekbones'
0x140714170: jmp    0x14071417e
0x140714172: cmp    eax,0xfffffffe
0x140714175: jne    0x140714188
0x140714177: lea    rdx,[rip+0xf71f32]        # 0x1416860b0  'has very low cheekbones'
0x14071417e: lea    rcx,[rbp+0x70]
0x140714182: call   0x14006f580
0x140714187: nop
0x140714188: movzx  edx,dil
0x14071418c: lea    rcx,[rbp-0x50]
0x140714190: call   0x140068190
0x140714195: lea    rcx,[rbp-0x50]
0x140714199: call   0x14006fb80
0x14071419e: nop
0x14071419f: mov    r13d,DWORD PTR [rsp+0x68]
0x1407141a4: lea    rcx,[rbp-0x50]
0x1407141a8: cmp    r13d,0x2
0x1407141ac: jl     0x1407141c2
0x1407141ae: mov    r8d,0xb
0x1407141b4: lea    rdx,[rip+0xf71ee5]        # 0x1416860a0  'square chin'
0x1407141bb: call   0x14006f8d0
0x1407141c0: jmp    0x1407141e8
0x1407141c2: cmp    r13d,0xfffffffe
0x1407141c6: jg     0x1407141dc
0x1407141c8: mov    r8d,0xa
0x1407141ce: lea    rdx,[rip+0xf71ebb]        # 0x141686090  'round chin'
0x1407141d5: call   0x14006f8d0
0x1407141da: jmp    0x1407141e8
0x1407141dc: lea    rdx,[rip+0xf71ea5]        # 0x141686088  'chin'
0x1407141e3: call   0x14006f580
0x1407141e8: mov    eax,DWORD PTR [rsp+0x60]
0x1407141ec: test   eax,eax
0x1407141ee: jne    0x140714211
0x1407141f0: mov    eax,DWORD PTR [rsp+0x40]
0x1407141f4: test   eax,eax
0x1407141f6: je     0x14071434a
0x1407141fc: cmp    eax,0x3
0x1407141ff: jne    0x1407142ef
0x140714205: lea    rdx,[rip+0xf71a8c]        # 0x141685c98  'has a jutting'
0x14071420c: jmp    0x140714317
0x140714211: cmp    eax,0x3
0x140714214: jne    0x14071424c
0x140714216: mov    eax,DWORD PTR [rsp+0x40]
0x14071421a: cmp    eax,0x3
0x14071421d: jne    0x14071422b
0x14071421f: lea    rdx,[rip+0xf71e52]        # 0x141686078  'has a massive'
0x140714226: jmp    0x140714317
0x14071422b: lea    rcx,[rbp-0x30]
0x14071422f: cmp    eax,0xfffffffd
0x140714232: jne    0x140714240
0x140714234: lea    rdx,[rip+0xf71e1d]        # 0x141686058  'has a deeply recessed, broad'
0x14071423b: jmp    0x14071431b
0x140714240: lea    rdx,[rip+0xf71a99]        # 0x141685ce0  'has a very broad'
0x140714247: jmp    0x14071431b
0x14071424c: cmp    eax,0xfffffffd
0x14071424f: jne    0x140714287
0x140714251: mov    eax,DWORD PTR [rsp+0x40]
0x140714255: cmp    eax,0x3
0x140714258: jne    0x140714266
0x14071425a: lea    rdx,[rip+0xf71ddf]        # 0x141686040  'has a narrow, jutting'
0x140714261: jmp    0x140714317
0x140714266: lea    rcx,[rbp-0x30]
0x14071426a: cmp    eax,0xfffffffd
0x14071426d: jne    0x14071427b
0x14071426f: lea    rdx,[rip+0xf71daa]        # 0x141686020  'has a deeply recessed, narrow'
0x140714276: jmp    0x14071431b
0x14071427b: lea    rdx,[rip+0xf71a36]        # 0x141685cb8  'has a very narrow'
0x140714282: jmp    0x14071431b
0x140714287: cmp    eax,0x2
0x14071428a: jne    0x1407142b9
0x14071428c: mov    eax,DWORD PTR [rsp+0x40]
0x140714290: cmp    eax,0x2
0x140714293: jne    0x14071429e
0x140714295: lea    rdx,[rip+0xf71d6c]        # 0x141686008  'has a broad, prominent'
0x14071429c: jmp    0x140714317
0x14071429e: lea    rcx,[rbp-0x30]
0x1407142a2: cmp    eax,0xfffffffe
0x1407142a5: jne    0x1407142b0
0x1407142a7: lea    rdx,[rip+0xf71d42]        # 0x141685ff0  'has a broad, recessed'
0x1407142ae: jmp    0x14071431b
0x1407142b0: lea    rdx,[rip+0xf71a19]        # 0x141685cd0  'has a broad'
0x1407142b7: jmp    0x14071431b
0x1407142b9: cmp    eax,0xfffffffe
0x1407142bc: mov    eax,DWORD PTR [rsp+0x40]
0x1407142c0: jne    0x1407141fc
0x1407142c6: cmp    eax,0x2
0x1407142c9: jne    0x1407142d4
0x1407142cb: lea    rdx,[rip+0xf71d06]        # 0x141685fd8  'has a narrow, prominent'
0x1407142d2: jmp    0x140714317
0x1407142d4: lea    rcx,[rbp-0x30]
0x1407142d8: cmp    eax,0xfffffffe
0x1407142db: jne    0x1407142e6
0x1407142dd: lea    rdx,[rip+0xf71a14]        # 0x141685cf8  'has a narrow, recessed'
0x1407142e4: jmp    0x14071431b
0x1407142e6: lea    rdx,[rip+0xf719bb]        # 0x141685ca8  'has a narrow'
0x1407142ed: jmp    0x14071431b
0x1407142ef: cmp    eax,0x2
0x1407142f2: jne    0x1407142fd
0x1407142f4: lea    rdx,[rip+0xf7198d]        # 0x141685c88  'has a prominent'
0x1407142fb: jmp    0x140714317
0x1407142fd: cmp    eax,0xfffffffd
0x140714300: jne    0x14071430b
0x140714302: lea    rdx,[rip+0xf7196f]        # 0x141685c78  'has a recessed'
0x140714309: jmp    0x140714317
0x14071430b: cmp    eax,0xfffffffe
0x14071430e: jne    0x140714320
0x140714310: lea    rdx,[rip+0xf71949]        # 0x141685c60  'has a deeply recessed'
0x140714317: lea    rcx,[rbp-0x30]
0x14071431b: call   0x14006f580
0x140714320: cmp    QWORD PTR [rbp-0x20],0x0
0x140714325: je     0x140714351
0x140714327: mov    r8d,0x1
0x14071432d: lea    rdx,[rip+0xed4408]        # 0x1415e873c  ' '
0x140714334: lea    rcx,[rbp-0x30]
0x140714338: call   0x14006fa10
0x14071433d: lea    rdx,[rbp-0x50]
0x140714341: lea    rcx,[rbp-0x30]
0x140714345: call   0x1400b9d10
0x14071434a: cmp    QWORD PTR [rbp-0x20],0x0
0x14071434f: jne    0x140714399
0x140714351: test   r13d,r13d
0x140714354: je     0x140714399
0x140714356: cmp    r13d,0x3
0x14071435a: jl     0x140714365
0x14071435c: lea    rdx,[rip+0xf718e5]        # 0x141685c48  'has a square chin'
0x140714363: jmp    0x140714390
0x140714365: cmp    r13d,0x2
0x140714369: jl     0x140714374
0x14071436b: lea    rdx,[rip+0xf718be]        # 0x141685c30  'has an angular chin'
0x140714372: jmp    0x140714390
0x140714374: cmp    r13d,0xfffffffd
0x140714378: jg     0x140714383
0x14071437a: lea    rdx,[rip+0xf71897]        # 0x141685c18  'has a very round chin'
0x140714381: jmp    0x140714390
0x140714383: cmp    r13d,0xfffffffe
0x140714387: jg     0x140714399
0x140714389: lea    rdx,[rip+0xf71870]        # 0x141685c00  'has a round chin'
0x140714390: lea    rcx,[rbp-0x30]
0x140714394: call   0x14006f580
0x140714399: cmp    QWORD PTR [rbp+0x80],0x0
0x1407143a1: je     0x14071444c
0x1407143a7: lea    rdx,[rbp+0x50]
0x1407143ab: mov    r13,QWORD PTR [rsp+0x70]
0x1407143b0: mov    rcx,r13
0x1407143b3: cmp    QWORD PTR [rbp-0x20],0x0
0x1407143b8: je     0x14071440f
0x1407143ba: call   0x1400b9d10
0x1407143bf: lea    rdx,[rip+0xed4376]        # 0x1415e873c  ' '
0x1407143c6: mov    rcx,r13
0x1407143c9: call   0x14006f560
0x1407143ce: lea    rdx,[rbp+0x70]
0x1407143d2: mov    rcx,r13
0x1407143d5: call   0x1400b9d10
0x1407143da: lea    rdx,[rip+0xf1415b]        # 0x14162853c  ', and '
0x1407143e1: mov    rcx,r13
0x1407143e4: call   0x14006f560
0x1407143e9: lea    rdx,[rbp+0xb0]
0x1407143f0: mov    rcx,r13
0x1407143f3: call   0x1400b9d10
0x1407143f8: mov    r8d,0x1
0x1407143fe: lea    rdx,[rip+0xed4337]        # 0x1415e873c  ' '
0x140714405: mov    rcx,r13
0x140714408: call   0x14006fa10
0x14071440d: jmp    0x140714473
0x14071440f: call   0x1400b9d10
0x140714414: mov    r8d,0x1
0x14071441a: lea    rdx,[rip+0xed431b]        # 0x1415e873c  ' '
0x140714421: mov    rcx,r13
0x140714424: call   0x14006fa10
0x140714429: lea    rdx,[rbp+0x70]
0x14071442d: mov    rcx,r13
0x140714430: call   0x1400b9d10
0x140714435: mov    r8d,0x3
0x14071443b: lea    rdx,[rip+0xee9526]        # 0x1415fd968  '.  '
0x140714442: mov    rcx,r13
0x140714445: call   0x14006fa10
0x14071444a: jmp    0x14071448f
0x14071444c: cmp    QWORD PTR [rbp-0x20],0x0
0x140714451: je     0x14071448f
0x140714453: lea    rdx,[rbp+0x50]
0x140714457: mov    r13,QWORD PTR [rsp+0x70]
0x14071445c: mov    rcx,r13
0x14071445f: call   0x1400b9d10
0x140714464: lea    rdx,[rip+0xed42d1]        # 0x1415e873c  ' '
0x14071446b: mov    rcx,r13
0x14071446e: call   0x14006f560
0x140714473: lea    rdx,[rbp-0x30]
0x140714477: mov    rcx,r13
0x14071447a: call   0x1400b9d10
0x14071447f: lea    rdx,[rip+0xee94e2]        # 0x1415fd968  '.  '
0x140714486: mov    rcx,r13
0x140714489: call   0x14006f560
0x14071448e: nop
0x14071448f: lea    rcx,[rbp-0x50]
0x140714493: call   0x14006f850
0x140714498: nop
0x140714499: lea    rcx,[rbp-0x30]
0x14071449d: call   0x14006f850
0x1407144a2: nop
0x1407144a3: lea    rcx,[rbp+0x70]
0x1407144a7: call   0x14006f850
0x1407144ac: jmp    0x1407161ff
0x1407144b1: xor    r10d,r10d
0x1407144b4: mov    DWORD PTR [rsp+0x58],r10d
0x1407144b9: mov    r13d,r10d
0x1407144bc: mov    rcx,0xffffffffffffffff
0x1407144c3: mov    WORD PTR [rsp+0x44],cx
0x1407144c8: mov    DWORD PTR [rbp-0x78],ecx
0x1407144cb: mov    ecx,r10d
0x1407144ce: mov    DWORD PTR [rsp+0x48],ecx
0x1407144d2: test   rdx,rdx
0x1407144d5: je     0x1407161ff
0x1407144db: mov    rdx,QWORD PTR [rsp+0x50]
0x1407144e0: mov    r12,QWORD PTR [rdx+0x8]
0x1407144e4: mov    r14,QWORD PTR [r12+0x1620]
0x1407144ec: mov    rax,QWORD PTR [rdx+0x30]
0x1407144f0: mov    rdx,QWORD PTR [rdx+0x38]
0x1407144f4: sub    rdx,rax
0x1407144f7: sar    rdx,0x2
0x1407144fb: mov    QWORD PTR [rsp+0x60],rdx
0x140714500: mov    r15,rax
0x140714503: movzx  esi,WORD PTR [rsp+0x44]
0x140714508: mov    edi,0x1
0x14071450d: mov    ebx,0x3
0x140714512: movsxd r11,DWORD PTR [r9]
0x140714515: mov    r9,QWORD PTR [r14+r11*8]
0x140714519: test   ecx,ecx
0x14071451b: jne    0x140714539
0x14071451d: mov    rax,QWORD PTR [r9+0x80]
0x140714524: movzx  esi,WORD PTR [rax]
0x140714527: mov    rax,QWORD PTR [r9+0x98]
0x14071452e: movsx  r10d,WORD PTR [rax]
0x140714532: mov    DWORD PTR [rbp-0x78],r10d
0x140714536: xor    r10d,r10d
0x140714539: mov    r8d,r10d
0x14071453c: mov    rcx,r10
0x14071453f: test   rdx,rdx
0x140714542: je     0x1407145a2
0x140714544: mov    r10,QWORD PTR [r12+0x1638]
0x14071454c: nop    DWORD PTR [rax+0x0]
0x140714550: lea    rdx,[rcx*4+0x0]
0x140714558: cmp    DWORD PTR [r10+rdx*1],r11d
0x14071455c: je     0x140714573
0x14071455e: inc    r8d
0x140714561: inc    rcx
0x140714564: movsxd rax,r8d
0x140714567: mov    rdx,QWORD PTR [rsp+0x60]
0x14071456c: cmp    rax,rdx
0x14071456f: jb     0x140714550
0x140714571: jmp    0x14071459f
0x140714573: movsx  ecx,WORD PTR [r9]
0x140714577: sub    ecx,0x16
0x14071457a: je     0x140714715
0x140714580: cmp    ecx,edi
0x140714582: jne    0x14071459a
0x140714584: mov    eax,DWORD PTR [r15+rdx*1]
0x140714588: cmp    eax,DWORD PTR [r9+0x20]
0x14071458c: jg     0x1407146ba
0x140714592: mov    DWORD PTR [rsp+0x58],0xfffffffd
0x14071459a: mov    rdx,QWORD PTR [rsp+0x60]
0x14071459f: xor    r10d,r10d
0x1407145a2: mov    ecx,DWORD PTR [rsp+0x48]
0x1407145a6: inc    ecx
0x1407145a8: mov    DWORD PTR [rsp+0x48],ecx
0x1407145ac: mov    r9,QWORD PTR [rbp-0x58]
0x1407145b0: add    r9,0x4
0x1407145b4: mov    QWORD PTR [rbp-0x58],r9
0x1407145b8: movsxd rax,ecx
0x1407145bb: cmp    rax,QWORD PTR [rbp-0x68]
0x1407145bf: jb     0x140714512
0x1407145c5: mov    WORD PTR [rsp+0x44],si
0x1407145ca: mov    DWORD PTR [rsp+0x40],r13d
0x1407145cf: cmp    si,0xffff
0x1407145d3: movzx  ebx,BYTE PTR [rsp+0x40]
0x1407145d8: movzx  edi,BYTE PTR [rsp+0x40]
0x1407145dd: movzx  esi,BYTE PTR [rsp+0x40]
0x1407145e2: movzx  r14d,BYTE PTR [rsp+0x40]
0x1407145e8: movzx  r15d,BYTE PTR [rsp+0x40]
0x1407145ee: movzx  r12d,BYTE PTR [rsp+0x40]
0x1407145f4: je     0x14071466d
0x1407145f6: movsx  rcx,WORD PTR [rsp+0x44]
0x1407145fc: mov    QWORD PTR [rsp+0x78],rcx
0x140714601: mov    r8,QWORD PTR [rsp+0x50]
0x140714606: mov    rax,QWORD PTR [r8+0x160]
0x14071460d: cmp    BYTE PTR [rcx+rax*1],0x0
0x140714611: jne    0x1407161ff
0x140714617: cmp    DWORD PTR [rbp-0x78],0xffffffff
0x14071461b: je     0x14071465f
0x14071461d: lea    r13,[r8+0x68]
0x140714621: mov    rdx,rcx
0x140714624: mov    rcx,QWORD PTR [r8+0x48]
0x140714628: call   0x14006f220
0x14071462d: mov    rcx,QWORD PTR [rax]
0x140714630: add    rcx,0x58
0x140714634: movsxd rdx,DWORD PTR [rbp-0x78]
0x140714638: call   0x14006f220
0x14071463d: mov    rdx,QWORD PTR [rax]
0x140714640: movsxd rdx,DWORD PTR [rdx+0x68]
0x140714644: mov    rcx,r13
0x140714647: call   0x14006f360
0x14071464c: test   BYTE PTR [rax],0x1
0x14071464f: jne    0x1407161ff
0x140714655: mov    rcx,QWORD PTR [rsp+0x78]
0x14071465a: mov    r8,QWORD PTR [rsp+0x50]
0x14071465f: mov    rax,QWORD PTR [r8+0x50]
0x140714663: test   BYTE PTR [rax+rcx*4],0x2
0x140714667: jne    0x1407161ff
0x14071466d: mov    r13d,DWORD PTR [rsp+0x40]
0x140714672: cmp    DWORD PTR [rsp+0x58],0x0
0x140714677: jne    0x140714682
0x140714679: test   r13d,r13d
0x14071467c: je     0x1407161ff
0x140714682: movzx  edx,bl
0x140714685: lea    rcx,[rbp-0x30]
0x140714689: call   0x140068190
0x14071468e: lea    rcx,[rbp-0x30]
0x140714692: call   0x14006fb80
0x140714697: nop
0x140714698: mov    eax,DWORD PTR [rsp+0x58]
0x14071469c: cmp    eax,0x3
0x14071469f: jne    0x140714790
0x1407146a5: cmp    r13d,eax
0x1407146a8: jne    0x14071477e
0x1407146ae: lea    rdx,[rip+0xf718e3]        # 0x141685f98  'has a deep, guttural voice'
0x1407146b5: jmp    0x140714879
0x1407146ba: cmp    eax,DWORD PTR [r9+0x24]
0x1407146be: jg     0x1407146cd
0x1407146c0: mov    DWORD PTR [rsp+0x58],0xfffffffe
0x1407146c8: jmp    0x14071459a
0x1407146cd: cmp    eax,DWORD PTR [r9+0x28]
0x1407146d1: jg     0x1407146e0
0x1407146d3: mov    DWORD PTR [rsp+0x58],0xffffffff
0x1407146db: jmp    0x14071459a
0x1407146e0: cmp    eax,DWORD PTR [r9+0x34]
0x1407146e4: jl     0x1407146ef
0x1407146e6: mov    DWORD PTR [rsp+0x58],ebx
0x1407146ea: jmp    0x14071459a
0x1407146ef: cmp    eax,DWORD PTR [r9+0x30]
0x1407146f3: jl     0x140714702
0x1407146f5: mov    DWORD PTR [rsp+0x58],0x2
0x1407146fd: jmp    0x14071459a
0x140714702: cmp    eax,DWORD PTR [r9+0x2c]
0x140714706: jl     0x14071459a
0x14071470c: mov    DWORD PTR [rsp+0x58],edi
0x140714710: jmp    0x14071459a
0x140714715: mov    eax,DWORD PTR [r15+rdx*1]
0x140714719: cmp    eax,DWORD PTR [r9+0x20]
0x14071471d: jg     0x14071472a
0x14071471f: mov    r13d,0xfffffffd
0x140714725: jmp    0x14071459a
0x14071472a: cmp    eax,DWORD PTR [r9+0x24]
0x14071472e: jg     0x14071473b
0x140714730: mov    r13d,0xfffffffe
0x140714736: jmp    0x14071459a
0x14071473b: cmp    eax,DWORD PTR [r9+0x28]
0x14071473f: jg     0x14071474d
0x140714741: mov    r13,0xffffffffffffffff
0x140714748: jmp    0x14071459a
0x14071474d: cmp    eax,DWORD PTR [r9+0x34]
0x140714751: jl     0x14071475b
0x140714753: mov    r13d,ebx
0x140714756: jmp    0x14071459a
0x14071475b: mov    rdx,QWORD PTR [rsp+0x60]
0x140714760: cmp    eax,DWORD PTR [r9+0x30]
0x140714764: jl     0x140714771
0x140714766: mov    r13d,0x2
0x14071476c: jmp    0x14071459f
0x140714771: cmp    eax,DWORD PTR [r9+0x2c]
0x140714775: cmovge r13d,edi
0x140714779: jmp    0x14071459f
0x14071477e: cmp    r13d,0xfffffffd
0x140714782: jne    0x1407147bd
0x140714784: lea    rdx,[rip+0xf717c5]        # 0x141685f50  'has a high-pitched, grating voice'
0x14071478b: jmp    0x140714879
0x140714790: cmp    eax,0xfffffffd
0x140714793: jne    0x1407147b8
0x140714795: cmp    r13d,eax
0x140714798: jne    0x1407147a6
0x14071479a: lea    rdx,[rip+0xf717d7]        # 0x141685f78  'has a high-pitched, clear voice'
0x1407147a1: jmp    0x140714879
0x1407147a6: cmp    r13d,0x3
0x1407147aa: jne    0x1407147e6
0x1407147ac: lea    rdx,[rip+0xf71785]        # 0x141685f38  'has a clear, deep voice'
0x1407147b3: jmp    0x140714879
0x1407147b8: cmp    eax,0x2
0x1407147bb: jl     0x1407147e1
0x1407147bd: cmp    r13d,0x2
0x1407147c1: jl     0x1407147cf
0x1407147c3: lea    rdx,[rip+0xf71746]        # 0x141685f10  'has a fairly deep and raspy voice'
0x1407147ca: jmp    0x140714879
0x1407147cf: cmp    r13d,0xfffffffe
0x1407147d3: jg     0x1407147e1
0x1407147d5: lea    rdx,[rip+0xf71714]        # 0x141685ef0  'has a high squeaky voice'
0x1407147dc: jmp    0x140714879
0x1407147e1: cmp    eax,0xfffffffe
0x1407147e4: jg     0x140714807
0x1407147e6: cmp    r13d,0x2
0x1407147ea: jl     0x1407147f8
0x1407147ec: lea    rdx,[rip+0xf716e5]        # 0x141685ed8  'has a low, clear voice'
0x1407147f3: jmp    0x140714879
0x1407147f8: cmp    r13d,0xfffffffe
0x1407147fc: jg     0x140714807
0x1407147fe: lea    rdx,[rip+0xf716bb]        # 0x141685ec0  'has a high, clear voice'
0x140714805: jmp    0x140714879
0x140714807: cmp    eax,0xfffffffd
0x14071480a: jne    0x140714815
0x14071480c: lea    rdx,[rip+0xf71695]        # 0x141685ea8  'has a very clear voice'
0x140714813: jmp    0x140714879
0x140714815: cmp    eax,0xfffffffe
0x140714818: jne    0x140714823
0x14071481a: lea    rdx,[rip+0xf7166f]        # 0x141685e90  'has a clear voice'
0x140714821: jmp    0x140714879
0x140714823: cmp    eax,0x3
0x140714826: jne    0x140714831
0x140714828: lea    rdx,[rip+0xf71641]        # 0x141685e70  'has a grating, raspy voice'
0x14071482f: jmp    0x140714879
0x140714831: cmp    eax,0x2
0x140714834: jne    0x14071483f
0x140714836: lea    rdx,[rip+0xf7161b]        # 0x141685e58  'has a scratchy voice'
0x14071483d: jmp    0x140714879
0x14071483f: cmp    r13d,0xfffffffd
0x140714843: jne    0x14071484e
0x140714845: lea    rdx,[rip+0xf715ec]        # 0x141685e38  'has a very high-pitched voice'
0x14071484c: jmp    0x140714879
0x14071484e: cmp    r13d,0xfffffffe
0x140714852: jne    0x14071485d
0x140714854: lea    rdx,[rip+0xf715c5]        # 0x141685e20  'has a high voice'
0x14071485b: jmp    0x140714879
0x14071485d: cmp    r13d,0x3
0x140714861: jne    0x14071486c
0x140714863: lea    rdx,[rip+0xf718be]        # 0x141686128  'has a very deep voice'
0x14071486a: jmp    0x140714879
0x14071486c: cmp    r13d,0x2
0x140714870: jne    0x140714882
0x140714872: lea    rdx,[rip+0xf7189f]        # 0x141686118  'has a low voice'
0x140714879: lea    rcx,[rbp-0x30]
0x14071487d: call   0x14006f560
0x140714882: cmp    QWORD PTR [rbp-0x20],0x0
0x140714887: je     0x1407148d1
0x140714889: lea    rdx,[rbp+0x50]
0x14071488d: mov    r13,QWORD PTR [rsp+0x70]
0x140714892: mov    rcx,r13
0x140714895: call   0x1400b9d10
0x14071489a: mov    r8d,0x1
0x1407148a0: lea    rdx,[rip+0xed3e95]        # 0x1415e873c  ' '
0x1407148a7: mov    rcx,r13
0x1407148aa: call   0x14006fa10
0x1407148af: lea    rdx,[rbp-0x30]
0x1407148b3: mov    rcx,r13
0x1407148b6: call   0x1400b9d10
0x1407148bb: mov    r8d,0x3
0x1407148c1: lea    rdx,[rip+0xee90a0]        # 0x1415fd968  '.  '
0x1407148c8: mov    rcx,r13
0x1407148cb: call   0x14006fa10
0x1407148d0: nop
0x1407148d1: lea    rcx,[rbp-0x30]
0x1407148d5: call   0x14006f850
0x1407148da: jmp    0x1407161ff
0x1407148df: mov    rcx,QWORD PTR [rsp+0x50]
0x1407148e4: mov    r13,QWORD PTR [rcx+0x8]
0x1407148e8: mov    rcx,r8
0x1407148eb: test   rdx,rdx
0x1407148ee: mov    rdx,QWORD PTR [rbp-0x78]
0x1407148f2: je     0x140714960
0x1407148f4: call   0x14006f220
0x1407148f9: mov    rcx,QWORD PTR [rax]
0x1407148fc: add    rcx,0x8
0x140714900: xor    edx,edx
0x140714902: call   0x14006f360
0x140714907: movsxd rdx,DWORD PTR [rax]
0x14071490a: lea    rcx,[r13+0x1620]
0x140714911: call   0x14006f220
0x140714916: mov    r13,QWORD PTR [rax]
0x140714919: lea    rcx,[r13+0x80]
0x140714920: xor    edx,edx
0x140714922: call   0x14006f440
0x140714927: movzx  eax,WORD PTR [rax]
0x14071492a: mov    WORD PTR [rsp+0x40],ax
0x14071492f: lea    rcx,[r13+0x98]
0x140714936: xor    edx,edx
0x140714938: call   0x14006f440
0x14071493d: movzx  eax,WORD PTR [rax]
0x140714940: mov    WORD PTR [rsp+0x44],ax
0x140714945: lea    rdx,[r13+0x58]
0x140714949: lea    rcx,[rbp+0x90]
0x140714950: call   0x14006f5a0
0x140714955: movzx  edx,WORD PTR [r13+0x78]
0x14071495a: mov    DWORD PTR [rsp+0x60],edx
0x14071495e: jmp    0x1407149c7
0x140714960: call   0x14006f220
0x140714965: mov    rcx,QWORD PTR [rax]
0x140714968: add    rcx,0x68
0x14071496c: xor    edx,edx
0x14071496e: call   0x14006f360
0x140714973: movsxd rdx,DWORD PTR [rax]
0x140714976: lea    rcx,[r13+0x16c8]
0x14071497d: call   0x14006f220
0x140714982: mov    r13,QWORD PTR [rax]
0x140714985: lea    rcx,[r13+0x30]
0x140714989: xor    edx,edx
0x14071498b: call   0x14006f440
0x140714990: movzx  eax,WORD PTR [rax]
0x140714993: mov    WORD PTR [rsp+0x40],ax
0x140714998: lea    rcx,[r13+0x48]
0x14071499c: xor    edx,edx
0x14071499e: call   0x14006f440
0x1407149a3: movzx  eax,WORD PTR [rax]
0x1407149a6: mov    WORD PTR [rsp+0x44],ax
0x1407149ab: lea    rdx,[r13+0x70]
0x1407149af: lea    rcx,[rbp+0x90]
0x1407149b6: call   0x14006f5a0
0x1407149bb: movzx  eax,WORD PTR [r13+0x90]
0x1407149c3: mov    DWORD PTR [rsp+0x60],eax
0x1407149c7: movsx  rcx,WORD PTR [rsp+0x40]
0x1407149cd: mov    r8,QWORD PTR [rsp+0x50]
0x1407149d2: mov    rax,QWORD PTR [r8+0x160]
0x1407149d9: cmp    BYTE PTR [rcx+rax*1],0x0
0x1407149dd: jne    0x1407161ff
0x1407149e3: cmp    WORD PTR [rsp+0x44],0xffff
0x1407149e9: je     0x140714a33
0x1407149eb: lea    r13,[r8+0x68]
0x1407149ef: mov    rdx,rcx
0x1407149f2: mov    rcx,QWORD PTR [r8+0x48]
0x1407149f6: call   0x14006f220
0x1407149fb: mov    rcx,QWORD PTR [rax]
0x1407149fe: add    rcx,0x58
0x140714a02: movsx  rax,WORD PTR [rsp+0x44]
0x140714a08: mov    QWORD PTR [rbp-0x68],rax
0x140714a0c: mov    rdx,rax
0x140714a0f: call   0x14006f220
0x140714a14: mov    rdx,QWORD PTR [rax]
0x140714a17: movsxd rdx,DWORD PTR [rdx+0x68]
0x140714a1b: mov    rcx,r13
0x140714a1e: call   0x14006f360
0x140714a23: test   BYTE PTR [rax],0x1
0x140714a26: jne    0x1407161ff
0x140714a2c: mov    r8,QWORD PTR [rsp+0x50]
0x140714a31: jmp    0x140714a3b
0x140714a33: mov    QWORD PTR [rbp-0x68],0xffffffffffffffff
0x140714a3b: lea    rcx,[r8+0x50]
0x140714a3f: movsx  rax,WORD PTR [rsp+0x40]
0x140714a45: mov    r13,rax
0x140714a48: mov    rdx,rax
0x140714a4b: call   0x14006f360
0x140714a50: test   BYTE PTR [rax],0x2
0x140714a53: jne    0x1407161ff
0x140714a59: cmp    WORD PTR [rsp+0x60],0xffff
0x140714a5f: je     0x140714a76
0x140714a61: lea    rdx,[rbp+0x90]
0x140714a68: lea    rcx,[rbp+0x10]
0x140714a6c: call   0x14006f5a0
0x140714a71: jmp    0x140714b37
0x140714a76: mov    WORD PTR [rsp+0x20],0x2
0x140714a7d: xor    r9d,r9d
0x140714a80: movzx  r8d,WORD PTR [rsp+0x40]
0x140714a86: lea    rdx,[rbp+0x10]
0x140714a8a: mov    rcx,QWORD PTR [rsp+0x50]
0x140714a8f: call   0x14070c0e0
0x140714a94: cmp    WORD PTR [rsp+0x44],0xffff
0x140714a9a: je     0x140714b0c
0x140714a9c: mov    rcx,QWORD PTR [rsp+0x50]
0x140714aa1: mov    r13,QWORD PTR [rcx]
0x140714aa4: movsx  rdx,WORD PTR [rsp+0x40]
0x140714aaa: mov    rcx,QWORD PTR [rcx+0x48]
0x140714aae: call   0x14006f220
0x140714ab3: mov    rcx,QWORD PTR [rax]
0x140714ab6: add    rcx,0x58
0x140714aba: mov    rdx,QWORD PTR [rbp-0x68]
0x140714abe: call   0x14006f220
0x140714ac3: mov    rdx,QWORD PTR [rax]
0x140714ac6: movsxd rdx,DWORD PTR [rdx+0x20]
0x140714aca: lea    rcx,[r13+0x208]
0x140714ad1: call   0x14006f220
0x140714ad6: mov    r8,QWORD PTR [rax]
0x140714ad9: add    r8,0x30
0x140714add: lea    rdx,[rip+0xed9040]        # 0x1415edb24  "'s "
0x140714ae4: lea    rcx,[rbp-0x50]
0x140714ae8: call   0x14014af80
0x140714aed: nop
0x140714aee: mov    rdx,rax
0x140714af1: lea    rcx,[rbp+0x10]
0x140714af5: call   0x1400b9d10
0x140714afa: nop
0x140714afb: lea    rcx,[rbp-0x50]
0x140714aff: call   0x140067e30
0x140714b04: xor    eax,eax
0x140714b06: mov    DWORD PTR [rsp+0x60],eax
0x140714b0a: jmp    0x140714b37
0x140714b0c: mov    rdx,r13
0x140714b0f: mov    rax,QWORD PTR [rsp+0x50]
0x140714b14: mov    rcx,QWORD PTR [rax+0x48]
0x140714b18: call   0x14006f220
0x140714b1d: mov    rcx,QWORD PTR [rax]
0x140714b20: cmp    DWORD PTR [rcx+0x84],0x1
0x140714b27: jle    0x140714b30
0x140714b29: mov    eax,0x1
0x140714b2e: jmp    0x140714b32
0x140714b30: xor    eax,eax
0x140714b32: mov    WORD PTR [rsp+0x60],ax
0x140714b37: lea    rax,[rip+0xffffffffff9532f2]        # 0x140067e30
0x140714b3e: mov    QWORD PTR [rsp+0x20],rax
0x140714b43: lea    r9,[rip+0xffffffffff95ab46]        # 0x14006f690
0x140714b4a: mov    edx,0x20
0x140714b4f: mov    r8d,0x3
0x140714b55: lea    rcx,[rbp+0xf0]
0x140714b5c: call   0x141539cb8
0x140714b61: nop
0x140714b62: mov    BYTE PTR [rsp+0x40],0x1
0x140714b67: lea    rcx,[rbp-0x10]
0x140714b6b: call   0x14006f690
0x140714b70: nop
0x140714b71: xor    r10d,r10d
0x140714b74: mov    DWORD PTR [rsp+0x48],r10d
0x140714b79: mov    rax,QWORD PTR [rbp-0x70]
0x140714b7d: mov    rdx,QWORD PTR [rax]
0x140714b80: mov    rax,QWORD PTR [rbp-0x80]
0x140714b84: mov    rcx,QWORD PTR [rdx+rax*8]
0x140714b88: mov    rax,QWORD PTR [rcx+0x10]
0x140714b8c: sub    rax,QWORD PTR [rcx+0x8]
0x140714b90: sar    rax,0x2
0x140714b94: test   rax,rax
0x140714b97: je     0x1407158c2
0x140714b9d: movzx  edi,r10w
0x140714ba1: mov    ebx,r10d
0x140714ba4: mov    rsi,QWORD PTR [rsp+0x50]
0x140714ba9: mov    r14,QWORD PTR [rbp-0x70]
0x140714bad: mov    r15,QWORD PTR [rbp-0x80]
0x140714bb1: mov    r12d,0x1
0x140714bb7: nop    WORD PTR [rax+rax*1+0x0]
0x140714bc0: mov    r8,QWORD PTR [rsi+0x8]
0x140714bc4: mov    rax,QWORD PTR [rdx+r15*8]
0x140714bc8: mov    rax,QWORD PTR [rax+0x8]
0x140714bcc: movsxd r11,DWORD PTR [rax+rbx*4]
0x140714bd0: mov    rax,QWORD PTR [r8+0x1620]
0x140714bd7: mov    rdx,QWORD PTR [rax+r11*8]
0x140714bdb: mov    QWORD PTR [rsp+0x78],rdx
0x140714be0: mov    r13d,0x64
0x140714be6: mov    edx,r10d
0x140714be9: mov    rcx,r10
0x140714bec: mov    r9,QWORD PTR [rsi+0x38]
0x140714bf0: sub    r9,QWORD PTR [rsi+0x30]
0x140714bf4: sar    r9,0x2
0x140714bf8: test   r9,r9
0x140714bfb: je     0x140714c38
0x140714bfd: mov    r10,QWORD PTR [r8+0x1638]
0x140714c04: nop    DWORD PTR [rax+0x0]
0x140714c08: nop    DWORD PTR [rax+rax*1+0x0]
0x140714c10: lea    rax,[rcx*4+0x0]
0x140714c18: cmp    DWORD PTR [r10+rax*1],r11d
0x140714c1c: je     0x140714c2d
0x140714c1e: inc    edx
0x140714c20: inc    rcx
0x140714c23: movsxd rax,edx
0x140714c26: cmp    rax,r9
0x140714c29: jb     0x140714c10
0x140714c2b: jmp    0x140714c35
0x140714c2d: mov    r13,QWORD PTR [rsi+0x30]
0x140714c31: mov    r13d,DWORD PTR [rax+r13*1]
0x140714c35: xor    r10d,r10d
0x140714c38: mov    rax,QWORD PTR [rsp+0x78]
0x140714c3d: cmp    r13d,DWORD PTR [rax+0x20]
0x140714c41: jg     0x140714c4a
0x140714c43: mov    edx,0xfffffffd
0x140714c48: jmp    0x140714c89
0x140714c4a: cmp    r13d,DWORD PTR [rax+0x24]
0x140714c4e: jg     0x140714c57
0x140714c50: mov    edx,0xfffffffe
0x140714c55: jmp    0x140714c89
0x140714c57: cmp    r13d,DWORD PTR [rax+0x28]
0x140714c5b: jg     0x140714c64
0x140714c5d: mov    edx,0xffffffff
0x140714c62: jmp    0x140714c89
0x140714c64: cmp    r13d,DWORD PTR [rax+0x34]
0x140714c68: jl     0x140714c71
0x140714c6a: mov    edx,0x3
0x140714c6f: jmp    0x140714c89
0x140714c71: cmp    r13d,DWORD PTR [rax+0x30]
0x140714c75: jl     0x140714c7e
0x140714c77: mov    edx,0x2
0x140714c7c: jmp    0x140714c89
0x140714c7e: mov    edx,r10d
0x140714c81: cmp    r13d,DWORD PTR [rax+0x2c]
0x140714c85: cmovge edx,r12d
0x140714c89: movsx  rax,WORD PTR [rax]
0x140714c8d: cmp    eax,0x15
0x140714c90: ja     0x14071585b
0x140714c96: lea    r8,[rip+0xffffffffff8eb363]        # 0x140000000
0x140714c9d: mov    ecx,DWORD PTR [r8+rax*4+0x716ae4]
0x140714ca5: add    rcx,r8
0x140714ca8: jmp    rcx
0x140714caa: cmp    di,r12w
0x140714cae: jg     0x140714d1a
0x140714cb0: cmp    edx,0x3
0x140714cb3: jne    0x140714cc1
0x140714cb5: lea    rdx,[rip+0xf70714]        # 0x1416853d0  'extremely tall'
0x140714cbc: jmp    0x140715844
0x140714cc1: cmp    edx,0x2
0x140714cc4: jne    0x140714cd2
0x140714cc6: lea    rdx,[rip+0xf70183]        # 0x141684e50  'tall'
0x140714ccd: jmp    0x140715844
0x140714cd2: cmp    edx,r12d
0x140714cd5: jne    0x140714ce3
0x140714cd7: lea    rdx,[rip+0xf706e2]        # 0x1416853c0  'somewhat tall'
0x140714cde: jmp    0x140715844
0x140714ce3: cmp    edx,0xfffffffd
0x140714ce6: jne    0x140714cf4
0x140714ce8: lea    rdx,[rip+0xf706c1]        # 0x1416853b0  'very short'
0x140714cef: jmp    0x140715844
0x140714cf4: cmp    edx,0xfffffffe
0x140714cf7: jne    0x140714d05
0x140714cf9: lea    rdx,[rip+0xf70148]        # 0x141684e48  'short'
0x140714d00: jmp    0x140715844
0x140714d05: cmp    edx,0xffffffff
0x140714d08: jne    0x14071585b
0x140714d0e: lea    rdx,[rip+0xf7068b]        # 0x1416853a0  'somewhat short'
0x140714d15: jmp    0x140715844
0x140714d1a: test   edx,edx
0x140714d1c: jle    0x140714d2a
0x140714d1e: lea    rdx,[rip+0xf7012b]        # 0x141684e50  'tall'
0x140714d25: jmp    0x140715844
0x140714d2a: jns    0x14071585b
0x140714d30: lea    rdx,[rip+0xf70111]        # 0x141684e48  'short'
0x140714d37: jmp    0x140715844
0x140714d3c: cmp    di,r12w
0x140714d40: jg     0x140714dac
0x140714d42: cmp    edx,0x3
0x140714d45: jne    0x140714d53
0x140714d47: lea    rdx,[rip+0xf7063a]        # 0x141685388  'extraordinarily broad'
0x140714d4e: jmp    0x140715844
0x140714d53: cmp    edx,0x2
0x140714d56: jne    0x140714d64
0x140714d58: lea    rdx,[rip+0xf700e1]        # 0x141684e40  'broad'
0x140714d5f: jmp    0x140715844
0x140714d64: cmp    edx,r12d
0x140714d67: jne    0x140714d75
0x140714d69: lea    rdx,[rip+0xf70608]        # 0x141685378  'somewhat broad'
0x140714d70: jmp    0x140715844
0x140714d75: cmp    edx,0xfffffffd
0x140714d78: jne    0x140714d86
0x140714d7a: lea    rdx,[rip+0xf705df]        # 0x141685360  'extremely narrow'
0x140714d81: jmp    0x140715844
0x140714d86: cmp    edx,0xfffffffe
0x140714d89: jne    0x140714d97
0x140714d8b: lea    rdx,[rip+0xf700a6]        # 0x141684e38  'narrow'
0x140714d92: jmp    0x140715844
0x140714d97: cmp    edx,0xffffffff
0x140714d9a: jne    0x14071585b
0x140714da0: lea    rdx,[rip+0xf707a9]        # 0x141685550  'somewhat narrow'
0x140714da7: jmp    0x140715844
0x140714dac: test   edx,edx
0x140714dae: jle    0x1407157ef
0x140714db4: lea    rdx,[rip+0xf70085]        # 0x141684e40  'broad'
0x140714dbb: jmp    0x140715844
0x140714dc0: cmp    di,r12w
0x140714dc4: jg     0x140714e0e
0x140714dc6: cmp    edx,0x3
0x140714dc9: jne    0x140714dd7
0x140714dcb: lea    rdx,[rip+0xf7076e]        # 0x141685540  'extremely long'
0x140714dd2: jmp    0x140715844
0x140714dd7: cmp    edx,0x2
0x140714dda: jne    0x140714de8
0x140714ddc: lea    rdx,[rip+0xf7074d]        # 0x141685530  'quite long'
0x140714de3: jmp    0x140715844
0x140714de8: cmp    edx,r12d
0x140714deb: jne    0x140714df9
0x140714ded: lea    rdx,[rip+0xf7072c]        # 0x141685520  'somewhat long'
0x140714df4: jmp    0x140715844
0x140714df9: cmp    edx,0xfffffffd
0x140714dfc: jne    0x140714cf4
0x140714e02: lea    rdx,[rip+0xf70707]        # 0x141685510  'extremely short'
0x140714e09: jmp    0x140715844
0x140714e0e: test   edx,edx
0x140714e10: jle    0x140714d2a
0x140714e16: lea    rdx,[rip+0xf70013]        # 0x141684e30  'long'
0x140714e1d: jmp    0x140715844
0x140714e22: cmp    di,r12w
0x140714e26: jg     0x140714e92
0x140714e28: cmp    edx,0x3
0x140714e2b: jne    0x140714e39
0x140714e2d: lea    rdx,[rip+0xf706cc]        # 0x141685500  'incredibly high'
0x140714e34: jmp    0x140715844
0x140714e39: cmp    edx,0x2
0x140714e3c: jne    0x140714e4a
0x140714e3e: lea    rdx,[rip+0xf34fbb]        # 0x141649e00  'high'
0x140714e45: jmp    0x140715844
0x140714e4a: cmp    edx,r12d
0x140714e4d: jne    0x140714e5b
0x140714e4f: lea    rdx,[rip+0xf7069a]        # 0x1416854f0  'somewhat high'
0x140714e56: jmp    0x140715844
0x140714e5b: cmp    edx,0xfffffffd
0x140714e5e: jne    0x140714e6c
0x140714e60: lea    rdx,[rip+0xf70679]        # 0x1416854e0  'extremely low'
0x140714e67: jmp    0x140715844
0x140714e6c: cmp    edx,0xfffffffe
0x140714e6f: jne    0x140714e7d
0x140714e71: lea    rdx,[rip+0xf34f90]        # 0x141649e08  'low'
0x140714e78: jmp    0x140715844
0x140714e7d: cmp    edx,0xffffffff
0x140714e80: jne    0x14071585b
0x140714e86: lea    rdx,[rip+0xf70643]        # 0x1416854d0  'slightly low'
0x140714e8d: jmp    0x140715844
0x140714e92: test   edx,edx
0x140714e94: jle    0x140714ea2
0x140714e96: lea    rdx,[rip+0xf34f63]        # 0x141649e00  'high'
0x140714e9d: jmp    0x140715844
0x140714ea2: jns    0x14071585b
0x140714ea8: lea    rdx,[rip+0xf34f59]        # 0x141649e08  'low'
0x140714eaf: jmp    0x140715844
0x140714eb4: cmp    di,r12w
0x140714eb8: jg     0x140714f24
0x140714eba: cmp    edx,0x3
0x140714ebd: jne    0x140714ecb
0x140714ebf: lea    rdx,[rip+0xf705f2]        # 0x1416854b8  'incredibly close-set'
0x140714ec6: jmp    0x140715844
0x140714ecb: cmp    edx,0x2
0x140714ece: jne    0x140714edc
0x140714ed0: lea    rdx,[rip+0xf70731]        # 0x141685608  'close-set'
0x140714ed7: jmp    0x140715844
0x140714edc: cmp    edx,r12d
0x140714edf: jne    0x140714eed
0x140714ee1: lea    rdx,[rip+0xf705b8]        # 0x1416854a0  'slightly close-set'
0x140714ee8: jmp    0x140715844
0x140714eed: cmp    edx,0xfffffffd
0x140714ef0: jne    0x140714efe
0x140714ef2: lea    rdx,[rip+0xf70597]        # 0x141685490  'very wide-set'
0x140714ef9: jmp    0x140715844
0x140714efe: cmp    edx,0xfffffffe
0x140714f01: jne    0x140714f0f
0x140714f03: lea    rdx,[rip+0xf706ee]        # 0x1416855f8  'wide-set'
0x140714f0a: jmp    0x140715844
0x140714f0f: cmp    edx,0xffffffff
0x140714f12: jne    0x14071585b
0x140714f18: lea    rdx,[rip+0xf70559]        # 0x141685478  'slightly wide-set'
0x140714f1f: jmp    0x140715844
0x140714f24: test   edx,edx
0x140714f26: jle    0x140714f34
0x140714f28: lea    rdx,[rip+0xf706d9]        # 0x141685608  'close-set'
0x140714f2f: jmp    0x140715844
0x140714f34: jns    0x14071585b
0x140714f3a: lea    rdx,[rip+0xf706b7]        # 0x1416855f8  'wide-set'
0x140714f41: jmp    0x140715844
0x140714f46: cmp    di,r12w
0x140714f4a: jg     0x140714fb6
0x140714f4c: cmp    edx,0x3
0x140714f4f: jne    0x140714f5d
0x140714f51: lea    rdx,[rip+0xf70510]        # 0x141685468  'deeply sunken'
0x140714f58: jmp    0x140715844
0x140714f5d: cmp    edx,0x2
0x140714f60: jne    0x140714f6e
0x140714f62: lea    rdx,[rip+0xf70663]        # 0x1416855cc  'sunken'
0x140714f69: jmp    0x140715844
0x140714f6e: cmp    edx,r12d
0x140714f71: jne    0x140714f7f
0x140714f73: lea    rdx,[rip+0xf704de]        # 0x141685458  'slightly sunken'
0x140714f7a: jmp    0x140715844
0x140714f7f: cmp    edx,0xfffffffd
0x140714f82: jne    0x140714f90
0x140714f84: lea    rdx,[rip+0xf704c5]        # 0x141685450  'bulging'
0x140714f8b: jmp    0x140715844
0x140714f90: cmp    edx,0xfffffffe
0x140714f93: jne    0x140714fa1
0x140714f95: lea    rdx,[rip+0xf70624]        # 0x1416855c0  'protruding'
0x140714f9c: jmp    0x140715844
0x140714fa1: cmp    edx,0xffffffff
0x140714fa4: jne    0x14071585b
0x140714faa: lea    rdx,[rip+0xf70af7]        # 0x141685aa8  'slightly protruding'
0x140714fb1: jmp    0x140715844
0x140714fb6: test   edx,edx
0x140714fb8: jle    0x140714fc6
0x140714fba: lea    rdx,[rip+0xf7060b]        # 0x1416855cc  'sunken'
0x140714fc1: jmp    0x140715844
0x140714fc6: cmp    edx,0xfffffffd
0x140714fc9: jne    0x140714fd7
0x140714fcb: lea    rdx,[rip+0xf7047e]        # 0x141685450  'bulging'
0x140714fd2: jmp    0x140715844
0x140714fd7: test   edx,edx
0x140714fd9: jns    0x14071585b
0x140714fdf: lea    rdx,[rip+0xf705da]        # 0x1416855c0  'protruding'
0x140714fe6: jmp    0x140715844
0x140714feb: test   di,di
0x140714fee: jne    0x1407150c0
0x140714ff4: cmp    edx,0x3
0x140714ff7: jne    0x140715016
0x140714ff9: lea    rdx,[rip+0xf70a90]        # 0x141685a90  'have very large irises'
0x140715000: lea    rcx,[rbp+0xf0]
0x140715007: call   0x14006f560
0x14071500c: mov    BYTE PTR [rsp+0x40],dil
0x140715011: jmp    0x14071585b
0x140715016: cmp    edx,0x2
0x140715019: jne    0x140715038
0x14071501b: lea    rdx,[rip+0xf70a56]        # 0x141685a78  'have large irises'
0x140715022: lea    rcx,[rbp+0xf0]
0x140715029: call   0x14006f560
0x14071502e: mov    BYTE PTR [rsp+0x40],0x0
0x140715033: jmp    0x14071585b
0x140715038: cmp    edx,r12d
0x14071503b: jne    0x14071505a
0x14071503d: lea    rdx,[rip+0xf70a14]        # 0x141685a58  'have slightly large irises'
0x140715044: lea    rcx,[rbp+0xf0]
0x14071504b: call   0x14006f560
0x140715050: mov    BYTE PTR [rsp+0x40],0x0
0x140715055: jmp    0x14071585b
0x14071505a: cmp    edx,0xfffffffd
0x14071505d: jne    0x14071507c
0x14071505f: lea    rdx,[rip+0xf709da]        # 0x141685a40  'have very thin irises'
0x140715066: lea    rcx,[rbp+0xf0]
0x14071506d: call   0x14006f560
0x140715072: mov    BYTE PTR [rsp+0x40],0x0
0x140715077: jmp    0x14071585b
0x14071507c: cmp    edx,0xfffffffe
0x14071507f: jne    0x14071509e
0x140715081: lea    rdx,[rip+0xf709a0]        # 0x141685a28  'have thin irises'
0x140715088: lea    rcx,[rbp+0xf0]
0x14071508f: call   0x14006f560
0x140715094: mov    BYTE PTR [rsp+0x40],0x0
0x140715099: jmp    0x14071585b
0x14071509e: cmp    edx,0xffffffff
0x1407150a1: jne    0x1407150b6
0x1407150a3: lea    rdx,[rip+0xf7095e]        # 0x141685a08  'have slightly thin irises'
0x1407150aa: lea    rcx,[rbp+0xf0]
0x1407150b1: call   0x14006f560
0x1407150b6: mov    BYTE PTR [rsp+0x40],0x0
0x1407150bb: jmp    0x14071585b
0x1407150c0: cmp    di,r12w
0x1407150c4: jne    0x14071515e
0x1407150ca: cmp    edx,0x3
0x1407150cd: jne    0x1407150e2
0x1407150cf: lea    rdx,[rip+0xf7091a]        # 0x1416859f0  'very large-irised'
0x1407150d6: lea    rcx,[rbp+0x110]
0x1407150dd: jmp    0x140715856
0x1407150e2: cmp    edx,0x2
0x1407150e5: jne    0x1407150fa
0x1407150e7: lea    rdx,[rip+0xf704fa]        # 0x1416855e8  'large-irised'
0x1407150ee: lea    rcx,[rbp+0x110]
0x1407150f5: jmp    0x140715856
0x1407150fa: cmp    edx,r12d
0x1407150fd: jne    0x140715112
0x1407150ff: lea    rdx,[rip+0xf708d2]        # 0x1416859d8  'slightly large-irised'
0x140715106: lea    rcx,[rbp+0x110]
0x14071510d: jmp    0x140715856
0x140715112: cmp    edx,0xfffffffd
0x140715115: jne    0x14071512a
0x140715117: lea    rdx,[rip+0xf708a2]        # 0x1416859c0  'very thin-irised'
0x14071511e: lea    rcx,[rbp+0x110]
0x140715125: jmp    0x140715856
0x14071512a: cmp    edx,0xfffffffe
0x14071512d: jne    0x140715142
0x14071512f: lea    rdx,[rip+0xf7087a]        # 0x1416859b0  'thin-irised'
0x140715136: lea    rcx,[rbp+0x110]
0x14071513d: jmp    0x140715856
0x140715142: cmp    edx,0xffffffff
0x140715145: jne    0x14071585b
0x14071514b: lea    rdx,[rip+0xf70846]        # 0x141685998  'slightly thin-irised'
0x140715152: lea    rcx,[rbp+0x110]
0x140715159: jmp    0x140715856
0x14071515e: cmp    edx,0x2
0x140715161: jl     0x14071516f
0x140715163: lea    rdx,[rip+0xf7047e]        # 0x1416855e8  'large-irised'
0x14071516a: jmp    0x140715844
0x14071516f: cmp    edx,0xfffffffe
0x140715172: jg     0x14071585b
0x140715178: lea    rdx,[rip+0xf70831]        # 0x1416859b0  'thin-irised'
0x14071517f: jmp    0x140715844
0x140715184: cmp    di,r12w
0x140715188: jg     0x1407151f4
0x14071518a: cmp    edx,0x3
0x14071518d: jne    0x14071519b
0x14071518f: lea    rdx,[rip+0xf707ea]        # 0x141685980  'extremely wrinkled'
0x140715196: jmp    0x140715844
0x14071519b: cmp    edx,0x2
0x14071519e: jne    0x1407151ac
0x1407151a0: lea    rdx,[rip+0xf70409]        # 0x1416855b0  'wrinkled'
0x1407151a7: jmp    0x140715844
0x1407151ac: cmp    edx,r12d
0x1407151af: jne    0x1407151bd
0x1407151b1: lea    rdx,[rip+0xf707b0]        # 0x141685968  'slightly wrinkled'
0x1407151b8: jmp    0x140715844
0x1407151bd: cmp    edx,0xfffffffd
0x1407151c0: jne    0x1407151ce
0x1407151c2: lea    rdx,[rip+0xf7078f]        # 0x141685958  'very smooth'
0x1407151c9: jmp    0x140715844
0x1407151ce: cmp    edx,0xfffffffe
0x1407151d1: jne    0x1407151df
0x1407151d3: lea    rdx,[rip+0xf703ce]        # 0x1416855a8  'smooth'
0x1407151da: jmp    0x140715844
0x1407151df: cmp    edx,0xffffffff
0x1407151e2: jne    0x14071585b
0x1407151e8: lea    rdx,[rip+0xf70759]        # 0x141685948  'slightly smooth'
0x1407151ef: jmp    0x140715844
0x1407151f4: test   edx,edx
0x1407151f6: jle    0x140715204
0x1407151f8: lea    rdx,[rip+0xf703b1]        # 0x1416855b0  'wrinkled'
0x1407151ff: jmp    0x140715844
0x140715204: jns    0x14071585b
0x14071520a: lea    rdx,[rip+0xf70397]        # 0x1416855a8  'smooth'
0x140715211: jmp    0x140715844
0x140715216: cmp    di,r12w
0x14071521a: jg     0x140715274
0x14071521c: cmp    edx,0x3
0x14071521f: jne    0x14071522d
0x140715221: lea    rdx,[rip+0xf7099c]        # 0x141685bc4  'coiled'
0x140715228: jmp    0x140715844
0x14071522d: cmp    edx,0x2
0x140715230: jne    0x14071523e
0x140715232: lea    rdx,[rip+0xf70353]        # 0x14168558c  'curly'
0x140715239: jmp    0x140715844
0x14071523e: cmp    edx,r12d
0x140715241: jne    0x14071524f
0x140715243: lea    rdx,[rip+0xf70972]        # 0x141685bbc  'wavy'
0x14071524a: jmp    0x140715844
0x14071524f: cmp    edx,0xfffffffd
0x140715252: jne    0x140715260
0x140715254: lea    rdx,[rip+0xf7094d]        # 0x141685ba8  'incredibly straight'
0x14071525b: jmp    0x140715844
0x140715260: test   edx,edx
0x140715262: jns    0x14071585b
0x140715268: lea    rdx,[rip+0xf70311]        # 0x141685580  'straight'
0x14071526f: jmp    0x140715844
0x140715274: cmp    edx,0x3
0x140715277: jne    0x140715285
0x140715279: lea    rdx,[rip+0xf70944]        # 0x141685bc4  'coiled'
0x140715280: jmp    0x140715844
0x140715285: cmp    edx,0x2
0x140715288: jne    0x140715296
0x14071528a: lea    rdx,[rip+0xf702fb]        # 0x14168558c  'curly'
0x140715291: jmp    0x140715844
0x140715296: cmp    edx,r12d
0x140715299: jne    0x140715260
0x14071529b: lea    rdx,[rip+0xf7091a]        # 0x141685bbc  'wavy'
0x1407152a2: jmp    0x140715844
0x1407152a7: cmp    di,r12w
0x1407152ab: jg     0x140715317
0x1407152ad: cmp    edx,0x3
0x1407152b0: jne    0x1407152be
0x1407152b2: lea    rdx,[rip+0xf708df]        # 0x141685b98  'very convex'
0x1407152b9: jmp    0x140715844
0x1407152be: cmp    edx,0x2
0x1407152c1: jne    0x1407152cf
0x1407152c3: lea    rdx,[rip+0xf702d6]        # 0x1416855a0  'convex'
0x1407152ca: jmp    0x140715844
0x1407152cf: cmp    edx,r12d
0x1407152d2: jne    0x1407152e0
0x1407152d4: lea    rdx,[rip+0xf708ad]        # 0x141685b88  'slightly convex'
0x1407152db: jmp    0x140715844
0x1407152e0: cmp    edx,0xfffffffd
0x1407152e3: jne    0x1407152f1
0x1407152e5: lea    rdx,[rip+0xf70884]        # 0x141685b70  'incredibly concave'
0x1407152ec: jmp    0x140715844
0x1407152f1: cmp    edx,0xfffffffe
0x1407152f4: jne    0x140715302
0x1407152f6: lea    rdx,[rip+0xf7029b]        # 0x141685598  'concave'
0x1407152fd: jmp    0x140715844
0x140715302: cmp    edx,0xffffffff
0x140715305: jne    0x14071585b
0x14071530b: lea    rdx,[rip+0xf70846]        # 0x141685b58  'somewhat concave'
0x140715312: jmp    0x140715844
0x140715317: test   edx,edx
0x140715319: jle    0x140715327
0x14071531b: lea    rdx,[rip+0xf7027e]        # 0x1416855a0  'convex'
0x140715322: jmp    0x140715844
0x140715327: jns    0x14071585b
0x14071532d: lea    rdx,[rip+0xf70264]        # 0x141685598  'concave'
0x140715334: jmp    0x140715844
0x140715339: cmp    di,r12w
0x14071533d: jg     0x1407153a9
0x14071533f: cmp    edx,0x3
0x140715342: jne    0x140715350
0x140715344: lea    rdx,[rip+0xf707fd]        # 0x141685b48  'extremely dense'
0x14071534b: jmp    0x140715844
0x140715350: cmp    edx,0x2
0x140715353: jne    0x140715361
0x140715355: lea    rdx,[rip+0xf707dc]        # 0x141685b38  'quite dense'
0x14071535c: jmp    0x140715844
0x140715361: cmp    edx,r12d
0x140715364: jne    0x140715372
0x140715366: lea    rdx,[rip+0xf707bb]        # 0x141685b28  'slightly dense'
0x14071536d: jmp    0x140715844
0x140715372: cmp    edx,0xfffffffd
0x140715375: jne    0x140715383
0x140715377: lea    rdx,[rip+0xf70792]        # 0x141685b10  'extremely sparse'
0x14071537e: jmp    0x140715844
0x140715383: cmp    edx,0xfffffffe
0x140715386: jne    0x140715394
0x140715388: lea    rdx,[rip+0xf70771]        # 0x141685b00  'quite sparse'
0x14071538f: jmp    0x140715844
0x140715394: cmp    edx,0xffffffff
0x140715397: jne    0x14071585b
0x14071539d: lea    rdx,[rip+0xf7074c]        # 0x141685af0  'slightly sparse'
0x1407153a4: jmp    0x140715844
0x1407153a9: test   edx,edx
0x1407153ab: jle    0x1407153b9
0x1407153ad: lea    rdx,[rip+0xf701c4]        # 0x141685578  'dense'
0x1407153b4: jmp    0x140715844
0x1407153b9: jns    0x14071585b
0x1407153bf: lea    rdx,[rip+0xf701aa]        # 0x141685570  'sparse'
0x1407153c6: jmp    0x140715844
0x1407153cb: cmp    di,r12w
0x1407153cf: jg     0x14071543b
0x1407153d1: cmp    edx,0x3
0x1407153d4: jne    0x1407153e2
0x1407153d6: lea    rdx,[rip+0xf70703]        # 0x141685ae0  'very thick'
0x1407153dd: jmp    0x140715844
0x1407153e2: cmp    edx,0x2
0x1407153e5: jne    0x1407153f3
0x1407153e7: lea    rdx,[rip+0xf7017a]        # 0x141685568  'thick'
0x1407153ee: jmp    0x140715844
0x1407153f3: cmp    edx,r12d
0x1407153f6: jne    0x140715404
0x1407153f8: lea    rdx,[rip+0xf706d1]        # 0x141685ad0  'slightly thick'
0x1407153ff: jmp    0x140715844
0x140715404: cmp    edx,0xfffffffd
0x140715407: jne    0x140715415
0x140715409: lea    rdx,[rip+0xf706b0]        # 0x141685ac0  'very thin'
0x140715410: jmp    0x140715844
0x140715415: cmp    edx,0xfffffffe
0x140715418: jne    0x140715426
0x14071541a: lea    rdx,[rip+0xf7013f]        # 0x141685560  'thin'
0x140715421: jmp    0x140715844
0x140715426: cmp    edx,0xffffffff
0x140715429: jne    0x14071585b
0x14071542f: lea    rdx,[rip+0xf70412]        # 0x141685848  'somewhat thin'
0x140715436: jmp    0x140715844
0x14071543b: test   edx,edx
0x14071543d: jle    0x14071544b
0x14071543f: lea    rdx,[rip+0xf70122]        # 0x141685568  'thick'
0x140715446: jmp    0x140715844
0x14071544b: jns    0x14071585b
0x140715451: lea    rdx,[rip+0xf70108]        # 0x141685560  'thin'
0x140715458: jmp    0x140715844
0x14071545d: cmp    di,r12w
0x140715461: jg     0x1407154cd
0x140715463: cmp    edx,0x3
0x140715466: jne    0x140715474
0x140715468: lea    rdx,[rip+0xf703c1]        # 0x141685830  'incredibly upturned'
0x14071546f: jmp    0x140715844
0x140715474: cmp    edx,0x2
0x140715477: jne    0x140715485
0x140715479: lea    rdx,[rip+0xf70270]        # 0x1416856f0  'upturned'
0x140715480: jmp    0x140715844
0x140715485: cmp    edx,r12d
0x140715488: jne    0x140715496
0x14071548a: lea    rdx,[rip+0xf70387]        # 0x141685818  'slightly upturned'
0x140715491: jmp    0x140715844
0x140715496: cmp    edx,0xfffffffd
0x140715499: jne    0x1407154a7
0x14071549b: lea    rdx,[rip+0xf70366]        # 0x141685808  'sharply hooked'
0x1407154a2: jmp    0x140715844
0x1407154a7: cmp    edx,0xfffffffe
0x1407154aa: jne    0x1407154b8
0x1407154ac: lea    rdx,[rip+0xf70231]        # 0x1416856e4  'hooked'
0x1407154b3: jmp    0x140715844
0x1407154b8: cmp    edx,0xffffffff
0x1407154bb: jne    0x14071585b
0x1407154c1: lea    rdx,[rip+0xf70330]        # 0x1416857f8  'slightly hooked'
0x1407154c8: jmp    0x140715844
0x1407154cd: test   edx,edx
0x1407154cf: jle    0x1407154dd
0x1407154d1: lea    rdx,[rip+0xf70218]        # 0x1416856f0  'upturned'
0x1407154d8: jmp    0x140715844
0x1407154dd: jns    0x14071585b
0x1407154e3: lea    rdx,[rip+0xf701fa]        # 0x1416856e4  'hooked'
0x1407154ea: jmp    0x140715844
0x1407154ef: cmp    di,r12w
0x1407154f3: jg     0x14071555f
0x1407154f5: cmp    edx,0x3
0x1407154f8: jne    0x140715506
0x1407154fa: lea    rdx,[rip+0xf702df]        # 0x1416857e0  'very splayed out'
0x140715501: jmp    0x140715844
0x140715506: cmp    edx,0x2
0x140715509: jne    0x140715517
0x14071550b: lea    rdx,[rip+0xf701c6]        # 0x1416856d8  'splayed out'
0x140715512: jmp    0x140715844
0x140715517: cmp    edx,r12d
0x14071551a: jne    0x140715528
0x14071551c: lea    rdx,[rip+0xf702a5]        # 0x1416857c8  'somewhat splayed out'
0x140715523: jmp    0x140715844
0x140715528: cmp    edx,0xfffffffd
0x14071552b: jne    0x140715539
0x14071552d: lea    rdx,[rip+0xf70284]        # 0x1416857b8  'very flattened'
0x140715534: jmp    0x140715844
0x140715539: cmp    edx,0xfffffffe
0x14071553c: jne    0x14071554a
0x14071553e: lea    rdx,[rip+0xf70183]        # 0x1416856c8  'flattened'
0x140715545: jmp    0x140715844
0x14071554a: cmp    edx,0xffffffff
0x14071554d: jne    0x14071585b
0x140715553: lea    rdx,[rip+0xf70246]        # 0x1416857a0  'slightly flattened'
0x14071555a: jmp    0x140715844
0x14071555f: test   edx,edx
0x140715561: jle    0x14071556f
0x140715563: lea    rdx,[rip+0xf7016e]        # 0x1416856d8  'splayed out'
0x14071556a: jmp    0x140715844
0x14071556f: jns    0x14071585b
0x140715575: lea    rdx,[rip+0xf7014c]        # 0x1416856c8  'flattened'
0x14071557c: jmp    0x140715844
0x140715581: test   di,di
0x140715584: jne    0x14071565a
0x14071558a: cmp    edx,0x3
0x14071558d: jne    0x1407155ac
0x14071558f: lea    rdx,[rip+0xf701ea]        # 0x141685780  'have great swinging lobes'
0x140715596: lea    rcx,[rbp+0xf0]
0x14071559d: call   0x14006f560
0x1407155a2: mov    BYTE PTR [rsp+0x40],dil
0x1407155a7: jmp    0x14071585b
0x1407155ac: cmp    edx,0x2
0x1407155af: jne    0x1407155ce
0x1407155b1: lea    rdx,[rip+0xf701a8]        # 0x141685760  'have large hanging lobes'
0x1407155b8: lea    rcx,[rbp+0xf0]
0x1407155bf: call   0x14006f560
0x1407155c4: mov    BYTE PTR [rsp+0x40],0x0
0x1407155c9: jmp    0x14071585b
0x1407155ce: cmp    edx,r12d
0x1407155d1: jne    0x1407155f0
0x1407155d3: lea    rdx,[rip+0xf70176]        # 0x141685750  'are free-lobed'
0x1407155da: lea    rcx,[rbp+0xf0]
0x1407155e1: call   0x14006f560
0x1407155e6: mov    BYTE PTR [rsp+0x40],0x0
0x1407155eb: jmp    0x14071585b
0x1407155f0: cmp    edx,0xfffffffd
0x1407155f3: jne    0x140715612
0x1407155f5: lea    rdx,[rip+0xf70144]        # 0x141685740  'are fuse-lobed'
0x1407155fc: lea    rcx,[rbp+0xf0]
0x140715603: call   0x14006f560
0x140715608: mov    BYTE PTR [rsp+0x40],0x0
0x14071560d: jmp    0x14071585b
0x140715612: cmp    edx,0xfffffffe
0x140715615: jne    0x140715634
0x140715617: lea    rdx,[rip+0xf7010a]        # 0x141685728  'have nearly fused lobes'
0x14071561e: lea    rcx,[rbp+0xf0]
0x140715625: call   0x14006f560
0x14071562a: mov    BYTE PTR [rsp+0x40],0x0
0x14071562f: jmp    0x14071585b
0x140715634: cmp    edx,0xffffffff
0x140715637: jne    0x1407150b6
0x14071563d: lea    rdx,[rip+0xf700cc]        # 0x141685710  'have small lobes'
0x140715644: lea    rcx,[rbp+0xf0]
0x14071564b: call   0x14006f560
0x140715650: mov    BYTE PTR [rsp+0x40],0x0
0x140715655: jmp    0x14071585b
0x14071565a: cmp    di,r12w
0x14071565e: jne    0x1407156f8
0x140715664: cmp    edx,0x3
0x140715667: jne    0x14071567c
0x140715669: lea    rdx,[rip+0xf70048]        # 0x1416856b8  'great-lobed'
0x140715670: lea    rcx,[rbp+0x110]
0x140715677: jmp    0x140715856
0x14071567c: cmp    edx,0x2
0x14071567f: jne    0x140715694
0x140715681: lea    rdx,[rip+0xf70078]        # 0x141685700  'hanging-lobed'
0x140715688: lea    rcx,[rbp+0x110]
0x14071568f: jmp    0x140715856
0x140715694: cmp    edx,r12d
0x140715697: jne    0x1407156ac
0x140715699: lea    rdx,[rip+0xf70298]        # 0x141685938  'free-lobed'
0x1407156a0: lea    rcx,[rbp+0x110]
0x1407156a7: jmp    0x140715856
0x1407156ac: cmp    edx,0xfffffffd
0x1407156af: jne    0x1407156c4
0x1407156b1: lea    rdx,[rip+0xf6fff0]        # 0x1416856a8  'fuse-lobed'
0x1407156b8: lea    rcx,[rbp+0x110]
0x1407156bf: jmp    0x140715856
0x1407156c4: cmp    edx,0xfffffffe
0x1407156c7: jne    0x1407156dc
0x1407156c9: lea    rdx,[rip+0xf70250]        # 0x141685920  'nearly fuse-lobed'
0x1407156d0: lea    rcx,[rbp+0x110]
0x1407156d7: jmp    0x140715856
0x1407156dc: cmp    edx,0xffffffff
0x1407156df: jne    0x14071585b
0x1407156e5: lea    rdx,[rip+0xf70224]        # 0x141685910  'small-lobed'
0x1407156ec: lea    rcx,[rbp+0x110]
0x1407156f3: jmp    0x140715856
0x1407156f8: cmp    edx,0x3
0x1407156fb: jne    0x140715709
0x1407156fd: lea    rdx,[rip+0xf6ffb4]        # 0x1416856b8  'great-lobed'
0x140715704: jmp    0x140715844
0x140715709: test   edx,edx
0x14071570b: jle    0x140715719
0x14071570d: lea    rdx,[rip+0xf70224]        # 0x141685938  'free-lobed'
0x140715714: jmp    0x140715844
0x140715719: cmp    edx,0xfffffffe
0x14071571c: jg     0x14071572a
0x14071571e: lea    rdx,[rip+0xf6ff83]        # 0x1416856a8  'fuse-lobed'
0x140715725: jmp    0x140715844
0x14071572a: cmp    edx,0xffffffff
0x14071572d: jne    0x14071585b
0x140715733: lea    rdx,[rip+0xf701d6]        # 0x141685910  'small-lobed'
0x14071573a: jmp    0x140715844
0x14071573f: cmp    edx,0x3
0x140715742: jne    0x140715750
0x140715744: lea    rdx,[rip+0xf701b5]        # 0x141685900  'widely-spaced'
0x14071574b: jmp    0x140715844
0x140715750: cmp    edx,0x2
0x140715753: jne    0x140715761
0x140715755: lea    rdx,[rip+0xf6ff44]        # 0x1416856a0  'gapped'
0x14071575c: jmp    0x140715844
0x140715761: cmp    edx,0xfffffffd
0x140715764: jne    0x140715772
0x140715766: lea    rdx,[rip+0xf7018b]        # 0x1416858f8  'tangled'
0x14071576d: jmp    0x140715844
0x140715772: cmp    edx,0xfffffffe
0x140715775: jne    0x14071585b
0x14071577b: lea    rdx,[rip+0xf6ff16]        # 0x141685698  'crowded'
0x140715782: jmp    0x140715844
0x140715787: cmp    di,r12w
0x14071578b: jg     0x1407157d2
0x14071578d: cmp    edx,0x3
0x140715790: jne    0x14071579e
0x140715792: lea    rdx,[rip+0xf7014f]        # 0x1416858e8  'very round'
0x140715799: jmp    0x140715844
0x14071579e: cmp    edx,0x2
0x1407157a1: jne    0x1407157af
0x1407157a3: lea    rdx,[rip+0xf6fc9e]        # 0x141685448  'round'
0x1407157aa: jmp    0x140715844
0x1407157af: cmp    edx,r12d
0x1407157b2: jne    0x1407157c0
0x1407157b4: lea    rdx,[rip+0xf70115]        # 0x1416858d0  'slightly rounded'
0x1407157bb: jmp    0x140715844
0x1407157c0: cmp    edx,0xfffffffd
0x1407157c3: jne    0x140714d86
0x1407157c9: lea    rdx,[rip+0xf700f8]        # 0x1416858c8  'slit'
0x1407157d0: jmp    0x140715844
0x1407157d2: test   edx,edx
0x1407157d4: jle    0x1407157df
0x1407157d6: lea    rdx,[rip+0xf6fc6b]        # 0x141685448  'round'
0x1407157dd: jmp    0x140715844
0x1407157df: cmp    edx,0xfffffffd
0x1407157e2: jne    0x1407157ed
0x1407157e4: lea    rdx,[rip+0xf700dd]        # 0x1416858c8  'slit'
0x1407157eb: jmp    0x140715844
0x1407157ed: test   edx,edx
0x1407157ef: jns    0x14071585b
0x1407157f1: lea    rdx,[rip+0xf6f640]        # 0x141684e38  'narrow'
0x1407157f8: jmp    0x140715844
0x1407157fa: cmp    di,r12w
0x1407157fe: jg     0x14071582a
0x140715800: cmp    edx,0x3
0x140715803: jne    0x14071580e
0x140715805: lea    rdx,[rip+0xf6fc34]        # 0x141685440  'greasy'
0x14071580c: jmp    0x140715844
0x14071580e: cmp    edx,0x2
0x140715811: jne    0x14071581c
0x140715813: lea    rdx,[rip+0xf7009e]        # 0x1416858b8  'somewhat greasy'
0x14071581a: jmp    0x140715844
0x14071581c: cmp    edx,0xfffffffd
0x14071581f: jne    0x140715838
0x140715821: lea    rdx,[rip+0xf70088]        # 0x1416858b0  'crinkly'
0x140715828: jmp    0x140715844
0x14071582a: cmp    edx,0x2
0x14071582d: jl     0x14071581c
0x14071582f: lea    rdx,[rip+0xf6fc0a]        # 0x141685440  'greasy'
0x140715836: jmp    0x140715844
0x140715838: cmp    edx,0xfffffffe
0x14071583b: jne    0x14071585b
0x14071583d: lea    rdx,[rip+0xf6fbf8]        # 0x14168543c  'dry'
0x140715844: movsx  rax,di
0x140715848: shl    rax,0x5
0x14071584c: lea    rcx,[rbp+0xf0]
0x140715853: add    rcx,rax
0x140715856: call   0x14006f560
0x14071585b: movsx  rax,di
0x14071585f: shl    rax,0x5
0x140715863: cmp    QWORD PTR [rbp+rax*1+0x100],0x0
0x14071586c: je     0x140715871
0x14071586e: inc    di
0x140715871: mov    r10d,DWORD PTR [rsp+0x48]
0x140715876: inc    r10d
0x140715879: mov    DWORD PTR [rsp+0x48],r10d
0x14071587e: inc    rbx
0x140715881: mov    rdx,QWORD PTR [r14]
0x140715884: mov    rax,QWORD PTR [rdx+r15*8]
0x140715888: mov    rcx,QWORD PTR [rax+0x10]
0x14071588c: sub    rcx,QWORD PTR [rax+0x8]
0x140715890: sar    rcx,0x2
0x140715894: movsxd rax,r10d
0x140715897: cmp    rax,rcx
0x14071589a: mov    r10d,0x0
0x1407158a0: jb     0x140714bc0
0x1407158a6: movzx  edi,BYTE PTR [rsp+0x40]
0x1407158ab: movzx  esi,BYTE PTR [rsp+0x40]
0x1407158b0: movzx  r14d,BYTE PTR [rsp+0x40]
0x1407158b6: movzx  r15d,BYTE PTR [rsp+0x40]
0x1407158bc: movzx  r12d,BYTE PTR [rsp+0x40]
0x1407158c2: mov    rax,0xffffffffffffffff
0x1407158c9: mov    r10d,eax
0x1407158cc: mov    r9d,eax
0x1407158cf: mov    DWORD PTR [rsp+0x44],eax
0x1407158d3: xor    r13d,r13d
0x1407158d6: mov    r8d,r13d
0x1407158d9: mov    DWORD PTR [rsp+0x68],r13d
0x1407158de: mov    r11d,eax
0x1407158e1: mov    rax,QWORD PTR [rbp-0x80]
0x1407158e5: mov    rcx,QWORD PTR [rdx+rax*8]
0x1407158e9: mov    rax,QWORD PTR [rcx+0x70]
0x1407158ed: sub    rax,QWORD PTR [rcx+0x68]
0x1407158f1: sar    rax,0x2
0x1407158f5: test   rax,rax
0x1407158f8: je     0x1407159bd
0x1407158fe: mov    rdx,QWORD PTR [rsp+0x50]
0x140715903: mov    rax,QWORD PTR [rdx+0x8]
0x140715907: mov    rdi,QWORD PTR [rax+0x16c8]
0x14071590e: mov    rsi,QWORD PTR [rdx+0xf8]
0x140715915: mov    rax,QWORD PTR [rcx+0x70]
0x140715919: mov    r14,QWORD PTR [rcx+0x68]
0x14071591d: sub    rax,r14
0x140715920: sar    rax,0x2
0x140715924: mov    r15d,r13d
0x140715927: mov    r12,rax
0x14071592a: mov    ebx,DWORD PTR [rbp-0x5c]
0x14071592d: nop    DWORD PTR [rax]
0x140715930: movsxd rax,DWORD PTR [r14+r13*1]
0x140715934: mov    rdx,QWORD PTR [rdi+rax*8]
0x140715938: movsxd rcx,DWORD PTR [rsi+rax*4]
0x14071593c: mov    rax,QWORD PTR [rdx]
0x14071593f: mov    r8d,DWORD PTR [rax+rcx*4]
0x140715943: mov    r9d,DWORD PTR [rdx+0x64]
0x140715947: cmp    ebx,r9d
0x14071594a: jl     0x140715988
0x14071594c: mov    ecx,DWORD PTR [rdx+0x68]
0x14071594f: cmp    r10d,0xffffffff
0x140715953: je     0x14071595e
0x140715955: cmp    ebx,ecx
0x140715957: jl     0x140715968
0x140715959: cmp    r11d,ecx
0x14071595c: jge    0x140715988
0x14071595e: mov    r10d,r8d
0x140715961: mov    r11d,ecx
0x140715964: cmp    ebx,ecx
0x140715966: jge    0x140715988
0x140715968: mov    DWORD PTR [rsp+0x44],r8d
0x14071596d: mov    eax,ebx
0x14071596f: sub    eax,r9d
0x140715972: inc    eax
0x140715974: imul   eax,eax,0x64
0x140715977: sub    ecx,r9d
0x14071597a: inc    ecx
0x14071597c: cdq
0x14071597d: idiv   ecx
0x14071597f: mov    r8d,eax
0x140715982: mov    DWORD PTR [rsp+0x68],eax
0x140715986: jmp    0x14071598d
0x140715988: mov    r8d,DWORD PTR [rsp+0x68]
0x14071598d: inc    r15d
0x140715990: add    r13,0x4
0x140715994: movsxd rcx,r15d
0x140715997: cmp    rcx,r12
0x14071599a: jb     0x140715930
0x14071599c: movzx  edi,BYTE PTR [rsp+0x40]
0x1407159a1: movzx  esi,BYTE PTR [rsp+0x40]
0x1407159a6: movzx  r14d,BYTE PTR [rsp+0x40]
0x1407159ac: movzx  r15d,BYTE PTR [rsp+0x40]
0x1407159b2: movzx  r12d,BYTE PTR [rsp+0x40]
0x1407159b8: mov    r9d,DWORD PTR [rsp+0x44]
0x1407159bd: mov    eax,0x64
0x1407159c2: sub    eax,r8d
0x1407159c5: cmp    r8d,0x32
0x1407159c9: cmovle eax,r8d
0x1407159cd: mov    DWORD PTR [rsp+0x68],eax
0x1407159d1: mov    eax,r10d
0x1407159d4: cmovle eax,r9d
0x1407159d8: mov    DWORD PTR [rbp-0x78],eax
0x1407159db: cmovle r9d,r10d
0x1407159df: mov    DWORD PTR [rsp+0x44],r9d
0x1407159e4: test   r9d,r9d
0x1407159e7: js     0x14071606d
0x1407159ed: movsxd rcx,r9d
0x1407159f0: mov    rax,QWORD PTR [rip+0x1de16f9]        # 0x1424f70f0
0x1407159f7: mov    rdx,QWORD PTR [rip+0x1de16ea]        # 0x1424f70e8
0x1407159fe: sub    rax,rdx
0x140715a01: sar    rax,0x3
0x140715a05: cmp    rcx,rax
0x140715a08: jae    0x14071606d
0x140715a0e: mov    r13,QWORD PTR [rdx+rcx*8]
0x140715a12: mov    QWORD PTR [rbp-0x68],r13
0x140715a16: movsx  rax,WORD PTR [r13+0x38]
0x140715a1b: cmp    eax,0x5
0x140715a1e: ja     0x140715cee
0x140715a24: lea    rdx,[rip+0xffffffffff8ea5d5]        # 0x140000000
0x140715a2b: mov    ecx,DWORD PTR [rdx+rax*4+0x716b3c]
0x140715a32: add    rcx,rdx
0x140715a35: jmp    rcx
0x140715a37: xor    edx,edx
0x140715a39: jmp    0x140715cc0
0x140715a3e: lea    rdx,[rip+0xf6fe5b]        # 0x1416858a0  'striped '
0x140715a45: lea    rcx,[rbp-0x10]
0x140715a49: call   0x14006f560
0x140715a4e: lea    rcx,[r13+0x20]
0x140715a52: mov    QWORD PTR [rsp+0x78],rcx
0x140715a57: call   0x14006f450
0x140715a5c: test   rax,rax
0x140715a5f: je     0x140715ce9
0x140715a65: xor    eax,eax
0x140715a67: mov    r13d,eax
0x140715a6a: mov    esi,eax
0x140715a6c: mov    r12,QWORD PTR [rsp+0x78]
0x140715a71: mov    rdx,r13
0x140715a74: mov    rcx,r12
0x140715a77: call   0x14006f440
0x140715a7c: movsx  rdx,WORD PTR [rax]
0x140715a80: lea    rcx,[rip+0x1de1631]        # 0x1424f70b8
0x140715a87: call   0x14006f220
0x140715a8c: mov    rdx,QWORD PTR [rax]
0x140715a8f: add    rdx,0x50
0x140715a93: lea    rcx,[rbp-0x10]
0x140715a97: call   0x1400b9d10
0x140715a9c: mov    rcx,r12
0x140715a9f: call   0x14006f450
0x140715aa4: sub    eax,0x2
0x140715aa7: cmp    esi,eax
0x140715aa9: jne    0x140715ab4
0x140715aab: lea    rdx,[rip+0xed365e]        # 0x1415e9110  ' and '
0x140715ab2: jmp    0x140715ac9
0x140715ab4: mov    rcx,r12
0x140715ab7: call   0x14006f450
0x140715abc: dec    eax
0x140715abe: cmp    esi,eax
0x140715ac0: je     0x140715ad2
0x140715ac2: lea    rdx,[rip+0xed360f]        # 0x1415e90d8  ', '
0x140715ac9: lea    rcx,[rbp-0x10]
0x140715acd: call   0x14006f560
0x140715ad2: inc    esi
0x140715ad4: movsxd r13,esi
0x140715ad7: mov    rcx,r12
0x140715ada: call   0x14006f450
0x140715adf: cmp    r13,rax
0x140715ae2: jb     0x140715a71
0x140715ae4: movzx  esi,BYTE PTR [rsp+0x40]
0x140715ae9: movzx  r12d,BYTE PTR [rsp+0x40]
0x140715aef: jmp    0x140715ce9
0x140715af4: lea    rdx,[rip+0xf6fd95]        # 0x141685890  'mottled '
0x140715afb: lea    rcx,[rbp-0x10]
0x140715aff: call   0x14006f560
0x140715b04: lea    rcx,[r13+0x20]
0x140715b08: mov    QWORD PTR [rsp+0x78],rcx
0x140715b0d: call   0x14006f450
0x140715b12: test   rax,rax
0x140715b15: je     0x140715ce9
0x140715b1b: xor    eax,eax
0x140715b1d: mov    r13d,eax
0x140715b20: mov    edi,eax
0x140715b22: mov    r15,QWORD PTR [rsp+0x78]
0x140715b27: nop    WORD PTR [rax+rax*1+0x0]
0x140715b30: mov    rdx,r13
0x140715b33: mov    rcx,r15
0x140715b36: call   0x14006f440
0x140715b3b: movsx  rdx,WORD PTR [rax]
0x140715b3f: lea    rcx,[rip+0x1de1572]        # 0x1424f70b8
0x140715b46: call   0x14006f220
0x140715b4b: mov    rdx,QWORD PTR [rax]
0x140715b4e: add    rdx,0x50
0x140715b52: lea    rcx,[rbp-0x10]
0x140715b56: call   0x1400b9d10
0x140715b5b: mov    rcx,r15
0x140715b5e: call   0x14006f450
0x140715b63: sub    eax,0x2
0x140715b66: cmp    edi,eax
0x140715b68: jne    0x140715b73
0x140715b6a: lea    rdx,[rip+0xed359f]        # 0x1415e9110  ' and '
0x140715b71: jmp    0x140715b88
0x140715b73: mov    rcx,r15
0x140715b76: call   0x14006f450
0x140715b7b: dec    eax
0x140715b7d: cmp    edi,eax
0x140715b7f: je     0x140715b91
0x140715b81: lea    rdx,[rip+0xed3550]        # 0x1415e90d8  ', '
0x140715b88: lea    rcx,[rbp-0x10]
0x140715b8c: call   0x14006f560
0x140715b91: inc    edi
0x140715b93: movsxd r13,edi
0x140715b96: mov    rcx,r15
0x140715b99: call   0x14006f450
0x140715b9e: cmp    r13,rax
0x140715ba1: jb     0x140715b30
0x140715ba3: movzx  edi,BYTE PTR [rsp+0x40]
0x140715ba8: movzx  r15d,BYTE PTR [rsp+0x40]
0x140715bae: jmp    0x140715ce9
0x140715bb3: add    r13,0x20
0x140715bb7: mov    QWORD PTR [rsp+0x78],r13
0x140715bbc: xor    edx,edx
0x140715bbe: mov    rcx,r13
0x140715bc1: call   0x14006f440
0x140715bc6: movsx  rdx,WORD PTR [rax]
0x140715bca: lea    rcx,[rip+0x1de14e7]        # 0x1424f70b8
0x140715bd1: call   0x14006f220
0x140715bd6: mov    rdx,QWORD PTR [rax]
0x140715bd9: add    rdx,0x50
0x140715bdd: lea    rcx,[rbp-0x10]
0x140715be1: call   0x1400b9d10
0x140715be6: lea    rdx,[rip+0xed89f3]        # 0x1415ee5e0  ' with '
0x140715bed: lea    rcx,[rbp-0x10]
0x140715bf1: call   0x14006f560
0x140715bf6: mov    rcx,r13
0x140715bf9: call   0x14006f450
0x140715bfe: cmp    rax,0x1
0x140715c02: jbe    0x140715ca2
0x140715c08: mov    r13d,0x1
0x140715c0e: mov    r15d,r13d
0x140715c11: mov    r14,QWORD PTR [rsp+0x78]
0x140715c16: data16 nop WORD PTR [rax+rax*1+0x0]
0x140715c20: mov    rdx,r13
0x140715c23: mov    rcx,r14
0x140715c26: call   0x14006f440
0x140715c2b: movsx  rdx,WORD PTR [rax]
0x140715c2f: lea    rcx,[rip+0x1de1482]        # 0x1424f70b8
0x140715c36: call   0x14006f220
0x140715c3b: mov    rdx,QWORD PTR [rax]
0x140715c3e: add    rdx,0x50
0x140715c42: lea    rcx,[rbp-0x10]
0x140715c46: call   0x1400b9d10
0x140715c4b: mov    rcx,r14
0x140715c4e: call   0x14006f450
0x140715c53: sub    eax,0x2
0x140715c56: cmp    r15d,eax
0x140715c59: jne    0x140715c64
0x140715c5b: lea    rdx,[rip+0xed34ae]        # 0x1415e9110  ' and '
0x140715c62: jmp    0x140715c7a
0x140715c64: mov    rcx,r14
0x140715c67: call   0x14006f450
0x140715c6c: dec    eax
0x140715c6e: cmp    r15d,eax
0x140715c71: je     0x140715c83
0x140715c73: lea    rdx,[rip+0xed345e]        # 0x1415e90d8  ', '
0x140715c7a: lea    rcx,[rbp-0x10]
0x140715c7e: call   0x14006f560
0x140715c83: inc    r15d
0x140715c86: movsxd r13,r15d
0x140715c89: mov    rcx,r14
0x140715c8c: call   0x14006f450
0x140715c91: cmp    r13,rax
0x140715c94: jb     0x140715c20
0x140715c96: movzx  r14d,BYTE PTR [rsp+0x40]
0x140715c9c: movzx  r15d,BYTE PTR [rsp+0x40]
0x140715ca2: lea    rdx,[rip+0xf6fbdf]        # 0x141685888  ' spots'
0x140715ca9: lea    rcx,[rbp-0x10]
0x140715cad: call   0x14006f560
0x140715cb2: jmp    0x140715ce9
0x140715cb4: mov    edx,0x2
0x140715cb9: jmp    0x140715cc0
0x140715cbb: mov    edx,0x1
0x140715cc0: lea    rcx,[r13+0x20]
0x140715cc4: call   0x14006f440
0x140715cc9: movsx  rdx,WORD PTR [rax]
0x140715ccd: lea    rcx,[rip+0x1de13e4]        # 0x1424f70b8
0x140715cd4: call   0x14006f220
0x140715cd9: mov    rdx,QWORD PTR [rax]
0x140715cdc: add    rdx,0x50
0x140715ce0: lea    rcx,[rbp-0x10]
0x140715ce4: call   0x1400b9d10
0x140715ce9: mov    r9d,DWORD PTR [rsp+0x44]
0x140715cee: movsxd rcx,DWORD PTR [rbp-0x78]
0x140715cf2: test   ecx,ecx
0x140715cf4: js     0x14071606d
0x140715cfa: mov    rdx,rcx
0x140715cfd: mov    rax,QWORD PTR [rip+0x1de13ec]        # 0x1424f70f0
0x140715d04: sub    rax,QWORD PTR [rip+0x1de13dd]        # 0x1424f70e8
0x140715d0b: sar    rax,0x3
0x140715d0f: cmp    rcx,rax
0x140715d12: jae    0x14071606d
0x140715d18: cmp    ecx,r9d
0x140715d1b: je     0x14071606d
0x140715d21: lea    rcx,[rip+0x1de13c0]        # 0x1424f70e8
0x140715d28: call   0x14006f220
0x140715d2d: mov    r13,QWORD PTR [rax]
0x140715d30: lea    rdx,[rip+0xed2a05]        # 0x1415e873c  ' '
0x140715d37: lea    rcx,[rbp-0x10]
0x140715d3b: call   0x14006f560
0x140715d40: mov    eax,DWORD PTR [rsp+0x68]
0x140715d44: cmp    eax,0xa
0x140715d47: jg     0x140715d52
0x140715d49: lea    rdx,[rip+0xf6fb28]        # 0x141685878  'with a touch of'
0x140715d50: jmp    0x140715d73
0x140715d52: cmp    eax,0x14
0x140715d55: jg     0x140715d60
0x140715d57: lea    rdx,[rip+0xf6fb0a]        # 0x141685868  'with flecks of'
0x140715d5e: jmp    0x140715d73
0x140715d60: cmp    eax,0x1e
0x140715d63: lea    rdx,[rip+0xf6faee]        # 0x141685858  'with some'
0x140715d6a: jle    0x140715d73
0x140715d6c: lea    rdx,[rip+0xf70255]        # 0x141685fc8  'mixed with'
0x140715d73: lea    rcx,[rbp-0x10]
0x140715d77: call   0x14006f560
0x140715d7c: lea    rdx,[rip+0xed29b9]        # 0x1415e873c  ' '
0x140715d83: lea    rcx,[rbp-0x10]
0x140715d87: call   0x14006f560
0x140715d8c: mov    rcx,QWORD PTR [rbp-0x68]
0x140715d90: movsx  rax,WORD PTR [rcx+0x38]
0x140715d95: cmp    eax,0x5
0x140715d98: ja     0x14071606d
0x140715d9e: lea    rdx,[rip+0xffffffffff8ea25b]        # 0x140000000
0x140715da5: mov    ecx,DWORD PTR [rdx+rax*4+0x716b54]
0x140715dac: add    rcx,rdx
0x140715daf: jmp    rcx
0x140715db1: xor    edx,edx
0x140715db3: jmp    0x140716044
0x140715db8: lea    rcx,[r13+0x20]
0x140715dbc: mov    QWORD PTR [rsp+0x78],rcx
0x140715dc1: call   0x14006f450
0x140715dc6: test   rax,rax
0x140715dc9: je     0x140715e5c
0x140715dcf: xor    eax,eax
0x140715dd1: mov    r13d,eax
0x140715dd4: mov    r12d,eax
0x140715dd7: mov    rbx,QWORD PTR [rsp+0x78]
0x140715ddc: nop    DWORD PTR [rax+0x0]
0x140715de0: mov    rdx,r13
0x140715de3: mov    rcx,rbx
0x140715de6: call   0x14006f440
0x140715deb: movsx  rdx,WORD PTR [rax]
0x140715def: lea    rcx,[rip+0x1de12c2]        # 0x1424f70b8
0x140715df6: call   0x14006f220
0x140715dfb: mov    rdx,QWORD PTR [rax]
0x140715dfe: add    rdx,0x50
0x140715e02: lea    rcx,[rbp-0x10]
0x140715e06: call   0x1400b9d10
0x140715e0b: mov    rcx,rbx
0x140715e0e: call   0x14006f450
0x140715e13: sub    eax,0x2
0x140715e16: cmp    r12d,eax
0x140715e19: jne    0x140715e24
0x140715e1b: lea    rdx,[rip+0xed32ee]        # 0x1415e9110  ' and '
0x140715e22: jmp    0x140715e3a
0x140715e24: mov    rcx,rbx
0x140715e27: call   0x14006f450
0x140715e2c: dec    eax
0x140715e2e: cmp    r12d,eax
0x140715e31: je     0x140715e43
0x140715e33: lea    rdx,[rip+0xed329e]        # 0x1415e90d8  ', '
0x140715e3a: lea    rcx,[rbp-0x10]
0x140715e3e: call   0x14006f560
0x140715e43: inc    r12d
0x140715e46: movsxd r13,r12d
0x140715e49: mov    rcx,rbx
0x140715e4c: call   0x14006f450
0x140715e51: cmp    r13,rax
0x140715e54: jb     0x140715de0
0x140715e56: movzx  r12d,BYTE PTR [rsp+0x40]
0x140715e5c: lea    rdx,[rip+0xf70155]        # 0x141685fb8  ' stripes'
0x140715e63: lea    rcx,[rbp-0x10]
0x140715e67: call   0x14006f560
0x140715e6c: jmp    0x14071606d
0x140715e71: lea    rdx,[rip+0xf6fa18]        # 0x141685890  'mottled '
0x140715e78: lea    rcx,[rbp-0x10]
0x140715e7c: call   0x14006f560
0x140715e81: lea    rcx,[r13+0x20]
0x140715e85: mov    QWORD PTR [rsp+0x78],rcx
0x140715e8a: call   0x14006f450
0x140715e8f: test   rax,rax
0x140715e92: je     0x14071606d
0x140715e98: xor    eax,eax
0x140715e9a: mov    r13d,eax
0x140715e9d: mov    r15d,eax
0x140715ea0: mov    r14,QWORD PTR [rsp+0x78]
0x140715ea5: mov    rdx,r13
0x140715ea8: mov    rcx,r14
0x140715eab: call   0x14006f440
0x140715eb0: movsx  rdx,WORD PTR [rax]
0x140715eb4: lea    rcx,[rip+0x1de11fd]        # 0x1424f70b8
0x140715ebb: call   0x14006f220
0x140715ec0: mov    rdx,QWORD PTR [rax]
0x140715ec3: add    rdx,0x50
0x140715ec7: lea    rcx,[rbp-0x10]
0x140715ecb: call   0x1400b9d10
0x140715ed0: mov    rcx,r14
0x140715ed3: call   0x14006f450
0x140715ed8: sub    eax,0x2
0x140715edb: cmp    r15d,eax
0x140715ede: jne    0x140715ee9
0x140715ee0: lea    rdx,[rip+0xed3229]        # 0x1415e9110  ' and '
0x140715ee7: jmp    0x140715eff
0x140715ee9: mov    rcx,r14
0x140715eec: call   0x14006f450
0x140715ef1: dec    eax
0x140715ef3: cmp    r15d,eax
0x140715ef6: je     0x140715f08
0x140715ef8: lea    rdx,[rip+0xed31d9]        # 0x1415e90d8  ', '
0x140715eff: lea    rcx,[rbp-0x10]
0x140715f03: call   0x14006f560
0x140715f08: inc    r15d
0x140715f0b: movsxd r13,r15d
0x140715f0e: mov    rcx,r14
0x140715f11: call   0x14006f450
0x140715f16: cmp    r13,rax
0x140715f19: jb     0x140715ea5
0x140715f1b: movzx  r14d,BYTE PTR [rsp+0x40]
0x140715f21: movzx  r15d,BYTE PTR [rsp+0x40]
0x140715f27: jmp    0x14071606d
0x140715f2c: lea    rcx,[r13+0x20]
0x140715f30: mov    QWORD PTR [rsp+0x78],rcx
0x140715f35: xor    edx,edx
0x140715f37: call   0x14006f440
0x140715f3c: movsx  rdx,WORD PTR [rax]
0x140715f40: lea    rcx,[rip+0x1de1171]        # 0x1424f70b8
0x140715f47: call   0x14006f220
0x140715f4c: mov    rdx,QWORD PTR [rax]
0x140715f4f: add    rdx,0x50
0x140715f53: lea    rcx,[rbp-0x10]
0x140715f57: call   0x1400b9d10
0x140715f5c: lea    rdx,[rip+0xed867d]        # 0x1415ee5e0  ' with '
0x140715f63: lea    rcx,[rbp-0x10]
0x140715f67: call   0x14006f560
0x140715f6c: mov    r13d,0x1
0x140715f72: mov    rax,QWORD PTR [rbp-0x68]
0x140715f76: add    rax,0x20
0x140715f7a: mov    QWORD PTR [rbp-0x68],rax
0x140715f7e: mov    rcx,rax
0x140715f81: call   0x14006f450
0x140715f86: cmp    rax,r13
0x140715f89: jbe    0x140716026
0x140715f8f: mov    r14d,r13d
0x140715f92: mov    rsi,QWORD PTR [rsp+0x78]
0x140715f97: mov    rdi,QWORD PTR [rbp-0x68]
0x140715f9b: nop    DWORD PTR [rax+rax*1+0x0]
0x140715fa0: mov    rdx,r13
0x140715fa3: mov    rcx,rsi
0x140715fa6: call   0x14006f440
0x140715fab: movsx  rdx,WORD PTR [rax]
0x140715faf: lea    rcx,[rip+0x1de1102]        # 0x1424f70b8
0x140715fb6: call   0x14006f220
0x140715fbb: mov    rdx,QWORD PTR [rax]
0x140715fbe: add    rdx,0x50
0x140715fc2: lea    rcx,[rbp-0x10]
0x140715fc6: call   0x1400b9d10
0x140715fcb: mov    rcx,rsi
0x140715fce: call   0x14006f450
0x140715fd3: sub    eax,0x2
0x140715fd6: cmp    r14d,eax
0x140715fd9: jne    0x140715fe4
0x140715fdb: lea    rdx,[rip+0xed312e]        # 0x1415e9110  ' and '
0x140715fe2: jmp    0x140715ffa
0x140715fe4: mov    rcx,rsi
0x140715fe7: call   0x14006f450
0x140715fec: dec    eax
0x140715fee: cmp    r14d,eax
0x140715ff1: je     0x140716003
0x140715ff3: lea    rdx,[rip+0xed30de]        # 0x1415e90d8  ', '
0x140715ffa: lea    rcx,[rbp-0x10]
0x140715ffe: call   0x14006f560
0x140716003: inc    r14d
0x140716006: movsxd r13,r14d
0x140716009: mov    rcx,rdi
0x14071600c: call   0x14006f450
0x140716011: cmp    r13,rax
0x140716014: jb     0x140715fa0
0x140716016: movzx  edi,BYTE PTR [rsp+0x40]
0x14071601b: movzx  esi,BYTE PTR [rsp+0x40]
0x140716020: movzx  r14d,BYTE PTR [rsp+0x40]
0x140716026: lea    rdx,[rip+0xf6f85b]        # 0x141685888  ' spots'
0x14071602d: lea    rcx,[rbp-0x10]
0x140716031: call   0x14006f560
0x140716036: jmp    0x14071606d
0x140716038: mov    edx,0x2
0x14071603d: jmp    0x140716044
0x14071603f: mov    edx,0x1
0x140716044: lea    rcx,[r13+0x20]
0x140716048: call   0x14006f440
0x14071604d: movsx  rdx,WORD PTR [rax]
0x140716051: lea    rcx,[rip+0x1de1060]        # 0x1424f70b8
0x140716058: call   0x14006f220
0x14071605d: mov    rdx,QWORD PTR [rax]
0x140716060: add    rdx,0x50
0x140716064: lea    rcx,[rbp-0x10]
0x140716068: call   0x1400b9d10
0x14071606d: cmp    QWORD PTR [rbp+0x100],0x0
0x140716075: jne    0x14071609c
0x140716077: cmp    QWORD PTR [rbp+0x120],0x0
0x14071607f: jne    0x14071609c
0x140716081: cmp    QWORD PTR [rbp+0x140],0x0
0x140716089: jne    0x14071609c
0x14071608b: lea    rcx,[rbp-0x10]
0x14071608f: call   0x14006f520
0x140716094: test   al,al
0x140716096: jne    0x1407161d7
0x14071609c: lea    rdx,[rbp+0x30]
0x1407160a0: mov    r13,QWORD PTR [rsp+0x70]
0x1407160a5: mov    rcx,r13
0x1407160a8: call   0x1400b9d10
0x1407160ad: mov    r8d,0x1
0x1407160b3: lea    rdx,[rip+0xed2682]        # 0x1415e873c  ' '
0x1407160ba: mov    rcx,r13
0x1407160bd: call   0x14006fa10
0x1407160c2: cmp    QWORD PTR [rbp+0x120],0x0
0x1407160ca: je     0x1407160f0
0x1407160cc: lea    rdx,[rbp+0x110]
0x1407160d3: mov    rcx,r13
0x1407160d6: call   0x1400b9d10
0x1407160db: mov    r8d,0x1
0x1407160e1: lea    rdx,[rip+0xed2654]        # 0x1415e873c  ' '
0x1407160e8: mov    rcx,r13
0x1407160eb: call   0x14006fa10
0x1407160f0: cmp    QWORD PTR [rbp+0x140],0x0
0x1407160f8: je     0x14071611e
0x1407160fa: lea    rdx,[rbp+0x130]
0x140716101: mov    rcx,r13
0x140716104: call   0x1400b9d10
0x140716109: mov    r8d,0x1
0x14071610f: lea    rdx,[rip+0xed2626]        # 0x1415e873c  ' '
0x140716116: mov    rcx,r13
0x140716119: call   0x14006fa10
0x14071611e: cmp    QWORD PTR [rbp+0x100],0x0
0x140716126: je     0x140716150
0x140716128: cmp    QWORD PTR [rbp+0x0],0x0
0x14071612d: je     0x140716150
0x14071612f: lea    rdx,[rbp-0x10]
0x140716133: mov    rcx,r13
0x140716136: call   0x1400b9d10
0x14071613b: mov    r8d,0x1
0x140716141: lea    rdx,[rip+0xed25f4]        # 0x1415e873c  ' '
0x140716148: mov    rcx,r13
0x14071614b: call   0x14006fa10
0x140716150: lea    rdx,[rbp+0x10]
0x140716154: mov    rcx,r13
0x140716157: call   0x1400b9d10
0x14071615c: mov    r8d,0x1
0x140716162: lea    rdx,[rip+0xed25d3]        # 0x1415e873c  ' '
0x140716169: mov    rcx,r13
0x14071616c: call   0x14006fa10
0x140716171: cmp    BYTE PTR [rsp+0x40],0x0
0x140716176: je     0x1407161a4
0x140716178: mov    rcx,r13
0x14071617b: cmp    WORD PTR [rsp+0x60],0x0
0x140716181: jne    0x140716192
0x140716183: mov    r8d,0x3
0x140716189: lea    rdx,[rip+0xeec290]        # 0x141602420  'is '
0x140716190: jmp    0x14071619f
0x140716192: mov    r8d,0x4
0x140716198: lea    rdx,[rip+0xf4cd1d]        # 0x141662ebc  'are '
0x14071619f: call   0x14006fa10
0x1407161a4: mov    rcx,r13
0x1407161a7: cmp    QWORD PTR [rbp+0x100],0x0
0x1407161af: lea    rdx,[rbp-0x10]
0x1407161b3: je     0x1407161bc
0x1407161b5: lea    rdx,[rbp+0xf0]
0x1407161bc: call   0x1400b9d10
0x1407161c1: mov    r8d,0x3
0x1407161c7: lea    rdx,[rip+0xee779a]        # 0x1415fd968  '.  '
0x1407161ce: mov    rcx,r13
0x1407161d1: call   0x14006fa10
0x1407161d6: nop
0x1407161d7: lea    rcx,[rbp-0x10]
0x1407161db: call   0x14006f850
0x1407161e0: nop
0x1407161e1: lea    r9,[rip+0xffffffffff951c48]        # 0x140067e30
0x1407161e8: mov    edx,0x20
0x1407161ed: mov    r8d,0x3
0x1407161f3: lea    rcx,[rbp+0xf0]
0x1407161fa: call   0x1415396cc
0x1407161ff: xor    r13d,r13d
0x140716202: mov    rax,QWORD PTR [rbp-0x70]
0x140716206: mov    rdx,QWORD PTR [rax]
0x140716209: mov    rax,QWORD PTR [rbp-0x80]
0x14071620d: mov    rcx,QWORD PTR [rdx+rax*8]
0x140716211: mov    rax,QWORD PTR [rcx+0xa0]
0x140716218: sub    rax,QWORD PTR [rcx+0x98]
0x14071621f: sar    rax,0x2
0x140716223: test   rax,rax
0x140716226: je     0x14071663a
0x14071622c: mov    ebx,r13d
0x14071622f: mov    r12d,ebx
0x140716232: mov    r14,QWORD PTR [rsp+0x70]
0x140716237: mov    r15,QWORD PTR [rsp+0x50]
0x14071623c: mov    rsi,QWORD PTR [rbp-0x70]
0x140716240: mov    rdi,QWORD PTR [rbp-0x80]
0x140716244: nop    DWORD PTR [rax+0x0]
0x140716248: nop    DWORD PTR [rax+rax*1+0x0]
0x140716250: mov    rax,QWORD PTR [rdx+rdi*8]
0x140716254: mov    rcx,QWORD PTR [rax+0x98]
0x14071625b: movsxd rax,DWORD PTR [rbx+rcx*1]
0x14071625f: mov    DWORD PTR [rbp-0x78],eax
0x140716262: mov    r13,rax
0x140716265: mov    rax,QWORD PTR [r15+0x98]
0x14071626c: mov    edx,DWORD PTR [rax+r13*4]
0x140716270: lea    rcx,[rip+0x1cbb581]        # 0x1423d17f8
0x140716277: call   0x14007daf0
0x14071627c: test   rax,rax
0x14071627f: je     0x1407165ef
0x140716285: mov    rcx,QWORD PTR [r15+0xb0]
0x14071628c: lea    rdx,[rax+0x11a8]
0x140716293: mov    ecx,DWORD PTR [rcx+r13*4]
0x140716297: call   0x14013cc50
0x14071629c: test   rax,rax
0x14071629f: je     0x1407165ef
0x1407162a5: mov    rdx,QWORD PTR [r15+0x8]
0x1407162a9: add    rdx,0x16e0
0x1407162b0: mov    rax,QWORD PTR [r15+0xc8]
0x1407162b7: mov    ecx,DWORD PTR [rax+r13*4]
0x1407162bb: call   0x1400e1560
0x1407162c0: mov    r13,rax
0x1407162c3: test   rax,rax
0x1407162c6: je     0x1407165ef
0x1407162cc: mov    rdx,QWORD PTR [r15+0x8]
0x1407162d0: mov    rcx,QWORD PTR [rdx+0x1680]
0x1407162d7: movsxd rax,DWORD PTR [rbp-0x78]
0x1407162db: mov    r8,rax
0x1407162de: movzx  eax,WORD PTR [rcx+rax*2]
0x1407162e2: mov    WORD PTR [rsp+0x40],ax
0x1407162e7: mov    rcx,QWORD PTR [rdx+0x1698]
0x1407162ee: movzx  eax,WORD PTR [rcx+r8*2]
0x1407162f3: mov    WORD PTR [rsp+0x44],ax
0x1407162f8: mov    rcx,QWORD PTR [rdx+0x16b0]
0x1407162ff: mov    eax,DWORD PTR [rcx+r8*4]
0x140716303: mov    DWORD PTR [rsp+0x48],eax
0x140716307: lea    rdx,[r13+0x88]
0x14071630e: lea    rcx,[rbp+0x90]
0x140716315: call   0x14006f5a0
0x14071631a: movzx  r13d,WORD PTR [r13+0xa8]
0x140716322: mov    DWORD PTR [rsp+0x60],r13d
0x140716327: cmp    r13w,0xffff
0x14071632c: je     0x140716343
0x14071632e: lea    rdx,[rbp+0x90]
0x140716335: lea    rcx,[rbp+0x10]
0x140716339: call   0x14006f5a0
0x14071633e: jmp    0x1407163ec
0x140716343: movsx  rcx,WORD PTR [rsp+0x40]
0x140716349: lea    r13,[rcx*8+0x0]
0x140716351: mov    WORD PTR [rsp+0x20],0x2
0x140716358: xor    r9d,r9d
0x14071635b: movzx  r8d,cx
0x14071635f: lea    rdx,[rbp+0x10]
0x140716363: mov    rcx,r15
0x140716366: call   0x14070c0e0
0x14071636b: mov    rax,QWORD PTR [r15+0x48]
0x14071636f: mov    rcx,QWORD PTR [rax]
0x140716372: cmp    WORD PTR [rsp+0x44],0xffff
0x140716378: je     0x1407163d1
0x14071637a: mov    r8,QWORD PTR [r15]
0x14071637d: mov    rax,QWORD PTR [rcx+r13*1]
0x140716381: movsx  rcx,WORD PTR [rsp+0x44]
0x140716387: mov    rax,QWORD PTR [rax+0x58]
0x14071638b: mov    rcx,QWORD PTR [rax+rcx*8]
0x14071638f: movsxd rdx,DWORD PTR [rcx+0x20]
0x140716393: mov    rax,QWORD PTR [r8+0x208]
0x14071639a: mov    r8,QWORD PTR [rax+rdx*8]
0x14071639e: add    r8,0x30
0x1407163a2: lea    rdx,[rip+0xed777b]        # 0x1415edb24  "'s "
0x1407163a9: lea    rcx,[rbp-0x50]
0x1407163ad: call   0x14014af80
0x1407163b2: nop
0x1407163b3: mov    rdx,rax
0x1407163b6: lea    rcx,[rbp+0x10]
0x1407163ba: call   0x1400b9d10
0x1407163bf: nop
0x1407163c0: lea    rcx,[rbp-0x50]
0x1407163c4: call   0x14006f850
0x1407163c9: xor    eax,eax
0x1407163cb: mov    DWORD PTR [rsp+0x60],eax
0x1407163cf: jmp    0x1407163ec
0x1407163d1: mov    rax,QWORD PTR [rcx+r13*1]
0x1407163d5: cmp    DWORD PTR [rax+0x84],0x1
0x1407163dc: jle    0x1407163e5
0x1407163de: mov    eax,0x1
0x1407163e3: jmp    0x1407163e7
0x1407163e5: xor    eax,eax
0x1407163e7: mov    WORD PTR [rsp+0x60],ax
0x1407163ec: lea    rdx,[rbp+0x30]
0x1407163f0: mov    rcx,r14
0x1407163f3: call   0x1400b9d10
0x1407163f8: mov    r8d,0x1
0x1407163fe: lea    rdx,[rip+0xed2337]        # 0x1415e873c  ' '
0x140716405: mov    rcx,r14
0x140716408: call   0x14006fa10
0x14071640d: movsxd rax,DWORD PTR [rsp+0x48]
0x140716412: mov    rcx,rax
0x140716415: cmp    eax,0xffffffff
0x140716418: je     0x1407164d2
0x14071641e: mov    rax,QWORD PTR [r15+0x30]
0x140716422: cmp    DWORD PTR [rax+rcx*4],0xa
0x140716426: jl     0x1407164d2
0x14071642c: lea    r13,[rcx*4+0x0]
0x140716434: mov    ecx,DWORD PTR [rax+r13*1]
0x140716438: cmp    ecx,0x12c
0x14071643e: jl     0x140716457
0x140716440: mov    r8d,0xe
0x140716446: lea    rdx,[rip+0xf6f0f3]        # 0x141685540  'extremely long'
0x14071644d: mov    rcx,r14
0x140716450: call   0x14006fa10
0x140716455: jmp    0x1407164bb
0x140716457: cmp    ecx,0x96
0x14071645d: jl     0x140716476
0x14071645f: mov    r8d,0x9
0x140716465: lea    rdx,[rip+0xf6f784]        # 0x141685bf0  'very long'
0x14071646c: mov    rcx,r14
0x14071646f: call   0x14006fa10
0x140716474: jmp    0x1407164bb
0x140716476: cmp    ecx,0x7d
0x140716479: jl     0x140716492
0x14071647b: mov    r8d,0x4
0x140716481: lea    rdx,[rip+0xf6e9a8]        # 0x141684e30  'long'
0x140716488: mov    rcx,r14
0x14071648b: call   0x14006fa10
0x140716490: jmp    0x1407164bb
0x140716492: cmp    ecx,0x4b
0x140716495: jl     0x1407164a0
0x140716497: lea    rdx,[rip+0xf6f742]        # 0x141685be0  'medium-length'
0x14071649e: jmp    0x1407164b3
0x1407164a0: cmp    ecx,0x1e
0x1407164a3: lea    rdx,[rip+0xf6e99e]        # 0x141684e48  'short'
0x1407164aa: jge    0x1407164b3
0x1407164ac: lea    rdx,[rip+0xf6eefd]        # 0x1416853b0  'very short'
0x1407164b3: mov    rcx,r14
0x1407164b6: call   0x14006f560
0x1407164bb: mov    r8d,0x1
0x1407164c1: lea    rdx,[rip+0xed2274]        # 0x1415e873c  ' '
0x1407164c8: mov    rcx,r14
0x1407164cb: call   0x14006fa10
0x1407164d0: jmp    0x1407164da
0x1407164d2: lea    r13,[rcx*4+0x0]
0x1407164da: lea    rdx,[rbp+0x10]
0x1407164de: mov    rcx,r14
0x1407164e1: call   0x1400b9d10
0x1407164e6: mov    r8d,0x1
0x1407164ec: lea    rdx,[rip+0xed2249]        # 0x1415e873c  ' '
0x1407164f3: mov    rcx,r14
0x1407164f6: call   0x14006fa10
0x1407164fb: mov    rcx,r14
0x1407164fe: cmp    WORD PTR [rsp+0x60],0x0
0x140716504: jne    0x140716515
0x140716506: mov    r8d,0x3
0x14071650c: lea    rdx,[rip+0xeebf0d]        # 0x141602420  'is '
0x140716513: jmp    0x140716522
0x140716515: mov    r8d,0x4
0x14071651b: lea    rdx,[rip+0xf4c99a]        # 0x141662ebc  'are '
0x140716522: call   0x14006fa10
0x140716527: cmp    DWORD PTR [rsp+0x48],0xffffffff
0x14071652c: je     0x140716564
0x14071652e: mov    rax,QWORD PTR [r15+0x30]
0x140716532: cmp    DWORD PTR [rax+r13*1],0xa
0x140716537: jge    0x140716564
0x140716539: mov    rcx,r14
0x14071653c: cmp    DWORD PTR [rax+r13*1],0x5
0x140716541: jge    0x140716555
0x140716543: mov    r8d,0xc
0x140716549: lea    rdx,[rip+0xf6f680]        # 0x141685bd0  'clean-shaven'
0x140716550: jmp    0x1407165d5
0x140716555: mov    r8d,0x7
0x14071655b: lea    rdx,[rip+0xf6f8b6]        # 0x141685e18  'stubble'
0x140716562: jmp    0x1407165d5
0x140716564: movsxd rcx,DWORD PTR [rbp-0x78]
0x140716568: mov    rax,QWORD PTR [r15+0x80]
0x14071656f: movsx  edx,WORD PTR [rax+rcx*2]
0x140716573: test   edx,edx
0x140716575: je     0x1407165c5
0x140716577: sub    edx,0x1
0x14071657a: je     0x1407165b6
0x14071657c: sub    edx,0x1
0x14071657f: je     0x1407165a7
0x140716581: mov    rcx,r14
0x140716584: cmp    edx,0x1
0x140716587: je     0x140716598
0x140716589: mov    r8d,0x7
0x14071658f: lea    rdx,[rip+0xf6f82a]        # 0x141685dc0  'unkempt'
0x140716596: jmp    0x1407165d5
0x140716598: mov    r8d,0x13
0x14071659e: lea    rdx,[rip+0xf6f823]        # 0x141685dc8  'tied in a pony tail'
0x1407165a5: jmp    0x1407165d5
0x1407165a7: mov    r8d,0x19
0x1407165ad: lea    rdx,[rip+0xf6f82c]        # 0x141685de0  'arranged in double braids'
0x1407165b4: jmp    0x1407165d2
0x1407165b6: mov    r8d,0x7
0x1407165bc: lea    rdx,[rip+0xf6f83d]        # 0x141685e00  'braided'
0x1407165c3: jmp    0x1407165d2
0x1407165c5: mov    r8d,0xd
0x1407165cb: lea    rdx,[rip+0xf6f836]        # 0x141685e08  'neatly combed'
0x1407165d2: mov    rcx,r14
0x1407165d5: call   0x14006fa10
0x1407165da: mov    r8d,0x3
0x1407165e0: lea    rdx,[rip+0xee7381]        # 0x1415fd968  '.  '
0x1407165e7: mov    rcx,r14
0x1407165ea: call   0x14006fa10
0x1407165ef: inc    r12d
0x1407165f2: add    rbx,0x4
0x1407165f6: mov    rdx,QWORD PTR [rsi]
0x1407165f9: mov    rax,QWORD PTR [rdx+rdi*8]
0x1407165fd: mov    rcx,QWORD PTR [rax+0xa0]
0x140716604: sub    rcx,QWORD PTR [rax+0x98]
0x14071660b: sar    rcx,0x2
0x14071660f: movsxd rax,r12d
0x140716612: cmp    rax,rcx
0x140716615: jb     0x140716250
0x14071661b: movzx  edi,BYTE PTR [rsp+0x40]
0x140716620: movzx  esi,BYTE PTR [rsp+0x40]
0x140716625: movzx  r14d,BYTE PTR [rsp+0x40]
0x14071662b: movzx  r15d,BYTE PTR [rsp+0x40]
0x140716631: movzx  r12d,BYTE PTR [rsp+0x40]
0x140716637: xor    r13d,r13d
0x14071663a: mov    rax,QWORD PTR [rbp-0x80]
0x14071663e: mov    rax,QWORD PTR [rdx+rax*8]
0x140716642: mov    rcx,QWORD PTR [rax+0xe8]
0x140716649: sub    rcx,QWORD PTR [rax+0xe0]
0x140716650: sar    rcx,0x3
0x140716654: test   rcx,rcx
0x140716657: je     0x140716670
0x140716659: mov    r8d,0x9
0x14071665f: lea    rdx,[rip+0xeebdda]        # 0x141602440  '[C:7:0:0]'
0x140716666: mov    rcx,QWORD PTR [rsp+0x70]
0x14071666b: call   0x14006fa10
0x140716670: mov    rax,QWORD PTR [rbp-0x70]
0x140716674: mov    rdx,QWORD PTR [rax]
0x140716677: mov    rax,QWORD PTR [rbp-0x80]
0x14071667b: mov    rcx,QWORD PTR [rdx+rax*8]
0x14071667f: mov    rax,QWORD PTR [rcx+0xe8]
0x140716686: sub    rax,QWORD PTR [rcx+0xe0]
0x14071668d: sar    rax,0x3
0x140716691: test   rax,rax
0x140716694: je     0x140716a06
0x14071669a: mov    r15,r13
0x14071669d: mov    esi,r13d
0x1407166a0: mov    rdi,QWORD PTR [rsp+0x70]
0x1407166a5: mov    r14,QWORD PTR [rsp+0x50]
0x1407166aa: mov    rbx,QWORD PTR [rbp-0x70]
0x1407166ae: mov    r12,QWORD PTR [rbp-0x80]
0x1407166b2: nop    DWORD PTR [rax+0x0]
0x1407166b6: data16 nop WORD PTR [rax+rax*1+0x0]
0x1407166c0: mov    rax,QWORD PTR [rdx+r12*8]
0x1407166c4: mov    rax,QWORD PTR [rax+0xe0]
0x1407166cb: mov    r13,QWORD PTR [r15+rax*1]
0x1407166cf: mov    QWORD PTR [rsp+0x78],r13
0x1407166d4: lea    rdx,[rbp+0x30]
0x1407166d8: mov    rcx,rdi
0x1407166db: call   0x1400b9d10
0x1407166e0: mov    r8d,0x1
0x1407166e6: lea    rdx,[rip+0xed204f]        # 0x1415e873c  ' '
0x1407166ed: mov    rcx,rdi
0x1407166f0: call   0x14006fa10
0x1407166f5: mov    WORD PTR [rsp+0x20],0x2
0x1407166fc: xor    r9d,r9d
0x1407166ff: movzx  r8d,WORD PTR [r13+0x0]
0x140716704: lea    rdx,[rbp+0x10]
0x140716708: mov    rcx,r14
0x14071670b: call   0x14070c0e0
0x140716710: mov    rax,QWORD PTR [r14+0x48]
0x140716714: movsxd rcx,DWORD PTR [r13+0x0]
0x140716718: mov    rax,QWORD PTR [rax]
0x14071671b: mov    rcx,QWORD PTR [rax+rcx*8]
0x14071671f: mov    r13d,DWORD PTR [rcx+0x84]
0x140716726: lea    rdx,[rbp+0x10]
0x14071672a: mov    rcx,rdi
0x14071672d: call   0x1400b9d10
0x140716732: mov    rcx,rdi
0x140716735: cmp    r13d,0x1
0x140716739: jg     0x14071674a
0x14071673b: mov    r8d,0x6
0x140716741: lea    rdx,[rip+0xf6f670]        # 0x141685db8  ' bears'
0x140716748: jmp    0x140716757
0x14071674a: mov    r8d,0x5
0x140716750: lea    rdx,[rip+0xf6f659]        # 0x141685db0  ' bear'
0x140716757: call   0x14006fa10
0x14071675c: mov    r13,QWORD PTR [rsp+0x78]
0x140716761: mov    eax,DWORD PTR [r13+0x10]
0x140716765: cmp    eax,0x5
0x140716768: jl     0x140716779
0x14071676a: mov    r8d,0x37
0x140716770: lea    rdx,[rip+0xf6f601]        # 0x141685d78  ' the marks of numerous old wounds, the chief among them'
0x140716777: jmp    0x14071678b
0x140716779: cmp    eax,0x1
0x14071677c: jle    0x140716793
0x14071677e: mov    r8d,0x23
0x140716784: lea    rdx,[rip+0xf6f5c5]        # 0x141685d50  ' the marks of old wounds, including'
0x14071678b: mov    rcx,rdi
0x14071678e: call   0x14006fa10
0x140716793: mov    r8d,0x3
0x140716799: lea    rdx,[rip+0xf6f5ac]        # 0x141685d4c  ' a '
0x1407167a0: mov    rcx,rdi
0x1407167a3: call   0x14006fa10
0x1407167a8: mov    ecx,DWORD PTR [r13+0x4]
0x1407167ac: movzx  eax,WORD PTR [r13+0x8]
0x1407167b1: test   cl,0x4
0x1407167b4: je     0x140716874
0x1407167ba: test   ax,ax
0x1407167bd: js     0x140716831
0x1407167bf: cmp    ax,0x5a
0x1407167c3: jge    0x140716831
0x1407167c5: cmp    ax,0x4b
0x1407167c9: jl     0x1407167da
0x1407167cb: mov    r8d,0xa
0x1407167d1: lea    rdx,[rip+0xf6f558]        # 0x141685d30  'very long '
0x1407167d8: jmp    0x14071683e
0x1407167da: cmp    ax,0x3c
0x1407167de: jl     0x1407167ef
0x1407167e0: mov    r8d,0x5
0x1407167e6: lea    rdx,[rip+0xf6f537]        # 0x141685d24  'long '
0x1407167ed: jmp    0x14071683e
0x1407167ef: cmp    ax,0x28
0x1407167f3: jg     0x140716846
0x1407167f5: cmp    ax,0x19
0x1407167f9: jle    0x14071680a
0x1407167fb: mov    r8d,0x6
0x140716801: lea    rdx,[rip+0xf6f514]        # 0x141685d1c  'short '
0x140716808: jmp    0x14071683e
0x14071680a: mov    rcx,rdi
0x14071680d: cmp    ax,0xa
0x140716811: jle    0x140716822
0x140716813: mov    r8d,0xb
0x140716819: lea    rdx,[rip+0xf6f4f0]        # 0x141685d10  'very short '
0x140716820: jmp    0x140716841
0x140716822: mov    r8d,0x5
0x140716828: lea    rdx,[rip+0xf6fac9]        # 0x1416862f8  'tiny '
0x14071682f: jmp    0x140716841
0x140716831: mov    r8d,0x8
0x140716837: lea    rdx,[rip+0xf6f502]        # 0x141685d40  'massive '
0x14071683e: mov    rcx,rdi
0x140716841: call   0x14006fa10
0x140716846: mov    rcx,rdi
0x140716849: cmp    DWORD PTR [r13+0xc],0x32
0x14071684e: jl     0x140716862
0x140716850: mov    r8d,0xf
0x140716856: lea    rdx,[rip+0xf6fa8b]        # 0x1416862e8  'curving scar.  '
0x14071685d: jmp    0x1407169ba
0x140716862: mov    r8d,0x10
0x140716868: lea    rdx,[rip+0xf6fa61]        # 0x1416862d0  'straight scar.  '
0x14071686f: jmp    0x1407169ba
0x140716874: test   ecx,0x100008
0x14071687a: je     0x14071691e
0x140716880: test   ax,ax
0x140716883: js     0x1407168f7
0x140716885: cmp    ax,0x5a
0x140716889: jge    0x1407168f7
0x14071688b: cmp    ax,0x4b
0x14071688f: jl     0x1407168a0
0x140716891: mov    r8d,0xb
0x140716897: lea    rdx,[rip+0xf6fa1a]        # 0x1416862b8  'very large '
0x14071689e: jmp    0x140716904
0x1407168a0: cmp    ax,0x3c
0x1407168a4: jl     0x1407168b5
0x1407168a6: mov    r8d,0x6
0x1407168ac: lea    rdx,[rip+0xf33a15]        # 0x14164a2c8  'large '
0x1407168b3: jmp    0x140716904
0x1407168b5: cmp    ax,0x28
0x1407168b9: jg     0x14071690c
0x1407168bb: cmp    ax,0x19
0x1407168bf: jle    0x1407168d0
0x1407168c1: mov    r8d,0x6
0x1407168c7: lea    rdx,[rip+0xf6f9de]        # 0x1416862ac  'small '
0x1407168ce: jmp    0x140716904
0x1407168d0: mov    rcx,rdi
0x1407168d3: cmp    ax,0xa
0x1407168d7: jle    0x1407168e8
0x1407168d9: mov    r8d,0xb
0x1407168df: lea    rdx,[rip+0xf6f9ba]        # 0x1416862a0  'very small '
0x1407168e6: jmp    0x140716907
0x1407168e8: mov    r8d,0x5
0x1407168ee: lea    rdx,[rip+0xf6fa03]        # 0x1416862f8  'tiny '
0x1407168f5: jmp    0x140716907
0x1407168f7: mov    r8d,0x5
0x1407168fd: lea    rdx,[rip+0xf6f9c0]        # 0x1416862c4  'huge '
0x140716904: mov    rcx,rdi
0x140716907: call   0x14006fa10
0x14071690c: mov    r8d,0x7
0x140716912: lea    rdx,[rip+0xf6f97f]        # 0x141686298  'dent.  '
0x140716919: jmp    0x1407169b7
0x14071691e: test   ax,ax
0x140716921: js     0x140716995
0x140716923: cmp    ax,0x5a
0x140716927: jge    0x140716995
0x140716929: cmp    ax,0x4b
0x14071692d: jl     0x14071693e
0x14071692f: mov    r8d,0xa
0x140716935: lea    rdx,[rip+0xf6f3f4]        # 0x141685d30  'very long '
0x14071693c: jmp    0x1407169a2
0x14071693e: cmp    ax,0x3c
0x140716942: jl     0x140716953
0x140716944: mov    r8d,0x5
0x14071694a: lea    rdx,[rip+0xf6f3d3]        # 0x141685d24  'long '
0x140716951: jmp    0x1407169a2
0x140716953: cmp    ax,0x28
0x140716957: jg     0x1407169aa
0x140716959: cmp    ax,0x19
0x14071695d: jle    0x14071696e
0x14071695f: mov    r8d,0x6
0x140716965: lea    rdx,[rip+0xf6f3b0]        # 0x141685d1c  'short '
0x14071696c: jmp    0x1407169a2
0x14071696e: mov    rcx,rdi
0x140716971: cmp    ax,0xa
0x140716975: jle    0x140716986
0x140716977: mov    r8d,0xb
0x14071697d: lea    rdx,[rip+0xf6f38c]        # 0x141685d10  'very short '
0x140716984: jmp    0x1407169a5
0x140716986: mov    r8d,0x5
0x14071698c: lea    rdx,[rip+0xf6f965]        # 0x1416862f8  'tiny '
0x140716993: jmp    0x1407169a5
0x140716995: mov    r8d,0x8
0x14071699b: lea    rdx,[rip+0xf6f39e]        # 0x141685d40  'massive '
0x1407169a2: mov    rcx,rdi
0x1407169a5: call   0x14006fa10
0x1407169aa: mov    r8d,0xe
0x1407169b0: lea    rdx,[rip+0xf6f8d1]        # 0x141686288  'jagged scar.  '
0x1407169b7: mov    rcx,rdi
0x1407169ba: call   0x14006fa10
0x1407169bf: inc    esi
0x1407169c1: add    r15,0x8
0x1407169c5: mov    rdx,QWORD PTR [rbx]
0x1407169c8: mov    rax,QWORD PTR [rdx+r12*8]
0x1407169cc: mov    rcx,QWORD PTR [rax+0xe8]
0x1407169d3: sub    rcx,QWORD PTR [rax+0xe0]
0x1407169da: sar    rcx,0x3
0x1407169de: movsxd rax,esi
0x1407169e1: cmp    rax,rcx
0x1407169e4: jb     0x1407166c0
0x1407169ea: movzx  edi,BYTE PTR [rsp+0x40]
0x1407169ef: movzx  esi,BYTE PTR [rsp+0x40]
0x1407169f4: movzx  r14d,BYTE PTR [rsp+0x40]
0x1407169fa: movzx  r15d,BYTE PTR [rsp+0x40]
0x140716a00: movzx  r12d,BYTE PTR [rsp+0x40]
0x140716a06: mov    rax,QWORD PTR [rbp-0x80]
0x140716a0a: mov    rax,QWORD PTR [rdx+rax*8]
0x140716a0e: mov    rcx,QWORD PTR [rax+0xe8]
0x140716a15: sub    rcx,QWORD PTR [rax+0xe0]
0x140716a1c: sar    rcx,0x3
0x140716a20: mov    r13,QWORD PTR [rsp+0x70]
0x140716a25: test   rcx,rcx
0x140716a28: je     0x140716a40
0x140716a2a: mov    r8d,0x9
0x140716a30: lea    rdx,[rip+0xeeb9f9]        # 0x141602430  '[C:7:0:1]'
0x140716a37: mov    rcx,r13
0x140716a3a: call   0x14006fa10
0x140716a3f: nop
0x140716a40: lea    rcx,[rbp+0x90]
0x140716a47: call   0x14006f850
0x140716a4c: nop
0x140716a4d: lea    rcx,[rbp+0x10]
0x140716a51: call   0x14006f850
0x140716a56: jmp    0x140712d4d
