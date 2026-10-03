
D:/program/steam/steamapps/common/Dwarf Fortress/Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014036a9c0 <.text+0x3699c0>:
   14036a9c0:	test   rdx,rdx
   14036a9c3:	je     0x14036b0a7
   14036a9c9:	mov    QWORD PTR [rsp+0x10],rbx
   14036a9ce:	mov    QWORD PTR [rsp+0x18],rsi
   14036a9d3:	mov    QWORD PTR [rsp+0x20],rdi
   14036a9d8:	push   rbp
   14036a9d9:	push   r12
   14036a9db:	push   r13
   14036a9dd:	push   r14
   14036a9df:	push   r15
   14036a9e1:	lea    rbp,[rsp-0x27]
   14036a9e6:	sub    rsp,0xa0
   14036a9ed:	mov    rax,QWORD PTR [rip+0x153164c]        # 0x14189c040
   14036a9f4:	xor    rax,rsp
   14036a9f7:	mov    QWORD PTR [rbp+0x1f],rax
   14036a9fb:	mov    r12,rcx
   14036a9fe:	mov    QWORD PTR [rbp-0x49],rcx
   14036aa02:	test   r8,r8
   14036aa05:	je     0x14036b07b
   14036aa0b:	test   r9,r9
   14036aa0e:	je     0x14036b07b
   14036aa14:	cmp    QWORD PTR [rcx+0xd0],0x0
   14036aa1c:	je     0x14036b07b
   14036aa22:	movzx  esi,BYTE PTR [rbp+0x7f]
   14036aa26:	cmp    r8,QWORD PTR [rcx+0xc0]
   14036aa2d:	je     0x14036aa38
   14036aa2f:	test   sil,sil
   14036aa32:	je     0x14036b07b
   14036aa38:	test   DWORD PTR [rdx+0x10],0x40000
   14036aa3f:	je     0x14036b07b
   14036aa45:	mov    rbx,QWORD PTR [rdx+0x38]
   14036aa49:	mov    rdi,QWORD PTR [rdx+0x40]
   14036aa4d:	nop    DWORD PTR [rax]
   14036aa50:	cmp    rbx,rdi
   14036aa53:	jae    0x14036b07b
   14036aa59:	mov    rcx,QWORD PTR [rbx]
   14036aa5c:	mov    rax,QWORD PTR [rcx]
   14036aa5f:	call   QWORD PTR [rax+0x10]
   14036aa62:	cmp    eax,0x1
   14036aa65:	je     0x14036aa6d
   14036aa67:	add    rbx,0x8
   14036aa6b:	jmp    0x14036aa50
   14036aa6d:	mov    rcx,QWORD PTR [rbx]
   14036aa70:	mov    rax,QWORD PTR [rcx]
   14036aa73:	call   QWORD PTR [rax+0x40]
   14036aa76:	mov    rbx,rax
   14036aa79:	test   rax,rax
   14036aa7c:	je     0x14036b07b
   14036aa82:	mov    rcx,QWORD PTR [rax+0xc8]
   14036aa89:	sub    rcx,QWORD PTR [rax+0xc0]
   14036aa90:	sar    rcx,0x2
   14036aa94:	test   rcx,rcx
   14036aa97:	jne    0x14036aacb
   14036aa99:	mov    rax,QWORD PTR [rax+0xe0]
   14036aaa0:	sub    rax,QWORD PTR [rbx+0xd8]
   14036aaa7:	sar    rax,0x2
   14036aaab:	test   rax,rax
   14036aaae:	jne    0x14036aacb
   14036aab0:	mov    rax,QWORD PTR [rbx+0xf8]
   14036aab7:	sub    rax,QWORD PTR [rbx+0xf0]
   14036aabe:	sar    rax,0x2
   14036aac2:	test   rax,rax
   14036aac5:	je     0x14036b07b
   14036aacb:	xorps  xmm0,xmm0
   14036aace:	movups XMMWORD PTR [rbp-0x1],xmm0
   14036aad2:	mov    QWORD PTR [rbp+0xf],0x0
   14036aada:	mov    QWORD PTR [rbp+0x17],0xf
   14036aae2:	mov    BYTE PTR [rbp-0x1],0x0
   14036aae6:	lea    r15,[r12+0x3c0]
   14036aaee:	mov    rax,QWORD PTR [r15+0x8]
   14036aaf2:	sub    rax,QWORD PTR [r15]
   14036aaf5:	test   rax,0xfffffffffffffff8
   14036aafb:	jne    0x14036ab14
   14036aafd:	mov    DWORD PTR [r12+0x3d8],0x0
   14036ab09:	mov    BYTE PTR [r12+0x3dc],0x0
   14036ab12:	jmp    0x14036ab70
   14036ab14:	mov    ecx,0x20
   14036ab19:	call   0x141539690
   14036ab1e:	mov    rdi,rax
   14036ab21:	xorps  xmm0,xmm0
   14036ab24:	movups XMMWORD PTR [rax],xmm0
   14036ab27:	mov    QWORD PTR [rax+0x10],0x0
   14036ab2f:	mov    QWORD PTR [rax+0x18],0xf
   14036ab37:	mov    BYTE PTR [rax],0x0
   14036ab3a:	mov    QWORD PTR [rbp-0x59],rax
   14036ab3e:	xor    r8d,r8d
   14036ab41:	lea    rdx,[rip+0x12809b0]        # 0x1415eb4f8
   14036ab48:	mov    rcx,rax
   14036ab4b:	call   0x14006f8d0
   14036ab50:	mov    rdx,QWORD PTR [r15+0x8]
   14036ab54:	cmp    rdx,QWORD PTR [r15+0x10]
   14036ab58:	je     0x14036ab64
   14036ab5a:	mov    QWORD PTR [rdx],rdi
   14036ab5d:	add    QWORD PTR [r15+0x8],0x8
   14036ab62:	jmp    0x14036ab70
   14036ab64:	lea    r8,[rbp-0x59]
   14036ab68:	mov    rcx,r15
   14036ab6b:	call   0x1400bad30
   14036ab70:	cmp    BYTE PTR [rbp+0x77],0x0
   14036ab74:	je     0x14036abe4
   14036ab76:	mov    r8d,0xa
   14036ab7c:	lea    rdx,[rip+0x12bf48d]        # 0x14162a010
   14036ab83:	lea    rcx,[rbp-0x1]
   14036ab87:	call   0x14006fa10
   14036ab8c:	mov    r8,QWORD PTR [r12+0xc0]
   14036ab94:	xor    r9d,r9d
   14036ab97:	mov    r8d,DWORD PTR [r8+0x4]
   14036ab9b:	lea    rdx,[rbp-0x1]
   14036ab9f:	call   0x140b92900
   14036aba4:	mov    r8d,0x1a
   14036abaa:	lea    rdx,[rip+0x12bf43f]        # 0x141629ff0
   14036abb1:	lea    rcx,[rbp-0x1]
   14036abb5:	call   0x14006fa10
   14036abba:	xor    r9d,r9d
   14036abbd:	mov    r8d,DWORD PTR [rbx]
   14036abc0:	lea    rdx,[rbp-0x1]
   14036abc4:	call   0x140b94400
   14036abc9:	mov    r8d,0x1
   14036abcf:	lea    rdx,[rip+0x127d9de]        # 0x1415e85b4
   14036abd6:	lea    rcx,[rbp-0x1]
   14036abda:	call   0x14006fa10
   14036abdf:	jmp    0x14036accc
   14036abe4:	test   sil,sil
   14036abe7:	je     0x14036ac29
   14036abe9:	mov    r8d,0x1a
   14036abef:	lea    rdx,[rip+0x12bf2a2]        # 0x141629e98
   14036abf6:	lea    rcx,[rbp-0x1]
   14036abfa:	call   0x14006fa10
   14036abff:	xor    r9d,r9d
   14036ac02:	mov    r8d,DWORD PTR [rbx]
   14036ac05:	lea    rdx,[rbp-0x1]
   14036ac09:	call   0x140b94400
   14036ac0e:	mov    r8d,0x18
   14036ac14:	lea    rdx,[rip+0x12bf25d]        # 0x141629e78
   14036ac1b:	lea    rcx,[rbp-0x1]
   14036ac1f:	call   0x14006fa10
   14036ac24:	jmp    0x14036accc
   14036ac29:	xorps  xmm0,xmm0
   14036ac2c:	movups XMMWORD PTR [rbp-0x21],xmm0
   14036ac30:	mov    QWORD PTR [rbp-0x11],0x0
   14036ac38:	mov    QWORD PTR [rbp-0x9],0xf
   14036ac40:	mov    BYTE PTR [rbp-0x21],0x0
   14036ac44:	xor    r9d,r9d
   14036ac47:	mov    r8d,DWORD PTR [rbx]
   14036ac4a:	lea    rdx,[rbp-0x21]
   14036ac4e:	call   0x140b94400
   14036ac53:	lea    rcx,[rbp-0x21]
   14036ac57:	call   0x14052d650
   14036ac5c:	lea    rdx,[rbp-0x21]
   14036ac60:	cmp    QWORD PTR [rbp-0x9],0xf
   14036ac65:	cmova  rdx,QWORD PTR [rbp-0x21]
   14036ac6a:	mov    r8,QWORD PTR [rbp-0x11]
   14036ac6e:	lea    rcx,[rbp-0x1]
   14036ac72:	call   0x14006fa10
   14036ac77:	mov    r8d,0x3d
   14036ac7d:	lea    rdx,[rip+0x12bf24c]        # 0x141629ed0
   14036ac84:	lea    rcx,[rbp-0x1]
   14036ac88:	call   0x14006fa10
   14036ac8d:	nop
   14036ac8e:	mov    rdx,QWORD PTR [rbp-0x9]
   14036ac92:	cmp    rdx,0xf
   14036ac96:	jbe    0x14036accc
   14036ac98:	inc    rdx
   14036ac9b:	mov    rcx,QWORD PTR [rbp-0x21]
   14036ac9f:	mov    rax,rcx
   14036aca2:	cmp    rdx,0x1000
   14036aca9:	jb     0x14036acc7
   14036acab:	add    rdx,0x27
   14036acaf:	mov    rcx,QWORD PTR [rcx-0x8]
   14036acb3:	sub    rax,rcx
   14036acb6:	add    rax,0xfffffffffffffff8
   14036acba:	cmp    rax,0x1f
   14036acbe:	jbe    0x14036acc7
   14036acc0:	call   QWORD PTR [rip+0x127ae62]        # 0x1415e5b28
   14036acc6:	int3
   14036acc7:	call   0x141539680
   14036accc:	xorps  xmm0,xmm0
   14036accf:	movdqu XMMWORD PTR [rbp-0x21],xmm0
   14036acd4:	mov    QWORD PTR [rbp-0x11],0x0
   14036acdc:	mov    ecx,0x20
   14036ace1:	call   0x141539690
   14036ace6:	xorps  xmm0,xmm0
   14036ace9:	movups XMMWORD PTR [rax],xmm0
   14036acec:	mov    QWORD PTR [rax+0x10],0x0
   14036acf4:	mov    QWORD PTR [rax+0x18],0xf
   14036acfc:	mov    BYTE PTR [rax],0x0
   14036acff:	mov    QWORD PTR [rbp-0x59],rax
   14036ad03:	lea    rcx,[rbp-0x1]
   14036ad07:	cmp    rax,rcx
   14036ad0a:	je     0x14036ad26
   14036ad0c:	lea    rdx,[rbp-0x1]
   14036ad10:	cmp    QWORD PTR [rbp+0x17],0xf
   14036ad15:	cmova  rdx,QWORD PTR [rbp-0x1]
   14036ad1a:	mov    r8,QWORD PTR [rbp+0xf]
   14036ad1e:	mov    rcx,rax
   14036ad21:	call   0x14006f8d0
   14036ad26:	lea    r8,[rbp-0x59]
   14036ad2a:	xor    edx,edx
   14036ad2c:	lea    rcx,[rbp-0x21]
   14036ad30:	call   0x1400bad30
   14036ad35:	xor    bl,bl
   14036ad37:	xorps  xmm0,xmm0
   14036ad3a:	movups XMMWORD PTR [rbp-0x41],xmm0
   14036ad3e:	xor    esi,esi
   14036ad40:	mov    QWORD PTR [rbp-0x31],rsi
   14036ad44:	mov    QWORD PTR [rbp-0x29],0xf
   14036ad4c:	mov    BYTE PTR [rbp-0x41],bl
   14036ad4f:	mov    DWORD PTR [rbp-0x51],esi
   14036ad52:	mov    r13,QWORD PTR [rbp-0x19]
   14036ad56:	mov    rax,r13
   14036ad59:	mov    r14,QWORD PTR [rbp-0x21]
   14036ad5d:	sub    rax,r14
   14036ad60:	sar    rax,0x3
   14036ad64:	mov    QWORD PTR [rbp-0x59],rax
   14036ad68:	test   rax,rax
   14036ad6b:	je     0x14036af9e
   14036ad71:	mov    r12,r14
   14036ad74:	mov    r13d,esi
   14036ad77:	nop    WORD PTR [rax+rax*1+0x0]
   14036ad80:	xor    r14d,r14d
   14036ad83:	xor    edi,edi
   14036ad85:	mov    rcx,QWORD PTR [r12]
   14036ad89:	cmp    QWORD PTR [rcx+0x10],rdi
   14036ad8d:	jbe    0x14036af0d
   14036ad93:	test   bl,bl
   14036ad95:	je     0x14036adb0
   14036ad97:	mov    rax,rcx
   14036ad9a:	cmp    QWORD PTR [rcx+0x18],0xf
   14036ad9f:	jbe    0x14036ada4
   14036ada1:	mov    rax,QWORD PTR [rcx]
   14036ada4:	cmp    BYTE PTR [rdi+rax*1],0x20
   14036ada8:	je     0x14036aef6
   14036adae:	xor    bl,bl
   14036adb0:	cmp    QWORD PTR [rcx+0x18],0xf
   14036adb5:	jbe    0x14036adba
   14036adb7:	mov    rcx,QWORD PTR [rcx]
   14036adba:	movzx  edx,BYTE PTR [rdi+rcx*1]
   14036adbe:	lea    rcx,[rbp-0x41]
   14036adc2:	call   0x1400b9b80
   14036adc7:	mov    rsi,QWORD PTR [rbp-0x31]
   14036adcb:	cmp    rsi,0x44
   14036adcf:	jbe    0x14036aef6
   14036add5:	mov    r10d,r14d
   14036add8:	xor    edx,edx
   14036adda:	xor    r8d,r8d
   14036addd:	mov    rcx,QWORD PTR [r12]
   14036ade1:	mov    r9,QWORD PTR [rcx+0x18]
   14036ade5:	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14036adf0:	dec    r14d
   14036adf3:	dec    rdi
   14036adf6:	inc    edx
   14036adf8:	inc    r8
   14036adfb:	mov    rax,rcx
   14036adfe:	cmp    r9,0xf
   14036ae02:	jbe    0x14036ae07
   14036ae04:	mov    rax,QWORD PTR [rcx]
   14036ae07:	cmp    BYTE PTR [rdi+rax*1],0x20
   14036ae0b:	je     0x14036ae12
   14036ae0d:	test   rdi,rdi
   14036ae10:	jg     0x14036adf0
   14036ae12:	movsxd rax,edx
   14036ae15:	cmp    rax,rsi
   14036ae18:	jne    0x14036ae38
   14036ae1a:	lea    eax,[r10-0x1]
   14036ae1e:	movsxd rdx,eax
   14036ae21:	mov    r9d,0x1
   14036ae27:	lea    r8,[rip+0x127d90e]        # 0x1415e873c
   14036ae2e:	call   0x1404f0930
   14036ae33:	jmp    0x14036aed9
   14036ae38:	mov    rdx,rsi
   14036ae3b:	sub    rdx,r8
   14036ae3e:	cmp    rdx,rsi
   14036ae41:	ja     0x14036ae5b
   14036ae43:	mov    QWORD PTR [rbp-0x31],rdx
   14036ae47:	lea    rax,[rbp-0x41]
   14036ae4b:	cmp    QWORD PTR [rbp-0x29],0xf
   14036ae50:	cmova  rax,QWORD PTR [rbp-0x41]
   14036ae55:	mov    BYTE PTR [rax+rdx*1],0x0
   14036ae59:	jmp    0x14036ae6a
   14036ae5b:	sub    rdx,rsi
   14036ae5e:	xor    r8d,r8d
   14036ae61:	lea    rcx,[rbp-0x41]
   14036ae65:	call   0x1400e12b0
   14036ae6a:	mov    ecx,0x20
   14036ae6f:	call   0x141539690
   14036ae74:	mov    rbx,rax
   14036ae77:	xorps  xmm0,xmm0
   14036ae7a:	movups XMMWORD PTR [rax],xmm0
   14036ae7d:	mov    QWORD PTR [rax+0x10],0x0
   14036ae85:	mov    QWORD PTR [rax+0x18],0xf
   14036ae8d:	mov    BYTE PTR [rax],0x0
   14036ae90:	mov    QWORD PTR [rbp-0x51],rax
   14036ae94:	lea    rax,[rbp-0x41]
   14036ae98:	cmp    rbx,rax
   14036ae9b:	je     0x14036aeb7
   14036ae9d:	lea    rdx,[rbp-0x41]
   14036aea1:	cmp    QWORD PTR [rbp-0x29],0xf
   14036aea6:	cmova  rdx,QWORD PTR [rbp-0x41]
   14036aeab:	mov    r8,QWORD PTR [rbp-0x31]
   14036aeaf:	mov    rcx,rbx
   14036aeb2:	call   0x14006f8d0
   14036aeb7:	mov    rdx,QWORD PTR [r15+0x8]
   14036aebb:	cmp    rdx,QWORD PTR [r15+0x10]
   14036aebf:	je     0x14036aecb
   14036aec1:	mov    QWORD PTR [rdx],rbx
   14036aec4:	add    QWORD PTR [r15+0x8],0x8
   14036aec9:	jmp    0x14036aed7
   14036aecb:	lea    r8,[rbp-0x51]
   14036aecf:	mov    rcx,r15
   14036aed2:	call   0x1400bad30
   14036aed7:	mov    bl,0x1
   14036aed9:	mov    QWORD PTR [rbp-0x31],0x0
   14036aee1:	lea    rax,[rbp-0x41]
   14036aee5:	cmp    QWORD PTR [rbp-0x29],0xf
   14036aeea:	cmova  rax,QWORD PTR [rbp-0x41]
   14036aeef:	mov    BYTE PTR [rax],0x0
   14036aef2:	mov    rsi,QWORD PTR [rbp-0x31]
   14036aef6:	inc    r14d
   14036aef9:	inc    rdi
   14036aefc:	mov    rcx,QWORD PTR [r12]
   14036af00:	movsxd rax,r14d
   14036af03:	cmp    rax,QWORD PTR [rcx+0x10]
   14036af07:	jb     0x14036ad93
   14036af0d:	inc    r13d
   14036af10:	add    r12,0x8
   14036af14:	movsxd rax,r13d
   14036af17:	cmp    rax,QWORD PTR [rbp-0x59]
   14036af1b:	jb     0x14036ad80
   14036af21:	test   rsi,rsi
   14036af24:	mov    r13,QWORD PTR [rbp-0x19]
   14036af28:	je     0x14036af96
   14036af2a:	mov    ecx,0x20
   14036af2f:	call   0x141539690
   14036af34:	mov    rbx,rax
   14036af37:	xorps  xmm0,xmm0
   14036af3a:	movups XMMWORD PTR [rax],xmm0
   14036af3d:	mov    QWORD PTR [rax+0x10],0x0
   14036af45:	mov    QWORD PTR [rax+0x18],0xf
   14036af4d:	mov    BYTE PTR [rax],0x0
   14036af50:	mov    QWORD PTR [rbp-0x51],rax
   14036af54:	lea    rax,[rbp-0x41]
   14036af58:	cmp    rbx,rax
   14036af5b:	je     0x14036af76
   14036af5d:	lea    rdx,[rbp-0x41]
   14036af61:	cmp    QWORD PTR [rbp-0x29],0xf
   14036af66:	cmova  rdx,QWORD PTR [rbp-0x41]
   14036af6b:	mov    r8,rsi
   14036af6e:	mov    rcx,rbx
   14036af71:	call   0x14006f8d0
   14036af76:	mov    rdx,QWORD PTR [r15+0x8]
   14036af7a:	cmp    rdx,QWORD PTR [r15+0x10]
   14036af7e:	je     0x14036af8a
   14036af80:	mov    QWORD PTR [rdx],rbx
   14036af83:	add    QWORD PTR [r15+0x8],0x8
   14036af88:	jmp    0x14036af96
   14036af8a:	lea    r8,[rbp-0x51]
   14036af8e:	mov    rcx,r15
   14036af91:	call   0x1400bad30
   14036af96:	mov    r14,QWORD PTR [rbp-0x21]
   14036af9a:	mov    r12,QWORD PTR [rbp-0x49]
   14036af9e:	lea    rcx,[rbp-0x41]
   14036afa2:	call   0x14006f850
   14036afa7:	nop
   14036afa8:	cmp    QWORD PTR [rbp-0x59],0x0
   14036afad:	jbe    0x14036b003
   14036afaf:	lea    rdi,[r14+0x8]
   14036afb3:	mov    rsi,r14
   14036afb6:	neg    rsi
   14036afb9:	nop    DWORD PTR [rax+0x0]
   14036afc0:	mov    rbx,QWORD PTR [r14]
   14036afc3:	test   rbx,rbx
   14036afc6:	je     0x14036afdd
   14036afc8:	mov    rcx,rbx
   14036afcb:	call   0x14006f850
   14036afd0:	mov    edx,0x20
   14036afd5:	mov    rcx,rbx
   14036afd8:	call   0x141539680
   14036afdd:	mov    r8,r13
   14036afe0:	sub    r8,rdi
   14036afe3:	mov    rdx,rdi
   14036afe6:	mov    rcx,r14
   14036afe9:	call   0x14153ae1a
   14036afee:	sub    r13,0x8
   14036aff2:	lea    rax,[rsi+r13*1]
   14036aff6:	sar    rax,0x3
   14036affa:	test   rax,rax
   14036affd:	jne    0x14036afc0
   14036afff:	mov    QWORD PTR [rbp-0x19],r13
   14036b003:	lea    rcx,[rbp-0x21]
   14036b007:	call   0x140066b70
   14036b00c:	mov    rax,QWORD PTR [r15+0x8]
   14036b010:	sub    rax,QWORD PTR [r15]
   14036b013:	sar    rax,0x3
   14036b017:	test   rax,rax
   14036b01a:	je     0x14036b027
   14036b01c:	mov    WORD PTR [r12+0x37a],0xffff
   14036b027:	cmp    WORD PTR [rip+0x22dfac9],0x2        # 0x14264aaf8
   14036b02f:	jge    0x14036b03d
   14036b031:	mov    eax,0x2
   14036b036:	mov    WORD PTR [rip+0x22dfabb],ax        # 0x14264aaf8
   14036b03d:	mov    rdx,QWORD PTR [rbp+0x17]
   14036b041:	cmp    rdx,0xf
   14036b045:	jbe    0x14036b07b
   14036b047:	inc    rdx
   14036b04a:	mov    rcx,QWORD PTR [rbp-0x1]
   14036b04e:	mov    rax,rcx
   14036b051:	cmp    rdx,0x1000
   14036b058:	jb     0x14036b076
   14036b05a:	add    rdx,0x27
   14036b05e:	mov    rcx,QWORD PTR [rcx-0x8]
   14036b062:	sub    rax,rcx
   14036b065:	add    rax,0xfffffffffffffff8
   14036b069:	cmp    rax,0x1f
   14036b06d:	jbe    0x14036b076
   14036b06f:	call   QWORD PTR [rip+0x127aab3]        # 0x1415e5b28
   14036b075:	int3
   14036b076:	call   0x141539680
   14036b07b:	mov    rcx,QWORD PTR [rbp+0x1f]
   14036b07f:	xor    rcx,rsp
   14036b082:	call   0x141539660
   14036b087:	lea    r11,[rsp+0xa0]
   14036b08f:	mov    rbx,QWORD PTR [r11+0x38]
   14036b093:	mov    rsi,QWORD PTR [r11+0x40]
   14036b097:	mov    rdi,QWORD PTR [r11+0x48]
   14036b09b:	mov    rsp,r11
   14036b09e:	pop    r15
   14036b0a0:	pop    r14
   14036b0a2:	pop    r13
   14036b0a4:	pop    r12
   14036b0a6:	pop    rbp
   14036b0a7:	ret
