
C:\Users\WIN11\Downloads\df_53_16_win\Dwarf Fortress.exe:     file format pei-x86-64


Disassembly of section .text:

0000000141339670 <.text+0x1338670>:
   141339670:	40 53                	rex push rbx
   141339672:	48 83 ec 20          	sub    rsp,0x20
   141339676:	48 8b d9             	mov    rbx,rcx
   141339679:	b8 63 00 00 00       	mov    eax,0x63
   14133967e:	48 85 d2             	test   rdx,rdx
   141339681:	74 27                	je     0x1413396aa
   141339683:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   141339686:	48 8b ca             	mov    rcx,rdx
   141339689:	45 84 c0             	test   r8b,r8b
   14133968c:	74 16                	je     0x1413396a4
   14133968e:	ff 90 f0 04 00 00    	call   QWORD PTR [rax+0x4f0]
   141339694:	0f b7 d0             	movzx  edx,ax
   141339697:	48 8b cb             	mov    rcx,rbx
   14133969a:	48 83 c4 20          	add    rsp,0x20
   14133969e:	5b                   	pop    rbx
   14133969f:	e9 6c 00 00 00       	jmp    0x141339710
   1413396a4:	ff 90 f8 04 00 00    	call   QWORD PTR [rax+0x4f8]
   1413396aa:	0f b7 d0             	movzx  edx,ax
   1413396ad:	48 8b cb             	mov    rcx,rbx
   1413396b0:	48 83 c4 20          	add    rsp,0x20
   1413396b4:	5b                   	pop    rbx
   1413396b5:	e9 56 00 00 00       	jmp    0x141339710
