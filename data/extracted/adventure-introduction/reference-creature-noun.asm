
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140aa3bd0 <.text+0xaa2bd0>:
   140aa3bd0:	mov    QWORD PTR [rsp+0x10],rsi
   140aa3bd5:	push   rdi
   140aa3bd6:	sub    rsp,0x20
   140aa3bda:	mov    QWORD PTR [rdx+0x10],0x0
   140aa3be2:	mov    rdi,rdx
   140aa3be5:	cmp    QWORD PTR [rdx+0x18],0xf
   140aa3bea:	mov    rax,rdx
   140aa3bed:	movsx  rsi,cx
   140aa3bf1:	jbe    0x140aa3bf6
   140aa3bf3:	mov    rax,QWORD PTR [rdx]
   140aa3bf6:	mov    BYTE PTR [rax],0x0
   140aa3bf9:	mov    rcx,QWORD PTR [rip+0x1a48e68]        # 0x1424eca68
   140aa3c00:	mov    QWORD PTR [rsp+0x30],rbx
   140aa3c05:	cmp    r9w,0xffff
   140aa3c0a:	je     0x140aa3d69
   140aa3c10:	test   r8b,r8b
   140aa3c13:	je     0x140aa3caa
   140aa3c19:	test   si,si
   140aa3c1c:	js     0x140aa3ca2
   140aa3c22:	mov    rax,QWORD PTR [rip+0x1a48e47]        # 0x1424eca70
   140aa3c29:	mov    rbx,rsi
   140aa3c2c:	sub    rax,rcx
   140aa3c2f:	sar    rax,0x3
   140aa3c33:	cmp    rsi,rax
   140aa3c36:	jae    0x140aa3ca2
   140aa3c38:	test   r9w,r9w
   140aa3c3c:	js     0x140aa3d71
   140aa3c42:	mov    rax,QWORD PTR [rcx+rsi*8]
   140aa3c46:	movsx  r8,r9w
   140aa3c4a:	mov    rdx,QWORD PTR [rax+0x178]
   140aa3c51:	mov    rax,QWORD PTR [rax+0x180]
   140aa3c58:	sub    rax,rdx
   140aa3c5b:	sar    rax,0x3
   140aa3c5f:	cmp    r8,rax
   140aa3c62:	jae    0x140aa3d71
   140aa3c68:	mov    rdx,QWORD PTR [rdx+r8*8]
   140aa3c6c:	add    rdx,0x40
   140aa3c70:	cmp    rdi,rdx
   140aa3c73:	je     0x140aa3c92
   140aa3c75:	cmp    QWORD PTR [rdx+0x18],0xf
   140aa3c7a:	mov    r8,QWORD PTR [rdx+0x10]
   140aa3c7e:	jbe    0x140aa3c83
   140aa3c80:	mov    rdx,QWORD PTR [rdx]
   140aa3c83:	mov    rcx,rdi
   140aa3c86:	call   0x14006f8d0
   140aa3c8b:	mov    rcx,QWORD PTR [rip+0x1a48dd6]        # 0x1424eca68
   140aa3c92:	cmp    QWORD PTR [rdi+0x10],0x0
   140aa3c97:	ja     0x140aa3d59
   140aa3c9d:	jmp    0x140aa3d71
   140aa3ca2:	mov    rbx,rsi
   140aa3ca5:	jmp    0x140aa3d71
   140aa3caa:	test   si,si
   140aa3cad:	js     0x140aa3d1b
   140aa3caf:	mov    rax,QWORD PTR [rip+0x1a48dba]        # 0x1424eca70
   140aa3cb6:	sub    rax,rcx
   140aa3cb9:	sar    rax,0x3
   140aa3cbd:	cmp    rsi,rax
   140aa3cc0:	jae    0x140aa3d1b
   140aa3cc2:	test   r9w,r9w
   140aa3cc6:	js     0x140aa3d1b
   140aa3cc8:	mov    rax,QWORD PTR [rcx+rsi*8]
   140aa3ccc:	movsx  r8,r9w
   140aa3cd0:	mov    rdx,QWORD PTR [rax+0x178]
   140aa3cd7:	mov    rax,QWORD PTR [rax+0x180]
   140aa3cde:	sub    rax,rdx
   140aa3ce1:	sar    rax,0x3
   140aa3ce5:	cmp    r8,rax
   140aa3ce8:	jae    0x140aa3d1b
   140aa3cea:	mov    rdx,QWORD PTR [rdx+r8*8]
   140aa3cee:	add    rdx,0x20
   140aa3cf2:	cmp    rdi,rdx
   140aa3cf5:	je     0x140aa3d14
   140aa3cf7:	cmp    QWORD PTR [rdx+0x18],0xf
   140aa3cfc:	mov    r8,QWORD PTR [rdx+0x10]
   140aa3d00:	jbe    0x140aa3d05
   140aa3d02:	mov    rdx,QWORD PTR [rdx]
   140aa3d05:	mov    rcx,rdi
   140aa3d08:	call   0x14006f8d0
   140aa3d0d:	mov    rcx,QWORD PTR [rip+0x1a48d54]        # 0x1424eca68
   140aa3d14:	cmp    QWORD PTR [rdi+0x10],0x0
   140aa3d19:	ja     0x140aa3d59
   140aa3d1b:	mov    rbx,rsi
   140aa3d1e:	test   si,si
   140aa3d21:	js     0x140aa3d59
   140aa3d23:	mov    rax,QWORD PTR [rip+0x1a48d46]        # 0x1424eca70
   140aa3d2a:	sub    rax,rcx
   140aa3d2d:	sar    rax,0x3
   140aa3d31:	cmp    rbx,rax
   140aa3d34:	jae    0x140aa3d59
   140aa3d36:	mov    rdx,QWORD PTR [rcx+rbx*8]
   140aa3d3a:	add    rdx,0x20
   140aa3d3e:	cmp    rdi,rdx
   140aa3d41:	je     0x140aa3d59
   140aa3d43:	cmp    QWORD PTR [rdx+0x18],0xf
   140aa3d48:	mov    r8,QWORD PTR [rdx+0x10]
   140aa3d4c:	jbe    0x140aa3d51
   140aa3d4e:	mov    rdx,QWORD PTR [rdx]
   140aa3d51:	mov    rcx,rdi
   140aa3d54:	call   0x14006f8d0
   140aa3d59:	mov    rbx,QWORD PTR [rsp+0x30]
   140aa3d5e:	mov    rsi,QWORD PTR [rsp+0x38]
   140aa3d63:	add    rsp,0x20
   140aa3d67:	pop    rdi
   140aa3d68:	ret
   140aa3d69:	mov    rbx,rsi
   140aa3d6c:	test   r8b,r8b
   140aa3d6f:	je     0x140aa3d1e
   140aa3d71:	test   si,si
   140aa3d74:	js     0x140aa3d59
   140aa3d76:	mov    rax,QWORD PTR [rip+0x1a48cf3]        # 0x1424eca70
   140aa3d7d:	sub    rax,rcx
   140aa3d80:	sar    rax,0x3
   140aa3d84:	cmp    rbx,rax
   140aa3d87:	jae    0x140aa3d59
   140aa3d89:	mov    rdx,QWORD PTR [rcx+rbx*8]
   140aa3d8d:	add    rdx,0x40
   140aa3d91:	jmp    0x140aa3d3e
