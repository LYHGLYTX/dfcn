0x1413f48f0: mov    QWORD PTR [rsp+0x10],rbx
0x1413f48f5: mov    QWORD PTR [rsp+0x18],rsi
0x1413f48fa: push   rdi
0x1413f48fb: sub    rsp,0x50
0x1413f48ff: mov    rax,QWORD PTR [rip+0x4a173a]        # 0x141896040
0x1413f4906: xor    rax,rsp
0x1413f4909: mov    QWORD PTR [rsp+0x48],rax
0x1413f490e: xor    esi,esi
0x1413f4910: mov    rdi,rcx
0x1413f4913: mov    ebx,esi
0x1413f4915: call   0x1413adfa0
0x1413f491a: test   rax,rax
0x1413f491d: je     0x1413f493a
0x1413f491f: mov    eax,DWORD PTR [rax+0x9c]
0x1413f4925: cmp    eax,0xffffffff
0x1413f4928: je     0x1413f493a
0x1413f492a: mov    DWORD PTR [rsp+0x20],eax
0x1413f492e: movsxd rax,esi
0x1413f4931: mov    eax,DWORD PTR [rsp+rax*4+0x20]
0x1413f4935: jmp    0x1413f49ff
0x1413f493a: mov    edx,DWORD PTR [rdi+0xc30]
0x1413f4940: lea    r8,[rdi+0x1274]
0x1413f4947: lea    rcx,[rip+0x10ff25a]        # 0x1424f3ba8
0x1413f494e: call   0x140b500f0
0x1413f4953: test   rax,rax
0x1413f4956: je     0x1413f49ae
0x1413f4958: cmp    QWORD PTR [rax+0x130],rbx
0x1413f495f: je     0x1413f49ae
0x1413f4961: mov    rax,QWORD PTR [rax+0x130]
0x1413f4968: mov    rcx,QWORD PTR [rax+0x40]
0x1413f496c: test   rcx,rcx
0x1413f496f: je     0x1413f49ae
0x1413f4971: cmp    QWORD PTR [rcx+0x148],rbx
0x1413f4978: je     0x1413f49ae
0x1413f497a: mov    rcx,QWORD PTR [rcx+0x148]
0x1413f4981: mov    rdx,rsi
0x1413f4984: mov    rax,QWORD PTR [rcx]
0x1413f4987: mov    rcx,QWORD PTR [rcx+0x8]
0x1413f498b: nop    DWORD PTR [rax+rax*1+0x0]
0x1413f4990: cmp    rax,rcx
0x1413f4993: jae    0x1413f49ae
0x1413f4995: mov    r8d,DWORD PTR [rax]
0x1413f4998: inc    ebx
0x1413f499a: mov    DWORD PTR [rsp+rdx*4+0x20],r8d
0x1413f499f: inc    rdx
0x1413f49a2: cmp    rdx,0xa
0x1413f49a6: jge    0x1413f49ae
0x1413f49a8: add    rax,0x4
0x1413f49ac: jmp    0x1413f4990
0x1413f49ae: test   ebx,ebx
0x1413f49b0: jle    0x1413f49fa
0x1413f49b2: cmp    ebx,0x1
0x1413f49b5: jbe    0x1413f49f1
0x1413f49b7: call   0x140eb1820
0x1413f49bc: mov    r8d,eax
0x1413f49bf: mov    eax,0x3
0x1413f49c4: mul    r8d
0x1413f49c7: mov    eax,r8d
0x1413f49ca: sub    eax,edx
0x1413f49cc: shr    eax,1
0x1413f49ce: add    eax,edx
0x1413f49d0: xor    edx,edx
0x1413f49d2: shr    eax,0x1e
0x1413f49d5: imul   eax,eax,0x7fffffff
0x1413f49db: sub    r8d,eax
0x1413f49de: mov    eax,0x7fffffff
0x1413f49e3: div    ebx
0x1413f49e5: xor    edx,edx
0x1413f49e7: lea    ecx,[rax+0x1]
0x1413f49ea: mov    eax,r8d
0x1413f49ed: div    ecx
0x1413f49ef: mov    esi,eax
0x1413f49f1: movsxd rax,esi
0x1413f49f4: mov    eax,DWORD PTR [rsp+rax*4+0x20]
0x1413f49f8: jmp    0x1413f49ff
0x1413f49fa: mov    eax,0xffffffff
0x1413f49ff: mov    rcx,QWORD PTR [rsp+0x48]
0x1413f4a04: xor    rcx,rsp
0x1413f4a07: call   0x1415345d0
0x1413f4a0c: mov    rbx,QWORD PTR [rsp+0x68]
0x1413f4a11: mov    rsi,QWORD PTR [rsp+0x70]
0x1413f4a16: add    rsp,0x50
0x1413f4a1a: pop    rdi
0x1413f4a1b: ret
