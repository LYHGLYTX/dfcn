
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140ad69a0 <.text+0xad59a0>:
   140ad69a0:	40 53                	rex push rbx
   140ad69a2:	56                   	push   rsi
   140ad69a3:	57                   	push   rdi
   140ad69a4:	48 83 ec 50          	sub    rsp,0x50
   140ad69a8:	48 8b 05 91 f6 db 00 	mov    rax,QWORD PTR [rip+0xdbf691]        # 0x141896040
   140ad69af:	48 33 c4             	xor    rax,rsp
   140ad69b2:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   140ad69b7:	49 63 d9             	movsxd rbx,r9d
   140ad69ba:	48 8b f9             	mov    rdi,rcx
   140ad69bd:	48 83 7a 10 00       	cmp    QWORD PTR [rdx+0x10],0x0
   140ad69c2:	0f 84 96 00 00 00    	je     0x140ad6a5e
   140ad69c8:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140ad69cd:	e8 8e 8b 59 ff       	call   0x14006f560
   140ad69d2:	90                   	nop
   140ad69d3:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   140ad69d8:	85 db                	test   ebx,ebx
   140ad69da:	74 16                	je     0x140ad69f2
   140ad69dc:	48 3b cb             	cmp    rcx,rbx
   140ad69df:	76 11                	jbe    0x140ad69f2
   140ad69e1:	8b d3                	mov    edx,ebx
   140ad69e3:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140ad69e8:	e8 43 49 a5 ff       	call   0x14052b330
   140ad69ed:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   140ad69f2:	33 f6                	xor    esi,esi
   140ad69f4:	8b de                	mov    ebx,esi
   140ad69f6:	48 85 c9             	test   rcx,rcx
   140ad69f9:	74 59                	je     0x140ad6a54
   140ad69fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140ad6a00:	8b 87 84 00 00 00    	mov    eax,DWORD PTR [rdi+0x84]
   140ad6a06:	3b 05 68 0c 8f 01    	cmp    eax,DWORD PTR [rip+0x18f0c68]        # 0x1423c7674
   140ad6a0c:	7d 46                	jge    0x140ad6a54
   140ad6a0e:	85 c0                	test   eax,eax
   140ad6a10:	79 10                	jns    0x140ad6a22
   140ad6a12:	2b d8                	sub    ebx,eax
   140ad6a14:	89 b7 84 00 00 00    	mov    DWORD PTR [rdi+0x84],esi
   140ad6a1a:	48 63 c3             	movsxd rax,ebx
   140ad6a1d:	48 3b c1             	cmp    rax,rcx
   140ad6a20:	73 32                	jae    0x140ad6a54
   140ad6a22:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   140ad6a27:	48 83 7c 24 38 0f    	cmp    QWORD PTR [rsp+0x38],0xf
   140ad6a2d:	48 0f 47 44 24 20    	cmova  rax,QWORD PTR [rsp+0x20]
   140ad6a33:	48 63 d3             	movsxd rdx,ebx
   140ad6a36:	41 b0 01             	mov    r8b,0x1
   140ad6a39:	0f b6 14 02          	movzx  edx,BYTE PTR [rdx+rax*1]
   140ad6a3d:	48 8b cf             	mov    rcx,rdi
   140ad6a40:	e8 db 46 5e ff       	call   0x1400bb120
   140ad6a45:	ff c3                	inc    ebx
   140ad6a47:	48 63 c3             	movsxd rax,ebx
   140ad6a4a:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   140ad6a4f:	48 3b c1             	cmp    rax,rcx
   140ad6a52:	72 ac                	jb     0x140ad6a00
   140ad6a54:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140ad6a59:	e8 82 8d 59 ff       	call   0x14006f7e0
   140ad6a5e:	48 8b 4c 24 40       	mov    rcx,QWORD PTR [rsp+0x40]
   140ad6a63:	48 33 cc             	xor    rcx,rsp
   140ad6a66:	e8 65 db a5 00       	call   0x1415345d0
   140ad6a6b:	48 83 c4 50          	add    rsp,0x50
   140ad6a6f:	5f                   	pop    rdi
   140ad6a70:	5e                   	pop    rsi
   140ad6a71:	5b                   	pop    rbx
   140ad6a72:	c3                   	ret
