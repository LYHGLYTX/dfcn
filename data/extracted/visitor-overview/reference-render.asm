# PE:6a70a6d9:02711000; visitor overview; RVA 0x1a5b70..0x1a86e9
0x1a5b70: mov    QWORD PTR [rsp+0x18],rbx
0x1a5b75: push   rbp
0x1a5b76: push   rsi
0x1a5b77: push   rdi
0x1a5b78: push   r12
0x1a5b7a: push   r13
0x1a5b7c: push   r14
0x1a5b7e: push   r15
0x1a5b80: lea    rbp,[rsp-0x50]
0x1a5b85: sub    rsp,0x150
0x1a5b8c: mov    rax,QWORD PTR [rip+0x16f64ad]        # 0x14189c040
0x1a5b93: xor    rax,rsp
0x1a5b96: mov    QWORD PTR [rbp+0x40],rax
0x1a5b9a: mov    r14,rdx
0x1a5b9d: mov    QWORD PTR [rsp+0x40],rdx
0x1a5ba2: mov    rdi,rcx
0x1a5ba5: mov    QWORD PTR [rsp+0x48],rcx
0x1a5baa: call   QWORD PTR [rip+0x143f638]        # 0x1415e51e8
0x1a5bb0: mov    DWORD PTR [rdi+0x110],eax
0x1a5bb6: lea    rdx,[rdi+0x114]
0x1a5bbd: xorps  xmm0,xmm0
0x1a5bc0: movups XMMWORD PTR [rdx],xmm0
0x1a5bc3: xorps  xmm1,xmm1
0x1a5bc6: movups XMMWORD PTR [rdi+0x124],xmm1
0x1a5bcd: xor    r15d,r15d
0x1a5bd0: mov    QWORD PTR [rsp+0x20],r15
0x1a5bd5: xor    r9d,r9d
0x1a5bd8: xor    r8d,r8d
0x1a5bdb: mov    rcx,r14
0x1a5bde: call   0x14134a5e0
0x1a5be3: lea    rdx,[rdi+0x124]
0x1a5bea: mov    rcx,r14
0x1a5bed: call   0x14134a830
0x1a5bf2: mov    DWORD PTR [rdi+0x830],r15d
0x1a5bf9: mov    DWORD PTR [rdi+0xf30],r15d
0x1a5c00: mov    DWORD PTR [rdi+0x1630],r15d
0x1a5c07: mov    rax,QWORD PTR [r14+0xa98]
0x1a5c0e: test   rax,rax
0x1a5c11: je     0x1401a5f41
0x1a5c17: mov    r10,QWORD PTR [rax+0x218]
0x1a5c1e: mov    QWORD PTR [rsp+0x38],r10
0x1a5c23: mov    rax,QWORD PTR [rax+0x220]
0x1a5c2a: mov    QWORD PTR [rsp+0x50],rax
0x1a5c2f: lea    r8,[rsp+0x50]
0x1a5c34: lea    rdx,[rsp+0x31]
0x1a5c39: lea    rcx,[rsp+0x38]
0x1a5c3e: call   0x14006ee20
0x1a5c43: cmp    BYTE PTR [rax],r15b
0x1a5c46: jge    0x1401a5f41
0x1a5c4c: lea    r14,[rip+0xffffffffffe5a3ad]        # 0x140000000
0x1a5c53: mov    rdx,QWORD PTR [r10]
0x1a5c56: movsx  rax,WORD PTR [rdx]
0x1a5c5a: cmp    eax,0x88
0x1a5c5f: ja     0x1401a5e9c
0x1a5c65: movzx  eax,BYTE PTR [r14+rax*1+0x1a8020]
0x1a5c6e: mov    ecx,DWORD PTR [r14+rax*4+0x1a8014]
0x1a5c76: add    rcx,r14
0x1a5c79: jmp    rcx
0x1a5c7b: mov    eax,DWORD PTR [rdx+0x4]
0x1a5c7e: mov    esi,eax
0x1a5c80: sub    esi,DWORD PTR [rdx+0x10]
0x1a5c83: mov    ebx,r15d
0x1a5c86: test   eax,eax
0x1a5c88: cmovns ebx,eax
0x1a5c8b: mov    ecx,r15d
0x1a5c8e: mov    r11,r15
0x1a5c91: mov    edx,DWORD PTR [rdi+0xf30]
0x1a5c97: test   edx,edx
0x1a5c99: jle    0x1401a5cb3
0x1a5c9b: lea    rax,[rdi+0xa88]
0x1a5ca2: cmp    DWORD PTR [rax],ebx
0x1a5ca4: jl     0x1401a5cfa
0x1a5ca6: inc    ecx
0x1a5ca8: inc    r11
0x1a5cab: add    rax,0x4
0x1a5caf: cmp    ecx,edx
0x1a5cb1: jl     0x1401a5ca2
0x1a5cb3: movsxd rdx,DWORD PTR [rdi+0xf30]
0x1a5cba: cmp    edx,0x95
0x1a5cc0: jge    0x1401a5f16
0x1a5cc6: mov    rax,QWORD PTR [r10]
0x1a5cc9: movsx  ecx,WORD PTR [rax]
0x1a5ccc: mov    DWORD PTR [rdi+rdx*4+0x834],ecx
0x1a5cd3: movsxd rax,DWORD PTR [rdi+0xf30]
0x1a5cda: mov    DWORD PTR [rdi+rax*4+0xa88],ebx
0x1a5ce1: movsxd rax,DWORD PTR [rdi+0xf30]
0x1a5ce8: mov    DWORD PTR [rdi+rax*4+0xcdc],esi
0x1a5cef: inc    DWORD PTR [rdi+0xf30]
0x1a5cf5: jmp    0x1401a5f16
0x1a5cfa: lea    eax,[rdx-0x1]
0x1a5cfd: movsxd r9,eax
0x1a5d00: cmp    r9,r11
0x1a5d03: jl     0x1401a5d47
0x1a5d05: lea    rcx,[rdi+0xa8c]
0x1a5d0c: lea    rcx,[rcx+r9*4]
0x1a5d10: sub    r9,r11
0x1a5d13: inc    r9
0x1a5d16: cmp    edx,0x95
0x1a5d1c: jge    0x1401a5d3b
0x1a5d1e: mov    eax,DWORD PTR [rcx-0x258]
0x1a5d24: mov    DWORD PTR [rcx-0x254],eax
0x1a5d2a: mov    eax,DWORD PTR [rcx-0x4]
0x1a5d2d: mov    DWORD PTR [rcx],eax
0x1a5d2f: mov    eax,DWORD PTR [rcx+0x250]
0x1a5d35: mov    DWORD PTR [rcx+0x254],eax
0x1a5d3b: add    rcx,0xfffffffffffffffc
0x1a5d3f: dec    edx
0x1a5d41: sub    r9,0x1
0x1a5d45: jne    0x1401a5d16
0x1a5d47: mov    rax,QWORD PTR [r10]
0x1a5d4a: movsx  ecx,WORD PTR [rax]
0x1a5d4d: mov    DWORD PTR [rdi+r11*4+0x834],ecx
0x1a5d55: mov    DWORD PTR [rdi+r11*4+0xa88],ebx
0x1a5d5d: mov    DWORD PTR [rdi+r11*4+0xcdc],esi
0x1a5d65: mov    eax,DWORD PTR [rdi+0xf30]
0x1a5d6b: cmp    eax,0x95
0x1a5d70: jge    0x1401a5f16
0x1a5d76: inc    eax
0x1a5d78: mov    DWORD PTR [rdi+0xf30],eax
0x1a5d7e: jmp    0x1401a5f16
0x1a5d83: mov    ecx,DWORD PTR [rdx+0x4]
0x1a5d86: mov    esi,ecx
0x1a5d88: sub    esi,DWORD PTR [rdx+0x10]
0x1a5d8b: mov    ebx,r15d
0x1a5d8e: test   ecx,ecx
0x1a5d90: cmovns ebx,ecx
0x1a5d93: mov    ecx,r15d
0x1a5d96: mov    r11,r15
0x1a5d99: mov    edx,DWORD PTR [rdi+0x830]
0x1a5d9f: test   edx,edx
0x1a5da1: jle    0x1401a5dc1
0x1a5da3: lea    rax,[rdi+0x388]
0x1a5daa: nop    WORD PTR [rax+rax*1+0x0]
0x1a5db0: cmp    DWORD PTR [rax],ebx
0x1a5db2: jl     0x1401a5e08
0x1a5db4: inc    ecx
0x1a5db6: inc    r11
0x1a5db9: add    rax,0x4
0x1a5dbd: cmp    ecx,edx
0x1a5dbf: jl     0x1401a5db0
0x1a5dc1: movsxd rdx,DWORD PTR [rdi+0x830]
0x1a5dc8: cmp    edx,0x95
0x1a5dce: jge    0x1401a5f16
0x1a5dd4: mov    rax,QWORD PTR [r10]
0x1a5dd7: movsx  ecx,WORD PTR [rax]
0x1a5dda: mov    DWORD PTR [rdi+rdx*4+0x134],ecx
0x1a5de1: movsxd rax,DWORD PTR [rdi+0x830]
0x1a5de8: mov    DWORD PTR [rdi+rax*4+0x388],ebx
0x1a5def: movsxd rax,DWORD PTR [rdi+0x830]
0x1a5df6: mov    DWORD PTR [rdi+rax*4+0x5dc],esi
0x1a5dfd: inc    DWORD PTR [rdi+0x830]
0x1a5e03: jmp    0x1401a5f16
0x1a5e08: mov    r8d,DWORD PTR [rdi+0x830]
0x1a5e0f: lea    r9,[r8-0x1]
0x1a5e13: cmp    r9,r11
0x1a5e16: jl     0x1401a5e63
0x1a5e18: lea    rcx,[rdi+0x38c]
0x1a5e1f: lea    rcx,[rcx+r9*4]
0x1a5e23: sub    r9,r11
0x1a5e26: inc    r9
0x1a5e29: nop    DWORD PTR [rax+0x0]
0x1a5e30: cmp    r8d,0x95
0x1a5e37: jge    0x1401a5e56
0x1a5e39: mov    eax,DWORD PTR [rcx-0x258]
0x1a5e3f: mov    DWORD PTR [rcx-0x254],eax
0x1a5e45: mov    eax,DWORD PTR [rcx-0x4]
0x1a5e48: mov    DWORD PTR [rcx],eax
0x1a5e4a: mov    eax,DWORD PTR [rcx+0x250]
0x1a5e50: mov    DWORD PTR [rcx+0x254],eax
0x1a5e56: add    rcx,0xfffffffffffffffc
0x1a5e5a: dec    r8d
0x1a5e5d: sub    r9,0x1
0x1a5e61: jne    0x1401a5e30
0x1a5e63: mov    rax,QWORD PTR [r10]
0x1a5e66: movsx  ecx,WORD PTR [rax]
0x1a5e69: mov    DWORD PTR [rdi+r11*4+0x134],ecx
0x1a5e71: mov    DWORD PTR [rdi+r11*4+0x388],ebx
0x1a5e79: mov    DWORD PTR [rdi+r11*4+0x5dc],esi
0x1a5e81: mov    eax,DWORD PTR [rdi+0x830]
0x1a5e87: cmp    eax,0x95
0x1a5e8c: jge    0x1401a5f16
0x1a5e92: inc    eax
0x1a5e94: mov    DWORD PTR [rdi+0x830],eax
0x1a5e9a: jmp    0x1401a5f16
0x1a5e9c: mov    eax,DWORD PTR [rdx+0x4]
0x1a5e9f: mov    esi,eax
0x1a5ea1: sub    esi,DWORD PTR [rdx+0x10]
0x1a5ea4: mov    ebx,r15d
0x1a5ea7: test   eax,eax
0x1a5ea9: cmovns ebx,eax
0x1a5eac: mov    ecx,r15d
0x1a5eaf: mov    r11,r15
0x1a5eb2: mov    edx,DWORD PTR [rdi+0x1630]
0x1a5eb8: test   edx,edx
0x1a5eba: jle    0x1401a5ed8
0x1a5ebc: lea    rax,[rdi+0x1188]
0x1a5ec3: cmp    DWORD PTR [rax],ebx
0x1a5ec5: jl     0x1401a6257
0x1a5ecb: inc    ecx
0x1a5ecd: inc    r11
0x1a5ed0: add    rax,0x4
0x1a5ed4: cmp    ecx,edx
0x1a5ed6: jl     0x1401a5ec3
0x1a5ed8: movsxd rdx,DWORD PTR [rdi+0x1630]
0x1a5edf: cmp    edx,0x95
0x1a5ee5: jge    0x1401a5f16
0x1a5ee7: mov    rax,QWORD PTR [r10]
0x1a5eea: movsx  ecx,WORD PTR [rax]
0x1a5eed: mov    DWORD PTR [rdi+rdx*4+0xf34],ecx
0x1a5ef4: movsxd rax,DWORD PTR [rdi+0x1630]
0x1a5efb: mov    DWORD PTR [rdi+rax*4+0x1188],ebx
0x1a5f02: movsxd rax,DWORD PTR [rdi+0x1630]
0x1a5f09: mov    DWORD PTR [rdi+rax*4+0x13dc],esi
0x1a5f10: inc    DWORD PTR [rdi+0x1630]
0x1a5f16: add    r10,0x8
0x1a5f1a: mov    QWORD PTR [rsp+0x38],r10
0x1a5f1f: lea    r8,[rsp+0x50]
0x1a5f24: lea    rdx,[rsp+0x31]
0x1a5f29: lea    rcx,[rsp+0x38]
0x1a5f2e: call   0x14006ee20
0x1a5f33: cmp    BYTE PTR [rax],r15b
0x1a5f36: jl     0x1401a5c53
0x1a5f3c: mov    r14,QWORD PTR [rsp+0x40]
0x1a5f41: lea    r12,[rdi+0x1638]
0x1a5f48: mov    rcx,r12
0x1a5f4b: call   0x14006f290
0x1a5f50: lea    rax,[rdi+0x1650]
0x1a5f57: mov    QWORD PTR [rsp+0x60],rax
0x1a5f5c: mov    rcx,rax
0x1a5f5f: call   0x14006f290
0x1a5f64: lea    r13,[rdi+0x1668]
0x1a5f6b: mov    rcx,r13
0x1a5f6e: call   0x1401ba120
0x1a5f73: mov    rcx,r14
0x1a5f76: call   0x1413b3090
0x1a5f7b: mov    QWORD PTR [rsp+0x58],rax
0x1a5f80: test   rax,rax
0x1a5f83: je     0x1401a61d7
0x1a5f89: mov    rbx,QWORD PTR [rax+0xe8]
0x1a5f90: mov    QWORD PTR [rsp+0x38],rbx
0x1a5f95: mov    rcx,QWORD PTR [rax+0xf0]
0x1a5f9c: mov    QWORD PTR [rsp+0x50],rcx
0x1a5fa1: lea    r8,[rsp+0x50]
0x1a5fa6: lea    rdx,[rsp+0x30]
0x1a5fab: lea    rcx,[rsp+0x38]
0x1a5fb0: call   0x14006ee20
0x1a5fb5: cmp    BYTE PTR [rax],r15b
0x1a5fb8: jge    0x1401a6081
0x1a5fbe: mov    rdi,QWORD PTR [rsp+0x60]
0x1a5fc3: mov    rcx,QWORD PTR [rbx]
0x1a5fc6: mov    rax,QWORD PTR [rcx]
0x1a5fc9: call   QWORD PTR [rax]
0x1a5fcb: cmp    ax,0xa
0x1a5fcf: jne    0x1401a6056
0x1a5fd5: mov    r15,QWORD PTR [rbx]
0x1a5fd8: mov    edx,DWORD PTR [r15+0x8]
0x1a5fdc: lea    rcx,[rip+0x222b815]        # 0x1423d17f8
0x1a5fe3: call   0x14007daf0
0x1a5fe8: mov    r14,rax
0x1a5feb: mov    QWORD PTR [rsp+0x60],rax
0x1a5ff0: test   rax,rax
0x1a5ff3: je     0x1401a6056
0x1a5ff5: mov    rdx,QWORD PTR [r15]
0x1a5ff8: mov    rcx,r15
0x1a5ffb: call   QWORD PTR [rdx+0x30]
0x1a5ffe: lea    rdx,[r14+0x1110]
0x1a6005: mov    ecx,eax
0x1a6007: call   0x1400b9dc0
0x1a600c: test   rax,rax
0x1a600f: je     0x1401a6056
0x1a6011: lea    rdx,[r14+0x10c0]
0x1a6018: mov    ecx,DWORD PTR [rax+0xc]
0x1a601b: call   0x1401ba140
0x1a6020: mov    QWORD PTR [rsp+0x38],rax
0x1a6025: test   rax,rax
0x1a6028: je     0x1401a6056
0x1a602a: lea    rdx,[rsp+0x60]
0x1a602f: mov    rcx,r12
0x1a6032: call   0x1400b9980
0x1a6037: mov    BYTE PTR [rsp+0x31],0x0
0x1a603c: lea    rdx,[rsp+0x31]
0x1a6041: mov    rcx,r13
0x1a6044: call   0x14013bd60
0x1a6049: lea    rdx,[rsp+0x38]
0x1a604e: mov    rcx,rdi
0x1a6051: call   0x1400b9980
0x1a6056: add    rbx,0x8
0x1a605a: mov    QWORD PTR [rsp+0x38],rbx
0x1a605f: lea    r8,[rsp+0x50]
0x1a6064: lea    rdx,[rsp+0x30]
0x1a6069: lea    rcx,[rsp+0x38]
0x1a606e: call   0x14006ee20
0x1a6073: cmp    BYTE PTR [rax],0x0
0x1a6076: jl     0x1401a5fc3
0x1a607c: mov    rdi,QWORD PTR [rsp+0x48]
0x1a6081: mov    edx,0x2
0x1a6086: mov    rcx,QWORD PTR [rsp+0x58]
0x1a608b: call   0x140b98d30
0x1a6090: cmp    eax,0xffffffff
0x1a6093: je     0x1401a61d7
0x1a6099: mov    edx,eax
0x1a609b: lea    rcx,[rip+0x2353c16]        # 0x1424f9cb8
0x1a60a2: call   0x140067dc0
0x1a60a7: test   rax,rax
0x1a60aa: je     0x1401a61d7
0x1a60b0: mov    rbx,QWORD PTR [rax+0xe8]
0x1a60b7: mov    QWORD PTR [rsp+0x38],rbx
0x1a60bc: mov    rax,QWORD PTR [rax+0xf0]
0x1a60c3: mov    QWORD PTR [rsp+0x50],rax
0x1a60c8: lea    r8,[rsp+0x50]
0x1a60cd: lea    rdx,[rsp+0x31]
0x1a60d2: lea    rcx,[rsp+0x38]
0x1a60d7: call   0x14006ee20
0x1a60dc: cmp    BYTE PTR [rax],0x0
0x1a60df: jge    0x1401a61d7
0x1a60e5: lea    r12,[rdi+0x1638]
0x1a60ec: lea    r13,[rdi+0x1650]
0x1a60f3: lea    rax,[rdi+0x1668]
0x1a60fa: mov    rdi,rax
0x1a60fd: nop    DWORD PTR [rax]
0x1a6100: mov    rcx,QWORD PTR [rbx]
0x1a6103: mov    rax,QWORD PTR [rcx]
0x1a6106: call   QWORD PTR [rax]
0x1a6108: cmp    ax,0xa
0x1a610c: jne    0x1401a61ac
0x1a6112: mov    r15,QWORD PTR [rbx]
0x1a6115: mov    edx,DWORD PTR [r15+0x8]
0x1a6119: lea    rcx,[rip+0x222b6d8]        # 0x1423d17f8
0x1a6120: call   0x14007daf0
0x1a6125: mov    r14,rax
0x1a6128: mov    QWORD PTR [rsp+0x58],rax
0x1a612d: test   rax,rax
0x1a6130: je     0x1401a61ac
0x1a6132: mov    rdx,QWORD PTR [r15]
0x1a6135: mov    rcx,r15
0x1a6138: call   QWORD PTR [rdx+0x30]
0x1a613b: lea    rdx,[r14+0x1110]
0x1a6142: mov    ecx,eax
0x1a6144: call   0x1400b9dc0
0x1a6149: test   rax,rax
0x1a614c: je     0x1401a61ac
0x1a614e: lea    rdx,[r14+0x10c0]
0x1a6155: mov    ecx,DWORD PTR [rax+0xc]
0x1a6158: call   0x1401ba140
0x1a615d: mov    QWORD PTR [rsp+0x60],rax
0x1a6162: cmp    QWORD PTR [rax+0x168],0x0
0x1a616a: jne    0x1401a6180
0x1a616c: cmp    QWORD PTR [rax+0x1a8],0x0
0x1a6174: jne    0x1401a6180
0x1a6176: cmp    QWORD PTR [rax+0x1e8],0x0
0x1a617e: je     0x1401a61ac
0x1a6180: lea    rdx,[rsp+0x58]
0x1a6185: mov    rcx,r12
0x1a6188: call   0x1400b9980
0x1a618d: lea    rdx,[rsp+0x60]
0x1a6192: mov    rcx,r13
0x1a6195: call   0x1400b9980
0x1a619a: mov    BYTE PTR [rsp+0x30],0x1
0x1a619f: lea    rdx,[rsp+0x30]
0x1a61a4: mov    rcx,rdi
0x1a61a7: call   0x14013bd60
0x1a61ac: add    rbx,0x8
0x1a61b0: mov    QWORD PTR [rsp+0x38],rbx
0x1a61b5: lea    r8,[rsp+0x50]
0x1a61ba: lea    rdx,[rsp+0x31]
0x1a61bf: lea    rcx,[rsp+0x38]
0x1a61c4: call   0x14006ee20
0x1a61c9: cmp    BYTE PTR [rax],0x0
0x1a61cc: jl     0x1401a6100
0x1a61d2: mov    rdi,QWORD PTR [rsp+0x48]
0x1a61d7: xor    r15d,r15d
0x1a61da: mov    DWORD PTR [rdi+0x17f0],r15d
0x1a61e1: mov    r13,QWORD PTR [rsp+0x40]
0x1a61e6: mov    rax,QWORD PTR [r13+0xa98]
0x1a61ed: test   rax,rax
0x1a61f0: je     0x1401a6390
0x1a61f6: mov    r10,QWORD PTR [rax+0x380]
0x1a61fd: mov    QWORD PTR [rsp+0x38],r10
0x1a6202: mov    rax,QWORD PTR [rax+0x388]
0x1a6209: mov    QWORD PTR [rsp+0x40],rax
0x1a620e: lea    r8,[rsp+0x40]
0x1a6213: lea    rdx,[rsp+0x30]
0x1a6218: lea    rcx,[rsp+0x38]
0x1a621d: call   0x14006ee20
0x1a6222: cmp    BYTE PTR [rax],r15b
0x1a6225: jge    0x1401a6390
0x1a622b: nop    DWORD PTR [rax+rax*1+0x0]
0x1a6230: mov    rbx,QWORD PTR [r10]
0x1a6233: mov    eax,DWORD PTR [rbx+0x8]
0x1a6236: cmp    eax,0xfffffc18
0x1a623b: jg     0x1401a636a
0x1a6241: cmp    eax,0xfffe7960
0x1a6246: jg     0x1401a62ef
0x1a624c: mov    r11d,0xfffffffd
0x1a6252: jmp    0x1401a62ff
0x1a6257: mov    r9d,DWORD PTR [rdi+0x1630]
0x1a625e: lea    rdx,[r9-0x1]
0x1a6262: cmp    rdx,r11
0x1a6265: jl     0x1401a62b3
0x1a6267: lea    rcx,[rdi+0x118c]
0x1a626e: lea    rcx,[rcx+rdx*4]
0x1a6272: sub    rdx,r11
0x1a6275: inc    rdx
0x1a6278: nop    DWORD PTR [rax+rax*1+0x0]
0x1a6280: cmp    r9d,0x95
0x1a6287: jge    0x1401a62a6
0x1a6289: mov    eax,DWORD PTR [rcx-0x258]
0x1a628f: mov    DWORD PTR [rcx-0x254],eax
0x1a6295: mov    eax,DWORD PTR [rcx-0x4]
0x1a6298: mov    DWORD PTR [rcx],eax
0x1a629a: mov    eax,DWORD PTR [rcx+0x250]
0x1a62a0: mov    DWORD PTR [rcx+0x254],eax
0x1a62a6: add    rcx,0xfffffffffffffffc
0x1a62aa: dec    r9d
0x1a62ad: sub    rdx,0x1
0x1a62b1: jne    0x1401a6280
0x1a62b3: mov    rax,QWORD PTR [r10]
0x1a62b6: movsx  ecx,WORD PTR [rax]
0x1a62b9: mov    DWORD PTR [rdi+r11*4+0xf34],ecx
0x1a62c1: mov    DWORD PTR [rdi+r11*4+0x1188],ebx
0x1a62c9: mov    DWORD PTR [rdi+r11*4+0x13dc],esi
0x1a62d1: mov    eax,DWORD PTR [rdi+0x1630]
0x1a62d7: cmp    eax,0x95
0x1a62dc: jge    0x1401a5f16
0x1a62e2: inc    eax
0x1a62e4: mov    DWORD PTR [rdi+0x1630],eax
0x1a62ea: jmp    0x1401a5f16
0x1a62ef: mov    r11d,r15d
0x1a62f2: cmp    eax,0xffffd8f0
0x1a62f7: setg   r11b
0x1a62fb: add    r11d,0xfffffffe
0x1a62ff: mov    ecx,r15d
0x1a6302: mov    r9,r15
0x1a6305: mov    edx,DWORD PTR [rdi+0x17f0]
0x1a630b: test   edx,edx
0x1a630d: jle    0x1401a632c
0x1a630f: lea    rax,[rdi+0x1778]
0x1a6316: cmp    DWORD PTR [rax],r11d
0x1a6319: jg     0x1401a63f7
0x1a631f: inc    ecx
0x1a6321: inc    r9
0x1a6324: add    rax,0x4
0x1a6328: cmp    ecx,edx
0x1a632a: jl     0x1401a6316
0x1a632c: movsxd rax,DWORD PTR [rdi+0x17f0]
0x1a6333: cmp    eax,0x1e
0x1a6336: jge    0x1401a636a
0x1a6338: mov    rcx,rax
0x1a633b: mov    eax,DWORD PTR [rbx]
0x1a633d: mov    DWORD PTR [rdi+rcx*4+0x1688],eax
0x1a6344: movsxd rcx,DWORD PTR [rdi+0x17f0]
0x1a634b: mov    eax,DWORD PTR [rbx+0x4]
0x1a634e: mov    DWORD PTR [rdi+rcx*4+0x1700],eax
0x1a6355: movsxd rax,DWORD PTR [rdi+0x17f0]
0x1a635c: mov    DWORD PTR [rdi+rax*4+0x1778],r11d
0x1a6364: inc    DWORD PTR [rdi+0x17f0]
0x1a636a: add    r10,0x8
0x1a636e: mov    QWORD PTR [rsp+0x38],r10
0x1a6373: lea    r8,[rsp+0x40]
0x1a6378: lea    rdx,[rsp+0x30]
0x1a637d: lea    rcx,[rsp+0x38]
0x1a6382: call   0x14006ee20
0x1a6387: cmp    BYTE PTR [rax],r15b
0x1a638a: jl     0x1401a6230
0x1a6390: cmp    QWORD PTR [r13+0x1268],r15
0x1a6397: je     0x1401a6c44
0x1a639d: mov    rax,QWORD PTR [rdi+0x1978]
0x1a63a4: sub    rax,QWORD PTR [rdi+0x1970]
0x1a63ab: test   rax,0xfffffffffffffff8
0x1a63b1: jne    0x1401a6c44
0x1a63b7: mov    ecx,DWORD PTR [r13+0x130]
0x1a63be: add    ecx,DWORD PTR [rip+0x21e1c00]        # 0x142387fc4
0x1a63c4: mov    edx,0x27
0x1a63c9: call   0x14077a6a0
0x1a63ce: lea    rcx,[rbp-0x60]
0x1a63d2: call   0x14006f690
0x1a63d7: nop
0x1a63d8: mov    rax,QWORD PTR [r13+0x1268]
0x1a63df: mov    ecx,DWORD PTR [rax+0x18]
0x1a63e2: test   cl,0x4
0x1a63e5: je     0x1401a6474
0x1a63eb: lea    rdx,[rip+0x145bd76]        # 0x141602168 ; literal="This visitor is ready to leave."
0x1a63f2: jmp    0x1401a6ac0
0x1a63f7: mov    r8d,DWORD PTR [rdi+0x17f0]
0x1a63fe: dec    r8
0x1a6401: cmp    r8,r9
0x1a6404: jl     0x1401a643b
0x1a6406: lea    rdx,[r8+0x5c1]
0x1a640d: lea    rdx,[rdi+rdx*4]
0x1a6411: sub    r8,r9
0x1a6414: inc    r8
0x1a6417: nop    WORD PTR [rax+rax*1+0x0]
0x1a6420: mov    eax,DWORD PTR [rdx-0x7c]
0x1a6423: mov    DWORD PTR [rdx-0x78],eax
0x1a6426: mov    eax,DWORD PTR [rdx-0x4]
0x1a6429: mov    DWORD PTR [rdx],eax
0x1a642b: mov    eax,DWORD PTR [rdx+0x74]
0x1a642e: mov    DWORD PTR [rdx+0x78],eax
0x1a6431: lea    rdx,[rdx-0x4]
0x1a6435: sub    r8,0x1
0x1a6439: jne    0x1401a6420
0x1a643b: mov    eax,DWORD PTR [rbx]
0x1a643d: mov    DWORD PTR [rdi+r9*4+0x1688],eax
0x1a6445: mov    eax,DWORD PTR [rbx+0x4]
0x1a6448: mov    DWORD PTR [rdi+r9*4+0x1700],eax
0x1a6450: mov    DWORD PTR [rdi+r9*4+0x1778],r11d
0x1a6458: mov    eax,DWORD PTR [rdi+0x17f0]
0x1a645e: cmp    eax,0x1e
0x1a6461: jge    0x1401a636a
0x1a6467: inc    eax
0x1a6469: mov    DWORD PTR [rdi+0x17f0],eax
0x1a646f: jmp    0x1401a636a
0x1a6474: test   cl,0x1
0x1a6477: je     0x1401a6ab9
0x1a647d: lea    rdx,[rip+0x145bccc]        # 0x141602150 ; literal="This visitor has come "
0x1a6484: lea    rcx,[rbp-0x60]
0x1a6488: call   0x14006f580
0x1a648d: mov    rbx,QWORD PTR [r13+0x1268]
0x1a6494: mov    rax,QWORD PTR [rbx+0x8]
0x1a6498: mov    rbx,QWORD PTR [rbx]
0x1a649b: mov    rsi,rax
0x1a649e: sub    rsi,rbx
0x1a64a1: sar    rsi,0x3
0x1a64a5: mov    QWORD PTR [rsp+0x38],rbx
0x1a64aa: mov    QWORD PTR [rsp+0x40],rax
0x1a64af: lea    r8,[rsp+0x40]
0x1a64b4: lea    rdx,[rsp+0x30]
0x1a64b9: lea    rcx,[rsp+0x38]
0x1a64be: call   0x14006ee20
0x1a64c3: cmp    BYTE PTR [rax],0x0
0x1a64c6: jge    0x1401a662b
0x1a64cc: lea    r15,[rip+0xffffffffffe59b2d]        # 0x140000000
0x1a64d3: mov    r14,QWORD PTR [rbx]
0x1a64d6: movsxd rax,DWORD PTR [r14]
0x1a64d9: cmp    eax,0xa
0x1a64dc: ja     0x1401a6555
0x1a64de: mov    ecx,DWORD PTR [r15+rax*4+0x1a80ac]
0x1a64e6: add    rcx,r15
0x1a64e9: jmp    rcx
0x1a64eb: lea    rdx,[rip+0x145bc56]        # 0x141602148 ; literal="to pray"
0x1a64f2: jmp    0x1401a654c
0x1a64f4: lea    rdx,[rip+0x145bc3d]        # 0x141602138 ; literal="to study"
0x1a64fb: jmp    0x1401a654c
0x1a64fd: lea    rdx,[rip+0x145bc24]        # 0x141602128 ; literal="to relax"
0x1a6504: jmp    0x1401a654c
0x1a6506: lea    rdx,[rip+0x145bc0b]        # 0x141602118 ; literal="to perform"
0x1a650d: jmp    0x1401a654c
0x1a650f: lea    rdx,[rip+0x145bbf2]        # 0x141602108 ; literal="to slay beasts"
0x1a6516: jmp    0x1401a654c
0x1a6518: lea    rdx,[rip+0x145bbc9]        # 0x1416020e8 ; literal="seeking work as a performer"
0x1a651f: jmp    0x1401a654c
0x1a6521: lea    rdx,[rip+0x145bba0]        # 0x1416020c8 ; literal="seeking work as a mercenary"
0x1a6528: jmp    0x1401a654c
0x1a652a: lea    rdx,[rip+0x145bb77]        # 0x1416020a8 ; literal="seeking work as a scholar"
0x1a6531: jmp    0x1401a654c
0x1a6533: lea    rdx,[rip+0x145bb5e]        # 0x141602098 ; literal="for diplomacy"
0x1a653a: jmp    0x1401a654c
0x1a653c: lea    rdx,[rip+0x145bb3d]        # 0x141602080 ; literal="seeking sanctuary"
0x1a6543: jmp    0x1401a654c
0x1a6545: lea    rdx,[rip+0x145bb1c]        # 0x141602068 ; literal="asking questions"
0x1a654c: lea    rcx,[rbp-0x60]
0x1a6550: call   0x14006f560
0x1a6555: mov    edx,DWORD PTR [r14+0x4]
0x1a6559: cmp    edx,0xffffffff
0x1a655c: je     0x1401a65dd
0x1a655e: mov    r14d,DWORD PTR [r14+0x8]
0x1a6562: cmp    r14d,0xffffffff
0x1a6566: je     0x1401a65dd
0x1a6568: mov    rcx,QWORD PTR [rip+0x23455e9]        # 0x1424ebb58
0x1a656f: call   0x14007db20
0x1a6574: test   rax,rax
0x1a6577: je     0x1401a65dd
0x1a6579: mov    edx,r14d
0x1a657c: mov    rcx,rax
0x1a657f: call   0x140067e80
0x1a6584: test   rax,rax
0x1a6587: je     0x1401a65dd
0x1a6589: mov    rdx,QWORD PTR [rax]
0x1a658c: mov    rcx,rax
0x1a658f: call   QWORD PTR [rdx+0x10]
0x1a6592: mov    r14,rax
0x1a6595: test   rax,rax
0x1a6598: je     0x1401a65dd
0x1a659a: lea    rdx,[rip+0x145babb]        # 0x14160205c ; literal=" at "
0x1a65a1: lea    rcx,[rbp-0x60]
0x1a65a5: call   0x14006f560
0x1a65aa: lea    rcx,[rbp+0x0]
0x1a65ae: call   0x14006f690
0x1a65b3: nop
0x1a65b4: xor    r9d,r9d
0x1a65b7: mov    r8b,0x1
0x1a65ba: lea    rdx,[rbp+0x0]
0x1a65be: mov    rcx,r14
0x1a65c1: call   0x140a946e0
0x1a65c6: lea    rdx,[rbp+0x0]
0x1a65ca: lea    rcx,[rbp-0x60]
0x1a65ce: call   0x1400b9d10
0x1a65d3: nop
0x1a65d4: lea    rcx,[rbp+0x0]
0x1a65d8: call   0x14006f850
0x1a65dd: cmp    esi,0x3
0x1a65e0: jl     0x1401a65eb
0x1a65e2: lea    rdx,[rip+0x1442aef]        # 0x1415e90d8 ; literal=", "
0x1a65e9: jmp    0x1401a65f7
0x1a65eb: cmp    esi,0x2
0x1a65ee: jne    0x1401a6600
0x1a65f0: lea    rdx,[rip+0x1442b19]        # 0x1415e9110 ; literal=" and "
0x1a65f7: lea    rcx,[rbp-0x60]
0x1a65fb: call   0x14006f560
0x1a6600: add    rbx,0x8
0x1a6604: mov    QWORD PTR [rsp+0x38],rbx
0x1a6609: dec    esi
0x1a660b: lea    r8,[rsp+0x40]
0x1a6610: lea    rdx,[rsp+0x30]
0x1a6615: lea    rcx,[rsp+0x38]
0x1a661a: call   0x14006ee20
0x1a661f: cmp    BYTE PTR [rax],0x0
0x1a6622: jl     0x1401a64d3
0x1a6628: xor    r15d,r15d
0x1a662b: lea    rdx,[rip+0x1441f82]        # 0x1415e85b4 ; literal="."
0x1a6632: lea    rcx,[rbp-0x60]
0x1a6636: call   0x14006f560
0x1a663b: mov    rax,QWORD PTR [r13+0x1268]
0x1a6642: cmp    DWORD PTR [rax+0x2c],0xffffffff
0x1a6646: je     0x1401a6ac9
0x1a664c: lea    rcx,[rbp-0x40]
0x1a6650: call   0x14006f690
0x1a6655: nop
0x1a6656: mov    rax,QWORD PTR [r13+0x1268]
0x1a665d: mov    ebx,DWORD PTR [rax+0x30]
0x1a6660: cmp    ebx,0xffffffff
0x1a6663: je     0x1401a66ab
0x1a6665: mov    edx,DWORD PTR [rip+0x21ed009]        # 0x142393674
0x1a666b: mov    rcx,QWORD PTR [rip+0x23454e6]        # 0x1424ebb58
0x1a6672: call   0x14007db20
0x1a6677: test   rax,rax
0x1a667a: je     0x1401a66ab
0x1a667c: mov    edx,ebx
0x1a667e: mov    rcx,rax
0x1a6681: call   0x140067e80
0x1a6686: test   rax,rax
0x1a6689: je     0x1401a66ab
0x1a668b: mov    rdx,QWORD PTR [rax]
0x1a668e: mov    rcx,rax
0x1a6691: call   QWORD PTR [rdx+0x10]
0x1a6694: test   rax,rax
0x1a6697: je     0x1401a66ab
0x1a6699: xor    r9d,r9d
0x1a669c: mov    r8b,0x1
0x1a669f: lea    rdx,[rbp-0x40]
0x1a66a3: mov    rcx,rax
0x1a66a6: call   0x140a946e0
0x1a66ab: lea    rdx,[rip+0x1456936]        # 0x1415fcfe8 ; literal="  "
0x1a66b2: lea    rcx,[rbp-0x60]
0x1a66b6: call   0x14006f560
0x1a66bb: lea    rcx,[rbp+0x0]
0x1a66bf: call   0x14006f690
0x1a66c4: nop
0x1a66c5: mov    r8b,0x1
0x1a66c8: lea    rdx,[rbp+0x0]
0x1a66cc: movzx  ecx,BYTE PTR [r13+0x12e]
0x1a66d4: call   0x140aa4730
0x1a66d9: lea    rdx,[rbp+0x0]
0x1a66dd: lea    rcx,[rbp-0x60]
0x1a66e1: call   0x1400b9d10
0x1a66e6: lea    rdx,[rip+0x144204f]        # 0x1415e873c ; literal=" "
0x1a66ed: lea    rcx,[rbp-0x60]
0x1a66f1: call   0x14006f560
0x1a66f6: mov    rax,QWORD PTR [r13+0x1268]
0x1a66fd: mov    ecx,DWORD PTR [rax+0x2c]
0x1a6700: add    ecx,0xffffffd7
0x1a6703: cmp    ecx,0x22
0x1a6706: ja     0x1401a6aa4
0x1a670c: movsxd rax,ecx
0x1a670f: lea    rdx,[rip+0xffffffffffe598ea]        # 0x140000000
0x1a6716: movzx  eax,BYTE PTR [rdx+rax*1+0x1a8114]
0x1a671e: mov    ecx,DWORD PTR [rdx+rax*4+0x1a80d8]
0x1a6725: add    rcx,rdx
0x1a6728: jmp    rcx
0x1a672a: lea    rdx,[rip+0x145b8f7]        # 0x141602028 ; literal="heard this was a good place to search for monsters."
0x1a6731: jmp    0x1401a6a9a
0x1a6736: lea    rdx,[rip+0x145b8b3]        # 0x141601ff0 ; literal="heard this was the place for those seeking danger."
0x1a673d: jmp    0x1401a6a9a
0x1a6742: lea    rdx,[rip+0x145bc4b]        # 0x141602394 ; literal="heard "
0x1a6749: lea    rcx,[rbp-0x60]
0x1a674d: call   0x14006f560
0x1a6752: lea    rcx,[rbp-0x60]
0x1a6756: cmp    QWORD PTR [rbp-0x30],0x0
0x1a675b: jne    0x1401a6775
0x1a675d: lea    rdx,[rip+0x145bc28]        # 0x14160238c ; literal="this"
0x1a6764: call   0x14006f560
0x1a6769: lea    rdx,[rip+0x145bc00]        # 0x141602370 ; literal=" was the place for prayer."
0x1a6770: jmp    0x1401a6a9a
0x1a6775: lea    rdx,[rbp-0x40]
0x1a6779: call   0x1400b9d10
0x1a677e: lea    rdx,[rip+0x145bbeb]        # 0x141602370 ; literal=" was the place for prayer."
0x1a6785: jmp    0x1401a6a9a
0x1a678a: lea    rcx,[rbp-0x60]
0x1a678e: cmp    QWORD PTR [rbp-0x30],0x0
0x1a6793: jne    0x1401a67a1
0x1a6795: lea    rdx,[rip+0x145bbac]        # 0x141602348 ; literal="went on this journey out of curiosity."
0x1a679c: jmp    0x1401a6a9e
0x1a67a1: lea    rdx,[rip+0x145bb88]        # 0x141602330 ; literal="was curious about "
0x1a67a8: call   0x14006f560
0x1a67ad: lea    rdx,[rbp-0x40]
0x1a67b1: lea    rcx,[rbp-0x60]
0x1a67b5: call   0x1400b9d10
0x1a67ba: jmp    0x1401a6a93
0x1a67bf: lea    rdx,[rip+0x145bbce]        # 0x141602394 ; literal="heard "
0x1a67c6: lea    rcx,[rbp-0x60]
0x1a67ca: call   0x14006f560
0x1a67cf: lea    rcx,[rbp-0x60]
0x1a67d3: cmp    QWORD PTR [rbp-0x30],0x0
0x1a67d8: jne    0x1401a67f2
0x1a67da: lea    rdx,[rip+0x145bbab]        # 0x14160238c ; literal="this"
0x1a67e1: call   0x14006f560
0x1a67e6: lea    rdx,[rip+0x145bb1b]        # 0x141602308 ; literal=" was the place for a good drink."
0x1a67ed: jmp    0x1401a6a9a
0x1a67f2: lea    rdx,[rbp-0x40]
0x1a67f6: call   0x1400b9d10
0x1a67fb: lea    rdx,[rip+0x145bb06]        # 0x141602308 ; literal=" was the place for a good drink."
0x1a6802: jmp    0x1401a6a9a
0x1a6807: lea    rdx,[rip+0x145bb86]        # 0x141602394 ; literal="heard "
0x1a680e: lea    rcx,[rbp-0x60]
0x1a6812: call   0x14006f560
0x1a6817: lea    rcx,[rbp-0x60]
0x1a681b: cmp    QWORD PTR [rbp-0x30],0x0
0x1a6820: jne    0x1401a683a
0x1a6822: lea    rdx,[rip+0x145bb63]        # 0x14160238c ; literal="this"
0x1a6829: call   0x14006f560
0x1a682e: lea    rdx,[rip+0x145baa3]        # 0x1416022d8 ; literal=" was the place to admire fine architecture."
0x1a6835: jmp    0x1401a6a9a
0x1a683a: lea    rdx,[rbp-0x40]
0x1a683e: call   0x1400b9d10
0x1a6843: lea    rdx,[rip+0x145ba8e]        # 0x1416022d8 ; literal=" was the place to admire fine architecture."
0x1a684a: jmp    0x1401a6a9a
0x1a684f: lea    rdx,[rip+0x145bb3e]        # 0x141602394 ; literal="heard "
0x1a6856: lea    rcx,[rbp-0x60]
0x1a685a: call   0x14006f560
0x1a685f: lea    rcx,[rbp-0x60]
0x1a6863: cmp    QWORD PTR [rbp-0x30],0x0
0x1a6868: jne    0x1401a6882
0x1a686a: lea    rdx,[rip+0x145bb1b]        # 0x14160238c ; literal="this"
0x1a6871: call   0x14006f560
0x1a6876: lea    rdx,[rip+0x145ba33]        # 0x1416022b0 ; literal=" was the place to enjoy oneself."
0x1a687d: jmp    0x1401a6a9a
0x1a6882: lea    rdx,[rbp-0x40]
0x1a6886: call   0x1400b9d10
0x1a688b: lea    rdx,[rip+0x145ba1e]        # 0x1416022b0 ; literal=" was the place to enjoy oneself."
0x1a6892: jmp    0x1401a6a9a
0x1a6897: lea    rdx,[rip+0x145baf6]        # 0x141602394 ; literal="heard "
0x1a689e: lea    rcx,[rbp-0x60]
0x1a68a2: call   0x14006f560
0x1a68a7: lea    rcx,[rbp-0x60]
0x1a68ab: cmp    QWORD PTR [rbp-0x30],0x0
0x1a68b0: jne    0x1401a68ca
0x1a68b2: lea    rdx,[rip+0x145bad3]        # 0x14160238c ; literal="this"
0x1a68b9: call   0x14006f560
0x1a68be: lea    rdx,[rip+0x145b9c3]        # 0x141602288 ; literal=" was the place to entertain people."
0x1a68c5: jmp    0x1401a6a9a
0x1a68ca: lea    rdx,[rbp-0x40]
0x1a68ce: call   0x1400b9d10
0x1a68d3: lea    rdx,[rip+0x145b9ae]        # 0x141602288 ; literal=" was the place to entertain people."
0x1a68da: jmp    0x1401a6a9a
0x1a68df: lea    rdx,[rip+0x145baae]        # 0x141602394 ; literal="heard "
0x1a68e6: lea    rcx,[rbp-0x60]
0x1a68ea: call   0x14006f560
0x1a68ef: lea    rcx,[rbp-0x60]
0x1a68f3: cmp    QWORD PTR [rbp-0x30],0x0
0x1a68f8: jne    0x1401a6912
0x1a68fa: lea    rdx,[rip+0x145ba8b]        # 0x14160238c ; literal="this"
0x1a6901: call   0x14006f560
0x1a6906: lea    rdx,[rip+0x145b953]        # 0x141602260 ; literal=" was the place to perform research."
0x1a690d: jmp    0x1401a6a9a
0x1a6912: lea    rdx,[rbp-0x40]
0x1a6916: call   0x1400b9d10
0x1a691b: lea    rdx,[rip+0x145b93e]        # 0x141602260 ; literal=" was the place to perform research."
0x1a6922: jmp    0x1401a6a9a
0x1a6927: lea    rdx,[rip+0x145ba66]        # 0x141602394 ; literal="heard "
0x1a692e: lea    rcx,[rbp-0x60]
0x1a6932: call   0x14006f560
0x1a6937: lea    rcx,[rbp-0x60]
0x1a693b: cmp    QWORD PTR [rbp-0x30],0x0
0x1a6940: jne    0x1401a695a
0x1a6942: lea    rdx,[rip+0x145ba43]        # 0x14160238c ; literal="this"
0x1a6949: call   0x14006f560
0x1a694e: lea    rdx,[rip+0x145b8db]        # 0x141602230 ; literal=" was the place for long-term scholarship."
0x1a6955: jmp    0x1401a6a9a
0x1a695a: lea    rdx,[rbp-0x40]
0x1a695e: call   0x1400b9d10
0x1a6963: lea    rdx,[rip+0x145b8c6]        # 0x141602230 ; literal=" was the place for long-term scholarship."
0x1a696a: jmp    0x1401a6a9a
0x1a696f: lea    rdx,[rip+0x145ba1e]        # 0x141602394 ; literal="heard "
0x1a6976: lea    rcx,[rbp-0x60]
0x1a697a: call   0x14006f560
0x1a697f: lea    rcx,[rbp-0x60]
0x1a6983: cmp    QWORD PTR [rbp-0x30],0x0
0x1a6988: jne    0x1401a69a2
0x1a698a: lea    rdx,[rip+0x145b9fb]        # 0x14160238c ; literal="this"
0x1a6991: call   0x14006f560
0x1a6996: lea    rdx,[rip+0x145b863]        # 0x141602200 ; literal=" would make a good base for a mercenary."
0x1a699d: jmp    0x1401a6a9a
0x1a69a2: lea    rdx,[rbp-0x40]
0x1a69a6: call   0x1400b9d10
0x1a69ab: lea    rdx,[rip+0x145b84e]        # 0x141602200 ; literal=" would make a good base for a mercenary."
0x1a69b2: jmp    0x1401a6a9a
0x1a69b7: lea    rdx,[rip+0x145b9d6]        # 0x141602394 ; literal="heard "
0x1a69be: lea    rcx,[rbp-0x60]
0x1a69c2: call   0x14006f560
0x1a69c7: lea    rcx,[rbp-0x60]
0x1a69cb: cmp    QWORD PTR [rbp-0x30],0x0
0x1a69d0: jne    0x1401a69ea
0x1a69d2: lea    rdx,[rip+0x145b9b3]        # 0x14160238c ; literal="this"
0x1a69d9: call   0x14006f560
0x1a69de: lea    rdx,[rip+0x145b7eb]        # 0x1416021d0 ; literal=" was the place to look for long-term work."
0x1a69e5: jmp    0x1401a6a9a
0x1a69ea: lea    rdx,[rbp-0x40]
0x1a69ee: call   0x1400b9d10
0x1a69f3: lea    rdx,[rip+0x145b7d6]        # 0x1416021d0 ; literal=" was the place to look for long-term work."
0x1a69fa: jmp    0x1401a6a9a
0x1a69ff: lea    rdx,[rip+0x145b7ba]        # 0x1416021c0 ; literal="believes "
0x1a6a06: lea    rcx,[rbp-0x60]
0x1a6a0a: call   0x14006f560
0x1a6a0f: lea    rcx,[rbp-0x60]
0x1a6a13: cmp    QWORD PTR [rbp-0x30],0x0
0x1a6a18: jne    0x1401a6a2f
0x1a6a1a: lea    rdx,[rip+0x145b96b]        # 0x14160238c ; literal="this"
0x1a6a21: call   0x14006f560
0x1a6a26: lea    rdx,[rip+0x145b773]        # 0x1416021a0 ; literal=" would be a safe place to stay."
0x1a6a2d: jmp    0x1401a6a9a
0x1a6a2f: lea    rdx,[rbp-0x40]
0x1a6a33: call   0x1400b9d10
0x1a6a38: lea    rdx,[rip+0x145b761]        # 0x1416021a0 ; literal=" would be a safe place to stay."
0x1a6a3f: jmp    0x1401a6a9a
0x1a6a41: lea    rdx,[rip+0x145b740]        # 0x141602188 ; literal="is seeking information"
0x1a6a48: lea    rcx,[rbp-0x60]
0x1a6a4c: call   0x14006f560
0x1a6a51: mov    rax,QWORD PTR [r13+0x1208]
0x1a6a58: test   rax,rax
0x1a6a5b: je     0x1401a6a93
0x1a6a5d: cmp    DWORD PTR [rax+0x138],0x11
0x1a6a64: jne    0x1401a6a93
0x1a6a66: lea    rdx,[rip+0x145ba2b]        # 0x141602498 ; literal=" about the location of "
0x1a6a6d: lea    rcx,[rbp-0x60]
0x1a6a71: call   0x14006f560
0x1a6a76: mov    rax,QWORD PTR [r13+0x1208]
0x1a6a7d: mov    r8,QWORD PTR [rax+0x130]
0x1a6a84: xor    r9d,r9d
0x1a6a87: mov    r8d,DWORD PTR [r8]
0x1a6a8a: lea    rdx,[rbp-0x60]
0x1a6a8e: call   0x140b94400
0x1a6a93: lea    rdx,[rip+0x1441b1a]        # 0x1415e85b4 ; literal="."
0x1a6a9a: lea    rcx,[rbp-0x60]
0x1a6a9e: call   0x14006f560
0x1a6aa3: nop
0x1a6aa4: lea    rcx,[rbp+0x0]
0x1a6aa8: call   0x14006f850
0x1a6aad: nop
0x1a6aae: lea    rcx,[rbp-0x40]
0x1a6ab2: call   0x14006f850
0x1a6ab7: jmp    0x1401a6ac9
0x1a6ab9: lea    rdx,[rip+0x145b990]        # 0x141602450 ; literal="You can learn more about this visitor after they chat with a local."
0x1a6ac0: lea    rcx,[rbp-0x60]
0x1a6ac4: call   0x14006f580
0x1a6ac9: lea    rcx,[rdi+0x1970]
0x1a6ad0: mov    r8d,0x1c
0x1a6ad6: lea    rdx,[rbp-0x60]
0x1a6ada: call   0x1408e7310
0x1a6adf: mov    rax,QWORD PTR [r13+0x1268]
0x1a6ae6: test   BYTE PTR [rax+0x18],0x1
0x1a6aea: je     0x1401a6c35
0x1a6af0: mov    eax,0x83
0x1a6af5: cmp    WORD PTR [r13+0xa0],ax
0x1a6afd: jne    0x1401a6c35
0x1a6b03: mov    rcx,r13
0x1a6b06: call   0x1413f9980
0x1a6b0b: cmp    eax,0xffffffff
0x1a6b0e: je     0x1401a6c35
0x1a6b14: mov    edx,eax
0x1a6b16: lea    rcx,[rip+0x23414cb]        # 0x1424e7fe8
0x1a6b1d: call   0x140072570
0x1a6b22: mov    rbx,rax
0x1a6b25: test   rax,rax
0x1a6b28: je     0x1401a6c35
0x1a6b2e: mov    rcx,QWORD PTR [rax+0x10]
0x1a6b32: sub    rcx,QWORD PTR [rax+0x8]
0x1a6b36: sar    rcx,0x3
0x1a6b3a: test   rcx,rcx
0x1a6b3d: je     0x1401a6c35
0x1a6b43: call   0x140071f30
0x1a6b48: movsxd rcx,eax
0x1a6b4b: lea    r14,[rcx*8+0x0]
0x1a6b53: mov    rax,QWORD PTR [rbx+0x8]
0x1a6b57: mov    rcx,QWORD PTR [r14+rax*1]
0x1a6b5b: mov    rax,QWORD PTR [rcx+0x8]
0x1a6b5f: sub    rax,QWORD PTR [rcx]
0x1a6b62: sar    rax,0x3
0x1a6b66: test   rax,rax
0x1a6b69: je     0x1401a6c35
0x1a6b6f: mov    ecx,eax
0x1a6b71: call   0x140071f30
0x1a6b76: movsxd rsi,eax
0x1a6b79: cmp    esi,0xffffffff
0x1a6b7c: je     0x1401a6c35
0x1a6b82: lea    rdx,[rip+0x1442b8f]        # 0x1415e9718 ; literal="\""
0x1a6b89: lea    rcx,[rbp+0x20]
0x1a6b8d: call   0x140068150
0x1a6b92: nop
0x1a6b93: mov    DWORD PTR [rsp+0x50],0xffffffff
0x1a6b9b: mov    QWORD PTR [rsp+0x40],0xffffffffffffffff
0x1a6ba4: mov    ecx,DWORD PTR [r13+0xc30]
0x1a6bab: mov    DWORD PTR [rsp+0x54],ecx
0x1a6baf: lea    rcx,[rbp+0x0]
0x1a6bb3: call   0x14006f690
0x1a6bb8: nop
0x1a6bb9: mov    rax,QWORD PTR [rbx+0x8]
0x1a6bbd: mov    rcx,QWORD PTR [r14+rax*1]
0x1a6bc1: mov    rdx,QWORD PTR [rcx]
0x1a6bc4: lea    r9,[rsp+0x40]
0x1a6bc9: lea    r8,[rsp+0x50]
0x1a6bce: mov    rdx,QWORD PTR [rdx+rsi*8]
0x1a6bd2: lea    rcx,[rbp+0x0]
0x1a6bd6: call   0x140659090
0x1a6bdb: lea    rdx,[rbp+0x0]
0x1a6bdf: lea    rcx,[rbp+0x20]
0x1a6be3: call   0x1400b9d10
0x1a6be8: lea    rdx,[rip+0x1442b29]        # 0x1415e9718 ; literal="\""
0x1a6bef: lea    rcx,[rbp+0x20]
0x1a6bf3: call   0x14006f560
0x1a6bf8: lea    rcx,[rdi+0x1970]
0x1a6bff: lea    rdx,[rip+0x14448f2]        # 0x1415eb4f8
0x1a6c06: call   0x1400bb8e0
0x1a6c0b: lea    rcx,[rdi+0x1970]
0x1a6c12: mov    r8d,0x1c
0x1a6c18: lea    rdx,[rbp+0x20]
0x1a6c1c: call   0x1408e7310
0x1a6c21: nop
0x1a6c22: lea    rcx,[rbp+0x0]
0x1a6c26: call   0x14006f850
0x1a6c2b: nop
0x1a6c2c: lea    rcx,[rbp+0x20]
0x1a6c30: call   0x14006f850
0x1a6c35: call   0x140eb6c50
0x1a6c3a: nop
0x1a6c3b: lea    rcx,[rbp-0x60]
0x1a6c3f: call   0x14006f850
0x1a6c44: mov    rcx,r13
0x1a6c47: call   0x140073760
0x1a6c4c: test   al,al
0x1a6c4e: je     0x1401a7066
0x1a6c54: call   0x140073710
0x1a6c59: test   al,al
0x1a6c5b: je     0x1401a7066
0x1a6c61: cmp    QWORD PTR [rdi+0x1cd0],0x0
0x1a6c69: jne    0x1401a7066
0x1a6c6f: call   0x14138ed20
0x1a6c74: test   al,al
0x1a6c76: je     0x1401a7066
0x1a6c7c: cmp    QWORD PTR [r13+0xa98],0x0
0x1a6c84: je     0x1401a7066
0x1a6c8a: mov    DWORD PTR [rdi+0x1cf8],r15d
0x1a6c91: movzx  ecx,WORD PTR [r13+0x360]
0x1a6c99: cmp    cx,0x5
0x1a6c9d: je     0x1401a7066
0x1a6ca3: lea    eax,[rcx-0x6]
0x1a6ca6: mov    edx,0xfffc
0x1a6cab: test   dx,ax
0x1a6cae: jne    0x1401a6cba
0x1a6cb0: cmp    cx,0x8
0x1a6cb4: jne    0x1401a7066
0x1a6cba: cmp    WORD PTR [r13+0x814],0xffff
0x1a6cc3: jne    0x1401a7066
0x1a6cc9: cmp    WORD PTR [r13+0x800],0x0
0x1a6cd2: jg     0x1401a7066
0x1a6cd8: cmp    cx,0x8
0x1a6cdc: jne    0x1401a6d8b
0x1a6ce2: lea    rcx,[rbp+0x20]
0x1a6ce6: call   0x14006f690
0x1a6ceb: nop
0x1a6cec: xor    r8d,r8d
0x1a6cef: lea    rdx,[rbp+0x20]
0x1a6cf3: mov    rcx,r13
0x1a6cf6: call   0x140666470
0x1a6cfb: mov    r9d,0x77
0x1a6d01: movzx  r8d,WORD PTR [r13+0x12c]
0x1a6d09: movzx  edx,WORD PTR [r13+0xa4]
0x1a6d11: lea    rcx,[rip+0x2345d30]        # 0x1424eca48
0x1a6d18: call   0x140072850
0x1a6d1d: test   al,al
0x1a6d1f: je     0x1401a6d4f
0x1a6d21: lea    rdx,[rbp+0x20]
0x1a6d25: lea    rcx,[rbp+0x0]
0x1a6d29: call   0x14006f5d0
0x1a6d2e: nop
0x1a6d2f: lea    rcx,[rbp+0x0]
0x1a6d33: call   0x14067b6c0
0x1a6d38: lea    rdx,[rbp+0x0]
0x1a6d3c: lea    rcx,[rbp+0x20]
0x1a6d40: call   0x14006f5a0
0x1a6d45: nop
0x1a6d46: lea    rcx,[rbp+0x0]
0x1a6d4a: call   0x14006f850
0x1a6d4f: lea    rdx,[rip+0x14429c2]        # 0x1415e9718 ; literal="\""
0x1a6d56: lea    rcx,[rdi+0x1cc0]
0x1a6d5d: call   0x14006f560
0x1a6d62: lea    rdx,[rbp+0x20]
0x1a6d66: lea    rcx,[rdi+0x1cc0]
0x1a6d6d: call   0x1400b9d10
0x1a6d72: lea    rdx,[rip+0x144299f]        # 0x1415e9718 ; literal="\""
0x1a6d79: lea    rcx,[rdi+0x1cc0]
0x1a6d80: call   0x14006f560
0x1a6d85: nop
0x1a6d86: jmp    0x1401a705d
0x1a6d8b: mov    rcx,QWORD PTR [r13+0xa98]
0x1a6d92: mov    rbx,QWORD PTR [rcx+0x278]
0x1a6d99: mov    rax,QWORD PTR [rcx+0x280]
0x1a6da0: sub    rax,rbx
0x1a6da3: sar    rax,0x3
0x1a6da7: test   rax,rax
0x1a6daa: je     0x1401a6fb9
0x1a6db0: mov    rsi,r15
0x1a6db3: mov    r15d,0xffffffff
0x1a6db9: mov    QWORD PTR [rsp+0x38],rbx
0x1a6dbe: mov    rax,QWORD PTR [rcx+0x280]
0x1a6dc5: mov    QWORD PTR [rsp+0x40],rax
0x1a6dca: lea    r8,[rsp+0x40]
0x1a6dcf: lea    rdx,[rsp+0x30]
0x1a6dd4: lea    rcx,[rsp+0x38]
0x1a6dd9: call   0x14006ee20
0x1a6dde: cmp    BYTE PTR [rax],0x0
0x1a6de1: jge    0x1401a6fb9
0x1a6de7: mov    r14d,0x64
0x1a6ded: mov    r12d,0x186a0
0x1a6df3: lea    rdi,[rip+0xffffffffffe59206]        # 0x140000000
0x1a6dfa: nop    WORD PTR [rax+rax*1+0x0]
0x1a6e00: mov    rax,QWORD PTR [rbx]
0x1a6e03: mov    ecx,DWORD PTR [rax+0xc]
0x1a6e06: cmp    ecx,0xffffffff
0x1a6e09: je     0x1401a6eac
0x1a6e0f: cmp    ecx,0x6
0x1a6e12: jne    0x1401a6e26
0x1a6e14: mov    ecx,0xa
0x1a6e19: call   0x140071f30
0x1a6e1e: test   eax,eax
0x1a6e20: jne    0x1401a6eac
0x1a6e26: mov    rdx,QWORD PTR [rbx]
0x1a6e29: mov    eax,DWORD PTR [rdx]
0x1a6e2b: cmp    eax,0xa5
0x1a6e30: je     0x1401a6eac
0x1a6e32: cmp    eax,0xa6
0x1a6e37: je     0x1401a6eac
0x1a6e39: cmp    eax,0xffffffff
0x1a6e3c: je     0x1401a6eac
0x1a6e3e: mov    eax,DWORD PTR [rdx+0x18]
0x1a6e41: test   al,0x70
0x1a6e43: jne    0x1401a6eac
0x1a6e45: cmp    DWORD PTR [rdx+0x4],0x0
0x1a6e49: jg     0x1401a6e51
0x1a6e4b: cmp    DWORD PTR [rdx+0x8],0x0
0x1a6e4f: jle    0x1401a6eac
0x1a6e51: mov    edx,DWORD PTR [rdx+0x8]
0x1a6e54: cmp    edx,r14d
0x1a6e57: jle    0x1401a6e5e
0x1a6e59: mov    edx,r14d
0x1a6e5c: jmp    0x1401a6e66
0x1a6e5e: jne    0x1401a6e66
0x1a6e60: test   al,0x1
0x1a6e62: cmovne edx,r12d
0x1a6e66: mov    rax,QWORD PTR [rbx]
0x1a6e69: movsxd rcx,DWORD PTR [rax]
0x1a6e6c: cmp    ecx,0xa8
0x1a6e72: ja     0x1401a6ea1
0x1a6e74: movzx  eax,BYTE PTR [rdi+rcx*1+0x1a814c]
0x1a6e7c: mov    ecx,DWORD PTR [rdi+rax*4+0x1a8138]
0x1a6e83: add    rcx,rdi
0x1a6e86: jmp    rcx
0x1a6e88: lea    edx,[rdx*8+0x0]
0x1a6e8f: jmp    0x1401a6ea1
0x1a6e91: lea    edx,[rdx*4+0x0]
0x1a6e98: jmp    0x1401a6ea1
0x1a6e9a: add    edx,edx
0x1a6e9c: jmp    0x1401a6ea1
0x1a6e9e: shl    edx,0x4
0x1a6ea1: cmp    edx,r15d
0x1a6ea4: jle    0x1401a6eac
0x1a6ea6: mov    r15d,edx
0x1a6ea9: mov    rsi,QWORD PTR [rbx]
0x1a6eac: add    rbx,0x8
0x1a6eb0: mov    QWORD PTR [rsp+0x38],rbx
0x1a6eb5: lea    r8,[rsp+0x40]
0x1a6eba: lea    rdx,[rsp+0x30]
0x1a6ebf: lea    rcx,[rsp+0x38]
0x1a6ec4: call   0x14006ee20
0x1a6ec9: cmp    BYTE PTR [rax],0x0
0x1a6ecc: jl     0x1401a6e00
0x1a6ed2: test   rsi,rsi
0x1a6ed5: mov    rdi,QWORD PTR [rsp+0x48]
0x1a6eda: je     0x1401a6fb9
0x1a6ee0: mov    eax,DWORD PTR [rsi+0x8]
0x1a6ee3: cmp    eax,r14d
0x1a6ee6: jg     0x1401a6efa
0x1a6ee8: mov    r14d,eax
0x1a6eeb: jne    0x1401a6efa
0x1a6eed: test   BYTE PTR [rsi+0x18],0x1
0x1a6ef1: mov    eax,0x65
0x1a6ef6: cmovne r14d,eax
0x1a6efa: lea    rcx,[rbp-0x20]
0x1a6efe: call   0x14006f690
0x1a6f03: nop
0x1a6f04: mov    eax,DWORD PTR [rsi+0x14]
0x1a6f07: mov    DWORD PTR [rsp+0x28],eax
0x1a6f0b: mov    eax,DWORD PTR [rsi+0x10]
0x1a6f0e: mov    DWORD PTR [rsp+0x20],eax
0x1a6f12: mov    r9d,DWORD PTR [rsi+0xc]
0x1a6f16: lea    r8,[rbp-0x20]
0x1a6f1a: xor    edx,edx
0x1a6f1c: mov    rcx,r13
0x1a6f1f: call   0x14066fe50
0x1a6f24: cmp    QWORD PTR [rbp-0x10],0x0
0x1a6f29: je     0x1401a6f3b
0x1a6f2b: lea    rdx,[rip+0x14560b6]        # 0x1415fcfe8 ; literal="  "
0x1a6f32: lea    rcx,[rbp-0x20]
0x1a6f36: call   0x14006f560
0x1a6f3b: mov    ecx,DWORD PTR [rsi]
0x1a6f3d: lea    rdx,[rbp-0x20]
0x1a6f41: cmp    r14d,0x65
0x1a6f45: jne    0x1401a6f4e
0x1a6f47: call   0x140667f50
0x1a6f4c: jmp    0x1401a6f79
0x1a6f4e: cmp    r14d,0x64
0x1a6f52: jne    0x1401a6f5b
0x1a6f54: call   0x1406681a0
0x1a6f59: jmp    0x1401a6f79
0x1a6f5b: cmp    r14d,0xa
0x1a6f5f: jle    0x1401a6f68
0x1a6f61: call   0x1406691e0
0x1a6f66: jmp    0x1401a6f79
0x1a6f68: test   r14d,r14d
0x1a6f6b: jle    0x1401a6f74
0x1a6f6d: call   0x140669f40
0x1a6f72: jmp    0x1401a6f79
0x1a6f74: call   0x14066aca0
0x1a6f79: lea    rdx,[rip+0x1442798]        # 0x1415e9718 ; literal="\""
0x1a6f80: lea    rcx,[rdi+0x1cc0]
0x1a6f87: call   0x14006f560
0x1a6f8c: lea    rdx,[rbp-0x20]
0x1a6f90: lea    rcx,[rdi+0x1cc0]
0x1a6f97: call   0x1400b9d10
0x1a6f9c: lea    rdx,[rip+0x1442775]        # 0x1415e9718 ; literal="\""
0x1a6fa3: lea    rcx,[rdi+0x1cc0]
0x1a6faa: call   0x14006f560
0x1a6faf: nop
0x1a6fb0: lea    rcx,[rbp-0x20]
0x1a6fb4: jmp    0x1401a7061
0x1a6fb9: lea    rcx,[rbp+0x20]
0x1a6fbd: call   0x14006f690
0x1a6fc2: nop
0x1a6fc3: xor    r8d,r8d
0x1a6fc6: lea    rdx,[rbp+0x20]
0x1a6fca: mov    rcx,r13
0x1a6fcd: call   0x140666470
0x1a6fd2: mov    r9d,0x77
0x1a6fd8: movzx  r8d,WORD PTR [r13+0x12c]
0x1a6fe0: movzx  edx,WORD PTR [r13+0xa4]
0x1a6fe8: lea    rcx,[rip+0x2345a59]        # 0x1424eca48
0x1a6fef: call   0x140072850
0x1a6ff4: test   al,al
0x1a6ff6: je     0x1401a7026
0x1a6ff8: lea    rdx,[rbp+0x20]
0x1a6ffc: lea    rcx,[rbp+0x0]
0x1a7000: call   0x14006f5d0
0x1a7005: nop
0x1a7006: lea    rcx,[rbp+0x0]
0x1a700a: call   0x14067b6c0
0x1a700f: lea    rdx,[rbp+0x0]
0x1a7013: lea    rcx,[rbp+0x20]
0x1a7017: call   0x14006f5a0
0x1a701c: nop
0x1a701d: lea    rcx,[rbp+0x0]
0x1a7021: call   0x14006f850
0x1a7026: lea    rdx,[rip+0x14426eb]        # 0x1415e9718 ; literal="\""
0x1a702d: lea    rcx,[rdi+0x1cc0]
0x1a7034: call   0x14006f560
0x1a7039: lea    rdx,[rbp+0x20]
0x1a703d: lea    rcx,[rdi+0x1cc0]
0x1a7044: call   0x1400b9d10
0x1a7049: lea    rdx,[rip+0x14426c8]        # 0x1415e9718 ; literal="\""
0x1a7050: lea    rcx,[rdi+0x1cc0]
0x1a7057: call   0x14006f560
0x1a705c: nop
0x1a705d: lea    rcx,[rbp+0x20]
0x1a7061: call   0x14006f850
0x1a7066: mov    rax,QWORD PTR [r13+0xa98]
0x1a706d: test   rax,rax
0x1a7070: je     0x1401a7fd7
0x1a7076: xorps  xmm0,xmm0
0x1a7079: movdqu XMMWORD PTR [rbp-0x40],xmm0
0x1a707e: xor    esi,esi
0x1a7080: mov    QWORD PTR [rbp-0x30],rsi
0x1a7084: movdqu XMMWORD PTR [rsp+0x68],xmm0
0x1a708a: mov    QWORD PTR [rsp+0x78],rsi
0x1a708f: movdqu XMMWORD PTR [rbp-0x60],xmm0
0x1a7094: mov    QWORD PTR [rbp-0x50],rsi
0x1a7098: mov    rbx,QWORD PTR [rax+0x278]
0x1a709f: mov    QWORD PTR [rsp+0x48],rbx
0x1a70a4: mov    rax,QWORD PTR [rax+0x280]
0x1a70ab: mov    QWORD PTR [rsp+0x38],rax
0x1a70b0: lea    r8,[rsp+0x38]
0x1a70b5: lea    rdx,[rsp+0x30]
0x1a70ba: lea    rcx,[rsp+0x48]
0x1a70bf: call   0x14006ee20
0x1a70c4: cmp    BYTE PTR [rax],sil
0x1a70c7: jge    0x1401a71fd
0x1a70cd: nop    DWORD PTR [rax]
0x1a70d0: mov    r8,QWORD PTR [rbx]
0x1a70d3: mov    eax,DWORD PTR [r8+0xc]
0x1a70d7: cmp    eax,0xffffffff
0x1a70da: je     0x1401a71d7
0x1a70e0: cmp    eax,0x6
0x1a70e3: je     0x1401a71d7
0x1a70e9: mov    eax,DWORD PTR [r8]
0x1a70ec: cmp    eax,0xa5
0x1a70f1: je     0x1401a71d7
0x1a70f7: cmp    eax,0xa6
0x1a70fc: je     0x1401a71d7
0x1a7102: mov    r11,r8
0x1a7105: cmp    DWORD PTR [r8+0x4],0x0
0x1a710a: jg     0x1401a717c
0x1a710c: cmp    DWORD PTR [r8+0x8],0x0
0x1a7111: jg     0x1401a717c
0x1a7113: mov    r10,QWORD PTR [rsp+0x70]
0x1a7118: mov    rdx,QWORD PTR [rsp+0x68]
0x1a711d: sub    r10,rdx
0x1a7120: sar    r10,0x3
0x1a7124: test   r10,r10
0x1a7127: jne    0x1401a7133
0x1a7129: lea    rcx,[rsp+0x68]
0x1a712e: jmp    0x1401a71cf
0x1a7133: mov    ecx,esi
0x1a7135: test   r10,r10
0x1a7138: je     0x1401a7129
0x1a713a: mov    r11d,DWORD PTR [r8+0x20]
0x1a713e: xchg   ax,ax
0x1a7140: mov    r9,QWORD PTR [rdx]
0x1a7143: cmp    DWORD PTR [r9+0x20],r11d
0x1a7147: jl     0x1401a716a
0x1a7149: jne    0x1401a7155
0x1a714b: mov    eax,DWORD PTR [r8+0x24]
0x1a714f: cmp    DWORD PTR [r9+0x24],eax
0x1a7153: jl     0x1401a716a
0x1a7155: inc    ecx
0x1a7157: add    rdx,0x8
0x1a715b: movsxd rax,ecx
0x1a715e: cmp    rax,r10
0x1a7161: jb     0x1401a7140
0x1a7163: lea    rcx,[rsp+0x68]
0x1a7168: jmp    0x1401a71cf
0x1a716a: movsxd rdx,ecx
0x1a716d: mov    r8,rbx
0x1a7170: lea    rcx,[rsp+0x68]
0x1a7175: call   0x1401b9f20
0x1a717a: jmp    0x1401a71d7
0x1a717c: mov    r9,QWORD PTR [rbp-0x38]
0x1a7180: mov    rdx,QWORD PTR [rbp-0x40]
0x1a7184: sub    r9,rdx
0x1a7187: sar    r9,0x3
0x1a718b: test   r9,r9
0x1a718e: je     0x1401a71cb
0x1a7190: mov    ecx,esi
0x1a7192: mov    r10d,DWORD PTR [r11+0x20]
0x1a7196: data16 nop WORD PTR [rax+rax*1+0x0]
0x1a71a0: mov    r8,QWORD PTR [rdx]
0x1a71a3: cmp    DWORD PTR [r8+0x20],r10d
0x1a71a7: jl     0x1401a7370
0x1a71ad: jne    0x1401a71bd
0x1a71af: mov    eax,DWORD PTR [r11+0x24]
0x1a71b3: cmp    DWORD PTR [r8+0x24],eax
0x1a71b7: jl     0x1401a7370
0x1a71bd: inc    ecx
0x1a71bf: add    rdx,0x8
0x1a71c3: movsxd rax,ecx
0x1a71c6: cmp    rax,r9
0x1a71c9: jb     0x1401a71a0
0x1a71cb: lea    rcx,[rbp-0x40]
0x1a71cf: mov    rdx,rbx
0x1a71d2: call   0x1400b9980
0x1a71d7: add    rbx,0x8
0x1a71db: mov    QWORD PTR [rsp+0x48],rbx
0x1a71e0: lea    r8,[rsp+0x38]
0x1a71e5: lea    rdx,[rsp+0x30]
0x1a71ea: lea    rcx,[rsp+0x48]
0x1a71ef: call   0x14006ee20
0x1a71f4: cmp    BYTE PTR [rax],0x0
0x1a71f7: jl     0x1401a70d0
0x1a71fd: lea    rdx,[rbp-0x40]
0x1a7201: lea    rcx,[rbp-0x60]
0x1a7205: call   0x1400f8430
0x1a720a: mov    r10,QWORD PTR [rsp+0x68]
0x1a720f: mov    QWORD PTR [rsp+0x48],r10
0x1a7214: mov    rax,QWORD PTR [rsp+0x70]
0x1a7219: mov    QWORD PTR [rsp+0x38],rax
0x1a721e: lea    r8,[rsp+0x38]
0x1a7223: lea    rdx,[rsp+0x30]
0x1a7228: lea    rcx,[rsp+0x48]
0x1a722d: call   0x14006ee20
0x1a7232: cmp    BYTE PTR [rax],0x0
0x1a7235: jge    0x1401a7271
0x1a7237: mov    rbx,r10
0x1a723a: nop    WORD PTR [rax+rax*1+0x0]
0x1a7240: mov    rdx,r10
0x1a7243: lea    rcx,[rbp-0x60]
0x1a7247: call   0x1400b9980
0x1a724c: lea    r10,[rbx+0x8]
0x1a7250: mov    QWORD PTR [rsp+0x48],r10
0x1a7255: lea    r8,[rsp+0x38]
0x1a725a: lea    rdx,[rsp+0x30]
0x1a725f: lea    rcx,[rsp+0x48]
0x1a7264: call   0x14006ee20
0x1a7269: mov    rbx,r10
0x1a726c: cmp    BYTE PTR [rax],0x0
0x1a726f: jl     0x1401a7240
0x1a7271: lea    rcx,[rdi+0x17f8]
0x1a7278: call   0x1400bb9b0
0x1a727d: mov    r10,QWORD PTR [rdi+0x1810]
0x1a7284: mov    QWORD PTR [rsp+0x38],r10
0x1a7289: mov    rax,QWORD PTR [rdi+0x1818]
0x1a7290: mov    QWORD PTR [rsp+0x40],rax
0x1a7295: lea    r8,[rsp+0x40]
0x1a729a: lea    rdx,[rsp+0x30]
0x1a729f: lea    rcx,[rsp+0x38]
0x1a72a4: call   0x14006ee20
0x1a72a9: cmp    BYTE PTR [rax],0x0
0x1a72ac: jge    0x1401a72ec
0x1a72ae: mov    r11,r10
0x1a72b1: mov    rbx,r10
0x1a72b4: mov    rcx,QWORD PTR [r10]
0x1a72b7: test   rcx,rcx
0x1a72ba: je     0x1401a72c4
0x1a72bc: call   0x14014ed20
0x1a72c1: mov    r11,rbx
0x1a72c4: lea    r10,[r11+0x8]
0x1a72c8: mov    r11,r10
0x1a72cb: mov    QWORD PTR [rsp+0x38],r10
0x1a72d0: lea    r8,[rsp+0x40]
0x1a72d5: lea    rdx,[rsp+0x30]
0x1a72da: lea    rcx,[rsp+0x38]
0x1a72df: call   0x14006ee20
0x1a72e4: mov    rbx,r10
0x1a72e7: cmp    BYTE PTR [rax],0x0
0x1a72ea: jl     0x1401a72b4
0x1a72ec: lea    rcx,[rdi+0x1810]
0x1a72f3: call   0x14006f290
0x1a72f8: mov    DWORD PTR [rdi+0x1828],esi
0x1a72fe: xor    r12b,r12b
0x1a7301: mov    rbx,QWORD PTR [rbp-0x60]
0x1a7305: mov    rdx,QWORD PTR [rbp-0x58]
0x1a7309: mov    r8d,0xff
0x1a730f: mov    rcx,rbx
0x1a7312: mov    rax,rbx
0x1a7315: cmp    rbx,rdx
0x1a7318: je     0x1401a7fb9
0x1a731e: mov    eax,0x1
0x1a7323: cmp    rbx,rdx
0x1a7326: cmovb  eax,r8d
0x1a732a: test   al,al
0x1a732c: jns    0x1401a7fb9
0x1a7332: xorps  xmm0,xmm0
0x1a7335: movups XMMWORD PTR [rbp-0x80],xmm0
0x1a7339: mov    QWORD PTR [rbp-0x70],rsi
0x1a733d: mov    QWORD PTR [rbp-0x68],0xf
0x1a7345: mov    BYTE PTR [rbp-0x80],0x0
0x1a7349: mov    rdx,QWORD PTR [rbx]
0x1a734c: mov    r8,QWORD PTR [rsp+0x68]
0x1a7351: mov    rax,r8
0x1a7354: mov    rcx,QWORD PTR [rsp+0x70]
0x1a7359: nop    DWORD PTR [rax+0x0]
0x1a7360: cmp    rax,rcx
0x1a7363: jae    0x1401a73a5
0x1a7365: cmp    QWORD PTR [rax],rdx
0x1a7368: je     0x1401a7384
0x1a736a: add    rax,0x8
0x1a736e: jmp    0x1401a7360
0x1a7370: movsxd rdx,ecx
0x1a7373: mov    r8,rbx
0x1a7376: lea    rcx,[rbp-0x40]
0x1a737a: call   0x1401b9f20
0x1a737f: jmp    0x1401a71d7
0x1a7384: sub    rax,r8
0x1a7387: sar    rax,0x3
0x1a738b: cmp    eax,0xffffffff
0x1a738e: je     0x1401a73a5
0x1a7390: lea    rdx,[rip+0x145b0a9]        # 0x141602440 ; literal="[C:7:0:0]"
0x1a7397: lea    rcx,[rbp-0x80]
0x1a739b: call   0x14006f580
0x1a73a0: mov    r12b,0x1
0x1a73a3: jmp    0x1401a73c8
0x1a73a5: mov    QWORD PTR [rbp-0x70],0x9
0x1a73ad: movsd  xmm0,QWORD PTR [rip+0x145b07b]        # 0x141602430 ; literal="[C:7:0:1]"
0x1a73b5: movsd  QWORD PTR [rbp-0x80],xmm0
0x1a73ba: movzx  eax,BYTE PTR [rip+0x145b077]        # 0x141602438 ; literal="]"
0x1a73c1: mov    BYTE PTR [rbp-0x78],al
0x1a73c4: mov    BYTE PTR [rbp-0x77],0x0
0x1a73c8: xorps  xmm0,xmm0
0x1a73cb: movups XMMWORD PTR [rbp-0x20],xmm0
0x1a73cf: mov    QWORD PTR [rbp-0x10],rsi
0x1a73d3: mov    QWORD PTR [rbp-0x8],0xf
0x1a73db: mov    BYTE PTR [rbp-0x20],0x0
0x1a73df: movzx  eax,BYTE PTR [r13+0x12e]
0x1a73e7: cmp    al,0x1
0x1a73e9: jne    0x1401a73f4
0x1a73eb: lea    rdx,[rip+0x15278da]        # 0x1416ceccc ; literal="he"
0x1a73f2: jmp    0x1401a740e
0x1a73f4: test   al,al
0x1a73f6: jne    0x1401a7407
0x1a73f8: lea    rdx,[rip+0x15278c9]        # 0x1416cecc8 ; literal="she"
0x1a73ff: mov    r8d,0x3
0x1a7405: jmp    0x1401a7414
0x1a7407: lea    rdx,[rip+0x14470c6]        # 0x1415ee4d4 ; literal="it"
0x1a740e: mov    r8d,0x2
0x1a7414: lea    rcx,[rbp-0x20]
0x1a7418: call   0x14006f8d0
0x1a741d: lea    rax,[rbp-0x20]
0x1a7421: cmp    QWORD PTR [rbp-0x8],0xf
0x1a7426: cmova  rax,QWORD PTR [rbp-0x20]
0x1a742b: add    BYTE PTR [rax],0x9f
0x1a742e: lea    rax,[rbp-0x20]
0x1a7432: cmp    QWORD PTR [rbp-0x8],0xf
0x1a7437: cmova  rax,QWORD PTR [rbp-0x20]
0x1a743c: add    BYTE PTR [rax],0x41
0x1a743f: lea    rdx,[rbp-0x20]
0x1a7443: cmp    QWORD PTR [rbp-0x8],0xf
0x1a7448: cmova  rdx,QWORD PTR [rbp-0x20]
0x1a744d: mov    r8,QWORD PTR [rbp-0x10]
0x1a7451: lea    rcx,[rbp-0x80]
0x1a7455: call   0x14006fa10
0x1a745a: mov    r8d,0x1
0x1a7460: lea    rdx,[rip+0x14412d5]        # 0x1415e873c ; literal=" "
0x1a7467: lea    rcx,[rbp-0x80]
0x1a746b: call   0x14006fa10
0x1a7470: mov    rax,QWORD PTR [rbx]
0x1a7473: mov    r15d,DWORD PTR [rax]
0x1a7476: cmp    DWORD PTR [rax+0x8],0x0
0x1a747a: jne    0x1401a74ad
0x1a747c: test   BYTE PTR [rax+0x18],0x8
0x1a7480: je     0x1401a74ad
0x1a7482: mov    r15d,0xffffffff
0x1a7488: mov    r14d,r15d
0x1a748b: lea    esi,[r14+0x1]
0x1a748f: lea    rcx,[rbp-0x80]
0x1a7493: test   r12b,r12b
0x1a7496: je     0x1401a751c
0x1a749c: lea    rdx,[rip+0x145af4d]        # 0x1416023f0 ; literal="didn't feel "
0x1a74a3: call   0x14006f560
0x1a74a8: jmp    0x1401a753a
0x1a74ad: mov    r14d,r15d
0x1a74b0: lea    eax,[r15+0x1]
0x1a74b4: cmp    eax,0xa9
0x1a74b9: ja     0x1401a752a
0x1a74bb: cdqe
0x1a74bd: lea    rdx,[rip+0xffffffffffe58b3c]        # 0x140000000
0x1a74c4: movzx  eax,BYTE PTR [rdx+rax*1+0x1a820c]
0x1a74cc: mov    ecx,DWORD PTR [rdx+rax*4+0x1a81f8]
0x1a74d3: add    rcx,rdx
0x1a74d6: jmp    rcx
0x1a74d8: lea    rdx,[rip+0x145af45]        # 0x141602424 ; literal="was "
0x1a74df: lea    rax,[rip+0x145af3a]        # 0x141602420 ; literal="is "
0x1a74e6: test   r12b,r12b
0x1a74e9: cmove  rdx,rax
0x1a74ed: lea    rcx,[rbp-0x80]
0x1a74f1: call   0x14006f560
0x1a74f6: lea    esi,[r15+0x1]
0x1a74fa: jmp    0x1401a753a
0x1a74fc: lea    rdx,[rip+0x145af15]        # 0x141602418 ; literal="felt "
0x1a7503: lea    rax,[rip+0x145af06]        # 0x141602410 ; literal="feels "
0x1a750a: jmp    0x1401a74e6
0x1a750c: lea    rdx,[rip+0x145aef5]        # 0x141602408 ; literal="was in "
0x1a7513: lea    rax,[rip+0x145aee6]        # 0x141602400 ; literal="is in "
0x1a751a: jmp    0x1401a74e6
0x1a751c: lea    rdx,[rip+0x145aebd]        # 0x1416023e0 ; literal="doesn't feel "
0x1a7523: call   0x14006f560
0x1a7528: jmp    0x1401a753a
0x1a752a: lea    esi,[r15+0x1]
0x1a752e: cmp    esi,0xa9
0x1a7534: ja     0x1401a7611
0x1a753a: movsxd rax,esi
0x1a753d: lea    rsi,[rip+0xffffffffffe58abc]        # 0x140000000
0x1a7544: movzx  eax,BYTE PTR [rsi+rax*1+0x1a82dc]
0x1a754c: mov    ecx,DWORD PTR [rsi+rax*4+0x1a82b8]
0x1a7553: add    rcx,rsi
0x1a7556: jmp    rcx
0x1a7558: lea    rdx,[rip+0x145ae71]        # 0x1416023d0 ; literal="[C:6:0:0]"
0x1a755f: lea    rcx,[rbp-0x80]
0x1a7563: call   0x14006f560
0x1a7568: lea    eax,[r14+0x1]
0x1a756c: jmp    0x1401a7627
0x1a7571: lea    rdx,[rip+0x145ae48]        # 0x1416023c0 ; literal="[C:2:0:1]"
0x1a7578: lea    rcx,[rbp-0x80]
0x1a757c: call   0x14006f560
0x1a7581: lea    eax,[r14+0x1]
0x1a7585: jmp    0x1401a7627
0x1a758a: lea    rdx,[rip+0x145ae1f]        # 0x1416023b0 ; literal="[C:3:0:1]"
0x1a7591: lea    rcx,[rbp-0x80]
0x1a7595: call   0x14006f560
0x1a759a: lea    eax,[r14+0x1]
0x1a759e: jmp    0x1401a7627
0x1a75a3: lea    rdx,[rip+0x145adf6]        # 0x1416023a0 ; literal="[C:5:0:1]"
0x1a75aa: lea    rcx,[rbp-0x80]
0x1a75ae: call   0x14006f560
0x1a75b3: lea    eax,[r14+0x1]
0x1a75b7: jmp    0x1401a7627
0x1a75b9: lea    rdx,[rip+0x145afa8]        # 0x141602568 ; literal="[C:4:0:1]"
0x1a75c0: lea    rcx,[rbp-0x80]
0x1a75c4: call   0x14006f560
0x1a75c9: lea    eax,[r14+0x1]
0x1a75cd: jmp    0x1401a7627
0x1a75cf: lea    rdx,[rip+0x145af82]        # 0x141602558 ; literal="[C:6:0:1]"
0x1a75d6: lea    rcx,[rbp-0x80]
0x1a75da: call   0x14006f560
0x1a75df: lea    eax,[r14+0x1]
0x1a75e3: jmp    0x1401a7627
0x1a75e5: lea    rdx,[rip+0x145ae54]        # 0x141602440 ; literal="[C:7:0:0]"
0x1a75ec: lea    rcx,[rbp-0x80]
0x1a75f0: call   0x14006f560
0x1a75f5: lea    eax,[r14+0x1]
0x1a75f9: jmp    0x1401a7627
0x1a75fb: lea    rdx,[rip+0x145af46]        # 0x141602548 ; literal="[C:1:0:1]"
0x1a7602: lea    rcx,[rbp-0x80]
0x1a7606: call   0x14006f560
0x1a760b: lea    eax,[r14+0x1]
0x1a760f: jmp    0x1401a7627
0x1a7611: lea    rsi,[rip+0xffffffffffe589e8]        # 0x140000000
0x1a7618: lea    eax,[r15+0x1]
0x1a761c: cmp    eax,0xa9
0x1a7621: ja     0x1401a7c66
0x1a7627: cdqe
0x1a7629: mov    ecx,DWORD PTR [rsi+rax*4+0x1a8388]
0x1a7630: add    rcx,rsi
0x1a7633: jmp    rcx
0x1a7635: lea    rdx,[rip+0x145af04]        # 0x141602540 ; literal="annoyed"
0x1a763c: jmp    0x1401a7c5d
0x1a7641: lea    rdx,[rip+0x145aee8]        # 0x141602530 ; literal="satisfied"
0x1a7648: jmp    0x1401a7c5d
0x1a764d: lea    rdx,[rip+0x145aed4]        # 0x141602528 ; literal="grouchy"
0x1a7654: jmp    0x1401a7c5d
0x1a7659: lea    rdx,[rip+0x145aebc]        # 0x14160251c ; literal="grumpy"
0x1a7660: jmp    0x1401a7c5d
0x1a7665: lea    rdx,[rip+0x145aea4]        # 0x141602510 ; literal="fondness"
0x1a766c: jmp    0x1401a7c5d
0x1a7671: lea    rdx,[rip+0x145ae88]        # 0x141602500 ; literal="suspicious"
0x1a7678: jmp    0x1401a7c5d
0x1a767d: lea    rdx,[rip+0x145ae74]        # 0x1416024f8 ; literal="alarmed"
0x1a7684: jmp    0x1401a7c5d
0x1a7689: lea    rdx,[rip+0x145ae60]        # 0x1416024f0 ; literal="shocked"
0x1a7690: jmp    0x1401a7c5d
0x1a7695: lea    rdx,[rip+0x145ae44]        # 0x1416024e0 ; literal="horrified"
0x1a769c: jmp    0x1401a7c5d
0x1a76a1: lea    rdx,[rip+0x145ae20]        # 0x1416024c8 ; literal="grim satisfaction"
0x1a76a8: jmp    0x1401a7c5d
0x1a76ad: lea    rcx,[rbp-0x80]
0x1a76b1: test   r12b,r12b
0x1a76b4: je     0x1401a76c2
0x1a76b6: lea    rdx,[rip+0x145ae03]        # 0x1416024c0 ; literal="grieved"
0x1a76bd: jmp    0x1401a7c61
0x1a76c2: lea    rdx,[rip+0x145adef]        # 0x1416024b8 ; literal="grieves"
0x1a76c9: jmp    0x1401a7c61
0x1a76ce: lea    rdx,[rip+0x145addb]        # 0x1416024b0 ; literal="triumph"
0x1a76d5: jmp    0x1401a7c5d
0x1a76da: lea    rcx,[rbp-0x80]
0x1a76de: test   r12b,r12b
0x1a76e1: je     0x1401a76ef
0x1a76e3: lea    rdx,[rip+0x145af3e]        # 0x141602628 ; literal="raged"
0x1a76ea: jmp    0x1401a7c61
0x1a76ef: lea    rdx,[rip+0x145af2a]        # 0x141602620 ; literal="rages"
0x1a76f6: jmp    0x1401a7c61
0x1a76fb: lea    rdx,[rip+0x145af16]        # 0x141602618 ; literal="excited"
0x1a7702: jmp    0x1401a7c5d
0x1a7707: lea    rdx,[rip+0x145aefe]        # 0x14160260c ; literal="gaiety"
0x1a770e: jmp    0x1401a7c5d
0x1a7713: lea    rdx,[rip+0x145aeee]        # 0x141602608 ; literal="sad"
0x1a771a: jmp    0x1401a7c5d
0x1a771f: lea    rdx,[rip+0x145aede]        # 0x141602604 ; literal="joy"
0x1a7726: jmp    0x1401a7c5d
0x1a772b: lea    rdx,[rip+0x145aec6]        # 0x1416025f8 ; literal="blissful"
0x1a7732: jmp    0x1401a7c5d
0x1a7737: lea    rdx,[rip+0x145aeae]        # 0x1416025ec ; literal="love"
0x1a773e: jmp    0x1401a7c5d
0x1a7743: lea    rdx,[rip+0x145ae96]        # 0x1416025e0 ; literal="vengeful"
0x1a774a: jmp    0x1401a7c5d
0x1a774f: lea    rdx,[rip+0x145ae7a]        # 0x1416025d0 ; literal="accepting"
0x1a7756: jmp    0x1401a7c5d
0x1a775b: lea    rdx,[rip+0x145ae5e]        # 0x1416025c0 ; literal="admiration"
0x1a7762: jmp    0x1401a7c5d
0x1a7767: lea    rdx,[rip+0x145ae42]        # 0x1416025b0 ; literal="adoration"
0x1a776e: jmp    0x1401a7c5d
0x1a7773: lea    rdx,[rip+0x145ae26]        # 0x1416025a0 ; literal="affection"
0x1a777a: jmp    0x1401a7c5d
0x1a777f: lea    rdx,[rip+0x145ae0a]        # 0x141602590 ; literal="agitated"
0x1a7786: jmp    0x1401a7c5d
0x1a778b: lea    rdx,[rip+0x145adee]        # 0x141602580 ; literal="aggravated"
0x1a7792: jmp    0x1401a7c5d
0x1a7797: lea    rdx,[rip+0x145add6]        # 0x141602574 ; literal="agony"
0x1a779e: jmp    0x1401a7c5d
0x1a77a3: lea    rdx,[rip+0x145af1e]        # 0x1416026c8 ; literal="alienated"
0x1a77aa: jmp    0x1401a7c5d
0x1a77af: lea    rdx,[rip+0x145af06]        # 0x1416026bc ; literal="amazed"
0x1a77b6: jmp    0x1401a7c5d
0x1a77bb: lea    rdx,[rip+0x145aeee]        # 0x1416026b0 ; literal="ambivalent"
0x1a77c2: jmp    0x1401a7c5d
0x1a77c7: lea    rdx,[rip+0x145aeda]        # 0x1416026a8 ; literal="amused"
0x1a77ce: jmp    0x1401a7c5d
0x1a77d3: lea    rdx,[rip+0x145aec6]        # 0x1416026a0 ; literal="angry"
0x1a77da: jmp    0x1401a7c5d
0x1a77df: lea    rdx,[rip+0x145aeb2]        # 0x141602698 ; literal="anguish"
0x1a77e6: jmp    0x1401a7c5d
0x1a77eb: lea    rdx,[rip+0x145ae9e]        # 0x141602690 ; literal="anxious"
0x1a77f2: jmp    0x1401a7c5d
0x1a77f7: lea    rdx,[rip+0x145ae82]        # 0x141602680 ; literal="apathetic"
0x1a77fe: jmp    0x1401a7c5d
0x1a7803: lea    rdx,[rip+0x145ae6e]        # 0x141602678 ; literal="aroused"
0x1a780a: jmp    0x1401a7c5d
0x1a780f: lea    rdx,[rip+0x145ae52]        # 0x141602668 ; literal="astonished"
0x1a7816: jmp    0x1401a7c5d
0x1a781b: lea    rdx,[rip+0x145ae36]        # 0x141602658 ; literal="aversion"
0x1a7822: jmp    0x1401a7c5d
0x1a7827: lea    rdx,[rip+0x145ae26]        # 0x141602654 ; literal="awe"
0x1a782e: jmp    0x1401a7c5d
0x1a7833: lea    rdx,[rip+0x145ae12]        # 0x14160264c ; literal="bitter"
0x1a783a: jmp    0x1401a7c5d
0x1a783f: lea    rdx,[rip+0x145adfe]        # 0x141602644 ; literal="bored"
0x1a7846: jmp    0x1401a7c5d
0x1a784b: lea    rdx,[rip+0x145adea]        # 0x14160263c ; literal="caring"
0x1a7852: jmp    0x1401a7c5d
0x1a7857: lea    rdx,[rip+0x145add2]        # 0x141602630 ; literal="confused"
0x1a785e: jmp    0x1401a7c5d
0x1a7863: lea    rdx,[rip+0x145af2e]        # 0x141602798 ; literal="contemptuous"
0x1a786a: jmp    0x1401a7c5d
0x1a786f: lea    rdx,[rip+0x145af1a]        # 0x141602790 ; literal="content"
0x1a7876: jmp    0x1401a7c5d
0x1a787b: lea    rdx,[rip+0x145aefe]        # 0x141602780 ; literal="dejected"
0x1a7882: jmp    0x1401a7c5d
0x1a7887: lea    rdx,[rip+0x145aee2]        # 0x141602770 ; literal="delighted"
0x1a788e: jmp    0x1401a7c5d
0x1a7893: lea    rdx,[rip+0x145aece]        # 0x141602768 ; literal="despair"
0x1a789a: jmp    0x1401a7c5d
0x1a789f: lea    rdx,[rip+0x145aeb2]        # 0x141602758 ; literal="disappointed"
0x1a78a6: jmp    0x1401a7c5d
0x1a78ab: lea    rdx,[rip+0x145ae96]        # 0x141602748 ; literal="disgusted"
0x1a78b2: jmp    0x1401a7c5d
0x1a78b7: lea    rdx,[rip+0x145ae7a]        # 0x141602738 ; literal="disillusioned"
0x1a78be: jmp    0x1401a7c5d
0x1a78c3: lea    rdx,[rip+0x145ae66]        # 0x141602730 ; literal="dislike"
0x1a78ca: jmp    0x1401a7c5d
0x1a78cf: lea    rdx,[rip+0x145ae4a]        # 0x141602720 ; literal="dismayed"
0x1a78d6: jmp    0x1401a7c5d
0x1a78db: lea    rdx,[rip+0x145ae2e]        # 0x141602710 ; literal="displeasure"
0x1a78e2: jmp    0x1401a7c5d
0x1a78e7: lea    rdx,[rip+0x145ae12]        # 0x141602700 ; literal="distressed"
0x1a78ee: jmp    0x1401a7c5d
0x1a78f3: lea    rdx,[rip+0x145adfa]        # 0x1416026f4 ; literal="eager"
0x1a78fa: jmp    0x1401a7c5d
0x1a78ff: lea    rdx,[rip+0x145ade6]        # 0x1416026ec ; literal="elated"
0x1a7906: jmp    0x1401a7c5d
0x1a790b: lea    rdx,[rip+0x145adce]        # 0x1416026e0 ; literal="embarrassed"
0x1a7912: jmp    0x1401a7c5d
0x1a7917: lea    rdx,[rip+0x145adba]        # 0x1416026d8 ; literal="empathy"
0x1a791e: jmp    0x1401a7c5d
0x1a7923: lea    rdx,[rip+0x145af2a]        # 0x141602854 ; literal="empty"
0x1a792a: jmp    0x1401a7c5d
0x1a792f: lea    rdx,[rip+0x145af12]        # 0x141602848 ; literal="enjoyment"
0x1a7936: jmp    0x1401a7c5d
0x1a793b: lea    rdx,[rip+0x145aef6]        # 0x141602838 ; literal="exasperated"
0x1a7942: jmp    0x1401a7c5d
0x1a7947: lea    rdx,[rip+0x145aeda]        # 0x141602828 ; literal="exhilarated"
0x1a794e: jmp    0x1401a7c5d
0x1a7953: lea    rdx,[rip+0x145aec2]        # 0x14160281c ; literal="afraid"
0x1a795a: jmp    0x1401a7c5d
0x1a795f: lea    rdx,[rip+0x145aeaa]        # 0x141602810 ; literal="ferocity"
0x1a7966: jmp    0x1401a7c5d
0x1a796b: lea    rdx,[rip+0x145ae92]        # 0x141602804 ; literal="free"
0x1a7972: jmp    0x1401a7c5d
0x1a7977: lea    rdx,[rip+0x145ae7a]        # 0x1416027f8 ; literal="frightened"
0x1a797e: jmp    0x1401a7c5d
0x1a7983: lea    rdx,[rip+0x145ae5e]        # 0x1416027e8 ; literal="frustrated"
0x1a798a: jmp    0x1401a7c5d
0x1a798f: lea    rdx,[rip+0x145ae4a]        # 0x1416027e0 ; literal="gleeful"
0x1a7996: jmp    0x1401a7c5d
0x1a799b: lea    rdx,[rip+0x145ae32]        # 0x1416027d4 ; literal="gloomy"
0x1a79a2: jmp    0x1401a7c5d
0x1a79a7: lea    rdx,[rip+0x145ae1e]        # 0x1416027cc ; literal="glum"
0x1a79ae: jmp    0x1401a7c5d
0x1a79b3: lea    rdx,[rip+0x145ae06]        # 0x1416027c0 ; literal="gratitude"
0x1a79ba: jmp    0x1401a7c5d
0x1a79bf: lea    rdx,[rip+0x145adf2]        # 0x1416027b8 ; literal="guilty"
0x1a79c6: jmp    0x1401a7c5d
0x1a79cb: lea    rdx,[rip+0x145adde]        # 0x1416027b0 ; literal="happy"
0x1a79d2: jmp    0x1401a7c5d
0x1a79d7: lea    rdx,[rip+0x145adca]        # 0x1416027a8 ; literal="hateful"
0x1a79de: jmp    0x1401a7c5d
0x1a79e3: lea    rdx,[rip+0x145af3a]        # 0x141602924 ; literal="hope"
0x1a79ea: jmp    0x1401a7c5d
0x1a79ef: lea    rdx,[rip+0x145af22]        # 0x141602918 ; literal="hopeless"
0x1a79f6: jmp    0x1401a7c5d
0x1a79fb: lea    rdx,[rip+0x145af06]        # 0x141602908 ; literal="humiliated"
0x1a7a02: jmp    0x1401a7c5d
0x1a7a07: lea    rdx,[rip+0x145aeea]        # 0x1416028f8 ; literal="insulted"
0x1a7a0e: jmp    0x1401a7c5d
0x1a7a13: lea    rdx,[rip+0x145aece]        # 0x1416028e8 ; literal="interested"
0x1a7a1a: jmp    0x1401a7c5d
0x1a7a1f: lea    rdx,[rip+0x145aeb2]        # 0x1416028d8 ; literal="irritated"
0x1a7a26: jmp    0x1401a7c5d
0x1a7a2b: lea    rdx,[rip+0x145ae96]        # 0x1416028c8 ; literal="isolated"
0x1a7a32: jmp    0x1401a7c5d
0x1a7a37: lea    rdx,[rip+0x145ae7e]        # 0x1416028bc ; literal="jolly"
0x1a7a3e: jmp    0x1401a7c5d
0x1a7a43: lea    rdx,[rip+0x145ae6a]        # 0x1416028b4 ; literal="jovial"
0x1a7a4a: jmp    0x1401a7c5d
0x1a7a4f: lea    rdx,[rip+0x145ae52]        # 0x1416028a8 ; literal="jubilant"
0x1a7a56: jmp    0x1401a7c5d
0x1a7a5b: lea    rdx,[rip+0x145ae36]        # 0x141602898 ; literal="loathing"
0x1a7a62: jmp    0x1401a7c5d
0x1a7a67: lea    rdx,[rip+0x145ae22]        # 0x141602890 ; literal="lonely"
0x1a7a6e: jmp    0x1401a7c5d
0x1a7a73: lea    rdx,[rip+0x145ae0e]        # 0x141602888 ; literal="lustful"
0x1a7a7a: jmp    0x1401a7c5d
0x1a7a7f: lea    rdx,[rip+0x145adf2]        # 0x141602878 ; literal="miserable"
0x1a7a86: jmp    0x1401a7c5d
0x1a7a8b: lea    rdx,[rip+0x145add6]        # 0x141602868 ; literal="mortified"
0x1a7a92: jmp    0x1401a7c5d
0x1a7a97: lea    rdx,[rip+0x145adc2]        # 0x141602860 ; literal="nervous"
0x1a7a9e: jmp    0x1401a7c5d
0x1a7aa3: lea    rdx,[rip+0x145af5e]        # 0x141602a08 ; literal="nostalgic"
0x1a7aaa: jmp    0x1401a7c5d
0x1a7aaf: lea    rdx,[rip+0x145af42]        # 0x1416029f8 ; literal="optimistic"
0x1a7ab6: jmp    0x1401a7c5d
0x1a7abb: lea    rdx,[rip+0x145af26]        # 0x1416029e8 ; literal="outraged"
0x1a7ac2: jmp    0x1401a7c5d
0x1a7ac7: lea    rcx,[rbp-0x80]
0x1a7acb: test   r12b,r12b
0x1a7ace: je     0x1401a7adc
0x1a7ad0: lea    rdx,[rip+0x145af01]        # 0x1416029d8 ; literal="panicked"
0x1a7ad7: jmp    0x1401a7c61
0x1a7adc: lea    rdx,[rip+0x145aeed]        # 0x1416029d0 ; literal="panics"
0x1a7ae3: jmp    0x1401a7c61
0x1a7ae8: lea    rdx,[rip+0x145aed9]        # 0x1416029c8 ; literal="patient"
0x1a7aef: jmp    0x1401a7c5d
0x1a7af4: lea    rdx,[rip+0x145aebd]        # 0x1416029b8 ; literal="passionate"
0x1a7afb: jmp    0x1401a7c5d
0x1a7b00: lea    rdx,[rip+0x145aea1]        # 0x1416029a8 ; literal="pleasure"
0x1a7b07: jmp    0x1401a7c5d
0x1a7b0c: lea    rdx,[rip+0x145ae89]        # 0x14160299c ; literal="proud"
0x1a7b13: jmp    0x1401a7c5d
0x1a7b18: lea    rdx,[rip+0x145ae71]        # 0x141602990 ; literal="enraptured"
0x1a7b1f: jmp    0x1401a7c5d
0x1a7b24: lea    rdx,[rip+0x145ae55]        # 0x141602980 ; literal="rejected"
0x1a7b2b: jmp    0x1401a7c5d
0x1a7b30: lea    rdx,[rip+0x145ae39]        # 0x141602970 ; literal="relieved"
0x1a7b37: jmp    0x1401a7c5d
0x1a7b3c: lea    rdx,[rip+0x145ae1d]        # 0x141602960 ; literal="regretful"
0x1a7b43: jmp    0x1401a7c5d
0x1a7b48: lea    rdx,[rip+0x145ae01]        # 0x141602950 ; literal="remorseful"
0x1a7b4f: jmp    0x1401a7c5d
0x1a7b54: lea    rdx,[rip+0x145ade5]        # 0x141602940 ; literal="repentant"
0x1a7b5b: jmp    0x1401a7c5d
0x1a7b60: lea    rdx,[rip+0x145adc9]        # 0x141602930 ; literal="resentful"
0x1a7b67: jmp    0x1401a7c5d
0x1a7b6c: lea    rdx,[rip+0x145af55]        # 0x141602ac8 ; literal="restless"
0x1a7b73: jmp    0x1401a7c5d
0x1a7b78: lea    rdx,[rip+0x145af39]        # 0x141602ab8 ; literal="indignant"
0x1a7b7f: jmp    0x1401a7c5d
0x1a7b84: lea    rdx,[rip+0x145af1d]        # 0x141602aa8 ; literal="self-pity"
0x1a7b8b: jmp    0x1401a7c5d
0x1a7b90: lea    rdx,[rip+0x145af09]        # 0x141602aa0 ; literal="servile"
0x1a7b97: jmp    0x1401a7c5d
0x1a7b9c: lea    rdx,[rip+0x145aef5]        # 0x141602a98 ; literal="shaken"
0x1a7ba3: jmp    0x1401a7c5d
0x1a7ba8: lea    rdx,[rip+0x145aee1]        # 0x141602a90 ; literal="ashamed"
0x1a7baf: jmp    0x1401a7c5d
0x1a7bb4: lea    rdx,[rip+0x145aec5]        # 0x141602a80 ; literal="sympathy"
0x1a7bbb: jmp    0x1401a7c5d
0x1a7bc0: lea    rdx,[rip+0x145aea9]        # 0x141602a70 ; literal="tenderness"
0x1a7bc7: jmp    0x1401a7c5d
0x1a7bcc: lea    rdx,[rip+0x145ae8d]        # 0x141602a60 ; literal="terrified"
0x1a7bd3: jmp    0x1401a7c5d
0x1a7bd8: lea    rdx,[rip+0x145ae71]        # 0x141602a50 ; literal="thrilled"
0x1a7bdf: jmp    0x1401a7c5d
0x1a7be1: lea    rdx,[rip+0x145ae60]        # 0x141602a48 ; literal="uneasy"
0x1a7be8: jmp    0x1401a7c5d
0x1a7bea: lea    rdx,[rip+0x145ae4f]        # 0x141602a40 ; literal="unhappy"
0x1a7bf1: jmp    0x1401a7c5d
0x1a7bf3: lea    rdx,[rip+0x145ae3e]        # 0x141602a38 ; literal="wonder"
0x1a7bfa: jmp    0x1401a7c5d
0x1a7bfc: lea    rdx,[rip+0x145ae2d]        # 0x141602a30 ; literal="worried"
0x1a7c03: jmp    0x1401a7c5d
0x1a7c05: lea    rdx,[rip+0x145ae14]        # 0x141602a20 ; literal="wrathful"
0x1a7c0c: jmp    0x1401a7c5d
0x1a7c0e: lea    rdx,[rip+0x145ae03]        # 0x141602a18 ; literal="zealous"
0x1a7c15: jmp    0x1401a7c5d
0x1a7c17: lea    rdx,[rip+0x145afa2]        # 0x141602bc0 ; literal="existential crisis"
0x1a7c1e: jmp    0x1401a7c5d
0x1a7c20: lea    rdx,[rip+0x145af89]        # 0x141602bb0 ; literal="defeated"
0x1a7c27: jmp    0x1401a7c5d
0x1a7c29: lea    rdx,[rip+0x145af70]        # 0x141602ba0 ; literal="expectant"
0x1a7c30: jmp    0x1401a7c5d
0x1a7c32: lea    rdx,[rip+0x145af5f]        # 0x141602b98 ; literal="doubt"
0x1a7c39: jmp    0x1401a7c5d
0x1a7c3b: lea    rdx,[rip+0x145af46]        # 0x141602b88 ; literal="enthusiastic"
0x1a7c42: jmp    0x1401a7c5d
0x1a7c44: lea    rdx,[rip+0x145af2d]        # 0x141602b78 ; literal="pessimistic"
0x1a7c4b: jmp    0x1401a7c5d
0x1a7c4d: lea    rdx,[rip+0x145af14]        # 0x141602b68 ; literal="euphoric"
0x1a7c54: jmp    0x1401a7c5d
0x1a7c56: lea    rdx,[rip+0x145aefb]        # 0x141602b58 ; literal="anything"
0x1a7c5d: lea    rcx,[rbp-0x80]
0x1a7c61: call   0x14006f560
0x1a7c66: mov    rax,QWORD PTR [rbx]
0x1a7c69: lea    rcx,[rbp-0x80]
0x1a7c6d: test   BYTE PTR [rax+0x18],0x70
0x1a7c71: je     0x1401a7e84
0x1a7c77: test   r12b,r12b
0x1a7c7a: lea    rdx,[rip+0x145aec7]        # 0x141602b48 ; literal=" [C:5:0:0]"
0x1a7c81: jne    0x1401a7c8a
0x1a7c83: lea    rdx,[rip+0x145aeae]        # 0x141602b38 ; literal=" [C:5:0:1]"
0x1a7c8a: call   0x14006f560
0x1a7c8f: mov    rax,QWORD PTR [rbx]
0x1a7c92: movsxd rcx,DWORD PTR [rax]
0x1a7c95: cmp    ecx,0xa8
0x1a7c9b: ja     0x1401a7cc3
0x1a7c9d: movzx  eax,BYTE PTR [rsi+rcx*1+0x1a8640]
0x1a7ca5: mov    ecx,DWORD PTR [rsi+rax*4+0x1a8630]
0x1a7cac: add    rcx,rsi
0x1a7caf: jmp    rcx
0x1a7cb1: lea    rdx,[rip+0x145ae70]        # 0x141602b28 ; literal="reliving "
0x1a7cb8: jmp    0x1401a7cca
0x1a7cba: lea    rdx,[rip+0x145ae57]        # 0x141602b18 ; literal="dwelling upon "
0x1a7cc1: jmp    0x1401a7cca
0x1a7cc3: lea    rdx,[rip+0x145ae3e]        # 0x141602b08 ; literal="remembering "
0x1a7cca: lea    rcx,[rbp-0x80]
0x1a7cce: call   0x14006f560
0x1a7cd3: lea    rcx,[rbp-0x80]
0x1a7cd7: test   r12b,r12b
0x1a7cda: lea    rdx,[rip+0x145ae17]        # 0x141602af8 ; literal=" [C:7:0:0]"
0x1a7ce1: jne    0x1401a7cea
0x1a7ce3: lea    rdx,[rip+0x145adfe]        # 0x141602ae8 ; literal=" [C:7:0:1]"
0x1a7cea: call   0x14006f560
0x1a7cef: mov    rax,QWORD PTR [rbx]
0x1a7cf2: mov    ecx,DWORD PTR [rax+0x14]
0x1a7cf5: mov    BYTE PTR [rsp+0x28],0x0
0x1a7cfa: mov    DWORD PTR [rsp+0x20],ecx
0x1a7cfe: mov    r9d,DWORD PTR [rax+0x10]
0x1a7d02: mov    r8d,DWORD PTR [rax+0xc]
0x1a7d06: lea    rdx,[rbp-0x80]
0x1a7d0a: mov    rcx,r13
0x1a7d0d: call   0x140e2c460
0x1a7d12: mov    rax,QWORD PTR [rbx]
0x1a7d15: test   DWORD PTR [rax+0x18],0x180
0x1a7d1c: je     0x1401a7ebf
0x1a7d22: lea    rcx,[rbp+0x0]
0x1a7d26: call   0x14006f690
0x1a7d2b: nop
0x1a7d2c: lea    rdx,[rbp+0x0]
0x1a7d30: movzx  ecx,BYTE PTR [r13+0x12e]
0x1a7d38: call   0x140aa47b0
0x1a7d3d: lea    rcx,[rbp+0x20]
0x1a7d41: call   0x14006f690
0x1a7d46: nop
0x1a7d47: xor    r8d,r8d
0x1a7d4a: lea    rdx,[rbp+0x20]
0x1a7d4e: movzx  ecx,BYTE PTR [r13+0x12e]
0x1a7d56: call   0x140aa4850
0x1a7d5b: lea    rcx,[rbp-0x80]
0x1a7d5f: test   r12b,r12b
0x1a7d62: lea    rdx,[rip+0x145ad6f]        # 0x141602ad8 ; literal=", [C:5:0:0]"
0x1a7d69: jne    0x1401a7d72
0x1a7d6b: lea    rdx,[rip+0x145af9e]        # 0x141602d10 ; literal=", [C:5:0:1]"
0x1a7d72: call   0x14006f560
0x1a7d77: lea    rdx,[rip+0x145af6a]        # 0x141602ce8 ; literal="and mulling over the recurring memory "
0x1a7d7e: lea    rcx,[rbp-0x80]
0x1a7d82: call   0x14006f560
0x1a7d87: mov    rax,QWORD PTR [rbx]
0x1a7d8a: mov    ecx,DWORD PTR [rax+0x18]
0x1a7d8d: mov    eax,ecx
0x1a7d8f: and    eax,0x180
0x1a7d94: cmp    eax,0x180
0x1a7d99: jne    0x1401a7dfb
0x1a7d9b: lea    rdx,[rip+0x145af36]        # 0x141602cd8 ; literal="allowed "
0x1a7da2: lea    rcx,[rbp-0x80]
0x1a7da6: call   0x14006f560
0x1a7dab: lea    rdx,[rbp+0x0]
0x1a7daf: lea    rcx,[rbp-0x80]
0x1a7db3: call   0x1400b9d10
0x1a7db8: lea    rdx,[rip+0x145af09]        # 0x141602cc8 ; literal=" to rethink "
0x1a7dbf: lea    rcx,[rbp-0x80]
0x1a7dc3: call   0x14006f560
0x1a7dc8: lea    rdx,[rbp+0x20]
0x1a7dcc: lea    rcx,[rbp-0x80]
0x1a7dd0: call   0x1400b9d10
0x1a7dd5: lea    rdx,[rip+0x145aec4]        # 0x141602ca0 ; literal=" intellectual values and changed "
0x1a7ddc: lea    rcx,[rbp-0x80]
0x1a7de0: call   0x14006f560
0x1a7de5: lea    rdx,[rbp+0x20]
0x1a7de9: lea    rcx,[rbp-0x80]
0x1a7ded: call   0x1400b9d10
0x1a7df2: lea    rdx,[rip+0x145ae8f]        # 0x141602c88 ; literal=" personal tendencies"
0x1a7df9: jmp    0x1401a7e49
0x1a7dfb: test   cl,cl
0x1a7dfd: lea    rcx,[rbp-0x80]
0x1a7e01: jns    0x1401a7e0c
0x1a7e03: lea    rdx,[rip+0x145ae6e]        # 0x141602c78 ; literal="changed "
0x1a7e0a: jmp    0x1401a7de0
0x1a7e0c: lea    rdx,[rip+0x145aec5]        # 0x141602cd8 ; literal="allowed "
0x1a7e13: call   0x14006f560
0x1a7e18: lea    rdx,[rbp+0x0]
0x1a7e1c: lea    rcx,[rbp-0x80]
0x1a7e20: call   0x1400b9d10
0x1a7e25: lea    rdx,[rip+0x145ae9c]        # 0x141602cc8 ; literal=" to rethink "
0x1a7e2c: lea    rcx,[rbp-0x80]
0x1a7e30: call   0x14006f560
0x1a7e35: lea    rdx,[rbp+0x20]
0x1a7e39: lea    rcx,[rbp-0x80]
0x1a7e3d: call   0x1400b9d10
0x1a7e42: lea    rdx,[rip+0x145ae17]        # 0x141602c60 ; literal=" intellectual values"
0x1a7e49: lea    rcx,[rbp-0x80]
0x1a7e4d: call   0x14006f560
0x1a7e52: lea    rcx,[rbp-0x80]
0x1a7e56: test   r12b,r12b
0x1a7e59: lea    rdx,[rip+0x145a5e0]        # 0x141602440 ; literal="[C:7:0:0]"
0x1a7e60: jne    0x1401a7e69
0x1a7e62: lea    rdx,[rip+0x145a5c7]        # 0x141602430 ; literal="[C:7:0:1]"
0x1a7e69: call   0x14006f560
0x1a7e6e: nop
0x1a7e6f: lea    rcx,[rbp+0x20]
0x1a7e73: call   0x14006f850
0x1a7e78: nop
0x1a7e79: lea    rcx,[rbp+0x0]
0x1a7e7d: call   0x14006f850
0x1a7e82: jmp    0x1401a7ebf
0x1a7e84: test   r12b,r12b
0x1a7e87: lea    rdx,[rip+0x145ac6a]        # 0x141602af8 ; literal=" [C:7:0:0]"
0x1a7e8e: jne    0x1401a7e97
0x1a7e90: lea    rdx,[rip+0x145ac51]        # 0x141602ae8 ; literal=" [C:7:0:1]"
0x1a7e97: call   0x14006f560
0x1a7e9c: mov    rax,QWORD PTR [rbx]
0x1a7e9f: mov    ecx,DWORD PTR [rax+0x14]
0x1a7ea2: mov    BYTE PTR [rsp+0x28],0x1
0x1a7ea7: mov    DWORD PTR [rsp+0x20],ecx
0x1a7eab: mov    r9d,DWORD PTR [rax+0x10]
0x1a7eaf: mov    r8d,DWORD PTR [rax+0xc]
0x1a7eb3: lea    rdx,[rbp-0x80]
0x1a7eb7: mov    rcx,r13
0x1a7eba: call   0x140e2c460
0x1a7ebf: mov    r8d,0x1
0x1a7ec5: lea    rdx,[rip+0x14406e8]        # 0x1415e85b4 ; literal="."
0x1a7ecc: lea    rcx,[rbp-0x80]
0x1a7ed0: call   0x14006fa10
0x1a7ed5: mov    ecx,0x20
0x1a7eda: call   0x141539690
0x1a7edf: mov    rsi,rax
0x1a7ee2: xorps  xmm0,xmm0
0x1a7ee5: movups XMMWORD PTR [rax],xmm0
0x1a7ee8: xor    r15d,r15d
0x1a7eeb: mov    QWORD PTR [rax+0x10],r15
0x1a7eef: mov    QWORD PTR [rax+0x18],0xf
0x1a7ef7: mov    BYTE PTR [rax],r15b
0x1a7efa: mov    QWORD PTR [rsp+0x58],rax
0x1a7eff: lea    rax,[rbp-0x80]
0x1a7f03: cmp    rsi,rax
0x1a7f06: je     0x1401a7f22
0x1a7f08: lea    rdx,[rbp-0x80]
0x1a7f0c: cmp    QWORD PTR [rbp-0x68],0xf
0x1a7f11: cmova  rdx,QWORD PTR [rbp-0x80]
0x1a7f16: mov    r8,QWORD PTR [rbp-0x70]
0x1a7f1a: mov    rcx,rsi
0x1a7f1d: call   0x14006f8d0
0x1a7f22: mov    rdx,QWORD PTR [rdi+0x1800]
0x1a7f29: cmp    rdx,QWORD PTR [rdi+0x1808]
0x1a7f30: je     0x1401a7f3f
0x1a7f32: mov    QWORD PTR [rdx],rsi
0x1a7f35: add    QWORD PTR [rdi+0x1800],0x8
0x1a7f3d: jmp    0x1401a7f50
0x1a7f3f: lea    r8,[rsp+0x58]
0x1a7f44: lea    rcx,[rdi+0x17f8]
0x1a7f4b: call   0x1400bad30
0x1a7f50: mov    ecx,0x20
0x1a7f55: call   0x141539690
0x1a7f5a: mov    QWORD PTR [rsp+0x58],rax
0x1a7f5f: mov    rcx,rax
0x1a7f62: call   0x14014e2b0
0x1a7f67: mov    QWORD PTR [rsp+0x58],rax
0x1a7f6c: mov    rdx,QWORD PTR [rdi+0x1818]
0x1a7f73: cmp    rdx,QWORD PTR [rdi+0x1820]
0x1a7f7a: je     0x1401a7f89
0x1a7f7c: mov    QWORD PTR [rdx],rax
0x1a7f7f: add    QWORD PTR [rdi+0x1818],0x8
0x1a7f87: jmp    0x1401a7f9b
0x1a7f89: lea    r8,[rsp+0x58]
0x1a7f8e: lea    rcx,[rdi+0x1810]
0x1a7f95: call   0x140070bd0
0x1a7f9a: nop
0x1a7f9b: lea    rcx,[rbp-0x20]
0x1a7f9f: call   0x14006f850
0x1a7fa4: nop
0x1a7fa5: lea    rcx,[rbp-0x80]
0x1a7fa9: call   0x14006f850
0x1a7fae: add    rbx,0x8
0x1a7fb2: xor    esi,esi
0x1a7fb4: jmp    0x1401a7305
0x1a7fb9: lea    rcx,[rbp-0x60]
0x1a7fbd: call   0x140066b70
0x1a7fc2: nop
0x1a7fc3: lea    rcx,[rsp+0x68]
0x1a7fc8: call   0x140066b70
0x1a7fcd: nop
0x1a7fce: lea    rcx,[rbp-0x40]
0x1a7fd2: call   0x140066b70
0x1a7fd7: cmp    DWORD PTR [rdi+0xc0],0x9
0x1a7fde: jne    0x1401a7feb
0x1a7fe0: mov    rdx,r13
0x1a7fe3: mov    rcx,rdi
0x1a7fe6: call   0x140481f00
0x1a7feb: mov    rcx,QWORD PTR [rbp+0x40]
0x1a7fef: xor    rcx,rsp
0x1a7ff2: call   0x141539660
0x1a7ff7: mov    rbx,QWORD PTR [rsp+0x1a0]
0x1a7fff: add    rsp,0x150
0x1a8006: pop    r15
0x1a8008: pop    r14
0x1a800a: pop    r13
0x1a800c: pop    r12
0x1a800e: pop    rdi
0x1a800f: pop    rsi
0x1a8010: pop    rbp
0x1a8011: ret
0x1a8012: xchg   ax,ax
0x1a8014: sbb    DWORD PTR [rbp+0x1a],0x0
0x1a8018: jnp    0x1401a8076
0x1a801a: sbb    al,BYTE PTR [rax]
0x1a801c: pushf
0x1a801d: pop    rsi
0x1a801e: sbb    al,BYTE PTR [rax]
0x1a8044: add    BYTE PTR [rcx],al
0x1a8046: add    DWORD PTR [rcx],eax
0x1a8048: add    DWORD PTR [rcx],eax
0x1a804a: add    DWORD PTR [rcx],eax
0x1a804c: add    DWORD PTR [rcx],eax
0x1a804e: add    BYTE PTR [rcx],al
0x1a8050: add    BYTE PTR [rcx],al
0x1a8052: add    DWORD PTR [rcx],eax
0x1a8054: add    DWORD PTR [rcx],eax
0x1a8056: add    BYTE PTR [rdx],al
0x1a8058: add    al,BYTE PTR [rax]
0x1a805a: add    BYTE PTR [rax],al
0x1a805c: add    BYTE PTR [rax],al
0x1a805e: add    al,BYTE PTR [rax]
0x1a8060: add    BYTE PTR [rax],al
0x1a8062: add    BYTE PTR [rax],al
0x1a8064: add    BYTE PTR [rdx],al
0x1a8066: add    al,BYTE PTR [rdx]
0x1a8068: add    al,BYTE PTR [rax]
0x1a806a: add    BYTE PTR [rax],al
0x1a806c: add    al,BYTE PTR [rdx]
0x1a806e: add    al,BYTE PTR [rdx]
0x1a8070: add    al,BYTE PTR [rdx]
0x1a8072: add    al,BYTE PTR [rdx]
0x1a8074: add    al,BYTE PTR [rdx]
0x1a8076: add    DWORD PTR [rcx],eax
0x1a8078: add    al,BYTE PTR [rdx]
0x1a807a: add    al,BYTE PTR [rdx]
0x1a807c: add    al,BYTE PTR [rdx]
0x1a807e: add    al,BYTE PTR [rdx]
0x1a8080: add    al,BYTE PTR [rcx]
0x1a8082: add    DWORD PTR [rcx],eax
0x1a8084: add    DWORD PTR [rcx],eax
0x1a8086: add    DWORD PTR [rcx],eax
0x1a8088: add    DWORD PTR [rax],eax
0x1a808a: add    al,BYTE PTR [rax]
0x1a808c: add    BYTE PTR [rax],al
0x1a808e: add    BYTE PTR [rax],al
0x1a8090: add    BYTE PTR [rax],al
0x1a8092: add    al,BYTE PTR [rax]
0x1a8094: add    al,BYTE PTR [rdx]
0x1a8096: add    al,BYTE PTR [rdx]
0x1a8098: add    al,BYTE PTR [rdx]
0x1a809a: add    al,BYTE PTR [rdx]
0x1a809c: add    al,BYTE PTR [rdx]
0x1a809e: add    al,BYTE PTR [rdx]
0x1a80a0: add    al,BYTE PTR [rax]
0x1a80a2: add    BYTE PTR [rax],al
0x1a80a4: add    BYTE PTR [rdx],al
0x1a80a6: add    al,BYTE PTR [rax]
0x1a80a8: add    BYTE PTR [rdi],cl
0x1a80aa: (bad)
0x1a80ab: add    bl,ch
0x1a80ad: sbb    al,BYTE PTR fs:[rax]
0x1a80b0: hlt
0x1a80b1: sbb    al,BYTE PTR fs:[rax]
0x1a80b4: std
0x1a80b5: sbb    al,BYTE PTR fs:[rax]
0x1a80b8: (bad)
0x1a80b9: sbb    al,BYTE PTR gs:[rax]
0x1a80bc: pcmpgtw mm3,QWORD PTR [rdx]
0x1a80bf: add    BYTE PTR [rax],bl
0x1a80c1: sbb    al,BYTE PTR gs:[rax]
0x1a80c4: and    DWORD PTR [rbp+0x1a],esp
0x1a80c7: add    BYTE PTR [rdx],ch
0x1a80c9: sbb    al,BYTE PTR gs:[rax]
0x1a80cc: xor    esp,DWORD PTR [rbp+0x1a]
0x1a80cf: add    BYTE PTR [riz*2+0x6545001a],bh
0x1a80d6: sbb    al,BYTE PTR [rax]
0x1a80d8: sub    ah,BYTE PTR [rdi+0x1a]
0x1a80db: add    BYTE PTR [rdi-0x20ffe598],dl
0x1a80e1: push   0x678a001a
0x1a80e6: sbb    al,BYTE PTR [rax]
0x1a80e8: outs   dx,DWORD PTR [rsi]
0x1a80e9: imul   ebx,DWORD PTR [rdx],0x1a69b700
0x1a80ef: add    BYTE PTR [rdi],ah
0x1a80f1: imul   ebx,DWORD PTR [rdx],0x1a67bf00
0x1a80f7: add    BYTE PTR [rdi],al
0x1a80f9: push   0x6742001a
0x1a80fe: sbb    al,BYTE PTR [rax]
0x1a8100: rex.WRXB push 0x6736001a
0x1a8106: sbb    al,BYTE PTR [rax]
0x1a8108: rex.B push 0x1a
0x1a810b: add    bh,bh
0x1a810d: imul   ebx,DWORD PTR [rdx],0x1a6aa400
0x1a8113: add    BYTE PTR [rax],al
0x1a8115: add    DWORD PTR [rsi],ecx
0x1a8117: add    cl,BYTE PTR [rsi]
0x1a8119: (bad)
0x1a811a: (bad)
0x1a811b: (bad)
0x1a811c: (bad)
0x1a811d: (bad)
0x1a811e: (bad)
0x1a811f: (bad)
0x1a8120: (bad)
0x1a8121: add    eax,DWORD PTR [rax*1+0x9080706]
0x1a8128: or     cl,BYTE PTR [rbx]
0x1a812a: (bad)
0x1a812b: (bad)
0x1a812c: (bad)
0x1a812d: (bad)
0x1a812e: (bad)
0x1a812f: (bad)
0x1a8130: (bad)
0x1a8131: (bad)
0x1a8132: (bad)
0x1a8133: (bad)
0x1a8134: (bad)
0x1a8135: or     al,0xd
0x1a8137: nop
0x1a8138: (bad)
0x1a8139: outs   dx,BYTE PTR [rsi]
0x1a813a: sbb    al,BYTE PTR [rax]
0x1a813c: sahf
0x1a813d: outs   dx,BYTE PTR [rsi]
0x1a813e: sbb    al,BYTE PTR [rax]
0x1a8140: mov    BYTE PTR [rsi+0x1a],ch
0x1a8143: add    BYTE PTR [rcx-0x5effe592],dl
0x1a8149: outs   dx,BYTE PTR [rsi]
0x1a814a: sbb    al,BYTE PTR [rax]
0x1a814c: add    BYTE PTR [rcx],al
0x1a814e: add    al,BYTE PTR [rbx]
0x1a8150: add    eax,DWORD PTR [rcx]
0x1a8152: add    eax,DWORD PTR [rax]
0x1a8154: add    al,0x4
0x1a8156: add    eax,DWORD PTR [rdx]
0x1a8158: add    DWORD PTR [rcx],eax
0x1a815a: add    BYTE PTR [rbx+rax*1],al
0x1a815d: add    al,0x4
0x1a815f: add    BYTE PTR [rsp+rax*1],al
0x1a8162: add    eax,DWORD PTR [rdx+rax*1]
0x1a8165: add    DWORD PTR [rax],eax
0x1a8167: add    al,BYTE PTR [rax+rax*1]
0x1a816a: add    eax,DWORD PTR [rax]
0x1a816c: add    al,0x4
0x1a816e: add    al,BYTE PTR [rbx]
0x1a8170: add    DWORD PTR [rsp+rax*1],eax
0x1a8173: add    DWORD PTR [rax],eax
0x1a8175: add    eax,DWORD PTR [rax]
0x1a8177: add    BYTE PTR [rdx],al
0x1a8179: add    BYTE PTR [rdx],al
0x1a817b: add    BYTE PTR [rbx+rax*1],al
0x1a817e: add    al,0x2
0x1a8180: add    BYTE PTR [rdx],al
0x1a8182: add    eax,DWORD PTR [rax]
0x1a8184: add    al,0x0
0x1a8186: add    al,0x1
0x1a8188: add    BYTE PTR [rdx],al
0x1a818a: add    al,BYTE PTR [rax]
0x1a818c: add    DWORD PTR [rdx],eax
0x1a818e: add    BYTE PTR [rbx],al
0x1a8190: add    al,BYTE PTR [rax]
0x1a8192: add    al,0x2
0x1a8194: add    al,0x2
0x1a8196: add    eax,DWORD PTR [rax]
0x1a8198: add    eax,DWORD PTR [rdx+rax*1]
0x1a819b: add    al,0x0
0x1a819d: add    BYTE PTR [rbx],al
0x1a819f: add    al,BYTE PTR [rdx]
0x1a81a1: add    al,0x2
0x1a81a3: add    al,BYTE PTR [rcx]
0x1a81a5: add    al,0x3
0x1a81a7: add    al,0x4
0x1a81a9: add    al,0x4
0x1a81ab: add    eax,DWORD PTR [rax]
0x1a81ad: add    BYTE PTR [rbx],al
0x1a81af: add    al,0x3
0x1a81b1: add    al,BYTE PTR [rcx]
0x1a81b3: add    DWORD PTR [rdx],eax
0x1a81b5: add    eax,DWORD PTR [rcx+rax*1]
0x1a81b8: add    al,0x0
0x1a81ba: add    al,0x1
0x1a81bc: add    al,BYTE PTR [rax+rax*1]
0x1a81bf: add    BYTE PTR [rbx],al
0x1a81c1: add    al,BYTE PTR [rcx]
0x1a81c3: add    BYTE PTR [rdx],al
0x1a81c5: add    BYTE PTR [rbx+rax*1],al
0x1a81c8: add    eax,DWORD PTR [rcx]
0x1a81ca: add    DWORD PTR [rbx],eax
0x1a81cc: add    al,BYTE PTR [rax]
0x1a81ce: add    eax,DWORD PTR [rdx]
0x1a81d0: add    BYTE PTR [rax+rax*1],al
0x1a81d3: add    eax,DWORD PTR [rax]
0x1a81d5: add    al,0x0
0x1a81d7: add    al,0x4
0x1a81d9: add    DWORD PTR [rbx],eax
0x1a81db: add    DWORD PTR [rsp+rax*1],eax
0x1a81de: add    al,0x4
0x1a81e0: add    BYTE PTR [rax],al
0x1a81e2: add    al,BYTE PTR [rcx+rax*1]
0x1a81e5: add    al,BYTE PTR [rdx+rax*1]
0x1a81e8: add    BYTE PTR [rbx],al
0x1a81ea: add    al,0x4
0x1a81ec: add    BYTE PTR [rax],al
0x1a81ee: add    DWORD PTR [rbx],eax
0x1a81f0: add    al,0x4
0x1a81f2: add    al,0x0
0x1a81f4: add    BYTE PTR [rdi],cl
0x1a81f6: (bad)
0x1a81f7: add    BYTE PTR [rbx-0x27ffe58c],cl
0x1a81fd: je     0x1401a8219
0x1a81ff: add    ah,bh
0x1a8201: je     0x1401a821d
0x1a8203: add    BYTE PTR [rsi*2+0x752a001a],cl
0x1a820a: sbb    al,BYTE PTR [rax]
0x1a820c: add    BYTE PTR [rcx],al
0x1a820e: add    al,BYTE PTR [rdx]
0x1a8210: add    DWORD PTR [rcx],eax
0x1a8212: add    eax,DWORD PTR [rcx]
0x1a8214: add    al,BYTE PTR [rcx]
0x1a8216: add    DWORD PTR [rcx],eax
0x1a8218: add    DWORD PTR [rbx],eax
0x1a821a: add    eax,DWORD PTR [rcx]
0x1a821c: add    al,0x2
0x1a821e: add    DWORD PTR [rcx+rax*1],eax
0x1a8221: add    DWORD PTR [rdx+rax*1],eax
0x1a8224: add    eax,DWORD PTR [rdx]
0x1a8226: add    DWORD PTR [rcx],eax
0x1a8228: add    al,BYTE PTR [rcx+rax*1]
0x1a822b: add    DWORD PTR [rcx],eax
0x1a822d: add    al,0x4
0x1a822f: add    al,BYTE PTR [rcx]
0x1a8231: add    DWORD PTR [rsp+rax*1],eax
0x1a8234: add    eax,DWORD PTR [rdx]
0x1a8236: add    DWORD PTR [rcx],eax
0x1a8238: add    al,BYTE PTR [rcx]
0x1a823a: add    al,BYTE PTR [rcx]
0x1a823c: add    eax,DWORD PTR [rcx+rax*1]
0x1a823f: add    al,0x1
0x1a8241: add    DWORD PTR [rdx],eax
0x1a8243: add    al,BYTE PTR [rdx]
0x1a8245: add    al,0x1
0x1a8247: add    al,0x2
0x1a8249: add    DWORD PTR [rcx],eax
0x1a824b: add    DWORD PTR [rcx],eax
0x1a824d: add    DWORD PTR [rdx],eax
0x1a824f: add    al,BYTE PTR [rdx]
0x1a8251: add    DWORD PTR [rcx],eax
0x1a8253: add    al,0x2
0x1a8255: add    al,0x1
0x1a8257: add    DWORD PTR [rdx],eax
0x1a8259: add    al,BYTE PTR [rsp+rax*1]
0x1a825c: add    al,BYTE PTR [rcx]
0x1a825e: add    DWORD PTR [rdx],eax
0x1a8260: add    al,BYTE PTR [rdx]
0x1a8262: add    al,0x2
0x1a8264: add    al,BYTE PTR [rcx]
0x1a8266: add    al,0x2
0x1a8268: add    al,0x4
0x1a826a: add    al,0x4
0x1a826c: add    al,BYTE PTR [rcx]
0x1a826e: add    DWORD PTR [rdx],eax
0x1a8270: add    al,0x1
0x1a8272: add    al,BYTE PTR [rdx]
0x1a8274: add    DWORD PTR [rdx],eax
0x1a8276: add    al,BYTE PTR [rdx+rax*1]
0x1a8279: add    al,0x2
0x1a827b: add    al,0x2
0x1a827d: add    DWORD PTR [rdx+rax*1],eax
0x1a8280: add    al,BYTE PTR [rdx]
0x1a8282: add    DWORD PTR [rdx+rax*1],eax
0x1a8285: add    al,BYTE PTR [rcx]
0x1a8287: add    al,0x2
0x1a8289: add    DWORD PTR [rcx+rax*1],eax
0x1a828c: add    al,BYTE PTR [rcx]
0x1a828e: add    al,BYTE PTR [rdx]
0x1a8290: add    al,BYTE PTR [rcx]
0x1a8292: add    al,0x2
0x1a8294: add    al,BYTE PTR [rdx]
0x1a8296: add    al,0x2
0x1a8298: add    al,0x2
0x1a829a: add    DWORD PTR [rcx],eax
0x1a829c: add    DWORD PTR [rsp+rax*1],eax
0x1a829f: add    al,0x4
0x1a82a1: add    DWORD PTR [rdx],eax
0x1a82a3: add    al,BYTE PTR [rcx+rax*1]
0x1a82a6: add    DWORD PTR [rdx+rax*1],eax
0x1a82a9: add    DWORD PTR [rdx],eax
0x1a82ab: add    al,BYTE PTR [rdx+rax*1]
0x1a82ae: add    DWORD PTR [rdx],eax
0x1a82b0: add    al,BYTE PTR [rsp+rax*1]
0x1a82b3: add    al,0x2
0x1a82b5: add    ah,BYTE PTR [rsi-0x70]
0x1a82b8: in     eax,0x75
0x1a82ba: sbb    al,BYTE PTR [rax]
0x1a82bc: mov    dh,BYTE PTR [rbp+0x1a]
0x1a82bf: add    BYTE PTR [rax+0x75],bl
0x1a82c2: sbb    al,BYTE PTR [rax]
0x1a82c4: iret
0x1a82c5: jne    0x1401a82e1
0x1a82c7: add    BYTE PTR [rcx-0x4ffe58b],bh
0x1a82cd: jne    0x1401a82e9
0x1a82cf: add    BYTE PTR [rcx+0x75],dh
0x1a82d2: sbb    al,BYTE PTR [rax]
0x1a82d4: movabs ds:0x1a7618001a75,eax
0x1a82dd: add    BYTE PTR [rcx],al
0x1a82df: add    DWORD PTR [rdx],eax
0x1a82e1: add    al,BYTE PTR [rbx]
0x1a82e3: add    al,0x2
0x1a82e5: add    eax,0x3040600
0x1a82ea: add    eax,DWORD PTR [rdx]
0x1a82ec: or     BYTE PTR [rdx],al
0x1a82ee: add    BYTE PTR [rax],cl
0x1a82f0: add    DWORD PTR [rip+0x2050208],eax        # 0x1421f84fe
0x1a82f6: (bad)
0x1a82f7: add    al,BYTE PTR [rcx]
0x1a82f9: or     BYTE PTR [rdx],al
0x1a82fb: add    al,BYTE PTR [rsi]
0x1a82fd: or     BYTE PTR [rax],cl
0x1a82ff: add    eax,DWORD PTR [rdx]
0x1a8301: (bad)
0x1a8302: or     BYTE PTR [rax],cl
0x1a8304: add    eax,DWORD PTR [rdx]
0x1a8306: add    eax,DWORD PTR [rdx]
0x1a8308: add    al,BYTE PTR [rbx]
0x1a830a: add    al,BYTE PTR [rbx]
0x1a830c: add    cl,BYTE PTR [rax]
0x1a830e: add    eax,0x1020608
0x1a8313: add    eax,DWORD PTR [rsi]
0x1a8315: or     BYTE PTR [rsi],al
0x1a8317: or     BYTE PTR [rsi],al
0x1a8319: add    al,BYTE PTR [rip+0x4040605]        # 0x1441e8924
0x1a831f: add    DWORD PTR [rsi],eax
0x1a8321: add    eax,DWORD PTR [rdx]
0x1a8323: or     BYTE PTR [rsi],al
0x1a8325: or     BYTE PTR [rsi],al
0x1a8327: add    al,BYTE PTR [rdx]
0x1a8329: add    DWORD PTR [rax],ecx
0x1a832b: add    eax,DWORD PTR [rdi]
0x1a832d: add    al,BYTE PTR [rdx]
0x1a832f: add    al,BYTE PTR [rsi]
0x1a8331: add    al,0x8
0x1a8333: (bad)
0x1a8334: add    eax,DWORD PTR [rax+rcx*1]
0x1a8337: add    ecx,DWORD PTR [rax]
0x1a8339: or     BYTE PTR [rax],cl
0x1a833b: or     BYTE PTR [rdx],al
0x1a833d: add    eax,0x6080202
0x1a8342: (bad)
0x1a8343: (bad)
0x1a8344: (bad)
0x1a8345: add    al,0x2
0x1a8347: or     BYTE PTR [rcx],al
0x1a8349: or     BYTE PTR [rcx],al
0x1a834b: or     BYTE PTR [rbx],al
0x1a834d: add    ecx,DWORD PTR [rax]
0x1a834f: add    al,BYTE PTR [rip+0x30406]        # 0x1401d875b
0x1a8355: add    DWORD PTR [rdx],eax
0x1a8357: or     BYTE PTR [rcx],al
0x1a8359: add    DWORD PTR [rcx+rax*1],eax
0x1a835c: add    al,BYTE PTR [rsi]
0x1a835e: add    al,BYTE PTR [rdx]
0x1a8360: add    eax,0x3020802
0x1a8365: (bad)
0x1a8366: or     BYTE PTR [rdx],al
0x1a8368: or     BYTE PTR [rip+0x8030303],al        # 0x1481d8671
0x1a836e: or     BYTE PTR [rax],cl
0x1a8370: or     BYTE PTR [rdi],al
0x1a8372: add    DWORD PTR [rcx],eax
0x1a8374: or     BYTE PTR [rax*1+0x2020608],al
0x1a837b: (bad)
0x1a837c: or     BYTE PTR [rip+0x8050402],al        # 0x1481f8784
0x1a8382: or     BYTE PTR [rax],cl
0x1a8384: add    al,BYTE PTR [rcx]
0x1a8386: xchg   ax,ax
0x1a8388: push   rsi
0x1a8389: jl     0x1401a83a5
0x1a838b: add    BYTE PTR [rdi+0x77],cl
0x1a838e: sbb    al,BYTE PTR [rax]
0x1a8390: addr32 ja 0x1401a83ad
0x1a8393: add    BYTE PTR [rbx+0x77],dh
0x1a8396: sbb    al,BYTE PTR [rax]
0x1a8398: jg     0x1401a8411
0x1a839a: sbb    al,BYTE PTR [rax]
0x1a839c: mov    esi,DWORD PTR [rdi+0x1a]
0x1a839f: add    BYTE PTR [rdi+0x7d001a77],dl
0x1a83a5: jbe    0x1401a83c1
0x1a83a7: add    BYTE PTR [rbx-0x50ffe589],ah
0x1a83ad: ja     0x1401a83c9
0x1a83af: add    BYTE PTR [rbx-0x38ffe589],bh
0x1a83b5: ja     0x1401a83d1
0x1a83b7: add    bl,dl
0x1a83b9: ja     0x1401a83d5
0x1a83bb: add    BYTE PTR [rdi],dl
0x1a83bd: jl     0x1401a83d9
0x1a83bf: add    bh,bl
0x1a83c1: ja     0x1401a83dd
0x1a83c3: add    BYTE PTR [rip+0x66001a76],dh        # 0x1a61a9e3f
0x1a83c9: jl     0x1401a83e5
0x1a83cb: add    bl,ch
0x1a83cd: ja     0x1401a83e9
0x1a83cf: add    bh,dh
0x1a83d1: ja     0x1401a83ed
0x1a83d3: add    BYTE PTR [rsi+0x7c],ah
0x1a83d6: sbb    al,BYTE PTR [rax]
0x1a83d8: add    edi,DWORD PTR [rax+0x1a]
0x1a83db: add    BYTE PTR [rdi],cl
0x1a83dd: js     0x1401a83f9
0x1a83df: add    BYTE PTR [rsi+0x7c],ah
0x1a83e2: sbb    al,BYTE PTR [rax]
0x1a83e4: sbb    edi,DWORD PTR [rax+0x1a]
0x1a83e7: add    BYTE PTR [rdi],ah
0x1a83e9: js     0x1401a8405
0x1a83eb: add    BYTE PTR [rbx],dh
0x1a83ed: js     0x1401a8409
0x1a83ef: add    BYTE PTR [rbx],ch
0x1a83f1: ja     0x1401a840d
0x1a83f3: add    BYTE PTR [rdi],bh
0x1a83f5: js     0x1401a8411
0x1a83f7: add    BYTE PTR [rbx+0x78],cl
0x1a83fa: sbb    al,BYTE PTR [rax]
0x1a83fc: data16 jl 0x1401a8419
0x1a83ff: add    BYTE PTR [rdi+0x78],dl
0x1a8402: sbb    al,BYTE PTR [rax]
0x1a8404: movsxd edi,DWORD PTR [rax+0x1a]
0x1a8407: add    BYTE PTR [rdi+0x78],ch
0x1a840a: sbb    al,BYTE PTR [rax]
0x1a840c: data16 jl 0x1401a8429
0x1a840f: add    BYTE PTR [rsi+0x7c],ah
0x1a8412: sbb    al,BYTE PTR [rax]
0x1a8414: and    BYTE PTR [rdx+rbx*1+0x0],bh
0x1a8418: jnp    0x1401a8492
0x1a841a: sbb    al,BYTE PTR [rax]
0x1a841c: xchg   DWORD PTR [rax+0x1a],edi
0x1a841f: add    BYTE PTR [rsi+0x7c],ah
0x1a8422: sbb    al,BYTE PTR [rax]
0x1a8424: data16 jl 0x1401a8441
0x1a8427: add    BYTE PTR [rbx-0x60ffe588],dl
0x1a842d: js     0x1401a8449
0x1a842f: add    BYTE PTR [rbx-0x48ffe588],ch
0x1a8435: js     0x1401a8451
0x1a8437: add    bl,al
0x1a8439: js     0x1401a8455
0x1a843b: add    bh,cl
0x1a843d: js     0x1401a8459
0x1a843f: add    bl,bl
0x1a8441: js     0x1401a845d
0x1a8443: add    bh,ah
0x1a8445: js     0x1401a8461
0x1a8447: add    BYTE PTR [rdx],dh
0x1a8449: jl     0x1401a8465
0x1a844b: add    BYTE PTR [rsi+0x7c],ah
0x1a844e: sbb    al,BYTE PTR [rax]
0x1a8450: repz js 0x1401a846d
0x1a8453: add    BYTE PTR [rsi+0x7c],ah
0x1a8456: sbb    al,BYTE PTR [rax]
0x1a8458: (bad)
0x1a8459: js     0x1401a8475
0x1a845b: add    BYTE PTR [rbx],cl
0x1a845d: jns    0x1401a8479
0x1a845f: add    BYTE PTR [rdi],dl
0x1a8461: jns    0x1401a847d
0x1a8463: add    BYTE PTR [rbx],ah
0x1a8465: jns    0x1401a8481
0x1a8467: add    BYTE PTR [rdi],ch
0x1a8469: jns    0x1401a8485
0x1a846b: add    BYTE PTR [rsi+0x7c],ah
0x1a846e: sbb    al,BYTE PTR [rax]
0x1a8470: cmp    edi,DWORD PTR [rdx+rbx*1+0x0]
0x1a8474: data16 jl 0x1401a8491
0x1a8477: add    BYTE PTR [rbp+0x7c],cl
0x1a847a: sbb    al,BYTE PTR [rax]
0x1a847c: cmp    edi,DWORD PTR [rcx+0x1a]
0x1a847f: add    bl,bh
0x1a8481: jbe    0x1401a849d
0x1a8483: add    BYTE PTR [rdi+0x79],al
0x1a8486: sbb    al,BYTE PTR [rax]
0x1a8488: sub    DWORD PTR [rdx+rbx*1+0x0],edi
0x1a848c: push   rbx
0x1a848d: jns    0x1401a84a9
0x1a848f: add    BYTE PTR [rdi+0x79],bl
0x1a8492: sbb    al,BYTE PTR [rax]
0x1a8494: gs jbe 0x1401a84b1
0x1a8497: add    BYTE PTR [rbx+0x79],ch
0x1a849a: sbb    al,BYTE PTR [rax]
0x1a849c: ja     0x1401a8517
0x1a849e: sbb    al,BYTE PTR [rax]
0x1a84a0: cmp    DWORD PTR [rcx+0x1a],0x0
0x1a84a4: data16 jl 0x1401a84c1
0x1a84a7: add    BYTE PTR [rdi],al
0x1a84a9: ja     0x1401a84c5
0x1a84ab: add    BYTE PTR [rsi+0x7c],ah
0x1a84ae: sbb    al,BYTE PTR [rax]
0x1a84b0: (bad)
0x1a84b1: jns    0x1401a84cd
0x1a84b3: add    BYTE PTR [rbx-0x58ffe587],bl
0x1a84b9: jns    0x1401a84d5
0x1a84bb: add    BYTE PTR [rbx+0x66001a79],dh
0x1a84c1: jl     0x1401a84dd
0x1a84c3: add    BYTE PTR [rbp-0x5effe58a],ch
0x1a84c9: jbe    0x1401a84e5
0x1a84cb: add    BYTE PTR [rbp+0x76],cl
0x1a84ce: sbb    al,BYTE PTR [rax]
0x1a84d0: pop    rcx
0x1a84d1: jbe    0x1401a84ed
0x1a84d3: add    BYTE PTR [rdi-0x34ffe587],bh
0x1a84d9: jns    0x1401a84f5
0x1a84db: add    bh,dl
0x1a84dd: jns    0x1401a84f9
0x1a84df: add    BYTE PTR [rsi+0x7c],ah
0x1a84e2: sbb    al,BYTE PTR [rax]
0x1a84e4: jrcxz  0x1401a855f
0x1a84e6: sbb    al,BYTE PTR [rax]
0x1a84e8: out    dx,eax
0x1a84e9: jns    0x1401a8505
0x1a84eb: add    BYTE PTR [rbp+0x66001a76],dl
0x1a84f1: jl     0x1401a850d
0x1a84f3: add    bl,bh
0x1a84f5: jns    0x1401a8511
0x1a84f7: add    BYTE PTR [rsi+0x7c],ah
0x1a84fa: sbb    al,BYTE PTR [rax]
0x1a84fc: data16 jl 0x1401a8519
0x1a84ff: add    BYTE PTR [rsi+0x7c],ah
0x1a8502: sbb    al,BYTE PTR [rax]
0x1a8504: data16 jl 0x1401a8521
0x1a8507: add    BYTE PTR [rdi],al
0x1a8509: jp     0x1401a8525
0x1a850b: add    BYTE PTR [rbx],dl
0x1a850d: jp     0x1401a8529
0x1a850f: add    BYTE PTR [rdi],bl
0x1a8511: jp     0x1401a852d
0x1a8513: add    BYTE PTR [rbx],ch
0x1a8515: jp     0x1401a8531
0x1a8517: add    BYTE PTR [rsi+0x7c],ah
0x1a851a: sbb    al,BYTE PTR [rax]
0x1a851c: (bad)
0x1a851d: jp     0x1401a8539
0x1a851f: add    BYTE PTR [rbx+0x7a],al
0x1a8522: sbb    al,BYTE PTR [rax]
0x1a8524: (bad)
0x1a8525: ja     0x1401a8541
0x1a8527: add    BYTE PTR [rdi+0x7a],cl
0x1a852a: sbb    al,BYTE PTR [rax]
0x1a852c: pop    rbx
0x1a852d: jp     0x1401a8549
0x1a852f: add    BYTE PTR [rdi+0x7a],ah
0x1a8532: sbb    al,BYTE PTR [rax]
0x1a8534: data16 jl 0x1401a8551
0x1a8537: add    BYTE PTR [rdi],dh
0x1a8539: ja     0x1401a8555
0x1a853b: add    BYTE PTR [rsi+0x7c],ah
0x1a853e: sbb    al,BYTE PTR [rax]
0x1a8540: jae    0x1401a85bc
0x1a8542: sbb    al,BYTE PTR [rax]
0x1a8544: data16 jl 0x1401a8561
0x1a8547: add    BYTE PTR [rdi+0x7a],bh
0x1a854a: sbb    al,BYTE PTR [rax]
0x1a854c: mov    edi,DWORD PTR [rdx+0x1a]
0x1a854f: add    BYTE PTR [rsi+0x7c],ah
0x1a8552: sbb    al,BYTE PTR [rax]
0x1a8554: xchg   edi,eax
0x1a8555: jp     0x1401a8571
0x1a8557: add    BYTE PTR [rbx-0x50ffe586],ah
0x1a855d: jp     0x1401a8579
0x1a855f: add    BYTE PTR [rbx-0x38ffe586],bh
0x1a8565: jp     0x1401a8581
0x1a8567: add    al,ch
0x1a8569: jp     0x1401a8585
0x1a856b: add    ah,dh
0x1a856d: jp     0x1401a8589
0x1a856f: add    BYTE PTR [rsp+rdi*2+0x1a],al
0x1a8573: add    BYTE PTR [rsi+0x7c],ah
0x1a8576: sbb    al,BYTE PTR [rax]
0x1a8578: add    BYTE PTR [rbx+0x1a],bh
0x1a857b: add    BYTE PTR [rbx+rdi*2],cl
0x1a857e: sbb    al,BYTE PTR [rax]
0x1a8580: fidiv  DWORD PTR [rsi+0x1a]
0x1a8583: add    BYTE PTR [rax],bl
0x1a8585: jnp    0x1401a85a1
0x1a8587: add    BYTE PTR [rbx+rdi*2],ah
0x1a858a: sbb    al,BYTE PTR [rax]
0x1a858c: xor    BYTE PTR [rbx+0x1a],bh
0x1a858f: add    BYTE PTR [rbx+rdi*2],bh
0x1a8592: sbb    al,BYTE PTR [rax]
0x1a8594: rex.W jnp 0x1401a85b1
0x1a8597: add    BYTE PTR [rbx+rdi*2+0x1a],dl
0x1a859b: add    BYTE PTR [rax+0x7b],ah
0x1a859e: sbb    al,BYTE PTR [rax]
0x1a85a0: data16 jl 0x1401a85bd
0x1a85a3: add    BYTE PTR [rax+0x7b],bh
0x1a85a6: sbb    al,BYTE PTR [rax]
0x1a85a8: adc    esi,DWORD PTR [rdi+0x1a]
0x1a85ab: add    BYTE PTR [rcx+0x76],al
0x1a85ae: sbb    al,BYTE PTR [rax]
0x1a85b0: data16 jl 0x1401a85cd
0x1a85b3: add    BYTE PTR [rbx+rdi*2+0x7c66001a],al
0x1a85ba: sbb    al,BYTE PTR [rax]
0x1a85bc: nop
0x1a85bd: jnp    0x1401a85d9
0x1a85bf: add    BYTE PTR [rbx+rdi*2+0x7ba8001a],bl
0x1a85c6: sbb    al,BYTE PTR [rax]
0x1a85c8: mov    DWORD PTR [rsi+0x1a],esi
0x1a85cb: add    BYTE PTR [rsi+0x7c],ah
0x1a85ce: sbb    al,BYTE PTR [rax]
0x1a85d0: data16 jl 0x1401a85ed
0x1a85d3: add    BYTE PTR [rsi+0x7c],ah
0x1a85d6: sbb    al,BYTE PTR [rax]
0x1a85d8: data16 jl 0x1401a85f5
0x1a85db: add    BYTE PTR [rcx+0x76],dh
0x1a85de: sbb    al,BYTE PTR [rax]
0x1a85e0: mov    ah,0x7b
0x1a85e2: sbb    al,BYTE PTR [rax]
0x1a85e4: sar    BYTE PTR [rbx+0x1a],0x0
0x1a85e8: data16 jl 0x1401a8605
0x1a85eb: add    ah,cl
0x1a85ed: jnp    0x1401a8609
0x1a85ef: add    al,bl
0x1a85f1: jnp    0x1401a860d
0x1a85f3: add    BYTE PTR [rsi+0x7c],ah
0x1a85f6: sbb    al,BYTE PTR [rax]
0x1a85f8: (bad)
0x1a85f9: jbe    0x1401a8615
0x1a85fb: add    cl,ah
0x1a85fd: jnp    0x1401a8619
0x1a85ff: add    dl,ch
0x1a8601: jnp    0x1401a861d
0x1a8603: add    BYTE PTR [rbx+0x77],al
0x1a8606: sbb    al,BYTE PTR [rax]
0x1a8608: data16 jl 0x1401a8625
0x1a860b: add    bl,dh
0x1a860d: jnp    0x1401a8629
0x1a860f: add    ah,bh
0x1a8611: jnp    0x1401a862d
0x1a8613: add    BYTE PTR [rip+0xe001a7c],al        # 0x14e1aa095
0x1a8619: jl     0x1401a8635
0x1a861b: add    BYTE PTR [rsi+0x7c],ah
0x1a861e: sbb    al,BYTE PTR [rax]
0x1a8620: data16 jl 0x1401a863d
0x1a8623: add    BYTE PTR [rsi+0x7c],ah
0x1a8626: sbb    al,BYTE PTR [rax]
0x1a8628: ins    BYTE PTR [rdi],dx
0x1a8629: jnp    0x1401a8645
0x1a862b: add    BYTE PTR [rbx+0x77],bl
0x1a862e: sbb    al,BYTE PTR [rax]
0x1a8630: ret
0x1a8631: jl     0x1401a864d
0x1a8633: add    BYTE PTR [rdx-0x4effe584],bh
0x1a8639: jl     0x1401a8655
0x1a863b: add    bl,al
0x1a863d: jl     0x1401a8659
0x1a863f: add    BYTE PTR [rax],al
0x1a8641: add    BYTE PTR [rax],al
0x1a8643: add    DWORD PTR [rcx],eax
0x1a8645: add    al,BYTE PTR [rdx]
0x1a8647: add    DWORD PTR [rax],eax
0x1a8649: add    BYTE PTR [rax],al
0x1a864b: add    DWORD PTR [rcx],eax
0x1a864d: add    al,BYTE PTR [rcx]
0x1a864f: add    eax,DWORD PTR [rcx]
0x1a8651: add    BYTE PTR [rbx],al
0x1a8653: add    BYTE PTR [rax],al
0x1a8655: add    eax,DWORD PTR [rcx]
0x1a8657: add    BYTE PTR [rcx],al
0x1a8659: add    BYTE PTR [rcx],al
0x1a865b: add    BYTE PTR [rbx],al
0x1a865d: add    DWORD PTR [rcx],eax
0x1a865f: add    BYTE PTR [rbx],al
0x1a8661: add    eax,DWORD PTR [rcx]
0x1a8663: add    DWORD PTR [rax],eax
0x1a8665: add    eax,DWORD PTR [rbx]
0x1a8667: add    DWORD PTR [rcx],eax
0x1a8669: add    DWORD PTR [rcx],eax
0x1a866b: add    DWORD PTR [rdx],eax
0x1a866d: add    DWORD PTR [rdx],eax
0x1a866f: add    DWORD PTR [rbx],eax
0x1a8671: add    BYTE PTR [rbx],al
0x1a8673: add    BYTE PTR [rcx],al
0x1a8675: add    BYTE PTR [rcx],al
0x1a8677: add    BYTE PTR [rbx],al
0x1a8679: add    BYTE PTR [rbx],al
0x1a867b: add    BYTE PTR [rcx],al
0x1a867d: add    BYTE PTR [rax],al
0x1a867f: add    BYTE PTR [rdx],al
0x1a8681: add    al,BYTE PTR [rax]
0x1a8683: add    BYTE PTR [rdx],al
0x1a8685: add    DWORD PTR [rbx],eax
0x1a8687: add    BYTE PTR [rbx],al
0x1a8689: add    BYTE PTR [rcx],al
0x1a868b: add    DWORD PTR [rax],eax
0x1a868d: add    eax,DWORD PTR [rcx]
0x1a868f: add    BYTE PTR [rcx],al
0x1a8691: add    DWORD PTR [rcx],eax
0x1a8693: add    BYTE PTR [rcx],al
0x1a8695: add    eax,DWORD PTR [rax]
0x1a8697: add    DWORD PTR [rdx],eax
0x1a8699: add    eax,DWORD PTR [rcx]
0x1a869b: add    eax,DWORD PTR [rbx]
0x1a869d: add    eax,DWORD PTR [rbx]
0x1a869f: add    DWORD PTR [rax],eax
0x1a86a1: add    DWORD PTR [rcx],eax
0x1a86a3: add    eax,DWORD PTR [rax]
0x1a86a5: add    BYTE PTR [rax],al
0x1a86a7: add    BYTE PTR [rcx],al
0x1a86a9: add    DWORD PTR [rbx],eax
0x1a86ab: add    BYTE PTR [rbx],al
0x1a86ad: add    BYTE PTR [rbx],al
0x1a86af: add    DWORD PTR [rcx],eax
0x1a86b1: add    eax,DWORD PTR [rcx]
0x1a86b3: add    BYTE PTR [rax],al
0x1a86b5: add    DWORD PTR [rdx],eax
0x1a86b7: add    BYTE PTR [rax],al
0x1a86b9: add    DWORD PTR [rbx],eax
0x1a86bb: add    BYTE PTR [rax],al
0x1a86bd: add    al,BYTE PTR [rax]
0x1a86bf: add    DWORD PTR [rax],eax
0x1a86c1: add    DWORD PTR [rcx],eax
0x1a86c3: add    DWORD PTR [rcx],eax
0x1a86c5: add    eax,DWORD PTR [rcx]
0x1a86c7: add    DWORD PTR [rax],eax
0x1a86c9: add    eax,DWORD PTR [rcx]
0x1a86cb: add    eax,DWORD PTR [rax]
0x1a86cd: add    al,BYTE PTR [rcx]
0x1a86cf: add    al,BYTE PTR [rbx]
0x1a86d1: add    eax,DWORD PTR [rbx]
0x1a86d3: add    eax,DWORD PTR [rcx]
0x1a86d5: add    BYTE PTR [rax],al
0x1a86d7: add    eax,DWORD PTR [rdx]
0x1a86d9: add    BYTE PTR [rbx],al
0x1a86db: add    BYTE PTR [rcx],al
0x1a86dd: add    DWORD PTR [rcx],eax
0x1a86df: add    eax,DWORD PTR [rax]
0x1a86e1: add    DWORD PTR [rdx],eax
0x1a86e3: add    BYTE PTR [rbx],al
0x1a86e5: add    eax,DWORD PTR [rbx]
0x1a86e7: add    DWORD PTR [rax],eax
