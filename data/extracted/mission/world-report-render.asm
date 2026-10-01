0x1401c17e0: mov    QWORD PTR [rsp+0x10],rbx
0x1401c17e5: mov    QWORD PTR [rsp+0x18],rsi
0x1401c17ea: mov    QWORD PTR [rsp+0x20],rdi
0x1401c17ef: push   rbp
0x1401c17f0: push   r12
0x1401c17f2: push   r13
0x1401c17f4: push   r14
0x1401c17f6: push   r15
0x1401c17f8: lea    rbp,[rsp-0x38c0]
0x1401c1800: mov    eax,0x39c0
0x1401c1805: call   0x14153adc0
0x1401c180a: sub    rsp,rax
0x1401c180d: mov    rax,QWORD PTR [rip+0x16da82c]        # 0x14189c040
0x1401c1814: xor    rax,rsp
0x1401c1817: mov    QWORD PTR [rbp+0x38b0],rax
0x1401c181e: mov    r13,rcx
0x1401c1821: mov    QWORD PTR [rsp+0x78],rcx
0x1401c1826: mov    BYTE PTR [rip+0x2488e2b],0x0        # 0x14264a658
0x1401c182d: mov    DWORD PTR [rip+0x2488e25],0xffffffff        # 0x14264a65c
0x1401c1837: cmp    BYTE PTR [rip+0x2488e36],0x0        # 0x14264a674
0x1401c183e: jne    0x1401d37ea
0x1401c1844: mov    ebx,0x2
0x1401c1849: cmp    BYTE PTR [rip+0x2488e25],0x0        # 0x14264a675
0x1401c1850: je     0x1401c1876
0x1401c1852: mov    rax,QWORD PTR [rip+0x2488c0f]        # 0x14264a468
0x1401c1859: test   rax,rax
0x1401c185c: je     0x1401c1861
0x1401c185e: or     DWORD PTR [rax],0x1
0x1401c1861: mov    BYTE PTR [rip+0x2488e0d],0x0        # 0x14264a675
0x1401c1868: mov    edx,ebx
0x1401c186a: lea    rcx,[rip+0x2488b7f]        # 0x14264a3f0
0x1401c1871: call   0x140ae7c00
0x1401c1876: cmp    BYTE PTR [rip+0x16e5d3b],0x0        # 0x1418a75b8
0x1401c187d: setne  BYTE PTR [rip+0x2488d8c]        # 0x14264a610
0x1401c1884: mov    DWORD PTR [rbp-0x38],0xffffffff
0x1401c188b: mov    DWORD PTR [rbp-0x3c],0xffffffff
0x1401c1892: cmp    BYTE PTR [rip+0x21ced3c],0x0        # 0x1423905d5
0x1401c1899: je     0x1401c18af
0x1401c189b: lea    r8,[rbp-0x3c]
0x1401c189f: lea    rdx,[rbp-0x38]
0x1401c18a3: lea    rcx,[rip+0x2488b46]        # 0x14264a3f0
0x1401c18aa: call   0x1400bb340
0x1401c18af: lea    r8,[rbp-0x18]
0x1401c18b3: lea    rdx,[rbp+0x1b8]
0x1401c18ba: lea    rcx,[rip+0x16dfd0f]        # 0x1418a15d0
0x1401c18c1: call   0x14041f640
0x1401c18c6: xor    r8d,r8d
0x1401c18c9: mov    dl,0xff
0x1401c18cb: xor    ecx,ecx
0x1401c18cd: call   0x1408be780
0x1401c18d2: xor    edx,edx
0x1401c18d4: lea    rcx,[rip+0x220be95]        # 0x1423cd770
0x1401c18db: call   0x140071f90
0x1401c18e0: test   al,al
0x1401c18e2: je     0x1401c1a1c
0x1401c18e8: xor    esi,esi
0x1401c18ea: mov    QWORD PTR [rbp-0x78],rsi
0x1401c18ee: cmp    QWORD PTR [rip+0x2488b73],rsi        # 0x14264a468
0x1401c18f5: je     0x1401c1b3e
0x1401c18fb: lea    rcx,[rbp+0x9b0]
0x1401c1902: call   0x1400bbf90
0x1401c1907: mov    eax,DWORD PTR [r13+0x1b4]
0x1401c190e: cmp    eax,0x4
0x1401c1911: jne    0x1401c194f
0x1401c1913: mov    DWORD PTR [r13+0x550],esi
0x1401c191a: lea    rax,[r13+0x458]
0x1401c1921: mov    DWORD PTR [rsp+0x58],esi
0x1401c1925: mov    DWORD PTR [rsp+0x50],esi
0x1401c1929: mov    QWORD PTR [rsp+0x48],rax
0x1401c192e: mov    BYTE PTR [rsp+0x40],sil
0x1401c1933: mov    BYTE PTR [rsp+0x38],sil
0x1401c1938: mov    eax,DWORD PTR [rip+0x21d1d32]        # 0x142393670
0x1401c193e: mov    DWORD PTR [rsp+0x30],eax
0x1401c1942: mov    DWORD PTR [rsp+0x28],0x17
0x1401c194a: jmp    0x1401c19f1
0x1401c194f: cmp    eax,0x5
0x1401c1952: jne    0x1401c19c1
0x1401c1954: mov    rax,QWORD PTR [r13+0x8368]
0x1401c195b: test   rax,rax
0x1401c195e: je     0x1401c19c1
0x1401c1960: mov    QWORD PTR [rbp+0x9c8],rax
0x1401c1967: mov    eax,DWORD PTR [r13+0x8378]
0x1401c196e: mov    DWORD PTR [rbp+0x9d0],eax
0x1401c1974: mov    eax,DWORD PTR [r13+0x837c]
0x1401c197b: mov    DWORD PTR [rbp+0x9d4],eax
0x1401c1981: mov    DWORD PTR [rsp+0x58],esi
0x1401c1985: mov    DWORD PTR [rsp+0x50],esi
0x1401c1989: lea    rax,[rbp+0x9b0]
0x1401c1990: mov    QWORD PTR [rsp+0x48],rax
0x1401c1995: mov    BYTE PTR [rsp+0x40],sil
0x1401c199a: mov    BYTE PTR [rsp+0x38],sil
0x1401c199f: mov    eax,DWORD PTR [rip+0x21d1ccb]        # 0x142393670
0x1401c19a5: mov    DWORD PTR [rsp+0x30],eax
0x1401c19a9: mov    DWORD PTR [rsp+0x28],0x17
0x1401c19b1: mov    r9d,DWORD PTR [r13+0x8374]
0x1401c19b8: mov    r8d,DWORD PTR [r13+0x8370]
0x1401c19bf: jmp    0x1401c19ff
0x1401c19c1: mov    DWORD PTR [rsp+0x58],esi
0x1401c19c5: mov    DWORD PTR [rsp+0x50],esi
0x1401c19c9: lea    rax,[rbp+0x9b0]
0x1401c19d0: mov    QWORD PTR [rsp+0x48],rax
0x1401c19d5: mov    BYTE PTR [rsp+0x40],sil
0x1401c19da: mov    BYTE PTR [rsp+0x38],sil
0x1401c19df: mov    eax,DWORD PTR [rip+0x21d1c8b]        # 0x142393670
0x1401c19e5: mov    DWORD PTR [rsp+0x30],eax
0x1401c19e9: mov    DWORD PTR [rsp+0x28],0x18
0x1401c19f1: mov    r9d,DWORD PTR [r13+0x19c]
0x1401c19f8: mov    r8d,DWORD PTR [r13+0x198]
0x1401c19ff: mov    BYTE PTR [rsp+0x20],0x1
0x1401c1a04: mov    rdx,QWORD PTR [rip+0x2488a5d]        # 0x14264a468
0x1401c1a0b: mov    rcx,QWORD PTR [rip+0x232a146]        # 0x1424ebb58
0x1401c1a12: call   0x1402f3a70
0x1401c1a17: jmp    0x1401c1b3e
0x1401c1a1c: lea    rcx,[rbp+0xb50]
0x1401c1a23: call   0x1400bbf90
0x1401c1a28: mov    eax,DWORD PTR [r13+0x1b4]
0x1401c1a2f: cmp    eax,0x4
0x1401c1a32: jne    0x1401c1a6a
0x1401c1a34: xor    esi,esi
0x1401c1a36: mov    DWORD PTR [r13+0x550],esi
0x1401c1a3d: lea    rax,[r13+0x458]
0x1401c1a44: mov    QWORD PTR [rsp+0x60],rax
0x1401c1a49: mov    BYTE PTR [rsp+0x58],sil
0x1401c1a4e: mov    BYTE PTR [rsp+0x50],sil
0x1401c1a53: mov    eax,DWORD PTR [rip+0x21d1c17]        # 0x142393670
0x1401c1a59: mov    DWORD PTR [rsp+0x48],eax
0x1401c1a5d: mov    DWORD PTR [rsp+0x40],0x17
0x1401c1a65: jmp    0x1401c1b00
0x1401c1a6a: cmp    eax,0x5
0x1401c1a6d: jne    0x1401c1ad6
0x1401c1a6f: mov    rax,QWORD PTR [r13+0x8368]
0x1401c1a76: test   rax,rax
0x1401c1a79: je     0x1401c1ad6
0x1401c1a7b: mov    QWORD PTR [rbp+0xb68],rax
0x1401c1a82: mov    eax,DWORD PTR [r13+0x8378]
0x1401c1a89: mov    DWORD PTR [rbp+0xb70],eax
0x1401c1a8f: mov    eax,DWORD PTR [r13+0x837c]
0x1401c1a96: mov    DWORD PTR [rbp+0xb74],eax
0x1401c1a9c: lea    rax,[rbp+0xb50]
0x1401c1aa3: mov    QWORD PTR [rsp+0x60],rax
0x1401c1aa8: mov    BYTE PTR [rsp+0x58],0x0
0x1401c1aad: mov    BYTE PTR [rsp+0x50],0x0
0x1401c1ab2: mov    eax,DWORD PTR [rip+0x21d1bb8]        # 0x142393670
0x1401c1ab8: mov    DWORD PTR [rsp+0x48],eax
0x1401c1abc: mov    DWORD PTR [rsp+0x40],0x17
0x1401c1ac4: xor    esi,esi
0x1401c1ac6: mov    r8d,DWORD PTR [r13+0x8374]
0x1401c1acd: mov    edx,DWORD PTR [r13+0x8370]
0x1401c1ad4: jmp    0x1401c1b0e
0x1401c1ad6: lea    rax,[rbp+0xb50]
0x1401c1add: mov    QWORD PTR [rsp+0x60],rax
0x1401c1ae2: mov    BYTE PTR [rsp+0x58],0x0
0x1401c1ae7: mov    BYTE PTR [rsp+0x50],0x0
0x1401c1aec: mov    eax,DWORD PTR [rip+0x21d1b7e]        # 0x142393670
0x1401c1af2: mov    DWORD PTR [rsp+0x48],eax
0x1401c1af6: mov    DWORD PTR [rsp+0x40],0x18
0x1401c1afe: xor    esi,esi
0x1401c1b00: mov    r8d,DWORD PTR [r13+0x19c]
0x1401c1b07: mov    edx,DWORD PTR [r13+0x198]
0x1401c1b0e: mov    BYTE PTR [rsp+0x38],0x1
0x1401c1b13: mov    eax,DWORD PTR [rip+0x220bc6f]        # 0x1423cd788
0x1401c1b19: mov    DWORD PTR [rsp+0x30],eax
0x1401c1b1d: mov    eax,DWORD PTR [rip+0x220bc61]        # 0x1423cd784
0x1401c1b23: mov    DWORD PTR [rsp+0x28],eax
0x1401c1b27: mov    QWORD PTR [rbp-0x78],rsi
0x1401c1b2b: mov    DWORD PTR [rsp+0x20],esi
0x1401c1b2f: xor    r9d,r9d
0x1401c1b32: mov    rcx,QWORD PTR [rip+0x232a01f]        # 0x1424ebb58
0x1401c1b39: call   0x140f5dcf0
0x1401c1b3e: mov    eax,0x1b4
0x1401c1b43: mov    rcx,r13
0x1401c1b46: movsxd rdx,DWORD PTR [rax+rcx*1]
0x1401c1b4a: cmp    edx,0x8
0x1401c1b4d: ja     0x1401c6068
0x1401c1b53: lea    rcx,[rip+0xffffffffffe3e4a6]        # 0x140000000
0x1401c1b5a: mov    eax,DWORD PTR [rcx+rdx*4+0x1d381c]
0x1401c1b61: add    rax,rcx
0x1401c1b64: jmp    rax
0x1401c1b66: cmp    BYTE PTR [rip+0x21cea68],0x0        # 0x1423905d5
0x1401c1b6d: je     0x1401c6068
0x1401c1b73: lea    r8,[rbp+0x38]
0x1401c1b77: lea    rdx,[rbp+0xd0]
0x1401c1b7e: lea    rcx,[rip+0x248886b]        # 0x14264a3f0
0x1401c1b85: call   0x1400bb340
0x1401c1b8a: lea    r8,[rbp+0xd8]
0x1401c1b91: lea    rdx,[rbp+0xe4]
0x1401c1b98: lea    rcx,[rip+0x2488851]        # 0x14264a3f0
0x1401c1b9f: call   0x14014d5d0
0x1401c1ba4: xor    edx,edx
0x1401c1ba6: lea    rcx,[rip+0x220bbc3]        # 0x1423cd770
0x1401c1bad: call   0x140071f90
0x1401c1bb2: test   al,al
0x1401c1bb4: je     0x1401c1bfe
0x1401c1bb6: mov    rax,QWORD PTR [rip+0x24888ab]        # 0x14264a468
0x1401c1bbd: mov    ecx,DWORD PTR [rax+0x4]
0x1401c1bc0: mov    r8d,DWORD PTR [rax+0x8]
0x1401c1bc4: sar    ecx,1
0x1401c1bc6: mov    eax,DWORD PTR [rbp+0xe4]
0x1401c1bcc: cdq
0x1401c1bcd: and    edx,0xf
0x1401c1bd0: lea    ebx,[rdx+rax*1]
0x1401c1bd3: sar    ebx,0x4
0x1401c1bd6: sub    ebx,ecx
0x1401c1bd8: add    ebx,DWORD PTR [r13+0x198]
0x1401c1bdf: sar    r8d,1
0x1401c1be2: mov    eax,DWORD PTR [rbp+0xd8]
0x1401c1be8: cdq
0x1401c1be9: and    edx,0xf
0x1401c1bec: lea    ecx,[rdx+rax*1]
0x1401c1bef: sar    ecx,0x4
0x1401c1bf2: sub    ecx,r8d
0x1401c1bf5: add    ecx,DWORD PTR [r13+0x19c]
0x1401c1bfc: jmp    0x1401c1c29
0x1401c1bfe: mov    eax,DWORD PTR [rip+0x220bb80]        # 0x1423cd784
0x1401c1c04: sar    eax,1
0x1401c1c06: mov    ebx,DWORD PTR [r13+0x198]
0x1401c1c0d: sub    ebx,eax
0x1401c1c0f: add    ebx,DWORD PTR [rbp+0xd0]
0x1401c1c15: mov    eax,DWORD PTR [rip+0x220bb6d]        # 0x1423cd788
0x1401c1c1b: sar    eax,1
0x1401c1c1d: mov    ecx,DWORD PTR [r13+0x19c]
0x1401c1c24: sub    ecx,eax
0x1401c1c26: add    ecx,DWORD PTR [rbp+0x38]
0x1401c1c29: mov    DWORD PTR [rbp-0x48],ecx
0x1401c1c2c: mov    DWORD PTR [rbp-0x58],ebx
0x1401c1c2f: test   ebx,ebx
0x1401c1c31: js     0x1401c6068
0x1401c1c37: mov    rax,QWORD PTR [rip+0x2329f1a]        # 0x1424ebb58
0x1401c1c3e: cmp    ebx,DWORD PTR [rax+0xa0]
0x1401c1c44: jge    0x1401c6068
0x1401c1c4a: test   ecx,ecx
0x1401c1c4c: js     0x1401c6068
0x1401c1c52: cmp    ecx,DWORD PTR [rax+0xa4]
0x1401c1c58: jge    0x1401c6068
0x1401c1c5e: mov    r8d,ecx
0x1401c1c61: mov    edx,ebx
0x1401c1c63: mov    rcx,r13
0x1401c1c66: call   0x1401d84f0
0x1401c1c6b: mov    esi,DWORD PTR [rbp-0x18]
0x1401c1c6e: mov    DWORD PTR [rsp+0x74],esi
0x1401c1c72: lea    r15d,[rsi-0x37]
0x1401c1c76: mov    DWORD PTR [rsp+0x70],r15d
0x1401c1c7b: lea    r14d,[r15-0x2]
0x1401c1c7f: mov    r12d,0x14
0x1401c1c85: mov    QWORD PTR [rbp-0x60],r12
0x1401c1c89: mov    eax,DWORD PTR [rip+0x220baf9]        # 0x1423cd788
0x1401c1c8f: cmp    eax,0x2e
0x1401c1c92: jle    0x1401c1cba
0x1401c1c94: lea    r12d,[rax-0x1a]
0x1401c1c98: mov    QWORD PTR [rbp-0x60],r12
0x1401c1c9c: cmp    r12d,0x1e
0x1401c1ca0: jle    0x1401c1cba
0x1401c1ca2: mov    eax,0x1e
0x1401c1ca7: mov    DWORD PTR [rbp-0x6c],eax
0x1401c1caa: mov    r12d,eax
0x1401c1cad: mov    QWORD PTR [rbp-0x60],r12
0x1401c1cb1: mov    edi,esi
0x1401c1cb3: xor    eax,eax
0x1401c1cb5: mov    r13d,eax
0x1401c1cb8: jmp    0x1401c1cce
0x1401c1cba: mov    DWORD PTR [rbp-0x6c],r12d
0x1401c1cbe: mov    edi,esi
0x1401c1cc0: xor    eax,eax
0x1401c1cc2: mov    r13d,eax
0x1401c1cc5: test   r12d,r12d
0x1401c1cc8: js     0x1401c1dae
0x1401c1cce: mov    r15,rax
0x1401c1cd1: mov    ebx,r14d
0x1401c1cd4: cmp    r14d,edi
0x1401c1cd7: jg     0x1401c1d93
0x1401c1cdd: movsxd rax,r12d
0x1401c1ce0: mov    rsi,rax
0x1401c1ce3: mov    r8d,ebx
0x1401c1ce6: mov    edx,r13d
0x1401c1ce9: lea    rcx,[rip+0x2488700]        # 0x14264a3f0
0x1401c1cf0: call   0x1400bb120
0x1401c1cf5: xor    r8d,r8d
0x1401c1cf8: xor    edx,edx
0x1401c1cfa: lea    rcx,[rip+0x24886ef]        # 0x14264a3f0
0x1401c1d01: call   0x1400bb190
0x1401c1d06: test   r15,r15
0x1401c1d09: jne    0x1401c1d33
0x1401c1d0b: cmp    ebx,r14d
0x1401c1d0e: jne    0x1401c1d18
0x1401c1d10: mov    edx,DWORD PTR [rip+0x2489ffe]        # 0x14264bd14
0x1401c1d16: jmp    0x1401c1d7d
0x1401c1d18: lea    rcx,[rip+0x24886d1]        # 0x14264a3f0
0x1401c1d1f: cmp    ebx,edi
0x1401c1d21: jne    0x1401c1d2b
0x1401c1d23: mov    edx,DWORD PTR [rip+0x248a003]        # 0x14264bd2c
0x1401c1d29: jmp    0x1401c1d84
0x1401c1d2b: mov    edx,DWORD PTR [rip+0x2489fef]        # 0x14264bd20
0x1401c1d31: jmp    0x1401c1d84
0x1401c1d33: cmp    r15,rsi
0x1401c1d36: jne    0x1401c1d60
0x1401c1d38: cmp    ebx,r14d
0x1401c1d3b: jne    0x1401c1d45
0x1401c1d3d: mov    edx,DWORD PTR [rip+0x2489fd9]        # 0x14264bd1c
0x1401c1d43: jmp    0x1401c1d7d
0x1401c1d45: lea    rcx,[rip+0x24886a4]        # 0x14264a3f0
0x1401c1d4c: cmp    ebx,edi
0x1401c1d4e: jne    0x1401c1d58
0x1401c1d50: mov    edx,DWORD PTR [rip+0x2489fde]        # 0x14264bd34
0x1401c1d56: jmp    0x1401c1d84
0x1401c1d58: mov    edx,DWORD PTR [rip+0x2489fca]        # 0x14264bd28
0x1401c1d5e: jmp    0x1401c1d84
0x1401c1d60: cmp    ebx,r14d
0x1401c1d63: jne    0x1401c1d6d
0x1401c1d65: mov    edx,DWORD PTR [rip+0x2489fad]        # 0x14264bd18
0x1401c1d6b: jmp    0x1401c1d7d
0x1401c1d6d: cmp    ebx,edi
0x1401c1d6f: mov    edx,DWORD PTR [rip+0x2489fbb]        # 0x14264bd30
0x1401c1d75: je     0x1401c1d7d
0x1401c1d77: mov    edx,DWORD PTR [rip+0x2489fa7]        # 0x14264bd24
0x1401c1d7d: lea    rcx,[rip+0x248866c]        # 0x14264a3f0
0x1401c1d84: call   0x140adaad0
0x1401c1d89: inc    ebx
0x1401c1d8b: cmp    ebx,edi
0x1401c1d8d: jle    0x1401c1ce3
0x1401c1d93: inc    r13d
0x1401c1d96: inc    r15
0x1401c1d99: cmp    r13d,r12d
0x1401c1d9c: jle    0x1401c1cd1
0x1401c1da2: mov    esi,DWORD PTR [rsp+0x74]
0x1401c1da6: mov    r15d,DWORD PTR [rsp+0x70]
0x1401c1dab: mov    ebx,DWORD PTR [rbp-0x58]
0x1401c1dae: xor    r8d,r8d
0x1401c1db1: mov    edx,0x7
0x1401c1db6: mov    r9b,0x1
0x1401c1db9: lea    rcx,[rip+0x2488630]        # 0x14264a3f0
0x1401c1dc0: call   0x1400bb130
0x1401c1dc5: mov    edi,0x1
0x1401c1dca: mov    r13d,edi
0x1401c1dcd: lea    rcx,[rbp+0xff0]
0x1401c1dd4: call   0x14006f690
0x1401c1dd9: nop
0x1401c1dda: mov    r8d,r15d
0x1401c1ddd: mov    edx,edi
0x1401c1ddf: lea    rcx,[rip+0x248860a]        # 0x14264a3f0
0x1401c1de6: call   0x1400bb120
0x1401c1deb: mov    edi,DWORD PTR [rbp-0x48]
0x1401c1dee: mov    r8d,edi
0x1401c1df1: mov    edx,ebx
0x1401c1df3: mov    rcx,QWORD PTR [rip+0x2329d5e]        # 0x1424ebb58
0x1401c1dfa: call   0x1401bc260
0x1401c1dff: test   rax,rax
0x1401c1e02: je     0x1401c1eb7
0x1401c1e08: xor    r9d,r9d
0x1401c1e0b: mov    r8b,0x1
0x1401c1e0e: lea    rdx,[rbp+0xff0]
0x1401c1e15: mov    rcx,rax
0x1401c1e18: call   0x140a946e0
0x1401c1e1d: sub    esi,r14d
0x1401c1e20: lea    rcx,[rbp+0xff0]
0x1401c1e27: call   0x14006f330
0x1401c1e2c: lea    ecx,[rsi-0x7]
0x1401c1e2f: movsxd rdx,ecx
0x1401c1e32: cmp    rax,rdx
0x1401c1e35: jb     0x1401c1e9c
0x1401c1e37: lea    r14d,[rsi-0x8]
0x1401c1e3b: test   r14d,r14d
0x1401c1e3e: js     0x1401c1e56
0x1401c1e40: movsxd rdx,esi
0x1401c1e43: sub    rdx,0x8
0x1401c1e47: xor    r8d,r8d
0x1401c1e4a: lea    rcx,[rbp+0xff0]
0x1401c1e51: call   0x1400e1230
0x1401c1e56: cmp    r14d,0x3
0x1401c1e5a: jle    0x1401c1e9c
0x1401c1e5c: movsxd rdx,esi
0x1401c1e5f: sub    rdx,0xb
0x1401c1e63: lea    rcx,[rbp+0xff0]
0x1401c1e6a: call   0x1400fb540
0x1401c1e6f: mov    BYTE PTR [rax],0x2e
0x1401c1e72: lea    eax,[rsi-0xa]
0x1401c1e75: movsxd rdx,eax
0x1401c1e78: lea    rcx,[rbp+0xff0]
0x1401c1e7f: call   0x1400fb540
0x1401c1e84: mov    BYTE PTR [rax],0x2e
0x1401c1e87: lea    eax,[rsi-0x9]
0x1401c1e8a: movsxd rdx,eax
0x1401c1e8d: lea    rcx,[rbp+0xff0]
0x1401c1e94: call   0x1400fb540
0x1401c1e99: mov    BYTE PTR [rax],0x2e
0x1401c1e9c: xor    r9d,r9d
0x1401c1e9f: xor    r8d,r8d
0x1401c1ea2: lea    rdx,[rbp+0xff0]
0x1401c1ea9: lea    rcx,[rip+0x2488540]        # 0x14264a3f0
0x1401c1eb0: call   0x140ad9960
0x1401c1eb5: jmp    0x1401c1ebd
0x1401c1eb7: xor    r13d,r13d
0x1401c1eba: sub    esi,r14d
0x1401c1ebd: lea    rcx,[rbp+0xff0]
0x1401c1ec4: call   0x140067e30
0x1401c1ec9: lea    rcx,[rbp+0x1010]
0x1401c1ed0: call   0x14006f690
0x1401c1ed5: nop
0x1401c1ed6: lea    edx,[r13+0x1]
0x1401c1eda: mov    r8d,r15d
0x1401c1edd: lea    rcx,[rip+0x248850c]        # 0x14264a3f0
0x1401c1ee4: call   0x1400bb120
0x1401c1ee9: mov    r8d,edi
0x1401c1eec: mov    edx,ebx
0x1401c1eee: mov    rcx,QWORD PTR [rip+0x2329c63]        # 0x1424ebb58
0x1401c1ef5: call   0x1401bc1f0
0x1401c1efa: test   rax,rax
0x1401c1efd: je     0x1401c1fae
0x1401c1f03: xor    r9d,r9d
0x1401c1f06: mov    r8b,0x1
0x1401c1f09: lea    rdx,[rbp+0x1010]
0x1401c1f10: mov    rcx,rax
0x1401c1f13: call   0x140a946e0
0x1401c1f18: lea    rcx,[rbp+0x1010]
0x1401c1f1f: call   0x14006f330
0x1401c1f24: lea    ecx,[rsi-0x7]
0x1401c1f27: movsxd rdx,ecx
0x1401c1f2a: cmp    rax,rdx
0x1401c1f2d: jb     0x1401c1f94
0x1401c1f2f: lea    r14d,[rsi-0x8]
0x1401c1f33: test   r14d,r14d
0x1401c1f36: js     0x1401c1f4e
0x1401c1f38: movsxd rdx,esi
0x1401c1f3b: sub    rdx,0x8
0x1401c1f3f: xor    r8d,r8d
0x1401c1f42: lea    rcx,[rbp+0x1010]
0x1401c1f49: call   0x1400e1230
0x1401c1f4e: cmp    r14d,0x3
0x1401c1f52: jle    0x1401c1f94
0x1401c1f54: movsxd rdx,esi
0x1401c1f57: sub    rdx,0xb
0x1401c1f5b: lea    rcx,[rbp+0x1010]
0x1401c1f62: call   0x1400fb540
0x1401c1f67: mov    BYTE PTR [rax],0x2e
0x1401c1f6a: lea    eax,[rsi-0xa]
0x1401c1f6d: movsxd rdx,eax
0x1401c1f70: lea    rcx,[rbp+0x1010]
0x1401c1f77: call   0x1400fb540
0x1401c1f7c: mov    BYTE PTR [rax],0x2e
0x1401c1f7f: lea    eax,[rsi-0x9]
0x1401c1f82: movsxd rdx,eax
0x1401c1f85: lea    rcx,[rbp+0x1010]
0x1401c1f8c: call   0x1400fb540
0x1401c1f91: mov    BYTE PTR [rax],0x2e
0x1401c1f94: xor    r9d,r9d
0x1401c1f97: xor    r8d,r8d
0x1401c1f9a: lea    rdx,[rbp+0x1010]
0x1401c1fa1: lea    rcx,[rip+0x2488448]        # 0x14264a3f0
0x1401c1fa8: call   0x140ad9960
0x1401c1fad: nop
0x1401c1fae: lea    rcx,[rbp+0x1010]
0x1401c1fb5: call   0x140067e30
0x1401c1fba: mov    rcx,QWORD PTR [rip+0x21d822f]        # 0x14239a1f0
0x1401c1fc1: movsx  eax,WORD PTR [rcx+0x82]
0x1401c1fc8: cmp    ebx,eax
0x1401c1fca: jne    0x1401c1fdb
0x1401c1fcc: movsx  eax,WORD PTR [rcx+0x84]
0x1401c1fd3: cmp    edi,eax
0x1401c1fd5: je     0x1401c20cf
0x1401c1fdb: cmp    r13d,0x1
0x1401c1fdf: jne    0x1401c20cf
0x1401c1fe5: lea    rcx,[rbp+0xed0]
0x1401c1fec: call   0x14006f690
0x1401c1ff1: nop
0x1401c1ff2: movzx  r8d,di
0x1401c1ff6: movzx  edx,bx
0x1401c1ff9: mov    rcx,QWORD PTR [rip+0x2329b58]        # 0x1424ebb58
0x1401c2000: call   0x1401bc2d0
0x1401c2005: mov    ecx,eax
0x1401c2007: cmp    eax,0x12
0x1401c200a: jl     0x1401c203f
0x1401c200c: mov    eax,0x38e38e39
0x1401c2011: imul   ecx
0x1401c2013: mov    ecx,edx
0x1401c2015: sar    ecx,1
0x1401c2017: mov    eax,ecx
0x1401c2019: shr    eax,0x1f
0x1401c201c: add    ecx,eax
0x1401c201e: lea    rdx,[rbp+0xed0]
0x1401c2025: call   0x14052e360
0x1401c202a: lea    rcx,[rbp+0xed0]
0x1401c2031: call   0x14052d650
0x1401c2036: lea    rdx,[rip+0x14414d3]        # 0x141603510  " days' travel"
0x1401c203d: jmp    0x1401c2089
0x1401c203f: cmp    ecx,0xb
0x1401c2042: jl     0x1401c204d
0x1401c2044: lea    rdx,[rip+0x14414d5]        # 0x141603520  "More than a day's travel"
0x1401c204b: jmp    0x1401c2089
0x1401c204d: cmp    ecx,0x8
0x1401c2050: jl     0x1401c205b
0x1401c2052: lea    rdx,[rip+0x14414e7]        # 0x141603540  "A day's travel"
0x1401c2059: jmp    0x1401c2089
0x1401c205b: cmp    ecx,0x6
0x1401c205e: jl     0x1401c2069
0x1401c2060: lea    rdx,[rip+0x14414e9]        # 0x141603550  "Nearly a day's travel"
0x1401c2067: jmp    0x1401c2089
0x1401c2069: cmp    ecx,0x3
0x1401c206c: jl     0x1401c2077
0x1401c206e: lea    rdx,[rip+0x14414f3]        # 0x141603568  "A half day's travel"
0x1401c2075: jmp    0x1401c2089
0x1401c2077: test   ecx,ecx
0x1401c2079: lea    rdx,[rip+0x1441500]        # 0x141603580  'A short trip'
0x1401c2080: jns    0x1401c2089
0x1401c2082: lea    rdx,[rip+0x1441507]        # 0x141603590  'Inaccessible from your location'
0x1401c2089: lea    rcx,[rbp+0xed0]
0x1401c2090: call   0x14006f560
0x1401c2095: mov    r8d,r15d
0x1401c2098: mov    edx,0x3
0x1401c209d: lea    rcx,[rip+0x248834c]        # 0x14264a3f0
0x1401c20a4: call   0x1400bb120
0x1401c20a9: xor    r9d,r9d
0x1401c20ac: xor    r8d,r8d
0x1401c20af: lea    rdx,[rbp+0xed0]
0x1401c20b6: lea    rcx,[rip+0x2488333]        # 0x14264a3f0
0x1401c20bd: call   0x140ad9960
0x1401c20c2: nop
0x1401c20c3: lea    rcx,[rbp+0xed0]
0x1401c20ca: call   0x140067e30
0x1401c20cf: mov    r13,QWORD PTR [rsp+0x78]
0x1401c20d4: cmp    QWORD PTR [r13+0x1d8],0x0
0x1401c20dc: je     0x1401c6068
0x1401c20e2: lea    rdx,[rip+0x142b8d3]        # 0x1415ed9bc  'The '
0x1401c20e9: lea    rcx,[rbp+0xe10]
0x1401c20f0: call   0x140068150
0x1401c20f5: nop
0x1401c20f6: mov    r8d,r15d
0x1401c20f9: mov    edx,0x5
0x1401c20fe: lea    rcx,[rip+0x24882eb]        # 0x14264a3f0
0x1401c2105: call   0x1400bb120
0x1401c210a: lea    rcx,[rbp+0x10b0]
0x1401c2111: call   0x14006f690
0x1401c2116: nop
0x1401c2117: lea    rdx,[rbp+0x10b0]
0x1401c211e: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c2125: call   0x1410cbe10
0x1401c212a: lea    rcx,[rbp+0x10b0]
0x1401c2131: call   0x14006f520
0x1401c2136: test   al,al
0x1401c2138: jne    0x1401c215b
0x1401c213a: lea    rdx,[rbp+0x10b0]
0x1401c2141: lea    rcx,[rbp+0xe10]
0x1401c2148: call   0x1400b9d10
0x1401c214d: mov    dl,0x20
0x1401c214f: lea    rcx,[rbp+0xe10]
0x1401c2156: call   0x1400b9d30
0x1401c215b: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c2162: call   0x1410825c0
0x1401c2167: mov    rbx,rax
0x1401c216a: mov    QWORD PTR [rbp-0x20],rax
0x1401c216e: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c2175: call   0x1409b4e70
0x1401c217a: mov    rdi,rax
0x1401c217d: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c2184: cmp    WORD PTR [rcx+0x80],0xa
0x1401c218c: je     0x1401c21f7
0x1401c218e: test   rbx,rbx
0x1401c2191: je     0x1401c21f7
0x1401c2193: mov    ecx,DWORD PTR [rbx+0x9c]
0x1401c2199: shr    ecx,0xa
0x1401c219c: not    ecx
0x1401c219e: test   cl,0x1
0x1401c21a1: je     0x1401c21f7
0x1401c21a3: lea    rcx,[rbp+0x14b0]
0x1401c21aa: call   0x14006f690
0x1401c21af: nop
0x1401c21b0: mov    r8d,0xffffffff
0x1401c21b6: lea    rdx,[rbp+0x14b0]
0x1401c21bd: movzx  ecx,WORD PTR [rbx+0x98]
0x1401c21c4: call   0x140aa3770
0x1401c21c9: lea    rdx,[rbp+0x14b0]
0x1401c21d0: lea    rcx,[rbp+0xe10]
0x1401c21d7: call   0x1400b9d10
0x1401c21dc: mov    dl,0x20
0x1401c21de: lea    rcx,[rbp+0xe10]
0x1401c21e5: call   0x1400b9d30
0x1401c21ea: nop
0x1401c21eb: lea    rcx,[rbp+0x14b0]
0x1401c21f2: call   0x140067e30
0x1401c21f7: lea    rdx,[rbp+0x10b0]
0x1401c21fe: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c2205: call   0x1410cbe50
0x1401c220a: lea    rdx,[rbp+0x10b0]
0x1401c2211: lea    rcx,[rbp+0xe10]
0x1401c2218: call   0x1400b9d10
0x1401c221d: lea    rdx,[rip+0x14292f4]        # 0x1415eb518  ' of '
0x1401c2224: lea    rcx,[rbp+0xe10]
0x1401c222b: call   0x14006f560
0x1401c2230: xor    r9d,r9d
0x1401c2233: mov    r8b,0x1
0x1401c2236: lea    rdx,[rbp+0x10b0]
0x1401c223d: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c2244: call   0x140a946e0
0x1401c2249: lea    rdx,[rbp+0x10b0]
0x1401c2250: lea    rcx,[rbp+0xe10]
0x1401c2257: call   0x1400b9d10
0x1401c225c: lea    rcx,[rbp+0xe10]
0x1401c2263: call   0x14052d3c0
0x1401c2268: lea    eax,[rsi-0x7]
0x1401c226b: movsxd r14,eax
0x1401c226e: mov    QWORD PTR [rbp-0x78],r14
0x1401c2272: lea    rcx,[rbp+0xe10]
0x1401c2279: call   0x14006f330
0x1401c227e: cmp    rax,r14
0x1401c2281: jb     0x1401c22ec
0x1401c2283: lea    r14d,[rsi-0x8]
0x1401c2287: test   r14d,r14d
0x1401c228a: js     0x1401c22a2
0x1401c228c: movsxd rdx,esi
0x1401c228f: sub    rdx,0x8
0x1401c2293: xor    r8d,r8d
0x1401c2296: lea    rcx,[rbp+0xe10]
0x1401c229d: call   0x1400e1230
0x1401c22a2: cmp    r14d,0x3
0x1401c22a6: jle    0x1401c22e8
0x1401c22a8: movsxd rdx,esi
0x1401c22ab: sub    rdx,0xb
0x1401c22af: lea    rcx,[rbp+0xe10]
0x1401c22b6: call   0x1400fb540
0x1401c22bb: mov    BYTE PTR [rax],0x2e
0x1401c22be: lea    eax,[rsi-0xa]
0x1401c22c1: movsxd rdx,eax
0x1401c22c4: lea    rcx,[rbp+0xe10]
0x1401c22cb: call   0x1400fb540
0x1401c22d0: mov    BYTE PTR [rax],0x2e
0x1401c22d3: lea    eax,[rsi-0x9]
0x1401c22d6: movsxd rdx,eax
0x1401c22d9: lea    rcx,[rbp+0xe10]
0x1401c22e0: call   0x1400fb540
0x1401c22e5: mov    BYTE PTR [rax],0x2e
0x1401c22e8: mov    r14,QWORD PTR [rbp-0x78]
0x1401c22ec: xor    r9d,r9d
0x1401c22ef: xor    r8d,r8d
0x1401c22f2: lea    rdx,[rbp+0xe10]
0x1401c22f9: lea    rcx,[rip+0x24880f0]        # 0x14264a3f0
0x1401c2300: call   0x140ad9960
0x1401c2305: mov    rax,QWORD PTR [rip+0x21d7ee4]        # 0x14239a1f0
0x1401c230c: mov    r8d,r15d
0x1401c230f: mov    edx,0x6
0x1401c2314: lea    rcx,[rip+0x24880d5]        # 0x14264a3f0
0x1401c231b: cmp    QWORD PTR [r13+0x1d8],rax
0x1401c2322: jne    0x1401c2371
0x1401c2324: call   0x1400bb120
0x1401c2329: lea    rdx,[rip+0x1441280]        # 0x1416035b0  'Your location'
0x1401c2330: lea    rcx,[rbp+0x1670]
0x1401c2337: call   0x140068150
0x1401c233c: nop
0x1401c233d: xor    r9d,r9d
0x1401c2340: xor    r8d,r8d
0x1401c2343: lea    rdx,[rbp+0x1670]
0x1401c234a: lea    rcx,[rip+0x248809f]        # 0x14264a3f0
0x1401c2351: call   0x140ad9960
0x1401c2356: nop
0x1401c2357: lea    rcx,[rbp+0x1670]
0x1401c235e: call   0x140067e30
0x1401c2363: test   rdi,rdi
0x1401c2366: je     0x1401c2be7
0x1401c236c: jmp    0x1401c2aa2
0x1401c2371: call   0x1400bb120
0x1401c2376: test   rdi,rdi
0x1401c2379: je     0x1401c2baa
0x1401c237f: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c2386: add    rcx,0x90
0x1401c238d: call   0x14006f370
0x1401c2392: mov    rbx,rax
0x1401c2395: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c239c: add    rcx,0xd8
0x1401c23a3: lea    rdx,[rbp+0x50]
0x1401c23a7: call   0x14006f240
0x1401c23ac: mov    rcx,QWORD PTR [r13+0x1d8]
0x1401c23b3: add    rcx,0xd8
0x1401c23ba: lea    rdx,[rbp+0x1a0]
0x1401c23c1: call   0x14006f230
0x1401c23c6: lea    r8,[rbp+0x1a0]
0x1401c23cd: lea    rdx,[rbp+0x3]
0x1401c23d1: lea    rcx,[rbp+0x50]
0x1401c23d5: call   0x14006ee20
0x1401c23da: xor    edx,edx
0x1401c23dc: movzx  ecx,BYTE PTR [rax]
0x1401c23df: call   0x1400657b0
0x1401c23e4: test   al,al
0x1401c23e6: je     0x1401c244c
0x1401c23e8: nop    DWORD PTR [rax+rax*1+0x0]
0x1401c23f0: lea    rcx,[rbp+0x50]
0x1401c23f4: call   0x14006ee10
0x1401c23f9: mov    rcx,QWORD PTR [rax]
0x1401c23fc: cmp    DWORD PTR [rcx],0x0
0x1401c23ff: jle    0x1401c2421
0x1401c2401: lea    rcx,[rbp+0x50]
0x1401c2405: call   0x14006ee10
0x1401c240a: mov    rcx,QWORD PTR [rax]
0x1401c240d: cmp    DWORD PTR [rcx+0x18],0xffffffff
0x1401c2411: jne    0x1401c2421
0x1401c2413: lea    rcx,[rbp+0x50]
0x1401c2417: call   0x14006ee10
0x1401c241c: mov    rcx,QWORD PTR [rax]
0x1401c241f: add    ebx,DWORD PTR [rcx]
0x1401c2421: lea    rcx,[rbp+0x50]
0x1401c2425: call   0x14006ee00
0x1401c242a: lea    r8,[rbp+0x1a0]
0x1401c2431: lea    rdx,[rbp+0x3]
0x1401c2435: lea    rcx,[rbp+0x50]
0x1401c2439: call   0x14006ee20
0x1401c243e: xor    edx,edx
0x1401c2440: movzx  ecx,BYTE PTR [rax]
0x1401c2443: call   0x1400657b0
0x1401c2448: test   al,al
0x1401c244a: jne    0x1401c23f0
0x1401c244c: cmp    ebx,0x30d4
0x1401c2452: jl     0x1401c2491
0x1401c2454: lea    rdx,[rip+0x1441165]        # 0x1416035c0  'Population: >10000'
0x1401c245b: lea    rcx,[rbp+0x1690]
0x1401c2462: call   0x140068150
0x1401c2467: nop
0x1401c2468: mov    r9d,0x35
0x1401c246e: xor    r8d,r8d
0x1401c2471: lea    rdx,[rbp+0x1690]
0x1401c2478: lea    rcx,[rip+0x2487f71]        # 0x14264a3f0
0x1401c247f: call   0x140ad9960
0x1401c2484: nop
0x1401c2485: lea    rcx,[rbp+0x1690]
0x1401c248c: jmp    0x1401c2a99
0x1401c2491: cmp    ebx,0x2134
0x1401c2497: jl     0x1401c24d6
0x1401c2499: lea    rdx,[rip+0x1441138]        # 0x1416035d8  'Population: ~10000'
0x1401c24a0: lea    rcx,[rbp+0x16b0]
0x1401c24a7: call   0x140068150
0x1401c24ac: nop
0x1401c24ad: mov    r9d,0x35
0x1401c24b3: xor    r8d,r8d
0x1401c24b6: lea    rdx,[rbp+0x16b0]
0x1401c24bd: lea    rcx,[rip+0x2487f2c]        # 0x14264a3f0
0x1401c24c4: call   0x140ad9960
0x1401c24c9: nop
0x1401c24ca: lea    rcx,[rbp+0x16b0]
0x1401c24d1: jmp    0x1401c2a99
0x1401c24d6: cmp    ebx,0x1964
0x1401c24dc: jl     0x1401c251b
0x1401c24de: lea    rdx,[rip+0x144110b]        # 0x1416035f0  'Population: ~7500'
0x1401c24e5: lea    rcx,[rbp+0x16d0]
0x1401c24ec: call   0x140068150
0x1401c24f1: nop
0x1401c24f2: mov    r9d,0x35
0x1401c24f8: xor    r8d,r8d
0x1401c24fb: lea    rdx,[rbp+0x16d0]
0x1401c2502: lea    rcx,[rip+0x2487ee7]        # 0x14264a3f0
0x1401c2509: call   0x140ad9960
0x1401c250e: nop
0x1401c250f: lea    rcx,[rbp+0x16d0]
0x1401c2516: jmp    0x1401c2a99
0x1401c251b: cmp    ebx,0x157c
0x1401c2521: jl     0x1401c2560
0x1401c2523: lea    rdx,[rip+0x14410de]        # 0x141603608  'Population: ~6000'
0x1401c252a: lea    rcx,[rbp+0x16f0]
0x1401c2531: call   0x140068150
0x1401c2536: nop
0x1401c2537: mov    r9d,0x35
0x1401c253d: xor    r8d,r8d
0x1401c2540: lea    rdx,[rbp+0x16f0]
0x1401c2547: lea    rcx,[rip+0x2487ea2]        # 0x14264a3f0
0x1401c254e: call   0x140ad9960
0x1401c2553: nop
0x1401c2554: lea    rcx,[rbp+0x16f0]
0x1401c255b: jmp    0x1401c2a99
0x1401c2560: cmp    ebx,0x1194
0x1401c2566: jl     0x1401c25a5
0x1401c2568: lea    rdx,[rip+0x14410b1]        # 0x141603620  'Population: ~5000'
0x1401c256f: lea    rcx,[rbp+0x1710]
0x1401c2576: call   0x140068150
0x1401c257b: nop
0x1401c257c: mov    r9d,0x35
0x1401c2582: xor    r8d,r8d
0x1401c2585: lea    rdx,[rbp+0x1710]
0x1401c258c: lea    rcx,[rip+0x2487e5d]        # 0x14264a3f0
0x1401c2593: call   0x140ad9960
0x1401c2598: nop
0x1401c2599: lea    rcx,[rbp+0x1710]
0x1401c25a0: jmp    0x1401c2a99
0x1401c25a5: cmp    ebx,0xdac
0x1401c25ab: jl     0x1401c25ea
0x1401c25ad: lea    rdx,[rip+0x1441084]        # 0x141603638  'Population: ~4000'
0x1401c25b4: lea    rcx,[rbp+0x1730]
0x1401c25bb: call   0x140068150
0x1401c25c0: nop
0x1401c25c1: mov    r9d,0x35
0x1401c25c7: xor    r8d,r8d
0x1401c25ca: lea    rdx,[rbp+0x1730]
0x1401c25d1: lea    rcx,[rip+0x2487e18]        # 0x14264a3f0
0x1401c25d8: call   0x140ad9960
0x1401c25dd: nop
0x1401c25de: lea    rcx,[rbp+0x1730]
0x1401c25e5: jmp    0x1401c2a99
0x1401c25ea: cmp    ebx,0x9c4
0x1401c25f0: jl     0x1401c262f
0x1401c25f2: lea    rdx,[rip+0x1441057]        # 0x141603650  'Population: ~3000'
0x1401c25f9: lea    rcx,[rbp+0x1750]
0x1401c2600: call   0x140068150
0x1401c2605: nop
0x1401c2606: mov    r9d,0x35
0x1401c260c: xor    r8d,r8d
0x1401c260f: lea    rdx,[rbp+0x1750]
0x1401c2616: lea    rcx,[rip+0x2487dd3]        # 0x14264a3f0
0x1401c261d: call   0x140ad9960
0x1401c2622: nop
0x1401c2623: lea    rcx,[rbp+0x1750]
0x1401c262a: jmp    0x1401c2a99
0x1401c262f: cmp    ebx,0x5dc
0x1401c2635: jl     0x1401c2674
0x1401c2637: lea    rdx,[rip+0x144102a]        # 0x141603668  'Population: ~2000'
0x1401c263e: lea    rcx,[rbp+0x1770]
0x1401c2645: call   0x140068150
0x1401c264a: nop
0x1401c264b: mov    r9d,0x35
0x1401c2651: xor    r8d,r8d
0x1401c2654: lea    rdx,[rbp+0x1770]
0x1401c265b: lea    rcx,[rip+0x2487d8e]        # 0x14264a3f0
0x1401c2662: call   0x140ad9960
0x1401c2667: nop
0x1401c2668: lea    rcx,[rbp+0x1770]
0x1401c266f: jmp    0x1401c2a99
0x1401c2674: cmp    ebx,0x352
0x1401c267a: jl     0x1401c26b9
0x1401c267c: lea    rdx,[rip+0x1441135]        # 0x1416037b8  'Population: ~1000'
0x1401c2683: lea    rcx,[rbp+0x1790]
0x1401c268a: call   0x140068150
0x1401c268f: nop
0x1401c2690: mov    r9d,0x35
0x1401c2696: xor    r8d,r8d
0x1401c2699: lea    rdx,[rbp+0x1790]
0x1401c26a0: lea    rcx,[rip+0x2487d49]        # 0x14264a3f0
0x1401c26a7: call   0x140ad9960
0x1401c26ac: nop
0x1401c26ad: lea    rcx,[rbp+0x1790]
0x1401c26b4: jmp    0x1401c2a99
0x1401c26b9: cmp    ebx,0x28a
0x1401c26bf: jl     0x1401c26fe
0x1401c26c1: lea    rdx,[rip+0x1441108]        # 0x1416037d0  'Population: ~750'
0x1401c26c8: lea    rcx,[rbp+0x17b0]
0x1401c26cf: call   0x140068150
0x1401c26d4: nop
0x1401c26d5: mov    r9d,0x35
0x1401c26db: xor    r8d,r8d
0x1401c26de: lea    rdx,[rbp+0x17b0]
0x1401c26e5: lea    rcx,[rip+0x2487d04]        # 0x14264a3f0
0x1401c26ec: call   0x140ad9960
0x1401c26f1: nop
0x1401c26f2: lea    rcx,[rbp+0x17b0]
0x1401c26f9: jmp    0x1401c2a99
0x1401c26fe: cmp    ebx,0x226
0x1401c2704: jl     0x1401c2743
0x1401c2706: lea    rdx,[rip+0x14410db]        # 0x1416037e8  'Population: ~600'
0x1401c270d: lea    rcx,[rbp+0x17d0]
0x1401c2714: call   0x140068150
0x1401c2719: nop
0x1401c271a: mov    r9d,0x35
0x1401c2720: xor    r8d,r8d
0x1401c2723: lea    rdx,[rbp+0x17d0]
0x1401c272a: lea    rcx,[rip+0x2487cbf]        # 0x14264a3f0
0x1401c2731: call   0x140ad9960
0x1401c2736: nop
0x1401c2737: lea    rcx,[rbp+0x17d0]
0x1401c273e: jmp    0x1401c2a99
0x1401c2743: cmp    ebx,0x1c2
0x1401c2749: jl     0x1401c2788
0x1401c274b: lea    rdx,[rip+0x14410ae]        # 0x141603800  'Population: ~500'
0x1401c2752: lea    rcx,[rbp+0x17f0]
0x1401c2759: call   0x140068150
0x1401c275e: nop
0x1401c275f: mov    r9d,0x35
0x1401c2765: xor    r8d,r8d
0x1401c2768: lea    rdx,[rbp+0x17f0]
0x1401c276f: lea    rcx,[rip+0x2487c7a]        # 0x14264a3f0
0x1401c2776: call   0x140ad9960
0x1401c277b: nop
0x1401c277c: lea    rcx,[rbp+0x17f0]
0x1401c2783: jmp    0x1401c2a99
0x1401c2788: cmp    ebx,0x15e
0x1401c278e: jl     0x1401c27cd
0x1401c2790: lea    rdx,[rip+0x1441081]        # 0x141603818  'Population: ~400'
0x1401c2797: lea    rcx,[rbp+0x1810]
0x1401c279e: call   0x140068150
0x1401c27a3: nop
0x1401c27a4: mov    r9d,0x35
0x1401c27aa: xor    r8d,r8d
0x1401c27ad: lea    rdx,[rbp+0x1810]
0x1401c27b4: lea    rcx,[rip+0x2487c35]        # 0x14264a3f0
0x1401c27bb: call   0x140ad9960
0x1401c27c0: nop
0x1401c27c1: lea    rcx,[rbp+0x1810]
0x1401c27c8: jmp    0x1401c2a99
0x1401c27cd: cmp    ebx,0xfa
0x1401c27d3: jl     0x1401c2812
0x1401c27d5: lea    rdx,[rip+0x1441054]        # 0x141603830  'Population: ~300'
0x1401c27dc: lea    rcx,[rbp+0x1830]
0x1401c27e3: call   0x140068150
0x1401c27e8: nop
0x1401c27e9: mov    r9d,0x35
0x1401c27ef: xor    r8d,r8d
0x1401c27f2: lea    rdx,[rbp+0x1830]
0x1401c27f9: lea    rcx,[rip+0x2487bf0]        # 0x14264a3f0
0x1401c2800: call   0x140ad9960
0x1401c2805: nop
0x1401c2806: lea    rcx,[rbp+0x1830]
0x1401c280d: jmp    0x1401c2a99
0x1401c2812: cmp    ebx,0x96
0x1401c2818: jl     0x1401c2857
0x1401c281a: lea    rdx,[rip+0x1441027]        # 0x141603848  'Population: ~200'
0x1401c2821: lea    rcx,[rbp+0x1850]
0x1401c2828: call   0x140068150
0x1401c282d: nop
0x1401c282e: mov    r9d,0x35
0x1401c2834: xor    r8d,r8d
0x1401c2837: lea    rdx,[rbp+0x1850]
0x1401c283e: lea    rcx,[rip+0x2487bab]        # 0x14264a3f0
0x1401c2845: call   0x140ad9960
0x1401c284a: nop
0x1401c284b: lea    rcx,[rbp+0x1850]
0x1401c2852: jmp    0x1401c2a99
0x1401c2857: cmp    ebx,0x55
0x1401c285a: jl     0x1401c2899
0x1401c285c: lea    rdx,[rip+0x1440ffd]        # 0x141603860  'Population: ~100'
0x1401c2863: lea    rcx,[rbp+0x1870]
0x1401c286a: call   0x140068150
0x1401c286f: nop
0x1401c2870: mov    r9d,0x35
0x1401c2876: xor    r8d,r8d
0x1401c2879: lea    rdx,[rbp+0x1870]
0x1401c2880: lea    rcx,[rip+0x2487b69]        # 0x14264a3f0
0x1401c2887: call   0x140ad9960
0x1401c288c: nop
0x1401c288d: lea    rcx,[rbp+0x1870]
0x1401c2894: jmp    0x1401c2a99
0x1401c2899: cmp    ebx,0x41
0x1401c289c: jl     0x1401c28db
0x1401c289e: lea    rdx,[rip+0x1440fd3]        # 0x141603878  'Population: ~75'
0x1401c28a5: lea    rcx,[rbp+0x1890]
0x1401c28ac: call   0x140068150
0x1401c28b1: nop
0x1401c28b2: mov    r9d,0x35
0x1401c28b8: xor    r8d,r8d
0x1401c28bb: lea    rdx,[rbp+0x1890]
0x1401c28c2: lea    rcx,[rip+0x2487b27]        # 0x14264a3f0
0x1401c28c9: call   0x140ad9960
0x1401c28ce: nop
0x1401c28cf: lea    rcx,[rbp+0x1890]
0x1401c28d6: jmp    0x1401c2a99
0x1401c28db: cmp    ebx,0x37
0x1401c28de: jl     0x1401c291d
0x1401c28e0: lea    rdx,[rip+0x1440fa1]        # 0x141603888  'Population: ~60'
0x1401c28e7: lea    rcx,[rbp+0x18b0]
0x1401c28ee: call   0x140068150
0x1401c28f3: nop
0x1401c28f4: mov    r9d,0x35
0x1401c28fa: xor    r8d,r8d
0x1401c28fd: lea    rdx,[rbp+0x18b0]
0x1401c2904: lea    rcx,[rip+0x2487ae5]        # 0x14264a3f0
0x1401c290b: call   0x140ad9960
0x1401c2910: nop
0x1401c2911: lea    rcx,[rbp+0x18b0]
0x1401c2918: jmp    0x1401c2a99
0x1401c291d: cmp    ebx,0x2d
0x1401c2920: jl     0x1401c295f
0x1401c2922: lea    rdx,[rip+0x1440f6f]        # 0x141603898  'Population: ~50'
0x1401c2929: lea    rcx,[rbp+0x18d0]
0x1401c2930: call   0x140068150
0x1401c2935: nop
0x1401c2936: mov    r9d,0x35
0x1401c293c: xor    r8d,r8d
0x1401c293f: lea    rdx,[rbp+0x18d0]
0x1401c2946: lea    rcx,[rip+0x2487aa3]        # 0x14264a3f0
0x1401c294d: call   0x140ad9960
0x1401c2952: nop
0x1401c2953: lea    rcx,[rbp+0x18d0]
0x1401c295a: jmp    0x1401c2a99
0x1401c295f: cmp    ebx,0x23
0x1401c2962: jl     0x1401c29a1
0x1401c2964: lea    rdx,[rip+0x1440f3d]        # 0x1416038a8  'Population: ~40'
0x1401c296b: lea    rcx,[rbp+0x18f0]
0x1401c2972: call   0x140068150
0x1401c2977: nop
0x1401c2978: mov    r9d,0x35
0x1401c297e: xor    r8d,r8d
0x1401c2981: lea    rdx,[rbp+0x18f0]
0x1401c2988: lea    rcx,[rip+0x2487a61]        # 0x14264a3f0
0x1401c298f: call   0x140ad9960
0x1401c2994: nop
0x1401c2995: lea    rcx,[rbp+0x18f0]
0x1401c299c: jmp    0x1401c2a99
0x1401c29a1: cmp    ebx,0x19
0x1401c29a4: jl     0x1401c29e3
0x1401c29a6: lea    rdx,[rip+0x1440f0b]        # 0x1416038b8  'Population: ~30'
0x1401c29ad: lea    rcx,[rbp+0x1910]
0x1401c29b4: call   0x140068150
0x1401c29b9: nop
0x1401c29ba: mov    r9d,0x35
0x1401c29c0: xor    r8d,r8d
0x1401c29c3: lea    rdx,[rbp+0x1910]
0x1401c29ca: lea    rcx,[rip+0x2487a1f]        # 0x14264a3f0
0x1401c29d1: call   0x140ad9960
0x1401c29d6: nop
0x1401c29d7: lea    rcx,[rbp+0x1910]
0x1401c29de: jmp    0x1401c2a99
0x1401c29e3: cmp    ebx,0xf
0x1401c29e6: jl     0x1401c2a22
0x1401c29e8: lea    rdx,[rip+0x1440ed9]        # 0x1416038c8  'Population: ~20'
0x1401c29ef: lea    rcx,[rbp+0x1930]
0x1401c29f6: call   0x140068150
0x1401c29fb: nop
0x1401c29fc: mov    r9d,0x35
0x1401c2a02: xor    r8d,r8d
0x1401c2a05: lea    rdx,[rbp+0x1930]
0x1401c2a0c: lea    rcx,[rip+0x24879dd]        # 0x14264a3f0
0x1401c2a13: call   0x140ad9960
0x1401c2a18: nop
0x1401c2a19: lea    rcx,[rbp+0x1930]
0x1401c2a20: jmp    0x1401c2a99
0x1401c2a22: cmp    ebx,0x7
0x1401c2a25: jl     0x1401c2a61
0x1401c2a27: lea    rdx,[rip+0x1440eaa]        # 0x1416038d8  'Population: ~10'
0x1401c2a2e: lea    rcx,[rbp+0x1950]
0x1401c2a35: call   0x140068150
0x1401c2a3a: nop
0x1401c2a3b: mov    r9d,0x35
0x1401c2a41: xor    r8d,r8d
0x1401c2a44: lea    rdx,[rbp+0x1950]
0x1401c2a4b: lea    rcx,[rip+0x248799e]        # 0x14264a3f0
0x1401c2a52: call   0x140ad9960
0x1401c2a57: nop
0x1401c2a58: lea    rcx,[rbp+0x1950]
0x1401c2a5f: jmp    0x1401c2a99
0x1401c2a61: lea    rdx,[rip+0x1440e80]        # 0x1416038e8  'Population: <10'
0x1401c2a68: lea    rcx,[rbp+0x1970]
0x1401c2a6f: call   0x140068150
0x1401c2a74: nop
0x1401c2a75: mov    r9d,0x35
0x1401c2a7b: xor    r8d,r8d
0x1401c2a7e: lea    rdx,[rbp+0x1970]
0x1401c2a85: lea    rcx,[rip+0x2487964]        # 0x14264a3f0
0x1401c2a8c: call   0x140ad9960
0x1401c2a91: nop
0x1401c2a92: lea    rcx,[rbp+0x1970]
0x1401c2a99: call   0x140067e30
0x1401c2a9e: mov    rbx,QWORD PTR [rbp-0x20]
0x1401c2aa2: lea    rcx,[rbp+0x14d0]
0x1401c2aa9: call   0x14006f690
0x1401c2aae: nop
0x1401c2aaf: lea    rcx,[rdi+0x20]
0x1401c2ab3: xor    r9d,r9d
0x1401c2ab6: mov    r8b,0x1
0x1401c2ab9: lea    rdx,[rbp+0x14d0]
0x1401c2ac0: call   0x140a946e0
0x1401c2ac5: mov    r8d,r15d
0x1401c2ac8: mov    edx,0x7
0x1401c2acd: lea    rcx,[rip+0x248791c]        # 0x14264a3f0
0x1401c2ad4: call   0x1400bb120
0x1401c2ad9: lea    rdx,[rip+0x1440bb8]        # 0x141603698  'Site government: '
0x1401c2ae0: lea    rcx,[rbp+0x1030]
0x1401c2ae7: call   0x140068150
0x1401c2aec: nop
0x1401c2aed: lea    rdx,[rbp+0x14d0]
0x1401c2af4: lea    rcx,[rbp+0x1030]
0x1401c2afb: call   0x1400b9d10
0x1401c2b00: lea    rcx,[rbp+0x1030]
0x1401c2b07: call   0x14006f330
0x1401c2b0c: cmp    rax,r14
0x1401c2b0f: jb     0x1401c2b7a
0x1401c2b11: lea    r14d,[rsi-0x8]
0x1401c2b15: test   r14d,r14d
0x1401c2b18: js     0x1401c2b30
0x1401c2b1a: movsxd rdx,esi
0x1401c2b1d: sub    rdx,0x8
0x1401c2b21: xor    r8d,r8d
0x1401c2b24: lea    rcx,[rbp+0x1030]
0x1401c2b2b: call   0x1400e1230
0x1401c2b30: cmp    r14d,0x3
0x1401c2b34: jle    0x1401c2b76
0x1401c2b36: movsxd rdx,esi
0x1401c2b39: sub    rdx,0xb
0x1401c2b3d: lea    rcx,[rbp+0x1030]
0x1401c2b44: call   0x1400fb540
0x1401c2b49: mov    BYTE PTR [rax],0x2e
0x1401c2b4c: lea    eax,[rsi-0xa]
0x1401c2b4f: movsxd rdx,eax
0x1401c2b52: lea    rcx,[rbp+0x1030]
0x1401c2b59: call   0x1400fb540
0x1401c2b5e: mov    BYTE PTR [rax],0x2e
0x1401c2b61: lea    eax,[rsi-0x9]
0x1401c2b64: movsxd rdx,eax
0x1401c2b67: lea    rcx,[rbp+0x1030]
0x1401c2b6e: call   0x1400fb540
0x1401c2b73: mov    BYTE PTR [rax],0x2e
0x1401c2b76: mov    r14,QWORD PTR [rbp-0x78]
0x1401c2b7a: xor    r9d,r9d
0x1401c2b7d: xor    r8d,r8d
0x1401c2b80: lea    rdx,[rbp+0x1030]
0x1401c2b87: lea    rcx,[rip+0x2487862]        # 0x14264a3f0
0x1401c2b8e: call   0x140ad9960
0x1401c2b93: nop
0x1401c2b94: lea    rcx,[rbp+0x1030]
0x1401c2b9b: call   0x140067e30
0x1401c2ba0: nop
0x1401c2ba1: lea    rcx,[rbp+0x14d0]
0x1401c2ba8: jmp    0x1401c2be2
0x1401c2baa: lea    rdx,[rip+0x1440acf]        # 0x141603680  'No civilized population'
0x1401c2bb1: lea    rcx,[rbp+0x1990]
0x1401c2bb8: call   0x140068150
0x1401c2bbd: nop
0x1401c2bbe: mov    r9d,0x35
0x1401c2bc4: xor    r8d,r8d
0x1401c2bc7: lea    rdx,[rbp+0x1990]
0x1401c2bce: lea    rcx,[rip+0x248781b]        # 0x14264a3f0
0x1401c2bd5: call   0x140ad9960
0x1401c2bda: nop
0x1401c2bdb: lea    rcx,[rbp+0x1990]
0x1401c2be2: call   0x140067e30
0x1401c2be7: test   rbx,rbx
0x1401c2bea: je     0x1401c2d00
0x1401c2bf0: cmp    rbx,rdi
0x1401c2bf3: je     0x1401c2d00
0x1401c2bf9: lea    rcx,[rbp+0x14f0]
0x1401c2c00: call   0x14006f690
0x1401c2c05: nop
0x1401c2c06: lea    rcx,[rbx+0x20]
0x1401c2c0a: xor    r9d,r9d
0x1401c2c0d: mov    r8b,0x1
0x1401c2c10: lea    rdx,[rbp+0x14f0]
0x1401c2c17: call   0x140a946e0
0x1401c2c1c: mov    r8d,r15d
0x1401c2c1f: mov    edx,0x8
0x1401c2c24: lea    rcx,[rip+0x24877c5]        # 0x14264a3f0
0x1401c2c2b: call   0x1400bb120
0x1401c2c30: lea    rdx,[rip+0x1440a79]        # 0x1416036b0  'Civilization: '
0x1401c2c37: lea    rcx,[rbp+0x1050]
0x1401c2c3e: call   0x140068150
0x1401c2c43: nop
0x1401c2c44: lea    rdx,[rbp+0x14f0]
0x1401c2c4b: lea    rcx,[rbp+0x1050]
0x1401c2c52: call   0x1400b9d10
0x1401c2c57: lea    rcx,[rbp+0x1050]
0x1401c2c5e: call   0x14006f330
0x1401c2c63: cmp    rax,r14
0x1401c2c66: jb     0x1401c2ccd
0x1401c2c68: lea    r14d,[rsi-0x8]
0x1401c2c6c: test   r14d,r14d
0x1401c2c6f: js     0x1401c2c87
0x1401c2c71: movsxd rdx,esi
0x1401c2c74: sub    rdx,0x8
0x1401c2c78: xor    r8d,r8d
0x1401c2c7b: lea    rcx,[rbp+0x1050]
0x1401c2c82: call   0x1400e1230
0x1401c2c87: cmp    r14d,0x3
0x1401c2c8b: jle    0x1401c2ccd
0x1401c2c8d: movsxd rdx,esi
0x1401c2c90: sub    rdx,0xb
0x1401c2c94: lea    rcx,[rbp+0x1050]
0x1401c2c9b: call   0x1400fb540
0x1401c2ca0: mov    BYTE PTR [rax],0x2e
0x1401c2ca3: lea    eax,[rsi-0xa]
0x1401c2ca6: movsxd rdx,eax
0x1401c2ca9: lea    rcx,[rbp+0x1050]
0x1401c2cb0: call   0x1400fb540
0x1401c2cb5: mov    BYTE PTR [rax],0x2e
0x1401c2cb8: lea    eax,[rsi-0x9]
0x1401c2cbb: movsxd rdx,eax
0x1401c2cbe: lea    rcx,[rbp+0x1050]
0x1401c2cc5: call   0x1400fb540
0x1401c2cca: mov    BYTE PTR [rax],0x2e
0x1401c2ccd: xor    r9d,r9d
0x1401c2cd0: xor    r8d,r8d
0x1401c2cd3: lea    rdx,[rbp+0x1050]
0x1401c2cda: lea    rcx,[rip+0x248770f]        # 0x14264a3f0
0x1401c2ce1: call   0x140ad9960
0x1401c2ce6: nop
0x1401c2ce7: lea    rcx,[rbp+0x1050]
0x1401c2cee: call   0x140067e30
0x1401c2cf3: nop
0x1401c2cf4: lea    rcx,[rbp+0x14f0]
0x1401c2cfb: call   0x140067e30
0x1401c2d00: mov    edx,DWORD PTR [rip+0x21d0972]        # 0x142393678
0x1401c2d06: lea    rcx,[rip+0x220eaeb]        # 0x1423d17f8
0x1401c2d0d: call   0x14007daf0
0x1401c2d12: mov    r13,rax
0x1401c2d15: mov    edx,DWORD PTR [rip+0x21d0955]        # 0x142393670
0x1401c2d1b: lea    rcx,[rip+0x220ead6]        # 0x1423d17f8
0x1401c2d22: call   0x14007daf0
0x1401c2d27: mov    QWORD PTR [rbp-0x10],rax
0x1401c2d2b: test   rax,rax
0x1401c2d2e: je     0x1401c313e
0x1401c2d34: test   r13,r13
0x1401c2d37: je     0x1401c313e
0x1401c2d3d: test   rbx,rbx
0x1401c2d40: je     0x1401c313e
0x1401c2d46: test   rdi,rdi
0x1401c2d49: je     0x1401c31a6
0x1401c2d4f: cmp    rax,rbx
0x1401c2d52: je     0x1401c3143
0x1401c2d58: lea    rcx,[rax+0x1028]
0x1401c2d5f: mov    edx,DWORD PTR [rbx+0x4]
0x1401c2d62: call   0x1400ffa80
0x1401c2d67: mov    r14,rax
0x1401c2d6a: lea    rcx,[r13+0x1028]
0x1401c2d71: mov    edx,DWORD PTR [rdi+0x4]
0x1401c2d74: call   0x1400ffa80
0x1401c2d79: mov    rbx,rax
0x1401c2d7c: mov    r8d,r15d
0x1401c2d7f: mov    edx,0x9
0x1401c2d84: lea    rcx,[rip+0x2487665]        # 0x14264a3f0
0x1401c2d8b: call   0x1400bb120
0x1401c2d90: test   rbx,rbx
0x1401c2d93: je     0x1401c2f5d
0x1401c2d99: movzx  eax,WORD PTR [rbx+0x4]
0x1401c2d9d: cmp    ax,0x3
0x1401c2da1: je     0x1401c2de4
0x1401c2da3: cmp    ax,0x4
0x1401c2da7: jne    0x1401c2f5d
0x1401c2dad: lea    rdx,[rip+0x144091c]        # 0x1416036d0  'They accept '
0x1401c2db4: lea    rcx,[rbp+0x19b0]
0x1401c2dbb: call   0x140068150
0x1401c2dc0: nop
0x1401c2dc1: xor    r9d,r9d
0x1401c2dc4: mov    r8b,0x3
0x1401c2dc7: lea    rdx,[rbp+0x19b0]
0x1401c2dce: lea    rcx,[rip+0x248761b]        # 0x14264a3f0
0x1401c2dd5: call   0x140ad9960
0x1401c2dda: nop
0x1401c2ddb: lea    rcx,[rbp+0x19b0]
0x1401c2de2: jmp    0x1401c2e19
0x1401c2de4: lea    rdx,[rip+0x14408d5]        # 0x1416036c0  'They offer '
0x1401c2deb: lea    rcx,[rbp+0x19d0]
0x1401c2df2: call   0x140068150
0x1401c2df7: nop
0x1401c2df8: xor    r9d,r9d
0x1401c2dfb: mov    r8b,0x3
0x1401c2dfe: lea    rdx,[rbp+0x19d0]
0x1401c2e05: lea    rcx,[rip+0x24875e4]        # 0x14264a3f0
0x1401c2e0c: call   0x140ad9960
0x1401c2e11: nop
0x1401c2e12: lea    rcx,[rbp+0x19d0]
0x1401c2e19: call   0x140067e30
0x1401c2e1e: mov    ecx,DWORD PTR [rbx+0x44]
0x1401c2e21: test   ecx,ecx
0x1401c2e23: je     0x1401c2ee4
0x1401c2e29: sub    ecx,0x1
0x1401c2e2c: je     0x1401c2ead
0x1401c2e2e: sub    ecx,0x1
0x1401c2e31: je     0x1401c2e76
0x1401c2e33: cmp    ecx,0x1
0x1401c2e36: jne    0x1401c2f1e
0x1401c2e3c: lea    rdx,[rip+0x143a471]        # 0x1415fd2b4  'Winter'
0x1401c2e43: lea    rcx,[rbp+0x19f0]
0x1401c2e4a: call   0x140068150
0x1401c2e4f: nop
0x1401c2e50: xor    r9d,r9d
0x1401c2e53: mov    r8b,0x3
0x1401c2e56: lea    rdx,[rbp+0x19f0]
0x1401c2e5d: lea    rcx,[rip+0x248758c]        # 0x14264a3f0
0x1401c2e64: call   0x140ad9960
0x1401c2e69: nop
0x1401c2e6a: lea    rcx,[rbp+0x19f0]
0x1401c2e71: jmp    0x1401c2f19
0x1401c2e76: lea    rdx,[rip+0x143a42f]        # 0x1415fd2ac  'Autumn'
0x1401c2e7d: lea    rcx,[rbp+0x1a10]
0x1401c2e84: call   0x140068150
0x1401c2e89: nop
0x1401c2e8a: xor    r9d,r9d
0x1401c2e8d: mov    r8b,0x3
0x1401c2e90: lea    rdx,[rbp+0x1a10]
0x1401c2e97: lea    rcx,[rip+0x2487552]        # 0x14264a3f0
0x1401c2e9e: call   0x140ad9960
0x1401c2ea3: nop
0x1401c2ea4: lea    rcx,[rbp+0x1a10]
0x1401c2eab: jmp    0x1401c2f19
0x1401c2ead: lea    rdx,[rip+0x143a3f0]        # 0x1415fd2a4  'Summer'
0x1401c2eb4: lea    rcx,[rbp+0x1a30]
0x1401c2ebb: call   0x140068150
0x1401c2ec0: nop
0x1401c2ec1: xor    r9d,r9d
0x1401c2ec4: mov    r8b,0x3
0x1401c2ec7: lea    rdx,[rbp+0x1a30]
0x1401c2ece: lea    rcx,[rip+0x248751b]        # 0x14264a3f0
0x1401c2ed5: call   0x140ad9960
0x1401c2eda: nop
0x1401c2edb: lea    rcx,[rbp+0x1a30]
0x1401c2ee2: jmp    0x1401c2f19
0x1401c2ee4: lea    rdx,[rip+0x143a3b1]        # 0x1415fd29c  'Spring'
0x1401c2eeb: lea    rcx,[rbp+0x1a50]
0x1401c2ef2: call   0x140068150
0x1401c2ef7: nop
0x1401c2ef8: xor    r9d,r9d
0x1401c2efb: mov    r8b,0x3
0x1401c2efe: lea    rdx,[rbp+0x1a50]
0x1401c2f05: lea    rcx,[rip+0x24874e4]        # 0x14264a3f0
0x1401c2f0c: call   0x140ad9960
0x1401c2f11: nop
0x1401c2f12: lea    rcx,[rbp+0x1a50]
0x1401c2f19: call   0x140067e30
0x1401c2f1e: lea    rdx,[rip+0x14407bb]        # 0x1416036e0  ' tribute'
0x1401c2f25: lea    rcx,[rbp+0x1a70]
0x1401c2f2c: call   0x140068150
0x1401c2f31: nop
0x1401c2f32: xor    r9d,r9d
0x1401c2f35: xor    r8d,r8d
0x1401c2f38: lea    rdx,[rbp+0x1a70]
0x1401c2f3f: lea    rcx,[rip+0x24874aa]        # 0x14264a3f0
0x1401c2f46: call   0x140ad9960
0x1401c2f4b: nop
0x1401c2f4c: lea    rcx,[rbp+0x1a70]
0x1401c2f53: call   0x140067e30
0x1401c2f58: jmp    0x1401c3143
0x1401c2f5d: test   r14,r14
0x1401c2f60: je     0x1401c3102
0x1401c2f66: movsx  rax,WORD PTR [r14+0x4]
0x1401c2f6b: cmp    eax,0x5
0x1401c2f6e: ja     0x1401c3143
0x1401c2f74: lea    rdx,[rip+0xffffffffffe3d085]        # 0x140000000
0x1401c2f7b: mov    ecx,DWORD PTR [rdx+rax*4+0x1d3840]
0x1401c2f82: add    rcx,rdx
0x1401c2f85: jmp    rcx
0x1401c2f87: test   BYTE PTR [r14+0x40],0x4
0x1401c2f8c: je     0x1401c2fcd
0x1401c2f8e: lea    rdx,[rip+0x144075b]        # 0x1416036f0  'Alliance'
0x1401c2f95: lea    rcx,[rbp+0x1a90]
0x1401c2f9c: call   0x140068150
0x1401c2fa1: nop
0x1401c2fa2: xor    r9d,r9d
0x1401c2fa5: xor    r8d,r8d
0x1401c2fa8: lea    rdx,[rbp+0x1a90]
0x1401c2faf: lea    rcx,[rip+0x248743a]        # 0x14264a3f0
0x1401c2fb6: call   0x140ad9960
0x1401c2fbb: nop
0x1401c2fbc: lea    rcx,[rbp+0x1a90]
0x1401c2fc3: call   0x140067e30
0x1401c2fc8: jmp    0x1401c3143
0x1401c2fcd: lea    rdx,[rip+0x1425a20]        # 0x1415e89f4  'Peace'
0x1401c2fd4: lea    rcx,[rbp+0x1ab0]
0x1401c2fdb: call   0x140068150
0x1401c2fe0: nop
0x1401c2fe1: xor    r9d,r9d
0x1401c2fe4: xor    r8d,r8d
0x1401c2fe7: lea    rdx,[rbp+0x1ab0]
0x1401c2fee: lea    rcx,[rip+0x24873fb]        # 0x14264a3f0
0x1401c2ff5: call   0x140ad9960
0x1401c2ffa: nop
0x1401c2ffb: lea    rcx,[rbp+0x1ab0]
0x1401c3002: call   0x140067e30
0x1401c3007: jmp    0x1401c3143
0x1401c300c: lea    rdx,[rip+0x14406e9]        # 0x1416036fc  'War'
0x1401c3013: lea    rcx,[rbp+0x1ad0]
0x1401c301a: call   0x140068150
0x1401c301f: nop
0x1401c3020: xor    r9d,r9d
0x1401c3023: xor    r8d,r8d
0x1401c3026: lea    rdx,[rbp+0x1ad0]
0x1401c302d: lea    rcx,[rip+0x24873bc]        # 0x14264a3f0
0x1401c3034: call   0x140ad9960
0x1401c3039: nop
0x1401c303a: lea    rcx,[rbp+0x1ad0]
0x1401c3041: call   0x140067e30
0x1401c3046: jmp    0x1401c3143
0x1401c304b: lea    rdx,[rip+0x14406be]        # 0x141603710  'They offer tribute'
0x1401c3052: lea    rcx,[rbp+0x1af0]
0x1401c3059: call   0x140068150
0x1401c305e: nop
0x1401c305f: xor    r9d,r9d
0x1401c3062: xor    r8d,r8d
0x1401c3065: lea    rdx,[rbp+0x1af0]
0x1401c306c: lea    rcx,[rip+0x248737d]        # 0x14264a3f0
0x1401c3073: call   0x140ad9960
0x1401c3078: nop
0x1401c3079: lea    rcx,[rbp+0x1af0]
0x1401c3080: call   0x140067e30
0x1401c3085: jmp    0x1401c3143
0x1401c308a: lea    rdx,[rip+0x1440697]        # 0x141603728  'They accept tribute'
0x1401c3091: lea    rcx,[rbp+0x1b10]
0x1401c3098: call   0x140068150
0x1401c309d: nop
0x1401c309e: xor    r9d,r9d
0x1401c30a1: xor    r8d,r8d
0x1401c30a4: lea    rdx,[rbp+0x1b10]
0x1401c30ab: lea    rcx,[rip+0x248733e]        # 0x14264a3f0
0x1401c30b2: call   0x140ad9960
0x1401c30b7: nop
0x1401c30b8: lea    rcx,[rbp+0x1b10]
0x1401c30bf: call   0x140067e30
0x1401c30c4: jmp    0x1401c3143
0x1401c30c6: lea    rdx,[rip+0x1440673]        # 0x141603740  'Skirmishing'
0x1401c30cd: lea    rcx,[rbp+0x1b30]
0x1401c30d4: call   0x140068150
0x1401c30d9: nop
0x1401c30da: xor    r9d,r9d
0x1401c30dd: xor    r8d,r8d
0x1401c30e0: lea    rdx,[rbp+0x1b30]
0x1401c30e7: lea    rcx,[rip+0x2487302]        # 0x14264a3f0
0x1401c30ee: call   0x140ad9960
0x1401c30f3: nop
0x1401c30f4: lea    rcx,[rbp+0x1b30]
0x1401c30fb: call   0x140067e30
0x1401c3100: jmp    0x1401c3143
0x1401c3102: lea    rdx,[rip+0x14405f7]        # 0x141603700  'No contact'
0x1401c3109: lea    rcx,[rbp+0x1b50]
0x1401c3110: call   0x140068150
0x1401c3115: nop
0x1401c3116: xor    r9d,r9d
0x1401c3119: xor    r8d,r8d
0x1401c311c: lea    rdx,[rbp+0x1b50]
0x1401c3123: lea    rcx,[rip+0x24872c6]        # 0x14264a3f0
0x1401c312a: call   0x140ad9960
0x1401c312f: nop
0x1401c3130: lea    rcx,[rbp+0x1b50]
0x1401c3137: call   0x140067e30
0x1401c313c: jmp    0x1401c3143
0x1401c313e: test   rdi,rdi
0x1401c3141: je     0x1401c31a6
0x1401c3143: mov    edx,0x8
0x1401c3148: mov    rcx,rdi
0x1401c314b: call   0x1409b4e40
0x1401c3150: cmp    eax,DWORD PTR [rip+0x21d051e]        # 0x142393674
0x1401c3156: jne    0x1401c31a6
0x1401c3158: mov    r8d,r15d
0x1401c315b: mov    edx,0xa
0x1401c3160: lea    rcx,[rip+0x2487289]        # 0x14264a3f0
0x1401c3167: call   0x1400bb120
0x1401c316c: lea    rdx,[rip+0x14405dd]        # 0x141603750  'Economically linked to you'
0x1401c3173: lea    rcx,[rbp+0x1b70]
0x1401c317a: call   0x140068150
0x1401c317f: nop
0x1401c3180: xor    r9d,r9d
0x1401c3183: xor    r8d,r8d
0x1401c3186: lea    rdx,[rbp+0x1b70]
0x1401c318d: lea    rcx,[rip+0x248725c]        # 0x14264a3f0
0x1401c3194: call   0x140ad9960
0x1401c3199: nop
0x1401c319a: lea    rcx,[rbp+0x1b70]
0x1401c31a1: call   0x140067e30
0x1401c31a6: lea    eax,[r12-0xa]
0x1401c31ab: mov    DWORD PTR [rbp-0x68],eax
0x1401c31ae: mov    rax,QWORD PTR [rsp+0x78]
0x1401c31b3: lea    r13,[rax+0x1f8]
0x1401c31ba: lea    r14,[rax+0x1e0]
0x1401c31c1: mov    QWORD PTR [rbp-0x28],r14
0x1401c31c5: mov    rcx,r14
0x1401c31c8: call   0x14006ee50
0x1401c31cd: mov    rbx,rax
0x1401c31d0: mov    rcx,r13
0x1401c31d3: call   0x14006ee50
0x1401c31d8: add    ebx,eax
0x1401c31da: mov    rcx,r14
0x1401c31dd: call   0x14006ee50
0x1401c31e2: lea    edi,[rbx+0x1]
0x1401c31e5: test   rax,rax
0x1401c31e8: cmove  edi,ebx
0x1401c31eb: mov    rcx,r13
0x1401c31ee: call   0x14006ee50
0x1401c31f3: lea    ecx,[rdi+0x1]
0x1401c31f6: test   rax,rax
0x1401c31f9: cmove  ecx,edi
0x1401c31fc: mov    DWORD PTR [rsp+0x74],ecx
0x1401c3200: mov    rcx,r14
0x1401c3203: call   0x14006ee50
0x1401c3208: mov    rdi,rax
0x1401c320b: mov    QWORD PTR [rbp-0x30],rax
0x1401c320f: mov    rcx,r13
0x1401c3212: call   0x14006ee50
0x1401c3217: mov    rbx,rax
0x1401c321a: mov    eax,DWORD PTR [rsp+0x74]
0x1401c321e: mov    ecx,DWORD PTR [rbp-0x68]
0x1401c3221: cmp    eax,ecx
0x1401c3223: jle    0x1401c3256
0x1401c3225: sub    eax,ecx
0x1401c3227: mov    r8d,eax
0x1401c322a: mov    r9d,DWORD PTR [rbp-0x6c]
0x1401c322e: xchg   ax,ax
0x1401c3230: lea    eax,[rbx-0x1]
0x1401c3233: mov    ecx,ebx
0x1401c3235: cmp    edi,ebx
0x1401c3237: cmovle ecx,eax
0x1401c323a: lea    eax,[rdi-0x1]
0x1401c323d: cmovle eax,edi
0x1401c3240: sub    r8,0x1
0x1401c3244: mov    edi,eax
0x1401c3246: mov    ebx,ecx
0x1401c3248: jne    0x1401c3230
0x1401c324a: mov    QWORD PTR [rbp-0x30],rdi
0x1401c324e: mov    QWORD PTR [rbp-0x60],r12
0x1401c3252: mov    DWORD PTR [rbp-0x6c],r9d
0x1401c3256: mov    edx,0xb
0x1401c325b: mov    DWORD PTR [rbp-0x48],edx
0x1401c325e: test   ebx,ebx
0x1401c3260: jle    0x1401c3439
0x1401c3266: mov    r8d,r15d
0x1401c3269: lea    rcx,[rip+0x2487180]        # 0x14264a3f0
0x1401c3270: call   0x1400bb120
0x1401c3275: mov    DWORD PTR [rbp-0x48],0xc
0x1401c327c: xor    r8d,r8d
0x1401c327f: mov    edx,0x7
0x1401c3284: mov    r9b,0x1
0x1401c3287: lea    rcx,[rip+0x2487162]        # 0x14264a3f0
0x1401c328e: call   0x1400bb130
0x1401c3293: lea    rdx,[rip+0x14404d6]        # 0x141603770  'Prisoners'
0x1401c329a: lea    rcx,[rbp+0x3850]
0x1401c32a1: call   0x140068150
0x1401c32a6: nop
0x1401c32a7: xor    r9d,r9d
0x1401c32aa: xor    r8d,r8d
0x1401c32ad: lea    rdx,[rbp+0x3850]
0x1401c32b4: lea    rcx,[rip+0x2487135]        # 0x14264a3f0
0x1401c32bb: call   0x140ad9960
0x1401c32c0: nop
0x1401c32c1: lea    rcx,[rbp+0x3850]
0x1401c32c8: call   0x140067e30
0x1401c32cd: xor    r8d,r8d
0x1401c32d0: mov    edx,0x7
0x1401c32d5: xor    r9d,r9d
0x1401c32d8: lea    rcx,[rip+0x2487111]        # 0x14264a3f0
0x1401c32df: call   0x1400bb130
0x1401c32e4: xor    r14d,r14d
0x1401c32e7: mov    rcx,r13
0x1401c32ea: call   0x14006ee50
0x1401c32ef: test   rax,rax
0x1401c32f2: je     0x1401c3435
0x1401c32f8: mov    edi,DWORD PTR [rbp-0x48]
0x1401c32fb: mov    r12,QWORD PTR [rbp-0x78]
0x1401c32ff: nop
0x1401c3300: cmp    r14d,ebx
0x1401c3303: jge    0x1401c342a
0x1401c3309: lea    rcx,[rbp+0x1070]
0x1401c3310: call   0x14006f690
0x1401c3315: nop
0x1401c3316: lea    rcx,[rbp+0x810]
0x1401c331d: call   0x140072080
0x1401c3322: movsxd rdx,r14d
0x1401c3325: mov    rcx,r13
0x1401c3328: call   0x14006f220
0x1401c332d: mov    r8,QWORD PTR [rax]
0x1401c3330: mov    WORD PTR [rsp+0x28],0x2
0x1401c3337: mov    WORD PTR [rsp+0x20],0x1
0x1401c333e: lea    r9,[rbp+0x810]
0x1401c3345: mov    r8d,DWORD PTR [r8+0xe0]
0x1401c334c: lea    rdx,[rbp+0x1070]
0x1401c3353: lea    rcx,[rip+0x233695e]        # 0x1424f9cb8
0x1401c335a: call   0x140b92f10
0x1401c335f: mov    r8d,r15d
0x1401c3362: mov    edx,edi
0x1401c3364: lea    rcx,[rip+0x2487085]        # 0x14264a3f0
0x1401c336b: call   0x1400bb120
0x1401c3370: inc    edi
0x1401c3372: lea    rcx,[rbp+0x1070]
0x1401c3379: call   0x14006f330
0x1401c337e: cmp    rax,r12
0x1401c3381: jb     0x1401c33ed
0x1401c3383: lea    r15d,[rsi-0x8]
0x1401c3387: test   r15d,r15d
0x1401c338a: js     0x1401c33a2
0x1401c338c: movsxd rdx,esi
0x1401c338f: sub    rdx,0x8
0x1401c3393: xor    r8d,r8d
0x1401c3396: lea    rcx,[rbp+0x1070]
0x1401c339d: call   0x1400e1230
0x1401c33a2: cmp    r15d,0x3
0x1401c33a6: jle    0x1401c33e8
0x1401c33a8: movsxd rdx,esi
0x1401c33ab: sub    rdx,0xb
0x1401c33af: lea    rcx,[rbp+0x1070]
0x1401c33b6: call   0x1400fb540
0x1401c33bb: mov    BYTE PTR [rax],0x2e
0x1401c33be: lea    eax,[rsi-0xa]
0x1401c33c1: movsxd rdx,eax
0x1401c33c4: lea    rcx,[rbp+0x1070]
0x1401c33cb: call   0x1400fb540
0x1401c33d0: mov    BYTE PTR [rax],0x2e
0x1401c33d3: lea    eax,[rsi-0x9]
0x1401c33d6: movsxd rdx,eax
0x1401c33d9: lea    rcx,[rbp+0x1070]
0x1401c33e0: call   0x1400fb540
0x1401c33e5: mov    BYTE PTR [rax],0x2e
0x1401c33e8: mov    r15d,DWORD PTR [rsp+0x70]
0x1401c33ed: xor    r9d,r9d
0x1401c33f0: xor    r8d,r8d
0x1401c33f3: lea    rdx,[rbp+0x1070]
0x1401c33fa: lea    rcx,[rip+0x2486fef]        # 0x14264a3f0
0x1401c3401: call   0x140ad9960
0x1401c3406: nop
0x1401c3407: lea    rcx,[rbp+0x1070]
0x1401c340e: call   0x140067e30
0x1401c3413: inc    r14d
0x1401c3416: mov    rcx,r13
0x1401c3419: call   0x14006ee50
0x1401c341e: movsxd rcx,r14d
0x1401c3421: cmp    rcx,rax
0x1401c3424: jb     0x1401c3300
0x1401c342a: mov    DWORD PTR [rbp-0x48],edi
0x1401c342d: mov    r12,QWORD PTR [rbp-0x60]
0x1401c3431: mov    rdi,QWORD PTR [rbp-0x30]
0x1401c3435: mov    r14,QWORD PTR [rbp-0x28]
0x1401c3439: test   edi,edi
0x1401c343b: jle    0x1401c35e1
0x1401c3441: mov    r8d,r15d
0x1401c3444: mov    ebx,DWORD PTR [rbp-0x48]
0x1401c3447: mov    edx,ebx
0x1401c3449: lea    rcx,[rip+0x2486fa0]        # 0x14264a3f0
0x1401c3450: call   0x1400bb120
0x1401c3455: inc    ebx
0x1401c3457: xor    r8d,r8d
0x1401c345a: mov    edx,0x7
0x1401c345f: mov    r9b,0x1
0x1401c3462: lea    rcx,[rip+0x2486f87]        # 0x14264a3f0
0x1401c3469: call   0x1400bb130
0x1401c346e: lea    rdx,[rip+0x144030b]        # 0x141603780  'Artifacts (Rumored)'
0x1401c3475: lea    rcx,[rbp+0x3830]
0x1401c347c: call   0x140068150
0x1401c3481: nop
0x1401c3482: xor    r9d,r9d
0x1401c3485: xor    r8d,r8d
0x1401c3488: lea    rdx,[rbp+0x3830]
0x1401c348f: lea    rcx,[rip+0x2486f5a]        # 0x14264a3f0
0x1401c3496: call   0x140ad9960
0x1401c349b: nop
0x1401c349c: lea    rcx,[rbp+0x3830]
0x1401c34a3: call   0x140067e30
0x1401c34a8: xor    r8d,r8d
0x1401c34ab: mov    edx,0x7
0x1401c34b0: xor    r9d,r9d
0x1401c34b3: lea    rcx,[rip+0x2486f36]        # 0x14264a3f0
0x1401c34ba: call   0x1400bb130
0x1401c34bf: mov    rcx,r14
0x1401c34c2: call   0x14006ee50
0x1401c34c7: test   rax,rax
0x1401c34ca: je     0x1401c35e1
0x1401c34d0: mov    r12,QWORD PTR [rbp-0x78]
0x1401c34d4: xor    r13d,r13d
0x1401c34d7: cmp    r13d,edi
0x1401c34da: jge    0x1401c35dd
0x1401c34e0: lea    rcx,[rbp+0x1090]
0x1401c34e7: call   0x14006f690
0x1401c34ec: nop
0x1401c34ed: movsxd rdx,r13d
0x1401c34f0: mov    rcx,r14
0x1401c34f3: call   0x14006f220
0x1401c34f8: mov    r8,QWORD PTR [rax]
0x1401c34fb: xor    r9d,r9d
0x1401c34fe: mov    r8d,DWORD PTR [r8]
0x1401c3501: lea    rdx,[rbp+0x1090]
0x1401c3508: lea    rcx,[rip+0x23367a9]        # 0x1424f9cb8
0x1401c350f: call   0x140b94400
0x1401c3514: mov    r8d,r15d
0x1401c3517: mov    edx,ebx
0x1401c3519: lea    rcx,[rip+0x2486ed0]        # 0x14264a3f0
0x1401c3520: call   0x1400bb120
0x1401c3525: inc    ebx
0x1401c3527: mov    DWORD PTR [rbp-0x48],ebx
0x1401c352a: lea    rcx,[rbp+0x1090]
0x1401c3531: call   0x14006f330
0x1401c3536: cmp    rax,r12
0x1401c3539: jb     0x1401c35a0
0x1401c353b: lea    ebx,[rsi-0x8]
0x1401c353e: test   ebx,ebx
0x1401c3540: js     0x1401c3558
0x1401c3542: movsxd rdx,esi
0x1401c3545: sub    rdx,0x8
0x1401c3549: xor    r8d,r8d
0x1401c354c: lea    rcx,[rbp+0x1090]
0x1401c3553: call   0x1400e1230
0x1401c3558: cmp    ebx,0x3
0x1401c355b: jle    0x1401c359d
0x1401c355d: movsxd rdx,esi
0x1401c3560: sub    rdx,0xb
0x1401c3564: lea    rcx,[rbp+0x1090]
0x1401c356b: call   0x1400fb540
0x1401c3570: mov    BYTE PTR [rax],0x2e
0x1401c3573: lea    eax,[rsi-0xa]
0x1401c3576: movsxd rdx,eax
0x1401c3579: lea    rcx,[rbp+0x1090]
0x1401c3580: call   0x1400fb540
0x1401c3585: mov    BYTE PTR [rax],0x2e
0x1401c3588: lea    eax,[rsi-0x9]
0x1401c358b: movsxd rdx,eax
0x1401c358e: lea    rcx,[rbp+0x1090]
0x1401c3595: call   0x1400fb540
0x1401c359a: mov    BYTE PTR [rax],0x2e
0x1401c359d: mov    ebx,DWORD PTR [rbp-0x48]
0x1401c35a0: xor    r9d,r9d
0x1401c35a3: xor    r8d,r8d
0x1401c35a6: lea    rdx,[rbp+0x1090]
0x1401c35ad: lea    rcx,[rip+0x2486e3c]        # 0x14264a3f0
0x1401c35b4: call   0x140ad9960
0x1401c35b9: nop
0x1401c35ba: lea    rcx,[rbp+0x1090]
0x1401c35c1: call   0x140067e30
0x1401c35c6: inc    r13d
0x1401c35c9: mov    rcx,r14
0x1401c35cc: call   0x14006ee50
0x1401c35d1: movsxd rcx,r13d
0x1401c35d4: cmp    rcx,rax
0x1401c35d7: jb     0x1401c34d7
0x1401c35dd: mov    r12,QWORD PTR [rbp-0x60]
0x1401c35e1: mov    rbx,QWORD PTR [rbp-0x20]
0x1401c35e5: cmp    QWORD PTR [rbp-0x10],rbx
0x1401c35e9: jne    0x1401c381f
0x1401c35ef: test   rbx,rbx
0x1401c35f2: je     0x1401c381f
0x1401c35f8: mov    r13,QWORD PTR [rsp+0x78]
0x1401c35fd: movzx  r8d,WORD PTR [r13+0x1d4]
0x1401c3605: movzx  edx,WORD PTR [r13+0x1d0]
0x1401c360d: mov    rcx,QWORD PTR [rip+0x2328544]        # 0x1424ebb58
0x1401c3614: call   0x1401bc2d0
0x1401c3619: mov    edi,DWORD PTR [rbp-0x6c]
0x1401c361c: test   eax,eax
0x1401c361e: js     0x1401c37bf
0x1401c3624: cmp    BYTE PTR [r13+0x210],0x0
0x1401c362c: jne    0x1401c368e
0x1401c362e: xor    r8d,r8d
0x1401c3631: xor    edx,edx
0x1401c3633: mov    r9b,0x1
0x1401c3636: lea    rcx,[rip+0x2486db3]        # 0x14264a3f0
0x1401c363d: call   0x1400bb130
0x1401c3642: mov    r8d,r15d
0x1401c3645: lea    edx,[rdi-0x1]
0x1401c3648: lea    rcx,[rip+0x2486da1]        # 0x14264a3f0
0x1401c364f: call   0x1400bb120
0x1401c3654: lea    rdx,[rip+0x144013d]        # 0x141603798  'Cannot raid your civilization'
0x1401c365b: lea    rcx,[rbp+0x3810]
0x1401c3662: call   0x140068150
0x1401c3667: nop
0x1401c3668: xor    r9d,r9d
0x1401c366b: xor    r8d,r8d
0x1401c366e: lea    rdx,[rbp+0x3810]
0x1401c3675: lea    rcx,[rip+0x2486d74]        # 0x14264a3f0
0x1401c367c: call   0x140ad9960
0x1401c3681: nop
0x1401c3682: lea    rcx,[rbp+0x3810]
0x1401c3689: jmp    0x1401c39ae
0x1401c368e: cmp    QWORD PTR [r13+0x1c8],0x0
0x1401c3696: jne    0x1401c36f8
0x1401c3698: xor    r8d,r8d
0x1401c369b: xor    edx,edx
0x1401c369d: mov    r9b,0x1
0x1401c36a0: lea    rcx,[rip+0x2486d49]        # 0x14264a3f0
0x1401c36a7: call   0x1400bb130
0x1401c36ac: mov    r8d,r15d
0x1401c36af: lea    edx,[rdi-0x1]
0x1401c36b2: lea    rcx,[rip+0x2486d37]        # 0x14264a3f0
0x1401c36b9: call   0x1400bb120
0x1401c36be: lea    rdx,[rip+0x14403bb]        # 0x141603a80  'Cannot make request without leader'
0x1401c36c5: lea    rcx,[rbp+0x37f0]
0x1401c36cc: call   0x140068150
0x1401c36d1: nop
0x1401c36d2: xor    r9d,r9d
0x1401c36d5: xor    r8d,r8d
0x1401c36d8: lea    rdx,[rbp+0x37f0]
0x1401c36df: lea    rcx,[rip+0x2486d0a]        # 0x14264a3f0
0x1401c36e6: call   0x140ad9960
0x1401c36eb: nop
0x1401c36ec: lea    rcx,[rbp+0x37f0]
0x1401c36f3: jmp    0x1401c39ae
0x1401c36f8: lea    rcx,[r13+0x218]
0x1401c36ff: call   0x14006ee50
0x1401c3704: xor    r8d,r8d
0x1401c3707: mov    r9b,0x1
0x1401c370a: lea    rcx,[rip+0x2486cdf]        # 0x14264a3f0
0x1401c3711: test   rax,rax
0x1401c3714: jne    0x1401c3769
0x1401c3716: xor    edx,edx
0x1401c3718: call   0x1400bb130
0x1401c371d: mov    r8d,r15d
0x1401c3720: lea    edx,[rdi-0x1]
0x1401c3723: lea    rcx,[rip+0x2486cc6]        # 0x14264a3f0
0x1401c372a: call   0x1400bb120
0x1401c372f: lea    rdx,[rip+0x1440372]        # 0x141603aa8  'No workers available'
0x1401c3736: lea    rcx,[rbp+0x37d0]
0x1401c373d: call   0x140068150
0x1401c3742: nop
0x1401c3743: xor    r9d,r9d
0x1401c3746: xor    r8d,r8d
0x1401c3749: lea    rdx,[rbp+0x37d0]
0x1401c3750: lea    rcx,[rip+0x2486c99]        # 0x14264a3f0
0x1401c3757: call   0x140ad9960
0x1401c375c: nop
0x1401c375d: lea    rcx,[rbp+0x37d0]
0x1401c3764: jmp    0x1401c39ae
0x1401c3769: mov    edx,0x7
0x1401c376e: call   0x1400bb130
0x1401c3773: mov    r8d,r15d
0x1401c3776: lea    edx,[rdi-0x1]
0x1401c3779: lea    rcx,[rip+0x2486c70]        # 0x14264a3f0
0x1401c3780: call   0x1400bb120
0x1401c3785: lea    rdx,[rip+0x1440334]        # 0x141603ac0  'Click to request workers'
0x1401c378c: lea    rcx,[rbp+0x37b0]
0x1401c3793: call   0x140068150
0x1401c3798: nop
0x1401c3799: xor    r9d,r9d
0x1401c379c: xor    r8d,r8d
0x1401c379f: lea    rdx,[rbp+0x37b0]
0x1401c37a6: lea    rcx,[rip+0x2486c43]        # 0x14264a3f0
0x1401c37ad: call   0x140ad9960
0x1401c37b2: nop
0x1401c37b3: lea    rcx,[rbp+0x37b0]
0x1401c37ba: jmp    0x1401c39ae
0x1401c37bf: xor    r8d,r8d
0x1401c37c2: xor    edx,edx
0x1401c37c4: mov    r9b,0x1
0x1401c37c7: lea    rcx,[rip+0x2486c22]        # 0x14264a3f0
0x1401c37ce: call   0x1400bb130
0x1401c37d3: mov    r8d,r15d
0x1401c37d6: lea    edx,[rdi-0x1]
0x1401c37d9: lea    rcx,[rip+0x2486c10]        # 0x14264a3f0
0x1401c37e0: call   0x1400bb120
0x1401c37e5: lea    rdx,[rip+0x14402f4]        # 0x141603ae0  'Inaccessible mission location'
0x1401c37ec: lea    rcx,[rbp+0x3790]
0x1401c37f3: call   0x140068150
0x1401c37f8: nop
0x1401c37f9: xor    r9d,r9d
0x1401c37fc: xor    r8d,r8d
0x1401c37ff: lea    rdx,[rbp+0x3790]
0x1401c3806: lea    rcx,[rip+0x2486be3]        # 0x14264a3f0
0x1401c380d: call   0x140ad9960
0x1401c3812: nop
0x1401c3813: lea    rcx,[rbp+0x3790]
0x1401c381a: jmp    0x1401c39ae
0x1401c381f: mov    r13,QWORD PTR [rsp+0x78]
0x1401c3824: cmp    QWORD PTR [r13+0x1c0],0x0
0x1401c382c: jne    0x1401c389a
0x1401c382e: cmp    QWORD PTR [r13+0x1b8],0x0
0x1401c3836: jne    0x1401c389a
0x1401c3838: xor    r8d,r8d
0x1401c383b: xor    edx,edx
0x1401c383d: mov    r9b,0x1
0x1401c3840: lea    rcx,[rip+0x2486ba9]        # 0x14264a3f0
0x1401c3847: call   0x1400bb130
0x1401c384c: lea    edx,[r12-0x1]
0x1401c3851: mov    r8d,r15d
0x1401c3854: lea    rcx,[rip+0x2486b95]        # 0x14264a3f0
0x1401c385b: call   0x1400bb120
0x1401c3860: lea    rdx,[rip+0x1440299]        # 0x141603b00  'Cannot order mission without leader'
0x1401c3867: lea    rcx,[rbp+0x3770]
0x1401c386e: call   0x140068150
0x1401c3873: nop
0x1401c3874: xor    r9d,r9d
0x1401c3877: xor    r8d,r8d
0x1401c387a: lea    rdx,[rbp+0x3770]
0x1401c3881: lea    rcx,[rip+0x2486b68]        # 0x14264a3f0
0x1401c3888: call   0x140ad9960
0x1401c388d: nop
0x1401c388e: lea    rcx,[rbp+0x3770]
0x1401c3895: jmp    0x1401c39ae
0x1401c389a: movzx  r8d,WORD PTR [r13+0x1d4]
0x1401c38a2: movzx  edx,WORD PTR [r13+0x1d0]
0x1401c38aa: mov    rcx,QWORD PTR [rip+0x23282a7]        # 0x1424ebb58
0x1401c38b1: call   0x1401bc2d0
0x1401c38b6: mov    edi,DWORD PTR [rbp-0x6c]
0x1401c38b9: xor    r8d,r8d
0x1401c38bc: mov    r9b,0x1
0x1401c38bf: lea    rcx,[rip+0x2486b2a]        # 0x14264a3f0
0x1401c38c6: test   eax,eax
0x1401c38c8: js     0x1401c3960
0x1401c38ce: mov    edx,0x7
0x1401c38d3: call   0x1400bb130
0x1401c38d8: mov    r8d,r15d
0x1401c38db: lea    edx,[rdi-0x1]
0x1401c38de: lea    rcx,[rip+0x2486b0b]        # 0x14264a3f0
0x1401c38e5: call   0x1400bb120
0x1401c38ea: test   rbx,rbx
0x1401c38ed: jne    0x1401c3929
0x1401c38ef: lea    rdx,[rip+0x1440232]        # 0x141603b28  'Click to explore this site (creates new mission)'
0x1401c38f6: lea    rcx,[rbp+0x3590]
0x1401c38fd: call   0x140068150
0x1401c3902: nop
0x1401c3903: xor    r9d,r9d
0x1401c3906: xor    r8d,r8d
0x1401c3909: lea    rdx,[rbp+0x3590]
0x1401c3910: lea    rcx,[rip+0x2486ad9]        # 0x14264a3f0
0x1401c3917: call   0x140ad9960
0x1401c391c: nop
0x1401c391d: lea    rcx,[rbp+0x3590]
0x1401c3924: jmp    0x1401c39ae
0x1401c3929: lea    rdx,[rip+0x1440230]        # 0x141603b60  'Click to contact/raid this site (creates new mission)'
0x1401c3930: lea    rcx,[rbp+0x34f0]
0x1401c3937: call   0x140068150
0x1401c393c: nop
0x1401c393d: xor    r9d,r9d
0x1401c3940: xor    r8d,r8d
0x1401c3943: lea    rdx,[rbp+0x34f0]
0x1401c394a: lea    rcx,[rip+0x2486a9f]        # 0x14264a3f0
0x1401c3951: call   0x140ad9960
0x1401c3956: nop
0x1401c3957: lea    rcx,[rbp+0x34f0]
0x1401c395e: jmp    0x1401c39ae
0x1401c3960: xor    edx,edx
0x1401c3962: call   0x1400bb130
0x1401c3967: mov    r8d,r15d
0x1401c396a: lea    edx,[rdi-0x1]
0x1401c396d: lea    rcx,[rip+0x2486a7c]        # 0x14264a3f0
0x1401c3974: call   0x1400bb120
0x1401c3979: lea    rdx,[rip+0x1440160]        # 0x141603ae0  'Inaccessible mission location'
0x1401c3980: lea    rcx,[rbp+0x3470]
0x1401c3987: call   0x140068150
0x1401c398c: nop
0x1401c398d: xor    r9d,r9d
0x1401c3990: xor    r8d,r8d
0x1401c3993: lea    rdx,[rbp+0x3470]
0x1401c399a: lea    rcx,[rip+0x2486a4f]        # 0x14264a3f0
0x1401c39a1: call   0x140ad9960
0x1401c39a6: nop
0x1401c39a7: lea    rcx,[rbp+0x3470]
0x1401c39ae: call   0x140067e30
0x1401c39b3: nop
0x1401c39b4: lea    rcx,[rbp+0x10b0]
0x1401c39bb: call   0x140067e30
0x1401c39c0: nop
0x1401c39c1: lea    rcx,[rbp+0xe10]
0x1401c39c8: call   0x140067e30
0x1401c39cd: jmp    0x1401c6068
0x1401c39d2: mov    r13d,DWORD PTR [rbp-0x18]
0x1401c39d6: mov    DWORD PTR [rsp+0x74],r13d
0x1401c39db: lea    ebx,[r13-0x37]
0x1401c39df: mov    DWORD PTR [rsp+0x70],ebx
0x1401c39e3: lea    ecx,[rbx-0x2]
0x1401c39e6: mov    DWORD PTR [rbp-0x58],ecx
0x1401c39e9: mov    r12d,0x14
0x1401c39ef: mov    eax,DWORD PTR [rip+0x2209d93]        # 0x1423cd788
0x1401c39f5: cmp    eax,0x2e
0x1401c39f8: jle    0x1401c3a12
0x1401c39fa: lea    r12d,[rax-0x1a]
0x1401c39fe: cmp    r12d,0x1e
0x1401c3a02: jle    0x1401c3a12
0x1401c3a04: mov    r12d,0x1e
0x1401c3a0a: mov    edi,r13d
0x1401c3a0d: mov    r14d,esi
0x1401c3a10: jmp    0x1401c3a21
0x1401c3a12: mov    edi,r13d
0x1401c3a15: mov    r14d,esi
0x1401c3a18: test   r12d,r12d
0x1401c3a1b: js     0x1401c3aff
0x1401c3a21: mov    ebx,ecx
0x1401c3a23: cmp    ecx,edi
0x1401c3a25: jg     0x1401c3aea
0x1401c3a2b: movsxd r15,r12d
0x1401c3a2e: mov    r13d,DWORD PTR [rbp-0x58]
0x1401c3a32: mov    r8d,ebx
0x1401c3a35: mov    edx,r14d
0x1401c3a38: lea    rcx,[rip+0x24869b1]        # 0x14264a3f0
0x1401c3a3f: call   0x1400bb120
0x1401c3a44: xor    r8d,r8d
0x1401c3a47: xor    edx,edx
0x1401c3a49: lea    rcx,[rip+0x24869a0]        # 0x14264a3f0
0x1401c3a50: call   0x1400bb190
0x1401c3a55: test   rsi,rsi
0x1401c3a58: jne    0x1401c3a82
0x1401c3a5a: cmp    ebx,r13d
0x1401c3a5d: jne    0x1401c3a67
0x1401c3a5f: mov    edx,DWORD PTR [rip+0x24882af]        # 0x14264bd14
0x1401c3a65: jmp    0x1401c3acc
0x1401c3a67: lea    rcx,[rip+0x2486982]        # 0x14264a3f0
0x1401c3a6e: cmp    ebx,edi
0x1401c3a70: jne    0x1401c3a7a
0x1401c3a72: mov    edx,DWORD PTR [rip+0x24882b4]        # 0x14264bd2c
0x1401c3a78: jmp    0x1401c3ad3
0x1401c3a7a: mov    edx,DWORD PTR [rip+0x24882a0]        # 0x14264bd20
0x1401c3a80: jmp    0x1401c3ad3
0x1401c3a82: cmp    rsi,r15
0x1401c3a85: jne    0x1401c3aaf
0x1401c3a87: cmp    ebx,r13d
0x1401c3a8a: jne    0x1401c3a94
0x1401c3a8c: mov    edx,DWORD PTR [rip+0x248828a]        # 0x14264bd1c
0x1401c3a92: jmp    0x1401c3acc
0x1401c3a94: lea    rcx,[rip+0x2486955]        # 0x14264a3f0
0x1401c3a9b: cmp    ebx,edi
0x1401c3a9d: jne    0x1401c3aa7
0x1401c3a9f: mov    edx,DWORD PTR [rip+0x248828f]        # 0x14264bd34
0x1401c3aa5: jmp    0x1401c3ad3
0x1401c3aa7: mov    edx,DWORD PTR [rip+0x248827b]        # 0x14264bd28
0x1401c3aad: jmp    0x1401c3ad3
0x1401c3aaf: cmp    ebx,r13d
0x1401c3ab2: jne    0x1401c3abc
0x1401c3ab4: mov    edx,DWORD PTR [rip+0x248825e]        # 0x14264bd18
0x1401c3aba: jmp    0x1401c3acc
0x1401c3abc: cmp    ebx,edi
0x1401c3abe: mov    edx,DWORD PTR [rip+0x248826c]        # 0x14264bd30
0x1401c3ac4: je     0x1401c3acc
0x1401c3ac6: mov    edx,DWORD PTR [rip+0x2488258]        # 0x14264bd24
0x1401c3acc: lea    rcx,[rip+0x248691d]        # 0x14264a3f0
0x1401c3ad3: call   0x140adaad0
0x1401c3ad8: inc    ebx
0x1401c3ada: cmp    ebx,edi
0x1401c3adc: jle    0x1401c3a32
0x1401c3ae2: mov    r13d,DWORD PTR [rsp+0x74]
0x1401c3ae7: mov    ecx,DWORD PTR [rbp-0x58]
0x1401c3aea: inc    r14d
0x1401c3aed: inc    rsi
0x1401c3af0: cmp    r14d,r12d
0x1401c3af3: jle    0x1401c3a21
0x1401c3af9: lea    ebx,[r13-0x37]
0x1401c3afd: xor    esi,esi
0x1401c3aff: lea    eax,[r13-0x2]
0x1401c3b03: mov    DWORD PTR [rbp-0x6c],eax
0x1401c3b06: lea    ecx,[r12-0x1]
0x1401c3b0b: mov    eax,0x55555556
0x1401c3b10: imul   ecx
0x1401c3b12: mov    edi,edx
0x1401c3b14: shr    edi,0x1f
0x1401c3b17: add    edi,edx
0x1401c3b19: mov    DWORD PTR [rbp-0x68],edi
0x1401c3b1c: mov    r15,QWORD PTR [rsp+0x78]
0x1401c3b21: add    r15,0x230
0x1401c3b28: mov    QWORD PTR [rbp-0x20],r15
0x1401c3b2c: mov    rcx,r15
0x1401c3b2f: call   0x14006ee50
0x1401c3b34: mov    rdx,rax
0x1401c3b37: mov    QWORD PTR [rbp-0x28],rax
0x1401c3b3b: cmp    eax,edi
0x1401c3b3d: jle    0x1401c3b49
0x1401c3b3f: lea    r12d,[r13-0x4]
0x1401c3b43: mov    DWORD PTR [rbp-0x6c],r12d
0x1401c3b47: jmp    0x1401c3b4d
0x1401c3b49: mov    r12d,DWORD PTR [rbp-0x6c]
0x1401c3b4d: mov    r14,rsi
0x1401c3b50: mov    QWORD PTR [rbp-0x78],rsi
0x1401c3b54: mov    DWORD PTR [rbp-0x70],0x1
0x1401c3b5b: mov    r13,QWORD PTR [rsp+0x78]
0x1401c3b60: mov    ecx,DWORD PTR [r13+0x2b0]
0x1401c3b67: sub    eax,edi
0x1401c3b69: cmp    ecx,eax
0x1401c3b6b: cmovle eax,ecx
0x1401c3b6e: xor    ecx,ecx
0x1401c3b70: test   eax,eax
0x1401c3b72: cmovns ecx,eax
0x1401c3b75: mov    DWORD PTR [rbp-0x10],ecx
0x1401c3b78: lea    eax,[rdi+rcx*1]
0x1401c3b7b: mov    DWORD PTR [rsp+0x74],eax
0x1401c3b7f: cmp    ecx,eax
0x1401c3b81: jge    0x1401c4706
0x1401c3b87: mov    eax,DWORD PTR [rbp+0x38]
0x1401c3b8a: mov    DWORD PTR [rbp-0x48],eax
0x1401c3b8d: nop    DWORD PTR [rax]
0x1401c3b90: cmp    ecx,edx
0x1401c3b92: jge    0x1401c4682
0x1401c3b98: movsxd rdx,ecx
0x1401c3b9b: mov    rcx,r15
0x1401c3b9e: call   0x14006f220
0x1401c3ba3: mov    rdi,QWORD PTR [rax]
0x1401c3ba6: mov    QWORD PTR [rbp-0x60],rdi
0x1401c3baa: cmp    BYTE PTR [rip+0x21cca24],0x0        # 0x1423905d5
0x1401c3bb1: je     0x1401c401e
0x1401c3bb7: mov    eax,DWORD PTR [rbp-0x38]
0x1401c3bba: cmp    eax,ebx
0x1401c3bbc: jl     0x1401c401e
0x1401c3bc2: mov    ebx,DWORD PTR [rbp-0x70]
0x1401c3bc5: cmp    eax,r12d
0x1401c3bc8: jg     0x1401c4021
0x1401c3bce: mov    ecx,DWORD PTR [rbp-0x3c]
0x1401c3bd1: cmp    ecx,ebx
0x1401c3bd3: jl     0x1401c4021
0x1401c3bd9: lea    eax,[rbx+0x2]
0x1401c3bdc: cmp    ecx,eax
0x1401c3bde: jg     0x1401c4021
0x1401c3be4: cmp    QWORD PTR [r13+0x248],rdi
0x1401c3beb: je     0x1401c4012
0x1401c3bf1: mov    QWORD PTR [r13+0x248],rdi
0x1401c3bf8: lea    rsi,[r13+0x250]
0x1401c3bff: mov    rcx,rsi
0x1401c3c02: call   0x14006f290
0x1401c3c07: lea    r15,[r13+0x268]
0x1401c3c0e: mov    rcx,r15
0x1401c3c11: call   0x14006f290
0x1401c3c16: lea    r12,[r13+0x280]
0x1401c3c1d: mov    QWORD PTR [rbp-0x30],r12
0x1401c3c21: mov    rcx,r12
0x1401c3c24: call   0x14006f290
0x1401c3c29: add    r13,0x298
0x1401c3c30: mov    QWORD PTR [rbp-0x78],r13
0x1401c3c34: mov    rcx,r13
0x1401c3c37: call   0x14006f290
0x1401c3c3c: lea    rdx,[rbp+0x78]
0x1401c3c40: lea    rcx,[rdi+0x1450]
0x1401c3c47: call   0x14006f240
0x1401c3c4c: lea    rdx,[rbp+0xe8]
0x1401c3c53: lea    rcx,[rdi+0x1450]
0x1401c3c5a: call   0x14006f230
0x1401c3c5f: lea    r8,[rbp+0xe8]
0x1401c3c66: lea    rdx,[rbp+0x4]
0x1401c3c6a: lea    rcx,[rbp+0x78]
0x1401c3c6e: call   0x14006ee20
0x1401c3c73: xor    edx,edx
0x1401c3c75: movzx  ecx,BYTE PTR [rax]
0x1401c3c78: call   0x1400657b0
0x1401c3c7d: test   al,al
0x1401c3c7f: je     0x1401c3da7
0x1401c3c85: xor    r12d,r12d
0x1401c3c88: nop    DWORD PTR [rax+rax*1+0x0]
0x1401c3c90: lea    rcx,[rbp+0x78]
0x1401c3c94: call   0x14006ee10
0x1401c3c99: mov    rcx,QWORD PTR [rax]
0x1401c3c9c: mov    QWORD PTR [rbp+0x1a8],rcx
0x1401c3ca3: mov    rcx,QWORD PTR [rcx+0x10]
0x1401c3ca7: cmp    DWORD PTR [rcx+0x30],0xffffffff
0x1401c3cab: jne    0x1401c3d70
0x1401c3cb1: lea    r9,[rbp+0x1c0]
0x1401c3cb8: lea    r8,[rbp+0x1c8]
0x1401c3cbf: mov    edx,DWORD PTR [rdi+0x4]
0x1401c3cc2: call   0x140beb780
0x1401c3cc7: mov    r13,rax
0x1401c3cca: test   rax,rax
0x1401c3ccd: je     0x1401c3d70
0x1401c3cd3: mov    edi,r12d
0x1401c3cd6: mov    rcx,rsi
0x1401c3cd9: call   0x14006ee50
0x1401c3cde: test   rax,rax
0x1401c3ce1: je     0x1401c3d3e
0x1401c3ce3: mov    rbx,r12
0x1401c3ce6: data16 nop WORD PTR [rax+rax*1+0x0]
0x1401c3cf0: mov    rdx,rbx
0x1401c3cf3: mov    rcx,r15
0x1401c3cf6: call   0x14006f360
0x1401c3cfb: mov    ecx,DWORD PTR [r13+0x2d0]
0x1401c3d02: cmp    DWORD PTR [rax],ecx
0x1401c3d04: mov    rcx,rsi
0x1401c3d07: jg     0x1401c3d1a
0x1401c3d09: inc    edi
0x1401c3d0b: movsxd rbx,edi
0x1401c3d0e: call   0x14006ee50
0x1401c3d13: cmp    rbx,rax
0x1401c3d16: jb     0x1401c3cf0
0x1401c3d18: jmp    0x1401c3d3e
0x1401c3d1a: movsxd rbx,edi
0x1401c3d1d: lea    r8,[rbp+0x1a8]
0x1401c3d24: mov    rdx,rbx
0x1401c3d27: call   0x1401b9f20
0x1401c3d2c: lea    r8,[r13+0x2d0]
0x1401c3d33: mov    rdx,rbx
0x1401c3d36: mov    rcx,r15
0x1401c3d39: call   0x1400b9a10
0x1401c3d3e: mov    rcx,rsi
0x1401c3d41: call   0x14006ee50
0x1401c3d46: movsxd rcx,edi
0x1401c3d49: cmp    rcx,rax
0x1401c3d4c: jne    0x1401c3d6c
0x1401c3d4e: lea    rdx,[rbp+0x1a8]
0x1401c3d55: mov    rcx,rsi
0x1401c3d58: call   0x1400b9980
0x1401c3d5d: lea    rdx,[r13+0x2d0]
0x1401c3d64: mov    rcx,r15
0x1401c3d67: call   0x14006f410
0x1401c3d6c: mov    rdi,QWORD PTR [rbp-0x60]
0x1401c3d70: lea    rcx,[rbp+0x78]
0x1401c3d74: call   0x14006ee00
0x1401c3d79: lea    r8,[rbp+0xe8]
0x1401c3d80: lea    rdx,[rbp+0x4]
0x1401c3d84: lea    rcx,[rbp+0x78]
0x1401c3d88: call   0x14006ee20
0x1401c3d8d: xor    edx,edx
0x1401c3d8f: movzx  ecx,BYTE PTR [rax]
0x1401c3d92: call   0x1400657b0
0x1401c3d97: test   al,al
0x1401c3d99: jne    0x1401c3c90
0x1401c3d9f: mov    r12,QWORD PTR [rbp-0x30]
0x1401c3da3: mov    r13,QWORD PTR [rbp-0x78]
0x1401c3da7: lea    rdx,[rbp+0x40]
0x1401c3dab: lea    rcx,[rdi+0x1398]
0x1401c3db2: call   0x14006f240
0x1401c3db7: lea    rdx,[rbp+0xf0]
0x1401c3dbe: lea    rcx,[rdi+0x1398]
0x1401c3dc5: call   0x14006f230
0x1401c3dca: lea    r8,[rbp+0xf0]
0x1401c3dd1: lea    rdx,[rbp+0x6]
0x1401c3dd5: lea    rcx,[rbp+0x40]
0x1401c3dd9: call   0x14006ee20
0x1401c3dde: xor    edx,edx
0x1401c3de0: movzx  ecx,BYTE PTR [rax]
0x1401c3de3: call   0x1400657b0
0x1401c3de8: test   al,al
0x1401c3dea: je     0x1401c3e79
0x1401c3df0: lea    rcx,[rbp+0x40]
0x1401c3df4: call   0x14006ee10
0x1401c3df9: mov    rcx,QWORD PTR [rax]
0x1401c3dfc: cmp    WORD PTR [rcx],0x1
0x1401c3e00: je     0x1401c3e4a
0x1401c3e02: lea    rcx,[rbp+0x40]
0x1401c3e06: call   0x14006ee10
0x1401c3e0b: mov    rcx,QWORD PTR [rax]
0x1401c3e0e: cmp    WORD PTR [rcx],0x2
0x1401c3e12: je     0x1401c3e4a
0x1401c3e14: lea    rcx,[rbp+0x40]
0x1401c3e18: call   0x14006ee10
0x1401c3e1d: mov    rcx,QWORD PTR [rax]
0x1401c3e20: cmp    WORD PTR [rcx],0x3
0x1401c3e24: je     0x1401c3e4a
0x1401c3e26: lea    rcx,[rbp+0x40]
0x1401c3e2a: call   0x14006ee10
0x1401c3e2f: mov    rdx,rax
0x1401c3e32: mov    rcx,r12
0x1401c3e35: call   0x1400b9980
0x1401c3e3a: mov    BYTE PTR [rbp+0x5],0x0
0x1401c3e3e: lea    rdx,[rbp+0x5]
0x1401c3e42: mov    rcx,r13
0x1401c3e45: call   0x1401f9b00
0x1401c3e4a: lea    rcx,[rbp+0x40]
0x1401c3e4e: call   0x14006ee00
0x1401c3e53: lea    r8,[rbp+0xf0]
0x1401c3e5a: lea    rdx,[rbp+0x6]
0x1401c3e5e: lea    rcx,[rbp+0x40]
0x1401c3e62: call   0x14006ee20
0x1401c3e67: xor    edx,edx
0x1401c3e69: movzx  ecx,BYTE PTR [rax]
0x1401c3e6c: call   0x1400657b0
0x1401c3e71: test   al,al
0x1401c3e73: jne    0x1401c3df0
0x1401c3e79: xor    ebx,ebx
0x1401c3e7b: mov    r14d,ebx
0x1401c3e7e: lea    rcx,[rip+0x21cf69b]        # 0x142393520
0x1401c3e85: call   0x14006ee50
0x1401c3e8a: test   rax,rax
0x1401c3e8d: je     0x1401c3ffa
0x1401c3e93: mov    edi,ebx
0x1401c3e95: mov    r15,QWORD PTR [rbp-0x60]
0x1401c3e99: nop    DWORD PTR [rax+0x0]
0x1401c3ea0: mov    rdx,rdi
0x1401c3ea3: lea    rcx,[rip+0x21cf676]        # 0x142393520
0x1401c3eaa: call   0x14006f220
0x1401c3eaf: mov    rcx,QWORD PTR [rax]
0x1401c3eb2: mov    eax,DWORD PTR [r15+0x4]
0x1401c3eb6: cmp    DWORD PTR [rcx],eax
0x1401c3eb8: jne    0x1401c3fdc
0x1401c3ebe: mov    esi,ebx
0x1401c3ec0: mov    rdx,rdi
0x1401c3ec3: lea    rcx,[rip+0x21cf656]        # 0x142393520
0x1401c3eca: call   0x14006f220
0x1401c3ecf: mov    rcx,QWORD PTR [rax]
0x1401c3ed2: add    rcx,0xc0
0x1401c3ed9: call   0x14006ee50
0x1401c3ede: test   rax,rax
0x1401c3ee1: je     0x1401c3fdc
0x1401c3ee7: nop    WORD PTR [rax+rax*1+0x0]
0x1401c3ef0: mov    rdx,rdi
0x1401c3ef3: lea    rcx,[rip+0x21cf626]        # 0x142393520
0x1401c3efa: call   0x14006f220
0x1401c3eff: mov    rcx,QWORD PTR [rax]
0x1401c3f02: add    rcx,0xc0
0x1401c3f09: mov    rdx,rbx
0x1401c3f0c: call   0x14006f220
0x1401c3f11: mov    rcx,QWORD PTR [rax]
0x1401c3f14: cmp    WORD PTR [rcx],0x1
0x1401c3f18: je     0x1401c3fae
0x1401c3f1e: mov    rdx,rdi
0x1401c3f21: lea    rcx,[rip+0x21cf5f8]        # 0x142393520
0x1401c3f28: call   0x14006f220
0x1401c3f2d: mov    rcx,QWORD PTR [rax]
0x1401c3f30: add    rcx,0xc0
0x1401c3f37: mov    rdx,rbx
0x1401c3f3a: call   0x14006f220
0x1401c3f3f: mov    rcx,QWORD PTR [rax]
0x1401c3f42: cmp    WORD PTR [rcx],0x2
0x1401c3f46: je     0x1401c3fae
0x1401c3f48: mov    rdx,rdi
0x1401c3f4b: lea    rcx,[rip+0x21cf5ce]        # 0x142393520
0x1401c3f52: call   0x14006f220
0x1401c3f57: mov    rcx,QWORD PTR [rax]
0x1401c3f5a: add    rcx,0xc0
0x1401c3f61: mov    rdx,rbx
0x1401c3f64: call   0x14006f220
0x1401c3f69: mov    rcx,QWORD PTR [rax]
0x1401c3f6c: cmp    WORD PTR [rcx],0x3
0x1401c3f70: je     0x1401c3fae
0x1401c3f72: mov    rdx,rdi
0x1401c3f75: lea    rcx,[rip+0x21cf5a4]        # 0x142393520
0x1401c3f7c: call   0x14006f220
0x1401c3f81: mov    rcx,QWORD PTR [rax]
0x1401c3f84: add    rcx,0xc0
0x1401c3f8b: mov    rdx,rbx
0x1401c3f8e: call   0x14006f220
0x1401c3f93: mov    rdx,rax
0x1401c3f96: mov    rcx,r12
0x1401c3f99: call   0x1400b9980
0x1401c3f9e: mov    BYTE PTR [rbp+0x8],0x1
0x1401c3fa2: lea    rdx,[rbp+0x8]
0x1401c3fa6: mov    rcx,r13
0x1401c3fa9: call   0x1401f9b00
0x1401c3fae: inc    esi
0x1401c3fb0: mov    rdx,rdi
0x1401c3fb3: lea    rcx,[rip+0x21cf566]        # 0x142393520
0x1401c3fba: call   0x14006f220
0x1401c3fbf: movsxd rbx,esi
0x1401c3fc2: mov    rcx,QWORD PTR [rax]
0x1401c3fc5: add    rcx,0xc0
0x1401c3fcc: call   0x14006ee50
0x1401c3fd1: cmp    rbx,rax
0x1401c3fd4: jb     0x1401c3ef0
0x1401c3fda: xor    ebx,ebx
0x1401c3fdc: inc    r14d
0x1401c3fdf: movsxd rdi,r14d
0x1401c3fe2: lea    rcx,[rip+0x21cf537]        # 0x142393520
0x1401c3fe9: call   0x14006ee50
0x1401c3fee: cmp    rdi,rax
0x1401c3ff1: jb     0x1401c3ea0
0x1401c3ff7: mov    rdi,r15
0x1401c3ffa: mov    edx,0x2
0x1401c3fff: lea    rcx,[rip+0x24863ea]        # 0x14264a3f0
0x1401c4006: call   0x140ae7c00
0x1401c400b: mov    ebx,DWORD PTR [rbp-0x70]
0x1401c400e: mov    r12d,DWORD PTR [rbp-0x6c]
0x1401c4012: mov    QWORD PTR [rbp-0x78],rdi
0x1401c4016: lea    eax,[rbx-0x1]
0x1401c4019: mov    DWORD PTR [rbp-0x48],eax
0x1401c401c: jmp    0x1401c4021
0x1401c401e: mov    ebx,DWORD PTR [rbp-0x70]
0x1401c4021: xor    r8d,r8d
0x1401c4024: mov    edx,0x7
0x1401c4029: mov    r9b,0x1
0x1401c402c: lea    rcx,[rip+0x24863bd]        # 0x14264a3f0
0x1401c4033: call   0x1400bb130
0x1401c4038: movsxd r13,DWORD PTR [rsp+0x70]
0x1401c403d: mov    esi,r13d
0x1401c4040: cmp    r13d,r12d
0x1401c4043: jg     0x1401c40db
0x1401c4049: lea    r15d,[rbx+0x3]
0x1401c404d: mov    r14,r13
0x1401c4050: mov    edi,ebx
0x1401c4052: cmp    ebx,r15d
0x1401c4055: jge    0x1401c40c9
0x1401c4057: movsxd r12,r12d
0x1401c405a: lea    rbx,[rip+0x2487d4f]        # 0x14264bdb0
0x1401c4061: mov    r8d,esi
0x1401c4064: mov    edx,edi
0x1401c4066: lea    rcx,[rip+0x2486383]        # 0x14264a3f0
0x1401c406d: call   0x1400bb120
0x1401c4072: cmp    esi,r13d
0x1401c4075: jne    0x1401c407c
0x1401c4077: mov    edx,DWORD PTR [rbx-0x18]
0x1401c407a: jmp    0x1401c4088
0x1401c407c: cmp    r14,r12
0x1401c407f: jne    0x1401c4085
0x1401c4081: mov    edx,DWORD PTR [rbx]
0x1401c4083: jmp    0x1401c4088
0x1401c4085: mov    edx,DWORD PTR [rbx-0xc]
0x1401c4088: lea    rcx,[rip+0x2486361]        # 0x14264a3f0
0x1401c408f: call   0x140adaad0
0x1401c4094: xor    edx,edx
0x1401c4096: lea    rcx,[rip+0x22096d3]        # 0x1423cd770
0x1401c409d: call   0x140071f90
0x1401c40a2: test   al,al
0x1401c40a4: je     0x1401c40b7
0x1401c40a6: mov    r8b,0x1
0x1401c40a9: xor    edx,edx
0x1401c40ab: lea    rcx,[rip+0x248633e]        # 0x14264a3f0
0x1401c40b2: call   0x1400bb190
0x1401c40b7: inc    edi
0x1401c40b9: add    rbx,0x4
0x1401c40bd: cmp    edi,r15d
0x1401c40c0: jl     0x1401c4061
0x1401c40c2: mov    ebx,DWORD PTR [rbp-0x70]
0x1401c40c5: mov    r12d,DWORD PTR [rbp-0x6c]
0x1401c40c9: inc    esi
0x1401c40cb: inc    r14
0x1401c40ce: cmp    esi,r12d
0x1401c40d1: jle    0x1401c4050
0x1401c40d7: mov    rdi,QWORD PTR [rbp-0x60]
0x1401c40db: xor    r8d,r8d
0x1401c40de: mov    edx,0x3
0x1401c40e3: mov    r9b,0x1
0x1401c40e6: lea    rcx,[rip+0x2486303]        # 0x14264a3f0
0x1401c40ed: call   0x1400bb130
0x1401c40f2: lea    edx,[rbx+0x1]
0x1401c40f5: mov    r8d,r13d
0x1401c40f8: lea    rcx,[rip+0x24862f1]        # 0x14264a3f0
0x1401c40ff: call   0x1400bb120
0x1401c4104: lea    rcx,[rbp+0xd50]
0x1401c410b: call   0x14006f690
0x1401c4110: nop
0x1401c4111: lea    rcx,[rbp+0x10d0]
0x1401c4118: call   0x14006f690
0x1401c411d: nop
0x1401c411e: cmp    BYTE PTR [rdi+0x92],0x0
0x1401c4125: je     0x1401c41b9
0x1401c412b: lea    rdx,[rbp+0x10d0]
0x1401c4132: lea    rcx,[rdi+0x20]
0x1401c4136: call   0x140a94030
0x1401c413b: lea    rdx,[rbp+0x10d0]
0x1401c4142: lea    rcx,[rbp+0xd50]
0x1401c4149: call   0x1400b9d10
0x1401c414e: lea    rdx,[rip+0x1424f83]        # 0x1415e90d8  ', '
0x1401c4155: lea    rcx,[rbp+0xd50]
0x1401c415c: call   0x14006f560
0x1401c4161: lea    rdx,[rip+0x14255b0]        # 0x1415e9718  '"'
0x1401c4168: lea    rcx,[rbp+0xd50]
0x1401c416f: call   0x14006f560
0x1401c4174: xor    r9d,r9d
0x1401c4177: mov    r8b,0x1
0x1401c417a: lea    rdx,[rbp+0x10d0]
0x1401c4181: lea    rcx,[rdi+0x20]
0x1401c4185: call   0x140a946e0
0x1401c418a: lea    rdx,[rbp+0x10d0]
0x1401c4191: lea    rcx,[rbp+0xd50]
0x1401c4198: call   0x1400b9d10
0x1401c419d: lea    rdx,[rip+0x1425574]        # 0x1415e9718  '"'
0x1401c41a4: lea    rcx,[rbp+0xd50]
0x1401c41ab: call   0x14006f560
0x1401c41b0: lea    rdx,[rip+0x1424f21]        # 0x1415e90d8  ', '
0x1401c41b7: jmp    0x1401c41c0
0x1401c41b9: lea    rdx,[rip+0x143f9d8]        # 0x141603b98  'Unnamed '
0x1401c41c0: lea    rcx,[rbp+0xd50]
0x1401c41c7: call   0x14006f560
0x1401c41cc: mov    r8d,0xffffffff
0x1401c41d2: lea    rdx,[rbp+0x10d0]
0x1401c41d9: movzx  ecx,WORD PTR [rdi+0x98]
0x1401c41e0: call   0x140aa3770
0x1401c41e5: lea    rcx,[rbp+0x10d0]
0x1401c41ec: call   0x14052d650
0x1401c41f1: lea    rdx,[rbp+0x10d0]
0x1401c41f8: lea    rcx,[rbp+0xd50]
0x1401c41ff: call   0x1400b9d10
0x1401c4204: cmp    BYTE PTR [rdi+0x92],0x0
0x1401c420b: jne    0x1401c4226
0x1401c420d: cmp    WORD PTR [rdi],0x0
0x1401c4211: jne    0x1401c4226
0x1401c4213: lea    rdx,[rip+0x143f98e]        # 0x141603ba8  ' civilization'
0x1401c421a: lea    rcx,[rbp+0xd50]
0x1401c4221: call   0x14006f560
0x1401c4226: mov    ebx,r12d
0x1401c4229: sub    ebx,r13d
0x1401c422c: lea    rcx,[rbp+0xd50]
0x1401c4233: call   0x14006f330
0x1401c4238: lea    ecx,[rbx-0x2]
0x1401c423b: movsxd rdx,ecx
0x1401c423e: cmp    rax,rdx
0x1401c4241: jb     0x1401c42a9
0x1401c4243: lea    edi,[rbx-0x3]
0x1401c4246: test   edi,edi
0x1401c4248: js     0x1401c4260
0x1401c424a: movsxd rdx,ebx
0x1401c424d: sub    rdx,0x3
0x1401c4251: xor    r8d,r8d
0x1401c4254: lea    rcx,[rbp+0xd50]
0x1401c425b: call   0x1400e1230
0x1401c4260: cmp    edi,0x3
0x1401c4263: jle    0x1401c42a5
0x1401c4265: movsxd rdx,ebx
0x1401c4268: sub    rdx,0x6
0x1401c426c: lea    rcx,[rbp+0xd50]
0x1401c4273: call   0x1400fb540
0x1401c4278: mov    BYTE PTR [rax],0x2e
0x1401c427b: lea    eax,[rbx-0x5]
0x1401c427e: movsxd rdx,eax
0x1401c4281: lea    rcx,[rbp+0xd50]
0x1401c4288: call   0x1400fb540
0x1401c428d: mov    BYTE PTR [rax],0x2e
0x1401c4290: lea    eax,[rbx-0x4]
0x1401c4293: movsxd rdx,eax
0x1401c4296: lea    rcx,[rbp+0xd50]
0x1401c429d: call   0x1400fb540
0x1401c42a2: mov    BYTE PTR [rax],0x2e
0x1401c42a5: mov    rdi,QWORD PTR [rbp-0x60]
0x1401c42a9: xor    r9d,r9d
0x1401c42ac: xor    r8d,r8d
0x1401c42af: lea    rdx,[rbp+0xd50]
0x1401c42b6: lea    rcx,[rip+0x2486133]        # 0x14264a3f0
0x1401c42bd: call   0x140ad9960
0x1401c42c2: mov    rbx,QWORD PTR [rip+0x21d5f1f]        # 0x14239a1e8
0x1401c42c9: test   rbx,rbx
0x1401c42cc: je     0x1401c45cf
0x1401c42d2: cmp    rdi,rbx
0x1401c42d5: je     0x1401c45d4
0x1401c42db: xor    r12b,r12b
0x1401c42de: xor    r13b,r13b
0x1401c42e1: xor    dil,dil
0x1401c42e4: xor    r14b,r14b
0x1401c42e7: lea    r15,[rbx+0x1028]
0x1401c42ee: mov    rsi,QWORD PTR [rbp-0x60]
0x1401c42f2: mov    edx,DWORD PTR [rsi+0x4]
0x1401c42f5: mov    rcx,r15
0x1401c42f8: call   0x1400ffa80
0x1401c42fd: test   rax,rax
0x1401c4300: je     0x1401c4336
0x1401c4302: movzx  ecx,WORD PTR [rax+0x4]
0x1401c4306: cmp    cx,0x1
0x1401c430a: je     0x1401c4333
0x1401c430c: cmp    cx,0x5
0x1401c4310: je     0x1401c4333
0x1401c4312: test   BYTE PTR [rax+0x40],0x4
0x1401c4316: je     0x1401c431d
0x1401c4318: mov    dil,0x1
0x1401c431b: jmp    0x1401c4336
0x1401c431d: cmp    cx,0x4
0x1401c4321: jne    0x1401c4328
0x1401c4323: mov    r12b,0x1
0x1401c4326: jmp    0x1401c4336
0x1401c4328: cmp    cx,0x3
0x1401c432c: jne    0x1401c4336
0x1401c432e: mov    r13b,0x1
0x1401c4331: jmp    0x1401c4336
0x1401c4333: mov    r14b,0x1
0x1401c4336: mov    rcx,rsi
0x1401c4339: call   0x14093ce30
0x1401c433e: mov    rsi,rax
0x1401c4341: mov    rcx,rbx
0x1401c4344: call   0x14093ce30
0x1401c4349: cmp    rsi,rax
0x1401c434c: je     0x1401c43ea
0x1401c4352: lea    rbx,[rax+0x1028]
0x1401c4359: mov    edx,DWORD PTR [rsi+0x4]
0x1401c435c: mov    rcx,rbx
0x1401c435f: call   0x1400ffa80
0x1401c4364: test   rax,rax
0x1401c4367: je     0x1401c4387
0x1401c4369: movzx  ecx,WORD PTR [rax+0x4]
0x1401c436d: cmp    cx,0x1
0x1401c4371: je     0x1401c4384
0x1401c4373: cmp    cx,0x5
0x1401c4377: je     0x1401c4384
0x1401c4379: test   BYTE PTR [rax+0x40],0x4
0x1401c437d: je     0x1401c4387
0x1401c437f: mov    dil,0x1
0x1401c4382: jmp    0x1401c4387
0x1401c4384: mov    r14b,0x1
0x1401c4387: mov    rax,QWORD PTR [rbp-0x60]
0x1401c438b: mov    edx,DWORD PTR [rax+0x4]
0x1401c438e: mov    rcx,rbx
0x1401c4391: call   0x1400ffa80
0x1401c4396: test   rax,rax
0x1401c4399: je     0x1401c43b9
0x1401c439b: movzx  ecx,WORD PTR [rax+0x4]
0x1401c439f: cmp    cx,0x1
0x1401c43a3: je     0x1401c43b6
0x1401c43a5: cmp    cx,0x5
0x1401c43a9: je     0x1401c43b6
0x1401c43ab: test   BYTE PTR [rax+0x40],0x4
0x1401c43af: je     0x1401c43b9
0x1401c43b1: mov    dil,0x1
0x1401c43b4: jmp    0x1401c43b9
0x1401c43b6: mov    r14b,0x1
0x1401c43b9: mov    edx,DWORD PTR [rsi+0x4]
0x1401c43bc: mov    rcx,r15
0x1401c43bf: call   0x1400ffa80
0x1401c43c4: test   rax,rax
0x1401c43c7: je     0x1401c43ea
0x1401c43c9: movzx  ecx,WORD PTR [rax+0x4]
0x1401c43cd: cmp    cx,0x1
0x1401c43d1: je     0x1401c4460
0x1401c43d7: cmp    cx,0x5
0x1401c43db: je     0x1401c4460
0x1401c43e1: test   BYTE PTR [rax+0x40],0x4
0x1401c43e5: je     0x1401c43ea
0x1401c43e7: mov    dil,0x1
0x1401c43ea: mov    esi,DWORD PTR [rbp-0x70]
0x1401c43ed: lea    edx,[rsi+0x2]
0x1401c43f0: mov    r8d,DWORD PTR [rsp+0x70]
0x1401c43f5: lea    rcx,[rip+0x2485ff4]        # 0x14264a3f0
0x1401c43fc: call   0x1400bb120
0x1401c4401: test   r14b,r14b
0x1401c4404: je     0x1401c4479
0x1401c4406: xor    r8d,r8d
0x1401c4409: mov    edx,0x4
0x1401c440e: mov    r9b,0x1
0x1401c4411: lea    rcx,[rip+0x2485fd8]        # 0x14264a3f0
0x1401c4418: call   0x1400bb130
0x1401c441d: lea    rdx,[rip+0x143f2d8]        # 0x1416036fc  'War'
0x1401c4424: lea    rcx,[rbp+0x3450]
0x1401c442b: call   0x140068150
0x1401c4430: nop
0x1401c4431: xor    r9d,r9d
0x1401c4434: xor    r8d,r8d
0x1401c4437: lea    rdx,[rbp+0x3450]
0x1401c443e: lea    rcx,[rip+0x2485fab]        # 0x14264a3f0
0x1401c4445: call   0x140ad9960
0x1401c444a: nop
0x1401c444b: lea    rcx,[rbp+0x3450]
0x1401c4452: call   0x140067e30
0x1401c4457: mov    r12d,DWORD PTR [rbp-0x6c]
0x1401c445b: jmp    0x1401c4640
0x1401c4460: mov    esi,DWORD PTR [rbp-0x70]
0x1401c4463: lea    edx,[rsi+0x2]
0x1401c4466: mov    r8d,DWORD PTR [rsp+0x70]
0x1401c446b: lea    rcx,[rip+0x2485f7e]        # 0x14264a3f0
0x1401c4472: call   0x1400bb120
0x1401c4477: jmp    0x1401c4406
0x1401c4479: xor    r8d,r8d
0x1401c447c: lea    rcx,[rip+0x2485f6d]        # 0x14264a3f0
0x1401c4483: test   r12b,r12b
0x1401c4486: je     0x1401c44d8
0x1401c4488: mov    edx,0x6
0x1401c448d: mov    r9b,0x1
0x1401c4490: call   0x1400bb130
0x1401c4495: lea    rdx,[rip+0x143f71c]        # 0x141603bb8  'Offering tribute'
0x1401c449c: lea    rcx,[rbp+0x3430]
0x1401c44a3: call   0x140068150
0x1401c44a8: nop
0x1401c44a9: xor    r9d,r9d
0x1401c44ac: xor    r8d,r8d
0x1401c44af: lea    rdx,[rbp+0x3430]
0x1401c44b6: lea    rcx,[rip+0x2485f33]        # 0x14264a3f0
0x1401c44bd: call   0x140ad9960
0x1401c44c2: nop
0x1401c44c3: lea    rcx,[rbp+0x3430]
0x1401c44ca: call   0x140067e30
0x1401c44cf: mov    r12d,DWORD PTR [rbp-0x6c]
0x1401c44d3: jmp    0x1401c4640
0x1401c44d8: test   r13b,r13b
0x1401c44db: je     0x1401c452d
0x1401c44dd: mov    edx,0x7
0x1401c44e2: xor    r9d,r9d
0x1401c44e5: call   0x1400bb130
0x1401c44ea: lea    rdx,[rip+0x143f6df]        # 0x141603bd0  'Accepting tribute'
0x1401c44f1: lea    rcx,[rbp+0x2ed0]
0x1401c44f8: call   0x140068150
0x1401c44fd: nop
0x1401c44fe: xor    r9d,r9d
0x1401c4501: xor    r8d,r8d
0x1401c4504: lea    rdx,[rbp+0x2ed0]
0x1401c450b: lea    rcx,[rip+0x2485ede]        # 0x14264a3f0
0x1401c4512: call   0x140ad9960
0x1401c4517: nop
0x1401c4518: lea    rcx,[rbp+0x2ed0]
0x1401c451f: call   0x140067e30
0x1401c4524: mov    r12d,DWORD PTR [rbp-0x6c]
0x1401c4528: jmp    0x1401c4640
0x1401c452d: test   dil,dil
0x1401c4530: je     0x1401c4582
0x1401c4532: mov    edx,0x2
0x1401c4537: mov    r9b,0x1
0x1401c453a: call   0x1400bb130
0x1401c453f: lea    rdx,[rip+0x143f1aa]        # 0x1416036f0  'Alliance'
0x1401c4546: lea    rcx,[rbp+0x2df0]
0x1401c454d: call   0x140068150
0x1401c4552: nop
0x1401c4553: xor    r9d,r9d
0x1401c4556: xor    r8d,r8d
0x1401c4559: lea    rdx,[rbp+0x2df0]
0x1401c4560: lea    rcx,[rip+0x2485e89]        # 0x14264a3f0
0x1401c4567: call   0x140ad9960
0x1401c456c: nop
0x1401c456d: lea    rcx,[rbp+0x2df0]
0x1401c4574: call   0x140067e30
0x1401c4579: mov    r12d,DWORD PTR [rbp-0x6c]
0x1401c457d: jmp    0x1401c4640
0x1401c4582: mov    edx,0x7
0x1401c4587: xor    r9d,r9d
0x1401c458a: call   0x1400bb130
0x1401c458f: lea    rdx,[rip+0x142445e]        # 0x1415e89f4  'Peace'
0x1401c4596: lea    rcx,[rbp+0x2d50]
0x1401c459d: call   0x140068150
0x1401c45a2: nop
0x1401c45a3: xor    r9d,r9d
0x1401c45a6: xor    r8d,r8d
0x1401c45a9: lea    rdx,[rbp+0x2d50]
0x1401c45b0: lea    rcx,[rip+0x2485e39]        # 0x14264a3f0
0x1401c45b7: call   0x140ad9960
0x1401c45bc: nop
0x1401c45bd: lea    rcx,[rbp+0x2d50]
0x1401c45c4: call   0x140067e30
0x1401c45c9: mov    r12d,DWORD PTR [rbp-0x6c]
0x1401c45cd: jmp    0x1401c4640
0x1401c45cf: cmp    rdi,rbx
0x1401c45d2: jne    0x1401c463d
0x1401c45d4: mov    esi,DWORD PTR [rbp-0x70]
0x1401c45d7: lea    edx,[rsi+0x2]
0x1401c45da: mov    r8d,r13d
0x1401c45dd: lea    rcx,[rip+0x2485e0c]        # 0x14264a3f0
0x1401c45e4: call   0x1400bb120
0x1401c45e9: xor    r8d,r8d
0x1401c45ec: mov    edx,0x1
0x1401c45f1: movzx  r9d,dl
0x1401c45f5: lea    rcx,[rip+0x2485df4]        # 0x14264a3f0
0x1401c45fc: call   0x1400bb130
0x1401c4601: lea    rdx,[rip+0x143f5e0]        # 0x141603be8  'Your site government'
0x1401c4608: lea    rcx,[rbp+0x2a10]
0x1401c460f: call   0x140068150
0x1401c4614: nop
0x1401c4615: xor    r9d,r9d
0x1401c4618: xor    r8d,r8d
0x1401c461b: lea    rdx,[rbp+0x2a10]
0x1401c4622: lea    rcx,[rip+0x2485dc7]        # 0x14264a3f0
0x1401c4629: call   0x140ad9960
0x1401c462e: nop
0x1401c462f: lea    rcx,[rbp+0x2a10]
0x1401c4636: call   0x140067e30
0x1401c463b: jmp    0x1401c4640
0x1401c463d: mov    esi,DWORD PTR [rbp-0x70]
0x1401c4640: add    esi,0x3
0x1401c4643: mov    DWORD PTR [rbp-0x70],esi
0x1401c4646: lea    rcx,[rbp+0x10d0]
0x1401c464d: call   0x140067e30
0x1401c4652: nop
0x1401c4653: lea    rcx,[rbp+0xd50]
0x1401c465a: call   0x140067e30
0x1401c465f: mov    ecx,DWORD PTR [rbp-0x10]
0x1401c4662: inc    ecx
0x1401c4664: mov    DWORD PTR [rbp-0x10],ecx
0x1401c4667: cmp    ecx,DWORD PTR [rsp+0x74]
0x1401c466b: mov    ebx,DWORD PTR [rsp+0x70]
0x1401c466f: mov    rdx,QWORD PTR [rbp-0x28]
0x1401c4673: mov    r15,QWORD PTR [rbp-0x20]
0x1401c4677: mov    r13,QWORD PTR [rsp+0x78]
0x1401c467c: jl     0x1401c3b90
0x1401c4682: mov    edi,DWORD PTR [rbp-0x68]
0x1401c4685: mov    r15d,DWORD PTR [rbp-0x48]
0x1401c4689: mov    r14,QWORD PTR [rbp-0x78]
0x1401c468d: cmp    edx,edi
0x1401c468f: jle    0x1401c4713
0x1401c4695: lea    ebx,[rdi*2-0x1]
0x1401c469c: add    ebx,edi
0x1401c469e: lea    rcx,[rbp+0x1f0]
0x1401c46a5: call   0x1400bb360
0x1401c46aa: mov    r9,QWORD PTR [rbp-0x28]
0x1401c46ae: dec    r9d
0x1401c46b1: mov    DWORD PTR [rsp+0x30],ebx
0x1401c46b5: mov    ebx,0x2
0x1401c46ba: mov    DWORD PTR [rsp+0x28],ebx
0x1401c46be: mov    DWORD PTR [rsp+0x20],edi
0x1401c46c2: xor    r8d,r8d
0x1401c46c5: mov    edx,DWORD PTR [r13+0x2b0]
0x1401c46cc: lea    rcx,[rbp+0x1f0]
0x1401c46d3: call   0x1400bb380
0x1401c46d8: lea    r9d,[r12+0x1]
0x1401c46dd: mov    DWORD PTR [rsp+0x28],0x0
0x1401c46e5: movzx  eax,BYTE PTR [r13+0x2b4]
0x1401c46ed: mov    BYTE PTR [rsp+0x20],al
0x1401c46f1: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401c46f5: mov    edx,DWORD PTR [rbp-0x38]
0x1401c46f8: lea    rcx,[rbp+0x1f0]
0x1401c46ff: call   0x14140f4d0
0x1401c4704: jmp    0x1401c4718
0x1401c4706: mov    r15d,DWORD PTR [rbp+0x38]
0x1401c470a: mov    DWORD PTR [rbp-0x48],r15d
0x1401c470e: jmp    0x1401c468d
0x1401c4713: mov    ebx,0x2
0x1401c4718: test   r14,r14
0x1401c471b: jne    0x1401c4744
0x1401c471d: cmp    QWORD PTR [r13+0x248],r14
0x1401c4724: je     0x1401c6068
0x1401c472a: mov    QWORD PTR [r13+0x248],r14
0x1401c4731: mov    edx,ebx
0x1401c4733: lea    rcx,[rip+0x2485cb6]        # 0x14264a3f0
0x1401c473a: call   0x140ae7c00
0x1401c473f: jmp    0x1401c6068
0x1401c4744: mov    eax,DWORD PTR [rbp-0x58]
0x1401c4747: lea    esi,[rax-0x37]
0x1401c474a: mov    DWORD PTR [rbp-0x68],esi
0x1401c474d: lea    r12d,[rax-0x2]
0x1401c4751: mov    DWORD PTR [rsp+0x74],r12d
0x1401c4756: lea    edi,[r15+0x1]
0x1401c475a: mov    rcx,QWORD PTR [rip+0x21d5a87]        # 0x14239a1e8
0x1401c4761: cmp    r14,rcx
0x1401c4764: je     0x1401c4948
0x1401c476a: add    edi,0x3
0x1401c476d: add    rcx,0x1028
0x1401c4774: mov    edx,DWORD PTR [r14+0x4]
0x1401c4778: call   0x1400ffa80
0x1401c477d: test   rax,rax
0x1401c4780: je     0x1401c478b
0x1401c4782: cmp    WORD PTR [rax+0x4],0x3
0x1401c4787: jne    0x1401c478b
0x1401c4789: inc    edi
0x1401c478b: lea    rcx,[r13+0x280]
0x1401c4792: call   0x14006ee50
0x1401c4797: test   rax,rax
0x1401c479a: je     0x1401c4945
0x1401c47a0: lea    rdx,[rbp+0x28]
0x1401c47a4: lea    rcx,[r13+0x280]
0x1401c47ab: call   0x14006f240
0x1401c47b0: lea    rdx,[rbp+0xf8]
0x1401c47b7: lea    rcx,[r13+0x280]
0x1401c47be: call   0x14006f230
0x1401c47c3: lea    rcx,[r13+0x298]
0x1401c47ca: lea    rdx,[rbp+0x1b0]
0x1401c47d1: call   0x14006f240
0x1401c47d6: lea    r8,[rbp+0xf8]
0x1401c47dd: lea    rdx,[rbp+0x9]
0x1401c47e1: lea    rcx,[rbp+0x28]
0x1401c47e5: call   0x14006ee20
0x1401c47ea: xor    edx,edx
0x1401c47ec: movzx  ecx,BYTE PTR [rax]
0x1401c47ef: call   0x1400657b0
0x1401c47f4: test   al,al
0x1401c47f6: je     0x1401c4948
0x1401c47fc: nop    DWORD PTR [rax+0x0]
0x1401c4800: add    edi,0x2
0x1401c4803: lea    rcx,[rbp+0x28]
0x1401c4807: call   0x14006ee10
0x1401c480c: mov    rcx,QWORD PTR [rax]
0x1401c480f: cmp    WORD PTR [rcx],0x4
0x1401c4813: jne    0x1401c48bd
0x1401c4819: lea    rcx,[rbp+0x28]
0x1401c481d: call   0x14006ee10
0x1401c4822: mov    rcx,QWORD PTR [rax]
0x1401c4825: cmp    QWORD PTR [rcx+0x48],0x0
0x1401c482a: je     0x1401c48bd
0x1401c4830: lea    rcx,[rbp+0x28]
0x1401c4834: call   0x14006ee10
0x1401c4839: mov    rcx,QWORD PTR [rax]
0x1401c483c: mov    rsi,QWORD PTR [rcx+0x48]
0x1401c4840: mov    QWORD PTR [rbp-0x60],rsi
0x1401c4844: mov    ebx,0x6b
0x1401c4849: mov    QWORD PTR [rbp-0x30],rbx
0x1401c484d: xor    r14d,r14d
0x1401c4850: mov    r12d,r14d
0x1401c4853: mov    r13d,r14d
0x1401c4856: data16 nop WORD PTR [rax+rax*1+0x0]
0x1401c4860: lea    rcx,[rsi+0x8]
0x1401c4864: add    rcx,r12
0x1401c4867: call   0x14006f370
0x1401c486c: test   eax,eax
0x1401c486e: jle    0x1401c48aa
0x1401c4870: lea    r15,[rsi+0x8]
0x1401c4874: mov    rsi,r14
0x1401c4877: mov    r14d,eax
0x1401c487a: nop    WORD PTR [rax+rax*1+0x0]
0x1401c4880: mov    ebx,edi
0x1401c4882: mov    rdx,rsi
0x1401c4885: lea    rcx,[r15+r13*1]
0x1401c4889: call   0x14006f360
0x1401c488e: inc    edi
0x1401c4890: cmp    DWORD PTR [rax],0x80
0x1401c4896: cmove  edi,ebx
0x1401c4899: inc    rsi
0x1401c489c: sub    r14,0x1
0x1401c48a0: jne    0x1401c4880
0x1401c48a2: mov    rbx,QWORD PTR [rbp-0x30]
0x1401c48a6: mov    rsi,QWORD PTR [rbp-0x60]
0x1401c48aa: sub    rbx,0x1
0x1401c48ae: mov    QWORD PTR [rbp-0x30],rbx
0x1401c48b2: lea    r12,[r12+0x18]
0x1401c48b7: lea    r13,[r13+0x18]
0x1401c48bb: jne    0x1401c4860
0x1401c48bd: lea    rcx,[rbp+0x28]
0x1401c48c1: call   0x14006ee10
0x1401c48c6: mov    rcx,QWORD PTR [rax]
0x1401c48c9: cmp    WORD PTR [rcx],0x5
0x1401c48cd: jne    0x1401c48fc
0x1401c48cf: lea    rcx,[rbp+0x28]
0x1401c48d3: call   0x14006ee10
0x1401c48d8: mov    rcx,QWORD PTR [rax]
0x1401c48db: cmp    QWORD PTR [rcx+0x50],0x0
0x1401c48e0: je     0x1401c48fc
0x1401c48e2: lea    rcx,[rbp+0x28]
0x1401c48e6: call   0x14006ee10
0x1401c48eb: mov    rcx,QWORD PTR [rax]
0x1401c48ee: mov    rcx,QWORD PTR [rcx+0x50]
0x1401c48f2: mov    rcx,QWORD PTR [rcx]
0x1401c48f5: call   0x14006f450
0x1401c48fa: add    edi,eax
0x1401c48fc: lea    rcx,[rbp+0x28]
0x1401c4900: call   0x14006ee00
0x1401c4905: lea    rcx,[rbp+0x1b0]
0x1401c490c: call   0x1401f9af0
0x1401c4911: lea    r8,[rbp+0xf8]
0x1401c4918: lea    rdx,[rbp+0x9]
0x1401c491c: lea    rcx,[rbp+0x28]
0x1401c4920: call   0x14006ee20
0x1401c4925: xor    edx,edx
0x1401c4927: movzx  ecx,BYTE PTR [rax]
0x1401c492a: call   0x1400657b0
0x1401c492f: test   al,al
0x1401c4931: jne    0x1401c4800
0x1401c4937: mov    r12d,DWORD PTR [rsp+0x74]
0x1401c493c: mov    esi,DWORD PTR [rbp-0x68]
0x1401c493f: mov    r15d,DWORD PTR [rbp-0x48]
0x1401c4943: jmp    0x1401c4948
0x1401c4945: add    edi,0x2
0x1401c4948: mov    rcx,QWORD PTR [rsp+0x78]
0x1401c494d: add    rcx,0x250
0x1401c4954: call   0x14006ee50
0x1401c4959: add    edi,eax
0x1401c495b: mov    DWORD PTR [rbp-0x68],edi
0x1401c495e: mov    ecx,DWORD PTR [rip+0x2208e24]        # 0x1423cd788
0x1401c4964: cmp    edi,ecx
0x1401c4966: jl     0x1401c4983
0x1401c4968: mov    eax,edi
0x1401c496a: sub    eax,ecx
0x1401c496c: inc    eax
0x1401c496e: sub    edi,eax
0x1401c4970: mov    DWORD PTR [rbp-0x68],edi
0x1401c4973: sub    r15d,eax
0x1401c4976: mov    eax,0x0
0x1401c497b: cmovs  r15d,eax
0x1401c497f: mov    DWORD PTR [rbp-0x48],r15d
0x1401c4983: movsxd rax,DWORD PTR [rbp-0x48]
0x1401c4987: cmp    eax,edi
0x1401c4989: jg     0x1401c4a78
0x1401c498f: mov    QWORD PTR [rbp-0x30],rax
0x1401c4993: mov    r14,rax
0x1401c4996: data16 nop WORD PTR [rax+rax*1+0x0]
0x1401c49a0: mov    ebx,esi
0x1401c49a2: cmp    esi,r12d
0x1401c49a5: jg     0x1401c4a66
0x1401c49ab: movsxd r13,edi
0x1401c49ae: mov    rdi,QWORD PTR [rbp-0x30]
0x1401c49b2: mov    r8d,ebx
0x1401c49b5: mov    edx,r15d
0x1401c49b8: lea    rcx,[rip+0x2485a31]        # 0x14264a3f0
0x1401c49bf: call   0x1400bb120
0x1401c49c4: xor    r8d,r8d
0x1401c49c7: xor    edx,edx
0x1401c49c9: lea    rcx,[rip+0x2485a20]        # 0x14264a3f0
0x1401c49d0: call   0x1400bb190
0x1401c49d5: cmp    r14,rdi
0x1401c49d8: jne    0x1401c4a02
0x1401c49da: cmp    ebx,esi
0x1401c49dc: jne    0x1401c49e6
0x1401c49de: mov    edx,DWORD PTR [rip+0x2487330]        # 0x14264bd14
0x1401c49e4: jmp    0x1401c4a4c
0x1401c49e6: lea    rcx,[rip+0x2485a03]        # 0x14264a3f0
0x1401c49ed: cmp    ebx,r12d
0x1401c49f0: jne    0x1401c49fa
0x1401c49f2: mov    edx,DWORD PTR [rip+0x2487334]        # 0x14264bd2c
0x1401c49f8: jmp    0x1401c4a53
0x1401c49fa: mov    edx,DWORD PTR [rip+0x2487320]        # 0x14264bd20
0x1401c4a00: jmp    0x1401c4a53
0x1401c4a02: cmp    r14,r13
0x1401c4a05: jne    0x1401c4a2f
0x1401c4a07: cmp    ebx,esi
0x1401c4a09: jne    0x1401c4a13
0x1401c4a0b: mov    edx,DWORD PTR [rip+0x248730b]        # 0x14264bd1c
0x1401c4a11: jmp    0x1401c4a4c
0x1401c4a13: lea    rcx,[rip+0x24859d6]        # 0x14264a3f0
0x1401c4a1a: cmp    ebx,r12d
0x1401c4a1d: jne    0x1401c4a27
0x1401c4a1f: mov    edx,DWORD PTR [rip+0x248730f]        # 0x14264bd34
0x1401c4a25: jmp    0x1401c4a53
0x1401c4a27: mov    edx,DWORD PTR [rip+0x24872fb]        # 0x14264bd28
0x1401c4a2d: jmp    0x1401c4a53
0x1401c4a2f: cmp    ebx,esi
0x1401c4a31: jne    0x1401c4a3b
0x1401c4a33: mov    edx,DWORD PTR [rip+0x24872df]        # 0x14264bd18
0x1401c4a39: jmp    0x1401c4a4c
0x1401c4a3b: cmp    ebx,r12d
0x1401c4a3e: mov    edx,DWORD PTR [rip+0x24872ec]        # 0x14264bd30
0x1401c4a44: je     0x1401c4a4c
0x1401c4a46: mov    edx,DWORD PTR [rip+0x24872d8]        # 0x14264bd24
0x1401c4a4c: lea    rcx,[rip+0x248599d]        # 0x14264a3f0
0x1401c4a53: call   0x140adaad0
0x1401c4a58: inc    ebx
0x1401c4a5a: cmp    ebx,r12d
0x1401c4a5d: jle    0x1401c49b2
0x1401c4a63: mov    edi,DWORD PTR [rbp-0x68]
0x1401c4a66: inc    r15d
0x1401c4a69: inc    r14
0x1401c4a6c: cmp    r15d,edi
0x1401c4a6f: jle    0x1401c49a0
0x1401c4a75: mov    eax,DWORD PTR [rbp-0x48]
0x1401c4a78: lea    ebx,[rsi+0x2]
0x1401c4a7b: mov    DWORD PTR [rbp-0x58],ebx
0x1401c4a7e: lea    r12d,[rax+0x1]
0x1401c4a82: lea    r13d,[rdi-0x1]
0x1401c4a86: mov    rsi,QWORD PTR [rbp-0x78]
0x1401c4a8a: mov    eax,DWORD PTR [rsi+0x13c0]
0x1401c4a90: mov    DWORD PTR [rsp+0x74],eax
0x1401c4a94: mov    eax,DWORD PTR [rsi+0x13c4]
0x1401c4a9a: mov    DWORD PTR [rbp-0x10],eax
0x1401c4a9d: mov    r14,QWORD PTR [rip+0x21d574c]        # 0x14239a1f0
0x1401c4aa4: mov    QWORD PTR [rbp-0x60],r14
0x1401c4aa8: cmp    rsi,QWORD PTR [rip+0x21d5739]        # 0x14239a1e8
0x1401c4aaf: je     0x1401c5e77
0x1401c4ab5: lea    rcx,[rip+0x21cc7e4]        # 0x1423912a0
0x1401c4abc: call   0x140e64560
0x1401c4ac1: mov    r15d,eax
0x1401c4ac4: mov    DWORD PTR [rbp-0x68],eax
0x1401c4ac7: test   eax,eax
0x1401c4ac9: jle    0x1401c52f0
0x1401c4acf: mov    r14b,0x1
0x1401c4ad2: mov    edx,DWORD PTR [rip+0x21ceb98]        # 0x142393670
0x1401c4ad8: lea    rcx,[rip+0x220cd19]        # 0x1423d17f8
0x1401c4adf: call   0x14007daf0
0x1401c4ae4: mov    rsi,rax
0x1401c4ae7: xor    dil,dil
0x1401c4aea: test   rax,rax
0x1401c4aed: je     0x1401c4c4a
0x1401c4af3: lea    rcx,[rax+0x1028]
0x1401c4afa: mov    rdx,QWORD PTR [rbp-0x78]
0x1401c4afe: mov    edx,DWORD PTR [rdx+0x4]
0x1401c4b01: call   0x1400ffa90
0x1401c4b06: movzx  r15d,ax
0x1401c4b0a: mov    rdx,rsi
0x1401c4b0d: mov    rcx,QWORD PTR [rbp-0x78]
0x1401c4b11: call   0x140997980
0x1401c4b16: mov    BYTE PTR [rbp-0x50],al
0x1401c4b19: lea    ecx,[r15-0x3]
0x1401c4b1d: cmp    cx,0x1
0x1401c4b21: jbe    0x1401c4c3a
0x1401c4b27: mov    rcx,QWORD PTR [rsi+0x8]
0x1401c4b2b: add    rcx,0x3a0
0x1401c4b32: mov    edx,0x7
0x1401c4b37: call   0x140071f90
0x1401c4b3c: test   al,al
0x1401c4b3e: jne    0x1401c4b67
0x1401c4b40: mov    rax,QWORD PTR [rbp-0x78]
0x1401c4b44: mov    rcx,QWORD PTR [rax+0x8]
0x1401c4b48: add    rcx,0x3a0
0x1401c4b4f: mov    edx,0x7
0x1401c4b54: call   0x140071f90
0x1401c4b59: movzx  edi,dil
0x1401c4b5d: test   al,al
0x1401c4b5f: mov    eax,0x1
0x1401c4b64: cmovne edi,eax
0x1401c4b67: mov    rcx,QWORD PTR [rsi+0x8]
0x1401c4b6b: add    rcx,0x3a0
0x1401c4b72: mov    edx,0x8
0x1401c4b77: call   0x140071f90
0x1401c4b7c: test   al,al
0x1401c4b7e: jne    0x1401c4ba7
0x1401c4b80: mov    rax,QWORD PTR [rbp-0x78]
0x1401c4b84: mov    rcx,QWORD PTR [rax+0x8]
0x1401c4b88: add    rcx,0x3a0
0x1401c4b8f: mov    edx,0x8
0x1401c4b94: call   0x140071f90
0x1401c4b99: movzx  edi,dil
0x1401c4b9d: test   al,al
0x1401c4b9f: mov    eax,0x1
0x1401c4ba4: cmovne edi,eax
0x1401c4ba7: mov    rcx,QWORD PTR [rsi+0x8]
0x1401c4bab: add    rcx,0x3a0
0x1401c4bb2: mov    edx,0x7
0x1401c4bb7: call   0x140071f90
0x1401c4bbc: test   al,al
0x1401c4bbe: je     0x1401c4be7
0x1401c4bc0: mov    rax,QWORD PTR [rbp-0x78]
0x1401c4bc4: mov    rcx,QWORD PTR [rax+0x8]
0x1401c4bc8: add    rcx,0x3a0
0x1401c4bcf: mov    edx,0x7
0x1401c4bd4: call   0x140071f90
0x1401c4bd9: movzx  edi,dil
0x1401c4bdd: test   al,al
0x1401c4bdf: mov    eax,0x1
0x1401c4be4: cmove  edi,eax
0x1401c4be7: mov    rcx,QWORD PTR [rsi+0x8]
0x1401c4beb: add    rcx,0x3a0
0x1401c4bf2: mov    edx,0x8
0x1401c4bf7: call   0x140071f90
0x1401c4bfc: test   al,al
0x1401c4bfe: je     0x1401c4c27
0x1401c4c00: mov    rax,QWORD PTR [rbp-0x78]
0x1401c4c04: mov    rcx,QWORD PTR [rax+0x8]
0x1401c4c08: add    rcx,0x3a0
0x1401c4c0f: mov    edx,0x8
0x1401c4c14: call   0x140071f90
0x1401c4c19: movzx  edi,dil
0x1401c4c1d: test   al,al
0x1401c4c1f: mov    eax,0x1
0x1401c4c24: cmove  edi,eax
0x1401c4c27: dec    r15w
0x1401c4c2b: mov    eax,0xfffb
0x1401c4c30: test   ax,r15w
0x1401c4c34: je     0x1401c4c43
0x1401c4c36: movzx  eax,BYTE PTR [rbp-0x50]
0x1401c4c3a: test   al,al
0x1401c4c3c: je     0x1401c4c43
0x1401c4c3e: test   dil,dil
0x1401c4c41: je     0x1401c4c46
0x1401c4c43: xor    r14b,r14b
0x1401c4c46: mov    r15d,DWORD PTR [rbp-0x68]
0x1401c4c4a: lea    rcx,[rbp+0x1430]
0x1401c4c51: call   0x14006f690
0x1401c4c56: nop
0x1401c4c57: lea    rcx,[rbp+0xef0]
0x1401c4c5e: call   0x14006f690
0x1401c4c63: nop
0x1401c4c64: mov    rsi,QWORD PTR [rbp-0x78]
0x1401c4c68: mov    rcx,QWORD PTR [rsi+0x8]
0x1401c4c6c: add    rcx,0x3a0
0x1401c4c73: mov    edx,0x2d
0x1401c4c78: call   0x140071f90
0x1401c4c7d: test   al,al
0x1401c4c7f: je     0x1401c4db3
0x1401c4c85: mov    rcx,QWORD PTR [rsi+0x8]
0x1401c4c89: add    rcx,0x3a0
0x1401c4c90: mov    edx,0x8
0x1401c4c95: call   0x140071f90
0x1401c4c9a: test   al,al
0x1401c4c9c: je     0x1401c4db3
0x1401c4ca2: test   r14b,r14b
0x1401c4ca5: jne    0x1401c4ec4
0x1401c4cab: xor    r8d,r8d
0x1401c4cae: mov    edx,0x6
0x1401c4cb3: mov    r9b,0x1
0x1401c4cb6: lea    rcx,[rip+0x2485733]        # 0x14264a3f0
0x1401c4cbd: call   0x1400bb130
0x1401c4cc2: mov    r8d,ebx
0x1401c4cc5: mov    edx,r12d
0x1401c4cc8: lea    rcx,[rip+0x2485721]        # 0x14264a3f0
0x1401c4ccf: call   0x1400bb120
0x1401c4cd4: lea    rdx,[rip+0x143ef25]        # 0x141603c00  'Exports to '
0x1401c4cdb: lea    rcx,[rbp+0x1e50]
0x1401c4ce2: call   0x140068150
0x1401c4ce7: nop
0x1401c4ce8: xor    r9d,r9d
0x1401c4ceb: xor    r8d,r8d
0x1401c4cee: lea    rdx,[rbp+0x1e50]
0x1401c4cf5: lea    rcx,[rip+0x24856f4]        # 0x14264a3f0
0x1401c4cfc: call   0x140ad9960
0x1401c4d01: nop
0x1401c4d02: lea    rcx,[rbp+0x1e50]
0x1401c4d09: call   0x140067e30
0x1401c4d0e: lea    rdx,[rbp+0xef0]
0x1401c4d15: mov    rcx,QWORD PTR [rbp-0x60]
0x1401c4d19: call   0x140a94030
0x1401c4d1e: xor    r9d,r9d
0x1401c4d21: xor    r8d,r8d
0x1401c4d24: lea    rdx,[rbp+0xef0]
0x1401c4d2b: lea    rcx,[rip+0x24856be]        # 0x14264a3f0
0x1401c4d32: call   0x140ad9960
0x1401c4d37: mov    r8b,0x1
0x1401c4d3a: mov    dl,0x3a
0x1401c4d3c: lea    rcx,[rip+0x24856ad]        # 0x14264a3f0
0x1401c4d43: call   0x1400bb190
0x1401c4d48: lea    edi,[rbx+0x23]
0x1401c4d4b: mov    r8d,edi
0x1401c4d4e: mov    edx,r12d
0x1401c4d51: lea    rcx,[rip+0x2485698]        # 0x14264a3f0
0x1401c4d58: call   0x1400bb120
0x1401c4d5d: xor    r8d,r8d
0x1401c4d60: mov    edx,0x6
0x1401c4d65: xor    r9d,r9d
0x1401c4d68: lea    rcx,[rip+0x2485681]        # 0x14264a3f0
0x1401c4d6f: call   0x1400bb130
0x1401c4d74: lea    rdx,[rip+0x143ee95]        # 0x141603c10  'Petty Annoyance'
0x1401c4d7b: lea    rcx,[rbp+0x3150]
0x1401c4d82: call   0x140068150
0x1401c4d87: nop
0x1401c4d88: xor    r9d,r9d
0x1401c4d8b: xor    r8d,r8d
0x1401c4d8e: lea    rdx,[rbp+0x3150]
0x1401c4d95: lea    rcx,[rip+0x2485654]        # 0x14264a3f0
0x1401c4d9c: call   0x140ad9960
0x1401c4da1: nop
0x1401c4da2: lea    rcx,[rbp+0x3150]
0x1401c4da9: call   0x140067e30
0x1401c4dae: jmp    0x1401c509d
0x1401c4db3: test   r14b,r14b
0x1401c4db6: jne    0x1401c4ec4
0x1401c4dbc: xor    r8d,r8d
0x1401c4dbf: mov    edx,0x6
0x1401c4dc4: mov    r9b,0x1
0x1401c4dc7: lea    rcx,[rip+0x2485622]        # 0x14264a3f0
0x1401c4dce: call   0x1400bb130
0x1401c4dd3: mov    r8d,ebx
0x1401c4dd6: mov    edx,r12d
0x1401c4dd9: lea    rcx,[rip+0x2485610]        # 0x14264a3f0
0x1401c4de0: call   0x1400bb120
0x1401c4de5: lea    rdx,[rip+0x143ee14]        # 0x141603c00  'Exports to '
0x1401c4dec: lea    rcx,[rbp+0x3870]
0x1401c4df3: call   0x140068150
0x1401c4df8: nop
0x1401c4df9: xor    r9d,r9d
0x1401c4dfc: xor    r8d,r8d
0x1401c4dff: lea    rdx,[rbp+0x3870]
0x1401c4e06: lea    rcx,[rip+0x24855e3]        # 0x14264a3f0
0x1401c4e0d: call   0x140ad9960
0x1401c4e12: nop
0x1401c4e13: lea    rcx,[rbp+0x3870]
0x1401c4e1a: call   0x140067e30
0x1401c4e1f: lea    rdx,[rbp+0xef0]
0x1401c4e26: mov    rcx,QWORD PTR [rbp-0x60]
0x1401c4e2a: call   0x140a94030
0x1401c4e2f: xor    r9d,r9d
0x1401c4e32: xor    r8d,r8d
0x1401c4e35: lea    rdx,[rbp+0xef0]
0x1401c4e3c: lea    rcx,[rip+0x24855ad]        # 0x14264a3f0
0x1401c4e43: call   0x140ad9960
0x1401c4e48: mov    r8b,0x1
0x1401c4e4b: mov    dl,0x3a
0x1401c4e4d: lea    rcx,[rip+0x248559c]        # 0x14264a3f0
0x1401c4e54: call   0x1400bb190
0x1401c4e59: lea    edi,[rbx+0x23]
0x1401c4e5c: mov    r8d,edi
0x1401c4e5f: mov    edx,r12d
0x1401c4e62: lea    rcx,[rip+0x2485587]        # 0x14264a3f0
0x1401c4e69: call   0x1400bb120
0x1401c4e6e: xor    r8d,r8d
0x1401c4e71: mov    edx,0x5
0x1401c4e76: mov    r9b,0x1
0x1401c4e79: lea    rcx,[rip+0x2485570]        # 0x14264a3f0
0x1401c4e80: call   0x1400bb130
0x1401c4e85: lea    rdx,[rip+0x143ed94]        # 0x141603c20  'Terror'
0x1401c4e8c: lea    rcx,[rbp+0x1b90]
0x1401c4e93: call   0x140068150
0x1401c4e98: nop
0x1401c4e99: xor    r9d,r9d
0x1401c4e9c: xor    r8d,r8d
0x1401c4e9f: lea    rdx,[rbp+0x1b90]
0x1401c4ea6: lea    rcx,[rip+0x2485543]        # 0x14264a3f0
0x1401c4ead: call   0x140ad9960
0x1401c4eb2: nop
0x1401c4eb3: lea    rcx,[rbp+0x1b90]
0x1401c4eba: call   0x140067e30
0x1401c4ebf: jmp    0x1401c509d
0x1401c4ec4: mov    esi,DWORD PTR [rsp+0x74]
0x1401c4ec8: xor    r8d,r8d
0x1401c4ecb: mov    edx,0x6
0x1401c4ed0: mov    r9b,0x1
0x1401c4ed3: lea    rcx,[rip+0x2485516]        # 0x14264a3f0
0x1401c4eda: call   0x1400bb130
0x1401c4edf: mov    r8d,ebx
0x1401c4ee2: mov    edx,r12d
0x1401c4ee5: lea    rcx,[rip+0x2485504]        # 0x14264a3f0
0x1401c4eec: call   0x1400bb120
0x1401c4ef1: lea    rdx,[rip+0x143ed30]        # 0x141603c28  'Imports from '
0x1401c4ef8: test   esi,esi
0x1401c4efa: jne    0x1401c4fd5
0x1401c4f00: lea    rcx,[rbp+0x1bb0]
0x1401c4f07: call   0x140068150
0x1401c4f0c: nop
0x1401c4f0d: xor    r9d,r9d
0x1401c4f10: xor    r8d,r8d
0x1401c4f13: lea    rdx,[rbp+0x1bb0]
0x1401c4f1a: lea    rcx,[rip+0x24854cf]        # 0x14264a3f0
0x1401c4f21: call   0x140ad9960
0x1401c4f26: nop
0x1401c4f27: lea    rcx,[rbp+0x1bb0]
0x1401c4f2e: call   0x140067e30
0x1401c4f33: lea    rdx,[rbp+0xef0]
0x1401c4f3a: mov    rcx,QWORD PTR [rbp-0x60]
0x1401c4f3e: call   0x140a94030
0x1401c4f43: xor    r9d,r9d
0x1401c4f46: xor    r8d,r8d
0x1401c4f49: lea    rdx,[rbp+0xef0]
0x1401c4f50: lea    rcx,[rip+0x2485499]        # 0x14264a3f0
0x1401c4f57: call   0x140ad9960
0x1401c4f5c: mov    r8b,0x1
0x1401c4f5f: mov    dl,0x3a
0x1401c4f61: lea    rcx,[rip+0x2485488]        # 0x14264a3f0
0x1401c4f68: call   0x1400bb190
0x1401c4f6d: lea    edi,[rbx+0x23]
0x1401c4f70: mov    r8d,edi
0x1401c4f73: mov    edx,r12d
0x1401c4f76: lea    rcx,[rip+0x2485473]        # 0x14264a3f0
0x1401c4f7d: call   0x1400bb120
0x1401c4f82: xor    r8d,r8d
0x1401c4f85: xor    edx,edx
0x1401c4f87: mov    r9b,0x1
0x1401c4f8a: lea    rcx,[rip+0x248545f]        # 0x14264a3f0
0x1401c4f91: call   0x1400bb130
0x1401c4f96: lea    rdx,[rip+0x143a7c7]        # 0x1415ff764  'None'
0x1401c4f9d: lea    rcx,[rbp+0x1bd0]
0x1401c4fa4: call   0x140068150
0x1401c4fa9: nop
0x1401c4faa: xor    r9d,r9d
0x1401c4fad: xor    r8d,r8d
0x1401c4fb0: lea    rdx,[rbp+0x1bd0]
0x1401c4fb7: lea    rcx,[rip+0x2485432]        # 0x14264a3f0
0x1401c4fbe: call   0x140ad9960
0x1401c4fc3: nop
0x1401c4fc4: lea    rcx,[rbp+0x1bd0]
0x1401c4fcb: call   0x140067e30
0x1401c4fd0: jmp    0x1401c5099
0x1401c4fd5: lea    rcx,[rbp+0x1bf0]
0x1401c4fdc: call   0x140068150
0x1401c4fe1: nop
0x1401c4fe2: xor    r9d,r9d
0x1401c4fe5: xor    r8d,r8d
0x1401c4fe8: lea    rdx,[rbp+0x1bf0]
0x1401c4fef: lea    rcx,[rip+0x24853fa]        # 0x14264a3f0
0x1401c4ff6: call   0x140ad9960
0x1401c4ffb: nop
0x1401c4ffc: lea    rcx,[rbp+0x1bf0]
0x1401c5003: call   0x140067e30
0x1401c5008: lea    rdx,[rbp+0xef0]
0x1401c500f: mov    rcx,QWORD PTR [rbp-0x60]
0x1401c5013: call   0x140a94030
0x1401c5018: xor    r9d,r9d
0x1401c501b: xor    r8d,r8d
0x1401c501e: lea    rdx,[rbp+0xef0]
0x1401c5025: lea    rcx,[rip+0x24853c4]        # 0x14264a3f0
0x1401c502c: call   0x140ad9960
0x1401c5031: mov    r8b,0x1
0x1401c5034: mov    dl,0x3a
0x1401c5036: lea    rcx,[rip+0x24853b3]        # 0x14264a3f0
0x1401c503d: call   0x1400bb190
0x1401c5042: lea    edi,[rbx+0x23]
0x1401c5045: mov    r8d,edi
0x1401c5048: mov    edx,r12d
0x1401c504b: lea    rcx,[rip+0x248539e]        # 0x14264a3f0
0x1401c5052: call   0x1400bb120
0x1401c5057: xor    r8d,r8d
0x1401c505a: mov    edx,0x6
0x1401c505f: mov    r9b,0x1
0x1401c5062: lea    rcx,[rip+0x2485387]        # 0x14264a3f0
0x1401c5069: call   0x1400bb130
0x1401c506e: lea    r8d,[r15-0x1]
0x1401c5072: mov    edx,esi
0x1401c5074: lea    rcx,[rbp+0x1430]
0x1401c507b: call   0x14077f920
0x1401c5080: xor    r9d,r9d
0x1401c5083: xor    r8d,r8d
0x1401c5086: lea    rdx,[rbp+0x1430]
0x1401c508d: lea    rcx,[rip+0x248535c]        # 0x14264a3f0
0x1401c5094: call   0x140ad9960
0x1401c5099: mov    rsi,QWORD PTR [rbp-0x78]
0x1401c509d: mov    eax,0x1
0x1401c50a2: add    r12d,eax
0x1401c50a5: xor    r8d,r8d
0x1401c50a8: mov    edx,0x2
0x1401c50ad: movzx  r9d,al
0x1401c50b1: lea    rcx,[rip+0x2485338]        # 0x14264a3f0
0x1401c50b8: call   0x1400bb130
0x1401c50bd: mov    r8d,ebx
0x1401c50c0: mov    edx,r12d
0x1401c50c3: lea    rcx,[rip+0x2485326]        # 0x14264a3f0
0x1401c50ca: call   0x1400bb120
0x1401c50cf: lea    rdx,[rip+0x143e822]        # 0x1416038f8  'Offerings from '
0x1401c50d6: lea    rcx,[rbp+0x1c10]
0x1401c50dd: call   0x140068150
0x1401c50e2: nop
0x1401c50e3: xor    r9d,r9d
0x1401c50e6: xor    r8d,r8d
0x1401c50e9: lea    rdx,[rbp+0x1c10]
0x1401c50f0: lea    rcx,[rip+0x24852f9]        # 0x14264a3f0
0x1401c50f7: call   0x140ad9960
0x1401c50fc: nop
0x1401c50fd: lea    rcx,[rbp+0x1c10]
0x1401c5104: call   0x140067e30
0x1401c5109: lea    rdx,[rbp+0xef0]
0x1401c5110: mov    rcx,QWORD PTR [rbp-0x60]
0x1401c5114: call   0x140a94030
0x1401c5119: xor    r9d,r9d
0x1401c511c: xor    r8d,r8d
0x1401c511f: lea    rdx,[rbp+0xef0]
0x1401c5126: lea    rcx,[rip+0x24852c3]        # 0x14264a3f0
0x1401c512d: call   0x140ad9960
0x1401c5132: mov    r8b,0x1
0x1401c5135: mov    dl,0x3a
0x1401c5137: lea    rcx,[rip+0x24852b2]        # 0x14264a3f0
0x1401c513e: call   0x1400bb190
0x1401c5143: mov    r8d,edi
0x1401c5146: mov    edx,r12d
0x1401c5149: lea    rcx,[rip+0x24852a0]        # 0x14264a3f0
0x1401c5150: call   0x1400bb120
0x1401c5155: mov    rcx,QWORD PTR [rsi+0x8]
0x1401c5159: add    rcx,0x3a0
0x1401c5160: mov    edx,0x2d
0x1401c5165: call   0x140071f90
0x1401c516a: test   al,al
0x1401c516c: je     0x1401c51e6
0x1401c516e: mov    rcx,QWORD PTR [rsi+0x8]
0x1401c5172: add    rcx,0x3a0
0x1401c5179: mov    edx,0x8
0x1401c517e: call   0x140071f90
0x1401c5183: test   al,al
0x1401c5185: je     0x1401c51e6
0x1401c5187: test   r14b,r14b
0x1401c518a: jne    0x1401c5241
0x1401c5190: xor    r8d,r8d
0x1401c5193: mov    edx,0x4
0x1401c5198: mov    r9b,0x1
0x1401c519b: lea    rcx,[rip+0x248524e]        # 0x14264a3f0
0x1401c51a2: call   0x1400bb130
0x1401c51a7: lea    rdx,[rip+0x1431f36]        # 0x1415f70e4  'Death'
0x1401c51ae: lea    rcx,[rbp+0x1c30]
0x1401c51b5: call   0x140068150
0x1401c51ba: nop
0x1401c51bb: xor    r9d,r9d
0x1401c51be: xor    r8d,r8d
0x1401c51c1: lea    rdx,[rbp+0x1c30]
0x1401c51c8: lea    rcx,[rip+0x2485221]        # 0x14264a3f0
0x1401c51cf: call   0x140ad9960
0x1401c51d4: nop
0x1401c51d5: lea    rcx,[rbp+0x1c30]
0x1401c51dc: call   0x140067e30
0x1401c51e1: jmp    0x1401c52ce
0x1401c51e6: test   r14b,r14b
0x1401c51e9: jne    0x1401c5241
0x1401c51eb: xor    r8d,r8d
0x1401c51ee: mov    edx,0x4
0x1401c51f3: mov    r9b,0x1
0x1401c51f6: lea    rcx,[rip+0x24851f3]        # 0x14264a3f0
0x1401c51fd: call   0x1400bb130
0x1401c5202: lea    rdx,[rip+0x143e6ff]        # 0x141603908  'Vengeance'
0x1401c5209: lea    rcx,[rbp+0x1c50]
0x1401c5210: call   0x140068150
0x1401c5215: nop
0x1401c5216: xor    r9d,r9d
0x1401c5219: xor    r8d,r8d
0x1401c521c: lea    rdx,[rbp+0x1c50]
0x1401c5223: lea    rcx,[rip+0x24851c6]        # 0x14264a3f0
0x1401c522a: call   0x140ad9960
0x1401c522f: nop
0x1401c5230: lea    rcx,[rbp+0x1c50]
0x1401c5237: call   0x140067e30
0x1401c523c: jmp    0x1401c52ce
0x1401c5241: mov    edi,DWORD PTR [rbp-0x10]
0x1401c5244: xor    r8d,r8d
0x1401c5247: mov    r9b,0x1
0x1401c524a: lea    rcx,[rip+0x248519f]        # 0x14264a3f0
0x1401c5251: test   edi,edi
0x1401c5253: jne    0x1401c5298
0x1401c5255: xor    edx,edx
0x1401c5257: call   0x1400bb130
0x1401c525c: lea    rdx,[rip+0x143a501]        # 0x1415ff764  'None'
0x1401c5263: lea    rcx,[rbp+0x1c70]
0x1401c526a: call   0x140068150
0x1401c526f: nop
0x1401c5270: xor    r9d,r9d
0x1401c5273: xor    r8d,r8d
0x1401c5276: lea    rdx,[rbp+0x1c70]
0x1401c527d: lea    rcx,[rip+0x248516c]        # 0x14264a3f0
0x1401c5284: call   0x140ad9960
0x1401c5289: nop
0x1401c528a: lea    rcx,[rbp+0x1c70]
0x1401c5291: call   0x140067e30
0x1401c5296: jmp    0x1401c52ce
0x1401c5298: mov    edx,0x6
0x1401c529d: call   0x1400bb130
0x1401c52a2: lea    r8d,[r15-0x1]
0x1401c52a6: mov    edx,edi
0x1401c52a8: lea    rcx,[rbp+0x1430]
0x1401c52af: call   0x14077f920
0x1401c52b4: xor    r9d,r9d
0x1401c52b7: xor    r8d,r8d
0x1401c52ba: lea    rdx,[rbp+0x1430]
0x1401c52c1: lea    rcx,[rip+0x2485128]        # 0x14264a3f0
0x1401c52c8: call   0x140ad9960
0x1401c52cd: nop
0x1401c52ce: lea    rcx,[rbp+0xef0]
0x1401c52d5: call   0x140067e30
0x1401c52da: nop
0x1401c52db: lea    rcx,[rbp+0x1430]
0x1401c52e2: call   0x140067e30
0x1401c52e7: mov    r14,QWORD PTR [rbp-0x60]
0x1401c52eb: jmp    0x1401c53a2
0x1401c52f0: mov    r8d,ebx
0x1401c52f3: mov    edx,r12d
0x1401c52f6: lea    rcx,[rip+0x24850f3]        # 0x14264a3f0
0x1401c52fd: call   0x1400bb120
0x1401c5302: xor    r8d,r8d
0x1401c5305: mov    edx,0x7
0x1401c530a: xor    r9d,r9d
0x1401c530d: lea    rcx,[rip+0x24850dc]        # 0x14264a3f0
0x1401c5314: call   0x1400bb130
0x1401c5319: lea    rdx,[rip+0x143e5f8]        # 0x141603918  'You can look at trade information once you have'
0x1401c5320: lea    rcx,[rbp+0x1c90]
0x1401c5327: call   0x140068150
0x1401c532c: nop
0x1401c532d: xor    r9d,r9d
0x1401c5330: xor    r8d,r8d
0x1401c5333: lea    rdx,[rbp+0x1c90]
0x1401c533a: lea    rcx,[rip+0x24850af]        # 0x14264a3f0
0x1401c5341: call   0x140ad9960
0x1401c5346: nop
0x1401c5347: lea    rcx,[rbp+0x1c90]
0x1401c534e: call   0x140067e30
0x1401c5353: inc    r12d
0x1401c5356: mov    r8d,ebx
0x1401c5359: mov    edx,r12d
0x1401c535c: lea    rcx,[rip+0x248508d]        # 0x14264a3f0
0x1401c5363: call   0x1400bb120
0x1401c5368: lea    rdx,[rip+0x143e5d9]        # 0x141603948  'a broker with appraisal skill.'
0x1401c536f: lea    rcx,[rbp+0x1cb0]
0x1401c5376: call   0x140068150
0x1401c537b: nop
0x1401c537c: xor    r9d,r9d
0x1401c537f: xor    r8d,r8d
0x1401c5382: lea    rdx,[rbp+0x1cb0]
0x1401c5389: lea    rcx,[rip+0x2485060]        # 0x14264a3f0
0x1401c5390: call   0x140ad9960
0x1401c5395: nop
0x1401c5396: lea    rcx,[rbp+0x1cb0]
0x1401c539d: call   0x140067e30
0x1401c53a2: mov    eax,0x1
0x1401c53a7: add    r12d,eax
0x1401c53aa: mov    rcx,QWORD PTR [rip+0x21d4e37]        # 0x14239a1e8
0x1401c53b1: add    rcx,0x1028
0x1401c53b8: mov    edx,DWORD PTR [rsi+0x4]
0x1401c53bb: call   0x1400ffa80
0x1401c53c0: mov    rdi,rax
0x1401c53c3: test   rax,rax
0x1401c53c6: je     0x1401c5577
0x1401c53cc: cmp    WORD PTR [rax+0x4],0x3
0x1401c53d1: jne    0x1401c5577
0x1401c53d7: mov    r8d,ebx
0x1401c53da: mov    edx,r12d
0x1401c53dd: lea    rcx,[rip+0x248500c]        # 0x14264a3f0
0x1401c53e4: call   0x1400bb120
0x1401c53e9: xor    r8d,r8d
0x1401c53ec: mov    edx,0x6
0x1401c53f1: mov    r9b,0x1
0x1401c53f4: lea    rcx,[rip+0x2484ff5]        # 0x14264a3f0
0x1401c53fb: call   0x1400bb130
0x1401c5400: lea    rdx,[rip+0x143e561]        # 0x141603968  'You accept their tribute every '
0x1401c5407: lea    rcx,[rbp+0x1cd0]
0x1401c540e: call   0x140068150
0x1401c5413: nop
0x1401c5414: xor    r9d,r9d
0x1401c5417: mov    r8b,0x3
0x1401c541a: lea    rdx,[rbp+0x1cd0]
0x1401c5421: lea    rcx,[rip+0x2484fc8]        # 0x14264a3f0
0x1401c5428: call   0x140ad9960
0x1401c542d: nop
0x1401c542e: lea    rcx,[rbp+0x1cd0]
0x1401c5435: call   0x140067e30
0x1401c543a: mov    ecx,DWORD PTR [rdi+0x44]
0x1401c543d: test   ecx,ecx
0x1401c543f: je     0x1401c5500
0x1401c5445: sub    ecx,0x1
0x1401c5448: je     0x1401c54c9
0x1401c544a: sub    ecx,0x1
0x1401c544d: je     0x1401c5492
0x1401c544f: cmp    ecx,0x1
0x1401c5452: jne    0x1401c553a
0x1401c5458: lea    rdx,[rip+0x1437e55]        # 0x1415fd2b4  'Winter'
0x1401c545f: lea    rcx,[rbp+0x1cf0]
0x1401c5466: call   0x140068150
0x1401c546b: nop
0x1401c546c: xor    r9d,r9d
0x1401c546f: mov    r8b,0x3
0x1401c5472: lea    rdx,[rbp+0x1cf0]
0x1401c5479: lea    rcx,[rip+0x2484f70]        # 0x14264a3f0
0x1401c5480: call   0x140ad9960
0x1401c5485: nop
0x1401c5486: lea    rcx,[rbp+0x1cf0]
0x1401c548d: jmp    0x1401c5535
0x1401c5492: lea    rdx,[rip+0x1437e13]        # 0x1415fd2ac  'Autumn'
0x1401c5499: lea    rcx,[rbp+0x1d10]
0x1401c54a0: call   0x140068150
0x1401c54a5: nop
0x1401c54a6: xor    r9d,r9d
0x1401c54a9: mov    r8b,0x3
0x1401c54ac: lea    rdx,[rbp+0x1d10]
0x1401c54b3: lea    rcx,[rip+0x2484f36]        # 0x14264a3f0
0x1401c54ba: call   0x140ad9960
0x1401c54bf: nop
0x1401c54c0: lea    rcx,[rbp+0x1d10]
0x1401c54c7: jmp    0x1401c5535
0x1401c54c9: lea    rdx,[rip+0x1437dd4]        # 0x1415fd2a4  'Summer'
0x1401c54d0: lea    rcx,[rbp+0x1d30]
0x1401c54d7: call   0x140068150
0x1401c54dc: nop
0x1401c54dd: xor    r9d,r9d
0x1401c54e0: mov    r8b,0x3
0x1401c54e3: lea    rdx,[rbp+0x1d30]
0x1401c54ea: lea    rcx,[rip+0x2484eff]        # 0x14264a3f0
0x1401c54f1: call   0x140ad9960
0x1401c54f6: nop
0x1401c54f7: lea    rcx,[rbp+0x1d30]
0x1401c54fe: jmp    0x1401c5535
0x1401c5500: lea    rdx,[rip+0x1437d95]        # 0x1415fd29c  'Spring'
0x1401c5507: lea    rcx,[rbp+0x1d50]
0x1401c550e: call   0x140068150
0x1401c5513: nop
0x1401c5514: xor    r9d,r9d
0x1401c5517: mov    r8b,0x3
0x1401c551a: lea    rdx,[rbp+0x1d50]
0x1401c5521: lea    rcx,[rip+0x2484ec8]        # 0x14264a3f0
0x1401c5528: call   0x140ad9960
0x1401c552d: nop
0x1401c552e: lea    rcx,[rbp+0x1d50]
0x1401c5535: call   0x140067e30
0x1401c553a: lea    rdx,[rip+0x1423073]        # 0x1415e85b4  '.'
0x1401c5541: lea    rcx,[rbp+0x1d70]
0x1401c5548: call   0x140068150
0x1401c554d: nop
0x1401c554e: xor    r9d,r9d
0x1401c5551: xor    r8d,r8d
0x1401c5554: lea    rdx,[rbp+0x1d70]
0x1401c555b: lea    rcx,[rip+0x2484e8e]        # 0x14264a3f0
0x1401c5562: call   0x140ad9960
0x1401c5567: nop
0x1401c5568: lea    rcx,[rbp+0x1d70]
0x1401c556f: call   0x140067e30
0x1401c5574: inc    r12d
0x1401c5577: inc    r12d
0x1401c557a: mov    r15,QWORD PTR [rsp+0x78]
0x1401c557f: lea    rcx,[r15+0x280]
0x1401c5586: call   0x14006ee50
0x1401c558b: test   rax,rax
0x1401c558e: je     0x1401c5e09
0x1401c5594: xor    r8d,r8d
0x1401c5597: mov    edx,0x7
0x1401c559c: xor    r9d,r9d
0x1401c559f: lea    rcx,[rip+0x2484e4a]        # 0x14264a3f0
0x1401c55a6: call   0x1400bb130
0x1401c55ab: lea    rcx,[rbp+0xd10]
0x1401c55b2: call   0x14006f690
0x1401c55b7: nop
0x1401c55b8: lea    rdx,[rbp-0x8]
0x1401c55bc: lea    rcx,[r15+0x280]
0x1401c55c3: call   0x14006f240
0x1401c55c8: lea    rdx,[rbp+0x100]
0x1401c55cf: lea    rcx,[r15+0x280]
0x1401c55d6: call   0x14006f230
0x1401c55db: lea    rcx,[r15+0x298]
0x1401c55e2: lea    rdx,[rbp+0x198]
0x1401c55e9: call   0x14006f240
0x1401c55ee: lea    r8,[rbp+0x100]
0x1401c55f5: lea    rdx,[rbp+0xa]
0x1401c55f9: lea    rcx,[rbp-0x8]
0x1401c55fd: call   0x14006ee20
0x1401c5602: xor    edx,edx
0x1401c5604: movzx  ecx,BYTE PTR [rax]
0x1401c5607: call   0x1400657b0
0x1401c560c: test   al,al
0x1401c560e: je     0x1401c5dfb
0x1401c5614: cmp    r12d,r13d
0x1401c5617: jg     0x1401c5df7
0x1401c561d: lea    rcx,[rbp-0x8]
0x1401c5621: call   0x14006ee10
0x1401c5626: mov    rcx,QWORD PTR [rax]
0x1401c5629: cmp    WORD PTR [rcx],0x0
0x1401c562d: jne    0x1401c5787
0x1401c5633: xor    r8d,r8d
0x1401c5636: mov    edx,0x7
0x1401c563b: mov    r9b,0x1
0x1401c563e: lea    rcx,[rip+0x2484dab]        # 0x14264a3f0
0x1401c5645: call   0x1400bb130
0x1401c564a: lea    rcx,[rbp-0x8]
0x1401c564e: call   0x14006ee10
0x1401c5653: mov    rcx,QWORD PTR [rax]
0x1401c5656: lea    rdx,[rbp+0xd10]
0x1401c565d: movzx  ecx,WORD PTR [rcx+0x2]
0x1401c5661: call   0x140ac7950
0x1401c5666: lea    rcx,[rbp+0xd10]
0x1401c566d: call   0x14052d650
0x1401c5672: mov    r8d,ebx
0x1401c5675: mov    edx,r12d
0x1401c5678: lea    rcx,[rip+0x2484d71]        # 0x14264a3f0
0x1401c567f: call   0x1400bb120
0x1401c5684: xor    r9d,r9d
0x1401c5687: xor    r8d,r8d
0x1401c568a: lea    rdx,[rbp+0xd10]
0x1401c5691: lea    rcx,[rip+0x2484d58]        # 0x14264a3f0
0x1401c5698: call   0x140ad9960
0x1401c569d: lea    rcx,[rbp-0x8]
0x1401c56a1: call   0x14006ee10
0x1401c56a6: mov    rcx,QWORD PTR [rax]
0x1401c56a9: cmp    WORD PTR [rcx+0x2],0x2
0x1401c56ae: jne    0x1401c5787
0x1401c56b4: lea    rcx,[rbp-0x8]
0x1401c56b8: call   0x14006ee10
0x1401c56bd: mov    rcx,QWORD PTR [rax]
0x1401c56c0: cmp    DWORD PTR [rcx+0x3c],0x0
0x1401c56c4: jle    0x1401c56cd
0x1401c56c6: mov    edx,0x2
0x1401c56cb: jmp    0x1401c56e9
0x1401c56cd: lea    rcx,[rbp-0x8]
0x1401c56d1: call   0x14006ee10
0x1401c56d6: mov    rcx,QWORD PTR [rax]
0x1401c56d9: cmp    DWORD PTR [rcx+0x3c],0x0
0x1401c56dd: mov    edx,0x6
0x1401c56e2: je     0x1401c56e9
0x1401c56e4: mov    edx,0x4
0x1401c56e9: mov    r9b,0x1
0x1401c56ec: xor    r8d,r8d
0x1401c56ef: lea    rcx,[rip+0x2484cfa]        # 0x14264a3f0
0x1401c56f6: call   0x1400bb130
0x1401c56fb: lea    r8d,[rbx+0x1e]
0x1401c56ff: mov    edx,r12d
0x1401c5702: lea    rcx,[rip+0x2484ce7]        # 0x14264a3f0
0x1401c5709: call   0x1400bb120
0x1401c570e: lea    rcx,[rbp-0x8]
0x1401c5712: call   0x14006ee10
0x1401c5717: mov    rcx,QWORD PTR [rax]
0x1401c571a: lea    rdx,[rbp+0xd10]
0x1401c5721: mov    ecx,DWORD PTR [rcx+0x3c]
0x1401c5724: call   0x14052c2b0
0x1401c5729: xor    r9d,r9d
0x1401c572c: xor    r8d,r8d
0x1401c572f: lea    rdx,[rbp+0xd10]
0x1401c5736: lea    rcx,[rip+0x2484cb3]        # 0x14264a3f0
0x1401c573d: call   0x140ad9960
0x1401c5742: mov    r8b,0x1
0x1401c5745: mov    dl,0x2f
0x1401c5747: lea    rcx,[rip+0x2484ca2]        # 0x14264a3f0
0x1401c574e: call   0x1400bb190
0x1401c5753: lea    rcx,[rbp-0x8]
0x1401c5757: call   0x14006ee10
0x1401c575c: mov    rcx,QWORD PTR [rax]
0x1401c575f: lea    rdx,[rbp+0xd10]
0x1401c5766: mov    ecx,DWORD PTR [rcx+0x38]
0x1401c5769: call   0x14052c2b0
0x1401c576e: xor    r9d,r9d
0x1401c5771: xor    r8d,r8d
0x1401c5774: lea    rdx,[rbp+0xd10]
0x1401c577b: lea    rcx,[rip+0x2484c6e]        # 0x14264a3f0
0x1401c5782: call   0x140ad9960
0x1401c5787: lea    rcx,[rbp-0x8]
0x1401c578b: call   0x14006ee10
0x1401c5790: mov    rcx,QWORD PTR [rax]
0x1401c5793: cmp    WORD PTR [rcx],0x4
0x1401c5797: jne    0x1401c5853
0x1401c579d: xor    r8d,r8d
0x1401c57a0: mov    edx,0x7
0x1401c57a5: mov    r9b,0x1
0x1401c57a8: lea    rcx,[rip+0x2484c41]        # 0x14264a3f0
0x1401c57af: call   0x1400bb130
0x1401c57b4: mov    r8d,ebx
0x1401c57b7: mov    edx,r12d
0x1401c57ba: lea    rcx,[rip+0x2484c2f]        # 0x14264a3f0
0x1401c57c1: call   0x1400bb120
0x1401c57c6: lea    rdx,[rip+0x143e1bb]        # 0x141603988  'Trade Agreement (Exports to '
0x1401c57cd: lea    rcx,[rbp+0x1d90]
0x1401c57d4: call   0x140068150
0x1401c57d9: nop
0x1401c57da: xor    r9d,r9d
0x1401c57dd: xor    r8d,r8d
0x1401c57e0: lea    rdx,[rbp+0x1d90]
0x1401c57e7: lea    rcx,[rip+0x2484c02]        # 0x14264a3f0
0x1401c57ee: call   0x140ad9960
0x1401c57f3: nop
0x1401c57f4: lea    rcx,[rbp+0x1d90]
0x1401c57fb: call   0x140067e30
0x1401c5800: lea    rcx,[rbp+0x1510]
0x1401c5807: call   0x14006f690
0x1401c580c: nop
0x1401c580d: lea    rdx,[rbp+0x1510]
0x1401c5814: mov    rcx,r14
0x1401c5817: call   0x140a94030
0x1401c581c: xor    r9d,r9d
0x1401c581f: xor    r8d,r8d
0x1401c5822: lea    rdx,[rbp+0x1510]
0x1401c5829: lea    rcx,[rip+0x2484bc0]        # 0x14264a3f0
0x1401c5830: call   0x140ad9960
0x1401c5835: mov    r8b,0x1
0x1401c5838: mov    dl,0x29
0x1401c583a: lea    rcx,[rip+0x2484baf]        # 0x14264a3f0
0x1401c5841: call   0x1400bb190
0x1401c5846: nop
0x1401c5847: lea    rcx,[rbp+0x1510]
0x1401c584e: call   0x140067e30
0x1401c5853: lea    rcx,[rbp-0x8]
0x1401c5857: call   0x14006ee10
0x1401c585c: mov    rcx,QWORD PTR [rax]
0x1401c585f: cmp    WORD PTR [rcx],0x5
0x1401c5863: jne    0x1401c591f
0x1401c5869: xor    r8d,r8d
0x1401c586c: mov    edx,0x7
0x1401c5871: mov    r9b,0x1
0x1401c5874: lea    rcx,[rip+0x2484b75]        # 0x14264a3f0
0x1401c587b: call   0x1400bb130
0x1401c5880: mov    r8d,ebx
0x1401c5883: mov    edx,r12d
0x1401c5886: lea    rcx,[rip+0x2484b63]        # 0x14264a3f0
0x1401c588d: call   0x1400bb120
0x1401c5892: lea    rdx,[rip+0x143e10f]        # 0x1416039a8  'Requests (Imports from '
0x1401c5899: lea    rcx,[rbp+0x1db0]
0x1401c58a0: call   0x140068150
0x1401c58a5: nop
0x1401c58a6: xor    r9d,r9d
0x1401c58a9: xor    r8d,r8d
0x1401c58ac: lea    rdx,[rbp+0x1db0]
0x1401c58b3: lea    rcx,[rip+0x2484b36]        # 0x14264a3f0
0x1401c58ba: call   0x140ad9960
0x1401c58bf: nop
0x1401c58c0: lea    rcx,[rbp+0x1db0]
0x1401c58c7: call   0x140067e30
0x1401c58cc: lea    rcx,[rbp+0x1530]
0x1401c58d3: call   0x14006f690
0x1401c58d8: nop
0x1401c58d9: lea    rdx,[rbp+0x1530]
0x1401c58e0: mov    rcx,r14
0x1401c58e3: call   0x140a94030
0x1401c58e8: xor    r9d,r9d
0x1401c58eb: xor    r8d,r8d
0x1401c58ee: lea    rdx,[rbp+0x1530]
0x1401c58f5: lea    rcx,[rip+0x2484af4]        # 0x14264a3f0
0x1401c58fc: call   0x140ad9960
0x1401c5901: mov    r8b,0x1
0x1401c5904: mov    dl,0x29
0x1401c5906: lea    rcx,[rip+0x2484ae3]        # 0x14264a3f0
0x1401c590d: call   0x1400bb190
0x1401c5912: nop
0x1401c5913: lea    rcx,[rbp+0x1530]
0x1401c591a: call   0x140067e30
0x1401c591f: inc    r12d
0x1401c5922: cmp    r12d,r13d
0x1401c5925: jg     0x1401c5df7
0x1401c592b: xor    r8d,r8d
0x1401c592e: mov    edx,0x7
0x1401c5933: xor    r9d,r9d
0x1401c5936: lea    rcx,[rip+0x2484ab3]        # 0x14264a3f0
0x1401c593d: call   0x1400bb130
0x1401c5942: lea    edi,[rbx+0x1]
0x1401c5945: mov    DWORD PTR [rbp-0x68],edi
0x1401c5948: mov    r8d,edi
0x1401c594b: mov    edx,r12d
0x1401c594e: lea    rcx,[rip+0x2484a9b]        # 0x14264a3f0
0x1401c5955: call   0x1400bb120
0x1401c595a: lea    rdx,[rip+0x143e05f]        # 0x1416039c0  'Agreed in year '
0x1401c5961: lea    rcx,[rbp+0x1dd0]
0x1401c5968: call   0x140068150
0x1401c596d: nop
0x1401c596e: xor    r9d,r9d
0x1401c5971: mov    r8b,0x3
0x1401c5974: lea    rdx,[rbp+0x1dd0]
0x1401c597b: lea    rcx,[rip+0x2484a6e]        # 0x14264a3f0
0x1401c5982: call   0x140ad9960
0x1401c5987: nop
0x1401c5988: lea    rcx,[rbp+0x1dd0]
0x1401c598f: call   0x140067e30
0x1401c5994: lea    rcx,[rbp-0x8]
0x1401c5998: call   0x14006ee10
0x1401c599d: mov    rcx,QWORD PTR [rax]
0x1401c59a0: lea    rdx,[rbp+0xd10]
0x1401c59a7: mov    ecx,DWORD PTR [rcx+0x40]
0x1401c59aa: call   0x14052c2b0
0x1401c59af: xor    r9d,r9d
0x1401c59b2: xor    r8d,r8d
0x1401c59b5: lea    rdx,[rbp+0xd10]
0x1401c59bc: lea    rcx,[rip+0x2484a2d]        # 0x14264a3f0
0x1401c59c3: call   0x140ad9960
0x1401c59c8: lea    rcx,[rbp+0x198]
0x1401c59cf: call   0x14006ee10
0x1401c59d4: cmp    BYTE PTR [rax],0x0
0x1401c59d7: je     0x1401c5a3d
0x1401c59d9: lea    r8d,[rbx+0x1e]
0x1401c59dd: mov    edx,r12d
0x1401c59e0: lea    rcx,[rip+0x2484a09]        # 0x14264a3f0
0x1401c59e7: call   0x1400bb120
0x1401c59ec: xor    r8d,r8d
0x1401c59ef: mov    edx,0x3
0x1401c59f4: mov    r9b,0x1
0x1401c59f7: lea    rcx,[rip+0x24849f2]        # 0x14264a3f0
0x1401c59fe: call   0x1400bb130
0x1401c5a03: lea    rdx,[rip+0x143dfc6]        # 0x1416039d0  'Pending'
0x1401c5a0a: lea    rcx,[rbp+0x1df0]
0x1401c5a11: call   0x140068150
0x1401c5a16: nop
0x1401c5a17: xor    r9d,r9d
0x1401c5a1a: xor    r8d,r8d
0x1401c5a1d: lea    rdx,[rbp+0x1df0]
0x1401c5a24: lea    rcx,[rip+0x24849c5]        # 0x14264a3f0
0x1401c5a2b: call   0x140ad9960
0x1401c5a30: nop
0x1401c5a31: lea    rcx,[rbp+0x1df0]
0x1401c5a38: call   0x140067e30
0x1401c5a3d: inc    r12d
0x1401c5a40: cmp    r12d,r13d
0x1401c5a43: jg     0x1401c5df7
0x1401c5a49: lea    rcx,[rbp-0x8]
0x1401c5a4d: call   0x14006ee10
0x1401c5a52: mov    rcx,QWORD PTR [rax]
0x1401c5a55: cmp    WORD PTR [rcx],0x4
0x1401c5a59: jne    0x1401c5bc9
0x1401c5a5f: lea    rcx,[rbp-0x8]
0x1401c5a63: call   0x14006ee10
0x1401c5a68: mov    rcx,QWORD PTR [rax]
0x1401c5a6b: cmp    QWORD PTR [rcx+0x48],0x0
0x1401c5a70: je     0x1401c5bc9
0x1401c5a76: lea    rcx,[rbp-0x8]
0x1401c5a7a: call   0x14006ee10
0x1401c5a7f: mov    rcx,QWORD PTR [rax]
0x1401c5a82: mov    rsi,QWORD PTR [rcx+0x48]
0x1401c5a86: xor    r15d,r15d
0x1401c5a89: add    rsi,0x8
0x1401c5a8d: nop    DWORD PTR [rax]
0x1401c5a90: mov    rcx,rsi
0x1401c5a93: call   0x14006f370
0x1401c5a98: mov    r14,rax
0x1401c5a9b: xor    ebx,ebx
0x1401c5a9d: test   eax,eax
0x1401c5a9f: jle    0x1401c5bb2
0x1401c5aa5: cmp    r12d,r13d
0x1401c5aa8: jg     0x1401c5bb2
0x1401c5aae: movsxd rdi,ebx
0x1401c5ab1: mov    rdx,rdi
0x1401c5ab4: mov    rcx,rsi
0x1401c5ab7: call   0x14006f360
0x1401c5abc: cmp    DWORD PTR [rax],0x80
0x1401c5ac2: je     0x1401c5ba7
0x1401c5ac8: xor    r8d,r8d
0x1401c5acb: mov    edx,0x6
0x1401c5ad0: xor    r9d,r9d
0x1401c5ad3: lea    rcx,[rip+0x2484916]        # 0x14264a3f0
0x1401c5ada: call   0x1400bb130
0x1401c5adf: mov    r8d,DWORD PTR [rbp-0x68]
0x1401c5ae3: mov    edx,r12d
0x1401c5ae6: lea    rcx,[rip+0x2484903]        # 0x14264a3f0
0x1401c5aed: call   0x1400bb120
0x1401c5af2: lea    r9,[rbp+0xd10]
0x1401c5af9: movzx  r8d,bx
0x1401c5afd: movzx  edx,r15w
0x1401c5b01: mov    rcx,QWORD PTR [rbp-0x78]
0x1401c5b05: call   0x140914540
0x1401c5b0a: lea    rcx,[rbp+0xd10]
0x1401c5b11: call   0x14052d650
0x1401c5b16: xor    r9d,r9d
0x1401c5b19: xor    r8d,r8d
0x1401c5b1c: lea    rdx,[rbp+0xd10]
0x1401c5b23: lea    rcx,[rip+0x24848c6]        # 0x14264a3f0
0x1401c5b2a: call   0x140ad9960
0x1401c5b2f: xor    r8d,r8d
0x1401c5b32: mov    edx,0x6
0x1401c5b37: mov    r9b,0x1
0x1401c5b3a: lea    rcx,[rip+0x24848af]        # 0x14264a3f0
0x1401c5b41: call   0x1400bb130
0x1401c5b46: mov    r8d,DWORD PTR [rbp-0x58]
0x1401c5b4a: add    r8d,0x2c
0x1401c5b4e: mov    edx,r12d
0x1401c5b51: lea    rcx,[rip+0x2484898]        # 0x14264a3f0
0x1401c5b58: call   0x1400bb120
0x1401c5b5d: mov    rdx,rdi
0x1401c5b60: mov    rcx,rsi
0x1401c5b63: call   0x14006f360
0x1401c5b68: imul   ecx,DWORD PTR [rax],0x64
0x1401c5b6b: sar    ecx,0x7
0x1401c5b6e: lea    rdx,[rbp+0xd10]
0x1401c5b75: call   0x14052c2b0
0x1401c5b7a: xor    r9d,r9d
0x1401c5b7d: xor    r8d,r8d
0x1401c5b80: lea    rdx,[rbp+0xd10]
0x1401c5b87: lea    rcx,[rip+0x2484862]        # 0x14264a3f0
0x1401c5b8e: call   0x140ad9960
0x1401c5b93: mov    r8b,0x1
0x1401c5b96: mov    dl,0x25
0x1401c5b98: lea    rcx,[rip+0x2484851]        # 0x14264a3f0
0x1401c5b9f: call   0x1400bb190
0x1401c5ba4: inc    r12d
0x1401c5ba7: inc    ebx
0x1401c5ba9: cmp    ebx,r14d
0x1401c5bac: jl     0x1401c5aa5
0x1401c5bb2: inc    r15d
0x1401c5bb5: add    rsi,0x18
0x1401c5bb9: cmp    r15d,0x6b
0x1401c5bbd: jl     0x1401c5a90
0x1401c5bc3: mov    ebx,DWORD PTR [rbp-0x58]
0x1401c5bc6: mov    edi,DWORD PTR [rbp-0x68]
0x1401c5bc9: lea    rcx,[rbp-0x8]
0x1401c5bcd: call   0x14006ee10
0x1401c5bd2: mov    rcx,QWORD PTR [rax]
0x1401c5bd5: cmp    WORD PTR [rcx],0x5
0x1401c5bd9: jne    0x1401c5db8
0x1401c5bdf: lea    rcx,[rbp-0x8]
0x1401c5be3: call   0x14006ee10
0x1401c5be8: mov    rcx,QWORD PTR [rax]
0x1401c5beb: cmp    QWORD PTR [rcx+0x50],0x0
0x1401c5bf0: je     0x1401c5db8
0x1401c5bf6: lea    rcx,[rbp-0x8]
0x1401c5bfa: call   0x14006ee10
0x1401c5bff: mov    rcx,QWORD PTR [rax]
0x1401c5c02: mov    rax,QWORD PTR [rcx+0x50]
0x1401c5c06: mov    QWORD PTR [rbp-0x28],rax
0x1401c5c0a: mov    rcx,QWORD PTR [rax]
0x1401c5c0d: call   0x14006f450
0x1401c5c12: mov    QWORD PTR [rbp-0x30],rax
0x1401c5c16: xor    esi,esi
0x1401c5c18: mov    DWORD PTR [rbp-0x68],esi
0x1401c5c1b: test   eax,eax
0x1401c5c1d: jle    0x1401c5db8
0x1401c5c23: cmp    r12d,r13d
0x1401c5c26: jg     0x1401c5db8
0x1401c5c2c: xor    r8d,r8d
0x1401c5c2f: mov    edx,0x6
0x1401c5c34: xor    r9d,r9d
0x1401c5c37: lea    rcx,[rip+0x24847b2]        # 0x14264a3f0
0x1401c5c3e: call   0x1400bb130
0x1401c5c43: mov    r8d,edi
0x1401c5c46: mov    edx,r12d
0x1401c5c49: lea    rcx,[rip+0x24847a0]        # 0x14264a3f0
0x1401c5c50: call   0x1400bb120
0x1401c5c55: mov    rbx,QWORD PTR [rbp-0x28]
0x1401c5c59: mov    rcx,QWORD PTR [rbx]
0x1401c5c5c: add    rcx,0x60
0x1401c5c60: movsxd r15,esi
0x1401c5c63: mov    rdx,r15
0x1401c5c66: call   0x14006f360
0x1401c5c6b: mov    esi,DWORD PTR [rax]
0x1401c5c6d: mov    rcx,QWORD PTR [rbx]
0x1401c5c70: add    rcx,0x48
0x1401c5c74: mov    rdx,r15
0x1401c5c77: call   0x14006f440
0x1401c5c7c: movsx  r14d,WORD PTR [rax]
0x1401c5c80: mov    rcx,QWORD PTR [rbx]
0x1401c5c83: add    rcx,0x30
0x1401c5c87: mov    rdx,r15
0x1401c5c8a: call   0x14006f440
0x1401c5c8f: movzx  edi,WORD PTR [rax]
0x1401c5c92: mov    rcx,QWORD PTR [rbx]
0x1401c5c95: add    rcx,0x18
0x1401c5c99: mov    rdx,r15
0x1401c5c9c: call   0x14006f440
0x1401c5ca1: movzx  ebx,WORD PTR [rax]
0x1401c5ca4: mov    rdx,r15
0x1401c5ca7: mov    rcx,QWORD PTR [rbp-0x28]
0x1401c5cab: mov    rcx,QWORD PTR [rcx]
0x1401c5cae: call   0x14006f440
0x1401c5cb3: xor    ecx,ecx
0x1401c5cb5: mov    DWORD PTR [rsp+0x68],ecx
0x1401c5cb9: mov    DWORD PTR [rsp+0x60],esi
0x1401c5cbd: mov    BYTE PTR [rsp+0x58],0x1
0x1401c5cc2: mov    DWORD PTR [rsp+0x50],0xffffffff
0x1401c5cca: mov    DWORD PTR [rsp+0x48],0xffffffff
0x1401c5cd2: mov    QWORD PTR [rsp+0x40],rcx
0x1401c5cd7: mov    BYTE PTR [rsp+0x38],cl
0x1401c5cdb: mov    DWORD PTR [rsp+0x30],ecx
0x1401c5cdf: mov    DWORD PTR [rsp+0x28],0xffffffff
0x1401c5ce7: mov    DWORD PTR [rsp+0x20],r14d
0x1401c5cec: movzx  r9d,di
0x1401c5cf0: movzx  r8d,bx
0x1401c5cf4: movzx  edx,WORD PTR [rax]
0x1401c5cf7: lea    rcx,[rbp+0xd10]
0x1401c5cfe: call   0x140a82c10
0x1401c5d03: lea    rcx,[rbp+0xd10]
0x1401c5d0a: call   0x14052d650
0x1401c5d0f: xor    r9d,r9d
0x1401c5d12: xor    r8d,r8d
0x1401c5d15: lea    rdx,[rbp+0xd10]
0x1401c5d1c: lea    rcx,[rip+0x24846cd]        # 0x14264a3f0
0x1401c5d23: call   0x140ad9960
0x1401c5d28: xor    r8d,r8d
0x1401c5d2b: mov    edx,0x6
0x1401c5d30: mov    r9b,0x1
0x1401c5d33: lea    rcx,[rip+0x24846b6]        # 0x14264a3f0
0x1401c5d3a: call   0x1400bb130
0x1401c5d3f: mov    ebx,DWORD PTR [rbp-0x58]
0x1401c5d42: lea    r8d,[rbx+0x2c]
0x1401c5d46: mov    edx,r12d
0x1401c5d49: lea    rcx,[rip+0x24846a0]        # 0x14264a3f0
0x1401c5d50: call   0x1400bb120
0x1401c5d55: mov    rcx,QWORD PTR [rbp-0x28]
0x1401c5d59: add    rcx,0x8
0x1401c5d5d: mov    rdx,r15
0x1401c5d60: call   0x14006f360
0x1401c5d65: imul   ecx,DWORD PTR [rax],0x64
0x1401c5d68: sar    ecx,0x7
0x1401c5d6b: lea    rdx,[rbp+0xd10]
0x1401c5d72: call   0x14052c2b0
0x1401c5d77: xor    r9d,r9d
0x1401c5d7a: xor    r8d,r8d
0x1401c5d7d: lea    rdx,[rbp+0xd10]
0x1401c5d84: lea    rcx,[rip+0x2484665]        # 0x14264a3f0
0x1401c5d8b: call   0x140ad9960
0x1401c5d90: mov    r8b,0x1
0x1401c5d93: mov    dl,0x25
0x1401c5d95: lea    rcx,[rip+0x2484654]        # 0x14264a3f0
0x1401c5d9c: call   0x1400bb190
0x1401c5da1: inc    r12d
0x1401c5da4: mov    esi,DWORD PTR [rbp-0x68]
0x1401c5da7: inc    esi
0x1401c5da9: mov    DWORD PTR [rbp-0x68],esi
0x1401c5dac: cmp    esi,DWORD PTR [rbp-0x30]
0x1401c5daf: lea    edi,[rbx+0x1]
0x1401c5db2: jl     0x1401c5c23
0x1401c5db8: lea    rcx,[rbp-0x8]
0x1401c5dbc: call   0x14006ee00
0x1401c5dc1: lea    rcx,[rbp+0x198]
0x1401c5dc8: call   0x1401f9af0
0x1401c5dcd: lea    r8,[rbp+0x100]
0x1401c5dd4: lea    rdx,[rbp+0xa]
0x1401c5dd8: lea    rcx,[rbp-0x8]
0x1401c5ddc: call   0x14006ee20
0x1401c5de1: xor    edx,edx
0x1401c5de3: movzx  ecx,BYTE PTR [rax]
0x1401c5de6: call   0x1400657b0
0x1401c5deb: test   al,al
0x1401c5ded: mov    r14,QWORD PTR [rbp-0x60]
0x1401c5df1: jne    0x1401c5614
0x1401c5df7: mov    rsi,QWORD PTR [rbp-0x78]
0x1401c5dfb: lea    rcx,[rbp+0xd10]
0x1401c5e02: call   0x140067e30
0x1401c5e07: jmp    0x1401c5e74
0x1401c5e09: cmp    r12d,r13d
0x1401c5e0c: jg     0x1401c5e74
0x1401c5e0e: mov    r8d,ebx
0x1401c5e11: mov    edx,r12d
0x1401c5e14: lea    rcx,[rip+0x24845d5]        # 0x14264a3f0
0x1401c5e1b: call   0x1400bb120
0x1401c5e20: xor    r8d,r8d
0x1401c5e23: mov    edx,0x7
0x1401c5e28: xor    r9d,r9d
0x1401c5e2b: lea    rcx,[rip+0x24845be]        # 0x14264a3f0
0x1401c5e32: call   0x1400bb130
0x1401c5e37: lea    rdx,[rip+0x143db9a]        # 0x1416039d8  'You have no agreements with this land.'
0x1401c5e3e: lea    rcx,[rbp+0x1e10]
0x1401c5e45: call   0x140068150
0x1401c5e4a: nop
0x1401c5e4b: xor    r9d,r9d
0x1401c5e4e: xor    r8d,r8d
0x1401c5e51: lea    rdx,[rbp+0x1e10]
0x1401c5e58: lea    rcx,[rip+0x2484591]        # 0x14264a3f0
0x1401c5e5f: call   0x140ad9960
0x1401c5e64: nop
0x1401c5e65: lea    rcx,[rbp+0x1e10]
0x1401c5e6c: call   0x140067e30
0x1401c5e71: inc    r12d
0x1401c5e74: inc    r12d
0x1401c5e77: mov    rdi,QWORD PTR [rsp+0x78]
0x1401c5e7c: add    rdi,0x250
0x1401c5e83: mov    rcx,rdi
0x1401c5e86: call   0x14006ee50
0x1401c5e8b: test   rax,rax
0x1401c5e8e: je     0x1401c6123
0x1401c5e94: xor    r8d,r8d
0x1401c5e97: mov    edx,0x7
0x1401c5e9c: xor    r9d,r9d
0x1401c5e9f: lea    rcx,[rip+0x248454a]        # 0x14264a3f0
0x1401c5ea6: call   0x1400bb130
0x1401c5eab: lea    rcx,[rbp+0xe90]
0x1401c5eb2: call   0x14006f690
0x1401c5eb7: nop
0x1401c5eb8: lea    rdx,[rbp+0x68]
0x1401c5ebc: mov    rcx,rdi
0x1401c5ebf: call   0x14006f240
0x1401c5ec4: lea    rdx,[rbp+0x108]
0x1401c5ecb: mov    rcx,rdi
0x1401c5ece: call   0x14006f230
0x1401c5ed3: lea    r8,[rbp+0x108]
0x1401c5eda: lea    rdx,[rbp+0xb]
0x1401c5ede: lea    rcx,[rbp+0x68]
0x1401c5ee2: call   0x14006ee20
0x1401c5ee7: xor    edx,edx
0x1401c5ee9: movzx  ecx,BYTE PTR [rax]
0x1401c5eec: call   0x1400657b0
0x1401c5ef1: test   al,al
0x1401c5ef3: je     0x1401c6057
0x1401c5ef9: nop    DWORD PTR [rax+0x0]
0x1401c5f00: cmp    r12d,r13d
0x1401c5f03: jg     0x1401c6057
0x1401c5f09: lea    rcx,[rbp+0x68]
0x1401c5f0d: call   0x14006ee10
0x1401c5f12: mov    rcx,QWORD PTR [rax]
0x1401c5f15: mov    rcx,QWORD PTR [rcx+0x10]
0x1401c5f19: call   0x140c0f660
0x1401c5f1e: test   rax,rax
0x1401c5f21: je     0x1401c5f38
0x1401c5f23: cmp    BYTE PTR [rax+0x72],0x0
0x1401c5f27: je     0x1401c5f38
0x1401c5f29: lea    rdx,[rbp+0xe90]
0x1401c5f30: mov    rcx,rax
0x1401c5f33: call   0x140a94030
0x1401c5f38: lea    rcx,[rbp+0xe90]
0x1401c5f3f: call   0x14052d650
0x1401c5f44: mov    r8d,ebx
0x1401c5f47: mov    edx,r12d
0x1401c5f4a: lea    rcx,[rip+0x248449f]        # 0x14264a3f0
0x1401c5f51: call   0x1400bb120
0x1401c5f56: xor    r9d,r9d
0x1401c5f59: xor    r8d,r8d
0x1401c5f5c: lea    rdx,[rbp+0xe90]
0x1401c5f63: lea    rcx,[rip+0x2484486]        # 0x14264a3f0
0x1401c5f6a: call   0x140ad9960
0x1401c5f6f: lea    r8d,[rbx+0x19]
0x1401c5f73: mov    edx,r12d
0x1401c5f76: lea    rcx,[rip+0x2484473]        # 0x14264a3f0
0x1401c5f7d: call   0x1400bb120
0x1401c5f82: lea    rcx,[rbp+0x68]
0x1401c5f86: call   0x14006ee10
0x1401c5f8b: mov    r8d,DWORD PTR [rsi+0x4]
0x1401c5f8f: lea    rdx,[rbp+0xe90]
0x1401c5f96: mov    rcx,QWORD PTR [rax]
0x1401c5f99: call   0x140ddda40
0x1401c5f9e: lea    rcx,[rbp+0xe90]
0x1401c5fa5: call   0x14052d650
0x1401c5faa: lea    rcx,[rbp+0xe90]
0x1401c5fb1: call   0x14006f330
0x1401c5fb6: cmp    rax,0x1a
0x1401c5fba: jb     0x1401c600c
0x1401c5fbc: xor    r8d,r8d
0x1401c5fbf: mov    edx,0x19
0x1401c5fc4: lea    rcx,[rbp+0xe90]
0x1401c5fcb: call   0x1400e1230
0x1401c5fd0: mov    edx,0x16
0x1401c5fd5: lea    rcx,[rbp+0xe90]
0x1401c5fdc: call   0x1400fb540
0x1401c5fe1: mov    BYTE PTR [rax],0x2e
0x1401c5fe4: mov    edx,0x17
0x1401c5fe9: lea    rcx,[rbp+0xe90]
0x1401c5ff0: call   0x1400fb540
0x1401c5ff5: mov    BYTE PTR [rax],0x2e
0x1401c5ff8: mov    edx,0x18
0x1401c5ffd: lea    rcx,[rbp+0xe90]
0x1401c6004: call   0x1400fb540
0x1401c6009: mov    BYTE PTR [rax],0x2e
0x1401c600c: xor    r9d,r9d
0x1401c600f: xor    r8d,r8d
0x1401c6012: lea    rdx,[rbp+0xe90]
0x1401c6019: lea    rcx,[rip+0x24843d0]        # 0x14264a3f0
0x1401c6020: call   0x140ad9960
0x1401c6025: inc    r12d
0x1401c6028: lea    rcx,[rbp+0x68]
0x1401c602c: call   0x14006ee00
0x1401c6031: lea    r8,[rbp+0x108]
0x1401c6038: lea    rdx,[rbp+0xb]
0x1401c603c: lea    rcx,[rbp+0x68]
0x1401c6040: call   0x14006ee20
0x1401c6045: xor    edx,edx
0x1401c6047: movzx  ecx,BYTE PTR [rax]
0x1401c604a: call   0x1400657b0
0x1401c604f: test   al,al
0x1401c6051: jne    0x1401c5f00
0x1401c6057: lea    rcx,[rbp+0xe90]
0x1401c605e: call   0x140067e30
0x1401c6063: mov    r13,QWORD PTR [rsp+0x78]
0x1401c6068: mov    eax,DWORD PTR [r13+0x1b4]
0x1401c606f: cmp    eax,0x3
0x1401c6072: je     0x1401c6079
0x1401c6074: cmp    eax,0x8
0x1401c6077: jne    0x1401c6086
0x1401c6079: cmp    DWORD PTR [rip+0x2207708],0x42        # 0x1423cd788
0x1401c6080: jle    0x1401d37d5
0x1401c6086: movsxd rdi,DWORD PTR [rbp-0x18]
0x1401c608a: mov    DWORD PTR [rbp-0x68],edi
0x1401c608d: lea    esi,[rdi-0x12]
0x1401c6090: mov    eax,DWORD PTR [rip+0x22076f2]        # 0x1423cd788
0x1401c6096: lea    ecx,[rax-0x18]
0x1401c6099: mov    DWORD PTR [rsp+0x74],ecx
0x1401c609d: lea    r13d,[rax-0x15]
0x1401c60a1: mov    DWORD PTR [rbp-0x60],r13d
0x1401c60a5: lea    edx,[rax-0x12]
0x1401c60a8: mov    DWORD PTR [rbp-0x58],edx
0x1401c60ab: lea    edx,[rax-0xf]
0x1401c60ae: mov    DWORD PTR [rsp+0x70],edx
0x1401c60b2: lea    edx,[rax-0xc]
0x1401c60b5: mov    DWORD PTR [rbp-0x48],edx
0x1401c60b8: lea    edx,[rax-0x9]
0x1401c60bb: mov    DWORD PTR [rbp-0x6c],edx
0x1401c60be: lea    edx,[rax-0x6]
0x1401c60c1: mov    DWORD PTR [rbp-0x70],edx
0x1401c60c4: lea    r8d,[rdi-0x7]
0x1401c60c8: mov    DWORD PTR [rbp-0x28],r8d
0x1401c60cc: add    eax,0xfffffffd
0x1401c60cf: mov    DWORD PTR [rbp-0x10],eax
0x1401c60d2: mov    r12d,esi
0x1401c60d5: cmp    esi,edi
0x1401c60d7: jg     0x1401d28b7
0x1401c60dd: movsxd r13,esi
0x1401c60e0: mov    r15,r13
0x1401c60e3: mov    rsi,rdi
0x1401c60e6: mov    r14d,ecx
0x1401c60e9: lea    rbx,[rip+0x2485da4]        # 0x14264be94
0x1401c60f0: lea    rdi,[rip+0x2485da9]        # 0x14264bea0
0x1401c60f7: nop    WORD PTR [rax+rax*1+0x0]
0x1401c6100: mov    r8d,r12d
0x1401c6103: mov    edx,r14d
0x1401c6106: lea    rcx,[rip+0x24842e3]        # 0x14264a3f0
0x1401c610d: call   0x1400bb120
0x1401c6112: cmp    r15,r13
0x1401c6115: jne    0x1401d2873
0x1401c611b: mov    edx,DWORD PTR [rbx-0x18]
0x1401c611e: jmp    0x1401d287f
0x1401c6123: cmp    r12d,r13d
0x1401c6126: jg     0x1401c6063
0x1401c612c: mov    r8d,ebx
0x1401c612f: mov    edx,r12d
0x1401c6132: lea    rcx,[rip+0x24842b7]        # 0x14264a3f0
0x1401c6139: call   0x1400bb120
0x1401c613e: xor    r8d,r8d
0x1401c6141: mov    edx,0x7
0x1401c6146: xor    r9d,r9d
0x1401c6149: lea    rcx,[rip+0x24842a0]        # 0x14264a3f0
0x1401c6150: call   0x1400bb130
0x1401c6155: lea    rdx,[rip+0x143d8a4]        # 0x141603a00  'This land has no important leaders.'
0x1401c615c: lea    rcx,[rbp+0x1e30]
0x1401c6163: call   0x140068150
0x1401c6168: nop
0x1401c6169: xor    r9d,r9d
0x1401c616c: xor    r8d,r8d
0x1401c616f: lea    rdx,[rbp+0x1e30]
0x1401c6176: lea    rcx,[rip+0x2484273]        # 0x14264a3f0
0x1401c617d: call   0x140ad9960
0x1401c6182: nop
0x1401c6183: lea    rcx,[rbp+0x1e30]
0x1401c618a: jmp    0x1401c605e
0x1401c618f: mov    r13d,DWORD PTR [rbp-0x18]
0x1401c6193: mov    DWORD PTR [rsp+0x74],r13d
0x1401c6198: lea    r15d,[r13-0x37]
0x1401c619c: mov    DWORD PTR [rbp-0x68],r15d
0x1401c61a0: lea    ecx,[r15-0x2]
0x1401c61a4: mov    DWORD PTR [rbp-0x58],ecx
0x1401c61a7: mov    r12d,0x14
0x1401c61ad: mov    eax,DWORD PTR [rip+0x22075d5]        # 0x1423cd788
0x1401c61b3: cmp    eax,0x2e
0x1401c61b6: jle    0x1401c61d0
0x1401c61b8: lea    r12d,[rax-0x1a]
0x1401c61bc: cmp    r12d,0x1e
0x1401c61c0: jle    0x1401c61d0
0x1401c61c2: mov    r12d,0x1e
0x1401c61c8: mov    edi,r13d
0x1401c61cb: mov    r14d,esi
0x1401c61ce: jmp    0x1401c61e0
0x1401c61d0: mov    edi,r13d
0x1401c61d3: mov    r14d,esi
0x1401c61d6: test   r12d,r12d
0x1401c61d9: js     0x1401c62bc
0x1401c61df: nop
0x1401c61e0: mov    ebx,ecx
0x1401c61e2: cmp    ecx,edi
0x1401c61e4: jg     0x1401c62a9
0x1401c61ea: movsxd r15,r12d
0x1401c61ed: mov    r13d,DWORD PTR [rbp-0x58]
0x1401c61f1: mov    r8d,ebx
0x1401c61f4: mov    edx,r14d
0x1401c61f7: lea    rcx,[rip+0x24841f2]        # 0x14264a3f0
0x1401c61fe: call   0x1400bb120
0x1401c6203: xor    r8d,r8d
0x1401c6206: xor    edx,edx
0x1401c6208: lea    rcx,[rip+0x24841e1]        # 0x14264a3f0
0x1401c620f: call   0x1400bb190
0x1401c6214: test   rsi,rsi
0x1401c6217: jne    0x1401c6241
0x1401c6219: cmp    ebx,r13d
0x1401c621c: jne    0x1401c6226
0x1401c621e: mov    edx,DWORD PTR [rip+0x2485af0]        # 0x14264bd14
0x1401c6224: jmp    0x1401c628b
0x1401c6226: lea    rcx,[rip+0x24841c3]        # 0x14264a3f0
0x1401c622d: cmp    ebx,edi
0x1401c622f: jne    0x1401c6239
0x1401c6231: mov    edx,DWORD PTR [rip+0x2485af5]        # 0x14264bd2c
0x1401c6237: jmp    0x1401c6292
0x1401c6239: mov    edx,DWORD PTR [rip+0x2485ae1]        # 0x14264bd20
0x1401c623f: jmp    0x1401c6292
0x1401c6241: cmp    rsi,r15
0x1401c6244: jne    0x1401c626e
0x1401c6246: cmp    ebx,r13d
0x1401c6249: jne    0x1401c6253
0x1401c624b: mov    edx,DWORD PTR [rip+0x2485acb]        # 0x14264bd1c
0x1401c6251: jmp    0x1401c628b
0x1401c6253: lea    rcx,[rip+0x2484196]        # 0x14264a3f0
0x1401c625a: cmp    ebx,edi
0x1401c625c: jne    0x1401c6266
0x1401c625e: mov    edx,DWORD PTR [rip+0x2485ad0]        # 0x14264bd34
0x1401c6264: jmp    0x1401c6292
0x1401c6266: mov    edx,DWORD PTR [rip+0x2485abc]        # 0x14264bd28
0x1401c626c: jmp    0x1401c6292
0x1401c626e: cmp    ebx,r13d
0x1401c6271: jne    0x1401c627b
0x1401c6273: mov    edx,DWORD PTR [rip+0x2485a9f]        # 0x14264bd18
0x1401c6279: jmp    0x1401c628b
0x1401c627b: cmp    ebx,edi
0x1401c627d: mov    edx,DWORD PTR [rip+0x2485aad]        # 0x14264bd30
0x1401c6283: je     0x1401c628b
0x1401c6285: mov    edx,DWORD PTR [rip+0x2485a99]        # 0x14264bd24
0x1401c628b: lea    rcx,[rip+0x248415e]        # 0x14264a3f0
0x1401c6292: call   0x140adaad0
0x1401c6297: inc    ebx
0x1401c6299: cmp    ebx,edi
0x1401c629b: jle    0x1401c61f1
0x1401c62a1: mov    r13d,DWORD PTR [rsp+0x74]
0x1401c62a6: mov    ecx,DWORD PTR [rbp-0x58]
0x1401c62a9: inc    r14d
0x1401c62ac: inc    rsi
0x1401c62af: cmp    r14d,r12d
0x1401c62b2: jle    0x1401c61e0
0x1401c62b8: lea    r15d,[r13-0x37]
0x1401c62bc: lea    ebx,[r13-0x2]
0x1401c62c0: mov    DWORD PTR [rbp-0x6c],ebx
0x1401c62c3: lea    ecx,[r12-0x1]
0x1401c62c8: mov    eax,0x55555556
0x1401c62cd: imul   ecx
0x1401c62cf: mov    edi,edx
0x1401c62d1: shr    edi,0x1f
0x1401c62d4: add    edi,edx
0x1401c62d6: mov    DWORD PTR [rsp+0x74],edi
0x1401c62da: mov    rcx,QWORD PTR [rsp+0x78]
0x1401c62df: add    rcx,0x2b8
0x1401c62e6: call   0x14006ee50
0x1401c62eb: mov    rsi,rax
0x1401c62ee: mov    QWORD PTR [rbp-0x30],rax
0x1401c62f2: cmp    eax,edi
0x1401c62f4: jle    0x1401c62fd
0x1401c62f6: lea    ebx,[r13-0x4]
0x1401c62fa: mov    DWORD PTR [rbp-0x6c],ebx
0x1401c62fd: lea    r14d,[rbx-0x3]
0x1401c6301: mov    DWORD PTR [rbp-0x10],r14d
0x1401c6305: xor    r8d,r8d
0x1401c6308: mov    QWORD PTR [rbp-0x60],r8
0x1401c630c: mov    r12d,0x1
0x1401c6312: mov    DWORD PTR [rsp+0x70],r12d
0x1401c6317: mov    rax,QWORD PTR [rsp+0x78]
0x1401c631c: mov    ecx,DWORD PTR [rax+0x2e0]
0x1401c6322: mov    edx,esi
0x1401c6324: sub    edx,edi
0x1401c6326: cmp    ecx,edx
0x1401c6328: cmovle edx,ecx
0x1401c632b: mov    eax,r8d
0x1401c632e: test   edx,edx
0x1401c6330: cmovns eax,edx
0x1401c6333: mov    DWORD PTR [rbp-0x70],eax
0x1401c6336: lea    ecx,[rax+rdi*1]
0x1401c6339: mov    DWORD PTR [rbp-0x20],ecx
0x1401c633c: cmp    eax,ecx
0x1401c633e: jge    0x1401c6a31
0x1401c6344: mov    ecx,DWORD PTR [rbp-0x20]
0x1401c6347: mov    DWORD PTR [rbp-0x48],ecx
0x1401c634a: nop    WORD PTR [rax+rax*1+0x0]
0x1401c6350: cmp    eax,esi
0x1401c6352: jge    0x1401c69ae
0x1401c6358: movsxd rdx,eax
0x1401c635b: mov    rdi,QWORD PTR [rsp+0x78]
0x1401c6360: lea    rcx,[rdi+0x2b8]
0x1401c6367: call   0x14006f220
0x1401c636c: mov    r13,QWORD PTR [rax]
0x1401c636f: mov    QWORD PTR [rbp-0x28],r13
0x1401c6373: cmp    BYTE PTR [rip+0x21ca25b],0x0        # 0x1423905d5
0x1401c637a: je     0x1401c63c7
0x1401c637c: mov    eax,DWORD PTR [rbp-0x38]
0x1401c637f: cmp    eax,r15d
0x1401c6382: jl     0x1401c63c7
0x1401c6384: cmp    eax,ebx
0x1401c6386: jg     0x1401c63c7
0x1401c6388: mov    ecx,DWORD PTR [rbp-0x3c]
0x1401c638b: cmp    ecx,r12d
0x1401c638e: jl     0x1401c63c7
0x1401c6390: lea    ebx,[r12-0x1]
0x1401c6395: lea    eax,[rbx+0x3]
0x1401c6398: cmp    ecx,eax
0x1401c639a: jg     0x1401c63c4
0x1401c639c: cmp    QWORD PTR [rdi+0x2d0],r13
0x1401c63a3: je     0x1401c63bd
0x1401c63a5: mov    QWORD PTR [rdi+0x2d0],r13
0x1401c63ac: mov    edx,0x2
0x1401c63b1: lea    rcx,[rip+0x2484038]        # 0x14264a3f0
0x1401c63b8: call   0x140ae7c00
0x1401c63bd: mov    QWORD PTR [rbp-0x60],r13
0x1401c63c1: mov    DWORD PTR [rbp-0x48],ebx
0x1401c63c4: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401c63c7: xor    r8d,r8d
0x1401c63ca: mov    edx,0x7
0x1401c63cf: mov    r9b,0x1
0x1401c63d2: lea    rcx,[rip+0x2484017]        # 0x14264a3f0
0x1401c63d9: call   0x1400bb130
0x1401c63de: mov    esi,r15d
0x1401c63e1: cmp    r15d,ebx
0x1401c63e4: jg     0x1401c6492
0x1401c63ea: lea    r15d,[r12+0x3]
0x1401c63ef: movsxd r13,DWORD PTR [rbp-0x68]
0x1401c63f3: mov    r14,r13
0x1401c63f6: mov    edi,r12d
0x1401c63f9: cmp    r12d,r15d
0x1401c63fc: jge    0x1401c6479
0x1401c63fe: movsxd r12,ebx
0x1401c6401: lea    rbx,[rip+0x24859a8]        # 0x14264bdb0
0x1401c6408: nop    DWORD PTR [rax+rax*1+0x0]
0x1401c6410: mov    r8d,esi
0x1401c6413: mov    edx,edi
0x1401c6415: lea    rcx,[rip+0x2483fd4]        # 0x14264a3f0
0x1401c641c: call   0x1400bb120
0x1401c6421: cmp    esi,r13d
0x1401c6424: jne    0x1401c642b
0x1401c6426: mov    edx,DWORD PTR [rbx-0x18]
0x1401c6429: jmp    0x1401c6437
0x1401c642b: cmp    r14,r12
0x1401c642e: jne    0x1401c6434
0x1401c6430: mov    edx,DWORD PTR [rbx]
0x1401c6432: jmp    0x1401c6437
0x1401c6434: mov    edx,DWORD PTR [rbx-0xc]
0x1401c6437: lea    rcx,[rip+0x2483fb2]        # 0x14264a3f0
0x1401c643e: call   0x140adaad0
0x1401c6443: xor    edx,edx
0x1401c6445: lea    rcx,[rip+0x2207324]        # 0x1423cd770
0x1401c644c: call   0x140071f90
0x1401c6451: test   al,al
0x1401c6453: je     0x1401c6466
0x1401c6455: mov    r8b,0x1
0x1401c6458: xor    edx,edx
0x1401c645a: lea    rcx,[rip+0x2483f8f]        # 0x14264a3f0
0x1401c6461: call   0x1400bb190
0x1401c6466: inc    edi
0x1401c6468: add    rbx,0x4
0x1401c646c: cmp    edi,r15d
0x1401c646f: jl     0x1401c6410
0x1401c6471: mov    r12d,DWORD PTR [rsp+0x70]
0x1401c6476: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401c6479: inc    esi
0x1401c647b: inc    r14
0x1401c647e: cmp    esi,ebx
0x1401c6480: jle    0x1401c63f6
0x1401c6486: mov    r13,QWORD PTR [rbp-0x28]
0x1401c648a: mov    r15d,DWORD PTR [rbp-0x68]
0x1401c648e: mov    r14d,DWORD PTR [rbp-0x10]
0x1401c6492: xor    r8d,r8d
0x1401c6495: mov    edx,0x3
0x1401c649a: mov    r9b,0x1
0x1401c649d: lea    rcx,[rip+0x2483f4c]        # 0x14264a3f0
0x1401c64a4: call   0x1400bb130
0x1401c64a9: lea    rcx,[rbp+0xcf0]
0x1401c64b0: call   0x14006f690
0x1401c64b5: nop
0x1401c64b6: mov    rcx,r13
0x1401c64b9: call   0x140075110
0x1401c64be: sub    eax,0x2
0x1401c64c1: je     0x1401c65a9
0x1401c64c7: sub    eax,0xf
0x1401c64ca: je     0x1401c6571
0x1401c64d0: sub    eax,0x1
0x1401c64d3: je     0x1401c651a
0x1401c64d5: sub    eax,0x1
0x1401c64d8: je     0x1401c650e
0x1401c64da: cmp    eax,0x6
0x1401c64dd: jne    0x1401c662e
0x1401c64e3: lea    rdx,[rbp+0xcf0]
0x1401c64ea: mov    rcx,QWORD PTR [r13+0x130]
0x1401c64f1: call   0x1401bb400
0x1401c64f6: lea    rdx,[rip+0x143bb5f]        # 0x14160205c  ' at '
0x1401c64fd: lea    rcx,[rbp+0xcf0]
0x1401c6504: call   0x14006f560
0x1401c6509: jmp    0x1401c6614
0x1401c650e: lea    rdx,[rip+0x143d513]        # 0x141603a28  'Request workers from '
0x1401c6515: jmp    0x1401c6608
0x1401c651a: lea    rdx,[rip+0x1427dff]        # 0x1415ee320  'Rescue '
0x1401c6521: lea    rcx,[rbp+0xcf0]
0x1401c6528: call   0x14006f580
0x1401c652d: lea    rcx,[rbp+0x740]
0x1401c6534: call   0x140072080
0x1401c6539: mov    r8,QWORD PTR [r13+0x130]
0x1401c6540: mov    eax,0x1
0x1401c6545: mov    WORD PTR [rsp+0x28],ax
0x1401c654a: mov    WORD PTR [rsp+0x20],ax
0x1401c654f: lea    r9,[rbp+0x740]
0x1401c6556: mov    r8d,DWORD PTR [r8]
0x1401c6559: lea    rdx,[rbp+0xcf0]
0x1401c6560: lea    rcx,[rip+0x2333751]        # 0x1424f9cb8
0x1401c6567: call   0x140b92f10
0x1401c656c: jmp    0x1401c662e
0x1401c6571: lea    rdx,[rip+0x143d838]        # 0x141603db0  'Recover '
0x1401c6578: lea    rcx,[rbp+0xcf0]
0x1401c657f: call   0x14006f580
0x1401c6584: mov    r8,QWORD PTR [r13+0x130]
0x1401c658b: xor    r9d,r9d
0x1401c658e: mov    r8d,DWORD PTR [r8]
0x1401c6591: lea    rdx,[rbp+0xcf0]
0x1401c6598: lea    rcx,[rip+0x2333719]        # 0x1424f9cb8
0x1401c659f: call   0x140b94400
0x1401c65a4: jmp    0x1401c662e
0x1401c65a9: mov    rax,QWORD PTR [r13+0x130]
0x1401c65b0: movsxd rcx,DWORD PTR [rax]
0x1401c65b3: cmp    ecx,0x6
0x1401c65b6: ja     0x1401c6601
0x1401c65b8: lea    rdx,[rip+0xffffffffffe39a41]        # 0x140000000
0x1401c65bf: mov    ecx,DWORD PTR [rdx+rcx*4+0x1d3858]
0x1401c65c6: add    rcx,rdx
0x1401c65c9: jmp    rcx
0x1401c65cb: lea    rdx,[rip+0x143d46e]        # 0x141603a40  'Explore '
0x1401c65d2: jmp    0x1401c6608
0x1401c65d4: lea    rdx,[rip+0x143d475]        # 0x141603a50  'Pillage '
0x1401c65db: jmp    0x1401c6608
0x1401c65dd: lea    rdx,[rip+0x143d47c]        # 0x141603a60  'Demand tribute from '
0x1401c65e4: jmp    0x1401c6608
0x1401c65e6: lea    rdx,[rip+0x143d48b]        # 0x141603a78  'Raze '
0x1401c65ed: jmp    0x1401c6608
0x1401c65ef: lea    rdx,[rip+0x143d79a]        # 0x141603d90  'Take over '
0x1401c65f6: jmp    0x1401c6608
0x1401c65f8: lea    rdx,[rip+0x143d79d]        # 0x141603d9c  'Seize '
0x1401c65ff: jmp    0x1401c6608
0x1401c6601: lea    rdx,[rip+0x143d79c]        # 0x141603da4  'Raid '
0x1401c6608: lea    rcx,[rbp+0xcf0]
0x1401c660f: call   0x14006f580
0x1401c6614: xor    r9d,r9d
0x1401c6617: mov    r8d,DWORD PTR [r13+0x8]
0x1401c661b: lea    rdx,[rbp+0xcf0]
0x1401c6622: lea    rcx,[rip+0x233368f]        # 0x1424f9cb8
0x1401c6629: call   0x140b93930
0x1401c662e: lea    edx,[r12+0x1]
0x1401c6633: mov    r8d,r15d
0x1401c6636: lea    rcx,[rip+0x2483db3]        # 0x14264a3f0
0x1401c663d: call   0x1400bb120
0x1401c6642: mov    ebx,r14d
0x1401c6645: sub    ebx,r15d
0x1401c6648: lea    rcx,[rbp+0xcf0]
0x1401c664f: call   0x14006f330
0x1401c6654: lea    ecx,[rbx-0x2]
0x1401c6657: movsxd rdx,ecx
0x1401c665a: cmp    rax,rdx
0x1401c665d: jb     0x1401c66c1
0x1401c665f: lea    edi,[rbx-0x3]
0x1401c6662: test   edi,edi
0x1401c6664: js     0x1401c667c
0x1401c6666: movsxd rdx,ebx
0x1401c6669: sub    rdx,0x3
0x1401c666d: xor    r8d,r8d
0x1401c6670: lea    rcx,[rbp+0xcf0]
0x1401c6677: call   0x1400e1230
0x1401c667c: cmp    edi,0x3
0x1401c667f: jle    0x1401c66c1
0x1401c6681: movsxd rdx,ebx
0x1401c6684: sub    rdx,0x6
0x1401c6688: lea    rcx,[rbp+0xcf0]
0x1401c668f: call   0x1400fb540
0x1401c6694: mov    BYTE PTR [rax],0x2e
0x1401c6697: lea    eax,[rbx-0x5]
0x1401c669a: movsxd rdx,eax
0x1401c669d: lea    rcx,[rbp+0xcf0]
0x1401c66a4: call   0x1400fb540
0x1401c66a9: mov    BYTE PTR [rax],0x2e
0x1401c66ac: lea    eax,[rbx-0x4]
0x1401c66af: movsxd rdx,eax
0x1401c66b2: lea    rcx,[rbp+0xcf0]
0x1401c66b9: call   0x1400fb540
0x1401c66be: mov    BYTE PTR [rax],0x2e
0x1401c66c1: xor    r9d,r9d
0x1401c66c4: xor    r8d,r8d
0x1401c66c7: lea    rdx,[rbp+0xcf0]
0x1401c66ce: lea    rcx,[rip+0x2483d1b]        # 0x14264a3f0
0x1401c66d5: call   0x140ad9960
0x1401c66da: mov    rcx,r13
0x1401c66dd: call   0x140075110
0x1401c66e2: cmp    eax,0x13
0x1401c66e5: je     0x1401c6806
0x1401c66eb: cmp    eax,0x19
0x1401c66ee: je     0x1401c6806
0x1401c66f4: xor    eax,eax
0x1401c66f6: mov    esi,eax
0x1401c66f8: mov    edi,eax
0x1401c66fa: lea    rdx,[rbp+0x80]
0x1401c6701: lea    rcx,[r13+0x80]
0x1401c6708: call   0x14006f240
0x1401c670d: lea    rdx,[rbp+0x110]
0x1401c6714: lea    rcx,[r13+0x80]
0x1401c671b: call   0x14006f230
0x1401c6720: lea    r8,[rbp+0x110]
0x1401c6727: lea    rdx,[rbp+0xc]
0x1401c672b: lea    rcx,[rbp+0x80]
0x1401c6732: call   0x14006ee20
0x1401c6737: xor    edx,edx
0x1401c6739: movzx  ecx,BYTE PTR [rax]
0x1401c673c: call   0x1400657b0
0x1401c6741: test   al,al
0x1401c6743: je     0x1401c692a
0x1401c6749: nop    DWORD PTR [rax+0x0]
0x1401c6750: lea    rcx,[rbp+0x80]
0x1401c6757: call   0x14006ee10
0x1401c675c: mov    edx,DWORD PTR [rax]
0x1401c675e: lea    rcx,[rip+0x231d05b]        # 0x1424e37c0
0x1401c6765: call   0x140075500
0x1401c676a: test   rax,rax
0x1401c676d: je     0x1401c67cc
0x1401c676f: lea    rbx,[rax+0xa0]
0x1401c6776: mov    rcx,rbx
0x1401c6779: call   0x14006ee50
0x1401c677e: test   rax,rax
0x1401c6781: je     0x1401c67cc
0x1401c6783: xor    edx,edx
0x1401c6785: mov    rcx,rbx
0x1401c6788: call   0x14006f220
0x1401c678d: mov    rdx,QWORD PTR [rax]
0x1401c6790: cmp    DWORD PTR [rdx],0xffffffff
0x1401c6793: je     0x1401c67cc
0x1401c6795: xor    edx,edx
0x1401c6797: mov    rcx,rbx
0x1401c679a: call   0x14006f220
0x1401c679f: mov    rdx,QWORD PTR [rax]
0x1401c67a2: mov    edx,DWORD PTR [rdx]
0x1401c67a4: lea    rcx,[rip+0x221e905]        # 0x1423e50b0
0x1401c67ab: call   0x1413cc4d0
0x1401c67b0: test   rax,rax
0x1401c67b3: je     0x1401c67ca
0x1401c67b5: mov    eax,DWORD PTR [rax+0x110]
0x1401c67bb: test   eax,0x102
0x1401c67c0: jne    0x1401c67ca
0x1401c67c2: test   eax,eax
0x1401c67c4: jns    0x1401c67ca
0x1401c67c6: inc    esi
0x1401c67c8: jmp    0x1401c67cc
0x1401c67ca: inc    edi
0x1401c67cc: lea    rcx,[rbp+0x80]
0x1401c67d3: call   0x14006f350
0x1401c67d8: lea    r8,[rbp+0x110]
0x1401c67df: lea    rdx,[rbp+0xc]
0x1401c67e3: lea    rcx,[rbp+0x80]
0x1401c67ea: call   0x14006ee20
0x1401c67ef: xor    edx,edx
0x1401c67f1: movzx  ecx,BYTE PTR [rax]
0x1401c67f4: call   0x1400657b0
0x1401c67f9: test   al,al
0x1401c67fb: jne    0x1401c6750
0x1401c6801: jmp    0x1401c6922
0x1401c6806: xor    eax,eax
0x1401c6808: mov    esi,eax
0x1401c680a: mov    edi,eax
0x1401c680c: lea    rdx,[rbp+0x88]
0x1401c6813: lea    rcx,[r13+0x98]
0x1401c681a: call   0x14006f240
0x1401c681f: lea    rdx,[rbp+0x120]
0x1401c6826: lea    rcx,[r13+0x98]
0x1401c682d: call   0x14006f230
0x1401c6832: lea    rcx,[r13+0xb0]
0x1401c6839: lea    rdx,[rbp+0x118]
0x1401c6840: call   0x14006f240
0x1401c6845: lea    r8,[rbp+0x120]
0x1401c684c: lea    rdx,[rbp+0xd]
0x1401c6850: lea    rcx,[rbp+0x88]
0x1401c6857: call   0x14006ee20
0x1401c685c: xor    edx,edx
0x1401c685e: movzx  ecx,BYTE PTR [rax]
0x1401c6861: call   0x1400657b0
0x1401c6866: test   al,al
0x1401c6868: je     0x1401c692a
0x1401c686e: xchg   ax,ax
0x1401c6870: lea    rcx,[rbp+0x88]
0x1401c6877: call   0x14006ee10
0x1401c687c: mov    edx,DWORD PTR [rax]
0x1401c687e: lea    rcx,[rip+0x220af73]        # 0x1423d17f8
0x1401c6885: call   0x14007daf0
0x1401c688a: mov    rbx,rax
0x1401c688d: test   rax,rax
0x1401c6890: je     0x1401c68e1
0x1401c6892: lea    rcx,[rbp+0x118]
0x1401c6899: call   0x14006ee10
0x1401c689e: lea    rdx,[rbx+0x1110]
0x1401c68a5: mov    ecx,DWORD PTR [rax]
0x1401c68a7: call   0x1400b9dc0
0x1401c68ac: test   rax,rax
0x1401c68af: je     0x1401c68e1
0x1401c68b1: mov    edx,DWORD PTR [rax+0x4]
0x1401c68b4: cmp    edx,0xffffffff
0x1401c68b7: je     0x1401c68e1
0x1401c68b9: lea    rcx,[rip+0x221e7f0]        # 0x1423e50b0
0x1401c68c0: call   0x1413cc4d0
0x1401c68c5: test   rax,rax
0x1401c68c8: je     0x1401c68df
0x1401c68ca: mov    eax,DWORD PTR [rax+0x110]
0x1401c68d0: test   eax,0x102
0x1401c68d5: jne    0x1401c68df
0x1401c68d7: test   eax,eax
0x1401c68d9: jns    0x1401c68df
0x1401c68db: inc    esi
0x1401c68dd: jmp    0x1401c68e1
0x1401c68df: inc    edi
0x1401c68e1: lea    rcx,[rbp+0x88]
0x1401c68e8: call   0x14006f350
0x1401c68ed: lea    rcx,[rbp+0x118]
0x1401c68f4: call   0x14006f350
0x1401c68f9: lea    r8,[rbp+0x120]
0x1401c6900: lea    rdx,[rbp+0xd]
0x1401c6904: lea    rcx,[rbp+0x88]
0x1401c690b: call   0x14006ee20
0x1401c6910: xor    edx,edx
0x1401c6912: movzx  ecx,BYTE PTR [rax]
0x1401c6915: call   0x1400657b0
0x1401c691a: test   al,al
0x1401c691c: jne    0x1401c6870
0x1401c6922: test   edi,edi
0x1401c6924: je     0x1401c692a
0x1401c6926: test   esi,esi
0x1401c6928: jle    0x1401c6981
0x1401c692a: lea    rbx,[rip+0x248eacf]        # 0x142655400
0x1401c6931: mov    edi,r12d
0x1401c6934: mov    esi,0x3
0x1401c6939: nop    DWORD PTR [rax+0x0]
0x1401c6940: mov    r8d,r14d
0x1401c6943: mov    edx,edi
0x1401c6945: lea    rcx,[rip+0x2483aa4]        # 0x14264a3f0
0x1401c694c: call   0x1400bb120
0x1401c6951: xor    r8d,r8d
0x1401c6954: mov    edx,DWORD PTR [rbx]
0x1401c6956: lea    rcx,[rip+0x2483a93]        # 0x14264a3f0
0x1401c695d: call   0x140adb100
0x1401c6962: inc    edi
0x1401c6964: add    rbx,0x4
0x1401c6968: sub    rsi,0x1
0x1401c696c: jne    0x1401c6940
0x1401c696e: inc    r14d
0x1401c6971: lea    rax,[rip+0x248eaac]        # 0x142655424
0x1401c6978: cmp    rbx,rax
0x1401c697b: jl     0x1401c6931
0x1401c697d: mov    r14d,DWORD PTR [rbp-0x10]
0x1401c6981: add    r12d,0x3
0x1401c6985: mov    DWORD PTR [rsp+0x70],r12d
0x1401c698a: lea    rcx,[rbp+0xcf0]
0x1401c6991: call   0x140067e30
0x1401c6996: mov    eax,DWORD PTR [rbp-0x70]
0x1401c6999: inc    eax
0x1401c699b: mov    DWORD PTR [rbp-0x70],eax
0x1401c699e: cmp    eax,DWORD PTR [rbp-0x20]
0x1401c69a1: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401c69a4: mov    rsi,QWORD PTR [rbp-0x30]
0x1401c69a8: jl     0x1401c6350
0x1401c69ae: mov    r13d,DWORD PTR [rbp-0x48]
0x1401c69b2: mov    edi,DWORD PTR [rsp+0x74]
0x1401c69b6: cmp    esi,edi
0x1401c69b8: jle    0x1401c6a3e
0x1401c69be: lea    ebx,[rdi*2-0x1]
0x1401c69c5: add    ebx,edi
0x1401c69c7: lea    rcx,[rbp+0x210]
0x1401c69ce: call   0x1400bb360
0x1401c69d3: lea    r9d,[rsi-0x1]
0x1401c69d7: mov    DWORD PTR [rsp+0x30],ebx
0x1401c69db: mov    esi,0x2
0x1401c69e0: mov    DWORD PTR [rsp+0x28],esi
0x1401c69e4: mov    DWORD PTR [rsp+0x20],edi
0x1401c69e8: xor    r8d,r8d
0x1401c69eb: mov    rbx,QWORD PTR [rsp+0x78]
0x1401c69f0: mov    edx,DWORD PTR [rbx+0x2e0]
0x1401c69f6: lea    rcx,[rbp+0x210]
0x1401c69fd: call   0x1400bb380
0x1401c6a02: mov    r9d,DWORD PTR [rbp-0x6c]
0x1401c6a06: inc    r9d
0x1401c6a09: mov    DWORD PTR [rsp+0x28],0x0
0x1401c6a11: movzx  eax,BYTE PTR [rbx+0x2dc]
0x1401c6a18: mov    BYTE PTR [rsp+0x20],al
0x1401c6a1c: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401c6a20: mov    edx,DWORD PTR [rbp-0x38]
0x1401c6a23: lea    rcx,[rbp+0x210]
0x1401c6a2a: call   0x14140f4d0
0x1401c6a2f: jmp    0x1401c6a43
0x1401c6a31: mov    r13d,DWORD PTR [rbp-0x20]
0x1401c6a35: mov    DWORD PTR [rbp-0x48],r13d
0x1401c6a39: jmp    0x1401c69b6
0x1401c6a3e: mov    esi,0x2
0x1401c6a43: mov    rbx,QWORD PTR [rbp-0x60]
0x1401c6a47: test   rbx,rbx
0x1401c6a4a: jne    0x1401c6a78
0x1401c6a4c: mov    r13,QWORD PTR [rsp+0x78]
0x1401c6a51: cmp    QWORD PTR [r13+0x2d0],rbx
0x1401c6a58: je     0x1401c6068
0x1401c6a5e: mov    QWORD PTR [r13+0x2d0],rbx
0x1401c6a65: mov    edx,esi
0x1401c6a67: lea    rcx,[rip+0x2483982]        # 0x14264a3f0
0x1401c6a6e: call   0x140ae7c00
0x1401c6a73: jmp    0x1401c6068
0x1401c6a78: mov    eax,DWORD PTR [rbp-0x58]
0x1401c6a7b: lea    esi,[rax-0x37]
0x1401c6a7e: lea    edi,[rax-0x2]
0x1401c6a81: lea    r12d,[r13+0xb]
0x1401c6a85: mov    DWORD PTR [rsp+0x70],r12d
0x1401c6a8a: mov    r15d,r13d
0x1401c6a8d: cmp    r13d,r12d
0x1401c6a90: jg     0x1401c6b79
0x1401c6a96: movsxd r14,r13d
0x1401c6a99: nop    DWORD PTR [rax+0x0]
0x1401c6aa0: mov    ebx,esi
0x1401c6aa2: cmp    esi,edi
0x1401c6aa4: jg     0x1401c6b66
0x1401c6aaa: movsxd r13,r13d
0x1401c6aad: movsxd r12,r12d
0x1401c6ab0: mov    r8d,ebx
0x1401c6ab3: mov    edx,r15d
0x1401c6ab6: lea    rcx,[rip+0x2483933]        # 0x14264a3f0
0x1401c6abd: call   0x1400bb120
0x1401c6ac2: xor    r8d,r8d
0x1401c6ac5: xor    edx,edx
0x1401c6ac7: lea    rcx,[rip+0x2483922]        # 0x14264a3f0
0x1401c6ace: call   0x1400bb190
0x1401c6ad3: cmp    r14,r13
0x1401c6ad6: jne    0x1401c6aff
0x1401c6ad8: cmp    ebx,esi
0x1401c6ada: jne    0x1401c6ae4
0x1401c6adc: mov    edx,DWORD PTR [rip+0x2485232]        # 0x14264bd14
0x1401c6ae2: jmp    0x1401c6b47
0x1401c6ae4: lea    rcx,[rip+0x2483905]        # 0x14264a3f0
0x1401c6aeb: cmp    ebx,edi
0x1401c6aed: jne    0x1401c6af7
0x1401c6aef: mov    edx,DWORD PTR [rip+0x2485237]        # 0x14264bd2c
0x1401c6af5: jmp    0x1401c6b4e
0x1401c6af7: mov    edx,DWORD PTR [rip+0x2485223]        # 0x14264bd20
0x1401c6afd: jmp    0x1401c6b4e
0x1401c6aff: cmp    r14,r12
0x1401c6b02: jne    0x1401c6b2b
0x1401c6b04: cmp    ebx,esi
0x1401c6b06: jne    0x1401c6b10
0x1401c6b08: mov    edx,DWORD PTR [rip+0x248520e]        # 0x14264bd1c
0x1401c6b0e: jmp    0x1401c6b47
0x1401c6b10: lea    rcx,[rip+0x24838d9]        # 0x14264a3f0
0x1401c6b17: cmp    ebx,edi
0x1401c6b19: jne    0x1401c6b23
0x1401c6b1b: mov    edx,DWORD PTR [rip+0x2485213]        # 0x14264bd34
0x1401c6b21: jmp    0x1401c6b4e
0x1401c6b23: mov    edx,DWORD PTR [rip+0x24851ff]        # 0x14264bd28
0x1401c6b29: jmp    0x1401c6b4e
0x1401c6b2b: cmp    ebx,esi
0x1401c6b2d: jne    0x1401c6b37
0x1401c6b2f: mov    edx,DWORD PTR [rip+0x24851e3]        # 0x14264bd18
0x1401c6b35: jmp    0x1401c6b47
0x1401c6b37: cmp    ebx,edi
0x1401c6b39: mov    edx,DWORD PTR [rip+0x24851f1]        # 0x14264bd30
0x1401c6b3f: je     0x1401c6b47
0x1401c6b41: mov    edx,DWORD PTR [rip+0x24851dd]        # 0x14264bd24
0x1401c6b47: lea    rcx,[rip+0x24838a2]        # 0x14264a3f0
0x1401c6b4e: call   0x140adaad0
0x1401c6b53: inc    ebx
0x1401c6b55: cmp    ebx,edi
0x1401c6b57: jle    0x1401c6ab0
0x1401c6b5d: mov    r12d,DWORD PTR [rsp+0x70]
0x1401c6b62: mov    r13d,DWORD PTR [rbp-0x48]
0x1401c6b66: inc    r15d
0x1401c6b69: inc    r14
0x1401c6b6c: cmp    r15d,r12d
0x1401c6b6f: jle    0x1401c6aa0
0x1401c6b75: mov    rbx,QWORD PTR [rbp-0x60]
0x1401c6b79: lea    r15d,[rsi+0x2]
0x1401c6b7d: lea    edi,[r13+0x1]
0x1401c6b81: mov    rcx,rbx
0x1401c6b84: call   0x140075110
0x1401c6b89: cmp    eax,0x13
0x1401c6b8c: je     0x1401c6ffa
0x1401c6b92: cmp    eax,0x19
0x1401c6b95: je     0x1401c6ffa
0x1401c6b9b: xor    eax,eax
0x1401c6b9d: mov    esi,eax
0x1401c6b9f: mov    r14d,eax
0x1401c6ba2: lea    rdx,[rbp+0x90]
0x1401c6ba9: lea    rcx,[rbx+0x80]
0x1401c6bb0: call   0x14006f240
0x1401c6bb5: lea    rdx,[rbp+0x128]
0x1401c6bbc: lea    rcx,[rbx+0x80]
0x1401c6bc3: call   0x14006f230
0x1401c6bc8: lea    r8,[rbp+0x128]
0x1401c6bcf: lea    rdx,[rbp+0xe]
0x1401c6bd3: lea    rcx,[rbp+0x90]
0x1401c6bda: call   0x14006ee20
0x1401c6bdf: xor    edx,edx
0x1401c6be1: movzx  ecx,BYTE PTR [rax]
0x1401c6be4: call   0x1400657b0
0x1401c6be9: test   al,al
0x1401c6beb: je     0x1401c6ca3
0x1401c6bf1: lea    rcx,[rbp+0x90]
0x1401c6bf8: call   0x14006ee10
0x1401c6bfd: mov    edx,DWORD PTR [rax]
0x1401c6bff: lea    rcx,[rip+0x231cbba]        # 0x1424e37c0
0x1401c6c06: call   0x140075500
0x1401c6c0b: test   rax,rax
0x1401c6c0e: je     0x1401c6c6e
0x1401c6c10: lea    rbx,[rax+0xa0]
0x1401c6c17: mov    rcx,rbx
0x1401c6c1a: call   0x14006ee50
0x1401c6c1f: test   rax,rax
0x1401c6c22: je     0x1401c6c6e
0x1401c6c24: xor    edx,edx
0x1401c6c26: mov    rcx,rbx
0x1401c6c29: call   0x14006f220
0x1401c6c2e: mov    rdx,QWORD PTR [rax]
0x1401c6c31: cmp    DWORD PTR [rdx],0xffffffff
0x1401c6c34: je     0x1401c6c6e
0x1401c6c36: xor    edx,edx
0x1401c6c38: mov    rcx,rbx
0x1401c6c3b: call   0x14006f220
0x1401c6c40: mov    rdx,QWORD PTR [rax]
0x1401c6c43: mov    edx,DWORD PTR [rdx]
0x1401c6c45: lea    rcx,[rip+0x221e464]        # 0x1423e50b0
0x1401c6c4c: call   0x1413cc4d0
0x1401c6c51: test   rax,rax
0x1401c6c54: je     0x1401c6c6b
0x1401c6c56: mov    eax,DWORD PTR [rax+0x110]
0x1401c6c5c: test   eax,0x102
0x1401c6c61: jne    0x1401c6c6b
0x1401c6c63: test   eax,eax
0x1401c6c65: jns    0x1401c6c6b
0x1401c6c67: inc    esi
0x1401c6c69: jmp    0x1401c6c6e
0x1401c6c6b: inc    r14d
0x1401c6c6e: lea    rcx,[rbp+0x90]
0x1401c6c75: call   0x14006f350
0x1401c6c7a: lea    r8,[rbp+0x128]
0x1401c6c81: lea    rdx,[rbp+0xe]
0x1401c6c85: lea    rcx,[rbp+0x90]
0x1401c6c8c: call   0x14006ee20
0x1401c6c91: xor    edx,edx
0x1401c6c93: movzx  ecx,BYTE PTR [rax]
0x1401c6c96: call   0x1400657b0
0x1401c6c9b: test   al,al
0x1401c6c9d: jne    0x1401c6bf1
0x1401c6ca3: mov    r8d,r15d
0x1401c6ca6: mov    edx,edi
0x1401c6ca8: lea    rcx,[rip+0x2483741]        # 0x14264a3f0
0x1401c6caf: call   0x1400bb120
0x1401c6cb4: lea    eax,[r14+rsi*1]
0x1401c6cb8: test   eax,eax
0x1401c6cba: jne    0x1401c6d14
0x1401c6cbc: xor    r8d,r8d
0x1401c6cbf: mov    edx,0x7
0x1401c6cc4: xor    r9d,r9d
0x1401c6cc7: lea    rcx,[rip+0x2483722]        # 0x14264a3f0
0x1401c6cce: call   0x1400bb130
0x1401c6cd3: lea    rdx,[rip+0x143d126]        # 0x141603e00  'No commanders'
0x1401c6cda: lea    rcx,[rbp+0x1e70]
0x1401c6ce1: call   0x140068150
0x1401c6ce6: nop
0x1401c6ce7: xor    r9d,r9d
0x1401c6cea: xor    r8d,r8d
0x1401c6ced: lea    rdx,[rbp+0x1e70]
0x1401c6cf4: lea    rcx,[rip+0x24836f5]        # 0x14264a3f0
0x1401c6cfb: call   0x140ad9960
0x1401c6d00: nop
0x1401c6d01: lea    rcx,[rbp+0x1e70]
0x1401c6d08: call   0x140067e30
0x1401c6d0d: inc    edi
0x1401c6d0f: jmp    0x1401c6e72
0x1401c6d14: lea    rcx,[rbp+0xd70]
0x1401c6d1b: call   0x14006f690
0x1401c6d20: nop
0x1401c6d21: test   esi,esi
0x1401c6d23: jne    0x1401c6d4d
0x1401c6d25: lea    rdx,[rip+0x143d0a4]        # 0x141603dd0  'no'
0x1401c6d2c: lea    rcx,[rbp+0xd70]
0x1401c6d33: call   0x14006f560
0x1401c6d38: lea    rdx,[rip+0x143d0d1]        # 0x141603e10  ' commander'
0x1401c6d3f: lea    rcx,[rbp+0xd70]
0x1401c6d46: call   0x14006f560
0x1401c6d4b: jmp    0x1401c6d73
0x1401c6d4d: lea    rdx,[rbp+0xd70]
0x1401c6d54: mov    ecx,esi
0x1401c6d56: call   0x14052c130
0x1401c6d5b: lea    rdx,[rip+0x143d0ae]        # 0x141603e10  ' commander'
0x1401c6d62: lea    rcx,[rbp+0xd70]
0x1401c6d69: call   0x14006f560
0x1401c6d6e: cmp    esi,0x1
0x1401c6d71: je     0x1401c6d86
0x1401c6d73: lea    rdx,[rip+0x142251e]        # 0x1415e9298  's'
0x1401c6d7a: lea    rcx,[rbp+0xd70]
0x1401c6d81: call   0x14006f560
0x1401c6d86: lea    rdx,[rip+0x143d057]        # 0x141603de4  ' here'
0x1401c6d8d: lea    rcx,[rbp+0xd70]
0x1401c6d94: call   0x14006f560
0x1401c6d99: lea    rdx,[rip+0x1422338]        # 0x1415e90d8  ', '
0x1401c6da0: lea    rcx,[rbp+0xd70]
0x1401c6da7: call   0x14006f560
0x1401c6dac: test   r14d,r14d
0x1401c6daf: jne    0x1401c6dd9
0x1401c6db1: lea    rdx,[rip+0x143d018]        # 0x141603dd0  'no'
0x1401c6db8: lea    rcx,[rbp+0xd70]
0x1401c6dbf: call   0x14006f560
0x1401c6dc4: lea    rdx,[rip+0x143d045]        # 0x141603e10  ' commander'
0x1401c6dcb: lea    rcx,[rbp+0xd70]
0x1401c6dd2: call   0x14006f560
0x1401c6dd7: jmp    0x1401c6e01
0x1401c6dd9: lea    rdx,[rbp+0xd70]
0x1401c6de0: mov    ecx,r14d
0x1401c6de3: call   0x14052c130
0x1401c6de8: lea    rdx,[rip+0x143d021]        # 0x141603e10  ' commander'
0x1401c6def: lea    rcx,[rbp+0xd70]
0x1401c6df6: call   0x14006f560
0x1401c6dfb: cmp    r14d,0x1
0x1401c6dff: je     0x1401c6e14
0x1401c6e01: lea    rdx,[rip+0x1422490]        # 0x1415e9298  's'
0x1401c6e08: lea    rcx,[rbp+0xd70]
0x1401c6e0f: call   0x14006f560
0x1401c6e14: lea    rdx,[rip+0x143cfd5]        # 0x141603df0  ' traveling'
0x1401c6e1b: lea    rcx,[rbp+0xd70]
0x1401c6e22: call   0x14006f560
0x1401c6e27: lea    rcx,[rbp+0xd70]
0x1401c6e2e: call   0x14052d650
0x1401c6e33: xor    r8d,r8d
0x1401c6e36: mov    edx,0x7
0x1401c6e3b: mov    r9b,0x1
0x1401c6e3e: lea    rcx,[rip+0x24835ab]        # 0x14264a3f0
0x1401c6e45: call   0x1400bb130
0x1401c6e4a: xor    r9d,r9d
0x1401c6e4d: xor    r8d,r8d
0x1401c6e50: lea    rdx,[rbp+0xd70]
0x1401c6e57: lea    rcx,[rip+0x2483592]        # 0x14264a3f0
0x1401c6e5e: call   0x140ad9960
0x1401c6e63: nop
0x1401c6e64: lea    rcx,[rbp+0xd70]
0x1401c6e6b: call   0x140067e30
0x1401c6e70: inc    edi
0x1401c6e72: lea    eax,[r13+0x8]
0x1401c6e76: cmp    edi,eax
0x1401c6e78: jg     0x1401c74a6
0x1401c6e7e: mov    r12,QWORD PTR [rbp-0x60]
0x1401c6e82: sub    r12,0xffffffffffffff80
0x1401c6e86: data16 nop WORD PTR [rax+rax*1+0x0]
0x1401c6e90: movsxd rbx,DWORD PTR [rbp-0x78]
0x1401c6e94: mov    rcx,r12
0x1401c6e97: call   0x14006f370
0x1401c6e9c: cmp    rbx,rax
0x1401c6e9f: jae    0x1401c74a1
0x1401c6ea5: mov    rdx,rbx
0x1401c6ea8: mov    rcx,r12
0x1401c6eab: call   0x14006f360
0x1401c6eb0: mov    edx,DWORD PTR [rax]
0x1401c6eb2: lea    rcx,[rip+0x231c907]        # 0x1424e37c0
0x1401c6eb9: call   0x140075500
0x1401c6ebe: mov    rbx,rax
0x1401c6ec1: test   rax,rax
0x1401c6ec4: je     0x1401c6fe6
0x1401c6eca: xor    r8d,r8d
0x1401c6ecd: mov    edx,0x3
0x1401c6ed2: mov    r9b,0x1
0x1401c6ed5: lea    rcx,[rip+0x2483514]        # 0x14264a3f0
0x1401c6edc: call   0x1400bb130
0x1401c6ee1: mov    r8d,r15d
0x1401c6ee4: mov    edx,edi
0x1401c6ee6: lea    rcx,[rip+0x2483503]        # 0x14264a3f0
0x1401c6eed: call   0x1400bb120
0x1401c6ef2: lea    rcx,[rbp+0x1450]
0x1401c6ef9: call   0x14006f690
0x1401c6efe: nop
0x1401c6eff: lea    rcx,[rbx+0x80]
0x1401c6f06: call   0x14006f520
0x1401c6f0b: test   al,al
0x1401c6f0d: jne    0x1401c6f24
0x1401c6f0f: lea    rdx,[rbx+0x80]
0x1401c6f16: lea    rcx,[rbp+0x1450]
0x1401c6f1d: call   0x14006f5a0
0x1401c6f22: jmp    0x1401c6f3a
0x1401c6f24: lea    rcx,[rbx+0x8]
0x1401c6f28: xor    r9d,r9d
0x1401c6f2b: mov    r8b,0x1
0x1401c6f2e: lea    rdx,[rbp+0x1450]
0x1401c6f35: call   0x140a946e0
0x1401c6f3a: mov    r9d,0x18
0x1401c6f40: xor    r8d,r8d
0x1401c6f43: lea    rdx,[rbp+0x1450]
0x1401c6f4a: lea    rcx,[rip+0x248349f]        # 0x14264a3f0
0x1401c6f51: call   0x140ad9960
0x1401c6f56: inc    edi
0x1401c6f58: mov    r13d,DWORD PTR [rbp-0x48]
0x1401c6f5c: lea    eax,[r13+0x9]
0x1401c6f60: cmp    edi,eax
0x1401c6f62: jne    0x1401c6fda
0x1401c6f64: mov    rcx,r12
0x1401c6f67: call   0x14006f370
0x1401c6f6c: mov    rcx,QWORD PTR [rbp-0x78]
0x1401c6f70: inc    ecx
0x1401c6f72: cmp    ecx,eax
0x1401c6f74: jge    0x1401c6fda
0x1401c6f76: xor    r8d,r8d
0x1401c6f79: mov    edx,0x7
0x1401c6f7e: mov    r9b,0x1
0x1401c6f81: lea    rcx,[rip+0x2483468]        # 0x14264a3f0
0x1401c6f88: call   0x1400bb130
0x1401c6f8d: lea    r8d,[r15+0x19]
0x1401c6f91: mov    edx,edi
0x1401c6f93: lea    rcx,[rip+0x2483456]        # 0x14264a3f0
0x1401c6f9a: call   0x1400bb120
0x1401c6f9f: lea    rdx,[rip+0x143ce92]        # 0x141603e38  'and more...'
0x1401c6fa6: lea    rcx,[rbp+0x1e90]
0x1401c6fad: call   0x140068150
0x1401c6fb2: nop
0x1401c6fb3: xor    r9d,r9d
0x1401c6fb6: xor    r8d,r8d
0x1401c6fb9: lea    rdx,[rbp+0x1e90]
0x1401c6fc0: lea    rcx,[rip+0x2483429]        # 0x14264a3f0
0x1401c6fc7: call   0x140ad9960
0x1401c6fcc: nop
0x1401c6fcd: lea    rcx,[rbp+0x1e90]
0x1401c6fd4: call   0x140067e30
0x1401c6fd9: nop
0x1401c6fda: lea    rcx,[rbp+0x1450]
0x1401c6fe1: call   0x140067e30
0x1401c6fe6: inc    DWORD PTR [rbp-0x78]
0x1401c6fe9: lea    eax,[r13+0x8]
0x1401c6fed: cmp    edi,eax
0x1401c6fef: jle    0x1401c6e90
0x1401c6ff5: jmp    0x1401c74a1
0x1401c6ffa: xor    eax,eax
0x1401c6ffc: mov    esi,eax
0x1401c6ffe: mov    r14d,eax
0x1401c7001: lea    rdx,[rbp+0x70]
0x1401c7005: lea    rcx,[rbx+0x98]
0x1401c700c: call   0x14006f240
0x1401c7011: lea    rdx,[rbp+0x138]
0x1401c7018: lea    rcx,[rbx+0x98]
0x1401c701f: call   0x14006f230
0x1401c7024: mov    rbx,QWORD PTR [rbp-0x60]
0x1401c7028: lea    rcx,[rbx+0xb0]
0x1401c702f: lea    rdx,[rbp+0x130]
0x1401c7036: call   0x14006f240
0x1401c703b: lea    r8,[rbp+0x138]
0x1401c7042: lea    rdx,[rbp+0x7]
0x1401c7046: lea    rcx,[rbp+0x70]
0x1401c704a: call   0x14006ee20
0x1401c704f: xor    edx,edx
0x1401c7051: movzx  ecx,BYTE PTR [rax]
0x1401c7054: call   0x1400657b0
0x1401c7059: test   al,al
0x1401c705b: je     0x1401c710f
0x1401c7061: lea    rcx,[rbp+0x70]
0x1401c7065: call   0x14006ee10
0x1401c706a: mov    edx,DWORD PTR [rax]
0x1401c706c: lea    rcx,[rip+0x220a785]        # 0x1423d17f8
0x1401c7073: call   0x14007daf0
0x1401c7078: mov    rbx,rax
0x1401c707b: test   rax,rax
0x1401c707e: je     0x1401c70d0
0x1401c7080: lea    rcx,[rbp+0x130]
0x1401c7087: call   0x14006ee10
0x1401c708c: lea    rdx,[rbx+0x1110]
0x1401c7093: mov    ecx,DWORD PTR [rax]
0x1401c7095: call   0x1400b9dc0
0x1401c709a: test   rax,rax
0x1401c709d: je     0x1401c70d0
0x1401c709f: mov    edx,DWORD PTR [rax+0x4]
0x1401c70a2: cmp    edx,0xffffffff
0x1401c70a5: je     0x1401c70d0
0x1401c70a7: lea    rcx,[rip+0x221e002]        # 0x1423e50b0
0x1401c70ae: call   0x1413cc4d0
0x1401c70b3: test   rax,rax
0x1401c70b6: je     0x1401c70cd
0x1401c70b8: mov    eax,DWORD PTR [rax+0x110]
0x1401c70be: test   eax,0x102
0x1401c70c3: jne    0x1401c70cd
0x1401c70c5: test   eax,eax
0x1401c70c7: jns    0x1401c70cd
0x1401c70c9: inc    esi
0x1401c70cb: jmp    0x1401c70d0
0x1401c70cd: inc    r14d
0x1401c70d0: lea    rcx,[rbp+0x70]
0x1401c70d4: call   0x14006f350
0x1401c70d9: lea    rcx,[rbp+0x130]
0x1401c70e0: call   0x14006f350
0x1401c70e5: lea    r8,[rbp+0x138]
0x1401c70ec: lea    rdx,[rbp+0x7]
0x1401c70f0: lea    rcx,[rbp+0x70]
0x1401c70f4: call   0x14006ee20
0x1401c70f9: xor    edx,edx
0x1401c70fb: movzx  ecx,BYTE PTR [rax]
0x1401c70fe: call   0x1400657b0
0x1401c7103: test   al,al
0x1401c7105: jne    0x1401c7061
0x1401c710b: mov    rbx,QWORD PTR [rbp-0x60]
0x1401c710f: mov    r8d,r15d
0x1401c7112: mov    edx,edi
0x1401c7114: lea    rcx,[rip+0x24832d5]        # 0x14264a3f0
0x1401c711b: call   0x1400bb120
0x1401c7120: lea    eax,[r14+rsi*1]
0x1401c7124: test   eax,eax
0x1401c7126: jne    0x1401c7179
0x1401c7128: xor    r8d,r8d
0x1401c712b: mov    edx,0x7
0x1401c7130: xor    r9d,r9d
0x1401c7133: lea    rcx,[rip+0x24832b6]        # 0x14264a3f0
0x1401c713a: call   0x1400bb130
0x1401c713f: lea    rdx,[rip+0x143cc7a]        # 0x141603dc0  'No messengers'
0x1401c7146: lea    rcx,[rbp+0x1eb0]
0x1401c714d: call   0x140068150
0x1401c7152: nop
0x1401c7153: xor    r9d,r9d
0x1401c7156: xor    r8d,r8d
0x1401c7159: lea    rdx,[rbp+0x1eb0]
0x1401c7160: lea    rcx,[rip+0x2483289]        # 0x14264a3f0
0x1401c7167: call   0x140ad9960
0x1401c716c: nop
0x1401c716d: lea    rcx,[rbp+0x1eb0]
0x1401c7174: jmp    0x1401c72d0
0x1401c7179: lea    rcx,[rbp+0xd90]
0x1401c7180: call   0x14006f690
0x1401c7185: nop
0x1401c7186: test   esi,esi
0x1401c7188: jne    0x1401c71b2
0x1401c718a: lea    rdx,[rip+0x143cc3f]        # 0x141603dd0  'no'
0x1401c7191: lea    rcx,[rbp+0xd90]
0x1401c7198: call   0x14006f560
0x1401c719d: lea    rdx,[rip+0x143cc34]        # 0x141603dd8  ' messenger'
0x1401c71a4: lea    rcx,[rbp+0xd90]
0x1401c71ab: call   0x14006f560
0x1401c71b0: jmp    0x1401c71d8
0x1401c71b2: lea    rdx,[rbp+0xd90]
0x1401c71b9: mov    ecx,esi
0x1401c71bb: call   0x14052c130
0x1401c71c0: lea    rdx,[rip+0x143cc11]        # 0x141603dd8  ' messenger'
0x1401c71c7: lea    rcx,[rbp+0xd90]
0x1401c71ce: call   0x14006f560
0x1401c71d3: cmp    esi,0x1
0x1401c71d6: je     0x1401c71eb
0x1401c71d8: lea    rdx,[rip+0x14220b9]        # 0x1415e9298  's'
0x1401c71df: lea    rcx,[rbp+0xd90]
0x1401c71e6: call   0x14006f560
0x1401c71eb: lea    rdx,[rip+0x143cbf2]        # 0x141603de4  ' here'
0x1401c71f2: lea    rcx,[rbp+0xd90]
0x1401c71f9: call   0x14006f560
0x1401c71fe: lea    rdx,[rip+0x1421ed3]        # 0x1415e90d8  ', '
0x1401c7205: lea    rcx,[rbp+0xd90]
0x1401c720c: call   0x14006f560
0x1401c7211: test   r14d,r14d
0x1401c7214: jne    0x1401c723e
0x1401c7216: lea    rdx,[rip+0x143cbb3]        # 0x141603dd0  'no'
0x1401c721d: lea    rcx,[rbp+0xd90]
0x1401c7224: call   0x14006f560
0x1401c7229: lea    rdx,[rip+0x143cba8]        # 0x141603dd8  ' messenger'
0x1401c7230: lea    rcx,[rbp+0xd90]
0x1401c7237: call   0x14006f560
0x1401c723c: jmp    0x1401c7266
0x1401c723e: lea    rdx,[rbp+0xd90]
0x1401c7245: mov    ecx,r14d
0x1401c7248: call   0x14052c130
0x1401c724d: lea    rdx,[rip+0x143cb84]        # 0x141603dd8  ' messenger'
0x1401c7254: lea    rcx,[rbp+0xd90]
0x1401c725b: call   0x14006f560
0x1401c7260: cmp    r14d,0x1
0x1401c7264: je     0x1401c7279
0x1401c7266: lea    rdx,[rip+0x142202b]        # 0x1415e9298  's'
0x1401c726d: lea    rcx,[rbp+0xd90]
0x1401c7274: call   0x14006f560
0x1401c7279: lea    rdx,[rip+0x143cb70]        # 0x141603df0  ' traveling'
0x1401c7280: lea    rcx,[rbp+0xd90]
0x1401c7287: call   0x14006f560
0x1401c728c: lea    rcx,[rbp+0xd90]
0x1401c7293: call   0x14052d650
0x1401c7298: xor    r8d,r8d
0x1401c729b: mov    edx,0x7
0x1401c72a0: mov    r9b,0x1
0x1401c72a3: lea    rcx,[rip+0x2483146]        # 0x14264a3f0
0x1401c72aa: call   0x1400bb130
0x1401c72af: xor    r9d,r9d
0x1401c72b2: xor    r8d,r8d
0x1401c72b5: lea    rdx,[rbp+0xd90]
0x1401c72bc: lea    rcx,[rip+0x248312d]        # 0x14264a3f0
0x1401c72c3: call   0x140ad9960
0x1401c72c8: nop
0x1401c72c9: lea    rcx,[rbp+0xd90]
0x1401c72d0: call   0x140067e30
0x1401c72d5: inc    edi
0x1401c72d7: lea    eax,[r13+0x8]
0x1401c72db: cmp    edi,eax
0x1401c72dd: jg     0x1401c74a6
0x1401c72e3: lea    r12,[rbx+0x98]
0x1401c72ea: mov    DWORD PTR [rsp+0x74],esi
0x1401c72ee: mov    DWORD PTR [rbp-0x68],r14d
0x1401c72f2: mov    esi,eax
0x1401c72f4: mov    r14d,DWORD PTR [rbp-0x48]
0x1401c72f8: xor    eax,eax
0x1401c72fa: nop    WORD PTR [rax+rax*1+0x0]
0x1401c7300: movsxd rbx,eax
0x1401c7303: mov    rcx,r12
0x1401c7306: call   0x14006f370
0x1401c730b: cmp    rbx,rax
0x1401c730e: jae    0x1401c7499
0x1401c7314: mov    rdx,rbx
0x1401c7317: mov    rcx,r12
0x1401c731a: call   0x14006f360
0x1401c731f: mov    edx,DWORD PTR [rax]
0x1401c7321: lea    rcx,[rip+0x220a4d0]        # 0x1423d17f8
0x1401c7328: call   0x14007daf0
0x1401c732d: mov    r13,rax
0x1401c7330: test   rax,rax
0x1401c7333: je     0x1401c7487
0x1401c7339: mov    rcx,QWORD PTR [rbp-0x60]
0x1401c733d: add    rcx,0xb0
0x1401c7344: mov    rdx,rbx
0x1401c7347: call   0x14006f360
0x1401c734c: lea    rdx,[r13+0x1110]
0x1401c7353: mov    ecx,DWORD PTR [rax]
0x1401c7355: call   0x1400b9dc0
0x1401c735a: mov    rbx,rax
0x1401c735d: test   rax,rax
0x1401c7360: je     0x1401c7487
0x1401c7366: xor    r8d,r8d
0x1401c7369: mov    edx,0x3
0x1401c736e: mov    r9b,0x1
0x1401c7371: lea    rcx,[rip+0x2483078]        # 0x14264a3f0
0x1401c7378: call   0x1400bb130
0x1401c737d: mov    r8d,r15d
0x1401c7380: mov    edx,edi
0x1401c7382: lea    rcx,[rip+0x2483067]        # 0x14264a3f0
0x1401c7389: call   0x1400bb120
0x1401c738e: lea    rcx,[rbp+0x1470]
0x1401c7395: call   0x14006f690
0x1401c739a: nop
0x1401c739b: mov    edx,DWORD PTR [rbx+0x4]
0x1401c739e: cmp    edx,0xffffffff
0x1401c73a1: je     0x1401c73cc
0x1401c73a3: lea    rcx,[rip+0x233290e]        # 0x1424f9cb8
0x1401c73aa: call   0x140067dc0
0x1401c73af: test   rax,rax
0x1401c73b2: je     0x1401c73df
0x1401c73b4: lea    rcx,[rax+0x38]
0x1401c73b8: xor    r9d,r9d
0x1401c73bb: mov    r8b,0x1
0x1401c73be: lea    rdx,[rbp+0x1470]
0x1401c73c5: call   0x140a946e0
0x1401c73ca: jmp    0x1401c73df
0x1401c73cc: lea    rdx,[rip+0x143ca4d]        # 0x141603e20  'Messenger (unfilled)'
0x1401c73d3: lea    rcx,[rbp+0x1470]
0x1401c73da: call   0x14006f580
0x1401c73df: mov    r9d,0x18
0x1401c73e5: xor    r8d,r8d
0x1401c73e8: lea    rdx,[rbp+0x1470]
0x1401c73ef: lea    rcx,[rip+0x2482ffa]        # 0x14264a3f0
0x1401c73f6: call   0x140ad9960
0x1401c73fb: inc    edi
0x1401c73fd: lea    eax,[r14+0x9]
0x1401c7401: cmp    edi,eax
0x1401c7403: jne    0x1401c747b
0x1401c7405: mov    rcx,r12
0x1401c7408: call   0x14006f370
0x1401c740d: mov    rcx,QWORD PTR [rbp-0x78]
0x1401c7411: inc    ecx
0x1401c7413: cmp    ecx,eax
0x1401c7415: jge    0x1401c747b
0x1401c7417: xor    r8d,r8d
0x1401c741a: mov    edx,0x7
0x1401c741f: mov    r9b,0x1
0x1401c7422: lea    rcx,[rip+0x2482fc7]        # 0x14264a3f0
0x1401c7429: call   0x1400bb130
0x1401c742e: lea    r8d,[r15+0x19]
0x1401c7432: mov    edx,edi
0x1401c7434: lea    rcx,[rip+0x2482fb5]        # 0x14264a3f0
0x1401c743b: call   0x1400bb120
0x1401c7440: lea    rdx,[rip+0x143c9f1]        # 0x141603e38  'and more...'
0x1401c7447: lea    rcx,[rbp+0x1ed0]
0x1401c744e: call   0x140068150
0x1401c7453: nop
0x1401c7454: xor    r9d,r9d
0x1401c7457: xor    r8d,r8d
0x1401c745a: lea    rdx,[rbp+0x1ed0]
0x1401c7461: lea    rcx,[rip+0x2482f88]        # 0x14264a3f0
0x1401c7468: call   0x140ad9960
0x1401c746d: nop
0x1401c746e: lea    rcx,[rbp+0x1ed0]
0x1401c7475: call   0x140067e30
0x1401c747a: nop
0x1401c747b: lea    rcx,[rbp+0x1470]
0x1401c7482: call   0x140067e30
0x1401c7487: mov    rax,QWORD PTR [rbp-0x78]
0x1401c748b: inc    eax
0x1401c748d: mov    QWORD PTR [rbp-0x78],rax
0x1401c7491: cmp    edi,esi
0x1401c7493: jle    0x1401c7300
0x1401c7499: mov    esi,DWORD PTR [rsp+0x74]
0x1401c749d: mov    r14d,DWORD PTR [rbp-0x68]
0x1401c74a1: mov    r12d,DWORD PTR [rsp+0x70]
0x1401c74a6: test   r14d,r14d
0x1401c74a9: je     0x1401c7514
0x1401c74ab: test   esi,esi
0x1401c74ad: jg     0x1401c7514
0x1401c74af: xor    r8d,r8d
0x1401c74b2: mov    edx,0x7
0x1401c74b7: xor    r9d,r9d
0x1401c74ba: lea    rcx,[rip+0x2482f2f]        # 0x14264a3f0
0x1401c74c1: call   0x1400bb130
0x1401c74c6: lea    edx,[r12-0x1]
0x1401c74cb: mov    r8d,r15d
0x1401c74ce: lea    rcx,[rip+0x2482f1b]        # 0x14264a3f0
0x1401c74d5: call   0x1400bb120
0x1401c74da: lea    rdx,[rip+0x143c98f]        # 0x141603e70  'This mission cannot be altered now.'
0x1401c74e1: lea    rcx,[rbp+0x1ef0]
0x1401c74e8: call   0x140068150
0x1401c74ed: nop
0x1401c74ee: xor    r9d,r9d
0x1401c74f1: xor    r8d,r8d
0x1401c74f4: lea    rdx,[rbp+0x1ef0]
0x1401c74fb: lea    rcx,[rip+0x2482eee]        # 0x14264a3f0
0x1401c7502: call   0x140ad9960
0x1401c7507: nop
0x1401c7508: lea    rcx,[rbp+0x1ef0]
0x1401c750f: jmp    0x1401c605e
0x1401c7514: xor    r8d,r8d
0x1401c7517: mov    edx,0x7
0x1401c751c: mov    r9b,0x1
0x1401c751f: lea    rcx,[rip+0x2482eca]        # 0x14264a3f0
0x1401c7526: call   0x1400bb130
0x1401c752b: lea    edx,[r12-0x1]
0x1401c7530: mov    r8d,r15d
0x1401c7533: lea    rcx,[rip+0x2482eb6]        # 0x14264a3f0
0x1401c753a: call   0x1400bb120
0x1401c753f: lea    rdx,[rip+0x143c902]        # 0x141603e48  'Click for assignments and details'
0x1401c7546: lea    rcx,[rbp+0x1f10]
0x1401c754d: call   0x140068150
0x1401c7552: nop
0x1401c7553: xor    r9d,r9d
0x1401c7556: xor    r8d,r8d
0x1401c7559: lea    rdx,[rbp+0x1f10]
0x1401c7560: lea    rcx,[rip+0x2482e89]        # 0x14264a3f0
0x1401c7567: call   0x140ad9960
0x1401c756c: nop
0x1401c756d: lea    rcx,[rbp+0x1f10]
0x1401c7574: jmp    0x1401c605e
0x1401c7579: mov    ecx,DWORD PTR [rbp-0x18]
0x1401c757c: mov    DWORD PTR [rsp+0x74],ecx
0x1401c7580: lea    r13d,[rcx-0x37]
0x1401c7584: lea    esi,[r13-0x2]
0x1401c7588: mov    DWORD PTR [rbp-0x20],esi
0x1401c758b: mov    edx,DWORD PTR [rip+0x22061f7]        # 0x1423cd788
0x1401c7591: dec    edx
0x1401c7593: mov    DWORD PTR [rbp-0x70],edx
0x1401c7596: lea    eax,[rcx-0xb]
0x1401c7599: mov    DWORD PTR [rsp+0x70],eax
0x1401c759d: lea    r12d,[rcx-0x1]
0x1401c75a1: mov    DWORD PTR [rbp-0x58],r12d
0x1401c75a5: mov    edi,ecx
0x1401c75a7: cmp    edx,0x2a
0x1401c75aa: jle    0x1401c75bb
0x1401c75ac: mov    edx,0x2a
0x1401c75b1: mov    DWORD PTR [rbp-0x70],edx
0x1401c75b4: xor    eax,eax
0x1401c75b6: mov    r15d,eax
0x1401c75b9: jmp    0x1401c75d0
0x1401c75bb: mov    DWORD PTR [rsp+0x70],eax
0x1401c75bf: mov    DWORD PTR [rbp-0x58],r12d
0x1401c75c3: xor    eax,eax
0x1401c75c5: mov    r15d,eax
0x1401c75c8: test   edx,edx
0x1401c75ca: js     0x1401c76a8
0x1401c75d0: mov    r14,rax
0x1401c75d3: mov    ebx,esi
0x1401c75d5: cmp    esi,edi
0x1401c75d7: jg     0x1401c7690
0x1401c75dd: movsxd r12,edx
0x1401c75e0: mov    r8d,ebx
0x1401c75e3: mov    edx,r15d
0x1401c75e6: lea    rcx,[rip+0x2482e03]        # 0x14264a3f0
0x1401c75ed: call   0x1400bb120
0x1401c75f2: xor    r8d,r8d
0x1401c75f5: xor    edx,edx
0x1401c75f7: lea    rcx,[rip+0x2482df2]        # 0x14264a3f0
0x1401c75fe: call   0x1400bb190
0x1401c7603: test   r14,r14
0x1401c7606: jne    0x1401c762f
0x1401c7608: cmp    ebx,esi
0x1401c760a: jne    0x1401c7614
0x1401c760c: mov    edx,DWORD PTR [rip+0x2484702]        # 0x14264bd14
0x1401c7612: jmp    0x1401c7677
0x1401c7614: lea    rcx,[rip+0x2482dd5]        # 0x14264a3f0
0x1401c761b: cmp    ebx,edi
0x1401c761d: jne    0x1401c7627
0x1401c761f: mov    edx,DWORD PTR [rip+0x2484707]        # 0x14264bd2c
0x1401c7625: jmp    0x1401c767e
0x1401c7627: mov    edx,DWORD PTR [rip+0x24846f3]        # 0x14264bd20
0x1401c762d: jmp    0x1401c767e
0x1401c762f: cmp    r14,r12
0x1401c7632: jne    0x1401c765b
0x1401c7634: cmp    ebx,esi
0x1401c7636: jne    0x1401c7640
0x1401c7638: mov    edx,DWORD PTR [rip+0x24846de]        # 0x14264bd1c
0x1401c763e: jmp    0x1401c7677
0x1401c7640: lea    rcx,[rip+0x2482da9]        # 0x14264a3f0
0x1401c7647: cmp    ebx,edi
0x1401c7649: jne    0x1401c7653
0x1401c764b: mov    edx,DWORD PTR [rip+0x24846e3]        # 0x14264bd34
0x1401c7651: jmp    0x1401c767e
0x1401c7653: mov    edx,DWORD PTR [rip+0x24846cf]        # 0x14264bd28
0x1401c7659: jmp    0x1401c767e
0x1401c765b: cmp    ebx,esi
0x1401c765d: jne    0x1401c7667
0x1401c765f: mov    edx,DWORD PTR [rip+0x24846b3]        # 0x14264bd18
0x1401c7665: jmp    0x1401c7677
0x1401c7667: cmp    ebx,edi
0x1401c7669: mov    edx,DWORD PTR [rip+0x24846c1]        # 0x14264bd30
0x1401c766f: je     0x1401c7677
0x1401c7671: mov    edx,DWORD PTR [rip+0x24846ad]        # 0x14264bd24
0x1401c7677: lea    rcx,[rip+0x2482d72]        # 0x14264a3f0
0x1401c767e: call   0x140adaad0
0x1401c7683: inc    ebx
0x1401c7685: cmp    ebx,edi
0x1401c7687: jle    0x1401c75e0
0x1401c768d: mov    edx,DWORD PTR [rbp-0x70]
0x1401c7690: inc    r15d
0x1401c7693: inc    r14
0x1401c7696: cmp    r15d,edx
0x1401c7699: jle    0x1401c75d3
0x1401c769f: mov    r12d,DWORD PTR [rbp-0x58]
0x1401c76a3: mov    ebx,0x2
0x1401c76a8: mov    r15,QWORD PTR [rsp+0x78]
0x1401c76ad: mov    rcx,QWORD PTR [r15+0x1d8]
0x1401c76b4: call   0x1410825c0
0x1401c76b9: mov    rdi,rax
0x1401c76bc: mov    rcx,QWORD PTR [r15+0x1d8]
0x1401c76c3: call   0x1409b4e70
0x1401c76c8: mov    r14,rax
0x1401c76cb: xor    r8d,r8d
0x1401c76ce: mov    edx,0x7
0x1401c76d3: mov    r9b,0x1
0x1401c76d6: lea    rcx,[rip+0x2482d13]        # 0x14264a3f0
0x1401c76dd: call   0x1400bb130
0x1401c76e2: lea    rcx,[rbp+0xf10]
0x1401c76e9: call   0x14006f690
0x1401c76ee: nop
0x1401c76ef: mov    r8,QWORD PTR [r15+0x1d8]
0x1401c76f6: xor    r9d,r9d
0x1401c76f9: mov    r8d,DWORD PTR [r8+0x88]
0x1401c7700: lea    rdx,[rbp+0xf10]
0x1401c7707: lea    rcx,[rip+0x23325aa]        # 0x1424f9cb8
0x1401c770e: call   0x140b93930
0x1401c7713: lea    rdx,[rip+0x14219be]        # 0x1415e90d8  ', '
0x1401c771a: lea    rcx,[rbp+0xf10]
0x1401c7721: call   0x14006f560
0x1401c7726: lea    rcx,[rbp+0x1410]
0x1401c772d: call   0x14006f690
0x1401c7732: nop
0x1401c7733: lea    rdx,[rbp+0x1410]
0x1401c773a: mov    rcx,QWORD PTR [r15+0x1d8]
0x1401c7741: call   0x1410cbe10
0x1401c7746: lea    rcx,[rbp+0x1410]
0x1401c774d: call   0x14006f520
0x1401c7752: test   al,al
0x1401c7754: jne    0x1401c7777
0x1401c7756: lea    rdx,[rbp+0x1410]
0x1401c775d: lea    rcx,[rbp+0xf10]
0x1401c7764: call   0x1400b9d10
0x1401c7769: mov    dl,0x20
0x1401c776b: lea    rcx,[rbp+0xf10]
0x1401c7772: call   0x1400b9d30
0x1401c7777: mov    rax,QWORD PTR [r15+0x1d8]
0x1401c777e: cmp    WORD PTR [rax+0x80],0xa
0x1401c7786: je     0x1401c77f0
0x1401c7788: test   rdi,rdi
0x1401c778b: je     0x1401c77f0
0x1401c778d: mov    eax,DWORD PTR [rdi+0x9c]
0x1401c7793: shr    eax,0xa
0x1401c7796: not    eax
0x1401c7798: test   al,0x1
0x1401c779a: je     0x1401c77f0
0x1401c779c: lea    rcx,[rbp+0x1550]
0x1401c77a3: call   0x14006f690
0x1401c77a8: nop
0x1401c77a9: mov    r8d,0xffffffff
0x1401c77af: lea    rdx,[rbp+0x1550]
0x1401c77b6: movzx  ecx,WORD PTR [rdi+0x98]
0x1401c77bd: call   0x140aa3770
0x1401c77c2: lea    rdx,[rbp+0x1550]
0x1401c77c9: lea    rcx,[rbp+0xf10]
0x1401c77d0: call   0x1400b9d10
0x1401c77d5: mov    dl,0x20
0x1401c77d7: lea    rcx,[rbp+0xf10]
0x1401c77de: call   0x1400b9d30
0x1401c77e3: nop
0x1401c77e4: lea    rcx,[rbp+0x1550]
0x1401c77eb: call   0x140067e30
0x1401c77f0: lea    rdx,[rbp+0x1410]
0x1401c77f7: mov    rcx,QWORD PTR [r15+0x1d8]
0x1401c77fe: call   0x1410cbe50
0x1401c7803: lea    rdx,[rbp+0x1410]
0x1401c780a: lea    rcx,[rbp+0xf10]
0x1401c7811: call   0x1400b9d10
0x1401c7816: lea    rcx,[rbp+0xf10]
0x1401c781d: call   0x14052d3c0
0x1401c7822: mov    r8d,r13d
0x1401c7825: mov    edx,0x1
0x1401c782a: lea    rcx,[rip+0x2482bbf]        # 0x14264a3f0
0x1401c7831: call   0x1400bb120
0x1401c7836: lea    rcx,[rbp+0xf10]
0x1401c783d: call   0x14006f330
0x1401c7842: xor    r9d,r9d
0x1401c7845: xor    r8d,r8d
0x1401c7848: lea    rdx,[rbp+0xf10]
0x1401c784f: lea    rcx,[rip+0x2482b9a]        # 0x14264a3f0
0x1401c7856: call   0x140ad9960
0x1401c785b: xor    r8d,r8d
0x1401c785e: mov    edx,0x7
0x1401c7863: mov    r9b,0x1
0x1401c7866: lea    rcx,[rip+0x2482b83]        # 0x14264a3f0
0x1401c786d: call   0x1400bb130
0x1401c7872: mov    r8d,r13d
0x1401c7875: mov    edx,ebx
0x1401c7877: lea    rcx,[rip+0x2482b72]        # 0x14264a3f0
0x1401c787e: call   0x1400bb120
0x1401c7883: mov    rcx,QWORD PTR [r15+0x1d8]
0x1401c788a: cmp    rcx,QWORD PTR [rip+0x21d295f]        # 0x14239a1f0
0x1401c7891: jne    0x1401c78cd
0x1401c7893: lea    rdx,[rip+0x143bd16]        # 0x1416035b0  'Your location'
0x1401c789a: lea    rcx,[rbp+0x1f30]
0x1401c78a1: call   0x140068150
0x1401c78a6: nop
0x1401c78a7: xor    r9d,r9d
0x1401c78aa: xor    r8d,r8d
0x1401c78ad: lea    rdx,[rbp+0x1f30]
0x1401c78b4: lea    rcx,[rip+0x2482b35]        # 0x14264a3f0
0x1401c78bb: call   0x140ad9960
0x1401c78c0: nop
0x1401c78c1: lea    rcx,[rbp+0x1f30]
0x1401c78c8: jmp    0x1401c8026
0x1401c78cd: test   r14,r14
0x1401c78d0: je     0x1401c7fee
0x1401c78d6: add    rcx,0x90
0x1401c78dd: call   0x14006f370
0x1401c78e2: mov    rbx,rax
0x1401c78e5: mov    rcx,QWORD PTR [r15+0x1d8]
0x1401c78ec: add    rcx,0xd8
0x1401c78f3: lea    rdx,[rbp+0x58]
0x1401c78f7: call   0x14006f240
0x1401c78fc: mov    rcx,QWORD PTR [r15+0x1d8]
0x1401c7903: add    rcx,0xd8
0x1401c790a: lea    rdx,[rbp+0x140]
0x1401c7911: call   0x14006f230
0x1401c7916: lea    r8,[rbp+0x140]
0x1401c791d: lea    rdx,[rbp+0xf]
0x1401c7921: lea    rcx,[rbp+0x58]
0x1401c7925: call   0x14006ee20
0x1401c792a: xor    edx,edx
0x1401c792c: movzx  ecx,BYTE PTR [rax]
0x1401c792f: call   0x1400657b0
0x1401c7934: test   al,al
0x1401c7936: je     0x1401c799c
0x1401c7938: nop    DWORD PTR [rax+rax*1+0x0]
0x1401c7940: lea    rcx,[rbp+0x58]
0x1401c7944: call   0x14006ee10
0x1401c7949: mov    rcx,QWORD PTR [rax]
0x1401c794c: cmp    DWORD PTR [rcx],0x0
0x1401c794f: jle    0x1401c7971
0x1401c7951: lea    rcx,[rbp+0x58]
0x1401c7955: call   0x14006ee10
0x1401c795a: mov    rcx,QWORD PTR [rax]
0x1401c795d: cmp    DWORD PTR [rcx+0x18],0xffffffff
0x1401c7961: jne    0x1401c7971
0x1401c7963: lea    rcx,[rbp+0x58]
0x1401c7967: call   0x14006ee10
0x1401c796c: mov    rcx,QWORD PTR [rax]
0x1401c796f: add    ebx,DWORD PTR [rcx]
0x1401c7971: lea    rcx,[rbp+0x58]
0x1401c7975: call   0x14006ee00
0x1401c797a: lea    r8,[rbp+0x140]
0x1401c7981: lea    rdx,[rbp+0xf]
0x1401c7985: lea    rcx,[rbp+0x58]
0x1401c7989: call   0x14006ee20
0x1401c798e: xor    edx,edx
0x1401c7990: movzx  ecx,BYTE PTR [rax]
0x1401c7993: call   0x1400657b0
0x1401c7998: test   al,al
0x1401c799a: jne    0x1401c7940
0x1401c799c: cmp    ebx,0x30d4
0x1401c79a2: jl     0x1401c79e1
0x1401c79a4: lea    rdx,[rip+0x143bc15]        # 0x1416035c0  'Population: >10000'
0x1401c79ab: lea    rcx,[rbp+0x1f50]
0x1401c79b2: call   0x140068150
0x1401c79b7: nop
0x1401c79b8: mov    r9d,0x35
0x1401c79be: xor    r8d,r8d
0x1401c79c1: lea    rdx,[rbp+0x1f50]
0x1401c79c8: lea    rcx,[rip+0x2482a21]        # 0x14264a3f0
0x1401c79cf: call   0x140ad9960
0x1401c79d4: nop
0x1401c79d5: lea    rcx,[rbp+0x1f50]
0x1401c79dc: jmp    0x1401c8026
0x1401c79e1: cmp    ebx,0x2134
0x1401c79e7: jl     0x1401c7a26
0x1401c79e9: lea    rdx,[rip+0x143bbe8]        # 0x1416035d8  'Population: ~10000'
0x1401c79f0: lea    rcx,[rbp+0x1f70]
0x1401c79f7: call   0x140068150
0x1401c79fc: nop
0x1401c79fd: mov    r9d,0x35
0x1401c7a03: xor    r8d,r8d
0x1401c7a06: lea    rdx,[rbp+0x1f70]
0x1401c7a0d: lea    rcx,[rip+0x24829dc]        # 0x14264a3f0
0x1401c7a14: call   0x140ad9960
0x1401c7a19: nop
0x1401c7a1a: lea    rcx,[rbp+0x1f70]
0x1401c7a21: jmp    0x1401c8026
0x1401c7a26: cmp    ebx,0x1964
0x1401c7a2c: jl     0x1401c7a6b
0x1401c7a2e: lea    rdx,[rip+0x143bbbb]        # 0x1416035f0  'Population: ~7500'
0x1401c7a35: lea    rcx,[rbp+0x1f90]
0x1401c7a3c: call   0x140068150
0x1401c7a41: nop
0x1401c7a42: mov    r9d,0x35
0x1401c7a48: xor    r8d,r8d
0x1401c7a4b: lea    rdx,[rbp+0x1f90]
0x1401c7a52: lea    rcx,[rip+0x2482997]        # 0x14264a3f0
0x1401c7a59: call   0x140ad9960
0x1401c7a5e: nop
0x1401c7a5f: lea    rcx,[rbp+0x1f90]
0x1401c7a66: jmp    0x1401c8026
0x1401c7a6b: cmp    ebx,0x157c
0x1401c7a71: jl     0x1401c7ab0
0x1401c7a73: lea    rdx,[rip+0x143bb8e]        # 0x141603608  'Population: ~6000'
0x1401c7a7a: lea    rcx,[rbp+0x1fb0]
0x1401c7a81: call   0x140068150
0x1401c7a86: nop
0x1401c7a87: mov    r9d,0x35
0x1401c7a8d: xor    r8d,r8d
0x1401c7a90: lea    rdx,[rbp+0x1fb0]
0x1401c7a97: lea    rcx,[rip+0x2482952]        # 0x14264a3f0
0x1401c7a9e: call   0x140ad9960
0x1401c7aa3: nop
0x1401c7aa4: lea    rcx,[rbp+0x1fb0]
0x1401c7aab: jmp    0x1401c8026
0x1401c7ab0: cmp    ebx,0x1194
0x1401c7ab6: jl     0x1401c7af5
0x1401c7ab8: lea    rdx,[rip+0x143bb61]        # 0x141603620  'Population: ~5000'
0x1401c7abf: lea    rcx,[rbp+0x1fd0]
0x1401c7ac6: call   0x140068150
0x1401c7acb: nop
0x1401c7acc: mov    r9d,0x35
0x1401c7ad2: xor    r8d,r8d
0x1401c7ad5: lea    rdx,[rbp+0x1fd0]
0x1401c7adc: lea    rcx,[rip+0x248290d]        # 0x14264a3f0
0x1401c7ae3: call   0x140ad9960
0x1401c7ae8: nop
0x1401c7ae9: lea    rcx,[rbp+0x1fd0]
0x1401c7af0: jmp    0x1401c8026
0x1401c7af5: cmp    ebx,0xdac
0x1401c7afb: jl     0x1401c7b3a
0x1401c7afd: lea    rdx,[rip+0x143bb34]        # 0x141603638  'Population: ~4000'
0x1401c7b04: lea    rcx,[rbp+0x1ff0]
0x1401c7b0b: call   0x140068150
0x1401c7b10: nop
0x1401c7b11: mov    r9d,0x35
0x1401c7b17: xor    r8d,r8d
0x1401c7b1a: lea    rdx,[rbp+0x1ff0]
0x1401c7b21: lea    rcx,[rip+0x24828c8]        # 0x14264a3f0
0x1401c7b28: call   0x140ad9960
0x1401c7b2d: nop
0x1401c7b2e: lea    rcx,[rbp+0x1ff0]
0x1401c7b35: jmp    0x1401c8026
0x1401c7b3a: cmp    ebx,0x9c4
0x1401c7b40: jl     0x1401c7b7f
0x1401c7b42: lea    rdx,[rip+0x143bb07]        # 0x141603650  'Population: ~3000'
0x1401c7b49: lea    rcx,[rbp+0x2010]
0x1401c7b50: call   0x140068150
0x1401c7b55: nop
0x1401c7b56: mov    r9d,0x35
0x1401c7b5c: xor    r8d,r8d
0x1401c7b5f: lea    rdx,[rbp+0x2010]
0x1401c7b66: lea    rcx,[rip+0x2482883]        # 0x14264a3f0
0x1401c7b6d: call   0x140ad9960
0x1401c7b72: nop
0x1401c7b73: lea    rcx,[rbp+0x2010]
0x1401c7b7a: jmp    0x1401c8026
0x1401c7b7f: cmp    ebx,0x5dc
0x1401c7b85: jl     0x1401c7bc4
0x1401c7b87: lea    rdx,[rip+0x143bada]        # 0x141603668  'Population: ~2000'
0x1401c7b8e: lea    rcx,[rbp+0x2030]
0x1401c7b95: call   0x140068150
0x1401c7b9a: nop
0x1401c7b9b: mov    r9d,0x35
0x1401c7ba1: xor    r8d,r8d
0x1401c7ba4: lea    rdx,[rbp+0x2030]
0x1401c7bab: lea    rcx,[rip+0x248283e]        # 0x14264a3f0
0x1401c7bb2: call   0x140ad9960
0x1401c7bb7: nop
0x1401c7bb8: lea    rcx,[rbp+0x2030]
0x1401c7bbf: jmp    0x1401c8026
0x1401c7bc4: cmp    ebx,0x352
0x1401c7bca: jl     0x1401c7c09
0x1401c7bcc: lea    rdx,[rip+0x143bbe5]        # 0x1416037b8  'Population: ~1000'
0x1401c7bd3: lea    rcx,[rbp+0x2050]
0x1401c7bda: call   0x140068150
0x1401c7bdf: nop
0x1401c7be0: mov    r9d,0x35
0x1401c7be6: xor    r8d,r8d
0x1401c7be9: lea    rdx,[rbp+0x2050]
0x1401c7bf0: lea    rcx,[rip+0x24827f9]        # 0x14264a3f0
0x1401c7bf7: call   0x140ad9960
0x1401c7bfc: nop
0x1401c7bfd: lea    rcx,[rbp+0x2050]
0x1401c7c04: jmp    0x1401c8026
0x1401c7c09: cmp    ebx,0x28a
0x1401c7c0f: jl     0x1401c7c4e
0x1401c7c11: lea    rdx,[rip+0x143bbb8]        # 0x1416037d0  'Population: ~750'
0x1401c7c18: lea    rcx,[rbp+0x2070]
0x1401c7c1f: call   0x140068150
0x1401c7c24: nop
0x1401c7c25: mov    r9d,0x35
0x1401c7c2b: xor    r8d,r8d
0x1401c7c2e: lea    rdx,[rbp+0x2070]
0x1401c7c35: lea    rcx,[rip+0x24827b4]        # 0x14264a3f0
0x1401c7c3c: call   0x140ad9960
0x1401c7c41: nop
0x1401c7c42: lea    rcx,[rbp+0x2070]
0x1401c7c49: jmp    0x1401c8026
0x1401c7c4e: cmp    ebx,0x226
0x1401c7c54: jl     0x1401c7c93
0x1401c7c56: lea    rdx,[rip+0x143bb8b]        # 0x1416037e8  'Population: ~600'
0x1401c7c5d: lea    rcx,[rbp+0x2090]
0x1401c7c64: call   0x140068150
0x1401c7c69: nop
0x1401c7c6a: mov    r9d,0x35
0x1401c7c70: xor    r8d,r8d
0x1401c7c73: lea    rdx,[rbp+0x2090]
0x1401c7c7a: lea    rcx,[rip+0x248276f]        # 0x14264a3f0
0x1401c7c81: call   0x140ad9960
0x1401c7c86: nop
0x1401c7c87: lea    rcx,[rbp+0x2090]
0x1401c7c8e: jmp    0x1401c8026
0x1401c7c93: cmp    ebx,0x1c2
0x1401c7c99: jl     0x1401c7cd8
0x1401c7c9b: lea    rdx,[rip+0x143bb5e]        # 0x141603800  'Population: ~500'
0x1401c7ca2: lea    rcx,[rbp+0x20b0]
0x1401c7ca9: call   0x140068150
0x1401c7cae: nop
0x1401c7caf: mov    r9d,0x35
0x1401c7cb5: xor    r8d,r8d
0x1401c7cb8: lea    rdx,[rbp+0x20b0]
0x1401c7cbf: lea    rcx,[rip+0x248272a]        # 0x14264a3f0
0x1401c7cc6: call   0x140ad9960
0x1401c7ccb: nop
0x1401c7ccc: lea    rcx,[rbp+0x20b0]
0x1401c7cd3: jmp    0x1401c8026
0x1401c7cd8: cmp    ebx,0x15e
0x1401c7cde: jl     0x1401c7d1d
0x1401c7ce0: lea    rdx,[rip+0x143bb31]        # 0x141603818  'Population: ~400'
0x1401c7ce7: lea    rcx,[rbp+0x20d0]
0x1401c7cee: call   0x140068150
0x1401c7cf3: nop
0x1401c7cf4: mov    r9d,0x35
0x1401c7cfa: xor    r8d,r8d
0x1401c7cfd: lea    rdx,[rbp+0x20d0]
0x1401c7d04: lea    rcx,[rip+0x24826e5]        # 0x14264a3f0
0x1401c7d0b: call   0x140ad9960
0x1401c7d10: nop
0x1401c7d11: lea    rcx,[rbp+0x20d0]
0x1401c7d18: jmp    0x1401c8026
0x1401c7d1d: cmp    ebx,0xfa
0x1401c7d23: jl     0x1401c7d62
0x1401c7d25: lea    rdx,[rip+0x143bb04]        # 0x141603830  'Population: ~300'
0x1401c7d2c: lea    rcx,[rbp+0x20f0]
0x1401c7d33: call   0x140068150
0x1401c7d38: nop
0x1401c7d39: mov    r9d,0x35
0x1401c7d3f: xor    r8d,r8d
0x1401c7d42: lea    rdx,[rbp+0x20f0]
0x1401c7d49: lea    rcx,[rip+0x24826a0]        # 0x14264a3f0
0x1401c7d50: call   0x140ad9960
0x1401c7d55: nop
0x1401c7d56: lea    rcx,[rbp+0x20f0]
0x1401c7d5d: jmp    0x1401c8026
0x1401c7d62: cmp    ebx,0x96
0x1401c7d68: jl     0x1401c7da7
0x1401c7d6a: lea    rdx,[rip+0x143bad7]        # 0x141603848  'Population: ~200'
0x1401c7d71: lea    rcx,[rbp+0x2110]
0x1401c7d78: call   0x140068150
0x1401c7d7d: nop
0x1401c7d7e: mov    r9d,0x35
0x1401c7d84: xor    r8d,r8d
0x1401c7d87: lea    rdx,[rbp+0x2110]
0x1401c7d8e: lea    rcx,[rip+0x248265b]        # 0x14264a3f0
0x1401c7d95: call   0x140ad9960
0x1401c7d9a: nop
0x1401c7d9b: lea    rcx,[rbp+0x2110]
0x1401c7da2: jmp    0x1401c8026
0x1401c7da7: cmp    ebx,0x55
0x1401c7daa: jl     0x1401c7de9
0x1401c7dac: lea    rdx,[rip+0x143baad]        # 0x141603860  'Population: ~100'
0x1401c7db3: lea    rcx,[rbp+0x2130]
0x1401c7dba: call   0x140068150
0x1401c7dbf: nop
0x1401c7dc0: mov    r9d,0x35
0x1401c7dc6: xor    r8d,r8d
0x1401c7dc9: lea    rdx,[rbp+0x2130]
0x1401c7dd0: lea    rcx,[rip+0x2482619]        # 0x14264a3f0
0x1401c7dd7: call   0x140ad9960
0x1401c7ddc: nop
0x1401c7ddd: lea    rcx,[rbp+0x2130]
0x1401c7de4: jmp    0x1401c8026
0x1401c7de9: cmp    ebx,0x41
0x1401c7dec: jl     0x1401c7e2b
0x1401c7dee: lea    rdx,[rip+0x143ba83]        # 0x141603878  'Population: ~75'
0x1401c7df5: lea    rcx,[rbp+0x2150]
0x1401c7dfc: call   0x140068150
0x1401c7e01: nop
0x1401c7e02: mov    r9d,0x35
0x1401c7e08: xor    r8d,r8d
0x1401c7e0b: lea    rdx,[rbp+0x2150]
0x1401c7e12: lea    rcx,[rip+0x24825d7]        # 0x14264a3f0
0x1401c7e19: call   0x140ad9960
0x1401c7e1e: nop
0x1401c7e1f: lea    rcx,[rbp+0x2150]
0x1401c7e26: jmp    0x1401c8026
0x1401c7e2b: cmp    ebx,0x37
0x1401c7e2e: jl     0x1401c7e6d
0x1401c7e30: lea    rdx,[rip+0x143ba51]        # 0x141603888  'Population: ~60'
0x1401c7e37: lea    rcx,[rbp+0x2170]
0x1401c7e3e: call   0x140068150
0x1401c7e43: nop
0x1401c7e44: mov    r9d,0x35
0x1401c7e4a: xor    r8d,r8d
0x1401c7e4d: lea    rdx,[rbp+0x2170]
0x1401c7e54: lea    rcx,[rip+0x2482595]        # 0x14264a3f0
0x1401c7e5b: call   0x140ad9960
0x1401c7e60: nop
0x1401c7e61: lea    rcx,[rbp+0x2170]
0x1401c7e68: jmp    0x1401c8026
0x1401c7e6d: cmp    ebx,0x2d
0x1401c7e70: jl     0x1401c7eaf
0x1401c7e72: lea    rdx,[rip+0x143ba1f]        # 0x141603898  'Population: ~50'
0x1401c7e79: lea    rcx,[rbp+0x2190]
0x1401c7e80: call   0x140068150
0x1401c7e85: nop
0x1401c7e86: mov    r9d,0x35
0x1401c7e8c: xor    r8d,r8d
0x1401c7e8f: lea    rdx,[rbp+0x2190]
0x1401c7e96: lea    rcx,[rip+0x2482553]        # 0x14264a3f0
0x1401c7e9d: call   0x140ad9960
0x1401c7ea2: nop
0x1401c7ea3: lea    rcx,[rbp+0x2190]
0x1401c7eaa: jmp    0x1401c8026
0x1401c7eaf: cmp    ebx,0x23
0x1401c7eb2: jl     0x1401c7ef1
0x1401c7eb4: lea    rdx,[rip+0x143b9ed]        # 0x1416038a8  'Population: ~40'
0x1401c7ebb: lea    rcx,[rbp+0x21b0]
0x1401c7ec2: call   0x140068150
0x1401c7ec7: nop
0x1401c7ec8: mov    r9d,0x35
0x1401c7ece: xor    r8d,r8d
0x1401c7ed1: lea    rdx,[rbp+0x21b0]
0x1401c7ed8: lea    rcx,[rip+0x2482511]        # 0x14264a3f0
0x1401c7edf: call   0x140ad9960
0x1401c7ee4: nop
0x1401c7ee5: lea    rcx,[rbp+0x21b0]
0x1401c7eec: jmp    0x1401c8026
0x1401c7ef1: cmp    ebx,0x19
0x1401c7ef4: jl     0x1401c7f33
0x1401c7ef6: lea    rdx,[rip+0x143b9bb]        # 0x1416038b8  'Population: ~30'
0x1401c7efd: lea    rcx,[rbp+0x21d0]
0x1401c7f04: call   0x140068150
0x1401c7f09: nop
0x1401c7f0a: mov    r9d,0x35
0x1401c7f10: xor    r8d,r8d
0x1401c7f13: lea    rdx,[rbp+0x21d0]
0x1401c7f1a: lea    rcx,[rip+0x24824cf]        # 0x14264a3f0
0x1401c7f21: call   0x140ad9960
0x1401c7f26: nop
0x1401c7f27: lea    rcx,[rbp+0x21d0]
0x1401c7f2e: jmp    0x1401c8026
0x1401c7f33: cmp    ebx,0xf
0x1401c7f36: jl     0x1401c7f75
0x1401c7f38: lea    rdx,[rip+0x143b989]        # 0x1416038c8  'Population: ~20'
0x1401c7f3f: lea    rcx,[rbp+0x21f0]
0x1401c7f46: call   0x140068150
0x1401c7f4b: nop
0x1401c7f4c: mov    r9d,0x35
0x1401c7f52: xor    r8d,r8d
0x1401c7f55: lea    rdx,[rbp+0x21f0]
0x1401c7f5c: lea    rcx,[rip+0x248248d]        # 0x14264a3f0
0x1401c7f63: call   0x140ad9960
0x1401c7f68: nop
0x1401c7f69: lea    rcx,[rbp+0x21f0]
0x1401c7f70: jmp    0x1401c8026
0x1401c7f75: cmp    ebx,0x7
0x1401c7f78: jl     0x1401c7fb4
0x1401c7f7a: lea    rdx,[rip+0x143b957]        # 0x1416038d8  'Population: ~10'
0x1401c7f81: lea    rcx,[rbp+0x2210]
0x1401c7f88: call   0x140068150
0x1401c7f8d: nop
0x1401c7f8e: mov    r9d,0x35
0x1401c7f94: xor    r8d,r8d
0x1401c7f97: lea    rdx,[rbp+0x2210]
0x1401c7f9e: lea    rcx,[rip+0x248244b]        # 0x14264a3f0
0x1401c7fa5: call   0x140ad9960
0x1401c7faa: nop
0x1401c7fab: lea    rcx,[rbp+0x2210]
0x1401c7fb2: jmp    0x1401c8026
0x1401c7fb4: lea    rdx,[rip+0x143b92d]        # 0x1416038e8  'Population: <10'
0x1401c7fbb: lea    rcx,[rbp+0x2230]
0x1401c7fc2: call   0x140068150
0x1401c7fc7: nop
0x1401c7fc8: mov    r9d,0x35
0x1401c7fce: xor    r8d,r8d
0x1401c7fd1: lea    rdx,[rbp+0x2230]
0x1401c7fd8: lea    rcx,[rip+0x2482411]        # 0x14264a3f0
0x1401c7fdf: call   0x140ad9960
0x1401c7fe4: nop
0x1401c7fe5: lea    rcx,[rbp+0x2230]
0x1401c7fec: jmp    0x1401c8026
0x1401c7fee: lea    rdx,[rip+0x143b68b]        # 0x141603680  'No civilized population'
0x1401c7ff5: lea    rcx,[rbp+0x2250]
0x1401c7ffc: call   0x140068150
0x1401c8001: nop
0x1401c8002: mov    r9d,0x35
0x1401c8008: xor    r8d,r8d
0x1401c800b: lea    rdx,[rbp+0x2250]
0x1401c8012: lea    rcx,[rip+0x24823d7]        # 0x14264a3f0
0x1401c8019: call   0x140ad9960
0x1401c801e: nop
0x1401c801f: lea    rcx,[rbp+0x2250]
0x1401c8026: call   0x140067e30
0x1401c802b: xor    r8d,r8d
0x1401c802e: mov    edx,0x7
0x1401c8033: mov    r9b,0x1
0x1401c8036: lea    rcx,[rip+0x24823b3]        # 0x14264a3f0
0x1401c803d: call   0x1400bb130
0x1401c8042: mov    r8d,r13d
0x1401c8045: mov    edx,0x3
0x1401c804a: lea    rcx,[rip+0x248239f]        # 0x14264a3f0
0x1401c8051: call   0x1400bb120
0x1401c8056: mov    edx,DWORD PTR [rip+0x21cb61c]        # 0x142393678
0x1401c805c: lea    rcx,[rip+0x2209795]        # 0x1423d17f8
0x1401c8063: call   0x14007daf0
0x1401c8068: mov    rbx,rax
0x1401c806b: mov    edx,DWORD PTR [rip+0x21cb5ff]        # 0x142393670
0x1401c8071: lea    rcx,[rip+0x2209780]        # 0x1423d17f8
0x1401c8078: call   0x14007daf0
0x1401c807d: test   rax,rax
0x1401c8080: je     0x1401c8457
0x1401c8086: test   rbx,rbx
0x1401c8089: je     0x1401c8457
0x1401c808f: test   rdi,rdi
0x1401c8092: je     0x1401c8457
0x1401c8098: test   r14,r14
0x1401c809b: je     0x1401c8457
0x1401c80a1: cmp    rax,rdi
0x1401c80a4: je     0x1401c8457
0x1401c80aa: lea    rcx,[rax+0x1028]
0x1401c80b1: mov    edx,DWORD PTR [rdi+0x4]
0x1401c80b4: call   0x1400ffa80
0x1401c80b9: mov    rdi,rax
0x1401c80bc: lea    rcx,[rbx+0x1028]
0x1401c80c3: mov    edx,DWORD PTR [r14+0x4]
0x1401c80c7: call   0x1400ffa80
0x1401c80cc: mov    rbx,rax
0x1401c80cf: test   rax,rax
0x1401c80d2: je     0x1401c8297
0x1401c80d8: movzx  eax,WORD PTR [rax+0x4]
0x1401c80dc: cmp    ax,0x3
0x1401c80e0: je     0x1401c8123
0x1401c80e2: cmp    ax,0x4
0x1401c80e6: jne    0x1401c8297
0x1401c80ec: lea    rdx,[rip+0x143b5dd]        # 0x1416036d0  'They accept '
0x1401c80f3: lea    rcx,[rbp+0x2270]
0x1401c80fa: call   0x140068150
0x1401c80ff: nop
0x1401c8100: xor    r9d,r9d
0x1401c8103: mov    r8b,0x3
0x1401c8106: lea    rdx,[rbp+0x2270]
0x1401c810d: lea    rcx,[rip+0x24822dc]        # 0x14264a3f0
0x1401c8114: call   0x140ad9960
0x1401c8119: nop
0x1401c811a: lea    rcx,[rbp+0x2270]
0x1401c8121: jmp    0x1401c8158
0x1401c8123: lea    rdx,[rip+0x143b596]        # 0x1416036c0  'They offer '
0x1401c812a: lea    rcx,[rbp+0x2290]
0x1401c8131: call   0x140068150
0x1401c8136: nop
0x1401c8137: xor    r9d,r9d
0x1401c813a: mov    r8b,0x3
0x1401c813d: lea    rdx,[rbp+0x2290]
0x1401c8144: lea    rcx,[rip+0x24822a5]        # 0x14264a3f0
0x1401c814b: call   0x140ad9960
0x1401c8150: nop
0x1401c8151: lea    rcx,[rbp+0x2290]
0x1401c8158: call   0x140067e30
0x1401c815d: mov    ecx,DWORD PTR [rbx+0x44]
0x1401c8160: test   ecx,ecx
0x1401c8162: je     0x1401c8223
0x1401c8168: sub    ecx,0x1
0x1401c816b: je     0x1401c81ec
0x1401c816d: sub    ecx,0x1
0x1401c8170: je     0x1401c81b5
0x1401c8172: cmp    ecx,0x1
0x1401c8175: jne    0x1401c825d
0x1401c817b: lea    rdx,[rip+0x1435132]        # 0x1415fd2b4  'Winter'
0x1401c8182: lea    rcx,[rbp+0x22b0]
0x1401c8189: call   0x140068150
0x1401c818e: nop
0x1401c818f: xor    r9d,r9d
0x1401c8192: mov    r8b,0x3
0x1401c8195: lea    rdx,[rbp+0x22b0]
0x1401c819c: lea    rcx,[rip+0x248224d]        # 0x14264a3f0
0x1401c81a3: call   0x140ad9960
0x1401c81a8: nop
0x1401c81a9: lea    rcx,[rbp+0x22b0]
0x1401c81b0: jmp    0x1401c8258
0x1401c81b5: lea    rdx,[rip+0x14350f0]        # 0x1415fd2ac  'Autumn'
0x1401c81bc: lea    rcx,[rbp+0x22d0]
0x1401c81c3: call   0x140068150
0x1401c81c8: nop
0x1401c81c9: xor    r9d,r9d
0x1401c81cc: mov    r8b,0x3
0x1401c81cf: lea    rdx,[rbp+0x22d0]
0x1401c81d6: lea    rcx,[rip+0x2482213]        # 0x14264a3f0
0x1401c81dd: call   0x140ad9960
0x1401c81e2: nop
0x1401c81e3: lea    rcx,[rbp+0x22d0]
0x1401c81ea: jmp    0x1401c8258
0x1401c81ec: lea    rdx,[rip+0x14350b1]        # 0x1415fd2a4  'Summer'
0x1401c81f3: lea    rcx,[rbp+0x22f0]
0x1401c81fa: call   0x140068150
0x1401c81ff: nop
0x1401c8200: xor    r9d,r9d
0x1401c8203: mov    r8b,0x3
0x1401c8206: lea    rdx,[rbp+0x22f0]
0x1401c820d: lea    rcx,[rip+0x24821dc]        # 0x14264a3f0
0x1401c8214: call   0x140ad9960
0x1401c8219: nop
0x1401c821a: lea    rcx,[rbp+0x22f0]
0x1401c8221: jmp    0x1401c8258
0x1401c8223: lea    rdx,[rip+0x1435072]        # 0x1415fd29c  'Spring'
0x1401c822a: lea    rcx,[rbp+0x2310]
0x1401c8231: call   0x140068150
0x1401c8236: nop
0x1401c8237: xor    r9d,r9d
0x1401c823a: mov    r8b,0x3
0x1401c823d: lea    rdx,[rbp+0x2310]
0x1401c8244: lea    rcx,[rip+0x24821a5]        # 0x14264a3f0
0x1401c824b: call   0x140ad9960
0x1401c8250: nop
0x1401c8251: lea    rcx,[rbp+0x2310]
0x1401c8258: call   0x140067e30
0x1401c825d: lea    rdx,[rip+0x143b47c]        # 0x1416036e0  ' tribute'
0x1401c8264: lea    rcx,[rbp+0x2330]
0x1401c826b: call   0x140068150
0x1401c8270: nop
0x1401c8271: xor    r9d,r9d
0x1401c8274: xor    r8d,r8d
0x1401c8277: lea    rdx,[rbp+0x2330]
0x1401c827e: lea    rcx,[rip+0x248216b]        # 0x14264a3f0
0x1401c8285: call   0x140ad9960
0x1401c828a: nop
0x1401c828b: lea    rcx,[rbp+0x2330]
0x1401c8292: jmp    0x1401c8452
0x1401c8297: test   rdi,rdi
0x1401c829a: je     0x1401c841d
0x1401c82a0: movsx  rax,WORD PTR [rdi+0x4]
0x1401c82a5: cmp    eax,0x5
0x1401c82a8: ja     0x1401c8457
0x1401c82ae: lea    rdx,[rip+0xffffffffffe37d4b]        # 0x140000000
0x1401c82b5: mov    ecx,DWORD PTR [rdx+rax*4+0x1d3874]
0x1401c82bc: add    rcx,rdx
0x1401c82bf: jmp    rcx
0x1401c82c1: test   BYTE PTR [rdi+0x40],0x4
0x1401c82c5: je     0x1401c8301
0x1401c82c7: lea    rdx,[rip+0x143b422]        # 0x1416036f0  'Alliance'
0x1401c82ce: lea    rcx,[rbp+0x2350]
0x1401c82d5: call   0x140068150
0x1401c82da: nop
0x1401c82db: xor    r9d,r9d
0x1401c82de: xor    r8d,r8d
0x1401c82e1: lea    rdx,[rbp+0x2350]
0x1401c82e8: lea    rcx,[rip+0x2482101]        # 0x14264a3f0
0x1401c82ef: call   0x140ad9960
0x1401c82f4: nop
0x1401c82f5: lea    rcx,[rbp+0x2350]
0x1401c82fc: jmp    0x1401c8452
0x1401c8301: lea    rdx,[rip+0x14206ec]        # 0x1415e89f4  'Peace'
0x1401c8308: lea    rcx,[rbp+0x2370]
0x1401c830f: call   0x140068150
0x1401c8314: nop
0x1401c8315: xor    r9d,r9d
0x1401c8318: xor    r8d,r8d
0x1401c831b: lea    rdx,[rbp+0x2370]
0x1401c8322: lea    rcx,[rip+0x24820c7]        # 0x14264a3f0
0x1401c8329: call   0x140ad9960
0x1401c832e: nop
0x1401c832f: lea    rcx,[rbp+0x2370]
0x1401c8336: jmp    0x1401c8452
0x1401c833b: lea    rdx,[rip+0x143b3ba]        # 0x1416036fc  'War'
0x1401c8342: lea    rcx,[rbp+0x2390]
0x1401c8349: call   0x140068150
0x1401c834e: nop
0x1401c834f: xor    r9d,r9d
0x1401c8352: xor    r8d,r8d
0x1401c8355: lea    rdx,[rbp+0x2390]
0x1401c835c: lea    rcx,[rip+0x248208d]        # 0x14264a3f0
0x1401c8363: call   0x140ad9960
0x1401c8368: nop
0x1401c8369: lea    rcx,[rbp+0x2390]
0x1401c8370: jmp    0x1401c8452
0x1401c8375: lea    rdx,[rip+0x143b394]        # 0x141603710  'They offer tribute'
0x1401c837c: lea    rcx,[rbp+0x23b0]
0x1401c8383: call   0x140068150
0x1401c8388: nop
0x1401c8389: xor    r9d,r9d
0x1401c838c: xor    r8d,r8d
0x1401c838f: lea    rdx,[rbp+0x23b0]
0x1401c8396: lea    rcx,[rip+0x2482053]        # 0x14264a3f0
0x1401c839d: call   0x140ad9960
0x1401c83a2: nop
0x1401c83a3: lea    rcx,[rbp+0x23b0]
0x1401c83aa: jmp    0x1401c8452
0x1401c83af: lea    rdx,[rip+0x143b372]        # 0x141603728  'They accept tribute'
0x1401c83b6: lea    rcx,[rbp+0x23d0]
0x1401c83bd: call   0x140068150
0x1401c83c2: nop
0x1401c83c3: xor    r9d,r9d
0x1401c83c6: xor    r8d,r8d
0x1401c83c9: lea    rdx,[rbp+0x23d0]
0x1401c83d0: lea    rcx,[rip+0x2482019]        # 0x14264a3f0
0x1401c83d7: call   0x140ad9960
0x1401c83dc: nop
0x1401c83dd: lea    rcx,[rbp+0x23d0]
0x1401c83e4: jmp    0x1401c8452
0x1401c83e6: lea    rdx,[rip+0x143b353]        # 0x141603740  'Skirmishing'
0x1401c83ed: lea    rcx,[rbp+0x23f0]
0x1401c83f4: call   0x140068150
0x1401c83f9: nop
0x1401c83fa: xor    r9d,r9d
0x1401c83fd: xor    r8d,r8d
0x1401c8400: lea    rdx,[rbp+0x23f0]
0x1401c8407: lea    rcx,[rip+0x2481fe2]        # 0x14264a3f0
0x1401c840e: call   0x140ad9960
0x1401c8413: nop
0x1401c8414: lea    rcx,[rbp+0x23f0]
0x1401c841b: jmp    0x1401c8452
0x1401c841d: lea    rdx,[rip+0x143b2dc]        # 0x141603700  'No contact'
0x1401c8424: lea    rcx,[rbp+0x2410]
0x1401c842b: call   0x140068150
0x1401c8430: nop
0x1401c8431: xor    r9d,r9d
0x1401c8434: xor    r8d,r8d
0x1401c8437: lea    rdx,[rbp+0x2410]
0x1401c843e: lea    rcx,[rip+0x2481fab]        # 0x14264a3f0
0x1401c8445: call   0x140ad9960
0x1401c844a: nop
0x1401c844b: lea    rcx,[rbp+0x2410]
0x1401c8452: call   0x140067e30
0x1401c8457: movsxd rax,DWORD PTR [rsp+0x70]
0x1401c845c: mov    r15d,eax
0x1401c845f: cmp    eax,r12d
0x1401c8462: jg     0x1401c84dd
0x1401c8464: mov    r13,rax
0x1401c8467: movsxd rax,r12d
0x1401c846a: mov    r14,r13
0x1401c846d: lea    r12,[rip+0x2483a74]        # 0x14264bee8
0x1401c8474: mov    rsi,rax
0x1401c8477: nop    WORD PTR [rax+rax*1+0x0]
0x1401c8480: mov    edi,0x1
0x1401c8485: lea    rbx,[rip+0x2483a50]        # 0x14264bedc
0x1401c848c: nop    DWORD PTR [rax+0x0]
0x1401c8490: mov    r8d,r15d
0x1401c8493: mov    edx,edi
0x1401c8495: lea    rcx,[rip+0x2481f54]        # 0x14264a3f0
0x1401c849c: call   0x1400bb120
0x1401c84a1: cmp    r14,r13
0x1401c84a4: jne    0x1401c84ab
0x1401c84a6: mov    edx,DWORD PTR [rbx-0x18]
0x1401c84a9: jmp    0x1401c84b7
0x1401c84ab: cmp    r14,rsi
0x1401c84ae: jne    0x1401c84b4
0x1401c84b0: mov    edx,DWORD PTR [rbx]
0x1401c84b2: jmp    0x1401c84b7
0x1401c84b4: mov    edx,DWORD PTR [rbx-0xc]
0x1401c84b7: lea    rcx,[rip+0x2481f32]        # 0x14264a3f0
0x1401c84be: call   0x140adaad0
0x1401c84c3: inc    edi
0x1401c84c5: add    rbx,0x4
0x1401c84c9: cmp    rbx,r12
0x1401c84cc: jl     0x1401c8490
0x1401c84ce: inc    r15d
0x1401c84d1: inc    r14
0x1401c84d4: cmp    r15d,DWORD PTR [rbp-0x58]
0x1401c84d8: jle    0x1401c8480
0x1401c84da: mov    esi,DWORD PTR [rbp-0x20]
0x1401c84dd: xor    r8d,r8d
0x1401c84e0: mov    edx,0x7
0x1401c84e5: mov    r9b,0x1
0x1401c84e8: lea    rcx,[rip+0x2481f01]        # 0x14264a3f0
0x1401c84ef: call   0x1400bb130
0x1401c84f4: mov    r8d,DWORD PTR [rsp+0x70]
0x1401c84f9: add    r8d,0x2
0x1401c84fd: mov    edx,0x2
0x1401c8502: lea    rcx,[rip+0x2481ee7]        # 0x14264a3f0
0x1401c8509: call   0x1400bb120
0x1401c850e: lea    rdx,[rip+0x143620f]        # 0x1415fe724  'Cancel'
0x1401c8515: lea    rcx,[rbp+0x2430]
0x1401c851c: call   0x140068150
0x1401c8521: nop
0x1401c8522: xor    r9d,r9d
0x1401c8525: xor    r8d,r8d
0x1401c8528: lea    rdx,[rbp+0x2430]
0x1401c852f: lea    rcx,[rip+0x2481eba]        # 0x14264a3f0
0x1401c8536: call   0x140ad9960
0x1401c853b: nop
0x1401c853c: lea    rcx,[rbp+0x2430]
0x1401c8543: call   0x140067e30
0x1401c8548: add    esi,0x2
0x1401c854b: mov    edi,DWORD PTR [rsp+0x74]
0x1401c854f: add    edi,0xfffffffe
0x1401c8552: mov    r15d,0x7
0x1401c8558: mov    r14,QWORD PTR [rsp+0x78]
0x1401c855d: add    r14,0x2e4
0x1401c8564: xor    ebx,ebx
0x1401c8566: cmp    DWORD PTR [r14],0x1
0x1401c856a: je     0x1401c8be7
0x1401c8570: mov    ebx,esi
0x1401c8572: cmp    esi,edi
0x1401c8574: jg     0x1401c86c1
0x1401c857a: nop    WORD PTR [rax+rax*1+0x0]
0x1401c8580: mov    r8d,ebx
0x1401c8583: lea    edx,[r15-0x2]
0x1401c8587: lea    rcx,[rip+0x2481e62]        # 0x14264a3f0
0x1401c858e: call   0x1400bb120
0x1401c8593: cmp    DWORD PTR [r14],0x0
0x1401c8597: je     0x1401c85c0
0x1401c8599: cmp    ebx,esi
0x1401c859b: jne    0x1401c85a5
0x1401c859d: mov    edx,DWORD PTR [rip+0x2483921]        # 0x14264bec4
0x1401c85a3: jmp    0x1401c85dc
0x1401c85a5: lea    rcx,[rip+0x2481e44]        # 0x14264a3f0
0x1401c85ac: cmp    ebx,edi
0x1401c85ae: jne    0x1401c85b8
0x1401c85b0: mov    edx,DWORD PTR [rip+0x2483926]        # 0x14264bedc
0x1401c85b6: jmp    0x1401c85e3
0x1401c85b8: mov    edx,DWORD PTR [rip+0x2483912]        # 0x14264bed0
0x1401c85be: jmp    0x1401c85e3
0x1401c85c0: cmp    ebx,esi
0x1401c85c2: jne    0x1401c85cc
0x1401c85c4: mov    edx,DWORD PTR [rip+0x24838b2]        # 0x14264be7c
0x1401c85ca: jmp    0x1401c85dc
0x1401c85cc: cmp    ebx,edi
0x1401c85ce: mov    edx,DWORD PTR [rip+0x24838c0]        # 0x14264be94
0x1401c85d4: je     0x1401c85dc
0x1401c85d6: mov    edx,DWORD PTR [rip+0x24838ac]        # 0x14264be88
0x1401c85dc: lea    rcx,[rip+0x2481e0d]        # 0x14264a3f0
0x1401c85e3: call   0x140adaad0
0x1401c85e8: mov    r8d,ebx
0x1401c85eb: lea    edx,[r15-0x1]
0x1401c85ef: lea    rcx,[rip+0x2481dfa]        # 0x14264a3f0
0x1401c85f6: call   0x1400bb120
0x1401c85fb: cmp    DWORD PTR [r14],0x0
0x1401c85ff: je     0x1401c8628
0x1401c8601: cmp    ebx,esi
0x1401c8603: jne    0x1401c860d
0x1401c8605: mov    edx,DWORD PTR [rip+0x24838bd]        # 0x14264bec8
0x1401c860b: jmp    0x1401c8644
0x1401c860d: lea    rcx,[rip+0x2481ddc]        # 0x14264a3f0
0x1401c8614: cmp    ebx,edi
0x1401c8616: jne    0x1401c8620
0x1401c8618: mov    edx,DWORD PTR [rip+0x24838c2]        # 0x14264bee0
0x1401c861e: jmp    0x1401c864b
0x1401c8620: mov    edx,DWORD PTR [rip+0x24838ae]        # 0x14264bed4
0x1401c8626: jmp    0x1401c864b
0x1401c8628: cmp    ebx,esi
0x1401c862a: jne    0x1401c8634
0x1401c862c: mov    edx,DWORD PTR [rip+0x248384e]        # 0x14264be80
0x1401c8632: jmp    0x1401c8644
0x1401c8634: cmp    ebx,edi
0x1401c8636: mov    edx,DWORD PTR [rip+0x248385c]        # 0x14264be98
0x1401c863c: je     0x1401c8644
0x1401c863e: mov    edx,DWORD PTR [rip+0x2483848]        # 0x14264be8c
0x1401c8644: lea    rcx,[rip+0x2481da5]        # 0x14264a3f0
0x1401c864b: call   0x140adaad0
0x1401c8650: mov    r8d,ebx
0x1401c8653: mov    edx,r15d
0x1401c8656: lea    rcx,[rip+0x2481d93]        # 0x14264a3f0
0x1401c865d: call   0x1400bb120
0x1401c8662: cmp    DWORD PTR [r14],0x0
0x1401c8666: je     0x1401c868f
0x1401c8668: cmp    ebx,esi
0x1401c866a: jne    0x1401c8674
0x1401c866c: mov    edx,DWORD PTR [rip+0x248385a]        # 0x14264becc
0x1401c8672: jmp    0x1401c86ab
0x1401c8674: lea    rcx,[rip+0x2481d75]        # 0x14264a3f0
0x1401c867b: cmp    ebx,edi
0x1401c867d: jne    0x1401c8687
0x1401c867f: mov    edx,DWORD PTR [rip+0x248385f]        # 0x14264bee4
0x1401c8685: jmp    0x1401c86b2
0x1401c8687: mov    edx,DWORD PTR [rip+0x248384b]        # 0x14264bed8
0x1401c868d: jmp    0x1401c86b2
0x1401c868f: cmp    ebx,esi
0x1401c8691: jne    0x1401c869b
0x1401c8693: mov    edx,DWORD PTR [rip+0x24837eb]        # 0x14264be84
0x1401c8699: jmp    0x1401c86ab
0x1401c869b: cmp    ebx,edi
0x1401c869d: mov    edx,DWORD PTR [rip+0x24837f9]        # 0x14264be9c
0x1401c86a3: je     0x1401c86ab
0x1401c86a5: mov    edx,DWORD PTR [rip+0x24837e5]        # 0x14264be90
0x1401c86ab: lea    rcx,[rip+0x2481d3e]        # 0x14264a3f0
0x1401c86b2: call   0x140adaad0
0x1401c86b7: inc    ebx
0x1401c86b9: cmp    ebx,edi
0x1401c86bb: jle    0x1401c8580
0x1401c86c1: xor    r8d,r8d
0x1401c86c4: lea    rcx,[rip+0x2481d25]        # 0x14264a3f0
0x1401c86cb: cmp    DWORD PTR [r14],r8d
0x1401c86ce: je     0x1401c86d7
0x1401c86d0: xor    edx,edx
0x1401c86d2: xor    r9d,r9d
0x1401c86d5: jmp    0x1401c86df
0x1401c86d7: mov    edx,0x7
0x1401c86dc: mov    r9b,0x1
0x1401c86df: call   0x1400bb130
0x1401c86e4: lea    r8d,[rsi+0x2]
0x1401c86e8: lea    edx,[r15-0x1]
0x1401c86ec: lea    rcx,[rip+0x2481cfd]        # 0x14264a3f0
0x1401c86f3: call   0x1400bb120
0x1401c86f8: mov    rbx,QWORD PTR [rbp-0x78]
0x1401c86fc: cmp    ebx,0x2
0x1401c86ff: je     0x1401c877d
0x1401c8701: cmp    ebx,0x13
0x1401c8704: je     0x1401c8746
0x1401c8706: cmp    ebx,0x19
0x1401c8709: jne    0x1401c87b7
0x1401c870f: lea    rdx,[rip+0x143adea]        # 0x141603500  'Diplomacy'
0x1401c8716: lea    rcx,[rbp+0x2450]
0x1401c871d: call   0x140068150
0x1401c8722: nop
0x1401c8723: xor    r9d,r9d
0x1401c8726: xor    r8d,r8d
0x1401c8729: lea    rdx,[rbp+0x2450]
0x1401c8730: lea    rcx,[rip+0x2481cb9]        # 0x14264a3f0
0x1401c8737: call   0x140ad9960
0x1401c873c: nop
0x1401c873d: lea    rcx,[rbp+0x2450]
0x1401c8744: jmp    0x1401c87b2
0x1401c8746: lea    rdx,[rip+0x143b74b]        # 0x141603e98  'Request workers'
0x1401c874d: lea    rcx,[rbp+0x2470]
0x1401c8754: call   0x140068150
0x1401c8759: nop
0x1401c875a: xor    r9d,r9d
0x1401c875d: xor    r8d,r8d
0x1401c8760: lea    rdx,[rbp+0x2470]
0x1401c8767: lea    rcx,[rip+0x2481c82]        # 0x14264a3f0
0x1401c876e: call   0x140ad9960
0x1401c8773: nop
0x1401c8774: lea    rcx,[rbp+0x2470]
0x1401c877b: jmp    0x1401c87b2
0x1401c877d: lea    rdx,[rip+0x143b4b4]        # 0x141603c38  'Attack'
0x1401c8784: lea    rcx,[rbp+0x2490]
0x1401c878b: call   0x140068150
0x1401c8790: nop
0x1401c8791: xor    r9d,r9d
0x1401c8794: xor    r8d,r8d
0x1401c8797: lea    rdx,[rbp+0x2490]
0x1401c879e: lea    rcx,[rip+0x2481c4b]        # 0x14264a3f0
0x1401c87a5: call   0x140ad9960
0x1401c87aa: nop
0x1401c87ab: lea    rcx,[rbp+0x2490]
0x1401c87b2: call   0x140067e30
0x1401c87b7: cmp    DWORD PTR [r14],0x0
0x1401c87bb: je     0x1401c8be3
0x1401c87c1: xor    r8d,r8d
0x1401c87c4: mov    edx,0x6
0x1401c87c9: mov    r9b,0x1
0x1401c87cc: lea    rcx,[rip+0x2481c1d]        # 0x14264a3f0
0x1401c87d3: call   0x1400bb130
0x1401c87d8: lea    r8d,[rsi+0x3]
0x1401c87dc: mov    edx,r15d
0x1401c87df: lea    rcx,[rip+0x2481c0a]        # 0x14264a3f0
0x1401c87e6: call   0x1400bb120
0x1401c87eb: mov    eax,DWORD PTR [r14]
0x1401c87ee: add    eax,0xfffffffd
0x1401c87f1: cmp    eax,0x11
0x1401c87f4: ja     0x1401c8be3
0x1401c87fa: cdqe
0x1401c87fc: lea    rdx,[rip+0xffffffffffe377fd]        # 0x140000000
0x1401c8803: mov    ecx,DWORD PTR [rdx+rax*4+0x1d388c]
0x1401c880a: add    rcx,rdx
0x1401c880d: jmp    rcx
0x1401c880f: lea    rdx,[rip+0x143b42a]        # 0x141603c40  'Belongs to your civilization'
0x1401c8816: lea    rcx,[rbp+0x24b0]
0x1401c881d: call   0x140068150
0x1401c8822: nop
0x1401c8823: xor    r9d,r9d
0x1401c8826: xor    r8d,r8d
0x1401c8829: lea    rdx,[rbp+0x24b0]
0x1401c8830: lea    rcx,[rip+0x2481bb9]        # 0x14264a3f0
0x1401c8837: call   0x140ad9960
0x1401c883c: nop
0x1401c883d: lea    rcx,[rbp+0x24b0]
0x1401c8844: jmp    0x1401c8bde
0x1401c8849: lea    rdx,[rip+0x143b410]        # 0x141603c60  'Not under your control'
0x1401c8850: lea    rcx,[rbp+0x24d0]
0x1401c8857: call   0x140068150
0x1401c885c: nop
0x1401c885d: xor    r9d,r9d
0x1401c8860: xor    r8d,r8d
0x1401c8863: lea    rdx,[rbp+0x24d0]
0x1401c886a: lea    rcx,[rip+0x2481b7f]        # 0x14264a3f0
0x1401c8871: call   0x140ad9960
0x1401c8876: nop
0x1401c8877: lea    rcx,[rbp+0x24d0]
0x1401c887e: jmp    0x1401c8bde
0x1401c8883: lea    rdx,[rip+0x143b3ee]        # 0x141603c78  'No civilized inhabitants'
0x1401c888a: lea    rcx,[rbp+0x24f0]
0x1401c8891: call   0x140068150
0x1401c8896: nop
0x1401c8897: xor    r9d,r9d
0x1401c889a: xor    r8d,r8d
0x1401c889d: lea    rdx,[rbp+0x24f0]
0x1401c88a4: lea    rcx,[rip+0x2481b45]        # 0x14264a3f0
0x1401c88ab: call   0x140ad9960
0x1401c88b0: nop
0x1401c88b1: lea    rcx,[rbp+0x24f0]
0x1401c88b8: jmp    0x1401c8bde
0x1401c88bd: lea    rdx,[rip+0x143b3d4]        # 0x141603c98  'No requestable workers'
0x1401c88c4: lea    rcx,[rbp+0x2510]
0x1401c88cb: call   0x140068150
0x1401c88d0: nop
0x1401c88d1: xor    r9d,r9d
0x1401c88d4: xor    r8d,r8d
0x1401c88d7: lea    rdx,[rbp+0x2510]
0x1401c88de: lea    rcx,[rip+0x2481b0b]        # 0x14264a3f0
0x1401c88e5: call   0x140ad9960
0x1401c88ea: nop
0x1401c88eb: lea    rcx,[rbp+0x2510]
0x1401c88f2: jmp    0x1401c8bde
0x1401c88f7: lea    rdx,[rip+0x143b3b2]        # 0x141603cb0  'Inaccessible'
0x1401c88fe: lea    rcx,[rbp+0x2530]
0x1401c8905: call   0x140068150
0x1401c890a: nop
0x1401c890b: xor    r9d,r9d
0x1401c890e: xor    r8d,r8d
0x1401c8911: lea    rdx,[rbp+0x2530]
0x1401c8918: lea    rcx,[rip+0x2481ad1]        # 0x14264a3f0
0x1401c891f: call   0x140ad9960
0x1401c8924: nop
0x1401c8925: lea    rcx,[rbp+0x2530]
0x1401c892c: jmp    0x1401c8bde
0x1401c8931: lea    rdx,[rip+0x143b388]        # 0x141603cc0  'Need civilization military leader'
0x1401c8938: lea    rcx,[rbp+0x2550]
0x1401c893f: call   0x140068150
0x1401c8944: nop
0x1401c8945: xor    r9d,r9d
0x1401c8948: xor    r8d,r8d
0x1401c894b: lea    rdx,[rbp+0x2550]
0x1401c8952: lea    rcx,[rip+0x2481a97]        # 0x14264a3f0
0x1401c8959: call   0x140ad9960
0x1401c895e: nop
0x1401c895f: lea    rcx,[rbp+0x2550]
0x1401c8966: jmp    0x1401c8bde
0x1401c896b: lea    rdx,[rip+0x143b376]        # 0x141603ce8  'Need military leader'
0x1401c8972: lea    rcx,[rbp+0x2570]
0x1401c8979: call   0x140068150
0x1401c897e: nop
0x1401c897f: xor    r9d,r9d
0x1401c8982: xor    r8d,r8d
0x1401c8985: lea    rdx,[rbp+0x2570]
0x1401c898c: lea    rcx,[rip+0x2481a5d]        # 0x14264a3f0
0x1401c8993: call   0x140ad9960
0x1401c8998: nop
0x1401c8999: lea    rcx,[rbp+0x2570]
0x1401c89a0: jmp    0x1401c8bde
0x1401c89a5: lea    rdx,[rip+0x143b354]        # 0x141603d00  'Need leader'
0x1401c89ac: lea    rcx,[rbp+0x2590]
0x1401c89b3: call   0x140068150
0x1401c89b8: nop
0x1401c89b9: xor    r9d,r9d
0x1401c89bc: xor    r8d,r8d
0x1401c89bf: lea    rdx,[rbp+0x2590]
0x1401c89c6: lea    rcx,[rip+0x2481a23]        # 0x14264a3f0
0x1401c89cd: call   0x140ad9960
0x1401c89d2: nop
0x1401c89d3: lea    rcx,[rbp+0x2590]
0x1401c89da: jmp    0x1401c8bde
0x1401c89df: lea    rdx,[rip+0x143b32a]        # 0x141603d10  'Not trading'
0x1401c89e6: lea    rcx,[rbp+0x25b0]
0x1401c89ed: call   0x140068150
0x1401c89f2: nop
0x1401c89f3: xor    r9d,r9d
0x1401c89f6: xor    r8d,r8d
0x1401c89f9: lea    rdx,[rbp+0x25b0]
0x1401c8a00: lea    rcx,[rip+0x24819e9]        # 0x14264a3f0
0x1401c8a07: call   0x140ad9960
0x1401c8a0c: nop
0x1401c8a0d: lea    rcx,[rbp+0x25b0]
0x1401c8a14: jmp    0x1401c8bde
0x1401c8a19: lea    rdx,[rip+0x143b300]        # 0x141603d20  'Already trading'
0x1401c8a20: lea    rcx,[rbp+0x25d0]
0x1401c8a27: call   0x140068150
0x1401c8a2c: nop
0x1401c8a2d: xor    r9d,r9d
0x1401c8a30: xor    r8d,r8d
0x1401c8a33: lea    rdx,[rbp+0x25d0]
0x1401c8a3a: lea    rcx,[rip+0x24819af]        # 0x14264a3f0
0x1401c8a41: call   0x140ad9960
0x1401c8a46: nop
0x1401c8a47: lea    rcx,[rbp+0x25d0]
0x1401c8a4e: jmp    0x1401c8bde
0x1401c8a53: lea    rdx,[rip+0x143b2d6]        # 0x141603d30  'Already at war'
0x1401c8a5a: lea    rcx,[rbp+0x25f0]
0x1401c8a61: call   0x140068150
0x1401c8a66: nop
0x1401c8a67: xor    r9d,r9d
0x1401c8a6a: xor    r8d,r8d
0x1401c8a6d: lea    rdx,[rbp+0x25f0]
0x1401c8a74: lea    rcx,[rip+0x2481975]        # 0x14264a3f0
0x1401c8a7b: call   0x140ad9960
0x1401c8a80: nop
0x1401c8a81: lea    rcx,[rbp+0x25f0]
0x1401c8a88: jmp    0x1401c8bde
0x1401c8a8d: lea    rdx,[rip+0x143b2ac]        # 0x141603d40  'Already have peace'
0x1401c8a94: lea    rcx,[rbp+0x2610]
0x1401c8a9b: call   0x140068150
0x1401c8aa0: nop
0x1401c8aa1: xor    r9d,r9d
0x1401c8aa4: xor    r8d,r8d
0x1401c8aa7: lea    rdx,[rbp+0x2610]
0x1401c8aae: lea    rcx,[rip+0x248193b]        # 0x14264a3f0
0x1401c8ab5: call   0x140ad9960
0x1401c8aba: nop
0x1401c8abb: lea    rcx,[rbp+0x2610]
0x1401c8ac2: jmp    0x1401c8bde
0x1401c8ac7: lea    rdx,[rip+0x143b28a]        # 0x141603d58  'Already have alliance'
0x1401c8ace: lea    rcx,[rbp+0x2630]
0x1401c8ad5: call   0x140068150
0x1401c8ada: nop
0x1401c8adb: xor    r9d,r9d
0x1401c8ade: xor    r8d,r8d
0x1401c8ae1: lea    rdx,[rbp+0x2630]
0x1401c8ae8: lea    rcx,[rip+0x2481901]        # 0x14264a3f0
0x1401c8aef: call   0x140ad9960
0x1401c8af4: nop
0x1401c8af5: lea    rcx,[rbp+0x2630]
0x1401c8afc: jmp    0x1401c8bde
0x1401c8b01: lea    rdx,[rip+0x143b268]        # 0x141603d70  'At war'
0x1401c8b08: lea    rcx,[rbp+0x2650]
0x1401c8b0f: call   0x140068150
0x1401c8b14: nop
0x1401c8b15: xor    r9d,r9d
0x1401c8b18: xor    r8d,r8d
0x1401c8b1b: lea    rdx,[rbp+0x2650]
0x1401c8b22: lea    rcx,[rip+0x24818c7]        # 0x14264a3f0
0x1401c8b29: call   0x140ad9960
0x1401c8b2e: nop
0x1401c8b2f: lea    rcx,[rbp+0x2650]
0x1401c8b36: jmp    0x1401c8bde
0x1401c8b3b: lea    rdx,[rip+0x143b236]        # 0x141603d78  'Cannot communicate'
0x1401c8b42: lea    rcx,[rbp+0x2670]
0x1401c8b49: call   0x140068150
0x1401c8b4e: nop
0x1401c8b4f: xor    r9d,r9d
0x1401c8b52: xor    r8d,r8d
0x1401c8b55: lea    rdx,[rbp+0x2670]
0x1401c8b5c: lea    rcx,[rip+0x248188d]        # 0x14264a3f0
0x1401c8b63: call   0x140ad9960
0x1401c8b68: nop
0x1401c8b69: lea    rcx,[rbp+0x2670]
0x1401c8b70: jmp    0x1401c8bde
0x1401c8b72: lea    rdx,[rip+0x143b4f7]        # 0x141604070  'Not in contact'
0x1401c8b79: lea    rcx,[rbp+0x2690]
0x1401c8b80: call   0x140068150
0x1401c8b85: nop
0x1401c8b86: xor    r9d,r9d
0x1401c8b89: xor    r8d,r8d
0x1401c8b8c: lea    rdx,[rbp+0x2690]
0x1401c8b93: lea    rcx,[rip+0x2481856]        # 0x14264a3f0
0x1401c8b9a: call   0x140ad9960
0x1401c8b9f: nop
0x1401c8ba0: lea    rcx,[rbp+0x2690]
0x1401c8ba7: jmp    0x1401c8bde
0x1401c8ba9: lea    rdx,[rip+0x143b4d0]        # 0x141604080  'Too hostile'
0x1401c8bb0: lea    rcx,[rbp+0x26b0]
0x1401c8bb7: call   0x140068150
0x1401c8bbc: nop
0x1401c8bbd: xor    r9d,r9d
0x1401c8bc0: xor    r8d,r8d
0x1401c8bc3: lea    rdx,[rbp+0x26b0]
0x1401c8bca: lea    rcx,[rip+0x248181f]        # 0x14264a3f0
0x1401c8bd1: call   0x140ad9960
0x1401c8bd6: nop
0x1401c8bd7: lea    rcx,[rbp+0x26b0]
0x1401c8bde: call   0x140067e30
0x1401c8be3: add    r15d,0x3
0x1401c8be7: inc    ebx
0x1401c8be9: mov    QWORD PTR [rbp-0x78],rbx
0x1401c8bed: add    r14,0x4
0x1401c8bf1: cmp    ebx,0x1a
0x1401c8bf4: jl     0x1401c8566
0x1401c8bfa: lea    rcx,[rbp+0x1410]
0x1401c8c01: call   0x140067e30
0x1401c8c06: nop
0x1401c8c07: lea    rcx,[rbp+0xf10]
0x1401c8c0e: jmp    0x1401c605e
0x1401c8c13: mov    r13d,DWORD PTR [rbp-0x18]
0x1401c8c17: mov    DWORD PTR [rbp-0x20],r13d
0x1401c8c1b: lea    ebx,[r13-0x37]
0x1401c8c1f: mov    DWORD PTR [rbp-0x60],ebx
0x1401c8c22: lea    ecx,[rbx-0x2]
0x1401c8c25: mov    DWORD PTR [rbp-0x48],ecx
0x1401c8c28: mov    eax,DWORD PTR [rip+0x2204b5a]        # 0x1423cd788
0x1401c8c2e: dec    eax
0x1401c8c30: mov    DWORD PTR [rbp-0x70],eax
0x1401c8c33: lea    r15d,[r13-0xb]
0x1401c8c37: mov    DWORD PTR [rsp+0x70],r15d
0x1401c8c3c: lea    r12d,[r13-0x1]
0x1401c8c40: mov    DWORD PTR [rbp-0x58],r12d
0x1401c8c44: mov    edi,r13d
0x1401c8c47: mov    r14d,esi
0x1401c8c4a: cmp    eax,0x2a
0x1401c8c4d: jle    0x1401c8c59
0x1401c8c4f: mov    eax,0x2a
0x1401c8c54: mov    DWORD PTR [rbp-0x70],eax
0x1401c8c57: jmp    0x1401c8c70
0x1401c8c59: mov    DWORD PTR [rsp+0x70],r15d
0x1401c8c5e: mov    DWORD PTR [rbp-0x58],r12d
0x1401c8c62: test   eax,eax
0x1401c8c64: js     0x1401c8d55
0x1401c8c6a: nop    WORD PTR [rax+rax*1+0x0]
0x1401c8c70: mov    ebx,ecx
0x1401c8c72: cmp    ecx,edi
0x1401c8c74: jg     0x1401c8d37
0x1401c8c7a: movsxd r15,eax
0x1401c8c7d: mov    r12d,DWORD PTR [rbp-0x48]
0x1401c8c81: mov    r8d,ebx
0x1401c8c84: mov    edx,r14d
0x1401c8c87: lea    rcx,[rip+0x2481762]        # 0x14264a3f0
0x1401c8c8e: call   0x1400bb120
0x1401c8c93: xor    r8d,r8d
0x1401c8c96: xor    edx,edx
0x1401c8c98: lea    rcx,[rip+0x2481751]        # 0x14264a3f0
0x1401c8c9f: call   0x1400bb190
0x1401c8ca4: test   rsi,rsi
0x1401c8ca7: jne    0x1401c8cd1
0x1401c8ca9: cmp    ebx,r12d
0x1401c8cac: jne    0x1401c8cb6
0x1401c8cae: mov    edx,DWORD PTR [rip+0x2483060]        # 0x14264bd14
0x1401c8cb4: jmp    0x1401c8d1b
0x1401c8cb6: lea    rcx,[rip+0x2481733]        # 0x14264a3f0
0x1401c8cbd: cmp    ebx,edi
0x1401c8cbf: jne    0x1401c8cc9
0x1401c8cc1: mov    edx,DWORD PTR [rip+0x2483065]        # 0x14264bd2c
0x1401c8cc7: jmp    0x1401c8d22
0x1401c8cc9: mov    edx,DWORD PTR [rip+0x2483051]        # 0x14264bd20
0x1401c8ccf: jmp    0x1401c8d22
0x1401c8cd1: cmp    rsi,r15
0x1401c8cd4: jne    0x1401c8cfe
0x1401c8cd6: cmp    ebx,r12d
0x1401c8cd9: jne    0x1401c8ce3
0x1401c8cdb: mov    edx,DWORD PTR [rip+0x248303b]        # 0x14264bd1c
0x1401c8ce1: jmp    0x1401c8d1b
0x1401c8ce3: lea    rcx,[rip+0x2481706]        # 0x14264a3f0
0x1401c8cea: cmp    ebx,edi
0x1401c8cec: jne    0x1401c8cf6
0x1401c8cee: mov    edx,DWORD PTR [rip+0x2483040]        # 0x14264bd34
0x1401c8cf4: jmp    0x1401c8d22
0x1401c8cf6: mov    edx,DWORD PTR [rip+0x248302c]        # 0x14264bd28
0x1401c8cfc: jmp    0x1401c8d22
0x1401c8cfe: cmp    ebx,r12d
0x1401c8d01: jne    0x1401c8d0b
0x1401c8d03: mov    edx,DWORD PTR [rip+0x248300f]        # 0x14264bd18
0x1401c8d09: jmp    0x1401c8d1b
0x1401c8d0b: cmp    ebx,edi
0x1401c8d0d: mov    edx,DWORD PTR [rip+0x248301d]        # 0x14264bd30
0x1401c8d13: je     0x1401c8d1b
0x1401c8d15: mov    edx,DWORD PTR [rip+0x2483009]        # 0x14264bd24
0x1401c8d1b: lea    rcx,[rip+0x24816ce]        # 0x14264a3f0
0x1401c8d22: call   0x140adaad0
0x1401c8d27: inc    ebx
0x1401c8d29: cmp    ebx,edi
0x1401c8d2b: jle    0x1401c8c81
0x1401c8d31: mov    ecx,r12d
0x1401c8d34: mov    eax,DWORD PTR [rbp-0x70]
0x1401c8d37: inc    r14d
0x1401c8d3a: inc    rsi
0x1401c8d3d: cmp    r14d,eax
0x1401c8d40: jle    0x1401c8c70
0x1401c8d46: mov    r12d,DWORD PTR [rbp-0x58]
0x1401c8d4a: mov    r15d,DWORD PTR [rsp+0x70]
0x1401c8d4f: lea    ebx,[r13-0x37]
0x1401c8d53: xor    esi,esi
0x1401c8d55: mov    rax,QWORD PTR [rsp+0x78]
0x1401c8d5a: lea    rcx,[rax+0x2b8]
0x1401c8d61: movsxd rdx,DWORD PTR [rax+0x2d8]
0x1401c8d68: call   0x14006f220
0x1401c8d6d: mov    r14,QWORD PTR [rax]
0x1401c8d70: mov    QWORD PTR [rbp-0x78],r14
0x1401c8d74: xor    r8d,r8d
0x1401c8d77: mov    edx,0x3
0x1401c8d7c: mov    r9b,0x1
0x1401c8d7f: lea    rcx,[rip+0x248166a]        # 0x14264a3f0
0x1401c8d86: call   0x1400bb130
0x1401c8d8b: lea    rcx,[rbp+0xd30]
0x1401c8d92: call   0x14006f690
0x1401c8d97: nop
0x1401c8d98: mov    rcx,r14
0x1401c8d9b: call   0x140075110
0x1401c8da0: mov    edi,0x1
0x1401c8da5: sub    eax,0x2
0x1401c8da8: je     0x1401c8e89
0x1401c8dae: sub    eax,0xf
0x1401c8db1: je     0x1401c8e51
0x1401c8db7: sub    eax,edi
0x1401c8db9: je     0x1401c8dff
0x1401c8dbb: sub    eax,edi
0x1401c8dbd: je     0x1401c8df3
0x1401c8dbf: cmp    eax,0x6
0x1401c8dc2: jne    0x1401c8f0e
0x1401c8dc8: lea    rdx,[rbp+0xd30]
0x1401c8dcf: mov    rcx,QWORD PTR [r14+0x130]
0x1401c8dd6: call   0x1401bb400
0x1401c8ddb: lea    rdx,[rip+0x143927a]        # 0x14160205c  ' at '
0x1401c8de2: lea    rcx,[rbp+0xd30]
0x1401c8de9: call   0x14006f560
0x1401c8dee: jmp    0x1401c8ef4
0x1401c8df3: lea    rdx,[rip+0x143ac2e]        # 0x141603a28  'Request workers from '
0x1401c8dfa: jmp    0x1401c8ee8
0x1401c8dff: lea    rdx,[rip+0x142551a]        # 0x1415ee320  'Rescue '
0x1401c8e06: lea    rcx,[rbp+0xd30]
0x1401c8e0d: call   0x14006f580
0x1401c8e12: lea    rcx,[rbp+0x670]
0x1401c8e19: call   0x140072080
0x1401c8e1e: mov    r8,QWORD PTR [r14+0x130]
0x1401c8e25: mov    WORD PTR [rsp+0x28],di
0x1401c8e2a: mov    WORD PTR [rsp+0x20],di
0x1401c8e2f: lea    r9,[rbp+0x670]
0x1401c8e36: mov    r8d,DWORD PTR [r8]
0x1401c8e39: lea    rdx,[rbp+0xd30]
0x1401c8e40: lea    rcx,[rip+0x2330e71]        # 0x1424f9cb8
0x1401c8e47: call   0x140b92f10
0x1401c8e4c: jmp    0x1401c8f0e
0x1401c8e51: lea    rdx,[rip+0x143af58]        # 0x141603db0  'Recover '
0x1401c8e58: lea    rcx,[rbp+0xd30]
0x1401c8e5f: call   0x14006f580
0x1401c8e64: mov    r8,QWORD PTR [r14+0x130]
0x1401c8e6b: xor    r9d,r9d
0x1401c8e6e: mov    r8d,DWORD PTR [r8]
0x1401c8e71: lea    rdx,[rbp+0xd30]
0x1401c8e78: lea    rcx,[rip+0x2330e39]        # 0x1424f9cb8
0x1401c8e7f: call   0x140b94400
0x1401c8e84: jmp    0x1401c8f0e
0x1401c8e89: mov    rax,QWORD PTR [r14+0x130]
0x1401c8e90: movsxd rcx,DWORD PTR [rax]
0x1401c8e93: cmp    ecx,0x6
0x1401c8e96: ja     0x1401c8ee1
0x1401c8e98: lea    rdx,[rip+0xffffffffffe37161]        # 0x140000000
0x1401c8e9f: mov    ecx,DWORD PTR [rdx+rcx*4+0x1d38d4]
0x1401c8ea6: add    rcx,rdx
0x1401c8ea9: jmp    rcx
0x1401c8eab: lea    rdx,[rip+0x143ab8e]        # 0x141603a40  'Explore '
0x1401c8eb2: jmp    0x1401c8ee8
0x1401c8eb4: lea    rdx,[rip+0x143ab95]        # 0x141603a50  'Pillage '
0x1401c8ebb: jmp    0x1401c8ee8
0x1401c8ebd: lea    rdx,[rip+0x143ab9c]        # 0x141603a60  'Demand tribute from '
0x1401c8ec4: jmp    0x1401c8ee8
0x1401c8ec6: lea    rdx,[rip+0x143abab]        # 0x141603a78  'Raze '
0x1401c8ecd: jmp    0x1401c8ee8
0x1401c8ecf: lea    rdx,[rip+0x143aeba]        # 0x141603d90  'Take over '
0x1401c8ed6: jmp    0x1401c8ee8
0x1401c8ed8: lea    rdx,[rip+0x143aebd]        # 0x141603d9c  'Seize '
0x1401c8edf: jmp    0x1401c8ee8
0x1401c8ee1: lea    rdx,[rip+0x143aebc]        # 0x141603da4  'Raid '
0x1401c8ee8: lea    rcx,[rbp+0xd30]
0x1401c8eef: call   0x14006f580
0x1401c8ef4: xor    r9d,r9d
0x1401c8ef7: mov    r8d,DWORD PTR [r14+0x8]
0x1401c8efb: lea    rdx,[rbp+0xd30]
0x1401c8f02: lea    rcx,[rip+0x2330daf]        # 0x1424f9cb8
0x1401c8f09: call   0x140b93930
0x1401c8f0e: mov    r8d,ebx
0x1401c8f11: mov    edx,edi
0x1401c8f13: lea    rcx,[rip+0x24814d6]        # 0x14264a3f0
0x1401c8f1a: call   0x1400bb120
0x1401c8f1f: lea    rcx,[rbp+0xd30]
0x1401c8f26: call   0x14006f330
0x1401c8f2b: xor    r9d,r9d
0x1401c8f2e: xor    r8d,r8d
0x1401c8f31: lea    rdx,[rbp+0xd30]
0x1401c8f38: lea    rcx,[rip+0x24814b1]        # 0x14264a3f0
0x1401c8f3f: call   0x140ad9960
0x1401c8f44: mov    rcx,r14
0x1401c8f47: call   0x140075110
0x1401c8f4c: cmp    eax,0x13
0x1401c8f4f: je     0x1401c923a
0x1401c8f55: cmp    eax,0x19
0x1401c8f58: je     0x1401c923a
0x1401c8f5e: mov    edi,esi
0x1401c8f60: lea    rdx,[rbp+0x98]
0x1401c8f67: lea    rcx,[r14+0x80]
0x1401c8f6e: call   0x14006f240
0x1401c8f73: lea    rdx,[rbp+0x148]
0x1401c8f7a: lea    rcx,[r14+0x80]
0x1401c8f81: call   0x14006f230
0x1401c8f86: lea    r8,[rbp+0x148]
0x1401c8f8d: lea    rdx,[rbp+0x10]
0x1401c8f91: lea    rcx,[rbp+0x98]
0x1401c8f98: call   0x14006ee20
0x1401c8f9d: mov    BYTE PTR [rbp-0x80],0x0
0x1401c8fa1: xor    edx,edx
0x1401c8fa3: movzx  ecx,BYTE PTR [rax]
0x1401c8fa6: call   0x1400657b0
0x1401c8fab: test   al,al
0x1401c8fad: je     0x1401c9074
0x1401c8fb3: lea    rcx,[rbp+0x98]
0x1401c8fba: call   0x14006ee10
0x1401c8fbf: mov    edx,DWORD PTR [rax]
0x1401c8fc1: lea    rcx,[rip+0x231a7f8]        # 0x1424e37c0
0x1401c8fc8: call   0x140075500
0x1401c8fcd: mov    BYTE PTR [rbp-0x80],0x0
0x1401c8fd1: test   rax,rax
0x1401c8fd4: je     0x1401c903f
0x1401c8fd6: lea    rbx,[rax+0xa0]
0x1401c8fdd: mov    BYTE PTR [rbp-0x80],0x0
0x1401c8fe1: mov    rcx,rbx
0x1401c8fe4: call   0x14006ee50
0x1401c8fe9: test   rax,rax
0x1401c8fec: je     0x1401c903f
0x1401c8fee: xor    edx,edx
0x1401c8ff0: mov    rcx,rbx
0x1401c8ff3: call   0x14006f220
0x1401c8ff8: mov    BYTE PTR [rbp-0x80],0x0
0x1401c8ffc: mov    rax,QWORD PTR [rax]
0x1401c8fff: cmp    DWORD PTR [rax],0xffffffff
0x1401c9002: je     0x1401c903f
0x1401c9004: xor    edx,edx
0x1401c9006: mov    rcx,rbx
0x1401c9009: call   0x14006f220
0x1401c900e: mov    rdx,QWORD PTR [rax]
0x1401c9011: mov    edx,DWORD PTR [rdx]
0x1401c9013: lea    rcx,[rip+0x221c096]        # 0x1423e50b0
0x1401c901a: call   0x1413cc4d0
0x1401c901f: test   rax,rax
0x1401c9022: je     0x1401c9039
0x1401c9024: mov    eax,DWORD PTR [rax+0x110]
0x1401c902a: test   eax,0x102
0x1401c902f: jne    0x1401c9039
0x1401c9031: test   eax,eax
0x1401c9033: jns    0x1401c9039
0x1401c9035: inc    edi
0x1401c9037: jmp    0x1401c903b
0x1401c9039: inc    esi
0x1401c903b: mov    BYTE PTR [rbp-0x80],0x0
0x1401c903f: lea    rcx,[rbp+0x98]
0x1401c9046: call   0x14006f350
0x1401c904b: lea    r8,[rbp+0x148]
0x1401c9052: lea    rdx,[rbp+0x10]
0x1401c9056: lea    rcx,[rbp+0x98]
0x1401c905d: call   0x14006ee20
0x1401c9062: xor    edx,edx
0x1401c9064: movzx  ecx,BYTE PTR [rax]
0x1401c9067: call   0x1400657b0
0x1401c906c: test   al,al
0x1401c906e: jne    0x1401c8fb3
0x1401c9074: lea    r8d,[r13-0x37]
0x1401c9078: mov    edx,0x2
0x1401c907d: lea    rcx,[rip+0x248136c]        # 0x14264a3f0
0x1401c9084: call   0x1400bb120
0x1401c9089: lea    eax,[rsi+rdi*1]
0x1401c908c: test   eax,eax
0x1401c908e: jne    0x1401c90e1
0x1401c9090: xor    r8d,r8d
0x1401c9093: mov    edx,0x7
0x1401c9098: xor    r9d,r9d
0x1401c909b: lea    rcx,[rip+0x248134e]        # 0x14264a3f0
0x1401c90a2: call   0x1400bb130
0x1401c90a7: lea    rdx,[rip+0x143ad52]        # 0x141603e00  'No commanders'
0x1401c90ae: lea    rcx,[rbp+0x26d0]
0x1401c90b5: call   0x140068150
0x1401c90ba: nop
0x1401c90bb: xor    r9d,r9d
0x1401c90be: xor    r8d,r8d
0x1401c90c1: lea    rdx,[rbp+0x26d0]
0x1401c90c8: lea    rcx,[rip+0x2481321]        # 0x14264a3f0
0x1401c90cf: call   0x140ad9960
0x1401c90d4: nop
0x1401c90d5: lea    rcx,[rbp+0x26d0]
0x1401c90dc: jmp    0x1401c9523
0x1401c90e1: lea    rcx,[rbp+0xdb0]
0x1401c90e8: call   0x14006f690
0x1401c90ed: nop
0x1401c90ee: test   edi,edi
0x1401c90f0: jne    0x1401c911a
0x1401c90f2: lea    rdx,[rip+0x143acd7]        # 0x141603dd0  'no'
0x1401c90f9: lea    rcx,[rbp+0xdb0]
0x1401c9100: call   0x14006f560
0x1401c9105: lea    rdx,[rip+0x143ad04]        # 0x141603e10  ' commander'
0x1401c910c: lea    rcx,[rbp+0xdb0]
0x1401c9113: call   0x14006f560
0x1401c9118: jmp    0x1401c9140
0x1401c911a: lea    rdx,[rbp+0xdb0]
0x1401c9121: mov    ecx,edi
0x1401c9123: call   0x14052c130
0x1401c9128: lea    rdx,[rip+0x143ace1]        # 0x141603e10  ' commander'
0x1401c912f: lea    rcx,[rbp+0xdb0]
0x1401c9136: call   0x14006f560
0x1401c913b: cmp    edi,0x1
0x1401c913e: je     0x1401c9153
0x1401c9140: lea    rdx,[rip+0x1420151]        # 0x1415e9298  's'
0x1401c9147: lea    rcx,[rbp+0xdb0]
0x1401c914e: call   0x14006f560
0x1401c9153: lea    rdx,[rip+0x143ac8a]        # 0x141603de4  ' here'
0x1401c915a: lea    rcx,[rbp+0xdb0]
0x1401c9161: call   0x14006f560
0x1401c9166: lea    rdx,[rip+0x141ff6b]        # 0x1415e90d8  ', '
0x1401c916d: lea    rcx,[rbp+0xdb0]
0x1401c9174: call   0x14006f560
0x1401c9179: test   esi,esi
0x1401c917b: jne    0x1401c91a5
0x1401c917d: lea    rdx,[rip+0x143ac4c]        # 0x141603dd0  'no'
0x1401c9184: lea    rcx,[rbp+0xdb0]
0x1401c918b: call   0x14006f560
0x1401c9190: lea    rdx,[rip+0x143ac79]        # 0x141603e10  ' commander'
0x1401c9197: lea    rcx,[rbp+0xdb0]
0x1401c919e: call   0x14006f560
0x1401c91a3: jmp    0x1401c91cb
0x1401c91a5: lea    rdx,[rbp+0xdb0]
0x1401c91ac: mov    ecx,esi
0x1401c91ae: call   0x14052c130
0x1401c91b3: lea    rdx,[rip+0x143ac56]        # 0x141603e10  ' commander'
0x1401c91ba: lea    rcx,[rbp+0xdb0]
0x1401c91c1: call   0x14006f560
0x1401c91c6: cmp    esi,0x1
0x1401c91c9: je     0x1401c91de
0x1401c91cb: lea    rdx,[rip+0x14200c6]        # 0x1415e9298  's'
0x1401c91d2: lea    rcx,[rbp+0xdb0]
0x1401c91d9: call   0x14006f560
0x1401c91de: lea    rdx,[rip+0x143ac0b]        # 0x141603df0  ' traveling'
0x1401c91e5: lea    rcx,[rbp+0xdb0]
0x1401c91ec: call   0x14006f560
0x1401c91f1: lea    rcx,[rbp+0xdb0]
0x1401c91f8: call   0x14052d650
0x1401c91fd: xor    r8d,r8d
0x1401c9200: mov    edx,0x7
0x1401c9205: mov    r9b,0x1
0x1401c9208: lea    rcx,[rip+0x24811e1]        # 0x14264a3f0
0x1401c920f: call   0x1400bb130
0x1401c9214: xor    r9d,r9d
0x1401c9217: xor    r8d,r8d
0x1401c921a: lea    rdx,[rbp+0xdb0]
0x1401c9221: lea    rcx,[rip+0x24811c8]        # 0x14264a3f0
0x1401c9228: call   0x140ad9960
0x1401c922d: nop
0x1401c922e: lea    rcx,[rbp+0xdb0]
0x1401c9235: jmp    0x1401c9523
0x1401c923a: mov    BYTE PTR [rbp-0x80],dil
0x1401c923e: lea    rdx,[rbp+0xa0]
0x1401c9245: lea    rcx,[r14+0x98]
0x1401c924c: call   0x14006f240
0x1401c9251: lea    rdx,[rbp+0x158]
0x1401c9258: lea    rcx,[r14+0x98]
0x1401c925f: call   0x14006f230
0x1401c9264: lea    rcx,[r14+0xb0]
0x1401c926b: lea    rdx,[rbp+0x150]
0x1401c9272: call   0x14006f240
0x1401c9277: lea    r8,[rbp+0x158]
0x1401c927e: lea    rdx,[rbp+0x11]
0x1401c9282: lea    rcx,[rbp+0xa0]
0x1401c9289: call   0x14006ee20
0x1401c928e: mov    edi,esi
0x1401c9290: xor    edx,edx
0x1401c9292: movzx  ecx,BYTE PTR [rax]
0x1401c9295: call   0x1400657b0
0x1401c929a: test   al,al
0x1401c929c: je     0x1401c9362
0x1401c92a2: mov    BYTE PTR [rbp-0x80],0x1
0x1401c92a6: xor    eax,eax
0x1401c92a8: mov    edi,eax
0x1401c92aa: mov    esi,eax
0x1401c92ac: nop    DWORD PTR [rax+0x0]
0x1401c92b0: lea    rcx,[rbp+0xa0]
0x1401c92b7: call   0x14006ee10
0x1401c92bc: mov    edx,DWORD PTR [rax]
0x1401c92be: lea    rcx,[rip+0x2208533]        # 0x1423d17f8
0x1401c92c5: call   0x14007daf0
0x1401c92ca: mov    rbx,rax
0x1401c92cd: test   rax,rax
0x1401c92d0: je     0x1401c9321
0x1401c92d2: lea    rcx,[rbp+0x150]
0x1401c92d9: call   0x14006ee10
0x1401c92de: lea    rdx,[rbx+0x1110]
0x1401c92e5: mov    ecx,DWORD PTR [rax]
0x1401c92e7: call   0x1400b9dc0
0x1401c92ec: test   rax,rax
0x1401c92ef: je     0x1401c9321
0x1401c92f1: mov    edx,DWORD PTR [rax+0x4]
0x1401c92f4: cmp    edx,0xffffffff
0x1401c92f7: je     0x1401c9321
0x1401c92f9: lea    rcx,[rip+0x221bdb0]        # 0x1423e50b0
0x1401c9300: call   0x1413cc4d0
0x1401c9305: test   rax,rax
0x1401c9308: je     0x1401c931f
0x1401c930a: mov    eax,DWORD PTR [rax+0x110]
0x1401c9310: test   eax,0x102
0x1401c9315: jne    0x1401c931f
0x1401c9317: test   eax,eax
0x1401c9319: jns    0x1401c931f
0x1401c931b: inc    edi
0x1401c931d: jmp    0x1401c9321
0x1401c931f: inc    esi
0x1401c9321: lea    rcx,[rbp+0xa0]
0x1401c9328: call   0x14006f350
0x1401c932d: lea    rcx,[rbp+0x150]
0x1401c9334: call   0x14006f350
0x1401c9339: lea    r8,[rbp+0x158]
0x1401c9340: lea    rdx,[rbp+0x11]
0x1401c9344: lea    rcx,[rbp+0xa0]
0x1401c934b: call   0x14006ee20
0x1401c9350: xor    edx,edx
0x1401c9352: movzx  ecx,BYTE PTR [rax]
0x1401c9355: call   0x1400657b0
0x1401c935a: test   al,al
0x1401c935c: jne    0x1401c92b0
0x1401c9362: lea    r8d,[r13-0x37]
0x1401c9366: mov    edx,0x2
0x1401c936b: lea    rcx,[rip+0x248107e]        # 0x14264a3f0
0x1401c9372: call   0x1400bb120
0x1401c9377: lea    eax,[rsi+rdi*1]
0x1401c937a: test   eax,eax
0x1401c937c: jne    0x1401c93cf
0x1401c937e: xor    r8d,r8d
0x1401c9381: mov    edx,0x7
0x1401c9386: xor    r9d,r9d
0x1401c9389: lea    rcx,[rip+0x2481060]        # 0x14264a3f0
0x1401c9390: call   0x1400bb130
0x1401c9395: lea    rdx,[rip+0x143aa24]        # 0x141603dc0  'No messengers'
0x1401c939c: lea    rcx,[rbp+0x26f0]
0x1401c93a3: call   0x140068150
0x1401c93a8: nop
0x1401c93a9: xor    r9d,r9d
0x1401c93ac: xor    r8d,r8d
0x1401c93af: lea    rdx,[rbp+0x26f0]
0x1401c93b6: lea    rcx,[rip+0x2481033]        # 0x14264a3f0
0x1401c93bd: call   0x140ad9960
0x1401c93c2: nop
0x1401c93c3: lea    rcx,[rbp+0x26f0]
0x1401c93ca: jmp    0x1401c9523
0x1401c93cf: lea    rcx,[rbp+0xdd0]
0x1401c93d6: call   0x14006f690
0x1401c93db: nop
0x1401c93dc: test   edi,edi
0x1401c93de: jne    0x1401c9408
0x1401c93e0: lea    rdx,[rip+0x143a9e9]        # 0x141603dd0  'no'
0x1401c93e7: lea    rcx,[rbp+0xdd0]
0x1401c93ee: call   0x14006f560
0x1401c93f3: lea    rdx,[rip+0x143a9de]        # 0x141603dd8  ' messenger'
0x1401c93fa: lea    rcx,[rbp+0xdd0]
0x1401c9401: call   0x14006f560
0x1401c9406: jmp    0x1401c942e
0x1401c9408: lea    rdx,[rbp+0xdd0]
0x1401c940f: mov    ecx,edi
0x1401c9411: call   0x14052c130
0x1401c9416: lea    rdx,[rip+0x143a9bb]        # 0x141603dd8  ' messenger'
0x1401c941d: lea    rcx,[rbp+0xdd0]
0x1401c9424: call   0x14006f560
0x1401c9429: cmp    edi,0x1
0x1401c942c: je     0x1401c9441
0x1401c942e: lea    rdx,[rip+0x141fe63]        # 0x1415e9298  's'
0x1401c9435: lea    rcx,[rbp+0xdd0]
0x1401c943c: call   0x14006f560
0x1401c9441: lea    rdx,[rip+0x143a99c]        # 0x141603de4  ' here'
0x1401c9448: lea    rcx,[rbp+0xdd0]
0x1401c944f: call   0x14006f560
0x1401c9454: lea    rdx,[rip+0x141fc7d]        # 0x1415e90d8  ', '
0x1401c945b: lea    rcx,[rbp+0xdd0]
0x1401c9462: call   0x14006f560
0x1401c9467: test   esi,esi
0x1401c9469: jne    0x1401c9493
0x1401c946b: lea    rdx,[rip+0x143a95e]        # 0x141603dd0  'no'
0x1401c9472: lea    rcx,[rbp+0xdd0]
0x1401c9479: call   0x14006f560
0x1401c947e: lea    rdx,[rip+0x143a953]        # 0x141603dd8  ' messenger'
0x1401c9485: lea    rcx,[rbp+0xdd0]
0x1401c948c: call   0x14006f560
0x1401c9491: jmp    0x1401c94b9
0x1401c9493: lea    rdx,[rbp+0xdd0]
0x1401c949a: mov    ecx,esi
0x1401c949c: call   0x14052c130
0x1401c94a1: lea    rdx,[rip+0x143a930]        # 0x141603dd8  ' messenger'
0x1401c94a8: lea    rcx,[rbp+0xdd0]
0x1401c94af: call   0x14006f560
0x1401c94b4: cmp    esi,0x1
0x1401c94b7: je     0x1401c94cc
0x1401c94b9: lea    rdx,[rip+0x141fdd8]        # 0x1415e9298  's'
0x1401c94c0: lea    rcx,[rbp+0xdd0]
0x1401c94c7: call   0x14006f560
0x1401c94cc: lea    rdx,[rip+0x143a91d]        # 0x141603df0  ' traveling'
0x1401c94d3: lea    rcx,[rbp+0xdd0]
0x1401c94da: call   0x14006f560
0x1401c94df: lea    rcx,[rbp+0xdd0]
0x1401c94e6: call   0x14052d650
0x1401c94eb: xor    r8d,r8d
0x1401c94ee: mov    edx,0x7
0x1401c94f3: mov    r9b,0x1
0x1401c94f6: lea    rcx,[rip+0x2480ef3]        # 0x14264a3f0
0x1401c94fd: call   0x1400bb130
0x1401c9502: xor    r9d,r9d
0x1401c9505: xor    r8d,r8d
0x1401c9508: lea    rdx,[rbp+0xdd0]
0x1401c950f: lea    rcx,[rip+0x2480eda]        # 0x14264a3f0
0x1401c9516: call   0x140ad9960
0x1401c951b: nop
0x1401c951c: lea    rcx,[rbp+0xdd0]
0x1401c9523: call   0x140067e30
0x1401c9528: mov    r14d,r15d
0x1401c952b: cmp    r15d,r12d
0x1401c952e: jg     0x1401c95a3
0x1401c9530: movsxd r15,r15d
0x1401c9533: movsxd r13,r12d
0x1401c9536: mov    rsi,r15
0x1401c9539: lea    r12,[rip+0x24829a8]        # 0x14264bee8
0x1401c9540: mov    edi,0x1
0x1401c9545: lea    rbx,[rip+0x2482990]        # 0x14264bedc
0x1401c954c: nop    DWORD PTR [rax+0x0]
0x1401c9550: mov    r8d,r14d
0x1401c9553: mov    edx,edi
0x1401c9555: lea    rcx,[rip+0x2480e94]        # 0x14264a3f0
0x1401c955c: call   0x1400bb120
0x1401c9561: cmp    rsi,r15
0x1401c9564: jne    0x1401c956b
0x1401c9566: mov    edx,DWORD PTR [rbx-0x18]
0x1401c9569: jmp    0x1401c9577
0x1401c956b: cmp    rsi,r13
0x1401c956e: jne    0x1401c9574
0x1401c9570: mov    edx,DWORD PTR [rbx]
0x1401c9572: jmp    0x1401c9577
0x1401c9574: mov    edx,DWORD PTR [rbx-0xc]
0x1401c9577: lea    rcx,[rip+0x2480e72]        # 0x14264a3f0
0x1401c957e: call   0x140adaad0
0x1401c9583: inc    edi
0x1401c9585: add    rbx,0x4
0x1401c9589: cmp    rbx,r12
0x1401c958c: jl     0x1401c9550
0x1401c958e: inc    r14d
0x1401c9591: inc    rsi
0x1401c9594: cmp    r14d,DWORD PTR [rbp-0x58]
0x1401c9598: jle    0x1401c9540
0x1401c959a: mov    r13d,DWORD PTR [rbp-0x20]
0x1401c959e: mov    r15d,DWORD PTR [rsp+0x70]
0x1401c95a3: xor    r8d,r8d
0x1401c95a6: mov    edx,0x7
0x1401c95ab: mov    r9b,0x1
0x1401c95ae: lea    rcx,[rip+0x2480e3b]        # 0x14264a3f0
0x1401c95b5: call   0x1400bb130
0x1401c95ba: lea    r8d,[r15+0x2]
0x1401c95be: mov    edx,0x2
0x1401c95c3: lea    rcx,[rip+0x2480e26]        # 0x14264a3f0
0x1401c95ca: call   0x1400bb120
0x1401c95cf: lea    rdx,[rip+0x143aab6]        # 0x14160408c  'Remove'
0x1401c95d6: lea    rcx,[rbp+0x2710]
0x1401c95dd: call   0x140068150
0x1401c95e2: nop
0x1401c95e3: xor    r9d,r9d
0x1401c95e6: xor    r8d,r8d
0x1401c95e9: lea    rdx,[rbp+0x2710]
0x1401c95f0: lea    rcx,[rip+0x2480df9]        # 0x14264a3f0
0x1401c95f7: call   0x140ad9960
0x1401c95fc: nop
0x1401c95fd: lea    rcx,[rbp+0x2710]
0x1401c9604: call   0x140067e30
0x1401c9609: mov    r12,QWORD PTR [rbp-0x78]
0x1401c960d: mov    rcx,r12
0x1401c9610: call   0x140075110
0x1401c9615: cmp    eax,0x2
0x1401c9618: je     0x1401ca65d
0x1401c961e: cmp    eax,0x13
0x1401c9621: je     0x1401c9edf
0x1401c9627: cmp    eax,0x19
0x1401c962a: jne    0x1401c9e72
0x1401c9630: mov    edi,DWORD PTR [rbp-0x48]
0x1401c9633: add    edi,0x2
0x1401c9636: add    r13d,0xfffffffe
0x1401c963a: xor    eax,eax
0x1401c963c: movzx  r14d,ax
0x1401c9640: mov    r12d,0x7
0x1401c9646: mov    DWORD PTR [rbp-0x58],r12d
0x1401c964a: mov    rsi,QWORD PTR [rsp+0x78]
0x1401c964f: add    rsi,0x3f8
0x1401c9656: cmp    DWORD PTR [rsi],0x1
0x1401c9659: je     0x1401c9e5b
0x1401c965f: mov    ebx,edi
0x1401c9661: cmp    edi,r13d
0x1401c9664: jg     0x1401c987e
0x1401c966a: nop    WORD PTR [rax+rax*1+0x0]
0x1401c9670: mov    r8d,ebx
0x1401c9673: lea    edx,[r12-0x2]
0x1401c9678: lea    rcx,[rip+0x2480d71]        # 0x14264a3f0
0x1401c967f: call   0x1400bb120
0x1401c9684: cmp    DWORD PTR [rsi],0x0
0x1401c9687: je     0x1401c96b1
0x1401c9689: cmp    ebx,edi
0x1401c968b: jne    0x1401c9695
0x1401c968d: mov    edx,DWORD PTR [rip+0x2482831]        # 0x14264bec4
0x1401c9693: jmp    0x1401c970f
0x1401c9695: lea    rcx,[rip+0x2480d54]        # 0x14264a3f0
0x1401c969c: cmp    ebx,r13d
0x1401c969f: jne    0x1401c96a9
0x1401c96a1: mov    edx,DWORD PTR [rip+0x2482835]        # 0x14264bedc
0x1401c96a7: jmp    0x1401c9716
0x1401c96a9: mov    edx,DWORD PTR [rip+0x2482821]        # 0x14264bed0
0x1401c96af: jmp    0x1401c9716
0x1401c96b1: mov    rax,QWORD PTR [rbp-0x78]
0x1401c96b5: mov    rdx,QWORD PTR [rax+0x130]
0x1401c96bc: movzx  ecx,r14w
0x1401c96c0: call   0x14006fed0
0x1401c96c5: cmp    eax,0xffffffff
0x1401c96c8: je     0x1401c96f2
0x1401c96ca: cmp    ebx,edi
0x1401c96cc: jne    0x1401c96d6
0x1401c96ce: mov    edx,DWORD PTR [rip+0x24827a8]        # 0x14264be7c
0x1401c96d4: jmp    0x1401c970f
0x1401c96d6: lea    rcx,[rip+0x2480d13]        # 0x14264a3f0
0x1401c96dd: cmp    ebx,r13d
0x1401c96e0: jne    0x1401c96ea
0x1401c96e2: mov    edx,DWORD PTR [rip+0x24827ac]        # 0x14264be94
0x1401c96e8: jmp    0x1401c9716
0x1401c96ea: mov    edx,DWORD PTR [rip+0x2482798]        # 0x14264be88
0x1401c96f0: jmp    0x1401c9716
0x1401c96f2: cmp    ebx,edi
0x1401c96f4: jne    0x1401c96fe
0x1401c96f6: mov    edx,DWORD PTR [rip+0x2482738]        # 0x14264be34
0x1401c96fc: jmp    0x1401c970f
0x1401c96fe: cmp    ebx,r13d
0x1401c9701: mov    edx,DWORD PTR [rip+0x2482745]        # 0x14264be4c
0x1401c9707: je     0x1401c970f
0x1401c9709: mov    edx,DWORD PTR [rip+0x2482731]        # 0x14264be40
0x1401c970f: lea    rcx,[rip+0x2480cda]        # 0x14264a3f0
0x1401c9716: call   0x140adaad0
0x1401c971b: mov    r8d,ebx
0x1401c971e: lea    edx,[r12-0x1]
0x1401c9723: lea    rcx,[rip+0x2480cc6]        # 0x14264a3f0
0x1401c972a: call   0x1400bb120
0x1401c972f: cmp    DWORD PTR [rsi],0x0
0x1401c9732: je     0x1401c975c
0x1401c9734: cmp    ebx,edi
0x1401c9736: jne    0x1401c9740
0x1401c9738: mov    edx,DWORD PTR [rip+0x248278a]        # 0x14264bec8
0x1401c973e: jmp    0x1401c97ba
0x1401c9740: lea    rcx,[rip+0x2480ca9]        # 0x14264a3f0
0x1401c9747: cmp    ebx,r13d
0x1401c974a: jne    0x1401c9754
0x1401c974c: mov    edx,DWORD PTR [rip+0x248278e]        # 0x14264bee0
0x1401c9752: jmp    0x1401c97c1
0x1401c9754: mov    edx,DWORD PTR [rip+0x248277a]        # 0x14264bed4
0x1401c975a: jmp    0x1401c97c1
0x1401c975c: mov    rax,QWORD PTR [rbp-0x78]
0x1401c9760: mov    rdx,QWORD PTR [rax+0x130]
0x1401c9767: movzx  ecx,r14w
0x1401c976b: call   0x14006fed0
0x1401c9770: cmp    eax,0xffffffff
0x1401c9773: je     0x1401c979d
0x1401c9775: cmp    ebx,edi
0x1401c9777: jne    0x1401c9781
0x1401c9779: mov    edx,DWORD PTR [rip+0x2482701]        # 0x14264be80
0x1401c977f: jmp    0x1401c97ba
0x1401c9781: lea    rcx,[rip+0x2480c68]        # 0x14264a3f0
0x1401c9788: cmp    ebx,r13d
0x1401c978b: jne    0x1401c9795
0x1401c978d: mov    edx,DWORD PTR [rip+0x2482705]        # 0x14264be98
0x1401c9793: jmp    0x1401c97c1
0x1401c9795: mov    edx,DWORD PTR [rip+0x24826f1]        # 0x14264be8c
0x1401c979b: jmp    0x1401c97c1
0x1401c979d: cmp    ebx,edi
0x1401c979f: jne    0x1401c97a9
0x1401c97a1: mov    edx,DWORD PTR [rip+0x2482691]        # 0x14264be38
0x1401c97a7: jmp    0x1401c97ba
0x1401c97a9: cmp    ebx,r13d
0x1401c97ac: mov    edx,DWORD PTR [rip+0x248269e]        # 0x14264be50
0x1401c97b2: je     0x1401c97ba
0x1401c97b4: mov    edx,DWORD PTR [rip+0x248268a]        # 0x14264be44
0x1401c97ba: lea    rcx,[rip+0x2480c2f]        # 0x14264a3f0
0x1401c97c1: call   0x140adaad0
0x1401c97c6: mov    r8d,ebx
0x1401c97c9: mov    edx,DWORD PTR [rbp-0x58]
0x1401c97cc: lea    rcx,[rip+0x2480c1d]        # 0x14264a3f0
0x1401c97d3: call   0x1400bb120
0x1401c97d8: cmp    DWORD PTR [rsi],0x0
0x1401c97db: je     0x1401c9805
0x1401c97dd: cmp    ebx,edi
0x1401c97df: jne    0x1401c97e9
0x1401c97e1: mov    edx,DWORD PTR [rip+0x24826e5]        # 0x14264becc
0x1401c97e7: jmp    0x1401c9863
0x1401c97e9: lea    rcx,[rip+0x2480c00]        # 0x14264a3f0
0x1401c97f0: cmp    ebx,r13d
0x1401c97f3: jne    0x1401c97fd
0x1401c97f5: mov    edx,DWORD PTR [rip+0x24826e9]        # 0x14264bee4
0x1401c97fb: jmp    0x1401c986a
0x1401c97fd: mov    edx,DWORD PTR [rip+0x24826d5]        # 0x14264bed8
0x1401c9803: jmp    0x1401c986a
0x1401c9805: mov    rax,QWORD PTR [rbp-0x78]
0x1401c9809: mov    rdx,QWORD PTR [rax+0x130]
0x1401c9810: movzx  ecx,r14w
0x1401c9814: call   0x14006fed0
0x1401c9819: cmp    eax,0xffffffff
0x1401c981c: je     0x1401c9846
0x1401c981e: cmp    ebx,edi
0x1401c9820: jne    0x1401c982a
0x1401c9822: mov    edx,DWORD PTR [rip+0x248265c]        # 0x14264be84
0x1401c9828: jmp    0x1401c9863
0x1401c982a: lea    rcx,[rip+0x2480bbf]        # 0x14264a3f0
0x1401c9831: cmp    ebx,r13d
0x1401c9834: jne    0x1401c983e
0x1401c9836: mov    edx,DWORD PTR [rip+0x2482660]        # 0x14264be9c
0x1401c983c: jmp    0x1401c986a
0x1401c983e: mov    edx,DWORD PTR [rip+0x248264c]        # 0x14264be90
0x1401c9844: jmp    0x1401c986a
0x1401c9846: cmp    ebx,edi
0x1401c9848: jne    0x1401c9852
0x1401c984a: mov    edx,DWORD PTR [rip+0x24825ec]        # 0x14264be3c
0x1401c9850: jmp    0x1401c9863
0x1401c9852: cmp    ebx,r13d
0x1401c9855: mov    edx,DWORD PTR [rip+0x24825f9]        # 0x14264be54
0x1401c985b: je     0x1401c9863
0x1401c985d: mov    edx,DWORD PTR [rip+0x24825e5]        # 0x14264be48
0x1401c9863: lea    rcx,[rip+0x2480b86]        # 0x14264a3f0
0x1401c986a: call   0x140adaad0
0x1401c986f: inc    ebx
0x1401c9871: cmp    ebx,r13d
0x1401c9874: jle    0x1401c9670
0x1401c987a: mov    r12d,DWORD PTR [rbp-0x58]
0x1401c987e: xor    r8d,r8d
0x1401c9881: lea    rcx,[rip+0x2480b68]        # 0x14264a3f0
0x1401c9888: cmp    DWORD PTR [rsi],r8d
0x1401c988b: je     0x1401c9894
0x1401c988d: xor    edx,edx
0x1401c988f: xor    r9d,r9d
0x1401c9892: jmp    0x1401c989c
0x1401c9894: mov    edx,0x7
0x1401c9899: mov    r9b,0x1
0x1401c989c: call   0x1400bb130
0x1401c98a1: lea    r8d,[rdi+0x2]
0x1401c98a5: lea    edx,[r12-0x1]
0x1401c98aa: lea    rcx,[rip+0x2480b3f]        # 0x14264a3f0
0x1401c98b1: call   0x1400bb120
0x1401c98b6: movzx  eax,r14w
0x1401c98ba: dec    eax
0x1401c98bc: lea    rbx,[rip+0xffffffffffe3673d]        # 0x140000000
0x1401c98c3: cmp    eax,0xf
0x1401c98c6: ja     0x1401c9a30
0x1401c98cc: cdqe
0x1401c98ce: mov    ecx,DWORD PTR [rbx+rax*4+0x1d38f0]
0x1401c98d5: add    rcx,rbx
0x1401c98d8: jmp    rcx
0x1401c98da: lea    rdx,[rip+0x1439bcf]        # 0x1416034b0  'Make peace'
0x1401c98e1: lea    rcx,[rbp+0x2730]
0x1401c98e8: call   0x140068150
0x1401c98ed: nop
0x1401c98ee: xor    r9d,r9d
0x1401c98f1: xor    r8d,r8d
0x1401c98f4: lea    rdx,[rbp+0x2730]
0x1401c98fb: lea    rcx,[rip+0x2480aee]        # 0x14264a3f0
0x1401c9902: call   0x140ad9960
0x1401c9907: nop
0x1401c9908: lea    rcx,[rbp+0x2730]
0x1401c990f: jmp    0x1401c9a2b
0x1401c9914: lea    rdx,[rip+0x143a77d]        # 0x141604098  'Demander unconditional surrender'
0x1401c991b: lea    rcx,[rbp+0x2750]
0x1401c9922: call   0x140068150
0x1401c9927: nop
0x1401c9928: xor    r9d,r9d
0x1401c992b: xor    r8d,r8d
0x1401c992e: lea    rdx,[rbp+0x2750]
0x1401c9935: lea    rcx,[rip+0x2480ab4]        # 0x14264a3f0
0x1401c993c: call   0x140ad9960
0x1401c9941: nop
0x1401c9942: lea    rcx,[rbp+0x2750]
0x1401c9949: jmp    0x1401c9a2b
0x1401c994e: lea    rdx,[rip+0x1439b6b]        # 0x1416034c0  'Declare war'
0x1401c9955: lea    rcx,[rbp+0x2770]
0x1401c995c: call   0x140068150
0x1401c9961: nop
0x1401c9962: xor    r9d,r9d
0x1401c9965: xor    r8d,r8d
0x1401c9968: lea    rdx,[rbp+0x2770]
0x1401c996f: lea    rcx,[rip+0x2480a7a]        # 0x14264a3f0
0x1401c9976: call   0x140ad9960
0x1401c997b: nop
0x1401c997c: lea    rcx,[rbp+0x2770]
0x1401c9983: jmp    0x1401c9a2b
0x1401c9988: lea    rdx,[rip+0x1439b41]        # 0x1416034d0  'Seek alliance'
0x1401c998f: lea    rcx,[rbp+0x2790]
0x1401c9996: call   0x140068150
0x1401c999b: nop
0x1401c999c: xor    r9d,r9d
0x1401c999f: xor    r8d,r8d
0x1401c99a2: lea    rdx,[rbp+0x2790]
0x1401c99a9: lea    rcx,[rip+0x2480a40]        # 0x14264a3f0
0x1401c99b0: call   0x140ad9960
0x1401c99b5: nop
0x1401c99b6: lea    rcx,[rbp+0x2790]
0x1401c99bd: jmp    0x1401c9a2b
0x1401c99bf: lea    rdx,[rip+0x1439b1a]        # 0x1416034e0  'Make contact'
0x1401c99c6: lea    rcx,[rbp+0x27b0]
0x1401c99cd: call   0x140068150
0x1401c99d2: nop
0x1401c99d3: xor    r9d,r9d
0x1401c99d6: xor    r8d,r8d
0x1401c99d9: lea    rdx,[rbp+0x27b0]
0x1401c99e0: lea    rcx,[rip+0x2480a09]        # 0x14264a3f0
0x1401c99e7: call   0x140ad9960
0x1401c99ec: nop
0x1401c99ed: lea    rcx,[rbp+0x27b0]
0x1401c99f4: jmp    0x1401c9a2b
0x1401c99f6: lea    rdx,[rip+0x1439af3]        # 0x1416034f0  'Improve trade'
0x1401c99fd: lea    rcx,[rbp+0x27d0]
0x1401c9a04: call   0x140068150
0x1401c9a09: nop
0x1401c9a0a: xor    r9d,r9d
0x1401c9a0d: xor    r8d,r8d
0x1401c9a10: lea    rdx,[rbp+0x27d0]
0x1401c9a17: lea    rcx,[rip+0x24809d2]        # 0x14264a3f0
0x1401c9a1e: call   0x140ad9960
0x1401c9a23: nop
0x1401c9a24: lea    rcx,[rbp+0x27d0]
0x1401c9a2b: call   0x140067e30
0x1401c9a30: cmp    DWORD PTR [rsi],0x0
0x1401c9a33: je     0x1401c9e53
0x1401c9a39: xor    r8d,r8d
0x1401c9a3c: mov    edx,0x6
0x1401c9a41: mov    r9b,0x1
0x1401c9a44: lea    rcx,[rip+0x24809a5]        # 0x14264a3f0
0x1401c9a4b: call   0x1400bb130
0x1401c9a50: lea    r8d,[rdi+0x3]
0x1401c9a54: mov    edx,r12d
0x1401c9a57: lea    rcx,[rip+0x2480992]        # 0x14264a3f0
0x1401c9a5e: call   0x1400bb120
0x1401c9a63: mov    eax,DWORD PTR [rsi]
0x1401c9a65: add    eax,0xfffffffd
0x1401c9a68: cmp    eax,0x11
0x1401c9a6b: ja     0x1401c9e53
0x1401c9a71: cdqe
0x1401c9a73: mov    ecx,DWORD PTR [rbx+rax*4+0x1d3930]
0x1401c9a7a: add    rcx,rbx
0x1401c9a7d: jmp    rcx
0x1401c9a7f: lea    rdx,[rip+0x143a1ba]        # 0x141603c40  'Belongs to your civilization'
0x1401c9a86: lea    rcx,[rbp+0x27f0]
0x1401c9a8d: call   0x140068150
0x1401c9a92: nop
0x1401c9a93: xor    r9d,r9d
0x1401c9a96: xor    r8d,r8d
0x1401c9a99: lea    rdx,[rbp+0x27f0]
0x1401c9aa0: lea    rcx,[rip+0x2480949]        # 0x14264a3f0
0x1401c9aa7: call   0x140ad9960
0x1401c9aac: nop
0x1401c9aad: lea    rcx,[rbp+0x27f0]
0x1401c9ab4: jmp    0x1401c9e4e
0x1401c9ab9: lea    rdx,[rip+0x143a1a0]        # 0x141603c60  'Not under your control'
0x1401c9ac0: lea    rcx,[rbp+0x2810]
0x1401c9ac7: call   0x140068150
0x1401c9acc: nop
0x1401c9acd: xor    r9d,r9d
0x1401c9ad0: xor    r8d,r8d
0x1401c9ad3: lea    rdx,[rbp+0x2810]
0x1401c9ada: lea    rcx,[rip+0x248090f]        # 0x14264a3f0
0x1401c9ae1: call   0x140ad9960
0x1401c9ae6: nop
0x1401c9ae7: lea    rcx,[rbp+0x2810]
0x1401c9aee: jmp    0x1401c9e4e
0x1401c9af3: lea    rdx,[rip+0x143a17e]        # 0x141603c78  'No civilized inhabitants'
0x1401c9afa: lea    rcx,[rbp+0x2830]
0x1401c9b01: call   0x140068150
0x1401c9b06: nop
0x1401c9b07: xor    r9d,r9d
0x1401c9b0a: xor    r8d,r8d
0x1401c9b0d: lea    rdx,[rbp+0x2830]
0x1401c9b14: lea    rcx,[rip+0x24808d5]        # 0x14264a3f0
0x1401c9b1b: call   0x140ad9960
0x1401c9b20: nop
0x1401c9b21: lea    rcx,[rbp+0x2830]
0x1401c9b28: jmp    0x1401c9e4e
0x1401c9b2d: lea    rdx,[rip+0x143a164]        # 0x141603c98  'No requestable workers'
0x1401c9b34: lea    rcx,[rbp+0x2850]
0x1401c9b3b: call   0x140068150
0x1401c9b40: nop
0x1401c9b41: xor    r9d,r9d
0x1401c9b44: xor    r8d,r8d
0x1401c9b47: lea    rdx,[rbp+0x2850]
0x1401c9b4e: lea    rcx,[rip+0x248089b]        # 0x14264a3f0
0x1401c9b55: call   0x140ad9960
0x1401c9b5a: nop
0x1401c9b5b: lea    rcx,[rbp+0x2850]
0x1401c9b62: jmp    0x1401c9e4e
0x1401c9b67: lea    rdx,[rip+0x143a142]        # 0x141603cb0  'Inaccessible'
0x1401c9b6e: lea    rcx,[rbp+0x2870]
0x1401c9b75: call   0x140068150
0x1401c9b7a: nop
0x1401c9b7b: xor    r9d,r9d
0x1401c9b7e: xor    r8d,r8d
0x1401c9b81: lea    rdx,[rbp+0x2870]
0x1401c9b88: lea    rcx,[rip+0x2480861]        # 0x14264a3f0
0x1401c9b8f: call   0x140ad9960
0x1401c9b94: nop
0x1401c9b95: lea    rcx,[rbp+0x2870]
0x1401c9b9c: jmp    0x1401c9e4e
0x1401c9ba1: lea    rdx,[rip+0x143a118]        # 0x141603cc0  'Need civilization military leader'
0x1401c9ba8: lea    rcx,[rbp+0x2890]
0x1401c9baf: call   0x140068150
0x1401c9bb4: nop
0x1401c9bb5: xor    r9d,r9d
0x1401c9bb8: xor    r8d,r8d
0x1401c9bbb: lea    rdx,[rbp+0x2890]
0x1401c9bc2: lea    rcx,[rip+0x2480827]        # 0x14264a3f0
0x1401c9bc9: call   0x140ad9960
0x1401c9bce: nop
0x1401c9bcf: lea    rcx,[rbp+0x2890]
0x1401c9bd6: jmp    0x1401c9e4e
0x1401c9bdb: lea    rdx,[rip+0x143a106]        # 0x141603ce8  'Need military leader'
0x1401c9be2: lea    rcx,[rbp+0x28b0]
0x1401c9be9: call   0x140068150
0x1401c9bee: nop
0x1401c9bef: xor    r9d,r9d
0x1401c9bf2: xor    r8d,r8d
0x1401c9bf5: lea    rdx,[rbp+0x28b0]
0x1401c9bfc: lea    rcx,[rip+0x24807ed]        # 0x14264a3f0
0x1401c9c03: call   0x140ad9960
0x1401c9c08: nop
0x1401c9c09: lea    rcx,[rbp+0x28b0]
0x1401c9c10: jmp    0x1401c9e4e
0x1401c9c15: lea    rdx,[rip+0x143a0e4]        # 0x141603d00  'Need leader'
0x1401c9c1c: lea    rcx,[rbp+0x28d0]
0x1401c9c23: call   0x140068150
0x1401c9c28: nop
0x1401c9c29: xor    r9d,r9d
0x1401c9c2c: xor    r8d,r8d
0x1401c9c2f: lea    rdx,[rbp+0x28d0]
0x1401c9c36: lea    rcx,[rip+0x24807b3]        # 0x14264a3f0
0x1401c9c3d: call   0x140ad9960
0x1401c9c42: nop
0x1401c9c43: lea    rcx,[rbp+0x28d0]
0x1401c9c4a: jmp    0x1401c9e4e
0x1401c9c4f: lea    rdx,[rip+0x143a0ba]        # 0x141603d10  'Not trading'
0x1401c9c56: lea    rcx,[rbp+0x28f0]
0x1401c9c5d: call   0x140068150
0x1401c9c62: nop
0x1401c9c63: xor    r9d,r9d
0x1401c9c66: xor    r8d,r8d
0x1401c9c69: lea    rdx,[rbp+0x28f0]
0x1401c9c70: lea    rcx,[rip+0x2480779]        # 0x14264a3f0
0x1401c9c77: call   0x140ad9960
0x1401c9c7c: nop
0x1401c9c7d: lea    rcx,[rbp+0x28f0]
0x1401c9c84: jmp    0x1401c9e4e
0x1401c9c89: lea    rdx,[rip+0x143a090]        # 0x141603d20  'Already trading'
0x1401c9c90: lea    rcx,[rbp+0x2910]
0x1401c9c97: call   0x140068150
0x1401c9c9c: nop
0x1401c9c9d: xor    r9d,r9d
0x1401c9ca0: xor    r8d,r8d
0x1401c9ca3: lea    rdx,[rbp+0x2910]
0x1401c9caa: lea    rcx,[rip+0x248073f]        # 0x14264a3f0
0x1401c9cb1: call   0x140ad9960
0x1401c9cb6: nop
0x1401c9cb7: lea    rcx,[rbp+0x2910]
0x1401c9cbe: jmp    0x1401c9e4e
0x1401c9cc3: lea    rdx,[rip+0x143a066]        # 0x141603d30  'Already at war'
0x1401c9cca: lea    rcx,[rbp+0x2930]
0x1401c9cd1: call   0x140068150
0x1401c9cd6: nop
0x1401c9cd7: xor    r9d,r9d
0x1401c9cda: xor    r8d,r8d
0x1401c9cdd: lea    rdx,[rbp+0x2930]
0x1401c9ce4: lea    rcx,[rip+0x2480705]        # 0x14264a3f0
0x1401c9ceb: call   0x140ad9960
0x1401c9cf0: nop
0x1401c9cf1: lea    rcx,[rbp+0x2930]
0x1401c9cf8: jmp    0x1401c9e4e
0x1401c9cfd: lea    rdx,[rip+0x143a03c]        # 0x141603d40  'Already have peace'
0x1401c9d04: lea    rcx,[rbp+0x2950]
0x1401c9d0b: call   0x140068150
0x1401c9d10: nop
0x1401c9d11: xor    r9d,r9d
0x1401c9d14: xor    r8d,r8d
0x1401c9d17: lea    rdx,[rbp+0x2950]
0x1401c9d1e: lea    rcx,[rip+0x24806cb]        # 0x14264a3f0
0x1401c9d25: call   0x140ad9960
0x1401c9d2a: nop
0x1401c9d2b: lea    rcx,[rbp+0x2950]
0x1401c9d32: jmp    0x1401c9e4e
0x1401c9d37: lea    rdx,[rip+0x143a01a]        # 0x141603d58  'Already have alliance'
0x1401c9d3e: lea    rcx,[rbp+0x2970]
0x1401c9d45: call   0x140068150
0x1401c9d4a: nop
0x1401c9d4b: xor    r9d,r9d
0x1401c9d4e: xor    r8d,r8d
0x1401c9d51: lea    rdx,[rbp+0x2970]
0x1401c9d58: lea    rcx,[rip+0x2480691]        # 0x14264a3f0
0x1401c9d5f: call   0x140ad9960
0x1401c9d64: nop
0x1401c9d65: lea    rcx,[rbp+0x2970]
0x1401c9d6c: jmp    0x1401c9e4e
0x1401c9d71: lea    rdx,[rip+0x1439ff8]        # 0x141603d70  'At war'
0x1401c9d78: lea    rcx,[rbp+0x2990]
0x1401c9d7f: call   0x140068150
0x1401c9d84: nop
0x1401c9d85: xor    r9d,r9d
0x1401c9d88: xor    r8d,r8d
0x1401c9d8b: lea    rdx,[rbp+0x2990]
0x1401c9d92: lea    rcx,[rip+0x2480657]        # 0x14264a3f0
0x1401c9d99: call   0x140ad9960
0x1401c9d9e: nop
0x1401c9d9f: lea    rcx,[rbp+0x2990]
0x1401c9da6: jmp    0x1401c9e4e
0x1401c9dab: lea    rdx,[rip+0x1439fc6]        # 0x141603d78  'Cannot communicate'
0x1401c9db2: lea    rcx,[rbp+0x29b0]
0x1401c9db9: call   0x140068150
0x1401c9dbe: nop
0x1401c9dbf: xor    r9d,r9d
0x1401c9dc2: xor    r8d,r8d
0x1401c9dc5: lea    rdx,[rbp+0x29b0]
0x1401c9dcc: lea    rcx,[rip+0x248061d]        # 0x14264a3f0
0x1401c9dd3: call   0x140ad9960
0x1401c9dd8: nop
0x1401c9dd9: lea    rcx,[rbp+0x29b0]
0x1401c9de0: jmp    0x1401c9e4e
0x1401c9de2: lea    rdx,[rip+0x143a287]        # 0x141604070  'Not in contact'
0x1401c9de9: lea    rcx,[rbp+0x29d0]
0x1401c9df0: call   0x140068150
0x1401c9df5: nop
0x1401c9df6: xor    r9d,r9d
0x1401c9df9: xor    r8d,r8d
0x1401c9dfc: lea    rdx,[rbp+0x29d0]
0x1401c9e03: lea    rcx,[rip+0x24805e6]        # 0x14264a3f0
0x1401c9e0a: call   0x140ad9960
0x1401c9e0f: nop
0x1401c9e10: lea    rcx,[rbp+0x29d0]
0x1401c9e17: jmp    0x1401c9e4e
0x1401c9e19: lea    rdx,[rip+0x143a260]        # 0x141604080  'Too hostile'
0x1401c9e20: lea    rcx,[rbp+0x29f0]
0x1401c9e27: call   0x140068150
0x1401c9e2c: nop
0x1401c9e2d: xor    r9d,r9d
0x1401c9e30: xor    r8d,r8d
0x1401c9e33: lea    rdx,[rbp+0x29f0]
0x1401c9e3a: lea    rcx,[rip+0x24805af]        # 0x14264a3f0
0x1401c9e41: call   0x140ad9960
0x1401c9e46: nop
0x1401c9e47: lea    rcx,[rbp+0x29f0]
0x1401c9e4e: call   0x140067e30
0x1401c9e53: add    r12d,0x3
0x1401c9e57: mov    DWORD PTR [rbp-0x58],r12d
0x1401c9e5b: inc    r14w
0x1401c9e5f: add    rsi,0x4
0x1401c9e63: cmp    r14w,0x11
0x1401c9e68: jl     0x1401c9656
0x1401c9e6e: mov    r12,QWORD PTR [rbp-0x78]
0x1401c9e72: mov    eax,DWORD PTR [rbp-0x48]
0x1401c9e75: lea    r13d,[rax-0x37]
0x1401c9e79: lea    r15d,[rax-0x2]
0x1401c9e7d: xor    eax,eax
0x1401c9e7f: mov    esi,eax
0x1401c9e81: mov    r14d,DWORD PTR [rbp-0x70]
0x1401c9e85: test   r14d,r14d
0x1401c9e88: js     0x1401cc792
0x1401c9e8e: mov    edi,eax
0x1401c9e90: movsxd r12,r14d
0x1401c9e93: mov    ebx,r13d
0x1401c9e96: cmp    r13d,r15d
0x1401c9e99: jg     0x1401cc780
0x1401c9e9f: nop
0x1401c9ea0: mov    r8d,ebx
0x1401c9ea3: mov    edx,esi
0x1401c9ea5: lea    rcx,[rip+0x2480544]        # 0x14264a3f0
0x1401c9eac: call   0x1400bb120
0x1401c9eb1: xor    r8d,r8d
0x1401c9eb4: xor    edx,edx
0x1401c9eb6: lea    rcx,[rip+0x2480533]        # 0x14264a3f0
0x1401c9ebd: call   0x1400bb190
0x1401c9ec2: test   rdi,rdi
0x1401c9ec5: jne    0x1401cc71d
0x1401c9ecb: cmp    ebx,r13d
0x1401c9ece: jne    0x1401cc701
0x1401c9ed4: mov    edx,DWORD PTR [rip+0x2481e3a]        # 0x14264bd14
0x1401c9eda: jmp    0x1401cc769
0x1401c9edf: mov    rbx,QWORD PTR [rsp+0x78]
0x1401c9ee4: lea    rcx,[rbx+0x3d8]
0x1401c9eeb: call   0x14006ee50
0x1401c9ef0: test   rax,rax
0x1401c9ef3: je     0x1401ca5f2
0x1401c9ef9: mov    edi,DWORD PTR [rbp-0x48]
0x1401c9efc: lea    r15d,[rdi+0x2]
0x1401c9f00: mov    DWORD PTR [rbp-0x58],r15d
0x1401c9f04: lea    eax,[rdi+0x20]
0x1401c9f07: mov    DWORD PTR [rbp-0x6c],eax
0x1401c9f0a: mov    ecx,DWORD PTR [rbp-0x70]
0x1401c9f0d: lea    eax,[rcx-0x1]
0x1401c9f10: mov    DWORD PTR [rbp-0x60],eax
0x1401c9f13: lea    edx,[rcx-0x5]
0x1401c9f16: mov    eax,0x55555556
0x1401c9f1b: imul   edx
0x1401c9f1d: mov    r14d,edx
0x1401c9f20: shr    r14d,0x1f
0x1401c9f24: add    r14d,edx
0x1401c9f27: mov    DWORD PTR [rbp-0x28],r14d
0x1401c9f2b: lea    rcx,[rbx+0x3d8]
0x1401c9f32: call   0x14006ee50
0x1401c9f37: mov    rsi,rax
0x1401c9f3a: mov    QWORD PTR [rbp+0x30],rax
0x1401c9f3e: cmp    eax,r14d
0x1401c9f41: jle    0x1401c9f4b
0x1401c9f43: lea    ebx,[rdi+0x1e]
0x1401c9f46: mov    DWORD PTR [rbp-0x6c],ebx
0x1401c9f49: jmp    0x1401c9f4e
0x1401c9f4b: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401c9f4e: lea    eax,[rbx-0x3]
0x1401c9f51: mov    DWORD PTR [rsp+0x74],eax
0x1401c9f55: xor    eax,eax
0x1401c9f57: mov    edi,eax
0x1401c9f59: mov    QWORD PTR [rbp-0x30],rax
0x1401c9f5d: mov    r12d,0x5
0x1401c9f63: mov    DWORD PTR [rsp+0x70],r12d
0x1401c9f68: mov    r13d,r12d
0x1401c9f6b: mov    DWORD PTR [rbp-0x68],r12d
0x1401c9f6f: mov    r8,QWORD PTR [rsp+0x78]
0x1401c9f74: mov    ecx,DWORD PTR [r8+0x3f0]
0x1401c9f7b: mov    edx,esi
0x1401c9f7d: sub    edx,r14d
0x1401c9f80: cmp    ecx,edx
0x1401c9f82: cmovle edx,ecx
0x1401c9f85: test   edx,edx
0x1401c9f87: cmovns eax,edx
0x1401c9f8a: mov    DWORD PTR [rbp-0x10],eax
0x1401c9f8d: lea    ecx,[r14+rax*1]
0x1401c9f91: mov    DWORD PTR [rbp-0x20],ecx
0x1401c9f94: cmp    eax,ecx
0x1401c9f96: jge    0x1401ca283
0x1401c9f9c: lea    rcx,[r8+0x3d8]
0x1401c9fa3: mov    QWORD PTR [rbp+0x18],rcx
0x1401c9fa7: cmp    eax,esi
0x1401c9fa9: jge    0x1401ca279
0x1401c9faf: movsxd rdx,eax
0x1401c9fb2: call   0x14006f220
0x1401c9fb7: mov    r12,QWORD PTR [rax]
0x1401c9fba: mov    QWORD PTR [rbp+0x48],r12
0x1401c9fbe: cmp    BYTE PTR [rip+0x21c6610],0x0        # 0x1423905d5
0x1401c9fc5: je     0x1401c9fe9
0x1401c9fc7: mov    eax,DWORD PTR [rbp-0x38]
0x1401c9fca: cmp    eax,r15d
0x1401c9fcd: jl     0x1401c9fe9
0x1401c9fcf: cmp    eax,ebx
0x1401c9fd1: jg     0x1401c9fe9
0x1401c9fd3: mov    ecx,DWORD PTR [rbp-0x3c]
0x1401c9fd6: cmp    ecx,r13d
0x1401c9fd9: jl     0x1401c9fe9
0x1401c9fdb: lea    eax,[r13+0x2]
0x1401c9fdf: cmp    ecx,eax
0x1401c9fe1: cmovle rdi,r12
0x1401c9fe5: mov    QWORD PTR [rbp-0x30],rdi
0x1401c9fe9: xor    r8d,r8d
0x1401c9fec: mov    edx,0x7
0x1401c9ff1: mov    r9b,0x1
0x1401c9ff4: lea    rcx,[rip+0x24803f5]        # 0x14264a3f0
0x1401c9ffb: call   0x1400bb130
0x1401ca000: mov    esi,r15d
0x1401ca003: cmp    r15d,ebx
0x1401ca006: jg     0x1401ca0ad
0x1401ca00c: lea    r12d,[r13+0x3]
0x1401ca010: movsxd r14,r15d
0x1401ca013: mov    edi,r13d
0x1401ca016: cmp    r13d,r12d
0x1401ca019: jge    0x1401ca098
0x1401ca01b: movsxd r15,ebx
0x1401ca01e: lea    rbx,[rip+0x2481d8b]        # 0x14264bdb0
0x1401ca025: mov    r13d,DWORD PTR [rbp-0x58]
0x1401ca029: nop    DWORD PTR [rax+0x0]
0x1401ca030: mov    r8d,esi
0x1401ca033: mov    edx,edi
0x1401ca035: lea    rcx,[rip+0x24803b4]        # 0x14264a3f0
0x1401ca03c: call   0x1400bb120
0x1401ca041: cmp    esi,r13d
0x1401ca044: jne    0x1401ca04b
0x1401ca046: mov    edx,DWORD PTR [rbx-0x18]
0x1401ca049: jmp    0x1401ca057
0x1401ca04b: cmp    r14,r15
0x1401ca04e: jne    0x1401ca054
0x1401ca050: mov    edx,DWORD PTR [rbx]
0x1401ca052: jmp    0x1401ca057
0x1401ca054: mov    edx,DWORD PTR [rbx-0xc]
0x1401ca057: lea    rcx,[rip+0x2480392]        # 0x14264a3f0
0x1401ca05e: call   0x140adaad0
0x1401ca063: xor    edx,edx
0x1401ca065: lea    rcx,[rip+0x2203704]        # 0x1423cd770
0x1401ca06c: call   0x140071f90
0x1401ca071: test   al,al
0x1401ca073: je     0x1401ca086
0x1401ca075: mov    r8b,0x1
0x1401ca078: xor    edx,edx
0x1401ca07a: lea    rcx,[rip+0x248036f]        # 0x14264a3f0
0x1401ca081: call   0x1400bb190
0x1401ca086: inc    edi
0x1401ca088: add    rbx,0x4
0x1401ca08c: cmp    edi,r12d
0x1401ca08f: jl     0x1401ca030
0x1401ca091: mov    r13d,DWORD PTR [rbp-0x68]
0x1401ca095: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401ca098: inc    esi
0x1401ca09a: inc    r14
0x1401ca09d: cmp    esi,ebx
0x1401ca09f: jle    0x1401ca013
0x1401ca0a5: mov    r15d,DWORD PTR [rbp-0x58]
0x1401ca0a9: mov    r12,QWORD PTR [rbp+0x48]
0x1401ca0ad: xor    r8d,r8d
0x1401ca0b0: mov    edx,0x7
0x1401ca0b5: mov    r9b,0x1
0x1401ca0b8: lea    rcx,[rip+0x2480331]        # 0x14264a3f0
0x1401ca0bf: call   0x1400bb130
0x1401ca0c4: lea    rcx,[rbp+0x10f0]
0x1401ca0cb: call   0x14006f690
0x1401ca0d0: nop
0x1401ca0d1: lea    rcx,[rbp+0x1570]
0x1401ca0d8: call   0x14006f690
0x1401ca0dd: nop
0x1401ca0de: mov    rcx,QWORD PTR [r12+0x10]
0x1401ca0e3: add    rcx,0x38
0x1401ca0e7: xor    r9d,r9d
0x1401ca0ea: mov    r8b,0x1
0x1401ca0ed: lea    rdx,[rbp+0x1570]
0x1401ca0f4: call   0x140a946e0
0x1401ca0f9: lea    rdx,[rbp+0x1570]
0x1401ca100: lea    rcx,[rbp+0x10f0]
0x1401ca107: call   0x1400b9d10
0x1401ca10c: lea    edx,[r13+0x1]
0x1401ca110: mov    r8d,r15d
0x1401ca113: lea    rcx,[rip+0x24802d6]        # 0x14264a3f0
0x1401ca11a: call   0x1400bb120
0x1401ca11f: sub    ebx,r15d
0x1401ca122: lea    rcx,[rbp+0x10f0]
0x1401ca129: call   0x14006f330
0x1401ca12e: lea    ecx,[rbx-0x2]
0x1401ca131: movsxd rdx,ecx
0x1401ca134: cmp    rax,rdx
0x1401ca137: jb     0x1401ca19b
0x1401ca139: lea    edi,[rbx-0x3]
0x1401ca13c: test   edi,edi
0x1401ca13e: js     0x1401ca156
0x1401ca140: movsxd rdx,ebx
0x1401ca143: sub    rdx,0x3
0x1401ca147: xor    r8d,r8d
0x1401ca14a: lea    rcx,[rbp+0x10f0]
0x1401ca151: call   0x1400e1230
0x1401ca156: cmp    edi,0x3
0x1401ca159: jle    0x1401ca19b
0x1401ca15b: movsxd rdx,ebx
0x1401ca15e: sub    rdx,0x6
0x1401ca162: lea    rcx,[rbp+0x10f0]
0x1401ca169: call   0x1400fb540
0x1401ca16e: mov    BYTE PTR [rax],0x2e
0x1401ca171: lea    eax,[rbx-0x5]
0x1401ca174: movsxd rdx,eax
0x1401ca177: lea    rcx,[rbp+0x10f0]
0x1401ca17e: call   0x1400fb540
0x1401ca183: mov    BYTE PTR [rax],0x2e
0x1401ca186: lea    eax,[rbx-0x4]
0x1401ca189: movsxd rdx,eax
0x1401ca18c: lea    rcx,[rbp+0x10f0]
0x1401ca193: call   0x1400fb540
0x1401ca198: mov    BYTE PTR [rax],0x2e
0x1401ca19b: xor    r9d,r9d
0x1401ca19e: xor    r8d,r8d
0x1401ca1a1: lea    rdx,[rbp+0x10f0]
0x1401ca1a8: lea    rcx,[rip+0x2480241]        # 0x14264a3f0
0x1401ca1af: call   0x140ad9960
0x1401ca1b4: lea    r14,[rip+0x248771d]        # 0x1426518d8
0x1401ca1bb: mov    r15d,DWORD PTR [rsp+0x74]
0x1401ca1c0: mov    edi,r15d
0x1401ca1c3: mov    rbx,r14
0x1401ca1c6: mov    esi,0x4
0x1401ca1cb: mov    r15,QWORD PTR [rbp-0x78]
0x1401ca1cf: nop
0x1401ca1d0: mov    r8d,edi
0x1401ca1d3: mov    edx,r13d
0x1401ca1d6: lea    rcx,[rip+0x2480213]        # 0x14264a3f0
0x1401ca1dd: call   0x1400bb120
0x1401ca1e2: mov    rcx,QWORD PTR [r12+0x10]
0x1401ca1e7: mov    rdx,QWORD PTR [r15+0x130]
0x1401ca1ee: mov    ecx,DWORD PTR [rcx+0xe0]
0x1401ca1f4: call   0x1400b9f70
0x1401ca1f9: xor    r8d,r8d
0x1401ca1fc: lea    rcx,[rip+0x24801ed]        # 0x14264a3f0
0x1401ca203: cmp    eax,0xffffffff
0x1401ca206: je     0x1401ca20d
0x1401ca208: mov    edx,DWORD PTR [rbx-0x30]
0x1401ca20b: jmp    0x1401ca20f
0x1401ca20d: mov    edx,DWORD PTR [rbx]
0x1401ca20f: call   0x140adb100
0x1401ca214: inc    edi
0x1401ca216: add    rbx,0xc
0x1401ca21a: sub    rsi,0x1
0x1401ca21e: jne    0x1401ca1d0
0x1401ca220: inc    r13d
0x1401ca223: add    r14,0x4
0x1401ca227: lea    rax,[rip+0x24876b6]        # 0x1426518e4
0x1401ca22e: cmp    r14,rax
0x1401ca231: mov    r15d,DWORD PTR [rsp+0x74]
0x1401ca236: jl     0x1401ca1c0
0x1401ca238: mov    DWORD PTR [rbp-0x68],r13d
0x1401ca23c: lea    rcx,[rbp+0x1570]
0x1401ca243: call   0x140067e30
0x1401ca248: nop
0x1401ca249: lea    rcx,[rbp+0x10f0]
0x1401ca250: call   0x140067e30
0x1401ca255: mov    eax,DWORD PTR [rbp-0x10]
0x1401ca258: inc    eax
0x1401ca25a: mov    DWORD PTR [rbp-0x10],eax
0x1401ca25d: cmp    eax,DWORD PTR [rbp-0x20]
0x1401ca260: mov    r15d,DWORD PTR [rbp-0x58]
0x1401ca264: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401ca267: mov    rdi,QWORD PTR [rbp-0x30]
0x1401ca26b: mov    rsi,QWORD PTR [rbp+0x30]
0x1401ca26f: mov    rcx,QWORD PTR [rbp+0x18]
0x1401ca273: jl     0x1401c9fa7
0x1401ca279: mov    r14d,DWORD PTR [rbp-0x28]
0x1401ca27d: mov    r12d,0x5
0x1401ca283: cmp    esi,r14d
0x1401ca286: jle    0x1401ca2f9
0x1401ca288: lea    eax,[r14+0x1]
0x1401ca28c: lea    ebx,[rax+rax*2]
0x1401ca28f: lea    rcx,[rbp+0x1d0]
0x1401ca296: call   0x1400bb360
0x1401ca29b: lea    r9d,[rsi-0x1]
0x1401ca29f: mov    DWORD PTR [rsp+0x30],ebx
0x1401ca2a3: mov    DWORD PTR [rsp+0x28],0x6
0x1401ca2ab: mov    DWORD PTR [rsp+0x20],r14d
0x1401ca2b0: xor    r8d,r8d
0x1401ca2b3: mov    rsi,QWORD PTR [rsp+0x78]
0x1401ca2b8: mov    edx,DWORD PTR [rsi+0x3f0]
0x1401ca2be: lea    rcx,[rbp+0x1d0]
0x1401ca2c5: call   0x1400bb380
0x1401ca2ca: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401ca2cd: lea    r9d,[rbx+0x1]
0x1401ca2d1: xor    r15d,r15d
0x1401ca2d4: mov    DWORD PTR [rsp+0x28],r15d
0x1401ca2d9: movzx  eax,BYTE PTR [rsi+0x3f4]
0x1401ca2e0: mov    BYTE PTR [rsp+0x20],al
0x1401ca2e4: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401ca2e8: mov    edx,DWORD PTR [rbp-0x38]
0x1401ca2eb: lea    rcx,[rbp+0x1d0]
0x1401ca2f2: call   0x14140f4d0
0x1401ca2f7: jmp    0x1401ca2fc
0x1401ca2f9: xor    r15d,r15d
0x1401ca2fc: test   rdi,rdi
0x1401ca2ff: je     0x1401c9e6e
0x1401ca305: lea    esi,[rbx+0x2]
0x1401ca308: mov    rax,QWORD PTR [rdi+0x10]
0x1401ca30c: mov    rbx,QWORD PTR [rax+0x130]
0x1401ca313: test   rbx,rbx
0x1401ca316: je     0x1401ca58a
0x1401ca31c: mov    rbx,QWORD PTR [rbx+0x8]
0x1401ca320: test   rbx,rbx
0x1401ca323: je     0x1401ca58a
0x1401ca329: lea    rdx,[rbp+0xc8]
0x1401ca330: mov    rcx,rbx
0x1401ca333: call   0x14006f240
0x1401ca338: lea    rdx,[rbp+0x168]
0x1401ca33f: mov    rcx,rbx
0x1401ca342: call   0x14006f230
0x1401ca347: lea    rcx,[rbx+0x18]
0x1401ca34b: lea    rdx,[rbp+0x160]
0x1401ca352: call   0x14006f240
0x1401ca357: lea    r8,[rbp+0x168]
0x1401ca35e: lea    rdx,[rbp+0x2]
0x1401ca362: lea    rcx,[rbp+0xc8]
0x1401ca369: call   0x14006ee20
0x1401ca36e: xor    edx,edx
0x1401ca370: movzx  ecx,BYTE PTR [rax]
0x1401ca373: call   0x1400657b0
0x1401ca378: test   al,al
0x1401ca37a: je     0x1401ca58a
0x1401ca380: mov    r12d,0x14
0x1401ca386: mov    r14d,DWORD PTR [rbp-0x60]
0x1401ca38a: nop    WORD PTR [rax+rax*1+0x0]
0x1401ca390: mov    ebx,r15d
0x1401ca393: lea    rcx,[rbp+0x160]
0x1401ca39a: call   0x14006ee10
0x1401ca39f: mov    r8d,DWORD PTR [rax]
0x1401ca3a2: cmp    r8d,0x1f4
0x1401ca3a9: jl     0x1401ca3e6
0x1401ca3ab: mov    ecx,0x1f4
0x1401ca3b0: movzx  r9d,BYTE PTR [rbp-0x80]
0x1401ca3b5: mov    r10d,DWORD PTR [rbp-0x70]
0x1401ca3b9: nop    DWORD PTR [rax+0x0]
0x1401ca3c0: sub    r8d,ecx
0x1401ca3c3: lea    edx,[rbx+0x1]
0x1401ca3c6: cmp    ebx,0xbb8
0x1401ca3cc: cmovge edx,ebx
0x1401ca3cf: lea    eax,[rcx+0x64]
0x1401ca3d2: cmovge eax,ecx
0x1401ca3d5: mov    ecx,eax
0x1401ca3d7: mov    ebx,edx
0x1401ca3d9: cmp    r8d,eax
0x1401ca3dc: jge    0x1401ca3c0
0x1401ca3de: mov    BYTE PTR [rbp-0x80],r9b
0x1401ca3e2: mov    DWORD PTR [rbp-0x70],r10d
0x1401ca3e6: lea    rcx,[rbp+0xeb0]
0x1401ca3ed: call   0x14006f690
0x1401ca3f2: nop
0x1401ca3f3: lea    rcx,[rbp+0x1490]
0x1401ca3fa: call   0x14006f690
0x1401ca3ff: nop
0x1401ca400: mov    edx,ebx
0x1401ca402: lea    rcx,[rbp+0xeb0]
0x1401ca409: call   0x1407737c0
0x1401ca40e: lea    rcx,[rbp+0xeb0]
0x1401ca415: call   0x14006f520
0x1401ca41a: test   al,al
0x1401ca41c: jne    0x1401ca431
0x1401ca41e: lea    rdx,[rip+0x141e317]        # 0x1415e873c  ' '
0x1401ca425: lea    rcx,[rbp+0xeb0]
0x1401ca42c: call   0x14006f560
0x1401ca431: mov    rax,QWORD PTR [rdi+0x10]
0x1401ca435: movzx  ebx,WORD PTR [rax+0x4]
0x1401ca439: movzx  edi,WORD PTR [rax+0x2]
0x1401ca43d: lea    rcx,[rbp+0xc8]
0x1401ca444: call   0x14006ee10
0x1401ca449: movzx  r9d,bx
0x1401ca44d: movzx  r8d,di
0x1401ca451: movzx  edx,WORD PTR [rax]
0x1401ca454: lea    rcx,[rbp+0x1490]
0x1401ca45b: call   0x140774730
0x1401ca460: lea    rdx,[rbp+0x1490]
0x1401ca467: lea    rcx,[rbp+0xeb0]
0x1401ca46e: call   0x1400b9d10
0x1401ca473: xor    r8d,r8d
0x1401ca476: mov    edx,0x7
0x1401ca47b: mov    r9b,0x1
0x1401ca47e: lea    rcx,[rip+0x247ff6b]        # 0x14264a3f0
0x1401ca485: call   0x1400bb130
0x1401ca48a: mov    r8d,esi
0x1401ca48d: mov    ebx,DWORD PTR [rsp+0x70]
0x1401ca491: mov    edx,ebx
0x1401ca493: lea    rcx,[rip+0x247ff56]        # 0x14264a3f0
0x1401ca49a: call   0x1400bb120
0x1401ca49f: lea    rcx,[rbp+0xeb0]
0x1401ca4a6: call   0x14006f330
0x1401ca4ab: cmp    rax,0x17
0x1401ca4af: jbe    0x1401ca4ff
0x1401ca4b1: xor    r8d,r8d
0x1401ca4b4: mov    edx,0x17
0x1401ca4b9: lea    rcx,[rbp+0xeb0]
0x1401ca4c0: call   0x1400e1230
0x1401ca4c5: mov    rdx,r12
0x1401ca4c8: lea    rcx,[rbp+0xeb0]
0x1401ca4cf: call   0x1400fb540
0x1401ca4d4: mov    BYTE PTR [rax],0x2e
0x1401ca4d7: mov    edx,0x15
0x1401ca4dc: lea    rcx,[rbp+0xeb0]
0x1401ca4e3: call   0x1400fb540
0x1401ca4e8: mov    BYTE PTR [rax],0x2e
0x1401ca4eb: mov    edx,0x16
0x1401ca4f0: lea    rcx,[rbp+0xeb0]
0x1401ca4f7: call   0x1400fb540
0x1401ca4fc: mov    BYTE PTR [rax],0x2e
0x1401ca4ff: xor    r9d,r9d
0x1401ca502: xor    r8d,r8d
0x1401ca505: lea    rdx,[rbp+0xeb0]
0x1401ca50c: lea    rcx,[rip+0x247fedd]        # 0x14264a3f0
0x1401ca513: call   0x140ad9960
0x1401ca518: inc    ebx
0x1401ca51a: mov    DWORD PTR [rsp+0x70],ebx
0x1401ca51e: lea    rcx,[rbp+0x1490]
0x1401ca525: call   0x140067e30
0x1401ca52a: nop
0x1401ca52b: lea    rcx,[rbp+0xeb0]
0x1401ca532: call   0x140067e30
0x1401ca537: cmp    ebx,r14d
0x1401ca53a: jg     0x1401c9e6e
0x1401ca540: lea    rcx,[rbp+0xc8]
0x1401ca547: call   0x14006f430
0x1401ca54c: lea    rcx,[rbp+0x160]
0x1401ca553: call   0x14006f350
0x1401ca558: lea    r8,[rbp+0x168]
0x1401ca55f: lea    rdx,[rbp+0x2]
0x1401ca563: lea    rcx,[rbp+0xc8]
0x1401ca56a: call   0x14006ee20
0x1401ca56f: xor    edx,edx
0x1401ca571: movzx  ecx,BYTE PTR [rax]
0x1401ca574: call   0x1400657b0
0x1401ca579: test   al,al
0x1401ca57b: mov    rdi,QWORD PTR [rbp-0x30]
0x1401ca57f: jne    0x1401ca390
0x1401ca585: jmp    0x1401c9e6e
0x1401ca58a: xor    r8d,r8d
0x1401ca58d: mov    edx,0x7
0x1401ca592: mov    r9b,0x1
0x1401ca595: lea    rcx,[rip+0x247fe54]        # 0x14264a3f0
0x1401ca59c: call   0x1400bb130
0x1401ca5a1: mov    r8d,esi
0x1401ca5a4: mov    edx,r12d
0x1401ca5a7: lea    rcx,[rip+0x247fe42]        # 0x14264a3f0
0x1401ca5ae: call   0x1400bb120
0x1401ca5b3: lea    rdx,[rip+0x1439b06]        # 0x1416040c0  'No notable skills'
0x1401ca5ba: lea    rcx,[rbp+0x2a30]
0x1401ca5c1: call   0x140068150
0x1401ca5c6: nop
0x1401ca5c7: xor    r9d,r9d
0x1401ca5ca: xor    r8d,r8d
0x1401ca5cd: lea    rdx,[rbp+0x2a30]
0x1401ca5d4: lea    rcx,[rip+0x247fe15]        # 0x14264a3f0
0x1401ca5db: call   0x140ad9960
0x1401ca5e0: nop
0x1401ca5e1: lea    rcx,[rbp+0x2a30]
0x1401ca5e8: call   0x140067e30
0x1401ca5ed: jmp    0x1401c9e6e
0x1401ca5f2: xor    r8d,r8d
0x1401ca5f5: mov    edx,0x6
0x1401ca5fa: mov    r9b,0x1
0x1401ca5fd: lea    rcx,[rip+0x247fdec]        # 0x14264a3f0
0x1401ca604: call   0x1400bb130
0x1401ca609: mov    r8d,DWORD PTR [rbp-0x60]
0x1401ca60d: mov    edx,0x5
0x1401ca612: lea    rcx,[rip+0x247fdd7]        # 0x14264a3f0
0x1401ca619: call   0x1400bb120
0x1401ca61e: lea    rdx,[rip+0x1439483]        # 0x141603aa8  'No workers available'
0x1401ca625: lea    rcx,[rbp+0x2a50]
0x1401ca62c: call   0x140068150
0x1401ca631: nop
0x1401ca632: xor    r9d,r9d
0x1401ca635: xor    r8d,r8d
0x1401ca638: lea    rdx,[rbp+0x2a50]
0x1401ca63f: lea    rcx,[rip+0x247fdaa]        # 0x14264a3f0
0x1401ca646: call   0x140ad9960
0x1401ca64b: nop
0x1401ca64c: lea    rcx,[rbp+0x2a50]
0x1401ca653: call   0x140067e30
0x1401ca658: jmp    0x1401c9e72
0x1401ca65d: mov    edi,DWORD PTR [rbp-0x48]
0x1401ca660: add    edi,0x2
0x1401ca663: lea    ebx,[r13-0x2]
0x1401ca667: mov    rax,QWORD PTR [r12+0x130]
0x1401ca66f: mov    esi,edi
0x1401ca671: cmp    DWORD PTR [rax],0x5
0x1401ca674: jne    0x1401cafa8
0x1401ca67a: cmp    edi,ebx
0x1401ca67c: jg     0x1401ca7ef
0x1401ca682: mov    eax,0x5
0x1401ca687: nop    WORD PTR [rax+rax*1+0x0]
0x1401ca690: mov    r8d,esi
0x1401ca693: mov    edx,eax
0x1401ca695: lea    rcx,[rip+0x247fd54]        # 0x14264a3f0
0x1401ca69c: call   0x1400bb120
0x1401ca6a1: mov    rax,QWORD PTR [r12+0x130]
0x1401ca6a9: test   BYTE PTR [rax+0x58],0x8
0x1401ca6ad: je     0x1401ca6d6
0x1401ca6af: cmp    esi,edi
0x1401ca6b1: jne    0x1401ca6bb
0x1401ca6b3: mov    edx,DWORD PTR [rip+0x24817c3]        # 0x14264be7c
0x1401ca6b9: jmp    0x1401ca6f2
0x1401ca6bb: lea    rcx,[rip+0x247fd2e]        # 0x14264a3f0
0x1401ca6c2: cmp    esi,ebx
0x1401ca6c4: jne    0x1401ca6ce
0x1401ca6c6: mov    edx,DWORD PTR [rip+0x24817c8]        # 0x14264be94
0x1401ca6cc: jmp    0x1401ca6f9
0x1401ca6ce: mov    edx,DWORD PTR [rip+0x24817b4]        # 0x14264be88
0x1401ca6d4: jmp    0x1401ca6f9
0x1401ca6d6: cmp    esi,edi
0x1401ca6d8: jne    0x1401ca6e2
0x1401ca6da: mov    edx,DWORD PTR [rip+0x2481754]        # 0x14264be34
0x1401ca6e0: jmp    0x1401ca6f2
0x1401ca6e2: cmp    esi,ebx
0x1401ca6e4: mov    edx,DWORD PTR [rip+0x2481762]        # 0x14264be4c
0x1401ca6ea: je     0x1401ca6f2
0x1401ca6ec: mov    edx,DWORD PTR [rip+0x248174e]        # 0x14264be40
0x1401ca6f2: lea    rcx,[rip+0x247fcf7]        # 0x14264a3f0
0x1401ca6f9: call   0x140adaad0
0x1401ca6fe: mov    r8d,esi
0x1401ca701: mov    edx,0x6
0x1401ca706: lea    rcx,[rip+0x247fce3]        # 0x14264a3f0
0x1401ca70d: call   0x1400bb120
0x1401ca712: mov    rax,QWORD PTR [r12+0x130]
0x1401ca71a: test   BYTE PTR [rax+0x58],0x8
0x1401ca71e: je     0x1401ca747
0x1401ca720: cmp    esi,edi
0x1401ca722: jne    0x1401ca72c
0x1401ca724: mov    edx,DWORD PTR [rip+0x2481756]        # 0x14264be80
0x1401ca72a: jmp    0x1401ca763
0x1401ca72c: lea    rcx,[rip+0x247fcbd]        # 0x14264a3f0
0x1401ca733: cmp    esi,ebx
0x1401ca735: jne    0x1401ca73f
0x1401ca737: mov    edx,DWORD PTR [rip+0x248175b]        # 0x14264be98
0x1401ca73d: jmp    0x1401ca76a
0x1401ca73f: mov    edx,DWORD PTR [rip+0x2481747]        # 0x14264be8c
0x1401ca745: jmp    0x1401ca76a
0x1401ca747: cmp    esi,edi
0x1401ca749: jne    0x1401ca753
0x1401ca74b: mov    edx,DWORD PTR [rip+0x24816e7]        # 0x14264be38
0x1401ca751: jmp    0x1401ca763
0x1401ca753: cmp    esi,ebx
0x1401ca755: mov    edx,DWORD PTR [rip+0x24816f5]        # 0x14264be50
0x1401ca75b: je     0x1401ca763
0x1401ca75d: mov    edx,DWORD PTR [rip+0x24816e1]        # 0x14264be44
0x1401ca763: lea    rcx,[rip+0x247fc86]        # 0x14264a3f0
0x1401ca76a: call   0x140adaad0
0x1401ca76f: mov    r8d,esi
0x1401ca772: mov    edx,0x7
0x1401ca777: lea    rcx,[rip+0x247fc72]        # 0x14264a3f0
0x1401ca77e: call   0x1400bb120
0x1401ca783: mov    rax,QWORD PTR [r12+0x130]
0x1401ca78b: test   BYTE PTR [rax+0x58],0x8
0x1401ca78f: je     0x1401ca7b8
0x1401ca791: cmp    esi,edi
0x1401ca793: jne    0x1401ca79d
0x1401ca795: mov    edx,DWORD PTR [rip+0x24816e9]        # 0x14264be84
0x1401ca79b: jmp    0x1401ca7d4
0x1401ca79d: lea    rcx,[rip+0x247fc4c]        # 0x14264a3f0
0x1401ca7a4: cmp    esi,ebx
0x1401ca7a6: jne    0x1401ca7b0
0x1401ca7a8: mov    edx,DWORD PTR [rip+0x24816ee]        # 0x14264be9c
0x1401ca7ae: jmp    0x1401ca7db
0x1401ca7b0: mov    edx,DWORD PTR [rip+0x24816da]        # 0x14264be90
0x1401ca7b6: jmp    0x1401ca7db
0x1401ca7b8: cmp    esi,edi
0x1401ca7ba: jne    0x1401ca7c4
0x1401ca7bc: mov    edx,DWORD PTR [rip+0x248167a]        # 0x14264be3c
0x1401ca7c2: jmp    0x1401ca7d4
0x1401ca7c4: cmp    esi,ebx
0x1401ca7c6: mov    edx,DWORD PTR [rip+0x2481688]        # 0x14264be54
0x1401ca7cc: je     0x1401ca7d4
0x1401ca7ce: mov    edx,DWORD PTR [rip+0x2481674]        # 0x14264be48
0x1401ca7d4: lea    rcx,[rip+0x247fc15]        # 0x14264a3f0
0x1401ca7db: call   0x140adaad0
0x1401ca7e0: inc    esi
0x1401ca7e2: cmp    esi,ebx
0x1401ca7e4: mov    eax,0x5
0x1401ca7e9: jle    0x1401ca690
0x1401ca7ef: xor    r8d,r8d
0x1401ca7f2: mov    edx,0x7
0x1401ca7f7: mov    r9b,0x1
0x1401ca7fa: lea    rcx,[rip+0x247fbef]        # 0x14264a3f0
0x1401ca801: call   0x1400bb130
0x1401ca806: lea    r8d,[rdi+0x2]
0x1401ca80a: mov    edx,0x6
0x1401ca80f: lea    rcx,[rip+0x247fbda]        # 0x14264a3f0
0x1401ca816: call   0x1400bb120
0x1401ca81b: lea    rdx,[rip+0x14398b6]        # 0x1416040d8  'Free captives belonging to your civilization'
0x1401ca822: lea    rcx,[rbp+0x2a70]
0x1401ca829: call   0x140068150
0x1401ca82e: nop
0x1401ca82f: xor    r9d,r9d
0x1401ca832: xor    r8d,r8d
0x1401ca835: lea    rdx,[rbp+0x2a70]
0x1401ca83c: lea    rcx,[rip+0x247fbad]        # 0x14264a3f0
0x1401ca843: call   0x140ad9960
0x1401ca848: nop
0x1401ca849: lea    rcx,[rbp+0x2a70]
0x1401ca850: call   0x140067e30
0x1401ca855: mov    esi,edi
0x1401ca857: cmp    edi,ebx
0x1401ca859: jg     0x1401ca9bd
0x1401ca85f: nop
0x1401ca860: mov    r8d,esi
0x1401ca863: mov    edx,0x8
0x1401ca868: lea    rcx,[rip+0x247fb81]        # 0x14264a3f0
0x1401ca86f: call   0x1400bb120
0x1401ca874: mov    rax,QWORD PTR [r12+0x130]
0x1401ca87c: test   BYTE PTR [rax+0x58],0x10
0x1401ca880: je     0x1401ca8a9
0x1401ca882: cmp    esi,edi
0x1401ca884: jne    0x1401ca88e
0x1401ca886: mov    edx,DWORD PTR [rip+0x24815f0]        # 0x14264be7c
0x1401ca88c: jmp    0x1401ca8c5
0x1401ca88e: lea    rcx,[rip+0x247fb5b]        # 0x14264a3f0
0x1401ca895: cmp    esi,ebx
0x1401ca897: jne    0x1401ca8a1
0x1401ca899: mov    edx,DWORD PTR [rip+0x24815f5]        # 0x14264be94
0x1401ca89f: jmp    0x1401ca8cc
0x1401ca8a1: mov    edx,DWORD PTR [rip+0x24815e1]        # 0x14264be88
0x1401ca8a7: jmp    0x1401ca8cc
0x1401ca8a9: cmp    esi,edi
0x1401ca8ab: jne    0x1401ca8b5
0x1401ca8ad: mov    edx,DWORD PTR [rip+0x2481581]        # 0x14264be34
0x1401ca8b3: jmp    0x1401ca8c5
0x1401ca8b5: cmp    esi,ebx
0x1401ca8b7: mov    edx,DWORD PTR [rip+0x248158f]        # 0x14264be4c
0x1401ca8bd: je     0x1401ca8c5
0x1401ca8bf: mov    edx,DWORD PTR [rip+0x248157b]        # 0x14264be40
0x1401ca8c5: lea    rcx,[rip+0x247fb24]        # 0x14264a3f0
0x1401ca8cc: call   0x140adaad0
0x1401ca8d1: mov    r8d,esi
0x1401ca8d4: mov    edx,0x9
0x1401ca8d9: lea    rcx,[rip+0x247fb10]        # 0x14264a3f0
0x1401ca8e0: call   0x1400bb120
0x1401ca8e5: mov    rax,QWORD PTR [r12+0x130]
0x1401ca8ed: test   BYTE PTR [rax+0x58],0x10
0x1401ca8f1: je     0x1401ca91a
0x1401ca8f3: cmp    esi,edi
0x1401ca8f5: jne    0x1401ca8ff
0x1401ca8f7: mov    edx,DWORD PTR [rip+0x2481583]        # 0x14264be80
0x1401ca8fd: jmp    0x1401ca936
0x1401ca8ff: lea    rcx,[rip+0x247faea]        # 0x14264a3f0
0x1401ca906: cmp    esi,ebx
0x1401ca908: jne    0x1401ca912
0x1401ca90a: mov    edx,DWORD PTR [rip+0x2481588]        # 0x14264be98
0x1401ca910: jmp    0x1401ca93d
0x1401ca912: mov    edx,DWORD PTR [rip+0x2481574]        # 0x14264be8c
0x1401ca918: jmp    0x1401ca93d
0x1401ca91a: cmp    esi,edi
0x1401ca91c: jne    0x1401ca926
0x1401ca91e: mov    edx,DWORD PTR [rip+0x2481514]        # 0x14264be38
0x1401ca924: jmp    0x1401ca936
0x1401ca926: cmp    esi,ebx
0x1401ca928: mov    edx,DWORD PTR [rip+0x2481522]        # 0x14264be50
0x1401ca92e: je     0x1401ca936
0x1401ca930: mov    edx,DWORD PTR [rip+0x248150e]        # 0x14264be44
0x1401ca936: lea    rcx,[rip+0x247fab3]        # 0x14264a3f0
0x1401ca93d: call   0x140adaad0
0x1401ca942: mov    r8d,esi
0x1401ca945: mov    edx,0xa
0x1401ca94a: lea    rcx,[rip+0x247fa9f]        # 0x14264a3f0
0x1401ca951: call   0x1400bb120
0x1401ca956: mov    rax,QWORD PTR [r12+0x130]
0x1401ca95e: test   BYTE PTR [rax+0x58],0x10
0x1401ca962: je     0x1401ca98b
0x1401ca964: cmp    esi,edi
0x1401ca966: jne    0x1401ca970
0x1401ca968: mov    edx,DWORD PTR [rip+0x2481516]        # 0x14264be84
0x1401ca96e: jmp    0x1401ca9a7
0x1401ca970: lea    rcx,[rip+0x247fa79]        # 0x14264a3f0
0x1401ca977: cmp    esi,ebx
0x1401ca979: jne    0x1401ca983
0x1401ca97b: mov    edx,DWORD PTR [rip+0x248151b]        # 0x14264be9c
0x1401ca981: jmp    0x1401ca9ae
0x1401ca983: mov    edx,DWORD PTR [rip+0x2481507]        # 0x14264be90
0x1401ca989: jmp    0x1401ca9ae
0x1401ca98b: cmp    esi,edi
0x1401ca98d: jne    0x1401ca997
0x1401ca98f: mov    edx,DWORD PTR [rip+0x24814a7]        # 0x14264be3c
0x1401ca995: jmp    0x1401ca9a7
0x1401ca997: cmp    esi,ebx
0x1401ca999: mov    edx,DWORD PTR [rip+0x24814b5]        # 0x14264be54
0x1401ca99f: je     0x1401ca9a7
0x1401ca9a1: mov    edx,DWORD PTR [rip+0x24814a1]        # 0x14264be48
0x1401ca9a7: lea    rcx,[rip+0x247fa42]        # 0x14264a3f0
0x1401ca9ae: call   0x140adaad0
0x1401ca9b3: inc    esi
0x1401ca9b5: cmp    esi,ebx
0x1401ca9b7: jle    0x1401ca860
0x1401ca9bd: xor    r8d,r8d
0x1401ca9c0: mov    edx,0x7
0x1401ca9c5: mov    r9b,0x1
0x1401ca9c8: lea    rcx,[rip+0x247fa21]        # 0x14264a3f0
0x1401ca9cf: call   0x1400bb130
0x1401ca9d4: lea    r8d,[rdi+0x2]
0x1401ca9d8: mov    edx,0x9
0x1401ca9dd: lea    rcx,[rip+0x247fa0c]        # 0x14264a3f0
0x1401ca9e4: call   0x1400bb120
0x1401ca9e9: lea    rdx,[rip+0x1439718]        # 0x141604108  'Release other prisoners'
0x1401ca9f0: lea    rcx,[rbp+0x2a90]
0x1401ca9f7: call   0x140068150
0x1401ca9fc: nop
0x1401ca9fd: xor    r9d,r9d
0x1401caa00: xor    r8d,r8d
0x1401caa03: lea    rdx,[rbp+0x2a90]
0x1401caa0a: lea    rcx,[rip+0x247f9df]        # 0x14264a3f0
0x1401caa11: call   0x140ad9960
0x1401caa16: nop
0x1401caa17: lea    rcx,[rbp+0x2a90]
0x1401caa1e: call   0x140067e30
0x1401caa23: mov    esi,edi
0x1401caa25: mov    r14d,0xc
0x1401caa2b: cmp    edi,ebx
0x1401caa2d: jg     0x1401cab9d
0x1401caa33: mov    eax,0xb
0x1401caa38: nop    DWORD PTR [rax+rax*1+0x0]
0x1401caa40: mov    r8d,esi
0x1401caa43: mov    edx,eax
0x1401caa45: lea    rcx,[rip+0x247f9a4]        # 0x14264a3f0
0x1401caa4c: call   0x1400bb120
0x1401caa51: mov    rax,QWORD PTR [r12+0x130]
0x1401caa59: test   BYTE PTR [rax+0x58],0x20
0x1401caa5d: je     0x1401caa86
0x1401caa5f: cmp    esi,edi
0x1401caa61: jne    0x1401caa6b
0x1401caa63: mov    edx,DWORD PTR [rip+0x2481413]        # 0x14264be7c
0x1401caa69: jmp    0x1401caaa2
0x1401caa6b: lea    rcx,[rip+0x247f97e]        # 0x14264a3f0
0x1401caa72: cmp    esi,ebx
0x1401caa74: jne    0x1401caa7e
0x1401caa76: mov    edx,DWORD PTR [rip+0x2481418]        # 0x14264be94
0x1401caa7c: jmp    0x1401caaa9
0x1401caa7e: mov    edx,DWORD PTR [rip+0x2481404]        # 0x14264be88
0x1401caa84: jmp    0x1401caaa9
0x1401caa86: cmp    esi,edi
0x1401caa88: jne    0x1401caa92
0x1401caa8a: mov    edx,DWORD PTR [rip+0x24813a4]        # 0x14264be34
0x1401caa90: jmp    0x1401caaa2
0x1401caa92: cmp    esi,ebx
0x1401caa94: mov    edx,DWORD PTR [rip+0x24813b2]        # 0x14264be4c
0x1401caa9a: je     0x1401caaa2
0x1401caa9c: mov    edx,DWORD PTR [rip+0x248139e]        # 0x14264be40
0x1401caaa2: lea    rcx,[rip+0x247f947]        # 0x14264a3f0
0x1401caaa9: call   0x140adaad0
0x1401caaae: mov    r8d,esi
0x1401caab1: mov    edx,r14d
0x1401caab4: lea    rcx,[rip+0x247f935]        # 0x14264a3f0
0x1401caabb: call   0x1400bb120
0x1401caac0: mov    rax,QWORD PTR [r12+0x130]
0x1401caac8: test   BYTE PTR [rax+0x58],0x20
0x1401caacc: je     0x1401caaf5
0x1401caace: cmp    esi,edi
0x1401caad0: jne    0x1401caada
0x1401caad2: mov    edx,DWORD PTR [rip+0x24813a8]        # 0x14264be80
0x1401caad8: jmp    0x1401cab11
0x1401caada: lea    rcx,[rip+0x247f90f]        # 0x14264a3f0
0x1401caae1: cmp    esi,ebx
0x1401caae3: jne    0x1401caaed
0x1401caae5: mov    edx,DWORD PTR [rip+0x24813ad]        # 0x14264be98
0x1401caaeb: jmp    0x1401cab18
0x1401caaed: mov    edx,DWORD PTR [rip+0x2481399]        # 0x14264be8c
0x1401caaf3: jmp    0x1401cab18
0x1401caaf5: cmp    esi,edi
0x1401caaf7: jne    0x1401cab01
0x1401caaf9: mov    edx,DWORD PTR [rip+0x2481339]        # 0x14264be38
0x1401caaff: jmp    0x1401cab11
0x1401cab01: cmp    esi,ebx
0x1401cab03: mov    edx,DWORD PTR [rip+0x2481347]        # 0x14264be50
0x1401cab09: je     0x1401cab11
0x1401cab0b: mov    edx,DWORD PTR [rip+0x2481333]        # 0x14264be44
0x1401cab11: lea    rcx,[rip+0x247f8d8]        # 0x14264a3f0
0x1401cab18: call   0x140adaad0
0x1401cab1d: mov    r8d,esi
0x1401cab20: mov    edx,0xd
0x1401cab25: lea    rcx,[rip+0x247f8c4]        # 0x14264a3f0
0x1401cab2c: call   0x1400bb120
0x1401cab31: mov    rax,QWORD PTR [r12+0x130]
0x1401cab39: test   BYTE PTR [rax+0x58],0x20
0x1401cab3d: je     0x1401cab66
0x1401cab3f: cmp    esi,edi
0x1401cab41: jne    0x1401cab4b
0x1401cab43: mov    edx,DWORD PTR [rip+0x248133b]        # 0x14264be84
0x1401cab49: jmp    0x1401cab82
0x1401cab4b: lea    rcx,[rip+0x247f89e]        # 0x14264a3f0
0x1401cab52: cmp    esi,ebx
0x1401cab54: jne    0x1401cab5e
0x1401cab56: mov    edx,DWORD PTR [rip+0x2481340]        # 0x14264be9c
0x1401cab5c: jmp    0x1401cab89
0x1401cab5e: mov    edx,DWORD PTR [rip+0x248132c]        # 0x14264be90
0x1401cab64: jmp    0x1401cab89
0x1401cab66: cmp    esi,edi
0x1401cab68: jne    0x1401cab72
0x1401cab6a: mov    edx,DWORD PTR [rip+0x24812cc]        # 0x14264be3c
0x1401cab70: jmp    0x1401cab82
0x1401cab72: cmp    esi,ebx
0x1401cab74: mov    edx,DWORD PTR [rip+0x24812da]        # 0x14264be54
0x1401cab7a: je     0x1401cab82
0x1401cab7c: mov    edx,DWORD PTR [rip+0x24812c6]        # 0x14264be48
0x1401cab82: lea    rcx,[rip+0x247f867]        # 0x14264a3f0
0x1401cab89: call   0x140adaad0
0x1401cab8e: inc    esi
0x1401cab90: cmp    esi,ebx
0x1401cab92: mov    eax,0xb
0x1401cab97: jle    0x1401caa40
0x1401cab9d: xor    r8d,r8d
0x1401caba0: mov    edx,0x7
0x1401caba5: mov    r9b,0x1
0x1401caba8: lea    rcx,[rip+0x247f841]        # 0x14264a3f0
0x1401cabaf: call   0x1400bb130
0x1401cabb4: lea    r8d,[rdi+0x2]
0x1401cabb8: mov    edx,r14d
0x1401cabbb: lea    rcx,[rip+0x247f82e]        # 0x14264a3f0
0x1401cabc2: call   0x1400bb120
0x1401cabc7: lea    rdx,[rip+0x1439552]        # 0x141604120  'Take important treasures'
0x1401cabce: lea    rcx,[rbp+0x2ab0]
0x1401cabd5: call   0x140068150
0x1401cabda: nop
0x1401cabdb: xor    r9d,r9d
0x1401cabde: xor    r8d,r8d
0x1401cabe1: lea    rdx,[rbp+0x2ab0]
0x1401cabe8: lea    rcx,[rip+0x247f801]        # 0x14264a3f0
0x1401cabef: call   0x140ad9960
0x1401cabf4: nop
0x1401cabf5: lea    rcx,[rbp+0x2ab0]
0x1401cabfc: call   0x140067e30
0x1401cac01: mov    esi,edi
0x1401cac03: cmp    edi,ebx
0x1401cac05: jg     0x1401cad6d
0x1401cac0b: nop    DWORD PTR [rax+rax*1+0x0]
0x1401cac10: mov    r8d,esi
0x1401cac13: mov    edx,0xe
0x1401cac18: lea    rcx,[rip+0x247f7d1]        # 0x14264a3f0
0x1401cac1f: call   0x1400bb120
0x1401cac24: mov    rax,QWORD PTR [r12+0x130]
0x1401cac2c: test   BYTE PTR [rax+0x58],0x40
0x1401cac30: je     0x1401cac59
0x1401cac32: cmp    esi,edi
0x1401cac34: jne    0x1401cac3e
0x1401cac36: mov    edx,DWORD PTR [rip+0x2481240]        # 0x14264be7c
0x1401cac3c: jmp    0x1401cac75
0x1401cac3e: lea    rcx,[rip+0x247f7ab]        # 0x14264a3f0
0x1401cac45: cmp    esi,ebx
0x1401cac47: jne    0x1401cac51
0x1401cac49: mov    edx,DWORD PTR [rip+0x2481245]        # 0x14264be94
0x1401cac4f: jmp    0x1401cac7c
0x1401cac51: mov    edx,DWORD PTR [rip+0x2481231]        # 0x14264be88
0x1401cac57: jmp    0x1401cac7c
0x1401cac59: cmp    esi,edi
0x1401cac5b: jne    0x1401cac65
0x1401cac5d: mov    edx,DWORD PTR [rip+0x24811d1]        # 0x14264be34
0x1401cac63: jmp    0x1401cac75
0x1401cac65: cmp    esi,ebx
0x1401cac67: mov    edx,DWORD PTR [rip+0x24811df]        # 0x14264be4c
0x1401cac6d: je     0x1401cac75
0x1401cac6f: mov    edx,DWORD PTR [rip+0x24811cb]        # 0x14264be40
0x1401cac75: lea    rcx,[rip+0x247f774]        # 0x14264a3f0
0x1401cac7c: call   0x140adaad0
0x1401cac81: mov    r8d,esi
0x1401cac84: mov    edx,0xf
0x1401cac89: lea    rcx,[rip+0x247f760]        # 0x14264a3f0
0x1401cac90: call   0x1400bb120
0x1401cac95: mov    rax,QWORD PTR [r12+0x130]
0x1401cac9d: test   BYTE PTR [rax+0x58],0x40
0x1401caca1: je     0x1401cacca
0x1401caca3: cmp    esi,edi
0x1401caca5: jne    0x1401cacaf
0x1401caca7: mov    edx,DWORD PTR [rip+0x24811d3]        # 0x14264be80
0x1401cacad: jmp    0x1401cace6
0x1401cacaf: lea    rcx,[rip+0x247f73a]        # 0x14264a3f0
0x1401cacb6: cmp    esi,ebx
0x1401cacb8: jne    0x1401cacc2
0x1401cacba: mov    edx,DWORD PTR [rip+0x24811d8]        # 0x14264be98
0x1401cacc0: jmp    0x1401caced
0x1401cacc2: mov    edx,DWORD PTR [rip+0x24811c4]        # 0x14264be8c
0x1401cacc8: jmp    0x1401caced
0x1401cacca: cmp    esi,edi
0x1401caccc: jne    0x1401cacd6
0x1401cacce: mov    edx,DWORD PTR [rip+0x2481164]        # 0x14264be38
0x1401cacd4: jmp    0x1401cace6
0x1401cacd6: cmp    esi,ebx
0x1401cacd8: mov    edx,DWORD PTR [rip+0x2481172]        # 0x14264be50
0x1401cacde: je     0x1401cace6
0x1401cace0: mov    edx,DWORD PTR [rip+0x248115e]        # 0x14264be44
0x1401cace6: lea    rcx,[rip+0x247f703]        # 0x14264a3f0
0x1401caced: call   0x140adaad0
0x1401cacf2: mov    r8d,esi
0x1401cacf5: mov    edx,0x10
0x1401cacfa: lea    rcx,[rip+0x247f6ef]        # 0x14264a3f0
0x1401cad01: call   0x1400bb120
0x1401cad06: mov    rax,QWORD PTR [r12+0x130]
0x1401cad0e: test   BYTE PTR [rax+0x58],0x40
0x1401cad12: je     0x1401cad3b
0x1401cad14: cmp    esi,edi
0x1401cad16: jne    0x1401cad20
0x1401cad18: mov    edx,DWORD PTR [rip+0x2481166]        # 0x14264be84
0x1401cad1e: jmp    0x1401cad57
0x1401cad20: lea    rcx,[rip+0x247f6c9]        # 0x14264a3f0
0x1401cad27: cmp    esi,ebx
0x1401cad29: jne    0x1401cad33
0x1401cad2b: mov    edx,DWORD PTR [rip+0x248116b]        # 0x14264be9c
0x1401cad31: jmp    0x1401cad5e
0x1401cad33: mov    edx,DWORD PTR [rip+0x2481157]        # 0x14264be90
0x1401cad39: jmp    0x1401cad5e
0x1401cad3b: cmp    esi,edi
0x1401cad3d: jne    0x1401cad47
0x1401cad3f: mov    edx,DWORD PTR [rip+0x24810f7]        # 0x14264be3c
0x1401cad45: jmp    0x1401cad57
0x1401cad47: cmp    esi,ebx
0x1401cad49: mov    edx,DWORD PTR [rip+0x2481105]        # 0x14264be54
0x1401cad4f: je     0x1401cad57
0x1401cad51: mov    edx,DWORD PTR [rip+0x24810f1]        # 0x14264be48
0x1401cad57: lea    rcx,[rip+0x247f692]        # 0x14264a3f0
0x1401cad5e: call   0x140adaad0
0x1401cad63: inc    esi
0x1401cad65: cmp    esi,ebx
0x1401cad67: jle    0x1401cac10
0x1401cad6d: xor    r8d,r8d
0x1401cad70: mov    edx,0x7
0x1401cad75: mov    r9b,0x1
0x1401cad78: lea    rcx,[rip+0x247f671]        # 0x14264a3f0
0x1401cad7f: call   0x1400bb130
0x1401cad84: lea    r8d,[rdi+0x2]
0x1401cad88: mov    edx,0xf
0x1401cad8d: lea    rcx,[rip+0x247f65c]        # 0x14264a3f0
0x1401cad94: call   0x1400bb120
0x1401cad99: lea    rdx,[rip+0x14393a0]        # 0x141604140  'Loot other items'
0x1401cada0: lea    rcx,[rbp+0x2ad0]
0x1401cada7: call   0x140068150
0x1401cadac: nop
0x1401cadad: xor    r9d,r9d
0x1401cadb0: xor    r8d,r8d
0x1401cadb3: lea    rdx,[rbp+0x2ad0]
0x1401cadba: lea    rcx,[rip+0x247f62f]        # 0x14264a3f0
0x1401cadc1: call   0x140ad9960
0x1401cadc6: nop
0x1401cadc7: lea    rcx,[rbp+0x2ad0]
0x1401cadce: call   0x140067e30
0x1401cadd3: mov    esi,edi
0x1401cadd5: cmp    edi,ebx
0x1401cadd7: jg     0x1401caf3d
0x1401caddd: nop    DWORD PTR [rax]
0x1401cade0: mov    r8d,esi
0x1401cade3: mov    edx,0x11
0x1401cade8: lea    rcx,[rip+0x247f601]        # 0x14264a3f0
0x1401cadef: call   0x1400bb120
0x1401cadf4: mov    rax,QWORD PTR [r12+0x130]
0x1401cadfc: test   BYTE PTR [rax+0x58],0x80
0x1401cae00: je     0x1401cae29
0x1401cae02: cmp    esi,edi
0x1401cae04: jne    0x1401cae0e
0x1401cae06: mov    edx,DWORD PTR [rip+0x2481070]        # 0x14264be7c
0x1401cae0c: jmp    0x1401cae45
0x1401cae0e: lea    rcx,[rip+0x247f5db]        # 0x14264a3f0
0x1401cae15: cmp    esi,ebx
0x1401cae17: jne    0x1401cae21
0x1401cae19: mov    edx,DWORD PTR [rip+0x2481075]        # 0x14264be94
0x1401cae1f: jmp    0x1401cae4c
0x1401cae21: mov    edx,DWORD PTR [rip+0x2481061]        # 0x14264be88
0x1401cae27: jmp    0x1401cae4c
0x1401cae29: cmp    esi,edi
0x1401cae2b: jne    0x1401cae35
0x1401cae2d: mov    edx,DWORD PTR [rip+0x2481001]        # 0x14264be34
0x1401cae33: jmp    0x1401cae45
0x1401cae35: cmp    esi,ebx
0x1401cae37: mov    edx,DWORD PTR [rip+0x248100f]        # 0x14264be4c
0x1401cae3d: je     0x1401cae45
0x1401cae3f: mov    edx,DWORD PTR [rip+0x2480ffb]        # 0x14264be40
0x1401cae45: lea    rcx,[rip+0x247f5a4]        # 0x14264a3f0
0x1401cae4c: call   0x140adaad0
0x1401cae51: mov    r8d,esi
0x1401cae54: mov    edx,0x12
0x1401cae59: lea    rcx,[rip+0x247f590]        # 0x14264a3f0
0x1401cae60: call   0x1400bb120
0x1401cae65: mov    rax,QWORD PTR [r12+0x130]
0x1401cae6d: test   BYTE PTR [rax+0x58],0x80
0x1401cae71: je     0x1401cae9a
0x1401cae73: cmp    esi,edi
0x1401cae75: jne    0x1401cae7f
0x1401cae77: mov    edx,DWORD PTR [rip+0x2481003]        # 0x14264be80
0x1401cae7d: jmp    0x1401caeb6
0x1401cae7f: lea    rcx,[rip+0x247f56a]        # 0x14264a3f0
0x1401cae86: cmp    esi,ebx
0x1401cae88: jne    0x1401cae92
0x1401cae8a: mov    edx,DWORD PTR [rip+0x2481008]        # 0x14264be98
0x1401cae90: jmp    0x1401caebd
0x1401cae92: mov    edx,DWORD PTR [rip+0x2480ff4]        # 0x14264be8c
0x1401cae98: jmp    0x1401caebd
0x1401cae9a: cmp    esi,edi
0x1401cae9c: jne    0x1401caea6
0x1401cae9e: mov    edx,DWORD PTR [rip+0x2480f94]        # 0x14264be38
0x1401caea4: jmp    0x1401caeb6
0x1401caea6: cmp    esi,ebx
0x1401caea8: mov    edx,DWORD PTR [rip+0x2480fa2]        # 0x14264be50
0x1401caeae: je     0x1401caeb6
0x1401caeb0: mov    edx,DWORD PTR [rip+0x2480f8e]        # 0x14264be44
0x1401caeb6: lea    rcx,[rip+0x247f533]        # 0x14264a3f0
0x1401caebd: call   0x140adaad0
0x1401caec2: mov    r8d,esi
0x1401caec5: mov    edx,0x13
0x1401caeca: lea    rcx,[rip+0x247f51f]        # 0x14264a3f0
0x1401caed1: call   0x1400bb120
0x1401caed6: mov    rax,QWORD PTR [r12+0x130]
0x1401caede: test   BYTE PTR [rax+0x58],0x80
0x1401caee2: je     0x1401caf0b
0x1401caee4: cmp    esi,edi
0x1401caee6: jne    0x1401caef0
0x1401caee8: mov    edx,DWORD PTR [rip+0x2480f96]        # 0x14264be84
0x1401caeee: jmp    0x1401caf27
0x1401caef0: lea    rcx,[rip+0x247f4f9]        # 0x14264a3f0
0x1401caef7: cmp    esi,ebx
0x1401caef9: jne    0x1401caf03
0x1401caefb: mov    edx,DWORD PTR [rip+0x2480f9b]        # 0x14264be9c
0x1401caf01: jmp    0x1401caf2e
0x1401caf03: mov    edx,DWORD PTR [rip+0x2480f87]        # 0x14264be90
0x1401caf09: jmp    0x1401caf2e
0x1401caf0b: cmp    esi,edi
0x1401caf0d: jne    0x1401caf17
0x1401caf0f: mov    edx,DWORD PTR [rip+0x2480f27]        # 0x14264be3c
0x1401caf15: jmp    0x1401caf27
0x1401caf17: cmp    esi,ebx
0x1401caf19: mov    edx,DWORD PTR [rip+0x2480f35]        # 0x14264be54
0x1401caf1f: je     0x1401caf27
0x1401caf21: mov    edx,DWORD PTR [rip+0x2480f21]        # 0x14264be48
0x1401caf27: lea    rcx,[rip+0x247f4c2]        # 0x14264a3f0
0x1401caf2e: call   0x140adaad0
0x1401caf33: inc    esi
0x1401caf35: cmp    esi,ebx
0x1401caf37: jle    0x1401cade0
0x1401caf3d: xor    r8d,r8d
0x1401caf40: mov    edx,0x7
0x1401caf45: mov    r9b,0x1
0x1401caf48: lea    rcx,[rip+0x247f4a1]        # 0x14264a3f0
0x1401caf4f: call   0x1400bb130
0x1401caf54: lea    r8d,[rdi+0x2]
0x1401caf58: mov    edx,0x12
0x1401caf5d: lea    rcx,[rip+0x247f48c]        # 0x14264a3f0
0x1401caf64: call   0x1400bb120
0x1401caf69: lea    rdx,[rip+0x14391e8]        # 0x141604158  'Steal livestock'
0x1401caf70: lea    rcx,[rbp+0x2af0]
0x1401caf77: call   0x140068150
0x1401caf7c: nop
0x1401caf7d: xor    r9d,r9d
0x1401caf80: xor    r8d,r8d
0x1401caf83: lea    rdx,[rbp+0x2af0]
0x1401caf8a: lea    rcx,[rip+0x247f45f]        # 0x14264a3f0
0x1401caf91: call   0x140ad9960
0x1401caf96: nop
0x1401caf97: lea    rcx,[rbp+0x2af0]
0x1401caf9e: call   0x140067e30
0x1401cafa3: jmp    0x1401c9e72
0x1401cafa8: cmp    edi,ebx
0x1401cafaa: jg     0x1401cb11c
0x1401cafb0: mov    eax,0x5
0x1401cafb5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x1401cafc0: mov    r8d,esi
0x1401cafc3: mov    edx,eax
0x1401cafc5: lea    rcx,[rip+0x247f424]        # 0x14264a3f0
0x1401cafcc: call   0x1400bb120
0x1401cafd1: mov    rax,QWORD PTR [r12+0x130]
0x1401cafd9: cmp    DWORD PTR [rax],0x4
0x1401cafdc: jne    0x1401cb005
0x1401cafde: cmp    esi,edi
0x1401cafe0: jne    0x1401cafea
0x1401cafe2: mov    edx,DWORD PTR [rip+0x2480e94]        # 0x14264be7c
0x1401cafe8: jmp    0x1401cb021
0x1401cafea: lea    rcx,[rip+0x247f3ff]        # 0x14264a3f0
0x1401caff1: cmp    esi,ebx
0x1401caff3: jne    0x1401caffd
0x1401caff5: mov    edx,DWORD PTR [rip+0x2480e99]        # 0x14264be94
0x1401caffb: jmp    0x1401cb028
0x1401caffd: mov    edx,DWORD PTR [rip+0x2480e85]        # 0x14264be88
0x1401cb003: jmp    0x1401cb028
0x1401cb005: cmp    esi,edi
0x1401cb007: jne    0x1401cb011
0x1401cb009: mov    edx,DWORD PTR [rip+0x2480e25]        # 0x14264be34
0x1401cb00f: jmp    0x1401cb021
0x1401cb011: cmp    esi,ebx
0x1401cb013: mov    edx,DWORD PTR [rip+0x2480e33]        # 0x14264be4c
0x1401cb019: je     0x1401cb021
0x1401cb01b: mov    edx,DWORD PTR [rip+0x2480e1f]        # 0x14264be40
0x1401cb021: lea    rcx,[rip+0x247f3c8]        # 0x14264a3f0
0x1401cb028: call   0x140adaad0
0x1401cb02d: mov    r8d,esi
0x1401cb030: mov    edx,0x6
0x1401cb035: lea    rcx,[rip+0x247f3b4]        # 0x14264a3f0
0x1401cb03c: call   0x1400bb120
0x1401cb041: mov    rax,QWORD PTR [r12+0x130]
0x1401cb049: cmp    DWORD PTR [rax],0x4
0x1401cb04c: jne    0x1401cb075
0x1401cb04e: cmp    esi,edi
0x1401cb050: jne    0x1401cb05a
0x1401cb052: mov    edx,DWORD PTR [rip+0x2480e28]        # 0x14264be80
0x1401cb058: jmp    0x1401cb091
0x1401cb05a: lea    rcx,[rip+0x247f38f]        # 0x14264a3f0
0x1401cb061: cmp    esi,ebx
0x1401cb063: jne    0x1401cb06d
0x1401cb065: mov    edx,DWORD PTR [rip+0x2480e2d]        # 0x14264be98
0x1401cb06b: jmp    0x1401cb098
0x1401cb06d: mov    edx,DWORD PTR [rip+0x2480e19]        # 0x14264be8c
0x1401cb073: jmp    0x1401cb098
0x1401cb075: cmp    esi,edi
0x1401cb077: jne    0x1401cb081
0x1401cb079: mov    edx,DWORD PTR [rip+0x2480db9]        # 0x14264be38
0x1401cb07f: jmp    0x1401cb091
0x1401cb081: cmp    esi,ebx
0x1401cb083: mov    edx,DWORD PTR [rip+0x2480dc7]        # 0x14264be50
0x1401cb089: je     0x1401cb091
0x1401cb08b: mov    edx,DWORD PTR [rip+0x2480db3]        # 0x14264be44
0x1401cb091: lea    rcx,[rip+0x247f358]        # 0x14264a3f0
0x1401cb098: call   0x140adaad0
0x1401cb09d: mov    r8d,esi
0x1401cb0a0: mov    edx,0x7
0x1401cb0a5: lea    rcx,[rip+0x247f344]        # 0x14264a3f0
0x1401cb0ac: call   0x1400bb120
0x1401cb0b1: mov    rax,QWORD PTR [r12+0x130]
0x1401cb0b9: cmp    DWORD PTR [rax],0x4
0x1401cb0bc: jne    0x1401cb0e5
0x1401cb0be: cmp    esi,edi
0x1401cb0c0: jne    0x1401cb0ca
0x1401cb0c2: mov    edx,DWORD PTR [rip+0x2480dbc]        # 0x14264be84
0x1401cb0c8: jmp    0x1401cb101
0x1401cb0ca: lea    rcx,[rip+0x247f31f]        # 0x14264a3f0
0x1401cb0d1: cmp    esi,ebx
0x1401cb0d3: jne    0x1401cb0dd
0x1401cb0d5: mov    edx,DWORD PTR [rip+0x2480dc1]        # 0x14264be9c
0x1401cb0db: jmp    0x1401cb108
0x1401cb0dd: mov    edx,DWORD PTR [rip+0x2480dad]        # 0x14264be90
0x1401cb0e3: jmp    0x1401cb108
0x1401cb0e5: cmp    esi,edi
0x1401cb0e7: jne    0x1401cb0f1
0x1401cb0e9: mov    edx,DWORD PTR [rip+0x2480d4d]        # 0x14264be3c
0x1401cb0ef: jmp    0x1401cb101
0x1401cb0f1: cmp    esi,ebx
0x1401cb0f3: mov    edx,DWORD PTR [rip+0x2480d5b]        # 0x14264be54
0x1401cb0f9: je     0x1401cb101
0x1401cb0fb: mov    edx,DWORD PTR [rip+0x2480d47]        # 0x14264be48
0x1401cb101: lea    rcx,[rip+0x247f2e8]        # 0x14264a3f0
0x1401cb108: call   0x140adaad0
0x1401cb10d: inc    esi
0x1401cb10f: cmp    esi,ebx
0x1401cb111: mov    eax,0x5
0x1401cb116: jle    0x1401cafc0
0x1401cb11c: xor    r8d,r8d
0x1401cb11f: mov    edx,0x7
0x1401cb124: mov    r9b,0x1
0x1401cb127: lea    rcx,[rip+0x247f2c2]        # 0x14264a3f0
0x1401cb12e: call   0x1400bb130
0x1401cb133: lea    r8d,[rdi+0x2]
0x1401cb137: mov    edx,0x6
0x1401cb13c: lea    rcx,[rip+0x247f2ad]        # 0x14264a3f0
0x1401cb143: call   0x1400bb120
0x1401cb148: lea    rdx,[rip+0x1439019]        # 0x141604168  'Raid (squads will try to avoid detection)'
0x1401cb14f: lea    rcx,[rbp+0x2b10]
0x1401cb156: call   0x140068150
0x1401cb15b: nop
0x1401cb15c: xor    r9d,r9d
0x1401cb15f: xor    r8d,r8d
0x1401cb162: lea    rdx,[rbp+0x2b10]
0x1401cb169: lea    rcx,[rip+0x247f280]        # 0x14264a3f0
0x1401cb170: call   0x140ad9960
0x1401cb175: nop
0x1401cb176: lea    rcx,[rbp+0x2b10]
0x1401cb17d: call   0x140067e30
0x1401cb182: mov    esi,edi
0x1401cb184: cmp    edi,ebx
0x1401cb186: jg     0x1401cb2ea
0x1401cb18c: nop    DWORD PTR [rax+0x0]
0x1401cb190: mov    r8d,esi
0x1401cb193: mov    edx,0x8
0x1401cb198: lea    rcx,[rip+0x247f251]        # 0x14264a3f0
0x1401cb19f: call   0x1400bb120
0x1401cb1a4: mov    rax,QWORD PTR [r12+0x130]
0x1401cb1ac: cmp    DWORD PTR [rax],0x6
0x1401cb1af: jne    0x1401cb1d8
0x1401cb1b1: cmp    esi,edi
0x1401cb1b3: jne    0x1401cb1bd
0x1401cb1b5: mov    edx,DWORD PTR [rip+0x2480cc1]        # 0x14264be7c
0x1401cb1bb: jmp    0x1401cb1f4
0x1401cb1bd: lea    rcx,[rip+0x247f22c]        # 0x14264a3f0
0x1401cb1c4: cmp    esi,ebx
0x1401cb1c6: jne    0x1401cb1d0
0x1401cb1c8: mov    edx,DWORD PTR [rip+0x2480cc6]        # 0x14264be94
0x1401cb1ce: jmp    0x1401cb1fb
0x1401cb1d0: mov    edx,DWORD PTR [rip+0x2480cb2]        # 0x14264be88
0x1401cb1d6: jmp    0x1401cb1fb
0x1401cb1d8: cmp    esi,edi
0x1401cb1da: jne    0x1401cb1e4
0x1401cb1dc: mov    edx,DWORD PTR [rip+0x2480c52]        # 0x14264be34
0x1401cb1e2: jmp    0x1401cb1f4
0x1401cb1e4: cmp    esi,ebx
0x1401cb1e6: mov    edx,DWORD PTR [rip+0x2480c60]        # 0x14264be4c
0x1401cb1ec: je     0x1401cb1f4
0x1401cb1ee: mov    edx,DWORD PTR [rip+0x2480c4c]        # 0x14264be40
0x1401cb1f4: lea    rcx,[rip+0x247f1f5]        # 0x14264a3f0
0x1401cb1fb: call   0x140adaad0
0x1401cb200: mov    r8d,esi
0x1401cb203: mov    edx,0x9
0x1401cb208: lea    rcx,[rip+0x247f1e1]        # 0x14264a3f0
0x1401cb20f: call   0x1400bb120
0x1401cb214: mov    rax,QWORD PTR [r12+0x130]
0x1401cb21c: cmp    DWORD PTR [rax],0x6
0x1401cb21f: jne    0x1401cb248
0x1401cb221: cmp    esi,edi
0x1401cb223: jne    0x1401cb22d
0x1401cb225: mov    edx,DWORD PTR [rip+0x2480c55]        # 0x14264be80
0x1401cb22b: jmp    0x1401cb264
0x1401cb22d: lea    rcx,[rip+0x247f1bc]        # 0x14264a3f0
0x1401cb234: cmp    esi,ebx
0x1401cb236: jne    0x1401cb240
0x1401cb238: mov    edx,DWORD PTR [rip+0x2480c5a]        # 0x14264be98
0x1401cb23e: jmp    0x1401cb26b
0x1401cb240: mov    edx,DWORD PTR [rip+0x2480c46]        # 0x14264be8c
0x1401cb246: jmp    0x1401cb26b
0x1401cb248: cmp    esi,edi
0x1401cb24a: jne    0x1401cb254
0x1401cb24c: mov    edx,DWORD PTR [rip+0x2480be6]        # 0x14264be38
0x1401cb252: jmp    0x1401cb264
0x1401cb254: cmp    esi,ebx
0x1401cb256: mov    edx,DWORD PTR [rip+0x2480bf4]        # 0x14264be50
0x1401cb25c: je     0x1401cb264
0x1401cb25e: mov    edx,DWORD PTR [rip+0x2480be0]        # 0x14264be44
0x1401cb264: lea    rcx,[rip+0x247f185]        # 0x14264a3f0
0x1401cb26b: call   0x140adaad0
0x1401cb270: mov    r8d,esi
0x1401cb273: mov    edx,0xa
0x1401cb278: lea    rcx,[rip+0x247f171]        # 0x14264a3f0
0x1401cb27f: call   0x1400bb120
0x1401cb284: mov    rax,QWORD PTR [r12+0x130]
0x1401cb28c: cmp    DWORD PTR [rax],0x6
0x1401cb28f: jne    0x1401cb2b8
0x1401cb291: cmp    esi,edi
0x1401cb293: jne    0x1401cb29d
0x1401cb295: mov    edx,DWORD PTR [rip+0x2480be9]        # 0x14264be84
0x1401cb29b: jmp    0x1401cb2d4
0x1401cb29d: lea    rcx,[rip+0x247f14c]        # 0x14264a3f0
0x1401cb2a4: cmp    esi,ebx
0x1401cb2a6: jne    0x1401cb2b0
0x1401cb2a8: mov    edx,DWORD PTR [rip+0x2480bee]        # 0x14264be9c
0x1401cb2ae: jmp    0x1401cb2db
0x1401cb2b0: mov    edx,DWORD PTR [rip+0x2480bda]        # 0x14264be90
0x1401cb2b6: jmp    0x1401cb2db
0x1401cb2b8: cmp    esi,edi
0x1401cb2ba: jne    0x1401cb2c4
0x1401cb2bc: mov    edx,DWORD PTR [rip+0x2480b7a]        # 0x14264be3c
0x1401cb2c2: jmp    0x1401cb2d4
0x1401cb2c4: cmp    esi,ebx
0x1401cb2c6: mov    edx,DWORD PTR [rip+0x2480b88]        # 0x14264be54
0x1401cb2cc: je     0x1401cb2d4
0x1401cb2ce: mov    edx,DWORD PTR [rip+0x2480b74]        # 0x14264be48
0x1401cb2d4: lea    rcx,[rip+0x247f115]        # 0x14264a3f0
0x1401cb2db: call   0x140adaad0
0x1401cb2e0: inc    esi
0x1401cb2e2: cmp    esi,ebx
0x1401cb2e4: jle    0x1401cb190
0x1401cb2ea: xor    r8d,r8d
0x1401cb2ed: mov    edx,0x7
0x1401cb2f2: mov    r9b,0x1
0x1401cb2f5: lea    rcx,[rip+0x247f0f4]        # 0x14264a3f0
0x1401cb2fc: call   0x1400bb130
0x1401cb301: lea    r8d,[rdi+0x2]
0x1401cb305: mov    edx,0x9
0x1401cb30a: lea    rcx,[rip+0x247f0df]        # 0x14264a3f0
0x1401cb311: call   0x1400bb120
0x1401cb316: lea    rdx,[rip+0x1438e7b]        # 0x141604198  'Pillage (openly attack)'
0x1401cb31d: lea    rcx,[rbp+0x2b30]
0x1401cb324: call   0x140068150
0x1401cb329: nop
0x1401cb32a: xor    r9d,r9d
0x1401cb32d: xor    r8d,r8d
0x1401cb330: lea    rdx,[rbp+0x2b30]
0x1401cb337: lea    rcx,[rip+0x247f0b2]        # 0x14264a3f0
0x1401cb33e: call   0x140ad9960
0x1401cb343: nop
0x1401cb344: lea    rcx,[rbp+0x2b30]
0x1401cb34b: call   0x140067e30
0x1401cb350: mov    esi,edi
0x1401cb352: mov    r14d,0xc
0x1401cb358: cmp    edi,ebx
0x1401cb35a: jg     0x1401cb4ca
0x1401cb360: mov    eax,0xb
0x1401cb365: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x1401cb370: mov    r8d,esi
0x1401cb373: mov    edx,eax
0x1401cb375: lea    rcx,[rip+0x247f074]        # 0x14264a3f0
0x1401cb37c: call   0x1400bb120
0x1401cb381: mov    rax,QWORD PTR [r12+0x130]
0x1401cb389: cmp    DWORD PTR [rax],0x0
0x1401cb38c: jne    0x1401cb3b5
0x1401cb38e: cmp    esi,edi
0x1401cb390: jne    0x1401cb39a
0x1401cb392: mov    edx,DWORD PTR [rip+0x2480ae4]        # 0x14264be7c
0x1401cb398: jmp    0x1401cb3d1
0x1401cb39a: lea    rcx,[rip+0x247f04f]        # 0x14264a3f0
0x1401cb3a1: cmp    esi,ebx
0x1401cb3a3: jne    0x1401cb3ad
0x1401cb3a5: mov    edx,DWORD PTR [rip+0x2480ae9]        # 0x14264be94
0x1401cb3ab: jmp    0x1401cb3d8
0x1401cb3ad: mov    edx,DWORD PTR [rip+0x2480ad5]        # 0x14264be88
0x1401cb3b3: jmp    0x1401cb3d8
0x1401cb3b5: cmp    esi,edi
0x1401cb3b7: jne    0x1401cb3c1
0x1401cb3b9: mov    edx,DWORD PTR [rip+0x2480a75]        # 0x14264be34
0x1401cb3bf: jmp    0x1401cb3d1
0x1401cb3c1: cmp    esi,ebx
0x1401cb3c3: mov    edx,DWORD PTR [rip+0x2480a83]        # 0x14264be4c
0x1401cb3c9: je     0x1401cb3d1
0x1401cb3cb: mov    edx,DWORD PTR [rip+0x2480a6f]        # 0x14264be40
0x1401cb3d1: lea    rcx,[rip+0x247f018]        # 0x14264a3f0
0x1401cb3d8: call   0x140adaad0
0x1401cb3dd: mov    r8d,esi
0x1401cb3e0: mov    edx,r14d
0x1401cb3e3: lea    rcx,[rip+0x247f006]        # 0x14264a3f0
0x1401cb3ea: call   0x1400bb120
0x1401cb3ef: mov    rax,QWORD PTR [r12+0x130]
0x1401cb3f7: cmp    DWORD PTR [rax],0x0
0x1401cb3fa: jne    0x1401cb423
0x1401cb3fc: cmp    esi,edi
0x1401cb3fe: jne    0x1401cb408
0x1401cb400: mov    edx,DWORD PTR [rip+0x2480a7a]        # 0x14264be80
0x1401cb406: jmp    0x1401cb43f
0x1401cb408: lea    rcx,[rip+0x247efe1]        # 0x14264a3f0
0x1401cb40f: cmp    esi,ebx
0x1401cb411: jne    0x1401cb41b
0x1401cb413: mov    edx,DWORD PTR [rip+0x2480a7f]        # 0x14264be98
0x1401cb419: jmp    0x1401cb446
0x1401cb41b: mov    edx,DWORD PTR [rip+0x2480a6b]        # 0x14264be8c
0x1401cb421: jmp    0x1401cb446
0x1401cb423: cmp    esi,edi
0x1401cb425: jne    0x1401cb42f
0x1401cb427: mov    edx,DWORD PTR [rip+0x2480a0b]        # 0x14264be38
0x1401cb42d: jmp    0x1401cb43f
0x1401cb42f: cmp    esi,ebx
0x1401cb431: mov    edx,DWORD PTR [rip+0x2480a19]        # 0x14264be50
0x1401cb437: je     0x1401cb43f
0x1401cb439: mov    edx,DWORD PTR [rip+0x2480a05]        # 0x14264be44
0x1401cb43f: lea    rcx,[rip+0x247efaa]        # 0x14264a3f0
0x1401cb446: call   0x140adaad0
0x1401cb44b: mov    r8d,esi
0x1401cb44e: mov    edx,0xd
0x1401cb453: lea    rcx,[rip+0x247ef96]        # 0x14264a3f0
0x1401cb45a: call   0x1400bb120
0x1401cb45f: mov    rax,QWORD PTR [r12+0x130]
0x1401cb467: cmp    DWORD PTR [rax],0x0
0x1401cb46a: jne    0x1401cb493
0x1401cb46c: cmp    esi,edi
0x1401cb46e: jne    0x1401cb478
0x1401cb470: mov    edx,DWORD PTR [rip+0x2480a0e]        # 0x14264be84
0x1401cb476: jmp    0x1401cb4af
0x1401cb478: lea    rcx,[rip+0x247ef71]        # 0x14264a3f0
0x1401cb47f: cmp    esi,ebx
0x1401cb481: jne    0x1401cb48b
0x1401cb483: mov    edx,DWORD PTR [rip+0x2480a13]        # 0x14264be9c
0x1401cb489: jmp    0x1401cb4b6
0x1401cb48b: mov    edx,DWORD PTR [rip+0x24809ff]        # 0x14264be90
0x1401cb491: jmp    0x1401cb4b6
0x1401cb493: cmp    esi,edi
0x1401cb495: jne    0x1401cb49f
0x1401cb497: mov    edx,DWORD PTR [rip+0x248099f]        # 0x14264be3c
0x1401cb49d: jmp    0x1401cb4af
0x1401cb49f: cmp    esi,ebx
0x1401cb4a1: mov    edx,DWORD PTR [rip+0x24809ad]        # 0x14264be54
0x1401cb4a7: je     0x1401cb4af
0x1401cb4a9: mov    edx,DWORD PTR [rip+0x2480999]        # 0x14264be48
0x1401cb4af: lea    rcx,[rip+0x247ef3a]        # 0x14264a3f0
0x1401cb4b6: call   0x140adaad0
0x1401cb4bb: inc    esi
0x1401cb4bd: cmp    esi,ebx
0x1401cb4bf: mov    eax,0xb
0x1401cb4c4: jle    0x1401cb370
0x1401cb4ca: xor    r8d,r8d
0x1401cb4cd: mov    edx,0x7
0x1401cb4d2: mov    r9b,0x1
0x1401cb4d5: lea    rcx,[rip+0x247ef14]        # 0x14264a3f0
0x1401cb4dc: call   0x1400bb130
0x1401cb4e1: lea    r8d,[rdi+0x2]
0x1401cb4e5: mov    edx,r14d
0x1401cb4e8: lea    rcx,[rip+0x247ef01]        # 0x14264a3f0
0x1401cb4ef: call   0x1400bb120
0x1401cb4f4: lea    rdx,[rip+0x1438cb5]        # 0x1416041b0  'Raze (openly attack and destroy site)'
0x1401cb4fb: lea    rcx,[rbp+0x2b50]
0x1401cb502: call   0x140068150
0x1401cb507: nop
0x1401cb508: xor    r9d,r9d
0x1401cb50b: xor    r8d,r8d
0x1401cb50e: lea    rdx,[rbp+0x2b50]
0x1401cb515: lea    rcx,[rip+0x247eed4]        # 0x14264a3f0
0x1401cb51c: call   0x140ad9960
0x1401cb521: nop
0x1401cb522: lea    rcx,[rbp+0x2b50]
0x1401cb529: call   0x140067e30
0x1401cb52e: mov    esi,edi
0x1401cb530: cmp    edi,ebx
0x1401cb532: jg     0x1401cb69d
0x1401cb538: nop    DWORD PTR [rax+rax*1+0x0]
0x1401cb540: mov    r8d,esi
0x1401cb543: mov    edx,0xe
0x1401cb548: lea    rcx,[rip+0x247eea1]        # 0x14264a3f0
0x1401cb54f: call   0x1400bb120
0x1401cb554: mov    rax,QWORD PTR [r12+0x130]
0x1401cb55c: test   BYTE PTR [rax+0x58],0x2
0x1401cb560: je     0x1401cb589
0x1401cb562: cmp    esi,edi
0x1401cb564: jne    0x1401cb56e
0x1401cb566: mov    edx,DWORD PTR [rip+0x2480910]        # 0x14264be7c
0x1401cb56c: jmp    0x1401cb5a5
0x1401cb56e: lea    rcx,[rip+0x247ee7b]        # 0x14264a3f0
0x1401cb575: cmp    esi,ebx
0x1401cb577: jne    0x1401cb581
0x1401cb579: mov    edx,DWORD PTR [rip+0x2480915]        # 0x14264be94
0x1401cb57f: jmp    0x1401cb5ac
0x1401cb581: mov    edx,DWORD PTR [rip+0x2480901]        # 0x14264be88
0x1401cb587: jmp    0x1401cb5ac
0x1401cb589: cmp    esi,edi
0x1401cb58b: jne    0x1401cb595
0x1401cb58d: mov    edx,DWORD PTR [rip+0x24808a1]        # 0x14264be34
0x1401cb593: jmp    0x1401cb5a5
0x1401cb595: cmp    esi,ebx
0x1401cb597: mov    edx,DWORD PTR [rip+0x24808af]        # 0x14264be4c
0x1401cb59d: je     0x1401cb5a5
0x1401cb59f: mov    edx,DWORD PTR [rip+0x248089b]        # 0x14264be40
0x1401cb5a5: lea    rcx,[rip+0x247ee44]        # 0x14264a3f0
0x1401cb5ac: call   0x140adaad0
0x1401cb5b1: mov    r8d,esi
0x1401cb5b4: mov    edx,0xf
0x1401cb5b9: lea    rcx,[rip+0x247ee30]        # 0x14264a3f0
0x1401cb5c0: call   0x1400bb120
0x1401cb5c5: mov    rax,QWORD PTR [r12+0x130]
0x1401cb5cd: test   BYTE PTR [rax+0x58],0x2
0x1401cb5d1: je     0x1401cb5fa
0x1401cb5d3: cmp    esi,edi
0x1401cb5d5: jne    0x1401cb5df
0x1401cb5d7: mov    edx,DWORD PTR [rip+0x24808a3]        # 0x14264be80
0x1401cb5dd: jmp    0x1401cb616
0x1401cb5df: lea    rcx,[rip+0x247ee0a]        # 0x14264a3f0
0x1401cb5e6: cmp    esi,ebx
0x1401cb5e8: jne    0x1401cb5f2
0x1401cb5ea: mov    edx,DWORD PTR [rip+0x24808a8]        # 0x14264be98
0x1401cb5f0: jmp    0x1401cb61d
0x1401cb5f2: mov    edx,DWORD PTR [rip+0x2480894]        # 0x14264be8c
0x1401cb5f8: jmp    0x1401cb61d
0x1401cb5fa: cmp    esi,edi
0x1401cb5fc: jne    0x1401cb606
0x1401cb5fe: mov    edx,DWORD PTR [rip+0x2480834]        # 0x14264be38
0x1401cb604: jmp    0x1401cb616
0x1401cb606: cmp    esi,ebx
0x1401cb608: mov    edx,DWORD PTR [rip+0x2480842]        # 0x14264be50
0x1401cb60e: je     0x1401cb616
0x1401cb610: mov    edx,DWORD PTR [rip+0x248082e]        # 0x14264be44
0x1401cb616: lea    rcx,[rip+0x247edd3]        # 0x14264a3f0
0x1401cb61d: call   0x140adaad0
0x1401cb622: mov    r8d,esi
0x1401cb625: mov    edx,0x10
0x1401cb62a: lea    rcx,[rip+0x247edbf]        # 0x14264a3f0
0x1401cb631: call   0x1400bb120
0x1401cb636: mov    rax,QWORD PTR [r12+0x130]
0x1401cb63e: test   BYTE PTR [rax+0x58],0x2
0x1401cb642: je     0x1401cb66b
0x1401cb644: cmp    esi,edi
0x1401cb646: jne    0x1401cb650
0x1401cb648: mov    edx,DWORD PTR [rip+0x2480836]        # 0x14264be84
0x1401cb64e: jmp    0x1401cb687
0x1401cb650: lea    rcx,[rip+0x247ed99]        # 0x14264a3f0
0x1401cb657: cmp    esi,ebx
0x1401cb659: jne    0x1401cb663
0x1401cb65b: mov    edx,DWORD PTR [rip+0x248083b]        # 0x14264be9c
0x1401cb661: jmp    0x1401cb68e
0x1401cb663: mov    edx,DWORD PTR [rip+0x2480827]        # 0x14264be90
0x1401cb669: jmp    0x1401cb68e
0x1401cb66b: cmp    esi,edi
0x1401cb66d: jne    0x1401cb677
0x1401cb66f: mov    edx,DWORD PTR [rip+0x24807c7]        # 0x14264be3c
0x1401cb675: jmp    0x1401cb687
0x1401cb677: cmp    esi,ebx
0x1401cb679: mov    edx,DWORD PTR [rip+0x24807d5]        # 0x14264be54
0x1401cb67f: je     0x1401cb687
0x1401cb681: mov    edx,DWORD PTR [rip+0x24807c1]        # 0x14264be48
0x1401cb687: lea    rcx,[rip+0x247ed62]        # 0x14264a3f0
0x1401cb68e: call   0x140adaad0
0x1401cb693: inc    esi
0x1401cb695: cmp    esi,ebx
0x1401cb697: jle    0x1401cb540
0x1401cb69d: xor    r8d,r8d
0x1401cb6a0: mov    edx,0x7
0x1401cb6a5: mov    r9b,0x1
0x1401cb6a8: lea    rcx,[rip+0x247ed41]        # 0x14264a3f0
0x1401cb6af: call   0x1400bb130
0x1401cb6b4: lea    r8d,[rdi+0x2]
0x1401cb6b8: mov    edx,0xf
0x1401cb6bd: lea    rcx,[rip+0x247ed2c]        # 0x14264a3f0
0x1401cb6c4: call   0x1400bb120
0x1401cb6c9: lea    rdx,[rip+0x1438b08]        # 0x1416041d8  'Demand one-time tribute'
0x1401cb6d0: lea    rcx,[rbp+0x2b70]
0x1401cb6d7: call   0x140068150
0x1401cb6dc: nop
0x1401cb6dd: xor    r9d,r9d
0x1401cb6e0: xor    r8d,r8d
0x1401cb6e3: lea    rdx,[rbp+0x2b70]
0x1401cb6ea: lea    rcx,[rip+0x247ecff]        # 0x14264a3f0
0x1401cb6f1: call   0x140ad9960
0x1401cb6f6: nop
0x1401cb6f7: lea    rcx,[rbp+0x2b70]
0x1401cb6fe: call   0x140067e30
0x1401cb703: mov    esi,edi
0x1401cb705: cmp    edi,ebx
0x1401cb707: jg     0x1401cb86d
0x1401cb70d: nop    DWORD PTR [rax]
0x1401cb710: mov    r8d,esi
0x1401cb713: mov    edx,0x11
0x1401cb718: lea    rcx,[rip+0x247ecd1]        # 0x14264a3f0
0x1401cb71f: call   0x1400bb120
0x1401cb724: mov    rax,QWORD PTR [r12+0x130]
0x1401cb72c: test   BYTE PTR [rax+0x58],0x4
0x1401cb730: je     0x1401cb759
0x1401cb732: cmp    esi,edi
0x1401cb734: jne    0x1401cb73e
0x1401cb736: mov    edx,DWORD PTR [rip+0x2480740]        # 0x14264be7c
0x1401cb73c: jmp    0x1401cb775
0x1401cb73e: lea    rcx,[rip+0x247ecab]        # 0x14264a3f0
0x1401cb745: cmp    esi,ebx
0x1401cb747: jne    0x1401cb751
0x1401cb749: mov    edx,DWORD PTR [rip+0x2480745]        # 0x14264be94
0x1401cb74f: jmp    0x1401cb77c
0x1401cb751: mov    edx,DWORD PTR [rip+0x2480731]        # 0x14264be88
0x1401cb757: jmp    0x1401cb77c
0x1401cb759: cmp    esi,edi
0x1401cb75b: jne    0x1401cb765
0x1401cb75d: mov    edx,DWORD PTR [rip+0x24806d1]        # 0x14264be34
0x1401cb763: jmp    0x1401cb775
0x1401cb765: cmp    esi,ebx
0x1401cb767: mov    edx,DWORD PTR [rip+0x24806df]        # 0x14264be4c
0x1401cb76d: je     0x1401cb775
0x1401cb76f: mov    edx,DWORD PTR [rip+0x24806cb]        # 0x14264be40
0x1401cb775: lea    rcx,[rip+0x247ec74]        # 0x14264a3f0
0x1401cb77c: call   0x140adaad0
0x1401cb781: mov    r8d,esi
0x1401cb784: mov    edx,0x12
0x1401cb789: lea    rcx,[rip+0x247ec60]        # 0x14264a3f0
0x1401cb790: call   0x1400bb120
0x1401cb795: mov    rax,QWORD PTR [r12+0x130]
0x1401cb79d: test   BYTE PTR [rax+0x58],0x4
0x1401cb7a1: je     0x1401cb7ca
0x1401cb7a3: cmp    esi,edi
0x1401cb7a5: jne    0x1401cb7af
0x1401cb7a7: mov    edx,DWORD PTR [rip+0x24806d3]        # 0x14264be80
0x1401cb7ad: jmp    0x1401cb7e6
0x1401cb7af: lea    rcx,[rip+0x247ec3a]        # 0x14264a3f0
0x1401cb7b6: cmp    esi,ebx
0x1401cb7b8: jne    0x1401cb7c2
0x1401cb7ba: mov    edx,DWORD PTR [rip+0x24806d8]        # 0x14264be98
0x1401cb7c0: jmp    0x1401cb7ed
0x1401cb7c2: mov    edx,DWORD PTR [rip+0x24806c4]        # 0x14264be8c
0x1401cb7c8: jmp    0x1401cb7ed
0x1401cb7ca: cmp    esi,edi
0x1401cb7cc: jne    0x1401cb7d6
0x1401cb7ce: mov    edx,DWORD PTR [rip+0x2480664]        # 0x14264be38
0x1401cb7d4: jmp    0x1401cb7e6
0x1401cb7d6: cmp    esi,ebx
0x1401cb7d8: mov    edx,DWORD PTR [rip+0x2480672]        # 0x14264be50
0x1401cb7de: je     0x1401cb7e6
0x1401cb7e0: mov    edx,DWORD PTR [rip+0x248065e]        # 0x14264be44
0x1401cb7e6: lea    rcx,[rip+0x247ec03]        # 0x14264a3f0
0x1401cb7ed: call   0x140adaad0
0x1401cb7f2: mov    r8d,esi
0x1401cb7f5: mov    edx,0x13
0x1401cb7fa: lea    rcx,[rip+0x247ebef]        # 0x14264a3f0
0x1401cb801: call   0x1400bb120
0x1401cb806: mov    rax,QWORD PTR [r12+0x130]
0x1401cb80e: test   BYTE PTR [rax+0x58],0x4
0x1401cb812: je     0x1401cb83b
0x1401cb814: cmp    esi,edi
0x1401cb816: jne    0x1401cb820
0x1401cb818: mov    edx,DWORD PTR [rip+0x2480666]        # 0x14264be84
0x1401cb81e: jmp    0x1401cb857
0x1401cb820: lea    rcx,[rip+0x247ebc9]        # 0x14264a3f0
0x1401cb827: cmp    esi,ebx
0x1401cb829: jne    0x1401cb833
0x1401cb82b: mov    edx,DWORD PTR [rip+0x248066b]        # 0x14264be9c
0x1401cb831: jmp    0x1401cb85e
0x1401cb833: mov    edx,DWORD PTR [rip+0x2480657]        # 0x14264be90
0x1401cb839: jmp    0x1401cb85e
0x1401cb83b: cmp    esi,edi
0x1401cb83d: jne    0x1401cb847
0x1401cb83f: mov    edx,DWORD PTR [rip+0x24805f7]        # 0x14264be3c
0x1401cb845: jmp    0x1401cb857
0x1401cb847: cmp    esi,ebx
0x1401cb849: mov    edx,DWORD PTR [rip+0x2480605]        # 0x14264be54
0x1401cb84f: je     0x1401cb857
0x1401cb851: mov    edx,DWORD PTR [rip+0x24805f1]        # 0x14264be48
0x1401cb857: lea    rcx,[rip+0x247eb92]        # 0x14264a3f0
0x1401cb85e: call   0x140adaad0
0x1401cb863: inc    esi
0x1401cb865: cmp    esi,ebx
0x1401cb867: jle    0x1401cb710
0x1401cb86d: xor    r8d,r8d
0x1401cb870: mov    edx,0x7
0x1401cb875: mov    r9b,0x1
0x1401cb878: lea    rcx,[rip+0x247eb71]        # 0x14264a3f0
0x1401cb87f: call   0x1400bb130
0x1401cb884: lea    r8d,[rdi+0x2]
0x1401cb888: mov    edx,0x12
0x1401cb88d: lea    rcx,[rip+0x247eb5c]        # 0x14264a3f0
0x1401cb894: call   0x1400bb120
0x1401cb899: lea    rdx,[rip+0x1438950]        # 0x1416041f0  'Demand ongoing tribute'
0x1401cb8a0: lea    rcx,[rbp+0x2b90]
0x1401cb8a7: call   0x140068150
0x1401cb8ac: nop
0x1401cb8ad: xor    r9d,r9d
0x1401cb8b0: xor    r8d,r8d
0x1401cb8b3: lea    rdx,[rbp+0x2b90]
0x1401cb8ba: lea    rcx,[rip+0x247eb2f]        # 0x14264a3f0
0x1401cb8c1: call   0x140ad9960
0x1401cb8c6: nop
0x1401cb8c7: lea    rcx,[rbp+0x2b90]
0x1401cb8ce: call   0x140067e30
0x1401cb8d3: mov    esi,edi
0x1401cb8d5: cmp    edi,ebx
0x1401cb8d7: jg     0x1401cba63
0x1401cb8dd: mov    r12d,0x14
0x1401cb8e3: mov    r14,QWORD PTR [rbp-0x78]
0x1401cb8e7: nop    WORD PTR [rax+rax*1+0x0]
0x1401cb8f0: mov    r8d,esi
0x1401cb8f3: mov    edx,r12d
0x1401cb8f6: lea    rcx,[rip+0x247eaf3]        # 0x14264a3f0
0x1401cb8fd: call   0x1400bb120
0x1401cb902: mov    rax,QWORD PTR [r14+0x130]
0x1401cb909: cmp    DWORD PTR [rax],0x2
0x1401cb90c: jne    0x1401cb93e
0x1401cb90e: test   DWORD PTR [rax+0x58],0x200
0x1401cb915: jne    0x1401cb93e
0x1401cb917: cmp    esi,edi
0x1401cb919: jne    0x1401cb923
0x1401cb91b: mov    edx,DWORD PTR [rip+0x248055b]        # 0x14264be7c
0x1401cb921: jmp    0x1401cb95a
0x1401cb923: lea    rcx,[rip+0x247eac6]        # 0x14264a3f0
0x1401cb92a: cmp    esi,ebx
0x1401cb92c: jne    0x1401cb936
0x1401cb92e: mov    edx,DWORD PTR [rip+0x2480560]        # 0x14264be94
0x1401cb934: jmp    0x1401cb961
0x1401cb936: mov    edx,DWORD PTR [rip+0x248054c]        # 0x14264be88
0x1401cb93c: jmp    0x1401cb961
0x1401cb93e: cmp    esi,edi
0x1401cb940: jne    0x1401cb94a
0x1401cb942: mov    edx,DWORD PTR [rip+0x24804ec]        # 0x14264be34
0x1401cb948: jmp    0x1401cb95a
0x1401cb94a: cmp    esi,ebx
0x1401cb94c: mov    edx,DWORD PTR [rip+0x24804fa]        # 0x14264be4c
0x1401cb952: je     0x1401cb95a
0x1401cb954: mov    edx,DWORD PTR [rip+0x24804e6]        # 0x14264be40
0x1401cb95a: lea    rcx,[rip+0x247ea8f]        # 0x14264a3f0
0x1401cb961: call   0x140adaad0
0x1401cb966: mov    r8d,esi
0x1401cb969: mov    edx,0x15
0x1401cb96e: lea    rcx,[rip+0x247ea7b]        # 0x14264a3f0
0x1401cb975: call   0x1400bb120
0x1401cb97a: mov    rax,QWORD PTR [r14+0x130]
0x1401cb981: cmp    DWORD PTR [rax],0x2
0x1401cb984: jne    0x1401cb9b6
0x1401cb986: test   DWORD PTR [rax+0x58],0x200
0x1401cb98d: jne    0x1401cb9b6
0x1401cb98f: cmp    esi,edi
0x1401cb991: jne    0x1401cb99b
0x1401cb993: mov    edx,DWORD PTR [rip+0x24804e7]        # 0x14264be80
0x1401cb999: jmp    0x1401cb9d2
0x1401cb99b: lea    rcx,[rip+0x247ea4e]        # 0x14264a3f0
0x1401cb9a2: cmp    esi,ebx
0x1401cb9a4: jne    0x1401cb9ae
0x1401cb9a6: mov    edx,DWORD PTR [rip+0x24804ec]        # 0x14264be98
0x1401cb9ac: jmp    0x1401cb9d9
0x1401cb9ae: mov    edx,DWORD PTR [rip+0x24804d8]        # 0x14264be8c
0x1401cb9b4: jmp    0x1401cb9d9
0x1401cb9b6: cmp    esi,edi
0x1401cb9b8: jne    0x1401cb9c2
0x1401cb9ba: mov    edx,DWORD PTR [rip+0x2480478]        # 0x14264be38
0x1401cb9c0: jmp    0x1401cb9d2
0x1401cb9c2: cmp    esi,ebx
0x1401cb9c4: mov    edx,DWORD PTR [rip+0x2480486]        # 0x14264be50
0x1401cb9ca: je     0x1401cb9d2
0x1401cb9cc: mov    edx,DWORD PTR [rip+0x2480472]        # 0x14264be44
0x1401cb9d2: lea    rcx,[rip+0x247ea17]        # 0x14264a3f0
0x1401cb9d9: call   0x140adaad0
0x1401cb9de: mov    r8d,esi
0x1401cb9e1: mov    edx,0x16
0x1401cb9e6: lea    rcx,[rip+0x247ea03]        # 0x14264a3f0
0x1401cb9ed: call   0x1400bb120
0x1401cb9f2: mov    rax,QWORD PTR [r14+0x130]
0x1401cb9f9: cmp    DWORD PTR [rax],0x2
0x1401cb9fc: jne    0x1401cba2e
0x1401cb9fe: test   DWORD PTR [rax+0x58],0x200
0x1401cba05: jne    0x1401cba2e
0x1401cba07: cmp    esi,edi
0x1401cba09: jne    0x1401cba13
0x1401cba0b: mov    edx,DWORD PTR [rip+0x2480473]        # 0x14264be84
0x1401cba11: jmp    0x1401cba4a
0x1401cba13: lea    rcx,[rip+0x247e9d6]        # 0x14264a3f0
0x1401cba1a: cmp    esi,ebx
0x1401cba1c: jne    0x1401cba26
0x1401cba1e: mov    edx,DWORD PTR [rip+0x2480478]        # 0x14264be9c
0x1401cba24: jmp    0x1401cba51
0x1401cba26: mov    edx,DWORD PTR [rip+0x2480464]        # 0x14264be90
0x1401cba2c: jmp    0x1401cba51
0x1401cba2e: cmp    esi,edi
0x1401cba30: jne    0x1401cba3a
0x1401cba32: mov    edx,DWORD PTR [rip+0x2480404]        # 0x14264be3c
0x1401cba38: jmp    0x1401cba4a
0x1401cba3a: cmp    esi,ebx
0x1401cba3c: mov    edx,DWORD PTR [rip+0x2480412]        # 0x14264be54
0x1401cba42: je     0x1401cba4a
0x1401cba44: mov    edx,DWORD PTR [rip+0x24803fe]        # 0x14264be48
0x1401cba4a: lea    rcx,[rip+0x247e99f]        # 0x14264a3f0
0x1401cba51: call   0x140adaad0
0x1401cba56: inc    esi
0x1401cba58: cmp    esi,ebx
0x1401cba5a: jle    0x1401cb8f0
0x1401cba60: mov    r12,r14
0x1401cba63: xor    r8d,r8d
0x1401cba66: mov    edx,0x7
0x1401cba6b: mov    r9b,0x1
0x1401cba6e: lea    rcx,[rip+0x247e97b]        # 0x14264a3f0
0x1401cba75: call   0x1400bb130
0x1401cba7a: lea    r8d,[rdi+0x2]
0x1401cba7e: mov    edx,0x15
0x1401cba83: lea    rcx,[rip+0x247e966]        # 0x14264a3f0
0x1401cba8a: call   0x1400bb120
0x1401cba8f: lea    rdx,[rip+0x1438772]        # 0x141604208  'Conquer and occupy'
0x1401cba96: lea    rcx,[rbp+0x2bb0]
0x1401cba9d: call   0x140068150
0x1401cbaa2: nop
0x1401cbaa3: xor    r9d,r9d
0x1401cbaa6: xor    r8d,r8d
0x1401cbaa9: lea    rdx,[rbp+0x2bb0]
0x1401cbab0: lea    rcx,[rip+0x247e939]        # 0x14264a3f0
0x1401cbab7: call   0x140ad9960
0x1401cbabc: nop
0x1401cbabd: lea    rcx,[rbp+0x2bb0]
0x1401cbac4: call   0x140067e30
0x1401cbac9: mov    esi,edi
0x1401cbacb: cmp    edi,ebx
0x1401cbacd: jg     0x1401cbc55
0x1401cbad3: nop    DWORD PTR [rax+0x0]
0x1401cbad7: nop    WORD PTR [rax+rax*1+0x0]
0x1401cbae0: mov    r8d,esi
0x1401cbae3: mov    edx,0x17
0x1401cbae8: lea    rcx,[rip+0x247e901]        # 0x14264a3f0
0x1401cbaef: call   0x1400bb120
0x1401cbaf4: mov    rax,QWORD PTR [r12+0x130]
0x1401cbafc: cmp    DWORD PTR [rax],0x2
0x1401cbaff: jne    0x1401cbb31
0x1401cbb01: test   DWORD PTR [rax+0x58],0x200
0x1401cbb08: je     0x1401cbb31
0x1401cbb0a: cmp    esi,edi
0x1401cbb0c: jne    0x1401cbb16
0x1401cbb0e: mov    edx,DWORD PTR [rip+0x2480368]        # 0x14264be7c
0x1401cbb14: jmp    0x1401cbb4d
0x1401cbb16: lea    rcx,[rip+0x247e8d3]        # 0x14264a3f0
0x1401cbb1d: cmp    esi,ebx
0x1401cbb1f: jne    0x1401cbb29
0x1401cbb21: mov    edx,DWORD PTR [rip+0x248036d]        # 0x14264be94
0x1401cbb27: jmp    0x1401cbb54
0x1401cbb29: mov    edx,DWORD PTR [rip+0x2480359]        # 0x14264be88
0x1401cbb2f: jmp    0x1401cbb54
0x1401cbb31: cmp    esi,edi
0x1401cbb33: jne    0x1401cbb3d
0x1401cbb35: mov    edx,DWORD PTR [rip+0x24802f9]        # 0x14264be34
0x1401cbb3b: jmp    0x1401cbb4d
0x1401cbb3d: cmp    esi,ebx
0x1401cbb3f: mov    edx,DWORD PTR [rip+0x2480307]        # 0x14264be4c
0x1401cbb45: je     0x1401cbb4d
0x1401cbb47: mov    edx,DWORD PTR [rip+0x24802f3]        # 0x14264be40
0x1401cbb4d: lea    rcx,[rip+0x247e89c]        # 0x14264a3f0
0x1401cbb54: call   0x140adaad0
0x1401cbb59: mov    r8d,esi
0x1401cbb5c: mov    edx,0x18
0x1401cbb61: lea    rcx,[rip+0x247e888]        # 0x14264a3f0
0x1401cbb68: call   0x1400bb120
0x1401cbb6d: mov    rax,QWORD PTR [r12+0x130]
0x1401cbb75: cmp    DWORD PTR [rax],0x2
0x1401cbb78: jne    0x1401cbbaa
0x1401cbb7a: test   DWORD PTR [rax+0x58],0x200
0x1401cbb81: je     0x1401cbbaa
0x1401cbb83: cmp    esi,edi
0x1401cbb85: jne    0x1401cbb8f
0x1401cbb87: mov    edx,DWORD PTR [rip+0x24802f3]        # 0x14264be80
0x1401cbb8d: jmp    0x1401cbbc6
0x1401cbb8f: lea    rcx,[rip+0x247e85a]        # 0x14264a3f0
0x1401cbb96: cmp    esi,ebx
0x1401cbb98: jne    0x1401cbba2
0x1401cbb9a: mov    edx,DWORD PTR [rip+0x24802f8]        # 0x14264be98
0x1401cbba0: jmp    0x1401cbbcd
0x1401cbba2: mov    edx,DWORD PTR [rip+0x24802e4]        # 0x14264be8c
0x1401cbba8: jmp    0x1401cbbcd
0x1401cbbaa: cmp    esi,edi
0x1401cbbac: jne    0x1401cbbb6
0x1401cbbae: mov    edx,DWORD PTR [rip+0x2480284]        # 0x14264be38
0x1401cbbb4: jmp    0x1401cbbc6
0x1401cbbb6: cmp    esi,ebx
0x1401cbbb8: mov    edx,DWORD PTR [rip+0x2480292]        # 0x14264be50
0x1401cbbbe: je     0x1401cbbc6
0x1401cbbc0: mov    edx,DWORD PTR [rip+0x248027e]        # 0x14264be44
0x1401cbbc6: lea    rcx,[rip+0x247e823]        # 0x14264a3f0
0x1401cbbcd: call   0x140adaad0
0x1401cbbd2: mov    r8d,esi
0x1401cbbd5: mov    edx,0x19
0x1401cbbda: lea    rcx,[rip+0x247e80f]        # 0x14264a3f0
0x1401cbbe1: call   0x1400bb120
0x1401cbbe6: mov    rax,QWORD PTR [r12+0x130]
0x1401cbbee: cmp    DWORD PTR [rax],0x2
0x1401cbbf1: jne    0x1401cbc23
0x1401cbbf3: test   DWORD PTR [rax+0x58],0x200
0x1401cbbfa: je     0x1401cbc23
0x1401cbbfc: cmp    esi,edi
0x1401cbbfe: jne    0x1401cbc08
0x1401cbc00: mov    edx,DWORD PTR [rip+0x248027e]        # 0x14264be84
0x1401cbc06: jmp    0x1401cbc3f
0x1401cbc08: lea    rcx,[rip+0x247e7e1]        # 0x14264a3f0
0x1401cbc0f: cmp    esi,ebx
0x1401cbc11: jne    0x1401cbc1b
0x1401cbc13: mov    edx,DWORD PTR [rip+0x2480283]        # 0x14264be9c
0x1401cbc19: jmp    0x1401cbc46
0x1401cbc1b: mov    edx,DWORD PTR [rip+0x248026f]        # 0x14264be90
0x1401cbc21: jmp    0x1401cbc46
0x1401cbc23: cmp    esi,edi
0x1401cbc25: jne    0x1401cbc2f
0x1401cbc27: mov    edx,DWORD PTR [rip+0x248020f]        # 0x14264be3c
0x1401cbc2d: jmp    0x1401cbc3f
0x1401cbc2f: cmp    esi,ebx
0x1401cbc31: mov    edx,DWORD PTR [rip+0x248021d]        # 0x14264be54
0x1401cbc37: je     0x1401cbc3f
0x1401cbc39: mov    edx,DWORD PTR [rip+0x2480209]        # 0x14264be48
0x1401cbc3f: lea    rcx,[rip+0x247e7aa]        # 0x14264a3f0
0x1401cbc46: call   0x140adaad0
0x1401cbc4b: inc    esi
0x1401cbc4d: cmp    esi,ebx
0x1401cbc4f: jle    0x1401cbae0
0x1401cbc55: xor    r8d,r8d
0x1401cbc58: mov    edx,0x7
0x1401cbc5d: mov    r9b,0x1
0x1401cbc60: lea    rcx,[rip+0x247e789]        # 0x14264a3f0
0x1401cbc67: call   0x1400bb130
0x1401cbc6c: lea    r8d,[rdi+0x2]
0x1401cbc70: mov    edx,0x18
0x1401cbc75: lea    rcx,[rip+0x247e774]        # 0x14264a3f0
0x1401cbc7c: call   0x1400bb120
0x1401cbc81: lea    rdx,[rip+0x1438220]        # 0x141603ea8  'Demand surrender and occupy'
0x1401cbc88: lea    rcx,[rbp+0x2bd0]
0x1401cbc8f: call   0x140068150
0x1401cbc94: nop
0x1401cbc95: xor    r9d,r9d
0x1401cbc98: xor    r8d,r8d
0x1401cbc9b: lea    rdx,[rbp+0x2bd0]
0x1401cbca2: lea    rcx,[rip+0x247e747]        # 0x14264a3f0
0x1401cbca9: call   0x140ad9960
0x1401cbcae: nop
0x1401cbcaf: lea    rcx,[rbp+0x2bd0]
0x1401cbcb6: call   0x140067e30
0x1401cbcbb: mov    rax,QWORD PTR [r12+0x130]
0x1401cbcc3: mov    ecx,DWORD PTR [rax]
0x1401cbcc5: cmp    ecx,0x1
0x1401cbcc8: je     0x1401cc5f8
0x1401cbcce: cmp    ecx,0x2
0x1401cbcd1: je     0x1401cc5f8
0x1401cbcd7: cmp    ecx,0x3
0x1401cbcda: je     0x1401c9e72
0x1401cbce0: mov    esi,edi
0x1401cbce2: cmp    edi,ebx
0x1401cbce4: jg     0x1401cbe4d
0x1401cbcea: nop    WORD PTR [rax+rax*1+0x0]
0x1401cbcf0: mov    r8d,esi
0x1401cbcf3: mov    edx,0x1b
0x1401cbcf8: lea    rcx,[rip+0x247e6f1]        # 0x14264a3f0
0x1401cbcff: call   0x1400bb120
0x1401cbd04: mov    rax,QWORD PTR [r12+0x130]
0x1401cbd0c: test   BYTE PTR [rax+0x58],0x8
0x1401cbd10: je     0x1401cbd39
0x1401cbd12: cmp    esi,edi
0x1401cbd14: jne    0x1401cbd1e
0x1401cbd16: mov    edx,DWORD PTR [rip+0x2480160]        # 0x14264be7c
0x1401cbd1c: jmp    0x1401cbd55
0x1401cbd1e: lea    rcx,[rip+0x247e6cb]        # 0x14264a3f0
0x1401cbd25: cmp    esi,ebx
0x1401cbd27: jne    0x1401cbd31
0x1401cbd29: mov    edx,DWORD PTR [rip+0x2480165]        # 0x14264be94
0x1401cbd2f: jmp    0x1401cbd5c
0x1401cbd31: mov    edx,DWORD PTR [rip+0x2480151]        # 0x14264be88
0x1401cbd37: jmp    0x1401cbd5c
0x1401cbd39: cmp    esi,edi
0x1401cbd3b: jne    0x1401cbd45
0x1401cbd3d: mov    edx,DWORD PTR [rip+0x24800f1]        # 0x14264be34
0x1401cbd43: jmp    0x1401cbd55
0x1401cbd45: cmp    esi,ebx
0x1401cbd47: mov    edx,DWORD PTR [rip+0x24800ff]        # 0x14264be4c
0x1401cbd4d: je     0x1401cbd55
0x1401cbd4f: mov    edx,DWORD PTR [rip+0x24800eb]        # 0x14264be40
0x1401cbd55: lea    rcx,[rip+0x247e694]        # 0x14264a3f0
0x1401cbd5c: call   0x140adaad0
0x1401cbd61: mov    r8d,esi
0x1401cbd64: mov    edx,0x1c
0x1401cbd69: lea    rcx,[rip+0x247e680]        # 0x14264a3f0
0x1401cbd70: call   0x1400bb120
0x1401cbd75: mov    rax,QWORD PTR [r12+0x130]
0x1401cbd7d: test   BYTE PTR [rax+0x58],0x8
0x1401cbd81: je     0x1401cbdaa
0x1401cbd83: cmp    esi,edi
0x1401cbd85: jne    0x1401cbd8f
0x1401cbd87: mov    edx,DWORD PTR [rip+0x24800f3]        # 0x14264be80
0x1401cbd8d: jmp    0x1401cbdc6
0x1401cbd8f: lea    rcx,[rip+0x247e65a]        # 0x14264a3f0
0x1401cbd96: cmp    esi,ebx
0x1401cbd98: jne    0x1401cbda2
0x1401cbd9a: mov    edx,DWORD PTR [rip+0x24800f8]        # 0x14264be98
0x1401cbda0: jmp    0x1401cbdcd
0x1401cbda2: mov    edx,DWORD PTR [rip+0x24800e4]        # 0x14264be8c
0x1401cbda8: jmp    0x1401cbdcd
0x1401cbdaa: cmp    esi,edi
0x1401cbdac: jne    0x1401cbdb6
0x1401cbdae: mov    edx,DWORD PTR [rip+0x2480084]        # 0x14264be38
0x1401cbdb4: jmp    0x1401cbdc6
0x1401cbdb6: cmp    esi,ebx
0x1401cbdb8: mov    edx,DWORD PTR [rip+0x2480092]        # 0x14264be50
0x1401cbdbe: je     0x1401cbdc6
0x1401cbdc0: mov    edx,DWORD PTR [rip+0x248007e]        # 0x14264be44
0x1401cbdc6: lea    rcx,[rip+0x247e623]        # 0x14264a3f0
0x1401cbdcd: call   0x140adaad0
0x1401cbdd2: mov    r8d,esi
0x1401cbdd5: mov    edx,0x1d
0x1401cbdda: lea    rcx,[rip+0x247e60f]        # 0x14264a3f0
0x1401cbde1: call   0x1400bb120
0x1401cbde6: mov    rax,QWORD PTR [r12+0x130]
0x1401cbdee: test   BYTE PTR [rax+0x58],0x8
0x1401cbdf2: je     0x1401cbe1b
0x1401cbdf4: cmp    esi,edi
0x1401cbdf6: jne    0x1401cbe00
0x1401cbdf8: mov    edx,DWORD PTR [rip+0x2480086]        # 0x14264be84
0x1401cbdfe: jmp    0x1401cbe37
0x1401cbe00: lea    rcx,[rip+0x247e5e9]        # 0x14264a3f0
0x1401cbe07: cmp    esi,ebx
0x1401cbe09: jne    0x1401cbe13
0x1401cbe0b: mov    edx,DWORD PTR [rip+0x248008b]        # 0x14264be9c
0x1401cbe11: jmp    0x1401cbe3e
0x1401cbe13: mov    edx,DWORD PTR [rip+0x2480077]        # 0x14264be90
0x1401cbe19: jmp    0x1401cbe3e
0x1401cbe1b: cmp    esi,edi
0x1401cbe1d: jne    0x1401cbe27
0x1401cbe1f: mov    edx,DWORD PTR [rip+0x2480017]        # 0x14264be3c
0x1401cbe25: jmp    0x1401cbe37
0x1401cbe27: cmp    esi,ebx
0x1401cbe29: mov    edx,DWORD PTR [rip+0x2480025]        # 0x14264be54
0x1401cbe2f: je     0x1401cbe37
0x1401cbe31: mov    edx,DWORD PTR [rip+0x2480011]        # 0x14264be48
0x1401cbe37: lea    rcx,[rip+0x247e5b2]        # 0x14264a3f0
0x1401cbe3e: call   0x140adaad0
0x1401cbe43: inc    esi
0x1401cbe45: cmp    esi,ebx
0x1401cbe47: jle    0x1401cbcf0
0x1401cbe4d: xor    r8d,r8d
0x1401cbe50: mov    edx,0x7
0x1401cbe55: mov    r9b,0x1
0x1401cbe58: lea    rcx,[rip+0x247e591]        # 0x14264a3f0
0x1401cbe5f: call   0x1400bb130
0x1401cbe64: lea    r8d,[rdi+0x2]
0x1401cbe68: mov    edx,0x1c
0x1401cbe6d: lea    rcx,[rip+0x247e57c]        # 0x14264a3f0
0x1401cbe74: call   0x1400bb120
0x1401cbe79: lea    rdx,[rip+0x1438258]        # 0x1416040d8  'Free captives belonging to your civilization'
0x1401cbe80: lea    rcx,[rbp+0x2bf0]
0x1401cbe87: call   0x140068150
0x1401cbe8c: nop
0x1401cbe8d: xor    r9d,r9d
0x1401cbe90: xor    r8d,r8d
0x1401cbe93: lea    rdx,[rbp+0x2bf0]
0x1401cbe9a: lea    rcx,[rip+0x247e54f]        # 0x14264a3f0
0x1401cbea1: call   0x140ad9960
0x1401cbea6: nop
0x1401cbea7: lea    rcx,[rbp+0x2bf0]
0x1401cbeae: call   0x140067e30
0x1401cbeb3: mov    esi,edi
0x1401cbeb5: cmp    edi,ebx
0x1401cbeb7: jg     0x1401cc021
0x1401cbebd: mov    eax,0x1e
0x1401cbec2: mov    r8d,esi
0x1401cbec5: mov    edx,eax
0x1401cbec7: lea    rcx,[rip+0x247e522]        # 0x14264a3f0
0x1401cbece: call   0x1400bb120
0x1401cbed3: mov    rax,QWORD PTR [r12+0x130]
0x1401cbedb: test   BYTE PTR [rax+0x58],0x10
0x1401cbedf: je     0x1401cbf08
0x1401cbee1: cmp    esi,edi
0x1401cbee3: jne    0x1401cbeed
0x1401cbee5: mov    edx,DWORD PTR [rip+0x247ff91]        # 0x14264be7c
0x1401cbeeb: jmp    0x1401cbf24
0x1401cbeed: lea    rcx,[rip+0x247e4fc]        # 0x14264a3f0
0x1401cbef4: cmp    esi,ebx
0x1401cbef6: jne    0x1401cbf00
0x1401cbef8: mov    edx,DWORD PTR [rip+0x247ff96]        # 0x14264be94
0x1401cbefe: jmp    0x1401cbf2b
0x1401cbf00: mov    edx,DWORD PTR [rip+0x247ff82]        # 0x14264be88
0x1401cbf06: jmp    0x1401cbf2b
0x1401cbf08: cmp    esi,edi
0x1401cbf0a: jne    0x1401cbf14
0x1401cbf0c: mov    edx,DWORD PTR [rip+0x247ff22]        # 0x14264be34
0x1401cbf12: jmp    0x1401cbf24
0x1401cbf14: cmp    esi,ebx
0x1401cbf16: mov    edx,DWORD PTR [rip+0x247ff30]        # 0x14264be4c
0x1401cbf1c: je     0x1401cbf24
0x1401cbf1e: mov    edx,DWORD PTR [rip+0x247ff1c]        # 0x14264be40
0x1401cbf24: lea    rcx,[rip+0x247e4c5]        # 0x14264a3f0
0x1401cbf2b: call   0x140adaad0
0x1401cbf30: mov    r8d,esi
0x1401cbf33: mov    edx,0x1f
0x1401cbf38: lea    rcx,[rip+0x247e4b1]        # 0x14264a3f0
0x1401cbf3f: call   0x1400bb120
0x1401cbf44: mov    rax,QWORD PTR [r12+0x130]
0x1401cbf4c: test   BYTE PTR [rax+0x58],0x10
0x1401cbf50: je     0x1401cbf79
0x1401cbf52: cmp    esi,edi
0x1401cbf54: jne    0x1401cbf5e
0x1401cbf56: mov    edx,DWORD PTR [rip+0x247ff24]        # 0x14264be80
0x1401cbf5c: jmp    0x1401cbf95
0x1401cbf5e: lea    rcx,[rip+0x247e48b]        # 0x14264a3f0
0x1401cbf65: cmp    esi,ebx
0x1401cbf67: jne    0x1401cbf71
0x1401cbf69: mov    edx,DWORD PTR [rip+0x247ff29]        # 0x14264be98
0x1401cbf6f: jmp    0x1401cbf9c
0x1401cbf71: mov    edx,DWORD PTR [rip+0x247ff15]        # 0x14264be8c
0x1401cbf77: jmp    0x1401cbf9c
0x1401cbf79: cmp    esi,edi
0x1401cbf7b: jne    0x1401cbf85
0x1401cbf7d: mov    edx,DWORD PTR [rip+0x247feb5]        # 0x14264be38
0x1401cbf83: jmp    0x1401cbf95
0x1401cbf85: cmp    esi,ebx
0x1401cbf87: mov    edx,DWORD PTR [rip+0x247fec3]        # 0x14264be50
0x1401cbf8d: je     0x1401cbf95
0x1401cbf8f: mov    edx,DWORD PTR [rip+0x247feaf]        # 0x14264be44
0x1401cbf95: lea    rcx,[rip+0x247e454]        # 0x14264a3f0
0x1401cbf9c: call   0x140adaad0
0x1401cbfa1: mov    r8d,esi
0x1401cbfa4: mov    edx,0x20
0x1401cbfa9: lea    rcx,[rip+0x247e440]        # 0x14264a3f0
0x1401cbfb0: call   0x1400bb120
0x1401cbfb5: mov    rax,QWORD PTR [r12+0x130]
0x1401cbfbd: test   BYTE PTR [rax+0x58],0x10
0x1401cbfc1: je     0x1401cbfea
0x1401cbfc3: cmp    esi,edi
0x1401cbfc5: jne    0x1401cbfcf
0x1401cbfc7: mov    edx,DWORD PTR [rip+0x247feb7]        # 0x14264be84
0x1401cbfcd: jmp    0x1401cc006
0x1401cbfcf: lea    rcx,[rip+0x247e41a]        # 0x14264a3f0
0x1401cbfd6: cmp    esi,ebx
0x1401cbfd8: jne    0x1401cbfe2
0x1401cbfda: mov    edx,DWORD PTR [rip+0x247febc]        # 0x14264be9c
0x1401cbfe0: jmp    0x1401cc00d
0x1401cbfe2: mov    edx,DWORD PTR [rip+0x247fea8]        # 0x14264be90
0x1401cbfe8: jmp    0x1401cc00d
0x1401cbfea: cmp    esi,edi
0x1401cbfec: jne    0x1401cbff6
0x1401cbfee: mov    edx,DWORD PTR [rip+0x247fe48]        # 0x14264be3c
0x1401cbff4: jmp    0x1401cc006
0x1401cbff6: cmp    esi,ebx
0x1401cbff8: mov    edx,DWORD PTR [rip+0x247fe56]        # 0x14264be54
0x1401cbffe: je     0x1401cc006
0x1401cc000: mov    edx,DWORD PTR [rip+0x247fe42]        # 0x14264be48
0x1401cc006: lea    rcx,[rip+0x247e3e3]        # 0x14264a3f0
0x1401cc00d: call   0x140adaad0
0x1401cc012: inc    esi
0x1401cc014: cmp    esi,ebx
0x1401cc016: mov    eax,0x1e
0x1401cc01b: jle    0x1401cbec2
0x1401cc021: xor    r8d,r8d
0x1401cc024: mov    edx,0x7
0x1401cc029: mov    r9b,0x1
0x1401cc02c: lea    rcx,[rip+0x247e3bd]        # 0x14264a3f0
0x1401cc033: call   0x1400bb130
0x1401cc038: lea    r8d,[rdi+0x2]
0x1401cc03c: mov    edx,0x1f
0x1401cc041: lea    rcx,[rip+0x247e3a8]        # 0x14264a3f0
0x1401cc048: call   0x1400bb120
0x1401cc04d: lea    rdx,[rip+0x14380b4]        # 0x141604108  'Release other prisoners'
0x1401cc054: lea    rcx,[rbp+0x2c10]
0x1401cc05b: call   0x140068150
0x1401cc060: nop
0x1401cc061: xor    r9d,r9d
0x1401cc064: xor    r8d,r8d
0x1401cc067: lea    rdx,[rbp+0x2c10]
0x1401cc06e: lea    rcx,[rip+0x247e37b]        # 0x14264a3f0
0x1401cc075: call   0x140ad9960
0x1401cc07a: nop
0x1401cc07b: lea    rcx,[rbp+0x2c10]
0x1401cc082: call   0x140067e30
0x1401cc087: mov    esi,edi
0x1401cc089: cmp    edi,ebx
0x1401cc08b: jg     0x1401cc1ee
0x1401cc091: mov    r8d,esi
0x1401cc094: mov    edx,0x21
0x1401cc099: lea    rcx,[rip+0x247e350]        # 0x14264a3f0
0x1401cc0a0: call   0x1400bb120
0x1401cc0a5: mov    rax,QWORD PTR [r12+0x130]
0x1401cc0ad: test   BYTE PTR [rax+0x58],0x20
0x1401cc0b1: je     0x1401cc0da
0x1401cc0b3: cmp    esi,edi
0x1401cc0b5: jne    0x1401cc0bf
0x1401cc0b7: mov    edx,DWORD PTR [rip+0x247fdbf]        # 0x14264be7c
0x1401cc0bd: jmp    0x1401cc0f6
0x1401cc0bf: lea    rcx,[rip+0x247e32a]        # 0x14264a3f0
0x1401cc0c6: cmp    esi,ebx
0x1401cc0c8: jne    0x1401cc0d2
0x1401cc0ca: mov    edx,DWORD PTR [rip+0x247fdc4]        # 0x14264be94
0x1401cc0d0: jmp    0x1401cc0fd
0x1401cc0d2: mov    edx,DWORD PTR [rip+0x247fdb0]        # 0x14264be88
0x1401cc0d8: jmp    0x1401cc0fd
0x1401cc0da: cmp    esi,edi
0x1401cc0dc: jne    0x1401cc0e6
0x1401cc0de: mov    edx,DWORD PTR [rip+0x247fd50]        # 0x14264be34
0x1401cc0e4: jmp    0x1401cc0f6
0x1401cc0e6: cmp    esi,ebx
0x1401cc0e8: mov    edx,DWORD PTR [rip+0x247fd5e]        # 0x14264be4c
0x1401cc0ee: je     0x1401cc0f6
0x1401cc0f0: mov    edx,DWORD PTR [rip+0x247fd4a]        # 0x14264be40
0x1401cc0f6: lea    rcx,[rip+0x247e2f3]        # 0x14264a3f0
0x1401cc0fd: call   0x140adaad0
0x1401cc102: mov    r8d,esi
0x1401cc105: mov    edx,0x22
0x1401cc10a: lea    rcx,[rip+0x247e2df]        # 0x14264a3f0
0x1401cc111: call   0x1400bb120
0x1401cc116: mov    rax,QWORD PTR [r12+0x130]
0x1401cc11e: test   BYTE PTR [rax+0x58],0x20
0x1401cc122: je     0x1401cc14b
0x1401cc124: cmp    esi,edi
0x1401cc126: jne    0x1401cc130
0x1401cc128: mov    edx,DWORD PTR [rip+0x247fd52]        # 0x14264be80
0x1401cc12e: jmp    0x1401cc167
0x1401cc130: lea    rcx,[rip+0x247e2b9]        # 0x14264a3f0
0x1401cc137: cmp    esi,ebx
0x1401cc139: jne    0x1401cc143
0x1401cc13b: mov    edx,DWORD PTR [rip+0x247fd57]        # 0x14264be98
0x1401cc141: jmp    0x1401cc16e
0x1401cc143: mov    edx,DWORD PTR [rip+0x247fd43]        # 0x14264be8c
0x1401cc149: jmp    0x1401cc16e
0x1401cc14b: cmp    esi,edi
0x1401cc14d: jne    0x1401cc157
0x1401cc14f: mov    edx,DWORD PTR [rip+0x247fce3]        # 0x14264be38
0x1401cc155: jmp    0x1401cc167
0x1401cc157: cmp    esi,ebx
0x1401cc159: mov    edx,DWORD PTR [rip+0x247fcf1]        # 0x14264be50
0x1401cc15f: je     0x1401cc167
0x1401cc161: mov    edx,DWORD PTR [rip+0x247fcdd]        # 0x14264be44
0x1401cc167: lea    rcx,[rip+0x247e282]        # 0x14264a3f0
0x1401cc16e: call   0x140adaad0
0x1401cc173: mov    r8d,esi
0x1401cc176: mov    edx,0x23
0x1401cc17b: lea    rcx,[rip+0x247e26e]        # 0x14264a3f0
0x1401cc182: call   0x1400bb120
0x1401cc187: mov    rax,QWORD PTR [r12+0x130]
0x1401cc18f: test   BYTE PTR [rax+0x58],0x20
0x1401cc193: je     0x1401cc1bc
0x1401cc195: cmp    esi,edi
0x1401cc197: jne    0x1401cc1a1
0x1401cc199: mov    edx,DWORD PTR [rip+0x247fce5]        # 0x14264be84
0x1401cc19f: jmp    0x1401cc1d8
0x1401cc1a1: lea    rcx,[rip+0x247e248]        # 0x14264a3f0
0x1401cc1a8: cmp    esi,ebx
0x1401cc1aa: jne    0x1401cc1b4
0x1401cc1ac: mov    edx,DWORD PTR [rip+0x247fcea]        # 0x14264be9c
0x1401cc1b2: jmp    0x1401cc1df
0x1401cc1b4: mov    edx,DWORD PTR [rip+0x247fcd6]        # 0x14264be90
0x1401cc1ba: jmp    0x1401cc1df
0x1401cc1bc: cmp    esi,edi
0x1401cc1be: jne    0x1401cc1c8
0x1401cc1c0: mov    edx,DWORD PTR [rip+0x247fc76]        # 0x14264be3c
0x1401cc1c6: jmp    0x1401cc1d8
0x1401cc1c8: cmp    esi,ebx
0x1401cc1ca: mov    edx,DWORD PTR [rip+0x247fc84]        # 0x14264be54
0x1401cc1d0: je     0x1401cc1d8
0x1401cc1d2: mov    edx,DWORD PTR [rip+0x247fc70]        # 0x14264be48
0x1401cc1d8: lea    rcx,[rip+0x247e211]        # 0x14264a3f0
0x1401cc1df: call   0x140adaad0
0x1401cc1e4: inc    esi
0x1401cc1e6: cmp    esi,ebx
0x1401cc1e8: jle    0x1401cc091
0x1401cc1ee: xor    r8d,r8d
0x1401cc1f1: mov    edx,0x7
0x1401cc1f6: mov    r9b,0x1
0x1401cc1f9: lea    rcx,[rip+0x247e1f0]        # 0x14264a3f0
0x1401cc200: call   0x1400bb130
0x1401cc205: lea    r8d,[rdi+0x2]
0x1401cc209: mov    edx,0x22
0x1401cc20e: lea    rcx,[rip+0x247e1db]        # 0x14264a3f0
0x1401cc215: call   0x1400bb120
0x1401cc21a: lea    rdx,[rip+0x1437eff]        # 0x141604120  'Take important treasures'
0x1401cc221: lea    rcx,[rbp+0x2c30]
0x1401cc228: call   0x140068150
0x1401cc22d: nop
0x1401cc22e: xor    r9d,r9d
0x1401cc231: xor    r8d,r8d
0x1401cc234: lea    rdx,[rbp+0x2c30]
0x1401cc23b: lea    rcx,[rip+0x247e1ae]        # 0x14264a3f0
0x1401cc242: call   0x140ad9960
0x1401cc247: nop
0x1401cc248: lea    rcx,[rbp+0x2c30]
0x1401cc24f: call   0x140067e30
0x1401cc254: mov    esi,edi
0x1401cc256: cmp    edi,ebx
0x1401cc258: jg     0x1401cc3bd
0x1401cc25e: xchg   ax,ax
0x1401cc260: mov    r8d,esi
0x1401cc263: mov    edx,0x24
0x1401cc268: lea    rcx,[rip+0x247e181]        # 0x14264a3f0
0x1401cc26f: call   0x1400bb120
0x1401cc274: mov    rax,QWORD PTR [r12+0x130]
0x1401cc27c: test   BYTE PTR [rax+0x58],0x40
0x1401cc280: je     0x1401cc2a9
0x1401cc282: cmp    esi,edi
0x1401cc284: jne    0x1401cc28e
0x1401cc286: mov    edx,DWORD PTR [rip+0x247fbf0]        # 0x14264be7c
0x1401cc28c: jmp    0x1401cc2c5
0x1401cc28e: lea    rcx,[rip+0x247e15b]        # 0x14264a3f0
0x1401cc295: cmp    esi,ebx
0x1401cc297: jne    0x1401cc2a1
0x1401cc299: mov    edx,DWORD PTR [rip+0x247fbf5]        # 0x14264be94
0x1401cc29f: jmp    0x1401cc2cc
0x1401cc2a1: mov    edx,DWORD PTR [rip+0x247fbe1]        # 0x14264be88
0x1401cc2a7: jmp    0x1401cc2cc
0x1401cc2a9: cmp    esi,edi
0x1401cc2ab: jne    0x1401cc2b5
0x1401cc2ad: mov    edx,DWORD PTR [rip+0x247fb81]        # 0x14264be34
0x1401cc2b3: jmp    0x1401cc2c5
0x1401cc2b5: cmp    esi,ebx
0x1401cc2b7: mov    edx,DWORD PTR [rip+0x247fb8f]        # 0x14264be4c
0x1401cc2bd: je     0x1401cc2c5
0x1401cc2bf: mov    edx,DWORD PTR [rip+0x247fb7b]        # 0x14264be40
0x1401cc2c5: lea    rcx,[rip+0x247e124]        # 0x14264a3f0
0x1401cc2cc: call   0x140adaad0
0x1401cc2d1: mov    r8d,esi
0x1401cc2d4: mov    edx,0x25
0x1401cc2d9: lea    rcx,[rip+0x247e110]        # 0x14264a3f0
0x1401cc2e0: call   0x1400bb120
0x1401cc2e5: mov    rax,QWORD PTR [r12+0x130]
0x1401cc2ed: test   BYTE PTR [rax+0x58],0x40
0x1401cc2f1: je     0x1401cc31a
0x1401cc2f3: cmp    esi,edi
0x1401cc2f5: jne    0x1401cc2ff
0x1401cc2f7: mov    edx,DWORD PTR [rip+0x247fb83]        # 0x14264be80
0x1401cc2fd: jmp    0x1401cc336
0x1401cc2ff: lea    rcx,[rip+0x247e0ea]        # 0x14264a3f0
0x1401cc306: cmp    esi,ebx
0x1401cc308: jne    0x1401cc312
0x1401cc30a: mov    edx,DWORD PTR [rip+0x247fb88]        # 0x14264be98
0x1401cc310: jmp    0x1401cc33d
0x1401cc312: mov    edx,DWORD PTR [rip+0x247fb74]        # 0x14264be8c
0x1401cc318: jmp    0x1401cc33d
0x1401cc31a: cmp    esi,edi
0x1401cc31c: jne    0x1401cc326
0x1401cc31e: mov    edx,DWORD PTR [rip+0x247fb14]        # 0x14264be38
0x1401cc324: jmp    0x1401cc336
0x1401cc326: cmp    esi,ebx
0x1401cc328: mov    edx,DWORD PTR [rip+0x247fb22]        # 0x14264be50
0x1401cc32e: je     0x1401cc336
0x1401cc330: mov    edx,DWORD PTR [rip+0x247fb0e]        # 0x14264be44
0x1401cc336: lea    rcx,[rip+0x247e0b3]        # 0x14264a3f0
0x1401cc33d: call   0x140adaad0
0x1401cc342: mov    r8d,esi
0x1401cc345: mov    edx,0x26
0x1401cc34a: lea    rcx,[rip+0x247e09f]        # 0x14264a3f0
0x1401cc351: call   0x1400bb120
0x1401cc356: mov    rax,QWORD PTR [r12+0x130]
0x1401cc35e: test   BYTE PTR [rax+0x58],0x40
0x1401cc362: je     0x1401cc38b
0x1401cc364: cmp    esi,edi
0x1401cc366: jne    0x1401cc370
0x1401cc368: mov    edx,DWORD PTR [rip+0x247fb16]        # 0x14264be84
0x1401cc36e: jmp    0x1401cc3a7
0x1401cc370: lea    rcx,[rip+0x247e079]        # 0x14264a3f0
0x1401cc377: cmp    esi,ebx
0x1401cc379: jne    0x1401cc383
0x1401cc37b: mov    edx,DWORD PTR [rip+0x247fb1b]        # 0x14264be9c
0x1401cc381: jmp    0x1401cc3ae
0x1401cc383: mov    edx,DWORD PTR [rip+0x247fb07]        # 0x14264be90
0x1401cc389: jmp    0x1401cc3ae
0x1401cc38b: cmp    esi,edi
0x1401cc38d: jne    0x1401cc397
0x1401cc38f: mov    edx,DWORD PTR [rip+0x247faa7]        # 0x14264be3c
0x1401cc395: jmp    0x1401cc3a7
0x1401cc397: cmp    esi,ebx
0x1401cc399: mov    edx,DWORD PTR [rip+0x247fab5]        # 0x14264be54
0x1401cc39f: je     0x1401cc3a7
0x1401cc3a1: mov    edx,DWORD PTR [rip+0x247faa1]        # 0x14264be48
0x1401cc3a7: lea    rcx,[rip+0x247e042]        # 0x14264a3f0
0x1401cc3ae: call   0x140adaad0
0x1401cc3b3: inc    esi
0x1401cc3b5: cmp    esi,ebx
0x1401cc3b7: jle    0x1401cc260
0x1401cc3bd: xor    r8d,r8d
0x1401cc3c0: mov    edx,0x7
0x1401cc3c5: mov    r9b,0x1
0x1401cc3c8: lea    rcx,[rip+0x247e021]        # 0x14264a3f0
0x1401cc3cf: call   0x1400bb130
0x1401cc3d4: lea    r8d,[rdi+0x2]
0x1401cc3d8: mov    edx,0x25
0x1401cc3dd: lea    rcx,[rip+0x247e00c]        # 0x14264a3f0
0x1401cc3e4: call   0x1400bb120
0x1401cc3e9: lea    rdx,[rip+0x1437d50]        # 0x141604140  'Loot other items'
0x1401cc3f0: lea    rcx,[rbp+0x2c50]
0x1401cc3f7: call   0x140068150
0x1401cc3fc: nop
0x1401cc3fd: xor    r9d,r9d
0x1401cc400: xor    r8d,r8d
0x1401cc403: lea    rdx,[rbp+0x2c50]
0x1401cc40a: lea    rcx,[rip+0x247dfdf]        # 0x14264a3f0
0x1401cc411: call   0x140ad9960
0x1401cc416: nop
0x1401cc417: lea    rcx,[rbp+0x2c50]
0x1401cc41e: call   0x140067e30
0x1401cc423: mov    esi,edi
0x1401cc425: cmp    edi,ebx
0x1401cc427: jg     0x1401cc58d
0x1401cc42d: nop    DWORD PTR [rax]
0x1401cc430: mov    r8d,esi
0x1401cc433: mov    edx,0x27
0x1401cc438: lea    rcx,[rip+0x247dfb1]        # 0x14264a3f0
0x1401cc43f: call   0x1400bb120
0x1401cc444: mov    rax,QWORD PTR [r12+0x130]
0x1401cc44c: test   BYTE PTR [rax+0x58],0x80
0x1401cc450: je     0x1401cc479
0x1401cc452: cmp    esi,edi
0x1401cc454: jne    0x1401cc45e
0x1401cc456: mov    edx,DWORD PTR [rip+0x247fa20]        # 0x14264be7c
0x1401cc45c: jmp    0x1401cc495
0x1401cc45e: lea    rcx,[rip+0x247df8b]        # 0x14264a3f0
0x1401cc465: cmp    esi,ebx
0x1401cc467: jne    0x1401cc471
0x1401cc469: mov    edx,DWORD PTR [rip+0x247fa25]        # 0x14264be94
0x1401cc46f: jmp    0x1401cc49c
0x1401cc471: mov    edx,DWORD PTR [rip+0x247fa11]        # 0x14264be88
0x1401cc477: jmp    0x1401cc49c
0x1401cc479: cmp    esi,edi
0x1401cc47b: jne    0x1401cc485
0x1401cc47d: mov    edx,DWORD PTR [rip+0x247f9b1]        # 0x14264be34
0x1401cc483: jmp    0x1401cc495
0x1401cc485: cmp    esi,ebx
0x1401cc487: mov    edx,DWORD PTR [rip+0x247f9bf]        # 0x14264be4c
0x1401cc48d: je     0x1401cc495
0x1401cc48f: mov    edx,DWORD PTR [rip+0x247f9ab]        # 0x14264be40
0x1401cc495: lea    rcx,[rip+0x247df54]        # 0x14264a3f0
0x1401cc49c: call   0x140adaad0
0x1401cc4a1: mov    r8d,esi
0x1401cc4a4: mov    edx,0x28
0x1401cc4a9: lea    rcx,[rip+0x247df40]        # 0x14264a3f0
0x1401cc4b0: call   0x1400bb120
0x1401cc4b5: mov    rax,QWORD PTR [r12+0x130]
0x1401cc4bd: test   BYTE PTR [rax+0x58],0x80
0x1401cc4c1: je     0x1401cc4ea
0x1401cc4c3: cmp    esi,edi
0x1401cc4c5: jne    0x1401cc4cf
0x1401cc4c7: mov    edx,DWORD PTR [rip+0x247f9b3]        # 0x14264be80
0x1401cc4cd: jmp    0x1401cc506
0x1401cc4cf: lea    rcx,[rip+0x247df1a]        # 0x14264a3f0
0x1401cc4d6: cmp    esi,ebx
0x1401cc4d8: jne    0x1401cc4e2
0x1401cc4da: mov    edx,DWORD PTR [rip+0x247f9b8]        # 0x14264be98
0x1401cc4e0: jmp    0x1401cc50d
0x1401cc4e2: mov    edx,DWORD PTR [rip+0x247f9a4]        # 0x14264be8c
0x1401cc4e8: jmp    0x1401cc50d
0x1401cc4ea: cmp    esi,edi
0x1401cc4ec: jne    0x1401cc4f6
0x1401cc4ee: mov    edx,DWORD PTR [rip+0x247f944]        # 0x14264be38
0x1401cc4f4: jmp    0x1401cc506
0x1401cc4f6: cmp    esi,ebx
0x1401cc4f8: mov    edx,DWORD PTR [rip+0x247f952]        # 0x14264be50
0x1401cc4fe: je     0x1401cc506
0x1401cc500: mov    edx,DWORD PTR [rip+0x247f93e]        # 0x14264be44
0x1401cc506: lea    rcx,[rip+0x247dee3]        # 0x14264a3f0
0x1401cc50d: call   0x140adaad0
0x1401cc512: mov    r8d,esi
0x1401cc515: mov    edx,0x29
0x1401cc51a: lea    rcx,[rip+0x247decf]        # 0x14264a3f0
0x1401cc521: call   0x1400bb120
0x1401cc526: mov    rax,QWORD PTR [r12+0x130]
0x1401cc52e: test   BYTE PTR [rax+0x58],0x80
0x1401cc532: je     0x1401cc55b
0x1401cc534: cmp    esi,edi
0x1401cc536: jne    0x1401cc540
0x1401cc538: mov    edx,DWORD PTR [rip+0x247f946]        # 0x14264be84
0x1401cc53e: jmp    0x1401cc577
0x1401cc540: lea    rcx,[rip+0x247dea9]        # 0x14264a3f0
0x1401cc547: cmp    esi,ebx
0x1401cc549: jne    0x1401cc553
0x1401cc54b: mov    edx,DWORD PTR [rip+0x247f94b]        # 0x14264be9c
0x1401cc551: jmp    0x1401cc57e
0x1401cc553: mov    edx,DWORD PTR [rip+0x247f937]        # 0x14264be90
0x1401cc559: jmp    0x1401cc57e
0x1401cc55b: cmp    esi,edi
0x1401cc55d: jne    0x1401cc567
0x1401cc55f: mov    edx,DWORD PTR [rip+0x247f8d7]        # 0x14264be3c
0x1401cc565: jmp    0x1401cc577
0x1401cc567: cmp    esi,ebx
0x1401cc569: mov    edx,DWORD PTR [rip+0x247f8e5]        # 0x14264be54
0x1401cc56f: je     0x1401cc577
0x1401cc571: mov    edx,DWORD PTR [rip+0x247f8d1]        # 0x14264be48
0x1401cc577: lea    rcx,[rip+0x247de72]        # 0x14264a3f0
0x1401cc57e: call   0x140adaad0
0x1401cc583: inc    esi
0x1401cc585: cmp    esi,ebx
0x1401cc587: jle    0x1401cc430
0x1401cc58d: xor    r8d,r8d
0x1401cc590: mov    edx,0x7
0x1401cc595: mov    r9b,0x1
0x1401cc598: lea    rcx,[rip+0x247de51]        # 0x14264a3f0
0x1401cc59f: call   0x1400bb130
0x1401cc5a4: lea    r8d,[rdi+0x2]
0x1401cc5a8: mov    edx,0x28
0x1401cc5ad: lea    rcx,[rip+0x247de3c]        # 0x14264a3f0
0x1401cc5b4: call   0x1400bb120
0x1401cc5b9: lea    rdx,[rip+0x1437b98]        # 0x141604158  'Steal livestock'
0x1401cc5c0: lea    rcx,[rbp+0x2c70]
0x1401cc5c7: call   0x140068150
0x1401cc5cc: nop
0x1401cc5cd: xor    r9d,r9d
0x1401cc5d0: xor    r8d,r8d
0x1401cc5d3: lea    rdx,[rbp+0x2c70]
0x1401cc5da: lea    rcx,[rip+0x247de0f]        # 0x14264a3f0
0x1401cc5e1: call   0x140ad9960
0x1401cc5e6: nop
0x1401cc5e7: lea    rcx,[rbp+0x2c70]
0x1401cc5ee: call   0x140067e30
0x1401cc5f3: jmp    0x1401c9e72
0x1401cc5f8: xor    r8d,r8d
0x1401cc5fb: mov    edx,0x6
0x1401cc600: mov    r9b,0x1
0x1401cc603: lea    rcx,[rip+0x247dde6]        # 0x14264a3f0
0x1401cc60a: call   0x1400bb130
0x1401cc60f: lea    r8d,[r13-0x37]
0x1401cc613: mov    edx,0x1b
0x1401cc618: lea    rcx,[rip+0x247ddd1]        # 0x14264a3f0
0x1401cc61f: call   0x1400bb120
0x1401cc624: lea    rdx,[rip+0x143789d]        # 0x141603ec8  'WARNING:  If successful, your soldiers will join the'
0x1401cc62b: lea    rcx,[rbp+0x2c90]
0x1401cc632: call   0x140068150
0x1401cc637: nop
0x1401cc638: xor    r9d,r9d
0x1401cc63b: xor    r8d,r8d
0x1401cc63e: lea    rdx,[rbp+0x2c90]
0x1401cc645: lea    rcx,[rip+0x247dda4]        # 0x14264a3f0
0x1401cc64c: call   0x140ad9960
0x1401cc651: nop
0x1401cc652: lea    rcx,[rbp+0x2c90]
0x1401cc659: call   0x140067e30
0x1401cc65e: lea    r8d,[r13-0x37]
0x1401cc662: mov    edx,0x1c
0x1401cc667: lea    rcx,[rip+0x247dd82]        # 0x14264a3f0
0x1401cc66e: call   0x1400bb120
0x1401cc673: lea    rdx,[rip+0x1437886]        # 0x141603f00  'occupation and not return.  Your new holdings will'
0x1401cc67a: lea    rcx,[rbp+0x2cb0]
0x1401cc681: call   0x140068150
0x1401cc686: nop
0x1401cc687: xor    r9d,r9d
0x1401cc68a: xor    r8d,r8d
0x1401cc68d: lea    rdx,[rbp+0x2cb0]
0x1401cc694: lea    rcx,[rip+0x247dd55]        # 0x14264a3f0
0x1401cc69b: call   0x140ad9960
0x1401cc6a0: nop
0x1401cc6a1: lea    rcx,[rbp+0x2cb0]
0x1401cc6a8: call   0x140067e30
0x1401cc6ad: lea    r8d,[r13-0x37]
0x1401cc6b1: mov    edx,0x1d
0x1401cc6b6: lea    rcx,[rip+0x247dd33]        # 0x14264a3f0
0x1401cc6bd: call   0x1400bb120
0x1401cc6c2: lea    rdx,[rip+0x143786f]        # 0x141603f38  'be manageable from this screen.'
0x1401cc6c9: lea    rcx,[rbp+0x2cd0]
0x1401cc6d0: call   0x140068150
0x1401cc6d5: nop
0x1401cc6d6: xor    r9d,r9d
0x1401cc6d9: xor    r8d,r8d
0x1401cc6dc: lea    rdx,[rbp+0x2cd0]
0x1401cc6e3: lea    rcx,[rip+0x247dd06]        # 0x14264a3f0
0x1401cc6ea: call   0x140ad9960
0x1401cc6ef: nop
0x1401cc6f0: lea    rcx,[rbp+0x2cd0]
0x1401cc6f7: call   0x140067e30
0x1401cc6fc: jmp    0x1401c9e72
0x1401cc701: lea    rcx,[rip+0x247dce8]        # 0x14264a3f0
0x1401cc708: cmp    ebx,r15d
0x1401cc70b: jne    0x1401cc715
0x1401cc70d: mov    edx,DWORD PTR [rip+0x247f619]        # 0x14264bd2c
0x1401cc713: jmp    0x1401cc770
0x1401cc715: mov    edx,DWORD PTR [rip+0x247f605]        # 0x14264bd20
0x1401cc71b: jmp    0x1401cc770
0x1401cc71d: cmp    rdi,r12
0x1401cc720: jne    0x1401cc74b
0x1401cc722: cmp    ebx,r13d
0x1401cc725: jne    0x1401cc72f
0x1401cc727: mov    edx,DWORD PTR [rip+0x247f5ef]        # 0x14264bd1c
0x1401cc72d: jmp    0x1401cc769
0x1401cc72f: lea    rcx,[rip+0x247dcba]        # 0x14264a3f0
0x1401cc736: cmp    ebx,r15d
0x1401cc739: jne    0x1401cc743
0x1401cc73b: mov    edx,DWORD PTR [rip+0x247f5f3]        # 0x14264bd34
0x1401cc741: jmp    0x1401cc770
0x1401cc743: mov    edx,DWORD PTR [rip+0x247f5df]        # 0x14264bd28
0x1401cc749: jmp    0x1401cc770
0x1401cc74b: cmp    ebx,r13d
0x1401cc74e: jne    0x1401cc758
0x1401cc750: mov    edx,DWORD PTR [rip+0x247f5c2]        # 0x14264bd18
0x1401cc756: jmp    0x1401cc769
0x1401cc758: cmp    ebx,r15d
0x1401cc75b: mov    edx,DWORD PTR [rip+0x247f5cf]        # 0x14264bd30
0x1401cc761: je     0x1401cc769
0x1401cc763: mov    edx,DWORD PTR [rip+0x247f5bb]        # 0x14264bd24
0x1401cc769: lea    rcx,[rip+0x247dc80]        # 0x14264a3f0
0x1401cc770: call   0x140adaad0
0x1401cc775: inc    ebx
0x1401cc777: cmp    ebx,r15d
0x1401cc77a: jle    0x1401c9ea0
0x1401cc780: inc    esi
0x1401cc782: inc    rdi
0x1401cc785: cmp    esi,r12d
0x1401cc788: jle    0x1401c9e93
0x1401cc78e: mov    r12,QWORD PTR [rbp-0x78]
0x1401cc792: mov    BYTE PTR [rbp-0x40],0x0
0x1401cc796: mov    BYTE PTR [rbp-0x50],0x0
0x1401cc79a: mov    rbx,QWORD PTR [rsp+0x78]
0x1401cc79f: cmp    BYTE PTR [rbp-0x80],0x0
0x1401cc7a3: je     0x1401cd2a9
0x1401cc7a9: add    rbx,0x380
0x1401cc7b0: mov    rcx,rbx
0x1401cc7b3: call   0x14006ee50
0x1401cc7b8: test   rax,rax
0x1401cc7bb: je     0x1401cd243
0x1401cc7c1: lea    rdx,[rbp+0xa8]
0x1401cc7c8: mov    rcx,rbx
0x1401cc7cb: call   0x14006f240
0x1401cc7d0: lea    rdx,[rbp+0x170]
0x1401cc7d7: mov    rcx,rbx
0x1401cc7da: call   0x14006f230
0x1401cc7df: lea    rdx,[rbp+0x170]
0x1401cc7e6: lea    rcx,[rbp+0xa8]
0x1401cc7ed: call   0x1400b9970
0x1401cc7f2: test   al,al
0x1401cc7f4: jne    0x1401cc865
0x1401cc7f6: data16 nop WORD PTR [rax+rax*1+0x0]
0x1401cc800: lea    rcx,[rbp+0xa8]
0x1401cc807: call   0x14006ee10
0x1401cc80c: mov    rcx,QWORD PTR [rax]
0x1401cc80f: mov    eax,DWORD PTR [r12]
0x1401cc813: cmp    DWORD PTR [rcx+0x58],eax
0x1401cc816: jne    0x1401cc842
0x1401cc818: mov    BYTE PTR [rbp-0x40],0x1
0x1401cc81c: mov    rcx,r12
0x1401cc81f: call   0x140075110
0x1401cc824: cmp    eax,0x19
0x1401cc827: jne    0x1401cc842
0x1401cc829: mov    rcx,QWORD PTR [r12+0x130]
0x1401cc831: call   0x14006f450
0x1401cc836: test   rax,rax
0x1401cc839: jne    0x1401cc842
0x1401cc83b: mov    BYTE PTR [rbp-0x40],al
0x1401cc83e: mov    BYTE PTR [rbp-0x50],0x1
0x1401cc842: lea    rcx,[rbp+0xa8]
0x1401cc849: call   0x14006ee00
0x1401cc84e: lea    rdx,[rbp+0x170]
0x1401cc855: lea    rcx,[rbp+0xa8]
0x1401cc85c: call   0x1400b9970
0x1401cc861: test   al,al
0x1401cc863: je     0x1401cc800
0x1401cc865: add    r13d,0x2
0x1401cc869: mov    DWORD PTR [rbp-0x28],r13d
0x1401cc86d: lea    ebx,[r15-0x2]
0x1401cc871: mov    DWORD PTR [rbp-0x6c],ebx
0x1401cc874: lea    ecx,[r14-0x7]
0x1401cc878: mov    eax,0x55555556
0x1401cc87d: imul   ecx
0x1401cc87f: mov    edi,edx
0x1401cc881: shr    edi,0x1f
0x1401cc884: add    edi,edx
0x1401cc886: mov    DWORD PTR [rsp+0x74],edi
0x1401cc88a: mov    r14,QWORD PTR [rsp+0x78]
0x1401cc88f: lea    rcx,[r14+0x380]
0x1401cc896: call   0x14006ee50
0x1401cc89b: mov    r12,rax
0x1401cc89e: mov    QWORD PTR [rbp+0x18],rax
0x1401cc8a2: cmp    eax,edi
0x1401cc8a4: jle    0x1401cc8ad
0x1401cc8a6: lea    ebx,[r15-0x4]
0x1401cc8aa: mov    DWORD PTR [rbp-0x6c],ebx
0x1401cc8ad: lea    eax,[rbx-0x3]
0x1401cc8b0: mov    DWORD PTR [rbp-0x60],eax
0x1401cc8b3: mov    r15d,0x1
0x1401cc8b9: mov    DWORD PTR [rsp+0x70],r15d
0x1401cc8be: mov    ecx,DWORD PTR [r14+0x3d0]
0x1401cc8c5: mov    edx,r12d
0x1401cc8c8: sub    edx,edi
0x1401cc8ca: cmp    ecx,edx
0x1401cc8cc: cmovle edx,ecx
0x1401cc8cf: xor    esi,esi
0x1401cc8d1: test   edx,edx
0x1401cc8d3: cmovns esi,edx
0x1401cc8d6: mov    DWORD PTR [rbp-0x58],esi
0x1401cc8d9: lea    eax,[rdi+rsi*1]
0x1401cc8dc: mov    DWORD PTR [rbp-0x20],eax
0x1401cc8df: cmp    esi,eax
0x1401cc8e1: jge    0x1401cd1df
0x1401cc8e7: add    r14,0x380
0x1401cc8ee: mov    QWORD PTR [rbp-0x30],r14
0x1401cc8f2: cmp    esi,r12d
0x1401cc8f5: jge    0x1401cd1d6
0x1401cc8fb: xor    r8d,r8d
0x1401cc8fe: mov    edx,0x7
0x1401cc903: mov    r9b,0x1
0x1401cc906: lea    rcx,[rip+0x247dae3]        # 0x14264a3f0
0x1401cc90d: call   0x1400bb130
0x1401cc912: mov    esi,r13d
0x1401cc915: cmp    r13d,ebx
0x1401cc918: jg     0x1401cc9ba
0x1401cc91e: lea    r12d,[r15+0x3]
0x1401cc922: movsxd r14,r13d
0x1401cc925: mov    edi,r15d
0x1401cc928: cmp    r15d,r12d
0x1401cc92b: jge    0x1401cc9a9
0x1401cc92d: movsxd r15,ebx
0x1401cc930: lea    rbx,[rip+0x247f479]        # 0x14264bdb0
0x1401cc937: nop    WORD PTR [rax+rax*1+0x0]
0x1401cc940: mov    r8d,esi
0x1401cc943: mov    edx,edi
0x1401cc945: lea    rcx,[rip+0x247daa4]        # 0x14264a3f0
0x1401cc94c: call   0x1400bb120
0x1401cc951: cmp    esi,r13d
0x1401cc954: jne    0x1401cc95b
0x1401cc956: mov    edx,DWORD PTR [rbx-0x18]
0x1401cc959: jmp    0x1401cc967
0x1401cc95b: cmp    r14,r15
0x1401cc95e: jne    0x1401cc964
0x1401cc960: mov    edx,DWORD PTR [rbx]
0x1401cc962: jmp    0x1401cc967
0x1401cc964: mov    edx,DWORD PTR [rbx-0xc]
0x1401cc967: lea    rcx,[rip+0x247da82]        # 0x14264a3f0
0x1401cc96e: call   0x140adaad0
0x1401cc973: xor    edx,edx
0x1401cc975: lea    rcx,[rip+0x2200df4]        # 0x1423cd770
0x1401cc97c: call   0x140071f90
0x1401cc981: test   al,al
0x1401cc983: je     0x1401cc996
0x1401cc985: mov    r8b,0x1
0x1401cc988: xor    edx,edx
0x1401cc98a: lea    rcx,[rip+0x247da5f]        # 0x14264a3f0
0x1401cc991: call   0x1400bb190
0x1401cc996: inc    edi
0x1401cc998: add    rbx,0x4
0x1401cc99c: cmp    edi,r12d
0x1401cc99f: jl     0x1401cc940
0x1401cc9a1: mov    r15d,DWORD PTR [rsp+0x70]
0x1401cc9a6: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401cc9a9: inc    esi
0x1401cc9ab: inc    r14
0x1401cc9ae: cmp    esi,ebx
0x1401cc9b0: jle    0x1401cc925
0x1401cc9b6: mov    r14,QWORD PTR [rbp-0x30]
0x1401cc9ba: mov    r12,QWORD PTR [rsp+0x78]
0x1401cc9bf: lea    rcx,[r12+0x3b0]
0x1401cc9c7: movsxd rsi,DWORD PTR [rbp-0x58]
0x1401cc9cb: mov    rbx,rsi
0x1401cc9ce: mov    rdx,rsi
0x1401cc9d1: call   0x14006f360
0x1401cc9d6: xor    r8d,r8d
0x1401cc9d9: mov    r9b,0x1
0x1401cc9dc: lea    rcx,[rip+0x247da0d]        # 0x14264a3f0
0x1401cc9e3: test   BYTE PTR [rax],r9b
0x1401cc9e6: mov    edx,0x3
0x1401cc9eb: je     0x1401cc9f2
0x1401cc9ed: mov    edx,0x4
0x1401cc9f2: call   0x1400bb130
0x1401cc9f7: mov    r8d,r13d
0x1401cc9fa: lea    edx,[r15+0x1]
0x1401cc9fe: lea    rcx,[rip+0x247d9eb]        # 0x14264a3f0
0x1401cca05: call   0x1400bb120
0x1401cca0a: lea    rcx,[rbp+0xfb0]
0x1401cca11: call   0x14006f690
0x1401cca16: nop
0x1401cca17: mov    rdx,rbx
0x1401cca1a: mov    rcx,r14
0x1401cca1d: call   0x14006f220
0x1401cca22: mov    rcx,QWORD PTR [rax]
0x1401cca25: cmp    DWORD PTR [rcx+0x4],0xffffffff
0x1401cca29: je     0x1401cca65
0x1401cca2b: mov    rdx,rbx
0x1401cca2e: mov    rcx,r14
0x1401cca31: call   0x14006f220
0x1401cca36: mov    rdx,QWORD PTR [rax]
0x1401cca39: mov    edx,DWORD PTR [rdx+0x4]
0x1401cca3c: lea    rcx,[rip+0x232d275]        # 0x1424f9cb8
0x1401cca43: call   0x140067dc0
0x1401cca48: test   rax,rax
0x1401cca4b: je     0x1401cca78
0x1401cca4d: lea    rcx,[rax+0x38]
0x1401cca51: xor    r9d,r9d
0x1401cca54: mov    r8b,0x1
0x1401cca57: lea    rdx,[rbp+0xfb0]
0x1401cca5e: call   0x140a946e0
0x1401cca63: jmp    0x1401cca78
0x1401cca65: lea    rdx,[rip+0x14373b4]        # 0x141603e20  'Messenger (unfilled)'
0x1401cca6c: lea    rcx,[rbp+0xfb0]
0x1401cca73: call   0x14006f580
0x1401cca78: lea    rcx,[rbp+0xfb0]
0x1401cca7f: call   0x14006f330
0x1401cca84: cmp    rax,0x19
0x1401cca88: jb     0x1401ccada
0x1401cca8a: xor    r8d,r8d
0x1401cca8d: mov    edx,0x18
0x1401cca92: lea    rcx,[rbp+0xfb0]
0x1401cca99: call   0x1400e1230
0x1401cca9e: mov    edx,0x15
0x1401ccaa3: lea    rcx,[rbp+0xfb0]
0x1401ccaaa: call   0x1400fb540
0x1401ccaaf: mov    BYTE PTR [rax],0x2e
0x1401ccab2: mov    edx,0x16
0x1401ccab7: lea    rcx,[rbp+0xfb0]
0x1401ccabe: call   0x1400fb540
0x1401ccac3: mov    BYTE PTR [rax],0x2e
0x1401ccac6: mov    edx,0x17
0x1401ccacb: lea    rcx,[rbp+0xfb0]
0x1401ccad2: call   0x1400fb540
0x1401ccad7: mov    BYTE PTR [rax],0x2e
0x1401ccada: xor    r9d,r9d
0x1401ccadd: xor    r8d,r8d
0x1401ccae0: lea    rdx,[rbp+0xfb0]
0x1401ccae7: lea    rcx,[rip+0x247d902]        # 0x14264a3f0
0x1401ccaee: call   0x140ad9960
0x1401ccaf3: lea    r8d,[r13+0x19]
0x1401ccaf7: lea    edx,[r15+0x1]
0x1401ccafb: lea    rcx,[rip+0x247d8ee]        # 0x14264a3f0
0x1401ccb02: call   0x1400bb120
0x1401ccb07: mov    rdx,rsi
0x1401ccb0a: mov    rcx,r14
0x1401ccb0d: call   0x14006f220
0x1401ccb12: mov    rcx,QWORD PTR [rax]
0x1401ccb15: cmp    DWORD PTR [rcx+0x58],0xffffffff
0x1401ccb19: je     0x1401cd08c
0x1401ccb1f: mov    rdx,rsi
0x1401ccb22: mov    rcx,r14
0x1401ccb25: call   0x14006f220
0x1401ccb2a: mov    rcx,QWORD PTR [rax]
0x1401ccb2d: mov    rbx,QWORD PTR [rbp-0x78]
0x1401ccb31: mov    eax,DWORD PTR [rbx]
0x1401ccb33: xor    r8d,r8d
0x1401ccb36: cmp    DWORD PTR [rcx+0x58],eax
0x1401ccb39: lea    rcx,[rip+0x247d8b0]        # 0x14264a3f0
0x1401ccb40: jne    0x1401ccb8e
0x1401ccb42: mov    edx,0x2
0x1401ccb47: mov    r9b,0x1
0x1401ccb4a: call   0x1400bb130
0x1401ccb4f: lea    rdx,[rip+0x1437402]        # 0x141603f58  'On this mission'
0x1401ccb56: lea    rcx,[rbp+0x2cf0]
0x1401ccb5d: call   0x140068150
0x1401ccb62: nop
0x1401ccb63: xor    r9d,r9d
0x1401ccb66: xor    r8d,r8d
0x1401ccb69: lea    rdx,[rbp+0x2cf0]
0x1401ccb70: lea    rcx,[rip+0x247d879]        # 0x14264a3f0
0x1401ccb77: call   0x140ad9960
0x1401ccb7c: nop
0x1401ccb7d: lea    rcx,[rbp+0x2cf0]
0x1401ccb84: call   0x140067e30
0x1401ccb89: jmp    0x1401cd0e1
0x1401ccb8e: mov    edx,0x3
0x1401ccb93: xor    r9d,r9d
0x1401ccb96: call   0x1400bb130
0x1401ccb9b: mov    rdx,rsi
0x1401ccb9e: mov    rcx,r14
0x1401ccba1: call   0x14006f220
0x1401ccba6: mov    rdx,QWORD PTR [rax]
0x1401ccba9: mov    edx,DWORD PTR [rdx+0x58]
0x1401ccbac: lea    rcx,[rip+0x231b255]        # 0x1424e7e08
0x1401ccbb3: call   0x140072570
0x1401ccbb8: mov    rbx,rax
0x1401ccbbb: test   rax,rax
0x1401ccbbe: je     0x1401cd03e
0x1401ccbc4: mov    rcx,rax
0x1401ccbc7: call   0x140075110
0x1401ccbcc: sub    eax,0x2
0x1401ccbcf: je     0x1401ccf24
0x1401ccbd5: sub    eax,0xf
0x1401ccbd8: je     0x1401cce68
0x1401ccbde: sub    eax,0x1
0x1401ccbe1: je     0x1401ccd84
0x1401ccbe7: sub    eax,0x1
0x1401ccbea: je     0x1401cccce
0x1401ccbf0: cmp    eax,0x6
0x1401ccbf3: jne    0x1401cd0dd
0x1401ccbf9: lea    rcx,[rbp+0xf70]
0x1401ccc00: call   0x14006f690
0x1401ccc05: nop
0x1401ccc06: lea    rdx,[rbp+0xf70]
0x1401ccc0d: mov    rcx,QWORD PTR [rbx+0x130]
0x1401ccc14: call   0x1401bb400
0x1401ccc19: lea    rdx,[rip+0x143543c]        # 0x14160205c  ' at '
0x1401ccc20: lea    rcx,[rbp+0xf70]
0x1401ccc27: call   0x14006f560
0x1401ccc2c: xor    r9d,r9d
0x1401ccc2f: mov    r8d,DWORD PTR [rbx+0x8]
0x1401ccc33: lea    rdx,[rbp+0xf70]
0x1401ccc3a: lea    rcx,[rip+0x232d077]        # 0x1424f9cb8
0x1401ccc41: call   0x140b93930
0x1401ccc46: lea    rcx,[rbp+0xf70]
0x1401ccc4d: call   0x14006f330
0x1401ccc52: cmp    rax,0x1e
0x1401ccc56: jb     0x1401ccca8
0x1401ccc58: xor    r8d,r8d
0x1401ccc5b: mov    edx,0x1d
0x1401ccc60: lea    rcx,[rbp+0xf70]
0x1401ccc67: call   0x1400e1230
0x1401ccc6c: mov    edx,0x1a
0x1401ccc71: lea    rcx,[rbp+0xf70]
0x1401ccc78: call   0x1400fb540
0x1401ccc7d: mov    BYTE PTR [rax],0x2e
0x1401ccc80: mov    edx,0x1b
0x1401ccc85: lea    rcx,[rbp+0xf70]
0x1401ccc8c: call   0x1400fb540
0x1401ccc91: mov    BYTE PTR [rax],0x2e
0x1401ccc94: mov    edx,0x1c
0x1401ccc99: lea    rcx,[rbp+0xf70]
0x1401ccca0: call   0x1400fb540
0x1401ccca5: mov    BYTE PTR [rax],0x2e
0x1401ccca8: xor    r9d,r9d
0x1401cccab: xor    r8d,r8d
0x1401cccae: lea    rdx,[rbp+0xf70]
0x1401cccb5: lea    rcx,[rip+0x247d734]        # 0x14264a3f0
0x1401cccbc: call   0x140ad9960
0x1401cccc1: nop
0x1401cccc2: lea    rcx,[rbp+0xf70]
0x1401cccc9: jmp    0x1401cd0d8
0x1401cccce: lea    rdx,[rip+0x1436d53]        # 0x141603a28  'Request workers from '
0x1401cccd5: lea    rcx,[rbp+0x1110]
0x1401cccdc: call   0x140068150
0x1401ccce1: nop
0x1401ccce2: xor    r9d,r9d
0x1401ccce5: mov    r8d,DWORD PTR [rbx+0x8]
0x1401ccce9: lea    rdx,[rbp+0x1110]
0x1401cccf0: lea    rcx,[rip+0x232cfc1]        # 0x1424f9cb8
0x1401cccf7: call   0x140b93930
0x1401cccfc: lea    rcx,[rbp+0x1110]
0x1401ccd03: call   0x14006f330
0x1401ccd08: cmp    rax,0x1e
0x1401ccd0c: jb     0x1401ccd5e
0x1401ccd0e: xor    r8d,r8d
0x1401ccd11: mov    edx,0x1d
0x1401ccd16: lea    rcx,[rbp+0x1110]
0x1401ccd1d: call   0x1400e1230
0x1401ccd22: mov    edx,0x1a
0x1401ccd27: lea    rcx,[rbp+0x1110]
0x1401ccd2e: call   0x1400fb540
0x1401ccd33: mov    BYTE PTR [rax],0x2e
0x1401ccd36: mov    edx,0x1b
0x1401ccd3b: lea    rcx,[rbp+0x1110]
0x1401ccd42: call   0x1400fb540
0x1401ccd47: mov    BYTE PTR [rax],0x2e
0x1401ccd4a: mov    edx,0x1c
0x1401ccd4f: lea    rcx,[rbp+0x1110]
0x1401ccd56: call   0x1400fb540
0x1401ccd5b: mov    BYTE PTR [rax],0x2e
0x1401ccd5e: xor    r9d,r9d
0x1401ccd61: xor    r8d,r8d
0x1401ccd64: lea    rdx,[rbp+0x1110]
0x1401ccd6b: lea    rcx,[rip+0x247d67e]        # 0x14264a3f0
0x1401ccd72: call   0x140ad9960
0x1401ccd77: nop
0x1401ccd78: lea    rcx,[rbp+0x1110]
0x1401ccd7f: jmp    0x1401cd0d8
0x1401ccd84: lea    rdx,[rip+0x1421595]        # 0x1415ee320  'Rescue '
0x1401ccd8b: lea    rcx,[rbp+0x1130]
0x1401ccd92: call   0x140068150
0x1401ccd97: nop
0x1401ccd98: lea    rcx,[rbp+0x5a0]
0x1401ccd9f: call   0x140072080
0x1401ccda4: mov    r8,QWORD PTR [rbx+0x130]
0x1401ccdab: mov    edi,0x1
0x1401ccdb0: mov    WORD PTR [rsp+0x28],di
0x1401ccdb5: mov    WORD PTR [rsp+0x20],di
0x1401ccdba: lea    r9,[rbp+0x5a0]
0x1401ccdc1: mov    r8d,DWORD PTR [r8]
0x1401ccdc4: lea    rdx,[rbp+0x1130]
0x1401ccdcb: lea    rcx,[rip+0x232cee6]        # 0x1424f9cb8
0x1401ccdd2: call   0x140b92f10
0x1401ccdd7: lea    rcx,[rbp+0x1130]
0x1401ccdde: call   0x14006f330
0x1401ccde3: cmp    rax,0x1e
0x1401ccde7: jb     0x1401cce39
0x1401ccde9: xor    r8d,r8d
0x1401ccdec: mov    edx,0x1d
0x1401ccdf1: lea    rcx,[rbp+0x1130]
0x1401ccdf8: call   0x1400e1230
0x1401ccdfd: mov    edx,0x1a
0x1401cce02: lea    rcx,[rbp+0x1130]
0x1401cce09: call   0x1400fb540
0x1401cce0e: mov    BYTE PTR [rax],0x2e
0x1401cce11: mov    edx,0x1b
0x1401cce16: lea    rcx,[rbp+0x1130]
0x1401cce1d: call   0x1400fb540
0x1401cce22: mov    BYTE PTR [rax],0x2e
0x1401cce25: mov    edx,0x1c
0x1401cce2a: lea    rcx,[rbp+0x1130]
0x1401cce31: call   0x1400fb540
0x1401cce36: mov    BYTE PTR [rax],0x2e
0x1401cce39: xor    r9d,r9d
0x1401cce3c: xor    r8d,r8d
0x1401cce3f: lea    rdx,[rbp+0x1130]
0x1401cce46: lea    rcx,[rip+0x247d5a3]        # 0x14264a3f0
0x1401cce4d: call   0x140ad9960
0x1401cce52: nop
0x1401cce53: lea    rcx,[rbp+0x1130]
0x1401cce5a: call   0x140067e30
0x1401cce5f: mov    rbx,QWORD PTR [rbp-0x78]
0x1401cce63: jmp    0x1401cd0e6
0x1401cce68: lea    rdx,[rip+0x1436f41]        # 0x141603db0  'Recover '
0x1401cce6f: lea    rcx,[rbp+0x1150]
0x1401cce76: call   0x140068150
0x1401cce7b: nop
0x1401cce7c: mov    r8,QWORD PTR [rbx+0x130]
0x1401cce83: xor    r9d,r9d
0x1401cce86: mov    r8d,DWORD PTR [r8]
0x1401cce89: lea    rdx,[rbp+0x1150]
0x1401cce90: lea    rcx,[rip+0x232ce21]        # 0x1424f9cb8
0x1401cce97: call   0x140b94400
0x1401cce9c: lea    rcx,[rbp+0x1150]
0x1401ccea3: call   0x14006f330
0x1401ccea8: cmp    rax,0x1e
0x1401cceac: jb     0x1401ccefe
0x1401cceae: xor    r8d,r8d
0x1401cceb1: mov    edx,0x1d
0x1401cceb6: lea    rcx,[rbp+0x1150]
0x1401ccebd: call   0x1400e1230
0x1401ccec2: mov    edx,0x1a
0x1401ccec7: lea    rcx,[rbp+0x1150]
0x1401ccece: call   0x1400fb540
0x1401cced3: mov    BYTE PTR [rax],0x2e
0x1401cced6: mov    edx,0x1b
0x1401ccedb: lea    rcx,[rbp+0x1150]
0x1401ccee2: call   0x1400fb540
0x1401ccee7: mov    BYTE PTR [rax],0x2e
0x1401cceea: mov    edx,0x1c
0x1401cceef: lea    rcx,[rbp+0x1150]
0x1401ccef6: call   0x1400fb540
0x1401ccefb: mov    BYTE PTR [rax],0x2e
0x1401ccefe: xor    r9d,r9d
0x1401ccf01: xor    r8d,r8d
0x1401ccf04: lea    rdx,[rbp+0x1150]
0x1401ccf0b: lea    rcx,[rip+0x247d4de]        # 0x14264a3f0
0x1401ccf12: call   0x140ad9960
0x1401ccf17: nop
0x1401ccf18: lea    rcx,[rbp+0x1150]
0x1401ccf1f: jmp    0x1401cd0d8
0x1401ccf24: lea    rcx,[rbp+0xe30]
0x1401ccf2b: call   0x14006f690
0x1401ccf30: nop
0x1401ccf31: mov    rax,QWORD PTR [rbx+0x130]
0x1401ccf38: movsxd rcx,DWORD PTR [rax]
0x1401ccf3b: cmp    ecx,0x6
0x1401ccf3e: ja     0x1401ccf89
0x1401ccf40: lea    rdx,[rip+0xffffffffffe330b9]        # 0x140000000
0x1401ccf47: mov    ecx,DWORD PTR [rdx+rcx*4+0x1d3978]
0x1401ccf4e: add    rcx,rdx
0x1401ccf51: jmp    rcx
0x1401ccf53: lea    rdx,[rip+0x1436ae6]        # 0x141603a40  'Explore '
0x1401ccf5a: jmp    0x1401ccf90
0x1401ccf5c: lea    rdx,[rip+0x1436aed]        # 0x141603a50  'Pillage '
0x1401ccf63: jmp    0x1401ccf90
0x1401ccf65: lea    rdx,[rip+0x1436af4]        # 0x141603a60  'Demand tribute from '
0x1401ccf6c: jmp    0x1401ccf90
0x1401ccf6e: lea    rdx,[rip+0x1436b03]        # 0x141603a78  'Raze '
0x1401ccf75: jmp    0x1401ccf90
0x1401ccf77: lea    rdx,[rip+0x1436e12]        # 0x141603d90  'Take over '
0x1401ccf7e: jmp    0x1401ccf90
0x1401ccf80: lea    rdx,[rip+0x1436e15]        # 0x141603d9c  'Seize '
0x1401ccf87: jmp    0x1401ccf90
0x1401ccf89: lea    rdx,[rip+0x1436e14]        # 0x141603da4  'Raid '
0x1401ccf90: lea    rcx,[rbp+0xe30]
0x1401ccf97: call   0x14006f580
0x1401ccf9c: xor    r9d,r9d
0x1401ccf9f: mov    r8d,DWORD PTR [rbx+0x8]
0x1401ccfa3: lea    rdx,[rbp+0xe30]
0x1401ccfaa: lea    rcx,[rip+0x232cd07]        # 0x1424f9cb8
0x1401ccfb1: call   0x140b93930
0x1401ccfb6: lea    rcx,[rbp+0xe30]
0x1401ccfbd: call   0x14006f330
0x1401ccfc2: cmp    rax,0x1e
0x1401ccfc6: jb     0x1401cd018
0x1401ccfc8: xor    r8d,r8d
0x1401ccfcb: mov    edx,0x1d
0x1401ccfd0: lea    rcx,[rbp+0xe30]
0x1401ccfd7: call   0x1400e1230
0x1401ccfdc: mov    edx,0x1a
0x1401ccfe1: lea    rcx,[rbp+0xe30]
0x1401ccfe8: call   0x1400fb540
0x1401ccfed: mov    BYTE PTR [rax],0x2e
0x1401ccff0: mov    edx,0x1b
0x1401ccff5: lea    rcx,[rbp+0xe30]
0x1401ccffc: call   0x1400fb540
0x1401cd001: mov    BYTE PTR [rax],0x2e
0x1401cd004: mov    edx,0x1c
0x1401cd009: lea    rcx,[rbp+0xe30]
0x1401cd010: call   0x1400fb540
0x1401cd015: mov    BYTE PTR [rax],0x2e
0x1401cd018: xor    r9d,r9d
0x1401cd01b: xor    r8d,r8d
0x1401cd01e: lea    rdx,[rbp+0xe30]
0x1401cd025: lea    rcx,[rip+0x247d3c4]        # 0x14264a3f0
0x1401cd02c: call   0x140ad9960
0x1401cd031: nop
0x1401cd032: lea    rcx,[rbp+0xe30]
0x1401cd039: jmp    0x1401cd0d8
0x1401cd03e: xor    r8d,r8d
0x1401cd041: mov    edx,0x7
0x1401cd046: xor    r9d,r9d
0x1401cd049: lea    rcx,[rip+0x247d3a0]        # 0x14264a3f0
0x1401cd050: call   0x1400bb130
0x1401cd055: lea    rdx,[rip+0x1436f0c]        # 0x141603f68  'No specific orders'
0x1401cd05c: lea    rcx,[rbp+0x2d10]
0x1401cd063: call   0x140068150
0x1401cd068: nop
0x1401cd069: xor    r9d,r9d
0x1401cd06c: xor    r8d,r8d
0x1401cd06f: lea    rdx,[rbp+0x2d10]
0x1401cd076: lea    rcx,[rip+0x247d373]        # 0x14264a3f0
0x1401cd07d: call   0x140ad9960
0x1401cd082: nop
0x1401cd083: lea    rcx,[rbp+0x2d10]
0x1401cd08a: jmp    0x1401cd0d8
0x1401cd08c: xor    r8d,r8d
0x1401cd08f: mov    edx,0x7
0x1401cd094: xor    r9d,r9d
0x1401cd097: lea    rcx,[rip+0x247d352]        # 0x14264a3f0
0x1401cd09e: call   0x1400bb130
0x1401cd0a3: lea    rdx,[rip+0x1436ebe]        # 0x141603f68  'No specific orders'
0x1401cd0aa: lea    rcx,[rbp+0x2d30]
0x1401cd0b1: call   0x140068150
0x1401cd0b6: nop
0x1401cd0b7: xor    r9d,r9d
0x1401cd0ba: xor    r8d,r8d
0x1401cd0bd: lea    rdx,[rbp+0x2d30]
0x1401cd0c4: lea    rcx,[rip+0x247d325]        # 0x14264a3f0
0x1401cd0cb: call   0x140ad9960
0x1401cd0d0: nop
0x1401cd0d1: lea    rcx,[rbp+0x2d30]
0x1401cd0d8: call   0x140067e30
0x1401cd0dd: mov    rbx,QWORD PTR [rbp-0x78]
0x1401cd0e1: mov    edi,0x1
0x1401cd0e6: lea    rcx,[r12+0x3b0]
0x1401cd0ee: mov    rdx,rsi
0x1401cd0f1: call   0x14006f360
0x1401cd0f6: test   BYTE PTR [rax],0x1
0x1401cd0f9: jne    0x1401cd1ac
0x1401cd0ff: xor    r15b,r15b
0x1401cd102: mov    rdx,rsi
0x1401cd105: mov    rcx,r14
0x1401cd108: call   0x14006f220
0x1401cd10d: mov    rcx,QWORD PTR [rax]
0x1401cd110: cmp    DWORD PTR [rcx+0x58],0xffffffff
0x1401cd114: je     0x1401cd131
0x1401cd116: mov    rdx,rsi
0x1401cd119: mov    rcx,r14
0x1401cd11c: call   0x14006f220
0x1401cd121: mov    rcx,QWORD PTR [rax]
0x1401cd124: movzx  r15d,r15b
0x1401cd128: mov    eax,DWORD PTR [rbx]
0x1401cd12a: cmp    DWORD PTR [rcx+0x58],eax
0x1401cd12d: cmove  r15d,edi
0x1401cd131: mov    r14d,DWORD PTR [rsp+0x70]
0x1401cd136: lea    r12,[rip+0x248479b]        # 0x1426518d8
0x1401cd13d: mov    r13d,DWORD PTR [rbp-0x60]
0x1401cd141: mov    edi,r13d
0x1401cd144: mov    rbx,r12
0x1401cd147: mov    esi,0x4
0x1401cd14c: nop    DWORD PTR [rax+0x0]
0x1401cd150: mov    r8d,edi
0x1401cd153: mov    edx,r14d
0x1401cd156: lea    rcx,[rip+0x247d293]        # 0x14264a3f0
0x1401cd15d: call   0x1400bb120
0x1401cd162: xor    r8d,r8d
0x1401cd165: lea    rcx,[rip+0x247d284]        # 0x14264a3f0
0x1401cd16c: test   r15b,r15b
0x1401cd16f: je     0x1401cd176
0x1401cd171: mov    edx,DWORD PTR [rbx-0x30]
0x1401cd174: jmp    0x1401cd178
0x1401cd176: mov    edx,DWORD PTR [rbx]
0x1401cd178: call   0x140adb100
0x1401cd17d: inc    edi
0x1401cd17f: add    rbx,0xc
0x1401cd183: sub    rsi,0x1
0x1401cd187: jne    0x1401cd150
0x1401cd189: inc    r14d
0x1401cd18c: add    r12,0x4
0x1401cd190: lea    rax,[rip+0x248474d]        # 0x1426518e4
0x1401cd197: cmp    r12,rax
0x1401cd19a: jl     0x1401cd141
0x1401cd19c: mov    r13d,DWORD PTR [rbp-0x28]
0x1401cd1a0: mov    r15d,DWORD PTR [rsp+0x70]
0x1401cd1a5: mov    esi,DWORD PTR [rbp-0x58]
0x1401cd1a8: mov    r14,QWORD PTR [rbp-0x30]
0x1401cd1ac: add    r15d,0x3
0x1401cd1b0: mov    DWORD PTR [rsp+0x70],r15d
0x1401cd1b5: lea    rcx,[rbp+0xfb0]
0x1401cd1bc: call   0x140067e30
0x1401cd1c1: inc    esi
0x1401cd1c3: mov    DWORD PTR [rbp-0x58],esi
0x1401cd1c6: cmp    esi,DWORD PTR [rbp-0x20]
0x1401cd1c9: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401cd1cc: mov    r12,QWORD PTR [rbp+0x18]
0x1401cd1d0: jl     0x1401cc8f2
0x1401cd1d6: mov    edi,DWORD PTR [rsp+0x74]
0x1401cd1da: mov    r14,QWORD PTR [rsp+0x78]
0x1401cd1df: cmp    r12d,edi
0x1401cd1e2: jle    0x1401cdec0
0x1401cd1e8: lea    ebx,[rdi*2-0x1]
0x1401cd1ef: add    ebx,edi
0x1401cd1f1: lea    rcx,[rbp+0x230]
0x1401cd1f8: call   0x1400bb360
0x1401cd1fd: lea    r9d,[r12-0x1]
0x1401cd202: mov    DWORD PTR [rsp+0x30],ebx
0x1401cd206: mov    DWORD PTR [rsp+0x28],0x2
0x1401cd20e: mov    DWORD PTR [rsp+0x20],edi
0x1401cd212: xor    r8d,r8d
0x1401cd215: mov    edx,DWORD PTR [r14+0x3d0]
0x1401cd21c: lea    rcx,[rbp+0x230]
0x1401cd223: call   0x1400bb380
0x1401cd228: mov    r9d,DWORD PTR [rbp-0x6c]
0x1401cd22c: inc    r9d
0x1401cd22f: movzx  eax,BYTE PTR [r14+0x3d4]
0x1401cd237: lea    rcx,[rbp+0x230]
0x1401cd23e: jmp    0x1401cdea8
0x1401cd243: xor    r8d,r8d
0x1401cd246: mov    edx,0x6
0x1401cd24b: mov    r9b,0x1
0x1401cd24e: lea    rcx,[rip+0x247d19b]        # 0x14264a3f0
0x1401cd255: call   0x1400bb130
0x1401cd25a: lea    r8d,[r13+0x2]
0x1401cd25e: mov    edx,0x1
0x1401cd263: lea    rcx,[rip+0x247d186]        # 0x14264a3f0
0x1401cd26a: call   0x1400bb120
0x1401cd26f: lea    rdx,[rip+0x1436d0a]        # 0x141603f80  'No messengers available'
0x1401cd276: lea    rcx,[rbp+0x2d70]
0x1401cd27d: call   0x140068150
0x1401cd282: nop
0x1401cd283: xor    r9d,r9d
0x1401cd286: xor    r8d,r8d
0x1401cd289: lea    rdx,[rbp+0x2d70]
0x1401cd290: lea    rcx,[rip+0x247d159]        # 0x14264a3f0
0x1401cd297: call   0x140ad9960
0x1401cd29c: nop
0x1401cd29d: lea    rcx,[rbp+0x2d70]
0x1401cd2a4: jmp    0x1401ce16f
0x1401cd2a9: add    rbx,0x350
0x1401cd2b0: mov    rcx,rbx
0x1401cd2b3: call   0x14006ee50
0x1401cd2b8: test   rax,rax
0x1401cd2bb: je     0x1401ce10e
0x1401cd2c1: lea    rdx,[rbp+0xb0]
0x1401cd2c8: mov    rcx,rbx
0x1401cd2cb: call   0x14006f240
0x1401cd2d0: lea    rdx,[rbp+0x178]
0x1401cd2d7: mov    rcx,rbx
0x1401cd2da: call   0x14006f230
0x1401cd2df: lea    rdx,[rbp+0x178]
0x1401cd2e6: lea    rcx,[rbp+0xb0]
0x1401cd2ed: call   0x1400b9970
0x1401cd2f2: test   al,al
0x1401cd2f4: jne    0x1401cd368
0x1401cd2f6: data16 nop WORD PTR [rax+rax*1+0x0]
0x1401cd300: lea    rcx,[rbp+0xb0]
0x1401cd307: call   0x14006ee10
0x1401cd30c: mov    rcx,QWORD PTR [rax]
0x1401cd30f: mov    eax,DWORD PTR [r12]
0x1401cd313: cmp    DWORD PTR [rcx+0x1d0],eax
0x1401cd319: jne    0x1401cd345
0x1401cd31b: mov    BYTE PTR [rbp-0x40],0x1
0x1401cd31f: mov    rcx,r12
0x1401cd322: call   0x140075110
0x1401cd327: cmp    eax,0x19
0x1401cd32a: jne    0x1401cd345
0x1401cd32c: mov    rcx,QWORD PTR [r12+0x130]
0x1401cd334: call   0x14006f450
0x1401cd339: test   rax,rax
0x1401cd33c: jne    0x1401cd345
0x1401cd33e: mov    BYTE PTR [rbp-0x40],al
0x1401cd341: mov    BYTE PTR [rbp-0x50],0x1
0x1401cd345: lea    rcx,[rbp+0xb0]
0x1401cd34c: call   0x14006ee00
0x1401cd351: lea    rdx,[rbp+0x178]
0x1401cd358: lea    rcx,[rbp+0xb0]
0x1401cd35f: call   0x1400b9970
0x1401cd364: test   al,al
0x1401cd366: je     0x1401cd300
0x1401cd368: add    r13d,0x2
0x1401cd36c: mov    DWORD PTR [rbp-0x28],r13d
0x1401cd370: lea    edi,[r15-0x2]
0x1401cd374: mov    DWORD PTR [rsp+0x70],edi
0x1401cd378: lea    ecx,[r14-0x7]
0x1401cd37c: mov    eax,0x55555556
0x1401cd381: imul   ecx
0x1401cd383: mov    esi,edx
0x1401cd385: shr    esi,0x1f
0x1401cd388: add    esi,edx
0x1401cd38a: mov    DWORD PTR [rbp-0x68],esi
0x1401cd38d: mov    rbx,QWORD PTR [rsp+0x78]
0x1401cd392: lea    rcx,[rbx+0x350]
0x1401cd399: call   0x14006ee50
0x1401cd39e: mov    r14,rax
0x1401cd3a1: mov    QWORD PTR [rbp+0x30],rax
0x1401cd3a5: cmp    eax,esi
0x1401cd3a7: jle    0x1401cd3b1
0x1401cd3a9: lea    edi,[r15-0x4]
0x1401cd3ad: mov    DWORD PTR [rsp+0x70],edi
0x1401cd3b1: lea    eax,[rdi-0x3]
0x1401cd3b4: mov    DWORD PTR [rbp-0x60],eax
0x1401cd3b7: mov    r12d,0x1
0x1401cd3bd: mov    DWORD PTR [rsp+0x74],r12d
0x1401cd3c2: mov    ecx,DWORD PTR [rbx+0x3c8]
0x1401cd3c8: mov    edx,r14d
0x1401cd3cb: sub    edx,esi
0x1401cd3cd: cmp    ecx,edx
0x1401cd3cf: cmovle edx,ecx
0x1401cd3d2: xor    r15d,r15d
0x1401cd3d5: test   edx,edx
0x1401cd3d7: cmovns r15d,edx
0x1401cd3db: mov    DWORD PTR [rbp-0x58],r15d
0x1401cd3df: lea    eax,[r15+rsi*1]
0x1401cd3e3: mov    DWORD PTR [rbp-0x20],eax
0x1401cd3e6: cmp    r15d,eax
0x1401cd3e9: jge    0x1401cde4e
0x1401cd3ef: lea    rax,[rbx+0x350]
0x1401cd3f6: mov    QWORD PTR [rbp+0x48],rax
0x1401cd3fa: jmp    0x1401cd405
0x1401cd3fc: nop    DWORD PTR [rax+0x0]
0x1401cd400: mov    rbx,QWORD PTR [rsp+0x78]
0x1401cd405: cmp    r15d,r14d
0x1401cd408: jge    0x1401cde47
0x1401cd40e: movsxd rdx,r15d
0x1401cd411: mov    rcx,rax
0x1401cd414: call   0x14006f220
0x1401cd419: mov    r14,QWORD PTR [rax]
0x1401cd41c: mov    QWORD PTR [rbp+0x18],r14
0x1401cd420: xor    r8d,r8d
0x1401cd423: mov    edx,0x7
0x1401cd428: mov    r9b,0x1
0x1401cd42b: lea    rcx,[rip+0x247cfbe]        # 0x14264a3f0
0x1401cd432: call   0x1400bb130
0x1401cd437: mov    edi,r13d
0x1401cd43a: mov    eax,DWORD PTR [rsp+0x70]
0x1401cd43e: cmp    r13d,eax
0x1401cd441: jg     0x1401cd547
0x1401cd447: lea    r15d,[r12+0x3]
0x1401cd44c: movsxd rsi,r13d
0x1401cd44f: nop
0x1401cd450: mov    ebx,r12d
0x1401cd453: cmp    r12d,r15d
0x1401cd456: jge    0x1401cd52d
0x1401cd45c: movsxd r14,eax
0x1401cd45f: nop
0x1401cd460: mov    r8d,edi
0x1401cd463: mov    edx,ebx
0x1401cd465: lea    rcx,[rip+0x247cf84]        # 0x14264a3f0
0x1401cd46c: call   0x1400bb120
0x1401cd471: cmp    ebx,r12d
0x1401cd474: jne    0x1401cd49f
0x1401cd476: cmp    edi,r13d
0x1401cd479: jne    0x1401cd483
0x1401cd47b: mov    edx,DWORD PTR [rip+0x247e9b3]        # 0x14264be34
0x1401cd481: jmp    0x1401cd4ef
0x1401cd483: lea    rcx,[rip+0x247cf66]        # 0x14264a3f0
0x1401cd48a: cmp    rsi,r14
0x1401cd48d: jne    0x1401cd497
0x1401cd48f: mov    edx,DWORD PTR [rip+0x247e9b7]        # 0x14264be4c
0x1401cd495: jmp    0x1401cd4f6
0x1401cd497: mov    edx,DWORD PTR [rip+0x247e9a3]        # 0x14264be40
0x1401cd49d: jmp    0x1401cd4f6
0x1401cd49f: lea    eax,[r12+0x2]
0x1401cd4a4: cmp    ebx,eax
0x1401cd4a6: jne    0x1401cd4d1
0x1401cd4a8: cmp    edi,r13d
0x1401cd4ab: jne    0x1401cd4b5
0x1401cd4ad: mov    edx,DWORD PTR [rip+0x247e989]        # 0x14264be3c
0x1401cd4b3: jmp    0x1401cd4ef
0x1401cd4b5: lea    rcx,[rip+0x247cf34]        # 0x14264a3f0
0x1401cd4bc: cmp    rsi,r14
0x1401cd4bf: jne    0x1401cd4c9
0x1401cd4c1: mov    edx,DWORD PTR [rip+0x247e98d]        # 0x14264be54
0x1401cd4c7: jmp    0x1401cd4f6
0x1401cd4c9: mov    edx,DWORD PTR [rip+0x247e979]        # 0x14264be48
0x1401cd4cf: jmp    0x1401cd4f6
0x1401cd4d1: cmp    edi,r13d
0x1401cd4d4: jne    0x1401cd4de
0x1401cd4d6: mov    edx,DWORD PTR [rip+0x247e95c]        # 0x14264be38
0x1401cd4dc: jmp    0x1401cd4ef
0x1401cd4de: cmp    rsi,r14
0x1401cd4e1: mov    edx,DWORD PTR [rip+0x247e969]        # 0x14264be50
0x1401cd4e7: je     0x1401cd4ef
0x1401cd4e9: mov    edx,DWORD PTR [rip+0x247e955]        # 0x14264be44
0x1401cd4ef: lea    rcx,[rip+0x247cefa]        # 0x14264a3f0
0x1401cd4f6: call   0x140adaad0
0x1401cd4fb: xor    edx,edx
0x1401cd4fd: lea    rcx,[rip+0x220026c]        # 0x1423cd770
0x1401cd504: call   0x140071f90
0x1401cd509: test   al,al
0x1401cd50b: je     0x1401cd51e
0x1401cd50d: mov    r8b,0x1
0x1401cd510: xor    edx,edx
0x1401cd512: lea    rcx,[rip+0x247ced7]        # 0x14264a3f0
0x1401cd519: call   0x1400bb190
0x1401cd51e: inc    ebx
0x1401cd520: cmp    ebx,r15d
0x1401cd523: jl     0x1401cd460
0x1401cd529: mov    eax,DWORD PTR [rsp+0x70]
0x1401cd52d: inc    edi
0x1401cd52f: inc    rsi
0x1401cd532: cmp    edi,eax
0x1401cd534: jle    0x1401cd450
0x1401cd53a: mov    r14,QWORD PTR [rbp+0x18]
0x1401cd53e: mov    r15d,DWORD PTR [rbp-0x58]
0x1401cd542: mov    rbx,QWORD PTR [rsp+0x78]
0x1401cd547: cmp    DWORD PTR [r14+0x1d4],0x0
0x1401cd54f: jne    0x1401cd58c
0x1401cd551: cmp    DWORD PTR [r14+0x1dc],0x0
0x1401cd559: jl     0x1401cd57a
0x1401cd55b: lea    rcx,[rip+0x247d7ce]        # 0x14264ad30
0x1401cd562: call   0x14006f370
0x1401cd567: cmp    DWORD PTR [r14+0x1dc],eax
0x1401cd56e: jge    0x1401cd57a
0x1401cd570: mov    rcx,r14
0x1401cd573: call   0x14040ac50
0x1401cd578: jmp    0x1401cd582
0x1401cd57a: mov    rcx,r14
0x1401cd57d: call   0x14040aa30
0x1401cd582: cmp    DWORD PTR [r14+0x1d4],0x0
0x1401cd58a: je     0x1401cd5cf
0x1401cd58c: mov    r8d,r13d
0x1401cd58f: mov    edx,r12d
0x1401cd592: lea    rcx,[rip+0x247ce57]        # 0x14264a3f0
0x1401cd599: call   0x1400bb120
0x1401cd59e: mov    BYTE PTR [rsp+0x30],0x0
0x1401cd5a3: mov    DWORD PTR [rsp+0x28],0x3
0x1401cd5ab: mov    DWORD PTR [rsp+0x20],0x4
0x1401cd5b3: mov    r9d,0x2
0x1401cd5b9: xor    r8d,r8d
0x1401cd5bc: mov    edx,DWORD PTR [r14+0x1d4]
0x1401cd5c3: lea    rcx,[rip+0x247ce26]        # 0x14264a3f0
0x1401cd5ca: call   0x140adad70
0x1401cd5cf: lea    rcx,[rbx+0x368]
0x1401cd5d6: movsxd rdx,r15d
0x1401cd5d9: call   0x14006f360
0x1401cd5de: xor    r8d,r8d
0x1401cd5e1: mov    r9b,0x1
0x1401cd5e4: lea    rcx,[rip+0x247ce05]        # 0x14264a3f0
0x1401cd5eb: test   BYTE PTR [rax],r9b
0x1401cd5ee: mov    edx,0x3
0x1401cd5f3: je     0x1401cd5fa
0x1401cd5f5: mov    edx,0x4
0x1401cd5fa: call   0x1400bb130
0x1401cd5ff: lea    edx,[r12+0x1]
0x1401cd604: lea    r8d,[r13+0x6]
0x1401cd608: lea    rcx,[rip+0x247cde1]        # 0x14264a3f0
0x1401cd60f: call   0x1400bb120
0x1401cd614: lea    rcx,[rbp+0xfd0]
0x1401cd61b: call   0x14006f690
0x1401cd620: nop
0x1401cd621: lea    rcx,[r14+0x80]
0x1401cd628: call   0x14006f520
0x1401cd62d: test   al,al
0x1401cd62f: jne    0x1401cd646
0x1401cd631: lea    rdx,[r14+0x80]
0x1401cd638: lea    rcx,[rbp+0xfd0]
0x1401cd63f: call   0x14006f5a0
0x1401cd644: jmp    0x1401cd65c
0x1401cd646: lea    rcx,[r14+0x8]
0x1401cd64a: xor    r9d,r9d
0x1401cd64d: mov    r8b,0x1
0x1401cd650: lea    rdx,[rbp+0xfd0]
0x1401cd657: call   0x140a946e0
0x1401cd65c: lea    rcx,[rbp+0xfd0]
0x1401cd663: call   0x14006f330
0x1401cd668: cmp    rax,0x12
0x1401cd66c: jb     0x1401cd6be
0x1401cd66e: xor    r8d,r8d
0x1401cd671: mov    edx,0x11
0x1401cd676: lea    rcx,[rbp+0xfd0]
0x1401cd67d: call   0x1400e1230
0x1401cd682: mov    edx,0xe
0x1401cd687: lea    rcx,[rbp+0xfd0]
0x1401cd68e: call   0x1400fb540
0x1401cd693: mov    BYTE PTR [rax],0x2e
0x1401cd696: mov    edx,0xf
0x1401cd69b: lea    rcx,[rbp+0xfd0]
0x1401cd6a2: call   0x1400fb540
0x1401cd6a7: mov    BYTE PTR [rax],0x2e
0x1401cd6aa: mov    edx,0x10
0x1401cd6af: lea    rcx,[rbp+0xfd0]
0x1401cd6b6: call   0x1400fb540
0x1401cd6bb: mov    BYTE PTR [rax],0x2e
0x1401cd6be: xor    r9d,r9d
0x1401cd6c1: xor    r8d,r8d
0x1401cd6c4: lea    rdx,[rbp+0xfd0]
0x1401cd6cb: lea    rcx,[rip+0x247cd1e]        # 0x14264a3f0
0x1401cd6d2: call   0x140ad9960
0x1401cd6d7: lea    r8d,[r13+0x6]
0x1401cd6db: lea    edx,[r12+0x2]
0x1401cd6e0: lea    rcx,[rip+0x247cd09]        # 0x14264a3f0
0x1401cd6e7: call   0x1400bb120
0x1401cd6ec: mov    eax,DWORD PTR [r14+0x1d0]
0x1401cd6f3: xor    r8d,r8d
0x1401cd6f6: lea    rcx,[rip+0x247ccf3]        # 0x14264a3f0
0x1401cd6fd: cmp    eax,0xffffffff
0x1401cd700: je     0x1401cdc51
0x1401cd706: mov    rbx,QWORD PTR [rbp-0x78]
0x1401cd70a: cmp    eax,DWORD PTR [rbx]
0x1401cd70c: jne    0x1401cd75a
0x1401cd70e: mov    edx,0x2
0x1401cd713: mov    r9b,0x1
0x1401cd716: call   0x1400bb130
0x1401cd71b: lea    rdx,[rip+0x1436836]        # 0x141603f58  'On this mission'
0x1401cd722: lea    rcx,[rbp+0x2d90]
0x1401cd729: call   0x140068150
0x1401cd72e: nop
0x1401cd72f: xor    r9d,r9d
0x1401cd732: xor    r8d,r8d
0x1401cd735: lea    rdx,[rbp+0x2d90]
0x1401cd73c: lea    rcx,[rip+0x247ccad]        # 0x14264a3f0
0x1401cd743: call   0x140ad9960
0x1401cd748: nop
0x1401cd749: lea    rcx,[rbp+0x2d90]
0x1401cd750: call   0x140067e30
0x1401cd755: jmp    0x1401cdd68
0x1401cd75a: mov    edx,0x3
0x1401cd75f: xor    r9d,r9d
0x1401cd762: call   0x1400bb130
0x1401cd767: mov    edx,DWORD PTR [r14+0x1d0]
0x1401cd76e: lea    rcx,[rip+0x231a693]        # 0x1424e7e08
0x1401cd775: call   0x140072570
0x1401cd77a: mov    rbx,rax
0x1401cd77d: test   rax,rax
0x1401cd780: je     0x1401cdc00
0x1401cd786: mov    rcx,rax
0x1401cd789: call   0x140075110
0x1401cd78e: sub    eax,0x2
0x1401cd791: je     0x1401cdae6
0x1401cd797: sub    eax,0xf
0x1401cd79a: je     0x1401cda2a
0x1401cd7a0: sub    eax,0x1
0x1401cd7a3: je     0x1401cd946
0x1401cd7a9: sub    eax,0x1
0x1401cd7ac: je     0x1401cd890
0x1401cd7b2: cmp    eax,0x6
0x1401cd7b5: jne    0x1401cdd64
0x1401cd7bb: lea    rcx,[rbp+0xf90]
0x1401cd7c2: call   0x14006f690
0x1401cd7c7: nop
0x1401cd7c8: lea    rdx,[rbp+0xf90]
0x1401cd7cf: mov    rcx,QWORD PTR [rbx+0x130]
0x1401cd7d6: call   0x1401bb400
0x1401cd7db: lea    rdx,[rip+0x143487a]        # 0x14160205c  ' at '
0x1401cd7e2: lea    rcx,[rbp+0xf90]
0x1401cd7e9: call   0x14006f560
0x1401cd7ee: xor    r9d,r9d
0x1401cd7f1: mov    r8d,DWORD PTR [rbx+0x8]
0x1401cd7f5: lea    rdx,[rbp+0xf90]
0x1401cd7fc: lea    rcx,[rip+0x232c4b5]        # 0x1424f9cb8
0x1401cd803: call   0x140b93930
0x1401cd808: lea    rcx,[rbp+0xf90]
0x1401cd80f: call   0x14006f330
0x1401cd814: cmp    rax,0x1e
0x1401cd818: jb     0x1401cd86a
0x1401cd81a: xor    r8d,r8d
0x1401cd81d: mov    edx,0x1d
0x1401cd822: lea    rcx,[rbp+0xf90]
0x1401cd829: call   0x1400e1230
0x1401cd82e: mov    edx,0x1a
0x1401cd833: lea    rcx,[rbp+0xf90]
0x1401cd83a: call   0x1400fb540
0x1401cd83f: mov    BYTE PTR [rax],0x2e
0x1401cd842: mov    edx,0x1b
0x1401cd847: lea    rcx,[rbp+0xf90]
0x1401cd84e: call   0x1400fb540
0x1401cd853: mov    BYTE PTR [rax],0x2e
0x1401cd856: mov    edx,0x1c
0x1401cd85b: lea    rcx,[rbp+0xf90]
0x1401cd862: call   0x1400fb540
0x1401cd867: mov    BYTE PTR [rax],0x2e
0x1401cd86a: xor    r9d,r9d
0x1401cd86d: xor    r8d,r8d
0x1401cd870: lea    rdx,[rbp+0xf90]
0x1401cd877: lea    rcx,[rip+0x247cb72]        # 0x14264a3f0
0x1401cd87e: call   0x140ad9960
0x1401cd883: nop
0x1401cd884: lea    rcx,[rbp+0xf90]
0x1401cd88b: jmp    0x1401cdd5f
0x1401cd890: lea    rdx,[rip+0x1436191]        # 0x141603a28  'Request workers from '
0x1401cd897: lea    rcx,[rbp+0x1170]
0x1401cd89e: call   0x140068150
0x1401cd8a3: nop
0x1401cd8a4: xor    r9d,r9d
0x1401cd8a7: mov    r8d,DWORD PTR [rbx+0x8]
0x1401cd8ab: lea    rdx,[rbp+0x1170]
0x1401cd8b2: lea    rcx,[rip+0x232c3ff]        # 0x1424f9cb8
0x1401cd8b9: call   0x140b93930
0x1401cd8be: lea    rcx,[rbp+0x1170]
0x1401cd8c5: call   0x14006f330
0x1401cd8ca: cmp    rax,0x1e
0x1401cd8ce: jb     0x1401cd920
0x1401cd8d0: xor    r8d,r8d
0x1401cd8d3: mov    edx,0x1d
0x1401cd8d8: lea    rcx,[rbp+0x1170]
0x1401cd8df: call   0x1400e1230
0x1401cd8e4: mov    edx,0x1a
0x1401cd8e9: lea    rcx,[rbp+0x1170]
0x1401cd8f0: call   0x1400fb540
0x1401cd8f5: mov    BYTE PTR [rax],0x2e
0x1401cd8f8: mov    edx,0x1b
0x1401cd8fd: lea    rcx,[rbp+0x1170]
0x1401cd904: call   0x1400fb540
0x1401cd909: mov    BYTE PTR [rax],0x2e
0x1401cd90c: mov    edx,0x1c
0x1401cd911: lea    rcx,[rbp+0x1170]
0x1401cd918: call   0x1400fb540
0x1401cd91d: mov    BYTE PTR [rax],0x2e
0x1401cd920: xor    r9d,r9d
0x1401cd923: xor    r8d,r8d
0x1401cd926: lea    rdx,[rbp+0x1170]
0x1401cd92d: lea    rcx,[rip+0x247cabc]        # 0x14264a3f0
0x1401cd934: call   0x140ad9960
0x1401cd939: nop
0x1401cd93a: lea    rcx,[rbp+0x1170]
0x1401cd941: jmp    0x1401cdd5f
0x1401cd946: lea    rdx,[rip+0x14209d3]        # 0x1415ee320  'Rescue '
0x1401cd94d: lea    rcx,[rbp+0x1190]
0x1401cd954: call   0x140068150
0x1401cd959: nop
0x1401cd95a: lea    rcx,[rbp+0x4d0]
0x1401cd961: call   0x140072080
0x1401cd966: mov    r8,QWORD PTR [rbx+0x130]
0x1401cd96d: mov    edi,0x1
0x1401cd972: mov    WORD PTR [rsp+0x28],di
0x1401cd977: mov    WORD PTR [rsp+0x20],di
0x1401cd97c: lea    r9,[rbp+0x4d0]
0x1401cd983: mov    r8d,DWORD PTR [r8]
0x1401cd986: lea    rdx,[rbp+0x1190]
0x1401cd98d: lea    rcx,[rip+0x232c324]        # 0x1424f9cb8
0x1401cd994: call   0x140b92f10
0x1401cd999: lea    rcx,[rbp+0x1190]
0x1401cd9a0: call   0x14006f330
0x1401cd9a5: cmp    rax,0x1e
0x1401cd9a9: jb     0x1401cd9fb
0x1401cd9ab: xor    r8d,r8d
0x1401cd9ae: mov    edx,0x1d
0x1401cd9b3: lea    rcx,[rbp+0x1190]
0x1401cd9ba: call   0x1400e1230
0x1401cd9bf: mov    edx,0x1a
0x1401cd9c4: lea    rcx,[rbp+0x1190]
0x1401cd9cb: call   0x1400fb540
0x1401cd9d0: mov    BYTE PTR [rax],0x2e
0x1401cd9d3: mov    edx,0x1b
0x1401cd9d8: lea    rcx,[rbp+0x1190]
0x1401cd9df: call   0x1400fb540
0x1401cd9e4: mov    BYTE PTR [rax],0x2e
0x1401cd9e7: mov    edx,0x1c
0x1401cd9ec: lea    rcx,[rbp+0x1190]
0x1401cd9f3: call   0x1400fb540
0x1401cd9f8: mov    BYTE PTR [rax],0x2e
0x1401cd9fb: xor    r9d,r9d
0x1401cd9fe: xor    r8d,r8d
0x1401cda01: lea    rdx,[rbp+0x1190]
0x1401cda08: lea    rcx,[rip+0x247c9e1]        # 0x14264a3f0
0x1401cda0f: call   0x140ad9960
0x1401cda14: nop
0x1401cda15: lea    rcx,[rbp+0x1190]
0x1401cda1c: call   0x140067e30
0x1401cda21: mov    rbx,QWORD PTR [rbp-0x78]
0x1401cda25: jmp    0x1401cdd6d
0x1401cda2a: lea    rdx,[rip+0x143637f]        # 0x141603db0  'Recover '
0x1401cda31: lea    rcx,[rbp+0x11b0]
0x1401cda38: call   0x140068150
0x1401cda3d: nop
0x1401cda3e: mov    r8,QWORD PTR [rbx+0x130]
0x1401cda45: xor    r9d,r9d
0x1401cda48: mov    r8d,DWORD PTR [r8]
0x1401cda4b: lea    rdx,[rbp+0x11b0]
0x1401cda52: lea    rcx,[rip+0x232c25f]        # 0x1424f9cb8
0x1401cda59: call   0x140b94400
0x1401cda5e: lea    rcx,[rbp+0x11b0]
0x1401cda65: call   0x14006f330
0x1401cda6a: cmp    rax,0x1e
0x1401cda6e: jb     0x1401cdac0
0x1401cda70: xor    r8d,r8d
0x1401cda73: mov    edx,0x1d
0x1401cda78: lea    rcx,[rbp+0x11b0]
0x1401cda7f: call   0x1400e1230
0x1401cda84: mov    edx,0x1a
0x1401cda89: lea    rcx,[rbp+0x11b0]
0x1401cda90: call   0x1400fb540
0x1401cda95: mov    BYTE PTR [rax],0x2e
0x1401cda98: mov    edx,0x1b
0x1401cda9d: lea    rcx,[rbp+0x11b0]
0x1401cdaa4: call   0x1400fb540
0x1401cdaa9: mov    BYTE PTR [rax],0x2e
0x1401cdaac: mov    edx,0x1c
0x1401cdab1: lea    rcx,[rbp+0x11b0]
0x1401cdab8: call   0x1400fb540
0x1401cdabd: mov    BYTE PTR [rax],0x2e
0x1401cdac0: xor    r9d,r9d
0x1401cdac3: xor    r8d,r8d
0x1401cdac6: lea    rdx,[rbp+0x11b0]
0x1401cdacd: lea    rcx,[rip+0x247c91c]        # 0x14264a3f0
0x1401cdad4: call   0x140ad9960
0x1401cdad9: nop
0x1401cdada: lea    rcx,[rbp+0x11b0]
0x1401cdae1: jmp    0x1401cdd5f
0x1401cdae6: lea    rcx,[rbp+0xe50]
0x1401cdaed: call   0x14006f690
0x1401cdaf2: nop
0x1401cdaf3: mov    rax,QWORD PTR [rbx+0x130]
0x1401cdafa: movsxd rcx,DWORD PTR [rax]
0x1401cdafd: cmp    ecx,0x6
0x1401cdb00: ja     0x1401cdb4b
0x1401cdb02: lea    rdx,[rip+0xffffffffffe324f7]        # 0x140000000
0x1401cdb09: mov    ecx,DWORD PTR [rdx+rcx*4+0x1d3994]
0x1401cdb10: add    rcx,rdx
0x1401cdb13: jmp    rcx
0x1401cdb15: lea    rdx,[rip+0x1435f24]        # 0x141603a40  'Explore '
0x1401cdb1c: jmp    0x1401cdb52
0x1401cdb1e: lea    rdx,[rip+0x1435f2b]        # 0x141603a50  'Pillage '
0x1401cdb25: jmp    0x1401cdb52
0x1401cdb27: lea    rdx,[rip+0x1435f32]        # 0x141603a60  'Demand tribute from '
0x1401cdb2e: jmp    0x1401cdb52
0x1401cdb30: lea    rdx,[rip+0x1435f41]        # 0x141603a78  'Raze '
0x1401cdb37: jmp    0x1401cdb52
0x1401cdb39: lea    rdx,[rip+0x1436250]        # 0x141603d90  'Take over '
0x1401cdb40: jmp    0x1401cdb52
0x1401cdb42: lea    rdx,[rip+0x1436253]        # 0x141603d9c  'Seize '
0x1401cdb49: jmp    0x1401cdb52
0x1401cdb4b: lea    rdx,[rip+0x1436252]        # 0x141603da4  'Raid '
0x1401cdb52: lea    rcx,[rbp+0xe50]
0x1401cdb59: call   0x14006f580
0x1401cdb5e: xor    r9d,r9d
0x1401cdb61: mov    r8d,DWORD PTR [rbx+0x8]
0x1401cdb65: lea    rdx,[rbp+0xe50]
0x1401cdb6c: lea    rcx,[rip+0x232c145]        # 0x1424f9cb8
0x1401cdb73: call   0x140b93930
0x1401cdb78: lea    rcx,[rbp+0xe50]
0x1401cdb7f: call   0x14006f330
0x1401cdb84: cmp    rax,0x1e
0x1401cdb88: jb     0x1401cdbda
0x1401cdb8a: xor    r8d,r8d
0x1401cdb8d: mov    edx,0x1d
0x1401cdb92: lea    rcx,[rbp+0xe50]
0x1401cdb99: call   0x1400e1230
0x1401cdb9e: mov    edx,0x1a
0x1401cdba3: lea    rcx,[rbp+0xe50]
0x1401cdbaa: call   0x1400fb540
0x1401cdbaf: mov    BYTE PTR [rax],0x2e
0x1401cdbb2: mov    edx,0x1b
0x1401cdbb7: lea    rcx,[rbp+0xe50]
0x1401cdbbe: call   0x1400fb540
0x1401cdbc3: mov    BYTE PTR [rax],0x2e
0x1401cdbc6: mov    edx,0x1c
0x1401cdbcb: lea    rcx,[rbp+0xe50]
0x1401cdbd2: call   0x1400fb540
0x1401cdbd7: mov    BYTE PTR [rax],0x2e
0x1401cdbda: xor    r9d,r9d
0x1401cdbdd: xor    r8d,r8d
0x1401cdbe0: lea    rdx,[rbp+0xe50]
0x1401cdbe7: lea    rcx,[rip+0x247c802]        # 0x14264a3f0
0x1401cdbee: call   0x140ad9960
0x1401cdbf3: nop
0x1401cdbf4: lea    rcx,[rbp+0xe50]
0x1401cdbfb: jmp    0x1401cdd5f
0x1401cdc00: xor    r8d,r8d
0x1401cdc03: mov    edx,0x7
0x1401cdc08: xor    r9d,r9d
0x1401cdc0b: lea    rcx,[rip+0x247c7de]        # 0x14264a3f0
0x1401cdc12: call   0x1400bb130
0x1401cdc17: lea    rdx,[rip+0x143634a]        # 0x141603f68  'No specific orders'
0x1401cdc1e: lea    rcx,[rbp+0x2db0]
0x1401cdc25: call   0x140068150
0x1401cdc2a: nop
0x1401cdc2b: xor    r9d,r9d
0x1401cdc2e: xor    r8d,r8d
0x1401cdc31: lea    rdx,[rbp+0x2db0]
0x1401cdc38: lea    rcx,[rip+0x247c7b1]        # 0x14264a3f0
0x1401cdc3f: call   0x140ad9960
0x1401cdc44: nop
0x1401cdc45: lea    rcx,[rbp+0x2db0]
0x1401cdc4c: jmp    0x1401cdd5f
0x1401cdc51: mov    edx,0x7
0x1401cdc56: xor    r9d,r9d
0x1401cdc59: call   0x1400bb130
0x1401cdc5e: lea    rcx,[r14+0xb8]
0x1401cdc65: call   0x14006ee50
0x1401cdc6a: test   rax,rax
0x1401cdc6d: je     0x1401cdd2a
0x1401cdc73: xor    edx,edx
0x1401cdc75: lea    rcx,[r14+0xb8]
0x1401cdc7c: call   0x14006f220
0x1401cdc81: mov    rbx,QWORD PTR [rax]
0x1401cdc84: lea    rcx,[rbp+0x11d0]
0x1401cdc8b: call   0x14006f690
0x1401cdc90: nop
0x1401cdc91: mov    rax,QWORD PTR [rbx]
0x1401cdc94: mov    r8,QWORD PTR [rax+0x68]
0x1401cdc98: lea    rdx,[rbp+0x11d0]
0x1401cdc9f: mov    rcx,rbx
0x1401cdca2: call   r8
0x1401cdca5: lea    rcx,[rbp+0x11d0]
0x1401cdcac: call   0x14006f330
0x1401cdcb1: cmp    rax,0x1e
0x1401cdcb5: jb     0x1401cdd07
0x1401cdcb7: xor    r8d,r8d
0x1401cdcba: mov    edx,0x1d
0x1401cdcbf: lea    rcx,[rbp+0x11d0]
0x1401cdcc6: call   0x1400e1230
0x1401cdccb: mov    edx,0x1a
0x1401cdcd0: lea    rcx,[rbp+0x11d0]
0x1401cdcd7: call   0x1400fb540
0x1401cdcdc: mov    BYTE PTR [rax],0x2e
0x1401cdcdf: mov    edx,0x1b
0x1401cdce4: lea    rcx,[rbp+0x11d0]
0x1401cdceb: call   0x1400fb540
0x1401cdcf0: mov    BYTE PTR [rax],0x2e
0x1401cdcf3: mov    edx,0x1c
0x1401cdcf8: lea    rcx,[rbp+0x11d0]
0x1401cdcff: call   0x1400fb540
0x1401cdd04: mov    BYTE PTR [rax],0x2e
0x1401cdd07: xor    r9d,r9d
0x1401cdd0a: xor    r8d,r8d
0x1401cdd0d: lea    rdx,[rbp+0x11d0]
0x1401cdd14: lea    rcx,[rip+0x247c6d5]        # 0x14264a3f0
0x1401cdd1b: call   0x140ad9960
0x1401cdd20: nop
0x1401cdd21: lea    rcx,[rbp+0x11d0]
0x1401cdd28: jmp    0x1401cdd5f
0x1401cdd2a: lea    rdx,[rip+0x1436237]        # 0x141603f68  'No specific orders'
0x1401cdd31: lea    rcx,[rbp+0x2dd0]
0x1401cdd38: call   0x140068150
0x1401cdd3d: nop
0x1401cdd3e: xor    r9d,r9d
0x1401cdd41: xor    r8d,r8d
0x1401cdd44: lea    rdx,[rbp+0x2dd0]
0x1401cdd4b: lea    rcx,[rip+0x247c69e]        # 0x14264a3f0
0x1401cdd52: call   0x140ad9960
0x1401cdd57: nop
0x1401cdd58: lea    rcx,[rbp+0x2dd0]
0x1401cdd5f: call   0x140067e30
0x1401cdd64: mov    rbx,QWORD PTR [rbp-0x78]
0x1401cdd68: mov    edi,0x1
0x1401cdd6d: mov    rcx,QWORD PTR [rsp+0x78]
0x1401cdd72: add    rcx,0x368
0x1401cdd79: movsxd rdx,r15d
0x1401cdd7c: call   0x14006f360
0x1401cdd81: test   BYTE PTR [rax],0x1
0x1401cdd84: jne    0x1401cde19
0x1401cdd8a: xor    r15b,r15b
0x1401cdd8d: mov    eax,DWORD PTR [r14+0x1d0]
0x1401cdd94: cmp    eax,0xffffffff
0x1401cdd97: je     0x1401cdda3
0x1401cdd99: movzx  r15d,r15b
0x1401cdd9d: cmp    eax,DWORD PTR [rbx]
0x1401cdd9f: cmove  r15d,edi
0x1401cdda3: mov    r14d,r12d
0x1401cdda6: lea    r12,[rip+0x2483b2b]        # 0x1426518d8
0x1401cddad: mov    r13d,DWORD PTR [rbp-0x60]
0x1401cddb1: mov    edi,r13d
0x1401cddb4: mov    rbx,r12
0x1401cddb7: mov    esi,0x4
0x1401cddbc: nop    DWORD PTR [rax+0x0]
0x1401cddc0: mov    r8d,edi
0x1401cddc3: mov    edx,r14d
0x1401cddc6: lea    rcx,[rip+0x247c623]        # 0x14264a3f0
0x1401cddcd: call   0x1400bb120
0x1401cddd2: xor    r8d,r8d
0x1401cddd5: lea    rcx,[rip+0x247c614]        # 0x14264a3f0
0x1401cdddc: test   r15b,r15b
0x1401cdddf: je     0x1401cdde6
0x1401cdde1: mov    edx,DWORD PTR [rbx-0x30]
0x1401cdde4: jmp    0x1401cdde8
0x1401cdde6: mov    edx,DWORD PTR [rbx]
0x1401cdde8: call   0x140adb100
0x1401cdded: inc    edi
0x1401cddef: add    rbx,0xc
0x1401cddf3: sub    rsi,0x1
0x1401cddf7: jne    0x1401cddc0
0x1401cddf9: inc    r14d
0x1401cddfc: add    r12,0x4
0x1401cde00: lea    rax,[rip+0x2483add]        # 0x1426518e4
0x1401cde07: cmp    r12,rax
0x1401cde0a: jl     0x1401cddb1
0x1401cde0c: mov    r13d,DWORD PTR [rbp-0x28]
0x1401cde10: mov    r12d,DWORD PTR [rsp+0x74]
0x1401cde15: mov    r15d,DWORD PTR [rbp-0x58]
0x1401cde19: add    r12d,0x3
0x1401cde1d: mov    DWORD PTR [rsp+0x74],r12d
0x1401cde22: lea    rcx,[rbp+0xfd0]
0x1401cde29: call   0x140067e30
0x1401cde2e: inc    r15d
0x1401cde31: mov    DWORD PTR [rbp-0x58],r15d
0x1401cde35: cmp    r15d,DWORD PTR [rbp-0x20]
0x1401cde39: mov    r14,QWORD PTR [rbp+0x30]
0x1401cde3d: mov    rax,QWORD PTR [rbp+0x48]
0x1401cde41: jl     0x1401cd400
0x1401cde47: mov    edi,DWORD PTR [rsp+0x70]
0x1401cde4b: mov    esi,DWORD PTR [rbp-0x68]
0x1401cde4e: cmp    r14d,esi
0x1401cde51: jle    0x1401cdec0
0x1401cde53: lea    ebx,[rsi*2-0x1]
0x1401cde5a: add    ebx,esi
0x1401cde5c: lea    rcx,[rbp+0x310]
0x1401cde63: call   0x1400bb360
0x1401cde68: lea    r9d,[r14-0x1]
0x1401cde6c: mov    DWORD PTR [rsp+0x30],ebx
0x1401cde70: mov    DWORD PTR [rsp+0x28],0x2
0x1401cde78: mov    DWORD PTR [rsp+0x20],esi
0x1401cde7c: xor    r8d,r8d
0x1401cde7f: mov    rbx,QWORD PTR [rsp+0x78]
0x1401cde84: mov    edx,DWORD PTR [rbx+0x3c8]
0x1401cde8a: lea    rcx,[rbp+0x310]
0x1401cde91: call   0x1400bb380
0x1401cde96: lea    r9d,[rdi+0x1]
0x1401cde9a: movzx  eax,BYTE PTR [rbx+0x3cc]
0x1401cdea1: lea    rcx,[rbp+0x310]
0x1401cdea8: mov    DWORD PTR [rsp+0x28],0x0
0x1401cdeb0: mov    BYTE PTR [rsp+0x20],al
0x1401cdeb4: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401cdeb8: mov    edx,DWORD PTR [rbp-0x38]
0x1401cdebb: call   0x14140f4d0
0x1401cdec0: mov    edx,DWORD PTR [rbp-0x48]
0x1401cdec3: lea    eax,[rdx-0x2]
0x1401cdec6: lea    ecx,[rdx-0x37]
0x1401cdec9: add    eax,ecx
0x1401cdecb: cdq
0x1401cdecc: sub    eax,edx
0x1401cdece: sar    eax,1
0x1401cded0: lea    r13d,[rax-0x9]
0x1401cded4: mov    DWORD PTR [rbp-0x28],r13d
0x1401cded8: add    eax,0x8
0x1401cdedb: mov    DWORD PTR [rbp-0x60],eax
0x1401cdede: mov    ebx,DWORD PTR [rbp-0x70]
0x1401cdee1: add    ebx,0xfffffffc
0x1401cdee4: mov    DWORD PTR [rbp-0x58],ebx
0x1401cdee7: cmp    BYTE PTR [rbp-0x40],0x0
0x1401cdeeb: je     0x1401cdfd9
0x1401cdef1: mov    r14d,r13d
0x1401cdef4: cmp    r13d,eax
0x1401cdef7: jg     0x1401cdf75
0x1401cdef9: movsxd r15,r13d
0x1401cdefc: movsxd r12,eax
0x1401cdeff: mov    rsi,r15
0x1401cdf02: mov    r13d,ebx
0x1401cdf05: mov    edi,r13d
0x1401cdf08: lea    rbx,[rip+0x247df85]        # 0x14264be94
0x1401cdf0f: lea    r13,[rip+0x247df8a]        # 0x14264bea0
0x1401cdf16: data16 nop WORD PTR [rax+rax*1+0x0]
0x1401cdf20: mov    r8d,r14d
0x1401cdf23: mov    edx,edi
0x1401cdf25: lea    rcx,[rip+0x247c4c4]        # 0x14264a3f0
0x1401cdf2c: call   0x1400bb120
0x1401cdf31: cmp    rsi,r15
0x1401cdf34: jne    0x1401cdf3b
0x1401cdf36: mov    edx,DWORD PTR [rbx-0x18]
0x1401cdf39: jmp    0x1401cdf47
0x1401cdf3b: cmp    rsi,r12
0x1401cdf3e: jne    0x1401cdf44
0x1401cdf40: mov    edx,DWORD PTR [rbx]
0x1401cdf42: jmp    0x1401cdf47
0x1401cdf44: mov    edx,DWORD PTR [rbx-0xc]
0x1401cdf47: lea    rcx,[rip+0x247c4a2]        # 0x14264a3f0
0x1401cdf4e: call   0x140adaad0
0x1401cdf53: inc    edi
0x1401cdf55: add    rbx,0x4
0x1401cdf59: cmp    rbx,r13
0x1401cdf5c: jl     0x1401cdf20
0x1401cdf5e: inc    r14d
0x1401cdf61: inc    rsi
0x1401cdf64: cmp    r14d,DWORD PTR [rbp-0x60]
0x1401cdf68: mov    r13d,DWORD PTR [rbp-0x58]
0x1401cdf6c: jle    0x1401cdf05
0x1401cdf6e: mov    r13d,DWORD PTR [rbp-0x28]
0x1401cdf72: mov    ebx,DWORD PTR [rbp-0x58]
0x1401cdf75: xor    r8d,r8d
0x1401cdf78: mov    edx,0x7
0x1401cdf7d: mov    r9b,0x1
0x1401cdf80: lea    rcx,[rip+0x247c469]        # 0x14264a3f0
0x1401cdf87: call   0x1400bb130
0x1401cdf8c: lea    r8d,[r13+0x2]
0x1401cdf90: lea    edx,[rbx+0x1]
0x1401cdf93: lea    rcx,[rip+0x247c456]        # 0x14264a3f0
0x1401cdf9a: call   0x1400bb120
0x1401cdf9f: lea    rdx,[rip+0x143600a]        # 0x141603fb0  'Done assigning'
0x1401cdfa6: lea    rcx,[rbp+0x2e10]
0x1401cdfad: call   0x140068150
0x1401cdfb2: nop
0x1401cdfb3: xor    r9d,r9d
0x1401cdfb6: xor    r8d,r8d
0x1401cdfb9: lea    rdx,[rbp+0x2e10]
0x1401cdfc0: lea    rcx,[rip+0x247c429]        # 0x14264a3f0
0x1401cdfc7: call   0x140ad9960
0x1401cdfcc: nop
0x1401cdfcd: lea    rcx,[rbp+0x2e10]
0x1401cdfd4: jmp    0x1401ce16f
0x1401cdfd9: xor    r8d,r8d
0x1401cdfdc: mov    edx,0x7
0x1401cdfe1: mov    r9b,0x1
0x1401cdfe4: lea    rcx,[rip+0x247c405]        # 0x14264a3f0
0x1401cdfeb: call   0x1400bb130
0x1401cdff0: lea    edx,[rbx+0x1]
0x1401cdff3: lea    rcx,[rip+0x247c3f6]        # 0x14264a3f0
0x1401cdffa: cmp    BYTE PTR [rbp-0x80],0x0
0x1401cdffe: je     0x1401ce086
0x1401ce004: mov    r8d,r13d
0x1401ce007: call   0x1400bb120
0x1401ce00c: cmp    BYTE PTR [rbp-0x50],0x0
0x1401ce010: je     0x1401ce04c
0x1401ce012: lea    rdx,[rip+0x1435fa7]        # 0x141603fc0  'Choose a proposal.'
0x1401ce019: lea    rcx,[rbp+0x2e30]
0x1401ce020: call   0x140068150
0x1401ce025: nop
0x1401ce026: xor    r9d,r9d
0x1401ce029: xor    r8d,r8d
0x1401ce02c: lea    rdx,[rbp+0x2e30]
0x1401ce033: lea    rcx,[rip+0x247c3b6]        # 0x14264a3f0
0x1401ce03a: call   0x140ad9960
0x1401ce03f: nop
0x1401ce040: lea    rcx,[rbp+0x2e30]
0x1401ce047: jmp    0x1401ce16f
0x1401ce04c: lea    rdx,[rip+0x1435f85]        # 0x141603fd8  'Assign messengers.'
0x1401ce053: lea    rcx,[rbp+0x2e50]
0x1401ce05a: call   0x140068150
0x1401ce05f: nop
0x1401ce060: xor    r9d,r9d
0x1401ce063: xor    r8d,r8d
0x1401ce066: lea    rdx,[rbp+0x2e50]
0x1401ce06d: lea    rcx,[rip+0x247c37c]        # 0x14264a3f0
0x1401ce074: call   0x140ad9960
0x1401ce079: nop
0x1401ce07a: lea    rcx,[rbp+0x2e50]
0x1401ce081: jmp    0x1401ce16f
0x1401ce086: cmp    BYTE PTR [rbp-0x50],0x0
0x1401ce08a: je     0x1401ce0ce
0x1401ce08c: mov    r8d,r13d
0x1401ce08f: call   0x1400bb120
0x1401ce094: lea    rdx,[rip+0x1435f25]        # 0x141603fc0  'Choose a proposal.'
0x1401ce09b: lea    rcx,[rbp+0x2e70]
0x1401ce0a2: call   0x140068150
0x1401ce0a7: nop
0x1401ce0a8: xor    r9d,r9d
0x1401ce0ab: xor    r8d,r8d
0x1401ce0ae: lea    rdx,[rbp+0x2e70]
0x1401ce0b5: lea    rcx,[rip+0x247c334]        # 0x14264a3f0
0x1401ce0bc: call   0x140ad9960
0x1401ce0c1: nop
0x1401ce0c2: lea    rcx,[rbp+0x2e70]
0x1401ce0c9: jmp    0x1401ce16f
0x1401ce0ce: lea    r8d,[r13+0x2]
0x1401ce0d2: call   0x1400bb120
0x1401ce0d7: lea    rdx,[rip+0x1435f12]        # 0x141603ff0  'Assign squads.'
0x1401ce0de: lea    rcx,[rbp+0x2e90]
0x1401ce0e5: call   0x140068150
0x1401ce0ea: nop
0x1401ce0eb: xor    r9d,r9d
0x1401ce0ee: xor    r8d,r8d
0x1401ce0f1: lea    rdx,[rbp+0x2e90]
0x1401ce0f8: lea    rcx,[rip+0x247c2f1]        # 0x14264a3f0
0x1401ce0ff: call   0x140ad9960
0x1401ce104: nop
0x1401ce105: lea    rcx,[rbp+0x2e90]
0x1401ce10c: jmp    0x1401ce16f
0x1401ce10e: xor    r8d,r8d
0x1401ce111: mov    edx,0x6
0x1401ce116: mov    r9b,0x1
0x1401ce119: lea    rcx,[rip+0x247c2d0]        # 0x14264a3f0
0x1401ce120: call   0x1400bb130
0x1401ce125: lea    r8d,[r13+0x2]
0x1401ce129: mov    edx,0x1
0x1401ce12e: lea    rcx,[rip+0x247c2bb]        # 0x14264a3f0
0x1401ce135: call   0x1400bb120
0x1401ce13a: lea    rdx,[rip+0x1435e57]        # 0x141603f98  'No squads available'
0x1401ce141: lea    rcx,[rbp+0x2eb0]
0x1401ce148: call   0x140068150
0x1401ce14d: nop
0x1401ce14e: xor    r9d,r9d
0x1401ce151: xor    r8d,r8d
0x1401ce154: lea    rdx,[rbp+0x2eb0]
0x1401ce15b: lea    rcx,[rip+0x247c28e]        # 0x14264a3f0
0x1401ce162: call   0x140ad9960
0x1401ce167: nop
0x1401ce168: lea    rcx,[rbp+0x2eb0]
0x1401ce16f: call   0x140067e30
0x1401ce174: nop
0x1401ce175: lea    rcx,[rbp+0xd30]
0x1401ce17c: jmp    0x1401c605e
0x1401ce181: cmp    BYTE PTR [r13+0x8308],0x0
0x1401ce189: je     0x1401ce3d4
0x1401ce18f: mov    ebx,DWORD PTR [rbp-0x18]
0x1401ce192: mov    DWORD PTR [rbp-0x60],ebx
0x1401ce195: lea    esi,[rbx-0x39]
0x1401ce198: mov    r12d,0x14
0x1401ce19e: mov    eax,DWORD PTR [rip+0x21ff5e4]        # 0x1423cd788
0x1401ce1a4: cmp    eax,0x2e
0x1401ce1a7: jle    0x1401ce1c2
0x1401ce1a9: lea    r12d,[rax-0x1a]
0x1401ce1ad: cmp    r12d,0x1e
0x1401ce1b1: jle    0x1401ce1c2
0x1401ce1b3: mov    r12d,0x1e
0x1401ce1b9: mov    edi,ebx
0x1401ce1bb: xor    eax,eax
0x1401ce1bd: mov    r15d,eax
0x1401ce1c0: jmp    0x1401ce1d2
0x1401ce1c2: mov    edi,ebx
0x1401ce1c4: xor    eax,eax
0x1401ce1c6: mov    r15d,eax
0x1401ce1c9: test   r12d,r12d
0x1401ce1cc: js     0x1401ce2a1
0x1401ce1d2: mov    r14,rax
0x1401ce1d5: mov    ebx,esi
0x1401ce1d7: cmp    esi,edi
0x1401ce1d9: jg     0x1401ce28f
0x1401ce1df: movsxd r13,r12d
0x1401ce1e2: mov    r8d,ebx
0x1401ce1e5: mov    edx,r15d
0x1401ce1e8: lea    rcx,[rip+0x247c201]        # 0x14264a3f0
0x1401ce1ef: call   0x1400bb120
0x1401ce1f4: xor    r8d,r8d
0x1401ce1f7: xor    edx,edx
0x1401ce1f9: lea    rcx,[rip+0x247c1f0]        # 0x14264a3f0
0x1401ce200: call   0x1400bb190
0x1401ce205: test   r14,r14
0x1401ce208: jne    0x1401ce231
0x1401ce20a: cmp    ebx,esi
0x1401ce20c: jne    0x1401ce216
0x1401ce20e: mov    edx,DWORD PTR [rip+0x247db00]        # 0x14264bd14
0x1401ce214: jmp    0x1401ce279
0x1401ce216: lea    rcx,[rip+0x247c1d3]        # 0x14264a3f0
0x1401ce21d: cmp    ebx,edi
0x1401ce21f: jne    0x1401ce229
0x1401ce221: mov    edx,DWORD PTR [rip+0x247db05]        # 0x14264bd2c
0x1401ce227: jmp    0x1401ce280
0x1401ce229: mov    edx,DWORD PTR [rip+0x247daf1]        # 0x14264bd20
0x1401ce22f: jmp    0x1401ce280
0x1401ce231: cmp    r14,r13
0x1401ce234: jne    0x1401ce25d
0x1401ce236: cmp    ebx,esi
0x1401ce238: jne    0x1401ce242
0x1401ce23a: mov    edx,DWORD PTR [rip+0x247dadc]        # 0x14264bd1c
0x1401ce240: jmp    0x1401ce279
0x1401ce242: lea    rcx,[rip+0x247c1a7]        # 0x14264a3f0
0x1401ce249: cmp    ebx,edi
0x1401ce24b: jne    0x1401ce255
0x1401ce24d: mov    edx,DWORD PTR [rip+0x247dae1]        # 0x14264bd34
0x1401ce253: jmp    0x1401ce280
0x1401ce255: mov    edx,DWORD PTR [rip+0x247dacd]        # 0x14264bd28
0x1401ce25b: jmp    0x1401ce280
0x1401ce25d: cmp    ebx,esi
0x1401ce25f: jne    0x1401ce269
0x1401ce261: mov    edx,DWORD PTR [rip+0x247dab1]        # 0x14264bd18
0x1401ce267: jmp    0x1401ce279
0x1401ce269: cmp    ebx,edi
0x1401ce26b: mov    edx,DWORD PTR [rip+0x247dabf]        # 0x14264bd30
0x1401ce271: je     0x1401ce279
0x1401ce273: mov    edx,DWORD PTR [rip+0x247daab]        # 0x14264bd24
0x1401ce279: lea    rcx,[rip+0x247c170]        # 0x14264a3f0
0x1401ce280: call   0x140adaad0
0x1401ce285: inc    ebx
0x1401ce287: cmp    ebx,edi
0x1401ce289: jle    0x1401ce1e2
0x1401ce28f: inc    r15d
0x1401ce292: inc    r14
0x1401ce295: cmp    r15d,r12d
0x1401ce298: jle    0x1401ce1d5
0x1401ce29e: mov    ebx,DWORD PTR [rbp-0x60]
0x1401ce2a1: lea    r15d,[rsi+0x2]
0x1401ce2a5: lea    r13d,[rbx-0x2]
0x1401ce2a9: dec    r12d
0x1401ce2ac: mov    DWORD PTR [rbp-0x60],r12d
0x1401ce2b0: mov    r14,QWORD PTR [rsp+0x78]
0x1401ce2b5: lea    rcx,[r14+0x8310]
0x1401ce2bc: call   0x14006ee50
0x1401ce2c1: mov    rdi,rax
0x1401ce2c4: cmp    eax,r12d
0x1401ce2c7: jle    0x1401ce2cd
0x1401ce2c9: lea    r13d,[rbx-0x4]
0x1401ce2cd: test   edi,edi
0x1401ce2cf: jle    0x1401d286b
0x1401ce2d5: xor    r8d,r8d
0x1401ce2d8: mov    edx,0x7
0x1401ce2dd: xor    r9d,r9d
0x1401ce2e0: lea    rcx,[rip+0x247c109]        # 0x14264a3f0
0x1401ce2e7: call   0x1400bb130
0x1401ce2ec: mov    eax,DWORD PTR [r14+0x8328]
0x1401ce2f3: mov    ecx,edi
0x1401ce2f5: sub    ecx,r12d
0x1401ce2f8: cmp    eax,ecx
0x1401ce2fa: cmovle ecx,eax
0x1401ce2fd: xor    ebx,ebx
0x1401ce2ff: test   ecx,ecx
0x1401ce301: cmovns ebx,ecx
0x1401ce304: lea    esi,[rbx+r12*1]
0x1401ce308: cmp    ebx,esi
0x1401ce30a: jge    0x1401ce35a
0x1401ce30c: mov    r12d,0x1
0x1401ce312: sub    r12d,ebx
0x1401ce315: cmp    ebx,edi
0x1401ce317: jge    0x1401ce356
0x1401ce319: lea    edx,[rbx+r12*1]
0x1401ce31d: mov    r8d,r15d
0x1401ce320: lea    rcx,[rip+0x247c0c9]        # 0x14264a3f0
0x1401ce327: call   0x1400bb120
0x1401ce32c: movsxd rdx,ebx
0x1401ce32f: lea    rcx,[r14+0x8310]
0x1401ce336: call   0x14006f220
0x1401ce33b: xor    r9d,r9d
0x1401ce33e: xor    r8d,r8d
0x1401ce341: mov    rdx,QWORD PTR [rax]
0x1401ce344: lea    rcx,[rip+0x247c0a5]        # 0x14264a3f0
0x1401ce34b: call   0x140ad9960
0x1401ce350: inc    ebx
0x1401ce352: cmp    ebx,esi
0x1401ce354: jl     0x1401ce315
0x1401ce356: mov    r12d,DWORD PTR [rbp-0x60]
0x1401ce35a: cmp    edi,r12d
0x1401ce35d: jle    0x1401c6063
0x1401ce363: lea    ebx,[r12-0x1]
0x1401ce368: lea    rcx,[rbp+0x2f0]
0x1401ce36f: call   0x1400bb360
0x1401ce374: lea    r9d,[rdi-0x1]
0x1401ce378: mov    DWORD PTR [rsp+0x30],ebx
0x1401ce37c: mov    DWORD PTR [rsp+0x28],0x2
0x1401ce384: mov    DWORD PTR [rsp+0x20],r12d
0x1401ce389: xor    r8d,r8d
0x1401ce38c: mov    edx,DWORD PTR [r14+0x8328]
0x1401ce393: lea    rcx,[rbp+0x2f0]
0x1401ce39a: call   0x1400bb380
0x1401ce39f: lea    r9d,[r13+0x1]
0x1401ce3a3: mov    DWORD PTR [rsp+0x28],0x0
0x1401ce3ab: mov    r13,QWORD PTR [rsp+0x78]
0x1401ce3b0: movzx  eax,BYTE PTR [r13+0x832c]
0x1401ce3b8: mov    BYTE PTR [rsp+0x20],al
0x1401ce3bc: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401ce3c0: mov    edx,DWORD PTR [rbp-0x38]
0x1401ce3c3: lea    rcx,[rbp+0x2f0]
0x1401ce3ca: call   0x14140f4d0
0x1401ce3cf: jmp    0x1401c6068
0x1401ce3d4: cmp    BYTE PTR [rip+0x21c21fa],0x0        # 0x1423905d5
0x1401ce3db: je     0x1401c6068
0x1401ce3e1: lea    r8,[rbp+0x20]
0x1401ce3e5: lea    rdx,[rbp+0xe0]
0x1401ce3ec: lea    rcx,[rip+0x247bffd]        # 0x14264a3f0
0x1401ce3f3: call   0x1400bb340
0x1401ce3f8: lea    r8,[rbp+0xdc]
0x1401ce3ff: lea    rdx,[rbp+0xd4]
0x1401ce406: lea    rcx,[rip+0x247bfe3]        # 0x14264a3f0
0x1401ce40d: call   0x14014d5d0
0x1401ce412: xor    edx,edx
0x1401ce414: lea    rcx,[rip+0x21ff355]        # 0x1423cd770
0x1401ce41b: call   0x140071f90
0x1401ce420: test   al,al
0x1401ce422: je     0x1401ce463
0x1401ce424: mov    rax,QWORD PTR [rip+0x247c03d]        # 0x14264a468
0x1401ce42b: mov    ecx,DWORD PTR [rax+0x4]
0x1401ce42e: mov    r8d,DWORD PTR [rax+0x8]
0x1401ce432: sar    ecx,1
0x1401ce434: mov    eax,DWORD PTR [rbp+0xd4]
0x1401ce43a: cdq
0x1401ce43b: and    edx,0xf
0x1401ce43e: lea    r13d,[rdx+rax*1]
0x1401ce442: sar    r13d,0x4
0x1401ce446: sub    r13d,ecx
0x1401ce449: sar    r8d,1
0x1401ce44c: mov    eax,DWORD PTR [rbp+0xdc]
0x1401ce452: cdq
0x1401ce453: and    edx,0xf
0x1401ce456: lea    r14d,[rdx+rax*1]
0x1401ce45a: sar    r14d,0x4
0x1401ce45e: sub    r14d,r8d
0x1401ce461: jmp    0x1401ce484
0x1401ce463: mov    eax,DWORD PTR [rip+0x21ff31b]        # 0x1423cd784
0x1401ce469: sar    eax,1
0x1401ce46b: mov    r13d,DWORD PTR [rbp+0xe0]
0x1401ce472: sub    r13d,eax
0x1401ce475: mov    eax,DWORD PTR [rip+0x21ff30d]        # 0x1423cd788
0x1401ce47b: sar    eax,1
0x1401ce47d: mov    r14d,DWORD PTR [rbp+0x20]
0x1401ce481: sub    r14d,eax
0x1401ce484: mov    rcx,QWORD PTR [rsp+0x78]
0x1401ce489: add    r13d,DWORD PTR [rcx+0x198]
0x1401ce490: add    r14d,DWORD PTR [rcx+0x19c]
0x1401ce497: mov    DWORD PTR [rsp+0x74],r14d
0x1401ce49c: mov    DWORD PTR [rbp-0x68],r13d
0x1401ce4a0: test   r13d,r13d
0x1401ce4a3: js     0x1401c6063
0x1401ce4a9: mov    rax,QWORD PTR [rip+0x231d6a8]        # 0x1424ebb58
0x1401ce4b0: cmp    r13d,DWORD PTR [rax+0xa0]
0x1401ce4b7: jge    0x1401c6063
0x1401ce4bd: test   r14d,r14d
0x1401ce4c0: js     0x1401c6063
0x1401ce4c6: cmp    r14d,DWORD PTR [rax+0xa4]
0x1401ce4cd: jge    0x1401c6063
0x1401ce4d3: mov    r8d,r14d
0x1401ce4d6: mov    edx,r13d
0x1401ce4d9: call   0x1401d84f0
0x1401ce4de: mov    ebx,DWORD PTR [rbp-0x18]
0x1401ce4e1: mov    DWORD PTR [rbp-0x6c],ebx
0x1401ce4e4: lea    eax,[rbx-0x37]
0x1401ce4e7: mov    DWORD PTR [rbp-0x70],eax
0x1401ce4ea: lea    esi,[rax-0x2]
0x1401ce4ed: mov    r12d,0x14
0x1401ce4f3: mov    eax,DWORD PTR [rip+0x21ff28f]        # 0x1423cd788
0x1401ce4f9: cmp    eax,0x2e
0x1401ce4fc: jle    0x1401ce517
0x1401ce4fe: lea    r12d,[rax-0x1a]
0x1401ce502: cmp    r12d,0x1e
0x1401ce506: jle    0x1401ce517
0x1401ce508: mov    r12d,0x1e
0x1401ce50e: mov    edi,ebx
0x1401ce510: xor    eax,eax
0x1401ce512: mov    r15d,eax
0x1401ce515: jmp    0x1401ce527
0x1401ce517: mov    edi,ebx
0x1401ce519: xor    eax,eax
0x1401ce51b: mov    r15d,eax
0x1401ce51e: test   r12d,r12d
0x1401ce521: js     0x1401ce608
0x1401ce527: mov    r14,rax
0x1401ce52a: nop    WORD PTR [rax+rax*1+0x0]
0x1401ce530: mov    ebx,esi
0x1401ce532: cmp    esi,edi
0x1401ce534: jg     0x1401ce5ed
0x1401ce53a: movsxd r13,r12d
0x1401ce53d: nop    DWORD PTR [rax]
0x1401ce540: mov    r8d,ebx
0x1401ce543: mov    edx,r15d
0x1401ce546: lea    rcx,[rip+0x247bea3]        # 0x14264a3f0
0x1401ce54d: call   0x1400bb120
0x1401ce552: xor    r8d,r8d
0x1401ce555: xor    edx,edx
0x1401ce557: lea    rcx,[rip+0x247be92]        # 0x14264a3f0
0x1401ce55e: call   0x1400bb190
0x1401ce563: test   r14,r14
0x1401ce566: jne    0x1401ce58f
0x1401ce568: cmp    ebx,esi
0x1401ce56a: jne    0x1401ce574
0x1401ce56c: mov    edx,DWORD PTR [rip+0x247d7a2]        # 0x14264bd14
0x1401ce572: jmp    0x1401ce5d7
0x1401ce574: lea    rcx,[rip+0x247be75]        # 0x14264a3f0
0x1401ce57b: cmp    ebx,edi
0x1401ce57d: jne    0x1401ce587
0x1401ce57f: mov    edx,DWORD PTR [rip+0x247d7a7]        # 0x14264bd2c
0x1401ce585: jmp    0x1401ce5de
0x1401ce587: mov    edx,DWORD PTR [rip+0x247d793]        # 0x14264bd20
0x1401ce58d: jmp    0x1401ce5de
0x1401ce58f: cmp    r14,r13
0x1401ce592: jne    0x1401ce5bb
0x1401ce594: cmp    ebx,esi
0x1401ce596: jne    0x1401ce5a0
0x1401ce598: mov    edx,DWORD PTR [rip+0x247d77e]        # 0x14264bd1c
0x1401ce59e: jmp    0x1401ce5d7
0x1401ce5a0: lea    rcx,[rip+0x247be49]        # 0x14264a3f0
0x1401ce5a7: cmp    ebx,edi
0x1401ce5a9: jne    0x1401ce5b3
0x1401ce5ab: mov    edx,DWORD PTR [rip+0x247d783]        # 0x14264bd34
0x1401ce5b1: jmp    0x1401ce5de
0x1401ce5b3: mov    edx,DWORD PTR [rip+0x247d76f]        # 0x14264bd28
0x1401ce5b9: jmp    0x1401ce5de
0x1401ce5bb: cmp    ebx,esi
0x1401ce5bd: jne    0x1401ce5c7
0x1401ce5bf: mov    edx,DWORD PTR [rip+0x247d753]        # 0x14264bd18
0x1401ce5c5: jmp    0x1401ce5d7
0x1401ce5c7: cmp    ebx,edi
0x1401ce5c9: mov    edx,DWORD PTR [rip+0x247d761]        # 0x14264bd30
0x1401ce5cf: je     0x1401ce5d7
0x1401ce5d1: mov    edx,DWORD PTR [rip+0x247d74d]        # 0x14264bd24
0x1401ce5d7: lea    rcx,[rip+0x247be12]        # 0x14264a3f0
0x1401ce5de: call   0x140adaad0
0x1401ce5e3: inc    ebx
0x1401ce5e5: cmp    ebx,edi
0x1401ce5e7: jle    0x1401ce540
0x1401ce5ed: inc    r15d
0x1401ce5f0: inc    r14
0x1401ce5f3: cmp    r15d,r12d
0x1401ce5f6: jle    0x1401ce530
0x1401ce5fc: mov    r14d,DWORD PTR [rsp+0x74]
0x1401ce601: mov    r13d,DWORD PTR [rbp-0x68]
0x1401ce605: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401ce608: xor    r8d,r8d
0x1401ce60b: mov    edx,0x7
0x1401ce610: mov    r9b,0x1
0x1401ce613: lea    rcx,[rip+0x247bdd6]        # 0x14264a3f0
0x1401ce61a: call   0x1400bb130
0x1401ce61f: mov    edi,0x1
0x1401ce624: mov    DWORD PTR [rbp-0x48],edi
0x1401ce627: lea    rcx,[rbp+0x11f0]
0x1401ce62e: call   0x14006f690
0x1401ce633: nop
0x1401ce634: mov    r15d,DWORD PTR [rbp-0x70]
0x1401ce638: mov    r8d,r15d
0x1401ce63b: mov    edx,edi
0x1401ce63d: lea    rcx,[rip+0x247bdac]        # 0x14264a3f0
0x1401ce644: call   0x1400bb120
0x1401ce649: mov    r8d,r14d
0x1401ce64c: mov    edx,r13d
0x1401ce64f: mov    rcx,QWORD PTR [rip+0x231d502]        # 0x1424ebb58
0x1401ce656: call   0x1401bc260
0x1401ce65b: test   rax,rax
0x1401ce65e: je     0x1401ce715
0x1401ce664: xor    r9d,r9d
0x1401ce667: movzx  r8d,dil
0x1401ce66b: lea    rdx,[rbp+0x11f0]
0x1401ce672: mov    rcx,rax
0x1401ce675: call   0x140a946e0
0x1401ce67a: sub    ebx,esi
0x1401ce67c: lea    rcx,[rbp+0x11f0]
0x1401ce683: call   0x14006f330
0x1401ce688: lea    ecx,[rbx-0x7]
0x1401ce68b: movsxd rdx,ecx
0x1401ce68e: cmp    rax,rdx
0x1401ce691: jb     0x1401ce6fa
0x1401ce693: lea    edi,[rbx-0x8]
0x1401ce696: test   edi,edi
0x1401ce698: js     0x1401ce6b0
0x1401ce69a: movsxd rdx,ebx
0x1401ce69d: sub    rdx,0x8
0x1401ce6a1: xor    r8d,r8d
0x1401ce6a4: lea    rcx,[rbp+0x11f0]
0x1401ce6ab: call   0x1400e1230
0x1401ce6b0: cmp    edi,0x3
0x1401ce6b3: jle    0x1401ce6f5
0x1401ce6b5: movsxd rdx,ebx
0x1401ce6b8: sub    rdx,0xb
0x1401ce6bc: lea    rcx,[rbp+0x11f0]
0x1401ce6c3: call   0x1400fb540
0x1401ce6c8: mov    BYTE PTR [rax],0x2e
0x1401ce6cb: lea    eax,[rbx-0xa]
0x1401ce6ce: movsxd rdx,eax
0x1401ce6d1: lea    rcx,[rbp+0x11f0]
0x1401ce6d8: call   0x1400fb540
0x1401ce6dd: mov    BYTE PTR [rax],0x2e
0x1401ce6e0: lea    eax,[rbx-0x9]
0x1401ce6e3: movsxd rdx,eax
0x1401ce6e6: lea    rcx,[rbp+0x11f0]
0x1401ce6ed: call   0x1400fb540
0x1401ce6f2: mov    BYTE PTR [rax],0x2e
0x1401ce6f5: mov    edi,0x1
0x1401ce6fa: xor    r9d,r9d
0x1401ce6fd: xor    r8d,r8d
0x1401ce700: lea    rdx,[rbp+0x11f0]
0x1401ce707: lea    rcx,[rip+0x247bce2]        # 0x14264a3f0
0x1401ce70e: call   0x140ad9960
0x1401ce713: jmp    0x1401ce71a
0x1401ce715: xor    edi,edi
0x1401ce717: mov    DWORD PTR [rbp-0x48],edi
0x1401ce71a: lea    rcx,[rbp+0x11f0]
0x1401ce721: call   0x140067e30
0x1401ce726: lea    rcx,[rbp+0x1210]
0x1401ce72d: call   0x14006f690
0x1401ce732: nop
0x1401ce733: lea    edx,[rdi+0x1]
0x1401ce736: mov    r8d,r15d
0x1401ce739: lea    rcx,[rip+0x247bcb0]        # 0x14264a3f0
0x1401ce740: call   0x1400bb120
0x1401ce745: mov    r8d,r14d
0x1401ce748: mov    edx,r13d
0x1401ce74b: mov    rcx,QWORD PTR [rip+0x231d406]        # 0x1424ebb58
0x1401ce752: call   0x1401bc1f0
0x1401ce757: test   rax,rax
0x1401ce75a: je     0x1401ce810
0x1401ce760: xor    r9d,r9d
0x1401ce763: mov    r8b,0x1
0x1401ce766: lea    rdx,[rbp+0x1210]
0x1401ce76d: mov    rcx,rax
0x1401ce770: call   0x140a946e0
0x1401ce775: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401ce778: sub    ebx,esi
0x1401ce77a: lea    rcx,[rbp+0x1210]
0x1401ce781: call   0x14006f330
0x1401ce786: lea    ecx,[rbx-0x7]
0x1401ce789: movsxd rdx,ecx
0x1401ce78c: cmp    rax,rdx
0x1401ce78f: jb     0x1401ce7f6
0x1401ce791: lea    edi,[rbx-0x8]
0x1401ce794: test   edi,edi
0x1401ce796: js     0x1401ce7ae
0x1401ce798: movsxd rdx,ebx
0x1401ce79b: sub    rdx,0x8
0x1401ce79f: xor    r8d,r8d
0x1401ce7a2: lea    rcx,[rbp+0x1210]
0x1401ce7a9: call   0x1400e1230
0x1401ce7ae: cmp    edi,0x3
0x1401ce7b1: jle    0x1401ce7f3
0x1401ce7b3: movsxd rdx,ebx
0x1401ce7b6: sub    rdx,0xb
0x1401ce7ba: lea    rcx,[rbp+0x1210]
0x1401ce7c1: call   0x1400fb540
0x1401ce7c6: mov    BYTE PTR [rax],0x2e
0x1401ce7c9: lea    eax,[rbx-0xa]
0x1401ce7cc: movsxd rdx,eax
0x1401ce7cf: lea    rcx,[rbp+0x1210]
0x1401ce7d6: call   0x1400fb540
0x1401ce7db: mov    BYTE PTR [rax],0x2e
0x1401ce7de: lea    eax,[rbx-0x9]
0x1401ce7e1: movsxd rdx,eax
0x1401ce7e4: lea    rcx,[rbp+0x1210]
0x1401ce7eb: call   0x1400fb540
0x1401ce7f0: mov    BYTE PTR [rax],0x2e
0x1401ce7f3: mov    edi,DWORD PTR [rbp-0x48]
0x1401ce7f6: xor    r9d,r9d
0x1401ce7f9: xor    r8d,r8d
0x1401ce7fc: lea    rdx,[rbp+0x1210]
0x1401ce803: lea    rcx,[rip+0x247bbe6]        # 0x14264a3f0
0x1401ce80a: call   0x140ad9960
0x1401ce80f: nop
0x1401ce810: lea    rcx,[rbp+0x1210]
0x1401ce817: call   0x140067e30
0x1401ce81c: mov    rcx,QWORD PTR [rip+0x21cb9cd]        # 0x14239a1f0
0x1401ce823: movsx  eax,WORD PTR [rcx+0x82]
0x1401ce82a: cmp    r13d,eax
0x1401ce82d: jne    0x1401ce83f
0x1401ce82f: movsx  eax,WORD PTR [rcx+0x84]
0x1401ce836: cmp    r14d,eax
0x1401ce839: je     0x1401ce933
0x1401ce83f: cmp    edi,0x1
0x1401ce842: jne    0x1401ce933
0x1401ce848: lea    rcx,[rbp+0xf30]
0x1401ce84f: call   0x14006f690
0x1401ce854: nop
0x1401ce855: movzx  r8d,r14w
0x1401ce859: movzx  edx,r13w
0x1401ce85d: mov    rcx,QWORD PTR [rip+0x231d2f4]        # 0x1424ebb58
0x1401ce864: call   0x1401bc2d0
0x1401ce869: mov    ecx,eax
0x1401ce86b: cmp    eax,0x12
0x1401ce86e: jl     0x1401ce8a3
0x1401ce870: mov    eax,0x38e38e39
0x1401ce875: imul   ecx
0x1401ce877: mov    ecx,edx
0x1401ce879: sar    ecx,1
0x1401ce87b: mov    eax,ecx
0x1401ce87d: shr    eax,0x1f
0x1401ce880: add    ecx,eax
0x1401ce882: lea    rdx,[rbp+0xf30]
0x1401ce889: call   0x14052e360
0x1401ce88e: lea    rcx,[rbp+0xf30]
0x1401ce895: call   0x14052d650
0x1401ce89a: lea    rdx,[rip+0x1434c6f]        # 0x141603510  " days' travel"
0x1401ce8a1: jmp    0x1401ce8ed
0x1401ce8a3: cmp    ecx,0xb
0x1401ce8a6: jl     0x1401ce8b1
0x1401ce8a8: lea    rdx,[rip+0x1434c71]        # 0x141603520  "More than a day's travel"
0x1401ce8af: jmp    0x1401ce8ed
0x1401ce8b1: cmp    ecx,0x8
0x1401ce8b4: jl     0x1401ce8bf
0x1401ce8b6: lea    rdx,[rip+0x1434c83]        # 0x141603540  "A day's travel"
0x1401ce8bd: jmp    0x1401ce8ed
0x1401ce8bf: cmp    ecx,0x6
0x1401ce8c2: jl     0x1401ce8cd
0x1401ce8c4: lea    rdx,[rip+0x1434c85]        # 0x141603550  "Nearly a day's travel"
0x1401ce8cb: jmp    0x1401ce8ed
0x1401ce8cd: cmp    ecx,0x3
0x1401ce8d0: jl     0x1401ce8db
0x1401ce8d2: lea    rdx,[rip+0x1434c8f]        # 0x141603568  "A half day's travel"
0x1401ce8d9: jmp    0x1401ce8ed
0x1401ce8db: test   ecx,ecx
0x1401ce8dd: lea    rdx,[rip+0x1434c9c]        # 0x141603580  'A short trip'
0x1401ce8e4: jns    0x1401ce8ed
0x1401ce8e6: lea    rdx,[rip+0x1434ca3]        # 0x141603590  'Inaccessible from your location'
0x1401ce8ed: lea    rcx,[rbp+0xf30]
0x1401ce8f4: call   0x14006f560
0x1401ce8f9: mov    r8d,r15d
0x1401ce8fc: mov    edx,0x3
0x1401ce901: lea    rcx,[rip+0x247bae8]        # 0x14264a3f0
0x1401ce908: call   0x1400bb120
0x1401ce90d: xor    r9d,r9d
0x1401ce910: xor    r8d,r8d
0x1401ce913: lea    rdx,[rbp+0xf30]
0x1401ce91a: lea    rcx,[rip+0x247bacf]        # 0x14264a3f0
0x1401ce921: call   0x140ad9960
0x1401ce926: nop
0x1401ce927: lea    rcx,[rbp+0xf30]
0x1401ce92e: call   0x140067e30
0x1401ce933: mov    rbx,QWORD PTR [rsp+0x78]
0x1401ce938: cmp    QWORD PTR [rbx+0x1d8],0x0
0x1401ce940: je     0x1401cfa47
0x1401ce946: lea    rdx,[rip+0x141f06f]        # 0x1415ed9bc  'The '
0x1401ce94d: lea    rcx,[rbp+0xe70]
0x1401ce954: call   0x140068150
0x1401ce959: nop
0x1401ce95a: mov    r8d,r15d
0x1401ce95d: mov    edx,0x5
0x1401ce962: lea    rcx,[rip+0x247ba87]        # 0x14264a3f0
0x1401ce969: call   0x1400bb120
0x1401ce96e: lea    rcx,[rbp+0x1270]
0x1401ce975: call   0x14006f690
0x1401ce97a: nop
0x1401ce97b: lea    rdx,[rbp+0x1270]
0x1401ce982: mov    rcx,QWORD PTR [rbx+0x1d8]
0x1401ce989: call   0x1410cbe10
0x1401ce98e: lea    rcx,[rbp+0x1270]
0x1401ce995: call   0x14006f520
0x1401ce99a: test   al,al
0x1401ce99c: jne    0x1401ce9bf
0x1401ce99e: lea    rdx,[rbp+0x1270]
0x1401ce9a5: lea    rcx,[rbp+0xe70]
0x1401ce9ac: call   0x1400b9d10
0x1401ce9b1: mov    dl,0x20
0x1401ce9b3: lea    rcx,[rbp+0xe70]
0x1401ce9ba: call   0x1400b9d30
0x1401ce9bf: mov    rcx,QWORD PTR [rbx+0x1d8]
0x1401ce9c6: call   0x1410825c0
0x1401ce9cb: mov    rdi,rax
0x1401ce9ce: mov    rcx,QWORD PTR [rbx+0x1d8]
0x1401ce9d5: call   0x1409b4e70
0x1401ce9da: mov    r15,rax
0x1401ce9dd: mov    rcx,QWORD PTR [rbx+0x1d8]
0x1401ce9e4: cmp    WORD PTR [rcx+0x80],0xa
0x1401ce9ec: je     0x1401cea57
0x1401ce9ee: test   rdi,rdi
0x1401ce9f1: je     0x1401cea57
0x1401ce9f3: mov    ecx,DWORD PTR [rdi+0x9c]
0x1401ce9f9: shr    ecx,0xa
0x1401ce9fc: not    ecx
0x1401ce9fe: test   cl,0x1
0x1401cea01: je     0x1401cea57
0x1401cea03: lea    rcx,[rbp+0x1590]
0x1401cea0a: call   0x14006f690
0x1401cea0f: nop
0x1401cea10: mov    r8d,0xffffffff
0x1401cea16: lea    rdx,[rbp+0x1590]
0x1401cea1d: movzx  ecx,WORD PTR [rdi+0x98]
0x1401cea24: call   0x140aa3770
0x1401cea29: lea    rdx,[rbp+0x1590]
0x1401cea30: lea    rcx,[rbp+0xe70]
0x1401cea37: call   0x1400b9d10
0x1401cea3c: mov    dl,0x20
0x1401cea3e: lea    rcx,[rbp+0xe70]
0x1401cea45: call   0x1400b9d30
0x1401cea4a: nop
0x1401cea4b: lea    rcx,[rbp+0x1590]
0x1401cea52: call   0x140067e30
0x1401cea57: lea    rdx,[rbp+0x1270]
0x1401cea5e: mov    rcx,QWORD PTR [rbx+0x1d8]
0x1401cea65: call   0x1410cbe50
0x1401cea6a: lea    rdx,[rbp+0x1270]
0x1401cea71: lea    rcx,[rbp+0xe70]
0x1401cea78: call   0x1400b9d10
0x1401cea7d: lea    rdx,[rip+0x141ca94]        # 0x1415eb518  ' of '
0x1401cea84: lea    rcx,[rbp+0xe70]
0x1401cea8b: call   0x14006f560
0x1401cea90: xor    r9d,r9d
0x1401cea93: mov    r8b,0x1
0x1401cea96: lea    rdx,[rbp+0x1270]
0x1401cea9d: mov    rcx,QWORD PTR [rbx+0x1d8]
0x1401ceaa4: call   0x140a946e0
0x1401ceaa9: lea    rdx,[rbp+0x1270]
0x1401ceab0: lea    rcx,[rbp+0xe70]
0x1401ceab7: call   0x1400b9d10
0x1401ceabc: lea    rcx,[rbp+0xe70]
0x1401ceac3: call   0x14052d3c0
0x1401ceac8: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401ceacb: sub    ebx,esi
0x1401ceacd: lea    rcx,[rbp+0xe70]
0x1401cead4: call   0x14006f330
0x1401cead9: lea    ecx,[rbx-0x7]
0x1401ceadc: movsxd rdx,ecx
0x1401ceadf: cmp    rax,rdx
0x1401ceae2: jb     0x1401ceb49
0x1401ceae4: lea    eax,[rbx-0x8]
0x1401ceae7: test   eax,eax
0x1401ceae9: js     0x1401ceb04
0x1401ceaeb: movsxd rdx,ebx
0x1401ceaee: sub    rdx,0x8
0x1401ceaf2: xor    r8d,r8d
0x1401ceaf5: lea    rcx,[rbp+0xe70]
0x1401ceafc: call   0x1400e1230
0x1401ceb01: lea    eax,[rbx-0x8]
0x1401ceb04: cmp    eax,0x3
0x1401ceb07: jle    0x1401ceb49
0x1401ceb09: movsxd rdx,ebx
0x1401ceb0c: sub    rdx,0xb
0x1401ceb10: lea    rcx,[rbp+0xe70]
0x1401ceb17: call   0x1400fb540
0x1401ceb1c: mov    BYTE PTR [rax],0x2e
0x1401ceb1f: lea    eax,[rbx-0xa]
0x1401ceb22: movsxd rdx,eax
0x1401ceb25: lea    rcx,[rbp+0xe70]
0x1401ceb2c: call   0x1400fb540
0x1401ceb31: mov    BYTE PTR [rax],0x2e
0x1401ceb34: lea    eax,[rbx-0x9]
0x1401ceb37: movsxd rdx,eax
0x1401ceb3a: lea    rcx,[rbp+0xe70]
0x1401ceb41: call   0x1400fb540
0x1401ceb46: mov    BYTE PTR [rax],0x2e
0x1401ceb49: xor    r9d,r9d
0x1401ceb4c: xor    r8d,r8d
0x1401ceb4f: lea    rdx,[rbp+0xe70]
0x1401ceb56: lea    rcx,[rip+0x247b893]        # 0x14264a3f0
0x1401ceb5d: call   0x140ad9960
0x1401ceb62: mov    rax,QWORD PTR [rip+0x21cb687]        # 0x14239a1f0
0x1401ceb69: mov    rbx,QWORD PTR [rsp+0x78]
0x1401ceb6e: mov    r8d,DWORD PTR [rbp-0x70]
0x1401ceb72: mov    edx,0x6
0x1401ceb77: lea    rcx,[rip+0x247b872]        # 0x14264a3f0
0x1401ceb7e: cmp    QWORD PTR [rbx+0x1d8],rax
0x1401ceb85: jne    0x1401cebd4
0x1401ceb87: call   0x1400bb120
0x1401ceb8c: lea    rdx,[rip+0x1434a1d]        # 0x1416035b0  'Your location'
0x1401ceb93: lea    rcx,[rbp+0x2ef0]
0x1401ceb9a: call   0x140068150
0x1401ceb9f: nop
0x1401ceba0: xor    r9d,r9d
0x1401ceba3: xor    r8d,r8d
0x1401ceba6: lea    rdx,[rbp+0x2ef0]
0x1401cebad: lea    rcx,[rip+0x247b83c]        # 0x14264a3f0
0x1401cebb4: call   0x140ad9960
0x1401cebb9: nop
0x1401cebba: lea    rcx,[rbp+0x2ef0]
0x1401cebc1: call   0x140067e30
0x1401cebc6: test   r15,r15
0x1401cebc9: je     0x1401cf456
0x1401cebcf: jmp    0x1401cf303
0x1401cebd4: call   0x1400bb120
0x1401cebd9: test   r15,r15
0x1401cebdc: je     0x1401cf419
0x1401cebe2: mov    rcx,QWORD PTR [rbx+0x1d8]
0x1401cebe9: add    rcx,0x90
0x1401cebf0: call   0x14006f370
0x1401cebf5: mov    rbx,rax
0x1401cebf8: mov    rax,QWORD PTR [rsp+0x78]
0x1401cebfd: mov    rcx,QWORD PTR [rax+0x1d8]
0x1401cec04: add    rcx,0xd8
0x1401cec0b: lea    rdx,[rbp+0x60]
0x1401cec0f: call   0x14006f240
0x1401cec14: mov    rax,QWORD PTR [rsp+0x78]
0x1401cec19: mov    rcx,QWORD PTR [rax+0x1d8]
0x1401cec20: add    rcx,0xd8
0x1401cec27: lea    rdx,[rbp+0x180]
0x1401cec2e: call   0x14006f230
0x1401cec33: lea    r8,[rbp+0x180]
0x1401cec3a: lea    rdx,[rbp+0x12]
0x1401cec3e: lea    rcx,[rbp+0x60]
0x1401cec42: call   0x14006ee20
0x1401cec47: xor    edx,edx
0x1401cec49: movzx  ecx,BYTE PTR [rax]
0x1401cec4c: call   0x1400657b0
0x1401cec51: test   al,al
0x1401cec53: je     0x1401cecb1
0x1401cec55: lea    rcx,[rbp+0x60]
0x1401cec59: call   0x14006ee10
0x1401cec5e: mov    rcx,QWORD PTR [rax]
0x1401cec61: cmp    DWORD PTR [rcx],0x0
0x1401cec64: jle    0x1401cec86
0x1401cec66: lea    rcx,[rbp+0x60]
0x1401cec6a: call   0x14006ee10
0x1401cec6f: mov    rcx,QWORD PTR [rax]
0x1401cec72: cmp    DWORD PTR [rcx+0x18],0xffffffff
0x1401cec76: jne    0x1401cec86
0x1401cec78: lea    rcx,[rbp+0x60]
0x1401cec7c: call   0x14006ee10
0x1401cec81: mov    rcx,QWORD PTR [rax]
0x1401cec84: add    ebx,DWORD PTR [rcx]
0x1401cec86: lea    rcx,[rbp+0x60]
0x1401cec8a: call   0x14006ee00
0x1401cec8f: lea    r8,[rbp+0x180]
0x1401cec96: lea    rdx,[rbp+0x12]
0x1401cec9a: lea    rcx,[rbp+0x60]
0x1401cec9e: call   0x14006ee20
0x1401ceca3: xor    edx,edx
0x1401ceca5: movzx  ecx,BYTE PTR [rax]
0x1401ceca8: call   0x1400657b0
0x1401cecad: test   al,al
0x1401cecaf: jne    0x1401cec55
0x1401cecb1: cmp    ebx,0x30d4
0x1401cecb7: jl     0x1401cecf6
0x1401cecb9: lea    rdx,[rip+0x1434900]        # 0x1416035c0  'Population: >10000'
0x1401cecc0: lea    rcx,[rbp+0x2f10]
0x1401cecc7: call   0x140068150
0x1401ceccc: nop
0x1401ceccd: mov    r9d,0x35
0x1401cecd3: xor    r8d,r8d
0x1401cecd6: lea    rdx,[rbp+0x2f10]
0x1401cecdd: lea    rcx,[rip+0x247b70c]        # 0x14264a3f0
0x1401cece4: call   0x140ad9960
0x1401cece9: nop
0x1401cecea: lea    rcx,[rbp+0x2f10]
0x1401cecf1: jmp    0x1401cf2fe
0x1401cecf6: cmp    ebx,0x2134
0x1401cecfc: jl     0x1401ced3b
0x1401cecfe: lea    rdx,[rip+0x14348d3]        # 0x1416035d8  'Population: ~10000'
0x1401ced05: lea    rcx,[rbp+0x2f30]
0x1401ced0c: call   0x140068150
0x1401ced11: nop
0x1401ced12: mov    r9d,0x35
0x1401ced18: xor    r8d,r8d
0x1401ced1b: lea    rdx,[rbp+0x2f30]
0x1401ced22: lea    rcx,[rip+0x247b6c7]        # 0x14264a3f0
0x1401ced29: call   0x140ad9960
0x1401ced2e: nop
0x1401ced2f: lea    rcx,[rbp+0x2f30]
0x1401ced36: jmp    0x1401cf2fe
0x1401ced3b: cmp    ebx,0x1964
0x1401ced41: jl     0x1401ced80
0x1401ced43: lea    rdx,[rip+0x14348a6]        # 0x1416035f0  'Population: ~7500'
0x1401ced4a: lea    rcx,[rbp+0x2f50]
0x1401ced51: call   0x140068150
0x1401ced56: nop
0x1401ced57: mov    r9d,0x35
0x1401ced5d: xor    r8d,r8d
0x1401ced60: lea    rdx,[rbp+0x2f50]
0x1401ced67: lea    rcx,[rip+0x247b682]        # 0x14264a3f0
0x1401ced6e: call   0x140ad9960
0x1401ced73: nop
0x1401ced74: lea    rcx,[rbp+0x2f50]
0x1401ced7b: jmp    0x1401cf2fe
0x1401ced80: cmp    ebx,0x157c
0x1401ced86: jl     0x1401cedc5
0x1401ced88: lea    rdx,[rip+0x1434879]        # 0x141603608  'Population: ~6000'
0x1401ced8f: lea    rcx,[rbp+0x2f70]
0x1401ced96: call   0x140068150
0x1401ced9b: nop
0x1401ced9c: mov    r9d,0x35
0x1401ceda2: xor    r8d,r8d
0x1401ceda5: lea    rdx,[rbp+0x2f70]
0x1401cedac: lea    rcx,[rip+0x247b63d]        # 0x14264a3f0
0x1401cedb3: call   0x140ad9960
0x1401cedb8: nop
0x1401cedb9: lea    rcx,[rbp+0x2f70]
0x1401cedc0: jmp    0x1401cf2fe
0x1401cedc5: cmp    ebx,0x1194
0x1401cedcb: jl     0x1401cee0a
0x1401cedcd: lea    rdx,[rip+0x143484c]        # 0x141603620  'Population: ~5000'
0x1401cedd4: lea    rcx,[rbp+0x2f90]
0x1401ceddb: call   0x140068150
0x1401cede0: nop
0x1401cede1: mov    r9d,0x35
0x1401cede7: xor    r8d,r8d
0x1401cedea: lea    rdx,[rbp+0x2f90]
0x1401cedf1: lea    rcx,[rip+0x247b5f8]        # 0x14264a3f0
0x1401cedf8: call   0x140ad9960
0x1401cedfd: nop
0x1401cedfe: lea    rcx,[rbp+0x2f90]
0x1401cee05: jmp    0x1401cf2fe
0x1401cee0a: cmp    ebx,0xdac
0x1401cee10: jl     0x1401cee4f
0x1401cee12: lea    rdx,[rip+0x143481f]        # 0x141603638  'Population: ~4000'
0x1401cee19: lea    rcx,[rbp+0x2fb0]
0x1401cee20: call   0x140068150
0x1401cee25: nop
0x1401cee26: mov    r9d,0x35
0x1401cee2c: xor    r8d,r8d
0x1401cee2f: lea    rdx,[rbp+0x2fb0]
0x1401cee36: lea    rcx,[rip+0x247b5b3]        # 0x14264a3f0
0x1401cee3d: call   0x140ad9960
0x1401cee42: nop
0x1401cee43: lea    rcx,[rbp+0x2fb0]
0x1401cee4a: jmp    0x1401cf2fe
0x1401cee4f: cmp    ebx,0x9c4
0x1401cee55: jl     0x1401cee94
0x1401cee57: lea    rdx,[rip+0x14347f2]        # 0x141603650  'Population: ~3000'
0x1401cee5e: lea    rcx,[rbp+0x2fd0]
0x1401cee65: call   0x140068150
0x1401cee6a: nop
0x1401cee6b: mov    r9d,0x35
0x1401cee71: xor    r8d,r8d
0x1401cee74: lea    rdx,[rbp+0x2fd0]
0x1401cee7b: lea    rcx,[rip+0x247b56e]        # 0x14264a3f0
0x1401cee82: call   0x140ad9960
0x1401cee87: nop
0x1401cee88: lea    rcx,[rbp+0x2fd0]
0x1401cee8f: jmp    0x1401cf2fe
0x1401cee94: cmp    ebx,0x5dc
0x1401cee9a: jl     0x1401ceed9
0x1401cee9c: lea    rdx,[rip+0x14347c5]        # 0x141603668  'Population: ~2000'
0x1401ceea3: lea    rcx,[rbp+0x2ff0]
0x1401ceeaa: call   0x140068150
0x1401ceeaf: nop
0x1401ceeb0: mov    r9d,0x35
0x1401ceeb6: xor    r8d,r8d
0x1401ceeb9: lea    rdx,[rbp+0x2ff0]
0x1401ceec0: lea    rcx,[rip+0x247b529]        # 0x14264a3f0
0x1401ceec7: call   0x140ad9960
0x1401ceecc: nop
0x1401ceecd: lea    rcx,[rbp+0x2ff0]
0x1401ceed4: jmp    0x1401cf2fe
0x1401ceed9: cmp    ebx,0x352
0x1401ceedf: jl     0x1401cef1e
0x1401ceee1: lea    rdx,[rip+0x14348d0]        # 0x1416037b8  'Population: ~1000'
0x1401ceee8: lea    rcx,[rbp+0x3010]
0x1401ceeef: call   0x140068150
0x1401ceef4: nop
0x1401ceef5: mov    r9d,0x35
0x1401ceefb: xor    r8d,r8d
0x1401ceefe: lea    rdx,[rbp+0x3010]
0x1401cef05: lea    rcx,[rip+0x247b4e4]        # 0x14264a3f0
0x1401cef0c: call   0x140ad9960
0x1401cef11: nop
0x1401cef12: lea    rcx,[rbp+0x3010]
0x1401cef19: jmp    0x1401cf2fe
0x1401cef1e: cmp    ebx,0x28a
0x1401cef24: jl     0x1401cef63
0x1401cef26: lea    rdx,[rip+0x14348a3]        # 0x1416037d0  'Population: ~750'
0x1401cef2d: lea    rcx,[rbp+0x3030]
0x1401cef34: call   0x140068150
0x1401cef39: nop
0x1401cef3a: mov    r9d,0x35
0x1401cef40: xor    r8d,r8d
0x1401cef43: lea    rdx,[rbp+0x3030]
0x1401cef4a: lea    rcx,[rip+0x247b49f]        # 0x14264a3f0
0x1401cef51: call   0x140ad9960
0x1401cef56: nop
0x1401cef57: lea    rcx,[rbp+0x3030]
0x1401cef5e: jmp    0x1401cf2fe
0x1401cef63: cmp    ebx,0x226
0x1401cef69: jl     0x1401cefa8
0x1401cef6b: lea    rdx,[rip+0x1434876]        # 0x1416037e8  'Population: ~600'
0x1401cef72: lea    rcx,[rbp+0x3050]
0x1401cef79: call   0x140068150
0x1401cef7e: nop
0x1401cef7f: mov    r9d,0x35
0x1401cef85: xor    r8d,r8d
0x1401cef88: lea    rdx,[rbp+0x3050]
0x1401cef8f: lea    rcx,[rip+0x247b45a]        # 0x14264a3f0
0x1401cef96: call   0x140ad9960
0x1401cef9b: nop
0x1401cef9c: lea    rcx,[rbp+0x3050]
0x1401cefa3: jmp    0x1401cf2fe
0x1401cefa8: cmp    ebx,0x1c2
0x1401cefae: jl     0x1401cefed
0x1401cefb0: lea    rdx,[rip+0x1434849]        # 0x141603800  'Population: ~500'
0x1401cefb7: lea    rcx,[rbp+0x3070]
0x1401cefbe: call   0x140068150
0x1401cefc3: nop
0x1401cefc4: mov    r9d,0x35
0x1401cefca: xor    r8d,r8d
0x1401cefcd: lea    rdx,[rbp+0x3070]
0x1401cefd4: lea    rcx,[rip+0x247b415]        # 0x14264a3f0
0x1401cefdb: call   0x140ad9960
0x1401cefe0: nop
0x1401cefe1: lea    rcx,[rbp+0x3070]
0x1401cefe8: jmp    0x1401cf2fe
0x1401cefed: cmp    ebx,0x15e
0x1401ceff3: jl     0x1401cf032
0x1401ceff5: lea    rdx,[rip+0x143481c]        # 0x141603818  'Population: ~400'
0x1401ceffc: lea    rcx,[rbp+0x3090]
0x1401cf003: call   0x140068150
0x1401cf008: nop
0x1401cf009: mov    r9d,0x35
0x1401cf00f: xor    r8d,r8d
0x1401cf012: lea    rdx,[rbp+0x3090]
0x1401cf019: lea    rcx,[rip+0x247b3d0]        # 0x14264a3f0
0x1401cf020: call   0x140ad9960
0x1401cf025: nop
0x1401cf026: lea    rcx,[rbp+0x3090]
0x1401cf02d: jmp    0x1401cf2fe
0x1401cf032: cmp    ebx,0xfa
0x1401cf038: jl     0x1401cf077
0x1401cf03a: lea    rdx,[rip+0x14347ef]        # 0x141603830  'Population: ~300'
0x1401cf041: lea    rcx,[rbp+0x30b0]
0x1401cf048: call   0x140068150
0x1401cf04d: nop
0x1401cf04e: mov    r9d,0x35
0x1401cf054: xor    r8d,r8d
0x1401cf057: lea    rdx,[rbp+0x30b0]
0x1401cf05e: lea    rcx,[rip+0x247b38b]        # 0x14264a3f0
0x1401cf065: call   0x140ad9960
0x1401cf06a: nop
0x1401cf06b: lea    rcx,[rbp+0x30b0]
0x1401cf072: jmp    0x1401cf2fe
0x1401cf077: cmp    ebx,0x96
0x1401cf07d: jl     0x1401cf0bc
0x1401cf07f: lea    rdx,[rip+0x14347c2]        # 0x141603848  'Population: ~200'
0x1401cf086: lea    rcx,[rbp+0x30d0]
0x1401cf08d: call   0x140068150
0x1401cf092: nop
0x1401cf093: mov    r9d,0x35
0x1401cf099: xor    r8d,r8d
0x1401cf09c: lea    rdx,[rbp+0x30d0]
0x1401cf0a3: lea    rcx,[rip+0x247b346]        # 0x14264a3f0
0x1401cf0aa: call   0x140ad9960
0x1401cf0af: nop
0x1401cf0b0: lea    rcx,[rbp+0x30d0]
0x1401cf0b7: jmp    0x1401cf2fe
0x1401cf0bc: cmp    ebx,0x55
0x1401cf0bf: jl     0x1401cf0fe
0x1401cf0c1: lea    rdx,[rip+0x1434798]        # 0x141603860  'Population: ~100'
0x1401cf0c8: lea    rcx,[rbp+0x30f0]
0x1401cf0cf: call   0x140068150
0x1401cf0d4: nop
0x1401cf0d5: mov    r9d,0x35
0x1401cf0db: xor    r8d,r8d
0x1401cf0de: lea    rdx,[rbp+0x30f0]
0x1401cf0e5: lea    rcx,[rip+0x247b304]        # 0x14264a3f0
0x1401cf0ec: call   0x140ad9960
0x1401cf0f1: nop
0x1401cf0f2: lea    rcx,[rbp+0x30f0]
0x1401cf0f9: jmp    0x1401cf2fe
0x1401cf0fe: cmp    ebx,0x41
0x1401cf101: jl     0x1401cf140
0x1401cf103: lea    rdx,[rip+0x143476e]        # 0x141603878  'Population: ~75'
0x1401cf10a: lea    rcx,[rbp+0x3110]
0x1401cf111: call   0x140068150
0x1401cf116: nop
0x1401cf117: mov    r9d,0x35
0x1401cf11d: xor    r8d,r8d
0x1401cf120: lea    rdx,[rbp+0x3110]
0x1401cf127: lea    rcx,[rip+0x247b2c2]        # 0x14264a3f0
0x1401cf12e: call   0x140ad9960
0x1401cf133: nop
0x1401cf134: lea    rcx,[rbp+0x3110]
0x1401cf13b: jmp    0x1401cf2fe
0x1401cf140: cmp    ebx,0x37
0x1401cf143: jl     0x1401cf182
0x1401cf145: lea    rdx,[rip+0x143473c]        # 0x141603888  'Population: ~60'
0x1401cf14c: lea    rcx,[rbp+0x3130]
0x1401cf153: call   0x140068150
0x1401cf158: nop
0x1401cf159: mov    r9d,0x35
0x1401cf15f: xor    r8d,r8d
0x1401cf162: lea    rdx,[rbp+0x3130]
0x1401cf169: lea    rcx,[rip+0x247b280]        # 0x14264a3f0
0x1401cf170: call   0x140ad9960
0x1401cf175: nop
0x1401cf176: lea    rcx,[rbp+0x3130]
0x1401cf17d: jmp    0x1401cf2fe
0x1401cf182: cmp    ebx,0x2d
0x1401cf185: jl     0x1401cf1c4
0x1401cf187: lea    rdx,[rip+0x143470a]        # 0x141603898  'Population: ~50'
0x1401cf18e: lea    rcx,[rbp+0x3890]
0x1401cf195: call   0x140068150
0x1401cf19a: nop
0x1401cf19b: mov    r9d,0x35
0x1401cf1a1: xor    r8d,r8d
0x1401cf1a4: lea    rdx,[rbp+0x3890]
0x1401cf1ab: lea    rcx,[rip+0x247b23e]        # 0x14264a3f0
0x1401cf1b2: call   0x140ad9960
0x1401cf1b7: nop
0x1401cf1b8: lea    rcx,[rbp+0x3890]
0x1401cf1bf: jmp    0x1401cf2fe
0x1401cf1c4: cmp    ebx,0x23
0x1401cf1c7: jl     0x1401cf206
0x1401cf1c9: lea    rdx,[rip+0x14346d8]        # 0x1416038a8  'Population: ~40'
0x1401cf1d0: lea    rcx,[rbp+0x3170]
0x1401cf1d7: call   0x140068150
0x1401cf1dc: nop
0x1401cf1dd: mov    r9d,0x35
0x1401cf1e3: xor    r8d,r8d
0x1401cf1e6: lea    rdx,[rbp+0x3170]
0x1401cf1ed: lea    rcx,[rip+0x247b1fc]        # 0x14264a3f0
0x1401cf1f4: call   0x140ad9960
0x1401cf1f9: nop
0x1401cf1fa: lea    rcx,[rbp+0x3170]
0x1401cf201: jmp    0x1401cf2fe
0x1401cf206: cmp    ebx,0x19
0x1401cf209: jl     0x1401cf248
0x1401cf20b: lea    rdx,[rip+0x14346a6]        # 0x1416038b8  'Population: ~30'
0x1401cf212: lea    rcx,[rbp+0x3190]
0x1401cf219: call   0x140068150
0x1401cf21e: nop
0x1401cf21f: mov    r9d,0x35
0x1401cf225: xor    r8d,r8d
0x1401cf228: lea    rdx,[rbp+0x3190]
0x1401cf22f: lea    rcx,[rip+0x247b1ba]        # 0x14264a3f0
0x1401cf236: call   0x140ad9960
0x1401cf23b: nop
0x1401cf23c: lea    rcx,[rbp+0x3190]
0x1401cf243: jmp    0x1401cf2fe
0x1401cf248: cmp    ebx,0xf
0x1401cf24b: jl     0x1401cf287
0x1401cf24d: lea    rdx,[rip+0x1434674]        # 0x1416038c8  'Population: ~20'
0x1401cf254: lea    rcx,[rbp+0x31b0]
0x1401cf25b: call   0x140068150
0x1401cf260: nop
0x1401cf261: mov    r9d,0x35
0x1401cf267: xor    r8d,r8d
0x1401cf26a: lea    rdx,[rbp+0x31b0]
0x1401cf271: lea    rcx,[rip+0x247b178]        # 0x14264a3f0
0x1401cf278: call   0x140ad9960
0x1401cf27d: nop
0x1401cf27e: lea    rcx,[rbp+0x31b0]
0x1401cf285: jmp    0x1401cf2fe
0x1401cf287: cmp    ebx,0x7
0x1401cf28a: jl     0x1401cf2c6
0x1401cf28c: lea    rdx,[rip+0x1434645]        # 0x1416038d8  'Population: ~10'
0x1401cf293: lea    rcx,[rbp+0x31d0]
0x1401cf29a: call   0x140068150
0x1401cf29f: nop
0x1401cf2a0: mov    r9d,0x35
0x1401cf2a6: xor    r8d,r8d
0x1401cf2a9: lea    rdx,[rbp+0x31d0]
0x1401cf2b0: lea    rcx,[rip+0x247b139]        # 0x14264a3f0
0x1401cf2b7: call   0x140ad9960
0x1401cf2bc: nop
0x1401cf2bd: lea    rcx,[rbp+0x31d0]
0x1401cf2c4: jmp    0x1401cf2fe
0x1401cf2c6: lea    rdx,[rip+0x143461b]        # 0x1416038e8  'Population: <10'
0x1401cf2cd: lea    rcx,[rbp+0x31f0]
0x1401cf2d4: call   0x140068150
0x1401cf2d9: nop
0x1401cf2da: mov    r9d,0x35
0x1401cf2e0: xor    r8d,r8d
0x1401cf2e3: lea    rdx,[rbp+0x31f0]
0x1401cf2ea: lea    rcx,[rip+0x247b0ff]        # 0x14264a3f0
0x1401cf2f1: call   0x140ad9960
0x1401cf2f6: nop
0x1401cf2f7: lea    rcx,[rbp+0x31f0]
0x1401cf2fe: call   0x140067e30
0x1401cf303: lea    rcx,[rbp+0x15b0]
0x1401cf30a: call   0x14006f690
0x1401cf30f: nop
0x1401cf310: lea    rcx,[r15+0x20]
0x1401cf314: xor    r9d,r9d
0x1401cf317: mov    r8b,0x1
0x1401cf31a: lea    rdx,[rbp+0x15b0]
0x1401cf321: call   0x140a946e0
0x1401cf326: mov    r8d,DWORD PTR [rbp-0x70]
0x1401cf32a: mov    edx,0x7
0x1401cf32f: lea    rcx,[rip+0x247b0ba]        # 0x14264a3f0
0x1401cf336: call   0x1400bb120
0x1401cf33b: lea    rdx,[rip+0x1434356]        # 0x141603698  'Site government: '
0x1401cf342: lea    rcx,[rbp+0x1230]
0x1401cf349: call   0x140068150
0x1401cf34e: nop
0x1401cf34f: lea    rdx,[rbp+0x15b0]
0x1401cf356: lea    rcx,[rbp+0x1230]
0x1401cf35d: call   0x1400b9d10
0x1401cf362: lea    rcx,[rbp+0x1230]
0x1401cf369: call   0x14006f330
0x1401cf36e: mov    edx,DWORD PTR [rbp-0x6c]
0x1401cf371: mov    ecx,edx
0x1401cf373: sub    ecx,esi
0x1401cf375: sub    ecx,0x7
0x1401cf378: movsxd rcx,ecx
0x1401cf37b: cmp    rax,rcx
0x1401cf37e: jb     0x1401cf3e9
0x1401cf380: mov    ebx,edx
0x1401cf382: sub    ebx,esi
0x1401cf384: lea    eax,[rbx-0x8]
0x1401cf387: test   eax,eax
0x1401cf389: js     0x1401cf3a4
0x1401cf38b: movsxd rdx,ebx
0x1401cf38e: sub    rdx,0x8
0x1401cf392: xor    r8d,r8d
0x1401cf395: lea    rcx,[rbp+0x1230]
0x1401cf39c: call   0x1400e1230
0x1401cf3a1: lea    eax,[rbx-0x8]
0x1401cf3a4: cmp    eax,0x3
0x1401cf3a7: jle    0x1401cf3e9
0x1401cf3a9: movsxd rdx,ebx
0x1401cf3ac: sub    rdx,0xb
0x1401cf3b0: lea    rcx,[rbp+0x1230]
0x1401cf3b7: call   0x1400fb540
0x1401cf3bc: mov    BYTE PTR [rax],0x2e
0x1401cf3bf: lea    eax,[rbx-0xa]
0x1401cf3c2: movsxd rdx,eax
0x1401cf3c5: lea    rcx,[rbp+0x1230]
0x1401cf3cc: call   0x1400fb540
0x1401cf3d1: mov    BYTE PTR [rax],0x2e
0x1401cf3d4: lea    eax,[rbx-0x9]
0x1401cf3d7: movsxd rdx,eax
0x1401cf3da: lea    rcx,[rbp+0x1230]
0x1401cf3e1: call   0x1400fb540
0x1401cf3e6: mov    BYTE PTR [rax],0x2e
0x1401cf3e9: xor    r9d,r9d
0x1401cf3ec: xor    r8d,r8d
0x1401cf3ef: lea    rdx,[rbp+0x1230]
0x1401cf3f6: lea    rcx,[rip+0x247aff3]        # 0x14264a3f0
0x1401cf3fd: call   0x140ad9960
0x1401cf402: nop
0x1401cf403: lea    rcx,[rbp+0x1230]
0x1401cf40a: call   0x140067e30
0x1401cf40f: nop
0x1401cf410: lea    rcx,[rbp+0x15b0]
0x1401cf417: jmp    0x1401cf451
0x1401cf419: lea    rdx,[rip+0x1434260]        # 0x141603680  'No civilized population'
0x1401cf420: lea    rcx,[rbp+0x3210]
0x1401cf427: call   0x140068150
0x1401cf42c: nop
0x1401cf42d: mov    r9d,0x35
0x1401cf433: xor    r8d,r8d
0x1401cf436: lea    rdx,[rbp+0x3210]
0x1401cf43d: lea    rcx,[rip+0x247afac]        # 0x14264a3f0
0x1401cf444: call   0x140ad9960
0x1401cf449: nop
0x1401cf44a: lea    rcx,[rbp+0x3210]
0x1401cf451: call   0x140067e30
0x1401cf456: test   rdi,rdi
0x1401cf459: je     0x1401cf57c
0x1401cf45f: cmp    rdi,r15
0x1401cf462: je     0x1401cf57c
0x1401cf468: lea    rcx,[rbp+0x15d0]
0x1401cf46f: call   0x14006f690
0x1401cf474: nop
0x1401cf475: lea    rcx,[rdi+0x20]
0x1401cf479: xor    r9d,r9d
0x1401cf47c: mov    r8b,0x1
0x1401cf47f: lea    rdx,[rbp+0x15d0]
0x1401cf486: call   0x140a946e0
0x1401cf48b: mov    r8d,DWORD PTR [rbp-0x70]
0x1401cf48f: mov    edx,0x8
0x1401cf494: lea    rcx,[rip+0x247af55]        # 0x14264a3f0
0x1401cf49b: call   0x1400bb120
0x1401cf4a0: lea    rdx,[rip+0x1434209]        # 0x1416036b0  'Civilization: '
0x1401cf4a7: lea    rcx,[rbp+0x1250]
0x1401cf4ae: call   0x140068150
0x1401cf4b3: nop
0x1401cf4b4: lea    rdx,[rbp+0x15d0]
0x1401cf4bb: lea    rcx,[rbp+0x1250]
0x1401cf4c2: call   0x1400b9d10
0x1401cf4c7: lea    rcx,[rbp+0x1250]
0x1401cf4ce: call   0x14006f330
0x1401cf4d3: mov    ebx,DWORD PTR [rbp-0x6c]
0x1401cf4d6: mov    ecx,ebx
0x1401cf4d8: sub    ecx,esi
0x1401cf4da: sub    ecx,0x7
0x1401cf4dd: movsxd rcx,ecx
0x1401cf4e0: cmp    rax,rcx
0x1401cf4e3: jb     0x1401cf549
0x1401cf4e5: sub    ebx,esi
0x1401cf4e7: lea    esi,[rbx-0x8]
0x1401cf4ea: test   esi,esi
0x1401cf4ec: js     0x1401cf504
0x1401cf4ee: movsxd rdx,ebx
0x1401cf4f1: sub    rdx,0x8
0x1401cf4f5: xor    r8d,r8d
0x1401cf4f8: lea    rcx,[rbp+0x1250]
0x1401cf4ff: call   0x1400e1230
0x1401cf504: cmp    esi,0x3
0x1401cf507: jle    0x1401cf549
0x1401cf509: movsxd rdx,ebx
0x1401cf50c: sub    rdx,0xb
0x1401cf510: lea    rcx,[rbp+0x1250]
0x1401cf517: call   0x1400fb540
0x1401cf51c: mov    BYTE PTR [rax],0x2e
0x1401cf51f: lea    eax,[rbx-0xa]
0x1401cf522: movsxd rdx,eax
0x1401cf525: lea    rcx,[rbp+0x1250]
0x1401cf52c: call   0x1400fb540
0x1401cf531: mov    BYTE PTR [rax],0x2e
0x1401cf534: lea    eax,[rbx-0x9]
0x1401cf537: movsxd rdx,eax
0x1401cf53a: lea    rcx,[rbp+0x1250]
0x1401cf541: call   0x1400fb540
0x1401cf546: mov    BYTE PTR [rax],0x2e
0x1401cf549: xor    r9d,r9d
0x1401cf54c: xor    r8d,r8d
0x1401cf54f: lea    rdx,[rbp+0x1250]
0x1401cf556: lea    rcx,[rip+0x247ae93]        # 0x14264a3f0
0x1401cf55d: call   0x140ad9960
0x1401cf562: nop
0x1401cf563: lea    rcx,[rbp+0x1250]
0x1401cf56a: call   0x140067e30
0x1401cf56f: nop
0x1401cf570: lea    rcx,[rbp+0x15d0]
0x1401cf577: call   0x140067e30
0x1401cf57c: mov    edx,DWORD PTR [rip+0x21c40f6]        # 0x142393678
0x1401cf582: lea    rcx,[rip+0x220226f]        # 0x1423d17f8
0x1401cf589: call   0x14007daf0
0x1401cf58e: mov    rbx,rax
0x1401cf591: mov    edx,DWORD PTR [rip+0x21c40d9]        # 0x142393670
0x1401cf597: lea    rcx,[rip+0x220225a]        # 0x1423d17f8
0x1401cf59e: call   0x14007daf0
0x1401cf5a3: test   rax,rax
0x1401cf5a6: je     0x1401cf9b7
0x1401cf5ac: test   rbx,rbx
0x1401cf5af: je     0x1401cf9b7
0x1401cf5b5: test   rdi,rdi
0x1401cf5b8: je     0x1401cf9b7
0x1401cf5be: test   r15,r15
0x1401cf5c1: je     0x1401cfa25
0x1401cf5c7: cmp    rax,rdi
0x1401cf5ca: je     0x1401cf9bc
0x1401cf5d0: lea    rcx,[rax+0x1028]
0x1401cf5d7: mov    edx,DWORD PTR [rdi+0x4]
0x1401cf5da: call   0x1400ffa80
0x1401cf5df: mov    rdi,rax
0x1401cf5e2: lea    rcx,[rbx+0x1028]
0x1401cf5e9: mov    edx,DWORD PTR [r15+0x4]
0x1401cf5ed: call   0x1400ffa80
0x1401cf5f2: mov    rbx,rax
0x1401cf5f5: mov    r8d,DWORD PTR [rbp-0x70]
0x1401cf5f9: mov    edx,0x9
0x1401cf5fe: lea    rcx,[rip+0x247adeb]        # 0x14264a3f0
0x1401cf605: call   0x1400bb120
0x1401cf60a: test   rbx,rbx
0x1401cf60d: je     0x1401cf7d7
0x1401cf613: movzx  eax,WORD PTR [rbx+0x4]
0x1401cf617: cmp    ax,0x3
0x1401cf61b: je     0x1401cf65e
0x1401cf61d: cmp    ax,0x4
0x1401cf621: jne    0x1401cf7d7
0x1401cf627: lea    rdx,[rip+0x14340a2]        # 0x1416036d0  'They accept '
0x1401cf62e: lea    rcx,[rbp+0x3230]
0x1401cf635: call   0x140068150
0x1401cf63a: nop
0x1401cf63b: xor    r9d,r9d
0x1401cf63e: mov    r8b,0x3
0x1401cf641: lea    rdx,[rbp+0x3230]
0x1401cf648: lea    rcx,[rip+0x247ada1]        # 0x14264a3f0
0x1401cf64f: call   0x140ad9960
0x1401cf654: nop
0x1401cf655: lea    rcx,[rbp+0x3230]
0x1401cf65c: jmp    0x1401cf693
0x1401cf65e: lea    rdx,[rip+0x143405b]        # 0x1416036c0  'They offer '
0x1401cf665: lea    rcx,[rbp+0x3250]
0x1401cf66c: call   0x140068150
0x1401cf671: nop
0x1401cf672: xor    r9d,r9d
0x1401cf675: mov    r8b,0x3
0x1401cf678: lea    rdx,[rbp+0x3250]
0x1401cf67f: lea    rcx,[rip+0x247ad6a]        # 0x14264a3f0
0x1401cf686: call   0x140ad9960
0x1401cf68b: nop
0x1401cf68c: lea    rcx,[rbp+0x3250]
0x1401cf693: call   0x140067e30
0x1401cf698: mov    ecx,DWORD PTR [rbx+0x44]
0x1401cf69b: test   ecx,ecx
0x1401cf69d: je     0x1401cf75e
0x1401cf6a3: sub    ecx,0x1
0x1401cf6a6: je     0x1401cf727
0x1401cf6a8: sub    ecx,0x1
0x1401cf6ab: je     0x1401cf6f0
0x1401cf6ad: cmp    ecx,0x1
0x1401cf6b0: jne    0x1401cf798
0x1401cf6b6: lea    rdx,[rip+0x142dbf7]        # 0x1415fd2b4  'Winter'
0x1401cf6bd: lea    rcx,[rbp+0x3270]
0x1401cf6c4: call   0x140068150
0x1401cf6c9: nop
0x1401cf6ca: xor    r9d,r9d
0x1401cf6cd: mov    r8b,0x3
0x1401cf6d0: lea    rdx,[rbp+0x3270]
0x1401cf6d7: lea    rcx,[rip+0x247ad12]        # 0x14264a3f0
0x1401cf6de: call   0x140ad9960
0x1401cf6e3: nop
0x1401cf6e4: lea    rcx,[rbp+0x3270]
0x1401cf6eb: jmp    0x1401cf793
0x1401cf6f0: lea    rdx,[rip+0x142dbb5]        # 0x1415fd2ac  'Autumn'
0x1401cf6f7: lea    rcx,[rbp+0x3290]
0x1401cf6fe: call   0x140068150
0x1401cf703: nop
0x1401cf704: xor    r9d,r9d
0x1401cf707: mov    r8b,0x3
0x1401cf70a: lea    rdx,[rbp+0x3290]
0x1401cf711: lea    rcx,[rip+0x247acd8]        # 0x14264a3f0
0x1401cf718: call   0x140ad9960
0x1401cf71d: nop
0x1401cf71e: lea    rcx,[rbp+0x3290]
0x1401cf725: jmp    0x1401cf793
0x1401cf727: lea    rdx,[rip+0x142db76]        # 0x1415fd2a4  'Summer'
0x1401cf72e: lea    rcx,[rbp+0x32b0]
0x1401cf735: call   0x140068150
0x1401cf73a: nop
0x1401cf73b: xor    r9d,r9d
0x1401cf73e: mov    r8b,0x3
0x1401cf741: lea    rdx,[rbp+0x32b0]
0x1401cf748: lea    rcx,[rip+0x247aca1]        # 0x14264a3f0
0x1401cf74f: call   0x140ad9960
0x1401cf754: nop
0x1401cf755: lea    rcx,[rbp+0x32b0]
0x1401cf75c: jmp    0x1401cf793
0x1401cf75e: lea    rdx,[rip+0x142db37]        # 0x1415fd29c  'Spring'
0x1401cf765: lea    rcx,[rbp+0x32d0]
0x1401cf76c: call   0x140068150
0x1401cf771: nop
0x1401cf772: xor    r9d,r9d
0x1401cf775: mov    r8b,0x3
0x1401cf778: lea    rdx,[rbp+0x32d0]
0x1401cf77f: lea    rcx,[rip+0x247ac6a]        # 0x14264a3f0
0x1401cf786: call   0x140ad9960
0x1401cf78b: nop
0x1401cf78c: lea    rcx,[rbp+0x32d0]
0x1401cf793: call   0x140067e30
0x1401cf798: lea    rdx,[rip+0x1433f41]        # 0x1416036e0  ' tribute'
0x1401cf79f: lea    rcx,[rbp+0x32f0]
0x1401cf7a6: call   0x140068150
0x1401cf7ab: nop
0x1401cf7ac: xor    r9d,r9d
0x1401cf7af: xor    r8d,r8d
0x1401cf7b2: lea    rdx,[rbp+0x32f0]
0x1401cf7b9: lea    rcx,[rip+0x247ac30]        # 0x14264a3f0
0x1401cf7c0: call   0x140ad9960
0x1401cf7c5: nop
0x1401cf7c6: lea    rcx,[rbp+0x32f0]
0x1401cf7cd: call   0x140067e30
0x1401cf7d2: jmp    0x1401cf9bc
0x1401cf7d7: test   rdi,rdi
0x1401cf7da: je     0x1401cf97b
0x1401cf7e0: movsx  rax,WORD PTR [rdi+0x4]
0x1401cf7e5: cmp    eax,0x5
0x1401cf7e8: ja     0x1401cf9bc
0x1401cf7ee: lea    rdx,[rip+0xffffffffffe3080b]        # 0x140000000
0x1401cf7f5: mov    ecx,DWORD PTR [rdx+rax*4+0x1d39b0]
0x1401cf7fc: add    rcx,rdx
0x1401cf7ff: jmp    rcx
0x1401cf801: test   BYTE PTR [rdi+0x40],0x4
0x1401cf805: je     0x1401cf846
0x1401cf807: lea    rdx,[rip+0x1433ee2]        # 0x1416036f0  'Alliance'
0x1401cf80e: lea    rcx,[rbp+0x3310]
0x1401cf815: call   0x140068150
0x1401cf81a: nop
0x1401cf81b: xor    r9d,r9d
0x1401cf81e: xor    r8d,r8d
0x1401cf821: lea    rdx,[rbp+0x3310]
0x1401cf828: lea    rcx,[rip+0x247abc1]        # 0x14264a3f0
0x1401cf82f: call   0x140ad9960
0x1401cf834: nop
0x1401cf835: lea    rcx,[rbp+0x3310]
0x1401cf83c: call   0x140067e30
0x1401cf841: jmp    0x1401cf9bc
0x1401cf846: lea    rdx,[rip+0x14191a7]        # 0x1415e89f4  'Peace'
0x1401cf84d: lea    rcx,[rbp+0x3330]
0x1401cf854: call   0x140068150
0x1401cf859: nop
0x1401cf85a: xor    r9d,r9d
0x1401cf85d: xor    r8d,r8d
0x1401cf860: lea    rdx,[rbp+0x3330]
0x1401cf867: lea    rcx,[rip+0x247ab82]        # 0x14264a3f0
0x1401cf86e: call   0x140ad9960
0x1401cf873: nop
0x1401cf874: lea    rcx,[rbp+0x3330]
0x1401cf87b: call   0x140067e30
0x1401cf880: jmp    0x1401cf9bc
0x1401cf885: lea    rdx,[rip+0x1433e70]        # 0x1416036fc  'War'
0x1401cf88c: lea    rcx,[rbp+0x3350]
0x1401cf893: call   0x140068150
0x1401cf898: nop
0x1401cf899: xor    r9d,r9d
0x1401cf89c: xor    r8d,r8d
0x1401cf89f: lea    rdx,[rbp+0x3350]
0x1401cf8a6: lea    rcx,[rip+0x247ab43]        # 0x14264a3f0
0x1401cf8ad: call   0x140ad9960
0x1401cf8b2: nop
0x1401cf8b3: lea    rcx,[rbp+0x3350]
0x1401cf8ba: call   0x140067e30
0x1401cf8bf: jmp    0x1401cf9bc
0x1401cf8c4: lea    rdx,[rip+0x1433e45]        # 0x141603710  'They offer tribute'
0x1401cf8cb: lea    rcx,[rbp+0x3370]
0x1401cf8d2: call   0x140068150
0x1401cf8d7: nop
0x1401cf8d8: xor    r9d,r9d
0x1401cf8db: xor    r8d,r8d
0x1401cf8de: lea    rdx,[rbp+0x3370]
0x1401cf8e5: lea    rcx,[rip+0x247ab04]        # 0x14264a3f0
0x1401cf8ec: call   0x140ad9960
0x1401cf8f1: nop
0x1401cf8f2: lea    rcx,[rbp+0x3370]
0x1401cf8f9: call   0x140067e30
0x1401cf8fe: jmp    0x1401cf9bc
0x1401cf903: lea    rdx,[rip+0x1433e1e]        # 0x141603728  'They accept tribute'
0x1401cf90a: lea    rcx,[rbp+0x3390]
0x1401cf911: call   0x140068150
0x1401cf916: nop
0x1401cf917: xor    r9d,r9d
0x1401cf91a: xor    r8d,r8d
0x1401cf91d: lea    rdx,[rbp+0x3390]
0x1401cf924: lea    rcx,[rip+0x247aac5]        # 0x14264a3f0
0x1401cf92b: call   0x140ad9960
0x1401cf930: nop
0x1401cf931: lea    rcx,[rbp+0x3390]
0x1401cf938: call   0x140067e30
0x1401cf93d: jmp    0x1401cf9bc
0x1401cf93f: lea    rdx,[rip+0x1433dfa]        # 0x141603740  'Skirmishing'
0x1401cf946: lea    rcx,[rbp+0x33b0]
0x1401cf94d: call   0x140068150
0x1401cf952: nop
0x1401cf953: xor    r9d,r9d
0x1401cf956: xor    r8d,r8d
0x1401cf959: lea    rdx,[rbp+0x33b0]
0x1401cf960: lea    rcx,[rip+0x247aa89]        # 0x14264a3f0
0x1401cf967: call   0x140ad9960
0x1401cf96c: nop
0x1401cf96d: lea    rcx,[rbp+0x33b0]
0x1401cf974: call   0x140067e30
0x1401cf979: jmp    0x1401cf9bc
0x1401cf97b: lea    rdx,[rip+0x1433d7e]        # 0x141603700  'No contact'
0x1401cf982: lea    rcx,[rbp+0x33d0]
0x1401cf989: call   0x140068150
0x1401cf98e: nop
0x1401cf98f: xor    r9d,r9d
0x1401cf992: xor    r8d,r8d
0x1401cf995: lea    rdx,[rbp+0x33d0]
0x1401cf99c: lea    rcx,[rip+0x247aa4d]        # 0x14264a3f0
0x1401cf9a3: call   0x140ad9960
0x1401cf9a8: nop
0x1401cf9a9: lea    rcx,[rbp+0x33d0]
0x1401cf9b0: call   0x140067e30
0x1401cf9b5: jmp    0x1401cf9bc
0x1401cf9b7: test   r15,r15
0x1401cf9ba: je     0x1401cfa25
0x1401cf9bc: mov    edx,0x8
0x1401cf9c1: mov    rcx,r15
0x1401cf9c4: call   0x1409b4e40
0x1401cf9c9: mov    r15d,DWORD PTR [rbp-0x70]
0x1401cf9cd: cmp    eax,DWORD PTR [rip+0x21c3ca1]        # 0x142393674
0x1401cf9d3: jne    0x1401cfa29
0x1401cf9d5: mov    r8d,r15d
0x1401cf9d8: mov    edx,0xa
0x1401cf9dd: lea    rcx,[rip+0x247aa0c]        # 0x14264a3f0
0x1401cf9e4: call   0x1400bb120
0x1401cf9e9: lea    rdx,[rip+0x1433d60]        # 0x141603750  'Economically linked to you'
0x1401cf9f0: lea    rcx,[rbp+0x33f0]
0x1401cf9f7: call   0x140068150
0x1401cf9fc: nop
0x1401cf9fd: xor    r9d,r9d
0x1401cfa00: xor    r8d,r8d
0x1401cfa03: lea    rdx,[rbp+0x33f0]
0x1401cfa0a: lea    rcx,[rip+0x247a9df]        # 0x14264a3f0
0x1401cfa11: call   0x140ad9960
0x1401cfa16: nop
0x1401cfa17: lea    rcx,[rbp+0x33f0]
0x1401cfa1e: call   0x140067e30
0x1401cfa23: jmp    0x1401cfa29
0x1401cfa25: mov    r15d,DWORD PTR [rbp-0x70]
0x1401cfa29: lea    rcx,[rbp+0x1270]
0x1401cfa30: call   0x140067e30
0x1401cfa35: nop
0x1401cfa36: lea    rcx,[rbp+0xe70]
0x1401cfa3d: call   0x140067e30
0x1401cfa42: mov    rbx,QWORD PTR [rsp+0x78]
0x1401cfa47: cmp    DWORD PTR [rbx+0x8300],r13d
0x1401cfa4e: jne    0x1401cfa59
0x1401cfa50: cmp    DWORD PTR [rbx+0x8304],r14d
0x1401cfa57: je     0x1401cfa7c
0x1401cfa59: mov    DWORD PTR [rbx+0x8300],r13d
0x1401cfa60: mov    DWORD PTR [rbx+0x8304],r14d
0x1401cfa67: mov    r8d,r14d
0x1401cfa6a: mov    edx,r13d
0x1401cfa6d: mov    r13,QWORD PTR [rsp+0x78]
0x1401cfa72: mov    rcx,r13
0x1401cfa75: call   0x1401da280
0x1401cfa7a: jmp    0x1401cfa81
0x1401cfa7c: mov    r13,QWORD PTR [rsp+0x78]
0x1401cfa81: xor    r8d,r8d
0x1401cfa84: mov    edx,0x7
0x1401cfa89: xor    r9d,r9d
0x1401cfa8c: lea    rcx,[rip+0x247a95d]        # 0x14264a3f0
0x1401cfa93: call   0x1400bb130
0x1401cfa98: mov    r14d,0xc
0x1401cfa9e: lea    rdx,[rbp+0xb8]
0x1401cfaa5: lea    rcx,[r13+0x8310]
0x1401cfaac: call   0x14006f240
0x1401cfab1: lea    rdx,[rbp+0x188]
0x1401cfab8: lea    rcx,[r13+0x8310]
0x1401cfabf: call   0x14006f230
0x1401cfac4: lea    r8,[rbp+0x188]
0x1401cfacb: lea    rdx,[rbp+0x0]
0x1401cfacf: lea    rcx,[rbp+0xb8]
0x1401cfad6: call   0x14006ee20
0x1401cfadb: xor    edx,edx
0x1401cfadd: movzx  ecx,BYTE PTR [rax]
0x1401cfae0: call   0x1400657b0
0x1401cfae5: test   al,al
0x1401cfae7: je     0x1401c6068
0x1401cfaed: lea    edi,[r12-0x2]
0x1401cfaf2: cmp    r14d,edi
0x1401cfaf5: jne    0x1401cfb0b
0x1401cfaf7: lea    rcx,[r13+0x8310]
0x1401cfafe: call   0x14006ee50
0x1401cfb03: lea    ecx,[r14-0xa]
0x1401cfb07: cmp    ecx,eax
0x1401cfb09: jl     0x1401cfb77
0x1401cfb0b: mov    r8d,r15d
0x1401cfb0e: mov    edx,r14d
0x1401cfb11: lea    rcx,[rip+0x247a8d8]        # 0x14264a3f0
0x1401cfb18: call   0x1400bb120
0x1401cfb1d: lea    rcx,[rbp+0xb8]
0x1401cfb24: call   0x14006ee10
0x1401cfb29: xor    r9d,r9d
0x1401cfb2c: xor    r8d,r8d
0x1401cfb2f: mov    rdx,QWORD PTR [rax]
0x1401cfb32: lea    rcx,[rip+0x247a8b7]        # 0x14264a3f0
0x1401cfb39: call   0x140ad9960
0x1401cfb3e: lea    rcx,[rbp+0xb8]
0x1401cfb45: call   0x14006ee00
0x1401cfb4a: inc    r14d
0x1401cfb4d: lea    r8,[rbp+0x188]
0x1401cfb54: lea    rdx,[rbp+0x0]
0x1401cfb58: lea    rcx,[rbp+0xb8]
0x1401cfb5f: call   0x14006ee20
0x1401cfb64: xor    edx,edx
0x1401cfb66: movzx  ecx,BYTE PTR [rax]
0x1401cfb69: call   0x1400657b0
0x1401cfb6e: test   al,al
0x1401cfb70: jne    0x1401cfaf2
0x1401cfb72: jmp    0x1401c6068
0x1401cfb77: xor    r8d,r8d
0x1401cfb7a: mov    edx,0x7
0x1401cfb7f: mov    r9b,0x1
0x1401cfb82: lea    rcx,[rip+0x247a867]        # 0x14264a3f0
0x1401cfb89: call   0x1400bb130
0x1401cfb8e: lea    edx,[r12-0x1]
0x1401cfb93: mov    r8d,r15d
0x1401cfb96: lea    rcx,[rip+0x247a853]        # 0x14264a3f0
0x1401cfb9d: call   0x1400bb120
0x1401cfba2: lea    rdx,[rip+0x1434457]        # 0x141604000  'Click to view all news and rumors'
0x1401cfba9: lea    rcx,[rbp+0x3410]
0x1401cfbb0: call   0x140068150
0x1401cfbb5: nop
0x1401cfbb6: xor    r9d,r9d
0x1401cfbb9: xor    r8d,r8d
0x1401cfbbc: lea    rdx,[rbp+0x3410]
0x1401cfbc3: lea    rcx,[rip+0x247a826]        # 0x14264a3f0
0x1401cfbca: call   0x140ad9960
0x1401cfbcf: nop
0x1401cfbd0: lea    rcx,[rbp+0x3410]
0x1401cfbd7: call   0x140067e30
0x1401cfbdc: jmp    0x1401c6068
0x1401cfbe1: mov    edi,DWORD PTR [rbp-0x18]
0x1401cfbe4: lea    esi,[rdi-0x3a]
0x1401cfbe7: mov    eax,DWORD PTR [rip+0x21fdb9b]        # 0x1423cd788
0x1401cfbed: lea    ecx,[rax-0x1]
0x1401cfbf0: lea    r13d,[rax-0x1a]
0x1401cfbf4: cmp    ecx,r13d
0x1401cfbf7: cmovle r13d,ecx
0x1401cfbfb: mov    DWORD PTR [rbp-0x60],r13d
0x1401cfbff: xor    eax,eax
0x1401cfc01: mov    r15d,eax
0x1401cfc04: test   r13d,r13d
0x1401cfc07: js     0x1401cfcdc
0x1401cfc0d: mov    r14d,eax
0x1401cfc10: mov    ebx,esi
0x1401cfc12: cmp    esi,edi
0x1401cfc14: jg     0x1401cfccd
0x1401cfc1a: movsxd r12,r13d
0x1401cfc1d: nop    DWORD PTR [rax]
0x1401cfc20: mov    r8d,ebx
0x1401cfc23: mov    edx,r15d
0x1401cfc26: lea    rcx,[rip+0x247a7c3]        # 0x14264a3f0
0x1401cfc2d: call   0x1400bb120
0x1401cfc32: xor    r8d,r8d
0x1401cfc35: xor    edx,edx
0x1401cfc37: lea    rcx,[rip+0x247a7b2]        # 0x14264a3f0
0x1401cfc3e: call   0x1400bb190
0x1401cfc43: test   r14,r14
0x1401cfc46: jne    0x1401cfc6f
0x1401cfc48: cmp    ebx,esi
0x1401cfc4a: jne    0x1401cfc54
0x1401cfc4c: mov    edx,DWORD PTR [rip+0x247c0c2]        # 0x14264bd14
0x1401cfc52: jmp    0x1401cfcb7
0x1401cfc54: lea    rcx,[rip+0x247a795]        # 0x14264a3f0
0x1401cfc5b: cmp    ebx,edi
0x1401cfc5d: jne    0x1401cfc67
0x1401cfc5f: mov    edx,DWORD PTR [rip+0x247c0c7]        # 0x14264bd2c
0x1401cfc65: jmp    0x1401cfcbe
0x1401cfc67: mov    edx,DWORD PTR [rip+0x247c0b3]        # 0x14264bd20
0x1401cfc6d: jmp    0x1401cfcbe
0x1401cfc6f: cmp    r14,r12
0x1401cfc72: jne    0x1401cfc9b
0x1401cfc74: cmp    ebx,esi
0x1401cfc76: jne    0x1401cfc80
0x1401cfc78: mov    edx,DWORD PTR [rip+0x247c09e]        # 0x14264bd1c
0x1401cfc7e: jmp    0x1401cfcb7
0x1401cfc80: lea    rcx,[rip+0x247a769]        # 0x14264a3f0
0x1401cfc87: cmp    ebx,edi
0x1401cfc89: jne    0x1401cfc93
0x1401cfc8b: mov    edx,DWORD PTR [rip+0x247c0a3]        # 0x14264bd34
0x1401cfc91: jmp    0x1401cfcbe
0x1401cfc93: mov    edx,DWORD PTR [rip+0x247c08f]        # 0x14264bd28
0x1401cfc99: jmp    0x1401cfcbe
0x1401cfc9b: cmp    ebx,esi
0x1401cfc9d: jne    0x1401cfca7
0x1401cfc9f: mov    edx,DWORD PTR [rip+0x247c073]        # 0x14264bd18
0x1401cfca5: jmp    0x1401cfcb7
0x1401cfca7: cmp    ebx,edi
0x1401cfca9: mov    edx,DWORD PTR [rip+0x247c081]        # 0x14264bd30
0x1401cfcaf: je     0x1401cfcb7
0x1401cfcb1: mov    edx,DWORD PTR [rip+0x247c06d]        # 0x14264bd24
0x1401cfcb7: lea    rcx,[rip+0x247a732]        # 0x14264a3f0
0x1401cfcbe: call   0x140adaad0
0x1401cfcc3: inc    ebx
0x1401cfcc5: cmp    ebx,edi
0x1401cfcc7: jle    0x1401cfc20
0x1401cfccd: inc    r15d
0x1401cfcd0: inc    r14
0x1401cfcd3: cmp    r15d,r13d
0x1401cfcd6: jle    0x1401cfc10
0x1401cfcdc: mov    rbx,QWORD PTR [rsp+0x78]
0x1401cfce1: lea    r12d,[rdi-0x2]
0x1401cfce5: cmp    QWORD PTR [rbx+0x8368],0x0
0x1401cfced: je     0x1401d0647
0x1401cfcf3: lea    r15d,[rdi-0x4]
0x1401cfcf7: cmp    DWORD PTR [rbx+0x83c0],0x0
0x1401cfcfe: cmovle r15d,edi
0x1401cfd02: lea    eax,[rsi+0x2]
0x1401cfd05: mov    DWORD PTR [rbp-0x60],eax
0x1401cfd08: add    r13d,0xfffffffb
0x1401cfd0c: mov    DWORD PTR [rsp+0x74],r13d
0x1401cfd11: lea    rcx,[rbx+0x8388]
0x1401cfd18: call   0x14006ee50
0x1401cfd1d: mov    QWORD PTR [rbp-0x78],rax
0x1401cfd21: mov    ecx,r12d
0x1401cfd24: cmp    eax,r13d
0x1401cfd27: cmovle ecx,edi
0x1401cfd2a: mov    DWORD PTR [rbp-0x28],ecx
0x1401cfd2d: xor    r8d,r8d
0x1401cfd30: mov    edx,0x3
0x1401cfd35: mov    r9b,0x1
0x1401cfd38: lea    rcx,[rip+0x247a6b1]        # 0x14264a3f0
0x1401cfd3f: call   0x1400bb130
0x1401cfd44: lea    r8d,[rsi+0x2]
0x1401cfd48: mov    edx,0x1
0x1401cfd4d: lea    rcx,[rip+0x247a69c]        # 0x14264a3f0
0x1401cfd54: call   0x1400bb120
0x1401cfd59: mov    r13,rbx
0x1401cfd5c: mov    rdx,QWORD PTR [rbx+0x8368]
0x1401cfd63: add    rdx,0x28
0x1401cfd67: lea    rcx,[rbp+0x13b0]
0x1401cfd6e: call   0x14006f5d0
0x1401cfd73: nop
0x1401cfd74: mov    ebx,r15d
0x1401cfd77: sub    ebx,esi
0x1401cfd79: lea    rcx,[rbp+0x13b0]
0x1401cfd80: call   0x14006f330
0x1401cfd85: lea    ecx,[rbx-0x2]
0x1401cfd88: movsxd rdx,ecx
0x1401cfd8b: cmp    rax,rdx
0x1401cfd8e: jb     0x1401cfdf2
0x1401cfd90: lea    edi,[rbx-0x3]
0x1401cfd93: test   edi,edi
0x1401cfd95: js     0x1401cfdad
0x1401cfd97: movsxd rdx,ebx
0x1401cfd9a: sub    rdx,0x3
0x1401cfd9e: xor    r8d,r8d
0x1401cfda1: lea    rcx,[rbp+0x13b0]
0x1401cfda8: call   0x1400e1230
0x1401cfdad: cmp    edi,0x3
0x1401cfdb0: jle    0x1401cfdf2
0x1401cfdb2: movsxd rdx,ebx
0x1401cfdb5: sub    rdx,0x6
0x1401cfdb9: lea    rcx,[rbp+0x13b0]
0x1401cfdc0: call   0x1400fb540
0x1401cfdc5: mov    BYTE PTR [rax],0x2e
0x1401cfdc8: lea    eax,[rbx-0x5]
0x1401cfdcb: movsxd rdx,eax
0x1401cfdce: lea    rcx,[rbp+0x13b0]
0x1401cfdd5: call   0x1400fb540
0x1401cfdda: mov    BYTE PTR [rax],0x2e
0x1401cfddd: lea    eax,[rbx-0x4]
0x1401cfde0: movsxd rdx,eax
0x1401cfde3: lea    rcx,[rbp+0x13b0]
0x1401cfdea: call   0x1400fb540
0x1401cfdef: mov    BYTE PTR [rax],0x2e
0x1401cfdf2: xor    r9d,r9d
0x1401cfdf5: xor    r8d,r8d
0x1401cfdf8: lea    rdx,[rbp+0x13b0]
0x1401cfdff: lea    rcx,[rip+0x247a5ea]        # 0x14264a3f0
0x1401cfe06: call   0x140ad9960
0x1401cfe0b: cmp    DWORD PTR [r13+0x83b8],0x0
0x1401cfe13: jl     0x1401d0002
0x1401cfe19: mov    eax,0x1b4e81b5
0x1401cfe1e: imul   DWORD PTR [r13+0x83bc]
0x1401cfe25: mov    edi,edx
0x1401cfe27: sar    edi,0x7
0x1401cfe2a: mov    eax,edi
0x1401cfe2c: shr    eax,0x1f
0x1401cfe2f: add    edi,eax
0x1401cfe31: mov    eax,0x92492493
0x1401cfe36: imul   edi
0x1401cfe38: lea    r14d,[rdi+rdx*1]
0x1401cfe3c: sar    r14d,0x4
0x1401cfe40: mov    eax,r14d
0x1401cfe43: shr    eax,0x1f
0x1401cfe46: add    r14d,eax
0x1401cfe49: imul   eax,r14d,0x1c
0x1401cfe4d: sub    edi,eax
0x1401cfe4f: lea    rcx,[rbp+0xdf0]
0x1401cfe56: call   0x14006f690
0x1401cfe5b: nop
0x1401cfe5c: lea    rdx,[rbp+0xdf0]
0x1401cfe63: lea    ecx,[rdi+0x1]
0x1401cfe66: call   0x14052c130
0x1401cfe6b: cmp    edi,0x20
0x1401cfe6e: ja     0x1401cfea9
0x1401cfe70: movsxd rax,edi
0x1401cfe73: lea    rdx,[rip+0xffffffffffe30186]        # 0x140000000
0x1401cfe7a: movzx  eax,BYTE PTR [rdx+rax*1+0x1d39d8]
0x1401cfe82: mov    ecx,DWORD PTR [rdx+rax*4+0x1d39c8]
0x1401cfe89: add    rcx,rdx
0x1401cfe8c: jmp    rcx
0x1401cfe8e: lea    rdx,[rip+0x141c803]        # 0x1415ec698  'st'
0x1401cfe95: jmp    0x1401cfeb0
0x1401cfe97: lea    rdx,[rip+0x141c7fe]        # 0x1415ec69c  'nd'
0x1401cfe9e: jmp    0x1401cfeb0
0x1401cfea0: lea    rdx,[rip+0x141c7e9]        # 0x1415ec690  'rd'
0x1401cfea7: jmp    0x1401cfeb0
0x1401cfea9: lea    rdx,[rip+0x141c7e4]        # 0x1415ec694  'th'
0x1401cfeb0: lea    rcx,[rbp+0xdf0]
0x1401cfeb7: call   0x14006f560
0x1401cfebc: lea    rdx,[rip+0x1418879]        # 0x1415e873c  ' '
0x1401cfec3: lea    rcx,[rbp+0xdf0]
0x1401cfeca: call   0x14006f560
0x1401cfecf: lea    rcx,[rbp+0x15f0]
0x1401cfed6: call   0x14006f690
0x1401cfedb: nop
0x1401cfedc: lea    rdx,[rbp+0x15f0]
0x1401cfee3: mov    ecx,r14d
0x1401cfee6: call   0x140773390
0x1401cfeeb: lea    rdx,[rbp+0x15f0]
0x1401cfef2: lea    rcx,[rbp+0xdf0]
0x1401cfef9: call   0x1400b9d10
0x1401cfefe: lea    rdx,[rip+0x14191d3]        # 0x1415e90d8  ', '
0x1401cff05: lea    rcx,[rbp+0xdf0]
0x1401cff0c: call   0x14006f560
0x1401cff11: lea    rdx,[rbp+0xdf0]
0x1401cff18: mov    ecx,DWORD PTR [r13+0x83b8]
0x1401cff1f: call   0x14052c130
0x1401cff24: xor    r8d,r8d
0x1401cff27: mov    edx,0x7
0x1401cff2c: mov    r9b,0x1
0x1401cff2f: lea    rcx,[rip+0x247a4ba]        # 0x14264a3f0
0x1401cff36: call   0x1400bb130
0x1401cff3b: lea    r8d,[rsi+0x2]
0x1401cff3f: mov    edx,0x2
0x1401cff44: lea    rcx,[rip+0x247a4a5]        # 0x14264a3f0
0x1401cff4b: call   0x1400bb120
0x1401cff50: lea    rcx,[rbp+0xdf0]
0x1401cff57: call   0x14006f330
0x1401cff5c: mov    ecx,r15d
0x1401cff5f: sub    ecx,esi
0x1401cff61: sub    ecx,0x2
0x1401cff64: movsxd rcx,ecx
0x1401cff67: cmp    rax,rcx
0x1401cff6a: jb     0x1401cffcf
0x1401cff6c: mov    edi,r15d
0x1401cff6f: sub    edi,esi
0x1401cff71: lea    ebx,[rdi-0x3]
0x1401cff74: movsxd rdx,edi
0x1401cff77: sub    rdx,0x3
0x1401cff7b: xor    r8d,r8d
0x1401cff7e: lea    rcx,[rbp+0xdf0]
0x1401cff85: call   0x1400e1230
0x1401cff8a: cmp    ebx,0x3
0x1401cff8d: jle    0x1401cffcf
0x1401cff8f: movsxd rdx,edi
0x1401cff92: sub    rdx,0x6
0x1401cff96: lea    rcx,[rbp+0xdf0]
0x1401cff9d: call   0x1400fb540
0x1401cffa2: mov    BYTE PTR [rax],0x2e
0x1401cffa5: lea    eax,[rdi-0x5]
0x1401cffa8: movsxd rdx,eax
0x1401cffab: lea    rcx,[rbp+0xdf0]
0x1401cffb2: call   0x1400fb540
0x1401cffb7: mov    BYTE PTR [rax],0x2e
0x1401cffba: lea    eax,[rdi-0x4]
0x1401cffbd: movsxd rdx,eax
0x1401cffc0: lea    rcx,[rbp+0xdf0]
0x1401cffc7: call   0x1400fb540
0x1401cffcc: mov    BYTE PTR [rax],0x2e
0x1401cffcf: xor    r9d,r9d
0x1401cffd2: xor    r8d,r8d
0x1401cffd5: lea    rdx,[rbp+0xdf0]
0x1401cffdc: lea    rcx,[rip+0x247a40d]        # 0x14264a3f0
0x1401cffe3: call   0x140ad9960
0x1401cffe8: nop
0x1401cffe9: lea    rcx,[rbp+0x15f0]
0x1401cfff0: call   0x140067e30
0x1401cfff5: nop
0x1401cfff6: lea    rcx,[rbp+0xdf0]
0x1401cfffd: call   0x140067e30
0x1401d0002: cmp    DWORD PTR [r13+0x83c0],0x0
0x1401d000a: jle    0x1401d0180
0x1401d0010: mov    edi,0x1
0x1401d0015: lea    rbx,[rip+0x2484a74]        # 0x142654a90
0x1401d001c: nop    DWORD PTR [rax+0x0]
0x1401d0020: mov    r8d,r15d
0x1401d0023: mov    edx,edi
0x1401d0025: lea    rcx,[rip+0x247a3c4]        # 0x14264a3f0
0x1401d002c: call   0x1400bb120
0x1401d0031: lea    rcx,[rip+0x247a3b8]        # 0x14264a3f0
0x1401d0038: cmp    BYTE PTR [r13+0x83c4],0x0
0x1401d0040: je     0x1401d0047
0x1401d0042: mov    edx,DWORD PTR [rbx-0x18]
0x1401d0045: jmp    0x1401d004a
0x1401d0047: mov    edx,DWORD PTR [rbx-0x8]
0x1401d004a: call   0x140adaad0
0x1401d004f: xor    edx,edx
0x1401d0051: lea    rcx,[rip+0x21fd718]        # 0x1423cd770
0x1401d0058: call   0x140071f90
0x1401d005d: test   al,al
0x1401d005f: je     0x1401d0072
0x1401d0061: mov    r8b,0x1
0x1401d0064: xor    edx,edx
0x1401d0066: lea    rcx,[rip+0x247a383]        # 0x14264a3f0
0x1401d006d: call   0x1400bb190
0x1401d0072: mov    r8d,r12d
0x1401d0075: mov    edx,edi
0x1401d0077: lea    rcx,[rip+0x247a372]        # 0x14264a3f0
0x1401d007e: call   0x1400bb120
0x1401d0083: lea    rcx,[rip+0x247a366]        # 0x14264a3f0
0x1401d008a: cmp    BYTE PTR [r13+0x83c4],0x0
0x1401d0092: je     0x1401d0099
0x1401d0094: mov    edx,DWORD PTR [rbx+0x18]
0x1401d0097: jmp    0x1401d009c
0x1401d0099: mov    edx,DWORD PTR [rbx+0x8]
0x1401d009c: call   0x140adaad0
0x1401d00a1: xor    edx,edx
0x1401d00a3: lea    rcx,[rip+0x21fd6c6]        # 0x1423cd770
0x1401d00aa: call   0x140071f90
0x1401d00af: test   al,al
0x1401d00b1: je     0x1401d00c4
0x1401d00b3: mov    r8b,0x1
0x1401d00b6: xor    edx,edx
0x1401d00b8: lea    rcx,[rip+0x247a331]        # 0x14264a3f0
0x1401d00bf: call   0x1400bb190
0x1401d00c4: lea    r8d,[r15+0x1]
0x1401d00c8: mov    edx,edi
0x1401d00ca: lea    rcx,[rip+0x247a31f]        # 0x14264a3f0
0x1401d00d1: call   0x1400bb120
0x1401d00d6: lea    rcx,[rip+0x247a313]        # 0x14264a3f0
0x1401d00dd: cmp    BYTE PTR [r13+0x83c4],0x0
0x1401d00e5: je     0x1401d00ec
0x1401d00e7: mov    edx,DWORD PTR [rbx-0x10]
0x1401d00ea: jmp    0x1401d00ee
0x1401d00ec: mov    edx,DWORD PTR [rbx]
0x1401d00ee: call   0x140adaad0
0x1401d00f3: xor    edx,edx
0x1401d00f5: lea    rcx,[rip+0x21fd674]        # 0x1423cd770
0x1401d00fc: call   0x140071f90
0x1401d0101: test   al,al
0x1401d0103: je     0x1401d0116
0x1401d0105: mov    r8b,0x1
0x1401d0108: xor    edx,edx
0x1401d010a: lea    rcx,[rip+0x247a2df]        # 0x14264a3f0
0x1401d0111: call   0x1400bb190
0x1401d0116: lea    r8d,[r12+0x1]
0x1401d011b: mov    edx,edi
0x1401d011d: lea    rcx,[rip+0x247a2cc]        # 0x14264a3f0
0x1401d0124: call   0x1400bb120
0x1401d0129: lea    rcx,[rip+0x247a2c0]        # 0x14264a3f0
0x1401d0130: cmp    BYTE PTR [r13+0x83c4],0x0
0x1401d0138: je     0x1401d013f
0x1401d013a: mov    edx,DWORD PTR [rbx+0x20]
0x1401d013d: jmp    0x1401d0142
0x1401d013f: mov    edx,DWORD PTR [rbx+0x10]
0x1401d0142: call   0x140adaad0
0x1401d0147: xor    edx,edx
0x1401d0149: lea    rcx,[rip+0x21fd620]        # 0x1423cd770
0x1401d0150: call   0x140071f90
0x1401d0155: test   al,al
0x1401d0157: je     0x1401d016a
0x1401d0159: mov    r8b,0x1
0x1401d015c: xor    edx,edx
0x1401d015e: lea    rcx,[rip+0x247a28b]        # 0x14264a3f0
0x1401d0165: call   0x1400bb190
0x1401d016a: inc    edi
0x1401d016c: add    rbx,0x4
0x1401d0170: lea    rax,[rip+0x2484921]        # 0x142654a98
0x1401d0177: cmp    rbx,rax
0x1401d017a: jl     0x1401d0020
0x1401d0180: mov    r14,QWORD PTR [rbp-0x78]
0x1401d0184: test   r14d,r14d
0x1401d0187: jle    0x1401d0636
0x1401d018d: mov    eax,DWORD PTR [r13+0x83d0]
0x1401d0194: mov    ecx,r14d
0x1401d0197: mov    r15d,DWORD PTR [rsp+0x74]
0x1401d019c: sub    ecx,r15d
0x1401d019f: cmp    eax,ecx
0x1401d01a1: cmovle ecx,eax
0x1401d01a4: xor    esi,esi
0x1401d01a6: test   ecx,ecx
0x1401d01a8: cmovns esi,ecx
0x1401d01ab: lea    r13d,[rsi+r15*1]
0x1401d01af: cmp    esi,r13d
0x1401d01b2: jge    0x1401d029b
0x1401d01b8: mov    rdi,QWORD PTR [rsp+0x78]
0x1401d01bd: add    rdi,0x8388
0x1401d01c4: mov    ebx,0x5
0x1401d01c9: mov    r12d,ebx
0x1401d01cc: sub    r12d,esi
0x1401d01cf: mov    r15d,0x4
0x1401d01d5: cmp    esi,r14d
0x1401d01d8: jge    0x1401d0296
0x1401d01de: lea    edx,[r12+rsi*1]
0x1401d01e2: mov    r8d,DWORD PTR [rbp-0x60]
0x1401d01e6: lea    rcx,[rip+0x247a203]        # 0x14264a3f0
0x1401d01ed: call   0x1400bb120
0x1401d01f2: mov    rcx,QWORD PTR [rsp+0x78]
0x1401d01f7: mov    eax,DWORD PTR [rcx+0x83c8]
0x1401d01fd: cmp    eax,0x42
0x1401d0200: jl     0x1401d0317
0x1401d0206: cmp    esi,DWORD PTR [rcx+0x83cc]
0x1401d020c: jl     0x1401d040c
0x1401d0212: xor    r8d,r8d
0x1401d0215: xor    edx,edx
0x1401d0217: mov    r9b,0x1
0x1401d021a: lea    rcx,[rip+0x247a1cf]        # 0x14264a3f0
0x1401d0221: call   0x1400bb130
0x1401d0226: movsxd r15,esi
0x1401d0229: mov    rdx,r15
0x1401d022c: mov    rcx,rdi
0x1401d022f: call   0x14006f220
0x1401d0234: mov    rcx,QWORD PTR [rax]
0x1401d0237: call   0x14006f330
0x1401d023c: test   eax,eax
0x1401d023e: jle    0x1401d0285
0x1401d0240: xor    ebx,ebx
0x1401d0242: mov    r14d,eax
0x1401d0245: mov    rdx,r15
0x1401d0248: mov    rcx,rdi
0x1401d024b: call   0x14006f220
0x1401d0250: mov    rdx,rbx
0x1401d0253: mov    rcx,QWORD PTR [rax]
0x1401d0256: call   0x1400fb540
0x1401d025b: mov    r8b,0x1
0x1401d025e: lea    rcx,[rip+0x247a18b]        # 0x14264a3f0
0x1401d0265: cmp    BYTE PTR [rax],0x20
0x1401d0268: mov    dl,0x20
0x1401d026a: je     0x1401d026e
0x1401d026c: mov    dl,0xfa
0x1401d026e: call   0x1400bb190
0x1401d0273: inc    rbx
0x1401d0276: sub    r14,0x1
0x1401d027a: jne    0x1401d0245
0x1401d027c: mov    ebx,0x5
0x1401d0281: mov    r14,QWORD PTR [rbp-0x78]
0x1401d0285: mov    r15d,0x4
0x1401d028b: inc    esi
0x1401d028d: cmp    esi,r13d
0x1401d0290: jl     0x1401d01d5
0x1401d0296: mov    r15d,DWORD PTR [rsp+0x74]
0x1401d029b: cmp    r14d,r15d
0x1401d029e: jle    0x1401d0631
0x1401d02a4: lea    ebx,[r15+0x3]
0x1401d02a8: lea    rcx,[rbp+0x2d0]
0x1401d02af: call   0x1400bb360
0x1401d02b4: lea    r9d,[r14-0x1]
0x1401d02b8: mov    DWORD PTR [rsp+0x30],ebx
0x1401d02bc: mov    DWORD PTR [rsp+0x28],0x6
0x1401d02c4: mov    DWORD PTR [rsp+0x20],r15d
0x1401d02c9: xor    r8d,r8d
0x1401d02cc: mov    r13,QWORD PTR [rsp+0x78]
0x1401d02d1: mov    edx,DWORD PTR [r13+0x83d0]
0x1401d02d8: lea    rcx,[rbp+0x2d0]
0x1401d02df: call   0x1400bb380
0x1401d02e4: mov    r9d,DWORD PTR [rbp-0x28]
0x1401d02e8: dec    r9d
0x1401d02eb: mov    DWORD PTR [rsp+0x28],0x0
0x1401d02f3: movzx  eax,BYTE PTR [r13+0x83d4]
0x1401d02fb: mov    BYTE PTR [rsp+0x20],al
0x1401d02ff: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401d0303: mov    edx,DWORD PTR [rbp-0x38]
0x1401d0306: lea    rcx,[rbp+0x2d0]
0x1401d030d: call   0x14140f4d0
0x1401d0312: jmp    0x1401d0636
0x1401d0317: cmp    eax,0x21
0x1401d031a: jl     0x1401d040c
0x1401d0320: cmp    esi,DWORD PTR [rcx+0x83cc]
0x1401d0326: jl     0x1401d040c
0x1401d032c: add    rcx,0x83a0
0x1401d0333: movsxd r15,esi
0x1401d0336: mov    rdx,r15
0x1401d0339: call   0x14006f360
0x1401d033e: movsxd rcx,DWORD PTR [rax]
0x1401d0341: cmp    ecx,0xf
0x1401d0344: ja     0x1401d0395
0x1401d0346: lea    rdx,[rip+0xffffffffffe2fcb3]        # 0x140000000
0x1401d034d: mov    ecx,DWORD PTR [rdx+rcx*4+0x1d39fc]
0x1401d0354: add    rcx,rdx
0x1401d0357: jmp    rcx
0x1401d0359: xor    edx,edx
0x1401d035b: jmp    0x1401d039a
0x1401d035d: mov    edx,0x6
0x1401d0362: mov    r9b,0x1
0x1401d0365: jmp    0x1401d039d
0x1401d0367: xor    edx,edx
0x1401d0369: mov    r9b,0x1
0x1401d036c: jmp    0x1401d039d
0x1401d036e: mov    edx,0x1
0x1401d0373: jmp    0x1401d039a
0x1401d0375: mov    edx,0x2
0x1401d037a: jmp    0x1401d039a
0x1401d037c: mov    edx,0x3
0x1401d0381: jmp    0x1401d039a
0x1401d0383: mov    edx,0x4
0x1401d0388: jmp    0x1401d039a
0x1401d038a: mov    edx,ebx
0x1401d038c: jmp    0x1401d039a
0x1401d038e: mov    edx,0x6
0x1401d0393: jmp    0x1401d039a
0x1401d0395: mov    edx,0x7
0x1401d039a: xor    r9d,r9d
0x1401d039d: xor    r8d,r8d
0x1401d03a0: lea    rcx,[rip+0x247a049]        # 0x14264a3f0
0x1401d03a7: call   0x1400bb130
0x1401d03ac: mov    rdx,r15
0x1401d03af: mov    rcx,rdi
0x1401d03b2: call   0x14006f220
0x1401d03b7: mov    rcx,QWORD PTR [rax]
0x1401d03ba: call   0x14006f330
0x1401d03bf: test   eax,eax
0x1401d03c1: jle    0x1401d0285
0x1401d03c7: xor    ebx,ebx
0x1401d03c9: mov    r14d,eax
0x1401d03cc: nop    DWORD PTR [rax+0x0]
0x1401d03d0: mov    rdx,r15
0x1401d03d3: mov    rcx,rdi
0x1401d03d6: call   0x14006f220
0x1401d03db: mov    rdx,rbx
0x1401d03de: mov    rcx,QWORD PTR [rax]
0x1401d03e1: call   0x1400fb540
0x1401d03e6: mov    r8b,0x1
0x1401d03e9: lea    rcx,[rip+0x247a000]        # 0x14264a3f0
0x1401d03f0: cmp    BYTE PTR [rax],0x20
0x1401d03f3: mov    dl,0x20
0x1401d03f5: je     0x1401d03f9
0x1401d03f7: mov    dl,0xf9
0x1401d03f9: call   0x1400bb190
0x1401d03fe: inc    rbx
0x1401d0401: sub    r14,0x1
0x1401d0405: jne    0x1401d03d0
0x1401d0407: jmp    0x1401d027c
0x1401d040c: cmp    eax,0x2
0x1401d040f: jl     0x1401d0541
0x1401d0415: cmp    esi,DWORD PTR [rcx+0x83cc]
0x1401d041b: jl     0x1401d0541
0x1401d0421: add    rcx,0x83a0
0x1401d0428: movsxd r15,esi
0x1401d042b: mov    rdx,r15
0x1401d042e: call   0x14006f360
0x1401d0433: movsxd rcx,DWORD PTR [rax]
0x1401d0436: cmp    ecx,0xf
0x1401d0439: ja     0x1401d04ce
0x1401d043f: lea    rdx,[rip+0xffffffffffe2fbba]        # 0x140000000
0x1401d0446: mov    ecx,DWORD PTR [rdx+rcx*4+0x1d3a3c]
0x1401d044d: add    rcx,rdx
0x1401d0450: jmp    rcx
0x1401d0452: xor    edx,edx
0x1401d0454: xor    r9d,r9d
0x1401d0457: jmp    0x1401d04d6
0x1401d0459: mov    edx,0x1
0x1401d045e: xor    r9d,r9d
0x1401d0461: jmp    0x1401d04d6
0x1401d0463: mov    edx,0x2
0x1401d0468: xor    r9d,r9d
0x1401d046b: jmp    0x1401d04d6
0x1401d046d: mov    edx,0x3
0x1401d0472: xor    r9d,r9d
0x1401d0475: jmp    0x1401d04d6
0x1401d0477: mov    edx,0x4
0x1401d047c: xor    r9d,r9d
0x1401d047f: jmp    0x1401d04d6
0x1401d0481: mov    edx,ebx
0x1401d0483: xor    r9d,r9d
0x1401d0486: jmp    0x1401d04d6
0x1401d0488: xor    r9d,r9d
0x1401d048b: jmp    0x1401d04d1
0x1401d048d: xor    edx,edx
0x1401d048f: mov    r9b,0x1
0x1401d0492: jmp    0x1401d04d6
0x1401d0494: mov    edx,0x1
0x1401d0499: movzx  r9d,dl
0x1401d049d: jmp    0x1401d04d6
0x1401d049f: mov    edx,0x2
0x1401d04a4: mov    r9b,0x1
0x1401d04a7: jmp    0x1401d04d6
0x1401d04a9: mov    edx,0x3
0x1401d04ae: mov    r9b,0x1
0x1401d04b1: jmp    0x1401d04d6
0x1401d04b3: mov    edx,0x4
0x1401d04b8: mov    r9b,0x1
0x1401d04bb: jmp    0x1401d04d6
0x1401d04bd: mov    edx,ebx
0x1401d04bf: mov    r9b,0x1
0x1401d04c2: jmp    0x1401d04d6
0x1401d04c4: mov    edx,0x6
0x1401d04c9: mov    r9b,0x1
0x1401d04cc: jmp    0x1401d04d6
0x1401d04ce: mov    r9b,0x1
0x1401d04d1: mov    edx,0x7
0x1401d04d6: xor    r8d,r8d
0x1401d04d9: lea    rcx,[rip+0x2479f10]        # 0x14264a3f0
0x1401d04e0: call   0x1400bb130
0x1401d04e5: mov    rdx,r15
0x1401d04e8: mov    rcx,rdi
0x1401d04eb: call   0x14006f220
0x1401d04f0: mov    rcx,QWORD PTR [rax]
0x1401d04f3: call   0x14006f330
0x1401d04f8: test   eax,eax
0x1401d04fa: jle    0x1401d0285
0x1401d0500: xor    ebx,ebx
0x1401d0502: mov    r14d,eax
0x1401d0505: mov    rdx,r15
0x1401d0508: mov    rcx,rdi
0x1401d050b: call   0x14006f220
0x1401d0510: mov    rdx,rbx
0x1401d0513: mov    rcx,QWORD PTR [rax]
0x1401d0516: call   0x1400fb540
0x1401d051b: mov    r8b,0x1
0x1401d051e: lea    rcx,[rip+0x2479ecb]        # 0x14264a3f0
0x1401d0525: cmp    BYTE PTR [rax],0x20
0x1401d0528: mov    dl,0x20
0x1401d052a: je     0x1401d052e
0x1401d052c: mov    dl,0xfe
0x1401d052e: call   0x1400bb190
0x1401d0533: inc    rbx
0x1401d0536: sub    r14,0x1
0x1401d053a: jne    0x1401d0505
0x1401d053c: jmp    0x1401d027c
0x1401d0541: add    rcx,0x83a0
0x1401d0548: movsxd rbx,esi
0x1401d054b: mov    rdx,rbx
0x1401d054e: call   0x14006f360
0x1401d0553: movsxd rcx,DWORD PTR [rax]
0x1401d0556: cmp    ecx,0xf
0x1401d0559: ja     0x1401d05f0
0x1401d055f: lea    rdx,[rip+0xffffffffffe2fa9a]        # 0x140000000
0x1401d0566: mov    ecx,DWORD PTR [rdx+rcx*4+0x1d3a7c]
0x1401d056d: add    rcx,rdx
0x1401d0570: jmp    rcx
0x1401d0572: xor    edx,edx
0x1401d0574: xor    r9d,r9d
0x1401d0577: jmp    0x1401d05f8
0x1401d0579: mov    edx,0x1
0x1401d057e: xor    r9d,r9d
0x1401d0581: jmp    0x1401d05f8
0x1401d0583: mov    edx,0x2
0x1401d0588: xor    r9d,r9d
0x1401d058b: jmp    0x1401d05f8
0x1401d058d: mov    edx,0x3
0x1401d0592: xor    r9d,r9d
0x1401d0595: jmp    0x1401d05f8
0x1401d0597: mov    edx,r15d
0x1401d059a: xor    r9d,r9d
0x1401d059d: jmp    0x1401d05f8
0x1401d059f: mov    edx,0x5
0x1401d05a4: xor    r9d,r9d
0x1401d05a7: jmp    0x1401d05f8
0x1401d05a9: xor    r9d,r9d
0x1401d05ac: jmp    0x1401d05f3
0x1401d05ae: xor    edx,edx
0x1401d05b0: mov    r9b,0x1
0x1401d05b3: jmp    0x1401d05f8
0x1401d05b5: mov    edx,0x1
0x1401d05ba: movzx  r9d,dl
0x1401d05be: jmp    0x1401d05f8
0x1401d05c0: mov    edx,0x2
0x1401d05c5: mov    r9b,0x1
0x1401d05c8: jmp    0x1401d05f8
0x1401d05ca: mov    edx,0x3
0x1401d05cf: mov    r9b,0x1
0x1401d05d2: jmp    0x1401d05f8
0x1401d05d4: mov    edx,r15d
0x1401d05d7: mov    r9b,0x1
0x1401d05da: jmp    0x1401d05f8
0x1401d05dc: mov    edx,0x5
0x1401d05e1: mov    r9b,0x1
0x1401d05e4: jmp    0x1401d05f8
0x1401d05e6: mov    edx,0x6
0x1401d05eb: mov    r9b,0x1
0x1401d05ee: jmp    0x1401d05f8
0x1401d05f0: mov    r9b,0x1
0x1401d05f3: mov    edx,0x7
0x1401d05f8: xor    r8d,r8d
0x1401d05fb: lea    rcx,[rip+0x2479dee]        # 0x14264a3f0
0x1401d0602: call   0x1400bb130
0x1401d0607: mov    rdx,rbx
0x1401d060a: mov    rcx,rdi
0x1401d060d: call   0x14006f220
0x1401d0612: xor    r9d,r9d
0x1401d0615: xor    r8d,r8d
0x1401d0618: mov    rdx,QWORD PTR [rax]
0x1401d061b: lea    rcx,[rip+0x2479dce]        # 0x14264a3f0
0x1401d0622: call   0x140ad9960
0x1401d0627: mov    ebx,0x5
0x1401d062c: jmp    0x1401d028b
0x1401d0631: mov    r13,QWORD PTR [rsp+0x78]
0x1401d0636: lea    rcx,[rbp+0x13b0]
0x1401d063d: call   0x140067e30
0x1401d0642: jmp    0x1401c6068
0x1401d0647: mov    rcx,QWORD PTR [rbx+0x83d8]
0x1401d064e: lea    r13d,[rsi+0x2]
0x1401d0652: mov    edx,DWORD PTR [rbp-0x60]
0x1401d0655: dec    edx
0x1401d0657: test   rcx,rcx
0x1401d065a: je     0x1401d0b2d
0x1401d0660: lea    ebx,[rdx-0x4]
0x1401d0663: mov    DWORD PTR [rsp+0x74],ebx
0x1401d0667: add    rcx,0x30
0x1401d066b: call   0x14006f450
0x1401d0670: mov    r15,rax
0x1401d0673: mov    QWORD PTR [rbp+0x18],rax
0x1401d0677: mov    rax,QWORD PTR [rsp+0x78]
0x1401d067c: mov    rcx,QWORD PTR [rax+0x83d8]
0x1401d0683: add    rcx,0xa8
0x1401d068a: call   0x14006f370
0x1401d068f: lea    r14d,[rax+r15*1]
0x1401d0693: mov    DWORD PTR [rbp-0x60],r14d
0x1401d0697: cmp    r14d,ebx
0x1401d069a: cmovle r12d,edi
0x1401d069e: mov    DWORD PTR [rbp-0x58],r12d
0x1401d06a2: xor    r8d,r8d
0x1401d06a5: mov    edx,0x3
0x1401d06aa: mov    r9b,0x1
0x1401d06ad: lea    rcx,[rip+0x2479d3c]        # 0x14264a3f0
0x1401d06b4: call   0x1400bb130
0x1401d06b9: lea    r8d,[rsi+0x2]
0x1401d06bd: mov    edx,0x1
0x1401d06c2: lea    rcx,[rip+0x2479d27]        # 0x14264a3f0
0x1401d06c9: call   0x1400bb120
0x1401d06ce: mov    rax,QWORD PTR [rsp+0x78]
0x1401d06d3: mov    rdx,QWORD PTR [rax+0x83d8]
0x1401d06da: lea    rcx,[rbp+0x13d0]
0x1401d06e1: call   0x14006f5d0
0x1401d06e6: nop
0x1401d06e7: sub    edi,esi
0x1401d06e9: lea    rcx,[rbp+0x13d0]
0x1401d06f0: call   0x14006f330
0x1401d06f5: lea    ecx,[rdi-0x2]
0x1401d06f8: movsxd rdx,ecx
0x1401d06fb: cmp    rax,rdx
0x1401d06fe: jb     0x1401d0762
0x1401d0700: lea    esi,[rdi-0x3]
0x1401d0703: test   esi,esi
0x1401d0705: js     0x1401d071d
0x1401d0707: movsxd rdx,edi
0x1401d070a: sub    rdx,0x3
0x1401d070e: xor    r8d,r8d
0x1401d0711: lea    rcx,[rbp+0x13d0]
0x1401d0718: call   0x1400e1230
0x1401d071d: cmp    esi,0x3
0x1401d0720: jle    0x1401d0762
0x1401d0722: movsxd rdx,edi
0x1401d0725: sub    rdx,0x6
0x1401d0729: lea    rcx,[rbp+0x13d0]
0x1401d0730: call   0x1400fb540
0x1401d0735: mov    BYTE PTR [rax],0x2e
0x1401d0738: lea    eax,[rdi-0x5]
0x1401d073b: movsxd rdx,eax
0x1401d073e: lea    rcx,[rbp+0x13d0]
0x1401d0745: call   0x1400fb540
0x1401d074a: mov    BYTE PTR [rax],0x2e
0x1401d074d: lea    eax,[rdi-0x4]
0x1401d0750: movsxd rdx,eax
0x1401d0753: lea    rcx,[rbp+0x13d0]
0x1401d075a: call   0x1400fb540
0x1401d075f: mov    BYTE PTR [rax],0x2e
0x1401d0762: xor    r9d,r9d
0x1401d0765: xor    r8d,r8d
0x1401d0768: lea    rdx,[rbp+0x13d0]
0x1401d076f: lea    rcx,[rip+0x2479c7a]        # 0x14264a3f0
0x1401d0776: call   0x140ad9960
0x1401d077b: test   r14d,r14d
0x1401d077e: jle    0x1401d0b17
0x1401d0784: mov    rdi,QWORD PTR [rsp+0x78]
0x1401d0789: mov    eax,DWORD PTR [rdi+0x83e0]
0x1401d078f: mov    ecx,r14d
0x1401d0792: sub    ecx,ebx
0x1401d0794: cmp    eax,ecx
0x1401d0796: cmovle ecx,eax
0x1401d0799: xor    esi,esi
0x1401d079b: mov    r12d,esi
0x1401d079e: test   ecx,ecx
0x1401d07a0: cmovns r12d,ecx
0x1401d07a4: lea    eax,[rbx+r12*1]
0x1401d07a8: mov    DWORD PTR [rbp-0x28],eax
0x1401d07ab: cmp    r12d,eax
0x1401d07ae: jge    0x1401d0aa4
0x1401d07b4: mov    eax,r15d
0x1401d07b7: sub    eax,r12d
0x1401d07ba: add    eax,0x5
0x1401d07bd: mov    DWORD PTR [rbp-0x20],eax
0x1401d07c0: cmp    r12d,r14d
0x1401d07c3: jge    0x1401d0aa0
0x1401d07c9: mov    ebx,r12d
0x1401d07cc: sub    ebx,r15d
0x1401d07cf: lea    edx,[rax+rbx*1]
0x1401d07d2: mov    r8d,r13d
0x1401d07d5: lea    rcx,[rip+0x2479c14]        # 0x14264a3f0
0x1401d07dc: call   0x1400bb120
0x1401d07e1: lea    rcx,[rbp+0xf50]
0x1401d07e8: call   0x14006f690
0x1401d07ed: nop
0x1401d07ee: mov    rcx,QWORD PTR [rdi+0x83d8]
0x1401d07f5: cmp    r12d,r15d
0x1401d07f8: jge    0x1401d0971
0x1401d07fe: add    rcx,0x90
0x1401d0805: movsxd r15,r12d
0x1401d0808: mov    rdx,r15
0x1401d080b: call   0x14006f360
0x1401d0810: lea    rdx,[rbp+0xf50]
0x1401d0817: mov    ecx,DWORD PTR [rax]
0x1401d0819: call   0x14052e360
0x1401d081e: lea    rcx,[rbp+0xf50]
0x1401d0825: call   0x14052d650
0x1401d082a: lea    rdx,[rip+0x1417f0b]        # 0x1415e873c  ' '
0x1401d0831: lea    rcx,[rbp+0xf50]
0x1401d0838: call   0x14006f560
0x1401d083d: lea    rcx,[rbp+0x1610]
0x1401d0844: call   0x14006f690
0x1401d0849: nop
0x1401d084a: mov    rcx,QWORD PTR [rdi+0x83d8]
0x1401d0851: add    rcx,0x90
0x1401d0858: mov    rdx,r15
0x1401d085b: call   0x14006f360
0x1401d0860: mov    r14d,esi
0x1401d0863: cmp    DWORD PTR [rax],0x1
0x1401d0866: setle  r14b
0x1401d086a: mov    rcx,QWORD PTR [rdi+0x83d8]
0x1401d0871: add    rcx,0x78
0x1401d0875: mov    rdx,r15
0x1401d0878: call   0x14006f360
0x1401d087d: mov    esi,DWORD PTR [rax]
0x1401d087f: mov    rcx,QWORD PTR [rdi+0x83d8]
0x1401d0886: add    rcx,0x60
0x1401d088a: mov    rdx,r15
0x1401d088d: call   0x14006f440
0x1401d0892: movzx  edi,WORD PTR [rax]
0x1401d0895: mov    rax,QWORD PTR [rsp+0x78]
0x1401d089a: mov    rcx,QWORD PTR [rax+0x83d8]
0x1401d08a1: add    rcx,0x48
0x1401d08a5: mov    rdx,r15
0x1401d08a8: call   0x14006f440
0x1401d08ad: movzx  ebx,WORD PTR [rax]
0x1401d08b0: mov    rax,QWORD PTR [rsp+0x78]
0x1401d08b5: mov    rcx,QWORD PTR [rax+0x83d8]
0x1401d08bc: add    rcx,0x30
0x1401d08c0: mov    rdx,r15
0x1401d08c3: call   0x14006f440
0x1401d08c8: xor    ecx,ecx
0x1401d08ca: mov    DWORD PTR [rsp+0x68],ecx
0x1401d08ce: mov    DWORD PTR [rsp+0x60],ecx
0x1401d08d2: mov    BYTE PTR [rsp+0x58],0x1
0x1401d08d7: mov    DWORD PTR [rsp+0x50],0xffffffff
0x1401d08df: mov    DWORD PTR [rsp+0x48],0xffffffff
0x1401d08e7: mov    QWORD PTR [rsp+0x40],rcx
0x1401d08ec: mov    BYTE PTR [rsp+0x38],cl
0x1401d08f0: mov    DWORD PTR [rsp+0x30],ecx
0x1401d08f4: mov    DWORD PTR [rsp+0x28],r14d
0x1401d08f9: mov    DWORD PTR [rsp+0x20],esi
0x1401d08fd: movzx  r9d,di
0x1401d0901: movzx  r8d,bx
0x1401d0905: movzx  edx,WORD PTR [rax]
0x1401d0908: lea    rcx,[rbp+0x1610]
0x1401d090f: call   0x140a82c10
0x1401d0914: lea    rdx,[rbp+0x1610]
0x1401d091b: lea    rcx,[rbp+0xf50]
0x1401d0922: call   0x1400b9d10
0x1401d0927: xor    r8d,r8d
0x1401d092a: mov    edx,0x6
0x1401d092f: mov    r9b,0x1
0x1401d0932: lea    rcx,[rip+0x2479ab7]        # 0x14264a3f0
0x1401d0939: call   0x1400bb130
0x1401d093e: xor    r9d,r9d
0x1401d0941: xor    r8d,r8d
0x1401d0944: lea    rdx,[rbp+0xf50]
0x1401d094b: lea    rcx,[rip+0x2479a9e]        # 0x14264a3f0
0x1401d0952: call   0x140ad9960
0x1401d0957: nop
0x1401d0958: lea    rcx,[rbp+0x1610]
0x1401d095f: call   0x140067e30
0x1401d0964: mov    r14d,DWORD PTR [rbp-0x60]
0x1401d0968: mov    r15,QWORD PTR [rbp+0x18]
0x1401d096c: jmp    0x1401d0a7a
0x1401d0971: add    rcx,0xd8
0x1401d0978: movsxd rsi,ebx
0x1401d097b: mov    rdx,rsi
0x1401d097e: call   0x14006f360
0x1401d0983: lea    rdx,[rbp+0xf50]
0x1401d098a: mov    ecx,DWORD PTR [rax]
0x1401d098c: call   0x14052e360
0x1401d0991: lea    rcx,[rbp+0xf50]
0x1401d0998: call   0x14052d650
0x1401d099d: lea    rdx,[rip+0x1417d98]        # 0x1415e873c  ' '
0x1401d09a4: lea    rcx,[rbp+0xf50]
0x1401d09ab: call   0x14006f560
0x1401d09b0: lea    rcx,[rbp+0x1630]
0x1401d09b7: call   0x14006f690
0x1401d09bc: nop
0x1401d09bd: mov    rcx,QWORD PTR [rdi+0x83d8]
0x1401d09c4: add    rcx,0xc0
0x1401d09cb: mov    rdx,rsi
0x1401d09ce: call   0x14006f360
0x1401d09d3: movzx  edi,WORD PTR [rax]
0x1401d09d6: mov    rax,QWORD PTR [rsp+0x78]
0x1401d09db: mov    rcx,QWORD PTR [rax+0x83d8]
0x1401d09e2: add    rcx,0xd8
0x1401d09e9: mov    rdx,rsi
0x1401d09ec: call   0x14006f360
0x1401d09f1: cmp    DWORD PTR [rax],0x1
0x1401d09f4: setne  bl
0x1401d09f7: mov    rax,QWORD PTR [rsp+0x78]
0x1401d09fc: mov    rcx,QWORD PTR [rax+0x83d8]
0x1401d0a03: add    rcx,0xa8
0x1401d0a0a: mov    rdx,rsi
0x1401d0a0d: call   0x14006f360
0x1401d0a12: movzx  r9d,di
0x1401d0a16: movzx  r8d,bl
0x1401d0a1a: lea    rdx,[rbp+0x1630]
0x1401d0a21: movzx  ecx,WORD PTR [rax]
0x1401d0a24: call   0x140aa3bd0
0x1401d0a29: lea    rdx,[rbp+0x1630]
0x1401d0a30: lea    rcx,[rbp+0xf50]
0x1401d0a37: call   0x1400b9d10
0x1401d0a3c: xor    r8d,r8d
0x1401d0a3f: mov    edx,0x2
0x1401d0a44: mov    r9b,0x1
0x1401d0a47: lea    rcx,[rip+0x24799a2]        # 0x14264a3f0
0x1401d0a4e: call   0x1400bb130
0x1401d0a53: xor    r9d,r9d
0x1401d0a56: xor    r8d,r8d
0x1401d0a59: lea    rdx,[rbp+0xf50]
0x1401d0a60: lea    rcx,[rip+0x2479989]        # 0x14264a3f0
0x1401d0a67: call   0x140ad9960
0x1401d0a6c: nop
0x1401d0a6d: lea    rcx,[rbp+0x1630]
0x1401d0a74: call   0x140067e30
0x1401d0a79: nop
0x1401d0a7a: lea    rcx,[rbp+0xf50]
0x1401d0a81: call   0x140067e30
0x1401d0a86: inc    r12d
0x1401d0a89: cmp    r12d,DWORD PTR [rbp-0x28]
0x1401d0a8d: mov    eax,DWORD PTR [rbp-0x20]
0x1401d0a90: mov    rdi,QWORD PTR [rsp+0x78]
0x1401d0a95: mov    esi,0x0
0x1401d0a9a: jl     0x1401d07c0
0x1401d0aa0: mov    ebx,DWORD PTR [rsp+0x74]
0x1401d0aa4: cmp    r14d,ebx
0x1401d0aa7: jle    0x1401d0b17
0x1401d0aa9: add    ebx,0x3
0x1401d0aac: lea    rcx,[rbp+0x2b0]
0x1401d0ab3: call   0x1400bb360
0x1401d0ab8: lea    r9d,[r14-0x1]
0x1401d0abc: mov    DWORD PTR [rsp+0x30],ebx
0x1401d0ac0: mov    DWORD PTR [rsp+0x28],0x6
0x1401d0ac8: mov    eax,DWORD PTR [rsp+0x74]
0x1401d0acc: mov    DWORD PTR [rsp+0x20],eax
0x1401d0ad0: xor    r8d,r8d
0x1401d0ad3: mov    r13,QWORD PTR [rsp+0x78]
0x1401d0ad8: mov    edx,DWORD PTR [r13+0x83e0]
0x1401d0adf: lea    rcx,[rbp+0x2b0]
0x1401d0ae6: call   0x1400bb380
0x1401d0aeb: mov    r9d,DWORD PTR [rbp-0x58]
0x1401d0aef: dec    r9d
0x1401d0af2: mov    DWORD PTR [rsp+0x28],esi
0x1401d0af6: movzx  eax,BYTE PTR [r13+0x83e4]
0x1401d0afe: mov    BYTE PTR [rsp+0x20],al
0x1401d0b02: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401d0b06: mov    edx,DWORD PTR [rbp-0x38]
0x1401d0b09: lea    rcx,[rbp+0x2b0]
0x1401d0b10: call   0x14140f4d0
0x1401d0b15: jmp    0x1401d0b1c
0x1401d0b17: mov    r13,QWORD PTR [rsp+0x78]
0x1401d0b1c: lea    rcx,[rbp+0x13d0]
0x1401d0b23: call   0x140067e30
0x1401d0b28: jmp    0x1401c6068
0x1401d0b2d: mov    eax,0x55555556
0x1401d0b32: imul   edx
0x1401d0b34: mov    r15d,edx
0x1401d0b37: shr    r15d,0x1f
0x1401d0b3b: add    r15d,edx
0x1401d0b3e: mov    DWORD PTR [rbp-0x28],r15d
0x1401d0b42: lea    rcx,[rbx+0x8348]
0x1401d0b49: call   0x14006f370
0x1401d0b4e: mov    r14,rax
0x1401d0b51: lea    rcx,[rbx+0x8330]
0x1401d0b58: call   0x14006f370
0x1401d0b5d: add    r14d,eax
0x1401d0b60: mov    QWORD PTR [rbp+0x18],r14
0x1401d0b64: cmp    r14d,r15d
0x1401d0b67: cmovle r12d,edi
0x1401d0b6b: sub    r12d,0x2
0x1401d0b6f: mov    DWORD PTR [rbp-0x58],r12d
0x1401d0b73: test   r14d,r14d
0x1401d0b76: jle    0x1401d0ee1
0x1401d0b7c: mov    DWORD PTR [rbp-0x48],0x1
0x1401d0b83: mov    eax,DWORD PTR [rbx+0x8360]
0x1401d0b89: mov    ecx,r14d
0x1401d0b8c: sub    ecx,r15d
0x1401d0b8f: cmp    eax,ecx
0x1401d0b91: cmovle ecx,eax
0x1401d0b94: xor    edx,edx
0x1401d0b96: mov    edi,edx
0x1401d0b98: test   ecx,ecx
0x1401d0b9a: cmovns edi,ecx
0x1401d0b9d: mov    DWORD PTR [rsp+0x74],edi
0x1401d0ba1: lea    eax,[r15+rdi*1]
0x1401d0ba5: mov    DWORD PTR [rbp-0x60],eax
0x1401d0ba8: cmp    edi,eax
0x1401d0baa: jge    0x1401d0e60
0x1401d0bb0: lea    r15,[rbx+0x8348]
0x1401d0bb7: mov    QWORD PTR [rbp+0x30],r15
0x1401d0bbb: lea    rsi,[rbx+0x8330]
0x1401d0bc2: mov    QWORD PTR [rbp+0x48],rsi
0x1401d0bc6: cmp    edi,r14d
0x1401d0bc9: jge    0x1401d0e5c
0x1401d0bcf: mov    QWORD PTR [rbp-0x30],rdx
0x1401d0bd3: mov    QWORD PTR [rbp-0x78],rdx
0x1401d0bd7: mov    rcx,rsi
0x1401d0bda: call   0x14006f370
0x1401d0bdf: mov    rcx,rsi
0x1401d0be2: cmp    edi,eax
0x1401d0be4: jge    0x1401d0c06
0x1401d0be6: movsxd rdx,edi
0x1401d0be9: call   0x14006f360
0x1401d0bee: movsxd rdx,DWORD PTR [rax]
0x1401d0bf1: lea    rcx,[rip+0x2312d10]        # 0x1424e3908
0x1401d0bf8: call   0x14006f220
0x1401d0bfd: mov    rax,QWORD PTR [rax]
0x1401d0c00: mov    QWORD PTR [rbp-0x30],rax
0x1401d0c04: jmp    0x1401d0c4c
0x1401d0c06: call   0x14006f370
0x1401d0c0b: mov    ecx,edi
0x1401d0c0d: sub    ecx,eax
0x1401d0c0f: movsxd rbx,ecx
0x1401d0c12: mov    rcx,r15
0x1401d0c15: call   0x14006f370
0x1401d0c1a: cmp    rbx,rax
0x1401d0c1d: jae    0x1401d0c4c
0x1401d0c1f: mov    rcx,rsi
0x1401d0c22: call   0x14006f370
0x1401d0c27: mov    ecx,edi
0x1401d0c29: sub    ecx,eax
0x1401d0c2b: movsxd rdx,ecx
0x1401d0c2e: mov    rcx,r15
0x1401d0c31: call   0x14006f360
0x1401d0c36: movsxd rdx,DWORD PTR [rax]
0x1401d0c39: lea    rcx,[rip+0x2312ce0]        # 0x1424e3920
0x1401d0c40: call   0x14006f220
0x1401d0c45: mov    rcx,QWORD PTR [rax]
0x1401d0c48: mov    QWORD PTR [rbp-0x78],rcx
0x1401d0c4c: xor    r8d,r8d
0x1401d0c4f: mov    edx,0x7
0x1401d0c54: mov    r9b,0x1
0x1401d0c57: lea    rcx,[rip+0x2479792]        # 0x14264a3f0
0x1401d0c5e: call   0x1400bb130
0x1401d0c63: mov    esi,r13d
0x1401d0c66: cmp    r13d,r12d
0x1401d0c69: jg     0x1401d0d13
0x1401d0c6f: mov    eax,DWORD PTR [rbp-0x48]
0x1401d0c72: lea    r15d,[rax+0x3]
0x1401d0c76: movsxd r14,r13d
0x1401d0c79: nop    DWORD PTR [rax+0x0]
0x1401d0c80: mov    edi,eax
0x1401d0c82: cmp    eax,r15d
0x1401d0c85: jge    0x1401d0cf9
0x1401d0c87: movsxd r12,r12d
0x1401d0c8a: lea    rbx,[rip+0x247b11f]        # 0x14264bdb0
0x1401d0c91: mov    r8d,esi
0x1401d0c94: mov    edx,edi
0x1401d0c96: lea    rcx,[rip+0x2479753]        # 0x14264a3f0
0x1401d0c9d: call   0x1400bb120
0x1401d0ca2: cmp    esi,r13d
0x1401d0ca5: jne    0x1401d0cac
0x1401d0ca7: mov    edx,DWORD PTR [rbx-0x18]
0x1401d0caa: jmp    0x1401d0cb8
0x1401d0cac: cmp    r14,r12
0x1401d0caf: jne    0x1401d0cb5
0x1401d0cb1: mov    edx,DWORD PTR [rbx]
0x1401d0cb3: jmp    0x1401d0cb8
0x1401d0cb5: mov    edx,DWORD PTR [rbx-0xc]
0x1401d0cb8: lea    rcx,[rip+0x2479731]        # 0x14264a3f0
0x1401d0cbf: call   0x140adaad0
0x1401d0cc4: xor    edx,edx
0x1401d0cc6: lea    rcx,[rip+0x21fcaa3]        # 0x1423cd770
0x1401d0ccd: call   0x140071f90
0x1401d0cd2: test   al,al
0x1401d0cd4: je     0x1401d0ce7
0x1401d0cd6: mov    r8b,0x1
0x1401d0cd9: xor    edx,edx
0x1401d0cdb: lea    rcx,[rip+0x247970e]        # 0x14264a3f0
0x1401d0ce2: call   0x1400bb190
0x1401d0ce7: inc    edi
0x1401d0ce9: add    rbx,0x4
0x1401d0ced: cmp    edi,r15d
0x1401d0cf0: jl     0x1401d0c91
0x1401d0cf2: mov    r12d,DWORD PTR [rbp-0x58]
0x1401d0cf6: mov    eax,DWORD PTR [rbp-0x48]
0x1401d0cf9: inc    esi
0x1401d0cfb: inc    r14
0x1401d0cfe: cmp    esi,r12d
0x1401d0d01: jle    0x1401d0c80
0x1401d0d07: mov    edi,DWORD PTR [rsp+0x74]
0x1401d0d0b: mov    r14,QWORD PTR [rbp+0x18]
0x1401d0d0f: mov    r15,QWORD PTR [rbp+0x30]
0x1401d0d13: mov    esi,DWORD PTR [rbp-0x48]
0x1401d0d16: lea    edx,[rsi+0x1]
0x1401d0d19: mov    r8d,r13d
0x1401d0d1c: lea    rcx,[rip+0x24796cd]        # 0x14264a3f0
0x1401d0d23: call   0x1400bb120
0x1401d0d28: lea    rcx,[rbp+0x13f0]
0x1401d0d2f: call   0x14006f690
0x1401d0d34: nop
0x1401d0d35: mov    rbx,QWORD PTR [rbp-0x30]
0x1401d0d39: test   rbx,rbx
0x1401d0d3c: je     0x1401d0d6f
0x1401d0d3e: xor    r8d,r8d
0x1401d0d41: mov    edx,0x6
0x1401d0d46: lea    rcx,[rip+0x24796a3]        # 0x14264a3f0
0x1401d0d4d: test   BYTE PTR [rbx+0x48],0x1
0x1401d0d51: je     0x1401d0d61
0x1401d0d53: xor    r9d,r9d
0x1401d0d56: call   0x1400bb130
0x1401d0d5b: lea    rdx,[rbx+0x28]
0x1401d0d5f: jmp    0x1401d0d9d
0x1401d0d61: mov    r9b,0x1
0x1401d0d64: call   0x1400bb130
0x1401d0d69: lea    rdx,[rbx+0x28]
0x1401d0d6d: jmp    0x1401d0d9d
0x1401d0d6f: mov    rbx,QWORD PTR [rbp-0x78]
0x1401d0d73: test   rbx,rbx
0x1401d0d76: je     0x1401d0db7
0x1401d0d78: xor    r8d,r8d
0x1401d0d7b: mov    edx,0x6
0x1401d0d80: lea    rcx,[rip+0x2479669]        # 0x14264a3f0
0x1401d0d87: test   BYTE PTR [rbx+0x20],0x1
0x1401d0d8b: je     0x1401d0d92
0x1401d0d8d: xor    r9d,r9d
0x1401d0d90: jmp    0x1401d0d95
0x1401d0d92: mov    r9b,0x1
0x1401d0d95: call   0x1400bb130
0x1401d0d9a: mov    rdx,rbx
0x1401d0d9d: mov    r9d,DWORD PTR [rip+0x21fc9e0]        # 0x1423cd784
0x1401d0da4: add    r9d,0xfffffffd
0x1401d0da8: xor    r8d,r8d
0x1401d0dab: lea    rcx,[rip+0x247963e]        # 0x14264a3f0
0x1401d0db2: call   0x140ad9960
0x1401d0db7: lea    rcx,[rbp+0x13f0]
0x1401d0dbe: call   0x14006f330
0x1401d0dc3: cmp    rax,0x34
0x1401d0dc7: jb     0x1401d0e19
0x1401d0dc9: xor    r8d,r8d
0x1401d0dcc: mov    edx,0x33
0x1401d0dd1: lea    rcx,[rbp+0x13f0]
0x1401d0dd8: call   0x1400e1230
0x1401d0ddd: mov    edx,0x30
0x1401d0de2: lea    rcx,[rbp+0x13f0]
0x1401d0de9: call   0x1400fb540
0x1401d0dee: mov    BYTE PTR [rax],0x2e
0x1401d0df1: mov    edx,0x31
0x1401d0df6: lea    rcx,[rbp+0x13f0]
0x1401d0dfd: call   0x1400fb540
0x1401d0e02: mov    BYTE PTR [rax],0x2e
0x1401d0e05: mov    edx,0x32
0x1401d0e0a: lea    rcx,[rbp+0x13f0]
0x1401d0e11: call   0x1400fb540
0x1401d0e16: mov    BYTE PTR [rax],0x2e
0x1401d0e19: xor    r9d,r9d
0x1401d0e1c: xor    r8d,r8d
0x1401d0e1f: lea    rdx,[rbp+0x13f0]
0x1401d0e26: lea    rcx,[rip+0x24795c3]        # 0x14264a3f0
0x1401d0e2d: call   0x140ad9960
0x1401d0e32: add    esi,0x3
0x1401d0e35: mov    DWORD PTR [rbp-0x48],esi
0x1401d0e38: lea    rcx,[rbp+0x13f0]
0x1401d0e3f: call   0x140067e30
0x1401d0e44: inc    edi
0x1401d0e46: mov    DWORD PTR [rsp+0x74],edi
0x1401d0e4a: cmp    edi,DWORD PTR [rbp-0x60]
0x1401d0e4d: mov    rsi,QWORD PTR [rbp+0x48]
0x1401d0e51: mov    edx,0x0
0x1401d0e56: jl     0x1401d0bc6
0x1401d0e5c: mov    r15d,DWORD PTR [rbp-0x28]
0x1401d0e60: cmp    r14d,r15d
0x1401d0e63: jle    0x1401c6063
0x1401d0e69: lea    ebx,[r15*2-0x1]
0x1401d0e71: add    ebx,r15d
0x1401d0e74: lea    rcx,[rbp+0x290]
0x1401d0e7b: call   0x1400bb360
0x1401d0e80: lea    r9d,[r14-0x1]
0x1401d0e84: mov    DWORD PTR [rsp+0x30],ebx
0x1401d0e88: mov    DWORD PTR [rsp+0x28],0x2
0x1401d0e90: mov    DWORD PTR [rsp+0x20],r15d
0x1401d0e95: xor    r8d,r8d
0x1401d0e98: mov    r13,QWORD PTR [rsp+0x78]
0x1401d0e9d: mov    edx,DWORD PTR [r13+0x8360]
0x1401d0ea4: lea    rcx,[rbp+0x290]
0x1401d0eab: call   0x1400bb380
0x1401d0eb0: lea    r9d,[r12+0x1]
0x1401d0eb5: mov    DWORD PTR [rsp+0x28],0x0
0x1401d0ebd: movzx  eax,BYTE PTR [r13+0x8364]
0x1401d0ec5: mov    BYTE PTR [rsp+0x20],al
0x1401d0ec9: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401d0ecd: mov    edx,DWORD PTR [rbp-0x38]
0x1401d0ed0: lea    rcx,[rbp+0x290]
0x1401d0ed7: call   0x14140f4d0
0x1401d0edc: jmp    0x1401c6068
0x1401d0ee1: xor    r8d,r8d
0x1401d0ee4: mov    edx,0x6
0x1401d0ee9: mov    r9b,0x1
0x1401d0eec: lea    rcx,[rip+0x24794fd]        # 0x14264a3f0
0x1401d0ef3: call   0x1400bb130
0x1401d0ef8: lea    r8d,[rsi+0x2]
0x1401d0efc: mov    edx,0x1
0x1401d0f01: lea    rcx,[rip+0x24794e8]        # 0x14264a3f0
0x1401d0f08: call   0x1400bb120
0x1401d0f0d: lea    rdx,[rip+0x1433114]        # 0x141604028  'No reports available'
0x1401d0f14: lea    rcx,[rbp+0x3490]
0x1401d0f1b: call   0x140068150
0x1401d0f20: nop
0x1401d0f21: xor    r9d,r9d
0x1401d0f24: xor    r8d,r8d
0x1401d0f27: lea    rdx,[rbp+0x3490]
0x1401d0f2e: lea    rcx,[rip+0x24794bb]        # 0x14264a3f0
0x1401d0f35: call   0x140ad9960
0x1401d0f3a: nop
0x1401d0f3b: lea    rcx,[rbp+0x3490]
0x1401d0f42: jmp    0x1401c605e
0x1401d0f47: mov    ebx,DWORD PTR [rbp-0x18]
0x1401d0f4a: mov    DWORD PTR [rbp-0x60],ebx
0x1401d0f4d: lea    r15d,[rbx-0x39]
0x1401d0f51: mov    DWORD PTR [rbp-0x10],r15d
0x1401d0f55: mov    r12d,0x14
0x1401d0f5b: mov    eax,DWORD PTR [rip+0x21fc827]        # 0x1423cd788
0x1401d0f61: cmp    eax,0x2e
0x1401d0f64: jle    0x1401d0f7d
0x1401d0f66: lea    r12d,[rax-0x1a]
0x1401d0f6a: cmp    r12d,0x1e
0x1401d0f6e: jle    0x1401d0f7d
0x1401d0f70: mov    r12d,0x1e
0x1401d0f76: mov    edi,ebx
0x1401d0f78: mov    r14d,esi
0x1401d0f7b: jmp    0x1401d0f90
0x1401d0f7d: mov    edi,ebx
0x1401d0f7f: mov    r14d,esi
0x1401d0f82: test   r12d,r12d
0x1401d0f85: js     0x1401d1062
0x1401d0f8b: nop    DWORD PTR [rax+rax*1+0x0]
0x1401d0f90: mov    ebx,r15d
0x1401d0f93: cmp    r15d,edi
0x1401d0f96: jg     0x1401d1050
0x1401d0f9c: movsxd r13,r12d
0x1401d0f9f: nop
0x1401d0fa0: mov    r8d,ebx
0x1401d0fa3: mov    edx,r14d
0x1401d0fa6: lea    rcx,[rip+0x2479443]        # 0x14264a3f0
0x1401d0fad: call   0x1400bb120
0x1401d0fb2: xor    r8d,r8d
0x1401d0fb5: xor    edx,edx
0x1401d0fb7: lea    rcx,[rip+0x2479432]        # 0x14264a3f0
0x1401d0fbe: call   0x1400bb190
0x1401d0fc3: test   rsi,rsi
0x1401d0fc6: jne    0x1401d0ff0
0x1401d0fc8: cmp    ebx,r15d
0x1401d0fcb: jne    0x1401d0fd5
0x1401d0fcd: mov    edx,DWORD PTR [rip+0x247ad41]        # 0x14264bd14
0x1401d0fd3: jmp    0x1401d103a
0x1401d0fd5: lea    rcx,[rip+0x2479414]        # 0x14264a3f0
0x1401d0fdc: cmp    ebx,edi
0x1401d0fde: jne    0x1401d0fe8
0x1401d0fe0: mov    edx,DWORD PTR [rip+0x247ad46]        # 0x14264bd2c
0x1401d0fe6: jmp    0x1401d1041
0x1401d0fe8: mov    edx,DWORD PTR [rip+0x247ad32]        # 0x14264bd20
0x1401d0fee: jmp    0x1401d1041
0x1401d0ff0: cmp    rsi,r13
0x1401d0ff3: jne    0x1401d101d
0x1401d0ff5: cmp    ebx,r15d
0x1401d0ff8: jne    0x1401d1002
0x1401d0ffa: mov    edx,DWORD PTR [rip+0x247ad1c]        # 0x14264bd1c
0x1401d1000: jmp    0x1401d103a
0x1401d1002: lea    rcx,[rip+0x24793e7]        # 0x14264a3f0
0x1401d1009: cmp    ebx,edi
0x1401d100b: jne    0x1401d1015
0x1401d100d: mov    edx,DWORD PTR [rip+0x247ad21]        # 0x14264bd34
0x1401d1013: jmp    0x1401d1041
0x1401d1015: mov    edx,DWORD PTR [rip+0x247ad0d]        # 0x14264bd28
0x1401d101b: jmp    0x1401d1041
0x1401d101d: cmp    ebx,r15d
0x1401d1020: jne    0x1401d102a
0x1401d1022: mov    edx,DWORD PTR [rip+0x247acf0]        # 0x14264bd18
0x1401d1028: jmp    0x1401d103a
0x1401d102a: cmp    ebx,edi
0x1401d102c: mov    edx,DWORD PTR [rip+0x247acfe]        # 0x14264bd30
0x1401d1032: je     0x1401d103a
0x1401d1034: mov    edx,DWORD PTR [rip+0x247acea]        # 0x14264bd24
0x1401d103a: lea    rcx,[rip+0x24793af]        # 0x14264a3f0
0x1401d1041: call   0x140adaad0
0x1401d1046: inc    ebx
0x1401d1048: cmp    ebx,edi
0x1401d104a: jle    0x1401d0fa0
0x1401d1050: inc    r14d
0x1401d1053: inc    rsi
0x1401d1056: cmp    r14d,r12d
0x1401d1059: jle    0x1401d0f90
0x1401d105f: mov    ebx,DWORD PTR [rbp-0x60]
0x1401d1062: lea    r14d,[r15+0x2]
0x1401d1066: lea    r13d,[rbx-0x2]
0x1401d106a: mov    DWORD PTR [rsp+0x74],r13d
0x1401d106f: lea    ecx,[r12-0x1]
0x1401d1074: mov    eax,0x55555556
0x1401d1079: imul   ecx
0x1401d107b: mov    edi,edx
0x1401d107d: shr    edi,0x1f
0x1401d1080: add    edi,edx
0x1401d1082: mov    DWORD PTR [rbp-0x58],edi
0x1401d1085: mov    r12,QWORD PTR [rsp+0x78]
0x1401d108a: lea    rcx,[r12+0x83e8]
0x1401d1092: call   0x14006ee50
0x1401d1097: mov    rsi,rax
0x1401d109a: mov    QWORD PTR [rbp-0x30],rax
0x1401d109e: cmp    eax,edi
0x1401d10a0: jle    0x1401d10ab
0x1401d10a2: lea    r13d,[rbx-0x4]
0x1401d10a6: mov    DWORD PTR [rsp+0x74],r13d
0x1401d10ab: mov    QWORD PTR [rbp-0x20],0x0
0x1401d10b3: mov    ecx,DWORD PTR [r12+0x8400]
0x1401d10bb: mov    edx,eax
0x1401d10bd: sub    edx,edi
0x1401d10bf: cmp    ecx,edx
0x1401d10c1: cmovle edx,ecx
0x1401d10c4: xor    r12d,r12d
0x1401d10c7: test   edx,edx
0x1401d10c9: cmovns r12d,edx
0x1401d10cd: mov    DWORD PTR [rbp-0x68],r12d
0x1401d10d1: lea    eax,[rdi+r12*1]
0x1401d10d5: mov    DWORD PTR [rbp-0x28],eax
0x1401d10d8: cmp    r12d,eax
0x1401d10db: mov    eax,DWORD PTR [rbp+0x20]
0x1401d10de: mov    DWORD PTR [rsp+0x70],eax
0x1401d10e2: jge    0x1401d1702
0x1401d10e8: mov    rdi,QWORD PTR [rsp+0x78]
0x1401d10ed: lea    rcx,[rdi+0x83e8]
0x1401d10f4: mov    QWORD PTR [rbp+0x30],rcx
0x1401d10f8: mov    ebx,0x4
0x1401d10fd: mov    QWORD PTR [rbp-0x78],rbx
0x1401d1101: cmp    r12d,esi
0x1401d1104: jge    0x1401d16fb
0x1401d110a: movsxd rdx,r12d
0x1401d110d: call   0x14006f220
0x1401d1112: mov    r15,QWORD PTR [rax]
0x1401d1115: mov    QWORD PTR [rbp+0x18],r15
0x1401d1119: cmp    BYTE PTR [rip+0x21bf4b5],0x0        # 0x1423905d5
0x1401d1120: je     0x1401d1177
0x1401d1122: mov    eax,DWORD PTR [rbp-0x38]
0x1401d1125: cmp    eax,r14d
0x1401d1128: jl     0x1401d1177
0x1401d112a: cmp    eax,r13d
0x1401d112d: jg     0x1401d1177
0x1401d112f: lea    eax,[rbx-0x3]
0x1401d1132: mov    ecx,DWORD PTR [rbp-0x3c]
0x1401d1135: cmp    ecx,eax
0x1401d1137: jl     0x1401d1177
0x1401d1139: lea    eax,[rbx-0x1]
0x1401d113c: cmp    ecx,eax
0x1401d113e: jg     0x1401d1177
0x1401d1140: cmp    QWORD PTR [rdi+0x8408],r15
0x1401d1147: je     0x1401d116c
0x1401d1149: mov    QWORD PTR [rdi+0x8408],r15
0x1401d1150: mov    rdx,r15
0x1401d1153: mov    rcx,rdi
0x1401d1156: call   0x1401d9b20
0x1401d115b: mov    edx,0x2
0x1401d1160: lea    rcx,[rip+0x2479289]        # 0x14264a3f0
0x1401d1167: call   0x140ae7c00
0x1401d116c: mov    QWORD PTR [rbp-0x20],r15
0x1401d1170: lea    eax,[rbx-0x4]
0x1401d1173: mov    DWORD PTR [rsp+0x70],eax
0x1401d1177: xor    r8d,r8d
0x1401d117a: mov    edx,0x7
0x1401d117f: mov    r9b,0x1
0x1401d1182: lea    rcx,[rip+0x2479267]        # 0x14264a3f0
0x1401d1189: call   0x1400bb130
0x1401d118e: mov    esi,r14d
0x1401d1191: cmp    r14d,r13d
0x1401d1194: jg     0x1401d1243
0x1401d119a: movsxd r15,r14d
0x1401d119d: lea    eax,[rbx-0x3]
0x1401d11a0: mov    DWORD PTR [rbp-0x60],eax
0x1401d11a3: mov    edi,eax
0x1401d11a5: cmp    eax,ebx
0x1401d11a7: jge    0x1401d122d
0x1401d11ad: movsxd r12,r13d
0x1401d11b0: lea    rbx,[rip+0x247abf9]        # 0x14264bdb0
0x1401d11b7: mov    r13,QWORD PTR [rbp-0x78]
0x1401d11bb: nop    DWORD PTR [rax+rax*1+0x0]
0x1401d11c0: mov    r8d,esi
0x1401d11c3: mov    edx,edi
0x1401d11c5: lea    rcx,[rip+0x2479224]        # 0x14264a3f0
0x1401d11cc: call   0x1400bb120
0x1401d11d1: cmp    esi,r14d
0x1401d11d4: jne    0x1401d11db
0x1401d11d6: mov    edx,DWORD PTR [rbx-0x18]
0x1401d11d9: jmp    0x1401d11e7
0x1401d11db: cmp    r15,r12
0x1401d11de: jne    0x1401d11e4
0x1401d11e0: mov    edx,DWORD PTR [rbx]
0x1401d11e2: jmp    0x1401d11e7
0x1401d11e4: mov    edx,DWORD PTR [rbx-0xc]
0x1401d11e7: lea    rcx,[rip+0x2479202]        # 0x14264a3f0
0x1401d11ee: call   0x140adaad0
0x1401d11f3: xor    edx,edx
0x1401d11f5: lea    rcx,[rip+0x21fc574]        # 0x1423cd770
0x1401d11fc: call   0x140071f90
0x1401d1201: test   al,al
0x1401d1203: je     0x1401d1216
0x1401d1205: mov    r8b,0x1
0x1401d1208: xor    edx,edx
0x1401d120a: lea    rcx,[rip+0x24791df]        # 0x14264a3f0
0x1401d1211: call   0x1400bb190
0x1401d1216: inc    edi
0x1401d1218: add    rbx,0x4
0x1401d121c: cmp    edi,r13d
0x1401d121f: jl     0x1401d11c0
0x1401d1221: mov    r13d,DWORD PTR [rsp+0x74]
0x1401d1226: mov    eax,DWORD PTR [rbp-0x60]
0x1401d1229: mov    rbx,QWORD PTR [rbp-0x78]
0x1401d122d: inc    esi
0x1401d122f: inc    r15
0x1401d1232: cmp    esi,r13d
0x1401d1235: jle    0x1401d11a3
0x1401d123b: mov    r15,QWORD PTR [rbp+0x18]
0x1401d123f: mov    r12d,DWORD PTR [rbp-0x68]
0x1401d1243: xor    r8d,r8d
0x1401d1246: mov    edx,0x3
0x1401d124b: mov    r9b,0x1
0x1401d124e: lea    rcx,[rip+0x247919b]        # 0x14264a3f0
0x1401d1255: call   0x1400bb130
0x1401d125a: lea    edx,[rbx-0x2]
0x1401d125d: mov    r8d,r14d
0x1401d1260: lea    rcx,[rip+0x2479189]        # 0x14264a3f0
0x1401d1267: call   0x1400bb120
0x1401d126c: lea    rcx,[rbp+0x12f0]
0x1401d1273: call   0x14006f690
0x1401d1278: nop
0x1401d1279: lea    rcx,[rbp+0x400]
0x1401d1280: call   0x140072080
0x1401d1285: mov    WORD PTR [rsp+0x28],0x2
0x1401d128c: mov    WORD PTR [rsp+0x20],0x1
0x1401d1293: lea    r9,[rbp+0x400]
0x1401d129a: mov    r8d,DWORD PTR [r15+0xe0]
0x1401d12a1: lea    rdx,[rbp+0x12f0]
0x1401d12a8: lea    rcx,[rip+0x2328a09]        # 0x1424f9cb8
0x1401d12af: call   0x140b92f10
0x1401d12b4: mov    ebx,r13d
0x1401d12b7: sub    ebx,r14d
0x1401d12ba: lea    rcx,[rbp+0x12f0]
0x1401d12c1: call   0x14006f330
0x1401d12c6: lea    ecx,[rbx-0x2]
0x1401d12c9: movsxd rdx,ecx
0x1401d12cc: cmp    rax,rdx
0x1401d12cf: jb     0x1401d1333
0x1401d12d1: lea    edi,[rbx-0x3]
0x1401d12d4: test   edi,edi
0x1401d12d6: js     0x1401d12ee
0x1401d12d8: movsxd rdx,ebx
0x1401d12db: sub    rdx,0x3
0x1401d12df: xor    r8d,r8d
0x1401d12e2: lea    rcx,[rbp+0x12f0]
0x1401d12e9: call   0x1400e1230
0x1401d12ee: cmp    edi,0x3
0x1401d12f1: jle    0x1401d1333
0x1401d12f3: movsxd rdx,ebx
0x1401d12f6: sub    rdx,0x6
0x1401d12fa: lea    rcx,[rbp+0x12f0]
0x1401d1301: call   0x1400fb540
0x1401d1306: mov    BYTE PTR [rax],0x2e
0x1401d1309: lea    eax,[rbx-0x5]
0x1401d130c: movsxd rdx,eax
0x1401d130f: lea    rcx,[rbp+0x12f0]
0x1401d1316: call   0x1400fb540
0x1401d131b: mov    BYTE PTR [rax],0x2e
0x1401d131e: lea    eax,[rbx-0x4]
0x1401d1321: movsxd rdx,eax
0x1401d1324: lea    rcx,[rbp+0x12f0]
0x1401d132b: call   0x1400fb540
0x1401d1330: mov    BYTE PTR [rax],0x2e
0x1401d1333: xor    r9d,r9d
0x1401d1336: xor    r8d,r8d
0x1401d1339: lea    rdx,[rbp+0x12f0]
0x1401d1340: lea    rcx,[rip+0x24790a9]        # 0x14264a3f0
0x1401d1347: call   0x140ad9960
0x1401d134c: mov    rax,QWORD PTR [r15+0x130]
0x1401d1353: test   rax,rax
0x1401d1356: je     0x1401d16c6
0x1401d135c: cmp    QWORD PTR [rax+0x28],0x0
0x1401d1361: je     0x1401d16c6
0x1401d1367: lea    r8d,[r14+0x1]
0x1401d136b: mov    rdx,QWORD PTR [rbp-0x78]
0x1401d136f: dec    edx
0x1401d1371: lea    rcx,[rip+0x2479078]        # 0x14264a3f0
0x1401d1378: call   0x1400bb120
0x1401d137d: mov    rcx,QWORD PTR [r15+0x130]
0x1401d1384: mov    rax,QWORD PTR [rcx+0x28]
0x1401d1388: cmp    DWORD PTR [rax+0x4],0xffffffff
0x1401d138c: je     0x1401d1476
0x1401d1392: lea    rdx,[rip+0x1432ca7]        # 0x141604040  'Last in '
0x1401d1399: lea    rcx,[rbp+0x1290]
0x1401d13a0: call   0x140068150
0x1401d13a5: nop
0x1401d13a6: mov    rax,QWORD PTR [r15+0x130]
0x1401d13ad: mov    r8,QWORD PTR [rax+0x28]
0x1401d13b1: xor    r9d,r9d
0x1401d13b4: mov    r8d,DWORD PTR [r8+0x4]
0x1401d13b8: lea    rdx,[rbp+0x1290]
0x1401d13bf: lea    rcx,[rip+0x23288f2]        # 0x1424f9cb8
0x1401d13c6: call   0x140b93930
0x1401d13cb: lea    rcx,[rbp+0x1290]
0x1401d13d2: call   0x14006f330
0x1401d13d7: mov    ecx,r13d
0x1401d13da: sub    ecx,r14d
0x1401d13dd: sub    ecx,0x3
0x1401d13e0: movsxd rcx,ecx
0x1401d13e3: cmp    rax,rcx
0x1401d13e6: jb     0x1401d1450
0x1401d13e8: mov    ebx,r13d
0x1401d13eb: sub    ebx,r14d
0x1401d13ee: lea    edi,[rbx-0x4]
0x1401d13f1: test   edi,edi
0x1401d13f3: js     0x1401d140b
0x1401d13f5: movsxd rdx,ebx
0x1401d13f8: sub    rdx,0x4
0x1401d13fc: xor    r8d,r8d
0x1401d13ff: lea    rcx,[rbp+0x1290]
0x1401d1406: call   0x1400e1230
0x1401d140b: cmp    edi,0x3
0x1401d140e: jle    0x1401d1450
0x1401d1410: movsxd rdx,ebx
0x1401d1413: sub    rdx,0x7
0x1401d1417: lea    rcx,[rbp+0x1290]
0x1401d141e: call   0x1400fb540
0x1401d1423: mov    BYTE PTR [rax],0x2e
0x1401d1426: lea    eax,[rbx-0x6]
0x1401d1429: movsxd rdx,eax
0x1401d142c: lea    rcx,[rbp+0x1290]
0x1401d1433: call   0x1400fb540
0x1401d1438: mov    BYTE PTR [rax],0x2e
0x1401d143b: lea    eax,[rbx-0x5]
0x1401d143e: movsxd rdx,eax
0x1401d1441: lea    rcx,[rbp+0x1290]
0x1401d1448: call   0x1400fb540
0x1401d144d: mov    BYTE PTR [rax],0x2e
0x1401d1450: xor    r9d,r9d
0x1401d1453: xor    r8d,r8d
0x1401d1456: lea    rdx,[rbp+0x1290]
0x1401d145d: lea    rcx,[rip+0x2478f8c]        # 0x14264a3f0
0x1401d1464: call   0x140ad9960
0x1401d1469: nop
0x1401d146a: lea    rcx,[rbp+0x1290]
0x1401d1471: jmp    0x1401d16c1
0x1401d1476: cmp    DWORD PTR [rax+0x8],0xffffffff
0x1401d147a: je     0x1401d1564
0x1401d1480: lea    rdx,[rip+0x1432bb9]        # 0x141604040  'Last in '
0x1401d1487: lea    rcx,[rbp+0x12b0]
0x1401d148e: call   0x140068150
0x1401d1493: nop
0x1401d1494: mov    rax,QWORD PTR [r15+0x130]
0x1401d149b: mov    r8,QWORD PTR [rax+0x28]
0x1401d149f: xor    r9d,r9d
0x1401d14a2: mov    r8d,DWORD PTR [r8+0x8]
0x1401d14a6: lea    rdx,[rbp+0x12b0]
0x1401d14ad: lea    rcx,[rip+0x2328804]        # 0x1424f9cb8
0x1401d14b4: call   0x140b94a40
0x1401d14b9: lea    rcx,[rbp+0x12b0]
0x1401d14c0: call   0x14006f330
0x1401d14c5: mov    ecx,r13d
0x1401d14c8: sub    ecx,r14d
0x1401d14cb: sub    ecx,0x3
0x1401d14ce: movsxd rcx,ecx
0x1401d14d1: cmp    rax,rcx
0x1401d14d4: jb     0x1401d153e
0x1401d14d6: mov    ebx,r13d
0x1401d14d9: sub    ebx,r14d
0x1401d14dc: lea    edi,[rbx-0x4]
0x1401d14df: test   edi,edi
0x1401d14e1: js     0x1401d14f9
0x1401d14e3: movsxd rdx,ebx
0x1401d14e6: sub    rdx,0x4
0x1401d14ea: xor    r8d,r8d
0x1401d14ed: lea    rcx,[rbp+0x12b0]
0x1401d14f4: call   0x1400e1230
0x1401d14f9: cmp    edi,0x3
0x1401d14fc: jle    0x1401d153e
0x1401d14fe: movsxd rdx,ebx
0x1401d1501: sub    rdx,0x7
0x1401d1505: lea    rcx,[rbp+0x12b0]
0x1401d150c: call   0x1400fb540
0x1401d1511: mov    BYTE PTR [rax],0x2e
0x1401d1514: lea    eax,[rbx-0x6]
0x1401d1517: movsxd rdx,eax
0x1401d151a: lea    rcx,[rbp+0x12b0]
0x1401d1521: call   0x1400fb540
0x1401d1526: mov    BYTE PTR [rax],0x2e
0x1401d1529: lea    eax,[rbx-0x5]
0x1401d152c: movsxd rdx,eax
0x1401d152f: lea    rcx,[rbp+0x12b0]
0x1401d1536: call   0x1400fb540
0x1401d153b: mov    BYTE PTR [rax],0x2e
0x1401d153e: xor    r9d,r9d
0x1401d1541: xor    r8d,r8d
0x1401d1544: lea    rdx,[rbp+0x12b0]
0x1401d154b: lea    rcx,[rip+0x2478e9e]        # 0x14264a3f0
0x1401d1552: call   0x140ad9960
0x1401d1557: nop
0x1401d1558: lea    rcx,[rbp+0x12b0]
0x1401d155f: jmp    0x1401d16c1
0x1401d1564: cmp    DWORD PTR [rax+0xc],0xffffffff
0x1401d1568: je     0x1401d164f
0x1401d156e: lea    rdx,[rip+0x1432acb]        # 0x141604040  'Last in '
0x1401d1575: lea    rcx,[rbp+0x12d0]
0x1401d157c: call   0x140068150
0x1401d1581: nop
0x1401d1582: mov    rax,QWORD PTR [r15+0x130]
0x1401d1589: mov    r8,QWORD PTR [rax+0x28]
0x1401d158d: xor    r9d,r9d
0x1401d1590: mov    r8d,DWORD PTR [r8+0xc]
0x1401d1594: lea    rdx,[rbp+0x12d0]
0x1401d159b: lea    rcx,[rip+0x2328716]        # 0x1424f9cb8
0x1401d15a2: call   0x140b94940
0x1401d15a7: lea    rcx,[rbp+0x12d0]
0x1401d15ae: call   0x14006f330
0x1401d15b3: mov    ecx,r13d
0x1401d15b6: sub    ecx,r14d
0x1401d15b9: sub    ecx,0x3
0x1401d15bc: movsxd rcx,ecx
0x1401d15bf: cmp    rax,rcx
0x1401d15c2: jb     0x1401d162c
0x1401d15c4: mov    ebx,r13d
0x1401d15c7: sub    ebx,r14d
0x1401d15ca: lea    edi,[rbx-0x4]
0x1401d15cd: test   edi,edi
0x1401d15cf: js     0x1401d15e7
0x1401d15d1: movsxd rdx,ebx
0x1401d15d4: sub    rdx,0x4
0x1401d15d8: xor    r8d,r8d
0x1401d15db: lea    rcx,[rbp+0x12d0]
0x1401d15e2: call   0x1400e1230
0x1401d15e7: cmp    edi,0x3
0x1401d15ea: jle    0x1401d162c
0x1401d15ec: movsxd rdx,ebx
0x1401d15ef: sub    rdx,0x7
0x1401d15f3: lea    rcx,[rbp+0x12d0]
0x1401d15fa: call   0x1400fb540
0x1401d15ff: mov    BYTE PTR [rax],0x2e
0x1401d1602: lea    eax,[rbx-0x6]
0x1401d1605: movsxd rdx,eax
0x1401d1608: lea    rcx,[rbp+0x12d0]
0x1401d160f: call   0x1400fb540
0x1401d1614: mov    BYTE PTR [rax],0x2e
0x1401d1617: lea    eax,[rbx-0x5]
0x1401d161a: movsxd rdx,eax
0x1401d161d: lea    rcx,[rbp+0x12d0]
0x1401d1624: call   0x1400fb540
0x1401d1629: mov    BYTE PTR [rax],0x2e
0x1401d162c: xor    r9d,r9d
0x1401d162f: xor    r8d,r8d
0x1401d1632: lea    rdx,[rbp+0x12d0]
0x1401d1639: lea    rcx,[rip+0x2478db0]        # 0x14264a3f0
0x1401d1640: call   0x140ad9960
0x1401d1645: nop
0x1401d1646: lea    rcx,[rbp+0x12d0]
0x1401d164d: jmp    0x1401d16c1
0x1401d164f: cmp    DWORD PTR [rax+0x10],0xffffffff
0x1401d1653: je     0x1401d168c
0x1401d1655: lea    rdx,[rip+0x14329f4]        # 0x141604050  'Last known to be traveling'
0x1401d165c: lea    rcx,[rbp+0x34b0]
0x1401d1663: call   0x140068150
0x1401d1668: nop
0x1401d1669: xor    r9d,r9d
0x1401d166c: xor    r8d,r8d
0x1401d166f: lea    rdx,[rbp+0x34b0]
0x1401d1676: lea    rcx,[rip+0x2478d73]        # 0x14264a3f0
0x1401d167d: call   0x140ad9960
0x1401d1682: nop
0x1401d1683: lea    rcx,[rbp+0x34b0]
0x1401d168a: jmp    0x1401d16c1
0x1401d168c: lea    rdx,[rip+0x1432cfd]        # 0x141604390  'Location unknown'
0x1401d1693: lea    rcx,[rbp+0x34d0]
0x1401d169a: call   0x140068150
0x1401d169f: nop
0x1401d16a0: xor    r9d,r9d
0x1401d16a3: xor    r8d,r8d
0x1401d16a6: lea    rdx,[rbp+0x34d0]
0x1401d16ad: lea    rcx,[rip+0x2478d3c]        # 0x14264a3f0
0x1401d16b4: call   0x140ad9960
0x1401d16b9: nop
0x1401d16ba: lea    rcx,[rbp+0x34d0]
0x1401d16c1: call   0x140067e30
0x1401d16c6: mov    rbx,QWORD PTR [rbp-0x78]
0x1401d16ca: add    ebx,0x3
0x1401d16cd: mov    QWORD PTR [rbp-0x78],rbx
0x1401d16d1: lea    rcx,[rbp+0x12f0]
0x1401d16d8: call   0x140067e30
0x1401d16dd: inc    r12d
0x1401d16e0: mov    DWORD PTR [rbp-0x68],r12d
0x1401d16e4: cmp    r12d,DWORD PTR [rbp-0x28]
0x1401d16e8: mov    rsi,QWORD PTR [rbp-0x30]
0x1401d16ec: mov    rcx,QWORD PTR [rbp+0x30]
0x1401d16f0: mov    rdi,QWORD PTR [rsp+0x78]
0x1401d16f5: jl     0x1401d1101
0x1401d16fb: mov    edi,DWORD PTR [rbp-0x58]
0x1401d16fe: mov    r15d,DWORD PTR [rbp-0x10]
0x1401d1702: cmp    esi,edi
0x1401d1704: jle    0x1401d177c
0x1401d1706: lea    ebx,[rdi*2-0x1]
0x1401d170d: add    ebx,edi
0x1401d170f: lea    rcx,[rbp+0x270]
0x1401d1716: call   0x1400bb360
0x1401d171b: lea    r9d,[rsi-0x1]
0x1401d171f: mov    DWORD PTR [rsp+0x30],ebx
0x1401d1723: mov    ebx,0x2
0x1401d1728: mov    DWORD PTR [rsp+0x28],ebx
0x1401d172c: mov    DWORD PTR [rsp+0x20],edi
0x1401d1730: xor    r8d,r8d
0x1401d1733: mov    rax,QWORD PTR [rsp+0x78]
0x1401d1738: mov    edx,DWORD PTR [rax+0x8400]
0x1401d173e: lea    rcx,[rbp+0x270]
0x1401d1745: call   0x1400bb380
0x1401d174a: lea    r9d,[r13+0x1]
0x1401d174e: mov    DWORD PTR [rsp+0x28],0x0
0x1401d1756: mov    r13,QWORD PTR [rsp+0x78]
0x1401d175b: movzx  eax,BYTE PTR [r13+0x8404]
0x1401d1763: mov    BYTE PTR [rsp+0x20],al
0x1401d1767: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401d176b: mov    edx,DWORD PTR [rbp-0x38]
0x1401d176e: lea    rcx,[rbp+0x270]
0x1401d1775: call   0x14140f4d0
0x1401d177a: jmp    0x1401d1786
0x1401d177c: mov    r13,QWORD PTR [rsp+0x78]
0x1401d1781: mov    ebx,0x2
0x1401d1786: cmp    QWORD PTR [rbp-0x20],0x0
0x1401d178b: jne    0x1401d17b9
0x1401d178d: cmp    QWORD PTR [r13+0x8408],0x0
0x1401d1795: je     0x1401c6068
0x1401d179b: mov    QWORD PTR [r13+0x8408],0x0
0x1401d17a6: mov    edx,ebx
0x1401d17a8: lea    rcx,[rip+0x2478c41]        # 0x14264a3f0
0x1401d17af: call   0x140ae7c00
0x1401d17b4: jmp    0x1401c6068
0x1401d17b9: lea    esi,[r15-0x37]
0x1401d17bd: lea    edi,[r15-0x2]
0x1401d17c1: movsxd rax,DWORD PTR [rsp+0x70]
0x1401d17c6: lea    r12d,[rax+0x2]
0x1401d17ca: mov    DWORD PTR [rbp-0x60],r12d
0x1401d17ce: mov    r15d,eax
0x1401d17d1: cmp    eax,r12d
0x1401d17d4: jg     0x1401d18b9
0x1401d17da: mov    r14,rax
0x1401d17dd: nop    DWORD PTR [rax]
0x1401d17e0: mov    ebx,esi
0x1401d17e2: cmp    esi,edi
0x1401d17e4: jg     0x1401d18a5
0x1401d17ea: movsxd r13,eax
0x1401d17ed: movsxd r12,r12d
0x1401d17f0: mov    r8d,ebx
0x1401d17f3: mov    edx,r15d
0x1401d17f6: lea    rcx,[rip+0x2478bf3]        # 0x14264a3f0
0x1401d17fd: call   0x1400bb120
0x1401d1802: xor    r8d,r8d
0x1401d1805: xor    edx,edx
0x1401d1807: lea    rcx,[rip+0x2478be2]        # 0x14264a3f0
0x1401d180e: call   0x1400bb190
0x1401d1813: cmp    r14,r13
0x1401d1816: jne    0x1401d183f
0x1401d1818: cmp    ebx,esi
0x1401d181a: jne    0x1401d1824
0x1401d181c: mov    edx,DWORD PTR [rip+0x247a4f2]        # 0x14264bd14
0x1401d1822: jmp    0x1401d1887
0x1401d1824: lea    rcx,[rip+0x2478bc5]        # 0x14264a3f0
0x1401d182b: cmp    ebx,edi
0x1401d182d: jne    0x1401d1837
0x1401d182f: mov    edx,DWORD PTR [rip+0x247a4f7]        # 0x14264bd2c
0x1401d1835: jmp    0x1401d188e
0x1401d1837: mov    edx,DWORD PTR [rip+0x247a4e3]        # 0x14264bd20
0x1401d183d: jmp    0x1401d188e
0x1401d183f: cmp    r14,r12
0x1401d1842: jne    0x1401d186b
0x1401d1844: cmp    ebx,esi
0x1401d1846: jne    0x1401d1850
0x1401d1848: mov    edx,DWORD PTR [rip+0x247a4ce]        # 0x14264bd1c
0x1401d184e: jmp    0x1401d1887
0x1401d1850: lea    rcx,[rip+0x2478b99]        # 0x14264a3f0
0x1401d1857: cmp    ebx,edi
0x1401d1859: jne    0x1401d1863
0x1401d185b: mov    edx,DWORD PTR [rip+0x247a4d3]        # 0x14264bd34
0x1401d1861: jmp    0x1401d188e
0x1401d1863: mov    edx,DWORD PTR [rip+0x247a4bf]        # 0x14264bd28
0x1401d1869: jmp    0x1401d188e
0x1401d186b: cmp    ebx,esi
0x1401d186d: jne    0x1401d1877
0x1401d186f: mov    edx,DWORD PTR [rip+0x247a4a3]        # 0x14264bd18
0x1401d1875: jmp    0x1401d1887
0x1401d1877: cmp    ebx,edi
0x1401d1879: mov    edx,DWORD PTR [rip+0x247a4b1]        # 0x14264bd30
0x1401d187f: je     0x1401d1887
0x1401d1881: mov    edx,DWORD PTR [rip+0x247a49d]        # 0x14264bd24
0x1401d1887: lea    rcx,[rip+0x2478b62]        # 0x14264a3f0
0x1401d188e: call   0x140adaad0
0x1401d1893: inc    ebx
0x1401d1895: cmp    ebx,edi
0x1401d1897: jle    0x1401d17f0
0x1401d189d: mov    r12d,DWORD PTR [rbp-0x60]
0x1401d18a1: mov    eax,DWORD PTR [rsp+0x70]
0x1401d18a5: inc    r15d
0x1401d18a8: inc    r14
0x1401d18ab: cmp    r15d,r12d
0x1401d18ae: jle    0x1401d17e0
0x1401d18b4: mov    r13,QWORD PTR [rsp+0x78]
0x1401d18b9: add    esi,0x2
0x1401d18bc: cmp    QWORD PTR [r13+0x1c0],0x0
0x1401d18c4: jne    0x1401d1937
0x1401d18c6: cmp    QWORD PTR [r13+0x1b8],0x0
0x1401d18ce: jne    0x1401d1937
0x1401d18d0: xor    r8d,r8d
0x1401d18d3: xor    edx,edx
0x1401d18d5: mov    r9b,0x1
0x1401d18d8: lea    rcx,[rip+0x2478b11]        # 0x14264a3f0
0x1401d18df: call   0x1400bb130
0x1401d18e4: lea    edx,[r12-0x1]
0x1401d18e9: mov    r8d,esi
0x1401d18ec: lea    rcx,[rip+0x2478afd]        # 0x14264a3f0
0x1401d18f3: call   0x1400bb120
0x1401d18f8: lea    rdx,[rip+0x1432201]        # 0x141603b00  'Cannot order mission without leader'
0x1401d18ff: lea    rcx,[rbp+0x3510]
0x1401d1906: call   0x140068150
0x1401d190b: nop
0x1401d190c: xor    r9d,r9d
0x1401d190f: xor    r8d,r8d
0x1401d1912: lea    rdx,[rbp+0x3510]
0x1401d1919: lea    rcx,[rip+0x2478ad0]        # 0x14264a3f0
0x1401d1920: call   0x140ad9960
0x1401d1925: nop
0x1401d1926: lea    rcx,[rbp+0x3510]
0x1401d192d: call   0x140067e30
0x1401d1932: jmp    0x1401c6068
0x1401d1937: movzx  r8d,WORD PTR [r13+0x19c]
0x1401d193f: movzx  edx,WORD PTR [r13+0x198]
0x1401d1947: mov    rcx,QWORD PTR [rip+0x231a20a]        # 0x1424ebb58
0x1401d194e: call   0x1401bc2d0
0x1401d1953: xor    r8d,r8d
0x1401d1956: mov    r9b,0x1
0x1401d1959: lea    rcx,[rip+0x2478a90]        # 0x14264a3f0
0x1401d1960: test   eax,eax
0x1401d1962: js     0x1401d19c1
0x1401d1964: mov    edx,0x7
0x1401d1969: call   0x1400bb130
0x1401d196e: mov    r8d,esi
0x1401d1971: lea    edx,[r12-0x1]
0x1401d1976: lea    rcx,[rip+0x2478a73]        # 0x14264a3f0
0x1401d197d: call   0x1400bb120
0x1401d1982: lea    rdx,[rip+0x1432a1f]        # 0x1416043a8  'Click to rescue (creates new mission)'
0x1401d1989: lea    rcx,[rbp+0x3530]
0x1401d1990: call   0x140068150
0x1401d1995: nop
0x1401d1996: xor    r9d,r9d
0x1401d1999: xor    r8d,r8d
0x1401d199c: lea    rdx,[rbp+0x3530]
0x1401d19a3: lea    rcx,[rip+0x2478a46]        # 0x14264a3f0
0x1401d19aa: call   0x140ad9960
0x1401d19af: nop
0x1401d19b0: lea    rcx,[rbp+0x3530]
0x1401d19b7: call   0x140067e30
0x1401d19bc: jmp    0x1401c6068
0x1401d19c1: xor    edx,edx
0x1401d19c3: call   0x1400bb130
0x1401d19c8: mov    r8d,esi
0x1401d19cb: lea    edx,[r12-0x1]
0x1401d19d0: lea    rcx,[rip+0x2478a19]        # 0x14264a3f0
0x1401d19d7: call   0x1400bb120
0x1401d19dc: lea    rdx,[rip+0x14320fd]        # 0x141603ae0  'Inaccessible mission location'
0x1401d19e3: lea    rcx,[rbp+0x3550]
0x1401d19ea: call   0x140068150
0x1401d19ef: nop
0x1401d19f0: xor    r9d,r9d
0x1401d19f3: xor    r8d,r8d
0x1401d19f6: lea    rdx,[rbp+0x3550]
0x1401d19fd: lea    rcx,[rip+0x24789ec]        # 0x14264a3f0
0x1401d1a04: call   0x140ad9960
0x1401d1a09: nop
0x1401d1a0a: lea    rcx,[rbp+0x3550]
0x1401d1a11: call   0x140067e30
0x1401d1a16: jmp    0x1401c6068
0x1401d1a1b: mov    ebx,DWORD PTR [rbp-0x18]
0x1401d1a1e: mov    DWORD PTR [rbp-0x60],ebx
0x1401d1a21: lea    r13d,[rbx-0x39]
0x1401d1a25: mov    DWORD PTR [rbp-0x20],r13d
0x1401d1a29: mov    r12d,0x14
0x1401d1a2f: mov    eax,DWORD PTR [rip+0x21fbd53]        # 0x1423cd788
0x1401d1a35: cmp    eax,0x2e
0x1401d1a38: jle    0x1401d1a51
0x1401d1a3a: lea    r12d,[rax-0x1a]
0x1401d1a3e: cmp    r12d,0x1e
0x1401d1a42: jle    0x1401d1a51
0x1401d1a44: mov    r12d,0x1e
0x1401d1a4a: mov    edi,ebx
0x1401d1a4c: mov    r14d,esi
0x1401d1a4f: jmp    0x1401d1a60
0x1401d1a51: mov    edi,ebx
0x1401d1a53: mov    r14d,esi
0x1401d1a56: test   r12d,r12d
0x1401d1a59: js     0x1401d1b32
0x1401d1a5f: nop
0x1401d1a60: mov    ebx,r13d
0x1401d1a63: cmp    r13d,edi
0x1401d1a66: jg     0x1401d1b20
0x1401d1a6c: movsxd r15,r12d
0x1401d1a6f: nop
0x1401d1a70: mov    r8d,ebx
0x1401d1a73: mov    edx,r14d
0x1401d1a76: lea    rcx,[rip+0x2478973]        # 0x14264a3f0
0x1401d1a7d: call   0x1400bb120
0x1401d1a82: xor    r8d,r8d
0x1401d1a85: xor    edx,edx
0x1401d1a87: lea    rcx,[rip+0x2478962]        # 0x14264a3f0
0x1401d1a8e: call   0x1400bb190
0x1401d1a93: test   rsi,rsi
0x1401d1a96: jne    0x1401d1ac0
0x1401d1a98: cmp    ebx,r13d
0x1401d1a9b: jne    0x1401d1aa5
0x1401d1a9d: mov    edx,DWORD PTR [rip+0x247a271]        # 0x14264bd14
0x1401d1aa3: jmp    0x1401d1b0a
0x1401d1aa5: lea    rcx,[rip+0x2478944]        # 0x14264a3f0
0x1401d1aac: cmp    ebx,edi
0x1401d1aae: jne    0x1401d1ab8
0x1401d1ab0: mov    edx,DWORD PTR [rip+0x247a276]        # 0x14264bd2c
0x1401d1ab6: jmp    0x1401d1b11
0x1401d1ab8: mov    edx,DWORD PTR [rip+0x247a262]        # 0x14264bd20
0x1401d1abe: jmp    0x1401d1b11
0x1401d1ac0: cmp    rsi,r15
0x1401d1ac3: jne    0x1401d1aed
0x1401d1ac5: cmp    ebx,r13d
0x1401d1ac8: jne    0x1401d1ad2
0x1401d1aca: mov    edx,DWORD PTR [rip+0x247a24c]        # 0x14264bd1c
0x1401d1ad0: jmp    0x1401d1b0a
0x1401d1ad2: lea    rcx,[rip+0x2478917]        # 0x14264a3f0
0x1401d1ad9: cmp    ebx,edi
0x1401d1adb: jne    0x1401d1ae5
0x1401d1add: mov    edx,DWORD PTR [rip+0x247a251]        # 0x14264bd34
0x1401d1ae3: jmp    0x1401d1b11
0x1401d1ae5: mov    edx,DWORD PTR [rip+0x247a23d]        # 0x14264bd28
0x1401d1aeb: jmp    0x1401d1b11
0x1401d1aed: cmp    ebx,r13d
0x1401d1af0: jne    0x1401d1afa
0x1401d1af2: mov    edx,DWORD PTR [rip+0x247a220]        # 0x14264bd18
0x1401d1af8: jmp    0x1401d1b0a
0x1401d1afa: cmp    ebx,edi
0x1401d1afc: mov    edx,DWORD PTR [rip+0x247a22e]        # 0x14264bd30
0x1401d1b02: je     0x1401d1b0a
0x1401d1b04: mov    edx,DWORD PTR [rip+0x247a21a]        # 0x14264bd24
0x1401d1b0a: lea    rcx,[rip+0x24788df]        # 0x14264a3f0
0x1401d1b11: call   0x140adaad0
0x1401d1b16: inc    ebx
0x1401d1b18: cmp    ebx,edi
0x1401d1b1a: jle    0x1401d1a70
0x1401d1b20: inc    r14d
0x1401d1b23: inc    rsi
0x1401d1b26: cmp    r14d,r12d
0x1401d1b29: jle    0x1401d1a60
0x1401d1b2f: mov    ebx,DWORD PTR [rbp-0x60]
0x1401d1b32: lea    r14d,[r13+0x2]
0x1401d1b36: lea    r13d,[rbx-0x2]
0x1401d1b3a: mov    DWORD PTR [rsp+0x74],r13d
0x1401d1b3f: lea    ecx,[r12-0x1]
0x1401d1b44: mov    eax,0x55555556
0x1401d1b49: imul   ecx
0x1401d1b4b: mov    edi,edx
0x1401d1b4d: shr    edi,0x1f
0x1401d1b50: add    edi,edx
0x1401d1b52: mov    DWORD PTR [rbp-0x10],edi
0x1401d1b55: mov    r12,QWORD PTR [rsp+0x78]
0x1401d1b5a: lea    rcx,[r12+0x8410]
0x1401d1b62: call   0x14006ee50
0x1401d1b67: mov    rsi,rax
0x1401d1b6a: mov    QWORD PTR [rbp-0x58],rax
0x1401d1b6e: cmp    eax,edi
0x1401d1b70: jle    0x1401d1b7b
0x1401d1b72: lea    r13d,[rbx-0x4]
0x1401d1b76: mov    DWORD PTR [rsp+0x74],r13d
0x1401d1b7b: xor    r15d,r15d
0x1401d1b7e: mov    QWORD PTR [rbp-0x30],r15
0x1401d1b82: mov    ecx,DWORD PTR [r12+0x8440]
0x1401d1b8a: mov    edx,eax
0x1401d1b8c: sub    edx,edi
0x1401d1b8e: cmp    ecx,edx
0x1401d1b90: cmovle edx,ecx
0x1401d1b93: xor    eax,eax
0x1401d1b95: test   edx,edx
0x1401d1b97: cmovns eax,edx
0x1401d1b9a: mov    DWORD PTR [rbp-0x68],eax
0x1401d1b9d: lea    ecx,[rax+rdi*1]
0x1401d1ba0: mov    DWORD PTR [rbp-0x28],ecx
0x1401d1ba3: cmp    eax,ecx
0x1401d1ba5: mov    ecx,DWORD PTR [rbp+0x20]
0x1401d1ba8: mov    DWORD PTR [rsp+0x70],ecx
0x1401d1bac: jge    0x1401d22b5
0x1401d1bb2: mov    r15,r12
0x1401d1bb5: lea    r8,[r12+0x8410]
0x1401d1bbd: mov    QWORD PTR [rbp+0x48],r8
0x1401d1bc1: mov    ebx,0x4
0x1401d1bc6: mov    QWORD PTR [rbp-0x78],rbx
0x1401d1bca: nop    WORD PTR [rax+rax*1+0x0]
0x1401d1bd0: cmp    eax,esi
0x1401d1bd2: jge    0x1401d22a9
0x1401d1bd8: movsxd rdi,eax
0x1401d1bdb: mov    rdx,rdi
0x1401d1bde: mov    rcx,r8
0x1401d1be1: call   0x14006f220
0x1401d1be6: mov    r12,QWORD PTR [rax]
0x1401d1be9: mov    QWORD PTR [rbp+0x30],r12
0x1401d1bed: mov    rdx,rdi
0x1401d1bf0: lea    rcx,[r15+0x8428]
0x1401d1bf7: call   0x14006f220
0x1401d1bfc: cmp    QWORD PTR [rax],0x0
0x1401d1c00: jne    0x1401d1c52
0x1401d1c02: mov    ecx,0x30
0x1401d1c07: call   0x141539690
0x1401d1c0c: mov    QWORD PTR [rbp-0x48],rax
0x1401d1c10: mov    rcx,rax
0x1401d1c13: call   0x140073150
0x1401d1c18: mov    rbx,rax
0x1401d1c1b: mov    QWORD PTR [rax],r12
0x1401d1c1e: mov    rcx,rax
0x1401d1c21: call   0x1409de8e0
0x1401d1c26: mov    rdx,QWORD PTR [rip+0x21c85bb]        # 0x14239a1e8
0x1401d1c2d: add    rdx,0x1250
0x1401d1c34: mov    rcx,rbx
0x1401d1c37: call   0x1409de930
0x1401d1c3c: mov    rdx,rdi
0x1401d1c3f: lea    rcx,[r15+0x8428]
0x1401d1c46: call   0x14006f220
0x1401d1c4b: mov    QWORD PTR [rax],rbx
0x1401d1c4e: mov    rbx,QWORD PTR [rbp-0x78]
0x1401d1c52: mov    rdx,rdi
0x1401d1c55: lea    rcx,[r15+0x8428]
0x1401d1c5c: call   0x14006f220
0x1401d1c61: mov    r15,QWORD PTR [rax]
0x1401d1c64: mov    QWORD PTR [rbp+0x18],r15
0x1401d1c68: cmp    BYTE PTR [rip+0x21be966],0x0        # 0x1423905d5
0x1401d1c6f: je     0x1401d1cce
0x1401d1c71: mov    eax,DWORD PTR [rbp-0x38]
0x1401d1c74: cmp    eax,r14d
0x1401d1c77: jl     0x1401d1cce
0x1401d1c79: cmp    eax,r13d
0x1401d1c7c: jg     0x1401d1cce
0x1401d1c7e: lea    eax,[rbx-0x3]
0x1401d1c81: mov    ecx,DWORD PTR [rbp-0x3c]
0x1401d1c84: cmp    ecx,eax
0x1401d1c86: jl     0x1401d1cce
0x1401d1c88: lea    eax,[rbx-0x1]
0x1401d1c8b: cmp    ecx,eax
0x1401d1c8d: jg     0x1401d1cce
0x1401d1c8f: mov    rax,QWORD PTR [rsp+0x78]
0x1401d1c94: cmp    QWORD PTR [rax+0x8448],r12
0x1401d1c9b: je     0x1401d1cc3
0x1401d1c9d: mov    QWORD PTR [rax+0x8448],r12
0x1401d1ca4: mov    r8,r15
0x1401d1ca7: mov    rdx,r12
0x1401d1caa: mov    rcx,rax
0x1401d1cad: call   0x1401d9c30
0x1401d1cb2: mov    edx,0x2
0x1401d1cb7: lea    rcx,[rip+0x2478732]        # 0x14264a3f0
0x1401d1cbe: call   0x140ae7c00
0x1401d1cc3: mov    QWORD PTR [rbp-0x30],r12
0x1401d1cc7: lea    ecx,[rbx-0x4]
0x1401d1cca: mov    DWORD PTR [rsp+0x70],ecx
0x1401d1cce: xor    r8d,r8d
0x1401d1cd1: mov    edx,0x7
0x1401d1cd6: mov    r9b,0x1
0x1401d1cd9: lea    rcx,[rip+0x2478710]        # 0x14264a3f0
0x1401d1ce0: call   0x1400bb130
0x1401d1ce5: mov    esi,r14d
0x1401d1ce8: cmp    r14d,r13d
0x1401d1ceb: jg     0x1401d1d97
0x1401d1cf1: movsxd r15,r14d
0x1401d1cf4: lea    eax,[rbx-0x3]
0x1401d1cf7: mov    DWORD PTR [rbp-0x60],eax
0x1401d1cfa: nop    WORD PTR [rax+rax*1+0x0]
0x1401d1d00: mov    edi,eax
0x1401d1d02: cmp    eax,ebx
0x1401d1d04: jge    0x1401d1d81
0x1401d1d06: movsxd r12,r13d
0x1401d1d09: lea    rbx,[rip+0x247a0a0]        # 0x14264bdb0
0x1401d1d10: mov    r13,QWORD PTR [rbp-0x78]
0x1401d1d14: mov    r8d,esi
0x1401d1d17: mov    edx,edi
0x1401d1d19: lea    rcx,[rip+0x24786d0]        # 0x14264a3f0
0x1401d1d20: call   0x1400bb120
0x1401d1d25: cmp    esi,r14d
0x1401d1d28: jne    0x1401d1d2f
0x1401d1d2a: mov    edx,DWORD PTR [rbx-0x18]
0x1401d1d2d: jmp    0x1401d1d3b
0x1401d1d2f: cmp    r15,r12
0x1401d1d32: jne    0x1401d1d38
0x1401d1d34: mov    edx,DWORD PTR [rbx]
0x1401d1d36: jmp    0x1401d1d3b
0x1401d1d38: mov    edx,DWORD PTR [rbx-0xc]
0x1401d1d3b: lea    rcx,[rip+0x24786ae]        # 0x14264a3f0
0x1401d1d42: call   0x140adaad0
0x1401d1d47: xor    edx,edx
0x1401d1d49: lea    rcx,[rip+0x21fba20]        # 0x1423cd770
0x1401d1d50: call   0x140071f90
0x1401d1d55: test   al,al
0x1401d1d57: je     0x1401d1d6a
0x1401d1d59: mov    r8b,0x1
0x1401d1d5c: xor    edx,edx
0x1401d1d5e: lea    rcx,[rip+0x247868b]        # 0x14264a3f0
0x1401d1d65: call   0x1400bb190
0x1401d1d6a: inc    edi
0x1401d1d6c: add    rbx,0x4
0x1401d1d70: cmp    edi,r13d
0x1401d1d73: jl     0x1401d1d14
0x1401d1d75: mov    r13d,DWORD PTR [rsp+0x74]
0x1401d1d7a: mov    eax,DWORD PTR [rbp-0x60]
0x1401d1d7d: mov    rbx,QWORD PTR [rbp-0x78]
0x1401d1d81: inc    esi
0x1401d1d83: inc    r15
0x1401d1d86: cmp    esi,r13d
0x1401d1d89: jle    0x1401d1d00
0x1401d1d8f: mov    r15,QWORD PTR [rbp+0x18]
0x1401d1d93: mov    r12,QWORD PTR [rbp+0x30]
0x1401d1d97: xor    r8d,r8d
0x1401d1d9a: mov    edx,0x3
0x1401d1d9f: mov    r9b,0x1
0x1401d1da2: lea    rcx,[rip+0x2478647]        # 0x14264a3f0
0x1401d1da9: call   0x1400bb130
0x1401d1dae: lea    edx,[rbx-0x2]
0x1401d1db1: mov    r8d,r14d
0x1401d1db4: lea    rcx,[rip+0x2478635]        # 0x14264a3f0
0x1401d1dbb: call   0x1400bb120
0x1401d1dc0: lea    rcx,[rbp+0x1390]
0x1401d1dc7: call   0x14006f690
0x1401d1dcc: nop
0x1401d1dcd: xor    r9d,r9d
0x1401d1dd0: mov    r8d,DWORD PTR [r12]
0x1401d1dd4: lea    rdx,[rbp+0x1390]
0x1401d1ddb: lea    rcx,[rip+0x2327ed6]        # 0x1424f9cb8
0x1401d1de2: call   0x140b94400
0x1401d1de7: mov    ebx,r13d
0x1401d1dea: sub    ebx,r14d
0x1401d1ded: lea    rcx,[rbp+0x1390]
0x1401d1df4: call   0x14006f330
0x1401d1df9: lea    ecx,[rbx-0x2]
0x1401d1dfc: movsxd rdx,ecx
0x1401d1dff: cmp    rax,rdx
0x1401d1e02: jb     0x1401d1e66
0x1401d1e04: lea    edi,[rbx-0x3]
0x1401d1e07: test   edi,edi
0x1401d1e09: js     0x1401d1e21
0x1401d1e0b: movsxd rdx,ebx
0x1401d1e0e: sub    rdx,0x3
0x1401d1e12: xor    r8d,r8d
0x1401d1e15: lea    rcx,[rbp+0x1390]
0x1401d1e1c: call   0x1400e1230
0x1401d1e21: cmp    edi,0x3
0x1401d1e24: jle    0x1401d1e66
0x1401d1e26: movsxd rdx,ebx
0x1401d1e29: sub    rdx,0x6
0x1401d1e2d: lea    rcx,[rbp+0x1390]
0x1401d1e34: call   0x1400fb540
0x1401d1e39: mov    BYTE PTR [rax],0x2e
0x1401d1e3c: lea    eax,[rbx-0x5]
0x1401d1e3f: movsxd rdx,eax
0x1401d1e42: lea    rcx,[rbp+0x1390]
0x1401d1e49: call   0x1400fb540
0x1401d1e4e: mov    BYTE PTR [rax],0x2e
0x1401d1e51: lea    eax,[rbx-0x4]
0x1401d1e54: movsxd rdx,eax
0x1401d1e57: lea    rcx,[rbp+0x1390]
0x1401d1e5e: call   0x1400fb540
0x1401d1e63: mov    BYTE PTR [rax],0x2e
0x1401d1e66: xor    r9d,r9d
0x1401d1e69: xor    r8d,r8d
0x1401d1e6c: lea    rdx,[rbp+0x1390]
0x1401d1e73: lea    rcx,[rip+0x2478576]        # 0x14264a3f0
0x1401d1e7a: call   0x140ad9960
0x1401d1e7f: lea    r8d,[r14+0x1]
0x1401d1e83: mov    rdx,QWORD PTR [rbp-0x78]
0x1401d1e87: dec    edx
0x1401d1e89: lea    rcx,[rip+0x2478560]        # 0x14264a3f0
0x1401d1e90: call   0x1400bb120
0x1401d1e95: cmp    DWORD PTR [r15+0x10],0xffffffff
0x1401d1e9a: je     0x1401d1f91
0x1401d1ea0: lea    rdx,[rip+0x1432529]        # 0x1416043d0  'Last held by '
0x1401d1ea7: lea    rcx,[rbp+0x1310]
0x1401d1eae: call   0x140068150
0x1401d1eb3: nop
0x1401d1eb4: lea    rcx,[rbp+0x8e0]
0x1401d1ebb: call   0x140072080
0x1401d1ec0: xor    eax,eax
0x1401d1ec2: mov    WORD PTR [rsp+0x28],ax
0x1401d1ec7: mov    WORD PTR [rsp+0x20],0x1
0x1401d1ece: lea    r9,[rbp+0x8e0]
0x1401d1ed5: mov    r8d,DWORD PTR [r15+0x10]
0x1401d1ed9: lea    rdx,[rbp+0x1310]
0x1401d1ee0: lea    rcx,[rip+0x2327dd1]        # 0x1424f9cb8
0x1401d1ee7: call   0x140b92f10
0x1401d1eec: lea    rcx,[rbp+0x1310]
0x1401d1ef3: call   0x14006f330
0x1401d1ef8: lea    ecx,[rbx-0x3]
0x1401d1efb: movsxd rdx,ecx
0x1401d1efe: cmp    rax,rdx
0x1401d1f01: jb     0x1401d1f6b
0x1401d1f03: mov    ebx,r13d
0x1401d1f06: sub    ebx,r14d
0x1401d1f09: lea    edi,[rbx-0x4]
0x1401d1f0c: test   edi,edi
0x1401d1f0e: js     0x1401d1f26
0x1401d1f10: movsxd rdx,ebx
0x1401d1f13: sub    rdx,0x4
0x1401d1f17: xor    r8d,r8d
0x1401d1f1a: lea    rcx,[rbp+0x1310]
0x1401d1f21: call   0x1400e1230
0x1401d1f26: cmp    edi,0x3
0x1401d1f29: jle    0x1401d1f6b
0x1401d1f2b: movsxd rdx,ebx
0x1401d1f2e: sub    rdx,0x7
0x1401d1f32: lea    rcx,[rbp+0x1310]
0x1401d1f39: call   0x1400fb540
0x1401d1f3e: mov    BYTE PTR [rax],0x2e
0x1401d1f41: lea    eax,[rbx-0x6]
0x1401d1f44: movsxd rdx,eax
0x1401d1f47: lea    rcx,[rbp+0x1310]
0x1401d1f4e: call   0x1400fb540
0x1401d1f53: mov    BYTE PTR [rax],0x2e
0x1401d1f56: lea    eax,[rbx-0x5]
0x1401d1f59: movsxd rdx,eax
0x1401d1f5c: lea    rcx,[rbp+0x1310]
0x1401d1f63: call   0x1400fb540
0x1401d1f68: mov    BYTE PTR [rax],0x2e
0x1401d1f6b: xor    r9d,r9d
0x1401d1f6e: xor    r8d,r8d
0x1401d1f71: lea    rdx,[rbp+0x1310]
0x1401d1f78: lea    rcx,[rip+0x2478471]        # 0x14264a3f0
0x1401d1f7f: call   0x140ad9960
0x1401d1f84: nop
0x1401d1f85: lea    rcx,[rbp+0x1310]
0x1401d1f8c: jmp    0x1401d226f
0x1401d1f91: cmp    DWORD PTR [r15+0x8],0xffffffff
0x1401d1f96: je     0x1401d2075
0x1401d1f9c: lea    rdx,[rip+0x143209d]        # 0x141604040  'Last in '
0x1401d1fa3: lea    rcx,[rbp+0x1330]
0x1401d1faa: call   0x140068150
0x1401d1faf: nop
0x1401d1fb0: xor    r9d,r9d
0x1401d1fb3: mov    r8d,DWORD PTR [r15+0x8]
0x1401d1fb7: lea    rdx,[rbp+0x1330]
0x1401d1fbe: lea    rcx,[rip+0x2327cf3]        # 0x1424f9cb8
0x1401d1fc5: call   0x140b93930
0x1401d1fca: lea    rcx,[rbp+0x1330]
0x1401d1fd1: call   0x14006f330
0x1401d1fd6: mov    ecx,r13d
0x1401d1fd9: sub    ecx,r14d
0x1401d1fdc: sub    ecx,0x3
0x1401d1fdf: movsxd rcx,ecx
0x1401d1fe2: cmp    rax,rcx
0x1401d1fe5: jb     0x1401d204f
0x1401d1fe7: mov    ebx,r13d
0x1401d1fea: sub    ebx,r14d
0x1401d1fed: lea    edi,[rbx-0x4]
0x1401d1ff0: test   edi,edi
0x1401d1ff2: js     0x1401d200a
0x1401d1ff4: movsxd rdx,ebx
0x1401d1ff7: sub    rdx,0x4
0x1401d1ffb: xor    r8d,r8d
0x1401d1ffe: lea    rcx,[rbp+0x1330]
0x1401d2005: call   0x1400e1230
0x1401d200a: cmp    edi,0x3
0x1401d200d: jle    0x1401d204f
0x1401d200f: movsxd rdx,ebx
0x1401d2012: sub    rdx,0x7
0x1401d2016: lea    rcx,[rbp+0x1330]
0x1401d201d: call   0x1400fb540
0x1401d2022: mov    BYTE PTR [rax],0x2e
0x1401d2025: lea    eax,[rbx-0x6]
0x1401d2028: movsxd rdx,eax
0x1401d202b: lea    rcx,[rbp+0x1330]
0x1401d2032: call   0x1400fb540
0x1401d2037: mov    BYTE PTR [rax],0x2e
0x1401d203a: lea    eax,[rbx-0x5]
0x1401d203d: movsxd rdx,eax
0x1401d2040: lea    rcx,[rbp+0x1330]
0x1401d2047: call   0x1400fb540
0x1401d204c: mov    BYTE PTR [rax],0x2e
0x1401d204f: xor    r9d,r9d
0x1401d2052: xor    r8d,r8d
0x1401d2055: lea    rdx,[rbp+0x1330]
0x1401d205c: lea    rcx,[rip+0x247838d]        # 0x14264a3f0
0x1401d2063: call   0x140ad9960
0x1401d2068: nop
0x1401d2069: lea    rcx,[rbp+0x1330]
0x1401d2070: jmp    0x1401d226f
0x1401d2075: cmp    DWORD PTR [r15+0x14],0xffffffff
0x1401d207a: je     0x1401d2159
0x1401d2080: lea    rdx,[rip+0x1431fb9]        # 0x141604040  'Last in '
0x1401d2087: lea    rcx,[rbp+0x1350]
0x1401d208e: call   0x140068150
0x1401d2093: nop
0x1401d2094: xor    r9d,r9d
0x1401d2097: mov    r8d,DWORD PTR [r15+0x14]
0x1401d209b: lea    rdx,[rbp+0x1350]
0x1401d20a2: lea    rcx,[rip+0x2327c0f]        # 0x1424f9cb8
0x1401d20a9: call   0x140b94a40
0x1401d20ae: lea    rcx,[rbp+0x1350]
0x1401d20b5: call   0x14006f330
0x1401d20ba: mov    ecx,r13d
0x1401d20bd: sub    ecx,r14d
0x1401d20c0: sub    ecx,0x3
0x1401d20c3: movsxd rcx,ecx
0x1401d20c6: cmp    rax,rcx
0x1401d20c9: jb     0x1401d2133
0x1401d20cb: mov    ebx,r13d
0x1401d20ce: sub    ebx,r14d
0x1401d20d1: lea    edi,[rbx-0x4]
0x1401d20d4: test   edi,edi
0x1401d20d6: js     0x1401d20ee
0x1401d20d8: movsxd rdx,ebx
0x1401d20db: sub    rdx,0x4
0x1401d20df: xor    r8d,r8d
0x1401d20e2: lea    rcx,[rbp+0x1350]
0x1401d20e9: call   0x1400e1230
0x1401d20ee: cmp    edi,0x3
0x1401d20f1: jle    0x1401d2133
0x1401d20f3: movsxd rdx,ebx
0x1401d20f6: sub    rdx,0x7
0x1401d20fa: lea    rcx,[rbp+0x1350]
0x1401d2101: call   0x1400fb540
0x1401d2106: mov    BYTE PTR [rax],0x2e
0x1401d2109: lea    eax,[rbx-0x6]
0x1401d210c: movsxd rdx,eax
0x1401d210f: lea    rcx,[rbp+0x1350]
0x1401d2116: call   0x1400fb540
0x1401d211b: mov    BYTE PTR [rax],0x2e
0x1401d211e: lea    eax,[rbx-0x5]
0x1401d2121: movsxd rdx,eax
0x1401d2124: lea    rcx,[rbp+0x1350]
0x1401d212b: call   0x1400fb540
0x1401d2130: mov    BYTE PTR [rax],0x2e
0x1401d2133: xor    r9d,r9d
0x1401d2136: xor    r8d,r8d
0x1401d2139: lea    rdx,[rbp+0x1350]
0x1401d2140: lea    rcx,[rip+0x24782a9]        # 0x14264a3f0
0x1401d2147: call   0x140ad9960
0x1401d214c: nop
0x1401d214d: lea    rcx,[rbp+0x1350]
0x1401d2154: jmp    0x1401d226f
0x1401d2159: cmp    DWORD PTR [r15+0x18],0xffffffff
0x1401d215e: je     0x1401d223a
0x1401d2164: lea    rdx,[rip+0x1431ed5]        # 0x141604040  'Last in '
0x1401d216b: lea    rcx,[rbp+0x1370]
0x1401d2172: call   0x140068150
0x1401d2177: nop
0x1401d2178: xor    r9d,r9d
0x1401d217b: mov    r8d,DWORD PTR [r15+0x18]
0x1401d217f: lea    rdx,[rbp+0x1370]
0x1401d2186: lea    rcx,[rip+0x2327b2b]        # 0x1424f9cb8
0x1401d218d: call   0x140b94940
0x1401d2192: lea    rcx,[rbp+0x1370]
0x1401d2199: call   0x14006f330
0x1401d219e: mov    ecx,r13d
0x1401d21a1: sub    ecx,r14d
0x1401d21a4: sub    ecx,0x3
0x1401d21a7: movsxd rcx,ecx
0x1401d21aa: cmp    rax,rcx
0x1401d21ad: jb     0x1401d2217
0x1401d21af: mov    ebx,r13d
0x1401d21b2: sub    ebx,r14d
0x1401d21b5: lea    edi,[rbx-0x4]
0x1401d21b8: test   edi,edi
0x1401d21ba: js     0x1401d21d2
0x1401d21bc: movsxd rdx,ebx
0x1401d21bf: sub    rdx,0x4
0x1401d21c3: xor    r8d,r8d
0x1401d21c6: lea    rcx,[rbp+0x1370]
0x1401d21cd: call   0x1400e1230
0x1401d21d2: cmp    edi,0x3
0x1401d21d5: jle    0x1401d2217
0x1401d21d7: movsxd rdx,ebx
0x1401d21da: sub    rdx,0x7
0x1401d21de: lea    rcx,[rbp+0x1370]
0x1401d21e5: call   0x1400fb540
0x1401d21ea: mov    BYTE PTR [rax],0x2e
0x1401d21ed: lea    eax,[rbx-0x6]
0x1401d21f0: movsxd rdx,eax
0x1401d21f3: lea    rcx,[rbp+0x1370]
0x1401d21fa: call   0x1400fb540
0x1401d21ff: mov    BYTE PTR [rax],0x2e
0x1401d2202: lea    eax,[rbx-0x5]
0x1401d2205: movsxd rdx,eax
0x1401d2208: lea    rcx,[rbp+0x1370]
0x1401d220f: call   0x1400fb540
0x1401d2214: mov    BYTE PTR [rax],0x2e
0x1401d2217: xor    r9d,r9d
0x1401d221a: xor    r8d,r8d
0x1401d221d: lea    rdx,[rbp+0x1370]
0x1401d2224: lea    rcx,[rip+0x24781c5]        # 0x14264a3f0
0x1401d222b: call   0x140ad9960
0x1401d2230: nop
0x1401d2231: lea    rcx,[rbp+0x1370]
0x1401d2238: jmp    0x1401d226f
0x1401d223a: lea    rdx,[rip+0x143214f]        # 0x141604390  'Location unknown'
0x1401d2241: lea    rcx,[rbp+0x3570]
0x1401d2248: call   0x140068150
0x1401d224d: nop
0x1401d224e: xor    r9d,r9d
0x1401d2251: xor    r8d,r8d
0x1401d2254: lea    rdx,[rbp+0x3570]
0x1401d225b: lea    rcx,[rip+0x247818e]        # 0x14264a3f0
0x1401d2262: call   0x140ad9960
0x1401d2267: nop
0x1401d2268: lea    rcx,[rbp+0x3570]
0x1401d226f: call   0x140067e30
0x1401d2274: mov    rbx,QWORD PTR [rbp-0x78]
0x1401d2278: add    ebx,0x3
0x1401d227b: mov    QWORD PTR [rbp-0x78],rbx
0x1401d227f: lea    rcx,[rbp+0x1390]
0x1401d2286: call   0x140067e30
0x1401d228b: mov    eax,DWORD PTR [rbp-0x68]
0x1401d228e: inc    eax
0x1401d2290: mov    DWORD PTR [rbp-0x68],eax
0x1401d2293: cmp    eax,DWORD PTR [rbp-0x28]
0x1401d2296: mov    rsi,QWORD PTR [rbp-0x58]
0x1401d229a: mov    r8,QWORD PTR [rbp+0x48]
0x1401d229e: mov    r15,QWORD PTR [rsp+0x78]
0x1401d22a3: jl     0x1401d1bd0
0x1401d22a9: mov    r12,QWORD PTR [rsp+0x78]
0x1401d22ae: mov    r15,QWORD PTR [rbp-0x30]
0x1401d22b2: mov    edi,DWORD PTR [rbp-0x10]
0x1401d22b5: cmp    esi,edi
0x1401d22b7: jle    0x1401d232c
0x1401d22b9: lea    ebx,[rdi*2-0x1]
0x1401d22c0: add    ebx,edi
0x1401d22c2: lea    rcx,[rbp+0x250]
0x1401d22c9: call   0x1400bb360
0x1401d22ce: lea    r9d,[rsi-0x1]
0x1401d22d2: mov    DWORD PTR [rsp+0x30],ebx
0x1401d22d6: mov    ebx,0x2
0x1401d22db: mov    DWORD PTR [rsp+0x28],ebx
0x1401d22df: mov    DWORD PTR [rsp+0x20],edi
0x1401d22e3: xor    r8d,r8d
0x1401d22e6: mov    edx,DWORD PTR [r12+0x8440]
0x1401d22ee: lea    rcx,[rbp+0x250]
0x1401d22f5: call   0x1400bb380
0x1401d22fa: lea    r9d,[r13+0x1]
0x1401d22fe: mov    DWORD PTR [rsp+0x28],0x0
0x1401d2306: mov    r13,QWORD PTR [rsp+0x78]
0x1401d230b: movzx  eax,BYTE PTR [r13+0x8444]
0x1401d2313: mov    BYTE PTR [rsp+0x20],al
0x1401d2317: mov    r8d,DWORD PTR [rbp-0x3c]
0x1401d231b: mov    edx,DWORD PTR [rbp-0x38]
0x1401d231e: lea    rcx,[rbp+0x250]
0x1401d2325: call   0x14140f4d0
0x1401d232a: jmp    0x1401d2336
0x1401d232c: mov    r13,QWORD PTR [rsp+0x78]
0x1401d2331: mov    ebx,0x2
0x1401d2336: test   r15,r15
0x1401d2339: jne    0x1401d2362
0x1401d233b: cmp    QWORD PTR [r13+0x8448],r15
0x1401d2342: je     0x1401c6068
0x1401d2348: mov    QWORD PTR [r13+0x8448],r15
0x1401d234f: mov    edx,ebx
0x1401d2351: lea    rcx,[rip+0x2478098]        # 0x14264a3f0
0x1401d2358: call   0x140ae7c00
0x1401d235d: jmp    0x1401c6068
0x1401d2362: mov    edi,DWORD PTR [rbp-0x20]
0x1401d2365: lea    esi,[rdi-0x37]
0x1401d2368: add    edi,0xfffffffe
0x1401d236b: movsxd r13,DWORD PTR [rsp+0x70]
0x1401d2370: lea    r12d,[r13+0xd]
0x1401d2374: mov    DWORD PTR [rbp-0x60],r12d
0x1401d2378: mov    r15d,r13d
0x1401d237b: cmp    r13d,r12d
0x1401d237e: jg     0x1401d2465
0x1401d2384: mov    r14,r13
0x1401d2387: nop    WORD PTR [rax+rax*1+0x0]
0x1401d2390: mov    ebx,esi
0x1401d2392: cmp    esi,edi
0x1401d2394: jg     0x1401d2456
0x1401d239a: movsxd r13,r13d
0x1401d239d: movsxd r12,r12d
0x1401d23a0: mov    r8d,ebx
0x1401d23a3: mov    edx,r15d
0x1401d23a6: lea    rcx,[rip+0x2478043]        # 0x14264a3f0
0x1401d23ad: call   0x1400bb120
0x1401d23b2: xor    r8d,r8d
0x1401d23b5: xor    edx,edx
0x1401d23b7: lea    rcx,[rip+0x2478032]        # 0x14264a3f0
0x1401d23be: call   0x1400bb190
0x1401d23c3: cmp    r14,r13
0x1401d23c6: jne    0x1401d23ef
0x1401d23c8: cmp    ebx,esi
0x1401d23ca: jne    0x1401d23d4
0x1401d23cc: mov    edx,DWORD PTR [rip+0x2479942]        # 0x14264bd14
0x1401d23d2: jmp    0x1401d2437
0x1401d23d4: lea    rcx,[rip+0x2478015]        # 0x14264a3f0
0x1401d23db: cmp    ebx,edi
0x1401d23dd: jne    0x1401d23e7
0x1401d23df: mov    edx,DWORD PTR [rip+0x2479947]        # 0x14264bd2c
0x1401d23e5: jmp    0x1401d243e
0x1401d23e7: mov    edx,DWORD PTR [rip+0x2479933]        # 0x14264bd20
0x1401d23ed: jmp    0x1401d243e
0x1401d23ef: cmp    r14,r12
0x1401d23f2: jne    0x1401d241b
0x1401d23f4: cmp    ebx,esi
0x1401d23f6: jne    0x1401d2400
0x1401d23f8: mov    edx,DWORD PTR [rip+0x247991e]        # 0x14264bd1c
0x1401d23fe: jmp    0x1401d2437
0x1401d2400: lea    rcx,[rip+0x2477fe9]        # 0x14264a3f0
0x1401d2407: cmp    ebx,edi
0x1401d2409: jne    0x1401d2413
0x1401d240b: mov    edx,DWORD PTR [rip+0x2479923]        # 0x14264bd34
0x1401d2411: jmp    0x1401d243e
0x1401d2413: mov    edx,DWORD PTR [rip+0x247990f]        # 0x14264bd28
0x1401d2419: jmp    0x1401d243e
0x1401d241b: cmp    ebx,esi
0x1401d241d: jne    0x1401d2427
0x1401d241f: mov    edx,DWORD PTR [rip+0x24798f3]        # 0x14264bd18
0x1401d2425: jmp    0x1401d2437
0x1401d2427: cmp    ebx,edi
0x1401d2429: mov    edx,DWORD PTR [rip+0x2479901]        # 0x14264bd30
0x1401d242f: je     0x1401d2437
0x1401d2431: mov    edx,DWORD PTR [rip+0x24798ed]        # 0x14264bd24
0x1401d2437: lea    rcx,[rip+0x2477fb2]        # 0x14264a3f0
0x1401d243e: call   0x140adaad0
0x1401d2443: inc    ebx
0x1401d2445: cmp    ebx,edi
0x1401d2447: jle    0x1401d23a0
0x1401d244d: mov    r12d,DWORD PTR [rbp-0x60]
0x1401d2451: mov    r13d,DWORD PTR [rsp+0x70]
0x1401d2456: inc    r15d
0x1401d2459: inc    r14
0x1401d245c: cmp    r15d,r12d
0x1401d245f: jle    0x1401d2390
0x1401d2465: add    esi,0x2
0x1401d2468: lea    edi,[r13+0x1]
0x1401d246c: xor    r8d,r8d
0x1401d246f: mov    edx,0x7
0x1401d2474: mov    r9b,0x1
0x1401d2477: lea    rcx,[rip+0x2477f72]        # 0x14264a3f0
0x1401d247e: call   0x1400bb130
0x1401d2483: mov    rbx,QWORD PTR [rsp+0x78]
0x1401d2488: lea    rdx,[rbp+0xc0]
0x1401d248f: lea    rcx,[rbx+0x8450]
0x1401d2496: call   0x14006f240
0x1401d249b: lea    rdx,[rbp+0x190]
0x1401d24a2: lea    rcx,[rbx+0x8450]
0x1401d24a9: call   0x14006f230
0x1401d24ae: lea    r8,[rbp+0x190]
0x1401d24b5: lea    rdx,[rbp+0x1]
0x1401d24b9: lea    rcx,[rbp+0xc0]
0x1401d24c0: call   0x14006ee20
0x1401d24c5: xor    edx,edx
0x1401d24c7: movzx  ecx,BYTE PTR [rax]
0x1401d24ca: call   0x1400657b0
0x1401d24cf: test   al,al
0x1401d24d1: je     0x1401d2549
0x1401d24d3: lea    ebx,[r13+0x8]
0x1401d24d7: nop    WORD PTR [rax+rax*1+0x0]
0x1401d24e0: mov    r8d,esi
0x1401d24e3: mov    edx,edi
0x1401d24e5: lea    rcx,[rip+0x2477f04]        # 0x14264a3f0
0x1401d24ec: call   0x1400bb120
0x1401d24f1: lea    rcx,[rbp+0xc0]
0x1401d24f8: call   0x14006ee10
0x1401d24fd: xor    r9d,r9d
0x1401d2500: xor    r8d,r8d
0x1401d2503: mov    rdx,QWORD PTR [rax]
0x1401d2506: lea    rcx,[rip+0x2477ee3]        # 0x14264a3f0
0x1401d250d: call   0x140ad9960
0x1401d2512: cmp    edi,ebx
0x1401d2514: jge    0x1401d2549
0x1401d2516: lea    rcx,[rbp+0xc0]
0x1401d251d: call   0x14006ee00
0x1401d2522: inc    edi
0x1401d2524: lea    r8,[rbp+0x190]
0x1401d252b: lea    rdx,[rbp+0x1]
0x1401d252f: lea    rcx,[rbp+0xc0]
0x1401d2536: call   0x14006ee20
0x1401d253b: xor    edx,edx
0x1401d253d: movzx  ecx,BYTE PTR [rax]
0x1401d2540: call   0x1400657b0
0x1401d2545: test   al,al
0x1401d2547: jne    0x1401d24e0
0x1401d2549: add    edi,0x2
0x1401d254c: mov    r13,QWORD PTR [rsp+0x78]
0x1401d2551: cmp    QWORD PTR [r13+0x8468],0x0
0x1401d2559: je     0x1401d25bd
0x1401d255b: xor    r8d,r8d
0x1401d255e: mov    edx,0x6
0x1401d2563: mov    r9b,0x1
0x1401d2566: lea    rcx,[rip+0x2477e83]        # 0x14264a3f0
0x1401d256d: call   0x1400bb130
0x1401d2572: mov    r8d,esi
0x1401d2575: mov    edx,edi
0x1401d2577: lea    rcx,[rip+0x2477e72]        # 0x14264a3f0
0x1401d257e: call   0x1400bb120
0x1401d2583: lea    rdx,[rip+0x1431e56]        # 0x1416043e0  'Claimed by your local government'
0x1401d258a: lea    rcx,[rbp+0x35b0]
0x1401d2591: call   0x140068150
0x1401d2596: nop
0x1401d2597: xor    r9d,r9d
0x1401d259a: xor    r8d,r8d
0x1401d259d: lea    rdx,[rbp+0x35b0]
0x1401d25a4: lea    rcx,[rip+0x2477e45]        # 0x14264a3f0
0x1401d25ab: call   0x140ad9960
0x1401d25b0: nop
0x1401d25b1: lea    rcx,[rbp+0x35b0]
0x1401d25b8: jmp    0x1401d2707
0x1401d25bd: cmp    QWORD PTR [r13+0x8470],0x0
0x1401d25c5: je     0x1401d26a0
0x1401d25cb: xor    r8d,r8d
0x1401d25ce: mov    edx,0x6
0x1401d25d3: mov    r9b,0x1
0x1401d25d6: lea    rcx,[rip+0x2477e13]        # 0x14264a3f0
0x1401d25dd: call   0x1400bb130
0x1401d25e2: mov    r8d,esi
0x1401d25e5: mov    edx,edi
0x1401d25e7: lea    rcx,[rip+0x2477e02]        # 0x14264a3f0
0x1401d25ee: call   0x1400bb120
0x1401d25f3: lea    rdx,[rip+0x1431e0e]        # 0x141604408  'Claimed by local '
0x1401d25fa: lea    rcx,[rbp+0x35d0]
0x1401d2601: call   0x140068150
0x1401d2606: nop
0x1401d2607: xor    r9d,r9d
0x1401d260a: mov    r8b,0x3
0x1401d260d: lea    rdx,[rbp+0x35d0]
0x1401d2614: lea    rcx,[rip+0x2477dd5]        # 0x14264a3f0
0x1401d261b: call   0x140ad9960
0x1401d2620: nop
0x1401d2621: lea    rcx,[rbp+0x35d0]
0x1401d2628: call   0x140067e30
0x1401d262d: lea    rcx,[rbp+0x330]
0x1401d2634: call   0x140072080
0x1401d2639: lea    rcx,[rbp+0x1650]
0x1401d2640: call   0x14006f690
0x1401d2645: nop
0x1401d2646: mov    r8,QWORD PTR [r13+0x8470]
0x1401d264d: mov    eax,0x1
0x1401d2652: mov    WORD PTR [rsp+0x28],ax
0x1401d2657: mov    WORD PTR [rsp+0x20],ax
0x1401d265c: lea    r9,[rbp+0x330]
0x1401d2663: mov    r8d,DWORD PTR [r8+0xe0]
0x1401d266a: lea    rdx,[rbp+0x1650]
0x1401d2671: lea    rcx,[rip+0x2327640]        # 0x1424f9cb8
0x1401d2678: call   0x140b92f10
0x1401d267d: xor    r9d,r9d
0x1401d2680: xor    r8d,r8d
0x1401d2683: lea    rdx,[rbp+0x1650]
0x1401d268a: lea    rcx,[rip+0x2477d5f]        # 0x14264a3f0
0x1401d2691: call   0x140ad9960
0x1401d2696: nop
0x1401d2697: lea    rcx,[rbp+0x1650]
0x1401d269e: jmp    0x1401d2707
0x1401d26a0: cmp    QWORD PTR [r13+0x8478],0x0
0x1401d26a8: je     0x1401d270c
0x1401d26aa: xor    r8d,r8d
0x1401d26ad: mov    edx,0x6
0x1401d26b2: mov    r9b,0x1
0x1401d26b5: lea    rcx,[rip+0x2477d34]        # 0x14264a3f0
0x1401d26bc: call   0x1400bb130
0x1401d26c1: mov    r8d,esi
0x1401d26c4: mov    edx,edi
0x1401d26c6: lea    rcx,[rip+0x2477d23]        # 0x14264a3f0
0x1401d26cd: call   0x1400bb120
0x1401d26d2: lea    rdx,[rip+0x1431d47]        # 0x141604420  'Claimed by local family'
0x1401d26d9: lea    rcx,[rbp+0x35f0]
0x1401d26e0: call   0x140068150
0x1401d26e5: nop
0x1401d26e6: xor    r9d,r9d
0x1401d26e9: xor    r8d,r8d
0x1401d26ec: lea    rdx,[rbp+0x35f0]
0x1401d26f3: lea    rcx,[rip+0x2477cf6]        # 0x14264a3f0
0x1401d26fa: call   0x140ad9960
0x1401d26ff: nop
0x1401d2700: lea    rcx,[rbp+0x35f0]
0x1401d2707: call   0x140067e30
0x1401d270c: cmp    QWORD PTR [r13+0x1c0],0x0
0x1401d2714: jne    0x1401d2787
0x1401d2716: cmp    QWORD PTR [r13+0x1b8],0x0
0x1401d271e: jne    0x1401d2787
0x1401d2720: xor    r8d,r8d
0x1401d2723: xor    edx,edx
0x1401d2725: mov    r9b,0x1
0x1401d2728: lea    rcx,[rip+0x2477cc1]        # 0x14264a3f0
0x1401d272f: call   0x1400bb130
0x1401d2734: lea    edx,[r12-0x1]
0x1401d2739: mov    r8d,esi
0x1401d273c: lea    rcx,[rip+0x2477cad]        # 0x14264a3f0
0x1401d2743: call   0x1400bb120
0x1401d2748: lea    rdx,[rip+0x14313b1]        # 0x141603b00  'Cannot order mission without leader'
0x1401d274f: lea    rcx,[rbp+0x3610]
0x1401d2756: call   0x140068150
0x1401d275b: nop
0x1401d275c: xor    r9d,r9d
0x1401d275f: xor    r8d,r8d
0x1401d2762: lea    rdx,[rbp+0x3610]
0x1401d2769: lea    rcx,[rip+0x2477c80]        # 0x14264a3f0
0x1401d2770: call   0x140ad9960
0x1401d2775: nop
0x1401d2776: lea    rcx,[rbp+0x3610]
0x1401d277d: call   0x140067e30
0x1401d2782: jmp    0x1401c6068
0x1401d2787: movzx  r8d,WORD PTR [r13+0x19c]
0x1401d278f: movzx  edx,WORD PTR [r13+0x198]
0x1401d2797: mov    rcx,QWORD PTR [rip+0x23193ba]        # 0x1424ebb58
0x1401d279e: call   0x1401bc2d0
0x1401d27a3: xor    r8d,r8d
0x1401d27a6: mov    r9b,0x1
0x1401d27a9: lea    rcx,[rip+0x2477c40]        # 0x14264a3f0
0x1401d27b0: test   eax,eax
0x1401d27b2: js     0x1401d2811
0x1401d27b4: mov    edx,0x7
0x1401d27b9: call   0x1400bb130
0x1401d27be: mov    r8d,esi
0x1401d27c1: lea    edx,[r12-0x1]
0x1401d27c6: lea    rcx,[rip+0x2477c23]        # 0x14264a3f0
0x1401d27cd: call   0x1400bb120
0x1401d27d2: lea    rdx,[rip+0x1431c5f]        # 0x141604438  'Click to recover (creates new mission)'
0x1401d27d9: lea    rcx,[rbp+0x3630]
0x1401d27e0: call   0x140068150
0x1401d27e5: nop
0x1401d27e6: xor    r9d,r9d
0x1401d27e9: xor    r8d,r8d
0x1401d27ec: lea    rdx,[rbp+0x3630]
0x1401d27f3: lea    rcx,[rip+0x2477bf6]        # 0x14264a3f0
0x1401d27fa: call   0x140ad9960
0x1401d27ff: nop
0x1401d2800: lea    rcx,[rbp+0x3630]
0x1401d2807: call   0x140067e30
0x1401d280c: jmp    0x1401c6068
0x1401d2811: xor    edx,edx
0x1401d2813: call   0x1400bb130
0x1401d2818: mov    r8d,esi
0x1401d281b: lea    edx,[r12-0x1]
0x1401d2820: lea    rcx,[rip+0x2477bc9]        # 0x14264a3f0
0x1401d2827: call   0x1400bb120
0x1401d282c: lea    rdx,[rip+0x14312ad]        # 0x141603ae0  'Inaccessible mission location'
0x1401d2833: lea    rcx,[rbp+0x3650]
0x1401d283a: call   0x140068150
0x1401d283f: nop
0x1401d2840: xor    r9d,r9d
0x1401d2843: xor    r8d,r8d
0x1401d2846: lea    rdx,[rbp+0x3650]
0x1401d284d: lea    rcx,[rip+0x2477b9c]        # 0x14264a3f0
0x1401d2854: call   0x140ad9960
0x1401d2859: nop
0x1401d285a: lea    rcx,[rbp+0x3650]
0x1401d2861: call   0x140067e30
0x1401d2866: jmp    0x1401c6068
0x1401d286b: mov    r13,r14
0x1401d286e: jmp    0x1401c6068
0x1401d2873: cmp    r15,rsi
0x1401d2876: jne    0x1401d287c
0x1401d2878: mov    edx,DWORD PTR [rbx]
0x1401d287a: jmp    0x1401d287f
0x1401d287c: mov    edx,DWORD PTR [rbx-0xc]
0x1401d287f: lea    rcx,[rip+0x2477b6a]        # 0x14264a3f0
0x1401d2886: call   0x140adaad0
0x1401d288b: inc    r14d
0x1401d288e: add    rbx,0x4
0x1401d2892: cmp    rbx,rdi
0x1401d2895: jl     0x1401c6100
0x1401d289b: inc    r12d
0x1401d289e: inc    r15
0x1401d28a1: mov    edi,esi
0x1401d28a3: cmp    r12d,esi
0x1401d28a6: mov    ecx,DWORD PTR [rsp+0x74]
0x1401d28aa: jle    0x1401c60e6
0x1401d28b0: lea    esi,[rsi-0x12]
0x1401d28b3: mov    r13d,DWORD PTR [rbp-0x60]
0x1401d28b7: xor    r8d,r8d
0x1401d28ba: mov    edx,0x7
0x1401d28bf: mov    r9b,0x1
0x1401d28c2: lea    rcx,[rip+0x2477b27]        # 0x14264a3f0
0x1401d28c9: call   0x1400bb130
0x1401d28ce: lea    r8d,[rsi+0x2]
0x1401d28d2: mov    edx,DWORD PTR [rsp+0x74]
0x1401d28d6: inc    edx
0x1401d28d8: lea    rcx,[rip+0x2477b11]        # 0x14264a3f0
0x1401d28df: call   0x1400bb120
0x1401d28e4: lea    rdx,[rip+0x1431b75]        # 0x141604460  'Center on fort'
0x1401d28eb: lea    rcx,[rbp+0x3670]
0x1401d28f2: call   0x140068150
0x1401d28f7: nop
0x1401d28f8: xor    r9d,r9d
0x1401d28fb: xor    r8d,r8d
0x1401d28fe: lea    rdx,[rbp+0x3670]
0x1401d2905: lea    rcx,[rip+0x2477ae4]        # 0x14264a3f0
0x1401d290c: call   0x140ad9960
0x1401d2911: nop
0x1401d2912: lea    rcx,[rbp+0x3670]
0x1401d2919: call   0x140067e30
0x1401d291e: mov    ebx,esi
0x1401d2920: cmp    esi,edi
0x1401d2922: jg     0x1401d2b4f
0x1401d2928: mov    r12,QWORD PTR [rsp+0x78]
0x1401d292d: nop    DWORD PTR [rax]
0x1401d2930: mov    r8d,ebx
0x1401d2933: mov    edx,r13d
0x1401d2936: lea    rcx,[rip+0x2477ab3]        # 0x14264a3f0
0x1401d293d: call   0x1400bb120
0x1401d2942: mov    eax,DWORD PTR [r12+0x1b4]
0x1401d294a: cmp    eax,0x2
0x1401d294d: je     0x1401d29b9
0x1401d294f: cmp    eax,0x3
0x1401d2952: je     0x1401d29b9
0x1401d2954: cmp    eax,0x8
0x1401d2957: je     0x1401d29b9
0x1401d2959: lea    rcx,[r12+0x2b8]
0x1401d2961: call   0x14006ee50
0x1401d2966: test   rax,rax
0x1401d2969: je     0x1401d2992
0x1401d296b: cmp    ebx,esi
0x1401d296d: jne    0x1401d2977
0x1401d296f: mov    edx,DWORD PTR [rip+0x2479507]        # 0x14264be7c
0x1401d2975: jmp    0x1401d29d5
0x1401d2977: lea    rcx,[rip+0x2477a72]        # 0x14264a3f0
0x1401d297e: cmp    ebx,edi
0x1401d2980: jne    0x1401d298a
0x1401d2982: mov    edx,DWORD PTR [rip+0x247950c]        # 0x14264be94
0x1401d2988: jmp    0x1401d29dc
0x1401d298a: mov    edx,DWORD PTR [rip+0x24794f8]        # 0x14264be88
0x1401d2990: jmp    0x1401d29dc
0x1401d2992: cmp    ebx,esi
0x1401d2994: jne    0x1401d299e
0x1401d2996: mov    edx,DWORD PTR [rip+0x2479528]        # 0x14264bec4
0x1401d299c: jmp    0x1401d29d5
0x1401d299e: lea    rcx,[rip+0x2477a4b]        # 0x14264a3f0
0x1401d29a5: cmp    ebx,edi
0x1401d29a7: jne    0x1401d29b1
0x1401d29a9: mov    edx,DWORD PTR [rip+0x247952d]        # 0x14264bedc
0x1401d29af: jmp    0x1401d29dc
0x1401d29b1: mov    edx,DWORD PTR [rip+0x2479519]        # 0x14264bed0
0x1401d29b7: jmp    0x1401d29dc
0x1401d29b9: cmp    ebx,esi
0x1401d29bb: jne    0x1401d29c5
0x1401d29bd: mov    edx,DWORD PTR [rip+0x24794dd]        # 0x14264bea0
0x1401d29c3: jmp    0x1401d29d5
0x1401d29c5: cmp    ebx,edi
0x1401d29c7: mov    edx,DWORD PTR [rip+0x24794eb]        # 0x14264beb8
0x1401d29cd: je     0x1401d29d5
0x1401d29cf: mov    edx,DWORD PTR [rip+0x24794d7]        # 0x14264beac
0x1401d29d5: lea    rcx,[rip+0x2477a14]        # 0x14264a3f0
0x1401d29dc: call   0x140adaad0
0x1401d29e1: mov    r8d,ebx
0x1401d29e4: lea    edx,[r13+0x1]
0x1401d29e8: lea    rcx,[rip+0x2477a01]        # 0x14264a3f0
0x1401d29ef: call   0x1400bb120
0x1401d29f4: mov    eax,DWORD PTR [r12+0x1b4]
0x1401d29fc: cmp    eax,0x2
0x1401d29ff: je     0x1401d2a6b
0x1401d2a01: cmp    eax,0x3
0x1401d2a04: je     0x1401d2a6b
0x1401d2a06: cmp    eax,0x8
0x1401d2a09: je     0x1401d2a6b
0x1401d2a0b: lea    rcx,[r12+0x2b8]
0x1401d2a13: call   0x14006ee50
0x1401d2a18: test   rax,rax
0x1401d2a1b: je     0x1401d2a44
0x1401d2a1d: cmp    ebx,esi
0x1401d2a1f: jne    0x1401d2a29
0x1401d2a21: mov    edx,DWORD PTR [rip+0x2479459]        # 0x14264be80
0x1401d2a27: jmp    0x1401d2a87
0x1401d2a29: lea    rcx,[rip+0x24779c0]        # 0x14264a3f0
0x1401d2a30: cmp    ebx,edi
0x1401d2a32: jne    0x1401d2a3c
0x1401d2a34: mov    edx,DWORD PTR [rip+0x247945e]        # 0x14264be98
0x1401d2a3a: jmp    0x1401d2a8e
0x1401d2a3c: mov    edx,DWORD PTR [rip+0x247944a]        # 0x14264be8c
0x1401d2a42: jmp    0x1401d2a8e
0x1401d2a44: cmp    ebx,esi
0x1401d2a46: jne    0x1401d2a50
0x1401d2a48: mov    edx,DWORD PTR [rip+0x247947a]        # 0x14264bec8
0x1401d2a4e: jmp    0x1401d2a87
0x1401d2a50: lea    rcx,[rip+0x2477999]        # 0x14264a3f0
0x1401d2a57: cmp    ebx,edi
0x1401d2a59: jne    0x1401d2a63
0x1401d2a5b: mov    edx,DWORD PTR [rip+0x247947f]        # 0x14264bee0
0x1401d2a61: jmp    0x1401d2a8e
0x1401d2a63: mov    edx,DWORD PTR [rip+0x247946b]        # 0x14264bed4
0x1401d2a69: jmp    0x1401d2a8e
0x1401d2a6b: cmp    ebx,esi
0x1401d2a6d: jne    0x1401d2a77
0x1401d2a6f: mov    edx,DWORD PTR [rip+0x247942f]        # 0x14264bea4
0x1401d2a75: jmp    0x1401d2a87
0x1401d2a77: cmp    ebx,edi
0x1401d2a79: mov    edx,DWORD PTR [rip+0x247943d]        # 0x14264bebc
0x1401d2a7f: je     0x1401d2a87
0x1401d2a81: mov    edx,DWORD PTR [rip+0x2479429]        # 0x14264beb0
0x1401d2a87: lea    rcx,[rip+0x2477962]        # 0x14264a3f0
0x1401d2a8e: call   0x140adaad0
0x1401d2a93: mov    r8d,ebx
0x1401d2a96: lea    edx,[r13+0x2]
0x1401d2a9a: lea    rcx,[rip+0x247794f]        # 0x14264a3f0
0x1401d2aa1: call   0x1400bb120
0x1401d2aa6: mov    eax,DWORD PTR [r12+0x1b4]
0x1401d2aae: cmp    eax,0x2
0x1401d2ab1: je     0x1401d2b1d
0x1401d2ab3: cmp    eax,0x3
0x1401d2ab6: je     0x1401d2b1d
0x1401d2ab8: cmp    eax,0x8
0x1401d2abb: je     0x1401d2b1d
0x1401d2abd: lea    rcx,[r12+0x2b8]
0x1401d2ac5: call   0x14006ee50
0x1401d2aca: test   rax,rax
0x1401d2acd: je     0x1401d2af6
0x1401d2acf: cmp    ebx,esi
0x1401d2ad1: jne    0x1401d2adb
0x1401d2ad3: mov    edx,DWORD PTR [rip+0x24793ab]        # 0x14264be84
0x1401d2ad9: jmp    0x1401d2b39
0x1401d2adb: lea    rcx,[rip+0x247790e]        # 0x14264a3f0
0x1401d2ae2: cmp    ebx,edi
0x1401d2ae4: jne    0x1401d2aee
0x1401d2ae6: mov    edx,DWORD PTR [rip+0x24793b0]        # 0x14264be9c
0x1401d2aec: jmp    0x1401d2b40
0x1401d2aee: mov    edx,DWORD PTR [rip+0x247939c]        # 0x14264be90
0x1401d2af4: jmp    0x1401d2b40
0x1401d2af6: cmp    ebx,esi
0x1401d2af8: jne    0x1401d2b02
0x1401d2afa: mov    edx,DWORD PTR [rip+0x24793cc]        # 0x14264becc
0x1401d2b00: jmp    0x1401d2b39
0x1401d2b02: lea    rcx,[rip+0x24778e7]        # 0x14264a3f0
0x1401d2b09: cmp    ebx,edi
0x1401d2b0b: jne    0x1401d2b15
0x1401d2b0d: mov    edx,DWORD PTR [rip+0x24793d1]        # 0x14264bee4
0x1401d2b13: jmp    0x1401d2b40
0x1401d2b15: mov    edx,DWORD PTR [rip+0x24793bd]        # 0x14264bed8
0x1401d2b1b: jmp    0x1401d2b40
0x1401d2b1d: cmp    ebx,esi
0x1401d2b1f: jne    0x1401d2b29
0x1401d2b21: mov    edx,DWORD PTR [rip+0x2479381]        # 0x14264bea8
0x1401d2b27: jmp    0x1401d2b39
0x1401d2b29: cmp    ebx,edi
0x1401d2b2b: mov    edx,DWORD PTR [rip+0x247938f]        # 0x14264bec0
0x1401d2b31: je     0x1401d2b39
0x1401d2b33: mov    edx,DWORD PTR [rip+0x247937b]        # 0x14264beb4
0x1401d2b39: lea    rcx,[rip+0x24778b0]        # 0x14264a3f0
0x1401d2b40: call   0x140adaad0
0x1401d2b45: inc    ebx
0x1401d2b47: cmp    ebx,edi
0x1401d2b49: jle    0x1401d2930
0x1401d2b4f: xor    r8d,r8d
0x1401d2b52: mov    edx,0x7
0x1401d2b57: mov    r9b,0x1
0x1401d2b5a: lea    rcx,[rip+0x247788f]        # 0x14264a3f0
0x1401d2b61: call   0x1400bb130
0x1401d2b66: lea    r8d,[rsi+0x5]
0x1401d2b6a: lea    edx,[r13+0x1]
0x1401d2b6e: lea    rcx,[rip+0x247787b]        # 0x14264a3f0
0x1401d2b75: call   0x1400bb120
0x1401d2b7a: lea    rdx,[rip+0x14318ef]        # 0x141604470  'Missions'
0x1401d2b81: lea    rcx,[rbp+0x3690]
0x1401d2b88: call   0x140068150
0x1401d2b8d: nop
0x1401d2b8e: xor    r9d,r9d
0x1401d2b91: xor    r8d,r8d
0x1401d2b94: lea    rdx,[rbp+0x3690]
0x1401d2b9b: lea    rcx,[rip+0x247784e]        # 0x14264a3f0
0x1401d2ba2: call   0x140ad9960
0x1401d2ba7: nop
0x1401d2ba8: lea    rcx,[rbp+0x3690]
0x1401d2baf: call   0x140067e30
0x1401d2bb4: mov    ebx,esi
0x1401d2bb6: mov    r13,QWORD PTR [rsp+0x78]
0x1401d2bbb: cmp    esi,edi
0x1401d2bbd: jg     0x1401d2d1d
0x1401d2bc3: mov    eax,DWORD PTR [rbp-0x58]
0x1401d2bc6: lea    r14d,[rax+0x1]
0x1401d2bca: lea    r15d,[rax+0x2]
0x1401d2bce: xchg   ax,ax
0x1401d2bd0: mov    r8d,ebx
0x1401d2bd3: mov    edx,eax
0x1401d2bd5: lea    rcx,[rip+0x2477814]        # 0x14264a3f0
0x1401d2bdc: call   0x1400bb120
0x1401d2be1: cmp    DWORD PTR [r13+0x1b4],0x4
0x1401d2be9: jne    0x1401d2c12
0x1401d2beb: cmp    ebx,esi
0x1401d2bed: jne    0x1401d2bf7
0x1401d2bef: mov    edx,DWORD PTR [rip+0x24792ab]        # 0x14264bea0
0x1401d2bf5: jmp    0x1401d2c2e
0x1401d2bf7: lea    rcx,[rip+0x24777f2]        # 0x14264a3f0
0x1401d2bfe: cmp    ebx,edi
0x1401d2c00: jne    0x1401d2c0a
0x1401d2c02: mov    edx,DWORD PTR [rip+0x24792b0]        # 0x14264beb8
0x1401d2c08: jmp    0x1401d2c35
0x1401d2c0a: mov    edx,DWORD PTR [rip+0x247929c]        # 0x14264beac
0x1401d2c10: jmp    0x1401d2c35
0x1401d2c12: cmp    ebx,esi
0x1401d2c14: jne    0x1401d2c1e
0x1401d2c16: mov    edx,DWORD PTR [rip+0x2479260]        # 0x14264be7c
0x1401d2c1c: jmp    0x1401d2c2e
0x1401d2c1e: cmp    ebx,edi
0x1401d2c20: mov    edx,DWORD PTR [rip+0x247926e]        # 0x14264be94
0x1401d2c26: je     0x1401d2c2e
0x1401d2c28: mov    edx,DWORD PTR [rip+0x247925a]        # 0x14264be88
0x1401d2c2e: lea    rcx,[rip+0x24777bb]        # 0x14264a3f0
0x1401d2c35: call   0x140adaad0
0x1401d2c3a: mov    r8d,ebx
0x1401d2c3d: mov    edx,r14d
0x1401d2c40: lea    rcx,[rip+0x24777a9]        # 0x14264a3f0
0x1401d2c47: call   0x1400bb120
0x1401d2c4c: cmp    DWORD PTR [r13+0x1b4],0x4
0x1401d2c54: jne    0x1401d2c7d
0x1401d2c56: cmp    ebx,esi
0x1401d2c58: jne    0x1401d2c62
0x1401d2c5a: mov    edx,DWORD PTR [rip+0x2479244]        # 0x14264bea4
0x1401d2c60: jmp    0x1401d2c99
0x1401d2c62: lea    rcx,[rip+0x2477787]        # 0x14264a3f0
0x1401d2c69: cmp    ebx,edi
0x1401d2c6b: jne    0x1401d2c75
0x1401d2c6d: mov    edx,DWORD PTR [rip+0x2479249]        # 0x14264bebc
0x1401d2c73: jmp    0x1401d2ca0
0x1401d2c75: mov    edx,DWORD PTR [rip+0x2479235]        # 0x14264beb0
0x1401d2c7b: jmp    0x1401d2ca0
0x1401d2c7d: cmp    ebx,esi
0x1401d2c7f: jne    0x1401d2c89
0x1401d2c81: mov    edx,DWORD PTR [rip+0x24791f9]        # 0x14264be80
0x1401d2c87: jmp    0x1401d2c99
0x1401d2c89: cmp    ebx,edi
0x1401d2c8b: mov    edx,DWORD PTR [rip+0x2479207]        # 0x14264be98
0x1401d2c91: je     0x1401d2c99
0x1401d2c93: mov    edx,DWORD PTR [rip+0x24791f3]        # 0x14264be8c
0x1401d2c99: lea    rcx,[rip+0x2477750]        # 0x14264a3f0
0x1401d2ca0: call   0x140adaad0
0x1401d2ca5: mov    r8d,ebx
0x1401d2ca8: mov    edx,r15d
0x1401d2cab: lea    rcx,[rip+0x247773e]        # 0x14264a3f0
0x1401d2cb2: call   0x1400bb120
0x1401d2cb7: cmp    DWORD PTR [r13+0x1b4],0x4
0x1401d2cbf: jne    0x1401d2ce8
0x1401d2cc1: cmp    ebx,esi
0x1401d2cc3: jne    0x1401d2ccd
0x1401d2cc5: mov    edx,DWORD PTR [rip+0x24791dd]        # 0x14264bea8
0x1401d2ccb: jmp    0x1401d2d04
0x1401d2ccd: lea    rcx,[rip+0x247771c]        # 0x14264a3f0
0x1401d2cd4: cmp    ebx,edi
0x1401d2cd6: jne    0x1401d2ce0
0x1401d2cd8: mov    edx,DWORD PTR [rip+0x24791e2]        # 0x14264bec0
0x1401d2cde: jmp    0x1401d2d0b
0x1401d2ce0: mov    edx,DWORD PTR [rip+0x24791ce]        # 0x14264beb4
0x1401d2ce6: jmp    0x1401d2d0b
0x1401d2ce8: cmp    ebx,esi
0x1401d2cea: jne    0x1401d2cf4
0x1401d2cec: mov    edx,DWORD PTR [rip+0x2479192]        # 0x14264be84
0x1401d2cf2: jmp    0x1401d2d04
0x1401d2cf4: cmp    ebx,edi
0x1401d2cf6: mov    edx,DWORD PTR [rip+0x24791a0]        # 0x14264be9c
0x1401d2cfc: je     0x1401d2d04
0x1401d2cfe: mov    edx,DWORD PTR [rip+0x247918c]        # 0x14264be90
0x1401d2d04: lea    rcx,[rip+0x24776e5]        # 0x14264a3f0
0x1401d2d0b: call   0x140adaad0
0x1401d2d10: inc    ebx
0x1401d2d12: cmp    ebx,edi
0x1401d2d14: mov    eax,DWORD PTR [rbp-0x58]
0x1401d2d17: jle    0x1401d2bd0
0x1401d2d1d: xor    r8d,r8d
0x1401d2d20: mov    edx,0x7
0x1401d2d25: mov    r9b,0x1
0x1401d2d28: lea    rcx,[rip+0x24776c1]        # 0x14264a3f0
0x1401d2d2f: call   0x1400bb130
0x1401d2d34: lea    r8d,[rsi+0x2]
0x1401d2d38: mov    edx,DWORD PTR [rbp-0x58]
0x1401d2d3b: inc    edx
0x1401d2d3d: lea    rcx,[rip+0x24776ac]        # 0x14264a3f0
0x1401d2d44: call   0x1400bb120
0x1401d2d49: lea    rdx,[rip+0x1431730]        # 0x141604480  'News and rumors'
0x1401d2d50: lea    rcx,[rbp+0x36b0]
0x1401d2d57: call   0x140068150
0x1401d2d5c: nop
0x1401d2d5d: xor    r9d,r9d
0x1401d2d60: xor    r8d,r8d
0x1401d2d63: lea    rdx,[rbp+0x36b0]
0x1401d2d6a: lea    rcx,[rip+0x247767f]        # 0x14264a3f0
0x1401d2d71: call   0x140ad9960
0x1401d2d76: nop
0x1401d2d77: lea    rcx,[rbp+0x36b0]
0x1401d2d7e: call   0x140067e30
0x1401d2d83: mov    ebx,esi
0x1401d2d85: cmp    esi,edi
0x1401d2d87: jg     0x1401d2eee
0x1401d2d8d: mov    eax,DWORD PTR [rsp+0x70]
0x1401d2d91: lea    r14d,[rax+0x1]
0x1401d2d95: lea    r15d,[rax+0x2]
0x1401d2d99: nop    DWORD PTR [rax+0x0]
0x1401d2da0: mov    r8d,ebx
0x1401d2da3: mov    edx,eax
0x1401d2da5: lea    rcx,[rip+0x2477644]        # 0x14264a3f0
0x1401d2dac: call   0x1400bb120
0x1401d2db1: cmp    DWORD PTR [r13+0x1b4],0x1
0x1401d2db9: jne    0x1401d2de2
0x1401d2dbb: cmp    ebx,esi
0x1401d2dbd: jne    0x1401d2dc7
0x1401d2dbf: mov    edx,DWORD PTR [rip+0x24790db]        # 0x14264bea0
0x1401d2dc5: jmp    0x1401d2dfe
0x1401d2dc7: lea    rcx,[rip+0x2477622]        # 0x14264a3f0
0x1401d2dce: cmp    ebx,edi
0x1401d2dd0: jne    0x1401d2dda
0x1401d2dd2: mov    edx,DWORD PTR [rip+0x24790e0]        # 0x14264beb8
0x1401d2dd8: jmp    0x1401d2e05
0x1401d2dda: mov    edx,DWORD PTR [rip+0x24790cc]        # 0x14264beac
0x1401d2de0: jmp    0x1401d2e05
0x1401d2de2: cmp    ebx,esi
0x1401d2de4: jne    0x1401d2dee
0x1401d2de6: mov    edx,DWORD PTR [rip+0x2479090]        # 0x14264be7c
0x1401d2dec: jmp    0x1401d2dfe
0x1401d2dee: cmp    ebx,edi
0x1401d2df0: mov    edx,DWORD PTR [rip+0x247909e]        # 0x14264be94
0x1401d2df6: je     0x1401d2dfe
0x1401d2df8: mov    edx,DWORD PTR [rip+0x247908a]        # 0x14264be88
0x1401d2dfe: lea    rcx,[rip+0x24775eb]        # 0x14264a3f0
0x1401d2e05: call   0x140adaad0
0x1401d2e0a: mov    r8d,ebx
0x1401d2e0d: mov    edx,r14d
0x1401d2e10: lea    rcx,[rip+0x24775d9]        # 0x14264a3f0
0x1401d2e17: call   0x1400bb120
0x1401d2e1c: cmp    DWORD PTR [r13+0x1b4],0x1
0x1401d2e24: jne    0x1401d2e4d
0x1401d2e26: cmp    ebx,esi
0x1401d2e28: jne    0x1401d2e32
0x1401d2e2a: mov    edx,DWORD PTR [rip+0x2479074]        # 0x14264bea4
0x1401d2e30: jmp    0x1401d2e69
0x1401d2e32: lea    rcx,[rip+0x24775b7]        # 0x14264a3f0
0x1401d2e39: cmp    ebx,edi
0x1401d2e3b: jne    0x1401d2e45
0x1401d2e3d: mov    edx,DWORD PTR [rip+0x2479079]        # 0x14264bebc
0x1401d2e43: jmp    0x1401d2e70
0x1401d2e45: mov    edx,DWORD PTR [rip+0x2479065]        # 0x14264beb0
0x1401d2e4b: jmp    0x1401d2e70
0x1401d2e4d: cmp    ebx,esi
0x1401d2e4f: jne    0x1401d2e59
0x1401d2e51: mov    edx,DWORD PTR [rip+0x2479029]        # 0x14264be80
0x1401d2e57: jmp    0x1401d2e69
0x1401d2e59: cmp    ebx,edi
0x1401d2e5b: mov    edx,DWORD PTR [rip+0x2479037]        # 0x14264be98
0x1401d2e61: je     0x1401d2e69
0x1401d2e63: mov    edx,DWORD PTR [rip+0x2479023]        # 0x14264be8c
0x1401d2e69: lea    rcx,[rip+0x2477580]        # 0x14264a3f0
0x1401d2e70: call   0x140adaad0
0x1401d2e75: mov    r8d,ebx
0x1401d2e78: mov    edx,r15d
0x1401d2e7b: lea    rcx,[rip+0x247756e]        # 0x14264a3f0
0x1401d2e82: call   0x1400bb120
0x1401d2e87: cmp    DWORD PTR [r13+0x1b4],0x1
0x1401d2e8f: jne    0x1401d2eb8
0x1401d2e91: cmp    ebx,esi
0x1401d2e93: jne    0x1401d2e9d
0x1401d2e95: mov    edx,DWORD PTR [rip+0x247900d]        # 0x14264bea8
0x1401d2e9b: jmp    0x1401d2ed4
0x1401d2e9d: lea    rcx,[rip+0x247754c]        # 0x14264a3f0
0x1401d2ea4: cmp    ebx,edi
0x1401d2ea6: jne    0x1401d2eb0
0x1401d2ea8: mov    edx,DWORD PTR [rip+0x2479012]        # 0x14264bec0
0x1401d2eae: jmp    0x1401d2edb
0x1401d2eb0: mov    edx,DWORD PTR [rip+0x2478ffe]        # 0x14264beb4
0x1401d2eb6: jmp    0x1401d2edb
0x1401d2eb8: cmp    ebx,esi
0x1401d2eba: jne    0x1401d2ec4
0x1401d2ebc: mov    edx,DWORD PTR [rip+0x2478fc2]        # 0x14264be84
0x1401d2ec2: jmp    0x1401d2ed4
0x1401d2ec4: cmp    ebx,edi
0x1401d2ec6: mov    edx,DWORD PTR [rip+0x2478fd0]        # 0x14264be9c
0x1401d2ecc: je     0x1401d2ed4
0x1401d2ece: mov    edx,DWORD PTR [rip+0x2478fbc]        # 0x14264be90
0x1401d2ed4: lea    rcx,[rip+0x2477515]        # 0x14264a3f0
0x1401d2edb: call   0x140adaad0
0x1401d2ee0: inc    ebx
0x1401d2ee2: cmp    ebx,edi
0x1401d2ee4: mov    eax,DWORD PTR [rsp+0x70]
0x1401d2ee8: jle    0x1401d2da0
0x1401d2eee: xor    r8d,r8d
0x1401d2ef1: mov    edx,0x7
0x1401d2ef6: mov    r9b,0x1
0x1401d2ef9: lea    rcx,[rip+0x24774f0]        # 0x14264a3f0
0x1401d2f00: call   0x1400bb130
0x1401d2f05: lea    r8d,[rsi+0x3]
0x1401d2f09: mov    edx,DWORD PTR [rsp+0x70]
0x1401d2f0d: inc    edx
0x1401d2f0f: lea    rcx,[rip+0x24774da]        # 0x14264a3f0
0x1401d2f16: call   0x1400bb120
0x1401d2f1b: lea    rdx,[rip+0x143156e]        # 0x141604490  'Civilizations'
0x1401d2f22: lea    rcx,[rbp+0x36d0]
0x1401d2f29: call   0x140068150
0x1401d2f2e: nop
0x1401d2f2f: xor    r9d,r9d
0x1401d2f32: xor    r8d,r8d
0x1401d2f35: lea    rdx,[rbp+0x36d0]
0x1401d2f3c: lea    rcx,[rip+0x24774ad]        # 0x14264a3f0
0x1401d2f43: call   0x140ad9960
0x1401d2f48: nop
0x1401d2f49: lea    rcx,[rbp+0x36d0]
0x1401d2f50: call   0x140067e30
0x1401d2f55: mov    ebx,esi
0x1401d2f57: cmp    esi,edi
0x1401d2f59: jg     0x1401d3165
0x1401d2f5f: mov    eax,DWORD PTR [rbp-0x48]
0x1401d2f62: lea    r14d,[rax+0x1]
0x1401d2f66: lea    r15d,[rax+0x2]
0x1401d2f6a: nop    WORD PTR [rax+rax*1+0x0]
0x1401d2f70: mov    r8d,ebx
0x1401d2f73: mov    edx,eax
0x1401d2f75: lea    rcx,[rip+0x2477474]        # 0x14264a3f0
0x1401d2f7c: call   0x1400bb120
0x1401d2f81: cmp    DWORD PTR [r13+0x1b4],0x6
0x1401d2f89: jne    0x1401d2fb2
0x1401d2f8b: cmp    ebx,esi
0x1401d2f8d: jne    0x1401d2f97
0x1401d2f8f: mov    edx,DWORD PTR [rip+0x2478f0b]        # 0x14264bea0
0x1401d2f95: jmp    0x1401d3006
0x1401d2f97: lea    rcx,[rip+0x2477452]        # 0x14264a3f0
0x1401d2f9e: cmp    ebx,edi
0x1401d2fa0: jne    0x1401d2faa
0x1401d2fa2: mov    edx,DWORD PTR [rip+0x2478f10]        # 0x14264beb8
0x1401d2fa8: jmp    0x1401d300d
0x1401d2faa: mov    edx,DWORD PTR [rip+0x2478efc]        # 0x14264beac
0x1401d2fb0: jmp    0x1401d300d
0x1401d2fb2: lea    rcx,[r13+0x83e8]
0x1401d2fb9: call   0x14006ee50
0x1401d2fbe: test   rax,rax
0x1401d2fc1: je     0x1401d2fea
0x1401d2fc3: cmp    ebx,esi
0x1401d2fc5: jne    0x1401d2fcf
0x1401d2fc7: mov    edx,DWORD PTR [rip+0x2478eaf]        # 0x14264be7c
0x1401d2fcd: jmp    0x1401d3006
0x1401d2fcf: lea    rcx,[rip+0x247741a]        # 0x14264a3f0
0x1401d2fd6: cmp    ebx,edi
0x1401d2fd8: jne    0x1401d2fe2
0x1401d2fda: mov    edx,DWORD PTR [rip+0x2478eb4]        # 0x14264be94
0x1401d2fe0: jmp    0x1401d300d
0x1401d2fe2: mov    edx,DWORD PTR [rip+0x2478ea0]        # 0x14264be88
0x1401d2fe8: jmp    0x1401d300d
0x1401d2fea: cmp    ebx,esi
0x1401d2fec: jne    0x1401d2ff6
0x1401d2fee: mov    edx,DWORD PTR [rip+0x2478ed0]        # 0x14264bec4
0x1401d2ff4: jmp    0x1401d3006
0x1401d2ff6: cmp    ebx,edi
0x1401d2ff8: mov    edx,DWORD PTR [rip+0x2478ede]        # 0x14264bedc
0x1401d2ffe: je     0x1401d3006
0x1401d3000: mov    edx,DWORD PTR [rip+0x2478eca]        # 0x14264bed0
0x1401d3006: lea    rcx,[rip+0x24773e3]        # 0x14264a3f0
0x1401d300d: call   0x140adaad0
0x1401d3012: mov    r8d,ebx
0x1401d3015: mov    edx,r14d
0x1401d3018: lea    rcx,[rip+0x24773d1]        # 0x14264a3f0
0x1401d301f: call   0x1400bb120
0x1401d3024: cmp    DWORD PTR [r13+0x1b4],0x6
0x1401d302c: jne    0x1401d3055
0x1401d302e: cmp    ebx,esi
0x1401d3030: jne    0x1401d303a
0x1401d3032: mov    edx,DWORD PTR [rip+0x2478e6c]        # 0x14264bea4
0x1401d3038: jmp    0x1401d30a9
0x1401d303a: lea    rcx,[rip+0x24773af]        # 0x14264a3f0
0x1401d3041: cmp    ebx,edi
0x1401d3043: jne    0x1401d304d
0x1401d3045: mov    edx,DWORD PTR [rip+0x2478e71]        # 0x14264bebc
0x1401d304b: jmp    0x1401d30b0
0x1401d304d: mov    edx,DWORD PTR [rip+0x2478e5d]        # 0x14264beb0
0x1401d3053: jmp    0x1401d30b0
0x1401d3055: lea    rcx,[r13+0x83e8]
0x1401d305c: call   0x14006ee50
0x1401d3061: test   rax,rax
0x1401d3064: je     0x1401d308d
0x1401d3066: cmp    ebx,esi
0x1401d3068: jne    0x1401d3072
0x1401d306a: mov    edx,DWORD PTR [rip+0x2478e10]        # 0x14264be80
0x1401d3070: jmp    0x1401d30a9
0x1401d3072: lea    rcx,[rip+0x2477377]        # 0x14264a3f0
0x1401d3079: cmp    ebx,edi
0x1401d307b: jne    0x1401d3085
0x1401d307d: mov    edx,DWORD PTR [rip+0x2478e15]        # 0x14264be98
0x1401d3083: jmp    0x1401d30b0
0x1401d3085: mov    edx,DWORD PTR [rip+0x2478e01]        # 0x14264be8c
0x1401d308b: jmp    0x1401d30b0
0x1401d308d: cmp    ebx,esi
0x1401d308f: jne    0x1401d3099
0x1401d3091: mov    edx,DWORD PTR [rip+0x2478e31]        # 0x14264bec8
0x1401d3097: jmp    0x1401d30a9
0x1401d3099: cmp    ebx,edi
0x1401d309b: mov    edx,DWORD PTR [rip+0x2478e3f]        # 0x14264bee0
0x1401d30a1: je     0x1401d30a9
0x1401d30a3: mov    edx,DWORD PTR [rip+0x2478e2b]        # 0x14264bed4
0x1401d30a9: lea    rcx,[rip+0x2477340]        # 0x14264a3f0
0x1401d30b0: call   0x140adaad0
0x1401d30b5: mov    r8d,ebx
0x1401d30b8: mov    edx,r15d
0x1401d30bb: lea    rcx,[rip+0x247732e]        # 0x14264a3f0
0x1401d30c2: call   0x1400bb120
0x1401d30c7: cmp    DWORD PTR [r13+0x1b4],0x6
0x1401d30cf: jne    0x1401d30f8
0x1401d30d1: cmp    ebx,esi
0x1401d30d3: jne    0x1401d30dd
0x1401d30d5: mov    edx,DWORD PTR [rip+0x2478dcd]        # 0x14264bea8
0x1401d30db: jmp    0x1401d314c
0x1401d30dd: lea    rcx,[rip+0x247730c]        # 0x14264a3f0
0x1401d30e4: cmp    ebx,edi
0x1401d30e6: jne    0x1401d30f0
0x1401d30e8: mov    edx,DWORD PTR [rip+0x2478dd2]        # 0x14264bec0
0x1401d30ee: jmp    0x1401d3153
0x1401d30f0: mov    edx,DWORD PTR [rip+0x2478dbe]        # 0x14264beb4
0x1401d30f6: jmp    0x1401d3153
0x1401d30f8: lea    rcx,[r13+0x83e8]
0x1401d30ff: call   0x14006ee50
0x1401d3104: test   rax,rax
0x1401d3107: je     0x1401d3130
0x1401d3109: cmp    ebx,esi
0x1401d310b: jne    0x1401d3115
0x1401d310d: mov    edx,DWORD PTR [rip+0x2478d71]        # 0x14264be84
0x1401d3113: jmp    0x1401d314c
0x1401d3115: lea    rcx,[rip+0x24772d4]        # 0x14264a3f0
0x1401d311c: cmp    ebx,edi
0x1401d311e: jne    0x1401d3128
0x1401d3120: mov    edx,DWORD PTR [rip+0x2478d76]        # 0x14264be9c
0x1401d3126: jmp    0x1401d3153
0x1401d3128: mov    edx,DWORD PTR [rip+0x2478d62]        # 0x14264be90
0x1401d312e: jmp    0x1401d3153
0x1401d3130: cmp    ebx,esi
0x1401d3132: jne    0x1401d313c
0x1401d3134: mov    edx,DWORD PTR [rip+0x2478d92]        # 0x14264becc
0x1401d313a: jmp    0x1401d314c
0x1401d313c: cmp    ebx,edi
0x1401d313e: mov    edx,DWORD PTR [rip+0x2478da0]        # 0x14264bee4
0x1401d3144: je     0x1401d314c
0x1401d3146: mov    edx,DWORD PTR [rip+0x2478d8c]        # 0x14264bed8
0x1401d314c: lea    rcx,[rip+0x247729d]        # 0x14264a3f0
0x1401d3153: call   0x140adaad0
0x1401d3158: inc    ebx
0x1401d315a: cmp    ebx,edi
0x1401d315c: mov    eax,DWORD PTR [rbp-0x48]
0x1401d315f: jle    0x1401d2f70
0x1401d3165: xor    r8d,r8d
0x1401d3168: mov    edx,0x7
0x1401d316d: mov    r9b,0x1
0x1401d3170: lea    rcx,[rip+0x2477279]        # 0x14264a3f0
0x1401d3177: call   0x1400bb130
0x1401d317c: lea    r8d,[rsi+0x1]
0x1401d3180: mov    edx,DWORD PTR [rbp-0x48]
0x1401d3183: inc    edx
0x1401d3185: lea    rcx,[rip+0x2477264]        # 0x14264a3f0
0x1401d318c: call   0x1400bb120
0x1401d3191: lea    rdx,[rip+0x1431308]        # 0x1416044a0  'Missing citizens'
0x1401d3198: lea    rcx,[rbp+0x36f0]
0x1401d319f: call   0x140068150
0x1401d31a4: nop
0x1401d31a5: xor    r9d,r9d
0x1401d31a8: xor    r8d,r8d
0x1401d31ab: lea    rdx,[rbp+0x36f0]
0x1401d31b2: lea    rcx,[rip+0x2477237]        # 0x14264a3f0
0x1401d31b9: call   0x140ad9960
0x1401d31be: nop
0x1401d31bf: lea    rcx,[rbp+0x36f0]
0x1401d31c6: call   0x140067e30
0x1401d31cb: mov    ebx,esi
0x1401d31cd: cmp    esi,edi
0x1401d31cf: jg     0x1401d33d5
0x1401d31d5: mov    eax,DWORD PTR [rbp-0x6c]
0x1401d31d8: lea    r14d,[rax+0x1]
0x1401d31dc: lea    r15d,[rax+0x2]
0x1401d31e0: mov    r8d,ebx
0x1401d31e3: mov    edx,eax
0x1401d31e5: lea    rcx,[rip+0x2477204]        # 0x14264a3f0
0x1401d31ec: call   0x1400bb120
0x1401d31f1: cmp    DWORD PTR [r13+0x1b4],0x7
0x1401d31f9: jne    0x1401d3222
0x1401d31fb: cmp    ebx,esi
0x1401d31fd: jne    0x1401d3207
0x1401d31ff: mov    edx,DWORD PTR [rip+0x2478c9b]        # 0x14264bea0
0x1401d3205: jmp    0x1401d3276
0x1401d3207: lea    rcx,[rip+0x24771e2]        # 0x14264a3f0
0x1401d320e: cmp    ebx,edi
0x1401d3210: jne    0x1401d321a
0x1401d3212: mov    edx,DWORD PTR [rip+0x2478ca0]        # 0x14264beb8
0x1401d3218: jmp    0x1401d327d
0x1401d321a: mov    edx,DWORD PTR [rip+0x2478c8c]        # 0x14264beac
0x1401d3220: jmp    0x1401d327d
0x1401d3222: lea    rcx,[r13+0x8410]
0x1401d3229: call   0x14006ee50
0x1401d322e: test   rax,rax
0x1401d3231: je     0x1401d325a
0x1401d3233: cmp    ebx,esi
0x1401d3235: jne    0x1401d323f
0x1401d3237: mov    edx,DWORD PTR [rip+0x2478c3f]        # 0x14264be7c
0x1401d323d: jmp    0x1401d3276
0x1401d323f: lea    rcx,[rip+0x24771aa]        # 0x14264a3f0
0x1401d3246: cmp    ebx,edi
0x1401d3248: jne    0x1401d3252
0x1401d324a: mov    edx,DWORD PTR [rip+0x2478c44]        # 0x14264be94
0x1401d3250: jmp    0x1401d327d
0x1401d3252: mov    edx,DWORD PTR [rip+0x2478c30]        # 0x14264be88
0x1401d3258: jmp    0x1401d327d
0x1401d325a: cmp    ebx,esi
0x1401d325c: jne    0x1401d3266
0x1401d325e: mov    edx,DWORD PTR [rip+0x2478c60]        # 0x14264bec4
0x1401d3264: jmp    0x1401d3276
0x1401d3266: cmp    ebx,edi
0x1401d3268: mov    edx,DWORD PTR [rip+0x2478c6e]        # 0x14264bedc
0x1401d326e: je     0x1401d3276
0x1401d3270: mov    edx,DWORD PTR [rip+0x2478c5a]        # 0x14264bed0
0x1401d3276: lea    rcx,[rip+0x2477173]        # 0x14264a3f0
0x1401d327d: call   0x140adaad0
0x1401d3282: mov    r8d,ebx
0x1401d3285: mov    edx,r14d
0x1401d3288: lea    rcx,[rip+0x2477161]        # 0x14264a3f0
0x1401d328f: call   0x1400bb120
0x1401d3294: cmp    DWORD PTR [r13+0x1b4],0x7
0x1401d329c: jne    0x1401d32c5
0x1401d329e: cmp    ebx,esi
0x1401d32a0: jne    0x1401d32aa
0x1401d32a2: mov    edx,DWORD PTR [rip+0x2478bfc]        # 0x14264bea4
0x1401d32a8: jmp    0x1401d3319
0x1401d32aa: lea    rcx,[rip+0x247713f]        # 0x14264a3f0
0x1401d32b1: cmp    ebx,edi
0x1401d32b3: jne    0x1401d32bd
0x1401d32b5: mov    edx,DWORD PTR [rip+0x2478c01]        # 0x14264bebc
0x1401d32bb: jmp    0x1401d3320
0x1401d32bd: mov    edx,DWORD PTR [rip+0x2478bed]        # 0x14264beb0
0x1401d32c3: jmp    0x1401d3320
0x1401d32c5: lea    rcx,[r13+0x8410]
0x1401d32cc: call   0x14006ee50
0x1401d32d1: test   rax,rax
0x1401d32d4: je     0x1401d32fd
0x1401d32d6: cmp    ebx,esi
0x1401d32d8: jne    0x1401d32e2
0x1401d32da: mov    edx,DWORD PTR [rip+0x2478ba0]        # 0x14264be80
0x1401d32e0: jmp    0x1401d3319
0x1401d32e2: lea    rcx,[rip+0x2477107]        # 0x14264a3f0
0x1401d32e9: cmp    ebx,edi
0x1401d32eb: jne    0x1401d32f5
0x1401d32ed: mov    edx,DWORD PTR [rip+0x2478ba5]        # 0x14264be98
0x1401d32f3: jmp    0x1401d3320
0x1401d32f5: mov    edx,DWORD PTR [rip+0x2478b91]        # 0x14264be8c
0x1401d32fb: jmp    0x1401d3320
0x1401d32fd: cmp    ebx,esi
0x1401d32ff: jne    0x1401d3309
0x1401d3301: mov    edx,DWORD PTR [rip+0x2478bc1]        # 0x14264bec8
0x1401d3307: jmp    0x1401d3319
0x1401d3309: cmp    ebx,edi
0x1401d330b: mov    edx,DWORD PTR [rip+0x2478bcf]        # 0x14264bee0
0x1401d3311: je     0x1401d3319
0x1401d3313: mov    edx,DWORD PTR [rip+0x2478bbb]        # 0x14264bed4
0x1401d3319: lea    rcx,[rip+0x24770d0]        # 0x14264a3f0
0x1401d3320: call   0x140adaad0
0x1401d3325: mov    r8d,ebx
0x1401d3328: mov    edx,r15d
0x1401d332b: lea    rcx,[rip+0x24770be]        # 0x14264a3f0
0x1401d3332: call   0x1400bb120
0x1401d3337: cmp    DWORD PTR [r13+0x1b4],0x7
0x1401d333f: jne    0x1401d3368
0x1401d3341: cmp    ebx,esi
0x1401d3343: jne    0x1401d334d
0x1401d3345: mov    edx,DWORD PTR [rip+0x2478b5d]        # 0x14264bea8
0x1401d334b: jmp    0x1401d33bc
0x1401d334d: lea    rcx,[rip+0x247709c]        # 0x14264a3f0
0x1401d3354: cmp    ebx,edi
0x1401d3356: jne    0x1401d3360
0x1401d3358: mov    edx,DWORD PTR [rip+0x2478b62]        # 0x14264bec0
0x1401d335e: jmp    0x1401d33c3
0x1401d3360: mov    edx,DWORD PTR [rip+0x2478b4e]        # 0x14264beb4
0x1401d3366: jmp    0x1401d33c3
0x1401d3368: lea    rcx,[r13+0x8410]
0x1401d336f: call   0x14006ee50
0x1401d3374: test   rax,rax
0x1401d3377: je     0x1401d33a0
0x1401d3379: cmp    ebx,esi
0x1401d337b: jne    0x1401d3385
0x1401d337d: mov    edx,DWORD PTR [rip+0x2478b01]        # 0x14264be84
0x1401d3383: jmp    0x1401d33bc
0x1401d3385: lea    rcx,[rip+0x2477064]        # 0x14264a3f0
0x1401d338c: cmp    ebx,edi
0x1401d338e: jne    0x1401d3398
0x1401d3390: mov    edx,DWORD PTR [rip+0x2478b06]        # 0x14264be9c
0x1401d3396: jmp    0x1401d33c3
0x1401d3398: mov    edx,DWORD PTR [rip+0x2478af2]        # 0x14264be90
0x1401d339e: jmp    0x1401d33c3
0x1401d33a0: cmp    ebx,esi
0x1401d33a2: jne    0x1401d33ac
0x1401d33a4: mov    edx,DWORD PTR [rip+0x2478b22]        # 0x14264becc
0x1401d33aa: jmp    0x1401d33bc
0x1401d33ac: cmp    ebx,edi
0x1401d33ae: mov    edx,DWORD PTR [rip+0x2478b30]        # 0x14264bee4
0x1401d33b4: je     0x1401d33bc
0x1401d33b6: mov    edx,DWORD PTR [rip+0x2478b1c]        # 0x14264bed8
0x1401d33bc: lea    rcx,[rip+0x247702d]        # 0x14264a3f0
0x1401d33c3: call   0x140adaad0
0x1401d33c8: inc    ebx
0x1401d33ca: cmp    ebx,edi
0x1401d33cc: mov    eax,DWORD PTR [rbp-0x6c]
0x1401d33cf: jle    0x1401d31e0
0x1401d33d5: xor    r8d,r8d
0x1401d33d8: mov    edx,0x7
0x1401d33dd: mov    r9b,0x1
0x1401d33e0: lea    rcx,[rip+0x2477009]        # 0x14264a3f0
0x1401d33e7: call   0x1400bb130
0x1401d33ec: lea    r8d,[rsi+0x5]
0x1401d33f0: mov    edx,DWORD PTR [rbp-0x6c]
0x1401d33f3: inc    edx
0x1401d33f5: lea    rcx,[rip+0x2476ff4]        # 0x14264a3f0
0x1401d33fc: call   0x1400bb120
0x1401d3401: lea    rdx,[rip+0x1418e30]        # 0x1415ec238  'Artifacts'
0x1401d3408: lea    rcx,[rbp+0x3710]
0x1401d340f: call   0x140068150
0x1401d3414: nop
0x1401d3415: xor    r9d,r9d
0x1401d3418: xor    r8d,r8d
0x1401d341b: lea    rdx,[rbp+0x3710]
0x1401d3422: lea    rcx,[rip+0x2476fc7]        # 0x14264a3f0
0x1401d3429: call   0x140ad9960
0x1401d342e: nop
0x1401d342f: lea    rcx,[rbp+0x3710]
0x1401d3436: call   0x140067e30
0x1401d343b: mov    r14d,esi
0x1401d343e: cmp    esi,edi
0x1401d3440: jg     0x1401d3690
0x1401d3446: mov    eax,DWORD PTR [rbp-0x70]
0x1401d3449: lea    r15d,[rax+0x1]
0x1401d344d: lea    r12d,[rax+0x2]
0x1401d3451: mov    r8d,r14d
0x1401d3454: mov    edx,eax
0x1401d3456: lea    rcx,[rip+0x2476f93]        # 0x14264a3f0
0x1401d345d: call   0x1400bb120
0x1401d3462: cmp    DWORD PTR [r13+0x1b4],0x5
0x1401d346a: jne    0x1401d3498
0x1401d346c: cmp    r14d,esi
0x1401d346f: jne    0x1401d347c
0x1401d3471: mov    edx,DWORD PTR [rip+0x2478a29]        # 0x14264bea0
0x1401d3477: jmp    0x1401d34ff
0x1401d347c: lea    rcx,[rip+0x2476f6d]        # 0x14264a3f0
0x1401d3483: cmp    r14d,edi
0x1401d3486: jne    0x1401d3490
0x1401d3488: mov    edx,DWORD PTR [rip+0x2478a2a]        # 0x14264beb8
0x1401d348e: jmp    0x1401d3506
0x1401d3490: mov    edx,DWORD PTR [rip+0x2478a16]        # 0x14264beac
0x1401d3496: jmp    0x1401d3506
0x1401d3498: lea    rcx,[r13+0x8348]
0x1401d349f: call   0x14006f370
0x1401d34a4: mov    rbx,rax
0x1401d34a7: lea    rcx,[r13+0x8330]
0x1401d34ae: call   0x14006f370
0x1401d34b3: add    rbx,rax
0x1401d34b6: je     0x1401d34e1
0x1401d34b8: cmp    r14d,esi
0x1401d34bb: jne    0x1401d34c5
0x1401d34bd: mov    edx,DWORD PTR [rip+0x24789b9]        # 0x14264be7c
0x1401d34c3: jmp    0x1401d34ff
0x1401d34c5: lea    rcx,[rip+0x2476f24]        # 0x14264a3f0
0x1401d34cc: cmp    r14d,edi
0x1401d34cf: jne    0x1401d34d9
0x1401d34d1: mov    edx,DWORD PTR [rip+0x24789bd]        # 0x14264be94
0x1401d34d7: jmp    0x1401d3506
0x1401d34d9: mov    edx,DWORD PTR [rip+0x24789a9]        # 0x14264be88
0x1401d34df: jmp    0x1401d3506
0x1401d34e1: cmp    r14d,esi
0x1401d34e4: jne    0x1401d34ee
0x1401d34e6: mov    edx,DWORD PTR [rip+0x24789d8]        # 0x14264bec4
0x1401d34ec: jmp    0x1401d34ff
0x1401d34ee: cmp    r14d,edi
0x1401d34f1: mov    edx,DWORD PTR [rip+0x24789e5]        # 0x14264bedc
0x1401d34f7: je     0x1401d34ff
0x1401d34f9: mov    edx,DWORD PTR [rip+0x24789d1]        # 0x14264bed0
0x1401d34ff: lea    rcx,[rip+0x2476eea]        # 0x14264a3f0
0x1401d3506: call   0x140adaad0
0x1401d350b: mov    r8d,r14d
0x1401d350e: mov    edx,r15d
0x1401d3511: lea    rcx,[rip+0x2476ed8]        # 0x14264a3f0
0x1401d3518: call   0x1400bb120
0x1401d351d: cmp    DWORD PTR [r13+0x1b4],0x5
0x1401d3525: jne    0x1401d3553
0x1401d3527: cmp    r14d,esi
0x1401d352a: jne    0x1401d3537
0x1401d352c: mov    edx,DWORD PTR [rip+0x2478972]        # 0x14264bea4
0x1401d3532: jmp    0x1401d35ba
0x1401d3537: lea    rcx,[rip+0x2476eb2]        # 0x14264a3f0
0x1401d353e: cmp    r14d,edi
0x1401d3541: jne    0x1401d354b
0x1401d3543: mov    edx,DWORD PTR [rip+0x2478973]        # 0x14264bebc
0x1401d3549: jmp    0x1401d35c1
0x1401d354b: mov    edx,DWORD PTR [rip+0x247895f]        # 0x14264beb0
0x1401d3551: jmp    0x1401d35c1
0x1401d3553: lea    rcx,[r13+0x8348]
0x1401d355a: call   0x14006f370
0x1401d355f: mov    rbx,rax
0x1401d3562: lea    rcx,[r13+0x8330]
0x1401d3569: call   0x14006f370
0x1401d356e: add    rbx,rax
0x1401d3571: je     0x1401d359c
0x1401d3573: cmp    r14d,esi
0x1401d3576: jne    0x1401d3580
0x1401d3578: mov    edx,DWORD PTR [rip+0x2478902]        # 0x14264be80
0x1401d357e: jmp    0x1401d35ba
0x1401d3580: lea    rcx,[rip+0x2476e69]        # 0x14264a3f0
0x1401d3587: cmp    r14d,edi
0x1401d358a: jne    0x1401d3594
0x1401d358c: mov    edx,DWORD PTR [rip+0x2478906]        # 0x14264be98
0x1401d3592: jmp    0x1401d35c1
0x1401d3594: mov    edx,DWORD PTR [rip+0x24788f2]        # 0x14264be8c
0x1401d359a: jmp    0x1401d35c1
0x1401d359c: cmp    r14d,esi
0x1401d359f: jne    0x1401d35a9
0x1401d35a1: mov    edx,DWORD PTR [rip+0x2478921]        # 0x14264bec8
0x1401d35a7: jmp    0x1401d35ba
0x1401d35a9: cmp    r14d,edi
0x1401d35ac: mov    edx,DWORD PTR [rip+0x247892e]        # 0x14264bee0
0x1401d35b2: je     0x1401d35ba
0x1401d35b4: mov    edx,DWORD PTR [rip+0x247891a]        # 0x14264bed4
0x1401d35ba: lea    rcx,[rip+0x2476e2f]        # 0x14264a3f0
0x1401d35c1: call   0x140adaad0
0x1401d35c6: mov    r8d,r14d
0x1401d35c9: mov    edx,r12d
0x1401d35cc: lea    rcx,[rip+0x2476e1d]        # 0x14264a3f0
0x1401d35d3: call   0x1400bb120
0x1401d35d8: cmp    DWORD PTR [r13+0x1b4],0x5
0x1401d35e0: jne    0x1401d360e
0x1401d35e2: cmp    r14d,esi
0x1401d35e5: jne    0x1401d35f2
0x1401d35e7: mov    edx,DWORD PTR [rip+0x24788bb]        # 0x14264bea8
0x1401d35ed: jmp    0x1401d3675
0x1401d35f2: lea    rcx,[rip+0x2476df7]        # 0x14264a3f0
0x1401d35f9: cmp    r14d,edi
0x1401d35fc: jne    0x1401d3606
0x1401d35fe: mov    edx,DWORD PTR [rip+0x24788bc]        # 0x14264bec0
0x1401d3604: jmp    0x1401d367c
0x1401d3606: mov    edx,DWORD PTR [rip+0x24788a8]        # 0x14264beb4
0x1401d360c: jmp    0x1401d367c
0x1401d360e: lea    rcx,[r13+0x8348]
0x1401d3615: call   0x14006f370
0x1401d361a: mov    rbx,rax
0x1401d361d: lea    rcx,[r13+0x8330]
0x1401d3624: call   0x14006f370
0x1401d3629: add    rbx,rax
0x1401d362c: je     0x1401d3657
0x1401d362e: cmp    r14d,esi
0x1401d3631: jne    0x1401d363b
0x1401d3633: mov    edx,DWORD PTR [rip+0x247884b]        # 0x14264be84
0x1401d3639: jmp    0x1401d3675
0x1401d363b: lea    rcx,[rip+0x2476dae]        # 0x14264a3f0
0x1401d3642: cmp    r14d,edi
0x1401d3645: jne    0x1401d364f
0x1401d3647: mov    edx,DWORD PTR [rip+0x247884f]        # 0x14264be9c
0x1401d364d: jmp    0x1401d367c
0x1401d364f: mov    edx,DWORD PTR [rip+0x247883b]        # 0x14264be90
0x1401d3655: jmp    0x1401d367c
0x1401d3657: cmp    r14d,esi
0x1401d365a: jne    0x1401d3664
0x1401d365c: mov    edx,DWORD PTR [rip+0x247886a]        # 0x14264becc
0x1401d3662: jmp    0x1401d3675
0x1401d3664: cmp    r14d,edi
0x1401d3667: mov    edx,DWORD PTR [rip+0x2478877]        # 0x14264bee4
0x1401d366d: je     0x1401d3675
0x1401d366f: mov    edx,DWORD PTR [rip+0x2478863]        # 0x14264bed8
0x1401d3675: lea    rcx,[rip+0x2476d74]        # 0x14264a3f0
0x1401d367c: call   0x140adaad0
0x1401d3681: inc    r14d
0x1401d3684: cmp    r14d,edi
0x1401d3687: mov    eax,DWORD PTR [rbp-0x70]
0x1401d368a: jle    0x1401d3451
0x1401d3690: xor    r8d,r8d
0x1401d3693: mov    edx,0x7
0x1401d3698: mov    r9b,0x1
0x1401d369b: lea    rcx,[rip+0x2476d4e]        # 0x14264a3f0
0x1401d36a2: call   0x1400bb130
0x1401d36a7: lea    r8d,[rsi+0x6]
0x1401d36ab: mov    edx,DWORD PTR [rbp-0x70]
0x1401d36ae: inc    edx
0x1401d36b0: lea    rcx,[rip+0x2476d39]        # 0x14264a3f0
0x1401d36b7: call   0x1400bb120
0x1401d36bc: lea    rdx,[rip+0x1430df5]        # 0x1416044b8  'Reports'
0x1401d36c3: lea    rcx,[rbp+0x3730]
0x1401d36ca: call   0x140068150
0x1401d36cf: nop
0x1401d36d0: xor    r9d,r9d
0x1401d36d3: xor    r8d,r8d
0x1401d36d6: lea    rdx,[rbp+0x3730]
0x1401d36dd: lea    rcx,[rip+0x2476d0c]        # 0x14264a3f0
0x1401d36e4: call   0x140ad9960
0x1401d36e9: nop
0x1401d36ea: lea    rcx,[rbp+0x3730]
0x1401d36f1: call   0x140067e30
0x1401d36f6: lea    eax,[rdi-0x7]
0x1401d36f9: mov    r15d,eax
0x1401d36fc: cmp    eax,edi
0x1401d36fe: jg     0x1401d376b
0x1401d3700: movsxd r12,eax
0x1401d3703: movsxd r13,edi
0x1401d3706: mov    r14,r12
0x1401d3709: nop    DWORD PTR [rax+0x0]
0x1401d3710: mov    esi,DWORD PTR [rbp-0x10]
0x1401d3713: lea    rbx,[rip+0x247877a]        # 0x14264be94
0x1401d371a: lea    rdi,[rip+0x247877f]        # 0x14264bea0
0x1401d3721: mov    r8d,r15d
0x1401d3724: mov    edx,esi
0x1401d3726: lea    rcx,[rip+0x2476cc3]        # 0x14264a3f0
0x1401d372d: call   0x1400bb120
0x1401d3732: cmp    r14,r12
0x1401d3735: jne    0x1401d373c
0x1401d3737: mov    edx,DWORD PTR [rbx-0x18]
0x1401d373a: jmp    0x1401d3748
0x1401d373c: cmp    r14,r13
0x1401d373f: jne    0x1401d3745
0x1401d3741: mov    edx,DWORD PTR [rbx]
0x1401d3743: jmp    0x1401d3748
0x1401d3745: mov    edx,DWORD PTR [rbx-0xc]
0x1401d3748: lea    rcx,[rip+0x2476ca1]        # 0x14264a3f0
0x1401d374f: call   0x140adaad0
0x1401d3754: inc    esi
0x1401d3756: add    rbx,0x4
0x1401d375a: cmp    rbx,rdi
0x1401d375d: jl     0x1401d3721
0x1401d375f: inc    r15d
0x1401d3762: inc    r14
0x1401d3765: cmp    r15d,DWORD PTR [rbp-0x68]
0x1401d3769: jle    0x1401d3710
0x1401d376b: xor    r8d,r8d
0x1401d376e: mov    edx,0x7
0x1401d3773: mov    r9b,0x1
0x1401d3776: lea    rcx,[rip+0x2476c73]        # 0x14264a3f0
0x1401d377d: call   0x1400bb130
0x1401d3782: mov    r8d,DWORD PTR [rbp-0x28]
0x1401d3786: add    r8d,0x2
0x1401d378a: mov    edx,DWORD PTR [rbp-0x10]
0x1401d378d: inc    edx
0x1401d378f: lea    rcx,[rip+0x2476c5a]        # 0x14264a3f0
0x1401d3796: call   0x1400bb120
0x1401d379b: lea    rdx,[rip+0x1430d1e]        # 0x1416044c0  'Done'
0x1401d37a2: lea    rcx,[rbp+0x3750]
0x1401d37a9: call   0x140068150
0x1401d37ae: nop
0x1401d37af: xor    r9d,r9d
0x1401d37b2: xor    r8d,r8d
0x1401d37b5: lea    rdx,[rbp+0x3750]
0x1401d37bc: lea    rcx,[rip+0x2476c2d]        # 0x14264a3f0
0x1401d37c3: call   0x140ad9960
0x1401d37c8: nop
0x1401d37c9: lea    rcx,[rbp+0x3750]
0x1401d37d0: call   0x140067e30
0x1401d37d5: cmp    BYTE PTR [rip+0x16d3ddc],0x0        # 0x1418a75b8
0x1401d37dc: je     0x1401d37ea
0x1401d37de: lea    rcx,[rip+0x16d3dd3]        # 0x1418a75b8
0x1401d37e5: call   0x1401e8b20
0x1401d37ea: mov    rcx,QWORD PTR [rbp+0x38b0]
0x1401d37f1: xor    rcx,rsp
0x1401d37f4: call   0x141539660
0x1401d37f9: lea    r11,[rsp+0x39c0]
0x1401d3801: mov    rbx,QWORD PTR [r11+0x38]
0x1401d3805: mov    rsi,QWORD PTR [r11+0x40]
0x1401d3809: mov    rdi,QWORD PTR [r11+0x48]
0x1401d380d: mov    rsp,r11
0x1401d3810: pop    r15
0x1401d3812: pop    r14
0x1401d3814: pop    r13
0x1401d3816: pop    r12
0x1401d3818: pop    rbp
0x1401d3819: ret
0x1401d381a: xchg   ax,ax
0x1401d381c: sbb    bx,WORD PTR [rax+rax*1]
0x1401d3820: sar    BYTE PTR [rcx],cl
0x1401d3822: sbb    al,0x0
0x1401d3824: (bad)
0x1401d3825: (bad)
0x1401d3826: sbb    al,0x0
0x1401d3828: adc    ecx,DWORD PTR [rsp+rbx*1+0x1ce18100]
0x1401d382f: add    cl,ah
0x1401d3831: sti
0x1401d3832: sbb    al,0x0
0x1401d3834: rex.RXB nop DWORD PTR [r8]
0x1401d3838: sbb    ebx,DWORD PTR [rdx]
0x1401d383a: sbb    eax,0x1c757900
0x1401d383f: add    BYTE PTR [rdi+0xc001c2f],al
0x1401d3845: xor    BYTE PTR [rax+rax*1],bl
0x1401d3848: add    dh,BYTE PTR [rcx]
0x1401d384a: sbb    al,0x0
0x1401d384c: rex.WXB xor BYTE PTR [r8+r8*1],bl
0x1401d3850: mov    dh,BYTE PTR [rax]
0x1401d3852: sbb    al,0x0
0x1401d3854: (bad)
0x1401d3855: xor    BYTE PTR [rax+rax*1],bl
0x1401d3858: out    0x65,al
0x1401d385a: sbb    al,0x0
0x1401d385c: out    dx,eax
0x1401d385d: gs sbb al,0x0
0x1401d3860: clc
0x1401d3861: gs sbb al,0x0
0x1401d3864: frstor [rbp+0x1c]
0x1401d3867: add    BYTE PTR [rcx],al
0x1401d3869: data16 sbb al,0x0
0x1401d386c: retf
0x1401d386d: gs sbb al,0x0
0x1401d3870: (bad)
0x1401d3871: gs sbb al,0x0
0x1401d3874: rol    DWORD PTR [rdx-0x7cc4ffe4],0x1c
0x1401d387b: add    BYTE PTR [rip+0x75001c84],bl        # 0x1b51d5505
0x1401d3881: sbb    DWORD PTR [rax+rax*1],0xffffffaf
0x1401d3885: sbb    DWORD PTR [rax+rax*1],0xffffffe6
0x1401d3889: sbb    DWORD PTR [rax+rax*1],0xf
0x1401d388d: mov    BYTE PTR [rax+rax*1],bl
0x1401d3890: rex.WB mov BYTE PTR [r8+rax*1],bl
0x1401d3894: or     DWORD PTR [rax-0x7742ffe4],0x1c
0x1401d389b: add    bh,dh
0x1401d389d: mov    BYTE PTR [rax+rax*1],bl
0x1401d38a0: imul   ecx,DWORD PTR [rcx-0x765affe4],0x1c
0x1401d38a7: add    BYTE PTR [rdx-0x75],dh
0x1401d38aa: sbb    al,0x0
0x1401d38ac: jrcxz  0x1401d3839
0x1401d38ae: sbb    al,0x0
0x1401d38b0: push   rbx
0x1401d38b1: mov    bl,BYTE PTR [rax+rax*1]
0x1401d38b4: lea    ecx,[rdx-0x7538ffe4]
0x1401d38ba: sbb    al,0x0
0x1401d38bc: add    DWORD PTR [rbx-0x74c4ffe4],ecx
0x1401d38c2: sbb    al,0x0
0x1401d38c4: test   eax,0xdf001c8b
0x1401d38c9: mov    DWORD PTR [rax+rax*1],ebx
0x1401d38cc: sbb    DWORD PTR [rdx-0x76ceffe4],ecx
0x1401d38d2: sbb    al,0x0
0x1401d38d4: (bad)
0x1401d38d5: mov    ds,WORD PTR [rax+rax*1]
0x1401d38d8: iret
0x1401d38d9: mov    ds,WORD PTR [rax+rax*1]
0x1401d38dc: fmul   DWORD PTR [rsi-0x7142ffe4]
0x1401d38e2: sbb    al,0x0
0x1401d38e4: loope  0x1401d3874
0x1401d38e6: sbb    al,0x0
0x1401d38e8: stos   DWORD PTR [rdi],eax
0x1401d38e9: mov    ds,WORD PTR [rax+rax*1]
0x1401d38ec: mov    ah,0x8e
0x1401d38ee: sbb    al,0x0
0x1401d38f0: ficomp DWORD PTR [rax-0x65cfffe4]
0x1401d38f6: sbb    al,0x0
0x1401d38f8: xor    BYTE PTR [rdx-0x65cfffe4],bl
0x1401d38fe: sbb    al,0x0
0x1401d3900: xor    BYTE PTR [rdx-0x65cfffe4],bl
0x1401d3906: sbb    al,0x0
0x1401d3908: xor    BYTE PTR [rdx-0x65cfffe4],bl
0x1401d390e: sbb    al,0x0
0x1401d3910: xor    BYTE PTR [rdx-0x66ebffe4],bl
0x1401d3916: sbb    al,0x0
0x1401d3918: xor    BYTE PTR [rdx-0x65cfffe4],bl
0x1401d391e: sbb    al,0x0
0x1401d3920: rex.WRX cqo
0x1401d3922: sbb    al,0x0
0x1401d3924: mov    BYTE PTR [rcx-0x6640ffe4],bl
0x1401d392a: sbb    al,0x0
0x1401d392c: neg    BYTE PTR [rcx-0x6580ffe4]
0x1401d3932: sbb    al,0x0
0x1401d3934: mov    ecx,0xf3001c9a
0x1401d3939: (bad)
0x1401d393a: sbb    al,0x0
0x1401d393c: sub    eax,0x67001c9b
0x1401d3941: fwait
0x1401d3942: sbb    al,0x0
0x1401d3944: fistp  DWORD PTR [rbx-0x63eaffe4]
0x1401d394a: sbb    al,0x0
0x1401d394c: loop   0x1401d38eb
0x1401d394e: sbb    al,0x0
0x1401d3950: push   rbx
0x1401d3951: sahf
0x1401d3952: sbb    al,0x0
0x1401d3954: ret
0x1401d3955: pushf
0x1401d3956: sbb    al,0x0
0x1401d3958: std
0x1401d3959: pushf
0x1401d395a: sbb    al,0x0
0x1401d395c: (bad)
0x1401d395d: popf
0x1401d395e: sbb    al,0x0
0x1401d3960: jno    0x1401d38ff
0x1401d3962: sbb    al,0x0
0x1401d3964: stos   DWORD PTR [rdi],eax
0x1401d3965: popf
0x1401d3966: sbb    al,0x0
0x1401d3968: sbb    DWORD PTR [rsi-0x63b0ffe4],ebx
0x1401d396e: sbb    al,0x0
0x1401d3970: mov    DWORD PTR [rsp+rbx*1+0x1c9ba100],ebx
0x1401d3977: add    BYTE PTR [rsi-0x31],ch
0x1401d397a: sbb    al,0x0
0x1401d397c: ja     0x1401d394d
0x1401d397e: sbb    al,0x0
0x1401d3980: or     bh,0x1c
0x1401d3983: add    BYTE PTR [rbp-0x31],ah
0x1401d3986: sbb    al,0x0
0x1401d3988: mov    edi,ecx
0x1401d398a: sbb    al,0x0
0x1401d398c: push   rbx
0x1401d398d: iret
0x1401d398e: sbb    al,0x0
0x1401d3990: pop    rsp
0x1401d3991: iret
0x1401d3992: sbb    al,0x0
0x1401d3994: xor    bl,bl
0x1401d3996: sbb    al,0x0
0x1401d3998: cmp    ebx,ebx
0x1401d399a: sbb    al,0x0
0x1401d399c: fistp  DWORD PTR [rax+r8*1]
0x1401d39a0: (bad)
0x1401d39a1: fistp  DWORD PTR [rax+rax*1]
0x1401d39a4: rex.WXB fistp DWORD PTR [r8+r8*1]
0x1401d39a8: adc    eax,0x1e001cdb
0x1401d39ad: fistp  DWORD PTR [rax+rax*1]
0x1401d39b0: add    eax,edi
0x1401d39b2: sbb    al,0x0
0x1401d39b4: test   eax,edi
0x1401d39b6: sbb    al,0x0
0x1401d39b8: jnp    0x1401d39b3
0x1401d39ba: sbb    al,0x0
0x1401d39bc: (bad)
0x1401d39bd: clc
0x1401d39be: sbb    al,0x0
0x1401d39c0: add    edi,ecx
0x1401d39c2: sbb    al,0x0
0x1401d39c4: (bad)
0x1401d39c5: stc
0x1401d39c6: sbb    al,0x0
0x1401d39c8: mov    ?,esi
0x1401d39ca: sbb    al,0x0
0x1401d39cc: xchg   edi,eax
0x1401d39cd: (bad)
0x1401d39ce: sbb    al,0x0
0x1401d39d0: movabs al,ds:0x1cfea9001cfe
0x1401d39d9: add    DWORD PTR [rdx],eax
0x1401d39db: add    eax,DWORD PTR [rbx]
0x1401d39dd: add    eax,DWORD PTR [rbx]
0x1401d39df: add    eax,DWORD PTR [rbx]
0x1401d39e1: add    eax,DWORD PTR [rbx]
0x1401d39e3: add    eax,DWORD PTR [rbx]
0x1401d39e5: add    eax,DWORD PTR [rbx]
0x1401d39e7: add    eax,DWORD PTR [rbx]
0x1401d39e9: add    eax,DWORD PTR [rbx]
0x1401d39eb: add    eax,DWORD PTR [rax]
0x1401d39ed: add    DWORD PTR [rdx],eax
0x1401d39ef: add    eax,DWORD PTR [rbx]
0x1401d39f1: add    eax,DWORD PTR [rbx]
0x1401d39f3: add    eax,DWORD PTR [rbx]
0x1401d39f5: add    eax,DWORD PTR [rax]
0x1401d39f7: add    DWORD PTR [rdx],eax
0x1401d39f9: nop    DWORD PTR [rax]
0x1401d39fc: pop    rcx
0x1401d39fd: add    ebx,DWORD PTR [rip+0x1d036e00]        # 0x15d20a803
0x1401d3a03: add    BYTE PTR [rbp+0x3],dh
0x1401d3a06: sbb    eax,0x1d037c00
0x1401d3a0b: add    BYTE PTR [rbx-0x75ffe2fd],al
0x1401d3a11: add    ebx,DWORD PTR [rip+0x1d035d00]        # 0x15d209717
0x1401d3a17: add    BYTE PTR [rbp+0x67001d03],dl
0x1401d3a1d: add    ebx,DWORD PTR [rip+0x1d036e00]        # 0x15d20a823
0x1401d3a23: add    BYTE PTR [rbp+0x3],dh
0x1401d3a26: sbb    eax,0x1d037c00
0x1401d3a2b: add    BYTE PTR [rbx-0x75ffe2fd],al
0x1401d3a31: add    ebx,DWORD PTR [rip+0x1d038e00]        # 0x15d20c837
0x1401d3a37: add    BYTE PTR [rbp+0x52001d03],dl
0x1401d3a3d: add    al,0x1d
0x1401d3a3f: add    BYTE PTR [rcx+0x4],bl
0x1401d3a42: sbb    eax,0x1d046300
0x1401d3a47: add    BYTE PTR [rbp+0x4],ch
0x1401d3a4a: sbb    eax,0x1d047700
0x1401d3a4f: add    BYTE PTR [rcx-0x3bffe2fc],al
0x1401d3a55: add    al,0x1d
0x1401d3a57: add    BYTE PTR [rax-0x72ffe2fc],cl
0x1401d3a5d: add    al,0x1d
0x1401d3a5f: add    BYTE PTR [rsp+rax*1+0x49f001d],dl
0x1401d3a66: sbb    eax,0x1d04a900
0x1401d3a6b: add    BYTE PTR [rbx-0x42ffe2fc],dh
0x1401d3a71: add    al,0x1d
0x1401d3a73: add    ah,al
0x1401d3a75: add    al,0x1d
0x1401d3a77: add    dh,cl
0x1401d3a79: add    al,0x1d
0x1401d3a7b: add    BYTE PTR [rdx+0x5],dh
0x1401d3a7e: sbb    eax,0x1d057900
0x1401d3a83: add    BYTE PTR [rbx-0x72ffe2fb],al
0x1401d3a89: add    eax,0x597001d
0x1401d3a8e: sbb    eax,0x1d059f00
0x1401d3a93: add    dh,ah
0x1401d3a95: add    eax,0x5a9001d
0x1401d3a9a: sbb    eax,0x1d05ae00
0x1401d3a9f: add    BYTE PTR [rbp-0x3fffe2fb],dh
0x1401d3aa5: add    eax,0x5ca001d
0x1401d3aaa: sbb    eax,0x1d05d400
0x1401d3aaf: add    ah,bl
0x1401d3ab1: add    eax,0x5e6001d
0x1401d3ab6: sbb    eax,0x1d05f000
