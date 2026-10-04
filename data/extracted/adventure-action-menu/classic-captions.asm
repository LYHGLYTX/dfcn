# classic PE:6a70b91c:0270a000; adventure_optionst+8; RVA 0x721e0..0x721e3
0x000721e0: ret    0x0

# classic PE:6a70b91c:0270a000; unit-contaminant-field; RVA 0x6559b0..0x655dec
0x006559b0: mov    QWORD PTR [rsp+0x18],rbx
0x006559b5: push   rbp
0x006559b6: push   rsi
0x006559b7: push   rdi
0x006559b8: push   r12
0x006559ba: push   r13
0x006559bc: push   r14
0x006559be: push   r15
0x006559c0: mov    rbp,rsp
0x006559c3: sub    rsp,0x70
0x006559c7: mov    rax,QWORD PTR [rip+0x1240672]        # 0x141896040
0x006559ce: xor    rax,rsp
0x006559d1: mov    QWORD PTR [rbp-0x8],rax
0x006559d5: mov    rbx,rdx
0x006559d8: mov    r14,rcx
0x006559db: xor    r15d,r15d
0x006559de: mov    QWORD PTR [rdx+0x10],r15
0x006559e2: mov    rax,rdx
0x006559e5: cmp    QWORD PTR [rdx+0x18],0xf
0x006559ea: jbe    0x1406559ef
0x006559ec: mov    rax,QWORD PTR [rdx]
0x006559ef: mov    BYTE PTR [rax],r15b
0x006559f2: mov    edi,0xdb
0x006559f7: movzx  eax,WORD PTR [rcx]
0x006559fa: sub    ax,di
0x006559fd: mov    ecx,0xc7
0x00655a02: lea    r13,[rip+0x100831f]        # 0x14165dd28 ; literal="specks"
0x00655a09: cmp    ax,cx
0x00655a0c: ja     0x140655a99
0x00655a12: mov    eax,DWORD PTR [r14+0x10]
0x00655a16: cmp    WORD PTR [r14+0x8],0x3
0x00655a1c: jne    0x140655a42
0x00655a1e: cmp    eax,0x19
0x00655a21: jge    0x140655a2e
0x00655a23: mov    rdx,r13
0x00655a26: mov    r8d,0x6
0x00655a2c: jmp    0x140655a77
0x00655a2e: mov    r8d,0x7
0x00655a34: cmp    eax,0x32
0x00655a37: lea    rdx,[rip+0x10082e2]        # 0x14165dd20 ; literal="dusting"
0x00655a3e: jl     0x140655a77
0x00655a40: jmp    0x140655a70
0x00655a42: cmp    eax,0x19
0x00655a45: jge    0x140655a56
0x00655a47: lea    rdx,[rip+0x100828a]        # 0x14165dcd8 ; literal="spatter"
0x00655a4e: mov    r8d,0x7
0x00655a54: jmp    0x140655a77
0x00655a56: cmp    eax,0x32
0x00655a59: jge    0x140655a6a
0x00655a5b: lea    rdx,[rip+0x1008292]        # 0x14165dcf4 ; literal="smear"
0x00655a62: mov    r8d,0x5
0x00655a68: jmp    0x140655a77
0x00655a6a: mov    r8d,0x7
0x00655a70: lea    rdx,[rip+0x1008269]        # 0x14165dce0 ; literal="coating"
0x00655a77: mov    rcx,rbx
0x00655a7a: call   0x14006f9a0
0x00655a7f: mov    r8d,0x4
0x00655a85: lea    rdx,[rip+0xf90a44]        # 0x1415e64d0 ; literal=" of "
0x00655a8c: mov    rcx,rbx
0x00655a8f: call   0x14006f9a0
0x00655a94: mov    ecx,0xc7
0x00655a99: xorps  xmm0,xmm0
0x00655a9c: movups XMMWORD PTR [rbp-0x48],xmm0
0x00655aa0: mov    r12d,0xf
0x00655aa6: mov    QWORD PTR [rbp-0x30],r12
0x00655aaa: movzx  eax,WORD PTR [r14+0x8]
0x00655aaf: mov    WORD PTR [rbp-0x4e],ax
0x00655ab3: mov    esi,DWORD PTR [r14+0x4]
0x00655ab7: movzx  eax,WORD PTR [r14]
0x00655abb: mov    WORD PTR [rbp-0x50],ax
0x00655abf: mov    QWORD PTR [rbp-0x38],r15
0x00655ac3: mov    BYTE PTR [rbp-0x48],0x0
0x00655ac7: sub    ax,di
0x00655aca: cmp    ax,cx
0x00655acd: ja     0x140655c37
0x00655ad3: mov    r9,QWORD PTR [rip+0x1e9e136]        # 0x1424f3c10
0x00655ada: mov    r10,QWORD PTR [rip+0x1e9e127]        # 0x1424f3c08
0x00655ae1: sub    r9,r10
0x00655ae4: sar    r9,0x3
0x00655ae8: test   r9,r9
0x00655aeb: je     0x140655c37
0x00655af1: cmp    esi,0xffffffff
0x00655af4: je     0x140655c37
0x00655afa: mov    edx,r15d
0x00655afd: sub    r9d,0x1
0x00655b01: js     0x140655c37
0x00655b07: nop    WORD PTR [rax+rax*1+0x0]
0x00655b10: lea    ecx,[r9+rdx*1]
0x00655b14: sar    ecx,1
0x00655b16: movsxd rax,ecx
0x00655b19: mov    rdi,QWORD PTR [r10+rax*8]
0x00655b1d: cmp    DWORD PTR [rdi+0xe0],esi
0x00655b23: je     0x140655b3f
0x00655b25: lea    eax,[rcx-0x1]
0x00655b28: cmovle eax,r9d
0x00655b2c: mov    r9d,eax
0x00655b2f: lea    eax,[rcx+0x1]
0x00655b32: cmovle edx,eax
0x00655b35: cmp    edx,r9d
0x00655b38: jle    0x140655b10
0x00655b3a: jmp    0x140655c37
0x00655b3f: test   rdi,rdi
0x00655b42: je     0x140655c37
0x00655b48: cmp    BYTE PTR [rdi+0xaa],0x0
0x00655b4f: je     0x140655c37
0x00655b55: xorps  xmm0,xmm0
0x00655b58: movups XMMWORD PTR [rbp-0x28],xmm0
0x00655b5c: mov    QWORD PTR [rbp-0x18],r15
0x00655b60: mov    QWORD PTR [rbp-0x10],r12
0x00655b64: mov    BYTE PTR [rbp-0x28],0x0
0x00655b68: mov    rax,QWORD PTR [rdi+0x130]
0x00655b6f: test   rax,rax
0x00655b72: je     0x140655ba0
0x00655b74: mov    rax,QWORD PTR [rax+0x58]
0x00655b78: test   rax,rax
0x00655b7b: je     0x140655ba0
0x00655b7d: mov    edx,DWORD PTR [rax+0x30]
0x00655b80: cmp    edx,0xffffffff
0x00655b83: je     0x140655ba0
0x00655b85: lea    rcx,[rip+0x1e8c04c]        # 0x1424e1bd8
0x00655b8c: call   0x140072500
0x00655b91: test   rax,rax
0x00655b94: je     0x140655ba0
0x00655b96: mov    rcx,rax
0x00655b99: call   0x140c37530
0x00655b9e: jmp    0x140655ba4
0x00655ba0: lea    rax,[rdi+0x38]
0x00655ba4: test   rax,rax
0x00655ba7: je     0x140655bc9
0x00655ba9: cmp    BYTE PTR [rax+0x72],0x0
0x00655bad: je     0x140655bc9
0x00655baf: xor    r9d,r9d
0x00655bb2: mov    r8b,0x1
0x00655bb5: lea    rdx,[rbp-0x28]
0x00655bb9: mov    rcx,rax
0x00655bbc: call   0x140a91760
0x00655bc1: mov    r12,QWORD PTR [rbp-0x10]
0x00655bc5: mov    r15,QWORD PTR [rbp-0x18]
0x00655bc9: lea    rdx,[rbp-0x28]
0x00655bcd: cmp    r12,0xf
0x00655bd1: cmova  rdx,QWORD PTR [rbp-0x28]
0x00655bd6: mov    r8,r15
0x00655bd9: lea    rcx,[rbp-0x48]
0x00655bdd: call   0x14006f9a0
0x00655be2: mov    r8d,0x3
0x00655be8: lea    rdx,[rip+0xf92f69]        # 0x1415e8b58 ; literal="'s "
0x00655bef: lea    rcx,[rbp-0x48]
0x00655bf3: call   0x14006f9a0
0x00655bf8: nop
0x00655bf9: mov    rdx,QWORD PTR [rbp-0x10]
0x00655bfd: cmp    rdx,0xf
0x00655c01: jbe    0x140655c37
0x00655c03: inc    rdx
0x00655c06: mov    rcx,QWORD PTR [rbp-0x28]
0x00655c0a: mov    rax,rcx
0x00655c0d: cmp    rdx,0x1000
0x00655c14: jb     0x140655c32
0x00655c16: add    rdx,0x27
0x00655c1a: mov    rcx,QWORD PTR [rcx-0x8]
0x00655c1e: sub    rax,rcx
0x00655c21: add    rax,0xfffffffffffffff8
0x00655c25: cmp    rax,0x1f
0x00655c29: jbe    0x140655c32
0x00655c2b: call   QWORD PTR [rip+0xf8ae6f]        # 0x1415e0aa0
0x00655c31: int3
0x00655c32: call   0x1415345f0
0x00655c37: mov    r8d,esi
0x00655c3a: movzx  edx,WORD PTR [rbp-0x50]
0x00655c3e: lea    rcx,[rip+0x1d7579b]        # 0x1423cb3e0
0x00655c45: call   0x1414a8ce0
0x00655c4a: mov    rdi,rax
0x00655c4d: test   rax,rax
0x00655c50: je     0x140655cb3
0x00655c52: cmp    QWORD PTR [rax+0x530],0x0
0x00655c5a: je     0x140655c90
0x00655c5c: lea    rdx,[rax+0x520]
0x00655c63: mov    r8,QWORD PTR [rdx+0x10]
0x00655c67: cmp    QWORD PTR [rdx+0x18],0xf
0x00655c6c: jbe    0x140655c71
0x00655c6e: mov    rdx,QWORD PTR [rdx]
0x00655c71: lea    rcx,[rbp-0x48]
0x00655c75: call   0x14006f9a0
0x00655c7a: mov    r8d,0x1
0x00655c80: lea    rdx,[rip+0xf8da99]        # 0x1415e3720 ; literal=" "
0x00655c87: lea    rcx,[rbp-0x48]
0x00655c8b: call   0x14006f9a0
0x00655c90: movsx  rdx,WORD PTR [rbp-0x4e]
0x00655c95: shl    rdx,0x5
0x00655c99: add    rdx,0xb8
0x00655ca0: add    rdx,rdi
0x00655ca3: mov    r8,QWORD PTR [rdx+0x10]
0x00655ca7: cmp    QWORD PTR [rdx+0x18],0xf
0x00655cac: jbe    0x140655cc0
0x00655cae: mov    rdx,QWORD PTR [rdx]
0x00655cb1: jmp    0x140655cc0
0x00655cb3: lea    rdx,[rip+0x112cdf6]        # 0x141782ab0 ; literal="unknown material"
0x00655cba: mov    r8d,0x10
0x00655cc0: lea    rcx,[rbp-0x48]
0x00655cc4: call   0x14006f9a0
0x00655cc9: lea    rdx,[rbp-0x48]
0x00655ccd: cmp    QWORD PTR [rbp-0x30],0xf
0x00655cd2: cmova  rdx,QWORD PTR [rbp-0x48]
0x00655cd7: mov    r8,QWORD PTR [rbp-0x38]
0x00655cdb: mov    rcx,rbx
0x00655cde: call   0x14006f9a0
0x00655ce3: movzx  eax,WORD PTR [r14]
0x00655ce7: mov    ecx,0xdb
0x00655cec: sub    ax,cx
0x00655cef: mov    ecx,0xc7
0x00655cf4: cmp    ax,cx
0x00655cf7: jbe    0x140655d8a
0x00655cfd: mov    r8d,0x1
0x00655d03: lea    rdx,[rip+0xf8da16]        # 0x1415e3720 ; literal=" "
0x00655d0a: mov    rcx,rbx
0x00655d0d: call   0x14006f9a0
0x00655d12: mov    eax,DWORD PTR [r14+0x10]
0x00655d16: cmp    WORD PTR [r14+0x8],0x3
0x00655d1c: jne    0x140655d4c
0x00655d1e: cmp    eax,0x19
0x00655d21: jge    0x140655d2e
0x00655d23: mov    r8d,0x6
0x00655d29: mov    rdx,r13
0x00655d2c: jmp    0x140655d81
0x00655d2e: mov    r8d,0x7
0x00655d34: cmp    eax,0x32
0x00655d37: lea    r13,[rip+0x1007fe2]        # 0x14165dd20 ; literal="dusting"
0x00655d3e: jl     0x140655d47
0x00655d40: lea    r13,[rip+0x1007f99]        # 0x14165dce0 ; literal="coating"
0x00655d47: mov    rdx,r13
0x00655d4a: jmp    0x140655d81
0x00655d4c: cmp    eax,0x19
0x00655d4f: jge    0x140655d60
0x00655d51: mov    r8d,0x7
0x00655d57: lea    rdx,[rip+0x1007f7a]        # 0x14165dcd8 ; literal="spatter"
0x00655d5e: jmp    0x140655d81
0x00655d60: cmp    eax,0x32
0x00655d63: jge    0x140655d74
0x00655d65: mov    r8d,0x5
0x00655d6b: lea    rdx,[rip+0x1007f82]        # 0x14165dcf4 ; literal="smear"
0x00655d72: jmp    0x140655d81
0x00655d74: mov    r8d,0x8
0x00655d7a: lea    rdx,[rip+0x1007f67]        # 0x14165dce8 ; literal="covering"
0x00655d81: mov    rcx,rbx
0x00655d84: call   0x14006f9a0
0x00655d89: nop
0x00655d8a: mov    rdx,QWORD PTR [rbp-0x30]
0x00655d8e: cmp    rdx,0xf
0x00655d92: jbe    0x140655dc8
0x00655d94: inc    rdx
0x00655d97: mov    rcx,QWORD PTR [rbp-0x48]
0x00655d9b: mov    rax,rcx
0x00655d9e: cmp    rdx,0x1000
0x00655da5: jb     0x140655dc3
0x00655da7: add    rdx,0x27
0x00655dab: mov    rcx,QWORD PTR [rcx-0x8]
0x00655daf: sub    rax,rcx
0x00655db2: add    rax,0xfffffffffffffff8
0x00655db6: cmp    rax,0x1f
0x00655dba: jbe    0x140655dc3
0x00655dbc: call   QWORD PTR [rip+0xf8acde]        # 0x1415e0aa0
0x00655dc2: int3
0x00655dc3: call   0x1415345f0
0x00655dc8: mov    rcx,QWORD PTR [rbp-0x8]
0x00655dcc: xor    rcx,rsp
0x00655dcf: call   0x1415345d0
0x00655dd4: mov    rbx,QWORD PTR [rsp+0xc0]
0x00655ddc: add    rsp,0x70
0x00655de0: pop    r15
0x00655de2: pop    r14
0x00655de4: pop    r13
0x00655de6: pop    r12
0x00655de8: pop    rdi
0x00655de9: pop    rsi
0x00655dea: pop    rbp
0x00655deb: ret

# classic PE:6a70b91c:0270a000; adventure_option_talk_existing_conversationst+8; RVA 0x6b4aa0..0x6b4d34
0x006b4aa0: mov    QWORD PTR [rsp+0x8],rbx
0x006b4aa5: mov    QWORD PTR [rsp+0x18],rbp
0x006b4aaa: push   rsi
0x006b4aab: push   rdi
0x006b4aac: push   r14
0x006b4aae: sub    rsp,0x50
0x006b4ab2: mov    rax,QWORD PTR [rip+0x11e1587]        # 0x141896040
0x006b4ab9: xor    rax,rsp
0x006b4abc: mov    QWORD PTR [rsp+0x40],rax
0x006b4ac1: mov    rbp,rdx
0x006b4ac4: mov    rbx,QWORD PTR [rcx+0x18]
0x006b4ac8: mov    rcx,rdx
0x006b4acb: test   BYTE PTR [rbx+0x16c],0x2
0x006b4ad2: je     0x1406b4aeb
0x006b4ad4: mov    r8d,0x11
0x006b4ada: lea    rdx,[rip+0xfc1457]        # 0x141675f38 ; literal="Continue shouting"
0x006b4ae1: call   0x14006f860
0x006b4ae6: jmp    0x1406b4d11
0x006b4aeb: mov    r8d,0x1b
0x006b4af1: lea    rdx,[rip+0xfc1458]        # 0x141675f50 ; literal="Continue conversation with "
0x006b4af8: call   0x14006f860
0x006b4afd: mov    rdi,QWORD PTR [rbx+0x50]
0x006b4b01: mov    rbx,QWORD PTR [rbx+0x48]
0x006b4b05: mov    rsi,rdi
0x006b4b08: sub    rsi,rbx
0x006b4b0b: sar    rsi,0x3
0x006b4b0f: dec    esi
0x006b4b11: xorps  xmm0,xmm0
0x006b4b14: movups XMMWORD PTR [rsp+0x20],xmm0
0x006b4b19: mov    QWORD PTR [rsp+0x30],0x0
0x006b4b22: mov    QWORD PTR [rsp+0x38],0xf
0x006b4b2b: mov    BYTE PTR [rsp+0x20],0x0
0x006b4b30: cmp    rbx,rdi
0x006b4b33: jae    0x1406b4d07
0x006b4b39: mov    r14,QWORD PTR [rbx]
0x006b4b3c: mov    r9d,DWORD PTR [r14]
0x006b4b3f: mov    rax,QWORD PTR [rip+0x1d2a4ba]        # 0x1423df000
0x006b4b46: cmp    r9d,DWORD PTR [rax+0x130]
0x006b4b4d: je     0x1406b4cfe
0x006b4b53: mov    r10,QWORD PTR [rip+0x1d2a44e]        # 0x1423defa8
0x006b4b5a: sub    r10,QWORD PTR [rip+0x1d2a43f]        # 0x1423defa0
0x006b4b61: sar    r10,0x3
0x006b4b65: test   r10d,r10d
0x006b4b68: je     0x1406b4c1b
0x006b4b6e: cmp    r9d,0xffffffff
0x006b4b72: je     0x1406b4c1b
0x006b4b78: xor    r8d,r8d
0x006b4b7b: sub    r10d,0x1
0x006b4b7f: js     0x1406b4bc3
0x006b4b81: nop    DWORD PTR [rax+0x0]
0x006b4b85: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x006b4b90: lea    edx,[r8+r10*1]
0x006b4b94: sar    edx,1
0x006b4b96: movsxd rcx,edx
0x006b4b99: mov    rax,QWORD PTR [rip+0x1d2a400]        # 0x1423defa0
0x006b4ba0: mov    rcx,QWORD PTR [rax+rcx*8]
0x006b4ba4: cmp    DWORD PTR [rcx+0x130],r9d
0x006b4bab: je     0x1406b4bc5
0x006b4bad: lea    eax,[rdx+0x1]
0x006b4bb0: cmovle r8d,eax
0x006b4bb4: lea    eax,[rdx-0x1]
0x006b4bb7: cmovle eax,r10d
0x006b4bbb: mov    r10d,eax
0x006b4bbe: cmp    r8d,eax
0x006b4bc1: jle    0x1406b4b90
0x006b4bc3: xor    ecx,ecx
0x006b4bc5: test   rcx,rcx
0x006b4bc8: je     0x1406b4c1b
0x006b4bca: lea    rdx,[rsp+0x20]
0x006b4bcf: call   0x14132c470
0x006b4bd4: lea    rdx,[rsp+0x20]
0x006b4bd9: cmp    QWORD PTR [rsp+0x38],0xf
0x006b4bdf: cmova  rdx,QWORD PTR [rsp+0x20]
0x006b4be5: mov    r8,QWORD PTR [rsp+0x30]
0x006b4bea: mov    rcx,rbp
0x006b4bed: call   0x14006f9a0
0x006b4bf2: dec    esi
0x006b4bf4: cmp    esi,0x1
0x006b4bf7: jle    0x1406b4ce7
0x006b4bfd: mov    r8d,0x2
0x006b4c03: lea    rdx,[rip+0xf2f4ba]        # 0x1415e40c4 ; literal=", "
0x006b4c0a: mov    rcx,rbp
0x006b4c0d: call   0x14006f9a0
0x006b4c12: add    rbx,0x8
0x006b4c16: jmp    0x1406b4b30
0x006b4c1b: mov    r10d,DWORD PTR [r14+0x4]
0x006b4c1f: mov    r9,QWORD PTR [rip+0x1e3efea]        # 0x1424f3c10
0x006b4c26: mov    r11,QWORD PTR [rip+0x1e3efdb]        # 0x1424f3c08
0x006b4c2d: sub    r9,r11
0x006b4c30: sar    r9,0x3
0x006b4c34: test   r9,r9
0x006b4c37: je     0x1406b4cfe
0x006b4c3d: cmp    r10d,0xffffffff
0x006b4c41: je     0x1406b4cfe
0x006b4c47: xor    edx,edx
0x006b4c49: sub    r9d,0x1
0x006b4c4d: js     0x1406b4cfe
0x006b4c53: lea    eax,[r9+rdx*1]
0x006b4c57: sar    eax,1
0x006b4c59: movsxd rcx,eax
0x006b4c5c: mov    rcx,QWORD PTR [r11+rcx*8]
0x006b4c60: mov    r8d,DWORD PTR [rcx+0xe0]
0x006b4c67: cmp    r8d,r10d
0x006b4c6a: je     0x1406b4c8b
0x006b4c6c: lea    ecx,[rax-0x1]
0x006b4c6f: cmovle ecx,r9d
0x006b4c73: mov    r9d,ecx
0x006b4c76: inc    eax
0x006b4c78: cmp    r8d,r10d
0x006b4c7b: cmovle edx,eax
0x006b4c7e: cmp    edx,ecx
0x006b4c80: jle    0x1406b4c53
0x006b4c82: add    rbx,0x8
0x006b4c86: jmp    0x1406b4b30
0x006b4c8b: test   rcx,rcx
0x006b4c8e: je     0x1406b4cfe
0x006b4c90: add    rcx,0x38
0x006b4c94: xor    r9d,r9d
0x006b4c97: mov    r8b,0x1
0x006b4c9a: lea    rdx,[rsp+0x20]
0x006b4c9f: call   0x140a91760
0x006b4ca4: lea    rdx,[rsp+0x20]
0x006b4ca9: cmp    QWORD PTR [rsp+0x38],0xf
0x006b4caf: cmova  rdx,QWORD PTR [rsp+0x20]
0x006b4cb5: mov    r8,QWORD PTR [rsp+0x30]
0x006b4cba: mov    rcx,rbp
0x006b4cbd: call   0x14006f9a0
0x006b4cc2: dec    esi
0x006b4cc4: cmp    esi,0x1
0x006b4cc7: jle    0x1406b4ce7
0x006b4cc9: mov    r8d,0x2
0x006b4ccf: lea    rdx,[rip+0xf2f3ee]        # 0x1415e40c4 ; literal=", "
0x006b4cd6: mov    rcx,rbp
0x006b4cd9: call   0x14006f9a0
0x006b4cde: add    rbx,0x8
0x006b4ce2: jmp    0x1406b4b30
0x006b4ce7: jne    0x1406b4cfe
0x006b4ce9: lea    rdx,[rip+0xf2f3cc]        # 0x1415e40bc ; literal=" and "
0x006b4cf0: mov    r8d,0x5
0x006b4cf6: mov    rcx,rbp
0x006b4cf9: call   0x14006f9a0
0x006b4cfe: add    rbx,0x8
0x006b4d02: jmp    0x1406b4b30
0x006b4d07: lea    rcx,[rsp+0x20]
0x006b4d0c: call   0x14006f7e0
0x006b4d11: mov    rcx,QWORD PTR [rsp+0x40]
0x006b4d16: xor    rcx,rsp
0x006b4d19: call   0x1415345d0
0x006b4d1e: mov    rbx,QWORD PTR [rsp+0x70]
0x006b4d23: mov    rbp,QWORD PTR [rsp+0x80]
0x006b4d2b: add    rsp,0x50
0x006b4d2f: pop    r14
0x006b4d31: pop    rdi
0x006b4d32: pop    rsi
0x006b4d33: ret

# classic PE:6a70b91c:0270a000; adventure_option_view_unitst+8; RVA 0x6b4d40..0x6b4fb5
0x006b4d40: mov    QWORD PTR [rsp+0x8],rbx
0x006b4d45: mov    QWORD PTR [rsp+0x18],rbp
0x006b4d4a: mov    QWORD PTR [rsp+0x20],rsi
0x006b4d4f: push   rdi
0x006b4d50: sub    rsp,0x50
0x006b4d54: mov    rax,QWORD PTR [rip+0x11e12e5]        # 0x141896040
0x006b4d5b: xor    rax,rsp
0x006b4d5e: mov    QWORD PTR [rsp+0x40],rax
0x006b4d63: mov    rbp,rdx
0x006b4d66: mov    rsi,rcx
0x006b4d69: mov    r8d,0x5
0x006b4d6f: lea    rdx,[rip+0xfc11ba]        # 0x141675f30 ; literal="View "
0x006b4d76: mov    rcx,rbp
0x006b4d79: call   0x14006f860
0x006b4d7e: mov    rdx,QWORD PTR [rip+0x1d2a27b]        # 0x1423df000
0x006b4d85: test   rdx,rdx
0x006b4d88: je     0x1406b4daf
0x006b4d8a: mov    eax,DWORD PTR [rsi+0x10]
0x006b4d8d: cmp    DWORD PTR [rdx+0x130],eax
0x006b4d93: jne    0x1406b4daf
0x006b4d95: mov    r8d,0x8
0x006b4d9b: lea    rdx,[rip+0xfa91d6]        # 0x14165df78 ; literal="yourself"
0x006b4da2: mov    rcx,rbp
0x006b4da5: call   0x14006f9a0
0x006b4daa: jmp    0x1406b4f93
0x006b4daf: xorps  xmm0,xmm0
0x006b4db2: movups XMMWORD PTR [rsp+0x20],xmm0
0x006b4db7: xor    edx,edx
0x006b4db9: mov    QWORD PTR [rsp+0x30],rdx
0x006b4dbe: mov    QWORD PTR [rsp+0x38],0xf
0x006b4dc7: mov    BYTE PTR [rsp+0x20],dl
0x006b4dcb: mov    ebx,DWORD PTR [rsi+0x10]
0x006b4dce: cmp    ebx,0xffffffff
0x006b4dd1: je     0x1406b4e43
0x006b4dd3: mov    r11,QWORD PTR [rip+0x1d2a1ce]        # 0x1423defa8
0x006b4dda: mov    rdi,QWORD PTR [rip+0x1d2a1bf]        # 0x1423defa0
0x006b4de1: sub    r11,rdi
0x006b4de4: sar    r11,0x3
0x006b4de8: test   r11d,r11d
0x006b4deb: je     0x1406b4e43
0x006b4ded: sub    r11d,0x1
0x006b4df1: mov    r9d,edx
0x006b4df4: js     0x1406b4e2c
0x006b4df6: data16 nop WORD PTR [rax+rax*1+0x0]
0x006b4e00: lea    ecx,[r9+r11*1]
0x006b4e04: sar    ecx,1
0x006b4e06: movsxd rax,ecx
0x006b4e09: mov    r8,QWORD PTR [rdi+rax*8]
0x006b4e0d: cmp    DWORD PTR [r8+0x130],ebx
0x006b4e14: je     0x1406b4e2f
0x006b4e16: lea    eax,[rcx+0x1]
0x006b4e19: cmovle r9d,eax
0x006b4e1d: lea    eax,[rcx-0x1]
0x006b4e20: cmovle eax,r11d
0x006b4e24: mov    r11d,eax
0x006b4e27: cmp    r9d,eax
0x006b4e2a: jle    0x1406b4e00
0x006b4e2c: mov    r8,rdx
0x006b4e2f: test   r8,r8
0x006b4e32: je     0x1406b4e43
0x006b4e34: lea    rdx,[rsp+0x20]
0x006b4e39: mov    rcx,r8
0x006b4e3c: call   0x14132c470
0x006b4e41: jmp    0x1406b4ebc
0x006b4e43: mov    r10d,DWORD PTR [rsi+0x14]
0x006b4e47: cmp    r10d,0xffffffff
0x006b4e4b: je     0x1406b4e9f
0x006b4e4d: mov    r9,QWORD PTR [rip+0x1e3edbc]        # 0x1424f3c10
0x006b4e54: mov    r11,QWORD PTR [rip+0x1e3edad]        # 0x1424f3c08
0x006b4e5b: sub    r9,r11
0x006b4e5e: sar    r9,0x3
0x006b4e62: test   r9,r9
0x006b4e65: je     0x1406b4e9f
0x006b4e67: sub    r9d,0x1
0x006b4e6b: js     0x1406b4e9f
0x006b4e6d: nop    DWORD PTR [rax]
0x006b4e70: lea    ecx,[r9+rdx*1]
0x006b4e74: sar    ecx,1
0x006b4e76: movsxd rax,ecx
0x006b4e79: mov    rbx,QWORD PTR [r11+rax*8]
0x006b4e7d: cmp    DWORD PTR [rbx+0xe0],r10d
0x006b4e84: je     0x1406b4f1e
0x006b4e8a: lea    eax,[rcx-0x1]
0x006b4e8d: cmovle eax,r9d
0x006b4e91: mov    r9d,eax
0x006b4e94: lea    eax,[rcx+0x1]
0x006b4e97: cmovle edx,eax
0x006b4e9a: cmp    edx,r9d
0x006b4e9d: jle    0x1406b4e70
0x006b4e9f: movabs rax,0x64696f5620656874 ; inline="the Void"
0x006b4ea9: mov    BYTE PTR [rsp+0x28],0x0
0x006b4eae: mov    QWORD PTR [rsp+0x20],rax
0x006b4eb3: mov    QWORD PTR [rsp+0x30],0x8
0x006b4ebc: lea    rdx,[rsp+0x20]
0x006b4ec1: cmp    QWORD PTR [rsp+0x38],0xf
0x006b4ec7: cmova  rdx,QWORD PTR [rsp+0x20]
0x006b4ecd: mov    r8,QWORD PTR [rsp+0x30]
0x006b4ed2: mov    rcx,rbp
0x006b4ed5: call   0x14006f9a0
0x006b4eda: nop
0x006b4edb: mov    rdx,QWORD PTR [rsp+0x38]
0x006b4ee0: cmp    rdx,0xf
0x006b4ee4: jbe    0x1406b4f93
0x006b4eea: inc    rdx
0x006b4eed: mov    rcx,QWORD PTR [rsp+0x20]
0x006b4ef2: mov    rax,rcx
0x006b4ef5: cmp    rdx,0x1000
0x006b4efc: jb     0x1406b4f8e
0x006b4f02: add    rdx,0x27
0x006b4f06: mov    rcx,QWORD PTR [rcx-0x8]
0x006b4f0a: sub    rax,rcx
0x006b4f0d: add    rax,0xfffffffffffffff8
0x006b4f11: cmp    rax,0x1f
0x006b4f15: jbe    0x1406b4f8e
0x006b4f17: call   QWORD PTR [rip+0xf2bb83]        # 0x1415e0aa0
0x006b4f1d: nop
0x006b4f1e: test   rbx,rbx
0x006b4f21: je     0x1406b4e9f
0x006b4f27: mov    rax,QWORD PTR [rbx+0x130]
0x006b4f2e: test   rax,rax
0x006b4f31: je     0x1406b4f5f
0x006b4f33: mov    rcx,QWORD PTR [rax+0x58]
0x006b4f37: test   rcx,rcx
0x006b4f3a: je     0x1406b4f5f
0x006b4f3c: mov    edx,DWORD PTR [rcx+0x30]
0x006b4f3f: cmp    edx,0xffffffff
0x006b4f42: je     0x1406b4f5f
0x006b4f44: lea    rcx,[rip+0x1e2cc8d]        # 0x1424e1bd8
0x006b4f4b: call   0x140072500
0x006b4f50: test   rax,rax
0x006b4f53: je     0x1406b4f5f
0x006b4f55: mov    rcx,rax
0x006b4f58: call   0x140c37530
0x006b4f5d: jmp    0x1406b4f63
0x006b4f5f: lea    rax,[rbx+0x38]
0x006b4f63: test   rax,rax
0x006b4f66: je     0x1406b4e9f
0x006b4f6c: cmp    BYTE PTR [rax+0x72],0x0
0x006b4f70: je     0x1406b4e9f
0x006b4f76: xor    r9d,r9d
0x006b4f79: mov    r8b,0x1
0x006b4f7c: lea    rdx,[rsp+0x20]
0x006b4f81: mov    rcx,rax
0x006b4f84: call   0x140a91760
0x006b4f89: jmp    0x1406b4ebc
0x006b4f8e: call   0x1415345f0
0x006b4f93: mov    rcx,QWORD PTR [rsp+0x40]
0x006b4f98: xor    rcx,rsp
0x006b4f9b: call   0x1415345d0
0x006b4fa0: mov    rbx,QWORD PTR [rsp+0x60]
0x006b4fa5: mov    rbp,QWORD PTR [rsp+0x70]
0x006b4faa: mov    rsi,QWORD PTR [rsp+0x78]
0x006b4faf: add    rsp,0x50
0x006b4fb3: pop    rdi
0x006b4fb4: ret

# classic PE:6a70b91c:0270a000; adventure_option_talk_new_conversationst+8; RVA 0x6b4fc0..0x6b5205
0x006b4fc0: mov    QWORD PTR [rsp+0x8],rbx
0x006b4fc5: mov    QWORD PTR [rsp+0x18],rbp
0x006b4fca: mov    QWORD PTR [rsp+0x20],rsi
0x006b4fcf: push   rdi
0x006b4fd0: sub    rsp,0x50
0x006b4fd4: mov    rax,QWORD PTR [rip+0x11e1065]        # 0x141896040
0x006b4fdb: xor    rax,rsp
0x006b4fde: mov    QWORD PTR [rsp+0x40],rax
0x006b4fe3: mov    rbp,rdx
0x006b4fe6: mov    rsi,rcx
0x006b4fe9: mov    r8d,0x1c
0x006b4fef: lea    rdx,[rip+0xfc0f02]        # 0x141675ef8 ; literal="Start new conversation with "
0x006b4ff6: mov    rcx,rbp
0x006b4ff9: call   0x14006f860
0x006b4ffe: xorps  xmm0,xmm0
0x006b5001: movups XMMWORD PTR [rsp+0x20],xmm0
0x006b5006: xor    edx,edx
0x006b5008: mov    QWORD PTR [rsp+0x30],rdx
0x006b500d: mov    QWORD PTR [rsp+0x38],0xf
0x006b5016: mov    BYTE PTR [rsp+0x20],dl
0x006b501a: mov    ebx,DWORD PTR [rsi+0x10]
0x006b501d: cmp    ebx,0xffffffff
0x006b5020: je     0x1406b5093
0x006b5022: mov    r11,QWORD PTR [rip+0x1d29f7f]        # 0x1423defa8
0x006b5029: mov    rdi,QWORD PTR [rip+0x1d29f70]        # 0x1423defa0
0x006b5030: sub    r11,rdi
0x006b5033: sar    r11,0x3
0x006b5037: test   r11d,r11d
0x006b503a: je     0x1406b5093
0x006b503c: sub    r11d,0x1
0x006b5040: mov    r9d,edx
0x006b5043: js     0x1406b507c
0x006b5045: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x006b5050: lea    ecx,[r9+r11*1]
0x006b5054: sar    ecx,1
0x006b5056: movsxd rax,ecx
0x006b5059: mov    r8,QWORD PTR [rdi+rax*8]
0x006b505d: cmp    DWORD PTR [r8+0x130],ebx
0x006b5064: je     0x1406b507f
0x006b5066: lea    eax,[rcx+0x1]
0x006b5069: cmovle r9d,eax
0x006b506d: lea    eax,[rcx-0x1]
0x006b5070: cmovle eax,r11d
0x006b5074: mov    r11d,eax
0x006b5077: cmp    r9d,eax
0x006b507a: jle    0x1406b5050
0x006b507c: mov    r8,rdx
0x006b507f: test   r8,r8
0x006b5082: je     0x1406b5093
0x006b5084: lea    rdx,[rsp+0x20]
0x006b5089: mov    rcx,r8
0x006b508c: call   0x14132c470
0x006b5091: jmp    0x1406b510c
0x006b5093: mov    r10d,DWORD PTR [rsi+0x14]
0x006b5097: cmp    r10d,0xffffffff
0x006b509b: je     0x1406b50ef
0x006b509d: mov    r9,QWORD PTR [rip+0x1e3eb6c]        # 0x1424f3c10
0x006b50a4: mov    r11,QWORD PTR [rip+0x1e3eb5d]        # 0x1424f3c08
0x006b50ab: sub    r9,r11
0x006b50ae: sar    r9,0x3
0x006b50b2: test   r9,r9
0x006b50b5: je     0x1406b50ef
0x006b50b7: sub    r9d,0x1
0x006b50bb: js     0x1406b50ef
0x006b50bd: nop    DWORD PTR [rax]
0x006b50c0: lea    ecx,[r9+rdx*1]
0x006b50c4: sar    ecx,1
0x006b50c6: movsxd rax,ecx
0x006b50c9: mov    rbx,QWORD PTR [r11+rax*8]
0x006b50cd: cmp    DWORD PTR [rbx+0xe0],r10d
0x006b50d4: je     0x1406b516e
0x006b50da: lea    eax,[rcx-0x1]
0x006b50dd: cmovle eax,r9d
0x006b50e1: mov    r9d,eax
0x006b50e4: lea    eax,[rcx+0x1]
0x006b50e7: cmovle edx,eax
0x006b50ea: cmp    edx,r9d
0x006b50ed: jle    0x1406b50c0
0x006b50ef: movabs rax,0x64696f5620656874 ; inline="the Void"
0x006b50f9: mov    BYTE PTR [rsp+0x28],0x0
0x006b50fe: mov    QWORD PTR [rsp+0x20],rax
0x006b5103: mov    QWORD PTR [rsp+0x30],0x8
0x006b510c: lea    rdx,[rsp+0x20]
0x006b5111: cmp    QWORD PTR [rsp+0x38],0xf
0x006b5117: cmova  rdx,QWORD PTR [rsp+0x20]
0x006b511d: mov    r8,QWORD PTR [rsp+0x30]
0x006b5122: mov    rcx,rbp
0x006b5125: call   0x14006f9a0
0x006b512a: nop
0x006b512b: mov    rdx,QWORD PTR [rsp+0x38]
0x006b5130: cmp    rdx,0xf
0x006b5134: jbe    0x1406b51e3
0x006b513a: inc    rdx
0x006b513d: mov    rcx,QWORD PTR [rsp+0x20]
0x006b5142: mov    rax,rcx
0x006b5145: cmp    rdx,0x1000
0x006b514c: jb     0x1406b51de
0x006b5152: add    rdx,0x27
0x006b5156: mov    rcx,QWORD PTR [rcx-0x8]
0x006b515a: sub    rax,rcx
0x006b515d: add    rax,0xfffffffffffffff8
0x006b5161: cmp    rax,0x1f
0x006b5165: jbe    0x1406b51de
0x006b5167: call   QWORD PTR [rip+0xf2b933]        # 0x1415e0aa0
0x006b516d: nop
0x006b516e: test   rbx,rbx
0x006b5171: je     0x1406b50ef
0x006b5177: mov    rax,QWORD PTR [rbx+0x130]
0x006b517e: test   rax,rax
0x006b5181: je     0x1406b51af
0x006b5183: mov    rcx,QWORD PTR [rax+0x58]
0x006b5187: test   rcx,rcx
0x006b518a: je     0x1406b51af
0x006b518c: mov    edx,DWORD PTR [rcx+0x30]
0x006b518f: cmp    edx,0xffffffff
0x006b5192: je     0x1406b51af
0x006b5194: lea    rcx,[rip+0x1e2ca3d]        # 0x1424e1bd8
0x006b519b: call   0x140072500
0x006b51a0: test   rax,rax
0x006b51a3: je     0x1406b51af
0x006b51a5: mov    rcx,rax
0x006b51a8: call   0x140c37530
0x006b51ad: jmp    0x1406b51b3
0x006b51af: lea    rax,[rbx+0x38]
0x006b51b3: test   rax,rax
0x006b51b6: je     0x1406b50ef
0x006b51bc: cmp    BYTE PTR [rax+0x72],0x0
0x006b51c0: je     0x1406b50ef
0x006b51c6: xor    r9d,r9d
0x006b51c9: mov    r8b,0x1
0x006b51cc: lea    rdx,[rsp+0x20]
0x006b51d1: mov    rcx,rax
0x006b51d4: call   0x140a91760
0x006b51d9: jmp    0x1406b510c
0x006b51de: call   0x1415345f0
0x006b51e3: mov    rcx,QWORD PTR [rsp+0x40]
0x006b51e8: xor    rcx,rsp
0x006b51eb: call   0x1415345d0
0x006b51f0: mov    rbx,QWORD PTR [rsp+0x60]
0x006b51f5: mov    rbp,QWORD PTR [rsp+0x70]
0x006b51fa: mov    rsi,QWORD PTR [rsp+0x78]
0x006b51ff: add    rsp,0x50
0x006b5203: pop    rdi
0x006b5204: ret

# classic PE:6a70b91c:0270a000; adventure_option_start_shoutingst+8; RVA 0x6b53b0..0x6b53c5
0x006b53b0: mov    rcx,rdx
0x006b53b3: mov    r8d,0x16
0x006b53b9: lea    rdx,[rip+0xfc0b58]        # 0x141675f18 ; literal="Shout out to everybody"
0x006b53c0: jmp    0x14006f860

# classic PE:6a70b91c:0270a000; adventure_option_assume_identityst+8; RVA 0x6b53d0..0x6b53e5
0x006b53d0: mov    rcx,rdx
0x006b53d3: mov    r8d,0x12
0x006b53d9: lea    rdx,[rip+0xfc0b00]        # 0x141675ee0 ; literal="Assume an identity"
0x006b53e0: jmp    0x14006f860

# classic PE:6a70b91c:0270a000; direction-helper; RVA 0x74cc40..0x74cdc9
0x0074cc40: mov    QWORD PTR [rsp+0x8],rbx
0x0074cc45: mov    QWORD PTR [rsp+0x10],rbp
0x0074cc4a: mov    QWORD PTR [rsp+0x18],rdi
0x0074cc4f: push   r12
0x0074cc51: push   r14
0x0074cc53: push   r15
0x0074cc55: sub    rsp,0x20
0x0074cc59: mov    rdi,QWORD PTR [rsp+0x70]
0x0074cc5e: movzx  r15d,r9w
0x0074cc62: movzx  r14d,WORD PTR [rsp+0x68]
0x0074cc68: movzx  ebp,r8w
0x0074cc6c: movzx  ebx,dx
0x0074cc6f: movzx  r12d,cx
0x0074cc73: cmp    r9w,cx
0x0074cc77: jge    0x14074ccca
0x0074cc79: mov    rcx,rdi
0x0074cc7c: cmp    WORD PTR [rsp+0x60],dx
0x0074cc81: jge    0x14074cc9a
0x0074cc83: mov    r8d,0x2
0x0074cc89: lea    rdx,[rip+0xf4d9cc]        # 0x14169a65c ; literal="NW"
0x0074cc90: call   0x14006f9a0
0x0074cc95: jmp    0x14074cd89
0x0074cc9a: jle    0x14074ccb3
0x0074cc9c: mov    r8d,0x2
0x0074cca2: lea    rdx,[rip+0xf4d9bb]        # 0x14169a664 ; literal="SW"
0x0074cca9: call   0x14006f9a0
0x0074ccae: jmp    0x14074cd89
0x0074ccb3: mov    r8d,0x4
0x0074ccb9: lea    rdx,[rip+0xf4d9ac]        # 0x14169a66c ; literal="West"
0x0074ccc0: call   0x14006f9a0
0x0074ccc5: jmp    0x14074cd89
0x0074ccca: jle    0x14074cd1a
0x0074cccc: mov    rcx,rdi
0x0074cccf: cmp    WORD PTR [rsp+0x60],bx
0x0074ccd4: jge    0x14074cced
0x0074ccd6: mov    r8d,0x2
0x0074ccdc: lea    rdx,[rip+0xf4d97d]        # 0x14169a660 ; literal="NE"
0x0074cce3: call   0x14006f9a0
0x0074cce8: jmp    0x14074cd89
0x0074cced: jle    0x14074cd06
0x0074ccef: mov    r8d,0x2
0x0074ccf5: lea    rdx,[rip+0xf4d96c]        # 0x14169a668 ; literal="SE"
0x0074ccfc: call   0x14006f9a0
0x0074cd01: jmp    0x14074cd89
0x0074cd06: mov    r8d,0x4
0x0074cd0c: lea    rdx,[rip+0xf4d961]        # 0x14169a674 ; literal="East"
0x0074cd13: call   0x14006f9a0
0x0074cd18: jmp    0x14074cd89
0x0074cd1a: cmp    WORD PTR [rsp+0x60],bx
0x0074cd1f: jge    0x14074cd30
0x0074cd21: lea    rdx,[rip+0xf4d954]        # 0x14169a67c ; literal="North"
0x0074cd28: mov    r8d,0x5
0x0074cd2e: jmp    0x14074cd74
0x0074cd30: jle    0x14074cd41
0x0074cd32: lea    rdx,[rip+0xf4d94b]        # 0x14169a684 ; literal="South"
0x0074cd39: mov    r8d,0x5
0x0074cd3f: jmp    0x14074cd74
0x0074cd41: cmp    r14w,bp
0x0074cd45: jge    0x14074cd56
0x0074cd47: lea    rdx,[rip+0xf4d93e]        # 0x14169a68c ; literal="Below"
0x0074cd4e: mov    r8d,0x5
0x0074cd54: jmp    0x14074cd74
0x0074cd56: jle    0x14074cd67
0x0074cd58: lea    rdx,[rip+0xf4d935]        # 0x14169a694 ; literal="Above"
0x0074cd5f: mov    r8d,0x5
0x0074cd65: jmp    0x14074cd74
0x0074cd67: lea    rdx,[rip+0xf4d92e]        # 0x14169a69c ; literal="Here"
0x0074cd6e: mov    r8d,0x4
0x0074cd74: mov    rcx,rdi
0x0074cd77: call   0x14006f9a0
0x0074cd7c: cmp    r15w,r12w
0x0074cd80: jne    0x14074cd89
0x0074cd82: cmp    WORD PTR [rsp+0x60],bx
0x0074cd87: je     0x14074cdaf
0x0074cd89: cmp    r14w,bp
0x0074cd8d: jge    0x14074cd98
0x0074cd8f: lea    rdx,[rip+0xf4d90e]        # 0x14169a6a4 ; literal="/Below"
0x0074cd96: jmp    0x14074cda1
0x0074cd98: jle    0x14074cdaf
0x0074cd9a: lea    rdx,[rip+0xf4d767]        # 0x14169a508 ; literal="/Above"
0x0074cda1: mov    r8d,0x6
0x0074cda7: mov    rcx,rdi
0x0074cdaa: call   0x14006f9a0
0x0074cdaf: mov    rbx,QWORD PTR [rsp+0x40]
0x0074cdb4: mov    rbp,QWORD PTR [rsp+0x48]
0x0074cdb9: mov    rdi,QWORD PTR [rsp+0x50]
0x0074cdbe: add    rsp,0x20
0x0074cdc2: pop    r15
0x0074cdc4: pop    r14
0x0074cdc6: pop    r12
0x0074cdc8: ret

# classic PE:6a70b91c:0270a000; adventure_environment_ingest_from_containerst+16;adventure_environment_ingest_materialst+16;adventure_environment_pick_up_building_item_contentsst+16;adventure_environment_pick_up_building_itemst+16;adventure_environment_pick_up_environmentst+16;adventure_environment_pick_up_ground_itemst+16;adventure_environment_pick_vegetationst+16;adventure_environment_pickup_chop_treest+16;adventure_environment_pickup_ignite_vegst+16;adventure_environment_pickup_make_campfirest+16;adventure_environment_pickup_vermin_eventst+16;adventure_environment_place_in_bld_containerst+16;adventure_environment_place_in_it_containerst+16;adventure_environment_place_on_pack_animalst+16;adventure_environment_take_from_pack_animalst+16;adventure_environment_take_item_from_containerst+16;adventure_environment_unit_suck_bloodst+16;adventure_item_interact_fill_from_containerst+16;adventure_item_interact_fill_with_materialst+16;adventure_item_interact_give_namest+16;adventure_item_interact_heat_from_tilest+16;adventure_item_interact_load_ranged_weaponst+16;adventure_item_interact_pull_outst+16;adventure_item_interact_readst+16;adventure_item_interact_roll_allst+16;adventure_item_interact_rollst+16;adventure_item_interact_strugglest+16;adventure_item_interact_unnockst+16;adventure_movement_attack_creaturest+16;adventure_movement_building_interact_bash_down_doorst+16;adventure_movement_building_interact_break_in_hatchst+16;adventure_movement_building_interact_lower_well_bucketst+16;adventure_movement_building_interact_pick_door_lockst+16;adventure_movement_building_interact_pick_hatch_lockst+16;adventure_movement_building_interact_pull_leverst+16;adventure_movement_building_interact_raise_well_bucketst+16;adventure_movement_building_interact_topple_statuest+16;adventure_movement_claim_petst+16;adventure_movement_climbst+16;adventure_movement_combat_menu_creaturest+16;adventure_movement_dismountst+16;adventure_movement_hold_itemst+16;adventure_movement_hold_tilest+16;adventure_movement_item_interact_guidest+16;adventure_movement_item_interact_pushst+16;adventure_movement_item_interact_ridest+16;adventure_movement_jumpst+16;adventure_movement_lead_animalst+16;adventure_movement_mountst+16;adventure_movement_movest+16;adventure_movement_pathst+16;adventure_movement_release_hold_itemst+16;adventure_movement_release_hold_tilest+16;adventure_movement_shoot_creaturest+16;adventure_movement_shoot_tilest+16;adventure_movement_stop_lead_animalst+16;adventure_movement_throw_item_at_creaturest+16;adventure_movement_throw_item_at_tilest+16;adventure_option_assume_identityst+16;adventure_option_eat_item_contaminantst+16;adventure_option_eat_unit_contaminantst+16;adventure_option_interact_with_itemst+16;adventure_option_inventory_itemst+16;adventure_option_start_shoutingst+16;adventure_option_talk_existing_conversationst+16;adventure_option_talk_new_conversationst+16;adventure_option_view_contaminantst+16;adventure_option_view_unitst+16;adventure_optionst+16; RVA 0x7deab0..0x7deac6
0x007deab0: mov    rax,QWORD PTR [rcx]
0x007deab3: rex.W jmp QWORD PTR [rax+0x8]
0x007deab7: int3
0x007deab8: int3
0x007deab9: int3
0x007deaba: int3
0x007deabb: int3
0x007deabc: int3
0x007deabd: int3
0x007deabe: int3
0x007deabf: int3
0x007deac0: mov    eax,0xffff8ad0
0x007deac5: ret

# classic PE:6a70b91c:0270a000; adventure_item_interact_strugglest+8; RVA 0x7deb60..0x7deb75
0x007deb60: mov    rcx,rdx
0x007deb63: mov    r8d,0xf
0x007deb69: lea    rdx,[rip+0xec9b88]        # 0x1416a86f8 ; literal="Gain possession"
0x007deb70: jmp    0x14006f860

# classic PE:6a70b91c:0270a000; adventure_item_interact_pull_outst+8; RVA 0x7deba0..0x7debb5
0x007deba0: mov    rcx,rdx
0x007deba3: mov    r8d,0xb
0x007deba9: lea    rdx,[rip+0xec9b38]        # 0x1416a86e8 ; literal="Pull it out"
0x007debb0: jmp    0x14006f860

# classic PE:6a70b91c:0270a000; adventure_item_interact_unnockst+8; RVA 0x7debc0..0x7debd5
0x007debc0: mov    rcx,rdx
0x007debc3: mov    r8d,0xd
0x007debc9: lea    rdx,[rip+0xec9b40]        # 0x1416a8710 ; literal="Cease nocking"
0x007debd0: jmp    0x14006f860

# classic PE:6a70b91c:0270a000; adventure_item_interact_readst+8; RVA 0x7dec50..0x7dec65
0x007dec50: mov    rcx,rdx
0x007dec53: mov    r8d,0x4
0x007dec59: lea    rdx,[rip+0xe0497c]        # 0x1415e35dc ; literal="Read"
0x007dec60: jmp    0x14006f860

# classic PE:6a70b91c:0270a000; adventure_item_interact_rollst+8; RVA 0x7dec70..0x7dec85
0x007dec70: mov    rcx,rdx
0x007dec73: mov    r8d,0x4
0x007dec79: lea    rdx,[rip+0xec9a88]        # 0x1416a8708 ; literal="Roll"
0x007dec80: jmp    0x14006f860

# classic PE:6a70b91c:0270a000; adventure_item_interact_roll_allst+8; RVA 0x7dec90..0x7deca5
0x007dec90: mov    rcx,rdx
0x007dec93: mov    r8d,0x8
0x007dec99: lea    rdx,[rip+0xec98e0]        # 0x1416a8580 ; literal="Roll all"
0x007deca0: jmp    0x14006f860

# classic PE:6a70b91c:0270a000; adventure_item_interact_load_ranged_weaponst+8; RVA 0x8325d0..0x83272d
0x008325d0: mov    QWORD PTR [rsp+0x18],rbx
0x008325d5: push   rdi
0x008325d6: sub    rsp,0x50
0x008325da: mov    rax,QWORD PTR [rip+0x1063a5f]        # 0x141896040
0x008325e1: xor    rax,rsp
0x008325e4: mov    QWORD PTR [rsp+0x40],rax
0x008325e9: mov    rbx,rdx
0x008325ec: mov    rdi,rcx
0x008325ef: mov    QWORD PTR [rdx+0x10],0x0
0x008325f7: mov    rax,rdx
0x008325fa: cmp    QWORD PTR [rdx+0x18],0xf
0x008325ff: jbe    0x140832604
0x00832601: mov    rax,QWORD PTR [rdx]
0x00832604: mov    BYTE PTR [rax],0x0
0x00832607: mov    rcx,QWORD PTR [rcx+0x10]
0x0083260b: test   rcx,rcx
0x0083260e: je     0x140832644
0x00832610: mov    rax,QWORD PTR [rcx]
0x00832613: call   QWORD PTR [rax]
0x00832615: cmp    ax,0x18
0x00832619: jne    0x140832644
0x0083261b: mov    rax,QWORD PTR [rdi+0x10]
0x0083261f: mov    rcx,QWORD PTR [rax+0xe8]
0x00832626: cmp    DWORD PTR [rcx+0x1cc],0x0
0x0083262d: jne    0x140832644
0x0083262f: mov    r8d,0x7
0x00832635: lea    rdx,[rip+0xe78f7c]        # 0x1416ab5b8 ; literal="Nock in"
0x0083263c: mov    rcx,rbx
0x0083263f: call   0x14006f860
0x00832644: cmp    QWORD PTR [rbx+0x10],0x0
0x00832649: jne    0x140832660
0x0083264b: mov    r8d,0x9
0x00832651: lea    rdx,[rip+0xe78f10]        # 0x1416ab568 ; literal="Load into"
0x00832658: mov    rcx,rbx
0x0083265b: call   0x14006f860
0x00832660: cmp    QWORD PTR [rdi+0x10],0x0
0x00832665: je     0x140832715
0x0083266b: mov    r8d,0x1
0x00832671: lea    rdx,[rip+0xdb10a8]        # 0x1415e3720 ; literal=" "
0x00832678: mov    rcx,rbx
0x0083267b: call   0x14006f9a0
0x00832680: xorps  xmm0,xmm0
0x00832683: movups XMMWORD PTR [rsp+0x20],xmm0
0x00832688: mov    QWORD PTR [rsp+0x30],0x0
0x00832691: mov    QWORD PTR [rsp+0x38],0xf
0x0083269a: mov    BYTE PTR [rsp+0x20],0x0
0x0083269f: mov    r9d,0x1
0x008326a5: xor    r8d,r8d
0x008326a8: lea    rdx,[rsp+0x20]
0x008326ad: mov    rcx,QWORD PTR [rdi+0x10]
0x008326b1: call   0x140c62490
0x008326b6: lea    rdx,[rsp+0x20]
0x008326bb: cmp    QWORD PTR [rsp+0x38],0xf
0x008326c1: cmova  rdx,QWORD PTR [rsp+0x20]
0x008326c7: mov    r8,QWORD PTR [rsp+0x30]
0x008326cc: mov    rcx,rbx
0x008326cf: call   0x14006f9a0
0x008326d4: nop
0x008326d5: mov    rdx,QWORD PTR [rsp+0x38]
0x008326da: cmp    rdx,0xf
0x008326de: jbe    0x140832715
0x008326e0: inc    rdx
0x008326e3: mov    rcx,QWORD PTR [rsp+0x20]
0x008326e8: mov    rax,rcx
0x008326eb: cmp    rdx,0x1000
0x008326f2: jb     0x140832710
0x008326f4: add    rdx,0x27
0x008326f8: mov    rcx,QWORD PTR [rcx-0x8]
0x008326fc: sub    rax,rcx
0x008326ff: add    rax,0xfffffffffffffff8
0x00832703: cmp    rax,0x1f
0x00832707: jbe    0x140832710
0x00832709: call   QWORD PTR [rip+0xdae391]        # 0x1415e0aa0
0x0083270f: int3
0x00832710: call   0x1415345f0
0x00832715: mov    rcx,QWORD PTR [rsp+0x40]
0x0083271a: xor    rcx,rsp
0x0083271d: call   0x1415345d0
0x00832722: mov    rbx,QWORD PTR [rsp+0x70]
0x00832727: add    rsp,0x50
0x0083272b: pop    rdi
0x0083272c: ret

# classic PE:6a70b91c:0270a000; adventure_item_interact_fill_from_containerst+8; RVA 0x832ae0..0x832ce0
0x00832ae0: mov    QWORD PTR [rsp+0x18],rbx
0x00832ae5: mov    QWORD PTR [rsp+0x20],rdi
0x00832aea: push   rbp
0x00832aeb: lea    rbp,[rsp-0x57]
0x00832af0: sub    rsp,0x90
0x00832af7: mov    rax,QWORD PTR [rip+0x1063542]        # 0x141896040
0x00832afe: xor    rax,rsp
0x00832b01: mov    QWORD PTR [rbp+0x47],rax
0x00832b05: mov    rdi,rdx
0x00832b08: mov    rbx,rcx
0x00832b0b: mov    r8d,0x5
0x00832b11: lea    rdx,[rip+0xe78a6c]        # 0x1416ab584 ; literal="Fill "
0x00832b18: mov    rcx,rdi
0x00832b1b: call   0x14006f860
0x00832b20: xorps  xmm0,xmm0
0x00832b23: movups XMMWORD PTR [rbp+0x27],xmm0
0x00832b27: mov    QWORD PTR [rbp+0x37],0x0
0x00832b2f: mov    QWORD PTR [rbp+0x3f],0xf
0x00832b37: mov    BYTE PTR [rbp+0x27],0x0
0x00832b3b: mov    r9d,0xffffffff
0x00832b41: xor    r8d,r8d
0x00832b44: lea    rdx,[rbp+0x27]
0x00832b48: mov    rcx,QWORD PTR [rbx+0x10]
0x00832b4c: call   0x140c62490
0x00832b51: lea    rdx,[rbp+0x27]
0x00832b55: cmp    QWORD PTR [rbp+0x3f],0xf
0x00832b5a: cmova  rdx,QWORD PTR [rbp+0x27]
0x00832b5f: mov    r8,QWORD PTR [rbp+0x37]
0x00832b63: mov    rcx,rdi
0x00832b66: call   0x14006f9a0
0x00832b6b: mov    r8d,0x6
0x00832b71: lea    rdx,[rip+0xdb5e0c]        # 0x1415e8984 ; literal=" from "
0x00832b78: mov    rcx,rdi
0x00832b7b: call   0x14006f9a0
0x00832b80: xorps  xmm0,xmm0
0x00832b83: movups XMMWORD PTR [rbp+0x7],xmm0
0x00832b87: mov    QWORD PTR [rbp+0x17],0x0
0x00832b8f: mov    QWORD PTR [rbp+0x1f],0xf
0x00832b97: mov    BYTE PTR [rbp+0x7],0x0
0x00832b9b: mov    r9d,0xffffffff
0x00832ba1: xor    r8d,r8d
0x00832ba4: lea    rdx,[rbp+0x7]
0x00832ba8: mov    rcx,QWORD PTR [rbx+0x18]
0x00832bac: call   0x140c62490
0x00832bb1: lea    rdx,[rbp+0x7]
0x00832bb5: cmp    QWORD PTR [rbp+0x1f],0xf
0x00832bba: cmova  rdx,QWORD PTR [rbp+0x7]
0x00832bbf: mov    r8,QWORD PTR [rbp+0x17]
0x00832bc3: mov    rcx,rdi
0x00832bc6: call   0x14006f9a0
0x00832bcb: mov    eax,0xffff8ad0
0x00832bd0: cmp    WORD PTR [rbx+0x20],ax
0x00832bd4: je     0x140832c2f
0x00832bd6: mov    r8d,0x2
0x00832bdc: lea    rdx,[rip+0xddd6b5]        # 0x141610298 ; literal=" ("
0x00832be3: mov    rcx,rdi
0x00832be6: call   0x14006f9a0
0x00832beb: mov    QWORD PTR [rsp+0x30],rdi
0x00832bf0: movzx  eax,WORD PTR [rbx+0x2a]
0x00832bf4: mov    WORD PTR [rsp+0x28],ax
0x00832bf9: movzx  eax,WORD PTR [rbx+0x28]
0x00832bfd: mov    WORD PTR [rsp+0x20],ax
0x00832c02: movzx  r9d,WORD PTR [rbx+0x26]
0x00832c07: movzx  r8d,WORD PTR [rbx+0x24]
0x00832c0c: movzx  edx,WORD PTR [rbx+0x22]
0x00832c10: movzx  ecx,WORD PTR [rbx+0x20]
0x00832c14: call   0x14074cc40
0x00832c19: mov    r8d,0x1
0x00832c1f: lea    rdx,[rip+0xddd6b2]        # 0x1416102d8 ; literal=")"
0x00832c26: mov    rcx,rdi
0x00832c29: call   0x14006f9a0
0x00832c2e: nop
0x00832c2f: mov    rdx,QWORD PTR [rbp+0x1f]
0x00832c33: cmp    rdx,0xf
0x00832c37: jbe    0x140832c6d
0x00832c39: inc    rdx
0x00832c3c: mov    rcx,QWORD PTR [rbp+0x7]
0x00832c40: mov    rax,rcx
0x00832c43: cmp    rdx,0x1000
0x00832c4a: jb     0x140832c68
0x00832c4c: add    rdx,0x27
0x00832c50: mov    rcx,QWORD PTR [rcx-0x8]
0x00832c54: sub    rax,rcx
0x00832c57: add    rax,0xfffffffffffffff8
0x00832c5b: cmp    rax,0x1f
0x00832c5f: jbe    0x140832c68
0x00832c61: call   QWORD PTR [rip+0xdade39]        # 0x1415e0aa0
0x00832c67: int3
0x00832c68: call   0x1415345f0
0x00832c6d: mov    QWORD PTR [rbp+0x17],0x0
0x00832c75: mov    QWORD PTR [rbp+0x1f],0xf
0x00832c7d: mov    BYTE PTR [rbp+0x7],0x0
0x00832c81: mov    rdx,QWORD PTR [rbp+0x3f]
0x00832c85: cmp    rdx,0xf
0x00832c89: jbe    0x140832cbf
0x00832c8b: inc    rdx
0x00832c8e: mov    rcx,QWORD PTR [rbp+0x27]
0x00832c92: mov    rax,rcx
0x00832c95: cmp    rdx,0x1000
0x00832c9c: jb     0x140832cba
0x00832c9e: add    rdx,0x27
0x00832ca2: mov    rcx,QWORD PTR [rcx-0x8]
0x00832ca6: sub    rax,rcx
0x00832ca9: add    rax,0xfffffffffffffff8
0x00832cad: cmp    rax,0x1f
0x00832cb1: jbe    0x140832cba
0x00832cb3: call   QWORD PTR [rip+0xdadde7]        # 0x1415e0aa0
0x00832cb9: int3
0x00832cba: call   0x1415345f0
0x00832cbf: mov    rcx,QWORD PTR [rbp+0x47]
0x00832cc3: xor    rcx,rsp
0x00832cc6: call   0x1415345d0
0x00832ccb: lea    r11,[rsp+0x90]
0x00832cd3: mov    rbx,QWORD PTR [r11+0x20]
0x00832cd7: mov    rdi,QWORD PTR [r11+0x28]
0x00832cdb: mov    rsp,r11
0x00832cde: pop    rbp
0x00832cdf: ret

# classic PE:6a70b91c:0270a000; adventure_item_interact_fill_with_materialst+8; RVA 0x832ce0..0x8335ca
0x00832ce0: mov    QWORD PTR [rsp+0x18],rbx
0x00832ce5: push   rbp
0x00832ce6: push   rsi
0x00832ce7: push   rdi
0x00832ce8: push   r12
0x00832cea: push   r13
0x00832cec: push   r14
0x00832cee: push   r15
0x00832cf0: lea    rbp,[rsp-0x27]
0x00832cf5: sub    rsp,0xe0
0x00832cfc: mov    rax,QWORD PTR [rip+0x106333d]        # 0x141896040
0x00832d03: xor    rax,rsp
0x00832d06: mov    QWORD PTR [rbp+0x1f],rax
0x00832d0a: mov    rdi,rdx
0x00832d0d: mov    QWORD PTR [rbp-0x69],rdx
0x00832d11: mov    r13,rcx
0x00832d14: mov    r8d,0x5
0x00832d1a: lea    rdx,[rip+0xe78863]        # 0x1416ab584 ; literal="Fill "
0x00832d21: mov    rcx,rdi
0x00832d24: call   0x14006f860
0x00832d29: xorps  xmm0,xmm0
0x00832d2c: movups XMMWORD PTR [rbp-0x1],xmm0
0x00832d30: mov    QWORD PTR [rbp+0xf],0x0
0x00832d38: mov    QWORD PTR [rbp+0x17],0xf
0x00832d40: mov    BYTE PTR [rbp-0x1],0x0
0x00832d44: mov    r9d,0xffffffff
0x00832d4a: xor    r8d,r8d
0x00832d4d: lea    rdx,[rbp-0x1]
0x00832d51: mov    rcx,QWORD PTR [r13+0x10]
0x00832d55: call   0x140c62490
0x00832d5a: lea    rdx,[rbp-0x1]
0x00832d5e: cmp    QWORD PTR [rbp+0x17],0xf
0x00832d63: cmova  rdx,QWORD PTR [rbp-0x1]
0x00832d68: mov    r8,QWORD PTR [rbp+0xf]
0x00832d6c: mov    rcx,rdi
0x00832d6f: call   0x14006f9a0
0x00832d74: mov    r8d,0x6
0x00832d7a: lea    rdx,[rip+0xdb680f]        # 0x1415e9590 ; literal=" with "
0x00832d81: mov    rcx,rdi
0x00832d84: call   0x14006f9a0
0x00832d89: movsx  r9,WORD PTR [r13+0x22]
0x00832d8e: movsx  edx,WORD PTR [r13+0x20]
0x00832d93: movsx  r8d,WORD PTR [r13+0x1e]
0x00832d98: mov    esi,0xdb
0x00832d9d: lea    r14,[rip+0xf4fd0c]        # 0x141782ab0 ; literal="unknown material"
0x00832da4: test   r8w,r8w
0x00832da8: js     0x140833179
0x00832dae: mov    r11d,DWORD PTR [rip+0x1caf217]        # 0x1424e1fcc
0x00832db5: cmp    r8d,r11d
0x00832db8: jge    0x140833180
0x00832dbe: test   dx,dx
0x00832dc1: js     0x140833180
0x00832dc7: cmp    edx,DWORD PTR [rip+0x1caf203]        # 0x1424e1fd0
0x00832dcd: jge    0x140833180
0x00832dd3: test   r9w,r9w
0x00832dd7: js     0x140833180
0x00832ddd: cmp    r9d,DWORD PTR [rip+0x1caf1f0]        # 0x1424e1fd4
0x00832de4: jge    0x140833180
0x00832dea: sar    r8w,0x4
0x00832def: sar    dx,0x4
0x00832df3: mov    rcx,QWORD PTR [rip+0x1caf19e]        # 0x1424e1f98
0x00832dfa: test   rcx,rcx
0x00832dfd: je     0x140833180
0x00832e03: movsx  rax,r8w
0x00832e07: movsx  rdx,dx
0x00832e0b: mov    rax,QWORD PTR [rcx+rax*8]
0x00832e0f: mov    rax,QWORD PTR [rax+rdx*8]
0x00832e13: mov    rbx,QWORD PTR [rax+r9*8]
0x00832e17: mov    QWORD PTR [rbp-0x71],rbx
0x00832e1b: test   rbx,rbx
0x00832e1e: je     0x140833180
0x00832e24: mov    rax,QWORD PTR [rbx+0x10]
0x00832e28: sub    rax,QWORD PTR [rbx+0x8]
0x00832e2c: sar    rax,0x3
0x00832e30: sub    eax,0x1
0x00832e33: js     0x140833180
0x00832e39: movsxd rsi,eax
0x00832e3c: mov    QWORD PTR [rbp-0x79],rsi
0x00832e40: mov    rax,QWORD PTR [rbx+0x8]
0x00832e44: mov    rcx,QWORD PTR [rax+rsi*8]
0x00832e48: mov    rax,QWORD PTR [rcx]
0x00832e4b: call   QWORD PTR [rax]
0x00832e4d: cmp    ax,0x3
0x00832e51: jne    0x140833166
0x00832e57: mov    rax,QWORD PTR [rbx+0x8]
0x00832e5b: mov    rdx,QWORD PTR [rax+rsi*8]
0x00832e5f: movsx  eax,WORD PTR [r13+0x1e]
0x00832e64: and    eax,0x8000000f
0x00832e69: jge    0x140832e72
0x00832e6b: dec    eax
0x00832e6d: or     eax,0xfffffff0
0x00832e70: inc    eax
0x00832e72: movsxd r8,eax
0x00832e75: add    r8,r8
0x00832e78: movsx  eax,WORD PTR [r13+0x20]
0x00832e7d: and    eax,0x8000000f
0x00832e82: jge    0x140832e8b
0x00832e84: dec    eax
0x00832e86: or     eax,0xfffffff0
0x00832e89: inc    eax
0x00832e8b: movsxd rcx,eax
0x00832e8e: lea    rax,[rdx+r8*8]
0x00832e92: cmp    BYTE PTR [rcx+rax*1+0x12],0x64
0x00832e97: jb     0x140833166
0x00832e9d: movsx  r12,WORD PTR [rdx+0x10]
0x00832ea2: cmp    r12d,0x2
0x00832ea6: je     0x140833166
0x00832eac: movzx  r15d,WORD PTR [rdx+0x8]
0x00832eb1: cmp    r15w,WORD PTR [r13+0x24]
0x00832eb6: jne    0x140832ec5
0x00832eb8: mov    eax,DWORD PTR [r13+0x28]
0x00832ebc: cmp    DWORD PTR [rdx+0xc],eax
0x00832ebf: je     0x140833166
0x00832ec5: xorps  xmm0,xmm0
0x00832ec8: movups XMMWORD PTR [rbp-0x21],xmm0
0x00832ecc: mov    QWORD PTR [rbp-0x9],0xf
0x00832ed4: mov    edi,DWORD PTR [rdx+0xc]
0x00832ed7: mov    QWORD PTR [rbp-0x11],0x0
0x00832edf: mov    BYTE PTR [rbp-0x21],0x0
0x00832ee3: movzx  eax,r15w
0x00832ee7: mov    ecx,0xdb
0x00832eec: sub    ax,cx
0x00832eef: mov    ecx,0xc7
0x00832ef4: cmp    ax,cx
0x00832ef7: ja     0x140833067
0x00832efd: mov    r8,QWORD PTR [rip+0x1cc0d0c]        # 0x1424f3c10
0x00832f04: mov    r10,QWORD PTR [rip+0x1cc0cfd]        # 0x1424f3c08
0x00832f0b: sub    r8,r10
0x00832f0e: sar    r8,0x3
0x00832f12: test   r8,r8
0x00832f15: je     0x140833067
0x00832f1b: cmp    edi,0xffffffff
0x00832f1e: je     0x140833067
0x00832f24: xor    edx,edx
0x00832f26: sub    r8d,0x1
0x00832f2a: js     0x140833067
0x00832f30: lea    ecx,[r8+rdx*1]
0x00832f34: sar    ecx,1
0x00832f36: movsxd rax,ecx
0x00832f39: mov    rbx,QWORD PTR [r10+rax*8]
0x00832f3d: cmp    DWORD PTR [rbx+0xe0],edi
0x00832f43: je     0x140832f5f
0x00832f45: lea    eax,[rcx-0x1]
0x00832f48: cmovle eax,r8d
0x00832f4c: mov    r8d,eax
0x00832f4f: lea    eax,[rcx+0x1]
0x00832f52: cmovle edx,eax
0x00832f55: cmp    edx,r8d
0x00832f58: jle    0x140832f30
0x00832f5a: jmp    0x140833067
0x00832f5f: test   rbx,rbx
0x00832f62: je     0x140833067
0x00832f68: cmp    BYTE PTR [rbx+0xaa],0x0
0x00832f6f: je     0x140833067
0x00832f75: xorps  xmm0,xmm0
0x00832f78: movups XMMWORD PTR [rbp-0x61],xmm0
0x00832f7c: xor    esi,esi
0x00832f7e: mov    QWORD PTR [rbp-0x51],rsi
0x00832f82: mov    r14d,0xf
0x00832f88: mov    QWORD PTR [rbp-0x49],r14
0x00832f8c: mov    BYTE PTR [rbp-0x61],sil
0x00832f90: mov    rax,QWORD PTR [rbx+0x130]
0x00832f97: test   rax,rax
0x00832f9a: je     0x140832fc8
0x00832f9c: mov    rcx,QWORD PTR [rax+0x58]
0x00832fa0: test   rcx,rcx
0x00832fa3: je     0x140832fc8
0x00832fa5: mov    edx,DWORD PTR [rcx+0x30]
0x00832fa8: cmp    edx,0xffffffff
0x00832fab: je     0x140832fc8
0x00832fad: lea    rcx,[rip+0x1caec24]        # 0x1424e1bd8
0x00832fb4: call   0x140072500
0x00832fb9: test   rax,rax
0x00832fbc: je     0x140832fc8
0x00832fbe: mov    rcx,rax
0x00832fc1: call   0x140c37530
0x00832fc6: jmp    0x140832fcc
0x00832fc8: lea    rax,[rbx+0x38]
0x00832fcc: test   rax,rax
0x00832fcf: je     0x140832ff1
0x00832fd1: cmp    BYTE PTR [rax+0x72],0x0
0x00832fd5: je     0x140832ff1
0x00832fd7: xor    r9d,r9d
0x00832fda: mov    r8b,0x1
0x00832fdd: lea    rdx,[rbp-0x61]
0x00832fe1: mov    rcx,rax
0x00832fe4: call   0x140a91760
0x00832fe9: mov    r14,QWORD PTR [rbp-0x49]
0x00832fed: mov    rsi,QWORD PTR [rbp-0x51]
0x00832ff1: lea    rdx,[rbp-0x61]
0x00832ff5: cmp    r14,0xf
0x00832ff9: cmova  rdx,QWORD PTR [rbp-0x61]
0x00832ffe: mov    r8,rsi
0x00833001: lea    rcx,[rbp-0x21]
0x00833005: call   0x14006f9a0
0x0083300a: mov    r8d,0x3
0x00833010: lea    rdx,[rip+0xdb5b41]        # 0x1415e8b58 ; literal="'s "
0x00833017: lea    rcx,[rbp-0x21]
0x0083301b: call   0x14006f9a0
0x00833020: nop
0x00833021: mov    rdx,QWORD PTR [rbp-0x49]
0x00833025: cmp    rdx,0xf
0x00833029: jbe    0x14083305c
0x0083302b: inc    rdx
0x0083302e: mov    rcx,QWORD PTR [rbp-0x61]
0x00833032: mov    rax,rcx
0x00833035: cmp    rdx,0x1000
0x0083303c: jb     0x140833057
0x0083303e: add    rdx,0x27
0x00833042: mov    rcx,QWORD PTR [rcx-0x8]
0x00833046: sub    rax,rcx
0x00833049: add    rax,0xfffffffffffffff8
0x0083304d: cmp    rax,0x1f
0x00833051: ja     0x14083331f
0x00833057: call   0x1415345f0
0x0083305c: lea    r14,[rip+0xf4fa4d]        # 0x141782ab0 ; literal="unknown material"
0x00833063: mov    rsi,QWORD PTR [rbp-0x79]
0x00833067: mov    r8d,edi
0x0083306a: movzx  edx,r15w
0x0083306e: lea    rcx,[rip+0x1b9836b]        # 0x1423cb3e0
0x00833075: call   0x1414a8ce0
0x0083307a: mov    rbx,rax
0x0083307d: test   rax,rax
0x00833080: je     0x1408330e1
0x00833082: cmp    QWORD PTR [rax+0x530],0x0
0x0083308a: je     0x1408330c0
0x0083308c: lea    rdx,[rax+0x520]
0x00833093: mov    r8,QWORD PTR [rdx+0x10]
0x00833097: cmp    QWORD PTR [rdx+0x18],0xf
0x0083309c: jbe    0x1408330a1
0x0083309e: mov    rdx,QWORD PTR [rdx]
0x008330a1: lea    rcx,[rbp-0x21]
0x008330a5: call   0x14006f9a0
0x008330aa: mov    r8d,0x1
0x008330b0: lea    rdx,[rip+0xdb0669]        # 0x1415e3720 ; literal=" "
0x008330b7: lea    rcx,[rbp-0x21]
0x008330bb: call   0x14006f9a0
0x008330c0: mov    rdx,r12
0x008330c3: shl    rdx,0x5
0x008330c7: add    rdx,0x178
0x008330ce: add    rdx,rbx
0x008330d1: mov    r8,QWORD PTR [rdx+0x10]
0x008330d5: cmp    QWORD PTR [rdx+0x18],0xf
0x008330da: jbe    0x1408330ea
0x008330dc: mov    rdx,QWORD PTR [rdx]
0x008330df: jmp    0x1408330ea
0x008330e1: mov    rdx,r14
0x008330e4: mov    r8d,0x10
0x008330ea: lea    rcx,[rbp-0x21]
0x008330ee: call   0x14006f9a0
0x008330f3: lea    rdx,[rbp-0x21]
0x008330f7: cmp    QWORD PTR [rbp-0x9],0xf
0x008330fc: cmova  rdx,QWORD PTR [rbp-0x21]
0x00833101: mov    r8,QWORD PTR [rbp-0x11]
0x00833105: mov    rdi,QWORD PTR [rbp-0x69]
0x00833109: mov    rcx,rdi
0x0083310c: call   0x14006f9a0
0x00833111: mov    r8d,0x1
0x00833117: lea    rdx,[rip+0xdb0602]        # 0x1415e3720 ; literal=" "
0x0083311e: mov    rcx,rdi
0x00833121: call   0x14006f9a0
0x00833126: nop
0x00833127: mov    rdx,QWORD PTR [rbp-0x9]
0x0083312b: cmp    rdx,0xf
0x0083312f: jbe    0x140833162
0x00833131: inc    rdx
0x00833134: mov    rcx,QWORD PTR [rbp-0x21]
0x00833138: mov    rax,rcx
0x0083313b: cmp    rdx,0x1000
0x00833142: jb     0x14083315d
0x00833144: add    rdx,0x27
0x00833148: mov    rcx,QWORD PTR [rcx-0x8]
0x0083314c: sub    rax,rcx
0x0083314f: add    rax,0xfffffffffffffff8
0x00833153: cmp    rax,0x1f
0x00833157: ja     0x140833326
0x0083315d: call   0x1415345f0
0x00833162: mov    rbx,QWORD PTR [rbp-0x71]
0x00833166: sub    rsi,0x1
0x0083316a: mov    QWORD PTR [rbp-0x79],rsi
0x0083316e: jns    0x140832e40
0x00833174: mov    esi,0xdb
0x00833179: mov    r11d,DWORD PTR [rip+0x1caee4c]        # 0x1424e1fcc
0x00833180: cmp    WORD PTR [r13+0x24],0x6
0x00833186: jne    0x14083327e
0x0083318c: movsx  r10,WORD PTR [r13+0x22]
0x00833191: movsx  r9d,WORD PTR [r13+0x20]
0x00833196: movsx  r8d,WORD PTR [r13+0x1e]
0x0083319b: test   r8w,r8w
0x0083319f: js     0x14083327e
0x008331a5: cmp    r8d,r11d
0x008331a8: jge    0x14083327e
0x008331ae: test   r9w,r9w
0x008331b2: js     0x14083327e
0x008331b8: cmp    r9d,DWORD PTR [rip+0x1caee11]        # 0x1424e1fd0
0x008331bf: jge    0x14083327e
0x008331c5: test   r10w,r10w
0x008331c9: js     0x14083327e
0x008331cf: cmp    r10d,DWORD PTR [rip+0x1caedfe]        # 0x1424e1fd4
0x008331d6: jge    0x14083327e
0x008331dc: movzx  eax,r8w
0x008331e0: sar    ax,0x4
0x008331e4: movzx  edx,r9w
0x008331e8: sar    dx,0x4
0x008331ec: mov    rcx,QWORD PTR [rip+0x1caeda5]        # 0x1424e1f98
0x008331f3: test   rcx,rcx
0x008331f6: je     0x14083327e
0x008331fc: movsx  rax,ax
0x00833200: movsx  rdx,dx
0x00833204: mov    rax,QWORD PTR [rcx+rax*8]
0x00833208: mov    rax,QWORD PTR [rax+rdx*8]
0x0083320c: mov    rbx,QWORD PTR [rax+r10*8]
0x00833210: test   rbx,rbx
0x00833213: je     0x14083327e
0x00833215: mov    eax,r8d
0x00833218: and    eax,0x8000000f
0x0083321d: jge    0x140833226
0x0083321f: dec    eax
0x00833221: or     eax,0xfffffff0
0x00833224: inc    eax
0x00833226: movsxd rcx,eax
0x00833229: shl    rcx,0x4
0x0083322d: mov    eax,r9d
0x00833230: and    eax,0x8000000f
0x00833235: jge    0x14083323e
0x00833237: dec    eax
0x00833239: or     eax,0xfffffff0
0x0083323c: inc    eax
0x0083323e: cdqe
0x00833240: add    rcx,rax
0x00833243: mov    ebx,DWORD PTR [rbx+rcx*4+0x2a0]
0x0083324a: bt     ebx,0x1e
0x0083324e: jae    0x140833265
0x00833250: mov    r8d,0x9
0x00833256: lea    rdx,[rip+0xe7831b]        # 0x1416ab578 ; literal="stagnant "
0x0083325d: mov    rcx,rdi
0x00833260: call   0x14006f9a0
0x00833265: test   ebx,ebx
0x00833267: jns    0x14083327e
0x00833269: mov    r8d,0x5
0x0083326f: lea    rdx,[rip+0xe78cee]        # 0x1416abf64 ; literal="salt "
0x00833276: mov    rcx,rdi
0x00833279: call   0x14006f9a0
0x0083327e: xorps  xmm0,xmm0
0x00833281: movups XMMWORD PTR [rbp-0x41],xmm0
0x00833285: mov    QWORD PTR [rbp-0x29],0xf
0x0083328d: movsx  r12,WORD PTR [r13+0x2c]
0x00833292: mov    edi,DWORD PTR [r13+0x28]
0x00833296: movzx  r15d,WORD PTR [r13+0x24]
0x0083329b: mov    QWORD PTR [rbp-0x31],0x0
0x008332a3: mov    BYTE PTR [rbp-0x41],0x0
0x008332a7: movzx  eax,r15w
0x008332ab: sub    ax,si
0x008332ae: mov    ecx,0xc7
0x008332b3: cmp    ax,cx
0x008332b6: ja     0x14083342d
0x008332bc: mov    r8,QWORD PTR [rip+0x1cc094d]        # 0x1424f3c10
0x008332c3: mov    r10,QWORD PTR [rip+0x1cc093e]        # 0x1424f3c08
0x008332ca: sub    r8,r10
0x008332cd: sar    r8,0x3
0x008332d1: test   r8,r8
0x008332d4: je     0x14083342d
0x008332da: cmp    edi,0xffffffff
0x008332dd: je     0x14083342d
0x008332e3: xor    edx,edx
0x008332e5: sub    r8d,0x1
0x008332e9: js     0x14083342d
0x008332ef: nop
0x008332f0: lea    ecx,[r8+rdx*1]
0x008332f4: sar    ecx,1
0x008332f6: movsxd rax,ecx
0x008332f9: mov    rbx,QWORD PTR [r10+rax*8]
0x008332fd: cmp    DWORD PTR [rbx+0xe0],edi
0x00833303: je     0x14083332d
0x00833305: lea    eax,[rcx-0x1]
0x00833308: cmovle eax,r8d
0x0083330c: mov    r8d,eax
0x0083330f: lea    eax,[rcx+0x1]
0x00833312: cmovle edx,eax
0x00833315: cmp    edx,r8d
0x00833318: jle    0x1408332f0
0x0083331a: jmp    0x14083342d
0x0083331f: call   QWORD PTR [rip+0xdad77b]        # 0x1415e0aa0
0x00833325: nop
0x00833326: call   QWORD PTR [rip+0xdad774]        # 0x1415e0aa0
0x0083332c: nop
0x0083332d: test   rbx,rbx
0x00833330: je     0x14083342d
0x00833336: cmp    BYTE PTR [rbx+0xaa],0x0
0x0083333d: je     0x14083342d
0x00833343: xorps  xmm0,xmm0
0x00833346: movups XMMWORD PTR [rbp-0x61],xmm0
0x0083334a: xor    esi,esi
0x0083334c: mov    QWORD PTR [rbp-0x51],rsi
0x00833350: mov    r14d,0xf
0x00833356: mov    QWORD PTR [rbp-0x49],r14
0x0083335a: mov    BYTE PTR [rbp-0x61],sil
0x0083335e: mov    rax,QWORD PTR [rbx+0x130]
0x00833365: test   rax,rax
0x00833368: je     0x140833396
0x0083336a: mov    rdx,QWORD PTR [rax+0x58]
0x0083336e: test   rdx,rdx
0x00833371: je     0x140833396
0x00833373: mov    edx,DWORD PTR [rdx+0x30]
0x00833376: cmp    edx,0xffffffff
0x00833379: je     0x140833396
0x0083337b: lea    rcx,[rip+0x1cae856]        # 0x1424e1bd8
0x00833382: call   0x140072500
0x00833387: test   rax,rax
0x0083338a: je     0x140833396
0x0083338c: mov    rcx,rax
0x0083338f: call   0x140c37530
0x00833394: jmp    0x14083339a
0x00833396: lea    rax,[rbx+0x38]
0x0083339a: test   rax,rax
0x0083339d: je     0x1408333bf
0x0083339f: cmp    BYTE PTR [rax+0x72],0x0
0x008333a3: je     0x1408333bf
0x008333a5: xor    r9d,r9d
0x008333a8: mov    r8b,0x1
0x008333ab: lea    rdx,[rbp-0x61]
0x008333af: mov    rcx,rax
0x008333b2: call   0x140a91760
0x008333b7: mov    r14,QWORD PTR [rbp-0x49]
0x008333bb: mov    rsi,QWORD PTR [rbp-0x51]
0x008333bf: lea    rdx,[rbp-0x61]
0x008333c3: cmp    r14,0xf
0x008333c7: cmova  rdx,QWORD PTR [rbp-0x61]
0x008333cc: mov    r8,rsi
0x008333cf: lea    rcx,[rbp-0x41]
0x008333d3: call   0x14006f9a0
0x008333d8: mov    r8d,0x3
0x008333de: lea    rdx,[rip+0xdb5773]        # 0x1415e8b58 ; literal="'s "
0x008333e5: lea    rcx,[rbp-0x41]
0x008333e9: call   0x14006f9a0
0x008333ee: nop
0x008333ef: mov    rdx,QWORD PTR [rbp-0x49]
0x008333f3: cmp    rdx,0xf
0x008333f7: jbe    0x14083342d
0x008333f9: inc    rdx
0x008333fc: mov    rcx,QWORD PTR [rbp-0x61]
0x00833400: mov    rax,rcx
0x00833403: cmp    rdx,0x1000
0x0083340a: jb     0x140833428
0x0083340c: add    rdx,0x27
0x00833410: mov    rcx,QWORD PTR [rcx-0x8]
0x00833414: sub    rax,rcx
0x00833417: add    rax,0xfffffffffffffff8
0x0083341b: cmp    rax,0x1f
0x0083341f: jbe    0x140833428
0x00833421: call   QWORD PTR [rip+0xdad679]        # 0x1415e0aa0
0x00833427: int3
0x00833428: call   0x1415345f0
0x0083342d: mov    r8d,edi
0x00833430: movzx  edx,r15w
0x00833434: lea    rcx,[rip+0x1b97fa5]        # 0x1423cb3e0
0x0083343b: call   0x1414a8ce0
0x00833440: mov    rbx,rax
0x00833443: test   rax,rax
0x00833446: je     0x1408334a6
0x00833448: cmp    QWORD PTR [rax+0x530],0x0
0x00833450: je     0x140833486
0x00833452: lea    rdx,[rax+0x520]
0x00833459: mov    r8,QWORD PTR [rdx+0x10]
0x0083345d: cmp    QWORD PTR [rdx+0x18],0xf
0x00833462: jbe    0x140833467
0x00833464: mov    rdx,QWORD PTR [rdx]
0x00833467: lea    rcx,[rbp-0x41]
0x0083346b: call   0x14006f9a0
0x00833470: mov    r8d,0x1
0x00833476: lea    rdx,[rip+0xdb02a3]        # 0x1415e3720 ; literal=" "
0x0083347d: lea    rcx,[rbp-0x41]
0x00833481: call   0x14006f9a0
0x00833486: mov    rax,r12
0x00833489: shl    rax,0x5
0x0083348d: add    rax,0xb8
0x00833493: add    rax,rbx
0x00833496: mov    rcx,QWORD PTR [rax+0x10]
0x0083349a: cmp    QWORD PTR [rax+0x18],0xf
0x0083349f: jbe    0x1408334b2
0x008334a1: mov    rax,QWORD PTR [rax]
0x008334a4: jmp    0x1408334b2
0x008334a6: lea    rax,[rip+0xf4f603]        # 0x141782ab0 ; literal="unknown material"
0x008334ad: mov    ecx,0x10
0x008334b2: mov    r8,rcx
0x008334b5: mov    rdx,rax
0x008334b8: lea    rcx,[rbp-0x41]
0x008334bc: call   0x14006f9a0
0x008334c1: lea    rdx,[rbp-0x41]
0x008334c5: cmp    QWORD PTR [rbp-0x29],0xf
0x008334ca: cmova  rdx,QWORD PTR [rbp-0x41]
0x008334cf: mov    r8,QWORD PTR [rbp-0x31]
0x008334d3: mov    rbx,QWORD PTR [rbp-0x69]
0x008334d7: mov    rcx,rbx
0x008334da: call   0x14006f9a0
0x008334df: mov    eax,0xffff8ad0
0x008334e4: cmp    WORD PTR [r13+0x18],ax
0x008334e9: je     0x140833548
0x008334eb: mov    r8d,0x2
0x008334f1: lea    rdx,[rip+0xddcda0]        # 0x141610298 ; literal=" ("
0x008334f8: mov    rcx,rbx
0x008334fb: call   0x14006f9a0
0x00833500: mov    QWORD PTR [rsp+0x30],rbx
0x00833505: movzx  eax,WORD PTR [r13+0x22]
0x0083350a: mov    WORD PTR [rsp+0x28],ax
0x0083350f: movzx  eax,WORD PTR [r13+0x20]
0x00833514: mov    WORD PTR [rsp+0x20],ax
0x00833519: movzx  r9d,WORD PTR [r13+0x1e]
0x0083351e: movzx  r8d,WORD PTR [r13+0x1c]
0x00833523: movzx  edx,WORD PTR [r13+0x1a]
0x00833528: movzx  ecx,WORD PTR [r13+0x18]
0x0083352d: call   0x14074cc40
0x00833532: mov    r8d,0x1
0x00833538: lea    rdx,[rip+0xddcd99]        # 0x1416102d8 ; literal=")"
0x0083353f: mov    rcx,rbx
0x00833542: call   0x14006f9a0
0x00833547: nop
0x00833548: mov    rdx,QWORD PTR [rbp-0x29]
0x0083354c: cmp    rdx,0xf
0x00833550: jbe    0x140833586
0x00833552: inc    rdx
0x00833555: mov    rcx,QWORD PTR [rbp-0x41]
0x00833559: mov    rax,rcx
0x0083355c: cmp    rdx,0x1000
0x00833563: jb     0x140833581
0x00833565: add    rdx,0x27
0x00833569: mov    rcx,QWORD PTR [rcx-0x8]
0x0083356d: sub    rax,rcx
0x00833570: add    rax,0xfffffffffffffff8
0x00833574: cmp    rax,0x1f
0x00833578: jbe    0x140833581
0x0083357a: call   QWORD PTR [rip+0xdad520]        # 0x1415e0aa0
0x00833580: int3
0x00833581: call   0x1415345f0
0x00833586: mov    QWORD PTR [rbp-0x31],0x0
0x0083358e: mov    QWORD PTR [rbp-0x29],0xf
0x00833596: mov    BYTE PTR [rbp-0x41],0x0
0x0083359a: lea    rcx,[rbp-0x1]
0x0083359e: call   0x14006f7e0
0x008335a3: mov    rcx,QWORD PTR [rbp+0x1f]
0x008335a7: xor    rcx,rsp
0x008335aa: call   0x1415345d0
0x008335af: mov    rbx,QWORD PTR [rsp+0x130]
0x008335b7: add    rsp,0xe0
0x008335be: pop    r15
0x008335c0: pop    r14
0x008335c2: pop    r13
0x008335c4: pop    r12
0x008335c6: pop    rdi
0x008335c7: pop    rsi
0x008335c8: pop    rbp
0x008335c9: ret

# classic PE:6a70b91c:0270a000; adventure_item_interact_give_namest+8; RVA 0x8335d0..0x8336b1
0x008335d0: mov    QWORD PTR [rsp+0x18],rbx
0x008335d5: push   rdi
0x008335d6: sub    rsp,0x50
0x008335da: mov    rax,QWORD PTR [rip+0x1062a5f]        # 0x141896040
0x008335e1: xor    rax,rsp
0x008335e4: mov    QWORD PTR [rsp+0x40],rax
0x008335e9: mov    rdi,rdx
0x008335ec: mov    rbx,rcx
0x008335ef: mov    r8d,0x9
0x008335f5: lea    rdx,[rip+0xe7895c]        # 0x1416abf58 ; literal="Name the "
0x008335fc: mov    rcx,rdi
0x008335ff: call   0x14006f860
0x00833604: xorps  xmm0,xmm0
0x00833607: movups XMMWORD PTR [rsp+0x20],xmm0
0x0083360c: mov    QWORD PTR [rsp+0x30],0x0
0x00833615: mov    QWORD PTR [rsp+0x38],0xf
0x0083361e: mov    BYTE PTR [rsp+0x20],0x0
0x00833623: mov    r9d,0xffffffff
0x00833629: xor    r8d,r8d
0x0083362c: lea    rdx,[rsp+0x20]
0x00833631: mov    rcx,QWORD PTR [rbx+0x10]
0x00833635: call   0x140c62490
0x0083363a: lea    rdx,[rsp+0x20]
0x0083363f: cmp    QWORD PTR [rsp+0x38],0xf
0x00833645: cmova  rdx,QWORD PTR [rsp+0x20]
0x0083364b: mov    r8,QWORD PTR [rsp+0x30]
0x00833650: mov    rcx,rdi
0x00833653: call   0x14006f9a0
0x00833658: nop
0x00833659: mov    rdx,QWORD PTR [rsp+0x38]
0x0083365e: cmp    rdx,0xf
0x00833662: jbe    0x140833699
0x00833664: inc    rdx
0x00833667: mov    rcx,QWORD PTR [rsp+0x20]
0x0083366c: mov    rax,rcx
0x0083366f: cmp    rdx,0x1000
0x00833676: jb     0x140833694
0x00833678: add    rdx,0x27
0x0083367c: mov    rcx,QWORD PTR [rcx-0x8]
0x00833680: sub    rax,rcx
0x00833683: add    rax,0xfffffffffffffff8
0x00833687: cmp    rax,0x1f
0x0083368b: jbe    0x140833694
0x0083368d: call   QWORD PTR [rip+0xdad40d]        # 0x1415e0aa0
0x00833693: int3
0x00833694: call   0x1415345f0
0x00833699: mov    rcx,QWORD PTR [rsp+0x40]
0x0083369e: xor    rcx,rsp
0x008336a1: call   0x1415345d0
0x008336a6: mov    rbx,QWORD PTR [rsp+0x70]
0x008336ab: add    rsp,0x50
0x008336af: pop    rdi
0x008336b0: ret

# classic PE:6a70b91c:0270a000; adventure_item_interact_heat_from_tilest+8; RVA 0x8336c0..0x83391c
0x008336c0: mov    QWORD PTR [rsp+0x18],rbx
0x008336c5: mov    QWORD PTR [rsp+0x20],rsi
0x008336ca: push   rdi
0x008336cb: sub    rsp,0x70
0x008336cf: mov    rax,QWORD PTR [rip+0x106296a]        # 0x141896040
0x008336d6: xor    rax,rsp
0x008336d9: mov    QWORD PTR [rsp+0x60],rax
0x008336de: mov    rbx,rdx
0x008336e1: mov    rdi,rcx
0x008336e4: mov    r8d,0x5
0x008336ea: lea    rdx,[rip+0xe7888b]        # 0x1416abf7c ; literal="Heat "
0x008336f1: mov    rcx,rbx
0x008336f4: call   0x14006f860
0x008336f9: xorps  xmm0,xmm0
0x008336fc: movups XMMWORD PTR [rsp+0x40],xmm0
0x00833701: xor    esi,esi
0x00833703: mov    QWORD PTR [rsp+0x50],rsi
0x00833708: mov    QWORD PTR [rsp+0x58],0xf
0x00833711: mov    BYTE PTR [rsp+0x40],sil
0x00833716: mov    r9d,0xffffffff
0x0083371c: xor    r8d,r8d
0x0083371f: lea    rdx,[rsp+0x40]
0x00833724: mov    rcx,QWORD PTR [rdi+0x10]
0x00833728: call   0x140c62490
0x0083372d: lea    rdx,[rsp+0x40]
0x00833732: cmp    QWORD PTR [rsp+0x58],0xf
0x00833738: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083373e: mov    r8,QWORD PTR [rsp+0x50]
0x00833743: mov    rcx,rbx
0x00833746: call   0x14006f9a0
0x0083374b: movzx  r9d,WORD PTR [rdi+0x22]
0x00833750: movzx  r8d,WORD PTR [rdi+0x20]
0x00833755: movzx  edx,WORD PTR [rdi+0x1e]
0x00833759: lea    rcx,[rip+0x1b97c80]        # 0x1423cb3e0
0x00833760: call   0x1402c1650
0x00833765: movzx  r8d,WORD PTR [rdi+0x20]
0x0083376a: movzx  edx,WORD PTR [rdi+0x1e]
0x0083376e: lea    rcx,[rip+0x1b97c6b]        # 0x1423cb3e0
0x00833775: test   al,al
0x00833777: jle    0x1408337a5
0x00833779: call   0x14007dbd0
0x0083377e: bt     eax,0xf
0x00833782: setb   sil
0x00833786: lea    r8,[rsi+0xa]
0x0083378a: lea    rcx,[rip+0xe78787]        # 0x1416abf18 ; literal=" near magma"
0x00833791: lea    rdx,[rip+0xe787d8]        # 0x1416abf70 ; literal=" near lava"
0x00833798: bt     eax,0xf
0x0083379c: cmovb  rdx,rcx
0x008337a0: jmp    0x140833826
0x008337a5: call   0x140067f10
0x008337aa: movzx  r9d,ax
0x008337ae: add    r9d,0xffffffbd
0x008337b2: cmp    r9d,0x9
0x008337b6: ja     0x14083382e
0x008337b8: movsxd rax,r9d
0x008337bb: lea    rdx,[rip+0xffffffffff7cc83e]        # 0x140000000
0x008337c2: mov    ecx,DWORD PTR [rdx+rax*4+0x8338f4]
0x008337c9: add    rcx,rdx
0x008337cc: jmp    rcx
0x008337ce: mov    r8d,0x13
0x008337d4: lea    rdx,[rip+0xe78725]        # 0x1416abf00 ; literal=" near burning trunk"
0x008337db: jmp    0x140833826
0x008337dd: mov    r8d,0x16
0x008337e3: lea    rdx,[rip+0xe78756]        # 0x1416abf40 ; literal=" near burning branches"
0x008337ea: jmp    0x140833826
0x008337ec: mov    r8d,0x13
0x008337f2: lea    rdx,[rip+0xe7872f]        # 0x1416abf28 ; literal=" near burning twigs"
0x008337f9: jmp    0x140833826
0x008337fb: mov    r8d,0x11
0x00833801: lea    rdx,[rip+0xe787d8]        # 0x1416abfe0 ; literal=" near burning cap"
0x00833808: jmp    0x140833826
0x0083380a: mov    r8d,0xa
0x00833810: lea    rdx,[rip+0xe787b9]        # 0x1416abfd0 ; literal=" near fire"
0x00833817: jmp    0x140833826
0x00833819: mov    r8d,0xe
0x0083381f: lea    rdx,[rip+0xe787e2]        # 0x1416ac008 ; literal=" near campfire"
0x00833826: mov    rcx,rbx
0x00833829: call   0x14006f9a0
0x0083382e: mov    eax,0xffff8ad0
0x00833833: cmp    WORD PTR [rdi+0x18],ax
0x00833837: je     0x140833892
0x00833839: mov    r8d,0x2
0x0083383f: lea    rdx,[rip+0xddca52]        # 0x141610298 ; literal=" ("
0x00833846: mov    rcx,rbx
0x00833849: call   0x14006f9a0
0x0083384e: mov    QWORD PTR [rsp+0x30],rbx
0x00833853: movzx  eax,WORD PTR [rdi+0x22]
0x00833857: mov    WORD PTR [rsp+0x28],ax
0x0083385c: movzx  eax,WORD PTR [rdi+0x20]
0x00833860: mov    WORD PTR [rsp+0x20],ax
0x00833865: movzx  r9d,WORD PTR [rdi+0x1e]
0x0083386a: movzx  r8d,WORD PTR [rdi+0x1c]
0x0083386f: movzx  edx,WORD PTR [rdi+0x1a]
0x00833873: movzx  ecx,WORD PTR [rdi+0x18]
0x00833877: call   0x14074cc40
0x0083387c: mov    r8d,0x1
0x00833882: lea    rdx,[rip+0xddca4f]        # 0x1416102d8 ; literal=")"
0x00833889: mov    rcx,rbx
0x0083388c: call   0x14006f9a0
0x00833891: nop
0x00833892: mov    rdx,QWORD PTR [rsp+0x58]
0x00833897: cmp    rdx,0xf
0x0083389b: jbe    0x1408338d2
0x0083389d: inc    rdx
0x008338a0: mov    rcx,QWORD PTR [rsp+0x40]
0x008338a5: mov    rax,rcx
0x008338a8: cmp    rdx,0x1000
0x008338af: jb     0x1408338cd
0x008338b1: add    rdx,0x27
0x008338b5: mov    rcx,QWORD PTR [rcx-0x8]
0x008338b9: sub    rax,rcx
0x008338bc: add    rax,0xfffffffffffffff8
0x008338c0: cmp    rax,0x1f
0x008338c4: jbe    0x1408338cd
0x008338c6: call   QWORD PTR [rip+0xdad1d4]        # 0x1415e0aa0
0x008338cc: int3
0x008338cd: call   0x1415345f0
0x008338d2: mov    rcx,QWORD PTR [rsp+0x60]
0x008338d7: xor    rcx,rsp
0x008338da: call   0x1415345d0
0x008338df: lea    r11,[rsp+0x70]
0x008338e4: mov    rbx,QWORD PTR [r11+0x20]
0x008338e8: mov    rsi,QWORD PTR [r11+0x28]
0x008338ec: mov    rsp,r11
0x008338ef: pop    rdi
0x008338f0: ret
0x008338f1: nop    DWORD PTR [rax]
0x008338f4: sbb    DWORD PTR [rax],edi
0x008338f6: add    DWORD PTR [rax],0x2e
0x008338f9: cmp    BYTE PTR [rbx-0x7cc7d200],al
0x008338ff: add    BYTE PTR [rdx],cl
0x00833901: cmp    BYTE PTR [rbx-0x7cc83200],al
0x00833907: add    ch,bl
0x00833909: (bad)
0x0083390a: add    DWORD PTR [rax],0xffffffec
0x0083390d: (bad)
0x0083390e: add    DWORD PTR [rax],0xfffffffb
0x00833911: (bad)
0x00833912: add    DWORD PTR [rax],0xfffffffb
0x00833915: (bad)
0x00833916: add    DWORD PTR [rax],0xfffffffb
0x00833919: (bad)
0x0083391a: .byte 0x83

# classic PE:6a70b91c:0270a000; adventure_environment_place_on_pack_animalst+8; RVA 0x835720..0x835861
0x00835720: mov    QWORD PTR [rsp+0x18],rbx
0x00835725: push   rdi
0x00835726: sub    rsp,0x70
0x0083572a: mov    rax,QWORD PTR [rip+0x106090f]        # 0x141896040
0x00835731: xor    rax,rsp
0x00835734: mov    QWORD PTR [rsp+0x60],rax
0x00835739: mov    rdi,rdx
0x0083573c: mov    rbx,rcx
0x0083573f: mov    r8d,0x7
0x00835745: lea    rdx,[rip+0xe7672c]        # 0x1416abe78 ; literal="Put on "
0x0083574c: mov    rcx,rdi
0x0083574f: call   0x14006f860
0x00835754: xorps  xmm0,xmm0
0x00835757: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083575c: mov    QWORD PTR [rsp+0x50],0x0
0x00835765: mov    QWORD PTR [rsp+0x58],0xf
0x0083576e: mov    BYTE PTR [rsp+0x40],0x0
0x00835773: xor    r8d,r8d
0x00835776: lea    rdx,[rsp+0x40]
0x0083577b: mov    rcx,QWORD PTR [rbx+0x28]
0x0083577f: call   0x14132bba0
0x00835784: lea    rdx,[rsp+0x40]
0x00835789: cmp    QWORD PTR [rsp+0x58],0xf
0x0083578f: cmova  rdx,QWORD PTR [rsp+0x40]
0x00835795: mov    r8,QWORD PTR [rsp+0x50]
0x0083579a: mov    rcx,rdi
0x0083579d: call   0x14006f9a0
0x008357a2: mov    eax,0xffff8ad0
0x008357a7: cmp    WORD PTR [rbx+0x16],ax
0x008357ab: je     0x140835806
0x008357ad: mov    r8d,0x2
0x008357b3: lea    rdx,[rip+0xddaade]        # 0x141610298 ; literal=" ("
0x008357ba: mov    rcx,rdi
0x008357bd: call   0x14006f9a0
0x008357c2: mov    QWORD PTR [rsp+0x30],rdi
0x008357c7: movzx  eax,WORD PTR [rbx+0x14]
0x008357cb: mov    WORD PTR [rsp+0x28],ax
0x008357d0: movzx  eax,WORD PTR [rbx+0x12]
0x008357d4: mov    WORD PTR [rsp+0x20],ax
0x008357d9: movzx  r9d,WORD PTR [rbx+0x10]
0x008357de: movzx  r8d,WORD PTR [rbx+0x1a]
0x008357e3: movzx  edx,WORD PTR [rbx+0x18]
0x008357e7: movzx  ecx,WORD PTR [rbx+0x16]
0x008357eb: call   0x14074cc40
0x008357f0: mov    r8d,0x1
0x008357f6: lea    rdx,[rip+0xddaadb]        # 0x1416102d8 ; literal=")"
0x008357fd: mov    rcx,rdi
0x00835800: call   0x14006f9a0
0x00835805: nop
0x00835806: mov    rdx,QWORD PTR [rsp+0x58]
0x0083580b: cmp    rdx,0xf
0x0083580f: jbe    0x140835846
0x00835811: inc    rdx
0x00835814: mov    rcx,QWORD PTR [rsp+0x40]
0x00835819: mov    rax,rcx
0x0083581c: cmp    rdx,0x1000
0x00835823: jb     0x140835841
0x00835825: add    rdx,0x27
0x00835829: mov    rcx,QWORD PTR [rcx-0x8]
0x0083582d: sub    rax,rcx
0x00835830: add    rax,0xfffffffffffffff8
0x00835834: cmp    rax,0x1f
0x00835838: jbe    0x140835841
0x0083583a: call   QWORD PTR [rip+0xdab260]        # 0x1415e0aa0
0x00835840: int3
0x00835841: call   0x1415345f0
0x00835846: mov    rcx,QWORD PTR [rsp+0x60]
0x0083584b: xor    rcx,rsp
0x0083584e: call   0x1415345d0
0x00835853: mov    rbx,QWORD PTR [rsp+0x90]
0x0083585b: add    rsp,0x70
0x0083585f: pop    rdi
0x00835860: ret

# classic PE:6a70b91c:0270a000; adventure_environment_place_in_bld_containerst+8; RVA 0x835870..0x835a1b
0x00835870: mov    QWORD PTR [rsp+0x18],rbx
0x00835875: push   rdi
0x00835876: sub    rsp,0x70
0x0083587a: mov    rax,QWORD PTR [rip+0x10607bf]        # 0x141896040
0x00835881: xor    rax,rsp
0x00835884: mov    QWORD PTR [rsp+0x60],rax
0x00835889: mov    rbx,rdx
0x0083588c: mov    rdi,rcx
0x0083588f: mov    rcx,QWORD PTR [rcx+0x28]
0x00835893: mov    rax,QWORD PTR [rcx]
0x00835896: call   QWORD PTR [rax+0xd0]
0x0083589c: mov    rcx,rbx
0x0083589f: cmp    eax,0x35
0x008358a2: jne    0x1408358b8
0x008358a4: mov    r8d,0x6
0x008358aa: lea    rdx,[rip+0xe7658f]        # 0x1416abe40 ; literal="Set on"
0x008358b1: call   0x14006f860
0x008358b6: jmp    0x1408358f8
0x008358b8: mov    r8d,0x4
0x008358be: lea    rdx,[rip+0xe76573]        # 0x1416abe38 ; literal="Put "
0x008358c5: call   0x14006f860
0x008358ca: mov    rcx,QWORD PTR [rdi+0x28]
0x008358ce: mov    rax,QWORD PTR [rcx]
0x008358d1: call   QWORD PTR [rax+0xd0]
0x008358d7: mov    r8d,0x2
0x008358dd: mov    rcx,rbx
0x008358e0: cmp    eax,r8d
0x008358e3: lea    rdx,[rip+0xe0784e]        # 0x14163d138 ; literal="in"
0x008358ea: jne    0x1408358f3
0x008358ec: lea    rdx,[rip+0xe7655d]        # 0x1416abe50 ; literal="on"
0x008358f3: call   0x14006f9a0
0x008358f8: mov    r8d,0x1
0x008358fe: lea    rdx,[rip+0xdade1b]        # 0x1415e3720 ; literal=" "
0x00835905: mov    rcx,rbx
0x00835908: call   0x14006f9a0
0x0083590d: xorps  xmm0,xmm0
0x00835910: movups XMMWORD PTR [rsp+0x40],xmm0
0x00835915: mov    QWORD PTR [rsp+0x50],0x0
0x0083591e: mov    QWORD PTR [rsp+0x58],0xf
0x00835927: mov    BYTE PTR [rsp+0x40],0x0
0x0083592c: mov    rcx,QWORD PTR [rdi+0x28]
0x00835930: mov    rax,QWORD PTR [rcx]
0x00835933: lea    rdx,[rsp+0x40]
0x00835938: call   QWORD PTR [rax+0x188]
0x0083593e: lea    rdx,[rsp+0x40]
0x00835943: cmp    QWORD PTR [rsp+0x58],0xf
0x00835949: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083594f: mov    r8,QWORD PTR [rsp+0x50]
0x00835954: mov    rcx,rbx
0x00835957: call   0x14006f9a0
0x0083595c: mov    eax,0xffff8ad0
0x00835961: cmp    WORD PTR [rdi+0x16],ax
0x00835965: je     0x1408359c0
0x00835967: mov    r8d,0x2
0x0083596d: lea    rdx,[rip+0xdda924]        # 0x141610298 ; literal=" ("
0x00835974: mov    rcx,rbx
0x00835977: call   0x14006f9a0
0x0083597c: mov    QWORD PTR [rsp+0x30],rbx
0x00835981: movzx  eax,WORD PTR [rdi+0x14]
0x00835985: mov    WORD PTR [rsp+0x28],ax
0x0083598a: movzx  eax,WORD PTR [rdi+0x12]
0x0083598e: mov    WORD PTR [rsp+0x20],ax
0x00835993: movzx  r9d,WORD PTR [rdi+0x10]
0x00835998: movzx  r8d,WORD PTR [rdi+0x1a]
0x0083599d: movzx  edx,WORD PTR [rdi+0x18]
0x008359a1: movzx  ecx,WORD PTR [rdi+0x16]
0x008359a5: call   0x14074cc40
0x008359aa: mov    r8d,0x1
0x008359b0: lea    rdx,[rip+0xdda921]        # 0x1416102d8 ; literal=")"
0x008359b7: mov    rcx,rbx
0x008359ba: call   0x14006f9a0
0x008359bf: nop
0x008359c0: mov    rdx,QWORD PTR [rsp+0x58]
0x008359c5: cmp    rdx,0xf
0x008359c9: jbe    0x140835a00
0x008359cb: inc    rdx
0x008359ce: mov    rcx,QWORD PTR [rsp+0x40]
0x008359d3: mov    rax,rcx
0x008359d6: cmp    rdx,0x1000
0x008359dd: jb     0x1408359fb
0x008359df: add    rdx,0x27
0x008359e3: mov    rcx,QWORD PTR [rcx-0x8]
0x008359e7: sub    rax,rcx
0x008359ea: add    rax,0xfffffffffffffff8
0x008359ee: cmp    rax,0x1f
0x008359f2: jbe    0x1408359fb
0x008359f4: call   QWORD PTR [rip+0xdab0a6]        # 0x1415e0aa0
0x008359fa: int3
0x008359fb: call   0x1415345f0
0x00835a00: mov    rcx,QWORD PTR [rsp+0x60]
0x00835a05: xor    rcx,rsp
0x00835a08: call   0x1415345d0
0x00835a0d: mov    rbx,QWORD PTR [rsp+0x90]
0x00835a15: add    rsp,0x70
0x00835a19: pop    rdi
0x00835a1a: ret

# classic PE:6a70b91c:0270a000; adventure_environment_place_in_it_containerst+8; RVA 0x835a20..0x835b67
0x00835a20: mov    QWORD PTR [rsp+0x18],rbx
0x00835a25: push   rdi
0x00835a26: sub    rsp,0x70
0x00835a2a: mov    rax,QWORD PTR [rip+0x106060f]        # 0x141896040
0x00835a31: xor    rax,rsp
0x00835a34: mov    QWORD PTR [rsp+0x60],rax
0x00835a39: mov    rdi,rdx
0x00835a3c: mov    rbx,rcx
0x00835a3f: mov    r8d,0x7
0x00835a45: lea    rdx,[rip+0xe763fc]        # 0x1416abe48 ; literal="Put in "
0x00835a4c: mov    rcx,rdi
0x00835a4f: call   0x14006f860
0x00835a54: xorps  xmm0,xmm0
0x00835a57: movups XMMWORD PTR [rsp+0x40],xmm0
0x00835a5c: mov    QWORD PTR [rsp+0x50],0x0
0x00835a65: mov    QWORD PTR [rsp+0x58],0xf
0x00835a6e: mov    BYTE PTR [rsp+0x40],0x0
0x00835a73: mov    r9d,0xffffffff
0x00835a79: xor    r8d,r8d
0x00835a7c: lea    rdx,[rsp+0x40]
0x00835a81: mov    rcx,QWORD PTR [rbx+0x28]
0x00835a85: call   0x140c62490
0x00835a8a: lea    rdx,[rsp+0x40]
0x00835a8f: cmp    QWORD PTR [rsp+0x58],0xf
0x00835a95: cmova  rdx,QWORD PTR [rsp+0x40]
0x00835a9b: mov    r8,QWORD PTR [rsp+0x50]
0x00835aa0: mov    rcx,rdi
0x00835aa3: call   0x14006f9a0
0x00835aa8: mov    eax,0xffff8ad0
0x00835aad: cmp    WORD PTR [rbx+0x16],ax
0x00835ab1: je     0x140835b0c
0x00835ab3: mov    r8d,0x2
0x00835ab9: lea    rdx,[rip+0xdda7d8]        # 0x141610298 ; literal=" ("
0x00835ac0: mov    rcx,rdi
0x00835ac3: call   0x14006f9a0
0x00835ac8: mov    QWORD PTR [rsp+0x30],rdi
0x00835acd: movzx  eax,WORD PTR [rbx+0x14]
0x00835ad1: mov    WORD PTR [rsp+0x28],ax
0x00835ad6: movzx  eax,WORD PTR [rbx+0x12]
0x00835ada: mov    WORD PTR [rsp+0x20],ax
0x00835adf: movzx  r9d,WORD PTR [rbx+0x10]
0x00835ae4: movzx  r8d,WORD PTR [rbx+0x1a]
0x00835ae9: movzx  edx,WORD PTR [rbx+0x18]
0x00835aed: movzx  ecx,WORD PTR [rbx+0x16]
0x00835af1: call   0x14074cc40
0x00835af6: mov    r8d,0x1
0x00835afc: lea    rdx,[rip+0xdda7d5]        # 0x1416102d8 ; literal=")"
0x00835b03: mov    rcx,rdi
0x00835b06: call   0x14006f9a0
0x00835b0b: nop
0x00835b0c: mov    rdx,QWORD PTR [rsp+0x58]
0x00835b11: cmp    rdx,0xf
0x00835b15: jbe    0x140835b4c
0x00835b17: inc    rdx
0x00835b1a: mov    rcx,QWORD PTR [rsp+0x40]
0x00835b1f: mov    rax,rcx
0x00835b22: cmp    rdx,0x1000
0x00835b29: jb     0x140835b47
0x00835b2b: add    rdx,0x27
0x00835b2f: mov    rcx,QWORD PTR [rcx-0x8]
0x00835b33: sub    rax,rcx
0x00835b36: add    rax,0xfffffffffffffff8
0x00835b3a: cmp    rax,0x1f
0x00835b3e: jbe    0x140835b47
0x00835b40: call   QWORD PTR [rip+0xdaaf5a]        # 0x1415e0aa0
0x00835b46: int3
0x00835b47: call   0x1415345f0
0x00835b4c: mov    rcx,QWORD PTR [rsp+0x60]
0x00835b51: xor    rcx,rsp
0x00835b54: call   0x1415345d0
0x00835b59: mov    rbx,QWORD PTR [rsp+0x90]
0x00835b61: add    rsp,0x70
0x00835b65: pop    rdi
0x00835b66: ret

# classic PE:6a70b91c:0270a000; adventure_environment_unit_suck_bloodst+8; RVA 0x835b70..0x836044
0x00835b70: mov    QWORD PTR [rsp+0x8],rbx
0x00835b75: mov    QWORD PTR [rsp+0x18],rsi
0x00835b7a: mov    QWORD PTR [rsp+0x20],rdi
0x00835b7f: push   rbp
0x00835b80: push   r12
0x00835b82: push   r13
0x00835b84: push   r14
0x00835b86: push   r15
0x00835b88: lea    rbp,[rsp-0x37]
0x00835b8d: sub    rsp,0x90
0x00835b94: mov    rax,QWORD PTR [rip+0x10604a5]        # 0x141896040
0x00835b9b: xor    rax,rsp
0x00835b9e: mov    QWORD PTR [rbp+0x2f],rax
0x00835ba2: mov    r13,rdx
0x00835ba5: mov    r10d,DWORD PTR [rcx+0x20]
0x00835ba9: mov    r8,QWORD PTR [rip+0x1ba93f8]        # 0x1423defa8
0x00835bb0: mov    r11,QWORD PTR [rip+0x1ba93e9]        # 0x1423defa0
0x00835bb7: sub    r8,r11
0x00835bba: sar    r8,0x3
0x00835bbe: test   r8d,r8d
0x00835bc1: je     0x140836017
0x00835bc7: cmp    r10d,0xffffffff
0x00835bcb: je     0x140836017
0x00835bd1: xor    r14d,r14d
0x00835bd4: mov    edx,r14d
0x00835bd7: sub    r8d,0x1
0x00835bdb: js     0x140835c0a
0x00835bdd: nop    DWORD PTR [rax]
0x00835be0: lea    ecx,[rdx+r8*1]
0x00835be4: sar    ecx,1
0x00835be6: movsxd rax,ecx
0x00835be9: mov    rbx,QWORD PTR [r11+rax*8]
0x00835bed: cmp    DWORD PTR [rbx+0x130],r10d
0x00835bf4: je     0x140835c0d
0x00835bf6: lea    eax,[rcx+0x1]
0x00835bf9: cmovle edx,eax
0x00835bfc: lea    eax,[rcx-0x1]
0x00835bff: cmovle eax,r8d
0x00835c03: mov    r8d,eax
0x00835c06: cmp    edx,eax
0x00835c08: jle    0x140835be0
0x00835c0a: mov    rbx,r14
0x00835c0d: test   rbx,rbx
0x00835c10: je     0x140836017
0x00835c16: mov    r8d,0x5
0x00835c1c: lea    rdx,[rip+0xe762c1]        # 0x1416abee4 ; literal="Suck "
0x00835c23: mov    rcx,r13
0x00835c26: call   0x14006f860
0x00835c2b: xorps  xmm0,xmm0
0x00835c2e: movups XMMWORD PTR [rbp+0xf],xmm0
0x00835c32: mov    QWORD PTR [rbp+0x1f],r14
0x00835c36: mov    QWORD PTR [rbp+0x27],0xf
0x00835c3e: mov    BYTE PTR [rbp+0xf],r14b
0x00835c42: xor    r8d,r8d
0x00835c45: lea    rdx,[rbp+0xf]
0x00835c49: mov    rcx,rbx
0x00835c4c: call   0x14132bba0
0x00835c51: lea    rdx,[rbp+0xf]
0x00835c55: cmp    QWORD PTR [rbp+0x27],0xf
0x00835c5a: cmova  rdx,QWORD PTR [rbp+0xf]
0x00835c5f: mov    r8,QWORD PTR [rbp+0x1f]
0x00835c63: mov    rcx,r13
0x00835c66: call   0x14006f9a0
0x00835c6b: mov    r8d,0x3
0x00835c71: lea    rdx,[rip+0xdb2ee0]        # 0x1415e8b58 ; literal="'s "
0x00835c78: mov    rcx,r13
0x00835c7b: call   0x14006f9a0
0x00835c80: xorps  xmm0,xmm0
0x00835c83: movups XMMWORD PTR [rbp-0x31],xmm0
0x00835c87: mov    QWORD PTR [rbp-0x21],r14
0x00835c8b: mov    QWORD PTR [rbp-0x19],0xf
0x00835c93: mov    BYTE PTR [rbp-0x31],0x0
0x00835c97: movsx  r8,WORD PTR [rbx+0x12c]
0x00835c9f: movsx  rax,WORD PTR [rbx+0xa4]
0x00835ca7: test   ax,ax
0x00835caa: js     0x140835d0d
0x00835cac: mov    rcx,QWORD PTR [rip+0x1cb0ca5]        # 0x1424e6958
0x00835cb3: mov    rdx,rax
0x00835cb6: mov    rax,QWORD PTR [rip+0x1cb0ca3]        # 0x1424e6960
0x00835cbd: sub    rax,rcx
0x00835cc0: sar    rax,0x3
0x00835cc4: cmp    rdx,rax
0x00835cc7: jae    0x140835d0d
0x00835cc9: test   r8w,r8w
0x00835ccd: js     0x140835d0d
0x00835ccf: mov    rax,QWORD PTR [rcx+rdx*8]
0x00835cd3: mov    rcx,QWORD PTR [rax+0x178]
0x00835cda: mov    rax,QWORD PTR [rax+0x180]
0x00835ce1: sub    rax,rcx
0x00835ce4: sar    rax,0x3
0x00835ce8: cmp    r8,rax
0x00835ceb: jae    0x140835d0d
0x00835ced: mov    rax,QWORD PTR [rcx+r8*8]
0x00835cf1: test   rax,rax
0x00835cf4: je     0x140835d0d
0x00835cf6: movzx  esi,WORD PTR [rax+0x3c76]
0x00835cfd: mov    edi,DWORD PTR [rax+0x3c78]
0x00835d03: movzx  r12d,WORD PTR [rax+0x3c74]
0x00835d0b: jmp    0x140835d1a
0x00835d0d: mov    esi,0xffffffff
0x00835d12: movzx  r12d,WORD PTR [rbp-0x39]
0x00835d17: mov    edi,DWORD PTR [rbp-0x39]
0x00835d1a: mov    edx,DWORD PTR [rbx+0xa4]
0x00835d20: mov    r8d,0xc7
0x00835d26: cmp    edx,DWORD PTR [rbx+0xd90]
0x00835d2c: jne    0x140835d50
0x00835d2e: mov    ecx,DWORD PTR [rbx+0xc30]
0x00835d34: cmp    ecx,0xffffffff
0x00835d37: je     0x140835d50
0x00835d39: lea    eax,[rsi-0x13]
0x00835d3c: cmp    ax,r8w
0x00835d40: ja     0x140835d50
0x00835d42: cmp    edi,edx
0x00835d44: jne    0x140835d50
0x00835d46: mov    eax,0xc8
0x00835d4b: add    si,ax
0x00835d4e: mov    edi,ecx
0x00835d50: cmp    si,0xffff
0x00835d54: je     0x140835f70
0x00835d5a: mov    QWORD PTR [rbp-0x21],r14
0x00835d5e: mov    BYTE PTR [rbp-0x31],0x0
0x00835d62: mov    ecx,0xdb
0x00835d67: movzx  eax,si
0x00835d6a: sub    ax,cx
0x00835d6d: cmp    ax,r8w
0x00835d71: ja     0x140835ee0
0x00835d77: mov    r8,QWORD PTR [rip+0x1cbde92]        # 0x1424f3c10
0x00835d7e: mov    r10,QWORD PTR [rip+0x1cbde83]        # 0x1424f3c08
0x00835d85: sub    r8,r10
0x00835d88: sar    r8,0x3
0x00835d8c: test   r8,r8
0x00835d8f: je     0x140835ee0
0x00835d95: cmp    edi,0xffffffff
0x00835d98: je     0x140835ee0
0x00835d9e: mov    edx,r14d
0x00835da1: sub    r8d,0x1
0x00835da5: js     0x140835ee0
0x00835dab: nop    DWORD PTR [rax+rax*1+0x0]
0x00835db0: lea    ecx,[r8+rdx*1]
0x00835db4: sar    ecx,1
0x00835db6: movsxd rax,ecx
0x00835db9: mov    rbx,QWORD PTR [r10+rax*8]
0x00835dbd: cmp    DWORD PTR [rbx+0xe0],edi
0x00835dc3: je     0x140835ddf
0x00835dc5: lea    eax,[rcx-0x1]
0x00835dc8: cmovle eax,r8d
0x00835dcc: mov    r8d,eax
0x00835dcf: lea    eax,[rcx+0x1]
0x00835dd2: cmovle edx,eax
0x00835dd5: cmp    edx,r8d
0x00835dd8: jle    0x140835db0
0x00835dda: jmp    0x140835ee0
0x00835ddf: test   rbx,rbx
0x00835de2: je     0x140835ee0
0x00835de8: cmp    BYTE PTR [rbx+0xaa],0x0
0x00835def: je     0x140835ee0
0x00835df5: xorps  xmm0,xmm0
0x00835df8: movups XMMWORD PTR [rbp-0x11],xmm0
0x00835dfc: mov    QWORD PTR [rbp-0x1],r14
0x00835e00: mov    r15d,0xf
0x00835e06: mov    QWORD PTR [rbp+0x7],r15
0x00835e0a: mov    BYTE PTR [rbp-0x11],0x0
0x00835e0e: mov    rax,QWORD PTR [rbx+0x130]
0x00835e15: test   rax,rax
0x00835e18: je     0x140835e46
0x00835e1a: mov    rcx,QWORD PTR [rax+0x58]
0x00835e1e: test   rcx,rcx
0x00835e21: je     0x140835e46
0x00835e23: mov    edx,DWORD PTR [rcx+0x30]
0x00835e26: cmp    edx,0xffffffff
0x00835e29: je     0x140835e46
0x00835e2b: lea    rcx,[rip+0x1cabda6]        # 0x1424e1bd8
0x00835e32: call   0x140072500
0x00835e37: test   rax,rax
0x00835e3a: je     0x140835e46
0x00835e3c: mov    rcx,rax
0x00835e3f: call   0x140c37530
0x00835e44: jmp    0x140835e4a
0x00835e46: lea    rax,[rbx+0x38]
0x00835e4a: test   rax,rax
0x00835e4d: je     0x140835e6f
0x00835e4f: cmp    BYTE PTR [rax+0x72],0x0
0x00835e53: je     0x140835e6f
0x00835e55: xor    r9d,r9d
0x00835e58: mov    r8b,0x1
0x00835e5b: lea    rdx,[rbp-0x11]
0x00835e5f: mov    rcx,rax
0x00835e62: call   0x140a91760
0x00835e67: mov    r15,QWORD PTR [rbp+0x7]
0x00835e6b: mov    r14,QWORD PTR [rbp-0x1]
0x00835e6f: lea    rdx,[rbp-0x11]
0x00835e73: cmp    r15,0xf
0x00835e77: cmova  rdx,QWORD PTR [rbp-0x11]
0x00835e7c: mov    r8,r14
0x00835e7f: lea    rcx,[rbp-0x31]
0x00835e83: call   0x14006f9a0
0x00835e88: mov    r8d,0x3
0x00835e8e: lea    rdx,[rip+0xdb2cc3]        # 0x1415e8b58 ; literal="'s "
0x00835e95: lea    rcx,[rbp-0x31]
0x00835e99: call   0x14006f9a0
0x00835e9e: nop
0x00835e9f: mov    rdx,QWORD PTR [rbp+0x7]
0x00835ea3: cmp    rdx,0xf
0x00835ea7: jbe    0x140835edd
0x00835ea9: inc    rdx
0x00835eac: mov    rcx,QWORD PTR [rbp-0x11]
0x00835eb0: mov    rax,rcx
0x00835eb3: cmp    rdx,0x1000
0x00835eba: jb     0x140835ed8
0x00835ebc: add    rdx,0x27
0x00835ec0: mov    rcx,QWORD PTR [rcx-0x8]
0x00835ec4: sub    rax,rcx
0x00835ec7: add    rax,0xfffffffffffffff8
0x00835ecb: cmp    rax,0x1f
0x00835ecf: jbe    0x140835ed8
0x00835ed1: call   QWORD PTR [rip+0xdaabc9]        # 0x1415e0aa0
0x00835ed7: int3
0x00835ed8: call   0x1415345f0
0x00835edd: xor    r14d,r14d
0x00835ee0: mov    r8d,edi
0x00835ee3: movzx  edx,si
0x00835ee6: lea    rcx,[rip+0x1b954f3]        # 0x1423cb3e0
0x00835eed: call   0x1414a8ce0
0x00835ef2: mov    rbx,rax
0x00835ef5: test   rax,rax
0x00835ef8: je     0x140835f5a
0x00835efa: cmp    QWORD PTR [rax+0x530],0x0
0x00835f02: je     0x140835f38
0x00835f04: lea    rdx,[rax+0x520]
0x00835f0b: mov    r8,QWORD PTR [rdx+0x10]
0x00835f0f: cmp    QWORD PTR [rdx+0x18],0xf
0x00835f14: jbe    0x140835f19
0x00835f16: mov    rdx,QWORD PTR [rdx]
0x00835f19: lea    rcx,[rbp-0x31]
0x00835f1d: call   0x14006f9a0
0x00835f22: mov    r8d,0x1
0x00835f28: lea    rdx,[rip+0xdad7f1]        # 0x1415e3720 ; literal=" "
0x00835f2f: lea    rcx,[rbp-0x31]
0x00835f33: call   0x14006f9a0
0x00835f38: movsx  rdx,r12w
0x00835f3c: shl    rdx,0x5
0x00835f40: add    rdx,0xb8
0x00835f47: add    rdx,rbx
0x00835f4a: mov    r8,QWORD PTR [rdx+0x10]
0x00835f4e: cmp    QWORD PTR [rdx+0x18],0xf
0x00835f53: jbe    0x140835f67
0x00835f55: mov    rdx,QWORD PTR [rdx]
0x00835f58: jmp    0x140835f67
0x00835f5a: mov    r8d,0x10
0x00835f60: lea    rdx,[rip+0xf4cb49]        # 0x141782ab0 ; literal="unknown material"
0x00835f67: lea    rcx,[rbp-0x31]
0x00835f6b: call   0x14006f9a0
0x00835f70: lea    rdx,[rbp-0x31]
0x00835f74: cmp    QWORD PTR [rbp-0x19],0xf
0x00835f79: cmova  rdx,QWORD PTR [rbp-0x31]
0x00835f7e: mov    r8,QWORD PTR [rbp-0x21]
0x00835f82: mov    rcx,r13
0x00835f85: call   0x14006f9a0
0x00835f8a: nop
0x00835f8b: mov    rdx,QWORD PTR [rbp-0x19]
0x00835f8f: cmp    rdx,0xf
0x00835f93: jbe    0x140835fc9
0x00835f95: inc    rdx
0x00835f98: mov    rcx,QWORD PTR [rbp-0x31]
0x00835f9c: mov    rax,rcx
0x00835f9f: cmp    rdx,0x1000
0x00835fa6: jb     0x140835fc4
0x00835fa8: add    rdx,0x27
0x00835fac: mov    rcx,QWORD PTR [rcx-0x8]
0x00835fb0: sub    rax,rcx
0x00835fb3: add    rax,0xfffffffffffffff8
0x00835fb7: cmp    rax,0x1f
0x00835fbb: jbe    0x140835fc4
0x00835fbd: call   QWORD PTR [rip+0xdaaadd]        # 0x1415e0aa0
0x00835fc3: int3
0x00835fc4: call   0x1415345f0
0x00835fc9: mov    QWORD PTR [rbp-0x21],r14
0x00835fcd: mov    QWORD PTR [rbp-0x19],0xf
0x00835fd5: mov    BYTE PTR [rbp-0x31],0x0
0x00835fd9: mov    rdx,QWORD PTR [rbp+0x27]
0x00835fdd: cmp    rdx,0xf
0x00835fe1: jbe    0x140836017
0x00835fe3: inc    rdx
0x00835fe6: mov    rcx,QWORD PTR [rbp+0xf]
0x00835fea: mov    rax,rcx
0x00835fed: cmp    rdx,0x1000
0x00835ff4: jb     0x140836012
0x00835ff6: add    rdx,0x27
0x00835ffa: mov    rcx,QWORD PTR [rcx-0x8]
0x00835ffe: sub    rax,rcx
0x00836001: add    rax,0xfffffffffffffff8
0x00836005: cmp    rax,0x1f
0x00836009: jbe    0x140836012
0x0083600b: call   QWORD PTR [rip+0xdaaa8f]        # 0x1415e0aa0
0x00836011: int3
0x00836012: call   0x1415345f0
0x00836017: mov    rcx,QWORD PTR [rbp+0x2f]
0x0083601b: xor    rcx,rsp
0x0083601e: call   0x1415345d0
0x00836023: lea    r11,[rsp+0x90]
0x0083602b: mov    rbx,QWORD PTR [r11+0x30]
0x0083602f: mov    rsi,QWORD PTR [r11+0x40]
0x00836033: mov    rdi,QWORD PTR [r11+0x48]
0x00836037: mov    rsp,r11
0x0083603a: pop    r15
0x0083603c: pop    r14
0x0083603e: pop    r13
0x00836040: pop    r12
0x00836042: pop    rbp
0x00836043: ret

# classic PE:6a70b91c:0270a000; adventure_environment_ingest_from_containerst+8; RVA 0x836050..0x836270
0x00836050: mov    QWORD PTR [rsp+0x18],rbx
0x00836055: mov    QWORD PTR [rsp+0x20],rdi
0x0083605a: push   rbp
0x0083605b: lea    rbp,[rsp-0x57]
0x00836060: sub    rsp,0x90
0x00836067: mov    rax,QWORD PTR [rip+0x105ffd2]        # 0x141896040
0x0083606e: xor    rax,rsp
0x00836071: mov    QWORD PTR [rbp+0x47],rax
0x00836075: mov    rdi,rdx
0x00836078: mov    rbx,rcx
0x0083607b: xorps  xmm0,xmm0
0x0083607e: movups XMMWORD PTR [rbp+0x27],xmm0
0x00836082: mov    QWORD PTR [rbp+0x37],0x0
0x0083608a: mov    QWORD PTR [rbp+0x3f],0xf
0x00836092: mov    BYTE PTR [rbp+0x27],0x0
0x00836096: movups XMMWORD PTR [rbp+0x7],xmm0
0x0083609a: mov    QWORD PTR [rbp+0x17],0x0
0x008360a2: mov    QWORD PTR [rbp+0x1f],0xf
0x008360aa: mov    BYTE PTR [rbp+0x7],0x0
0x008360ae: mov    r9d,0xffffffff
0x008360b4: xor    r8d,r8d
0x008360b7: lea    rdx,[rbp+0x27]
0x008360bb: mov    rcx,QWORD PTR [rcx+0x28]
0x008360bf: call   0x140c62490
0x008360c4: mov    r9d,0xffffffff
0x008360ca: xor    r8d,r8d
0x008360cd: lea    rdx,[rbp+0x7]
0x008360d1: mov    rcx,QWORD PTR [rbx+0x20]
0x008360d5: call   0x140c62490
0x008360da: mov    rcx,QWORD PTR [rbx+0x28]
0x008360de: mov    rax,QWORD PTR [rcx]
0x008360e1: call   QWORD PTR [rax+0x2b0]
0x008360e7: mov    ecx,0x4
0x008360ec: mov    r8d,0x6
0x008360f2: test   al,al
0x008360f4: cmove  r8d,ecx
0x008360f8: lea    rcx,[rip+0xe75df9]        # 0x1416abef8 ; literal="Eat "
0x008360ff: lea    rdx,[rip+0xe75dd6]        # 0x1416abedc ; literal="Drink "
0x00836106: cmove  rdx,rcx
0x0083610a: mov    rcx,rdi
0x0083610d: call   0x14006f860
0x00836112: lea    rdx,[rbp+0x27]
0x00836116: cmp    QWORD PTR [rbp+0x3f],0xf
0x0083611b: cmova  rdx,QWORD PTR [rbp+0x27]
0x00836120: mov    r8,QWORD PTR [rbp+0x37]
0x00836124: mov    rcx,rdi
0x00836127: call   0x14006f9a0
0x0083612c: mov    r8d,0x6
0x00836132: lea    rdx,[rip+0xdb284b]        # 0x1415e8984 ; literal=" from "
0x00836139: mov    rcx,rdi
0x0083613c: call   0x14006f9a0
0x00836141: lea    rdx,[rbp+0x7]
0x00836145: cmp    QWORD PTR [rbp+0x1f],0xf
0x0083614a: cmova  rdx,QWORD PTR [rbp+0x7]
0x0083614f: mov    r8,QWORD PTR [rbp+0x17]
0x00836153: mov    rcx,rdi
0x00836156: call   0x14006f9a0
0x0083615b: mov    eax,0xffff8ad0
0x00836160: cmp    WORD PTR [rbx+0x16],ax
0x00836164: je     0x1408361bf
0x00836166: mov    r8d,0x2
0x0083616c: lea    rdx,[rip+0xdda125]        # 0x141610298 ; literal=" ("
0x00836173: mov    rcx,rdi
0x00836176: call   0x14006f9a0
0x0083617b: mov    QWORD PTR [rsp+0x30],rdi
0x00836180: movzx  eax,WORD PTR [rbx+0x14]
0x00836184: mov    WORD PTR [rsp+0x28],ax
0x00836189: movzx  eax,WORD PTR [rbx+0x12]
0x0083618d: mov    WORD PTR [rsp+0x20],ax
0x00836192: movzx  r9d,WORD PTR [rbx+0x10]
0x00836197: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083619c: movzx  edx,WORD PTR [rbx+0x18]
0x008361a0: movzx  ecx,WORD PTR [rbx+0x16]
0x008361a4: call   0x14074cc40
0x008361a9: mov    r8d,0x1
0x008361af: lea    rdx,[rip+0xdda122]        # 0x1416102d8 ; literal=")"
0x008361b6: mov    rcx,rdi
0x008361b9: call   0x14006f9a0
0x008361be: nop
0x008361bf: mov    rdx,QWORD PTR [rbp+0x1f]
0x008361c3: cmp    rdx,0xf
0x008361c7: jbe    0x1408361fd
0x008361c9: inc    rdx
0x008361cc: mov    rcx,QWORD PTR [rbp+0x7]
0x008361d0: mov    rax,rcx
0x008361d3: cmp    rdx,0x1000
0x008361da: jb     0x1408361f8
0x008361dc: add    rdx,0x27
0x008361e0: mov    rcx,QWORD PTR [rcx-0x8]
0x008361e4: sub    rax,rcx
0x008361e7: add    rax,0xfffffffffffffff8
0x008361eb: cmp    rax,0x1f
0x008361ef: jbe    0x1408361f8
0x008361f1: call   QWORD PTR [rip+0xdaa8a9]        # 0x1415e0aa0
0x008361f7: int3
0x008361f8: call   0x1415345f0
0x008361fd: mov    QWORD PTR [rbp+0x17],0x0
0x00836205: mov    QWORD PTR [rbp+0x1f],0xf
0x0083620d: mov    BYTE PTR [rbp+0x7],0x0
0x00836211: mov    rdx,QWORD PTR [rbp+0x3f]
0x00836215: cmp    rdx,0xf
0x00836219: jbe    0x14083624f
0x0083621b: inc    rdx
0x0083621e: mov    rcx,QWORD PTR [rbp+0x27]
0x00836222: mov    rax,rcx
0x00836225: cmp    rdx,0x1000
0x0083622c: jb     0x14083624a
0x0083622e: add    rdx,0x27
0x00836232: mov    rcx,QWORD PTR [rcx-0x8]
0x00836236: sub    rax,rcx
0x00836239: add    rax,0xfffffffffffffff8
0x0083623d: cmp    rax,0x1f
0x00836241: jbe    0x14083624a
0x00836243: call   QWORD PTR [rip+0xdaa857]        # 0x1415e0aa0
0x00836249: int3
0x0083624a: call   0x1415345f0
0x0083624f: mov    rcx,QWORD PTR [rbp+0x47]
0x00836253: xor    rcx,rsp
0x00836256: call   0x1415345d0
0x0083625b: lea    r11,[rsp+0x90]
0x00836263: mov    rbx,QWORD PTR [r11+0x20]
0x00836267: mov    rdi,QWORD PTR [r11+0x28]
0x0083626b: mov    rsp,r11
0x0083626e: pop    rbp
0x0083626f: ret

# classic PE:6a70b91c:0270a000; adventure_environment_ingest_materialst+8; RVA 0x836270..0x836b1a
0x00836270: mov    QWORD PTR [rsp+0x18],rbx
0x00836275: push   rbp
0x00836276: push   rsi
0x00836277: push   rdi
0x00836278: push   r12
0x0083627a: push   r13
0x0083627c: push   r14
0x0083627e: push   r15
0x00836280: lea    rbp,[rsp-0x27]
0x00836285: sub    rsp,0xd0
0x0083628c: mov    rax,QWORD PTR [rip+0x105fdad]        # 0x141896040
0x00836293: xor    rax,rsp
0x00836296: mov    QWORD PTR [rbp+0x17],rax
0x0083629a: mov    r15,rdx
0x0083629d: mov    QWORD PTR [rbp-0x61],rdx
0x008362a1: mov    r13,rcx
0x008362a4: mov    ecx,0x4
0x008362a9: mov    r8d,0x6
0x008362af: cmp    WORD PTR [r13+0x28],0x1
0x008362b5: cmovne r8d,ecx
0x008362b9: lea    rcx,[rip+0xe75c38]        # 0x1416abef8 ; literal="Eat "
0x008362c0: lea    rdx,[rip+0xe75c15]        # 0x1416abedc ; literal="Drink "
0x008362c7: cmovne rdx,rcx
0x008362cb: mov    rcx,r15
0x008362ce: call   0x14006f860
0x008362d3: movsx  r9,WORD PTR [r13+0x14]
0x008362d8: movsx  edx,WORD PTR [r13+0x12]
0x008362dd: movsx  r8d,WORD PTR [r13+0x10]
0x008362e2: mov    edi,0xf
0x008362e7: mov    QWORD PTR [rbp-0x51],rdi
0x008362eb: xor    r14d,r14d
0x008362ee: lea    r12,[rip+0xf4c7bb]        # 0x141782ab0 ; literal="unknown material"
0x008362f5: test   r8w,r8w
0x008362f9: js     0x1408366e1
0x008362ff: mov    r11d,DWORD PTR [rip+0x1cabcc6]        # 0x1424e1fcc
0x00836306: cmp    r8d,r11d
0x00836309: jge    0x1408366e8
0x0083630f: test   dx,dx
0x00836312: js     0x1408366e8
0x00836318: cmp    edx,DWORD PTR [rip+0x1cabcb2]        # 0x1424e1fd0
0x0083631e: jge    0x1408366e8
0x00836324: test   r9w,r9w
0x00836328: js     0x1408366e8
0x0083632e: cmp    r9d,DWORD PTR [rip+0x1cabc9f]        # 0x1424e1fd4
0x00836335: jge    0x1408366e8
0x0083633b: sar    r8w,0x4
0x00836340: sar    dx,0x4
0x00836344: mov    rcx,QWORD PTR [rip+0x1cabc4d]        # 0x1424e1f98
0x0083634b: test   rcx,rcx
0x0083634e: je     0x1408366e8
0x00836354: movsx  rax,r8w
0x00836358: movsx  rdx,dx
0x0083635c: mov    rax,QWORD PTR [rcx+rax*8]
0x00836360: mov    rax,QWORD PTR [rax+rdx*8]
0x00836364: mov    rbx,QWORD PTR [rax+r9*8]
0x00836368: mov    QWORD PTR [rbp-0x59],rbx
0x0083636c: test   rbx,rbx
0x0083636f: je     0x1408366e8
0x00836375: mov    rax,QWORD PTR [rbx+0x10]
0x00836379: sub    rax,QWORD PTR [rbx+0x8]
0x0083637d: sar    rax,0x3
0x00836381: sub    eax,0x1
0x00836384: js     0x1408366e8
0x0083638a: movsxd rsi,eax
0x0083638d: mov    QWORD PTR [rbp-0x69],rsi
0x00836391: mov    rax,QWORD PTR [rbx+0x8]
0x00836395: mov    rcx,QWORD PTR [rax+rsi*8]
0x00836399: mov    rax,QWORD PTR [rcx]
0x0083639c: call   QWORD PTR [rax]
0x0083639e: cmp    ax,0x3
0x008363a2: jne    0x1408366d3
0x008363a8: mov    rax,QWORD PTR [rbx+0x8]
0x008363ac: mov    rdx,QWORD PTR [rax+rsi*8]
0x008363b0: movsx  eax,WORD PTR [r13+0x10]
0x008363b5: and    eax,0x8000000f
0x008363ba: jge    0x1408363c3
0x008363bc: dec    eax
0x008363be: or     eax,0xfffffff0
0x008363c1: inc    eax
0x008363c3: movsxd r8,eax
0x008363c6: add    r8,r8
0x008363c9: movsx  eax,WORD PTR [r13+0x12]
0x008363ce: and    eax,0x8000000f
0x008363d3: jge    0x1408363dc
0x008363d5: dec    eax
0x008363d7: or     eax,0xfffffff0
0x008363da: inc    eax
0x008363dc: movsxd rcx,eax
0x008363df: lea    rax,[rdx+r8*8]
0x008363e3: cmp    BYTE PTR [rcx+rax*1+0x12],0x64
0x008363e8: jb     0x1408366d3
0x008363ee: movsx  r12,WORD PTR [rdx+0x10]
0x008363f3: cmp    r12d,0x2
0x008363f7: je     0x1408366cc
0x008363fd: movzx  r15d,WORD PTR [rdx+0x8]
0x00836402: cmp    r15w,WORD PTR [r13+0x20]
0x00836407: jne    0x140836416
0x00836409: mov    eax,DWORD PTR [r13+0x24]
0x0083640d: cmp    DWORD PTR [rdx+0xc],eax
0x00836410: je     0x1408366c8
0x00836416: xorps  xmm0,xmm0
0x00836419: movups XMMWORD PTR [rbp-0x29],xmm0
0x0083641d: mov    QWORD PTR [rbp-0x11],rdi
0x00836421: mov    edi,DWORD PTR [rdx+0xc]
0x00836424: mov    QWORD PTR [rbp-0x19],r14
0x00836428: mov    BYTE PTR [rbp-0x29],0x0
0x0083642c: movzx  eax,r15w
0x00836430: mov    ecx,0xdb
0x00836435: sub    ax,cx
0x00836438: mov    ecx,0xc7
0x0083643d: cmp    ax,cx
0x00836440: ja     0x1408365b4
0x00836446: mov    r9,QWORD PTR [rip+0x1cbd7c3]        # 0x1424f3c10
0x0083644d: mov    r10,QWORD PTR [rip+0x1cbd7b4]        # 0x1424f3c08
0x00836454: sub    r9,r10
0x00836457: sar    r9,0x3
0x0083645b: test   r9,r9
0x0083645e: je     0x1408365b4
0x00836464: cmp    edi,0xffffffff
0x00836467: je     0x1408365b4
0x0083646d: mov    edx,r14d
0x00836470: sub    r9d,0x1
0x00836474: js     0x1408365b4
0x0083647a: nop    WORD PTR [rax+rax*1+0x0]
0x00836480: lea    ecx,[r9+rdx*1]
0x00836484: sar    ecx,1
0x00836486: movsxd rax,ecx
0x00836489: mov    rbx,QWORD PTR [r10+rax*8]
0x0083648d: cmp    DWORD PTR [rbx+0xe0],edi
0x00836493: je     0x1408364af
0x00836495: lea    eax,[rcx-0x1]
0x00836498: cmovle eax,r9d
0x0083649c: mov    r9d,eax
0x0083649f: lea    eax,[rcx+0x1]
0x008364a2: cmovle edx,eax
0x008364a5: cmp    edx,r9d
0x008364a8: jle    0x140836480
0x008364aa: jmp    0x1408365b4
0x008364af: test   rbx,rbx
0x008364b2: je     0x1408365b4
0x008364b8: cmp    BYTE PTR [rbx+0xaa],0x0
0x008364bf: je     0x1408365b4
0x008364c5: xorps  xmm0,xmm0
0x008364c8: movups XMMWORD PTR [rbp-0x49],xmm0
0x008364cc: mov    rsi,r14
0x008364cf: mov    QWORD PTR [rbp-0x39],r14
0x008364d3: mov    r14d,0xf
0x008364d9: mov    QWORD PTR [rbp-0x31],r14
0x008364dd: mov    BYTE PTR [rbp-0x49],0x0
0x008364e1: mov    rax,QWORD PTR [rbx+0x130]
0x008364e8: test   rax,rax
0x008364eb: je     0x140836519
0x008364ed: mov    rcx,QWORD PTR [rax+0x58]
0x008364f1: test   rcx,rcx
0x008364f4: je     0x140836519
0x008364f6: mov    edx,DWORD PTR [rcx+0x30]
0x008364f9: cmp    edx,0xffffffff
0x008364fc: je     0x140836519
0x008364fe: lea    rcx,[rip+0x1cab6d3]        # 0x1424e1bd8
0x00836505: call   0x140072500
0x0083650a: test   rax,rax
0x0083650d: je     0x140836519
0x0083650f: mov    rcx,rax
0x00836512: call   0x140c37530
0x00836517: jmp    0x14083651d
0x00836519: lea    rax,[rbx+0x38]
0x0083651d: test   rax,rax
0x00836520: je     0x140836542
0x00836522: cmp    BYTE PTR [rax+0x72],0x0
0x00836526: je     0x140836542
0x00836528: xor    r9d,r9d
0x0083652b: mov    r8b,0x1
0x0083652e: lea    rdx,[rbp-0x49]
0x00836532: mov    rcx,rax
0x00836535: call   0x140a91760
0x0083653a: mov    r14,QWORD PTR [rbp-0x31]
0x0083653e: mov    rsi,QWORD PTR [rbp-0x39]
0x00836542: lea    rdx,[rbp-0x49]
0x00836546: cmp    r14,0xf
0x0083654a: cmova  rdx,QWORD PTR [rbp-0x49]
0x0083654f: mov    r8,rsi
0x00836552: lea    rcx,[rbp-0x29]
0x00836556: call   0x14006f9a0
0x0083655b: mov    r8d,0x3
0x00836561: lea    rdx,[rip+0xdb25f0]        # 0x1415e8b58 ; literal="'s "
0x00836568: lea    rcx,[rbp-0x29]
0x0083656c: call   0x14006f9a0
0x00836571: nop
0x00836572: mov    rdx,QWORD PTR [rbp-0x31]
0x00836576: cmp    rdx,0xf
0x0083657a: jbe    0x1408365ad
0x0083657c: inc    rdx
0x0083657f: mov    rcx,QWORD PTR [rbp-0x49]
0x00836583: mov    rax,rcx
0x00836586: cmp    rdx,0x1000
0x0083658d: jb     0x1408365a8
0x0083658f: add    rdx,0x27
0x00836593: mov    rcx,QWORD PTR [rcx-0x8]
0x00836597: sub    rax,rcx
0x0083659a: add    rax,0xfffffffffffffff8
0x0083659e: cmp    rax,0x1f
0x008365a2: ja     0x14083688f
0x008365a8: call   0x1415345f0
0x008365ad: xor    r14d,r14d
0x008365b0: mov    rsi,QWORD PTR [rbp-0x69]
0x008365b4: mov    r8d,edi
0x008365b7: movzx  edx,r15w
0x008365bb: lea    rcx,[rip+0x1b94e1e]        # 0x1423cb3e0
0x008365c2: call   0x1414a8ce0
0x008365c7: mov    rbx,rax
0x008365ca: test   rax,rax
0x008365cd: je     0x140836635
0x008365cf: cmp    QWORD PTR [rax+0x530],0x0
0x008365d7: je     0x14083660d
0x008365d9: lea    rdx,[rax+0x520]
0x008365e0: mov    r8,QWORD PTR [rdx+0x10]
0x008365e4: cmp    QWORD PTR [rdx+0x18],0xf
0x008365e9: jbe    0x1408365ee
0x008365eb: mov    rdx,QWORD PTR [rdx]
0x008365ee: lea    rcx,[rbp-0x29]
0x008365f2: call   0x14006f9a0
0x008365f7: mov    r8d,0x1
0x008365fd: lea    rdx,[rip+0xdad11c]        # 0x1415e3720 ; literal=" "
0x00836604: lea    rcx,[rbp-0x29]
0x00836608: call   0x14006f9a0
0x0083660d: mov    rdx,r12
0x00836610: shl    rdx,0x5
0x00836614: add    rdx,0x178
0x0083661b: add    rdx,rbx
0x0083661e: mov    r8,QWORD PTR [rdx+0x10]
0x00836622: cmp    QWORD PTR [rdx+0x18],0xf
0x00836627: jbe    0x14083662c
0x00836629: mov    rdx,QWORD PTR [rdx]
0x0083662c: lea    r12,[rip+0xf4c47d]        # 0x141782ab0 ; literal="unknown material"
0x00836633: jmp    0x140836645
0x00836635: lea    r12,[rip+0xf4c474]        # 0x141782ab0 ; literal="unknown material"
0x0083663c: mov    rdx,r12
0x0083663f: mov    r8d,0x10
0x00836645: lea    rcx,[rbp-0x29]
0x00836649: call   0x14006f9a0
0x0083664e: lea    rdx,[rbp-0x29]
0x00836652: cmp    QWORD PTR [rbp-0x11],0xf
0x00836657: cmova  rdx,QWORD PTR [rbp-0x29]
0x0083665c: mov    r8,QWORD PTR [rbp-0x19]
0x00836660: mov    r15,QWORD PTR [rbp-0x61]
0x00836664: mov    rcx,r15
0x00836667: call   0x14006f9a0
0x0083666c: mov    r8d,0x1
0x00836672: lea    rdx,[rip+0xdad0a7]        # 0x1415e3720 ; literal=" "
0x00836679: mov    rcx,r15
0x0083667c: call   0x14006f9a0
0x00836681: nop
0x00836682: mov    rdx,QWORD PTR [rbp-0x11]
0x00836686: cmp    rdx,0xf
0x0083668a: jbe    0x1408366bd
0x0083668c: inc    rdx
0x0083668f: mov    rcx,QWORD PTR [rbp-0x29]
0x00836693: mov    rax,rcx
0x00836696: cmp    rdx,0x1000
0x0083669d: jb     0x1408366b8
0x0083669f: add    rdx,0x27
0x008366a3: mov    rcx,QWORD PTR [rcx-0x8]
0x008366a7: sub    rax,rcx
0x008366aa: add    rax,0xfffffffffffffff8
0x008366ae: cmp    rax,0x1f
0x008366b2: ja     0x140836896
0x008366b8: call   0x1415345f0
0x008366bd: mov    rbx,QWORD PTR [rbp-0x59]
0x008366c1: mov    edi,0xf
0x008366c6: jmp    0x1408366d3
0x008366c8: mov    r15,QWORD PTR [rbp-0x61]
0x008366cc: lea    r12,[rip+0xf4c3dd]        # 0x141782ab0 ; literal="unknown material"
0x008366d3: sub    rsi,0x1
0x008366d7: mov    QWORD PTR [rbp-0x69],rsi
0x008366db: jns    0x140836391
0x008366e1: mov    r11d,DWORD PTR [rip+0x1cab8e4]        # 0x1424e1fcc
0x008366e8: cmp    WORD PTR [r13+0x20],0x6
0x008366ee: jne    0x1408367e6
0x008366f4: movsx  r10,WORD PTR [r13+0x14]
0x008366f9: movsx  r9d,WORD PTR [r13+0x12]
0x008366fe: movsx  r8d,WORD PTR [r13+0x10]
0x00836703: test   r8w,r8w
0x00836707: js     0x1408367e6
0x0083670d: cmp    r8d,r11d
0x00836710: jge    0x1408367e6
0x00836716: test   r9w,r9w
0x0083671a: js     0x1408367e6
0x00836720: cmp    r9d,DWORD PTR [rip+0x1cab8a9]        # 0x1424e1fd0
0x00836727: jge    0x1408367e6
0x0083672d: test   r10w,r10w
0x00836731: js     0x1408367e6
0x00836737: cmp    r10d,DWORD PTR [rip+0x1cab896]        # 0x1424e1fd4
0x0083673e: jge    0x1408367e6
0x00836744: movzx  eax,r8w
0x00836748: sar    ax,0x4
0x0083674c: movzx  edx,r9w
0x00836750: sar    dx,0x4
0x00836754: mov    rcx,QWORD PTR [rip+0x1cab83d]        # 0x1424e1f98
0x0083675b: test   rcx,rcx
0x0083675e: je     0x1408367e6
0x00836764: movsx  rax,ax
0x00836768: movsx  rdx,dx
0x0083676c: mov    rax,QWORD PTR [rcx+rax*8]
0x00836770: mov    rax,QWORD PTR [rax+rdx*8]
0x00836774: mov    rbx,QWORD PTR [rax+r10*8]
0x00836778: test   rbx,rbx
0x0083677b: je     0x1408367e6
0x0083677d: mov    eax,r8d
0x00836780: and    eax,0x8000000f
0x00836785: jge    0x14083678e
0x00836787: dec    eax
0x00836789: or     eax,0xfffffff0
0x0083678c: inc    eax
0x0083678e: movsxd rcx,eax
0x00836791: shl    rcx,0x4
0x00836795: mov    eax,r9d
0x00836798: and    eax,0x8000000f
0x0083679d: jge    0x1408367a6
0x0083679f: dec    eax
0x008367a1: or     eax,0xfffffff0
0x008367a4: inc    eax
0x008367a6: cdqe
0x008367a8: add    rcx,rax
0x008367ab: mov    ebx,DWORD PTR [rbx+rcx*4+0x2a0]
0x008367b2: bt     ebx,0x1e
0x008367b6: jae    0x1408367cd
0x008367b8: mov    r8d,0x9
0x008367be: lea    rdx,[rip+0xe74db3]        # 0x1416ab578 ; literal="stagnant "
0x008367c5: mov    rcx,r15
0x008367c8: call   0x14006f9a0
0x008367cd: test   ebx,ebx
0x008367cf: jns    0x1408367e6
0x008367d1: mov    r8d,0x5
0x008367d7: lea    rdx,[rip+0xe75786]        # 0x1416abf64 ; literal="salt "
0x008367de: mov    rcx,r15
0x008367e1: call   0x14006f9a0
0x008367e6: xorps  xmm0,xmm0
0x008367e9: movups XMMWORD PTR [rbp-0x9],xmm0
0x008367ed: mov    QWORD PTR [rbp+0xf],rdi
0x008367f1: movsx  r14,WORD PTR [r13+0x28]
0x008367f6: mov    edi,DWORD PTR [r13+0x24]
0x008367fa: movzx  esi,WORD PTR [r13+0x20]
0x008367ff: xor    r15d,r15d
0x00836802: mov    QWORD PTR [rbp+0x7],r15
0x00836806: mov    BYTE PTR [rbp-0x9],r15b
0x0083680a: movzx  eax,si
0x0083680d: mov    ecx,0xdb
0x00836812: sub    ax,cx
0x00836815: mov    ecx,0xc7
0x0083681a: cmp    ax,cx
0x0083681d: ja     0x14083699e
0x00836823: mov    r8,QWORD PTR [rip+0x1cbd3e6]        # 0x1424f3c10
0x0083682a: mov    r10,QWORD PTR [rip+0x1cbd3d7]        # 0x1424f3c08
0x00836831: sub    r8,r10
0x00836834: sar    r8,0x3
0x00836838: test   r8,r8
0x0083683b: je     0x14083699e
0x00836841: cmp    edi,0xffffffff
0x00836844: je     0x14083699e
0x0083684a: mov    edx,r15d
0x0083684d: sub    r8d,0x1
0x00836851: js     0x14083699e
0x00836857: nop    WORD PTR [rax+rax*1+0x0]
0x00836860: lea    ecx,[r8+rdx*1]
0x00836864: sar    ecx,1
0x00836866: movsxd rax,ecx
0x00836869: mov    rbx,QWORD PTR [r10+rax*8]
0x0083686d: cmp    DWORD PTR [rbx+0xe0],edi
0x00836873: je     0x14083689d
0x00836875: lea    eax,[rcx-0x1]
0x00836878: cmovle eax,r8d
0x0083687c: mov    r8d,eax
0x0083687f: lea    eax,[rcx+0x1]
0x00836882: cmovle edx,eax
0x00836885: cmp    edx,r8d
0x00836888: jle    0x140836860
0x0083688a: jmp    0x14083699e
0x0083688f: call   QWORD PTR [rip+0xdaa20b]        # 0x1415e0aa0
0x00836895: nop
0x00836896: call   QWORD PTR [rip+0xdaa204]        # 0x1415e0aa0
0x0083689c: nop
0x0083689d: test   rbx,rbx
0x008368a0: je     0x14083699e
0x008368a6: cmp    BYTE PTR [rbx+0xaa],r15b
0x008368ad: je     0x14083699e
0x008368b3: xorps  xmm0,xmm0
0x008368b6: movups XMMWORD PTR [rbp-0x49],xmm0
0x008368ba: mov    QWORD PTR [rbp-0x39],r15
0x008368be: mov    QWORD PTR [rbp-0x31],0xf
0x008368c6: mov    BYTE PTR [rbp-0x49],r15b
0x008368ca: mov    rax,QWORD PTR [rbx+0x130]
0x008368d1: test   rax,rax
0x008368d4: je     0x140836902
0x008368d6: mov    rax,QWORD PTR [rax+0x58]
0x008368da: test   rax,rax
0x008368dd: je     0x140836902
0x008368df: mov    edx,DWORD PTR [rax+0x30]
0x008368e2: cmp    edx,0xffffffff
0x008368e5: je     0x140836902
0x008368e7: lea    rcx,[rip+0x1cab2ea]        # 0x1424e1bd8
0x008368ee: call   0x140072500
0x008368f3: test   rax,rax
0x008368f6: je     0x140836902
0x008368f8: mov    rcx,rax
0x008368fb: call   0x140c37530
0x00836900: jmp    0x140836906
0x00836902: lea    rax,[rbx+0x38]
0x00836906: test   rax,rax
0x00836909: je     0x14083692f
0x0083690b: cmp    BYTE PTR [rax+0x72],0x0
0x0083690f: je     0x14083692f
0x00836911: xor    r9d,r9d
0x00836914: mov    r8b,0x1
0x00836917: lea    rdx,[rbp-0x49]
0x0083691b: mov    rcx,rax
0x0083691e: call   0x140a91760
0x00836923: mov    rdx,QWORD PTR [rbp-0x31]
0x00836927: mov    QWORD PTR [rbp-0x51],rdx
0x0083692b: mov    r15,QWORD PTR [rbp-0x39]
0x0083692f: lea    rdx,[rbp-0x49]
0x00836933: cmp    QWORD PTR [rbp-0x51],0xf
0x00836938: cmova  rdx,QWORD PTR [rbp-0x49]
0x0083693d: mov    r8,r15
0x00836940: lea    rcx,[rbp-0x9]
0x00836944: call   0x14006f9a0
0x00836949: mov    r8d,0x3
0x0083694f: lea    rdx,[rip+0xdb2202]        # 0x1415e8b58 ; literal="'s "
0x00836956: lea    rcx,[rbp-0x9]
0x0083695a: call   0x14006f9a0
0x0083695f: nop
0x00836960: mov    rdx,QWORD PTR [rbp-0x31]
0x00836964: cmp    rdx,0xf
0x00836968: jbe    0x14083699e
0x0083696a: inc    rdx
0x0083696d: mov    rcx,QWORD PTR [rbp-0x49]
0x00836971: mov    rax,rcx
0x00836974: cmp    rdx,0x1000
0x0083697b: jb     0x140836999
0x0083697d: add    rdx,0x27
0x00836981: mov    rcx,QWORD PTR [rcx-0x8]
0x00836985: sub    rax,rcx
0x00836988: add    rax,0xfffffffffffffff8
0x0083698c: cmp    rax,0x1f
0x00836990: jbe    0x140836999
0x00836992: call   QWORD PTR [rip+0xdaa108]        # 0x1415e0aa0
0x00836998: int3
0x00836999: call   0x1415345f0
0x0083699e: mov    r8d,edi
0x008369a1: movzx  edx,si
0x008369a4: lea    rcx,[rip+0x1b94a35]        # 0x1423cb3e0
0x008369ab: call   0x1414a8ce0
0x008369b0: mov    rbx,rax
0x008369b3: test   rax,rax
0x008369b6: je     0x140836a1a
0x008369b8: cmp    QWORD PTR [rax+0x530],0x0
0x008369c0: je     0x1408369f6
0x008369c2: lea    rdx,[rax+0x520]
0x008369c9: mov    r8,QWORD PTR [rdx+0x10]
0x008369cd: cmp    QWORD PTR [rdx+0x18],0xf
0x008369d2: jbe    0x1408369d7
0x008369d4: mov    rdx,QWORD PTR [rdx]
0x008369d7: lea    rcx,[rbp-0x9]
0x008369db: call   0x14006f9a0
0x008369e0: mov    r8d,0x1
0x008369e6: lea    rdx,[rip+0xdacd33]        # 0x1415e3720 ; literal=" "
0x008369ed: lea    rcx,[rbp-0x9]
0x008369f1: call   0x14006f9a0
0x008369f6: mov    r12,r14
0x008369f9: shl    r12,0x5
0x008369fd: add    r12,0xb8
0x00836a04: add    r12,rbx
0x00836a07: mov    rax,QWORD PTR [r12+0x10]
0x00836a0c: cmp    QWORD PTR [r12+0x18],0xf
0x00836a12: jbe    0x140836a1f
0x00836a14: mov    r12,QWORD PTR [r12]
0x00836a18: jmp    0x140836a1f
0x00836a1a: mov    eax,0x10
0x00836a1f: mov    r8,rax
0x00836a22: mov    rdx,r12
0x00836a25: lea    rcx,[rbp-0x9]
0x00836a29: call   0x14006f9a0
0x00836a2e: lea    rdx,[rbp-0x9]
0x00836a32: cmp    QWORD PTR [rbp+0xf],0xf
0x00836a37: cmova  rdx,QWORD PTR [rbp-0x9]
0x00836a3c: mov    r8,QWORD PTR [rbp+0x7]
0x00836a40: mov    rbx,QWORD PTR [rbp-0x61]
0x00836a44: mov    rcx,rbx
0x00836a47: call   0x14006f9a0
0x00836a4c: mov    eax,0xffff8ad0
0x00836a51: cmp    WORD PTR [r13+0x16],ax
0x00836a56: je     0x140836ab5
0x00836a58: mov    r8d,0x2
0x00836a5e: lea    rdx,[rip+0xdd9833]        # 0x141610298 ; literal=" ("
0x00836a65: mov    rcx,rbx
0x00836a68: call   0x14006f9a0
0x00836a6d: mov    QWORD PTR [rsp+0x30],rbx
0x00836a72: movzx  eax,WORD PTR [r13+0x14]
0x00836a77: mov    WORD PTR [rsp+0x28],ax
0x00836a7c: movzx  eax,WORD PTR [r13+0x12]
0x00836a81: mov    WORD PTR [rsp+0x20],ax
0x00836a86: movzx  r9d,WORD PTR [r13+0x10]
0x00836a8b: movzx  r8d,WORD PTR [r13+0x1a]
0x00836a90: movzx  edx,WORD PTR [r13+0x18]
0x00836a95: movzx  ecx,WORD PTR [r13+0x16]
0x00836a9a: call   0x14074cc40
0x00836a9f: mov    r8d,0x1
0x00836aa5: lea    rdx,[rip+0xdd982c]        # 0x1416102d8 ; literal=")"
0x00836aac: mov    rcx,rbx
0x00836aaf: call   0x14006f9a0
0x00836ab4: nop
0x00836ab5: mov    rdx,QWORD PTR [rbp+0xf]
0x00836ab9: cmp    rdx,0xf
0x00836abd: jbe    0x140836af3
0x00836abf: inc    rdx
0x00836ac2: mov    rcx,QWORD PTR [rbp-0x9]
0x00836ac6: mov    rax,rcx
0x00836ac9: cmp    rdx,0x1000
0x00836ad0: jb     0x140836aee
0x00836ad2: add    rdx,0x27
0x00836ad6: mov    rcx,QWORD PTR [rcx-0x8]
0x00836ada: sub    rax,rcx
0x00836add: add    rax,0xfffffffffffffff8
0x00836ae1: cmp    rax,0x1f
0x00836ae5: jbe    0x140836aee
0x00836ae7: call   QWORD PTR [rip+0xda9fb3]        # 0x1415e0aa0
0x00836aed: int3
0x00836aee: call   0x1415345f0
0x00836af3: mov    rcx,QWORD PTR [rbp+0x17]
0x00836af7: xor    rcx,rsp
0x00836afa: call   0x1415345d0
0x00836aff: mov    rbx,QWORD PTR [rsp+0x120]
0x00836b07: add    rsp,0xd0
0x00836b0e: pop    r15
0x00836b10: pop    r14
0x00836b12: pop    r13
0x00836b14: pop    r12
0x00836b16: pop    rdi
0x00836b17: pop    rsi
0x00836b18: pop    rbp
0x00836b19: ret

# classic PE:6a70b91c:0270a000; adventure_option_view_contaminantst+8; RVA 0x836b20..0x836ef1
0x00836b20: mov    QWORD PTR [rsp+0x18],rbx
0x00836b25: mov    QWORD PTR [rsp+0x20],rsi
0x00836b2a: push   rbp
0x00836b2b: push   rdi
0x00836b2c: push   r12
0x00836b2e: push   r14
0x00836b30: push   r15
0x00836b32: mov    rbp,rsp
0x00836b35: sub    rsp,0x50
0x00836b39: mov    rax,QWORD PTR [rip+0x105f500]        # 0x141896040
0x00836b40: xor    rax,rsp
0x00836b43: mov    QWORD PTR [rbp-0x10],rax
0x00836b47: mov    r12,rdx
0x00836b4a: mov    rbx,rcx
0x00836b4d: cmp    QWORD PTR [rcx+0x10],0x0
0x00836b52: je     0x140836ec6
0x00836b58: mov    rcx,QWORD PTR [rcx+0x18]
0x00836b5c: test   rcx,rcx
0x00836b5f: je     0x140836ec6
0x00836b65: xorps  xmm0,xmm0
0x00836b68: movups XMMWORD PTR [rbp-0x30],xmm0
0x00836b6c: xor    esi,esi
0x00836b6e: mov    QWORD PTR [rbp-0x20],rsi
0x00836b72: mov    QWORD PTR [rbp-0x18],0xf
0x00836b7a: mov    BYTE PTR [rbp-0x30],sil
0x00836b7e: call   0x1406559b0
0x00836b83: mov    rdi,QWORD PTR [rbx+0x10]
0x00836b87: mov    rax,QWORD PTR [rbx+0x18]
0x00836b8b: movsx  rcx,WORD PTR [rax+0x18]
0x00836b90: test   cx,cx
0x00836b93: js     0x140836d6a
0x00836b99: mov    rax,QWORD PTR [rdi+0x5f8]
0x00836ba0: mov    rdx,QWORD PTR [rax]
0x00836ba3: mov    rbx,rcx
0x00836ba6: mov    rcx,QWORD PTR [rax+0x8]
0x00836baa: sub    rcx,rdx
0x00836bad: sar    rcx,0x3
0x00836bb1: cmp    rbx,rcx
0x00836bb4: jae    0x140836d6a
0x00836bba: mov    rax,QWORD PTR [rdx+rbx*8]
0x00836bbe: mov    rcx,QWORD PTR [rax+0x98]
0x00836bc5: sub    rcx,QWORD PTR [rax+0x90]
0x00836bcc: sar    rcx,0x3
0x00836bd0: mov    QWORD PTR [rbp-0x20],rsi
0x00836bd4: lea    rax,[rbp-0x30]
0x00836bd8: test   rcx,rcx
0x00836bdb: je     0x140836c30
0x00836bdd: cmp    QWORD PTR [rbp-0x18],0xf
0x00836be2: cmova  rax,QWORD PTR [rbp-0x30]
0x00836be7: mov    BYTE PTR [rax],sil
0x00836bea: mov    rax,QWORD PTR [rdi+0x5f8]
0x00836bf1: mov    rcx,QWORD PTR [rax]
0x00836bf4: mov    rax,QWORD PTR [rcx+rbx*8]
0x00836bf8: cmp    DWORD PTR [rax+0x84],0x1
0x00836bff: jg     0x140836c0a
0x00836c01: mov    rax,QWORD PTR [rax+0x90]
0x00836c08: jmp    0x140836c11
0x00836c0a: mov    rax,QWORD PTR [rax+0xa8]
0x00836c11: mov    rdx,QWORD PTR [rax]
0x00836c14: cmp    QWORD PTR [rdx+0x18],0xf
0x00836c19: mov    r8,QWORD PTR [rdx+0x10]
0x00836c1d: jbe    0x140836c22
0x00836c1f: mov    rdx,QWORD PTR [rdx]
0x00836c22: lea    rcx,[rbp-0x30]
0x00836c26: call   0x14006f9a0
0x00836c2b: jmp    0x140836e43
0x00836c30: cmp    QWORD PTR [rbp-0x18],0xf
0x00836c35: cmova  rax,QWORD PTR [rbp-0x30]
0x00836c3a: mov    BYTE PTR [rax],0x0
0x00836c3d: mov    r8d,0x9
0x00836c43: lea    rdx,[rip+0xe451a6]        # 0x14167bdf0 ; literal="body part"
0x00836c4a: lea    rcx,[rbp-0x30]
0x00836c4e: call   0x14006f9a0
0x00836c53: mov    rax,QWORD PTR [rdi+0x5f8]
0x00836c5a: mov    rcx,QWORD PTR [rax]
0x00836c5d: mov    rax,QWORD PTR [rcx+rbx*8]
0x00836c61: cmp    DWORD PTR [rax+0x84],0x1
0x00836c68: jle    0x140836e43
0x00836c6e: mov    rdi,QWORD PTR [rbp-0x20]
0x00836c72: mov    rsi,QWORD PTR [rbp-0x18]
0x00836c76: cmp    rdi,rsi
0x00836c79: jae    0x140836c9b
0x00836c7b: lea    rax,[rdi+0x1]
0x00836c7f: mov    QWORD PTR [rbp-0x20],rax
0x00836c83: lea    rax,[rbp-0x30]
0x00836c87: cmp    rsi,0xf
0x00836c8b: cmova  rax,QWORD PTR [rbp-0x30]
0x00836c90: mov    WORD PTR [rax+rdi*1],0x73
0x00836c96: jmp    0x140836e43
0x00836c9b: movabs rbx,0x7fffffffffffffff
0x00836ca5: mov    rax,rbx
0x00836ca8: sub    rax,rdi
0x00836cab: cmp    rax,0x1
0x00836caf: jb     0x140836eeb
0x00836cb5: lea    r15,[rdi+0x1]
0x00836cb9: mov    rcx,r15
0x00836cbc: or     rcx,0xf
0x00836cc0: cmp    rcx,rbx
0x00836cc3: ja     0x140836ce4
0x00836cc5: mov    rdx,rsi
0x00836cc8: shr    rdx,1
0x00836ccb: mov    rax,rbx
0x00836cce: sub    rax,rdx
0x00836cd1: cmp    rsi,rax
0x00836cd4: ja     0x140836ce4
0x00836cd6: lea    rax,[rsi+rdx*1]
0x00836cda: mov    rbx,rcx
0x00836cdd: cmp    rcx,rax
0x00836ce0: cmovb  rbx,rax
0x00836ce4: lea    rcx,[rbx+0x1]
0x00836ce8: call   0x140070760
0x00836ced: mov    r14,rax
0x00836cf0: mov    QWORD PTR [rbp-0x20],r15
0x00836cf4: mov    QWORD PTR [rbp-0x18],rbx
0x00836cf8: mov    r8,rdi
0x00836cfb: mov    rcx,rax
0x00836cfe: cmp    rsi,0xf
0x00836d02: jbe    0x140836d51
0x00836d04: mov    rbx,QWORD PTR [rbp-0x30]
0x00836d08: mov    rdx,rbx
0x00836d0b: call   0x1415359e8
0x00836d10: mov    WORD PTR [r14+rdi*1],0x73
0x00836d17: lea    rdx,[rsi+0x1]
0x00836d1b: cmp    rdx,0x1000
0x00836d22: jb     0x140836d40
0x00836d24: add    rdx,0x27
0x00836d28: mov    rcx,QWORD PTR [rbx-0x8]
0x00836d2c: sub    rbx,rcx
0x00836d2f: lea    rax,[rbx-0x8]
0x00836d33: cmp    rax,0x1f
0x00836d37: ja     0x140836e33
0x00836d3d: mov    rbx,rcx
0x00836d40: mov    rcx,rbx
0x00836d43: call   0x1415345f0
0x00836d48: mov    QWORD PTR [rbp-0x30],r14
0x00836d4c: jmp    0x140836e43
0x00836d51: lea    rdx,[rbp-0x30]
0x00836d55: call   0x1415359e8
0x00836d5a: mov    WORD PTR [r14+rdi*1],0x73
0x00836d61: mov    QWORD PTR [rbp-0x30],r14
0x00836d65: jmp    0x140836e43
0x00836d6a: mov    rdi,QWORD PTR [rbp-0x18]
0x00836d6e: cmp    rdi,0x9
0x00836d72: jb     0x140836da7
0x00836d74: lea    rbx,[rbp-0x30]
0x00836d78: cmp    rdi,0xf
0x00836d7c: cmova  rbx,QWORD PTR [rbp-0x30]
0x00836d81: mov    QWORD PTR [rbp-0x20],0x9
0x00836d89: mov    r8d,0x9
0x00836d8f: lea    rdx,[rip+0xe4505a]        # 0x14167bdf0 ; literal="body part"
0x00836d96: mov    rcx,rbx
0x00836d99: call   0x141535d8a
0x00836d9e: mov    BYTE PTR [rbx+0x9],0x0
0x00836da2: jmp    0x140836e43
0x00836da7: mov    rcx,rdi
0x00836daa: shr    rcx,1
0x00836dad: movabs rbx,0x7fffffffffffffff
0x00836db7: mov    rax,rbx
0x00836dba: sub    rax,rcx
0x00836dbd: cmp    rdi,rax
0x00836dc0: ja     0x140836dd2
0x00836dc2: lea    rax,[rcx+rdi*1]
0x00836dc6: mov    ebx,0xf
0x00836dcb: cmp    rax,rbx
0x00836dce: cmova  rbx,rax
0x00836dd2: lea    rcx,[rbx+0x1]
0x00836dd6: call   0x140070760
0x00836ddb: mov    rsi,rax
0x00836dde: mov    QWORD PTR [rbp-0x20],0x9
0x00836de6: mov    QWORD PTR [rbp-0x18],rbx
0x00836dea: movsd  xmm0,QWORD PTR [rip+0xe44ffe]        # 0x14167bdf0 ; literal="body part"
0x00836df2: movsd  QWORD PTR [rax],xmm0
0x00836df6: movzx  ecx,BYTE PTR [rip+0xe44ffb]        # 0x14167bdf8 ; literal="t"
0x00836dfd: mov    BYTE PTR [rax+0x8],cl
0x00836e00: mov    BYTE PTR [rax+0x9],0x0
0x00836e04: cmp    rdi,0xf
0x00836e08: jbe    0x140836e3f
0x00836e0a: lea    rdx,[rdi+0x1]
0x00836e0e: mov    rcx,QWORD PTR [rbp-0x30]
0x00836e12: mov    rax,rcx
0x00836e15: cmp    rdx,0x1000
0x00836e1c: jb     0x140836e3a
0x00836e1e: add    rdx,0x27
0x00836e22: mov    rcx,QWORD PTR [rcx-0x8]
0x00836e26: sub    rax,rcx
0x00836e29: add    rax,0xfffffffffffffff8
0x00836e2d: cmp    rax,0x1f
0x00836e31: jbe    0x140836e3a
0x00836e33: call   QWORD PTR [rip+0xda9c67]        # 0x1415e0aa0
0x00836e39: int3
0x00836e3a: call   0x1415345f0
0x00836e3f: mov    QWORD PTR [rbp-0x30],rsi
0x00836e43: mov    r8d,0x2
0x00836e49: lea    rdx,[rip+0xdd9448]        # 0x141610298 ; literal=" ("
0x00836e50: mov    rcx,r12
0x00836e53: call   0x14006f9a0
0x00836e58: lea    rdx,[rbp-0x30]
0x00836e5c: cmp    QWORD PTR [rbp-0x18],0xf
0x00836e61: cmova  rdx,QWORD PTR [rbp-0x30]
0x00836e66: mov    r8,QWORD PTR [rbp-0x20]
0x00836e6a: mov    rcx,r12
0x00836e6d: call   0x14006f9a0
0x00836e72: mov    r8d,0x1
0x00836e78: lea    rdx,[rip+0xdd9459]        # 0x1416102d8 ; literal=")"
0x00836e7f: mov    rcx,r12
0x00836e82: call   0x14006f9a0
0x00836e87: nop
0x00836e88: mov    rdx,QWORD PTR [rbp-0x18]
0x00836e8c: cmp    rdx,0xf
0x00836e90: jbe    0x140836ec6
0x00836e92: inc    rdx
0x00836e95: mov    rcx,QWORD PTR [rbp-0x30]
0x00836e99: mov    rax,rcx
0x00836e9c: cmp    rdx,0x1000
0x00836ea3: jb     0x140836ec1
0x00836ea5: add    rdx,0x27
0x00836ea9: mov    rcx,QWORD PTR [rcx-0x8]
0x00836ead: sub    rax,rcx
0x00836eb0: add    rax,0xfffffffffffffff8
0x00836eb4: cmp    rax,0x1f
0x00836eb8: jbe    0x140836ec1
0x00836eba: call   QWORD PTR [rip+0xda9be0]        # 0x1415e0aa0
0x00836ec0: int3
0x00836ec1: call   0x1415345f0
0x00836ec6: mov    rcx,QWORD PTR [rbp-0x10]
0x00836eca: xor    rcx,rsp
0x00836ecd: call   0x1415345d0
0x00836ed2: lea    r11,[rsp+0x50]
0x00836ed7: mov    rbx,QWORD PTR [r11+0x40]
0x00836edb: mov    rsi,QWORD PTR [r11+0x48]
0x00836edf: mov    rsp,r11
0x00836ee2: pop    r15
0x00836ee4: pop    r14
0x00836ee6: pop    r12
0x00836ee8: pop    rdi
0x00836ee9: pop    rbp
0x00836eea: ret
0x00836eeb: call   0x140065820
0x00836ef0: nop

# classic PE:6a70b91c:0270a000; adventure_option_eat_unit_contaminantst+8; RVA 0x8370d0..0x837515
0x008370d0: mov    QWORD PTR [rsp+0x18],rbx
0x008370d5: mov    QWORD PTR [rsp+0x20],rsi
0x008370da: push   rbp
0x008370db: push   rdi
0x008370dc: push   r12
0x008370de: push   r14
0x008370e0: push   r15
0x008370e2: mov    rbp,rsp
0x008370e5: sub    rsp,0x50
0x008370e9: mov    rax,QWORD PTR [rip+0x105ef50]        # 0x141896040
0x008370f0: xor    rax,rsp
0x008370f3: mov    QWORD PTR [rbp-0x10],rax
0x008370f7: mov    r12,rdx
0x008370fa: mov    rbx,rcx
0x008370fd: cmp    QWORD PTR [rcx+0x10],0x0
0x00837102: je     0x1408374ea
0x00837108: mov    rax,QWORD PTR [rcx+0x18]
0x0083710c: test   rax,rax
0x0083710f: je     0x1408374ea
0x00837115: movsx  ecx,WORD PTR [rax+0x8]
0x00837119: test   ecx,ecx
0x0083711b: je     0x140837135
0x0083711d: sub    ecx,0x1
0x00837120: je     0x14083712e
0x00837122: sub    ecx,0x2
0x00837125: jne    0x140837135
0x00837127: mov    eax,0x46
0x0083712c: jmp    0x14083713a
0x0083712e: mov    eax,0x49
0x00837133: jmp    0x14083713a
0x00837135: mov    eax,0x4b
0x0083713a: mov    ecx,0x6
0x0083713f: mov    r8d,0x4
0x00837145: cmp    ax,0x49
0x00837149: cmove  r8d,ecx
0x0083714d: lea    rcx,[rip+0xe74d88]        # 0x1416abedc ; literal="Drink "
0x00837154: lea    rdx,[rip+0xe74d9d]        # 0x1416abef8 ; literal="Eat "
0x0083715b: cmove  rdx,rcx
0x0083715f: mov    rcx,r12
0x00837162: call   0x14006f860
0x00837167: xorps  xmm0,xmm0
0x0083716a: movups XMMWORD PTR [rbp-0x30],xmm0
0x0083716e: xor    esi,esi
0x00837170: mov    QWORD PTR [rbp-0x20],rsi
0x00837174: mov    QWORD PTR [rbp-0x18],0xf
0x0083717c: mov    BYTE PTR [rbp-0x30],sil
0x00837180: lea    rdx,[rbp-0x30]
0x00837184: mov    rcx,QWORD PTR [rbx+0x18]
0x00837188: call   0x1406559b0
0x0083718d: lea    rdx,[rbp-0x30]
0x00837191: cmp    QWORD PTR [rbp-0x18],0xf
0x00837196: cmova  rdx,QWORD PTR [rbp-0x30]
0x0083719b: mov    r8,QWORD PTR [rbp-0x20]
0x0083719f: mov    rcx,r12
0x008371a2: call   0x14006f9a0
0x008371a7: mov    rdi,QWORD PTR [rbx+0x10]
0x008371ab: mov    rax,QWORD PTR [rbx+0x18]
0x008371af: movsx  rcx,WORD PTR [rax+0x18]
0x008371b4: test   cx,cx
0x008371b7: js     0x14083738e
0x008371bd: mov    rax,QWORD PTR [rdi+0x5f8]
0x008371c4: mov    rdx,QWORD PTR [rax]
0x008371c7: mov    rbx,rcx
0x008371ca: mov    rcx,QWORD PTR [rax+0x8]
0x008371ce: sub    rcx,rdx
0x008371d1: sar    rcx,0x3
0x008371d5: cmp    rbx,rcx
0x008371d8: jae    0x14083738e
0x008371de: mov    rax,QWORD PTR [rdx+rbx*8]
0x008371e2: mov    rcx,QWORD PTR [rax+0x98]
0x008371e9: sub    rcx,QWORD PTR [rax+0x90]
0x008371f0: sar    rcx,0x3
0x008371f4: mov    QWORD PTR [rbp-0x20],rsi
0x008371f8: lea    rax,[rbp-0x30]
0x008371fc: test   rcx,rcx
0x008371ff: je     0x140837254
0x00837201: cmp    QWORD PTR [rbp-0x18],0xf
0x00837206: cmova  rax,QWORD PTR [rbp-0x30]
0x0083720b: mov    BYTE PTR [rax],sil
0x0083720e: mov    rax,QWORD PTR [rdi+0x5f8]
0x00837215: mov    rcx,QWORD PTR [rax]
0x00837218: mov    rax,QWORD PTR [rcx+rbx*8]
0x0083721c: cmp    DWORD PTR [rax+0x84],0x1
0x00837223: jg     0x14083722e
0x00837225: mov    rax,QWORD PTR [rax+0x90]
0x0083722c: jmp    0x140837235
0x0083722e: mov    rax,QWORD PTR [rax+0xa8]
0x00837235: mov    rdx,QWORD PTR [rax]
0x00837238: cmp    QWORD PTR [rdx+0x18],0xf
0x0083723d: mov    r8,QWORD PTR [rdx+0x10]
0x00837241: jbe    0x140837246
0x00837243: mov    rdx,QWORD PTR [rdx]
0x00837246: lea    rcx,[rbp-0x30]
0x0083724a: call   0x14006f9a0
0x0083724f: jmp    0x140837467
0x00837254: cmp    QWORD PTR [rbp-0x18],0xf
0x00837259: cmova  rax,QWORD PTR [rbp-0x30]
0x0083725e: mov    BYTE PTR [rax],0x0
0x00837261: mov    r8d,0x9
0x00837267: lea    rdx,[rip+0xe44b82]        # 0x14167bdf0 ; literal="body part"
0x0083726e: lea    rcx,[rbp-0x30]
0x00837272: call   0x14006f9a0
0x00837277: mov    rax,QWORD PTR [rdi+0x5f8]
0x0083727e: mov    rcx,QWORD PTR [rax]
0x00837281: mov    rax,QWORD PTR [rcx+rbx*8]
0x00837285: cmp    DWORD PTR [rax+0x84],0x1
0x0083728c: jle    0x140837467
0x00837292: mov    rdi,QWORD PTR [rbp-0x20]
0x00837296: mov    rsi,QWORD PTR [rbp-0x18]
0x0083729a: cmp    rdi,rsi
0x0083729d: jae    0x1408372bf
0x0083729f: lea    rax,[rdi+0x1]
0x008372a3: mov    QWORD PTR [rbp-0x20],rax
0x008372a7: lea    rax,[rbp-0x30]
0x008372ab: cmp    rsi,0xf
0x008372af: cmova  rax,QWORD PTR [rbp-0x30]
0x008372b4: mov    WORD PTR [rax+rdi*1],0x73
0x008372ba: jmp    0x140837467
0x008372bf: movabs rbx,0x7fffffffffffffff
0x008372c9: mov    rax,rbx
0x008372cc: sub    rax,rdi
0x008372cf: cmp    rax,0x1
0x008372d3: jb     0x14083750f
0x008372d9: lea    r15,[rdi+0x1]
0x008372dd: mov    rcx,r15
0x008372e0: or     rcx,0xf
0x008372e4: cmp    rcx,rbx
0x008372e7: ja     0x140837308
0x008372e9: mov    rdx,rsi
0x008372ec: shr    rdx,1
0x008372ef: mov    rax,rbx
0x008372f2: sub    rax,rdx
0x008372f5: cmp    rsi,rax
0x008372f8: ja     0x140837308
0x008372fa: lea    rax,[rsi+rdx*1]
0x008372fe: mov    rbx,rcx
0x00837301: cmp    rcx,rax
0x00837304: cmovb  rbx,rax
0x00837308: lea    rcx,[rbx+0x1]
0x0083730c: call   0x140070760
0x00837311: mov    r14,rax
0x00837314: mov    QWORD PTR [rbp-0x20],r15
0x00837318: mov    QWORD PTR [rbp-0x18],rbx
0x0083731c: mov    r8,rdi
0x0083731f: mov    rcx,rax
0x00837322: cmp    rsi,0xf
0x00837326: jbe    0x140837375
0x00837328: mov    rbx,QWORD PTR [rbp-0x30]
0x0083732c: mov    rdx,rbx
0x0083732f: call   0x1415359e8
0x00837334: mov    WORD PTR [r14+rdi*1],0x73
0x0083733b: lea    rdx,[rsi+0x1]
0x0083733f: cmp    rdx,0x1000
0x00837346: jb     0x140837364
0x00837348: add    rdx,0x27
0x0083734c: mov    rcx,QWORD PTR [rbx-0x8]
0x00837350: sub    rbx,rcx
0x00837353: lea    rax,[rbx-0x8]
0x00837357: cmp    rax,0x1f
0x0083735b: ja     0x140837457
0x00837361: mov    rbx,rcx
0x00837364: mov    rcx,rbx
0x00837367: call   0x1415345f0
0x0083736c: mov    QWORD PTR [rbp-0x30],r14
0x00837370: jmp    0x140837467
0x00837375: lea    rdx,[rbp-0x30]
0x00837379: call   0x1415359e8
0x0083737e: mov    WORD PTR [r14+rdi*1],0x73
0x00837385: mov    QWORD PTR [rbp-0x30],r14
0x00837389: jmp    0x140837467
0x0083738e: mov    rdi,QWORD PTR [rbp-0x18]
0x00837392: cmp    rdi,0x9
0x00837396: jb     0x1408373cb
0x00837398: lea    rbx,[rbp-0x30]
0x0083739c: cmp    rdi,0xf
0x008373a0: cmova  rbx,QWORD PTR [rbp-0x30]
0x008373a5: mov    QWORD PTR [rbp-0x20],0x9
0x008373ad: mov    r8d,0x9
0x008373b3: lea    rdx,[rip+0xe44a36]        # 0x14167bdf0 ; literal="body part"
0x008373ba: mov    rcx,rbx
0x008373bd: call   0x141535d8a
0x008373c2: mov    BYTE PTR [rbx+0x9],0x0
0x008373c6: jmp    0x140837467
0x008373cb: mov    rcx,rdi
0x008373ce: shr    rcx,1
0x008373d1: movabs rbx,0x7fffffffffffffff
0x008373db: mov    rax,rbx
0x008373de: sub    rax,rcx
0x008373e1: cmp    rdi,rax
0x008373e4: ja     0x1408373f6
0x008373e6: lea    rax,[rcx+rdi*1]
0x008373ea: mov    ebx,0xf
0x008373ef: cmp    rax,rbx
0x008373f2: cmova  rbx,rax
0x008373f6: lea    rcx,[rbx+0x1]
0x008373fa: call   0x140070760
0x008373ff: mov    rsi,rax
0x00837402: mov    QWORD PTR [rbp-0x20],0x9
0x0083740a: mov    QWORD PTR [rbp-0x18],rbx
0x0083740e: movsd  xmm0,QWORD PTR [rip+0xe449da]        # 0x14167bdf0 ; literal="body part"
0x00837416: movsd  QWORD PTR [rax],xmm0
0x0083741a: movzx  ecx,BYTE PTR [rip+0xe449d7]        # 0x14167bdf8 ; literal="t"
0x00837421: mov    BYTE PTR [rax+0x8],cl
0x00837424: mov    BYTE PTR [rax+0x9],0x0
0x00837428: cmp    rdi,0xf
0x0083742c: jbe    0x140837463
0x0083742e: lea    rdx,[rdi+0x1]
0x00837432: mov    rcx,QWORD PTR [rbp-0x30]
0x00837436: mov    rax,rcx
0x00837439: cmp    rdx,0x1000
0x00837440: jb     0x14083745e
0x00837442: add    rdx,0x27
0x00837446: mov    rcx,QWORD PTR [rcx-0x8]
0x0083744a: sub    rax,rcx
0x0083744d: add    rax,0xfffffffffffffff8
0x00837451: cmp    rax,0x1f
0x00837455: jbe    0x14083745e
0x00837457: call   QWORD PTR [rip+0xda9643]        # 0x1415e0aa0
0x0083745d: int3
0x0083745e: call   0x1415345f0
0x00837463: mov    QWORD PTR [rbp-0x30],rsi
0x00837467: mov    r8d,0x2
0x0083746d: lea    rdx,[rip+0xdd8e24]        # 0x141610298 ; literal=" ("
0x00837474: mov    rcx,r12
0x00837477: call   0x14006f9a0
0x0083747c: lea    rdx,[rbp-0x30]
0x00837480: cmp    QWORD PTR [rbp-0x18],0xf
0x00837485: cmova  rdx,QWORD PTR [rbp-0x30]
0x0083748a: mov    r8,QWORD PTR [rbp-0x20]
0x0083748e: mov    rcx,r12
0x00837491: call   0x14006f9a0
0x00837496: mov    r8d,0x1
0x0083749c: lea    rdx,[rip+0xdd8e35]        # 0x1416102d8 ; literal=")"
0x008374a3: mov    rcx,r12
0x008374a6: call   0x14006f9a0
0x008374ab: nop
0x008374ac: mov    rdx,QWORD PTR [rbp-0x18]
0x008374b0: cmp    rdx,0xf
0x008374b4: jbe    0x1408374ea
0x008374b6: inc    rdx
0x008374b9: mov    rcx,QWORD PTR [rbp-0x30]
0x008374bd: mov    rax,rcx
0x008374c0: cmp    rdx,0x1000
0x008374c7: jb     0x1408374e5
0x008374c9: add    rdx,0x27
0x008374cd: mov    rcx,QWORD PTR [rcx-0x8]
0x008374d1: sub    rax,rcx
0x008374d4: add    rax,0xfffffffffffffff8
0x008374d8: cmp    rax,0x1f
0x008374dc: jbe    0x1408374e5
0x008374de: call   QWORD PTR [rip+0xda95bc]        # 0x1415e0aa0
0x008374e4: int3
0x008374e5: call   0x1415345f0
0x008374ea: mov    rcx,QWORD PTR [rbp-0x10]
0x008374ee: xor    rcx,rsp
0x008374f1: call   0x1415345d0
0x008374f6: lea    r11,[rsp+0x50]
0x008374fb: mov    rbx,QWORD PTR [r11+0x40]
0x008374ff: mov    rsi,QWORD PTR [r11+0x48]
0x00837503: mov    rsp,r11
0x00837506: pop    r15
0x00837508: pop    r14
0x0083750a: pop    r12
0x0083750c: pop    rdi
0x0083750d: pop    rbp
0x0083750e: ret
0x0083750f: call   0x140065820
0x00837514: nop

# classic PE:6a70b91c:0270a000; adventure_option_eat_item_contaminantst+8; RVA 0x837520..0x8376ba
0x00837520: mov    QWORD PTR [rsp+0x18],rbx
0x00837525: push   rdi
0x00837526: sub    rsp,0x50
0x0083752a: mov    rax,QWORD PTR [rip+0x105eb0f]        # 0x141896040
0x00837531: xor    rax,rsp
0x00837534: mov    QWORD PTR [rsp+0x40],rax
0x00837539: mov    rdi,rdx
0x0083753c: mov    rbx,rcx
0x0083753f: cmp    QWORD PTR [rcx+0x10],0x0
0x00837544: je     0x1408376a2
0x0083754a: cmp    QWORD PTR [rcx+0x18],0x0
0x0083754f: je     0x1408376a2
0x00837555: mov    rax,QWORD PTR [rcx+0x20]
0x00837559: test   rax,rax
0x0083755c: je     0x1408376a2
0x00837562: movsx  ecx,WORD PTR [rax+0x8]
0x00837566: test   ecx,ecx
0x00837568: je     0x140837582
0x0083756a: sub    ecx,0x1
0x0083756d: je     0x14083757b
0x0083756f: sub    ecx,0x2
0x00837572: jne    0x140837582
0x00837574: mov    eax,0x46
0x00837579: jmp    0x140837587
0x0083757b: mov    eax,0x49
0x00837580: jmp    0x140837587
0x00837582: mov    eax,0x4b
0x00837587: mov    ecx,0x6
0x0083758c: mov    r8d,0x4
0x00837592: cmp    ax,0x49
0x00837596: cmove  r8d,ecx
0x0083759a: lea    rcx,[rip+0xe7493b]        # 0x1416abedc ; literal="Drink "
0x008375a1: lea    rdx,[rip+0xe74950]        # 0x1416abef8 ; literal="Eat "
0x008375a8: cmove  rdx,rcx
0x008375ac: mov    rcx,rdi
0x008375af: call   0x14006f860
0x008375b4: xorps  xmm0,xmm0
0x008375b7: movups XMMWORD PTR [rsp+0x20],xmm0
0x008375bc: mov    QWORD PTR [rsp+0x30],0x0
0x008375c5: mov    QWORD PTR [rsp+0x38],0xf
0x008375ce: mov    BYTE PTR [rsp+0x20],0x0
0x008375d3: lea    rdx,[rsp+0x20]
0x008375d8: mov    rcx,QWORD PTR [rbx+0x20]
0x008375dc: call   0x1406559b0
0x008375e1: lea    rdx,[rsp+0x20]
0x008375e6: cmp    QWORD PTR [rsp+0x38],0xf
0x008375ec: cmova  rdx,QWORD PTR [rsp+0x20]
0x008375f2: mov    r8,QWORD PTR [rsp+0x30]
0x008375f7: mov    rcx,rdi
0x008375fa: call   0x14006f9a0
0x008375ff: mov    rax,QWORD PTR [rbx+0x18]
0x00837603: mov    r9d,0xffffffff
0x00837609: xor    r8d,r8d
0x0083760c: lea    rdx,[rsp+0x20]
0x00837611: mov    rcx,QWORD PTR [rax]
0x00837614: call   0x140c62490
0x00837619: mov    r8d,0x2
0x0083761f: lea    rdx,[rip+0xdd8c72]        # 0x141610298 ; literal=" ("
0x00837626: mov    rcx,rdi
0x00837629: call   0x14006f9a0
0x0083762e: lea    rdx,[rsp+0x20]
0x00837633: cmp    QWORD PTR [rsp+0x38],0xf
0x00837639: cmova  rdx,QWORD PTR [rsp+0x20]
0x0083763f: mov    r8,QWORD PTR [rsp+0x30]
0x00837644: mov    rcx,rdi
0x00837647: call   0x14006f9a0
0x0083764c: mov    r8d,0x1
0x00837652: lea    rdx,[rip+0xdd8c7f]        # 0x1416102d8 ; literal=")"
0x00837659: mov    rcx,rdi
0x0083765c: call   0x14006f9a0
0x00837661: nop
0x00837662: mov    rdx,QWORD PTR [rsp+0x38]
0x00837667: cmp    rdx,0xf
0x0083766b: jbe    0x1408376a2
0x0083766d: inc    rdx
0x00837670: mov    rcx,QWORD PTR [rsp+0x20]
0x00837675: mov    rax,rcx
0x00837678: cmp    rdx,0x1000
0x0083767f: jb     0x14083769d
0x00837681: add    rdx,0x27
0x00837685: mov    rcx,QWORD PTR [rcx-0x8]
0x00837689: sub    rax,rcx
0x0083768c: add    rax,0xfffffffffffffff8
0x00837690: cmp    rax,0x1f
0x00837694: jbe    0x14083769d
0x00837696: call   QWORD PTR [rip+0xda9404]        # 0x1415e0aa0
0x0083769c: int3
0x0083769d: call   0x1415345f0
0x008376a2: mov    rcx,QWORD PTR [rsp+0x40]
0x008376a7: xor    rcx,rsp
0x008376aa: call   0x1415345d0
0x008376af: mov    rbx,QWORD PTR [rsp+0x70]
0x008376b4: add    rsp,0x50
0x008376b8: pop    rdi
0x008376b9: ret

# classic PE:6a70b91c:0270a000; adventure_environment_pickup_vermin_eventst+8; RVA 0x8376c0..0x837955
0x008376c0: mov    QWORD PTR [rsp+0x18],rbx
0x008376c5: push   rbp
0x008376c6: push   rsi
0x008376c7: push   rdi
0x008376c8: push   r12
0x008376ca: push   r13
0x008376cc: push   r14
0x008376ce: push   r15
0x008376d0: sub    rsp,0xa0
0x008376d7: mov    rax,QWORD PTR [rip+0x105e962]        # 0x141896040
0x008376de: xor    rax,rsp
0x008376e1: mov    QWORD PTR [rsp+0x90],rax
0x008376e9: mov    rax,rdx
0x008376ec: mov    QWORD PTR [rsp+0x48],rdx
0x008376f1: mov    rsi,rcx
0x008376f4: xor    r14d,r14d
0x008376f7: mov    r8d,0x2
0x008376fd: lea    rdx,[rip+0xdb0ee0]        # 0x1415e85e4 ; literal="A "
0x00837704: mov    rcx,rax
0x00837707: call   0x14006f860
0x0083770c: xorps  xmm0,xmm0
0x0083770f: movups XMMWORD PTR [rsp+0x70],xmm0
0x00837714: mov    ebx,0xf
0x00837719: mov    ebp,ebx
0x0083771b: mov    QWORD PTR [rsp+0x88],rbx
0x00837723: movsxd rcx,DWORD PTR [rsi+0x20]
0x00837727: mov    rax,QWORD PTR [rip+0x1b93d42]        # 0x1423cb470
0x0083772e: mov    rcx,QWORD PTR [rax+rcx*8]
0x00837732: movsx  rax,WORD PTR [rcx]
0x00837736: mov    QWORD PTR [rsp+0x80],r14
0x0083773e: mov    BYTE PTR [rsp+0x70],r14b
0x00837743: test   ax,ax
0x00837746: js     0x14083779e
0x00837748: mov    rdx,QWORD PTR [rip+0x1caf209]        # 0x1424e6958
0x0083774f: mov    rcx,rax
0x00837752: mov    rax,QWORD PTR [rip+0x1caf207]        # 0x1424e6960
0x00837759: sub    rax,rdx
0x0083775c: sar    rax,0x3
0x00837760: cmp    rcx,rax
0x00837763: jae    0x14083779e
0x00837765: mov    rdx,QWORD PTR [rdx+rcx*8]
0x00837769: add    rdx,0x20
0x0083776d: lea    rax,[rsp+0x70]
0x00837772: cmp    rax,rdx
0x00837775: je     0x14083779e
0x00837777: mov    r8,QWORD PTR [rdx+0x10]
0x0083777b: cmp    QWORD PTR [rdx+0x18],rbx
0x0083777f: jbe    0x140837784
0x00837781: mov    rdx,QWORD PTR [rdx]
0x00837784: lea    rcx,[rsp+0x70]
0x00837789: call   0x14006f860
0x0083778e: mov    rbp,QWORD PTR [rsp+0x88]
0x00837796: mov    r14,QWORD PTR [rsp+0x80]
0x0083779e: mov    eax,0xffff8ad0
0x008377a3: mov    rdi,QWORD PTR [rsp+0x70]
0x008377a8: cmp    WORD PTR [rsi+0x16],ax
0x008377ac: je     0x1408378ea
0x008377b2: movabs rcx,0x7fffffffffffffff
0x008377bc: mov    rax,rcx
0x008377bf: sub    rax,r14
0x008377c2: cmp    rax,0x2
0x008377c6: jb     0x14083794f
0x008377cc: lea    r13,[rsp+0x70]
0x008377d1: cmp    rbp,0xf
0x008377d5: cmova  r13,rdi
0x008377d9: xorps  xmm0,xmm0
0x008377dc: movups XMMWORD PTR [rsp+0x50],xmm0
0x008377e1: lea    r12,[r14+0x2]
0x008377e5: lea    r15,[rsp+0x50]
0x008377ea: cmp    r12,0xf
0x008377ee: jbe    0x14083781e
0x008377f0: mov    rbx,r12
0x008377f3: or     rbx,0xf
0x008377f7: cmp    rbx,rcx
0x008377fa: jbe    0x140837801
0x008377fc: mov    rbx,rcx
0x008377ff: jmp    0x14083780d
0x00837801: mov    eax,0x16
0x00837806: cmp    rbx,rax
0x00837809: cmovb  rbx,rax
0x0083780d: lea    rcx,[rbx+0x1]
0x00837811: call   0x140070760
0x00837816: mov    r15,rax
0x00837819: mov    QWORD PTR [rsp+0x50],rax
0x0083781e: mov    QWORD PTR [rsp+0x60],r12
0x00837823: mov    QWORD PTR [rsp+0x68],rbx
0x00837828: mov    r8,r14
0x0083782b: mov    rdx,r13
0x0083782e: mov    rcx,r15
0x00837831: call   0x1415359e8
0x00837836: mov    WORD PTR [r14+r15*1],0x2820 ; inline=" ("
0x0083783d: mov    BYTE PTR [r15+r12*1],0x0
0x00837842: lea    rdx,[rsp+0x50]
0x00837847: cmp    QWORD PTR [rsp+0x68],0xf
0x0083784d: cmova  rdx,QWORD PTR [rsp+0x50]
0x00837853: mov    r8,QWORD PTR [rsp+0x60]
0x00837858: mov    rbx,QWORD PTR [rsp+0x48]
0x0083785d: mov    rcx,rbx
0x00837860: call   0x14006f9a0
0x00837865: nop
0x00837866: mov    rdx,QWORD PTR [rsp+0x68]
0x0083786b: cmp    rdx,0xf
0x0083786f: jbe    0x1408378a6
0x00837871: inc    rdx
0x00837874: mov    rcx,QWORD PTR [rsp+0x50]
0x00837879: mov    rax,rcx
0x0083787c: cmp    rdx,0x1000
0x00837883: jb     0x1408378a1
0x00837885: add    rdx,0x27
0x00837889: mov    rcx,QWORD PTR [rcx-0x8]
0x0083788d: sub    rax,rcx
0x00837890: add    rax,0xfffffffffffffff8
0x00837894: cmp    rax,0x1f
0x00837898: jbe    0x1408378a1
0x0083789a: call   QWORD PTR [rip+0xda9200]        # 0x1415e0aa0
0x008378a0: int3
0x008378a1: call   0x1415345f0
0x008378a6: mov    QWORD PTR [rsp+0x30],rbx
0x008378ab: movzx  eax,WORD PTR [rsi+0x14]
0x008378af: mov    WORD PTR [rsp+0x28],ax
0x008378b4: movzx  eax,WORD PTR [rsi+0x12]
0x008378b8: mov    WORD PTR [rsp+0x20],ax
0x008378bd: movzx  r9d,WORD PTR [rsi+0x10]
0x008378c2: movzx  r8d,WORD PTR [rsi+0x1a]
0x008378c7: movzx  edx,WORD PTR [rsi+0x18]
0x008378cb: movzx  ecx,WORD PTR [rsi+0x16]
0x008378cf: call   0x14074cc40
0x008378d4: mov    r8d,0x1
0x008378da: lea    rdx,[rip+0xdd89f7]        # 0x1416102d8 ; literal=")"
0x008378e1: mov    rcx,rbx
0x008378e4: call   0x14006f9a0
0x008378e9: nop
0x008378ea: cmp    rbp,0xf
0x008378ee: jbe    0x140837924
0x008378f0: lea    rdx,[rbp+0x1]
0x008378f4: mov    rax,rdi
0x008378f7: cmp    rdx,0x1000
0x008378fe: jb     0x14083791c
0x00837900: add    rdx,0x27
0x00837904: mov    rdi,QWORD PTR [rdi-0x8]
0x00837908: sub    rax,rdi
0x0083790b: add    rax,0xfffffffffffffff8
0x0083790f: cmp    rax,0x1f
0x00837913: jbe    0x14083791c
0x00837915: call   QWORD PTR [rip+0xda9185]        # 0x1415e0aa0
0x0083791b: int3
0x0083791c: mov    rcx,rdi
0x0083791f: call   0x1415345f0
0x00837924: mov    rcx,QWORD PTR [rsp+0x90]
0x0083792c: xor    rcx,rsp
0x0083792f: call   0x1415345d0
0x00837934: mov    rbx,QWORD PTR [rsp+0xf0]
0x0083793c: add    rsp,0xa0
0x00837943: pop    r15
0x00837945: pop    r14
0x00837947: pop    r13
0x00837949: pop    r12
0x0083794b: pop    rdi
0x0083794c: pop    rsi
0x0083794d: pop    rbp
0x0083794e: ret
0x0083794f: call   0x140065820
0x00837954: nop

# classic PE:6a70b91c:0270a000; adventure_environment_pickup_ignite_vegst+8; RVA 0x837960..0x837bb0
0x00837960: mov    QWORD PTR [rsp+0x18],rbx
0x00837965: mov    QWORD PTR [rsp+0x20],rbp
0x0083796a: push   rsi
0x0083796b: push   rdi
0x0083796c: push   r12
0x0083796e: push   r14
0x00837970: push   r15
0x00837972: sub    rsp,0x90
0x00837979: mov    rax,QWORD PTR [rip+0x105e6c0]        # 0x141896040
0x00837980: xor    rax,rsp
0x00837983: mov    QWORD PTR [rsp+0x88],rax
0x0083798b: mov    r12,rdx
0x0083798e: mov    rdi,rcx
0x00837991: xor    ebx,ebx
0x00837993: mov    r8d,0x7
0x00837999: lea    rdx,[rip+0xe74550]        # 0x1416abef0 ; literal="Ignite "
0x008379a0: mov    rcx,r12
0x008379a3: call   0x14006f860
0x008379a8: xorps  xmm0,xmm0
0x008379ab: movups XMMWORD PTR [rsp+0x68],xmm0
0x008379b0: mov    QWORD PTR [rsp+0x78],rbx
0x008379b5: mov    ebx,0xf
0x008379ba: mov    QWORD PTR [rsp+0x80],rbx
0x008379c2: mov    BYTE PTR [rsp+0x68],0x0
0x008379c7: mov    BYTE PTR [rsp+0x28],0x0
0x008379cc: movzx  eax,WORD PTR [rdi+0x14]
0x008379d0: mov    WORD PTR [rsp+0x20],ax
0x008379d5: movzx  r9d,WORD PTR [rdi+0x12]
0x008379da: movzx  r8d,WORD PTR [rdi+0x10]
0x008379df: lea    rdx,[rsp+0x68]
0x008379e4: lea    rcx,[rip+0x1b939f5]        # 0x1423cb3e0
0x008379eb: call   0x140e782a0
0x008379f0: mov    eax,0xffff8ad0
0x008379f5: cmp    WORD PTR [rdi+0x16],ax
0x008379f9: je     0x140837b3b
0x008379ff: mov    rbp,QWORD PTR [rsp+0x78]
0x00837a04: movabs rcx,0x7fffffffffffffff
0x00837a0e: mov    rax,rcx
0x00837a11: sub    rax,rbp
0x00837a14: cmp    rax,0x2
0x00837a18: jb     0x140837baa
0x00837a1e: lea    r15,[rsp+0x68]
0x00837a23: cmp    QWORD PTR [rsp+0x80],rbx
0x00837a2b: cmova  r15,QWORD PTR [rsp+0x68]
0x00837a31: xorps  xmm0,xmm0
0x00837a34: movups XMMWORD PTR [rsp+0x48],xmm0
0x00837a39: lea    r14,[rbp+0x2]
0x00837a3d: lea    rsi,[rsp+0x48]
0x00837a42: cmp    r14,rbx
0x00837a45: jbe    0x140837a75
0x00837a47: mov    rbx,r14
0x00837a4a: or     rbx,0xf
0x00837a4e: cmp    rbx,rcx
0x00837a51: jbe    0x140837a58
0x00837a53: mov    rbx,rcx
0x00837a56: jmp    0x140837a64
0x00837a58: mov    eax,0x16
0x00837a5d: cmp    rbx,rax
0x00837a60: cmovb  rbx,rax
0x00837a64: lea    rcx,[rbx+0x1]
0x00837a68: call   0x140070760
0x00837a6d: mov    rsi,rax
0x00837a70: mov    QWORD PTR [rsp+0x48],rax
0x00837a75: mov    QWORD PTR [rsp+0x58],r14
0x00837a7a: mov    QWORD PTR [rsp+0x60],rbx
0x00837a7f: mov    r8,rbp
0x00837a82: mov    rdx,r15
0x00837a85: mov    rcx,rsi
0x00837a88: call   0x1415359e8
0x00837a8d: mov    WORD PTR [rsi+rbp*1],0x2820 ; inline=" ("
0x00837a93: mov    BYTE PTR [rsi+r14*1],0x0
0x00837a98: lea    rdx,[rsp+0x48]
0x00837a9d: cmp    QWORD PTR [rsp+0x60],0xf
0x00837aa3: cmova  rdx,QWORD PTR [rsp+0x48]
0x00837aa9: mov    r8,QWORD PTR [rsp+0x58]
0x00837aae: mov    rcx,r12
0x00837ab1: call   0x14006f9a0
0x00837ab6: nop
0x00837ab7: mov    rdx,QWORD PTR [rsp+0x60]
0x00837abc: cmp    rdx,0xf
0x00837ac0: jbe    0x140837af7
0x00837ac2: inc    rdx
0x00837ac5: mov    rcx,QWORD PTR [rsp+0x48]
0x00837aca: mov    rax,rcx
0x00837acd: cmp    rdx,0x1000
0x00837ad4: jb     0x140837af2
0x00837ad6: add    rdx,0x27
0x00837ada: mov    rcx,QWORD PTR [rcx-0x8]
0x00837ade: sub    rax,rcx
0x00837ae1: add    rax,0xfffffffffffffff8
0x00837ae5: cmp    rax,0x1f
0x00837ae9: jbe    0x140837af2
0x00837aeb: call   QWORD PTR [rip+0xda8faf]        # 0x1415e0aa0
0x00837af1: int3
0x00837af2: call   0x1415345f0
0x00837af7: mov    QWORD PTR [rsp+0x30],r12
0x00837afc: movzx  eax,WORD PTR [rdi+0x14]
0x00837b00: mov    WORD PTR [rsp+0x28],ax
0x00837b05: movzx  eax,WORD PTR [rdi+0x12]
0x00837b09: mov    WORD PTR [rsp+0x20],ax
0x00837b0e: movzx  r9d,WORD PTR [rdi+0x10]
0x00837b13: movzx  r8d,WORD PTR [rdi+0x1a]
0x00837b18: movzx  edx,WORD PTR [rdi+0x18]
0x00837b1c: movzx  ecx,WORD PTR [rdi+0x16]
0x00837b20: call   0x14074cc40
0x00837b25: mov    r8d,0x1
0x00837b2b: lea    rdx,[rip+0xdd87a6]        # 0x1416102d8 ; literal=")"
0x00837b32: mov    rcx,r12
0x00837b35: call   0x14006f9a0
0x00837b3a: nop
0x00837b3b: mov    rdx,QWORD PTR [rsp+0x80]
0x00837b43: cmp    rdx,0xf
0x00837b47: jbe    0x140837b7e
0x00837b49: inc    rdx
0x00837b4c: mov    rcx,QWORD PTR [rsp+0x68]
0x00837b51: mov    rax,rcx
0x00837b54: cmp    rdx,0x1000
0x00837b5b: jb     0x140837b79
0x00837b5d: add    rdx,0x27
0x00837b61: mov    rcx,QWORD PTR [rcx-0x8]
0x00837b65: sub    rax,rcx
0x00837b68: add    rax,0xfffffffffffffff8
0x00837b6c: cmp    rax,0x1f
0x00837b70: jbe    0x140837b79
0x00837b72: call   QWORD PTR [rip+0xda8f28]        # 0x1415e0aa0
0x00837b78: int3
0x00837b79: call   0x1415345f0
0x00837b7e: mov    rcx,QWORD PTR [rsp+0x88]
0x00837b86: xor    rcx,rsp
0x00837b89: call   0x1415345d0
0x00837b8e: lea    r11,[rsp+0x90]
0x00837b96: mov    rbx,QWORD PTR [r11+0x40]
0x00837b9a: mov    rbp,QWORD PTR [r11+0x48]
0x00837b9e: mov    rsp,r11
0x00837ba1: pop    r15
0x00837ba3: pop    r14
0x00837ba5: pop    r12
0x00837ba7: pop    rdi
0x00837ba8: pop    rsi
0x00837ba9: ret
0x00837baa: call   0x140065820
0x00837baf: nop

# classic PE:6a70b91c:0270a000; adventure_environment_pickup_make_campfirest+8; RVA 0x837bb0..0x837c43
0x00837bb0: mov    QWORD PTR [rsp+0x8],rbx
0x00837bb5: push   rdi
0x00837bb6: sub    rsp,0x40
0x00837bba: mov    rdi,rdx
0x00837bbd: mov    rbx,rcx
0x00837bc0: mov    rcx,rdi
0x00837bc3: lea    rdx,[rip+0xe742d6]        # 0x1416abea0 ; literal="Make Campfire"
0x00837bca: mov    r8d,0xd
0x00837bd0: call   0x14006f860
0x00837bd5: mov    eax,0xffff8ad0
0x00837bda: cmp    WORD PTR [rbx+0x16],ax
0x00837bde: je     0x140837c38
0x00837be0: mov    r8d,0x2
0x00837be6: lea    rdx,[rip+0xdd86ab]        # 0x141610298 ; literal=" ("
0x00837bed: mov    rcx,rdi
0x00837bf0: call   0x14006f9a0
0x00837bf5: movzx  eax,WORD PTR [rbx+0x14]
0x00837bf9: movzx  r9d,WORD PTR [rbx+0x10]
0x00837bfe: movzx  r8d,WORD PTR [rbx+0x1a]
0x00837c03: movzx  edx,WORD PTR [rbx+0x18]
0x00837c07: movzx  ecx,WORD PTR [rbx+0x16]
0x00837c0b: mov    QWORD PTR [rsp+0x30],rdi
0x00837c10: mov    WORD PTR [rsp+0x28],ax
0x00837c15: movzx  eax,WORD PTR [rbx+0x12]
0x00837c19: mov    WORD PTR [rsp+0x20],ax
0x00837c1e: call   0x14074cc40
0x00837c23: mov    r8d,0x1
0x00837c29: lea    rdx,[rip+0xdd86a8]        # 0x1416102d8 ; literal=")"
0x00837c30: mov    rcx,rdi
0x00837c33: call   0x14006f9a0
0x00837c38: mov    rbx,QWORD PTR [rsp+0x50]
0x00837c3d: add    rsp,0x40
0x00837c41: pop    rdi
0x00837c42: ret

# classic PE:6a70b91c:0270a000; adventure_environment_pickup_chop_treest+8; RVA 0x837c50..0x837d54
0x00837c50: mov    QWORD PTR [rsp+0x8],rbx
0x00837c55: push   rdi
0x00837c56: sub    rsp,0x40
0x00837c5a: mov    rdi,rdx
0x00837c5d: mov    rbx,rcx
0x00837c60: mov    rcx,rdi
0x00837c63: lea    rdx,[rip+0xe7422e]        # 0x1416abe98 ; literal="Fell "
0x00837c6a: mov    r8d,0x5
0x00837c70: call   0x14006f860
0x00837c75: movzx  r9d,WORD PTR [rbx+0x14]
0x00837c7a: movzx  r8d,WORD PTR [rbx+0x12]
0x00837c7f: movzx  edx,WORD PTR [rbx+0x10]
0x00837c83: call   0x1413faa60
0x00837c88: test   rax,rax
0x00837c8b: je     0x140837cd1
0x00837c8d: movsx  rax,WORD PTR [rax+0x2]
0x00837c92: test   ax,ax
0x00837c95: js     0x140837cd1
0x00837c97: mov    rcx,QWORD PTR [rip+0x1caeb4a]        # 0x1424e67e8
0x00837c9e: mov    rdx,rax
0x00837ca1: mov    rax,QWORD PTR [rip+0x1caeb48]        # 0x1424e67f0
0x00837ca8: sub    rax,rcx
0x00837cab: sar    rax,0x3
0x00837caf: cmp    rdx,rax
0x00837cb2: jae    0x140837cd1
0x00837cb4: mov    rdx,QWORD PTR [rcx+rdx*8]
0x00837cb8: test   rdx,rdx
0x00837cbb: je     0x140837cd1
0x00837cbd: mov    r8,QWORD PTR [rdx+0x60]
0x00837cc1: add    rdx,0x50
0x00837cc5: cmp    QWORD PTR [rdx+0x18],0xf
0x00837cca: jbe    0x140837cde
0x00837ccc: mov    rdx,QWORD PTR [rdx]
0x00837ccf: jmp    0x140837cde
0x00837cd1: lea    rdx,[rip+0xe741fc]        # 0x1416abed4 ; literal="tree"
0x00837cd8: mov    r8d,0x4
0x00837cde: mov    rcx,rdi
0x00837ce1: call   0x14006f9a0
0x00837ce6: mov    eax,0xffff8ad0
0x00837ceb: cmp    WORD PTR [rbx+0x16],ax
0x00837cef: je     0x140837d49
0x00837cf1: mov    r8d,0x2
0x00837cf7: lea    rdx,[rip+0xdd859a]        # 0x141610298 ; literal=" ("
0x00837cfe: mov    rcx,rdi
0x00837d01: call   0x14006f9a0
0x00837d06: movzx  eax,WORD PTR [rbx+0x14]
0x00837d0a: movzx  r9d,WORD PTR [rbx+0x10]
0x00837d0f: movzx  r8d,WORD PTR [rbx+0x1a]
0x00837d14: movzx  edx,WORD PTR [rbx+0x18]
0x00837d18: movzx  ecx,WORD PTR [rbx+0x16]
0x00837d1c: mov    QWORD PTR [rsp+0x30],rdi
0x00837d21: mov    WORD PTR [rsp+0x28],ax
0x00837d26: movzx  eax,WORD PTR [rbx+0x12]
0x00837d2a: mov    WORD PTR [rsp+0x20],ax
0x00837d2f: call   0x14074cc40
0x00837d34: mov    r8d,0x1
0x00837d3a: lea    rdx,[rip+0xdd8597]        # 0x1416102d8 ; literal=")"
0x00837d41: mov    rcx,rdi
0x00837d44: call   0x14006f9a0
0x00837d49: mov    rbx,QWORD PTR [rsp+0x50]
0x00837d4e: add    rsp,0x40
0x00837d52: pop    rdi
0x00837d53: ret

# classic PE:6a70b91c:0270a000; adventure_movement_attack_creaturest+8; RVA 0x83d680..0x83d8a7
0x0083d680: mov    QWORD PTR [rsp+0x8],rbx
0x0083d685: mov    QWORD PTR [rsp+0x18],rsi
0x0083d68a: push   rdi
0x0083d68b: sub    rsp,0x70
0x0083d68f: mov    rax,QWORD PTR [rip+0x10589aa]        # 0x141896040
0x0083d696: xor    rax,rsp
0x0083d699: mov    QWORD PTR [rsp+0x60],rax
0x0083d69e: mov    rdi,rdx
0x0083d6a1: mov    rbx,rcx
0x0083d6a4: mov    rax,QWORD PTR [rcx+0x28]
0x0083d6a8: sub    rax,QWORD PTR [rcx+0x20]
0x0083d6ac: mov    rcx,rdx
0x0083d6af: test   rax,0xfffffffffffffffc
0x0083d6b5: jne    0x14083d6ce
0x0083d6b7: mov    r8d,0xc
0x0083d6bd: lea    rdx,[rip+0xe6e754]        # 0x1416abe18 ; literal="Attack error"
0x0083d6c4: call   0x14006f860
0x0083d6c9: jmp    0x14083d888
0x0083d6ce: mov    r8d,0x7
0x0083d6d4: lea    rdx,[rip+0xe3b94d]        # 0x141679028 ; literal="Attack "
0x0083d6db: call   0x14006f860
0x0083d6e0: mov    r11,QWORD PTR [rbx+0x20]
0x0083d6e4: mov    rax,QWORD PTR [rbx+0x28]
0x0083d6e8: sub    rax,r11
0x0083d6eb: and    rax,0xfffffffffffffffc
0x0083d6ef: cmp    rax,0x4
0x0083d6f3: jne    0x14083d810
0x0083d6f9: mov    r11d,DWORD PTR [r11]
0x0083d6fc: mov    r9,QWORD PTR [rip+0x1ba18a5]        # 0x1423defa8
0x0083d703: mov    rsi,QWORD PTR [rip+0x1ba1896]        # 0x1423defa0
0x0083d70a: sub    r9,rsi
0x0083d70d: sar    r9,0x3
0x0083d711: test   r9d,r9d
0x0083d714: je     0x14083d75a
0x0083d716: cmp    r11d,0xffffffff
0x0083d71a: je     0x14083d75a
0x0083d71c: xor    edx,edx
0x0083d71e: sub    r9d,0x1
0x0083d722: js     0x14083d75a
0x0083d724: nop    DWORD PTR [rax+0x0]
0x0083d728: nop    DWORD PTR [rax+rax*1+0x0]
0x0083d730: lea    ecx,[rdx+r9*1]
0x0083d734: sar    ecx,1
0x0083d736: movsxd rax,ecx
0x0083d739: mov    r10,QWORD PTR [rsi+rax*8]
0x0083d73d: cmp    DWORD PTR [r10+0x130],r11d
0x0083d744: je     0x14083d75d
0x0083d746: lea    eax,[rcx+0x1]
0x0083d749: cmovle edx,eax
0x0083d74c: lea    eax,[rcx-0x1]
0x0083d74f: cmovle eax,r9d
0x0083d753: mov    r9d,eax
0x0083d756: cmp    edx,eax
0x0083d758: jle    0x14083d730
0x0083d75a: xor    r10d,r10d
0x0083d75d: test   r10,r10
0x0083d760: je     0x14083d801
0x0083d766: xorps  xmm0,xmm0
0x0083d769: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083d76e: mov    QWORD PTR [rsp+0x50],0x0
0x0083d777: mov    QWORD PTR [rsp+0x58],0xf
0x0083d780: mov    BYTE PTR [rsp+0x40],0x0
0x0083d785: mov    BYTE PTR [rsp+0x20],0x1
0x0083d78a: xor    r9d,r9d
0x0083d78d: mov    r8d,0x1
0x0083d793: lea    rdx,[rsp+0x40]
0x0083d798: mov    rcx,r10
0x0083d79b: call   0x1413293a0
0x0083d7a0: lea    rdx,[rsp+0x40]
0x0083d7a5: cmp    QWORD PTR [rsp+0x58],0xf
0x0083d7ab: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083d7b1: mov    r8,QWORD PTR [rsp+0x50]
0x0083d7b6: mov    rcx,rdi
0x0083d7b9: call   0x14006f9a0
0x0083d7be: nop
0x0083d7bf: mov    rdx,QWORD PTR [rsp+0x58]
0x0083d7c4: cmp    rdx,0xf
0x0083d7c8: jbe    0x14083d825
0x0083d7ca: inc    rdx
0x0083d7cd: mov    rcx,QWORD PTR [rsp+0x40]
0x0083d7d2: mov    rax,rcx
0x0083d7d5: cmp    rdx,0x1000
0x0083d7dc: jb     0x14083d7fa
0x0083d7de: add    rdx,0x27
0x0083d7e2: mov    rcx,QWORD PTR [rcx-0x8]
0x0083d7e6: sub    rax,rcx
0x0083d7e9: add    rax,0xfffffffffffffff8
0x0083d7ed: cmp    rax,0x1f
0x0083d7f1: jbe    0x14083d7fa
0x0083d7f3: call   QWORD PTR [rip+0xda32a7]        # 0x1415e0aa0
0x0083d7f9: int3
0x0083d7fa: call   0x1415345f0
0x0083d7ff: jmp    0x14083d825
0x0083d801: mov    r8d,0x8
0x0083d807: lea    rdx,[rip+0xe2052a]        # 0x14165dd38 ; literal="creature"
0x0083d80e: jmp    0x14083d81d
0x0083d810: mov    r8d,0x9
0x0083d816: lea    rdx,[rip+0xe2de83]        # 0x14166b6a0 ; literal="creatures"
0x0083d81d: mov    rcx,rdi
0x0083d820: call   0x14006f9a0
0x0083d825: mov    eax,0xffff8ad0
0x0083d82a: cmp    WORD PTR [rbx+0x16],ax
0x0083d82e: je     0x14083d888
0x0083d830: mov    r8d,0x2
0x0083d836: lea    rdx,[rip+0xdd2a5b]        # 0x141610298 ; literal=" ("
0x0083d83d: mov    rcx,rdi
0x0083d840: call   0x14006f9a0
0x0083d845: mov    QWORD PTR [rsp+0x30],rdi
0x0083d84a: movzx  eax,WORD PTR [rbx+0x14]
0x0083d84e: mov    WORD PTR [rsp+0x28],ax
0x0083d853: movzx  eax,WORD PTR [rbx+0x12]
0x0083d857: mov    WORD PTR [rsp+0x20],ax
0x0083d85c: movzx  r9d,WORD PTR [rbx+0x10]
0x0083d861: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083d866: movzx  edx,WORD PTR [rbx+0x18]
0x0083d86a: movzx  ecx,WORD PTR [rbx+0x16]
0x0083d86e: call   0x14074cc40
0x0083d873: mov    r8d,0x1
0x0083d879: lea    rdx,[rip+0xdd2a58]        # 0x1416102d8 ; literal=")"
0x0083d880: mov    rcx,rdi
0x0083d883: call   0x14006f9a0
0x0083d888: mov    rcx,QWORD PTR [rsp+0x60]
0x0083d88d: xor    rcx,rsp
0x0083d890: call   0x1415345d0
0x0083d895: lea    r11,[rsp+0x70]
0x0083d89a: mov    rbx,QWORD PTR [r11+0x10]
0x0083d89e: mov    rsi,QWORD PTR [r11+0x20]
0x0083d8a2: mov    rsp,r11
0x0083d8a5: pop    rdi
0x0083d8a6: ret

# classic PE:6a70b91c:0270a000; adventure_movement_combat_menu_creaturest+8; RVA 0x83d8b0..0x83da9a
0x0083d8b0: mov    QWORD PTR [rsp+0x8],rbx
0x0083d8b5: mov    QWORD PTR [rsp+0x18],rsi
0x0083d8ba: push   rdi
0x0083d8bb: sub    rsp,0x70
0x0083d8bf: mov    rax,QWORD PTR [rip+0x105877a]        # 0x141896040
0x0083d8c6: xor    rax,rsp
0x0083d8c9: mov    QWORD PTR [rsp+0x60],rax
0x0083d8ce: mov    rdi,rdx
0x0083d8d1: mov    rbx,rcx
0x0083d8d4: cmp    DWORD PTR [rcx+0x20],0xffffffff
0x0083d8d8: mov    rcx,rdx
0x0083d8db: jne    0x14083d8f4
0x0083d8dd: mov    r8d,0xc
0x0083d8e3: lea    rdx,[rip+0xe6e51e]        # 0x1416abe08 ; literal="Combat error"
0x0083d8ea: call   0x14006f860
0x0083d8ef: jmp    0x14083da7b
0x0083d8f4: mov    r8d,0x7
0x0083d8fa: lea    rdx,[rip+0xe6e52f]        # 0x1416abe30 ; literal="Combat "
0x0083d901: call   0x14006f860
0x0083d906: mov    r11d,DWORD PTR [rbx+0x20]
0x0083d90a: mov    r9,QWORD PTR [rip+0x1ba1697]        # 0x1423defa8
0x0083d911: mov    rsi,QWORD PTR [rip+0x1ba1688]        # 0x1423defa0
0x0083d918: sub    r9,rsi
0x0083d91b: sar    r9,0x3
0x0083d91f: test   r9d,r9d
0x0083d922: je     0x14083d95c
0x0083d924: cmp    r11d,0xffffffff
0x0083d928: je     0x14083d95c
0x0083d92a: xor    edx,edx
0x0083d92c: sub    r9d,0x1
0x0083d930: js     0x14083d95c
0x0083d932: lea    ecx,[rdx+r9*1]
0x0083d936: sar    ecx,1
0x0083d938: movsxd rax,ecx
0x0083d93b: mov    r10,QWORD PTR [rsi+rax*8]
0x0083d93f: cmp    DWORD PTR [r10+0x130],r11d
0x0083d946: je     0x14083d95f
0x0083d948: lea    eax,[rcx+0x1]
0x0083d94b: cmovle edx,eax
0x0083d94e: lea    eax,[rcx-0x1]
0x0083d951: cmovle eax,r9d
0x0083d955: mov    r9d,eax
0x0083d958: cmp    edx,eax
0x0083d95a: jle    0x14083d932
0x0083d95c: xor    r10d,r10d
0x0083d95f: test   r10,r10
0x0083d962: je     0x14083da03
0x0083d968: xorps  xmm0,xmm0
0x0083d96b: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083d970: mov    QWORD PTR [rsp+0x50],0x0
0x0083d979: mov    QWORD PTR [rsp+0x58],0xf
0x0083d982: mov    BYTE PTR [rsp+0x40],0x0
0x0083d987: mov    BYTE PTR [rsp+0x20],0x1
0x0083d98c: xor    r9d,r9d
0x0083d98f: mov    r8d,0x1
0x0083d995: lea    rdx,[rsp+0x40]
0x0083d99a: mov    rcx,r10
0x0083d99d: call   0x1413293a0
0x0083d9a2: lea    rdx,[rsp+0x40]
0x0083d9a7: cmp    QWORD PTR [rsp+0x58],0xf
0x0083d9ad: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083d9b3: mov    r8,QWORD PTR [rsp+0x50]
0x0083d9b8: mov    rcx,rdi
0x0083d9bb: call   0x14006f9a0
0x0083d9c0: nop
0x0083d9c1: mov    rdx,QWORD PTR [rsp+0x58]
0x0083d9c6: cmp    rdx,0xf
0x0083d9ca: jbe    0x14083da18
0x0083d9cc: inc    rdx
0x0083d9cf: mov    rcx,QWORD PTR [rsp+0x40]
0x0083d9d4: mov    rax,rcx
0x0083d9d7: cmp    rdx,0x1000
0x0083d9de: jb     0x14083d9fc
0x0083d9e0: add    rdx,0x27
0x0083d9e4: mov    rcx,QWORD PTR [rcx-0x8]
0x0083d9e8: sub    rax,rcx
0x0083d9eb: add    rax,0xfffffffffffffff8
0x0083d9ef: cmp    rax,0x1f
0x0083d9f3: jbe    0x14083d9fc
0x0083d9f5: call   QWORD PTR [rip+0xda30a5]        # 0x1415e0aa0
0x0083d9fb: int3
0x0083d9fc: call   0x1415345f0
0x0083da01: jmp    0x14083da18
0x0083da03: mov    r8d,0x8
0x0083da09: lea    rdx,[rip+0xe20328]        # 0x14165dd38 ; literal="creature"
0x0083da10: mov    rcx,rdi
0x0083da13: call   0x14006f9a0
0x0083da18: mov    eax,0xffff8ad0
0x0083da1d: cmp    WORD PTR [rbx+0x16],ax
0x0083da21: je     0x14083da7b
0x0083da23: mov    r8d,0x2
0x0083da29: lea    rdx,[rip+0xdd2868]        # 0x141610298 ; literal=" ("
0x0083da30: mov    rcx,rdi
0x0083da33: call   0x14006f9a0
0x0083da38: mov    QWORD PTR [rsp+0x30],rdi
0x0083da3d: movzx  eax,WORD PTR [rbx+0x14]
0x0083da41: mov    WORD PTR [rsp+0x28],ax
0x0083da46: movzx  eax,WORD PTR [rbx+0x12]
0x0083da4a: mov    WORD PTR [rsp+0x20],ax
0x0083da4f: movzx  r9d,WORD PTR [rbx+0x10]
0x0083da54: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083da59: movzx  edx,WORD PTR [rbx+0x18]
0x0083da5d: movzx  ecx,WORD PTR [rbx+0x16]
0x0083da61: call   0x14074cc40
0x0083da66: mov    r8d,0x1
0x0083da6c: lea    rdx,[rip+0xdd2865]        # 0x1416102d8 ; literal=")"
0x0083da73: mov    rcx,rdi
0x0083da76: call   0x14006f9a0
0x0083da7b: mov    rcx,QWORD PTR [rsp+0x60]
0x0083da80: xor    rcx,rsp
0x0083da83: call   0x1415345d0
0x0083da88: lea    r11,[rsp+0x70]
0x0083da8d: mov    rbx,QWORD PTR [r11+0x10]
0x0083da91: mov    rsi,QWORD PTR [r11+0x20]
0x0083da95: mov    rsp,r11
0x0083da98: pop    rdi
0x0083da99: ret

# classic PE:6a70b91c:0270a000; adventure_movement_item_interact_pushst+8; RVA 0x83daa0..0x83dc5b
0x0083daa0: mov    QWORD PTR [rsp+0x8],rbx
0x0083daa5: mov    QWORD PTR [rsp+0x18],rsi
0x0083daaa: push   rdi
0x0083daab: sub    rsp,0x70
0x0083daaf: mov    rax,QWORD PTR [rip+0x105858a]        # 0x141896040
0x0083dab6: xor    rax,rsp
0x0083dab9: mov    QWORD PTR [rsp+0x60],rax
0x0083dabe: mov    rsi,rdx
0x0083dac1: mov    rbx,rcx
0x0083dac4: mov    r8d,0x5
0x0083daca: lea    rdx,[rip+0xe6e357]        # 0x1416abe28 ; literal="Push "
0x0083dad1: mov    rcx,rsi
0x0083dad4: call   0x14006f860
0x0083dad9: mov    r11d,DWORD PTR [rbx+0x20]
0x0083dadd: mov    r9,QWORD PTR [rip+0x1ba1864]        # 0x1423df348
0x0083dae4: mov    rdi,QWORD PTR [rip+0x1ba1855]        # 0x1423df340
0x0083daeb: sub    r9,rdi
0x0083daee: sar    r9,0x3
0x0083daf2: test   r9d,r9d
0x0083daf5: je     0x14083db37
0x0083daf7: cmp    r11d,0xffffffff
0x0083dafb: je     0x14083db37
0x0083dafd: xor    edx,edx
0x0083daff: sub    r9d,0x1
0x0083db03: js     0x14083db37
0x0083db05: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083db10: lea    ecx,[rdx+r9*1]
0x0083db14: sar    ecx,1
0x0083db16: movsxd rax,ecx
0x0083db19: mov    r10,QWORD PTR [rdi+rax*8]
0x0083db1d: cmp    DWORD PTR [r10+0x1c],r11d
0x0083db21: je     0x14083db3a
0x0083db23: lea    eax,[rcx+0x1]
0x0083db26: cmovle edx,eax
0x0083db29: lea    eax,[rcx-0x1]
0x0083db2c: cmovle eax,r9d
0x0083db30: mov    r9d,eax
0x0083db33: cmp    edx,eax
0x0083db35: jle    0x14083db10
0x0083db37: xor    r10d,r10d
0x0083db3a: test   r10,r10
0x0083db3d: je     0x14083dbd9
0x0083db43: xorps  xmm0,xmm0
0x0083db46: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083db4b: mov    QWORD PTR [rsp+0x50],0x0
0x0083db54: mov    QWORD PTR [rsp+0x58],0xf
0x0083db5d: mov    BYTE PTR [rsp+0x40],0x0
0x0083db62: mov    r9d,0xffffffff
0x0083db68: xor    r8d,r8d
0x0083db6b: lea    rdx,[rsp+0x40]
0x0083db70: mov    rcx,r10
0x0083db73: call   0x140c62490
0x0083db78: lea    rdx,[rsp+0x40]
0x0083db7d: cmp    QWORD PTR [rsp+0x58],0xf
0x0083db83: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083db89: mov    r8,QWORD PTR [rsp+0x50]
0x0083db8e: mov    rcx,rsi
0x0083db91: call   0x14006f9a0
0x0083db96: nop
0x0083db97: mov    rdx,QWORD PTR [rsp+0x58]
0x0083db9c: cmp    rdx,0xf
0x0083dba0: jbe    0x14083dbee
0x0083dba2: inc    rdx
0x0083dba5: mov    rcx,QWORD PTR [rsp+0x40]
0x0083dbaa: mov    rax,rcx
0x0083dbad: cmp    rdx,0x1000
0x0083dbb4: jb     0x14083dbd2
0x0083dbb6: add    rdx,0x27
0x0083dbba: mov    rcx,QWORD PTR [rcx-0x8]
0x0083dbbe: sub    rax,rcx
0x0083dbc1: add    rax,0xfffffffffffffff8
0x0083dbc5: cmp    rax,0x1f
0x0083dbc9: jbe    0x14083dbd2
0x0083dbcb: call   QWORD PTR [rip+0xda2ecf]        # 0x1415e0aa0
0x0083dbd1: int3
0x0083dbd2: call   0x1415345f0
0x0083dbd7: jmp    0x14083dbee
0x0083dbd9: mov    r8d,0x4
0x0083dbdf: lea    rdx,[rip+0xdba3ca]        # 0x1415f7fb0 ; literal="item"
0x0083dbe6: mov    rcx,rsi
0x0083dbe9: call   0x14006f9a0
0x0083dbee: mov    eax,0xffff8ad0
0x0083dbf3: cmp    WORD PTR [rbx+0x16],ax
0x0083dbf7: je     0x14083dc3c
0x0083dbf9: mov    r8d,0x4
0x0083dbff: lea    rdx,[rip+0xdaa91e]        # 0x1415e8524 ; literal=" to "
0x0083dc06: mov    rcx,rsi
0x0083dc09: call   0x14006f9a0
0x0083dc0e: mov    QWORD PTR [rsp+0x30],rsi
0x0083dc13: movzx  eax,WORD PTR [rbx+0x14]
0x0083dc17: mov    WORD PTR [rsp+0x28],ax
0x0083dc1c: movzx  eax,WORD PTR [rbx+0x12]
0x0083dc20: mov    WORD PTR [rsp+0x20],ax
0x0083dc25: movzx  r9d,WORD PTR [rbx+0x10]
0x0083dc2a: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083dc2f: movzx  edx,WORD PTR [rbx+0x18]
0x0083dc33: movzx  ecx,WORD PTR [rbx+0x16]
0x0083dc37: call   0x14074cc40
0x0083dc3c: mov    rcx,QWORD PTR [rsp+0x60]
0x0083dc41: xor    rcx,rsp
0x0083dc44: call   0x1415345d0
0x0083dc49: lea    r11,[rsp+0x70]
0x0083dc4e: mov    rbx,QWORD PTR [r11+0x10]
0x0083dc52: mov    rsi,QWORD PTR [r11+0x20]
0x0083dc56: mov    rsp,r11
0x0083dc59: pop    rdi
0x0083dc5a: ret

# classic PE:6a70b91c:0270a000; adventure_movement_item_interact_ridest+8; RVA 0x83dc60..0x83de1b
0x0083dc60: mov    QWORD PTR [rsp+0x8],rbx
0x0083dc65: mov    QWORD PTR [rsp+0x18],rsi
0x0083dc6a: push   rdi
0x0083dc6b: sub    rsp,0x70
0x0083dc6f: mov    rax,QWORD PTR [rip+0x10583ca]        # 0x141896040
0x0083dc76: xor    rax,rsp
0x0083dc79: mov    QWORD PTR [rsp+0x60],rax
0x0083dc7e: mov    rsi,rdx
0x0083dc81: mov    rbx,rcx
0x0083dc84: mov    r8d,0x5
0x0083dc8a: lea    rdx,[rip+0xe6e15b]        # 0x1416abdec ; literal="Ride "
0x0083dc91: mov    rcx,rsi
0x0083dc94: call   0x14006f860
0x0083dc99: mov    r11d,DWORD PTR [rbx+0x20]
0x0083dc9d: mov    r9,QWORD PTR [rip+0x1ba16a4]        # 0x1423df348
0x0083dca4: mov    rdi,QWORD PTR [rip+0x1ba1695]        # 0x1423df340
0x0083dcab: sub    r9,rdi
0x0083dcae: sar    r9,0x3
0x0083dcb2: test   r9d,r9d
0x0083dcb5: je     0x14083dcf7
0x0083dcb7: cmp    r11d,0xffffffff
0x0083dcbb: je     0x14083dcf7
0x0083dcbd: xor    edx,edx
0x0083dcbf: sub    r9d,0x1
0x0083dcc3: js     0x14083dcf7
0x0083dcc5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083dcd0: lea    ecx,[rdx+r9*1]
0x0083dcd4: sar    ecx,1
0x0083dcd6: movsxd rax,ecx
0x0083dcd9: mov    r10,QWORD PTR [rdi+rax*8]
0x0083dcdd: cmp    DWORD PTR [r10+0x1c],r11d
0x0083dce1: je     0x14083dcfa
0x0083dce3: lea    eax,[rcx+0x1]
0x0083dce6: cmovle edx,eax
0x0083dce9: lea    eax,[rcx-0x1]
0x0083dcec: cmovle eax,r9d
0x0083dcf0: mov    r9d,eax
0x0083dcf3: cmp    edx,eax
0x0083dcf5: jle    0x14083dcd0
0x0083dcf7: xor    r10d,r10d
0x0083dcfa: test   r10,r10
0x0083dcfd: je     0x14083dd99
0x0083dd03: xorps  xmm0,xmm0
0x0083dd06: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083dd0b: mov    QWORD PTR [rsp+0x50],0x0
0x0083dd14: mov    QWORD PTR [rsp+0x58],0xf
0x0083dd1d: mov    BYTE PTR [rsp+0x40],0x0
0x0083dd22: mov    r9d,0xffffffff
0x0083dd28: xor    r8d,r8d
0x0083dd2b: lea    rdx,[rsp+0x40]
0x0083dd30: mov    rcx,r10
0x0083dd33: call   0x140c62490
0x0083dd38: lea    rdx,[rsp+0x40]
0x0083dd3d: cmp    QWORD PTR [rsp+0x58],0xf
0x0083dd43: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083dd49: mov    r8,QWORD PTR [rsp+0x50]
0x0083dd4e: mov    rcx,rsi
0x0083dd51: call   0x14006f9a0
0x0083dd56: nop
0x0083dd57: mov    rdx,QWORD PTR [rsp+0x58]
0x0083dd5c: cmp    rdx,0xf
0x0083dd60: jbe    0x14083ddae
0x0083dd62: inc    rdx
0x0083dd65: mov    rcx,QWORD PTR [rsp+0x40]
0x0083dd6a: mov    rax,rcx
0x0083dd6d: cmp    rdx,0x1000
0x0083dd74: jb     0x14083dd92
0x0083dd76: add    rdx,0x27
0x0083dd7a: mov    rcx,QWORD PTR [rcx-0x8]
0x0083dd7e: sub    rax,rcx
0x0083dd81: add    rax,0xfffffffffffffff8
0x0083dd85: cmp    rax,0x1f
0x0083dd89: jbe    0x14083dd92
0x0083dd8b: call   QWORD PTR [rip+0xda2d0f]        # 0x1415e0aa0
0x0083dd91: int3
0x0083dd92: call   0x1415345f0
0x0083dd97: jmp    0x14083ddae
0x0083dd99: mov    r8d,0x4
0x0083dd9f: lea    rdx,[rip+0xdba20a]        # 0x1415f7fb0 ; literal="item"
0x0083dda6: mov    rcx,rsi
0x0083dda9: call   0x14006f9a0
0x0083ddae: mov    eax,0xffff8ad0
0x0083ddb3: cmp    WORD PTR [rbx+0x16],ax
0x0083ddb7: je     0x14083ddfc
0x0083ddb9: mov    r8d,0x12
0x0083ddbf: lea    rdx,[rip+0xe6e012]        # 0x1416abdd8 ; literal=", push off toward "
0x0083ddc6: mov    rcx,rsi
0x0083ddc9: call   0x14006f9a0
0x0083ddce: mov    QWORD PTR [rsp+0x30],rsi
0x0083ddd3: movzx  eax,WORD PTR [rbx+0x14]
0x0083ddd7: mov    WORD PTR [rsp+0x28],ax
0x0083dddc: movzx  eax,WORD PTR [rbx+0x12]
0x0083dde0: mov    WORD PTR [rsp+0x20],ax
0x0083dde5: movzx  r9d,WORD PTR [rbx+0x10]
0x0083ddea: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083ddef: movzx  edx,WORD PTR [rbx+0x18]
0x0083ddf3: movzx  ecx,WORD PTR [rbx+0x16]
0x0083ddf7: call   0x14074cc40
0x0083ddfc: mov    rcx,QWORD PTR [rsp+0x60]
0x0083de01: xor    rcx,rsp
0x0083de04: call   0x1415345d0
0x0083de09: lea    r11,[rsp+0x70]
0x0083de0e: mov    rbx,QWORD PTR [r11+0x10]
0x0083de12: mov    rsi,QWORD PTR [r11+0x20]
0x0083de16: mov    rsp,r11
0x0083de19: pop    rdi
0x0083de1a: ret

# classic PE:6a70b91c:0270a000; adventure_movement_item_interact_guidest+8; RVA 0x83de20..0x83dfdb
0x0083de20: mov    QWORD PTR [rsp+0x8],rbx
0x0083de25: mov    QWORD PTR [rsp+0x18],rsi
0x0083de2a: push   rdi
0x0083de2b: sub    rsp,0x70
0x0083de2f: mov    rax,QWORD PTR [rip+0x105820a]        # 0x141896040
0x0083de36: xor    rax,rsp
0x0083de39: mov    QWORD PTR [rsp+0x60],rax
0x0083de3e: mov    rsi,rdx
0x0083de41: mov    rbx,rcx
0x0083de44: mov    r8d,0x6
0x0083de4a: lea    rdx,[rip+0xe6dfab]        # 0x1416abdfc ; literal="Guide "
0x0083de51: mov    rcx,rsi
0x0083de54: call   0x14006f860
0x0083de59: mov    r11d,DWORD PTR [rbx+0x20]
0x0083de5d: mov    r9,QWORD PTR [rip+0x1ba14e4]        # 0x1423df348
0x0083de64: mov    rdi,QWORD PTR [rip+0x1ba14d5]        # 0x1423df340
0x0083de6b: sub    r9,rdi
0x0083de6e: sar    r9,0x3
0x0083de72: test   r9d,r9d
0x0083de75: je     0x14083deb7
0x0083de77: cmp    r11d,0xffffffff
0x0083de7b: je     0x14083deb7
0x0083de7d: xor    edx,edx
0x0083de7f: sub    r9d,0x1
0x0083de83: js     0x14083deb7
0x0083de85: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083de90: lea    ecx,[rdx+r9*1]
0x0083de94: sar    ecx,1
0x0083de96: movsxd rax,ecx
0x0083de99: mov    r10,QWORD PTR [rdi+rax*8]
0x0083de9d: cmp    DWORD PTR [r10+0x1c],r11d
0x0083dea1: je     0x14083deba
0x0083dea3: lea    eax,[rcx+0x1]
0x0083dea6: cmovle edx,eax
0x0083dea9: lea    eax,[rcx-0x1]
0x0083deac: cmovle eax,r9d
0x0083deb0: mov    r9d,eax
0x0083deb3: cmp    edx,eax
0x0083deb5: jle    0x14083de90
0x0083deb7: xor    r10d,r10d
0x0083deba: test   r10,r10
0x0083debd: je     0x14083df59
0x0083dec3: xorps  xmm0,xmm0
0x0083dec6: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083decb: mov    QWORD PTR [rsp+0x50],0x0
0x0083ded4: mov    QWORD PTR [rsp+0x58],0xf
0x0083dedd: mov    BYTE PTR [rsp+0x40],0x0
0x0083dee2: mov    r9d,0xffffffff
0x0083dee8: xor    r8d,r8d
0x0083deeb: lea    rdx,[rsp+0x40]
0x0083def0: mov    rcx,r10
0x0083def3: call   0x140c62490
0x0083def8: lea    rdx,[rsp+0x40]
0x0083defd: cmp    QWORD PTR [rsp+0x58],0xf
0x0083df03: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083df09: mov    r8,QWORD PTR [rsp+0x50]
0x0083df0e: mov    rcx,rsi
0x0083df11: call   0x14006f9a0
0x0083df16: nop
0x0083df17: mov    rdx,QWORD PTR [rsp+0x58]
0x0083df1c: cmp    rdx,0xf
0x0083df20: jbe    0x14083df6e
0x0083df22: inc    rdx
0x0083df25: mov    rcx,QWORD PTR [rsp+0x40]
0x0083df2a: mov    rax,rcx
0x0083df2d: cmp    rdx,0x1000
0x0083df34: jb     0x14083df52
0x0083df36: add    rdx,0x27
0x0083df3a: mov    rcx,QWORD PTR [rcx-0x8]
0x0083df3e: sub    rax,rcx
0x0083df41: add    rax,0xfffffffffffffff8
0x0083df45: cmp    rax,0x1f
0x0083df49: jbe    0x14083df52
0x0083df4b: call   QWORD PTR [rip+0xda2b4f]        # 0x1415e0aa0
0x0083df51: int3
0x0083df52: call   0x1415345f0
0x0083df57: jmp    0x14083df6e
0x0083df59: mov    r8d,0x4
0x0083df5f: lea    rdx,[rip+0xdba04a]        # 0x1415f7fb0 ; literal="item"
0x0083df66: mov    rcx,rsi
0x0083df69: call   0x14006f9a0
0x0083df6e: mov    eax,0xffff8ad0
0x0083df73: cmp    WORD PTR [rbx+0x16],ax
0x0083df77: je     0x14083dfbc
0x0083df79: mov    r8d,0x4
0x0083df7f: lea    rdx,[rip+0xdaa59e]        # 0x1415e8524 ; literal=" to "
0x0083df86: mov    rcx,rsi
0x0083df89: call   0x14006f9a0
0x0083df8e: mov    QWORD PTR [rsp+0x30],rsi
0x0083df93: movzx  eax,WORD PTR [rbx+0x14]
0x0083df97: mov    WORD PTR [rsp+0x28],ax
0x0083df9c: movzx  eax,WORD PTR [rbx+0x12]
0x0083dfa0: mov    WORD PTR [rsp+0x20],ax
0x0083dfa5: movzx  r9d,WORD PTR [rbx+0x10]
0x0083dfaa: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083dfaf: movzx  edx,WORD PTR [rbx+0x18]
0x0083dfb3: movzx  ecx,WORD PTR [rbx+0x16]
0x0083dfb7: call   0x14074cc40
0x0083dfbc: mov    rcx,QWORD PTR [rsp+0x60]
0x0083dfc1: xor    rcx,rsp
0x0083dfc4: call   0x1415345d0
0x0083dfc9: lea    r11,[rsp+0x70]
0x0083dfce: mov    rbx,QWORD PTR [r11+0x10]
0x0083dfd2: mov    rsi,QWORD PTR [r11+0x20]
0x0083dfd6: mov    rsp,r11
0x0083dfd9: pop    rdi
0x0083dfda: ret

# classic PE:6a70b91c:0270a000; adventure_movement_building_interact_raise_well_bucketst+8; RVA 0x83dfe0..0x83e1c0
0x0083dfe0: mov    QWORD PTR [rsp+0x8],rbx
0x0083dfe5: mov    QWORD PTR [rsp+0x18],rsi
0x0083dfea: push   rdi
0x0083dfeb: sub    rsp,0x70
0x0083dfef: mov    rax,QWORD PTR [rip+0x105804a]        # 0x141896040
0x0083dff6: xor    rax,rsp
0x0083dff9: mov    QWORD PTR [rsp+0x60],rax
0x0083dffe: mov    rbx,rdx
0x0083e001: mov    rdi,rcx
0x0083e004: mov    r8d,0x6
0x0083e00a: lea    rdx,[rip+0xe6dde3]        # 0x1416abdf4 ; literal="Raise "
0x0083e011: mov    rcx,rbx
0x0083e014: call   0x14006f860
0x0083e019: mov    r11d,DWORD PTR [rdi+0x20]
0x0083e01d: mov    r10,QWORD PTR [rip+0x1ba9de4]        # 0x1423e7e08
0x0083e024: mov    rsi,QWORD PTR [rip+0x1ba9dd5]        # 0x1423e7e00
0x0083e02b: sub    r10,rsi
0x0083e02e: sar    r10,0x3
0x0083e032: test   r10,r10
0x0083e035: je     0x14083e077
0x0083e037: cmp    r11d,0xffffffff
0x0083e03b: je     0x14083e077
0x0083e03d: xor    edx,edx
0x0083e03f: sub    r10d,0x1
0x0083e043: js     0x14083e077
0x0083e045: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083e050: lea    ecx,[rdx+r10*1]
0x0083e054: sar    ecx,1
0x0083e056: movsxd rax,ecx
0x0083e059: mov    r8,QWORD PTR [rsi+rax*8]
0x0083e05d: cmp    DWORD PTR [r8+0x50],r11d
0x0083e061: je     0x14083e07a
0x0083e063: lea    eax,[rcx+0x1]
0x0083e066: cmovle edx,eax
0x0083e069: lea    eax,[rcx-0x1]
0x0083e06c: cmovle eax,r10d
0x0083e070: mov    r10d,eax
0x0083e073: cmp    edx,eax
0x0083e075: jle    0x14083e050
0x0083e077: xor    r8d,r8d
0x0083e07a: test   r8,r8
0x0083e07d: je     0x14083e114
0x0083e083: xorps  xmm0,xmm0
0x0083e086: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083e08b: mov    QWORD PTR [rsp+0x50],0x0
0x0083e094: mov    QWORD PTR [rsp+0x58],0xf
0x0083e09d: mov    BYTE PTR [rsp+0x40],0x0
0x0083e0a2: mov    rax,QWORD PTR [r8]
0x0083e0a5: lea    rdx,[rsp+0x40]
0x0083e0aa: mov    rcx,r8
0x0083e0ad: call   QWORD PTR [rax+0x188]
0x0083e0b3: lea    rdx,[rsp+0x40]
0x0083e0b8: cmp    QWORD PTR [rsp+0x58],0xf
0x0083e0be: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083e0c4: mov    r8,QWORD PTR [rsp+0x50]
0x0083e0c9: mov    rcx,rbx
0x0083e0cc: call   0x14006f9a0
0x0083e0d1: nop
0x0083e0d2: mov    rdx,QWORD PTR [rsp+0x58]
0x0083e0d7: cmp    rdx,0xf
0x0083e0db: jbe    0x14083e129
0x0083e0dd: inc    rdx
0x0083e0e0: mov    rcx,QWORD PTR [rsp+0x40]
0x0083e0e5: mov    rax,rcx
0x0083e0e8: cmp    rdx,0x1000
0x0083e0ef: jb     0x14083e10d
0x0083e0f1: add    rdx,0x27
0x0083e0f5: mov    rcx,QWORD PTR [rcx-0x8]
0x0083e0f9: sub    rax,rcx
0x0083e0fc: add    rax,0xfffffffffffffff8
0x0083e100: cmp    rax,0x1f
0x0083e104: jbe    0x14083e10d
0x0083e106: call   QWORD PTR [rip+0xda2994]        # 0x1415e0aa0
0x0083e10c: int3
0x0083e10d: call   0x1415345f0
0x0083e112: jmp    0x14083e129
0x0083e114: mov    r8d,0x8
0x0083e11a: lea    rdx,[rip+0xda8397]        # 0x1415e64b8 ; literal="building"
0x0083e121: mov    rcx,rbx
0x0083e124: call   0x14006f9a0
0x0083e129: mov    r8d,0x7
0x0083e12f: lea    rdx,[rip+0xe6daea]        # 0x1416abc20 ; literal=" bucket"
0x0083e136: mov    rcx,rbx
0x0083e139: call   0x14006f9a0
0x0083e13e: mov    eax,0xffff8ad0
0x0083e143: cmp    WORD PTR [rdi+0x16],ax
0x0083e147: je     0x14083e1a1
0x0083e149: mov    r8d,0x2
0x0083e14f: lea    rdx,[rip+0xdd2142]        # 0x141610298 ; literal=" ("
0x0083e156: mov    rcx,rbx
0x0083e159: call   0x14006f9a0
0x0083e15e: mov    QWORD PTR [rsp+0x30],rbx
0x0083e163: movzx  eax,WORD PTR [rdi+0x14]
0x0083e167: mov    WORD PTR [rsp+0x28],ax
0x0083e16c: movzx  eax,WORD PTR [rdi+0x12]
0x0083e170: mov    WORD PTR [rsp+0x20],ax
0x0083e175: movzx  r9d,WORD PTR [rdi+0x10]
0x0083e17a: movzx  r8d,WORD PTR [rdi+0x1a]
0x0083e17f: movzx  edx,WORD PTR [rdi+0x18]
0x0083e183: movzx  ecx,WORD PTR [rdi+0x16]
0x0083e187: call   0x14074cc40
0x0083e18c: mov    r8d,0x1
0x0083e192: lea    rdx,[rip+0xdd213f]        # 0x1416102d8 ; literal=")"
0x0083e199: mov    rcx,rbx
0x0083e19c: call   0x14006f9a0
0x0083e1a1: mov    rcx,QWORD PTR [rsp+0x60]
0x0083e1a6: xor    rcx,rsp
0x0083e1a9: call   0x1415345d0
0x0083e1ae: lea    r11,[rsp+0x70]
0x0083e1b3: mov    rbx,QWORD PTR [r11+0x10]
0x0083e1b7: mov    rsi,QWORD PTR [r11+0x20]
0x0083e1bb: mov    rsp,r11
0x0083e1be: pop    rdi
0x0083e1bf: ret

# classic PE:6a70b91c:0270a000; adventure_movement_building_interact_lower_well_bucketst+8; RVA 0x83e1c0..0x83e3a0
0x0083e1c0: mov    QWORD PTR [rsp+0x8],rbx
0x0083e1c5: mov    QWORD PTR [rsp+0x18],rsi
0x0083e1ca: push   rdi
0x0083e1cb: sub    rsp,0x70
0x0083e1cf: mov    rax,QWORD PTR [rip+0x1057e6a]        # 0x141896040
0x0083e1d6: xor    rax,rsp
0x0083e1d9: mov    QWORD PTR [rsp+0x60],rax
0x0083e1de: mov    rbx,rdx
0x0083e1e1: mov    rdi,rcx
0x0083e1e4: mov    r8d,0x6
0x0083e1ea: lea    rdx,[rip+0xe6da27]        # 0x1416abc18 ; literal="Lower "
0x0083e1f1: mov    rcx,rbx
0x0083e1f4: call   0x14006f860
0x0083e1f9: mov    r11d,DWORD PTR [rdi+0x20]
0x0083e1fd: mov    r10,QWORD PTR [rip+0x1ba9c04]        # 0x1423e7e08
0x0083e204: mov    rsi,QWORD PTR [rip+0x1ba9bf5]        # 0x1423e7e00
0x0083e20b: sub    r10,rsi
0x0083e20e: sar    r10,0x3
0x0083e212: test   r10,r10
0x0083e215: je     0x14083e257
0x0083e217: cmp    r11d,0xffffffff
0x0083e21b: je     0x14083e257
0x0083e21d: xor    edx,edx
0x0083e21f: sub    r10d,0x1
0x0083e223: js     0x14083e257
0x0083e225: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083e230: lea    ecx,[rdx+r10*1]
0x0083e234: sar    ecx,1
0x0083e236: movsxd rax,ecx
0x0083e239: mov    r8,QWORD PTR [rsi+rax*8]
0x0083e23d: cmp    DWORD PTR [r8+0x50],r11d
0x0083e241: je     0x14083e25a
0x0083e243: lea    eax,[rcx+0x1]
0x0083e246: cmovle edx,eax
0x0083e249: lea    eax,[rcx-0x1]
0x0083e24c: cmovle eax,r10d
0x0083e250: mov    r10d,eax
0x0083e253: cmp    edx,eax
0x0083e255: jle    0x14083e230
0x0083e257: xor    r8d,r8d
0x0083e25a: test   r8,r8
0x0083e25d: je     0x14083e2f4
0x0083e263: xorps  xmm0,xmm0
0x0083e266: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083e26b: mov    QWORD PTR [rsp+0x50],0x0
0x0083e274: mov    QWORD PTR [rsp+0x58],0xf
0x0083e27d: mov    BYTE PTR [rsp+0x40],0x0
0x0083e282: mov    rax,QWORD PTR [r8]
0x0083e285: lea    rdx,[rsp+0x40]
0x0083e28a: mov    rcx,r8
0x0083e28d: call   QWORD PTR [rax+0x188]
0x0083e293: lea    rdx,[rsp+0x40]
0x0083e298: cmp    QWORD PTR [rsp+0x58],0xf
0x0083e29e: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083e2a4: mov    r8,QWORD PTR [rsp+0x50]
0x0083e2a9: mov    rcx,rbx
0x0083e2ac: call   0x14006f9a0
0x0083e2b1: nop
0x0083e2b2: mov    rdx,QWORD PTR [rsp+0x58]
0x0083e2b7: cmp    rdx,0xf
0x0083e2bb: jbe    0x14083e309
0x0083e2bd: inc    rdx
0x0083e2c0: mov    rcx,QWORD PTR [rsp+0x40]
0x0083e2c5: mov    rax,rcx
0x0083e2c8: cmp    rdx,0x1000
0x0083e2cf: jb     0x14083e2ed
0x0083e2d1: add    rdx,0x27
0x0083e2d5: mov    rcx,QWORD PTR [rcx-0x8]
0x0083e2d9: sub    rax,rcx
0x0083e2dc: add    rax,0xfffffffffffffff8
0x0083e2e0: cmp    rax,0x1f
0x0083e2e4: jbe    0x14083e2ed
0x0083e2e6: call   QWORD PTR [rip+0xda27b4]        # 0x1415e0aa0
0x0083e2ec: int3
0x0083e2ed: call   0x1415345f0
0x0083e2f2: jmp    0x14083e309
0x0083e2f4: mov    r8d,0x8
0x0083e2fa: lea    rdx,[rip+0xda81b7]        # 0x1415e64b8 ; literal="building"
0x0083e301: mov    rcx,rbx
0x0083e304: call   0x14006f9a0
0x0083e309: mov    r8d,0x7
0x0083e30f: lea    rdx,[rip+0xe6d90a]        # 0x1416abc20 ; literal=" bucket"
0x0083e316: mov    rcx,rbx
0x0083e319: call   0x14006f9a0
0x0083e31e: mov    eax,0xffff8ad0
0x0083e323: cmp    WORD PTR [rdi+0x16],ax
0x0083e327: je     0x14083e381
0x0083e329: mov    r8d,0x2
0x0083e32f: lea    rdx,[rip+0xdd1f62]        # 0x141610298 ; literal=" ("
0x0083e336: mov    rcx,rbx
0x0083e339: call   0x14006f9a0
0x0083e33e: mov    QWORD PTR [rsp+0x30],rbx
0x0083e343: movzx  eax,WORD PTR [rdi+0x14]
0x0083e347: mov    WORD PTR [rsp+0x28],ax
0x0083e34c: movzx  eax,WORD PTR [rdi+0x12]
0x0083e350: mov    WORD PTR [rsp+0x20],ax
0x0083e355: movzx  r9d,WORD PTR [rdi+0x10]
0x0083e35a: movzx  r8d,WORD PTR [rdi+0x1a]
0x0083e35f: movzx  edx,WORD PTR [rdi+0x18]
0x0083e363: movzx  ecx,WORD PTR [rdi+0x16]
0x0083e367: call   0x14074cc40
0x0083e36c: mov    r8d,0x1
0x0083e372: lea    rdx,[rip+0xdd1f5f]        # 0x1416102d8 ; literal=")"
0x0083e379: mov    rcx,rbx
0x0083e37c: call   0x14006f9a0
0x0083e381: mov    rcx,QWORD PTR [rsp+0x60]
0x0083e386: xor    rcx,rsp
0x0083e389: call   0x1415345d0
0x0083e38e: lea    r11,[rsp+0x70]
0x0083e393: mov    rbx,QWORD PTR [r11+0x10]
0x0083e397: mov    rsi,QWORD PTR [r11+0x20]
0x0083e39b: mov    rsp,r11
0x0083e39e: pop    rdi
0x0083e39f: ret

# classic PE:6a70b91c:0270a000; adventure_movement_building_interact_pull_leverst+8; RVA 0x83e3a0..0x83e56b
0x0083e3a0: mov    QWORD PTR [rsp+0x8],rbx
0x0083e3a5: mov    QWORD PTR [rsp+0x18],rsi
0x0083e3aa: push   rdi
0x0083e3ab: sub    rsp,0x70
0x0083e3af: mov    rax,QWORD PTR [rip+0x1057c8a]        # 0x141896040
0x0083e3b6: xor    rax,rsp
0x0083e3b9: mov    QWORD PTR [rsp+0x60],rax
0x0083e3be: mov    rsi,rdx
0x0083e3c1: mov    rbx,rcx
0x0083e3c4: mov    r8d,0x5
0x0083e3ca: lea    rdx,[rip+0xe6d863]        # 0x1416abc34 ; literal="Pull "
0x0083e3d1: mov    rcx,rsi
0x0083e3d4: call   0x14006f860
0x0083e3d9: mov    r11d,DWORD PTR [rbx+0x20]
0x0083e3dd: mov    r10,QWORD PTR [rip+0x1ba9a24]        # 0x1423e7e08
0x0083e3e4: mov    rdi,QWORD PTR [rip+0x1ba9a15]        # 0x1423e7e00
0x0083e3eb: sub    r10,rdi
0x0083e3ee: sar    r10,0x3
0x0083e3f2: test   r10,r10
0x0083e3f5: je     0x14083e437
0x0083e3f7: cmp    r11d,0xffffffff
0x0083e3fb: je     0x14083e437
0x0083e3fd: xor    edx,edx
0x0083e3ff: sub    r10d,0x1
0x0083e403: js     0x14083e437
0x0083e405: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083e410: lea    ecx,[rdx+r10*1]
0x0083e414: sar    ecx,1
0x0083e416: movsxd rax,ecx
0x0083e419: mov    r8,QWORD PTR [rdi+rax*8]
0x0083e41d: cmp    DWORD PTR [r8+0x50],r11d
0x0083e421: je     0x14083e43a
0x0083e423: lea    eax,[rcx+0x1]
0x0083e426: cmovle edx,eax
0x0083e429: lea    eax,[rcx-0x1]
0x0083e42c: cmovle eax,r10d
0x0083e430: mov    r10d,eax
0x0083e433: cmp    edx,eax
0x0083e435: jle    0x14083e410
0x0083e437: xor    r8d,r8d
0x0083e43a: test   r8,r8
0x0083e43d: je     0x14083e4d4
0x0083e443: xorps  xmm0,xmm0
0x0083e446: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083e44b: mov    QWORD PTR [rsp+0x50],0x0
0x0083e454: mov    QWORD PTR [rsp+0x58],0xf
0x0083e45d: mov    BYTE PTR [rsp+0x40],0x0
0x0083e462: mov    rax,QWORD PTR [r8]
0x0083e465: lea    rdx,[rsp+0x40]
0x0083e46a: mov    rcx,r8
0x0083e46d: call   QWORD PTR [rax+0x188]
0x0083e473: lea    rdx,[rsp+0x40]
0x0083e478: cmp    QWORD PTR [rsp+0x58],0xf
0x0083e47e: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083e484: mov    r8,QWORD PTR [rsp+0x50]
0x0083e489: mov    rcx,rsi
0x0083e48c: call   0x14006f9a0
0x0083e491: nop
0x0083e492: mov    rdx,QWORD PTR [rsp+0x58]
0x0083e497: cmp    rdx,0xf
0x0083e49b: jbe    0x14083e4e9
0x0083e49d: inc    rdx
0x0083e4a0: mov    rcx,QWORD PTR [rsp+0x40]
0x0083e4a5: mov    rax,rcx
0x0083e4a8: cmp    rdx,0x1000
0x0083e4af: jb     0x14083e4cd
0x0083e4b1: add    rdx,0x27
0x0083e4b5: mov    rcx,QWORD PTR [rcx-0x8]
0x0083e4b9: sub    rax,rcx
0x0083e4bc: add    rax,0xfffffffffffffff8
0x0083e4c0: cmp    rax,0x1f
0x0083e4c4: jbe    0x14083e4cd
0x0083e4c6: call   QWORD PTR [rip+0xda25d4]        # 0x1415e0aa0
0x0083e4cc: int3
0x0083e4cd: call   0x1415345f0
0x0083e4d2: jmp    0x14083e4e9
0x0083e4d4: mov    r8d,0x8
0x0083e4da: lea    rdx,[rip+0xda7fd7]        # 0x1415e64b8 ; literal="building"
0x0083e4e1: mov    rcx,rsi
0x0083e4e4: call   0x14006f9a0
0x0083e4e9: mov    eax,0xffff8ad0
0x0083e4ee: cmp    WORD PTR [rbx+0x16],ax
0x0083e4f2: je     0x14083e54c
0x0083e4f4: mov    r8d,0x2
0x0083e4fa: lea    rdx,[rip+0xdd1d97]        # 0x141610298 ; literal=" ("
0x0083e501: mov    rcx,rsi
0x0083e504: call   0x14006f9a0
0x0083e509: mov    QWORD PTR [rsp+0x30],rsi
0x0083e50e: movzx  eax,WORD PTR [rbx+0x14]
0x0083e512: mov    WORD PTR [rsp+0x28],ax
0x0083e517: movzx  eax,WORD PTR [rbx+0x12]
0x0083e51b: mov    WORD PTR [rsp+0x20],ax
0x0083e520: movzx  r9d,WORD PTR [rbx+0x10]
0x0083e525: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083e52a: movzx  edx,WORD PTR [rbx+0x18]
0x0083e52e: movzx  ecx,WORD PTR [rbx+0x16]
0x0083e532: call   0x14074cc40
0x0083e537: mov    r8d,0x1
0x0083e53d: lea    rdx,[rip+0xdd1d94]        # 0x1416102d8 ; literal=")"
0x0083e544: mov    rcx,rsi
0x0083e547: call   0x14006f9a0
0x0083e54c: mov    rcx,QWORD PTR [rsp+0x60]
0x0083e551: xor    rcx,rsp
0x0083e554: call   0x1415345d0
0x0083e559: lea    r11,[rsp+0x70]
0x0083e55e: mov    rbx,QWORD PTR [r11+0x10]
0x0083e562: mov    rsi,QWORD PTR [r11+0x20]
0x0083e566: mov    rsp,r11
0x0083e569: pop    rdi
0x0083e56a: ret

# classic PE:6a70b91c:0270a000; adventure_movement_building_interact_break_in_hatchst+8; RVA 0x83e570..0x83e73b
0x0083e570: mov    QWORD PTR [rsp+0x8],rbx
0x0083e575: mov    QWORD PTR [rsp+0x18],rsi
0x0083e57a: push   rdi
0x0083e57b: sub    rsp,0x70
0x0083e57f: mov    rax,QWORD PTR [rip+0x1057aba]        # 0x141896040
0x0083e586: xor    rax,rsp
0x0083e589: mov    QWORD PTR [rsp+0x60],rax
0x0083e58e: mov    rsi,rdx
0x0083e591: mov    rbx,rcx
0x0083e594: mov    r8d,0x9
0x0083e59a: lea    rdx,[rip+0xe6d687]        # 0x1416abc28 ; literal="Break in "
0x0083e5a1: mov    rcx,rsi
0x0083e5a4: call   0x14006f860
0x0083e5a9: mov    r11d,DWORD PTR [rbx+0x20]
0x0083e5ad: mov    r10,QWORD PTR [rip+0x1ba9854]        # 0x1423e7e08
0x0083e5b4: mov    rdi,QWORD PTR [rip+0x1ba9845]        # 0x1423e7e00
0x0083e5bb: sub    r10,rdi
0x0083e5be: sar    r10,0x3
0x0083e5c2: test   r10,r10
0x0083e5c5: je     0x14083e607
0x0083e5c7: cmp    r11d,0xffffffff
0x0083e5cb: je     0x14083e607
0x0083e5cd: xor    edx,edx
0x0083e5cf: sub    r10d,0x1
0x0083e5d3: js     0x14083e607
0x0083e5d5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083e5e0: lea    ecx,[rdx+r10*1]
0x0083e5e4: sar    ecx,1
0x0083e5e6: movsxd rax,ecx
0x0083e5e9: mov    r8,QWORD PTR [rdi+rax*8]
0x0083e5ed: cmp    DWORD PTR [r8+0x50],r11d
0x0083e5f1: je     0x14083e60a
0x0083e5f3: lea    eax,[rcx+0x1]
0x0083e5f6: cmovle edx,eax
0x0083e5f9: lea    eax,[rcx-0x1]
0x0083e5fc: cmovle eax,r10d
0x0083e600: mov    r10d,eax
0x0083e603: cmp    edx,eax
0x0083e605: jle    0x14083e5e0
0x0083e607: xor    r8d,r8d
0x0083e60a: test   r8,r8
0x0083e60d: je     0x14083e6a4
0x0083e613: xorps  xmm0,xmm0
0x0083e616: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083e61b: mov    QWORD PTR [rsp+0x50],0x0
0x0083e624: mov    QWORD PTR [rsp+0x58],0xf
0x0083e62d: mov    BYTE PTR [rsp+0x40],0x0
0x0083e632: mov    rax,QWORD PTR [r8]
0x0083e635: lea    rdx,[rsp+0x40]
0x0083e63a: mov    rcx,r8
0x0083e63d: call   QWORD PTR [rax+0x188]
0x0083e643: lea    rdx,[rsp+0x40]
0x0083e648: cmp    QWORD PTR [rsp+0x58],0xf
0x0083e64e: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083e654: mov    r8,QWORD PTR [rsp+0x50]
0x0083e659: mov    rcx,rsi
0x0083e65c: call   0x14006f9a0
0x0083e661: nop
0x0083e662: mov    rdx,QWORD PTR [rsp+0x58]
0x0083e667: cmp    rdx,0xf
0x0083e66b: jbe    0x14083e6b9
0x0083e66d: inc    rdx
0x0083e670: mov    rcx,QWORD PTR [rsp+0x40]
0x0083e675: mov    rax,rcx
0x0083e678: cmp    rdx,0x1000
0x0083e67f: jb     0x14083e69d
0x0083e681: add    rdx,0x27
0x0083e685: mov    rcx,QWORD PTR [rcx-0x8]
0x0083e689: sub    rax,rcx
0x0083e68c: add    rax,0xfffffffffffffff8
0x0083e690: cmp    rax,0x1f
0x0083e694: jbe    0x14083e69d
0x0083e696: call   QWORD PTR [rip+0xda2404]        # 0x1415e0aa0
0x0083e69c: int3
0x0083e69d: call   0x1415345f0
0x0083e6a2: jmp    0x14083e6b9
0x0083e6a4: mov    r8d,0x8
0x0083e6aa: lea    rdx,[rip+0xda7e07]        # 0x1415e64b8 ; literal="building"
0x0083e6b1: mov    rcx,rsi
0x0083e6b4: call   0x14006f9a0
0x0083e6b9: mov    eax,0xffff8ad0
0x0083e6be: cmp    WORD PTR [rbx+0x16],ax
0x0083e6c2: je     0x14083e71c
0x0083e6c4: mov    r8d,0x2
0x0083e6ca: lea    rdx,[rip+0xdd1bc7]        # 0x141610298 ; literal=" ("
0x0083e6d1: mov    rcx,rsi
0x0083e6d4: call   0x14006f9a0
0x0083e6d9: mov    QWORD PTR [rsp+0x30],rsi
0x0083e6de: movzx  eax,WORD PTR [rbx+0x14]
0x0083e6e2: mov    WORD PTR [rsp+0x28],ax
0x0083e6e7: movzx  eax,WORD PTR [rbx+0x12]
0x0083e6eb: mov    WORD PTR [rsp+0x20],ax
0x0083e6f0: movzx  r9d,WORD PTR [rbx+0x10]
0x0083e6f5: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083e6fa: movzx  edx,WORD PTR [rbx+0x18]
0x0083e6fe: movzx  ecx,WORD PTR [rbx+0x16]
0x0083e702: call   0x14074cc40
0x0083e707: mov    r8d,0x1
0x0083e70d: lea    rdx,[rip+0xdd1bc4]        # 0x1416102d8 ; literal=")"
0x0083e714: mov    rcx,rsi
0x0083e717: call   0x14006f9a0
0x0083e71c: mov    rcx,QWORD PTR [rsp+0x60]
0x0083e721: xor    rcx,rsp
0x0083e724: call   0x1415345d0
0x0083e729: lea    r11,[rsp+0x70]
0x0083e72e: mov    rbx,QWORD PTR [r11+0x10]
0x0083e732: mov    rsi,QWORD PTR [r11+0x20]
0x0083e736: mov    rsp,r11
0x0083e739: pop    rdi
0x0083e73a: ret

# classic PE:6a70b91c:0270a000; adventure_movement_building_interact_pick_door_lockst+8;adventure_movement_building_interact_pick_hatch_lockst+8; RVA 0x83e740..0x83e920
0x0083e740: mov    QWORD PTR [rsp+0x8],rbx
0x0083e745: mov    QWORD PTR [rsp+0x18],rsi
0x0083e74a: push   rdi
0x0083e74b: sub    rsp,0x70
0x0083e74f: mov    rax,QWORD PTR [rip+0x10578ea]        # 0x141896040
0x0083e756: xor    rax,rsp
0x0083e759: mov    QWORD PTR [rsp+0x60],rax
0x0083e75e: mov    rdi,rdx
0x0083e761: mov    rbx,rcx
0x0083e764: mov    r8d,0x5
0x0083e76a: lea    rdx,[rip+0xe6d48b]        # 0x1416abbfc ; literal="Pick "
0x0083e771: mov    rcx,rdi
0x0083e774: call   0x14006f860
0x0083e779: mov    r11d,DWORD PTR [rbx+0x20]
0x0083e77d: mov    r10,QWORD PTR [rip+0x1ba9684]        # 0x1423e7e08
0x0083e784: mov    rsi,QWORD PTR [rip+0x1ba9675]        # 0x1423e7e00
0x0083e78b: sub    r10,rsi
0x0083e78e: sar    r10,0x3
0x0083e792: test   r10,r10
0x0083e795: je     0x14083e7d7
0x0083e797: cmp    r11d,0xffffffff
0x0083e79b: je     0x14083e7d7
0x0083e79d: xor    edx,edx
0x0083e79f: sub    r10d,0x1
0x0083e7a3: js     0x14083e7d7
0x0083e7a5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083e7b0: lea    ecx,[rdx+r10*1]
0x0083e7b4: sar    ecx,1
0x0083e7b6: movsxd rax,ecx
0x0083e7b9: mov    r8,QWORD PTR [rsi+rax*8]
0x0083e7bd: cmp    DWORD PTR [r8+0x50],r11d
0x0083e7c1: je     0x14083e7da
0x0083e7c3: lea    eax,[rcx+0x1]
0x0083e7c6: cmovle edx,eax
0x0083e7c9: lea    eax,[rcx-0x1]
0x0083e7cc: cmovle eax,r10d
0x0083e7d0: mov    r10d,eax
0x0083e7d3: cmp    edx,eax
0x0083e7d5: jle    0x14083e7b0
0x0083e7d7: xor    r8d,r8d
0x0083e7da: test   r8,r8
0x0083e7dd: je     0x14083e874
0x0083e7e3: xorps  xmm0,xmm0
0x0083e7e6: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083e7eb: mov    QWORD PTR [rsp+0x50],0x0
0x0083e7f4: mov    QWORD PTR [rsp+0x58],0xf
0x0083e7fd: mov    BYTE PTR [rsp+0x40],0x0
0x0083e802: mov    rax,QWORD PTR [r8]
0x0083e805: lea    rdx,[rsp+0x40]
0x0083e80a: mov    rcx,r8
0x0083e80d: call   QWORD PTR [rax+0x188]
0x0083e813: lea    rdx,[rsp+0x40]
0x0083e818: cmp    QWORD PTR [rsp+0x58],0xf
0x0083e81e: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083e824: mov    r8,QWORD PTR [rsp+0x50]
0x0083e829: mov    rcx,rdi
0x0083e82c: call   0x14006f9a0
0x0083e831: nop
0x0083e832: mov    rdx,QWORD PTR [rsp+0x58]
0x0083e837: cmp    rdx,0xf
0x0083e83b: jbe    0x14083e889
0x0083e83d: inc    rdx
0x0083e840: mov    rcx,QWORD PTR [rsp+0x40]
0x0083e845: mov    rax,rcx
0x0083e848: cmp    rdx,0x1000
0x0083e84f: jb     0x14083e86d
0x0083e851: add    rdx,0x27
0x0083e855: mov    rcx,QWORD PTR [rcx-0x8]
0x0083e859: sub    rax,rcx
0x0083e85c: add    rax,0xfffffffffffffff8
0x0083e860: cmp    rax,0x1f
0x0083e864: jbe    0x14083e86d
0x0083e866: call   QWORD PTR [rip+0xda2234]        # 0x1415e0aa0
0x0083e86c: int3
0x0083e86d: call   0x1415345f0
0x0083e872: jmp    0x14083e889
0x0083e874: mov    r8d,0x8
0x0083e87a: lea    rdx,[rip+0xda7c37]        # 0x1415e64b8 ; literal="building"
0x0083e881: mov    rcx,rdi
0x0083e884: call   0x14006f9a0
0x0083e889: mov    r8d,0x5
0x0083e88f: lea    rdx,[rip+0xe1ed86]        # 0x14165d61c ; literal=" lock"
0x0083e896: mov    rcx,rdi
0x0083e899: call   0x14006f9a0
0x0083e89e: mov    eax,0xffff8ad0
0x0083e8a3: cmp    WORD PTR [rbx+0x16],ax
0x0083e8a7: je     0x14083e901
0x0083e8a9: mov    r8d,0x2
0x0083e8af: lea    rdx,[rip+0xdd19e2]        # 0x141610298 ; literal=" ("
0x0083e8b6: mov    rcx,rdi
0x0083e8b9: call   0x14006f9a0
0x0083e8be: mov    QWORD PTR [rsp+0x30],rdi
0x0083e8c3: movzx  eax,WORD PTR [rbx+0x14]
0x0083e8c7: mov    WORD PTR [rsp+0x28],ax
0x0083e8cc: movzx  eax,WORD PTR [rbx+0x12]
0x0083e8d0: mov    WORD PTR [rsp+0x20],ax
0x0083e8d5: movzx  r9d,WORD PTR [rbx+0x10]
0x0083e8da: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083e8df: movzx  edx,WORD PTR [rbx+0x18]
0x0083e8e3: movzx  ecx,WORD PTR [rbx+0x16]
0x0083e8e7: call   0x14074cc40
0x0083e8ec: mov    r8d,0x1
0x0083e8f2: lea    rdx,[rip+0xdd19df]        # 0x1416102d8 ; literal=")"
0x0083e8f9: mov    rcx,rdi
0x0083e8fc: call   0x14006f9a0
0x0083e901: mov    rcx,QWORD PTR [rsp+0x60]
0x0083e906: xor    rcx,rsp
0x0083e909: call   0x1415345d0
0x0083e90e: lea    r11,[rsp+0x70]
0x0083e913: mov    rbx,QWORD PTR [r11+0x10]
0x0083e917: mov    rsi,QWORD PTR [r11+0x20]
0x0083e91b: mov    rsp,r11
0x0083e91e: pop    rdi
0x0083e91f: ret

# classic PE:6a70b91c:0270a000; adventure_movement_building_interact_bash_down_doorst+8; RVA 0x83e920..0x83eaeb
0x0083e920: mov    QWORD PTR [rsp+0x8],rbx
0x0083e925: mov    QWORD PTR [rsp+0x18],rsi
0x0083e92a: push   rdi
0x0083e92b: sub    rsp,0x70
0x0083e92f: mov    rax,QWORD PTR [rip+0x105770a]        # 0x141896040
0x0083e936: xor    rax,rsp
0x0083e939: mov    QWORD PTR [rsp+0x60],rax
0x0083e93e: mov    rsi,rdx
0x0083e941: mov    rbx,rcx
0x0083e944: mov    r8d,0xa
0x0083e94a: lea    rdx,[rip+0xe6d29f]        # 0x1416abbf0 ; literal="Bash down "
0x0083e951: mov    rcx,rsi
0x0083e954: call   0x14006f860
0x0083e959: mov    r11d,DWORD PTR [rbx+0x20]
0x0083e95d: mov    r10,QWORD PTR [rip+0x1ba94a4]        # 0x1423e7e08
0x0083e964: mov    rdi,QWORD PTR [rip+0x1ba9495]        # 0x1423e7e00
0x0083e96b: sub    r10,rdi
0x0083e96e: sar    r10,0x3
0x0083e972: test   r10,r10
0x0083e975: je     0x14083e9b7
0x0083e977: cmp    r11d,0xffffffff
0x0083e97b: je     0x14083e9b7
0x0083e97d: xor    edx,edx
0x0083e97f: sub    r10d,0x1
0x0083e983: js     0x14083e9b7
0x0083e985: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083e990: lea    ecx,[rdx+r10*1]
0x0083e994: sar    ecx,1
0x0083e996: movsxd rax,ecx
0x0083e999: mov    r8,QWORD PTR [rdi+rax*8]
0x0083e99d: cmp    DWORD PTR [r8+0x50],r11d
0x0083e9a1: je     0x14083e9ba
0x0083e9a3: lea    eax,[rcx+0x1]
0x0083e9a6: cmovle edx,eax
0x0083e9a9: lea    eax,[rcx-0x1]
0x0083e9ac: cmovle eax,r10d
0x0083e9b0: mov    r10d,eax
0x0083e9b3: cmp    edx,eax
0x0083e9b5: jle    0x14083e990
0x0083e9b7: xor    r8d,r8d
0x0083e9ba: test   r8,r8
0x0083e9bd: je     0x14083ea54
0x0083e9c3: xorps  xmm0,xmm0
0x0083e9c6: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083e9cb: mov    QWORD PTR [rsp+0x50],0x0
0x0083e9d4: mov    QWORD PTR [rsp+0x58],0xf
0x0083e9dd: mov    BYTE PTR [rsp+0x40],0x0
0x0083e9e2: mov    rax,QWORD PTR [r8]
0x0083e9e5: lea    rdx,[rsp+0x40]
0x0083e9ea: mov    rcx,r8
0x0083e9ed: call   QWORD PTR [rax+0x188]
0x0083e9f3: lea    rdx,[rsp+0x40]
0x0083e9f8: cmp    QWORD PTR [rsp+0x58],0xf
0x0083e9fe: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083ea04: mov    r8,QWORD PTR [rsp+0x50]
0x0083ea09: mov    rcx,rsi
0x0083ea0c: call   0x14006f9a0
0x0083ea11: nop
0x0083ea12: mov    rdx,QWORD PTR [rsp+0x58]
0x0083ea17: cmp    rdx,0xf
0x0083ea1b: jbe    0x14083ea69
0x0083ea1d: inc    rdx
0x0083ea20: mov    rcx,QWORD PTR [rsp+0x40]
0x0083ea25: mov    rax,rcx
0x0083ea28: cmp    rdx,0x1000
0x0083ea2f: jb     0x14083ea4d
0x0083ea31: add    rdx,0x27
0x0083ea35: mov    rcx,QWORD PTR [rcx-0x8]
0x0083ea39: sub    rax,rcx
0x0083ea3c: add    rax,0xfffffffffffffff8
0x0083ea40: cmp    rax,0x1f
0x0083ea44: jbe    0x14083ea4d
0x0083ea46: call   QWORD PTR [rip+0xda2054]        # 0x1415e0aa0
0x0083ea4c: int3
0x0083ea4d: call   0x1415345f0
0x0083ea52: jmp    0x14083ea69
0x0083ea54: mov    r8d,0x8
0x0083ea5a: lea    rdx,[rip+0xda7a57]        # 0x1415e64b8 ; literal="building"
0x0083ea61: mov    rcx,rsi
0x0083ea64: call   0x14006f9a0
0x0083ea69: mov    eax,0xffff8ad0
0x0083ea6e: cmp    WORD PTR [rbx+0x16],ax
0x0083ea72: je     0x14083eacc
0x0083ea74: mov    r8d,0x2
0x0083ea7a: lea    rdx,[rip+0xdd1817]        # 0x141610298 ; literal=" ("
0x0083ea81: mov    rcx,rsi
0x0083ea84: call   0x14006f9a0
0x0083ea89: mov    QWORD PTR [rsp+0x30],rsi
0x0083ea8e: movzx  eax,WORD PTR [rbx+0x14]
0x0083ea92: mov    WORD PTR [rsp+0x28],ax
0x0083ea97: movzx  eax,WORD PTR [rbx+0x12]
0x0083ea9b: mov    WORD PTR [rsp+0x20],ax
0x0083eaa0: movzx  r9d,WORD PTR [rbx+0x10]
0x0083eaa5: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083eaaa: movzx  edx,WORD PTR [rbx+0x18]
0x0083eaae: movzx  ecx,WORD PTR [rbx+0x16]
0x0083eab2: call   0x14074cc40
0x0083eab7: mov    r8d,0x1
0x0083eabd: lea    rdx,[rip+0xdd1814]        # 0x1416102d8 ; literal=")"
0x0083eac4: mov    rcx,rsi
0x0083eac7: call   0x14006f9a0
0x0083eacc: mov    rcx,QWORD PTR [rsp+0x60]
0x0083ead1: xor    rcx,rsp
0x0083ead4: call   0x1415345d0
0x0083ead9: lea    r11,[rsp+0x70]
0x0083eade: mov    rbx,QWORD PTR [r11+0x10]
0x0083eae2: mov    rsi,QWORD PTR [r11+0x20]
0x0083eae6: mov    rsp,r11
0x0083eae9: pop    rdi
0x0083eaea: ret

# classic PE:6a70b91c:0270a000; adventure_movement_building_interact_topple_statuest+8; RVA 0x83eaf0..0x83ecbb
0x0083eaf0: mov    QWORD PTR [rsp+0x8],rbx
0x0083eaf5: mov    QWORD PTR [rsp+0x18],rsi
0x0083eafa: push   rdi
0x0083eafb: sub    rsp,0x70
0x0083eaff: mov    rax,QWORD PTR [rip+0x105753a]        # 0x141896040
0x0083eb06: xor    rax,rsp
0x0083eb09: mov    QWORD PTR [rsp+0x60],rax
0x0083eb0e: mov    rsi,rdx
0x0083eb11: mov    rbx,rcx
0x0083eb14: mov    r8d,0x7
0x0083eb1a: lea    rdx,[rip+0xe6d0ef]        # 0x1416abc10 ; literal="Topple "
0x0083eb21: mov    rcx,rsi
0x0083eb24: call   0x14006f860
0x0083eb29: mov    r11d,DWORD PTR [rbx+0x20]
0x0083eb2d: mov    r10,QWORD PTR [rip+0x1ba92d4]        # 0x1423e7e08
0x0083eb34: mov    rdi,QWORD PTR [rip+0x1ba92c5]        # 0x1423e7e00
0x0083eb3b: sub    r10,rdi
0x0083eb3e: sar    r10,0x3
0x0083eb42: test   r10,r10
0x0083eb45: je     0x14083eb87
0x0083eb47: cmp    r11d,0xffffffff
0x0083eb4b: je     0x14083eb87
0x0083eb4d: xor    edx,edx
0x0083eb4f: sub    r10d,0x1
0x0083eb53: js     0x14083eb87
0x0083eb55: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083eb60: lea    ecx,[rdx+r10*1]
0x0083eb64: sar    ecx,1
0x0083eb66: movsxd rax,ecx
0x0083eb69: mov    r8,QWORD PTR [rdi+rax*8]
0x0083eb6d: cmp    DWORD PTR [r8+0x50],r11d
0x0083eb71: je     0x14083eb8a
0x0083eb73: lea    eax,[rcx+0x1]
0x0083eb76: cmovle edx,eax
0x0083eb79: lea    eax,[rcx-0x1]
0x0083eb7c: cmovle eax,r10d
0x0083eb80: mov    r10d,eax
0x0083eb83: cmp    edx,eax
0x0083eb85: jle    0x14083eb60
0x0083eb87: xor    r8d,r8d
0x0083eb8a: test   r8,r8
0x0083eb8d: je     0x14083ec24
0x0083eb93: xorps  xmm0,xmm0
0x0083eb96: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083eb9b: mov    QWORD PTR [rsp+0x50],0x0
0x0083eba4: mov    QWORD PTR [rsp+0x58],0xf
0x0083ebad: mov    BYTE PTR [rsp+0x40],0x0
0x0083ebb2: mov    rax,QWORD PTR [r8]
0x0083ebb5: lea    rdx,[rsp+0x40]
0x0083ebba: mov    rcx,r8
0x0083ebbd: call   QWORD PTR [rax+0x188]
0x0083ebc3: lea    rdx,[rsp+0x40]
0x0083ebc8: cmp    QWORD PTR [rsp+0x58],0xf
0x0083ebce: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083ebd4: mov    r8,QWORD PTR [rsp+0x50]
0x0083ebd9: mov    rcx,rsi
0x0083ebdc: call   0x14006f9a0
0x0083ebe1: nop
0x0083ebe2: mov    rdx,QWORD PTR [rsp+0x58]
0x0083ebe7: cmp    rdx,0xf
0x0083ebeb: jbe    0x14083ec39
0x0083ebed: inc    rdx
0x0083ebf0: mov    rcx,QWORD PTR [rsp+0x40]
0x0083ebf5: mov    rax,rcx
0x0083ebf8: cmp    rdx,0x1000
0x0083ebff: jb     0x14083ec1d
0x0083ec01: add    rdx,0x27
0x0083ec05: mov    rcx,QWORD PTR [rcx-0x8]
0x0083ec09: sub    rax,rcx
0x0083ec0c: add    rax,0xfffffffffffffff8
0x0083ec10: cmp    rax,0x1f
0x0083ec14: jbe    0x14083ec1d
0x0083ec16: call   QWORD PTR [rip+0xda1e84]        # 0x1415e0aa0
0x0083ec1c: int3
0x0083ec1d: call   0x1415345f0
0x0083ec22: jmp    0x14083ec39
0x0083ec24: mov    r8d,0x8
0x0083ec2a: lea    rdx,[rip+0xda7887]        # 0x1415e64b8 ; literal="building"
0x0083ec31: mov    rcx,rsi
0x0083ec34: call   0x14006f9a0
0x0083ec39: mov    eax,0xffff8ad0
0x0083ec3e: cmp    WORD PTR [rbx+0x16],ax
0x0083ec42: je     0x14083ec9c
0x0083ec44: mov    r8d,0x2
0x0083ec4a: lea    rdx,[rip+0xdd1647]        # 0x141610298 ; literal=" ("
0x0083ec51: mov    rcx,rsi
0x0083ec54: call   0x14006f9a0
0x0083ec59: mov    QWORD PTR [rsp+0x30],rsi
0x0083ec5e: movzx  eax,WORD PTR [rbx+0x14]
0x0083ec62: mov    WORD PTR [rsp+0x28],ax
0x0083ec67: movzx  eax,WORD PTR [rbx+0x12]
0x0083ec6b: mov    WORD PTR [rsp+0x20],ax
0x0083ec70: movzx  r9d,WORD PTR [rbx+0x10]
0x0083ec75: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083ec7a: movzx  edx,WORD PTR [rbx+0x18]
0x0083ec7e: movzx  ecx,WORD PTR [rbx+0x16]
0x0083ec82: call   0x14074cc40
0x0083ec87: mov    r8d,0x1
0x0083ec8d: lea    rdx,[rip+0xdd1644]        # 0x1416102d8 ; literal=")"
0x0083ec94: mov    rcx,rsi
0x0083ec97: call   0x14006f9a0
0x0083ec9c: mov    rcx,QWORD PTR [rsp+0x60]
0x0083eca1: xor    rcx,rsp
0x0083eca4: call   0x1415345d0
0x0083eca9: lea    r11,[rsp+0x70]
0x0083ecae: mov    rbx,QWORD PTR [r11+0x10]
0x0083ecb2: mov    rsi,QWORD PTR [r11+0x20]
0x0083ecb6: mov    rsp,r11
0x0083ecb9: pop    rdi
0x0083ecba: ret

# classic PE:6a70b91c:0270a000; adventure_movement_movest+8; RVA 0x83ecc0..0x83f17d
0x0083ecc0: mov    QWORD PTR [rsp+0x18],rbx
0x0083ecc5: push   rbp
0x0083ecc6: push   rsi
0x0083ecc7: push   rdi
0x0083ecc8: push   r12
0x0083ecca: push   r13
0x0083eccc: push   r14
0x0083ecce: push   r15
0x0083ecd0: mov    rbp,rsp
0x0083ecd3: sub    rsp,0x80
0x0083ecda: mov    rax,QWORD PTR [rip+0x105735f]        # 0x141896040
0x0083ece1: xor    rax,rsp
0x0083ece4: mov    QWORD PTR [rbp-0x10],rax
0x0083ece8: mov    r12,rdx
0x0083eceb: mov    r13,rcx
0x0083ecee: mov    eax,DWORD PTR [rcx+0x24]
0x0083ecf1: and    eax,0x1
0x0083ecf4: mov    ecx,eax
0x0083ecf6: mov    r8d,eax
0x0083ecf9: xor    r8,0x1
0x0083ecfd: add    r8,0x7
0x0083ed01: lea    rax,[rip+0xe6cf80]        # 0x1416abc88 ; literal="Move to "
0x0083ed08: lea    rdx,[rip+0xe6cef9]        # 0x1416abc08 ; literal="Charge "
0x0083ed0f: test   ecx,ecx
0x0083ed11: cmove  rdx,rax
0x0083ed15: mov    rcx,r12
0x0083ed18: call   0x14006f860
0x0083ed1d: xor    dil,dil
0x0083ed20: mov    BYTE PTR [rbp-0x40],dil
0x0083ed24: mov    eax,0xffff8ad0
0x0083ed29: xor    ebx,ebx
0x0083ed2b: test   BYTE PTR [r13+0x24],0x1
0x0083ed30: je     0x14083eee0
0x0083ed36: mov    rsi,QWORD PTR [rip+0x1ba027b]        # 0x1423defb8
0x0083ed3d: mov    r14,QWORD PTR [rip+0x1ba027c]        # 0x1423defc0
0x0083ed44: cmp    rsi,r14
0x0083ed47: jae    0x14083eedb
0x0083ed4d: mov    r15,QWORD PTR [rsi]
0x0083ed50: cmp    r15,QWORD PTR [rip+0x1ba02a9]        # 0x1423df000
0x0083ed57: je     0x14083eecb
0x0083ed5d: test   DWORD PTR [r15+0x110],0x2000002
0x0083ed68: jne    0x14083eecb
0x0083ed6e: mov    WORD PTR [rbp-0x3c],ax
0x0083ed72: test   DWORD PTR [r15+0x110],0x2000000
0x0083ed7d: je     0x14083edd3
0x0083ed7f: mov    rbx,QWORD PTR [r15+0x1d8]
0x0083ed86: mov    rdi,QWORD PTR [r15+0x1e0]
0x0083ed8d: nop    DWORD PTR [rax]
0x0083ed90: cmp    rbx,rdi
0x0083ed93: jae    0x14083edcb
0x0083ed95: mov    rcx,QWORD PTR [rbx]
0x0083ed98: mov    rax,QWORD PTR [rcx]
0x0083ed9b: call   QWORD PTR [rax+0x10]
0x0083ed9e: cmp    eax,0xb
0x0083eda1: jne    0x14083edb1
0x0083eda3: mov    rcx,QWORD PTR [rbx]
0x0083eda6: mov    rax,QWORD PTR [rcx]
0x0083eda9: call   QWORD PTR [rax+0x18]
0x0083edac: test   rax,rax
0x0083edaf: jne    0x14083edb7
0x0083edb1: add    rbx,0x8
0x0083edb5: jmp    0x14083ed90
0x0083edb7: lea    r9,[rbp-0x34]
0x0083edbb: lea    r8,[rbp-0x38]
0x0083edbf: lea    rdx,[rbp-0x3c]
0x0083edc3: mov    rcx,rax
0x0083edc6: call   0x140c88ae0
0x0083edcb: xor    ebx,ebx
0x0083edcd: movzx  edi,BYTE PTR [rbp-0x40]
0x0083edd1: jmp    0x14083edf7
0x0083edd3: movzx  eax,WORD PTR [r15+0xa8]
0x0083eddb: mov    WORD PTR [rbp-0x3c],ax
0x0083eddf: movzx  eax,WORD PTR [r15+0xaa]
0x0083ede7: mov    WORD PTR [rbp-0x38],ax
0x0083edeb: movzx  eax,WORD PTR [r15+0xac]
0x0083edf3: mov    WORD PTR [rbp-0x34],ax
0x0083edf7: movzx  eax,WORD PTR [r13+0x10]
0x0083edfc: cmp    WORD PTR [rbp-0x3c],ax
0x0083ee00: jne    0x14083eec6
0x0083ee06: movzx  eax,WORD PTR [r13+0x12]
0x0083ee0b: cmp    WORD PTR [rbp-0x38],ax
0x0083ee0f: jne    0x14083eec6
0x0083ee15: movzx  eax,WORD PTR [r13+0x14]
0x0083ee1a: cmp    WORD PTR [rbp-0x34],ax
0x0083ee1e: jne    0x14083eec6
0x0083ee24: mov    rdx,r15
0x0083ee27: mov    rcx,QWORD PTR [rip+0x1ba01d2]        # 0x1423df000
0x0083ee2e: call   0x1413e63e0
0x0083ee33: cmp    eax,0xffffffff
0x0083ee36: jne    0x14083eec6
0x0083ee3c: mov    dil,0x1
0x0083ee3f: mov    BYTE PTR [rbp-0x40],dil
0x0083ee43: xorps  xmm0,xmm0
0x0083ee46: movups XMMWORD PTR [rbp-0x30],xmm0
0x0083ee4a: mov    QWORD PTR [rbp-0x20],rbx
0x0083ee4e: mov    QWORD PTR [rbp-0x18],0xf
0x0083ee56: mov    BYTE PTR [rbp-0x30],0x0
0x0083ee5a: mov    BYTE PTR [rsp+0x20],dil
0x0083ee5f: xor    r9d,r9d
0x0083ee62: mov    r8d,0x1
0x0083ee68: lea    rdx,[rbp-0x30]
0x0083ee6c: mov    rcx,r15
0x0083ee6f: call   0x1413293a0
0x0083ee74: lea    rdx,[rbp-0x30]
0x0083ee78: cmp    QWORD PTR [rbp-0x18],0xf
0x0083ee7d: cmova  rdx,QWORD PTR [rbp-0x30]
0x0083ee82: mov    r8,QWORD PTR [rbp-0x20]
0x0083ee86: mov    rcx,r12
0x0083ee89: call   0x14006f9a0
0x0083ee8e: nop
0x0083ee8f: mov    rdx,QWORD PTR [rbp-0x18]
0x0083ee93: cmp    rdx,0xf
0x0083ee97: jbe    0x14083eec6
0x0083ee99: inc    rdx
0x0083ee9c: mov    rcx,QWORD PTR [rbp-0x30]
0x0083eea0: mov    rax,rcx
0x0083eea3: cmp    rdx,0x1000
0x0083eeaa: jb     0x14083eec1
0x0083eeac: add    rdx,0x27
0x0083eeb0: mov    rcx,QWORD PTR [rcx-0x8]
0x0083eeb4: sub    rax,rcx
0x0083eeb7: add    rax,0xfffffffffffffff8
0x0083eebb: cmp    rax,0x1f
0x0083eebf: ja     0x14083eed4
0x0083eec1: call   0x1415345f0
0x0083eec6: mov    eax,0xffff8ad0
0x0083eecb: add    rsi,0x8
0x0083eecf: jmp    0x14083ed44
0x0083eed4: call   QWORD PTR [rip+0xda1bc6]        # 0x1415e0aa0
0x0083eeda: int3
0x0083eedb: test   dil,dil
0x0083eede: jne    0x14083ef49
0x0083eee0: xorps  xmm0,xmm0
0x0083eee3: movups XMMWORD PTR [rbp-0x30],xmm0
0x0083eee7: mov    QWORD PTR [rbp-0x20],rbx
0x0083eeeb: mov    QWORD PTR [rbp-0x18],0xf
0x0083eef3: mov    BYTE PTR [rbp-0x30],0x0
0x0083eef7: mov    BYTE PTR [rsp+0x28],0x0
0x0083eefc: movzx  eax,WORD PTR [r13+0x14]
0x0083ef01: mov    WORD PTR [rsp+0x20],ax
0x0083ef06: movzx  r9d,WORD PTR [r13+0x12]
0x0083ef0b: movzx  r8d,WORD PTR [r13+0x10]
0x0083ef10: lea    rdx,[rbp-0x30]
0x0083ef14: lea    rcx,[rip+0x1b8c4c5]        # 0x1423cb3e0
0x0083ef1b: call   0x140e782a0
0x0083ef20: lea    rdx,[rbp-0x30]
0x0083ef24: cmp    QWORD PTR [rbp-0x18],0xf
0x0083ef29: cmova  rdx,QWORD PTR [rbp-0x30]
0x0083ef2e: mov    r8,QWORD PTR [rbp-0x20]
0x0083ef32: mov    rcx,r12
0x0083ef35: call   0x14006f9a0
0x0083ef3a: nop
0x0083ef3b: lea    rcx,[rbp-0x30]
0x0083ef3f: call   0x14006f7e0
0x0083ef44: mov    eax,0xffff8ad0
0x0083ef49: cmp    WORD PTR [r13+0x16],ax
0x0083ef4e: je     0x14083f156
0x0083ef54: mov    r8d,0x2
0x0083ef5a: lea    rdx,[rip+0xdd1337]        # 0x141610298 ; literal=" ("
0x0083ef61: mov    rcx,r12
0x0083ef64: call   0x14006f9a0
0x0083ef69: mov    QWORD PTR [rsp+0x30],r12
0x0083ef6e: movzx  eax,WORD PTR [r13+0x14]
0x0083ef73: mov    WORD PTR [rsp+0x28],ax
0x0083ef78: movzx  eax,WORD PTR [r13+0x12]
0x0083ef7d: mov    WORD PTR [rsp+0x20],ax
0x0083ef82: movzx  r9d,WORD PTR [r13+0x10]
0x0083ef87: movzx  r8d,WORD PTR [r13+0x1a]
0x0083ef8c: movzx  edx,WORD PTR [r13+0x18]
0x0083ef91: movzx  ecx,WORD PTR [r13+0x16]
0x0083ef96: call   0x14074cc40
0x0083ef9b: movsx  r9,WORD PTR [r13+0x14]
0x0083efa0: movsx  rbx,WORD PTR [r13+0x12]
0x0083efa5: movsx  rdi,WORD PTR [r13+0x10]
0x0083efaa: test   di,di
0x0083efad: js     0x14083f038
0x0083efb3: cmp    edi,DWORD PTR [rip+0x1ca3013]        # 0x1424e1fcc
0x0083efb9: jge    0x14083f038
0x0083efbb: test   bx,bx
0x0083efbe: js     0x14083f038
0x0083efc0: cmp    ebx,DWORD PTR [rip+0x1ca300a]        # 0x1424e1fd0
0x0083efc6: jge    0x14083f038
0x0083efc8: test   r9w,r9w
0x0083efcc: js     0x14083f038
0x0083efce: cmp    r9d,DWORD PTR [rip+0x1ca2fff]        # 0x1424e1fd4
0x0083efd5: jge    0x14083f038
0x0083efd7: mov    rcx,QWORD PTR [rip+0x1ca2fba]        # 0x1424e1f98
0x0083efde: test   rcx,rcx
0x0083efe1: je     0x14083f038
0x0083efe3: mov    rax,rdi
0x0083efe6: sar    rax,0x4
0x0083efea: mov    rdx,rbx
0x0083efed: sar    rdx,0x4
0x0083eff1: mov    rax,QWORD PTR [rcx+rax*8]
0x0083eff5: mov    rax,QWORD PTR [rax+rdx*8]
0x0083eff9: mov    rdx,QWORD PTR [rax+r9*8]
0x0083effd: test   rdx,rdx
0x0083f000: je     0x14083f038
0x0083f002: mov    eax,edi
0x0083f004: and    eax,0x8000000f
0x0083f009: jge    0x14083f012
0x0083f00b: dec    eax
0x0083f00d: or     eax,0xfffffff0
0x0083f010: inc    eax
0x0083f012: movsxd rcx,eax
0x0083f015: add    rcx,0x5
0x0083f019: shl    rcx,0x4
0x0083f01d: mov    eax,ebx
0x0083f01f: and    eax,0x8000000f
0x0083f024: jge    0x14083f02d
0x0083f026: dec    eax
0x0083f028: or     eax,0xfffffff0
0x0083f02b: inc    eax
0x0083f02d: cdqe
0x0083f02f: add    rcx,rax
0x0083f032: movzx  eax,WORD PTR [rdx+rcx*2]
0x0083f036: jmp    0x14083f03a
0x0083f038: xor    eax,eax
0x0083f03a: movzx  ecx,ax
0x0083f03d: sub    ecx,0x1
0x0083f040: je     0x14083f051
0x0083f042: sub    ecx,0x1f
0x0083f045: je     0x14083f051
0x0083f047: sub    ecx,0x3
0x0083f04a: je     0x14083f051
0x0083f04c: cmp    ecx,0x7
0x0083f04f: jne    0x14083f094
0x0083f051: movzx  r8d,bx
0x0083f055: movzx  edx,di
0x0083f058: lea    rcx,[rip+0x1b8c381]        # 0x1423cb3e0
0x0083f05f: call   0x140247d10
0x0083f064: cmp    al,0x6
0x0083f066: jg     0x14083f094
0x0083f068: movzx  r8d,bx
0x0083f06c: movzx  edx,di
0x0083f06f: lea    rcx,[rip+0x1b8c36a]        # 0x1423cb3e0
0x0083f076: call   0x1402c1650
0x0083f07b: cmp    al,0x6
0x0083f07d: jg     0x14083f094
0x0083f07f: mov    r8d,0x4
0x0083f085: lea    rdx,[rip+0xe6cbf4]        # 0x1416abc80 ; literal="/Air"
0x0083f08c: mov    rcx,r12
0x0083f08f: call   0x14006f9a0
0x0083f094: movzx  r9d,WORD PTR [r13+0x14]
0x0083f099: movzx  r8d,WORD PTR [r13+0x12]
0x0083f09e: movzx  edx,WORD PTR [r13+0x10]
0x0083f0a3: lea    rcx,[rip+0x1b8c336]        # 0x1423cb3e0
0x0083f0aa: call   0x140247d10
0x0083f0af: test   al,al
0x0083f0b1: jle    0x14083f0c8
0x0083f0b3: mov    r8d,0x6
0x0083f0b9: lea    rdx,[rip+0xe6cbdc]        # 0x1416abc9c ; literal="/Water"
0x0083f0c0: mov    rcx,r12
0x0083f0c3: call   0x14006f9a0
0x0083f0c8: movzx  r9d,WORD PTR [r13+0x14]
0x0083f0cd: movzx  r8d,WORD PTR [r13+0x12]
0x0083f0d2: movzx  edx,WORD PTR [r13+0x10]
0x0083f0d7: lea    rcx,[rip+0x1b8c302]        # 0x1423cb3e0
0x0083f0de: call   0x1402c1650
0x0083f0e3: test   al,al
0x0083f0e5: jle    0x14083f141
0x0083f0e7: mov    r8d,0x1
0x0083f0ed: lea    rdx,[rip+0xda73d8]        # 0x1415e64cc ; literal="/"
0x0083f0f4: mov    rcx,r12
0x0083f0f7: call   0x14006f9a0
0x0083f0fc: movzx  r9d,WORD PTR [r13+0x14]
0x0083f101: movzx  r8d,WORD PTR [r13+0x12]
0x0083f106: movzx  edx,WORD PTR [r13+0x10]
0x0083f10b: lea    rcx,[rip+0x1b8c2ce]        # 0x1423cb3e0
0x0083f112: call   0x14007dbd0
0x0083f117: mov    rcx,r12
0x0083f11a: bt     eax,0xf
0x0083f11e: jb     0x14083f12f
0x0083f120: mov    r8d,0x4
0x0083f126: lea    rdx,[rip+0xe6cb67]        # 0x1416abc94 ; literal="Lava"
0x0083f12d: jmp    0x14083f13c
0x0083f12f: mov    r8d,0x5
0x0083f135: lea    rdx,[rip+0xdb3210]        # 0x1415f234c ; literal="Magma"
0x0083f13c: call   0x14006f9a0
0x0083f141: mov    r8d,0x1
0x0083f147: lea    rdx,[rip+0xdd118a]        # 0x1416102d8 ; literal=")"
0x0083f14e: mov    rcx,r12
0x0083f151: call   0x14006f9a0
0x0083f156: mov    rcx,QWORD PTR [rbp-0x10]
0x0083f15a: xor    rcx,rsp
0x0083f15d: call   0x1415345d0
0x0083f162: mov    rbx,QWORD PTR [rsp+0xd0]
0x0083f16a: add    rsp,0x80
0x0083f171: pop    r15
0x0083f173: pop    r14
0x0083f175: pop    r13
0x0083f177: pop    r12
0x0083f179: pop    rdi
0x0083f17a: pop    rsi
0x0083f17b: pop    rbp
0x0083f17c: ret

# classic PE:6a70b91c:0270a000; adventure_movement_climbst+8; RVA 0x83f180..0x83f466
0x0083f180: mov    QWORD PTR [rsp+0x18],rbx
0x0083f185: mov    QWORD PTR [rsp+0x20],rsi
0x0083f18a: push   rdi
0x0083f18b: sub    rsp,0x70
0x0083f18f: mov    rax,QWORD PTR [rip+0x1056eaa]        # 0x141896040
0x0083f196: xor    rax,rsp
0x0083f199: mov    QWORD PTR [rsp+0x60],rax
0x0083f19e: mov    rdi,rdx
0x0083f1a1: mov    rbx,rcx
0x0083f1a4: mov    r8d,0x9
0x0083f1aa: lea    rdx,[rip+0xe6ca9f]        # 0x1416abc50 ; literal="Climb to "
0x0083f1b1: mov    rcx,rdi
0x0083f1b4: call   0x14006f860
0x0083f1b9: xorps  xmm0,xmm0
0x0083f1bc: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083f1c1: mov    QWORD PTR [rsp+0x50],0x0
0x0083f1ca: mov    QWORD PTR [rsp+0x58],0xf
0x0083f1d3: mov    BYTE PTR [rsp+0x40],0x0
0x0083f1d8: mov    BYTE PTR [rsp+0x28],0x0
0x0083f1dd: movzx  eax,WORD PTR [rbx+0x14]
0x0083f1e1: mov    WORD PTR [rsp+0x20],ax
0x0083f1e6: movzx  r9d,WORD PTR [rbx+0x12]
0x0083f1eb: movzx  r8d,WORD PTR [rbx+0x10]
0x0083f1f0: lea    rdx,[rsp+0x40]
0x0083f1f5: lea    rcx,[rip+0x1b8c1e4]        # 0x1423cb3e0
0x0083f1fc: call   0x140e782a0
0x0083f201: lea    rdx,[rsp+0x40]
0x0083f206: cmp    QWORD PTR [rsp+0x58],0xf
0x0083f20c: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083f212: mov    r8,QWORD PTR [rsp+0x50]
0x0083f217: mov    rcx,rdi
0x0083f21a: call   0x14006f9a0
0x0083f21f: mov    esi,0xffff8ad0
0x0083f224: cmp    WORD PTR [rbx+0x16],si
0x0083f228: je     0x14083f407
0x0083f22e: mov    r8d,0x2
0x0083f234: lea    rdx,[rip+0xdd105d]        # 0x141610298 ; literal=" ("
0x0083f23b: mov    rcx,rdi
0x0083f23e: call   0x14006f9a0
0x0083f243: mov    QWORD PTR [rsp+0x30],rdi
0x0083f248: movzx  eax,WORD PTR [rbx+0x14]
0x0083f24c: mov    WORD PTR [rsp+0x28],ax
0x0083f251: movzx  eax,WORD PTR [rbx+0x12]
0x0083f255: mov    WORD PTR [rsp+0x20],ax
0x0083f25a: movzx  r9d,WORD PTR [rbx+0x10]
0x0083f25f: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083f264: movzx  edx,WORD PTR [rbx+0x18]
0x0083f268: movzx  ecx,WORD PTR [rbx+0x16]
0x0083f26c: call   0x14074cc40
0x0083f271: mov    rcx,rdi
0x0083f274: cmp    WORD PTR [rbx+0x20],si
0x0083f278: je     0x14083f2bc
0x0083f27a: mov    r8d,0x9
0x0083f280: lea    rdx,[rip+0xe6c9b9]        # 0x1416abc40 ; literal=" holding "
0x0083f287: call   0x14006f9a0
0x0083f28c: mov    QWORD PTR [rsp+0x30],rdi
0x0083f291: movzx  eax,WORD PTR [rbx+0x24]
0x0083f295: mov    WORD PTR [rsp+0x28],ax
0x0083f29a: movzx  eax,WORD PTR [rbx+0x22]
0x0083f29e: mov    WORD PTR [rsp+0x20],ax
0x0083f2a3: movzx  r9d,WORD PTR [rbx+0x20]
0x0083f2a8: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083f2ad: movzx  edx,WORD PTR [rbx+0x18]
0x0083f2b1: movzx  ecx,WORD PTR [rbx+0x16]
0x0083f2b5: call   0x14074cc40
0x0083f2ba: jmp    0x14083f2ce
0x0083f2bc: mov    r8d,0xf
0x0083f2c2: lea    rdx,[rip+0xe6c9a7]        # 0x1416abc70 ; literal=" releasing hold"
0x0083f2c9: call   0x14006f9a0
0x0083f2ce: movzx  r9d,WORD PTR [rbx+0x14]
0x0083f2d3: movzx  esi,WORD PTR [rbx+0x12]
0x0083f2d7: movzx  r8d,si
0x0083f2db: movzx  edx,WORD PTR [rbx+0x10]
0x0083f2df: lea    rcx,[rip+0x1b8c0fa]        # 0x1423cb3e0
0x0083f2e6: call   0x140067f10
0x0083f2eb: movzx  ecx,ax
0x0083f2ee: sub    ecx,0x1
0x0083f2f1: je     0x14083f302
0x0083f2f3: sub    ecx,0x1f
0x0083f2f6: je     0x14083f302
0x0083f2f8: sub    ecx,0x3
0x0083f2fb: je     0x14083f302
0x0083f2fd: cmp    ecx,0x7
0x0083f300: jne    0x14083f347
0x0083f302: movzx  r8d,si
0x0083f306: movzx  edx,WORD PTR [rbx+0x10]
0x0083f30a: lea    rcx,[rip+0x1b8c0cf]        # 0x1423cb3e0
0x0083f311: call   0x140247d10
0x0083f316: cmp    al,0x6
0x0083f318: jg     0x14083f347
0x0083f31a: movzx  r8d,si
0x0083f31e: movzx  edx,WORD PTR [rbx+0x10]
0x0083f322: lea    rcx,[rip+0x1b8c0b7]        # 0x1423cb3e0
0x0083f329: call   0x1402c1650
0x0083f32e: cmp    al,0x6
0x0083f330: jg     0x14083f347
0x0083f332: mov    r8d,0x4
0x0083f338: lea    rdx,[rip+0xe6c941]        # 0x1416abc80 ; literal="/Air"
0x0083f33f: mov    rcx,rdi
0x0083f342: call   0x14006f9a0
0x0083f347: movzx  r9d,WORD PTR [rbx+0x14]
0x0083f34c: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f351: movzx  edx,WORD PTR [rbx+0x10]
0x0083f355: lea    rcx,[rip+0x1b8c084]        # 0x1423cb3e0
0x0083f35c: call   0x140247d10
0x0083f361: test   al,al
0x0083f363: jle    0x14083f37a
0x0083f365: mov    r8d,0x6
0x0083f36b: lea    rdx,[rip+0xe6c92a]        # 0x1416abc9c ; literal="/Water"
0x0083f372: mov    rcx,rdi
0x0083f375: call   0x14006f9a0
0x0083f37a: movzx  r9d,WORD PTR [rbx+0x14]
0x0083f37f: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f384: movzx  edx,WORD PTR [rbx+0x10]
0x0083f388: lea    rcx,[rip+0x1b8c051]        # 0x1423cb3e0
0x0083f38f: call   0x1402c1650
0x0083f394: test   al,al
0x0083f396: jle    0x14083f3f1
0x0083f398: mov    r8d,0x1
0x0083f39e: lea    rdx,[rip+0xda7127]        # 0x1415e64cc ; literal="/"
0x0083f3a5: mov    rcx,rdi
0x0083f3a8: call   0x14006f9a0
0x0083f3ad: movzx  r9d,WORD PTR [rbx+0x14]
0x0083f3b2: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f3b7: movzx  edx,WORD PTR [rbx+0x10]
0x0083f3bb: lea    rcx,[rip+0x1b8c01e]        # 0x1423cb3e0
0x0083f3c2: call   0x14007dbd0
0x0083f3c7: mov    rcx,rdi
0x0083f3ca: bt     eax,0xf
0x0083f3ce: jb     0x14083f3df
0x0083f3d0: mov    r8d,0x4
0x0083f3d6: lea    rdx,[rip+0xe6c8b7]        # 0x1416abc94 ; literal="Lava"
0x0083f3dd: jmp    0x14083f3ec
0x0083f3df: mov    r8d,0x5
0x0083f3e5: lea    rdx,[rip+0xdb2f60]        # 0x1415f234c ; literal="Magma"
0x0083f3ec: call   0x14006f9a0
0x0083f3f1: mov    r8d,0x1
0x0083f3f7: lea    rdx,[rip+0xdd0eda]        # 0x1416102d8 ; literal=")"
0x0083f3fe: mov    rcx,rdi
0x0083f401: call   0x14006f9a0
0x0083f406: nop
0x0083f407: mov    rdx,QWORD PTR [rsp+0x58]
0x0083f40c: cmp    rdx,0xf
0x0083f410: jbe    0x14083f447
0x0083f412: inc    rdx
0x0083f415: mov    rcx,QWORD PTR [rsp+0x40]
0x0083f41a: mov    rax,rcx
0x0083f41d: cmp    rdx,0x1000
0x0083f424: jb     0x14083f442
0x0083f426: add    rdx,0x27
0x0083f42a: mov    rcx,QWORD PTR [rcx-0x8]
0x0083f42e: sub    rax,rcx
0x0083f431: add    rax,0xfffffffffffffff8
0x0083f435: cmp    rax,0x1f
0x0083f439: jbe    0x14083f442
0x0083f43b: call   QWORD PTR [rip+0xda165f]        # 0x1415e0aa0
0x0083f441: int3
0x0083f442: call   0x1415345f0
0x0083f447: mov    rcx,QWORD PTR [rsp+0x60]
0x0083f44c: xor    rcx,rsp
0x0083f44f: call   0x1415345d0
0x0083f454: lea    r11,[rsp+0x70]
0x0083f459: mov    rbx,QWORD PTR [r11+0x20]
0x0083f45d: mov    rsi,QWORD PTR [r11+0x28]
0x0083f461: mov    rsp,r11
0x0083f464: pop    rdi
0x0083f465: ret

# classic PE:6a70b91c:0270a000; adventure_movement_hold_tilest+8; RVA 0x83f470..0x83f777
0x0083f470: mov    QWORD PTR [rsp+0x18],rbx
0x0083f475: mov    QWORD PTR [rsp+0x20],rdi
0x0083f47a: push   r14
0x0083f47c: sub    rsp,0x70
0x0083f480: mov    rax,QWORD PTR [rip+0x1056bb9]        # 0x141896040
0x0083f487: xor    rax,rsp
0x0083f48a: mov    QWORD PTR [rsp+0x60],rax
0x0083f48f: mov    rdi,rdx
0x0083f492: mov    rbx,rcx
0x0083f495: movzx  r9d,WORD PTR [rcx+0x24]
0x0083f49a: mov    r8d,0xa
0x0083f4a0: mov    r14d,0x5
0x0083f4a6: cmp    r9w,WORD PTR [rcx+0x14]
0x0083f4ab: cmovle r8d,r14d
0x0083f4af: lea    rcx,[rip+0xe6ce6a]        # 0x1416ac320 ; literal="Hold "
0x0083f4b6: lea    rdx,[rip+0xe6c7a3]        # 0x1416abc60 ; literal="Hang from "
0x0083f4bd: cmovle rdx,rcx
0x0083f4c1: mov    rcx,rdi
0x0083f4c4: call   0x14006f860
0x0083f4c9: xorps  xmm0,xmm0
0x0083f4cc: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083f4d1: mov    QWORD PTR [rsp+0x50],0x0
0x0083f4da: mov    QWORD PTR [rsp+0x58],0xf
0x0083f4e3: mov    BYTE PTR [rsp+0x40],0x0
0x0083f4e8: mov    BYTE PTR [rsp+0x28],0x0
0x0083f4ed: movzx  eax,WORD PTR [rbx+0x24]
0x0083f4f1: mov    WORD PTR [rsp+0x20],ax
0x0083f4f6: movzx  r9d,WORD PTR [rbx+0x22]
0x0083f4fb: movzx  r8d,WORD PTR [rbx+0x20]
0x0083f500: lea    rdx,[rsp+0x40]
0x0083f505: lea    rcx,[rip+0x1b8bed4]        # 0x1423cb3e0
0x0083f50c: call   0x140e782a0
0x0083f511: lea    rdx,[rsp+0x40]
0x0083f516: cmp    QWORD PTR [rsp+0x58],0xf
0x0083f51c: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083f522: mov    r8,QWORD PTR [rsp+0x50]
0x0083f527: mov    rcx,rdi
0x0083f52a: call   0x14006f9a0
0x0083f52f: mov    eax,0xffff8ad0
0x0083f534: cmp    WORD PTR [rbx+0x16],ax
0x0083f538: je     0x14083f717
0x0083f53e: mov    r8d,0x2
0x0083f544: lea    rdx,[rip+0xdd0d4d]        # 0x141610298 ; literal=" ("
0x0083f54b: mov    rcx,rdi
0x0083f54e: call   0x14006f9a0
0x0083f553: mov    QWORD PTR [rsp+0x30],rdi
0x0083f558: movzx  eax,WORD PTR [rbx+0x24]
0x0083f55c: mov    WORD PTR [rsp+0x28],ax
0x0083f561: movzx  eax,WORD PTR [rbx+0x22]
0x0083f565: mov    WORD PTR [rsp+0x20],ax
0x0083f56a: movzx  r9d,WORD PTR [rbx+0x20]
0x0083f56f: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083f574: movzx  edx,WORD PTR [rbx+0x18]
0x0083f578: movzx  ecx,WORD PTR [rbx+0x16]
0x0083f57c: call   0x14074cc40
0x0083f581: movzx  eax,WORD PTR [rbx+0x10]
0x0083f585: cmp    WORD PTR [rbx+0x16],ax
0x0083f589: jne    0x14083f59f
0x0083f58b: movzx  eax,WORD PTR [rbx+0x12]
0x0083f58f: cmp    WORD PTR [rbx+0x18],ax
0x0083f593: jne    0x14083f59f
0x0083f595: movzx  eax,WORD PTR [rbx+0x14]
0x0083f599: cmp    WORD PTR [rbx+0x1a],ax
0x0083f59d: je     0x14083f5e2
0x0083f59f: mov    r8d,0x6
0x0083f5a5: lea    rdx,[rip+0xda93d8]        # 0x1415e8984 ; literal=" from "
0x0083f5ac: mov    rcx,rdi
0x0083f5af: call   0x14006f9a0
0x0083f5b4: mov    QWORD PTR [rsp+0x30],rdi
0x0083f5b9: movzx  eax,WORD PTR [rbx+0x14]
0x0083f5bd: mov    WORD PTR [rsp+0x28],ax
0x0083f5c2: movzx  eax,WORD PTR [rbx+0x12]
0x0083f5c6: mov    WORD PTR [rsp+0x20],ax
0x0083f5cb: movzx  r9d,WORD PTR [rbx+0x10]
0x0083f5d0: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083f5d5: movzx  edx,WORD PTR [rbx+0x18]
0x0083f5d9: movzx  ecx,WORD PTR [rbx+0x16]
0x0083f5dd: call   0x14074cc40
0x0083f5e2: movzx  r9d,WORD PTR [rbx+0x14]
0x0083f5e7: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f5ec: movzx  edx,WORD PTR [rbx+0x10]
0x0083f5f0: lea    rcx,[rip+0x1b8bde9]        # 0x1423cb3e0
0x0083f5f7: call   0x140067f10
0x0083f5fc: movzx  ecx,ax
0x0083f5ff: sub    ecx,0x1
0x0083f602: je     0x14083f613
0x0083f604: sub    ecx,0x1f
0x0083f607: je     0x14083f613
0x0083f609: sub    ecx,0x3
0x0083f60c: je     0x14083f613
0x0083f60e: cmp    ecx,0x7
0x0083f611: jne    0x14083f65a
0x0083f613: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f618: movzx  edx,WORD PTR [rbx+0x10]
0x0083f61c: lea    rcx,[rip+0x1b8bdbd]        # 0x1423cb3e0
0x0083f623: call   0x140247d10
0x0083f628: cmp    al,0x6
0x0083f62a: jg     0x14083f65a
0x0083f62c: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f631: movzx  edx,WORD PTR [rbx+0x10]
0x0083f635: lea    rcx,[rip+0x1b8bda4]        # 0x1423cb3e0
0x0083f63c: call   0x1402c1650
0x0083f641: cmp    al,0x6
0x0083f643: jg     0x14083f65a
0x0083f645: mov    r8d,0x4
0x0083f64b: lea    rdx,[rip+0xe6c62e]        # 0x1416abc80 ; literal="/Air"
0x0083f652: mov    rcx,rdi
0x0083f655: call   0x14006f9a0
0x0083f65a: movzx  r9d,WORD PTR [rbx+0x14]
0x0083f65f: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f664: movzx  edx,WORD PTR [rbx+0x10]
0x0083f668: lea    rcx,[rip+0x1b8bd71]        # 0x1423cb3e0
0x0083f66f: call   0x140247d10
0x0083f674: test   al,al
0x0083f676: jle    0x14083f68d
0x0083f678: mov    r8d,0x6
0x0083f67e: lea    rdx,[rip+0xe6c617]        # 0x1416abc9c ; literal="/Water"
0x0083f685: mov    rcx,rdi
0x0083f688: call   0x14006f9a0
0x0083f68d: movzx  r9d,WORD PTR [rbx+0x14]
0x0083f692: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f697: movzx  edx,WORD PTR [rbx+0x10]
0x0083f69b: lea    rcx,[rip+0x1b8bd3e]        # 0x1423cb3e0
0x0083f6a2: call   0x1402c1650
0x0083f6a7: test   al,al
0x0083f6a9: jle    0x14083f701
0x0083f6ab: mov    r8d,0x1
0x0083f6b1: lea    rdx,[rip+0xda6e14]        # 0x1415e64cc ; literal="/"
0x0083f6b8: mov    rcx,rdi
0x0083f6bb: call   0x14006f9a0
0x0083f6c0: movzx  r9d,WORD PTR [rbx+0x14]
0x0083f6c5: movzx  r8d,WORD PTR [rbx+0x12]
0x0083f6ca: movzx  edx,WORD PTR [rbx+0x10]
0x0083f6ce: lea    rcx,[rip+0x1b8bd0b]        # 0x1423cb3e0
0x0083f6d5: call   0x14007dbd0
0x0083f6da: mov    rcx,rdi
0x0083f6dd: bt     eax,0xf
0x0083f6e1: jb     0x14083f6f2
0x0083f6e3: mov    r8d,0x4
0x0083f6e9: lea    rdx,[rip+0xe6c5a4]        # 0x1416abc94 ; literal="Lava"
0x0083f6f0: jmp    0x14083f6fc
0x0083f6f2: mov    r8,r14
0x0083f6f5: lea    rdx,[rip+0xdb2c50]        # 0x1415f234c ; literal="Magma"
0x0083f6fc: call   0x14006f9a0
0x0083f701: mov    r8d,0x1
0x0083f707: lea    rdx,[rip+0xdd0bca]        # 0x1416102d8 ; literal=")"
0x0083f70e: mov    rcx,rdi
0x0083f711: call   0x14006f9a0
0x0083f716: nop
0x0083f717: mov    rdx,QWORD PTR [rsp+0x58]
0x0083f71c: cmp    rdx,0xf
0x0083f720: jbe    0x14083f757
0x0083f722: inc    rdx
0x0083f725: mov    rcx,QWORD PTR [rsp+0x40]
0x0083f72a: mov    rax,rcx
0x0083f72d: cmp    rdx,0x1000
0x0083f734: jb     0x14083f752
0x0083f736: add    rdx,0x27
0x0083f73a: mov    rcx,QWORD PTR [rcx-0x8]
0x0083f73e: sub    rax,rcx
0x0083f741: add    rax,0xfffffffffffffff8
0x0083f745: cmp    rax,0x1f
0x0083f749: jbe    0x14083f752
0x0083f74b: call   QWORD PTR [rip+0xda134f]        # 0x1415e0aa0
0x0083f751: int3
0x0083f752: call   0x1415345f0
0x0083f757: mov    rcx,QWORD PTR [rsp+0x60]
0x0083f75c: xor    rcx,rsp
0x0083f75f: call   0x1415345d0
0x0083f764: lea    r11,[rsp+0x70]
0x0083f769: mov    rbx,QWORD PTR [r11+0x20]
0x0083f76d: mov    rdi,QWORD PTR [r11+0x28]
0x0083f771: mov    rsp,r11
0x0083f774: pop    r14
0x0083f776: ret

# classic PE:6a70b91c:0270a000; adventure_movement_mountst+8; RVA 0x83f780..0x83f8c1
0x0083f780: mov    QWORD PTR [rsp+0x18],rbx
0x0083f785: push   rdi
0x0083f786: sub    rsp,0x70
0x0083f78a: mov    rax,QWORD PTR [rip+0x10568af]        # 0x141896040
0x0083f791: xor    rax,rsp
0x0083f794: mov    QWORD PTR [rsp+0x60],rax
0x0083f799: mov    rdi,rdx
0x0083f79c: mov    rbx,rcx
0x0083f79f: mov    r8d,0x6
0x0083f7a5: lea    rdx,[rip+0xe6cb6c]        # 0x1416ac318 ; literal="Mount "
0x0083f7ac: mov    rcx,rdi
0x0083f7af: call   0x14006f860
0x0083f7b4: xorps  xmm0,xmm0
0x0083f7b7: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083f7bc: mov    QWORD PTR [rsp+0x50],0x0
0x0083f7c5: mov    QWORD PTR [rsp+0x58],0xf
0x0083f7ce: mov    BYTE PTR [rsp+0x40],0x0
0x0083f7d3: xor    r8d,r8d
0x0083f7d6: lea    rdx,[rsp+0x40]
0x0083f7db: mov    rcx,QWORD PTR [rbx+0x20]
0x0083f7df: call   0x14132bba0
0x0083f7e4: lea    rdx,[rsp+0x40]
0x0083f7e9: cmp    QWORD PTR [rsp+0x58],0xf
0x0083f7ef: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083f7f5: mov    r8,QWORD PTR [rsp+0x50]
0x0083f7fa: mov    rcx,rdi
0x0083f7fd: call   0x14006f9a0
0x0083f802: mov    eax,0xffff8ad0
0x0083f807: cmp    WORD PTR [rbx+0x16],ax
0x0083f80b: je     0x14083f866
0x0083f80d: mov    r8d,0x2
0x0083f813: lea    rdx,[rip+0xdd0a7e]        # 0x141610298 ; literal=" ("
0x0083f81a: mov    rcx,rdi
0x0083f81d: call   0x14006f9a0
0x0083f822: mov    QWORD PTR [rsp+0x30],rdi
0x0083f827: movzx  eax,WORD PTR [rbx+0x14]
0x0083f82b: mov    WORD PTR [rsp+0x28],ax
0x0083f830: movzx  eax,WORD PTR [rbx+0x12]
0x0083f834: mov    WORD PTR [rsp+0x20],ax
0x0083f839: movzx  r9d,WORD PTR [rbx+0x10]
0x0083f83e: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083f843: movzx  edx,WORD PTR [rbx+0x18]
0x0083f847: movzx  ecx,WORD PTR [rbx+0x16]
0x0083f84b: call   0x14074cc40
0x0083f850: mov    r8d,0x1
0x0083f856: lea    rdx,[rip+0xdd0a7b]        # 0x1416102d8 ; literal=")"
0x0083f85d: mov    rcx,rdi
0x0083f860: call   0x14006f9a0
0x0083f865: nop
0x0083f866: mov    rdx,QWORD PTR [rsp+0x58]
0x0083f86b: cmp    rdx,0xf
0x0083f86f: jbe    0x14083f8a6
0x0083f871: inc    rdx
0x0083f874: mov    rcx,QWORD PTR [rsp+0x40]
0x0083f879: mov    rax,rcx
0x0083f87c: cmp    rdx,0x1000
0x0083f883: jb     0x14083f8a1
0x0083f885: add    rdx,0x27
0x0083f889: mov    rcx,QWORD PTR [rcx-0x8]
0x0083f88d: sub    rax,rcx
0x0083f890: add    rax,0xfffffffffffffff8
0x0083f894: cmp    rax,0x1f
0x0083f898: jbe    0x14083f8a1
0x0083f89a: call   QWORD PTR [rip+0xda1200]        # 0x1415e0aa0
0x0083f8a0: int3
0x0083f8a1: call   0x1415345f0
0x0083f8a6: mov    rcx,QWORD PTR [rsp+0x60]
0x0083f8ab: xor    rcx,rsp
0x0083f8ae: call   0x1415345d0
0x0083f8b3: mov    rbx,QWORD PTR [rsp+0x90]
0x0083f8bb: add    rsp,0x70
0x0083f8bf: pop    rdi
0x0083f8c0: ret

# classic PE:6a70b91c:0270a000; adventure_movement_dismountst+8; RVA 0x83f8d0..0x83fa29
0x0083f8d0: mov    QWORD PTR [rsp+0x18],rbx
0x0083f8d5: push   rdi
0x0083f8d6: sub    rsp,0x70
0x0083f8da: mov    rax,QWORD PTR [rip+0x105675f]        # 0x141896040
0x0083f8e1: xor    rax,rsp
0x0083f8e4: mov    QWORD PTR [rsp+0x60],rax
0x0083f8e9: mov    rdi,rdx
0x0083f8ec: mov    rbx,rcx
0x0083f8ef: mov    r8d,0xc
0x0083f8f5: lea    rdx,[rip+0xe6ca44]        # 0x1416ac340 ; literal="Dismount to "
0x0083f8fc: mov    rcx,rdi
0x0083f8ff: call   0x14006f860
0x0083f904: xorps  xmm0,xmm0
0x0083f907: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083f90c: mov    QWORD PTR [rsp+0x50],0x0
0x0083f915: mov    QWORD PTR [rsp+0x58],0xf
0x0083f91e: mov    BYTE PTR [rsp+0x40],0x0
0x0083f923: mov    BYTE PTR [rsp+0x28],0x0
0x0083f928: movzx  eax,WORD PTR [rbx+0x14]
0x0083f92c: mov    WORD PTR [rsp+0x20],ax
0x0083f931: movzx  r9d,WORD PTR [rbx+0x12]
0x0083f936: movzx  r8d,WORD PTR [rbx+0x10]
0x0083f93b: lea    rdx,[rsp+0x40]
0x0083f940: lea    rcx,[rip+0x1b8ba99]        # 0x1423cb3e0
0x0083f947: call   0x140e782a0
0x0083f94c: lea    rdx,[rsp+0x40]
0x0083f951: cmp    QWORD PTR [rsp+0x58],0xf
0x0083f957: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083f95d: mov    r8,QWORD PTR [rsp+0x50]
0x0083f962: mov    rcx,rdi
0x0083f965: call   0x14006f9a0
0x0083f96a: mov    eax,0xffff8ad0
0x0083f96f: cmp    WORD PTR [rbx+0x16],ax
0x0083f973: je     0x14083f9ce
0x0083f975: mov    r8d,0x2
0x0083f97b: lea    rdx,[rip+0xdd0916]        # 0x141610298 ; literal=" ("
0x0083f982: mov    rcx,rdi
0x0083f985: call   0x14006f9a0
0x0083f98a: mov    QWORD PTR [rsp+0x30],rdi
0x0083f98f: movzx  eax,WORD PTR [rbx+0x14]
0x0083f993: mov    WORD PTR [rsp+0x28],ax
0x0083f998: movzx  eax,WORD PTR [rbx+0x12]
0x0083f99c: mov    WORD PTR [rsp+0x20],ax
0x0083f9a1: movzx  r9d,WORD PTR [rbx+0x10]
0x0083f9a6: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083f9ab: movzx  edx,WORD PTR [rbx+0x18]
0x0083f9af: movzx  ecx,WORD PTR [rbx+0x16]
0x0083f9b3: call   0x14074cc40
0x0083f9b8: mov    r8d,0x1
0x0083f9be: lea    rdx,[rip+0xdd0913]        # 0x1416102d8 ; literal=")"
0x0083f9c5: mov    rcx,rdi
0x0083f9c8: call   0x14006f9a0
0x0083f9cd: nop
0x0083f9ce: mov    rdx,QWORD PTR [rsp+0x58]
0x0083f9d3: cmp    rdx,0xf
0x0083f9d7: jbe    0x14083fa0e
0x0083f9d9: inc    rdx
0x0083f9dc: mov    rcx,QWORD PTR [rsp+0x40]
0x0083f9e1: mov    rax,rcx
0x0083f9e4: cmp    rdx,0x1000
0x0083f9eb: jb     0x14083fa09
0x0083f9ed: add    rdx,0x27
0x0083f9f1: mov    rcx,QWORD PTR [rcx-0x8]
0x0083f9f5: sub    rax,rcx
0x0083f9f8: add    rax,0xfffffffffffffff8
0x0083f9fc: cmp    rax,0x1f
0x0083fa00: jbe    0x14083fa09
0x0083fa02: call   QWORD PTR [rip+0xda1098]        # 0x1415e0aa0
0x0083fa08: int3
0x0083fa09: call   0x1415345f0
0x0083fa0e: mov    rcx,QWORD PTR [rsp+0x60]
0x0083fa13: xor    rcx,rsp
0x0083fa16: call   0x1415345d0
0x0083fa1b: mov    rbx,QWORD PTR [rsp+0x90]
0x0083fa23: add    rsp,0x70
0x0083fa27: pop    rdi
0x0083fa28: ret

# classic PE:6a70b91c:0270a000; adventure_movement_release_hold_tilest+8; RVA 0x83fa30..0x83fb26
0x0083fa30: mov    QWORD PTR [rsp+0x18],rbx
0x0083fa35: push   rdi
0x0083fa36: sub    rsp,0x60
0x0083fa3a: mov    rax,QWORD PTR [rip+0x10565ff]        # 0x141896040
0x0083fa41: xor    rax,rsp
0x0083fa44: mov    QWORD PTR [rsp+0x50],rax
0x0083fa49: mov    rdi,rdx
0x0083fa4c: mov    rbx,rcx
0x0083fa4f: mov    r8d,0x10
0x0083fa55: lea    rdx,[rip+0xe6c8cc]        # 0x1416ac328 ; literal="Release hold on "
0x0083fa5c: mov    rcx,rdi
0x0083fa5f: call   0x14006f860
0x0083fa64: xorps  xmm0,xmm0
0x0083fa67: movups XMMWORD PTR [rsp+0x30],xmm0
0x0083fa6c: mov    QWORD PTR [rsp+0x40],0x0
0x0083fa75: mov    QWORD PTR [rsp+0x48],0xf
0x0083fa7e: mov    BYTE PTR [rsp+0x30],0x0
0x0083fa83: mov    BYTE PTR [rsp+0x28],0x0
0x0083fa88: movzx  eax,WORD PTR [rbx+0x14]
0x0083fa8c: mov    WORD PTR [rsp+0x20],ax
0x0083fa91: movzx  r9d,WORD PTR [rbx+0x12]
0x0083fa96: movzx  r8d,WORD PTR [rbx+0x10]
0x0083fa9b: lea    rdx,[rsp+0x30]
0x0083faa0: lea    rcx,[rip+0x1b8b939]        # 0x1423cb3e0
0x0083faa7: call   0x140e782a0
0x0083faac: lea    rdx,[rsp+0x30]
0x0083fab1: cmp    QWORD PTR [rsp+0x48],0xf
0x0083fab7: cmova  rdx,QWORD PTR [rsp+0x30]
0x0083fabd: mov    r8,QWORD PTR [rsp+0x40]
0x0083fac2: mov    rcx,rdi
0x0083fac5: call   0x14006f9a0
0x0083faca: nop
0x0083facb: mov    rdx,QWORD PTR [rsp+0x48]
0x0083fad0: cmp    rdx,0xf
0x0083fad4: jbe    0x14083fb0b
0x0083fad6: inc    rdx
0x0083fad9: mov    rcx,QWORD PTR [rsp+0x30]
0x0083fade: mov    rax,rcx
0x0083fae1: cmp    rdx,0x1000
0x0083fae8: jb     0x14083fb06
0x0083faea: add    rdx,0x27
0x0083faee: mov    rcx,QWORD PTR [rcx-0x8]
0x0083faf2: sub    rax,rcx
0x0083faf5: add    rax,0xfffffffffffffff8
0x0083faf9: cmp    rax,0x1f
0x0083fafd: jbe    0x14083fb06
0x0083faff: call   QWORD PTR [rip+0xda0f9b]        # 0x1415e0aa0
0x0083fb05: int3
0x0083fb06: call   0x1415345f0
0x0083fb0b: mov    rcx,QWORD PTR [rsp+0x50]
0x0083fb10: xor    rcx,rsp
0x0083fb13: call   0x1415345d0
0x0083fb18: mov    rbx,QWORD PTR [rsp+0x80]
0x0083fb20: add    rsp,0x60
0x0083fb24: pop    rdi
0x0083fb25: ret

# classic PE:6a70b91c:0270a000; adventure_movement_hold_itemst+8; RVA 0x83fb30..0x83fe24
0x0083fb30: mov    QWORD PTR [rsp+0x18],rbx
0x0083fb35: mov    QWORD PTR [rsp+0x20],rsi
0x0083fb3a: push   rdi
0x0083fb3b: sub    rsp,0x70
0x0083fb3f: mov    rax,QWORD PTR [rip+0x10564fa]        # 0x141896040
0x0083fb46: xor    rax,rsp
0x0083fb49: mov    QWORD PTR [rsp+0x60],rax
0x0083fb4e: mov    rsi,rdx
0x0083fb51: mov    rdi,rcx
0x0083fb54: mov    r8d,0x5
0x0083fb5a: lea    rdx,[rip+0xe37e2b]        # 0x14167798c ; literal="Climb"
0x0083fb61: mov    rcx,rsi
0x0083fb64: call   0x14006f860
0x0083fb69: mov    r10d,DWORD PTR [rdi+0x20]
0x0083fb6d: mov    r8,QWORD PTR [rip+0x1b9f7d4]        # 0x1423df348
0x0083fb74: mov    r11,QWORD PTR [rip+0x1b9f7c5]        # 0x1423df340
0x0083fb7b: sub    r8,r11
0x0083fb7e: sar    r8,0x3
0x0083fb82: test   r8d,r8d
0x0083fb85: je     0x14083fbc7
0x0083fb87: cmp    r10d,0xffffffff
0x0083fb8b: je     0x14083fbc7
0x0083fb8d: xor    edx,edx
0x0083fb8f: sub    r8d,0x1
0x0083fb93: js     0x14083fbc7
0x0083fb95: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x0083fba0: lea    ecx,[rdx+r8*1]
0x0083fba4: sar    ecx,1
0x0083fba6: movsxd rax,ecx
0x0083fba9: mov    rbx,QWORD PTR [r11+rax*8]
0x0083fbad: cmp    DWORD PTR [rbx+0x1c],r10d
0x0083fbb1: je     0x14083fbc9
0x0083fbb3: lea    eax,[rcx+0x1]
0x0083fbb6: cmovle edx,eax
0x0083fbb9: lea    eax,[rcx-0x1]
0x0083fbbc: cmovle eax,r8d
0x0083fbc0: mov    r8d,eax
0x0083fbc3: cmp    edx,eax
0x0083fbc5: jle    0x14083fba0
0x0083fbc7: xor    ebx,ebx
0x0083fbc9: test   rbx,rbx
0x0083fbcc: je     0x14083fc7b
0x0083fbd2: mov    r8d,0x1
0x0083fbd8: lea    rdx,[rip+0xda3b41]        # 0x1415e3720 ; literal=" "
0x0083fbdf: mov    rcx,rsi
0x0083fbe2: call   0x14006f9a0
0x0083fbe7: xorps  xmm0,xmm0
0x0083fbea: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083fbef: mov    QWORD PTR [rsp+0x50],0x0
0x0083fbf8: mov    QWORD PTR [rsp+0x58],0xf
0x0083fc01: mov    BYTE PTR [rsp+0x40],0x0
0x0083fc06: mov    r9d,0xffffffff
0x0083fc0c: xor    r8d,r8d
0x0083fc0f: lea    rdx,[rsp+0x40]
0x0083fc14: mov    rcx,rbx
0x0083fc17: call   0x140c62490
0x0083fc1c: lea    rdx,[rsp+0x40]
0x0083fc21: cmp    QWORD PTR [rsp+0x58],0xf
0x0083fc27: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083fc2d: mov    r8,QWORD PTR [rsp+0x50]
0x0083fc32: mov    rcx,rsi
0x0083fc35: call   0x14006f9a0
0x0083fc3a: nop
0x0083fc3b: mov    rdx,QWORD PTR [rsp+0x58]
0x0083fc40: cmp    rdx,0xf
0x0083fc44: jbe    0x14083fc7b
0x0083fc46: inc    rdx
0x0083fc49: mov    rcx,QWORD PTR [rsp+0x40]
0x0083fc4e: mov    rax,rcx
0x0083fc51: cmp    rdx,0x1000
0x0083fc58: jb     0x14083fc76
0x0083fc5a: add    rdx,0x27
0x0083fc5e: mov    rcx,QWORD PTR [rcx-0x8]
0x0083fc62: sub    rax,rcx
0x0083fc65: add    rax,0xfffffffffffffff8
0x0083fc69: cmp    rax,0x1f
0x0083fc6d: jbe    0x14083fc76
0x0083fc6f: call   QWORD PTR [rip+0xda0e2b]        # 0x1415e0aa0
0x0083fc75: int3
0x0083fc76: call   0x1415345f0
0x0083fc7b: mov    eax,0xffff8ad0
0x0083fc80: cmp    WORD PTR [rdi+0x16],ax
0x0083fc84: je     0x14083fe05
0x0083fc8a: mov    r8d,0x2
0x0083fc90: lea    rdx,[rip+0xdd0601]        # 0x141610298 ; literal=" ("
0x0083fc97: mov    rcx,rsi
0x0083fc9a: call   0x14006f9a0
0x0083fc9f: mov    QWORD PTR [rsp+0x30],rsi
0x0083fca4: movzx  eax,WORD PTR [rdi+0x14]
0x0083fca8: mov    WORD PTR [rsp+0x28],ax
0x0083fcad: movzx  eax,WORD PTR [rdi+0x12]
0x0083fcb1: mov    WORD PTR [rsp+0x20],ax
0x0083fcb6: movzx  r9d,WORD PTR [rdi+0x10]
0x0083fcbb: movzx  r8d,WORD PTR [rdi+0x1a]
0x0083fcc0: movzx  edx,WORD PTR [rdi+0x18]
0x0083fcc4: movzx  ecx,WORD PTR [rdi+0x16]
0x0083fcc8: call   0x14074cc40
0x0083fccd: movzx  r9d,WORD PTR [rdi+0x14]
0x0083fcd2: movzx  ebx,WORD PTR [rdi+0x12]
0x0083fcd6: movzx  r8d,bx
0x0083fcda: movzx  edx,WORD PTR [rdi+0x10]
0x0083fcde: lea    rcx,[rip+0x1b8b6fb]        # 0x1423cb3e0
0x0083fce5: call   0x140067f10
0x0083fcea: movzx  ecx,ax
0x0083fced: sub    ecx,0x1
0x0083fcf0: je     0x14083fd01
0x0083fcf2: sub    ecx,0x1f
0x0083fcf5: je     0x14083fd01
0x0083fcf7: sub    ecx,0x3
0x0083fcfa: je     0x14083fd01
0x0083fcfc: cmp    ecx,0x7
0x0083fcff: jne    0x14083fd46
0x0083fd01: movzx  r8d,bx
0x0083fd05: movzx  edx,WORD PTR [rdi+0x10]
0x0083fd09: lea    rcx,[rip+0x1b8b6d0]        # 0x1423cb3e0
0x0083fd10: call   0x140247d10
0x0083fd15: cmp    al,0x6
0x0083fd17: jg     0x14083fd46
0x0083fd19: movzx  r8d,bx
0x0083fd1d: movzx  edx,WORD PTR [rdi+0x10]
0x0083fd21: lea    rcx,[rip+0x1b8b6b8]        # 0x1423cb3e0
0x0083fd28: call   0x1402c1650
0x0083fd2d: cmp    al,0x6
0x0083fd2f: jg     0x14083fd46
0x0083fd31: mov    r8d,0x4
0x0083fd37: lea    rdx,[rip+0xe6bf42]        # 0x1416abc80 ; literal="/Air"
0x0083fd3e: mov    rcx,rsi
0x0083fd41: call   0x14006f9a0
0x0083fd46: movzx  r9d,WORD PTR [rdi+0x14]
0x0083fd4b: movzx  r8d,WORD PTR [rdi+0x12]
0x0083fd50: movzx  edx,WORD PTR [rdi+0x10]
0x0083fd54: lea    rcx,[rip+0x1b8b685]        # 0x1423cb3e0
0x0083fd5b: call   0x140247d10
0x0083fd60: test   al,al
0x0083fd62: jle    0x14083fd79
0x0083fd64: mov    r8d,0x6
0x0083fd6a: lea    rdx,[rip+0xe6bf2b]        # 0x1416abc9c ; literal="/Water"
0x0083fd71: mov    rcx,rsi
0x0083fd74: call   0x14006f9a0
0x0083fd79: movzx  r9d,WORD PTR [rdi+0x14]
0x0083fd7e: movzx  r8d,WORD PTR [rdi+0x12]
0x0083fd83: movzx  edx,WORD PTR [rdi+0x10]
0x0083fd87: lea    rcx,[rip+0x1b8b652]        # 0x1423cb3e0
0x0083fd8e: call   0x1402c1650
0x0083fd93: test   al,al
0x0083fd95: jle    0x14083fdf0
0x0083fd97: mov    r8d,0x1
0x0083fd9d: lea    rdx,[rip+0xda6728]        # 0x1415e64cc ; literal="/"
0x0083fda4: mov    rcx,rsi
0x0083fda7: call   0x14006f9a0
0x0083fdac: movzx  r9d,WORD PTR [rdi+0x14]
0x0083fdb1: movzx  r8d,WORD PTR [rdi+0x12]
0x0083fdb6: movzx  edx,WORD PTR [rdi+0x10]
0x0083fdba: lea    rcx,[rip+0x1b8b61f]        # 0x1423cb3e0
0x0083fdc1: call   0x14007dbd0
0x0083fdc6: mov    rcx,rsi
0x0083fdc9: bt     eax,0xf
0x0083fdcd: jb     0x14083fdde
0x0083fdcf: mov    r8d,0x4
0x0083fdd5: lea    rdx,[rip+0xe6beb8]        # 0x1416abc94 ; literal="Lava"
0x0083fddc: jmp    0x14083fdeb
0x0083fdde: mov    r8d,0x5
0x0083fde4: lea    rdx,[rip+0xdb2561]        # 0x1415f234c ; literal="Magma"
0x0083fdeb: call   0x14006f9a0
0x0083fdf0: mov    r8d,0x1
0x0083fdf6: lea    rdx,[rip+0xdd04db]        # 0x1416102d8 ; literal=")"
0x0083fdfd: mov    rcx,rsi
0x0083fe00: call   0x14006f9a0
0x0083fe05: mov    rcx,QWORD PTR [rsp+0x60]
0x0083fe0a: xor    rcx,rsp
0x0083fe0d: call   0x1415345d0
0x0083fe12: lea    r11,[rsp+0x70]
0x0083fe17: mov    rbx,QWORD PTR [r11+0x20]
0x0083fe1b: mov    rsi,QWORD PTR [r11+0x28]
0x0083fe1f: mov    rsp,r11
0x0083fe22: pop    rdi
0x0083fe23: ret

# classic PE:6a70b91c:0270a000; adventure_movement_claim_petst+8; RVA 0x83fe30..0x83ff86
0x0083fe30: mov    QWORD PTR [rsp+0x18],rbx
0x0083fe35: push   rdi
0x0083fe36: sub    rsp,0x70
0x0083fe3a: mov    rax,QWORD PTR [rip+0x10561ff]        # 0x141896040
0x0083fe41: xor    rax,rsp
0x0083fe44: mov    QWORD PTR [rsp+0x60],rax
0x0083fe49: mov    rdi,rdx
0x0083fe4c: mov    rbx,rcx
0x0083fe4f: mov    r8d,0x6
0x0083fe55: lea    rdx,[rip+0xe6c494]        # 0x1416ac2f0 ; literal="Claim "
0x0083fe5c: mov    rcx,rdi
0x0083fe5f: call   0x14006f860
0x0083fe64: xorps  xmm0,xmm0
0x0083fe67: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083fe6c: mov    QWORD PTR [rsp+0x50],0x0
0x0083fe75: mov    QWORD PTR [rsp+0x58],0xf
0x0083fe7e: mov    BYTE PTR [rsp+0x40],0x0
0x0083fe83: xor    r8d,r8d
0x0083fe86: lea    rdx,[rsp+0x40]
0x0083fe8b: mov    rcx,QWORD PTR [rbx+0x20]
0x0083fe8f: call   0x14132bba0
0x0083fe94: lea    rdx,[rsp+0x40]
0x0083fe99: cmp    QWORD PTR [rsp+0x58],0xf
0x0083fe9f: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083fea5: mov    r8,QWORD PTR [rsp+0x50]
0x0083feaa: mov    rcx,rdi
0x0083fead: call   0x14006f9a0
0x0083feb2: mov    eax,0xffff8ad0
0x0083feb7: cmp    WORD PTR [rbx+0x16],ax
0x0083febb: je     0x14083ff15
0x0083febd: mov    r8d,0x2
0x0083fec3: lea    rdx,[rip+0xdd03ce]        # 0x141610298 ; literal=" ("
0x0083feca: mov    rcx,rdi
0x0083fecd: call   0x14006f9a0
0x0083fed2: mov    QWORD PTR [rsp+0x30],rdi
0x0083fed7: movzx  eax,WORD PTR [rbx+0x14]
0x0083fedb: mov    WORD PTR [rsp+0x28],ax
0x0083fee0: movzx  eax,WORD PTR [rbx+0x12]
0x0083fee4: mov    WORD PTR [rsp+0x20],ax
0x0083fee9: movzx  r9d,WORD PTR [rbx+0x10]
0x0083feee: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083fef3: movzx  edx,WORD PTR [rbx+0x18]
0x0083fef7: movzx  ecx,WORD PTR [rbx+0x16]
0x0083fefb: call   0x14074cc40
0x0083ff00: mov    r8d,0x1
0x0083ff06: lea    rdx,[rip+0xdd03cb]        # 0x1416102d8 ; literal=")"
0x0083ff0d: mov    rcx,rdi
0x0083ff10: call   0x14006f9a0
0x0083ff15: mov    r8d,0x7
0x0083ff1b: lea    rdx,[rip+0xe6c3c6]        # 0x1416ac2e8 ; literal=" as pet"
0x0083ff22: mov    rcx,rdi
0x0083ff25: call   0x14006f9a0
0x0083ff2a: nop
0x0083ff2b: mov    rdx,QWORD PTR [rsp+0x58]
0x0083ff30: cmp    rdx,0xf
0x0083ff34: jbe    0x14083ff6b
0x0083ff36: inc    rdx
0x0083ff39: mov    rcx,QWORD PTR [rsp+0x40]
0x0083ff3e: mov    rax,rcx
0x0083ff41: cmp    rdx,0x1000
0x0083ff48: jb     0x14083ff66
0x0083ff4a: add    rdx,0x27
0x0083ff4e: mov    rcx,QWORD PTR [rcx-0x8]
0x0083ff52: sub    rax,rcx
0x0083ff55: add    rax,0xfffffffffffffff8
0x0083ff59: cmp    rax,0x1f
0x0083ff5d: jbe    0x14083ff66
0x0083ff5f: call   QWORD PTR [rip+0xda0b3b]        # 0x1415e0aa0
0x0083ff65: int3
0x0083ff66: call   0x1415345f0
0x0083ff6b: mov    rcx,QWORD PTR [rsp+0x60]
0x0083ff70: xor    rcx,rsp
0x0083ff73: call   0x1415345d0
0x0083ff78: mov    rbx,QWORD PTR [rsp+0x90]
0x0083ff80: add    rsp,0x70
0x0083ff84: pop    rdi
0x0083ff85: ret

# classic PE:6a70b91c:0270a000; adventure_movement_lead_animalst+8; RVA 0x83ff90..0x8400d1
0x0083ff90: mov    QWORD PTR [rsp+0x18],rbx
0x0083ff95: push   rdi
0x0083ff96: sub    rsp,0x70
0x0083ff9a: mov    rax,QWORD PTR [rip+0x105609f]        # 0x141896040
0x0083ffa1: xor    rax,rsp
0x0083ffa4: mov    QWORD PTR [rsp+0x60],rax
0x0083ffa9: mov    rdi,rdx
0x0083ffac: mov    rbx,rcx
0x0083ffaf: mov    r8d,0x5
0x0083ffb5: lea    rdx,[rip+0xda3af4]        # 0x1415e3ab0 ; literal="Lead "
0x0083ffbc: mov    rcx,rdi
0x0083ffbf: call   0x14006f860
0x0083ffc4: xorps  xmm0,xmm0
0x0083ffc7: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083ffcc: mov    QWORD PTR [rsp+0x50],0x0
0x0083ffd5: mov    QWORD PTR [rsp+0x58],0xf
0x0083ffde: mov    BYTE PTR [rsp+0x40],0x0
0x0083ffe3: xor    r8d,r8d
0x0083ffe6: lea    rdx,[rsp+0x40]
0x0083ffeb: mov    rcx,QWORD PTR [rbx+0x20]
0x0083ffef: call   0x14132bba0
0x0083fff4: lea    rdx,[rsp+0x40]
0x0083fff9: cmp    QWORD PTR [rsp+0x58],0xf
0x0083ffff: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840005: mov    r8,QWORD PTR [rsp+0x50]
0x0084000a: mov    rcx,rdi
0x0084000d: call   0x14006f9a0
0x00840012: mov    eax,0xffff8ad0
0x00840017: cmp    WORD PTR [rbx+0x16],ax
0x0084001b: je     0x140840076
0x0084001d: mov    r8d,0x2
0x00840023: lea    rdx,[rip+0xdd026e]        # 0x141610298 ; literal=" ("
0x0084002a: mov    rcx,rdi
0x0084002d: call   0x14006f9a0
0x00840032: mov    QWORD PTR [rsp+0x30],rdi
0x00840037: movzx  eax,WORD PTR [rbx+0x14]
0x0084003b: mov    WORD PTR [rsp+0x28],ax
0x00840040: movzx  eax,WORD PTR [rbx+0x12]
0x00840044: mov    WORD PTR [rsp+0x20],ax
0x00840049: movzx  r9d,WORD PTR [rbx+0x10]
0x0084004e: movzx  r8d,WORD PTR [rbx+0x1a]
0x00840053: movzx  edx,WORD PTR [rbx+0x18]
0x00840057: movzx  ecx,WORD PTR [rbx+0x16]
0x0084005b: call   0x14074cc40
0x00840060: mov    r8d,0x1
0x00840066: lea    rdx,[rip+0xdd026b]        # 0x1416102d8 ; literal=")"
0x0084006d: mov    rcx,rdi
0x00840070: call   0x14006f9a0
0x00840075: nop
0x00840076: mov    rdx,QWORD PTR [rsp+0x58]
0x0084007b: cmp    rdx,0xf
0x0084007f: jbe    0x1408400b6
0x00840081: inc    rdx
0x00840084: mov    rcx,QWORD PTR [rsp+0x40]
0x00840089: mov    rax,rcx
0x0084008c: cmp    rdx,0x1000
0x00840093: jb     0x1408400b1
0x00840095: add    rdx,0x27
0x00840099: mov    rcx,QWORD PTR [rcx-0x8]
0x0084009d: sub    rax,rcx
0x008400a0: add    rax,0xfffffffffffffff8
0x008400a4: cmp    rax,0x1f
0x008400a8: jbe    0x1408400b1
0x008400aa: call   QWORD PTR [rip+0xda09f0]        # 0x1415e0aa0
0x008400b0: int3
0x008400b1: call   0x1415345f0
0x008400b6: mov    rcx,QWORD PTR [rsp+0x60]
0x008400bb: xor    rcx,rsp
0x008400be: call   0x1415345d0
0x008400c3: mov    rbx,QWORD PTR [rsp+0x90]
0x008400cb: add    rsp,0x70
0x008400cf: pop    rdi
0x008400d0: ret

# classic PE:6a70b91c:0270a000; adventure_movement_stop_lead_animalst+8; RVA 0x8400e0..0x8401bb
0x008400e0: mov    QWORD PTR [rsp+0x18],rbx
0x008400e5: push   rdi
0x008400e6: sub    rsp,0x50
0x008400ea: mov    rax,QWORD PTR [rip+0x1055f4f]        # 0x141896040
0x008400f1: xor    rax,rsp
0x008400f4: mov    QWORD PTR [rsp+0x40],rax
0x008400f9: mov    rdi,rdx
0x008400fc: mov    rbx,rcx
0x008400ff: mov    r8d,0xd
0x00840105: lea    rdx,[rip+0xe6c1fc]        # 0x1416ac308 ; literal="Stop leading "
0x0084010c: mov    rcx,rdi
0x0084010f: call   0x14006f860
0x00840114: xorps  xmm0,xmm0
0x00840117: movups XMMWORD PTR [rsp+0x20],xmm0
0x0084011c: mov    QWORD PTR [rsp+0x30],0x0
0x00840125: mov    QWORD PTR [rsp+0x38],0xf
0x0084012e: mov    BYTE PTR [rsp+0x20],0x0
0x00840133: xor    r8d,r8d
0x00840136: lea    rdx,[rsp+0x20]
0x0084013b: mov    rcx,QWORD PTR [rbx+0x20]
0x0084013f: call   0x14132bba0
0x00840144: lea    rdx,[rsp+0x20]
0x00840149: cmp    QWORD PTR [rsp+0x38],0xf
0x0084014f: cmova  rdx,QWORD PTR [rsp+0x20]
0x00840155: mov    r8,QWORD PTR [rsp+0x30]
0x0084015a: mov    rcx,rdi
0x0084015d: call   0x14006f9a0
0x00840162: nop
0x00840163: mov    rdx,QWORD PTR [rsp+0x38]
0x00840168: cmp    rdx,0xf
0x0084016c: jbe    0x1408401a3
0x0084016e: inc    rdx
0x00840171: mov    rcx,QWORD PTR [rsp+0x20]
0x00840176: mov    rax,rcx
0x00840179: cmp    rdx,0x1000
0x00840180: jb     0x14084019e
0x00840182: add    rdx,0x27
0x00840186: mov    rcx,QWORD PTR [rcx-0x8]
0x0084018a: sub    rax,rcx
0x0084018d: add    rax,0xfffffffffffffff8
0x00840191: cmp    rax,0x1f
0x00840195: jbe    0x14084019e
0x00840197: call   QWORD PTR [rip+0xda0903]        # 0x1415e0aa0
0x0084019d: int3
0x0084019e: call   0x1415345f0
0x008401a3: mov    rcx,QWORD PTR [rsp+0x40]
0x008401a8: xor    rcx,rsp
0x008401ab: call   0x1415345d0
0x008401b0: mov    rbx,QWORD PTR [rsp+0x70]
0x008401b5: add    rsp,0x50
0x008401b9: pop    rdi
0x008401ba: ret

# classic PE:6a70b91c:0270a000; adventure_movement_release_hold_itemst+8; RVA 0x8401c0..0x840323
0x008401c0: mov    QWORD PTR [rsp+0x8],rbx
0x008401c5: push   rdi
0x008401c6: sub    rsp,0x50
0x008401ca: mov    rax,QWORD PTR [rip+0x1055e6f]        # 0x141896040
0x008401d1: xor    rax,rsp
0x008401d4: mov    QWORD PTR [rsp+0x40],rax
0x008401d9: mov    rdi,rdx
0x008401dc: mov    r8d,0xa
0x008401e2: lea    rdx,[rip+0xe6c10f]        # 0x1416ac2f8 ; literal="Climb down"
0x008401e9: mov    rcx,rdi
0x008401ec: call   0x14006f860
0x008401f1: mov    rax,QWORD PTR [rip+0x1b9ee08]        # 0x1423df000
0x008401f8: mov    r10d,DWORD PTR [rax+0x4d4]
0x008401ff: mov    r9,QWORD PTR [rip+0x1b9f142]        # 0x1423df348
0x00840206: mov    r11,QWORD PTR [rip+0x1b9f133]        # 0x1423df340
0x0084020d: sub    r9,r11
0x00840210: sar    r9,0x3
0x00840214: test   r9d,r9d
0x00840217: je     0x140840257
0x00840219: cmp    r10d,0xffffffff
0x0084021d: je     0x140840257
0x0084021f: xor    edx,edx
0x00840221: sub    r9d,0x1
0x00840225: js     0x140840257
0x00840227: nop    WORD PTR [rax+rax*1+0x0]
0x00840230: lea    ecx,[rdx+r9*1]
0x00840234: sar    ecx,1
0x00840236: movsxd rax,ecx
0x00840239: mov    rbx,QWORD PTR [r11+rax*8]
0x0084023d: cmp    DWORD PTR [rbx+0x1c],r10d
0x00840241: je     0x140840259
0x00840243: lea    eax,[rcx+0x1]
0x00840246: cmovle edx,eax
0x00840249: lea    eax,[rcx-0x1]
0x0084024c: cmovle eax,r9d
0x00840250: mov    r9d,eax
0x00840253: cmp    edx,eax
0x00840255: jle    0x140840230
0x00840257: xor    ebx,ebx
0x00840259: test   rbx,rbx
0x0084025c: je     0x14084030b
0x00840262: mov    r8d,0x6
0x00840268: lea    rdx,[rip+0xda8715]        # 0x1415e8984 ; literal=" from "
0x0084026f: mov    rcx,rdi
0x00840272: call   0x14006f9a0
0x00840277: xorps  xmm0,xmm0
0x0084027a: movups XMMWORD PTR [rsp+0x20],xmm0
0x0084027f: mov    QWORD PTR [rsp+0x30],0x0
0x00840288: mov    QWORD PTR [rsp+0x38],0xf
0x00840291: mov    BYTE PTR [rsp+0x20],0x0
0x00840296: mov    r9d,0xffffffff
0x0084029c: xor    r8d,r8d
0x0084029f: lea    rdx,[rsp+0x20]
0x008402a4: mov    rcx,rbx
0x008402a7: call   0x140c62490
0x008402ac: lea    rdx,[rsp+0x20]
0x008402b1: cmp    QWORD PTR [rsp+0x38],0xf
0x008402b7: cmova  rdx,QWORD PTR [rsp+0x20]
0x008402bd: mov    r8,QWORD PTR [rsp+0x30]
0x008402c2: mov    rcx,rdi
0x008402c5: call   0x14006f9a0
0x008402ca: nop
0x008402cb: mov    rdx,QWORD PTR [rsp+0x38]
0x008402d0: cmp    rdx,0xf
0x008402d4: jbe    0x14084030b
0x008402d6: inc    rdx
0x008402d9: mov    rcx,QWORD PTR [rsp+0x20]
0x008402de: mov    rax,rcx
0x008402e1: cmp    rdx,0x1000
0x008402e8: jb     0x140840306
0x008402ea: add    rdx,0x27
0x008402ee: mov    rcx,QWORD PTR [rcx-0x8]
0x008402f2: sub    rax,rcx
0x008402f5: add    rax,0xfffffffffffffff8
0x008402f9: cmp    rax,0x1f
0x008402fd: jbe    0x140840306
0x008402ff: call   QWORD PTR [rip+0xda079b]        # 0x1415e0aa0
0x00840305: int3
0x00840306: call   0x1415345f0
0x0084030b: mov    rcx,QWORD PTR [rsp+0x40]
0x00840310: xor    rcx,rsp
0x00840313: call   0x1415345d0
0x00840318: mov    rbx,QWORD PTR [rsp+0x60]
0x0084031d: add    rsp,0x50
0x00840321: pop    rdi
0x00840322: ret

# classic PE:6a70b91c:0270a000; adventure_movement_pathst+8; RVA 0x840330..0x84044c
0x00840330: mov    QWORD PTR [rsp+0x8],rbx
0x00840335: push   rdi
0x00840336: sub    rsp,0x20
0x0084033a: movzx  eax,BYTE PTR [rcx+0x23]
0x0084033e: mov    rbx,rcx
0x00840341: mov    rdi,rdx
0x00840344: test   al,al
0x00840346: mov    ecx,0xc
0x0084034b: lea    rdx,[rip+0xe6c04e]        # 0x1416ac3a0 ; literal="Go below hatch"
0x00840352: mov    r8d,0xe
0x00840358: cmove  r8d,ecx
0x0084035c: lea    rcx,[rip+0xe6c02d]        # 0x1416ac390 ; literal="Path to here"
0x00840363: cmove  rdx,rcx
0x00840367: mov    rcx,rdi
0x0084036a: call   0x14006f860
0x0084036f: cmp    BYTE PTR [rbx+0x22],0x0
0x00840373: jne    0x14084038a
0x00840375: mov    r8d,0x16
0x0084037b: lea    rdx,[rip+0xe6c036]        # 0x1416ac3b8 ; literal=" (no climbing/jumping)"
0x00840382: mov    rcx,rdi
0x00840385: call   0x14006f9a0
0x0084038a: movzx  eax,WORD PTR [rbx+0x14]
0x0084038e: cmp    WORD PTR [rbx+0x20],ax
0x00840392: je     0x140840441
0x00840398: mov    r8d,0x2
0x0084039e: lea    rdx,[rip+0xdcfef3]        # 0x141610298 ; literal=" ("
0x008403a5: mov    rcx,rdi
0x008403a8: call   0x14006f9a0
0x008403ad: movsx  edx,WORD PTR [rbx+0x20]
0x008403b1: movsx  eax,WORD PTR [rbx+0x14]
0x008403b5: sub    edx,eax
0x008403b7: mov    ecx,edx
0x008403b9: neg    ecx
0x008403bb: cmovs  ecx,edx
0x008403be: mov    rdx,rdi
0x008403c1: call   0x140529cf0
0x008403c6: mov    r8d,0x6
0x008403cc: lea    rdx,[rip+0xe6bfdd]        # 0x1416ac3b0 ; literal=" level"
0x008403d3: mov    rcx,rdi
0x008403d6: call   0x14006f9a0
0x008403db: movsx  eax,WORD PTR [rbx+0x14]
0x008403df: movsx  ecx,WORD PTR [rbx+0x20]
0x008403e3: sub    ecx,eax
0x008403e5: mov    eax,ecx
0x008403e7: neg    eax
0x008403e9: cmovs  eax,ecx
0x008403ec: cmp    eax,0x1
0x008403ef: jle    0x140840406
0x008403f1: mov    r8d,0x1
0x008403f7: lea    rdx,[rip+0xda3e22]        # 0x1415e4220 ; literal="s"
0x008403fe: mov    rcx,rdi
0x00840401: call   0x14006f9a0
0x00840406: movzx  eax,WORD PTR [rbx+0x20]
0x0084040a: mov    rcx,rdi
0x0084040d: cmp    WORD PTR [rbx+0x14],ax
0x00840411: jle    0x14084042f
0x00840413: mov    r8d,0x4
0x00840419: lea    rdx,[rip+0xe6bf38]        # 0x1416ac358 ; literal=" up)"
0x00840420: mov    rbx,QWORD PTR [rsp+0x30]
0x00840425: add    rsp,0x20
0x00840429: pop    rdi
0x0084042a: jmp    0x14006f9a0
0x0084042f: mov    r8d,0x6
0x00840435: lea    rdx,[rip+0xe6bf14]        # 0x1416ac350 ; literal=" down)"
0x0084043c: call   0x14006f9a0
0x00840441: mov    rbx,QWORD PTR [rsp+0x30]
0x00840446: add    rsp,0x20
0x0084044a: pop    rdi
0x0084044b: ret

# classic PE:6a70b91c:0270a000; chooser-renderer; RVA 0x881ce0..0x882fe8
0x00881ce0: rex push rbp
0x00881ce2: push   rbx
0x00881ce3: push   rsi
0x00881ce4: push   rdi
0x00881ce5: push   r12
0x00881ce7: push   r13
0x00881ce9: push   r14
0x00881ceb: push   r15
0x00881ced: lea    rbp,[rsp-0x8]
0x00881cf2: sub    rsp,0x108
0x00881cf9: movaps XMMWORD PTR [rsp+0xf0],xmm6
0x00881d01: mov    rax,QWORD PTR [rip+0x1014338]        # 0x141896040
0x00881d08: xor    rax,rsp
0x00881d0b: mov    QWORD PTR [rbp-0x18],rax
0x00881d0f: mov    DWORD PTR [rsp+0x6c],edx
0x00881d13: mov    r10,rcx
0x00881d16: mov    QWORD PTR [rsp+0x50],rcx
0x00881d1b: mov    DWORD PTR [rsp+0x48],0xffffffff
0x00881d23: mov    DWORD PTR [rsp+0x5c],0xffffffff
0x00881d2b: cmp    BYTE PTR [rip+0x1b08793],0x0        # 0x14238a4c5
0x00881d32: je     0x140881d48
0x00881d34: mov    eax,DWORD PTR [rip+0x1dc2766]        # 0x1426444a0
0x00881d3a: mov    DWORD PTR [rsp+0x48],eax
0x00881d3e: mov    eax,DWORD PTR [rip+0x1dc2760]        # 0x1426444a4
0x00881d44: mov    DWORD PTR [rsp+0x5c],eax
0x00881d48: lea    eax,[r9+r8*1]
0x00881d4c: cdq
0x00881d4d: sub    eax,edx
0x00881d4f: sar    eax,1
0x00881d51: lea    r14d,[rax-0x23]
0x00881d55: mov    DWORD PTR [rsp+0x44],r14d
0x00881d5a: lea    edi,[rax+0x23]
0x00881d5d: mov    r12d,0x14
0x00881d63: mov    edx,DWORD PTR [rip+0x1b4590f]        # 0x1423c7678
0x00881d69: lea    r13d,[rdx-0x5]
0x00881d6d: mov    r15d,r13d
0x00881d70: mov    DWORD PTR [rsp+0x40],r13d
0x00881d75: mov    ecx,0x27
0x00881d7a: mov    rax,QWORD PTR [r10+0x20]
0x00881d7e: sub    rax,QWORD PTR [r10+0x18]
0x00881d82: sar    rax,0x3
0x00881d86: add    eax,0x2
0x00881d89: lea    eax,[rax+rax*2]
0x00881d8c: cmp    eax,ecx
0x00881d8e: cmovl  ecx,eax
0x00881d91: lea    eax,[r13-0x13]
0x00881d95: cmp    eax,ecx
0x00881d97: jle    0x140881da2
0x00881d99: mov    r12d,r13d
0x00881d9c: sub    r12d,ecx
0x00881d9f: inc    r12d
0x00881da2: mov    eax,DWORD PTR [r10+0x4]
0x00881da6: cmp    eax,0x3
0x00881da9: je     0x140881db0
0x00881dab: cmp    eax,0x6
0x00881dae: jne    0x140881e1a
0x00881db0: mov    eax,DWORD PTR [r10+0x10]
0x00881db4: lea    r14d,[rax+0x4]
0x00881db8: mov    DWORD PTR [rsp+0x44],r14d
0x00881dbd: lea    edi,[r14+0x46]
0x00881dc1: mov    r12d,DWORD PTR [r10+0x14]
0x00881dc5: sub    r12d,0x2
0x00881dc9: lea    r15d,[rcx+r12*1]
0x00881dcd: mov    DWORD PTR [rsp+0x40],r15d
0x00881dd2: cmp    edi,DWORD PTR [rip+0x1b4589c]        # 0x1423c7674
0x00881dd8: jl     0x140881de6
0x00881dda: lea    edi,[rax-0x4]
0x00881ddd: lea    r14d,[rdi-0x46]
0x00881de1: mov    DWORD PTR [rsp+0x44],r14d
0x00881de6: cmp    r15d,r13d
0x00881de9: jle    0x140881dfe
0x00881deb: mov    eax,r15d
0x00881dee: sub    eax,edx
0x00881df0: add    eax,0x5
0x00881df3: sub    r12d,eax
0x00881df6: sub    r15d,eax
0x00881df9: mov    DWORD PTR [rsp+0x40],r15d
0x00881dfe: cmp    r12d,0x4
0x00881e02: jge    0x140881e1a
0x00881e04: mov    eax,0x4
0x00881e09: sub    eax,r12d
0x00881e0c: mov    r12d,0x4
0x00881e12: add    r15d,eax
0x00881e15: mov    DWORD PTR [rsp+0x40],r15d
0x00881e1a: cmp    BYTE PTR [r10+0x38],0x0
0x00881e1f: je     0x1408826f8
0x00881e25: lea    r15d,[rdx-0x13]
0x00881e29: mov    esi,r15d
0x00881e2c: cmp    r15d,r13d
0x00881e2f: jg     0x140881f0a
0x00881e35: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00881e40: mov    ebx,r14d
0x00881e43: cmp    r14d,edi
0x00881e46: jg     0x140881efa
0x00881e4c: nop    DWORD PTR [rax+0x0]
0x00881e50: mov    DWORD PTR [rip+0x1dc250e],ebx        # 0x142644364
0x00881e56: mov    DWORD PTR [rip+0x1dc250c],esi        # 0x142644368
0x00881e5c: xor    r8d,r8d
0x00881e5f: xor    edx,edx
0x00881e61: lea    rcx,[rip+0x1dc2478]        # 0x1426442e0
0x00881e68: call   0x1400bb120
0x00881e6d: cmp    esi,r15d
0x00881e70: jne    0x140881e9a
0x00881e72: cmp    ebx,r14d
0x00881e75: jne    0x140881e7f
0x00881e77: mov    edx,DWORD PTR [rip+0x1dc3d87]        # 0x142645c04
0x00881e7d: jmp    0x140881ee4
0x00881e7f: lea    rcx,[rip+0x1dc245a]        # 0x1426442e0
0x00881e86: cmp    ebx,edi
0x00881e88: jne    0x140881e92
0x00881e8a: mov    edx,DWORD PTR [rip+0x1dc3d8c]        # 0x142645c1c
0x00881e90: jmp    0x140881eeb
0x00881e92: mov    edx,DWORD PTR [rip+0x1dc3d78]        # 0x142645c10
0x00881e98: jmp    0x140881eeb
0x00881e9a: cmp    esi,r13d
0x00881e9d: jne    0x140881ec7
0x00881e9f: cmp    ebx,r14d
0x00881ea2: jne    0x140881eac
0x00881ea4: mov    edx,DWORD PTR [rip+0x1dc3d62]        # 0x142645c0c
0x00881eaa: jmp    0x140881ee4
0x00881eac: lea    rcx,[rip+0x1dc242d]        # 0x1426442e0
0x00881eb3: cmp    ebx,edi
0x00881eb5: jne    0x140881ebf
0x00881eb7: mov    edx,DWORD PTR [rip+0x1dc3d67]        # 0x142645c24
0x00881ebd: jmp    0x140881eeb
0x00881ebf: mov    edx,DWORD PTR [rip+0x1dc3d53]        # 0x142645c18
0x00881ec5: jmp    0x140881eeb
0x00881ec7: cmp    ebx,r14d
0x00881eca: jne    0x140881ed4
0x00881ecc: mov    edx,DWORD PTR [rip+0x1dc3d36]        # 0x142645c08
0x00881ed2: jmp    0x140881ee4
0x00881ed4: cmp    ebx,edi
0x00881ed6: mov    edx,DWORD PTR [rip+0x1dc3d44]        # 0x142645c20
0x00881edc: je     0x140881ee4
0x00881ede: mov    edx,DWORD PTR [rip+0x1dc3d30]        # 0x142645c14
0x00881ee4: lea    rcx,[rip+0x1dc23f5]        # 0x1426442e0
0x00881eeb: call   0x140ad7b10
0x00881ef0: inc    ebx
0x00881ef2: cmp    ebx,edi
0x00881ef4: jle    0x140881e50
0x00881efa: inc    esi
0x00881efc: cmp    esi,r13d
0x00881eff: jle    0x140881e40
0x00881f05: mov    r10,QWORD PTR [rsp+0x50]
0x00881f0a: lea    esi,[r15+0x2]
0x00881f0e: lea    ebx,[r15+0x6]
0x00881f12: lea    r15d,[rbx-0x1]
0x00881f16: mov    DWORD PTR [rsp+0x40],r15d
0x00881f1b: lea    eax,[rdi-0x4]
0x00881f1e: mov    DWORD PTR [rsp+0x5c],eax
0x00881f22: lea    eax,[r13-0x4]
0x00881f26: mov    DWORD PTR [rsp+0x44],eax
0x00881f2a: lea    r13d,[r14+0x2]
0x00881f2e: mov    DWORD PTR [rsp+0x48],r13d
0x00881f33: lea    eax,[rdi-0xd]
0x00881f36: mov    DWORD PTR [rsp+0x58],eax
0x00881f3a: mov    DWORD PTR [rip+0x1dc2428],0x1010007        # 0x14264436c
0x00881f44: xorps  xmm0,xmm0
0x00881f47: movups XMMWORD PTR [rbp-0x60],xmm0
0x00881f4b: movdqa xmm6,XMMWORD PTR [rip+0xf03acd]        # 0x141785a20
0x00881f53: movdqu XMMWORD PTR [rbp-0x50],xmm6
0x00881f58: mov    BYTE PTR [rbp-0x60],0x0
0x00881f5c: movsxd rcx,DWORD PTR [r10+0x3c]
0x00881f60: mov    rax,QWORD PTR [r10+0x18]
0x00881f64: mov    rcx,QWORD PTR [rax+rcx*8]
0x00881f68: mov    rax,QWORD PTR [rcx]
0x00881f6b: call   QWORD PTR [rax+0x90]
0x00881f71: test   rax,rax
0x00881f74: je     0x14088204e
0x00881f7a: mov    r9d,0xffffffff
0x00881f80: xor    r8d,r8d
0x00881f83: lea    rdx,[rbp-0x60]
0x00881f87: mov    rcx,rax
0x00881f8a: call   0x140c62490
0x00881f8f: mov    DWORD PTR [rip+0x1dc23ce],r13d        # 0x142644364
0x00881f96: mov    DWORD PTR [rip+0x1dc23cc],esi        # 0x142644368
0x00881f9c: xor    r9d,r9d
0x00881f9f: lea    rdx,[rbp-0x60]
0x00881fa3: lea    rcx,[rip+0x1dc2336]        # 0x1426442e0
0x00881faa: call   0x140ad69a0
0x00881faf: mov    DWORD PTR [rip+0x1dc23ae],r13d        # 0x142644364
0x00881fb6: lea    eax,[rsi+0x1]
0x00881fb9: mov    DWORD PTR [rip+0x1dc23a9],eax        # 0x142644368
0x00881fbf: xorps  xmm0,xmm0
0x00881fc2: movups XMMWORD PTR [rbp-0x80],xmm0
0x00881fc6: xorps  xmm1,xmm1
0x00881fc9: movdqu XMMWORD PTR [rbp-0x70],xmm1
0x00881fce: mov    ecx,0x20
0x00881fd3: call   0x140070760
0x00881fd8: mov    QWORD PTR [rbp-0x80],rax
0x00881fdc: movdqa xmm0,XMMWORD PTR [rip+0xf03b8c]        # 0x141785b70
0x00881fe4: movdqu XMMWORD PTR [rbp-0x70],xmm0
0x00881fe9: movups xmm0,XMMWORD PTR [rip+0xe2d6f0]        # 0x1416af6e0 ; literal="Pick up how many? (0-"
0x00881ff0: movups XMMWORD PTR [rax],xmm0
0x00881ff3: mov    ecx,DWORD PTR [rip+0xe2d6f7]        # 0x1416af6f0 ; literal="? (0-"
0x00881ff9: mov    DWORD PTR [rax+0x10],ecx
0x00881ffc: movzx  ecx,BYTE PTR [rip+0xe2d6f1]        # 0x1416af6f4 ; literal="-"
0x00882003: mov    BYTE PTR [rax+0x14],cl
0x00882006: mov    BYTE PTR [rax+0x15],0x0
0x0088200a: lea    rdx,[rbp-0x80]
0x0088200e: mov    rax,QWORD PTR [rsp+0x50]
0x00882013: mov    ecx,DWORD PTR [rax+0x40]
0x00882016: call   0x140529cf0
0x0088201b: mov    r8d,0x1
0x00882021: lea    rdx,[rip+0xd8e2b0]        # 0x1416102d8 ; literal=")"
0x00882028: lea    rcx,[rbp-0x80]
0x0088202c: call   0x14006f9a0
0x00882031: xor    r9d,r9d
0x00882034: lea    rdx,[rbp-0x80]
0x00882038: lea    rcx,[rip+0x1dc22a1]        # 0x1426442e0
0x0088203f: call   0x140ad69a0
0x00882044: nop
0x00882045: lea    rcx,[rbp-0x80]
0x00882049: call   0x14006f7e0
0x0088204e: lea    eax,[rdi+r14*1]
0x00882052: cdq
0x00882053: sub    eax,edx
0x00882055: sar    eax,1
0x00882057: dec    eax
0x00882059: mov    DWORD PTR [rip+0x1dc2305],eax        # 0x142644364
0x0088205f: mov    DWORD PTR [rip+0x1dc2303],ebx        # 0x142644368
0x00882065: xorps  xmm0,xmm0
0x00882068: movups XMMWORD PTR [rbp-0x38],xmm0
0x0088206c: movdqu XMMWORD PTR [rbp-0x28],xmm6
0x00882071: mov    BYTE PTR [rbp-0x38],0x0
0x00882075: mov    rax,QWORD PTR [rsp+0x50]
0x0088207a: cmp    BYTE PTR [rax+0x48],0x0
0x0088207e: je     0x1408820e2
0x00882080: lea    rdx,[rax+0x50]
0x00882084: lea    rax,[rbp-0x38]
0x00882088: cmp    rax,rdx
0x0088208b: je     0x1408820a4
0x0088208d: mov    r8,QWORD PTR [rdx+0x10]
0x00882091: cmp    QWORD PTR [rdx+0x18],0xf
0x00882096: jbe    0x14088209b
0x00882098: mov    rdx,QWORD PTR [rdx]
0x0088209b: lea    rcx,[rbp-0x38]
0x0088209f: call   0x14006f860
0x008820a4: call   QWORD PTR [rip+0xd5e13e]        # 0x1415e01e8
0x008820aa: mov    r9d,eax
0x008820ad: mov    eax,0x10624dd3
0x008820b2: mul    r9d
0x008820b5: shr    edx,0x6
0x008820b8: imul   ecx,edx,0x3e8
0x008820be: sub    r9d,ecx
0x008820c1: cmp    r9d,0x1f4
0x008820c8: jae    0x1408820ee
0x008820ca: mov    r8d,0x1
0x008820d0: lea    rdx,[rip+0xd65765]        # 0x1415e783c ; literal="_"
0x008820d7: lea    rcx,[rbp-0x38]
0x008820db: call   0x14006f9a0
0x008820e0: jmp    0x1408820ee
0x008820e2: lea    rdx,[rbp-0x38]
0x008820e6: mov    ecx,DWORD PTR [rax+0x44]
0x008820e9: call   0x140529db0
0x008820ee: xor    r9d,r9d
0x008820f1: lea    rdx,[rbp-0x38]
0x008820f5: lea    rcx,[rip+0x1dc21e4]        # 0x1426442e0
0x008820fc: call   0x140ad69a0
0x00882101: lea    r14d,[rdi-0xb]
0x00882105: mov    esi,r15d
0x00882108: lea    rbx,[rip+0x1dc7a51]        # 0x142649b60
0x0088210f: lea    r15d,[rdi-0xa]
0x00882113: nop    DWORD PTR [rax+0x0]
0x00882117: nop    WORD PTR [rax+rax*1+0x0]
0x00882120: lea    eax,[rdi-0xc]
0x00882123: mov    DWORD PTR [rip+0x1dc223b],eax        # 0x142644364
0x00882129: mov    DWORD PTR [rip+0x1dc2239],esi        # 0x142644368
0x0088212f: mov    edx,DWORD PTR [rbx-0x18]
0x00882132: lea    rcx,[rip+0x1dc21a7]        # 0x1426442e0
0x00882139: call   0x140ad7b10
0x0088213e: cmp    DWORD PTR [rip+0x1b45523],0x0        # 0x1423c7668
0x00882145: jle    0x140882164
0x00882147: mov    rax,QWORD PTR [rip+0x1b45512]        # 0x1423c7660
0x0088214e: test   BYTE PTR [rax],0x1
0x00882151: je     0x140882164
0x00882153: mov    r8b,0x1
0x00882156: xor    edx,edx
0x00882158: lea    rcx,[rip+0x1dc2181]        # 0x1426442e0
0x0088215f: call   0x1400bb120
0x00882164: mov    DWORD PTR [rip+0x1dc21f9],r14d        # 0x142644364
0x0088216b: mov    DWORD PTR [rip+0x1dc21f7],esi        # 0x142644368
0x00882171: mov    edx,DWORD PTR [rbx-0xc]
0x00882174: lea    rcx,[rip+0x1dc2165]        # 0x1426442e0
0x0088217b: call   0x140ad7b10
0x00882180: cmp    DWORD PTR [rip+0x1b454e1],0x0        # 0x1423c7668
0x00882187: jle    0x1408821a6
0x00882189: mov    rax,QWORD PTR [rip+0x1b454d0]        # 0x1423c7660
0x00882190: test   BYTE PTR [rax],0x1
0x00882193: je     0x1408821a6
0x00882195: mov    r8b,0x1
0x00882198: xor    edx,edx
0x0088219a: lea    rcx,[rip+0x1dc213f]        # 0x1426442e0
0x008821a1: call   0x1400bb120
0x008821a6: mov    DWORD PTR [rip+0x1dc21b7],r15d        # 0x142644364
0x008821ad: mov    DWORD PTR [rip+0x1dc21b5],esi        # 0x142644368
0x008821b3: mov    edx,DWORD PTR [rbx]
0x008821b5: lea    rcx,[rip+0x1dc2124]        # 0x1426442e0
0x008821bc: call   0x140ad7b10
0x008821c1: cmp    DWORD PTR [rip+0x1b454a0],0x0        # 0x1423c7668
0x008821c8: jle    0x1408821e7
0x008821ca: mov    rax,QWORD PTR [rip+0x1b4548f]        # 0x1423c7660
0x008821d1: test   BYTE PTR [rax],0x1
0x008821d4: je     0x1408821e7
0x008821d6: mov    r8b,0x1
0x008821d9: xor    edx,edx
0x008821db: lea    rcx,[rip+0x1dc20fe]        # 0x1426442e0
0x008821e2: call   0x1400bb120
0x008821e7: lea    eax,[rdi-0x9]
0x008821ea: mov    DWORD PTR [rip+0x1dc2174],eax        # 0x142644364
0x008821f0: mov    DWORD PTR [rip+0x1dc2172],esi        # 0x142644368
0x008821f6: mov    edx,DWORD PTR [rbx+0xc]
0x008821f9: lea    rcx,[rip+0x1dc20e0]        # 0x1426442e0
0x00882200: call   0x140ad7b10
0x00882205: cmp    DWORD PTR [rip+0x1b4545c],0x0        # 0x1423c7668
0x0088220c: jle    0x14088222b
0x0088220e: mov    rax,QWORD PTR [rip+0x1b4544b]        # 0x1423c7660
0x00882215: test   BYTE PTR [rax],0x1
0x00882218: je     0x14088222b
0x0088221a: mov    r8b,0x1
0x0088221d: xor    edx,edx
0x0088221f: lea    rcx,[rip+0x1dc20ba]        # 0x1426442e0
0x00882226: call   0x1400bb120
0x0088222b: inc    esi
0x0088222d: add    rbx,0x4
0x00882231: lea    rax,[rip+0x1dc7934]        # 0x142649b6c
0x00882238: cmp    rbx,rax
0x0088223b: jl     0x140882120
0x00882241: lea    r14d,[rdi-0x7]
0x00882245: mov    esi,DWORD PTR [rsp+0x40]
0x00882249: lea    rbx,[rip+0x1dc7940]        # 0x142649b90
0x00882250: lea    r12d,[rdi-0x6]
0x00882254: lea    r13d,[rdi-0x5]
0x00882258: lea    r15d,[rdi-0x8]
0x0088225c: nop    DWORD PTR [rax+0x0]
0x00882260: mov    DWORD PTR [rip+0x1dc20fd],r15d        # 0x142644364
0x00882267: mov    DWORD PTR [rip+0x1dc20fb],esi        # 0x142644368
0x0088226d: mov    edx,DWORD PTR [rbx-0x18]
0x00882270: lea    rcx,[rip+0x1dc2069]        # 0x1426442e0
0x00882277: call   0x140ad7b10
0x0088227c: cmp    DWORD PTR [rip+0x1b453e5],0x0        # 0x1423c7668
0x00882283: jle    0x1408822a2
0x00882285: mov    rax,QWORD PTR [rip+0x1b453d4]        # 0x1423c7660
0x0088228c: test   BYTE PTR [rax],0x1
0x0088228f: je     0x1408822a2
0x00882291: mov    r8b,0x1
0x00882294: xor    edx,edx
0x00882296: lea    rcx,[rip+0x1dc2043]        # 0x1426442e0
0x0088229d: call   0x1400bb120
0x008822a2: mov    DWORD PTR [rip+0x1dc20bb],r14d        # 0x142644364
0x008822a9: mov    DWORD PTR [rip+0x1dc20b9],esi        # 0x142644368
0x008822af: mov    edx,DWORD PTR [rbx-0xc]
0x008822b2: lea    rcx,[rip+0x1dc2027]        # 0x1426442e0
0x008822b9: call   0x140ad7b10
0x008822be: cmp    DWORD PTR [rip+0x1b453a3],0x0        # 0x1423c7668
0x008822c5: jle    0x1408822e4
0x008822c7: mov    rax,QWORD PTR [rip+0x1b45392]        # 0x1423c7660
0x008822ce: test   BYTE PTR [rax],0x1
0x008822d1: je     0x1408822e4
0x008822d3: mov    r8b,0x1
0x008822d6: xor    edx,edx
0x008822d8: lea    rcx,[rip+0x1dc2001]        # 0x1426442e0
0x008822df: call   0x1400bb120
0x008822e4: mov    DWORD PTR [rip+0x1dc2079],r12d        # 0x142644364
0x008822eb: mov    DWORD PTR [rip+0x1dc2077],esi        # 0x142644368
0x008822f1: mov    edx,DWORD PTR [rbx]
0x008822f3: lea    rcx,[rip+0x1dc1fe6]        # 0x1426442e0
0x008822fa: call   0x140ad7b10
0x008822ff: cmp    DWORD PTR [rip+0x1b45362],0x0        # 0x1423c7668
0x00882306: jle    0x140882325
0x00882308: mov    rax,QWORD PTR [rip+0x1b45351]        # 0x1423c7660
0x0088230f: test   BYTE PTR [rax],0x1
0x00882312: je     0x140882325
0x00882314: mov    r8b,0x1
0x00882317: xor    edx,edx
0x00882319: lea    rcx,[rip+0x1dc1fc0]        # 0x1426442e0
0x00882320: call   0x1400bb120
0x00882325: mov    DWORD PTR [rip+0x1dc2038],r13d        # 0x142644364
0x0088232c: mov    DWORD PTR [rip+0x1dc2036],esi        # 0x142644368
0x00882332: mov    edx,DWORD PTR [rbx+0xc]
0x00882335: lea    rcx,[rip+0x1dc1fa4]        # 0x1426442e0
0x0088233c: call   0x140ad7b10
0x00882341: cmp    DWORD PTR [rip+0x1b45320],0x0        # 0x1423c7668
0x00882348: jle    0x140882367
0x0088234a: mov    rax,QWORD PTR [rip+0x1b4530f]        # 0x1423c7660
0x00882351: test   BYTE PTR [rax],0x1
0x00882354: je     0x140882367
0x00882356: mov    r8b,0x1
0x00882359: xor    edx,edx
0x0088235b: lea    rcx,[rip+0x1dc1f7e]        # 0x1426442e0
0x00882362: call   0x1400bb120
0x00882367: inc    esi
0x00882369: add    rbx,0x4
0x0088236d: lea    rax,[rip+0x1dc7828]        # 0x142649b9c
0x00882374: cmp    rbx,rax
0x00882377: jl     0x140882260
0x0088237d: lea    esi,[rdi-0x3]
0x00882380: lea    r14d,[rdi-0x2]
0x00882384: dec    edi
0x00882386: lea    rbx,[rip+0x1dc7833]        # 0x142649bc0
0x0088238d: mov    r15d,DWORD PTR [rsp+0x40]
0x00882392: mov    r13d,DWORD PTR [rsp+0x48]
0x00882397: lea    r12d,[r13+0x9]
0x0088239b: nop    DWORD PTR [rax+rax*1+0x0]
0x008823a0: mov    eax,DWORD PTR [rsp+0x5c]
0x008823a4: mov    DWORD PTR [rip+0x1dc1fba],eax        # 0x142644364
0x008823aa: mov    DWORD PTR [rip+0x1dc1fb7],r15d        # 0x142644368
0x008823b1: mov    edx,DWORD PTR [rbx-0x18]
0x008823b4: lea    rcx,[rip+0x1dc1f25]        # 0x1426442e0
0x008823bb: call   0x140ad7b10
0x008823c0: cmp    DWORD PTR [rip+0x1b452a1],0x0        # 0x1423c7668
0x008823c7: jle    0x1408823e6
0x008823c9: mov    rax,QWORD PTR [rip+0x1b45290]        # 0x1423c7660
0x008823d0: test   BYTE PTR [rax],0x1
0x008823d3: je     0x1408823e6
0x008823d5: mov    r8b,0x1
0x008823d8: xor    edx,edx
0x008823da: lea    rcx,[rip+0x1dc1eff]        # 0x1426442e0
0x008823e1: call   0x1400bb120
0x008823e6: mov    DWORD PTR [rip+0x1dc1f78],esi        # 0x142644364
0x008823ec: mov    DWORD PTR [rip+0x1dc1f75],r15d        # 0x142644368
0x008823f3: mov    edx,DWORD PTR [rbx-0xc]
0x008823f6: lea    rcx,[rip+0x1dc1ee3]        # 0x1426442e0
0x008823fd: call   0x140ad7b10
0x00882402: cmp    DWORD PTR [rip+0x1b4525f],0x0        # 0x1423c7668
0x00882409: jle    0x140882428
0x0088240b: mov    rax,QWORD PTR [rip+0x1b4524e]        # 0x1423c7660
0x00882412: test   BYTE PTR [rax],0x1
0x00882415: je     0x140882428
0x00882417: mov    r8b,0x1
0x0088241a: xor    edx,edx
0x0088241c: lea    rcx,[rip+0x1dc1ebd]        # 0x1426442e0
0x00882423: call   0x1400bb120
0x00882428: mov    DWORD PTR [rip+0x1dc1f35],r14d        # 0x142644364
0x0088242f: mov    DWORD PTR [rip+0x1dc1f32],r15d        # 0x142644368
0x00882436: mov    edx,DWORD PTR [rbx]
0x00882438: lea    rcx,[rip+0x1dc1ea1]        # 0x1426442e0
0x0088243f: call   0x140ad7b10
0x00882444: cmp    DWORD PTR [rip+0x1b4521d],0x0        # 0x1423c7668
0x0088244b: jle    0x14088246a
0x0088244d: mov    rax,QWORD PTR [rip+0x1b4520c]        # 0x1423c7660
0x00882454: test   BYTE PTR [rax],0x1
0x00882457: je     0x14088246a
0x00882459: mov    r8b,0x1
0x0088245c: xor    edx,edx
0x0088245e: lea    rcx,[rip+0x1dc1e7b]        # 0x1426442e0
0x00882465: call   0x1400bb120
0x0088246a: mov    DWORD PTR [rip+0x1dc1ef4],edi        # 0x142644364
0x00882470: mov    DWORD PTR [rip+0x1dc1ef1],r15d        # 0x142644368
0x00882477: mov    edx,DWORD PTR [rbx+0xc]
0x0088247a: lea    rcx,[rip+0x1dc1e5f]        # 0x1426442e0
0x00882481: call   0x140ad7b10
0x00882486: cmp    DWORD PTR [rip+0x1b451db],0x0        # 0x1423c7668
0x0088248d: jle    0x1408824ac
0x0088248f: mov    rax,QWORD PTR [rip+0x1b451ca]        # 0x1423c7660
0x00882496: test   BYTE PTR [rax],0x1
0x00882499: je     0x1408824ac
0x0088249b: mov    r8b,0x1
0x0088249e: xor    edx,edx
0x008824a0: lea    rcx,[rip+0x1dc1e39]        # 0x1426442e0
0x008824a7: call   0x1400bb120
0x008824ac: inc    r15d
0x008824af: add    rbx,0x4
0x008824b3: lea    rax,[rip+0x1dc7712]        # 0x142649bcc
0x008824ba: cmp    rbx,rax
0x008824bd: jl     0x1408823a0
0x008824c3: mov    ebx,r13d
0x008824c6: mov    esi,DWORD PTR [rsp+0x44]
0x008824ca: cmp    r13d,r12d
0x008824cd: jg     0x140882533
0x008824cf: lea    r15,[rip+0x1dcc626]        # 0x14264eafc
0x008824d6: lea    r14,[rip+0x1dcc62b]        # 0x14264eb08
0x008824dd: nop    DWORD PTR [rax]
0x008824e0: mov    edi,esi
0x008824e2: mov    r11,r15
0x008824e5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x008824f0: mov    DWORD PTR [rip+0x1dc1e6e],ebx        # 0x142644364
0x008824f6: mov    DWORD PTR [rip+0x1dc1e6c],edi        # 0x142644368
0x008824fc: cmp    ebx,r13d
0x008824ff: jne    0x140882507
0x00882501: mov    edx,DWORD PTR [r11-0x18]
0x00882505: jmp    0x140882515
0x00882507: cmp    ebx,r12d
0x0088250a: jne    0x140882511
0x0088250c: mov    edx,DWORD PTR [r11]
0x0088250f: jmp    0x140882515
0x00882511: mov    edx,DWORD PTR [r11-0xc]
0x00882515: lea    rcx,[rip+0x1dc1dc4]        # 0x1426442e0
0x0088251c: call   0x140ad7b10
0x00882521: inc    edi
0x00882523: add    r11,0x4
0x00882527: cmp    r11,r14
0x0088252a: jl     0x1408824f0
0x0088252c: inc    ebx
0x0088252e: cmp    ebx,r12d
0x00882531: jle    0x1408824e0
0x00882533: mov    DWORD PTR [rip+0x1dc1e2f],0x1010007        # 0x14264436c
0x0088253d: lea    eax,[r13+0x3]
0x00882541: mov    DWORD PTR [rip+0x1dc1e1d],eax        # 0x142644364
0x00882547: lea    r13d,[rsi+0x1]
0x0088254b: mov    DWORD PTR [rsp+0x48],r13d
0x00882550: mov    DWORD PTR [rip+0x1dc1e11],r13d        # 0x142644368
0x00882557: xorps  xmm0,xmm0
0x0088255a: movups XMMWORD PTR [rbp-0x80],xmm0
0x0088255e: movdqa xmm1,XMMWORD PTR [rip+0xf034fa]        # 0x141785a60
0x00882566: movdqu XMMWORD PTR [rbp-0x70],xmm1
0x0088256b: mov    DWORD PTR [rbp-0x80],0x79616b4f ; inline="Okay"
0x00882572: mov    BYTE PTR [rbp-0x7c],0x0
0x00882576: xor    r9d,r9d
0x00882579: lea    rdx,[rbp-0x80]
0x0088257d: lea    rcx,[rip+0x1dc1d5c]        # 0x1426442e0
0x00882584: call   0x140ad69a0
0x00882589: nop
0x0088258a: mov    rdx,QWORD PTR [rbp-0x68]
0x0088258e: cmp    rdx,0xf
0x00882592: jbe    0x1408825c5
0x00882594: inc    rdx
0x00882597: mov    rcx,QWORD PTR [rbp-0x80]
0x0088259b: mov    rax,rcx
0x0088259e: cmp    rdx,0x1000
0x008825a5: jb     0x1408825c0
0x008825a7: add    rdx,0x27
0x008825ab: mov    rcx,QWORD PTR [rcx-0x8]
0x008825af: sub    rax,rcx
0x008825b2: add    rax,0xfffffffffffffff8
0x008825b6: cmp    rax,0x1f
0x008825ba: ja     0x1408826d3
0x008825c0: call   0x1415345f0
0x008825c5: mov    r14d,DWORD PTR [rsp+0x58]
0x008825ca: mov    ebx,r14d
0x008825cd: lea    esi,[r14+0xb]
0x008825d1: cmp    r14d,esi
0x008825d4: jg     0x140882646
0x008825d6: lea    r12,[rip+0x1dcc4fb]        # 0x14264ead8
0x008825dd: lea    r15,[rip+0x1dcc500]        # 0x14264eae4
0x008825e4: mov    r13d,DWORD PTR [rsp+0x44]
0x008825e9: nop    DWORD PTR [rax+0x0]
0x008825f0: mov    edi,r13d
0x008825f3: mov    r11,r12
0x008825f6: data16 nop WORD PTR [rax+rax*1+0x0]
0x00882600: mov    DWORD PTR [rip+0x1dc1d5e],ebx        # 0x142644364
0x00882606: mov    DWORD PTR [rip+0x1dc1d5c],edi        # 0x142644368
0x0088260c: cmp    ebx,r14d
0x0088260f: jne    0x140882617
0x00882611: mov    edx,DWORD PTR [r11-0x18]
0x00882615: jmp    0x140882624
0x00882617: cmp    ebx,esi
0x00882619: jne    0x140882620
0x0088261b: mov    edx,DWORD PTR [r11]
0x0088261e: jmp    0x140882624
0x00882620: mov    edx,DWORD PTR [r11-0xc]
0x00882624: lea    rcx,[rip+0x1dc1cb5]        # 0x1426442e0
0x0088262b: call   0x140ad7b10
0x00882630: inc    edi
0x00882632: add    r11,0x4
0x00882636: cmp    r11,r15
0x00882639: jl     0x140882600
0x0088263b: inc    ebx
0x0088263d: cmp    ebx,esi
0x0088263f: jle    0x1408825f0
0x00882641: mov    r13d,DWORD PTR [rsp+0x48]
0x00882646: mov    DWORD PTR [rip+0x1dc1d1c],0x1010007        # 0x14264436c
0x00882650: lea    eax,[r14+0x3]
0x00882654: mov    DWORD PTR [rip+0x1dc1d0a],eax        # 0x142644364
0x0088265a: mov    DWORD PTR [rip+0x1dc1d07],r13d        # 0x142644368
0x00882661: xorps  xmm0,xmm0
0x00882664: movups XMMWORD PTR [rbp-0x80],xmm0
0x00882668: movdqa xmm1,XMMWORD PTR [rip+0xf03410]        # 0x141785a80
0x00882670: movdqu XMMWORD PTR [rbp-0x70],xmm1
0x00882675: mov    eax,DWORD PTR [rip+0xd76f21]        # 0x1415f959c ; literal="Cancel"
0x0088267b: mov    DWORD PTR [rbp-0x80],eax
0x0088267e: movzx  eax,WORD PTR [rip+0xd76f1b]        # 0x1415f95a0 ; literal="el"
0x00882685: mov    WORD PTR [rbp-0x7c],ax
0x00882689: mov    BYTE PTR [rbp-0x7a],0x0
0x0088268d: xor    r9d,r9d
0x00882690: lea    rdx,[rbp-0x80]
0x00882694: lea    rcx,[rip+0x1dc1c45]        # 0x1426442e0
0x0088269b: call   0x140ad69a0
0x008826a0: nop
0x008826a1: mov    rdx,QWORD PTR [rbp-0x68]
0x008826a5: cmp    rdx,0xf
0x008826a9: jbe    0x1408826e0
0x008826ab: inc    rdx
0x008826ae: mov    rcx,QWORD PTR [rbp-0x80]
0x008826b2: mov    rax,rcx
0x008826b5: cmp    rdx,0x1000
0x008826bc: jb     0x1408826da
0x008826be: add    rdx,0x27
0x008826c2: mov    rcx,QWORD PTR [rcx-0x8]
0x008826c6: sub    rax,rcx
0x008826c9: add    rax,0xfffffffffffffff8
0x008826cd: cmp    rax,0x1f
0x008826d1: jbe    0x1408826da
0x008826d3: call   QWORD PTR [rip+0xd5e3c7]        # 0x1415e0aa0
0x008826d9: int3
0x008826da: call   0x1415345f0
0x008826df: nop
0x008826e0: lea    rcx,[rbp-0x38]
0x008826e4: call   0x14006f7e0
0x008826e9: nop
0x008826ea: lea    rcx,[rbp-0x60]
0x008826ee: call   0x14006f7e0
0x008826f3: jmp    0x140882f9d
0x008826f8: mov    esi,r12d
0x008826fb: cmp    r12d,r15d
0x008826fe: jg     0x1408827c5
0x00882704: mov    ebx,r14d
0x00882707: cmp    r14d,edi
0x0088270a: jg     0x1408827ba
0x00882710: mov    DWORD PTR [rip+0x1dc1c4e],ebx        # 0x142644364
0x00882716: mov    DWORD PTR [rip+0x1dc1c4c],esi        # 0x142644368
0x0088271c: xor    r8d,r8d
0x0088271f: xor    edx,edx
0x00882721: lea    rcx,[rip+0x1dc1bb8]        # 0x1426442e0
0x00882728: call   0x1400bb120
0x0088272d: cmp    esi,r12d
0x00882730: jne    0x14088275a
0x00882732: cmp    ebx,r14d
0x00882735: jne    0x14088273f
0x00882737: mov    edx,DWORD PTR [rip+0x1dc34c7]        # 0x142645c04
0x0088273d: jmp    0x1408827a4
0x0088273f: lea    rcx,[rip+0x1dc1b9a]        # 0x1426442e0
0x00882746: cmp    ebx,edi
0x00882748: jne    0x140882752
0x0088274a: mov    edx,DWORD PTR [rip+0x1dc34cc]        # 0x142645c1c
0x00882750: jmp    0x1408827ab
0x00882752: mov    edx,DWORD PTR [rip+0x1dc34b8]        # 0x142645c10
0x00882758: jmp    0x1408827ab
0x0088275a: cmp    esi,r15d
0x0088275d: jne    0x140882787
0x0088275f: cmp    ebx,r14d
0x00882762: jne    0x14088276c
0x00882764: mov    edx,DWORD PTR [rip+0x1dc34a2]        # 0x142645c0c
0x0088276a: jmp    0x1408827a4
0x0088276c: lea    rcx,[rip+0x1dc1b6d]        # 0x1426442e0
0x00882773: cmp    ebx,edi
0x00882775: jne    0x14088277f
0x00882777: mov    edx,DWORD PTR [rip+0x1dc34a7]        # 0x142645c24
0x0088277d: jmp    0x1408827ab
0x0088277f: mov    edx,DWORD PTR [rip+0x1dc3493]        # 0x142645c18
0x00882785: jmp    0x1408827ab
0x00882787: cmp    ebx,r14d
0x0088278a: jne    0x140882794
0x0088278c: mov    edx,DWORD PTR [rip+0x1dc3476]        # 0x142645c08
0x00882792: jmp    0x1408827a4
0x00882794: cmp    ebx,edi
0x00882796: mov    edx,DWORD PTR [rip+0x1dc3484]        # 0x142645c20
0x0088279c: je     0x1408827a4
0x0088279e: mov    edx,DWORD PTR [rip+0x1dc3470]        # 0x142645c14
0x008827a4: lea    rcx,[rip+0x1dc1b35]        # 0x1426442e0
0x008827ab: call   0x140ad7b10
0x008827b0: inc    ebx
0x008827b2: cmp    ebx,edi
0x008827b4: jle    0x140882710
0x008827ba: inc    esi
0x008827bc: cmp    esi,r15d
0x008827bf: jle    0x140882704
0x008827c5: xor    ebx,ebx
0x008827c7: lea    r15,[rip+0x1dcc316]        # 0x14264eae4
0x008827ce: xchg   ax,ax
0x008827d0: lea    r13d,[rbx-0xc]
0x008827d4: add    r13d,edi
0x008827d7: lea    r11,[rip+0x1dcc2fa]        # 0x14264ead8
0x008827de: lea    esi,[r12+0x1]
0x008827e3: nop    DWORD PTR [rax+0x0]
0x008827e7: nop    WORD PTR [rax+rax*1+0x0]
0x008827f0: mov    DWORD PTR [rip+0x1dc1b6d],r13d        # 0x142644364
0x008827f7: mov    DWORD PTR [rip+0x1dc1b6b],esi        # 0x142644368
0x008827fd: test   ebx,ebx
0x008827ff: jne    0x140882807
0x00882801: mov    edx,DWORD PTR [r11-0x18]
0x00882805: jmp    0x140882815
0x00882807: cmp    ebx,0xb
0x0088280a: jne    0x140882811
0x0088280c: mov    edx,DWORD PTR [r11]
0x0088280f: jmp    0x140882815
0x00882811: mov    edx,DWORD PTR [r11-0xc]
0x00882815: lea    rcx,[rip+0x1dc1ac4]        # 0x1426442e0
0x0088281c: call   0x140ad7b10
0x00882821: inc    esi
0x00882823: add    r11,0x4
0x00882827: cmp    r11,r15
0x0088282a: jl     0x1408827f0
0x0088282c: inc    ebx
0x0088282e: cmp    ebx,0xc
0x00882831: jl     0x1408827d0
0x00882833: mov    DWORD PTR [rip+0x1dc1b2f],0x1010007        # 0x14264436c
0x0088283d: lea    eax,[rdi-0x9]
0x00882840: mov    DWORD PTR [rip+0x1dc1b1e],eax        # 0x142644364
0x00882846: add    r12d,0x2
0x0088284a: mov    DWORD PTR [rip+0x1dc1b17],r12d        # 0x142644368
0x00882851: xorps  xmm0,xmm0
0x00882854: movups XMMWORD PTR [rbp-0x80],xmm0
0x00882858: movdqa xmm1,XMMWORD PTR [rip+0xf03220]        # 0x141785a80
0x00882860: movdqu XMMWORD PTR [rbp-0x70],xmm1
0x00882865: mov    eax,DWORD PTR [rip+0xd76d31]        # 0x1415f959c ; literal="Cancel"
0x0088286b: mov    DWORD PTR [rbp-0x80],eax
0x0088286e: movzx  eax,WORD PTR [rip+0xd76d2b]        # 0x1415f95a0 ; literal="el"
0x00882875: mov    WORD PTR [rbp-0x7c],ax
0x00882879: mov    BYTE PTR [rbp-0x7a],0x0
0x0088287d: xor    r9d,r9d
0x00882880: lea    rdx,[rbp-0x80]
0x00882884: lea    rcx,[rip+0x1dc1a55]        # 0x1426442e0
0x0088288b: call   0x140ad69a0
0x00882890: nop
0x00882891: mov    rdx,QWORD PTR [rbp-0x68]
0x00882895: cmp    rdx,0xf
0x00882899: mov    r14d,DWORD PTR [rsp+0x44]
0x0088289e: jbe    0x1408828d1
0x008828a0: inc    rdx
0x008828a3: mov    rcx,QWORD PTR [rbp-0x80]
0x008828a7: mov    rax,rcx
0x008828aa: cmp    rdx,0x1000
0x008828b1: jb     0x1408828cc
0x008828b3: add    rdx,0x27
0x008828b7: mov    rcx,QWORD PTR [rcx-0x8]
0x008828bb: sub    rax,rcx
0x008828be: add    rax,0xfffffffffffffff8
0x008828c2: cmp    rax,0x1f
0x008828c6: ja     0x140882c56
0x008828cc: call   0x1415345f0
0x008828d1: mov    DWORD PTR [rip+0x1dc1a91],0x1010007        # 0x14264436c
0x008828db: lea    eax,[r14+0x2]
0x008828df: mov    DWORD PTR [rip+0x1dc1a7f],eax        # 0x142644364
0x008828e5: mov    DWORD PTR [rip+0x1dc1a7c],r12d        # 0x142644368
0x008828ec: mov    rax,QWORD PTR [rsp+0x50]
0x008828f1: movsxd rax,DWORD PTR [rax+0x4]
0x008828f5: cmp    eax,0x7
0x008828f8: ja     0x1408829b1
0x008828fe: lea    rdx,[rip+0xffffffffff77d6fb]        # 0x140000000
0x00882905: mov    ecx,DWORD PTR [rdx+rax*4+0x882fc8]
0x0088290c: add    rcx,rdx
0x0088290f: jmp    rcx
0x00882911: xorps  xmm0,xmm0
0x00882914: movups XMMWORD PTR [rbp-0x60],xmm0
0x00882918: mov    ecx,0x20
0x0088291d: call   0x140070760
0x00882922: mov    rdx,rax
0x00882925: mov    QWORD PTR [rbp-0x60],rax
0x00882929: movdqa xmm0,XMMWORD PTR [rip+0xf0325f]        # 0x141785b90
0x00882931: movdqu XMMWORD PTR [rbp-0x50],xmm0
0x00882936: movups xmm0,XMMWORD PTR [rip+0xe2cbd3]        # 0x1416af510 ; literal="What do you want to do?"
0x0088293d: movups XMMWORD PTR [rax],xmm0
0x00882940: mov    ecx,DWORD PTR [rip+0xe2cbda]        # 0x1416af520 ; literal=" to do?"
0x00882946: mov    DWORD PTR [rax+0x10],ecx
0x00882949: movzx  ecx,WORD PTR [rip+0xe2cbd4]        # 0x1416af524 ; literal="do?"
0x00882950: mov    WORD PTR [rax+0x14],cx
0x00882954: movzx  eax,BYTE PTR [rip+0xe2cbcb]        # 0x1416af526 ; literal="?"
0x0088295b: mov    BYTE PTR [rdx+0x16],al
0x0088295e: mov    BYTE PTR [rdx+0x17],0x0
0x00882962: xor    r9d,r9d
0x00882965: lea    rdx,[rbp-0x60]
0x00882969: lea    rcx,[rip+0x1dc1970]        # 0x1426442e0
0x00882970: call   0x140ad69a0
0x00882975: nop
0x00882976: mov    rdx,QWORD PTR [rbp-0x48]
0x0088297a: cmp    rdx,0xf
0x0088297e: jbe    0x1408829b1
0x00882980: inc    rdx
0x00882983: mov    rcx,QWORD PTR [rbp-0x60]
0x00882987: mov    rax,rcx
0x0088298a: cmp    rdx,0x1000
0x00882991: jb     0x1408829ac
0x00882993: add    rdx,0x27
0x00882997: mov    rcx,QWORD PTR [rcx-0x8]
0x0088299b: sub    rax,rcx
0x0088299e: add    rax,0xfffffffffffffff8
0x008829a2: cmp    rax,0x1f
0x008829a6: ja     0x140882c56
0x008829ac: call   0x1415345f0
0x008829b1: lea    r8d,[r14+0x1]
0x008829b5: lea    esi,[rdi-0x1]
0x008829b8: mov    DWORD PTR [rsp+0x44],esi
0x008829bc: lea    r10d,[r12+0x2]
0x008829c1: mov    DWORD PTR [rsp+0x58],r10d
0x008829c6: mov    ecx,DWORD PTR [rsp+0x40]
0x008829ca: dec    ecx
0x008829cc: sub    ecx,r10d
0x008829cf: inc    ecx
0x008829d1: mov    eax,0x55555556
0x008829d6: imul   ecx
0x008829d8: mov    r9d,edx
0x008829db: shr    r9d,0x1f
0x008829df: add    r9d,edx
0x008829e2: mov    DWORD PTR [rsp+0x68],r9d
0x008829e7: mov    rdx,QWORD PTR [rsp+0x50]
0x008829ec: mov    rcx,QWORD PTR [rdx+0x20]
0x008829f0: sub    rcx,QWORD PTR [rdx+0x18]
0x008829f4: sar    rcx,0x3
0x008829f8: cmp    ecx,r9d
0x008829fb: jle    0x140882a04
0x008829fd: lea    esi,[rdi-0x3]
0x00882a00: mov    DWORD PTR [rsp+0x44],esi
0x00882a04: mov    ebx,r10d
0x00882a07: mov    DWORD PTR [rsp+0x40],ebx
0x00882a0b: sub    ecx,r9d
0x00882a0e: cmp    DWORD PTR [rdx+0x34],ecx
0x00882a11: cmovle ecx,DWORD PTR [rdx+0x34]
0x00882a15: xor    eax,eax
0x00882a17: test   ecx,ecx
0x00882a19: cmovns eax,ecx
0x00882a1c: mov    DWORD PTR [rsp+0x70],eax
0x00882a20: movsxd rdi,eax
0x00882a23: mov    DWORD PTR [rsp+0x64],edi
0x00882a27: add    eax,r9d
0x00882a2a: mov    DWORD PTR [rsp+0x74],eax
0x00882a2e: cmp    edi,eax
0x00882a30: jge    0x140882f24
0x00882a36: movsxd r13,esi
0x00882a39: movsxd r12,r8d
0x00882a3c: lea    r15,[rdi*8+0x0]
0x00882a44: mov    QWORD PTR [rsp+0x78],r15
0x00882a49: nop    DWORD PTR [rax+0x0]
0x00882a50: mov    rdx,QWORD PTR [rdx+0x18]
0x00882a54: mov    rax,QWORD PTR [rsp+0x50]
0x00882a59: mov    rcx,QWORD PTR [rax+0x20]
0x00882a5d: sub    rcx,rdx
0x00882a60: sar    rcx,0x3
0x00882a64: movsxd rax,edi
0x00882a67: cmp    rax,rcx
0x00882a6a: jae    0x140882f15
0x00882a70: mov    rcx,QWORD PTR [rdx+r15*1]
0x00882a74: mov    rax,QWORD PTR [rcx]
0x00882a77: mov    edx,DWORD PTR [rsp+0x6c]
0x00882a7b: call   QWORD PTR [rax+0xc8]
0x00882a81: mov    edx,eax
0x00882a83: mov    DWORD PTR [rsp+0x60],eax
0x00882a87: mov    DWORD PTR [rip+0x1dc18db],0x1010007        # 0x14264436c
0x00882a91: lea    r8d,[r14+0x1]
0x00882a95: mov    edi,r8d
0x00882a98: cmp    r8d,esi
0x00882a9b: jg     0x140882d1d
0x00882aa1: lea    eax,[rbx+0x3]
0x00882aa4: mov    rsi,r12
0x00882aa7: mov    ecx,DWORD PTR [rsp+0x44]
0x00882aab: nop    DWORD PTR [rax+rax*1+0x0]
0x00882ab0: mov    r15d,ebx
0x00882ab3: cmp    ebx,eax
0x00882ab5: jge    0x140882d03
0x00882abb: lea    rbx,[rip+0x1dc33ca]        # 0x142645e8c
0x00882ac2: nop    DWORD PTR [rax+0x0]
0x00882ac6: data16 nop WORD PTR [rax+rax*1+0x0]
0x00882ad0: mov    DWORD PTR [rip+0x1dc188e],edi        # 0x142644364
0x00882ad6: mov    DWORD PTR [rip+0x1dc188b],r15d        # 0x142644368
0x00882add: test   edx,edx
0x00882adf: je     0x140882c8e
0x00882ae5: cmp    rsi,r12
0x00882ae8: jne    0x140882c5d
0x00882aee: mov    edx,DWORD PTR [rbx-0xc]
0x00882af1: jmp    0x140882cae
0x00882af6: xorps  xmm0,xmm0
0x00882af9: movups XMMWORD PTR [rbp-0x60],xmm0
0x00882afd: mov    ecx,0x20
0x00882b02: call   0x140070760
0x00882b07: mov    rdx,rax
0x00882b0a: mov    QWORD PTR [rbp-0x60],rax
0x00882b0e: movdqa xmm0,XMMWORD PTR [rip+0xf030da]        # 0x141785bf0
0x00882b16: movdqu XMMWORD PTR [rbp-0x50],xmm0
0x00882b1b: movups xmm0,XMMWORD PTR [rip+0xe2c9ce]        # 0x1416af4f0 ; literal="Where would you like to move?"
0x00882b22: movups XMMWORD PTR [rax],xmm0
0x00882b25: movsd  xmm0,QWORD PTR [rip+0xe2c9d3]        # 0x1416af500 ; literal="like to move?"
0x00882b2d: movsd  QWORD PTR [rax+0x10],xmm0
0x00882b32: mov    ecx,DWORD PTR [rip+0xe2c9d0]        # 0x1416af508 ; literal="move?"
0x00882b38: mov    DWORD PTR [rax+0x18],ecx
0x00882b3b: movzx  eax,BYTE PTR [rip+0xe2c9ca]        # 0x1416af50c ; literal="?"
0x00882b42: mov    BYTE PTR [rdx+0x1c],al
0x00882b45: mov    BYTE PTR [rdx+0x1d],0x0
0x00882b49: xor    r9d,r9d
0x00882b4c: lea    rdx,[rbp-0x60]
0x00882b50: lea    rcx,[rip+0x1dc1789]        # 0x1426442e0
0x00882b57: call   0x140ad69a0
0x00882b5c: nop
0x00882b5d: jmp    0x140882976
0x00882b62: xorps  xmm0,xmm0
0x00882b65: mov    ecx,0x30
0x00882b6a: movups XMMWORD PTR [rbp-0x60],xmm0
0x00882b6e: cmp    BYTE PTR [rip+0x101feb3],0x0        # 0x1418a2a28
0x00882b75: je     0x140882bc8
0x00882b77: call   0x140070760
0x00882b7c: mov    QWORD PTR [rbp-0x60],rax
0x00882b80: movdqa xmm0,XMMWORD PTR [rip+0xf030d8]        # 0x141785c60 ; literal="$"
0x00882b88: movdqu XMMWORD PTR [rbp-0x50],xmm0
0x00882b8d: movups xmm0,XMMWORD PTR [rip+0xe2c9c4]        # 0x1416af558 ; literal="Who or what would you like to shoot?"
0x00882b94: movups XMMWORD PTR [rax],xmm0
0x00882b97: movups xmm1,XMMWORD PTR [rip+0xe2c9ca]        # 0x1416af568 ; literal="d you like to shoot?"
0x00882b9e: movups XMMWORD PTR [rax+0x10],xmm1
0x00882ba2: mov    ecx,DWORD PTR [rip+0xe2c9d0]        # 0x1416af578 ; literal="oot?"
0x00882ba8: mov    DWORD PTR [rax+0x20],ecx
0x00882bab: mov    BYTE PTR [rax+0x24],0x0
0x00882baf: xor    r9d,r9d
0x00882bb2: lea    rdx,[rbp-0x60]
0x00882bb6: lea    rcx,[rip+0x1dc1723]        # 0x1426442e0
0x00882bbd: call   0x140ad69a0
0x00882bc2: nop
0x00882bc3: jmp    0x140882976
0x00882bc8: call   0x140070760
0x00882bcd: mov    QWORD PTR [rbp-0x60],rax
0x00882bd1: movdqa xmm0,XMMWORD PTR [rip+0xf030c7]        # 0x141785ca0 ; literal="("
0x00882bd9: movdqu XMMWORD PTR [rbp-0x50],xmm0
0x00882bde: movups xmm0,XMMWORD PTR [rip+0xe2c943]        # 0x1416af528 ; literal="At whom or what would you like to throw?"
0x00882be5: movups XMMWORD PTR [rax],xmm0
0x00882be8: movups xmm1,XMMWORD PTR [rip+0xe2c949]        # 0x1416af538 ; literal="would you like to throw?"
0x00882bef: movups XMMWORD PTR [rax+0x10],xmm1
0x00882bf3: movsd  xmm0,QWORD PTR [rip+0xe2c94d]        # 0x1416af548 ; literal="o throw?"
0x00882bfb: movsd  QWORD PTR [rax+0x20],xmm0
0x00882c00: mov    BYTE PTR [rax+0x28],0x0
0x00882c04: xor    r9d,r9d
0x00882c07: lea    rdx,[rbp-0x60]
0x00882c0b: lea    rcx,[rip+0x1dc16ce]        # 0x1426442e0
0x00882c12: call   0x140ad69a0
0x00882c17: nop
0x00882c18: mov    rdx,QWORD PTR [rbp-0x48]
0x00882c1c: cmp    rdx,0xf
0x00882c20: jbe    0x1408829b1
0x00882c26: inc    rdx
0x00882c29: mov    rcx,QWORD PTR [rbp-0x60]
0x00882c2d: mov    rax,rcx
0x00882c30: cmp    rdx,0x1000
0x00882c37: jb     0x1408829ac
0x00882c3d: add    rdx,0x27
0x00882c41: mov    rcx,QWORD PTR [rcx-0x8]
0x00882c45: sub    rax,rcx
0x00882c48: add    rax,0xfffffffffffffff8
0x00882c4c: cmp    rax,0x1f
0x00882c50: jbe    0x1408829ac
0x00882c56: call   QWORD PTR [rip+0xd5de44]        # 0x1415e0aa0
0x00882c5c: int3
0x00882c5d: lea    eax,[r14+0x2]
0x00882c61: cmp    edi,eax
0x00882c63: jne    0x140882c69
0x00882c65: mov    edx,DWORD PTR [rbx]
0x00882c67: jmp    0x140882cae
0x00882c69: lea    eax,[r14+0x3]
0x00882c6d: cmp    edi,eax
0x00882c6f: jne    0x140882c75
0x00882c71: mov    edx,DWORD PTR [rbx]
0x00882c73: jmp    0x140882cae
0x00882c75: lea    eax,[r14+0x4]
0x00882c79: cmp    edi,eax
0x00882c7b: jne    0x140882c81
0x00882c7d: mov    edx,DWORD PTR [rbx]
0x00882c7f: jmp    0x140882cae
0x00882c81: lea    eax,[r14+0x5]
0x00882c85: cmp    edi,eax
0x00882c87: jne    0x140882c9b
0x00882c89: mov    edx,DWORD PTR [rbx+0xc]
0x00882c8c: jmp    0x140882cae
0x00882c8e: cmp    rsi,r12
0x00882c91: jne    0x140882c9b
0x00882c93: mov    edx,DWORD PTR [rbx-0x204]
0x00882c99: jmp    0x140882cae
0x00882c9b: cmp    rsi,r13
0x00882c9e: jne    0x140882ca8
0x00882ca0: mov    edx,DWORD PTR [rbx-0x1ec]
0x00882ca6: jmp    0x140882cae
0x00882ca8: mov    edx,DWORD PTR [rbx-0x1f8]
0x00882cae: lea    rcx,[rip+0x1dc162b]        # 0x1426442e0
0x00882cb5: call   0x140ad7b10
0x00882cba: cmp    DWORD PTR [rip+0x1b449a7],0x0        # 0x1423c7668
0x00882cc1: jle    0x140882ce0
0x00882cc3: mov    rax,QWORD PTR [rip+0x1b44996]        # 0x1423c7660
0x00882cca: test   BYTE PTR [rax],0x1
0x00882ccd: je     0x140882ce0
0x00882ccf: mov    r8b,0x1
0x00882cd2: xor    edx,edx
0x00882cd4: lea    rcx,[rip+0x1dc1605]        # 0x1426442e0
0x00882cdb: call   0x1400bb120
0x00882ce0: inc    r15d
0x00882ce3: add    rbx,0x4
0x00882ce7: mov    eax,DWORD PTR [rsp+0x40]
0x00882ceb: add    eax,0x3
0x00882cee: cmp    r15d,eax
0x00882cf1: mov    edx,DWORD PTR [rsp+0x60]
0x00882cf5: jl     0x140882ad0
0x00882cfb: mov    ebx,DWORD PTR [rsp+0x40]
0x00882cff: mov    ecx,DWORD PTR [rsp+0x44]
0x00882d03: inc    edi
0x00882d05: inc    rsi
0x00882d08: cmp    edi,ecx
0x00882d0a: jle    0x140882ab0
0x00882d10: mov    esi,DWORD PTR [rsp+0x44]
0x00882d14: mov    r15,QWORD PTR [rsp+0x78]
0x00882d19: lea    r8d,[r14+0x1]
0x00882d1d: mov    ecx,0x1
0x00882d22: mov    eax,ebx
0x00882d24: lea    ebx,[rcx+rbx*1]
0x00882d27: test   edx,edx
0x00882d29: je     0x140882d66
0x00882d2b: mov    DWORD PTR [rip+0x1dc1632],r8d        # 0x142644364
0x00882d32: mov    eax,DWORD PTR [rsp+0x40]
0x00882d36: mov    DWORD PTR [rip+0x1dc162c],eax        # 0x142644368
0x00882d3c: mov    BYTE PTR [rsp+0x30],0x0
0x00882d41: mov    DWORD PTR [rsp+0x28],0x3
0x00882d49: mov    DWORD PTR [rsp+0x20],0x5
0x00882d51: mov    r9d,0x2
0x00882d57: mov    r8d,r9d
0x00882d5a: lea    rcx,[rip+0x1dc157f]        # 0x1426442e0
0x00882d61: call   0x140ad7db0
0x00882d66: lea    eax,[r14+0x8]
0x00882d6a: mov    DWORD PTR [rip+0x1dc15f4],eax        # 0x142644364
0x00882d70: mov    DWORD PTR [rip+0x1dc15f2],ebx        # 0x142644368
0x00882d76: mov    edi,DWORD PTR [rsp+0x64]
0x00882d7a: mov    edx,edi
0x00882d7c: sub    edx,DWORD PTR [rsp+0x70]
0x00882d80: add    edx,0x52
0x00882d83: call   0x140c364f0
0x00882d88: lea    eax,[r14+0xa]
0x00882d8c: mov    DWORD PTR [rip+0x1dc15d2],eax        # 0x142644364
0x00882d92: mov    DWORD PTR [rip+0x1dc15d0],ebx        # 0x142644368
0x00882d98: mov    rbx,QWORD PTR [rsp+0x50]
0x00882d9d: mov    rax,QWORD PTR [rbx+0x18]
0x00882da1: mov    rcx,QWORD PTR [r15+rax*1]
0x00882da5: mov    rax,QWORD PTR [rcx]
0x00882da8: call   QWORD PTR [rax+0x118]
0x00882dae: mov    DWORD PTR [rip+0x1dc15b4],0x1010007        # 0x14264436c
0x00882db8: xorps  xmm0,xmm0
0x00882dbb: movups XMMWORD PTR [rbp-0x80],xmm0
0x00882dbf: mov    QWORD PTR [rbp-0x70],0x0
0x00882dc7: mov    QWORD PTR [rbp-0x68],0xf
0x00882dcf: mov    BYTE PTR [rbp-0x80],0x0
0x00882dd3: mov    ecx,DWORD PTR [rbx+0x4]
0x00882dd6: lea    eax,[rcx-0x6]
0x00882dd9: cmp    eax,0x1
0x00882ddc: jbe    0x140882df7
0x00882dde: cmp    ecx,0x3
0x00882de1: je     0x140882df7
0x00882de3: mov    rax,QWORD PTR [rbx+0x18]
0x00882de7: mov    rcx,QWORD PTR [r15+rax*1]
0x00882deb: mov    rax,QWORD PTR [rcx]
0x00882dee: lea    rdx,[rbp-0x80]
0x00882df2: call   QWORD PTR [rax+0x8]
0x00882df5: jmp    0x140882e09
0x00882df7: mov    rax,QWORD PTR [rbx+0x18]
0x00882dfb: mov    rcx,QWORD PTR [r15+rax*1]
0x00882dff: mov    rax,QWORD PTR [rcx]
0x00882e02: lea    rdx,[rbp-0x80]
0x00882e06: call   QWORD PTR [rax+0x10]
0x00882e09: mov    eax,esi
0x00882e0b: lea    r8d,[r14+0x1]
0x00882e0f: sub    eax,r8d
0x00882e12: sub    eax,0xe
0x00882e15: cdqe
0x00882e17: mov    rcx,QWORD PTR [rbp-0x70]
0x00882e1b: cmp    rcx,rax
0x00882e1e: jb     0x140882e9a
0x00882e20: mov    rbx,r13
0x00882e23: sub    rbx,r12
0x00882e26: sub    rbx,0xd
0x00882e2a: js     0x140882e5b
0x00882e2c: cmp    rbx,rcx
0x00882e2f: ja     0x140882e49
0x00882e31: mov    QWORD PTR [rbp-0x70],rbx
0x00882e35: lea    rax,[rbp-0x80]
0x00882e39: cmp    QWORD PTR [rbp-0x68],0xf
0x00882e3e: cmova  rax,QWORD PTR [rbp-0x80]
0x00882e43: mov    BYTE PTR [rax+rbx*1],0x0
0x00882e47: jmp    0x140882e5b
0x00882e49: mov    rdx,rbx
0x00882e4c: sub    rdx,rcx
0x00882e4f: xor    r8d,r8d
0x00882e52: lea    rcx,[rbp-0x80]
0x00882e56: call   0x1400e1240
0x00882e5b: cmp    rbx,0x3
0x00882e5f: jle    0x140882e9a
0x00882e61: lea    rax,[rbp-0x80]
0x00882e65: cmp    QWORD PTR [rbp-0x68],0xf
0x00882e6a: cmova  rax,QWORD PTR [rbp-0x80]
0x00882e6f: mov    BYTE PTR [rbx+rax*1-0x3],0x2e
0x00882e74: lea    rax,[rbp-0x80]
0x00882e78: cmp    QWORD PTR [rbp-0x68],0xf
0x00882e7d: cmova  rax,QWORD PTR [rbp-0x80]
0x00882e82: mov    BYTE PTR [rax+rbx*1-0x2],0x2e
0x00882e87: lea    rax,[rbp-0x80]
0x00882e8b: cmp    QWORD PTR [rbp-0x68],0xf
0x00882e90: cmova  rax,QWORD PTR [rbp-0x80]
0x00882e95: mov    BYTE PTR [rbx+rax*1-0x1],0x2e
0x00882e9a: xor    r9d,r9d
0x00882e9d: lea    rdx,[rbp-0x80]
0x00882ea1: lea    rcx,[rip+0x1dc1438]        # 0x1426442e0
0x00882ea8: call   0x140ad69a0
0x00882ead: mov    ebx,DWORD PTR [rsp+0x40]
0x00882eb1: add    ebx,0x3
0x00882eb4: mov    DWORD PTR [rsp+0x40],ebx
0x00882eb8: mov    rdx,QWORD PTR [rbp-0x68]
0x00882ebc: cmp    rdx,0xf
0x00882ec0: jbe    0x140882eef
0x00882ec2: inc    rdx
0x00882ec5: mov    rcx,QWORD PTR [rbp-0x80]
0x00882ec9: mov    rax,rcx
0x00882ecc: cmp    rdx,0x1000
0x00882ed3: jb     0x140882eea
0x00882ed5: add    rdx,0x27
0x00882ed9: mov    rcx,QWORD PTR [rcx-0x8]
0x00882edd: sub    rax,rcx
0x00882ee0: add    rax,0xfffffffffffffff8
0x00882ee4: cmp    rax,0x1f
0x00882ee8: ja     0x140882f0e
0x00882eea: call   0x1415345f0
0x00882eef: inc    edi
0x00882ef1: mov    DWORD PTR [rsp+0x64],edi
0x00882ef5: add    r15,0x8
0x00882ef9: mov    QWORD PTR [rsp+0x78],r15
0x00882efe: mov    rdx,QWORD PTR [rsp+0x50]
0x00882f03: cmp    edi,DWORD PTR [rsp+0x74]
0x00882f07: jge    0x140882f1a
0x00882f09: jmp    0x140882a50
0x00882f0e: call   QWORD PTR [rip+0xd5db8c]        # 0x1415e0aa0
0x00882f14: int3
0x00882f15: mov    rdx,QWORD PTR [rsp+0x50]
0x00882f1a: mov    r10d,DWORD PTR [rsp+0x58]
0x00882f1f: mov    r9d,DWORD PTR [rsp+0x68]
0x00882f24: mov    rcx,QWORD PTR [rdx+0x20]
0x00882f28: sub    rcx,QWORD PTR [rdx+0x18]
0x00882f2c: sar    rcx,0x3
0x00882f30: cmp    ecx,r9d
0x00882f33: jle    0x140882f9d
0x00882f35: mov    QWORD PTR [rbp-0x68],0x0
0x00882f3d: mov    eax,DWORD PTR [rdx+0x34]
0x00882f40: mov    DWORD PTR [rbp-0x80],eax
0x00882f43: mov    DWORD PTR [rbp-0x7c],0x0
0x00882f4a: lea    eax,[rcx-0x1]
0x00882f4d: mov    DWORD PTR [rbp-0x78],eax
0x00882f50: lea    eax,[r10+0x1]
0x00882f54: mov    DWORD PTR [rbp-0x70],eax
0x00882f57: lea    ecx,[r10-0x2]
0x00882f5b: lea    ecx,[rcx+r9*2]
0x00882f5f: add    ecx,r9d
0x00882f62: mov    DWORD PTR [rbp-0x6c],ecx
0x00882f65: mov    DWORD PTR [rbp-0x74],r9d
0x00882f69: lea    rcx,[rbp-0x80]
0x00882f6d: call   0x1400bb340
0x00882f72: lea    r9d,[rsi+0x1]
0x00882f76: mov    DWORD PTR [rsp+0x28],0x0
0x00882f7e: mov    rax,QWORD PTR [rsp+0x50]
0x00882f83: movzx  eax,BYTE PTR [rax+0x30]
0x00882f87: mov    BYTE PTR [rsp+0x20],al
0x00882f8b: mov    r8d,DWORD PTR [rsp+0x5c]
0x00882f90: mov    edx,DWORD PTR [rsp+0x48]
0x00882f94: lea    rcx,[rbp-0x80]
0x00882f98: call   0x14140a440
0x00882f9d: mov    rcx,QWORD PTR [rbp-0x18]
0x00882fa1: xor    rcx,rsp
0x00882fa4: call   0x1415345d0
0x00882fa9: movaps xmm6,XMMWORD PTR [rsp+0xf0]
0x00882fb1: add    rsp,0x108
0x00882fb8: pop    r15
0x00882fba: pop    r14
0x00882fbc: pop    r13
0x00882fbe: pop    r12
0x00882fc0: pop    rdi
0x00882fc1: pop    rsi
0x00882fc2: pop    rbx
0x00882fc3: pop    rbp
0x00882fc4: ret
0x00882fc5: nop    DWORD PTR [rax]
0x00882fc8: adc    DWORD PTR [rcx],ebp
0x00882fca: mov    BYTE PTR [rax],al
0x00882fcc: imul   BYTE PTR [rdx]
0x00882fce: mov    BYTE PTR [rax],al
0x00882fd0: imul   BYTE PTR [rdx]
0x00882fd2: mov    BYTE PTR [rax],al
0x00882fd4: adc    DWORD PTR [rcx],ebp
0x00882fd6: mov    BYTE PTR [rax],al
0x00882fd8: (bad)
0x00882fdd: sub    DWORD PTR [rax-0x77d6ef00],ecx
0x00882fe3: add    BYTE PTR [rcx],dl
0x00882fe5: .byte 0x29
0x00882fe6: mov    BYTE PTR [rax],al

# classic PE:6a70b91c:0270a000; adventure_environment_take_from_pack_animalst+8; RVA 0x890b40..0x890e70
0x00890b40: mov    QWORD PTR [rsp+0x18],rbx
0x00890b45: mov    QWORD PTR [rsp+0x20],rsi
0x00890b4a: push   rbp
0x00890b4b: push   rdi
0x00890b4c: push   r12
0x00890b4e: push   r14
0x00890b50: push   r15
0x00890b52: lea    rbp,[rsp-0x37]
0x00890b57: sub    rsp,0xa0
0x00890b5e: mov    rax,QWORD PTR [rip+0x10054db]        # 0x141896040
0x00890b65: xor    rax,rsp
0x00890b68: mov    QWORD PTR [rbp+0x27],rax
0x00890b6c: mov    r15,rdx
0x00890b6f: mov    r14,rcx
0x00890b72: cmp    QWORD PTR [rcx+0x28],0x0
0x00890b77: je     0x140890e48
0x00890b7d: mov    r8d,0x4
0x00890b83: lea    rdx,[rip+0xe1ea3e]        # 0x1416af5c8 ; literal="Get "
0x00890b8a: mov    rcx,r15
0x00890b8d: call   0x14006f860
0x00890b92: xorps  xmm0,xmm0
0x00890b95: movups XMMWORD PTR [rbp+0x7],xmm0
0x00890b99: mov    QWORD PTR [rbp+0x17],0x0
0x00890ba1: mov    QWORD PTR [rbp+0x1f],0xf
0x00890ba9: mov    BYTE PTR [rbp+0x7],0x0
0x00890bad: mov    r9d,0xffffffff
0x00890bb3: xor    r8d,r8d
0x00890bb6: lea    rdx,[rbp+0x7]
0x00890bba: mov    rcx,QWORD PTR [r14+0x28]
0x00890bbe: call   0x140c62490
0x00890bc3: lea    rdx,[rbp+0x7]
0x00890bc7: cmp    QWORD PTR [rbp+0x1f],0xf
0x00890bcc: cmova  rdx,QWORD PTR [rbp+0x7]
0x00890bd1: mov    r8,QWORD PTR [rbp+0x17]
0x00890bd5: mov    rcx,r15
0x00890bd8: call   0x14006f9a0
0x00890bdd: mov    rsi,QWORD PTR [r14+0x28]
0x00890be1: mov    r12d,0xffff8ad0
0x00890be7: mov    WORD PTR [rbp-0x29],r12w
0x00890bec: mov    eax,DWORD PTR [rsi+0x10]
0x00890bef: test   al,0x10
0x00890bf1: jne    0x140890cba
0x00890bf7: test   al,0x8
0x00890bf9: je     0x140890ca2
0x00890bff: mov    rbx,QWORD PTR [rsi+0x38]
0x00890c03: mov    rdi,QWORD PTR [rsi+0x40]
0x00890c07: cmp    rbx,rdi
0x00890c0a: jae    0x140890c6d
0x00890c0c: mov    rcx,QWORD PTR [rbx]
0x00890c0f: mov    rax,QWORD PTR [rcx]
0x00890c12: call   QWORD PTR [rax+0x10]
0x00890c15: cmp    eax,0xb
0x00890c18: je     0x140890c43
0x00890c1a: cmp    eax,0x12
0x00890c1d: jne    0x140890c51
0x00890c1f: mov    rcx,QWORD PTR [rbx]
0x00890c22: mov    rax,QWORD PTR [rcx]
0x00890c25: call   QWORD PTR [rax+0x20]
0x00890c28: test   rax,rax
0x00890c2b: je     0x140890c51
0x00890c2d: lea    r9,[rbp-0x25]
0x00890c31: lea    r8,[rbp-0x21]
0x00890c35: lea    rdx,[rbp-0x29]
0x00890c39: mov    rcx,rax
0x00890c3c: call   0x1413623a0
0x00890c41: jmp    0x140890cba
0x00890c43: mov    rcx,QWORD PTR [rbx]
0x00890c46: mov    rax,QWORD PTR [rcx]
0x00890c49: call   QWORD PTR [rax+0x18]
0x00890c4c: test   rax,rax
0x00890c4f: jne    0x140890c57
0x00890c51: add    rbx,0x8
0x00890c55: jmp    0x140890c07
0x00890c57: lea    r9,[rbp-0x25]
0x00890c5b: lea    r8,[rbp-0x21]
0x00890c5f: lea    rdx,[rbp-0x29]
0x00890c63: mov    rcx,rax
0x00890c66: call   0x140c88ae0
0x00890c6b: jmp    0x140890cba
0x00890c6d: mov    rax,QWORD PTR [rsi+0x20]
0x00890c71: mov    rcx,QWORD PTR [rsi+0x28]
0x00890c75: cmp    rax,rcx
0x00890c78: jae    0x140890cba
0x00890c7a: mov    rdx,QWORD PTR [rax]
0x00890c7d: cmp    DWORD PTR [rdx],0x7
0x00890c80: je     0x140890c88
0x00890c82: add    rax,0x8
0x00890c86: jmp    0x140890c75
0x00890c88: mov    rcx,QWORD PTR [rdx+0x8]
0x00890c8c: movzx  eax,WORD PTR [rcx+0x4]
0x00890c90: mov    WORD PTR [rbp-0x29],ax
0x00890c94: movzx  eax,WORD PTR [rcx+0x6]
0x00890c98: mov    WORD PTR [rbp-0x21],ax
0x00890c9c: movzx  eax,WORD PTR [rcx+0x8]
0x00890ca0: jmp    0x140890cb6
0x00890ca2: movzx  eax,WORD PTR [rsi+0x8]
0x00890ca6: mov    WORD PTR [rbp-0x29],ax
0x00890caa: movzx  eax,WORD PTR [rsi+0xa]
0x00890cae: mov    WORD PTR [rbp-0x21],ax
0x00890cb2: movzx  eax,WORD PTR [rsi+0xc]
0x00890cb6: mov    WORD PTR [rbp-0x25],ax
0x00890cba: cmp    DWORD PTR [r14+0x8],0x0
0x00890cbf: jne    0x140890d69
0x00890cc5: cmp    QWORD PTR [r14+0x20],0x0
0x00890cca: je     0x140890d69
0x00890cd0: mov    r8d,0x6
0x00890cd6: lea    rdx,[rip+0xd57ca7]        # 0x1415e8984 ; literal=" from "
0x00890cdd: mov    rcx,r15
0x00890ce0: call   0x14006f9a0
0x00890ce5: xorps  xmm0,xmm0
0x00890ce8: movups XMMWORD PTR [rbp-0x19],xmm0
0x00890cec: mov    QWORD PTR [rbp-0x9],0x0
0x00890cf4: mov    QWORD PTR [rbp-0x1],0xf
0x00890cfc: mov    BYTE PTR [rbp-0x19],0x0
0x00890d00: xor    r8d,r8d
0x00890d03: lea    rdx,[rbp-0x19]
0x00890d07: mov    rcx,QWORD PTR [r14+0x20]
0x00890d0b: call   0x14132bba0
0x00890d10: lea    rdx,[rbp-0x19]
0x00890d14: cmp    QWORD PTR [rbp-0x1],0xf
0x00890d19: cmova  rdx,QWORD PTR [rbp-0x19]
0x00890d1e: mov    r8,QWORD PTR [rbp-0x9]
0x00890d22: mov    rcx,r15
0x00890d25: call   0x14006f9a0
0x00890d2a: nop
0x00890d2b: mov    rdx,QWORD PTR [rbp-0x1]
0x00890d2f: cmp    rdx,0xf
0x00890d33: jbe    0x140890d69
0x00890d35: inc    rdx
0x00890d38: mov    rcx,QWORD PTR [rbp-0x19]
0x00890d3c: mov    rax,rcx
0x00890d3f: cmp    rdx,0x1000
0x00890d46: jb     0x140890d64
0x00890d48: add    rdx,0x27
0x00890d4c: mov    rcx,QWORD PTR [rcx-0x8]
0x00890d50: sub    rax,rcx
0x00890d53: add    rax,0xfffffffffffffff8
0x00890d57: cmp    rax,0x1f
0x00890d5b: jbe    0x140890d64
0x00890d5d: call   QWORD PTR [rip+0xd4fd3d]        # 0x1415e0aa0
0x00890d63: int3
0x00890d64: call   0x1415345f0
0x00890d69: movzx  eax,WORD PTR [rbp-0x29]
0x00890d6d: cmp    ax,r12w
0x00890d71: je     0x140890e0a
0x00890d77: mov    rcx,QWORD PTR [rip+0x1b4e282]        # 0x1423df000
0x00890d7e: cmp    ax,WORD PTR [rcx+0xa8]
0x00890d85: jne    0x140890da1
0x00890d87: movzx  eax,WORD PTR [rcx+0xaa]
0x00890d8e: cmp    WORD PTR [rbp-0x21],ax
0x00890d92: jne    0x140890da1
0x00890d94: movzx  eax,WORD PTR [rcx+0xac]
0x00890d9b: cmp    WORD PTR [rbp-0x25],ax
0x00890d9f: je     0x140890e0a
0x00890da1: mov    r8d,0x2
0x00890da7: lea    rdx,[rip+0xd7f4ea]        # 0x141610298 ; literal=" ("
0x00890dae: mov    rcx,r15
0x00890db1: call   0x14006f9a0
0x00890db6: mov    QWORD PTR [rsp+0x30],r15
0x00890dbb: movzx  eax,WORD PTR [rbp-0x25]
0x00890dbf: mov    WORD PTR [rsp+0x28],ax
0x00890dc4: movzx  eax,WORD PTR [rbp-0x21]
0x00890dc8: mov    WORD PTR [rsp+0x20],ax
0x00890dcd: movzx  r9d,WORD PTR [rbp-0x29]
0x00890dd2: mov    rcx,QWORD PTR [rip+0x1b4e227]        # 0x1423df000
0x00890dd9: movzx  r8d,WORD PTR [rcx+0xac]
0x00890de1: movzx  edx,WORD PTR [rcx+0xaa]
0x00890de8: movzx  ecx,WORD PTR [rcx+0xa8]
0x00890def: call   0x14074cc40
0x00890df4: mov    r8d,0x1
0x00890dfa: lea    rdx,[rip+0xd7f4d7]        # 0x1416102d8 ; literal=")"
0x00890e01: mov    rcx,r15
0x00890e04: call   0x14006f9a0
0x00890e09: nop
0x00890e0a: mov    rdx,QWORD PTR [rbp+0x1f]
0x00890e0e: cmp    rdx,0xf
0x00890e12: jbe    0x140890e48
0x00890e14: inc    rdx
0x00890e17: mov    rcx,QWORD PTR [rbp+0x7]
0x00890e1b: mov    rax,rcx
0x00890e1e: cmp    rdx,0x1000
0x00890e25: jb     0x140890e43
0x00890e27: add    rdx,0x27
0x00890e2b: mov    rcx,QWORD PTR [rcx-0x8]
0x00890e2f: sub    rax,rcx
0x00890e32: add    rax,0xfffffffffffffff8
0x00890e36: cmp    rax,0x1f
0x00890e3a: jbe    0x140890e43
0x00890e3c: call   QWORD PTR [rip+0xd4fc5e]        # 0x1415e0aa0
0x00890e42: int3
0x00890e43: call   0x1415345f0
0x00890e48: mov    rcx,QWORD PTR [rbp+0x27]
0x00890e4c: xor    rcx,rsp
0x00890e4f: call   0x1415345d0
0x00890e54: lea    r11,[rsp+0xa0]
0x00890e5c: mov    rbx,QWORD PTR [r11+0x40]
0x00890e60: mov    rsi,QWORD PTR [r11+0x48]
0x00890e64: mov    rsp,r11
0x00890e67: pop    r15
0x00890e69: pop    r14
0x00890e6b: pop    r12
0x00890e6d: pop    rdi
0x00890e6e: pop    rbp
0x00890e6f: ret

# classic PE:6a70b91c:0270a000; adventure_environment_pick_up_environmentst+8;adventure_environment_pick_up_ground_itemst+8; RVA 0x890e70..0x8910e7
0x00890e70: mov    QWORD PTR [rsp+0x18],rbx
0x00890e75: push   rbp
0x00890e76: push   rsi
0x00890e77: push   rdi
0x00890e78: push   r14
0x00890e7a: push   r15
0x00890e7c: mov    rbp,rsp
0x00890e7f: sub    rsp,0x80
0x00890e86: mov    rax,QWORD PTR [rip+0x10051b3]        # 0x141896040
0x00890e8d: xor    rax,rsp
0x00890e90: mov    QWORD PTR [rbp-0x10],rax
0x00890e94: mov    r14,rdx
0x00890e97: mov    rsi,rcx
0x00890e9a: cmp    QWORD PTR [rcx+0x20],0x0
0x00890e9f: je     0x1408910c4
0x00890ea5: mov    r8d,0x4
0x00890eab: lea    rdx,[rip+0xe1e716]        # 0x1416af5c8 ; literal="Get "
0x00890eb2: mov    rcx,r14
0x00890eb5: call   0x14006f860
0x00890eba: xorps  xmm0,xmm0
0x00890ebd: movups XMMWORD PTR [rbp-0x30],xmm0
0x00890ec1: mov    QWORD PTR [rbp-0x20],0x0
0x00890ec9: mov    QWORD PTR [rbp-0x18],0xf
0x00890ed1: mov    BYTE PTR [rbp-0x30],0x0
0x00890ed5: mov    r9d,0xffffffff
0x00890edb: xor    r8d,r8d
0x00890ede: lea    rdx,[rbp-0x30]
0x00890ee2: mov    rcx,QWORD PTR [rsi+0x20]
0x00890ee6: call   0x140c62490
0x00890eeb: lea    rdx,[rbp-0x30]
0x00890eef: cmp    QWORD PTR [rbp-0x18],0xf
0x00890ef4: cmova  rdx,QWORD PTR [rbp-0x30]
0x00890ef9: mov    r8,QWORD PTR [rbp-0x20]
0x00890efd: mov    rcx,r14
0x00890f00: call   0x14006f9a0
0x00890f05: mov    rsi,QWORD PTR [rsi+0x20]
0x00890f09: mov    r15d,0xffff8ad0
0x00890f0f: mov    WORD PTR [rbp-0x40],r15w
0x00890f14: mov    eax,DWORD PTR [rsi+0x10]
0x00890f17: test   al,0x10
0x00890f19: jne    0x140891086
0x00890f1f: test   al,0x8
0x00890f21: je     0x140890fcd
0x00890f27: mov    rbx,QWORD PTR [rsi+0x38]
0x00890f2b: mov    rdi,QWORD PTR [rsi+0x40]
0x00890f2f: nop
0x00890f30: cmp    rbx,rdi
0x00890f33: jae    0x140890f96
0x00890f35: mov    rcx,QWORD PTR [rbx]
0x00890f38: mov    rax,QWORD PTR [rcx]
0x00890f3b: call   QWORD PTR [rax+0x10]
0x00890f3e: cmp    eax,0xb
0x00890f41: je     0x140890f6c
0x00890f43: cmp    eax,0x12
0x00890f46: jne    0x140890f7a
0x00890f48: mov    rcx,QWORD PTR [rbx]
0x00890f4b: mov    rax,QWORD PTR [rcx]
0x00890f4e: call   QWORD PTR [rax+0x20]
0x00890f51: test   rax,rax
0x00890f54: je     0x140890f7a
0x00890f56: lea    r9,[rbp-0x3c]
0x00890f5a: lea    r8,[rbp-0x38]
0x00890f5e: lea    rdx,[rbp-0x40]
0x00890f62: mov    rcx,rax
0x00890f65: call   0x1413623a0
0x00890f6a: jmp    0x140890fe5
0x00890f6c: mov    rcx,QWORD PTR [rbx]
0x00890f6f: mov    rax,QWORD PTR [rcx]
0x00890f72: call   QWORD PTR [rax+0x18]
0x00890f75: test   rax,rax
0x00890f78: jne    0x140890f80
0x00890f7a: add    rbx,0x8
0x00890f7e: jmp    0x140890f30
0x00890f80: lea    r9,[rbp-0x3c]
0x00890f84: lea    r8,[rbp-0x38]
0x00890f88: lea    rdx,[rbp-0x40]
0x00890f8c: mov    rcx,rax
0x00890f8f: call   0x140c88ae0
0x00890f94: jmp    0x140890fe5
0x00890f96: mov    rax,QWORD PTR [rsi+0x20]
0x00890f9a: mov    rcx,QWORD PTR [rsi+0x28]
0x00890f9e: xchg   ax,ax
0x00890fa0: cmp    rax,rcx
0x00890fa3: jae    0x140890fe5
0x00890fa5: mov    rdx,QWORD PTR [rax]
0x00890fa8: cmp    DWORD PTR [rdx],0x7
0x00890fab: je     0x140890fb3
0x00890fad: add    rax,0x8
0x00890fb1: jmp    0x140890fa0
0x00890fb3: mov    rcx,QWORD PTR [rdx+0x8]
0x00890fb7: movzx  eax,WORD PTR [rcx+0x4]
0x00890fbb: mov    WORD PTR [rbp-0x40],ax
0x00890fbf: movzx  eax,WORD PTR [rcx+0x6]
0x00890fc3: mov    WORD PTR [rbp-0x38],ax
0x00890fc7: movzx  eax,WORD PTR [rcx+0x8]
0x00890fcb: jmp    0x140890fe1
0x00890fcd: movzx  eax,WORD PTR [rsi+0x8]
0x00890fd1: mov    WORD PTR [rbp-0x40],ax
0x00890fd5: movzx  eax,WORD PTR [rsi+0xa]
0x00890fd9: mov    WORD PTR [rbp-0x38],ax
0x00890fdd: movzx  eax,WORD PTR [rsi+0xc]
0x00890fe1: mov    WORD PTR [rbp-0x3c],ax
0x00890fe5: movzx  eax,WORD PTR [rbp-0x40]
0x00890fe9: cmp    ax,r15w
0x00890fed: je     0x140891086
0x00890ff3: mov    rcx,QWORD PTR [rip+0x1b4e006]        # 0x1423df000
0x00890ffa: cmp    ax,WORD PTR [rcx+0xa8]
0x00891001: jne    0x14089101d
0x00891003: movzx  eax,WORD PTR [rcx+0xaa]
0x0089100a: cmp    WORD PTR [rbp-0x38],ax
0x0089100e: jne    0x14089101d
0x00891010: movzx  eax,WORD PTR [rcx+0xac]
0x00891017: cmp    WORD PTR [rbp-0x3c],ax
0x0089101b: je     0x140891086
0x0089101d: mov    r8d,0x2
0x00891023: lea    rdx,[rip+0xd7f26e]        # 0x141610298 ; literal=" ("
0x0089102a: mov    rcx,r14
0x0089102d: call   0x14006f9a0
0x00891032: mov    QWORD PTR [rsp+0x30],r14
0x00891037: movzx  eax,WORD PTR [rbp-0x3c]
0x0089103b: mov    WORD PTR [rsp+0x28],ax
0x00891040: movzx  eax,WORD PTR [rbp-0x38]
0x00891044: mov    WORD PTR [rsp+0x20],ax
0x00891049: movzx  r9d,WORD PTR [rbp-0x40]
0x0089104e: mov    rcx,QWORD PTR [rip+0x1b4dfab]        # 0x1423df000
0x00891055: movzx  r8d,WORD PTR [rcx+0xac]
0x0089105d: movzx  edx,WORD PTR [rcx+0xaa]
0x00891064: movzx  ecx,WORD PTR [rcx+0xa8]
0x0089106b: call   0x14074cc40
0x00891070: mov    r8d,0x1
0x00891076: lea    rdx,[rip+0xd7f25b]        # 0x1416102d8 ; literal=")"
0x0089107d: mov    rcx,r14
0x00891080: call   0x14006f9a0
0x00891085: nop
0x00891086: mov    rdx,QWORD PTR [rbp-0x18]
0x0089108a: cmp    rdx,0xf
0x0089108e: jbe    0x1408910c4
0x00891090: inc    rdx
0x00891093: mov    rcx,QWORD PTR [rbp-0x30]
0x00891097: mov    rax,rcx
0x0089109a: cmp    rdx,0x1000
0x008910a1: jb     0x1408910bf
0x008910a3: add    rdx,0x27
0x008910a7: mov    rcx,QWORD PTR [rcx-0x8]
0x008910ab: sub    rax,rcx
0x008910ae: add    rax,0xfffffffffffffff8
0x008910b2: cmp    rax,0x1f
0x008910b6: jbe    0x1408910bf
0x008910b8: call   QWORD PTR [rip+0xd4f9e2]        # 0x1415e0aa0
0x008910be: int3
0x008910bf: call   0x1415345f0
0x008910c4: mov    rcx,QWORD PTR [rbp-0x10]
0x008910c8: xor    rcx,rsp
0x008910cb: call   0x1415345d0
0x008910d0: mov    rbx,QWORD PTR [rsp+0xc0]
0x008910d8: add    rsp,0x80
0x008910df: pop    r15
0x008910e1: pop    r14
0x008910e3: pop    rdi
0x008910e4: pop    rsi
0x008910e5: pop    rbp
0x008910e6: ret

# classic PE:6a70b91c:0270a000; adventure_environment_pick_up_building_itemst+8; RVA 0x8910f0..0x891421
0x008910f0: mov    QWORD PTR [rsp+0x18],rbx
0x008910f5: mov    QWORD PTR [rsp+0x20],rsi
0x008910fa: push   rbp
0x008910fb: push   rdi
0x008910fc: push   r12
0x008910fe: push   r14
0x00891100: push   r15
0x00891102: lea    rbp,[rsp-0x37]
0x00891107: sub    rsp,0xa0
0x0089110e: mov    rax,QWORD PTR [rip+0x1004f2b]        # 0x141896040
0x00891115: xor    rax,rsp
0x00891118: mov    QWORD PTR [rbp+0x27],rax
0x0089111c: mov    r15,rdx
0x0089111f: mov    r14,rcx
0x00891122: cmp    QWORD PTR [rcx+0x20],0x0
0x00891127: je     0x1408913f9
0x0089112d: mov    r8d,0x4
0x00891133: lea    rdx,[rip+0xe1e48e]        # 0x1416af5c8 ; literal="Get "
0x0089113a: mov    rcx,r15
0x0089113d: call   0x14006f860
0x00891142: xorps  xmm0,xmm0
0x00891145: movups XMMWORD PTR [rbp+0x7],xmm0
0x00891149: mov    QWORD PTR [rbp+0x17],0x0
0x00891151: mov    QWORD PTR [rbp+0x1f],0xf
0x00891159: mov    BYTE PTR [rbp+0x7],0x0
0x0089115d: mov    r9d,0xffffffff
0x00891163: xor    r8d,r8d
0x00891166: lea    rdx,[rbp+0x7]
0x0089116a: mov    rcx,QWORD PTR [r14+0x20]
0x0089116e: call   0x140c62490
0x00891173: lea    rdx,[rbp+0x7]
0x00891177: cmp    QWORD PTR [rbp+0x1f],0xf
0x0089117c: cmova  rdx,QWORD PTR [rbp+0x7]
0x00891181: mov    r8,QWORD PTR [rbp+0x17]
0x00891185: mov    rcx,r15
0x00891188: call   0x14006f9a0
0x0089118d: mov    rsi,QWORD PTR [r14+0x20]
0x00891191: mov    r12d,0xffff8ad0
0x00891197: mov    WORD PTR [rbp-0x29],r12w
0x0089119c: mov    eax,DWORD PTR [rsi+0x10]
0x0089119f: test   al,0x10
0x008911a1: jne    0x14089126a
0x008911a7: test   al,0x8
0x008911a9: je     0x140891252
0x008911af: mov    rbx,QWORD PTR [rsi+0x38]
0x008911b3: mov    rdi,QWORD PTR [rsi+0x40]
0x008911b7: cmp    rbx,rdi
0x008911ba: jae    0x14089121d
0x008911bc: mov    rcx,QWORD PTR [rbx]
0x008911bf: mov    rax,QWORD PTR [rcx]
0x008911c2: call   QWORD PTR [rax+0x10]
0x008911c5: cmp    eax,0xb
0x008911c8: je     0x1408911f3
0x008911ca: cmp    eax,0x12
0x008911cd: jne    0x140891201
0x008911cf: mov    rcx,QWORD PTR [rbx]
0x008911d2: mov    rax,QWORD PTR [rcx]
0x008911d5: call   QWORD PTR [rax+0x20]
0x008911d8: test   rax,rax
0x008911db: je     0x140891201
0x008911dd: lea    r9,[rbp-0x25]
0x008911e1: lea    r8,[rbp-0x21]
0x008911e5: lea    rdx,[rbp-0x29]
0x008911e9: mov    rcx,rax
0x008911ec: call   0x1413623a0
0x008911f1: jmp    0x14089126a
0x008911f3: mov    rcx,QWORD PTR [rbx]
0x008911f6: mov    rax,QWORD PTR [rcx]
0x008911f9: call   QWORD PTR [rax+0x18]
0x008911fc: test   rax,rax
0x008911ff: jne    0x140891207
0x00891201: add    rbx,0x8
0x00891205: jmp    0x1408911b7
0x00891207: lea    r9,[rbp-0x25]
0x0089120b: lea    r8,[rbp-0x21]
0x0089120f: lea    rdx,[rbp-0x29]
0x00891213: mov    rcx,rax
0x00891216: call   0x140c88ae0
0x0089121b: jmp    0x14089126a
0x0089121d: mov    rax,QWORD PTR [rsi+0x20]
0x00891221: mov    rcx,QWORD PTR [rsi+0x28]
0x00891225: cmp    rax,rcx
0x00891228: jae    0x14089126a
0x0089122a: mov    rdx,QWORD PTR [rax]
0x0089122d: cmp    DWORD PTR [rdx],0x7
0x00891230: je     0x140891238
0x00891232: add    rax,0x8
0x00891236: jmp    0x140891225
0x00891238: mov    rcx,QWORD PTR [rdx+0x8]
0x0089123c: movzx  eax,WORD PTR [rcx+0x4]
0x00891240: mov    WORD PTR [rbp-0x29],ax
0x00891244: movzx  eax,WORD PTR [rcx+0x6]
0x00891248: mov    WORD PTR [rbp-0x21],ax
0x0089124c: movzx  eax,WORD PTR [rcx+0x8]
0x00891250: jmp    0x140891266
0x00891252: movzx  eax,WORD PTR [rsi+0x8]
0x00891256: mov    WORD PTR [rbp-0x29],ax
0x0089125a: movzx  eax,WORD PTR [rsi+0xa]
0x0089125e: mov    WORD PTR [rbp-0x21],ax
0x00891262: movzx  eax,WORD PTR [rsi+0xc]
0x00891266: mov    WORD PTR [rbp-0x25],ax
0x0089126a: cmp    DWORD PTR [r14+0x8],0x0
0x0089126f: jne    0x14089131a
0x00891275: cmp    QWORD PTR [r14+0x28],0x0
0x0089127a: je     0x14089131a
0x00891280: mov    r8d,0x6
0x00891286: lea    rdx,[rip+0xd576f7]        # 0x1415e8984 ; literal=" from "
0x0089128d: mov    rcx,r15
0x00891290: call   0x14006f9a0
0x00891295: xorps  xmm0,xmm0
0x00891298: movups XMMWORD PTR [rbp-0x19],xmm0
0x0089129c: mov    QWORD PTR [rbp-0x9],0x0
0x008912a4: mov    QWORD PTR [rbp-0x1],0xf
0x008912ac: mov    BYTE PTR [rbp-0x19],0x0
0x008912b0: mov    rcx,QWORD PTR [r14+0x28]
0x008912b4: mov    rax,QWORD PTR [rcx]
0x008912b7: lea    rdx,[rbp-0x19]
0x008912bb: call   QWORD PTR [rax+0x188]
0x008912c1: lea    rdx,[rbp-0x19]
0x008912c5: cmp    QWORD PTR [rbp-0x1],0xf
0x008912ca: cmova  rdx,QWORD PTR [rbp-0x19]
0x008912cf: mov    r8,QWORD PTR [rbp-0x9]
0x008912d3: mov    rcx,r15
0x008912d6: call   0x14006f9a0
0x008912db: nop
0x008912dc: mov    rdx,QWORD PTR [rbp-0x1]
0x008912e0: cmp    rdx,0xf
0x008912e4: jbe    0x14089131a
0x008912e6: inc    rdx
0x008912e9: mov    rcx,QWORD PTR [rbp-0x19]
0x008912ed: mov    rax,rcx
0x008912f0: cmp    rdx,0x1000
0x008912f7: jb     0x140891315
0x008912f9: add    rdx,0x27
0x008912fd: mov    rcx,QWORD PTR [rcx-0x8]
0x00891301: sub    rax,rcx
0x00891304: add    rax,0xfffffffffffffff8
0x00891308: cmp    rax,0x1f
0x0089130c: jbe    0x140891315
0x0089130e: call   QWORD PTR [rip+0xd4f78c]        # 0x1415e0aa0
0x00891314: int3
0x00891315: call   0x1415345f0
0x0089131a: movzx  eax,WORD PTR [rbp-0x29]
0x0089131e: cmp    ax,r12w
0x00891322: je     0x1408913bb
0x00891328: mov    rcx,QWORD PTR [rip+0x1b4dcd1]        # 0x1423df000
0x0089132f: cmp    ax,WORD PTR [rcx+0xa8]
0x00891336: jne    0x140891352
0x00891338: movzx  eax,WORD PTR [rcx+0xaa]
0x0089133f: cmp    WORD PTR [rbp-0x21],ax
0x00891343: jne    0x140891352
0x00891345: movzx  eax,WORD PTR [rcx+0xac]
0x0089134c: cmp    WORD PTR [rbp-0x25],ax
0x00891350: je     0x1408913bb
0x00891352: mov    r8d,0x2
0x00891358: lea    rdx,[rip+0xd7ef39]        # 0x141610298 ; literal=" ("
0x0089135f: mov    rcx,r15
0x00891362: call   0x14006f9a0
0x00891367: mov    QWORD PTR [rsp+0x30],r15
0x0089136c: movzx  eax,WORD PTR [rbp-0x25]
0x00891370: mov    WORD PTR [rsp+0x28],ax
0x00891375: movzx  eax,WORD PTR [rbp-0x21]
0x00891379: mov    WORD PTR [rsp+0x20],ax
0x0089137e: movzx  r9d,WORD PTR [rbp-0x29]
0x00891383: mov    rcx,QWORD PTR [rip+0x1b4dc76]        # 0x1423df000
0x0089138a: movzx  r8d,WORD PTR [rcx+0xac]
0x00891392: movzx  edx,WORD PTR [rcx+0xaa]
0x00891399: movzx  ecx,WORD PTR [rcx+0xa8]
0x008913a0: call   0x14074cc40
0x008913a5: mov    r8d,0x1
0x008913ab: lea    rdx,[rip+0xd7ef26]        # 0x1416102d8 ; literal=")"
0x008913b2: mov    rcx,r15
0x008913b5: call   0x14006f9a0
0x008913ba: nop
0x008913bb: mov    rdx,QWORD PTR [rbp+0x1f]
0x008913bf: cmp    rdx,0xf
0x008913c3: jbe    0x1408913f9
0x008913c5: inc    rdx
0x008913c8: mov    rcx,QWORD PTR [rbp+0x7]
0x008913cc: mov    rax,rcx
0x008913cf: cmp    rdx,0x1000
0x008913d6: jb     0x1408913f4
0x008913d8: add    rdx,0x27
0x008913dc: mov    rcx,QWORD PTR [rcx-0x8]
0x008913e0: sub    rax,rcx
0x008913e3: add    rax,0xfffffffffffffff8
0x008913e7: cmp    rax,0x1f
0x008913eb: jbe    0x1408913f4
0x008913ed: call   QWORD PTR [rip+0xd4f6ad]        # 0x1415e0aa0
0x008913f3: int3
0x008913f4: call   0x1415345f0
0x008913f9: mov    rcx,QWORD PTR [rbp+0x27]
0x008913fd: xor    rcx,rsp
0x00891400: call   0x1415345d0
0x00891405: lea    r11,[rsp+0xa0]
0x0089140d: mov    rbx,QWORD PTR [r11+0x40]
0x00891411: mov    rsi,QWORD PTR [r11+0x48]
0x00891415: mov    rsp,r11
0x00891418: pop    r15
0x0089141a: pop    r14
0x0089141c: pop    r12
0x0089141e: pop    rdi
0x0089141f: pop    rbp
0x00891420: ret

# classic PE:6a70b91c:0270a000; adventure_environment_pick_up_building_item_contentsst+8;adventure_environment_take_item_from_containerst+8; RVA 0x891430..0x891766
0x00891430: mov    QWORD PTR [rsp+0x18],rbx
0x00891435: mov    QWORD PTR [rsp+0x20],rsi
0x0089143a: push   rbp
0x0089143b: push   rdi
0x0089143c: push   r12
0x0089143e: push   r14
0x00891440: push   r15
0x00891442: lea    rbp,[rsp-0x37]
0x00891447: sub    rsp,0xa0
0x0089144e: mov    rax,QWORD PTR [rip+0x1004beb]        # 0x141896040
0x00891455: xor    rax,rsp
0x00891458: mov    QWORD PTR [rbp+0x27],rax
0x0089145c: mov    r15,rdx
0x0089145f: mov    r14,rcx
0x00891462: cmp    QWORD PTR [rcx+0x20],0x0
0x00891467: je     0x14089173e
0x0089146d: mov    r8d,0x4
0x00891473: lea    rdx,[rip+0xe1e14e]        # 0x1416af5c8 ; literal="Get "
0x0089147a: mov    rcx,r15
0x0089147d: call   0x14006f860
0x00891482: xorps  xmm0,xmm0
0x00891485: movups XMMWORD PTR [rbp+0x7],xmm0
0x00891489: mov    QWORD PTR [rbp+0x17],0x0
0x00891491: mov    QWORD PTR [rbp+0x1f],0xf
0x00891499: mov    BYTE PTR [rbp+0x7],0x0
0x0089149d: mov    r9d,0xffffffff
0x008914a3: xor    r8d,r8d
0x008914a6: lea    rdx,[rbp+0x7]
0x008914aa: mov    rcx,QWORD PTR [r14+0x20]
0x008914ae: call   0x140c62490
0x008914b3: lea    rdx,[rbp+0x7]
0x008914b7: cmp    QWORD PTR [rbp+0x1f],0xf
0x008914bc: cmova  rdx,QWORD PTR [rbp+0x7]
0x008914c1: mov    r8,QWORD PTR [rbp+0x17]
0x008914c5: mov    rcx,r15
0x008914c8: call   0x14006f9a0
0x008914cd: mov    rsi,QWORD PTR [r14+0x20]
0x008914d1: mov    r12d,0xffff8ad0
0x008914d7: mov    WORD PTR [rbp-0x29],r12w
0x008914dc: mov    eax,DWORD PTR [rsi+0x10]
0x008914df: test   al,0x10
0x008914e1: jne    0x1408915aa
0x008914e7: test   al,0x8
0x008914e9: je     0x140891592
0x008914ef: mov    rbx,QWORD PTR [rsi+0x38]
0x008914f3: mov    rdi,QWORD PTR [rsi+0x40]
0x008914f7: cmp    rbx,rdi
0x008914fa: jae    0x14089155d
0x008914fc: mov    rcx,QWORD PTR [rbx]
0x008914ff: mov    rax,QWORD PTR [rcx]
0x00891502: call   QWORD PTR [rax+0x10]
0x00891505: cmp    eax,0xb
0x00891508: je     0x140891533
0x0089150a: cmp    eax,0x12
0x0089150d: jne    0x140891541
0x0089150f: mov    rcx,QWORD PTR [rbx]
0x00891512: mov    rax,QWORD PTR [rcx]
0x00891515: call   QWORD PTR [rax+0x20]
0x00891518: test   rax,rax
0x0089151b: je     0x140891541
0x0089151d: lea    r9,[rbp-0x25]
0x00891521: lea    r8,[rbp-0x21]
0x00891525: lea    rdx,[rbp-0x29]
0x00891529: mov    rcx,rax
0x0089152c: call   0x1413623a0
0x00891531: jmp    0x1408915aa
0x00891533: mov    rcx,QWORD PTR [rbx]
0x00891536: mov    rax,QWORD PTR [rcx]
0x00891539: call   QWORD PTR [rax+0x18]
0x0089153c: test   rax,rax
0x0089153f: jne    0x140891547
0x00891541: add    rbx,0x8
0x00891545: jmp    0x1408914f7
0x00891547: lea    r9,[rbp-0x25]
0x0089154b: lea    r8,[rbp-0x21]
0x0089154f: lea    rdx,[rbp-0x29]
0x00891553: mov    rcx,rax
0x00891556: call   0x140c88ae0
0x0089155b: jmp    0x1408915aa
0x0089155d: mov    rax,QWORD PTR [rsi+0x20]
0x00891561: mov    rcx,QWORD PTR [rsi+0x28]
0x00891565: cmp    rax,rcx
0x00891568: jae    0x1408915aa
0x0089156a: mov    rdx,QWORD PTR [rax]
0x0089156d: cmp    DWORD PTR [rdx],0x7
0x00891570: je     0x140891578
0x00891572: add    rax,0x8
0x00891576: jmp    0x140891565
0x00891578: mov    rcx,QWORD PTR [rdx+0x8]
0x0089157c: movzx  eax,WORD PTR [rcx+0x4]
0x00891580: mov    WORD PTR [rbp-0x29],ax
0x00891584: movzx  eax,WORD PTR [rcx+0x6]
0x00891588: mov    WORD PTR [rbp-0x21],ax
0x0089158c: movzx  eax,WORD PTR [rcx+0x8]
0x00891590: jmp    0x1408915a6
0x00891592: movzx  eax,WORD PTR [rsi+0x8]
0x00891596: mov    WORD PTR [rbp-0x29],ax
0x0089159a: movzx  eax,WORD PTR [rsi+0xa]
0x0089159e: mov    WORD PTR [rbp-0x21],ax
0x008915a2: movzx  eax,WORD PTR [rsi+0xc]
0x008915a6: mov    WORD PTR [rbp-0x25],ax
0x008915aa: cmp    DWORD PTR [r14+0x8],0x0
0x008915af: jne    0x14089165f
0x008915b5: cmp    QWORD PTR [r14+0x28],0x0
0x008915ba: je     0x14089165f
0x008915c0: mov    r8d,0x6
0x008915c6: lea    rdx,[rip+0xd573b7]        # 0x1415e8984 ; literal=" from "
0x008915cd: mov    rcx,r15
0x008915d0: call   0x14006f9a0
0x008915d5: xorps  xmm0,xmm0
0x008915d8: movups XMMWORD PTR [rbp-0x19],xmm0
0x008915dc: mov    QWORD PTR [rbp-0x9],0x0
0x008915e4: mov    QWORD PTR [rbp-0x1],0xf
0x008915ec: mov    BYTE PTR [rbp-0x19],0x0
0x008915f0: mov    r9d,0xffffffff
0x008915f6: xor    r8d,r8d
0x008915f9: lea    rdx,[rbp-0x19]
0x008915fd: mov    rcx,QWORD PTR [r14+0x28]
0x00891601: call   0x140c62490
0x00891606: lea    rdx,[rbp-0x19]
0x0089160a: cmp    QWORD PTR [rbp-0x1],0xf
0x0089160f: cmova  rdx,QWORD PTR [rbp-0x19]
0x00891614: mov    r8,QWORD PTR [rbp-0x9]
0x00891618: mov    rcx,r15
0x0089161b: call   0x14006f9a0
0x00891620: nop
0x00891621: mov    rdx,QWORD PTR [rbp-0x1]
0x00891625: cmp    rdx,0xf
0x00891629: jbe    0x14089165f
0x0089162b: inc    rdx
0x0089162e: mov    rcx,QWORD PTR [rbp-0x19]
0x00891632: mov    rax,rcx
0x00891635: cmp    rdx,0x1000
0x0089163c: jb     0x14089165a
0x0089163e: add    rdx,0x27
0x00891642: mov    rcx,QWORD PTR [rcx-0x8]
0x00891646: sub    rax,rcx
0x00891649: add    rax,0xfffffffffffffff8
0x0089164d: cmp    rax,0x1f
0x00891651: jbe    0x14089165a
0x00891653: call   QWORD PTR [rip+0xd4f447]        # 0x1415e0aa0
0x00891659: int3
0x0089165a: call   0x1415345f0
0x0089165f: movzx  eax,WORD PTR [rbp-0x29]
0x00891663: cmp    ax,r12w
0x00891667: je     0x140891700
0x0089166d: mov    rcx,QWORD PTR [rip+0x1b4d98c]        # 0x1423df000
0x00891674: cmp    ax,WORD PTR [rcx+0xa8]
0x0089167b: jne    0x140891697
0x0089167d: movzx  eax,WORD PTR [rcx+0xaa]
0x00891684: cmp    WORD PTR [rbp-0x21],ax
0x00891688: jne    0x140891697
0x0089168a: movzx  eax,WORD PTR [rcx+0xac]
0x00891691: cmp    WORD PTR [rbp-0x25],ax
0x00891695: je     0x140891700
0x00891697: mov    r8d,0x2
0x0089169d: lea    rdx,[rip+0xd7ebf4]        # 0x141610298 ; literal=" ("
0x008916a4: mov    rcx,r15
0x008916a7: call   0x14006f9a0
0x008916ac: mov    QWORD PTR [rsp+0x30],r15
0x008916b1: movzx  eax,WORD PTR [rbp-0x25]
0x008916b5: mov    WORD PTR [rsp+0x28],ax
0x008916ba: movzx  eax,WORD PTR [rbp-0x21]
0x008916be: mov    WORD PTR [rsp+0x20],ax
0x008916c3: movzx  r9d,WORD PTR [rbp-0x29]
0x008916c8: mov    rcx,QWORD PTR [rip+0x1b4d931]        # 0x1423df000
0x008916cf: movzx  r8d,WORD PTR [rcx+0xac]
0x008916d7: movzx  edx,WORD PTR [rcx+0xaa]
0x008916de: movzx  ecx,WORD PTR [rcx+0xa8]
0x008916e5: call   0x14074cc40
0x008916ea: mov    r8d,0x1
0x008916f0: lea    rdx,[rip+0xd7ebe1]        # 0x1416102d8 ; literal=")"
0x008916f7: mov    rcx,r15
0x008916fa: call   0x14006f9a0
0x008916ff: nop
0x00891700: mov    rdx,QWORD PTR [rbp+0x1f]
0x00891704: cmp    rdx,0xf
0x00891708: jbe    0x14089173e
0x0089170a: inc    rdx
0x0089170d: mov    rcx,QWORD PTR [rbp+0x7]
0x00891711: mov    rax,rcx
0x00891714: cmp    rdx,0x1000
0x0089171b: jb     0x140891739
0x0089171d: add    rdx,0x27
0x00891721: mov    rcx,QWORD PTR [rcx-0x8]
0x00891725: sub    rax,rcx
0x00891728: add    rax,0xfffffffffffffff8
0x0089172c: cmp    rax,0x1f
0x00891730: jbe    0x140891739
0x00891732: call   QWORD PTR [rip+0xd4f368]        # 0x1415e0aa0
0x00891738: int3
0x00891739: call   0x1415345f0
0x0089173e: mov    rcx,QWORD PTR [rbp+0x27]
0x00891742: xor    rcx,rsp
0x00891745: call   0x1415345d0
0x0089174a: lea    r11,[rsp+0xa0]
0x00891752: mov    rbx,QWORD PTR [r11+0x40]
0x00891756: mov    rsi,QWORD PTR [r11+0x48]
0x0089175a: mov    rsp,r11
0x0089175d: pop    r15
0x0089175f: pop    r14
0x00891761: pop    r12
0x00891763: pop    rdi
0x00891764: pop    rbp
0x00891765: ret

# classic PE:6a70b91c:0270a000; adventure_environment_pick_vegetationst+8; RVA 0x891770..0x8919fd
0x00891770: mov    QWORD PTR [rsp+0x18],rbx
0x00891775: push   rbp
0x00891776: push   rsi
0x00891777: push   rdi
0x00891778: push   r14
0x0089177a: push   r15
0x0089177c: mov    rbp,rsp
0x0089177f: sub    rsp,0x80
0x00891786: mov    rax,QWORD PTR [rip+0x10048b3]        # 0x141896040
0x0089178d: xor    rax,rsp
0x00891790: mov    QWORD PTR [rbp-0x10],rax
0x00891794: mov    r14,rdx
0x00891797: mov    rsi,rcx
0x0089179a: mov    rcx,QWORD PTR [rcx+0x20]
0x0089179e: test   rcx,rcx
0x008917a1: je     0x1408919da
0x008917a7: mov    rax,QWORD PTR [rcx]
0x008917aa: call   QWORD PTR [rax]
0x008917ac: lea    rcx,[rip+0xe1a449]        # 0x1416abbfc ; literal="Pick "
0x008917b3: lea    rdx,[rip+0xe1a47a]        # 0x1416abc34 ; literal="Pull "
0x008917ba: cmp    ax,0x5b
0x008917be: cmovne rdx,rcx
0x008917c2: mov    r8d,0x5
0x008917c8: mov    rcx,r14
0x008917cb: call   0x14006f860
0x008917d0: xorps  xmm0,xmm0
0x008917d3: movups XMMWORD PTR [rbp-0x30],xmm0
0x008917d7: mov    QWORD PTR [rbp-0x20],0x0
0x008917df: mov    QWORD PTR [rbp-0x18],0xf
0x008917e7: mov    BYTE PTR [rbp-0x30],0x0
0x008917eb: mov    r9d,0xffffffff
0x008917f1: xor    r8d,r8d
0x008917f4: lea    rdx,[rbp-0x30]
0x008917f8: mov    rcx,QWORD PTR [rsi+0x20]
0x008917fc: call   0x140c62490
0x00891801: lea    rdx,[rbp-0x30]
0x00891805: cmp    QWORD PTR [rbp-0x18],0xf
0x0089180a: cmova  rdx,QWORD PTR [rbp-0x30]
0x0089180f: mov    r8,QWORD PTR [rbp-0x20]
0x00891813: mov    rcx,r14
0x00891816: call   0x14006f9a0
0x0089181b: mov    rsi,QWORD PTR [rsi+0x20]
0x0089181f: mov    r15d,0xffff8ad0
0x00891825: mov    WORD PTR [rbp-0x40],r15w
0x0089182a: mov    eax,DWORD PTR [rsi+0x10]
0x0089182d: test   al,0x10
0x0089182f: jne    0x14089199c
0x00891835: test   al,0x8
0x00891837: je     0x1408918e3
0x0089183d: mov    rbx,QWORD PTR [rsi+0x38]
0x00891841: mov    rdi,QWORD PTR [rsi+0x40]
0x00891845: cmp    rbx,rdi
0x00891848: jae    0x1408918ae
0x0089184a: mov    rcx,QWORD PTR [rbx]
0x0089184d: mov    rax,QWORD PTR [rcx]
0x00891850: call   QWORD PTR [rax+0x10]
0x00891853: cmp    eax,0xb
0x00891856: je     0x140891884
0x00891858: cmp    eax,0x12
0x0089185b: jne    0x140891892
0x0089185d: mov    rcx,QWORD PTR [rbx]
0x00891860: mov    rax,QWORD PTR [rcx]
0x00891863: call   QWORD PTR [rax+0x20]
0x00891866: test   rax,rax
0x00891869: je     0x140891892
0x0089186b: lea    r9,[rbp-0x3c]
0x0089186f: lea    r8,[rbp-0x38]
0x00891873: lea    rdx,[rbp-0x40]
0x00891877: mov    rcx,rax
0x0089187a: call   0x1413623a0
0x0089187f: jmp    0x1408918fb
0x00891884: mov    rcx,QWORD PTR [rbx]
0x00891887: mov    rax,QWORD PTR [rcx]
0x0089188a: call   QWORD PTR [rax+0x18]
0x0089188d: test   rax,rax
0x00891890: jne    0x140891898
0x00891892: add    rbx,0x8
0x00891896: jmp    0x140891845
0x00891898: lea    r9,[rbp-0x3c]
0x0089189c: lea    r8,[rbp-0x38]
0x008918a0: lea    rdx,[rbp-0x40]
0x008918a4: mov    rcx,rax
0x008918a7: call   0x140c88ae0
0x008918ac: jmp    0x1408918fb
0x008918ae: mov    rax,QWORD PTR [rsi+0x20]
0x008918b2: mov    rcx,QWORD PTR [rsi+0x28]
0x008918b6: cmp    rax,rcx
0x008918b9: jae    0x1408918fb
0x008918bb: mov    rdx,QWORD PTR [rax]
0x008918be: cmp    DWORD PTR [rdx],0x7
0x008918c1: je     0x1408918c9
0x008918c3: add    rax,0x8
0x008918c7: jmp    0x1408918b6
0x008918c9: mov    rcx,QWORD PTR [rdx+0x8]
0x008918cd: movzx  eax,WORD PTR [rcx+0x4]
0x008918d1: mov    WORD PTR [rbp-0x40],ax
0x008918d5: movzx  eax,WORD PTR [rcx+0x6]
0x008918d9: mov    WORD PTR [rbp-0x38],ax
0x008918dd: movzx  eax,WORD PTR [rcx+0x8]
0x008918e1: jmp    0x1408918f7
0x008918e3: movzx  eax,WORD PTR [rsi+0x8]
0x008918e7: mov    WORD PTR [rbp-0x40],ax
0x008918eb: movzx  eax,WORD PTR [rsi+0xa]
0x008918ef: mov    WORD PTR [rbp-0x38],ax
0x008918f3: movzx  eax,WORD PTR [rsi+0xc]
0x008918f7: mov    WORD PTR [rbp-0x3c],ax
0x008918fb: movzx  eax,WORD PTR [rbp-0x40]
0x008918ff: cmp    ax,r15w
0x00891903: je     0x14089199c
0x00891909: mov    rcx,QWORD PTR [rip+0x1b4d6f0]        # 0x1423df000
0x00891910: cmp    ax,WORD PTR [rcx+0xa8]
0x00891917: jne    0x140891933
0x00891919: movzx  eax,WORD PTR [rcx+0xaa]
0x00891920: cmp    WORD PTR [rbp-0x38],ax
0x00891924: jne    0x140891933
0x00891926: movzx  eax,WORD PTR [rcx+0xac]
0x0089192d: cmp    WORD PTR [rbp-0x3c],ax
0x00891931: je     0x14089199c
0x00891933: mov    r8d,0x2
0x00891939: lea    rdx,[rip+0xd7e958]        # 0x141610298 ; literal=" ("
0x00891940: mov    rcx,r14
0x00891943: call   0x14006f9a0
0x00891948: mov    QWORD PTR [rsp+0x30],r14
0x0089194d: movzx  eax,WORD PTR [rbp-0x3c]
0x00891951: mov    WORD PTR [rsp+0x28],ax
0x00891956: movzx  eax,WORD PTR [rbp-0x38]
0x0089195a: mov    WORD PTR [rsp+0x20],ax
0x0089195f: movzx  r9d,WORD PTR [rbp-0x40]
0x00891964: mov    rcx,QWORD PTR [rip+0x1b4d695]        # 0x1423df000
0x0089196b: movzx  r8d,WORD PTR [rcx+0xac]
0x00891973: movzx  edx,WORD PTR [rcx+0xaa]
0x0089197a: movzx  ecx,WORD PTR [rcx+0xa8]
0x00891981: call   0x14074cc40
0x00891986: mov    r8d,0x1
0x0089198c: lea    rdx,[rip+0xd7e945]        # 0x1416102d8 ; literal=")"
0x00891993: mov    rcx,r14
0x00891996: call   0x14006f9a0
0x0089199b: nop
0x0089199c: mov    rdx,QWORD PTR [rbp-0x18]
0x008919a0: cmp    rdx,0xf
0x008919a4: jbe    0x1408919da
0x008919a6: inc    rdx
0x008919a9: mov    rcx,QWORD PTR [rbp-0x30]
0x008919ad: mov    rax,rcx
0x008919b0: cmp    rdx,0x1000
0x008919b7: jb     0x1408919d5
0x008919b9: add    rdx,0x27
0x008919bd: mov    rcx,QWORD PTR [rcx-0x8]
0x008919c1: sub    rax,rcx
0x008919c4: add    rax,0xfffffffffffffff8
0x008919c8: cmp    rax,0x1f
0x008919cc: jbe    0x1408919d5
0x008919ce: call   QWORD PTR [rip+0xd4f0cc]        # 0x1415e0aa0
0x008919d4: int3
0x008919d5: call   0x1415345f0
0x008919da: mov    rcx,QWORD PTR [rbp-0x10]
0x008919de: xor    rcx,rsp
0x008919e1: call   0x1415345d0
0x008919e6: mov    rbx,QWORD PTR [rsp+0xc0]
0x008919ee: add    rsp,0x80
0x008919f5: pop    r15
0x008919f7: pop    r14
0x008919f9: pop    rdi
0x008919fa: pop    rsi
0x008919fb: pop    rbp
0x008919fc: ret

# classic PE:6a70b91c:0270a000; adventure_option_drop_itemst+8;adventure_option_eat_drink_itemst+8;adventure_option_interact_with_itemst+8;adventure_option_inventory_itemst+8;adventure_option_put_itemst+8;adventure_option_remove_itemst+8;adventure_option_throw_itemst+8;adventure_option_view_itemst+8;adventure_option_wear_itemst+8; RVA 0x891a00..0x891ac0
0x00891a00: rex push rbx
0x00891a02: sub    rsp,0x50
0x00891a06: mov    rax,QWORD PTR [rip+0x1004633]        # 0x141896040
0x00891a0d: xor    rax,rsp
0x00891a10: mov    QWORD PTR [rsp+0x40],rax
0x00891a15: mov    rbx,rdx
0x00891a18: xorps  xmm0,xmm0
0x00891a1b: movups XMMWORD PTR [rsp+0x20],xmm0
0x00891a20: mov    QWORD PTR [rsp+0x30],0x0
0x00891a29: mov    QWORD PTR [rsp+0x38],0xf
0x00891a32: mov    BYTE PTR [rsp+0x20],0x0
0x00891a37: mov    r9d,0xffffffff
0x00891a3d: xor    r8d,r8d
0x00891a40: lea    rdx,[rsp+0x20]
0x00891a45: mov    rcx,QWORD PTR [rcx+0x10]
0x00891a49: call   0x140c62490
0x00891a4e: lea    rdx,[rsp+0x20]
0x00891a53: cmp    QWORD PTR [rsp+0x38],0xf
0x00891a59: cmova  rdx,QWORD PTR [rsp+0x20]
0x00891a5f: mov    r8,QWORD PTR [rsp+0x30]
0x00891a64: mov    rcx,rbx
0x00891a67: call   0x14006f9a0
0x00891a6c: nop
0x00891a6d: mov    rdx,QWORD PTR [rsp+0x38]
0x00891a72: cmp    rdx,0xf
0x00891a76: jbe    0x140891aad
0x00891a78: inc    rdx
0x00891a7b: mov    rcx,QWORD PTR [rsp+0x20]
0x00891a80: mov    rax,rcx
0x00891a83: cmp    rdx,0x1000
0x00891a8a: jb     0x140891aa8
0x00891a8c: add    rdx,0x27
0x00891a90: mov    rcx,QWORD PTR [rcx-0x8]
0x00891a94: sub    rax,rcx
0x00891a97: add    rax,0xfffffffffffffff8
0x00891a9b: cmp    rax,0x1f
0x00891a9f: jbe    0x140891aa8
0x00891aa1: call   QWORD PTR [rip+0xd4eff9]        # 0x1415e0aa0
0x00891aa7: int3
0x00891aa8: call   0x1415345f0
0x00891aad: mov    rcx,QWORD PTR [rsp+0x40]
0x00891ab2: xor    rcx,rsp
0x00891ab5: call   0x1415345d0
0x00891aba: add    rsp,0x50
0x00891abe: pop    rbx
0x00891abf: ret

# classic PE:6a70b91c:0270a000; adventure_option_view_event_detailst+8; RVA 0x891ac0..0x891ad5
0x00891ac0: mov    rcx,rdx
0x00891ac3: mov    r8d,0x9
0x00891ac9: lea    rdx,[rip+0xd66f18]        # 0x1415f89e8 ; literal="engraving"
0x00891ad0: jmp    0x14006f9a0

# classic PE:6a70b91c:0270a000; adventure_option_view_event_detailst+16; RVA 0x891ae0..0x891af5
0x00891ae0: mov    rcx,rdx
0x00891ae3: mov    r8d,0xe
0x00891ae9: lea    rdx,[rip+0xe1dac8]        # 0x1416af5b8 ; literal="View engraving"
0x00891af0: jmp    0x14006f9a0

# classic PE:6a70b91c:0270a000; adventure_option_view_itemst+16; RVA 0x891b00..0x891be1
0x00891b00: mov    QWORD PTR [rsp+0x18],rbx
0x00891b05: push   rdi
0x00891b06: sub    rsp,0x50
0x00891b0a: mov    rax,QWORD PTR [rip+0x100452f]        # 0x141896040
0x00891b11: xor    rax,rsp
0x00891b14: mov    QWORD PTR [rsp+0x40],rax
0x00891b19: mov    rdi,rdx
0x00891b1c: mov    rbx,rcx
0x00891b1f: mov    r8d,0x5
0x00891b25: lea    rdx,[rip+0xde4404]        # 0x141675f30 ; literal="View "
0x00891b2c: mov    rcx,rdi
0x00891b2f: call   0x14006f9a0
0x00891b34: xorps  xmm0,xmm0
0x00891b37: movups XMMWORD PTR [rsp+0x20],xmm0
0x00891b3c: mov    QWORD PTR [rsp+0x30],0x0
0x00891b45: mov    QWORD PTR [rsp+0x38],0xf
0x00891b4e: mov    BYTE PTR [rsp+0x20],0x0
0x00891b53: mov    r9d,0x1
0x00891b59: xor    r8d,r8d
0x00891b5c: lea    rdx,[rsp+0x20]
0x00891b61: mov    rcx,QWORD PTR [rbx+0x10]
0x00891b65: call   0x140c62490
0x00891b6a: lea    rdx,[rsp+0x20]
0x00891b6f: cmp    QWORD PTR [rsp+0x38],0xf
0x00891b75: cmova  rdx,QWORD PTR [rsp+0x20]
0x00891b7b: mov    r8,QWORD PTR [rsp+0x30]
0x00891b80: mov    rcx,rdi
0x00891b83: call   0x14006f9a0
0x00891b88: nop
0x00891b89: mov    rdx,QWORD PTR [rsp+0x38]
0x00891b8e: cmp    rdx,0xf
0x00891b92: jbe    0x140891bc9
0x00891b94: inc    rdx
0x00891b97: mov    rcx,QWORD PTR [rsp+0x20]
0x00891b9c: mov    rax,rcx
0x00891b9f: cmp    rdx,0x1000
0x00891ba6: jb     0x140891bc4
0x00891ba8: add    rdx,0x27
0x00891bac: mov    rcx,QWORD PTR [rcx-0x8]
0x00891bb0: sub    rax,rcx
0x00891bb3: add    rax,0xfffffffffffffff8
0x00891bb7: cmp    rax,0x1f
0x00891bbb: jbe    0x140891bc4
0x00891bbd: call   QWORD PTR [rip+0xd4eedd]        # 0x1415e0aa0
0x00891bc3: int3
0x00891bc4: call   0x1415345f0
0x00891bc9: mov    rcx,QWORD PTR [rsp+0x40]
0x00891bce: xor    rcx,rsp
0x00891bd1: call   0x1415345d0
0x00891bd6: mov    rbx,QWORD PTR [rsp+0x70]
0x00891bdb: add    rsp,0x50
0x00891bdf: pop    rdi
0x00891be0: ret

# classic PE:6a70b91c:0270a000; adventure_option_drop_itemst+16; RVA 0x891bf0..0x891cd1
0x00891bf0: mov    QWORD PTR [rsp+0x18],rbx
0x00891bf5: push   rdi
0x00891bf6: sub    rsp,0x50
0x00891bfa: mov    rax,QWORD PTR [rip+0x100443f]        # 0x141896040
0x00891c01: xor    rax,rsp
0x00891c04: mov    QWORD PTR [rsp+0x40],rax
0x00891c09: mov    rdi,rdx
0x00891c0c: mov    rbx,rcx
0x00891c0f: mov    r8d,0x5
0x00891c15: lea    rdx,[rip+0xdaed18]        # 0x141640934 ; literal="Drop "
0x00891c1c: mov    rcx,rdi
0x00891c1f: call   0x14006f9a0
0x00891c24: xorps  xmm0,xmm0
0x00891c27: movups XMMWORD PTR [rsp+0x20],xmm0
0x00891c2c: mov    QWORD PTR [rsp+0x30],0x0
0x00891c35: mov    QWORD PTR [rsp+0x38],0xf
0x00891c3e: mov    BYTE PTR [rsp+0x20],0x0
0x00891c43: mov    r9d,0x1
0x00891c49: xor    r8d,r8d
0x00891c4c: lea    rdx,[rsp+0x20]
0x00891c51: mov    rcx,QWORD PTR [rbx+0x10]
0x00891c55: call   0x140c62490
0x00891c5a: lea    rdx,[rsp+0x20]
0x00891c5f: cmp    QWORD PTR [rsp+0x38],0xf
0x00891c65: cmova  rdx,QWORD PTR [rsp+0x20]
0x00891c6b: mov    r8,QWORD PTR [rsp+0x30]
0x00891c70: mov    rcx,rdi
0x00891c73: call   0x14006f9a0
0x00891c78: nop
0x00891c79: mov    rdx,QWORD PTR [rsp+0x38]
0x00891c7e: cmp    rdx,0xf
0x00891c82: jbe    0x140891cb9
0x00891c84: inc    rdx
0x00891c87: mov    rcx,QWORD PTR [rsp+0x20]
0x00891c8c: mov    rax,rcx
0x00891c8f: cmp    rdx,0x1000
0x00891c96: jb     0x140891cb4
0x00891c98: add    rdx,0x27
0x00891c9c: mov    rcx,QWORD PTR [rcx-0x8]
0x00891ca0: sub    rax,rcx
0x00891ca3: add    rax,0xfffffffffffffff8
0x00891ca7: cmp    rax,0x1f
0x00891cab: jbe    0x140891cb4
0x00891cad: call   QWORD PTR [rip+0xd4eded]        # 0x1415e0aa0
0x00891cb3: int3
0x00891cb4: call   0x1415345f0
0x00891cb9: mov    rcx,QWORD PTR [rsp+0x40]
0x00891cbe: xor    rcx,rsp
0x00891cc1: call   0x1415345d0
0x00891cc6: mov    rbx,QWORD PTR [rsp+0x70]
0x00891ccb: add    rsp,0x50
0x00891ccf: pop    rdi
0x00891cd0: ret

# classic PE:6a70b91c:0270a000; adventure_option_throw_itemst+16; RVA 0x891ce0..0x891dc1
0x00891ce0: mov    QWORD PTR [rsp+0x18],rbx
0x00891ce5: push   rdi
0x00891ce6: sub    rsp,0x50
0x00891cea: mov    rax,QWORD PTR [rip+0x100434f]        # 0x141896040
0x00891cf1: xor    rax,rsp
0x00891cf4: mov    QWORD PTR [rsp+0x40],rax
0x00891cf9: mov    rdi,rdx
0x00891cfc: mov    rbx,rcx
0x00891cff: mov    r8d,0x6
0x00891d05: lea    rdx,[rip+0xe1d8cc]        # 0x1416af5d8 ; literal="Throw "
0x00891d0c: mov    rcx,rdi
0x00891d0f: call   0x14006f9a0
0x00891d14: xorps  xmm0,xmm0
0x00891d17: movups XMMWORD PTR [rsp+0x20],xmm0
0x00891d1c: mov    QWORD PTR [rsp+0x30],0x0
0x00891d25: mov    QWORD PTR [rsp+0x38],0xf
0x00891d2e: mov    BYTE PTR [rsp+0x20],0x0
0x00891d33: mov    r9d,0x1
0x00891d39: xor    r8d,r8d
0x00891d3c: lea    rdx,[rsp+0x20]
0x00891d41: mov    rcx,QWORD PTR [rbx+0x10]
0x00891d45: call   0x140c62490
0x00891d4a: lea    rdx,[rsp+0x20]
0x00891d4f: cmp    QWORD PTR [rsp+0x38],0xf
0x00891d55: cmova  rdx,QWORD PTR [rsp+0x20]
0x00891d5b: mov    r8,QWORD PTR [rsp+0x30]
0x00891d60: mov    rcx,rdi
0x00891d63: call   0x14006f9a0
0x00891d68: nop
0x00891d69: mov    rdx,QWORD PTR [rsp+0x38]
0x00891d6e: cmp    rdx,0xf
0x00891d72: jbe    0x140891da9
0x00891d74: inc    rdx
0x00891d77: mov    rcx,QWORD PTR [rsp+0x20]
0x00891d7c: mov    rax,rcx
0x00891d7f: cmp    rdx,0x1000
0x00891d86: jb     0x140891da4
0x00891d88: add    rdx,0x27
0x00891d8c: mov    rcx,QWORD PTR [rcx-0x8]
0x00891d90: sub    rax,rcx
0x00891d93: add    rax,0xfffffffffffffff8
0x00891d97: cmp    rax,0x1f
0x00891d9b: jbe    0x140891da4
0x00891d9d: call   QWORD PTR [rip+0xd4ecfd]        # 0x1415e0aa0
0x00891da3: int3
0x00891da4: call   0x1415345f0
0x00891da9: mov    rcx,QWORD PTR [rsp+0x40]
0x00891dae: xor    rcx,rsp
0x00891db1: call   0x1415345d0
0x00891db6: mov    rbx,QWORD PTR [rsp+0x70]
0x00891dbb: add    rsp,0x50
0x00891dbf: pop    rdi
0x00891dc0: ret

# classic PE:6a70b91c:0270a000; adventure_option_wear_itemst+16; RVA 0x891dd0..0x891eb1
0x00891dd0: mov    QWORD PTR [rsp+0x18],rbx
0x00891dd5: push   rdi
0x00891dd6: sub    rsp,0x50
0x00891dda: mov    rax,QWORD PTR [rip+0x100425f]        # 0x141896040
0x00891de1: xor    rax,rsp
0x00891de4: mov    QWORD PTR [rsp+0x40],rax
0x00891de9: mov    rdi,rdx
0x00891dec: mov    rbx,rcx
0x00891def: mov    r8d,0x5
0x00891df5: lea    rdx,[rip+0xe1d7d4]        # 0x1416af5d0 ; literal="Wear "
0x00891dfc: mov    rcx,rdi
0x00891dff: call   0x14006f9a0
0x00891e04: xorps  xmm0,xmm0
0x00891e07: movups XMMWORD PTR [rsp+0x20],xmm0
0x00891e0c: mov    QWORD PTR [rsp+0x30],0x0
0x00891e15: mov    QWORD PTR [rsp+0x38],0xf
0x00891e1e: mov    BYTE PTR [rsp+0x20],0x0
0x00891e23: mov    r9d,0x1
0x00891e29: xor    r8d,r8d
0x00891e2c: lea    rdx,[rsp+0x20]
0x00891e31: mov    rcx,QWORD PTR [rbx+0x10]
0x00891e35: call   0x140c62490
0x00891e3a: lea    rdx,[rsp+0x20]
0x00891e3f: cmp    QWORD PTR [rsp+0x38],0xf
0x00891e45: cmova  rdx,QWORD PTR [rsp+0x20]
0x00891e4b: mov    r8,QWORD PTR [rsp+0x30]
0x00891e50: mov    rcx,rdi
0x00891e53: call   0x14006f9a0
0x00891e58: nop
0x00891e59: mov    rdx,QWORD PTR [rsp+0x38]
0x00891e5e: cmp    rdx,0xf
0x00891e62: jbe    0x140891e99
0x00891e64: inc    rdx
0x00891e67: mov    rcx,QWORD PTR [rsp+0x20]
0x00891e6c: mov    rax,rcx
0x00891e6f: cmp    rdx,0x1000
0x00891e76: jb     0x140891e94
0x00891e78: add    rdx,0x27
0x00891e7c: mov    rcx,QWORD PTR [rcx-0x8]
0x00891e80: sub    rax,rcx
0x00891e83: add    rax,0xfffffffffffffff8
0x00891e87: cmp    rax,0x1f
0x00891e8b: jbe    0x140891e94
0x00891e8d: call   QWORD PTR [rip+0xd4ec0d]        # 0x1415e0aa0
0x00891e93: int3
0x00891e94: call   0x1415345f0
0x00891e99: mov    rcx,QWORD PTR [rsp+0x40]
0x00891e9e: xor    rcx,rsp
0x00891ea1: call   0x1415345d0
0x00891ea6: mov    rbx,QWORD PTR [rsp+0x70]
0x00891eab: add    rsp,0x50
0x00891eaf: pop    rdi
0x00891eb0: ret

# classic PE:6a70b91c:0270a000; adventure_option_remove_itemst+16; RVA 0x891ec0..0x891fa1
0x00891ec0: mov    QWORD PTR [rsp+0x18],rbx
0x00891ec5: push   rdi
0x00891ec6: sub    rsp,0x50
0x00891eca: mov    rax,QWORD PTR [rip+0x100416f]        # 0x141896040
0x00891ed1: xor    rax,rsp
0x00891ed4: mov    QWORD PTR [rsp+0x40],rax
0x00891ed9: mov    rdi,rdx
0x00891edc: mov    rbx,rcx
0x00891edf: mov    r8d,0x7
0x00891ee5: lea    rdx,[rip+0xe1d6a4]        # 0x1416af590 ; literal="Remove "
0x00891eec: mov    rcx,rdi
0x00891eef: call   0x14006f9a0
0x00891ef4: xorps  xmm0,xmm0
0x00891ef7: movups XMMWORD PTR [rsp+0x20],xmm0
0x00891efc: mov    QWORD PTR [rsp+0x30],0x0
0x00891f05: mov    QWORD PTR [rsp+0x38],0xf
0x00891f0e: mov    BYTE PTR [rsp+0x20],0x0
0x00891f13: mov    r9d,0x1
0x00891f19: xor    r8d,r8d
0x00891f1c: lea    rdx,[rsp+0x20]
0x00891f21: mov    rcx,QWORD PTR [rbx+0x10]
0x00891f25: call   0x140c62490
0x00891f2a: lea    rdx,[rsp+0x20]
0x00891f2f: cmp    QWORD PTR [rsp+0x38],0xf
0x00891f35: cmova  rdx,QWORD PTR [rsp+0x20]
0x00891f3b: mov    r8,QWORD PTR [rsp+0x30]
0x00891f40: mov    rcx,rdi
0x00891f43: call   0x14006f9a0
0x00891f48: nop
0x00891f49: mov    rdx,QWORD PTR [rsp+0x38]
0x00891f4e: cmp    rdx,0xf
0x00891f52: jbe    0x140891f89
0x00891f54: inc    rdx
0x00891f57: mov    rcx,QWORD PTR [rsp+0x20]
0x00891f5c: mov    rax,rcx
0x00891f5f: cmp    rdx,0x1000
0x00891f66: jb     0x140891f84
0x00891f68: add    rdx,0x27
0x00891f6c: mov    rcx,QWORD PTR [rcx-0x8]
0x00891f70: sub    rax,rcx
0x00891f73: add    rax,0xfffffffffffffff8
0x00891f77: cmp    rax,0x1f
0x00891f7b: jbe    0x140891f84
0x00891f7d: call   QWORD PTR [rip+0xd4eb1d]        # 0x1415e0aa0
0x00891f83: int3
0x00891f84: call   0x1415345f0
0x00891f89: mov    rcx,QWORD PTR [rsp+0x40]
0x00891f8e: xor    rcx,rsp
0x00891f91: call   0x1415345d0
0x00891f96: mov    rbx,QWORD PTR [rsp+0x70]
0x00891f9b: add    rsp,0x50
0x00891f9f: pop    rdi
0x00891fa0: ret

# classic PE:6a70b91c:0270a000; adventure_option_put_itemst+16; RVA 0x891fb0..0x892091
0x00891fb0: mov    QWORD PTR [rsp+0x18],rbx
0x00891fb5: push   rdi
0x00891fb6: sub    rsp,0x50
0x00891fba: mov    rax,QWORD PTR [rip+0x100407f]        # 0x141896040
0x00891fc1: xor    rax,rsp
0x00891fc4: mov    QWORD PTR [rsp+0x40],rax
0x00891fc9: mov    rdi,rdx
0x00891fcc: mov    rbx,rcx
0x00891fcf: mov    r8d,0xd
0x00891fd5: lea    rdx,[rip+0xe1d5a4]        # 0x1416af580 ; literal="Put or place "
0x00891fdc: mov    rcx,rdi
0x00891fdf: call   0x14006f9a0
0x00891fe4: xorps  xmm0,xmm0
0x00891fe7: movups XMMWORD PTR [rsp+0x20],xmm0
0x00891fec: mov    QWORD PTR [rsp+0x30],0x0
0x00891ff5: mov    QWORD PTR [rsp+0x38],0xf
0x00891ffe: mov    BYTE PTR [rsp+0x20],0x0
0x00892003: mov    r9d,0x1
0x00892009: xor    r8d,r8d
0x0089200c: lea    rdx,[rsp+0x20]
0x00892011: mov    rcx,QWORD PTR [rbx+0x10]
0x00892015: call   0x140c62490
0x0089201a: lea    rdx,[rsp+0x20]
0x0089201f: cmp    QWORD PTR [rsp+0x38],0xf
0x00892025: cmova  rdx,QWORD PTR [rsp+0x20]
0x0089202b: mov    r8,QWORD PTR [rsp+0x30]
0x00892030: mov    rcx,rdi
0x00892033: call   0x14006f9a0
0x00892038: nop
0x00892039: mov    rdx,QWORD PTR [rsp+0x38]
0x0089203e: cmp    rdx,0xf
0x00892042: jbe    0x140892079
0x00892044: inc    rdx
0x00892047: mov    rcx,QWORD PTR [rsp+0x20]
0x0089204c: mov    rax,rcx
0x0089204f: cmp    rdx,0x1000
0x00892056: jb     0x140892074
0x00892058: add    rdx,0x27
0x0089205c: mov    rcx,QWORD PTR [rcx-0x8]
0x00892060: sub    rax,rcx
0x00892063: add    rax,0xfffffffffffffff8
0x00892067: cmp    rax,0x1f
0x0089206b: jbe    0x140892074
0x0089206d: call   QWORD PTR [rip+0xd4ea2d]        # 0x1415e0aa0
0x00892073: int3
0x00892074: call   0x1415345f0
0x00892079: mov    rcx,QWORD PTR [rsp+0x40]
0x0089207e: xor    rcx,rsp
0x00892081: call   0x1415345d0
0x00892086: mov    rbx,QWORD PTR [rsp+0x70]
0x0089208b: add    rsp,0x50
0x0089208f: pop    rdi
0x00892090: ret

# classic PE:6a70b91c:0270a000; adventure_option_eat_drink_itemst+16; RVA 0x8920a0..0x8921a4
0x008920a0: mov    QWORD PTR [rsp+0x18],rbx
0x008920a5: push   rdi
0x008920a6: sub    rsp,0x50
0x008920aa: mov    rax,QWORD PTR [rip+0x1003f8f]        # 0x141896040
0x008920b1: xor    rax,rsp
0x008920b4: mov    QWORD PTR [rsp+0x40],rax
0x008920b9: mov    rdi,rdx
0x008920bc: mov    rbx,rcx
0x008920bf: mov    rcx,QWORD PTR [rcx+0x10]
0x008920c3: mov    rax,QWORD PTR [rcx]
0x008920c6: call   QWORD PTR [rax+0x2b0]
0x008920cc: mov    ecx,0x4
0x008920d1: mov    r8d,0x6
0x008920d7: test   al,al
0x008920d9: cmove  r8d,ecx
0x008920dd: lea    rcx,[rip+0xe19e14]        # 0x1416abef8 ; literal="Eat "
0x008920e4: lea    rdx,[rip+0xe19df1]        # 0x1416abedc ; literal="Drink "
0x008920eb: cmove  rdx,rcx
0x008920ef: mov    rcx,rdi
0x008920f2: call   0x14006f9a0
0x008920f7: xorps  xmm0,xmm0
0x008920fa: movups XMMWORD PTR [rsp+0x20],xmm0
0x008920ff: mov    QWORD PTR [rsp+0x30],0x0
0x00892108: mov    QWORD PTR [rsp+0x38],0xf
0x00892111: mov    BYTE PTR [rsp+0x20],0x0
0x00892116: mov    r9d,0x1
0x0089211c: xor    r8d,r8d
0x0089211f: lea    rdx,[rsp+0x20]
0x00892124: mov    rcx,QWORD PTR [rbx+0x10]
0x00892128: call   0x140c62490
0x0089212d: lea    rdx,[rsp+0x20]
0x00892132: cmp    QWORD PTR [rsp+0x38],0xf
0x00892138: cmova  rdx,QWORD PTR [rsp+0x20]
0x0089213e: mov    r8,QWORD PTR [rsp+0x30]
0x00892143: mov    rcx,rdi
0x00892146: call   0x14006f9a0
0x0089214b: nop
0x0089214c: mov    rdx,QWORD PTR [rsp+0x38]
0x00892151: cmp    rdx,0xf
0x00892155: jbe    0x14089218c
0x00892157: inc    rdx
0x0089215a: mov    rcx,QWORD PTR [rsp+0x20]
0x0089215f: mov    rax,rcx
0x00892162: cmp    rdx,0x1000
0x00892169: jb     0x140892187
0x0089216b: add    rdx,0x27
0x0089216f: mov    rcx,QWORD PTR [rcx-0x8]
0x00892173: sub    rax,rcx
0x00892176: add    rax,0xfffffffffffffff8
0x0089217a: cmp    rax,0x1f
0x0089217e: jbe    0x140892187
0x00892180: call   QWORD PTR [rip+0xd4e91a]        # 0x1415e0aa0
0x00892186: int3
0x00892187: call   0x1415345f0
0x0089218c: mov    rcx,QWORD PTR [rsp+0x40]
0x00892191: xor    rcx,rsp
0x00892194: call   0x1415345d0
0x00892199: mov    rbx,QWORD PTR [rsp+0x70]
0x0089219e: add    rsp,0x50
0x008921a2: pop    rdi
0x008921a3: ret

# classic PE:6a70b91c:0270a000; adventure_movement_jumpst+8; RVA 0x8a1f50..0x8a1fb4
0x008a1f50: mov    QWORD PTR [rsp+0x8],rbx
0x008a1f55: push   rdi
0x008a1f56: sub    rsp,0x40
0x008a1f5a: cmp    BYTE PTR [rcx+0x20],0x0
0x008a1f5e: mov    rdi,rdx
0x008a1f61: mov    rbx,rcx
0x008a1f64: je     0x1408a1f7b
0x008a1f66: mov    r8d,0xc
0x008a1f6c: lea    rdx,[rip+0xe0da4d]        # 0x1416af9c0 ; literal="Jump to the "
0x008a1f73: mov    rcx,rdi
0x008a1f76: call   0x14006f860
0x008a1f7b: movzx  eax,WORD PTR [rbx+0x14]
0x008a1f7f: movzx  r9d,WORD PTR [rbx+0x10]
0x008a1f84: movzx  r8d,WORD PTR [rbx+0x1a]
0x008a1f89: movzx  edx,WORD PTR [rbx+0x18]
0x008a1f8d: movzx  ecx,WORD PTR [rbx+0x16]
0x008a1f91: mov    QWORD PTR [rsp+0x30],rdi
0x008a1f96: mov    WORD PTR [rsp+0x28],ax
0x008a1f9b: movzx  eax,WORD PTR [rbx+0x12]
0x008a1f9f: mov    WORD PTR [rsp+0x20],ax
0x008a1fa4: call   0x14074cc40
0x008a1fa9: mov    rbx,QWORD PTR [rsp+0x50]
0x008a1fae: add    rsp,0x40
0x008a1fb2: pop    rdi
0x008a1fb3: ret

# classic PE:6a70b91c:0270a000; adventure_movement_shoot_creaturest+8; RVA 0x8a2110..0x8a227f
0x008a2110: mov    QWORD PTR [rsp+0x8],rbx
0x008a2115: mov    QWORD PTR [rsp+0x18],rsi
0x008a211a: push   rdi
0x008a211b: sub    rsp,0x60
0x008a211f: mov    rax,QWORD PTR [rip+0xff3f1a]        # 0x141896040
0x008a2126: xor    rax,rsp
0x008a2129: mov    QWORD PTR [rsp+0x50],rax
0x008a212e: mov    rsi,rdx
0x008a2131: mov    rdi,rcx
0x008a2134: mov    r10d,DWORD PTR [rcx+0x24]
0x008a2138: mov    r8,QWORD PTR [rip+0x1b3ce69]        # 0x1423defa8
0x008a213f: mov    r11,QWORD PTR [rip+0x1b3ce5a]        # 0x1423defa0
0x008a2146: sub    r8,r11
0x008a2149: sar    r8,0x3
0x008a214d: test   r8d,r8d
0x008a2150: je     0x1408a218f
0x008a2152: cmp    r10d,0xffffffff
0x008a2156: je     0x1408a218f
0x008a2158: xor    edx,edx
0x008a215a: sub    r8d,0x1
0x008a215e: js     0x1408a218f
0x008a2160: lea    eax,[rdx+r8*1]
0x008a2164: sar    eax,1
0x008a2166: movsxd rcx,eax
0x008a2169: mov    rbx,QWORD PTR [r11+rcx*8]
0x008a216d: mov    r9d,DWORD PTR [rbx+0x130]
0x008a2174: cmp    r9d,r10d
0x008a2177: je     0x1408a2191
0x008a2179: lea    ecx,[rax+0x1]
0x008a217c: cmovle edx,ecx
0x008a217f: dec    eax
0x008a2181: cmp    r9d,r10d
0x008a2184: cmovle eax,r8d
0x008a2188: mov    r8d,eax
0x008a218b: cmp    edx,eax
0x008a218d: jle    0x1408a2160
0x008a218f: xor    ebx,ebx
0x008a2191: test   rbx,rbx
0x008a2194: je     0x1408a225f
0x008a219a: movzx  eax,BYTE PTR [rdi+0x38]
0x008a219e: mov    ecx,0xe
0x008a21a3: mov    r8d,0x18
0x008a21a9: test   al,al
0x008a21ab: cmove  r8d,ecx
0x008a21af: lea    rcx,[rip+0xe0d822]        # 0x1416af9d8 ; literal="Quickly shoot "
0x008a21b6: lea    rdx,[rip+0xe0d7e3]        # 0x1416af9a0 ; literal="Aim carefully and shoot "
0x008a21bd: cmove  rdx,rcx
0x008a21c1: mov    rcx,rsi
0x008a21c4: call   0x14006f860
0x008a21c9: xorps  xmm0,xmm0
0x008a21cc: movups XMMWORD PTR [rsp+0x30],xmm0
0x008a21d1: mov    QWORD PTR [rsp+0x40],0x0
0x008a21da: mov    QWORD PTR [rsp+0x48],0xf
0x008a21e3: mov    BYTE PTR [rsp+0x30],0x0
0x008a21e8: mov    BYTE PTR [rsp+0x20],0x1
0x008a21ed: mov    r9b,0x1
0x008a21f0: xor    r8d,r8d
0x008a21f3: lea    rdx,[rsp+0x30]
0x008a21f8: mov    rcx,rbx
0x008a21fb: call   0x1413293a0
0x008a2200: lea    rdx,[rsp+0x30]
0x008a2205: cmp    QWORD PTR [rsp+0x48],0xf
0x008a220b: cmova  rdx,QWORD PTR [rsp+0x30]
0x008a2211: mov    r8,QWORD PTR [rsp+0x40]
0x008a2216: mov    rcx,rsi
0x008a2219: call   0x14006f9a0
0x008a221e: nop
0x008a221f: mov    rdx,QWORD PTR [rsp+0x48]
0x008a2224: cmp    rdx,0xf
0x008a2228: jbe    0x1408a225f
0x008a222a: inc    rdx
0x008a222d: mov    rcx,QWORD PTR [rsp+0x30]
0x008a2232: mov    rax,rcx
0x008a2235: cmp    rdx,0x1000
0x008a223c: jb     0x1408a225a
0x008a223e: add    rdx,0x27
0x008a2242: mov    rcx,QWORD PTR [rcx-0x8]
0x008a2246: sub    rax,rcx
0x008a2249: add    rax,0xfffffffffffffff8
0x008a224d: cmp    rax,0x1f
0x008a2251: jbe    0x1408a225a
0x008a2253: call   QWORD PTR [rip+0xd3e847]        # 0x1415e0aa0
0x008a2259: int3
0x008a225a: call   0x1415345f0
0x008a225f: mov    rcx,QWORD PTR [rsp+0x50]
0x008a2264: xor    rcx,rsp
0x008a2267: call   0x1415345d0
0x008a226c: mov    rbx,QWORD PTR [rsp+0x70]
0x008a2271: mov    rsi,QWORD PTR [rsp+0x80]
0x008a2279: add    rsp,0x60
0x008a227d: pop    rdi
0x008a227e: ret

# classic PE:6a70b91c:0270a000; adventure_movement_shoot_tilest+8; RVA 0x8a2dc0..0x8a2ebc
0x008a2dc0: mov    QWORD PTR [rsp+0x18],rbx
0x008a2dc5: push   rdi
0x008a2dc6: sub    rsp,0x60
0x008a2dca: mov    rax,QWORD PTR [rip+0xff326f]        # 0x141896040
0x008a2dd1: xor    rax,rsp
0x008a2dd4: mov    QWORD PTR [rsp+0x50],rax
0x008a2dd9: mov    rdi,rdx
0x008a2ddc: mov    rbx,rcx
0x008a2ddf: cmp    BYTE PTR [rcx+0x20],0x0
0x008a2de3: je     0x1408a2dfa
0x008a2de5: mov    r8d,0x6
0x008a2deb: lea    rdx,[rip+0xe0cbde]        # 0x1416af9d0 ; literal="Shoot "
0x008a2df2: mov    rcx,rdi
0x008a2df5: call   0x14006f860
0x008a2dfa: xorps  xmm0,xmm0
0x008a2dfd: movups XMMWORD PTR [rsp+0x30],xmm0
0x008a2e02: mov    QWORD PTR [rsp+0x40],0x0
0x008a2e0b: mov    QWORD PTR [rsp+0x48],0xf
0x008a2e14: mov    BYTE PTR [rsp+0x30],0x0
0x008a2e19: mov    BYTE PTR [rsp+0x28],0x0
0x008a2e1e: movzx  eax,WORD PTR [rbx+0x14]
0x008a2e22: mov    WORD PTR [rsp+0x20],ax
0x008a2e27: movzx  r9d,WORD PTR [rbx+0x12]
0x008a2e2c: movzx  r8d,WORD PTR [rbx+0x10]
0x008a2e31: lea    rdx,[rsp+0x30]
0x008a2e36: lea    rcx,[rip+0x1b285a3]        # 0x1423cb3e0
0x008a2e3d: call   0x140e782a0
0x008a2e42: lea    rdx,[rsp+0x30]
0x008a2e47: cmp    QWORD PTR [rsp+0x48],0xf
0x008a2e4d: cmova  rdx,QWORD PTR [rsp+0x30]
0x008a2e53: mov    r8,QWORD PTR [rsp+0x40]
0x008a2e58: mov    rcx,rdi
0x008a2e5b: call   0x14006f9a0
0x008a2e60: nop
0x008a2e61: mov    rdx,QWORD PTR [rsp+0x48]
0x008a2e66: cmp    rdx,0xf
0x008a2e6a: jbe    0x1408a2ea1
0x008a2e6c: inc    rdx
0x008a2e6f: mov    rcx,QWORD PTR [rsp+0x30]
0x008a2e74: mov    rax,rcx
0x008a2e77: cmp    rdx,0x1000
0x008a2e7e: jb     0x1408a2e9c
0x008a2e80: add    rdx,0x27
0x008a2e84: mov    rcx,QWORD PTR [rcx-0x8]
0x008a2e88: sub    rax,rcx
0x008a2e8b: add    rax,0xfffffffffffffff8
0x008a2e8f: cmp    rax,0x1f
0x008a2e93: jbe    0x1408a2e9c
0x008a2e95: call   QWORD PTR [rip+0xd3dc05]        # 0x1415e0aa0
0x008a2e9b: int3
0x008a2e9c: call   0x1415345f0
0x008a2ea1: mov    rcx,QWORD PTR [rsp+0x50]
0x008a2ea6: xor    rcx,rsp
0x008a2ea9: call   0x1415345d0
0x008a2eae: mov    rbx,QWORD PTR [rsp+0x80]
0x008a2eb6: add    rsp,0x60
0x008a2eba: pop    rdi
0x008a2ebb: ret

# classic PE:6a70b91c:0270a000; adventure_movement_throw_item_at_creaturest+8; RVA 0x8a36f0..0x8a385f
0x008a36f0: mov    QWORD PTR [rsp+0x8],rbx
0x008a36f5: mov    QWORD PTR [rsp+0x18],rsi
0x008a36fa: push   rdi
0x008a36fb: sub    rsp,0x60
0x008a36ff: mov    rax,QWORD PTR [rip+0xff293a]        # 0x141896040
0x008a3706: xor    rax,rsp
0x008a3709: mov    QWORD PTR [rsp+0x50],rax
0x008a370e: mov    rsi,rdx
0x008a3711: mov    rdi,rcx
0x008a3714: mov    r10d,DWORD PTR [rcx+0x24]
0x008a3718: mov    r8,QWORD PTR [rip+0x1b3b889]        # 0x1423defa8
0x008a371f: mov    r11,QWORD PTR [rip+0x1b3b87a]        # 0x1423defa0
0x008a3726: sub    r8,r11
0x008a3729: sar    r8,0x3
0x008a372d: test   r8d,r8d
0x008a3730: je     0x1408a376f
0x008a3732: cmp    r10d,0xffffffff
0x008a3736: je     0x1408a376f
0x008a3738: xor    edx,edx
0x008a373a: sub    r8d,0x1
0x008a373e: js     0x1408a376f
0x008a3740: lea    eax,[rdx+r8*1]
0x008a3744: sar    eax,1
0x008a3746: movsxd rcx,eax
0x008a3749: mov    rbx,QWORD PTR [r11+rcx*8]
0x008a374d: mov    r9d,DWORD PTR [rbx+0x130]
0x008a3754: cmp    r9d,r10d
0x008a3757: je     0x1408a3771
0x008a3759: lea    ecx,[rax+0x1]
0x008a375c: cmovle edx,ecx
0x008a375f: dec    eax
0x008a3761: cmp    r9d,r10d
0x008a3764: cmovle eax,r8d
0x008a3768: mov    r8d,eax
0x008a376b: cmp    edx,eax
0x008a376d: jle    0x1408a3740
0x008a376f: xor    ebx,ebx
0x008a3771: test   rbx,rbx
0x008a3774: je     0x1408a383f
0x008a377a: movzx  eax,BYTE PTR [rdi+0x30]
0x008a377e: mov    ecx,0x11
0x008a3783: mov    r8d,0x1b
0x008a3789: test   al,al
0x008a378b: cmove  r8d,ecx
0x008a378f: lea    rcx,[rip+0xe0c19a]        # 0x1416af930 ; literal="Quickly throw at "
0x008a3796: lea    rdx,[rip+0xe0c1ab]        # 0x1416af948 ; literal="Aim carefully and throw at "
0x008a379d: cmove  rdx,rcx
0x008a37a1: mov    rcx,rsi
0x008a37a4: call   0x14006f860
0x008a37a9: xorps  xmm0,xmm0
0x008a37ac: movups XMMWORD PTR [rsp+0x30],xmm0
0x008a37b1: mov    QWORD PTR [rsp+0x40],0x0
0x008a37ba: mov    QWORD PTR [rsp+0x48],0xf
0x008a37c3: mov    BYTE PTR [rsp+0x30],0x0
0x008a37c8: mov    BYTE PTR [rsp+0x20],0x1
0x008a37cd: mov    r9b,0x1
0x008a37d0: xor    r8d,r8d
0x008a37d3: lea    rdx,[rsp+0x30]
0x008a37d8: mov    rcx,rbx
0x008a37db: call   0x1413293a0
0x008a37e0: lea    rdx,[rsp+0x30]
0x008a37e5: cmp    QWORD PTR [rsp+0x48],0xf
0x008a37eb: cmova  rdx,QWORD PTR [rsp+0x30]
0x008a37f1: mov    r8,QWORD PTR [rsp+0x40]
0x008a37f6: mov    rcx,rsi
0x008a37f9: call   0x14006f9a0
0x008a37fe: nop
0x008a37ff: mov    rdx,QWORD PTR [rsp+0x48]
0x008a3804: cmp    rdx,0xf
0x008a3808: jbe    0x1408a383f
0x008a380a: inc    rdx
0x008a380d: mov    rcx,QWORD PTR [rsp+0x30]
0x008a3812: mov    rax,rcx
0x008a3815: cmp    rdx,0x1000
0x008a381c: jb     0x1408a383a
0x008a381e: add    rdx,0x27
0x008a3822: mov    rcx,QWORD PTR [rcx-0x8]
0x008a3826: sub    rax,rcx
0x008a3829: add    rax,0xfffffffffffffff8
0x008a382d: cmp    rax,0x1f
0x008a3831: jbe    0x1408a383a
0x008a3833: call   QWORD PTR [rip+0xd3d267]        # 0x1415e0aa0
0x008a3839: int3
0x008a383a: call   0x1415345f0
0x008a383f: mov    rcx,QWORD PTR [rsp+0x50]
0x008a3844: xor    rcx,rsp
0x008a3847: call   0x1415345d0
0x008a384c: mov    rbx,QWORD PTR [rsp+0x70]
0x008a3851: mov    rsi,QWORD PTR [rsp+0x80]
0x008a3859: add    rsp,0x60
0x008a385d: pop    rdi
0x008a385e: ret

# classic PE:6a70b91c:0270a000; adventure_movement_throw_item_at_tilest+8; RVA 0x8a3d50..0x8a3e4c
0x008a3d50: mov    QWORD PTR [rsp+0x18],rbx
0x008a3d55: push   rdi
0x008a3d56: sub    rsp,0x60
0x008a3d5a: mov    rax,QWORD PTR [rip+0xff22df]        # 0x141896040
0x008a3d61: xor    rax,rsp
0x008a3d64: mov    QWORD PTR [rsp+0x50],rax
0x008a3d69: mov    rdi,rdx
0x008a3d6c: mov    rbx,rcx
0x008a3d6f: cmp    BYTE PTR [rcx+0x20],0x0
0x008a3d73: je     0x1408a3d8a
0x008a3d75: mov    r8d,0x9
0x008a3d7b: lea    rdx,[rip+0xe0bc0e]        # 0x1416af990 ; literal="Throw at "
0x008a3d82: mov    rcx,rdi
0x008a3d85: call   0x14006f860
0x008a3d8a: xorps  xmm0,xmm0
0x008a3d8d: movups XMMWORD PTR [rsp+0x30],xmm0
0x008a3d92: mov    QWORD PTR [rsp+0x40],0x0
0x008a3d9b: mov    QWORD PTR [rsp+0x48],0xf
0x008a3da4: mov    BYTE PTR [rsp+0x30],0x0
0x008a3da9: mov    BYTE PTR [rsp+0x28],0x0
0x008a3dae: movzx  eax,WORD PTR [rbx+0x14]
0x008a3db2: mov    WORD PTR [rsp+0x20],ax
0x008a3db7: movzx  r9d,WORD PTR [rbx+0x12]
0x008a3dbc: movzx  r8d,WORD PTR [rbx+0x10]
0x008a3dc1: lea    rdx,[rsp+0x30]
0x008a3dc6: lea    rcx,[rip+0x1b27613]        # 0x1423cb3e0
0x008a3dcd: call   0x140e782a0
0x008a3dd2: lea    rdx,[rsp+0x30]
0x008a3dd7: cmp    QWORD PTR [rsp+0x48],0xf
0x008a3ddd: cmova  rdx,QWORD PTR [rsp+0x30]
0x008a3de3: mov    r8,QWORD PTR [rsp+0x40]
0x008a3de8: mov    rcx,rdi
0x008a3deb: call   0x14006f9a0
0x008a3df0: nop
0x008a3df1: mov    rdx,QWORD PTR [rsp+0x48]
0x008a3df6: cmp    rdx,0xf
0x008a3dfa: jbe    0x1408a3e31
0x008a3dfc: inc    rdx
0x008a3dff: mov    rcx,QWORD PTR [rsp+0x30]
0x008a3e04: mov    rax,rcx
0x008a3e07: cmp    rdx,0x1000
0x008a3e0e: jb     0x1408a3e2c
0x008a3e10: add    rdx,0x27
0x008a3e14: mov    rcx,QWORD PTR [rcx-0x8]
0x008a3e18: sub    rax,rcx
0x008a3e1b: add    rax,0xfffffffffffffff8
0x008a3e1f: cmp    rax,0x1f
0x008a3e23: jbe    0x1408a3e2c
0x008a3e25: call   QWORD PTR [rip+0xd3cc75]        # 0x1415e0aa0
0x008a3e2b: int3
0x008a3e2c: call   0x1415345f0
0x008a3e31: mov    rcx,QWORD PTR [rsp+0x50]
0x008a3e36: xor    rcx,rsp
0x008a3e39: call   0x1415345d0
0x008a3e3e: mov    rbx,QWORD PTR [rsp+0x80]
0x008a3e46: add    rsp,0x60
0x008a3e4a: pop    rdi
0x008a3e4b: ret
