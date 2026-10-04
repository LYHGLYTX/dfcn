0x140aa0c50: mov    QWORD PTR [rsp+0x10],rsi
0x140aa0c55: push   rdi
0x140aa0c56: sub    rsp,0x20
0x140aa0c5a: mov    QWORD PTR [rdx+0x10],0x0
0x140aa0c62: mov    rdi,rdx
0x140aa0c65: cmp    QWORD PTR [rdx+0x18],0xf
0x140aa0c6a: mov    rax,rdx
0x140aa0c6d: movsx  rsi,cx
0x140aa0c71: jbe    0x140aa0c76
0x140aa0c73: mov    rax,QWORD PTR [rdx]
0x140aa0c76: mov    BYTE PTR [rax],0x0
0x140aa0c79: mov    rcx,QWORD PTR [rip+0x1a45cd8]        # 0x1424e6958
0x140aa0c80: mov    QWORD PTR [rsp+0x30],rbx
0x140aa0c85: cmp    r9w,0xffff
0x140aa0c8a: je     0x140aa0de9
0x140aa0c90: test   r8b,r8b
0x140aa0c93: je     0x140aa0d2a
0x140aa0c99: test   si,si
0x140aa0c9c: js     0x140aa0d22
0x140aa0ca2: mov    rax,QWORD PTR [rip+0x1a45cb7]        # 0x1424e6960
0x140aa0ca9: mov    rbx,rsi
0x140aa0cac: sub    rax,rcx
0x140aa0caf: sar    rax,0x3
0x140aa0cb3: cmp    rsi,rax
0x140aa0cb6: jae    0x140aa0d22
0x140aa0cb8: test   r9w,r9w
0x140aa0cbc: js     0x140aa0df1
0x140aa0cc2: mov    rax,QWORD PTR [rcx+rsi*8]
0x140aa0cc6: movsx  r8,r9w
0x140aa0cca: mov    rdx,QWORD PTR [rax+0x178]
0x140aa0cd1: mov    rax,QWORD PTR [rax+0x180]
0x140aa0cd8: sub    rax,rdx
0x140aa0cdb: sar    rax,0x3
0x140aa0cdf: cmp    r8,rax
0x140aa0ce2: jae    0x140aa0df1
0x140aa0ce8: mov    rdx,QWORD PTR [rdx+r8*8]
0x140aa0cec: add    rdx,0x40
0x140aa0cf0: cmp    rdi,rdx
0x140aa0cf3: je     0x140aa0d12
0x140aa0cf5: cmp    QWORD PTR [rdx+0x18],0xf
0x140aa0cfa: mov    r8,QWORD PTR [rdx+0x10]
0x140aa0cfe: jbe    0x140aa0d03
0x140aa0d00: mov    rdx,QWORD PTR [rdx]
0x140aa0d03: mov    rcx,rdi
0x140aa0d06: call   0x14006f860
0x140aa0d0b: mov    rcx,QWORD PTR [rip+0x1a45c46]        # 0x1424e6958
0x140aa0d12: cmp    QWORD PTR [rdi+0x10],0x0
0x140aa0d17: ja     0x140aa0dd9
0x140aa0d1d: jmp    0x140aa0df1
0x140aa0d22: mov    rbx,rsi
0x140aa0d25: jmp    0x140aa0df1
0x140aa0d2a: test   si,si
0x140aa0d2d: js     0x140aa0d9b
0x140aa0d2f: mov    rax,QWORD PTR [rip+0x1a45c2a]        # 0x1424e6960
0x140aa0d36: sub    rax,rcx
0x140aa0d39: sar    rax,0x3
0x140aa0d3d: cmp    rsi,rax
0x140aa0d40: jae    0x140aa0d9b
0x140aa0d42: test   r9w,r9w
0x140aa0d46: js     0x140aa0d9b
0x140aa0d48: mov    rax,QWORD PTR [rcx+rsi*8]
0x140aa0d4c: movsx  r8,r9w
0x140aa0d50: mov    rdx,QWORD PTR [rax+0x178]
0x140aa0d57: mov    rax,QWORD PTR [rax+0x180]
0x140aa0d5e: sub    rax,rdx
0x140aa0d61: sar    rax,0x3
0x140aa0d65: cmp    r8,rax
0x140aa0d68: jae    0x140aa0d9b
0x140aa0d6a: mov    rdx,QWORD PTR [rdx+r8*8]
0x140aa0d6e: add    rdx,0x20
0x140aa0d72: cmp    rdi,rdx
0x140aa0d75: je     0x140aa0d94
0x140aa0d77: cmp    QWORD PTR [rdx+0x18],0xf
0x140aa0d7c: mov    r8,QWORD PTR [rdx+0x10]
0x140aa0d80: jbe    0x140aa0d85
0x140aa0d82: mov    rdx,QWORD PTR [rdx]
0x140aa0d85: mov    rcx,rdi
0x140aa0d88: call   0x14006f860
0x140aa0d8d: mov    rcx,QWORD PTR [rip+0x1a45bc4]        # 0x1424e6958
0x140aa0d94: cmp    QWORD PTR [rdi+0x10],0x0
0x140aa0d99: ja     0x140aa0dd9
0x140aa0d9b: mov    rbx,rsi
0x140aa0d9e: test   si,si
0x140aa0da1: js     0x140aa0dd9
0x140aa0da3: mov    rax,QWORD PTR [rip+0x1a45bb6]        # 0x1424e6960
0x140aa0daa: sub    rax,rcx
0x140aa0dad: sar    rax,0x3
0x140aa0db1: cmp    rbx,rax
0x140aa0db4: jae    0x140aa0dd9
0x140aa0db6: mov    rdx,QWORD PTR [rcx+rbx*8]
0x140aa0dba: add    rdx,0x20
0x140aa0dbe: cmp    rdi,rdx
0x140aa0dc1: je     0x140aa0dd9
0x140aa0dc3: cmp    QWORD PTR [rdx+0x18],0xf
0x140aa0dc8: mov    r8,QWORD PTR [rdx+0x10]
0x140aa0dcc: jbe    0x140aa0dd1
0x140aa0dce: mov    rdx,QWORD PTR [rdx]
0x140aa0dd1: mov    rcx,rdi
0x140aa0dd4: call   0x14006f860
0x140aa0dd9: mov    rbx,QWORD PTR [rsp+0x30]
0x140aa0dde: mov    rsi,QWORD PTR [rsp+0x38]
0x140aa0de3: add    rsp,0x20
0x140aa0de7: pop    rdi
0x140aa0de8: ret
0x140aa0de9: mov    rbx,rsi
0x140aa0dec: test   r8b,r8b
0x140aa0def: je     0x140aa0d9e
0x140aa0df1: test   si,si
0x140aa0df4: js     0x140aa0dd9
0x140aa0df6: mov    rax,QWORD PTR [rip+0x1a45b63]        # 0x1424e6960
0x140aa0dfd: sub    rax,rcx
0x140aa0e00: sar    rax,0x3
0x140aa0e04: cmp    rbx,rax
0x140aa0e07: jae    0x140aa0dd9
0x140aa0e09: mov    rdx,QWORD PTR [rcx+rbx*8]
0x140aa0e0d: add    rdx,0x40
0x140aa0e11: jmp    0x140aa0dbe
