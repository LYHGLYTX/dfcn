
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000141339710 <.text+0x1338710>:
   141339710:	40 53                	rex push rbx
   141339712:	48 83 ec 20          	sub    rsp,0x20
   141339716:	0f b7 c2             	movzx  eax,dx
   141339719:	48 8b d9             	mov    rbx,rcx
   14133971c:	48 8b 91 98 0a 00 00 	mov    rdx,QWORD PTR [rcx+0xa98]
   141339723:	48 85 d2             	test   rdx,rdx
   141339726:	0f 84 09 03 00 00    	je     0x141339a35
   14133972c:	66 83 f8 ff          	cmp    ax,0xffff
   141339730:	0f 84 ff 02 00 00    	je     0x141339a35
   141339736:	48 89 74 24 30       	mov    QWORD PTR [rsp+0x30],rsi
   14133973b:	48 81 c2 18 02 00 00 	add    rdx,0x218
   141339742:	33 f6                	xor    esi,esi
   141339744:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   141339749:	0f b7 c8             	movzx  ecx,ax
   14133974c:	8b fe                	mov    edi,esi
   14133974e:	e8 dd 09 d8 fe       	call   0x1400ba130
   141339753:	48 85 c0             	test   rax,rax
   141339756:	74 09                	je     0x141339761
   141339758:	8b 78 04             	mov    edi,DWORD PTR [rax+0x4]
   14133975b:	2b 78 10             	sub    edi,DWORD PTR [rax+0x10]
   14133975e:	0f 48 fe             	cmovs  edi,esi
   141339761:	39 b3 1c 08 00 00    	cmp    DWORD PTR [rbx+0x81c],esi
   141339767:	7e 0c                	jle    0x141339775
   141339769:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   141339770:	ff 
   141339771:	75 02                	jne    0x141339775
   141339773:	d1 ff                	sar    edi,1
   141339775:	66 39 b3 fc 07 00 00 	cmp    WORD PTR [rbx+0x7fc],si
   14133977c:	7e 0c                	jle    0x14133978a
   14133977e:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   141339785:	ff 
   141339786:	75 02                	jne    0x14133978a
   141339788:	d1 ff                	sar    edi,1
   14133978a:	66 39 b3 fe 07 00 00 	cmp    WORD PTR [rbx+0x7fe],si
   141339791:	7e 0c                	jle    0x14133979f
   141339793:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   14133979a:	ff 
   14133979b:	75 02                	jne    0x14133979f
   14133979d:	d1 ff                	sar    edi,1
   14133979f:	39 b3 20 08 00 00    	cmp    DWORD PTR [rbx+0x820],esi
   1413397a5:	7e 0c                	jle    0x1413397b3
   1413397a7:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   1413397ae:	ff 
   1413397af:	75 02                	jne    0x1413397b3
   1413397b1:	d1 ff                	sar    edi,1
   1413397b3:	39 b3 80 09 00 00    	cmp    DWORD PTR [rbx+0x980],esi
   1413397b9:	7e 0c                	jle    0x1413397c7
   1413397bb:	66 83 bb 14 08 00 00 	cmp    WORD PTR [rbx+0x814],0xffff
   1413397c2:	ff 
   1413397c3:	75 02                	jne    0x1413397c7
   1413397c5:	d1 ff                	sar    edi,1
   1413397c7:	48 8b cb             	mov    rcx,rbx
   1413397ca:	e8 81 4d 04 00       	call   0x14137e550
   1413397cf:	8b cf                	mov    ecx,edi
   1413397d1:	c1 f9 02             	sar    ecx,0x2
   1413397d4:	85 c0                	test   eax,eax
   1413397d6:	0f 45 cf             	cmovne ecx,edi
   1413397d9:	83 bb 18 08 00 00 64 	cmp    DWORD PTR [rbx+0x818],0x64
   1413397e0:	48 8b 7c 24 38       	mov    rdi,QWORD PTR [rsp+0x38]
   1413397e5:	8b d1                	mov    edx,ecx
   1413397e7:	7c 15                	jl     0x1413397fe
   1413397e9:	66 39 b3 14 08 00 00 	cmp    WORD PTR [rbx+0x814],si
   1413397f0:	74 0c                	je     0x1413397fe
   1413397f2:	66 83 bb 60 03 00 00 	cmp    WORD PTR [rbx+0x360],0xffff
   1413397f9:	ff 
   1413397fa:	75 02                	jne    0x1413397fe
   1413397fc:	d1 fa                	sar    edx,1
   1413397fe:	8b 8b 84 09 00 00    	mov    ecx,DWORD PTR [rbx+0x984]
   141339804:	81 f9 d0 07 00 00    	cmp    ecx,0x7d0
   14133980a:	7c 15                	jl     0x141339821
   14133980c:	66 39 b3 14 08 00 00 	cmp    WORD PTR [rbx+0x814],si
   141339813:	74 0c                	je     0x141339821
   141339815:	8d 04 52             	lea    eax,[rdx+rdx*2]
   141339818:	99                   	cdq
   141339819:	83 e2 03             	and    edx,0x3
   14133981c:	03 d0                	add    edx,eax
   14133981e:	c1 fa 02             	sar    edx,0x2
   141339821:	81 f9 a0 0f 00 00    	cmp    ecx,0xfa0
   141339827:	7c 15                	jl     0x14133983e
   141339829:	66 39 b3 14 08 00 00 	cmp    WORD PTR [rbx+0x814],si
   141339830:	74 0c                	je     0x14133983e
   141339832:	8d 04 52             	lea    eax,[rdx+rdx*2]
   141339835:	99                   	cdq
   141339836:	83 e2 03             	and    edx,0x3
   141339839:	03 d0                	add    edx,eax
   14133983b:	c1 fa 02             	sar    edx,0x2
   14133983e:	81 f9 70 17 00 00    	cmp    ecx,0x1770
   141339844:	7c 15                	jl     0x14133985b
   141339846:	66 39 b3 14 08 00 00 	cmp    WORD PTR [rbx+0x814],si
   14133984d:	74 0c                	je     0x14133985b
   14133984f:	8d 04 52             	lea    eax,[rdx+rdx*2]
   141339852:	99                   	cdq
   141339853:	83 e2 03             	and    edx,0x3
   141339856:	03 d0                	add    edx,eax
   141339858:	c1 fa 02             	sar    edx,0x2
   14133985b:	83 bb 80 12 00 00 14 	cmp    DWORD PTR [rbx+0x1280],0x14
   141339862:	44 8b 0d ff c9 55 00 	mov    r9d,DWORD PTR [rip+0x55c9ff]        # 0x141896268
   141339869:	7e 1f                	jle    0x14133988a
   14133986b:	48 8b 83 78 12 00 00 	mov    rax,QWORD PTR [rbx+0x1278]
   141339872:	f6 40 14 04          	test   BYTE PTR [rax+0x14],0x4
   141339876:	74 12                	je     0x14133988a
   141339878:	f7 83 2c 08 00 00 00 	test   DWORD PTR [rbx+0x82c],0x10000000
   14133987f:	00 00 10 
   141339882:	0f 85 80 00 00 00    	jne    0x141339908
   141339888:	eb 18                	jmp    0x1413398a2
   14133988a:	f7 83 2c 08 00 00 00 	test   DWORD PTR [rbx+0x82c],0x10000000
   141339891:	00 00 10 
   141339894:	75 72                	jne    0x141339908
   141339896:	f7 83 28 08 00 00 00 	test   DWORD PTR [rbx+0x828],0x10000000
   14133989d:	00 00 10 
   1413398a0:	74 66                	je     0x141339908
   1413398a2:	48 8b 83 a8 09 00 00 	mov    rax,QWORD PTR [rbx+0x9a8]
   1413398a9:	48 8b 8b b0 09 00 00 	mov    rcx,QWORD PTR [rbx+0x9b0]
   1413398b0:	48 3b c1             	cmp    rax,rcx
   1413398b3:	73 19                	jae    0x1413398ce
   1413398b5:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   1413398b8:	66 41 83 38 2e       	cmp    WORD PTR [r8],0x2e
   1413398bd:	74 06                	je     0x1413398c5
   1413398bf:	48 83 c0 08          	add    rax,0x8
   1413398c3:	eb eb                	jmp    0x1413398b0
   1413398c5:	49 83 c0 04          	add    r8,0x4
   1413398c9:	74 03                	je     0x1413398ce
   1413398cb:	41 8b 30             	mov    esi,DWORD PTR [r8]
   1413398ce:	41 83 f9 01          	cmp    r9d,0x1
   1413398d2:	75 14                	jne    0x1413398e8
   1413398d4:	81 fe 00 ea 24 00    	cmp    esi,0x24ea00
   1413398da:	7c 04                	jl     0x1413398e0
   1413398dc:	d1 fa                	sar    edx,1
   1413398de:	eb 28                	jmp    0x141339908
   1413398e0:	81 fe 00 75 12 00    	cmp    esi,0x127500
   1413398e6:	eb 12                	jmp    0x1413398fa
   1413398e8:	81 fe 00 27 06 00    	cmp    esi,0x62700
   1413398ee:	7c 04                	jl     0x1413398f4
   1413398f0:	d1 fa                	sar    edx,1
   1413398f2:	eb 14                	jmp    0x141339908
   1413398f4:	81 fe 40 9d 04 00    	cmp    esi,0x49d40
   1413398fa:	7c 0c                	jl     0x141339908
   1413398fc:	8d 04 52             	lea    eax,[rdx+rdx*2]
   1413398ff:	99                   	cdq
   141339900:	83 e2 03             	and    edx,0x3
   141339903:	03 d0                	add    edx,eax
   141339905:	c1 fa 02             	sar    edx,0x2
   141339908:	8b 8b 8c 09 00 00    	mov    ecx,DWORD PTR [rbx+0x98c]
   14133990e:	48 8b 74 24 30       	mov    rsi,QWORD PTR [rsp+0x30]
   141339913:	45 85 c9             	test   r9d,r9d
   141339916:	75 37                	jne    0x14133994f
   141339918:	8b c2                	mov    eax,edx
   14133991a:	d1 f8                	sar    eax,1
   14133991c:	81 f9 50 c3 00 00    	cmp    ecx,0xc350
   141339922:	0f 4c c2             	cmovl  eax,edx
   141339925:	8b c8                	mov    ecx,eax
   141339927:	d1 f9                	sar    ecx,1
   141339929:	81 bb 88 09 00 00 f8 	cmp    DWORD PTR [rbx+0x988],0x124f8
   141339930:	24 01 00 
   141339933:	0f 4c c8             	cmovl  ecx,eax
   141339936:	8b d1                	mov    edx,ecx
   141339938:	d1 fa                	sar    edx,1
   14133993a:	81 bb 90 09 00 00 f0 	cmp    DWORD PTR [rbx+0x990],0x249f0
   141339941:	49 02 00 
   141339944:	0f 4c d1             	cmovl  edx,ecx
   141339947:	8b c2                	mov    eax,edx
   141339949:	48 83 c4 20          	add    rsp,0x20
   14133994d:	5b                   	pop    rbx
   14133994e:	c3                   	ret
   14133994f:	81 f9 00 46 05 00    	cmp    ecx,0x54600
   141339955:	7c 04                	jl     0x14133995b
   141339957:	d1 fa                	sar    edx,1
   141339959:	eb 32                	jmp    0x14133998d
   14133995b:	81 f9 00 a3 02 00    	cmp    ecx,0x2a300
   141339961:	7c 0e                	jl     0x141339971
   141339963:	8d 04 52             	lea    eax,[rdx+rdx*2]
   141339966:	99                   	cdq
   141339967:	83 e2 03             	and    edx,0x3
   14133996a:	03 d0                	add    edx,eax
   14133996c:	c1 fa 02             	sar    edx,0x2
   14133996f:	eb 1c                	jmp    0x14133998d
   141339971:	81 f9 00 c2 01 00    	cmp    ecx,0x1c200
   141339977:	7c 14                	jl     0x14133998d
   141339979:	8d 0c d2             	lea    ecx,[rdx+rdx*8]
   14133997c:	b8 67 66 66 66       	mov    eax,0x66666667
   141339981:	f7 e9                	imul   ecx
   141339983:	c1 fa 02             	sar    edx,0x2
   141339986:	8b c2                	mov    eax,edx
   141339988:	c1 e8 1f             	shr    eax,0x1f
   14133998b:	03 d0                	add    edx,eax
   14133998d:	8b 83 88 09 00 00    	mov    eax,DWORD PTR [rbx+0x988]
   141339993:	3d 00 8d 27 00       	cmp    eax,0x278d00
   141339998:	7c 04                	jl     0x14133999e
   14133999a:	d1 fa                	sar    edx,1
   14133999c:	eb 30                	jmp    0x1413399ce
   14133999e:	3d 00 75 12 00       	cmp    eax,0x127500
   1413399a3:	7c 0e                	jl     0x1413399b3
   1413399a5:	8d 04 52             	lea    eax,[rdx+rdx*2]
   1413399a8:	99                   	cdq
   1413399a9:	83 e2 03             	and    edx,0x3
   1413399ac:	03 d0                	add    edx,eax
   1413399ae:	c1 fa 02             	sar    edx,0x2
   1413399b1:	eb 1b                	jmp    0x1413399ce
   1413399b3:	3d 00 a3 02 00       	cmp    eax,0x2a300
   1413399b8:	7c 14                	jl     0x1413399ce
   1413399ba:	8d 0c d2             	lea    ecx,[rdx+rdx*8]
   1413399bd:	b8 67 66 66 66       	mov    eax,0x66666667
   1413399c2:	f7 e9                	imul   ecx
   1413399c4:	c1 fa 02             	sar    edx,0x2
   1413399c7:	8b c2                	mov    eax,edx
   1413399c9:	c1 e8 1f             	shr    eax,0x1f
   1413399cc:	03 d0                	add    edx,eax
   1413399ce:	8b 83 90 09 00 00    	mov    eax,DWORD PTR [rbx+0x990]
   1413399d4:	3d 00 2f 0d 00       	cmp    eax,0xd2f00
   1413399d9:	7c 0b                	jl     0x1413399e6
   1413399db:	c1 fa 02             	sar    edx,0x2
   1413399de:	8b c2                	mov    eax,edx
   1413399e0:	48 83 c4 20          	add    rsp,0x20
   1413399e4:	5b                   	pop    rbx
   1413399e5:	c3                   	ret
   1413399e6:	3d 00 46 05 00       	cmp    eax,0x54600
   1413399eb:	7c 0a                	jl     0x1413399f7
   1413399ed:	d1 fa                	sar    edx,1
   1413399ef:	8b c2                	mov    eax,edx
   1413399f1:	48 83 c4 20          	add    rsp,0x20
   1413399f5:	5b                   	pop    rbx
   1413399f6:	c3                   	ret
   1413399f7:	3d 80 f4 03 00       	cmp    eax,0x3f480
   1413399fc:	7c 14                	jl     0x141339a12
   1413399fe:	8d 04 52             	lea    eax,[rdx+rdx*2]
   141339a01:	99                   	cdq
   141339a02:	83 e2 03             	and    edx,0x3
   141339a05:	03 d0                	add    edx,eax
   141339a07:	c1 fa 02             	sar    edx,0x2
   141339a0a:	8b c2                	mov    eax,edx
   141339a0c:	48 83 c4 20          	add    rsp,0x20
   141339a10:	5b                   	pop    rbx
   141339a11:	c3                   	ret
   141339a12:	3d 00 a3 02 00       	cmp    eax,0x2a300
   141339a17:	7c 14                	jl     0x141339a2d
   141339a19:	8d 0c d2             	lea    ecx,[rdx+rdx*8]
   141339a1c:	b8 67 66 66 66       	mov    eax,0x66666667
   141339a21:	f7 e9                	imul   ecx
   141339a23:	c1 fa 02             	sar    edx,0x2
   141339a26:	8b c2                	mov    eax,edx
   141339a28:	c1 e8 1f             	shr    eax,0x1f
   141339a2b:	03 d0                	add    edx,eax
   141339a2d:	8b c2                	mov    eax,edx
   141339a2f:	48 83 c4 20          	add    rsp,0x20
   141339a33:	5b                   	pop    rbx
   141339a34:	c3                   	ret
   141339a35:	33 c0                	xor    eax,eax
   141339a37:	48 83 c4 20          	add    rsp,0x20
   141339a3b:	5b                   	pop    rbx
   141339a3c:	c3                   	ret
