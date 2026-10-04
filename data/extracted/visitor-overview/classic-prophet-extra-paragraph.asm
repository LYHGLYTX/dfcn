; image=C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe
; identity=PE:6a70b91c:0270a000; entry=0x1401a6a6f; end=0x1401a6bc5
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
