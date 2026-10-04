0x140c9dda0: mov    r11,rsp
0x140c9dda3: mov    QWORD PTR [r11+0x10],rbx
0x140c9dda7: mov    QWORD PTR [r11+0x18],rsi
0x140c9ddab: push   rdi
0x140c9ddac: sub    rsp,0x40
0x140c9ddb0: mov    rax,QWORD PTR [rcx]
0x140c9ddb3: lea    r9,[r11-0x10]
0x140c9ddb7: mov    rbx,rcx
0x140c9ddba: mov    edi,r8d
0x140c9ddbd: lea    rcx,[r11-0x18]
0x140c9ddc1: mov    rsi,rdx
0x140c9ddc4: mov    QWORD PTR [r11-0x28],rcx
0x140c9ddc8: lea    r8,[r11+0x8]
0x140c9ddcc: mov    rcx,rbx
0x140c9ddcf: lea    rdx,[r11+0x20]
0x140c9ddd3: call   QWORD PTR [rax+0x1f8]
0x140c9ddd9: mov    rcx,QWORD PTR [rsp+0x30]
0x140c9ddde: test   rcx,rcx
0x140c9dde1: je     0x140c9de1a
0x140c9dde3: cmp    DWORD PTR [rip+0xbf847e],0x1        # 0x141896268
0x140c9ddea: jne    0x140c9de14
0x140c9ddec: mov    rax,QWORD PTR [rip+0x17411cd]        # 0x1423defc0
0x140c9ddf3: sub    rax,QWORD PTR [rip+0x17411be]        # 0x1423defb8
0x140c9ddfa: sar    rax,0x3
0x140c9ddfe: test   rax,rax
0x140c9de01: je     0x140c9de14
0x140c9de03: mov    rax,QWORD PTR [rip+0x17411f6]        # 0x1423df000
0x140c9de0a: test   rax,rax
0x140c9de0d: je     0x140c9de14
0x140c9de0f: cmp    rcx,rax
0x140c9de12: je     0x140c9de74
0x140c9de14: cmp    BYTE PTR [rcx+0x7a],0x0
0x140c9de18: jmp    0x140c9de2b
0x140c9de1a: mov    rax,QWORD PTR [rsp+0x38]
0x140c9de1f: test   rax,rax
0x140c9de22: je     0x140c9de2d
0x140c9de24: cmp    BYTE PTR [rax+0xaa],0x0
0x140c9de2b: jne    0x140c9de74
0x140c9de2d: cmp    edi,0x1
0x140c9de30: jne    0x140c9de41
0x140c9de32: mov    r8d,0x4
0x140c9de38: lea    rdx,[rip+0x945ff5]        # 0x1415e3e34  'the '
0x140c9de3f: jmp    0x140c9de6c
0x140c9de41: test   edi,edi
0x140c9de43: jne    0x140c9de74
0x140c9de45: test   DWORD PTR [rbx+0x10],0x40000
0x140c9de4c: jne    0x140c9de74
0x140c9de4e: mov    rax,QWORD PTR [rbx]
0x140c9de51: mov    rcx,rbx
0x140c9de54: call   QWORD PTR [rax+0x478]
0x140c9de5a: cmp    eax,0x1
0x140c9de5d: jne    0x140c9de74
0x140c9de5f: mov    r8d,0x2
0x140c9de65: lea    rdx,[rip+0x94a7ac]        # 0x1415e8618  'a '
0x140c9de6c: mov    rcx,rsi
0x140c9de6f: call   0x14006f9a0
0x140c9de74: mov    rbx,QWORD PTR [rsp+0x58]
0x140c9de79: mov    rsi,QWORD PTR [rsp+0x60]
0x140c9de7e: add    rsp,0x40
0x140c9de82: pop    rdi
0x140c9de83: ret
