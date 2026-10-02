
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

00000001407f3cb0 <.text+0x7f2cb0>:
   1407f3cb0:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   1407f3cb5:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   1407f3cba:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   1407f3cbf:	55                   	push   rbp
   1407f3cc0:	41 54                	push   r12
   1407f3cc2:	41 55                	push   r13
   1407f3cc4:	41 56                	push   r14
   1407f3cc6:	41 57                	push   r15
   1407f3cc8:	48 8d 6c 24 c0       	lea    rbp,[rsp-0x40]
   1407f3ccd:	48 81 ec 40 01 00 00 	sub    rsp,0x140
   1407f3cd4:	48 8b 05 65 83 0a 01 	mov    rax,QWORD PTR [rip+0x10a8365]        # 0x14189c040
   1407f3cdb:	48 33 c4             	xor    rax,rsp
   1407f3cde:	48 89 45 30          	mov    QWORD PTR [rbp+0x30],rax
   1407f3ce2:	48 8b f9             	mov    rdi,rcx
   1407f3ce5:	80 3d cc 38 0b 01 00 	cmp    BYTE PTR [rip+0x10b38cc],0x0        # 0x1418a75b8
   1407f3cec:	0f 95 05 1d 69 e5 01 	setne  BYTE PTR [rip+0x1e5691d]        # 0x14264a610
   1407f3cf3:	c6 05 5e 69 e5 01 00 	mov    BYTE PTR [rip+0x1e5695e],0x0        # 0x14264a658
   1407f3cfa:	41 bc ff ff ff ff    	mov    r12d,0xffffffff
   1407f3d00:	44 89 65 88          	mov    DWORD PTR [rbp-0x78],r12d
   1407f3d04:	44 89 25 51 69 e5 01 	mov    DWORD PTR [rip+0x1e56951],r12d        # 0x14264a65c
   1407f3d0b:	48 8d 55 84          	lea    rdx,[rbp-0x7c]
   1407f3d0f:	48 8d 4c 24 74       	lea    rcx,[rsp+0x74]
   1407f3d14:	e8 57 f6 43 00       	call   0x140c33370
   1407f3d19:	44 89 25 ac 91 0b 01 	mov    DWORD PTR [rip+0x10b91ac],r12d        # 0x1418acecc
   1407f3d20:	48 c7 05 6d 56 0b 01 	mov    QWORD PTR [rip+0x10b566d],0xffffffffffffffff        # 0x1418a9398
   1407f3d27:	ff ff ff ff 
   1407f3d2b:	48 c7 05 6a 56 0b 01 	mov    QWORD PTR [rip+0x10b566a],0xffffffffffffffff        # 0x1418a93a0
   1407f3d32:	ff ff ff ff 
   1407f3d36:	8b 5c 24 74          	mov    ebx,DWORD PTR [rsp+0x74]
   1407f3d3a:	89 1d 7c 56 0b 01    	mov    DWORD PTR [rip+0x10b567c],ebx        # 0x1418a93bc
   1407f3d40:	8b 05 42 9a bd 01    	mov    eax,DWORD PTR [rip+0x1bd9a42]        # 0x1423cd788
   1407f3d46:	83 c0 fb             	add    eax,0xfffffffb
   1407f3d49:	89 05 71 56 0b 01    	mov    DWORD PTR [rip+0x10b5671],eax        # 0x1418a93c0
   1407f3d4f:	c6 05 62 56 0b 01 00 	mov    BYTE PTR [rip+0x10b5662],0x0        # 0x1418a93b8
   1407f3d56:	45 33 f6             	xor    r14d,r14d
   1407f3d59:	44 89 35 48 56 0b 01 	mov    DWORD PTR [rip+0x10b5648],r14d        # 0x1418a93a8
   1407f3d60:	0f b7 05 09 ce e4 01 	movzx  eax,WORD PTR [rip+0x1e4ce09]        # 0x142640b70
   1407f3d67:	66 83 e8 19          	sub    ax,0x19
   1407f3d6b:	66 83 f8 01          	cmp    ax,0x1
   1407f3d6f:	0f 86 44 2d 00 00    	jbe    0x1407f6ab9
   1407f3d75:	44 39 35 84 58 e5 01 	cmp    DWORD PTR [rip+0x1e55884],r14d        # 0x142649600
   1407f3d7c:	7f 10                	jg     0x1407f3d8e
   1407f3d7e:	80 3d b3 57 e5 01 01 	cmp    BYTE PTR [rip+0x1e557b3],0x1        # 0x142649538
   1407f3d85:	75 3d                	jne    0x1407f3dc4
   1407f3d87:	44 88 35 b2 57 e5 01 	mov    BYTE PTR [rip+0x1e557b2],r14b        # 0x142649540
   1407f3d8e:	45 33 c0             	xor    r8d,r8d
   1407f3d91:	41 0f b6 d4          	movzx  edx,r12b
   1407f3d95:	33 c9                	xor    ecx,ecx
   1407f3d97:	e8 e4 a9 0c 00       	call   0x1408be780
   1407f3d9c:	e8 bf 29 05 00       	call   0x140846760
   1407f3da1:	e8 aa f4 00 00       	call   0x140803250
   1407f3da6:	ff 15 3c 14 df 00    	call   QWORD PTR [rip+0xdf143c]        # 0x1415e51e8
   1407f3dac:	8b d0                	mov    edx,eax
   1407f3dae:	e8 2d 72 6a 00       	call   0x140e9afe0
   1407f3db3:	48 8d 0d 66 68 ba 01 	lea    rcx,[rip+0x1ba6866]        # 0x14239a620
   1407f3dba:	e8 d1 d3 2f 00       	call   0x140af1190
   1407f3dbf:	e9 fd 2c 00 00       	jmp    0x1407f6ac1
   1407f3dc4:	8b 05 6a 57 e5 01    	mov    eax,DWORD PTR [rip+0x1e5576a]        # 0x142649534
   1407f3dca:	83 f8 06             	cmp    eax,0x6
   1407f3dcd:	74 bf                	je     0x1407f3d8e
   1407f3dcf:	85 c0                	test   eax,eax
   1407f3dd1:	75 bb                	jne    0x1407f3d8e
   1407f3dd3:	48 8b 05 ae fa ce 01 	mov    rax,QWORD PTR [rip+0x1cefaae]        # 0x1424e3888
   1407f3dda:	48 2b 05 9f fa ce 01 	sub    rax,QWORD PTR [rip+0x1cefa9f]        # 0x1424e3880
   1407f3de1:	48 c1 f8 03          	sar    rax,0x3
   1407f3de5:	48 85 c0             	test   rax,rax
   1407f3de8:	74 4e                	je     0x1407f3e38
   1407f3dea:	45 33 c0             	xor    r8d,r8d
   1407f3ded:	41 0f b6 d4          	movzx  edx,r12b
   1407f3df1:	33 c9                	xor    ecx,ecx
   1407f3df3:	e8 88 a9 0c 00       	call   0x1408be780
   1407f3df8:	ff 15 ea 13 df 00    	call   QWORD PTR [rip+0xdf13ea]        # 0x1415e51e8
   1407f3dfe:	8b d0                	mov    edx,eax
   1407f3e00:	e8 db 71 6a 00       	call   0x140e9afe0
   1407f3e05:	48 8d 0d 14 68 ba 01 	lea    rcx,[rip+0x1ba6814]        # 0x14239a620
   1407f3e0c:	e8 7f d3 2f 00       	call   0x140af1190
   1407f3e11:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   1407f3e15:	48 8d 4c 24 74       	lea    rcx,[rsp+0x74]
   1407f3e1a:	e8 51 f5 43 00       	call   0x140c33370
   1407f3e1f:	44 8b 45 88          	mov    r8d,DWORD PTR [rbp-0x78]
   1407f3e23:	8b 54 24 74          	mov    edx,DWORD PTR [rsp+0x74]
   1407f3e27:	48 8d 0d 22 fa ce 01 	lea    rcx,[rip+0x1cefa22]        # 0x1424e3850
   1407f3e2e:	e8 0d 61 8f ff       	call   0x1400e9f40
   1407f3e33:	e9 89 2c 00 00       	jmp    0x1407f6ac1
   1407f3e38:	f6 05 d1 3d cf 01 01 	test   BYTE PTR [rip+0x1cf3dd1],0x1        # 0x1424e7c10
   1407f3e3f:	0f 85 7c 2c 00 00    	jne    0x1407f6ac1
   1407f3e45:	48 8d 0d 34 22 d1 01 	lea    rcx,[rip+0x1d12234]        # 0x142506080
   1407f3e4c:	e8 af 15 69 00       	call   0x140e85400
   1407f3e51:	45 33 c0             	xor    r8d,r8d
   1407f3e54:	41 0f b6 d4          	movzx  edx,r12b
   1407f3e58:	33 c9                	xor    ecx,ecx
   1407f3e5a:	e8 21 a9 0c 00       	call   0x1408be780
   1407f3e5f:	ff 15 83 13 df 00    	call   QWORD PTR [rip+0xdf1383]        # 0x1415e51e8
   1407f3e65:	8b d0                	mov    edx,eax
   1407f3e67:	e8 74 71 6a 00       	call   0x140e9afe0
   1407f3e6c:	48 8d 0d ad 67 ba 01 	lea    rcx,[rip+0x1ba67ad]        # 0x14239a620
   1407f3e73:	e8 18 d3 2f 00       	call   0x140af1190
   1407f3e78:	8b 75 84             	mov    esi,DWORD PTR [rbp-0x7c]
   1407f3e7b:	f6 05 8e 3d cf 01 10 	test   BYTE PTR [rip+0x1cf3d8e],0x10        # 0x1424e7c10
   1407f3e82:	74 1e                	je     0x1407f3ea2
   1407f3e84:	44 8b c6             	mov    r8d,esi
   1407f3e87:	8b d3                	mov    edx,ebx
   1407f3e89:	48 8d 0d c0 f9 ce 01 	lea    rcx,[rip+0x1cef9c0]        # 0x1424e3850
   1407f3e90:	e8 2b e2 00 00       	call   0x1408020c0
   1407f3e95:	f6 05 74 3d cf 01 02 	test   BYTE PTR [rip+0x1cf3d74],0x2        # 0x1424e7c10
   1407f3e9c:	0f 85 1f 2c 00 00    	jne    0x1407f6ac1
   1407f3ea2:	0f b7 05 c7 cc e4 01 	movzx  eax,WORD PTR [rip+0x1e4ccc7]        # 0x142640b70
   1407f3ea9:	66 83 f8 01          	cmp    ax,0x1
   1407f3ead:	0f 85 33 15 00 00    	jne    0x1407f53e6
   1407f3eb3:	48 8b 05 6e 7d ea 01 	mov    rax,QWORD PTR [rip+0x1ea7d6e]        # 0x14269bc28
   1407f3eba:	48 2b 05 5f 7d ea 01 	sub    rax,QWORD PTR [rip+0x1ea7d5f]        # 0x14269bc20
   1407f3ec1:	48 c1 f8 03          	sar    rax,0x3
   1407f3ec5:	bb 03 00 00 00       	mov    ebx,0x3
   1407f3eca:	48 83 f8 05          	cmp    rax,0x5
   1407f3ece:	0f 86 b6 00 00 00    	jbe    0x1407f3f8a
   1407f3ed4:	c7 05 9e 65 e5 01 07 	mov    DWORD PTR [rip+0x1e5659e],0x1010007        # 0x14264a47c
   1407f3edb:	00 01 01 
   1407f3ede:	44 89 35 8f 65 e5 01 	mov    DWORD PTR [rip+0x1e5658f],r14d        # 0x14264a474
   1407f3ee5:	89 1d 8d 65 e5 01    	mov    DWORD PTR [rip+0x1e5658d],ebx        # 0x14264a478
   1407f3eeb:	ba 1b 00 00 00       	mov    edx,0x1b
   1407f3ef0:	e8 bb 55 44 00       	call   0x140c394b0
   1407f3ef5:	ba 1c 00 00 00       	mov    edx,0x1c
   1407f3efa:	e8 b1 55 44 00       	call   0x140c394b0
   1407f3eff:	0f 57 c0             	xorps  xmm0,xmm0
   1407f3f02:	0f 11 45 f0          	movups XMMWORD PTR [rbp-0x10],xmm0
   1407f3f06:	b9 20 00 00 00       	mov    ecx,0x20
   1407f3f0b:	e8 c0 c8 87 ff       	call   0x1400707d0
   1407f3f10:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1407f3f14:	66 0f 6f 05 44 73 f9 	movdqa xmm0,XMMWORD PTR [rip+0xf97344]        # 0x14178b260
   1407f3f1b:	00 
   1407f3f1c:	f3 0f 7f 45 00       	movdqu XMMWORD PTR [rbp+0x0],xmm0
   1407f3f21:	0f 10 05 80 ab eb 00 	movups xmm0,XMMWORD PTR [rip+0xebab80]        # 0x1416aeaa8
   1407f3f28:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   1407f3f2b:	8b 0d 87 ab eb 00    	mov    ecx,DWORD PTR [rip+0xebab87]        # 0x1416aeab8
   1407f3f31:	89 48 10             	mov    DWORD PTR [rax+0x10],ecx
   1407f3f34:	44 88 70 14          	mov    BYTE PTR [rax+0x14],r14b
   1407f3f38:	45 33 c9             	xor    r9d,r9d
   1407f3f3b:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f3f3f:	48 8d 0d aa 64 e5 01 	lea    rcx,[rip+0x1e564aa]        # 0x14264a3f0
   1407f3f46:	e8 15 5a 2e 00       	call   0x140ad9960
   1407f3f4b:	90                   	nop
   1407f3f4c:	48 8b 55 08          	mov    rdx,QWORD PTR [rbp+0x8]
   1407f3f50:	48 83 fa 0f          	cmp    rdx,0xf
   1407f3f54:	76 34                	jbe    0x1407f3f8a
   1407f3f56:	48 ff c2             	inc    rdx
   1407f3f59:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
   1407f3f5d:	48 8b c1             	mov    rax,rcx
   1407f3f60:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1407f3f67:	72 1c                	jb     0x1407f3f85
   1407f3f69:	48 83 c2 27          	add    rdx,0x27
   1407f3f6d:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1407f3f71:	48 2b c1             	sub    rax,rcx
   1407f3f74:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1407f3f78:	48 83 f8 1f          	cmp    rax,0x1f
   1407f3f7c:	76 07                	jbe    0x1407f3f85
   1407f3f7e:	ff 15 a4 1b df 00    	call   QWORD PTR [rip+0xdf1ba4]        # 0x1415e5b28
   1407f3f84:	cc                   	int3
   1407f3f85:	e8 f6 56 d4 00       	call   0x141539680
   1407f3f8a:	bf 04 00 00 00       	mov    edi,0x4
   1407f3f8f:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f3f93:	0f b7 15 2e 83 0a 01 	movzx  edx,WORD PTR [rip+0x10a832e]        # 0x14189c2c8
   1407f3f9a:	66 2b 15 eb 20 d1 01 	sub    dx,WORD PTR [rip+0x1d120eb]        # 0x14250608c
   1407f3fa1:	44 0f b7 05 23 83 0a 	movzx  r8d,WORD PTR [rip+0x10a8323]        # 0x14189c2cc
   1407f3fa8:	01 
   1407f3fa9:	66 44 2b 05 dd 20 d1 	sub    r8w,WORD PTR [rip+0x1d120dd]        # 0x14250608e
   1407f3fb0:	01 
   1407f3fb1:	0f be 0d ca 20 d1 01 	movsx  ecx,BYTE PTR [rip+0x1d120ca]        # 0x142506082
   1407f3fb8:	85 c9                	test   ecx,ecx
   1407f3fba:	74 6c                	je     0x1407f4028
   1407f3fbc:	83 e9 01             	sub    ecx,0x1
   1407f3fbf:	74 55                	je     0x1407f4016
   1407f3fc1:	83 e9 01             	sub    ecx,0x1
   1407f3fc4:	74 30                	je     0x1407f3ff6
   1407f3fc6:	83 f9 01             	cmp    ecx,0x1
   1407f3fc9:	75 22                	jne    0x1407f3fed
   1407f3fcb:	0f bf c2             	movsx  eax,dx
   1407f3fce:	0f bf 0d b3 20 d1 01 	movsx  ecx,WORD PTR [rip+0x1d120b3]        # 0x142506088
   1407f3fd5:	2b c8                	sub    ecx,eax
   1407f3fd7:	ff c9                	dec    ecx
   1407f3fd9:	41 0f bf c0          	movsx  eax,r8w
   1407f3fdd:	44 0f bf 05 a5 20 d1 	movsx  r8d,WORD PTR [rip+0x1d120a5]        # 0x14250608a
   1407f3fe4:	01 
   1407f3fe5:	44 2b c0             	sub    r8d,eax
   1407f3fe8:	41 ff c8             	dec    r8d
   1407f3feb:	eb 58                	jmp    0x1407f4045
   1407f3fed:	44 8b 05 84 64 e5 01 	mov    r8d,DWORD PTR [rip+0x1e56484]        # 0x14264a478
   1407f3ff4:	eb 5c                	jmp    0x1407f4052
   1407f3ff6:	41 0f bf c8          	movsx  ecx,r8w
   1407f3ffa:	0f bf 05 83 20 d1 01 	movsx  eax,WORD PTR [rip+0x1d12083]        # 0x142506084
   1407f4001:	03 c8                	add    ecx,eax
   1407f4003:	0f bf c2             	movsx  eax,dx
   1407f4006:	44 0f bf 05 7c 20 d1 	movsx  r8d,WORD PTR [rip+0x1d1207c]        # 0x14250608a
   1407f400d:	01 
   1407f400e:	44 2b c0             	sub    r8d,eax
   1407f4011:	41 ff c8             	dec    r8d
   1407f4014:	eb 2f                	jmp    0x1407f4045
   1407f4016:	0f bf ca             	movsx  ecx,dx
   1407f4019:	0f bf 05 64 20 d1 01 	movsx  eax,WORD PTR [rip+0x1d12064]        # 0x142506084
   1407f4020:	03 c8                	add    ecx,eax
   1407f4022:	45 0f bf c0          	movsx  r8d,r8w
   1407f4026:	eb 13                	jmp    0x1407f403b
   1407f4028:	41 0f bf c0          	movsx  eax,r8w
   1407f402c:	0f bf 0d 55 20 d1 01 	movsx  ecx,WORD PTR [rip+0x1d12055]        # 0x142506088
   1407f4033:	2b c8                	sub    ecx,eax
   1407f4035:	ff c9                	dec    ecx
   1407f4037:	44 0f bf c2          	movsx  r8d,dx
   1407f403b:	0f bf 05 44 20 d1 01 	movsx  eax,WORD PTR [rip+0x1d12044]        # 0x142506086
   1407f4042:	44 03 c0             	add    r8d,eax
   1407f4045:	44 89 05 2c 64 e5 01 	mov    DWORD PTR [rip+0x1e5642c],r8d        # 0x14264a478
   1407f404c:	89 0d 22 64 e5 01    	mov    DWORD PTR [rip+0x1e56422],ecx        # 0x14264a474
   1407f4052:	8b 0d 30 97 bd 01    	mov    ecx,DWORD PTR [rip+0x1bd9730]        # 0x1423cd788
   1407f4058:	8d 41 ff             	lea    eax,[rcx-0x1]
   1407f405b:	99                   	cdq
   1407f405c:	2b c2                	sub    eax,edx
   1407f405e:	d1 f8                	sar    eax,1
   1407f4060:	ff c8                	dec    eax
   1407f4062:	44 3b c0             	cmp    r8d,eax
   1407f4065:	7d 07                	jge    0x1407f406e
   1407f4067:	8d 79 f5             	lea    edi,[rcx-0xb]
   1407f406a:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f406e:	0f 57 c0             	xorps  xmm0,xmm0
   1407f4071:	0f 11 45 d0          	movups XMMWORD PTR [rbp-0x30],xmm0
   1407f4075:	4c 89 75 e0          	mov    QWORD PTR [rbp-0x20],r14
   1407f4079:	48 c7 45 e8 0f 00 00 	mov    QWORD PTR [rbp-0x18],0xf
   1407f4080:	00 
   1407f4081:	c6 45 d0 00          	mov    BYTE PTR [rbp-0x30],0x0
   1407f4085:	8b 05 3d 13 b6 01    	mov    eax,DWORD PTR [rip+0x1b6133d]        # 0x1423553c8
   1407f408b:	44 8d 2c 80          	lea    r13d,[rax+rax*4]
   1407f408f:	44 89 6d 88          	mov    DWORD PTR [rbp-0x78],r13d
   1407f4093:	41 8d 45 05          	lea    eax,[r13+0x5]
   1407f4097:	44 3b e8             	cmp    r13d,eax
   1407f409a:	0f 8d 38 13 00 00    	jge    0x1407f53d8
   1407f40a0:	4d 63 e5             	movsxd r12,r13d
   1407f40a3:	4c 89 65 90          	mov    QWORD PTR [rbp-0x70],r12
   1407f40a7:	4c 8d 3d 52 bf 80 ff 	lea    r15,[rip+0xffffffffff80bf52]        # 0x140000000
   1407f40ae:	be 01 00 00 00       	mov    esi,0x1
   1407f40b3:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1407f40b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1407f40be:	00 00 
   1407f40c0:	48 8b 0d 61 7b ea 01 	mov    rcx,QWORD PTR [rip+0x1ea7b61]        # 0x14269bc28
   1407f40c7:	48 8b 15 52 7b ea 01 	mov    rdx,QWORD PTR [rip+0x1ea7b52]        # 0x14269bc20
   1407f40ce:	48 2b ca             	sub    rcx,rdx
   1407f40d1:	48 c1 f9 03          	sar    rcx,0x3
   1407f40d5:	49 63 c5             	movsxd rax,r13d
   1407f40d8:	48 3b c1             	cmp    rax,rcx
   1407f40db:	0f 83 f7 12 00 00    	jae    0x1407f53d8
   1407f40e1:	4a 8b 14 e2          	mov    rdx,QWORD PTR [rdx+r12*8]
   1407f40e5:	48 63 02             	movsxd rax,DWORD PTR [rdx]
   1407f40e8:	83 f8 0c             	cmp    eax,0xc
   1407f40eb:	0f 87 bc 12 00 00    	ja     0x1407f53ad
   1407f40f1:	41 8b 8c 87 f0 6a 7f 	mov    ecx,DWORD PTR [r15+rax*4+0x7f6af0]
   1407f40f8:	00 
   1407f40f9:	49 03 cf             	add    rcx,r15
   1407f40fc:	ff e1                	jmp    rcx
   1407f40fe:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1407f4103:	0f b7 05 c6 81 0a 01 	movzx  eax,WORD PTR [rip+0x10a81c6]        # 0x14189c2d0
   1407f410a:	66 89 44 24 20       	mov    WORD PTR [rsp+0x20],ax
   1407f410f:	44 0f b7 0d b5 81 0a 	movzx  r9d,WORD PTR [rip+0x10a81b5]        # 0x14189c2cc
   1407f4116:	01 
   1407f4117:	44 0f b7 05 a9 81 0a 	movzx  r8d,WORD PTR [rip+0x10a81a9]        # 0x14189c2c8
   1407f411e:	01 
   1407f411f:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f4123:	48 8d 0d c6 d3 bd 01 	lea    rcx,[rip+0x1bdd3c6]        # 0x1423d14f0
   1407f412a:	e8 01 92 68 00       	call   0x140e7d330
   1407f412f:	c7 05 43 63 e5 01 01 	mov    DWORD PTR [rip+0x1e56343],0x1010001        # 0x14264a47c
   1407f4136:	00 01 01 
   1407f4139:	44 89 35 34 63 e5 01 	mov    DWORD PTR [rip+0x1e56334],r14d        # 0x14264a474
   1407f4140:	89 3d 32 63 e5 01    	mov    DWORD PTR [rip+0x1e56332],edi        # 0x14264a478
   1407f4146:	ff c7                	inc    edi
   1407f4148:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f414c:	8b 05 76 12 b6 01    	mov    eax,DWORD PTR [rip+0x1b61276]        # 0x1423553c8
   1407f4152:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f4155:	41 8b d5             	mov    edx,r13d
   1407f4158:	2b d1                	sub    edx,ecx
   1407f415a:	83 c2 52             	add    edx,0x52
   1407f415d:	e8 4e 53 44 00       	call   0x140c394b0
   1407f4162:	48 8d 15 2f 19 e1 00 	lea    rdx,[rip+0xe1192f]        # 0x141605a98
   1407f4169:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f416d:	e8 de 3f 87 ff       	call   0x140068150
   1407f4172:	90                   	nop
   1407f4173:	45 33 c9             	xor    r9d,r9d
   1407f4176:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f417a:	48 8d 0d 6f 62 e5 01 	lea    rcx,[rip+0x1e5626f]        # 0x14264a3f0
   1407f4181:	e8 da 57 2e 00       	call   0x140ad9960
   1407f4186:	90                   	nop
   1407f4187:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f418b:	e8 c0 b6 87 ff       	call   0x14006f850
   1407f4190:	45 33 c9             	xor    r9d,r9d
   1407f4193:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f4197:	48 8d 0d 52 62 e5 01 	lea    rcx,[rip+0x1e56252]        # 0x14264a3f0
   1407f419e:	e8 bd 57 2e 00       	call   0x140ad9960
   1407f41a3:	e9 05 12 00 00       	jmp    0x1407f53ad
   1407f41a8:	8b 52 04             	mov    edx,DWORD PTR [rdx+0x4]
   1407f41ab:	48 8d 0d 9e 12 bf 01 	lea    rcx,[rip+0x1bf129e]        # 0x1423e5450
   1407f41b2:	e8 29 e5 87 ff       	call   0x1400726e0
   1407f41b7:	48 8b d8             	mov    rbx,rax
   1407f41ba:	48 85 c0             	test   rax,rax
   1407f41bd:	0f 84 ea 11 00 00    	je     0x1407f53ad
   1407f41c3:	c7 05 af 62 e5 01 06 	mov    DWORD PTR [rip+0x1e562af],0x1010006        # 0x14264a47c
   1407f41ca:	00 01 01 
   1407f41cd:	44 89 35 a0 62 e5 01 	mov    DWORD PTR [rip+0x1e562a0],r14d        # 0x14264a474
   1407f41d4:	89 3d 9e 62 e5 01    	mov    DWORD PTR [rip+0x1e5629e],edi        # 0x14264a478
   1407f41da:	ff c7                	inc    edi
   1407f41dc:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f41e0:	8b 0d e2 11 b6 01    	mov    ecx,DWORD PTR [rip+0x1b611e2]        # 0x1423553c8
   1407f41e6:	44 8d 04 89          	lea    r8d,[rcx+rcx*4]
   1407f41ea:	41 8b d5             	mov    edx,r13d
   1407f41ed:	41 2b d0             	sub    edx,r8d
   1407f41f0:	83 c2 52             	add    edx,0x52
   1407f41f3:	e8 b8 52 44 00       	call   0x140c394b0
   1407f41f8:	48 8d 15 99 18 e1 00 	lea    rdx,[rip+0xe11899]        # 0x141605a98
   1407f41ff:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4203:	e8 48 3f 87 ff       	call   0x140068150
   1407f4208:	90                   	nop
   1407f4209:	45 33 c9             	xor    r9d,r9d
   1407f420c:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f4210:	48 8d 0d d9 61 e5 01 	lea    rcx,[rip+0x1e561d9]        # 0x14264a3f0
   1407f4217:	e8 44 57 2e 00       	call   0x140ad9960
   1407f421c:	90                   	nop
   1407f421d:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4221:	e8 2a b6 87 ff       	call   0x14006f850
   1407f4226:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   1407f422c:	45 33 c0             	xor    r8d,r8d
   1407f422f:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f4233:	48 8b cb             	mov    rcx,rbx
   1407f4236:	e8 15 12 47 00       	call   0x140c65450
   1407f423b:	e9 50 ff ff ff       	jmp    0x1407f4190
   1407f4240:	8b 52 04             	mov    edx,DWORD PTR [rdx+0x4]
   1407f4243:	48 8d 0d 06 12 bf 01 	lea    rcx,[rip+0x1bf1206]        # 0x1423e5450
   1407f424a:	e8 91 e4 87 ff       	call   0x1400726e0
   1407f424f:	48 8b d8             	mov    rbx,rax
   1407f4252:	48 85 c0             	test   rax,rax
   1407f4255:	0f 84 52 11 00 00    	je     0x1407f53ad
   1407f425b:	c7 05 17 62 e5 01 06 	mov    DWORD PTR [rip+0x1e56217],0x1010006        # 0x14264a47c
   1407f4262:	00 01 01 
   1407f4265:	44 89 35 08 62 e5 01 	mov    DWORD PTR [rip+0x1e56208],r14d        # 0x14264a474
   1407f426c:	89 3d 06 62 e5 01    	mov    DWORD PTR [rip+0x1e56206],edi        # 0x14264a478
   1407f4272:	ff c7                	inc    edi
   1407f4274:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f4278:	8b 0d 4a 11 b6 01    	mov    ecx,DWORD PTR [rip+0x1b6114a]        # 0x1423553c8
   1407f427e:	44 8d 04 89          	lea    r8d,[rcx+rcx*4]
   1407f4282:	41 8b d5             	mov    edx,r13d
   1407f4285:	41 2b d0             	sub    edx,r8d
   1407f4288:	83 c2 52             	add    edx,0x52
   1407f428b:	e8 20 52 44 00       	call   0x140c394b0
   1407f4290:	48 8d 15 05 a8 eb 00 	lea    rdx,[rip+0xeba805]        # 0x1416aea9c
   1407f4297:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f429b:	e8 b0 3e 87 ff       	call   0x140068150
   1407f42a0:	90                   	nop
   1407f42a1:	45 33 c9             	xor    r9d,r9d
   1407f42a4:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f42a8:	48 8d 0d 41 61 e5 01 	lea    rcx,[rip+0x1e56141]        # 0x14264a3f0
   1407f42af:	e8 ac 56 2e 00       	call   0x140ad9960
   1407f42b4:	90                   	nop
   1407f42b5:	e9 63 ff ff ff       	jmp    0x1407f421d
   1407f42ba:	8b 52 04             	mov    edx,DWORD PTR [rdx+0x4]
   1407f42bd:	48 8d 0d ec 0d bf 01 	lea    rcx,[rip+0x1bf0dec]        # 0x1423e50b0
   1407f42c4:	e8 a7 f8 87 ff       	call   0x140073b70
   1407f42c9:	48 8b d8             	mov    rbx,rax
   1407f42cc:	48 85 c0             	test   rax,rax
   1407f42cf:	0f 84 d8 10 00 00    	je     0x1407f53ad
   1407f42d5:	c7 05 9d 61 e5 01 07 	mov    DWORD PTR [rip+0x1e5619d],0x1010007        # 0x14264a47c
   1407f42dc:	00 01 01 
   1407f42df:	44 89 35 8e 61 e5 01 	mov    DWORD PTR [rip+0x1e5618e],r14d        # 0x14264a474
   1407f42e6:	89 3d 8c 61 e5 01    	mov    DWORD PTR [rip+0x1e5618c],edi        # 0x14264a478
   1407f42ec:	ff c7                	inc    edi
   1407f42ee:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f42f2:	8b 0d d0 10 b6 01    	mov    ecx,DWORD PTR [rip+0x1b610d0]        # 0x1423553c8
   1407f42f8:	44 8d 04 89          	lea    r8d,[rcx+rcx*4]
   1407f42fc:	41 8b d5             	mov    edx,r13d
   1407f42ff:	41 2b d0             	sub    edx,r8d
   1407f4302:	83 c2 52             	add    edx,0x52
   1407f4305:	e8 a6 51 44 00       	call   0x140c394b0
   1407f430a:	48 8d 15 87 17 e1 00 	lea    rdx,[rip+0xe11787]        # 0x141605a98
   1407f4311:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4315:	e8 36 3e 87 ff       	call   0x140068150
   1407f431a:	90                   	nop
   1407f431b:	45 33 c9             	xor    r9d,r9d
   1407f431e:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f4322:	48 8d 0d c7 60 e5 01 	lea    rcx,[rip+0x1e560c7]        # 0x14264a3f0
   1407f4329:	e8 32 56 2e 00       	call   0x140ad9960
   1407f432e:	90                   	nop
   1407f432f:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4333:	e8 18 b5 87 ff       	call   0x14006f850
   1407f4338:	48 8b cb             	mov    rcx,rbx
   1407f433b:	e8 20 05 ff ff       	call   0x1407e4860
   1407f4340:	c7 05 32 61 e5 01 07 	mov    DWORD PTR [rip+0x1e56132],0x1010007        # 0x14264a47c
   1407f4347:	00 01 01 
   1407f434a:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1407f434f:	41 b1 01             	mov    r9b,0x1
   1407f4352:	45 33 c0             	xor    r8d,r8d
   1407f4355:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f4359:	48 8b cb             	mov    rcx,rbx
   1407f435c:	e8 cf a0 b3 00       	call   0x14132e430
   1407f4361:	e9 2a fe ff ff       	jmp    0x1407f4190
   1407f4366:	8b 52 04             	mov    edx,DWORD PTR [rdx+0x4]
   1407f4369:	48 8d 0d 98 9b bf 01 	lea    rcx,[rip+0x1bf9b98]        # 0x1423edf08
   1407f4370:	e8 db 39 87 ff       	call   0x140067d50
   1407f4375:	48 8b d8             	mov    rbx,rax
   1407f4378:	48 85 c0             	test   rax,rax
   1407f437b:	0f 84 2c 10 00 00    	je     0x1407f53ad
   1407f4381:	c7 05 f1 60 e5 01 03 	mov    DWORD PTR [rip+0x1e560f1],0x1010003        # 0x14264a47c
   1407f4388:	00 01 01 
   1407f438b:	44 89 35 e2 60 e5 01 	mov    DWORD PTR [rip+0x1e560e2],r14d        # 0x14264a474
   1407f4392:	89 3d e0 60 e5 01    	mov    DWORD PTR [rip+0x1e560e0],edi        # 0x14264a478
   1407f4398:	ff c7                	inc    edi
   1407f439a:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f439e:	8b 0d 24 10 b6 01    	mov    ecx,DWORD PTR [rip+0x1b61024]        # 0x1423553c8
   1407f43a4:	44 8d 04 89          	lea    r8d,[rcx+rcx*4]
   1407f43a8:	41 8b d5             	mov    edx,r13d
   1407f43ab:	41 2b d0             	sub    edx,r8d
   1407f43ae:	83 c2 52             	add    edx,0x52
   1407f43b1:	e8 fa 50 44 00       	call   0x140c394b0
   1407f43b6:	48 8d 15 db 16 e1 00 	lea    rdx,[rip+0xe116db]        # 0x141605a98
   1407f43bd:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f43c1:	e8 8a 3d 87 ff       	call   0x140068150
   1407f43c6:	90                   	nop
   1407f43c7:	45 33 c9             	xor    r9d,r9d
   1407f43ca:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f43ce:	48 8d 0d 1b 60 e5 01 	lea    rcx,[rip+0x1e5601b]        # 0x14264a3f0
   1407f43d5:	e8 86 55 2e 00       	call   0x140ad9960
   1407f43da:	90                   	nop
   1407f43db:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f43df:	e8 6c b4 87 ff       	call   0x14006f850
   1407f43e4:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1407f43e7:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f43eb:	48 8b cb             	mov    rcx,rbx
   1407f43ee:	ff 90 88 01 00 00    	call   QWORD PTR [rax+0x188]
   1407f43f4:	e9 97 fd ff ff       	jmp    0x1407f4190
   1407f43f9:	8b 52 08             	mov    edx,DWORD PTR [rdx+0x8]
   1407f43fc:	48 8d 0d 4d 10 bf 01 	lea    rcx,[rip+0x1bf104d]        # 0x1423e5450
   1407f4403:	e8 d8 e2 87 ff       	call   0x1400726e0
   1407f4408:	48 8b d8             	mov    rbx,rax
   1407f440b:	c7 05 67 60 e5 01 02 	mov    DWORD PTR [rip+0x1e56067],0x1010002        # 0x14264a47c
   1407f4412:	00 01 01 
   1407f4415:	44 89 35 58 60 e5 01 	mov    DWORD PTR [rip+0x1e56058],r14d        # 0x14264a474
   1407f441c:	89 3d 56 60 e5 01    	mov    DWORD PTR [rip+0x1e56056],edi        # 0x14264a478
   1407f4422:	ff c7                	inc    edi
   1407f4424:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f4428:	8b 0d 9a 0f b6 01    	mov    ecx,DWORD PTR [rip+0x1b60f9a]        # 0x1423553c8
   1407f442e:	44 8d 04 89          	lea    r8d,[rcx+rcx*4]
   1407f4432:	41 8b d5             	mov    edx,r13d
   1407f4435:	41 2b d0             	sub    edx,r8d
   1407f4438:	83 c2 52             	add    edx,0x52
   1407f443b:	e8 70 50 44 00       	call   0x140c394b0
   1407f4440:	48 8d 15 51 16 e1 00 	lea    rdx,[rip+0xe11651]        # 0x141605a98
   1407f4447:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f444b:	e8 00 3d 87 ff       	call   0x140068150
   1407f4450:	90                   	nop
   1407f4451:	45 33 c9             	xor    r9d,r9d
   1407f4454:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f4458:	48 8d 0d 91 5f e5 01 	lea    rcx,[rip+0x1e55f91]        # 0x14264a3f0
   1407f445f:	e8 fc 54 2e 00       	call   0x140ad9960
   1407f4464:	90                   	nop
   1407f4465:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4469:	e8 e2 b3 87 ff       	call   0x14006f850
   1407f446e:	48 85 db             	test   rbx,rbx
   1407f4471:	0f 85 af fd ff ff    	jne    0x1407f4226
   1407f4477:	48 8b 05 a2 77 ea 01 	mov    rax,QWORD PTR [rip+0x1ea77a2]        # 0x14269bc20
   1407f447e:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f4482:	f6 41 0c 02          	test   BYTE PTR [rcx+0xc],0x2
   1407f4486:	74 52                	je     0x1407f44da
   1407f4488:	48 8d 15 f9 5c e4 00 	lea    rdx,[rip+0xe45cf9]        # 0x14163a188
   1407f448f:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f4493:	e8 e8 b0 87 ff       	call   0x14006f580
   1407f4498:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f449c:	e8 ef b1 87 ff       	call   0x14006f690
   1407f44a1:	90                   	nop
   1407f44a2:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   1407f44a8:	48 8b 05 71 77 ea 01 	mov    rax,QWORD PTR [rip+0x1ea7771]        # 0x14269bc20
   1407f44af:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f44b3:	41 b0 01             	mov    r8b,0x1
   1407f44b6:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f44ba:	0f b7 49 04          	movzx  ecx,WORD PTR [rcx+0x4]
   1407f44be:	e8 0d f7 2a 00       	call   0x140aa3bd0
   1407f44c3:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f44c7:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f44cb:	e8 40 58 8c ff       	call   0x1400b9d10
   1407f44d0:	90                   	nop
   1407f44d1:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f44d5:	e9 b1 fc ff ff       	jmp    0x1407f418b
   1407f44da:	8b 41 10             	mov    eax,DWORD PTR [rcx+0x10]
   1407f44dd:	83 f8 01             	cmp    eax,0x1
   1407f44e0:	77 1a                	ja     0x1407f44fc
   1407f44e2:	44 0f b7 49 06       	movzx  r9d,WORD PTR [rcx+0x6]
   1407f44e7:	45 33 c0             	xor    r8d,r8d
   1407f44ea:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f44ee:	0f b7 49 04          	movzx  ecx,WORD PTR [rcx+0x4]
   1407f44f2:	e8 d9 f6 2a 00       	call   0x140aa3bd0
   1407f44f7:	e9 94 fc ff ff       	jmp    0x1407f4190
   1407f44fc:	83 f8 0a             	cmp    eax,0xa
   1407f44ff:	73 1b                	jae    0x1407f451c
   1407f4501:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   1407f4507:	41 b0 01             	mov    r8b,0x1
   1407f450a:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f450e:	0f b7 49 04          	movzx  ecx,WORD PTR [rcx+0x4]
   1407f4512:	e8 b9 f6 2a 00       	call   0x140aa3bd0
   1407f4517:	e9 74 fc ff ff       	jmp    0x1407f4190
   1407f451c:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f4520:	83 f8 32             	cmp    eax,0x32
   1407f4523:	73 4e                	jae    0x1407f4573
   1407f4525:	48 8d 15 68 5b e4 00 	lea    rdx,[rip+0xe45b68]        # 0x14163a094
   1407f452c:	e8 4f b0 87 ff       	call   0x14006f580
   1407f4531:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4535:	e8 56 b1 87 ff       	call   0x14006f690
   1407f453a:	90                   	nop
   1407f453b:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   1407f4541:	48 8b 05 d8 76 ea 01 	mov    rax,QWORD PTR [rip+0x1ea76d8]        # 0x14269bc20
   1407f4548:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f454c:	41 b0 01             	mov    r8b,0x1
   1407f454f:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4553:	0f b7 49 04          	movzx  ecx,WORD PTR [rcx+0x4]
   1407f4557:	e8 74 f6 2a 00       	call   0x140aa3bd0
   1407f455c:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4560:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f4564:	e8 a7 57 8c ff       	call   0x1400b9d10
   1407f4569:	90                   	nop
   1407f456a:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f456e:	e9 18 fc ff ff       	jmp    0x1407f418b
   1407f4573:	48 8d 15 26 5b e4 00 	lea    rdx,[rip+0xe45b26]        # 0x14163a0a0
   1407f457a:	e8 01 b0 87 ff       	call   0x14006f580
   1407f457f:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4583:	e8 08 b1 87 ff       	call   0x14006f690
   1407f4588:	90                   	nop
   1407f4589:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   1407f458f:	48 8b 05 8a 76 ea 01 	mov    rax,QWORD PTR [rip+0x1ea768a]        # 0x14269bc20
   1407f4596:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f459a:	41 b0 01             	mov    r8b,0x1
   1407f459d:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f45a1:	0f b7 49 04          	movzx  ecx,WORD PTR [rcx+0x4]
   1407f45a5:	e8 26 f6 2a 00       	call   0x140aa3bd0
   1407f45aa:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f45ae:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f45b2:	e8 59 57 8c ff       	call   0x1400b9d10
   1407f45b7:	90                   	nop
   1407f45b8:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f45bc:	e9 ca fb ff ff       	jmp    0x1407f418b
   1407f45c1:	c7 05 b1 5e e5 01 05 	mov    DWORD PTR [rip+0x1e55eb1],0x1010005        # 0x14264a47c
   1407f45c8:	00 01 01 
   1407f45cb:	44 89 35 a2 5e e5 01 	mov    DWORD PTR [rip+0x1e55ea2],r14d        # 0x14264a474
   1407f45d2:	89 3d a0 5e e5 01    	mov    DWORD PTR [rip+0x1e55ea0],edi        # 0x14264a478
   1407f45d8:	ff c7                	inc    edi
   1407f45da:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f45de:	8b 05 e4 0d b6 01    	mov    eax,DWORD PTR [rip+0x1b60de4]        # 0x1423553c8
   1407f45e4:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f45e7:	41 8b d5             	mov    edx,r13d
   1407f45ea:	2b d1                	sub    edx,ecx
   1407f45ec:	83 c2 52             	add    edx,0x52
   1407f45ef:	e8 bc 4e 44 00       	call   0x140c394b0
   1407f45f4:	48 8d 15 9d 14 e1 00 	lea    rdx,[rip+0xe1149d]        # 0x141605a98
   1407f45fb:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f45ff:	e8 4c 3b 87 ff       	call   0x140068150
   1407f4604:	90                   	nop
   1407f4605:	45 33 c9             	xor    r9d,r9d
   1407f4608:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f460c:	48 8d 0d dd 5d e5 01 	lea    rcx,[rip+0x1e55ddd]        # 0x14264a3f0
   1407f4613:	e8 48 53 2e 00       	call   0x140ad9960
   1407f4618:	90                   	nop
   1407f4619:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f461d:	e8 2e b2 87 ff       	call   0x14006f850
   1407f4622:	48 8b 05 f7 75 ea 01 	mov    rax,QWORD PTR [rip+0x1ea75f7]        # 0x14269bc20
   1407f4629:	4e 8b 04 e0          	mov    r8,QWORD PTR [rax+r12*8]
   1407f462d:	49 0f bf 40 04       	movsx  rax,WORD PTR [r8+0x4]
   1407f4632:	83 f8 0d             	cmp    eax,0xd
   1407f4635:	0f 87 55 fb ff ff    	ja     0x1407f4190
   1407f463b:	41 8b 8c 87 24 6b 7f 	mov    ecx,DWORD PTR [r15+rax*4+0x7f6b24]
   1407f4642:	00 
   1407f4643:	49 03 cf             	add    rcx,r15
   1407f4646:	ff e1                	jmp    rcx
   1407f4648:	48 8d 15 35 5a e4 00 	lea    rdx,[rip+0xe45a35]        # 0x14163a084
   1407f464f:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f4653:	e8 28 af 87 ff       	call   0x14006f580
   1407f4658:	e9 33 fb ff ff       	jmp    0x1407f4190
   1407f465d:	48 8d 15 28 5a e4 00 	lea    rdx,[rip+0xe45a28]        # 0x14163a08c
   1407f4664:	66 41 83 78 06 01    	cmp    WORD PTR [r8+0x6],0x1
   1407f466a:	48 8d 05 5b 5a e4 00 	lea    rax,[rip+0xe45a5b]        # 0x14163a0cc
   1407f4671:	48 0f 45 d0          	cmovne rdx,rax
   1407f4675:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f4679:	e8 02 af 87 ff       	call   0x14006f580
   1407f467e:	e9 0d fb ff ff       	jmp    0x1407f4190
   1407f4683:	48 8d 15 42 5a e4 00 	lea    rdx,[rip+0xe45a42]        # 0x14163a0cc
   1407f468a:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f468e:	e8 ed ae 87 ff       	call   0x14006f580
   1407f4693:	e9 f8 fa ff ff       	jmp    0x1407f4190
   1407f4698:	66 89 5c 24 30       	mov    WORD PTR [rsp+0x30],bx
   1407f469d:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   1407f46a2:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f46a7:	45 8b 48 08          	mov    r9d,DWORD PTR [r8+0x8]
   1407f46ab:	45 0f b7 40 06       	movzx  r8d,WORD PTR [r8+0x6]
   1407f46b0:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f46b4:	48 8d 0d 35 ce bd 01 	lea    rcx,[rip+0x1bdce35]        # 0x1423d14f0
   1407f46bb:	e8 60 d2 cd 00       	call   0x1414d1920
   1407f46c0:	e9 cb fa ff ff       	jmp    0x1407f4190
   1407f46c5:	48 8d 15 e4 59 e4 00 	lea    rdx,[rip+0xe459e4]        # 0x14163a0b0
   1407f46cc:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f46d0:	e8 ab ae 87 ff       	call   0x14006f580
   1407f46d5:	e9 b6 fa ff ff       	jmp    0x1407f4190
   1407f46da:	48 8d 15 df 59 e4 00 	lea    rdx,[rip+0xe459df]        # 0x14163a0c0
   1407f46e1:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f46e5:	e8 96 ae 87 ff       	call   0x14006f580
   1407f46ea:	e9 a1 fa ff ff       	jmp    0x1407f4190
   1407f46ef:	44 0f b7 0d d9 7b 0a 	movzx  r9d,WORD PTR [rip+0x10a7bd9]        # 0x14189c2d0
   1407f46f6:	01 
   1407f46f7:	44 0f b7 05 cd 7b 0a 	movzx  r8d,WORD PTR [rip+0x10a7bcd]        # 0x14189c2cc
   1407f46fe:	01 
   1407f46ff:	0f b7 15 c2 7b 0a 01 	movzx  edx,WORD PTR [rip+0x10a7bc2]        # 0x14189c2c8
   1407f4706:	48 8d 0d e3 cd bd 01 	lea    rcx,[rip+0x1bdcde3]        # 0x1423d14f0
   1407f470d:	e8 2e 95 88 ff       	call   0x14007dc40
   1407f4712:	0f ba e0 0f          	bt     eax,0xf
   1407f4716:	48 8d 15 1b 59 e4 00 	lea    rdx,[rip+0xe4591b]        # 0x14163a038
   1407f471d:	48 8d 05 04 59 e4 00 	lea    rax,[rip+0xe45904]        # 0x14163a028
   1407f4724:	48 0f 42 d0          	cmovb  rdx,rax
   1407f4728:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f472c:	e8 4f ae 87 ff       	call   0x14006f580
   1407f4731:	e9 5a fa ff ff       	jmp    0x1407f4190
   1407f4736:	66 89 74 24 30       	mov    WORD PTR [rsp+0x30],si
   1407f473b:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   1407f4740:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f4745:	45 8b 48 08          	mov    r9d,DWORD PTR [r8+0x8]
   1407f4749:	45 0f b7 40 06       	movzx  r8d,WORD PTR [r8+0x6]
   1407f474e:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f4752:	48 8d 0d 97 cd bd 01 	lea    rcx,[rip+0x1bdcd97]        # 0x1423d14f0
   1407f4759:	e8 c2 d1 cd 00       	call   0x1414d1920
   1407f475e:	48 8d 15 6f a3 eb 00 	lea    rdx,[rip+0xeba36f]        # 0x1416aead4
   1407f4765:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f4769:	e8 f2 ad 87 ff       	call   0x14006f560
   1407f476e:	e9 1d fa ff ff       	jmp    0x1407f4190
   1407f4773:	66 c7 44 24 30 02 00 	mov    WORD PTR [rsp+0x30],0x2
   1407f477a:	e9 1e ff ff ff       	jmp    0x1407f469d
   1407f477f:	48 8d 15 9a 58 e4 00 	lea    rdx,[rip+0xe4589a]        # 0x14163a020
   1407f4786:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f478a:	e8 f1 ad 87 ff       	call   0x14006f580
   1407f478f:	e9 fc f9 ff ff       	jmp    0x1407f4190
   1407f4794:	48 8d 15 15 2c e0 00 	lea    rdx,[rip+0xe02c15]        # 0x1415f73b0
   1407f479b:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f479f:	e8 dc ad 87 ff       	call   0x14006f580
   1407f47a4:	e9 e7 f9 ff ff       	jmp    0x1407f4190
   1407f47a9:	48 8d 15 ec 2b e0 00 	lea    rdx,[rip+0xe02bec]        # 0x1415f739c
   1407f47b0:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f47b4:	e8 c7 ad 87 ff       	call   0x14006f580
   1407f47b9:	e9 d2 f9 ff ff       	jmp    0x1407f4190
   1407f47be:	48 8d 15 a7 58 e4 00 	lea    rdx,[rip+0xe458a7]        # 0x14163a06c
   1407f47c5:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f47c9:	e8 b2 ad 87 ff       	call   0x14006f580
   1407f47ce:	e9 bd f9 ff ff       	jmp    0x1407f4190
   1407f47d3:	33 d2                	xor    edx,edx
   1407f47d5:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f47d9:	e8 52 ad 87 ff       	call   0x14006f530
   1407f47de:	48 8b 05 3b 74 ea 01 	mov    rax,QWORD PTR [rip+0x1ea743b]        # 0x14269bc20
   1407f47e5:	4a 8b 14 e0          	mov    rdx,QWORD PTR [rax+r12*8]
   1407f47e9:	8b 52 0c             	mov    edx,DWORD PTR [rdx+0xc]
   1407f47ec:	48 8d 0d 45 a9 bf 01 	lea    rcx,[rip+0x1bfa945]        # 0x1423ef138
   1407f47f3:	e8 88 1c be ff       	call   0x1403d6480
   1407f47f8:	48 8b d8             	mov    rbx,rax
   1407f47fb:	48 85 c0             	test   rax,rax
   1407f47fe:	74 5b                	je     0x1407f485b
   1407f4800:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1407f4803:	48 8b c8             	mov    rcx,rax
   1407f4806:	ff 12                	call   QWORD PTR [rdx]
   1407f4808:	66 83 f8 01          	cmp    ax,0x1
   1407f480c:	75 4d                	jne    0x1407f485b
   1407f480e:	44 89 74 24 68       	mov    DWORD PTR [rsp+0x68],r14d
   1407f4813:	44 89 74 24 60       	mov    DWORD PTR [rsp+0x60],r14d
   1407f4818:	c6 44 24 58 00       	mov    BYTE PTR [rsp+0x58],0x0
   1407f481d:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1407f4822:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   1407f4826:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
   1407f482a:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   1407f482f:	c6 44 24 38 00       	mov    BYTE PTR [rsp+0x38],0x0
   1407f4834:	44 89 74 24 30       	mov    DWORD PTR [rsp+0x30],r14d
   1407f4839:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   1407f483d:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
   1407f4840:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   1407f4844:	44 0f b7 4b 14       	movzx  r9d,WORD PTR [rbx+0x14]
   1407f4849:	44 0f b7 43 12       	movzx  r8d,WORD PTR [rbx+0x12]
   1407f484e:	0f b7 53 10          	movzx  edx,WORD PTR [rbx+0x10]
   1407f4852:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f4856:	e8 b5 e3 28 00       	call   0x140a82c10
   1407f485b:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
   1407f4860:	0f 85 2a f9 ff ff    	jne    0x1407f4190
   1407f4866:	48 8d 15 6b 58 e4 00 	lea    rdx,[rip+0xe4586b]        # 0x14163a0d8
   1407f486d:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f4871:	e8 0a ad 87 ff       	call   0x14006f580
   1407f4876:	e9 15 f9 ff ff       	jmp    0x1407f4190
   1407f487b:	c7 05 f7 5b e5 01 04 	mov    DWORD PTR [rip+0x1e55bf7],0x1010004        # 0x14264a47c
   1407f4882:	00 01 01 
   1407f4885:	44 89 35 e8 5b e5 01 	mov    DWORD PTR [rip+0x1e55be8],r14d        # 0x14264a474
   1407f488c:	89 3d e6 5b e5 01    	mov    DWORD PTR [rip+0x1e55be6],edi        # 0x14264a478
   1407f4892:	ff c7                	inc    edi
   1407f4894:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f4898:	8b 05 2a 0b b6 01    	mov    eax,DWORD PTR [rip+0x1b60b2a]        # 0x1423553c8
   1407f489e:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f48a1:	41 8b d5             	mov    edx,r13d
   1407f48a4:	2b d1                	sub    edx,ecx
   1407f48a6:	83 c2 52             	add    edx,0x52
   1407f48a9:	e8 02 4c 44 00       	call   0x140c394b0
   1407f48ae:	48 8d 15 e3 11 e1 00 	lea    rdx,[rip+0xe111e3]        # 0x141605a98
   1407f48b5:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f48b9:	e8 92 38 87 ff       	call   0x140068150
   1407f48be:	90                   	nop
   1407f48bf:	45 33 c9             	xor    r9d,r9d
   1407f48c2:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f48c6:	48 8d 0d 23 5b e5 01 	lea    rcx,[rip+0x1e55b23]        # 0x14264a3f0
   1407f48cd:	e8 8e 50 2e 00       	call   0x140ad9960
   1407f48d2:	90                   	nop
   1407f48d3:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f48d7:	e8 74 af 87 ff       	call   0x14006f850
   1407f48dc:	48 8d 15 55 5b e4 00 	lea    rdx,[rip+0xe45b55]        # 0x14163a438
   1407f48e3:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f48e7:	e8 64 38 87 ff       	call   0x140068150
   1407f48ec:	90                   	nop
   1407f48ed:	45 33 c9             	xor    r9d,r9d
   1407f48f0:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f48f4:	48 8d 0d f5 5a e5 01 	lea    rcx,[rip+0x1e55af5]        # 0x14264a3f0
   1407f48fb:	e8 60 50 2e 00       	call   0x140ad9960
   1407f4900:	90                   	nop
   1407f4901:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4905:	e9 9e 0a 00 00       	jmp    0x1407f53a8
   1407f490a:	c7 05 68 5b e5 01 04 	mov    DWORD PTR [rip+0x1e55b68],0x1010004        # 0x14264a47c
   1407f4911:	00 01 01 
   1407f4914:	44 89 35 59 5b e5 01 	mov    DWORD PTR [rip+0x1e55b59],r14d        # 0x14264a474
   1407f491b:	89 3d 57 5b e5 01    	mov    DWORD PTR [rip+0x1e55b57],edi        # 0x14264a478
   1407f4921:	ff c7                	inc    edi
   1407f4923:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f4927:	8b 05 9b 0a b6 01    	mov    eax,DWORD PTR [rip+0x1b60a9b]        # 0x1423553c8
   1407f492d:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f4930:	41 8b d5             	mov    edx,r13d
   1407f4933:	2b d1                	sub    edx,ecx
   1407f4935:	83 c2 52             	add    edx,0x52
   1407f4938:	e8 73 4b 44 00       	call   0x140c394b0
   1407f493d:	48 8d 15 54 11 e1 00 	lea    rdx,[rip+0xe11154]        # 0x141605a98
   1407f4944:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4948:	e8 03 38 87 ff       	call   0x140068150
   1407f494d:	90                   	nop
   1407f494e:	45 33 c9             	xor    r9d,r9d
   1407f4951:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f4955:	48 8d 0d 94 5a e5 01 	lea    rcx,[rip+0x1e55a94]        # 0x14264a3f0
   1407f495c:	e8 ff 4f 2e 00       	call   0x140ad9960
   1407f4961:	90                   	nop
   1407f4962:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4966:	e8 e5 ae 87 ff       	call   0x14006f850
   1407f496b:	48 8d 15 06 57 e4 00 	lea    rdx,[rip+0xe45706]        # 0x14163a078
   1407f4972:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4976:	e8 d5 37 87 ff       	call   0x140068150
   1407f497b:	90                   	nop
   1407f497c:	45 33 c9             	xor    r9d,r9d
   1407f497f:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f4983:	48 8d 0d 66 5a e5 01 	lea    rcx,[rip+0x1e55a66]        # 0x14264a3f0
   1407f498a:	e8 d1 4f 2e 00       	call   0x140ad9960
   1407f498f:	90                   	nop
   1407f4990:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4994:	e9 0f 0a 00 00       	jmp    0x1407f53a8
   1407f4999:	c7 05 d9 5a e5 01 02 	mov    DWORD PTR [rip+0x1e55ad9],0x1010002        # 0x14264a47c
   1407f49a0:	00 01 01 
   1407f49a3:	44 89 35 ca 5a e5 01 	mov    DWORD PTR [rip+0x1e55aca],r14d        # 0x14264a474
   1407f49aa:	89 3d c8 5a e5 01    	mov    DWORD PTR [rip+0x1e55ac8],edi        # 0x14264a478
   1407f49b0:	ff c7                	inc    edi
   1407f49b2:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f49b6:	8b 05 0c 0a b6 01    	mov    eax,DWORD PTR [rip+0x1b60a0c]        # 0x1423553c8
   1407f49bc:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f49bf:	41 8b d5             	mov    edx,r13d
   1407f49c2:	2b d1                	sub    edx,ecx
   1407f49c4:	83 c2 52             	add    edx,0x52
   1407f49c7:	e8 e4 4a 44 00       	call   0x140c394b0
   1407f49cc:	48 8d 15 c5 10 e1 00 	lea    rdx,[rip+0xe110c5]        # 0x141605a98
   1407f49d3:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f49d7:	e8 74 37 87 ff       	call   0x140068150
   1407f49dc:	90                   	nop
   1407f49dd:	45 33 c9             	xor    r9d,r9d
   1407f49e0:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f49e4:	48 8d 0d 05 5a e5 01 	lea    rcx,[rip+0x1e55a05]        # 0x14264a3f0
   1407f49eb:	e8 70 4f 2e 00       	call   0x140ad9960
   1407f49f0:	90                   	nop
   1407f49f1:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f49f5:	e8 56 ae 87 ff       	call   0x14006f850
   1407f49fa:	48 8b 05 1f 72 ea 01 	mov    rax,QWORD PTR [rip+0x1ea721f]        # 0x14269bc20
   1407f4a01:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f4a05:	44 0f b7 61 1c       	movzx  r12d,WORD PTR [rcx+0x1c]
   1407f4a0a:	0f b7 59 1e          	movzx  ebx,WORD PTR [rcx+0x1e]
   1407f4a0e:	66 89 5d 84          	mov    WORD PTR [rbp-0x7c],bx
   1407f4a12:	0f b7 79 20          	movzx  edi,WORD PTR [rcx+0x20]
   1407f4a16:	66 89 7d 80          	mov    WORD PTR [rbp-0x80],di
   1407f4a1a:	48 8d 15 97 59 e4 00 	lea    rdx,[rip+0xe45997]        # 0x14163a3b8
   1407f4a21:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4a25:	e8 26 37 87 ff       	call   0x140068150
   1407f4a2a:	90                   	nop
   1407f4a2b:	48 8b 05 ee 71 ea 01 	mov    rax,QWORD PTR [rip+0x1ea71ee]        # 0x14269bc20
   1407f4a32:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
   1407f4a36:	48 8b 14 d0          	mov    rdx,QWORD PTR [rax+rdx*8]
   1407f4a3a:	0f b6 4a 06          	movzx  ecx,BYTE PTR [rdx+0x6]
   1407f4a3e:	85 c9                	test   ecx,ecx
   1407f4a40:	0f 84 be 03 00 00    	je     0x1407f4e04
   1407f4a46:	83 e9 01             	sub    ecx,0x1
   1407f4a49:	0f 84 a3 01 00 00    	je     0x1407f4bf2
   1407f4a4f:	83 e9 01             	sub    ecx,0x1
   1407f4a52:	74 15                	je     0x1407f4a69
   1407f4a54:	83 f9 01             	cmp    ecx,0x1
   1407f4a57:	0f 85 b7 03 00 00    	jne    0x1407f4e14
   1407f4a5d:	48 8d 15 cc 58 e4 00 	lea    rdx,[rip+0xe458cc]        # 0x14163a330
   1407f4a64:	e9 a2 03 00 00       	jmp    0x1407f4e0b
   1407f4a69:	44 8b 6a 08          	mov    r13d,DWORD PTR [rdx+0x8]
   1407f4a6d:	8b 42 0c             	mov    eax,DWORD PTR [rdx+0xc]
   1407f4a70:	89 45 84             	mov    DWORD PTR [rbp-0x7c],eax
   1407f4a73:	44 8b 7a 10          	mov    r15d,DWORD PTR [rdx+0x10]
   1407f4a77:	f6 42 04 40          	test   BYTE PTR [rdx+0x4],0x40
   1407f4a7b:	0f 84 b7 00 00 00    	je     0x1407f4b38
   1407f4a81:	48 8d 45 98          	lea    rax,[rbp-0x68]
   1407f4a85:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1407f4a8a:	48 8d 45 8c          	lea    rax,[rbp-0x74]
   1407f4a8e:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1407f4a93:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   1407f4a97:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1407f4a9c:	48 8d 44 24 7c       	lea    rax,[rsp+0x7c]
   1407f4aa1:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1407f4aa6:	44 0f b7 cf          	movzx  r9d,di
   1407f4aaa:	44 0f b7 c3          	movzx  r8d,bx
   1407f4aae:	41 0f b7 d4          	movzx  edx,r12w
   1407f4ab2:	48 8d 0d 37 ca bd 01 	lea    rcx,[rip+0x1bdca37]        # 0x1423d14f0
   1407f4ab9:	e8 02 e2 cd 00       	call   0x1414d2cc0
   1407f4abe:	0f b7 7c 24 7c       	movzx  edi,WORD PTR [rsp+0x7c]
   1407f4ac3:	66 83 ff ff          	cmp    di,0xffff
   1407f4ac7:	75 13                	jne    0x1407f4adc
   1407f4ac9:	bf 06 00 00 00       	mov    edi,0x6
   1407f4ace:	66 89 7c 24 7c       	mov    WORD PTR [rsp+0x7c],di
   1407f4ad3:	0f b7 de             	movzx  ebx,si
   1407f4ad6:	66 89 5d 8c          	mov    WORD PTR [rbp-0x74],bx
   1407f4ada:	eb 04                	jmp    0x1407f4ae0
   1407f4adc:	0f b7 5d 8c          	movzx  ebx,WORD PTR [rbp-0x74]
   1407f4ae0:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4ae4:	e8 a7 ab 87 ff       	call   0x14006f690
   1407f4ae9:	90                   	nop
   1407f4aea:	66 89 5c 24 30       	mov    WORD PTR [rsp+0x30],bx
   1407f4aef:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1407f4af4:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f4af9:	44 8b 4d a0          	mov    r9d,DWORD PTR [rbp-0x60]
   1407f4afd:	44 0f b7 c7          	movzx  r8d,di
   1407f4b01:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4b05:	48 8d 0d e4 c9 bd 01 	lea    rcx,[rip+0x1bdc9e4]        # 0x1423d14f0
   1407f4b0c:	e8 0f ce cd 00       	call   0x1414d1920
   1407f4b11:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4b15:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4b19:	e8 f2 51 8c ff       	call   0x1400b9d10
   1407f4b1e:	48 8d 15 17 3c df 00 	lea    rdx,[rip+0xdf3c17]        # 0x1415e873c
   1407f4b25:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4b29:	e8 32 aa 87 ff       	call   0x14006f560
   1407f4b2e:	90                   	nop
   1407f4b2f:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4b33:	e8 18 ad 87 ff       	call   0x14006f850
   1407f4b38:	41 f6 c7 01          	test   r15b,0x1
   1407f4b3c:	74 09                	je     0x1407f4b47
   1407f4b3e:	48 8d 15 07 58 e4 00 	lea    rdx,[rip+0xe45807]        # 0x14163a34c
   1407f4b45:	eb 0d                	jmp    0x1407f4b54
   1407f4b47:	41 f6 c7 02          	test   r15b,0x2
   1407f4b4b:	74 10                	je     0x1407f4b5d
   1407f4b4d:	48 8d 15 d0 57 e4 00 	lea    rdx,[rip+0xe457d0]        # 0x14163a324
   1407f4b54:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4b58:	e8 03 aa 87 ff       	call   0x14006f560
   1407f4b5d:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4b61:	e8 2a ab 87 ff       	call   0x14006f690
   1407f4b66:	90                   	nop
   1407f4b67:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1407f4b6c:	44 8b c8             	mov    r9d,eax
   1407f4b6f:	44 89 74 24 68       	mov    DWORD PTR [rsp+0x68],r14d
   1407f4b74:	44 89 74 24 60       	mov    DWORD PTR [rsp+0x60],r14d
   1407f4b79:	c6 44 24 58 00       	mov    BYTE PTR [rsp+0x58],0x0
   1407f4b7e:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   1407f4b82:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
   1407f4b86:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   1407f4b8b:	c6 44 24 38 00       	mov    BYTE PTR [rsp+0x38],0x0
   1407f4b90:	44 89 74 24 30       	mov    DWORD PTR [rsp+0x30],r14d
   1407f4b95:	89 74 24 28          	mov    DWORD PTR [rsp+0x28],esi
   1407f4b99:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   1407f4b9d:	44 0f b7 45 84       	movzx  r8d,WORD PTR [rbp-0x7c]
   1407f4ba2:	41 0f b7 d5          	movzx  edx,r13w
   1407f4ba6:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4baa:	e8 61 e0 28 00       	call   0x140a82c10
   1407f4baf:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f4bb3:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4bb7:	e8 54 51 8c ff       	call   0x1400b9d10
   1407f4bbc:	48 8b 05 5d 70 ea 01 	mov    rax,QWORD PTR [rip+0x1ea705d]        # 0x14269bc20
   1407f4bc3:	4c 8b 65 90          	mov    r12,QWORD PTR [rbp-0x70]
   1407f4bc7:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f4bcb:	f6 41 04 40          	test   BYTE PTR [rcx+0x4],0x40
   1407f4bcf:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4bd3:	48 8d 15 c2 57 e4 00 	lea    rdx,[rip+0xe457c2]        # 0x14163a39c
   1407f4bda:	75 07                	jne    0x1407f4be3
   1407f4bdc:	48 8d 15 5d 57 e4 00 	lea    rdx,[rip+0xe4575d]        # 0x14163a340
   1407f4be3:	e8 78 a9 87 ff       	call   0x14006f560
   1407f4be8:	90                   	nop
   1407f4be9:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4bed:	e9 00 02 00 00       	jmp    0x1407f4df2
   1407f4bf2:	48 63 42 0c          	movsxd rax,DWORD PTR [rdx+0xc]
   1407f4bf6:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
   1407f4bfd:	00 
   1407f4bfe:	48 8b 05 83 7e cf 01 	mov    rax,QWORD PTR [rip+0x1cf7e83]        # 0x1424eca88
   1407f4c05:	8b 3c 08             	mov    edi,DWORD PTR [rax+rcx*1]
   1407f4c08:	48 8b 05 91 7e cf 01 	mov    rax,QWORD PTR [rip+0x1cf7e91]        # 0x1424ecaa0
   1407f4c0f:	8b 1c 08             	mov    ebx,DWORD PTR [rax+rcx*1]
   1407f4c12:	4c 0f bf 7a 10       	movsx  r15,WORD PTR [rdx+0x10]
   1407f4c17:	44 0f b7 c3          	movzx  r8d,bx
   1407f4c1b:	0f b7 d7             	movzx  edx,di
   1407f4c1e:	48 8d 0d 23 7e cf 01 	lea    rcx,[rip+0x1cf7e23]        # 0x1424eca48
   1407f4c25:	e8 66 6e 8c ff       	call   0x1400bba90
   1407f4c2a:	4c 8b e8             	mov    r13,rax
   1407f4c2d:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4c31:	e8 5a aa 87 ff       	call   0x14006f690
   1407f4c36:	90                   	nop
   1407f4c37:	44 0f b7 cb          	movzx  r9d,bx
   1407f4c3b:	45 33 c0             	xor    r8d,r8d
   1407f4c3e:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4c42:	0f b7 cf             	movzx  ecx,di
   1407f4c45:	e8 86 ef 2a 00       	call   0x140aa3bd0
   1407f4c4a:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4c4e:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4c52:	e8 b9 50 8c ff       	call   0x1400b9d10
   1407f4c57:	40 32 ff             	xor    dil,dil
   1407f4c5a:	48 8b 05 bf 6f ea 01 	mov    rax,QWORD PTR [rip+0x1ea6fbf]        # 0x14269bc20
   1407f4c61:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
   1407f4c65:	48 8b 0c c8          	mov    rcx,QWORD PTR [rax+rcx*8]
   1407f4c69:	f6 41 04 40          	test   BYTE PTR [rcx+0x4],0x40
   1407f4c6d:	0f 84 be 00 00 00    	je     0x1407f4d31
   1407f4c73:	48 8d 45 9c          	lea    rax,[rbp-0x64]
   1407f4c77:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1407f4c7c:	48 8d 44 24 78       	lea    rax,[rsp+0x78]
   1407f4c81:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1407f4c86:	48 8d 45 a4          	lea    rax,[rbp-0x5c]
   1407f4c8a:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1407f4c8f:	48 8d 44 24 70       	lea    rax,[rsp+0x70]
   1407f4c94:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1407f4c99:	44 0f b7 4d 80       	movzx  r9d,WORD PTR [rbp-0x80]
   1407f4c9e:	44 0f b7 45 84       	movzx  r8d,WORD PTR [rbp-0x7c]
   1407f4ca3:	41 0f b7 d4          	movzx  edx,r12w
   1407f4ca7:	48 8d 0d 42 c8 bd 01 	lea    rcx,[rip+0x1bdc842]        # 0x1423d14f0
   1407f4cae:	e8 0d e0 cd 00       	call   0x1414d2cc0
   1407f4cb3:	0f b7 7c 24 70       	movzx  edi,WORD PTR [rsp+0x70]
   1407f4cb8:	66 83 ff ff          	cmp    di,0xffff
   1407f4cbc:	75 14                	jne    0x1407f4cd2
   1407f4cbe:	bf 06 00 00 00       	mov    edi,0x6
   1407f4cc3:	66 89 7c 24 70       	mov    WORD PTR [rsp+0x70],di
   1407f4cc8:	0f b7 de             	movzx  ebx,si
   1407f4ccb:	66 89 5c 24 78       	mov    WORD PTR [rsp+0x78],bx
   1407f4cd0:	eb 05                	jmp    0x1407f4cd7
   1407f4cd2:	0f b7 5c 24 78       	movzx  ebx,WORD PTR [rsp+0x78]
   1407f4cd7:	48 8d 15 46 8e df 00 	lea    rdx,[rip+0xdf8e46]        # 0x1415edb24
   1407f4cde:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4ce2:	e8 79 a8 87 ff       	call   0x14006f560
   1407f4ce7:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4ceb:	e8 a0 a9 87 ff       	call   0x14006f690
   1407f4cf0:	90                   	nop
   1407f4cf1:	66 89 5c 24 30       	mov    WORD PTR [rsp+0x30],bx
   1407f4cf6:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1407f4cfb:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f4d00:	44 8b 4d a4          	mov    r9d,DWORD PTR [rbp-0x5c]
   1407f4d04:	44 0f b7 c7          	movzx  r8d,di
   1407f4d08:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f4d0c:	48 8d 0d dd c7 bd 01 	lea    rcx,[rip+0x1bdc7dd]        # 0x1423d14f0
   1407f4d13:	e8 08 cc cd 00       	call   0x1414d1920
   1407f4d18:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f4d1c:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4d20:	e8 eb 4f 8c ff       	call   0x1400b9d10
   1407f4d25:	40 b7 01             	mov    dil,0x1
   1407f4d28:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f4d2c:	e8 1f ab 87 ff       	call   0x14006f850
   1407f4d31:	66 45 85 ff          	test   r15w,r15w
   1407f4d35:	0f 88 86 00 00 00    	js     0x1407f4dc1
   1407f4d3b:	49 8b 8d c0 06 00 00 	mov    rcx,QWORD PTR [r13+0x6c0]
   1407f4d42:	49 8b 85 c8 06 00 00 	mov    rax,QWORD PTR [r13+0x6c8]
   1407f4d49:	48 2b c1             	sub    rax,rcx
   1407f4d4c:	48 c1 f8 03          	sar    rax,0x3
   1407f4d50:	4c 3b f8             	cmp    r15,rax
   1407f4d53:	73 6c                	jae    0x1407f4dc1
   1407f4d55:	4a 8d 1c fd 00 00 00 	lea    rbx,[r15*8+0x0]
   1407f4d5c:	00 
   1407f4d5d:	48 8b 04 19          	mov    rax,QWORD PTR [rcx+rbx*1]
   1407f4d61:	48 8b 88 98 00 00 00 	mov    rcx,QWORD PTR [rax+0x98]
   1407f4d68:	48 2b 88 90 00 00 00 	sub    rcx,QWORD PTR [rax+0x90]
   1407f4d6f:	48 c1 f9 03          	sar    rcx,0x3
   1407f4d73:	48 85 c9             	test   rcx,rcx
   1407f4d76:	74 49                	je     0x1407f4dc1
   1407f4d78:	48 8d 15 a5 8d df 00 	lea    rdx,[rip+0xdf8da5]        # 0x1415edb24
   1407f4d7f:	40 84 ff             	test   dil,dil
   1407f4d82:	48 8d 05 b3 39 df 00 	lea    rax,[rip+0xdf39b3]        # 0x1415e873c
   1407f4d89:	48 0f 45 d0          	cmovne rdx,rax
   1407f4d8d:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4d91:	e8 ca a7 87 ff       	call   0x14006f560
   1407f4d96:	49 8b 85 c0 06 00 00 	mov    rax,QWORD PTR [r13+0x6c0]
   1407f4d9d:	48 8b 0c 18          	mov    rcx,QWORD PTR [rax+rbx*1]
   1407f4da1:	48 8b 91 90 00 00 00 	mov    rdx,QWORD PTR [rcx+0x90]
   1407f4da8:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   1407f4dab:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4daf:	e8 ec a7 87 ff       	call   0x14006f5a0
   1407f4db4:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4db8:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4dbc:	e8 4f 4f 8c ff       	call   0x1400b9d10
   1407f4dc1:	48 8b 05 58 6e ea 01 	mov    rax,QWORD PTR [rip+0x1ea6e58]        # 0x14269bc20
   1407f4dc8:	4c 8b 65 90          	mov    r12,QWORD PTR [rbp-0x70]
   1407f4dcc:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f4dd0:	f6 41 04 40          	test   BYTE PTR [rcx+0x4],0x40
   1407f4dd4:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4dd8:	48 8d 15 bd 55 e4 00 	lea    rdx,[rip+0xe455bd]        # 0x14163a39c
   1407f4ddf:	75 07                	jne    0x1407f4de8
   1407f4de1:	48 8d 15 58 55 e4 00 	lea    rdx,[rip+0xe45558]        # 0x14163a340
   1407f4de8:	e8 73 a7 87 ff       	call   0x14006f560
   1407f4ded:	90                   	nop
   1407f4dee:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4df2:	e8 59 aa 87 ff       	call   0x14006f850
   1407f4df7:	4c 8d 3d 02 b2 80 ff 	lea    r15,[rip+0xffffffffff80b202]        # 0x140000000
   1407f4dfe:	44 8b 6d 88          	mov    r13d,DWORD PTR [rbp-0x78]
   1407f4e02:	eb 14                	jmp    0x1407f4e18
   1407f4e04:	48 8d 15 7d 55 e4 00 	lea    rdx,[rip+0xe4557d]        # 0x14163a388
   1407f4e0b:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4e0f:	e8 4c a7 87 ff       	call   0x14006f560
   1407f4e14:	4c 8b 65 90          	mov    r12,QWORD PTR [rbp-0x70]
   1407f4e18:	ba 32 00 00 00       	mov    edx,0x32
   1407f4e1d:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4e21:	e8 ba 90 d3 ff       	call   0x14052dee0
   1407f4e26:	48 8b 05 f3 6d ea 01 	mov    rax,QWORD PTR [rip+0x1ea6df3]        # 0x14269bc20
   1407f4e2d:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f4e31:	0f b7 41 04          	movzx  eax,WORD PTR [rcx+0x4]
   1407f4e35:	a8 02                	test   al,0x2
   1407f4e37:	74 6a                	je     0x1407f4ea3
   1407f4e39:	83 e0 1c             	and    eax,0x1c
   1407f4e3c:	48 98                	cdqe
   1407f4e3e:	41 0f b6 84 07 80 6b 	movzx  eax,BYTE PTR [r15+rax*1+0x7f6b80]
   1407f4e45:	7f 00 
   1407f4e47:	41 8b 8c 87 5c 6b 7f 	mov    ecx,DWORD PTR [r15+rax*4+0x7f6b5c]
   1407f4e4e:	00 
   1407f4e4f:	49 03 cf             	add    rcx,r15
   1407f4e52:	ff e1                	jmp    rcx
   1407f4e54:	48 8d 15 01 55 e4 00 	lea    rdx,[rip+0xe45501]        # 0x14163a35c
   1407f4e5b:	eb 3d                	jmp    0x1407f4e9a
   1407f4e5d:	48 8d 15 fc 54 e4 00 	lea    rdx,[rip+0xe454fc]        # 0x14163a360
   1407f4e64:	eb 34                	jmp    0x1407f4e9a
   1407f4e66:	48 8d 15 e7 54 e4 00 	lea    rdx,[rip+0xe454e7]        # 0x14163a354
   1407f4e6d:	eb 2b                	jmp    0x1407f4e9a
   1407f4e6f:	48 8d 15 e2 54 e4 00 	lea    rdx,[rip+0xe454e2]        # 0x14163a358
   1407f4e76:	eb 22                	jmp    0x1407f4e9a
   1407f4e78:	48 8d 15 f1 53 e4 00 	lea    rdx,[rip+0xe453f1]        # 0x14163a270
   1407f4e7f:	eb 19                	jmp    0x1407f4e9a
   1407f4e81:	48 8d 15 ec 53 e4 00 	lea    rdx,[rip+0xe453ec]        # 0x14163a274
   1407f4e88:	eb 10                	jmp    0x1407f4e9a
   1407f4e8a:	48 8d 15 d7 53 e4 00 	lea    rdx,[rip+0xe453d7]        # 0x14163a268
   1407f4e91:	eb 07                	jmp    0x1407f4e9a
   1407f4e93:	48 8d 15 d2 53 e4 00 	lea    rdx,[rip+0xe453d2]        # 0x14163a26c
   1407f4e9a:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4e9e:	e8 bd a6 87 ff       	call   0x14006f560
   1407f4ea3:	48 8b 05 76 6d ea 01 	mov    rax,QWORD PTR [rip+0x1ea6d76]        # 0x14269bc20
   1407f4eaa:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f4eae:	f6 41 04 20          	test   BYTE PTR [rcx+0x4],0x20
   1407f4eb2:	74 10                	je     0x1407f4ec4
   1407f4eb4:	48 8d 15 0d 54 e4 00 	lea    rdx,[rip+0xe4540d]        # 0x14163a2c8
   1407f4ebb:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f4ebf:	e8 9c a6 87 ff       	call   0x14006f560
   1407f4ec4:	45 33 c9             	xor    r9d,r9d
   1407f4ec7:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f4ecb:	48 8d 0d 1e 55 e5 01 	lea    rcx,[rip+0x1e5551e]        # 0x14264a3f0
   1407f4ed2:	e8 89 4a 2e 00       	call   0x140ad9960
   1407f4ed7:	90                   	nop
   1407f4ed8:	e9 c7 04 00 00       	jmp    0x1407f53a4
   1407f4edd:	c7 05 95 55 e5 01 01 	mov    DWORD PTR [rip+0x1e55595],0x1010001        # 0x14264a47c
   1407f4ee4:	00 01 01 
   1407f4ee7:	44 89 35 86 55 e5 01 	mov    DWORD PTR [rip+0x1e55586],r14d        # 0x14264a474
   1407f4eee:	89 3d 84 55 e5 01    	mov    DWORD PTR [rip+0x1e55584],edi        # 0x14264a478
   1407f4ef4:	ff c7                	inc    edi
   1407f4ef6:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f4efa:	8b 05 c8 04 b6 01    	mov    eax,DWORD PTR [rip+0x1b604c8]        # 0x1423553c8
   1407f4f00:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f4f03:	41 8b d5             	mov    edx,r13d
   1407f4f06:	2b d1                	sub    edx,ecx
   1407f4f08:	83 c2 52             	add    edx,0x52
   1407f4f0b:	e8 a0 45 44 00       	call   0x140c394b0
   1407f4f10:	48 8d 15 81 0b e1 00 	lea    rdx,[rip+0xe10b81]        # 0x141605a98
   1407f4f17:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4f1b:	e8 30 32 87 ff       	call   0x140068150
   1407f4f20:	90                   	nop
   1407f4f21:	45 33 c9             	xor    r9d,r9d
   1407f4f24:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4f28:	48 8d 0d c1 54 e5 01 	lea    rcx,[rip+0x1e554c1]        # 0x14264a3f0
   1407f4f2f:	e8 2c 4a 2e 00       	call   0x140ad9960
   1407f4f34:	90                   	nop
   1407f4f35:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4f39:	e8 12 a9 87 ff       	call   0x14006f850
   1407f4f3e:	48 8b 05 db 6c ea 01 	mov    rax,QWORD PTR [rip+0x1ea6cdb]        # 0x14269bc20
   1407f4f45:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f4f49:	8b 41 04             	mov    eax,DWORD PTR [rcx+0x4]
   1407f4f4c:	8b c8                	mov    ecx,eax
   1407f4f4e:	83 e1 01             	and    ecx,0x1
   1407f4f51:	74 2c                	je     0x1407f4f7f
   1407f4f53:	83 e0 02             	and    eax,0x2
   1407f4f56:	74 2a                	je     0x1407f4f82
   1407f4f58:	48 8d 15 e1 54 e4 00 	lea    rdx,[rip+0xe454e1]        # 0x14163a440
   1407f4f5f:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4f63:	e8 e8 31 87 ff       	call   0x140068150
   1407f4f68:	90                   	nop
   1407f4f69:	45 33 c9             	xor    r9d,r9d
   1407f4f6c:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4f70:	48 8d 0d 79 54 e5 01 	lea    rcx,[rip+0x1e55479]        # 0x14264a3f0
   1407f4f77:	e8 e4 49 2e 00       	call   0x140ad9960
   1407f4f7c:	90                   	nop
   1407f4f7d:	eb 76                	jmp    0x1407f4ff5
   1407f4f7f:	83 e0 02             	and    eax,0x2
   1407f4f82:	85 c9                	test   ecx,ecx
   1407f4f84:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4f88:	74 23                	je     0x1407f4fad
   1407f4f8a:	48 8d 15 7f 54 e4 00 	lea    rdx,[rip+0xe4547f]        # 0x14163a410
   1407f4f91:	e8 ba 31 87 ff       	call   0x140068150
   1407f4f96:	90                   	nop
   1407f4f97:	45 33 c9             	xor    r9d,r9d
   1407f4f9a:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4f9e:	48 8d 0d 4b 54 e5 01 	lea    rcx,[rip+0x1e5544b]        # 0x14264a3f0
   1407f4fa5:	e8 b6 49 2e 00       	call   0x140ad9960
   1407f4faa:	90                   	nop
   1407f4fab:	eb 48                	jmp    0x1407f4ff5
   1407f4fad:	85 c0                	test   eax,eax
   1407f4faf:	74 23                	je     0x1407f4fd4
   1407f4fb1:	48 8d 15 70 54 e4 00 	lea    rdx,[rip+0xe45470]        # 0x14163a428
   1407f4fb8:	e8 93 31 87 ff       	call   0x140068150
   1407f4fbd:	90                   	nop
   1407f4fbe:	45 33 c9             	xor    r9d,r9d
   1407f4fc1:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4fc5:	48 8d 0d 24 54 e5 01 	lea    rcx,[rip+0x1e55424]        # 0x14264a3f0
   1407f4fcc:	e8 8f 49 2e 00       	call   0x140ad9960
   1407f4fd1:	90                   	nop
   1407f4fd2:	eb 21                	jmp    0x1407f4ff5
   1407f4fd4:	48 8d 15 9d 53 e4 00 	lea    rdx,[rip+0xe4539d]        # 0x14163a378
   1407f4fdb:	e8 70 31 87 ff       	call   0x140068150
   1407f4fe0:	90                   	nop
   1407f4fe1:	45 33 c9             	xor    r9d,r9d
   1407f4fe4:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f4fe8:	48 8d 0d 01 54 e5 01 	lea    rcx,[rip+0x1e55401]        # 0x14264a3f0
   1407f4fef:	e8 6c 49 2e 00       	call   0x140ad9960
   1407f4ff4:	90                   	nop
   1407f4ff5:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f4ff9:	e8 52 a8 87 ff       	call   0x14006f850
   1407f4ffe:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f5002:	e8 89 a6 87 ff       	call   0x14006f690
   1407f5007:	90                   	nop
   1407f5008:	48 8b 05 11 6c ea 01 	mov    rax,QWORD PTR [rip+0x1ea6c11]        # 0x14269bc20
   1407f500f:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f5013:	0f bf 49 08          	movsx  ecx,WORD PTR [rcx+0x8]
   1407f5017:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f501b:	e8 90 72 d3 ff       	call   0x14052c2b0
   1407f5020:	45 33 c9             	xor    r9d,r9d
   1407f5023:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f5027:	48 8d 0d c2 53 e5 01 	lea    rcx,[rip+0x1e553c2]        # 0x14264a3f0
   1407f502e:	e8 2d 49 2e 00       	call   0x140ad9960
   1407f5033:	48 8d 15 46 53 e4 00 	lea    rdx,[rip+0xe45346]        # 0x14163a380
   1407f503a:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f503e:	e8 0d 31 87 ff       	call   0x140068150
   1407f5043:	90                   	nop
   1407f5044:	45 33 c9             	xor    r9d,r9d
   1407f5047:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f504b:	48 8d 0d 9e 53 e5 01 	lea    rcx,[rip+0x1e5539e]        # 0x14264a3f0
   1407f5052:	e8 09 49 2e 00       	call   0x140ad9960
   1407f5057:	90                   	nop
   1407f5058:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f505c:	e8 ef a7 87 ff       	call   0x14006f850
   1407f5061:	90                   	nop
   1407f5062:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f5066:	e9 3d 03 00 00       	jmp    0x1407f53a8
   1407f506b:	c7 05 07 54 e5 01 04 	mov    DWORD PTR [rip+0x1e55407],0x1010004        # 0x14264a47c
   1407f5072:	00 01 01 
   1407f5075:	44 89 35 f8 53 e5 01 	mov    DWORD PTR [rip+0x1e553f8],r14d        # 0x14264a474
   1407f507c:	89 3d f6 53 e5 01    	mov    DWORD PTR [rip+0x1e553f6],edi        # 0x14264a478
   1407f5082:	ff c7                	inc    edi
   1407f5084:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f5088:	8b 05 3a 03 b6 01    	mov    eax,DWORD PTR [rip+0x1b6033a]        # 0x1423553c8
   1407f508e:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f5091:	41 8b d5             	mov    edx,r13d
   1407f5094:	2b d1                	sub    edx,ecx
   1407f5096:	83 c2 52             	add    edx,0x52
   1407f5099:	e8 12 44 44 00       	call   0x140c394b0
   1407f509e:	48 8d 15 f3 09 e1 00 	lea    rdx,[rip+0xe109f3]        # 0x141605a98
   1407f50a5:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f50a9:	e8 a2 30 87 ff       	call   0x140068150
   1407f50ae:	90                   	nop
   1407f50af:	45 33 c9             	xor    r9d,r9d
   1407f50b2:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f50b6:	48 8d 0d 33 53 e5 01 	lea    rcx,[rip+0x1e55333]        # 0x14264a3f0
   1407f50bd:	e8 9e 48 2e 00       	call   0x140ad9960
   1407f50c2:	90                   	nop
   1407f50c3:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f50c7:	e8 84 a7 87 ff       	call   0x14006f850
   1407f50cc:	44 0f b7 0d fc 71 0a 	movzx  r9d,WORD PTR [rip+0x10a71fc]        # 0x14189c2d0
   1407f50d3:	01 
   1407f50d4:	44 0f b7 05 f0 71 0a 	movzx  r8d,WORD PTR [rip+0x10a71f0]        # 0x14189c2cc
   1407f50db:	01 
   1407f50dc:	0f b7 15 e5 71 0a 01 	movzx  edx,WORD PTR [rip+0x10a71e5]        # 0x14189c2c8
   1407f50e3:	48 8d 0d 06 c4 bd 01 	lea    rcx,[rip+0x1bdc406]        # 0x1423d14f0
   1407f50ea:	e8 51 8b 88 ff       	call   0x14007dc40
   1407f50ef:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f50f3:	0f ba e0 0f          	bt     eax,0xf
   1407f50f7:	72 23                	jb     0x1407f511c
   1407f50f9:	48 8d 15 70 52 e4 00 	lea    rdx,[rip+0xe45270]        # 0x14163a370
   1407f5100:	e8 4b 30 87 ff       	call   0x140068150
   1407f5105:	90                   	nop
   1407f5106:	45 33 c9             	xor    r9d,r9d
   1407f5109:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f510d:	48 8d 0d dc 52 e5 01 	lea    rcx,[rip+0x1e552dc]        # 0x14264a3f0
   1407f5114:	e8 47 48 2e 00       	call   0x140ad9960
   1407f5119:	90                   	nop
   1407f511a:	eb 21                	jmp    0x1407f513d
   1407f511c:	48 8d 15 45 52 e4 00 	lea    rdx,[rip+0xe45245]        # 0x14163a368
   1407f5123:	e8 28 30 87 ff       	call   0x140068150
   1407f5128:	90                   	nop
   1407f5129:	45 33 c9             	xor    r9d,r9d
   1407f512c:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f5130:	48 8d 0d b9 52 e5 01 	lea    rcx,[rip+0x1e552b9]        # 0x14264a3f0
   1407f5137:	e8 24 48 2e 00       	call   0x140ad9960
   1407f513c:	90                   	nop
   1407f513d:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f5141:	e8 0a a7 87 ff       	call   0x14006f850
   1407f5146:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f514a:	e8 41 a5 87 ff       	call   0x14006f690
   1407f514f:	90                   	nop
   1407f5150:	48 8b 05 c9 6a ea 01 	mov    rax,QWORD PTR [rip+0x1ea6ac9]        # 0x14269bc20
   1407f5157:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f515b:	0f bf 49 08          	movsx  ecx,WORD PTR [rcx+0x8]
   1407f515f:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f5163:	e8 48 71 d3 ff       	call   0x14052c2b0
   1407f5168:	45 33 c9             	xor    r9d,r9d
   1407f516b:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f516f:	48 8d 0d 7a 52 e5 01 	lea    rcx,[rip+0x1e5527a]        # 0x14264a3f0
   1407f5176:	e8 e5 47 2e 00       	call   0x140ad9960
   1407f517b:	48 8d 15 fe 51 e4 00 	lea    rdx,[rip+0xe451fe]        # 0x14163a380
   1407f5182:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f5186:	e8 c5 2f 87 ff       	call   0x140068150
   1407f518b:	90                   	nop
   1407f518c:	45 33 c9             	xor    r9d,r9d
   1407f518f:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f5193:	48 8d 0d 56 52 e5 01 	lea    rcx,[rip+0x1e55256]        # 0x14264a3f0
   1407f519a:	e8 c1 47 2e 00       	call   0x140ad9960
   1407f519f:	90                   	nop
   1407f51a0:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f51a4:	e8 a7 a6 87 ff       	call   0x14006f850
   1407f51a9:	90                   	nop
   1407f51aa:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f51ae:	e9 f5 01 00 00       	jmp    0x1407f53a8
   1407f51b3:	83 7a 04 ff          	cmp    DWORD PTR [rdx+0x4],0xffffffff
   1407f51b7:	74 0c                	je     0x1407f51c5
   1407f51b9:	c7 05 b9 52 e5 01 02 	mov    DWORD PTR [rip+0x1e552b9],0x1000002        # 0x14264a47c
   1407f51c0:	00 00 01 
   1407f51c3:	eb 1f                	jmp    0x1407f51e4
   1407f51c5:	66 44 89 74 24 20    	mov    WORD PTR [rsp+0x20],r14w
   1407f51cb:	44 0f b7 4a 14       	movzx  r9d,WORD PTR [rdx+0x14]
   1407f51d0:	44 8b 42 10          	mov    r8d,DWORD PTR [rdx+0x10]
   1407f51d4:	0f b7 52 0c          	movzx  edx,WORD PTR [rdx+0xc]
   1407f51d8:	48 8d 0d 11 c3 bd 01 	lea    rcx,[rip+0x1bdc311]        # 0x1423d14f0
   1407f51df:	e8 0c cd cd 00       	call   0x1414d1ef0
   1407f51e4:	44 89 35 89 52 e5 01 	mov    DWORD PTR [rip+0x1e55289],r14d        # 0x14264a474
   1407f51eb:	89 3d 87 52 e5 01    	mov    DWORD PTR [rip+0x1e55287],edi        # 0x14264a478
   1407f51f1:	ff c7                	inc    edi
   1407f51f3:	89 7c 24 74          	mov    DWORD PTR [rsp+0x74],edi
   1407f51f7:	8b 05 cb 01 b6 01    	mov    eax,DWORD PTR [rip+0x1b601cb]        # 0x1423553c8
   1407f51fd:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f5200:	41 8b d5             	mov    edx,r13d
   1407f5203:	2b d1                	sub    edx,ecx
   1407f5205:	83 c2 52             	add    edx,0x52
   1407f5208:	e8 a3 42 44 00       	call   0x140c394b0
   1407f520d:	48 8d 15 84 08 e1 00 	lea    rdx,[rip+0xe10884]        # 0x141605a98
   1407f5214:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f5218:	e8 33 2f 87 ff       	call   0x140068150
   1407f521d:	90                   	nop
   1407f521e:	45 33 c9             	xor    r9d,r9d
   1407f5221:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f5225:	48 8d 0d c4 51 e5 01 	lea    rcx,[rip+0x1e551c4]        # 0x14264a3f0
   1407f522c:	e8 2f 47 2e 00       	call   0x140ad9960
   1407f5231:	90                   	nop
   1407f5232:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f5236:	e8 15 a6 87 ff       	call   0x14006f850
   1407f523b:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f523f:	e8 4c a4 87 ff       	call   0x14006f690
   1407f5244:	90                   	nop
   1407f5245:	48 8b 05 d4 69 ea 01 	mov    rax,QWORD PTR [rip+0x1ea69d4]        # 0x14269bc20
   1407f524c:	4e 8b 04 e0          	mov    r8,QWORD PTR [rax+r12*8]
   1407f5250:	41 8b 50 04          	mov    edx,DWORD PTR [r8+0x4]
   1407f5254:	83 fa ff             	cmp    edx,0xffffffff
   1407f5257:	74 58                	je     0x1407f52b1
   1407f5259:	41 8b 40 10          	mov    eax,DWORD PTR [r8+0x10]
   1407f525d:	44 89 74 24 68       	mov    DWORD PTR [rsp+0x68],r14d
   1407f5262:	44 89 74 24 60       	mov    DWORD PTR [rsp+0x60],r14d
   1407f5267:	c6 44 24 58 00       	mov    BYTE PTR [rsp+0x58],0x0
   1407f526c:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   1407f5271:	89 4c 24 50          	mov    DWORD PTR [rsp+0x50],ecx
   1407f5275:	89 4c 24 48          	mov    DWORD PTR [rsp+0x48],ecx
   1407f5279:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   1407f527e:	c6 44 24 38 00       	mov    BYTE PTR [rsp+0x38],0x0
   1407f5283:	44 89 74 24 30       	mov    DWORD PTR [rsp+0x30],r14d
   1407f5288:	89 4c 24 28          	mov    DWORD PTR [rsp+0x28],ecx
   1407f528c:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   1407f5290:	45 0f b7 48 0c       	movzx  r9d,WORD PTR [r8+0xc]
   1407f5295:	45 0f b7 40 08       	movzx  r8d,WORD PTR [r8+0x8]
   1407f529a:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f529e:	e8 6d d9 28 00       	call   0x140a82c10
   1407f52a3:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f52a7:	e8 a4 83 d3 ff       	call   0x14052d650
   1407f52ac:	e9 df 00 00 00       	jmp    0x1407f5390
   1407f52b1:	41 0f bf 48 18       	movsx  ecx,WORD PTR [r8+0x18]
   1407f52b6:	41 8b 50 14          	mov    edx,DWORD PTR [r8+0x14]
   1407f52ba:	85 d2                	test   edx,edx
   1407f52bc:	74 49                	je     0x1407f5307
   1407f52be:	83 fa 01             	cmp    edx,0x1
   1407f52c1:	74 1a                	je     0x1407f52dd
   1407f52c3:	83 e9 01             	sub    ecx,0x1
   1407f52c6:	74 0c                	je     0x1407f52d4
   1407f52c8:	83 e9 01             	sub    ecx,0x1
   1407f52cb:	74 52                	je     0x1407f531f
   1407f52cd:	83 f9 01             	cmp    ecx,0x1
   1407f52d0:	74 44                	je     0x1407f5316
   1407f52d2:	eb 64                	jmp    0x1407f5338
   1407f52d4:	48 8d 15 25 51 e4 00 	lea    rdx,[rip+0xe45125]        # 0x14163a400
   1407f52db:	eb 52                	jmp    0x1407f532f
   1407f52dd:	83 e9 01             	sub    ecx,0x1
   1407f52e0:	74 1c                	je     0x1407f52fe
   1407f52e2:	83 e9 01             	sub    ecx,0x1
   1407f52e5:	74 0e                	je     0x1407f52f5
   1407f52e7:	83 f9 01             	cmp    ecx,0x1
   1407f52ea:	75 4c                	jne    0x1407f5338
   1407f52ec:	48 8d 15 fd 50 e4 00 	lea    rdx,[rip+0xe450fd]        # 0x14163a3f0
   1407f52f3:	eb 3a                	jmp    0x1407f532f
   1407f52f5:	48 8d 15 64 4d e4 00 	lea    rdx,[rip+0xe44d64]        # 0x14163a060
   1407f52fc:	eb 31                	jmp    0x1407f532f
   1407f52fe:	48 8d 15 43 4d e4 00 	lea    rdx,[rip+0xe44d43]        # 0x14163a048
   1407f5305:	eb 28                	jmp    0x1407f532f
   1407f5307:	83 e9 01             	sub    ecx,0x1
   1407f530a:	74 1c                	je     0x1407f5328
   1407f530c:	83 e9 01             	sub    ecx,0x1
   1407f530f:	74 0e                	je     0x1407f531f
   1407f5311:	83 f9 01             	cmp    ecx,0x1
   1407f5314:	75 22                	jne    0x1407f5338
   1407f5316:	48 8d 15 c3 50 e4 00 	lea    rdx,[rip+0xe450c3]        # 0x14163a3e0
   1407f531d:	eb 10                	jmp    0x1407f532f
   1407f531f:	48 8d 15 a2 50 e4 00 	lea    rdx,[rip+0xe450a2]        # 0x14163a3c8
   1407f5326:	eb 07                	jmp    0x1407f532f
   1407f5328:	48 8d 15 91 97 eb 00 	lea    rdx,[rip+0xeb9791]        # 0x1416aeac0
   1407f532f:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f5333:	e8 48 a2 87 ff       	call   0x14006f580
   1407f5338:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f533c:	e8 4f a3 87 ff       	call   0x14006f690
   1407f5341:	90                   	nop
   1407f5342:	48 8b 05 d7 68 ea 01 	mov    rax,QWORD PTR [rip+0x1ea68d7]        # 0x14269bc20
   1407f5349:	4a 8b 0c e0          	mov    rcx,QWORD PTR [rax+r12*8]
   1407f534d:	0f b7 41 14          	movzx  eax,WORD PTR [rcx+0x14]
   1407f5351:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   1407f5356:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   1407f535b:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f5360:	44 8b 49 10          	mov    r9d,DWORD PTR [rcx+0x10]
   1407f5364:	44 0f b7 41 0c       	movzx  r8d,WORD PTR [rcx+0xc]
   1407f5369:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f536d:	48 8d 0d 7c c1 bd 01 	lea    rcx,[rip+0x1bdc17c]        # 0x1423d14f0
   1407f5374:	e8 a7 c5 cd 00       	call   0x1414d1920
   1407f5379:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f537d:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f5381:	e8 8a 49 8c ff       	call   0x1400b9d10
   1407f5386:	90                   	nop
   1407f5387:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f538b:	e8 c0 a4 87 ff       	call   0x14006f850
   1407f5390:	45 33 c9             	xor    r9d,r9d
   1407f5393:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f5397:	48 8d 0d 52 50 e5 01 	lea    rcx,[rip+0x1e55052]        # 0x14264a3f0
   1407f539e:	e8 bd 45 2e 00       	call   0x140ad9960
   1407f53a3:	90                   	nop
   1407f53a4:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f53a8:	e8 a3 a4 87 ff       	call   0x14006f850
   1407f53ad:	41 ff c5             	inc    r13d
   1407f53b0:	44 89 6d 88          	mov    DWORD PTR [rbp-0x78],r13d
   1407f53b4:	49 ff c4             	inc    r12
   1407f53b7:	4c 89 65 90          	mov    QWORD PTR [rbp-0x70],r12
   1407f53bb:	8b 05 07 00 b6 01    	mov    eax,DWORD PTR [rip+0x1b60007]        # 0x1423553c8
   1407f53c1:	ff c0                	inc    eax
   1407f53c3:	8d 0c 80             	lea    ecx,[rax+rax*4]
   1407f53c6:	44 3b e9             	cmp    r13d,ecx
   1407f53c9:	8b 7c 24 74          	mov    edi,DWORD PTR [rsp+0x74]
   1407f53cd:	bb 03 00 00 00       	mov    ebx,0x3
   1407f53d2:	0f 8c e8 ec ff ff    	jl     0x1407f40c0
   1407f53d8:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f53dc:	e8 6f a4 87 ff       	call   0x14006f850
   1407f53e1:	e9 db 16 00 00       	jmp    0x1407f6ac1
   1407f53e6:	66 83 e8 1b          	sub    ax,0x1b
   1407f53ea:	b9 fb ff 00 00       	mov    ecx,0xfffb
   1407f53ef:	66 85 c1             	test   cx,ax
   1407f53f2:	0f 84 3c 0a 00 00    	je     0x1407f5e34
   1407f53f8:	44 8b 05 cd 7a 0b 01 	mov    r8d,DWORD PTR [rip+0x10b7acd]        # 0x1418acecc
   1407f53ff:	8b 05 cb 7a 0b 01    	mov    eax,DWORD PTR [rip+0x10b7acb]        # 0x1418aced0
   1407f5405:	45 3b c4             	cmp    r8d,r12d
   1407f5408:	75 1f                	jne    0x1407f5429
   1407f540a:	41 3b c4             	cmp    eax,r12d
   1407f540d:	74 1a                	je     0x1407f5429
   1407f540f:	41 8b c4             	mov    eax,r12d
   1407f5412:	89 05 b8 7a 0b 01    	mov    DWORD PTR [rip+0x10b7ab8],eax        # 0x1418aced0
   1407f5418:	ba 02 00 00 00       	mov    edx,0x2
   1407f541d:	48 8d 0d cc 4f e5 01 	lea    rcx,[rip+0x1e54fcc]        # 0x14264a3f0
   1407f5424:	e8 d7 27 2f 00       	call   0x140ae7c00
   1407f5429:	45 8b fc             	mov    r15d,r12d
   1407f542c:	44 89 64 24 74       	mov    DWORD PTR [rsp+0x74],r12d
   1407f5431:	41 8b dc             	mov    ebx,r12d
   1407f5434:	41 8b fc             	mov    edi,r12d
   1407f5437:	45 3b c4             	cmp    r8d,r12d
   1407f543a:	0f 84 47 05 00 00    	je     0x1407f5987
   1407f5440:	41 3b c0             	cmp    eax,r8d
   1407f5443:	0f 84 ee 03 00 00    	je     0x1407f5837
   1407f5449:	48 8d 0d 88 7a 0b 01 	lea    rcx,[rip+0x10b7a88]        # 0x1418aced8
   1407f5450:	e8 5b 65 8c ff       	call   0x1400bb9b0
   1407f5455:	8b 15 71 7a 0b 01    	mov    edx,DWORD PTR [rip+0x10b7a71]        # 0x1418acecc
   1407f545b:	89 15 6f 7a 0b 01    	mov    DWORD PTR [rip+0x10b7a6f],edx        # 0x1418aced0
   1407f5461:	c7 05 85 7a 0b 01 1e 	mov    DWORD PTR [rip+0x10b7a85],0x1e        # 0x1418acef0
   1407f5468:	00 00 00 
   1407f546b:	48 8b 0d e6 66 cf 01 	mov    rcx,QWORD PTR [rip+0x1cf66e6]        # 0x1424ebb58
   1407f5472:	e8 a9 86 88 ff       	call   0x14007db20
   1407f5477:	4c 8b f8             	mov    r15,rax
   1407f547a:	48 85 c0             	test   rax,rax
   1407f547d:	0f 84 b4 03 00 00    	je     0x1407f5837
   1407f5483:	4c 39 35 86 fc be 01 	cmp    QWORD PTR [rip+0x1befc86],r14        # 0x1423e5110
   1407f548a:	0f 84 a7 03 00 00    	je     0x1407f5837
   1407f5490:	48 8d 15 25 85 df 00 	lea    rdx,[rip+0xdf8525]        # 0x1415ed9bc
   1407f5497:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f549b:	e8 b0 2c 87 ff       	call   0x140068150
   1407f54a0:	90                   	nop
   1407f54a1:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f54a5:	e8 e6 a1 87 ff       	call   0x14006f690
   1407f54aa:	90                   	nop
   1407f54ab:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f54af:	49 8b cf             	mov    rcx,r15
   1407f54b2:	e8 59 69 8d 00       	call   0x1410cbe10
   1407f54b7:	48 83 7d 00 00       	cmp    QWORD PTR [rbp+0x0],0x0
   1407f54bc:	74 1d                	je     0x1407f54db
   1407f54be:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f54c2:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f54c6:	e8 45 48 8c ff       	call   0x1400b9d10
   1407f54cb:	48 8d 15 6a 32 df 00 	lea    rdx,[rip+0xdf326a]        # 0x1415e873c
   1407f54d2:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f54d6:	e8 85 a0 87 ff       	call   0x14006f560
   1407f54db:	66 41 83 bf 80 00 00 	cmp    WORD PTR [r15+0x80],0xa
   1407f54e2:	00 0a 
   1407f54e4:	74 66                	je     0x1407f554c
   1407f54e6:	49 8b cf             	mov    rcx,r15
   1407f54e9:	e8 d2 d0 88 00       	call   0x1410825c0
   1407f54ee:	48 8b d8             	mov    rbx,rax
   1407f54f1:	48 85 c0             	test   rax,rax
   1407f54f4:	74 10                	je     0x1407f5506
   1407f54f6:	8b 88 9c 00 00 00    	mov    ecx,DWORD PTR [rax+0x9c]
   1407f54fc:	c1 e9 0a             	shr    ecx,0xa
   1407f54ff:	f7 d1                	not    ecx
   1407f5501:	83 e1 01             	and    ecx,0x1
   1407f5504:	eb 03                	jmp    0x1407f5509
   1407f5506:	41 8b ce             	mov    ecx,r14d
   1407f5509:	85 c9                	test   ecx,ecx
   1407f550b:	74 3f                	je     0x1407f554c
   1407f550d:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f5511:	e8 7a a1 87 ff       	call   0x14006f690
   1407f5516:	90                   	nop
   1407f5517:	45 8b c4             	mov    r8d,r12d
   1407f551a:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f551e:	0f b7 8b 98 00 00 00 	movzx  ecx,WORD PTR [rbx+0x98]
   1407f5525:	e8 46 e2 2a 00       	call   0x140aa3770
   1407f552a:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f552e:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f5532:	e8 d9 47 8c ff       	call   0x1400b9d10
   1407f5537:	b2 20                	mov    dl,0x20
   1407f5539:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f553d:	e8 3e 46 8c ff       	call   0x1400b9b80
   1407f5542:	90                   	nop
   1407f5543:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f5547:	e8 04 a3 87 ff       	call   0x14006f850
   1407f554c:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f5550:	49 8b cf             	mov    rcx,r15
   1407f5553:	e8 f8 68 8d 00       	call   0x1410cbe50
   1407f5558:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f555c:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f5560:	e8 ab 47 8c ff       	call   0x1400b9d10
   1407f5565:	41 80 7f 72 00       	cmp    BYTE PTR [r15+0x72],0x0
   1407f556a:	74 43                	je     0x1407f55af
   1407f556c:	48 8d 15 a5 5f df 00 	lea    rdx,[rip+0xdf5fa5]        # 0x1415eb518
   1407f5573:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f5577:	e8 e4 9f 87 ff       	call   0x14006f560
   1407f557c:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f5580:	e8 0b a1 87 ff       	call   0x14006f690
   1407f5585:	90                   	nop
   1407f5586:	45 33 c9             	xor    r9d,r9d
   1407f5589:	41 b0 01             	mov    r8b,0x1
   1407f558c:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f5590:	49 8b cf             	mov    rcx,r15
   1407f5593:	e8 48 f1 29 00       	call   0x140a946e0
   1407f5598:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f559c:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f55a0:	e8 6b 47 8c ff       	call   0x1400b9d10
   1407f55a5:	90                   	nop
   1407f55a6:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f55aa:	e8 a1 a2 87 ff       	call   0x14006f850
   1407f55af:	66 41 83 bf 80 00 00 	cmp    WORD PTR [r15+0x80],0x3
   1407f55b6:	00 03 
   1407f55b8:	75 11                	jne    0x1407f55cb
   1407f55ba:	41 83 bf 4c 03 00 00 	cmp    DWORD PTR [r15+0x34c],0x0
   1407f55c1:	00 
   1407f55c2:	48 8d 15 df 80 e0 00 	lea    rdx,[rip+0xe080df]        # 0x1415fd6a8
   1407f55c9:	74 07                	je     0x1407f55d2
   1407f55cb:	48 8d 15 12 1c e0 00 	lea    rdx,[rip+0xe01c12]        # 0x1415f71e4
   1407f55d2:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f55d6:	e8 85 9f 87 ff       	call   0x14006f560
   1407f55db:	4c 8d 4c 24 7c       	lea    r9,[rsp+0x7c]
   1407f55e0:	4c 8d 44 24 78       	lea    r8,[rsp+0x78]
   1407f55e5:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   1407f55ea:	48 8b 0d 1f fb be 01 	mov    rcx,QWORD PTR [rip+0x1befb1f]        # 0x1423e5110
   1407f55f1:	e8 3a 1e b7 00       	call   0x141367430
   1407f55f6:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   1407f55fb:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1407f5600:	44 0f b7 4c 24 7c    	movzx  r9d,WORD PTR [rsp+0x7c]
   1407f5606:	44 0f b7 44 24 78    	movzx  r8d,WORD PTR [rsp+0x78]
   1407f560c:	0f b7 54 24 70       	movzx  edx,WORD PTR [rsp+0x70]
   1407f5611:	48 8d 0d d8 be bd 01 	lea    rcx,[rip+0x1bdbed8]        # 0x1423d14f0
   1407f5618:	e8 e3 4e cb 00       	call   0x1414aa500
   1407f561d:	4c 8b e8             	mov    r13,rax
   1407f5620:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1407f5625:	44 0f b7 4c 24 7c    	movzx  r9d,WORD PTR [rsp+0x7c]
   1407f562b:	44 0f b7 44 24 78    	movzx  r8d,WORD PTR [rsp+0x78]
   1407f5631:	0f b7 54 24 70       	movzx  edx,WORD PTR [rsp+0x70]
   1407f5636:	48 8d 0d b3 be bd 01 	lea    rcx,[rip+0x1bdbeb3]        # 0x1423d14f0
   1407f563d:	e8 ce 4c cb 00       	call   0x1414aa310
   1407f5642:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   1407f5646:	0f bf 5c 24 78       	movsx  ebx,WORD PTR [rsp+0x78]
   1407f564b:	44 8b c3             	mov    r8d,ebx
   1407f564e:	0f bf 74 24 70       	movsx  esi,WORD PTR [rsp+0x70]
   1407f5653:	8b d6                	mov    edx,esi
   1407f5655:	49 8b cf             	mov    rcx,r15
   1407f5658:	e8 c3 db 88 00       	call   0x141083220
   1407f565d:	4c 63 e0             	movsxd r12,eax
   1407f5660:	4d 85 ed             	test   r13,r13
   1407f5663:	74 62                	je     0x1407f56c7
   1407f5665:	48 8b 0d a4 fa be 01 	mov    rcx,QWORD PTR [rip+0x1befaa4]        # 0x1423e5110
   1407f566c:	e8 ef ff ba 00       	call   0x1413a5660
   1407f5671:	49 8b 95 10 03 00 00 	mov    rdx,QWORD PTR [r13+0x310]
   1407f5678:	48 85 d2             	test   rdx,rdx
   1407f567b:	74 09                	je     0x1407f5686
   1407f567d:	81 7a 20 c0 bd f0 ff 	cmp    DWORD PTR [rdx+0x20],0xfff0bdc0
   1407f5684:	75 37                	jne    0x1407f56bd
   1407f5686:	4d 3b fd             	cmp    r15,r13
   1407f5689:	75 32                	jne    0x1407f56bd
   1407f568b:	44 0f b7 4c 24 7c    	movzx  r9d,WORD PTR [rsp+0x7c]
   1407f5691:	0f b7 5c 24 78       	movzx  ebx,WORD PTR [rsp+0x78]
   1407f5696:	44 0f b7 c3          	movzx  r8d,bx
   1407f569a:	0f b7 74 24 70       	movzx  esi,WORD PTR [rsp+0x70]
   1407f569f:	0f b7 d6             	movzx  edx,si
   1407f56a2:	48 8d 0d 47 be bd 01 	lea    rcx,[rip+0x1bdbe47]        # 0x1423d14f0
   1407f56a9:	e8 92 85 88 ff       	call   0x14007dc40
   1407f56ae:	0f ba e0 08          	bt     eax,0x8
   1407f56b2:	72 19                	jb     0x1407f56cd
   1407f56b4:	48 83 7d 90 00       	cmp    QWORD PTR [rbp-0x70],0x0
   1407f56b9:	75 12                	jne    0x1407f56cd
   1407f56bb:	eb 0a                	jmp    0x1407f56c7
   1407f56bd:	0f b7 5c 24 78       	movzx  ebx,WORD PTR [rsp+0x78]
   1407f56c2:	0f b7 74 24 70       	movzx  esi,WORD PTR [rsp+0x70]
   1407f56c7:	41 83 fc ff          	cmp    r12d,0xffffffff
   1407f56cb:	75 0c                	jne    0x1407f56d9
   1407f56cd:	48 8d 15 f0 15 e5 00 	lea    rdx,[rip+0xe515f0]        # 0x141646cc4
   1407f56d4:	e9 1a 01 00 00       	jmp    0x1407f57f3
   1407f56d9:	44 0f bf c3          	movsx  r8d,bx
   1407f56dd:	0f bf d6             	movsx  edx,si
   1407f56e0:	49 8b cf             	mov    rcx,r15
   1407f56e3:	e8 38 da 88 00       	call   0x141083120
   1407f56e8:	83 f8 64             	cmp    eax,0x64
   1407f56eb:	7e 09                	jle    0x1407f56f6
   1407f56ed:	48 8d 15 c8 68 e5 00 	lea    rdx,[rip+0xe568c8]        # 0x14164bfbc
   1407f56f4:	eb 35                	jmp    0x1407f572b
   1407f56f6:	83 f8 40             	cmp    eax,0x40
   1407f56f9:	7c 09                	jl     0x1407f5704
   1407f56fb:	48 8d 15 16 93 eb 00 	lea    rdx,[rip+0xeb9316]        # 0x1416aea18
   1407f5702:	eb 27                	jmp    0x1407f572b
   1407f5704:	83 f8 24             	cmp    eax,0x24
   1407f5707:	7c 09                	jl     0x1407f5712
   1407f5709:	48 8d 15 f0 92 eb 00 	lea    rdx,[rip+0xeb92f0]        # 0x1416aea00
   1407f5710:	eb 19                	jmp    0x1407f572b
   1407f5712:	83 f8 09             	cmp    eax,0x9
   1407f5715:	7c 09                	jl     0x1407f5720
   1407f5717:	48 8d 15 32 90 eb 00 	lea    rdx,[rip+0xeb9032]        # 0x1416ae750
   1407f571e:	eb 0b                	jmp    0x1407f572b
   1407f5720:	85 c0                	test   eax,eax
   1407f5722:	78 10                	js     0x1407f5734
   1407f5724:	48 8d 15 15 90 eb 00 	lea    rdx,[rip+0xeb9015]        # 0x1416ae740
   1407f572b:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f572f:	e8 2c 9e 87 ff       	call   0x14006f560
   1407f5734:	48 8d 15 a5 e0 e7 00 	lea    rdx,[rip+0xe7e0a5]        # 0x1416737e0
   1407f573b:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f573f:	e8 1c 9e 87 ff       	call   0x14006f560
   1407f5744:	41 83 fc 0f          	cmp    r12d,0xf
   1407f5748:	0f 87 ae 00 00 00    	ja     0x1407f57fc
   1407f574e:	48 8d 15 ab a8 80 ff 	lea    rdx,[rip+0xffffffffff80a8ab]        # 0x140000000
   1407f5755:	42 8b 84 a2 a0 6b 7f 	mov    eax,DWORD PTR [rdx+r12*4+0x7f6ba0]
   1407f575c:	00 
   1407f575d:	48 03 c2             	add    rax,rdx
   1407f5760:	ff e0                	jmp    rax
   1407f5762:	48 8d 15 93 61 e4 00 	lea    rdx,[rip+0xe46193]        # 0x14163b8fc
   1407f5769:	e9 85 00 00 00       	jmp    0x1407f57f3
   1407f576e:	48 8d 15 03 90 eb 00 	lea    rdx,[rip+0xeb9003]        # 0x1416ae778
   1407f5775:	eb 7c                	jmp    0x1407f57f3
   1407f5777:	48 8d 15 7a 14 e5 00 	lea    rdx,[rip+0xe5147a]        # 0x141646bf8
   1407f577e:	eb 73                	jmp    0x1407f57f3
   1407f5780:	48 8d 15 e1 8f eb 00 	lea    rdx,[rip+0xeb8fe1]        # 0x1416ae768
   1407f5787:	eb 6a                	jmp    0x1407f57f3
   1407f5789:	48 8d 15 64 61 e4 00 	lea    rdx,[rip+0xe46164]        # 0x14163b8f4
   1407f5790:	eb 61                	jmp    0x1407f57f3
   1407f5792:	48 8d 15 77 8f eb 00 	lea    rdx,[rip+0xeb8f77]        # 0x1416ae710
   1407f5799:	eb 58                	jmp    0x1407f57f3
   1407f579b:	48 8d 15 e6 13 e5 00 	lea    rdx,[rip+0xe513e6]        # 0x141646b88
   1407f57a2:	eb 4f                	jmp    0x1407f57f3
   1407f57a4:	48 8d 15 55 8f eb 00 	lea    rdx,[rip+0xeb8f55]        # 0x1416ae700
   1407f57ab:	eb 46                	jmp    0x1407f57f3
   1407f57ad:	48 8d 15 38 61 e4 00 	lea    rdx,[rip+0xe46138]        # 0x14163b8ec
   1407f57b4:	eb 3d                	jmp    0x1407f57f3
   1407f57b6:	48 8d 15 73 8f eb 00 	lea    rdx,[rip+0xeb8f73]        # 0x1416ae730
   1407f57bd:	eb 34                	jmp    0x1407f57f3
   1407f57bf:	48 8d 15 b2 13 e5 00 	lea    rdx,[rip+0xe513b2]        # 0x141646b78
   1407f57c6:	eb 2b                	jmp    0x1407f57f3
   1407f57c8:	48 8d 15 51 8f eb 00 	lea    rdx,[rip+0xeb8f51]        # 0x1416ae720
   1407f57cf:	eb 22                	jmp    0x1407f57f3
   1407f57d1:	48 8d 15 5c 60 e4 00 	lea    rdx,[rip+0xe4605c]        # 0x14163b834
   1407f57d8:	eb 19                	jmp    0x1407f57f3
   1407f57da:	48 8d 15 c7 90 eb 00 	lea    rdx,[rip+0xeb90c7]        # 0x1416ae8a8
   1407f57e1:	eb 10                	jmp    0x1407f57f3
   1407f57e3:	48 8d 15 fe 13 e5 00 	lea    rdx,[rip+0xe513fe]        # 0x141646be8
   1407f57ea:	eb 07                	jmp    0x1407f57f3
   1407f57ec:	48 8d 15 a5 90 eb 00 	lea    rdx,[rip+0xeb90a5]        # 0x1416ae898
   1407f57f3:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f57f7:	e8 64 9d 87 ff       	call   0x14006f560
   1407f57fc:	48 8d 15 b1 2d df 00 	lea    rdx,[rip+0xdf2db1]        # 0x1415e85b4
   1407f5803:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f5807:	e8 54 9d 87 ff       	call   0x14006f560
   1407f580c:	44 8b 05 dd 76 0b 01 	mov    r8d,DWORD PTR [rip+0x10b76dd]        # 0x1418acef0
   1407f5813:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f5817:	48 8d 0d ba 76 0b 01 	lea    rcx,[rip+0x10b76ba]        # 0x1418aced8
   1407f581e:	e8 ed 1a 0f 00       	call   0x1408e7310
   1407f5823:	90                   	nop
   1407f5824:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f5828:	e8 23 a0 87 ff       	call   0x14006f850
   1407f582d:	90                   	nop
   1407f582e:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f5832:	e8 19 a0 87 ff       	call   0x14006f850
   1407f5837:	48 8b 3d a2 76 0b 01 	mov    rdi,QWORD PTR [rip+0x10b76a2]        # 0x1418acee0
   1407f583e:	4c 8b ff             	mov    r15,rdi
   1407f5841:	48 8b 1d 90 76 0b 01 	mov    rbx,QWORD PTR [rip+0x10b7690]        # 0x1418aced8
   1407f5848:	4c 2b fb             	sub    r15,rbx
   1407f584b:	49 c1 ff 03          	sar    r15,0x3
   1407f584f:	4d 85 ff             	test   r15,r15
   1407f5852:	0f 84 cc 05 00 00    	je     0x1407f5e24
   1407f5858:	8b 35 92 76 0b 01    	mov    esi,DWORD PTR [rip+0x10b7692]        # 0x1418acef0
   1407f585e:	83 c6 11             	add    esi,0x11
   1407f5861:	41 83 c7 01          	add    r15d,0x1
   1407f5865:	0f 88 da 00 00 00    	js     0x1407f5945
   1407f586b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1407f5870:	bb 0d 00 00 00       	mov    ebx,0xd
   1407f5875:	3b f3                	cmp    esi,ebx
   1407f5877:	0f 8c ae 00 00 00    	jl     0x1407f592b
   1407f587d:	0f 1f 00             	nop    DWORD PTR [rax]
   1407f5880:	89 1d ee 4b e5 01    	mov    DWORD PTR [rip+0x1e54bee],ebx        # 0x14264a474
   1407f5886:	44 89 35 eb 4b e5 01 	mov    DWORD PTR [rip+0x1e54beb],r14d        # 0x14264a478
   1407f588d:	45 33 c0             	xor    r8d,r8d
   1407f5890:	33 d2                	xor    edx,edx
   1407f5892:	48 8d 0d 57 4b e5 01 	lea    rcx,[rip+0x1e54b57]        # 0x14264a3f0
   1407f5899:	e8 f2 58 8c ff       	call   0x1400bb190
   1407f589e:	45 85 f6             	test   r14d,r14d
   1407f58a1:	75 28                	jne    0x1407f58cb
   1407f58a3:	83 fb 0d             	cmp    ebx,0xd
   1407f58a6:	75 08                	jne    0x1407f58b0
   1407f58a8:	8b 15 66 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e56466]        # 0x14264bd14
   1407f58ae:	eb 65                	jmp    0x1407f5915
   1407f58b0:	48 8d 0d 39 4b e5 01 	lea    rcx,[rip+0x1e54b39]        # 0x14264a3f0
   1407f58b7:	3b de                	cmp    ebx,esi
   1407f58b9:	75 08                	jne    0x1407f58c3
   1407f58bb:	8b 15 6b 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e5646b]        # 0x14264bd2c
   1407f58c1:	eb 59                	jmp    0x1407f591c
   1407f58c3:	8b 15 57 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e56457]        # 0x14264bd20
   1407f58c9:	eb 51                	jmp    0x1407f591c
   1407f58cb:	45 3b f7             	cmp    r14d,r15d
   1407f58ce:	75 28                	jne    0x1407f58f8
   1407f58d0:	83 fb 0d             	cmp    ebx,0xd
   1407f58d3:	75 08                	jne    0x1407f58dd
   1407f58d5:	8b 15 41 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e56441]        # 0x14264bd1c
   1407f58db:	eb 38                	jmp    0x1407f5915
   1407f58dd:	48 8d 0d 0c 4b e5 01 	lea    rcx,[rip+0x1e54b0c]        # 0x14264a3f0
   1407f58e4:	3b de                	cmp    ebx,esi
   1407f58e6:	75 08                	jne    0x1407f58f0
   1407f58e8:	8b 15 46 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e56446]        # 0x14264bd34
   1407f58ee:	eb 2c                	jmp    0x1407f591c
   1407f58f0:	8b 15 32 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e56432]        # 0x14264bd28
   1407f58f6:	eb 24                	jmp    0x1407f591c
   1407f58f8:	83 fb 0d             	cmp    ebx,0xd
   1407f58fb:	75 08                	jne    0x1407f5905
   1407f58fd:	8b 15 15 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e56415]        # 0x14264bd18
   1407f5903:	eb 10                	jmp    0x1407f5915
   1407f5905:	3b de                	cmp    ebx,esi
   1407f5907:	8b 15 23 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e56423]        # 0x14264bd30
   1407f590d:	74 06                	je     0x1407f5915
   1407f590f:	8b 15 0f 64 e5 01    	mov    edx,DWORD PTR [rip+0x1e5640f]        # 0x14264bd24
   1407f5915:	48 8d 0d d4 4a e5 01 	lea    rcx,[rip+0x1e54ad4]        # 0x14264a3f0
   1407f591c:	e8 af 51 2e 00       	call   0x140adaad0
   1407f5921:	ff c3                	inc    ebx
   1407f5923:	3b de                	cmp    ebx,esi
   1407f5925:	0f 8e 55 ff ff ff    	jle    0x1407f5880
   1407f592b:	41 ff c6             	inc    r14d
   1407f592e:	45 3b f7             	cmp    r14d,r15d
   1407f5931:	0f 8e 39 ff ff ff    	jle    0x1407f5870
   1407f5937:	48 8b 3d a2 75 0b 01 	mov    rdi,QWORD PTR [rip+0x10b75a2]        # 0x1418acee0
   1407f593e:	48 8b 1d 93 75 0b 01 	mov    rbx,QWORD PTR [rip+0x10b7593]        # 0x1418aced8
   1407f5945:	c7 05 2d 4b e5 01 07 	mov    DWORD PTR [rip+0x1e54b2d],0x1010007        # 0x14264a47c
   1407f594c:	00 01 01 
   1407f594f:	be 01 00 00 00       	mov    esi,0x1
   1407f5954:	48 3b df             	cmp    rbx,rdi
   1407f5957:	0f 83 c7 04 00 00    	jae    0x1407f5e24
   1407f595d:	c7 05 0d 4b e5 01 0f 	mov    DWORD PTR [rip+0x1e54b0d],0xf        # 0x14264a474
   1407f5964:	00 00 00 
   1407f5967:	89 35 0b 4b e5 01    	mov    DWORD PTR [rip+0x1e54b0b],esi        # 0x14264a478
   1407f596d:	45 33 c9             	xor    r9d,r9d
   1407f5970:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   1407f5973:	48 8d 0d 76 4a e5 01 	lea    rcx,[rip+0x1e54a76]        # 0x14264a3f0
   1407f597a:	e8 e1 3f 2e 00       	call   0x140ad9960
   1407f597f:	ff c6                	inc    esi
   1407f5981:	48 83 c3 08          	add    rbx,0x8
   1407f5985:	eb cd                	jmp    0x1407f5954
   1407f5987:	39 1d 0b 3a 0b 01    	cmp    DWORD PTR [rip+0x10b3a0b],ebx        # 0x1418a9398
   1407f598d:	0f 84 5e 04 00 00    	je     0x1407f5df1
   1407f5993:	ff 15 4f f8 de 00    	call   QWORD PTR [rip+0xdef84f]        # 0x1415e51e8
   1407f5999:	44 38 35 f0 39 0b 01 	cmp    BYTE PTR [rip+0x10b39f0],r14b        # 0x1418a9390
   1407f59a0:	75 33                	jne    0x1407f59d5
   1407f59a2:	8b 15 ec 39 0b 01    	mov    edx,DWORD PTR [rip+0x10b39ec]        # 0x1418a9394
   1407f59a8:	3b d0                	cmp    edx,eax
   1407f59aa:	0f 8f 9f 00 00 00    	jg     0x1407f5a4f
   1407f59b0:	8d 8a e8 03 00 00    	lea    ecx,[rdx+0x3e8]
   1407f59b6:	3b c8                	cmp    ecx,eax
   1407f59b8:	0f 8c 91 00 00 00    	jl     0x1407f5a4f
   1407f59be:	8b c8                	mov    ecx,eax
   1407f59c0:	2b ca                	sub    ecx,edx
   1407f59c2:	81 f9 f4 01 00 00    	cmp    ecx,0x1f4
   1407f59c8:	0f 8c b2 03 00 00    	jl     0x1407f5d80
   1407f59ce:	c6 05 bb 39 0b 01 01 	mov    BYTE PTR [rip+0x10b39bb],0x1        # 0x1418a9390
   1407f59d5:	4c 63 05 bc 39 0b 01 	movsxd r8,DWORD PTR [rip+0x10b39bc]        # 0x1418a9398
   1407f59dc:	44 89 45 88          	mov    DWORD PTR [rbp-0x78],r8d
   1407f59e0:	44 8b 3d b5 39 0b 01 	mov    r15d,DWORD PTR [rip+0x10b39b5]        # 0x1418a939c
   1407f59e7:	44 89 7c 24 74       	mov    DWORD PTR [rsp+0x74],r15d
   1407f59ec:	44 8b 0d ad 39 0b 01 	mov    r9d,DWORD PTR [rip+0x10b39ad]        # 0x1418a93a0
   1407f59f3:	44 89 4d 84          	mov    DWORD PTR [rbp-0x7c],r9d
   1407f59f7:	44 8b 15 a6 39 0b 01 	mov    r10d,DWORD PTR [rip+0x10b39a6]        # 0x1418a93a4
   1407f59fe:	44 89 55 80          	mov    DWORD PTR [rbp-0x80],r10d
   1407f5a02:	c7 05 70 4a e5 01 07 	mov    DWORD PTR [rip+0x1e54a70],0x1010007        # 0x14264a47c
   1407f5a09:	00 01 01 
   1407f5a0c:	89 05 82 39 0b 01    	mov    DWORD PTR [rip+0x10b3982],eax        # 0x1418a9394
   1407f5a12:	4b 8d 0c 40          	lea    rcx,[r8+r8*2]
   1407f5a16:	48 8d 15 e3 a5 80 ff 	lea    rdx,[rip+0xffffffffff80a5e3]        # 0x140000000
   1407f5a1d:	4c 8d aa c8 93 8a 01 	lea    r13,[rdx+0x18a93c8]
   1407f5a24:	4d 8d 6c cd 00       	lea    r13,[r13+rcx*8+0x0]
   1407f5a29:	41 81 f8 83 01 00 00 	cmp    r8d,0x183
   1407f5a30:	75 4f                	jne    0x1407f5a81
   1407f5a32:	41 83 ff 0d          	cmp    r15d,0xd
   1407f5a36:	75 22                	jne    0x1407f5a5a
   1407f5a38:	41 83 f9 17          	cmp    r9d,0x17
   1407f5a3c:	75 43                	jne    0x1407f5a81
   1407f5a3e:	41 8b d2             	mov    edx,r10d
   1407f5a41:	48 8d 0d 50 18 d0 01 	lea    rcx,[rip+0x1d01850]        # 0x1424f7298
   1407f5a48:	e8 23 82 95 ff       	call   0x14014dc70
   1407f5a4d:	eb 26                	jmp    0x1407f5a75
   1407f5a4f:	89 05 3f 39 0b 01    	mov    DWORD PTR [rip+0x10b393f],eax        # 0x1418a9394
   1407f5a55:	e9 26 03 00 00       	jmp    0x1407f5d80
   1407f5a5a:	41 83 ff 05          	cmp    r15d,0x5
   1407f5a5e:	75 21                	jne    0x1407f5a81
   1407f5a60:	41 83 f9 07          	cmp    r9d,0x7
   1407f5a64:	75 1b                	jne    0x1407f5a81
   1407f5a66:	41 8b d2             	mov    edx,r10d
   1407f5a69:	48 8d 0d 28 18 d0 01 	lea    rcx,[rip+0x1d01828]        # 0x1424f7298
   1407f5a70:	e8 9b 82 95 ff       	call   0x14014dd10
   1407f5a75:	48 85 c0             	test   rax,rax
   1407f5a78:	74 07                	je     0x1407f5a81
   1407f5a7a:	4c 8d a8 a0 bc 00 00 	lea    r13,[rax+0xbca0]
   1407f5a81:	44 38 35 30 39 0b 01 	cmp    BYTE PTR [rip+0x10b3930],r14b        # 0x1418a93b8
   1407f5a88:	0f 84 fb 00 00 00    	je     0x1407f5b89
   1407f5a8e:	83 c6 e2             	add    esi,0xffffffe2
   1407f5a91:	8d 7e 1b             	lea    edi,[rsi+0x1b]
   1407f5a94:	4d 8b 65 08          	mov    r12,QWORD PTR [r13+0x8]
   1407f5a98:	4d 2b 65 00          	sub    r12,QWORD PTR [r13+0x0]
   1407f5a9c:	49 c1 fc 03          	sar    r12,0x3
   1407f5aa0:	41 ff c4             	inc    r12d
   1407f5aa3:	41 83 fc 11          	cmp    r12d,0x11
   1407f5aa7:	7e 08                	jle    0x1407f5ab1
   1407f5aa9:	41 bc 11 00 00 00    	mov    r12d,0x11
   1407f5aaf:	eb 09                	jmp    0x1407f5aba
   1407f5ab1:	45 85 e4             	test   r12d,r12d
   1407f5ab4:	0f 88 df 01 00 00    	js     0x1407f5c99
   1407f5aba:	45 8b fe             	mov    r15d,r14d
   1407f5abd:	0f 1f 00             	nop    DWORD PTR [rax]
   1407f5ac0:	8b de                	mov    ebx,esi
   1407f5ac2:	3b f7                	cmp    esi,edi
   1407f5ac4:	0f 8f ae 00 00 00    	jg     0x1407f5b78
   1407f5aca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1407f5ad0:	89 1d 9e 49 e5 01    	mov    DWORD PTR [rip+0x1e5499e],ebx        # 0x14264a474
   1407f5ad6:	44 89 3d 9b 49 e5 01 	mov    DWORD PTR [rip+0x1e5499b],r15d        # 0x14264a478
   1407f5add:	45 33 c0             	xor    r8d,r8d
   1407f5ae0:	33 d2                	xor    edx,edx
   1407f5ae2:	48 8d 0d 07 49 e5 01 	lea    rcx,[rip+0x1e54907]        # 0x14264a3f0
   1407f5ae9:	e8 a2 56 8c ff       	call   0x1400bb190
   1407f5aee:	45 85 ff             	test   r15d,r15d
   1407f5af1:	75 27                	jne    0x1407f5b1a
   1407f5af3:	3b de                	cmp    ebx,esi
   1407f5af5:	75 08                	jne    0x1407f5aff
   1407f5af7:	8b 15 17 62 e5 01    	mov    edx,DWORD PTR [rip+0x1e56217]        # 0x14264bd14
   1407f5afd:	eb 63                	jmp    0x1407f5b62
   1407f5aff:	48 8d 0d ea 48 e5 01 	lea    rcx,[rip+0x1e548ea]        # 0x14264a3f0
   1407f5b06:	3b df                	cmp    ebx,edi
   1407f5b08:	75 08                	jne    0x1407f5b12
   1407f5b0a:	8b 15 1c 62 e5 01    	mov    edx,DWORD PTR [rip+0x1e5621c]        # 0x14264bd2c
   1407f5b10:	eb 57                	jmp    0x1407f5b69
   1407f5b12:	8b 15 08 62 e5 01    	mov    edx,DWORD PTR [rip+0x1e56208]        # 0x14264bd20
   1407f5b18:	eb 4f                	jmp    0x1407f5b69
   1407f5b1a:	45 3b fc             	cmp    r15d,r12d
   1407f5b1d:	75 27                	jne    0x1407f5b46
   1407f5b1f:	3b de                	cmp    ebx,esi
   1407f5b21:	75 08                	jne    0x1407f5b2b
   1407f5b23:	8b 15 f3 61 e5 01    	mov    edx,DWORD PTR [rip+0x1e561f3]        # 0x14264bd1c
   1407f5b29:	eb 37                	jmp    0x1407f5b62
   1407f5b2b:	48 8d 0d be 48 e5 01 	lea    rcx,[rip+0x1e548be]        # 0x14264a3f0
   1407f5b32:	3b df                	cmp    ebx,edi
   1407f5b34:	75 08                	jne    0x1407f5b3e
   1407f5b36:	8b 15 f8 61 e5 01    	mov    edx,DWORD PTR [rip+0x1e561f8]        # 0x14264bd34
   1407f5b3c:	eb 2b                	jmp    0x1407f5b69
   1407f5b3e:	8b 15 e4 61 e5 01    	mov    edx,DWORD PTR [rip+0x1e561e4]        # 0x14264bd28
   1407f5b44:	eb 23                	jmp    0x1407f5b69
   1407f5b46:	3b de                	cmp    ebx,esi
   1407f5b48:	75 08                	jne    0x1407f5b52
   1407f5b4a:	8b 15 c8 61 e5 01    	mov    edx,DWORD PTR [rip+0x1e561c8]        # 0x14264bd18
   1407f5b50:	eb 10                	jmp    0x1407f5b62
   1407f5b52:	3b df                	cmp    ebx,edi
   1407f5b54:	8b 15 d6 61 e5 01    	mov    edx,DWORD PTR [rip+0x1e561d6]        # 0x14264bd30
   1407f5b5a:	74 06                	je     0x1407f5b62
   1407f5b5c:	8b 15 c2 61 e5 01    	mov    edx,DWORD PTR [rip+0x1e561c2]        # 0x14264bd24
   1407f5b62:	48 8d 0d 87 48 e5 01 	lea    rcx,[rip+0x1e54887]        # 0x14264a3f0
   1407f5b69:	e8 62 4f 2e 00       	call   0x140adaad0
   1407f5b6e:	ff c3                	inc    ebx
   1407f5b70:	3b df                	cmp    ebx,edi
   1407f5b72:	0f 8e 58 ff ff ff    	jle    0x1407f5ad0
   1407f5b78:	41 ff c7             	inc    r15d
   1407f5b7b:	45 3b fc             	cmp    r15d,r12d
   1407f5b7e:	0f 8e 3c ff ff ff    	jle    0x1407f5ac0
   1407f5b84:	e9 0b 01 00 00       	jmp    0x1407f5c94
   1407f5b89:	8b 35 2d 38 0b 01    	mov    esi,DWORD PTR [rip+0x10b382d]        # 0x1418a93bc
   1407f5b8f:	8d 7e 1b             	lea    edi,[rsi+0x1b]
   1407f5b92:	49 8b 4d 08          	mov    rcx,QWORD PTR [r13+0x8]
   1407f5b96:	49 2b 4d 00          	sub    rcx,QWORD PTR [r13+0x0]
   1407f5b9a:	48 c1 f9 03          	sar    rcx,0x3
   1407f5b9e:	44 8b 25 1b 38 0b 01 	mov    r12d,DWORD PTR [rip+0x10b381b]        # 0x1418a93c0
   1407f5ba5:	45 8b f4             	mov    r14d,r12d
   1407f5ba8:	44 2b f1             	sub    r14d,ecx
   1407f5bab:	41 ff ce             	dec    r14d
   1407f5bae:	83 3d f3 37 0b 01 00 	cmp    DWORD PTR [rip+0x10b37f3],0x0        # 0x1418a93a8
   1407f5bb5:	74 04                	je     0x1407f5bbb
   1407f5bb7:	41 83 ee 02          	sub    r14d,0x2
   1407f5bbb:	45 8b fe             	mov    r15d,r14d
   1407f5bbe:	45 3b f4             	cmp    r14d,r12d
   1407f5bc1:	0f 8f cd 00 00 00    	jg     0x1407f5c94
   1407f5bc7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1407f5bce:	00 00 
   1407f5bd0:	8b de                	mov    ebx,esi
   1407f5bd2:	3b f7                	cmp    esi,edi
   1407f5bd4:	0f 8f ae 00 00 00    	jg     0x1407f5c88
   1407f5bda:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1407f5be0:	89 1d 8e 48 e5 01    	mov    DWORD PTR [rip+0x1e5488e],ebx        # 0x14264a474
   1407f5be6:	44 89 3d 8b 48 e5 01 	mov    DWORD PTR [rip+0x1e5488b],r15d        # 0x14264a478
   1407f5bed:	45 33 c0             	xor    r8d,r8d
   1407f5bf0:	33 d2                	xor    edx,edx
   1407f5bf2:	48 8d 0d f7 47 e5 01 	lea    rcx,[rip+0x1e547f7]        # 0x14264a3f0
   1407f5bf9:	e8 92 55 8c ff       	call   0x1400bb190
   1407f5bfe:	45 3b fe             	cmp    r15d,r14d
   1407f5c01:	75 27                	jne    0x1407f5c2a
   1407f5c03:	3b de                	cmp    ebx,esi
   1407f5c05:	75 08                	jne    0x1407f5c0f
   1407f5c07:	8b 15 07 61 e5 01    	mov    edx,DWORD PTR [rip+0x1e56107]        # 0x14264bd14
   1407f5c0d:	eb 63                	jmp    0x1407f5c72
   1407f5c0f:	48 8d 0d da 47 e5 01 	lea    rcx,[rip+0x1e547da]        # 0x14264a3f0
   1407f5c16:	3b df                	cmp    ebx,edi
   1407f5c18:	75 08                	jne    0x1407f5c22
   1407f5c1a:	8b 15 0c 61 e5 01    	mov    edx,DWORD PTR [rip+0x1e5610c]        # 0x14264bd2c
   1407f5c20:	eb 57                	jmp    0x1407f5c79
   1407f5c22:	8b 15 f8 60 e5 01    	mov    edx,DWORD PTR [rip+0x1e560f8]        # 0x14264bd20
   1407f5c28:	eb 4f                	jmp    0x1407f5c79
   1407f5c2a:	45 3b fc             	cmp    r15d,r12d
   1407f5c2d:	75 27                	jne    0x1407f5c56
   1407f5c2f:	3b de                	cmp    ebx,esi
   1407f5c31:	75 08                	jne    0x1407f5c3b
   1407f5c33:	8b 15 e3 60 e5 01    	mov    edx,DWORD PTR [rip+0x1e560e3]        # 0x14264bd1c
   1407f5c39:	eb 37                	jmp    0x1407f5c72
   1407f5c3b:	48 8d 0d ae 47 e5 01 	lea    rcx,[rip+0x1e547ae]        # 0x14264a3f0
   1407f5c42:	3b df                	cmp    ebx,edi
   1407f5c44:	75 08                	jne    0x1407f5c4e
   1407f5c46:	8b 15 e8 60 e5 01    	mov    edx,DWORD PTR [rip+0x1e560e8]        # 0x14264bd34
   1407f5c4c:	eb 2b                	jmp    0x1407f5c79
   1407f5c4e:	8b 15 d4 60 e5 01    	mov    edx,DWORD PTR [rip+0x1e560d4]        # 0x14264bd28
   1407f5c54:	eb 23                	jmp    0x1407f5c79
   1407f5c56:	3b de                	cmp    ebx,esi
   1407f5c58:	75 08                	jne    0x1407f5c62
   1407f5c5a:	8b 15 b8 60 e5 01    	mov    edx,DWORD PTR [rip+0x1e560b8]        # 0x14264bd18
   1407f5c60:	eb 10                	jmp    0x1407f5c72
   1407f5c62:	3b df                	cmp    ebx,edi
   1407f5c64:	8b 15 c6 60 e5 01    	mov    edx,DWORD PTR [rip+0x1e560c6]        # 0x14264bd30
   1407f5c6a:	74 06                	je     0x1407f5c72
   1407f5c6c:	8b 15 b2 60 e5 01    	mov    edx,DWORD PTR [rip+0x1e560b2]        # 0x14264bd24
   1407f5c72:	48 8d 0d 77 47 e5 01 	lea    rcx,[rip+0x1e54777]        # 0x14264a3f0
   1407f5c79:	e8 52 4e 2e 00       	call   0x140adaad0
   1407f5c7e:	ff c3                	inc    ebx
   1407f5c80:	3b df                	cmp    ebx,edi
   1407f5c82:	0f 8e 58 ff ff ff    	jle    0x1407f5be0
   1407f5c88:	41 ff c7             	inc    r15d
   1407f5c8b:	45 3b fc             	cmp    r15d,r12d
   1407f5c8e:	0f 8e 3c ff ff ff    	jle    0x1407f5bd0
   1407f5c94:	44 8b 7c 24 74       	mov    r15d,DWORD PTR [rsp+0x74]
   1407f5c99:	c7 05 d9 47 e5 01 07 	mov    DWORD PTR [rip+0x1e547d9],0x1010007        # 0x14264a47c
   1407f5ca0:	00 01 01 
   1407f5ca3:	41 ff c6             	inc    r14d
   1407f5ca6:	49 8b 5d 00          	mov    rbx,QWORD PTR [r13+0x0]
   1407f5caa:	49 8b 7d 08          	mov    rdi,QWORD PTR [r13+0x8]
   1407f5cae:	66 90                	xchg   ax,ax
   1407f5cb0:	48 3b df             	cmp    rbx,rdi
   1407f5cb3:	73 37                	jae    0x1407f5cec
   1407f5cb5:	44 89 35 bc 47 e5 01 	mov    DWORD PTR [rip+0x1e547bc],r14d        # 0x14264a478
   1407f5cbc:	80 3d f5 36 0b 01 00 	cmp    BYTE PTR [rip+0x10b36f5],0x0        # 0x1418a93b8
   1407f5cc3:	8d 46 01             	lea    eax,[rsi+0x1]
   1407f5cc6:	75 03                	jne    0x1407f5ccb
   1407f5cc8:	8d 46 02             	lea    eax,[rsi+0x2]
   1407f5ccb:	89 05 a3 47 e5 01    	mov    DWORD PTR [rip+0x1e547a3],eax        # 0x14264a474
   1407f5cd1:	45 33 c9             	xor    r9d,r9d
   1407f5cd4:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   1407f5cd7:	48 8d 0d 12 47 e5 01 	lea    rcx,[rip+0x1e54712]        # 0x14264a3f0
   1407f5cde:	e8 7d 3c 2e 00       	call   0x140ad9960
   1407f5ce3:	41 ff c6             	inc    r14d
   1407f5ce6:	48 83 c3 08          	add    rbx,0x8
   1407f5cea:	eb c4                	jmp    0x1407f5cb0
   1407f5cec:	83 3d b5 36 0b 01 00 	cmp    DWORD PTR [rip+0x10b36b5],0x0        # 0x1418a93a8
   1407f5cf3:	0f 84 81 00 00 00    	je     0x1407f5d7a
   1407f5cf9:	41 ff c6             	inc    r14d
   1407f5cfc:	44 89 35 75 47 e5 01 	mov    DWORD PTR [rip+0x1e54775],r14d        # 0x14264a478
   1407f5d03:	80 3d ae 36 0b 01 00 	cmp    BYTE PTR [rip+0x10b36ae],0x0        # 0x1418a93b8
   1407f5d0a:	8d 46 01             	lea    eax,[rsi+0x1]
   1407f5d0d:	75 03                	jne    0x1407f5d12
   1407f5d0f:	8d 46 02             	lea    eax,[rsi+0x2]
   1407f5d12:	89 05 5c 47 e5 01    	mov    DWORD PTR [rip+0x1e5475c],eax        # 0x14264a474
   1407f5d18:	c7 05 5a 47 e5 01 07 	mov    DWORD PTR [rip+0x1e5475a],0x1000007        # 0x14264a47c
   1407f5d1f:	00 00 01 
   1407f5d22:	0f 57 c0             	xorps  xmm0,xmm0
   1407f5d25:	0f 11 45 10          	movups XMMWORD PTR [rbp+0x10],xmm0
   1407f5d29:	66 0f 6f 0d 6f 54 f9 	movdqa xmm1,XMMWORD PTR [rip+0xf9546f]        # 0x14178b1a0
   1407f5d30:	00 
   1407f5d31:	f3 0f 7f 4d 20       	movdqu XMMWORD PTR [rbp+0x20],xmm1
   1407f5d36:	48 b8 48 6f 74 6b 65 	movabs rax,0x203a79656b746f48
   1407f5d3d:	79 3a 20 
   1407f5d40:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   1407f5d44:	c6 45 18 00          	mov    BYTE PTR [rbp+0x18],0x0
   1407f5d48:	45 33 c9             	xor    r9d,r9d
   1407f5d4b:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f5d4f:	48 8d 0d 9a 46 e5 01 	lea    rcx,[rip+0x1e5469a]        # 0x14264a3f0
   1407f5d56:	e8 05 3c 2e 00       	call   0x140ad9960
   1407f5d5b:	90                   	nop
   1407f5d5c:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f5d60:	e8 eb 9a 87 ff       	call   0x14006f850
   1407f5d65:	c7 05 0d 47 e5 01 02 	mov    DWORD PTR [rip+0x1e5470d],0x1010002        # 0x14264a47c
   1407f5d6c:	00 01 01 
   1407f5d6f:	8b 15 33 36 0b 01    	mov    edx,DWORD PTR [rip+0x10b3633]        # 0x1418a93a8
   1407f5d75:	e8 36 37 44 00       	call   0x140c394b0
   1407f5d7a:	8b 7d 80             	mov    edi,DWORD PTR [rbp-0x80]
   1407f5d7d:	8b 5d 84             	mov    ebx,DWORD PTR [rbp-0x7c]
   1407f5d80:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
   1407f5d83:	39 05 8f 70 0b 01    	cmp    DWORD PTR [rip+0x10b708f],eax        # 0x1418ace18
   1407f5d89:	75 19                	jne    0x1407f5da4
   1407f5d8b:	44 39 3d 8a 70 0b 01 	cmp    DWORD PTR [rip+0x10b708a],r15d        # 0x1418ace1c
   1407f5d92:	75 10                	jne    0x1407f5da4
   1407f5d94:	39 1d 86 70 0b 01    	cmp    DWORD PTR [rip+0x10b7086],ebx        # 0x1418ace20
   1407f5d9a:	75 08                	jne    0x1407f5da4
   1407f5d9c:	39 3d 82 70 0b 01    	cmp    DWORD PTR [rip+0x10b7082],edi        # 0x1418ace24
   1407f5da2:	74 2f                	je     0x1407f5dd3
   1407f5da4:	89 05 6e 70 0b 01    	mov    DWORD PTR [rip+0x10b706e],eax        # 0x1418ace18
   1407f5daa:	44 89 3d 6b 70 0b 01 	mov    DWORD PTR [rip+0x10b706b],r15d        # 0x1418ace1c
   1407f5db1:	89 1d 69 70 0b 01    	mov    DWORD PTR [rip+0x10b7069],ebx        # 0x1418ace20
   1407f5db7:	89 3d 67 70 0b 01    	mov    DWORD PTR [rip+0x10b7067],edi        # 0x1418ace24
   1407f5dbd:	66 83 3d 33 4d e5 01 	cmp    WORD PTR [rip+0x1e54d33],0x2        # 0x14264aaf8
   1407f5dc4:	02 
   1407f5dc5:	7d 0c                	jge    0x1407f5dd3
   1407f5dc7:	b8 02 00 00 00       	mov    eax,0x2
   1407f5dcc:	66 89 05 25 4d e5 01 	mov    WORD PTR [rip+0x1e54d25],ax        # 0x14264aaf8
   1407f5dd3:	80 3d de 17 0b 01 00 	cmp    BYTE PTR [rip+0x10b17de],0x0        # 0x1418a75b8
   1407f5dda:	0f 84 e1 0c 00 00    	je     0x1407f6ac1
   1407f5de0:	48 8d 0d d1 17 0b 01 	lea    rcx,[rip+0x10b17d1]        # 0x1418a75b8
   1407f5de7:	e8 34 2d 9f ff       	call   0x1401e8b20
   1407f5dec:	e9 d0 0c 00 00       	jmp    0x1407f6ac1
   1407f5df1:	44 38 35 98 35 0b 01 	cmp    BYTE PTR [rip+0x10b3598],r14b        # 0x1418a9390
   1407f5df8:	74 86                	je     0x1407f5d80
   1407f5dfa:	ff 15 e8 f3 de 00    	call   QWORD PTR [rip+0xdef3e8]        # 0x1415e51e8
   1407f5e00:	8b 0d 8e 35 0b 01    	mov    ecx,DWORD PTR [rip+0x10b358e]        # 0x1418a9394
   1407f5e06:	3b c8                	cmp    ecx,eax
   1407f5e08:	7f 0e                	jg     0x1407f5e18
   1407f5e0a:	81 c1 e8 03 00 00    	add    ecx,0x3e8
   1407f5e10:	3b c8                	cmp    ecx,eax
   1407f5e12:	0f 8d 68 ff ff ff    	jge    0x1407f5d80
   1407f5e18:	44 88 35 71 35 0b 01 	mov    BYTE PTR [rip+0x10b3571],r14b        # 0x1418a9390
   1407f5e1f:	e9 5c ff ff ff       	jmp    0x1407f5d80
   1407f5e24:	44 8b 7c 24 74       	mov    r15d,DWORD PTR [rsp+0x74]
   1407f5e29:	41 8b df             	mov    ebx,r15d
   1407f5e2c:	41 8b ff             	mov    edi,r15d
   1407f5e2f:	e9 4c ff ff ff       	jmp    0x1407f5d80
   1407f5e34:	8b 05 4a 79 bd 01    	mov    eax,DWORD PTR [rip+0x1bd794a]        # 0x1423cd784
   1407f5e3a:	99                   	cdq
   1407f5e3b:	2b c2                	sub    eax,edx
   1407f5e3d:	d1 f8                	sar    eax,1
   1407f5e3f:	44 8b f8             	mov    r15d,eax
   1407f5e42:	44 8d 40 23          	lea    r8d,[rax+0x23]
   1407f5e46:	41 8d 57 dd          	lea    edx,[r15-0x23]
   1407f5e4a:	e8 f1 dd 30 00       	call   0x140b03c40
   1407f5e4f:	44 0f bf 1d 75 36 e5 	movsx  r11d,WORD PTR [rip+0x1e53675]        # 0x1426494cc
   1407f5e56:	01 
   1407f5e57:	66 44 89 5c 24 7c    	mov    WORD PTR [rsp+0x7c],r11w
   1407f5e5d:	44 0f bf 15 69 36 e5 	movsx  r10d,WORD PTR [rip+0x1e53669]        # 0x1426494ce
   1407f5e64:	01 
   1407f5e65:	66 44 89 55 8c       	mov    WORD PTR [rbp-0x74],r10w
   1407f5e6a:	44 0f b7 0d 5e 36 e5 	movzx  r9d,WORD PTR [rip+0x1e5365e]        # 0x1426494d0
   1407f5e71:	01 
   1407f5e72:	66 44 89 4c 24 78    	mov    WORD PTR [rsp+0x78],r9w
   1407f5e78:	41 8b cb             	mov    ecx,r11d
   1407f5e7b:	81 e1 0f 00 00 80    	and    ecx,0x8000000f
   1407f5e81:	7d 07                	jge    0x1407f5e8a
   1407f5e83:	ff c9                	dec    ecx
   1407f5e85:	83 c9 f0             	or     ecx,0xfffffff0
   1407f5e88:	ff c1                	inc    ecx
   1407f5e8a:	41 8b c2             	mov    eax,r10d
   1407f5e8d:	25 0f 00 00 80       	and    eax,0x8000000f
   1407f5e92:	7d 07                	jge    0x1407f5e9b
   1407f5e94:	ff c8                	dec    eax
   1407f5e96:	83 c8 f0             	or     eax,0xfffffff0
   1407f5e99:	ff c0                	inc    eax
   1407f5e9b:	48 8b 15 36 36 e5 01 	mov    rdx,QWORD PTR [rip+0x1e53636]        # 0x1426494d8
   1407f5ea2:	4c 0f bf c1          	movsx  r8,cx
   1407f5ea6:	49 c1 e0 04          	shl    r8,0x4
   1407f5eaa:	48 0f bf c0          	movsx  rax,ax
   1407f5eae:	4c 03 c0             	add    r8,rax
   1407f5eb1:	4e 8d 2c 42          	lea    r13,[rdx+r8*2]
   1407f5eb5:	41 0f b7 5d 08       	movzx  ebx,WORD PTR [r13+0x8]
   1407f5eba:	bf 80 01 00 00       	mov    edi,0x180
   1407f5ebf:	66 23 df             	and    bx,di
   1407f5ec2:	42 0f b6 8c 02 08 02 	movzx  ecx,BYTE PTR [rdx+r8*1+0x208]
   1407f5ec9:	00 00 
   1407f5ecb:	85 c9                	test   ecx,ecx
   1407f5ecd:	0f 84 ec 08 00 00    	je     0x1407f67bf
   1407f5ed3:	83 e9 01             	sub    ecx,0x1
   1407f5ed6:	0f 84 94 04 00 00    	je     0x1407f6370
   1407f5edc:	83 e9 01             	sub    ecx,0x1
   1407f5edf:	0f 84 a0 00 00 00    	je     0x1407f5f85
   1407f5ee5:	83 f9 01             	cmp    ecx,0x1
   1407f5ee8:	0f 85 a2 09 00 00    	jne    0x1407f6890
   1407f5eee:	41 8d 47 de          	lea    eax,[r15-0x22]
   1407f5ef2:	89 05 7c 45 e5 01    	mov    DWORD PTR [rip+0x1e5457c],eax        # 0x14264a474
   1407f5ef8:	8b f1                	mov    esi,ecx
   1407f5efa:	89 0d 78 45 e5 01    	mov    DWORD PTR [rip+0x1e54578],ecx        # 0x14264a478
   1407f5f00:	c7 05 72 45 e5 01 07 	mov    DWORD PTR [rip+0x1e54572],0x1010007        # 0x14264a47c
   1407f5f07:	00 01 01 
   1407f5f0a:	0f 57 c0             	xorps  xmm0,xmm0
   1407f5f0d:	0f 11 45 10          	movups XMMWORD PTR [rbp+0x10],xmm0
   1407f5f11:	b9 20 00 00 00       	mov    ecx,0x20
   1407f5f16:	e8 b5 a8 87 ff       	call   0x1400707d0
   1407f5f1b:	48 8b d0             	mov    rdx,rax
   1407f5f1e:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   1407f5f22:	66 0f 6f 05 e6 53 f9 	movdqa xmm0,XMMWORD PTR [rip+0xf953e6]        # 0x14178b310
   1407f5f29:	00 
   1407f5f2a:	f3 0f 7f 45 20       	movdqu XMMWORD PTR [rbp+0x20],xmm0
   1407f5f2f:	0f 10 05 f2 89 eb 00 	movups xmm0,XMMWORD PTR [rip+0xeb89f2]        # 0x1416ae928
   1407f5f36:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   1407f5f39:	f2 0f 10 05 f7 89 eb 	movsd  xmm0,QWORD PTR [rip+0xeb89f7]        # 0x1416ae938
   1407f5f40:	00 
   1407f5f41:	f2 0f 11 40 10       	movsd  QWORD PTR [rax+0x10],xmm0
   1407f5f46:	8b 0d f4 89 eb 00    	mov    ecx,DWORD PTR [rip+0xeb89f4]        # 0x1416ae940
   1407f5f4c:	89 48 18             	mov    DWORD PTR [rax+0x18],ecx
   1407f5f4f:	0f b7 05 ee 89 eb 00 	movzx  eax,WORD PTR [rip+0xeb89ee]        # 0x1416ae944
   1407f5f56:	66 89 42 1c          	mov    WORD PTR [rdx+0x1c],ax
   1407f5f5a:	0f b6 05 e5 89 eb 00 	movzx  eax,BYTE PTR [rip+0xeb89e5]        # 0x1416ae946
   1407f5f61:	88 42 1e             	mov    BYTE PTR [rdx+0x1e],al
   1407f5f64:	44 88 72 1f          	mov    BYTE PTR [rdx+0x1f],r14b
   1407f5f68:	45 33 c9             	xor    r9d,r9d
   1407f5f6b:	48 8d 55 10          	lea    rdx,[rbp+0x10]
   1407f5f6f:	48 8d 0d 7a 44 e5 01 	lea    rcx,[rip+0x1e5447a]        # 0x14264a3f0
   1407f5f76:	e8 e5 39 2e 00       	call   0x140ad9960
   1407f5f7b:	90                   	nop
   1407f5f7c:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1407f5f80:	e9 06 09 00 00       	jmp    0x1407f688b
   1407f5f85:	42 8b 84 82 08 03 00 	mov    eax,DWORD PTR [rdx+r8*4+0x308]
   1407f5f8c:	00 
   1407f5f8d:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
   1407f5f90:	42 8b 84 82 08 07 00 	mov    eax,DWORD PTR [rdx+r8*4+0x708]
   1407f5f97:	00 
   1407f5f98:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
   1407f5f9b:	42 8b 84 82 08 0b 00 	mov    eax,DWORD PTR [rdx+r8*4+0xb08]
   1407f5fa2:	00 
   1407f5fa3:	89 45 a0             	mov    DWORD PTR [rbp-0x60],eax
   1407f5fa6:	41 8d 47 de          	lea    eax,[r15-0x22]
   1407f5faa:	89 05 c4 44 e5 01    	mov    DWORD PTR [rip+0x1e544c4],eax        # 0x14264a474
   1407f5fb0:	be 01 00 00 00       	mov    esi,0x1
   1407f5fb5:	89 35 bd 44 e5 01    	mov    DWORD PTR [rip+0x1e544bd],esi        # 0x14264a478
   1407f5fbb:	c7 05 b7 44 e5 01 07 	mov    DWORD PTR [rip+0x1e544b7],0x1010007        # 0x14264a47c
   1407f5fc2:	00 01 01 
   1407f5fc5:	0f 57 c0             	xorps  xmm0,xmm0
   1407f5fc8:	0f 11 45 f0          	movups XMMWORD PTR [rbp-0x10],xmm0
   1407f5fcc:	48 c7 45 00 02 00 00 	mov    QWORD PTR [rbp+0x0],0x2
   1407f5fd3:	00 
   1407f5fd4:	48 c7 45 08 0f 00 00 	mov    QWORD PTR [rbp+0x8],0xf
   1407f5fdb:	00 
   1407f5fdc:	b8 41 20 00 00       	mov    eax,0x2041
   1407f5fe1:	66 89 45 f0          	mov    WORD PTR [rbp-0x10],ax
   1407f5fe5:	44 88 75 f2          	mov    BYTE PTR [rbp-0xe],r14b
   1407f5fe9:	41 f6 45 08 40       	test   BYTE PTR [r13+0x8],0x40
   1407f5fee:	0f 84 fc 00 00 00    	je     0x1407f60f0
   1407f5ff4:	48 8d 45 9c          	lea    rax,[rbp-0x64]
   1407f5ff8:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1407f5ffd:	48 8d 45 80          	lea    rax,[rbp-0x80]
   1407f6001:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1407f6006:	48 8d 45 a4          	lea    rax,[rbp-0x5c]
   1407f600a:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1407f600f:	48 8d 45 84          	lea    rax,[rbp-0x7c]
   1407f6013:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1407f6018:	45 0f b7 c2          	movzx  r8d,r10w
   1407f601c:	41 0f b7 d3          	movzx  edx,r11w
   1407f6020:	48 8d 0d c9 b4 bd 01 	lea    rcx,[rip+0x1bdb4c9]        # 0x1423d14f0
   1407f6027:	e8 94 cc cd 00       	call   0x1414d2cc0
   1407f602c:	0f b7 4d 84          	movzx  ecx,WORD PTR [rbp-0x7c]
   1407f6030:	89 4c 24 74          	mov    DWORD PTR [rsp+0x74],ecx
   1407f6034:	66 83 f9 ff          	cmp    cx,0xffff
   1407f6038:	75 0f                	jne    0x1407f6049
   1407f603a:	c7 44 24 74 06 00 00 	mov    DWORD PTR [rsp+0x74],0x6
   1407f6041:	00 
   1407f6042:	66 89 74 24 70       	mov    WORD PTR [rsp+0x70],si
   1407f6047:	eb 09                	jmp    0x1407f6052
   1407f6049:	0f b7 45 80          	movzx  eax,WORD PTR [rbp-0x80]
   1407f604d:	66 89 44 24 70       	mov    WORD PTR [rsp+0x70],ax
   1407f6052:	66 3b df             	cmp    bx,di
   1407f6055:	75 09                	jne    0x1407f6060
   1407f6057:	48 8d 15 9e 8b eb 00 	lea    rdx,[rip+0xeb8b9e]        # 0x1416aebfc
   1407f605e:	eb 26                	jmp    0x1407f6086
   1407f6060:	bf 00 01 00 00       	mov    edi,0x100
   1407f6065:	66 3b df             	cmp    bx,di
   1407f6068:	75 09                	jne    0x1407f6073
   1407f606a:	48 8d 15 83 8b eb 00 	lea    rdx,[rip+0xeb8b83]        # 0x1416aebf4
   1407f6071:	eb 13                	jmp    0x1407f6086
   1407f6073:	41 bc 80 00 00 00    	mov    r12d,0x80
   1407f6079:	66 41 3b dc          	cmp    bx,r12w
   1407f607d:	75 10                	jne    0x1407f608f
   1407f607f:	48 8d 15 86 8b eb 00 	lea    rdx,[rip+0xeb8b86]        # 0x1416aec0c
   1407f6086:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f608a:	e8 d1 94 87 ff       	call   0x14006f560
   1407f608f:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6093:	e8 f8 95 87 ff       	call   0x14006f690
   1407f6098:	90                   	nop
   1407f6099:	0f b7 44 24 70       	movzx  eax,WORD PTR [rsp+0x70]
   1407f609e:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   1407f60a3:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1407f60a8:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f60ad:	44 8b 4d a4          	mov    r9d,DWORD PTR [rbp-0x5c]
   1407f60b1:	44 0f b7 44 24 74    	movzx  r8d,WORD PTR [rsp+0x74]
   1407f60b7:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f60bb:	48 8d 0d 2e b4 bd 01 	lea    rcx,[rip+0x1bdb42e]        # 0x1423d14f0
   1407f60c2:	e8 59 b8 cd 00       	call   0x1414d1920
   1407f60c7:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f60cb:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f60cf:	e8 3c 3c 8c ff       	call   0x1400b9d10
   1407f60d4:	48 8d 15 61 26 df 00 	lea    rdx,[rip+0xdf2661]        # 0x1415e873c
   1407f60db:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f60df:	e8 7c 94 87 ff       	call   0x14006f560
   1407f60e4:	90                   	nop
   1407f60e5:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f60e9:	e8 62 97 87 ff       	call   0x14006f850
   1407f60ee:	eb 3d                	jmp    0x1407f612d
   1407f60f0:	66 3b df             	cmp    bx,di
   1407f60f3:	75 09                	jne    0x1407f60fe
   1407f60f5:	48 8d 15 08 8b eb 00 	lea    rdx,[rip+0xeb8b08]        # 0x1416aec04
   1407f60fc:	eb 26                	jmp    0x1407f6124
   1407f60fe:	bf 00 01 00 00       	mov    edi,0x100
   1407f6103:	66 3b df             	cmp    bx,di
   1407f6106:	75 09                	jne    0x1407f6111
   1407f6108:	48 8d 15 71 88 eb 00 	lea    rdx,[rip+0xeb8871]        # 0x1416ae980
   1407f610f:	eb 13                	jmp    0x1407f6124
   1407f6111:	41 bc 80 00 00 00    	mov    r12d,0x80
   1407f6117:	66 41 3b dc          	cmp    bx,r12w
   1407f611b:	75 10                	jne    0x1407f612d
   1407f611d:	48 8d 15 54 88 eb 00 	lea    rdx,[rip+0xeb8854]        # 0x1416ae978
   1407f6124:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6128:	e8 33 94 87 ff       	call   0x14006f560
   1407f612d:	8b 45 a0             	mov    eax,DWORD PTR [rbp-0x60]
   1407f6130:	a8 01                	test   al,0x1
   1407f6132:	74 09                	je     0x1407f613d
   1407f6134:	48 8d 15 11 42 e4 00 	lea    rdx,[rip+0xe44211]        # 0x14163a34c
   1407f613b:	eb 0b                	jmp    0x1407f6148
   1407f613d:	a8 02                	test   al,0x2
   1407f613f:	74 10                	je     0x1407f6151
   1407f6141:	48 8d 15 dc 41 e4 00 	lea    rdx,[rip+0xe441dc]        # 0x14163a324
   1407f6148:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f614c:	e8 0f 94 87 ff       	call   0x14006f560
   1407f6151:	0f 57 c0             	xorps  xmm0,xmm0
   1407f6154:	0f 11 45 d0          	movups XMMWORD PTR [rbp-0x30],xmm0
   1407f6158:	4c 89 75 e0          	mov    QWORD PTR [rbp-0x20],r14
   1407f615c:	48 c7 45 e8 0f 00 00 	mov    QWORD PTR [rbp-0x18],0xf
   1407f6163:	00 
   1407f6164:	c6 45 d0 00          	mov    BYTE PTR [rbp-0x30],0x0
   1407f6168:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1407f616d:	44 8b c8             	mov    r9d,eax
   1407f6170:	44 89 74 24 68       	mov    DWORD PTR [rsp+0x68],r14d
   1407f6175:	44 89 74 24 60       	mov    DWORD PTR [rsp+0x60],r14d
   1407f617a:	c6 44 24 58 00       	mov    BYTE PTR [rsp+0x58],0x0
   1407f617f:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   1407f6183:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
   1407f6187:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   1407f618c:	c6 44 24 38 00       	mov    BYTE PTR [rsp+0x38],0x0
   1407f6191:	44 89 74 24 30       	mov    DWORD PTR [rsp+0x30],r14d
   1407f6196:	89 74 24 28          	mov    DWORD PTR [rsp+0x28],esi
   1407f619a:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   1407f619e:	44 0f b7 45 88       	movzx  r8d,WORD PTR [rbp-0x78]
   1407f61a3:	0f b7 55 98          	movzx  edx,WORD PTR [rbp-0x68]
   1407f61a7:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f61ab:	e8 60 ca 28 00       	call   0x140a82c10
   1407f61b0:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f61b4:	48 83 7d e8 0f       	cmp    QWORD PTR [rbp-0x18],0xf
   1407f61b9:	48 0f 47 55 d0       	cmova  rdx,QWORD PTR [rbp-0x30]
   1407f61be:	4c 8b 45 e0          	mov    r8,QWORD PTR [rbp-0x20]
   1407f61c2:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f61c6:	e8 45 98 87 ff       	call   0x14006fa10
   1407f61cb:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f61cf:	41 f6 45 08 40       	test   BYTE PTR [r13+0x8],0x40
   1407f61d4:	74 11                	je     0x1407f61e7
   1407f61d6:	48 8d 15 bf 41 e4 00 	lea    rdx,[rip+0xe441bf]        # 0x14163a39c
   1407f61dd:	e8 7e 93 87 ff       	call   0x14006f560
   1407f61e2:	e9 f2 00 00 00       	jmp    0x1407f62d9
   1407f61e7:	48 8d 15 b2 87 eb 00 	lea    rdx,[rip+0xeb87b2]        # 0x1416ae9a0
   1407f61ee:	e8 6d 93 87 ff       	call   0x14006f560
   1407f61f3:	48 8d 45 9c          	lea    rax,[rbp-0x64]
   1407f61f7:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1407f61fc:	48 8d 45 80          	lea    rax,[rbp-0x80]
   1407f6200:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1407f6205:	48 8d 45 88          	lea    rax,[rbp-0x78]
   1407f6209:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1407f620e:	48 8d 44 24 70       	lea    rax,[rsp+0x70]
   1407f6213:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1407f6218:	0f b7 74 24 78       	movzx  esi,WORD PTR [rsp+0x78]
   1407f621d:	44 0f b7 ce          	movzx  r9d,si
   1407f6221:	0f b7 5d 8c          	movzx  ebx,WORD PTR [rbp-0x74]
   1407f6225:	44 0f b7 c3          	movzx  r8d,bx
   1407f6229:	0f b7 7c 24 7c       	movzx  edi,WORD PTR [rsp+0x7c]
   1407f622e:	0f b7 d7             	movzx  edx,di
   1407f6231:	48 8d 0d b8 b2 bd 01 	lea    rcx,[rip+0x1bdb2b8]        # 0x1423d14f0
   1407f6238:	e8 e3 c8 cd 00       	call   0x1414d2b20
   1407f623d:	66 83 7c 24 70 ff    	cmp    WORD PTR [rsp+0x70],0xffff
   1407f6243:	75 46                	jne    0x1407f628b
   1407f6245:	48 8d 45 80          	lea    rax,[rbp-0x80]
   1407f6249:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   1407f624e:	48 8d 45 88          	lea    rax,[rbp-0x78]
   1407f6252:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1407f6257:	48 8d 44 24 70       	lea    rax,[rsp+0x70]
   1407f625c:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1407f6261:	48 8d 45 84          	lea    rax,[rbp-0x7c]
   1407f6265:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1407f626a:	48 8d 44 24 7c       	lea    rax,[rsp+0x7c]
   1407f626f:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1407f6274:	44 0f b7 ce          	movzx  r9d,si
   1407f6278:	44 0f b7 c3          	movzx  r8d,bx
   1407f627c:	0f b7 d7             	movzx  edx,di
   1407f627f:	48 8d 0d 6a b2 bd 01 	lea    rcx,[rip+0x1bdb26a]        # 0x1423d14f0
   1407f6286:	e8 e5 a9 cd 00       	call   0x1414d0c70
   1407f628b:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f628f:	e8 fc 93 87 ff       	call   0x14006f690
   1407f6294:	90                   	nop
   1407f6295:	0f b7 45 80          	movzx  eax,WORD PTR [rbp-0x80]
   1407f6299:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   1407f629e:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   1407f62a3:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f62a8:	44 8b 4d 88          	mov    r9d,DWORD PTR [rbp-0x78]
   1407f62ac:	44 0f b7 44 24 70    	movzx  r8d,WORD PTR [rsp+0x70]
   1407f62b2:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f62b6:	48 8d 0d 33 b2 bd 01 	lea    rcx,[rip+0x1bdb233]        # 0x1423d14f0
   1407f62bd:	e8 5e b6 cd 00       	call   0x1414d1920
   1407f62c2:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f62c6:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f62ca:	e8 41 3a 8c ff       	call   0x1400b9d10
   1407f62cf:	90                   	nop
   1407f62d0:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f62d4:	e8 77 95 87 ff       	call   0x14006f850
   1407f62d9:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f62dd:	48 83 7d 00 3c       	cmp    QWORD PTR [rbp+0x0],0x3c
   1407f62e2:	48 8d 15 a7 86 eb 00 	lea    rdx,[rip+0xeb86a7]        # 0x1416ae990
   1407f62e9:	76 07                	jbe    0x1407f62f2
   1407f62eb:	48 8d 15 c2 22 df 00 	lea    rdx,[rip+0xdf22c2]        # 0x1415e85b4
   1407f62f2:	e8 69 92 87 ff       	call   0x14006f560
   1407f62f7:	ba 45 00 00 00       	mov    edx,0x45
   1407f62fc:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6300:	e8 db 7b d3 ff       	call   0x14052dee0
   1407f6305:	45 33 c9             	xor    r9d,r9d
   1407f6308:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f630c:	48 8d 0d dd 40 e5 01 	lea    rcx,[rip+0x1e540dd]        # 0x14264a3f0
   1407f6313:	e8 48 36 2e 00       	call   0x140ad9960
   1407f6318:	90                   	nop
   1407f6319:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
   1407f631d:	48 83 fa 0f          	cmp    rdx,0xf
   1407f6321:	76 34                	jbe    0x1407f6357
   1407f6323:	48 ff c2             	inc    rdx
   1407f6326:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
   1407f632a:	48 8b c1             	mov    rax,rcx
   1407f632d:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1407f6334:	72 1c                	jb     0x1407f6352
   1407f6336:	48 83 c2 27          	add    rdx,0x27
   1407f633a:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   1407f633e:	48 2b c1             	sub    rax,rcx
   1407f6341:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   1407f6345:	48 83 f8 1f          	cmp    rax,0x1f
   1407f6349:	76 07                	jbe    0x1407f6352
   1407f634b:	ff 15 d7 f7 de 00    	call   QWORD PTR [rip+0xdef7d7]        # 0x1415e5b28
   1407f6351:	cc                   	int3
   1407f6352:	e8 29 33 d4 00       	call   0x141539680
   1407f6357:	4c 89 75 e0          	mov    QWORD PTR [rbp-0x20],r14
   1407f635b:	48 c7 45 e8 0f 00 00 	mov    QWORD PTR [rbp-0x18],0xf
   1407f6362:	00 
   1407f6363:	c6 45 d0 00          	mov    BYTE PTR [rbp-0x30],0x0
   1407f6367:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f636b:	e9 1b 05 00 00       	jmp    0x1407f688b
   1407f6370:	4a 63 84 82 08 07 00 	movsxd rax,DWORD PTR [rdx+r8*4+0x708]
   1407f6377:	00 
   1407f6378:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
   1407f637f:	00 
   1407f6380:	48 8b 05 01 67 cf 01 	mov    rax,QWORD PTR [rip+0x1cf6701]        # 0x1424eca88
   1407f6387:	4c 63 24 01          	movsxd r12,DWORD PTR [rcx+rax*1]
   1407f638b:	48 8b 05 0e 67 cf 01 	mov    rax,QWORD PTR [rip+0x1cf670e]        # 0x1424ecaa0
   1407f6392:	48 63 3c 01          	movsxd rdi,DWORD PTR [rcx+rax*1]
   1407f6396:	42 0f b7 84 82 08 0b 	movzx  eax,WORD PTR [rdx+r8*4+0xb08]
   1407f639d:	00 00 
   1407f639f:	66 89 44 24 70       	mov    WORD PTR [rsp+0x70],ax
   1407f63a4:	66 45 85 e4          	test   r12w,r12w
   1407f63a8:	78 53                	js     0x1407f63fd
   1407f63aa:	48 8b 0d b7 66 cf 01 	mov    rcx,QWORD PTR [rip+0x1cf66b7]        # 0x1424eca68
   1407f63b1:	49 0f bf d4          	movsx  rdx,r12w
   1407f63b5:	48 8b 05 b4 66 cf 01 	mov    rax,QWORD PTR [rip+0x1cf66b4]        # 0x1424eca70
   1407f63bc:	48 2b c1             	sub    rax,rcx
   1407f63bf:	48 c1 f8 03          	sar    rax,0x3
   1407f63c3:	48 3b d0             	cmp    rdx,rax
   1407f63c6:	73 35                	jae    0x1407f63fd
   1407f63c8:	66 85 ff             	test   di,di
   1407f63cb:	78 30                	js     0x1407f63fd
   1407f63cd:	48 8b 0c d1          	mov    rcx,QWORD PTR [rcx+rdx*8]
   1407f63d1:	48 0f bf d7          	movsx  rdx,di
   1407f63d5:	48 8b 81 80 01 00 00 	mov    rax,QWORD PTR [rcx+0x180]
   1407f63dc:	48 2b 81 78 01 00 00 	sub    rax,QWORD PTR [rcx+0x178]
   1407f63e3:	48 c1 f8 03          	sar    rax,0x3
   1407f63e7:	48 3b d0             	cmp    rdx,rax
   1407f63ea:	73 11                	jae    0x1407f63fd
   1407f63ec:	48 8b 81 78 01 00 00 	mov    rax,QWORD PTR [rcx+0x178]
   1407f63f3:	48 8b 0c d0          	mov    rcx,QWORD PTR [rax+rdx*8]
   1407f63f7:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
   1407f63fb:	eb 04                	jmp    0x1407f6401
   1407f63fd:	4c 89 75 90          	mov    QWORD PTR [rbp-0x70],r14
   1407f6401:	41 8d 47 de          	lea    eax,[r15-0x22]
   1407f6405:	89 05 69 40 e5 01    	mov    DWORD PTR [rip+0x1e54069],eax        # 0x14264a474
   1407f640b:	be 01 00 00 00       	mov    esi,0x1
   1407f6410:	89 35 62 40 e5 01    	mov    DWORD PTR [rip+0x1e54062],esi        # 0x14264a478
   1407f6416:	c7 05 5c 40 e5 01 07 	mov    DWORD PTR [rip+0x1e5405c],0x1010007        # 0x14264a47c
   1407f641d:	00 01 01 
   1407f6420:	48 8d 15 55 72 df 00 	lea    rdx,[rip+0xdf7255]        # 0x1415ed67c
   1407f6427:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f642b:	e8 20 1d 87 ff       	call   0x140068150
   1407f6430:	90                   	nop
   1407f6431:	0f 57 c0             	xorps  xmm0,xmm0
   1407f6434:	0f 11 45 d0          	movups XMMWORD PTR [rbp-0x30],xmm0
   1407f6438:	66 0f 6f 0d e0 4c f9 	movdqa xmm1,XMMWORD PTR [rip+0xf94ce0]        # 0x14178b120
   1407f643f:	00 
   1407f6440:	f3 0f 7f 4d e0       	movdqu XMMWORD PTR [rbp-0x20],xmm1
   1407f6445:	c6 45 d0 00          	mov    BYTE PTR [rbp-0x30],0x0
   1407f6449:	44 0f b7 cf          	movzx  r9d,di
   1407f644d:	45 33 c0             	xor    r8d,r8d
   1407f6450:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f6454:	41 0f b7 cc          	movzx  ecx,r12w
   1407f6458:	e8 73 d7 2a 00       	call   0x140aa3bd0
   1407f645d:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f6461:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6465:	e8 a6 38 8c ff       	call   0x1400b9d10
   1407f646a:	45 32 c0             	xor    r8b,r8b
   1407f646d:	bf 00 01 00 00       	mov    edi,0x100
   1407f6472:	41 bc 80 00 00 00    	mov    r12d,0x80
   1407f6478:	41 f6 45 08 40       	test   BYTE PTR [r13+0x8],0x40
   1407f647d:	0f 84 f0 00 00 00    	je     0x1407f6573
   1407f6483:	48 8d 45 9c          	lea    rax,[rbp-0x64]
   1407f6487:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1407f648c:	48 8d 45 80          	lea    rax,[rbp-0x80]
   1407f6490:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1407f6495:	48 8d 45 98          	lea    rax,[rbp-0x68]
   1407f6499:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1407f649e:	48 8d 45 84          	lea    rax,[rbp-0x7c]
   1407f64a2:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1407f64a7:	44 0f b7 4c 24 78    	movzx  r9d,WORD PTR [rsp+0x78]
   1407f64ad:	44 0f b7 45 8c       	movzx  r8d,WORD PTR [rbp-0x74]
   1407f64b2:	0f b7 54 24 7c       	movzx  edx,WORD PTR [rsp+0x7c]
   1407f64b7:	48 8d 0d 32 b0 bd 01 	lea    rcx,[rip+0x1bdb032]        # 0x1423d14f0
   1407f64be:	e8 fd c7 cd 00       	call   0x1414d2cc0
   1407f64c3:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
   1407f64c7:	89 44 24 74          	mov    DWORD PTR [rsp+0x74],eax
   1407f64cb:	66 83 f8 ff          	cmp    ax,0xffff
   1407f64cf:	75 0a                	jne    0x1407f64db
   1407f64d1:	c7 44 24 74 06 00 00 	mov    DWORD PTR [rsp+0x74],0x6
   1407f64d8:	00 
   1407f64d9:	eb 04                	jmp    0x1407f64df
   1407f64db:	0f b7 75 80          	movzx  esi,WORD PTR [rbp-0x80]
   1407f64df:	48 8d 15 3e 76 df 00 	lea    rdx,[rip+0xdf763e]        # 0x1415edb24
   1407f64e6:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f64ea:	e8 71 90 87 ff       	call   0x14006f560
   1407f64ef:	b8 80 01 00 00       	mov    eax,0x180
   1407f64f4:	66 3b d8             	cmp    bx,ax
   1407f64f7:	75 09                	jne    0x1407f6502
   1407f64f9:	48 8d 15 fc 86 eb 00 	lea    rdx,[rip+0xeb86fc]        # 0x1416aebfc
   1407f6500:	eb 1b                	jmp    0x1407f651d
   1407f6502:	66 3b df             	cmp    bx,di
   1407f6505:	75 09                	jne    0x1407f6510
   1407f6507:	48 8d 15 e6 86 eb 00 	lea    rdx,[rip+0xeb86e6]        # 0x1416aebf4
   1407f650e:	eb 0d                	jmp    0x1407f651d
   1407f6510:	66 41 3b dc          	cmp    bx,r12w
   1407f6514:	75 10                	jne    0x1407f6526
   1407f6516:	48 8d 15 ef 86 eb 00 	lea    rdx,[rip+0xeb86ef]        # 0x1416aec0c
   1407f651d:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6521:	e8 3a 90 87 ff       	call   0x14006f560
   1407f6526:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f652a:	e8 61 91 87 ff       	call   0x14006f690
   1407f652f:	90                   	nop
   1407f6530:	66 89 74 24 30       	mov    WORD PTR [rsp+0x30],si
   1407f6535:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1407f653a:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f653f:	44 8b 4d 98          	mov    r9d,DWORD PTR [rbp-0x68]
   1407f6543:	44 0f b7 44 24 74    	movzx  r8d,WORD PTR [rsp+0x74]
   1407f6549:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f654d:	48 8d 0d 9c af bd 01 	lea    rcx,[rip+0x1bdaf9c]        # 0x1423d14f0
   1407f6554:	e8 c7 b3 cd 00       	call   0x1414d1920
   1407f6559:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f655d:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6561:	e8 aa 37 8c ff       	call   0x1400b9d10
   1407f6566:	90                   	nop
   1407f6567:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f656b:	e8 e0 92 87 ff       	call   0x14006f850
   1407f6570:	41 b0 01             	mov    r8b,0x1
   1407f6573:	48 0f bf 44 24 70    	movsx  rax,WORD PTR [rsp+0x70]
   1407f6579:	66 85 c0             	test   ax,ax
   1407f657c:	0f 88 dc 00 00 00    	js     0x1407f665e
   1407f6582:	48 8b 75 90          	mov    rsi,QWORD PTR [rbp-0x70]
   1407f6586:	48 8b 8e c0 06 00 00 	mov    rcx,QWORD PTR [rsi+0x6c0]
   1407f658d:	48 8b d0             	mov    rdx,rax
   1407f6590:	48 8b 86 c8 06 00 00 	mov    rax,QWORD PTR [rsi+0x6c8]
   1407f6597:	48 2b c1             	sub    rax,rcx
   1407f659a:	48 c1 f8 03          	sar    rax,0x3
   1407f659e:	48 3b d0             	cmp    rdx,rax
   1407f65a1:	0f 83 b7 00 00 00    	jae    0x1407f665e
   1407f65a7:	48 8d 04 d5 00 00 00 	lea    rax,[rdx*8+0x0]
   1407f65ae:	00 
   1407f65af:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   1407f65b3:	48 8b 0c 08          	mov    rcx,QWORD PTR [rax+rcx*1]
   1407f65b7:	48 8b 81 98 00 00 00 	mov    rax,QWORD PTR [rcx+0x98]
   1407f65be:	48 2b 81 90 00 00 00 	sub    rax,QWORD PTR [rcx+0x90]
   1407f65c5:	48 c1 f8 03          	sar    rax,0x3
   1407f65c9:	48 85 c0             	test   rax,rax
   1407f65cc:	0f 84 8c 00 00 00    	je     0x1407f665e
   1407f65d2:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f65d6:	45 84 c0             	test   r8b,r8b
   1407f65d9:	75 48                	jne    0x1407f6623
   1407f65db:	48 8d 15 42 75 df 00 	lea    rdx,[rip+0xdf7542]        # 0x1415edb24
   1407f65e2:	e8 79 8f 87 ff       	call   0x14006f560
   1407f65e7:	b8 80 01 00 00       	mov    eax,0x180
   1407f65ec:	66 3b d8             	cmp    bx,ax
   1407f65ef:	75 0d                	jne    0x1407f65fe
   1407f65f1:	48 8d 15 0c 86 eb 00 	lea    rdx,[rip+0xeb860c]        # 0x1416aec04
   1407f65f8:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f65fc:	eb 2c                	jmp    0x1407f662a
   1407f65fe:	66 3b df             	cmp    bx,di
   1407f6601:	75 0d                	jne    0x1407f6610
   1407f6603:	48 8d 15 76 83 eb 00 	lea    rdx,[rip+0xeb8376]        # 0x1416ae980
   1407f660a:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f660e:	eb 1a                	jmp    0x1407f662a
   1407f6610:	66 41 3b dc          	cmp    bx,r12w
   1407f6614:	75 19                	jne    0x1407f662f
   1407f6616:	48 8d 15 5b 83 eb 00 	lea    rdx,[rip+0xeb835b]        # 0x1416ae978
   1407f661d:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6621:	eb 07                	jmp    0x1407f662a
   1407f6623:	48 8d 15 12 21 df 00 	lea    rdx,[rip+0xdf2112]        # 0x1415e873c
   1407f662a:	e8 31 8f 87 ff       	call   0x14006f560
   1407f662f:	48 8b 86 c0 06 00 00 	mov    rax,QWORD PTR [rsi+0x6c0]
   1407f6636:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
   1407f663a:	48 8b 14 10          	mov    rdx,QWORD PTR [rax+rdx*1]
   1407f663e:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
   1407f6645:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   1407f6648:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f664c:	e8 4f 8f 87 ff       	call   0x14006f5a0
   1407f6651:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   1407f6655:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6659:	e8 b2 36 8c ff       	call   0x1400b9d10
   1407f665e:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6662:	41 f6 45 08 40       	test   BYTE PTR [r13+0x8],0x40
   1407f6667:	74 11                	je     0x1407f667a
   1407f6669:	48 8d 15 2c 3d e4 00 	lea    rdx,[rip+0xe43d2c]        # 0x14163a39c
   1407f6670:	e8 eb 8e 87 ff       	call   0x14006f560
   1407f6675:	e9 f2 00 00 00       	jmp    0x1407f676c
   1407f667a:	48 8d 15 1f 83 eb 00 	lea    rdx,[rip+0xeb831f]        # 0x1416ae9a0
   1407f6681:	e8 da 8e 87 ff       	call   0x14006f560
   1407f6686:	48 8d 45 9c          	lea    rax,[rbp-0x64]
   1407f668a:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1407f668f:	48 8d 45 80          	lea    rax,[rbp-0x80]
   1407f6693:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1407f6698:	48 8d 45 88          	lea    rax,[rbp-0x78]
   1407f669c:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1407f66a1:	48 8d 44 24 70       	lea    rax,[rsp+0x70]
   1407f66a6:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1407f66ab:	0f b7 74 24 78       	movzx  esi,WORD PTR [rsp+0x78]
   1407f66b0:	44 0f b7 ce          	movzx  r9d,si
   1407f66b4:	0f b7 5d 8c          	movzx  ebx,WORD PTR [rbp-0x74]
   1407f66b8:	44 0f b7 c3          	movzx  r8d,bx
   1407f66bc:	0f b7 7c 24 7c       	movzx  edi,WORD PTR [rsp+0x7c]
   1407f66c1:	0f b7 d7             	movzx  edx,di
   1407f66c4:	48 8d 0d 25 ae bd 01 	lea    rcx,[rip+0x1bdae25]        # 0x1423d14f0
   1407f66cb:	e8 50 c4 cd 00       	call   0x1414d2b20
   1407f66d0:	66 83 7c 24 70 ff    	cmp    WORD PTR [rsp+0x70],0xffff
   1407f66d6:	75 46                	jne    0x1407f671e
   1407f66d8:	48 8d 45 80          	lea    rax,[rbp-0x80]
   1407f66dc:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   1407f66e1:	48 8d 45 88          	lea    rax,[rbp-0x78]
   1407f66e5:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1407f66ea:	48 8d 44 24 70       	lea    rax,[rsp+0x70]
   1407f66ef:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1407f66f4:	48 8d 45 84          	lea    rax,[rbp-0x7c]
   1407f66f8:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1407f66fd:	48 8d 44 24 7c       	lea    rax,[rsp+0x7c]
   1407f6702:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1407f6707:	44 0f b7 ce          	movzx  r9d,si
   1407f670b:	44 0f b7 c3          	movzx  r8d,bx
   1407f670f:	0f b7 d7             	movzx  edx,di
   1407f6712:	48 8d 0d d7 ad bd 01 	lea    rcx,[rip+0x1bdadd7]        # 0x1423d14f0
   1407f6719:	e8 52 a5 cd 00       	call   0x1414d0c70
   1407f671e:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6722:	e8 69 8f 87 ff       	call   0x14006f690
   1407f6727:	90                   	nop
   1407f6728:	0f b7 45 80          	movzx  eax,WORD PTR [rbp-0x80]
   1407f672c:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   1407f6731:	c6 44 24 28 00       	mov    BYTE PTR [rsp+0x28],0x0
   1407f6736:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   1407f673b:	44 8b 4d 88          	mov    r9d,DWORD PTR [rbp-0x78]
   1407f673f:	44 0f b7 44 24 70    	movzx  r8d,WORD PTR [rsp+0x70]
   1407f6745:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f6749:	48 8d 0d a0 ad bd 01 	lea    rcx,[rip+0x1bdada0]        # 0x1423d14f0
   1407f6750:	e8 cb b1 cd 00       	call   0x1414d1920
   1407f6755:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f6759:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f675d:	e8 ae 35 8c ff       	call   0x1400b9d10
   1407f6762:	90                   	nop
   1407f6763:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6767:	e8 e4 90 87 ff       	call   0x14006f850
   1407f676c:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6770:	48 83 7d 00 3c       	cmp    QWORD PTR [rbp+0x0],0x3c
   1407f6775:	48 8d 15 14 82 eb 00 	lea    rdx,[rip+0xeb8214]        # 0x1416ae990
   1407f677c:	76 07                	jbe    0x1407f6785
   1407f677e:	48 8d 15 2f 1e df 00 	lea    rdx,[rip+0xdf1e2f]        # 0x1415e85b4
   1407f6785:	e8 d6 8d 87 ff       	call   0x14006f560
   1407f678a:	ba 45 00 00 00       	mov    edx,0x45
   1407f678f:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f6793:	e8 48 77 d3 ff       	call   0x14052dee0
   1407f6798:	45 33 c9             	xor    r9d,r9d
   1407f679b:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   1407f679f:	48 8d 0d 4a 3c e5 01 	lea    rcx,[rip+0x1e53c4a]        # 0x14264a3f0
   1407f67a6:	e8 b5 31 2e 00       	call   0x140ad9960
   1407f67ab:	90                   	nop
   1407f67ac:	48 8d 4d d0          	lea    rcx,[rbp-0x30]
   1407f67b0:	e8 9b 90 87 ff       	call   0x14006f850
   1407f67b5:	90                   	nop
   1407f67b6:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1407f67ba:	e9 cc 00 00 00       	jmp    0x1407f688b
   1407f67bf:	41 8d 47 de          	lea    eax,[r15-0x22]
   1407f67c3:	89 05 ab 3c e5 01    	mov    DWORD PTR [rip+0x1e53cab],eax        # 0x14264a474
   1407f67c9:	be 01 00 00 00       	mov    esi,0x1
   1407f67ce:	89 35 a4 3c e5 01    	mov    DWORD PTR [rip+0x1e53ca4],esi        # 0x14264a478
   1407f67d4:	c7 05 9e 3c e5 01 07 	mov    DWORD PTR [rip+0x1e53c9e],0x1010007        # 0x14264a47c
   1407f67db:	00 01 01 
   1407f67de:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f67e2:	66 3b df             	cmp    bx,di
   1407f67e5:	75 23                	jne    0x1407f680a
   1407f67e7:	48 8d 15 4a 84 eb 00 	lea    rdx,[rip+0xeb844a]        # 0x1416aec38
   1407f67ee:	e8 5d 19 87 ff       	call   0x140068150
   1407f67f3:	90                   	nop
   1407f67f4:	45 33 c9             	xor    r9d,r9d
   1407f67f7:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f67fb:	48 8d 0d ee 3b e5 01 	lea    rcx,[rip+0x1e53bee]        # 0x14264a3f0
   1407f6802:	e8 59 31 2e 00       	call   0x140ad9960
   1407f6807:	90                   	nop
   1407f6808:	eb 7d                	jmp    0x1407f6887
   1407f680a:	bf 00 01 00 00       	mov    edi,0x100
   1407f680f:	66 3b df             	cmp    bx,di
   1407f6812:	75 23                	jne    0x1407f6837
   1407f6814:	48 8d 15 fd 83 eb 00 	lea    rdx,[rip+0xeb83fd]        # 0x1416aec18
   1407f681b:	e8 30 19 87 ff       	call   0x140068150
   1407f6820:	90                   	nop
   1407f6821:	45 33 c9             	xor    r9d,r9d
   1407f6824:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f6828:	48 8d 0d c1 3b e5 01 	lea    rcx,[rip+0x1e53bc1]        # 0x14264a3f0
   1407f682f:	e8 2c 31 2e 00       	call   0x140ad9960
   1407f6834:	90                   	nop
   1407f6835:	eb 50                	jmp    0x1407f6887
   1407f6837:	41 bc 80 00 00 00    	mov    r12d,0x80
   1407f683d:	66 41 3b dc          	cmp    bx,r12w
   1407f6841:	75 23                	jne    0x1407f6866
   1407f6843:	48 8d 15 36 84 eb 00 	lea    rdx,[rip+0xeb8436]        # 0x1416aec80
   1407f684a:	e8 01 19 87 ff       	call   0x140068150
   1407f684f:	90                   	nop
   1407f6850:	45 33 c9             	xor    r9d,r9d
   1407f6853:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f6857:	48 8d 0d 92 3b e5 01 	lea    rcx,[rip+0x1e53b92]        # 0x14264a3f0
   1407f685e:	e8 fd 30 2e 00       	call   0x140ad9960
   1407f6863:	90                   	nop
   1407f6864:	eb 21                	jmp    0x1407f6887
   1407f6866:	48 8d 15 f3 83 eb 00 	lea    rdx,[rip+0xeb83f3]        # 0x1416aec60
   1407f686d:	e8 de 18 87 ff       	call   0x140068150
   1407f6872:	90                   	nop
   1407f6873:	45 33 c9             	xor    r9d,r9d
   1407f6876:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f687a:	48 8d 0d 6f 3b e5 01 	lea    rcx,[rip+0x1e53b6f]        # 0x14264a3f0
   1407f6881:	e8 da 30 2e 00       	call   0x140ad9960
   1407f6886:	90                   	nop
   1407f6887:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f688b:	e8 c0 8f 87 ff       	call   0x14006f850
   1407f6890:	41 f6 45 08 02       	test   BYTE PTR [r13+0x8],0x2
   1407f6895:	0f 84 8f 01 00 00    	je     0x1407f6a2a
   1407f689b:	c7 05 d7 3b e5 01 07 	mov    DWORD PTR [rip+0x1e53bd7],0x1010007        # 0x14264a47c
   1407f68a2:	00 01 01 
   1407f68a5:	41 8d 47 de          	lea    eax,[r15-0x22]
   1407f68a9:	89 05 c5 3b e5 01    	mov    DWORD PTR [rip+0x1e53bc5],eax        # 0x14264a474
   1407f68af:	c7 05 bf 3b e5 01 03 	mov    DWORD PTR [rip+0x1e53bbf],0x3        # 0x14264a478
   1407f68b6:	00 00 00 
   1407f68b9:	41 0f b7 45 08       	movzx  eax,WORD PTR [r13+0x8]
   1407f68be:	83 e0 1c             	and    eax,0x1c
   1407f68c1:	48 63 c8             	movsxd rcx,eax
   1407f68c4:	48 8d 15 35 97 80 ff 	lea    rdx,[rip+0xffffffffff809735]        # 0x140000000
   1407f68cb:	0f b6 84 0a 04 6c 7f 	movzx  eax,BYTE PTR [rdx+rcx*1+0x7f6c04]
   1407f68d2:	00 
   1407f68d3:	8b 8c 82 e0 6b 7f 00 	mov    ecx,DWORD PTR [rdx+rax*4+0x7f6be0]
   1407f68da:	48 03 ca             	add    rcx,rdx
   1407f68dd:	ff e1                	jmp    rcx
   1407f68df:	48 8d 15 2a 80 eb 00 	lea    rdx,[rip+0xeb802a]        # 0x1416ae910
   1407f68e6:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f68ea:	e8 61 18 87 ff       	call   0x140068150
   1407f68ef:	90                   	nop
   1407f68f0:	45 33 c9             	xor    r9d,r9d
   1407f68f3:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f68f7:	48 8d 0d f2 3a e5 01 	lea    rcx,[rip+0x1e53af2]        # 0x14264a3f0
   1407f68fe:	e8 5d 30 2e 00       	call   0x140ad9960
   1407f6903:	90                   	nop
   1407f6904:	e9 18 01 00 00       	jmp    0x1407f6a21
   1407f6909:	48 8d 15 50 80 eb 00 	lea    rdx,[rip+0xeb8050]        # 0x1416ae960
   1407f6910:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6914:	e8 37 18 87 ff       	call   0x140068150
   1407f6919:	90                   	nop
   1407f691a:	45 33 c9             	xor    r9d,r9d
   1407f691d:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f6921:	48 8d 0d c8 3a e5 01 	lea    rcx,[rip+0x1e53ac8]        # 0x14264a3f0
   1407f6928:	e8 33 30 2e 00       	call   0x140ad9960
   1407f692d:	90                   	nop
   1407f692e:	e9 ee 00 00 00       	jmp    0x1407f6a21
   1407f6933:	48 8d 15 0e 80 eb 00 	lea    rdx,[rip+0xeb800e]        # 0x1416ae948
   1407f693a:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f693e:	e8 0d 18 87 ff       	call   0x140068150
   1407f6943:	90                   	nop
   1407f6944:	45 33 c9             	xor    r9d,r9d
   1407f6947:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f694b:	48 8d 0d 9e 3a e5 01 	lea    rcx,[rip+0x1e53a9e]        # 0x14264a3f0
   1407f6952:	e8 09 30 2e 00       	call   0x140ad9960
   1407f6957:	90                   	nop
   1407f6958:	e9 c4 00 00 00       	jmp    0x1407f6a21
   1407f695d:	48 8d 15 e4 80 eb 00 	lea    rdx,[rip+0xeb80e4]        # 0x1416aea48
   1407f6964:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6968:	e8 e3 17 87 ff       	call   0x140068150
   1407f696d:	90                   	nop
   1407f696e:	45 33 c9             	xor    r9d,r9d
   1407f6971:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f6975:	48 8d 0d 74 3a e5 01 	lea    rcx,[rip+0x1e53a74]        # 0x14264a3f0
   1407f697c:	e8 df 2f 2e 00       	call   0x140ad9960
   1407f6981:	90                   	nop
   1407f6982:	e9 9a 00 00 00       	jmp    0x1407f6a21
   1407f6987:	48 8d 15 9a 80 eb 00 	lea    rdx,[rip+0xeb809a]        # 0x1416aea28
   1407f698e:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6992:	e8 b9 17 87 ff       	call   0x140068150
   1407f6997:	90                   	nop
   1407f6998:	45 33 c9             	xor    r9d,r9d
   1407f699b:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f699f:	48 8d 0d 4a 3a e5 01 	lea    rcx,[rip+0x1e53a4a]        # 0x14264a3f0
   1407f69a6:	e8 b5 2f 2e 00       	call   0x140ad9960
   1407f69ab:	90                   	nop
   1407f69ac:	eb 73                	jmp    0x1407f6a21
   1407f69ae:	48 8d 15 cb 80 eb 00 	lea    rdx,[rip+0xeb80cb]        # 0x1416aea80
   1407f69b5:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f69b9:	e8 92 17 87 ff       	call   0x140068150
   1407f69be:	90                   	nop
   1407f69bf:	45 33 c9             	xor    r9d,r9d
   1407f69c2:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f69c6:	48 8d 0d 23 3a e5 01 	lea    rcx,[rip+0x1e53a23]        # 0x14264a3f0
   1407f69cd:	e8 8e 2f 2e 00       	call   0x140ad9960
   1407f69d2:	90                   	nop
   1407f69d3:	eb 4c                	jmp    0x1407f6a21
   1407f69d5:	48 8d 15 84 80 eb 00 	lea    rdx,[rip+0xeb8084]        # 0x1416aea60
   1407f69dc:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f69e0:	e8 6b 17 87 ff       	call   0x140068150
   1407f69e5:	90                   	nop
   1407f69e6:	45 33 c9             	xor    r9d,r9d
   1407f69e9:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f69ed:	48 8d 0d fc 39 e5 01 	lea    rcx,[rip+0x1e539fc]        # 0x14264a3f0
   1407f69f4:	e8 67 2f 2e 00       	call   0x140ad9960
   1407f69f9:	90                   	nop
   1407f69fa:	eb 25                	jmp    0x1407f6a21
   1407f69fc:	48 8d 15 dd 7f eb 00 	lea    rdx,[rip+0xeb7fdd]        # 0x1416ae9e0
   1407f6a03:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6a07:	e8 44 17 87 ff       	call   0x140068150
   1407f6a0c:	90                   	nop
   1407f6a0d:	45 33 c9             	xor    r9d,r9d
   1407f6a10:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f6a14:	48 8d 0d d5 39 e5 01 	lea    rcx,[rip+0x1e539d5]        # 0x14264a3f0
   1407f6a1b:	e8 40 2f 2e 00       	call   0x140ad9960
   1407f6a20:	90                   	nop
   1407f6a21:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6a25:	e8 26 8e 87 ff       	call   0x14006f850
   1407f6a2a:	41 f6 45 08 20       	test   BYTE PTR [r13+0x8],0x20
   1407f6a2f:	0f 84 8c 00 00 00    	je     0x1407f6ac1
   1407f6a35:	c7 05 3d 3a e5 01 07 	mov    DWORD PTR [rip+0x1e53a3d],0x1010007        # 0x14264a47c
   1407f6a3c:	00 01 01 
   1407f6a3f:	41 8d 47 de          	lea    eax,[r15-0x22]
   1407f6a43:	89 05 2b 3a e5 01    	mov    DWORD PTR [rip+0x1e53a2b],eax        # 0x14264a474
   1407f6a49:	b8 04 00 00 00       	mov    eax,0x4
   1407f6a4e:	89 05 24 3a e5 01    	mov    DWORD PTR [rip+0x1e53a24],eax        # 0x14264a478
   1407f6a54:	0f 57 c0             	xorps  xmm0,xmm0
   1407f6a57:	0f 11 45 a8          	movups XMMWORD PTR [rbp-0x58],xmm0
   1407f6a5b:	b9 30 00 00 00       	mov    ecx,0x30
   1407f6a60:	e8 6b 9d 87 ff       	call   0x1400707d0
   1407f6a65:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
   1407f6a69:	66 0f 6f 05 cf 48 f9 	movdqa xmm0,XMMWORD PTR [rip+0xf948cf]        # 0x14178b340
   1407f6a70:	00 
   1407f6a71:	f3 0f 7f 45 b8       	movdqu XMMWORD PTR [rbp-0x48],xmm0
   1407f6a76:	0f 10 05 3b 7f eb 00 	movups xmm0,XMMWORD PTR [rip+0xeb7f3b]        # 0x1416ae9b8
   1407f6a7d:	0f 11 00             	movups XMMWORD PTR [rax],xmm0
   1407f6a80:	0f 10 0d 41 7f eb 00 	movups xmm1,XMMWORD PTR [rip+0xeb7f41]        # 0x1416ae9c8
   1407f6a87:	0f 11 48 10          	movups XMMWORD PTR [rax+0x10],xmm1
   1407f6a8b:	0f b7 0d 46 7f eb 00 	movzx  ecx,WORD PTR [rip+0xeb7f46]        # 0x1416ae9d8
   1407f6a92:	66 89 48 20          	mov    WORD PTR [rax+0x20],cx
   1407f6a96:	c6 40 22 00          	mov    BYTE PTR [rax+0x22],0x0
   1407f6a9a:	45 33 c9             	xor    r9d,r9d
   1407f6a9d:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   1407f6aa1:	48 8d 0d 48 39 e5 01 	lea    rcx,[rip+0x1e53948]        # 0x14264a3f0
   1407f6aa8:	e8 b3 2e 2e 00       	call   0x140ad9960
   1407f6aad:	90                   	nop
   1407f6aae:	48 8d 4d a8          	lea    rcx,[rbp-0x58]
   1407f6ab2:	e8 99 8d 87 ff       	call   0x14006f850
   1407f6ab7:	eb 08                	jmp    0x1407f6ac1
   1407f6ab9:	48 8b cf             	mov    rcx,rdi
   1407f6abc:	e8 1f 6b 01 00       	call   0x14080d5e0
   1407f6ac1:	48 8b 4d 30          	mov    rcx,QWORD PTR [rbp+0x30]
   1407f6ac5:	48 33 cc             	xor    rcx,rsp
   1407f6ac8:	e8 93 2b d4 00       	call   0x141539660
   1407f6acd:	4c 8d 9c 24 40 01 00 	lea    r11,[rsp+0x140]
   1407f6ad4:	00 
   1407f6ad5:	49 8b 5b 38          	mov    rbx,QWORD PTR [r11+0x38]
   1407f6ad9:	49 8b 73 40          	mov    rsi,QWORD PTR [r11+0x40]
   1407f6add:	49 8b 7b 48          	mov    rdi,QWORD PTR [r11+0x48]
   1407f6ae1:	49 8b e3             	mov    rsp,r11
   1407f6ae4:	41 5f                	pop    r15
   1407f6ae6:	41 5e                	pop    r14
   1407f6ae8:	41 5d                	pop    r13
   1407f6aea:	41 5c                	pop    r12
   1407f6aec:	5d                   	pop    rbp
   1407f6aed:	c3                   	ret
   1407f6aee:	66 90                	xchg   ax,ax
   1407f6af0:	a8 41                	test   al,0x41
   1407f6af2:	7f 00                	jg     0x1407f6af4
   1407f6af4:	fe 40 7f             	inc    BYTE PTR [rax+0x7f]
   1407f6af7:	00 ba 42 7f 00 66    	add    BYTE PTR [rdx+0x66007f42],bh
   1407f6afd:	43 7f 00             	rex.XB jg 0x1407f6b00
   1407f6b00:	f9                   	stc
   1407f6b01:	43 7f 00             	rex.XB jg 0x1407f6b04
   1407f6b04:	c1 45 7f 00          	rol    DWORD PTR [rbp+0x7f],0x0
   1407f6b08:	0a 49 7f             	or     cl,BYTE PTR [rcx+0x7f]
   1407f6b0b:	00 b3 51 7f 00 40    	add    BYTE PTR [rbx+0x40007f51],dh
   1407f6b11:	42 7f 00             	rex.X jg 0x1407f6b14
   1407f6b14:	7b 48                	jnp    0x1407f6b5e
   1407f6b16:	7f 00                	jg     0x1407f6b18
   1407f6b18:	dd 4e 7f             	fisttp QWORD PTR [rsi+0x7f]
   1407f6b1b:	00 6b 50             	add    BYTE PTR [rbx+0x50],ch
   1407f6b1e:	7f 00                	jg     0x1407f6b20
   1407f6b20:	99                   	cdq
   1407f6b21:	49 7f 00             	rex.WB jg 0x1407f6b24
   1407f6b24:	48                   	rex.W
   1407f6b25:	46 7f 00             	rex.RX jg 0x1407f6b28
   1407f6b28:	5d                   	pop    rbp
   1407f6b29:	46 7f 00             	rex.RX jg 0x1407f6b2c
   1407f6b2c:	83 46 7f 00          	add    DWORD PTR [rsi+0x7f],0x0
   1407f6b30:	98                   	cwde
   1407f6b31:	46 7f 00             	rex.RX jg 0x1407f6b34
   1407f6b34:	ef                   	out    dx,eax
   1407f6b35:	46 7f 00             	rex.RX jg 0x1407f6b38
   1407f6b38:	7f 47                	jg     0x1407f6b81
   1407f6b3a:	7f 00                	jg     0x1407f6b3c
   1407f6b3c:	94                   	xchg   esp,eax
   1407f6b3d:	47 7f 00             	rex.RXB jg 0x1407f6b40
   1407f6b40:	a9 47 7f 00 be       	test   eax,0xbe007f47
   1407f6b45:	47 7f 00             	rex.RXB jg 0x1407f6b48
   1407f6b48:	73 47                	jae    0x1407f6b91
   1407f6b4a:	7f 00                	jg     0x1407f6b4c
   1407f6b4c:	36 47 7f 00          	ss rex.RXB jg 0x1407f6b50
   1407f6b50:	c5 46 7f             	(bad)
   1407f6b53:	00 da                	add    dl,bl
   1407f6b55:	46 7f 00             	rex.RX jg 0x1407f6b58
   1407f6b58:	d3 47 7f             	rol    DWORD PTR [rdi+0x7f],cl
   1407f6b5b:	00 54 4e 7f          	add    BYTE PTR [rsi+rcx*2+0x7f],dl
   1407f6b5f:	00 5d 4e             	add    BYTE PTR [rbp+0x4e],bl
   1407f6b62:	7f 00                	jg     0x1407f6b64
   1407f6b64:	66 4e 7f 00          	data16 rex.WRX jg 0x1407f6b68
   1407f6b68:	78 4e                	js     0x1407f6bb8
   1407f6b6a:	7f 00                	jg     0x1407f6b6c
   1407f6b6c:	6f                   	outs   dx,DWORD PTR [rsi]
   1407f6b6d:	4e 7f 00             	rex.WRX jg 0x1407f6b70
   1407f6b70:	81 4e 7f 00 8a 4e 7f 	or     DWORD PTR [rsi+0x7f],0x7f4e8a00
   1407f6b77:	00 93 4e 7f 00 a3    	add    BYTE PTR [rbx-0x5cff80b2],dl
   1407f6b7d:	4e 7f 00             	rex.WRX jg 0x1407f6b80
   1407f6b80:	00 08                	add    BYTE PTR [rax],cl
   1407f6b82:	08 08                	or     BYTE PTR [rax],cl
   1407f6b84:	01 08                	add    DWORD PTR [rax],ecx
   1407f6b86:	08 08                	or     BYTE PTR [rax],cl
   1407f6b88:	02 08                	add    cl,BYTE PTR [rax]
   1407f6b8a:	08 08                	or     BYTE PTR [rax],cl
   1407f6b8c:	03 08                	add    ecx,DWORD PTR [rax]
   1407f6b8e:	08 08                	or     BYTE PTR [rax],cl
   1407f6b90:	04 08                	add    al,0x8
   1407f6b92:	08 08                	or     BYTE PTR [rax],cl
   1407f6b94:	05 08 08 08 06       	add    eax,0x6080808
   1407f6b99:	08 08                	or     BYTE PTR [rax],cl
   1407f6b9b:	08 07                	or     BYTE PTR [rdi],al
   1407f6b9d:	0f 1f 00             	nop    DWORD PTR [rax]
   1407f6ba0:	62 57 7f 00 6e       	(bad)
   1407f6ba5:	57                   	push   rdi
   1407f6ba6:	7f 00                	jg     0x1407f6ba8
   1407f6ba8:	77 57                	ja     0x1407f6c01
   1407f6baa:	7f 00                	jg     0x1407f6bac
   1407f6bac:	80 57 7f 00          	adc    BYTE PTR [rdi+0x7f],0x0
   1407f6bb0:	89 57 7f             	mov    DWORD PTR [rdi+0x7f],edx
   1407f6bb3:	00 92 57 7f 00 9b    	add    BYTE PTR [rdx-0x64ff80a9],dl
   1407f6bb9:	57                   	push   rdi
   1407f6bba:	7f 00                	jg     0x1407f6bbc
   1407f6bbc:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   1407f6bbd:	57                   	push   rdi
   1407f6bbe:	7f 00                	jg     0x1407f6bc0
   1407f6bc0:	ad                   	lods   eax,DWORD PTR [rsi]
   1407f6bc1:	57                   	push   rdi
   1407f6bc2:	7f 00                	jg     0x1407f6bc4
   1407f6bc4:	b6 57                	mov    dh,0x57
   1407f6bc6:	7f 00                	jg     0x1407f6bc8
   1407f6bc8:	bf 57 7f 00 c8       	mov    edi,0xc8007f57
   1407f6bcd:	57                   	push   rdi
   1407f6bce:	7f 00                	jg     0x1407f6bd0
   1407f6bd0:	d1 57 7f             	rcl    DWORD PTR [rdi+0x7f],1
   1407f6bd3:	00 da                	add    dl,bl
   1407f6bd5:	57                   	push   rdi
   1407f6bd6:	7f 00                	jg     0x1407f6bd8
   1407f6bd8:	e3 57                	jrcxz  0x1407f6c31
   1407f6bda:	7f 00                	jg     0x1407f6bdc
   1407f6bdc:	ec                   	in     al,dx
   1407f6bdd:	57                   	push   rdi
   1407f6bde:	7f 00                	jg     0x1407f6be0
   1407f6be0:	df 68 7f             	fild   QWORD PTR [rax+0x7f]
   1407f6be3:	00 09                	add    BYTE PTR [rcx],cl
   1407f6be5:	69 7f 00 33 69 7f 00 	imul   edi,DWORD PTR [rdi+0x0],0x7f6933
   1407f6bec:	87 69 7f             	xchg   DWORD PTR [rcx+0x7f],ebp
   1407f6bef:	00 5d 69             	add    BYTE PTR [rbp+0x69],bl
   1407f6bf2:	7f 00                	jg     0x1407f6bf4
   1407f6bf4:	ae                   	scas   al,BYTE PTR [rdi]
   1407f6bf5:	69 7f 00 d5 69 7f 00 	imul   edi,DWORD PTR [rdi+0x0],0x7f69d5
   1407f6bfc:	fc                   	cld
   1407f6bfd:	69 7f 00 2a 6a 7f 00 	imul   edi,DWORD PTR [rdi+0x0],0x7f6a2a
   1407f6c04:	00 08                	add    BYTE PTR [rax],cl
   1407f6c06:	08 08                	or     BYTE PTR [rax],cl
   1407f6c08:	01 08                	add    DWORD PTR [rax],ecx
   1407f6c0a:	08 08                	or     BYTE PTR [rax],cl
   1407f6c0c:	02 08                	add    cl,BYTE PTR [rax]
   1407f6c0e:	08 08                	or     BYTE PTR [rax],cl
   1407f6c10:	03 08                	add    ecx,DWORD PTR [rax]
   1407f6c12:	08 08                	or     BYTE PTR [rax],cl
   1407f6c14:	04 08                	add    al,0x8
   1407f6c16:	08 08                	or     BYTE PTR [rax],cl
   1407f6c18:	05 08 08 08 06       	add    eax,0x6080808
   1407f6c1d:	08 08                	or     BYTE PTR [rax],cl
   1407f6c1f:	08 07                	or     BYTE PTR [rdi],al
