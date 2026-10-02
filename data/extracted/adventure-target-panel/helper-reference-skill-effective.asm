
D:\program\steam\steamapps\common\Dwarf Fortress\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

000000014133e700 <.text+0x133d700>:
   14133e700:	40 53                	rex push rbx
   14133e702:	48 83 ec 20          	sub    rsp,0x20
   14133e706:	48 8b d9             	mov    rbx,rcx
   14133e709:	b8 63 00 00 00       	mov    eax,0x63
   14133e70e:	48 85 d2             	test   rdx,rdx
   14133e711:	74 27                	je     0x14133e73a
   14133e713:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14133e716:	48 8b ca             	mov    rcx,rdx
   14133e719:	45 84 c0             	test   r8b,r8b
   14133e71c:	74 16                	je     0x14133e734
   14133e71e:	ff 90 f0 04 00 00    	call   QWORD PTR [rax+0x4f0]
   14133e724:	0f b7 d0             	movzx  edx,ax
   14133e727:	48 8b cb             	mov    rcx,rbx
   14133e72a:	48 83 c4 20          	add    rsp,0x20
   14133e72e:	5b                   	pop    rbx
   14133e72f:	e9 6c 00 00 00       	jmp    0x14133e7a0
   14133e734:	ff 90 f8 04 00 00    	call   QWORD PTR [rax+0x4f8]
   14133e73a:	0f b7 d0             	movzx  edx,ax
   14133e73d:	48 8b cb             	mov    rcx,rbx
   14133e740:	48 83 c4 20          	add    rsp,0x20
   14133e744:	5b                   	pop    rbx
   14133e745:	e9 56 00 00 00       	jmp    0x14133e7a0
