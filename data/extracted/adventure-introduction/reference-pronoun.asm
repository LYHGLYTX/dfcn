
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140aa4850 <.text+0xaa3850>:
   140aa4850:	mov    QWORD PTR [rsp+0x8],rbx
   140aa4855:	push   rdi
   140aa4856:	sub    rsp,0x20
   140aa485a:	movzx  edi,r8b
   140aa485e:	mov    rbx,rdx
   140aa4861:	cmp    cl,0x1
   140aa4864:	jne    0x140aa486f
   140aa4866:	lea    rdx,[rip+0xc2a4ab]        # 0x1416ced18
   140aa486d:	jmp    0x140aa4883
   140aa486f:	test   cl,cl
   140aa4871:	lea    rdx,[rip+0xc2a448]        # 0x1416cecc0
   140aa4878:	lea    rax,[rip+0xb49ca9]        # 0x1415ee528
   140aa487f:	cmovne rdx,rax
   140aa4883:	mov    r8d,0x3
   140aa4889:	mov    rcx,rbx
   140aa488c:	call   0x14006f8d0
   140aa4891:	test   dil,dil
   140aa4894:	je     0x140aa48b3
   140aa4896:	cmp    QWORD PTR [rbx+0x18],0xf
   140aa489b:	mov    rax,rbx
   140aa489e:	jbe    0x140aa48a3
   140aa48a0:	mov    rax,QWORD PTR [rbx]
   140aa48a3:	add    BYTE PTR [rax],0x9f
   140aa48a6:	cmp    QWORD PTR [rbx+0x18],0xf
   140aa48ab:	jbe    0x140aa48b0
   140aa48ad:	mov    rbx,QWORD PTR [rbx]
   140aa48b0:	add    BYTE PTR [rbx],0x41
   140aa48b3:	mov    rbx,QWORD PTR [rsp+0x30]
   140aa48b8:	add    rsp,0x20
   140aa48bc:	pop    rdi
   140aa48bd:	ret
