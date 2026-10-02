
C:/Users/WIN11/Downloads/df_53_16_win/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140875e80 <.text+0x874e80>:
   140875e80:	40 55                	rex push rbp
   140875e82:	53                   	push   rbx
   140875e83:	56                   	push   rsi
   140875e84:	57                   	push   rdi
   140875e85:	41 54                	push   r12
   140875e87:	41 55                	push   r13
   140875e89:	41 56                	push   r14
   140875e8b:	41 57                	push   r15
   140875e8d:	48 8d ac 24 58 ff ff ff 	lea    rbp,[rsp-0xa8]
   140875e95:	48 81 ec a8 01 00 00 	sub    rsp,0x1a8
   140875e9c:	48 8b 05 9d 01 02 01 	mov    rax,QWORD PTR [rip+0x102019d]        # 0x141896040
   140875ea3:	48 33 c4             	xor    rax,rsp
   140875ea6:	48 89 85 98 00 00 00 	mov    QWORD PTR [rbp+0x98],rax
   140875ead:	41 8b f9             	mov    edi,r9d
   140875eb0:	41 8b d8             	mov    ebx,r8d
   140875eb3:	89 54 24 78          	mov    DWORD PTR [rsp+0x78],edx
   140875eb7:	4c 8b e9             	mov    r13,rcx
   140875eba:	48 89 4c 24 70       	mov    QWORD PTR [rsp+0x70],rcx
   140875ebf:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140875ec4:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
   140875ec7:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
   140875eca:	48 8d 05 0f e4 dc 01 	lea    rax,[rip+0x1dce40f]        # 0x1426442e0
   140875ed1:	80 3d ed 45 b1 01 00 	cmp    BYTE PTR [rip+0x1b145ed],0x0        # 0x14238a4c5
   140875ed8:	74 10                	je     0x140875eea
   140875eda:	4c 8d 45 b4          	lea    r8,[rbp-0x4c]
   140875ede:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   140875ee2:	48 8b c8             	mov    rcx,rax
   140875ee5:	e8 e6 53 84 ff       	call   0x1400bb2d0
   140875eea:	48 8d 45 b0          	lea    rax,[rbp-0x50]
   140875eee:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140875ef3:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   140875ef7:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   140875efc:	48 8d 45 90          	lea    rax,[rbp-0x70]
   140875f00:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140875f05:	4c 8d 4c 24 68       	lea    r9,[rsp+0x68]
   140875f0a:	44 8b c7             	mov    r8d,edi
   140875f0d:	8b d3                	mov    edx,ebx
   140875f0f:	49 8b cd             	mov    rcx,r13
   140875f12:	e8 d9 a6 ff ff       	call   0x1408705f0
   140875f17:	44 8b 74 24 68       	mov    r14d,DWORD PTR [rsp+0x68]
   140875f1c:	8b 7d 90             	mov    edi,DWORD PTR [rbp-0x70]
   140875f1f:	44 8b 65 d0          	mov    r12d,DWORD PTR [rbp-0x30]
   140875f23:	44 8b 7d b0          	mov    r15d,DWORD PTR [rbp-0x50]
   140875f27:	45 3b e7             	cmp    r12d,r15d
   140875f2a:	0f 8f ca 00 00 00    	jg     0x140875ffa
   140875f30:	41 8b f4             	mov    esi,r12d
   140875f33:	41 8b de             	mov    ebx,r14d
   140875f36:	44 3b f7             	cmp    r14d,edi
   140875f39:	0f 8f b0 00 00 00    	jg     0x140875fef
   140875f3f:	90                   	nop
   140875f40:	44 8b c3             	mov    r8d,ebx
   140875f43:	8b d6                	mov    edx,esi
   140875f45:	48 8d 0d 94 e3 dc 01 	lea    rcx,[rip+0x1dce394]        # 0x1426442e0
   140875f4c:	e8 5f 51 84 ff       	call   0x1400bb0b0
   140875f51:	45 33 c0             	xor    r8d,r8d
   140875f54:	33 d2                	xor    edx,edx
   140875f56:	48 8d 0d 83 e3 dc 01 	lea    rcx,[rip+0x1dce383]        # 0x1426442e0
   140875f5d:	e8 be 51 84 ff       	call   0x1400bb120
   140875f62:	41 3b f4             	cmp    esi,r12d
   140875f65:	75 28                	jne    0x140875f8f
   140875f67:	41 3b de             	cmp    ebx,r14d
   140875f6a:	75 08                	jne    0x140875f74
   140875f6c:	8b 15 92 fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc92]        # 0x142645c04
   140875f72:	eb 65                	jmp    0x140875fd9
   140875f74:	48 8d 0d 65 e3 dc 01 	lea    rcx,[rip+0x1dce365]        # 0x1426442e0
   140875f7b:	3b df                	cmp    ebx,edi
   140875f7d:	75 08                	jne    0x140875f87
   140875f7f:	8b 15 97 fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc97]        # 0x142645c1c
   140875f85:	eb 59                	jmp    0x140875fe0
   140875f87:	8b 15 83 fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc83]        # 0x142645c10
   140875f8d:	eb 51                	jmp    0x140875fe0
   140875f8f:	41 3b f7             	cmp    esi,r15d
   140875f92:	75 28                	jne    0x140875fbc
   140875f94:	41 3b de             	cmp    ebx,r14d
   140875f97:	75 08                	jne    0x140875fa1
   140875f99:	8b 15 6d fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc6d]        # 0x142645c0c
   140875f9f:	eb 38                	jmp    0x140875fd9
   140875fa1:	48 8d 0d 38 e3 dc 01 	lea    rcx,[rip+0x1dce338]        # 0x1426442e0
   140875fa8:	3b df                	cmp    ebx,edi
   140875faa:	75 08                	jne    0x140875fb4
   140875fac:	8b 15 72 fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc72]        # 0x142645c24
   140875fb2:	eb 2c                	jmp    0x140875fe0
   140875fb4:	8b 15 5e fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc5e]        # 0x142645c18
   140875fba:	eb 24                	jmp    0x140875fe0
   140875fbc:	41 3b de             	cmp    ebx,r14d
   140875fbf:	75 08                	jne    0x140875fc9
   140875fc1:	8b 15 41 fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc41]        # 0x142645c08
   140875fc7:	eb 10                	jmp    0x140875fd9
   140875fc9:	3b df                	cmp    ebx,edi
   140875fcb:	8b 15 4f fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc4f]        # 0x142645c20
   140875fd1:	74 06                	je     0x140875fd9
   140875fd3:	8b 15 3b fc dc 01    	mov    edx,DWORD PTR [rip+0x1dcfc3b]        # 0x142645c14
   140875fd9:	48 8d 0d 00 e3 dc 01 	lea    rcx,[rip+0x1dce300]        # 0x1426442e0
   140875fe0:	e8 2b 1b 26 00       	call   0x140ad7b10
   140875fe5:	ff c3                	inc    ebx
   140875fe7:	3b df                	cmp    ebx,edi
   140875fe9:	0f 8e 51 ff ff ff    	jle    0x140875f40
   140875fef:	ff c6                	inc    esi
   140875ff1:	41 3b f7             	cmp    esi,r15d
   140875ff4:	0f 8e 39 ff ff ff    	jle    0x140875f33
   140875ffa:	4c 8d 3d df e2 dc 01 	lea    r15,[rip+0x1dce2df]        # 0x1426442e0
   140876001:	41 83 7d 04 01       	cmp    DWORD PTR [r13+0x4],0x1
   140876006:	0f 84 bf 00 00 00    	je     0x1408760cb
   14087600c:	33 f6                	xor    esi,esi
   14087600e:	4c 8d 25 f3 8a dd 01 	lea    r12,[rip+0x1dd8af3]        # 0x14264eb08
   140876015:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140876020:	33 ff                	xor    edi,edi
   140876022:	44 8d 76 f8          	lea    r14d,[rsi-0x8]
   140876026:	48 8d 1d cf 8a dd 01 	lea    rbx,[rip+0x1dd8acf]        # 0x14264eafc
   14087602d:	0f 1f 00             	nop    DWORD PTR [rax]
   140876030:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   140876034:	45 03 c6             	add    r8d,r14d
   140876037:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
   14087603a:	ff c2                	inc    edx
   14087603c:	03 d7                	add    edx,edi
   14087603e:	49 8b cf             	mov    rcx,r15
   140876041:	e8 6a 50 84 ff       	call   0x1400bb0b0
   140876046:	85 f6                	test   esi,esi
   140876048:	75 05                	jne    0x14087604f
   14087604a:	8b 53 e8             	mov    edx,DWORD PTR [rbx-0x18]
   14087604d:	eb 0c                	jmp    0x14087605b
   14087604f:	83 fe 07             	cmp    esi,0x7
   140876052:	75 04                	jne    0x140876058
   140876054:	8b 13                	mov    edx,DWORD PTR [rbx]
   140876056:	eb 03                	jmp    0x14087605b
   140876058:	8b 53 f4             	mov    edx,DWORD PTR [rbx-0xc]
   14087605b:	49 8b cf             	mov    rcx,r15
   14087605e:	e8 ad 1a 26 00       	call   0x140ad7b10
   140876063:	ff c7                	inc    edi
   140876065:	48 83 c3 04          	add    rbx,0x4
   140876069:	49 3b dc             	cmp    rbx,r12
   14087606c:	7c c2                	jl     0x140876030
   14087606e:	ff c6                	inc    esi
   140876070:	83 fe 08             	cmp    esi,0x8
   140876073:	7c ab                	jl     0x140876020
   140876075:	45 33 c0             	xor    r8d,r8d
   140876078:	ba 07 00 00 00       	mov    edx,0x7
   14087607d:	41 b1 01             	mov    r9b,0x1
   140876080:	49 8b cf             	mov    rcx,r15
   140876083:	e8 38 50 84 ff       	call   0x1400bb0c0
   140876088:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   14087608c:	41 83 c0 fa          	add    r8d,0xfffffffa
   140876090:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
   140876093:	83 c2 02             	add    edx,0x2
   140876096:	49 8b cf             	mov    rcx,r15
   140876099:	e8 12 50 84 ff       	call   0x1400bb0b0
   14087609e:	48 8d 15 eb 93 d8 00 	lea    rdx,[rip+0xd893eb]        # 0x1415ff490
   1408760a5:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408760a9:	e8 32 20 7f ff       	call   0x1400680e0
   1408760ae:	90                   	nop
   1408760af:	45 33 c9             	xor    r9d,r9d
   1408760b2:	45 33 c0             	xor    r8d,r8d
   1408760b5:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408760b9:	49 8b cf             	mov    rcx,r15
   1408760bc:	e8 df 08 26 00       	call   0x140ad69a0
   1408760c1:	90                   	nop
   1408760c2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408760c6:	e8 f5 1c 7f ff       	call   0x140067dc0
   1408760cb:	8b 7d d0             	mov    edi,DWORD PTR [rbp-0x30]
   1408760ce:	83 c7 02             	add    edi,0x2
   1408760d1:	45 33 c0             	xor    r8d,r8d
   1408760d4:	ba 07 00 00 00       	mov    edx,0x7
   1408760d9:	41 b1 01             	mov    r9b,0x1
   1408760dc:	49 8b cf             	mov    rcx,r15
   1408760df:	e8 dc 4f 84 ff       	call   0x1400bb0c0
   1408760e4:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   1408760e9:	41 83 c0 02          	add    r8d,0x2
   1408760ed:	8b d7                	mov    edx,edi
   1408760ef:	49 8b cf             	mov    rcx,r15
   1408760f2:	e8 b9 4f 84 ff       	call   0x1400bb0b0
   1408760f7:	49 63 45 04          	movsxd rax,DWORD PTR [r13+0x4]
   1408760fb:	bb 01 00 00 00       	mov    ebx,0x1
   140876100:	4c 8d 05 f9 9e 78 ff 	lea    r8,[rip+0xffffffffff789ef9]        # 0x140000000
   140876107:	83 f8 09             	cmp    eax,0x9
   14087610a:	0f 87 91 03 00 00    	ja     0x1408764a1
   140876110:	41 8b 8c 80 c4 d8 87 00 	mov    ecx,DWORD PTR [r8+rax*4+0x87d8c4]
   140876118:	49 03 c8             	add    rcx,r8
   14087611b:	ff e1                	jmp    rcx
   14087611d:	41 80 bd 1d 03 00 00 00 	cmp    BYTE PTR [r13+0x31d],0x0
   140876125:	74 37                	je     0x14087615e
   140876127:	41 80 bd 1c 03 00 00 00 	cmp    BYTE PTR [r13+0x31c],0x0
   14087612f:	75 2d                	jne    0x14087615e
   140876131:	48 8d 15 90 89 e3 00 	lea    rdx,[rip+0xe38990]        # 0x1416aeac8
   140876138:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087613c:	e8 9f 1f 7f ff       	call   0x1400680e0
   140876141:	90                   	nop
   140876142:	45 33 c9             	xor    r9d,r9d
   140876145:	45 33 c0             	xor    r8d,r8d
   140876148:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087614c:	49 8b cf             	mov    rcx,r15
   14087614f:	e8 4c 08 26 00       	call   0x140ad69a0
   140876154:	90                   	nop
   140876155:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876159:	e9 37 03 00 00       	jmp    0x140876495
   14087615e:	48 8d 15 4b 89 e3 00 	lea    rdx,[rip+0xe3894b]        # 0x1416aeab0
   140876165:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876169:	e8 72 1f 7f ff       	call   0x1400680e0
   14087616e:	90                   	nop
   14087616f:	45 33 c9             	xor    r9d,r9d
   140876172:	45 33 c0             	xor    r8d,r8d
   140876175:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140876179:	49 8b cf             	mov    rcx,r15
   14087617c:	e8 1f 08 26 00       	call   0x140ad69a0
   140876181:	90                   	nop
   140876182:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876186:	e9 0a 03 00 00       	jmp    0x140876495
   14087618b:	4d 8b 45 30          	mov    r8,QWORD PTR [r13+0x30]
   14087618f:	41 f7 80 18 01 00 00 00 00 40 00 	test   DWORD PTR [r8+0x118],0x400000
   14087619a:	74 6b                	je     0x140876207
   14087619c:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408761a0:	e8 7b 94 7f ff       	call   0x14006f620
   1408761a5:	90                   	nop
   1408761a6:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1408761ab:	41 b1 01             	mov    r9b,0x1
   1408761ae:	44 8b c3             	mov    r8d,ebx
   1408761b1:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408761b5:	49 8b 4d 30          	mov    rcx,QWORD PTR [r13+0x30]
   1408761b9:	e8 e2 31 ab 00       	call   0x1413293a0
   1408761be:	45 33 c9             	xor    r9d,r9d
   1408761c1:	41 b0 03             	mov    r8b,0x3
   1408761c4:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408761c8:	49 8b cf             	mov    rcx,r15
   1408761cb:	e8 d0 07 26 00       	call   0x140ad69a0
   1408761d0:	48 8d 15 61 88 e3 00 	lea    rdx,[rip+0xe38861]        # 0x1416aea38
   1408761d7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408761db:	e8 00 1f 7f ff       	call   0x1400680e0
   1408761e0:	90                   	nop
   1408761e1:	45 33 c9             	xor    r9d,r9d
   1408761e4:	45 33 c0             	xor    r8d,r8d
   1408761e7:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408761eb:	49 8b cf             	mov    rcx,r15
   1408761ee:	e8 ad 07 26 00       	call   0x140ad69a0
   1408761f3:	90                   	nop
   1408761f4:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408761f8:	e8 c3 1b 7f ff       	call   0x140067dc0
   1408761fd:	90                   	nop
   1408761fe:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140876202:	e9 8e 02 00 00       	jmp    0x140876495
   140876207:	48 8b 15 f2 8d b6 01 	mov    rdx,QWORD PTR [rip+0x1b68df2]        # 0x1423df000
   14087620e:	48 8d 0d cb 51 b5 01 	lea    rcx,[rip+0x1b551cb]        # 0x1423cb3e0
   140876215:	e8 66 7d c6 00       	call   0x1414ddf80
   14087621a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087621e:	83 f8 ff             	cmp    eax,0xffffffff
   140876221:	0f 85 94 00 00 00    	jne    0x1408762bb
   140876227:	48 8d 15 ea 87 e3 00 	lea    rdx,[rip+0xe387ea]        # 0x1416aea18
   14087622e:	e8 ad 1e 7f ff       	call   0x1400680e0
   140876233:	90                   	nop
   140876234:	45 33 c9             	xor    r9d,r9d
   140876237:	41 b0 03             	mov    r8b,0x3
   14087623a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087623e:	49 8b cf             	mov    rcx,r15
   140876241:	e8 5a 07 26 00       	call   0x140ad69a0
   140876246:	90                   	nop
   140876247:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087624b:	e8 70 1b 7f ff       	call   0x140067dc0
   140876250:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140876254:	e8 c7 93 7f ff       	call   0x14006f620
   140876259:	90                   	nop
   14087625a:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   14087625f:	45 33 c9             	xor    r9d,r9d
   140876262:	44 8b c3             	mov    r8d,ebx
   140876265:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140876269:	49 8b 4d 30          	mov    rcx,QWORD PTR [r13+0x30]
   14087626d:	e8 2e 31 ab 00       	call   0x1413293a0
   140876272:	45 33 c9             	xor    r9d,r9d
   140876275:	41 b0 03             	mov    r8b,0x3
   140876278:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087627c:	49 8b cf             	mov    rcx,r15
   14087627f:	e8 1c 07 26 00       	call   0x140ad69a0
   140876284:	48 8d 15 85 9a d9 00 	lea    rdx,[rip+0xd99a85]        # 0x14160fd10
   14087628b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087628f:	e8 4c 1e 7f ff       	call   0x1400680e0
   140876294:	90                   	nop
   140876295:	45 33 c9             	xor    r9d,r9d
   140876298:	45 33 c0             	xor    r8d,r8d
   14087629b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087629f:	49 8b cf             	mov    rcx,r15
   1408762a2:	e8 f9 06 26 00       	call   0x140ad69a0
   1408762a7:	90                   	nop
   1408762a8:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408762ac:	e8 0f 1b 7f ff       	call   0x140067dc0
   1408762b1:	90                   	nop
   1408762b2:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408762b6:	e9 da 01 00 00       	jmp    0x140876495
   1408762bb:	48 8d 15 b6 87 e3 00 	lea    rdx,[rip+0xe387b6]        # 0x1416aea78
   1408762c2:	e8 19 1e 7f ff       	call   0x1400680e0
   1408762c7:	90                   	nop
   1408762c8:	45 33 c9             	xor    r9d,r9d
   1408762cb:	41 b0 03             	mov    r8b,0x3
   1408762ce:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408762d2:	49 8b cf             	mov    rcx,r15
   1408762d5:	e8 c6 06 26 00       	call   0x140ad69a0
   1408762da:	90                   	nop
   1408762db:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408762df:	e8 dc 1a 7f ff       	call   0x140067dc0
   1408762e4:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408762e8:	e8 33 93 7f ff       	call   0x14006f620
   1408762ed:	90                   	nop
   1408762ee:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   1408762f3:	45 33 c9             	xor    r9d,r9d
   1408762f6:	44 8b c3             	mov    r8d,ebx
   1408762f9:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408762fd:	49 8b 4d 30          	mov    rcx,QWORD PTR [r13+0x30]
   140876301:	e8 9a 30 ab 00       	call   0x1413293a0
   140876306:	45 33 c9             	xor    r9d,r9d
   140876309:	41 b0 03             	mov    r8b,0x3
   14087630c:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140876310:	49 8b cf             	mov    rcx,r15
   140876313:	e8 88 06 26 00       	call   0x140ad69a0
   140876318:	48 8d 15 f1 99 d9 00 	lea    rdx,[rip+0xd999f1]        # 0x14160fd10
   14087631f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876323:	e8 b8 1d 7f ff       	call   0x1400680e0
   140876328:	90                   	nop
   140876329:	45 33 c9             	xor    r9d,r9d
   14087632c:	45 33 c0             	xor    r8d,r8d
   14087632f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140876333:	49 8b cf             	mov    rcx,r15
   140876336:	e8 65 06 26 00       	call   0x140ad69a0
   14087633b:	90                   	nop
   14087633c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876340:	e8 7b 1a 7f ff       	call   0x140067dc0
   140876345:	90                   	nop
   140876346:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087634a:	e9 46 01 00 00       	jmp    0x140876495
   14087634f:	44 8b 4d 90          	mov    r9d,DWORD PTR [rbp-0x70]
   140876353:	41 83 c1 f6          	add    r9d,0xfffffff6
   140876357:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   14087635c:	41 83 c0 02          	add    r8d,0x2
   140876360:	89 7c 24 20          	mov    DWORD PTR [rsp+0x20],edi
   140876364:	49 8b 55 38          	mov    rdx,QWORD PTR [r13+0x38]
   140876368:	49 8b cd             	mov    rcx,r13
   14087636b:	e8 20 a4 ff ff       	call   0x140870790
   140876370:	e9 25 01 00 00       	jmp    0x14087649a
   140876375:	48 8d 15 dc 86 e3 00 	lea    rdx,[rip+0xe386dc]        # 0x1416aea58
   14087637c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876380:	e8 5b 1d 7f ff       	call   0x1400680e0
   140876385:	90                   	nop
   140876386:	45 33 c9             	xor    r9d,r9d
   140876389:	45 33 c0             	xor    r8d,r8d
   14087638c:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140876390:	49 8b cf             	mov    rcx,r15
   140876393:	e8 08 06 26 00       	call   0x140ad69a0
   140876398:	90                   	nop
   140876399:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087639d:	e9 f3 00 00 00       	jmp    0x140876495
   1408763a2:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408763a6:	e8 75 92 7f ff       	call   0x14006f620
   1408763ab:	90                   	nop
   1408763ac:	48 8d 15 75 2c e0 00 	lea    rdx,[rip+0xe02c75]        # 0x141679028
   1408763b3:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408763b7:	e8 54 91 7f ff       	call   0x14006f510
   1408763bc:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   1408763c0:	e8 5b 92 7f ff       	call   0x14006f620
   1408763c5:	90                   	nop
   1408763c6:	49 8b 5d 38          	mov    rbx,QWORD PTR [r13+0x38]
   1408763ca:	49 8d 8d 00 01 00 00 	lea    rcx,[r13+0x100]
   1408763d1:	33 d2                	xor    edx,edx
   1408763d3:	e8 d8 8d 7f ff       	call   0x14006f1b0
   1408763d8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408763db:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   1408763e2:	45 33 c9             	xor    r9d,r9d
   1408763e5:	44 0f b7 42 0c       	movzx  r8d,WORD PTR [rdx+0xc]
   1408763ea:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   1408763ee:	48 8b cb             	mov    rcx,rbx
   1408763f1:	e8 4a 91 ab 00       	call   0x14132f540
   1408763f6:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   1408763fa:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408763fe:	e8 9d 38 84 ff       	call   0x1400b9ca0
   140876403:	48 8d 15 fa cf d9 00 	lea    rdx,[rip+0xd9cffa]        # 0x141613404
   14087640a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087640e:	e8 dd 90 7f ff       	call   0x14006f4f0
   140876413:	45 33 c9             	xor    r9d,r9d
   140876416:	45 33 c0             	xor    r8d,r8d
   140876419:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087641d:	49 8b cf             	mov    rcx,r15
   140876420:	e8 7b 05 26 00       	call   0x140ad69a0
   140876425:	90                   	nop
   140876426:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087642a:	e8 91 19 7f ff       	call   0x140067dc0
   14087642f:	90                   	nop
   140876430:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140876434:	eb 5f                	jmp    0x140876495
   140876436:	48 8d 15 63 84 e3 00 	lea    rdx,[rip+0xe38463]        # 0x1416ae8a0
   14087643d:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140876441:	e8 9a 1c 7f ff       	call   0x1400680e0
   140876446:	90                   	nop
   140876447:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087644b:	e8 d0 91 7f ff       	call   0x14006f620
   140876450:	90                   	nop
   140876451:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140876455:	49 8b 4d 38          	mov    rcx,QWORD PTR [r13+0x38]
   140876459:	e8 12 60 ab 00       	call   0x14132c470
   14087645e:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140876462:	e8 79 49 cb ff       	call   0x14052ade0
   140876467:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087646b:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087646f:	e8 2c 38 84 ff       	call   0x1400b9ca0
   140876474:	45 33 c9             	xor    r9d,r9d
   140876477:	45 33 c0             	xor    r8d,r8d
   14087647a:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087647e:	49 8b cf             	mov    rcx,r15
   140876481:	e8 1a 05 26 00       	call   0x140ad69a0
   140876486:	90                   	nop
   140876487:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087648b:	e8 30 19 7f ff       	call   0x140067dc0
   140876490:	90                   	nop
   140876491:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140876495:	e8 26 19 7f ff       	call   0x140067dc0
   14087649a:	4c 8d 05 5f 9b 78 ff 	lea    r8,[rip+0xffffffffff789b5f]        # 0x140000000
   1408764a1:	49 63 55 04          	movsxd rdx,DWORD PTR [r13+0x4]
   1408764a5:	83 fa 09             	cmp    edx,0x9
   1408764a8:	0f 87 f1 73 00 00    	ja     0x14087d89f
   1408764ae:	41 8b 8c 90 ec d8 87 00 	mov    ecx,DWORD PTR [r8+rdx*4+0x87d8ec]
   1408764b6:	49 03 c8             	add    rcx,r8
   1408764b9:	ff e1                	jmp    rcx
   1408764bb:	44 8b 6c 24 68       	mov    r13d,DWORD PTR [rsp+0x68]
   1408764c0:	41 ff c5             	inc    r13d
   1408764c3:	8b 5d 90             	mov    ebx,DWORD PTR [rbp-0x70]
   1408764c6:	ff cb                	dec    ebx
   1408764c8:	44 8d 7f 02          	lea    r15d,[rdi+0x2]
   1408764cc:	44 89 7d 8c          	mov    DWORD PTR [rbp-0x74],r15d
   1408764d0:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1408764d3:	ff c8                	dec    eax
   1408764d5:	41 2b c7             	sub    eax,r15d
   1408764d8:	ff c0                	inc    eax
   1408764da:	99                   	cdq
   1408764db:	83 e2 07             	and    edx,0x7
   1408764de:	44 8d 24 02          	lea    r12d,[rdx+rax*1]
   1408764e2:	41 c1 fc 03          	sar    r12d,0x3
   1408764e6:	44 89 64 24 60       	mov    DWORD PTR [rsp+0x60],r12d
   1408764eb:	48 8b 74 24 70       	mov    rsi,QWORD PTR [rsp+0x70]
   1408764f0:	48 83 c6 10          	add    rsi,0x10
   1408764f4:	48 8b ce             	mov    rcx,rsi
   1408764f7:	e8 e4 88 7f ff       	call   0x14006ede0
   1408764fc:	8d 7b fe             	lea    edi,[rbx-0x2]
   1408764ff:	41 3b c4             	cmp    eax,r12d
   140876502:	0f 4e fb             	cmovle edi,ebx
   140876505:	89 7c 24 7c          	mov    DWORD PTR [rsp+0x7c],edi
   140876509:	45 8b f7             	mov    r14d,r15d
   14087650c:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   140876511:	8b 58 28             	mov    ebx,DWORD PTR [rax+0x28]
   140876514:	48 8b ce             	mov    rcx,rsi
   140876517:	e8 c4 88 7f ff       	call   0x14006ede0
   14087651c:	41 2b c4             	sub    eax,r12d
   14087651f:	3b d8                	cmp    ebx,eax
   140876521:	7e 0e                	jle    0x140876531
   140876523:	48 8b ce             	mov    rcx,rsi
   140876526:	e8 b5 88 7f ff       	call   0x14006ede0
   14087652b:	48 8b d8             	mov    rbx,rax
   14087652e:	41 2b dc             	sub    ebx,r12d
   140876531:	33 c0                	xor    eax,eax
   140876533:	85 db                	test   ebx,ebx
   140876535:	0f 49 c3             	cmovns eax,ebx
   140876538:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   14087653c:	42 8d 0c 20          	lea    ecx,[rax+r12*1]
   140876540:	89 4c 24 64          	mov    DWORD PTR [rsp+0x64],ecx
   140876544:	3b c1                	cmp    eax,ecx
   140876546:	0f 8d 30 05 00 00    	jge    0x140876a7c
   14087654c:	c7 45 80 52 00 00 00 	mov    DWORD PTR [rbp-0x80],0x52
   140876553:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140876557:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140876560:	4c 63 f8             	movsxd r15,eax
   140876563:	4c 89 7d a8          	mov    QWORD PTR [rbp-0x58],r15
   140876567:	48 8b ce             	mov    rcx,rsi
   14087656a:	e8 71 88 7f ff       	call   0x14006ede0
   14087656f:	4c 3b f8             	cmp    r15,rax
   140876572:	0f 83 fb 04 00 00    	jae    0x140876a73
   140876578:	45 33 c0             	xor    r8d,r8d
   14087657b:	ba 07 00 00 00       	mov    edx,0x7
   140876580:	41 b1 01             	mov    r9b,0x1
   140876583:	48 8d 0d 56 dd dc 01 	lea    rcx,[rip+0x1dcdd56]        # 0x1426442e0
   14087658a:	e8 31 4b 84 ff       	call   0x1400bb0c0
   14087658f:	41 8b f5             	mov    esi,r13d
   140876592:	44 3b ef             	cmp    r13d,edi
   140876595:	0f 8f ba 00 00 00    	jg     0x140876655
   14087659b:	45 8d 66 08          	lea    r12d,[r14+0x8]
   14087659f:	90                   	nop
   1408765a0:	41 8b de             	mov    ebx,r14d
   1408765a3:	45 3b f4             	cmp    r14d,r12d
   1408765a6:	0f 8d 9b 00 00 00    	jge    0x140876647
   1408765ac:	45 8d 7e 07          	lea    r15d,[r14+0x7]
   1408765b0:	41 3b de             	cmp    ebx,r14d
   1408765b3:	7e 0c                	jle    0x1408765c1
   1408765b5:	41 3b df             	cmp    ebx,r15d
   1408765b8:	7d 07                	jge    0x1408765c1
   1408765ba:	bf 01 00 00 00       	mov    edi,0x1
   1408765bf:	eb 0d                	jmp    0x1408765ce
   1408765c1:	33 ff                	xor    edi,edi
   1408765c3:	41 3b df             	cmp    ebx,r15d
   1408765c6:	b8 02 00 00 00       	mov    eax,0x2
   1408765cb:	0f 44 f8             	cmove  edi,eax
   1408765ce:	44 8b c6             	mov    r8d,esi
   1408765d1:	8b d3                	mov    edx,ebx
   1408765d3:	48 8d 0d 06 dd dc 01 	lea    rcx,[rip+0x1dcdd06]        # 0x1426442e0
   1408765da:	e8 d1 4a 84 ff       	call   0x1400bb0b0
   1408765df:	48 8d 05 fa dc dc 01 	lea    rax,[rip+0x1dcdcfa]        # 0x1426442e0
   1408765e6:	41 3b f5             	cmp    esi,r13d
   1408765e9:	75 09                	jne    0x1408765f4
   1408765eb:	8b 94 b8 a8 19 00 00 	mov    edx,DWORD PTR [rax+rdi*4+0x19a8]
   1408765f2:	eb 16                	jmp    0x14087660a
   1408765f4:	3b 74 24 7c          	cmp    esi,DWORD PTR [rsp+0x7c]
   1408765f8:	75 09                	jne    0x140876603
   1408765fa:	8b 94 b8 c0 19 00 00 	mov    edx,DWORD PTR [rax+rdi*4+0x19c0]
   140876601:	eb 07                	jmp    0x14087660a
   140876603:	8b 94 b8 b4 19 00 00 	mov    edx,DWORD PTR [rax+rdi*4+0x19b4]
   14087660a:	48 8d 3d cf dc dc 01 	lea    rdi,[rip+0x1dcdccf]        # 0x1426442e0
   140876611:	48 8b cf             	mov    rcx,rdi
   140876614:	e8 f7 14 26 00       	call   0x140ad7b10
   140876619:	33 d2                	xor    edx,edx
   14087661b:	48 8d 0d 3e 10 b5 01 	lea    rcx,[rip+0x1b5103e]        # 0x1423c7660
   140876622:	e8 f9 b8 7f ff       	call   0x140071f20
   140876627:	84 c0                	test   al,al
   140876629:	74 0d                	je     0x140876638
   14087662b:	41 b0 01             	mov    r8b,0x1
   14087662e:	33 d2                	xor    edx,edx
   140876630:	48 8b cf             	mov    rcx,rdi
   140876633:	e8 e8 4a 84 ff       	call   0x1400bb120
   140876638:	ff c3                	inc    ebx
   14087663a:	41 3b dc             	cmp    ebx,r12d
   14087663d:	0f 8c 6d ff ff ff    	jl     0x1408765b0
   140876643:	8b 7c 24 7c          	mov    edi,DWORD PTR [rsp+0x7c]
   140876647:	ff c6                	inc    esi
   140876649:	3b f7                	cmp    esi,edi
   14087664b:	0f 8e 4f ff ff ff    	jle    0x1408765a0
   140876651:	4c 8b 7d a8          	mov    r15,QWORD PTR [rbp-0x58]
   140876655:	49 8b d7             	mov    rdx,r15
   140876658:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087665d:	48 83 c1 10          	add    rcx,0x10
   140876661:	e8 4a 8b 7f ff       	call   0x14006f1b0
   140876666:	4c 8b 20             	mov    r12,QWORD PTR [rax]
   140876669:	4c 89 65 d8          	mov    QWORD PTR [rbp-0x28],r12
   14087666d:	41 8d 4d 0b          	lea    ecx,[r13+0xb]
   140876671:	41 8d 76 05          	lea    esi,[r14+0x5]
   140876675:	41 8b fd             	mov    edi,r13d
   140876678:	44 3b e9             	cmp    r13d,ecx
   14087667b:	0f 8f 80 00 00 00    	jg     0x140876701
   140876681:	4c 8d 25 58 dc dc 01 	lea    r12,[rip+0x1dcdc58]        # 0x1426442e0
   140876688:	41 3b fd             	cmp    edi,r13d
   14087668b:	75 04                	jne    0x140876691
   14087668d:	33 c0                	xor    eax,eax
   14087668f:	eb 0f                	jmp    0x1408766a0
   140876691:	b8 01 00 00 00       	mov    eax,0x1
   140876696:	3b f9                	cmp    edi,ecx
   140876698:	ba 02 00 00 00       	mov    edx,0x2
   14087669d:	0f 44 c2             	cmove  eax,edx
   1408766a0:	41 8b de             	mov    ebx,r14d
   1408766a3:	44 3b f6             	cmp    r14d,esi
   1408766a6:	7f 4b                	jg     0x1408766f3
   1408766a8:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   1408766ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1408766b0:	44 8b c7             	mov    r8d,edi
   1408766b3:	8b d3                	mov    edx,ebx
   1408766b5:	49 8b cc             	mov    rcx,r12
   1408766b8:	e8 f3 49 84 ff       	call   0x1400bb0b0
   1408766bd:	41 3b de             	cmp    ebx,r14d
   1408766c0:	75 04                	jne    0x1408766c6
   1408766c2:	33 c0                	xor    eax,eax
   1408766c4:	eb 0f                	jmp    0x1408766d5
   1408766c6:	b8 01 00 00 00       	mov    eax,0x1
   1408766cb:	3b de                	cmp    ebx,esi
   1408766cd:	b9 02 00 00 00       	mov    ecx,0x2
   1408766d2:	0f 44 c1             	cmove  eax,ecx
   1408766d5:	49 8d 14 07          	lea    rdx,[r15+rax*1]
   1408766d9:	41 8b 94 94 a0 1b 00 00 	mov    edx,DWORD PTR [r12+rdx*4+0x1ba0]
   1408766e1:	49 8b cc             	mov    rcx,r12
   1408766e4:	e8 27 14 26 00       	call   0x140ad7b10
   1408766e9:	ff c3                	inc    ebx
   1408766eb:	3b de                	cmp    ebx,esi
   1408766ed:	7e c1                	jle    0x1408766b0
   1408766ef:	41 8d 4d 0b          	lea    ecx,[r13+0xb]
   1408766f3:	ff c7                	inc    edi
   1408766f5:	3b f9                	cmp    edi,ecx
   1408766f7:	7e 8f                	jle    0x140876688
   1408766f9:	4c 8b 65 d8          	mov    r12,QWORD PTR [rbp-0x28]
   1408766fd:	4c 8b 7d a8          	mov    r15,QWORD PTR [rbp-0x58]
   140876701:	33 d2                	xor    edx,edx
   140876703:	48 8d 0d 56 0f b5 01 	lea    rcx,[rip+0x1b50f56]        # 0x1423c7660
   14087670a:	e8 11 b8 7f ff       	call   0x140071f20
   14087670f:	84 c0                	test   al,al
   140876711:	0f 84 67 01 00 00    	je     0x14087687e
   140876717:	41 83 bc 24 2c 14 00 00 00 	cmp    DWORD PTR [r12+0x142c],0x0
   140876720:	74 0e                	je     0x140876730
   140876722:	41 f7 84 24 1c 01 00 00 00 40 00 00 	test   DWORD PTR [r12+0x11c],0x4000
   14087672e:	74 08                	je     0x140876738
   140876730:	49 8b cc             	mov    rcx,r12
   140876733:	e8 78 32 94 ff       	call   0x1401b99b0
   140876738:	41 83 bc 24 2c 14 00 00 00 	cmp    DWORD PTR [r12+0x142c],0x0
   140876741:	74 5c                	je     0x14087679f
   140876743:	45 33 c0             	xor    r8d,r8d
   140876746:	ba 07 00 00 00       	mov    edx,0x7
   14087674b:	41 b1 01             	mov    r9b,0x1
   14087674e:	48 8d 3d 8b db dc 01 	lea    rdi,[rip+0x1dcdb8b]        # 0x1426442e0
   140876755:	48 8b cf             	mov    rcx,rdi
   140876758:	e8 63 49 84 ff       	call   0x1400bb0c0
   14087675d:	45 8b c5             	mov    r8d,r13d
   140876760:	41 8b d6             	mov    edx,r14d
   140876763:	48 8b cf             	mov    rcx,rdi
   140876766:	e8 45 49 84 ff       	call   0x1400bb0b0
   14087676b:	c6 44 24 30 00       	mov    BYTE PTR [rsp+0x30],0x0
   140876770:	c7 44 24 28 08 00 00 00 	mov    DWORD PTR [rsp+0x28],0x8
   140876778:	c7 44 24 20 0c 00 00 00 	mov    DWORD PTR [rsp+0x20],0xc
   140876780:	45 33 c9             	xor    r9d,r9d
   140876783:	45 33 c0             	xor    r8d,r8d
   140876786:	41 8b 94 24 2c 14 00 00 	mov    edx,DWORD PTR [r12+0x142c]
   14087678e:	48 8b cf             	mov    rcx,rdi
   140876791:	e8 1a 16 26 00       	call   0x140ad7db0
   140876796:	41 8d 5e 01          	lea    ebx,[r14+0x1]
   14087679a:	e9 21 01 00 00       	jmp    0x1408768c0
   14087679f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408767a3:	e8 78 8e 7f ff       	call   0x14006f620
   1408767a8:	90                   	nop
   1408767a9:	48 8d 45 98          	lea    rax,[rbp-0x68]
   1408767ad:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   1408767b2:	48 c7 44 24 48 00 00 00 00 	mov    QWORD PTR [rsp+0x48],0x0
   1408767bb:	4c 89 64 24 40       	mov    QWORD PTR [rsp+0x40],r12
   1408767c0:	c7 44 24 38 00 08 00 00 	mov    DWORD PTR [rsp+0x38],0x800
   1408767c8:	41 0f b7 84 24 a0 00 00 00 	movzx  eax,WORD PTR [r12+0xa0]
   1408767d1:	66 89 44 24 30       	mov    WORD PTR [rsp+0x30],ax
   1408767d6:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1408767db:	66 89 44 24 28       	mov    WORD PTR [rsp+0x28],ax
   1408767e0:	66 89 44 24 20       	mov    WORD PTR [rsp+0x20],ax
   1408767e5:	45 0f b7 8c 24 2c 01 00 00 	movzx  r9d,WORD PTR [r12+0x12c]
   1408767ee:	45 0f b7 84 24 a4 00 00 00 	movzx  r8d,WORD PTR [r12+0xa4]
   1408767f7:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408767fb:	48 8d 0d 36 01 c7 01 	lea    rcx,[rip+0x1c70136]        # 0x1424e6938
   140876802:	e8 69 be 87 ff       	call   0x1400f2670
   140876807:	8b d8                	mov    ebx,eax
   140876809:	48 8d 3d d0 da dc 01 	lea    rdi,[rip+0x1dcdad0]        # 0x1426442e0
   140876810:	48 8b cf             	mov    rcx,rdi
   140876813:	80 7d 98 00          	cmp    BYTE PTR [rbp-0x68],0x0
   140876817:	74 1a                	je     0x140876833
   140876819:	45 8b c5             	mov    r8d,r13d
   14087681c:	41 8b d6             	mov    edx,r14d
   14087681f:	e8 8c 48 84 ff       	call   0x1400bb0b0
   140876824:	85 db                	test   ebx,ebx
   140876826:	74 47                	je     0x14087686f
   140876828:	41 b9 06 00 00 00    	mov    r9d,0x6
   14087682e:	45 33 c0             	xor    r8d,r8d
   140876831:	eb 1c                	jmp    0x14087684f
   140876833:	45 8d 45 04          	lea    r8d,[r13+0x4]
   140876837:	41 8d 56 03          	lea    edx,[r14+0x3]
   14087683b:	e8 70 48 84 ff       	call   0x1400bb0b0
   140876840:	85 db                	test   ebx,ebx
   140876842:	74 2b                	je     0x14087686f
   140876844:	b8 02 00 00 00       	mov    eax,0x2
   140876849:	44 8b c8             	mov    r9d,eax
   14087684c:	44 8b c0             	mov    r8d,eax
   14087684f:	c6 44 24 30 00       	mov    BYTE PTR [rsp+0x30],0x0
   140876854:	c7 44 24 28 03 00 00 00 	mov    DWORD PTR [rsp+0x28],0x3
   14087685c:	c7 44 24 20 05 00 00 00 	mov    DWORD PTR [rsp+0x20],0x5
   140876864:	8b d3                	mov    edx,ebx
   140876866:	48 8b cf             	mov    rcx,rdi
   140876869:	e8 42 15 26 00       	call   0x140ad7db0
   14087686e:	90                   	nop
   14087686f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876873:	e8 48 15 7f ff       	call   0x140067dc0
   140876878:	41 8d 5e 01          	lea    ebx,[r14+0x1]
   14087687c:	eb 42                	jmp    0x1408768c0
   14087687e:	41 8d 5e 01          	lea    ebx,[r14+0x1]
   140876882:	45 8d 45 02          	lea    r8d,[r13+0x2]
   140876886:	8b d3                	mov    edx,ebx
   140876888:	48 8d 3d 51 da dc 01 	lea    rdi,[rip+0x1dcda51]        # 0x1426442e0
   14087688f:	48 8b cf             	mov    rcx,rdi
   140876892:	e8 19 48 84 ff       	call   0x1400bb0b0
   140876897:	33 d2                	xor    edx,edx
   140876899:	45 33 c9             	xor    r9d,r9d
   14087689c:	41 b0 01             	mov    r8b,0x1
   14087689f:	49 8b cc             	mov    rcx,r12
   1408768a2:	e8 89 82 ab 00       	call   0x14132eb30
   1408768a7:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
   1408768ab:	33 d2                	xor    edx,edx
   1408768ad:	49 8b cc             	mov    rcx,r12
   1408768b0:	ff 10                	call   QWORD PTR [rax]
   1408768b2:	0f b6 d0             	movzx  edx,al
   1408768b5:	41 b0 01             	mov    r8b,0x1
   1408768b8:	48 8b cf             	mov    rcx,rdi
   1408768bb:	e8 60 48 84 ff       	call   0x1400bb120
   1408768c0:	45 8d 45 0d          	lea    r8d,[r13+0xd]
   1408768c4:	8b d3                	mov    edx,ebx
   1408768c6:	48 8b cf             	mov    rcx,rdi
   1408768c9:	e8 e2 47 84 ff       	call   0x1400bb0b0
   1408768ce:	45 33 c0             	xor    r8d,r8d
   1408768d1:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   1408768d5:	41 8b d4             	mov    edx,r12d
   1408768d8:	48 8d 0d e1 18 03 01 	lea    rcx,[rip+0x10318e1]        # 0x1418a81c0
   1408768df:	e8 0c fc 3b 00       	call   0x140c364f0
   1408768e4:	45 8d 45 0f          	lea    r8d,[r13+0xf]
   1408768e8:	8b d3                	mov    edx,ebx
   1408768ea:	48 8b cf             	mov    rcx,rdi
   1408768ed:	e8 be 47 84 ff       	call   0x1400bb0b0
   1408768f2:	49 8b d7             	mov    rdx,r15
   1408768f5:	48 8b 74 24 70       	mov    rsi,QWORD PTR [rsp+0x70]
   1408768fa:	48 83 c6 10          	add    rsi,0x10
   1408768fe:	48 8b ce             	mov    rcx,rsi
   140876901:	e8 aa 88 7f ff       	call   0x14006f1b0
   140876906:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140876909:	e8 d2 b7 f6 ff       	call   0x1407e20e0
   14087690e:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140876912:	e8 09 8d 7f ff       	call   0x14006f620
   140876917:	90                   	nop
   140876918:	49 8b d7             	mov    rdx,r15
   14087691b:	48 8b ce             	mov    rcx,rsi
   14087691e:	e8 8d 88 7f ff       	call   0x14006f1b0
   140876923:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   140876928:	41 b1 01             	mov    r9b,0x1
   14087692b:	41 b8 01 00 00 00    	mov    r8d,0x1
   140876931:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140876935:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140876938:	e8 63 2a ab 00       	call   0x1413293a0
   14087693d:	45 33 c0             	xor    r8d,r8d
   140876940:	ba 07 00 00 00       	mov    edx,0x7
   140876945:	45 33 c9             	xor    r9d,r9d
   140876948:	48 8b cf             	mov    rcx,rdi
   14087694b:	e8 70 47 84 ff       	call   0x1400bb0c0
   140876950:	45 33 c9             	xor    r9d,r9d
   140876953:	45 33 c0             	xor    r8d,r8d
   140876956:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087695a:	48 8b cf             	mov    rcx,rdi
   14087695d:	e8 3e 00 26 00       	call   0x140ad69a0
   140876962:	41 8d 7e 02          	lea    edi,[r14+0x2]
   140876966:	49 8b d7             	mov    rdx,r15
   140876969:	48 8b ce             	mov    rcx,rsi
   14087696c:	e8 3f 88 7f ff       	call   0x14006f1b0
   140876971:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140876974:	48 81 c1 d0 07 00 00 	add    rcx,0x7d0
   14087697b:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   14087697f:	e8 4c 88 7f ff       	call   0x14006f1d0
   140876984:	49 8b d7             	mov    rdx,r15
   140876987:	48 8b ce             	mov    rcx,rsi
   14087698a:	e8 21 88 7f ff       	call   0x14006f1b0
   14087698f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140876992:	48 81 c1 d0 07 00 00 	add    rcx,0x7d0
   140876999:	48 8d 55 c8          	lea    rdx,[rbp-0x38]
   14087699d:	e8 1e 88 7f ff       	call   0x14006f1c0
   1408769a2:	4c 8d 45 c8          	lea    r8,[rbp-0x38]
   1408769a6:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   1408769aa:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   1408769ae:	e8 fd 83 7f ff       	call   0x14006edb0
   1408769b3:	33 d2                	xor    edx,edx
   1408769b5:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   1408769b8:	e8 83 ed 7e ff       	call   0x140065740
   1408769bd:	84 c0                	test   al,al
   1408769bf:	0f 84 82 00 00 00    	je     0x140876a47
   1408769c5:	4c 8d 25 14 d9 dc 01 	lea    r12,[rip+0x1dcd914]        # 0x1426442e0
   1408769cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1408769d0:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   1408769d4:	e8 c7 83 7f ff       	call   0x14006eda0
   1408769d9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408769dc:	83 39 ff             	cmp    DWORD PTR [rcx],0xffffffff
   1408769df:	74 3a                	je     0x140876a1b
   1408769e1:	45 8d 45 12          	lea    r8d,[r13+0x12]
   1408769e5:	8b d7                	mov    edx,edi
   1408769e7:	49 8b cc             	mov    rcx,r12
   1408769ea:	e8 c1 46 84 ff       	call   0x1400bb0b0
   1408769ef:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   1408769f3:	e8 a8 83 7f ff       	call   0x14006eda0
   1408769f8:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   1408769fb:	49 8b d7             	mov    rdx,r15
   1408769fe:	48 8b ce             	mov    rcx,rsi
   140876a01:	e8 aa 87 7f ff       	call   0x14006f1b0
   140876a06:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140876a09:	48 8b cb             	mov    rcx,rbx
   140876a0c:	e8 af 94 fd ff       	call   0x14084fec0
   140876a11:	ff c7                	inc    edi
   140876a13:	41 8d 46 08          	lea    eax,[r14+0x8]
   140876a17:	3b f8                	cmp    edi,eax
   140876a19:	7d 28                	jge    0x140876a43
   140876a1b:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   140876a1f:	e8 6c 83 7f ff       	call   0x14006ed90
   140876a24:	4c 8d 45 c8          	lea    r8,[rbp-0x38]
   140876a28:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   140876a2c:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   140876a30:	e8 7b 83 7f ff       	call   0x14006edb0
   140876a35:	33 d2                	xor    edx,edx
   140876a37:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   140876a3a:	e8 01 ed 7e ff       	call   0x140065740
   140876a3f:	84 c0                	test   al,al
   140876a41:	75 8d                	jne    0x1408769d0
   140876a43:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   140876a47:	41 83 c6 08          	add    r14d,0x8
   140876a4b:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140876a4f:	e8 6c 13 7f ff       	call   0x140067dc0
   140876a54:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   140876a58:	ff c0                	inc    eax
   140876a5a:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140876a5e:	41 ff c4             	inc    r12d
   140876a61:	44 89 65 80          	mov    DWORD PTR [rbp-0x80],r12d
   140876a65:	3b 44 24 64          	cmp    eax,DWORD PTR [rsp+0x64]
   140876a69:	8b 7c 24 7c          	mov    edi,DWORD PTR [rsp+0x7c]
   140876a6d:	0f 8c ed fa ff ff    	jl     0x140876560
   140876a73:	44 8b 64 24 60       	mov    r12d,DWORD PTR [rsp+0x60]
   140876a78:	44 8b 7d 8c          	mov    r15d,DWORD PTR [rbp-0x74]
   140876a7c:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   140876a81:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   140876a85:	e8 56 83 7f ff       	call   0x14006ede0
   140876a8a:	41 3b c4             	cmp    eax,r12d
   140876a8d:	0f 8e 0c 6e 00 00    	jle    0x14087d89f
   140876a93:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876a97:	e8 54 48 84 ff       	call   0x1400bb2f0
   140876a9c:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   140876aa0:	e8 3b 83 7f ff       	call   0x14006ede0
   140876aa5:	44 8d 48 ff          	lea    r9d,[rax-0x1]
   140876aa9:	42 8d 0c e5 fe ff ff ff 	lea    ecx,[r12*8-0x2]
   140876ab1:	41 03 cf             	add    ecx,r15d
   140876ab4:	41 8d 57 01          	lea    edx,[r15+0x1]
   140876ab8:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   140876abc:	89 54 24 28          	mov    DWORD PTR [rsp+0x28],edx
   140876ac0:	44 89 64 24 20       	mov    DWORD PTR [rsp+0x20],r12d
   140876ac5:	45 33 c0             	xor    r8d,r8d
   140876ac8:	8b 53 28             	mov    edx,DWORD PTR [rbx+0x28]
   140876acb:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876acf:	e8 3c 48 84 ff       	call   0x1400bb310
   140876ad4:	44 8d 4f 01          	lea    r9d,[rdi+0x1]
   140876ad8:	0f b6 43 2c          	movzx  eax,BYTE PTR [rbx+0x2c]
   140876adc:	e9 a2 6d 00 00       	jmp    0x14087d883
   140876ae1:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140876ae5:	44 8d 78 02          	lea    r15d,[rax+0x2]
   140876ae9:	8d 70 0c             	lea    esi,[rax+0xc]
   140876aec:	44 8b 65 b0          	mov    r12d,DWORD PTR [rbp-0x50]
   140876af0:	41 83 c4 fd          	add    r12d,0xfffffffd
   140876af4:	44 89 65 8c          	mov    DWORD PTR [rbp-0x74],r12d
   140876af8:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
   140876afb:	44 8d 68 f5          	lea    r13d,[rax-0xb]
   140876aff:	44 89 6d 80          	mov    DWORD PTR [rbp-0x80],r13d
   140876b03:	44 8d 70 fe          	lea    r14d,[rax-0x2]
   140876b07:	48 8d 3d 52 7f dd 01 	lea    rdi,[rip+0x1dd7f52]        # 0x14264ea60
   140876b0e:	48 8d 05 57 7f dd 01 	lea    rax,[rip+0x1dd7f57]        # 0x14264ea6c
   140876b15:	4c 8d 2d c4 d7 dc 01 	lea    r13,[rip+0x1dcd7c4]        # 0x1426442e0
   140876b1c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140876b20:	41 8b df             	mov    ebx,r15d
   140876b23:	44 3b fe             	cmp    r15d,esi
   140876b26:	7f 5f                	jg     0x140876b87
   140876b28:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140876b30:	44 8b c3             	mov    r8d,ebx
   140876b33:	41 8b d4             	mov    edx,r12d
   140876b36:	49 8b cd             	mov    rcx,r13
   140876b39:	e8 72 45 84 ff       	call   0x1400bb0b0
   140876b3e:	41 3b df             	cmp    ebx,r15d
   140876b41:	75 05                	jne    0x140876b48
   140876b43:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   140876b46:	eb 0b                	jmp    0x140876b53
   140876b48:	3b de                	cmp    ebx,esi
   140876b4a:	75 04                	jne    0x140876b50
   140876b4c:	8b 17                	mov    edx,DWORD PTR [rdi]
   140876b4e:	eb 03                	jmp    0x140876b53
   140876b50:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   140876b53:	49 8b cd             	mov    rcx,r13
   140876b56:	e8 b5 0f 26 00       	call   0x140ad7b10
   140876b5b:	33 d2                	xor    edx,edx
   140876b5d:	48 8d 0d fc 0a b5 01 	lea    rcx,[rip+0x1b50afc]        # 0x1423c7660
   140876b64:	e8 b7 b3 7f ff       	call   0x140071f20
   140876b69:	84 c0                	test   al,al
   140876b6b:	74 0d                	je     0x140876b7a
   140876b6d:	41 b0 01             	mov    r8b,0x1
   140876b70:	33 d2                	xor    edx,edx
   140876b72:	49 8b cd             	mov    rcx,r13
   140876b75:	e8 a6 45 84 ff       	call   0x1400bb120
   140876b7a:	ff c3                	inc    ebx
   140876b7c:	3b de                	cmp    ebx,esi
   140876b7e:	7e b0                	jle    0x140876b30
   140876b80:	48 8d 05 e5 7e dd 01 	lea    rax,[rip+0x1dd7ee5]        # 0x14264ea6c
   140876b87:	41 ff c4             	inc    r12d
   140876b8a:	48 83 c7 04          	add    rdi,0x4
   140876b8e:	48 3b f8             	cmp    rdi,rax
   140876b91:	7c 8d                	jl     0x140876b20
   140876b93:	45 33 c0             	xor    r8d,r8d
   140876b96:	ba 07 00 00 00       	mov    edx,0x7
   140876b9b:	41 b1 01             	mov    r9b,0x1
   140876b9e:	4c 8d 25 3b d7 dc 01 	lea    r12,[rip+0x1dcd73b]        # 0x1426442e0
   140876ba5:	49 8b cc             	mov    rcx,r12
   140876ba8:	e8 13 45 84 ff       	call   0x1400bb0c0
   140876bad:	41 8d 5f 02          	lea    ebx,[r15+0x2]
   140876bb1:	44 8b 7d 8c          	mov    r15d,DWORD PTR [rbp-0x74]
   140876bb5:	41 8d 57 01          	lea    edx,[r15+0x1]
   140876bb9:	44 8b c3             	mov    r8d,ebx
   140876bbc:	49 8b cc             	mov    rcx,r12
   140876bbf:	e8 ec 44 84 ff       	call   0x1400bb0b0
   140876bc4:	48 8d 15 dd 09 db 00 	lea    rdx,[rip+0xdb09dd]        # 0x1416275a8
   140876bcb:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876bcf:	e8 0c 15 7f ff       	call   0x1400680e0
   140876bd4:	90                   	nop
   140876bd5:	45 33 c9             	xor    r9d,r9d
   140876bd8:	45 33 c0             	xor    r8d,r8d
   140876bdb:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140876bdf:	49 8b cc             	mov    rcx,r12
   140876be2:	e8 b9 fd 25 00       	call   0x140ad69a0
   140876be7:	90                   	nop
   140876be8:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876bec:	e8 cf 11 7f ff       	call   0x140067dc0
   140876bf1:	41 8d 57 02          	lea    edx,[r15+0x2]
   140876bf5:	44 8b c3             	mov    r8d,ebx
   140876bf8:	49 8b cc             	mov    rcx,r12
   140876bfb:	e8 b0 44 84 ff       	call   0x1400bb0b0
   140876c00:	45 33 c0             	xor    r8d,r8d
   140876c03:	ba 5b 01 00 00       	mov    edx,0x15b
   140876c08:	48 8d 0d b1 15 03 01 	lea    rcx,[rip+0x10315b1]        # 0x1418a81c0
   140876c0f:	e8 dc f8 3b 00       	call   0x140c364f0
   140876c14:	41 8b f7             	mov    esi,r15d
   140876c17:	48 8d 3d ba 7e dd 01 	lea    rdi,[rip+0x1dd7eba]        # 0x14264ead8
   140876c1e:	48 8d 05 bf 7e dd 01 	lea    rax,[rip+0x1dd7ebf]        # 0x14264eae4
   140876c25:	44 8b 6d 80          	mov    r13d,DWORD PTR [rbp-0x80]
   140876c29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140876c30:	41 8b dd             	mov    ebx,r13d
   140876c33:	45 3b ee             	cmp    r13d,r14d
   140876c36:	7f 60                	jg     0x140876c98
   140876c38:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140876c40:	44 8b c3             	mov    r8d,ebx
   140876c43:	8b d6                	mov    edx,esi
   140876c45:	49 8b cc             	mov    rcx,r12
   140876c48:	e8 63 44 84 ff       	call   0x1400bb0b0
   140876c4d:	41 3b dd             	cmp    ebx,r13d
   140876c50:	75 05                	jne    0x140876c57
   140876c52:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   140876c55:	eb 0c                	jmp    0x140876c63
   140876c57:	41 3b de             	cmp    ebx,r14d
   140876c5a:	75 04                	jne    0x140876c60
   140876c5c:	8b 17                	mov    edx,DWORD PTR [rdi]
   140876c5e:	eb 03                	jmp    0x140876c63
   140876c60:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   140876c63:	49 8b cc             	mov    rcx,r12
   140876c66:	e8 a5 0e 26 00       	call   0x140ad7b10
   140876c6b:	33 d2                	xor    edx,edx
   140876c6d:	48 8d 0d ec 09 b5 01 	lea    rcx,[rip+0x1b509ec]        # 0x1423c7660
   140876c74:	e8 a7 b2 7f ff       	call   0x140071f20
   140876c79:	84 c0                	test   al,al
   140876c7b:	74 0d                	je     0x140876c8a
   140876c7d:	41 b0 01             	mov    r8b,0x1
   140876c80:	33 d2                	xor    edx,edx
   140876c82:	49 8b cc             	mov    rcx,r12
   140876c85:	e8 96 44 84 ff       	call   0x1400bb120
   140876c8a:	ff c3                	inc    ebx
   140876c8c:	41 3b de             	cmp    ebx,r14d
   140876c8f:	7e af                	jle    0x140876c40
   140876c91:	48 8d 05 4c 7e dd 01 	lea    rax,[rip+0x1dd7e4c]        # 0x14264eae4
   140876c98:	ff c6                	inc    esi
   140876c9a:	48 83 c7 04          	add    rdi,0x4
   140876c9e:	48 3b f8             	cmp    rdi,rax
   140876ca1:	7c 8d                	jl     0x140876c30
   140876ca3:	45 33 c0             	xor    r8d,r8d
   140876ca6:	ba 07 00 00 00       	mov    edx,0x7
   140876cab:	41 b1 01             	mov    r9b,0x1
   140876cae:	49 8b cc             	mov    rcx,r12
   140876cb1:	e8 0a 44 84 ff       	call   0x1400bb0c0
   140876cb6:	41 8d 57 01          	lea    edx,[r15+0x1]
   140876cba:	45 8d 45 02          	lea    r8d,[r13+0x2]
   140876cbe:	49 8b cc             	mov    rcx,r12
   140876cc1:	e8 ea 43 84 ff       	call   0x1400bb0b0
   140876cc6:	48 8d 15 cf 28 d8 00 	lea    rdx,[rip+0xd828cf]        # 0x1415f959c
   140876ccd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876cd1:	e8 0a 14 7f ff       	call   0x1400680e0
   140876cd6:	90                   	nop
   140876cd7:	45 33 c9             	xor    r9d,r9d
   140876cda:	45 33 c0             	xor    r8d,r8d
   140876cdd:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140876ce1:	49 8b cc             	mov    rcx,r12
   140876ce4:	e8 b7 fc 25 00       	call   0x140ad69a0
   140876ce9:	90                   	nop
   140876cea:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140876cee:	e8 cd 10 7f ff       	call   0x140067dc0
   140876cf3:	41 8d 57 02          	lea    edx,[r15+0x2]
   140876cf7:	45 8d 45 02          	lea    r8d,[r13+0x2]
   140876cfb:	49 8b cc             	mov    rcx,r12
   140876cfe:	e8 ad 43 84 ff       	call   0x1400bb0b0
   140876d03:	45 33 c0             	xor    r8d,r8d
   140876d06:	ba 05 00 00 00       	mov    edx,0x5
   140876d0b:	48 8d 0d ae 14 03 01 	lea    rcx,[rip+0x10314ae]        # 0x1418a81c0
   140876d12:	e8 d9 f7 3b 00       	call   0x140c364f0
   140876d17:	e9 83 6b 00 00       	jmp    0x14087d89f
   140876d1c:	33 db                	xor    ebx,ebx
   140876d1e:	48 89 5d a0          	mov    QWORD PTR [rbp-0x60],rbx
   140876d22:	83 ea 02             	sub    edx,0x2
   140876d25:	74 3a                	je     0x140876d61
   140876d27:	83 ea 03             	sub    edx,0x3
   140876d2a:	74 2a                	je     0x140876d56
   140876d2c:	83 ea 01             	sub    edx,0x1
   140876d2f:	74 1a                	je     0x140876d4b
   140876d31:	83 fa 01             	cmp    edx,0x1
   140876d34:	75 3d                	jne    0x140876d73
   140876d36:	49 8d 8d a8 00 00 00 	lea    rcx,[r13+0xa8]
   140876d3d:	e8 9e 86 7f ff       	call   0x14006f3e0
   140876d42:	48 8b d8             	mov    rbx,rax
   140876d45:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
   140876d49:	eb 28                	jmp    0x140876d73
   140876d4b:	49 8d 4d 70          	lea    rcx,[r13+0x70]
   140876d4f:	e8 8c 80 7f ff       	call   0x14006ede0
   140876d54:	eb 17                	jmp    0x140876d6d
   140876d56:	49 8d 4d 40          	lea    rcx,[r13+0x40]
   140876d5a:	e8 81 80 7f ff       	call   0x14006ede0
   140876d5f:	eb 0c                	jmp    0x140876d6d
   140876d61:	49 8d 8d d8 00 00 00 	lea    rcx,[r13+0xd8]
   140876d68:	e8 93 85 7f ff       	call   0x14006f300
   140876d6d:	8b d8                	mov    ebx,eax
   140876d6f:	48 89 5d a0          	mov    QWORD PTR [rbp-0x60],rbx
   140876d73:	44 8b 7c 24 68       	mov    r15d,DWORD PTR [rsp+0x68]
   140876d78:	41 ff c7             	inc    r15d
   140876d7b:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   140876d7f:	41 ff c8             	dec    r8d
   140876d82:	8d 77 0b             	lea    esi,[rdi+0xb]
   140876d85:	89 75 98             	mov    DWORD PTR [rbp-0x68],esi
   140876d88:	8b 4d b0             	mov    ecx,DWORD PTR [rbp-0x50]
   140876d8b:	ff c9                	dec    ecx
   140876d8d:	2b ce                	sub    ecx,esi
   140876d8f:	ff c1                	inc    ecx
   140876d91:	b8 56 55 55 55       	mov    eax,0x55555556
   140876d96:	f7 e9                	imul   ecx
   140876d98:	8b fa                	mov    edi,edx
   140876d9a:	c1 ef 1f             	shr    edi,0x1f
   140876d9d:	03 fa                	add    edi,edx
   140876d9f:	89 7c 24 60          	mov    DWORD PTR [rsp+0x60],edi
   140876da3:	45 8d 70 fe          	lea    r14d,[r8-0x2]
   140876da7:	3b df                	cmp    ebx,edi
   140876da9:	45 0f 4e f0          	cmovle r14d,r8d
   140876dad:	44 89 74 24 7c       	mov    DWORD PTR [rsp+0x7c],r14d
   140876db2:	41 8b 85 f0 00 00 00 	mov    eax,DWORD PTR [r13+0xf0]
   140876db9:	8b cb                	mov    ecx,ebx
   140876dbb:	2b cf                	sub    ecx,edi
   140876dbd:	3b c1                	cmp    eax,ecx
   140876dbf:	0f 4e c8             	cmovle ecx,eax
   140876dc2:	33 c0                	xor    eax,eax
   140876dc4:	85 c9                	test   ecx,ecx
   140876dc6:	0f 49 c1             	cmovns eax,ecx
   140876dc9:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
   140876dcc:	44 8b e8             	mov    r13d,eax
   140876dcf:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140876dd3:	03 c7                	add    eax,edi
   140876dd5:	89 44 24 64          	mov    DWORD PTR [rsp+0x64],eax
   140876dd9:	44 3b e8             	cmp    r13d,eax
   140876ddc:	0f 8d c3 09 00 00    	jge    0x1408777a5
   140876de2:	44 8d 66 01          	lea    r12d,[rsi+0x1]
   140876de6:	44 89 65 80          	mov    DWORD PTR [rbp-0x80],r12d
   140876dea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140876df0:	44 3b eb             	cmp    r13d,ebx
   140876df3:	0f 8d a5 09 00 00    	jge    0x14087779e
   140876df9:	45 33 c0             	xor    r8d,r8d
   140876dfc:	ba 07 00 00 00       	mov    edx,0x7
   140876e01:	41 b1 01             	mov    r9b,0x1
   140876e04:	48 8d 0d d5 d4 dc 01 	lea    rcx,[rip+0x1dcd4d5]        # 0x1426442e0
   140876e0b:	e8 b0 42 84 ff       	call   0x1400bb0c0
   140876e10:	41 8b ff             	mov    edi,r15d
   140876e13:	45 3b fe             	cmp    r15d,r14d
   140876e16:	0f 8f fe 00 00 00    	jg     0x140876f1a
   140876e1c:	45 8d 74 24 02       	lea    r14d,[r12+0x2]
   140876e21:	41 ff cc             	dec    r12d
   140876e24:	44 8b 6c 24 7c       	mov    r13d,DWORD PTR [rsp+0x7c]
   140876e29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140876e30:	41 8b dc             	mov    ebx,r12d
   140876e33:	45 3b e6             	cmp    r12d,r14d
   140876e36:	0f 8d c5 00 00 00    	jge    0x140876f01
   140876e3c:	41 3b fd             	cmp    edi,r13d
   140876e3f:	4c 8d 2d 9a d4 dc 01 	lea    r13,[rip+0x1dcd49a]        # 0x1426442e0
   140876e46:	75 56                	jne    0x140876e9e
   140876e48:	48 8d 35 51 ee dc 01 	lea    rsi,[rip+0x1dcee51]        # 0x142645ca0
   140876e4f:	90                   	nop
   140876e50:	44 8b c7             	mov    r8d,edi
   140876e53:	8b d3                	mov    edx,ebx
   140876e55:	49 8b cd             	mov    rcx,r13
   140876e58:	e8 53 42 84 ff       	call   0x1400bb0b0
   140876e5d:	48 8d 56 e8          	lea    rdx,[rsi-0x18]
   140876e61:	41 3b ff             	cmp    edi,r15d
   140876e64:	48 0f 45 d6          	cmovne rdx,rsi
   140876e68:	8b 12                	mov    edx,DWORD PTR [rdx]
   140876e6a:	49 8b cd             	mov    rcx,r13
   140876e6d:	e8 9e 0c 26 00       	call   0x140ad7b10
   140876e72:	33 d2                	xor    edx,edx
   140876e74:	48 8d 0d e5 07 b5 01 	lea    rcx,[rip+0x1b507e5]        # 0x1423c7660
   140876e7b:	e8 a0 b0 7f ff       	call   0x140071f20
   140876e80:	84 c0                	test   al,al
   140876e82:	74 0d                	je     0x140876e91
   140876e84:	41 b0 01             	mov    r8b,0x1
   140876e87:	33 d2                	xor    edx,edx
   140876e89:	49 8b cd             	mov    rcx,r13
   140876e8c:	e8 8f 42 84 ff       	call   0x1400bb120
   140876e91:	ff c3                	inc    ebx
   140876e93:	48 83 c6 04          	add    rsi,0x4
   140876e97:	41 3b de             	cmp    ebx,r14d
   140876e9a:	7c b4                	jl     0x140876e50
   140876e9c:	eb 5e                	jmp    0x140876efc
   140876e9e:	48 8d 35 ef ed dc 01 	lea    rsi,[rip+0x1dcedef]        # 0x142645c94
   140876ea5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140876eb0:	44 8b c7             	mov    r8d,edi
   140876eb3:	8b d3                	mov    edx,ebx
   140876eb5:	49 8b cd             	mov    rcx,r13
   140876eb8:	e8 f3 41 84 ff       	call   0x1400bb0b0
   140876ebd:	48 8d 56 f4          	lea    rdx,[rsi-0xc]
   140876ec1:	41 3b ff             	cmp    edi,r15d
   140876ec4:	48 0f 45 d6          	cmovne rdx,rsi
   140876ec8:	8b 12                	mov    edx,DWORD PTR [rdx]
   140876eca:	49 8b cd             	mov    rcx,r13
   140876ecd:	e8 3e 0c 26 00       	call   0x140ad7b10
   140876ed2:	33 d2                	xor    edx,edx
   140876ed4:	48 8d 0d 85 07 b5 01 	lea    rcx,[rip+0x1b50785]        # 0x1423c7660
   140876edb:	e8 40 b0 7f ff       	call   0x140071f20
   140876ee0:	84 c0                	test   al,al
   140876ee2:	74 0d                	je     0x140876ef1
   140876ee4:	41 b0 01             	mov    r8b,0x1
   140876ee7:	33 d2                	xor    edx,edx
   140876ee9:	49 8b cd             	mov    rcx,r13
   140876eec:	e8 2f 42 84 ff       	call   0x1400bb120
   140876ef1:	ff c3                	inc    ebx
   140876ef3:	48 83 c6 04          	add    rsi,0x4
   140876ef7:	41 3b de             	cmp    ebx,r14d
   140876efa:	7c b4                	jl     0x140876eb0
   140876efc:	44 8b 6c 24 7c       	mov    r13d,DWORD PTR [rsp+0x7c]
   140876f01:	ff c7                	inc    edi
   140876f03:	41 3b fd             	cmp    edi,r13d
   140876f06:	0f 8e 24 ff ff ff    	jle    0x140876e30
   140876f0c:	44 8b 6c 24 78       	mov    r13d,DWORD PTR [rsp+0x78]
   140876f11:	44 8b 74 24 7c       	mov    r14d,DWORD PTR [rsp+0x7c]
   140876f16:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   140876f1a:	45 8b c7             	mov    r8d,r15d
   140876f1d:	41 8b d4             	mov    edx,r12d
   140876f20:	48 8d 3d b9 d3 dc 01 	lea    rdi,[rip+0x1dcd3b9]        # 0x1426442e0
   140876f27:	48 8b cf             	mov    rcx,rdi
   140876f2a:	e8 81 41 84 ff       	call   0x1400bb0b0
   140876f2f:	41 8b d5             	mov    edx,r13d
   140876f32:	2b 55 8c             	sub    edx,DWORD PTR [rbp-0x74]
   140876f35:	83 c2 52             	add    edx,0x52
   140876f38:	45 33 c0             	xor    r8d,r8d
   140876f3b:	48 8d 0d 7e 12 03 01 	lea    rcx,[rip+0x103127e]        # 0x1418a81c0
   140876f42:	e8 a9 f5 3b 00       	call   0x140c364f0
   140876f47:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140876f4b:	e8 d0 86 7f ff       	call   0x14006f620
   140876f50:	90                   	nop
   140876f51:	45 8d 47 02          	lea    r8d,[r15+0x2]
   140876f55:	41 8b d4             	mov    edx,r12d
   140876f58:	48 8b cf             	mov    rcx,rdi
   140876f5b:	e8 50 41 84 ff       	call   0x1400bb0b0
   140876f60:	45 33 c0             	xor    r8d,r8d
   140876f63:	ba 07 00 00 00       	mov    edx,0x7
   140876f68:	41 b1 01             	mov    r9b,0x1
   140876f6b:	48 8b cf             	mov    rcx,rdi
   140876f6e:	e8 4d 41 84 ff       	call   0x1400bb0c0
   140876f73:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   140876f78:	8b 4f 04             	mov    ecx,DWORD PTR [rdi+0x4]
   140876f7b:	83 e9 02             	sub    ecx,0x2
   140876f7e:	0f 84 d1 05 00 00    	je     0x140877555
   140876f84:	83 e9 03             	sub    ecx,0x3
   140876f87:	0f 84 21 03 00 00    	je     0x1408772ae
   140876f8d:	83 e9 01             	sub    ecx,0x1
   140876f90:	0f 84 8e 00 00 00    	je     0x140877024
   140876f96:	83 f9 01             	cmp    ecx,0x1
   140876f99:	0f 85 c1 07 00 00    	jne    0x140877760
   140876f9f:	48 8d 15 e6 78 e3 00 	lea    rdx,[rip+0xe378e6]        # 0x1416ae88c
   140876fa6:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140876faa:	e8 61 85 7f ff       	call   0x14006f510
   140876faf:	48 8b 05 4a 80 b6 01 	mov    rax,QWORD PTR [rip+0x1b6804a]        # 0x1423df000
   140876fb6:	0f b7 b0 ac 00 00 00 	movzx  esi,WORD PTR [rax+0xac]
   140876fbd:	48 8d 8f c0 00 00 00 	lea    rcx,[rdi+0xc0]
   140876fc4:	49 63 dd             	movsxd rbx,r13d
   140876fc7:	48 8b d3             	mov    rdx,rbx
   140876fca:	e8 01 84 7f ff       	call   0x14006f3d0
   140876fcf:	0f b7 38             	movzx  edi,WORD PTR [rax]
   140876fd2:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   140876fd7:	48 81 c1 a8 00 00 00 	add    rcx,0xa8
   140876fde:	48 8b d3             	mov    rdx,rbx
   140876fe1:	e8 ea 83 7f ff       	call   0x14006f3d0
   140876fe6:	44 0f b7 08          	movzx  r9d,WORD PTR [rax]
   140876fea:	48 8b 05 0f 80 b6 01 	mov    rax,QWORD PTR [rip+0x1b6800f]        # 0x1423df000
   140876ff1:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140876ff5:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140876ffa:	66 89 74 24 28       	mov    WORD PTR [rsp+0x28],si
   140876fff:	66 89 7c 24 20       	mov    WORD PTR [rsp+0x20],di
   140877004:	44 0f b7 80 ac 00 00 00 	movzx  r8d,WORD PTR [rax+0xac]
   14087700c:	0f b7 90 aa 00 00 00 	movzx  edx,WORD PTR [rax+0xaa]
   140877013:	0f b7 88 a8 00 00 00 	movzx  ecx,WORD PTR [rax+0xa8]
   14087701a:	e8 21 5c ed ff       	call   0x14074cc40
   14087701f:	e9 3c 07 00 00       	jmp    0x140877760
   140877024:	48 8d 15 25 78 e3 00 	lea    rdx,[rip+0xe37825]        # 0x1416ae850
   14087702b:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087702f:	e8 dc 84 7f ff       	call   0x14006f510
   140877034:	48 8d b7 88 00 00 00 	lea    rsi,[rdi+0x88]
   14087703b:	49 63 fd             	movsxd rdi,r13d
   14087703e:	48 8b d7             	mov    rdx,rdi
   140877041:	48 8b ce             	mov    rcx,rsi
   140877044:	e8 67 81 7f ff       	call   0x14006f1b0
   140877049:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087704c:	48 8b d7             	mov    rdx,rdi
   14087704f:	83 79 24 ff          	cmp    DWORD PTR [rcx+0x24],0xffffffff
   140877053:	48 8b ce             	mov    rcx,rsi
   140877056:	0f 84 ed 01 00 00    	je     0x140877249
   14087705c:	e8 4f 81 7f ff       	call   0x14006f1b0
   140877061:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140877064:	8b 52 24             	mov    edx,DWORD PTR [rdx+0x24]
   140877067:	48 8d 0d d2 82 b6 01 	lea    rcx,[rip+0x1b682d2]        # 0x1423df340
   14087706e:	e8 fd b5 7f ff       	call   0x140072670
   140877073:	48 8b d8             	mov    rbx,rax
   140877076:	48 85 c0             	test   rax,rax
   140877079:	0f 84 0f 01 00 00    	je     0x14087718e
   14087707f:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877083:	e8 98 85 7f ff       	call   0x14006f620
   140877088:	90                   	nop
   140877089:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087708f:	45 33 c0             	xor    r8d,r8d
   140877092:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140877096:	48 8b cb             	mov    rcx,rbx
   140877099:	e8 f2 b3 3e 00       	call   0x140c62490
   14087709e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408770a2:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408770a6:	e8 f5 2b 84 ff       	call   0x1400b9ca0
   1408770ab:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1408770ae:	48 8b cb             	mov    rcx,rbx
   1408770b1:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   1408770b7:	48 8b d8             	mov    rbx,rax
   1408770ba:	48 85 c0             	test   rax,rax
   1408770bd:	0f 84 c2 00 00 00    	je     0x140877185
   1408770c3:	48 8b d7             	mov    rdx,rdi
   1408770c6:	48 8b ce             	mov    rcx,rsi
   1408770c9:	e8 e2 80 7f ff       	call   0x14006f1b0
   1408770ce:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408770d1:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   1408770d5:	85 c0                	test   eax,eax
   1408770d7:	0f 88 a8 00 00 00    	js     0x140877185
   1408770dd:	48 8b f8             	mov    rdi,rax
   1408770e0:	48 8b cb             	mov    rcx,rbx
   1408770e3:	e8 f8 7c 7f ff       	call   0x14006ede0
   1408770e8:	48 3b f8             	cmp    rdi,rax
   1408770eb:	0f 83 94 00 00 00    	jae    0x140877185
   1408770f1:	48 8d 15 28 c6 d6 00 	lea    rdx,[rip+0xd6c628]        # 0x1415e3720
   1408770f8:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408770fc:	e8 ef 83 7f ff       	call   0x14006f4f0
   140877101:	48 8b d7             	mov    rdx,rdi
   140877104:	48 8b cb             	mov    rcx,rbx
   140877107:	e8 a4 80 7f ff       	call   0x14006f1b0
   14087710c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087710f:	48 83 c1 50          	add    rcx,0x50
   140877113:	e8 98 83 7f ff       	call   0x14006f4b0
   140877118:	84 c0                	test   al,al
   14087711a:	75 4d                	jne    0x140877169
   14087711c:	48 8b d7             	mov    rdx,rdi
   14087711f:	48 8b cb             	mov    rcx,rbx
   140877122:	e8 89 80 7f ff       	call   0x14006f1b0
   140877127:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087712a:	48 83 c1 50          	add    rcx,0x50
   14087712e:	48 8d 15 ab 64 de 00 	lea    rdx,[rip+0xde64ab]        # 0x14165d5e0
   140877135:	e8 d6 8c 7f ff       	call   0x14006fe10
   14087713a:	84 c0                	test   al,al
   14087713c:	75 2b                	jne    0x140877169
   14087713e:	48 8b d7             	mov    rdx,rdi
   140877141:	48 8b cb             	mov    rcx,rbx
   140877144:	e8 67 80 7f ff       	call   0x14006f1b0
   140877149:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087714c:	48 83 c2 50          	add    rdx,0x50
   140877150:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877154:	e8 47 2b 84 ff       	call   0x1400b9ca0
   140877159:	48 8d 15 c0 c5 d6 00 	lea    rdx,[rip+0xd6c5c0]        # 0x1415e3720
   140877160:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877164:	e8 87 83 7f ff       	call   0x14006f4f0
   140877169:	48 8b d7             	mov    rdx,rdi
   14087716c:	48 8b cb             	mov    rcx,rbx
   14087716f:	e8 3c 80 7f ff       	call   0x14006f1b0
   140877174:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140877177:	48 83 c2 10          	add    rdx,0x10
   14087717b:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087717f:	e8 1c 2b 84 ff       	call   0x1400b9ca0
   140877184:	90                   	nop
   140877185:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877189:	e8 32 0c 7f ff       	call   0x140067dc0
   14087718e:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   140877193:	48 8d 15 f6 23 d7 00 	lea    rdx,[rip+0xd723f6]        # 0x1415e9590
   14087719a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087719e:	e8 4d 83 7f ff       	call   0x14006f4f0
   1408771a3:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   1408771a7:	e8 74 84 7f ff       	call   0x14006f620
   1408771ac:	90                   	nop
   1408771ad:	48 8d 4f 70          	lea    rcx,[rdi+0x70]
   1408771b1:	49 63 d5             	movsxd rdx,r13d
   1408771b4:	e8 f7 7f 7f ff       	call   0x14006f1b0
   1408771b9:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   1408771bf:	45 33 c0             	xor    r8d,r8d
   1408771c2:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   1408771c6:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408771c9:	e8 c2 b2 3e 00       	call   0x140c62490
   1408771ce:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   1408771d2:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408771d6:	e8 c5 2a 84 ff       	call   0x1400b9ca0
   1408771db:	48 8d 15 b6 90 d9 00 	lea    rdx,[rip+0xd990b6]        # 0x141610298
   1408771e2:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408771e6:	e8 05 83 7f ff       	call   0x14006f4f0
   1408771eb:	ba 2c 00 00 00       	mov    edx,0x2c
   1408771f0:	48 8b 0d 09 7e b6 01 	mov    rcx,QWORD PTR [rip+0x1b67e09]        # 0x1423df000
   1408771f7:	e8 14 25 ac 00       	call   0x141339710
   1408771fc:	8b d8                	mov    ebx,eax
   1408771fe:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877202:	e8 19 84 7f ff       	call   0x14006f620
   140877207:	90                   	nop
   140877208:	8b d3                	mov    edx,ebx
   14087720a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087720e:	e8 cd 9f ef ff       	call   0x1407711e0
   140877213:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140877217:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087721b:	e8 80 2a 84 ff       	call   0x1400b9ca0
   140877220:	90                   	nop
   140877221:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877225:	e8 96 0b 7f ff       	call   0x140067dc0
   14087722a:	48 8d 15 a7 90 d9 00 	lea    rdx,[rip+0xd990a7]        # 0x1416102d8
   140877231:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877235:	e8 b6 82 7f ff       	call   0x14006f4f0
   14087723a:	90                   	nop
   14087723b:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087723f:	e8 7c 0b 7f ff       	call   0x140067dc0
   140877244:	e9 17 05 00 00       	jmp    0x140877760
   140877249:	e8 62 7f 7f ff       	call   0x14006f1b0
   14087724e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140877251:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140877255:	85 c0                	test   eax,eax
   140877257:	0f 88 31 ff ff ff    	js     0x14087718e
   14087725d:	48 8b d8             	mov    rbx,rax
   140877260:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   140877265:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
   140877269:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   140877270:	48 83 c1 18          	add    rcx,0x18
   140877274:	e8 67 7b 7f ff       	call   0x14006ede0
   140877279:	48 3b d8             	cmp    rbx,rax
   14087727c:	0f 83 11 ff ff ff    	jae    0x140877193
   140877282:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
   140877286:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   14087728d:	48 83 c1 18          	add    rcx,0x18
   140877291:	48 8b d3             	mov    rdx,rbx
   140877294:	e8 17 7f 7f ff       	call   0x14006f1b0
   140877299:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087729c:	48 83 c2 40          	add    rdx,0x40
   1408772a0:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408772a4:	e8 f7 29 84 ff       	call   0x1400b9ca0
   1408772a9:	e9 e5 fe ff ff       	jmp    0x140877193
   1408772ae:	48 8d 15 a3 75 e3 00 	lea    rdx,[rip+0xe375a3]        # 0x1416ae858
   1408772b5:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408772b9:	e8 52 82 7f ff       	call   0x14006f510
   1408772be:	48 8d 77 58          	lea    rsi,[rdi+0x58]
   1408772c2:	49 63 fd             	movsxd rdi,r13d
   1408772c5:	48 8b d7             	mov    rdx,rdi
   1408772c8:	48 8b ce             	mov    rcx,rsi
   1408772cb:	e8 e0 7e 7f ff       	call   0x14006f1b0
   1408772d0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408772d3:	48 8b d7             	mov    rdx,rdi
   1408772d6:	83 79 24 ff          	cmp    DWORD PTR [rcx+0x24],0xffffffff
   1408772da:	48 8b ce             	mov    rcx,rsi
   1408772dd:	0f 84 34 01 00 00    	je     0x140877417
   1408772e3:	e8 c8 7e 7f ff       	call   0x14006f1b0
   1408772e8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408772eb:	8b 52 24             	mov    edx,DWORD PTR [rdx+0x24]
   1408772ee:	48 8d 0d 4b 80 b6 01 	lea    rcx,[rip+0x1b6804b]        # 0x1423df340
   1408772f5:	e8 76 b3 7f ff       	call   0x140072670
   1408772fa:	48 8b d8             	mov    rbx,rax
   1408772fd:	48 85 c0             	test   rax,rax
   140877300:	0f 84 69 01 00 00    	je     0x14087746f
   140877306:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087730a:	e8 11 83 7f ff       	call   0x14006f620
   14087730f:	90                   	nop
   140877310:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140877316:	45 33 c0             	xor    r8d,r8d
   140877319:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087731d:	48 8b cb             	mov    rcx,rbx
   140877320:	e8 6b b1 3e 00       	call   0x140c62490
   140877325:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140877329:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087732d:	e8 6e 29 84 ff       	call   0x1400b9ca0
   140877332:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140877335:	48 8b cb             	mov    rcx,rbx
   140877338:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   14087733e:	48 8b d8             	mov    rbx,rax
   140877341:	48 85 c0             	test   rax,rax
   140877344:	0f 84 c2 00 00 00    	je     0x14087740c
   14087734a:	48 8b d7             	mov    rdx,rdi
   14087734d:	48 8b ce             	mov    rcx,rsi
   140877350:	e8 5b 7e 7f ff       	call   0x14006f1b0
   140877355:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140877358:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   14087735c:	85 c0                	test   eax,eax
   14087735e:	0f 88 a8 00 00 00    	js     0x14087740c
   140877364:	48 8b f8             	mov    rdi,rax
   140877367:	48 8b cb             	mov    rcx,rbx
   14087736a:	e8 71 7a 7f ff       	call   0x14006ede0
   14087736f:	48 3b f8             	cmp    rdi,rax
   140877372:	0f 83 94 00 00 00    	jae    0x14087740c
   140877378:	48 8d 15 a1 c3 d6 00 	lea    rdx,[rip+0xd6c3a1]        # 0x1415e3720
   14087737f:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877383:	e8 68 81 7f ff       	call   0x14006f4f0
   140877388:	48 8b d7             	mov    rdx,rdi
   14087738b:	48 8b cb             	mov    rcx,rbx
   14087738e:	e8 1d 7e 7f ff       	call   0x14006f1b0
   140877393:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140877396:	48 83 c1 50          	add    rcx,0x50
   14087739a:	e8 11 81 7f ff       	call   0x14006f4b0
   14087739f:	84 c0                	test   al,al
   1408773a1:	75 4d                	jne    0x1408773f0
   1408773a3:	48 8b d7             	mov    rdx,rdi
   1408773a6:	48 8b cb             	mov    rcx,rbx
   1408773a9:	e8 02 7e 7f ff       	call   0x14006f1b0
   1408773ae:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408773b1:	48 83 c1 50          	add    rcx,0x50
   1408773b5:	48 8d 15 24 62 de 00 	lea    rdx,[rip+0xde6224]        # 0x14165d5e0
   1408773bc:	e8 4f 8a 7f ff       	call   0x14006fe10
   1408773c1:	84 c0                	test   al,al
   1408773c3:	75 2b                	jne    0x1408773f0
   1408773c5:	48 8b d7             	mov    rdx,rdi
   1408773c8:	48 8b cb             	mov    rcx,rbx
   1408773cb:	e8 e0 7d 7f ff       	call   0x14006f1b0
   1408773d0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408773d3:	48 83 c2 50          	add    rdx,0x50
   1408773d7:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408773db:	e8 c0 28 84 ff       	call   0x1400b9ca0
   1408773e0:	48 8d 15 39 c3 d6 00 	lea    rdx,[rip+0xd6c339]        # 0x1415e3720
   1408773e7:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408773eb:	e8 00 81 7f ff       	call   0x14006f4f0
   1408773f0:	48 8b d7             	mov    rdx,rdi
   1408773f3:	48 8b cb             	mov    rcx,rbx
   1408773f6:	e8 b5 7d 7f ff       	call   0x14006f1b0
   1408773fb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408773fe:	48 83 c2 10          	add    rdx,0x10
   140877402:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877406:	e8 95 28 84 ff       	call   0x1400b9ca0
   14087740b:	90                   	nop
   14087740c:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877410:	e8 ab 09 7f ff       	call   0x140067dc0
   140877415:	eb 58                	jmp    0x14087746f
   140877417:	e8 94 7d 7f ff       	call   0x14006f1b0
   14087741c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087741f:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140877423:	85 c0                	test   eax,eax
   140877425:	78 48                	js     0x14087746f
   140877427:	48 8b d8             	mov    rbx,rax
   14087742a:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14087742f:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
   140877433:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   14087743a:	48 83 c1 18          	add    rcx,0x18
   14087743e:	e8 9d 79 7f ff       	call   0x14006ede0
   140877443:	48 3b d8             	cmp    rbx,rax
   140877446:	73 27                	jae    0x14087746f
   140877448:	48 8b 47 38          	mov    rax,QWORD PTR [rdi+0x38]
   14087744c:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   140877453:	48 83 c1 18          	add    rcx,0x18
   140877457:	48 8b d3             	mov    rdx,rbx
   14087745a:	e8 51 7d 7f ff       	call   0x14006f1b0
   14087745f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140877462:	48 83 c2 40          	add    rdx,0x40
   140877466:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087746a:	e8 31 28 84 ff       	call   0x1400b9ca0
   14087746f:	48 8d 15 1a 21 d7 00 	lea    rdx,[rip+0xd7211a]        # 0x1415e9590
   140877476:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087747a:	e8 71 80 7f ff       	call   0x14006f4f0
   14087747f:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140877483:	e8 98 81 7f ff       	call   0x14006f620
   140877488:	90                   	nop
   140877489:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14087748e:	49 63 dd             	movsxd rbx,r13d
   140877491:	48 8b d3             	mov    rdx,rbx
   140877494:	48 8d 4f 40          	lea    rcx,[rdi+0x40]
   140877498:	e8 13 7d 7f ff       	call   0x14006f1b0
   14087749d:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   1408774a3:	45 33 c0             	xor    r8d,r8d
   1408774a6:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   1408774aa:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408774ad:	e8 de af 3e 00       	call   0x140c62490
   1408774b2:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   1408774b6:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408774ba:	e8 e1 27 84 ff       	call   0x1400b9ca0
   1408774bf:	48 8d 15 d2 8d d9 00 	lea    rdx,[rip+0xd98dd2]        # 0x141610298
   1408774c6:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408774ca:	e8 21 80 7f ff       	call   0x14006f4f0
   1408774cf:	48 8b d3             	mov    rdx,rbx
   1408774d2:	48 8d 4f 40          	lea    rcx,[rdi+0x40]
   1408774d6:	e8 d5 7c 7f ff       	call   0x14006f1b0
   1408774db:	41 b0 01             	mov    r8b,0x1
   1408774de:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408774e1:	48 8b 0d 18 7b b6 01 	mov    rcx,QWORD PTR [rip+0x1b67b18]        # 0x1423df000
   1408774e8:	e8 83 21 ac 00       	call   0x141339670
   1408774ed:	8b d8                	mov    ebx,eax
   1408774ef:	ba 61 00 00 00       	mov    edx,0x61
   1408774f4:	48 8b 0d 05 7b b6 01 	mov    rcx,QWORD PTR [rip+0x1b67b05]        # 0x1423df000
   1408774fb:	e8 10 22 ac 00       	call   0x141339710
   140877500:	8b f8                	mov    edi,eax
   140877502:	c1 ff 02             	sar    edi,0x2
   140877505:	3b fb                	cmp    edi,ebx
   140877507:	0f 4e fb             	cmovle edi,ebx
   14087750a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087750e:	e8 0d 81 7f ff       	call   0x14006f620
   140877513:	90                   	nop
   140877514:	8b d7                	mov    edx,edi
   140877516:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087751a:	e8 c1 9c ef ff       	call   0x1407711e0
   14087751f:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140877523:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877527:	e8 74 27 84 ff       	call   0x1400b9ca0
   14087752c:	90                   	nop
   14087752d:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877531:	e8 8a 08 7f ff       	call   0x140067dc0
   140877536:	48 8d 15 9b 8d d9 00 	lea    rdx,[rip+0xd98d9b]        # 0x1416102d8
   14087753d:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877541:	e8 aa 7f 7f ff       	call   0x14006f4f0
   140877546:	90                   	nop
   140877547:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087754b:	e8 70 08 7f ff       	call   0x140067dc0
   140877550:	e9 0b 02 00 00       	jmp    0x140877760
   140877555:	48 8d 8f d8 00 00 00 	lea    rcx,[rdi+0xd8]
   14087755c:	49 63 d5             	movsxd rdx,r13d
   14087755f:	e8 8c 7d 7f ff       	call   0x14006f2f0
   140877564:	8b 10                	mov    edx,DWORD PTR [rax]
   140877566:	85 d2                	test   edx,edx
   140877568:	0f 84 e2 01 00 00    	je     0x140877750
   14087756e:	83 ea 01             	sub    edx,0x1
   140877571:	0f 84 d0 01 00 00    	je     0x140877747
   140877577:	83 ea 01             	sub    edx,0x1
   14087757a:	0f 84 d6 00 00 00    	je     0x140877656
   140877580:	83 ea 01             	sub    edx,0x1
   140877583:	74 6d                	je     0x1408775f2
   140877585:	83 fa 01             	cmp    edx,0x1
   140877588:	0f 85 d2 01 00 00    	jne    0x140877760
   14087758e:	48 8d 15 1b 73 e3 00 	lea    rdx,[rip+0xe3731b]        # 0x1416ae8b0
   140877595:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877599:	e8 72 7f 7f ff       	call   0x14006f510
   14087759e:	ba 67 00 00 00       	mov    edx,0x67
   1408775a3:	48 8b 0d 56 7a b6 01 	mov    rcx,QWORD PTR [rip+0x1b67a56]        # 0x1423df000
   1408775aa:	e8 61 21 ac 00       	call   0x141339710
   1408775af:	8b d8                	mov    ebx,eax
   1408775b1:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408775b5:	e8 66 80 7f ff       	call   0x14006f620
   1408775ba:	90                   	nop
   1408775bb:	8b d3                	mov    edx,ebx
   1408775bd:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408775c1:	e8 1a 9c ef ff       	call   0x1407711e0
   1408775c6:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   1408775ca:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408775ce:	e8 cd 26 84 ff       	call   0x1400b9ca0
   1408775d3:	48 8d 15 fe 8c d9 00 	lea    rdx,[rip+0xd98cfe]        # 0x1416102d8
   1408775da:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408775de:	e8 0d 7f 7f ff       	call   0x14006f4f0
   1408775e3:	90                   	nop
   1408775e4:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408775e8:	e8 d3 07 7f ff       	call   0x140067dc0
   1408775ed:	e9 6e 01 00 00       	jmp    0x140877760
   1408775f2:	48 8d 15 bf 72 e3 00 	lea    rdx,[rip+0xe372bf]        # 0x1416ae8b8
   1408775f9:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   1408775fd:	e8 0e 7f 7f ff       	call   0x14006f510
   140877602:	ba 2c 00 00 00       	mov    edx,0x2c
   140877607:	48 8b 0d f2 79 b6 01 	mov    rcx,QWORD PTR [rip+0x1b679f2]        # 0x1423df000
   14087760e:	e8 fd 20 ac 00       	call   0x141339710
   140877613:	8b d8                	mov    ebx,eax
   140877615:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877619:	e8 02 80 7f ff       	call   0x14006f620
   14087761e:	90                   	nop
   14087761f:	8b d3                	mov    edx,ebx
   140877621:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877625:	e8 b6 9b ef ff       	call   0x1407711e0
   14087762a:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087762e:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877632:	e8 69 26 84 ff       	call   0x1400b9ca0
   140877637:	48 8d 15 9a 8c d9 00 	lea    rdx,[rip+0xd98c9a]        # 0x1416102d8
   14087763e:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877642:	e8 a9 7e 7f ff       	call   0x14006f4f0
   140877647:	90                   	nop
   140877648:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087764c:	e8 6f 07 7f ff       	call   0x140067dc0
   140877651:	e9 0a 01 00 00       	jmp    0x140877760
   140877656:	48 8d 15 3b 72 e3 00 	lea    rdx,[rip+0xe3723b]        # 0x1416ae898
   14087765d:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877661:	e8 aa 7e 7f ff       	call   0x14006f510
   140877666:	33 ff                	xor    edi,edi
   140877668:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087766d:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   140877671:	48 8d 4b 40          	lea    rcx,[rbx+0x40]
   140877675:	e8 56 7b 7f ff       	call   0x14006f1d0
   14087767a:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   14087767e:	48 8d 4b 40          	lea    rcx,[rbx+0x40]
   140877682:	e8 39 7b 7f ff       	call   0x14006f1c0
   140877687:	4c 8d 45 a8          	lea    r8,[rbp-0x58]
   14087768b:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   14087768f:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   140877693:	e8 18 77 7f ff       	call   0x14006edb0
   140877698:	33 d2                	xor    edx,edx
   14087769a:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   14087769d:	e8 9e e0 7e ff       	call   0x140065740
   1408776a2:	84 c0                	test   al,al
   1408776a4:	74 63                	je     0x140877709
   1408776a6:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   1408776aa:	e8 f1 76 7f ff       	call   0x14006eda0
   1408776af:	41 b0 01             	mov    r8b,0x1
   1408776b2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408776b5:	48 8b 0d 44 79 b6 01 	mov    rcx,QWORD PTR [rip+0x1b67944]        # 0x1423df000
   1408776bc:	e8 af 1f ac 00       	call   0x141339670
   1408776c1:	8b d8                	mov    ebx,eax
   1408776c3:	ba 61 00 00 00       	mov    edx,0x61
   1408776c8:	48 8b 0d 31 79 b6 01 	mov    rcx,QWORD PTR [rip+0x1b67931]        # 0x1423df000
   1408776cf:	e8 3c 20 ac 00       	call   0x141339710
   1408776d4:	c1 f8 02             	sar    eax,0x2
   1408776d7:	3b c3                	cmp    eax,ebx
   1408776d9:	0f 4e c3             	cmovle eax,ebx
   1408776dc:	3b c7                	cmp    eax,edi
   1408776de:	0f 4f f8             	cmovg  edi,eax
   1408776e1:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   1408776e5:	e8 a6 76 7f ff       	call   0x14006ed90
   1408776ea:	4c 8d 45 a8          	lea    r8,[rbp-0x58]
   1408776ee:	48 8d 55 88          	lea    rdx,[rbp-0x78]
   1408776f2:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   1408776f6:	e8 b5 76 7f ff       	call   0x14006edb0
   1408776fb:	33 d2                	xor    edx,edx
   1408776fd:	0f b6 08             	movzx  ecx,BYTE PTR [rax]
   140877700:	e8 3b e0 7e ff       	call   0x140065740
   140877705:	84 c0                	test   al,al
   140877707:	75 9d                	jne    0x1408776a6
   140877709:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087770d:	e8 0e 7f 7f ff       	call   0x14006f620
   140877712:	90                   	nop
   140877713:	8b d7                	mov    edx,edi
   140877715:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877719:	e8 c2 9a ef ff       	call   0x1407711e0
   14087771e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140877722:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877726:	e8 75 25 84 ff       	call   0x1400b9ca0
   14087772b:	48 8d 15 a6 8b d9 00 	lea    rdx,[rip+0xd98ba6]        # 0x1416102d8
   140877732:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877736:	e8 b5 7d 7f ff       	call   0x14006f4f0
   14087773b:	90                   	nop
   14087773c:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877740:	e8 7b 06 7f ff       	call   0x140067dc0
   140877745:	eb 19                	jmp    0x140877760
   140877747:	48 8d 15 32 78 d9 00 	lea    rdx,[rip+0xd97832]        # 0x14160ef80
   14087774e:	eb 07                	jmp    0x140877757
   140877750:	48 8d 15 85 81 d9 00 	lea    rdx,[rip+0xd98185]        # 0x14160f8dc
   140877757:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087775b:	e8 b0 7d 7f ff       	call   0x14006f510
   140877760:	45 33 c9             	xor    r9d,r9d
   140877763:	45 33 c0             	xor    r8d,r8d
   140877766:	48 8d 55 38          	lea    rdx,[rbp+0x38]
   14087776a:	48 8d 0d 6f cb dc 01 	lea    rcx,[rip+0x1dccb6f]        # 0x1426442e0
   140877771:	e8 2a f2 25 00       	call   0x140ad69a0
   140877776:	41 83 c4 03          	add    r12d,0x3
   14087777a:	44 89 65 80          	mov    DWORD PTR [rbp-0x80],r12d
   14087777e:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   140877782:	e8 39 06 7f ff       	call   0x140067dc0
   140877787:	41 ff c5             	inc    r13d
   14087778a:	44 89 6c 24 78       	mov    DWORD PTR [rsp+0x78],r13d
   14087778f:	44 3b 6c 24 64       	cmp    r13d,DWORD PTR [rsp+0x64]
   140877794:	48 8b 5d a0          	mov    rbx,QWORD PTR [rbp-0x60]
   140877798:	0f 8c 52 f6 ff ff    	jl     0x140876df0
   14087779e:	8b 7c 24 60          	mov    edi,DWORD PTR [rsp+0x60]
   1408777a2:	8b 75 98             	mov    esi,DWORD PTR [rbp-0x68]
   1408777a5:	3b df                	cmp    ebx,edi
   1408777a7:	0f 8e f2 60 00 00    	jle    0x14087d89f
   1408777ad:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408777b1:	e8 3a 3b 84 ff       	call   0x1400bb2f0
   1408777b6:	8d 4f ff             	lea    ecx,[rdi-0x1]
   1408777b9:	8d 0c 4e             	lea    ecx,[rsi+rcx*2]
   1408777bc:	03 cf                	add    ecx,edi
   1408777be:	8d 46 01             	lea    eax,[rsi+0x1]
   1408777c1:	44 8d 4b ff          	lea    r9d,[rbx-0x1]
   1408777c5:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   1408777c9:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   1408777cd:	89 7c 24 20          	mov    DWORD PTR [rsp+0x20],edi
   1408777d1:	45 33 c0             	xor    r8d,r8d
   1408777d4:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   1408777d9:	8b 93 f0 00 00 00    	mov    edx,DWORD PTR [rbx+0xf0]
   1408777df:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408777e3:	e8 28 3b 84 ff       	call   0x1400bb310
   1408777e8:	45 8d 4e 01          	lea    r9d,[r14+0x1]
   1408777ec:	0f b6 83 f4 00 00 00 	movzx  eax,BYTE PTR [rbx+0xf4]
   1408777f3:	e9 8b 60 00 00       	jmp    0x14087d883
   1408777f8:	44 8b 35 29 32 dc 01 	mov    r14d,DWORD PTR [rip+0x1dc3229]        # 0x14263aa28
   1408777ff:	44 89 75 88          	mov    DWORD PTR [rbp-0x78],r14d
   140877803:	44 8b 7c 24 68       	mov    r15d,DWORD PTR [rsp+0x68]
   140877808:	41 ff c7             	inc    r15d
   14087780b:	44 89 7d 8c          	mov    DWORD PTR [rbp-0x74],r15d
   14087780f:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   140877813:	41 ff c8             	dec    r8d
   140877816:	44 8d 67 02          	lea    r12d,[rdi+0x2]
   14087781a:	44 89 65 84          	mov    DWORD PTR [rbp-0x7c],r12d
   14087781e:	8b 4d b0             	mov    ecx,DWORD PTR [rbp-0x50]
   140877821:	ff c9                	dec    ecx
   140877823:	41 2b cc             	sub    ecx,r12d
   140877826:	ff c1                	inc    ecx
   140877828:	b8 56 55 55 55       	mov    eax,0x55555556
   14087782d:	f7 e9                	imul   ecx
   14087782f:	8b da                	mov    ebx,edx
   140877831:	c1 eb 1f             	shr    ebx,0x1f
   140877834:	03 da                	add    ebx,edx
   140877836:	89 5d 98             	mov    DWORD PTR [rbp-0x68],ebx
   140877839:	41 8d 70 fe          	lea    esi,[r8-0x2]
   14087783d:	44 3b f3             	cmp    r14d,ebx
   140877840:	41 0f 4e f0          	cmovle esi,r8d
   140877844:	89 75 80             	mov    DWORD PTR [rbp-0x80],esi
   140877847:	41 8b 85 f8 00 00 00 	mov    eax,DWORD PTR [r13+0xf8]
   14087784e:	41 8b ce             	mov    ecx,r14d
   140877851:	2b cb                	sub    ecx,ebx
   140877853:	3b c1                	cmp    eax,ecx
   140877855:	0f 4e c8             	cmovle ecx,eax
   140877858:	33 c0                	xor    eax,eax
   14087785a:	85 c9                	test   ecx,ecx
   14087785c:	0f 49 c1             	cmovns eax,ecx
   14087785f:	89 44 24 64          	mov    DWORD PTR [rsp+0x64],eax
   140877863:	8b f8                	mov    edi,eax
   140877865:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140877869:	03 c3                	add    eax,ebx
   14087786b:	89 44 24 60          	mov    DWORD PTR [rsp+0x60],eax
   14087786f:	3b f8                	cmp    edi,eax
   140877871:	0f 8d 77 08 00 00    	jge    0x1408780ee
   140877877:	41 ff c4             	inc    r12d
   14087787a:	44 89 64 24 7c       	mov    DWORD PTR [rsp+0x7c],r12d
   14087787f:	48 8d 1d b2 ea dc 01 	lea    rbx,[rip+0x1dceab2]        # 0x142646338
   140877886:	41 3b fe             	cmp    edi,r14d
   140877889:	0f 8d 53 08 00 00    	jge    0x1408780e2
   14087788f:	48 63 d7             	movsxd rdx,edi
   140877892:	48 8d 0d 6f 31 dc 01 	lea    rcx,[rip+0x1dc316f]        # 0x14263aa08
   140877899:	e8 12 79 7f ff       	call   0x14006f1b0
   14087789e:	4c 8b 28             	mov    r13,QWORD PTR [rax]
   1408778a1:	4c 89 6d a8          	mov    QWORD PTR [rbp-0x58],r13
   1408778a5:	45 33 c0             	xor    r8d,r8d
   1408778a8:	ba 07 00 00 00       	mov    edx,0x7
   1408778ad:	41 b1 01             	mov    r9b,0x1
   1408778b0:	48 8d 0d 29 ca dc 01 	lea    rcx,[rip+0x1dcca29]        # 0x1426442e0
   1408778b7:	e8 04 38 84 ff       	call   0x1400bb0c0
   1408778bc:	41 8b ff             	mov    edi,r15d
   1408778bf:	44 3b fe             	cmp    r15d,esi
   1408778c2:	0f 8f 00 01 00 00    	jg     0x1408779c8
   1408778c8:	45 8d 74 24 02       	lea    r14d,[r12+0x2]
   1408778cd:	41 ff cc             	dec    r12d
   1408778d0:	4c 8d 2d 09 ca dc 01 	lea    r13,[rip+0x1dcca09]        # 0x1426442e0
   1408778d7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1408778e0:	41 8b dc             	mov    ebx,r12d
   1408778e3:	45 3b e6             	cmp    r12d,r14d
   1408778e6:	0f 8d c2 00 00 00    	jge    0x1408779ae
   1408778ec:	3b fe                	cmp    edi,esi
   1408778ee:	75 5d                	jne    0x14087794d
   1408778f0:	48 8d 35 a9 e3 dc 01 	lea    rsi,[rip+0x1dce3a9]        # 0x142645ca0
   1408778f7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140877900:	44 8b c7             	mov    r8d,edi
   140877903:	8b d3                	mov    edx,ebx
   140877905:	49 8b cd             	mov    rcx,r13
   140877908:	e8 a3 37 84 ff       	call   0x1400bb0b0
   14087790d:	49 8b cd             	mov    rcx,r13
   140877910:	41 3b ff             	cmp    edi,r15d
   140877913:	75 05                	jne    0x14087791a
   140877915:	8b 56 e8             	mov    edx,DWORD PTR [rsi-0x18]
   140877918:	eb 02                	jmp    0x14087791c
   14087791a:	8b 16                	mov    edx,DWORD PTR [rsi]
   14087791c:	e8 ef 01 26 00       	call   0x140ad7b10
   140877921:	33 d2                	xor    edx,edx
   140877923:	48 8d 0d 36 fd b4 01 	lea    rcx,[rip+0x1b4fd36]        # 0x1423c7660
   14087792a:	e8 f1 a5 7f ff       	call   0x140071f20
   14087792f:	84 c0                	test   al,al
   140877931:	74 0d                	je     0x140877940
   140877933:	41 b0 01             	mov    r8b,0x1
   140877936:	33 d2                	xor    edx,edx
   140877938:	49 8b cd             	mov    rcx,r13
   14087793b:	e8 e0 37 84 ff       	call   0x1400bb120
   140877940:	ff c3                	inc    ebx
   140877942:	48 83 c6 04          	add    rsi,0x4
   140877946:	41 3b de             	cmp    ebx,r14d
   140877949:	7c b5                	jl     0x140877900
   14087794b:	eb 5e                	jmp    0x1408779ab
   14087794d:	48 8d 35 40 e3 dc 01 	lea    rsi,[rip+0x1dce340]        # 0x142645c94
   140877954:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140877958:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140877960:	44 8b c7             	mov    r8d,edi
   140877963:	8b d3                	mov    edx,ebx
   140877965:	49 8b cd             	mov    rcx,r13
   140877968:	e8 43 37 84 ff       	call   0x1400bb0b0
   14087796d:	49 8b cd             	mov    rcx,r13
   140877970:	41 3b ff             	cmp    edi,r15d
   140877973:	75 05                	jne    0x14087797a
   140877975:	8b 56 f4             	mov    edx,DWORD PTR [rsi-0xc]
   140877978:	eb 02                	jmp    0x14087797c
   14087797a:	8b 16                	mov    edx,DWORD PTR [rsi]
   14087797c:	e8 8f 01 26 00       	call   0x140ad7b10
   140877981:	33 d2                	xor    edx,edx
   140877983:	48 8d 0d d6 fc b4 01 	lea    rcx,[rip+0x1b4fcd6]        # 0x1423c7660
   14087798a:	e8 91 a5 7f ff       	call   0x140071f20
   14087798f:	84 c0                	test   al,al
   140877991:	74 0d                	je     0x1408779a0
   140877993:	41 b0 01             	mov    r8b,0x1
   140877996:	33 d2                	xor    edx,edx
   140877998:	49 8b cd             	mov    rcx,r13
   14087799b:	e8 80 37 84 ff       	call   0x1400bb120
   1408779a0:	ff c3                	inc    ebx
   1408779a2:	48 83 c6 04          	add    rsi,0x4
   1408779a6:	41 3b de             	cmp    ebx,r14d
   1408779a9:	7c b5                	jl     0x140877960
   1408779ab:	8b 75 80             	mov    esi,DWORD PTR [rbp-0x80]
   1408779ae:	ff c7                	inc    edi
   1408779b0:	3b fe                	cmp    edi,esi
   1408779b2:	0f 8e 28 ff ff ff    	jle    0x1408778e0
   1408779b8:	4c 8b 6d a8          	mov    r13,QWORD PTR [rbp-0x58]
   1408779bc:	44 8b 64 24 7c       	mov    r12d,DWORD PTR [rsp+0x7c]
   1408779c1:	48 8d 1d 70 e9 dc 01 	lea    rbx,[rip+0x1dce970]        # 0x142646338
   1408779c8:	41 0f bf 55 00       	movsx  edx,WORD PTR [r13+0x0]
   1408779cd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   1408779d2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   1408779d6:	e8 45 3a 9f ff       	call   0x14026b420
   1408779db:	83 f8 ff             	cmp    eax,0xffffffff
   1408779de:	0f 84 8e 00 00 00    	je     0x140877a72
   1408779e4:	48 98                	cdqe
   1408779e6:	45 8d 74 24 ff       	lea    r14d,[r12-0x1]
   1408779eb:	4c 8d 24 40          	lea    r12,[rax+rax*2]
   1408779ef:	49 c1 e4 04          	shl    r12,0x4
   1408779f3:	4c 03 e3             	add    r12,rbx
   1408779f6:	41 bd 03 00 00 00    	mov    r13d,0x3
   1408779fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140877a00:	41 8b df             	mov    ebx,r15d
   140877a03:	49 8b fc             	mov    rdi,r12
   140877a06:	be 04 00 00 00       	mov    esi,0x4
   140877a0b:	4c 8d 3d ce c8 dc 01 	lea    r15,[rip+0x1dcc8ce]        # 0x1426442e0
   140877a12:	44 8b c3             	mov    r8d,ebx
   140877a15:	41 8b d6             	mov    edx,r14d
   140877a18:	49 8b cf             	mov    rcx,r15
   140877a1b:	e8 90 36 84 ff       	call   0x1400bb0b0
   140877a20:	8b 17                	mov    edx,DWORD PTR [rdi]
   140877a22:	49 8b cf             	mov    rcx,r15
   140877a25:	e8 e6 00 26 00       	call   0x140ad7b10
   140877a2a:	33 d2                	xor    edx,edx
   140877a2c:	48 8d 0d 2d fc b4 01 	lea    rcx,[rip+0x1b4fc2d]        # 0x1423c7660
   140877a33:	e8 e8 a4 7f ff       	call   0x140071f20
   140877a38:	84 c0                	test   al,al
   140877a3a:	74 0d                	je     0x140877a49
   140877a3c:	41 b0 01             	mov    r8b,0x1
   140877a3f:	33 d2                	xor    edx,edx
   140877a41:	49 8b cf             	mov    rcx,r15
   140877a44:	e8 d7 36 84 ff       	call   0x1400bb120
   140877a49:	ff c3                	inc    ebx
   140877a4b:	48 83 c7 0c          	add    rdi,0xc
   140877a4f:	48 83 ee 01          	sub    rsi,0x1
   140877a53:	75 bd                	jne    0x140877a12
   140877a55:	41 ff c6             	inc    r14d
   140877a58:	49 83 c4 04          	add    r12,0x4
   140877a5c:	49 83 ed 01          	sub    r13,0x1
   140877a60:	44 8b 7d 8c          	mov    r15d,DWORD PTR [rbp-0x74]
   140877a64:	75 9a                	jne    0x140877a00
   140877a66:	4c 8b 6d a8          	mov    r13,QWORD PTR [rbp-0x58]
   140877a6a:	8b 75 80             	mov    esi,DWORD PTR [rbp-0x80]
   140877a6d:	44 8b 64 24 7c       	mov    r12d,DWORD PTR [rsp+0x7c]
   140877a72:	45 8d 47 04          	lea    r8d,[r15+0x4]
   140877a76:	41 8b d4             	mov    edx,r12d
   140877a79:	4c 8d 35 60 c8 dc 01 	lea    r14,[rip+0x1dcc860]        # 0x1426442e0
   140877a80:	49 8b ce             	mov    rcx,r14
   140877a83:	e8 28 36 84 ff       	call   0x1400bb0b0
   140877a88:	8b 7c 24 78          	mov    edi,DWORD PTR [rsp+0x78]
   140877a8c:	8b d7                	mov    edx,edi
   140877a8e:	2b 54 24 64          	sub    edx,DWORD PTR [rsp+0x64]
   140877a92:	83 c2 52             	add    edx,0x52
   140877a95:	45 33 c0             	xor    r8d,r8d
   140877a98:	48 8d 0d 21 07 03 01 	lea    rcx,[rip+0x1030721]        # 0x1418a81c0
   140877a9f:	e8 4c ea 3b 00       	call   0x140c364f0
   140877aa4:	45 8d 47 06          	lea    r8d,[r15+0x6]
   140877aa8:	41 8b d4             	mov    edx,r12d
   140877aab:	49 8b ce             	mov    rcx,r14
   140877aae:	e8 fd 35 84 ff       	call   0x1400bb0b0
   140877ab3:	48 8d 15 a6 6d e3 00 	lea    rdx,[rip+0xe36da6]        # 0x1416ae860
   140877aba:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877abe:	e8 1d 06 7f ff       	call   0x1400680e0
   140877ac3:	90                   	nop
   140877ac4:	45 33 c9             	xor    r9d,r9d
   140877ac7:	45 33 c0             	xor    r8d,r8d
   140877aca:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877ace:	49 8b ce             	mov    rcx,r14
   140877ad1:	e8 ca ee 25 00       	call   0x140ad69a0
   140877ad6:	90                   	nop
   140877ad7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877adb:	e8 e0 02 7f ff       	call   0x140067dc0
   140877ae0:	45 33 c0             	xor    r8d,r8d
   140877ae3:	ba 01 00 00 00       	mov    edx,0x1
   140877ae8:	44 0f b6 ca          	movzx  r9d,dl
   140877aec:	49 8b ce             	mov    rcx,r14
   140877aef:	e8 cc 35 84 ff       	call   0x1400bb0c0
   140877af4:	45 8d 47 06          	lea    r8d,[r15+0x6]
   140877af8:	41 8b d4             	mov    edx,r12d
   140877afb:	49 8b ce             	mov    rcx,r14
   140877afe:	e8 ad 35 84 ff       	call   0x1400bb0b0
   140877b03:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140877b07:	e8 14 7b 7f ff       	call   0x14006f620
   140877b0c:	90                   	nop
   140877b0d:	bb 02 00 00 00       	mov    ebx,0x2
   140877b12:	66 89 5c 24 20       	mov    WORD PTR [rsp+0x20],bx
   140877b17:	45 33 c9             	xor    r9d,r9d
   140877b1a:	45 0f b7 45 00       	movzx  r8d,WORD PTR [r13+0x0]
   140877b1f:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140877b23:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   140877b28:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   140877b2c:	e8 0f 7a ab 00       	call   0x14132f540
   140877b31:	41 b9 24 00 00 00    	mov    r9d,0x24
   140877b37:	45 33 c0             	xor    r8d,r8d
   140877b3a:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140877b3e:	49 8b ce             	mov    rcx,r14
   140877b41:	e8 5a ee 25 00       	call   0x140ad69a0
   140877b46:	45 8d 47 2c          	lea    r8d,[r15+0x2c]
   140877b4a:	41 8b d4             	mov    edx,r12d
   140877b4d:	49 8b ce             	mov    rcx,r14
   140877b50:	e8 5b 35 84 ff       	call   0x1400bb0b0
   140877b55:	41 8b 45 04          	mov    eax,DWORD PTR [r13+0x4]
   140877b59:	41 f7 45 0c 00 80 00 00 	test   DWORD PTR [r13+0xc],0x8000
   140877b61:	8d 48 ff             	lea    ecx,[rax-0x1]
   140877b64:	0f 44 c8             	cmove  ecx,eax
   140877b67:	83 f9 fd             	cmp    ecx,0xfffffffd
   140877b6a:	7f 3c                	jg     0x140877ba8
   140877b6c:	45 33 c0             	xor    r8d,r8d
   140877b6f:	ba 05 00 00 00       	mov    edx,0x5
   140877b74:	41 b1 01             	mov    r9b,0x1
   140877b77:	49 8b ce             	mov    rcx,r14
   140877b7a:	e8 41 35 84 ff       	call   0x1400bb0c0
   140877b7f:	48 8d 15 92 6d e3 00 	lea    rdx,[rip+0xe36d92]        # 0x1416ae918
   140877b86:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877b8a:	e8 51 05 7f ff       	call   0x1400680e0
   140877b8f:	90                   	nop
   140877b90:	45 33 c9             	xor    r9d,r9d
   140877b93:	41 b0 03             	mov    r8b,0x3
   140877b96:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877b9a:	49 8b ce             	mov    rcx,r14
   140877b9d:	e8 fe ed 25 00       	call   0x140ad69a0
   140877ba2:	90                   	nop
   140877ba3:	e9 73 01 00 00       	jmp    0x140877d1b
   140877ba8:	83 f9 fe             	cmp    ecx,0xfffffffe
   140877bab:	75 3c                	jne    0x140877be9
   140877bad:	45 33 c0             	xor    r8d,r8d
   140877bb0:	ba 04 00 00 00       	mov    edx,0x4
   140877bb5:	41 b1 01             	mov    r9b,0x1
   140877bb8:	49 8b ce             	mov    rcx,r14
   140877bbb:	e8 00 35 84 ff       	call   0x1400bb0c0
   140877bc0:	48 8d 15 39 6d e3 00 	lea    rdx,[rip+0xe36d39]        # 0x1416ae900
   140877bc7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877bcb:	e8 10 05 7f ff       	call   0x1400680e0
   140877bd0:	90                   	nop
   140877bd1:	45 33 c9             	xor    r9d,r9d
   140877bd4:	41 b0 03             	mov    r8b,0x3
   140877bd7:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877bdb:	49 8b ce             	mov    rcx,r14
   140877bde:	e8 bd ed 25 00       	call   0x140ad69a0
   140877be3:	90                   	nop
   140877be4:	e9 32 01 00 00       	jmp    0x140877d1b
   140877be9:	83 f9 ff             	cmp    ecx,0xffffffff
   140877bec:	75 3c                	jne    0x140877c2a
   140877bee:	45 33 c0             	xor    r8d,r8d
   140877bf1:	ba 06 00 00 00       	mov    edx,0x6
   140877bf6:	41 b1 01             	mov    r9b,0x1
   140877bf9:	49 8b ce             	mov    rcx,r14
   140877bfc:	e8 bf 34 84 ff       	call   0x1400bb0c0
   140877c01:	48 8d 15 38 6d e3 00 	lea    rdx,[rip+0xe36d38]        # 0x1416ae940
   140877c08:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877c0c:	e8 cf 04 7f ff       	call   0x1400680e0
   140877c11:	90                   	nop
   140877c12:	45 33 c9             	xor    r9d,r9d
   140877c15:	41 b0 03             	mov    r8b,0x3
   140877c18:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877c1c:	49 8b ce             	mov    rcx,r14
   140877c1f:	e8 7c ed 25 00       	call   0x140ad69a0
   140877c24:	90                   	nop
   140877c25:	e9 f1 00 00 00       	jmp    0x140877d1b
   140877c2a:	85 c9                	test   ecx,ecx
   140877c2c:	75 3c                	jne    0x140877c6a
   140877c2e:	45 33 c0             	xor    r8d,r8d
   140877c31:	ba 07 00 00 00       	mov    edx,0x7
   140877c36:	41 b1 01             	mov    r9b,0x1
   140877c39:	49 8b ce             	mov    rcx,r14
   140877c3c:	e8 7f 34 84 ff       	call   0x1400bb0c0
   140877c41:	48 8d 15 e8 6c e3 00 	lea    rdx,[rip+0xe36ce8]        # 0x1416ae930
   140877c48:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877c4c:	e8 8f 04 7f ff       	call   0x1400680e0
   140877c51:	90                   	nop
   140877c52:	45 33 c9             	xor    r9d,r9d
   140877c55:	41 b0 03             	mov    r8b,0x3
   140877c58:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877c5c:	49 8b ce             	mov    rcx,r14
   140877c5f:	e8 3c ed 25 00       	call   0x140ad69a0
   140877c64:	90                   	nop
   140877c65:	e9 b1 00 00 00       	jmp    0x140877d1b
   140877c6a:	83 f9 01             	cmp    ecx,0x1
   140877c6d:	75 36                	jne    0x140877ca5
   140877c6f:	45 33 c0             	xor    r8d,r8d
   140877c72:	8b d3                	mov    edx,ebx
   140877c74:	45 33 c9             	xor    r9d,r9d
   140877c77:	49 8b ce             	mov    rcx,r14
   140877c7a:	e8 41 34 84 ff       	call   0x1400bb0c0
   140877c7f:	48 8d 15 4a 6c e3 00 	lea    rdx,[rip+0xe36c4a]        # 0x1416ae8d0
   140877c86:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877c8a:	e8 51 04 7f ff       	call   0x1400680e0
   140877c8f:	90                   	nop
   140877c90:	45 33 c9             	xor    r9d,r9d
   140877c93:	41 b0 03             	mov    r8b,0x3
   140877c96:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877c9a:	49 8b ce             	mov    rcx,r14
   140877c9d:	e8 fe ec 25 00       	call   0x140ad69a0
   140877ca2:	90                   	nop
   140877ca3:	eb 76                	jmp    0x140877d1b
   140877ca5:	3b cb                	cmp    ecx,ebx
   140877ca7:	75 36                	jne    0x140877cdf
   140877ca9:	45 33 c0             	xor    r8d,r8d
   140877cac:	8b d3                	mov    edx,ebx
   140877cae:	41 b1 01             	mov    r9b,0x1
   140877cb1:	49 8b ce             	mov    rcx,r14
   140877cb4:	e8 07 34 84 ff       	call   0x1400bb0c0
   140877cb9:	48 8d 15 00 6c e3 00 	lea    rdx,[rip+0xe36c00]        # 0x1416ae8c0
   140877cc0:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877cc4:	e8 17 04 7f ff       	call   0x1400680e0
   140877cc9:	90                   	nop
   140877cca:	45 33 c9             	xor    r9d,r9d
   140877ccd:	41 b0 03             	mov    r8b,0x3
   140877cd0:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877cd4:	49 8b ce             	mov    rcx,r14
   140877cd7:	e8 c4 ec 25 00       	call   0x140ad69a0
   140877cdc:	90                   	nop
   140877cdd:	eb 3c                	jmp    0x140877d1b
   140877cdf:	83 f9 03             	cmp    ecx,0x3
   140877ce2:	7c 40                	jl     0x140877d24
   140877ce4:	45 33 c0             	xor    r8d,r8d
   140877ce7:	ba 03 00 00 00       	mov    edx,0x3
   140877cec:	41 b1 01             	mov    r9b,0x1
   140877cef:	49 8b ce             	mov    rcx,r14
   140877cf2:	e8 c9 33 84 ff       	call   0x1400bb0c0
   140877cf7:	48 8d 15 f2 6b e3 00 	lea    rdx,[rip+0xe36bf2]        # 0x1416ae8f0
   140877cfe:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877d02:	e8 d9 03 7f ff       	call   0x1400680e0
   140877d07:	90                   	nop
   140877d08:	45 33 c9             	xor    r9d,r9d
   140877d0b:	41 b0 03             	mov    r8b,0x3
   140877d0e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877d12:	49 8b ce             	mov    rcx,r14
   140877d15:	e8 86 ec 25 00       	call   0x140ad69a0
   140877d1a:	90                   	nop
   140877d1b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877d1f:	e8 9c 00 7f ff       	call   0x140067dc0
   140877d24:	45 33 c0             	xor    r8d,r8d
   140877d27:	ba 07 00 00 00       	mov    edx,0x7
   140877d2c:	41 b1 01             	mov    r9b,0x1
   140877d2f:	49 8b ce             	mov    rcx,r14
   140877d32:	e8 89 33 84 ff       	call   0x1400bb0c0
   140877d37:	48 8d 15 86 c3 d6 00 	lea    rdx,[rip+0xd6c386]        # 0x1415e40c4
   140877d3e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877d42:	e8 99 03 7f ff       	call   0x1400680e0
   140877d47:	90                   	nop
   140877d48:	45 33 c9             	xor    r9d,r9d
   140877d4b:	41 b0 03             	mov    r8b,0x3
   140877d4e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877d52:	49 8b ce             	mov    rcx,r14
   140877d55:	e8 46 ec 25 00       	call   0x140ad69a0
   140877d5a:	90                   	nop
   140877d5b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877d5f:	e8 5c 00 7f ff       	call   0x140067dc0
   140877d64:	41 83 7d 08 fd       	cmp    DWORD PTR [r13+0x8],0xfffffffd
   140877d69:	7f 40                	jg     0x140877dab
   140877d6b:	45 33 c0             	xor    r8d,r8d
   140877d6e:	ba 05 00 00 00       	mov    edx,0x5
   140877d73:	41 b1 01             	mov    r9b,0x1
   140877d76:	49 8b ce             	mov    rcx,r14
   140877d79:	e8 42 33 84 ff       	call   0x1400bb0c0
   140877d7e:	48 8d 15 5b 6b e3 00 	lea    rdx,[rip+0xe36b5b]        # 0x1416ae8e0
   140877d85:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877d89:	e8 52 03 7f ff       	call   0x1400680e0
   140877d8e:	90                   	nop
   140877d8f:	45 33 c9             	xor    r9d,r9d
   140877d92:	45 33 c0             	xor    r8d,r8d
   140877d95:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877d99:	49 8b ce             	mov    rcx,r14
   140877d9c:	e8 ff eb 25 00       	call   0x140ad69a0
   140877da1:	90                   	nop
   140877da2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877da6:	e8 15 00 7f ff       	call   0x140067dc0
   140877dab:	41 83 7d 08 fe       	cmp    DWORD PTR [r13+0x8],0xfffffffe
   140877db0:	75 40                	jne    0x140877df2
   140877db2:	45 33 c0             	xor    r8d,r8d
   140877db5:	ba 04 00 00 00       	mov    edx,0x4
   140877dba:	41 b1 01             	mov    r9b,0x1
   140877dbd:	49 8b ce             	mov    rcx,r14
   140877dc0:	e8 fb 32 84 ff       	call   0x1400bb0c0
   140877dc5:	48 8d 15 14 6a e3 00 	lea    rdx,[rip+0xe36a14]        # 0x1416ae7e0
   140877dcc:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877dd0:	e8 0b 03 7f ff       	call   0x1400680e0
   140877dd5:	90                   	nop
   140877dd6:	45 33 c9             	xor    r9d,r9d
   140877dd9:	45 33 c0             	xor    r8d,r8d
   140877ddc:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877de0:	49 8b ce             	mov    rcx,r14
   140877de3:	e8 b8 eb 25 00       	call   0x140ad69a0
   140877de8:	90                   	nop
   140877de9:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877ded:	e8 ce ff 7e ff       	call   0x140067dc0
   140877df2:	41 83 7d 08 ff       	cmp    DWORD PTR [r13+0x8],0xffffffff
   140877df7:	75 40                	jne    0x140877e39
   140877df9:	45 33 c0             	xor    r8d,r8d
   140877dfc:	ba 06 00 00 00       	mov    edx,0x6
   140877e01:	41 b1 01             	mov    r9b,0x1
   140877e04:	49 8b ce             	mov    rcx,r14
   140877e07:	e8 b4 32 84 ff       	call   0x1400bb0c0
   140877e0c:	48 8d 15 b5 69 e3 00 	lea    rdx,[rip+0xe369b5]        # 0x1416ae7c8
   140877e13:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877e17:	e8 c4 02 7f ff       	call   0x1400680e0
   140877e1c:	90                   	nop
   140877e1d:	45 33 c9             	xor    r9d,r9d
   140877e20:	45 33 c0             	xor    r8d,r8d
   140877e23:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877e27:	49 8b ce             	mov    rcx,r14
   140877e2a:	e8 71 eb 25 00       	call   0x140ad69a0
   140877e2f:	90                   	nop
   140877e30:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877e34:	e8 87 ff 7e ff       	call   0x140067dc0
   140877e39:	41 83 7d 08 00       	cmp    DWORD PTR [r13+0x8],0x0
   140877e3e:	75 40                	jne    0x140877e80
   140877e40:	45 33 c0             	xor    r8d,r8d
   140877e43:	ba 07 00 00 00       	mov    edx,0x7
   140877e48:	41 b1 01             	mov    r9b,0x1
   140877e4b:	49 8b ce             	mov    rcx,r14
   140877e4e:	e8 6d 32 84 ff       	call   0x1400bb0c0
   140877e53:	48 8d 15 a6 69 e3 00 	lea    rdx,[rip+0xe369a6]        # 0x1416ae800
   140877e5a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877e5e:	e8 7d 02 7f ff       	call   0x1400680e0
   140877e63:	90                   	nop
   140877e64:	45 33 c9             	xor    r9d,r9d
   140877e67:	45 33 c0             	xor    r8d,r8d
   140877e6a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877e6e:	49 8b ce             	mov    rcx,r14
   140877e71:	e8 2a eb 25 00       	call   0x140ad69a0
   140877e76:	90                   	nop
   140877e77:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877e7b:	e8 40 ff 7e ff       	call   0x140067dc0
   140877e80:	41 83 7d 08 01       	cmp    DWORD PTR [r13+0x8],0x1
   140877e85:	75 3d                	jne    0x140877ec4
   140877e87:	45 33 c0             	xor    r8d,r8d
   140877e8a:	8b d3                	mov    edx,ebx
   140877e8c:	45 33 c9             	xor    r9d,r9d
   140877e8f:	49 8b ce             	mov    rcx,r14
   140877e92:	e8 29 32 84 ff       	call   0x1400bb0c0
   140877e97:	48 8d 15 56 69 e3 00 	lea    rdx,[rip+0xe36956]        # 0x1416ae7f4
   140877e9e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877ea2:	e8 39 02 7f ff       	call   0x1400680e0
   140877ea7:	90                   	nop
   140877ea8:	45 33 c9             	xor    r9d,r9d
   140877eab:	45 33 c0             	xor    r8d,r8d
   140877eae:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877eb2:	49 8b ce             	mov    rcx,r14
   140877eb5:	e8 e6 ea 25 00       	call   0x140ad69a0
   140877eba:	90                   	nop
   140877ebb:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877ebf:	e8 fc fe 7e ff       	call   0x140067dc0
   140877ec4:	41 83 7d 08 02       	cmp    DWORD PTR [r13+0x8],0x2
   140877ec9:	75 3d                	jne    0x140877f08
   140877ecb:	45 33 c0             	xor    r8d,r8d
   140877ece:	8b d3                	mov    edx,ebx
   140877ed0:	41 b1 01             	mov    r9b,0x1
   140877ed3:	49 8b ce             	mov    rcx,r14
   140877ed6:	e8 e5 31 84 ff       	call   0x1400bb0c0
   140877edb:	48 8d 15 c6 68 e3 00 	lea    rdx,[rip+0xe368c6]        # 0x1416ae7a8
   140877ee2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877ee6:	e8 f5 01 7f ff       	call   0x1400680e0
   140877eeb:	90                   	nop
   140877eec:	45 33 c9             	xor    r9d,r9d
   140877eef:	45 33 c0             	xor    r8d,r8d
   140877ef2:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877ef6:	49 8b ce             	mov    rcx,r14
   140877ef9:	e8 a2 ea 25 00       	call   0x140ad69a0
   140877efe:	90                   	nop
   140877eff:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877f03:	e8 b8 fe 7e ff       	call   0x140067dc0
   140877f08:	41 83 7d 08 03       	cmp    DWORD PTR [r13+0x8],0x3
   140877f0d:	7c 40                	jl     0x140877f4f
   140877f0f:	45 33 c0             	xor    r8d,r8d
   140877f12:	ba 03 00 00 00       	mov    edx,0x3
   140877f17:	41 b1 01             	mov    r9b,0x1
   140877f1a:	49 8b ce             	mov    rcx,r14
   140877f1d:	e8 9e 31 84 ff       	call   0x1400bb0c0
   140877f22:	48 8d 15 6f 68 e3 00 	lea    rdx,[rip+0xe3686f]        # 0x1416ae798
   140877f29:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877f2d:	e8 ae 01 7f ff       	call   0x1400680e0
   140877f32:	90                   	nop
   140877f33:	45 33 c9             	xor    r9d,r9d
   140877f36:	45 33 c0             	xor    r8d,r8d
   140877f39:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877f3d:	49 8b ce             	mov    rcx,r14
   140877f40:	e8 5b ea 25 00       	call   0x140ad69a0
   140877f45:	90                   	nop
   140877f46:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877f4a:	e8 71 fe 7e ff       	call   0x140067dc0
   140877f4f:	44 8d 46 fe          	lea    r8d,[rsi-0x2]
   140877f53:	41 8b d4             	mov    edx,r12d
   140877f56:	49 8b ce             	mov    rcx,r14
   140877f59:	e8 52 31 84 ff       	call   0x1400bb0b0
   140877f5e:	41 8b 45 0c          	mov    eax,DWORD PTR [r13+0xc]
   140877f62:	a8 20                	test   al,0x20
   140877f64:	74 39                	je     0x140877f9f
   140877f66:	45 33 c0             	xor    r8d,r8d
   140877f69:	8b d3                	mov    edx,ebx
   140877f6b:	41 b1 01             	mov    r9b,0x1
   140877f6e:	49 8b ce             	mov    rcx,r14
   140877f71:	e8 4a 31 84 ff       	call   0x1400bb0c0
   140877f76:	48 8d 15 0f 10 d7 00 	lea    rdx,[rip+0xd7100f]        # 0x1415e8f8c
   140877f7d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877f81:	e8 5a 01 7f ff       	call   0x1400680e0
   140877f86:	90                   	nop
   140877f87:	45 33 c9             	xor    r9d,r9d
   140877f8a:	45 33 c0             	xor    r8d,r8d
   140877f8d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877f91:	49 8b ce             	mov    rcx,r14
   140877f94:	e8 07 ea 25 00       	call   0x140ad69a0
   140877f99:	90                   	nop
   140877f9a:	e9 b4 00 00 00       	jmp    0x140878053
   140877f9f:	a8 40                	test   al,0x40
   140877fa1:	74 36                	je     0x140877fd9
   140877fa3:	45 33 c0             	xor    r8d,r8d
   140877fa6:	8b d3                	mov    edx,ebx
   140877fa8:	45 33 c9             	xor    r9d,r9d
   140877fab:	49 8b ce             	mov    rcx,r14
   140877fae:	e8 0d 31 84 ff       	call   0x1400bb0c0
   140877fb3:	48 8d 15 d2 0f d7 00 	lea    rdx,[rip+0xd70fd2]        # 0x1415e8f8c
   140877fba:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877fbe:	e8 1d 01 7f ff       	call   0x1400680e0
   140877fc3:	90                   	nop
   140877fc4:	45 33 c9             	xor    r9d,r9d
   140877fc7:	45 33 c0             	xor    r8d,r8d
   140877fca:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140877fce:	49 8b ce             	mov    rcx,r14
   140877fd1:	e8 ca e9 25 00       	call   0x140ad69a0
   140877fd6:	90                   	nop
   140877fd7:	eb 7a                	jmp    0x140878053
   140877fd9:	84 c0                	test   al,al
   140877fdb:	79 39                	jns    0x140878016
   140877fdd:	45 33 c0             	xor    r8d,r8d
   140877fe0:	ba 06 00 00 00       	mov    edx,0x6
   140877fe5:	41 b1 01             	mov    r9b,0x1
   140877fe8:	49 8b ce             	mov    rcx,r14
   140877feb:	e8 d0 30 84 ff       	call   0x1400bb0c0
   140877ff0:	48 8d 15 85 e6 dc 00 	lea    rdx,[rip+0xdce685]        # 0x14164667c
   140877ff7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140877ffb:	e8 e0 00 7f ff       	call   0x1400680e0
   140878000:	90                   	nop
   140878001:	45 33 c9             	xor    r9d,r9d
   140878004:	45 33 c0             	xor    r8d,r8d
   140878007:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087800b:	49 8b ce             	mov    rcx,r14
   14087800e:	e8 8d e9 25 00       	call   0x140ad69a0
   140878013:	90                   	nop
   140878014:	eb 3d                	jmp    0x140878053
   140878016:	0f ba e0 08          	bt     eax,0x8
   14087801a:	73 40                	jae    0x14087805c
   14087801c:	45 33 c0             	xor    r8d,r8d
   14087801f:	ba 04 00 00 00       	mov    edx,0x4
   140878024:	41 b1 01             	mov    r9b,0x1
   140878027:	49 8b ce             	mov    rcx,r14
   14087802a:	e8 91 30 84 ff       	call   0x1400bb0c0
   14087802f:	48 8d 15 46 e6 dc 00 	lea    rdx,[rip+0xdce646]        # 0x14164667c
   140878036:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087803a:	e8 a1 00 7f ff       	call   0x1400680e0
   14087803f:	90                   	nop
   140878040:	45 33 c9             	xor    r9d,r9d
   140878043:	45 33 c0             	xor    r8d,r8d
   140878046:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087804a:	49 8b ce             	mov    rcx,r14
   14087804d:	e8 4e e9 25 00       	call   0x140ad69a0
   140878052:	90                   	nop
   140878053:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878057:	e8 64 fd 7e ff       	call   0x140067dc0
   14087805c:	41 f7 45 0c 00 02 00 00 	test   DWORD PTR [r13+0xc],0x200
   140878064:	74 4f                	je     0x1408780b5
   140878066:	44 8d 46 ff          	lea    r8d,[rsi-0x1]
   14087806a:	41 8b d4             	mov    edx,r12d
   14087806d:	49 8b ce             	mov    rcx,r14
   140878070:	e8 3b 30 84 ff       	call   0x1400bb0b0
   140878075:	45 33 c0             	xor    r8d,r8d
   140878078:	ba 03 00 00 00       	mov    edx,0x3
   14087807d:	41 b1 01             	mov    r9b,0x1
   140878080:	49 8b ce             	mov    rcx,r14
   140878083:	e8 38 30 84 ff       	call   0x1400bb0c0
   140878088:	48 8d 15 9d 13 d7 00 	lea    rdx,[rip+0xd7139d]        # 0x1415e942c
   14087808f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878093:	e8 48 00 7f ff       	call   0x1400680e0
   140878098:	90                   	nop
   140878099:	45 33 c9             	xor    r9d,r9d
   14087809c:	45 33 c0             	xor    r8d,r8d
   14087809f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408780a3:	49 8b ce             	mov    rcx,r14
   1408780a6:	e8 f5 e8 25 00       	call   0x140ad69a0
   1408780ab:	90                   	nop
   1408780ac:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408780b0:	e8 0b fd 7e ff       	call   0x140067dc0
   1408780b5:	41 83 c4 03          	add    r12d,0x3
   1408780b9:	44 89 64 24 7c       	mov    DWORD PTR [rsp+0x7c],r12d
   1408780be:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1408780c2:	e8 f9 fc 7e ff       	call   0x140067dc0
   1408780c7:	ff c7                	inc    edi
   1408780c9:	89 7c 24 78          	mov    DWORD PTR [rsp+0x78],edi
   1408780cd:	3b 7c 24 60          	cmp    edi,DWORD PTR [rsp+0x60]
   1408780d1:	44 8b 75 88          	mov    r14d,DWORD PTR [rbp-0x78]
   1408780d5:	48 8d 1d 5c e2 dc 01 	lea    rbx,[rip+0x1dce25c]        # 0x142646338
   1408780dc:	0f 8c a4 f7 ff ff    	jl     0x140877886
   1408780e2:	8b 5d 98             	mov    ebx,DWORD PTR [rbp-0x68]
   1408780e5:	44 8b 65 84          	mov    r12d,DWORD PTR [rbp-0x7c]
   1408780e9:	4c 8b 6c 24 70       	mov    r13,QWORD PTR [rsp+0x70]
   1408780ee:	44 3b f3             	cmp    r14d,ebx
   1408780f1:	0f 8e a8 57 00 00    	jle    0x14087d89f
   1408780f7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408780fb:	e8 f0 31 84 ff       	call   0x1400bb2f0
   140878100:	8d 4b ff             	lea    ecx,[rbx-0x1]
   140878103:	41 8d 0c 4c          	lea    ecx,[r12+rcx*2]
   140878107:	03 cb                	add    ecx,ebx
   140878109:	41 8d 44 24 01       	lea    eax,[r12+0x1]
   14087810e:	45 8d 4e ff          	lea    r9d,[r14-0x1]
   140878112:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   140878116:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   14087811a:	89 5c 24 20          	mov    DWORD PTR [rsp+0x20],ebx
   14087811e:	45 33 c0             	xor    r8d,r8d
   140878121:	41 8b 95 f8 00 00 00 	mov    edx,DWORD PTR [r13+0xf8]
   140878128:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087812c:	e8 df 31 84 ff       	call   0x1400bb310
   140878131:	44 8d 4e 01          	lea    r9d,[rsi+0x1]
   140878135:	41 0f b6 85 fc 00 00 00 	movzx  eax,BYTE PTR [r13+0xfc]
   14087813d:	e9 41 57 00 00       	jmp    0x14087d883
   140878142:	49 8d 9d 00 01 00 00 	lea    rbx,[r13+0x100]
   140878149:	48 89 5d d8          	mov    QWORD PTR [rbp-0x28],rbx
   14087814d:	48 8b cb             	mov    rcx,rbx
   140878150:	e8 8b 6c 7f ff       	call   0x14006ede0
   140878155:	4c 8b c8             	mov    r9,rax
   140878158:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14087815c:	44 8b 6c 24 68       	mov    r13d,DWORD PTR [rsp+0x68]
   140878161:	41 ff c5             	inc    r13d
   140878164:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   140878168:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   14087816c:	41 ff c8             	dec    r8d
   14087816f:	44 8d 57 02          	lea    r10d,[rdi+0x2]
   140878173:	44 89 55 88          	mov    DWORD PTR [rbp-0x78],r10d
   140878177:	8b 4d b0             	mov    ecx,DWORD PTR [rbp-0x50]
   14087817a:	83 c1 ed             	add    ecx,0xffffffed
   14087817d:	41 2b ca             	sub    ecx,r10d
   140878180:	ff c1                	inc    ecx
   140878182:	b8 56 55 55 55       	mov    eax,0x55555556
   140878187:	f7 e9                	imul   ecx
   140878189:	8b f2                	mov    esi,edx
   14087818b:	c1 ee 1f             	shr    esi,0x1f
   14087818e:	03 f2                	add    esi,edx
   140878190:	89 74 24 60          	mov    DWORD PTR [rsp+0x60],esi
   140878194:	45 8d 70 fe          	lea    r14d,[r8-0x2]
   140878198:	44 3b ce             	cmp    r9d,esi
   14087819b:	45 0f 4e f0          	cmovle r14d,r8d
   14087819f:	44 89 74 24 7c       	mov    DWORD PTR [rsp+0x7c],r14d
   1408781a4:	45 8b e2             	mov    r12d,r10d
   1408781a7:	44 89 55 80          	mov    DWORD PTR [rbp-0x80],r10d
   1408781ab:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   1408781b0:	8b 80 20 01 00 00    	mov    eax,DWORD PTR [rax+0x120]
   1408781b6:	41 8b c9             	mov    ecx,r9d
   1408781b9:	2b ce                	sub    ecx,esi
   1408781bb:	3b c1                	cmp    eax,ecx
   1408781bd:	0f 4e c8             	cmovle ecx,eax
   1408781c0:	33 c0                	xor    eax,eax
   1408781c2:	85 c9                	test   ecx,ecx
   1408781c4:	0f 49 c1             	cmovns eax,ecx
   1408781c7:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
   1408781ca:	44 8b f8             	mov    r15d,eax
   1408781cd:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   1408781d1:	03 c6                	add    eax,esi
   1408781d3:	89 44 24 64          	mov    DWORD PTR [rsp+0x64],eax
   1408781d7:	44 3b f8             	cmp    r15d,eax
   1408781da:	0f 8d 52 0e 00 00    	jge    0x140879032
   1408781e0:	45 3b f9             	cmp    r15d,r9d
   1408781e3:	0f 8d 41 0e 00 00    	jge    0x14087902a
   1408781e9:	49 63 d7             	movsxd rdx,r15d
   1408781ec:	48 8b cb             	mov    rcx,rbx
   1408781ef:	e8 bc 6f 7f ff       	call   0x14006f1b0
   1408781f4:	4c 8b 38             	mov    r15,QWORD PTR [rax]
   1408781f7:	4c 89 7d a8          	mov    QWORD PTR [rbp-0x58],r15
   1408781fb:	45 33 c0             	xor    r8d,r8d
   1408781fe:	ba 07 00 00 00       	mov    edx,0x7
   140878203:	41 b1 01             	mov    r9b,0x1
   140878206:	48 8d 0d d3 c0 dc 01 	lea    rcx,[rip+0x1dcc0d3]        # 0x1426442e0
   14087820d:	e8 ae 2e 84 ff       	call   0x1400bb0c0
   140878212:	41 8b f5             	mov    esi,r13d
   140878215:	45 3b ee             	cmp    r13d,r14d
   140878218:	0f 8f fa 00 00 00    	jg     0x140878318
   14087821e:	45 8d 74 24 03       	lea    r14d,[r12+0x3]
   140878223:	8b 44 24 7c          	mov    eax,DWORD PTR [rsp+0x7c]
   140878227:	4c 8d 3d b2 c0 dc 01 	lea    r15,[rip+0x1dcc0b2]        # 0x1426442e0
   14087822e:	66 90                	xchg   ax,ax
   140878230:	41 8b dc             	mov    ebx,r12d
   140878233:	45 3b e6             	cmp    r12d,r14d
   140878236:	0f 8d ce 00 00 00    	jge    0x14087830a
   14087823c:	3b f0                	cmp    esi,eax
   14087823e:	75 5d                	jne    0x14087829d
   140878240:	48 8d 3d 59 da dc 01 	lea    rdi,[rip+0x1dcda59]        # 0x142645ca0
   140878247:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140878250:	44 8b c6             	mov    r8d,esi
   140878253:	8b d3                	mov    edx,ebx
   140878255:	49 8b cf             	mov    rcx,r15
   140878258:	e8 53 2e 84 ff       	call   0x1400bb0b0
   14087825d:	49 8b cf             	mov    rcx,r15
   140878260:	41 3b f5             	cmp    esi,r13d
   140878263:	75 05                	jne    0x14087826a
   140878265:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   140878268:	eb 02                	jmp    0x14087826c
   14087826a:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087826c:	e8 9f f8 25 00       	call   0x140ad7b10
   140878271:	33 d2                	xor    edx,edx
   140878273:	48 8d 0d e6 f3 b4 01 	lea    rcx,[rip+0x1b4f3e6]        # 0x1423c7660
   14087827a:	e8 a1 9c 7f ff       	call   0x140071f20
   14087827f:	84 c0                	test   al,al
   140878281:	74 0d                	je     0x140878290
   140878283:	41 b0 01             	mov    r8b,0x1
   140878286:	33 d2                	xor    edx,edx
   140878288:	49 8b cf             	mov    rcx,r15
   14087828b:	e8 90 2e 84 ff       	call   0x1400bb120
   140878290:	ff c3                	inc    ebx
   140878292:	48 83 c7 04          	add    rdi,0x4
   140878296:	41 3b de             	cmp    ebx,r14d
   140878299:	7c b5                	jl     0x140878250
   14087829b:	eb 69                	jmp    0x140878306
   14087829d:	48 8d 3d f0 d9 dc 01 	lea    rdi,[rip+0x1dcd9f0]        # 0x142645c94
   1408782a4:	4c 8d 25 35 c0 dc 01 	lea    r12,[rip+0x1dcc035]        # 0x1426442e0
   1408782ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1408782b0:	44 8b c6             	mov    r8d,esi
   1408782b3:	8b d3                	mov    edx,ebx
   1408782b5:	49 8b cc             	mov    rcx,r12
   1408782b8:	e8 f3 2d 84 ff       	call   0x1400bb0b0
   1408782bd:	49 8b cc             	mov    rcx,r12
   1408782c0:	41 3b f5             	cmp    esi,r13d
   1408782c3:	75 05                	jne    0x1408782ca
   1408782c5:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   1408782c8:	eb 02                	jmp    0x1408782cc
   1408782ca:	8b 17                	mov    edx,DWORD PTR [rdi]
   1408782cc:	e8 3f f8 25 00       	call   0x140ad7b10
   1408782d1:	33 d2                	xor    edx,edx
   1408782d3:	48 8d 0d 86 f3 b4 01 	lea    rcx,[rip+0x1b4f386]        # 0x1423c7660
   1408782da:	e8 41 9c 7f ff       	call   0x140071f20
   1408782df:	84 c0                	test   al,al
   1408782e1:	74 0d                	je     0x1408782f0
   1408782e3:	41 b0 01             	mov    r8b,0x1
   1408782e6:	33 d2                	xor    edx,edx
   1408782e8:	49 8b cc             	mov    rcx,r12
   1408782eb:	e8 30 2e 84 ff       	call   0x1400bb120
   1408782f0:	ff c3                	inc    ebx
   1408782f2:	48 83 c7 04          	add    rdi,0x4
   1408782f6:	41 3b de             	cmp    ebx,r14d
   1408782f9:	7c b5                	jl     0x1408782b0
   1408782fb:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   1408782ff:	4c 8d 3d da bf dc 01 	lea    r15,[rip+0x1dcbfda]        # 0x1426442e0
   140878306:	8b 44 24 7c          	mov    eax,DWORD PTR [rsp+0x7c]
   14087830a:	ff c6                	inc    esi
   14087830c:	3b f0                	cmp    esi,eax
   14087830e:	0f 8e 1c ff ff ff    	jle    0x140878230
   140878314:	4c 8b 7d a8          	mov    r15,QWORD PTR [rbp-0x58]
   140878318:	bb 6e 02 00 00       	mov    ebx,0x26e
   14087831d:	49 8b 0f             	mov    rcx,QWORD PTR [r15]
   140878320:	48 85 c9             	test   rcx,rcx
   140878323:	0f 84 6a 01 00 00    	je     0x140878493
   140878329:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14087832c:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   140878332:	48 8b f8             	mov    rdi,rax
   140878335:	48 85 c0             	test   rax,rax
   140878338:	0f 84 02 02 00 00    	je     0x140878540
   14087833e:	48 8b c8             	mov    rcx,rax
   140878341:	e8 9a 6a 7f ff       	call   0x14006ede0
   140878346:	48 85 c0             	test   rax,rax
   140878349:	0f 84 02 01 00 00    	je     0x140878451
   14087834f:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   140878353:	48 8b cf             	mov    rcx,rdi
   140878356:	e8 55 6e 7f ff       	call   0x14006f1b0
   14087835b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087835e:	48 83 c1 10          	add    rcx,0x10
   140878362:	48 8d 15 53 64 e3 00 	lea    rdx,[rip+0xe36453]        # 0x1416ae7bc
   140878369:	e8 a2 7a 7f ff       	call   0x14006fe10
   14087836e:	84 c0                	test   al,al
   140878370:	74 0a                	je     0x14087837c
   140878372:	bb 62 02 00 00       	mov    ebx,0x262
   140878377:	e9 d5 00 00 00       	jmp    0x140878451
   14087837c:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   140878380:	48 8b cf             	mov    rcx,rdi
   140878383:	e8 28 6e 7f ff       	call   0x14006f1b0
   140878388:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087838b:	48 83 c1 10          	add    rcx,0x10
   14087838f:	48 8d 15 1e 64 e3 00 	lea    rdx,[rip+0xe3641e]        # 0x1416ae7b4
   140878396:	e8 75 7a 7f ff       	call   0x14006fe10
   14087839b:	84 c0                	test   al,al
   14087839d:	74 0a                	je     0x1408783a9
   14087839f:	bb 63 02 00 00       	mov    ebx,0x263
   1408783a4:	e9 a8 00 00 00       	jmp    0x140878451
   1408783a9:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   1408783ad:	48 8b cf             	mov    rcx,rdi
   1408783b0:	e8 fb 6d 7f ff       	call   0x14006f1b0
   1408783b5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408783b8:	48 83 c1 10          	add    rcx,0x10
   1408783bc:	48 8d 15 75 64 e3 00 	lea    rdx,[rip+0xe36475]        # 0x1416ae838
   1408783c3:	e8 48 7a 7f ff       	call   0x14006fe10
   1408783c8:	84 c0                	test   al,al
   1408783ca:	74 07                	je     0x1408783d3
   1408783cc:	bb 64 02 00 00       	mov    ebx,0x264
   1408783d1:	eb 7e                	jmp    0x140878451
   1408783d3:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   1408783d7:	48 8b cf             	mov    rcx,rdi
   1408783da:	e8 d1 6d 7f ff       	call   0x14006f1b0
   1408783df:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408783e2:	48 83 c1 10          	add    rcx,0x10
   1408783e6:	48 8d 15 43 64 e3 00 	lea    rdx,[rip+0xe36443]        # 0x1416ae830
   1408783ed:	e8 1e 7a 7f ff       	call   0x14006fe10
   1408783f2:	84 c0                	test   al,al
   1408783f4:	74 07                	je     0x1408783fd
   1408783f6:	bb 65 02 00 00       	mov    ebx,0x265
   1408783fb:	eb 54                	jmp    0x140878451
   1408783fd:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   140878401:	48 8b cf             	mov    rcx,rdi
   140878404:	e8 a7 6d 7f ff       	call   0x14006f1b0
   140878409:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087840c:	48 83 c1 10          	add    rcx,0x10
   140878410:	48 8d 15 31 64 e3 00 	lea    rdx,[rip+0xe36431]        # 0x1416ae848
   140878417:	e8 f4 79 7f ff       	call   0x14006fe10
   14087841c:	84 c0                	test   al,al
   14087841e:	74 07                	je     0x140878427
   140878420:	bb 66 02 00 00       	mov    ebx,0x266
   140878425:	eb 2a                	jmp    0x140878451
   140878427:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   14087842b:	48 8b cf             	mov    rcx,rdi
   14087842e:	e8 7d 6d 7f ff       	call   0x14006f1b0
   140878433:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140878436:	48 83 c1 10          	add    rcx,0x10
   14087843a:	48 8d 15 ff 63 e3 00 	lea    rdx,[rip+0xe363ff]        # 0x1416ae840
   140878441:	e8 ca 79 7f ff       	call   0x14006fe10
   140878446:	84 c0                	test   al,al
   140878448:	b8 67 02 00 00       	mov    eax,0x267
   14087844d:	48 0f 45 d8          	cmovne rbx,rax
   140878451:	48 8b cf             	mov    rcx,rdi
   140878454:	e8 87 69 7f ff       	call   0x14006ede0
   140878459:	48 85 c0             	test   rax,rax
   14087845c:	0f 84 de 00 00 00    	je     0x140878540
   140878462:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   140878466:	48 8b cf             	mov    rcx,rdi
   140878469:	e8 42 6d 7f ff       	call   0x14006f1b0
   14087846e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140878471:	48 83 c1 50          	add    rcx,0x50
   140878475:	48 8d 15 9c 63 e3 00 	lea    rdx,[rip+0xe3639c]        # 0x1416ae818
   14087847c:	e8 8f 79 7f ff       	call   0x14006fe10
   140878481:	84 c0                	test   al,al
   140878483:	0f 84 b7 00 00 00    	je     0x140878540
   140878489:	bb 68 02 00 00       	mov    ebx,0x268
   14087848e:	e9 ad 00 00 00       	jmp    0x140878540
   140878493:	49 63 57 08          	movsxd rdx,DWORD PTR [r15+0x8]
   140878497:	83 fa ff             	cmp    edx,0xffffffff
   14087849a:	0f 84 a0 00 00 00    	je     0x140878540
   1408784a0:	48 8b 05 59 6b b6 01 	mov    rax,QWORD PTR [rip+0x1b66b59]        # 0x1423df000
   1408784a7:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   1408784ae:	48 83 c1 18          	add    rcx,0x18
   1408784b2:	e8 f9 6c 7f ff       	call   0x14006f1b0
   1408784b7:	48 8b 38             	mov    rdi,QWORD PTR [rax]
   1408784ba:	48 83 c7 40          	add    rdi,0x40
   1408784be:	48 8d 15 4b 63 e3 00 	lea    rdx,[rip+0xe3634b]        # 0x1416ae810
   1408784c5:	48 8b cf             	mov    rcx,rdi
   1408784c8:	e8 43 79 7f ff       	call   0x14006fe10
   1408784cd:	84 c0                	test   al,al
   1408784cf:	74 07                	je     0x1408784d8
   1408784d1:	bb 69 02 00 00       	mov    ebx,0x269
   1408784d6:	eb 68                	jmp    0x140878540
   1408784d8:	48 8d 15 55 7f df 00 	lea    rdx,[rip+0xdf7f55]        # 0x141670434
   1408784df:	48 8b cf             	mov    rcx,rdi
   1408784e2:	e8 29 79 7f ff       	call   0x14006fe10
   1408784e7:	84 c0                	test   al,al
   1408784e9:	74 07                	je     0x1408784f2
   1408784eb:	bb 6a 02 00 00       	mov    ebx,0x26a
   1408784f0:	eb 4e                	jmp    0x140878540
   1408784f2:	48 8d 15 2f 63 e3 00 	lea    rdx,[rip+0xe3632f]        # 0x1416ae828
   1408784f9:	48 8b cf             	mov    rcx,rdi
   1408784fc:	e8 0f 79 7f ff       	call   0x14006fe10
   140878501:	84 c0                	test   al,al
   140878503:	74 07                	je     0x14087850c
   140878505:	bb 6b 02 00 00       	mov    ebx,0x26b
   14087850a:	eb 34                	jmp    0x140878540
   14087850c:	48 8d 15 0d 63 e3 00 	lea    rdx,[rip+0xe3630d]        # 0x1416ae820
   140878513:	48 8b cf             	mov    rcx,rdi
   140878516:	e8 f5 78 7f ff       	call   0x14006fe10
   14087851b:	84 c0                	test   al,al
   14087851d:	74 07                	je     0x140878526
   14087851f:	bb 6c 02 00 00       	mov    ebx,0x26c
   140878524:	eb 1a                	jmp    0x140878540
   140878526:	48 8d 15 e7 6c e3 00 	lea    rdx,[rip+0xe36ce7]        # 0x1416af214
   14087852d:	48 8b cf             	mov    rcx,rdi
   140878530:	e8 db 78 7f ff       	call   0x14006fe10
   140878535:	84 c0                	test   al,al
   140878537:	b8 6d 02 00 00       	mov    eax,0x26d
   14087853c:	48 0f 45 d8          	cmovne rbx,rax
   140878540:	45 8b f4             	mov    r14d,r12d
   140878543:	4c 8d 3c 5b          	lea    r15,[rbx+rbx*2]
   140878547:	49 c1 e7 04          	shl    r15,0x4
   14087854b:	48 8d 05 e6 dd dc 01 	lea    rax,[rip+0x1dcdde6]        # 0x142646338
   140878552:	4c 03 f8             	add    r15,rax
   140878555:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087855b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140878560:	41 8b dd             	mov    ebx,r13d
   140878563:	49 8b ff             	mov    rdi,r15
   140878566:	be 04 00 00 00       	mov    esi,0x4
   14087856b:	4c 8d 2d 6e bd dc 01 	lea    r13,[rip+0x1dcbd6e]        # 0x1426442e0
   140878572:	44 8b c3             	mov    r8d,ebx
   140878575:	41 8b d6             	mov    edx,r14d
   140878578:	49 8b cd             	mov    rcx,r13
   14087857b:	e8 30 2b 84 ff       	call   0x1400bb0b0
   140878580:	8b 17                	mov    edx,DWORD PTR [rdi]
   140878582:	49 8b cd             	mov    rcx,r13
   140878585:	e8 86 f5 25 00       	call   0x140ad7b10
   14087858a:	33 d2                	xor    edx,edx
   14087858c:	48 8d 0d cd f0 b4 01 	lea    rcx,[rip+0x1b4f0cd]        # 0x1423c7660
   140878593:	e8 88 99 7f ff       	call   0x140071f20
   140878598:	84 c0                	test   al,al
   14087859a:	74 0d                	je     0x1408785a9
   14087859c:	41 b0 01             	mov    r8b,0x1
   14087859f:	33 d2                	xor    edx,edx
   1408785a1:	49 8b cd             	mov    rcx,r13
   1408785a4:	e8 77 2b 84 ff       	call   0x1400bb120
   1408785a9:	ff c3                	inc    ebx
   1408785ab:	48 83 c7 0c          	add    rdi,0xc
   1408785af:	48 83 ee 01          	sub    rsi,0x1
   1408785b3:	75 bd                	jne    0x140878572
   1408785b5:	41 ff c6             	inc    r14d
   1408785b8:	49 83 c7 04          	add    r15,0x4
   1408785bc:	49 83 ec 01          	sub    r12,0x1
   1408785c0:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   1408785c4:	75 9a                	jne    0x140878560
   1408785c6:	44 8b 65 80          	mov    r12d,DWORD PTR [rbp-0x80]
   1408785ca:	45 8d 45 04          	lea    r8d,[r13+0x4]
   1408785ce:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   1408785d3:	4c 8d 35 06 bd dc 01 	lea    r14,[rip+0x1dcbd06]        # 0x1426442e0
   1408785da:	49 8b ce             	mov    rcx,r14
   1408785dd:	e8 ce 2a 84 ff       	call   0x1400bb0b0
   1408785e2:	44 8b 7c 24 78       	mov    r15d,DWORD PTR [rsp+0x78]
   1408785e7:	41 8b d7             	mov    edx,r15d
   1408785ea:	2b 55 8c             	sub    edx,DWORD PTR [rbp-0x74]
   1408785ed:	83 c2 52             	add    edx,0x52
   1408785f0:	45 33 c0             	xor    r8d,r8d
   1408785f3:	48 8d 0d c6 fb 02 01 	lea    rcx,[rip+0x102fbc6]        # 0x1418a81c0
   1408785fa:	e8 f1 de 3b 00       	call   0x140c364f0
   1408785ff:	45 8d 45 06          	lea    r8d,[r13+0x6]
   140878603:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   140878608:	49 8b ce             	mov    rcx,r14
   14087860b:	e8 a0 2a 84 ff       	call   0x1400bb0b0
   140878610:	48 8d 15 49 62 e3 00 	lea    rdx,[rip+0xe36249]        # 0x1416ae860
   140878617:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087861b:	e8 c0 fa 7e ff       	call   0x1400680e0
   140878620:	90                   	nop
   140878621:	45 33 c9             	xor    r9d,r9d
   140878624:	45 33 c0             	xor    r8d,r8d
   140878627:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087862b:	49 8b ce             	mov    rcx,r14
   14087862e:	e8 6d e3 25 00       	call   0x140ad69a0
   140878633:	90                   	nop
   140878634:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878638:	e8 83 f7 7e ff       	call   0x140067dc0
   14087863d:	45 33 c0             	xor    r8d,r8d
   140878640:	ba 01 00 00 00       	mov    edx,0x1
   140878645:	44 0f b6 ca          	movzx  r9d,dl
   140878649:	49 8b ce             	mov    rcx,r14
   14087864c:	e8 6f 2a 84 ff       	call   0x1400bb0c0
   140878651:	45 8d 45 06          	lea    r8d,[r13+0x6]
   140878655:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   14087865a:	49 8b ce             	mov    rcx,r14
   14087865d:	e8 4e 2a 84 ff       	call   0x1400bb0b0
   140878662:	bf 03 00 00 00       	mov    edi,0x3
   140878667:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087866b:	e8 b0 6f 7f ff       	call   0x14006f620
   140878670:	90                   	nop
   140878671:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140878675:	e8 a6 6f 7f ff       	call   0x14006f620
   14087867a:	90                   	nop
   14087867b:	48 8b 75 a8          	mov    rsi,QWORD PTR [rbp-0x58]
   14087867f:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   140878682:	48 85 c9             	test   rcx,rcx
   140878685:	0f 84 06 01 00 00    	je     0x140878791
   14087868b:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14087868e:	ff 90 38 04 00 00    	call   QWORD PTR [rax+0x438]
   140878694:	48 8b d8             	mov    rbx,rax
   140878697:	48 85 c0             	test   rax,rax
   14087869a:	74 4d                	je     0x1408786e9
   14087869c:	48 8b c8             	mov    rcx,rax
   14087869f:	e8 3c 67 7f ff       	call   0x14006ede0
   1408786a4:	48 85 c0             	test   rax,rax
   1408786a7:	74 40                	je     0x1408786e9
   1408786a9:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   1408786ad:	48 8b cb             	mov    rcx,rbx
   1408786b0:	e8 fb 6a 7f ff       	call   0x14006f1b0
   1408786b5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1408786b8:	48 83 c2 10          	add    rdx,0x10
   1408786bc:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   1408786c0:	e8 6b 6e 7f ff       	call   0x14006f530
   1408786c5:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   1408786c9:	48 8b cb             	mov    rcx,rbx
   1408786cc:	e8 df 6a 7f ff       	call   0x14006f1b0
   1408786d1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1408786d4:	8b 79 70             	mov    edi,DWORD PTR [rcx+0x70]
   1408786d7:	48 8d 15 ee dd d6 00 	lea    rdx,[rip+0xd6ddee]        # 0x1415e64cc
   1408786de:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   1408786e2:	e8 09 6e 7f ff       	call   0x14006f4f0
   1408786e7:	eb 25                	jmp    0x14087870e
   1408786e9:	48 8d 15 f8 4e de 00 	lea    rdx,[rip+0xde4ef8]        # 0x14165d5e8
   1408786f0:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   1408786f4:	e8 17 6e 7f ff       	call   0x14006f510
   1408786f9:	48 8d 15 cc dd d6 00 	lea    rdx,[rip+0xd6ddcc]        # 0x1415e64cc
   140878700:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878704:	e8 e7 6d 7f ff       	call   0x14006f4f0
   140878709:	48 85 db             	test   rbx,rbx
   14087870c:	74 5c                	je     0x14087876a
   14087870e:	48 8b cb             	mov    rcx,rbx
   140878711:	e8 ca 66 7f ff       	call   0x14006ede0
   140878716:	48 85 c0             	test   rax,rax
   140878719:	74 4f                	je     0x14087876a
   14087871b:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   14087871f:	48 8b cb             	mov    rcx,rbx
   140878722:	e8 89 6a 7f ff       	call   0x14006f1b0
   140878727:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087872a:	48 83 c1 50          	add    rcx,0x50
   14087872e:	48 8d 15 ab 4e de 00 	lea    rdx,[rip+0xde4eab]        # 0x14165d5e0
   140878735:	e8 d6 76 7f ff       	call   0x14006fe10
   14087873a:	84 c0                	test   al,al
   14087873c:	75 2c                	jne    0x14087876a
   14087873e:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   140878742:	48 8b cb             	mov    rcx,rbx
   140878745:	e8 66 6a 7f ff       	call   0x14006f1b0
   14087874a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087874d:	48 83 c2 50          	add    rdx,0x50
   140878751:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878755:	e8 46 15 84 ff       	call   0x1400b9ca0
   14087875a:	48 8d 15 6b dd d6 00 	lea    rdx,[rip+0xd6dd6b]        # 0x1415e64cc
   140878761:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878765:	e8 86 6d 7f ff       	call   0x14006f4f0
   14087876a:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140878770:	45 33 c0             	xor    r8d,r8d
   140878773:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878777:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   14087877a:	e8 11 9d 3e 00       	call   0x140c62490
   14087877f:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878783:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878787:	e8 14 15 84 ff       	call   0x1400b9ca0
   14087878c:	e9 ac 00 00 00       	jmp    0x14087883d
   140878791:	48 63 56 08          	movsxd rdx,DWORD PTR [rsi+0x8]
   140878795:	83 fa ff             	cmp    edx,0xffffffff
   140878798:	0f 84 8f 00 00 00    	je     0x14087882d
   14087879e:	48 8b 05 5b 68 b6 01 	mov    rax,QWORD PTR [rip+0x1b6685b]        # 0x1423df000
   1408787a5:	48 8b 88 f8 05 00 00 	mov    rcx,QWORD PTR [rax+0x5f8]
   1408787ac:	48 83 c1 18          	add    rcx,0x18
   1408787b0:	e8 fb 69 7f ff       	call   0x14006f1b0
   1408787b5:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   1408787b8:	48 8d 53 40          	lea    rdx,[rbx+0x40]
   1408787bc:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   1408787c0:	e8 6b 6d 7f ff       	call   0x14006f530
   1408787c5:	8b bb b8 01 00 00    	mov    edi,DWORD PTR [rbx+0x1b8]
   1408787cb:	f6 43 60 01          	test   BYTE PTR [rbx+0x60],0x1
   1408787cf:	74 6c                	je     0x14087883d
   1408787d1:	48 8d 8b 50 01 00 00 	lea    rcx,[rbx+0x150]
   1408787d8:	e8 03 6c 7f ff       	call   0x14006f3e0
   1408787dd:	48 85 c0             	test   rax,rax
   1408787e0:	74 5b                	je     0x14087883d
   1408787e2:	48 8d 15 e3 dc d6 00 	lea    rdx,[rip+0xd6dce3]        # 0x1415e64cc
   1408787e9:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   1408787ed:	e8 fe 6c 7f ff       	call   0x14006f4f0
   1408787f2:	33 d2                	xor    edx,edx
   1408787f4:	48 8d 8b 50 01 00 00 	lea    rcx,[rbx+0x150]
   1408787fb:	e8 d0 6b 7f ff       	call   0x14006f3d0
   140878800:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   140878807:	45 33 c9             	xor    r9d,r9d
   14087880a:	44 0f b7 00          	movzx  r8d,WORD PTR [rax]
   14087880e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878812:	48 8b 0d e7 67 b6 01 	mov    rcx,QWORD PTR [rip+0x1b667e7]        # 0x1423df000
   140878819:	e8 22 6d ab 00       	call   0x14132f540
   14087881e:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   140878822:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878826:	e8 75 14 84 ff       	call   0x1400b9ca0
   14087882b:	eb 10                	jmp    0x14087883d
   14087882d:	48 8d 15 08 52 de 00 	lea    rdx,[rip+0xde5208]        # 0x14165da3c
   140878834:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   140878838:	e8 b3 6c 7f ff       	call   0x14006f4f0
   14087883d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   140878842:	8b 90 18 01 00 00    	mov    edx,DWORD PTR [rax+0x118]
   140878848:	f6 c2 04             	test   dl,0x4
   14087884b:	74 07                	je     0x140878854
   14087884d:	83 ff 03             	cmp    edi,0x3
   140878850:	7c 02                	jl     0x140878854
   140878852:	ff cf                	dec    edi
   140878854:	f6 c2 08             	test   dl,0x8
   140878857:	8d 47 01             	lea    eax,[rdi+0x1]
   14087885a:	0f 44 c7             	cmove  eax,edi
   14087885d:	8b c8                	mov    ecx,eax
   14087885f:	f6 c2 10             	test   dl,0x10
   140878862:	74 08                	je     0x14087886c
   140878864:	83 f8 03             	cmp    eax,0x3
   140878867:	7c 03                	jl     0x14087886c
   140878869:	8d 48 ff             	lea    ecx,[rax-0x1]
   14087886c:	f6 c2 20             	test   dl,0x20
   14087886f:	8d 59 02             	lea    ebx,[rcx+0x2]
   140878872:	0f 44 d9             	cmove  ebx,ecx
   140878875:	41 b9 24 00 00 00    	mov    r9d,0x24
   14087887b:	45 33 c0             	xor    r8d,r8d
   14087887e:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   140878882:	49 8b ce             	mov    rcx,r14
   140878885:	e8 16 e1 25 00       	call   0x140ad69a0
   14087888a:	45 8d 45 2c          	lea    r8d,[r13+0x2c]
   14087888e:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   140878893:	49 8b ce             	mov    rcx,r14
   140878896:	e8 15 28 84 ff       	call   0x1400bb0b0
   14087889b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
   14087889e:	f7 46 18 00 80 00 00 	test   DWORD PTR [rsi+0x18],0x8000
   1408788a5:	8d 78 ff             	lea    edi,[rax-0x1]
   1408788a8:	0f 44 f8             	cmove  edi,eax
   1408788ab:	83 ff fd             	cmp    edi,0xfffffffd
   1408788ae:	7f 3c                	jg     0x1408788ec
   1408788b0:	45 33 c0             	xor    r8d,r8d
   1408788b3:	ba 05 00 00 00       	mov    edx,0x5
   1408788b8:	41 b1 01             	mov    r9b,0x1
   1408788bb:	49 8b ce             	mov    rcx,r14
   1408788be:	e8 fd 27 84 ff       	call   0x1400bb0c0
   1408788c3:	48 8d 15 ce 55 e3 00 	lea    rdx,[rip+0xe355ce]        # 0x1416ade98
   1408788ca:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408788ce:	e8 0d f8 7e ff       	call   0x1400680e0
   1408788d3:	90                   	nop
   1408788d4:	45 33 c9             	xor    r9d,r9d
   1408788d7:	41 b0 03             	mov    r8b,0x3
   1408788da:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408788de:	49 8b ce             	mov    rcx,r14
   1408788e1:	e8 ba e0 25 00       	call   0x140ad69a0
   1408788e6:	90                   	nop
   1408788e7:	e9 a0 01 00 00       	jmp    0x140878a8c
   1408788ec:	83 ff fe             	cmp    edi,0xfffffffe
   1408788ef:	75 3c                	jne    0x14087892d
   1408788f1:	45 33 c0             	xor    r8d,r8d
   1408788f4:	ba 04 00 00 00       	mov    edx,0x4
   1408788f9:	41 b1 01             	mov    r9b,0x1
   1408788fc:	49 8b ce             	mov    rcx,r14
   1408788ff:	e8 bc 27 84 ff       	call   0x1400bb0c0
   140878904:	48 8d 15 fd 68 e3 00 	lea    rdx,[rip+0xe368fd]        # 0x1416af208
   14087890b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087890f:	e8 cc f7 7e ff       	call   0x1400680e0
   140878914:	90                   	nop
   140878915:	45 33 c9             	xor    r9d,r9d
   140878918:	41 b0 03             	mov    r8b,0x3
   14087891b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087891f:	49 8b ce             	mov    rcx,r14
   140878922:	e8 79 e0 25 00       	call   0x140ad69a0
   140878927:	90                   	nop
   140878928:	e9 5f 01 00 00       	jmp    0x140878a8c
   14087892d:	83 ff ff             	cmp    edi,0xffffffff
   140878930:	75 3c                	jne    0x14087896e
   140878932:	45 33 c0             	xor    r8d,r8d
   140878935:	ba 06 00 00 00       	mov    edx,0x6
   14087893a:	41 b1 01             	mov    r9b,0x1
   14087893d:	49 8b ce             	mov    rcx,r14
   140878940:	e8 7b 27 84 ff       	call   0x1400bb0c0
   140878945:	48 8d 15 d8 68 e3 00 	lea    rdx,[rip+0xe368d8]        # 0x1416af224
   14087894c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878950:	e8 8b f7 7e ff       	call   0x1400680e0
   140878955:	90                   	nop
   140878956:	45 33 c9             	xor    r9d,r9d
   140878959:	41 b0 03             	mov    r8b,0x3
   14087895c:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878960:	49 8b ce             	mov    rcx,r14
   140878963:	e8 38 e0 25 00       	call   0x140ad69a0
   140878968:	90                   	nop
   140878969:	e9 1e 01 00 00       	jmp    0x140878a8c
   14087896e:	85 ff                	test   edi,edi
   140878970:	75 62                	jne    0x1408789d4
   140878972:	83 fb 03             	cmp    ebx,0x3
   140878975:	0f 85 63 01 00 00    	jne    0x140878ade
   14087897b:	45 33 c0             	xor    r8d,r8d
   14087897e:	ba 07 00 00 00       	mov    edx,0x7
   140878983:	41 b1 01             	mov    r9b,0x1
   140878986:	49 8b ce             	mov    rcx,r14
   140878989:	e8 32 27 84 ff       	call   0x1400bb0c0
   14087898e:	48 8d 15 5f 88 d9 00 	lea    rdx,[rip+0xd9885f]        # 0x1416111f4
   140878995:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878999:	e8 42 f7 7e ff       	call   0x1400680e0
   14087899e:	90                   	nop
   14087899f:	45 33 c9             	xor    r9d,r9d
   1408789a2:	44 0f b6 c3          	movzx  r8d,bl
   1408789a6:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408789aa:	49 8b ce             	mov    rcx,r14
   1408789ad:	e8 ee df 25 00       	call   0x140ad69a0
   1408789b2:	90                   	nop
   1408789b3:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408789b7:	e8 04 f4 7e ff       	call   0x140067dc0
   1408789bc:	45 33 c0             	xor    r8d,r8d
   1408789bf:	ba 07 00 00 00       	mov    edx,0x7
   1408789c4:	41 b1 01             	mov    r9b,0x1
   1408789c7:	49 8b ce             	mov    rcx,r14
   1408789ca:	e8 f1 26 84 ff       	call   0x1400bb0c0
   1408789cf:	e9 69 02 00 00       	jmp    0x140878c3d
   1408789d4:	83 ff 01             	cmp    edi,0x1
   1408789d7:	75 39                	jne    0x140878a12
   1408789d9:	45 33 c0             	xor    r8d,r8d
   1408789dc:	ba 02 00 00 00       	mov    edx,0x2
   1408789e1:	45 33 c9             	xor    r9d,r9d
   1408789e4:	49 8b ce             	mov    rcx,r14
   1408789e7:	e8 d4 26 84 ff       	call   0x1400bb0c0
   1408789ec:	48 8d 15 29 68 e3 00 	lea    rdx,[rip+0xe36829]        # 0x1416af21c
   1408789f3:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408789f7:	e8 e4 f6 7e ff       	call   0x1400680e0
   1408789fc:	90                   	nop
   1408789fd:	45 33 c9             	xor    r9d,r9d
   140878a00:	41 b0 03             	mov    r8b,0x3
   140878a03:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878a07:	49 8b ce             	mov    rcx,r14
   140878a0a:	e8 91 df 25 00       	call   0x140ad69a0
   140878a0f:	90                   	nop
   140878a10:	eb 7a                	jmp    0x140878a8c
   140878a12:	83 ff 02             	cmp    edi,0x2
   140878a15:	75 39                	jne    0x140878a50
   140878a17:	45 33 c0             	xor    r8d,r8d
   140878a1a:	ba 02 00 00 00       	mov    edx,0x2
   140878a1f:	41 b1 01             	mov    r9b,0x1
   140878a22:	49 8b ce             	mov    rcx,r14
   140878a25:	e8 96 26 84 ff       	call   0x1400bb0c0
   140878a2a:	48 8d 15 bb 67 e3 00 	lea    rdx,[rip+0xe367bb]        # 0x1416af1ec
   140878a31:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878a35:	e8 a6 f6 7e ff       	call   0x1400680e0
   140878a3a:	90                   	nop
   140878a3b:	45 33 c9             	xor    r9d,r9d
   140878a3e:	41 b0 03             	mov    r8b,0x3
   140878a41:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878a45:	49 8b ce             	mov    rcx,r14
   140878a48:	e8 53 df 25 00       	call   0x140ad69a0
   140878a4d:	90                   	nop
   140878a4e:	eb 3c                	jmp    0x140878a8c
   140878a50:	83 ff 03             	cmp    edi,0x3
   140878a53:	7c 40                	jl     0x140878a95
   140878a55:	45 33 c0             	xor    r8d,r8d
   140878a58:	ba 03 00 00 00       	mov    edx,0x3
   140878a5d:	41 b1 01             	mov    r9b,0x1
   140878a60:	49 8b ce             	mov    rcx,r14
   140878a63:	e8 58 26 84 ff       	call   0x1400bb0c0
   140878a68:	48 8d 15 75 67 e3 00 	lea    rdx,[rip+0xe36775]        # 0x1416af1e4
   140878a6f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878a73:	e8 68 f6 7e ff       	call   0x1400680e0
   140878a78:	90                   	nop
   140878a79:	45 33 c9             	xor    r9d,r9d
   140878a7c:	41 b0 03             	mov    r8b,0x3
   140878a7f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878a83:	49 8b ce             	mov    rcx,r14
   140878a86:	e8 15 df 25 00       	call   0x140ad69a0
   140878a8b:	90                   	nop
   140878a8c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878a90:	e8 2b f3 7e ff       	call   0x140067dc0
   140878a95:	83 fb 03             	cmp    ebx,0x3
   140878a98:	0f 84 00 01 00 00    	je     0x140878b9e
   140878a9e:	45 33 c0             	xor    r8d,r8d
   140878aa1:	ba 07 00 00 00       	mov    edx,0x7
   140878aa6:	41 b1 01             	mov    r9b,0x1
   140878aa9:	49 8b ce             	mov    rcx,r14
   140878aac:	e8 0f 26 84 ff       	call   0x1400bb0c0
   140878ab1:	48 8d 15 68 ac d6 00 	lea    rdx,[rip+0xd6ac68]        # 0x1415e3720
   140878ab8:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878abc:	e8 1f f6 7e ff       	call   0x1400680e0
   140878ac1:	90                   	nop
   140878ac2:	45 33 c9             	xor    r9d,r9d
   140878ac5:	41 b0 03             	mov    r8b,0x3
   140878ac8:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878acc:	49 8b ce             	mov    rcx,r14
   140878acf:	e8 cc de 25 00       	call   0x140ad69a0
   140878ad4:	90                   	nop
   140878ad5:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878ad9:	e8 e2 f2 7e ff       	call   0x140067dc0
   140878ade:	83 fb 06             	cmp    ebx,0x6
   140878ae1:	7c 3c                	jl     0x140878b1f
   140878ae3:	45 33 c0             	xor    r8d,r8d
   140878ae6:	ba 05 00 00 00       	mov    edx,0x5
   140878aeb:	41 b1 01             	mov    r9b,0x1
   140878aee:	49 8b ce             	mov    rcx,r14
   140878af1:	e8 ca 25 84 ff       	call   0x1400bb0c0
   140878af6:	48 8d 15 ff 66 e3 00 	lea    rdx,[rip+0xe366ff]        # 0x1416af1fc
   140878afd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878b01:	e8 da f5 7e ff       	call   0x1400680e0
   140878b06:	90                   	nop
   140878b07:	45 33 c9             	xor    r9d,r9d
   140878b0a:	41 b0 03             	mov    r8b,0x3
   140878b0d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878b11:	49 8b ce             	mov    rcx,r14
   140878b14:	e8 87 de 25 00       	call   0x140ad69a0
   140878b19:	90                   	nop
   140878b1a:	e9 f9 00 00 00       	jmp    0x140878c18
   140878b1f:	83 fb 05             	cmp    ebx,0x5
   140878b22:	75 3c                	jne    0x140878b60
   140878b24:	45 33 c0             	xor    r8d,r8d
   140878b27:	ba 04 00 00 00       	mov    edx,0x4
   140878b2c:	41 b1 01             	mov    r9b,0x1
   140878b2f:	49 8b ce             	mov    rcx,r14
   140878b32:	e8 89 25 84 ff       	call   0x1400bb0c0
   140878b37:	48 8d 15 b6 66 e3 00 	lea    rdx,[rip+0xe366b6]        # 0x1416af1f4
   140878b3e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878b42:	e8 99 f5 7e ff       	call   0x1400680e0
   140878b47:	90                   	nop
   140878b48:	45 33 c9             	xor    r9d,r9d
   140878b4b:	41 b0 03             	mov    r8b,0x3
   140878b4e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878b52:	49 8b ce             	mov    rcx,r14
   140878b55:	e8 46 de 25 00       	call   0x140ad69a0
   140878b5a:	90                   	nop
   140878b5b:	e9 b8 00 00 00       	jmp    0x140878c18
   140878b60:	83 fb 04             	cmp    ebx,0x4
   140878b63:	75 39                	jne    0x140878b9e
   140878b65:	45 33 c0             	xor    r8d,r8d
   140878b68:	ba 06 00 00 00       	mov    edx,0x6
   140878b6d:	41 b1 01             	mov    r9b,0x1
   140878b70:	49 8b ce             	mov    rcx,r14
   140878b73:	e8 48 25 84 ff       	call   0x1400bb0c0
   140878b78:	48 8d 15 75 67 e3 00 	lea    rdx,[rip+0xe36775]        # 0x1416af2f4
   140878b7f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878b83:	e8 58 f5 7e ff       	call   0x1400680e0
   140878b88:	90                   	nop
   140878b89:	45 33 c9             	xor    r9d,r9d
   140878b8c:	41 b0 03             	mov    r8b,0x3
   140878b8f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878b93:	49 8b ce             	mov    rcx,r14
   140878b96:	e8 05 de 25 00       	call   0x140ad69a0
   140878b9b:	90                   	nop
   140878b9c:	eb 7a                	jmp    0x140878c18
   140878b9e:	83 fb 02             	cmp    ebx,0x2
   140878ba1:	75 39                	jne    0x140878bdc
   140878ba3:	45 33 c0             	xor    r8d,r8d
   140878ba6:	ba 02 00 00 00       	mov    edx,0x2
   140878bab:	41 b1 01             	mov    r9b,0x1
   140878bae:	49 8b ce             	mov    rcx,r14
   140878bb1:	e8 0a 25 84 ff       	call   0x1400bb0c0
   140878bb6:	48 8d 15 2f 67 e3 00 	lea    rdx,[rip+0xe3672f]        # 0x1416af2ec
   140878bbd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878bc1:	e8 1a f5 7e ff       	call   0x1400680e0
   140878bc6:	90                   	nop
   140878bc7:	45 33 c9             	xor    r9d,r9d
   140878bca:	41 b0 03             	mov    r8b,0x3
   140878bcd:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878bd1:	49 8b ce             	mov    rcx,r14
   140878bd4:	e8 c7 dd 25 00       	call   0x140ad69a0
   140878bd9:	90                   	nop
   140878bda:	eb 3c                	jmp    0x140878c18
   140878bdc:	83 fb 01             	cmp    ebx,0x1
   140878bdf:	7f 40                	jg     0x140878c21
   140878be1:	45 33 c0             	xor    r8d,r8d
   140878be4:	ba 03 00 00 00       	mov    edx,0x3
   140878be9:	41 b1 01             	mov    r9b,0x1
   140878bec:	49 8b ce             	mov    rcx,r14
   140878bef:	e8 cc 24 84 ff       	call   0x1400bb0c0
   140878bf4:	48 8d 15 0d 67 e3 00 	lea    rdx,[rip+0xe3670d]        # 0x1416af308
   140878bfb:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878bff:	e8 dc f4 7e ff       	call   0x1400680e0
   140878c04:	90                   	nop
   140878c05:	45 33 c9             	xor    r9d,r9d
   140878c08:	41 b0 03             	mov    r8b,0x3
   140878c0b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878c0f:	49 8b ce             	mov    rcx,r14
   140878c12:	e8 89 dd 25 00       	call   0x140ad69a0
   140878c17:	90                   	nop
   140878c18:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878c1c:	e8 9f f1 7e ff       	call   0x140067dc0
   140878c21:	45 33 c0             	xor    r8d,r8d
   140878c24:	ba 07 00 00 00       	mov    edx,0x7
   140878c29:	41 b1 01             	mov    r9b,0x1
   140878c2c:	49 8b ce             	mov    rcx,r14
   140878c2f:	e8 8c 24 84 ff       	call   0x1400bb0c0
   140878c34:	85 ff                	test   edi,edi
   140878c36:	74 05                	je     0x140878c3d
   140878c38:	83 fb 03             	cmp    ebx,0x3
   140878c3b:	75 2d                	jne    0x140878c6a
   140878c3d:	48 8d 15 bc 66 e3 00 	lea    rdx,[rip+0xe366bc]        # 0x1416af300
   140878c44:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878c48:	e8 93 f4 7e ff       	call   0x1400680e0
   140878c4d:	90                   	nop
   140878c4e:	45 33 c9             	xor    r9d,r9d
   140878c51:	41 b0 03             	mov    r8b,0x3
   140878c54:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878c58:	49 8b ce             	mov    rcx,r14
   140878c5b:	e8 40 dd 25 00       	call   0x140ad69a0
   140878c60:	90                   	nop
   140878c61:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878c65:	e8 56 f1 7e ff       	call   0x140067dc0
   140878c6a:	48 8d 15 53 b4 d6 00 	lea    rdx,[rip+0xd6b453]        # 0x1415e40c4
   140878c71:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878c75:	e8 66 f4 7e ff       	call   0x1400680e0
   140878c7a:	90                   	nop
   140878c7b:	45 33 c9             	xor    r9d,r9d
   140878c7e:	41 b0 03             	mov    r8b,0x3
   140878c81:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878c85:	49 8b ce             	mov    rcx,r14
   140878c88:	e8 13 dd 25 00       	call   0x140ad69a0
   140878c8d:	90                   	nop
   140878c8e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878c92:	e8 29 f1 7e ff       	call   0x140067dc0
   140878c97:	83 7e 14 fd          	cmp    DWORD PTR [rsi+0x14],0xfffffffd
   140878c9b:	7f 40                	jg     0x140878cdd
   140878c9d:	45 33 c0             	xor    r8d,r8d
   140878ca0:	ba 05 00 00 00       	mov    edx,0x5
   140878ca5:	41 b1 01             	mov    r9b,0x1
   140878ca8:	49 8b ce             	mov    rcx,r14
   140878cab:	e8 10 24 84 ff       	call   0x1400bb0c0
   140878cb0:	48 8d 15 29 5c e3 00 	lea    rdx,[rip+0xe35c29]        # 0x1416ae8e0
   140878cb7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878cbb:	e8 20 f4 7e ff       	call   0x1400680e0
   140878cc0:	90                   	nop
   140878cc1:	45 33 c9             	xor    r9d,r9d
   140878cc4:	45 33 c0             	xor    r8d,r8d
   140878cc7:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878ccb:	49 8b ce             	mov    rcx,r14
   140878cce:	e8 cd dc 25 00       	call   0x140ad69a0
   140878cd3:	90                   	nop
   140878cd4:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878cd8:	e8 e3 f0 7e ff       	call   0x140067dc0
   140878cdd:	83 7e 14 fe          	cmp    DWORD PTR [rsi+0x14],0xfffffffe
   140878ce1:	75 40                	jne    0x140878d23
   140878ce3:	45 33 c0             	xor    r8d,r8d
   140878ce6:	ba 04 00 00 00       	mov    edx,0x4
   140878ceb:	41 b1 01             	mov    r9b,0x1
   140878cee:	49 8b ce             	mov    rcx,r14
   140878cf1:	e8 ca 23 84 ff       	call   0x1400bb0c0
   140878cf6:	48 8d 15 e3 5a e3 00 	lea    rdx,[rip+0xe35ae3]        # 0x1416ae7e0
   140878cfd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878d01:	e8 da f3 7e ff       	call   0x1400680e0
   140878d06:	90                   	nop
   140878d07:	45 33 c9             	xor    r9d,r9d
   140878d0a:	45 33 c0             	xor    r8d,r8d
   140878d0d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878d11:	49 8b ce             	mov    rcx,r14
   140878d14:	e8 87 dc 25 00       	call   0x140ad69a0
   140878d19:	90                   	nop
   140878d1a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878d1e:	e8 9d f0 7e ff       	call   0x140067dc0
   140878d23:	83 7e 14 ff          	cmp    DWORD PTR [rsi+0x14],0xffffffff
   140878d27:	75 40                	jne    0x140878d69
   140878d29:	45 33 c0             	xor    r8d,r8d
   140878d2c:	ba 06 00 00 00       	mov    edx,0x6
   140878d31:	41 b1 01             	mov    r9b,0x1
   140878d34:	49 8b ce             	mov    rcx,r14
   140878d37:	e8 84 23 84 ff       	call   0x1400bb0c0
   140878d3c:	48 8d 15 85 5a e3 00 	lea    rdx,[rip+0xe35a85]        # 0x1416ae7c8
   140878d43:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878d47:	e8 94 f3 7e ff       	call   0x1400680e0
   140878d4c:	90                   	nop
   140878d4d:	45 33 c9             	xor    r9d,r9d
   140878d50:	45 33 c0             	xor    r8d,r8d
   140878d53:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878d57:	49 8b ce             	mov    rcx,r14
   140878d5a:	e8 41 dc 25 00       	call   0x140ad69a0
   140878d5f:	90                   	nop
   140878d60:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878d64:	e8 57 f0 7e ff       	call   0x140067dc0
   140878d69:	83 7e 14 00          	cmp    DWORD PTR [rsi+0x14],0x0
   140878d6d:	75 40                	jne    0x140878daf
   140878d6f:	45 33 c0             	xor    r8d,r8d
   140878d72:	ba 07 00 00 00       	mov    edx,0x7
   140878d77:	41 b1 01             	mov    r9b,0x1
   140878d7a:	49 8b ce             	mov    rcx,r14
   140878d7d:	e8 3e 23 84 ff       	call   0x1400bb0c0
   140878d82:	48 8d 15 77 5a e3 00 	lea    rdx,[rip+0xe35a77]        # 0x1416ae800
   140878d89:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878d8d:	e8 4e f3 7e ff       	call   0x1400680e0
   140878d92:	90                   	nop
   140878d93:	45 33 c9             	xor    r9d,r9d
   140878d96:	45 33 c0             	xor    r8d,r8d
   140878d99:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878d9d:	49 8b ce             	mov    rcx,r14
   140878da0:	e8 fb db 25 00       	call   0x140ad69a0
   140878da5:	90                   	nop
   140878da6:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878daa:	e8 11 f0 7e ff       	call   0x140067dc0
   140878daf:	bf 02 00 00 00       	mov    edi,0x2
   140878db4:	83 7e 14 01          	cmp    DWORD PTR [rsi+0x14],0x1
   140878db8:	75 3d                	jne    0x140878df7
   140878dba:	45 33 c0             	xor    r8d,r8d
   140878dbd:	8b d7                	mov    edx,edi
   140878dbf:	45 33 c9             	xor    r9d,r9d
   140878dc2:	49 8b ce             	mov    rcx,r14
   140878dc5:	e8 f6 22 84 ff       	call   0x1400bb0c0
   140878dca:	48 8d 15 23 5a e3 00 	lea    rdx,[rip+0xe35a23]        # 0x1416ae7f4
   140878dd1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878dd5:	e8 06 f3 7e ff       	call   0x1400680e0
   140878dda:	90                   	nop
   140878ddb:	45 33 c9             	xor    r9d,r9d
   140878dde:	45 33 c0             	xor    r8d,r8d
   140878de1:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878de5:	49 8b ce             	mov    rcx,r14
   140878de8:	e8 b3 db 25 00       	call   0x140ad69a0
   140878ded:	90                   	nop
   140878dee:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878df2:	e8 c9 ef 7e ff       	call   0x140067dc0
   140878df7:	83 7e 14 02          	cmp    DWORD PTR [rsi+0x14],0x2
   140878dfb:	75 3d                	jne    0x140878e3a
   140878dfd:	45 33 c0             	xor    r8d,r8d
   140878e00:	8b d7                	mov    edx,edi
   140878e02:	41 b1 01             	mov    r9b,0x1
   140878e05:	49 8b ce             	mov    rcx,r14
   140878e08:	e8 b3 22 84 ff       	call   0x1400bb0c0
   140878e0d:	48 8d 15 94 59 e3 00 	lea    rdx,[rip+0xe35994]        # 0x1416ae7a8
   140878e14:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878e18:	e8 c3 f2 7e ff       	call   0x1400680e0
   140878e1d:	90                   	nop
   140878e1e:	45 33 c9             	xor    r9d,r9d
   140878e21:	45 33 c0             	xor    r8d,r8d
   140878e24:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878e28:	49 8b ce             	mov    rcx,r14
   140878e2b:	e8 70 db 25 00       	call   0x140ad69a0
   140878e30:	90                   	nop
   140878e31:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878e35:	e8 86 ef 7e ff       	call   0x140067dc0
   140878e3a:	83 7e 14 03          	cmp    DWORD PTR [rsi+0x14],0x3
   140878e3e:	7c 40                	jl     0x140878e80
   140878e40:	45 33 c0             	xor    r8d,r8d
   140878e43:	ba 03 00 00 00       	mov    edx,0x3
   140878e48:	41 b1 01             	mov    r9b,0x1
   140878e4b:	49 8b ce             	mov    rcx,r14
   140878e4e:	e8 6d 22 84 ff       	call   0x1400bb0c0
   140878e53:	48 8d 15 3e 59 e3 00 	lea    rdx,[rip+0xe3593e]        # 0x1416ae798
   140878e5a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878e5e:	e8 7d f2 7e ff       	call   0x1400680e0
   140878e63:	90                   	nop
   140878e64:	45 33 c9             	xor    r9d,r9d
   140878e67:	45 33 c0             	xor    r8d,r8d
   140878e6a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878e6e:	49 8b ce             	mov    rcx,r14
   140878e71:	e8 2a db 25 00       	call   0x140ad69a0
   140878e76:	90                   	nop
   140878e77:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878e7b:	e8 40 ef 7e ff       	call   0x140067dc0
   140878e80:	44 8b 74 24 7c       	mov    r14d,DWORD PTR [rsp+0x7c]
   140878e85:	45 8d 46 fe          	lea    r8d,[r14-0x2]
   140878e89:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   140878e8e:	48 8d 1d 4b b4 dc 01 	lea    rbx,[rip+0x1dcb44b]        # 0x1426442e0
   140878e95:	48 8b cb             	mov    rcx,rbx
   140878e98:	e8 13 22 84 ff       	call   0x1400bb0b0
   140878e9d:	8b 46 18             	mov    eax,DWORD PTR [rsi+0x18]
   140878ea0:	a8 20                	test   al,0x20
   140878ea2:	74 39                	je     0x140878edd
   140878ea4:	45 33 c0             	xor    r8d,r8d
   140878ea7:	8b d7                	mov    edx,edi
   140878ea9:	41 b1 01             	mov    r9b,0x1
   140878eac:	48 8b cb             	mov    rcx,rbx
   140878eaf:	e8 0c 22 84 ff       	call   0x1400bb0c0
   140878eb4:	48 8d 15 d1 00 d7 00 	lea    rdx,[rip+0xd700d1]        # 0x1415e8f8c
   140878ebb:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878ebf:	e8 1c f2 7e ff       	call   0x1400680e0
   140878ec4:	90                   	nop
   140878ec5:	45 33 c9             	xor    r9d,r9d
   140878ec8:	45 33 c0             	xor    r8d,r8d
   140878ecb:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878ecf:	48 8b cb             	mov    rcx,rbx
   140878ed2:	e8 c9 da 25 00       	call   0x140ad69a0
   140878ed7:	90                   	nop
   140878ed8:	e9 b4 00 00 00       	jmp    0x140878f91
   140878edd:	a8 40                	test   al,0x40
   140878edf:	74 36                	je     0x140878f17
   140878ee1:	45 33 c0             	xor    r8d,r8d
   140878ee4:	8b d7                	mov    edx,edi
   140878ee6:	45 33 c9             	xor    r9d,r9d
   140878ee9:	48 8b cb             	mov    rcx,rbx
   140878eec:	e8 cf 21 84 ff       	call   0x1400bb0c0
   140878ef1:	48 8d 15 94 00 d7 00 	lea    rdx,[rip+0xd70094]        # 0x1415e8f8c
   140878ef8:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878efc:	e8 df f1 7e ff       	call   0x1400680e0
   140878f01:	90                   	nop
   140878f02:	45 33 c9             	xor    r9d,r9d
   140878f05:	45 33 c0             	xor    r8d,r8d
   140878f08:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878f0c:	48 8b cb             	mov    rcx,rbx
   140878f0f:	e8 8c da 25 00       	call   0x140ad69a0
   140878f14:	90                   	nop
   140878f15:	eb 7a                	jmp    0x140878f91
   140878f17:	84 c0                	test   al,al
   140878f19:	79 39                	jns    0x140878f54
   140878f1b:	45 33 c0             	xor    r8d,r8d
   140878f1e:	ba 06 00 00 00       	mov    edx,0x6
   140878f23:	41 b1 01             	mov    r9b,0x1
   140878f26:	48 8b cb             	mov    rcx,rbx
   140878f29:	e8 92 21 84 ff       	call   0x1400bb0c0
   140878f2e:	48 8d 15 47 d7 dc 00 	lea    rdx,[rip+0xdcd747]        # 0x14164667c
   140878f35:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878f39:	e8 a2 f1 7e ff       	call   0x1400680e0
   140878f3e:	90                   	nop
   140878f3f:	45 33 c9             	xor    r9d,r9d
   140878f42:	45 33 c0             	xor    r8d,r8d
   140878f45:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878f49:	48 8b cb             	mov    rcx,rbx
   140878f4c:	e8 4f da 25 00       	call   0x140ad69a0
   140878f51:	90                   	nop
   140878f52:	eb 3d                	jmp    0x140878f91
   140878f54:	0f ba e0 08          	bt     eax,0x8
   140878f58:	73 40                	jae    0x140878f9a
   140878f5a:	45 33 c0             	xor    r8d,r8d
   140878f5d:	ba 04 00 00 00       	mov    edx,0x4
   140878f62:	41 b1 01             	mov    r9b,0x1
   140878f65:	48 8b cb             	mov    rcx,rbx
   140878f68:	e8 53 21 84 ff       	call   0x1400bb0c0
   140878f6d:	48 8d 15 08 d7 dc 00 	lea    rdx,[rip+0xdcd708]        # 0x14164667c
   140878f74:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878f78:	e8 63 f1 7e ff       	call   0x1400680e0
   140878f7d:	90                   	nop
   140878f7e:	45 33 c9             	xor    r9d,r9d
   140878f81:	45 33 c0             	xor    r8d,r8d
   140878f84:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878f88:	48 8b cb             	mov    rcx,rbx
   140878f8b:	e8 10 da 25 00       	call   0x140ad69a0
   140878f90:	90                   	nop
   140878f91:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878f95:	e8 26 ee 7e ff       	call   0x140067dc0
   140878f9a:	f7 46 18 00 02 00 00 	test   DWORD PTR [rsi+0x18],0x200
   140878fa1:	74 51                	je     0x140878ff4
   140878fa3:	45 8d 46 ff          	lea    r8d,[r14-0x1]
   140878fa7:	41 8d 54 24 01       	lea    edx,[r12+0x1]
   140878fac:	48 8b cb             	mov    rcx,rbx
   140878faf:	e8 fc 20 84 ff       	call   0x1400bb0b0
   140878fb4:	45 33 c0             	xor    r8d,r8d
   140878fb7:	ba 03 00 00 00       	mov    edx,0x3
   140878fbc:	41 b1 01             	mov    r9b,0x1
   140878fbf:	48 8b cb             	mov    rcx,rbx
   140878fc2:	e8 f9 20 84 ff       	call   0x1400bb0c0
   140878fc7:	48 8d 15 5e 04 d7 00 	lea    rdx,[rip+0xd7045e]        # 0x1415e942c
   140878fce:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878fd2:	e8 09 f1 7e ff       	call   0x1400680e0
   140878fd7:	90                   	nop
   140878fd8:	45 33 c9             	xor    r9d,r9d
   140878fdb:	45 33 c0             	xor    r8d,r8d
   140878fde:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140878fe2:	48 8b cb             	mov    rcx,rbx
   140878fe5:	e8 b6 d9 25 00       	call   0x140ad69a0
   140878fea:	90                   	nop
   140878feb:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140878fef:	e8 cc ed 7e ff       	call   0x140067dc0
   140878ff4:	41 83 c4 03          	add    r12d,0x3
   140878ff8:	44 89 65 80          	mov    DWORD PTR [rbp-0x80],r12d
   140878ffc:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140879000:	e8 bb ed 7e ff       	call   0x140067dc0
   140879005:	90                   	nop
   140879006:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087900a:	e8 b1 ed 7e ff       	call   0x140067dc0
   14087900f:	41 ff c7             	inc    r15d
   140879012:	44 89 7c 24 78       	mov    DWORD PTR [rsp+0x78],r15d
   140879017:	44 3b 7c 24 64       	cmp    r15d,DWORD PTR [rsp+0x64]
   14087901c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
   140879020:	48 8b 5d d8          	mov    rbx,QWORD PTR [rbp-0x28]
   140879024:	0f 8c b6 f1 ff ff    	jl     0x1408781e0
   14087902a:	8b 74 24 60          	mov    esi,DWORD PTR [rsp+0x60]
   14087902e:	44 8b 55 88          	mov    r10d,DWORD PTR [rbp-0x78]
   140879032:	44 3b ce             	cmp    r9d,esi
   140879035:	7e 67                	jle    0x14087909e
   140879037:	41 8d 7a 01          	lea    edi,[r10+0x1]
   14087903b:	41 8d 5a fe          	lea    ebx,[r10-0x2]
   14087903f:	8d 1c 73             	lea    ebx,[rbx+rsi*2]
   140879042:	03 de                	add    ebx,esi
   140879044:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879048:	e8 a3 22 84 ff       	call   0x1400bb2f0
   14087904d:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
   140879051:	41 ff c9             	dec    r9d
   140879054:	89 5c 24 30          	mov    DWORD PTR [rsp+0x30],ebx
   140879058:	89 7c 24 28          	mov    DWORD PTR [rsp+0x28],edi
   14087905c:	89 74 24 20          	mov    DWORD PTR [rsp+0x20],esi
   140879060:	45 33 c0             	xor    r8d,r8d
   140879063:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   140879068:	8b 93 20 01 00 00    	mov    edx,DWORD PTR [rbx+0x120]
   14087906e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879072:	e8 99 22 84 ff       	call   0x1400bb310
   140879077:	45 8d 4e 01          	lea    r9d,[r14+0x1]
   14087907b:	c7 44 24 28 00 00 00 00 	mov    DWORD PTR [rsp+0x28],0x0
   140879083:	0f b6 83 24 01 00 00 	movzx  eax,BYTE PTR [rbx+0x124]
   14087908a:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   14087908e:	44 8b 45 b4          	mov    r8d,DWORD PTR [rbp-0x4c]
   140879092:	8b 55 b8             	mov    edx,DWORD PTR [rbp-0x48]
   140879095:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879099:	e8 a2 13 b9 00       	call   0x14140a440
   14087909e:	44 8b 6d b0          	mov    r13d,DWORD PTR [rbp-0x50]
   1408790a2:	41 8d 45 fa          	lea    eax,[r13-0x6]
   1408790a6:	89 45 84             	mov    DWORD PTR [rbp-0x7c],eax
   1408790a9:	41 8d 4d fd          	lea    ecx,[r13-0x3]
   1408790ad:	89 4d 80             	mov    DWORD PTR [rbp-0x80],ecx
   1408790b0:	45 8d 75 ee          	lea    r14d,[r13-0x12]
   1408790b4:	4c 8d 3d bd 43 dd 01 	lea    r15,[rip+0x1dd43bd]        # 0x14264d478
   1408790bb:	4c 8d 25 1e b2 dc 01 	lea    r12,[rip+0x1dcb21e]        # 0x1426442e0
   1408790c2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1408790c6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   1408790d0:	33 db                	xor    ebx,ebx
   1408790d2:	49 8b ff             	mov    rdi,r15
   1408790d5:	be 04 00 00 00       	mov    esi,0x4
   1408790da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1408790e0:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   1408790e5:	41 ff c0             	inc    r8d
   1408790e8:	44 03 c3             	add    r8d,ebx
   1408790eb:	41 8b d6             	mov    edx,r14d
   1408790ee:	49 8b cc             	mov    rcx,r12
   1408790f1:	e8 ba 1f 84 ff       	call   0x1400bb0b0
   1408790f6:	8b 17                	mov    edx,DWORD PTR [rdi]
   1408790f8:	49 8b cc             	mov    rcx,r12
   1408790fb:	e8 10 ea 25 00       	call   0x140ad7b10
   140879100:	33 d2                	xor    edx,edx
   140879102:	48 8d 0d 57 e5 b4 01 	lea    rcx,[rip+0x1b4e557]        # 0x1423c7660
   140879109:	e8 12 8e 7f ff       	call   0x140071f20
   14087910e:	84 c0                	test   al,al
   140879110:	74 0d                	je     0x14087911f
   140879112:	41 b0 01             	mov    r8b,0x1
   140879115:	33 d2                	xor    edx,edx
   140879117:	49 8b cc             	mov    rcx,r12
   14087911a:	e8 01 20 84 ff       	call   0x1400bb120
   14087911f:	ff c3                	inc    ebx
   140879121:	48 83 c7 0c          	add    rdi,0xc
   140879125:	48 83 ee 01          	sub    rsi,0x1
   140879129:	75 b5                	jne    0x1408790e0
   14087912b:	41 ff c6             	inc    r14d
   14087912e:	49 83 c7 04          	add    r15,0x4
   140879132:	48 8d 05 4b 43 dd 01 	lea    rax,[rip+0x1dd434b]        # 0x14264d484
   140879139:	4c 3b f8             	cmp    r15,rax
   14087913c:	7c 92                	jl     0x1408790d0
   14087913e:	45 8d 75 f1          	lea    r14d,[r13-0xf]
   140879142:	4c 8d 3d 5f 43 dd 01 	lea    r15,[rip+0x1dd435f]        # 0x14264d4a8
   140879149:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140879150:	33 db                	xor    ebx,ebx
   140879152:	49 8b ff             	mov    rdi,r15
   140879155:	be 04 00 00 00       	mov    esi,0x4
   14087915a:	4c 8d 25 7f b1 dc 01 	lea    r12,[rip+0x1dcb17f]        # 0x1426442e0
   140879161:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   140879166:	41 ff c0             	inc    r8d
   140879169:	44 03 c3             	add    r8d,ebx
   14087916c:	41 8b d6             	mov    edx,r14d
   14087916f:	49 8b cc             	mov    rcx,r12
   140879172:	e8 39 1f 84 ff       	call   0x1400bb0b0
   140879177:	8b 17                	mov    edx,DWORD PTR [rdi]
   140879179:	49 8b cc             	mov    rcx,r12
   14087917c:	e8 8f e9 25 00       	call   0x140ad7b10
   140879181:	33 d2                	xor    edx,edx
   140879183:	48 8d 0d d6 e4 b4 01 	lea    rcx,[rip+0x1b4e4d6]        # 0x1423c7660
   14087918a:	e8 91 8d 7f ff       	call   0x140071f20
   14087918f:	84 c0                	test   al,al
   140879191:	74 0d                	je     0x1408791a0
   140879193:	41 b0 01             	mov    r8b,0x1
   140879196:	33 d2                	xor    edx,edx
   140879198:	49 8b cc             	mov    rcx,r12
   14087919b:	e8 80 1f 84 ff       	call   0x1400bb120
   1408791a0:	ff c3                	inc    ebx
   1408791a2:	48 83 c7 0c          	add    rdi,0xc
   1408791a6:	48 83 ee 01          	sub    rsi,0x1
   1408791aa:	75 b5                	jne    0x140879161
   1408791ac:	41 ff c6             	inc    r14d
   1408791af:	49 83 c7 04          	add    r15,0x4
   1408791b3:	48 8d 05 fa 42 dd 01 	lea    rax,[rip+0x1dd42fa]        # 0x14264d4b4
   1408791ba:	4c 3b f8             	cmp    r15,rax
   1408791bd:	7c 91                	jl     0x140879150
   1408791bf:	45 8d 75 f4          	lea    r14d,[r13-0xc]
   1408791c3:	4c 8d 3d 0e 43 dd 01 	lea    r15,[rip+0x1dd430e]        # 0x14264d4d8
   1408791ca:	4c 8d 25 0f b1 dc 01 	lea    r12,[rip+0x1dcb10f]        # 0x1426442e0
   1408791d1:	33 db                	xor    ebx,ebx
   1408791d3:	49 8b ff             	mov    rdi,r15
   1408791d6:	be 04 00 00 00       	mov    esi,0x4
   1408791db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1408791e0:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   1408791e5:	41 ff c0             	inc    r8d
   1408791e8:	44 03 c3             	add    r8d,ebx
   1408791eb:	41 8b d6             	mov    edx,r14d
   1408791ee:	49 8b cc             	mov    rcx,r12
   1408791f1:	e8 ba 1e 84 ff       	call   0x1400bb0b0
   1408791f6:	8b 17                	mov    edx,DWORD PTR [rdi]
   1408791f8:	49 8b cc             	mov    rcx,r12
   1408791fb:	e8 10 e9 25 00       	call   0x140ad7b10
   140879200:	33 d2                	xor    edx,edx
   140879202:	48 8d 0d 57 e4 b4 01 	lea    rcx,[rip+0x1b4e457]        # 0x1423c7660
   140879209:	e8 12 8d 7f ff       	call   0x140071f20
   14087920e:	84 c0                	test   al,al
   140879210:	74 0d                	je     0x14087921f
   140879212:	41 b0 01             	mov    r8b,0x1
   140879215:	33 d2                	xor    edx,edx
   140879217:	49 8b cc             	mov    rcx,r12
   14087921a:	e8 01 1f 84 ff       	call   0x1400bb120
   14087921f:	ff c3                	inc    ebx
   140879221:	48 83 c7 0c          	add    rdi,0xc
   140879225:	48 83 ee 01          	sub    rsi,0x1
   140879229:	75 b5                	jne    0x1408791e0
   14087922b:	41 ff c6             	inc    r14d
   14087922e:	49 83 c7 04          	add    r15,0x4
   140879232:	48 8d 05 ab 42 dd 01 	lea    rax,[rip+0x1dd42ab]        # 0x14264d4e4
   140879239:	4c 3b f8             	cmp    r15,rax
   14087923c:	7c 93                	jl     0x1408791d1
   14087923e:	45 8d 75 f7          	lea    r14d,[r13-0x9]
   140879242:	4c 8d 3d bf 42 dd 01 	lea    r15,[rip+0x1dd42bf]        # 0x14264d508
   140879249:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140879250:	33 db                	xor    ebx,ebx
   140879252:	49 8b ff             	mov    rdi,r15
   140879255:	be 04 00 00 00       	mov    esi,0x4
   14087925a:	4c 8d 25 7f b0 dc 01 	lea    r12,[rip+0x1dcb07f]        # 0x1426442e0
   140879261:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   140879266:	41 ff c0             	inc    r8d
   140879269:	44 03 c3             	add    r8d,ebx
   14087926c:	41 8b d6             	mov    edx,r14d
   14087926f:	49 8b cc             	mov    rcx,r12
   140879272:	e8 39 1e 84 ff       	call   0x1400bb0b0
   140879277:	8b 17                	mov    edx,DWORD PTR [rdi]
   140879279:	49 8b cc             	mov    rcx,r12
   14087927c:	e8 8f e8 25 00       	call   0x140ad7b10
   140879281:	33 d2                	xor    edx,edx
   140879283:	48 8d 0d d6 e3 b4 01 	lea    rcx,[rip+0x1b4e3d6]        # 0x1423c7660
   14087928a:	e8 91 8c 7f ff       	call   0x140071f20
   14087928f:	84 c0                	test   al,al
   140879291:	74 0d                	je     0x1408792a0
   140879293:	41 b0 01             	mov    r8b,0x1
   140879296:	33 d2                	xor    edx,edx
   140879298:	49 8b cc             	mov    rcx,r12
   14087929b:	e8 80 1e 84 ff       	call   0x1400bb120
   1408792a0:	ff c3                	inc    ebx
   1408792a2:	48 83 c7 0c          	add    rdi,0xc
   1408792a6:	48 83 ee 01          	sub    rsi,0x1
   1408792aa:	75 b5                	jne    0x140879261
   1408792ac:	41 ff c6             	inc    r14d
   1408792af:	49 83 c7 04          	add    r15,0x4
   1408792b3:	48 8d 05 5a 42 dd 01 	lea    rax,[rip+0x1dd425a]        # 0x14264d514
   1408792ba:	4c 3b f8             	cmp    r15,rax
   1408792bd:	7c 91                	jl     0x140879250
   1408792bf:	45 8d 75 fa          	lea    r14d,[r13-0x6]
   1408792c3:	4c 8d 3d 6e 42 dd 01 	lea    r15,[rip+0x1dd426e]        # 0x14264d538
   1408792ca:	4c 8d 25 0f b0 dc 01 	lea    r12,[rip+0x1dcb00f]        # 0x1426442e0
   1408792d1:	33 db                	xor    ebx,ebx
   1408792d3:	49 8b ff             	mov    rdi,r15
   1408792d6:	be 04 00 00 00       	mov    esi,0x4
   1408792db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1408792e0:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   1408792e5:	41 ff c0             	inc    r8d
   1408792e8:	44 03 c3             	add    r8d,ebx
   1408792eb:	41 8b d6             	mov    edx,r14d
   1408792ee:	49 8b cc             	mov    rcx,r12
   1408792f1:	e8 ba 1d 84 ff       	call   0x1400bb0b0
   1408792f6:	8b 17                	mov    edx,DWORD PTR [rdi]
   1408792f8:	49 8b cc             	mov    rcx,r12
   1408792fb:	e8 10 e8 25 00       	call   0x140ad7b10
   140879300:	33 d2                	xor    edx,edx
   140879302:	48 8d 0d 57 e3 b4 01 	lea    rcx,[rip+0x1b4e357]        # 0x1423c7660
   140879309:	e8 12 8c 7f ff       	call   0x140071f20
   14087930e:	84 c0                	test   al,al
   140879310:	74 0d                	je     0x14087931f
   140879312:	41 b0 01             	mov    r8b,0x1
   140879315:	33 d2                	xor    edx,edx
   140879317:	49 8b cc             	mov    rcx,r12
   14087931a:	e8 01 1e 84 ff       	call   0x1400bb120
   14087931f:	ff c3                	inc    ebx
   140879321:	48 83 c7 0c          	add    rdi,0xc
   140879325:	48 83 ee 01          	sub    rsi,0x1
   140879329:	75 b5                	jne    0x1408792e0
   14087932b:	41 ff c6             	inc    r14d
   14087932e:	49 83 c7 04          	add    r15,0x4
   140879332:	48 8d 05 0b 42 dd 01 	lea    rax,[rip+0x1dd420b]        # 0x14264d544
   140879339:	4c 3b f8             	cmp    r15,rax
   14087933c:	7c 93                	jl     0x1408792d1
   14087933e:	45 8d 7d fd          	lea    r15d,[r13-0x3]
   140879342:	41 8b ff             	mov    edi,r15d
   140879345:	48 8d 1d 28 42 dd 01 	lea    rbx,[rip+0x1dd4228]        # 0x14264d574
   14087934c:	4c 8d 35 2d 42 dd 01 	lea    r14,[rip+0x1dd422d]        # 0x14264d580
   140879353:	48 8d 35 86 af dc 01 	lea    rsi,[rip+0x1dcaf86]        # 0x1426442e0
   14087935a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140879360:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879364:	ff c0                	inc    eax
   140879366:	89 05 f8 af dc 01    	mov    DWORD PTR [rip+0x1dcaff8],eax        # 0x142644364
   14087936c:	89 3d f6 af dc 01    	mov    DWORD PTR [rip+0x1dcaff6],edi        # 0x142644368
   140879372:	8b 53 f4             	mov    edx,DWORD PTR [rbx-0xc]
   140879375:	48 8b ce             	mov    rcx,rsi
   140879378:	e8 93 e7 25 00       	call   0x140ad7b10
   14087937d:	83 3d e4 e2 b4 01 00 	cmp    DWORD PTR [rip+0x1b4e2e4],0x0        # 0x1423c7668
   140879384:	7e 19                	jle    0x14087939f
   140879386:	48 8b 05 d3 e2 b4 01 	mov    rax,QWORD PTR [rip+0x1b4e2d3]        # 0x1423c7660
   14087938d:	f6 00 01             	test   BYTE PTR [rax],0x1
   140879390:	74 0d                	je     0x14087939f
   140879392:	41 b0 01             	mov    r8b,0x1
   140879395:	33 d2                	xor    edx,edx
   140879397:	48 8b ce             	mov    rcx,rsi
   14087939a:	e8 81 1d 84 ff       	call   0x1400bb120
   14087939f:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408793a3:	83 c0 02             	add    eax,0x2
   1408793a6:	89 05 b8 af dc 01    	mov    DWORD PTR [rip+0x1dcafb8],eax        # 0x142644364
   1408793ac:	89 3d b6 af dc 01    	mov    DWORD PTR [rip+0x1dcafb6],edi        # 0x142644368
   1408793b2:	8b 13                	mov    edx,DWORD PTR [rbx]
   1408793b4:	48 8b ce             	mov    rcx,rsi
   1408793b7:	e8 54 e7 25 00       	call   0x140ad7b10
   1408793bc:	83 3d a5 e2 b4 01 00 	cmp    DWORD PTR [rip+0x1b4e2a5],0x0        # 0x1423c7668
   1408793c3:	7e 19                	jle    0x1408793de
   1408793c5:	48 8b 05 94 e2 b4 01 	mov    rax,QWORD PTR [rip+0x1b4e294]        # 0x1423c7660
   1408793cc:	f6 00 01             	test   BYTE PTR [rax],0x1
   1408793cf:	74 0d                	je     0x1408793de
   1408793d1:	41 b0 01             	mov    r8b,0x1
   1408793d4:	33 d2                	xor    edx,edx
   1408793d6:	48 8b ce             	mov    rcx,rsi
   1408793d9:	e8 42 1d 84 ff       	call   0x1400bb120
   1408793de:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408793e2:	83 c0 03             	add    eax,0x3
   1408793e5:	89 05 79 af dc 01    	mov    DWORD PTR [rip+0x1dcaf79],eax        # 0x142644364
   1408793eb:	89 3d 77 af dc 01    	mov    DWORD PTR [rip+0x1dcaf77],edi        # 0x142644368
   1408793f1:	8b 53 0c             	mov    edx,DWORD PTR [rbx+0xc]
   1408793f4:	48 8b ce             	mov    rcx,rsi
   1408793f7:	e8 14 e7 25 00       	call   0x140ad7b10
   1408793fc:	83 3d 65 e2 b4 01 00 	cmp    DWORD PTR [rip+0x1b4e265],0x0        # 0x1423c7668
   140879403:	7e 19                	jle    0x14087941e
   140879405:	48 8b 05 54 e2 b4 01 	mov    rax,QWORD PTR [rip+0x1b4e254]        # 0x1423c7660
   14087940c:	f6 00 01             	test   BYTE PTR [rax],0x1
   14087940f:	74 0d                	je     0x14087941e
   140879411:	41 b0 01             	mov    r8b,0x1
   140879414:	33 d2                	xor    edx,edx
   140879416:	48 8b ce             	mov    rcx,rsi
   140879419:	e8 02 1d 84 ff       	call   0x1400bb120
   14087941e:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879422:	83 c0 04             	add    eax,0x4
   140879425:	89 05 39 af dc 01    	mov    DWORD PTR [rip+0x1dcaf39],eax        # 0x142644364
   14087942b:	89 3d 37 af dc 01    	mov    DWORD PTR [rip+0x1dcaf37],edi        # 0x142644368
   140879431:	8b 53 18             	mov    edx,DWORD PTR [rbx+0x18]
   140879434:	48 8b ce             	mov    rcx,rsi
   140879437:	e8 d4 e6 25 00       	call   0x140ad7b10
   14087943c:	83 3d 25 e2 b4 01 00 	cmp    DWORD PTR [rip+0x1b4e225],0x0        # 0x1423c7668
   140879443:	7e 19                	jle    0x14087945e
   140879445:	48 8b 05 14 e2 b4 01 	mov    rax,QWORD PTR [rip+0x1b4e214]        # 0x1423c7660
   14087944c:	f6 00 01             	test   BYTE PTR [rax],0x1
   14087944f:	74 0d                	je     0x14087945e
   140879451:	41 b0 01             	mov    r8b,0x1
   140879454:	33 d2                	xor    edx,edx
   140879456:	48 8b ce             	mov    rcx,rsi
   140879459:	e8 c2 1c 84 ff       	call   0x1400bb120
   14087945e:	ff c7                	inc    edi
   140879460:	48 83 c3 04          	add    rbx,0x4
   140879464:	49 3b de             	cmp    rbx,r14
   140879467:	0f 8c f3 fe ff ff    	jl     0x140879360
   14087946d:	48 8b 0d 8c 5b b6 01 	mov    rcx,QWORD PTR [rip+0x1b65b8c]        # 0x1423df000
   140879474:	0f b7 81 14 08 00 00 	movzx  eax,WORD PTR [rcx+0x814]
   14087947b:	66 ff c8             	dec    ax
   14087947e:	48 8d 1d 3f 12 dd 01 	lea    rbx,[rip+0x1dd123f]        # 0x14264a6c4
   140879485:	66 83 f8 01          	cmp    ax,0x1
   140879489:	0f 86 5c 06 00 00    	jbe    0x140879aeb
   14087948f:	66 83 b9 60 03 00 00 07 	cmp    WORD PTR [rcx+0x360],0x7
   140879497:	0f 84 4e 06 00 00    	je     0x140879aeb
   14087949d:	45 33 c0             	xor    r8d,r8d
   1408794a0:	ba 07 00 00 00       	mov    edx,0x7
   1408794a5:	41 b1 01             	mov    r9b,0x1
   1408794a8:	48 8b ce             	mov    rcx,rsi
   1408794ab:	e8 10 1c 84 ff       	call   0x1400bb0c0
   1408794b0:	41 8d 75 ee          	lea    esi,[r13-0x12]
   1408794b4:	48 8b fb             	mov    rdi,rbx
   1408794b7:	4c 8b 74 24 70       	mov    r14,QWORD PTR [rsp+0x70]
   1408794bc:	4c 8d 25 1d ae dc 01 	lea    r12,[rip+0x1dcae1d]        # 0x1426442e0
   1408794c3:	48 8d 1d 06 12 dd 01 	lea    rbx,[rip+0x1dd1206]        # 0x14264a6d0
   1408794ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1408794d0:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408794d4:	83 c0 05             	add    eax,0x5
   1408794d7:	89 05 87 ae dc 01    	mov    DWORD PTR [rip+0x1dcae87],eax        # 0x142644364
   1408794dd:	89 35 85 ae dc 01    	mov    DWORD PTR [rip+0x1dcae85],esi        # 0x142644368
   1408794e3:	45 33 c0             	xor    r8d,r8d
   1408794e6:	49 8b cc             	mov    rcx,r12
   1408794e9:	41 f6 86 18 01 00 00 04 	test   BYTE PTR [r14+0x118],0x4
   1408794f1:	74 05                	je     0x1408794f8
   1408794f3:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   1408794f6:	eb 03                	jmp    0x1408794fb
   1408794f8:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   1408794fb:	e8 40 ec 25 00       	call   0x140ad8140
   140879500:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879504:	83 c0 06             	add    eax,0x6
   140879507:	89 05 57 ae dc 01    	mov    DWORD PTR [rip+0x1dcae57],eax        # 0x142644364
   14087950d:	89 35 55 ae dc 01    	mov    DWORD PTR [rip+0x1dcae55],esi        # 0x142644368
   140879513:	45 33 c0             	xor    r8d,r8d
   140879516:	49 8b cc             	mov    rcx,r12
   140879519:	41 f6 86 18 01 00 00 04 	test   BYTE PTR [r14+0x118],0x4
   140879521:	74 05                	je     0x140879528
   140879523:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   140879526:	eb 02                	jmp    0x14087952a
   140879528:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087952a:	e8 11 ec 25 00       	call   0x140ad8140
   14087952f:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879533:	83 c0 07             	add    eax,0x7
   140879536:	89 05 28 ae dc 01    	mov    DWORD PTR [rip+0x1dcae28],eax        # 0x142644364
   14087953c:	89 35 26 ae dc 01    	mov    DWORD PTR [rip+0x1dcae26],esi        # 0x142644368
   140879542:	45 33 c0             	xor    r8d,r8d
   140879545:	49 8b cc             	mov    rcx,r12
   140879548:	41 f6 86 18 01 00 00 04 	test   BYTE PTR [r14+0x118],0x4
   140879550:	74 05                	je     0x140879557
   140879552:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   140879555:	eb 03                	jmp    0x14087955a
   140879557:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   14087955a:	e8 e1 eb 25 00       	call   0x140ad8140
   14087955f:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879563:	83 c0 08             	add    eax,0x8
   140879566:	89 05 f8 ad dc 01    	mov    DWORD PTR [rip+0x1dcadf8],eax        # 0x142644364
   14087956c:	89 35 f6 ad dc 01    	mov    DWORD PTR [rip+0x1dcadf6],esi        # 0x142644368
   140879572:	45 33 c0             	xor    r8d,r8d
   140879575:	49 8b cc             	mov    rcx,r12
   140879578:	41 f6 86 18 01 00 00 04 	test   BYTE PTR [r14+0x118],0x4
   140879580:	74 05                	je     0x140879587
   140879582:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   140879585:	eb 03                	jmp    0x14087958a
   140879587:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   14087958a:	e8 b1 eb 25 00       	call   0x140ad8140
   14087958f:	ff c6                	inc    esi
   140879591:	48 83 c7 04          	add    rdi,0x4
   140879595:	48 3b fb             	cmp    rdi,rbx
   140879598:	0f 8c 32 ff ff ff    	jl     0x1408794d0
   14087959e:	c7 05 c4 ad dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dcadc4],0x1010007        # 0x14264436c
   1408795a8:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408795ac:	83 c0 09             	add    eax,0x9
   1408795af:	89 05 af ad dc 01    	mov    DWORD PTR [rip+0x1dcadaf],eax        # 0x142644364
   1408795b5:	41 8d 45 ef          	lea    eax,[r13-0x11]
   1408795b9:	89 05 a9 ad dc 01    	mov    DWORD PTR [rip+0x1dcada9],eax        # 0x142644368
   1408795bf:	41 b0 03             	mov    r8b,0x3
   1408795c2:	ba 5c 01 00 00       	mov    edx,0x15c
   1408795c7:	48 8d 0d f2 eb 02 01 	lea    rcx,[rip+0x102ebf2]        # 0x1418a81c0
   1408795ce:	e8 1d cf 3b 00       	call   0x140c364f0
   1408795d3:	48 8d 15 46 a1 d6 00 	lea    rdx,[rip+0xd6a146]        # 0x1415e3720
   1408795da:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408795de:	e8 fd ea 7e ff       	call   0x1400680e0
   1408795e3:	90                   	nop
   1408795e4:	45 33 c9             	xor    r9d,r9d
   1408795e7:	41 b0 03             	mov    r8b,0x3
   1408795ea:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408795ee:	48 8d 3d eb ac dc 01 	lea    rdi,[rip+0x1dcaceb]        # 0x1426442e0
   1408795f5:	48 8b cf             	mov    rcx,rdi
   1408795f8:	e8 a3 d3 25 00       	call   0x140ad69a0
   1408795fd:	90                   	nop
   1408795fe:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879602:	e8 d9 61 7f ff       	call   0x14006f7e0
   140879607:	48 8d 15 22 5c e3 00 	lea    rdx,[rip+0xe35c22]        # 0x1416af230
   14087960e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879612:	e8 c9 ea 7e ff       	call   0x1400680e0
   140879617:	90                   	nop
   140879618:	45 33 c9             	xor    r9d,r9d
   14087961b:	45 33 c0             	xor    r8d,r8d
   14087961e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879622:	48 8b cf             	mov    rcx,rdi
   140879625:	e8 76 d3 25 00       	call   0x140ad69a0
   14087962a:	90                   	nop
   14087962b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087962f:	e8 ac 61 7f ff       	call   0x14006f7e0
   140879634:	45 33 c0             	xor    r8d,r8d
   140879637:	ba 07 00 00 00       	mov    edx,0x7
   14087963c:	41 b1 01             	mov    r9b,0x1
   14087963f:	48 8b cf             	mov    rcx,rdi
   140879642:	e8 79 1a 84 ff       	call   0x1400bb0c0
   140879647:	41 8d 75 f1          	lea    esi,[r13-0xf]
   14087964b:	48 8d 1d 72 10 dd 01 	lea    rbx,[rip+0x1dd1072]        # 0x14264a6c4
   140879652:	48 8b fb             	mov    rdi,rbx
   140879655:	4c 8d 25 84 ac dc 01 	lea    r12,[rip+0x1dcac84]        # 0x1426442e0
   14087965c:	4c 8d 3d 6d 10 dd 01 	lea    r15,[rip+0x1dd106d]        # 0x14264a6d0
   140879663:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879667:	83 c0 05             	add    eax,0x5
   14087966a:	89 05 f4 ac dc 01    	mov    DWORD PTR [rip+0x1dcacf4],eax        # 0x142644364
   140879670:	89 35 f2 ac dc 01    	mov    DWORD PTR [rip+0x1dcacf2],esi        # 0x142644368
   140879676:	45 33 c0             	xor    r8d,r8d
   140879679:	49 8b cc             	mov    rcx,r12
   14087967c:	41 f6 86 18 01 00 00 08 	test   BYTE PTR [r14+0x118],0x8
   140879684:	74 05                	je     0x14087968b
   140879686:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   140879689:	eb 03                	jmp    0x14087968e
   14087968b:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087968e:	e8 ad ea 25 00       	call   0x140ad8140
   140879693:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879697:	83 c0 06             	add    eax,0x6
   14087969a:	89 05 c4 ac dc 01    	mov    DWORD PTR [rip+0x1dcacc4],eax        # 0x142644364
   1408796a0:	89 35 c2 ac dc 01    	mov    DWORD PTR [rip+0x1dcacc2],esi        # 0x142644368
   1408796a6:	45 33 c0             	xor    r8d,r8d
   1408796a9:	49 8b cc             	mov    rcx,r12
   1408796ac:	41 f6 86 18 01 00 00 08 	test   BYTE PTR [r14+0x118],0x8
   1408796b4:	74 05                	je     0x1408796bb
   1408796b6:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   1408796b9:	eb 02                	jmp    0x1408796bd
   1408796bb:	8b 17                	mov    edx,DWORD PTR [rdi]
   1408796bd:	e8 7e ea 25 00       	call   0x140ad8140
   1408796c2:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408796c6:	83 c0 07             	add    eax,0x7
   1408796c9:	89 05 95 ac dc 01    	mov    DWORD PTR [rip+0x1dcac95],eax        # 0x142644364
   1408796cf:	89 35 93 ac dc 01    	mov    DWORD PTR [rip+0x1dcac93],esi        # 0x142644368
   1408796d5:	45 33 c0             	xor    r8d,r8d
   1408796d8:	49 8b cc             	mov    rcx,r12
   1408796db:	41 f6 86 18 01 00 00 08 	test   BYTE PTR [r14+0x118],0x8
   1408796e3:	74 05                	je     0x1408796ea
   1408796e5:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   1408796e8:	eb 03                	jmp    0x1408796ed
   1408796ea:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   1408796ed:	e8 4e ea 25 00       	call   0x140ad8140
   1408796f2:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408796f6:	83 c0 08             	add    eax,0x8
   1408796f9:	89 05 65 ac dc 01    	mov    DWORD PTR [rip+0x1dcac65],eax        # 0x142644364
   1408796ff:	89 35 63 ac dc 01    	mov    DWORD PTR [rip+0x1dcac63],esi        # 0x142644368
   140879705:	45 33 c0             	xor    r8d,r8d
   140879708:	49 8b cc             	mov    rcx,r12
   14087970b:	41 f6 86 18 01 00 00 08 	test   BYTE PTR [r14+0x118],0x8
   140879713:	74 05                	je     0x14087971a
   140879715:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   140879718:	eb 03                	jmp    0x14087971d
   14087971a:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   14087971d:	e8 1e ea 25 00       	call   0x140ad8140
   140879722:	ff c6                	inc    esi
   140879724:	48 83 c7 04          	add    rdi,0x4
   140879728:	49 3b ff             	cmp    rdi,r15
   14087972b:	0f 8c 32 ff ff ff    	jl     0x140879663
   140879731:	c7 05 31 ac dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dcac31],0x1010007        # 0x14264436c
   14087973b:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087973f:	83 c0 09             	add    eax,0x9
   140879742:	89 05 1c ac dc 01    	mov    DWORD PTR [rip+0x1dcac1c],eax        # 0x142644364
   140879748:	41 8d 45 f2          	lea    eax,[r13-0xe]
   14087974c:	89 05 16 ac dc 01    	mov    DWORD PTR [rip+0x1dcac16],eax        # 0x142644368
   140879752:	41 b0 03             	mov    r8b,0x3
   140879755:	ba 5d 01 00 00       	mov    edx,0x15d
   14087975a:	48 8d 0d 5f ea 02 01 	lea    rcx,[rip+0x102ea5f]        # 0x1418a81c0
   140879761:	e8 8a cd 3b 00       	call   0x140c364f0
   140879766:	48 8d 15 b3 9f d6 00 	lea    rdx,[rip+0xd69fb3]        # 0x1415e3720
   14087976d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879771:	e8 6a e9 7e ff       	call   0x1400680e0
   140879776:	90                   	nop
   140879777:	45 33 c9             	xor    r9d,r9d
   14087977a:	41 b0 03             	mov    r8b,0x3
   14087977d:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879781:	48 8d 3d 58 ab dc 01 	lea    rdi,[rip+0x1dcab58]        # 0x1426442e0
   140879788:	48 8b cf             	mov    rcx,rdi
   14087978b:	e8 10 d2 25 00       	call   0x140ad69a0
   140879790:	90                   	nop
   140879791:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879795:	e8 46 60 7f ff       	call   0x14006f7e0
   14087979a:	48 8d 15 ef 5a e3 00 	lea    rdx,[rip+0xe35aef]        # 0x1416af290
   1408797a1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408797a5:	e8 36 e9 7e ff       	call   0x1400680e0
   1408797aa:	90                   	nop
   1408797ab:	45 33 c9             	xor    r9d,r9d
   1408797ae:	45 33 c0             	xor    r8d,r8d
   1408797b1:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   1408797b5:	48 8b cf             	mov    rcx,rdi
   1408797b8:	e8 e3 d1 25 00       	call   0x140ad69a0
   1408797bd:	90                   	nop
   1408797be:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   1408797c2:	e8 19 60 7f ff       	call   0x14006f7e0
   1408797c7:	c7 05 9b ab dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dcab9b],0x1010007        # 0x14264436c
   1408797d1:	41 8d 75 f4          	lea    esi,[r13-0xc]
   1408797d5:	48 8b fb             	mov    rdi,rbx
   1408797d8:	4c 8b 64 24 70       	mov    r12,QWORD PTR [rsp+0x70]
   1408797dd:	4c 8d 35 fc aa dc 01 	lea    r14,[rip+0x1dcaafc]        # 0x1426442e0
   1408797e4:	48 8d 1d e5 0e dd 01 	lea    rbx,[rip+0x1dd0ee5]        # 0x14264a6d0
   1408797eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1408797f0:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408797f4:	83 c0 05             	add    eax,0x5
   1408797f7:	89 05 67 ab dc 01    	mov    DWORD PTR [rip+0x1dcab67],eax        # 0x142644364
   1408797fd:	89 35 65 ab dc 01    	mov    DWORD PTR [rip+0x1dcab65],esi        # 0x142644368
   140879803:	45 33 c0             	xor    r8d,r8d
   140879806:	49 8b ce             	mov    rcx,r14
   140879809:	41 f6 84 24 18 01 00 00 10 	test   BYTE PTR [r12+0x118],0x10
   140879812:	74 05                	je     0x140879819
   140879814:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   140879817:	eb 03                	jmp    0x14087981c
   140879819:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087981c:	e8 1f e9 25 00       	call   0x140ad8140
   140879821:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879825:	83 c0 06             	add    eax,0x6
   140879828:	89 05 36 ab dc 01    	mov    DWORD PTR [rip+0x1dcab36],eax        # 0x142644364
   14087982e:	89 35 34 ab dc 01    	mov    DWORD PTR [rip+0x1dcab34],esi        # 0x142644368
   140879834:	45 33 c0             	xor    r8d,r8d
   140879837:	49 8b ce             	mov    rcx,r14
   14087983a:	41 f6 84 24 18 01 00 00 10 	test   BYTE PTR [r12+0x118],0x10
   140879843:	74 05                	je     0x14087984a
   140879845:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   140879848:	eb 02                	jmp    0x14087984c
   14087984a:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087984c:	e8 ef e8 25 00       	call   0x140ad8140
   140879851:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879855:	83 c0 07             	add    eax,0x7
   140879858:	89 05 06 ab dc 01    	mov    DWORD PTR [rip+0x1dcab06],eax        # 0x142644364
   14087985e:	89 35 04 ab dc 01    	mov    DWORD PTR [rip+0x1dcab04],esi        # 0x142644368
   140879864:	45 33 c0             	xor    r8d,r8d
   140879867:	49 8b ce             	mov    rcx,r14
   14087986a:	41 f6 84 24 18 01 00 00 10 	test   BYTE PTR [r12+0x118],0x10
   140879873:	74 05                	je     0x14087987a
   140879875:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   140879878:	eb 03                	jmp    0x14087987d
   14087987a:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   14087987d:	e8 be e8 25 00       	call   0x140ad8140
   140879882:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879886:	83 c0 08             	add    eax,0x8
   140879889:	89 05 d5 aa dc 01    	mov    DWORD PTR [rip+0x1dcaad5],eax        # 0x142644364
   14087988f:	89 35 d3 aa dc 01    	mov    DWORD PTR [rip+0x1dcaad3],esi        # 0x142644368
   140879895:	45 33 c0             	xor    r8d,r8d
   140879898:	49 8b ce             	mov    rcx,r14
   14087989b:	41 f6 84 24 18 01 00 00 10 	test   BYTE PTR [r12+0x118],0x10
   1408798a4:	74 05                	je     0x1408798ab
   1408798a6:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   1408798a9:	eb 03                	jmp    0x1408798ae
   1408798ab:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   1408798ae:	e8 8d e8 25 00       	call   0x140ad8140
   1408798b3:	ff c6                	inc    esi
   1408798b5:	48 83 c7 04          	add    rdi,0x4
   1408798b9:	48 3b fb             	cmp    rdi,rbx
   1408798bc:	0f 8c 2e ff ff ff    	jl     0x1408797f0
   1408798c2:	c7 05 a0 aa dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dcaaa0],0x1010007        # 0x14264436c
   1408798cc:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408798d0:	83 c0 09             	add    eax,0x9
   1408798d3:	89 05 8b aa dc 01    	mov    DWORD PTR [rip+0x1dcaa8b],eax        # 0x142644364
   1408798d9:	41 8d 45 f5          	lea    eax,[r13-0xb]
   1408798dd:	89 05 85 aa dc 01    	mov    DWORD PTR [rip+0x1dcaa85],eax        # 0x142644368
   1408798e3:	41 b0 03             	mov    r8b,0x3
   1408798e6:	ba 5e 01 00 00       	mov    edx,0x15e
   1408798eb:	48 8d 0d ce e8 02 01 	lea    rcx,[rip+0x102e8ce]        # 0x1418a81c0
   1408798f2:	e8 f9 cb 3b 00       	call   0x140c364f0
   1408798f7:	48 8d 15 22 9e d6 00 	lea    rdx,[rip+0xd69e22]        # 0x1415e3720
   1408798fe:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879902:	e8 d9 e7 7e ff       	call   0x1400680e0
   140879907:	90                   	nop
   140879908:	45 33 c9             	xor    r9d,r9d
   14087990b:	41 b0 03             	mov    r8b,0x3
   14087990e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879912:	48 8d 3d c7 a9 dc 01 	lea    rdi,[rip+0x1dca9c7]        # 0x1426442e0
   140879919:	48 8b cf             	mov    rcx,rdi
   14087991c:	e8 7f d0 25 00       	call   0x140ad69a0
   140879921:	90                   	nop
   140879922:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879926:	e8 b5 5e 7f ff       	call   0x14006f7e0
   14087992b:	48 8d 15 7e 56 e3 00 	lea    rdx,[rip+0xe3567e]        # 0x1416aefb0
   140879932:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879936:	e8 a5 e7 7e ff       	call   0x1400680e0
   14087993b:	90                   	nop
   14087993c:	45 33 c9             	xor    r9d,r9d
   14087993f:	45 33 c0             	xor    r8d,r8d
   140879942:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879946:	48 8b cf             	mov    rcx,rdi
   140879949:	e8 52 d0 25 00       	call   0x140ad69a0
   14087994e:	90                   	nop
   14087994f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879953:	e8 88 5e 7f ff       	call   0x14006f7e0
   140879958:	c7 05 0a aa dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dcaa0a],0x1010007        # 0x14264436c
   140879962:	45 8d 75 f7          	lea    r14d,[r13-0x9]
   140879966:	41 8b f6             	mov    esi,r14d
   140879969:	48 8d 1d 54 0d dd 01 	lea    rbx,[rip+0x1dd0d54]        # 0x14264a6c4
   140879970:	48 8b fb             	mov    rdi,rbx
   140879973:	4c 8d 2d 66 a9 dc 01 	lea    r13,[rip+0x1dca966]        # 0x1426442e0
   14087997a:	4c 8d 3d 4f 0d dd 01 	lea    r15,[rip+0x1dd0d4f]        # 0x14264a6d0
   140879981:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879985:	83 c0 05             	add    eax,0x5
   140879988:	89 05 d6 a9 dc 01    	mov    DWORD PTR [rip+0x1dca9d6],eax        # 0x142644364
   14087998e:	89 35 d4 a9 dc 01    	mov    DWORD PTR [rip+0x1dca9d4],esi        # 0x142644368
   140879994:	45 33 c0             	xor    r8d,r8d
   140879997:	49 8b cd             	mov    rcx,r13
   14087999a:	41 f6 84 24 18 01 00 00 20 	test   BYTE PTR [r12+0x118],0x20
   1408799a3:	74 05                	je     0x1408799aa
   1408799a5:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   1408799a8:	eb 03                	jmp    0x1408799ad
   1408799aa:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   1408799ad:	e8 8e e7 25 00       	call   0x140ad8140
   1408799b2:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408799b6:	83 c0 06             	add    eax,0x6
   1408799b9:	89 05 a5 a9 dc 01    	mov    DWORD PTR [rip+0x1dca9a5],eax        # 0x142644364
   1408799bf:	89 35 a3 a9 dc 01    	mov    DWORD PTR [rip+0x1dca9a3],esi        # 0x142644368
   1408799c5:	45 33 c0             	xor    r8d,r8d
   1408799c8:	49 8b cd             	mov    rcx,r13
   1408799cb:	41 f6 84 24 18 01 00 00 20 	test   BYTE PTR [r12+0x118],0x20
   1408799d4:	74 05                	je     0x1408799db
   1408799d6:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   1408799d9:	eb 02                	jmp    0x1408799dd
   1408799db:	8b 17                	mov    edx,DWORD PTR [rdi]
   1408799dd:	e8 5e e7 25 00       	call   0x140ad8140
   1408799e2:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   1408799e6:	83 c0 07             	add    eax,0x7
   1408799e9:	89 05 75 a9 dc 01    	mov    DWORD PTR [rip+0x1dca975],eax        # 0x142644364
   1408799ef:	89 35 73 a9 dc 01    	mov    DWORD PTR [rip+0x1dca973],esi        # 0x142644368
   1408799f5:	45 33 c0             	xor    r8d,r8d
   1408799f8:	49 8b cd             	mov    rcx,r13
   1408799fb:	41 f6 84 24 18 01 00 00 20 	test   BYTE PTR [r12+0x118],0x20
   140879a04:	74 05                	je     0x140879a0b
   140879a06:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   140879a09:	eb 03                	jmp    0x140879a0e
   140879a0b:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   140879a0e:	e8 2d e7 25 00       	call   0x140ad8140
   140879a13:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879a17:	83 c0 08             	add    eax,0x8
   140879a1a:	89 05 44 a9 dc 01    	mov    DWORD PTR [rip+0x1dca944],eax        # 0x142644364
   140879a20:	89 35 42 a9 dc 01    	mov    DWORD PTR [rip+0x1dca942],esi        # 0x142644368
   140879a26:	45 33 c0             	xor    r8d,r8d
   140879a29:	49 8b cd             	mov    rcx,r13
   140879a2c:	41 f6 84 24 18 01 00 00 20 	test   BYTE PTR [r12+0x118],0x20
   140879a35:	74 05                	je     0x140879a3c
   140879a37:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   140879a3a:	eb 03                	jmp    0x140879a3f
   140879a3c:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   140879a3f:	e8 fc e6 25 00       	call   0x140ad8140
   140879a44:	ff c6                	inc    esi
   140879a46:	48 83 c7 04          	add    rdi,0x4
   140879a4a:	49 3b ff             	cmp    rdi,r15
   140879a4d:	0f 8c 2e ff ff ff    	jl     0x140879981
   140879a53:	c7 05 0f a9 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dca90f],0x1010007        # 0x14264436c
   140879a5d:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879a61:	83 c0 09             	add    eax,0x9
   140879a64:	89 05 fa a8 dc 01    	mov    DWORD PTR [rip+0x1dca8fa],eax        # 0x142644364
   140879a6a:	41 8d 46 01          	lea    eax,[r14+0x1]
   140879a6e:	89 05 f4 a8 dc 01    	mov    DWORD PTR [rip+0x1dca8f4],eax        # 0x142644368
   140879a74:	41 b0 03             	mov    r8b,0x3
   140879a77:	ba 5f 01 00 00       	mov    edx,0x15f
   140879a7c:	48 8d 0d 3d e7 02 01 	lea    rcx,[rip+0x102e73d]        # 0x1418a81c0
   140879a83:	e8 68 ca 3b 00       	call   0x140c364f0
   140879a88:	48 8d 15 91 9c d6 00 	lea    rdx,[rip+0xd69c91]        # 0x1415e3720
   140879a8f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879a93:	e8 48 e6 7e ff       	call   0x1400680e0
   140879a98:	90                   	nop
   140879a99:	45 33 c9             	xor    r9d,r9d
   140879a9c:	41 b0 03             	mov    r8b,0x3
   140879a9f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879aa3:	49 8b cd             	mov    rcx,r13
   140879aa6:	e8 f5 ce 25 00       	call   0x140ad69a0
   140879aab:	90                   	nop
   140879aac:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879ab0:	e8 2b 5d 7f ff       	call   0x14006f7e0
   140879ab5:	48 8d 15 64 55 e3 00 	lea    rdx,[rip+0xe35564]        # 0x1416af020
   140879abc:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879ac0:	e8 1b e6 7e ff       	call   0x1400680e0
   140879ac5:	90                   	nop
   140879ac6:	45 33 c9             	xor    r9d,r9d
   140879ac9:	45 33 c0             	xor    r8d,r8d
   140879acc:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879ad0:	49 8b cd             	mov    rcx,r13
   140879ad3:	e8 c8 ce 25 00       	call   0x140ad69a0
   140879ad8:	90                   	nop
   140879ad9:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879add:	e8 fe 5c 7f ff       	call   0x14006f7e0
   140879ae2:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   140879ae6:	e9 52 01 00 00       	jmp    0x140879c3d
   140879aeb:	45 33 c0             	xor    r8d,r8d
   140879aee:	ba 06 00 00 00       	mov    edx,0x6
   140879af3:	41 b1 01             	mov    r9b,0x1
   140879af6:	48 8b ce             	mov    rcx,rsi
   140879af9:	e8 c2 15 84 ff       	call   0x1400bb0c0
   140879afe:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   140879b03:	41 83 c0 09          	add    r8d,0x9
   140879b07:	41 8d 55 ef          	lea    edx,[r13-0x11]
   140879b0b:	48 8b ce             	mov    rcx,rsi
   140879b0e:	e8 9d 15 84 ff       	call   0x1400bb0b0
   140879b13:	48 8d 15 56 57 e3 00 	lea    rdx,[rip+0xe35756]        # 0x1416af270
   140879b1a:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879b1e:	e8 bd e5 7e ff       	call   0x1400680e0
   140879b23:	90                   	nop
   140879b24:	45 33 c9             	xor    r9d,r9d
   140879b27:	45 33 c0             	xor    r8d,r8d
   140879b2a:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879b2e:	48 8b ce             	mov    rcx,rsi
   140879b31:	e8 6a ce 25 00       	call   0x140ad69a0
   140879b36:	90                   	nop
   140879b37:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879b3b:	e8 80 e2 7e ff       	call   0x140067dc0
   140879b40:	45 33 c0             	xor    r8d,r8d
   140879b43:	ba 06 00 00 00       	mov    edx,0x6
   140879b48:	41 b1 01             	mov    r9b,0x1
   140879b4b:	48 8b ce             	mov    rcx,rsi
   140879b4e:	e8 6d 15 84 ff       	call   0x1400bb0c0
   140879b53:	44 8b 44 24 68       	mov    r8d,DWORD PTR [rsp+0x68]
   140879b58:	41 83 c0 09          	add    r8d,0x9
   140879b5c:	41 8d 55 f2          	lea    edx,[r13-0xe]
   140879b60:	48 8b ce             	mov    rcx,rsi
   140879b63:	e8 48 15 84 ff       	call   0x1400bb0b0
   140879b68:	48 8d 15 61 57 e3 00 	lea    rdx,[rip+0xe35761]        # 0x1416af2d0
   140879b6f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879b73:	e8 68 e5 7e ff       	call   0x1400680e0
   140879b78:	90                   	nop
   140879b79:	45 33 c9             	xor    r9d,r9d
   140879b7c:	45 33 c0             	xor    r8d,r8d
   140879b7f:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879b83:	48 8b ce             	mov    rcx,rsi
   140879b86:	e8 15 ce 25 00       	call   0x140ad69a0
   140879b8b:	90                   	nop
   140879b8c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879b90:	e8 2b e2 7e ff       	call   0x140067dc0
   140879b95:	c7 05 cd a7 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dca7cd],0x1010007        # 0x14264436c
   140879b9f:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879ba3:	83 c0 09             	add    eax,0x9
   140879ba6:	89 05 b8 a7 dc 01    	mov    DWORD PTR [rip+0x1dca7b8],eax        # 0x142644364
   140879bac:	41 8d 45 f5          	lea    eax,[r13-0xb]
   140879bb0:	89 05 b2 a7 dc 01    	mov    DWORD PTR [rip+0x1dca7b2],eax        # 0x142644368
   140879bb6:	48 8d 15 43 54 e3 00 	lea    rdx,[rip+0xe35443]        # 0x1416af000
   140879bbd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879bc1:	e8 1a e5 7e ff       	call   0x1400680e0
   140879bc6:	90                   	nop
   140879bc7:	45 33 c9             	xor    r9d,r9d
   140879bca:	45 33 c0             	xor    r8d,r8d
   140879bcd:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879bd1:	48 8b ce             	mov    rcx,rsi
   140879bd4:	e8 c7 cd 25 00       	call   0x140ad69a0
   140879bd9:	90                   	nop
   140879bda:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879bde:	e8 fd 5b 7f ff       	call   0x14006f7e0
   140879be3:	c7 05 7f a7 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca77f],0x1010006        # 0x14264436c
   140879bed:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879bf1:	83 c0 09             	add    eax,0x9
   140879bf4:	89 05 6a a7 dc 01    	mov    DWORD PTR [rip+0x1dca76a],eax        # 0x142644364
   140879bfa:	41 8d 45 f8          	lea    eax,[r13-0x8]
   140879bfe:	89 05 64 a7 dc 01    	mov    DWORD PTR [rip+0x1dca764],eax        # 0x142644368
   140879c04:	48 8d 15 4d 54 e3 00 	lea    rdx,[rip+0xe3544d]        # 0x1416af058
   140879c0b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879c0f:	e8 cc e4 7e ff       	call   0x1400680e0
   140879c14:	90                   	nop
   140879c15:	45 33 c9             	xor    r9d,r9d
   140879c18:	45 33 c0             	xor    r8d,r8d
   140879c1b:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879c1f:	4c 8d 2d ba a6 dc 01 	lea    r13,[rip+0x1dca6ba]        # 0x1426442e0
   140879c26:	49 8b cd             	mov    rcx,r13
   140879c29:	e8 72 cd 25 00       	call   0x140ad69a0
   140879c2e:	90                   	nop
   140879c2f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879c33:	e8 a8 5b 7f ff       	call   0x14006f7e0
   140879c38:	4c 8b 64 24 70       	mov    r12,QWORD PTR [rsp+0x70]
   140879c3d:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140879c41:	83 c0 09             	add    eax,0x9
   140879c44:	89 05 1a a7 dc 01    	mov    DWORD PTR [rip+0x1dca71a],eax        # 0x142644364
   140879c4a:	44 8b 75 84          	mov    r14d,DWORD PTR [rbp-0x7c]
   140879c4e:	41 8d 46 01          	lea    eax,[r14+0x1]
   140879c52:	89 05 10 a7 dc 01    	mov    DWORD PTR [rip+0x1dca710],eax        # 0x142644368
   140879c58:	41 8b 84 24 1c 01 00 00 	mov    eax,DWORD PTR [r12+0x11c]
   140879c60:	ff c0                	inc    eax
   140879c62:	83 f8 12             	cmp    eax,0x12
   140879c65:	0f 87 f0 05 00 00    	ja     0x14087a25b
   140879c6b:	48 98                	cdqe
   140879c6d:	48 8d 15 8c 63 78 ff 	lea    rdx,[rip+0xffffffffff78638c]        # 0x140000000
   140879c74:	8b 8c 82 14 d9 87 00 	mov    ecx,DWORD PTR [rdx+rax*4+0x87d914]
   140879c7b:	48 03 ca             	add    rcx,rdx
   140879c7e:	ff e1                	jmp    rcx
   140879c80:	c7 05 e2 a6 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca6e2],0x1010006        # 0x14264436c
   140879c8a:	48 8d 15 a7 52 e3 00 	lea    rdx,[rip+0xe352a7]        # 0x1416aef38
   140879c91:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879c95:	e8 46 e4 7e ff       	call   0x1400680e0
   140879c9a:	90                   	nop
   140879c9b:	45 33 c9             	xor    r9d,r9d
   140879c9e:	45 33 c0             	xor    r8d,r8d
   140879ca1:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879ca5:	49 8b cd             	mov    rcx,r13
   140879ca8:	e8 f3 cc 25 00       	call   0x140ad69a0
   140879cad:	90                   	nop
   140879cae:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879cb2:	e8 29 5b 7f ff       	call   0x14006f7e0
   140879cb7:	e9 9f 05 00 00       	jmp    0x14087a25b
   140879cbc:	c7 05 a6 a6 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca6a6],0x1010006        # 0x14264436c
   140879cc6:	48 8d 15 43 52 e3 00 	lea    rdx,[rip+0xe35243]        # 0x1416aef10
   140879ccd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879cd1:	e8 0a e4 7e ff       	call   0x1400680e0
   140879cd6:	90                   	nop
   140879cd7:	45 33 c9             	xor    r9d,r9d
   140879cda:	45 33 c0             	xor    r8d,r8d
   140879cdd:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879ce1:	49 8b cd             	mov    rcx,r13
   140879ce4:	e8 b7 cc 25 00       	call   0x140ad69a0
   140879ce9:	90                   	nop
   140879cea:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879cee:	e8 ed 5a 7f ff       	call   0x14006f7e0
   140879cf3:	e9 63 05 00 00       	jmp    0x14087a25b
   140879cf8:	c7 05 6a a6 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca66a],0x1010006        # 0x14264436c
   140879d02:	48 8d 15 77 52 e3 00 	lea    rdx,[rip+0xe35277]        # 0x1416aef80
   140879d09:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879d0d:	e8 ce e3 7e ff       	call   0x1400680e0
   140879d12:	90                   	nop
   140879d13:	45 33 c9             	xor    r9d,r9d
   140879d16:	45 33 c0             	xor    r8d,r8d
   140879d19:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879d1d:	49 8b cd             	mov    rcx,r13
   140879d20:	e8 7b cc 25 00       	call   0x140ad69a0
   140879d25:	90                   	nop
   140879d26:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879d2a:	e8 b1 5a 7f ff       	call   0x14006f7e0
   140879d2f:	e9 27 05 00 00       	jmp    0x14087a25b
   140879d34:	c7 05 2e a6 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca62e],0x1010006        # 0x14264436c
   140879d3e:	48 8d 15 13 52 e3 00 	lea    rdx,[rip+0xe35213]        # 0x1416aef58
   140879d45:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879d49:	e8 92 e3 7e ff       	call   0x1400680e0
   140879d4e:	90                   	nop
   140879d4f:	45 33 c9             	xor    r9d,r9d
   140879d52:	45 33 c0             	xor    r8d,r8d
   140879d55:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879d59:	49 8b cd             	mov    rcx,r13
   140879d5c:	e8 3f cc 25 00       	call   0x140ad69a0
   140879d61:	90                   	nop
   140879d62:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879d66:	e8 75 5a 7f ff       	call   0x14006f7e0
   140879d6b:	e9 eb 04 00 00       	jmp    0x14087a25b
   140879d70:	c7 05 f2 a5 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca5f2],0x1010006        # 0x14264436c
   140879d7a:	48 8d 15 d7 53 e3 00 	lea    rdx,[rip+0xe353d7]        # 0x1416af158
   140879d81:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879d85:	e8 56 e3 7e ff       	call   0x1400680e0
   140879d8a:	90                   	nop
   140879d8b:	45 33 c9             	xor    r9d,r9d
   140879d8e:	45 33 c0             	xor    r8d,r8d
   140879d91:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879d95:	49 8b cd             	mov    rcx,r13
   140879d98:	e8 03 cc 25 00       	call   0x140ad69a0
   140879d9d:	90                   	nop
   140879d9e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879da2:	e8 39 5a 7f ff       	call   0x14006f7e0
   140879da7:	e9 af 04 00 00       	jmp    0x14087a25b
   140879dac:	c7 05 b6 a5 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca5b6],0x1010006        # 0x14264436c
   140879db6:	48 8d 15 73 53 e3 00 	lea    rdx,[rip+0xe35373]        # 0x1416af130
   140879dbd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879dc1:	e8 1a e3 7e ff       	call   0x1400680e0
   140879dc6:	90                   	nop
   140879dc7:	45 33 c9             	xor    r9d,r9d
   140879dca:	45 33 c0             	xor    r8d,r8d
   140879dcd:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879dd1:	49 8b cd             	mov    rcx,r13
   140879dd4:	e8 c7 cb 25 00       	call   0x140ad69a0
   140879dd9:	90                   	nop
   140879dda:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879dde:	e8 fd 59 7f ff       	call   0x14006f7e0
   140879de3:	e9 73 04 00 00       	jmp    0x14087a25b
   140879de8:	c7 05 7a a5 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca57a],0x1010006        # 0x14264436c
   140879df2:	48 8d 15 bf 53 e3 00 	lea    rdx,[rip+0xe353bf]        # 0x1416af1b8
   140879df9:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879dfd:	e8 de e2 7e ff       	call   0x1400680e0
   140879e02:	90                   	nop
   140879e03:	45 33 c9             	xor    r9d,r9d
   140879e06:	45 33 c0             	xor    r8d,r8d
   140879e09:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879e0d:	49 8b cd             	mov    rcx,r13
   140879e10:	e8 8b cb 25 00       	call   0x140ad69a0
   140879e15:	90                   	nop
   140879e16:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879e1a:	e8 c1 59 7f ff       	call   0x14006f7e0
   140879e1f:	e9 37 04 00 00       	jmp    0x14087a25b
   140879e24:	c7 05 3e a5 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca53e],0x1010006        # 0x14264436c
   140879e2e:	48 8d 15 5b 53 e3 00 	lea    rdx,[rip+0xe3535b]        # 0x1416af190
   140879e35:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879e39:	e8 a2 e2 7e ff       	call   0x1400680e0
   140879e3e:	90                   	nop
   140879e3f:	45 33 c9             	xor    r9d,r9d
   140879e42:	45 33 c0             	xor    r8d,r8d
   140879e45:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879e49:	49 8b cd             	mov    rcx,r13
   140879e4c:	e8 4f cb 25 00       	call   0x140ad69a0
   140879e51:	90                   	nop
   140879e52:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879e56:	e8 85 59 7f ff       	call   0x14006f7e0
   140879e5b:	e9 fb 03 00 00       	jmp    0x14087a25b
   140879e60:	c7 05 02 a5 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca502],0x1010006        # 0x14264436c
   140879e6a:	48 8d 15 2f 52 e3 00 	lea    rdx,[rip+0xe3522f]        # 0x1416af0a0
   140879e71:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879e75:	e8 66 e2 7e ff       	call   0x1400680e0
   140879e7a:	90                   	nop
   140879e7b:	45 33 c9             	xor    r9d,r9d
   140879e7e:	45 33 c0             	xor    r8d,r8d
   140879e81:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879e85:	49 8b cd             	mov    rcx,r13
   140879e88:	e8 13 cb 25 00       	call   0x140ad69a0
   140879e8d:	90                   	nop
   140879e8e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879e92:	e8 49 59 7f ff       	call   0x14006f7e0
   140879e97:	e9 bf 03 00 00       	jmp    0x14087a25b
   140879e9c:	c7 05 c6 a4 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca4c6],0x1010006        # 0x14264436c
   140879ea6:	48 8d 15 cb 51 e3 00 	lea    rdx,[rip+0xe351cb]        # 0x1416af078
   140879ead:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879eb1:	e8 2a e2 7e ff       	call   0x1400680e0
   140879eb6:	90                   	nop
   140879eb7:	45 33 c9             	xor    r9d,r9d
   140879eba:	45 33 c0             	xor    r8d,r8d
   140879ebd:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879ec1:	49 8b cd             	mov    rcx,r13
   140879ec4:	e8 d7 ca 25 00       	call   0x140ad69a0
   140879ec9:	90                   	nop
   140879eca:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879ece:	e8 ed de 7e ff       	call   0x140067dc0
   140879ed3:	e9 83 03 00 00       	jmp    0x14087a25b
   140879ed8:	45 33 c0             	xor    r8d,r8d
   140879edb:	ba 06 00 00 00       	mov    edx,0x6
   140879ee0:	41 b1 01             	mov    r9b,0x1
   140879ee3:	49 8b cd             	mov    rcx,r13
   140879ee6:	e8 d5 11 84 ff       	call   0x1400bb0c0
   140879eeb:	48 8d 15 16 52 e3 00 	lea    rdx,[rip+0xe35216]        # 0x1416af108
   140879ef2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879ef6:	e8 e5 e1 7e ff       	call   0x1400680e0
   140879efb:	90                   	nop
   140879efc:	45 33 c9             	xor    r9d,r9d
   140879eff:	45 33 c0             	xor    r8d,r8d
   140879f02:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879f06:	49 8b cd             	mov    rcx,r13
   140879f09:	e8 92 ca 25 00       	call   0x140ad69a0
   140879f0e:	90                   	nop
   140879f0f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879f13:	e8 a8 de 7e ff       	call   0x140067dc0
   140879f18:	e9 3e 03 00 00       	jmp    0x14087a25b
   140879f1d:	45 33 c0             	xor    r8d,r8d
   140879f20:	ba 06 00 00 00       	mov    edx,0x6
   140879f25:	41 b1 01             	mov    r9b,0x1
   140879f28:	49 8b cd             	mov    rcx,r13
   140879f2b:	e8 90 11 84 ff       	call   0x1400bb0c0
   140879f30:	48 8d 15 99 51 e3 00 	lea    rdx,[rip+0xe35199]        # 0x1416af0d0
   140879f37:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879f3b:	e8 a0 e1 7e ff       	call   0x1400680e0
   140879f40:	90                   	nop
   140879f41:	45 33 c9             	xor    r9d,r9d
   140879f44:	45 33 c0             	xor    r8d,r8d
   140879f47:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879f4b:	49 8b cd             	mov    rcx,r13
   140879f4e:	e8 4d ca 25 00       	call   0x140ad69a0
   140879f53:	90                   	nop
   140879f54:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879f58:	e8 63 de 7e ff       	call   0x140067dc0
   140879f5d:	e9 f9 02 00 00       	jmp    0x14087a25b
   140879f62:	45 33 c0             	xor    r8d,r8d
   140879f65:	ba 06 00 00 00       	mov    edx,0x6
   140879f6a:	41 b1 01             	mov    r9b,0x1
   140879f6d:	49 8b cd             	mov    rcx,r13
   140879f70:	e8 4b 11 84 ff       	call   0x1400bb0c0
   140879f75:	48 8d 15 94 4e e3 00 	lea    rdx,[rip+0xe34e94]        # 0x1416aee10
   140879f7c:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879f80:	e8 5b e1 7e ff       	call   0x1400680e0
   140879f85:	90                   	nop
   140879f86:	45 33 c9             	xor    r9d,r9d
   140879f89:	45 33 c0             	xor    r8d,r8d
   140879f8c:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879f90:	49 8b cd             	mov    rcx,r13
   140879f93:	e8 08 ca 25 00       	call   0x140ad69a0
   140879f98:	90                   	nop
   140879f99:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879f9d:	e8 1e de 7e ff       	call   0x140067dc0
   140879fa2:	e9 b4 02 00 00       	jmp    0x14087a25b
   140879fa7:	45 33 c0             	xor    r8d,r8d
   140879faa:	ba 06 00 00 00       	mov    edx,0x6
   140879faf:	41 b1 01             	mov    r9b,0x1
   140879fb2:	49 8b cd             	mov    rcx,r13
   140879fb5:	e8 06 11 84 ff       	call   0x1400bb0c0
   140879fba:	48 8d 15 1f 4e e3 00 	lea    rdx,[rip+0xe34e1f]        # 0x1416aede0
   140879fc1:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879fc5:	e8 16 e1 7e ff       	call   0x1400680e0
   140879fca:	90                   	nop
   140879fcb:	45 33 c9             	xor    r9d,r9d
   140879fce:	45 33 c0             	xor    r8d,r8d
   140879fd1:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140879fd5:	49 8b cd             	mov    rcx,r13
   140879fd8:	e8 c3 c9 25 00       	call   0x140ad69a0
   140879fdd:	90                   	nop
   140879fde:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140879fe2:	e8 d9 dd 7e ff       	call   0x140067dc0
   140879fe7:	e9 6f 02 00 00       	jmp    0x14087a25b
   140879fec:	45 33 c0             	xor    r8d,r8d
   140879fef:	ba 06 00 00 00       	mov    edx,0x6
   140879ff4:	41 b1 01             	mov    r9b,0x1
   140879ff7:	49 8b cd             	mov    rcx,r13
   140879ffa:	e8 c1 10 84 ff       	call   0x1400bb0c0
   140879fff:	48 8d 15 6a 4e e3 00 	lea    rdx,[rip+0xe34e6a]        # 0x1416aee70
   14087a006:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a00a:	e8 d1 e0 7e ff       	call   0x1400680e0
   14087a00f:	90                   	nop
   14087a010:	45 33 c9             	xor    r9d,r9d
   14087a013:	45 33 c0             	xor    r8d,r8d
   14087a016:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a01a:	49 8b cd             	mov    rcx,r13
   14087a01d:	e8 7e c9 25 00       	call   0x140ad69a0
   14087a022:	90                   	nop
   14087a023:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a027:	e8 94 dd 7e ff       	call   0x140067dc0
   14087a02c:	e9 2a 02 00 00       	jmp    0x14087a25b
   14087a031:	c7 05 31 a3 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca331],0x1010006        # 0x14264436c
   14087a03b:	48 8d 15 fe 4d e3 00 	lea    rdx,[rip+0xe34dfe]        # 0x1416aee40
   14087a042:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a046:	e8 95 e0 7e ff       	call   0x1400680e0
   14087a04b:	90                   	nop
   14087a04c:	45 33 c9             	xor    r9d,r9d
   14087a04f:	45 33 c0             	xor    r8d,r8d
   14087a052:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a056:	49 8b cd             	mov    rcx,r13
   14087a059:	e8 42 c9 25 00       	call   0x140ad69a0
   14087a05e:	90                   	nop
   14087a05f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a063:	e8 78 57 7f ff       	call   0x14006f7e0
   14087a068:	e9 ee 01 00 00       	jmp    0x14087a25b
   14087a06d:	c7 05 f5 a2 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca2f5],0x1010006        # 0x14264436c
   14087a077:	48 8d 15 ba 4c e3 00 	lea    rdx,[rip+0xe34cba]        # 0x1416aed38
   14087a07e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a082:	e8 59 e0 7e ff       	call   0x1400680e0
   14087a087:	90                   	nop
   14087a088:	45 33 c9             	xor    r9d,r9d
   14087a08b:	45 33 c0             	xor    r8d,r8d
   14087a08e:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a092:	49 8b cd             	mov    rcx,r13
   14087a095:	e8 06 c9 25 00       	call   0x140ad69a0
   14087a09a:	90                   	nop
   14087a09b:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a09f:	e8 1c dd 7e ff       	call   0x140067dc0
   14087a0a4:	e9 b2 01 00 00       	jmp    0x14087a25b
   14087a0a9:	c7 05 b9 a2 dc 01 06 00 01 01 	mov    DWORD PTR [rip+0x1dca2b9],0x1010006        # 0x14264436c
   14087a0b3:	48 8d 15 56 4c e3 00 	lea    rdx,[rip+0xe34c56]        # 0x1416aed10
   14087a0ba:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a0be:	e8 1d e0 7e ff       	call   0x1400680e0
   14087a0c3:	90                   	nop
   14087a0c4:	45 33 c9             	xor    r9d,r9d
   14087a0c7:	45 33 c0             	xor    r8d,r8d
   14087a0ca:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a0ce:	49 8b cd             	mov    rcx,r13
   14087a0d1:	e8 ca c8 25 00       	call   0x140ad69a0
   14087a0d6:	90                   	nop
   14087a0d7:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a0db:	e8 00 57 7f ff       	call   0x14006f7e0
   14087a0e0:	e9 76 01 00 00       	jmp    0x14087a25b
   14087a0e5:	c7 05 7d a2 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dca27d],0x1010007        # 0x14264436c
   14087a0ef:	41 8b f6             	mov    esi,r14d
   14087a0f2:	48 8b fb             	mov    rdi,rbx
   14087a0f5:	4c 8d 3d d4 05 dd 01 	lea    r15,[rip+0x1dd05d4]        # 0x14264a6d0
   14087a0fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087a100:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a104:	83 c0 05             	add    eax,0x5
   14087a107:	89 05 57 a2 dc 01    	mov    DWORD PTR [rip+0x1dca257],eax        # 0x142644364
   14087a10d:	89 35 55 a2 dc 01    	mov    DWORD PTR [rip+0x1dca255],esi        # 0x142644368
   14087a113:	45 33 c0             	xor    r8d,r8d
   14087a116:	49 8b cd             	mov    rcx,r13
   14087a119:	41 f6 84 24 18 01 00 00 01 	test   BYTE PTR [r12+0x118],0x1
   14087a122:	74 05                	je     0x14087a129
   14087a124:	8b 57 c4             	mov    edx,DWORD PTR [rdi-0x3c]
   14087a127:	eb 03                	jmp    0x14087a12c
   14087a129:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087a12c:	e8 0f e0 25 00       	call   0x140ad8140
   14087a131:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a135:	83 c0 06             	add    eax,0x6
   14087a138:	89 05 26 a2 dc 01    	mov    DWORD PTR [rip+0x1dca226],eax        # 0x142644364
   14087a13e:	89 35 24 a2 dc 01    	mov    DWORD PTR [rip+0x1dca224],esi        # 0x142644368
   14087a144:	45 33 c0             	xor    r8d,r8d
   14087a147:	49 8b cd             	mov    rcx,r13
   14087a14a:	41 f6 84 24 18 01 00 00 01 	test   BYTE PTR [r12+0x118],0x1
   14087a153:	74 05                	je     0x14087a15a
   14087a155:	8b 57 d0             	mov    edx,DWORD PTR [rdi-0x30]
   14087a158:	eb 02                	jmp    0x14087a15c
   14087a15a:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087a15c:	e8 df df 25 00       	call   0x140ad8140
   14087a161:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a165:	83 c0 07             	add    eax,0x7
   14087a168:	89 05 f6 a1 dc 01    	mov    DWORD PTR [rip+0x1dca1f6],eax        # 0x142644364
   14087a16e:	89 35 f4 a1 dc 01    	mov    DWORD PTR [rip+0x1dca1f4],esi        # 0x142644368
   14087a174:	45 33 c0             	xor    r8d,r8d
   14087a177:	49 8b cd             	mov    rcx,r13
   14087a17a:	41 f6 84 24 18 01 00 00 01 	test   BYTE PTR [r12+0x118],0x1
   14087a183:	74 05                	je     0x14087a18a
   14087a185:	8b 57 dc             	mov    edx,DWORD PTR [rdi-0x24]
   14087a188:	eb 03                	jmp    0x14087a18d
   14087a18a:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   14087a18d:	e8 ae df 25 00       	call   0x140ad8140
   14087a192:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a196:	83 c0 08             	add    eax,0x8
   14087a199:	89 05 c5 a1 dc 01    	mov    DWORD PTR [rip+0x1dca1c5],eax        # 0x142644364
   14087a19f:	89 35 c3 a1 dc 01    	mov    DWORD PTR [rip+0x1dca1c3],esi        # 0x142644368
   14087a1a5:	45 33 c0             	xor    r8d,r8d
   14087a1a8:	49 8b cd             	mov    rcx,r13
   14087a1ab:	41 f6 84 24 18 01 00 00 01 	test   BYTE PTR [r12+0x118],0x1
   14087a1b4:	74 05                	je     0x14087a1bb
   14087a1b6:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087a1b9:	eb 03                	jmp    0x14087a1be
   14087a1bb:	8b 57 18             	mov    edx,DWORD PTR [rdi+0x18]
   14087a1be:	e8 7d df 25 00       	call   0x140ad8140
   14087a1c3:	ff c6                	inc    esi
   14087a1c5:	48 83 c7 04          	add    rdi,0x4
   14087a1c9:	49 3b ff             	cmp    rdi,r15
   14087a1cc:	0f 8c 2e ff ff ff    	jl     0x14087a100
   14087a1d2:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a1d6:	83 c0 09             	add    eax,0x9
   14087a1d9:	89 05 85 a1 dc 01    	mov    DWORD PTR [rip+0x1dca185],eax        # 0x142644364
   14087a1df:	41 8d 46 01          	lea    eax,[r14+0x1]
   14087a1e3:	89 05 7f a1 dc 01    	mov    DWORD PTR [rip+0x1dca17f],eax        # 0x142644368
   14087a1e9:	41 b0 03             	mov    r8b,0x3
   14087a1ec:	ba 60 01 00 00       	mov    edx,0x160
   14087a1f1:	48 8d 0d c8 df 02 01 	lea    rcx,[rip+0x102dfc8]        # 0x1418a81c0
   14087a1f8:	e8 f3 c2 3b 00       	call   0x140c364f0
   14087a1fd:	48 8d 15 1c 95 d6 00 	lea    rdx,[rip+0xd6951c]        # 0x1415e3720
   14087a204:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a208:	e8 d3 de 7e ff       	call   0x1400680e0
   14087a20d:	90                   	nop
   14087a20e:	45 33 c9             	xor    r9d,r9d
   14087a211:	41 b0 03             	mov    r8b,0x3
   14087a214:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a218:	49 8b cd             	mov    rcx,r13
   14087a21b:	e8 80 c7 25 00       	call   0x140ad69a0
   14087a220:	90                   	nop
   14087a221:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a225:	e8 b6 55 7f ff       	call   0x14006f7e0
   14087a22a:	48 8d 15 7f 4b e3 00 	lea    rdx,[rip+0xe34b7f]        # 0x1416aedb0
   14087a231:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a235:	e8 a6 de 7e ff       	call   0x1400680e0
   14087a23a:	90                   	nop
   14087a23b:	45 33 c9             	xor    r9d,r9d
   14087a23e:	45 33 c0             	xor    r8d,r8d
   14087a241:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a245:	49 8b cd             	mov    rcx,r13
   14087a248:	e8 53 c7 25 00       	call   0x140ad69a0
   14087a24d:	90                   	nop
   14087a24e:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a252:	e8 89 55 7f ff       	call   0x14006f7e0
   14087a257:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087a25b:	c7 05 07 a1 dc 01 07 00 01 01 	mov    DWORD PTR [rip+0x1dca107],0x1010007        # 0x14264436c
   14087a265:	41 8b ff             	mov    edi,r15d
   14087a268:	4c 8d 3d 61 04 dd 01 	lea    r15,[rip+0x1dd0461]        # 0x14264a6d0
   14087a26f:	90                   	nop
   14087a270:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a274:	83 c0 05             	add    eax,0x5
   14087a277:	89 05 e7 a0 dc 01    	mov    DWORD PTR [rip+0x1dca0e7],eax        # 0x142644364
   14087a27d:	89 3d e5 a0 dc 01    	mov    DWORD PTR [rip+0x1dca0e5],edi        # 0x142644368
   14087a283:	45 33 c0             	xor    r8d,r8d
   14087a286:	49 8b cd             	mov    rcx,r13
   14087a289:	41 f6 84 24 18 01 00 00 02 	test   BYTE PTR [r12+0x118],0x2
   14087a292:	74 05                	je     0x14087a299
   14087a294:	8b 53 c4             	mov    edx,DWORD PTR [rbx-0x3c]
   14087a297:	eb 03                	jmp    0x14087a29c
   14087a299:	8b 53 f4             	mov    edx,DWORD PTR [rbx-0xc]
   14087a29c:	e8 9f de 25 00       	call   0x140ad8140
   14087a2a1:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a2a5:	83 c0 06             	add    eax,0x6
   14087a2a8:	89 05 b6 a0 dc 01    	mov    DWORD PTR [rip+0x1dca0b6],eax        # 0x142644364
   14087a2ae:	89 3d b4 a0 dc 01    	mov    DWORD PTR [rip+0x1dca0b4],edi        # 0x142644368
   14087a2b4:	45 33 c0             	xor    r8d,r8d
   14087a2b7:	49 8b cd             	mov    rcx,r13
   14087a2ba:	41 f6 84 24 18 01 00 00 02 	test   BYTE PTR [r12+0x118],0x2
   14087a2c3:	74 05                	je     0x14087a2ca
   14087a2c5:	8b 53 d0             	mov    edx,DWORD PTR [rbx-0x30]
   14087a2c8:	eb 02                	jmp    0x14087a2cc
   14087a2ca:	8b 13                	mov    edx,DWORD PTR [rbx]
   14087a2cc:	e8 6f de 25 00       	call   0x140ad8140
   14087a2d1:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a2d5:	83 c0 07             	add    eax,0x7
   14087a2d8:	89 05 86 a0 dc 01    	mov    DWORD PTR [rip+0x1dca086],eax        # 0x142644364
   14087a2de:	89 3d 84 a0 dc 01    	mov    DWORD PTR [rip+0x1dca084],edi        # 0x142644368
   14087a2e4:	45 33 c0             	xor    r8d,r8d
   14087a2e7:	49 8b cd             	mov    rcx,r13
   14087a2ea:	41 f6 84 24 18 01 00 00 02 	test   BYTE PTR [r12+0x118],0x2
   14087a2f3:	74 05                	je     0x14087a2fa
   14087a2f5:	8b 53 dc             	mov    edx,DWORD PTR [rbx-0x24]
   14087a2f8:	eb 03                	jmp    0x14087a2fd
   14087a2fa:	8b 53 0c             	mov    edx,DWORD PTR [rbx+0xc]
   14087a2fd:	e8 3e de 25 00       	call   0x140ad8140
   14087a302:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a306:	83 c0 08             	add    eax,0x8
   14087a309:	89 05 55 a0 dc 01    	mov    DWORD PTR [rip+0x1dca055],eax        # 0x142644364
   14087a30f:	89 3d 53 a0 dc 01    	mov    DWORD PTR [rip+0x1dca053],edi        # 0x142644368
   14087a315:	45 33 c0             	xor    r8d,r8d
   14087a318:	49 8b cd             	mov    rcx,r13
   14087a31b:	41 f6 84 24 18 01 00 00 02 	test   BYTE PTR [r12+0x118],0x2
   14087a324:	74 05                	je     0x14087a32b
   14087a326:	8b 53 e8             	mov    edx,DWORD PTR [rbx-0x18]
   14087a329:	eb 03                	jmp    0x14087a32e
   14087a32b:	8b 53 18             	mov    edx,DWORD PTR [rbx+0x18]
   14087a32e:	e8 0d de 25 00       	call   0x140ad8140
   14087a333:	ff c7                	inc    edi
   14087a335:	48 83 c3 04          	add    rbx,0x4
   14087a339:	49 3b df             	cmp    rbx,r15
   14087a33c:	0f 8c 2e ff ff ff    	jl     0x14087a270
   14087a342:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   14087a346:	83 c0 09             	add    eax,0x9
   14087a349:	89 05 15 a0 dc 01    	mov    DWORD PTR [rip+0x1dca015],eax        # 0x142644364
   14087a34f:	8b 45 80             	mov    eax,DWORD PTR [rbp-0x80]
   14087a352:	ff c0                	inc    eax
   14087a354:	89 05 0e a0 dc 01    	mov    DWORD PTR [rip+0x1dca00e],eax        # 0x142644368
   14087a35a:	41 b0 03             	mov    r8b,0x3
   14087a35d:	ba 61 01 00 00       	mov    edx,0x161
   14087a362:	48 8d 0d 57 de 02 01 	lea    rcx,[rip+0x102de57]        # 0x1418a81c0
   14087a369:	e8 82 c1 3b 00       	call   0x140c364f0
   14087a36e:	48 8d 15 ab 93 d6 00 	lea    rdx,[rip+0xd693ab]        # 0x1415e3720
   14087a375:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a379:	e8 62 dd 7e ff       	call   0x1400680e0
   14087a37e:	90                   	nop
   14087a37f:	45 33 c9             	xor    r9d,r9d
   14087a382:	41 b0 03             	mov    r8b,0x3
   14087a385:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a389:	49 8b cd             	mov    rcx,r13
   14087a38c:	e8 0f c6 25 00       	call   0x140ad69a0
   14087a391:	90                   	nop
   14087a392:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a396:	e8 45 54 7f ff       	call   0x14006f7e0
   14087a39b:	48 8d 15 ce 49 e3 00 	lea    rdx,[rip+0xe349ce]        # 0x1416aed70
   14087a3a2:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a3a6:	e8 35 dd 7e ff       	call   0x1400680e0
   14087a3ab:	90                   	nop
   14087a3ac:	45 33 c9             	xor    r9d,r9d
   14087a3af:	45 33 c0             	xor    r8d,r8d
   14087a3b2:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087a3b6:	49 8b cd             	mov    rcx,r13
   14087a3b9:	e8 e2 c5 25 00       	call   0x140ad69a0
   14087a3be:	90                   	nop
   14087a3bf:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087a3c3:	e8 18 54 7f ff       	call   0x14006f7e0
   14087a3c8:	e9 d2 34 00 00       	jmp    0x14087d89f
   14087a3cd:	44 8d 6f 10          	lea    r13d,[rdi+0x10]
   14087a3d1:	4c 8b 74 24 70       	mov    r14,QWORD PTR [rsp+0x70]
   14087a3d6:	49 8d b6 40 01 00 00 	lea    rsi,[r14+0x140]
   14087a3dd:	48 8b ce             	mov    rcx,rsi
   14087a3e0:	e8 fb 49 7f ff       	call   0x14006ede0
   14087a3e5:	48 8b d8             	mov    rbx,rax
   14087a3e8:	49 81 c6 28 01 00 00 	add    r14,0x128
   14087a3ef:	49 8b ce             	mov    rcx,r14
   14087a3f2:	e8 e9 49 7f ff       	call   0x14006ede0
   14087a3f7:	03 c3                	add    eax,ebx
   14087a3f9:	83 f8 05             	cmp    eax,0x5
   14087a3fc:	7d 21                	jge    0x14087a41f
   14087a3fe:	48 8b ce             	mov    rcx,rsi
   14087a401:	e8 da 49 7f ff       	call   0x14006ede0
   14087a406:	48 8b d8             	mov    rbx,rax
   14087a409:	49 8b ce             	mov    rcx,r14
   14087a40c:	e8 cf 49 7f ff       	call   0x14006ede0
   14087a411:	03 c3                	add    eax,ebx
   14087a413:	44 8d 6f 01          	lea    r13d,[rdi+0x1]
   14087a417:	45 8d 6c 45 00       	lea    r13d,[r13+rax*2+0x0]
   14087a41c:	44 03 e8             	add    r13d,eax
   14087a41f:	48 8b ce             	mov    rcx,rsi
   14087a422:	e8 b9 49 7f ff       	call   0x14006ede0
   14087a427:	48 8b d8             	mov    rbx,rax
   14087a42a:	49 8b ce             	mov    rcx,r14
   14087a42d:	e8 ae 49 7f ff       	call   0x14006ede0
   14087a432:	48 03 c3             	add    rax,rbx
   14087a435:	44 0f 44 ef          	cmove  r13d,edi
   14087a439:	44 89 6d e0          	mov    DWORD PTR [rbp-0x20],r13d
   14087a43d:	48 8b ce             	mov    rcx,rsi
   14087a440:	e8 9b 49 7f ff       	call   0x14006ede0
   14087a445:	48 8b d8             	mov    rbx,rax
   14087a448:	49 8b ce             	mov    rcx,r14
   14087a44b:	e8 90 49 7f ff       	call   0x14006ede0
   14087a450:	44 8d 34 03          	lea    r14d,[rbx+rax*1]
   14087a454:	b8 05 00 00 00       	mov    eax,0x5
   14087a459:	44 3b f0             	cmp    r14d,eax
   14087a45c:	44 0f 4f f0          	cmovg  r14d,eax
   14087a460:	4c 89 75 f0          	mov    QWORD PTR [rbp-0x10],r14
   14087a464:	44 8b 7c 24 68       	mov    r15d,DWORD PTR [rsp+0x68]
   14087a469:	41 ff c7             	inc    r15d
   14087a46c:	44 89 7d 80          	mov    DWORD PTR [rbp-0x80],r15d
   14087a470:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   14087a474:	41 ff c8             	dec    r8d
   14087a477:	44 8d 4f 02          	lea    r9d,[rdi+0x2]
   14087a47b:	44 89 4d 8c          	mov    DWORD PTR [rbp-0x74],r9d
   14087a47f:	41 8b cd             	mov    ecx,r13d
   14087a482:	41 2b c9             	sub    ecx,r9d
   14087a485:	ff c1                	inc    ecx
   14087a487:	b8 56 55 55 55       	mov    eax,0x55555556
   14087a48c:	f7 e9                	imul   ecx
   14087a48e:	8b c2                	mov    eax,edx
   14087a490:	c1 e8 1f             	shr    eax,0x1f
   14087a493:	03 d0                	add    edx,eax
   14087a495:	89 55 98             	mov    DWORD PTR [rbp-0x68],edx
   14087a498:	41 8d 70 fe          	lea    esi,[r8-0x2]
   14087a49c:	44 3b f2             	cmp    r14d,edx
   14087a49f:	41 0f 4e f0          	cmovle esi,r8d
   14087a4a3:	89 74 24 64          	mov    DWORD PTR [rsp+0x64],esi
   14087a4a7:	45 8b e9             	mov    r13d,r9d
   14087a4aa:	44 89 4c 24 60       	mov    DWORD PTR [rsp+0x60],r9d
   14087a4af:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087a4b4:	8b 83 58 01 00 00    	mov    eax,DWORD PTR [rbx+0x158]
   14087a4ba:	41 8b ce             	mov    ecx,r14d
   14087a4bd:	2b ca                	sub    ecx,edx
   14087a4bf:	3b c1                	cmp    eax,ecx
   14087a4c1:	0f 4e c8             	cmovle ecx,eax
   14087a4c4:	45 33 e4             	xor    r12d,r12d
   14087a4c7:	85 c9                	test   ecx,ecx
   14087a4c9:	44 0f 49 e1          	cmovns r12d,ecx
   14087a4cd:	44 89 65 88          	mov    DWORD PTR [rbp-0x78],r12d
   14087a4d1:	41 8d 04 14          	lea    eax,[r12+rdx*1]
   14087a4d5:	89 45 84             	mov    DWORD PTR [rbp-0x7c],eax
   14087a4d8:	44 3b e0             	cmp    r12d,eax
   14087a4db:	0f 8d 40 0d 00 00    	jge    0x14087b221
   14087a4e1:	48 8d 83 28 01 00 00 	lea    rax,[rbx+0x128]
   14087a4e8:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
   14087a4ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087a4f0:	45 3b e6             	cmp    r12d,r14d
   14087a4f3:	0f 8d 21 0d 00 00    	jge    0x14087b21a
   14087a4f9:	45 33 c0             	xor    r8d,r8d
   14087a4fc:	ba 07 00 00 00       	mov    edx,0x7
   14087a501:	41 b1 01             	mov    r9b,0x1
   14087a504:	4c 8d 35 d5 9d dc 01 	lea    r14,[rip+0x1dc9dd5]        # 0x1426442e0
   14087a50b:	49 8b ce             	mov    rcx,r14
   14087a50e:	e8 ad 0b 84 ff       	call   0x1400bb0c0
   14087a513:	41 8b ff             	mov    edi,r15d
   14087a516:	44 3b fe             	cmp    r15d,esi
   14087a519:	0f 8f 06 01 00 00    	jg     0x14087a625
   14087a51f:	45 8d 75 03          	lea    r14d,[r13+0x3]
   14087a523:	4c 8d 25 b6 9d dc 01 	lea    r12,[rip+0x1dc9db6]        # 0x1426442e0
   14087a52a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087a530:	41 8b dd             	mov    ebx,r13d
   14087a533:	45 3b ee             	cmp    r13d,r14d
   14087a536:	0f 8d cf 00 00 00    	jge    0x14087a60b
   14087a53c:	3b fe                	cmp    edi,esi
   14087a53e:	75 5d                	jne    0x14087a59d
   14087a540:	48 8d 35 59 b7 dc 01 	lea    rsi,[rip+0x1dcb759]        # 0x142645ca0
   14087a547:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087a550:	44 8b c7             	mov    r8d,edi
   14087a553:	8b d3                	mov    edx,ebx
   14087a555:	49 8b cc             	mov    rcx,r12
   14087a558:	e8 53 0b 84 ff       	call   0x1400bb0b0
   14087a55d:	49 8b cc             	mov    rcx,r12
   14087a560:	41 3b ff             	cmp    edi,r15d
   14087a563:	75 05                	jne    0x14087a56a
   14087a565:	8b 56 e8             	mov    edx,DWORD PTR [rsi-0x18]
   14087a568:	eb 02                	jmp    0x14087a56c
   14087a56a:	8b 16                	mov    edx,DWORD PTR [rsi]
   14087a56c:	e8 9f d5 25 00       	call   0x140ad7b10
   14087a571:	33 d2                	xor    edx,edx
   14087a573:	48 8d 0d e6 d0 b4 01 	lea    rcx,[rip+0x1b4d0e6]        # 0x1423c7660
   14087a57a:	e8 a1 79 7f ff       	call   0x140071f20
   14087a57f:	84 c0                	test   al,al
   14087a581:	74 0d                	je     0x14087a590
   14087a583:	41 b0 01             	mov    r8b,0x1
   14087a586:	33 d2                	xor    edx,edx
   14087a588:	49 8b cc             	mov    rcx,r12
   14087a58b:	e8 90 0b 84 ff       	call   0x1400bb120
   14087a590:	ff c3                	inc    ebx
   14087a592:	48 83 c6 04          	add    rsi,0x4
   14087a596:	41 3b de             	cmp    ebx,r14d
   14087a599:	7c b5                	jl     0x14087a550
   14087a59b:	eb 6a                	jmp    0x14087a607
   14087a59d:	48 8d 35 f0 b6 dc 01 	lea    rsi,[rip+0x1dcb6f0]        # 0x142645c94
   14087a5a4:	4c 8d 2d 35 9d dc 01 	lea    r13,[rip+0x1dc9d35]        # 0x1426442e0
   14087a5ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087a5b0:	44 8b c7             	mov    r8d,edi
   14087a5b3:	8b d3                	mov    edx,ebx
   14087a5b5:	49 8b cd             	mov    rcx,r13
   14087a5b8:	e8 f3 0a 84 ff       	call   0x1400bb0b0
   14087a5bd:	49 8b cd             	mov    rcx,r13
   14087a5c0:	41 3b ff             	cmp    edi,r15d
   14087a5c3:	75 05                	jne    0x14087a5ca
   14087a5c5:	8b 56 f4             	mov    edx,DWORD PTR [rsi-0xc]
   14087a5c8:	eb 02                	jmp    0x14087a5cc
   14087a5ca:	8b 16                	mov    edx,DWORD PTR [rsi]
   14087a5cc:	e8 3f d5 25 00       	call   0x140ad7b10
   14087a5d1:	33 d2                	xor    edx,edx
   14087a5d3:	48 8d 0d 86 d0 b4 01 	lea    rcx,[rip+0x1b4d086]        # 0x1423c7660
   14087a5da:	e8 41 79 7f ff       	call   0x140071f20
   14087a5df:	84 c0                	test   al,al
   14087a5e1:	74 0d                	je     0x14087a5f0
   14087a5e3:	41 b0 01             	mov    r8b,0x1
   14087a5e6:	33 d2                	xor    edx,edx
   14087a5e8:	49 8b cd             	mov    rcx,r13
   14087a5eb:	e8 30 0b 84 ff       	call   0x1400bb120
   14087a5f0:	ff c3                	inc    ebx
   14087a5f2:	48 83 c6 04          	add    rsi,0x4
   14087a5f6:	41 3b de             	cmp    ebx,r14d
   14087a5f9:	7c b5                	jl     0x14087a5b0
   14087a5fb:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087a600:	4c 8d 25 d9 9c dc 01 	lea    r12,[rip+0x1dc9cd9]        # 0x1426442e0
   14087a607:	8b 74 24 64          	mov    esi,DWORD PTR [rsp+0x64]
   14087a60b:	ff c7                	inc    edi
   14087a60d:	3b fe                	cmp    edi,esi
   14087a60f:	0f 8e 1b ff ff ff    	jle    0x14087a530
   14087a615:	44 8b 65 88          	mov    r12d,DWORD PTR [rbp-0x78]
   14087a619:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087a61e:	4c 8d 35 bb 9c dc 01 	lea    r14,[rip+0x1dc9cbb]        # 0x1426442e0
   14087a625:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
   14087a629:	e8 b2 47 7f ff       	call   0x14006ede0
   14087a62e:	48 8d 8b 28 01 00 00 	lea    rcx,[rbx+0x128]
   14087a635:	44 3b e0             	cmp    r12d,eax
   14087a638:	0f 8c 04 02 00 00    	jl     0x14087a842
   14087a63e:	e8 9d 47 7f ff       	call   0x14006ede0
   14087a643:	41 8b cc             	mov    ecx,r12d
   14087a646:	2b c8                	sub    ecx,eax
   14087a648:	48 63 d1             	movsxd rdx,ecx
   14087a64b:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087a650:	48 81 c1 40 01 00 00 	add    rcx,0x140
   14087a657:	e8 54 4b 7f ff       	call   0x14006f1b0
   14087a65c:	4c 8b 30             	mov    r14,QWORD PTR [rax]
   14087a65f:	45 33 c0             	xor    r8d,r8d
   14087a662:	ba 06 00 00 00       	mov    edx,0x6
   14087a667:	41 b1 01             	mov    r9b,0x1
   14087a66a:	48 8d 0d 6f 9c dc 01 	lea    rcx,[rip+0x1dc9c6f]        # 0x1426442e0
   14087a671:	e8 4a 0a 84 ff       	call   0x1400bb0c0
   14087a676:	40 32 f6             	xor    sil,sil
   14087a679:	40 32 ff             	xor    dil,dil
   14087a67c:	48 8b 1d 7d 49 b6 01 	mov    rbx,QWORD PTR [rip+0x1b6497d]        # 0x1423df000
   14087a683:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   14087a687:	48 8d 8b 08 04 00 00 	lea    rcx,[rbx+0x408]
   14087a68e:	e8 3d 4b 7f ff       	call   0x14006f1d0
   14087a693:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   14087a697:	48 8d 8b 08 04 00 00 	lea    rcx,[rbx+0x408]
   14087a69e:	e8 1d 4b 7f ff       	call   0x14006f1c0
   14087a6a3:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   14087a6a7:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   14087a6ab:	e8 50 f2 83 ff       	call   0x1400b9900
   14087a6b0:	84 c0                	test   al,al
   14087a6b2:	75 49                	jne    0x14087a6fd
   14087a6b4:	41 bd 01 00 00 00    	mov    r13d,0x1
   14087a6ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087a6c0:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   14087a6c4:	e8 d7 46 7f ff       	call   0x14006eda0
   14087a6c9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087a6cc:	4c 39 31             	cmp    QWORD PTR [rcx],r14
   14087a6cf:	75 0d                	jne    0x14087a6de
   14087a6d1:	40 0f b6 f6          	movzx  esi,sil
   14087a6d5:	66 44 39 69 08       	cmp    WORD PTR [rcx+0x8],r13w
   14087a6da:	41 0f 44 f5          	cmove  esi,r13d
   14087a6de:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   14087a6e2:	e8 a9 46 7f ff       	call   0x14006ed90
   14087a6e7:	48 8d 55 a8          	lea    rdx,[rbp-0x58]
   14087a6eb:	48 8d 4d c0          	lea    rcx,[rbp-0x40]
   14087a6ef:	e8 0c f2 83 ff       	call   0x1400b9900
   14087a6f4:	84 c0                	test   al,al
   14087a6f6:	74 c8                	je     0x14087a6c0
   14087a6f8:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087a6fd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087a702:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
   14087a706:	48 85 db             	test   rbx,rbx
   14087a709:	74 73                	je     0x14087a77e
   14087a70b:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
   14087a70f:	48 8d 8b 08 04 00 00 	lea    rcx,[rbx+0x408]
   14087a716:	e8 b5 4a 7f ff       	call   0x14006f1d0
   14087a71b:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
   14087a71f:	48 8d 8b 08 04 00 00 	lea    rcx,[rbx+0x408]
   14087a726:	e8 95 4a 7f ff       	call   0x14006f1c0
   14087a72b:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
   14087a72f:	48 8d 4d e8          	lea    rcx,[rbp-0x18]
   14087a733:	e8 c8 f1 83 ff       	call   0x1400b9900
   14087a738:	84 c0                	test   al,al
   14087a73a:	75 42                	jne    0x14087a77e
   14087a73c:	41 bc 01 00 00 00    	mov    r12d,0x1
   14087a742:	48 8d 4d e8          	lea    rcx,[rbp-0x18]
   14087a746:	e8 55 46 7f ff       	call   0x14006eda0
   14087a74b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087a74e:	4c 39 31             	cmp    QWORD PTR [rcx],r14
   14087a751:	75 0d                	jne    0x14087a760
   14087a753:	40 0f b6 ff          	movzx  edi,dil
   14087a757:	66 44 39 61 08       	cmp    WORD PTR [rcx+0x8],r12w
   14087a75c:	41 0f 44 fc          	cmove  edi,r12d
   14087a760:	48 8d 4d e8          	lea    rcx,[rbp-0x18]
   14087a764:	e8 27 46 7f ff       	call   0x14006ed90
   14087a769:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
   14087a76d:	48 8d 4d e8          	lea    rcx,[rbp-0x18]
   14087a771:	e8 8a f1 83 ff       	call   0x1400b9900
   14087a776:	84 c0                	test   al,al
   14087a778:	74 c8                	je     0x14087a742
   14087a77a:	44 8b 65 88          	mov    r12d,DWORD PTR [rbp-0x78]
   14087a77e:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a782:	e8 99 4e 7f ff       	call   0x14006f620
   14087a787:	90                   	nop
   14087a788:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087a78c:	e8 8f 4e 7f ff       	call   0x14006f620
   14087a791:	90                   	nop
   14087a792:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a796:	40 84 f6             	test   sil,sil
   14087a799:	74 17                	je     0x14087a7b2
   14087a79b:	40 84 ff             	test   dil,dil
   14087a79e:	74 09                	je     0x14087a7a9
   14087a7a0:	48 8d 15 39 47 e3 00 	lea    rdx,[rip+0xe34739]        # 0x1416aeee0
   14087a7a7:	eb 1c                	jmp    0x14087a7c5
   14087a7a9:	48 8d 15 20 47 e3 00 	lea    rdx,[rip+0xe34720]        # 0x1416aeed0
   14087a7b0:	eb 13                	jmp    0x14087a7c5
   14087a7b2:	40 84 ff             	test   dil,dil
   14087a7b5:	48 8d 15 44 47 e3 00 	lea    rdx,[rip+0xe34744]        # 0x1416aef00
   14087a7bc:	75 07                	jne    0x14087a7c5
   14087a7be:	48 8d 15 2b 47 e3 00 	lea    rdx,[rip+0xe3472b]        # 0x1416aeef0
   14087a7c5:	e8 46 4d 7f ff       	call   0x14006f510
   14087a7ca:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087a7d0:	45 33 c0             	xor    r8d,r8d
   14087a7d3:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087a7d7:	49 8b ce             	mov    rcx,r14
   14087a7da:	e8 b1 7c 3e 00       	call   0x140c62490
   14087a7df:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087a7e3:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a7e7:	e8 b4 f4 83 ff       	call   0x1400b9ca0
   14087a7ec:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a7f0:	e8 cb 4a 7f ff       	call   0x14006f2c0
   14087a7f5:	99                   	cdq
   14087a7f6:	2b c2                	sub    eax,edx
   14087a7f8:	d1 f8                	sar    eax,1
   14087a7fa:	8b c8                	mov    ecx,eax
   14087a7fc:	8b 44 24 64          	mov    eax,DWORD PTR [rsp+0x64]
   14087a800:	41 03 c7             	add    eax,r15d
   14087a803:	99                   	cdq
   14087a804:	2b c2                	sub    eax,edx
   14087a806:	d1 f8                	sar    eax,1
   14087a808:	2b c1                	sub    eax,ecx
   14087a80a:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087a80e:	44 8b c0             	mov    r8d,eax
   14087a811:	48 8d 1d c8 9a dc 01 	lea    rbx,[rip+0x1dc9ac8]        # 0x1426442e0
   14087a818:	48 8b cb             	mov    rcx,rbx
   14087a81b:	e8 90 08 84 ff       	call   0x1400bb0b0
   14087a820:	45 33 c9             	xor    r9d,r9d
   14087a823:	45 33 c0             	xor    r8d,r8d
   14087a826:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087a82a:	48 8b cb             	mov    rcx,rbx
   14087a82d:	e8 6e c1 25 00       	call   0x140ad69a0
   14087a832:	90                   	nop
   14087a833:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087a837:	e8 84 d5 7e ff       	call   0x140067dc0
   14087a83c:	90                   	nop
   14087a83d:	e9 a8 09 00 00       	jmp    0x14087b1ea
   14087a842:	49 63 fc             	movsxd rdi,r12d
   14087a845:	48 8b d7             	mov    rdx,rdi
   14087a848:	e8 63 49 7f ff       	call   0x14006f1b0
   14087a84d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087a850:	0f bf 51 1c          	movsx  edx,WORD PTR [rcx+0x1c]
   14087a854:	85 d2                	test   edx,edx
   14087a856:	74 27                	je     0x14087a87f
   14087a858:	83 ea 01             	sub    edx,0x1
   14087a85b:	74 1b                	je     0x14087a878
   14087a85d:	83 ea 01             	sub    edx,0x1
   14087a860:	74 0f                	je     0x14087a871
   14087a862:	83 fa 01             	cmp    edx,0x1
   14087a865:	75 2b                	jne    0x14087a892
   14087a867:	ba 07 00 00 00       	mov    edx,0x7
   14087a86c:	45 33 c9             	xor    r9d,r9d
   14087a86f:	eb 16                	jmp    0x14087a887
   14087a871:	ba 06 00 00 00       	mov    edx,0x6
   14087a876:	eb 0c                	jmp    0x14087a884
   14087a878:	ba 07 00 00 00       	mov    edx,0x7
   14087a87d:	eb 05                	jmp    0x14087a884
   14087a87f:	ba 04 00 00 00       	mov    edx,0x4
   14087a884:	41 b1 01             	mov    r9b,0x1
   14087a887:	45 33 c0             	xor    r8d,r8d
   14087a88a:	49 8b ce             	mov    rcx,r14
   14087a88d:	e8 2e 08 84 ff       	call   0x1400bb0c0
   14087a892:	45 8d 47 01          	lea    r8d,[r15+0x1]
   14087a896:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087a89a:	48 8d 0d 3f 9a dc 01 	lea    rcx,[rip+0x1dc9a3f]        # 0x1426442e0
   14087a8a1:	e8 0a 08 84 ff       	call   0x1400bb0b0
   14087a8a6:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a8aa:	e8 71 4d 7f ff       	call   0x14006f620
   14087a8af:	90                   	nop
   14087a8b0:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   14087a8b5:	41 b1 01             	mov    r9b,0x1
   14087a8b8:	41 b8 01 00 00 00    	mov    r8d,0x1
   14087a8be:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087a8c2:	48 8b 0d 37 47 b6 01 	mov    rcx,QWORD PTR [rip+0x1b64737]        # 0x1423df000
   14087a8c9:	e8 d2 ea aa 00       	call   0x1413293a0
   14087a8ce:	8b de                	mov    ebx,esi
   14087a8d0:	41 2b df             	sub    ebx,r15d
   14087a8d3:	83 c3 01             	add    ebx,0x1
   14087a8d6:	79 02                	jns    0x14087a8da
   14087a8d8:	ff c3                	inc    ebx
   14087a8da:	d1 fb                	sar    ebx,1
   14087a8dc:	8d 53 ff             	lea    edx,[rbx-0x1]
   14087a8df:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a8e3:	e8 18 10 cb ff       	call   0x14052b900
   14087a8e8:	45 33 c9             	xor    r9d,r9d
   14087a8eb:	45 33 c0             	xor    r8d,r8d
   14087a8ee:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087a8f2:	48 8d 0d e7 99 dc 01 	lea    rcx,[rip+0x1dc99e7]        # 0x1426442e0
   14087a8f9:	e8 a2 c0 25 00       	call   0x140ad69a0
   14087a8fe:	48 8b d7             	mov    rdx,rdi
   14087a901:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
   14087a905:	e8 a6 48 7f ff       	call   0x14006f1b0
   14087a90a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087a90d:	8b 12                	mov    edx,DWORD PTR [rdx]
   14087a90f:	48 8d 0d 8a 46 b6 01 	lea    rcx,[rip+0x1b6468a]        # 0x1423defa0
   14087a916:	e8 e5 91 7f ff       	call   0x140073b00
   14087a91b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14087a91f:	48 85 c0             	test   rax,rax
   14087a922:	75 0e                	jne    0x14087a932
   14087a924:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a928:	e8 93 d4 7e ff       	call   0x140067dc0
   14087a92d:	e9 ca 08 00 00       	jmp    0x14087b1fc
   14087a932:	c6 44 24 20 01       	mov    BYTE PTR [rsp+0x20],0x1
   14087a937:	41 b1 01             	mov    r9b,0x1
   14087a93a:	41 b8 01 00 00 00    	mov    r8d,0x1
   14087a940:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087a944:	48 8b c8             	mov    rcx,rax
   14087a947:	e8 54 ea aa 00       	call   0x1413293a0
   14087a94c:	8d 53 ff             	lea    edx,[rbx-0x1]
   14087a94f:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a953:	e8 a8 0f cb ff       	call   0x14052b900
   14087a958:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087a95c:	e8 5f 49 7f ff       	call   0x14006f2c0
   14087a961:	44 8b 44 24 64       	mov    r8d,DWORD PTR [rsp+0x64]
   14087a966:	44 2b c0             	sub    r8d,eax
   14087a969:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087a96d:	48 8d 35 6c 99 dc 01 	lea    rsi,[rip+0x1dc996c]        # 0x1426442e0
   14087a974:	48 8b ce             	mov    rcx,rsi
   14087a977:	e8 34 07 84 ff       	call   0x1400bb0b0
   14087a97c:	45 33 c9             	xor    r9d,r9d
   14087a97f:	45 33 c0             	xor    r8d,r8d
   14087a982:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087a986:	48 8b ce             	mov    rcx,rsi
   14087a989:	e8 12 c0 25 00       	call   0x140ad69a0
   14087a98e:	83 c3 f9             	add    ebx,0xfffffff9
   14087a991:	41 03 df             	add    ebx,r15d
   14087a994:	89 5c 24 7c          	mov    DWORD PTR [rsp+0x7c],ebx
   14087a998:	48 8b d7             	mov    rdx,rdi
   14087a99b:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
   14087a99f:	48 8b ce             	mov    rcx,rsi
   14087a9a2:	e8 09 48 7f ff       	call   0x14006f1b0
   14087a9a7:	4c 8b 74 24 70       	mov    r14,QWORD PTR [rsp+0x70]
   14087a9ac:	49 8d 8e 28 01 00 00 	lea    rcx,[r14+0x128]
   14087a9b3:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087a9b6:	48 8b d7             	mov    rdx,rdi
   14087a9b9:	83 78 14 ff          	cmp    DWORD PTR [rax+0x14],0xffffffff
   14087a9bd:	74 26                	je     0x14087a9e5
   14087a9bf:	e8 ec 47 7f ff       	call   0x14006f1b0
   14087a9c4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087a9c7:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087a9cb:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087a9cf:	45 8b cd             	mov    r9d,r13d
   14087a9d2:	44 8b c3             	mov    r8d,ebx
   14087a9d5:	8b 52 14             	mov    edx,DWORD PTR [rdx+0x14]
   14087a9d8:	49 8b ce             	mov    rcx,r14
   14087a9db:	e8 50 73 02 00       	call   0x1408a1d30
   14087a9e0:	e9 e3 00 00 00       	jmp    0x14087aac8
   14087a9e5:	e8 c6 47 7f ff       	call   0x14006f1b0
   14087a9ea:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087a9ed:	49 8d 8e 28 01 00 00 	lea    rcx,[r14+0x128]
   14087a9f4:	83 7a 0c ff          	cmp    DWORD PTR [rdx+0xc],0xffffffff
   14087a9f8:	48 8b d7             	mov    rdx,rdi
   14087a9fb:	74 0d                	je     0x14087aa0a
   14087a9fd:	e8 ae 47 7f ff       	call   0x14006f1b0
   14087aa02:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087aa05:	8b 51 0c             	mov    edx,DWORD PTR [rcx+0xc]
   14087aa08:	eb 0b                	jmp    0x14087aa15
   14087aa0a:	e8 a1 47 7f ff       	call   0x14006f1b0
   14087aa0f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087aa12:	8b 51 04             	mov    edx,DWORD PTR [rcx+0x4]
   14087aa15:	48 8b 0d e4 45 b6 01 	mov    rcx,QWORD PTR [rip+0x1b645e4]        # 0x1423df000
   14087aa1c:	e8 ff 09 9f ff       	call   0x14026b420
   14087aa21:	83 f8 ff             	cmp    eax,0xffffffff
   14087aa24:	0f 84 9e 00 00 00    	je     0x14087aac8
   14087aa2a:	48 98                	cdqe
   14087aa2c:	45 8b f5             	mov    r14d,r13d
   14087aa2f:	4c 8d 24 40          	lea    r12,[rax+rax*2]
   14087aa33:	49 c1 e4 04          	shl    r12,0x4
   14087aa37:	48 8d 05 fa b8 dc 01 	lea    rax,[rip+0x1dcb8fa]        # 0x142646338
   14087aa3e:	4c 03 e0             	add    r12,rax
   14087aa41:	41 bd 03 00 00 00    	mov    r13d,0x3
   14087aa47:	44 8b fb             	mov    r15d,ebx
   14087aa4a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   14087aa50:	41 8b df             	mov    ebx,r15d
   14087aa53:	49 8b fc             	mov    rdi,r12
   14087aa56:	be 04 00 00 00       	mov    esi,0x4
   14087aa5b:	4c 8d 3d 7e 98 dc 01 	lea    r15,[rip+0x1dc987e]        # 0x1426442e0
   14087aa62:	44 8b c3             	mov    r8d,ebx
   14087aa65:	41 8b d6             	mov    edx,r14d
   14087aa68:	49 8b cf             	mov    rcx,r15
   14087aa6b:	e8 40 06 84 ff       	call   0x1400bb0b0
   14087aa70:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087aa72:	49 8b cf             	mov    rcx,r15
   14087aa75:	e8 96 d0 25 00       	call   0x140ad7b10
   14087aa7a:	33 d2                	xor    edx,edx
   14087aa7c:	48 8d 0d dd cb b4 01 	lea    rcx,[rip+0x1b4cbdd]        # 0x1423c7660
   14087aa83:	e8 98 74 7f ff       	call   0x140071f20
   14087aa88:	84 c0                	test   al,al
   14087aa8a:	74 0d                	je     0x14087aa99
   14087aa8c:	41 b0 01             	mov    r8b,0x1
   14087aa8f:	33 d2                	xor    edx,edx
   14087aa91:	49 8b cf             	mov    rcx,r15
   14087aa94:	e8 87 06 84 ff       	call   0x1400bb120
   14087aa99:	ff c3                	inc    ebx
   14087aa9b:	48 83 c7 0c          	add    rdi,0xc
   14087aa9f:	48 83 ee 01          	sub    rsi,0x1
   14087aaa3:	75 bd                	jne    0x14087aa62
   14087aaa5:	41 ff c6             	inc    r14d
   14087aaa8:	49 83 c4 04          	add    r12,0x4
   14087aaac:	49 83 ed 01          	sub    r13,0x1
   14087aab0:	44 8b 7c 24 7c       	mov    r15d,DWORD PTR [rsp+0x7c]
   14087aab5:	75 99                	jne    0x14087aa50
   14087aab7:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087aabb:	44 8b 65 88          	mov    r12d,DWORD PTR [rbp-0x78]
   14087aabf:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087aac4:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
   14087aac8:	8b 7c 24 64          	mov    edi,DWORD PTR [rsp+0x64]
   14087aacc:	8b c7                	mov    eax,edi
   14087aace:	41 2b c7             	sub    eax,r15d
   14087aad1:	83 c0 01             	add    eax,0x1
   14087aad4:	79 02                	jns    0x14087aad8
   14087aad6:	ff c0                	inc    eax
   14087aad8:	d1 f8                	sar    eax,1
   14087aada:	8d 58 fd             	lea    ebx,[rax-0x3]
   14087aadd:	41 03 df             	add    ebx,r15d
   14087aae0:	44 8b c3             	mov    r8d,ebx
   14087aae3:	41 8b d5             	mov    edx,r13d
   14087aae6:	4c 8d 35 f3 97 dc 01 	lea    r14,[rip+0x1dc97f3]        # 0x1426442e0
   14087aaed:	49 8b ce             	mov    rcx,r14
   14087aaf0:	e8 bb 05 84 ff       	call   0x1400bb0b0
   14087aaf5:	49 63 d4             	movsxd rdx,r12d
   14087aaf8:	48 8b ce             	mov    rcx,rsi
   14087aafb:	e8 b0 46 7f ff       	call   0x14006f1b0
   14087ab00:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab03:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087ab07:	75 0e                	jne    0x14087ab17
   14087ab09:	8b 15 71 41 dd 01    	mov    edx,DWORD PTR [rip+0x1dd4171]        # 0x14264ec80
   14087ab0f:	49 8b ce             	mov    rcx,r14
   14087ab12:	e8 f9 cf 25 00       	call   0x140ad7b10
   14087ab17:	49 63 d4             	movsxd rdx,r12d
   14087ab1a:	48 8b ce             	mov    rcx,rsi
   14087ab1d:	e8 8e 46 7f ff       	call   0x14006f1b0
   14087ab22:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab25:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087ab29:	75 0e                	jne    0x14087ab39
   14087ab2b:	8b 15 5b 41 dd 01    	mov    edx,DWORD PTR [rip+0x1dd415b]        # 0x14264ec8c
   14087ab31:	49 8b ce             	mov    rcx,r14
   14087ab34:	e8 d7 cf 25 00       	call   0x140ad7b10
   14087ab39:	49 63 d4             	movsxd rdx,r12d
   14087ab3c:	48 8b ce             	mov    rcx,rsi
   14087ab3f:	e8 6c 46 7f ff       	call   0x14006f1b0
   14087ab44:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab47:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087ab4b:	75 0e                	jne    0x14087ab5b
   14087ab4d:	8b 15 45 41 dd 01    	mov    edx,DWORD PTR [rip+0x1dd4145]        # 0x14264ec98
   14087ab53:	49 8b ce             	mov    rcx,r14
   14087ab56:	e8 b5 cf 25 00       	call   0x140ad7b10
   14087ab5b:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087ab5f:	44 8b c3             	mov    r8d,ebx
   14087ab62:	49 8b ce             	mov    rcx,r14
   14087ab65:	e8 46 05 84 ff       	call   0x1400bb0b0
   14087ab6a:	49 63 d4             	movsxd rdx,r12d
   14087ab6d:	48 8b ce             	mov    rcx,rsi
   14087ab70:	e8 3b 46 7f ff       	call   0x14006f1b0
   14087ab75:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab78:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087ab7c:	75 0e                	jne    0x14087ab8c
   14087ab7e:	8b 15 00 41 dd 01    	mov    edx,DWORD PTR [rip+0x1dd4100]        # 0x14264ec84
   14087ab84:	49 8b ce             	mov    rcx,r14
   14087ab87:	e8 84 cf 25 00       	call   0x140ad7b10
   14087ab8c:	49 63 d4             	movsxd rdx,r12d
   14087ab8f:	48 8b ce             	mov    rcx,rsi
   14087ab92:	e8 19 46 7f ff       	call   0x14006f1b0
   14087ab97:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ab9a:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087ab9e:	75 0e                	jne    0x14087abae
   14087aba0:	8b 15 ea 40 dd 01    	mov    edx,DWORD PTR [rip+0x1dd40ea]        # 0x14264ec90
   14087aba6:	49 8b ce             	mov    rcx,r14
   14087aba9:	e8 62 cf 25 00       	call   0x140ad7b10
   14087abae:	49 63 d4             	movsxd rdx,r12d
   14087abb1:	48 8b ce             	mov    rcx,rsi
   14087abb4:	e8 f7 45 7f ff       	call   0x14006f1b0
   14087abb9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087abbc:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087abc0:	75 0e                	jne    0x14087abd0
   14087abc2:	8b 15 d4 40 dd 01    	mov    edx,DWORD PTR [rip+0x1dd40d4]        # 0x14264ec9c
   14087abc8:	49 8b ce             	mov    rcx,r14
   14087abcb:	e8 40 cf 25 00       	call   0x140ad7b10
   14087abd0:	41 8d 55 02          	lea    edx,[r13+0x2]
   14087abd4:	44 8b c3             	mov    r8d,ebx
   14087abd7:	49 8b ce             	mov    rcx,r14
   14087abda:	e8 d1 04 84 ff       	call   0x1400bb0b0
   14087abdf:	49 63 d4             	movsxd rdx,r12d
   14087abe2:	48 8b ce             	mov    rcx,rsi
   14087abe5:	e8 c6 45 7f ff       	call   0x14006f1b0
   14087abea:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087abed:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087abf1:	75 0e                	jne    0x14087ac01
   14087abf3:	8b 15 8f 40 dd 01    	mov    edx,DWORD PTR [rip+0x1dd408f]        # 0x14264ec88
   14087abf9:	49 8b ce             	mov    rcx,r14
   14087abfc:	e8 0f cf 25 00       	call   0x140ad7b10
   14087ac01:	49 63 d4             	movsxd rdx,r12d
   14087ac04:	48 8b ce             	mov    rcx,rsi
   14087ac07:	e8 a4 45 7f ff       	call   0x14006f1b0
   14087ac0c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ac0f:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087ac13:	75 0e                	jne    0x14087ac23
   14087ac15:	8b 15 79 40 dd 01    	mov    edx,DWORD PTR [rip+0x1dd4079]        # 0x14264ec94
   14087ac1b:	49 8b ce             	mov    rcx,r14
   14087ac1e:	e8 ed ce 25 00       	call   0x140ad7b10
   14087ac23:	49 63 d4             	movsxd rdx,r12d
   14087ac26:	48 8b ce             	mov    rcx,rsi
   14087ac29:	e8 82 45 7f ff       	call   0x14006f1b0
   14087ac2e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ac31:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087ac35:	75 0e                	jne    0x14087ac45
   14087ac37:	8b 15 63 40 dd 01    	mov    edx,DWORD PTR [rip+0x1dd4063]        # 0x14264eca0
   14087ac3d:	49 8b ce             	mov    rcx,r14
   14087ac40:	e8 cb ce 25 00       	call   0x140ad7b10
   14087ac45:	49 63 d4             	movsxd rdx,r12d
   14087ac48:	48 8b ce             	mov    rcx,rsi
   14087ac4b:	e8 60 45 7f ff       	call   0x14006f1b0
   14087ac50:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ac53:	0f bf 51 1c          	movsx  edx,WORD PTR [rcx+0x1c]
   14087ac57:	85 d2                	test   edx,edx
   14087ac59:	74 2a                	je     0x14087ac85
   14087ac5b:	83 ea 01             	sub    edx,0x1
   14087ac5e:	74 1c                	je     0x14087ac7c
   14087ac60:	83 ea 01             	sub    edx,0x1
   14087ac63:	74 0e                	je     0x14087ac73
   14087ac65:	83 fa 01             	cmp    edx,0x1
   14087ac68:	75 12                	jne    0x14087ac7c
   14087ac6a:	4c 8d 25 67 22 dd 01 	lea    r12,[rip+0x1dd2267]        # 0x14264ced8
   14087ac71:	eb 19                	jmp    0x14087ac8c
   14087ac73:	4c 8d 25 2e 22 dd 01 	lea    r12,[rip+0x1dd222e]        # 0x14264cea8
   14087ac7a:	eb 10                	jmp    0x14087ac8c
   14087ac7c:	4c 8d 25 f5 21 dd 01 	lea    r12,[rip+0x1dd21f5]        # 0x14264ce78
   14087ac83:	eb 07                	jmp    0x14087ac8c
   14087ac85:	4c 8d 25 fc 23 dd 01 	lea    r12,[rip+0x1dd23fc]        # 0x14264d088
   14087ac8c:	8b c7                	mov    eax,edi
   14087ac8e:	41 2b c7             	sub    eax,r15d
   14087ac91:	83 c0 01             	add    eax,0x1
   14087ac94:	79 02                	jns    0x14087ac98
   14087ac96:	ff c0                	inc    eax
   14087ac98:	d1 f8                	sar    eax,1
   14087ac9a:	41 8d 4f fe          	lea    ecx,[r15-0x2]
   14087ac9e:	03 c8                	add    ecx,eax
   14087aca0:	89 4c 24 7c          	mov    DWORD PTR [rsp+0x7c],ecx
   14087aca4:	45 8b f5             	mov    r14d,r13d
   14087aca7:	41 bd 03 00 00 00    	mov    r13d,0x3
   14087acad:	44 8b f9             	mov    r15d,ecx
   14087acb0:	41 8b df             	mov    ebx,r15d
   14087acb3:	49 8b fc             	mov    rdi,r12
   14087acb6:	be 04 00 00 00       	mov    esi,0x4
   14087acbb:	4c 8d 3d 1e 96 dc 01 	lea    r15,[rip+0x1dc961e]        # 0x1426442e0
   14087acc2:	44 8b c3             	mov    r8d,ebx
   14087acc5:	41 8b d6             	mov    edx,r14d
   14087acc8:	49 8b cf             	mov    rcx,r15
   14087accb:	e8 e0 03 84 ff       	call   0x1400bb0b0
   14087acd0:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087acd2:	49 8b cf             	mov    rcx,r15
   14087acd5:	e8 36 ce 25 00       	call   0x140ad7b10
   14087acda:	33 d2                	xor    edx,edx
   14087acdc:	48 8d 0d 7d c9 b4 01 	lea    rcx,[rip+0x1b4c97d]        # 0x1423c7660
   14087ace3:	e8 38 72 7f ff       	call   0x140071f20
   14087ace8:	84 c0                	test   al,al
   14087acea:	74 0d                	je     0x14087acf9
   14087acec:	41 b0 01             	mov    r8b,0x1
   14087acef:	33 d2                	xor    edx,edx
   14087acf1:	49 8b cf             	mov    rcx,r15
   14087acf4:	e8 27 04 84 ff       	call   0x1400bb120
   14087acf9:	ff c3                	inc    ebx
   14087acfb:	48 83 c7 0c          	add    rdi,0xc
   14087acff:	48 83 ee 01          	sub    rsi,0x1
   14087ad03:	75 bd                	jne    0x14087acc2
   14087ad05:	41 ff c6             	inc    r14d
   14087ad08:	49 83 c4 04          	add    r12,0x4
   14087ad0c:	49 83 ed 01          	sub    r13,0x1
   14087ad10:	44 8b 7c 24 7c       	mov    r15d,DWORD PTR [rsp+0x7c]
   14087ad15:	75 99                	jne    0x14087acb0
   14087ad17:	44 8b 74 24 64       	mov    r14d,DWORD PTR [rsp+0x64]
   14087ad1c:	41 8b c6             	mov    eax,r14d
   14087ad1f:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087ad23:	41 2b c7             	sub    eax,r15d
   14087ad26:	83 c0 01             	add    eax,0x1
   14087ad29:	79 02                	jns    0x14087ad2d
   14087ad2b:	ff c0                	inc    eax
   14087ad2d:	d1 f8                	sar    eax,1
   14087ad2f:	41 8d 5f 02          	lea    ebx,[r15+0x2]
   14087ad33:	03 d8                	add    ebx,eax
   14087ad35:	44 8b c3             	mov    r8d,ebx
   14087ad38:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087ad3d:	41 8b d5             	mov    edx,r13d
   14087ad40:	48 8d 3d 99 95 dc 01 	lea    rdi,[rip+0x1dc9599]        # 0x1426442e0
   14087ad47:	48 8b cf             	mov    rcx,rdi
   14087ad4a:	e8 61 03 84 ff       	call   0x1400bb0b0
   14087ad4f:	4c 63 65 88          	movsxd r12,DWORD PTR [rbp-0x78]
   14087ad53:	49 8b d4             	mov    rdx,r12
   14087ad56:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
   14087ad5a:	48 8b ce             	mov    rcx,rsi
   14087ad5d:	e8 4e 44 7f ff       	call   0x14006f1b0
   14087ad62:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ad65:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087ad69:	75 0e                	jne    0x14087ad79
   14087ad6b:	8b 15 0f 3f dd 01    	mov    edx,DWORD PTR [rip+0x1dd3f0f]        # 0x14264ec80
   14087ad71:	48 8b cf             	mov    rcx,rdi
   14087ad74:	e8 97 cd 25 00       	call   0x140ad7b10
   14087ad79:	49 8b d4             	mov    rdx,r12
   14087ad7c:	48 8b ce             	mov    rcx,rsi
   14087ad7f:	e8 2c 44 7f ff       	call   0x14006f1b0
   14087ad84:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ad87:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087ad8b:	75 0e                	jne    0x14087ad9b
   14087ad8d:	8b 15 f9 3e dd 01    	mov    edx,DWORD PTR [rip+0x1dd3ef9]        # 0x14264ec8c
   14087ad93:	48 8b cf             	mov    rcx,rdi
   14087ad96:	e8 75 cd 25 00       	call   0x140ad7b10
   14087ad9b:	49 8b d4             	mov    rdx,r12
   14087ad9e:	48 8b ce             	mov    rcx,rsi
   14087ada1:	e8 0a 44 7f ff       	call   0x14006f1b0
   14087ada6:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ada9:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087adad:	75 0e                	jne    0x14087adbd
   14087adaf:	8b 15 e3 3e dd 01    	mov    edx,DWORD PTR [rip+0x1dd3ee3]        # 0x14264ec98
   14087adb5:	48 8b cf             	mov    rcx,rdi
   14087adb8:	e8 53 cd 25 00       	call   0x140ad7b10
   14087adbd:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087adc1:	44 8b c3             	mov    r8d,ebx
   14087adc4:	48 8b cf             	mov    rcx,rdi
   14087adc7:	e8 e4 02 84 ff       	call   0x1400bb0b0
   14087adcc:	49 8b d4             	mov    rdx,r12
   14087adcf:	48 8b ce             	mov    rcx,rsi
   14087add2:	e8 d9 43 7f ff       	call   0x14006f1b0
   14087add7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087adda:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087adde:	75 0e                	jne    0x14087adee
   14087ade0:	8b 15 9e 3e dd 01    	mov    edx,DWORD PTR [rip+0x1dd3e9e]        # 0x14264ec84
   14087ade6:	48 8b cf             	mov    rcx,rdi
   14087ade9:	e8 22 cd 25 00       	call   0x140ad7b10
   14087adee:	49 8b d4             	mov    rdx,r12
   14087adf1:	48 8b ce             	mov    rcx,rsi
   14087adf4:	e8 b7 43 7f ff       	call   0x14006f1b0
   14087adf9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087adfc:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087ae00:	75 0e                	jne    0x14087ae10
   14087ae02:	8b 15 88 3e dd 01    	mov    edx,DWORD PTR [rip+0x1dd3e88]        # 0x14264ec90
   14087ae08:	48 8b cf             	mov    rcx,rdi
   14087ae0b:	e8 00 cd 25 00       	call   0x140ad7b10
   14087ae10:	49 8b d4             	mov    rdx,r12
   14087ae13:	48 8b ce             	mov    rcx,rsi
   14087ae16:	e8 95 43 7f ff       	call   0x14006f1b0
   14087ae1b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ae1e:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087ae22:	75 0e                	jne    0x14087ae32
   14087ae24:	8b 15 72 3e dd 01    	mov    edx,DWORD PTR [rip+0x1dd3e72]        # 0x14264ec9c
   14087ae2a:	48 8b cf             	mov    rcx,rdi
   14087ae2d:	e8 de cc 25 00       	call   0x140ad7b10
   14087ae32:	41 8d 55 02          	lea    edx,[r13+0x2]
   14087ae36:	44 8b c3             	mov    r8d,ebx
   14087ae39:	48 8b cf             	mov    rcx,rdi
   14087ae3c:	e8 6f 02 84 ff       	call   0x1400bb0b0
   14087ae41:	49 8b d4             	mov    rdx,r12
   14087ae44:	48 8b ce             	mov    rcx,rsi
   14087ae47:	e8 64 43 7f ff       	call   0x14006f1b0
   14087ae4c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ae4f:	80 79 1e 01          	cmp    BYTE PTR [rcx+0x1e],0x1
   14087ae53:	75 0e                	jne    0x14087ae63
   14087ae55:	8b 15 2d 3e dd 01    	mov    edx,DWORD PTR [rip+0x1dd3e2d]        # 0x14264ec88
   14087ae5b:	48 8b cf             	mov    rcx,rdi
   14087ae5e:	e8 ad cc 25 00       	call   0x140ad7b10
   14087ae63:	49 8b d4             	mov    rdx,r12
   14087ae66:	48 8b ce             	mov    rcx,rsi
   14087ae69:	e8 42 43 7f ff       	call   0x14006f1b0
   14087ae6e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ae71:	80 79 1e 00          	cmp    BYTE PTR [rcx+0x1e],0x0
   14087ae75:	75 0e                	jne    0x14087ae85
   14087ae77:	8b 15 17 3e dd 01    	mov    edx,DWORD PTR [rip+0x1dd3e17]        # 0x14264ec94
   14087ae7d:	48 8b cf             	mov    rcx,rdi
   14087ae80:	e8 8b cc 25 00       	call   0x140ad7b10
   14087ae85:	49 8b d4             	mov    rdx,r12
   14087ae88:	48 8b ce             	mov    rcx,rsi
   14087ae8b:	e8 20 43 7f ff       	call   0x14006f1b0
   14087ae90:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087ae93:	80 79 1e ff          	cmp    BYTE PTR [rcx+0x1e],0xff
   14087ae97:	75 0e                	jne    0x14087aea7
   14087ae99:	8b 15 01 3e dd 01    	mov    edx,DWORD PTR [rip+0x1dd3e01]        # 0x14264eca0
   14087ae9f:	48 8b cf             	mov    rcx,rdi
   14087aea2:	e8 69 cc 25 00       	call   0x140ad7b10
   14087aea7:	41 8b c6             	mov    eax,r14d
   14087aeaa:	41 2b c7             	sub    eax,r15d
   14087aead:	83 c0 01             	add    eax,0x1
   14087aeb0:	79 02                	jns    0x14087aeb4
   14087aeb2:	ff c0                	inc    eax
   14087aeb4:	d1 f8                	sar    eax,1
   14087aeb6:	41 8d 5f 03          	lea    ebx,[r15+0x3]
   14087aeba:	03 d8                	add    ebx,eax
   14087aebc:	89 5c 24 7c          	mov    DWORD PTR [rsp+0x7c],ebx
   14087aec0:	49 8b d4             	mov    rdx,r12
   14087aec3:	48 8b ce             	mov    rcx,rsi
   14087aec6:	e8 e5 42 7f ff       	call   0x14006f1b0
   14087aecb:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14087aed0:	48 8d 8f 28 01 00 00 	lea    rcx,[rdi+0x128]
   14087aed7:	49 8b d4             	mov    rdx,r12
   14087aeda:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087aedd:	83 78 18 ff          	cmp    DWORD PTR [rax+0x18],0xffffffff
   14087aee1:	74 26                	je     0x14087af09
   14087aee3:	e8 c8 42 7f ff       	call   0x14006f1b0
   14087aee8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087aeeb:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087aeef:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087aef3:	45 8b cd             	mov    r9d,r13d
   14087aef6:	44 8b c3             	mov    r8d,ebx
   14087aef9:	8b 52 18             	mov    edx,DWORD PTR [rdx+0x18]
   14087aefc:	48 8b cf             	mov    rcx,rdi
   14087aeff:	e8 2c 6e 02 00       	call   0x1408a1d30
   14087af04:	e9 e9 00 00 00       	jmp    0x14087aff2
   14087af09:	e8 a2 42 7f ff       	call   0x14006f1b0
   14087af0e:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087af11:	49 8b d4             	mov    rdx,r12
   14087af14:	48 8d 8f 28 01 00 00 	lea    rcx,[rdi+0x128]
   14087af1b:	41 83 78 10 ff       	cmp    DWORD PTR [r8+0x10],0xffffffff
   14087af20:	74 0d                	je     0x14087af2f
   14087af22:	e8 89 42 7f ff       	call   0x14006f1b0
   14087af27:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087af2a:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
   14087af2d:	eb 0b                	jmp    0x14087af3a
   14087af2f:	e8 7c 42 7f ff       	call   0x14006f1b0
   14087af34:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087af37:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
   14087af3a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   14087af3e:	e8 dd 04 9f ff       	call   0x14026b420
   14087af43:	83 f8 ff             	cmp    eax,0xffffffff
   14087af46:	0f 84 a6 00 00 00    	je     0x14087aff2
   14087af4c:	48 98                	cdqe
   14087af4e:	45 8b f5             	mov    r14d,r13d
   14087af51:	4c 8d 24 40          	lea    r12,[rax+rax*2]
   14087af55:	49 c1 e4 04          	shl    r12,0x4
   14087af59:	48 8d 05 d8 b3 dc 01 	lea    rax,[rip+0x1dcb3d8]        # 0x142646338
   14087af60:	4c 03 e0             	add    r12,rax
   14087af63:	41 bd 03 00 00 00    	mov    r13d,0x3
   14087af69:	44 8b fb             	mov    r15d,ebx
   14087af6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087af70:	41 8b df             	mov    ebx,r15d
   14087af73:	49 8b fc             	mov    rdi,r12
   14087af76:	be 04 00 00 00       	mov    esi,0x4
   14087af7b:	4c 8d 3d 5e 93 dc 01 	lea    r15,[rip+0x1dc935e]        # 0x1426442e0
   14087af82:	44 8b c3             	mov    r8d,ebx
   14087af85:	41 8b d6             	mov    edx,r14d
   14087af88:	49 8b cf             	mov    rcx,r15
   14087af8b:	e8 20 01 84 ff       	call   0x1400bb0b0
   14087af90:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087af92:	49 8b cf             	mov    rcx,r15
   14087af95:	e8 76 cb 25 00       	call   0x140ad7b10
   14087af9a:	33 d2                	xor    edx,edx
   14087af9c:	48 8d 0d bd c6 b4 01 	lea    rcx,[rip+0x1b4c6bd]        # 0x1423c7660
   14087afa3:	e8 78 6f 7f ff       	call   0x140071f20
   14087afa8:	84 c0                	test   al,al
   14087afaa:	74 0d                	je     0x14087afb9
   14087afac:	41 b0 01             	mov    r8b,0x1
   14087afaf:	33 d2                	xor    edx,edx
   14087afb1:	49 8b cf             	mov    rcx,r15
   14087afb4:	e8 67 01 84 ff       	call   0x1400bb120
   14087afb9:	ff c3                	inc    ebx
   14087afbb:	48 83 c7 0c          	add    rdi,0xc
   14087afbf:	48 83 ee 01          	sub    rsi,0x1
   14087afc3:	75 bd                	jne    0x14087af82
   14087afc5:	41 ff c6             	inc    r14d
   14087afc8:	49 83 c4 04          	add    r12,0x4
   14087afcc:	49 83 ed 01          	sub    r13,0x1
   14087afd0:	44 8b 7c 24 7c       	mov    r15d,DWORD PTR [rsp+0x7c]
   14087afd5:	75 99                	jne    0x14087af70
   14087afd7:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087afdb:	44 8b 65 88          	mov    r12d,DWORD PTR [rbp-0x78]
   14087afdf:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087afe4:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
   14087afe8:	44 8b 74 24 64       	mov    r14d,DWORD PTR [rsp+0x64]
   14087afed:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14087aff2:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087aff6:	e8 25 46 7f ff       	call   0x14006f620
   14087affb:	90                   	nop
   14087affc:	49 63 d4             	movsxd rdx,r12d
   14087afff:	48 8b ce             	mov    rcx,rsi
   14087b002:	e8 a9 41 7f ff       	call   0x14006f1b0
   14087b007:	48 8d 8f 28 01 00 00 	lea    rcx,[rdi+0x128]
   14087b00e:	49 63 d4             	movsxd rdx,r12d
   14087b011:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087b014:	83 78 14 ff          	cmp    DWORD PTR [rax+0x14],0xffffffff
   14087b018:	74 35                	je     0x14087b04f
   14087b01a:	e8 91 41 7f ff       	call   0x14006f1b0
   14087b01f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087b022:	8b 52 14             	mov    edx,DWORD PTR [rdx+0x14]
   14087b025:	48 8d 0d 14 43 b6 01 	lea    rcx,[rip+0x1b64314]        # 0x1423df340
   14087b02c:	e8 3f 76 7f ff       	call   0x140072670
   14087b031:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14087b036:	48 85 c0             	test   rax,rax
   14087b039:	74 73                	je     0x14087b0ae
   14087b03b:	44 8b cb             	mov    r9d,ebx
   14087b03e:	45 33 c0             	xor    r8d,r8d
   14087b041:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087b045:	48 8b c8             	mov    rcx,rax
   14087b048:	e8 43 74 3e 00       	call   0x140c62490
   14087b04d:	eb 5f                	jmp    0x14087b0ae
   14087b04f:	48 8d 9f 28 01 00 00 	lea    rbx,[rdi+0x128]
   14087b056:	49 63 fc             	movsxd rdi,r12d
   14087b059:	e8 52 41 7f ff       	call   0x14006f1b0
   14087b05e:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087b061:	48 8b d7             	mov    rdx,rdi
   14087b064:	48 8b cb             	mov    rcx,rbx
   14087b067:	41 83 78 0c ff       	cmp    DWORD PTR [r8+0xc],0xffffffff
   14087b06c:	74 0f                	je     0x14087b07d
   14087b06e:	e8 3d 41 7f ff       	call   0x14006f1b0
   14087b073:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087b076:	44 0f b7 41 0c       	movzx  r8d,WORD PTR [rcx+0xc]
   14087b07b:	eb 0d                	jmp    0x14087b08a
   14087b07d:	e8 2e 41 7f ff       	call   0x14006f1b0
   14087b082:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14087b085:	44 0f b7 41 04       	movzx  r8d,WORD PTR [rcx+0x4]
   14087b08a:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087b091:	45 33 c9             	xor    r9d,r9d
   14087b094:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087b098:	48 8b 0d 61 3f b6 01 	mov    rcx,QWORD PTR [rip+0x1b63f61]        # 0x1423df000
   14087b09f:	e8 9c 44 ab 00       	call   0x14132f540
   14087b0a4:	bb ff ff ff ff       	mov    ebx,0xffffffff
   14087b0a9:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
   14087b0ae:	48 8d 4d 78          	lea    rcx,[rbp+0x78]
   14087b0b2:	e8 69 45 7f ff       	call   0x14006f620
   14087b0b7:	90                   	nop
   14087b0b8:	49 63 d4             	movsxd rdx,r12d
   14087b0bb:	48 8b ce             	mov    rcx,rsi
   14087b0be:	e8 ed 40 7f ff       	call   0x14006f1b0
   14087b0c3:	48 8d 8f 28 01 00 00 	lea    rcx,[rdi+0x128]
   14087b0ca:	49 63 d4             	movsxd rdx,r12d
   14087b0cd:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087b0d0:	83 78 18 ff          	cmp    DWORD PTR [rax+0x18],0xffffffff
   14087b0d4:	74 30                	je     0x14087b106
   14087b0d6:	e8 d5 40 7f ff       	call   0x14006f1b0
   14087b0db:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14087b0de:	8b 52 18             	mov    edx,DWORD PTR [rdx+0x18]
   14087b0e1:	48 8d 0d 58 42 b6 01 	lea    rcx,[rip+0x1b64258]        # 0x1423df340
   14087b0e8:	e8 83 75 7f ff       	call   0x140072670
   14087b0ed:	48 85 c0             	test   rax,rax
   14087b0f0:	74 66                	je     0x14087b158
   14087b0f2:	44 8b cb             	mov    r9d,ebx
   14087b0f5:	45 33 c0             	xor    r8d,r8d
   14087b0f8:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087b0fc:	48 8b c8             	mov    rcx,rax
   14087b0ff:	e8 8c 73 3e 00       	call   0x140c62490
   14087b104:	eb 52                	jmp    0x14087b158
   14087b106:	48 8d 9f 28 01 00 00 	lea    rbx,[rdi+0x128]
   14087b10d:	49 63 fc             	movsxd rdi,r12d
   14087b110:	e8 9b 40 7f ff       	call   0x14006f1b0
   14087b115:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087b118:	48 8b d7             	mov    rdx,rdi
   14087b11b:	48 8b cb             	mov    rcx,rbx
   14087b11e:	41 83 78 10 ff       	cmp    DWORD PTR [r8+0x10],0xffffffff
   14087b123:	74 0f                	je     0x14087b134
   14087b125:	e8 86 40 7f ff       	call   0x14006f1b0
   14087b12a:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087b12d:	45 0f b7 40 10       	movzx  r8d,WORD PTR [r8+0x10]
   14087b132:	eb 0d                	jmp    0x14087b141
   14087b134:	e8 77 40 7f ff       	call   0x14006f1b0
   14087b139:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14087b13c:	45 0f b7 40 08       	movzx  r8d,WORD PTR [r8+0x8]
   14087b141:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087b148:	45 33 c9             	xor    r9d,r9d
   14087b14b:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087b14f:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   14087b153:	e8 e8 43 ab 00       	call   0x14132f540
   14087b158:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b15c:	e8 5f 41 7f ff       	call   0x14006f2c0
   14087b161:	48 8b c8             	mov    rcx,rax
   14087b164:	41 8b c6             	mov    eax,r14d
   14087b167:	41 2b c7             	sub    eax,r15d
   14087b16a:	ff c0                	inc    eax
   14087b16c:	99                   	cdq
   14087b16d:	2b c2                	sub    eax,edx
   14087b16f:	d1 f8                	sar    eax,1
   14087b171:	45 8d 04 07          	lea    r8d,[r15+rax*1]
   14087b175:	44 2b c1             	sub    r8d,ecx
   14087b178:	41 83 e8 07          	sub    r8d,0x7
   14087b17c:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087b180:	48 8d 1d 59 91 dc 01 	lea    rbx,[rip+0x1dc9159]        # 0x1426442e0
   14087b187:	48 8b cb             	mov    rcx,rbx
   14087b18a:	e8 21 ff 83 ff       	call   0x1400bb0b0
   14087b18f:	45 33 c9             	xor    r9d,r9d
   14087b192:	45 33 c0             	xor    r8d,r8d
   14087b195:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087b199:	48 8b cb             	mov    rcx,rbx
   14087b19c:	e8 ff b7 25 00       	call   0x140ad69a0
   14087b1a1:	41 8b c6             	mov    eax,r14d
   14087b1a4:	41 2b c7             	sub    eax,r15d
   14087b1a7:	83 c0 01             	add    eax,0x1
   14087b1aa:	79 02                	jns    0x14087b1ae
   14087b1ac:	ff c0                	inc    eax
   14087b1ae:	d1 f8                	sar    eax,1
   14087b1b0:	44 8d 40 07          	lea    r8d,[rax+0x7]
   14087b1b4:	45 03 c7             	add    r8d,r15d
   14087b1b7:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087b1bb:	48 8b cb             	mov    rcx,rbx
   14087b1be:	e8 ed fe 83 ff       	call   0x1400bb0b0
   14087b1c3:	45 33 c9             	xor    r9d,r9d
   14087b1c6:	45 33 c0             	xor    r8d,r8d
   14087b1c9:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087b1cd:	48 8b cb             	mov    rcx,rbx
   14087b1d0:	e8 cb b7 25 00       	call   0x140ad69a0
   14087b1d5:	90                   	nop
   14087b1d6:	48 8d 4d 78          	lea    rcx,[rbp+0x78]
   14087b1da:	e8 e1 cb 7e ff       	call   0x140067dc0
   14087b1df:	90                   	nop
   14087b1e0:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b1e4:	e8 d7 cb 7e ff       	call   0x140067dc0
   14087b1e9:	90                   	nop
   14087b1ea:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087b1ee:	e8 cd cb 7e ff       	call   0x140067dc0
   14087b1f3:	41 83 c5 03          	add    r13d,0x3
   14087b1f7:	44 89 6c 24 60       	mov    DWORD PTR [rsp+0x60],r13d
   14087b1fc:	41 ff c4             	inc    r12d
   14087b1ff:	44 89 65 88          	mov    DWORD PTR [rbp-0x78],r12d
   14087b203:	44 3b 65 84          	cmp    r12d,DWORD PTR [rbp-0x7c]
   14087b207:	8b 74 24 64          	mov    esi,DWORD PTR [rsp+0x64]
   14087b20b:	4c 8b 75 f0          	mov    r14,QWORD PTR [rbp-0x10]
   14087b20f:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087b214:	0f 8c d6 f2 ff ff    	jl     0x14087a4f0
   14087b21a:	8b 55 98             	mov    edx,DWORD PTR [rbp-0x68]
   14087b21d:	44 8b 4d 8c          	mov    r9d,DWORD PTR [rbp-0x74]
   14087b221:	44 3b f2             	cmp    r14d,edx
   14087b224:	7e 67                	jle    0x14087b28d
   14087b226:	41 8d 79 01          	lea    edi,[r9+0x1]
   14087b22a:	41 8d 1c 51          	lea    ebx,[r9+rdx*2]
   14087b22e:	83 c2 fe             	add    edx,0xfffffffe
   14087b231:	03 da                	add    ebx,edx
   14087b233:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b237:	e8 b4 00 84 ff       	call   0x1400bb2f0
   14087b23c:	45 8d 4e ff          	lea    r9d,[r14-0x1]
   14087b240:	89 5c 24 30          	mov    DWORD PTR [rsp+0x30],ebx
   14087b244:	89 7c 24 28          	mov    DWORD PTR [rsp+0x28],edi
   14087b248:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
   14087b24b:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087b24f:	45 33 c0             	xor    r8d,r8d
   14087b252:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087b257:	8b 93 58 01 00 00    	mov    edx,DWORD PTR [rbx+0x158]
   14087b25d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b261:	e8 aa 00 84 ff       	call   0x1400bb310
   14087b266:	44 8d 4e 01          	lea    r9d,[rsi+0x1]
   14087b26a:	c7 44 24 28 00 00 00 00 	mov    DWORD PTR [rsp+0x28],0x0
   14087b272:	0f b6 83 5c 01 00 00 	movzx  eax,BYTE PTR [rbx+0x15c]
   14087b279:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   14087b27d:	44 8b 45 b4          	mov    r8d,DWORD PTR [rbp-0x4c]
   14087b281:	8b 55 b8             	mov    edx,DWORD PTR [rbp-0x48]
   14087b284:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087b288:	e8 b3 f1 b8 00       	call   0x14140a440
   14087b28d:	4c 8d b3 68 01 00 00 	lea    r14,[rbx+0x168]
   14087b294:	4c 89 75 a8          	mov    QWORD PTR [rbp-0x58],r14
   14087b298:	49 8b ce             	mov    rcx,r14
   14087b29b:	e8 60 40 7f ff       	call   0x14006f300
   14087b2a0:	48 8b f8             	mov    rdi,rax
   14087b2a3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14087b2a7:	44 8b 64 24 68       	mov    r12d,DWORD PTR [rsp+0x68]
   14087b2ac:	41 ff c4             	inc    r12d
   14087b2af:	44 89 64 24 64       	mov    DWORD PTR [rsp+0x64],r12d
   14087b2b4:	44 8b 45 90          	mov    r8d,DWORD PTR [rbp-0x70]
   14087b2b8:	41 ff c8             	dec    r8d
   14087b2bb:	8b 75 e0             	mov    esi,DWORD PTR [rbp-0x20]
   14087b2be:	83 c6 02             	add    esi,0x2
   14087b2c1:	89 75 a0             	mov    DWORD PTR [rbp-0x60],esi
   14087b2c4:	8b 4d b0             	mov    ecx,DWORD PTR [rbp-0x50]
   14087b2c7:	ff c9                	dec    ecx
   14087b2c9:	2b ce                	sub    ecx,esi
   14087b2cb:	ff c1                	inc    ecx
   14087b2cd:	b8 56 55 55 55       	mov    eax,0x55555556
   14087b2d2:	f7 e9                	imul   ecx
   14087b2d4:	8b da                	mov    ebx,edx
   14087b2d6:	c1 eb 1f             	shr    ebx,0x1f
   14087b2d9:	03 da                	add    ebx,edx
   14087b2db:	89 5d e8             	mov    DWORD PTR [rbp-0x18],ebx
   14087b2de:	45 8d 78 fe          	lea    r15d,[r8-0x2]
   14087b2e2:	3b fb                	cmp    edi,ebx
   14087b2e4:	45 0f 4e f8          	cmovle r15d,r8d
   14087b2e8:	44 89 7d 80          	mov    DWORD PTR [rbp-0x80],r15d
   14087b2ec:	44 8b ee             	mov    r13d,esi
   14087b2ef:	89 74 24 60          	mov    DWORD PTR [rsp+0x60],esi
   14087b2f3:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087b2f8:	8b 80 10 03 00 00    	mov    eax,DWORD PTR [rax+0x310]
   14087b2fe:	8b cf                	mov    ecx,edi
   14087b300:	2b cb                	sub    ecx,ebx
   14087b302:	3b c1                	cmp    eax,ecx
   14087b304:	0f 4e c8             	cmovle ecx,eax
   14087b307:	33 d2                	xor    edx,edx
   14087b309:	85 c9                	test   ecx,ecx
   14087b30b:	0f 49 d1             	cmovns edx,ecx
   14087b30e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
   14087b311:	8b c2                	mov    eax,edx
   14087b313:	89 54 24 7c          	mov    DWORD PTR [rsp+0x7c],edx
   14087b317:	8d 0c 1a             	lea    ecx,[rdx+rbx*1]
   14087b31a:	89 4d 8c             	mov    DWORD PTR [rbp-0x74],ecx
   14087b31d:	3b d1                	cmp    edx,ecx
   14087b31f:	0f 8d 14 25 00 00    	jge    0x14087d839
   14087b325:	3b c7                	cmp    eax,edi
   14087b327:	0f 8d 06 25 00 00    	jge    0x14087d833
   14087b32d:	45 33 c0             	xor    r8d,r8d
   14087b330:	ba 07 00 00 00       	mov    edx,0x7
   14087b335:	41 b1 01             	mov    r9b,0x1
   14087b338:	48 8d 0d a1 8f dc 01 	lea    rcx,[rip+0x1dc8fa1]        # 0x1426442e0
   14087b33f:	e8 7c fd 83 ff       	call   0x1400bb0c0
   14087b344:	41 8b f4             	mov    esi,r12d
   14087b347:	45 3b e7             	cmp    r12d,r15d
   14087b34a:	0f 8f dd 00 00 00    	jg     0x14087b42d
   14087b350:	45 8d 75 03          	lea    r14d,[r13+0x3]
   14087b354:	41 8b dd             	mov    ebx,r13d
   14087b357:	45 3b ee             	cmp    r13d,r14d
   14087b35a:	0f 8d c2 00 00 00    	jge    0x14087b422
   14087b360:	41 3b f7             	cmp    esi,r15d
   14087b363:	75 5f                	jne    0x14087b3c4
   14087b365:	48 8d 3d 34 a9 dc 01 	lea    rdi,[rip+0x1dca934]        # 0x142645ca0
   14087b36c:	4c 8d 3d 6d 8f dc 01 	lea    r15,[rip+0x1dc8f6d]        # 0x1426442e0
   14087b373:	44 8b c6             	mov    r8d,esi
   14087b376:	8b d3                	mov    edx,ebx
   14087b378:	49 8b cf             	mov    rcx,r15
   14087b37b:	e8 30 fd 83 ff       	call   0x1400bb0b0
   14087b380:	49 8b cf             	mov    rcx,r15
   14087b383:	41 3b f4             	cmp    esi,r12d
   14087b386:	75 05                	jne    0x14087b38d
   14087b388:	8b 57 e8             	mov    edx,DWORD PTR [rdi-0x18]
   14087b38b:	eb 02                	jmp    0x14087b38f
   14087b38d:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b38f:	e8 7c c7 25 00       	call   0x140ad7b10
   14087b394:	33 d2                	xor    edx,edx
   14087b396:	48 8d 0d c3 c2 b4 01 	lea    rcx,[rip+0x1b4c2c3]        # 0x1423c7660
   14087b39d:	e8 7e 6b 7f ff       	call   0x140071f20
   14087b3a2:	84 c0                	test   al,al
   14087b3a4:	74 0d                	je     0x14087b3b3
   14087b3a6:	41 b0 01             	mov    r8b,0x1
   14087b3a9:	33 d2                	xor    edx,edx
   14087b3ab:	49 8b cf             	mov    rcx,r15
   14087b3ae:	e8 6d fd 83 ff       	call   0x1400bb120
   14087b3b3:	ff c3                	inc    ebx
   14087b3b5:	48 83 c7 04          	add    rdi,0x4
   14087b3b9:	41 3b de             	cmp    ebx,r14d
   14087b3bc:	7c b5                	jl     0x14087b373
   14087b3be:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087b3c2:	eb 5e                	jmp    0x14087b422
   14087b3c4:	48 8d 3d c9 a8 dc 01 	lea    rdi,[rip+0x1dca8c9]        # 0x142645c94
   14087b3cb:	4c 8d 2d 0e 8f dc 01 	lea    r13,[rip+0x1dc8f0e]        # 0x1426442e0
   14087b3d2:	44 8b c6             	mov    r8d,esi
   14087b3d5:	8b d3                	mov    edx,ebx
   14087b3d7:	49 8b cd             	mov    rcx,r13
   14087b3da:	e8 d1 fc 83 ff       	call   0x1400bb0b0
   14087b3df:	49 8b cd             	mov    rcx,r13
   14087b3e2:	41 3b f4             	cmp    esi,r12d
   14087b3e5:	75 05                	jne    0x14087b3ec
   14087b3e7:	8b 57 f4             	mov    edx,DWORD PTR [rdi-0xc]
   14087b3ea:	eb 02                	jmp    0x14087b3ee
   14087b3ec:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b3ee:	e8 1d c7 25 00       	call   0x140ad7b10
   14087b3f3:	33 d2                	xor    edx,edx
   14087b3f5:	48 8d 0d 64 c2 b4 01 	lea    rcx,[rip+0x1b4c264]        # 0x1423c7660
   14087b3fc:	e8 1f 6b 7f ff       	call   0x140071f20
   14087b401:	84 c0                	test   al,al
   14087b403:	74 0d                	je     0x14087b412
   14087b405:	41 b0 01             	mov    r8b,0x1
   14087b408:	33 d2                	xor    edx,edx
   14087b40a:	49 8b cd             	mov    rcx,r13
   14087b40d:	e8 0e fd 83 ff       	call   0x1400bb120
   14087b412:	ff c3                	inc    ebx
   14087b414:	48 83 c7 04          	add    rdi,0x4
   14087b418:	41 3b de             	cmp    ebx,r14d
   14087b41b:	7c b5                	jl     0x14087b3d2
   14087b41d:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087b422:	ff c6                	inc    esi
   14087b424:	41 3b f7             	cmp    esi,r15d
   14087b427:	0f 8e 27 ff ff ff    	jle    0x14087b354
   14087b42d:	45 8d 44 24 0c       	lea    r8d,[r12+0xc]
   14087b432:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087b436:	48 8d 35 a3 8e dc 01 	lea    rsi,[rip+0x1dc8ea3]        # 0x1426442e0
   14087b43d:	48 8b ce             	mov    rcx,rsi
   14087b440:	e8 6b fc 83 ff       	call   0x1400bb0b0
   14087b445:	48 63 5c 24 7c       	movsxd rbx,DWORD PTR [rsp+0x7c]
   14087b44a:	8b d3                	mov    edx,ebx
   14087b44c:	2b 55 e0             	sub    edx,DWORD PTR [rbp-0x20]
   14087b44f:	83 c2 52             	add    edx,0x52
   14087b452:	45 33 c0             	xor    r8d,r8d
   14087b455:	48 8d 0d 64 cd 02 01 	lea    rcx,[rip+0x102cd64]        # 0x1418a81c0
   14087b45c:	e8 8f b0 3b 00       	call   0x140c364f0
   14087b461:	4c 8b f3             	mov    r14,rbx
   14087b464:	48 8b d3             	mov    rdx,rbx
   14087b467:	48 8b 4d a8          	mov    rcx,QWORD PTR [rbp-0x58]
   14087b46b:	e8 80 3e 7f ff       	call   0x14006f2f0
   14087b470:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   14087b473:	45 85 c0             	test   r8d,r8d
   14087b476:	0f 84 f8 05 00 00    	je     0x14087ba74
   14087b47c:	41 83 e8 01          	sub    r8d,0x1
   14087b480:	0f 84 fc 00 00 00    	je     0x14087b582
   14087b486:	41 83 e8 01          	sub    r8d,0x1
   14087b48a:	0f 84 e4 05 00 00    	je     0x14087ba74
   14087b490:	41 83 e8 01          	sub    r8d,0x1
   14087b494:	0f 84 e8 00 00 00    	je     0x14087b582
   14087b49a:	41 83 f8 01          	cmp    r8d,0x1
   14087b49e:	0f 85 6f 23 00 00    	jne    0x14087d813
   14087b4a4:	48 8b 74 24 70       	mov    rsi,QWORD PTR [rsp+0x70]
   14087b4a9:	48 8d 8e 80 01 00 00 	lea    rcx,[rsi+0x180]
   14087b4b0:	48 8b d3             	mov    rdx,rbx
   14087b4b3:	e8 38 3e 7f ff       	call   0x14006f2f0
   14087b4b8:	8b 10                	mov    edx,DWORD PTR [rax]
   14087b4ba:	48 8d 0d 7f 3e b6 01 	lea    rcx,[rip+0x1b63e7f]        # 0x1423df340
   14087b4c1:	e8 aa 71 7f ff       	call   0x140072670
   14087b4c6:	48 8b d8             	mov    rbx,rax
   14087b4c9:	48 85 c0             	test   rax,rax
   14087b4cc:	0f 84 41 23 00 00    	je     0x14087d813
   14087b4d2:	45 33 c0             	xor    r8d,r8d
   14087b4d5:	ba 06 00 00 00       	mov    edx,0x6
   14087b4da:	41 b1 01             	mov    r9b,0x1
   14087b4dd:	48 8d 0d fc 8d dc 01 	lea    rcx,[rip+0x1dc8dfc]        # 0x1426442e0
   14087b4e4:	e8 d7 fb 83 ff       	call   0x1400bb0c0
   14087b4e9:	45 8d 44 24 0a       	lea    r8d,[r12+0xa]
   14087b4ee:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087b4f2:	48 8d 3d e7 8d dc 01 	lea    rdi,[rip+0x1dc8de7]        # 0x1426442e0
   14087b4f9:	48 8b cf             	mov    rcx,rdi
   14087b4fc:	e8 af fb 83 ff       	call   0x1400bb0b0
   14087b501:	48 8d 15 a0 39 e3 00 	lea    rdx,[rip+0xe339a0]        # 0x1416aeea8
   14087b508:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b50c:	e8 cf cb 7e ff       	call   0x1400680e0
   14087b511:	90                   	nop
   14087b512:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087b516:	e8 05 41 7f ff       	call   0x14006f620
   14087b51b:	90                   	nop
   14087b51c:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087b522:	45 33 c0             	xor    r8d,r8d
   14087b525:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087b529:	48 8b cb             	mov    rcx,rbx
   14087b52c:	e8 5f 6f 3e 00       	call   0x140c62490
   14087b531:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087b535:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b539:	e8 62 e7 83 ff       	call   0x1400b9ca0
   14087b53e:	45 33 c9             	xor    r9d,r9d
   14087b541:	45 33 c0             	xor    r8d,r8d
   14087b544:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087b548:	48 8b cf             	mov    rcx,rdi
   14087b54b:	e8 50 b4 25 00       	call   0x140ad69a0
   14087b550:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087b554:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087b558:	45 8b cd             	mov    r9d,r13d
   14087b55b:	45 8b c4             	mov    r8d,r12d
   14087b55e:	8b 53 1c             	mov    edx,DWORD PTR [rbx+0x1c]
   14087b561:	48 8b ce             	mov    rcx,rsi
   14087b564:	e8 c7 67 02 00       	call   0x1408a1d30
   14087b569:	90                   	nop
   14087b56a:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087b56e:	e8 4d c8 7e ff       	call   0x140067dc0
   14087b573:	90                   	nop
   14087b574:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b578:	e8 43 c8 7e ff       	call   0x140067dc0
   14087b57d:	e9 91 22 00 00       	jmp    0x14087d813
   14087b582:	45 33 c0             	xor    r8d,r8d
   14087b585:	ba 07 00 00 00       	mov    edx,0x7
   14087b58a:	41 b1 01             	mov    r9b,0x1
   14087b58d:	48 8b ce             	mov    rcx,rsi
   14087b590:	e8 2b fb 83 ff       	call   0x1400bb0c0
   14087b595:	4c 8b 6c 24 70       	mov    r13,QWORD PTR [rsp+0x70]
   14087b59a:	49 8b d6             	mov    rdx,r14
   14087b59d:	49 8d 8d 80 01 00 00 	lea    rcx,[r13+0x180]
   14087b5a4:	e8 47 3d 7f ff       	call   0x14006f2f0
   14087b5a9:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087b5ac:	49 8d 8d 68 02 00 00 	lea    rcx,[r13+0x268]
   14087b5b3:	e8 18 3e 7f ff       	call   0x14006f3d0
   14087b5b8:	4c 0f bf 20          	movsx  r12,WORD PTR [rax]
   14087b5bc:	49 8b d6             	mov    rdx,r14
   14087b5bf:	49 8d 8d 80 01 00 00 	lea    rcx,[r13+0x180]
   14087b5c6:	e8 25 3d 7f ff       	call   0x14006f2f0
   14087b5cb:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087b5ce:	49 8d 8d 80 02 00 00 	lea    rcx,[r13+0x280]
   14087b5d5:	e8 f6 3d 7f ff       	call   0x14006f3d0
   14087b5da:	48 0f bf 30          	movsx  rsi,WORD PTR [rax]
   14087b5de:	49 8b d6             	mov    rdx,r14
   14087b5e1:	49 8d 8d 80 01 00 00 	lea    rcx,[r13+0x180]
   14087b5e8:	e8 03 3d 7f ff       	call   0x14006f2f0
   14087b5ed:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087b5f0:	49 8d 8d 98 02 00 00 	lea    rcx,[r13+0x298]
   14087b5f7:	e8 d4 3d 7f ff       	call   0x14006f3d0
   14087b5fc:	4c 0f bf 38          	movsx  r15,WORD PTR [rax]
   14087b600:	49 8b d6             	mov    rdx,r14
   14087b603:	49 8d 8d 80 01 00 00 	lea    rcx,[r13+0x180]
   14087b60a:	e8 e1 3c 7f ff       	call   0x14006f2f0
   14087b60f:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087b612:	49 8d 8d b0 02 00 00 	lea    rcx,[r13+0x2b0]
   14087b619:	e8 b2 3d 7f ff       	call   0x14006f3d0
   14087b61e:	48 0f bf 18          	movsx  rbx,WORD PTR [rax]
   14087b622:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14087b627:	0f b7 f8             	movzx  edi,ax
   14087b62a:	66 89 45 98          	mov    WORD PTR [rbp-0x68],ax
   14087b62e:	66 89 45 88          	mov    WORD PTR [rbp-0x78],ax
   14087b632:	45 33 ed             	xor    r13d,r13d
   14087b635:	4c 89 6d c0          	mov    QWORD PTR [rbp-0x40],r13
   14087b639:	33 c0                	xor    eax,eax
   14087b63b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14087b63f:	4c 8b 74 24 70       	mov    r14,QWORD PTR [rsp+0x70]
   14087b644:	66 44 3b e7          	cmp    r12w,di
   14087b648:	74 16                	je     0x14087b660
   14087b64a:	49 8d 8e c0 01 00 00 	lea    rcx,[r14+0x1c0]
   14087b651:	49 8b d4             	mov    rdx,r12
   14087b654:	e8 77 3d 7f ff       	call   0x14006f3d0
   14087b659:	0f b7 38             	movzx  edi,WORD PTR [rax]
   14087b65c:	66 89 7d 98          	mov    WORD PTR [rbp-0x68],di
   14087b660:	66 83 fe ff          	cmp    si,0xffff
   14087b664:	74 16                	je     0x14087b67c
   14087b666:	49 8d 8e a8 01 00 00 	lea    rcx,[r14+0x1a8]
   14087b66d:	48 8b d6             	mov    rdx,rsi
   14087b670:	e8 3b 3b 7f ff       	call   0x14006f1b0
   14087b675:	4c 8b 28             	mov    r13,QWORD PTR [rax]
   14087b678:	4c 89 6d c0          	mov    QWORD PTR [rbp-0x40],r13
   14087b67c:	66 41 83 ff ff       	cmp    r15w,0xffff
   14087b681:	74 16                	je     0x14087b699
   14087b683:	49 8d 8e f0 01 00 00 	lea    rcx,[r14+0x1f0]
   14087b68a:	49 8b d7             	mov    rdx,r15
   14087b68d:	e8 3e 3d 7f ff       	call   0x14006f3d0
   14087b692:	0f b7 00             	movzx  eax,WORD PTR [rax]
   14087b695:	66 89 45 88          	mov    WORD PTR [rbp-0x78],ax
   14087b699:	66 83 fb ff          	cmp    bx,0xffff
   14087b69d:	74 16                	je     0x14087b6b5
   14087b69f:	49 8d 8e d8 01 00 00 	lea    rcx,[r14+0x1d8]
   14087b6a6:	48 8b d3             	mov    rdx,rbx
   14087b6a9:	e8 02 3b 7f ff       	call   0x14006f1b0
   14087b6ae:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14087b6b1:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14087b6b5:	4d 85 ed             	test   r13,r13
   14087b6b8:	74 23                	je     0x14087b6dd
   14087b6ba:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087b6be:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087b6c2:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087b6c7:	44 8b 44 24 64       	mov    r8d,DWORD PTR [rsp+0x64]
   14087b6cc:	41 8b 55 1c          	mov    edx,DWORD PTR [r13+0x1c]
   14087b6d0:	49 8b ce             	mov    rcx,r14
   14087b6d3:	e8 58 66 02 00       	call   0x1408a1d30
   14087b6d8:	e9 aa 00 00 00       	jmp    0x14087b787
   14087b6dd:	0f bf d7             	movsx  edx,di
   14087b6e0:	48 8b 0d 19 39 b6 01 	mov    rcx,QWORD PTR [rip+0x1b63919]        # 0x1423df000
   14087b6e7:	e8 34 fd 9e ff       	call   0x14026b420
   14087b6ec:	83 f8 ff             	cmp    eax,0xffffffff
   14087b6ef:	0f 84 92 00 00 00    	je     0x14087b787
   14087b6f5:	48 98                	cdqe
   14087b6f7:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087b6fc:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087b700:	49 c1 e7 04          	shl    r15,0x4
   14087b704:	48 8d 05 2d ac dc 01 	lea    rax,[rip+0x1dcac2d]        # 0x142646338
   14087b70b:	4c 03 f8             	add    r15,rax
   14087b70e:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087b714:	44 8b 6c 24 64       	mov    r13d,DWORD PTR [rsp+0x64]
   14087b719:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   14087b720:	41 8b dd             	mov    ebx,r13d
   14087b723:	49 8b ff             	mov    rdi,r15
   14087b726:	be 04 00 00 00       	mov    esi,0x4
   14087b72b:	4c 8d 2d ae 8b dc 01 	lea    r13,[rip+0x1dc8bae]        # 0x1426442e0
   14087b732:	44 8b c3             	mov    r8d,ebx
   14087b735:	41 8b d6             	mov    edx,r14d
   14087b738:	49 8b cd             	mov    rcx,r13
   14087b73b:	e8 70 f9 83 ff       	call   0x1400bb0b0
   14087b740:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b742:	49 8b cd             	mov    rcx,r13
   14087b745:	e8 c6 c3 25 00       	call   0x140ad7b10
   14087b74a:	33 d2                	xor    edx,edx
   14087b74c:	48 8d 0d 0d bf b4 01 	lea    rcx,[rip+0x1b4bf0d]        # 0x1423c7660
   14087b753:	e8 c8 67 7f ff       	call   0x140071f20
   14087b758:	84 c0                	test   al,al
   14087b75a:	74 0d                	je     0x14087b769
   14087b75c:	41 b0 01             	mov    r8b,0x1
   14087b75f:	33 d2                	xor    edx,edx
   14087b761:	49 8b cd             	mov    rcx,r13
   14087b764:	e8 b7 f9 83 ff       	call   0x1400bb120
   14087b769:	ff c3                	inc    ebx
   14087b76b:	48 83 c7 0c          	add    rdi,0xc
   14087b76f:	48 83 ee 01          	sub    rsi,0x1
   14087b773:	75 bd                	jne    0x14087b732
   14087b775:	41 ff c6             	inc    r14d
   14087b778:	49 83 c7 04          	add    r15,0x4
   14087b77c:	49 83 ec 01          	sub    r12,0x1
   14087b780:	44 8b 6c 24 64       	mov    r13d,DWORD PTR [rsp+0x64]
   14087b785:	75 99                	jne    0x14087b720
   14087b787:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087b78c:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087b791:	4c 8d 3d e0 16 dd 01 	lea    r15,[rip+0x1dd16e0]        # 0x14264ce78
   14087b798:	4c 8d 2d 41 8b dc 01 	lea    r13,[rip+0x1dc8b41]        # 0x1426442e0
   14087b79f:	90                   	nop
   14087b7a0:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087b7a5:	49 8b ff             	mov    rdi,r15
   14087b7a8:	be 04 00 00 00       	mov    esi,0x4
   14087b7ad:	0f 1f 00             	nop    DWORD PTR [rax]
   14087b7b0:	44 8b c3             	mov    r8d,ebx
   14087b7b3:	41 8b d6             	mov    edx,r14d
   14087b7b6:	49 8b cd             	mov    rcx,r13
   14087b7b9:	e8 f2 f8 83 ff       	call   0x1400bb0b0
   14087b7be:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b7c0:	49 8b cd             	mov    rcx,r13
   14087b7c3:	e8 48 c3 25 00       	call   0x140ad7b10
   14087b7c8:	33 d2                	xor    edx,edx
   14087b7ca:	48 8d 0d 8f be b4 01 	lea    rcx,[rip+0x1b4be8f]        # 0x1423c7660
   14087b7d1:	e8 4a 67 7f ff       	call   0x140071f20
   14087b7d6:	84 c0                	test   al,al
   14087b7d8:	74 0d                	je     0x14087b7e7
   14087b7da:	41 b0 01             	mov    r8b,0x1
   14087b7dd:	33 d2                	xor    edx,edx
   14087b7df:	49 8b cd             	mov    rcx,r13
   14087b7e2:	e8 39 f9 83 ff       	call   0x1400bb120
   14087b7e7:	ff c3                	inc    ebx
   14087b7e9:	48 83 c7 0c          	add    rdi,0xc
   14087b7ed:	48 83 ee 01          	sub    rsi,0x1
   14087b7f1:	75 bd                	jne    0x14087b7b0
   14087b7f3:	41 ff c6             	inc    r14d
   14087b7f6:	49 83 c7 04          	add    r15,0x4
   14087b7fa:	48 8d 05 83 16 dd 01 	lea    rax,[rip+0x1dd1683]        # 0x14264ce84
   14087b801:	4c 3b f8             	cmp    r15,rax
   14087b804:	7c 9a                	jl     0x14087b7a0
   14087b806:	48 63 74 24 7c       	movsxd rsi,DWORD PTR [rsp+0x7c]
   14087b80b:	48 8b d6             	mov    rdx,rsi
   14087b80e:	4c 8b 75 a8          	mov    r14,QWORD PTR [rbp-0x58]
   14087b812:	49 8b ce             	mov    rcx,r14
   14087b815:	e8 d6 3a 7f ff       	call   0x14006f2f0
   14087b81a:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14087b81d:	4c 8b 6d c0          	mov    r13,QWORD PTR [rbp-0x40]
   14087b821:	48 8b 5d c8          	mov    rbx,QWORD PTR [rbp-0x38]
   14087b825:	4c 8b 7c 24 70       	mov    r15,QWORD PTR [rsp+0x70]
   14087b82a:	0f 85 93 01 00 00    	jne    0x14087b9c3
   14087b830:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087b835:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087b839:	48 85 db             	test   rbx,rbx
   14087b83c:	0f 84 b8 00 00 00    	je     0x14087b8fa
   14087b842:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087b846:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087b84a:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087b84f:	45 8b c5             	mov    r8d,r13d
   14087b852:	8b 53 1c             	mov    edx,DWORD PTR [rbx+0x1c]
   14087b855:	49 8b cf             	mov    rcx,r15
   14087b858:	e8 d3 64 02 00       	call   0x1408a1d30
   14087b85d:	0f b7 7d 88          	movzx  edi,WORD PTR [rbp-0x78]
   14087b861:	4c 8b 6d c0          	mov    r13,QWORD PTR [rbp-0x40]
   14087b865:	48 63 d6             	movsxd rdx,esi
   14087b868:	49 8b ce             	mov    rcx,r14
   14087b86b:	e8 80 3a 7f ff       	call   0x14006f2f0
   14087b870:	8b 54 24 60          	mov    edx,DWORD PTR [rsp+0x60]
   14087b874:	ff c2                	inc    edx
   14087b876:	48 8d 0d 63 8a dc 01 	lea    rcx,[rip+0x1dc8a63]        # 0x1426442e0
   14087b87d:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14087b880:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087b885:	74 05                	je     0x14087b88c
   14087b887:	45 8d 44 24 0a       	lea    r8d,[r12+0xa]
   14087b88c:	e8 1f f8 83 ff       	call   0x1400bb0b0
   14087b891:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087b895:	e8 86 3d 7f ff       	call   0x14006f620
   14087b89a:	90                   	nop
   14087b89b:	48 8d 15 e6 33 e3 00 	lea    rdx,[rip+0xe333e6]        # 0x1416aec88
   14087b8a2:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b8a6:	e8 35 c8 7e ff       	call   0x1400680e0
   14087b8ab:	90                   	nop
   14087b8ac:	48 63 d6             	movsxd rdx,esi
   14087b8af:	49 8b ce             	mov    rcx,r14
   14087b8b2:	e8 39 3a 7f ff       	call   0x14006f2f0
   14087b8b7:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14087b8ba:	0f 85 2a 01 00 00    	jne    0x14087b9ea
   14087b8c0:	48 8d 15 59 7e d6 00 	lea    rdx,[rip+0xd67e59]        # 0x1415e3720
   14087b8c7:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b8cb:	e8 20 3c 7f ff       	call   0x14006f4f0
   14087b8d0:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087b8d4:	66 83 ff ff          	cmp    di,0xffff
   14087b8d8:	0f 84 ee 00 00 00    	je     0x14087b9cc
   14087b8de:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087b8e5:	45 33 c9             	xor    r9d,r9d
   14087b8e8:	44 0f b7 c7          	movzx  r8d,di
   14087b8ec:	49 8b 4f 38          	mov    rcx,QWORD PTR [r15+0x38]
   14087b8f0:	e8 4b 3c ab 00       	call   0x14132f540
   14087b8f5:	e9 e3 00 00 00       	jmp    0x14087b9dd
   14087b8fa:	0f bf 7d 88          	movsx  edi,WORD PTR [rbp-0x78]
   14087b8fe:	8b d7                	mov    edx,edi
   14087b900:	49 8b 4f 38          	mov    rcx,QWORD PTR [r15+0x38]
   14087b904:	e8 17 fb 9e ff       	call   0x14026b420
   14087b909:	83 f8 ff             	cmp    eax,0xffffffff
   14087b90c:	0f 84 4f ff ff ff    	je     0x14087b861
   14087b912:	48 98                	cdqe
   14087b914:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087b919:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087b91d:	49 c1 e7 04          	shl    r15,0x4
   14087b921:	48 8d 05 10 aa dc 01 	lea    rax,[rip+0x1dcaa10]        # 0x142646338
   14087b928:	4c 03 f8             	add    r15,rax
   14087b92b:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087b931:	41 8b dd             	mov    ebx,r13d
   14087b934:	49 8b ff             	mov    rdi,r15
   14087b937:	be 04 00 00 00       	mov    esi,0x4
   14087b93c:	4c 8d 2d 9d 89 dc 01 	lea    r13,[rip+0x1dc899d]        # 0x1426442e0
   14087b943:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087b947:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087b950:	44 8b c3             	mov    r8d,ebx
   14087b953:	41 8b d6             	mov    edx,r14d
   14087b956:	49 8b cd             	mov    rcx,r13
   14087b959:	e8 52 f7 83 ff       	call   0x1400bb0b0
   14087b95e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087b960:	49 8b cd             	mov    rcx,r13
   14087b963:	e8 a8 c1 25 00       	call   0x140ad7b10
   14087b968:	33 d2                	xor    edx,edx
   14087b96a:	48 8d 0d ef bc b4 01 	lea    rcx,[rip+0x1b4bcef]        # 0x1423c7660
   14087b971:	e8 aa 65 7f ff       	call   0x140071f20
   14087b976:	84 c0                	test   al,al
   14087b978:	74 0d                	je     0x14087b987
   14087b97a:	41 b0 01             	mov    r8b,0x1
   14087b97d:	33 d2                	xor    edx,edx
   14087b97f:	49 8b cd             	mov    rcx,r13
   14087b982:	e8 99 f7 83 ff       	call   0x1400bb120
   14087b987:	ff c3                	inc    ebx
   14087b989:	48 83 c7 0c          	add    rdi,0xc
   14087b98d:	48 83 ee 01          	sub    rsi,0x1
   14087b991:	75 bd                	jne    0x14087b950
   14087b993:	41 ff c6             	inc    r14d
   14087b996:	49 83 c7 04          	add    r15,0x4
   14087b99a:	49 83 ec 01          	sub    r12,0x1
   14087b99e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087b9a2:	75 8d                	jne    0x14087b931
   14087b9a4:	48 8b 5d c8          	mov    rbx,QWORD PTR [rbp-0x38]
   14087b9a8:	0f b7 7d 88          	movzx  edi,WORD PTR [rbp-0x78]
   14087b9ac:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087b9b1:	8b 74 24 7c          	mov    esi,DWORD PTR [rsp+0x7c]
   14087b9b5:	4c 8b 75 a8          	mov    r14,QWORD PTR [rbp-0x58]
   14087b9b9:	4c 8b 7c 24 70       	mov    r15,QWORD PTR [rsp+0x70]
   14087b9be:	e9 9e fe ff ff       	jmp    0x14087b861
   14087b9c3:	0f b7 7d 88          	movzx  edi,WORD PTR [rbp-0x78]
   14087b9c7:	e9 99 fe ff ff       	jmp    0x14087b865
   14087b9cc:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087b9d2:	45 33 c0             	xor    r8d,r8d
   14087b9d5:	48 8b cb             	mov    rcx,rbx
   14087b9d8:	e8 b3 6a 3e 00       	call   0x140c62490
   14087b9dd:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087b9e1:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b9e5:	e8 b6 e2 83 ff       	call   0x1400b9ca0
   14087b9ea:	48 8d 15 9f db d6 00 	lea    rdx,[rip+0xd6db9f]        # 0x1415e9590
   14087b9f1:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087b9f5:	e8 f6 3a 7f ff       	call   0x14006f4f0
   14087b9fa:	44 0f b7 45 98       	movzx  r8d,WORD PTR [rbp-0x68]
   14087b9ff:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087ba03:	66 41 83 f8 ff       	cmp    r8w,0xffff
   14087ba08:	74 18                	je     0x14087ba22
   14087ba0a:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087ba11:	45 33 c9             	xor    r9d,r9d
   14087ba14:	48 8b 0d e5 35 b6 01 	mov    rcx,QWORD PTR [rip+0x1b635e5]        # 0x1423df000
   14087ba1b:	e8 20 3b ab 00       	call   0x14132f540
   14087ba20:	eb 11                	jmp    0x14087ba33
   14087ba22:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   14087ba28:	45 33 c0             	xor    r8d,r8d
   14087ba2b:	49 8b cd             	mov    rcx,r13
   14087ba2e:	e8 5d 6a 3e 00       	call   0x140c62490
   14087ba33:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087ba37:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087ba3b:	e8 60 e2 83 ff       	call   0x1400b9ca0
   14087ba40:	45 33 c9             	xor    r9d,r9d
   14087ba43:	45 33 c0             	xor    r8d,r8d
   14087ba46:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087ba4a:	48 8d 0d 8f 88 dc 01 	lea    rcx,[rip+0x1dc888f]        # 0x1426442e0
   14087ba51:	e8 4a af 25 00       	call   0x140ad69a0
   14087ba56:	90                   	nop
   14087ba57:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087ba5b:	e8 60 c3 7e ff       	call   0x140067dc0
   14087ba60:	90                   	nop
   14087ba61:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087ba65:	e8 56 c3 7e ff       	call   0x140067dc0
   14087ba6a:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087ba6f:	e9 9b 1d 00 00       	jmp    0x14087d80f
   14087ba74:	45 33 c0             	xor    r8d,r8d
   14087ba77:	ba 03 00 00 00       	mov    edx,0x3
   14087ba7c:	41 b1 01             	mov    r9b,0x1
   14087ba7f:	48 8b ce             	mov    rcx,rsi
   14087ba82:	e8 39 f6 83 ff       	call   0x1400bb0c0
   14087ba87:	4c 8b 6c 24 70       	mov    r13,QWORD PTR [rsp+0x70]
   14087ba8c:	49 8d b5 80 01 00 00 	lea    rsi,[r13+0x180]
   14087ba93:	49 8b d6             	mov    rdx,r14
   14087ba96:	48 8b ce             	mov    rcx,rsi
   14087ba99:	e8 52 38 7f ff       	call   0x14006f2f0
   14087ba9e:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087baa1:	49 8d 8d c8 02 00 00 	lea    rcx,[r13+0x2c8]
   14087baa8:	e8 23 39 7f ff       	call   0x14006f3d0
   14087baad:	48 0f bf 10          	movsx  rdx,WORD PTR [rax]
   14087bab1:	49 8d 8d 08 02 00 00 	lea    rcx,[r13+0x208]
   14087bab8:	e8 33 80 9c ff       	call   0x140243af0
   14087babd:	48 8b c8             	mov    rcx,rax
   14087bac0:	e8 db 32 7f ff       	call   0x14006eda0
   14087bac5:	4c 8b f8             	mov    r15,rax
   14087bac8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   14087bacc:	49 8b d6             	mov    rdx,r14
   14087bacf:	48 8b ce             	mov    rcx,rsi
   14087bad2:	e8 19 38 7f ff       	call   0x14006f2f0
   14087bad7:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087bada:	49 8d 8d c8 02 00 00 	lea    rcx,[r13+0x2c8]
   14087bae1:	e8 ea 38 7f ff       	call   0x14006f3d0
   14087bae6:	48 0f bf 10          	movsx  rdx,WORD PTR [rax]
   14087baea:	49 8d 8d 20 02 00 00 	lea    rcx,[r13+0x220]
   14087baf1:	e8 fa 7f 9c ff       	call   0x140243af0
   14087baf6:	48 8b c8             	mov    rcx,rax
   14087baf9:	e8 a2 32 7f ff       	call   0x14006eda0
   14087bafe:	4c 8b e8             	mov    r13,rax
   14087bb01:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
   14087bb05:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087bb0a:	49 8b d6             	mov    rdx,r14
   14087bb0d:	48 8b ce             	mov    rcx,rsi
   14087bb10:	e8 db 37 7f ff       	call   0x14006f2f0
   14087bb15:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087bb18:	48 8d 8b e0 02 00 00 	lea    rcx,[rbx+0x2e0]
   14087bb1f:	e8 ac 38 7f ff       	call   0x14006f3d0
   14087bb24:	48 0f bf 38          	movsx  rdi,WORD PTR [rax]
   14087bb28:	49 8b d6             	mov    rdx,r14
   14087bb2b:	48 8b ce             	mov    rcx,rsi
   14087bb2e:	e8 bd 37 7f ff       	call   0x14006f2f0
   14087bb33:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   14087bb36:	48 8d 8b f8 02 00 00 	lea    rcx,[rbx+0x2f8]
   14087bb3d:	e8 8e 38 7f ff       	call   0x14006f3d0
   14087bb42:	0f b7 00             	movzx  eax,WORD PTR [rax]
   14087bb45:	66 89 45 88          	mov    WORD PTR [rbp-0x78],ax
   14087bb49:	48 8d 4d 78          	lea    rcx,[rbp+0x78]
   14087bb4d:	e8 ce 3a 7f ff       	call   0x14006f620
   14087bb52:	90                   	nop
   14087bb53:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087bb57:	e8 c4 3a 7f ff       	call   0x14006f620
   14087bb5c:	90                   	nop
   14087bb5d:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087bb61:	e8 ba 3a 7f ff       	call   0x14006f620
   14087bb66:	90                   	nop
   14087bb67:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087bb6b:	83 fa ff             	cmp    edx,0xffffffff
   14087bb6e:	0f 84 a2 00 00 00    	je     0x14087bc16
   14087bb74:	48 8d 0d c5 37 b6 01 	lea    rcx,[rip+0x1b637c5]        # 0x1423df340
   14087bb7b:	e8 f0 6a 7f ff       	call   0x140072670
   14087bb80:	be ff ff ff ff       	mov    esi,0xffffffff
   14087bb85:	48 85 c0             	test   rax,rax
   14087bb88:	74 12                	je     0x14087bb9c
   14087bb8a:	44 8b ce             	mov    r9d,esi
   14087bb8d:	45 33 c0             	xor    r8d,r8d
   14087bb90:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087bb94:	48 8b c8             	mov    rcx,rax
   14087bb97:	e8 f4 68 3e 00       	call   0x140c62490
   14087bb9c:	bb 02 00 00 00       	mov    ebx,0x2
   14087bba1:	41 8b 55 14          	mov    edx,DWORD PTR [r13+0x14]
   14087bba5:	83 fa ff             	cmp    edx,0xffffffff
   14087bba8:	0f 84 94 00 00 00    	je     0x14087bc42
   14087bbae:	48 8d 0d 8b 37 b6 01 	lea    rcx,[rip+0x1b6378b]        # 0x1423df340
   14087bbb5:	e8 b6 6a 7f ff       	call   0x140072670
   14087bbba:	48 85 c0             	test   rax,rax
   14087bbbd:	74 12                	je     0x14087bbd1
   14087bbbf:	44 8b ce             	mov    r9d,esi
   14087bbc2:	45 33 c0             	xor    r8d,r8d
   14087bbc5:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087bbc9:	48 8b c8             	mov    rcx,rax
   14087bbcc:	e8 bf 68 3e 00       	call   0x140c62490
   14087bbd1:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087bbd6:	48 63 54 24 7c       	movsxd rdx,DWORD PTR [rsp+0x7c]
   14087bbdb:	48 8b 4d a8          	mov    rcx,QWORD PTR [rbp-0x58]
   14087bbdf:	e8 0c 37 7f ff       	call   0x14006f2f0
   14087bbe4:	83 38 02             	cmp    DWORD PTR [rax],0x2
   14087bbe7:	0f 85 05 02 00 00    	jne    0x14087bdf2
   14087bbed:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087bbf1:	83 fa ff             	cmp    edx,0xffffffff
   14087bbf4:	74 70                	je     0x14087bc66
   14087bbf6:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087bbfa:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087bbfe:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087bc03:	45 8b cd             	mov    r9d,r13d
   14087bc06:	45 8b c4             	mov    r8d,r12d
   14087bc09:	48 8b cb             	mov    rcx,rbx
   14087bc0c:	e8 1f 61 02 00       	call   0x1408a1d30
   14087bc11:	e9 04 01 00 00       	jmp    0x14087bd1a
   14087bc16:	bb 02 00 00 00       	mov    ebx,0x2
   14087bc1b:	66 89 5c 24 20       	mov    WORD PTR [rsp+0x20],bx
   14087bc20:	45 33 c9             	xor    r9d,r9d
   14087bc23:	45 0f b7 47 04       	movzx  r8d,WORD PTR [r15+0x4]
   14087bc28:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087bc2c:	48 8b 0d cd 33 b6 01 	mov    rcx,QWORD PTR [rip+0x1b633cd]        # 0x1423df000
   14087bc33:	e8 08 39 ab 00       	call   0x14132f540
   14087bc38:	be ff ff ff ff       	mov    esi,0xffffffff
   14087bc3d:	e9 5f ff ff ff       	jmp    0x14087bba1
   14087bc42:	66 89 5c 24 20       	mov    WORD PTR [rsp+0x20],bx
   14087bc47:	45 33 c9             	xor    r9d,r9d
   14087bc4a:	45 0f b7 45 04       	movzx  r8d,WORD PTR [r13+0x4]
   14087bc4f:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087bc53:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087bc58:	48 8b 4b 38          	mov    rcx,QWORD PTR [rbx+0x38]
   14087bc5c:	e8 df 38 ab 00       	call   0x14132f540
   14087bc61:	e9 70 ff ff ff       	jmp    0x14087bbd6
   14087bc66:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087bc6a:	48 8b 0d 8f 33 b6 01 	mov    rcx,QWORD PTR [rip+0x1b6338f]        # 0x1423df000
   14087bc71:	e8 aa f7 9e ff       	call   0x14026b420
   14087bc76:	83 f8 ff             	cmp    eax,0xffffffff
   14087bc79:	0f 84 96 00 00 00    	je     0x14087bd15
   14087bc7f:	48 98                	cdqe
   14087bc81:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087bc86:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087bc8a:	49 c1 e7 04          	shl    r15,0x4
   14087bc8e:	48 8d 05 a3 a6 dc 01 	lea    rax,[rip+0x1dca6a3]        # 0x142646338
   14087bc95:	4c 03 f8             	add    r15,rax
   14087bc98:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087bc9e:	4c 8d 2d 3b 86 dc 01 	lea    r13,[rip+0x1dc863b]        # 0x1426442e0
   14087bca5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087bcb0:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087bcb4:	49 8b ff             	mov    rdi,r15
   14087bcb7:	be 04 00 00 00       	mov    esi,0x4
   14087bcbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087bcc0:	44 8b c3             	mov    r8d,ebx
   14087bcc3:	41 8b d6             	mov    edx,r14d
   14087bcc6:	49 8b cd             	mov    rcx,r13
   14087bcc9:	e8 e2 f3 83 ff       	call   0x1400bb0b0
   14087bcce:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087bcd0:	49 8b cd             	mov    rcx,r13
   14087bcd3:	e8 38 be 25 00       	call   0x140ad7b10
   14087bcd8:	33 d2                	xor    edx,edx
   14087bcda:	48 8d 0d 7f b9 b4 01 	lea    rcx,[rip+0x1b4b97f]        # 0x1423c7660
   14087bce1:	e8 3a 62 7f ff       	call   0x140071f20
   14087bce6:	84 c0                	test   al,al
   14087bce8:	74 0d                	je     0x14087bcf7
   14087bcea:	41 b0 01             	mov    r8b,0x1
   14087bced:	33 d2                	xor    edx,edx
   14087bcef:	49 8b cd             	mov    rcx,r13
   14087bcf2:	e8 29 f4 83 ff       	call   0x1400bb120
   14087bcf7:	ff c3                	inc    ebx
   14087bcf9:	48 83 c7 0c          	add    rdi,0xc
   14087bcfd:	48 83 ee 01          	sub    rsi,0x1
   14087bd01:	75 bd                	jne    0x14087bcc0
   14087bd03:	41 ff c6             	inc    r14d
   14087bd06:	49 83 c7 04          	add    r15,0x4
   14087bd0a:	49 83 ec 01          	sub    r12,0x1
   14087bd0e:	75 a0                	jne    0x14087bcb0
   14087bd10:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087bd15:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087bd1a:	45 8b f5             	mov    r14d,r13d
   14087bd1d:	4c 8d 3d 24 11 dd 01 	lea    r15,[rip+0x1dd1124]        # 0x14264ce48
   14087bd24:	4c 8d 2d b5 85 dc 01 	lea    r13,[rip+0x1dc85b5]        # 0x1426442e0
   14087bd2b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087bd30:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087bd35:	49 8b ff             	mov    rdi,r15
   14087bd38:	be 04 00 00 00       	mov    esi,0x4
   14087bd3d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087bd40:	44 8b c3             	mov    r8d,ebx
   14087bd43:	41 8b d6             	mov    edx,r14d
   14087bd46:	49 8b cd             	mov    rcx,r13
   14087bd49:	e8 62 f3 83 ff       	call   0x1400bb0b0
   14087bd4e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087bd50:	49 8b cd             	mov    rcx,r13
   14087bd53:	e8 b8 bd 25 00       	call   0x140ad7b10
   14087bd58:	33 d2                	xor    edx,edx
   14087bd5a:	48 8d 0d ff b8 b4 01 	lea    rcx,[rip+0x1b4b8ff]        # 0x1423c7660
   14087bd61:	e8 ba 61 7f ff       	call   0x140071f20
   14087bd66:	84 c0                	test   al,al
   14087bd68:	74 0d                	je     0x14087bd77
   14087bd6a:	41 b0 01             	mov    r8b,0x1
   14087bd6d:	33 d2                	xor    edx,edx
   14087bd6f:	49 8b cd             	mov    rcx,r13
   14087bd72:	e8 a9 f3 83 ff       	call   0x1400bb120
   14087bd77:	ff c3                	inc    ebx
   14087bd79:	48 83 c7 0c          	add    rdi,0xc
   14087bd7d:	48 83 ee 01          	sub    rsi,0x1
   14087bd81:	75 bd                	jne    0x14087bd40
   14087bd83:	41 ff c6             	inc    r14d
   14087bd86:	49 83 c7 04          	add    r15,0x4
   14087bd8a:	48 8d 05 c3 10 dd 01 	lea    rax,[rip+0x1dd10c3]        # 0x14264ce54
   14087bd91:	4c 3b f8             	cmp    r15,rax
   14087bd94:	7c 9a                	jl     0x14087bd30
   14087bd96:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087bd9b:	45 8d 44 24 0a       	lea    r8d,[r12+0xa]
   14087bda0:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087bda5:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087bda9:	48 8d 3d 30 85 dc 01 	lea    rdi,[rip+0x1dc8530]        # 0x1426442e0
   14087bdb0:	48 8b cf             	mov    rcx,rdi
   14087bdb3:	e8 f8 f2 83 ff       	call   0x1400bb0b0
   14087bdb8:	48 8d 15 d9 30 e3 00 	lea    rdx,[rip+0xe330d9]        # 0x1416aee98
   14087bdbf:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bdc3:	e8 18 c3 7e ff       	call   0x1400680e0
   14087bdc8:	90                   	nop
   14087bdc9:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087bdcd:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bdd1:	e8 ca de 83 ff       	call   0x1400b9ca0
   14087bdd6:	45 33 c9             	xor    r9d,r9d
   14087bdd9:	45 33 c0             	xor    r8d,r8d
   14087bddc:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   14087bde0:	48 8b cf             	mov    rcx,rdi
   14087bde3:	e8 b8 ab 25 00       	call   0x140ad69a0
   14087bde8:	90                   	nop
   14087bde9:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087bded:	e9 fa 19 00 00       	jmp    0x14087d7ec
   14087bdf2:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087bdf6:	e8 25 38 7f ff       	call   0x14006f620
   14087bdfb:	90                   	nop
   14087bdfc:	83 ff 0d             	cmp    edi,0xd
   14087bdff:	0f 87 c7 19 00 00    	ja     0x14087d7cc
   14087be05:	48 8d 15 f4 41 78 ff 	lea    rdx,[rip+0xffffffffff7841f4]        # 0x140000000
   14087be0c:	8b 8c ba 60 d9 87 00 	mov    ecx,DWORD PTR [rdx+rdi*4+0x87d960]
   14087be13:	48 03 ca             	add    rcx,rdx
   14087be16:	ff e1                	jmp    rcx
   14087be18:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087be1c:	83 fa ff             	cmp    edx,0xffffffff
   14087be1f:	0f 84 ce 00 00 00    	je     0x14087bef3
   14087be25:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087be29:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087be2d:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087be32:	45 8b c4             	mov    r8d,r12d
   14087be35:	48 8b cb             	mov    rcx,rbx
   14087be38:	e8 f3 5e 02 00       	call   0x1408a1d30
   14087be3d:	4c 8d 2d 9c 84 dc 01 	lea    r13,[rip+0x1dc849c]        # 0x1426442e0
   14087be44:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087be49:	4c 8d 3d 58 10 dd 01 	lea    r15,[rip+0x1dd1058]        # 0x14264cea8
   14087be50:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087be55:	49 8b ff             	mov    rdi,r15
   14087be58:	be 04 00 00 00       	mov    esi,0x4
   14087be5d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087be60:	44 8b c3             	mov    r8d,ebx
   14087be63:	41 8b d6             	mov    edx,r14d
   14087be66:	49 8b cd             	mov    rcx,r13
   14087be69:	e8 42 f2 83 ff       	call   0x1400bb0b0
   14087be6e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087be70:	49 8b cd             	mov    rcx,r13
   14087be73:	e8 98 bc 25 00       	call   0x140ad7b10
   14087be78:	33 d2                	xor    edx,edx
   14087be7a:	48 8d 0d df b7 b4 01 	lea    rcx,[rip+0x1b4b7df]        # 0x1423c7660
   14087be81:	e8 9a 60 7f ff       	call   0x140071f20
   14087be86:	84 c0                	test   al,al
   14087be88:	74 0d                	je     0x14087be97
   14087be8a:	41 b0 01             	mov    r8b,0x1
   14087be8d:	33 d2                	xor    edx,edx
   14087be8f:	49 8b cd             	mov    rcx,r13
   14087be92:	e8 89 f2 83 ff       	call   0x1400bb120
   14087be97:	ff c3                	inc    ebx
   14087be99:	48 83 c7 0c          	add    rdi,0xc
   14087be9d:	48 83 ee 01          	sub    rsi,0x1
   14087bea1:	75 bd                	jne    0x14087be60
   14087bea3:	41 ff c6             	inc    r14d
   14087bea6:	49 83 c7 04          	add    r15,0x4
   14087beaa:	48 8d 05 03 10 dd 01 	lea    rax,[rip+0x1dd1003]        # 0x14264ceb4
   14087beb1:	4c 3b f8             	cmp    r15,rax
   14087beb4:	7c 9a                	jl     0x14087be50
   14087beb6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087bebb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087bec0:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087bec4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087bec8:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087becb:	83 fa ff             	cmp    edx,0xffffffff
   14087bece:	0f 84 d6 00 00 00    	je     0x14087bfaa
   14087bed4:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087bed8:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087bedc:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087bee1:	45 8b c5             	mov    r8d,r13d
   14087bee4:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087bee9:	e8 42 5e 02 00       	call   0x1408a1d30
   14087beee:	e9 66 01 00 00       	jmp    0x14087c059
   14087bef3:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087bef7:	48 8b 0d 02 31 b6 01 	mov    rcx,QWORD PTR [rip+0x1b63102]        # 0x1423df000
   14087befe:	e8 1d f5 9e ff       	call   0x14026b420
   14087bf03:	83 f8 ff             	cmp    eax,0xffffffff
   14087bf06:	0f 84 31 ff ff ff    	je     0x14087be3d
   14087bf0c:	48 98                	cdqe
   14087bf0e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087bf13:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087bf17:	49 c1 e7 04          	shl    r15,0x4
   14087bf1b:	48 8d 05 16 a4 dc 01 	lea    rax,[rip+0x1dca416]        # 0x142646338
   14087bf22:	4c 03 f8             	add    r15,rax
   14087bf25:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087bf2b:	4c 8d 2d ae 83 dc 01 	lea    r13,[rip+0x1dc83ae]        # 0x1426442e0
   14087bf32:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087bf36:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087bf40:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087bf44:	49 8b ff             	mov    rdi,r15
   14087bf47:	be 04 00 00 00       	mov    esi,0x4
   14087bf4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087bf50:	44 8b c3             	mov    r8d,ebx
   14087bf53:	41 8b d6             	mov    edx,r14d
   14087bf56:	49 8b cd             	mov    rcx,r13
   14087bf59:	e8 52 f1 83 ff       	call   0x1400bb0b0
   14087bf5e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087bf60:	49 8b cd             	mov    rcx,r13
   14087bf63:	e8 a8 bb 25 00       	call   0x140ad7b10
   14087bf68:	33 d2                	xor    edx,edx
   14087bf6a:	48 8d 0d ef b6 b4 01 	lea    rcx,[rip+0x1b4b6ef]        # 0x1423c7660
   14087bf71:	e8 aa 5f 7f ff       	call   0x140071f20
   14087bf76:	84 c0                	test   al,al
   14087bf78:	74 0d                	je     0x14087bf87
   14087bf7a:	41 b0 01             	mov    r8b,0x1
   14087bf7d:	33 d2                	xor    edx,edx
   14087bf7f:	49 8b cd             	mov    rcx,r13
   14087bf82:	e8 99 f1 83 ff       	call   0x1400bb120
   14087bf87:	ff c3                	inc    ebx
   14087bf89:	48 83 c7 0c          	add    rdi,0xc
   14087bf8d:	48 83 ee 01          	sub    rsi,0x1
   14087bf91:	75 bd                	jne    0x14087bf50
   14087bf93:	41 ff c6             	inc    r14d
   14087bf96:	49 83 c7 04          	add    r15,0x4
   14087bf9a:	49 83 ec 01          	sub    r12,0x1
   14087bf9e:	75 a0                	jne    0x14087bf40
   14087bfa0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087bfa5:	e9 9a fe ff ff       	jmp    0x14087be44
   14087bfaa:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087bfad:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087bfb2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087bfb6:	e8 65 f4 9e ff       	call   0x14026b420
   14087bfbb:	83 f8 ff             	cmp    eax,0xffffffff
   14087bfbe:	0f 84 95 00 00 00    	je     0x14087c059
   14087bfc4:	48 98                	cdqe
   14087bfc6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087bfcb:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087bfcf:	49 c1 e7 04          	shl    r15,0x4
   14087bfd3:	48 8d 05 5e a3 dc 01 	lea    rax,[rip+0x1dca35e]        # 0x142646338
   14087bfda:	4c 03 f8             	add    r15,rax
   14087bfdd:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087bfe3:	41 8b dd             	mov    ebx,r13d
   14087bfe6:	49 8b ff             	mov    rdi,r15
   14087bfe9:	be 04 00 00 00       	mov    esi,0x4
   14087bfee:	4c 8d 2d eb 82 dc 01 	lea    r13,[rip+0x1dc82eb]        # 0x1426442e0
   14087bff5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087c000:	44 8b c3             	mov    r8d,ebx
   14087c003:	41 8b d6             	mov    edx,r14d
   14087c006:	49 8b cd             	mov    rcx,r13
   14087c009:	e8 a2 f0 83 ff       	call   0x1400bb0b0
   14087c00e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c010:	49 8b cd             	mov    rcx,r13
   14087c013:	e8 f8 ba 25 00       	call   0x140ad7b10
   14087c018:	33 d2                	xor    edx,edx
   14087c01a:	48 8d 0d 3f b6 b4 01 	lea    rcx,[rip+0x1b4b63f]        # 0x1423c7660
   14087c021:	e8 fa 5e 7f ff       	call   0x140071f20
   14087c026:	84 c0                	test   al,al
   14087c028:	74 0d                	je     0x14087c037
   14087c02a:	41 b0 01             	mov    r8b,0x1
   14087c02d:	33 d2                	xor    edx,edx
   14087c02f:	49 8b cd             	mov    rcx,r13
   14087c032:	e8 e9 f0 83 ff       	call   0x1400bb120
   14087c037:	ff c3                	inc    ebx
   14087c039:	48 83 c7 0c          	add    rdi,0xc
   14087c03d:	48 83 ee 01          	sub    rsi,0x1
   14087c041:	75 bd                	jne    0x14087c000
   14087c043:	41 ff c6             	inc    r14d
   14087c046:	49 83 c7 04          	add    r15,0x4
   14087c04a:	49 83 ec 01          	sub    r12,0x1
   14087c04e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087c052:	75 8f                	jne    0x14087bfe3
   14087c054:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c059:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087c05e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087c063:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087c067:	48 8d 0d 72 82 dc 01 	lea    rcx,[rip+0x1dc8272]        # 0x1426442e0
   14087c06e:	e8 3d f0 83 ff       	call   0x1400bb0b0
   14087c073:	48 8d 15 4a 2e e3 00 	lea    rdx,[rip+0xe32e4a]        # 0x1416aeec4
   14087c07a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087c07e:	e8 8d 34 7f ff       	call   0x14006f510
   14087c083:	44 0f b7 45 88       	movzx  r8d,WORD PTR [rbp-0x78]
   14087c088:	45 33 c9             	xor    r9d,r9d
   14087c08b:	66 c7 44 24 20 02 00 	mov    WORD PTR [rsp+0x20],0x2
   14087c092:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087c096:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087c09b:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087c09f:	e8 9c 34 ab 00       	call   0x14132f540
   14087c0a4:	48 8d 55 18          	lea    rdx,[rbp+0x18]
   14087c0a8:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087c0ac:	e8 ef db 83 ff       	call   0x1400b9ca0
   14087c0b1:	48 8d 15 d8 d4 d6 00 	lea    rdx,[rip+0xd6d4d8]        # 0x1415e9590
   14087c0b8:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087c0bc:	e8 2f 34 7f ff       	call   0x14006f4f0
   14087c0c1:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087c0c5:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087c0c9:	e8 d2 db 83 ff       	call   0x1400b9ca0
   14087c0ce:	e9 fe 16 00 00       	jmp    0x14087d7d1
   14087c0d3:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087c0d7:	83 fa ff             	cmp    edx,0xffffffff
   14087c0da:	0f 84 d3 00 00 00    	je     0x14087c1b3
   14087c0e0:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087c0e4:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087c0e8:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087c0ed:	45 8b c4             	mov    r8d,r12d
   14087c0f0:	48 8b cb             	mov    rcx,rbx
   14087c0f3:	e8 38 5c 02 00       	call   0x1408a1d30
   14087c0f8:	4c 8d 2d e1 81 dc 01 	lea    r13,[rip+0x1dc81e1]        # 0x1426442e0
   14087c0ff:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c104:	4c 8d 3d cd 0d dd 01 	lea    r15,[rip+0x1dd0dcd]        # 0x14264ced8
   14087c10b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   14087c110:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087c115:	49 8b ff             	mov    rdi,r15
   14087c118:	be 04 00 00 00       	mov    esi,0x4
   14087c11d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087c120:	44 8b c3             	mov    r8d,ebx
   14087c123:	41 8b d6             	mov    edx,r14d
   14087c126:	49 8b cd             	mov    rcx,r13
   14087c129:	e8 82 ef 83 ff       	call   0x1400bb0b0
   14087c12e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c130:	49 8b cd             	mov    rcx,r13
   14087c133:	e8 d8 b9 25 00       	call   0x140ad7b10
   14087c138:	33 d2                	xor    edx,edx
   14087c13a:	48 8d 0d 1f b5 b4 01 	lea    rcx,[rip+0x1b4b51f]        # 0x1423c7660
   14087c141:	e8 da 5d 7f ff       	call   0x140071f20
   14087c146:	84 c0                	test   al,al
   14087c148:	74 0d                	je     0x14087c157
   14087c14a:	41 b0 01             	mov    r8b,0x1
   14087c14d:	33 d2                	xor    edx,edx
   14087c14f:	49 8b cd             	mov    rcx,r13
   14087c152:	e8 c9 ef 83 ff       	call   0x1400bb120
   14087c157:	ff c3                	inc    ebx
   14087c159:	48 83 c7 0c          	add    rdi,0xc
   14087c15d:	48 83 ee 01          	sub    rsi,0x1
   14087c161:	75 bd                	jne    0x14087c120
   14087c163:	41 ff c6             	inc    r14d
   14087c166:	49 83 c7 04          	add    r15,0x4
   14087c16a:	48 8d 05 73 0d dd 01 	lea    rax,[rip+0x1dd0d73]        # 0x14264cee4
   14087c171:	4c 3b f8             	cmp    r15,rax
   14087c174:	7c 9a                	jl     0x14087c110
   14087c176:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c17b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087c180:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087c184:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087c188:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087c18b:	83 fa ff             	cmp    edx,0xffffffff
   14087c18e:	0f 84 d6 00 00 00    	je     0x14087c26a
   14087c194:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087c198:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087c19c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087c1a1:	45 8b c5             	mov    r8d,r13d
   14087c1a4:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087c1a9:	e8 82 5b 02 00       	call   0x1408a1d30
   14087c1ae:	e9 66 01 00 00       	jmp    0x14087c319
   14087c1b3:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087c1b7:	48 8b 0d 42 2e b6 01 	mov    rcx,QWORD PTR [rip+0x1b62e42]        # 0x1423df000
   14087c1be:	e8 5d f2 9e ff       	call   0x14026b420
   14087c1c3:	83 f8 ff             	cmp    eax,0xffffffff
   14087c1c6:	0f 84 2c ff ff ff    	je     0x14087c0f8
   14087c1cc:	48 98                	cdqe
   14087c1ce:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c1d3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087c1d7:	49 c1 e7 04          	shl    r15,0x4
   14087c1db:	48 8d 05 56 a1 dc 01 	lea    rax,[rip+0x1dca156]        # 0x142646338
   14087c1e2:	4c 03 f8             	add    r15,rax
   14087c1e5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087c1eb:	4c 8d 2d ee 80 dc 01 	lea    r13,[rip+0x1dc80ee]        # 0x1426442e0
   14087c1f2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c1f6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087c200:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087c204:	49 8b ff             	mov    rdi,r15
   14087c207:	be 04 00 00 00       	mov    esi,0x4
   14087c20c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c210:	44 8b c3             	mov    r8d,ebx
   14087c213:	41 8b d6             	mov    edx,r14d
   14087c216:	49 8b cd             	mov    rcx,r13
   14087c219:	e8 92 ee 83 ff       	call   0x1400bb0b0
   14087c21e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c220:	49 8b cd             	mov    rcx,r13
   14087c223:	e8 e8 b8 25 00       	call   0x140ad7b10
   14087c228:	33 d2                	xor    edx,edx
   14087c22a:	48 8d 0d 2f b4 b4 01 	lea    rcx,[rip+0x1b4b42f]        # 0x1423c7660
   14087c231:	e8 ea 5c 7f ff       	call   0x140071f20
   14087c236:	84 c0                	test   al,al
   14087c238:	74 0d                	je     0x14087c247
   14087c23a:	41 b0 01             	mov    r8b,0x1
   14087c23d:	33 d2                	xor    edx,edx
   14087c23f:	49 8b cd             	mov    rcx,r13
   14087c242:	e8 d9 ee 83 ff       	call   0x1400bb120
   14087c247:	ff c3                	inc    ebx
   14087c249:	48 83 c7 0c          	add    rdi,0xc
   14087c24d:	48 83 ee 01          	sub    rsi,0x1
   14087c251:	75 bd                	jne    0x14087c210
   14087c253:	41 ff c6             	inc    r14d
   14087c256:	49 83 c7 04          	add    r15,0x4
   14087c25a:	49 83 ec 01          	sub    r12,0x1
   14087c25e:	75 a0                	jne    0x14087c200
   14087c260:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c265:	e9 95 fe ff ff       	jmp    0x14087c0ff
   14087c26a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087c26d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087c272:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087c276:	e8 a5 f1 9e ff       	call   0x14026b420
   14087c27b:	83 f8 ff             	cmp    eax,0xffffffff
   14087c27e:	0f 84 95 00 00 00    	je     0x14087c319
   14087c284:	48 98                	cdqe
   14087c286:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c28b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087c28f:	49 c1 e7 04          	shl    r15,0x4
   14087c293:	48 8d 05 9e a0 dc 01 	lea    rax,[rip+0x1dca09e]        # 0x142646338
   14087c29a:	4c 03 f8             	add    r15,rax
   14087c29d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087c2a3:	41 8b dd             	mov    ebx,r13d
   14087c2a6:	49 8b ff             	mov    rdi,r15
   14087c2a9:	be 04 00 00 00       	mov    esi,0x4
   14087c2ae:	4c 8d 2d 2b 80 dc 01 	lea    r13,[rip+0x1dc802b]        # 0x1426442e0
   14087c2b5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087c2c0:	44 8b c3             	mov    r8d,ebx
   14087c2c3:	41 8b d6             	mov    edx,r14d
   14087c2c6:	49 8b cd             	mov    rcx,r13
   14087c2c9:	e8 e2 ed 83 ff       	call   0x1400bb0b0
   14087c2ce:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c2d0:	49 8b cd             	mov    rcx,r13
   14087c2d3:	e8 38 b8 25 00       	call   0x140ad7b10
   14087c2d8:	33 d2                	xor    edx,edx
   14087c2da:	48 8d 0d 7f b3 b4 01 	lea    rcx,[rip+0x1b4b37f]        # 0x1423c7660
   14087c2e1:	e8 3a 5c 7f ff       	call   0x140071f20
   14087c2e6:	84 c0                	test   al,al
   14087c2e8:	74 0d                	je     0x14087c2f7
   14087c2ea:	41 b0 01             	mov    r8b,0x1
   14087c2ed:	33 d2                	xor    edx,edx
   14087c2ef:	49 8b cd             	mov    rcx,r13
   14087c2f2:	e8 29 ee 83 ff       	call   0x1400bb120
   14087c2f7:	ff c3                	inc    ebx
   14087c2f9:	48 83 c7 0c          	add    rdi,0xc
   14087c2fd:	48 83 ee 01          	sub    rsi,0x1
   14087c301:	75 bd                	jne    0x14087c2c0
   14087c303:	41 ff c6             	inc    r14d
   14087c306:	49 83 c7 04          	add    r15,0x4
   14087c30a:	49 83 ec 01          	sub    r12,0x1
   14087c30e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087c312:	75 8f                	jne    0x14087c2a3
   14087c314:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c319:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087c31e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087c323:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087c327:	48 8d 0d b2 7f dc 01 	lea    rcx,[rip+0x1dc7fb2]        # 0x1426442e0
   14087c32e:	e8 7d ed 83 ff       	call   0x1400bb0b0
   14087c333:	48 8d 15 82 2b e3 00 	lea    rdx,[rip+0xe32b82]        # 0x1416aeebc
   14087c33a:	e9 3b fd ff ff       	jmp    0x14087c07a
   14087c33f:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087c343:	83 fa ff             	cmp    edx,0xffffffff
   14087c346:	0f 84 d7 00 00 00    	je     0x14087c423
   14087c34c:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087c350:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087c354:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087c359:	45 8b c4             	mov    r8d,r12d
   14087c35c:	48 8b cb             	mov    rcx,rbx
   14087c35f:	e8 cc 59 02 00       	call   0x1408a1d30
   14087c364:	4c 8d 2d 75 7f dc 01 	lea    r13,[rip+0x1dc7f75]        # 0x1426442e0
   14087c36b:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c370:	4c 8d 3d 91 0b dd 01 	lea    r15,[rip+0x1dd0b91]        # 0x14264cf08
   14087c377:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087c380:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087c385:	49 8b ff             	mov    rdi,r15
   14087c388:	be 04 00 00 00       	mov    esi,0x4
   14087c38d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087c390:	44 8b c3             	mov    r8d,ebx
   14087c393:	41 8b d6             	mov    edx,r14d
   14087c396:	49 8b cd             	mov    rcx,r13
   14087c399:	e8 12 ed 83 ff       	call   0x1400bb0b0
   14087c39e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c3a0:	49 8b cd             	mov    rcx,r13
   14087c3a3:	e8 68 b7 25 00       	call   0x140ad7b10
   14087c3a8:	33 d2                	xor    edx,edx
   14087c3aa:	48 8d 0d af b2 b4 01 	lea    rcx,[rip+0x1b4b2af]        # 0x1423c7660
   14087c3b1:	e8 6a 5b 7f ff       	call   0x140071f20
   14087c3b6:	84 c0                	test   al,al
   14087c3b8:	74 0d                	je     0x14087c3c7
   14087c3ba:	41 b0 01             	mov    r8b,0x1
   14087c3bd:	33 d2                	xor    edx,edx
   14087c3bf:	49 8b cd             	mov    rcx,r13
   14087c3c2:	e8 59 ed 83 ff       	call   0x1400bb120
   14087c3c7:	ff c3                	inc    ebx
   14087c3c9:	48 83 c7 0c          	add    rdi,0xc
   14087c3cd:	48 83 ee 01          	sub    rsi,0x1
   14087c3d1:	75 bd                	jne    0x14087c390
   14087c3d3:	41 ff c6             	inc    r14d
   14087c3d6:	49 83 c7 04          	add    r15,0x4
   14087c3da:	48 8d 05 33 0b dd 01 	lea    rax,[rip+0x1dd0b33]        # 0x14264cf14
   14087c3e1:	4c 3b f8             	cmp    r15,rax
   14087c3e4:	7c 9a                	jl     0x14087c380
   14087c3e6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c3eb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087c3f0:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087c3f4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087c3f8:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087c3fb:	83 fa ff             	cmp    edx,0xffffffff
   14087c3fe:	0f 84 d6 00 00 00    	je     0x14087c4da
   14087c404:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087c408:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087c40c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087c411:	45 8b c5             	mov    r8d,r13d
   14087c414:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087c419:	e8 12 59 02 00       	call   0x1408a1d30
   14087c41e:	e9 66 01 00 00       	jmp    0x14087c589
   14087c423:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087c427:	48 8b 0d d2 2b b6 01 	mov    rcx,QWORD PTR [rip+0x1b62bd2]        # 0x1423df000
   14087c42e:	e8 ed ef 9e ff       	call   0x14026b420
   14087c433:	83 f8 ff             	cmp    eax,0xffffffff
   14087c436:	0f 84 28 ff ff ff    	je     0x14087c364
   14087c43c:	48 98                	cdqe
   14087c43e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c443:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087c447:	49 c1 e7 04          	shl    r15,0x4
   14087c44b:	48 8d 05 e6 9e dc 01 	lea    rax,[rip+0x1dc9ee6]        # 0x142646338
   14087c452:	4c 03 f8             	add    r15,rax
   14087c455:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087c45b:	4c 8d 2d 7e 7e dc 01 	lea    r13,[rip+0x1dc7e7e]        # 0x1426442e0
   14087c462:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c466:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087c470:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087c474:	49 8b ff             	mov    rdi,r15
   14087c477:	be 04 00 00 00       	mov    esi,0x4
   14087c47c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c480:	44 8b c3             	mov    r8d,ebx
   14087c483:	41 8b d6             	mov    edx,r14d
   14087c486:	49 8b cd             	mov    rcx,r13
   14087c489:	e8 22 ec 83 ff       	call   0x1400bb0b0
   14087c48e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c490:	49 8b cd             	mov    rcx,r13
   14087c493:	e8 78 b6 25 00       	call   0x140ad7b10
   14087c498:	33 d2                	xor    edx,edx
   14087c49a:	48 8d 0d bf b1 b4 01 	lea    rcx,[rip+0x1b4b1bf]        # 0x1423c7660
   14087c4a1:	e8 7a 5a 7f ff       	call   0x140071f20
   14087c4a6:	84 c0                	test   al,al
   14087c4a8:	74 0d                	je     0x14087c4b7
   14087c4aa:	41 b0 01             	mov    r8b,0x1
   14087c4ad:	33 d2                	xor    edx,edx
   14087c4af:	49 8b cd             	mov    rcx,r13
   14087c4b2:	e8 69 ec 83 ff       	call   0x1400bb120
   14087c4b7:	ff c3                	inc    ebx
   14087c4b9:	48 83 c7 0c          	add    rdi,0xc
   14087c4bd:	48 83 ee 01          	sub    rsi,0x1
   14087c4c1:	75 bd                	jne    0x14087c480
   14087c4c3:	41 ff c6             	inc    r14d
   14087c4c6:	49 83 c7 04          	add    r15,0x4
   14087c4ca:	49 83 ec 01          	sub    r12,0x1
   14087c4ce:	75 a0                	jne    0x14087c470
   14087c4d0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c4d5:	e9 91 fe ff ff       	jmp    0x14087c36b
   14087c4da:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087c4dd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087c4e2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087c4e6:	e8 35 ef 9e ff       	call   0x14026b420
   14087c4eb:	83 f8 ff             	cmp    eax,0xffffffff
   14087c4ee:	0f 84 95 00 00 00    	je     0x14087c589
   14087c4f4:	48 98                	cdqe
   14087c4f6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c4fb:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087c4ff:	49 c1 e7 04          	shl    r15,0x4
   14087c503:	48 8d 05 2e 9e dc 01 	lea    rax,[rip+0x1dc9e2e]        # 0x142646338
   14087c50a:	4c 03 f8             	add    r15,rax
   14087c50d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087c513:	41 8b dd             	mov    ebx,r13d
   14087c516:	49 8b ff             	mov    rdi,r15
   14087c519:	be 04 00 00 00       	mov    esi,0x4
   14087c51e:	4c 8d 2d bb 7d dc 01 	lea    r13,[rip+0x1dc7dbb]        # 0x1426442e0
   14087c525:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087c530:	44 8b c3             	mov    r8d,ebx
   14087c533:	41 8b d6             	mov    edx,r14d
   14087c536:	49 8b cd             	mov    rcx,r13
   14087c539:	e8 72 eb 83 ff       	call   0x1400bb0b0
   14087c53e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c540:	49 8b cd             	mov    rcx,r13
   14087c543:	e8 c8 b5 25 00       	call   0x140ad7b10
   14087c548:	33 d2                	xor    edx,edx
   14087c54a:	48 8d 0d 0f b1 b4 01 	lea    rcx,[rip+0x1b4b10f]        # 0x1423c7660
   14087c551:	e8 ca 59 7f ff       	call   0x140071f20
   14087c556:	84 c0                	test   al,al
   14087c558:	74 0d                	je     0x14087c567
   14087c55a:	41 b0 01             	mov    r8b,0x1
   14087c55d:	33 d2                	xor    edx,edx
   14087c55f:	49 8b cd             	mov    rcx,r13
   14087c562:	e8 b9 eb 83 ff       	call   0x1400bb120
   14087c567:	ff c3                	inc    ebx
   14087c569:	48 83 c7 0c          	add    rdi,0xc
   14087c56d:	48 83 ee 01          	sub    rsi,0x1
   14087c571:	75 bd                	jne    0x14087c530
   14087c573:	41 ff c6             	inc    r14d
   14087c576:	49 83 c7 04          	add    r15,0x4
   14087c57a:	49 83 ec 01          	sub    r12,0x1
   14087c57e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087c582:	75 8f                	jne    0x14087c513
   14087c584:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c589:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087c58e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087c593:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087c597:	48 8d 0d 42 7d dc 01 	lea    rcx,[rip+0x1dc7d42]        # 0x1426442e0
   14087c59e:	e8 0d eb 83 ff       	call   0x1400bb0b0
   14087c5a3:	48 8d 15 be 26 e3 00 	lea    rdx,[rip+0xe326be]        # 0x1416aec68
   14087c5aa:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087c5ae:	e8 5d 2f 7f ff       	call   0x14006f510
   14087c5b3:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087c5b7:	e9 ec fa ff ff       	jmp    0x14087c0a8
   14087c5bc:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087c5c0:	83 fa ff             	cmp    edx,0xffffffff
   14087c5c3:	0f 84 da 00 00 00    	je     0x14087c6a3
   14087c5c9:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087c5cd:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087c5d1:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087c5d6:	45 8b c4             	mov    r8d,r12d
   14087c5d9:	48 8b cb             	mov    rcx,rbx
   14087c5dc:	e8 4f 57 02 00       	call   0x1408a1d30
   14087c5e1:	4c 8d 2d f8 7c dc 01 	lea    r13,[rip+0x1dc7cf8]        # 0x1426442e0
   14087c5e8:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c5ed:	4c 8d 3d 44 09 dd 01 	lea    r15,[rip+0x1dd0944]        # 0x14264cf38
   14087c5f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c5f8:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14087c600:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087c605:	49 8b ff             	mov    rdi,r15
   14087c608:	be 04 00 00 00       	mov    esi,0x4
   14087c60d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087c610:	44 8b c3             	mov    r8d,ebx
   14087c613:	41 8b d6             	mov    edx,r14d
   14087c616:	49 8b cd             	mov    rcx,r13
   14087c619:	e8 92 ea 83 ff       	call   0x1400bb0b0
   14087c61e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c620:	49 8b cd             	mov    rcx,r13
   14087c623:	e8 e8 b4 25 00       	call   0x140ad7b10
   14087c628:	33 d2                	xor    edx,edx
   14087c62a:	48 8d 0d 2f b0 b4 01 	lea    rcx,[rip+0x1b4b02f]        # 0x1423c7660
   14087c631:	e8 ea 58 7f ff       	call   0x140071f20
   14087c636:	84 c0                	test   al,al
   14087c638:	74 0d                	je     0x14087c647
   14087c63a:	41 b0 01             	mov    r8b,0x1
   14087c63d:	33 d2                	xor    edx,edx
   14087c63f:	49 8b cd             	mov    rcx,r13
   14087c642:	e8 d9 ea 83 ff       	call   0x1400bb120
   14087c647:	ff c3                	inc    ebx
   14087c649:	48 83 c7 0c          	add    rdi,0xc
   14087c64d:	48 83 ee 01          	sub    rsi,0x1
   14087c651:	75 bd                	jne    0x14087c610
   14087c653:	41 ff c6             	inc    r14d
   14087c656:	49 83 c7 04          	add    r15,0x4
   14087c65a:	48 8d 05 e3 08 dd 01 	lea    rax,[rip+0x1dd08e3]        # 0x14264cf44
   14087c661:	4c 3b f8             	cmp    r15,rax
   14087c664:	7c 9a                	jl     0x14087c600
   14087c666:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c66b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087c670:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087c674:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087c678:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087c67b:	83 fa ff             	cmp    edx,0xffffffff
   14087c67e:	0f 84 d6 00 00 00    	je     0x14087c75a
   14087c684:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087c688:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087c68c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087c691:	45 8b c5             	mov    r8d,r13d
   14087c694:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087c699:	e8 92 56 02 00       	call   0x1408a1d30
   14087c69e:	e9 66 01 00 00       	jmp    0x14087c809
   14087c6a3:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087c6a7:	48 8b 0d 52 29 b6 01 	mov    rcx,QWORD PTR [rip+0x1b62952]        # 0x1423df000
   14087c6ae:	e8 6d ed 9e ff       	call   0x14026b420
   14087c6b3:	83 f8 ff             	cmp    eax,0xffffffff
   14087c6b6:	0f 84 25 ff ff ff    	je     0x14087c5e1
   14087c6bc:	48 98                	cdqe
   14087c6be:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c6c3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087c6c7:	49 c1 e7 04          	shl    r15,0x4
   14087c6cb:	48 8d 05 66 9c dc 01 	lea    rax,[rip+0x1dc9c66]        # 0x142646338
   14087c6d2:	4c 03 f8             	add    r15,rax
   14087c6d5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087c6db:	4c 8d 2d fe 7b dc 01 	lea    r13,[rip+0x1dc7bfe]        # 0x1426442e0
   14087c6e2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c6e6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087c6f0:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087c6f4:	49 8b ff             	mov    rdi,r15
   14087c6f7:	be 04 00 00 00       	mov    esi,0x4
   14087c6fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c700:	44 8b c3             	mov    r8d,ebx
   14087c703:	41 8b d6             	mov    edx,r14d
   14087c706:	49 8b cd             	mov    rcx,r13
   14087c709:	e8 a2 e9 83 ff       	call   0x1400bb0b0
   14087c70e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c710:	49 8b cd             	mov    rcx,r13
   14087c713:	e8 f8 b3 25 00       	call   0x140ad7b10
   14087c718:	33 d2                	xor    edx,edx
   14087c71a:	48 8d 0d 3f af b4 01 	lea    rcx,[rip+0x1b4af3f]        # 0x1423c7660
   14087c721:	e8 fa 57 7f ff       	call   0x140071f20
   14087c726:	84 c0                	test   al,al
   14087c728:	74 0d                	je     0x14087c737
   14087c72a:	41 b0 01             	mov    r8b,0x1
   14087c72d:	33 d2                	xor    edx,edx
   14087c72f:	49 8b cd             	mov    rcx,r13
   14087c732:	e8 e9 e9 83 ff       	call   0x1400bb120
   14087c737:	ff c3                	inc    ebx
   14087c739:	48 83 c7 0c          	add    rdi,0xc
   14087c73d:	48 83 ee 01          	sub    rsi,0x1
   14087c741:	75 bd                	jne    0x14087c700
   14087c743:	41 ff c6             	inc    r14d
   14087c746:	49 83 c7 04          	add    r15,0x4
   14087c74a:	49 83 ec 01          	sub    r12,0x1
   14087c74e:	75 a0                	jne    0x14087c6f0
   14087c750:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c755:	e9 8e fe ff ff       	jmp    0x14087c5e8
   14087c75a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087c75d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087c762:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087c766:	e8 b5 ec 9e ff       	call   0x14026b420
   14087c76b:	83 f8 ff             	cmp    eax,0xffffffff
   14087c76e:	0f 84 95 00 00 00    	je     0x14087c809
   14087c774:	48 98                	cdqe
   14087c776:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c77b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087c77f:	49 c1 e7 04          	shl    r15,0x4
   14087c783:	48 8d 05 ae 9b dc 01 	lea    rax,[rip+0x1dc9bae]        # 0x142646338
   14087c78a:	4c 03 f8             	add    r15,rax
   14087c78d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087c793:	41 8b dd             	mov    ebx,r13d
   14087c796:	49 8b ff             	mov    rdi,r15
   14087c799:	be 04 00 00 00       	mov    esi,0x4
   14087c79e:	4c 8d 2d 3b 7b dc 01 	lea    r13,[rip+0x1dc7b3b]        # 0x1426442e0
   14087c7a5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087c7b0:	44 8b c3             	mov    r8d,ebx
   14087c7b3:	41 8b d6             	mov    edx,r14d
   14087c7b6:	49 8b cd             	mov    rcx,r13
   14087c7b9:	e8 f2 e8 83 ff       	call   0x1400bb0b0
   14087c7be:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c7c0:	49 8b cd             	mov    rcx,r13
   14087c7c3:	e8 48 b3 25 00       	call   0x140ad7b10
   14087c7c8:	33 d2                	xor    edx,edx
   14087c7ca:	48 8d 0d 8f ae b4 01 	lea    rcx,[rip+0x1b4ae8f]        # 0x1423c7660
   14087c7d1:	e8 4a 57 7f ff       	call   0x140071f20
   14087c7d6:	84 c0                	test   al,al
   14087c7d8:	74 0d                	je     0x14087c7e7
   14087c7da:	41 b0 01             	mov    r8b,0x1
   14087c7dd:	33 d2                	xor    edx,edx
   14087c7df:	49 8b cd             	mov    rcx,r13
   14087c7e2:	e8 39 e9 83 ff       	call   0x1400bb120
   14087c7e7:	ff c3                	inc    ebx
   14087c7e9:	48 83 c7 0c          	add    rdi,0xc
   14087c7ed:	48 83 ee 01          	sub    rsi,0x1
   14087c7f1:	75 bd                	jne    0x14087c7b0
   14087c7f3:	41 ff c6             	inc    r14d
   14087c7f6:	49 83 c7 04          	add    r15,0x4
   14087c7fa:	49 83 ec 01          	sub    r12,0x1
   14087c7fe:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087c802:	75 8f                	jne    0x14087c793
   14087c804:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c809:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087c80e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087c813:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087c817:	48 8d 0d c2 7a dc 01 	lea    rcx,[rip+0x1dc7ac2]        # 0x1426442e0
   14087c81e:	e8 8d e8 83 ff       	call   0x1400bb0b0
   14087c823:	48 8d 15 2e 24 e3 00 	lea    rdx,[rip+0xe3242e]        # 0x1416aec58
   14087c82a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087c82e:	e8 dd 2c 7f ff       	call   0x14006f510
   14087c833:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087c837:	e9 6c f8 ff ff       	jmp    0x14087c0a8
   14087c83c:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087c840:	83 fa ff             	cmp    edx,0xffffffff
   14087c843:	0f 84 da 00 00 00    	je     0x14087c923
   14087c849:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087c84d:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087c851:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087c856:	45 8b c4             	mov    r8d,r12d
   14087c859:	48 8b cb             	mov    rcx,rbx
   14087c85c:	e8 cf 54 02 00       	call   0x1408a1d30
   14087c861:	4c 8d 2d 78 7a dc 01 	lea    r13,[rip+0x1dc7a78]        # 0x1426442e0
   14087c868:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c86d:	4c 8d 3d f4 06 dd 01 	lea    r15,[rip+0x1dd06f4]        # 0x14264cf68
   14087c874:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c878:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14087c880:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087c885:	49 8b ff             	mov    rdi,r15
   14087c888:	be 04 00 00 00       	mov    esi,0x4
   14087c88d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087c890:	44 8b c3             	mov    r8d,ebx
   14087c893:	41 8b d6             	mov    edx,r14d
   14087c896:	49 8b cd             	mov    rcx,r13
   14087c899:	e8 12 e8 83 ff       	call   0x1400bb0b0
   14087c89e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c8a0:	49 8b cd             	mov    rcx,r13
   14087c8a3:	e8 68 b2 25 00       	call   0x140ad7b10
   14087c8a8:	33 d2                	xor    edx,edx
   14087c8aa:	48 8d 0d af ad b4 01 	lea    rcx,[rip+0x1b4adaf]        # 0x1423c7660
   14087c8b1:	e8 6a 56 7f ff       	call   0x140071f20
   14087c8b6:	84 c0                	test   al,al
   14087c8b8:	74 0d                	je     0x14087c8c7
   14087c8ba:	41 b0 01             	mov    r8b,0x1
   14087c8bd:	33 d2                	xor    edx,edx
   14087c8bf:	49 8b cd             	mov    rcx,r13
   14087c8c2:	e8 59 e8 83 ff       	call   0x1400bb120
   14087c8c7:	ff c3                	inc    ebx
   14087c8c9:	48 83 c7 0c          	add    rdi,0xc
   14087c8cd:	48 83 ee 01          	sub    rsi,0x1
   14087c8d1:	75 bd                	jne    0x14087c890
   14087c8d3:	41 ff c6             	inc    r14d
   14087c8d6:	49 83 c7 04          	add    r15,0x4
   14087c8da:	48 8d 05 93 06 dd 01 	lea    rax,[rip+0x1dd0693]        # 0x14264cf74
   14087c8e1:	4c 3b f8             	cmp    r15,rax
   14087c8e4:	7c 9a                	jl     0x14087c880
   14087c8e6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c8eb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087c8f0:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087c8f4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087c8f8:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087c8fb:	83 fa ff             	cmp    edx,0xffffffff
   14087c8fe:	0f 84 d6 00 00 00    	je     0x14087c9da
   14087c904:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087c908:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087c90c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087c911:	45 8b c5             	mov    r8d,r13d
   14087c914:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087c919:	e8 12 54 02 00       	call   0x1408a1d30
   14087c91e:	e9 66 01 00 00       	jmp    0x14087ca89
   14087c923:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087c927:	48 8b 0d d2 26 b6 01 	mov    rcx,QWORD PTR [rip+0x1b626d2]        # 0x1423df000
   14087c92e:	e8 ed ea 9e ff       	call   0x14026b420
   14087c933:	83 f8 ff             	cmp    eax,0xffffffff
   14087c936:	0f 84 25 ff ff ff    	je     0x14087c861
   14087c93c:	48 98                	cdqe
   14087c93e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c943:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087c947:	49 c1 e7 04          	shl    r15,0x4
   14087c94b:	48 8d 05 e6 99 dc 01 	lea    rax,[rip+0x1dc99e6]        # 0x142646338
   14087c952:	4c 03 f8             	add    r15,rax
   14087c955:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087c95b:	4c 8d 2d 7e 79 dc 01 	lea    r13,[rip+0x1dc797e]        # 0x1426442e0
   14087c962:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c966:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087c970:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087c974:	49 8b ff             	mov    rdi,r15
   14087c977:	be 04 00 00 00       	mov    esi,0x4
   14087c97c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087c980:	44 8b c3             	mov    r8d,ebx
   14087c983:	41 8b d6             	mov    edx,r14d
   14087c986:	49 8b cd             	mov    rcx,r13
   14087c989:	e8 22 e7 83 ff       	call   0x1400bb0b0
   14087c98e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087c990:	49 8b cd             	mov    rcx,r13
   14087c993:	e8 78 b1 25 00       	call   0x140ad7b10
   14087c998:	33 d2                	xor    edx,edx
   14087c99a:	48 8d 0d bf ac b4 01 	lea    rcx,[rip+0x1b4acbf]        # 0x1423c7660
   14087c9a1:	e8 7a 55 7f ff       	call   0x140071f20
   14087c9a6:	84 c0                	test   al,al
   14087c9a8:	74 0d                	je     0x14087c9b7
   14087c9aa:	41 b0 01             	mov    r8b,0x1
   14087c9ad:	33 d2                	xor    edx,edx
   14087c9af:	49 8b cd             	mov    rcx,r13
   14087c9b2:	e8 69 e7 83 ff       	call   0x1400bb120
   14087c9b7:	ff c3                	inc    ebx
   14087c9b9:	48 83 c7 0c          	add    rdi,0xc
   14087c9bd:	48 83 ee 01          	sub    rsi,0x1
   14087c9c1:	75 bd                	jne    0x14087c980
   14087c9c3:	41 ff c6             	inc    r14d
   14087c9c6:	49 83 c7 04          	add    r15,0x4
   14087c9ca:	49 83 ec 01          	sub    r12,0x1
   14087c9ce:	75 a0                	jne    0x14087c970
   14087c9d0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087c9d5:	e9 8e fe ff ff       	jmp    0x14087c868
   14087c9da:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087c9dd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087c9e2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087c9e6:	e8 35 ea 9e ff       	call   0x14026b420
   14087c9eb:	83 f8 ff             	cmp    eax,0xffffffff
   14087c9ee:	0f 84 95 00 00 00    	je     0x14087ca89
   14087c9f4:	48 98                	cdqe
   14087c9f6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087c9fb:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087c9ff:	49 c1 e7 04          	shl    r15,0x4
   14087ca03:	48 8d 05 2e 99 dc 01 	lea    rax,[rip+0x1dc992e]        # 0x142646338
   14087ca0a:	4c 03 f8             	add    r15,rax
   14087ca0d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087ca13:	41 8b dd             	mov    ebx,r13d
   14087ca16:	49 8b ff             	mov    rdi,r15
   14087ca19:	be 04 00 00 00       	mov    esi,0x4
   14087ca1e:	4c 8d 2d bb 78 dc 01 	lea    r13,[rip+0x1dc78bb]        # 0x1426442e0
   14087ca25:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087ca30:	44 8b c3             	mov    r8d,ebx
   14087ca33:	41 8b d6             	mov    edx,r14d
   14087ca36:	49 8b cd             	mov    rcx,r13
   14087ca39:	e8 72 e6 83 ff       	call   0x1400bb0b0
   14087ca3e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ca40:	49 8b cd             	mov    rcx,r13
   14087ca43:	e8 c8 b0 25 00       	call   0x140ad7b10
   14087ca48:	33 d2                	xor    edx,edx
   14087ca4a:	48 8d 0d 0f ac b4 01 	lea    rcx,[rip+0x1b4ac0f]        # 0x1423c7660
   14087ca51:	e8 ca 54 7f ff       	call   0x140071f20
   14087ca56:	84 c0                	test   al,al
   14087ca58:	74 0d                	je     0x14087ca67
   14087ca5a:	41 b0 01             	mov    r8b,0x1
   14087ca5d:	33 d2                	xor    edx,edx
   14087ca5f:	49 8b cd             	mov    rcx,r13
   14087ca62:	e8 b9 e6 83 ff       	call   0x1400bb120
   14087ca67:	ff c3                	inc    ebx
   14087ca69:	48 83 c7 0c          	add    rdi,0xc
   14087ca6d:	48 83 ee 01          	sub    rsi,0x1
   14087ca71:	75 bd                	jne    0x14087ca30
   14087ca73:	41 ff c6             	inc    r14d
   14087ca76:	49 83 c7 04          	add    r15,0x4
   14087ca7a:	49 83 ec 01          	sub    r12,0x1
   14087ca7e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087ca82:	75 8f                	jne    0x14087ca13
   14087ca84:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087ca89:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087ca8e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087ca93:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087ca97:	48 8d 0d 42 78 dc 01 	lea    rcx,[rip+0x1dc7842]        # 0x1426442e0
   14087ca9e:	e8 0d e6 83 ff       	call   0x1400bb0b0
   14087caa3:	48 8d 15 d6 21 e3 00 	lea    rdx,[rip+0xe321d6]        # 0x1416aec80
   14087caaa:	e9 cb f5 ff ff       	jmp    0x14087c07a
   14087caaf:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087cab3:	83 fa ff             	cmp    edx,0xffffffff
   14087cab6:	0f 84 d7 00 00 00    	je     0x14087cb93
   14087cabc:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087cac0:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087cac4:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087cac9:	45 8b c4             	mov    r8d,r12d
   14087cacc:	48 8b cb             	mov    rcx,rbx
   14087cacf:	e8 5c 52 02 00       	call   0x1408a1d30
   14087cad4:	4c 8d 2d 05 78 dc 01 	lea    r13,[rip+0x1dc7805]        # 0x1426442e0
   14087cadb:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087cae0:	4c 8d 3d b1 04 dd 01 	lea    r15,[rip+0x1dd04b1]        # 0x14264cf98
   14087cae7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087caf0:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087caf5:	49 8b ff             	mov    rdi,r15
   14087caf8:	be 04 00 00 00       	mov    esi,0x4
   14087cafd:	0f 1f 00             	nop    DWORD PTR [rax]
   14087cb00:	44 8b c3             	mov    r8d,ebx
   14087cb03:	41 8b d6             	mov    edx,r14d
   14087cb06:	49 8b cd             	mov    rcx,r13
   14087cb09:	e8 a2 e5 83 ff       	call   0x1400bb0b0
   14087cb0e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087cb10:	49 8b cd             	mov    rcx,r13
   14087cb13:	e8 f8 af 25 00       	call   0x140ad7b10
   14087cb18:	33 d2                	xor    edx,edx
   14087cb1a:	48 8d 0d 3f ab b4 01 	lea    rcx,[rip+0x1b4ab3f]        # 0x1423c7660
   14087cb21:	e8 fa 53 7f ff       	call   0x140071f20
   14087cb26:	84 c0                	test   al,al
   14087cb28:	74 0d                	je     0x14087cb37
   14087cb2a:	41 b0 01             	mov    r8b,0x1
   14087cb2d:	33 d2                	xor    edx,edx
   14087cb2f:	49 8b cd             	mov    rcx,r13
   14087cb32:	e8 e9 e5 83 ff       	call   0x1400bb120
   14087cb37:	ff c3                	inc    ebx
   14087cb39:	48 83 c7 0c          	add    rdi,0xc
   14087cb3d:	48 83 ee 01          	sub    rsi,0x1
   14087cb41:	75 bd                	jne    0x14087cb00
   14087cb43:	41 ff c6             	inc    r14d
   14087cb46:	49 83 c7 04          	add    r15,0x4
   14087cb4a:	48 8d 05 53 04 dd 01 	lea    rax,[rip+0x1dd0453]        # 0x14264cfa4
   14087cb51:	4c 3b f8             	cmp    r15,rax
   14087cb54:	7c 9a                	jl     0x14087caf0
   14087cb56:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087cb5b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087cb60:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087cb64:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087cb68:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087cb6b:	83 fa ff             	cmp    edx,0xffffffff
   14087cb6e:	0f 84 d6 00 00 00    	je     0x14087cc4a
   14087cb74:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087cb78:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087cb7c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087cb81:	45 8b c5             	mov    r8d,r13d
   14087cb84:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087cb89:	e8 a2 51 02 00       	call   0x1408a1d30
   14087cb8e:	e9 66 01 00 00       	jmp    0x14087ccf9
   14087cb93:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087cb97:	48 8b 0d 62 24 b6 01 	mov    rcx,QWORD PTR [rip+0x1b62462]        # 0x1423df000
   14087cb9e:	e8 7d e8 9e ff       	call   0x14026b420
   14087cba3:	83 f8 ff             	cmp    eax,0xffffffff
   14087cba6:	0f 84 28 ff ff ff    	je     0x14087cad4
   14087cbac:	48 98                	cdqe
   14087cbae:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087cbb3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087cbb7:	49 c1 e7 04          	shl    r15,0x4
   14087cbbb:	48 8d 05 76 97 dc 01 	lea    rax,[rip+0x1dc9776]        # 0x142646338
   14087cbc2:	4c 03 f8             	add    r15,rax
   14087cbc5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087cbcb:	4c 8d 2d 0e 77 dc 01 	lea    r13,[rip+0x1dc770e]        # 0x1426442e0
   14087cbd2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087cbd6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087cbe0:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087cbe4:	49 8b ff             	mov    rdi,r15
   14087cbe7:	be 04 00 00 00       	mov    esi,0x4
   14087cbec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087cbf0:	44 8b c3             	mov    r8d,ebx
   14087cbf3:	41 8b d6             	mov    edx,r14d
   14087cbf6:	49 8b cd             	mov    rcx,r13
   14087cbf9:	e8 b2 e4 83 ff       	call   0x1400bb0b0
   14087cbfe:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087cc00:	49 8b cd             	mov    rcx,r13
   14087cc03:	e8 08 af 25 00       	call   0x140ad7b10
   14087cc08:	33 d2                	xor    edx,edx
   14087cc0a:	48 8d 0d 4f aa b4 01 	lea    rcx,[rip+0x1b4aa4f]        # 0x1423c7660
   14087cc11:	e8 0a 53 7f ff       	call   0x140071f20
   14087cc16:	84 c0                	test   al,al
   14087cc18:	74 0d                	je     0x14087cc27
   14087cc1a:	41 b0 01             	mov    r8b,0x1
   14087cc1d:	33 d2                	xor    edx,edx
   14087cc1f:	49 8b cd             	mov    rcx,r13
   14087cc22:	e8 f9 e4 83 ff       	call   0x1400bb120
   14087cc27:	ff c3                	inc    ebx
   14087cc29:	48 83 c7 0c          	add    rdi,0xc
   14087cc2d:	48 83 ee 01          	sub    rsi,0x1
   14087cc31:	75 bd                	jne    0x14087cbf0
   14087cc33:	41 ff c6             	inc    r14d
   14087cc36:	49 83 c7 04          	add    r15,0x4
   14087cc3a:	49 83 ec 01          	sub    r12,0x1
   14087cc3e:	75 a0                	jne    0x14087cbe0
   14087cc40:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087cc45:	e9 91 fe ff ff       	jmp    0x14087cadb
   14087cc4a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087cc4d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087cc52:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087cc56:	e8 c5 e7 9e ff       	call   0x14026b420
   14087cc5b:	83 f8 ff             	cmp    eax,0xffffffff
   14087cc5e:	0f 84 95 00 00 00    	je     0x14087ccf9
   14087cc64:	48 98                	cdqe
   14087cc66:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087cc6b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087cc6f:	49 c1 e7 04          	shl    r15,0x4
   14087cc73:	48 8d 05 be 96 dc 01 	lea    rax,[rip+0x1dc96be]        # 0x142646338
   14087cc7a:	4c 03 f8             	add    r15,rax
   14087cc7d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087cc83:	41 8b dd             	mov    ebx,r13d
   14087cc86:	49 8b ff             	mov    rdi,r15
   14087cc89:	be 04 00 00 00       	mov    esi,0x4
   14087cc8e:	4c 8d 2d 4b 76 dc 01 	lea    r13,[rip+0x1dc764b]        # 0x1426442e0
   14087cc95:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087cca0:	44 8b c3             	mov    r8d,ebx
   14087cca3:	41 8b d6             	mov    edx,r14d
   14087cca6:	49 8b cd             	mov    rcx,r13
   14087cca9:	e8 02 e4 83 ff       	call   0x1400bb0b0
   14087ccae:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ccb0:	49 8b cd             	mov    rcx,r13
   14087ccb3:	e8 58 ae 25 00       	call   0x140ad7b10
   14087ccb8:	33 d2                	xor    edx,edx
   14087ccba:	48 8d 0d 9f a9 b4 01 	lea    rcx,[rip+0x1b4a99f]        # 0x1423c7660
   14087ccc1:	e8 5a 52 7f ff       	call   0x140071f20
   14087ccc6:	84 c0                	test   al,al
   14087ccc8:	74 0d                	je     0x14087ccd7
   14087ccca:	41 b0 01             	mov    r8b,0x1
   14087cccd:	33 d2                	xor    edx,edx
   14087cccf:	49 8b cd             	mov    rcx,r13
   14087ccd2:	e8 49 e4 83 ff       	call   0x1400bb120
   14087ccd7:	ff c3                	inc    ebx
   14087ccd9:	48 83 c7 0c          	add    rdi,0xc
   14087ccdd:	48 83 ee 01          	sub    rsi,0x1
   14087cce1:	75 bd                	jne    0x14087cca0
   14087cce3:	41 ff c6             	inc    r14d
   14087cce6:	49 83 c7 04          	add    r15,0x4
   14087ccea:	49 83 ec 01          	sub    r12,0x1
   14087ccee:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087ccf2:	75 8f                	jne    0x14087cc83
   14087ccf4:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087ccf9:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087ccfe:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087cd03:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087cd07:	48 8d 0d d2 75 dc 01 	lea    rcx,[rip+0x1dc75d2]        # 0x1426442e0
   14087cd0e:	e8 9d e3 83 ff       	call   0x1400bb0b0
   14087cd13:	48 8d 15 5e 1f e3 00 	lea    rdx,[rip+0xe31f5e]        # 0x1416aec78
   14087cd1a:	e9 5b f3 ff ff       	jmp    0x14087c07a
   14087cd1f:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087cd23:	83 fa ff             	cmp    edx,0xffffffff
   14087cd26:	0f 84 d7 00 00 00    	je     0x14087ce03
   14087cd2c:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087cd30:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087cd34:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087cd39:	45 8b c4             	mov    r8d,r12d
   14087cd3c:	48 8b cb             	mov    rcx,rbx
   14087cd3f:	e8 ec 4f 02 00       	call   0x1408a1d30
   14087cd44:	4c 8d 2d 95 75 dc 01 	lea    r13,[rip+0x1dc7595]        # 0x1426442e0
   14087cd4b:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087cd50:	4c 8d 3d 71 02 dd 01 	lea    r15,[rip+0x1dd0271]        # 0x14264cfc8
   14087cd57:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087cd60:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087cd65:	49 8b ff             	mov    rdi,r15
   14087cd68:	be 04 00 00 00       	mov    esi,0x4
   14087cd6d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087cd70:	44 8b c3             	mov    r8d,ebx
   14087cd73:	41 8b d6             	mov    edx,r14d
   14087cd76:	49 8b cd             	mov    rcx,r13
   14087cd79:	e8 32 e3 83 ff       	call   0x1400bb0b0
   14087cd7e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087cd80:	49 8b cd             	mov    rcx,r13
   14087cd83:	e8 88 ad 25 00       	call   0x140ad7b10
   14087cd88:	33 d2                	xor    edx,edx
   14087cd8a:	48 8d 0d cf a8 b4 01 	lea    rcx,[rip+0x1b4a8cf]        # 0x1423c7660
   14087cd91:	e8 8a 51 7f ff       	call   0x140071f20
   14087cd96:	84 c0                	test   al,al
   14087cd98:	74 0d                	je     0x14087cda7
   14087cd9a:	41 b0 01             	mov    r8b,0x1
   14087cd9d:	33 d2                	xor    edx,edx
   14087cd9f:	49 8b cd             	mov    rcx,r13
   14087cda2:	e8 79 e3 83 ff       	call   0x1400bb120
   14087cda7:	ff c3                	inc    ebx
   14087cda9:	48 83 c7 0c          	add    rdi,0xc
   14087cdad:	48 83 ee 01          	sub    rsi,0x1
   14087cdb1:	75 bd                	jne    0x14087cd70
   14087cdb3:	41 ff c6             	inc    r14d
   14087cdb6:	49 83 c7 04          	add    r15,0x4
   14087cdba:	48 8d 05 13 02 dd 01 	lea    rax,[rip+0x1dd0213]        # 0x14264cfd4
   14087cdc1:	4c 3b f8             	cmp    r15,rax
   14087cdc4:	7c 9a                	jl     0x14087cd60
   14087cdc6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087cdcb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087cdd0:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087cdd4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087cdd8:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087cddb:	83 fa ff             	cmp    edx,0xffffffff
   14087cdde:	0f 84 d6 00 00 00    	je     0x14087ceba
   14087cde4:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087cde8:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087cdec:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087cdf1:	45 8b c5             	mov    r8d,r13d
   14087cdf4:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087cdf9:	e8 32 4f 02 00       	call   0x1408a1d30
   14087cdfe:	e9 66 01 00 00       	jmp    0x14087cf69
   14087ce03:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087ce07:	48 8b 0d f2 21 b6 01 	mov    rcx,QWORD PTR [rip+0x1b621f2]        # 0x1423df000
   14087ce0e:	e8 0d e6 9e ff       	call   0x14026b420
   14087ce13:	83 f8 ff             	cmp    eax,0xffffffff
   14087ce16:	0f 84 28 ff ff ff    	je     0x14087cd44
   14087ce1c:	48 98                	cdqe
   14087ce1e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087ce23:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087ce27:	49 c1 e7 04          	shl    r15,0x4
   14087ce2b:	48 8d 05 06 95 dc 01 	lea    rax,[rip+0x1dc9506]        # 0x142646338
   14087ce32:	4c 03 f8             	add    r15,rax
   14087ce35:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087ce3b:	4c 8d 2d 9e 74 dc 01 	lea    r13,[rip+0x1dc749e]        # 0x1426442e0
   14087ce42:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087ce46:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087ce50:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087ce54:	49 8b ff             	mov    rdi,r15
   14087ce57:	be 04 00 00 00       	mov    esi,0x4
   14087ce5c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087ce60:	44 8b c3             	mov    r8d,ebx
   14087ce63:	41 8b d6             	mov    edx,r14d
   14087ce66:	49 8b cd             	mov    rcx,r13
   14087ce69:	e8 42 e2 83 ff       	call   0x1400bb0b0
   14087ce6e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087ce70:	49 8b cd             	mov    rcx,r13
   14087ce73:	e8 98 ac 25 00       	call   0x140ad7b10
   14087ce78:	33 d2                	xor    edx,edx
   14087ce7a:	48 8d 0d df a7 b4 01 	lea    rcx,[rip+0x1b4a7df]        # 0x1423c7660
   14087ce81:	e8 9a 50 7f ff       	call   0x140071f20
   14087ce86:	84 c0                	test   al,al
   14087ce88:	74 0d                	je     0x14087ce97
   14087ce8a:	41 b0 01             	mov    r8b,0x1
   14087ce8d:	33 d2                	xor    edx,edx
   14087ce8f:	49 8b cd             	mov    rcx,r13
   14087ce92:	e8 89 e2 83 ff       	call   0x1400bb120
   14087ce97:	ff c3                	inc    ebx
   14087ce99:	48 83 c7 0c          	add    rdi,0xc
   14087ce9d:	48 83 ee 01          	sub    rsi,0x1
   14087cea1:	75 bd                	jne    0x14087ce60
   14087cea3:	41 ff c6             	inc    r14d
   14087cea6:	49 83 c7 04          	add    r15,0x4
   14087ceaa:	49 83 ec 01          	sub    r12,0x1
   14087ceae:	75 a0                	jne    0x14087ce50
   14087ceb0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087ceb5:	e9 91 fe ff ff       	jmp    0x14087cd4b
   14087ceba:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087cebd:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087cec2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087cec6:	e8 55 e5 9e ff       	call   0x14026b420
   14087cecb:	83 f8 ff             	cmp    eax,0xffffffff
   14087cece:	0f 84 95 00 00 00    	je     0x14087cf69
   14087ced4:	48 98                	cdqe
   14087ced6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087cedb:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087cedf:	49 c1 e7 04          	shl    r15,0x4
   14087cee3:	48 8d 05 4e 94 dc 01 	lea    rax,[rip+0x1dc944e]        # 0x142646338
   14087ceea:	4c 03 f8             	add    r15,rax
   14087ceed:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087cef3:	41 8b dd             	mov    ebx,r13d
   14087cef6:	49 8b ff             	mov    rdi,r15
   14087cef9:	be 04 00 00 00       	mov    esi,0x4
   14087cefe:	4c 8d 2d db 73 dc 01 	lea    r13,[rip+0x1dc73db]        # 0x1426442e0
   14087cf05:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087cf10:	44 8b c3             	mov    r8d,ebx
   14087cf13:	41 8b d6             	mov    edx,r14d
   14087cf16:	49 8b cd             	mov    rcx,r13
   14087cf19:	e8 92 e1 83 ff       	call   0x1400bb0b0
   14087cf1e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087cf20:	49 8b cd             	mov    rcx,r13
   14087cf23:	e8 e8 ab 25 00       	call   0x140ad7b10
   14087cf28:	33 d2                	xor    edx,edx
   14087cf2a:	48 8d 0d 2f a7 b4 01 	lea    rcx,[rip+0x1b4a72f]        # 0x1423c7660
   14087cf31:	e8 ea 4f 7f ff       	call   0x140071f20
   14087cf36:	84 c0                	test   al,al
   14087cf38:	74 0d                	je     0x14087cf47
   14087cf3a:	41 b0 01             	mov    r8b,0x1
   14087cf3d:	33 d2                	xor    edx,edx
   14087cf3f:	49 8b cd             	mov    rcx,r13
   14087cf42:	e8 d9 e1 83 ff       	call   0x1400bb120
   14087cf47:	ff c3                	inc    ebx
   14087cf49:	48 83 c7 0c          	add    rdi,0xc
   14087cf4d:	48 83 ee 01          	sub    rsi,0x1
   14087cf51:	75 bd                	jne    0x14087cf10
   14087cf53:	41 ff c6             	inc    r14d
   14087cf56:	49 83 c7 04          	add    r15,0x4
   14087cf5a:	49 83 ec 01          	sub    r12,0x1
   14087cf5e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087cf62:	75 8f                	jne    0x14087cef3
   14087cf64:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087cf69:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087cf6e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087cf73:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087cf77:	48 8d 0d 62 73 dc 01 	lea    rcx,[rip+0x1dc7362]        # 0x1426442e0
   14087cf7e:	e8 2d e1 83 ff       	call   0x1400bb0b0
   14087cf83:	48 8d 15 96 1c e3 00 	lea    rdx,[rip+0xe31c96]        # 0x1416aec20
   14087cf8a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087cf8e:	e8 7d 25 7f ff       	call   0x14006f510
   14087cf93:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14087cf97:	44 0f b7 40 10       	movzx  r8d,WORD PTR [rax+0x10]
   14087cf9c:	e9 e7 f0 ff ff       	jmp    0x14087c088
   14087cfa1:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087cfa5:	83 fa ff             	cmp    edx,0xffffffff
   14087cfa8:	0f 84 d5 00 00 00    	je     0x14087d083
   14087cfae:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087cfb2:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087cfb6:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087cfbb:	45 8b c4             	mov    r8d,r12d
   14087cfbe:	48 8b cb             	mov    rcx,rbx
   14087cfc1:	e8 6a 4d 02 00       	call   0x1408a1d30
   14087cfc6:	4c 8d 2d 13 73 dc 01 	lea    r13,[rip+0x1dc7313]        # 0x1426442e0
   14087cfcd:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087cfd2:	4c 8d 3d 1f 00 dd 01 	lea    r15,[rip+0x1dd001f]        # 0x14264cff8
   14087cfd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   14087cfe0:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087cfe5:	49 8b ff             	mov    rdi,r15
   14087cfe8:	be 04 00 00 00       	mov    esi,0x4
   14087cfed:	0f 1f 00             	nop    DWORD PTR [rax]
   14087cff0:	44 8b c3             	mov    r8d,ebx
   14087cff3:	41 8b d6             	mov    edx,r14d
   14087cff6:	49 8b cd             	mov    rcx,r13
   14087cff9:	e8 b2 e0 83 ff       	call   0x1400bb0b0
   14087cffe:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d000:	49 8b cd             	mov    rcx,r13
   14087d003:	e8 08 ab 25 00       	call   0x140ad7b10
   14087d008:	33 d2                	xor    edx,edx
   14087d00a:	48 8d 0d 4f a6 b4 01 	lea    rcx,[rip+0x1b4a64f]        # 0x1423c7660
   14087d011:	e8 0a 4f 7f ff       	call   0x140071f20
   14087d016:	84 c0                	test   al,al
   14087d018:	74 0d                	je     0x14087d027
   14087d01a:	41 b0 01             	mov    r8b,0x1
   14087d01d:	33 d2                	xor    edx,edx
   14087d01f:	49 8b cd             	mov    rcx,r13
   14087d022:	e8 f9 e0 83 ff       	call   0x1400bb120
   14087d027:	ff c3                	inc    ebx
   14087d029:	48 83 c7 0c          	add    rdi,0xc
   14087d02d:	48 83 ee 01          	sub    rsi,0x1
   14087d031:	75 bd                	jne    0x14087cff0
   14087d033:	41 ff c6             	inc    r14d
   14087d036:	49 83 c7 04          	add    r15,0x4
   14087d03a:	48 8d 05 c3 ff dc 01 	lea    rax,[rip+0x1dcffc3]        # 0x14264d004
   14087d041:	4c 3b f8             	cmp    r15,rax
   14087d044:	7c 9a                	jl     0x14087cfe0
   14087d046:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d04b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087d050:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087d054:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087d058:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087d05b:	83 fa ff             	cmp    edx,0xffffffff
   14087d05e:	0f 84 d6 00 00 00    	je     0x14087d13a
   14087d064:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087d068:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087d06c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087d071:	45 8b c5             	mov    r8d,r13d
   14087d074:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087d079:	e8 b2 4c 02 00       	call   0x1408a1d30
   14087d07e:	e9 66 01 00 00       	jmp    0x14087d1e9
   14087d083:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087d087:	48 8b 0d 72 1f b6 01 	mov    rcx,QWORD PTR [rip+0x1b61f72]        # 0x1423df000
   14087d08e:	e8 8d e3 9e ff       	call   0x14026b420
   14087d093:	83 f8 ff             	cmp    eax,0xffffffff
   14087d096:	0f 84 2a ff ff ff    	je     0x14087cfc6
   14087d09c:	48 98                	cdqe
   14087d09e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087d0a3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087d0a7:	49 c1 e7 04          	shl    r15,0x4
   14087d0ab:	48 8d 05 86 92 dc 01 	lea    rax,[rip+0x1dc9286]        # 0x142646338
   14087d0b2:	4c 03 f8             	add    r15,rax
   14087d0b5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087d0bb:	4c 8d 2d 1e 72 dc 01 	lea    r13,[rip+0x1dc721e]        # 0x1426442e0
   14087d0c2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d0c6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087d0d0:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087d0d4:	49 8b ff             	mov    rdi,r15
   14087d0d7:	be 04 00 00 00       	mov    esi,0x4
   14087d0dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d0e0:	44 8b c3             	mov    r8d,ebx
   14087d0e3:	41 8b d6             	mov    edx,r14d
   14087d0e6:	49 8b cd             	mov    rcx,r13
   14087d0e9:	e8 c2 df 83 ff       	call   0x1400bb0b0
   14087d0ee:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d0f0:	49 8b cd             	mov    rcx,r13
   14087d0f3:	e8 18 aa 25 00       	call   0x140ad7b10
   14087d0f8:	33 d2                	xor    edx,edx
   14087d0fa:	48 8d 0d 5f a5 b4 01 	lea    rcx,[rip+0x1b4a55f]        # 0x1423c7660
   14087d101:	e8 1a 4e 7f ff       	call   0x140071f20
   14087d106:	84 c0                	test   al,al
   14087d108:	74 0d                	je     0x14087d117
   14087d10a:	41 b0 01             	mov    r8b,0x1
   14087d10d:	33 d2                	xor    edx,edx
   14087d10f:	49 8b cd             	mov    rcx,r13
   14087d112:	e8 09 e0 83 ff       	call   0x1400bb120
   14087d117:	ff c3                	inc    ebx
   14087d119:	48 83 c7 0c          	add    rdi,0xc
   14087d11d:	48 83 ee 01          	sub    rsi,0x1
   14087d121:	75 bd                	jne    0x14087d0e0
   14087d123:	41 ff c6             	inc    r14d
   14087d126:	49 83 c7 04          	add    r15,0x4
   14087d12a:	49 83 ec 01          	sub    r12,0x1
   14087d12e:	75 a0                	jne    0x14087d0d0
   14087d130:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d135:	e9 93 fe ff ff       	jmp    0x14087cfcd
   14087d13a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087d13d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087d142:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087d146:	e8 d5 e2 9e ff       	call   0x14026b420
   14087d14b:	83 f8 ff             	cmp    eax,0xffffffff
   14087d14e:	0f 84 95 00 00 00    	je     0x14087d1e9
   14087d154:	48 98                	cdqe
   14087d156:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087d15b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087d15f:	49 c1 e7 04          	shl    r15,0x4
   14087d163:	48 8d 05 ce 91 dc 01 	lea    rax,[rip+0x1dc91ce]        # 0x142646338
   14087d16a:	4c 03 f8             	add    r15,rax
   14087d16d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087d173:	41 8b dd             	mov    ebx,r13d
   14087d176:	49 8b ff             	mov    rdi,r15
   14087d179:	be 04 00 00 00       	mov    esi,0x4
   14087d17e:	4c 8d 2d 5b 71 dc 01 	lea    r13,[rip+0x1dc715b]        # 0x1426442e0
   14087d185:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087d190:	44 8b c3             	mov    r8d,ebx
   14087d193:	41 8b d6             	mov    edx,r14d
   14087d196:	49 8b cd             	mov    rcx,r13
   14087d199:	e8 12 df 83 ff       	call   0x1400bb0b0
   14087d19e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d1a0:	49 8b cd             	mov    rcx,r13
   14087d1a3:	e8 68 a9 25 00       	call   0x140ad7b10
   14087d1a8:	33 d2                	xor    edx,edx
   14087d1aa:	48 8d 0d af a4 b4 01 	lea    rcx,[rip+0x1b4a4af]        # 0x1423c7660
   14087d1b1:	e8 6a 4d 7f ff       	call   0x140071f20
   14087d1b6:	84 c0                	test   al,al
   14087d1b8:	74 0d                	je     0x14087d1c7
   14087d1ba:	41 b0 01             	mov    r8b,0x1
   14087d1bd:	33 d2                	xor    edx,edx
   14087d1bf:	49 8b cd             	mov    rcx,r13
   14087d1c2:	e8 59 df 83 ff       	call   0x1400bb120
   14087d1c7:	ff c3                	inc    ebx
   14087d1c9:	48 83 c7 0c          	add    rdi,0xc
   14087d1cd:	48 83 ee 01          	sub    rsi,0x1
   14087d1d1:	75 bd                	jne    0x14087d190
   14087d1d3:	41 ff c6             	inc    r14d
   14087d1d6:	49 83 c7 04          	add    r15,0x4
   14087d1da:	49 83 ec 01          	sub    r12,0x1
   14087d1de:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087d1e2:	75 8f                	jne    0x14087d173
   14087d1e4:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d1e9:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087d1ee:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087d1f3:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d1f7:	48 8d 0d e2 70 dc 01 	lea    rcx,[rip+0x1dc70e2]        # 0x1426442e0
   14087d1fe:	e8 ad de 83 ff       	call   0x1400bb0b0
   14087d203:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14087d207:	0f bf 48 1c          	movsx  ecx,WORD PTR [rax+0x1c]
   14087d20b:	80 78 1e 00          	cmp    BYTE PTR [rax+0x1e],0x0
   14087d20f:	7e 68                	jle    0x14087d279
   14087d211:	85 c9                	test   ecx,ecx
   14087d213:	74 5b                	je     0x14087d270
   14087d215:	83 e9 01             	sub    ecx,0x1
   14087d218:	74 56                	je     0x14087d270
   14087d21a:	83 e9 01             	sub    ecx,0x1
   14087d21d:	74 48                	je     0x14087d267
   14087d21f:	83 f9 01             	cmp    ecx,0x1
   14087d222:	0f 85 a9 05 00 00    	jne    0x14087d7d1
   14087d228:	48 8d 15 11 1a e3 00 	lea    rdx,[rip+0xe31a11]        # 0x1416aec40
   14087d22f:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d233:	e8 d8 22 7f ff       	call   0x14006f510
   14087d238:	48 8d 55 78          	lea    rdx,[rbp+0x78]
   14087d23c:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d240:	e8 5b ca 83 ff       	call   0x1400b9ca0
   14087d245:	48 8d 15 f8 b6 d6 00 	lea    rdx,[rip+0xd6b6f8]        # 0x1415e8944
   14087d24c:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d250:	e8 9b 22 7f ff       	call   0x14006f4f0
   14087d255:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087d259:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d25d:	e8 3e ca 83 ff       	call   0x1400b9ca0
   14087d262:	e9 6a 05 00 00       	jmp    0x14087d7d1
   14087d267:	48 8d 15 9a 19 e3 00 	lea    rdx,[rip+0xe3199a]        # 0x1416aec08
   14087d26e:	eb bf                	jmp    0x14087d22f
   14087d270:	48 8d 15 b1 19 e3 00 	lea    rdx,[rip+0xe319b1]        # 0x1416aec28
   14087d277:	eb b6                	jmp    0x14087d22f
   14087d279:	85 c9                	test   ecx,ecx
   14087d27b:	74 25                	je     0x14087d2a2
   14087d27d:	83 e9 01             	sub    ecx,0x1
   14087d280:	74 20                	je     0x14087d2a2
   14087d282:	83 e9 01             	sub    ecx,0x1
   14087d285:	74 12                	je     0x14087d299
   14087d287:	83 f9 01             	cmp    ecx,0x1
   14087d28a:	0f 85 41 05 00 00    	jne    0x14087d7d1
   14087d290:	48 8d 15 31 1a e3 00 	lea    rdx,[rip+0xe31a31]        # 0x1416aecc8
   14087d297:	eb 10                	jmp    0x14087d2a9
   14087d299:	48 8d 15 40 1a e3 00 	lea    rdx,[rip+0xe31a40]        # 0x1416aece0
   14087d2a0:	eb 07                	jmp    0x14087d2a9
   14087d2a2:	48 8d 15 57 1a e3 00 	lea    rdx,[rip+0xe31a57]        # 0x1416aed00
   14087d2a9:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d2ad:	e8 5e 22 7f ff       	call   0x14006f510
   14087d2b2:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087d2b6:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d2ba:	e8 e1 c9 83 ff       	call   0x1400b9ca0
   14087d2bf:	48 8d 15 7e b6 d6 00 	lea    rdx,[rip+0xd6b67e]        # 0x1415e8944
   14087d2c6:	e9 ed ed ff ff       	jmp    0x14087c0b8
   14087d2cb:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087d2cf:	83 fa ff             	cmp    edx,0xffffffff
   14087d2d2:	0f 84 db 00 00 00    	je     0x14087d3b3
   14087d2d8:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087d2dc:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087d2e0:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087d2e5:	45 8b c4             	mov    r8d,r12d
   14087d2e8:	48 8b cb             	mov    rcx,rbx
   14087d2eb:	e8 40 4a 02 00       	call   0x1408a1d30
   14087d2f0:	4c 8d 2d e9 6f dc 01 	lea    r13,[rip+0x1dc6fe9]        # 0x1426442e0
   14087d2f7:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087d2fc:	4c 8d 3d 25 fd dc 01 	lea    r15,[rip+0x1dcfd25]        # 0x14264d028
   14087d303:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d307:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14087d310:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087d315:	49 8b ff             	mov    rdi,r15
   14087d318:	be 04 00 00 00       	mov    esi,0x4
   14087d31d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087d320:	44 8b c3             	mov    r8d,ebx
   14087d323:	41 8b d6             	mov    edx,r14d
   14087d326:	49 8b cd             	mov    rcx,r13
   14087d329:	e8 82 dd 83 ff       	call   0x1400bb0b0
   14087d32e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d330:	49 8b cd             	mov    rcx,r13
   14087d333:	e8 d8 a7 25 00       	call   0x140ad7b10
   14087d338:	33 d2                	xor    edx,edx
   14087d33a:	48 8d 0d 1f a3 b4 01 	lea    rcx,[rip+0x1b4a31f]        # 0x1423c7660
   14087d341:	e8 da 4b 7f ff       	call   0x140071f20
   14087d346:	84 c0                	test   al,al
   14087d348:	74 0d                	je     0x14087d357
   14087d34a:	41 b0 01             	mov    r8b,0x1
   14087d34d:	33 d2                	xor    edx,edx
   14087d34f:	49 8b cd             	mov    rcx,r13
   14087d352:	e8 c9 dd 83 ff       	call   0x1400bb120
   14087d357:	ff c3                	inc    ebx
   14087d359:	48 83 c7 0c          	add    rdi,0xc
   14087d35d:	48 83 ee 01          	sub    rsi,0x1
   14087d361:	75 bd                	jne    0x14087d320
   14087d363:	41 ff c6             	inc    r14d
   14087d366:	49 83 c7 04          	add    r15,0x4
   14087d36a:	48 8d 05 c3 fc dc 01 	lea    rax,[rip+0x1dcfcc3]        # 0x14264d034
   14087d371:	4c 3b f8             	cmp    r15,rax
   14087d374:	7c 9a                	jl     0x14087d310
   14087d376:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d37b:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087d380:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087d384:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087d388:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087d38b:	83 fa ff             	cmp    edx,0xffffffff
   14087d38e:	0f 84 d6 00 00 00    	je     0x14087d46a
   14087d394:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087d398:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087d39c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087d3a1:	45 8b c5             	mov    r8d,r13d
   14087d3a4:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087d3a9:	e8 82 49 02 00       	call   0x1408a1d30
   14087d3ae:	e9 66 01 00 00       	jmp    0x14087d519
   14087d3b3:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087d3b7:	48 8b 0d 42 1c b6 01 	mov    rcx,QWORD PTR [rip+0x1b61c42]        # 0x1423df000
   14087d3be:	e8 5d e0 9e ff       	call   0x14026b420
   14087d3c3:	83 f8 ff             	cmp    eax,0xffffffff
   14087d3c6:	0f 84 24 ff ff ff    	je     0x14087d2f0
   14087d3cc:	48 98                	cdqe
   14087d3ce:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087d3d3:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087d3d7:	49 c1 e7 04          	shl    r15,0x4
   14087d3db:	48 8d 05 56 8f dc 01 	lea    rax,[rip+0x1dc8f56]        # 0x142646338
   14087d3e2:	4c 03 f8             	add    r15,rax
   14087d3e5:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087d3eb:	4c 8d 2d ee 6e dc 01 	lea    r13,[rip+0x1dc6eee]        # 0x1426442e0
   14087d3f2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d3f6:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087d400:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087d404:	49 8b ff             	mov    rdi,r15
   14087d407:	be 04 00 00 00       	mov    esi,0x4
   14087d40c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d410:	44 8b c3             	mov    r8d,ebx
   14087d413:	41 8b d6             	mov    edx,r14d
   14087d416:	49 8b cd             	mov    rcx,r13
   14087d419:	e8 92 dc 83 ff       	call   0x1400bb0b0
   14087d41e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d420:	49 8b cd             	mov    rcx,r13
   14087d423:	e8 e8 a6 25 00       	call   0x140ad7b10
   14087d428:	33 d2                	xor    edx,edx
   14087d42a:	48 8d 0d 2f a2 b4 01 	lea    rcx,[rip+0x1b4a22f]        # 0x1423c7660
   14087d431:	e8 ea 4a 7f ff       	call   0x140071f20
   14087d436:	84 c0                	test   al,al
   14087d438:	74 0d                	je     0x14087d447
   14087d43a:	41 b0 01             	mov    r8b,0x1
   14087d43d:	33 d2                	xor    edx,edx
   14087d43f:	49 8b cd             	mov    rcx,r13
   14087d442:	e8 d9 dc 83 ff       	call   0x1400bb120
   14087d447:	ff c3                	inc    ebx
   14087d449:	48 83 c7 0c          	add    rdi,0xc
   14087d44d:	48 83 ee 01          	sub    rsi,0x1
   14087d451:	75 bd                	jne    0x14087d410
   14087d453:	41 ff c6             	inc    r14d
   14087d456:	49 83 c7 04          	add    r15,0x4
   14087d45a:	49 83 ec 01          	sub    r12,0x1
   14087d45e:	75 a0                	jne    0x14087d400
   14087d460:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d465:	e9 8d fe ff ff       	jmp    0x14087d2f7
   14087d46a:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087d46d:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087d472:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087d476:	e8 a5 df 9e ff       	call   0x14026b420
   14087d47b:	83 f8 ff             	cmp    eax,0xffffffff
   14087d47e:	0f 84 95 00 00 00    	je     0x14087d519
   14087d484:	48 98                	cdqe
   14087d486:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087d48b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087d48f:	49 c1 e7 04          	shl    r15,0x4
   14087d493:	48 8d 05 9e 8e dc 01 	lea    rax,[rip+0x1dc8e9e]        # 0x142646338
   14087d49a:	4c 03 f8             	add    r15,rax
   14087d49d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087d4a3:	41 8b dd             	mov    ebx,r13d
   14087d4a6:	49 8b ff             	mov    rdi,r15
   14087d4a9:	be 04 00 00 00       	mov    esi,0x4
   14087d4ae:	4c 8d 2d 2b 6e dc 01 	lea    r13,[rip+0x1dc6e2b]        # 0x1426442e0
   14087d4b5:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087d4c0:	44 8b c3             	mov    r8d,ebx
   14087d4c3:	41 8b d6             	mov    edx,r14d
   14087d4c6:	49 8b cd             	mov    rcx,r13
   14087d4c9:	e8 e2 db 83 ff       	call   0x1400bb0b0
   14087d4ce:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d4d0:	49 8b cd             	mov    rcx,r13
   14087d4d3:	e8 38 a6 25 00       	call   0x140ad7b10
   14087d4d8:	33 d2                	xor    edx,edx
   14087d4da:	48 8d 0d 7f a1 b4 01 	lea    rcx,[rip+0x1b4a17f]        # 0x1423c7660
   14087d4e1:	e8 3a 4a 7f ff       	call   0x140071f20
   14087d4e6:	84 c0                	test   al,al
   14087d4e8:	74 0d                	je     0x14087d4f7
   14087d4ea:	41 b0 01             	mov    r8b,0x1
   14087d4ed:	33 d2                	xor    edx,edx
   14087d4ef:	49 8b cd             	mov    rcx,r13
   14087d4f2:	e8 29 dc 83 ff       	call   0x1400bb120
   14087d4f7:	ff c3                	inc    ebx
   14087d4f9:	48 83 c7 0c          	add    rdi,0xc
   14087d4fd:	48 83 ee 01          	sub    rsi,0x1
   14087d501:	75 bd                	jne    0x14087d4c0
   14087d503:	41 ff c6             	inc    r14d
   14087d506:	49 83 c7 04          	add    r15,0x4
   14087d50a:	49 83 ec 01          	sub    r12,0x1
   14087d50e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087d512:	75 8f                	jne    0x14087d4a3
   14087d514:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d519:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087d51e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087d523:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d527:	48 8d 0d b2 6d dc 01 	lea    rcx,[rip+0x1dc6db2]        # 0x1426442e0
   14087d52e:	e8 7d db 83 ff       	call   0x1400bb0b0
   14087d533:	48 8d 15 be 17 e3 00 	lea    rdx,[rip+0xe317be]        # 0x1416aecf8
   14087d53a:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d53e:	e8 cd 1f 7f ff       	call   0x14006f510
   14087d543:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087d547:	e9 5c eb ff ff       	jmp    0x14087c0a8
   14087d54c:	41 8b 57 14          	mov    edx,DWORD PTR [r15+0x14]
   14087d550:	83 fa ff             	cmp    edx,0xffffffff
   14087d553:	0f 84 da 00 00 00    	je     0x14087d633
   14087d559:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087d55d:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087d561:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087d566:	45 8b c4             	mov    r8d,r12d
   14087d569:	48 8b cb             	mov    rcx,rbx
   14087d56c:	e8 bf 47 02 00       	call   0x1408a1d30
   14087d571:	4c 8d 2d 68 6d dc 01 	lea    r13,[rip+0x1dc6d68]        # 0x1426442e0
   14087d578:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087d57d:	4c 8d 3d d4 fa dc 01 	lea    r15,[rip+0x1dcfad4]        # 0x14264d058
   14087d584:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d588:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14087d590:	41 8d 5c 24 04       	lea    ebx,[r12+0x4]
   14087d595:	49 8b ff             	mov    rdi,r15
   14087d598:	be 04 00 00 00       	mov    esi,0x4
   14087d59d:	0f 1f 00             	nop    DWORD PTR [rax]
   14087d5a0:	44 8b c3             	mov    r8d,ebx
   14087d5a3:	41 8b d6             	mov    edx,r14d
   14087d5a6:	49 8b cd             	mov    rcx,r13
   14087d5a9:	e8 02 db 83 ff       	call   0x1400bb0b0
   14087d5ae:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d5b0:	49 8b cd             	mov    rcx,r13
   14087d5b3:	e8 58 a5 25 00       	call   0x140ad7b10
   14087d5b8:	33 d2                	xor    edx,edx
   14087d5ba:	48 8d 0d 9f a0 b4 01 	lea    rcx,[rip+0x1b4a09f]        # 0x1423c7660
   14087d5c1:	e8 5a 49 7f ff       	call   0x140071f20
   14087d5c6:	84 c0                	test   al,al
   14087d5c8:	74 0d                	je     0x14087d5d7
   14087d5ca:	41 b0 01             	mov    r8b,0x1
   14087d5cd:	33 d2                	xor    edx,edx
   14087d5cf:	49 8b cd             	mov    rcx,r13
   14087d5d2:	e8 49 db 83 ff       	call   0x1400bb120
   14087d5d7:	ff c3                	inc    ebx
   14087d5d9:	48 83 c7 0c          	add    rdi,0xc
   14087d5dd:	48 83 ee 01          	sub    rsi,0x1
   14087d5e1:	75 bd                	jne    0x14087d5a0
   14087d5e3:	41 ff c6             	inc    r14d
   14087d5e6:	49 83 c7 04          	add    r15,0x4
   14087d5ea:	48 8d 05 73 fa dc 01 	lea    rax,[rip+0x1dcfa73]        # 0x14264d064
   14087d5f1:	4c 3b f8             	cmp    r15,rax
   14087d5f4:	7c 9a                	jl     0x14087d590
   14087d5f6:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d5fb:	45 8d 6c 24 08       	lea    r13d,[r12+0x8]
   14087d600:	44 89 6d 84          	mov    DWORD PTR [rbp-0x7c],r13d
   14087d604:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   14087d608:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   14087d60b:	83 fa ff             	cmp    edx,0xffffffff
   14087d60e:	0f 84 d6 00 00 00    	je     0x14087d6ea
   14087d614:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   14087d618:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14087d61c:	44 8b 4c 24 60       	mov    r9d,DWORD PTR [rsp+0x60]
   14087d621:	45 8b c5             	mov    r8d,r13d
   14087d624:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   14087d629:	e8 02 47 02 00       	call   0x1408a1d30
   14087d62e:	e9 66 01 00 00       	jmp    0x14087d799
   14087d633:	41 8b 57 04          	mov    edx,DWORD PTR [r15+0x4]
   14087d637:	48 8b 0d c2 19 b6 01 	mov    rcx,QWORD PTR [rip+0x1b619c2]        # 0x1423df000
   14087d63e:	e8 dd dd 9e ff       	call   0x14026b420
   14087d643:	83 f8 ff             	cmp    eax,0xffffffff
   14087d646:	0f 84 25 ff ff ff    	je     0x14087d571
   14087d64c:	48 98                	cdqe
   14087d64e:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087d653:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087d657:	49 c1 e7 04          	shl    r15,0x4
   14087d65b:	48 8d 05 d6 8c dc 01 	lea    rax,[rip+0x1dc8cd6]        # 0x142646338
   14087d662:	4c 03 f8             	add    r15,rax
   14087d665:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087d66b:	4c 8d 2d 6e 6c dc 01 	lea    r13,[rip+0x1dc6c6e]        # 0x1426442e0
   14087d672:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d676:	66 66 0f 1f 84 00 00 00 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14087d680:	8b 5c 24 64          	mov    ebx,DWORD PTR [rsp+0x64]
   14087d684:	49 8b ff             	mov    rdi,r15
   14087d687:	be 04 00 00 00       	mov    esi,0x4
   14087d68c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   14087d690:	44 8b c3             	mov    r8d,ebx
   14087d693:	41 8b d6             	mov    edx,r14d
   14087d696:	49 8b cd             	mov    rcx,r13
   14087d699:	e8 12 da 83 ff       	call   0x1400bb0b0
   14087d69e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d6a0:	49 8b cd             	mov    rcx,r13
   14087d6a3:	e8 68 a4 25 00       	call   0x140ad7b10
   14087d6a8:	33 d2                	xor    edx,edx
   14087d6aa:	48 8d 0d af 9f b4 01 	lea    rcx,[rip+0x1b49faf]        # 0x1423c7660
   14087d6b1:	e8 6a 48 7f ff       	call   0x140071f20
   14087d6b6:	84 c0                	test   al,al
   14087d6b8:	74 0d                	je     0x14087d6c7
   14087d6ba:	41 b0 01             	mov    r8b,0x1
   14087d6bd:	33 d2                	xor    edx,edx
   14087d6bf:	49 8b cd             	mov    rcx,r13
   14087d6c2:	e8 59 da 83 ff       	call   0x1400bb120
   14087d6c7:	ff c3                	inc    ebx
   14087d6c9:	48 83 c7 0c          	add    rdi,0xc
   14087d6cd:	48 83 ee 01          	sub    rsi,0x1
   14087d6d1:	75 bd                	jne    0x14087d690
   14087d6d3:	41 ff c6             	inc    r14d
   14087d6d6:	49 83 c7 04          	add    r15,0x4
   14087d6da:	49 83 ec 01          	sub    r12,0x1
   14087d6de:	75 a0                	jne    0x14087d680
   14087d6e0:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d6e5:	e9 8e fe ff ff       	jmp    0x14087d578
   14087d6ea:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
   14087d6ed:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14087d6f2:	48 8b 48 38          	mov    rcx,QWORD PTR [rax+0x38]
   14087d6f6:	e8 25 dd 9e ff       	call   0x14026b420
   14087d6fb:	83 f8 ff             	cmp    eax,0xffffffff
   14087d6fe:	0f 84 95 00 00 00    	je     0x14087d799
   14087d704:	48 98                	cdqe
   14087d706:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
   14087d70b:	4c 8d 3c 40          	lea    r15,[rax+rax*2]
   14087d70f:	49 c1 e7 04          	shl    r15,0x4
   14087d713:	48 8d 05 1e 8c dc 01 	lea    rax,[rip+0x1dc8c1e]        # 0x142646338
   14087d71a:	4c 03 f8             	add    r15,rax
   14087d71d:	41 bc 03 00 00 00    	mov    r12d,0x3
   14087d723:	41 8b dd             	mov    ebx,r13d
   14087d726:	49 8b ff             	mov    rdi,r15
   14087d729:	be 04 00 00 00       	mov    esi,0x4
   14087d72e:	4c 8d 2d ab 6b dc 01 	lea    r13,[rip+0x1dc6bab]        # 0x1426442e0
   14087d735:	66 66 66 0f 1f 84 00 00 00 00 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14087d740:	44 8b c3             	mov    r8d,ebx
   14087d743:	41 8b d6             	mov    edx,r14d
   14087d746:	49 8b cd             	mov    rcx,r13
   14087d749:	e8 62 d9 83 ff       	call   0x1400bb0b0
   14087d74e:	8b 17                	mov    edx,DWORD PTR [rdi]
   14087d750:	49 8b cd             	mov    rcx,r13
   14087d753:	e8 b8 a3 25 00       	call   0x140ad7b10
   14087d758:	33 d2                	xor    edx,edx
   14087d75a:	48 8d 0d ff 9e b4 01 	lea    rcx,[rip+0x1b49eff]        # 0x1423c7660
   14087d761:	e8 ba 47 7f ff       	call   0x140071f20
   14087d766:	84 c0                	test   al,al
   14087d768:	74 0d                	je     0x14087d777
   14087d76a:	41 b0 01             	mov    r8b,0x1
   14087d76d:	33 d2                	xor    edx,edx
   14087d76f:	49 8b cd             	mov    rcx,r13
   14087d772:	e8 a9 d9 83 ff       	call   0x1400bb120
   14087d777:	ff c3                	inc    ebx
   14087d779:	48 83 c7 0c          	add    rdi,0xc
   14087d77d:	48 83 ee 01          	sub    rsi,0x1
   14087d781:	75 bd                	jne    0x14087d740
   14087d783:	41 ff c6             	inc    r14d
   14087d786:	49 83 c7 04          	add    r15,0x4
   14087d78a:	49 83 ec 01          	sub    r12,0x1
   14087d78e:	44 8b 6d 84          	mov    r13d,DWORD PTR [rbp-0x7c]
   14087d792:	75 8f                	jne    0x14087d723
   14087d794:	44 8b 64 24 64       	mov    r12d,DWORD PTR [rsp+0x64]
   14087d799:	45 8d 44 24 0e       	lea    r8d,[r12+0xe]
   14087d79e:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087d7a3:	41 8d 55 01          	lea    edx,[r13+0x1]
   14087d7a7:	48 8d 0d 32 6b dc 01 	lea    rcx,[rip+0x1dc6b32]        # 0x1426442e0
   14087d7ae:	e8 fd d8 83 ff       	call   0x1400bb0b0
   14087d7b3:	48 8d 15 d6 14 e3 00 	lea    rdx,[rip+0xe314d6]        # 0x1416aec90
   14087d7ba:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d7be:	e8 4d 1d 7f ff       	call   0x14006f510
   14087d7c3:	48 8d 55 58          	lea    rdx,[rbp+0x58]
   14087d7c7:	e9 dc e8 ff ff       	jmp    0x14087c0a8
   14087d7cc:	44 8b 6c 24 60       	mov    r13d,DWORD PTR [rsp+0x60]
   14087d7d1:	45 33 c9             	xor    r9d,r9d
   14087d7d4:	45 33 c0             	xor    r8d,r8d
   14087d7d7:	48 8d 55 38          	lea    rdx,[rbp+0x38]
   14087d7db:	48 8d 0d fe 6a dc 01 	lea    rcx,[rip+0x1dc6afe]        # 0x1426442e0
   14087d7e2:	e8 b9 91 25 00       	call   0x140ad69a0
   14087d7e7:	90                   	nop
   14087d7e8:	48 8d 4d 38          	lea    rcx,[rbp+0x38]
   14087d7ec:	e8 cf a5 7e ff       	call   0x140067dc0
   14087d7f1:	90                   	nop
   14087d7f2:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   14087d7f6:	e8 c5 a5 7e ff       	call   0x140067dc0
   14087d7fb:	90                   	nop
   14087d7fc:	48 8d 4d 58          	lea    rcx,[rbp+0x58]
   14087d800:	e8 bb a5 7e ff       	call   0x140067dc0
   14087d805:	90                   	nop
   14087d806:	48 8d 4d 78          	lea    rcx,[rbp+0x78]
   14087d80a:	e8 b1 a5 7e ff       	call   0x140067dc0
   14087d80f:	44 8b 7d 80          	mov    r15d,DWORD PTR [rbp-0x80]
   14087d813:	41 83 c5 03          	add    r13d,0x3
   14087d817:	44 89 6c 24 60       	mov    DWORD PTR [rsp+0x60],r13d
   14087d81c:	8b 44 24 7c          	mov    eax,DWORD PTR [rsp+0x7c]
   14087d820:	ff c0                	inc    eax
   14087d822:	89 44 24 7c          	mov    DWORD PTR [rsp+0x7c],eax
   14087d826:	3b 45 8c             	cmp    eax,DWORD PTR [rbp-0x74]
   14087d829:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
   14087d82d:	0f 8c f2 da ff ff    	jl     0x14087b325
   14087d833:	8b 5d e8             	mov    ebx,DWORD PTR [rbp-0x18]
   14087d836:	8b 75 a0             	mov    esi,DWORD PTR [rbp-0x60]
   14087d839:	3b fb                	cmp    edi,ebx
   14087d83b:	7e 62                	jle    0x14087d89f
   14087d83d:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087d841:	e8 aa da 83 ff       	call   0x1400bb2f0
   14087d846:	8d 4b ff             	lea    ecx,[rbx-0x1]
   14087d849:	8d 0c 4e             	lea    ecx,[rsi+rcx*2]
   14087d84c:	03 cb                	add    ecx,ebx
   14087d84e:	8d 46 01             	lea    eax,[rsi+0x1]
   14087d851:	44 8d 4f ff          	lea    r9d,[rdi-0x1]
   14087d855:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   14087d859:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   14087d85d:	89 5c 24 20          	mov    DWORD PTR [rsp+0x20],ebx
   14087d861:	45 33 c0             	xor    r8d,r8d
   14087d864:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14087d869:	8b 93 10 03 00 00    	mov    edx,DWORD PTR [rbx+0x310]
   14087d86f:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087d873:	e8 98 da 83 ff       	call   0x1400bb310
   14087d878:	45 8d 4f 01          	lea    r9d,[r15+0x1]
   14087d87c:	0f b6 83 14 03 00 00 	movzx  eax,BYTE PTR [rbx+0x314]
   14087d883:	c7 44 24 28 00 00 00 00 	mov    DWORD PTR [rsp+0x28],0x0
   14087d88b:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   14087d88f:	44 8b 45 b4          	mov    r8d,DWORD PTR [rbp-0x4c]
   14087d893:	8b 55 b8             	mov    edx,DWORD PTR [rbp-0x48]
   14087d896:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   14087d89a:	e8 a1 cb b8 00       	call   0x14140a440
   14087d89f:	48 8b 8d 98 00 00 00 	mov    rcx,QWORD PTR [rbp+0x98]
   14087d8a6:	48 33 cc             	xor    rcx,rsp
   14087d8a9:	e8 22 6d cb 00       	call   0x1415345d0
   14087d8ae:	48 81 c4 a8 01 00 00 	add    rsp,0x1a8
   14087d8b5:	41 5f                	pop    r15
   14087d8b7:	41 5e                	pop    r14
   14087d8b9:	41 5d                	pop    r13
   14087d8bb:	41 5c                	pop    r12
   14087d8bd:	5f                   	pop    rdi
   14087d8be:	5e                   	pop    rsi
   14087d8bf:	5b                   	pop    rbx
   14087d8c0:	5d                   	pop    rbp
   14087d8c1:	c3                   	ret
   14087d8c2:	66 90                	xchg   ax,ax
   14087d8c4:	1d 61 87 00 8b       	sbb    eax,0x8b008761
   14087d8c9:	61                   	(bad)
   14087d8ca:	87 00                	xchg   DWORD PTR [rax],eax
   14087d8cc:	4f 63 87 00 75 63 87 	rex.WRXB movsxd r8,DWORD PTR [r15-0x789c8b00]
   14087d8d3:	00 a2 63 87 00 4f    	add    BYTE PTR [rdx+0x4f008763],ah
   14087d8d9:	63 87 00 4f 63 87    	movsxd eax,DWORD PTR [rdi-0x789cb100]
   14087d8df:	00 4f 63             	add    BYTE PTR [rdi+0x63],cl
   14087d8e2:	87 00                	xchg   DWORD PTR [rax],eax
   14087d8e4:	36 64 87 00          	ss xchg DWORD PTR fs:[rax],eax
   14087d8e8:	36 64 87 00          	ss xchg DWORD PTR fs:[rax],eax
   14087d8ec:	bb 64 87 00 e1       	mov    ebx,0xe1008764
   14087d8f1:	6a 87                	push   0xffffffffffffff87
   14087d8f3:	00 1c 6d 87 00 f8 77 	add    BYTE PTR [rbp*2+0x77f80087],bl
   14087d8fa:	87 00                	xchg   DWORD PTR [rax],eax
   14087d8fc:	42 81 87 00 1c 6d 87 00 1c 6d 87 	rex.X add DWORD PTR [rdi-0x7892e400],0x876d1c00
   14087d907:	00 1c 6d 87 00 cd a3 	add    BYTE PTR [rbp*2-0x5c32ff79],bl
   14087d90e:	87 00                	xchg   DWORD PTR [rax],eax
   14087d910:	cd a3                	int    0xa3
   14087d912:	87 00                	xchg   DWORD PTR [rax],eax
   14087d914:	e5 a0                	in     eax,0xa0
   14087d916:	87 00                	xchg   DWORD PTR [rax],eax
   14087d918:	80 9c 87 00 bc 9c 87 00 	sbb    BYTE PTR [rdi+rax*4-0x78634400],0x0
   14087d920:	f8                   	clc
   14087d921:	9c                   	pushf
   14087d922:	87 00                	xchg   DWORD PTR [rax],eax
   14087d924:	34 9d                	xor    al,0x9d
   14087d926:	87 00                	xchg   DWORD PTR [rax],eax
   14087d928:	70 9d                	jo     0x14087d8c7
   14087d92a:	87 00                	xchg   DWORD PTR [rax],eax
   14087d92c:	ac                   	lods   al,BYTE PTR [rsi]
   14087d92d:	9d                   	popf
   14087d92e:	87 00                	xchg   DWORD PTR [rax],eax
   14087d930:	e8 9d 87 00 24       	call   0x1648860d2
   14087d935:	9e                   	sahf
   14087d936:	87 00                	xchg   DWORD PTR [rax],eax
   14087d938:	60                   	(bad)
   14087d939:	9e                   	sahf
   14087d93a:	87 00                	xchg   DWORD PTR [rax],eax
   14087d93c:	9c                   	pushf
   14087d93d:	9e                   	sahf
   14087d93e:	87 00                	xchg   DWORD PTR [rax],eax
   14087d940:	d8 9e 87 00 1d 9f    	fcomp  DWORD PTR [rsi-0x60e2ff79]
   14087d946:	87 00                	xchg   DWORD PTR [rax],eax
   14087d948:	62 9f 87 00 a7       	(bad)
   14087d94d:	9f                   	lahf
   14087d94e:	87 00                	xchg   DWORD PTR [rax],eax
   14087d950:	ec                   	in     al,dx
   14087d951:	9f                   	lahf
   14087d952:	87 00                	xchg   DWORD PTR [rax],eax
   14087d954:	31 a0 87 00 6d a0    	xor    DWORD PTR [rax-0x5f92ff79],esp
   14087d95a:	87 00                	xchg   DWORD PTR [rax],eax
   14087d95c:	a9 a0 87 00 18       	test   eax,0x180087a0
   14087d961:	be 87 00 d3 c0       	mov    esi,0xc0d30087
   14087d966:	87 00                	xchg   DWORD PTR [rax],eax
   14087d968:	3f                   	(bad)
   14087d969:	c3                   	ret
   14087d96a:	87 00                	xchg   DWORD PTR [rax],eax
   14087d96c:	bc c5 87 00 3c       	mov    esp,0x3c0087c5
   14087d971:	c8 87 00 af          	enter  0x87,0xaf
   14087d975:	ca 87 00             	retf   0x87
   14087d978:	cc                   	int3
   14087d979:	d7                   	xlat   BYTE PTR [rbx]
   14087d97a:	87 00                	xchg   DWORD PTR [rax],eax
   14087d97c:	cc                   	int3
   14087d97d:	d7                   	xlat   BYTE PTR [rbx]
   14087d97e:	87 00                	xchg   DWORD PTR [rax],eax
   14087d980:	cc                   	int3
   14087d981:	d7                   	xlat   BYTE PTR [rbx]
   14087d982:	87 00                	xchg   DWORD PTR [rax],eax
   14087d984:	cc                   	int3
   14087d985:	d7                   	xlat   BYTE PTR [rbx]
   14087d986:	87 00                	xchg   DWORD PTR [rax],eax
   14087d988:	1f                   	(bad)
   14087d989:	cd 87                	int    0x87
   14087d98b:	00 a1 cf 87 00 cb    	add    BYTE PTR [rcx-0x34ff7831],ah
   14087d991:	d2 87 00 4c d5 87    	rol    BYTE PTR [rdi-0x782ab400],cl
   14087d997:	00                   	.byte 0
