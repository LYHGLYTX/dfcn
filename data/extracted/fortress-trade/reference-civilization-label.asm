
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140b92900 <.text+0xb91900>:
   140b92900:	mov    QWORD PTR [rsp+0x8],rbx
   140b92905:	mov    QWORD PTR [rsp+0x20],rsi
   140b9290a:	push   rdi
   140b9290b:	sub    rsp,0x50
   140b9290f:	mov    rax,QWORD PTR [rip+0xd0972a]        # 0x14189c040
   140b92916:	xor    rax,rsp
   140b92919:	mov    QWORD PTR [rsp+0x40],rax
   140b9291e:	mov    esi,r9d
   140b92921:	mov    rbx,rdx
   140b92924:	mov    rax,QWORD PTR [rip+0x183eed5]        # 0x1423d1800
   140b9292b:	sub    rax,QWORD PTR [rip+0x183eec6]        # 0x1423d17f8
   140b92932:	test   rax,0xfffffffffffffff8
   140b92938:	je     0x140b92954
   140b9293a:	cmp    r8d,0xffffffff
   140b9293e:	je     0x140b92954
   140b92940:	lea    rdx,[rip+0x183eeb1]        # 0x1423d17f8
   140b92947:	mov    ecx,r8d
   140b9294a:	call   0x1400ba0a0
   140b9294f:	mov    rdi,rax
   140b92952:	jmp    0x140b92956
   140b92954:	xor    edi,edi
   140b92956:	test   rdi,rdi
   140b92959:	je     0x140b92a46
   140b9295f:	and    esi,0x2
   140b92962:	je     0x140b92999
   140b92964:	mov    r8d,0xb
   140b9296a:	lea    rdx,[rip+0xacbac7]        # 0x14165e438
   140b92971:	mov    rcx,rbx
   140b92974:	call   0x14006fa10
   140b92979:	mov    rdx,rbx
   140b9297c:	mov    ecx,DWORD PTR [rdi+0x4]
   140b9297f:	call   0x14052c130
   140b92984:	mov    r8d,0x1
   140b9298a:	lea    rdx,[rip+0xa6acff]        # 0x1415fd690
   140b92991:	mov    rcx,rbx
   140b92994:	call   0x14006fa10
   140b92999:	xorps  xmm0,xmm0
   140b9299c:	movups XMMWORD PTR [rsp+0x20],xmm0
   140b929a1:	mov    QWORD PTR [rsp+0x30],0x0
   140b929aa:	mov    QWORD PTR [rsp+0x38],0xf
   140b929b3:	mov    BYTE PTR [rsp+0x20],0x0
   140b929b8:	lea    rcx,[rdi+0x20]
   140b929bc:	xor    r9d,r9d
   140b929bf:	mov    r8b,0x1
   140b929c2:	lea    rdx,[rsp+0x20]
   140b929c7:	call   0x140a946e0
   140b929cc:	lea    rdx,[rsp+0x20]
   140b929d1:	cmp    QWORD PTR [rsp+0x38],0xf
   140b929d7:	cmova  rdx,QWORD PTR [rsp+0x20]
   140b929dd:	mov    r8,QWORD PTR [rsp+0x30]
   140b929e2:	mov    rcx,rbx
   140b929e5:	call   0x14006fa10
   140b929ea:	test   esi,esi
   140b929ec:	je     0x140b92a04
   140b929ee:	mov    r8d,0x8
   140b929f4:	lea    rdx,[rip+0xa6b08d]        # 0x1415fda88
   140b929fb:	mov    rcx,rbx
   140b929fe:	call   0x14006fa10
   140b92a03:	nop
   140b92a04:	mov    rdx,QWORD PTR [rsp+0x38]
   140b92a09:	cmp    rdx,0xf
   140b92a0d:	jbe    0x140b92a5b
   140b92a0f:	inc    rdx
   140b92a12:	mov    rcx,QWORD PTR [rsp+0x20]
   140b92a17:	mov    rax,rcx
   140b92a1a:	cmp    rdx,0x1000
   140b92a21:	jb     0x140b92a3f
   140b92a23:	add    rdx,0x27
   140b92a27:	mov    rcx,QWORD PTR [rcx-0x8]
   140b92a2b:	sub    rax,rcx
   140b92a2e:	add    rax,0xfffffffffffffff8
   140b92a32:	cmp    rax,0x1f
   140b92a36:	jbe    0x140b92a3f
   140b92a38:	call   QWORD PTR [rip+0xa530ea]        # 0x1415e5b28
   140b92a3e:	int3
   140b92a3f:	call   0x141539680
   140b92a44:	jmp    0x140b92a5b
   140b92a46:	mov    r8d,0x17
   140b92a4c:	lea    rdx,[rip+0xb4ceed]        # 0x1416df940
   140b92a53:	mov    rcx,rbx
   140b92a56:	call   0x14006fa10
   140b92a5b:	mov    rcx,QWORD PTR [rsp+0x40]
   140b92a60:	xor    rcx,rsp
   140b92a63:	call   0x141539660
   140b92a68:	mov    rbx,QWORD PTR [rsp+0x60]
   140b92a6d:	mov    rsi,QWORD PTR [rsp+0x78]
   140b92a72:	add    rsp,0x50
   140b92a76:	pop    rdi
   140b92a77:	ret
