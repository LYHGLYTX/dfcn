
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014052eb70 <.text+0x52db70>:
   14052eb70:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   14052eb75:	57                   	push   rdi
   14052eb76:	48 83 ec 20          	sub    rsp,0x20
   14052eb7a:	48 c7 42 10 00 00 00 	mov    QWORD PTR [rdx+0x10],0x0
   14052eb81:	00 
   14052eb82:	48 8b da             	mov    rbx,rdx
   14052eb85:	48 83 7a 18 0f       	cmp    QWORD PTR [rdx+0x18],0xf
   14052eb8a:	8b f9                	mov    edi,ecx
   14052eb8c:	48 8b c2             	mov    rax,rdx
   14052eb8f:	76 03                	jbe    0x14052eb94
   14052eb91:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14052eb94:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14052eb97:	45 84 c0             	test   r8b,r8b
   14052eb9a:	0f 84 ea 00 00 00    	je     0x14052ec8a
   14052eba0:	85 ff                	test   edi,edi
   14052eba2:	79 17                	jns    0x14052ebbb
   14052eba4:	f7 df                	neg    edi
   14052eba6:	48 8d 15 9f cb 11 01 	lea    rdx,[rip+0x111cb9f]        # 0x14164b74c
   14052ebad:	41 b8 01 00 00 00    	mov    r8d,0x1
   14052ebb3:	48 8b cb             	mov    rcx,rbx
   14052ebb6:	e8 15 0d b4 ff       	call   0x14006f8d0
   14052ebbb:	48 8b d3             	mov    rdx,rbx
   14052ebbe:	8b cf                	mov    ecx,edi
   14052ebc0:	e8 6b d5 ff ff       	call   0x14052c130
   14052ebc5:	b8 67 66 66 66       	mov    eax,0x66666667
   14052ebca:	8b cf                	mov    ecx,edi
   14052ebcc:	f7 ef                	imul   edi
   14052ebce:	c1 fa 02             	sar    edx,0x2
   14052ebd1:	8b c2                	mov    eax,edx
   14052ebd3:	c1 e8 1f             	shr    eax,0x1f
   14052ebd6:	03 d0                	add    edx,eax
   14052ebd8:	8d 04 92             	lea    eax,[rdx+rdx*4]
   14052ebdb:	03 c0                	add    eax,eax
   14052ebdd:	2b c8                	sub    ecx,eax
   14052ebdf:	83 e9 01             	sub    ecx,0x1
   14052ebe2:	74 76                	je     0x14052ec5a
   14052ebe4:	83 e9 01             	sub    ecx,0x1
   14052ebe7:	74 41                	je     0x14052ec2a
   14052ebe9:	83 f9 01             	cmp    ecx,0x1
   14052ebec:	74 0c                	je     0x14052ebfa
   14052ebee:	48 8d 15 9f da 0b 01 	lea    rdx,[rip+0x10bda9f]        # 0x1415ec694
   14052ebf5:	e9 2c 04 00 00       	jmp    0x14052f026
   14052ebfa:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052ebff:	f7 ef                	imul   edi
   14052ec01:	c1 fa 05             	sar    edx,0x5
   14052ec04:	8b c2                	mov    eax,edx
   14052ec06:	c1 e8 1f             	shr    eax,0x1f
   14052ec09:	03 d0                	add    edx,eax
   14052ec0b:	6b c2 64             	imul   eax,edx,0x64
   14052ec0e:	48 8d 15 7f da 0b 01 	lea    rdx,[rip+0x10bda7f]        # 0x1415ec694
   14052ec15:	2b f8                	sub    edi,eax
   14052ec17:	48 8d 05 72 da 0b 01 	lea    rax,[rip+0x10bda72]        # 0x1415ec690
   14052ec1e:	83 ff 0d             	cmp    edi,0xd
   14052ec21:	48 0f 45 d0          	cmovne rdx,rax
   14052ec25:	e9 fc 03 00 00       	jmp    0x14052f026
   14052ec2a:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052ec2f:	f7 ef                	imul   edi
   14052ec31:	c1 fa 05             	sar    edx,0x5
   14052ec34:	8b c2                	mov    eax,edx
   14052ec36:	c1 e8 1f             	shr    eax,0x1f
   14052ec39:	03 d0                	add    edx,eax
   14052ec3b:	6b c2 64             	imul   eax,edx,0x64
   14052ec3e:	48 8d 15 4f da 0b 01 	lea    rdx,[rip+0x10bda4f]        # 0x1415ec694
   14052ec45:	2b f8                	sub    edi,eax
   14052ec47:	48 8d 05 4e da 0b 01 	lea    rax,[rip+0x10bda4e]        # 0x1415ec69c
   14052ec4e:	83 ff 0c             	cmp    edi,0xc
   14052ec51:	48 0f 45 d0          	cmovne rdx,rax
   14052ec55:	e9 cc 03 00 00       	jmp    0x14052f026
   14052ec5a:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052ec5f:	f7 ef                	imul   edi
   14052ec61:	c1 fa 05             	sar    edx,0x5
   14052ec64:	8b c2                	mov    eax,edx
   14052ec66:	c1 e8 1f             	shr    eax,0x1f
   14052ec69:	03 d0                	add    edx,eax
   14052ec6b:	6b c2 64             	imul   eax,edx,0x64
   14052ec6e:	48 8d 15 1f da 0b 01 	lea    rdx,[rip+0x10bda1f]        # 0x1415ec694
   14052ec75:	2b f8                	sub    edi,eax
   14052ec77:	48 8d 05 1a da 0b 01 	lea    rax,[rip+0x10bda1a]        # 0x1415ec698
   14052ec7e:	83 ff 0b             	cmp    edi,0xb
   14052ec81:	48 0f 45 d0          	cmovne rdx,rax
   14052ec85:	e9 9c 03 00 00       	jmp    0x14052f026
   14052ec8a:	85 ff                	test   edi,edi
   14052ec8c:	79 17                	jns    0x14052eca5
   14052ec8e:	f7 df                	neg    edi
   14052ec90:	48 8d 15 c9 29 12 01 	lea    rdx,[rip+0x11229c9]        # 0x141651660
   14052ec97:	41 b8 09 00 00 00    	mov    r8d,0x9
   14052ec9d:	48 8b cb             	mov    rcx,rbx
   14052eca0:	e8 2b 0c b4 ff       	call   0x14006f8d0
   14052eca5:	83 ff 13             	cmp    edi,0x13
   14052eca8:	0f 87 82 02 00 00    	ja     0x14052ef30
   14052ecae:	48 8d 15 4b 13 ad ff 	lea    rdx,[rip+0xffffffffffad134b]        # 0x140000000
   14052ecb5:	48 63 c7             	movsxd rax,edi
   14052ecb8:	8b 8c 82 40 f0 52 00 	mov    ecx,DWORD PTR [rdx+rax*4+0x52f040]
   14052ecbf:	48 03 ca             	add    rcx,rdx
   14052ecc2:	ff e1                	jmp    rcx
   14052ecc4:	41 b8 06 00 00 00    	mov    r8d,0x6
   14052ecca:	48 8d 15 9b 29 12 01 	lea    rdx,[rip+0x112299b]        # 0x14165166c
   14052ecd1:	48 8b cb             	mov    rcx,rbx
   14052ecd4:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ecd9:	48 83 c4 20          	add    rsp,0x20
   14052ecdd:	5f                   	pop    rdi
   14052ecde:	e9 ed 0b b4 ff       	jmp    0x14006f8d0
   14052ece3:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052ece9:	48 8d 15 60 29 12 01 	lea    rdx,[rip+0x1122960]        # 0x141651650
   14052ecf0:	48 8b cb             	mov    rcx,rbx
   14052ecf3:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ecf8:	48 83 c4 20          	add    rsp,0x20
   14052ecfc:	5f                   	pop    rdi
   14052ecfd:	e9 ce 0b b4 ff       	jmp    0x14006f8d0
   14052ed02:	41 b8 06 00 00 00    	mov    r8d,0x6
   14052ed08:	48 8d 15 49 29 12 01 	lea    rdx,[rip+0x1122949]        # 0x141651658
   14052ed0f:	48 8b cb             	mov    rcx,rbx
   14052ed12:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ed17:	48 83 c4 20          	add    rsp,0x20
   14052ed1b:	5f                   	pop    rdi
   14052ed1c:	e9 af 0b b4 ff       	jmp    0x14006f8d0
   14052ed21:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052ed27:	48 8d 15 12 29 12 01 	lea    rdx,[rip+0x1122912]        # 0x141651640
   14052ed2e:	48 8b cb             	mov    rcx,rbx
   14052ed31:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ed36:	48 83 c4 20          	add    rsp,0x20
   14052ed3a:	5f                   	pop    rdi
   14052ed3b:	e9 90 0b b4 ff       	jmp    0x14006f8d0
   14052ed40:	41 b8 06 00 00 00    	mov    r8d,0x6
   14052ed46:	48 8d 15 fb 28 12 01 	lea    rdx,[rip+0x11228fb]        # 0x141651648
   14052ed4d:	48 8b cb             	mov    rcx,rbx
   14052ed50:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ed55:	48 83 c4 20          	add    rsp,0x20
   14052ed59:	5f                   	pop    rdi
   14052ed5a:	e9 71 0b b4 ff       	jmp    0x14006f8d0
   14052ed5f:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052ed65:	48 8d 15 c4 28 12 01 	lea    rdx,[rip+0x11228c4]        # 0x141651630
   14052ed6c:	48 8b cb             	mov    rcx,rbx
   14052ed6f:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ed74:	48 83 c4 20          	add    rsp,0x20
   14052ed78:	5f                   	pop    rdi
   14052ed79:	e9 52 0b b4 ff       	jmp    0x14006f8d0
   14052ed7e:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052ed84:	48 8d 15 ad 28 12 01 	lea    rdx,[rip+0x11228ad]        # 0x141651638
   14052ed8b:	48 8b cb             	mov    rcx,rbx
   14052ed8e:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ed93:	48 83 c4 20          	add    rsp,0x20
   14052ed97:	5f                   	pop    rdi
   14052ed98:	e9 33 0b b4 ff       	jmp    0x14006f8d0
   14052ed9d:	41 b8 07 00 00 00    	mov    r8d,0x7
   14052eda3:	48 8d 15 16 29 12 01 	lea    rdx,[rip+0x1122916]        # 0x1416516c0
   14052edaa:	48 8b cb             	mov    rcx,rbx
   14052edad:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052edb2:	48 83 c4 20          	add    rsp,0x20
   14052edb6:	5f                   	pop    rdi
   14052edb7:	e9 14 0b b4 ff       	jmp    0x14006f8d0
   14052edbc:	41 b8 06 00 00 00    	mov    r8d,0x6
   14052edc2:	48 8d 15 ff 28 12 01 	lea    rdx,[rip+0x11228ff]        # 0x1416516c8
   14052edc9:	48 8b cb             	mov    rcx,rbx
   14052edcc:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052edd1:	48 83 c4 20          	add    rsp,0x20
   14052edd5:	5f                   	pop    rdi
   14052edd6:	e9 f5 0a b4 ff       	jmp    0x14006f8d0
   14052eddb:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052ede1:	48 8d 15 c8 28 12 01 	lea    rdx,[rip+0x11228c8]        # 0x1416516b0
   14052ede8:	48 8b cb             	mov    rcx,rbx
   14052edeb:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052edf0:	48 83 c4 20          	add    rsp,0x20
   14052edf4:	5f                   	pop    rdi
   14052edf5:	e9 d6 0a b4 ff       	jmp    0x14006f8d0
   14052edfa:	41 b8 05 00 00 00    	mov    r8d,0x5
   14052ee00:	48 8d 15 b1 28 12 01 	lea    rdx,[rip+0x11228b1]        # 0x1416516b8
   14052ee07:	48 8b cb             	mov    rcx,rbx
   14052ee0a:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ee0f:	48 83 c4 20          	add    rsp,0x20
   14052ee13:	5f                   	pop    rdi
   14052ee14:	e9 b7 0a b4 ff       	jmp    0x14006f8d0
   14052ee19:	41 b8 08 00 00 00    	mov    r8d,0x8
   14052ee1f:	48 8d 15 72 28 12 01 	lea    rdx,[rip+0x1122872]        # 0x141651698
   14052ee26:	48 8b cb             	mov    rcx,rbx
   14052ee29:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ee2e:	48 83 c4 20          	add    rsp,0x20
   14052ee32:	5f                   	pop    rdi
   14052ee33:	e9 98 0a b4 ff       	jmp    0x14006f8d0
   14052ee38:	41 b8 07 00 00 00    	mov    r8d,0x7
   14052ee3e:	48 8d 15 63 28 12 01 	lea    rdx,[rip+0x1122863]        # 0x1416516a8
   14052ee45:	48 8b cb             	mov    rcx,rbx
   14052ee48:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ee4d:	48 83 c4 20          	add    rsp,0x20
   14052ee51:	5f                   	pop    rdi
   14052ee52:	e9 79 0a b4 ff       	jmp    0x14006f8d0
   14052ee57:	41 b8 0a 00 00 00    	mov    r8d,0xa
   14052ee5d:	48 8d 15 14 28 12 01 	lea    rdx,[rip+0x1122814]        # 0x141651678
   14052ee64:	48 8b cb             	mov    rcx,rbx
   14052ee67:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ee6c:	48 83 c4 20          	add    rsp,0x20
   14052ee70:	5f                   	pop    rdi
   14052ee71:	e9 5a 0a b4 ff       	jmp    0x14006f8d0
   14052ee76:	41 b8 0a 00 00 00    	mov    r8d,0xa
   14052ee7c:	48 8d 15 05 28 12 01 	lea    rdx,[rip+0x1122805]        # 0x141651688
   14052ee83:	48 8b cb             	mov    rcx,rbx
   14052ee86:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ee8b:	48 83 c4 20          	add    rsp,0x20
   14052ee8f:	5f                   	pop    rdi
   14052ee90:	e9 3b 0a b4 ff       	jmp    0x14006f8d0
   14052ee95:	41 b8 09 00 00 00    	mov    r8d,0x9
   14052ee9b:	48 8d 15 16 29 12 01 	lea    rdx,[rip+0x1122916]        # 0x1416517b8
   14052eea2:	48 8b cb             	mov    rcx,rbx
   14052eea5:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052eeaa:	48 83 c4 20          	add    rsp,0x20
   14052eeae:	5f                   	pop    rdi
   14052eeaf:	e9 1c 0a b4 ff       	jmp    0x14006f8d0
   14052eeb4:	41 b8 09 00 00 00    	mov    r8d,0x9
   14052eeba:	48 8d 15 07 29 12 01 	lea    rdx,[rip+0x1122907]        # 0x1416517c8
   14052eec1:	48 8b cb             	mov    rcx,rbx
   14052eec4:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052eec9:	48 83 c4 20          	add    rsp,0x20
   14052eecd:	5f                   	pop    rdi
   14052eece:	e9 fd 09 b4 ff       	jmp    0x14006f8d0
   14052eed3:	41 b8 0b 00 00 00    	mov    r8d,0xb
   14052eed9:	48 8d 15 b8 28 12 01 	lea    rdx,[rip+0x11228b8]        # 0x141651798
   14052eee0:	48 8b cb             	mov    rcx,rbx
   14052eee3:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052eee8:	48 83 c4 20          	add    rsp,0x20
   14052eeec:	5f                   	pop    rdi
   14052eeed:	e9 de 09 b4 ff       	jmp    0x14006f8d0
   14052eef2:	41 b8 0a 00 00 00    	mov    r8d,0xa
   14052eef8:	48 8d 15 a9 28 12 01 	lea    rdx,[rip+0x11228a9]        # 0x1416517a8
   14052eeff:	48 8b cb             	mov    rcx,rbx
   14052ef02:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ef07:	48 83 c4 20          	add    rsp,0x20
   14052ef0b:	5f                   	pop    rdi
   14052ef0c:	e9 bf 09 b4 ff       	jmp    0x14006f8d0
   14052ef11:	41 b8 0a 00 00 00    	mov    r8d,0xa
   14052ef17:	48 8d 15 6a 28 12 01 	lea    rdx,[rip+0x112286a]        # 0x141651788
   14052ef1e:	48 8b cb             	mov    rcx,rbx
   14052ef21:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ef26:	48 83 c4 20          	add    rsp,0x20
   14052ef2a:	5f                   	pop    rdi
   14052ef2b:	e9 a0 09 b4 ff       	jmp    0x14006f8d0
   14052ef30:	48 8b d3             	mov    rdx,rbx
   14052ef33:	8b cf                	mov    ecx,edi
   14052ef35:	e8 f6 d1 ff ff       	call   0x14052c130
   14052ef3a:	b8 67 66 66 66       	mov    eax,0x66666667
   14052ef3f:	8b cf                	mov    ecx,edi
   14052ef41:	f7 ef                	imul   edi
   14052ef43:	c1 fa 02             	sar    edx,0x2
   14052ef46:	8b c2                	mov    eax,edx
   14052ef48:	c1 e8 1f             	shr    eax,0x1f
   14052ef4b:	03 d0                	add    edx,eax
   14052ef4d:	8d 04 92             	lea    eax,[rdx+rdx*4]
   14052ef50:	03 c0                	add    eax,eax
   14052ef52:	2b c8                	sub    ecx,eax
   14052ef54:	83 e9 01             	sub    ecx,0x1
   14052ef57:	0f 84 a0 00 00 00    	je     0x14052effd
   14052ef5d:	41 b8 02 00 00 00    	mov    r8d,0x2
   14052ef63:	83 e9 01             	sub    ecx,0x1
   14052ef66:	74 58                	je     0x14052efc0
   14052ef68:	83 f9 01             	cmp    ecx,0x1
   14052ef6b:	48 8b cb             	mov    rcx,rbx
   14052ef6e:	74 16                	je     0x14052ef86
   14052ef70:	48 8d 15 1d d7 0b 01 	lea    rdx,[rip+0x10bd71d]        # 0x1415ec694
   14052ef77:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052ef7c:	48 83 c4 20          	add    rsp,0x20
   14052ef80:	5f                   	pop    rdi
   14052ef81:	e9 8a 0a b4 ff       	jmp    0x14006fa10
   14052ef86:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052ef8b:	f7 ef                	imul   edi
   14052ef8d:	c1 fa 05             	sar    edx,0x5
   14052ef90:	8b c2                	mov    eax,edx
   14052ef92:	c1 e8 1f             	shr    eax,0x1f
   14052ef95:	03 d0                	add    edx,eax
   14052ef97:	6b c2 64             	imul   eax,edx,0x64
   14052ef9a:	48 8d 15 f3 d6 0b 01 	lea    rdx,[rip+0x10bd6f3]        # 0x1415ec694
   14052efa1:	2b f8                	sub    edi,eax
   14052efa3:	48 8d 05 e6 d6 0b 01 	lea    rax,[rip+0x10bd6e6]        # 0x1415ec690
   14052efaa:	83 ff 0d             	cmp    edi,0xd
   14052efad:	48 0f 45 d0          	cmovne rdx,rax
   14052efb1:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052efb6:	48 83 c4 20          	add    rsp,0x20
   14052efba:	5f                   	pop    rdi
   14052efbb:	e9 50 0a b4 ff       	jmp    0x14006fa10
   14052efc0:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052efc5:	48 8b cb             	mov    rcx,rbx
   14052efc8:	f7 ef                	imul   edi
   14052efca:	c1 fa 05             	sar    edx,0x5
   14052efcd:	8b c2                	mov    eax,edx
   14052efcf:	c1 e8 1f             	shr    eax,0x1f
   14052efd2:	03 d0                	add    edx,eax
   14052efd4:	6b c2 64             	imul   eax,edx,0x64
   14052efd7:	48 8d 15 b6 d6 0b 01 	lea    rdx,[rip+0x10bd6b6]        # 0x1415ec694
   14052efde:	2b f8                	sub    edi,eax
   14052efe0:	48 8d 05 b5 d6 0b 01 	lea    rax,[rip+0x10bd6b5]        # 0x1415ec69c
   14052efe7:	83 ff 0c             	cmp    edi,0xc
   14052efea:	48 0f 45 d0          	cmovne rdx,rax
   14052efee:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052eff3:	48 83 c4 20          	add    rsp,0x20
   14052eff7:	5f                   	pop    rdi
   14052eff8:	e9 13 0a b4 ff       	jmp    0x14006fa10
   14052effd:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
   14052f002:	f7 ef                	imul   edi
   14052f004:	c1 fa 05             	sar    edx,0x5
   14052f007:	8b c2                	mov    eax,edx
   14052f009:	c1 e8 1f             	shr    eax,0x1f
   14052f00c:	03 d0                	add    edx,eax
   14052f00e:	6b c2 64             	imul   eax,edx,0x64
   14052f011:	48 8d 15 7c d6 0b 01 	lea    rdx,[rip+0x10bd67c]        # 0x1415ec694
   14052f018:	2b f8                	sub    edi,eax
   14052f01a:	83 ff 0b             	cmp    edi,0xb
   14052f01d:	74 07                	je     0x14052f026
   14052f01f:	48 8d 15 72 d6 0b 01 	lea    rdx,[rip+0x10bd672]        # 0x1415ec698
   14052f026:	41 b8 02 00 00 00    	mov    r8d,0x2
   14052f02c:	48 8b cb             	mov    rcx,rbx
   14052f02f:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14052f034:	48 83 c4 20          	add    rsp,0x20
   14052f038:	5f                   	pop    rdi
   14052f039:	e9 d2 09 b4 ff       	jmp    0x14006fa10
   14052f03e:	66 90                	xchg   ax,ax
   14052f040:	c4                   	(bad)
   14052f041:	ec                   	in     al,dx
   14052f042:	52                   	push   rdx
   14052f043:	00 e3                	add    bl,ah
   14052f045:	ec                   	in     al,dx
   14052f046:	52                   	push   rdx
   14052f047:	00 02                	add    BYTE PTR [rdx],al
   14052f049:	ed                   	in     eax,dx
   14052f04a:	52                   	push   rdx
   14052f04b:	00 21                	add    BYTE PTR [rcx],ah
   14052f04d:	ed                   	in     eax,dx
   14052f04e:	52                   	push   rdx
   14052f04f:	00 40 ed             	add    BYTE PTR [rax-0x13],al
   14052f052:	52                   	push   rdx
   14052f053:	00 5f ed             	add    BYTE PTR [rdi-0x13],bl
   14052f056:	52                   	push   rdx
   14052f057:	00 7e ed             	add    BYTE PTR [rsi-0x13],bh
   14052f05a:	52                   	push   rdx
   14052f05b:	00 9d ed 52 00 bc    	add    BYTE PTR [rbp-0x43ffad13],bl
   14052f061:	ed                   	in     eax,dx
   14052f062:	52                   	push   rdx
   14052f063:	00 db                	add    bl,bl
   14052f065:	ed                   	in     eax,dx
   14052f066:	52                   	push   rdx
   14052f067:	00 fa                	add    dl,bh
   14052f069:	ed                   	in     eax,dx
   14052f06a:	52                   	push   rdx
   14052f06b:	00 19                	add    BYTE PTR [rcx],bl
   14052f06d:	ee                   	out    dx,al
   14052f06e:	52                   	push   rdx
   14052f06f:	00 38                	add    BYTE PTR [rax],bh
   14052f071:	ee                   	out    dx,al
   14052f072:	52                   	push   rdx
   14052f073:	00 57 ee             	add    BYTE PTR [rdi-0x12],dl
   14052f076:	52                   	push   rdx
   14052f077:	00 76 ee             	add    BYTE PTR [rsi-0x12],dh
   14052f07a:	52                   	push   rdx
   14052f07b:	00 95 ee 52 00 b4    	add    BYTE PTR [rbp-0x4bffad12],dl
   14052f081:	ee                   	out    dx,al
   14052f082:	52                   	push   rdx
   14052f083:	00 d3                	add    bl,dl
   14052f085:	ee                   	out    dx,al
   14052f086:	52                   	push   rdx
   14052f087:	00 f2                	add    dl,dh
   14052f089:	ee                   	out    dx,al
   14052f08a:	52                   	push   rdx
   14052f08b:	00 11                	add    BYTE PTR [rcx],dl
   14052f08d:	ef                   	out    dx,eax
   14052f08e:	52                   	push   rdx
	...
