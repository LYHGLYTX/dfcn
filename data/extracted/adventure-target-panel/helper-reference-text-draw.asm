
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140ad9960 <.text+0xad8960>:
   140ad9960:	40 53                	rex push rbx
   140ad9962:	56                   	push   rsi
   140ad9963:	57                   	push   rdi
   140ad9964:	48 83 ec 50          	sub    rsp,0x50
   140ad9968:	48 8b 05 d1 26 dc 00 	mov    rax,QWORD PTR [rip+0xdc26d1]        # 0x14189c040
   140ad996f:	48 33 c4             	xor    rax,rsp
   140ad9972:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   140ad9977:	49 63 d9             	movsxd rbx,r9d
   140ad997a:	48 8b f9             	mov    rdi,rcx
   140ad997d:	48 83 7a 10 00       	cmp    QWORD PTR [rdx+0x10],0x0
   140ad9982:	0f 84 96 00 00 00    	je     0x140ad9a1e
   140ad9988:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140ad998d:	e8 3e 5c 59 ff       	call   0x14006f5d0
   140ad9992:	90                   	nop
   140ad9993:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   140ad9998:	85 db                	test   ebx,ebx
   140ad999a:	74 16                	je     0x140ad99b2
   140ad999c:	48 3b cb             	cmp    rcx,rbx
   140ad999f:	76 11                	jbe    0x140ad99b2
   140ad99a1:	8b d3                	mov    edx,ebx
   140ad99a3:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140ad99a8:	e8 63 3f a5 ff       	call   0x14052d910
   140ad99ad:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   140ad99b2:	33 f6                	xor    esi,esi
   140ad99b4:	8b de                	mov    ebx,esi
   140ad99b6:	48 85 c9             	test   rcx,rcx
   140ad99b9:	74 59                	je     0x140ad9a14
   140ad99bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140ad99c0:	8b 87 84 00 00 00    	mov    eax,DWORD PTR [rdi+0x84]
   140ad99c6:	3b 05 b8 3d 8f 01    	cmp    eax,DWORD PTR [rip+0x18f3db8]        # 0x1423cd784
   140ad99cc:	7d 46                	jge    0x140ad9a14
   140ad99ce:	85 c0                	test   eax,eax
   140ad99d0:	79 10                	jns    0x140ad99e2
   140ad99d2:	2b d8                	sub    ebx,eax
   140ad99d4:	89 b7 84 00 00 00    	mov    DWORD PTR [rdi+0x84],esi
   140ad99da:	48 63 c3             	movsxd rax,ebx
   140ad99dd:	48 3b c1             	cmp    rax,rcx
   140ad99e0:	73 32                	jae    0x140ad9a14
   140ad99e2:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   140ad99e7:	48 83 7c 24 38 0f    	cmp    QWORD PTR [rsp+0x38],0xf
   140ad99ed:	48 0f 47 44 24 20    	cmova  rax,QWORD PTR [rsp+0x20]
   140ad99f3:	48 63 d3             	movsxd rdx,ebx
   140ad99f6:	41 b0 01             	mov    r8b,0x1
   140ad99f9:	0f b6 14 02          	movzx  edx,BYTE PTR [rdx+rax*1]
   140ad99fd:	48 8b cf             	mov    rcx,rdi
   140ad9a00:	e8 8b 17 5e ff       	call   0x1400bb190
   140ad9a05:	ff c3                	inc    ebx
   140ad9a07:	48 63 c3             	movsxd rax,ebx
   140ad9a0a:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   140ad9a0f:	48 3b c1             	cmp    rax,rcx
   140ad9a12:	72 ac                	jb     0x140ad99c0
   140ad9a14:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140ad9a19:	e8 32 5e 59 ff       	call   0x14006f850
   140ad9a1e:	48 8b 4c 24 40       	mov    rcx,QWORD PTR [rsp+0x40]
   140ad9a23:	48 33 cc             	xor    rcx,rsp
   140ad9a26:	e8 35 fc a5 00       	call   0x141539660
   140ad9a2b:	48 83 c4 50          	add    rsp,0x50
   140ad9a2f:	5f                   	pop    rdi
   140ad9a30:	5e                   	pop    rsi
   140ad9a31:	5b                   	pop    rbx
   140ad9a32:	c3                   	ret
