0x1401a5b00: mov    QWORD PTR [rsp+0x18],rbx
0x1401a5b05: push   rbp
0x1401a5b06: push   rsi
0x1401a5b07: push   rdi
0x1401a5b08: push   r12
0x1401a5b0a: push   r13
0x1401a5b0c: push   r14
0x1401a5b0e: push   r15
0x1401a5b10: lea    rbp,[rsp-0x50]
0x1401a5b15: sub    rsp,0x150
0x1401a5b1c: mov    rax,QWORD PTR [rip+0x16f051d]        # 0x141896040
0x1401a5b23: xor    rax,rsp
0x1401a5b26: mov    QWORD PTR [rbp+0x40],rax
0x1401a5b2a: mov    r14,rdx
0x1401a5b2d: mov    QWORD PTR [rsp+0x40],rdx
0x1401a5b32: mov    rdi,rcx
0x1401a5b35: mov    QWORD PTR [rsp+0x48],rcx
0x1401a5b3a: call   QWORD PTR [rip+0x143a6a8]        # 0x1415e01e8
0x1401a5b40: mov    DWORD PTR [rdi+0x110],eax
0x1401a5b46: lea    rdx,[rdi+0x114]
0x1401a5b4d: xorps  xmm0,xmm0
0x1401a5b50: movups XMMWORD PTR [rdx],xmm0
0x1401a5b53: xorps  xmm1,xmm1
0x1401a5b56: movups XMMWORD PTR [rdi+0x124],xmm1
0x1401a5b5d: xor    r15d,r15d
0x1401a5b60: mov    QWORD PTR [rsp+0x20],r15
0x1401a5b65: xor    r9d,r9d
0x1401a5b68: xor    r8d,r8d
0x1401a5b6b: mov    rcx,r14
0x1401a5b6e: call   0x141345550
0x1401a5b73: lea    rdx,[rdi+0x124]
0x1401a5b7a: mov    rcx,r14
0x1401a5b7d: call   0x1413457a0
0x1401a5b82: mov    DWORD PTR [rdi+0x830],r15d
0x1401a5b89: mov    DWORD PTR [rdi+0xf30],r15d
0x1401a5b90: mov    DWORD PTR [rdi+0x1630],r15d
0x1401a5b97: mov    rax,QWORD PTR [r14+0xa98]
0x1401a5b9e: test   rax,rax
0x1401a5ba1: je     0x1401a5ed1
0x1401a5ba7: mov    r10,QWORD PTR [rax+0x218]
0x1401a5bae: mov    QWORD PTR [rsp+0x38],r10
0x1401a5bb3: mov    rax,QWORD PTR [rax+0x220]
0x1401a5bba: mov    QWORD PTR [rsp+0x50],rax
0x1401a5bbf: lea    r8,[rsp+0x50]
0x1401a5bc4: lea    rdx,[rsp+0x31]
0x1401a5bc9: lea    rcx,[rsp+0x38]
0x1401a5bce: call   0x14006edb0
0x1401a5bd3: cmp    BYTE PTR [rax],r15b
0x1401a5bd6: jge    0x1401a5ed1
0x1401a5bdc: lea    r14,[rip+0xffffffffffe5a41d]        # 0x140000000
0x1401a5be3: mov    rdx,QWORD PTR [r10]
0x1401a5be6: movsx  rax,WORD PTR [rdx]
0x1401a5bea: cmp    eax,0x88
0x1401a5bef: ja     0x1401a5e2c
0x1401a5bf5: movzx  eax,BYTE PTR [r14+rax*1+0x1a7fb0]
0x1401a5bfe: mov    ecx,DWORD PTR [r14+rax*4+0x1a7fa4]
0x1401a5c06: add    rcx,r14
0x1401a5c09: jmp    rcx
0x1401a5c0b: mov    eax,DWORD PTR [rdx+0x4]
0x1401a5c0e: mov    esi,eax
0x1401a5c10: sub    esi,DWORD PTR [rdx+0x10]
0x1401a5c13: mov    ebx,r15d
0x1401a5c16: test   eax,eax
0x1401a5c18: cmovns ebx,eax
0x1401a5c1b: mov    ecx,r15d
0x1401a5c1e: mov    r11,r15
0x1401a5c21: mov    edx,DWORD PTR [rdi+0xf30]
0x1401a5c27: test   edx,edx
0x1401a5c29: jle    0x1401a5c43
0x1401a5c2b: lea    rax,[rdi+0xa88]
0x1401a5c32: cmp    DWORD PTR [rax],ebx
0x1401a5c34: jl     0x1401a5c8a
0x1401a5c36: inc    ecx
0x1401a5c38: inc    r11
0x1401a5c3b: add    rax,0x4
0x1401a5c3f: cmp    ecx,edx
0x1401a5c41: jl     0x1401a5c32
0x1401a5c43: movsxd rdx,DWORD PTR [rdi+0xf30]
0x1401a5c4a: cmp    edx,0x95
0x1401a5c50: jge    0x1401a5ea6
0x1401a5c56: mov    rax,QWORD PTR [r10]
0x1401a5c59: movsx  ecx,WORD PTR [rax]
0x1401a5c5c: mov    DWORD PTR [rdi+rdx*4+0x834],ecx
0x1401a5c63: movsxd rax,DWORD PTR [rdi+0xf30]
0x1401a5c6a: mov    DWORD PTR [rdi+rax*4+0xa88],ebx
0x1401a5c71: movsxd rax,DWORD PTR [rdi+0xf30]
0x1401a5c78: mov    DWORD PTR [rdi+rax*4+0xcdc],esi
0x1401a5c7f: inc    DWORD PTR [rdi+0xf30]
0x1401a5c85: jmp    0x1401a5ea6
0x1401a5c8a: lea    eax,[rdx-0x1]
0x1401a5c8d: movsxd r9,eax
0x1401a5c90: cmp    r9,r11
0x1401a5c93: jl     0x1401a5cd7
0x1401a5c95: lea    rcx,[rdi+0xa8c]
0x1401a5c9c: lea    rcx,[rcx+r9*4]
0x1401a5ca0: sub    r9,r11
0x1401a5ca3: inc    r9
0x1401a5ca6: cmp    edx,0x95
0x1401a5cac: jge    0x1401a5ccb
0x1401a5cae: mov    eax,DWORD PTR [rcx-0x258]
0x1401a5cb4: mov    DWORD PTR [rcx-0x254],eax
0x1401a5cba: mov    eax,DWORD PTR [rcx-0x4]
0x1401a5cbd: mov    DWORD PTR [rcx],eax
0x1401a5cbf: mov    eax,DWORD PTR [rcx+0x250]
0x1401a5cc5: mov    DWORD PTR [rcx+0x254],eax
0x1401a5ccb: add    rcx,0xfffffffffffffffc
0x1401a5ccf: dec    edx
0x1401a5cd1: sub    r9,0x1
0x1401a5cd5: jne    0x1401a5ca6
0x1401a5cd7: mov    rax,QWORD PTR [r10]
0x1401a5cda: movsx  ecx,WORD PTR [rax]
0x1401a5cdd: mov    DWORD PTR [rdi+r11*4+0x834],ecx
0x1401a5ce5: mov    DWORD PTR [rdi+r11*4+0xa88],ebx
0x1401a5ced: mov    DWORD PTR [rdi+r11*4+0xcdc],esi
0x1401a5cf5: mov    eax,DWORD PTR [rdi+0xf30]
0x1401a5cfb: cmp    eax,0x95
0x1401a5d00: jge    0x1401a5ea6
0x1401a5d06: inc    eax
0x1401a5d08: mov    DWORD PTR [rdi+0xf30],eax
0x1401a5d0e: jmp    0x1401a5ea6
0x1401a5d13: mov    ecx,DWORD PTR [rdx+0x4]
0x1401a5d16: mov    esi,ecx
0x1401a5d18: sub    esi,DWORD PTR [rdx+0x10]
0x1401a5d1b: mov    ebx,r15d
0x1401a5d1e: test   ecx,ecx
0x1401a5d20: cmovns ebx,ecx
0x1401a5d23: mov    ecx,r15d
0x1401a5d26: mov    r11,r15
0x1401a5d29: mov    edx,DWORD PTR [rdi+0x830]
0x1401a5d2f: test   edx,edx
0x1401a5d31: jle    0x1401a5d51
0x1401a5d33: lea    rax,[rdi+0x388]
0x1401a5d3a: nop    WORD PTR [rax+rax*1+0x0]
0x1401a5d40: cmp    DWORD PTR [rax],ebx
0x1401a5d42: jl     0x1401a5d98
0x1401a5d44: inc    ecx
0x1401a5d46: inc    r11
0x1401a5d49: add    rax,0x4
0x1401a5d4d: cmp    ecx,edx
0x1401a5d4f: jl     0x1401a5d40
0x1401a5d51: movsxd rdx,DWORD PTR [rdi+0x830]
0x1401a5d58: cmp    edx,0x95
0x1401a5d5e: jge    0x1401a5ea6
0x1401a5d64: mov    rax,QWORD PTR [r10]
0x1401a5d67: movsx  ecx,WORD PTR [rax]
0x1401a5d6a: mov    DWORD PTR [rdi+rdx*4+0x134],ecx
0x1401a5d71: movsxd rax,DWORD PTR [rdi+0x830]
0x1401a5d78: mov    DWORD PTR [rdi+rax*4+0x388],ebx
0x1401a5d7f: movsxd rax,DWORD PTR [rdi+0x830]
0x1401a5d86: mov    DWORD PTR [rdi+rax*4+0x5dc],esi
0x1401a5d8d: inc    DWORD PTR [rdi+0x830]
0x1401a5d93: jmp    0x1401a5ea6
0x1401a5d98: mov    r8d,DWORD PTR [rdi+0x830]
0x1401a5d9f: lea    r9,[r8-0x1]
0x1401a5da3: cmp    r9,r11
0x1401a5da6: jl     0x1401a5df3
0x1401a5da8: lea    rcx,[rdi+0x38c]
0x1401a5daf: lea    rcx,[rcx+r9*4]
0x1401a5db3: sub    r9,r11
0x1401a5db6: inc    r9
0x1401a5db9: nop    DWORD PTR [rax+0x0]
0x1401a5dc0: cmp    r8d,0x95
0x1401a5dc7: jge    0x1401a5de6
0x1401a5dc9: mov    eax,DWORD PTR [rcx-0x258]
0x1401a5dcf: mov    DWORD PTR [rcx-0x254],eax
0x1401a5dd5: mov    eax,DWORD PTR [rcx-0x4]
0x1401a5dd8: mov    DWORD PTR [rcx],eax
0x1401a5dda: mov    eax,DWORD PTR [rcx+0x250]
0x1401a5de0: mov    DWORD PTR [rcx+0x254],eax
0x1401a5de6: add    rcx,0xfffffffffffffffc
0x1401a5dea: dec    r8d
0x1401a5ded: sub    r9,0x1
0x1401a5df1: jne    0x1401a5dc0
0x1401a5df3: mov    rax,QWORD PTR [r10]
0x1401a5df6: movsx  ecx,WORD PTR [rax]
0x1401a5df9: mov    DWORD PTR [rdi+r11*4+0x134],ecx
0x1401a5e01: mov    DWORD PTR [rdi+r11*4+0x388],ebx
0x1401a5e09: mov    DWORD PTR [rdi+r11*4+0x5dc],esi
0x1401a5e11: mov    eax,DWORD PTR [rdi+0x830]
0x1401a5e17: cmp    eax,0x95
0x1401a5e1c: jge    0x1401a5ea6
0x1401a5e22: inc    eax
0x1401a5e24: mov    DWORD PTR [rdi+0x830],eax
0x1401a5e2a: jmp    0x1401a5ea6
0x1401a5e2c: mov    eax,DWORD PTR [rdx+0x4]
0x1401a5e2f: mov    esi,eax
0x1401a5e31: sub    esi,DWORD PTR [rdx+0x10]
0x1401a5e34: mov    ebx,r15d
0x1401a5e37: test   eax,eax
0x1401a5e39: cmovns ebx,eax
0x1401a5e3c: mov    ecx,r15d
0x1401a5e3f: mov    r11,r15
0x1401a5e42: mov    edx,DWORD PTR [rdi+0x1630]
0x1401a5e48: test   edx,edx
0x1401a5e4a: jle    0x1401a5e68
0x1401a5e4c: lea    rax,[rdi+0x1188]
0x1401a5e53: cmp    DWORD PTR [rax],ebx
0x1401a5e55: jl     0x1401a61e7
0x1401a5e5b: inc    ecx
0x1401a5e5d: inc    r11
0x1401a5e60: add    rax,0x4
0x1401a5e64: cmp    ecx,edx
0x1401a5e66: jl     0x1401a5e53
0x1401a5e68: movsxd rdx,DWORD PTR [rdi+0x1630]
0x1401a5e6f: cmp    edx,0x95
0x1401a5e75: jge    0x1401a5ea6
0x1401a5e77: mov    rax,QWORD PTR [r10]
0x1401a5e7a: movsx  ecx,WORD PTR [rax]
0x1401a5e7d: mov    DWORD PTR [rdi+rdx*4+0xf34],ecx
0x1401a5e84: movsxd rax,DWORD PTR [rdi+0x1630]
0x1401a5e8b: mov    DWORD PTR [rdi+rax*4+0x1188],ebx
0x1401a5e92: movsxd rax,DWORD PTR [rdi+0x1630]
0x1401a5e99: mov    DWORD PTR [rdi+rax*4+0x13dc],esi
0x1401a5ea0: inc    DWORD PTR [rdi+0x1630]
0x1401a5ea6: add    r10,0x8
0x1401a5eaa: mov    QWORD PTR [rsp+0x38],r10
0x1401a5eaf: lea    r8,[rsp+0x50]
0x1401a5eb4: lea    rdx,[rsp+0x31]
0x1401a5eb9: lea    rcx,[rsp+0x38]
0x1401a5ebe: call   0x14006edb0
0x1401a5ec3: cmp    BYTE PTR [rax],r15b
0x1401a5ec6: jl     0x1401a5be3
0x1401a5ecc: mov    r14,QWORD PTR [rsp+0x40]
0x1401a5ed1: lea    r12,[rdi+0x1638]
0x1401a5ed8: mov    rcx,r12
0x1401a5edb: call   0x14006f220
0x1401a5ee0: lea    rax,[rdi+0x1650]
0x1401a5ee7: mov    QWORD PTR [rsp+0x60],rax
0x1401a5eec: mov    rcx,rax
0x1401a5eef: call   0x14006f220
0x1401a5ef4: lea    r13,[rdi+0x1668]
0x1401a5efb: mov    rcx,r13
0x1401a5efe: call   0x1401ba0b0
0x1401a5f03: mov    rcx,r14
0x1401a5f06: call   0x1413ae000
0x1401a5f0b: mov    QWORD PTR [rsp+0x58],rax
0x1401a5f10: test   rax,rax
0x1401a5f13: je     0x1401a6167
0x1401a5f19: mov    rbx,QWORD PTR [rax+0xe8]
0x1401a5f20: mov    QWORD PTR [rsp+0x38],rbx
0x1401a5f25: mov    rcx,QWORD PTR [rax+0xf0]
0x1401a5f2c: mov    QWORD PTR [rsp+0x50],rcx
0x1401a5f31: lea    r8,[rsp+0x50]
0x1401a5f36: lea    rdx,[rsp+0x30]
0x1401a5f3b: lea    rcx,[rsp+0x38]
0x1401a5f40: call   0x14006edb0
0x1401a5f45: cmp    BYTE PTR [rax],r15b
0x1401a5f48: jge    0x1401a6011
0x1401a5f4e: mov    rdi,QWORD PTR [rsp+0x60]
0x1401a5f53: mov    rcx,QWORD PTR [rbx]
0x1401a5f56: mov    rax,QWORD PTR [rcx]
0x1401a5f59: call   QWORD PTR [rax]
0x1401a5f5b: cmp    ax,0xa
0x1401a5f5f: jne    0x1401a5fe6
0x1401a5f65: mov    r15,QWORD PTR [rbx]
0x1401a5f68: mov    edx,DWORD PTR [r15+0x8]
0x1401a5f6c: lea    rcx,[rip+0x2225775]        # 0x1423cb6e8
0x1401a5f73: call   0x14007da80
0x1401a5f78: mov    r14,rax
0x1401a5f7b: mov    QWORD PTR [rsp+0x60],rax
0x1401a5f80: test   rax,rax
0x1401a5f83: je     0x1401a5fe6
0x1401a5f85: mov    rdx,QWORD PTR [r15]
0x1401a5f88: mov    rcx,r15
0x1401a5f8b: call   QWORD PTR [rdx+0x30]
0x1401a5f8e: lea    rdx,[r14+0x1110]
0x1401a5f95: mov    ecx,eax
0x1401a5f97: call   0x1400b9d50
0x1401a5f9c: test   rax,rax
0x1401a5f9f: je     0x1401a5fe6
0x1401a5fa1: lea    rdx,[r14+0x10c0]
0x1401a5fa8: mov    ecx,DWORD PTR [rax+0xc]
0x1401a5fab: call   0x1401ba0d0
0x1401a5fb0: mov    QWORD PTR [rsp+0x38],rax
0x1401a5fb5: test   rax,rax
0x1401a5fb8: je     0x1401a5fe6
0x1401a5fba: lea    rdx,[rsp+0x60]
0x1401a5fbf: mov    rcx,r12
0x1401a5fc2: call   0x1400b9910
0x1401a5fc7: mov    BYTE PTR [rsp+0x31],0x0
0x1401a5fcc: lea    rdx,[rsp+0x31]
0x1401a5fd1: mov    rcx,r13
0x1401a5fd4: call   0x14013bcf0
0x1401a5fd9: lea    rdx,[rsp+0x38]
0x1401a5fde: mov    rcx,rdi
0x1401a5fe1: call   0x1400b9910
0x1401a5fe6: add    rbx,0x8
0x1401a5fea: mov    QWORD PTR [rsp+0x38],rbx
0x1401a5fef: lea    r8,[rsp+0x50]
0x1401a5ff4: lea    rdx,[rsp+0x30]
0x1401a5ff9: lea    rcx,[rsp+0x38]
0x1401a5ffe: call   0x14006edb0
0x1401a6003: cmp    BYTE PTR [rax],0x0
0x1401a6006: jl     0x1401a5f53
0x1401a600c: mov    rdi,QWORD PTR [rsp+0x48]
0x1401a6011: mov    edx,0x2
0x1401a6016: mov    rcx,QWORD PTR [rsp+0x58]
0x1401a601b: call   0x140b95d70
0x1401a6020: cmp    eax,0xffffffff
0x1401a6023: je     0x1401a6167
0x1401a6029: mov    edx,eax
0x1401a602b: lea    rcx,[rip+0x234db76]        # 0x1424f3ba8
0x1401a6032: call   0x140067d50
0x1401a6037: test   rax,rax
0x1401a603a: je     0x1401a6167
0x1401a6040: mov    rbx,QWORD PTR [rax+0xe8]
0x1401a6047: mov    QWORD PTR [rsp+0x38],rbx
0x1401a604c: mov    rax,QWORD PTR [rax+0xf0]
0x1401a6053: mov    QWORD PTR [rsp+0x50],rax
0x1401a6058: lea    r8,[rsp+0x50]
0x1401a605d: lea    rdx,[rsp+0x31]
0x1401a6062: lea    rcx,[rsp+0x38]
0x1401a6067: call   0x14006edb0
0x1401a606c: cmp    BYTE PTR [rax],0x0
0x1401a606f: jge    0x1401a6167
0x1401a6075: lea    r12,[rdi+0x1638]
0x1401a607c: lea    r13,[rdi+0x1650]
0x1401a6083: lea    rax,[rdi+0x1668]
0x1401a608a: mov    rdi,rax
0x1401a608d: nop    DWORD PTR [rax]
0x1401a6090: mov    rcx,QWORD PTR [rbx]
0x1401a6093: mov    rax,QWORD PTR [rcx]
0x1401a6096: call   QWORD PTR [rax]
0x1401a6098: cmp    ax,0xa
0x1401a609c: jne    0x1401a613c
0x1401a60a2: mov    r15,QWORD PTR [rbx]
0x1401a60a5: mov    edx,DWORD PTR [r15+0x8]
0x1401a60a9: lea    rcx,[rip+0x2225638]        # 0x1423cb6e8
0x1401a60b0: call   0x14007da80
0x1401a60b5: mov    r14,rax
0x1401a60b8: mov    QWORD PTR [rsp+0x58],rax
0x1401a60bd: test   rax,rax
0x1401a60c0: je     0x1401a613c
0x1401a60c2: mov    rdx,QWORD PTR [r15]
0x1401a60c5: mov    rcx,r15
0x1401a60c8: call   QWORD PTR [rdx+0x30]
0x1401a60cb: lea    rdx,[r14+0x1110]
0x1401a60d2: mov    ecx,eax
0x1401a60d4: call   0x1400b9d50
0x1401a60d9: test   rax,rax
0x1401a60dc: je     0x1401a613c
0x1401a60de: lea    rdx,[r14+0x10c0]
0x1401a60e5: mov    ecx,DWORD PTR [rax+0xc]
0x1401a60e8: call   0x1401ba0d0
0x1401a60ed: mov    QWORD PTR [rsp+0x60],rax
0x1401a60f2: cmp    QWORD PTR [rax+0x168],0x0
0x1401a60fa: jne    0x1401a6110
0x1401a60fc: cmp    QWORD PTR [rax+0x1a8],0x0
0x1401a6104: jne    0x1401a6110
0x1401a6106: cmp    QWORD PTR [rax+0x1e8],0x0
0x1401a610e: je     0x1401a613c
0x1401a6110: lea    rdx,[rsp+0x58]
0x1401a6115: mov    rcx,r12
0x1401a6118: call   0x1400b9910
0x1401a611d: lea    rdx,[rsp+0x60]
0x1401a6122: mov    rcx,r13
0x1401a6125: call   0x1400b9910
0x1401a612a: mov    BYTE PTR [rsp+0x30],0x1
0x1401a612f: lea    rdx,[rsp+0x30]
0x1401a6134: mov    rcx,rdi
0x1401a6137: call   0x14013bcf0
0x1401a613c: add    rbx,0x8
0x1401a6140: mov    QWORD PTR [rsp+0x38],rbx
0x1401a6145: lea    r8,[rsp+0x50]
0x1401a614a: lea    rdx,[rsp+0x31]
0x1401a614f: lea    rcx,[rsp+0x38]
0x1401a6154: call   0x14006edb0
0x1401a6159: cmp    BYTE PTR [rax],0x0
0x1401a615c: jl     0x1401a6090
0x1401a6162: mov    rdi,QWORD PTR [rsp+0x48]
0x1401a6167: xor    r15d,r15d
0x1401a616a: mov    DWORD PTR [rdi+0x17f0],r15d
0x1401a6171: mov    r13,QWORD PTR [rsp+0x40]
0x1401a6176: mov    rax,QWORD PTR [r13+0xa98]
0x1401a617d: test   rax,rax
0x1401a6180: je     0x1401a6320
0x1401a6186: mov    r10,QWORD PTR [rax+0x380]
0x1401a618d: mov    QWORD PTR [rsp+0x38],r10
0x1401a6192: mov    rax,QWORD PTR [rax+0x388]
0x1401a6199: mov    QWORD PTR [rsp+0x40],rax
0x1401a619e: lea    r8,[rsp+0x40]
0x1401a61a3: lea    rdx,[rsp+0x30]
0x1401a61a8: lea    rcx,[rsp+0x38]
0x1401a61ad: call   0x14006edb0
0x1401a61b2: cmp    BYTE PTR [rax],r15b
0x1401a61b5: jge    0x1401a6320
0x1401a61bb: nop    DWORD PTR [rax+rax*1+0x0]
0x1401a61c0: mov    rbx,QWORD PTR [r10]
0x1401a61c3: mov    eax,DWORD PTR [rbx+0x8]
0x1401a61c6: cmp    eax,0xfffffc18
0x1401a61cb: jg     0x1401a62fa
0x1401a61d1: cmp    eax,0xfffe7960
0x1401a61d6: jg     0x1401a627f
0x1401a61dc: mov    r11d,0xfffffffd
0x1401a61e2: jmp    0x1401a628f
0x1401a61e7: mov    r9d,DWORD PTR [rdi+0x1630]
0x1401a61ee: lea    rdx,[r9-0x1]
0x1401a61f2: cmp    rdx,r11
0x1401a61f5: jl     0x1401a6243
0x1401a61f7: lea    rcx,[rdi+0x118c]
0x1401a61fe: lea    rcx,[rcx+rdx*4]
0x1401a6202: sub    rdx,r11
0x1401a6205: inc    rdx
0x1401a6208: nop    DWORD PTR [rax+rax*1+0x0]
0x1401a6210: cmp    r9d,0x95
0x1401a6217: jge    0x1401a6236
0x1401a6219: mov    eax,DWORD PTR [rcx-0x258]
0x1401a621f: mov    DWORD PTR [rcx-0x254],eax
0x1401a6225: mov    eax,DWORD PTR [rcx-0x4]
0x1401a6228: mov    DWORD PTR [rcx],eax
0x1401a622a: mov    eax,DWORD PTR [rcx+0x250]
0x1401a6230: mov    DWORD PTR [rcx+0x254],eax
0x1401a6236: add    rcx,0xfffffffffffffffc
0x1401a623a: dec    r9d
0x1401a623d: sub    rdx,0x1
0x1401a6241: jne    0x1401a6210
0x1401a6243: mov    rax,QWORD PTR [r10]
0x1401a6246: movsx  ecx,WORD PTR [rax]
0x1401a6249: mov    DWORD PTR [rdi+r11*4+0xf34],ecx
0x1401a6251: mov    DWORD PTR [rdi+r11*4+0x1188],ebx
0x1401a6259: mov    DWORD PTR [rdi+r11*4+0x13dc],esi
0x1401a6261: mov    eax,DWORD PTR [rdi+0x1630]
0x1401a6267: cmp    eax,0x95
0x1401a626c: jge    0x1401a5ea6
0x1401a6272: inc    eax
0x1401a6274: mov    DWORD PTR [rdi+0x1630],eax
0x1401a627a: jmp    0x1401a5ea6
0x1401a627f: mov    r11d,r15d
0x1401a6282: cmp    eax,0xffffd8f0
0x1401a6287: setg   r11b
0x1401a628b: add    r11d,0xfffffffe
0x1401a628f: mov    ecx,r15d
0x1401a6292: mov    r9,r15
0x1401a6295: mov    edx,DWORD PTR [rdi+0x17f0]
0x1401a629b: test   edx,edx
0x1401a629d: jle    0x1401a62bc
0x1401a629f: lea    rax,[rdi+0x1778]
0x1401a62a6: cmp    DWORD PTR [rax],r11d
0x1401a62a9: jg     0x1401a6387
0x1401a62af: inc    ecx
0x1401a62b1: inc    r9
0x1401a62b4: add    rax,0x4
0x1401a62b8: cmp    ecx,edx
0x1401a62ba: jl     0x1401a62a6
0x1401a62bc: movsxd rax,DWORD PTR [rdi+0x17f0]
0x1401a62c3: cmp    eax,0x1e
0x1401a62c6: jge    0x1401a62fa
0x1401a62c8: mov    rcx,rax
0x1401a62cb: mov    eax,DWORD PTR [rbx]
0x1401a62cd: mov    DWORD PTR [rdi+rcx*4+0x1688],eax
0x1401a62d4: movsxd rcx,DWORD PTR [rdi+0x17f0]
0x1401a62db: mov    eax,DWORD PTR [rbx+0x4]
0x1401a62de: mov    DWORD PTR [rdi+rcx*4+0x1700],eax
0x1401a62e5: movsxd rax,DWORD PTR [rdi+0x17f0]
0x1401a62ec: mov    DWORD PTR [rdi+rax*4+0x1778],r11d
0x1401a62f4: inc    DWORD PTR [rdi+0x17f0]
0x1401a62fa: add    r10,0x8
0x1401a62fe: mov    QWORD PTR [rsp+0x38],r10
0x1401a6303: lea    r8,[rsp+0x40]
0x1401a6308: lea    rdx,[rsp+0x30]
0x1401a630d: lea    rcx,[rsp+0x38]
0x1401a6312: call   0x14006edb0
0x1401a6317: cmp    BYTE PTR [rax],r15b
0x1401a631a: jl     0x1401a61c0
0x1401a6320: cmp    QWORD PTR [r13+0x1268],r15
0x1401a6327: je     0x1401a6bd4
0x1401a632d: mov    rax,QWORD PTR [rdi+0x1978]
0x1401a6334: sub    rax,QWORD PTR [rdi+0x1970]
0x1401a633b: test   rax,0xfffffffffffffff8
0x1401a6341: jne    0x1401a6bd4
0x1401a6347: mov    ecx,DWORD PTR [r13+0x130]
0x1401a634e: add    ecx,DWORD PTR [rip+0x21dbb90]        # 0x142381ee4
0x1401a6354: mov    edx,0x27
0x1401a6359: call   0x1407780c0
0x1401a635e: lea    rcx,[rbp-0x60]
0x1401a6362: call   0x14006f620
0x1401a6367: nop
0x1401a6368: mov    rax,QWORD PTR [r13+0x1268]
0x1401a636f: mov    ecx,DWORD PTR [rax+0x18]
0x1401a6372: test   cl,0x4
0x1401a6375: je     0x1401a6404
0x1401a637b: lea    rdx,[rip+0x1456bde]        # 0x1415fcf60  'This visitor is ready to leave.'
0x1401a6382: jmp    0x1401a6a50
0x1401a6387: mov    r8d,DWORD PTR [rdi+0x17f0]
0x1401a638e: dec    r8
0x1401a6391: cmp    r8,r9
0x1401a6394: jl     0x1401a63cb
0x1401a6396: lea    rdx,[r8+0x5c1]
0x1401a639d: lea    rdx,[rdi+rdx*4]
0x1401a63a1: sub    r8,r9
0x1401a63a4: inc    r8
0x1401a63a7: nop    WORD PTR [rax+rax*1+0x0]
0x1401a63b0: mov    eax,DWORD PTR [rdx-0x7c]
0x1401a63b3: mov    DWORD PTR [rdx-0x78],eax
0x1401a63b6: mov    eax,DWORD PTR [rdx-0x4]
0x1401a63b9: mov    DWORD PTR [rdx],eax
0x1401a63bb: mov    eax,DWORD PTR [rdx+0x74]
0x1401a63be: mov    DWORD PTR [rdx+0x78],eax
0x1401a63c1: lea    rdx,[rdx-0x4]
0x1401a63c5: sub    r8,0x1
0x1401a63c9: jne    0x1401a63b0
0x1401a63cb: mov    eax,DWORD PTR [rbx]
0x1401a63cd: mov    DWORD PTR [rdi+r9*4+0x1688],eax
0x1401a63d5: mov    eax,DWORD PTR [rbx+0x4]
0x1401a63d8: mov    DWORD PTR [rdi+r9*4+0x1700],eax
0x1401a63e0: mov    DWORD PTR [rdi+r9*4+0x1778],r11d
0x1401a63e8: mov    eax,DWORD PTR [rdi+0x17f0]
0x1401a63ee: cmp    eax,0x1e
0x1401a63f1: jge    0x1401a62fa
0x1401a63f7: inc    eax
0x1401a63f9: mov    DWORD PTR [rdi+0x17f0],eax
0x1401a63ff: jmp    0x1401a62fa
0x1401a6404: test   cl,0x1
0x1401a6407: je     0x1401a6a49
0x1401a640d: lea    rdx,[rip+0x1456b34]        # 0x1415fcf48  'This visitor has come '
0x1401a6414: lea    rcx,[rbp-0x60]
0x1401a6418: call   0x14006f510
0x1401a641d: mov    rbx,QWORD PTR [r13+0x1268]
0x1401a6424: mov    rax,QWORD PTR [rbx+0x8]
0x1401a6428: mov    rbx,QWORD PTR [rbx]
0x1401a642b: mov    rsi,rax
0x1401a642e: sub    rsi,rbx
0x1401a6431: sar    rsi,0x3
0x1401a6435: mov    QWORD PTR [rsp+0x38],rbx
0x1401a643a: mov    QWORD PTR [rsp+0x40],rax
0x1401a643f: lea    r8,[rsp+0x40]
0x1401a6444: lea    rdx,[rsp+0x30]
0x1401a6449: lea    rcx,[rsp+0x38]
0x1401a644e: call   0x14006edb0
0x1401a6453: cmp    BYTE PTR [rax],0x0
0x1401a6456: jge    0x1401a65bb
0x1401a645c: lea    r15,[rip+0xffffffffffe59b9d]        # 0x140000000
0x1401a6463: mov    r14,QWORD PTR [rbx]
0x1401a6466: movsxd rax,DWORD PTR [r14]
0x1401a6469: cmp    eax,0xa
0x1401a646c: ja     0x1401a64e5
0x1401a646e: mov    ecx,DWORD PTR [r15+rax*4+0x1a803c]
0x1401a6476: add    rcx,r15
0x1401a6479: jmp    rcx
0x1401a647b: lea    rdx,[rip+0x1456abe]        # 0x1415fcf40  'to pray'
0x1401a6482: jmp    0x1401a64dc
0x1401a6484: lea    rdx,[rip+0x1456aa5]        # 0x1415fcf30  'to study'
0x1401a648b: jmp    0x1401a64dc
0x1401a648d: lea    rdx,[rip+0x1456a8c]        # 0x1415fcf20  'to relax'
0x1401a6494: jmp    0x1401a64dc
0x1401a6496: lea    rdx,[rip+0x1456a73]        # 0x1415fcf10  'to perform'
0x1401a649d: jmp    0x1401a64dc
0x1401a649f: lea    rdx,[rip+0x1456d32]        # 0x1415fd1d8  'to slay beasts'
0x1401a64a6: jmp    0x1401a64dc
0x1401a64a8: lea    rdx,[rip+0x1456d09]        # 0x1415fd1b8  'seeking work as a performer'
0x1401a64af: jmp    0x1401a64dc
0x1401a64b1: lea    rdx,[rip+0x1456ce0]        # 0x1415fd198  'seeking work as a mercenary'
0x1401a64b8: jmp    0x1401a64dc
0x1401a64ba: lea    rdx,[rip+0x1456cb7]        # 0x1415fd178  'seeking work as a scholar'
0x1401a64c1: jmp    0x1401a64dc
0x1401a64c3: lea    rdx,[rip+0x1456c9e]        # 0x1415fd168  'for diplomacy'
0x1401a64ca: jmp    0x1401a64dc
0x1401a64cc: lea    rdx,[rip+0x1456c7d]        # 0x1415fd150  'seeking sanctuary'
0x1401a64d3: jmp    0x1401a64dc
0x1401a64d5: lea    rdx,[rip+0x1456c5c]        # 0x1415fd138  'asking questions'
0x1401a64dc: lea    rcx,[rbp-0x60]
0x1401a64e0: call   0x14006f4f0
0x1401a64e5: mov    edx,DWORD PTR [r14+0x4]
0x1401a64e9: cmp    edx,0xffffffff
0x1401a64ec: je     0x1401a656d
0x1401a64ee: mov    r14d,DWORD PTR [r14+0x8]
0x1401a64f2: cmp    r14d,0xffffffff
0x1401a64f6: je     0x1401a656d
0x1401a64f8: mov    rcx,QWORD PTR [rip+0x233f549]        # 0x1424e5a48
0x1401a64ff: call   0x14007dab0
0x1401a6504: test   rax,rax
0x1401a6507: je     0x1401a656d
0x1401a6509: mov    edx,r14d
0x1401a650c: mov    rcx,rax
0x1401a650f: call   0x140067e10
0x1401a6514: test   rax,rax
0x1401a6517: je     0x1401a656d
0x1401a6519: mov    rdx,QWORD PTR [rax]
0x1401a651c: mov    rcx,rax
0x1401a651f: call   QWORD PTR [rdx+0x10]
0x1401a6522: mov    r14,rax
0x1401a6525: test   rax,rax
0x1401a6528: je     0x1401a656d
0x1401a652a: lea    rdx,[rip+0x1456bfb]        # 0x1415fd12c  ' at '
0x1401a6531: lea    rcx,[rbp-0x60]
0x1401a6535: call   0x14006f4f0
0x1401a653a: lea    rcx,[rbp+0x0]
0x1401a653e: call   0x14006f620
0x1401a6543: nop
0x1401a6544: xor    r9d,r9d
0x1401a6547: mov    r8b,0x1
0x1401a654a: lea    rdx,[rbp+0x0]
0x1401a654e: mov    rcx,r14
0x1401a6551: call   0x140a91760
0x1401a6556: lea    rdx,[rbp+0x0]
0x1401a655a: lea    rcx,[rbp-0x60]
0x1401a655e: call   0x1400b9ca0
0x1401a6563: nop
0x1401a6564: lea    rcx,[rbp+0x0]
0x1401a6568: call   0x14006f7e0
0x1401a656d: cmp    esi,0x3
0x1401a6570: jl     0x1401a657b
0x1401a6572: lea    rdx,[rip+0x143db4b]        # 0x1415e40c4  ', '
0x1401a6579: jmp    0x1401a6587
0x1401a657b: cmp    esi,0x2
0x1401a657e: jne    0x1401a6590
0x1401a6580: lea    rdx,[rip+0x143db35]        # 0x1415e40bc  ' and '
0x1401a6587: lea    rcx,[rbp-0x60]
0x1401a658b: call   0x14006f4f0
0x1401a6590: add    rbx,0x8
0x1401a6594: mov    QWORD PTR [rsp+0x38],rbx
0x1401a6599: dec    esi
0x1401a659b: lea    r8,[rsp+0x40]
0x1401a65a0: lea    rdx,[rsp+0x30]
0x1401a65a5: lea    rcx,[rsp+0x38]
0x1401a65aa: call   0x14006edb0
0x1401a65af: cmp    BYTE PTR [rax],0x0
0x1401a65b2: jl     0x1401a6463
0x1401a65b8: xor    r15d,r15d
0x1401a65bb: lea    rdx,[rip+0x143cfb2]        # 0x1415e3574  '.'
0x1401a65c2: lea    rcx,[rbp-0x60]
0x1401a65c6: call   0x14006f4f0
0x1401a65cb: mov    rax,QWORD PTR [r13+0x1268]
0x1401a65d2: cmp    DWORD PTR [rax+0x2c],0xffffffff
0x1401a65d6: je     0x1401a6a59
0x1401a65dc: lea    rcx,[rbp-0x40]
0x1401a65e0: call   0x14006f620
0x1401a65e5: nop
0x1401a65e6: mov    rax,QWORD PTR [r13+0x1268]
0x1401a65ed: mov    ebx,DWORD PTR [rax+0x30]
0x1401a65f0: cmp    ebx,0xffffffff
0x1401a65f3: je     0x1401a663b
0x1401a65f5: mov    edx,DWORD PTR [rip+0x21e6f69]        # 0x14238d564
0x1401a65fb: mov    rcx,QWORD PTR [rip+0x233f446]        # 0x1424e5a48
0x1401a6602: call   0x14007dab0
0x1401a6607: test   rax,rax
0x1401a660a: je     0x1401a663b
0x1401a660c: mov    edx,ebx
0x1401a660e: mov    rcx,rax
0x1401a6611: call   0x140067e10
0x1401a6616: test   rax,rax
0x1401a6619: je     0x1401a663b
0x1401a661b: mov    rdx,QWORD PTR [rax]
0x1401a661e: mov    rcx,rax
0x1401a6621: call   QWORD PTR [rdx+0x10]
0x1401a6624: test   rax,rax
0x1401a6627: je     0x1401a663b
0x1401a6629: xor    r9d,r9d
0x1401a662c: mov    r8b,0x1
0x1401a662f: lea    rdx,[rbp-0x40]
0x1401a6633: mov    rcx,rax
0x1401a6636: call   0x140a91760
0x1401a663b: lea    rdx,[rip+0x14519b6]        # 0x1415f7ff8  '  '
0x1401a6642: lea    rcx,[rbp-0x60]
0x1401a6646: call   0x14006f4f0
0x1401a664b: lea    rcx,[rbp+0x0]
0x1401a664f: call   0x14006f620
0x1401a6654: nop
0x1401a6655: mov    r8b,0x1
0x1401a6658: lea    rdx,[rbp+0x0]
0x1401a665c: movzx  ecx,BYTE PTR [r13+0x12e]
0x1401a6664: call   0x140aa17b0
0x1401a6669: lea    rdx,[rbp+0x0]
0x1401a666d: lea    rcx,[rbp-0x60]
0x1401a6671: call   0x1400b9ca0
0x1401a6676: lea    rdx,[rip+0x143d0a3]        # 0x1415e3720  ' '
0x1401a667d: lea    rcx,[rbp-0x60]
0x1401a6681: call   0x14006f4f0
0x1401a6686: mov    rax,QWORD PTR [r13+0x1268]
0x1401a668d: mov    ecx,DWORD PTR [rax+0x2c]
0x1401a6690: add    ecx,0xffffffd7
0x1401a6693: cmp    ecx,0x22
0x1401a6696: ja     0x1401a6a34
0x1401a669c: movsxd rax,ecx
0x1401a669f: lea    rdx,[rip+0xffffffffffe5995a]        # 0x140000000
0x1401a66a6: movzx  eax,BYTE PTR [rdx+rax*1+0x1a80a4]
0x1401a66ae: mov    ecx,DWORD PTR [rdx+rax*4+0x1a8068]
0x1401a66b5: add    rcx,rdx
0x1401a66b8: jmp    rcx
0x1401a66ba: lea    rdx,[rip+0x1456a37]        # 0x1415fd0f8  'heard this was a good place to search for monsters.'
0x1401a66c1: jmp    0x1401a6a2a
0x1401a66c6: lea    rdx,[rip+0x14569f3]        # 0x1415fd0c0  'heard this was the place for those seeking danger.'
0x1401a66cd: jmp    0x1401a6a2a
0x1401a66d2: lea    rdx,[rip+0x14569db]        # 0x1415fd0b4  'heard '
0x1401a66d9: lea    rcx,[rbp-0x60]
0x1401a66dd: call   0x14006f4f0
0x1401a66e2: lea    rcx,[rbp-0x60]
0x1401a66e6: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a66eb: jne    0x1401a6705
0x1401a66ed: lea    rdx,[rip+0x14569b8]        # 0x1415fd0ac  'this'
0x1401a66f4: call   0x14006f4f0
0x1401a66f9: lea    rdx,[rip+0x1456990]        # 0x1415fd090  ' was the place for prayer.'
0x1401a6700: jmp    0x1401a6a2a
0x1401a6705: lea    rdx,[rbp-0x40]
0x1401a6709: call   0x1400b9ca0
0x1401a670e: lea    rdx,[rip+0x145697b]        # 0x1415fd090  ' was the place for prayer.'
0x1401a6715: jmp    0x1401a6a2a
0x1401a671a: lea    rcx,[rbp-0x60]
0x1401a671e: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a6723: jne    0x1401a6731
0x1401a6725: lea    rdx,[rip+0x145693c]        # 0x1415fd068  'went on this journey out of curiosity.'
0x1401a672c: jmp    0x1401a6a2e
0x1401a6731: lea    rdx,[rip+0x1456918]        # 0x1415fd050  'was curious about '
0x1401a6738: call   0x14006f4f0
0x1401a673d: lea    rdx,[rbp-0x40]
0x1401a6741: lea    rcx,[rbp-0x60]
0x1401a6745: call   0x1400b9ca0
0x1401a674a: jmp    0x1401a6a23
0x1401a674f: lea    rdx,[rip+0x145695e]        # 0x1415fd0b4  'heard '
0x1401a6756: lea    rcx,[rbp-0x60]
0x1401a675a: call   0x14006f4f0
0x1401a675f: lea    rcx,[rbp-0x60]
0x1401a6763: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a6768: jne    0x1401a6782
0x1401a676a: lea    rdx,[rip+0x145693b]        # 0x1415fd0ac  'this'
0x1401a6771: call   0x14006f4f0
0x1401a6776: lea    rdx,[rip+0x14568ab]        # 0x1415fd028  ' was the place for a good drink.'
0x1401a677d: jmp    0x1401a6a2a
0x1401a6782: lea    rdx,[rbp-0x40]
0x1401a6786: call   0x1400b9ca0
0x1401a678b: lea    rdx,[rip+0x1456896]        # 0x1415fd028  ' was the place for a good drink.'
0x1401a6792: jmp    0x1401a6a2a
0x1401a6797: lea    rdx,[rip+0x1456916]        # 0x1415fd0b4  'heard '
0x1401a679e: lea    rcx,[rbp-0x60]
0x1401a67a2: call   0x14006f4f0
0x1401a67a7: lea    rcx,[rbp-0x60]
0x1401a67ab: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a67b0: jne    0x1401a67ca
0x1401a67b2: lea    rdx,[rip+0x14568f3]        # 0x1415fd0ac  'this'
0x1401a67b9: call   0x14006f4f0
0x1401a67be: lea    rdx,[rip+0x1456c0b]        # 0x1415fd3d0  ' was the place to admire fine architecture.'
0x1401a67c5: jmp    0x1401a6a2a
0x1401a67ca: lea    rdx,[rbp-0x40]
0x1401a67ce: call   0x1400b9ca0
0x1401a67d3: lea    rdx,[rip+0x1456bf6]        # 0x1415fd3d0  ' was the place to admire fine architecture.'
0x1401a67da: jmp    0x1401a6a2a
0x1401a67df: lea    rdx,[rip+0x14568ce]        # 0x1415fd0b4  'heard '
0x1401a67e6: lea    rcx,[rbp-0x60]
0x1401a67ea: call   0x14006f4f0
0x1401a67ef: lea    rcx,[rbp-0x60]
0x1401a67f3: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a67f8: jne    0x1401a6812
0x1401a67fa: lea    rdx,[rip+0x14568ab]        # 0x1415fd0ac  'this'
0x1401a6801: call   0x14006f4f0
0x1401a6806: lea    rdx,[rip+0x1456b9b]        # 0x1415fd3a8  ' was the place to enjoy oneself.'
0x1401a680d: jmp    0x1401a6a2a
0x1401a6812: lea    rdx,[rbp-0x40]
0x1401a6816: call   0x1400b9ca0
0x1401a681b: lea    rdx,[rip+0x1456b86]        # 0x1415fd3a8  ' was the place to enjoy oneself.'
0x1401a6822: jmp    0x1401a6a2a
0x1401a6827: lea    rdx,[rip+0x1456886]        # 0x1415fd0b4  'heard '
0x1401a682e: lea    rcx,[rbp-0x60]
0x1401a6832: call   0x14006f4f0
0x1401a6837: lea    rcx,[rbp-0x60]
0x1401a683b: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a6840: jne    0x1401a685a
0x1401a6842: lea    rdx,[rip+0x1456863]        # 0x1415fd0ac  'this'
0x1401a6849: call   0x14006f4f0
0x1401a684e: lea    rdx,[rip+0x1456b2b]        # 0x1415fd380  ' was the place to entertain people.'
0x1401a6855: jmp    0x1401a6a2a
0x1401a685a: lea    rdx,[rbp-0x40]
0x1401a685e: call   0x1400b9ca0
0x1401a6863: lea    rdx,[rip+0x1456b16]        # 0x1415fd380  ' was the place to entertain people.'
0x1401a686a: jmp    0x1401a6a2a
0x1401a686f: lea    rdx,[rip+0x145683e]        # 0x1415fd0b4  'heard '
0x1401a6876: lea    rcx,[rbp-0x60]
0x1401a687a: call   0x14006f4f0
0x1401a687f: lea    rcx,[rbp-0x60]
0x1401a6883: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a6888: jne    0x1401a68a2
0x1401a688a: lea    rdx,[rip+0x145681b]        # 0x1415fd0ac  'this'
0x1401a6891: call   0x14006f4f0
0x1401a6896: lea    rdx,[rip+0x1456abb]        # 0x1415fd358  ' was the place to perform research.'
0x1401a689d: jmp    0x1401a6a2a
0x1401a68a2: lea    rdx,[rbp-0x40]
0x1401a68a6: call   0x1400b9ca0
0x1401a68ab: lea    rdx,[rip+0x1456aa6]        # 0x1415fd358  ' was the place to perform research.'
0x1401a68b2: jmp    0x1401a6a2a
0x1401a68b7: lea    rdx,[rip+0x14567f6]        # 0x1415fd0b4  'heard '
0x1401a68be: lea    rcx,[rbp-0x60]
0x1401a68c2: call   0x14006f4f0
0x1401a68c7: lea    rcx,[rbp-0x60]
0x1401a68cb: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a68d0: jne    0x1401a68ea
0x1401a68d2: lea    rdx,[rip+0x14567d3]        # 0x1415fd0ac  'this'
0x1401a68d9: call   0x14006f4f0
0x1401a68de: lea    rdx,[rip+0x1456a43]        # 0x1415fd328  ' was the place for long-term scholarship.'
0x1401a68e5: jmp    0x1401a6a2a
0x1401a68ea: lea    rdx,[rbp-0x40]
0x1401a68ee: call   0x1400b9ca0
0x1401a68f3: lea    rdx,[rip+0x1456a2e]        # 0x1415fd328  ' was the place for long-term scholarship.'
0x1401a68fa: jmp    0x1401a6a2a
0x1401a68ff: lea    rdx,[rip+0x14567ae]        # 0x1415fd0b4  'heard '
0x1401a6906: lea    rcx,[rbp-0x60]
0x1401a690a: call   0x14006f4f0
0x1401a690f: lea    rcx,[rbp-0x60]
0x1401a6913: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a6918: jne    0x1401a6932
0x1401a691a: lea    rdx,[rip+0x145678b]        # 0x1415fd0ac  'this'
0x1401a6921: call   0x14006f4f0
0x1401a6926: lea    rdx,[rip+0x14569cb]        # 0x1415fd2f8  ' would make a good base for a mercenary.'
0x1401a692d: jmp    0x1401a6a2a
0x1401a6932: lea    rdx,[rbp-0x40]
0x1401a6936: call   0x1400b9ca0
0x1401a693b: lea    rdx,[rip+0x14569b6]        # 0x1415fd2f8  ' would make a good base for a mercenary.'
0x1401a6942: jmp    0x1401a6a2a
0x1401a6947: lea    rdx,[rip+0x1456766]        # 0x1415fd0b4  'heard '
0x1401a694e: lea    rcx,[rbp-0x60]
0x1401a6952: call   0x14006f4f0
0x1401a6957: lea    rcx,[rbp-0x60]
0x1401a695b: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a6960: jne    0x1401a697a
0x1401a6962: lea    rdx,[rip+0x1456743]        # 0x1415fd0ac  'this'
0x1401a6969: call   0x14006f4f0
0x1401a696e: lea    rdx,[rip+0x1456953]        # 0x1415fd2c8  ' was the place to look for long-term work.'
0x1401a6975: jmp    0x1401a6a2a
0x1401a697a: lea    rdx,[rbp-0x40]
0x1401a697e: call   0x1400b9ca0
0x1401a6983: lea    rdx,[rip+0x145693e]        # 0x1415fd2c8  ' was the place to look for long-term work.'
0x1401a698a: jmp    0x1401a6a2a
0x1401a698f: lea    rdx,[rip+0x1456922]        # 0x1415fd2b8  'believes '
0x1401a6996: lea    rcx,[rbp-0x60]
0x1401a699a: call   0x14006f4f0
0x1401a699f: lea    rcx,[rbp-0x60]
0x1401a69a3: cmp    QWORD PTR [rbp-0x30],0x0
0x1401a69a8: jne    0x1401a69bf
0x1401a69aa: lea    rdx,[rip+0x14566fb]        # 0x1415fd0ac  'this'
0x1401a69b1: call   0x14006f4f0
0x1401a69b6: lea    rdx,[rip+0x14568db]        # 0x1415fd298  ' would be a safe place to stay.'
0x1401a69bd: jmp    0x1401a6a2a
0x1401a69bf: lea    rdx,[rbp-0x40]
0x1401a69c3: call   0x1400b9ca0
0x1401a69c8: lea    rdx,[rip+0x14568c9]        # 0x1415fd298  ' would be a safe place to stay.'
0x1401a69cf: jmp    0x1401a6a2a
0x1401a69d1: lea    rdx,[rip+0x14568a8]        # 0x1415fd280  'is seeking information'
0x1401a69d8: lea    rcx,[rbp-0x60]
0x1401a69dc: call   0x14006f4f0
0x1401a69e1: mov    rax,QWORD PTR [r13+0x1208]
0x1401a69e8: test   rax,rax
0x1401a69eb: je     0x1401a6a23
0x1401a69ed: cmp    DWORD PTR [rax+0x138],0x11
0x1401a69f4: jne    0x1401a6a23
0x1401a69f6: lea    rdx,[rip+0x145686b]        # 0x1415fd268  ' about the location of '
0x1401a69fd: lea    rcx,[rbp-0x60]
0x1401a6a01: call   0x14006f4f0
0x1401a6a06: mov    rax,QWORD PTR [r13+0x1208]
0x1401a6a0d: mov    r8,QWORD PTR [rax+0x130]
0x1401a6a14: xor    r9d,r9d
0x1401a6a17: mov    r8d,DWORD PTR [r8]
0x1401a6a1a: lea    rdx,[rbp-0x60]
0x1401a6a1e: call   0x140b91440
0x1401a6a23: lea    rdx,[rip+0x143cb4a]        # 0x1415e3574  '.'
0x1401a6a2a: lea    rcx,[rbp-0x60]
0x1401a6a2e: call   0x14006f4f0
0x1401a6a33: nop
0x1401a6a34: lea    rcx,[rbp+0x0]
0x1401a6a38: call   0x14006f7e0
0x1401a6a3d: nop
0x1401a6a3e: lea    rcx,[rbp-0x40]
0x1401a6a42: call   0x14006f7e0
0x1401a6a47: jmp    0x1401a6a59
0x1401a6a49: lea    rdx,[rip+0x14567d0]        # 0x1415fd220  'You can learn more about this visitor after they chat with a local.'
0x1401a6a50: lea    rcx,[rbp-0x60]
0x1401a6a54: call   0x14006f510
0x1401a6a59: lea    rcx,[rdi+0x1970]
0x1401a6a60: mov    r8d,0x1c
0x1401a6a66: lea    rdx,[rbp-0x60]
0x1401a6a6a: call   0x1408e4b80
0x1401a6a6f: mov    rax,QWORD PTR [r13+0x1268]
0x1401a6a76: test   BYTE PTR [rax+0x18],0x1
0x1401a6a7a: je     0x1401a6bc5
0x1401a6a80: mov    eax,0x83
0x1401a6a85: cmp    WORD PTR [r13+0xa0],ax
0x1401a6a8d: jne    0x1401a6bc5
0x1401a6a93: mov    rcx,r13
0x1401a6a96: call   0x1413f48f0
0x1401a6a9b: cmp    eax,0xffffffff
0x1401a6a9e: je     0x1401a6bc5
0x1401a6aa4: mov    edx,eax
0x1401a6aa6: lea    rcx,[rip+0x233b42b]        # 0x1424e1ed8
0x1401a6aad: call   0x140072500
0x1401a6ab2: mov    rbx,rax
0x1401a6ab5: test   rax,rax
0x1401a6ab8: je     0x1401a6bc5
0x1401a6abe: mov    rcx,QWORD PTR [rax+0x10]
0x1401a6ac2: sub    rcx,QWORD PTR [rax+0x8]
0x1401a6ac6: sar    rcx,0x3
0x1401a6aca: test   rcx,rcx
0x1401a6acd: je     0x1401a6bc5
0x1401a6ad3: call   0x140071ec0
0x1401a6ad8: movsxd rcx,eax
0x1401a6adb: lea    r14,[rcx*8+0x0]
0x1401a6ae3: mov    rax,QWORD PTR [rbx+0x8]
0x1401a6ae7: mov    rcx,QWORD PTR [r14+rax*1]
0x1401a6aeb: mov    rax,QWORD PTR [rcx+0x8]
0x1401a6aef: sub    rax,QWORD PTR [rcx]
0x1401a6af2: sar    rax,0x3
0x1401a6af6: test   rax,rax
0x1401a6af9: je     0x1401a6bc5
0x1401a6aff: mov    ecx,eax
0x1401a6b01: call   0x140071ec0
0x1401a6b06: movsxd rsi,eax
0x1401a6b09: cmp    esi,0xffffffff
0x1401a6b0c: je     0x1401a6bc5
0x1401a6b12: lea    rdx,[rip+0x143dbe3]        # 0x1415e46fc  '"'
0x1401a6b19: lea    rcx,[rbp+0x20]
0x1401a6b1d: call   0x1400680e0
0x1401a6b22: nop
0x1401a6b23: mov    DWORD PTR [rsp+0x50],0xffffffff
0x1401a6b2b: mov    QWORD PTR [rsp+0x40],0xffffffffffffffff
0x1401a6b34: mov    ecx,DWORD PTR [r13+0xc30]
0x1401a6b3b: mov    DWORD PTR [rsp+0x54],ecx
0x1401a6b3f: lea    rcx,[rbp+0x0]
0x1401a6b43: call   0x14006f620
0x1401a6b48: nop
0x1401a6b49: mov    rax,QWORD PTR [rbx+0x8]
0x1401a6b4d: mov    rcx,QWORD PTR [r14+rax*1]
0x1401a6b51: mov    rdx,QWORD PTR [rcx]
0x1401a6b54: lea    r9,[rsp+0x40]
0x1401a6b59: lea    r8,[rsp+0x50]
0x1401a6b5e: mov    rdx,QWORD PTR [rdx+rsi*8]
0x1401a6b62: lea    rcx,[rbp+0x0]
0x1401a6b66: call   0x140656ab0
0x1401a6b6b: lea    rdx,[rbp+0x0]
0x1401a6b6f: lea    rcx,[rbp+0x20]
0x1401a6b73: call   0x1400b9ca0
0x1401a6b78: lea    rdx,[rip+0x143db7d]        # 0x1415e46fc  '"'
0x1401a6b7f: lea    rcx,[rbp+0x20]
0x1401a6b83: call   0x14006f4f0
0x1401a6b88: lea    rcx,[rdi+0x1970]
0x1401a6b8f: lea    rdx,[rip+0x143f91a]        # 0x1415e64b0
0x1401a6b96: call   0x1400bb870
0x1401a6b9b: lea    rcx,[rdi+0x1970]
0x1401a6ba2: mov    r8d,0x1c
0x1401a6ba8: lea    rdx,[rbp+0x20]
0x1401a6bac: call   0x1408e4b80
0x1401a6bb1: nop
0x1401a6bb2: lea    rcx,[rbp+0x0]
0x1401a6bb6: call   0x14006f7e0
0x1401a6bbb: nop
0x1401a6bbc: lea    rcx,[rbp+0x20]
0x1401a6bc0: call   0x14006f7e0
0x1401a6bc5: call   0x140eb1bc0
0x1401a6bca: nop
0x1401a6bcb: lea    rcx,[rbp-0x60]
0x1401a6bcf: call   0x14006f7e0
0x1401a6bd4: mov    rcx,r13
0x1401a6bd7: call   0x1400736f0
0x1401a6bdc: test   al,al
0x1401a6bde: je     0x1401a6ff6
0x1401a6be4: call   0x1400736a0
0x1401a6be9: test   al,al
0x1401a6beb: je     0x1401a6ff6
0x1401a6bf1: cmp    QWORD PTR [rdi+0x1cd0],0x0
0x1401a6bf9: jne    0x1401a6ff6
0x1401a6bff: call   0x141389c90
0x1401a6c04: test   al,al
0x1401a6c06: je     0x1401a6ff6
0x1401a6c0c: cmp    QWORD PTR [r13+0xa98],0x0
0x1401a6c14: je     0x1401a6ff6
0x1401a6c1a: mov    DWORD PTR [rdi+0x1cf8],r15d
0x1401a6c21: movzx  ecx,WORD PTR [r13+0x360]
0x1401a6c29: cmp    cx,0x5
0x1401a6c2d: je     0x1401a6ff6
0x1401a6c33: lea    eax,[rcx-0x6]
0x1401a6c36: mov    edx,0xfffc
0x1401a6c3b: test   dx,ax
0x1401a6c3e: jne    0x1401a6c4a
0x1401a6c40: cmp    cx,0x8
0x1401a6c44: jne    0x1401a6ff6
0x1401a6c4a: cmp    WORD PTR [r13+0x814],0xffff
0x1401a6c53: jne    0x1401a6ff6
0x1401a6c59: cmp    WORD PTR [r13+0x800],0x0
0x1401a6c62: jg     0x1401a6ff6
0x1401a6c68: cmp    cx,0x8
0x1401a6c6c: jne    0x1401a6d1b
0x1401a6c72: lea    rcx,[rbp+0x20]
0x1401a6c76: call   0x14006f620
0x1401a6c7b: nop
0x1401a6c7c: xor    r8d,r8d
0x1401a6c7f: lea    rdx,[rbp+0x20]
0x1401a6c83: mov    rcx,r13
0x1401a6c86: call   0x140663e90
0x1401a6c8b: mov    r9d,0x77
0x1401a6c91: movzx  r8d,WORD PTR [r13+0x12c]
0x1401a6c99: movzx  edx,WORD PTR [r13+0xa4]
0x1401a6ca1: lea    rcx,[rip+0x233fc90]        # 0x1424e6938
0x1401a6ca8: call   0x1400727e0
0x1401a6cad: test   al,al
0x1401a6caf: je     0x1401a6cdf
0x1401a6cb1: lea    rdx,[rbp+0x20]
0x1401a6cb5: lea    rcx,[rbp+0x0]
0x1401a6cb9: call   0x14006f560
0x1401a6cbe: nop
0x1401a6cbf: lea    rcx,[rbp+0x0]
0x1401a6cc3: call   0x1406790e0
0x1401a6cc8: lea    rdx,[rbp+0x0]
0x1401a6ccc: lea    rcx,[rbp+0x20]
0x1401a6cd0: call   0x14006f530
0x1401a6cd5: nop
0x1401a6cd6: lea    rcx,[rbp+0x0]
0x1401a6cda: call   0x14006f7e0
0x1401a6cdf: lea    rdx,[rip+0x143da16]        # 0x1415e46fc  '"'
0x1401a6ce6: lea    rcx,[rdi+0x1cc0]
0x1401a6ced: call   0x14006f4f0
0x1401a6cf2: lea    rdx,[rbp+0x20]
0x1401a6cf6: lea    rcx,[rdi+0x1cc0]
0x1401a6cfd: call   0x1400b9ca0
0x1401a6d02: lea    rdx,[rip+0x143d9f3]        # 0x1415e46fc  '"'
0x1401a6d09: lea    rcx,[rdi+0x1cc0]
0x1401a6d10: call   0x14006f4f0
0x1401a6d15: nop
0x1401a6d16: jmp    0x1401a6fed
0x1401a6d1b: mov    rcx,QWORD PTR [r13+0xa98]
0x1401a6d22: mov    rbx,QWORD PTR [rcx+0x278]
0x1401a6d29: mov    rax,QWORD PTR [rcx+0x280]
0x1401a6d30: sub    rax,rbx
0x1401a6d33: sar    rax,0x3
0x1401a6d37: test   rax,rax
0x1401a6d3a: je     0x1401a6f49
0x1401a6d40: mov    rsi,r15
0x1401a6d43: mov    r15d,0xffffffff
0x1401a6d49: mov    QWORD PTR [rsp+0x38],rbx
0x1401a6d4e: mov    rax,QWORD PTR [rcx+0x280]
0x1401a6d55: mov    QWORD PTR [rsp+0x40],rax
0x1401a6d5a: lea    r8,[rsp+0x40]
0x1401a6d5f: lea    rdx,[rsp+0x30]
0x1401a6d64: lea    rcx,[rsp+0x38]
0x1401a6d69: call   0x14006edb0
0x1401a6d6e: cmp    BYTE PTR [rax],0x0
0x1401a6d71: jge    0x1401a6f49
0x1401a6d77: mov    r14d,0x64
0x1401a6d7d: mov    r12d,0x186a0
0x1401a6d83: lea    rdi,[rip+0xffffffffffe59276]        # 0x140000000
0x1401a6d8a: nop    WORD PTR [rax+rax*1+0x0]
0x1401a6d90: mov    rax,QWORD PTR [rbx]
0x1401a6d93: mov    ecx,DWORD PTR [rax+0xc]
0x1401a6d96: cmp    ecx,0xffffffff
0x1401a6d99: je     0x1401a6e3c
0x1401a6d9f: cmp    ecx,0x6
0x1401a6da2: jne    0x1401a6db6
0x1401a6da4: mov    ecx,0xa
0x1401a6da9: call   0x140071ec0
0x1401a6dae: test   eax,eax
0x1401a6db0: jne    0x1401a6e3c
0x1401a6db6: mov    rdx,QWORD PTR [rbx]
0x1401a6db9: mov    eax,DWORD PTR [rdx]
0x1401a6dbb: cmp    eax,0xa5
0x1401a6dc0: je     0x1401a6e3c
0x1401a6dc2: cmp    eax,0xa6
0x1401a6dc7: je     0x1401a6e3c
0x1401a6dc9: cmp    eax,0xffffffff
0x1401a6dcc: je     0x1401a6e3c
0x1401a6dce: mov    eax,DWORD PTR [rdx+0x18]
0x1401a6dd1: test   al,0x70
0x1401a6dd3: jne    0x1401a6e3c
0x1401a6dd5: cmp    DWORD PTR [rdx+0x4],0x0
0x1401a6dd9: jg     0x1401a6de1
0x1401a6ddb: cmp    DWORD PTR [rdx+0x8],0x0
0x1401a6ddf: jle    0x1401a6e3c
0x1401a6de1: mov    edx,DWORD PTR [rdx+0x8]
0x1401a6de4: cmp    edx,r14d
0x1401a6de7: jle    0x1401a6dee
0x1401a6de9: mov    edx,r14d
0x1401a6dec: jmp    0x1401a6df6
0x1401a6dee: jne    0x1401a6df6
0x1401a6df0: test   al,0x1
0x1401a6df2: cmovne edx,r12d
0x1401a6df6: mov    rax,QWORD PTR [rbx]
0x1401a6df9: movsxd rcx,DWORD PTR [rax]
0x1401a6dfc: cmp    ecx,0xa8
0x1401a6e02: ja     0x1401a6e31
0x1401a6e04: movzx  eax,BYTE PTR [rdi+rcx*1+0x1a80dc]
0x1401a6e0c: mov    ecx,DWORD PTR [rdi+rax*4+0x1a80c8]
0x1401a6e13: add    rcx,rdi
0x1401a6e16: jmp    rcx
0x1401a6e18: lea    edx,[rdx*8+0x0]
0x1401a6e1f: jmp    0x1401a6e31
0x1401a6e21: lea    edx,[rdx*4+0x0]
0x1401a6e28: jmp    0x1401a6e31
0x1401a6e2a: add    edx,edx
0x1401a6e2c: jmp    0x1401a6e31
0x1401a6e2e: shl    edx,0x4
0x1401a6e31: cmp    edx,r15d
0x1401a6e34: jle    0x1401a6e3c
0x1401a6e36: mov    r15d,edx
0x1401a6e39: mov    rsi,QWORD PTR [rbx]
0x1401a6e3c: add    rbx,0x8
0x1401a6e40: mov    QWORD PTR [rsp+0x38],rbx
0x1401a6e45: lea    r8,[rsp+0x40]
0x1401a6e4a: lea    rdx,[rsp+0x30]
0x1401a6e4f: lea    rcx,[rsp+0x38]
0x1401a6e54: call   0x14006edb0
0x1401a6e59: cmp    BYTE PTR [rax],0x0
0x1401a6e5c: jl     0x1401a6d90
0x1401a6e62: test   rsi,rsi
0x1401a6e65: mov    rdi,QWORD PTR [rsp+0x48]
0x1401a6e6a: je     0x1401a6f49
0x1401a6e70: mov    eax,DWORD PTR [rsi+0x8]
0x1401a6e73: cmp    eax,r14d
0x1401a6e76: jg     0x1401a6e8a
0x1401a6e78: mov    r14d,eax
0x1401a6e7b: jne    0x1401a6e8a
0x1401a6e7d: test   BYTE PTR [rsi+0x18],0x1
0x1401a6e81: mov    eax,0x65
0x1401a6e86: cmovne r14d,eax
0x1401a6e8a: lea    rcx,[rbp-0x20]
0x1401a6e8e: call   0x14006f620
0x1401a6e93: nop
0x1401a6e94: mov    eax,DWORD PTR [rsi+0x14]
0x1401a6e97: mov    DWORD PTR [rsp+0x28],eax
0x1401a6e9b: mov    eax,DWORD PTR [rsi+0x10]
0x1401a6e9e: mov    DWORD PTR [rsp+0x20],eax
0x1401a6ea2: mov    r9d,DWORD PTR [rsi+0xc]
0x1401a6ea6: lea    r8,[rbp-0x20]
0x1401a6eaa: xor    edx,edx
0x1401a6eac: mov    rcx,r13
0x1401a6eaf: call   0x14066d870
0x1401a6eb4: cmp    QWORD PTR [rbp-0x10],0x0
0x1401a6eb9: je     0x1401a6ecb
0x1401a6ebb: lea    rdx,[rip+0x1451136]        # 0x1415f7ff8  '  '
0x1401a6ec2: lea    rcx,[rbp-0x20]
0x1401a6ec6: call   0x14006f4f0
0x1401a6ecb: mov    ecx,DWORD PTR [rsi]
0x1401a6ecd: lea    rdx,[rbp-0x20]
0x1401a6ed1: cmp    r14d,0x65
0x1401a6ed5: jne    0x1401a6ede
0x1401a6ed7: call   0x140665970
0x1401a6edc: jmp    0x1401a6f09
0x1401a6ede: cmp    r14d,0x64
0x1401a6ee2: jne    0x1401a6eeb
0x1401a6ee4: call   0x140665bc0
0x1401a6ee9: jmp    0x1401a6f09
0x1401a6eeb: cmp    r14d,0xa
0x1401a6eef: jle    0x1401a6ef8
0x1401a6ef1: call   0x140666c00
0x1401a6ef6: jmp    0x1401a6f09
0x1401a6ef8: test   r14d,r14d
0x1401a6efb: jle    0x1401a6f04
0x1401a6efd: call   0x140667960
0x1401a6f02: jmp    0x1401a6f09
0x1401a6f04: call   0x1406686c0
0x1401a6f09: lea    rdx,[rip+0x143d7ec]        # 0x1415e46fc  '"'
0x1401a6f10: lea    rcx,[rdi+0x1cc0]
0x1401a6f17: call   0x14006f4f0
0x1401a6f1c: lea    rdx,[rbp-0x20]
0x1401a6f20: lea    rcx,[rdi+0x1cc0]
0x1401a6f27: call   0x1400b9ca0
0x1401a6f2c: lea    rdx,[rip+0x143d7c9]        # 0x1415e46fc  '"'
0x1401a6f33: lea    rcx,[rdi+0x1cc0]
0x1401a6f3a: call   0x14006f4f0
0x1401a6f3f: nop
0x1401a6f40: lea    rcx,[rbp-0x20]
0x1401a6f44: jmp    0x1401a6ff1
0x1401a6f49: lea    rcx,[rbp+0x20]
0x1401a6f4d: call   0x14006f620
0x1401a6f52: nop
0x1401a6f53: xor    r8d,r8d
0x1401a6f56: lea    rdx,[rbp+0x20]
0x1401a6f5a: mov    rcx,r13
0x1401a6f5d: call   0x140663e90
0x1401a6f62: mov    r9d,0x77
0x1401a6f68: movzx  r8d,WORD PTR [r13+0x12c]
0x1401a6f70: movzx  edx,WORD PTR [r13+0xa4]
0x1401a6f78: lea    rcx,[rip+0x233f9b9]        # 0x1424e6938
0x1401a6f7f: call   0x1400727e0
0x1401a6f84: test   al,al
0x1401a6f86: je     0x1401a6fb6
0x1401a6f88: lea    rdx,[rbp+0x20]
0x1401a6f8c: lea    rcx,[rbp+0x0]
0x1401a6f90: call   0x14006f560
0x1401a6f95: nop
0x1401a6f96: lea    rcx,[rbp+0x0]
0x1401a6f9a: call   0x1406790e0
0x1401a6f9f: lea    rdx,[rbp+0x0]
0x1401a6fa3: lea    rcx,[rbp+0x20]
0x1401a6fa7: call   0x14006f530
0x1401a6fac: nop
0x1401a6fad: lea    rcx,[rbp+0x0]
0x1401a6fb1: call   0x14006f7e0
0x1401a6fb6: lea    rdx,[rip+0x143d73f]        # 0x1415e46fc  '"'
0x1401a6fbd: lea    rcx,[rdi+0x1cc0]
0x1401a6fc4: call   0x14006f4f0
0x1401a6fc9: lea    rdx,[rbp+0x20]
0x1401a6fcd: lea    rcx,[rdi+0x1cc0]
0x1401a6fd4: call   0x1400b9ca0
0x1401a6fd9: lea    rdx,[rip+0x143d71c]        # 0x1415e46fc  '"'
0x1401a6fe0: lea    rcx,[rdi+0x1cc0]
0x1401a6fe7: call   0x14006f4f0
0x1401a6fec: nop
0x1401a6fed: lea    rcx,[rbp+0x20]
0x1401a6ff1: call   0x14006f7e0
0x1401a6ff6: mov    rax,QWORD PTR [r13+0xa98]
0x1401a6ffd: test   rax,rax
0x1401a7000: je     0x1401a7f67
0x1401a7006: xorps  xmm0,xmm0
0x1401a7009: movdqu XMMWORD PTR [rbp-0x40],xmm0
0x1401a700e: xor    esi,esi
0x1401a7010: mov    QWORD PTR [rbp-0x30],rsi
0x1401a7014: movdqu XMMWORD PTR [rsp+0x68],xmm0
0x1401a701a: mov    QWORD PTR [rsp+0x78],rsi
0x1401a701f: movdqu XMMWORD PTR [rbp-0x60],xmm0
0x1401a7024: mov    QWORD PTR [rbp-0x50],rsi
0x1401a7028: mov    rbx,QWORD PTR [rax+0x278]
0x1401a702f: mov    QWORD PTR [rsp+0x48],rbx
0x1401a7034: mov    rax,QWORD PTR [rax+0x280]
0x1401a703b: mov    QWORD PTR [rsp+0x38],rax
0x1401a7040: lea    r8,[rsp+0x38]
0x1401a7045: lea    rdx,[rsp+0x30]
0x1401a704a: lea    rcx,[rsp+0x48]
0x1401a704f: call   0x14006edb0
0x1401a7054: cmp    BYTE PTR [rax],sil
0x1401a7057: jge    0x1401a718d
0x1401a705d: nop    DWORD PTR [rax]
0x1401a7060: mov    r8,QWORD PTR [rbx]
0x1401a7063: mov    eax,DWORD PTR [r8+0xc]
0x1401a7067: cmp    eax,0xffffffff
0x1401a706a: je     0x1401a7167
0x1401a7070: cmp    eax,0x6
0x1401a7073: je     0x1401a7167
0x1401a7079: mov    eax,DWORD PTR [r8]
0x1401a707c: cmp    eax,0xa5
0x1401a7081: je     0x1401a7167
0x1401a7087: cmp    eax,0xa6
0x1401a708c: je     0x1401a7167
0x1401a7092: mov    r11,r8
0x1401a7095: cmp    DWORD PTR [r8+0x4],0x0
0x1401a709a: jg     0x1401a710c
0x1401a709c: cmp    DWORD PTR [r8+0x8],0x0
0x1401a70a1: jg     0x1401a710c
0x1401a70a3: mov    r10,QWORD PTR [rsp+0x70]
0x1401a70a8: mov    rdx,QWORD PTR [rsp+0x68]
0x1401a70ad: sub    r10,rdx
0x1401a70b0: sar    r10,0x3
0x1401a70b4: test   r10,r10
0x1401a70b7: jne    0x1401a70c3
0x1401a70b9: lea    rcx,[rsp+0x68]
0x1401a70be: jmp    0x1401a715f
0x1401a70c3: mov    ecx,esi
0x1401a70c5: test   r10,r10
0x1401a70c8: je     0x1401a70b9
0x1401a70ca: mov    r11d,DWORD PTR [r8+0x20]
0x1401a70ce: xchg   ax,ax
0x1401a70d0: mov    r9,QWORD PTR [rdx]
0x1401a70d3: cmp    DWORD PTR [r9+0x20],r11d
0x1401a70d7: jl     0x1401a70fa
0x1401a70d9: jne    0x1401a70e5
0x1401a70db: mov    eax,DWORD PTR [r8+0x24]
0x1401a70df: cmp    DWORD PTR [r9+0x24],eax
0x1401a70e3: jl     0x1401a70fa
0x1401a70e5: inc    ecx
0x1401a70e7: add    rdx,0x8
0x1401a70eb: movsxd rax,ecx
0x1401a70ee: cmp    rax,r10
0x1401a70f1: jb     0x1401a70d0
0x1401a70f3: lea    rcx,[rsp+0x68]
0x1401a70f8: jmp    0x1401a715f
0x1401a70fa: movsxd rdx,ecx
0x1401a70fd: mov    r8,rbx
0x1401a7100: lea    rcx,[rsp+0x68]
0x1401a7105: call   0x1401b9eb0
0x1401a710a: jmp    0x1401a7167
0x1401a710c: mov    r9,QWORD PTR [rbp-0x38]
0x1401a7110: mov    rdx,QWORD PTR [rbp-0x40]
0x1401a7114: sub    r9,rdx
0x1401a7117: sar    r9,0x3
0x1401a711b: test   r9,r9
0x1401a711e: je     0x1401a715b
0x1401a7120: mov    ecx,esi
0x1401a7122: mov    r10d,DWORD PTR [r11+0x20]
0x1401a7126: data16 nop WORD PTR [rax+rax*1+0x0]
0x1401a7130: mov    r8,QWORD PTR [rdx]
0x1401a7133: cmp    DWORD PTR [r8+0x20],r10d
0x1401a7137: jl     0x1401a7300
0x1401a713d: jne    0x1401a714d
0x1401a713f: mov    eax,DWORD PTR [r11+0x24]
0x1401a7143: cmp    DWORD PTR [r8+0x24],eax
0x1401a7147: jl     0x1401a7300
0x1401a714d: inc    ecx
0x1401a714f: add    rdx,0x8
0x1401a7153: movsxd rax,ecx
0x1401a7156: cmp    rax,r9
0x1401a7159: jb     0x1401a7130
0x1401a715b: lea    rcx,[rbp-0x40]
0x1401a715f: mov    rdx,rbx
0x1401a7162: call   0x1400b9910
0x1401a7167: add    rbx,0x8
0x1401a716b: mov    QWORD PTR [rsp+0x48],rbx
0x1401a7170: lea    r8,[rsp+0x38]
0x1401a7175: lea    rdx,[rsp+0x30]
0x1401a717a: lea    rcx,[rsp+0x48]
0x1401a717f: call   0x14006edb0
0x1401a7184: cmp    BYTE PTR [rax],0x0
0x1401a7187: jl     0x1401a7060
0x1401a718d: lea    rdx,[rbp-0x40]
0x1401a7191: lea    rcx,[rbp-0x60]
0x1401a7195: call   0x1400f83c0
0x1401a719a: mov    r10,QWORD PTR [rsp+0x68]
0x1401a719f: mov    QWORD PTR [rsp+0x48],r10
0x1401a71a4: mov    rax,QWORD PTR [rsp+0x70]
0x1401a71a9: mov    QWORD PTR [rsp+0x38],rax
0x1401a71ae: lea    r8,[rsp+0x38]
0x1401a71b3: lea    rdx,[rsp+0x30]
0x1401a71b8: lea    rcx,[rsp+0x48]
0x1401a71bd: call   0x14006edb0
0x1401a71c2: cmp    BYTE PTR [rax],0x0
0x1401a71c5: jge    0x1401a7201
0x1401a71c7: mov    rbx,r10
0x1401a71ca: nop    WORD PTR [rax+rax*1+0x0]
0x1401a71d0: mov    rdx,r10
0x1401a71d3: lea    rcx,[rbp-0x60]
0x1401a71d7: call   0x1400b9910
0x1401a71dc: lea    r10,[rbx+0x8]
0x1401a71e0: mov    QWORD PTR [rsp+0x48],r10
0x1401a71e5: lea    r8,[rsp+0x38]
0x1401a71ea: lea    rdx,[rsp+0x30]
0x1401a71ef: lea    rcx,[rsp+0x48]
0x1401a71f4: call   0x14006edb0
0x1401a71f9: mov    rbx,r10
0x1401a71fc: cmp    BYTE PTR [rax],0x0
0x1401a71ff: jl     0x1401a71d0
0x1401a7201: lea    rcx,[rdi+0x17f8]
0x1401a7208: call   0x1400bb940
0x1401a720d: mov    r10,QWORD PTR [rdi+0x1810]
0x1401a7214: mov    QWORD PTR [rsp+0x38],r10
0x1401a7219: mov    rax,QWORD PTR [rdi+0x1818]
0x1401a7220: mov    QWORD PTR [rsp+0x40],rax
0x1401a7225: lea    r8,[rsp+0x40]
0x1401a722a: lea    rdx,[rsp+0x30]
0x1401a722f: lea    rcx,[rsp+0x38]
0x1401a7234: call   0x14006edb0
0x1401a7239: cmp    BYTE PTR [rax],0x0
0x1401a723c: jge    0x1401a727c
0x1401a723e: mov    r11,r10
0x1401a7241: mov    rbx,r10
0x1401a7244: mov    rcx,QWORD PTR [r10]
0x1401a7247: test   rcx,rcx
0x1401a724a: je     0x1401a7254
0x1401a724c: call   0x14014ecb0
0x1401a7251: mov    r11,rbx
0x1401a7254: lea    r10,[r11+0x8]
0x1401a7258: mov    r11,r10
0x1401a725b: mov    QWORD PTR [rsp+0x38],r10
0x1401a7260: lea    r8,[rsp+0x40]
0x1401a7265: lea    rdx,[rsp+0x30]
0x1401a726a: lea    rcx,[rsp+0x38]
0x1401a726f: call   0x14006edb0
0x1401a7274: mov    rbx,r10
0x1401a7277: cmp    BYTE PTR [rax],0x0
0x1401a727a: jl     0x1401a7244
0x1401a727c: lea    rcx,[rdi+0x1810]
0x1401a7283: call   0x14006f220
0x1401a7288: mov    DWORD PTR [rdi+0x1828],esi
0x1401a728e: xor    r12b,r12b
0x1401a7291: mov    rbx,QWORD PTR [rbp-0x60]
0x1401a7295: mov    rdx,QWORD PTR [rbp-0x58]
0x1401a7299: mov    r8d,0xff
0x1401a729f: mov    rcx,rbx
0x1401a72a2: mov    rax,rbx
0x1401a72a5: cmp    rbx,rdx
0x1401a72a8: je     0x1401a7f49
0x1401a72ae: mov    eax,0x1
0x1401a72b3: cmp    rbx,rdx
0x1401a72b6: cmovb  eax,r8d
0x1401a72ba: test   al,al
0x1401a72bc: jns    0x1401a7f49
0x1401a72c2: xorps  xmm0,xmm0
0x1401a72c5: movups XMMWORD PTR [rbp-0x80],xmm0
0x1401a72c9: mov    QWORD PTR [rbp-0x70],rsi
0x1401a72cd: mov    QWORD PTR [rbp-0x68],0xf
0x1401a72d5: mov    BYTE PTR [rbp-0x80],0x0
0x1401a72d9: mov    rdx,QWORD PTR [rbx]
0x1401a72dc: mov    r8,QWORD PTR [rsp+0x68]
0x1401a72e1: mov    rax,r8
0x1401a72e4: mov    rcx,QWORD PTR [rsp+0x70]
0x1401a72e9: nop    DWORD PTR [rax+0x0]
0x1401a72f0: cmp    rax,rcx
0x1401a72f3: jae    0x1401a7335
0x1401a72f5: cmp    QWORD PTR [rax],rdx
0x1401a72f8: je     0x1401a7314
0x1401a72fa: add    rax,0x8
0x1401a72fe: jmp    0x1401a72f0
0x1401a7300: movsxd rdx,ecx
0x1401a7303: mov    r8,rbx
0x1401a7306: lea    rcx,[rbp-0x40]
0x1401a730a: call   0x1401b9eb0
0x1401a730f: jmp    0x1401a7167
0x1401a7314: sub    rax,r8
0x1401a7317: sar    rax,0x3
0x1401a731b: cmp    eax,0xffffffff
0x1401a731e: je     0x1401a7335
0x1401a7320: lea    rdx,[rip+0x1455ee1]        # 0x1415fd208  '[C:7:0:0]'
0x1401a7327: lea    rcx,[rbp-0x80]
0x1401a732b: call   0x14006f510
0x1401a7330: mov    r12b,0x1
0x1401a7333: jmp    0x1401a7358
0x1401a7335: mov    QWORD PTR [rbp-0x70],0x9
0x1401a733d: movsd  xmm0,QWORD PTR [rip+0x1455eb3]        # 0x1415fd1f8  '[C:7:0:1]'
0x1401a7345: movsd  QWORD PTR [rbp-0x80],xmm0
0x1401a734a: movzx  eax,BYTE PTR [rip+0x1455eaf]        # 0x1415fd200  ']'
0x1401a7351: mov    BYTE PTR [rbp-0x78],al
0x1401a7354: mov    BYTE PTR [rbp-0x77],0x0
0x1401a7358: xorps  xmm0,xmm0
0x1401a735b: movups XMMWORD PTR [rbp-0x20],xmm0
0x1401a735f: mov    QWORD PTR [rbp-0x10],rsi
0x1401a7363: mov    QWORD PTR [rbp-0x8],0xf
0x1401a736b: mov    BYTE PTR [rbp-0x20],0x0
0x1401a736f: movzx  eax,BYTE PTR [r13+0x12e]
0x1401a7377: cmp    al,0x1
0x1401a7379: jne    0x1401a7384
0x1401a737b: lea    rdx,[rip+0x1523dda]        # 0x1416cb15c  'he'
0x1401a7382: jmp    0x1401a739e
0x1401a7384: test   al,al
0x1401a7386: jne    0x1401a7397
0x1401a7388: lea    rdx,[rip+0x1523dc9]        # 0x1416cb158  'she'
0x1401a738f: mov    r8d,0x3
0x1401a7395: jmp    0x1401a73a4
0x1401a7397: lea    rdx,[rip+0x14420e6]        # 0x1415e9484  'it'
0x1401a739e: mov    r8d,0x2
0x1401a73a4: lea    rcx,[rbp-0x20]
0x1401a73a8: call   0x14006f860
0x1401a73ad: lea    rax,[rbp-0x20]
0x1401a73b1: cmp    QWORD PTR [rbp-0x8],0xf
0x1401a73b6: cmova  rax,QWORD PTR [rbp-0x20]
0x1401a73bb: add    BYTE PTR [rax],0x9f
0x1401a73be: lea    rax,[rbp-0x20]
0x1401a73c2: cmp    QWORD PTR [rbp-0x8],0xf
0x1401a73c7: cmova  rax,QWORD PTR [rbp-0x20]
0x1401a73cc: add    BYTE PTR [rax],0x41
0x1401a73cf: lea    rdx,[rbp-0x20]
0x1401a73d3: cmp    QWORD PTR [rbp-0x8],0xf
0x1401a73d8: cmova  rdx,QWORD PTR [rbp-0x20]
0x1401a73dd: mov    r8,QWORD PTR [rbp-0x10]
0x1401a73e1: lea    rcx,[rbp-0x80]
0x1401a73e5: call   0x14006f9a0
0x1401a73ea: mov    r8d,0x1
0x1401a73f0: lea    rdx,[rip+0x143c329]        # 0x1415e3720  ' '
0x1401a73f7: lea    rcx,[rbp-0x80]
0x1401a73fb: call   0x14006f9a0
0x1401a7400: mov    rax,QWORD PTR [rbx]
0x1401a7403: mov    r15d,DWORD PTR [rax]
0x1401a7406: cmp    DWORD PTR [rax+0x8],0x0
0x1401a740a: jne    0x1401a743d
0x1401a740c: test   BYTE PTR [rax+0x18],0x8
0x1401a7410: je     0x1401a743d
0x1401a7412: mov    r15d,0xffffffff
0x1401a7418: mov    r14d,r15d
0x1401a741b: lea    esi,[r14+0x1]
0x1401a741f: lea    rcx,[rbp-0x80]
0x1401a7423: test   r12b,r12b
0x1401a7426: je     0x1401a74ac
0x1401a742c: lea    rdx,[rip+0x145606d]        # 0x1415fd4a0  "didn't feel "
0x1401a7433: call   0x14006f4f0
0x1401a7438: jmp    0x1401a74ca
0x1401a743d: mov    r14d,r15d
0x1401a7440: lea    eax,[r15+0x1]
0x1401a7444: cmp    eax,0xa9
0x1401a7449: ja     0x1401a74ba
0x1401a744b: cdqe
0x1401a744d: lea    rdx,[rip+0xffffffffffe58bac]        # 0x140000000
0x1401a7454: movzx  eax,BYTE PTR [rdx+rax*1+0x1a819c]
0x1401a745c: mov    ecx,DWORD PTR [rdx+rax*4+0x1a8188]
0x1401a7463: add    rcx,rdx
0x1401a7466: jmp    rcx
0x1401a7468: lea    rdx,[rip+0x1455d7d]        # 0x1415fd1ec  'was '
0x1401a746f: lea    rax,[rip+0x1455d72]        # 0x1415fd1e8  'is '
0x1401a7476: test   r12b,r12b
0x1401a7479: cmove  rdx,rax
0x1401a747d: lea    rcx,[rbp-0x80]
0x1401a7481: call   0x14006f4f0
0x1401a7486: lea    esi,[r15+0x1]
0x1401a748a: jmp    0x1401a74ca
0x1401a748c: lea    rdx,[rip+0x1456035]        # 0x1415fd4c8  'felt '
0x1401a7493: lea    rax,[rip+0x1456026]        # 0x1415fd4c0  'feels '
0x1401a749a: jmp    0x1401a7476
0x1401a749c: lea    rdx,[rip+0x1456015]        # 0x1415fd4b8  'was in '
0x1401a74a3: lea    rax,[rip+0x1456006]        # 0x1415fd4b0  'is in '
0x1401a74aa: jmp    0x1401a7476
0x1401a74ac: lea    rdx,[rip+0x1455fdd]        # 0x1415fd490  "doesn't feel "
0x1401a74b3: call   0x14006f4f0
0x1401a74b8: jmp    0x1401a74ca
0x1401a74ba: lea    esi,[r15+0x1]
0x1401a74be: cmp    esi,0xa9
0x1401a74c4: ja     0x1401a75a1
0x1401a74ca: movsxd rax,esi
0x1401a74cd: lea    rsi,[rip+0xffffffffffe58b2c]        # 0x140000000
0x1401a74d4: movzx  eax,BYTE PTR [rsi+rax*1+0x1a826c]
0x1401a74dc: mov    ecx,DWORD PTR [rsi+rax*4+0x1a8248]
0x1401a74e3: add    rcx,rsi
0x1401a74e6: jmp    rcx
0x1401a74e8: lea    rdx,[rip+0x1455f91]        # 0x1415fd480  '[C:6:0:0]'
0x1401a74ef: lea    rcx,[rbp-0x80]
0x1401a74f3: call   0x14006f4f0
0x1401a74f8: lea    eax,[r14+0x1]
0x1401a74fc: jmp    0x1401a75b7
0x1401a7501: lea    rdx,[rip+0x1455f68]        # 0x1415fd470  '[C:2:0:1]'
0x1401a7508: lea    rcx,[rbp-0x80]
0x1401a750c: call   0x14006f4f0
0x1401a7511: lea    eax,[r14+0x1]
0x1401a7515: jmp    0x1401a75b7
0x1401a751a: lea    rdx,[rip+0x1455f3f]        # 0x1415fd460  '[C:3:0:1]'
0x1401a7521: lea    rcx,[rbp-0x80]
0x1401a7525: call   0x14006f4f0
0x1401a752a: lea    eax,[r14+0x1]
0x1401a752e: jmp    0x1401a75b7
0x1401a7533: lea    rdx,[rip+0x1455f16]        # 0x1415fd450  '[C:5:0:1]'
0x1401a753a: lea    rcx,[rbp-0x80]
0x1401a753e: call   0x14006f4f0
0x1401a7543: lea    eax,[r14+0x1]
0x1401a7547: jmp    0x1401a75b7
0x1401a7549: lea    rdx,[rip+0x1455ef0]        # 0x1415fd440  '[C:4:0:1]'
0x1401a7550: lea    rcx,[rbp-0x80]
0x1401a7554: call   0x14006f4f0
0x1401a7559: lea    eax,[r14+0x1]
0x1401a755d: jmp    0x1401a75b7
0x1401a755f: lea    rdx,[rip+0x1455eca]        # 0x1415fd430  '[C:6:0:1]'
0x1401a7566: lea    rcx,[rbp-0x80]
0x1401a756a: call   0x14006f4f0
0x1401a756f: lea    eax,[r14+0x1]
0x1401a7573: jmp    0x1401a75b7
0x1401a7575: lea    rdx,[rip+0x1455c8c]        # 0x1415fd208  '[C:7:0:0]'
0x1401a757c: lea    rcx,[rbp-0x80]
0x1401a7580: call   0x14006f4f0
0x1401a7585: lea    eax,[r14+0x1]
0x1401a7589: jmp    0x1401a75b7
0x1401a758b: lea    rdx,[rip+0x1455e8e]        # 0x1415fd420  '[C:1:0:1]'
0x1401a7592: lea    rcx,[rbp-0x80]
0x1401a7596: call   0x14006f4f0
0x1401a759b: lea    eax,[r14+0x1]
0x1401a759f: jmp    0x1401a75b7
0x1401a75a1: lea    rsi,[rip+0xffffffffffe58a58]        # 0x140000000
0x1401a75a8: lea    eax,[r15+0x1]
0x1401a75ac: cmp    eax,0xa9
0x1401a75b1: ja     0x1401a7bf6
0x1401a75b7: cdqe
0x1401a75b9: mov    ecx,DWORD PTR [rsi+rax*4+0x1a8318]
0x1401a75c0: add    rcx,rsi
0x1401a75c3: jmp    rcx
0x1401a75c5: lea    rdx,[rip+0x1455e4c]        # 0x1415fd418  'annoyed'
0x1401a75cc: jmp    0x1401a7bed
0x1401a75d1: lea    rdx,[rip+0x1455e30]        # 0x1415fd408  'satisfied'
0x1401a75d8: jmp    0x1401a7bed
0x1401a75dd: lea    rdx,[rip+0x1455e1c]        # 0x1415fd400  'grouchy'
0x1401a75e4: jmp    0x1401a7bed
0x1401a75e9: lea    rdx,[rip+0x1455f74]        # 0x1415fd564  'grumpy'
0x1401a75f0: jmp    0x1401a7bed
0x1401a75f5: lea    rdx,[rip+0x1455f5c]        # 0x1415fd558  'fondness'
0x1401a75fc: jmp    0x1401a7bed
0x1401a7601: lea    rdx,[rip+0x1455f40]        # 0x1415fd548  'suspicious'
0x1401a7608: jmp    0x1401a7bed
0x1401a760d: lea    rdx,[rip+0x1455f2c]        # 0x1415fd540  'alarmed'
0x1401a7614: jmp    0x1401a7bed
0x1401a7619: lea    rdx,[rip+0x1455f18]        # 0x1415fd538  'shocked'
0x1401a7620: jmp    0x1401a7bed
0x1401a7625: lea    rdx,[rip+0x1455efc]        # 0x1415fd528  'horrified'
0x1401a762c: jmp    0x1401a7bed
0x1401a7631: lea    rdx,[rip+0x1455ed8]        # 0x1415fd510  'grim satisfaction'
0x1401a7638: jmp    0x1401a7bed
0x1401a763d: lea    rcx,[rbp-0x80]
0x1401a7641: test   r12b,r12b
0x1401a7644: je     0x1401a7652
0x1401a7646: lea    rdx,[rip+0x1455ebb]        # 0x1415fd508  'grieved'
0x1401a764d: jmp    0x1401a7bf1
0x1401a7652: lea    rdx,[rip+0x1455ea7]        # 0x1415fd500  'grieves'
0x1401a7659: jmp    0x1401a7bf1
0x1401a765e: lea    rdx,[rip+0x1455e93]        # 0x1415fd4f8  'triumph'
0x1401a7665: jmp    0x1401a7bed
0x1401a766a: lea    rcx,[rbp-0x80]
0x1401a766e: test   r12b,r12b
0x1401a7671: je     0x1401a767f
0x1401a7673: lea    rdx,[rip+0x1455e76]        # 0x1415fd4f0  'raged'
0x1401a767a: jmp    0x1401a7bf1
0x1401a767f: lea    rdx,[rip+0x1455e62]        # 0x1415fd4e8  'rages'
0x1401a7686: jmp    0x1401a7bf1
0x1401a768b: lea    rdx,[rip+0x1455e4e]        # 0x1415fd4e0  'excited'
0x1401a7692: jmp    0x1401a7bed
0x1401a7697: lea    rdx,[rip+0x1455e3a]        # 0x1415fd4d8  'gaiety'
0x1401a769e: jmp    0x1401a7bed
0x1401a76a3: lea    rdx,[rip+0x1455e2a]        # 0x1415fd4d4  'sad'
0x1401a76aa: jmp    0x1401a7bed
0x1401a76af: lea    rdx,[rip+0x1455e1a]        # 0x1415fd4d0  'joy'
0x1401a76b6: jmp    0x1401a7bed
0x1401a76bb: lea    rdx,[rip+0x1455f6e]        # 0x1415fd630  'blissful'
0x1401a76c2: jmp    0x1401a7bed
0x1401a76c7: lea    rdx,[rip+0x1455f56]        # 0x1415fd624  'love'
0x1401a76ce: jmp    0x1401a7bed
0x1401a76d3: lea    rdx,[rip+0x1455f3e]        # 0x1415fd618  'vengeful'
0x1401a76da: jmp    0x1401a7bed
0x1401a76df: lea    rdx,[rip+0x1455f22]        # 0x1415fd608  'accepting'
0x1401a76e6: jmp    0x1401a7bed
0x1401a76eb: lea    rdx,[rip+0x1455f06]        # 0x1415fd5f8  'admiration'
0x1401a76f2: jmp    0x1401a7bed
0x1401a76f7: lea    rdx,[rip+0x1455eea]        # 0x1415fd5e8  'adoration'
0x1401a76fe: jmp    0x1401a7bed
0x1401a7703: lea    rdx,[rip+0x1455ece]        # 0x1415fd5d8  'affection'
0x1401a770a: jmp    0x1401a7bed
0x1401a770f: lea    rdx,[rip+0x1455eb2]        # 0x1415fd5c8  'agitated'
0x1401a7716: jmp    0x1401a7bed
0x1401a771b: lea    rdx,[rip+0x1455e96]        # 0x1415fd5b8  'aggravated'
0x1401a7722: jmp    0x1401a7bed
0x1401a7727: lea    rdx,[rip+0x1455e7e]        # 0x1415fd5ac  'agony'
0x1401a772e: jmp    0x1401a7bed
0x1401a7733: lea    rdx,[rip+0x1455e66]        # 0x1415fd5a0  'alienated'
0x1401a773a: jmp    0x1401a7bed
0x1401a773f: lea    rdx,[rip+0x1455e4e]        # 0x1415fd594  'amazed'
0x1401a7746: jmp    0x1401a7bed
0x1401a774b: lea    rdx,[rip+0x1455e36]        # 0x1415fd588  'ambivalent'
0x1401a7752: jmp    0x1401a7bed
0x1401a7757: lea    rdx,[rip+0x1455e22]        # 0x1415fd580  'amused'
0x1401a775e: jmp    0x1401a7bed
0x1401a7763: lea    rdx,[rip+0x1455e0e]        # 0x1415fd578  'angry'
0x1401a776a: jmp    0x1401a7bed
0x1401a776f: lea    rdx,[rip+0x1455dfa]        # 0x1415fd570  'anguish'
0x1401a7776: jmp    0x1401a7bed
0x1401a777b: lea    rdx,[rip+0x1455f6e]        # 0x1415fd6f0  'anxious'
0x1401a7782: jmp    0x1401a7bed
0x1401a7787: lea    rdx,[rip+0x1455f52]        # 0x1415fd6e0  'apathetic'
0x1401a778e: jmp    0x1401a7bed
0x1401a7793: lea    rdx,[rip+0x1455f3e]        # 0x1415fd6d8  'aroused'
0x1401a779a: jmp    0x1401a7bed
0x1401a779f: lea    rdx,[rip+0x1455f22]        # 0x1415fd6c8  'astonished'
0x1401a77a6: jmp    0x1401a7bed
0x1401a77ab: lea    rdx,[rip+0x1455f06]        # 0x1415fd6b8  'aversion'
0x1401a77b2: jmp    0x1401a7bed
0x1401a77b7: lea    rdx,[rip+0x1455ef6]        # 0x1415fd6b4  'awe'
0x1401a77be: jmp    0x1401a7bed
0x1401a77c3: lea    rdx,[rip+0x1455ee2]        # 0x1415fd6ac  'bitter'
0x1401a77ca: jmp    0x1401a7bed
0x1401a77cf: lea    rdx,[rip+0x1455ece]        # 0x1415fd6a4  'bored'
0x1401a77d6: jmp    0x1401a7bed
0x1401a77db: lea    rdx,[rip+0x1455eba]        # 0x1415fd69c  'caring'
0x1401a77e2: jmp    0x1401a7bed
0x1401a77e7: lea    rdx,[rip+0x1455ea2]        # 0x1415fd690  'confused'
0x1401a77ee: jmp    0x1401a7bed
0x1401a77f3: lea    rdx,[rip+0x1455e86]        # 0x1415fd680  'contemptuous'
0x1401a77fa: jmp    0x1401a7bed
0x1401a77ff: lea    rdx,[rip+0x1455e72]        # 0x1415fd678  'content'
0x1401a7806: jmp    0x1401a7bed
0x1401a780b: lea    rdx,[rip+0x1455e56]        # 0x1415fd668  'dejected'
0x1401a7812: jmp    0x1401a7bed
0x1401a7817: lea    rdx,[rip+0x1455e3a]        # 0x1415fd658  'delighted'
0x1401a781e: jmp    0x1401a7bed
0x1401a7823: lea    rdx,[rip+0x1455e26]        # 0x1415fd650  'despair'
0x1401a782a: jmp    0x1401a7bed
0x1401a782f: lea    rdx,[rip+0x1455e0a]        # 0x1415fd640  'disappointed'
0x1401a7836: jmp    0x1401a7bed
0x1401a783b: lea    rdx,[rip+0x1455f76]        # 0x1415fd7b8  'disgusted'
0x1401a7842: jmp    0x1401a7bed
0x1401a7847: lea    rdx,[rip+0x1455f5a]        # 0x1415fd7a8  'disillusioned'
0x1401a784e: jmp    0x1401a7bed
0x1401a7853: lea    rdx,[rip+0x1455f46]        # 0x1415fd7a0  'dislike'
0x1401a785a: jmp    0x1401a7bed
0x1401a785f: lea    rdx,[rip+0x1455f2a]        # 0x1415fd790  'dismayed'
0x1401a7866: jmp    0x1401a7bed
0x1401a786b: lea    rdx,[rip+0x1455f0e]        # 0x1415fd780  'displeasure'
0x1401a7872: jmp    0x1401a7bed
0x1401a7877: lea    rdx,[rip+0x1455ef2]        # 0x1415fd770  'distressed'
0x1401a787e: jmp    0x1401a7bed
0x1401a7883: lea    rdx,[rip+0x1455eda]        # 0x1415fd764  'eager'
0x1401a788a: jmp    0x1401a7bed
0x1401a788f: lea    rdx,[rip+0x1455ec6]        # 0x1415fd75c  'elated'
0x1401a7896: jmp    0x1401a7bed
0x1401a789b: lea    rdx,[rip+0x1455eae]        # 0x1415fd750  'embarrassed'
0x1401a78a2: jmp    0x1401a7bed
0x1401a78a7: lea    rdx,[rip+0x1455e9a]        # 0x1415fd748  'empathy'
0x1401a78ae: jmp    0x1401a7bed
0x1401a78b3: lea    rdx,[rip+0x1455e82]        # 0x1415fd73c  'empty'
0x1401a78ba: jmp    0x1401a7bed
0x1401a78bf: lea    rdx,[rip+0x1455e6a]        # 0x1415fd730  'enjoyment'
0x1401a78c6: jmp    0x1401a7bed
0x1401a78cb: lea    rdx,[rip+0x1455e4e]        # 0x1415fd720  'exasperated'
0x1401a78d2: jmp    0x1401a7bed
0x1401a78d7: lea    rdx,[rip+0x1455e32]        # 0x1415fd710  'exhilarated'
0x1401a78de: jmp    0x1401a7bed
0x1401a78e3: lea    rdx,[rip+0x1455e1a]        # 0x1415fd704  'afraid'
0x1401a78ea: jmp    0x1401a7bed
0x1401a78ef: lea    rdx,[rip+0x1455e02]        # 0x1415fd6f8  'ferocity'
0x1401a78f6: jmp    0x1401a7bed
0x1401a78fb: lea    rdx,[rip+0x1455f7a]        # 0x1415fd87c  'free'
0x1401a7902: jmp    0x1401a7bed
0x1401a7907: lea    rdx,[rip+0x1455f62]        # 0x1415fd870  'frightened'
0x1401a790e: jmp    0x1401a7bed
0x1401a7913: lea    rdx,[rip+0x1455f46]        # 0x1415fd860  'frustrated'
0x1401a791a: jmp    0x1401a7bed
0x1401a791f: lea    rdx,[rip+0x1455f32]        # 0x1415fd858  'gleeful'
0x1401a7926: jmp    0x1401a7bed
0x1401a792b: lea    rdx,[rip+0x1455f1a]        # 0x1415fd84c  'gloomy'
0x1401a7932: jmp    0x1401a7bed
0x1401a7937: lea    rdx,[rip+0x1455f06]        # 0x1415fd844  'glum'
0x1401a793e: jmp    0x1401a7bed
0x1401a7943: lea    rdx,[rip+0x1455eee]        # 0x1415fd838  'gratitude'
0x1401a794a: jmp    0x1401a7bed
0x1401a794f: lea    rdx,[rip+0x1455eda]        # 0x1415fd830  'guilty'
0x1401a7956: jmp    0x1401a7bed
0x1401a795b: lea    rdx,[rip+0x1455ec6]        # 0x1415fd828  'happy'
0x1401a7962: jmp    0x1401a7bed
0x1401a7967: lea    rdx,[rip+0x1455eb2]        # 0x1415fd820  'hateful'
0x1401a796e: jmp    0x1401a7bed
0x1401a7973: lea    rdx,[rip+0x1455e9a]        # 0x1415fd814  'hope'
0x1401a797a: jmp    0x1401a7bed
0x1401a797f: lea    rdx,[rip+0x1455e82]        # 0x1415fd808  'hopeless'
0x1401a7986: jmp    0x1401a7bed
0x1401a798b: lea    rdx,[rip+0x1455e66]        # 0x1415fd7f8  'humiliated'
0x1401a7992: jmp    0x1401a7bed
0x1401a7997: lea    rdx,[rip+0x1455e4a]        # 0x1415fd7e8  'insulted'
0x1401a799e: jmp    0x1401a7bed
0x1401a79a3: lea    rdx,[rip+0x1455e2e]        # 0x1415fd7d8  'interested'
0x1401a79aa: jmp    0x1401a7bed
0x1401a79af: lea    rdx,[rip+0x1455e12]        # 0x1415fd7c8  'irritated'
0x1401a79b6: jmp    0x1401a7bed
0x1401a79bb: lea    rdx,[rip+0x1455f7e]        # 0x1415fd940  'isolated'
0x1401a79c2: jmp    0x1401a7bed
0x1401a79c7: lea    rdx,[rip+0x1455f66]        # 0x1415fd934  'jolly'
0x1401a79ce: jmp    0x1401a7bed
0x1401a79d3: lea    rdx,[rip+0x1455f52]        # 0x1415fd92c  'jovial'
0x1401a79da: jmp    0x1401a7bed
0x1401a79df: lea    rdx,[rip+0x1455f3a]        # 0x1415fd920  'jubilant'
0x1401a79e6: jmp    0x1401a7bed
0x1401a79eb: lea    rdx,[rip+0x1455f1e]        # 0x1415fd910  'loathing'
0x1401a79f2: jmp    0x1401a7bed
0x1401a79f7: lea    rdx,[rip+0x1455f0a]        # 0x1415fd908  'lonely'
0x1401a79fe: jmp    0x1401a7bed
0x1401a7a03: lea    rdx,[rip+0x1455ef6]        # 0x1415fd900  'lustful'
0x1401a7a0a: jmp    0x1401a7bed
0x1401a7a0f: lea    rdx,[rip+0x1455eda]        # 0x1415fd8f0  'miserable'
0x1401a7a16: jmp    0x1401a7bed
0x1401a7a1b: lea    rdx,[rip+0x1455ebe]        # 0x1415fd8e0  'mortified'
0x1401a7a22: jmp    0x1401a7bed
0x1401a7a27: lea    rdx,[rip+0x1455eaa]        # 0x1415fd8d8  'nervous'
0x1401a7a2e: jmp    0x1401a7bed
0x1401a7a33: lea    rdx,[rip+0x1455e8e]        # 0x1415fd8c8  'nostalgic'
0x1401a7a3a: jmp    0x1401a7bed
0x1401a7a3f: lea    rdx,[rip+0x1455e72]        # 0x1415fd8b8  'optimistic'
0x1401a7a46: jmp    0x1401a7bed
0x1401a7a4b: lea    rdx,[rip+0x1455e56]        # 0x1415fd8a8  'outraged'
0x1401a7a52: jmp    0x1401a7bed
0x1401a7a57: lea    rcx,[rbp-0x80]
0x1401a7a5b: test   r12b,r12b
0x1401a7a5e: je     0x1401a7a6c
0x1401a7a60: lea    rdx,[rip+0x1455e31]        # 0x1415fd898  'panicked'
0x1401a7a67: jmp    0x1401a7bf1
0x1401a7a6c: lea    rdx,[rip+0x1455e1d]        # 0x1415fd890  'panics'
0x1401a7a73: jmp    0x1401a7bf1
0x1401a7a78: lea    rdx,[rip+0x1455e09]        # 0x1415fd888  'patient'
0x1401a7a7f: jmp    0x1401a7bed
0x1401a7a84: lea    rdx,[rip+0x1455f95]        # 0x1415fda20  'passionate'
0x1401a7a8b: jmp    0x1401a7bed
0x1401a7a90: lea    rdx,[rip+0x1455f79]        # 0x1415fda10  'pleasure'
0x1401a7a97: jmp    0x1401a7bed
0x1401a7a9c: lea    rdx,[rip+0x1455f61]        # 0x1415fda04  'proud'
0x1401a7aa3: jmp    0x1401a7bed
0x1401a7aa8: lea    rdx,[rip+0x1455f49]        # 0x1415fd9f8  'enraptured'
0x1401a7aaf: jmp    0x1401a7bed
0x1401a7ab4: lea    rdx,[rip+0x1455f2d]        # 0x1415fd9e8  'rejected'
0x1401a7abb: jmp    0x1401a7bed
0x1401a7ac0: lea    rdx,[rip+0x1455f11]        # 0x1415fd9d8  'relieved'
0x1401a7ac7: jmp    0x1401a7bed
0x1401a7acc: lea    rdx,[rip+0x1455ef5]        # 0x1415fd9c8  'regretful'
0x1401a7ad3: jmp    0x1401a7bed
0x1401a7ad8: lea    rdx,[rip+0x1455ed9]        # 0x1415fd9b8  'remorseful'
0x1401a7adf: jmp    0x1401a7bed
0x1401a7ae4: lea    rdx,[rip+0x1455ebd]        # 0x1415fd9a8  'repentant'
0x1401a7aeb: jmp    0x1401a7bed
0x1401a7af0: lea    rdx,[rip+0x1455ea1]        # 0x1415fd998  'resentful'
0x1401a7af7: jmp    0x1401a7bed
0x1401a7afc: lea    rdx,[rip+0x1455e85]        # 0x1415fd988  'restless'
0x1401a7b03: jmp    0x1401a7bed
0x1401a7b08: lea    rdx,[rip+0x1455e69]        # 0x1415fd978  'indignant'
0x1401a7b0f: jmp    0x1401a7bed
0x1401a7b14: lea    rdx,[rip+0x1455e4d]        # 0x1415fd968  'self-pity'
0x1401a7b1b: jmp    0x1401a7bed
0x1401a7b20: lea    rdx,[rip+0x1455e39]        # 0x1415fd960  'servile'
0x1401a7b27: jmp    0x1401a7bed
0x1401a7b2c: lea    rdx,[rip+0x1455e25]        # 0x1415fd958  'shaken'
0x1401a7b33: jmp    0x1401a7bed
0x1401a7b38: lea    rdx,[rip+0x1455e11]        # 0x1415fd950  'ashamed'
0x1401a7b3f: jmp    0x1401a7bed
0x1401a7b44: lea    rdx,[rip+0x1455fad]        # 0x1415fdaf8  'sympathy'
0x1401a7b4b: jmp    0x1401a7bed
0x1401a7b50: lea    rdx,[rip+0x1455f91]        # 0x1415fdae8  'tenderness'
0x1401a7b57: jmp    0x1401a7bed
0x1401a7b5c: lea    rdx,[rip+0x1455f75]        # 0x1415fdad8  'terrified'
0x1401a7b63: jmp    0x1401a7bed
0x1401a7b68: lea    rdx,[rip+0x1455f59]        # 0x1415fdac8  'thrilled'
0x1401a7b6f: jmp    0x1401a7bed
0x1401a7b71: lea    rdx,[rip+0x1455f48]        # 0x1415fdac0  'uneasy'
0x1401a7b78: jmp    0x1401a7bed
0x1401a7b7a: lea    rdx,[rip+0x1455f37]        # 0x1415fdab8  'unhappy'
0x1401a7b81: jmp    0x1401a7bed
0x1401a7b83: lea    rdx,[rip+0x1455f26]        # 0x1415fdab0  'wonder'
0x1401a7b8a: jmp    0x1401a7bed
0x1401a7b8c: lea    rdx,[rip+0x1455f15]        # 0x1415fdaa8  'worried'
0x1401a7b93: jmp    0x1401a7bed
0x1401a7b95: lea    rdx,[rip+0x1455efc]        # 0x1415fda98  'wrathful'
0x1401a7b9c: jmp    0x1401a7bed
0x1401a7b9e: lea    rdx,[rip+0x1455eeb]        # 0x1415fda90  'zealous'
0x1401a7ba5: jmp    0x1401a7bed
0x1401a7ba7: lea    rdx,[rip+0x1455eca]        # 0x1415fda78  'existential crisis'
0x1401a7bae: jmp    0x1401a7bed
0x1401a7bb0: lea    rdx,[rip+0x1455eb1]        # 0x1415fda68  'defeated'
0x1401a7bb7: jmp    0x1401a7bed
0x1401a7bb9: lea    rdx,[rip+0x1455e98]        # 0x1415fda58  'expectant'
0x1401a7bc0: jmp    0x1401a7bed
0x1401a7bc2: lea    rdx,[rip+0x1455e87]        # 0x1415fda50  'doubt'
0x1401a7bc9: jmp    0x1401a7bed
0x1401a7bcb: lea    rdx,[rip+0x1455e6e]        # 0x1415fda40  'enthusiastic'
0x1401a7bd2: jmp    0x1401a7bed
0x1401a7bd4: lea    rdx,[rip+0x1455e55]        # 0x1415fda30  'pessimistic'
0x1401a7bdb: jmp    0x1401a7bed
0x1401a7bdd: lea    rdx,[rip+0x145604c]        # 0x1415fdc30  'euphoric'
0x1401a7be4: jmp    0x1401a7bed
0x1401a7be6: lea    rdx,[rip+0x1456033]        # 0x1415fdc20  'anything'
0x1401a7bed: lea    rcx,[rbp-0x80]
0x1401a7bf1: call   0x14006f4f0
0x1401a7bf6: mov    rax,QWORD PTR [rbx]
0x1401a7bf9: lea    rcx,[rbp-0x80]
0x1401a7bfd: test   BYTE PTR [rax+0x18],0x70
0x1401a7c01: je     0x1401a7e14
0x1401a7c07: test   r12b,r12b
0x1401a7c0a: lea    rdx,[rip+0x1455fff]        # 0x1415fdc10  ' [C:5:0:0]'
0x1401a7c11: jne    0x1401a7c1a
0x1401a7c13: lea    rdx,[rip+0x1455fe6]        # 0x1415fdc00  ' [C:5:0:1]'
0x1401a7c1a: call   0x14006f4f0
0x1401a7c1f: mov    rax,QWORD PTR [rbx]
0x1401a7c22: movsxd rcx,DWORD PTR [rax]
0x1401a7c25: cmp    ecx,0xa8
0x1401a7c2b: ja     0x1401a7c53
0x1401a7c2d: movzx  eax,BYTE PTR [rsi+rcx*1+0x1a85d0]
0x1401a7c35: mov    ecx,DWORD PTR [rsi+rax*4+0x1a85c0]
0x1401a7c3c: add    rcx,rsi
0x1401a7c3f: jmp    rcx
0x1401a7c41: lea    rdx,[rip+0x1455fa8]        # 0x1415fdbf0  'reliving '
0x1401a7c48: jmp    0x1401a7c5a
0x1401a7c4a: lea    rdx,[rip+0x1455f8f]        # 0x1415fdbe0  'dwelling upon '
0x1401a7c51: jmp    0x1401a7c5a
0x1401a7c53: lea    rdx,[rip+0x1455f76]        # 0x1415fdbd0  'remembering '
0x1401a7c5a: lea    rcx,[rbp-0x80]
0x1401a7c5e: call   0x14006f4f0
0x1401a7c63: lea    rcx,[rbp-0x80]
0x1401a7c67: test   r12b,r12b
0x1401a7c6a: lea    rdx,[rip+0x1455f4f]        # 0x1415fdbc0  ' [C:7:0:0]'
0x1401a7c71: jne    0x1401a7c7a
0x1401a7c73: lea    rdx,[rip+0x1455f36]        # 0x1415fdbb0  ' [C:7:0:1]'
0x1401a7c7a: call   0x14006f4f0
0x1401a7c7f: mov    rax,QWORD PTR [rbx]
0x1401a7c82: mov    ecx,DWORD PTR [rax+0x14]
0x1401a7c85: mov    BYTE PTR [rsp+0x28],0x0
0x1401a7c8a: mov    DWORD PTR [rsp+0x20],ecx
0x1401a7c8e: mov    r9d,DWORD PTR [rax+0x10]
0x1401a7c92: mov    r8d,DWORD PTR [rax+0xc]
0x1401a7c96: lea    rdx,[rbp-0x80]
0x1401a7c9a: mov    rcx,r13
0x1401a7c9d: call   0x140e273d0
0x1401a7ca2: mov    rax,QWORD PTR [rbx]
0x1401a7ca5: test   DWORD PTR [rax+0x18],0x180
0x1401a7cac: je     0x1401a7e4f
0x1401a7cb2: lea    rcx,[rbp+0x0]
0x1401a7cb6: call   0x14006f620
0x1401a7cbb: nop
0x1401a7cbc: lea    rdx,[rbp+0x0]
0x1401a7cc0: movzx  ecx,BYTE PTR [r13+0x12e]
0x1401a7cc8: call   0x140aa1830
0x1401a7ccd: lea    rcx,[rbp+0x20]
0x1401a7cd1: call   0x14006f620
0x1401a7cd6: nop
0x1401a7cd7: xor    r8d,r8d
0x1401a7cda: lea    rdx,[rbp+0x20]
0x1401a7cde: movzx  ecx,BYTE PTR [r13+0x12e]
0x1401a7ce6: call   0x140aa18d0
0x1401a7ceb: lea    rcx,[rbp-0x80]
0x1401a7cef: test   r12b,r12b
0x1401a7cf2: lea    rdx,[rip+0x1455ea7]        # 0x1415fdba0  ', [C:5:0:0]'
0x1401a7cf9: jne    0x1401a7d02
0x1401a7cfb: lea    rdx,[rip+0x1455e8e]        # 0x1415fdb90  ', [C:5:0:1]'
0x1401a7d02: call   0x14006f4f0
0x1401a7d07: lea    rdx,[rip+0x1455e5a]        # 0x1415fdb68  'and mulling over the recurring memory '
0x1401a7d0e: lea    rcx,[rbp-0x80]
0x1401a7d12: call   0x14006f4f0
0x1401a7d17: mov    rax,QWORD PTR [rbx]
0x1401a7d1a: mov    ecx,DWORD PTR [rax+0x18]
0x1401a7d1d: mov    eax,ecx
0x1401a7d1f: and    eax,0x180
0x1401a7d24: cmp    eax,0x180
0x1401a7d29: jne    0x1401a7d8b
0x1401a7d2b: lea    rdx,[rip+0x1455e26]        # 0x1415fdb58  'allowed '
0x1401a7d32: lea    rcx,[rbp-0x80]
0x1401a7d36: call   0x14006f4f0
0x1401a7d3b: lea    rdx,[rbp+0x0]
0x1401a7d3f: lea    rcx,[rbp-0x80]
0x1401a7d43: call   0x1400b9ca0
0x1401a7d48: lea    rdx,[rip+0x1455df9]        # 0x1415fdb48  ' to rethink '
0x1401a7d4f: lea    rcx,[rbp-0x80]
0x1401a7d53: call   0x14006f4f0
0x1401a7d58: lea    rdx,[rbp+0x20]
0x1401a7d5c: lea    rcx,[rbp-0x80]
0x1401a7d60: call   0x1400b9ca0
0x1401a7d65: lea    rdx,[rip+0x1455db4]        # 0x1415fdb20  ' intellectual values and changed '
0x1401a7d6c: lea    rcx,[rbp-0x80]
0x1401a7d70: call   0x14006f4f0
0x1401a7d75: lea    rdx,[rbp+0x20]
0x1401a7d79: lea    rcx,[rbp-0x80]
0x1401a7d7d: call   0x1400b9ca0
0x1401a7d82: lea    rdx,[rip+0x1455d7f]        # 0x1415fdb08  ' personal tendencies'
0x1401a7d89: jmp    0x1401a7dd9
0x1401a7d8b: test   cl,cl
0x1401a7d8d: lea    rcx,[rbp-0x80]
0x1401a7d91: jns    0x1401a7d9c
0x1401a7d93: lea    rdx,[rip+0x1455f76]        # 0x1415fdd10  'changed '
0x1401a7d9a: jmp    0x1401a7d70
0x1401a7d9c: lea    rdx,[rip+0x1455db5]        # 0x1415fdb58  'allowed '
0x1401a7da3: call   0x14006f4f0
0x1401a7da8: lea    rdx,[rbp+0x0]
0x1401a7dac: lea    rcx,[rbp-0x80]
0x1401a7db0: call   0x1400b9ca0
0x1401a7db5: lea    rdx,[rip+0x1455d8c]        # 0x1415fdb48  ' to rethink '
0x1401a7dbc: lea    rcx,[rbp-0x80]
0x1401a7dc0: call   0x14006f4f0
0x1401a7dc5: lea    rdx,[rbp+0x20]
0x1401a7dc9: lea    rcx,[rbp-0x80]
0x1401a7dcd: call   0x1400b9ca0
0x1401a7dd2: lea    rdx,[rip+0x1455f1f]        # 0x1415fdcf8  ' intellectual values'
0x1401a7dd9: lea    rcx,[rbp-0x80]
0x1401a7ddd: call   0x14006f4f0
0x1401a7de2: lea    rcx,[rbp-0x80]
0x1401a7de6: test   r12b,r12b
0x1401a7de9: lea    rdx,[rip+0x1455418]        # 0x1415fd208  '[C:7:0:0]'
0x1401a7df0: jne    0x1401a7df9
0x1401a7df2: lea    rdx,[rip+0x14553ff]        # 0x1415fd1f8  '[C:7:0:1]'
0x1401a7df9: call   0x14006f4f0
0x1401a7dfe: nop
0x1401a7dff: lea    rcx,[rbp+0x20]
0x1401a7e03: call   0x14006f7e0
0x1401a7e08: nop
0x1401a7e09: lea    rcx,[rbp+0x0]
0x1401a7e0d: call   0x14006f7e0
0x1401a7e12: jmp    0x1401a7e4f
0x1401a7e14: test   r12b,r12b
0x1401a7e17: lea    rdx,[rip+0x1455da2]        # 0x1415fdbc0  ' [C:7:0:0]'
0x1401a7e1e: jne    0x1401a7e27
0x1401a7e20: lea    rdx,[rip+0x1455d89]        # 0x1415fdbb0  ' [C:7:0:1]'
0x1401a7e27: call   0x14006f4f0
0x1401a7e2c: mov    rax,QWORD PTR [rbx]
0x1401a7e2f: mov    ecx,DWORD PTR [rax+0x14]
0x1401a7e32: mov    BYTE PTR [rsp+0x28],0x1
0x1401a7e37: mov    DWORD PTR [rsp+0x20],ecx
0x1401a7e3b: mov    r9d,DWORD PTR [rax+0x10]
0x1401a7e3f: mov    r8d,DWORD PTR [rax+0xc]
0x1401a7e43: lea    rdx,[rbp-0x80]
0x1401a7e47: mov    rcx,r13
0x1401a7e4a: call   0x140e273d0
0x1401a7e4f: mov    r8d,0x1
0x1401a7e55: lea    rdx,[rip+0x143b718]        # 0x1415e3574  '.'
0x1401a7e5c: lea    rcx,[rbp-0x80]
0x1401a7e60: call   0x14006f9a0
0x1401a7e65: mov    ecx,0x20
0x1401a7e6a: call   0x141534600
0x1401a7e6f: mov    rsi,rax
0x1401a7e72: xorps  xmm0,xmm0
0x1401a7e75: movups XMMWORD PTR [rax],xmm0
0x1401a7e78: xor    r15d,r15d
0x1401a7e7b: mov    QWORD PTR [rax+0x10],r15
0x1401a7e7f: mov    QWORD PTR [rax+0x18],0xf
0x1401a7e87: mov    BYTE PTR [rax],r15b
0x1401a7e8a: mov    QWORD PTR [rsp+0x58],rax
0x1401a7e8f: lea    rax,[rbp-0x80]
0x1401a7e93: cmp    rsi,rax
0x1401a7e96: je     0x1401a7eb2
0x1401a7e98: lea    rdx,[rbp-0x80]
0x1401a7e9c: cmp    QWORD PTR [rbp-0x68],0xf
0x1401a7ea1: cmova  rdx,QWORD PTR [rbp-0x80]
0x1401a7ea6: mov    r8,QWORD PTR [rbp-0x70]
0x1401a7eaa: mov    rcx,rsi
0x1401a7ead: call   0x14006f860
0x1401a7eb2: mov    rdx,QWORD PTR [rdi+0x1800]
0x1401a7eb9: cmp    rdx,QWORD PTR [rdi+0x1808]
0x1401a7ec0: je     0x1401a7ecf
0x1401a7ec2: mov    QWORD PTR [rdx],rsi
0x1401a7ec5: add    QWORD PTR [rdi+0x1800],0x8
0x1401a7ecd: jmp    0x1401a7ee0
0x1401a7ecf: lea    r8,[rsp+0x58]
0x1401a7ed4: lea    rcx,[rdi+0x17f8]
0x1401a7edb: call   0x1400bacc0
0x1401a7ee0: mov    ecx,0x20
0x1401a7ee5: call   0x141534600
0x1401a7eea: mov    QWORD PTR [rsp+0x58],rax
0x1401a7eef: mov    rcx,rax
0x1401a7ef2: call   0x14014e240
0x1401a7ef7: mov    QWORD PTR [rsp+0x58],rax
0x1401a7efc: mov    rdx,QWORD PTR [rdi+0x1818]
0x1401a7f03: cmp    rdx,QWORD PTR [rdi+0x1820]
0x1401a7f0a: je     0x1401a7f19
0x1401a7f0c: mov    QWORD PTR [rdx],rax
0x1401a7f0f: add    QWORD PTR [rdi+0x1818],0x8
0x1401a7f17: jmp    0x1401a7f2b
0x1401a7f19: lea    r8,[rsp+0x58]
0x1401a7f1e: lea    rcx,[rdi+0x1810]
0x1401a7f25: call   0x140070b60
0x1401a7f2a: nop
0x1401a7f2b: lea    rcx,[rbp-0x20]
0x1401a7f2f: call   0x14006f7e0
0x1401a7f34: nop
0x1401a7f35: lea    rcx,[rbp-0x80]
0x1401a7f39: call   0x14006f7e0
0x1401a7f3e: add    rbx,0x8
0x1401a7f42: xor    esi,esi
0x1401a7f44: jmp    0x1401a7295
0x1401a7f49: lea    rcx,[rbp-0x60]
0x1401a7f4d: call   0x140066b00
0x1401a7f52: nop
0x1401a7f53: lea    rcx,[rsp+0x68]
0x1401a7f58: call   0x140066b00
0x1401a7f5d: nop
0x1401a7f5e: lea    rcx,[rbp-0x40]
0x1401a7f62: call   0x140066b00
0x1401a7f67: cmp    DWORD PTR [rdi+0xc0],0x9
0x1401a7f6e: jne    0x1401a7f7b
0x1401a7f70: mov    rdx,r13
0x1401a7f73: mov    rcx,rdi
0x1401a7f76: call   0x14047fac0
0x1401a7f7b: mov    rcx,QWORD PTR [rbp+0x40]
0x1401a7f7f: xor    rcx,rsp
0x1401a7f82: call   0x1415345d0
0x1401a7f87: mov    rbx,QWORD PTR [rsp+0x1a0]
0x1401a7f8f: add    rsp,0x150
0x1401a7f96: pop    r15
0x1401a7f98: pop    r14
0x1401a7f9a: pop    r13
0x1401a7f9c: pop    r12
0x1401a7f9e: pop    rdi
0x1401a7f9f: pop    rsi
0x1401a7fa0: pop    rbp
0x1401a7fa1: ret
0x1401a7fa2: xchg   ax,ax
0x1401a7fa4: adc    ebx,DWORD PTR [rbp+0x1a]
0x1401a7fa7: add    BYTE PTR [rbx],cl
0x1401a7fa9: pop    rsp
0x1401a7faa: sbb    al,BYTE PTR [rax]
0x1401a7fac: sub    al,0x5e
0x1401a7fae: sbb    al,BYTE PTR [rax]
0x1401a7fd4: add    BYTE PTR [rcx],al
0x1401a7fd6: add    DWORD PTR [rcx],eax
0x1401a7fd8: add    DWORD PTR [rcx],eax
0x1401a7fda: add    DWORD PTR [rcx],eax
0x1401a7fdc: add    DWORD PTR [rcx],eax
0x1401a7fde: add    BYTE PTR [rcx],al
0x1401a7fe0: add    BYTE PTR [rcx],al
0x1401a7fe2: add    DWORD PTR [rcx],eax
0x1401a7fe4: add    DWORD PTR [rcx],eax
0x1401a7fe6: add    BYTE PTR [rdx],al
0x1401a7fe8: add    al,BYTE PTR [rax]
0x1401a7fea: add    BYTE PTR [rax],al
0x1401a7fec: add    BYTE PTR [rax],al
0x1401a7fee: add    al,BYTE PTR [rax]
0x1401a7ff0: add    BYTE PTR [rax],al
0x1401a7ff2: add    BYTE PTR [rax],al
0x1401a7ff4: add    BYTE PTR [rdx],al
0x1401a7ff6: add    al,BYTE PTR [rdx]
0x1401a7ff8: add    al,BYTE PTR [rax]
0x1401a7ffa: add    BYTE PTR [rax],al
0x1401a7ffc: add    al,BYTE PTR [rdx]
0x1401a7ffe: add    al,BYTE PTR [rdx]
0x1401a8000: add    al,BYTE PTR [rdx]
0x1401a8002: add    al,BYTE PTR [rdx]
0x1401a8004: add    al,BYTE PTR [rdx]
0x1401a8006: add    DWORD PTR [rcx],eax
0x1401a8008: add    al,BYTE PTR [rdx]
0x1401a800a: add    al,BYTE PTR [rdx]
0x1401a800c: add    al,BYTE PTR [rdx]
0x1401a800e: add    al,BYTE PTR [rdx]
0x1401a8010: add    al,BYTE PTR [rcx]
0x1401a8012: add    DWORD PTR [rcx],eax
0x1401a8014: add    DWORD PTR [rcx],eax
0x1401a8016: add    DWORD PTR [rcx],eax
0x1401a8018: add    DWORD PTR [rax],eax
0x1401a801a: add    al,BYTE PTR [rax]
0x1401a801c: add    BYTE PTR [rax],al
0x1401a801e: add    BYTE PTR [rax],al
0x1401a8020: add    BYTE PTR [rax],al
0x1401a8022: add    al,BYTE PTR [rax]
0x1401a8024: add    al,BYTE PTR [rdx]
0x1401a8026: add    al,BYTE PTR [rdx]
0x1401a8028: add    al,BYTE PTR [rdx]
0x1401a802a: add    al,BYTE PTR [rdx]
0x1401a802c: add    al,BYTE PTR [rdx]
0x1401a802e: add    al,BYTE PTR [rdx]
0x1401a8030: add    al,BYTE PTR [rax]
0x1401a8032: add    BYTE PTR [rax],al
0x1401a8034: add    BYTE PTR [rdx],al
0x1401a8036: add    al,BYTE PTR [rax]
0x1401a8038: add    BYTE PTR [rdi],cl
0x1401a803a: (bad)
0x1401a803b: add    BYTE PTR [rbx+0x64],bh
0x1401a803e: sbb    al,BYTE PTR [rax]
0x1401a8040: test   BYTE PTR [rdx+rbx*1+0x0],ah
0x1401a8044: lea    esp,[rdx+rbx*1+0x0]
0x1401a8048: xchg   esi,eax
0x1401a8049: sbb    al,BYTE PTR fs:[rax]
0x1401a804c: lahf
0x1401a804d: sbb    al,BYTE PTR fs:[rax]
0x1401a8050: test   al,0x64
0x1401a8052: sbb    al,BYTE PTR [rax]
0x1401a8054: mov    cl,0x64
0x1401a8056: sbb    al,BYTE PTR [rax]
0x1401a8058: mov    edx,0xc3001a64
0x1401a805d: sbb    al,BYTE PTR fs:[rax]
0x1401a8060: int3
0x1401a8061: sbb    al,BYTE PTR fs:[rax]
0x1401a8064: {rex2 0x64} sbb r24b,BYTE PTR [rax]
0x1401a8068: mov    edx,0x27001a66
0x1401a806d: push   0x686f001a
0x1401a8072: sbb    al,BYTE PTR [rax]
0x1401a8074: sbb    ah,BYTE PTR [rdi+0x1a]
0x1401a8077: add    bh,bh
0x1401a8079: push   0x6947001a
0x1401a807e: sbb    al,BYTE PTR [rax]
0x1401a8080: mov    bh,0x68
0x1401a8082: sbb    al,BYTE PTR [rax]
0x1401a8084: rex.WRXB
0x1401a8085: sbb    al,BYTE PTR [eax]
0x1401a8088: xchg   edi,eax
0x1401a8089: sbb    al,BYTE PTR [eax]
0x1401a808c: shl    BYTE PTR [rsi+0x1a],cl
0x1401a808f: add    bh,bl
0x1401a8091: sbb    al,BYTE PTR [eax]
0x1401a8094: (bad)
0x1401a8095: data16 sbb al,BYTE PTR [rax]
0x1401a8098: shr    DWORD PTR [rcx+0x1a],1
0x1401a809b: add    BYTE PTR [rdi+0x34001a69],cl
0x1401a80a1: push   0x1a
0x1401a80a3: add    BYTE PTR [rax],al
0x1401a80a5: add    DWORD PTR [rsi],ecx
0x1401a80a7: add    cl,BYTE PTR [rsi]
0x1401a80a9: (bad)
0x1401a80aa: (bad)
0x1401a80ab: (bad)
0x1401a80ac: (bad)
0x1401a80ad: (bad)
0x1401a80ae: (bad)
0x1401a80af: (bad)
0x1401a80b0: (bad)
0x1401a80b1: add    eax,DWORD PTR [rax*1+0x9080706]
0x1401a80b8: or     cl,BYTE PTR [rbx]
0x1401a80ba: (bad)
0x1401a80bb: (bad)
0x1401a80bc: (bad)
0x1401a80bd: (bad)
0x1401a80be: (bad)
0x1401a80bf: (bad)
0x1401a80c0: (bad)
0x1401a80c1: (bad)
0x1401a80c2: (bad)
0x1401a80c3: (bad)
0x1401a80c4: (bad)
0x1401a80c5: or     al,0xd
0x1401a80c7: nop
0x1401a80c8: sub    ch,BYTE PTR [rsi+0x1a]
0x1401a80cb: add    BYTE PTR [rsi],ch
0x1401a80cd: outs   dx,BYTE PTR [rsi]
0x1401a80ce: sbb    al,BYTE PTR [rax]
0x1401a80d0: sbb    BYTE PTR [rsi+0x1a],ch
0x1401a80d3: add    BYTE PTR [rcx],ah
0x1401a80d5: outs   dx,BYTE PTR [rsi]
0x1401a80d6: sbb    al,BYTE PTR [rax]
0x1401a80d8: xor    DWORD PTR [rsi+0x1a],ebp
0x1401a80db: add    BYTE PTR [rax],al
0x1401a80dd: add    DWORD PTR [rdx],eax
0x1401a80df: add    eax,DWORD PTR [rbx]
0x1401a80e1: add    DWORD PTR [rbx],eax
0x1401a80e3: add    BYTE PTR [rsp+rax*1],al
0x1401a80e6: add    eax,DWORD PTR [rdx]
0x1401a80e8: add    DWORD PTR [rcx],eax
0x1401a80ea: add    BYTE PTR [rbx+rax*1],al
0x1401a80ed: add    al,0x4
0x1401a80ef: add    BYTE PTR [rsp+rax*1],al
0x1401a80f2: add    eax,DWORD PTR [rdx+rax*1]
0x1401a80f5: add    DWORD PTR [rax],eax
0x1401a80f7: add    al,BYTE PTR [rax+rax*1]
0x1401a80fa: add    eax,DWORD PTR [rax]
0x1401a80fc: add    al,0x4
0x1401a80fe: add    al,BYTE PTR [rbx]
0x1401a8100: add    DWORD PTR [rsp+rax*1],eax
0x1401a8103: add    DWORD PTR [rax],eax
0x1401a8105: add    eax,DWORD PTR [rax]
0x1401a8107: add    BYTE PTR [rdx],al
0x1401a8109: add    BYTE PTR [rdx],al
0x1401a810b: add    BYTE PTR [rbx+rax*1],al
0x1401a810e: add    al,0x2
0x1401a8110: add    BYTE PTR [rdx],al
0x1401a8112: add    eax,DWORD PTR [rax]
0x1401a8114: add    al,0x0
0x1401a8116: add    al,0x1
0x1401a8118: add    BYTE PTR [rdx],al
0x1401a811a: add    al,BYTE PTR [rax]
0x1401a811c: add    DWORD PTR [rdx],eax
0x1401a811e: add    BYTE PTR [rbx],al
0x1401a8120: add    al,BYTE PTR [rax]
0x1401a8122: add    al,0x2
0x1401a8124: add    al,0x2
0x1401a8126: add    eax,DWORD PTR [rax]
0x1401a8128: add    eax,DWORD PTR [rdx+rax*1]
0x1401a812b: add    al,0x0
0x1401a812d: add    BYTE PTR [rbx],al
0x1401a812f: add    al,BYTE PTR [rdx]
0x1401a8131: add    al,0x2
0x1401a8133: add    al,BYTE PTR [rcx]
0x1401a8135: add    al,0x3
0x1401a8137: add    al,0x4
0x1401a8139: add    al,0x4
0x1401a813b: add    eax,DWORD PTR [rax]
0x1401a813d: add    BYTE PTR [rbx],al
0x1401a813f: add    al,0x3
0x1401a8141: add    al,BYTE PTR [rcx]
0x1401a8143: add    DWORD PTR [rdx],eax
0x1401a8145: add    eax,DWORD PTR [rcx+rax*1]
0x1401a8148: add    al,0x0
0x1401a814a: add    al,0x1
0x1401a814c: add    al,BYTE PTR [rax+rax*1]
0x1401a814f: add    BYTE PTR [rbx],al
0x1401a8151: add    al,BYTE PTR [rcx]
0x1401a8153: add    BYTE PTR [rdx],al
0x1401a8155: add    BYTE PTR [rbx+rax*1],al
0x1401a8158: add    eax,DWORD PTR [rcx]
0x1401a815a: add    DWORD PTR [rbx],eax
0x1401a815c: add    al,BYTE PTR [rax]
0x1401a815e: add    eax,DWORD PTR [rdx]
0x1401a8160: add    BYTE PTR [rax+rax*1],al
0x1401a8163: add    eax,DWORD PTR [rax]
0x1401a8165: add    al,0x0
0x1401a8167: add    al,0x4
0x1401a8169: add    DWORD PTR [rbx],eax
0x1401a816b: add    DWORD PTR [rsp+rax*1],eax
0x1401a816e: add    al,0x4
0x1401a8170: add    BYTE PTR [rax],al
0x1401a8172: add    al,BYTE PTR [rcx+rax*1]
0x1401a8175: add    al,BYTE PTR [rdx+rax*1]
0x1401a8178: add    BYTE PTR [rbx],al
0x1401a817a: add    al,0x4
0x1401a817c: add    BYTE PTR [rax],al
0x1401a817e: add    DWORD PTR [rbx],eax
0x1401a8180: add    al,0x4
0x1401a8182: add    al,0x0
0x1401a8184: add    BYTE PTR [rdi],cl
0x1401a8186: (bad)
0x1401a8187: add    BYTE PTR [rbx],bl
0x1401a8189: je     0x1401a81a5
0x1401a818b: add    BYTE PTR [rax+0x74],ch
0x1401a818e: sbb    al,BYTE PTR [rax]
0x1401a8190: mov    WORD PTR [rdx+rbx*1+0x0],?
0x1401a8194: pushf
0x1401a8195: je     0x1401a81b1
0x1401a8197: add    BYTE PTR [rdx+0x1a74],bh
0x1401a819d: add    DWORD PTR [rdx],eax
0x1401a819f: add    al,BYTE PTR [rcx]
0x1401a81a1: add    DWORD PTR [rbx],eax
0x1401a81a3: add    DWORD PTR [rdx],eax
0x1401a81a5: add    DWORD PTR [rcx],eax
0x1401a81a7: add    DWORD PTR [rcx],eax
0x1401a81a9: add    eax,DWORD PTR [rbx]
0x1401a81ab: add    DWORD PTR [rdx+rax*1],eax
0x1401a81ae: add    DWORD PTR [rcx+rax*1],eax
0x1401a81b1: add    DWORD PTR [rdx+rax*1],eax
0x1401a81b4: add    eax,DWORD PTR [rdx]
0x1401a81b6: add    DWORD PTR [rcx],eax
0x1401a81b8: add    al,BYTE PTR [rcx+rax*1]
0x1401a81bb: add    DWORD PTR [rcx],eax
0x1401a81bd: add    al,0x4
0x1401a81bf: add    al,BYTE PTR [rcx]
0x1401a81c1: add    DWORD PTR [rsp+rax*1],eax
0x1401a81c4: add    eax,DWORD PTR [rdx]
0x1401a81c6: add    DWORD PTR [rcx],eax
0x1401a81c8: add    al,BYTE PTR [rcx]
0x1401a81ca: add    al,BYTE PTR [rcx]
0x1401a81cc: add    eax,DWORD PTR [rcx+rax*1]
0x1401a81cf: add    al,0x1
0x1401a81d1: add    DWORD PTR [rdx],eax
0x1401a81d3: add    al,BYTE PTR [rdx]
0x1401a81d5: add    al,0x1
0x1401a81d7: add    al,0x2
0x1401a81d9: add    DWORD PTR [rcx],eax
0x1401a81db: add    DWORD PTR [rcx],eax
0x1401a81dd: add    DWORD PTR [rdx],eax
0x1401a81df: add    al,BYTE PTR [rdx]
0x1401a81e1: add    DWORD PTR [rcx],eax
0x1401a81e3: add    al,0x2
0x1401a81e5: add    al,0x1
0x1401a81e7: add    DWORD PTR [rdx],eax
0x1401a81e9: add    al,BYTE PTR [rsp+rax*1]
0x1401a81ec: add    al,BYTE PTR [rcx]
0x1401a81ee: add    DWORD PTR [rdx],eax
0x1401a81f0: add    al,BYTE PTR [rdx]
0x1401a81f2: add    al,0x2
0x1401a81f4: add    al,BYTE PTR [rcx]
0x1401a81f6: add    al,0x2
0x1401a81f8: add    al,0x4
0x1401a81fa: add    al,0x4
0x1401a81fc: add    al,BYTE PTR [rcx]
0x1401a81fe: add    DWORD PTR [rdx],eax
0x1401a8200: add    al,0x1
0x1401a8202: add    al,BYTE PTR [rdx]
0x1401a8204: add    DWORD PTR [rdx],eax
0x1401a8206: add    al,BYTE PTR [rdx+rax*1]
0x1401a8209: add    al,0x2
0x1401a820b: add    al,0x2
0x1401a820d: add    DWORD PTR [rdx+rax*1],eax
0x1401a8210: add    al,BYTE PTR [rdx]
0x1401a8212: add    DWORD PTR [rdx+rax*1],eax
0x1401a8215: add    al,BYTE PTR [rcx]
0x1401a8217: add    al,0x2
0x1401a8219: add    DWORD PTR [rcx+rax*1],eax
0x1401a821c: add    al,BYTE PTR [rcx]
0x1401a821e: add    al,BYTE PTR [rdx]
0x1401a8220: add    al,BYTE PTR [rcx]
0x1401a8222: add    al,0x2
0x1401a8224: add    al,BYTE PTR [rdx]
0x1401a8226: add    al,0x2
0x1401a8228: add    al,0x2
0x1401a822a: add    DWORD PTR [rcx],eax
0x1401a822c: add    DWORD PTR [rsp+rax*1],eax
0x1401a822f: add    al,0x4
0x1401a8231: add    DWORD PTR [rdx],eax
0x1401a8233: add    al,BYTE PTR [rcx+rax*1]
0x1401a8236: add    DWORD PTR [rdx+rax*1],eax
0x1401a8239: add    DWORD PTR [rdx],eax
0x1401a823b: add    al,BYTE PTR [rdx+rax*1]
0x1401a823e: add    DWORD PTR [rdx],eax
0x1401a8240: add    al,BYTE PTR [rsp+rax*1]
0x1401a8243: add    al,0x2
0x1401a8245: add    ah,BYTE PTR [rsi-0x70]
0x1401a8248: jne    0x1401a82bf
0x1401a824a: sbb    al,BYTE PTR [rax]
0x1401a824c: sbb    dh,BYTE PTR [rbp+0x1a]
0x1401a824f: add    al,ch
0x1401a8251: je     0x1401a826d
0x1401a8253: add    BYTE PTR [rdi+0x75],bl
0x1401a8256: sbb    al,BYTE PTR [rax]
0x1401a8258: rex.WB jne 0x1401a8275
0x1401a825b: add    BYTE PTR [rbx+0x1001a75],cl
0x1401a8261: jne    0x1401a827d
0x1401a8263: add    BYTE PTR [rbx],dh
0x1401a8265: jne    0x1401a8281
0x1401a8267: add    BYTE PTR [rax+0x1a75],ch
0x1401a826d: add    BYTE PTR [rcx],al
0x1401a826f: add    DWORD PTR [rdx],eax
0x1401a8271: add    al,BYTE PTR [rbx]
0x1401a8273: add    al,0x2
0x1401a8275: add    eax,0x3040600
0x1401a827a: add    eax,DWORD PTR [rdx]
0x1401a827c: or     BYTE PTR [rdx],al
0x1401a827e: add    BYTE PTR [rax],cl
0x1401a8280: add    DWORD PTR [rip+0x2050208],eax        # 0x1421f848e
0x1401a8286: (bad)
0x1401a8287: add    al,BYTE PTR [rcx]
0x1401a8289: or     BYTE PTR [rdx],al
0x1401a828b: add    al,BYTE PTR [rsi]
0x1401a828d: or     BYTE PTR [rax],cl
0x1401a828f: add    eax,DWORD PTR [rdx]
0x1401a8291: (bad)
0x1401a8292: or     BYTE PTR [rax],cl
0x1401a8294: add    eax,DWORD PTR [rdx]
0x1401a8296: add    eax,DWORD PTR [rdx]
0x1401a8298: add    al,BYTE PTR [rbx]
0x1401a829a: add    al,BYTE PTR [rbx]
0x1401a829c: add    cl,BYTE PTR [rax]
0x1401a829e: add    eax,0x1020608
0x1401a82a3: add    eax,DWORD PTR [rsi]
0x1401a82a5: or     BYTE PTR [rsi],al
0x1401a82a7: or     BYTE PTR [rsi],al
0x1401a82a9: add    al,BYTE PTR [rip+0x4040605]        # 0x1441e88b4
0x1401a82af: add    DWORD PTR [rsi],eax
0x1401a82b1: add    eax,DWORD PTR [rdx]
0x1401a82b3: or     BYTE PTR [rsi],al
0x1401a82b5: or     BYTE PTR [rsi],al
0x1401a82b7: add    al,BYTE PTR [rdx]
0x1401a82b9: add    DWORD PTR [rax],ecx
0x1401a82bb: add    eax,DWORD PTR [rdi]
0x1401a82bd: add    al,BYTE PTR [rdx]
0x1401a82bf: add    al,BYTE PTR [rsi]
0x1401a82c1: add    al,0x8
0x1401a82c3: (bad)
0x1401a82c4: add    eax,DWORD PTR [rax+rcx*1]
0x1401a82c7: add    ecx,DWORD PTR [rax]
0x1401a82c9: or     BYTE PTR [rax],cl
0x1401a82cb: or     BYTE PTR [rdx],al
0x1401a82cd: add    eax,0x6080202
0x1401a82d2: (bad)
0x1401a82d3: (bad)
0x1401a82d4: (bad)
0x1401a82d5: add    al,0x2
0x1401a82d7: or     BYTE PTR [rcx],al
0x1401a82d9: or     BYTE PTR [rcx],al
0x1401a82db: or     BYTE PTR [rbx],al
0x1401a82dd: add    ecx,DWORD PTR [rax]
0x1401a82df: add    al,BYTE PTR [rip+0x30406]        # 0x1401d86eb
0x1401a82e5: add    DWORD PTR [rdx],eax
0x1401a82e7: or     BYTE PTR [rcx],al
0x1401a82e9: add    DWORD PTR [rcx+rax*1],eax
0x1401a82ec: add    al,BYTE PTR [rsi]
0x1401a82ee: add    al,BYTE PTR [rdx]
0x1401a82f0: add    eax,0x3020802
0x1401a82f5: (bad)
0x1401a82f6: or     BYTE PTR [rdx],al
0x1401a82f8: or     BYTE PTR [rip+0x8030303],al        # 0x1481d8601
0x1401a82fe: or     BYTE PTR [rax],cl
0x1401a8300: or     BYTE PTR [rdi],al
0x1401a8302: add    DWORD PTR [rcx],eax
0x1401a8304: or     BYTE PTR [rax*1+0x2020608],al
0x1401a830b: (bad)
0x1401a830c: or     BYTE PTR [rip+0x8050402],al        # 0x1481f8714
0x1401a8312: or     BYTE PTR [rax],cl
0x1401a8314: add    al,BYTE PTR [rcx]
0x1401a8316: xchg   ax,ax
0x1401a8318: out    0x7b,al
0x1401a831a: sbb    al,BYTE PTR [rax]
0x1401a831c: fbstp  TBYTE PTR [rsi+0x1a]
0x1401a831f: add    bh,dh
0x1401a8321: jbe    0x1401a833d
0x1401a8323: add    BYTE PTR [rbx],al
0x1401a8325: ja     0x1401a8341
0x1401a8327: add    BYTE PTR [rdi],cl
0x1401a8329: ja     0x1401a8345
0x1401a832b: add    BYTE PTR [rbx],bl
0x1401a832d: ja     0x1401a8349
0x1401a832f: add    BYTE PTR [rdi],ah
0x1401a8331: ja     0x1401a834d
0x1401a8333: add    BYTE PTR [rip+0x33001a76],cl        # 0x1731a9daf
0x1401a8339: ja     0x1401a8355
0x1401a833b: add    BYTE PTR [rdi],bh
0x1401a833d: ja     0x1401a8359
0x1401a833f: add    BYTE PTR [rbx+0x77],cl
0x1401a8342: sbb    al,BYTE PTR [rax]
0x1401a8344: push   rdi
0x1401a8345: ja     0x1401a8361
0x1401a8347: add    BYTE PTR [rbx+0x77],ah
0x1401a834a: sbb    al,BYTE PTR [rax]
0x1401a834c: cmps   DWORD PTR [rsi],DWORD PTR [rdi]
0x1401a834d: jnp    0x1401a8369
0x1401a834f: add    BYTE PTR [rdi+0x77],ch
0x1401a8352: sbb    al,BYTE PTR [rax]
0x1401a8354: (bad)
0x1401a8357: add    dh,dh
0x1401a8359: jnp    0x1401a8375
0x1401a835b: add    BYTE PTR [rbx+0x77],bh
0x1401a835e: sbb    al,BYTE PTR [rax]
0x1401a8360: xchg   DWORD PTR [rdi+0x1a],esi
0x1401a8363: add    dh,dh
0x1401a8365: jnp    0x1401a8381
0x1401a8367: add    BYTE PTR [rbx-0x60ffe589],dl
0x1401a836d: ja     0x1401a8389
0x1401a836f: add    dh,dh
0x1401a8371: jnp    0x1401a838d
0x1401a8373: add    BYTE PTR [rbx-0x48ffe589],ch
0x1401a8379: ja     0x1401a8395
0x1401a837b: add    bl,al
0x1401a837d: ja     0x1401a8399
0x1401a837f: add    BYTE PTR [rbx-0x30ffe58a],bh
0x1401a8385: ja     0x1401a83a1
0x1401a8387: add    bl,bl
0x1401a8389: ja     0x1401a83a5
0x1401a838b: add    dh,dh
0x1401a838d: jnp    0x1401a83a9
0x1401a838f: add    bh,ah
0x1401a8391: ja     0x1401a83ad
0x1401a8393: add    bl,dh
0x1401a8395: ja     0x1401a83b1
0x1401a8397: add    bh,bh
0x1401a8399: ja     0x1401a83b5
0x1401a839b: add    dh,dh
0x1401a839d: jnp    0x1401a83b9
0x1401a839f: add    dh,dh
0x1401a83a1: jnp    0x1401a83bd
0x1401a83a3: add    BYTE PTR [rax+0xb001a7b],dh
0x1401a83a9: js     0x1401a83c5
0x1401a83ab: add    BYTE PTR [rdi],dl
0x1401a83ad: js     0x1401a83c9
0x1401a83af: add    dh,dh
0x1401a83b1: jnp    0x1401a83cd
0x1401a83b3: add    dh,dh
0x1401a83b5: jnp    0x1401a83d1
0x1401a83b7: add    BYTE PTR [rbx],ah
0x1401a83b9: js     0x1401a83d5
0x1401a83bb: add    BYTE PTR [rdi],ch
0x1401a83bd: js     0x1401a83d9
0x1401a83bf: add    BYTE PTR [rbx],bh
0x1401a83c1: js     0x1401a83dd
0x1401a83c3: add    BYTE PTR [rdi+0x78],al
0x1401a83c6: sbb    al,BYTE PTR [rax]
0x1401a83c8: push   rbx
0x1401a83c9: js     0x1401a83e5
0x1401a83cb: add    BYTE PTR [rdi+0x78],bl
0x1401a83ce: sbb    al,BYTE PTR [rax]
0x1401a83d0: imul   edi,DWORD PTR [rax+0x1a],0x0
0x1401a83d4: ja     0x1401a844e
0x1401a83d6: sbb    al,BYTE PTR [rax]
0x1401a83d8: ret    0x1a7b
0x1401a83db: add    dh,dh
0x1401a83dd: jnp    0x1401a83f9
0x1401a83df: add    BYTE PTR [rbx-0x9ffe588],al
0x1401a83e5: jnp    0x1401a8401
0x1401a83e7: add    BYTE PTR [rdi-0x64ffe588],cl
0x1401a83ed: js     0x1401a8409
0x1401a83ef: add    BYTE PTR [rdi-0x4cffe588],ah
0x1401a83f5: js     0x1401a8411
0x1401a83f7: add    BYTE PTR [rdi-0x9ffe588],bh
0x1401a83fd: jnp    0x1401a8419
0x1401a83ff: add    bl,cl
0x1401a8401: jnp    0x1401a841d
0x1401a8403: add    dh,dh
0x1401a8405: jnp    0x1401a8421
0x1401a8407: add    ch,bl
0x1401a8409: jnp    0x1401a8425
0x1401a840b: add    bl,cl
0x1401a840d: js     0x1401a8429
0x1401a840f: add    BYTE PTR [rbx-0x28ffe58a],cl
0x1401a8415: js     0x1401a8431
0x1401a8417: add    BYTE PTR [rcx-0x1cffe585],bh
0x1401a841d: js     0x1401a8439
0x1401a841f: add    bh,ch
0x1401a8421: js     0x1401a843d
0x1401a8423: add    ch,dh
0x1401a8425: jne    0x1401a8441
0x1401a8427: add    bl,bh
0x1401a8429: js     0x1401a8445
0x1401a842b: add    BYTE PTR [rdi],al
0x1401a842d: jns    0x1401a8449
0x1401a842f: add    BYTE PTR [rbx],dl
0x1401a8431: jns    0x1401a844d
0x1401a8433: add    dh,dh
0x1401a8435: jnp    0x1401a8451
0x1401a8437: add    BYTE PTR [rdi-0x9ffe58a],dl
0x1401a843d: jnp    0x1401a8459
0x1401a843f: add    BYTE PTR [rdi],bl
0x1401a8441: jns    0x1401a845d
0x1401a8443: add    BYTE PTR [rbx],ch
0x1401a8445: jns    0x1401a8461
0x1401a8447: add    BYTE PTR [rdi],dh
0x1401a8449: jns    0x1401a8465
0x1401a844b: add    BYTE PTR [rbx+0x79],al
0x1401a844e: sbb    al,BYTE PTR [rax]
0x1401a8450: idiv   BYTE PTR [rbx+0x1a]
0x1401a8453: add    BYTE PTR [rip+0x31001a76],bh        # 0x1711a9ecf
0x1401a8459: jbe    0x1401a8475
0x1401a845b: add    ch,bl
0x1401a845d: jne    0x1401a8479
0x1401a845f: add    cl,ch
0x1401a8461: jne    0x1401a847d
0x1401a8463: add    BYTE PTR [rdi+0x79],cl
0x1401a8466: sbb    al,BYTE PTR [rax]
0x1401a8468: pop    rbx
0x1401a8469: jns    0x1401a8485
0x1401a846b: add    BYTE PTR [rdi+0x79],ah
0x1401a846e: sbb    al,BYTE PTR [rax]
0x1401a8470: idiv   BYTE PTR [rbx+0x1a]
0x1401a8473: add    BYTE PTR [rbx+0x79],dh
0x1401a8476: sbb    al,BYTE PTR [rax]
0x1401a8478: jg     0x1401a84f3
0x1401a847a: sbb    al,BYTE PTR [rax]
0x1401a847c: and    eax,0xf6001a76
0x1401a8481: jnp    0x1401a849d
0x1401a8483: add    BYTE PTR [rbx-0x9ffe587],cl
0x1401a8489: jnp    0x1401a84a5
0x1401a848b: add    dh,dh
0x1401a848d: jnp    0x1401a84a9
0x1401a848f: add    dh,dh
0x1401a8491: jnp    0x1401a84ad
0x1401a8493: add    dh,dh
0x1401a8495: jnp    0x1401a84b1
0x1401a8497: add    BYTE PTR [rdi-0x5cffe587],dl
0x1401a849d: jns    0x1401a84b9
0x1401a849f: add    BYTE PTR [rdi-0x44ffe587],ch
0x1401a84a5: jns    0x1401a84c1
0x1401a84a7: add    dh,dh
0x1401a84a9: jnp    0x1401a84c5
0x1401a84ab: add    bh,al
0x1401a84ad: jns    0x1401a84c9
0x1401a84af: add    bl,dl
0x1401a84b1: jns    0x1401a84cd
0x1401a84b3: add    BYTE PTR [rdi-0x20ffe58a],ch
0x1401a84b9: jns    0x1401a84d5
0x1401a84bb: add    bl,ch
0x1401a84bd: jns    0x1401a84d9
0x1401a84bf: add    bh,dh
0x1401a84c1: jns    0x1401a84dd
0x1401a84c3: add    dh,dh
0x1401a84c5: jnp    0x1401a84e1
0x1401a84c7: add    bh,al
0x1401a84c9: jbe    0x1401a84e5
0x1401a84cb: add    dh,dh
0x1401a84cd: jnp    0x1401a84e9
0x1401a84cf: add    BYTE PTR [rbx],al
0x1401a84d1: jp     0x1401a84ed
0x1401a84d3: add    dh,dh
0x1401a84d5: jnp    0x1401a84f1
0x1401a84d7: add    BYTE PTR [rdi],cl
0x1401a84d9: jp     0x1401a84f5
0x1401a84db: add    BYTE PTR [rbx],bl
0x1401a84dd: jp     0x1401a84f9
0x1401a84df: add    dh,dh
0x1401a84e1: jnp    0x1401a84fd
0x1401a84e3: add    BYTE PTR [rdi],ah
0x1401a84e5: jp     0x1401a8501
0x1401a84e7: add    BYTE PTR [rbx],dh
0x1401a84e9: jp     0x1401a8505
0x1401a84eb: add    BYTE PTR [rdi],bh
0x1401a84ed: jp     0x1401a8509
0x1401a84ef: add    BYTE PTR [rbx+0x7a],cl
0x1401a84f2: sbb    al,BYTE PTR [rax]
0x1401a84f4: push   rdi
0x1401a84f5: jp     0x1401a8511
0x1401a84f7: add    BYTE PTR [rax+0x7a],bh
0x1401a84fa: sbb    al,BYTE PTR [rax]
0x1401a84fc: test   BYTE PTR [rdx+0x1a],bh
0x1401a84ff: add    ah,dl
0x1401a8501: jnp    0x1401a851d
0x1401a8503: add    dh,dh
0x1401a8505: jnp    0x1401a8521
0x1401a8507: add    BYTE PTR [rax-0x63ffe586],dl
0x1401a850d: jp     0x1401a8529
0x1401a850f: add    BYTE PTR [rdx+0x76],ch
0x1401a8512: sbb    al,BYTE PTR [rax]
0x1401a8514: test   al,0x7a
0x1401a8516: sbb    al,BYTE PTR [rax]
0x1401a8518: mov    ah,0x7a
0x1401a851a: sbb    al,BYTE PTR [rax]
0x1401a851c: sar    BYTE PTR [rdx+0x1a],0x0
0x1401a8520: int3
0x1401a8521: jp     0x1401a853d
0x1401a8523: add    al,bl
0x1401a8525: jp     0x1401a8541
0x1401a8527: add    ah,ah
0x1401a8529: jp     0x1401a8545
0x1401a852b: add    al,dh
0x1401a852d: jp     0x1401a8549
0x1401a852f: add    dh,dh
0x1401a8531: jnp    0x1401a854d
0x1401a8533: add    BYTE PTR [rax],cl
0x1401a8535: jnp    0x1401a8551
0x1401a8537: add    BYTE PTR [rbx-0x2effe58a],ah
0x1401a853d: jne    0x1401a8559
0x1401a853f: add    dh,dh
0x1401a8541: jnp    0x1401a855d
0x1401a8543: add    BYTE PTR [rbx+rdi*2],dl
0x1401a8546: sbb    al,BYTE PTR [rax]
0x1401a8548: idiv   BYTE PTR [rbx+0x1a]
0x1401a854b: add    BYTE PTR [rax],ah
0x1401a854d: jnp    0x1401a8569
0x1401a854f: add    BYTE PTR [rbx+rdi*2],ch
0x1401a8552: sbb    al,BYTE PTR [rax]
0x1401a8554: cmp    BYTE PTR [rbx+0x1a],bh
0x1401a8557: add    BYTE PTR [rcx],bl
0x1401a8559: jbe    0x1401a8575
0x1401a855b: add    dh,dh
0x1401a855d: jnp    0x1401a8579
0x1401a855f: add    dh,dh
0x1401a8561: jnp    0x1401a857d
0x1401a8563: add    dh,dh
0x1401a8565: jnp    0x1401a8581
0x1401a8567: add    dh,dh
0x1401a8569: jnp    0x1401a8585
0x1401a856b: add    BYTE PTR [rcx],al
0x1401a856d: jbe    0x1401a8589
0x1401a856f: add    BYTE PTR [rbx+rdi*2+0x1a],al
0x1401a8573: add    BYTE PTR [rax+0x7b],dl
0x1401a8576: sbb    al,BYTE PTR [rax]
0x1401a8578: idiv   BYTE PTR [rbx+0x1a]
0x1401a857b: add    BYTE PTR [rbx+rdi*2+0x1a],bl
0x1401a857f: add    BYTE PTR [rax+0x7b],ch
0x1401a8582: sbb    al,BYTE PTR [rax]
0x1401a8584: idiv   BYTE PTR [rbx+0x1a]
0x1401a8587: add    BYTE PTR [rsi+0x76],bl
0x1401a858a: sbb    al,BYTE PTR [rax]
0x1401a858c: jno    0x1401a8609
0x1401a858e: sbb    al,BYTE PTR [rax]
0x1401a8590: jp     0x1401a860d
0x1401a8592: sbb    al,BYTE PTR [rax]
0x1401a8594: shl    DWORD PTR [rsi+0x1a],cl
0x1401a8597: add    dh,dh
0x1401a8599: jnp    0x1401a85b5
0x1401a859b: add    BYTE PTR [rbx-0x73ffe585],al
0x1401a85a1: jnp    0x1401a85bd
0x1401a85a3: add    BYTE PTR [rbp-0x61ffe585],dl
0x1401a85a9: jnp    0x1401a85c5
0x1401a85ab: add    dh,dh
0x1401a85ad: jnp    0x1401a85c9
0x1401a85af: add    dh,dh
0x1401a85b1: jnp    0x1401a85cd
0x1401a85b3: add    dh,dh
0x1401a85b5: jnp    0x1401a85d1
0x1401a85b7: add    ah,bh
0x1401a85b9: jp     0x1401a85d5
0x1401a85bb: add    bl,ch
0x1401a85bd: jbe    0x1401a85d9
0x1401a85bf: add    BYTE PTR [rbx+0x7c],dl
0x1401a85c2: sbb    al,BYTE PTR [rax]
0x1401a85c4: rex.WX jl 0x1401a85e1
0x1401a85c7: add    BYTE PTR [rcx+0x7c],al
0x1401a85ca: sbb    al,BYTE PTR [rax]
0x1401a85cc: push   rbx
0x1401a85cd: jl     0x1401a85e9
0x1401a85cf: add    BYTE PTR [rax],al
0x1401a85d1: add    BYTE PTR [rax],al
0x1401a85d3: add    DWORD PTR [rcx],eax
0x1401a85d5: add    al,BYTE PTR [rdx]
0x1401a85d7: add    DWORD PTR [rax],eax
0x1401a85d9: add    BYTE PTR [rax],al
0x1401a85db: add    DWORD PTR [rcx],eax
0x1401a85dd: add    al,BYTE PTR [rcx]
0x1401a85df: add    eax,DWORD PTR [rcx]
0x1401a85e1: add    BYTE PTR [rbx],al
0x1401a85e3: add    BYTE PTR [rax],al
0x1401a85e5: add    eax,DWORD PTR [rcx]
0x1401a85e7: add    BYTE PTR [rcx],al
0x1401a85e9: add    BYTE PTR [rcx],al
0x1401a85eb: add    BYTE PTR [rbx],al
0x1401a85ed: add    DWORD PTR [rcx],eax
0x1401a85ef: add    BYTE PTR [rbx],al
0x1401a85f1: add    eax,DWORD PTR [rcx]
0x1401a85f3: add    DWORD PTR [rax],eax
0x1401a85f5: add    eax,DWORD PTR [rbx]
0x1401a85f7: add    DWORD PTR [rcx],eax
0x1401a85f9: add    DWORD PTR [rcx],eax
0x1401a85fb: add    DWORD PTR [rdx],eax
0x1401a85fd: add    DWORD PTR [rdx],eax
0x1401a85ff: add    DWORD PTR [rbx],eax
0x1401a8601: add    BYTE PTR [rbx],al
0x1401a8603: add    BYTE PTR [rcx],al
0x1401a8605: add    BYTE PTR [rcx],al
0x1401a8607: add    BYTE PTR [rbx],al
0x1401a8609: add    BYTE PTR [rbx],al
0x1401a860b: add    BYTE PTR [rcx],al
0x1401a860d: add    BYTE PTR [rax],al
0x1401a860f: add    BYTE PTR [rdx],al
0x1401a8611: add    al,BYTE PTR [rax]
0x1401a8613: add    BYTE PTR [rdx],al
0x1401a8615: add    DWORD PTR [rbx],eax
0x1401a8617: add    BYTE PTR [rbx],al
0x1401a8619: add    BYTE PTR [rcx],al
0x1401a861b: add    DWORD PTR [rax],eax
0x1401a861d: add    eax,DWORD PTR [rcx]
0x1401a861f: add    BYTE PTR [rcx],al
0x1401a8621: add    DWORD PTR [rcx],eax
0x1401a8623: add    BYTE PTR [rcx],al
0x1401a8625: add    eax,DWORD PTR [rax]
0x1401a8627: add    DWORD PTR [rdx],eax
0x1401a8629: add    eax,DWORD PTR [rcx]
0x1401a862b: add    eax,DWORD PTR [rbx]
0x1401a862d: add    eax,DWORD PTR [rbx]
0x1401a862f: add    DWORD PTR [rax],eax
0x1401a8631: add    DWORD PTR [rcx],eax
0x1401a8633: add    eax,DWORD PTR [rax]
0x1401a8635: add    BYTE PTR [rax],al
0x1401a8637: add    BYTE PTR [rcx],al
0x1401a8639: add    DWORD PTR [rbx],eax
0x1401a863b: add    BYTE PTR [rbx],al
0x1401a863d: add    BYTE PTR [rbx],al
0x1401a863f: add    DWORD PTR [rcx],eax
0x1401a8641: add    eax,DWORD PTR [rcx]
0x1401a8643: add    BYTE PTR [rax],al
0x1401a8645: add    DWORD PTR [rdx],eax
0x1401a8647: add    BYTE PTR [rax],al
0x1401a8649: add    DWORD PTR [rbx],eax
0x1401a864b: add    BYTE PTR [rax],al
0x1401a864d: add    al,BYTE PTR [rax]
0x1401a864f: add    DWORD PTR [rax],eax
0x1401a8651: add    DWORD PTR [rcx],eax
0x1401a8653: add    DWORD PTR [rcx],eax
0x1401a8655: add    eax,DWORD PTR [rcx]
0x1401a8657: add    DWORD PTR [rax],eax
0x1401a8659: add    eax,DWORD PTR [rcx]
0x1401a865b: add    eax,DWORD PTR [rax]
0x1401a865d: add    al,BYTE PTR [rcx]
0x1401a865f: add    al,BYTE PTR [rbx]
0x1401a8661: add    eax,DWORD PTR [rbx]
0x1401a8663: add    eax,DWORD PTR [rcx]
0x1401a8665: add    BYTE PTR [rax],al
0x1401a8667: add    eax,DWORD PTR [rdx]
0x1401a8669: add    BYTE PTR [rbx],al
0x1401a866b: add    BYTE PTR [rcx],al
0x1401a866d: add    DWORD PTR [rcx],eax
0x1401a866f: add    eax,DWORD PTR [rax]
0x1401a8671: add    DWORD PTR [rdx],eax
0x1401a8673: add    BYTE PTR [rbx],al
0x1401a8675: add    eax,DWORD PTR [rbx]
0x1401a8677: add    DWORD PTR [rax],eax
