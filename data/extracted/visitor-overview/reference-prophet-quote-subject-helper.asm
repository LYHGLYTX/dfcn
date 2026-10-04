; image=D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe
; identity=PE:6a70a6d9:02711000; entry=0x140658e20; unwind_end=0x14065908a
0x140658e20: mov    QWORD PTR [rsp+0x18],rbx
0x140658e25: push   rbp
0x140658e26: push   rsi
0x140658e27: push   rdi
0x140658e28: sub    rsp,0x130
0x140658e2f: mov    rax,QWORD PTR [rip+0x124320a]        # 0x14189c040
0x140658e36: xor    rax,rsp
0x140658e39: mov    QWORD PTR [rsp+0x120],rax
0x140658e41: mov    rsi,r9
0x140658e44: mov    rbp,r8
0x140658e47: mov    rdi,rdx
0x140658e4a: mov    rbx,rcx
0x140658e4d: mov    rax,QWORD PTR [rdx]
0x140658e50: mov    rcx,rdx
0x140658e53: call   QWORD PTR [rax]
0x140658e55: test   eax,eax
0x140658e57: je     0x140658f40
0x140658e5d: sub    eax,0x1
0x140658e60: je     0x140658f2c
0x140658e66: cmp    eax,0x1
0x140658e69: jne    0x140659067
0x140658e6f: xorps  xmm0,xmm0
0x140658e72: movups XMMWORD PTR [rsp+0x100],xmm0
0x140658e7a: xor    ecx,ecx
0x140658e7c: mov    QWORD PTR [rsp+0x110],rcx
0x140658e84: mov    QWORD PTR [rsp+0x118],0xf
0x140658e90: mov    BYTE PTR [rsp+0x100],cl
0x140658e97: xor    r9d,r9d
0x140658e9a: movzx  r8d,al
0x140658e9e: lea    rdx,[rsp+0x100]
0x140658ea6: mov    rcx,QWORD PTR [rip+0x1e92cab]        # 0x1424ebb58
0x140658ead: call   0x140a946e0
0x140658eb2: lea    rdx,[rsp+0x100]
0x140658eba: cmp    QWORD PTR [rsp+0x118],0xf
0x140658ec3: cmova  rdx,QWORD PTR [rsp+0x100]
0x140658ecc: mov    r8,QWORD PTR [rsp+0x110]
0x140658ed4: mov    rcx,rbx
0x140658ed7: call   0x14006fa10
0x140658edc: nop
0x140658edd: mov    rdx,QWORD PTR [rsp+0x118]
0x140658ee5: cmp    rdx,0xf
0x140658ee9: jbe    0x140659067
0x140658eef: inc    rdx
0x140658ef2: mov    rcx,QWORD PTR [rsp+0x100]
0x140658efa: mov    rax,rcx
0x140658efd: cmp    rdx,0x1000
0x140658f04: jb     0x140658f22
0x140658f06: add    rdx,0x27
0x140658f0a: mov    rcx,QWORD PTR [rcx-0x8]
0x140658f0e: sub    rax,rcx
0x140658f11: add    rax,0xfffffffffffffff8
0x140658f15: cmp    rax,0x1f
0x140658f19: jbe    0x140658f22
0x140658f1b: call   QWORD PTR [rip+0xf8cc07]        # 0x1415e5b28
0x140658f21: int3
0x140658f22: call   0x141539680
0x140658f27: jmp    0x140659067
0x140658f2c: xor    r9d,r9d
0x140658f2f: mov    r8d,DWORD PTR [rdi+0x10]
0x140658f33: mov    rdx,rbx
0x140658f36: call   0x140b93930
0x140658f3b: jmp    0x140659067
0x140658f40: mov    r8d,DWORD PTR [rdi+0x10]
0x140658f44: cmp    DWORD PTR [rbp+0x4],r8d
0x140658f48: jne    0x140658fd5
0x140658f4e: movsx  ecx,WORD PTR [rsp+0x170]
0x140658f56: test   ecx,ecx
0x140658f58: je     0x140658fbb
0x140658f5a: sub    ecx,0x1
0x140658f5d: je     0x140658fa1
0x140658f5f: sub    ecx,0x1
0x140658f62: je     0x140658f87
0x140658f64: cmp    ecx,0x1
0x140658f67: jne    0x140659067
0x140658f6d: mov    r8d,0x6
0x140658f73: lea    rdx,[rip+0x1009f7e]        # 0x141662ef8  'myself'
0x140658f7a: mov    rcx,rbx
0x140658f7d: call   0x14006fa10
0x140658f82: jmp    0x140659067
0x140658f87: mov    r8d,0x2
0x140658f8d: lea    rdx,[rip+0x1009f60]        # 0x141662ef4  'my'
0x140658f94: mov    rcx,rbx
0x140658f97: call   0x14006fa10
0x140658f9c: jmp    0x140659067
0x140658fa1: mov    r8d,0x2
0x140658fa7: lea    rdx,[rip+0xf94d4a]        # 0x1415edcf8  'me'
0x140658fae: mov    rcx,rbx
0x140658fb1: call   0x14006fa10
0x140658fb6: jmp    0x140659067
0x140658fbb: mov    r8d,0x1
0x140658fc1: lea    rdx,[rip+0x1009fec]        # 0x141662fb4  'I'
0x140658fc8: mov    rcx,rbx
0x140658fcb: call   0x14006fa10
0x140658fd0: jmp    0x140659067
0x140658fd5: cmp    DWORD PTR [rsi+0x4],r8d
0x140658fd9: jne    0x14065903b
0x140658fdb: movsx  ecx,WORD PTR [rsp+0x170]
0x140658fe3: test   ecx,ecx
0x140658fe5: je     0x140659024
0x140658fe7: sub    ecx,0x1
0x140658fea: je     0x140659024
0x140658fec: sub    ecx,0x1
0x140658fef: je     0x14065900d
0x140658ff1: cmp    ecx,0x1
0x140658ff4: jne    0x140659067
0x140658ff6: mov    r8d,0x8
0x140658ffc: lea    rdx,[rip+0x1009edd]        # 0x141662ee0  'yourself'
0x140659003: mov    rcx,rbx
0x140659006: call   0x14006fa10
0x14065900b: jmp    0x140659067
0x14065900d: mov    r8d,0x4
0x140659013: lea    rdx,[rip+0xf95946]        # 0x1415ee960  'your'
0x14065901a: mov    rcx,rbx
0x14065901d: call   0x14006fa10
0x140659022: jmp    0x140659067
0x140659024: mov    r8d,0x3
0x14065902a: lea    rdx,[rip+0xf9351f]        # 0x1415ec550  'you'
0x140659031: mov    rcx,rbx
0x140659034: call   0x14006fa10
0x140659039: jmp    0x140659067
0x14065903b: lea    rcx,[rsp+0x30]
0x140659040: call   0x140072080
0x140659045: xor    ecx,ecx
0x140659047: mov    WORD PTR [rsp+0x28],0x1
0x14065904e: mov    WORD PTR [rsp+0x20],cx
0x140659053: lea    r9,[rsp+0x30]
0x140659058: mov    rdx,rbx
0x14065905b: lea    rcx,[rip+0x1ea0c56]        # 0x1424f9cb8
0x140659062: call   0x140b92f10
0x140659067: mov    rcx,QWORD PTR [rsp+0x120]
0x14065906f: xor    rcx,rsp
0x140659072: call   0x141539660
0x140659077: mov    rbx,QWORD PTR [rsp+0x160]
0x14065907f: add    rsp,0x130
0x140659086: pop    rdi
0x140659087: pop    rsi
0x140659088: pop    rbp
0x140659089: ret
