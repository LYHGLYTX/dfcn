
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014074cc40 <.text+0x74bc40>:
   14074cc40:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   14074cc45:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
   14074cc4a:	48 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],rdi
   14074cc4f:	41 54                	push   r12
   14074cc51:	41 56                	push   r14
   14074cc53:	41 57                	push   r15
   14074cc55:	48 83 ec 20          	sub    rsp,0x20
   14074cc59:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14074cc5e:	45 0f b7 f9          	movzx  r15d,r9w
   14074cc62:	44 0f b7 74 24 68    	movzx  r14d,WORD PTR [rsp+0x68]
   14074cc68:	41 0f b7 e8          	movzx  ebp,r8w
   14074cc6c:	0f b7 da             	movzx  ebx,dx
   14074cc6f:	44 0f b7 e1          	movzx  r12d,cx
   14074cc73:	66 44 3b c9          	cmp    r9w,cx
   14074cc77:	7d 51                	jge    0x14074ccca
   14074cc79:	48 8b cf             	mov    rcx,rdi
   14074cc7c:	66 39 54 24 60       	cmp    WORD PTR [rsp+0x60],dx
   14074cc81:	7d 17                	jge    0x14074cc9a
   14074cc83:	41 b8 02 00 00 00    	mov    r8d,0x2
   14074cc89:	48 8d 15 cc d9 f4 00 	lea    rdx,[rip+0xf4d9cc]        # 0x14169a65c
   14074cc90:	e8 0b 2d 92 ff       	call   0x14006f9a0
   14074cc95:	e9 ef 00 00 00       	jmp    0x14074cd89
   14074cc9a:	7e 17                	jle    0x14074ccb3
   14074cc9c:	41 b8 02 00 00 00    	mov    r8d,0x2
   14074cca2:	48 8d 15 bb d9 f4 00 	lea    rdx,[rip+0xf4d9bb]        # 0x14169a664
   14074cca9:	e8 f2 2c 92 ff       	call   0x14006f9a0
   14074ccae:	e9 d6 00 00 00       	jmp    0x14074cd89
   14074ccb3:	41 b8 04 00 00 00    	mov    r8d,0x4
   14074ccb9:	48 8d 15 ac d9 f4 00 	lea    rdx,[rip+0xf4d9ac]        # 0x14169a66c
   14074ccc0:	e8 db 2c 92 ff       	call   0x14006f9a0
   14074ccc5:	e9 bf 00 00 00       	jmp    0x14074cd89
   14074ccca:	7e 4e                	jle    0x14074cd1a
   14074cccc:	48 8b cf             	mov    rcx,rdi
   14074cccf:	66 39 5c 24 60       	cmp    WORD PTR [rsp+0x60],bx
   14074ccd4:	7d 17                	jge    0x14074cced
   14074ccd6:	41 b8 02 00 00 00    	mov    r8d,0x2
   14074ccdc:	48 8d 15 7d d9 f4 00 	lea    rdx,[rip+0xf4d97d]        # 0x14169a660
   14074cce3:	e8 b8 2c 92 ff       	call   0x14006f9a0
   14074cce8:	e9 9c 00 00 00       	jmp    0x14074cd89
   14074cced:	7e 17                	jle    0x14074cd06
   14074ccef:	41 b8 02 00 00 00    	mov    r8d,0x2
   14074ccf5:	48 8d 15 6c d9 f4 00 	lea    rdx,[rip+0xf4d96c]        # 0x14169a668
   14074ccfc:	e8 9f 2c 92 ff       	call   0x14006f9a0
   14074cd01:	e9 83 00 00 00       	jmp    0x14074cd89
   14074cd06:	41 b8 04 00 00 00    	mov    r8d,0x4
   14074cd0c:	48 8d 15 61 d9 f4 00 	lea    rdx,[rip+0xf4d961]        # 0x14169a674
   14074cd13:	e8 88 2c 92 ff       	call   0x14006f9a0
   14074cd18:	eb 6f                	jmp    0x14074cd89
   14074cd1a:	66 39 5c 24 60       	cmp    WORD PTR [rsp+0x60],bx
   14074cd1f:	7d 0f                	jge    0x14074cd30
   14074cd21:	48 8d 15 54 d9 f4 00 	lea    rdx,[rip+0xf4d954]        # 0x14169a67c
   14074cd28:	41 b8 05 00 00 00    	mov    r8d,0x5
   14074cd2e:	eb 44                	jmp    0x14074cd74
   14074cd30:	7e 0f                	jle    0x14074cd41
   14074cd32:	48 8d 15 4b d9 f4 00 	lea    rdx,[rip+0xf4d94b]        # 0x14169a684
   14074cd39:	41 b8 05 00 00 00    	mov    r8d,0x5
   14074cd3f:	eb 33                	jmp    0x14074cd74
   14074cd41:	66 44 3b f5          	cmp    r14w,bp
   14074cd45:	7d 0f                	jge    0x14074cd56
   14074cd47:	48 8d 15 3e d9 f4 00 	lea    rdx,[rip+0xf4d93e]        # 0x14169a68c
   14074cd4e:	41 b8 05 00 00 00    	mov    r8d,0x5
   14074cd54:	eb 1e                	jmp    0x14074cd74
   14074cd56:	7e 0f                	jle    0x14074cd67
   14074cd58:	48 8d 15 35 d9 f4 00 	lea    rdx,[rip+0xf4d935]        # 0x14169a694
   14074cd5f:	41 b8 05 00 00 00    	mov    r8d,0x5
   14074cd65:	eb 0d                	jmp    0x14074cd74
   14074cd67:	48 8d 15 2e d9 f4 00 	lea    rdx,[rip+0xf4d92e]        # 0x14169a69c
   14074cd6e:	41 b8 04 00 00 00    	mov    r8d,0x4
   14074cd74:	48 8b cf             	mov    rcx,rdi
   14074cd77:	e8 24 2c 92 ff       	call   0x14006f9a0
   14074cd7c:	66 45 3b fc          	cmp    r15w,r12w
   14074cd80:	75 07                	jne    0x14074cd89
   14074cd82:	66 39 5c 24 60       	cmp    WORD PTR [rsp+0x60],bx
   14074cd87:	74 26                	je     0x14074cdaf
   14074cd89:	66 44 3b f5          	cmp    r14w,bp
   14074cd8d:	7d 09                	jge    0x14074cd98
   14074cd8f:	48 8d 15 0e d9 f4 00 	lea    rdx,[rip+0xf4d90e]        # 0x14169a6a4
   14074cd96:	eb 09                	jmp    0x14074cda1
   14074cd98:	7e 15                	jle    0x14074cdaf
   14074cd9a:	48 8d 15 67 d7 f4 00 	lea    rdx,[rip+0xf4d767]        # 0x14169a508
   14074cda1:	41 b8 06 00 00 00    	mov    r8d,0x6
   14074cda7:	48 8b cf             	mov    rcx,rdi
   14074cdaa:	e8 f1 2b 92 ff       	call   0x14006f9a0
   14074cdaf:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   14074cdb4:	48 8b 6c 24 48       	mov    rbp,QWORD PTR [rsp+0x48]
   14074cdb9:	48 8b 7c 24 50       	mov    rdi,QWORD PTR [rsp+0x50]
   14074cdbe:	48 83 c4 20          	add    rsp,0x20
   14074cdc2:	41 5f                	pop    r15
   14074cdc4:	41 5e                	pop    r14
   14074cdc6:	41 5c                	pop    r12
   14074cdc8:	c3                   	ret
