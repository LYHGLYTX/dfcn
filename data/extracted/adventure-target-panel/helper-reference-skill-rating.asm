
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014133e7a0 <.text+0x133d7a0>:
   14133e7a0:	40 53                	rex push rbx
   14133e7a2:	48 83 ec 20          	sub    rsp,0x20
   14133e7a6:	0f b7 c2             	movzx  eax,dx
   14133e7a9:	48 8b d9             	mov    rbx,rcx
   14133e7ac:	48 8b 91 98 0a 00 00 	mov    rdx,QWORD PTR [rcx+0xa98]
   14133e7b3:	48 85 d2             	test   rdx,rdx
   14133e7b6:	0f 84 09 03 00 00    	je     0x14133eac5
   14133e7bc:	66 83 f8 ff          	cmp    ax,0xffff
   14133e7c0:	0f 84 ff 02 00 00    	je     0x14133eac5
   14133e7c6:	48 89 74 24 30       	mov    QWORD PTR [rsp+0x30],rsi
   14133e7cb:	48 81 c2 18 02 00 00 	add    rdx,0x218
   14133e7d2:	33 f6                	xor    esi,esi
   14133e7d4:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   14133e7d9:	0f b7 c8             	movzx  ecx,ax
   14133e7dc:	8b fe                	mov    edi,esi
   14133e7de:	e8 bd b9 d7 fe       	call   0x1400ba1a0
   14133e7e3:	48 85 c0             	test   rax,rax
   14133e7e6:	74 09                	je     0x14133e7f1
   14133e7e8:	8b 78 04             	mov    edi,DWORD PTR [rax+0x4]
   14133e7eb:	2b 78 10             	sub    edi,DWORD PTR [rax+0x10]
   14133e7ee:	0f 48 fe             	cmovs  edi,esi
   14133e7f1:	39 b3 1c 08 00 00    	cmp    DWORD PTR [rbx+0x81c],esi
   14133e7f7:	7e 0c                	jle    0x14133e805
   14133e7f9:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   14133e800:	ff 
   14133e801:	75 02                	jne    0x14133e805
   14133e803:	d1 ff                	sar    edi,1
   14133e805:	66 39 b3 fc 07 00 00 	cmp    WORD PTR [rbx+0x7fc],si
   14133e80c:	7e 0c                	jle    0x14133e81a
   14133e80e:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   14133e815:	ff 
   14133e816:	75 02                	jne    0x14133e81a
   14133e818:	d1 ff                	sar    edi,1
   14133e81a:	66 39 b3 fe 07 00 00 	cmp    WORD PTR [rbx+0x7fe],si
   14133e821:	7e 0c                	jle    0x14133e82f
   14133e823:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   14133e82a:	ff 
   14133e82b:	75 02                	jne    0x14133e82f
   14133e82d:	d1 ff                	sar    edi,1
   14133e82f:	39 b3 20 08 00 00    	cmp    DWORD PTR [rbx+0x820],esi
   14133e835:	7e 0c                	jle    0x14133e843
   14133e837:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   14133e83e:	ff 
   14133e83f:	75 02                	jne    0x14133e843
   14133e841:	d1 ff                	sar    edi,1
   14133e843:	39 b3 80 09 00 00    	cmp    DWORD PTR [rbx+0x980],esi
   14133e849:	7e 0c                	jle    0x14133e857
   14133e84b:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   14133e852:	ff 
   14133e853:	75 02                	jne    0x14133e857
   14133e855:	d1 ff                	sar    edi,1
   14133e857:	48 8b cb             	mov    rcx,rbx
   14133e85a:	e8 81 4d 04 00       	call   0x1413835e0
   14133e85f:	8b cf                	mov    ecx,edi
   14133e861:	c1 f9 02             	sar    ecx,0x2
   14133e864:	85 c0                	test   eax,eax
   14133e866:	0f 45 cf             	cmovne ecx,edi
   14133e869:	83 bb 18 08 00 00 64 	cmp    DWORD PTR [rbx+0x818],0x64
   14133e870:	48 8b 7c 24 38       	mov    rdi,QWORD PTR [rsp+0x38]
   14133e875:	8b d1                	mov    edx,ecx
   14133e877:	7c 15                	jl     0x14133e88e
   14133e879:	66 39 b3 14 08 00 00 	cmp    WORD PTR [rbx+0x814],si
   14133e880:	74 0c                	je     0x14133e88e
   14133e882:	66 83 bb 60 03 00 00 	cmp    WORD PTR [rbx+0x360],0xffff
   14133e889:	ff 
   14133e88a:	75 02                	jne    0x14133e88e
   14133e88c:	d1 fa                	sar    edx,1
   14133e88e:	8b 8b 84 09 00 00    	mov    ecx,DWORD PTR [rbx+0x984]
   14133e894:	81 f9 d0 07 00 00    	cmp    ecx,0x7d0
   14133e89a:	7c 15                	jl     0x14133e8b1
   14133e89c:	66 39 b3 14 08 00 00 	cmp    WORD PTR [rbx+0x814],si
   14133e8a3:	74 0c                	je     0x14133e8b1
   14133e8a5:	8d 04 52             	lea    eax,[rdx+rdx*2]
   14133e8a8:	99                   	cdq
   14133e8a9:	83 e2 03             	and    edx,0x3
   14133e8ac:	03 d0                	add    edx,eax
   14133e8ae:	c1 fa 02             	sar    edx,0x2
   14133e8b1:	81 f9 a0 0f 00 00    	cmp    ecx,0xfa0
   14133e8b7:	7c 15                	jl     0x14133e8ce
   14133e8b9:	66 39 b3 14 08 00 00 	cmp    WORD PTR [rbx+0x814],si
   14133e8c0:	74 0c                	je     0x14133e8ce
   14133e8c2:	8d 04 52             	lea    eax,[rdx+rdx*2]
   14133e8c5:	99                   	cdq
   14133e8c6:	83 e2 03             	and    edx,0x3
   14133e8c9:	03 d0                	add    edx,eax
   14133e8cb:	c1 fa 02             	sar    edx,0x2
   14133e8ce:	81 f9 70 17 00 00    	cmp    ecx,0x1770
   14133e8d4:	7c 15                	jl     0x14133e8eb
   14133e8d6:	66 39 b3 14 08 00 00 	cmp    WORD PTR [rbx+0x814],si
   14133e8dd:	74 0c                	je     0x14133e8eb
   14133e8df:	8d 04 52             	lea    eax,[rdx+rdx*2]
   14133e8e2:	99                   	cdq
   14133e8e3:	83 e2 03             	and    edx,0x3
   14133e8e6:	03 d0                	add    edx,eax
   14133e8e8:	c1 fa 02             	sar    edx,0x2
   14133e8eb:	83 bb 80 12 00 00 14 	cmp    DWORD PTR [rbx+0x1280],0x14
   14133e8f2:	44 8b 0d 9f d9 55 00 	mov    r9d,DWORD PTR [rip+0x55d99f]        # 0x14189c298
   14133e8f9:	7e 1f                	jle    0x14133e91a
   14133e8fb:	48 8b 83 78 12 00 00 	mov    rax,QWORD PTR [rbx+0x1278]
   14133e902:	f6 40 14 04          	test   BYTE PTR [rax+0x14],0x4
   14133e906:	74 12                	je     0x14133e91a
   14133e908:	f7 83 2c 08 00 00 00 	test   DWORD PTR [rbx+0x82c],0x10000000
   14133e90f:	00 00 10 
   14133e912:	0f 85 80 00 00 00    	jne    0x14133e998
   14133e918:	eb 18                	jmp    0x14133e932
   14133e91a:	f7 83 2c 08 00 00 00 	test   DWORD PTR [rbx+0x82c],0x10000000
   14133e921:	00 00 10 
   14133e924:	75 72                	jne    0x14133e998
   14133e926:	f7 83 28 08 00 00 00 	test   DWORD PTR [rbx+0x828],0x10000000
   14133e92d:	00 00 10 
   14133e930:	74 66                	je     0x14133e998
   14133e932:	48 8b 83 a8 09 00 00 	mov    rax,QWORD PTR [rbx+0x9a8]
   14133e939:	48 8b 8b b0 09 00 00 	mov    rcx,QWORD PTR [rbx+0x9b0]
   14133e940:	48 3b c1             	cmp    rax,rcx
   14133e943:	73 19                	jae    0x14133e95e
   14133e945:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   14133e948:	66 41 83 38 2e       	cmp    WORD PTR [r8],0x2e
   14133e94d:	74 06                	je     0x14133e955
   14133e94f:	48 83 c0 08          	add    rax,0x8
   14133e953:	eb eb                	jmp    0x14133e940
   14133e955:	49 83 c0 04          	add    r8,0x4
   14133e959:	74 03                	je     0x14133e95e
   14133e95b:	41 8b 30             	mov    esi,DWORD PTR [r8]
   14133e95e:	41 83 f9 01          	cmp    r9d,0x1
   14133e962:	75 14                	jne    0x14133e978
   14133e964:	81 fe 00 ea 24 00    	cmp    esi,0x24ea00
   14133e96a:	7c 04                	jl     0x14133e970
   14133e96c:	d1 fa                	sar    edx,1
   14133e96e:	eb 28                	jmp    0x14133e998
   14133e970:	81 fe 00 75 12 00    	cmp    esi,0x127500
   14133e976:	eb 12                	jmp    0x14133e98a
   14133e978:	81 fe 00 27 06 00    	cmp    esi,0x62700
   14133e97e:	7c 04                	jl     0x14133e984
   14133e980:	d1 fa                	sar    edx,1
   14133e982:	eb 14                	jmp    0x14133e998
   14133e984:	81 fe 40 9d 04 00    	cmp    esi,0x49d40
   14133e98a:	7c 0c                	jl     0x14133e998
   14133e98c:	8d 04 52             	lea    eax,[rdx+rdx*2]
   14133e98f:	99                   	cdq
   14133e990:	83 e2 03             	and    edx,0x3
   14133e993:	03 d0                	add    edx,eax
   14133e995:	c1 fa 02             	sar    edx,0x2
   14133e998:	8b 8b 8c 09 00 00    	mov    ecx,DWORD PTR [rbx+0x98c]
   14133e99e:	48 8b 74 24 30       	mov    rsi,QWORD PTR [rsp+0x30]
   14133e9a3:	45 85 c9             	test   r9d,r9d
   14133e9a6:	75 37                	jne    0x14133e9df
   14133e9a8:	8b c2                	mov    eax,edx
   14133e9aa:	d1 f8                	sar    eax,1
   14133e9ac:	81 f9 50 c3 00 00    	cmp    ecx,0xc350
   14133e9b2:	0f 4c c2             	cmovl  eax,edx
   14133e9b5:	8b c8                	mov    ecx,eax
   14133e9b7:	d1 f9                	sar    ecx,1
   14133e9b9:	81 bb 88 09 00 00 f8 	cmp    DWORD PTR [rbx+0x988],0x124f8
   14133e9c0:	24 01 00 
   14133e9c3:	0f 4c c8             	cmovl  ecx,eax
   14133e9c6:	8b d1                	mov    edx,ecx
   14133e9c8:	d1 fa                	sar    edx,1
   14133e9ca:	81 bb 90 09 00 00 f0 	cmp    DWORD PTR [rbx+0x990],0x249f0
   14133e9d1:	49 02 00 
   14133e9d4:	0f 4c d1             	cmovl  edx,ecx
   14133e9d7:	8b c2                	mov    eax,edx
   14133e9d9:	48 83 c4 20          	add    rsp,0x20
   14133e9dd:	5b                   	pop    rbx
   14133e9de:	c3                   	ret
   14133e9df:	81 f9 00 46 05 00    	cmp    ecx,0x54600
   14133e9e5:	7c 04                	jl     0x14133e9eb
   14133e9e7:	d1 fa                	sar    edx,1
   14133e9e9:	eb 32                	jmp    0x14133ea1d
   14133e9eb:	81 f9 00 a3 02 00    	cmp    ecx,0x2a300
   14133e9f1:	7c 0e                	jl     0x14133ea01
   14133e9f3:	8d 04 52             	lea    eax,[rdx+rdx*2]
   14133e9f6:	99                   	cdq
   14133e9f7:	83 e2 03             	and    edx,0x3
   14133e9fa:	03 d0                	add    edx,eax
   14133e9fc:	c1 fa 02             	sar    edx,0x2
   14133e9ff:	eb 1c                	jmp    0x14133ea1d
   14133ea01:	81 f9 00 c2 01 00    	cmp    ecx,0x1c200
   14133ea07:	7c 14                	jl     0x14133ea1d
   14133ea09:	8d 0c d2             	lea    ecx,[rdx+rdx*8]
   14133ea0c:	b8 67 66 66 66       	mov    eax,0x66666667
   14133ea11:	f7 e9                	imul   ecx
   14133ea13:	c1 fa 02             	sar    edx,0x2
   14133ea16:	8b c2                	mov    eax,edx
   14133ea18:	c1 e8 1f             	shr    eax,0x1f
   14133ea1b:	03 d0                	add    edx,eax
   14133ea1d:	8b 83 88 09 00 00    	mov    eax,DWORD PTR [rbx+0x988]
   14133ea23:	3d 00 8d 27 00       	cmp    eax,0x278d00
   14133ea28:	7c 04                	jl     0x14133ea2e
   14133ea2a:	d1 fa                	sar    edx,1
   14133ea2c:	eb 30                	jmp    0x14133ea5e
   14133ea2e:	3d 00 75 12 00       	cmp    eax,0x127500
   14133ea33:	7c 0e                	jl     0x14133ea43
   14133ea35:	8d 04 52             	lea    eax,[rdx+rdx*2]
   14133ea38:	99                   	cdq
   14133ea39:	83 e2 03             	and    edx,0x3
   14133ea3c:	03 d0                	add    edx,eax
   14133ea3e:	c1 fa 02             	sar    edx,0x2
   14133ea41:	eb 1b                	jmp    0x14133ea5e
   14133ea43:	3d 00 a3 02 00       	cmp    eax,0x2a300
   14133ea48:	7c 14                	jl     0x14133ea5e
   14133ea4a:	8d 0c d2             	lea    ecx,[rdx+rdx*8]
   14133ea4d:	b8 67 66 66 66       	mov    eax,0x66666667
   14133ea52:	f7 e9                	imul   ecx
   14133ea54:	c1 fa 02             	sar    edx,0x2
   14133ea57:	8b c2                	mov    eax,edx
   14133ea59:	c1 e8 1f             	shr    eax,0x1f
   14133ea5c:	03 d0                	add    edx,eax
   14133ea5e:	8b 83 90 09 00 00    	mov    eax,DWORD PTR [rbx+0x990]
   14133ea64:	3d 00 2f 0d 00       	cmp    eax,0xd2f00
   14133ea69:	7c 0b                	jl     0x14133ea76
   14133ea6b:	c1 fa 02             	sar    edx,0x2
   14133ea6e:	8b c2                	mov    eax,edx
   14133ea70:	48 83 c4 20          	add    rsp,0x20
   14133ea74:	5b                   	pop    rbx
   14133ea75:	c3                   	ret
   14133ea76:	3d 00 46 05 00       	cmp    eax,0x54600
   14133ea7b:	7c 0a                	jl     0x14133ea87
   14133ea7d:	d1 fa                	sar    edx,1
   14133ea7f:	8b c2                	mov    eax,edx
   14133ea81:	48 83 c4 20          	add    rsp,0x20
   14133ea85:	5b                   	pop    rbx
   14133ea86:	c3                   	ret
   14133ea87:	3d 80 f4 03 00       	cmp    eax,0x3f480
   14133ea8c:	7c 14                	jl     0x14133eaa2
   14133ea8e:	8d 04 52             	lea    eax,[rdx+rdx*2]
   14133ea91:	99                   	cdq
   14133ea92:	83 e2 03             	and    edx,0x3
   14133ea95:	03 d0                	add    edx,eax
   14133ea97:	c1 fa 02             	sar    edx,0x2
   14133ea9a:	8b c2                	mov    eax,edx
   14133ea9c:	48 83 c4 20          	add    rsp,0x20
   14133eaa0:	5b                   	pop    rbx
   14133eaa1:	c3                   	ret
   14133eaa2:	3d 00 a3 02 00       	cmp    eax,0x2a300
   14133eaa7:	7c 14                	jl     0x14133eabd
   14133eaa9:	8d 0c d2             	lea    ecx,[rdx+rdx*8]
   14133eaac:	b8 67 66 66 66       	mov    eax,0x66666667
   14133eab1:	f7 e9                	imul   ecx
   14133eab3:	c1 fa 02             	sar    edx,0x2
   14133eab6:	8b c2                	mov    eax,edx
   14133eab8:	c1 e8 1f             	shr    eax,0x1f
   14133eabb:	03 d0                	add    edx,eax
   14133eabd:	8b c2                	mov    eax,edx
   14133eabf:	48 83 c4 20          	add    rsp,0x20
   14133eac3:	5b                   	pop    rbx
   14133eac4:	c3                   	ret
   14133eac5:	33 c0                	xor    eax,eax
   14133eac7:	48 83 c4 20          	add    rsp,0x20
   14133eacb:	5b                   	pop    rbx
   14133eacc:	c3                   	ret
