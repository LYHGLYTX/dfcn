# steam PE:6a70a6d9:02711000; adventure_optionst+8;adventure_environment_ingest_from_containerst+0x118;adventure_environment_ingest_materialst+0x118;adventure_environment_pick_up_building_item_contentsst+0x118;adventure_environment_pick_up_building_itemst+0x118;adventure_environment_pick_up_environmentst+0x118;adventure_environment_pick_up_ground_itemst+0x118;adventure_environment_pick_vegetationst+0x118;adventure_environment_pickup_chop_treest+0x118;adventure_environment_pickup_ignite_vegst+0x118;adventure_environment_pickup_make_campfirest+0x118;adventure_environment_pickup_vermin_eventst+0x118;adventure_environment_place_in_bld_containerst+0x118;adventure_environment_place_in_it_containerst+0x118;adventure_environment_place_on_pack_animalst+0x118;adventure_environment_take_from_pack_animalst+0x118;adventure_environment_take_item_from_containerst+0x118;adventure_environment_unit_suck_bloodst+0x118;adventure_item_interact_fill_from_containerst+0x118;adventure_item_interact_fill_with_materialst+0x118;adventure_item_interact_give_namest+0x118;adventure_item_interact_heat_from_tilest+0x118;adventure_item_interact_load_ranged_weaponst+0x118;adventure_item_interact_pull_outst+0x118;adventure_item_interact_readst+0x118;adventure_item_interact_roll_allst+0x118;adventure_item_interact_rollst+0x118;adventure_item_interact_strugglest+0x118;adventure_item_interact_unnockst+0x118;adventure_movement_attack_creaturest+0x118;adventure_movement_building_interact_bash_down_doorst+0x118;adventure_movement_building_interact_break_in_hatchst+0x118;adventure_movement_building_interact_lower_well_bucketst+0x118;adventure_movement_building_interact_pick_door_lockst+0x118;adventure_movement_building_interact_pick_hatch_lockst+0x118;adventure_movement_building_interact_pull_leverst+0x118;adventure_movement_building_interact_raise_well_bucketst+0x118;adventure_movement_building_interact_topple_statuest+0x118;adventure_movement_claim_petst+0x118;adventure_movement_climbst+0x118;adventure_movement_combat_menu_creaturest+0x118;adventure_movement_dismountst+0x118;adventure_movement_hold_itemst+0x118;adventure_movement_hold_tilest+0x118;adventure_movement_item_interact_guidest+0x118;adventure_movement_item_interact_pushst+0x118;adventure_movement_item_interact_ridest+0x118;adventure_movement_jumpst+0x118;adventure_movement_lead_animalst+0x118;adventure_movement_mountst+0x118;adventure_movement_movest+0x118;adventure_movement_pathst+0x118;adventure_movement_release_hold_itemst+0x118;adventure_movement_release_hold_tilest+0x118;adventure_movement_shoot_tilest+0x118;adventure_movement_stop_lead_animalst+0x118;adventure_movement_throw_item_at_tilest+0x118;adventure_option_assume_identityst+0x118;adventure_option_drop_itemst+0x118;adventure_option_eat_drink_itemst+0x118;adventure_option_eat_item_contaminantst+0x118;adventure_option_eat_unit_contaminantst+0x118;adventure_option_interact_with_itemst+0x118;adventure_option_inventory_itemst+0x118;adventure_option_put_itemst+0x118;adventure_option_remove_itemst+0x118;adventure_option_start_shoutingst+0x118;adventure_option_talk_existing_conversationst+0x118;adventure_option_talk_new_conversationst+0x118;adventure_option_throw_itemst+0x118;adventure_option_view_contaminantst+0x118;adventure_option_view_event_detailst+0x118;adventure_option_view_itemst+0x118;adventure_option_view_unitst+0x118;adventure_option_wear_itemst+0x118;adventure_optionst+0x118; RVA 0x72250..0x72253
0x00072250: ret    0x0

# steam PE:6a70a6d9:02711000; unit-contaminant-field; RVA 0x657f90..0x6583cc
0x00657f90: mov    QWORD PTR [rsp+0x18],rbx
0x00657f95: push   rbp
0x00657f96: push   rsi
0x00657f97: push   rdi
0x00657f98: push   r12
0x00657f9a: push   r13
0x00657f9c: push   r14
0x00657f9e: push   r15
0x00657fa0: mov    rbp,rsp
0x00657fa3: sub    rsp,0x70
0x00657fa7: mov    rax,QWORD PTR [rip+0x1244092]        # 0x14189c040
0x00657fae: xor    rax,rsp
0x00657fb1: mov    QWORD PTR [rbp-0x8],rax
0x00657fb5: mov    rbx,rdx
0x00657fb8: mov    r14,rcx
0x00657fbb: xor    r15d,r15d
0x00657fbe: mov    QWORD PTR [rdx+0x10],r15
0x00657fc2: mov    rax,rdx
0x00657fc5: cmp    QWORD PTR [rdx+0x18],0xf
0x00657fca: jbe    0x140657fcf
0x00657fcc: mov    rax,QWORD PTR [rdx]
0x00657fcf: mov    BYTE PTR [rax],r15b
0x00657fd2: mov    edi,0xdb
0x00657fd7: movzx  eax,WORD PTR [rcx]
0x00657fda: sub    ax,di
0x00657fdd: mov    ecx,0xc7
0x00657fe2: lea    r13,[rip+0x100ae5f]        # 0x141662e48 ; literal="specks"
0x00657fe9: cmp    ax,cx
0x00657fec: ja     0x140658079
0x00657ff2: mov    eax,DWORD PTR [r14+0x10]
0x00657ff6: cmp    WORD PTR [r14+0x8],0x3
0x00657ffc: jne    0x140658022
0x00657ffe: cmp    eax,0x19
0x00658001: jge    0x14065800e
0x00658003: mov    rdx,r13
0x00658006: mov    r8d,0x6
0x0065800c: jmp    0x140658057
0x0065800e: mov    r8d,0x7
0x00658014: cmp    eax,0x32
0x00658017: lea    rdx,[rip+0x100ae22]        # 0x141662e40 ; literal="dusting"
0x0065801e: jl     0x140658057
0x00658020: jmp    0x140658050
0x00658022: cmp    eax,0x19
0x00658025: jge    0x140658036
0x00658027: lea    rdx,[rip+0x100adca]        # 0x141662df8 ; literal="spatter"
0x0065802e: mov    r8d,0x7
0x00658034: jmp    0x140658057
0x00658036: cmp    eax,0x32
0x00658039: jge    0x14065804a
0x0065803b: lea    rdx,[rip+0x100add2]        # 0x141662e14 ; literal="smear"
0x00658042: mov    r8d,0x5
0x00658048: jmp    0x140658057
0x0065804a: mov    r8d,0x7
0x00658050: lea    rdx,[rip+0x100ada9]        # 0x141662e00 ; literal="coating"
0x00658057: mov    rcx,rbx
0x0065805a: call   0x14006fa10
0x0065805f: mov    r8d,0x4
0x00658065: lea    rdx,[rip+0xf934ac]        # 0x1415eb518 ; literal=" of "
0x0065806c: mov    rcx,rbx
0x0065806f: call   0x14006fa10
0x00658074: mov    ecx,0xc7
0x00658079: xorps  xmm0,xmm0
0x0065807c: movups XMMWORD PTR [rbp-0x48],xmm0
0x00658080: mov    r12d,0xf
0x00658086: mov    QWORD PTR [rbp-0x30],r12
0x0065808a: movzx  eax,WORD PTR [r14+0x8]
0x0065808f: mov    WORD PTR [rbp-0x4e],ax
0x00658093: mov    esi,DWORD PTR [r14+0x4]
0x00658097: movzx  eax,WORD PTR [r14]
0x0065809b: mov    WORD PTR [rbp-0x50],ax
0x0065809f: mov    QWORD PTR [rbp-0x38],r15
0x006580a3: mov    BYTE PTR [rbp-0x48],0x0
0x006580a7: sub    ax,di
0x006580aa: cmp    ax,cx
0x006580ad: ja     0x140658217
0x006580b3: mov    r9,QWORD PTR [rip+0x1ea1c66]        # 0x1424f9d20
0x006580ba: mov    r10,QWORD PTR [rip+0x1ea1c57]        # 0x1424f9d18
0x006580c1: sub    r9,r10
0x006580c4: sar    r9,0x3
0x006580c8: test   r9,r9
0x006580cb: je     0x140658217
0x006580d1: cmp    esi,0xffffffff
0x006580d4: je     0x140658217
0x006580da: mov    edx,r15d
0x006580dd: sub    r9d,0x1
0x006580e1: js     0x140658217
0x006580e7: nop    WORD PTR [rax+rax*1+0x0]
0x006580f0: lea    ecx,[r9+rdx*1]
0x006580f4: sar    ecx,1
0x006580f6: movsxd rax,ecx
0x006580f9: mov    rdi,QWORD PTR [r10+rax*8]
0x006580fd: cmp    DWORD PTR [rdi+0xe0],esi
0x00658103: je     0x14065811f
0x00658105: lea    eax,[rcx-0x1]
0x00658108: cmovle eax,r9d
0x0065810c: mov    r9d,eax
0x0065810f: lea    eax,[rcx+0x1]
0x00658112: cmovle edx,eax
0x00658115: cmp    edx,r9d
0x00658118: jle    0x1406580f0
0x0065811a: jmp    0x140658217
0x0065811f: test   rdi,rdi
0x00658122: je     0x140658217
0x00658128: cmp    BYTE PTR [rdi+0xaa],0x0
0x0065812f: je     0x140658217
0x00658135: xorps  xmm0,xmm0
0x00658138: movups XMMWORD PTR [rbp-0x28],xmm0
0x0065813c: mov    QWORD PTR [rbp-0x18],r15
0x00658140: mov    QWORD PTR [rbp-0x10],r12
0x00658144: mov    BYTE PTR [rbp-0x28],0x0
0x00658148: mov    rax,QWORD PTR [rdi+0x130]
0x0065814f: test   rax,rax
0x00658152: je     0x140658180
0x00658154: mov    rax,QWORD PTR [rax+0x58]
0x00658158: test   rax,rax
0x0065815b: je     0x140658180
0x0065815d: mov    edx,DWORD PTR [rax+0x30]
0x00658160: cmp    edx,0xffffffff
0x00658163: je     0x140658180
0x00658165: lea    rcx,[rip+0x1e8fb7c]        # 0x1424e7ce8
0x0065816c: call   0x140072570
0x00658171: test   rax,rax
0x00658174: je     0x140658180
0x00658176: mov    rcx,rax
0x00658179: call   0x140c3a4f0
0x0065817e: jmp    0x140658184
0x00658180: lea    rax,[rdi+0x38]
0x00658184: test   rax,rax
0x00658187: je     0x1406581a9
0x00658189: cmp    BYTE PTR [rax+0x72],0x0
0x0065818d: je     0x1406581a9
0x0065818f: xor    r9d,r9d
0x00658192: mov    r8b,0x1
0x00658195: lea    rdx,[rbp-0x28]
0x00658199: mov    rcx,rax
0x0065819c: call   0x140a946e0
0x006581a1: mov    r12,QWORD PTR [rbp-0x10]
0x006581a5: mov    r15,QWORD PTR [rbp-0x18]
0x006581a9: lea    rdx,[rbp-0x28]
0x006581ad: cmp    r12,0xf
0x006581b1: cmova  rdx,QWORD PTR [rbp-0x28]
0x006581b6: mov    r8,r15
0x006581b9: lea    rcx,[rbp-0x48]
0x006581bd: call   0x14006fa10
0x006581c2: mov    r8d,0x3
0x006581c8: lea    rdx,[rip+0xf95955]        # 0x1415edb24 ; literal="'s "
0x006581cf: lea    rcx,[rbp-0x48]
0x006581d3: call   0x14006fa10
0x006581d8: nop
0x006581d9: mov    rdx,QWORD PTR [rbp-0x10]
0x006581dd: cmp    rdx,0xf
0x006581e1: jbe    0x140658217
0x006581e3: inc    rdx
0x006581e6: mov    rcx,QWORD PTR [rbp-0x28]
0x006581ea: mov    rax,rcx
0x006581ed: cmp    rdx,0x1000
0x006581f4: jb     0x140658212
0x006581f6: add    rdx,0x27
0x006581fa: mov    rcx,QWORD PTR [rcx-0x8]
0x006581fe: sub    rax,rcx
0x00658201: add    rax,0xfffffffffffffff8
0x00658205: cmp    rax,0x1f
0x00658209: jbe    0x140658212
0x0065820b: call   QWORD PTR [rip+0xf8d917]        # 0x1415e5b28
0x00658211: int3
0x00658212: call   0x141539680
0x00658217: mov    r8d,esi
0x0065821a: movzx  edx,WORD PTR [rbp-0x50]
0x0065821e: lea    rcx,[rip+0x1d792cb]        # 0x1423d14f0
0x00658225: call   0x1414add70
0x0065822a: mov    rdi,rax
0x0065822d: test   rax,rax
0x00658230: je     0x140658293
0x00658232: cmp    QWORD PTR [rax+0x530],0x0
0x0065823a: je     0x140658270
0x0065823c: lea    rdx,[rax+0x520]
0x00658243: mov    r8,QWORD PTR [rdx+0x10]
0x00658247: cmp    QWORD PTR [rdx+0x18],0xf
0x0065824c: jbe    0x140658251
0x0065824e: mov    rdx,QWORD PTR [rdx]
0x00658251: lea    rcx,[rbp-0x48]
0x00658255: call   0x14006fa10
0x0065825a: mov    r8d,0x1
0x00658260: lea    rdx,[rip+0xf904d5]        # 0x1415e873c ; literal=" "
0x00658267: lea    rcx,[rbp-0x48]
0x0065826b: call   0x14006fa10
0x00658270: movsx  rdx,WORD PTR [rbp-0x4e]
0x00658275: shl    rdx,0x5
0x00658279: add    rdx,0xb8
0x00658280: add    rdx,rdi
0x00658283: mov    r8,QWORD PTR [rdx+0x10]
0x00658287: cmp    QWORD PTR [rdx+0x18],0xf
0x0065828c: jbe    0x1406582a0
0x0065828e: mov    rdx,QWORD PTR [rdx]
0x00658291: jmp    0x1406582a0
0x00658293: lea    rdx,[rip+0x1130e6e]        # 0x141789108 ; literal="unknown material"
0x0065829a: mov    r8d,0x10
0x006582a0: lea    rcx,[rbp-0x48]
0x006582a4: call   0x14006fa10
0x006582a9: lea    rdx,[rbp-0x48]
0x006582ad: cmp    QWORD PTR [rbp-0x30],0xf
0x006582b2: cmova  rdx,QWORD PTR [rbp-0x48]
0x006582b7: mov    r8,QWORD PTR [rbp-0x38]
0x006582bb: mov    rcx,rbx
0x006582be: call   0x14006fa10
0x006582c3: movzx  eax,WORD PTR [r14]
0x006582c7: mov    ecx,0xdb
0x006582cc: sub    ax,cx
0x006582cf: mov    ecx,0xc7
0x006582d4: cmp    ax,cx
0x006582d7: jbe    0x14065836a
0x006582dd: mov    r8d,0x1
0x006582e3: lea    rdx,[rip+0xf90452]        # 0x1415e873c ; literal=" "
0x006582ea: mov    rcx,rbx
0x006582ed: call   0x14006fa10
0x006582f2: mov    eax,DWORD PTR [r14+0x10]
0x006582f6: cmp    WORD PTR [r14+0x8],0x3
0x006582fc: jne    0x14065832c
0x006582fe: cmp    eax,0x19
0x00658301: jge    0x14065830e
0x00658303: mov    r8d,0x6
0x00658309: mov    rdx,r13
0x0065830c: jmp    0x140658361
0x0065830e: mov    r8d,0x7
0x00658314: cmp    eax,0x32
0x00658317: lea    r13,[rip+0x100ab22]        # 0x141662e40 ; literal="dusting"
0x0065831e: jl     0x140658327
0x00658320: lea    r13,[rip+0x100aad9]        # 0x141662e00 ; literal="coating"
0x00658327: mov    rdx,r13
0x0065832a: jmp    0x140658361
0x0065832c: cmp    eax,0x19
0x0065832f: jge    0x140658340
0x00658331: mov    r8d,0x7
0x00658337: lea    rdx,[rip+0x100aaba]        # 0x141662df8 ; literal="spatter"
0x0065833e: jmp    0x140658361
0x00658340: cmp    eax,0x32
0x00658343: jge    0x140658354
0x00658345: mov    r8d,0x5
0x0065834b: lea    rdx,[rip+0x100aac2]        # 0x141662e14 ; literal="smear"
0x00658352: jmp    0x140658361
0x00658354: mov    r8d,0x8
0x0065835a: lea    rdx,[rip+0x100aaa7]        # 0x141662e08 ; literal="covering"
0x00658361: mov    rcx,rbx
0x00658364: call   0x14006fa10
0x00658369: nop
0x0065836a: mov    rdx,QWORD PTR [rbp-0x30]
0x0065836e: cmp    rdx,0xf
0x00658372: jbe    0x1406583a8
0x00658374: inc    rdx
0x00658377: mov    rcx,QWORD PTR [rbp-0x48]
0x0065837b: mov    rax,rcx
0x0065837e: cmp    rdx,0x1000
0x00658385: jb     0x1406583a3
0x00658387: add    rdx,0x27
0x0065838b: mov    rcx,QWORD PTR [rcx-0x8]
0x0065838f: sub    rax,rcx
0x00658392: add    rax,0xfffffffffffffff8
0x00658396: cmp    rax,0x1f
0x0065839a: jbe    0x1406583a3
0x0065839c: call   QWORD PTR [rip+0xf8d786]        # 0x1415e5b28
0x006583a2: int3
0x006583a3: call   0x141539680
0x006583a8: mov    rcx,QWORD PTR [rbp-0x8]
0x006583ac: xor    rcx,rsp
0x006583af: call   0x141539660
0x006583b4: mov    rbx,QWORD PTR [rsp+0xc0]
0x006583bc: add    rsp,0x70
0x006583c0: pop    r15
0x006583c2: pop    r14
0x006583c4: pop    r13
0x006583c6: pop    r12
0x006583c8: pop    rdi
0x006583c9: pop    rsi
0x006583ca: pop    rbp
0x006583cb: ret

# steam PE:6a70a6d9:02711000; adventure_option_talk_existing_conversationst+8; RVA 0x6b7080..0x6b7314
0x006b7080: mov    QWORD PTR [rsp+0x8],rbx
0x006b7085: mov    QWORD PTR [rsp+0x18],rbp
0x006b708a: push   rsi
0x006b708b: push   rdi
0x006b708c: push   r14
0x006b708e: sub    rsp,0x50
0x006b7092: mov    rax,QWORD PTR [rip+0x11e4fa7]        # 0x14189c040
0x006b7099: xor    rax,rsp
0x006b709c: mov    QWORD PTR [rsp+0x40],rax
0x006b70a1: mov    rbp,rdx
0x006b70a4: mov    rbx,QWORD PTR [rcx+0x18]
0x006b70a8: mov    rcx,rdx
0x006b70ab: test   BYTE PTR [rbx+0x16c],0x2
0x006b70b2: je     0x1406b70cb
0x006b70b4: mov    r8d,0x11
0x006b70ba: lea    rdx,[rip+0xfc3dff]        # 0x14167aec0 ; literal="Continue shouting"
0x006b70c1: call   0x14006f8d0
0x006b70c6: jmp    0x1406b72f1
0x006b70cb: mov    r8d,0x1b
0x006b70d1: lea    rdx,[rip+0xfc3d98]        # 0x14167ae70 ; literal="Continue conversation with "
0x006b70d8: call   0x14006f8d0
0x006b70dd: mov    rdi,QWORD PTR [rbx+0x50]
0x006b70e1: mov    rbx,QWORD PTR [rbx+0x48]
0x006b70e5: mov    rsi,rdi
0x006b70e8: sub    rsi,rbx
0x006b70eb: sar    rsi,0x3
0x006b70ef: dec    esi
0x006b70f1: xorps  xmm0,xmm0
0x006b70f4: movups XMMWORD PTR [rsp+0x20],xmm0
0x006b70f9: mov    QWORD PTR [rsp+0x30],0x0
0x006b7102: mov    QWORD PTR [rsp+0x38],0xf
0x006b710b: mov    BYTE PTR [rsp+0x20],0x0
0x006b7110: cmp    rbx,rdi
0x006b7113: jae    0x1406b72e7
0x006b7119: mov    r14,QWORD PTR [rbx]
0x006b711c: mov    r9d,DWORD PTR [r14]
0x006b711f: mov    rax,QWORD PTR [rip+0x1d2dfea]        # 0x1423e5110
0x006b7126: cmp    r9d,DWORD PTR [rax+0x130]
0x006b712d: je     0x1406b72de
0x006b7133: mov    r10,QWORD PTR [rip+0x1d2df7e]        # 0x1423e50b8
0x006b713a: sub    r10,QWORD PTR [rip+0x1d2df6f]        # 0x1423e50b0
0x006b7141: sar    r10,0x3
0x006b7145: test   r10d,r10d
0x006b7148: je     0x1406b71fb
0x006b714e: cmp    r9d,0xffffffff
0x006b7152: je     0x1406b71fb
0x006b7158: xor    r8d,r8d
0x006b715b: sub    r10d,0x1
0x006b715f: js     0x1406b71a3
0x006b7161: nop    DWORD PTR [rax+0x0]
0x006b7165: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x006b7170: lea    edx,[r8+r10*1]
0x006b7174: sar    edx,1
0x006b7176: movsxd rcx,edx
0x006b7179: mov    rax,QWORD PTR [rip+0x1d2df30]        # 0x1423e50b0
0x006b7180: mov    rcx,QWORD PTR [rax+rcx*8]
0x006b7184: cmp    DWORD PTR [rcx+0x130],r9d
0x006b718b: je     0x1406b71a5
0x006b718d: lea    eax,[rdx+0x1]
0x006b7190: cmovle r8d,eax
0x006b7194: lea    eax,[rdx-0x1]
0x006b7197: cmovle eax,r10d
0x006b719b: mov    r10d,eax
0x006b719e: cmp    r8d,eax
0x006b71a1: jle    0x1406b7170
0x006b71a3: xor    ecx,ecx
0x006b71a5: test   rcx,rcx
0x006b71a8: je     0x1406b71fb
0x006b71aa: lea    rdx,[rsp+0x20]
0x006b71af: call   0x141331500
0x006b71b4: lea    rdx,[rsp+0x20]
0x006b71b9: cmp    QWORD PTR [rsp+0x38],0xf
0x006b71bf: cmova  rdx,QWORD PTR [rsp+0x20]
0x006b71c5: mov    r8,QWORD PTR [rsp+0x30]
0x006b71ca: mov    rcx,rbp
0x006b71cd: call   0x14006fa10
0x006b71d2: dec    esi
0x006b71d4: cmp    esi,0x1
0x006b71d7: jle    0x1406b72c7
0x006b71dd: mov    r8d,0x2
0x006b71e3: lea    rdx,[rip+0xf31eee]        # 0x1415e90d8 ; literal=", "
0x006b71ea: mov    rcx,rbp
0x006b71ed: call   0x14006fa10
0x006b71f2: add    rbx,0x8
0x006b71f6: jmp    0x1406b7110
0x006b71fb: mov    r10d,DWORD PTR [r14+0x4]
0x006b71ff: mov    r9,QWORD PTR [rip+0x1e42b1a]        # 0x1424f9d20
0x006b7206: mov    r11,QWORD PTR [rip+0x1e42b0b]        # 0x1424f9d18
0x006b720d: sub    r9,r11
0x006b7210: sar    r9,0x3
0x006b7214: test   r9,r9
0x006b7217: je     0x1406b72de
0x006b721d: cmp    r10d,0xffffffff
0x006b7221: je     0x1406b72de
0x006b7227: xor    edx,edx
0x006b7229: sub    r9d,0x1
0x006b722d: js     0x1406b72de
0x006b7233: lea    eax,[r9+rdx*1]
0x006b7237: sar    eax,1
0x006b7239: movsxd rcx,eax
0x006b723c: mov    rcx,QWORD PTR [r11+rcx*8]
0x006b7240: mov    r8d,DWORD PTR [rcx+0xe0]
0x006b7247: cmp    r8d,r10d
0x006b724a: je     0x1406b726b
0x006b724c: lea    ecx,[rax-0x1]
0x006b724f: cmovle ecx,r9d
0x006b7253: mov    r9d,ecx
0x006b7256: inc    eax
0x006b7258: cmp    r8d,r10d
0x006b725b: cmovle edx,eax
0x006b725e: cmp    edx,ecx
0x006b7260: jle    0x1406b7233
0x006b7262: add    rbx,0x8
0x006b7266: jmp    0x1406b7110
0x006b726b: test   rcx,rcx
0x006b726e: je     0x1406b72de
0x006b7270: add    rcx,0x38
0x006b7274: xor    r9d,r9d
0x006b7277: mov    r8b,0x1
0x006b727a: lea    rdx,[rsp+0x20]
0x006b727f: call   0x140a946e0
0x006b7284: lea    rdx,[rsp+0x20]
0x006b7289: cmp    QWORD PTR [rsp+0x38],0xf
0x006b728f: cmova  rdx,QWORD PTR [rsp+0x20]
0x006b7295: mov    r8,QWORD PTR [rsp+0x30]
0x006b729a: mov    rcx,rbp
0x006b729d: call   0x14006fa10
0x006b72a2: dec    esi
0x006b72a4: cmp    esi,0x1
0x006b72a7: jle    0x1406b72c7
0x006b72a9: mov    r8d,0x2
0x006b72af: lea    rdx,[rip+0xf31e22]        # 0x1415e90d8 ; literal=", "
0x006b72b6: mov    rcx,rbp
0x006b72b9: call   0x14006fa10
0x006b72be: add    rbx,0x8
0x006b72c2: jmp    0x1406b7110
0x006b72c7: jne    0x1406b72de
0x006b72c9: lea    rdx,[rip+0xf31e40]        # 0x1415e9110 ; literal=" and "
0x006b72d0: mov    r8d,0x5
0x006b72d6: mov    rcx,rbp
0x006b72d9: call   0x14006fa10
0x006b72de: add    rbx,0x8
0x006b72e2: jmp    0x1406b7110
0x006b72e7: lea    rcx,[rsp+0x20]
0x006b72ec: call   0x14006f850
0x006b72f1: mov    rcx,QWORD PTR [rsp+0x40]
0x006b72f6: xor    rcx,rsp
0x006b72f9: call   0x141539660
0x006b72fe: mov    rbx,QWORD PTR [rsp+0x70]
0x006b7303: mov    rbp,QWORD PTR [rsp+0x80]
0x006b730b: add    rsp,0x50
0x006b730f: pop    r14
0x006b7311: pop    rdi
0x006b7312: pop    rsi
0x006b7313: ret

# steam PE:6a70a6d9:02711000; adventure_option_view_unitst+8; RVA 0x6b7320..0x6b7595
0x006b7320: mov    QWORD PTR [rsp+0x8],rbx
0x006b7325: mov    QWORD PTR [rsp+0x18],rbp
0x006b732a: mov    QWORD PTR [rsp+0x20],rsi
0x006b732f: push   rdi
0x006b7330: sub    rsp,0x50
0x006b7334: mov    rax,QWORD PTR [rip+0x11e4d05]        # 0x14189c040
0x006b733b: xor    rax,rsp
0x006b733e: mov    QWORD PTR [rsp+0x40],rax
0x006b7343: mov    rbp,rdx
0x006b7346: mov    rsi,rcx
0x006b7349: mov    r8d,0x5
0x006b734f: lea    rdx,[rip+0xfc3b36]        # 0x14167ae8c ; literal="View "
0x006b7356: mov    rcx,rbp
0x006b7359: call   0x14006f8d0
0x006b735e: mov    rdx,QWORD PTR [rip+0x1d2ddab]        # 0x1423e5110
0x006b7365: test   rdx,rdx
0x006b7368: je     0x1406b738f
0x006b736a: mov    eax,DWORD PTR [rsi+0x10]
0x006b736d: cmp    DWORD PTR [rdx+0x130],eax
0x006b7373: jne    0x1406b738f
0x006b7375: mov    r8d,0x8
0x006b737b: lea    rdx,[rip+0xfabb5e]        # 0x141662ee0 ; literal="yourself"
0x006b7382: mov    rcx,rbp
0x006b7385: call   0x14006fa10
0x006b738a: jmp    0x1406b7573
0x006b738f: xorps  xmm0,xmm0
0x006b7392: movups XMMWORD PTR [rsp+0x20],xmm0
0x006b7397: xor    edx,edx
0x006b7399: mov    QWORD PTR [rsp+0x30],rdx
0x006b739e: mov    QWORD PTR [rsp+0x38],0xf
0x006b73a7: mov    BYTE PTR [rsp+0x20],dl
0x006b73ab: mov    ebx,DWORD PTR [rsi+0x10]
0x006b73ae: cmp    ebx,0xffffffff
0x006b73b1: je     0x1406b7423
0x006b73b3: mov    r11,QWORD PTR [rip+0x1d2dcfe]        # 0x1423e50b8
0x006b73ba: mov    rdi,QWORD PTR [rip+0x1d2dcef]        # 0x1423e50b0
0x006b73c1: sub    r11,rdi
0x006b73c4: sar    r11,0x3
0x006b73c8: test   r11d,r11d
0x006b73cb: je     0x1406b7423
0x006b73cd: sub    r11d,0x1
0x006b73d1: mov    r9d,edx
0x006b73d4: js     0x1406b740c
0x006b73d6: data16 nop WORD PTR [rax+rax*1+0x0]
0x006b73e0: lea    ecx,[r9+r11*1]
0x006b73e4: sar    ecx,1
0x006b73e6: movsxd rax,ecx
0x006b73e9: mov    r8,QWORD PTR [rdi+rax*8]
0x006b73ed: cmp    DWORD PTR [r8+0x130],ebx
0x006b73f4: je     0x1406b740f
0x006b73f6: lea    eax,[rcx+0x1]
0x006b73f9: cmovle r9d,eax
0x006b73fd: lea    eax,[rcx-0x1]
0x006b7400: cmovle eax,r11d
0x006b7404: mov    r11d,eax
0x006b7407: cmp    r9d,eax
0x006b740a: jle    0x1406b73e0
0x006b740c: mov    r8,rdx
0x006b740f: test   r8,r8
0x006b7412: je     0x1406b7423
0x006b7414: lea    rdx,[rsp+0x20]
0x006b7419: mov    rcx,r8
0x006b741c: call   0x141331500
0x006b7421: jmp    0x1406b749c
0x006b7423: mov    r10d,DWORD PTR [rsi+0x14]
0x006b7427: cmp    r10d,0xffffffff
0x006b742b: je     0x1406b747f
0x006b742d: mov    r9,QWORD PTR [rip+0x1e428ec]        # 0x1424f9d20
0x006b7434: mov    r11,QWORD PTR [rip+0x1e428dd]        # 0x1424f9d18
0x006b743b: sub    r9,r11
0x006b743e: sar    r9,0x3
0x006b7442: test   r9,r9
0x006b7445: je     0x1406b747f
0x006b7447: sub    r9d,0x1
0x006b744b: js     0x1406b747f
0x006b744d: nop    DWORD PTR [rax]
0x006b7450: lea    ecx,[r9+rdx*1]
0x006b7454: sar    ecx,1
0x006b7456: movsxd rax,ecx
0x006b7459: mov    rbx,QWORD PTR [r11+rax*8]
0x006b745d: cmp    DWORD PTR [rbx+0xe0],r10d
0x006b7464: je     0x1406b74fe
0x006b746a: lea    eax,[rcx-0x1]
0x006b746d: cmovle eax,r9d
0x006b7471: mov    r9d,eax
0x006b7474: lea    eax,[rcx+0x1]
0x006b7477: cmovle edx,eax
0x006b747a: cmp    edx,r9d
0x006b747d: jle    0x1406b7450
0x006b747f: movabs rax,0x64696f5620656874 ; inline="the Void"
0x006b7489: mov    BYTE PTR [rsp+0x28],0x0
0x006b748e: mov    QWORD PTR [rsp+0x20],rax
0x006b7493: mov    QWORD PTR [rsp+0x30],0x8
0x006b749c: lea    rdx,[rsp+0x20]
0x006b74a1: cmp    QWORD PTR [rsp+0x38],0xf
0x006b74a7: cmova  rdx,QWORD PTR [rsp+0x20]
0x006b74ad: mov    r8,QWORD PTR [rsp+0x30]
0x006b74b2: mov    rcx,rbp
0x006b74b5: call   0x14006fa10
0x006b74ba: nop
0x006b74bb: mov    rdx,QWORD PTR [rsp+0x38]
0x006b74c0: cmp    rdx,0xf
0x006b74c4: jbe    0x1406b7573
0x006b74ca: inc    rdx
0x006b74cd: mov    rcx,QWORD PTR [rsp+0x20]
0x006b74d2: mov    rax,rcx
0x006b74d5: cmp    rdx,0x1000
0x006b74dc: jb     0x1406b756e
0x006b74e2: add    rdx,0x27
0x006b74e6: mov    rcx,QWORD PTR [rcx-0x8]
0x006b74ea: sub    rax,rcx
0x006b74ed: add    rax,0xfffffffffffffff8
0x006b74f1: cmp    rax,0x1f
0x006b74f5: jbe    0x1406b756e
0x006b74f7: call   QWORD PTR [rip+0xf2e62b]        # 0x1415e5b28
0x006b74fd: nop
0x006b74fe: test   rbx,rbx
0x006b7501: je     0x1406b747f
0x006b7507: mov    rax,QWORD PTR [rbx+0x130]
0x006b750e: test   rax,rax
0x006b7511: je     0x1406b753f
0x006b7513: mov    rcx,QWORD PTR [rax+0x58]
0x006b7517: test   rcx,rcx
0x006b751a: je     0x1406b753f
0x006b751c: mov    edx,DWORD PTR [rcx+0x30]
0x006b751f: cmp    edx,0xffffffff
0x006b7522: je     0x1406b753f
0x006b7524: lea    rcx,[rip+0x1e307bd]        # 0x1424e7ce8
0x006b752b: call   0x140072570
0x006b7530: test   rax,rax
0x006b7533: je     0x1406b753f
0x006b7535: mov    rcx,rax
0x006b7538: call   0x140c3a4f0
0x006b753d: jmp    0x1406b7543
0x006b753f: lea    rax,[rbx+0x38]
0x006b7543: test   rax,rax
0x006b7546: je     0x1406b747f
0x006b754c: cmp    BYTE PTR [rax+0x72],0x0
0x006b7550: je     0x1406b747f
0x006b7556: xor    r9d,r9d
0x006b7559: mov    r8b,0x1
0x006b755c: lea    rdx,[rsp+0x20]
0x006b7561: mov    rcx,rax
0x006b7564: call   0x140a946e0
0x006b7569: jmp    0x1406b749c
0x006b756e: call   0x141539680
0x006b7573: mov    rcx,QWORD PTR [rsp+0x40]
0x006b7578: xor    rcx,rsp
0x006b757b: call   0x141539660
0x006b7580: mov    rbx,QWORD PTR [rsp+0x60]
0x006b7585: mov    rbp,QWORD PTR [rsp+0x70]
0x006b758a: mov    rsi,QWORD PTR [rsp+0x78]
0x006b758f: add    rsp,0x50
0x006b7593: pop    rdi
0x006b7594: ret

# steam PE:6a70a6d9:02711000; adventure_option_talk_new_conversationst+8; RVA 0x6b75a0..0x6b77e5
0x006b75a0: mov    QWORD PTR [rsp+0x8],rbx
0x006b75a5: mov    QWORD PTR [rsp+0x18],rbp
0x006b75aa: mov    QWORD PTR [rsp+0x20],rsi
0x006b75af: push   rdi
0x006b75b0: sub    rsp,0x50
0x006b75b4: mov    rax,QWORD PTR [rip+0x11e4a85]        # 0x14189c040
0x006b75bb: xor    rax,rsp
0x006b75be: mov    QWORD PTR [rsp+0x40],rax
0x006b75c3: mov    rbp,rdx
0x006b75c6: mov    rsi,rcx
0x006b75c9: mov    r8d,0x1c
0x006b75cf: lea    rdx,[rip+0xfc3ed2]        # 0x14167b4a8 ; literal="Start new conversation with "
0x006b75d6: mov    rcx,rbp
0x006b75d9: call   0x14006f8d0
0x006b75de: xorps  xmm0,xmm0
0x006b75e1: movups XMMWORD PTR [rsp+0x20],xmm0
0x006b75e6: xor    edx,edx
0x006b75e8: mov    QWORD PTR [rsp+0x30],rdx
0x006b75ed: mov    QWORD PTR [rsp+0x38],0xf
0x006b75f6: mov    BYTE PTR [rsp+0x20],dl
0x006b75fa: mov    ebx,DWORD PTR [rsi+0x10]
0x006b75fd: cmp    ebx,0xffffffff
0x006b7600: je     0x1406b7673
0x006b7602: mov    r11,QWORD PTR [rip+0x1d2daaf]        # 0x1423e50b8
0x006b7609: mov    rdi,QWORD PTR [rip+0x1d2daa0]        # 0x1423e50b0
0x006b7610: sub    r11,rdi
0x006b7613: sar    r11,0x3
0x006b7617: test   r11d,r11d
0x006b761a: je     0x1406b7673
0x006b761c: sub    r11d,0x1
0x006b7620: mov    r9d,edx
0x006b7623: js     0x1406b765c
0x006b7625: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x006b7630: lea    ecx,[r9+r11*1]
0x006b7634: sar    ecx,1
0x006b7636: movsxd rax,ecx
0x006b7639: mov    r8,QWORD PTR [rdi+rax*8]
0x006b763d: cmp    DWORD PTR [r8+0x130],ebx
0x006b7644: je     0x1406b765f
0x006b7646: lea    eax,[rcx+0x1]
0x006b7649: cmovle r9d,eax
0x006b764d: lea    eax,[rcx-0x1]
0x006b7650: cmovle eax,r11d
0x006b7654: mov    r11d,eax
0x006b7657: cmp    r9d,eax
0x006b765a: jle    0x1406b7630
0x006b765c: mov    r8,rdx
0x006b765f: test   r8,r8
0x006b7662: je     0x1406b7673
0x006b7664: lea    rdx,[rsp+0x20]
0x006b7669: mov    rcx,r8
0x006b766c: call   0x141331500
0x006b7671: jmp    0x1406b76ec
0x006b7673: mov    r10d,DWORD PTR [rsi+0x14]
0x006b7677: cmp    r10d,0xffffffff
0x006b767b: je     0x1406b76cf
0x006b767d: mov    r9,QWORD PTR [rip+0x1e4269c]        # 0x1424f9d20
0x006b7684: mov    r11,QWORD PTR [rip+0x1e4268d]        # 0x1424f9d18
0x006b768b: sub    r9,r11
0x006b768e: sar    r9,0x3
0x006b7692: test   r9,r9
0x006b7695: je     0x1406b76cf
0x006b7697: sub    r9d,0x1
0x006b769b: js     0x1406b76cf
0x006b769d: nop    DWORD PTR [rax]
0x006b76a0: lea    ecx,[r9+rdx*1]
0x006b76a4: sar    ecx,1
0x006b76a6: movsxd rax,ecx
0x006b76a9: mov    rbx,QWORD PTR [r11+rax*8]
0x006b76ad: cmp    DWORD PTR [rbx+0xe0],r10d
0x006b76b4: je     0x1406b774e
0x006b76ba: lea    eax,[rcx-0x1]
0x006b76bd: cmovle eax,r9d
0x006b76c1: mov    r9d,eax
0x006b76c4: lea    eax,[rcx+0x1]
0x006b76c7: cmovle edx,eax
0x006b76ca: cmp    edx,r9d
0x006b76cd: jle    0x1406b76a0
0x006b76cf: movabs rax,0x64696f5620656874 ; inline="the Void"
0x006b76d9: mov    BYTE PTR [rsp+0x28],0x0
0x006b76de: mov    QWORD PTR [rsp+0x20],rax
0x006b76e3: mov    QWORD PTR [rsp+0x30],0x8
0x006b76ec: lea    rdx,[rsp+0x20]
0x006b76f1: cmp    QWORD PTR [rsp+0x38],0xf
0x006b76f7: cmova  rdx,QWORD PTR [rsp+0x20]
0x006b76fd: mov    r8,QWORD PTR [rsp+0x30]
0x006b7702: mov    rcx,rbp
0x006b7705: call   0x14006fa10
0x006b770a: nop
0x006b770b: mov    rdx,QWORD PTR [rsp+0x38]
0x006b7710: cmp    rdx,0xf
0x006b7714: jbe    0x1406b77c3
0x006b771a: inc    rdx
0x006b771d: mov    rcx,QWORD PTR [rsp+0x20]
0x006b7722: mov    rax,rcx
0x006b7725: cmp    rdx,0x1000
0x006b772c: jb     0x1406b77be
0x006b7732: add    rdx,0x27
0x006b7736: mov    rcx,QWORD PTR [rcx-0x8]
0x006b773a: sub    rax,rcx
0x006b773d: add    rax,0xfffffffffffffff8
0x006b7741: cmp    rax,0x1f
0x006b7745: jbe    0x1406b77be
0x006b7747: call   QWORD PTR [rip+0xf2e3db]        # 0x1415e5b28
0x006b774d: nop
0x006b774e: test   rbx,rbx
0x006b7751: je     0x1406b76cf
0x006b7757: mov    rax,QWORD PTR [rbx+0x130]
0x006b775e: test   rax,rax
0x006b7761: je     0x1406b778f
0x006b7763: mov    rcx,QWORD PTR [rax+0x58]
0x006b7767: test   rcx,rcx
0x006b776a: je     0x1406b778f
0x006b776c: mov    edx,DWORD PTR [rcx+0x30]
0x006b776f: cmp    edx,0xffffffff
0x006b7772: je     0x1406b778f
0x006b7774: lea    rcx,[rip+0x1e3056d]        # 0x1424e7ce8
0x006b777b: call   0x140072570
0x006b7780: test   rax,rax
0x006b7783: je     0x1406b778f
0x006b7785: mov    rcx,rax
0x006b7788: call   0x140c3a4f0
0x006b778d: jmp    0x1406b7793
0x006b778f: lea    rax,[rbx+0x38]
0x006b7793: test   rax,rax
0x006b7796: je     0x1406b76cf
0x006b779c: cmp    BYTE PTR [rax+0x72],0x0
0x006b77a0: je     0x1406b76cf
0x006b77a6: xor    r9d,r9d
0x006b77a9: mov    r8b,0x1
0x006b77ac: lea    rdx,[rsp+0x20]
0x006b77b1: mov    rcx,rax
0x006b77b4: call   0x140a946e0
0x006b77b9: jmp    0x1406b76ec
0x006b77be: call   0x141539680
0x006b77c3: mov    rcx,QWORD PTR [rsp+0x40]
0x006b77c8: xor    rcx,rsp
0x006b77cb: call   0x141539660
0x006b77d0: mov    rbx,QWORD PTR [rsp+0x60]
0x006b77d5: mov    rbp,QWORD PTR [rsp+0x70]
0x006b77da: mov    rsi,QWORD PTR [rsp+0x78]
0x006b77df: add    rsp,0x50
0x006b77e3: pop    rdi
0x006b77e4: ret

# steam PE:6a70a6d9:02711000; adventure_option_start_shoutingst+8; RVA 0x6b7990..0x6b79a5
0x006b7990: mov    rcx,rdx
0x006b7993: mov    r8d,0x16
0x006b7999: lea    rdx,[rip+0xfc3ad8]        # 0x14167b478 ; literal="Shout out to everybody"
0x006b79a0: jmp    0x14006f8d0

# steam PE:6a70a6d9:02711000; adventure_option_assume_identityst+8; RVA 0x6b79b0..0x6b79c5
0x006b79b0: mov    rcx,rdx
0x006b79b3: mov    r8d,0x12
0x006b79b9: lea    rdx,[rip+0xfc3ad0]        # 0x14167b490 ; literal="Assume an identity"
0x006b79c0: jmp    0x14006f8d0

# steam PE:6a70a6d9:02711000; direction-helper; RVA 0x74f220..0x74f3a9
0x0074f220: mov    QWORD PTR [rsp+0x8],rbx
0x0074f225: mov    QWORD PTR [rsp+0x10],rbp
0x0074f22a: mov    QWORD PTR [rsp+0x18],rdi
0x0074f22f: push   r12
0x0074f231: push   r14
0x0074f233: push   r15
0x0074f235: sub    rsp,0x20
0x0074f239: mov    rdi,QWORD PTR [rsp+0x70]
0x0074f23e: movzx  r15d,r9w
0x0074f242: movzx  r14d,WORD PTR [rsp+0x68]
0x0074f248: movzx  ebp,r8w
0x0074f24c: movzx  ebx,dx
0x0074f24f: movzx  r12d,cx
0x0074f253: cmp    r9w,cx
0x0074f257: jge    0x14074f2aa
0x0074f259: mov    rcx,rdi
0x0074f25c: cmp    WORD PTR [rsp+0x60],dx
0x0074f261: jge    0x14074f27a
0x0074f263: mov    r8d,0x2
0x0074f269: lea    rdx,[rip+0xf502b4]        # 0x14169f524 ; literal="NW"
0x0074f270: call   0x14006fa10
0x0074f275: jmp    0x14074f369
0x0074f27a: jle    0x14074f293
0x0074f27c: mov    r8d,0x2
0x0074f282: lea    rdx,[rip+0xf502a3]        # 0x14169f52c ; literal="SW"
0x0074f289: call   0x14006fa10
0x0074f28e: jmp    0x14074f369
0x0074f293: mov    r8d,0x4
0x0074f299: lea    rdx,[rip+0xf50294]        # 0x14169f534 ; literal="West"
0x0074f2a0: call   0x14006fa10
0x0074f2a5: jmp    0x14074f369
0x0074f2aa: jle    0x14074f2fa
0x0074f2ac: mov    rcx,rdi
0x0074f2af: cmp    WORD PTR [rsp+0x60],bx
0x0074f2b4: jge    0x14074f2cd
0x0074f2b6: mov    r8d,0x2
0x0074f2bc: lea    rdx,[rip+0xf50265]        # 0x14169f528 ; literal="NE"
0x0074f2c3: call   0x14006fa10
0x0074f2c8: jmp    0x14074f369
0x0074f2cd: jle    0x14074f2e6
0x0074f2cf: mov    r8d,0x2
0x0074f2d5: lea    rdx,[rip+0xf50254]        # 0x14169f530 ; literal="SE"
0x0074f2dc: call   0x14006fa10
0x0074f2e1: jmp    0x14074f369
0x0074f2e6: mov    r8d,0x4
0x0074f2ec: lea    rdx,[rip+0xf50249]        # 0x14169f53c ; literal="East"
0x0074f2f3: call   0x14006fa10
0x0074f2f8: jmp    0x14074f369
0x0074f2fa: cmp    WORD PTR [rsp+0x60],bx
0x0074f2ff: jge    0x14074f310
0x0074f301: lea    rdx,[rip+0xf5023c]        # 0x14169f544 ; literal="North"
0x0074f308: mov    r8d,0x5
0x0074f30e: jmp    0x14074f354
0x0074f310: jle    0x14074f321
0x0074f312: lea    rdx,[rip+0xf50233]        # 0x14169f54c ; literal="South"
0x0074f319: mov    r8d,0x5
0x0074f31f: jmp    0x14074f354
0x0074f321: cmp    r14w,bp
0x0074f325: jge    0x14074f336
0x0074f327: lea    rdx,[rip+0xf50226]        # 0x14169f554 ; literal="Below"
0x0074f32e: mov    r8d,0x5
0x0074f334: jmp    0x14074f354
0x0074f336: jle    0x14074f347
0x0074f338: lea    rdx,[rip+0xf5021d]        # 0x14169f55c ; literal="Above"
0x0074f33f: mov    r8d,0x5
0x0074f345: jmp    0x14074f354
0x0074f347: lea    rdx,[rip+0xf50216]        # 0x14169f564 ; literal="Here"
0x0074f34e: mov    r8d,0x4
0x0074f354: mov    rcx,rdi
0x0074f357: call   0x14006fa10
0x0074f35c: cmp    r15w,r12w
0x0074f360: jne    0x14074f369
0x0074f362: cmp    WORD PTR [rsp+0x60],bx
0x0074f367: je     0x14074f38f
0x0074f369: cmp    r14w,bp
0x0074f36d: jge    0x14074f378
0x0074f36f: lea    rdx,[rip+0xf501f6]        # 0x14169f56c ; literal="/Below"
0x0074f376: jmp    0x14074f381
0x0074f378: jle    0x14074f38f
0x0074f37a: lea    rdx,[rip+0xf501f3]        # 0x14169f574 ; literal="/Above"
0x0074f381: mov    r8d,0x6
0x0074f387: mov    rcx,rdi
0x0074f38a: call   0x14006fa10
0x0074f38f: mov    rbx,QWORD PTR [rsp+0x40]
0x0074f394: mov    rbp,QWORD PTR [rsp+0x48]
0x0074f399: mov    rdi,QWORD PTR [rsp+0x50]
0x0074f39e: add    rsp,0x20
0x0074f3a2: pop    r15
0x0074f3a4: pop    r14
0x0074f3a6: pop    r12
0x0074f3a8: ret

# steam PE:6a70a6d9:02711000; adventure_environment_ingest_from_containerst+16;adventure_environment_ingest_materialst+16;adventure_environment_pick_up_building_item_contentsst+16;adventure_environment_pick_up_building_itemst+16;adventure_environment_pick_up_environmentst+16;adventure_environment_pick_up_ground_itemst+16;adventure_environment_pick_vegetationst+16;adventure_environment_pickup_chop_treest+16;adventure_environment_pickup_ignite_vegst+16;adventure_environment_pickup_make_campfirest+16;adventure_environment_pickup_vermin_eventst+16;adventure_environment_place_in_bld_containerst+16;adventure_environment_place_in_it_containerst+16;adventure_environment_place_on_pack_animalst+16;adventure_environment_take_from_pack_animalst+16;adventure_environment_take_item_from_containerst+16;adventure_environment_unit_suck_bloodst+16;adventure_item_interact_fill_from_containerst+16;adventure_item_interact_fill_with_materialst+16;adventure_item_interact_give_namest+16;adventure_item_interact_heat_from_tilest+16;adventure_item_interact_load_ranged_weaponst+16;adventure_item_interact_pull_outst+16;adventure_item_interact_readst+16;adventure_item_interact_roll_allst+16;adventure_item_interact_rollst+16;adventure_item_interact_strugglest+16;adventure_item_interact_unnockst+16;adventure_movement_attack_creaturest+16;adventure_movement_building_interact_bash_down_doorst+16;adventure_movement_building_interact_break_in_hatchst+16;adventure_movement_building_interact_lower_well_bucketst+16;adventure_movement_building_interact_pick_door_lockst+16;adventure_movement_building_interact_pick_hatch_lockst+16;adventure_movement_building_interact_pull_leverst+16;adventure_movement_building_interact_raise_well_bucketst+16;adventure_movement_building_interact_topple_statuest+16;adventure_movement_claim_petst+16;adventure_movement_climbst+16;adventure_movement_combat_menu_creaturest+16;adventure_movement_dismountst+16;adventure_movement_hold_itemst+16;adventure_movement_hold_tilest+16;adventure_movement_item_interact_guidest+16;adventure_movement_item_interact_pushst+16;adventure_movement_item_interact_ridest+16;adventure_movement_jumpst+16;adventure_movement_lead_animalst+16;adventure_movement_mountst+16;adventure_movement_movest+16;adventure_movement_pathst+16;adventure_movement_release_hold_itemst+16;adventure_movement_release_hold_tilest+16;adventure_movement_shoot_creaturest+16;adventure_movement_shoot_tilest+16;adventure_movement_stop_lead_animalst+16;adventure_movement_throw_item_at_creaturest+16;adventure_movement_throw_item_at_tilest+16;adventure_option_assume_identityst+16;adventure_option_eat_item_contaminantst+16;adventure_option_eat_unit_contaminantst+16;adventure_option_interact_with_itemst+16;adventure_option_inventory_itemst+16;adventure_option_start_shoutingst+16;adventure_option_talk_existing_conversationst+16;adventure_option_talk_new_conversationst+16;adventure_option_view_contaminantst+16;adventure_option_view_unitst+16;adventure_optionst+16; RVA 0x7e1230..0x7e1246
0x007e1230: mov    rax,QWORD PTR [rcx]
0x007e1233: rex.W jmp QWORD PTR [rax+0x8]
0x007e1237: int3
0x007e1238: int3
0x007e1239: int3
0x007e123a: int3
0x007e123b: int3
0x007e123c: int3
0x007e123d: int3
0x007e123e: int3
0x007e123f: int3
0x007e1240: mov    eax,0xffff8ad0
0x007e1245: ret

# steam PE:6a70a6d9:02711000; adventure_item_interact_strugglest+8; RVA 0x7e12e0..0x7e12f5
0x007e12e0: mov    rcx,rdx
0x007e12e3: mov    r8d,0xf
0x007e12e9: lea    rdx,[rip+0xecc268]        # 0x1416ad558 ; literal="Gain possession"
0x007e12f0: jmp    0x14006f8d0

# steam PE:6a70a6d9:02711000; adventure_item_interact_pull_outst+8; RVA 0x7e1320..0x7e1335
0x007e1320: mov    rcx,rdx
0x007e1323: mov    r8d,0xb
0x007e1329: lea    rdx,[rip+0xecc218]        # 0x1416ad548 ; literal="Pull it out"
0x007e1330: jmp    0x14006f8d0

# steam PE:6a70a6d9:02711000; adventure_item_interact_unnockst+8; RVA 0x7e1340..0x7e1355
0x007e1340: mov    rcx,rdx
0x007e1343: mov    r8d,0xd
0x007e1349: lea    rdx,[rip+0xecc220]        # 0x1416ad570 ; literal="Cease nocking"
0x007e1350: jmp    0x14006f8d0

# steam PE:6a70a6d9:02711000; adventure_item_interact_readst+8; RVA 0x7e13d0..0x7e13e5
0x007e13d0: mov    rcx,rdx
0x007e13d3: mov    r8d,0x4
0x007e13d9: lea    rdx,[rip+0xe07240]        # 0x1415e8620 ; literal="Read"
0x007e13e0: jmp    0x14006f8d0

# steam PE:6a70a6d9:02711000; adventure_item_interact_rollst+8; RVA 0x7e13f0..0x7e1405
0x007e13f0: mov    rcx,rdx
0x007e13f3: mov    r8d,0x4
0x007e13f9: lea    rdx,[rip+0xecc168]        # 0x1416ad568 ; literal="Roll"
0x007e1400: jmp    0x14006f8d0

# steam PE:6a70a6d9:02711000; adventure_item_interact_roll_allst+8; RVA 0x7e1410..0x7e1425
0x007e1410: mov    rcx,rdx
0x007e1413: mov    r8d,0x8
0x007e1419: lea    rdx,[rip+0xecc0b0]        # 0x1416ad4d0 ; literal="Roll all"
0x007e1420: jmp    0x14006f8d0

# steam PE:6a70a6d9:02711000; adventure_item_interact_load_ranged_weaponst+8; RVA 0x834d50..0x834ead
0x00834d50: mov    QWORD PTR [rsp+0x18],rbx
0x00834d55: push   rdi
0x00834d56: sub    rsp,0x50
0x00834d5a: mov    rax,QWORD PTR [rip+0x10672df]        # 0x14189c040
0x00834d61: xor    rax,rsp
0x00834d64: mov    QWORD PTR [rsp+0x40],rax
0x00834d69: mov    rbx,rdx
0x00834d6c: mov    rdi,rcx
0x00834d6f: mov    QWORD PTR [rdx+0x10],0x0
0x00834d77: mov    rax,rdx
0x00834d7a: cmp    QWORD PTR [rdx+0x18],0xf
0x00834d7f: jbe    0x140834d84
0x00834d81: mov    rax,QWORD PTR [rdx]
0x00834d84: mov    BYTE PTR [rax],0x0
0x00834d87: mov    rcx,QWORD PTR [rcx+0x10]
0x00834d8b: test   rcx,rcx
0x00834d8e: je     0x140834dc4
0x00834d90: mov    rax,QWORD PTR [rcx]
0x00834d93: call   QWORD PTR [rax]
0x00834d95: cmp    ax,0x18
0x00834d99: jne    0x140834dc4
0x00834d9b: mov    rax,QWORD PTR [rdi+0x10]
0x00834d9f: mov    rcx,QWORD PTR [rax+0xe8]
0x00834da6: cmp    DWORD PTR [rcx+0x1cc],0x0
0x00834dad: jne    0x140834dc4
0x00834daf: mov    r8d,0x7
0x00834db5: lea    rdx,[rip+0xe7c1dc]        # 0x1416b0f98 ; literal="Nock in"
0x00834dbc: mov    rcx,rbx
0x00834dbf: call   0x14006f8d0
0x00834dc4: cmp    QWORD PTR [rbx+0x10],0x0
0x00834dc9: jne    0x140834de0
0x00834dcb: mov    r8d,0x9
0x00834dd1: lea    rdx,[rip+0xe7c288]        # 0x1416b1060 ; literal="Load into"
0x00834dd8: mov    rcx,rbx
0x00834ddb: call   0x14006f8d0
0x00834de0: cmp    QWORD PTR [rdi+0x10],0x0
0x00834de5: je     0x140834e95
0x00834deb: mov    r8d,0x1
0x00834df1: lea    rdx,[rip+0xdb3944]        # 0x1415e873c ; literal=" "
0x00834df8: mov    rcx,rbx
0x00834dfb: call   0x14006fa10
0x00834e00: xorps  xmm0,xmm0
0x00834e03: movups XMMWORD PTR [rsp+0x20],xmm0
0x00834e08: mov    QWORD PTR [rsp+0x30],0x0
0x00834e11: mov    QWORD PTR [rsp+0x38],0xf
0x00834e1a: mov    BYTE PTR [rsp+0x20],0x0
0x00834e1f: mov    r9d,0x1
0x00834e25: xor    r8d,r8d
0x00834e28: lea    rdx,[rsp+0x20]
0x00834e2d: mov    rcx,QWORD PTR [rdi+0x10]
0x00834e31: call   0x140c65450
0x00834e36: lea    rdx,[rsp+0x20]
0x00834e3b: cmp    QWORD PTR [rsp+0x38],0xf
0x00834e41: cmova  rdx,QWORD PTR [rsp+0x20]
0x00834e47: mov    r8,QWORD PTR [rsp+0x30]
0x00834e4c: mov    rcx,rbx
0x00834e4f: call   0x14006fa10
0x00834e54: nop
0x00834e55: mov    rdx,QWORD PTR [rsp+0x38]
0x00834e5a: cmp    rdx,0xf
0x00834e5e: jbe    0x140834e95
0x00834e60: inc    rdx
0x00834e63: mov    rcx,QWORD PTR [rsp+0x20]
0x00834e68: mov    rax,rcx
0x00834e6b: cmp    rdx,0x1000
0x00834e72: jb     0x140834e90
0x00834e74: add    rdx,0x27
0x00834e78: mov    rcx,QWORD PTR [rcx-0x8]
0x00834e7c: sub    rax,rcx
0x00834e7f: add    rax,0xfffffffffffffff8
0x00834e83: cmp    rax,0x1f
0x00834e87: jbe    0x140834e90
0x00834e89: call   QWORD PTR [rip+0xdb0c99]        # 0x1415e5b28
0x00834e8f: int3
0x00834e90: call   0x141539680
0x00834e95: mov    rcx,QWORD PTR [rsp+0x40]
0x00834e9a: xor    rcx,rsp
0x00834e9d: call   0x141539660
0x00834ea2: mov    rbx,QWORD PTR [rsp+0x70]
0x00834ea7: add    rsp,0x50
0x00834eab: pop    rdi
0x00834eac: ret

# steam PE:6a70a6d9:02711000; adventure_item_interact_fill_from_containerst+8; RVA 0x835260..0x835460
0x00835260: mov    QWORD PTR [rsp+0x18],rbx
0x00835265: mov    QWORD PTR [rsp+0x20],rdi
0x0083526a: push   rbp
0x0083526b: lea    rbp,[rsp-0x57]
0x00835270: sub    rsp,0x90
0x00835277: mov    rax,QWORD PTR [rip+0x1066dc2]        # 0x14189c040
0x0083527e: xor    rax,rsp
0x00835281: mov    QWORD PTR [rbp+0x47],rax
0x00835285: mov    rdi,rdx
0x00835288: mov    rbx,rcx
0x0083528b: mov    r8d,0x5
0x00835291: lea    rdx,[rip+0xe7bde4]        # 0x1416b107c ; literal="Fill "
0x00835298: mov    rcx,rdi
0x0083529b: call   0x14006f8d0
0x008352a0: xorps  xmm0,xmm0
0x008352a3: movups XMMWORD PTR [rbp+0x27],xmm0
0x008352a7: mov    QWORD PTR [rbp+0x37],0x0
0x008352af: mov    QWORD PTR [rbp+0x3f],0xf
0x008352b7: mov    BYTE PTR [rbp+0x27],0x0
0x008352bb: mov    r9d,0xffffffff
0x008352c1: xor    r8d,r8d
0x008352c4: lea    rdx,[rbp+0x27]
0x008352c8: mov    rcx,QWORD PTR [rbx+0x10]
0x008352cc: call   0x140c65450
0x008352d1: lea    rdx,[rbp+0x27]
0x008352d5: cmp    QWORD PTR [rbp+0x3f],0xf
0x008352da: cmova  rdx,QWORD PTR [rbp+0x27]
0x008352df: mov    r8,QWORD PTR [rbp+0x37]
0x008352e3: mov    rcx,rdi
0x008352e6: call   0x14006fa10
0x008352eb: mov    r8d,0x6
0x008352f1: lea    rdx,[rip+0xdb8684]        # 0x1415ed97c ; literal=" from "
0x008352f8: mov    rcx,rdi
0x008352fb: call   0x14006fa10
0x00835300: xorps  xmm0,xmm0
0x00835303: movups XMMWORD PTR [rbp+0x7],xmm0
0x00835307: mov    QWORD PTR [rbp+0x17],0x0
0x0083530f: mov    QWORD PTR [rbp+0x1f],0xf
0x00835317: mov    BYTE PTR [rbp+0x7],0x0
0x0083531b: mov    r9d,0xffffffff
0x00835321: xor    r8d,r8d
0x00835324: lea    rdx,[rbp+0x7]
0x00835328: mov    rcx,QWORD PTR [rbx+0x18]
0x0083532c: call   0x140c65450
0x00835331: lea    rdx,[rbp+0x7]
0x00835335: cmp    QWORD PTR [rbp+0x1f],0xf
0x0083533a: cmova  rdx,QWORD PTR [rbp+0x7]
0x0083533f: mov    r8,QWORD PTR [rbp+0x17]
0x00835343: mov    rcx,rdi
0x00835346: call   0x14006fa10
0x0083534b: mov    eax,0xffff8ad0
0x00835350: cmp    WORD PTR [rbx+0x20],ax
0x00835354: je     0x1408353af
0x00835356: mov    r8d,0x2
0x0083535c: lea    rdx,[rip+0xde01dd]        # 0x141615540 ; literal=" ("
0x00835363: mov    rcx,rdi
0x00835366: call   0x14006fa10
0x0083536b: mov    QWORD PTR [rsp+0x30],rdi
0x00835370: movzx  eax,WORD PTR [rbx+0x2a]
0x00835374: mov    WORD PTR [rsp+0x28],ax
0x00835379: movzx  eax,WORD PTR [rbx+0x28]
0x0083537d: mov    WORD PTR [rsp+0x20],ax
0x00835382: movzx  r9d,WORD PTR [rbx+0x26]
0x00835387: movzx  r8d,WORD PTR [rbx+0x24]
0x0083538c: movzx  edx,WORD PTR [rbx+0x22]
0x00835390: movzx  ecx,WORD PTR [rbx+0x20]
0x00835394: call   0x14074f220
0x00835399: mov    r8d,0x1
0x0083539f: lea    rdx,[rip+0xde01da]        # 0x141615580 ; literal=")"
0x008353a6: mov    rcx,rdi
0x008353a9: call   0x14006fa10
0x008353ae: nop
0x008353af: mov    rdx,QWORD PTR [rbp+0x1f]
0x008353b3: cmp    rdx,0xf
0x008353b7: jbe    0x1408353ed
0x008353b9: inc    rdx
0x008353bc: mov    rcx,QWORD PTR [rbp+0x7]
0x008353c0: mov    rax,rcx
0x008353c3: cmp    rdx,0x1000
0x008353ca: jb     0x1408353e8
0x008353cc: add    rdx,0x27
0x008353d0: mov    rcx,QWORD PTR [rcx-0x8]
0x008353d4: sub    rax,rcx
0x008353d7: add    rax,0xfffffffffffffff8
0x008353db: cmp    rax,0x1f
0x008353df: jbe    0x1408353e8
0x008353e1: call   QWORD PTR [rip+0xdb0741]        # 0x1415e5b28
0x008353e7: int3
0x008353e8: call   0x141539680
0x008353ed: mov    QWORD PTR [rbp+0x17],0x0
0x008353f5: mov    QWORD PTR [rbp+0x1f],0xf
0x008353fd: mov    BYTE PTR [rbp+0x7],0x0
0x00835401: mov    rdx,QWORD PTR [rbp+0x3f]
0x00835405: cmp    rdx,0xf
0x00835409: jbe    0x14083543f
0x0083540b: inc    rdx
0x0083540e: mov    rcx,QWORD PTR [rbp+0x27]
0x00835412: mov    rax,rcx
0x00835415: cmp    rdx,0x1000
0x0083541c: jb     0x14083543a
0x0083541e: add    rdx,0x27
0x00835422: mov    rcx,QWORD PTR [rcx-0x8]
0x00835426: sub    rax,rcx
0x00835429: add    rax,0xfffffffffffffff8
0x0083542d: cmp    rax,0x1f
0x00835431: jbe    0x14083543a
0x00835433: call   QWORD PTR [rip+0xdb06ef]        # 0x1415e5b28
0x00835439: int3
0x0083543a: call   0x141539680
0x0083543f: mov    rcx,QWORD PTR [rbp+0x47]
0x00835443: xor    rcx,rsp
0x00835446: call   0x141539660
0x0083544b: lea    r11,[rsp+0x90]
0x00835453: mov    rbx,QWORD PTR [r11+0x20]
0x00835457: mov    rdi,QWORD PTR [r11+0x28]
0x0083545b: mov    rsp,r11
0x0083545e: pop    rbp
0x0083545f: ret

# steam PE:6a70a6d9:02711000; adventure_item_interact_fill_with_materialst+8; RVA 0x835460..0x835d4a
0x00835460: mov    QWORD PTR [rsp+0x18],rbx
0x00835465: push   rbp
0x00835466: push   rsi
0x00835467: push   rdi
0x00835468: push   r12
0x0083546a: push   r13
0x0083546c: push   r14
0x0083546e: push   r15
0x00835470: lea    rbp,[rsp-0x27]
0x00835475: sub    rsp,0xe0
0x0083547c: mov    rax,QWORD PTR [rip+0x1066bbd]        # 0x14189c040
0x00835483: xor    rax,rsp
0x00835486: mov    QWORD PTR [rbp+0x1f],rax
0x0083548a: mov    rdi,rdx
0x0083548d: mov    QWORD PTR [rbp-0x69],rdx
0x00835491: mov    r13,rcx
0x00835494: mov    r8d,0x5
0x0083549a: lea    rdx,[rip+0xe7bbdb]        # 0x1416b107c ; literal="Fill "
0x008354a1: mov    rcx,rdi
0x008354a4: call   0x14006f8d0
0x008354a9: xorps  xmm0,xmm0
0x008354ac: movups XMMWORD PTR [rbp-0x1],xmm0
0x008354b0: mov    QWORD PTR [rbp+0xf],0x0
0x008354b8: mov    QWORD PTR [rbp+0x17],0xf
0x008354c0: mov    BYTE PTR [rbp-0x1],0x0
0x008354c4: mov    r9d,0xffffffff
0x008354ca: xor    r8d,r8d
0x008354cd: lea    rdx,[rbp-0x1]
0x008354d1: mov    rcx,QWORD PTR [r13+0x10]
0x008354d5: call   0x140c65450
0x008354da: lea    rdx,[rbp-0x1]
0x008354de: cmp    QWORD PTR [rbp+0x17],0xf
0x008354e3: cmova  rdx,QWORD PTR [rbp-0x1]
0x008354e8: mov    r8,QWORD PTR [rbp+0xf]
0x008354ec: mov    rcx,rdi
0x008354ef: call   0x14006fa10
0x008354f4: mov    r8d,0x6
0x008354fa: lea    rdx,[rip+0xdb90df]        # 0x1415ee5e0 ; literal=" with "
0x00835501: mov    rcx,rdi
0x00835504: call   0x14006fa10
0x00835509: movsx  r9,WORD PTR [r13+0x22]
0x0083550e: movsx  edx,WORD PTR [r13+0x20]
0x00835513: movsx  r8d,WORD PTR [r13+0x1e]
0x00835518: mov    esi,0xdb
0x0083551d: lea    r14,[rip+0xf53be4]        # 0x141789108 ; literal="unknown material"
0x00835524: test   r8w,r8w
0x00835528: js     0x1408358f9
0x0083552e: mov    r11d,DWORD PTR [rip+0x1cb2ba7]        # 0x1424e80dc
0x00835535: cmp    r8d,r11d
0x00835538: jge    0x140835900
0x0083553e: test   dx,dx
0x00835541: js     0x140835900
0x00835547: cmp    edx,DWORD PTR [rip+0x1cb2b93]        # 0x1424e80e0
0x0083554d: jge    0x140835900
0x00835553: test   r9w,r9w
0x00835557: js     0x140835900
0x0083555d: cmp    r9d,DWORD PTR [rip+0x1cb2b80]        # 0x1424e80e4
0x00835564: jge    0x140835900
0x0083556a: sar    r8w,0x4
0x0083556f: sar    dx,0x4
0x00835573: mov    rcx,QWORD PTR [rip+0x1cb2b2e]        # 0x1424e80a8
0x0083557a: test   rcx,rcx
0x0083557d: je     0x140835900
0x00835583: movsx  rax,r8w
0x00835587: movsx  rdx,dx
0x0083558b: mov    rax,QWORD PTR [rcx+rax*8]
0x0083558f: mov    rax,QWORD PTR [rax+rdx*8]
0x00835593: mov    rbx,QWORD PTR [rax+r9*8]
0x00835597: mov    QWORD PTR [rbp-0x71],rbx
0x0083559b: test   rbx,rbx
0x0083559e: je     0x140835900
0x008355a4: mov    rax,QWORD PTR [rbx+0x10]
0x008355a8: sub    rax,QWORD PTR [rbx+0x8]
0x008355ac: sar    rax,0x3
0x008355b0: sub    eax,0x1
0x008355b3: js     0x140835900
0x008355b9: movsxd rsi,eax
0x008355bc: mov    QWORD PTR [rbp-0x79],rsi
0x008355c0: mov    rax,QWORD PTR [rbx+0x8]
0x008355c4: mov    rcx,QWORD PTR [rax+rsi*8]
0x008355c8: mov    rax,QWORD PTR [rcx]
0x008355cb: call   QWORD PTR [rax]
0x008355cd: cmp    ax,0x3
0x008355d1: jne    0x1408358e6
0x008355d7: mov    rax,QWORD PTR [rbx+0x8]
0x008355db: mov    rdx,QWORD PTR [rax+rsi*8]
0x008355df: movsx  eax,WORD PTR [r13+0x1e]
0x008355e4: and    eax,0x8000000f
0x008355e9: jge    0x1408355f2
0x008355eb: dec    eax
0x008355ed: or     eax,0xfffffff0
0x008355f0: inc    eax
0x008355f2: movsxd r8,eax
0x008355f5: add    r8,r8
0x008355f8: movsx  eax,WORD PTR [r13+0x20]
0x008355fd: and    eax,0x8000000f
0x00835602: jge    0x14083560b
0x00835604: dec    eax
0x00835606: or     eax,0xfffffff0
0x00835609: inc    eax
0x0083560b: movsxd rcx,eax
0x0083560e: lea    rax,[rdx+r8*8]
0x00835612: cmp    BYTE PTR [rcx+rax*1+0x12],0x64
0x00835617: jb     0x1408358e6
0x0083561d: movsx  r12,WORD PTR [rdx+0x10]
0x00835622: cmp    r12d,0x2
0x00835626: je     0x1408358e6
0x0083562c: movzx  r15d,WORD PTR [rdx+0x8]
0x00835631: cmp    r15w,WORD PTR [r13+0x24]
0x00835636: jne    0x140835645
0x00835638: mov    eax,DWORD PTR [r13+0x28]
0x0083563c: cmp    DWORD PTR [rdx+0xc],eax
0x0083563f: je     0x1408358e6
0x00835645: xorps  xmm0,xmm0
0x00835648: movups XMMWORD PTR [rbp-0x21],xmm0
0x0083564c: mov    QWORD PTR [rbp-0x9],0xf
0x00835654: mov    edi,DWORD PTR [rdx+0xc]
0x00835657: mov    QWORD PTR [rbp-0x11],0x0
0x0083565f: mov    BYTE PTR [rbp-0x21],0x0
0x00835663: movzx  eax,r15w
0x00835667: mov    ecx,0xdb
0x0083566c: sub    ax,cx
0x0083566f: mov    ecx,0xc7
0x00835674: cmp    ax,cx
0x00835677: ja     0x1408357e7
0x0083567d: mov    r8,QWORD PTR [rip+0x1cc469c]        # 0x1424f9d20
0x00835684: mov    r10,QWORD PTR [rip+0x1cc468d]        # 0x1424f9d18
0x0083568b: sub    r8,r10
0x0083568e: sar    r8,0x3
0x00835692: test   r8,r8
0x00835695: je     0x1408357e7
0x0083569b: cmp    edi,0xffffffff
0x0083569e: je     0x1408357e7
0x008356a4: xor    edx,edx
0x008356a6: sub    r8d,0x1
0x008356aa: js     0x1408357e7
0x008356b0: lea    ecx,[r8+rdx*1]
0x008356b4: sar    ecx,1
0x008356b6: movsxd rax,ecx
0x008356b9: mov    rbx,QWORD PTR [r10+rax*8]
0x008356bd: cmp    DWORD PTR [rbx+0xe0],edi
0x008356c3: je     0x1408356df
0x008356c5: lea    eax,[rcx-0x1]
0x008356c8: cmovle eax,r8d
0x008356cc: mov    r8d,eax
0x008356cf: lea    eax,[rcx+0x1]
0x008356d2: cmovle edx,eax
0x008356d5: cmp    edx,r8d
0x008356d8: jle    0x1408356b0
0x008356da: jmp    0x1408357e7
0x008356df: test   rbx,rbx
0x008356e2: je     0x1408357e7
0x008356e8: cmp    BYTE PTR [rbx+0xaa],0x0
0x008356ef: je     0x1408357e7
0x008356f5: xorps  xmm0,xmm0
0x008356f8: movups XMMWORD PTR [rbp-0x61],xmm0
0x008356fc: xor    esi,esi
0x008356fe: mov    QWORD PTR [rbp-0x51],rsi
0x00835702: mov    r14d,0xf
0x00835708: mov    QWORD PTR [rbp-0x49],r14
0x0083570c: mov    BYTE PTR [rbp-0x61],sil
0x00835710: mov    rax,QWORD PTR [rbx+0x130]
0x00835717: test   rax,rax
0x0083571a: je     0x140835748
0x0083571c: mov    rcx,QWORD PTR [rax+0x58]
0x00835720: test   rcx,rcx
0x00835723: je     0x140835748
0x00835725: mov    edx,DWORD PTR [rcx+0x30]
0x00835728: cmp    edx,0xffffffff
0x0083572b: je     0x140835748
0x0083572d: lea    rcx,[rip+0x1cb25b4]        # 0x1424e7ce8
0x00835734: call   0x140072570
0x00835739: test   rax,rax
0x0083573c: je     0x140835748
0x0083573e: mov    rcx,rax
0x00835741: call   0x140c3a4f0
0x00835746: jmp    0x14083574c
0x00835748: lea    rax,[rbx+0x38]
0x0083574c: test   rax,rax
0x0083574f: je     0x140835771
0x00835751: cmp    BYTE PTR [rax+0x72],0x0
0x00835755: je     0x140835771
0x00835757: xor    r9d,r9d
0x0083575a: mov    r8b,0x1
0x0083575d: lea    rdx,[rbp-0x61]
0x00835761: mov    rcx,rax
0x00835764: call   0x140a946e0
0x00835769: mov    r14,QWORD PTR [rbp-0x49]
0x0083576d: mov    rsi,QWORD PTR [rbp-0x51]
0x00835771: lea    rdx,[rbp-0x61]
0x00835775: cmp    r14,0xf
0x00835779: cmova  rdx,QWORD PTR [rbp-0x61]
0x0083577e: mov    r8,rsi
0x00835781: lea    rcx,[rbp-0x21]
0x00835785: call   0x14006fa10
0x0083578a: mov    r8d,0x3
0x00835790: lea    rdx,[rip+0xdb838d]        # 0x1415edb24 ; literal="'s "
0x00835797: lea    rcx,[rbp-0x21]
0x0083579b: call   0x14006fa10
0x008357a0: nop
0x008357a1: mov    rdx,QWORD PTR [rbp-0x49]
0x008357a5: cmp    rdx,0xf
0x008357a9: jbe    0x1408357dc
0x008357ab: inc    rdx
0x008357ae: mov    rcx,QWORD PTR [rbp-0x61]
0x008357b2: mov    rax,rcx
0x008357b5: cmp    rdx,0x1000
0x008357bc: jb     0x1408357d7
0x008357be: add    rdx,0x27
0x008357c2: mov    rcx,QWORD PTR [rcx-0x8]
0x008357c6: sub    rax,rcx
0x008357c9: add    rax,0xfffffffffffffff8
0x008357cd: cmp    rax,0x1f
0x008357d1: ja     0x140835a9f
0x008357d7: call   0x141539680
0x008357dc: lea    r14,[rip+0xf53925]        # 0x141789108 ; literal="unknown material"
0x008357e3: mov    rsi,QWORD PTR [rbp-0x79]
0x008357e7: mov    r8d,edi
0x008357ea: movzx  edx,r15w
0x008357ee: lea    rcx,[rip+0x1b9bcfb]        # 0x1423d14f0
0x008357f5: call   0x1414add70
0x008357fa: mov    rbx,rax
0x008357fd: test   rax,rax
0x00835800: je     0x140835861
0x00835802: cmp    QWORD PTR [rax+0x530],0x0
0x0083580a: je     0x140835840
0x0083580c: lea    rdx,[rax+0x520]
0x00835813: mov    r8,QWORD PTR [rdx+0x10]
0x00835817: cmp    QWORD PTR [rdx+0x18],0xf
0x0083581c: jbe    0x140835821
0x0083581e: mov    rdx,QWORD PTR [rdx]
0x00835821: lea    rcx,[rbp-0x21]
0x00835825: call   0x14006fa10
0x0083582a: mov    r8d,0x1
0x00835830: lea    rdx,[rip+0xdb2f05]        # 0x1415e873c ; literal=" "
0x00835837: lea    rcx,[rbp-0x21]
0x0083583b: call   0x14006fa10
0x00835840: mov    rdx,r12
0x00835843: shl    rdx,0x5
0x00835847: add    rdx,0x178
0x0083584e: add    rdx,rbx
0x00835851: mov    r8,QWORD PTR [rdx+0x10]
0x00835855: cmp    QWORD PTR [rdx+0x18],0xf
0x0083585a: jbe    0x14083586a
0x0083585c: mov    rdx,QWORD PTR [rdx]
0x0083585f: jmp    0x14083586a
0x00835861: mov    rdx,r14
0x00835864: mov    r8d,0x10
0x0083586a: lea    rcx,[rbp-0x21]
0x0083586e: call   0x14006fa10
0x00835873: lea    rdx,[rbp-0x21]
0x00835877: cmp    QWORD PTR [rbp-0x9],0xf
0x0083587c: cmova  rdx,QWORD PTR [rbp-0x21]
0x00835881: mov    r8,QWORD PTR [rbp-0x11]
0x00835885: mov    rdi,QWORD PTR [rbp-0x69]
0x00835889: mov    rcx,rdi
0x0083588c: call   0x14006fa10
0x00835891: mov    r8d,0x1
0x00835897: lea    rdx,[rip+0xdb2e9e]        # 0x1415e873c ; literal=" "
0x0083589e: mov    rcx,rdi
0x008358a1: call   0x14006fa10
0x008358a6: nop
0x008358a7: mov    rdx,QWORD PTR [rbp-0x9]
0x008358ab: cmp    rdx,0xf
0x008358af: jbe    0x1408358e2
0x008358b1: inc    rdx
0x008358b4: mov    rcx,QWORD PTR [rbp-0x21]
0x008358b8: mov    rax,rcx
0x008358bb: cmp    rdx,0x1000
0x008358c2: jb     0x1408358dd
0x008358c4: add    rdx,0x27
0x008358c8: mov    rcx,QWORD PTR [rcx-0x8]
0x008358cc: sub    rax,rcx
0x008358cf: add    rax,0xfffffffffffffff8
0x008358d3: cmp    rax,0x1f
0x008358d7: ja     0x140835aa6
0x008358dd: call   0x141539680
0x008358e2: mov    rbx,QWORD PTR [rbp-0x71]
0x008358e6: sub    rsi,0x1
0x008358ea: mov    QWORD PTR [rbp-0x79],rsi
0x008358ee: jns    0x1408355c0
0x008358f4: mov    esi,0xdb
0x008358f9: mov    r11d,DWORD PTR [rip+0x1cb27dc]        # 0x1424e80dc
0x00835900: cmp    WORD PTR [r13+0x24],0x6
0x00835906: jne    0x1408359fe
0x0083590c: movsx  r10,WORD PTR [r13+0x22]
0x00835911: movsx  r9d,WORD PTR [r13+0x20]
0x00835916: movsx  r8d,WORD PTR [r13+0x1e]
0x0083591b: test   r8w,r8w
0x0083591f: js     0x1408359fe
0x00835925: cmp    r8d,r11d
0x00835928: jge    0x1408359fe
0x0083592e: test   r9w,r9w
0x00835932: js     0x1408359fe
0x00835938: cmp    r9d,DWORD PTR [rip+0x1cb27a1]        # 0x1424e80e0
0x0083593f: jge    0x1408359fe
0x00835945: test   r10w,r10w
0x00835949: js     0x1408359fe
0x0083594f: cmp    r10d,DWORD PTR [rip+0x1cb278e]        # 0x1424e80e4
0x00835956: jge    0x1408359fe
0x0083595c: movzx  eax,r8w
0x00835960: sar    ax,0x4
0x00835964: movzx  edx,r9w
0x00835968: sar    dx,0x4
0x0083596c: mov    rcx,QWORD PTR [rip+0x1cb2735]        # 0x1424e80a8
0x00835973: test   rcx,rcx
0x00835976: je     0x1408359fe
0x0083597c: movsx  rax,ax
0x00835980: movsx  rdx,dx
0x00835984: mov    rax,QWORD PTR [rcx+rax*8]
0x00835988: mov    rax,QWORD PTR [rax+rdx*8]
0x0083598c: mov    rbx,QWORD PTR [rax+r10*8]
0x00835990: test   rbx,rbx
0x00835993: je     0x1408359fe
0x00835995: mov    eax,r8d
0x00835998: and    eax,0x8000000f
0x0083599d: jge    0x1408359a6
0x0083599f: dec    eax
0x008359a1: or     eax,0xfffffff0
0x008359a4: inc    eax
0x008359a6: movsxd rcx,eax
0x008359a9: shl    rcx,0x4
0x008359ad: mov    eax,r9d
0x008359b0: and    eax,0x8000000f
0x008359b5: jge    0x1408359be
0x008359b7: dec    eax
0x008359b9: or     eax,0xfffffff0
0x008359bc: inc    eax
0x008359be: cdqe
0x008359c0: add    rcx,rax
0x008359c3: mov    ebx,DWORD PTR [rbx+rcx*4+0x2a0]
0x008359ca: bt     ebx,0x1e
0x008359ce: jae    0x1408359e5
0x008359d0: mov    r8d,0x9
0x008359d6: lea    rdx,[rip+0xe7b693]        # 0x1416b1070 ; literal="stagnant "
0x008359dd: mov    rcx,rdi
0x008359e0: call   0x14006fa10
0x008359e5: test   ebx,ebx
0x008359e7: jns    0x1408359fe
0x008359e9: mov    r8d,0x5
0x008359ef: lea    rdx,[rip+0xe7b62e]        # 0x1416b1024 ; literal="salt "
0x008359f6: mov    rcx,rdi
0x008359f9: call   0x14006fa10
0x008359fe: xorps  xmm0,xmm0
0x00835a01: movups XMMWORD PTR [rbp-0x41],xmm0
0x00835a05: mov    QWORD PTR [rbp-0x29],0xf
0x00835a0d: movsx  r12,WORD PTR [r13+0x2c]
0x00835a12: mov    edi,DWORD PTR [r13+0x28]
0x00835a16: movzx  r15d,WORD PTR [r13+0x24]
0x00835a1b: mov    QWORD PTR [rbp-0x31],0x0
0x00835a23: mov    BYTE PTR [rbp-0x41],0x0
0x00835a27: movzx  eax,r15w
0x00835a2b: sub    ax,si
0x00835a2e: mov    ecx,0xc7
0x00835a33: cmp    ax,cx
0x00835a36: ja     0x140835bad
0x00835a3c: mov    r8,QWORD PTR [rip+0x1cc42dd]        # 0x1424f9d20
0x00835a43: mov    r10,QWORD PTR [rip+0x1cc42ce]        # 0x1424f9d18
0x00835a4a: sub    r8,r10
0x00835a4d: sar    r8,0x3
0x00835a51: test   r8,r8
0x00835a54: je     0x140835bad
0x00835a5a: cmp    edi,0xffffffff
0x00835a5d: je     0x140835bad
0x00835a63: xor    edx,edx
0x00835a65: sub    r8d,0x1
0x00835a69: js     0x140835bad
0x00835a6f: nop
0x00835a70: lea    ecx,[r8+rdx*1]
0x00835a74: sar    ecx,1
0x00835a76: movsxd rax,ecx
0x00835a79: mov    rbx,QWORD PTR [r10+rax*8]
0x00835a7d: cmp    DWORD PTR [rbx+0xe0],edi
0x00835a83: je     0x140835aad
0x00835a85: lea    eax,[rcx-0x1]
0x00835a88: cmovle eax,r8d
0x00835a8c: mov    r8d,eax
0x00835a8f: lea    eax,[rcx+0x1]
0x00835a92: cmovle edx,eax
0x00835a95: cmp    edx,r8d
0x00835a98: jle    0x140835a70
0x00835a9a: jmp    0x140835bad
0x00835a9f: call   QWORD PTR [rip+0xdb0083]        # 0x1415e5b28
0x00835aa5: nop
0x00835aa6: call   QWORD PTR [rip+0xdb007c]        # 0x1415e5b28
0x00835aac: nop
0x00835aad: test   rbx,rbx
0x00835ab0: je     0x140835bad
0x00835ab6: cmp    BYTE PTR [rbx+0xaa],0x0
0x00835abd: je     0x140835bad
0x00835ac3: xorps  xmm0,xmm0
0x00835ac6: movups XMMWORD PTR [rbp-0x61],xmm0
0x00835aca: xor    esi,esi
0x00835acc: mov    QWORD PTR [rbp-0x51],rsi
0x00835ad0: mov    r14d,0xf
0x00835ad6: mov    QWORD PTR [rbp-0x49],r14
0x00835ada: mov    BYTE PTR [rbp-0x61],sil
0x00835ade: mov    rax,QWORD PTR [rbx+0x130]
0x00835ae5: test   rax,rax
0x00835ae8: je     0x140835b16
0x00835aea: mov    rdx,QWORD PTR [rax+0x58]
0x00835aee: test   rdx,rdx
0x00835af1: je     0x140835b16
0x00835af3: mov    edx,DWORD PTR [rdx+0x30]
0x00835af6: cmp    edx,0xffffffff
0x00835af9: je     0x140835b16
0x00835afb: lea    rcx,[rip+0x1cb21e6]        # 0x1424e7ce8
0x00835b02: call   0x140072570
0x00835b07: test   rax,rax
0x00835b0a: je     0x140835b16
0x00835b0c: mov    rcx,rax
0x00835b0f: call   0x140c3a4f0
0x00835b14: jmp    0x140835b1a
0x00835b16: lea    rax,[rbx+0x38]
0x00835b1a: test   rax,rax
0x00835b1d: je     0x140835b3f
0x00835b1f: cmp    BYTE PTR [rax+0x72],0x0
0x00835b23: je     0x140835b3f
0x00835b25: xor    r9d,r9d
0x00835b28: mov    r8b,0x1
0x00835b2b: lea    rdx,[rbp-0x61]
0x00835b2f: mov    rcx,rax
0x00835b32: call   0x140a946e0
0x00835b37: mov    r14,QWORD PTR [rbp-0x49]
0x00835b3b: mov    rsi,QWORD PTR [rbp-0x51]
0x00835b3f: lea    rdx,[rbp-0x61]
0x00835b43: cmp    r14,0xf
0x00835b47: cmova  rdx,QWORD PTR [rbp-0x61]
0x00835b4c: mov    r8,rsi
0x00835b4f: lea    rcx,[rbp-0x41]
0x00835b53: call   0x14006fa10
0x00835b58: mov    r8d,0x3
0x00835b5e: lea    rdx,[rip+0xdb7fbf]        # 0x1415edb24 ; literal="'s "
0x00835b65: lea    rcx,[rbp-0x41]
0x00835b69: call   0x14006fa10
0x00835b6e: nop
0x00835b6f: mov    rdx,QWORD PTR [rbp-0x49]
0x00835b73: cmp    rdx,0xf
0x00835b77: jbe    0x140835bad
0x00835b79: inc    rdx
0x00835b7c: mov    rcx,QWORD PTR [rbp-0x61]
0x00835b80: mov    rax,rcx
0x00835b83: cmp    rdx,0x1000
0x00835b8a: jb     0x140835ba8
0x00835b8c: add    rdx,0x27
0x00835b90: mov    rcx,QWORD PTR [rcx-0x8]
0x00835b94: sub    rax,rcx
0x00835b97: add    rax,0xfffffffffffffff8
0x00835b9b: cmp    rax,0x1f
0x00835b9f: jbe    0x140835ba8
0x00835ba1: call   QWORD PTR [rip+0xdaff81]        # 0x1415e5b28
0x00835ba7: int3
0x00835ba8: call   0x141539680
0x00835bad: mov    r8d,edi
0x00835bb0: movzx  edx,r15w
0x00835bb4: lea    rcx,[rip+0x1b9b935]        # 0x1423d14f0
0x00835bbb: call   0x1414add70
0x00835bc0: mov    rbx,rax
0x00835bc3: test   rax,rax
0x00835bc6: je     0x140835c26
0x00835bc8: cmp    QWORD PTR [rax+0x530],0x0
0x00835bd0: je     0x140835c06
0x00835bd2: lea    rdx,[rax+0x520]
0x00835bd9: mov    r8,QWORD PTR [rdx+0x10]
0x00835bdd: cmp    QWORD PTR [rdx+0x18],0xf
0x00835be2: jbe    0x140835be7
0x00835be4: mov    rdx,QWORD PTR [rdx]
0x00835be7: lea    rcx,[rbp-0x41]
0x00835beb: call   0x14006fa10
0x00835bf0: mov    r8d,0x1
0x00835bf6: lea    rdx,[rip+0xdb2b3f]        # 0x1415e873c ; literal=" "
0x00835bfd: lea    rcx,[rbp-0x41]
0x00835c01: call   0x14006fa10
0x00835c06: mov    rax,r12
0x00835c09: shl    rax,0x5
0x00835c0d: add    rax,0xb8
0x00835c13: add    rax,rbx
0x00835c16: mov    rcx,QWORD PTR [rax+0x10]
0x00835c1a: cmp    QWORD PTR [rax+0x18],0xf
0x00835c1f: jbe    0x140835c32
0x00835c21: mov    rax,QWORD PTR [rax]
0x00835c24: jmp    0x140835c32
0x00835c26: lea    rax,[rip+0xf534db]        # 0x141789108 ; literal="unknown material"
0x00835c2d: mov    ecx,0x10
0x00835c32: mov    r8,rcx
0x00835c35: mov    rdx,rax
0x00835c38: lea    rcx,[rbp-0x41]
0x00835c3c: call   0x14006fa10
0x00835c41: lea    rdx,[rbp-0x41]
0x00835c45: cmp    QWORD PTR [rbp-0x29],0xf
0x00835c4a: cmova  rdx,QWORD PTR [rbp-0x41]
0x00835c4f: mov    r8,QWORD PTR [rbp-0x31]
0x00835c53: mov    rbx,QWORD PTR [rbp-0x69]
0x00835c57: mov    rcx,rbx
0x00835c5a: call   0x14006fa10
0x00835c5f: mov    eax,0xffff8ad0
0x00835c64: cmp    WORD PTR [r13+0x18],ax
0x00835c69: je     0x140835cc8
0x00835c6b: mov    r8d,0x2
0x00835c71: lea    rdx,[rip+0xddf8c8]        # 0x141615540 ; literal=" ("
0x00835c78: mov    rcx,rbx
0x00835c7b: call   0x14006fa10
0x00835c80: mov    QWORD PTR [rsp+0x30],rbx
0x00835c85: movzx  eax,WORD PTR [r13+0x22]
0x00835c8a: mov    WORD PTR [rsp+0x28],ax
0x00835c8f: movzx  eax,WORD PTR [r13+0x20]
0x00835c94: mov    WORD PTR [rsp+0x20],ax
0x00835c99: movzx  r9d,WORD PTR [r13+0x1e]
0x00835c9e: movzx  r8d,WORD PTR [r13+0x1c]
0x00835ca3: movzx  edx,WORD PTR [r13+0x1a]
0x00835ca8: movzx  ecx,WORD PTR [r13+0x18]
0x00835cad: call   0x14074f220
0x00835cb2: mov    r8d,0x1
0x00835cb8: lea    rdx,[rip+0xddf8c1]        # 0x141615580 ; literal=")"
0x00835cbf: mov    rcx,rbx
0x00835cc2: call   0x14006fa10
0x00835cc7: nop
0x00835cc8: mov    rdx,QWORD PTR [rbp-0x29]
0x00835ccc: cmp    rdx,0xf
0x00835cd0: jbe    0x140835d06
0x00835cd2: inc    rdx
0x00835cd5: mov    rcx,QWORD PTR [rbp-0x41]
0x00835cd9: mov    rax,rcx
0x00835cdc: cmp    rdx,0x1000
0x00835ce3: jb     0x140835d01
0x00835ce5: add    rdx,0x27
0x00835ce9: mov    rcx,QWORD PTR [rcx-0x8]
0x00835ced: sub    rax,rcx
0x00835cf0: add    rax,0xfffffffffffffff8
0x00835cf4: cmp    rax,0x1f
0x00835cf8: jbe    0x140835d01
0x00835cfa: call   QWORD PTR [rip+0xdafe28]        # 0x1415e5b28
0x00835d00: int3
0x00835d01: call   0x141539680
0x00835d06: mov    QWORD PTR [rbp-0x31],0x0
0x00835d0e: mov    QWORD PTR [rbp-0x29],0xf
0x00835d16: mov    BYTE PTR [rbp-0x41],0x0
0x00835d1a: lea    rcx,[rbp-0x1]
0x00835d1e: call   0x14006f850
0x00835d23: mov    rcx,QWORD PTR [rbp+0x1f]
0x00835d27: xor    rcx,rsp
0x00835d2a: call   0x141539660
0x00835d2f: mov    rbx,QWORD PTR [rsp+0x130]
0x00835d37: add    rsp,0xe0
0x00835d3e: pop    r15
0x00835d40: pop    r14
0x00835d42: pop    r13
0x00835d44: pop    r12
0x00835d46: pop    rdi
0x00835d47: pop    rsi
0x00835d48: pop    rbp
0x00835d49: ret

# steam PE:6a70a6d9:02711000; adventure_item_interact_give_namest+8; RVA 0x835d50..0x835e31
0x00835d50: mov    QWORD PTR [rsp+0x18],rbx
0x00835d55: push   rdi
0x00835d56: sub    rsp,0x50
0x00835d5a: mov    rax,QWORD PTR [rip+0x10662df]        # 0x14189c040
0x00835d61: xor    rax,rsp
0x00835d64: mov    QWORD PTR [rsp+0x40],rax
0x00835d69: mov    rdi,rdx
0x00835d6c: mov    rbx,rcx
0x00835d6f: mov    r8d,0x9
0x00835d75: lea    rdx,[rip+0xe7b29c]        # 0x1416b1018 ; literal="Name the "
0x00835d7c: mov    rcx,rdi
0x00835d7f: call   0x14006f8d0
0x00835d84: xorps  xmm0,xmm0
0x00835d87: movups XMMWORD PTR [rsp+0x20],xmm0
0x00835d8c: mov    QWORD PTR [rsp+0x30],0x0
0x00835d95: mov    QWORD PTR [rsp+0x38],0xf
0x00835d9e: mov    BYTE PTR [rsp+0x20],0x0
0x00835da3: mov    r9d,0xffffffff
0x00835da9: xor    r8d,r8d
0x00835dac: lea    rdx,[rsp+0x20]
0x00835db1: mov    rcx,QWORD PTR [rbx+0x10]
0x00835db5: call   0x140c65450
0x00835dba: lea    rdx,[rsp+0x20]
0x00835dbf: cmp    QWORD PTR [rsp+0x38],0xf
0x00835dc5: cmova  rdx,QWORD PTR [rsp+0x20]
0x00835dcb: mov    r8,QWORD PTR [rsp+0x30]
0x00835dd0: mov    rcx,rdi
0x00835dd3: call   0x14006fa10
0x00835dd8: nop
0x00835dd9: mov    rdx,QWORD PTR [rsp+0x38]
0x00835dde: cmp    rdx,0xf
0x00835de2: jbe    0x140835e19
0x00835de4: inc    rdx
0x00835de7: mov    rcx,QWORD PTR [rsp+0x20]
0x00835dec: mov    rax,rcx
0x00835def: cmp    rdx,0x1000
0x00835df6: jb     0x140835e14
0x00835df8: add    rdx,0x27
0x00835dfc: mov    rcx,QWORD PTR [rcx-0x8]
0x00835e00: sub    rax,rcx
0x00835e03: add    rax,0xfffffffffffffff8
0x00835e07: cmp    rax,0x1f
0x00835e0b: jbe    0x140835e14
0x00835e0d: call   QWORD PTR [rip+0xdafd15]        # 0x1415e5b28
0x00835e13: int3
0x00835e14: call   0x141539680
0x00835e19: mov    rcx,QWORD PTR [rsp+0x40]
0x00835e1e: xor    rcx,rsp
0x00835e21: call   0x141539660
0x00835e26: mov    rbx,QWORD PTR [rsp+0x70]
0x00835e2b: add    rsp,0x50
0x00835e2f: pop    rdi
0x00835e30: ret

# steam PE:6a70a6d9:02711000; adventure_item_interact_heat_from_tilest+8; RVA 0x835e40..0x83609c
0x00835e40: mov    QWORD PTR [rsp+0x18],rbx
0x00835e45: mov    QWORD PTR [rsp+0x20],rsi
0x00835e4a: push   rdi
0x00835e4b: sub    rsp,0x70
0x00835e4f: mov    rax,QWORD PTR [rip+0x10661ea]        # 0x14189c040
0x00835e56: xor    rax,rsp
0x00835e59: mov    QWORD PTR [rsp+0x60],rax
0x00835e5e: mov    rbx,rdx
0x00835e61: mov    rdi,rcx
0x00835e64: mov    r8d,0x5
0x00835e6a: lea    rdx,[rip+0xe7b1cb]        # 0x1416b103c ; literal="Heat "
0x00835e71: mov    rcx,rbx
0x00835e74: call   0x14006f8d0
0x00835e79: xorps  xmm0,xmm0
0x00835e7c: movups XMMWORD PTR [rsp+0x40],xmm0
0x00835e81: xor    esi,esi
0x00835e83: mov    QWORD PTR [rsp+0x50],rsi
0x00835e88: mov    QWORD PTR [rsp+0x58],0xf
0x00835e91: mov    BYTE PTR [rsp+0x40],sil
0x00835e96: mov    r9d,0xffffffff
0x00835e9c: xor    r8d,r8d
0x00835e9f: lea    rdx,[rsp+0x40]
0x00835ea4: mov    rcx,QWORD PTR [rdi+0x10]
0x00835ea8: call   0x140c65450
0x00835ead: lea    rdx,[rsp+0x40]
0x00835eb2: cmp    QWORD PTR [rsp+0x58],0xf
0x00835eb8: cmova  rdx,QWORD PTR [rsp+0x40]
0x00835ebe: mov    r8,QWORD PTR [rsp+0x50]
0x00835ec3: mov    rcx,rbx
0x00835ec6: call   0x14006fa10
0x00835ecb: movzx  r9d,WORD PTR [rdi+0x22]
0x00835ed0: movzx  r8d,WORD PTR [rdi+0x20]
0x00835ed5: movzx  edx,WORD PTR [rdi+0x1e]
0x00835ed9: lea    rcx,[rip+0x1b9b610]        # 0x1423d14f0
0x00835ee0: call   0x1402c3a90
0x00835ee5: movzx  r8d,WORD PTR [rdi+0x20]
0x00835eea: movzx  edx,WORD PTR [rdi+0x1e]
0x00835eee: lea    rcx,[rip+0x1b9b5fb]        # 0x1423d14f0
0x00835ef5: test   al,al
0x00835ef7: jle    0x140835f25
0x00835ef9: call   0x14007dc40
0x00835efe: bt     eax,0xf
0x00835f02: setb   sil
0x00835f06: lea    r8,[rsi+0xa]
0x00835f0a: lea    rcx,[rip+0xe7af97]        # 0x1416b0ea8 ; literal=" near magma"
0x00835f11: lea    rdx,[rip+0xe7b118]        # 0x1416b1030 ; literal=" near lava"
0x00835f18: bt     eax,0xf
0x00835f1c: cmovb  rdx,rcx
0x00835f20: jmp    0x140835fa6
0x00835f25: call   0x140067f80
0x00835f2a: movzx  r9d,ax
0x00835f2e: add    r9d,0xffffffbd
0x00835f32: cmp    r9d,0x9
0x00835f36: ja     0x140835fae
0x00835f38: movsxd rax,r9d
0x00835f3b: lea    rdx,[rip+0xffffffffff7ca0be]        # 0x140000000
0x00835f42: mov    ecx,DWORD PTR [rdx+rax*4+0x836074]
0x00835f49: add    rcx,rdx
0x00835f4c: jmp    rcx
0x00835f4e: mov    r8d,0x13
0x00835f54: lea    rdx,[rip+0xe7af35]        # 0x1416b0e90 ; literal=" near burning trunk"
0x00835f5b: jmp    0x140835fa6
0x00835f5d: mov    r8d,0x16
0x00835f63: lea    rdx,[rip+0xe7af66]        # 0x1416b0ed0 ; literal=" near burning branches"
0x00835f6a: jmp    0x140835fa6
0x00835f6c: mov    r8d,0x13
0x00835f72: lea    rdx,[rip+0xe7af3f]        # 0x1416b0eb8 ; literal=" near burning twigs"
0x00835f79: jmp    0x140835fa6
0x00835f7b: mov    r8d,0x11
0x00835f81: lea    rdx,[rip+0xe7aed0]        # 0x1416b0e58 ; literal=" near burning cap"
0x00835f88: jmp    0x140835fa6
0x00835f8a: mov    r8d,0xa
0x00835f90: lea    rdx,[rip+0xe7aeb1]        # 0x1416b0e48 ; literal=" near fire"
0x00835f97: jmp    0x140835fa6
0x00835f99: mov    r8d,0xe
0x00835f9f: lea    rdx,[rip+0xe7aeda]        # 0x1416b0e80 ; literal=" near campfire"
0x00835fa6: mov    rcx,rbx
0x00835fa9: call   0x14006fa10
0x00835fae: mov    eax,0xffff8ad0
0x00835fb3: cmp    WORD PTR [rdi+0x18],ax
0x00835fb7: je     0x140836012
0x00835fb9: mov    r8d,0x2
0x00835fbf: lea    rdx,[rip+0xddf57a]        # 0x141615540 ; literal=" ("
0x00835fc6: mov    rcx,rbx
0x00835fc9: call   0x14006fa10
0x00835fce: mov    QWORD PTR [rsp+0x30],rbx
0x00835fd3: movzx  eax,WORD PTR [rdi+0x22]
0x00835fd7: mov    WORD PTR [rsp+0x28],ax
0x00835fdc: movzx  eax,WORD PTR [rdi+0x20]
0x00835fe0: mov    WORD PTR [rsp+0x20],ax
0x00835fe5: movzx  r9d,WORD PTR [rdi+0x1e]
0x00835fea: movzx  r8d,WORD PTR [rdi+0x1c]
0x00835fef: movzx  edx,WORD PTR [rdi+0x1a]
0x00835ff3: movzx  ecx,WORD PTR [rdi+0x18]
0x00835ff7: call   0x14074f220
0x00835ffc: mov    r8d,0x1
0x00836002: lea    rdx,[rip+0xddf577]        # 0x141615580 ; literal=")"
0x00836009: mov    rcx,rbx
0x0083600c: call   0x14006fa10
0x00836011: nop
0x00836012: mov    rdx,QWORD PTR [rsp+0x58]
0x00836017: cmp    rdx,0xf
0x0083601b: jbe    0x140836052
0x0083601d: inc    rdx
0x00836020: mov    rcx,QWORD PTR [rsp+0x40]
0x00836025: mov    rax,rcx
0x00836028: cmp    rdx,0x1000
0x0083602f: jb     0x14083604d
0x00836031: add    rdx,0x27
0x00836035: mov    rcx,QWORD PTR [rcx-0x8]
0x00836039: sub    rax,rcx
0x0083603c: add    rax,0xfffffffffffffff8
0x00836040: cmp    rax,0x1f
0x00836044: jbe    0x14083604d
0x00836046: call   QWORD PTR [rip+0xdafadc]        # 0x1415e5b28
0x0083604c: int3
0x0083604d: call   0x141539680
0x00836052: mov    rcx,QWORD PTR [rsp+0x60]
0x00836057: xor    rcx,rsp
0x0083605a: call   0x141539660
0x0083605f: lea    r11,[rsp+0x70]
0x00836064: mov    rbx,QWORD PTR [r11+0x20]
0x00836068: mov    rsi,QWORD PTR [r11+0x28]
0x0083606c: mov    rsp,r11
0x0083606f: pop    rdi
0x00836070: ret
0x00836071: nop    DWORD PTR [rax]
0x00836074: cdq
0x00836075: pop    rdi
0x00836076: add    DWORD PTR [rax],0xffffffae
0x00836079: pop    rdi
0x0083607a: add    DWORD PTR [rax],0xffffffae
0x0083607d: pop    rdi
0x0083607e: add    DWORD PTR [rax],0xffffff8a
0x00836081: pop    rdi
0x00836082: add    DWORD PTR [rax],0x4e
0x00836085: pop    rdi
0x00836086: add    DWORD PTR [rax],0x5d
0x00836089: pop    rdi
0x0083608a: add    DWORD PTR [rax],0x6c
0x0083608d: pop    rdi
0x0083608e: add    DWORD PTR [rax],0x7b
0x00836091: pop    rdi
0x00836092: add    DWORD PTR [rax],0x7b
0x00836095: pop    rdi
0x00836096: add    DWORD PTR [rax],0x7b
0x00836099: pop    rdi
0x0083609a: .byte 0x83

# steam PE:6a70a6d9:02711000; adventure_environment_place_on_pack_animalst+8; RVA 0x837ea0..0x837fe1
0x00837ea0: mov    QWORD PTR [rsp+0x18],rbx
0x00837ea5: push   rdi
0x00837ea6: sub    rsp,0x70
0x00837eaa: mov    rax,QWORD PTR [rip+0x106418f]        # 0x14189c040
0x00837eb1: xor    rax,rsp
0x00837eb4: mov    QWORD PTR [rsp+0x60],rax
0x00837eb9: mov    rdi,rdx
0x00837ebc: mov    rbx,rcx
0x00837ebf: mov    r8d,0x7
0x00837ec5: lea    rdx,[rip+0xe7903c]        # 0x1416b0f08 ; literal="Put on "
0x00837ecc: mov    rcx,rdi
0x00837ecf: call   0x14006f8d0
0x00837ed4: xorps  xmm0,xmm0
0x00837ed7: movups XMMWORD PTR [rsp+0x40],xmm0
0x00837edc: mov    QWORD PTR [rsp+0x50],0x0
0x00837ee5: mov    QWORD PTR [rsp+0x58],0xf
0x00837eee: mov    BYTE PTR [rsp+0x40],0x0
0x00837ef3: xor    r8d,r8d
0x00837ef6: lea    rdx,[rsp+0x40]
0x00837efb: mov    rcx,QWORD PTR [rbx+0x28]
0x00837eff: call   0x141330c30
0x00837f04: lea    rdx,[rsp+0x40]
0x00837f09: cmp    QWORD PTR [rsp+0x58],0xf
0x00837f0f: cmova  rdx,QWORD PTR [rsp+0x40]
0x00837f15: mov    r8,QWORD PTR [rsp+0x50]
0x00837f1a: mov    rcx,rdi
0x00837f1d: call   0x14006fa10
0x00837f22: mov    eax,0xffff8ad0
0x00837f27: cmp    WORD PTR [rbx+0x16],ax
0x00837f2b: je     0x140837f86
0x00837f2d: mov    r8d,0x2
0x00837f33: lea    rdx,[rip+0xddd606]        # 0x141615540 ; literal=" ("
0x00837f3a: mov    rcx,rdi
0x00837f3d: call   0x14006fa10
0x00837f42: mov    QWORD PTR [rsp+0x30],rdi
0x00837f47: movzx  eax,WORD PTR [rbx+0x14]
0x00837f4b: mov    WORD PTR [rsp+0x28],ax
0x00837f50: movzx  eax,WORD PTR [rbx+0x12]
0x00837f54: mov    WORD PTR [rsp+0x20],ax
0x00837f59: movzx  r9d,WORD PTR [rbx+0x10]
0x00837f5e: movzx  r8d,WORD PTR [rbx+0x1a]
0x00837f63: movzx  edx,WORD PTR [rbx+0x18]
0x00837f67: movzx  ecx,WORD PTR [rbx+0x16]
0x00837f6b: call   0x14074f220
0x00837f70: mov    r8d,0x1
0x00837f76: lea    rdx,[rip+0xddd603]        # 0x141615580 ; literal=")"
0x00837f7d: mov    rcx,rdi
0x00837f80: call   0x14006fa10
0x00837f85: nop
0x00837f86: mov    rdx,QWORD PTR [rsp+0x58]
0x00837f8b: cmp    rdx,0xf
0x00837f8f: jbe    0x140837fc6
0x00837f91: inc    rdx
0x00837f94: mov    rcx,QWORD PTR [rsp+0x40]
0x00837f99: mov    rax,rcx
0x00837f9c: cmp    rdx,0x1000
0x00837fa3: jb     0x140837fc1
0x00837fa5: add    rdx,0x27
0x00837fa9: mov    rcx,QWORD PTR [rcx-0x8]
0x00837fad: sub    rax,rcx
0x00837fb0: add    rax,0xfffffffffffffff8
0x00837fb4: cmp    rax,0x1f
0x00837fb8: jbe    0x140837fc1
0x00837fba: call   QWORD PTR [rip+0xdadb68]        # 0x1415e5b28
0x00837fc0: int3
0x00837fc1: call   0x141539680
0x00837fc6: mov    rcx,QWORD PTR [rsp+0x60]
0x00837fcb: xor    rcx,rsp
0x00837fce: call   0x141539660
0x00837fd3: mov    rbx,QWORD PTR [rsp+0x90]
0x00837fdb: add    rsp,0x70
0x00837fdf: pop    rdi
0x00837fe0: ret

# steam PE:6a70a6d9:02711000; adventure_environment_place_in_bld_containerst+8; RVA 0x837ff0..0x83819b
0x00837ff0: mov    QWORD PTR [rsp+0x18],rbx
0x00837ff5: push   rdi
0x00837ff6: sub    rsp,0x70
0x00837ffa: mov    rax,QWORD PTR [rip+0x106403f]        # 0x14189c040
0x00838001: xor    rax,rsp
0x00838004: mov    QWORD PTR [rsp+0x60],rax
0x00838009: mov    rbx,rdx
0x0083800c: mov    rdi,rcx
0x0083800f: mov    rcx,QWORD PTR [rcx+0x28]
0x00838013: mov    rax,QWORD PTR [rcx]
0x00838016: call   QWORD PTR [rax+0xd0]
0x0083801c: mov    rcx,rbx
0x0083801f: cmp    eax,0x35
0x00838022: jne    0x140838038
0x00838024: mov    r8d,0x6
0x0083802a: lea    rdx,[rip+0xe78d27]        # 0x1416b0d58 ; literal="Set on"
0x00838031: call   0x14006f8d0
0x00838036: jmp    0x140838078
0x00838038: mov    r8d,0x4
0x0083803e: lea    rdx,[rip+0xe78d0b]        # 0x1416b0d50 ; literal="Put "
0x00838045: call   0x14006f8d0
0x0083804a: mov    rcx,QWORD PTR [rdi+0x28]
0x0083804e: mov    rax,QWORD PTR [rcx]
0x00838051: call   QWORD PTR [rax+0xd0]
0x00838057: mov    r8d,0x2
0x0083805d: mov    rcx,rbx
0x00838060: cmp    eax,r8d
0x00838063: lea    rdx,[rip+0xe0a0f6]        # 0x141642160 ; literal="in"
0x0083806a: jne    0x140838073
0x0083806c: lea    rdx,[rip+0xe78cf5]        # 0x1416b0d68 ; literal="on"
0x00838073: call   0x14006fa10
0x00838078: mov    r8d,0x1
0x0083807e: lea    rdx,[rip+0xdb06b7]        # 0x1415e873c ; literal=" "
0x00838085: mov    rcx,rbx
0x00838088: call   0x14006fa10
0x0083808d: xorps  xmm0,xmm0
0x00838090: movups XMMWORD PTR [rsp+0x40],xmm0
0x00838095: mov    QWORD PTR [rsp+0x50],0x0
0x0083809e: mov    QWORD PTR [rsp+0x58],0xf
0x008380a7: mov    BYTE PTR [rsp+0x40],0x0
0x008380ac: mov    rcx,QWORD PTR [rdi+0x28]
0x008380b0: mov    rax,QWORD PTR [rcx]
0x008380b3: lea    rdx,[rsp+0x40]
0x008380b8: call   QWORD PTR [rax+0x188]
0x008380be: lea    rdx,[rsp+0x40]
0x008380c3: cmp    QWORD PTR [rsp+0x58],0xf
0x008380c9: cmova  rdx,QWORD PTR [rsp+0x40]
0x008380cf: mov    r8,QWORD PTR [rsp+0x50]
0x008380d4: mov    rcx,rbx
0x008380d7: call   0x14006fa10
0x008380dc: mov    eax,0xffff8ad0
0x008380e1: cmp    WORD PTR [rdi+0x16],ax
0x008380e5: je     0x140838140
0x008380e7: mov    r8d,0x2
0x008380ed: lea    rdx,[rip+0xddd44c]        # 0x141615540 ; literal=" ("
0x008380f4: mov    rcx,rbx
0x008380f7: call   0x14006fa10
0x008380fc: mov    QWORD PTR [rsp+0x30],rbx
0x00838101: movzx  eax,WORD PTR [rdi+0x14]
0x00838105: mov    WORD PTR [rsp+0x28],ax
0x0083810a: movzx  eax,WORD PTR [rdi+0x12]
0x0083810e: mov    WORD PTR [rsp+0x20],ax
0x00838113: movzx  r9d,WORD PTR [rdi+0x10]
0x00838118: movzx  r8d,WORD PTR [rdi+0x1a]
0x0083811d: movzx  edx,WORD PTR [rdi+0x18]
0x00838121: movzx  ecx,WORD PTR [rdi+0x16]
0x00838125: call   0x14074f220
0x0083812a: mov    r8d,0x1
0x00838130: lea    rdx,[rip+0xddd449]        # 0x141615580 ; literal=")"
0x00838137: mov    rcx,rbx
0x0083813a: call   0x14006fa10
0x0083813f: nop
0x00838140: mov    rdx,QWORD PTR [rsp+0x58]
0x00838145: cmp    rdx,0xf
0x00838149: jbe    0x140838180
0x0083814b: inc    rdx
0x0083814e: mov    rcx,QWORD PTR [rsp+0x40]
0x00838153: mov    rax,rcx
0x00838156: cmp    rdx,0x1000
0x0083815d: jb     0x14083817b
0x0083815f: add    rdx,0x27
0x00838163: mov    rcx,QWORD PTR [rcx-0x8]
0x00838167: sub    rax,rcx
0x0083816a: add    rax,0xfffffffffffffff8
0x0083816e: cmp    rax,0x1f
0x00838172: jbe    0x14083817b
0x00838174: call   QWORD PTR [rip+0xdad9ae]        # 0x1415e5b28
0x0083817a: int3
0x0083817b: call   0x141539680
0x00838180: mov    rcx,QWORD PTR [rsp+0x60]
0x00838185: xor    rcx,rsp
0x00838188: call   0x141539660
0x0083818d: mov    rbx,QWORD PTR [rsp+0x90]
0x00838195: add    rsp,0x70
0x00838199: pop    rdi
0x0083819a: ret

# steam PE:6a70a6d9:02711000; adventure_environment_place_in_it_containerst+8; RVA 0x8381a0..0x8382e7
0x008381a0: mov    QWORD PTR [rsp+0x18],rbx
0x008381a5: push   rdi
0x008381a6: sub    rsp,0x70
0x008381aa: mov    rax,QWORD PTR [rip+0x1063e8f]        # 0x14189c040
0x008381b1: xor    rax,rsp
0x008381b4: mov    QWORD PTR [rsp+0x60],rax
0x008381b9: mov    rdi,rdx
0x008381bc: mov    rbx,rcx
0x008381bf: mov    r8d,0x7
0x008381c5: lea    rdx,[rip+0xe78b94]        # 0x1416b0d60 ; literal="Put in "
0x008381cc: mov    rcx,rdi
0x008381cf: call   0x14006f8d0
0x008381d4: xorps  xmm0,xmm0
0x008381d7: movups XMMWORD PTR [rsp+0x40],xmm0
0x008381dc: mov    QWORD PTR [rsp+0x50],0x0
0x008381e5: mov    QWORD PTR [rsp+0x58],0xf
0x008381ee: mov    BYTE PTR [rsp+0x40],0x0
0x008381f3: mov    r9d,0xffffffff
0x008381f9: xor    r8d,r8d
0x008381fc: lea    rdx,[rsp+0x40]
0x00838201: mov    rcx,QWORD PTR [rbx+0x28]
0x00838205: call   0x140c65450
0x0083820a: lea    rdx,[rsp+0x40]
0x0083820f: cmp    QWORD PTR [rsp+0x58],0xf
0x00838215: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083821b: mov    r8,QWORD PTR [rsp+0x50]
0x00838220: mov    rcx,rdi
0x00838223: call   0x14006fa10
0x00838228: mov    eax,0xffff8ad0
0x0083822d: cmp    WORD PTR [rbx+0x16],ax
0x00838231: je     0x14083828c
0x00838233: mov    r8d,0x2
0x00838239: lea    rdx,[rip+0xddd300]        # 0x141615540 ; literal=" ("
0x00838240: mov    rcx,rdi
0x00838243: call   0x14006fa10
0x00838248: mov    QWORD PTR [rsp+0x30],rdi
0x0083824d: movzx  eax,WORD PTR [rbx+0x14]
0x00838251: mov    WORD PTR [rsp+0x28],ax
0x00838256: movzx  eax,WORD PTR [rbx+0x12]
0x0083825a: mov    WORD PTR [rsp+0x20],ax
0x0083825f: movzx  r9d,WORD PTR [rbx+0x10]
0x00838264: movzx  r8d,WORD PTR [rbx+0x1a]
0x00838269: movzx  edx,WORD PTR [rbx+0x18]
0x0083826d: movzx  ecx,WORD PTR [rbx+0x16]
0x00838271: call   0x14074f220
0x00838276: mov    r8d,0x1
0x0083827c: lea    rdx,[rip+0xddd2fd]        # 0x141615580 ; literal=")"
0x00838283: mov    rcx,rdi
0x00838286: call   0x14006fa10
0x0083828b: nop
0x0083828c: mov    rdx,QWORD PTR [rsp+0x58]
0x00838291: cmp    rdx,0xf
0x00838295: jbe    0x1408382cc
0x00838297: inc    rdx
0x0083829a: mov    rcx,QWORD PTR [rsp+0x40]
0x0083829f: mov    rax,rcx
0x008382a2: cmp    rdx,0x1000
0x008382a9: jb     0x1408382c7
0x008382ab: add    rdx,0x27
0x008382af: mov    rcx,QWORD PTR [rcx-0x8]
0x008382b3: sub    rax,rcx
0x008382b6: add    rax,0xfffffffffffffff8
0x008382ba: cmp    rax,0x1f
0x008382be: jbe    0x1408382c7
0x008382c0: call   QWORD PTR [rip+0xdad862]        # 0x1415e5b28
0x008382c6: int3
0x008382c7: call   0x141539680
0x008382cc: mov    rcx,QWORD PTR [rsp+0x60]
0x008382d1: xor    rcx,rsp
0x008382d4: call   0x141539660
0x008382d9: mov    rbx,QWORD PTR [rsp+0x90]
0x008382e1: add    rsp,0x70
0x008382e5: pop    rdi
0x008382e6: ret

# steam PE:6a70a6d9:02711000; adventure_environment_unit_suck_bloodst+8; RVA 0x8382f0..0x8387c4
0x008382f0: mov    QWORD PTR [rsp+0x8],rbx
0x008382f5: mov    QWORD PTR [rsp+0x18],rsi
0x008382fa: mov    QWORD PTR [rsp+0x20],rdi
0x008382ff: push   rbp
0x00838300: push   r12
0x00838302: push   r13
0x00838304: push   r14
0x00838306: push   r15
0x00838308: lea    rbp,[rsp-0x37]
0x0083830d: sub    rsp,0x90
0x00838314: mov    rax,QWORD PTR [rip+0x1063d25]        # 0x14189c040
0x0083831b: xor    rax,rsp
0x0083831e: mov    QWORD PTR [rbp+0x2f],rax
0x00838322: mov    r13,rdx
0x00838325: mov    r10d,DWORD PTR [rcx+0x20]
0x00838329: mov    r8,QWORD PTR [rip+0x1bacd88]        # 0x1423e50b8
0x00838330: mov    r11,QWORD PTR [rip+0x1bacd79]        # 0x1423e50b0
0x00838337: sub    r8,r11
0x0083833a: sar    r8,0x3
0x0083833e: test   r8d,r8d
0x00838341: je     0x140838797
0x00838347: cmp    r10d,0xffffffff
0x0083834b: je     0x140838797
0x00838351: xor    r14d,r14d
0x00838354: mov    edx,r14d
0x00838357: sub    r8d,0x1
0x0083835b: js     0x14083838a
0x0083835d: nop    DWORD PTR [rax]
0x00838360: lea    ecx,[rdx+r8*1]
0x00838364: sar    ecx,1
0x00838366: movsxd rax,ecx
0x00838369: mov    rbx,QWORD PTR [r11+rax*8]
0x0083836d: cmp    DWORD PTR [rbx+0x130],r10d
0x00838374: je     0x14083838d
0x00838376: lea    eax,[rcx+0x1]
0x00838379: cmovle edx,eax
0x0083837c: lea    eax,[rcx-0x1]
0x0083837f: cmovle eax,r8d
0x00838383: mov    r8d,eax
0x00838386: cmp    edx,eax
0x00838388: jle    0x140838360
0x0083838a: mov    rbx,r14
0x0083838d: test   rbx,rbx
0x00838390: je     0x140838797
0x00838396: mov    r8d,0x5
0x0083839c: lea    rdx,[rip+0xe78991]        # 0x1416b0d34 ; literal="Suck "
0x008383a3: mov    rcx,r13
0x008383a6: call   0x14006f8d0
0x008383ab: xorps  xmm0,xmm0
0x008383ae: movups XMMWORD PTR [rbp+0xf],xmm0
0x008383b2: mov    QWORD PTR [rbp+0x1f],r14
0x008383b6: mov    QWORD PTR [rbp+0x27],0xf
0x008383be: mov    BYTE PTR [rbp+0xf],r14b
0x008383c2: xor    r8d,r8d
0x008383c5: lea    rdx,[rbp+0xf]
0x008383c9: mov    rcx,rbx
0x008383cc: call   0x141330c30
0x008383d1: lea    rdx,[rbp+0xf]
0x008383d5: cmp    QWORD PTR [rbp+0x27],0xf
0x008383da: cmova  rdx,QWORD PTR [rbp+0xf]
0x008383df: mov    r8,QWORD PTR [rbp+0x1f]
0x008383e3: mov    rcx,r13
0x008383e6: call   0x14006fa10
0x008383eb: mov    r8d,0x3
0x008383f1: lea    rdx,[rip+0xdb572c]        # 0x1415edb24 ; literal="'s "
0x008383f8: mov    rcx,r13
0x008383fb: call   0x14006fa10
0x00838400: xorps  xmm0,xmm0
0x00838403: movups XMMWORD PTR [rbp-0x31],xmm0
0x00838407: mov    QWORD PTR [rbp-0x21],r14
0x0083840b: mov    QWORD PTR [rbp-0x19],0xf
0x00838413: mov    BYTE PTR [rbp-0x31],0x0
0x00838417: movsx  r8,WORD PTR [rbx+0x12c]
0x0083841f: movsx  rax,WORD PTR [rbx+0xa4]
0x00838427: test   ax,ax
0x0083842a: js     0x14083848d
0x0083842c: mov    rcx,QWORD PTR [rip+0x1cb4635]        # 0x1424eca68
0x00838433: mov    rdx,rax
0x00838436: mov    rax,QWORD PTR [rip+0x1cb4633]        # 0x1424eca70
0x0083843d: sub    rax,rcx
0x00838440: sar    rax,0x3
0x00838444: cmp    rdx,rax
0x00838447: jae    0x14083848d
0x00838449: test   r8w,r8w
0x0083844d: js     0x14083848d
0x0083844f: mov    rax,QWORD PTR [rcx+rdx*8]
0x00838453: mov    rcx,QWORD PTR [rax+0x178]
0x0083845a: mov    rax,QWORD PTR [rax+0x180]
0x00838461: sub    rax,rcx
0x00838464: sar    rax,0x3
0x00838468: cmp    r8,rax
0x0083846b: jae    0x14083848d
0x0083846d: mov    rax,QWORD PTR [rcx+r8*8]
0x00838471: test   rax,rax
0x00838474: je     0x14083848d
0x00838476: movzx  esi,WORD PTR [rax+0x3c76]
0x0083847d: mov    edi,DWORD PTR [rax+0x3c78]
0x00838483: movzx  r12d,WORD PTR [rax+0x3c74]
0x0083848b: jmp    0x14083849a
0x0083848d: mov    esi,0xffffffff
0x00838492: movzx  r12d,WORD PTR [rbp-0x39]
0x00838497: mov    edi,DWORD PTR [rbp-0x39]
0x0083849a: mov    edx,DWORD PTR [rbx+0xa4]
0x008384a0: mov    r8d,0xc7
0x008384a6: cmp    edx,DWORD PTR [rbx+0xd90]
0x008384ac: jne    0x1408384d0
0x008384ae: mov    ecx,DWORD PTR [rbx+0xc30]
0x008384b4: cmp    ecx,0xffffffff
0x008384b7: je     0x1408384d0
0x008384b9: lea    eax,[rsi-0x13]
0x008384bc: cmp    ax,r8w
0x008384c0: ja     0x1408384d0
0x008384c2: cmp    edi,edx
0x008384c4: jne    0x1408384d0
0x008384c6: mov    eax,0xc8
0x008384cb: add    si,ax
0x008384ce: mov    edi,ecx
0x008384d0: cmp    si,0xffff
0x008384d4: je     0x1408386f0
0x008384da: mov    QWORD PTR [rbp-0x21],r14
0x008384de: mov    BYTE PTR [rbp-0x31],0x0
0x008384e2: mov    ecx,0xdb
0x008384e7: movzx  eax,si
0x008384ea: sub    ax,cx
0x008384ed: cmp    ax,r8w
0x008384f1: ja     0x140838660
0x008384f7: mov    r8,QWORD PTR [rip+0x1cc1822]        # 0x1424f9d20
0x008384fe: mov    r10,QWORD PTR [rip+0x1cc1813]        # 0x1424f9d18
0x00838505: sub    r8,r10
0x00838508: sar    r8,0x3
0x0083850c: test   r8,r8
0x0083850f: je     0x140838660
0x00838515: cmp    edi,0xffffffff
0x00838518: je     0x140838660
0x0083851e: mov    edx,r14d
0x00838521: sub    r8d,0x1
0x00838525: js     0x140838660
0x0083852b: nop    DWORD PTR [rax+rax*1+0x0]
0x00838530: lea    ecx,[r8+rdx*1]
0x00838534: sar    ecx,1
0x00838536: movsxd rax,ecx
0x00838539: mov    rbx,QWORD PTR [r10+rax*8]
0x0083853d: cmp    DWORD PTR [rbx+0xe0],edi
0x00838543: je     0x14083855f
0x00838545: lea    eax,[rcx-0x1]
0x00838548: cmovle eax,r8d
0x0083854c: mov    r8d,eax
0x0083854f: lea    eax,[rcx+0x1]
0x00838552: cmovle edx,eax
0x00838555: cmp    edx,r8d
0x00838558: jle    0x140838530
0x0083855a: jmp    0x140838660
0x0083855f: test   rbx,rbx
0x00838562: je     0x140838660
0x00838568: cmp    BYTE PTR [rbx+0xaa],0x0
0x0083856f: je     0x140838660
0x00838575: xorps  xmm0,xmm0
0x00838578: movups XMMWORD PTR [rbp-0x11],xmm0
0x0083857c: mov    QWORD PTR [rbp-0x1],r14
0x00838580: mov    r15d,0xf
0x00838586: mov    QWORD PTR [rbp+0x7],r15
0x0083858a: mov    BYTE PTR [rbp-0x11],0x0
0x0083858e: mov    rax,QWORD PTR [rbx+0x130]
0x00838595: test   rax,rax
0x00838598: je     0x1408385c6
0x0083859a: mov    rcx,QWORD PTR [rax+0x58]
0x0083859e: test   rcx,rcx
0x008385a1: je     0x1408385c6
0x008385a3: mov    edx,DWORD PTR [rcx+0x30]
0x008385a6: cmp    edx,0xffffffff
0x008385a9: je     0x1408385c6
0x008385ab: lea    rcx,[rip+0x1caf736]        # 0x1424e7ce8
0x008385b2: call   0x140072570
0x008385b7: test   rax,rax
0x008385ba: je     0x1408385c6
0x008385bc: mov    rcx,rax
0x008385bf: call   0x140c3a4f0
0x008385c4: jmp    0x1408385ca
0x008385c6: lea    rax,[rbx+0x38]
0x008385ca: test   rax,rax
0x008385cd: je     0x1408385ef
0x008385cf: cmp    BYTE PTR [rax+0x72],0x0
0x008385d3: je     0x1408385ef
0x008385d5: xor    r9d,r9d
0x008385d8: mov    r8b,0x1
0x008385db: lea    rdx,[rbp-0x11]
0x008385df: mov    rcx,rax
0x008385e2: call   0x140a946e0
0x008385e7: mov    r15,QWORD PTR [rbp+0x7]
0x008385eb: mov    r14,QWORD PTR [rbp-0x1]
0x008385ef: lea    rdx,[rbp-0x11]
0x008385f3: cmp    r15,0xf
0x008385f7: cmova  rdx,QWORD PTR [rbp-0x11]
0x008385fc: mov    r8,r14
0x008385ff: lea    rcx,[rbp-0x31]
0x00838603: call   0x14006fa10
0x00838608: mov    r8d,0x3
0x0083860e: lea    rdx,[rip+0xdb550f]        # 0x1415edb24 ; literal="'s "
0x00838615: lea    rcx,[rbp-0x31]
0x00838619: call   0x14006fa10
0x0083861e: nop
0x0083861f: mov    rdx,QWORD PTR [rbp+0x7]
0x00838623: cmp    rdx,0xf
0x00838627: jbe    0x14083865d
0x00838629: inc    rdx
0x0083862c: mov    rcx,QWORD PTR [rbp-0x11]
0x00838630: mov    rax,rcx
0x00838633: cmp    rdx,0x1000
0x0083863a: jb     0x140838658
0x0083863c: add    rdx,0x27
0x00838640: mov    rcx,QWORD PTR [rcx-0x8]
0x00838644: sub    rax,rcx
0x00838647: add    rax,0xfffffffffffffff8
0x0083864b: cmp    rax,0x1f
0x0083864f: jbe    0x140838658
0x00838651: call   QWORD PTR [rip+0xdad4d1]        # 0x1415e5b28
0x00838657: int3
0x00838658: call   0x141539680
0x0083865d: xor    r14d,r14d
0x00838660: mov    r8d,edi
0x00838663: movzx  edx,si
0x00838666: lea    rcx,[rip+0x1b98e83]        # 0x1423d14f0
0x0083866d: call   0x1414add70
0x00838672: mov    rbx,rax
0x00838675: test   rax,rax
0x00838678: je     0x1408386da
0x0083867a: cmp    QWORD PTR [rax+0x530],0x0
0x00838682: je     0x1408386b8
0x00838684: lea    rdx,[rax+0x520]
0x0083868b: mov    r8,QWORD PTR [rdx+0x10]
0x0083868f: cmp    QWORD PTR [rdx+0x18],0xf
0x00838694: jbe    0x140838699
0x00838696: mov    rdx,QWORD PTR [rdx]
0x00838699: lea    rcx,[rbp-0x31]
0x0083869d: call   0x14006fa10
0x008386a2: mov    r8d,0x1
0x008386a8: lea    rdx,[rip+0xdb008d]        # 0x1415e873c ; literal=" "
0x008386af: lea    rcx,[rbp-0x31]
0x008386b3: call   0x14006fa10
0x008386b8: movsx  rdx,r12w
0x008386bc: shl    rdx,0x5
0x008386c0: add    rdx,0xb8
0x008386c7: add    rdx,rbx
0x008386ca: mov    r8,QWORD PTR [rdx+0x10]
0x008386ce: cmp    QWORD PTR [rdx+0x18],0xf
0x008386d3: jbe    0x1408386e7
0x008386d5: mov    rdx,QWORD PTR [rdx]
0x008386d8: jmp    0x1408386e7
0x008386da: mov    r8d,0x10
0x008386e0: lea    rdx,[rip+0xf50a21]        # 0x141789108 ; literal="unknown material"
0x008386e7: lea    rcx,[rbp-0x31]
0x008386eb: call   0x14006fa10
0x008386f0: lea    rdx,[rbp-0x31]
0x008386f4: cmp    QWORD PTR [rbp-0x19],0xf
0x008386f9: cmova  rdx,QWORD PTR [rbp-0x31]
0x008386fe: mov    r8,QWORD PTR [rbp-0x21]
0x00838702: mov    rcx,r13
0x00838705: call   0x14006fa10
0x0083870a: nop
0x0083870b: mov    rdx,QWORD PTR [rbp-0x19]
0x0083870f: cmp    rdx,0xf
0x00838713: jbe    0x140838749
0x00838715: inc    rdx
0x00838718: mov    rcx,QWORD PTR [rbp-0x31]
0x0083871c: mov    rax,rcx
0x0083871f: cmp    rdx,0x1000
0x00838726: jb     0x140838744
0x00838728: add    rdx,0x27
0x0083872c: mov    rcx,QWORD PTR [rcx-0x8]
0x00838730: sub    rax,rcx
0x00838733: add    rax,0xfffffffffffffff8
0x00838737: cmp    rax,0x1f
0x0083873b: jbe    0x140838744
0x0083873d: call   QWORD PTR [rip+0xdad3e5]        # 0x1415e5b28
0x00838743: int3
0x00838744: call   0x141539680
0x00838749: mov    QWORD PTR [rbp-0x21],r14
0x0083874d: mov    QWORD PTR [rbp-0x19],0xf
0x00838755: mov    BYTE PTR [rbp-0x31],0x0
0x00838759: mov    rdx,QWORD PTR [rbp+0x27]
0x0083875d: cmp    rdx,0xf
0x00838761: jbe    0x140838797
0x00838763: inc    rdx
0x00838766: mov    rcx,QWORD PTR [rbp+0xf]
0x0083876a: mov    rax,rcx
0x0083876d: cmp    rdx,0x1000
0x00838774: jb     0x140838792
0x00838776: add    rdx,0x27
0x0083877a: mov    rcx,QWORD PTR [rcx-0x8]
0x0083877e: sub    rax,rcx
0x00838781: add    rax,0xfffffffffffffff8
0x00838785: cmp    rax,0x1f
0x00838789: jbe    0x140838792
0x0083878b: call   QWORD PTR [rip+0xdad397]        # 0x1415e5b28
0x00838791: int3
0x00838792: call   0x141539680
0x00838797: mov    rcx,QWORD PTR [rbp+0x2f]
0x0083879b: xor    rcx,rsp
0x0083879e: call   0x141539660
0x008387a3: lea    r11,[rsp+0x90]
0x008387ab: mov    rbx,QWORD PTR [r11+0x30]
0x008387af: mov    rsi,QWORD PTR [r11+0x40]
0x008387b3: mov    rdi,QWORD PTR [r11+0x48]
0x008387b7: mov    rsp,r11
0x008387ba: pop    r15
0x008387bc: pop    r14
0x008387be: pop    r13
0x008387c0: pop    r12
0x008387c2: pop    rbp
0x008387c3: ret

# steam PE:6a70a6d9:02711000; adventure_environment_ingest_from_containerst+8; RVA 0x8387d0..0x8389f0
0x008387d0: mov    QWORD PTR [rsp+0x18],rbx
0x008387d5: mov    QWORD PTR [rsp+0x20],rdi
0x008387da: push   rbp
0x008387db: lea    rbp,[rsp-0x57]
0x008387e0: sub    rsp,0x90
0x008387e7: mov    rax,QWORD PTR [rip+0x1063852]        # 0x14189c040
0x008387ee: xor    rax,rsp
0x008387f1: mov    QWORD PTR [rbp+0x47],rax
0x008387f5: mov    rdi,rdx
0x008387f8: mov    rbx,rcx
0x008387fb: xorps  xmm0,xmm0
0x008387fe: movups XMMWORD PTR [rbp+0x27],xmm0
0x00838802: mov    QWORD PTR [rbp+0x37],0x0
0x0083880a: mov    QWORD PTR [rbp+0x3f],0xf
0x00838812: mov    BYTE PTR [rbp+0x27],0x0
0x00838816: movups XMMWORD PTR [rbp+0x7],xmm0
0x0083881a: mov    QWORD PTR [rbp+0x17],0x0
0x00838822: mov    QWORD PTR [rbp+0x1f],0xf
0x0083882a: mov    BYTE PTR [rbp+0x7],0x0
0x0083882e: mov    r9d,0xffffffff
0x00838834: xor    r8d,r8d
0x00838837: lea    rdx,[rbp+0x27]
0x0083883b: mov    rcx,QWORD PTR [rcx+0x28]
0x0083883f: call   0x140c65450
0x00838844: mov    r9d,0xffffffff
0x0083884a: xor    r8d,r8d
0x0083884d: lea    rdx,[rbp+0x7]
0x00838851: mov    rcx,QWORD PTR [rbx+0x20]
0x00838855: call   0x140c65450
0x0083885a: mov    rcx,QWORD PTR [rbx+0x28]
0x0083885e: mov    rax,QWORD PTR [rcx]
0x00838861: call   QWORD PTR [rax+0x2b0]
0x00838867: mov    ecx,0x4
0x0083886c: mov    r8d,0x6
0x00838872: test   al,al
0x00838874: cmove  r8d,ecx
0x00838878: lea    rcx,[rip+0xe784c9]        # 0x1416b0d48 ; literal="Eat "
0x0083887f: lea    rdx,[rip+0xe784a6]        # 0x1416b0d2c ; literal="Drink "
0x00838886: cmove  rdx,rcx
0x0083888a: mov    rcx,rdi
0x0083888d: call   0x14006f8d0
0x00838892: lea    rdx,[rbp+0x27]
0x00838896: cmp    QWORD PTR [rbp+0x3f],0xf
0x0083889b: cmova  rdx,QWORD PTR [rbp+0x27]
0x008388a0: mov    r8,QWORD PTR [rbp+0x37]
0x008388a4: mov    rcx,rdi
0x008388a7: call   0x14006fa10
0x008388ac: mov    r8d,0x6
0x008388b2: lea    rdx,[rip+0xdb50c3]        # 0x1415ed97c ; literal=" from "
0x008388b9: mov    rcx,rdi
0x008388bc: call   0x14006fa10
0x008388c1: lea    rdx,[rbp+0x7]
0x008388c5: cmp    QWORD PTR [rbp+0x1f],0xf
0x008388ca: cmova  rdx,QWORD PTR [rbp+0x7]
0x008388cf: mov    r8,QWORD PTR [rbp+0x17]
0x008388d3: mov    rcx,rdi
0x008388d6: call   0x14006fa10
0x008388db: mov    eax,0xffff8ad0
0x008388e0: cmp    WORD PTR [rbx+0x16],ax
0x008388e4: je     0x14083893f
0x008388e6: mov    r8d,0x2
0x008388ec: lea    rdx,[rip+0xddcc4d]        # 0x141615540 ; literal=" ("
0x008388f3: mov    rcx,rdi
0x008388f6: call   0x14006fa10
0x008388fb: mov    QWORD PTR [rsp+0x30],rdi
0x00838900: movzx  eax,WORD PTR [rbx+0x14]
0x00838904: mov    WORD PTR [rsp+0x28],ax
0x00838909: movzx  eax,WORD PTR [rbx+0x12]
0x0083890d: mov    WORD PTR [rsp+0x20],ax
0x00838912: movzx  r9d,WORD PTR [rbx+0x10]
0x00838917: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083891c: movzx  edx,WORD PTR [rbx+0x18]
0x00838920: movzx  ecx,WORD PTR [rbx+0x16]
0x00838924: call   0x14074f220
0x00838929: mov    r8d,0x1
0x0083892f: lea    rdx,[rip+0xddcc4a]        # 0x141615580 ; literal=")"
0x00838936: mov    rcx,rdi
0x00838939: call   0x14006fa10
0x0083893e: nop
0x0083893f: mov    rdx,QWORD PTR [rbp+0x1f]
0x00838943: cmp    rdx,0xf
0x00838947: jbe    0x14083897d
0x00838949: inc    rdx
0x0083894c: mov    rcx,QWORD PTR [rbp+0x7]
0x00838950: mov    rax,rcx
0x00838953: cmp    rdx,0x1000
0x0083895a: jb     0x140838978
0x0083895c: add    rdx,0x27
0x00838960: mov    rcx,QWORD PTR [rcx-0x8]
0x00838964: sub    rax,rcx
0x00838967: add    rax,0xfffffffffffffff8
0x0083896b: cmp    rax,0x1f
0x0083896f: jbe    0x140838978
0x00838971: call   QWORD PTR [rip+0xdad1b1]        # 0x1415e5b28
0x00838977: int3
0x00838978: call   0x141539680
0x0083897d: mov    QWORD PTR [rbp+0x17],0x0
0x00838985: mov    QWORD PTR [rbp+0x1f],0xf
0x0083898d: mov    BYTE PTR [rbp+0x7],0x0
0x00838991: mov    rdx,QWORD PTR [rbp+0x3f]
0x00838995: cmp    rdx,0xf
0x00838999: jbe    0x1408389cf
0x0083899b: inc    rdx
0x0083899e: mov    rcx,QWORD PTR [rbp+0x27]
0x008389a2: mov    rax,rcx
0x008389a5: cmp    rdx,0x1000
0x008389ac: jb     0x1408389ca
0x008389ae: add    rdx,0x27
0x008389b2: mov    rcx,QWORD PTR [rcx-0x8]
0x008389b6: sub    rax,rcx
0x008389b9: add    rax,0xfffffffffffffff8
0x008389bd: cmp    rax,0x1f
0x008389c1: jbe    0x1408389ca
0x008389c3: call   QWORD PTR [rip+0xdad15f]        # 0x1415e5b28
0x008389c9: int3
0x008389ca: call   0x141539680
0x008389cf: mov    rcx,QWORD PTR [rbp+0x47]
0x008389d3: xor    rcx,rsp
0x008389d6: call   0x141539660
0x008389db: lea    r11,[rsp+0x90]
0x008389e3: mov    rbx,QWORD PTR [r11+0x20]
0x008389e7: mov    rdi,QWORD PTR [r11+0x28]
0x008389eb: mov    rsp,r11
0x008389ee: pop    rbp
0x008389ef: ret

# steam PE:6a70a6d9:02711000; adventure_environment_ingest_materialst+8; RVA 0x8389f0..0x83929a
0x008389f0: mov    QWORD PTR [rsp+0x18],rbx
0x008389f5: push   rbp
0x008389f6: push   rsi
0x008389f7: push   rdi
0x008389f8: push   r12
0x008389fa: push   r13
0x008389fc: push   r14
0x008389fe: push   r15
0x00838a00: lea    rbp,[rsp-0x27]
0x00838a05: sub    rsp,0xd0
0x00838a0c: mov    rax,QWORD PTR [rip+0x106362d]        # 0x14189c040
0x00838a13: xor    rax,rsp
0x00838a16: mov    QWORD PTR [rbp+0x17],rax
0x00838a1a: mov    r15,rdx
0x00838a1d: mov    QWORD PTR [rbp-0x61],rdx
0x00838a21: mov    r13,rcx
0x00838a24: mov    ecx,0x4
0x00838a29: mov    r8d,0x6
0x00838a2f: cmp    WORD PTR [r13+0x28],0x1
0x00838a35: cmovne r8d,ecx
0x00838a39: lea    rcx,[rip+0xe78308]        # 0x1416b0d48 ; literal="Eat "
0x00838a40: lea    rdx,[rip+0xe782e5]        # 0x1416b0d2c ; literal="Drink "
0x00838a47: cmovne rdx,rcx
0x00838a4b: mov    rcx,r15
0x00838a4e: call   0x14006f8d0
0x00838a53: movsx  r9,WORD PTR [r13+0x14]
0x00838a58: movsx  edx,WORD PTR [r13+0x12]
0x00838a5d: movsx  r8d,WORD PTR [r13+0x10]
0x00838a62: mov    edi,0xf
0x00838a67: mov    QWORD PTR [rbp-0x51],rdi
0x00838a6b: xor    r14d,r14d
0x00838a6e: lea    r12,[rip+0xf50693]        # 0x141789108 ; literal="unknown material"
0x00838a75: test   r8w,r8w
0x00838a79: js     0x140838e61
0x00838a7f: mov    r11d,DWORD PTR [rip+0x1caf656]        # 0x1424e80dc
0x00838a86: cmp    r8d,r11d
0x00838a89: jge    0x140838e68
0x00838a8f: test   dx,dx
0x00838a92: js     0x140838e68
0x00838a98: cmp    edx,DWORD PTR [rip+0x1caf642]        # 0x1424e80e0
0x00838a9e: jge    0x140838e68
0x00838aa4: test   r9w,r9w
0x00838aa8: js     0x140838e68
0x00838aae: cmp    r9d,DWORD PTR [rip+0x1caf62f]        # 0x1424e80e4
0x00838ab5: jge    0x140838e68
0x00838abb: sar    r8w,0x4
0x00838ac0: sar    dx,0x4
0x00838ac4: mov    rcx,QWORD PTR [rip+0x1caf5dd]        # 0x1424e80a8
0x00838acb: test   rcx,rcx
0x00838ace: je     0x140838e68
0x00838ad4: movsx  rax,r8w
0x00838ad8: movsx  rdx,dx
0x00838adc: mov    rax,QWORD PTR [rcx+rax*8]
0x00838ae0: mov    rax,QWORD PTR [rax+rdx*8]
0x00838ae4: mov    rbx,QWORD PTR [rax+r9*8]
0x00838ae8: mov    QWORD PTR [rbp-0x59],rbx
0x00838aec: test   rbx,rbx
0x00838aef: je     0x140838e68
0x00838af5: mov    rax,QWORD PTR [rbx+0x10]
0x00838af9: sub    rax,QWORD PTR [rbx+0x8]
0x00838afd: sar    rax,0x3
0x00838b01: sub    eax,0x1
0x00838b04: js     0x140838e68
0x00838b0a: movsxd rsi,eax
0x00838b0d: mov    QWORD PTR [rbp-0x69],rsi
0x00838b11: mov    rax,QWORD PTR [rbx+0x8]
0x00838b15: mov    rcx,QWORD PTR [rax+rsi*8]
0x00838b19: mov    rax,QWORD PTR [rcx]
0x00838b1c: call   QWORD PTR [rax]
0x00838b1e: cmp    ax,0x3
0x00838b22: jne    0x140838e53
0x00838b28: mov    rax,QWORD PTR [rbx+0x8]
0x00838b2c: mov    rdx,QWORD PTR [rax+rsi*8]
0x00838b30: movsx  eax,WORD PTR [r13+0x10]
0x00838b35: and    eax,0x8000000f
0x00838b3a: jge    0x140838b43
0x00838b3c: dec    eax
0x00838b3e: or     eax,0xfffffff0
0x00838b41: inc    eax
0x00838b43: movsxd r8,eax
0x00838b46: add    r8,r8
0x00838b49: movsx  eax,WORD PTR [r13+0x12]
0x00838b4e: and    eax,0x8000000f
0x00838b53: jge    0x140838b5c
0x00838b55: dec    eax
0x00838b57: or     eax,0xfffffff0
0x00838b5a: inc    eax
0x00838b5c: movsxd rcx,eax
0x00838b5f: lea    rax,[rdx+r8*8]
0x00838b63: cmp    BYTE PTR [rcx+rax*1+0x12],0x64
0x00838b68: jb     0x140838e53
0x00838b6e: movsx  r12,WORD PTR [rdx+0x10]
0x00838b73: cmp    r12d,0x2
0x00838b77: je     0x140838e4c
0x00838b7d: movzx  r15d,WORD PTR [rdx+0x8]
0x00838b82: cmp    r15w,WORD PTR [r13+0x20]
0x00838b87: jne    0x140838b96
0x00838b89: mov    eax,DWORD PTR [r13+0x24]
0x00838b8d: cmp    DWORD PTR [rdx+0xc],eax
0x00838b90: je     0x140838e48
0x00838b96: xorps  xmm0,xmm0
0x00838b99: movups XMMWORD PTR [rbp-0x29],xmm0
0x00838b9d: mov    QWORD PTR [rbp-0x11],rdi
0x00838ba1: mov    edi,DWORD PTR [rdx+0xc]
0x00838ba4: mov    QWORD PTR [rbp-0x19],r14
0x00838ba8: mov    BYTE PTR [rbp-0x29],0x0
0x00838bac: movzx  eax,r15w
0x00838bb0: mov    ecx,0xdb
0x00838bb5: sub    ax,cx
0x00838bb8: mov    ecx,0xc7
0x00838bbd: cmp    ax,cx
0x00838bc0: ja     0x140838d34
0x00838bc6: mov    r9,QWORD PTR [rip+0x1cc1153]        # 0x1424f9d20
0x00838bcd: mov    r10,QWORD PTR [rip+0x1cc1144]        # 0x1424f9d18
0x00838bd4: sub    r9,r10
0x00838bd7: sar    r9,0x3
0x00838bdb: test   r9,r9
0x00838bde: je     0x140838d34
0x00838be4: cmp    edi,0xffffffff
0x00838be7: je     0x140838d34
0x00838bed: mov    edx,r14d
0x00838bf0: sub    r9d,0x1
0x00838bf4: js     0x140838d34
0x00838bfa: nop    WORD PTR [rax+rax*1+0x0]
0x00838c00: lea    ecx,[r9+rdx*1]
0x00838c04: sar    ecx,1
0x00838c06: movsxd rax,ecx
0x00838c09: mov    rbx,QWORD PTR [r10+rax*8]
0x00838c0d: cmp    DWORD PTR [rbx+0xe0],edi
0x00838c13: je     0x140838c2f
0x00838c15: lea    eax,[rcx-0x1]
0x00838c18: cmovle eax,r9d
0x00838c1c: mov    r9d,eax
0x00838c1f: lea    eax,[rcx+0x1]
0x00838c22: cmovle edx,eax
0x00838c25: cmp    edx,r9d
0x00838c28: jle    0x140838c00
0x00838c2a: jmp    0x140838d34
0x00838c2f: test   rbx,rbx
0x00838c32: je     0x140838d34
0x00838c38: cmp    BYTE PTR [rbx+0xaa],0x0
0x00838c3f: je     0x140838d34
0x00838c45: xorps  xmm0,xmm0
0x00838c48: movups XMMWORD PTR [rbp-0x49],xmm0
0x00838c4c: mov    rsi,r14
0x00838c4f: mov    QWORD PTR [rbp-0x39],r14
0x00838c53: mov    r14d,0xf
0x00838c59: mov    QWORD PTR [rbp-0x31],r14
0x00838c5d: mov    BYTE PTR [rbp-0x49],0x0
0x00838c61: mov    rax,QWORD PTR [rbx+0x130]
0x00838c68: test   rax,rax
0x00838c6b: je     0x140838c99
0x00838c6d: mov    rcx,QWORD PTR [rax+0x58]
0x00838c71: test   rcx,rcx
0x00838c74: je     0x140838c99
0x00838c76: mov    edx,DWORD PTR [rcx+0x30]
0x00838c79: cmp    edx,0xffffffff
0x00838c7c: je     0x140838c99
0x00838c7e: lea    rcx,[rip+0x1caf063]        # 0x1424e7ce8
0x00838c85: call   0x140072570
0x00838c8a: test   rax,rax
0x00838c8d: je     0x140838c99
0x00838c8f: mov    rcx,rax
0x00838c92: call   0x140c3a4f0
0x00838c97: jmp    0x140838c9d
0x00838c99: lea    rax,[rbx+0x38]
0x00838c9d: test   rax,rax
0x00838ca0: je     0x140838cc2
0x00838ca2: cmp    BYTE PTR [rax+0x72],0x0
0x00838ca6: je     0x140838cc2
0x00838ca8: xor    r9d,r9d
0x00838cab: mov    r8b,0x1
0x00838cae: lea    rdx,[rbp-0x49]
0x00838cb2: mov    rcx,rax
0x00838cb5: call   0x140a946e0
0x00838cba: mov    r14,QWORD PTR [rbp-0x31]
0x00838cbe: mov    rsi,QWORD PTR [rbp-0x39]
0x00838cc2: lea    rdx,[rbp-0x49]
0x00838cc6: cmp    r14,0xf
0x00838cca: cmova  rdx,QWORD PTR [rbp-0x49]
0x00838ccf: mov    r8,rsi
0x00838cd2: lea    rcx,[rbp-0x29]
0x00838cd6: call   0x14006fa10
0x00838cdb: mov    r8d,0x3
0x00838ce1: lea    rdx,[rip+0xdb4e3c]        # 0x1415edb24 ; literal="'s "
0x00838ce8: lea    rcx,[rbp-0x29]
0x00838cec: call   0x14006fa10
0x00838cf1: nop
0x00838cf2: mov    rdx,QWORD PTR [rbp-0x31]
0x00838cf6: cmp    rdx,0xf
0x00838cfa: jbe    0x140838d2d
0x00838cfc: inc    rdx
0x00838cff: mov    rcx,QWORD PTR [rbp-0x49]
0x00838d03: mov    rax,rcx
0x00838d06: cmp    rdx,0x1000
0x00838d0d: jb     0x140838d28
0x00838d0f: add    rdx,0x27
0x00838d13: mov    rcx,QWORD PTR [rcx-0x8]
0x00838d17: sub    rax,rcx
0x00838d1a: add    rax,0xfffffffffffffff8
0x00838d1e: cmp    rax,0x1f
0x00838d22: ja     0x14083900f
0x00838d28: call   0x141539680
0x00838d2d: xor    r14d,r14d
0x00838d30: mov    rsi,QWORD PTR [rbp-0x69]
0x00838d34: mov    r8d,edi
0x00838d37: movzx  edx,r15w
0x00838d3b: lea    rcx,[rip+0x1b987ae]        # 0x1423d14f0
0x00838d42: call   0x1414add70
0x00838d47: mov    rbx,rax
0x00838d4a: test   rax,rax
0x00838d4d: je     0x140838db5
0x00838d4f: cmp    QWORD PTR [rax+0x530],0x0
0x00838d57: je     0x140838d8d
0x00838d59: lea    rdx,[rax+0x520]
0x00838d60: mov    r8,QWORD PTR [rdx+0x10]
0x00838d64: cmp    QWORD PTR [rdx+0x18],0xf
0x00838d69: jbe    0x140838d6e
0x00838d6b: mov    rdx,QWORD PTR [rdx]
0x00838d6e: lea    rcx,[rbp-0x29]
0x00838d72: call   0x14006fa10
0x00838d77: mov    r8d,0x1
0x00838d7d: lea    rdx,[rip+0xdaf9b8]        # 0x1415e873c ; literal=" "
0x00838d84: lea    rcx,[rbp-0x29]
0x00838d88: call   0x14006fa10
0x00838d8d: mov    rdx,r12
0x00838d90: shl    rdx,0x5
0x00838d94: add    rdx,0x178
0x00838d9b: add    rdx,rbx
0x00838d9e: mov    r8,QWORD PTR [rdx+0x10]
0x00838da2: cmp    QWORD PTR [rdx+0x18],0xf
0x00838da7: jbe    0x140838dac
0x00838da9: mov    rdx,QWORD PTR [rdx]
0x00838dac: lea    r12,[rip+0xf50355]        # 0x141789108 ; literal="unknown material"
0x00838db3: jmp    0x140838dc5
0x00838db5: lea    r12,[rip+0xf5034c]        # 0x141789108 ; literal="unknown material"
0x00838dbc: mov    rdx,r12
0x00838dbf: mov    r8d,0x10
0x00838dc5: lea    rcx,[rbp-0x29]
0x00838dc9: call   0x14006fa10
0x00838dce: lea    rdx,[rbp-0x29]
0x00838dd2: cmp    QWORD PTR [rbp-0x11],0xf
0x00838dd7: cmova  rdx,QWORD PTR [rbp-0x29]
0x00838ddc: mov    r8,QWORD PTR [rbp-0x19]
0x00838de0: mov    r15,QWORD PTR [rbp-0x61]
0x00838de4: mov    rcx,r15
0x00838de7: call   0x14006fa10
0x00838dec: mov    r8d,0x1
0x00838df2: lea    rdx,[rip+0xdaf943]        # 0x1415e873c ; literal=" "
0x00838df9: mov    rcx,r15
0x00838dfc: call   0x14006fa10
0x00838e01: nop
0x00838e02: mov    rdx,QWORD PTR [rbp-0x11]
0x00838e06: cmp    rdx,0xf
0x00838e0a: jbe    0x140838e3d
0x00838e0c: inc    rdx
0x00838e0f: mov    rcx,QWORD PTR [rbp-0x29]
0x00838e13: mov    rax,rcx
0x00838e16: cmp    rdx,0x1000
0x00838e1d: jb     0x140838e38
0x00838e1f: add    rdx,0x27
0x00838e23: mov    rcx,QWORD PTR [rcx-0x8]
0x00838e27: sub    rax,rcx
0x00838e2a: add    rax,0xfffffffffffffff8
0x00838e2e: cmp    rax,0x1f
0x00838e32: ja     0x140839016
0x00838e38: call   0x141539680
0x00838e3d: mov    rbx,QWORD PTR [rbp-0x59]
0x00838e41: mov    edi,0xf
0x00838e46: jmp    0x140838e53
0x00838e48: mov    r15,QWORD PTR [rbp-0x61]
0x00838e4c: lea    r12,[rip+0xf502b5]        # 0x141789108 ; literal="unknown material"
0x00838e53: sub    rsi,0x1
0x00838e57: mov    QWORD PTR [rbp-0x69],rsi
0x00838e5b: jns    0x140838b11
0x00838e61: mov    r11d,DWORD PTR [rip+0x1caf274]        # 0x1424e80dc
0x00838e68: cmp    WORD PTR [r13+0x20],0x6
0x00838e6e: jne    0x140838f66
0x00838e74: movsx  r10,WORD PTR [r13+0x14]
0x00838e79: movsx  r9d,WORD PTR [r13+0x12]
0x00838e7e: movsx  r8d,WORD PTR [r13+0x10]
0x00838e83: test   r8w,r8w
0x00838e87: js     0x140838f66
0x00838e8d: cmp    r8d,r11d
0x00838e90: jge    0x140838f66
0x00838e96: test   r9w,r9w
0x00838e9a: js     0x140838f66
0x00838ea0: cmp    r9d,DWORD PTR [rip+0x1caf239]        # 0x1424e80e0
0x00838ea7: jge    0x140838f66
0x00838ead: test   r10w,r10w
0x00838eb1: js     0x140838f66
0x00838eb7: cmp    r10d,DWORD PTR [rip+0x1caf226]        # 0x1424e80e4
0x00838ebe: jge    0x140838f66
0x00838ec4: movzx  eax,r8w
0x00838ec8: sar    ax,0x4
0x00838ecc: movzx  edx,r9w
0x00838ed0: sar    dx,0x4
0x00838ed4: mov    rcx,QWORD PTR [rip+0x1caf1cd]        # 0x1424e80a8
0x00838edb: test   rcx,rcx
0x00838ede: je     0x140838f66
0x00838ee4: movsx  rax,ax
0x00838ee8: movsx  rdx,dx
0x00838eec: mov    rax,QWORD PTR [rcx+rax*8]
0x00838ef0: mov    rax,QWORD PTR [rax+rdx*8]
0x00838ef4: mov    rbx,QWORD PTR [rax+r10*8]
0x00838ef8: test   rbx,rbx
0x00838efb: je     0x140838f66
0x00838efd: mov    eax,r8d
0x00838f00: and    eax,0x8000000f
0x00838f05: jge    0x140838f0e
0x00838f07: dec    eax
0x00838f09: or     eax,0xfffffff0
0x00838f0c: inc    eax
0x00838f0e: movsxd rcx,eax
0x00838f11: shl    rcx,0x4
0x00838f15: mov    eax,r9d
0x00838f18: and    eax,0x8000000f
0x00838f1d: jge    0x140838f26
0x00838f1f: dec    eax
0x00838f21: or     eax,0xfffffff0
0x00838f24: inc    eax
0x00838f26: cdqe
0x00838f28: add    rcx,rax
0x00838f2b: mov    ebx,DWORD PTR [rbx+rcx*4+0x2a0]
0x00838f32: bt     ebx,0x1e
0x00838f36: jae    0x140838f4d
0x00838f38: mov    r8d,0x9
0x00838f3e: lea    rdx,[rip+0xe7812b]        # 0x1416b1070 ; literal="stagnant "
0x00838f45: mov    rcx,r15
0x00838f48: call   0x14006fa10
0x00838f4d: test   ebx,ebx
0x00838f4f: jns    0x140838f66
0x00838f51: mov    r8d,0x5
0x00838f57: lea    rdx,[rip+0xe780c6]        # 0x1416b1024 ; literal="salt "
0x00838f5e: mov    rcx,r15
0x00838f61: call   0x14006fa10
0x00838f66: xorps  xmm0,xmm0
0x00838f69: movups XMMWORD PTR [rbp-0x9],xmm0
0x00838f6d: mov    QWORD PTR [rbp+0xf],rdi
0x00838f71: movsx  r14,WORD PTR [r13+0x28]
0x00838f76: mov    edi,DWORD PTR [r13+0x24]
0x00838f7a: movzx  esi,WORD PTR [r13+0x20]
0x00838f7f: xor    r15d,r15d
0x00838f82: mov    QWORD PTR [rbp+0x7],r15
0x00838f86: mov    BYTE PTR [rbp-0x9],r15b
0x00838f8a: movzx  eax,si
0x00838f8d: mov    ecx,0xdb
0x00838f92: sub    ax,cx
0x00838f95: mov    ecx,0xc7
0x00838f9a: cmp    ax,cx
0x00838f9d: ja     0x14083911e
0x00838fa3: mov    r8,QWORD PTR [rip+0x1cc0d76]        # 0x1424f9d20
0x00838faa: mov    r10,QWORD PTR [rip+0x1cc0d67]        # 0x1424f9d18
0x00838fb1: sub    r8,r10
0x00838fb4: sar    r8,0x3
0x00838fb8: test   r8,r8
0x00838fbb: je     0x14083911e
0x00838fc1: cmp    edi,0xffffffff
0x00838fc4: je     0x14083911e
0x00838fca: mov    edx,r15d
0x00838fcd: sub    r8d,0x1
0x00838fd1: js     0x14083911e
0x00838fd7: nop    WORD PTR [rax+rax*1+0x0]
0x00838fe0: lea    ecx,[r8+rdx*1]
0x00838fe4: sar    ecx,1
0x00838fe6: movsxd rax,ecx
0x00838fe9: mov    rbx,QWORD PTR [r10+rax*8]
0x00838fed: cmp    DWORD PTR [rbx+0xe0],edi
0x00838ff3: je     0x14083901d
0x00838ff5: lea    eax,[rcx-0x1]
0x00838ff8: cmovle eax,r8d
0x00838ffc: mov    r8d,eax
0x00838fff: lea    eax,[rcx+0x1]
0x00839002: cmovle edx,eax
0x00839005: cmp    edx,r8d
0x00839008: jle    0x140838fe0
0x0083900a: jmp    0x14083911e
0x0083900f: call   QWORD PTR [rip+0xdacb13]        # 0x1415e5b28
0x00839015: nop
0x00839016: call   QWORD PTR [rip+0xdacb0c]        # 0x1415e5b28
0x0083901c: nop
0x0083901d: test   rbx,rbx
0x00839020: je     0x14083911e
0x00839026: cmp    BYTE PTR [rbx+0xaa],r15b
0x0083902d: je     0x14083911e
0x00839033: xorps  xmm0,xmm0
0x00839036: movups XMMWORD PTR [rbp-0x49],xmm0
0x0083903a: mov    QWORD PTR [rbp-0x39],r15
0x0083903e: mov    QWORD PTR [rbp-0x31],0xf
0x00839046: mov    BYTE PTR [rbp-0x49],r15b
0x0083904a: mov    rax,QWORD PTR [rbx+0x130]
0x00839051: test   rax,rax
0x00839054: je     0x140839082
0x00839056: mov    rax,QWORD PTR [rax+0x58]
0x0083905a: test   rax,rax
0x0083905d: je     0x140839082
0x0083905f: mov    edx,DWORD PTR [rax+0x30]
0x00839062: cmp    edx,0xffffffff
0x00839065: je     0x140839082
0x00839067: lea    rcx,[rip+0x1caec7a]        # 0x1424e7ce8
0x0083906e: call   0x140072570
0x00839073: test   rax,rax
0x00839076: je     0x140839082
0x00839078: mov    rcx,rax
0x0083907b: call   0x140c3a4f0
0x00839080: jmp    0x140839086
0x00839082: lea    rax,[rbx+0x38]
0x00839086: test   rax,rax
0x00839089: je     0x1408390af
0x0083908b: cmp    BYTE PTR [rax+0x72],0x0
0x0083908f: je     0x1408390af
0x00839091: xor    r9d,r9d
0x00839094: mov    r8b,0x1
0x00839097: lea    rdx,[rbp-0x49]
0x0083909b: mov    rcx,rax
0x0083909e: call   0x140a946e0
0x008390a3: mov    rdx,QWORD PTR [rbp-0x31]
0x008390a7: mov    QWORD PTR [rbp-0x51],rdx
0x008390ab: mov    r15,QWORD PTR [rbp-0x39]
0x008390af: lea    rdx,[rbp-0x49]
0x008390b3: cmp    QWORD PTR [rbp-0x51],0xf
0x008390b8: cmova  rdx,QWORD PTR [rbp-0x49]
0x008390bd: mov    r8,r15
0x008390c0: lea    rcx,[rbp-0x9]
0x008390c4: call   0x14006fa10
0x008390c9: mov    r8d,0x3
0x008390cf: lea    rdx,[rip+0xdb4a4e]        # 0x1415edb24 ; literal="'s "
0x008390d6: lea    rcx,[rbp-0x9]
0x008390da: call   0x14006fa10
0x008390df: nop
0x008390e0: mov    rdx,QWORD PTR [rbp-0x31]
0x008390e4: cmp    rdx,0xf
0x008390e8: jbe    0x14083911e
0x008390ea: inc    rdx
0x008390ed: mov    rcx,QWORD PTR [rbp-0x49]
0x008390f1: mov    rax,rcx
0x008390f4: cmp    rdx,0x1000
0x008390fb: jb     0x140839119
0x008390fd: add    rdx,0x27
0x00839101: mov    rcx,QWORD PTR [rcx-0x8]
0x00839105: sub    rax,rcx
0x00839108: add    rax,0xfffffffffffffff8
0x0083910c: cmp    rax,0x1f
0x00839110: jbe    0x140839119
0x00839112: call   QWORD PTR [rip+0xdaca10]        # 0x1415e5b28
0x00839118: int3
0x00839119: call   0x141539680
0x0083911e: mov    r8d,edi
0x00839121: movzx  edx,si
0x00839124: lea    rcx,[rip+0x1b983c5]        # 0x1423d14f0
0x0083912b: call   0x1414add70
0x00839130: mov    rbx,rax
0x00839133: test   rax,rax
0x00839136: je     0x14083919a
0x00839138: cmp    QWORD PTR [rax+0x530],0x0
0x00839140: je     0x140839176
0x00839142: lea    rdx,[rax+0x520]
0x00839149: mov    r8,QWORD PTR [rdx+0x10]
0x0083914d: cmp    QWORD PTR [rdx+0x18],0xf
0x00839152: jbe    0x140839157
0x00839154: mov    rdx,QWORD PTR [rdx]
0x00839157: lea    rcx,[rbp-0x9]
0x0083915b: call   0x14006fa10
0x00839160: mov    r8d,0x1
0x00839166: lea    rdx,[rip+0xdaf5cf]        # 0x1415e873c ; literal=" "
0x0083916d: lea    rcx,[rbp-0x9]
0x00839171: call   0x14006fa10
0x00839176: mov    r12,r14
0x00839179: shl    r12,0x5
0x0083917d: add    r12,0xb8
0x00839184: add    r12,rbx
0x00839187: mov    rax,QWORD PTR [r12+0x10]
0x0083918c: cmp    QWORD PTR [r12+0x18],0xf
0x00839192: jbe    0x14083919f
0x00839194: mov    r12,QWORD PTR [r12]
0x00839198: jmp    0x14083919f
0x0083919a: mov    eax,0x10
0x0083919f: mov    r8,rax
0x008391a2: mov    rdx,r12
0x008391a5: lea    rcx,[rbp-0x9]
0x008391a9: call   0x14006fa10
0x008391ae: lea    rdx,[rbp-0x9]
0x008391b2: cmp    QWORD PTR [rbp+0xf],0xf
0x008391b7: cmova  rdx,QWORD PTR [rbp-0x9]
0x008391bc: mov    r8,QWORD PTR [rbp+0x7]
0x008391c0: mov    rbx,QWORD PTR [rbp-0x61]
0x008391c4: mov    rcx,rbx
0x008391c7: call   0x14006fa10
0x008391cc: mov    eax,0xffff8ad0
0x008391d1: cmp    WORD PTR [r13+0x16],ax
0x008391d6: je     0x140839235
0x008391d8: mov    r8d,0x2
0x008391de: lea    rdx,[rip+0xddc35b]        # 0x141615540 ; literal=" ("
0x008391e5: mov    rcx,rbx
0x008391e8: call   0x14006fa10
0x008391ed: mov    QWORD PTR [rsp+0x30],rbx
0x008391f2: movzx  eax,WORD PTR [r13+0x14]
0x008391f7: mov    WORD PTR [rsp+0x28],ax
0x008391fc: movzx  eax,WORD PTR [r13+0x12]
0x00839201: mov    WORD PTR [rsp+0x20],ax
0x00839206: movzx  r9d,WORD PTR [r13+0x10]
0x0083920b: movzx  r8d,WORD PTR [r13+0x1a]
0x00839210: movzx  edx,WORD PTR [r13+0x18]
0x00839215: movzx  ecx,WORD PTR [r13+0x16]
0x0083921a: call   0x14074f220
0x0083921f: mov    r8d,0x1
0x00839225: lea    rdx,[rip+0xddc354]        # 0x141615580 ; literal=")"
0x0083922c: mov    rcx,rbx
0x0083922f: call   0x14006fa10
0x00839234: nop
0x00839235: mov    rdx,QWORD PTR [rbp+0xf]
0x00839239: cmp    rdx,0xf
0x0083923d: jbe    0x140839273
0x0083923f: inc    rdx
0x00839242: mov    rcx,QWORD PTR [rbp-0x9]
0x00839246: mov    rax,rcx
0x00839249: cmp    rdx,0x1000
0x00839250: jb     0x14083926e
0x00839252: add    rdx,0x27
0x00839256: mov    rcx,QWORD PTR [rcx-0x8]
0x0083925a: sub    rax,rcx
0x0083925d: add    rax,0xfffffffffffffff8
0x00839261: cmp    rax,0x1f
0x00839265: jbe    0x14083926e
0x00839267: call   QWORD PTR [rip+0xdac8bb]        # 0x1415e5b28
0x0083926d: int3
0x0083926e: call   0x141539680
0x00839273: mov    rcx,QWORD PTR [rbp+0x17]
0x00839277: xor    rcx,rsp
0x0083927a: call   0x141539660
0x0083927f: mov    rbx,QWORD PTR [rsp+0x120]
0x00839287: add    rsp,0xd0
0x0083928e: pop    r15
0x00839290: pop    r14
0x00839292: pop    r13
0x00839294: pop    r12
0x00839296: pop    rdi
0x00839297: pop    rsi
0x00839298: pop    rbp
0x00839299: ret

# steam PE:6a70a6d9:02711000; adventure_option_view_contaminantst+8; RVA 0x8392a0..0x839671
0x008392a0: mov    QWORD PTR [rsp+0x18],rbx
0x008392a5: mov    QWORD PTR [rsp+0x20],rsi
0x008392aa: push   rbp
0x008392ab: push   rdi
0x008392ac: push   r12
0x008392ae: push   r14
0x008392b0: push   r15
0x008392b2: mov    rbp,rsp
0x008392b5: sub    rsp,0x50
0x008392b9: mov    rax,QWORD PTR [rip+0x1062d80]        # 0x14189c040
0x008392c0: xor    rax,rsp
0x008392c3: mov    QWORD PTR [rbp-0x10],rax
0x008392c7: mov    r12,rdx
0x008392ca: mov    rbx,rcx
0x008392cd: cmp    QWORD PTR [rcx+0x10],0x0
0x008392d2: je     0x140839646
0x008392d8: mov    rcx,QWORD PTR [rcx+0x18]
0x008392dc: test   rcx,rcx
0x008392df: je     0x140839646
0x008392e5: xorps  xmm0,xmm0
0x008392e8: movups XMMWORD PTR [rbp-0x30],xmm0
0x008392ec: xor    esi,esi
0x008392ee: mov    QWORD PTR [rbp-0x20],rsi
0x008392f2: mov    QWORD PTR [rbp-0x18],0xf
0x008392fa: mov    BYTE PTR [rbp-0x30],sil
0x008392fe: call   0x140657f90
0x00839303: mov    rdi,QWORD PTR [rbx+0x10]
0x00839307: mov    rax,QWORD PTR [rbx+0x18]
0x0083930b: movsx  rcx,WORD PTR [rax+0x18]
0x00839310: test   cx,cx
0x00839313: js     0x1408394ea
0x00839319: mov    rax,QWORD PTR [rdi+0x5f8]
0x00839320: mov    rdx,QWORD PTR [rax]
0x00839323: mov    rbx,rcx
0x00839326: mov    rcx,QWORD PTR [rax+0x8]
0x0083932a: sub    rcx,rdx
0x0083932d: sar    rcx,0x3
0x00839331: cmp    rbx,rcx
0x00839334: jae    0x1408394ea
0x0083933a: mov    rax,QWORD PTR [rdx+rbx*8]
0x0083933e: mov    rcx,QWORD PTR [rax+0x98]
0x00839345: sub    rcx,QWORD PTR [rax+0x90]
0x0083934c: sar    rcx,0x3
0x00839350: mov    QWORD PTR [rbp-0x20],rsi
0x00839354: lea    rax,[rbp-0x30]
0x00839358: test   rcx,rcx
0x0083935b: je     0x1408393b0
0x0083935d: cmp    QWORD PTR [rbp-0x18],0xf
0x00839362: cmova  rax,QWORD PTR [rbp-0x30]
0x00839367: mov    BYTE PTR [rax],sil
0x0083936a: mov    rax,QWORD PTR [rdi+0x5f8]
0x00839371: mov    rcx,QWORD PTR [rax]
0x00839374: mov    rax,QWORD PTR [rcx+rbx*8]
0x00839378: cmp    DWORD PTR [rax+0x84],0x1
0x0083937f: jg     0x14083938a
0x00839381: mov    rax,QWORD PTR [rax+0x90]
0x00839388: jmp    0x140839391
0x0083938a: mov    rax,QWORD PTR [rax+0xa8]
0x00839391: mov    rdx,QWORD PTR [rax]
0x00839394: cmp    QWORD PTR [rdx+0x18],0xf
0x00839399: mov    r8,QWORD PTR [rdx+0x10]
0x0083939d: jbe    0x1408393a2
0x0083939f: mov    rdx,QWORD PTR [rdx]
0x008393a2: lea    rcx,[rbp-0x30]
0x008393a6: call   0x14006fa10
0x008393ab: jmp    0x1408395c3
0x008393b0: cmp    QWORD PTR [rbp-0x18],0xf
0x008393b5: cmova  rax,QWORD PTR [rbp-0x30]
0x008393ba: mov    BYTE PTR [rax],0x0
0x008393bd: mov    r8d,0x9
0x008393c3: lea    rdx,[rip+0xe47c86]        # 0x141681050 ; literal="body part"
0x008393ca: lea    rcx,[rbp-0x30]
0x008393ce: call   0x14006fa10
0x008393d3: mov    rax,QWORD PTR [rdi+0x5f8]
0x008393da: mov    rcx,QWORD PTR [rax]
0x008393dd: mov    rax,QWORD PTR [rcx+rbx*8]
0x008393e1: cmp    DWORD PTR [rax+0x84],0x1
0x008393e8: jle    0x1408395c3
0x008393ee: mov    rdi,QWORD PTR [rbp-0x20]
0x008393f2: mov    rsi,QWORD PTR [rbp-0x18]
0x008393f6: cmp    rdi,rsi
0x008393f9: jae    0x14083941b
0x008393fb: lea    rax,[rdi+0x1]
0x008393ff: mov    QWORD PTR [rbp-0x20],rax
0x00839403: lea    rax,[rbp-0x30]
0x00839407: cmp    rsi,0xf
0x0083940b: cmova  rax,QWORD PTR [rbp-0x30]
0x00839410: mov    WORD PTR [rax+rdi*1],0x73
0x00839416: jmp    0x1408395c3
0x0083941b: movabs rbx,0x7fffffffffffffff
0x00839425: mov    rax,rbx
0x00839428: sub    rax,rdi
0x0083942b: cmp    rax,0x1
0x0083942f: jb     0x14083966b
0x00839435: lea    r15,[rdi+0x1]
0x00839439: mov    rcx,r15
0x0083943c: or     rcx,0xf
0x00839440: cmp    rcx,rbx
0x00839443: ja     0x140839464
0x00839445: mov    rdx,rsi
0x00839448: shr    rdx,1
0x0083944b: mov    rax,rbx
0x0083944e: sub    rax,rdx
0x00839451: cmp    rsi,rax
0x00839454: ja     0x140839464
0x00839456: lea    rax,[rsi+rdx*1]
0x0083945a: mov    rbx,rcx
0x0083945d: cmp    rcx,rax
0x00839460: cmovb  rbx,rax
0x00839464: lea    rcx,[rbx+0x1]
0x00839468: call   0x1400707d0
0x0083946d: mov    r14,rax
0x00839470: mov    QWORD PTR [rbp-0x20],r15
0x00839474: mov    QWORD PTR [rbp-0x18],rbx
0x00839478: mov    r8,rdi
0x0083947b: mov    rcx,rax
0x0083947e: cmp    rsi,0xf
0x00839482: jbe    0x1408394d1
0x00839484: mov    rbx,QWORD PTR [rbp-0x30]
0x00839488: mov    rdx,rbx
0x0083948b: call   0x14153aa78
0x00839490: mov    WORD PTR [r14+rdi*1],0x73
0x00839497: lea    rdx,[rsi+0x1]
0x0083949b: cmp    rdx,0x1000
0x008394a2: jb     0x1408394c0
0x008394a4: add    rdx,0x27
0x008394a8: mov    rcx,QWORD PTR [rbx-0x8]
0x008394ac: sub    rbx,rcx
0x008394af: lea    rax,[rbx-0x8]
0x008394b3: cmp    rax,0x1f
0x008394b7: ja     0x1408395b3
0x008394bd: mov    rbx,rcx
0x008394c0: mov    rcx,rbx
0x008394c3: call   0x141539680
0x008394c8: mov    QWORD PTR [rbp-0x30],r14
0x008394cc: jmp    0x1408395c3
0x008394d1: lea    rdx,[rbp-0x30]
0x008394d5: call   0x14153aa78
0x008394da: mov    WORD PTR [r14+rdi*1],0x73
0x008394e1: mov    QWORD PTR [rbp-0x30],r14
0x008394e5: jmp    0x1408395c3
0x008394ea: mov    rdi,QWORD PTR [rbp-0x18]
0x008394ee: cmp    rdi,0x9
0x008394f2: jb     0x140839527
0x008394f4: lea    rbx,[rbp-0x30]
0x008394f8: cmp    rdi,0xf
0x008394fc: cmova  rbx,QWORD PTR [rbp-0x30]
0x00839501: mov    QWORD PTR [rbp-0x20],0x9
0x00839509: mov    r8d,0x9
0x0083950f: lea    rdx,[rip+0xe47b3a]        # 0x141681050 ; literal="body part"
0x00839516: mov    rcx,rbx
0x00839519: call   0x14153ae1a
0x0083951e: mov    BYTE PTR [rbx+0x9],0x0
0x00839522: jmp    0x1408395c3
0x00839527: mov    rcx,rdi
0x0083952a: shr    rcx,1
0x0083952d: movabs rbx,0x7fffffffffffffff
0x00839537: mov    rax,rbx
0x0083953a: sub    rax,rcx
0x0083953d: cmp    rdi,rax
0x00839540: ja     0x140839552
0x00839542: lea    rax,[rcx+rdi*1]
0x00839546: mov    ebx,0xf
0x0083954b: cmp    rax,rbx
0x0083954e: cmova  rbx,rax
0x00839552: lea    rcx,[rbx+0x1]
0x00839556: call   0x1400707d0
0x0083955b: mov    rsi,rax
0x0083955e: mov    QWORD PTR [rbp-0x20],0x9
0x00839566: mov    QWORD PTR [rbp-0x18],rbx
0x0083956a: movsd  xmm0,QWORD PTR [rip+0xe47ade]        # 0x141681050 ; literal="body part"
0x00839572: movsd  QWORD PTR [rax],xmm0
0x00839576: movzx  ecx,BYTE PTR [rip+0xe47adb]        # 0x141681058 ; literal="t"
0x0083957d: mov    BYTE PTR [rax+0x8],cl
0x00839580: mov    BYTE PTR [rax+0x9],0x0
0x00839584: cmp    rdi,0xf
0x00839588: jbe    0x1408395bf
0x0083958a: lea    rdx,[rdi+0x1]
0x0083958e: mov    rcx,QWORD PTR [rbp-0x30]
0x00839592: mov    rax,rcx
0x00839595: cmp    rdx,0x1000
0x0083959c: jb     0x1408395ba
0x0083959e: add    rdx,0x27
0x008395a2: mov    rcx,QWORD PTR [rcx-0x8]
0x008395a6: sub    rax,rcx
0x008395a9: add    rax,0xfffffffffffffff8
0x008395ad: cmp    rax,0x1f
0x008395b1: jbe    0x1408395ba
0x008395b3: call   QWORD PTR [rip+0xdac56f]        # 0x1415e5b28
0x008395b9: int3
0x008395ba: call   0x141539680
0x008395bf: mov    QWORD PTR [rbp-0x30],rsi
0x008395c3: mov    r8d,0x2
0x008395c9: lea    rdx,[rip+0xddbf70]        # 0x141615540 ; literal=" ("
0x008395d0: mov    rcx,r12
0x008395d3: call   0x14006fa10
0x008395d8: lea    rdx,[rbp-0x30]
0x008395dc: cmp    QWORD PTR [rbp-0x18],0xf
0x008395e1: cmova  rdx,QWORD PTR [rbp-0x30]
0x008395e6: mov    r8,QWORD PTR [rbp-0x20]
0x008395ea: mov    rcx,r12
0x008395ed: call   0x14006fa10
0x008395f2: mov    r8d,0x1
0x008395f8: lea    rdx,[rip+0xddbf81]        # 0x141615580 ; literal=")"
0x008395ff: mov    rcx,r12
0x00839602: call   0x14006fa10
0x00839607: nop
0x00839608: mov    rdx,QWORD PTR [rbp-0x18]
0x0083960c: cmp    rdx,0xf
0x00839610: jbe    0x140839646
0x00839612: inc    rdx
0x00839615: mov    rcx,QWORD PTR [rbp-0x30]
0x00839619: mov    rax,rcx
0x0083961c: cmp    rdx,0x1000
0x00839623: jb     0x140839641
0x00839625: add    rdx,0x27
0x00839629: mov    rcx,QWORD PTR [rcx-0x8]
0x0083962d: sub    rax,rcx
0x00839630: add    rax,0xfffffffffffffff8
0x00839634: cmp    rax,0x1f
0x00839638: jbe    0x140839641
0x0083963a: call   QWORD PTR [rip+0xdac4e8]        # 0x1415e5b28
0x00839640: int3
0x00839641: call   0x141539680
0x00839646: mov    rcx,QWORD PTR [rbp-0x10]
0x0083964a: xor    rcx,rsp
0x0083964d: call   0x141539660
0x00839652: lea    r11,[rsp+0x50]
0x00839657: mov    rbx,QWORD PTR [r11+0x40]
0x0083965b: mov    rsi,QWORD PTR [r11+0x48]
0x0083965f: mov    rsp,r11
0x00839662: pop    r15
0x00839664: pop    r14
0x00839666: pop    r12
0x00839668: pop    rdi
0x00839669: pop    rbp
0x0083966a: ret
0x0083966b: call   0x140065890
0x00839670: nop

# steam PE:6a70a6d9:02711000; adventure_option_eat_unit_contaminantst+8; RVA 0x839850..0x839c95
0x00839850: mov    QWORD PTR [rsp+0x18],rbx
0x00839855: mov    QWORD PTR [rsp+0x20],rsi
0x0083985a: push   rbp
0x0083985b: push   rdi
0x0083985c: push   r12
0x0083985e: push   r14
0x00839860: push   r15
0x00839862: mov    rbp,rsp
0x00839865: sub    rsp,0x50
0x00839869: mov    rax,QWORD PTR [rip+0x10627d0]        # 0x14189c040
0x00839870: xor    rax,rsp
0x00839873: mov    QWORD PTR [rbp-0x10],rax
0x00839877: mov    r12,rdx
0x0083987a: mov    rbx,rcx
0x0083987d: cmp    QWORD PTR [rcx+0x10],0x0
0x00839882: je     0x140839c6a
0x00839888: mov    rax,QWORD PTR [rcx+0x18]
0x0083988c: test   rax,rax
0x0083988f: je     0x140839c6a
0x00839895: movsx  ecx,WORD PTR [rax+0x8]
0x00839899: test   ecx,ecx
0x0083989b: je     0x1408398b5
0x0083989d: sub    ecx,0x1
0x008398a0: je     0x1408398ae
0x008398a2: sub    ecx,0x2
0x008398a5: jne    0x1408398b5
0x008398a7: mov    eax,0x46
0x008398ac: jmp    0x1408398ba
0x008398ae: mov    eax,0x49
0x008398b3: jmp    0x1408398ba
0x008398b5: mov    eax,0x4b
0x008398ba: mov    ecx,0x6
0x008398bf: mov    r8d,0x4
0x008398c5: cmp    ax,0x49
0x008398c9: cmove  r8d,ecx
0x008398cd: lea    rcx,[rip+0xe77458]        # 0x1416b0d2c ; literal="Drink "
0x008398d4: lea    rdx,[rip+0xe7746d]        # 0x1416b0d48 ; literal="Eat "
0x008398db: cmove  rdx,rcx
0x008398df: mov    rcx,r12
0x008398e2: call   0x14006f8d0
0x008398e7: xorps  xmm0,xmm0
0x008398ea: movups XMMWORD PTR [rbp-0x30],xmm0
0x008398ee: xor    esi,esi
0x008398f0: mov    QWORD PTR [rbp-0x20],rsi
0x008398f4: mov    QWORD PTR [rbp-0x18],0xf
0x008398fc: mov    BYTE PTR [rbp-0x30],sil
0x00839900: lea    rdx,[rbp-0x30]
0x00839904: mov    rcx,QWORD PTR [rbx+0x18]
0x00839908: call   0x140657f90
0x0083990d: lea    rdx,[rbp-0x30]
0x00839911: cmp    QWORD PTR [rbp-0x18],0xf
0x00839916: cmova  rdx,QWORD PTR [rbp-0x30]
0x0083991b: mov    r8,QWORD PTR [rbp-0x20]
0x0083991f: mov    rcx,r12
0x00839922: call   0x14006fa10
0x00839927: mov    rdi,QWORD PTR [rbx+0x10]
0x0083992b: mov    rax,QWORD PTR [rbx+0x18]
0x0083992f: movsx  rcx,WORD PTR [rax+0x18]
0x00839934: test   cx,cx
0x00839937: js     0x140839b0e
0x0083993d: mov    rax,QWORD PTR [rdi+0x5f8]
0x00839944: mov    rdx,QWORD PTR [rax]
0x00839947: mov    rbx,rcx
0x0083994a: mov    rcx,QWORD PTR [rax+0x8]
0x0083994e: sub    rcx,rdx
0x00839951: sar    rcx,0x3
0x00839955: cmp    rbx,rcx
0x00839958: jae    0x140839b0e
0x0083995e: mov    rax,QWORD PTR [rdx+rbx*8]
0x00839962: mov    rcx,QWORD PTR [rax+0x98]
0x00839969: sub    rcx,QWORD PTR [rax+0x90]
0x00839970: sar    rcx,0x3
0x00839974: mov    QWORD PTR [rbp-0x20],rsi
0x00839978: lea    rax,[rbp-0x30]
0x0083997c: test   rcx,rcx
0x0083997f: je     0x1408399d4
0x00839981: cmp    QWORD PTR [rbp-0x18],0xf
0x00839986: cmova  rax,QWORD PTR [rbp-0x30]
0x0083998b: mov    BYTE PTR [rax],sil
0x0083998e: mov    rax,QWORD PTR [rdi+0x5f8]
0x00839995: mov    rcx,QWORD PTR [rax]
0x00839998: mov    rax,QWORD PTR [rcx+rbx*8]
0x0083999c: cmp    DWORD PTR [rax+0x84],0x1
0x008399a3: jg     0x1408399ae
0x008399a5: mov    rax,QWORD PTR [rax+0x90]
0x008399ac: jmp    0x1408399b5
0x008399ae: mov    rax,QWORD PTR [rax+0xa8]
0x008399b5: mov    rdx,QWORD PTR [rax]
0x008399b8: cmp    QWORD PTR [rdx+0x18],0xf
0x008399bd: mov    r8,QWORD PTR [rdx+0x10]
0x008399c1: jbe    0x1408399c6
0x008399c3: mov    rdx,QWORD PTR [rdx]
0x008399c6: lea    rcx,[rbp-0x30]
0x008399ca: call   0x14006fa10
0x008399cf: jmp    0x140839be7
0x008399d4: cmp    QWORD PTR [rbp-0x18],0xf
0x008399d9: cmova  rax,QWORD PTR [rbp-0x30]
0x008399de: mov    BYTE PTR [rax],0x0
0x008399e1: mov    r8d,0x9
0x008399e7: lea    rdx,[rip+0xe47662]        # 0x141681050 ; literal="body part"
0x008399ee: lea    rcx,[rbp-0x30]
0x008399f2: call   0x14006fa10
0x008399f7: mov    rax,QWORD PTR [rdi+0x5f8]
0x008399fe: mov    rcx,QWORD PTR [rax]
0x00839a01: mov    rax,QWORD PTR [rcx+rbx*8]
0x00839a05: cmp    DWORD PTR [rax+0x84],0x1
0x00839a0c: jle    0x140839be7
0x00839a12: mov    rdi,QWORD PTR [rbp-0x20]
0x00839a16: mov    rsi,QWORD PTR [rbp-0x18]
0x00839a1a: cmp    rdi,rsi
0x00839a1d: jae    0x140839a3f
0x00839a1f: lea    rax,[rdi+0x1]
0x00839a23: mov    QWORD PTR [rbp-0x20],rax
0x00839a27: lea    rax,[rbp-0x30]
0x00839a2b: cmp    rsi,0xf
0x00839a2f: cmova  rax,QWORD PTR [rbp-0x30]
0x00839a34: mov    WORD PTR [rax+rdi*1],0x73
0x00839a3a: jmp    0x140839be7
0x00839a3f: movabs rbx,0x7fffffffffffffff
0x00839a49: mov    rax,rbx
0x00839a4c: sub    rax,rdi
0x00839a4f: cmp    rax,0x1
0x00839a53: jb     0x140839c8f
0x00839a59: lea    r15,[rdi+0x1]
0x00839a5d: mov    rcx,r15
0x00839a60: or     rcx,0xf
0x00839a64: cmp    rcx,rbx
0x00839a67: ja     0x140839a88
0x00839a69: mov    rdx,rsi
0x00839a6c: shr    rdx,1
0x00839a6f: mov    rax,rbx
0x00839a72: sub    rax,rdx
0x00839a75: cmp    rsi,rax
0x00839a78: ja     0x140839a88
0x00839a7a: lea    rax,[rsi+rdx*1]
0x00839a7e: mov    rbx,rcx
0x00839a81: cmp    rcx,rax
0x00839a84: cmovb  rbx,rax
0x00839a88: lea    rcx,[rbx+0x1]
0x00839a8c: call   0x1400707d0
0x00839a91: mov    r14,rax
0x00839a94: mov    QWORD PTR [rbp-0x20],r15
0x00839a98: mov    QWORD PTR [rbp-0x18],rbx
0x00839a9c: mov    r8,rdi
0x00839a9f: mov    rcx,rax
0x00839aa2: cmp    rsi,0xf
0x00839aa6: jbe    0x140839af5
0x00839aa8: mov    rbx,QWORD PTR [rbp-0x30]
0x00839aac: mov    rdx,rbx
0x00839aaf: call   0x14153aa78
0x00839ab4: mov    WORD PTR [r14+rdi*1],0x73
0x00839abb: lea    rdx,[rsi+0x1]
0x00839abf: cmp    rdx,0x1000
0x00839ac6: jb     0x140839ae4
0x00839ac8: add    rdx,0x27
0x00839acc: mov    rcx,QWORD PTR [rbx-0x8]
0x00839ad0: sub    rbx,rcx
0x00839ad3: lea    rax,[rbx-0x8]
0x00839ad7: cmp    rax,0x1f
0x00839adb: ja     0x140839bd7
0x00839ae1: mov    rbx,rcx
0x00839ae4: mov    rcx,rbx
0x00839ae7: call   0x141539680
0x00839aec: mov    QWORD PTR [rbp-0x30],r14
0x00839af0: jmp    0x140839be7
0x00839af5: lea    rdx,[rbp-0x30]
0x00839af9: call   0x14153aa78
0x00839afe: mov    WORD PTR [r14+rdi*1],0x73
0x00839b05: mov    QWORD PTR [rbp-0x30],r14
0x00839b09: jmp    0x140839be7
0x00839b0e: mov    rdi,QWORD PTR [rbp-0x18]
0x00839b12: cmp    rdi,0x9
0x00839b16: jb     0x140839b4b
0x00839b18: lea    rbx,[rbp-0x30]
0x00839b1c: cmp    rdi,0xf
0x00839b20: cmova  rbx,QWORD PTR [rbp-0x30]
0x00839b25: mov    QWORD PTR [rbp-0x20],0x9
0x00839b2d: mov    r8d,0x9
0x00839b33: lea    rdx,[rip+0xe47516]        # 0x141681050 ; literal="body part"
0x00839b3a: mov    rcx,rbx
0x00839b3d: call   0x14153ae1a
0x00839b42: mov    BYTE PTR [rbx+0x9],0x0
0x00839b46: jmp    0x140839be7
0x00839b4b: mov    rcx,rdi
0x00839b4e: shr    rcx,1
0x00839b51: movabs rbx,0x7fffffffffffffff
0x00839b5b: mov    rax,rbx
0x00839b5e: sub    rax,rcx
0x00839b61: cmp    rdi,rax
0x00839b64: ja     0x140839b76
0x00839b66: lea    rax,[rcx+rdi*1]
0x00839b6a: mov    ebx,0xf
0x00839b6f: cmp    rax,rbx
0x00839b72: cmova  rbx,rax
0x00839b76: lea    rcx,[rbx+0x1]
0x00839b7a: call   0x1400707d0
0x00839b7f: mov    rsi,rax
0x00839b82: mov    QWORD PTR [rbp-0x20],0x9
0x00839b8a: mov    QWORD PTR [rbp-0x18],rbx
0x00839b8e: movsd  xmm0,QWORD PTR [rip+0xe474ba]        # 0x141681050 ; literal="body part"
0x00839b96: movsd  QWORD PTR [rax],xmm0
0x00839b9a: movzx  ecx,BYTE PTR [rip+0xe474b7]        # 0x141681058 ; literal="t"
0x00839ba1: mov    BYTE PTR [rax+0x8],cl
0x00839ba4: mov    BYTE PTR [rax+0x9],0x0
0x00839ba8: cmp    rdi,0xf
0x00839bac: jbe    0x140839be3
0x00839bae: lea    rdx,[rdi+0x1]
0x00839bb2: mov    rcx,QWORD PTR [rbp-0x30]
0x00839bb6: mov    rax,rcx
0x00839bb9: cmp    rdx,0x1000
0x00839bc0: jb     0x140839bde
0x00839bc2: add    rdx,0x27
0x00839bc6: mov    rcx,QWORD PTR [rcx-0x8]
0x00839bca: sub    rax,rcx
0x00839bcd: add    rax,0xfffffffffffffff8
0x00839bd1: cmp    rax,0x1f
0x00839bd5: jbe    0x140839bde
0x00839bd7: call   QWORD PTR [rip+0xdabf4b]        # 0x1415e5b28
0x00839bdd: int3
0x00839bde: call   0x141539680
0x00839be3: mov    QWORD PTR [rbp-0x30],rsi
0x00839be7: mov    r8d,0x2
0x00839bed: lea    rdx,[rip+0xddb94c]        # 0x141615540 ; literal=" ("
0x00839bf4: mov    rcx,r12
0x00839bf7: call   0x14006fa10
0x00839bfc: lea    rdx,[rbp-0x30]
0x00839c00: cmp    QWORD PTR [rbp-0x18],0xf
0x00839c05: cmova  rdx,QWORD PTR [rbp-0x30]
0x00839c0a: mov    r8,QWORD PTR [rbp-0x20]
0x00839c0e: mov    rcx,r12
0x00839c11: call   0x14006fa10
0x00839c16: mov    r8d,0x1
0x00839c1c: lea    rdx,[rip+0xddb95d]        # 0x141615580 ; literal=")"
0x00839c23: mov    rcx,r12
0x00839c26: call   0x14006fa10
0x00839c2b: nop
0x00839c2c: mov    rdx,QWORD PTR [rbp-0x18]
0x00839c30: cmp    rdx,0xf
0x00839c34: jbe    0x140839c6a
0x00839c36: inc    rdx
0x00839c39: mov    rcx,QWORD PTR [rbp-0x30]
0x00839c3d: mov    rax,rcx
0x00839c40: cmp    rdx,0x1000
0x00839c47: jb     0x140839c65
0x00839c49: add    rdx,0x27
0x00839c4d: mov    rcx,QWORD PTR [rcx-0x8]
0x00839c51: sub    rax,rcx
0x00839c54: add    rax,0xfffffffffffffff8
0x00839c58: cmp    rax,0x1f
0x00839c5c: jbe    0x140839c65
0x00839c5e: call   QWORD PTR [rip+0xdabec4]        # 0x1415e5b28
0x00839c64: int3
0x00839c65: call   0x141539680
0x00839c6a: mov    rcx,QWORD PTR [rbp-0x10]
0x00839c6e: xor    rcx,rsp
0x00839c71: call   0x141539660
0x00839c76: lea    r11,[rsp+0x50]
0x00839c7b: mov    rbx,QWORD PTR [r11+0x40]
0x00839c7f: mov    rsi,QWORD PTR [r11+0x48]
0x00839c83: mov    rsp,r11
0x00839c86: pop    r15
0x00839c88: pop    r14
0x00839c8a: pop    r12
0x00839c8c: pop    rdi
0x00839c8d: pop    rbp
0x00839c8e: ret
0x00839c8f: call   0x140065890
0x00839c94: nop

# steam PE:6a70a6d9:02711000; adventure_option_eat_item_contaminantst+8; RVA 0x839ca0..0x839e3a
0x00839ca0: mov    QWORD PTR [rsp+0x18],rbx
0x00839ca5: push   rdi
0x00839ca6: sub    rsp,0x50
0x00839caa: mov    rax,QWORD PTR [rip+0x106238f]        # 0x14189c040
0x00839cb1: xor    rax,rsp
0x00839cb4: mov    QWORD PTR [rsp+0x40],rax
0x00839cb9: mov    rdi,rdx
0x00839cbc: mov    rbx,rcx
0x00839cbf: cmp    QWORD PTR [rcx+0x10],0x0
0x00839cc4: je     0x140839e22
0x00839cca: cmp    QWORD PTR [rcx+0x18],0x0
0x00839ccf: je     0x140839e22
0x00839cd5: mov    rax,QWORD PTR [rcx+0x20]
0x00839cd9: test   rax,rax
0x00839cdc: je     0x140839e22
0x00839ce2: movsx  ecx,WORD PTR [rax+0x8]
0x00839ce6: test   ecx,ecx
0x00839ce8: je     0x140839d02
0x00839cea: sub    ecx,0x1
0x00839ced: je     0x140839cfb
0x00839cef: sub    ecx,0x2
0x00839cf2: jne    0x140839d02
0x00839cf4: mov    eax,0x46
0x00839cf9: jmp    0x140839d07
0x00839cfb: mov    eax,0x49
0x00839d00: jmp    0x140839d07
0x00839d02: mov    eax,0x4b
0x00839d07: mov    ecx,0x6
0x00839d0c: mov    r8d,0x4
0x00839d12: cmp    ax,0x49
0x00839d16: cmove  r8d,ecx
0x00839d1a: lea    rcx,[rip+0xe7700b]        # 0x1416b0d2c ; literal="Drink "
0x00839d21: lea    rdx,[rip+0xe77020]        # 0x1416b0d48 ; literal="Eat "
0x00839d28: cmove  rdx,rcx
0x00839d2c: mov    rcx,rdi
0x00839d2f: call   0x14006f8d0
0x00839d34: xorps  xmm0,xmm0
0x00839d37: movups XMMWORD PTR [rsp+0x20],xmm0
0x00839d3c: mov    QWORD PTR [rsp+0x30],0x0
0x00839d45: mov    QWORD PTR [rsp+0x38],0xf
0x00839d4e: mov    BYTE PTR [rsp+0x20],0x0
0x00839d53: lea    rdx,[rsp+0x20]
0x00839d58: mov    rcx,QWORD PTR [rbx+0x20]
0x00839d5c: call   0x140657f90
0x00839d61: lea    rdx,[rsp+0x20]
0x00839d66: cmp    QWORD PTR [rsp+0x38],0xf
0x00839d6c: cmova  rdx,QWORD PTR [rsp+0x20]
0x00839d72: mov    r8,QWORD PTR [rsp+0x30]
0x00839d77: mov    rcx,rdi
0x00839d7a: call   0x14006fa10
0x00839d7f: mov    rax,QWORD PTR [rbx+0x18]
0x00839d83: mov    r9d,0xffffffff
0x00839d89: xor    r8d,r8d
0x00839d8c: lea    rdx,[rsp+0x20]
0x00839d91: mov    rcx,QWORD PTR [rax]
0x00839d94: call   0x140c65450
0x00839d99: mov    r8d,0x2
0x00839d9f: lea    rdx,[rip+0xddb79a]        # 0x141615540 ; literal=" ("
0x00839da6: mov    rcx,rdi
0x00839da9: call   0x14006fa10
0x00839dae: lea    rdx,[rsp+0x20]
0x00839db3: cmp    QWORD PTR [rsp+0x38],0xf
0x00839db9: cmova  rdx,QWORD PTR [rsp+0x20]
0x00839dbf: mov    r8,QWORD PTR [rsp+0x30]
0x00839dc4: mov    rcx,rdi
0x00839dc7: call   0x14006fa10
0x00839dcc: mov    r8d,0x1
0x00839dd2: lea    rdx,[rip+0xddb7a7]        # 0x141615580 ; literal=")"
0x00839dd9: mov    rcx,rdi
0x00839ddc: call   0x14006fa10
0x00839de1: nop
0x00839de2: mov    rdx,QWORD PTR [rsp+0x38]
0x00839de7: cmp    rdx,0xf
0x00839deb: jbe    0x140839e22
0x00839ded: inc    rdx
0x00839df0: mov    rcx,QWORD PTR [rsp+0x20]
0x00839df5: mov    rax,rcx
0x00839df8: cmp    rdx,0x1000
0x00839dff: jb     0x140839e1d
0x00839e01: add    rdx,0x27
0x00839e05: mov    rcx,QWORD PTR [rcx-0x8]
0x00839e09: sub    rax,rcx
0x00839e0c: add    rax,0xfffffffffffffff8
0x00839e10: cmp    rax,0x1f
0x00839e14: jbe    0x140839e1d
0x00839e16: call   QWORD PTR [rip+0xdabd0c]        # 0x1415e5b28
0x00839e1c: int3
0x00839e1d: call   0x141539680
0x00839e22: mov    rcx,QWORD PTR [rsp+0x40]
0x00839e27: xor    rcx,rsp
0x00839e2a: call   0x141539660
0x00839e2f: mov    rbx,QWORD PTR [rsp+0x70]
0x00839e34: add    rsp,0x50
0x00839e38: pop    rdi
0x00839e39: ret

# steam PE:6a70a6d9:02711000; adventure_environment_pickup_vermin_eventst+8; RVA 0x839e40..0x83a0d5
0x00839e40: mov    QWORD PTR [rsp+0x18],rbx
0x00839e45: push   rbp
0x00839e46: push   rsi
0x00839e47: push   rdi
0x00839e48: push   r12
0x00839e4a: push   r13
0x00839e4c: push   r14
0x00839e4e: push   r15
0x00839e50: sub    rsp,0xa0
0x00839e57: mov    rax,QWORD PTR [rip+0x10621e2]        # 0x14189c040
0x00839e5e: xor    rax,rsp
0x00839e61: mov    QWORD PTR [rsp+0x90],rax
0x00839e69: mov    rax,rdx
0x00839e6c: mov    QWORD PTR [rsp+0x48],rdx
0x00839e71: mov    rsi,rcx
0x00839e74: xor    r14d,r14d
0x00839e77: mov    r8d,0x2
0x00839e7d: lea    rdx,[rip+0xdb37f8]        # 0x1415ed67c ; literal="A "
0x00839e84: mov    rcx,rax
0x00839e87: call   0x14006f8d0
0x00839e8c: xorps  xmm0,xmm0
0x00839e8f: movups XMMWORD PTR [rsp+0x70],xmm0
0x00839e94: mov    ebx,0xf
0x00839e99: mov    ebp,ebx
0x00839e9b: mov    QWORD PTR [rsp+0x88],rbx
0x00839ea3: movsxd rcx,DWORD PTR [rsi+0x20]
0x00839ea7: mov    rax,QWORD PTR [rip+0x1b976d2]        # 0x1423d1580
0x00839eae: mov    rcx,QWORD PTR [rax+rcx*8]
0x00839eb2: movsx  rax,WORD PTR [rcx]
0x00839eb6: mov    QWORD PTR [rsp+0x80],r14
0x00839ebe: mov    BYTE PTR [rsp+0x70],r14b
0x00839ec3: test   ax,ax
0x00839ec6: js     0x140839f1e
0x00839ec8: mov    rdx,QWORD PTR [rip+0x1cb2b99]        # 0x1424eca68
0x00839ecf: mov    rcx,rax
0x00839ed2: mov    rax,QWORD PTR [rip+0x1cb2b97]        # 0x1424eca70
0x00839ed9: sub    rax,rdx
0x00839edc: sar    rax,0x3
0x00839ee0: cmp    rcx,rax
0x00839ee3: jae    0x140839f1e
0x00839ee5: mov    rdx,QWORD PTR [rdx+rcx*8]
0x00839ee9: add    rdx,0x20
0x00839eed: lea    rax,[rsp+0x70]
0x00839ef2: cmp    rax,rdx
0x00839ef5: je     0x140839f1e
0x00839ef7: mov    r8,QWORD PTR [rdx+0x10]
0x00839efb: cmp    QWORD PTR [rdx+0x18],rbx
0x00839eff: jbe    0x140839f04
0x00839f01: mov    rdx,QWORD PTR [rdx]
0x00839f04: lea    rcx,[rsp+0x70]
0x00839f09: call   0x14006f8d0
0x00839f0e: mov    rbp,QWORD PTR [rsp+0x88]
0x00839f16: mov    r14,QWORD PTR [rsp+0x80]
0x00839f1e: mov    eax,0xffff8ad0
0x00839f23: mov    rdi,QWORD PTR [rsp+0x70]
0x00839f28: cmp    WORD PTR [rsi+0x16],ax
0x00839f2c: je     0x14083a06a
0x00839f32: movabs rcx,0x7fffffffffffffff
0x00839f3c: mov    rax,rcx
0x00839f3f: sub    rax,r14
0x00839f42: cmp    rax,0x2
0x00839f46: jb     0x14083a0cf
0x00839f4c: lea    r13,[rsp+0x70]
0x00839f51: cmp    rbp,0xf
0x00839f55: cmova  r13,rdi
0x00839f59: xorps  xmm0,xmm0
0x00839f5c: movups XMMWORD PTR [rsp+0x50],xmm0
0x00839f61: lea    r12,[r14+0x2]
0x00839f65: lea    r15,[rsp+0x50]
0x00839f6a: cmp    r12,0xf
0x00839f6e: jbe    0x140839f9e
0x00839f70: mov    rbx,r12
0x00839f73: or     rbx,0xf
0x00839f77: cmp    rbx,rcx
0x00839f7a: jbe    0x140839f81
0x00839f7c: mov    rbx,rcx
0x00839f7f: jmp    0x140839f8d
0x00839f81: mov    eax,0x16
0x00839f86: cmp    rbx,rax
0x00839f89: cmovb  rbx,rax
0x00839f8d: lea    rcx,[rbx+0x1]
0x00839f91: call   0x1400707d0
0x00839f96: mov    r15,rax
0x00839f99: mov    QWORD PTR [rsp+0x50],rax
0x00839f9e: mov    QWORD PTR [rsp+0x60],r12
0x00839fa3: mov    QWORD PTR [rsp+0x68],rbx
0x00839fa8: mov    r8,r14
0x00839fab: mov    rdx,r13
0x00839fae: mov    rcx,r15
0x00839fb1: call   0x14153aa78
0x00839fb6: mov    WORD PTR [r14+r15*1],0x2820 ; inline=" ("
0x00839fbd: mov    BYTE PTR [r15+r12*1],0x0
0x00839fc2: lea    rdx,[rsp+0x50]
0x00839fc7: cmp    QWORD PTR [rsp+0x68],0xf
0x00839fcd: cmova  rdx,QWORD PTR [rsp+0x50]
0x00839fd3: mov    r8,QWORD PTR [rsp+0x60]
0x00839fd8: mov    rbx,QWORD PTR [rsp+0x48]
0x00839fdd: mov    rcx,rbx
0x00839fe0: call   0x14006fa10
0x00839fe5: nop
0x00839fe6: mov    rdx,QWORD PTR [rsp+0x68]
0x00839feb: cmp    rdx,0xf
0x00839fef: jbe    0x14083a026
0x00839ff1: inc    rdx
0x00839ff4: mov    rcx,QWORD PTR [rsp+0x50]
0x00839ff9: mov    rax,rcx
0x00839ffc: cmp    rdx,0x1000
0x0083a003: jb     0x14083a021
0x0083a005: add    rdx,0x27
0x0083a009: mov    rcx,QWORD PTR [rcx-0x8]
0x0083a00d: sub    rax,rcx
0x0083a010: add    rax,0xfffffffffffffff8
0x0083a014: cmp    rax,0x1f
0x0083a018: jbe    0x14083a021
0x0083a01a: call   QWORD PTR [rip+0xdabb08]        # 0x1415e5b28
0x0083a020: int3
0x0083a021: call   0x141539680
0x0083a026: mov    QWORD PTR [rsp+0x30],rbx
0x0083a02b: movzx  eax,WORD PTR [rsi+0x14]
0x0083a02f: mov    WORD PTR [rsp+0x28],ax
0x0083a034: movzx  eax,WORD PTR [rsi+0x12]
0x0083a038: mov    WORD PTR [rsp+0x20],ax
0x0083a03d: movzx  r9d,WORD PTR [rsi+0x10]
0x0083a042: movzx  r8d,WORD PTR [rsi+0x1a]
0x0083a047: movzx  edx,WORD PTR [rsi+0x18]
0x0083a04b: movzx  ecx,WORD PTR [rsi+0x16]
0x0083a04f: call   0x14074f220
0x0083a054: mov    r8d,0x1
0x0083a05a: lea    rdx,[rip+0xddb51f]        # 0x141615580 ; literal=")"
0x0083a061: mov    rcx,rbx
0x0083a064: call   0x14006fa10
0x0083a069: nop
0x0083a06a: cmp    rbp,0xf
0x0083a06e: jbe    0x14083a0a4
0x0083a070: lea    rdx,[rbp+0x1]
0x0083a074: mov    rax,rdi
0x0083a077: cmp    rdx,0x1000
0x0083a07e: jb     0x14083a09c
0x0083a080: add    rdx,0x27
0x0083a084: mov    rdi,QWORD PTR [rdi-0x8]
0x0083a088: sub    rax,rdi
0x0083a08b: add    rax,0xfffffffffffffff8
0x0083a08f: cmp    rax,0x1f
0x0083a093: jbe    0x14083a09c
0x0083a095: call   QWORD PTR [rip+0xdaba8d]        # 0x1415e5b28
0x0083a09b: int3
0x0083a09c: mov    rcx,rdi
0x0083a09f: call   0x141539680
0x0083a0a4: mov    rcx,QWORD PTR [rsp+0x90]
0x0083a0ac: xor    rcx,rsp
0x0083a0af: call   0x141539660
0x0083a0b4: mov    rbx,QWORD PTR [rsp+0xf0]
0x0083a0bc: add    rsp,0xa0
0x0083a0c3: pop    r15
0x0083a0c5: pop    r14
0x0083a0c7: pop    r13
0x0083a0c9: pop    r12
0x0083a0cb: pop    rdi
0x0083a0cc: pop    rsi
0x0083a0cd: pop    rbp
0x0083a0ce: ret
0x0083a0cf: call   0x140065890
0x0083a0d4: nop

# steam PE:6a70a6d9:02711000; adventure_environment_pickup_ignite_vegst+8; RVA 0x83a0e0..0x83a330
0x0083a0e0: mov    QWORD PTR [rsp+0x18],rbx
0x0083a0e5: mov    QWORD PTR [rsp+0x20],rbp
0x0083a0ea: push   rsi
0x0083a0eb: push   rdi
0x0083a0ec: push   r12
0x0083a0ee: push   r14
0x0083a0f0: push   r15
0x0083a0f2: sub    rsp,0x90
0x0083a0f9: mov    rax,QWORD PTR [rip+0x1061f40]        # 0x14189c040
0x0083a100: xor    rax,rsp
0x0083a103: mov    QWORD PTR [rsp+0x88],rax
0x0083a10b: mov    r12,rdx
0x0083a10e: mov    rdi,rcx
0x0083a111: xor    ebx,ebx
0x0083a113: mov    r8d,0x7
0x0083a119: lea    rdx,[rip+0xe76c20]        # 0x1416b0d40 ; literal="Ignite "
0x0083a120: mov    rcx,r12
0x0083a123: call   0x14006f8d0
0x0083a128: xorps  xmm0,xmm0
0x0083a12b: movups XMMWORD PTR [rsp+0x68],xmm0
0x0083a130: mov    QWORD PTR [rsp+0x78],rbx
0x0083a135: mov    ebx,0xf
0x0083a13a: mov    QWORD PTR [rsp+0x80],rbx
0x0083a142: mov    BYTE PTR [rsp+0x68],0x0
0x0083a147: mov    BYTE PTR [rsp+0x28],0x0
0x0083a14c: movzx  eax,WORD PTR [rdi+0x14]
0x0083a150: mov    WORD PTR [rsp+0x20],ax
0x0083a155: movzx  r9d,WORD PTR [rdi+0x12]
0x0083a15a: movzx  r8d,WORD PTR [rdi+0x10]
0x0083a15f: lea    rdx,[rsp+0x68]
0x0083a164: lea    rcx,[rip+0x1b97385]        # 0x1423d14f0
0x0083a16b: call   0x140e7d330
0x0083a170: mov    eax,0xffff8ad0
0x0083a175: cmp    WORD PTR [rdi+0x16],ax
0x0083a179: je     0x14083a2bb
0x0083a17f: mov    rbp,QWORD PTR [rsp+0x78]
0x0083a184: movabs rcx,0x7fffffffffffffff
0x0083a18e: mov    rax,rcx
0x0083a191: sub    rax,rbp
0x0083a194: cmp    rax,0x2
0x0083a198: jb     0x14083a32a
0x0083a19e: lea    r15,[rsp+0x68]
0x0083a1a3: cmp    QWORD PTR [rsp+0x80],rbx
0x0083a1ab: cmova  r15,QWORD PTR [rsp+0x68]
0x0083a1b1: xorps  xmm0,xmm0
0x0083a1b4: movups XMMWORD PTR [rsp+0x48],xmm0
0x0083a1b9: lea    r14,[rbp+0x2]
0x0083a1bd: lea    rsi,[rsp+0x48]
0x0083a1c2: cmp    r14,rbx
0x0083a1c5: jbe    0x14083a1f5
0x0083a1c7: mov    rbx,r14
0x0083a1ca: or     rbx,0xf
0x0083a1ce: cmp    rbx,rcx
0x0083a1d1: jbe    0x14083a1d8
0x0083a1d3: mov    rbx,rcx
0x0083a1d6: jmp    0x14083a1e4
0x0083a1d8: mov    eax,0x16
0x0083a1dd: cmp    rbx,rax
0x0083a1e0: cmovb  rbx,rax
0x0083a1e4: lea    rcx,[rbx+0x1]
0x0083a1e8: call   0x1400707d0
0x0083a1ed: mov    rsi,rax
0x0083a1f0: mov    QWORD PTR [rsp+0x48],rax
0x0083a1f5: mov    QWORD PTR [rsp+0x58],r14
0x0083a1fa: mov    QWORD PTR [rsp+0x60],rbx
0x0083a1ff: mov    r8,rbp
0x0083a202: mov    rdx,r15
0x0083a205: mov    rcx,rsi
0x0083a208: call   0x14153aa78
0x0083a20d: mov    WORD PTR [rsi+rbp*1],0x2820 ; inline=" ("
0x0083a213: mov    BYTE PTR [rsi+r14*1],0x0
0x0083a218: lea    rdx,[rsp+0x48]
0x0083a21d: cmp    QWORD PTR [rsp+0x60],0xf
0x0083a223: cmova  rdx,QWORD PTR [rsp+0x48]
0x0083a229: mov    r8,QWORD PTR [rsp+0x58]
0x0083a22e: mov    rcx,r12
0x0083a231: call   0x14006fa10
0x0083a236: nop
0x0083a237: mov    rdx,QWORD PTR [rsp+0x60]
0x0083a23c: cmp    rdx,0xf
0x0083a240: jbe    0x14083a277
0x0083a242: inc    rdx
0x0083a245: mov    rcx,QWORD PTR [rsp+0x48]
0x0083a24a: mov    rax,rcx
0x0083a24d: cmp    rdx,0x1000
0x0083a254: jb     0x14083a272
0x0083a256: add    rdx,0x27
0x0083a25a: mov    rcx,QWORD PTR [rcx-0x8]
0x0083a25e: sub    rax,rcx
0x0083a261: add    rax,0xfffffffffffffff8
0x0083a265: cmp    rax,0x1f
0x0083a269: jbe    0x14083a272
0x0083a26b: call   QWORD PTR [rip+0xdab8b7]        # 0x1415e5b28
0x0083a271: int3
0x0083a272: call   0x141539680
0x0083a277: mov    QWORD PTR [rsp+0x30],r12
0x0083a27c: movzx  eax,WORD PTR [rdi+0x14]
0x0083a280: mov    WORD PTR [rsp+0x28],ax
0x0083a285: movzx  eax,WORD PTR [rdi+0x12]
0x0083a289: mov    WORD PTR [rsp+0x20],ax
0x0083a28e: movzx  r9d,WORD PTR [rdi+0x10]
0x0083a293: movzx  r8d,WORD PTR [rdi+0x1a]
0x0083a298: movzx  edx,WORD PTR [rdi+0x18]
0x0083a29c: movzx  ecx,WORD PTR [rdi+0x16]
0x0083a2a0: call   0x14074f220
0x0083a2a5: mov    r8d,0x1
0x0083a2ab: lea    rdx,[rip+0xddb2ce]        # 0x141615580 ; literal=")"
0x0083a2b2: mov    rcx,r12
0x0083a2b5: call   0x14006fa10
0x0083a2ba: nop
0x0083a2bb: mov    rdx,QWORD PTR [rsp+0x80]
0x0083a2c3: cmp    rdx,0xf
0x0083a2c7: jbe    0x14083a2fe
0x0083a2c9: inc    rdx
0x0083a2cc: mov    rcx,QWORD PTR [rsp+0x68]
0x0083a2d1: mov    rax,rcx
0x0083a2d4: cmp    rdx,0x1000
0x0083a2db: jb     0x14083a2f9
0x0083a2dd: add    rdx,0x27
0x0083a2e1: mov    rcx,QWORD PTR [rcx-0x8]
0x0083a2e5: sub    rax,rcx
0x0083a2e8: add    rax,0xfffffffffffffff8
0x0083a2ec: cmp    rax,0x1f
0x0083a2f0: jbe    0x14083a2f9
0x0083a2f2: call   QWORD PTR [rip+0xdab830]        # 0x1415e5b28
0x0083a2f8: int3
0x0083a2f9: call   0x141539680
0x0083a2fe: mov    rcx,QWORD PTR [rsp+0x88]
0x0083a306: xor    rcx,rsp
0x0083a309: call   0x141539660
0x0083a30e: lea    r11,[rsp+0x90]
0x0083a316: mov    rbx,QWORD PTR [r11+0x40]
0x0083a31a: mov    rbp,QWORD PTR [r11+0x48]
0x0083a31e: mov    rsp,r11
0x0083a321: pop    r15
0x0083a323: pop    r14
0x0083a325: pop    r12
0x0083a327: pop    rdi
0x0083a328: pop    rsi
0x0083a329: ret
0x0083a32a: call   0x140065890
0x0083a32f: nop

# steam PE:6a70a6d9:02711000; adventure_environment_pickup_make_campfirest+8; RVA 0x83a330..0x83a3c3
0x0083a330: mov    QWORD PTR [rsp+0x8],rbx
0x0083a335: push   rdi
0x0083a336: sub    rsp,0x40
0x0083a33a: mov    rdi,rdx
0x0083a33d: mov    rbx,rcx
0x0083a340: mov    rcx,rdi
0x0083a343: lea    rdx,[rip+0xe76abe]        # 0x1416b0e08 ; literal="Make Campfire"
0x0083a34a: mov    r8d,0xd
0x0083a350: call   0x14006f8d0
0x0083a355: mov    eax,0xffff8ad0
0x0083a35a: cmp    WORD PTR [rbx+0x16],ax
0x0083a35e: je     0x14083a3b8
0x0083a360: mov    r8d,0x2
0x0083a366: lea    rdx,[rip+0xddb1d3]        # 0x141615540 ; literal=" ("
0x0083a36d: mov    rcx,rdi
0x0083a370: call   0x14006fa10
0x0083a375: movzx  eax,WORD PTR [rbx+0x14]
0x0083a379: movzx  r9d,WORD PTR [rbx+0x10]
0x0083a37e: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083a383: movzx  edx,WORD PTR [rbx+0x18]
0x0083a387: movzx  ecx,WORD PTR [rbx+0x16]
0x0083a38b: mov    QWORD PTR [rsp+0x30],rdi
0x0083a390: mov    WORD PTR [rsp+0x28],ax
0x0083a395: movzx  eax,WORD PTR [rbx+0x12]
0x0083a399: mov    WORD PTR [rsp+0x20],ax
0x0083a39e: call   0x14074f220
0x0083a3a3: mov    r8d,0x1
0x0083a3a9: lea    rdx,[rip+0xddb1d0]        # 0x141615580 ; literal=")"
0x0083a3b0: mov    rcx,rdi
0x0083a3b3: call   0x14006fa10
0x0083a3b8: mov    rbx,QWORD PTR [rsp+0x50]
0x0083a3bd: add    rsp,0x40
0x0083a3c1: pop    rdi
0x0083a3c2: ret

# steam PE:6a70a6d9:02711000; adventure_environment_pickup_chop_treest+8; RVA 0x83a3d0..0x83a4d4
0x0083a3d0: mov    QWORD PTR [rsp+0x8],rbx
0x0083a3d5: push   rdi
0x0083a3d6: sub    rsp,0x40
0x0083a3da: mov    rdi,rdx
0x0083a3dd: mov    rbx,rcx
0x0083a3e0: mov    rcx,rdi
0x0083a3e3: lea    rdx,[rip+0xe76a16]        # 0x1416b0e00 ; literal="Fell "
0x0083a3ea: mov    r8d,0x5
0x0083a3f0: call   0x14006f8d0
0x0083a3f5: movzx  r9d,WORD PTR [rbx+0x14]
0x0083a3fa: movzx  r8d,WORD PTR [rbx+0x12]
0x0083a3ff: movzx  edx,WORD PTR [rbx+0x10]
0x0083a403: call   0x1413ffaf0
0x0083a408: test   rax,rax
0x0083a40b: je     0x14083a451
0x0083a40d: movsx  rax,WORD PTR [rax+0x2]
0x0083a412: test   ax,ax
0x0083a415: js     0x14083a451
0x0083a417: mov    rcx,QWORD PTR [rip+0x1cb24da]        # 0x1424ec8f8
0x0083a41e: mov    rdx,rax
0x0083a421: mov    rax,QWORD PTR [rip+0x1cb24d8]        # 0x1424ec900
0x0083a428: sub    rax,rcx
0x0083a42b: sar    rax,0x3
0x0083a42f: cmp    rdx,rax
0x0083a432: jae    0x14083a451
0x0083a434: mov    rdx,QWORD PTR [rcx+rdx*8]
0x0083a438: test   rdx,rdx
0x0083a43b: je     0x14083a451
0x0083a43d: mov    r8,QWORD PTR [rdx+0x60]
0x0083a441: add    rdx,0x50
0x0083a445: cmp    QWORD PTR [rdx+0x18],0xf
0x0083a44a: jbe    0x14083a45e
0x0083a44c: mov    rdx,QWORD PTR [rdx]
0x0083a44f: jmp    0x14083a45e
0x0083a451: lea    rdx,[rip+0xe769e4]        # 0x1416b0e3c ; literal="tree"
0x0083a458: mov    r8d,0x4
0x0083a45e: mov    rcx,rdi
0x0083a461: call   0x14006fa10
0x0083a466: mov    eax,0xffff8ad0
0x0083a46b: cmp    WORD PTR [rbx+0x16],ax
0x0083a46f: je     0x14083a4c9
0x0083a471: mov    r8d,0x2
0x0083a477: lea    rdx,[rip+0xddb0c2]        # 0x141615540 ; literal=" ("
0x0083a47e: mov    rcx,rdi
0x0083a481: call   0x14006fa10
0x0083a486: movzx  eax,WORD PTR [rbx+0x14]
0x0083a48a: movzx  r9d,WORD PTR [rbx+0x10]
0x0083a48f: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083a494: movzx  edx,WORD PTR [rbx+0x18]
0x0083a498: movzx  ecx,WORD PTR [rbx+0x16]
0x0083a49c: mov    QWORD PTR [rsp+0x30],rdi
0x0083a4a1: mov    WORD PTR [rsp+0x28],ax
0x0083a4a6: movzx  eax,WORD PTR [rbx+0x12]
0x0083a4aa: mov    WORD PTR [rsp+0x20],ax
0x0083a4af: call   0x14074f220
0x0083a4b4: mov    r8d,0x1
0x0083a4ba: lea    rdx,[rip+0xddb0bf]        # 0x141615580 ; literal=")"
0x0083a4c1: mov    rcx,rdi
0x0083a4c4: call   0x14006fa10
0x0083a4c9: mov    rbx,QWORD PTR [rsp+0x50]
0x0083a4ce: add    rsp,0x40
0x0083a4d2: pop    rdi
0x0083a4d3: ret

# steam PE:6a70a6d9:02711000; adventure_movement_attack_creaturest+8; RVA 0x83fe00..0x840027
0x0083fe00: mov    QWORD PTR [rsp+0x8],rbx
0x0083fe05: mov    QWORD PTR [rsp+0x18],rsi
0x0083fe0a: push   rdi
0x0083fe0b: sub    rsp,0x70
0x0083fe0f: mov    rax,QWORD PTR [rip+0x105c22a]        # 0x14189c040
0x0083fe16: xor    rax,rsp
0x0083fe19: mov    QWORD PTR [rsp+0x60],rax
0x0083fe1e: mov    rdi,rdx
0x0083fe21: mov    rbx,rcx
0x0083fe24: mov    rax,QWORD PTR [rcx+0x28]
0x0083fe28: sub    rax,QWORD PTR [rcx+0x20]
0x0083fe2c: mov    rcx,rdx
0x0083fe2f: test   rax,0xfffffffffffffffc
0x0083fe35: jne    0x14083fe4e
0x0083fe37: mov    r8d,0xc
0x0083fe3d: lea    rdx,[rip+0xe70ddc]        # 0x1416b0c20 ; literal="Attack error"
0x0083fe44: call   0x14006f8d0
0x0083fe49: jmp    0x140840008
0x0083fe4e: mov    r8d,0x7
0x0083fe54: lea    rdx,[rip+0xe3e80d]        # 0x14167e668 ; literal="Attack "
0x0083fe5b: call   0x14006f8d0
0x0083fe60: mov    r11,QWORD PTR [rbx+0x20]
0x0083fe64: mov    rax,QWORD PTR [rbx+0x28]
0x0083fe68: sub    rax,r11
0x0083fe6b: and    rax,0xfffffffffffffffc
0x0083fe6f: cmp    rax,0x4
0x0083fe73: jne    0x14083ff90
0x0083fe79: mov    r11d,DWORD PTR [r11]
0x0083fe7c: mov    r9,QWORD PTR [rip+0x1ba5235]        # 0x1423e50b8
0x0083fe83: mov    rsi,QWORD PTR [rip+0x1ba5226]        # 0x1423e50b0
0x0083fe8a: sub    r9,rsi
0x0083fe8d: sar    r9,0x3
0x0083fe91: test   r9d,r9d
0x0083fe94: je     0x14083feda
0x0083fe96: cmp    r11d,0xffffffff
0x0083fe9a: je     0x14083feda
0x0083fe9c: xor    edx,edx
0x0083fe9e: sub    r9d,0x1
0x0083fea2: js     0x14083feda
0x0083fea4: nop    DWORD PTR [rax+0x0]
0x0083fea8: nop    DWORD PTR [rax+rax*1+0x0]
0x0083feb0: lea    ecx,[rdx+r9*1]
0x0083feb4: sar    ecx,1
0x0083feb6: movsxd rax,ecx
0x0083feb9: mov    r10,QWORD PTR [rsi+rax*8]
0x0083febd: cmp    DWORD PTR [r10+0x130],r11d
0x0083fec4: je     0x14083fedd
0x0083fec6: lea    eax,[rcx+0x1]
0x0083fec9: cmovle edx,eax
0x0083fecc: lea    eax,[rcx-0x1]
0x0083fecf: cmovle eax,r9d
0x0083fed3: mov    r9d,eax
0x0083fed6: cmp    edx,eax
0x0083fed8: jle    0x14083feb0
0x0083feda: xor    r10d,r10d
0x0083fedd: test   r10,r10
0x0083fee0: je     0x14083ff81
0x0083fee6: xorps  xmm0,xmm0
0x0083fee9: movups XMMWORD PTR [rsp+0x40],xmm0
0x0083feee: mov    QWORD PTR [rsp+0x50],0x0
0x0083fef7: mov    QWORD PTR [rsp+0x58],0xf
0x0083ff00: mov    BYTE PTR [rsp+0x40],0x0
0x0083ff05: mov    BYTE PTR [rsp+0x20],0x1
0x0083ff0a: xor    r9d,r9d
0x0083ff0d: mov    r8d,0x1
0x0083ff13: lea    rdx,[rsp+0x40]
0x0083ff18: mov    rcx,r10
0x0083ff1b: call   0x14132e430
0x0083ff20: lea    rdx,[rsp+0x40]
0x0083ff25: cmp    QWORD PTR [rsp+0x58],0xf
0x0083ff2b: cmova  rdx,QWORD PTR [rsp+0x40]
0x0083ff31: mov    r8,QWORD PTR [rsp+0x50]
0x0083ff36: mov    rcx,rdi
0x0083ff39: call   0x14006fa10
0x0083ff3e: nop
0x0083ff3f: mov    rdx,QWORD PTR [rsp+0x58]
0x0083ff44: cmp    rdx,0xf
0x0083ff48: jbe    0x14083ffa5
0x0083ff4a: inc    rdx
0x0083ff4d: mov    rcx,QWORD PTR [rsp+0x40]
0x0083ff52: mov    rax,rcx
0x0083ff55: cmp    rdx,0x1000
0x0083ff5c: jb     0x14083ff7a
0x0083ff5e: add    rdx,0x27
0x0083ff62: mov    rcx,QWORD PTR [rcx-0x8]
0x0083ff66: sub    rax,rcx
0x0083ff69: add    rax,0xfffffffffffffff8
0x0083ff6d: cmp    rax,0x1f
0x0083ff71: jbe    0x14083ff7a
0x0083ff73: call   QWORD PTR [rip+0xda5baf]        # 0x1415e5b28
0x0083ff79: int3
0x0083ff7a: call   0x141539680
0x0083ff7f: jmp    0x14083ffa5
0x0083ff81: mov    r8d,0x8
0x0083ff87: lea    rdx,[rip+0xe2301a]        # 0x141662fa8 ; literal="creature"
0x0083ff8e: jmp    0x14083ff9d
0x0083ff90: mov    r8d,0x9
0x0083ff96: lea    rdx,[rip+0xe3091b]        # 0x1416708b8 ; literal="creatures"
0x0083ff9d: mov    rcx,rdi
0x0083ffa0: call   0x14006fa10
0x0083ffa5: mov    eax,0xffff8ad0
0x0083ffaa: cmp    WORD PTR [rbx+0x16],ax
0x0083ffae: je     0x140840008
0x0083ffb0: mov    r8d,0x2
0x0083ffb6: lea    rdx,[rip+0xdd5583]        # 0x141615540 ; literal=" ("
0x0083ffbd: mov    rcx,rdi
0x0083ffc0: call   0x14006fa10
0x0083ffc5: mov    QWORD PTR [rsp+0x30],rdi
0x0083ffca: movzx  eax,WORD PTR [rbx+0x14]
0x0083ffce: mov    WORD PTR [rsp+0x28],ax
0x0083ffd3: movzx  eax,WORD PTR [rbx+0x12]
0x0083ffd7: mov    WORD PTR [rsp+0x20],ax
0x0083ffdc: movzx  r9d,WORD PTR [rbx+0x10]
0x0083ffe1: movzx  r8d,WORD PTR [rbx+0x1a]
0x0083ffe6: movzx  edx,WORD PTR [rbx+0x18]
0x0083ffea: movzx  ecx,WORD PTR [rbx+0x16]
0x0083ffee: call   0x14074f220
0x0083fff3: mov    r8d,0x1
0x0083fff9: lea    rdx,[rip+0xdd5580]        # 0x141615580 ; literal=")"
0x00840000: mov    rcx,rdi
0x00840003: call   0x14006fa10
0x00840008: mov    rcx,QWORD PTR [rsp+0x60]
0x0084000d: xor    rcx,rsp
0x00840010: call   0x141539660
0x00840015: lea    r11,[rsp+0x70]
0x0084001a: mov    rbx,QWORD PTR [r11+0x10]
0x0084001e: mov    rsi,QWORD PTR [r11+0x20]
0x00840022: mov    rsp,r11
0x00840025: pop    rdi
0x00840026: ret

# steam PE:6a70a6d9:02711000; adventure_movement_combat_menu_creaturest+8; RVA 0x840030..0x84021a
0x00840030: mov    QWORD PTR [rsp+0x8],rbx
0x00840035: mov    QWORD PTR [rsp+0x18],rsi
0x0084003a: push   rdi
0x0084003b: sub    rsp,0x70
0x0084003f: mov    rax,QWORD PTR [rip+0x105bffa]        # 0x14189c040
0x00840046: xor    rax,rsp
0x00840049: mov    QWORD PTR [rsp+0x60],rax
0x0084004e: mov    rdi,rdx
0x00840051: mov    rbx,rcx
0x00840054: cmp    DWORD PTR [rcx+0x20],0xffffffff
0x00840058: mov    rcx,rdx
0x0084005b: jne    0x140840074
0x0084005d: mov    r8d,0xc
0x00840063: lea    rdx,[rip+0xe70ba6]        # 0x1416b0c10 ; literal="Combat error"
0x0084006a: call   0x14006f8d0
0x0084006f: jmp    0x1408401fb
0x00840074: mov    r8d,0x7
0x0084007a: lea    rdx,[rip+0xe70bb7]        # 0x1416b0c38 ; literal="Combat "
0x00840081: call   0x14006f8d0
0x00840086: mov    r11d,DWORD PTR [rbx+0x20]
0x0084008a: mov    r9,QWORD PTR [rip+0x1ba5027]        # 0x1423e50b8
0x00840091: mov    rsi,QWORD PTR [rip+0x1ba5018]        # 0x1423e50b0
0x00840098: sub    r9,rsi
0x0084009b: sar    r9,0x3
0x0084009f: test   r9d,r9d
0x008400a2: je     0x1408400dc
0x008400a4: cmp    r11d,0xffffffff
0x008400a8: je     0x1408400dc
0x008400aa: xor    edx,edx
0x008400ac: sub    r9d,0x1
0x008400b0: js     0x1408400dc
0x008400b2: lea    ecx,[rdx+r9*1]
0x008400b6: sar    ecx,1
0x008400b8: movsxd rax,ecx
0x008400bb: mov    r10,QWORD PTR [rsi+rax*8]
0x008400bf: cmp    DWORD PTR [r10+0x130],r11d
0x008400c6: je     0x1408400df
0x008400c8: lea    eax,[rcx+0x1]
0x008400cb: cmovle edx,eax
0x008400ce: lea    eax,[rcx-0x1]
0x008400d1: cmovle eax,r9d
0x008400d5: mov    r9d,eax
0x008400d8: cmp    edx,eax
0x008400da: jle    0x1408400b2
0x008400dc: xor    r10d,r10d
0x008400df: test   r10,r10
0x008400e2: je     0x140840183
0x008400e8: xorps  xmm0,xmm0
0x008400eb: movups XMMWORD PTR [rsp+0x40],xmm0
0x008400f0: mov    QWORD PTR [rsp+0x50],0x0
0x008400f9: mov    QWORD PTR [rsp+0x58],0xf
0x00840102: mov    BYTE PTR [rsp+0x40],0x0
0x00840107: mov    BYTE PTR [rsp+0x20],0x1
0x0084010c: xor    r9d,r9d
0x0084010f: mov    r8d,0x1
0x00840115: lea    rdx,[rsp+0x40]
0x0084011a: mov    rcx,r10
0x0084011d: call   0x14132e430
0x00840122: lea    rdx,[rsp+0x40]
0x00840127: cmp    QWORD PTR [rsp+0x58],0xf
0x0084012d: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840133: mov    r8,QWORD PTR [rsp+0x50]
0x00840138: mov    rcx,rdi
0x0084013b: call   0x14006fa10
0x00840140: nop
0x00840141: mov    rdx,QWORD PTR [rsp+0x58]
0x00840146: cmp    rdx,0xf
0x0084014a: jbe    0x140840198
0x0084014c: inc    rdx
0x0084014f: mov    rcx,QWORD PTR [rsp+0x40]
0x00840154: mov    rax,rcx
0x00840157: cmp    rdx,0x1000
0x0084015e: jb     0x14084017c
0x00840160: add    rdx,0x27
0x00840164: mov    rcx,QWORD PTR [rcx-0x8]
0x00840168: sub    rax,rcx
0x0084016b: add    rax,0xfffffffffffffff8
0x0084016f: cmp    rax,0x1f
0x00840173: jbe    0x14084017c
0x00840175: call   QWORD PTR [rip+0xda59ad]        # 0x1415e5b28
0x0084017b: int3
0x0084017c: call   0x141539680
0x00840181: jmp    0x140840198
0x00840183: mov    r8d,0x8
0x00840189: lea    rdx,[rip+0xe22e18]        # 0x141662fa8 ; literal="creature"
0x00840190: mov    rcx,rdi
0x00840193: call   0x14006fa10
0x00840198: mov    eax,0xffff8ad0
0x0084019d: cmp    WORD PTR [rbx+0x16],ax
0x008401a1: je     0x1408401fb
0x008401a3: mov    r8d,0x2
0x008401a9: lea    rdx,[rip+0xdd5390]        # 0x141615540 ; literal=" ("
0x008401b0: mov    rcx,rdi
0x008401b3: call   0x14006fa10
0x008401b8: mov    QWORD PTR [rsp+0x30],rdi
0x008401bd: movzx  eax,WORD PTR [rbx+0x14]
0x008401c1: mov    WORD PTR [rsp+0x28],ax
0x008401c6: movzx  eax,WORD PTR [rbx+0x12]
0x008401ca: mov    WORD PTR [rsp+0x20],ax
0x008401cf: movzx  r9d,WORD PTR [rbx+0x10]
0x008401d4: movzx  r8d,WORD PTR [rbx+0x1a]
0x008401d9: movzx  edx,WORD PTR [rbx+0x18]
0x008401dd: movzx  ecx,WORD PTR [rbx+0x16]
0x008401e1: call   0x14074f220
0x008401e6: mov    r8d,0x1
0x008401ec: lea    rdx,[rip+0xdd538d]        # 0x141615580 ; literal=")"
0x008401f3: mov    rcx,rdi
0x008401f6: call   0x14006fa10
0x008401fb: mov    rcx,QWORD PTR [rsp+0x60]
0x00840200: xor    rcx,rsp
0x00840203: call   0x141539660
0x00840208: lea    r11,[rsp+0x70]
0x0084020d: mov    rbx,QWORD PTR [r11+0x10]
0x00840211: mov    rsi,QWORD PTR [r11+0x20]
0x00840215: mov    rsp,r11
0x00840218: pop    rdi
0x00840219: ret

# steam PE:6a70a6d9:02711000; adventure_movement_item_interact_pushst+8; RVA 0x840220..0x8403db
0x00840220: mov    QWORD PTR [rsp+0x8],rbx
0x00840225: mov    QWORD PTR [rsp+0x18],rsi
0x0084022a: push   rdi
0x0084022b: sub    rsp,0x70
0x0084022f: mov    rax,QWORD PTR [rip+0x105be0a]        # 0x14189c040
0x00840236: xor    rax,rsp
0x00840239: mov    QWORD PTR [rsp+0x60],rax
0x0084023e: mov    rsi,rdx
0x00840241: mov    rbx,rcx
0x00840244: mov    r8d,0x5
0x0084024a: lea    rdx,[rip+0xe709df]        # 0x1416b0c30 ; literal="Push "
0x00840251: mov    rcx,rsi
0x00840254: call   0x14006f8d0
0x00840259: mov    r11d,DWORD PTR [rbx+0x20]
0x0084025d: mov    r9,QWORD PTR [rip+0x1ba51f4]        # 0x1423e5458
0x00840264: mov    rdi,QWORD PTR [rip+0x1ba51e5]        # 0x1423e5450
0x0084026b: sub    r9,rdi
0x0084026e: sar    r9,0x3
0x00840272: test   r9d,r9d
0x00840275: je     0x1408402b7
0x00840277: cmp    r11d,0xffffffff
0x0084027b: je     0x1408402b7
0x0084027d: xor    edx,edx
0x0084027f: sub    r9d,0x1
0x00840283: js     0x1408402b7
0x00840285: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00840290: lea    ecx,[rdx+r9*1]
0x00840294: sar    ecx,1
0x00840296: movsxd rax,ecx
0x00840299: mov    r10,QWORD PTR [rdi+rax*8]
0x0084029d: cmp    DWORD PTR [r10+0x1c],r11d
0x008402a1: je     0x1408402ba
0x008402a3: lea    eax,[rcx+0x1]
0x008402a6: cmovle edx,eax
0x008402a9: lea    eax,[rcx-0x1]
0x008402ac: cmovle eax,r9d
0x008402b0: mov    r9d,eax
0x008402b3: cmp    edx,eax
0x008402b5: jle    0x140840290
0x008402b7: xor    r10d,r10d
0x008402ba: test   r10,r10
0x008402bd: je     0x140840359
0x008402c3: xorps  xmm0,xmm0
0x008402c6: movups XMMWORD PTR [rsp+0x40],xmm0
0x008402cb: mov    QWORD PTR [rsp+0x50],0x0
0x008402d4: mov    QWORD PTR [rsp+0x58],0xf
0x008402dd: mov    BYTE PTR [rsp+0x40],0x0
0x008402e2: mov    r9d,0xffffffff
0x008402e8: xor    r8d,r8d
0x008402eb: lea    rdx,[rsp+0x40]
0x008402f0: mov    rcx,r10
0x008402f3: call   0x140c65450
0x008402f8: lea    rdx,[rsp+0x40]
0x008402fd: cmp    QWORD PTR [rsp+0x58],0xf
0x00840303: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840309: mov    r8,QWORD PTR [rsp+0x50]
0x0084030e: mov    rcx,rsi
0x00840311: call   0x14006fa10
0x00840316: nop
0x00840317: mov    rdx,QWORD PTR [rsp+0x58]
0x0084031c: cmp    rdx,0xf
0x00840320: jbe    0x14084036e
0x00840322: inc    rdx
0x00840325: mov    rcx,QWORD PTR [rsp+0x40]
0x0084032a: mov    rax,rcx
0x0084032d: cmp    rdx,0x1000
0x00840334: jb     0x140840352
0x00840336: add    rdx,0x27
0x0084033a: mov    rcx,QWORD PTR [rcx-0x8]
0x0084033e: sub    rax,rcx
0x00840341: add    rax,0xfffffffffffffff8
0x00840345: cmp    rax,0x1f
0x00840349: jbe    0x140840352
0x0084034b: call   QWORD PTR [rip+0xda57d7]        # 0x1415e5b28
0x00840351: int3
0x00840352: call   0x141539680
0x00840357: jmp    0x14084036e
0x00840359: mov    r8d,0x4
0x0084035f: lea    rdx,[rip+0xdbcc7a]        # 0x1415fcfe0 ; literal="item"
0x00840366: mov    rcx,rsi
0x00840369: call   0x14006fa10
0x0084036e: mov    eax,0xffff8ad0
0x00840373: cmp    WORD PTR [rbx+0x16],ax
0x00840377: je     0x1408403bc
0x00840379: mov    r8d,0x4
0x0084037f: lea    rdx,[rip+0xdad22e]        # 0x1415ed5b4 ; literal=" to "
0x00840386: mov    rcx,rsi
0x00840389: call   0x14006fa10
0x0084038e: mov    QWORD PTR [rsp+0x30],rsi
0x00840393: movzx  eax,WORD PTR [rbx+0x14]
0x00840397: mov    WORD PTR [rsp+0x28],ax
0x0084039c: movzx  eax,WORD PTR [rbx+0x12]
0x008403a0: mov    WORD PTR [rsp+0x20],ax
0x008403a5: movzx  r9d,WORD PTR [rbx+0x10]
0x008403aa: movzx  r8d,WORD PTR [rbx+0x1a]
0x008403af: movzx  edx,WORD PTR [rbx+0x18]
0x008403b3: movzx  ecx,WORD PTR [rbx+0x16]
0x008403b7: call   0x14074f220
0x008403bc: mov    rcx,QWORD PTR [rsp+0x60]
0x008403c1: xor    rcx,rsp
0x008403c4: call   0x141539660
0x008403c9: lea    r11,[rsp+0x70]
0x008403ce: mov    rbx,QWORD PTR [r11+0x10]
0x008403d2: mov    rsi,QWORD PTR [r11+0x20]
0x008403d6: mov    rsp,r11
0x008403d9: pop    rdi
0x008403da: ret

# steam PE:6a70a6d9:02711000; adventure_movement_item_interact_ridest+8; RVA 0x8403e0..0x84059b
0x008403e0: mov    QWORD PTR [rsp+0x8],rbx
0x008403e5: mov    QWORD PTR [rsp+0x18],rsi
0x008403ea: push   rdi
0x008403eb: sub    rsp,0x70
0x008403ef: mov    rax,QWORD PTR [rip+0x105bc4a]        # 0x14189c040
0x008403f6: xor    rax,rsp
0x008403f9: mov    QWORD PTR [rsp+0x60],rax
0x008403fe: mov    rsi,rdx
0x00840401: mov    rbx,rcx
0x00840404: mov    r8d,0x5
0x0084040a: lea    rdx,[rip+0xe70903]        # 0x1416b0d14 ; literal="Ride "
0x00840411: mov    rcx,rsi
0x00840414: call   0x14006f8d0
0x00840419: mov    r11d,DWORD PTR [rbx+0x20]
0x0084041d: mov    r9,QWORD PTR [rip+0x1ba5034]        # 0x1423e5458
0x00840424: mov    rdi,QWORD PTR [rip+0x1ba5025]        # 0x1423e5450
0x0084042b: sub    r9,rdi
0x0084042e: sar    r9,0x3
0x00840432: test   r9d,r9d
0x00840435: je     0x140840477
0x00840437: cmp    r11d,0xffffffff
0x0084043b: je     0x140840477
0x0084043d: xor    edx,edx
0x0084043f: sub    r9d,0x1
0x00840443: js     0x140840477
0x00840445: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00840450: lea    ecx,[rdx+r9*1]
0x00840454: sar    ecx,1
0x00840456: movsxd rax,ecx
0x00840459: mov    r10,QWORD PTR [rdi+rax*8]
0x0084045d: cmp    DWORD PTR [r10+0x1c],r11d
0x00840461: je     0x14084047a
0x00840463: lea    eax,[rcx+0x1]
0x00840466: cmovle edx,eax
0x00840469: lea    eax,[rcx-0x1]
0x0084046c: cmovle eax,r9d
0x00840470: mov    r9d,eax
0x00840473: cmp    edx,eax
0x00840475: jle    0x140840450
0x00840477: xor    r10d,r10d
0x0084047a: test   r10,r10
0x0084047d: je     0x140840519
0x00840483: xorps  xmm0,xmm0
0x00840486: movups XMMWORD PTR [rsp+0x40],xmm0
0x0084048b: mov    QWORD PTR [rsp+0x50],0x0
0x00840494: mov    QWORD PTR [rsp+0x58],0xf
0x0084049d: mov    BYTE PTR [rsp+0x40],0x0
0x008404a2: mov    r9d,0xffffffff
0x008404a8: xor    r8d,r8d
0x008404ab: lea    rdx,[rsp+0x40]
0x008404b0: mov    rcx,r10
0x008404b3: call   0x140c65450
0x008404b8: lea    rdx,[rsp+0x40]
0x008404bd: cmp    QWORD PTR [rsp+0x58],0xf
0x008404c3: cmova  rdx,QWORD PTR [rsp+0x40]
0x008404c9: mov    r8,QWORD PTR [rsp+0x50]
0x008404ce: mov    rcx,rsi
0x008404d1: call   0x14006fa10
0x008404d6: nop
0x008404d7: mov    rdx,QWORD PTR [rsp+0x58]
0x008404dc: cmp    rdx,0xf
0x008404e0: jbe    0x14084052e
0x008404e2: inc    rdx
0x008404e5: mov    rcx,QWORD PTR [rsp+0x40]
0x008404ea: mov    rax,rcx
0x008404ed: cmp    rdx,0x1000
0x008404f4: jb     0x140840512
0x008404f6: add    rdx,0x27
0x008404fa: mov    rcx,QWORD PTR [rcx-0x8]
0x008404fe: sub    rax,rcx
0x00840501: add    rax,0xfffffffffffffff8
0x00840505: cmp    rax,0x1f
0x00840509: jbe    0x140840512
0x0084050b: call   QWORD PTR [rip+0xda5617]        # 0x1415e5b28
0x00840511: int3
0x00840512: call   0x141539680
0x00840517: jmp    0x14084052e
0x00840519: mov    r8d,0x4
0x0084051f: lea    rdx,[rip+0xdbcaba]        # 0x1415fcfe0 ; literal="item"
0x00840526: mov    rcx,rsi
0x00840529: call   0x14006fa10
0x0084052e: mov    eax,0xffff8ad0
0x00840533: cmp    WORD PTR [rbx+0x16],ax
0x00840537: je     0x14084057c
0x00840539: mov    r8d,0x12
0x0084053f: lea    rdx,[rip+0xe707ba]        # 0x1416b0d00 ; literal=", push off toward "
0x00840546: mov    rcx,rsi
0x00840549: call   0x14006fa10
0x0084054e: mov    QWORD PTR [rsp+0x30],rsi
0x00840553: movzx  eax,WORD PTR [rbx+0x14]
0x00840557: mov    WORD PTR [rsp+0x28],ax
0x0084055c: movzx  eax,WORD PTR [rbx+0x12]
0x00840560: mov    WORD PTR [rsp+0x20],ax
0x00840565: movzx  r9d,WORD PTR [rbx+0x10]
0x0084056a: movzx  r8d,WORD PTR [rbx+0x1a]
0x0084056f: movzx  edx,WORD PTR [rbx+0x18]
0x00840573: movzx  ecx,WORD PTR [rbx+0x16]
0x00840577: call   0x14074f220
0x0084057c: mov    rcx,QWORD PTR [rsp+0x60]
0x00840581: xor    rcx,rsp
0x00840584: call   0x141539660
0x00840589: lea    r11,[rsp+0x70]
0x0084058e: mov    rbx,QWORD PTR [r11+0x10]
0x00840592: mov    rsi,QWORD PTR [r11+0x20]
0x00840596: mov    rsp,r11
0x00840599: pop    rdi
0x0084059a: ret

# steam PE:6a70a6d9:02711000; adventure_movement_item_interact_guidest+8; RVA 0x8405a0..0x84075b
0x008405a0: mov    QWORD PTR [rsp+0x8],rbx
0x008405a5: mov    QWORD PTR [rsp+0x18],rsi
0x008405aa: push   rdi
0x008405ab: sub    rsp,0x70
0x008405af: mov    rax,QWORD PTR [rip+0x105ba8a]        # 0x14189c040
0x008405b6: xor    rax,rsp
0x008405b9: mov    QWORD PTR [rsp+0x60],rax
0x008405be: mov    rsi,rdx
0x008405c1: mov    rbx,rcx
0x008405c4: mov    r8d,0x6
0x008405ca: lea    rdx,[rip+0xe70753]        # 0x1416b0d24 ; literal="Guide "
0x008405d1: mov    rcx,rsi
0x008405d4: call   0x14006f8d0
0x008405d9: mov    r11d,DWORD PTR [rbx+0x20]
0x008405dd: mov    r9,QWORD PTR [rip+0x1ba4e74]        # 0x1423e5458
0x008405e4: mov    rdi,QWORD PTR [rip+0x1ba4e65]        # 0x1423e5450
0x008405eb: sub    r9,rdi
0x008405ee: sar    r9,0x3
0x008405f2: test   r9d,r9d
0x008405f5: je     0x140840637
0x008405f7: cmp    r11d,0xffffffff
0x008405fb: je     0x140840637
0x008405fd: xor    edx,edx
0x008405ff: sub    r9d,0x1
0x00840603: js     0x140840637
0x00840605: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00840610: lea    ecx,[rdx+r9*1]
0x00840614: sar    ecx,1
0x00840616: movsxd rax,ecx
0x00840619: mov    r10,QWORD PTR [rdi+rax*8]
0x0084061d: cmp    DWORD PTR [r10+0x1c],r11d
0x00840621: je     0x14084063a
0x00840623: lea    eax,[rcx+0x1]
0x00840626: cmovle edx,eax
0x00840629: lea    eax,[rcx-0x1]
0x0084062c: cmovle eax,r9d
0x00840630: mov    r9d,eax
0x00840633: cmp    edx,eax
0x00840635: jle    0x140840610
0x00840637: xor    r10d,r10d
0x0084063a: test   r10,r10
0x0084063d: je     0x1408406d9
0x00840643: xorps  xmm0,xmm0
0x00840646: movups XMMWORD PTR [rsp+0x40],xmm0
0x0084064b: mov    QWORD PTR [rsp+0x50],0x0
0x00840654: mov    QWORD PTR [rsp+0x58],0xf
0x0084065d: mov    BYTE PTR [rsp+0x40],0x0
0x00840662: mov    r9d,0xffffffff
0x00840668: xor    r8d,r8d
0x0084066b: lea    rdx,[rsp+0x40]
0x00840670: mov    rcx,r10
0x00840673: call   0x140c65450
0x00840678: lea    rdx,[rsp+0x40]
0x0084067d: cmp    QWORD PTR [rsp+0x58],0xf
0x00840683: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840689: mov    r8,QWORD PTR [rsp+0x50]
0x0084068e: mov    rcx,rsi
0x00840691: call   0x14006fa10
0x00840696: nop
0x00840697: mov    rdx,QWORD PTR [rsp+0x58]
0x0084069c: cmp    rdx,0xf
0x008406a0: jbe    0x1408406ee
0x008406a2: inc    rdx
0x008406a5: mov    rcx,QWORD PTR [rsp+0x40]
0x008406aa: mov    rax,rcx
0x008406ad: cmp    rdx,0x1000
0x008406b4: jb     0x1408406d2
0x008406b6: add    rdx,0x27
0x008406ba: mov    rcx,QWORD PTR [rcx-0x8]
0x008406be: sub    rax,rcx
0x008406c1: add    rax,0xfffffffffffffff8
0x008406c5: cmp    rax,0x1f
0x008406c9: jbe    0x1408406d2
0x008406cb: call   QWORD PTR [rip+0xda5457]        # 0x1415e5b28
0x008406d1: int3
0x008406d2: call   0x141539680
0x008406d7: jmp    0x1408406ee
0x008406d9: mov    r8d,0x4
0x008406df: lea    rdx,[rip+0xdbc8fa]        # 0x1415fcfe0 ; literal="item"
0x008406e6: mov    rcx,rsi
0x008406e9: call   0x14006fa10
0x008406ee: mov    eax,0xffff8ad0
0x008406f3: cmp    WORD PTR [rbx+0x16],ax
0x008406f7: je     0x14084073c
0x008406f9: mov    r8d,0x4
0x008406ff: lea    rdx,[rip+0xdaceae]        # 0x1415ed5b4 ; literal=" to "
0x00840706: mov    rcx,rsi
0x00840709: call   0x14006fa10
0x0084070e: mov    QWORD PTR [rsp+0x30],rsi
0x00840713: movzx  eax,WORD PTR [rbx+0x14]
0x00840717: mov    WORD PTR [rsp+0x28],ax
0x0084071c: movzx  eax,WORD PTR [rbx+0x12]
0x00840720: mov    WORD PTR [rsp+0x20],ax
0x00840725: movzx  r9d,WORD PTR [rbx+0x10]
0x0084072a: movzx  r8d,WORD PTR [rbx+0x1a]
0x0084072f: movzx  edx,WORD PTR [rbx+0x18]
0x00840733: movzx  ecx,WORD PTR [rbx+0x16]
0x00840737: call   0x14074f220
0x0084073c: mov    rcx,QWORD PTR [rsp+0x60]
0x00840741: xor    rcx,rsp
0x00840744: call   0x141539660
0x00840749: lea    r11,[rsp+0x70]
0x0084074e: mov    rbx,QWORD PTR [r11+0x10]
0x00840752: mov    rsi,QWORD PTR [r11+0x20]
0x00840756: mov    rsp,r11
0x00840759: pop    rdi
0x0084075a: ret

# steam PE:6a70a6d9:02711000; adventure_movement_building_interact_raise_well_bucketst+8; RVA 0x840760..0x840940
0x00840760: mov    QWORD PTR [rsp+0x8],rbx
0x00840765: mov    QWORD PTR [rsp+0x18],rsi
0x0084076a: push   rdi
0x0084076b: sub    rsp,0x70
0x0084076f: mov    rax,QWORD PTR [rip+0x105b8ca]        # 0x14189c040
0x00840776: xor    rax,rsp
0x00840779: mov    QWORD PTR [rsp+0x60],rax
0x0084077e: mov    rbx,rdx
0x00840781: mov    rdi,rcx
0x00840784: mov    r8d,0x6
0x0084078a: lea    rdx,[rip+0xe7058b]        # 0x1416b0d1c ; literal="Raise "
0x00840791: mov    rcx,rbx
0x00840794: call   0x14006f8d0
0x00840799: mov    r11d,DWORD PTR [rdi+0x20]
0x0084079d: mov    r10,QWORD PTR [rip+0x1bad774]        # 0x1423edf18
0x008407a4: mov    rsi,QWORD PTR [rip+0x1bad765]        # 0x1423edf10
0x008407ab: sub    r10,rsi
0x008407ae: sar    r10,0x3
0x008407b2: test   r10,r10
0x008407b5: je     0x1408407f7
0x008407b7: cmp    r11d,0xffffffff
0x008407bb: je     0x1408407f7
0x008407bd: xor    edx,edx
0x008407bf: sub    r10d,0x1
0x008407c3: js     0x1408407f7
0x008407c5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x008407d0: lea    ecx,[rdx+r10*1]
0x008407d4: sar    ecx,1
0x008407d6: movsxd rax,ecx
0x008407d9: mov    r8,QWORD PTR [rsi+rax*8]
0x008407dd: cmp    DWORD PTR [r8+0x50],r11d
0x008407e1: je     0x1408407fa
0x008407e3: lea    eax,[rcx+0x1]
0x008407e6: cmovle edx,eax
0x008407e9: lea    eax,[rcx-0x1]
0x008407ec: cmovle eax,r10d
0x008407f0: mov    r10d,eax
0x008407f3: cmp    edx,eax
0x008407f5: jle    0x1408407d0
0x008407f7: xor    r8d,r8d
0x008407fa: test   r8,r8
0x008407fd: je     0x140840894
0x00840803: xorps  xmm0,xmm0
0x00840806: movups XMMWORD PTR [rsp+0x40],xmm0
0x0084080b: mov    QWORD PTR [rsp+0x50],0x0
0x00840814: mov    QWORD PTR [rsp+0x58],0xf
0x0084081d: mov    BYTE PTR [rsp+0x40],0x0
0x00840822: mov    rax,QWORD PTR [r8]
0x00840825: lea    rdx,[rsp+0x40]
0x0084082a: mov    rcx,r8
0x0084082d: call   QWORD PTR [rax+0x188]
0x00840833: lea    rdx,[rsp+0x40]
0x00840838: cmp    QWORD PTR [rsp+0x58],0xf
0x0084083e: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840844: mov    r8,QWORD PTR [rsp+0x50]
0x00840849: mov    rcx,rbx
0x0084084c: call   0x14006fa10
0x00840851: nop
0x00840852: mov    rdx,QWORD PTR [rsp+0x58]
0x00840857: cmp    rdx,0xf
0x0084085b: jbe    0x1408408a9
0x0084085d: inc    rdx
0x00840860: mov    rcx,QWORD PTR [rsp+0x40]
0x00840865: mov    rax,rcx
0x00840868: cmp    rdx,0x1000
0x0084086f: jb     0x14084088d
0x00840871: add    rdx,0x27
0x00840875: mov    rcx,QWORD PTR [rcx-0x8]
0x00840879: sub    rax,rcx
0x0084087c: add    rax,0xfffffffffffffff8
0x00840880: cmp    rax,0x1f
0x00840884: jbe    0x14084088d
0x00840886: call   QWORD PTR [rip+0xda529c]        # 0x1415e5b28
0x0084088c: int3
0x0084088d: call   0x141539680
0x00840892: jmp    0x1408408a9
0x00840894: mov    r8d,0x8
0x0084089a: lea    rdx,[rip+0xdaac5f]        # 0x1415eb500 ; literal="building"
0x008408a1: mov    rcx,rbx
0x008408a4: call   0x14006fa10
0x008408a9: mov    r8d,0x7
0x008408af: lea    rdx,[rip+0xe7042a]        # 0x1416b0ce0 ; literal=" bucket"
0x008408b6: mov    rcx,rbx
0x008408b9: call   0x14006fa10
0x008408be: mov    eax,0xffff8ad0
0x008408c3: cmp    WORD PTR [rdi+0x16],ax
0x008408c7: je     0x140840921
0x008408c9: mov    r8d,0x2
0x008408cf: lea    rdx,[rip+0xdd4c6a]        # 0x141615540 ; literal=" ("
0x008408d6: mov    rcx,rbx
0x008408d9: call   0x14006fa10
0x008408de: mov    QWORD PTR [rsp+0x30],rbx
0x008408e3: movzx  eax,WORD PTR [rdi+0x14]
0x008408e7: mov    WORD PTR [rsp+0x28],ax
0x008408ec: movzx  eax,WORD PTR [rdi+0x12]
0x008408f0: mov    WORD PTR [rsp+0x20],ax
0x008408f5: movzx  r9d,WORD PTR [rdi+0x10]
0x008408fa: movzx  r8d,WORD PTR [rdi+0x1a]
0x008408ff: movzx  edx,WORD PTR [rdi+0x18]
0x00840903: movzx  ecx,WORD PTR [rdi+0x16]
0x00840907: call   0x14074f220
0x0084090c: mov    r8d,0x1
0x00840912: lea    rdx,[rip+0xdd4c67]        # 0x141615580 ; literal=")"
0x00840919: mov    rcx,rbx
0x0084091c: call   0x14006fa10
0x00840921: mov    rcx,QWORD PTR [rsp+0x60]
0x00840926: xor    rcx,rsp
0x00840929: call   0x141539660
0x0084092e: lea    r11,[rsp+0x70]
0x00840933: mov    rbx,QWORD PTR [r11+0x10]
0x00840937: mov    rsi,QWORD PTR [r11+0x20]
0x0084093b: mov    rsp,r11
0x0084093e: pop    rdi
0x0084093f: ret

# steam PE:6a70a6d9:02711000; adventure_movement_building_interact_lower_well_bucketst+8; RVA 0x840940..0x840b20
0x00840940: mov    QWORD PTR [rsp+0x8],rbx
0x00840945: mov    QWORD PTR [rsp+0x18],rsi
0x0084094a: push   rdi
0x0084094b: sub    rsp,0x70
0x0084094f: mov    rax,QWORD PTR [rip+0x105b6ea]        # 0x14189c040
0x00840956: xor    rax,rsp
0x00840959: mov    QWORD PTR [rsp+0x60],rax
0x0084095e: mov    rbx,rdx
0x00840961: mov    rdi,rcx
0x00840964: mov    r8d,0x6
0x0084096a: lea    rdx,[rip+0xe70363]        # 0x1416b0cd4 ; literal="Lower "
0x00840971: mov    rcx,rbx
0x00840974: call   0x14006f8d0
0x00840979: mov    r11d,DWORD PTR [rdi+0x20]
0x0084097d: mov    r10,QWORD PTR [rip+0x1bad594]        # 0x1423edf18
0x00840984: mov    rsi,QWORD PTR [rip+0x1bad585]        # 0x1423edf10
0x0084098b: sub    r10,rsi
0x0084098e: sar    r10,0x3
0x00840992: test   r10,r10
0x00840995: je     0x1408409d7
0x00840997: cmp    r11d,0xffffffff
0x0084099b: je     0x1408409d7
0x0084099d: xor    edx,edx
0x0084099f: sub    r10d,0x1
0x008409a3: js     0x1408409d7
0x008409a5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x008409b0: lea    ecx,[rdx+r10*1]
0x008409b4: sar    ecx,1
0x008409b6: movsxd rax,ecx
0x008409b9: mov    r8,QWORD PTR [rsi+rax*8]
0x008409bd: cmp    DWORD PTR [r8+0x50],r11d
0x008409c1: je     0x1408409da
0x008409c3: lea    eax,[rcx+0x1]
0x008409c6: cmovle edx,eax
0x008409c9: lea    eax,[rcx-0x1]
0x008409cc: cmovle eax,r10d
0x008409d0: mov    r10d,eax
0x008409d3: cmp    edx,eax
0x008409d5: jle    0x1408409b0
0x008409d7: xor    r8d,r8d
0x008409da: test   r8,r8
0x008409dd: je     0x140840a74
0x008409e3: xorps  xmm0,xmm0
0x008409e6: movups XMMWORD PTR [rsp+0x40],xmm0
0x008409eb: mov    QWORD PTR [rsp+0x50],0x0
0x008409f4: mov    QWORD PTR [rsp+0x58],0xf
0x008409fd: mov    BYTE PTR [rsp+0x40],0x0
0x00840a02: mov    rax,QWORD PTR [r8]
0x00840a05: lea    rdx,[rsp+0x40]
0x00840a0a: mov    rcx,r8
0x00840a0d: call   QWORD PTR [rax+0x188]
0x00840a13: lea    rdx,[rsp+0x40]
0x00840a18: cmp    QWORD PTR [rsp+0x58],0xf
0x00840a1e: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840a24: mov    r8,QWORD PTR [rsp+0x50]
0x00840a29: mov    rcx,rbx
0x00840a2c: call   0x14006fa10
0x00840a31: nop
0x00840a32: mov    rdx,QWORD PTR [rsp+0x58]
0x00840a37: cmp    rdx,0xf
0x00840a3b: jbe    0x140840a89
0x00840a3d: inc    rdx
0x00840a40: mov    rcx,QWORD PTR [rsp+0x40]
0x00840a45: mov    rax,rcx
0x00840a48: cmp    rdx,0x1000
0x00840a4f: jb     0x140840a6d
0x00840a51: add    rdx,0x27
0x00840a55: mov    rcx,QWORD PTR [rcx-0x8]
0x00840a59: sub    rax,rcx
0x00840a5c: add    rax,0xfffffffffffffff8
0x00840a60: cmp    rax,0x1f
0x00840a64: jbe    0x140840a6d
0x00840a66: call   QWORD PTR [rip+0xda50bc]        # 0x1415e5b28
0x00840a6c: int3
0x00840a6d: call   0x141539680
0x00840a72: jmp    0x140840a89
0x00840a74: mov    r8d,0x8
0x00840a7a: lea    rdx,[rip+0xdaaa7f]        # 0x1415eb500 ; literal="building"
0x00840a81: mov    rcx,rbx
0x00840a84: call   0x14006fa10
0x00840a89: mov    r8d,0x7
0x00840a8f: lea    rdx,[rip+0xe7024a]        # 0x1416b0ce0 ; literal=" bucket"
0x00840a96: mov    rcx,rbx
0x00840a99: call   0x14006fa10
0x00840a9e: mov    eax,0xffff8ad0
0x00840aa3: cmp    WORD PTR [rdi+0x16],ax
0x00840aa7: je     0x140840b01
0x00840aa9: mov    r8d,0x2
0x00840aaf: lea    rdx,[rip+0xdd4a8a]        # 0x141615540 ; literal=" ("
0x00840ab6: mov    rcx,rbx
0x00840ab9: call   0x14006fa10
0x00840abe: mov    QWORD PTR [rsp+0x30],rbx
0x00840ac3: movzx  eax,WORD PTR [rdi+0x14]
0x00840ac7: mov    WORD PTR [rsp+0x28],ax
0x00840acc: movzx  eax,WORD PTR [rdi+0x12]
0x00840ad0: mov    WORD PTR [rsp+0x20],ax
0x00840ad5: movzx  r9d,WORD PTR [rdi+0x10]
0x00840ada: movzx  r8d,WORD PTR [rdi+0x1a]
0x00840adf: movzx  edx,WORD PTR [rdi+0x18]
0x00840ae3: movzx  ecx,WORD PTR [rdi+0x16]
0x00840ae7: call   0x14074f220
0x00840aec: mov    r8d,0x1
0x00840af2: lea    rdx,[rip+0xdd4a87]        # 0x141615580 ; literal=")"
0x00840af9: mov    rcx,rbx
0x00840afc: call   0x14006fa10
0x00840b01: mov    rcx,QWORD PTR [rsp+0x60]
0x00840b06: xor    rcx,rsp
0x00840b09: call   0x141539660
0x00840b0e: lea    r11,[rsp+0x70]
0x00840b13: mov    rbx,QWORD PTR [r11+0x10]
0x00840b17: mov    rsi,QWORD PTR [r11+0x20]
0x00840b1b: mov    rsp,r11
0x00840b1e: pop    rdi
0x00840b1f: ret

# steam PE:6a70a6d9:02711000; adventure_movement_building_interact_pull_leverst+8; RVA 0x840b20..0x840ceb
0x00840b20: mov    QWORD PTR [rsp+0x8],rbx
0x00840b25: mov    QWORD PTR [rsp+0x18],rsi
0x00840b2a: push   rdi
0x00840b2b: sub    rsp,0x70
0x00840b2f: mov    rax,QWORD PTR [rip+0x105b50a]        # 0x14189c040
0x00840b36: xor    rax,rsp
0x00840b39: mov    QWORD PTR [rsp+0x60],rax
0x00840b3e: mov    rsi,rdx
0x00840b41: mov    rbx,rcx
0x00840b44: mov    r8d,0x5
0x00840b4a: lea    rdx,[rip+0xe701a3]        # 0x1416b0cf4 ; literal="Pull "
0x00840b51: mov    rcx,rsi
0x00840b54: call   0x14006f8d0
0x00840b59: mov    r11d,DWORD PTR [rbx+0x20]
0x00840b5d: mov    r10,QWORD PTR [rip+0x1bad3b4]        # 0x1423edf18
0x00840b64: mov    rdi,QWORD PTR [rip+0x1bad3a5]        # 0x1423edf10
0x00840b6b: sub    r10,rdi
0x00840b6e: sar    r10,0x3
0x00840b72: test   r10,r10
0x00840b75: je     0x140840bb7
0x00840b77: cmp    r11d,0xffffffff
0x00840b7b: je     0x140840bb7
0x00840b7d: xor    edx,edx
0x00840b7f: sub    r10d,0x1
0x00840b83: js     0x140840bb7
0x00840b85: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00840b90: lea    ecx,[rdx+r10*1]
0x00840b94: sar    ecx,1
0x00840b96: movsxd rax,ecx
0x00840b99: mov    r8,QWORD PTR [rdi+rax*8]
0x00840b9d: cmp    DWORD PTR [r8+0x50],r11d
0x00840ba1: je     0x140840bba
0x00840ba3: lea    eax,[rcx+0x1]
0x00840ba6: cmovle edx,eax
0x00840ba9: lea    eax,[rcx-0x1]
0x00840bac: cmovle eax,r10d
0x00840bb0: mov    r10d,eax
0x00840bb3: cmp    edx,eax
0x00840bb5: jle    0x140840b90
0x00840bb7: xor    r8d,r8d
0x00840bba: test   r8,r8
0x00840bbd: je     0x140840c54
0x00840bc3: xorps  xmm0,xmm0
0x00840bc6: movups XMMWORD PTR [rsp+0x40],xmm0
0x00840bcb: mov    QWORD PTR [rsp+0x50],0x0
0x00840bd4: mov    QWORD PTR [rsp+0x58],0xf
0x00840bdd: mov    BYTE PTR [rsp+0x40],0x0
0x00840be2: mov    rax,QWORD PTR [r8]
0x00840be5: lea    rdx,[rsp+0x40]
0x00840bea: mov    rcx,r8
0x00840bed: call   QWORD PTR [rax+0x188]
0x00840bf3: lea    rdx,[rsp+0x40]
0x00840bf8: cmp    QWORD PTR [rsp+0x58],0xf
0x00840bfe: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840c04: mov    r8,QWORD PTR [rsp+0x50]
0x00840c09: mov    rcx,rsi
0x00840c0c: call   0x14006fa10
0x00840c11: nop
0x00840c12: mov    rdx,QWORD PTR [rsp+0x58]
0x00840c17: cmp    rdx,0xf
0x00840c1b: jbe    0x140840c69
0x00840c1d: inc    rdx
0x00840c20: mov    rcx,QWORD PTR [rsp+0x40]
0x00840c25: mov    rax,rcx
0x00840c28: cmp    rdx,0x1000
0x00840c2f: jb     0x140840c4d
0x00840c31: add    rdx,0x27
0x00840c35: mov    rcx,QWORD PTR [rcx-0x8]
0x00840c39: sub    rax,rcx
0x00840c3c: add    rax,0xfffffffffffffff8
0x00840c40: cmp    rax,0x1f
0x00840c44: jbe    0x140840c4d
0x00840c46: call   QWORD PTR [rip+0xda4edc]        # 0x1415e5b28
0x00840c4c: int3
0x00840c4d: call   0x141539680
0x00840c52: jmp    0x140840c69
0x00840c54: mov    r8d,0x8
0x00840c5a: lea    rdx,[rip+0xdaa89f]        # 0x1415eb500 ; literal="building"
0x00840c61: mov    rcx,rsi
0x00840c64: call   0x14006fa10
0x00840c69: mov    eax,0xffff8ad0
0x00840c6e: cmp    WORD PTR [rbx+0x16],ax
0x00840c72: je     0x140840ccc
0x00840c74: mov    r8d,0x2
0x00840c7a: lea    rdx,[rip+0xdd48bf]        # 0x141615540 ; literal=" ("
0x00840c81: mov    rcx,rsi
0x00840c84: call   0x14006fa10
0x00840c89: mov    QWORD PTR [rsp+0x30],rsi
0x00840c8e: movzx  eax,WORD PTR [rbx+0x14]
0x00840c92: mov    WORD PTR [rsp+0x28],ax
0x00840c97: movzx  eax,WORD PTR [rbx+0x12]
0x00840c9b: mov    WORD PTR [rsp+0x20],ax
0x00840ca0: movzx  r9d,WORD PTR [rbx+0x10]
0x00840ca5: movzx  r8d,WORD PTR [rbx+0x1a]
0x00840caa: movzx  edx,WORD PTR [rbx+0x18]
0x00840cae: movzx  ecx,WORD PTR [rbx+0x16]
0x00840cb2: call   0x14074f220
0x00840cb7: mov    r8d,0x1
0x00840cbd: lea    rdx,[rip+0xdd48bc]        # 0x141615580 ; literal=")"
0x00840cc4: mov    rcx,rsi
0x00840cc7: call   0x14006fa10
0x00840ccc: mov    rcx,QWORD PTR [rsp+0x60]
0x00840cd1: xor    rcx,rsp
0x00840cd4: call   0x141539660
0x00840cd9: lea    r11,[rsp+0x70]
0x00840cde: mov    rbx,QWORD PTR [r11+0x10]
0x00840ce2: mov    rsi,QWORD PTR [r11+0x20]
0x00840ce6: mov    rsp,r11
0x00840ce9: pop    rdi
0x00840cea: ret

# steam PE:6a70a6d9:02711000; adventure_movement_building_interact_break_in_hatchst+8; RVA 0x840cf0..0x840ebb
0x00840cf0: mov    QWORD PTR [rsp+0x8],rbx
0x00840cf5: mov    QWORD PTR [rsp+0x18],rsi
0x00840cfa: push   rdi
0x00840cfb: sub    rsp,0x70
0x00840cff: mov    rax,QWORD PTR [rip+0x105b33a]        # 0x14189c040
0x00840d06: xor    rax,rsp
0x00840d09: mov    QWORD PTR [rsp+0x60],rax
0x00840d0e: mov    rsi,rdx
0x00840d11: mov    rbx,rcx
0x00840d14: mov    r8d,0x9
0x00840d1a: lea    rdx,[rip+0xe6ffc7]        # 0x1416b0ce8 ; literal="Break in "
0x00840d21: mov    rcx,rsi
0x00840d24: call   0x14006f8d0
0x00840d29: mov    r11d,DWORD PTR [rbx+0x20]
0x00840d2d: mov    r10,QWORD PTR [rip+0x1bad1e4]        # 0x1423edf18
0x00840d34: mov    rdi,QWORD PTR [rip+0x1bad1d5]        # 0x1423edf10
0x00840d3b: sub    r10,rdi
0x00840d3e: sar    r10,0x3
0x00840d42: test   r10,r10
0x00840d45: je     0x140840d87
0x00840d47: cmp    r11d,0xffffffff
0x00840d4b: je     0x140840d87
0x00840d4d: xor    edx,edx
0x00840d4f: sub    r10d,0x1
0x00840d53: js     0x140840d87
0x00840d55: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00840d60: lea    ecx,[rdx+r10*1]
0x00840d64: sar    ecx,1
0x00840d66: movsxd rax,ecx
0x00840d69: mov    r8,QWORD PTR [rdi+rax*8]
0x00840d6d: cmp    DWORD PTR [r8+0x50],r11d
0x00840d71: je     0x140840d8a
0x00840d73: lea    eax,[rcx+0x1]
0x00840d76: cmovle edx,eax
0x00840d79: lea    eax,[rcx-0x1]
0x00840d7c: cmovle eax,r10d
0x00840d80: mov    r10d,eax
0x00840d83: cmp    edx,eax
0x00840d85: jle    0x140840d60
0x00840d87: xor    r8d,r8d
0x00840d8a: test   r8,r8
0x00840d8d: je     0x140840e24
0x00840d93: xorps  xmm0,xmm0
0x00840d96: movups XMMWORD PTR [rsp+0x40],xmm0
0x00840d9b: mov    QWORD PTR [rsp+0x50],0x0
0x00840da4: mov    QWORD PTR [rsp+0x58],0xf
0x00840dad: mov    BYTE PTR [rsp+0x40],0x0
0x00840db2: mov    rax,QWORD PTR [r8]
0x00840db5: lea    rdx,[rsp+0x40]
0x00840dba: mov    rcx,r8
0x00840dbd: call   QWORD PTR [rax+0x188]
0x00840dc3: lea    rdx,[rsp+0x40]
0x00840dc8: cmp    QWORD PTR [rsp+0x58],0xf
0x00840dce: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840dd4: mov    r8,QWORD PTR [rsp+0x50]
0x00840dd9: mov    rcx,rsi
0x00840ddc: call   0x14006fa10
0x00840de1: nop
0x00840de2: mov    rdx,QWORD PTR [rsp+0x58]
0x00840de7: cmp    rdx,0xf
0x00840deb: jbe    0x140840e39
0x00840ded: inc    rdx
0x00840df0: mov    rcx,QWORD PTR [rsp+0x40]
0x00840df5: mov    rax,rcx
0x00840df8: cmp    rdx,0x1000
0x00840dff: jb     0x140840e1d
0x00840e01: add    rdx,0x27
0x00840e05: mov    rcx,QWORD PTR [rcx-0x8]
0x00840e09: sub    rax,rcx
0x00840e0c: add    rax,0xfffffffffffffff8
0x00840e10: cmp    rax,0x1f
0x00840e14: jbe    0x140840e1d
0x00840e16: call   QWORD PTR [rip+0xda4d0c]        # 0x1415e5b28
0x00840e1c: int3
0x00840e1d: call   0x141539680
0x00840e22: jmp    0x140840e39
0x00840e24: mov    r8d,0x8
0x00840e2a: lea    rdx,[rip+0xdaa6cf]        # 0x1415eb500 ; literal="building"
0x00840e31: mov    rcx,rsi
0x00840e34: call   0x14006fa10
0x00840e39: mov    eax,0xffff8ad0
0x00840e3e: cmp    WORD PTR [rbx+0x16],ax
0x00840e42: je     0x140840e9c
0x00840e44: mov    r8d,0x2
0x00840e4a: lea    rdx,[rip+0xdd46ef]        # 0x141615540 ; literal=" ("
0x00840e51: mov    rcx,rsi
0x00840e54: call   0x14006fa10
0x00840e59: mov    QWORD PTR [rsp+0x30],rsi
0x00840e5e: movzx  eax,WORD PTR [rbx+0x14]
0x00840e62: mov    WORD PTR [rsp+0x28],ax
0x00840e67: movzx  eax,WORD PTR [rbx+0x12]
0x00840e6b: mov    WORD PTR [rsp+0x20],ax
0x00840e70: movzx  r9d,WORD PTR [rbx+0x10]
0x00840e75: movzx  r8d,WORD PTR [rbx+0x1a]
0x00840e7a: movzx  edx,WORD PTR [rbx+0x18]
0x00840e7e: movzx  ecx,WORD PTR [rbx+0x16]
0x00840e82: call   0x14074f220
0x00840e87: mov    r8d,0x1
0x00840e8d: lea    rdx,[rip+0xdd46ec]        # 0x141615580 ; literal=")"
0x00840e94: mov    rcx,rsi
0x00840e97: call   0x14006fa10
0x00840e9c: mov    rcx,QWORD PTR [rsp+0x60]
0x00840ea1: xor    rcx,rsp
0x00840ea4: call   0x141539660
0x00840ea9: lea    r11,[rsp+0x70]
0x00840eae: mov    rbx,QWORD PTR [r11+0x10]
0x00840eb2: mov    rsi,QWORD PTR [r11+0x20]
0x00840eb6: mov    rsp,r11
0x00840eb9: pop    rdi
0x00840eba: ret

# steam PE:6a70a6d9:02711000; adventure_movement_building_interact_pick_door_lockst+8;adventure_movement_building_interact_pick_hatch_lockst+8; RVA 0x840ec0..0x8410a0
0x00840ec0: mov    QWORD PTR [rsp+0x8],rbx
0x00840ec5: mov    QWORD PTR [rsp+0x18],rsi
0x00840eca: push   rdi
0x00840ecb: sub    rsp,0x70
0x00840ecf: mov    rax,QWORD PTR [rip+0x105b16a]        # 0x14189c040
0x00840ed6: xor    rax,rsp
0x00840ed9: mov    QWORD PTR [rsp+0x60],rax
0x00840ede: mov    rdi,rdx
0x00840ee1: mov    rbx,rcx
0x00840ee4: mov    r8d,0x5
0x00840eea: lea    rdx,[rip+0xe7047b]        # 0x1416b136c ; literal="Pick "
0x00840ef1: mov    rcx,rdi
0x00840ef4: call   0x14006f8d0
0x00840ef9: mov    r11d,DWORD PTR [rbx+0x20]
0x00840efd: mov    r10,QWORD PTR [rip+0x1bad014]        # 0x1423edf18
0x00840f04: mov    rsi,QWORD PTR [rip+0x1bad005]        # 0x1423edf10
0x00840f0b: sub    r10,rsi
0x00840f0e: sar    r10,0x3
0x00840f12: test   r10,r10
0x00840f15: je     0x140840f57
0x00840f17: cmp    r11d,0xffffffff
0x00840f1b: je     0x140840f57
0x00840f1d: xor    edx,edx
0x00840f1f: sub    r10d,0x1
0x00840f23: js     0x140840f57
0x00840f25: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00840f30: lea    ecx,[rdx+r10*1]
0x00840f34: sar    ecx,1
0x00840f36: movsxd rax,ecx
0x00840f39: mov    r8,QWORD PTR [rsi+rax*8]
0x00840f3d: cmp    DWORD PTR [r8+0x50],r11d
0x00840f41: je     0x140840f5a
0x00840f43: lea    eax,[rcx+0x1]
0x00840f46: cmovle edx,eax
0x00840f49: lea    eax,[rcx-0x1]
0x00840f4c: cmovle eax,r10d
0x00840f50: mov    r10d,eax
0x00840f53: cmp    edx,eax
0x00840f55: jle    0x140840f30
0x00840f57: xor    r8d,r8d
0x00840f5a: test   r8,r8
0x00840f5d: je     0x140840ff4
0x00840f63: xorps  xmm0,xmm0
0x00840f66: movups XMMWORD PTR [rsp+0x40],xmm0
0x00840f6b: mov    QWORD PTR [rsp+0x50],0x0
0x00840f74: mov    QWORD PTR [rsp+0x58],0xf
0x00840f7d: mov    BYTE PTR [rsp+0x40],0x0
0x00840f82: mov    rax,QWORD PTR [r8]
0x00840f85: lea    rdx,[rsp+0x40]
0x00840f8a: mov    rcx,r8
0x00840f8d: call   QWORD PTR [rax+0x188]
0x00840f93: lea    rdx,[rsp+0x40]
0x00840f98: cmp    QWORD PTR [rsp+0x58],0xf
0x00840f9e: cmova  rdx,QWORD PTR [rsp+0x40]
0x00840fa4: mov    r8,QWORD PTR [rsp+0x50]
0x00840fa9: mov    rcx,rdi
0x00840fac: call   0x14006fa10
0x00840fb1: nop
0x00840fb2: mov    rdx,QWORD PTR [rsp+0x58]
0x00840fb7: cmp    rdx,0xf
0x00840fbb: jbe    0x140841009
0x00840fbd: inc    rdx
0x00840fc0: mov    rcx,QWORD PTR [rsp+0x40]
0x00840fc5: mov    rax,rcx
0x00840fc8: cmp    rdx,0x1000
0x00840fcf: jb     0x140840fed
0x00840fd1: add    rdx,0x27
0x00840fd5: mov    rcx,QWORD PTR [rcx-0x8]
0x00840fd9: sub    rax,rcx
0x00840fdc: add    rax,0xfffffffffffffff8
0x00840fe0: cmp    rax,0x1f
0x00840fe4: jbe    0x140840fed
0x00840fe6: call   QWORD PTR [rip+0xda4b3c]        # 0x1415e5b28
0x00840fec: int3
0x00840fed: call   0x141539680
0x00840ff2: jmp    0x140841009
0x00840ff4: mov    r8d,0x8
0x00840ffa: lea    rdx,[rip+0xdaa4ff]        # 0x1415eb500 ; literal="building"
0x00841001: mov    rcx,rdi
0x00841004: call   0x14006fa10
0x00841009: mov    r8d,0x5
0x0084100f: lea    rdx,[rip+0xe21756]        # 0x14166276c ; literal=" lock"
0x00841016: mov    rcx,rdi
0x00841019: call   0x14006fa10
0x0084101e: mov    eax,0xffff8ad0
0x00841023: cmp    WORD PTR [rbx+0x16],ax
0x00841027: je     0x140841081
0x00841029: mov    r8d,0x2
0x0084102f: lea    rdx,[rip+0xdd450a]        # 0x141615540 ; literal=" ("
0x00841036: mov    rcx,rdi
0x00841039: call   0x14006fa10
0x0084103e: mov    QWORD PTR [rsp+0x30],rdi
0x00841043: movzx  eax,WORD PTR [rbx+0x14]
0x00841047: mov    WORD PTR [rsp+0x28],ax
0x0084104c: movzx  eax,WORD PTR [rbx+0x12]
0x00841050: mov    WORD PTR [rsp+0x20],ax
0x00841055: movzx  r9d,WORD PTR [rbx+0x10]
0x0084105a: movzx  r8d,WORD PTR [rbx+0x1a]
0x0084105f: movzx  edx,WORD PTR [rbx+0x18]
0x00841063: movzx  ecx,WORD PTR [rbx+0x16]
0x00841067: call   0x14074f220
0x0084106c: mov    r8d,0x1
0x00841072: lea    rdx,[rip+0xdd4507]        # 0x141615580 ; literal=")"
0x00841079: mov    rcx,rdi
0x0084107c: call   0x14006fa10
0x00841081: mov    rcx,QWORD PTR [rsp+0x60]
0x00841086: xor    rcx,rsp
0x00841089: call   0x141539660
0x0084108e: lea    r11,[rsp+0x70]
0x00841093: mov    rbx,QWORD PTR [r11+0x10]
0x00841097: mov    rsi,QWORD PTR [r11+0x20]
0x0084109b: mov    rsp,r11
0x0084109e: pop    rdi
0x0084109f: ret

# steam PE:6a70a6d9:02711000; adventure_movement_building_interact_bash_down_doorst+8; RVA 0x8410a0..0x84126b
0x008410a0: mov    QWORD PTR [rsp+0x8],rbx
0x008410a5: mov    QWORD PTR [rsp+0x18],rsi
0x008410aa: push   rdi
0x008410ab: sub    rsp,0x70
0x008410af: mov    rax,QWORD PTR [rip+0x105af8a]        # 0x14189c040
0x008410b6: xor    rax,rsp
0x008410b9: mov    QWORD PTR [rsp+0x60],rax
0x008410be: mov    rsi,rdx
0x008410c1: mov    rbx,rcx
0x008410c4: mov    r8d,0xa
0x008410ca: lea    rdx,[rip+0xe7028f]        # 0x1416b1360 ; literal="Bash down "
0x008410d1: mov    rcx,rsi
0x008410d4: call   0x14006f8d0
0x008410d9: mov    r11d,DWORD PTR [rbx+0x20]
0x008410dd: mov    r10,QWORD PTR [rip+0x1bace34]        # 0x1423edf18
0x008410e4: mov    rdi,QWORD PTR [rip+0x1bace25]        # 0x1423edf10
0x008410eb: sub    r10,rdi
0x008410ee: sar    r10,0x3
0x008410f2: test   r10,r10
0x008410f5: je     0x140841137
0x008410f7: cmp    r11d,0xffffffff
0x008410fb: je     0x140841137
0x008410fd: xor    edx,edx
0x008410ff: sub    r10d,0x1
0x00841103: js     0x140841137
0x00841105: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00841110: lea    ecx,[rdx+r10*1]
0x00841114: sar    ecx,1
0x00841116: movsxd rax,ecx
0x00841119: mov    r8,QWORD PTR [rdi+rax*8]
0x0084111d: cmp    DWORD PTR [r8+0x50],r11d
0x00841121: je     0x14084113a
0x00841123: lea    eax,[rcx+0x1]
0x00841126: cmovle edx,eax
0x00841129: lea    eax,[rcx-0x1]
0x0084112c: cmovle eax,r10d
0x00841130: mov    r10d,eax
0x00841133: cmp    edx,eax
0x00841135: jle    0x140841110
0x00841137: xor    r8d,r8d
0x0084113a: test   r8,r8
0x0084113d: je     0x1408411d4
0x00841143: xorps  xmm0,xmm0
0x00841146: movups XMMWORD PTR [rsp+0x40],xmm0
0x0084114b: mov    QWORD PTR [rsp+0x50],0x0
0x00841154: mov    QWORD PTR [rsp+0x58],0xf
0x0084115d: mov    BYTE PTR [rsp+0x40],0x0
0x00841162: mov    rax,QWORD PTR [r8]
0x00841165: lea    rdx,[rsp+0x40]
0x0084116a: mov    rcx,r8
0x0084116d: call   QWORD PTR [rax+0x188]
0x00841173: lea    rdx,[rsp+0x40]
0x00841178: cmp    QWORD PTR [rsp+0x58],0xf
0x0084117e: cmova  rdx,QWORD PTR [rsp+0x40]
0x00841184: mov    r8,QWORD PTR [rsp+0x50]
0x00841189: mov    rcx,rsi
0x0084118c: call   0x14006fa10
0x00841191: nop
0x00841192: mov    rdx,QWORD PTR [rsp+0x58]
0x00841197: cmp    rdx,0xf
0x0084119b: jbe    0x1408411e9
0x0084119d: inc    rdx
0x008411a0: mov    rcx,QWORD PTR [rsp+0x40]
0x008411a5: mov    rax,rcx
0x008411a8: cmp    rdx,0x1000
0x008411af: jb     0x1408411cd
0x008411b1: add    rdx,0x27
0x008411b5: mov    rcx,QWORD PTR [rcx-0x8]
0x008411b9: sub    rax,rcx
0x008411bc: add    rax,0xfffffffffffffff8
0x008411c0: cmp    rax,0x1f
0x008411c4: jbe    0x1408411cd
0x008411c6: call   QWORD PTR [rip+0xda495c]        # 0x1415e5b28
0x008411cc: int3
0x008411cd: call   0x141539680
0x008411d2: jmp    0x1408411e9
0x008411d4: mov    r8d,0x8
0x008411da: lea    rdx,[rip+0xdaa31f]        # 0x1415eb500 ; literal="building"
0x008411e1: mov    rcx,rsi
0x008411e4: call   0x14006fa10
0x008411e9: mov    eax,0xffff8ad0
0x008411ee: cmp    WORD PTR [rbx+0x16],ax
0x008411f2: je     0x14084124c
0x008411f4: mov    r8d,0x2
0x008411fa: lea    rdx,[rip+0xdd433f]        # 0x141615540 ; literal=" ("
0x00841201: mov    rcx,rsi
0x00841204: call   0x14006fa10
0x00841209: mov    QWORD PTR [rsp+0x30],rsi
0x0084120e: movzx  eax,WORD PTR [rbx+0x14]
0x00841212: mov    WORD PTR [rsp+0x28],ax
0x00841217: movzx  eax,WORD PTR [rbx+0x12]
0x0084121b: mov    WORD PTR [rsp+0x20],ax
0x00841220: movzx  r9d,WORD PTR [rbx+0x10]
0x00841225: movzx  r8d,WORD PTR [rbx+0x1a]
0x0084122a: movzx  edx,WORD PTR [rbx+0x18]
0x0084122e: movzx  ecx,WORD PTR [rbx+0x16]
0x00841232: call   0x14074f220
0x00841237: mov    r8d,0x1
0x0084123d: lea    rdx,[rip+0xdd433c]        # 0x141615580 ; literal=")"
0x00841244: mov    rcx,rsi
0x00841247: call   0x14006fa10
0x0084124c: mov    rcx,QWORD PTR [rsp+0x60]
0x00841251: xor    rcx,rsp
0x00841254: call   0x141539660
0x00841259: lea    r11,[rsp+0x70]
0x0084125e: mov    rbx,QWORD PTR [r11+0x10]
0x00841262: mov    rsi,QWORD PTR [r11+0x20]
0x00841266: mov    rsp,r11
0x00841269: pop    rdi
0x0084126a: ret

# steam PE:6a70a6d9:02711000; adventure_movement_building_interact_topple_statuest+8; RVA 0x841270..0x84143b
0x00841270: mov    QWORD PTR [rsp+0x8],rbx
0x00841275: mov    QWORD PTR [rsp+0x18],rsi
0x0084127a: push   rdi
0x0084127b: sub    rsp,0x70
0x0084127f: mov    rax,QWORD PTR [rip+0x105adba]        # 0x14189c040
0x00841286: xor    rax,rsp
0x00841289: mov    QWORD PTR [rsp+0x60],rax
0x0084128e: mov    rsi,rdx
0x00841291: mov    rbx,rcx
0x00841294: mov    r8d,0x7
0x0084129a: lea    rdx,[rip+0xe700df]        # 0x1416b1380 ; literal="Topple "
0x008412a1: mov    rcx,rsi
0x008412a4: call   0x14006f8d0
0x008412a9: mov    r11d,DWORD PTR [rbx+0x20]
0x008412ad: mov    r10,QWORD PTR [rip+0x1bacc64]        # 0x1423edf18
0x008412b4: mov    rdi,QWORD PTR [rip+0x1bacc55]        # 0x1423edf10
0x008412bb: sub    r10,rdi
0x008412be: sar    r10,0x3
0x008412c2: test   r10,r10
0x008412c5: je     0x140841307
0x008412c7: cmp    r11d,0xffffffff
0x008412cb: je     0x140841307
0x008412cd: xor    edx,edx
0x008412cf: sub    r10d,0x1
0x008412d3: js     0x140841307
0x008412d5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x008412e0: lea    ecx,[rdx+r10*1]
0x008412e4: sar    ecx,1
0x008412e6: movsxd rax,ecx
0x008412e9: mov    r8,QWORD PTR [rdi+rax*8]
0x008412ed: cmp    DWORD PTR [r8+0x50],r11d
0x008412f1: je     0x14084130a
0x008412f3: lea    eax,[rcx+0x1]
0x008412f6: cmovle edx,eax
0x008412f9: lea    eax,[rcx-0x1]
0x008412fc: cmovle eax,r10d
0x00841300: mov    r10d,eax
0x00841303: cmp    edx,eax
0x00841305: jle    0x1408412e0
0x00841307: xor    r8d,r8d
0x0084130a: test   r8,r8
0x0084130d: je     0x1408413a4
0x00841313: xorps  xmm0,xmm0
0x00841316: movups XMMWORD PTR [rsp+0x40],xmm0
0x0084131b: mov    QWORD PTR [rsp+0x50],0x0
0x00841324: mov    QWORD PTR [rsp+0x58],0xf
0x0084132d: mov    BYTE PTR [rsp+0x40],0x0
0x00841332: mov    rax,QWORD PTR [r8]
0x00841335: lea    rdx,[rsp+0x40]
0x0084133a: mov    rcx,r8
0x0084133d: call   QWORD PTR [rax+0x188]
0x00841343: lea    rdx,[rsp+0x40]
0x00841348: cmp    QWORD PTR [rsp+0x58],0xf
0x0084134e: cmova  rdx,QWORD PTR [rsp+0x40]
0x00841354: mov    r8,QWORD PTR [rsp+0x50]
0x00841359: mov    rcx,rsi
0x0084135c: call   0x14006fa10
0x00841361: nop
0x00841362: mov    rdx,QWORD PTR [rsp+0x58]
0x00841367: cmp    rdx,0xf
0x0084136b: jbe    0x1408413b9
0x0084136d: inc    rdx
0x00841370: mov    rcx,QWORD PTR [rsp+0x40]
0x00841375: mov    rax,rcx
0x00841378: cmp    rdx,0x1000
0x0084137f: jb     0x14084139d
0x00841381: add    rdx,0x27
0x00841385: mov    rcx,QWORD PTR [rcx-0x8]
0x00841389: sub    rax,rcx
0x0084138c: add    rax,0xfffffffffffffff8
0x00841390: cmp    rax,0x1f
0x00841394: jbe    0x14084139d
0x00841396: call   QWORD PTR [rip+0xda478c]        # 0x1415e5b28
0x0084139c: int3
0x0084139d: call   0x141539680
0x008413a2: jmp    0x1408413b9
0x008413a4: mov    r8d,0x8
0x008413aa: lea    rdx,[rip+0xdaa14f]        # 0x1415eb500 ; literal="building"
0x008413b1: mov    rcx,rsi
0x008413b4: call   0x14006fa10
0x008413b9: mov    eax,0xffff8ad0
0x008413be: cmp    WORD PTR [rbx+0x16],ax
0x008413c2: je     0x14084141c
0x008413c4: mov    r8d,0x2
0x008413ca: lea    rdx,[rip+0xdd416f]        # 0x141615540 ; literal=" ("
0x008413d1: mov    rcx,rsi
0x008413d4: call   0x14006fa10
0x008413d9: mov    QWORD PTR [rsp+0x30],rsi
0x008413de: movzx  eax,WORD PTR [rbx+0x14]
0x008413e2: mov    WORD PTR [rsp+0x28],ax
0x008413e7: movzx  eax,WORD PTR [rbx+0x12]
0x008413eb: mov    WORD PTR [rsp+0x20],ax
0x008413f0: movzx  r9d,WORD PTR [rbx+0x10]
0x008413f5: movzx  r8d,WORD PTR [rbx+0x1a]
0x008413fa: movzx  edx,WORD PTR [rbx+0x18]
0x008413fe: movzx  ecx,WORD PTR [rbx+0x16]
0x00841402: call   0x14074f220
0x00841407: mov    r8d,0x1
0x0084140d: lea    rdx,[rip+0xdd416c]        # 0x141615580 ; literal=")"
0x00841414: mov    rcx,rsi
0x00841417: call   0x14006fa10
0x0084141c: mov    rcx,QWORD PTR [rsp+0x60]
0x00841421: xor    rcx,rsp
0x00841424: call   0x141539660
0x00841429: lea    r11,[rsp+0x70]
0x0084142e: mov    rbx,QWORD PTR [r11+0x10]
0x00841432: mov    rsi,QWORD PTR [r11+0x20]
0x00841436: mov    rsp,r11
0x00841439: pop    rdi
0x0084143a: ret

# steam PE:6a70a6d9:02711000; adventure_movement_movest+8; RVA 0x841440..0x8418fd
0x00841440: mov    QWORD PTR [rsp+0x18],rbx
0x00841445: push   rbp
0x00841446: push   rsi
0x00841447: push   rdi
0x00841448: push   r12
0x0084144a: push   r13
0x0084144c: push   r14
0x0084144e: push   r15
0x00841450: mov    rbp,rsp
0x00841453: sub    rsp,0x80
0x0084145a: mov    rax,QWORD PTR [rip+0x105abdf]        # 0x14189c040
0x00841461: xor    rax,rsp
0x00841464: mov    QWORD PTR [rbp-0x10],rax
0x00841468: mov    r12,rdx
0x0084146b: mov    r13,rcx
0x0084146e: mov    eax,DWORD PTR [rcx+0x24]
0x00841471: and    eax,0x1
0x00841474: mov    ecx,eax
0x00841476: mov    r8d,eax
0x00841479: xor    r8,0x1
0x0084147d: add    r8,0x7
0x00841481: lea    rax,[rip+0xe6feb8]        # 0x1416b1340 ; literal="Move to "
0x00841488: lea    rdx,[rip+0xe6fee9]        # 0x1416b1378 ; literal="Charge "
0x0084148f: test   ecx,ecx
0x00841491: cmove  rdx,rax
0x00841495: mov    rcx,r12
0x00841498: call   0x14006f8d0
0x0084149d: xor    dil,dil
0x008414a0: mov    BYTE PTR [rbp-0x40],dil
0x008414a4: mov    eax,0xffff8ad0
0x008414a9: xor    ebx,ebx
0x008414ab: test   BYTE PTR [r13+0x24],0x1
0x008414b0: je     0x140841660
0x008414b6: mov    rsi,QWORD PTR [rip+0x1ba3c0b]        # 0x1423e50c8
0x008414bd: mov    r14,QWORD PTR [rip+0x1ba3c0c]        # 0x1423e50d0
0x008414c4: cmp    rsi,r14
0x008414c7: jae    0x14084165b
0x008414cd: mov    r15,QWORD PTR [rsi]
0x008414d0: cmp    r15,QWORD PTR [rip+0x1ba3c39]        # 0x1423e5110
0x008414d7: je     0x14084164b
0x008414dd: test   DWORD PTR [r15+0x110],0x2000002
0x008414e8: jne    0x14084164b
0x008414ee: mov    WORD PTR [rbp-0x3c],ax
0x008414f2: test   DWORD PTR [r15+0x110],0x2000000
0x008414fd: je     0x140841553
0x008414ff: mov    rbx,QWORD PTR [r15+0x1d8]
0x00841506: mov    rdi,QWORD PTR [r15+0x1e0]
0x0084150d: nop    DWORD PTR [rax]
0x00841510: cmp    rbx,rdi
0x00841513: jae    0x14084154b
0x00841515: mov    rcx,QWORD PTR [rbx]
0x00841518: mov    rax,QWORD PTR [rcx]
0x0084151b: call   QWORD PTR [rax+0x10]
0x0084151e: cmp    eax,0xb
0x00841521: jne    0x140841531
0x00841523: mov    rcx,QWORD PTR [rbx]
0x00841526: mov    rax,QWORD PTR [rcx]
0x00841529: call   QWORD PTR [rax+0x18]
0x0084152c: test   rax,rax
0x0084152f: jne    0x140841537
0x00841531: add    rbx,0x8
0x00841535: jmp    0x140841510
0x00841537: lea    r9,[rbp-0x34]
0x0084153b: lea    r8,[rbp-0x38]
0x0084153f: lea    rdx,[rbp-0x3c]
0x00841543: mov    rcx,rax
0x00841546: call   0x140c8baa0
0x0084154b: xor    ebx,ebx
0x0084154d: movzx  edi,BYTE PTR [rbp-0x40]
0x00841551: jmp    0x140841577
0x00841553: movzx  eax,WORD PTR [r15+0xa8]
0x0084155b: mov    WORD PTR [rbp-0x3c],ax
0x0084155f: movzx  eax,WORD PTR [r15+0xaa]
0x00841567: mov    WORD PTR [rbp-0x38],ax
0x0084156b: movzx  eax,WORD PTR [r15+0xac]
0x00841573: mov    WORD PTR [rbp-0x34],ax
0x00841577: movzx  eax,WORD PTR [r13+0x10]
0x0084157c: cmp    WORD PTR [rbp-0x3c],ax
0x00841580: jne    0x140841646
0x00841586: movzx  eax,WORD PTR [r13+0x12]
0x0084158b: cmp    WORD PTR [rbp-0x38],ax
0x0084158f: jne    0x140841646
0x00841595: movzx  eax,WORD PTR [r13+0x14]
0x0084159a: cmp    WORD PTR [rbp-0x34],ax
0x0084159e: jne    0x140841646
0x008415a4: mov    rdx,r15
0x008415a7: mov    rcx,QWORD PTR [rip+0x1ba3b62]        # 0x1423e5110
0x008415ae: call   0x1413eb470
0x008415b3: cmp    eax,0xffffffff
0x008415b6: jne    0x140841646
0x008415bc: mov    dil,0x1
0x008415bf: mov    BYTE PTR [rbp-0x40],dil
0x008415c3: xorps  xmm0,xmm0
0x008415c6: movups XMMWORD PTR [rbp-0x30],xmm0
0x008415ca: mov    QWORD PTR [rbp-0x20],rbx
0x008415ce: mov    QWORD PTR [rbp-0x18],0xf
0x008415d6: mov    BYTE PTR [rbp-0x30],0x0
0x008415da: mov    BYTE PTR [rsp+0x20],dil
0x008415df: xor    r9d,r9d
0x008415e2: mov    r8d,0x1
0x008415e8: lea    rdx,[rbp-0x30]
0x008415ec: mov    rcx,r15
0x008415ef: call   0x14132e430
0x008415f4: lea    rdx,[rbp-0x30]
0x008415f8: cmp    QWORD PTR [rbp-0x18],0xf
0x008415fd: cmova  rdx,QWORD PTR [rbp-0x30]
0x00841602: mov    r8,QWORD PTR [rbp-0x20]
0x00841606: mov    rcx,r12
0x00841609: call   0x14006fa10
0x0084160e: nop
0x0084160f: mov    rdx,QWORD PTR [rbp-0x18]
0x00841613: cmp    rdx,0xf
0x00841617: jbe    0x140841646
0x00841619: inc    rdx
0x0084161c: mov    rcx,QWORD PTR [rbp-0x30]
0x00841620: mov    rax,rcx
0x00841623: cmp    rdx,0x1000
0x0084162a: jb     0x140841641
0x0084162c: add    rdx,0x27
0x00841630: mov    rcx,QWORD PTR [rcx-0x8]
0x00841634: sub    rax,rcx
0x00841637: add    rax,0xfffffffffffffff8
0x0084163b: cmp    rax,0x1f
0x0084163f: ja     0x140841654
0x00841641: call   0x141539680
0x00841646: mov    eax,0xffff8ad0
0x0084164b: add    rsi,0x8
0x0084164f: jmp    0x1408414c4
0x00841654: call   QWORD PTR [rip+0xda44ce]        # 0x1415e5b28
0x0084165a: int3
0x0084165b: test   dil,dil
0x0084165e: jne    0x1408416c9
0x00841660: xorps  xmm0,xmm0
0x00841663: movups XMMWORD PTR [rbp-0x30],xmm0
0x00841667: mov    QWORD PTR [rbp-0x20],rbx
0x0084166b: mov    QWORD PTR [rbp-0x18],0xf
0x00841673: mov    BYTE PTR [rbp-0x30],0x0
0x00841677: mov    BYTE PTR [rsp+0x28],0x0
0x0084167c: movzx  eax,WORD PTR [r13+0x14]
0x00841681: mov    WORD PTR [rsp+0x20],ax
0x00841686: movzx  r9d,WORD PTR [r13+0x12]
0x0084168b: movzx  r8d,WORD PTR [r13+0x10]
0x00841690: lea    rdx,[rbp-0x30]
0x00841694: lea    rcx,[rip+0x1b8fe55]        # 0x1423d14f0
0x0084169b: call   0x140e7d330
0x008416a0: lea    rdx,[rbp-0x30]
0x008416a4: cmp    QWORD PTR [rbp-0x18],0xf
0x008416a9: cmova  rdx,QWORD PTR [rbp-0x30]
0x008416ae: mov    r8,QWORD PTR [rbp-0x20]
0x008416b2: mov    rcx,r12
0x008416b5: call   0x14006fa10
0x008416ba: nop
0x008416bb: lea    rcx,[rbp-0x30]
0x008416bf: call   0x14006f850
0x008416c4: mov    eax,0xffff8ad0
0x008416c9: cmp    WORD PTR [r13+0x16],ax
0x008416ce: je     0x1408418d6
0x008416d4: mov    r8d,0x2
0x008416da: lea    rdx,[rip+0xdd3e5f]        # 0x141615540 ; literal=" ("
0x008416e1: mov    rcx,r12
0x008416e4: call   0x14006fa10
0x008416e9: mov    QWORD PTR [rsp+0x30],r12
0x008416ee: movzx  eax,WORD PTR [r13+0x14]
0x008416f3: mov    WORD PTR [rsp+0x28],ax
0x008416f8: movzx  eax,WORD PTR [r13+0x12]
0x008416fd: mov    WORD PTR [rsp+0x20],ax
0x00841702: movzx  r9d,WORD PTR [r13+0x10]
0x00841707: movzx  r8d,WORD PTR [r13+0x1a]
0x0084170c: movzx  edx,WORD PTR [r13+0x18]
0x00841711: movzx  ecx,WORD PTR [r13+0x16]
0x00841716: call   0x14074f220
0x0084171b: movsx  r9,WORD PTR [r13+0x14]
0x00841720: movsx  rbx,WORD PTR [r13+0x12]
0x00841725: movsx  rdi,WORD PTR [r13+0x10]
0x0084172a: test   di,di
0x0084172d: js     0x1408417b8
0x00841733: cmp    edi,DWORD PTR [rip+0x1ca69a3]        # 0x1424e80dc
0x00841739: jge    0x1408417b8
0x0084173b: test   bx,bx
0x0084173e: js     0x1408417b8
0x00841740: cmp    ebx,DWORD PTR [rip+0x1ca699a]        # 0x1424e80e0
0x00841746: jge    0x1408417b8
0x00841748: test   r9w,r9w
0x0084174c: js     0x1408417b8
0x0084174e: cmp    r9d,DWORD PTR [rip+0x1ca698f]        # 0x1424e80e4
0x00841755: jge    0x1408417b8
0x00841757: mov    rcx,QWORD PTR [rip+0x1ca694a]        # 0x1424e80a8
0x0084175e: test   rcx,rcx
0x00841761: je     0x1408417b8
0x00841763: mov    rax,rdi
0x00841766: sar    rax,0x4
0x0084176a: mov    rdx,rbx
0x0084176d: sar    rdx,0x4
0x00841771: mov    rax,QWORD PTR [rcx+rax*8]
0x00841775: mov    rax,QWORD PTR [rax+rdx*8]
0x00841779: mov    rdx,QWORD PTR [rax+r9*8]
0x0084177d: test   rdx,rdx
0x00841780: je     0x1408417b8
0x00841782: mov    eax,edi
0x00841784: and    eax,0x8000000f
0x00841789: jge    0x140841792
0x0084178b: dec    eax
0x0084178d: or     eax,0xfffffff0
0x00841790: inc    eax
0x00841792: movsxd rcx,eax
0x00841795: add    rcx,0x5
0x00841799: shl    rcx,0x4
0x0084179d: mov    eax,ebx
0x0084179f: and    eax,0x8000000f
0x008417a4: jge    0x1408417ad
0x008417a6: dec    eax
0x008417a8: or     eax,0xfffffff0
0x008417ab: inc    eax
0x008417ad: cdqe
0x008417af: add    rcx,rax
0x008417b2: movzx  eax,WORD PTR [rdx+rcx*2]
0x008417b6: jmp    0x1408417ba
0x008417b8: xor    eax,eax
0x008417ba: movzx  ecx,ax
0x008417bd: sub    ecx,0x1
0x008417c0: je     0x1408417d1
0x008417c2: sub    ecx,0x1f
0x008417c5: je     0x1408417d1
0x008417c7: sub    ecx,0x3
0x008417ca: je     0x1408417d1
0x008417cc: cmp    ecx,0x7
0x008417cf: jne    0x140841814
0x008417d1: movzx  r8d,bx
0x008417d5: movzx  edx,di
0x008417d8: lea    rcx,[rip+0x1b8fd11]        # 0x1423d14f0
0x008417df: call   0x140247d80
0x008417e4: cmp    al,0x6
0x008417e6: jg     0x140841814
0x008417e8: movzx  r8d,bx
0x008417ec: movzx  edx,di
0x008417ef: lea    rcx,[rip+0x1b8fcfa]        # 0x1423d14f0
0x008417f6: call   0x1402c3a90
0x008417fb: cmp    al,0x6
0x008417fd: jg     0x140841814
0x008417ff: mov    r8d,0x4
0x00841805: lea    rdx,[rip+0xe6fb2c]        # 0x1416b1338 ; literal="/Air"
0x0084180c: mov    rcx,r12
0x0084180f: call   0x14006fa10
0x00841814: movzx  r9d,WORD PTR [r13+0x14]
0x00841819: movzx  r8d,WORD PTR [r13+0x12]
0x0084181e: movzx  edx,WORD PTR [r13+0x10]
0x00841823: lea    rcx,[rip+0x1b8fcc6]        # 0x1423d14f0
0x0084182a: call   0x140247d80
0x0084182f: test   al,al
0x00841831: jle    0x140841848
0x00841833: mov    r8d,0x6
0x00841839: lea    rdx,[rip+0xe6fb14]        # 0x1416b1354 ; literal="/Water"
0x00841840: mov    rcx,r12
0x00841843: call   0x14006fa10
0x00841848: movzx  r9d,WORD PTR [r13+0x14]
0x0084184d: movzx  r8d,WORD PTR [r13+0x12]
0x00841852: movzx  edx,WORD PTR [r13+0x10]
0x00841857: lea    rcx,[rip+0x1b8fc92]        # 0x1423d14f0
0x0084185e: call   0x1402c3a90
0x00841863: test   al,al
0x00841865: jle    0x1408418c1
0x00841867: mov    r8d,0x1
0x0084186d: lea    rdx,[rip+0xda9ca0]        # 0x1415eb514 ; literal="/"
0x00841874: mov    rcx,r12
0x00841877: call   0x14006fa10
0x0084187c: movzx  r9d,WORD PTR [r13+0x14]
0x00841881: movzx  r8d,WORD PTR [r13+0x12]
0x00841886: movzx  edx,WORD PTR [r13+0x10]
0x0084188b: lea    rcx,[rip+0x1b8fc5e]        # 0x1423d14f0
0x00841892: call   0x14007dc40
0x00841897: mov    rcx,r12
0x0084189a: bt     eax,0xf
0x0084189e: jb     0x1408418af
0x008418a0: mov    r8d,0x4
0x008418a6: lea    rdx,[rip+0xe6fa9f]        # 0x1416b134c ; literal="Lava"
0x008418ad: jmp    0x1408418bc
0x008418af: mov    r8d,0x5
0x008418b5: lea    rdx,[rip+0xdb5ae8]        # 0x1415f73a4 ; literal="Magma"
0x008418bc: call   0x14006fa10
0x008418c1: mov    r8d,0x1
0x008418c7: lea    rdx,[rip+0xdd3cb2]        # 0x141615580 ; literal=")"
0x008418ce: mov    rcx,r12
0x008418d1: call   0x14006fa10
0x008418d6: mov    rcx,QWORD PTR [rbp-0x10]
0x008418da: xor    rcx,rsp
0x008418dd: call   0x141539660
0x008418e2: mov    rbx,QWORD PTR [rsp+0xd0]
0x008418ea: add    rsp,0x80
0x008418f1: pop    r15
0x008418f3: pop    r14
0x008418f5: pop    r13
0x008418f7: pop    r12
0x008418f9: pop    rdi
0x008418fa: pop    rsi
0x008418fb: pop    rbp
0x008418fc: ret

# steam PE:6a70a6d9:02711000; adventure_movement_climbst+8; RVA 0x841900..0x841be6
0x00841900: mov    QWORD PTR [rsp+0x18],rbx
0x00841905: mov    QWORD PTR [rsp+0x20],rsi
0x0084190a: push   rdi
0x0084190b: sub    rsp,0x70
0x0084190f: mov    rax,QWORD PTR [rip+0x105a72a]        # 0x14189c040
0x00841916: xor    rax,rsp
0x00841919: mov    QWORD PTR [rsp+0x60],rax
0x0084191e: mov    rdi,rdx
0x00841921: mov    rbx,rcx
0x00841924: mov    r8d,0x9
0x0084192a: lea    rdx,[rip+0xe6fa9f]        # 0x1416b13d0 ; literal="Climb to "
0x00841931: mov    rcx,rdi
0x00841934: call   0x14006f8d0
0x00841939: xorps  xmm0,xmm0
0x0084193c: movups XMMWORD PTR [rsp+0x40],xmm0
0x00841941: mov    QWORD PTR [rsp+0x50],0x0
0x0084194a: mov    QWORD PTR [rsp+0x58],0xf
0x00841953: mov    BYTE PTR [rsp+0x40],0x0
0x00841958: mov    BYTE PTR [rsp+0x28],0x0
0x0084195d: movzx  eax,WORD PTR [rbx+0x14]
0x00841961: mov    WORD PTR [rsp+0x20],ax
0x00841966: movzx  r9d,WORD PTR [rbx+0x12]
0x0084196b: movzx  r8d,WORD PTR [rbx+0x10]
0x00841970: lea    rdx,[rsp+0x40]
0x00841975: lea    rcx,[rip+0x1b8fb74]        # 0x1423d14f0
0x0084197c: call   0x140e7d330
0x00841981: lea    rdx,[rsp+0x40]
0x00841986: cmp    QWORD PTR [rsp+0x58],0xf
0x0084198c: cmova  rdx,QWORD PTR [rsp+0x40]
0x00841992: mov    r8,QWORD PTR [rsp+0x50]
0x00841997: mov    rcx,rdi
0x0084199a: call   0x14006fa10
0x0084199f: mov    esi,0xffff8ad0
0x008419a4: cmp    WORD PTR [rbx+0x16],si
0x008419a8: je     0x140841b87
0x008419ae: mov    r8d,0x2
0x008419b4: lea    rdx,[rip+0xdd3b85]        # 0x141615540 ; literal=" ("
0x008419bb: mov    rcx,rdi
0x008419be: call   0x14006fa10
0x008419c3: mov    QWORD PTR [rsp+0x30],rdi
0x008419c8: movzx  eax,WORD PTR [rbx+0x14]
0x008419cc: mov    WORD PTR [rsp+0x28],ax
0x008419d1: movzx  eax,WORD PTR [rbx+0x12]
0x008419d5: mov    WORD PTR [rsp+0x20],ax
0x008419da: movzx  r9d,WORD PTR [rbx+0x10]
0x008419df: movzx  r8d,WORD PTR [rbx+0x1a]
0x008419e4: movzx  edx,WORD PTR [rbx+0x18]
0x008419e8: movzx  ecx,WORD PTR [rbx+0x16]
0x008419ec: call   0x14074f220
0x008419f1: mov    rcx,rdi
0x008419f4: cmp    WORD PTR [rbx+0x20],si
0x008419f8: je     0x140841a3c
0x008419fa: mov    r8d,0x9
0x00841a00: lea    rdx,[rip+0xe6f9b9]        # 0x1416b13c0 ; literal=" holding "
0x00841a07: call   0x14006fa10
0x00841a0c: mov    QWORD PTR [rsp+0x30],rdi
0x00841a11: movzx  eax,WORD PTR [rbx+0x24]
0x00841a15: mov    WORD PTR [rsp+0x28],ax
0x00841a1a: movzx  eax,WORD PTR [rbx+0x22]
0x00841a1e: mov    WORD PTR [rsp+0x20],ax
0x00841a23: movzx  r9d,WORD PTR [rbx+0x20]
0x00841a28: movzx  r8d,WORD PTR [rbx+0x1a]
0x00841a2d: movzx  edx,WORD PTR [rbx+0x18]
0x00841a31: movzx  ecx,WORD PTR [rbx+0x16]
0x00841a35: call   0x14074f220
0x00841a3a: jmp    0x140841a4e
0x00841a3c: mov    r8d,0xf
0x00841a42: lea    rdx,[rip+0xe6f9a7]        # 0x1416b13f0 ; literal=" releasing hold"
0x00841a49: call   0x14006fa10
0x00841a4e: movzx  r9d,WORD PTR [rbx+0x14]
0x00841a53: movzx  esi,WORD PTR [rbx+0x12]
0x00841a57: movzx  r8d,si
0x00841a5b: movzx  edx,WORD PTR [rbx+0x10]
0x00841a5f: lea    rcx,[rip+0x1b8fa8a]        # 0x1423d14f0
0x00841a66: call   0x140067f80
0x00841a6b: movzx  ecx,ax
0x00841a6e: sub    ecx,0x1
0x00841a71: je     0x140841a82
0x00841a73: sub    ecx,0x1f
0x00841a76: je     0x140841a82
0x00841a78: sub    ecx,0x3
0x00841a7b: je     0x140841a82
0x00841a7d: cmp    ecx,0x7
0x00841a80: jne    0x140841ac7
0x00841a82: movzx  r8d,si
0x00841a86: movzx  edx,WORD PTR [rbx+0x10]
0x00841a8a: lea    rcx,[rip+0x1b8fa5f]        # 0x1423d14f0
0x00841a91: call   0x140247d80
0x00841a96: cmp    al,0x6
0x00841a98: jg     0x140841ac7
0x00841a9a: movzx  r8d,si
0x00841a9e: movzx  edx,WORD PTR [rbx+0x10]
0x00841aa2: lea    rcx,[rip+0x1b8fa47]        # 0x1423d14f0
0x00841aa9: call   0x1402c3a90
0x00841aae: cmp    al,0x6
0x00841ab0: jg     0x140841ac7
0x00841ab2: mov    r8d,0x4
0x00841ab8: lea    rdx,[rip+0xe6f879]        # 0x1416b1338 ; literal="/Air"
0x00841abf: mov    rcx,rdi
0x00841ac2: call   0x14006fa10
0x00841ac7: movzx  r9d,WORD PTR [rbx+0x14]
0x00841acc: movzx  r8d,WORD PTR [rbx+0x12]
0x00841ad1: movzx  edx,WORD PTR [rbx+0x10]
0x00841ad5: lea    rcx,[rip+0x1b8fa14]        # 0x1423d14f0
0x00841adc: call   0x140247d80
0x00841ae1: test   al,al
0x00841ae3: jle    0x140841afa
0x00841ae5: mov    r8d,0x6
0x00841aeb: lea    rdx,[rip+0xe6f862]        # 0x1416b1354 ; literal="/Water"
0x00841af2: mov    rcx,rdi
0x00841af5: call   0x14006fa10
0x00841afa: movzx  r9d,WORD PTR [rbx+0x14]
0x00841aff: movzx  r8d,WORD PTR [rbx+0x12]
0x00841b04: movzx  edx,WORD PTR [rbx+0x10]
0x00841b08: lea    rcx,[rip+0x1b8f9e1]        # 0x1423d14f0
0x00841b0f: call   0x1402c3a90
0x00841b14: test   al,al
0x00841b16: jle    0x140841b71
0x00841b18: mov    r8d,0x1
0x00841b1e: lea    rdx,[rip+0xda99ef]        # 0x1415eb514 ; literal="/"
0x00841b25: mov    rcx,rdi
0x00841b28: call   0x14006fa10
0x00841b2d: movzx  r9d,WORD PTR [rbx+0x14]
0x00841b32: movzx  r8d,WORD PTR [rbx+0x12]
0x00841b37: movzx  edx,WORD PTR [rbx+0x10]
0x00841b3b: lea    rcx,[rip+0x1b8f9ae]        # 0x1423d14f0
0x00841b42: call   0x14007dc40
0x00841b47: mov    rcx,rdi
0x00841b4a: bt     eax,0xf
0x00841b4e: jb     0x140841b5f
0x00841b50: mov    r8d,0x4
0x00841b56: lea    rdx,[rip+0xe6f7ef]        # 0x1416b134c ; literal="Lava"
0x00841b5d: jmp    0x140841b6c
0x00841b5f: mov    r8d,0x5
0x00841b65: lea    rdx,[rip+0xdb5838]        # 0x1415f73a4 ; literal="Magma"
0x00841b6c: call   0x14006fa10
0x00841b71: mov    r8d,0x1
0x00841b77: lea    rdx,[rip+0xdd3a02]        # 0x141615580 ; literal=")"
0x00841b7e: mov    rcx,rdi
0x00841b81: call   0x14006fa10
0x00841b86: nop
0x00841b87: mov    rdx,QWORD PTR [rsp+0x58]
0x00841b8c: cmp    rdx,0xf
0x00841b90: jbe    0x140841bc7
0x00841b92: inc    rdx
0x00841b95: mov    rcx,QWORD PTR [rsp+0x40]
0x00841b9a: mov    rax,rcx
0x00841b9d: cmp    rdx,0x1000
0x00841ba4: jb     0x140841bc2
0x00841ba6: add    rdx,0x27
0x00841baa: mov    rcx,QWORD PTR [rcx-0x8]
0x00841bae: sub    rax,rcx
0x00841bb1: add    rax,0xfffffffffffffff8
0x00841bb5: cmp    rax,0x1f
0x00841bb9: jbe    0x140841bc2
0x00841bbb: call   QWORD PTR [rip+0xda3f67]        # 0x1415e5b28
0x00841bc1: int3
0x00841bc2: call   0x141539680
0x00841bc7: mov    rcx,QWORD PTR [rsp+0x60]
0x00841bcc: xor    rcx,rsp
0x00841bcf: call   0x141539660
0x00841bd4: lea    r11,[rsp+0x70]
0x00841bd9: mov    rbx,QWORD PTR [r11+0x20]
0x00841bdd: mov    rsi,QWORD PTR [r11+0x28]
0x00841be1: mov    rsp,r11
0x00841be4: pop    rdi
0x00841be5: ret

# steam PE:6a70a6d9:02711000; adventure_movement_hold_tilest+8; RVA 0x841bf0..0x841ef7
0x00841bf0: mov    QWORD PTR [rsp+0x18],rbx
0x00841bf5: mov    QWORD PTR [rsp+0x20],rdi
0x00841bfa: push   r14
0x00841bfc: sub    rsp,0x70
0x00841c00: mov    rax,QWORD PTR [rip+0x105a439]        # 0x14189c040
0x00841c07: xor    rax,rsp
0x00841c0a: mov    QWORD PTR [rsp+0x60],rax
0x00841c0f: mov    rdi,rdx
0x00841c12: mov    rbx,rcx
0x00841c15: movzx  r9d,WORD PTR [rcx+0x24]
0x00841c1a: mov    r8d,0xa
0x00841c20: mov    r14d,0x5
0x00841c26: cmp    r9w,WORD PTR [rcx+0x14]
0x00841c2b: cmovle r8d,r14d
0x00841c2f: lea    rcx,[rip+0xe6f75a]        # 0x1416b1390 ; literal="Hold "
0x00841c36: lea    rdx,[rip+0xe6f7a3]        # 0x1416b13e0 ; literal="Hang from "
0x00841c3d: cmovle rdx,rcx
0x00841c41: mov    rcx,rdi
0x00841c44: call   0x14006f8d0
0x00841c49: xorps  xmm0,xmm0
0x00841c4c: movups XMMWORD PTR [rsp+0x40],xmm0
0x00841c51: mov    QWORD PTR [rsp+0x50],0x0
0x00841c5a: mov    QWORD PTR [rsp+0x58],0xf
0x00841c63: mov    BYTE PTR [rsp+0x40],0x0
0x00841c68: mov    BYTE PTR [rsp+0x28],0x0
0x00841c6d: movzx  eax,WORD PTR [rbx+0x24]
0x00841c71: mov    WORD PTR [rsp+0x20],ax
0x00841c76: movzx  r9d,WORD PTR [rbx+0x22]
0x00841c7b: movzx  r8d,WORD PTR [rbx+0x20]
0x00841c80: lea    rdx,[rsp+0x40]
0x00841c85: lea    rcx,[rip+0x1b8f864]        # 0x1423d14f0
0x00841c8c: call   0x140e7d330
0x00841c91: lea    rdx,[rsp+0x40]
0x00841c96: cmp    QWORD PTR [rsp+0x58],0xf
0x00841c9c: cmova  rdx,QWORD PTR [rsp+0x40]
0x00841ca2: mov    r8,QWORD PTR [rsp+0x50]
0x00841ca7: mov    rcx,rdi
0x00841caa: call   0x14006fa10
0x00841caf: mov    eax,0xffff8ad0
0x00841cb4: cmp    WORD PTR [rbx+0x16],ax
0x00841cb8: je     0x140841e97
0x00841cbe: mov    r8d,0x2
0x00841cc4: lea    rdx,[rip+0xdd3875]        # 0x141615540 ; literal=" ("
0x00841ccb: mov    rcx,rdi
0x00841cce: call   0x14006fa10
0x00841cd3: mov    QWORD PTR [rsp+0x30],rdi
0x00841cd8: movzx  eax,WORD PTR [rbx+0x24]
0x00841cdc: mov    WORD PTR [rsp+0x28],ax
0x00841ce1: movzx  eax,WORD PTR [rbx+0x22]
0x00841ce5: mov    WORD PTR [rsp+0x20],ax
0x00841cea: movzx  r9d,WORD PTR [rbx+0x20]
0x00841cef: movzx  r8d,WORD PTR [rbx+0x1a]
0x00841cf4: movzx  edx,WORD PTR [rbx+0x18]
0x00841cf8: movzx  ecx,WORD PTR [rbx+0x16]
0x00841cfc: call   0x14074f220
0x00841d01: movzx  eax,WORD PTR [rbx+0x10]
0x00841d05: cmp    WORD PTR [rbx+0x16],ax
0x00841d09: jne    0x140841d1f
0x00841d0b: movzx  eax,WORD PTR [rbx+0x12]
0x00841d0f: cmp    WORD PTR [rbx+0x18],ax
0x00841d13: jne    0x140841d1f
0x00841d15: movzx  eax,WORD PTR [rbx+0x14]
0x00841d19: cmp    WORD PTR [rbx+0x1a],ax
0x00841d1d: je     0x140841d62
0x00841d1f: mov    r8d,0x6
0x00841d25: lea    rdx,[rip+0xdabc50]        # 0x1415ed97c ; literal=" from "
0x00841d2c: mov    rcx,rdi
0x00841d2f: call   0x14006fa10
0x00841d34: mov    QWORD PTR [rsp+0x30],rdi
0x00841d39: movzx  eax,WORD PTR [rbx+0x14]
0x00841d3d: mov    WORD PTR [rsp+0x28],ax
0x00841d42: movzx  eax,WORD PTR [rbx+0x12]
0x00841d46: mov    WORD PTR [rsp+0x20],ax
0x00841d4b: movzx  r9d,WORD PTR [rbx+0x10]
0x00841d50: movzx  r8d,WORD PTR [rbx+0x1a]
0x00841d55: movzx  edx,WORD PTR [rbx+0x18]
0x00841d59: movzx  ecx,WORD PTR [rbx+0x16]
0x00841d5d: call   0x14074f220
0x00841d62: movzx  r9d,WORD PTR [rbx+0x14]
0x00841d67: movzx  r8d,WORD PTR [rbx+0x12]
0x00841d6c: movzx  edx,WORD PTR [rbx+0x10]
0x00841d70: lea    rcx,[rip+0x1b8f779]        # 0x1423d14f0
0x00841d77: call   0x140067f80
0x00841d7c: movzx  ecx,ax
0x00841d7f: sub    ecx,0x1
0x00841d82: je     0x140841d93
0x00841d84: sub    ecx,0x1f
0x00841d87: je     0x140841d93
0x00841d89: sub    ecx,0x3
0x00841d8c: je     0x140841d93
0x00841d8e: cmp    ecx,0x7
0x00841d91: jne    0x140841dda
0x00841d93: movzx  r8d,WORD PTR [rbx+0x12]
0x00841d98: movzx  edx,WORD PTR [rbx+0x10]
0x00841d9c: lea    rcx,[rip+0x1b8f74d]        # 0x1423d14f0
0x00841da3: call   0x140247d80
0x00841da8: cmp    al,0x6
0x00841daa: jg     0x140841dda
0x00841dac: movzx  r8d,WORD PTR [rbx+0x12]
0x00841db1: movzx  edx,WORD PTR [rbx+0x10]
0x00841db5: lea    rcx,[rip+0x1b8f734]        # 0x1423d14f0
0x00841dbc: call   0x1402c3a90
0x00841dc1: cmp    al,0x6
0x00841dc3: jg     0x140841dda
0x00841dc5: mov    r8d,0x4
0x00841dcb: lea    rdx,[rip+0xe6f566]        # 0x1416b1338 ; literal="/Air"
0x00841dd2: mov    rcx,rdi
0x00841dd5: call   0x14006fa10
0x00841dda: movzx  r9d,WORD PTR [rbx+0x14]
0x00841ddf: movzx  r8d,WORD PTR [rbx+0x12]
0x00841de4: movzx  edx,WORD PTR [rbx+0x10]
0x00841de8: lea    rcx,[rip+0x1b8f701]        # 0x1423d14f0
0x00841def: call   0x140247d80
0x00841df4: test   al,al
0x00841df6: jle    0x140841e0d
0x00841df8: mov    r8d,0x6
0x00841dfe: lea    rdx,[rip+0xe6f54f]        # 0x1416b1354 ; literal="/Water"
0x00841e05: mov    rcx,rdi
0x00841e08: call   0x14006fa10
0x00841e0d: movzx  r9d,WORD PTR [rbx+0x14]
0x00841e12: movzx  r8d,WORD PTR [rbx+0x12]
0x00841e17: movzx  edx,WORD PTR [rbx+0x10]
0x00841e1b: lea    rcx,[rip+0x1b8f6ce]        # 0x1423d14f0
0x00841e22: call   0x1402c3a90
0x00841e27: test   al,al
0x00841e29: jle    0x140841e81
0x00841e2b: mov    r8d,0x1
0x00841e31: lea    rdx,[rip+0xda96dc]        # 0x1415eb514 ; literal="/"
0x00841e38: mov    rcx,rdi
0x00841e3b: call   0x14006fa10
0x00841e40: movzx  r9d,WORD PTR [rbx+0x14]
0x00841e45: movzx  r8d,WORD PTR [rbx+0x12]
0x00841e4a: movzx  edx,WORD PTR [rbx+0x10]
0x00841e4e: lea    rcx,[rip+0x1b8f69b]        # 0x1423d14f0
0x00841e55: call   0x14007dc40
0x00841e5a: mov    rcx,rdi
0x00841e5d: bt     eax,0xf
0x00841e61: jb     0x140841e72
0x00841e63: mov    r8d,0x4
0x00841e69: lea    rdx,[rip+0xe6f4dc]        # 0x1416b134c ; literal="Lava"
0x00841e70: jmp    0x140841e7c
0x00841e72: mov    r8,r14
0x00841e75: lea    rdx,[rip+0xdb5528]        # 0x1415f73a4 ; literal="Magma"
0x00841e7c: call   0x14006fa10
0x00841e81: mov    r8d,0x1
0x00841e87: lea    rdx,[rip+0xdd36f2]        # 0x141615580 ; literal=")"
0x00841e8e: mov    rcx,rdi
0x00841e91: call   0x14006fa10
0x00841e96: nop
0x00841e97: mov    rdx,QWORD PTR [rsp+0x58]
0x00841e9c: cmp    rdx,0xf
0x00841ea0: jbe    0x140841ed7
0x00841ea2: inc    rdx
0x00841ea5: mov    rcx,QWORD PTR [rsp+0x40]
0x00841eaa: mov    rax,rcx
0x00841ead: cmp    rdx,0x1000
0x00841eb4: jb     0x140841ed2
0x00841eb6: add    rdx,0x27
0x00841eba: mov    rcx,QWORD PTR [rcx-0x8]
0x00841ebe: sub    rax,rcx
0x00841ec1: add    rax,0xfffffffffffffff8
0x00841ec5: cmp    rax,0x1f
0x00841ec9: jbe    0x140841ed2
0x00841ecb: call   QWORD PTR [rip+0xda3c57]        # 0x1415e5b28
0x00841ed1: int3
0x00841ed2: call   0x141539680
0x00841ed7: mov    rcx,QWORD PTR [rsp+0x60]
0x00841edc: xor    rcx,rsp
0x00841edf: call   0x141539660
0x00841ee4: lea    r11,[rsp+0x70]
0x00841ee9: mov    rbx,QWORD PTR [r11+0x20]
0x00841eed: mov    rdi,QWORD PTR [r11+0x28]
0x00841ef1: mov    rsp,r11
0x00841ef4: pop    r14
0x00841ef6: ret

# steam PE:6a70a6d9:02711000; adventure_movement_mountst+8; RVA 0x841f00..0x842041
0x00841f00: mov    QWORD PTR [rsp+0x18],rbx
0x00841f05: push   rdi
0x00841f06: sub    rsp,0x70
0x00841f0a: mov    rax,QWORD PTR [rip+0x105a12f]        # 0x14189c040
0x00841f11: xor    rax,rsp
0x00841f14: mov    QWORD PTR [rsp+0x60],rax
0x00841f19: mov    rdi,rdx
0x00841f1c: mov    rbx,rcx
0x00841f1f: mov    r8d,0x6
0x00841f25: lea    rdx,[rip+0xe6f45c]        # 0x1416b1388 ; literal="Mount "
0x00841f2c: mov    rcx,rdi
0x00841f2f: call   0x14006f8d0
0x00841f34: xorps  xmm0,xmm0
0x00841f37: movups XMMWORD PTR [rsp+0x40],xmm0
0x00841f3c: mov    QWORD PTR [rsp+0x50],0x0
0x00841f45: mov    QWORD PTR [rsp+0x58],0xf
0x00841f4e: mov    BYTE PTR [rsp+0x40],0x0
0x00841f53: xor    r8d,r8d
0x00841f56: lea    rdx,[rsp+0x40]
0x00841f5b: mov    rcx,QWORD PTR [rbx+0x20]
0x00841f5f: call   0x141330c30
0x00841f64: lea    rdx,[rsp+0x40]
0x00841f69: cmp    QWORD PTR [rsp+0x58],0xf
0x00841f6f: cmova  rdx,QWORD PTR [rsp+0x40]
0x00841f75: mov    r8,QWORD PTR [rsp+0x50]
0x00841f7a: mov    rcx,rdi
0x00841f7d: call   0x14006fa10
0x00841f82: mov    eax,0xffff8ad0
0x00841f87: cmp    WORD PTR [rbx+0x16],ax
0x00841f8b: je     0x140841fe6
0x00841f8d: mov    r8d,0x2
0x00841f93: lea    rdx,[rip+0xdd35a6]        # 0x141615540 ; literal=" ("
0x00841f9a: mov    rcx,rdi
0x00841f9d: call   0x14006fa10
0x00841fa2: mov    QWORD PTR [rsp+0x30],rdi
0x00841fa7: movzx  eax,WORD PTR [rbx+0x14]
0x00841fab: mov    WORD PTR [rsp+0x28],ax
0x00841fb0: movzx  eax,WORD PTR [rbx+0x12]
0x00841fb4: mov    WORD PTR [rsp+0x20],ax
0x00841fb9: movzx  r9d,WORD PTR [rbx+0x10]
0x00841fbe: movzx  r8d,WORD PTR [rbx+0x1a]
0x00841fc3: movzx  edx,WORD PTR [rbx+0x18]
0x00841fc7: movzx  ecx,WORD PTR [rbx+0x16]
0x00841fcb: call   0x14074f220
0x00841fd0: mov    r8d,0x1
0x00841fd6: lea    rdx,[rip+0xdd35a3]        # 0x141615580 ; literal=")"
0x00841fdd: mov    rcx,rdi
0x00841fe0: call   0x14006fa10
0x00841fe5: nop
0x00841fe6: mov    rdx,QWORD PTR [rsp+0x58]
0x00841feb: cmp    rdx,0xf
0x00841fef: jbe    0x140842026
0x00841ff1: inc    rdx
0x00841ff4: mov    rcx,QWORD PTR [rsp+0x40]
0x00841ff9: mov    rax,rcx
0x00841ffc: cmp    rdx,0x1000
0x00842003: jb     0x140842021
0x00842005: add    rdx,0x27
0x00842009: mov    rcx,QWORD PTR [rcx-0x8]
0x0084200d: sub    rax,rcx
0x00842010: add    rax,0xfffffffffffffff8
0x00842014: cmp    rax,0x1f
0x00842018: jbe    0x140842021
0x0084201a: call   QWORD PTR [rip+0xda3b08]        # 0x1415e5b28
0x00842020: int3
0x00842021: call   0x141539680
0x00842026: mov    rcx,QWORD PTR [rsp+0x60]
0x0084202b: xor    rcx,rsp
0x0084202e: call   0x141539660
0x00842033: mov    rbx,QWORD PTR [rsp+0x90]
0x0084203b: add    rsp,0x70
0x0084203f: pop    rdi
0x00842040: ret

# steam PE:6a70a6d9:02711000; adventure_movement_dismountst+8; RVA 0x842050..0x8421a9
0x00842050: mov    QWORD PTR [rsp+0x18],rbx
0x00842055: push   rdi
0x00842056: sub    rsp,0x70
0x0084205a: mov    rax,QWORD PTR [rip+0x1059fdf]        # 0x14189c040
0x00842061: xor    rax,rsp
0x00842064: mov    QWORD PTR [rsp+0x60],rax
0x00842069: mov    rdi,rdx
0x0084206c: mov    rbx,rcx
0x0084206f: mov    r8d,0xc
0x00842075: lea    rdx,[rip+0xe6f334]        # 0x1416b13b0 ; literal="Dismount to "
0x0084207c: mov    rcx,rdi
0x0084207f: call   0x14006f8d0
0x00842084: xorps  xmm0,xmm0
0x00842087: movups XMMWORD PTR [rsp+0x40],xmm0
0x0084208c: mov    QWORD PTR [rsp+0x50],0x0
0x00842095: mov    QWORD PTR [rsp+0x58],0xf
0x0084209e: mov    BYTE PTR [rsp+0x40],0x0
0x008420a3: mov    BYTE PTR [rsp+0x28],0x0
0x008420a8: movzx  eax,WORD PTR [rbx+0x14]
0x008420ac: mov    WORD PTR [rsp+0x20],ax
0x008420b1: movzx  r9d,WORD PTR [rbx+0x12]
0x008420b6: movzx  r8d,WORD PTR [rbx+0x10]
0x008420bb: lea    rdx,[rsp+0x40]
0x008420c0: lea    rcx,[rip+0x1b8f429]        # 0x1423d14f0
0x008420c7: call   0x140e7d330
0x008420cc: lea    rdx,[rsp+0x40]
0x008420d1: cmp    QWORD PTR [rsp+0x58],0xf
0x008420d7: cmova  rdx,QWORD PTR [rsp+0x40]
0x008420dd: mov    r8,QWORD PTR [rsp+0x50]
0x008420e2: mov    rcx,rdi
0x008420e5: call   0x14006fa10
0x008420ea: mov    eax,0xffff8ad0
0x008420ef: cmp    WORD PTR [rbx+0x16],ax
0x008420f3: je     0x14084214e
0x008420f5: mov    r8d,0x2
0x008420fb: lea    rdx,[rip+0xdd343e]        # 0x141615540 ; literal=" ("
0x00842102: mov    rcx,rdi
0x00842105: call   0x14006fa10
0x0084210a: mov    QWORD PTR [rsp+0x30],rdi
0x0084210f: movzx  eax,WORD PTR [rbx+0x14]
0x00842113: mov    WORD PTR [rsp+0x28],ax
0x00842118: movzx  eax,WORD PTR [rbx+0x12]
0x0084211c: mov    WORD PTR [rsp+0x20],ax
0x00842121: movzx  r9d,WORD PTR [rbx+0x10]
0x00842126: movzx  r8d,WORD PTR [rbx+0x1a]
0x0084212b: movzx  edx,WORD PTR [rbx+0x18]
0x0084212f: movzx  ecx,WORD PTR [rbx+0x16]
0x00842133: call   0x14074f220
0x00842138: mov    r8d,0x1
0x0084213e: lea    rdx,[rip+0xdd343b]        # 0x141615580 ; literal=")"
0x00842145: mov    rcx,rdi
0x00842148: call   0x14006fa10
0x0084214d: nop
0x0084214e: mov    rdx,QWORD PTR [rsp+0x58]
0x00842153: cmp    rdx,0xf
0x00842157: jbe    0x14084218e
0x00842159: inc    rdx
0x0084215c: mov    rcx,QWORD PTR [rsp+0x40]
0x00842161: mov    rax,rcx
0x00842164: cmp    rdx,0x1000
0x0084216b: jb     0x140842189
0x0084216d: add    rdx,0x27
0x00842171: mov    rcx,QWORD PTR [rcx-0x8]
0x00842175: sub    rax,rcx
0x00842178: add    rax,0xfffffffffffffff8
0x0084217c: cmp    rax,0x1f
0x00842180: jbe    0x140842189
0x00842182: call   QWORD PTR [rip+0xda39a0]        # 0x1415e5b28
0x00842188: int3
0x00842189: call   0x141539680
0x0084218e: mov    rcx,QWORD PTR [rsp+0x60]
0x00842193: xor    rcx,rsp
0x00842196: call   0x141539660
0x0084219b: mov    rbx,QWORD PTR [rsp+0x90]
0x008421a3: add    rsp,0x70
0x008421a7: pop    rdi
0x008421a8: ret

# steam PE:6a70a6d9:02711000; adventure_movement_release_hold_tilest+8; RVA 0x8421b0..0x8422a6
0x008421b0: mov    QWORD PTR [rsp+0x18],rbx
0x008421b5: push   rdi
0x008421b6: sub    rsp,0x60
0x008421ba: mov    rax,QWORD PTR [rip+0x1059e7f]        # 0x14189c040
0x008421c1: xor    rax,rsp
0x008421c4: mov    QWORD PTR [rsp+0x50],rax
0x008421c9: mov    rdi,rdx
0x008421cc: mov    rbx,rcx
0x008421cf: mov    r8d,0x10
0x008421d5: lea    rdx,[rip+0xe6f1bc]        # 0x1416b1398 ; literal="Release hold on "
0x008421dc: mov    rcx,rdi
0x008421df: call   0x14006f8d0
0x008421e4: xorps  xmm0,xmm0
0x008421e7: movups XMMWORD PTR [rsp+0x30],xmm0
0x008421ec: mov    QWORD PTR [rsp+0x40],0x0
0x008421f5: mov    QWORD PTR [rsp+0x48],0xf
0x008421fe: mov    BYTE PTR [rsp+0x30],0x0
0x00842203: mov    BYTE PTR [rsp+0x28],0x0
0x00842208: movzx  eax,WORD PTR [rbx+0x14]
0x0084220c: mov    WORD PTR [rsp+0x20],ax
0x00842211: movzx  r9d,WORD PTR [rbx+0x12]
0x00842216: movzx  r8d,WORD PTR [rbx+0x10]
0x0084221b: lea    rdx,[rsp+0x30]
0x00842220: lea    rcx,[rip+0x1b8f2c9]        # 0x1423d14f0
0x00842227: call   0x140e7d330
0x0084222c: lea    rdx,[rsp+0x30]
0x00842231: cmp    QWORD PTR [rsp+0x48],0xf
0x00842237: cmova  rdx,QWORD PTR [rsp+0x30]
0x0084223d: mov    r8,QWORD PTR [rsp+0x40]
0x00842242: mov    rcx,rdi
0x00842245: call   0x14006fa10
0x0084224a: nop
0x0084224b: mov    rdx,QWORD PTR [rsp+0x48]
0x00842250: cmp    rdx,0xf
0x00842254: jbe    0x14084228b
0x00842256: inc    rdx
0x00842259: mov    rcx,QWORD PTR [rsp+0x30]
0x0084225e: mov    rax,rcx
0x00842261: cmp    rdx,0x1000
0x00842268: jb     0x140842286
0x0084226a: add    rdx,0x27
0x0084226e: mov    rcx,QWORD PTR [rcx-0x8]
0x00842272: sub    rax,rcx
0x00842275: add    rax,0xfffffffffffffff8
0x00842279: cmp    rax,0x1f
0x0084227d: jbe    0x140842286
0x0084227f: call   QWORD PTR [rip+0xda38a3]        # 0x1415e5b28
0x00842285: int3
0x00842286: call   0x141539680
0x0084228b: mov    rcx,QWORD PTR [rsp+0x50]
0x00842290: xor    rcx,rsp
0x00842293: call   0x141539660
0x00842298: mov    rbx,QWORD PTR [rsp+0x80]
0x008422a0: add    rsp,0x60
0x008422a4: pop    rdi
0x008422a5: ret

# steam PE:6a70a6d9:02711000; adventure_movement_hold_itemst+8; RVA 0x8422b0..0x8425a4
0x008422b0: mov    QWORD PTR [rsp+0x18],rbx
0x008422b5: mov    QWORD PTR [rsp+0x20],rsi
0x008422ba: push   rdi
0x008422bb: sub    rsp,0x70
0x008422bf: mov    rax,QWORD PTR [rip+0x1059d7a]        # 0x14189c040
0x008422c6: xor    rax,rsp
0x008422c9: mov    QWORD PTR [rsp+0x60],rax
0x008422ce: mov    rsi,rdx
0x008422d1: mov    rdi,rcx
0x008422d4: mov    r8d,0x5
0x008422da: lea    rdx,[rip+0xe3af73]        # 0x14167d254 ; literal="Climb"
0x008422e1: mov    rcx,rsi
0x008422e4: call   0x14006f8d0
0x008422e9: mov    r10d,DWORD PTR [rdi+0x20]
0x008422ed: mov    r8,QWORD PTR [rip+0x1ba3164]        # 0x1423e5458
0x008422f4: mov    r11,QWORD PTR [rip+0x1ba3155]        # 0x1423e5450
0x008422fb: sub    r8,r11
0x008422fe: sar    r8,0x3
0x00842302: test   r8d,r8d
0x00842305: je     0x140842347
0x00842307: cmp    r10d,0xffffffff
0x0084230b: je     0x140842347
0x0084230d: xor    edx,edx
0x0084230f: sub    r8d,0x1
0x00842313: js     0x140842347
0x00842315: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00842320: lea    ecx,[rdx+r8*1]
0x00842324: sar    ecx,1
0x00842326: movsxd rax,ecx
0x00842329: mov    rbx,QWORD PTR [r11+rax*8]
0x0084232d: cmp    DWORD PTR [rbx+0x1c],r10d
0x00842331: je     0x140842349
0x00842333: lea    eax,[rcx+0x1]
0x00842336: cmovle edx,eax
0x00842339: lea    eax,[rcx-0x1]
0x0084233c: cmovle eax,r8d
0x00842340: mov    r8d,eax
0x00842343: cmp    edx,eax
0x00842345: jle    0x140842320
0x00842347: xor    ebx,ebx
0x00842349: test   rbx,rbx
0x0084234c: je     0x1408423fb
0x00842352: mov    r8d,0x1
0x00842358: lea    rdx,[rip+0xda63dd]        # 0x1415e873c ; literal=" "
0x0084235f: mov    rcx,rsi
0x00842362: call   0x14006fa10
0x00842367: xorps  xmm0,xmm0
0x0084236a: movups XMMWORD PTR [rsp+0x40],xmm0
0x0084236f: mov    QWORD PTR [rsp+0x50],0x0
0x00842378: mov    QWORD PTR [rsp+0x58],0xf
0x00842381: mov    BYTE PTR [rsp+0x40],0x0
0x00842386: mov    r9d,0xffffffff
0x0084238c: xor    r8d,r8d
0x0084238f: lea    rdx,[rsp+0x40]
0x00842394: mov    rcx,rbx
0x00842397: call   0x140c65450
0x0084239c: lea    rdx,[rsp+0x40]
0x008423a1: cmp    QWORD PTR [rsp+0x58],0xf
0x008423a7: cmova  rdx,QWORD PTR [rsp+0x40]
0x008423ad: mov    r8,QWORD PTR [rsp+0x50]
0x008423b2: mov    rcx,rsi
0x008423b5: call   0x14006fa10
0x008423ba: nop
0x008423bb: mov    rdx,QWORD PTR [rsp+0x58]
0x008423c0: cmp    rdx,0xf
0x008423c4: jbe    0x1408423fb
0x008423c6: inc    rdx
0x008423c9: mov    rcx,QWORD PTR [rsp+0x40]
0x008423ce: mov    rax,rcx
0x008423d1: cmp    rdx,0x1000
0x008423d8: jb     0x1408423f6
0x008423da: add    rdx,0x27
0x008423de: mov    rcx,QWORD PTR [rcx-0x8]
0x008423e2: sub    rax,rcx
0x008423e5: add    rax,0xfffffffffffffff8
0x008423e9: cmp    rax,0x1f
0x008423ed: jbe    0x1408423f6
0x008423ef: call   QWORD PTR [rip+0xda3733]        # 0x1415e5b28
0x008423f5: int3
0x008423f6: call   0x141539680
0x008423fb: mov    eax,0xffff8ad0
0x00842400: cmp    WORD PTR [rdi+0x16],ax
0x00842404: je     0x140842585
0x0084240a: mov    r8d,0x2
0x00842410: lea    rdx,[rip+0xdd3129]        # 0x141615540 ; literal=" ("
0x00842417: mov    rcx,rsi
0x0084241a: call   0x14006fa10
0x0084241f: mov    QWORD PTR [rsp+0x30],rsi
0x00842424: movzx  eax,WORD PTR [rdi+0x14]
0x00842428: mov    WORD PTR [rsp+0x28],ax
0x0084242d: movzx  eax,WORD PTR [rdi+0x12]
0x00842431: mov    WORD PTR [rsp+0x20],ax
0x00842436: movzx  r9d,WORD PTR [rdi+0x10]
0x0084243b: movzx  r8d,WORD PTR [rdi+0x1a]
0x00842440: movzx  edx,WORD PTR [rdi+0x18]
0x00842444: movzx  ecx,WORD PTR [rdi+0x16]
0x00842448: call   0x14074f220
0x0084244d: movzx  r9d,WORD PTR [rdi+0x14]
0x00842452: movzx  ebx,WORD PTR [rdi+0x12]
0x00842456: movzx  r8d,bx
0x0084245a: movzx  edx,WORD PTR [rdi+0x10]
0x0084245e: lea    rcx,[rip+0x1b8f08b]        # 0x1423d14f0
0x00842465: call   0x140067f80
0x0084246a: movzx  ecx,ax
0x0084246d: sub    ecx,0x1
0x00842470: je     0x140842481
0x00842472: sub    ecx,0x1f
0x00842475: je     0x140842481
0x00842477: sub    ecx,0x3
0x0084247a: je     0x140842481
0x0084247c: cmp    ecx,0x7
0x0084247f: jne    0x1408424c6
0x00842481: movzx  r8d,bx
0x00842485: movzx  edx,WORD PTR [rdi+0x10]
0x00842489: lea    rcx,[rip+0x1b8f060]        # 0x1423d14f0
0x00842490: call   0x140247d80
0x00842495: cmp    al,0x6
0x00842497: jg     0x1408424c6
0x00842499: movzx  r8d,bx
0x0084249d: movzx  edx,WORD PTR [rdi+0x10]
0x008424a1: lea    rcx,[rip+0x1b8f048]        # 0x1423d14f0
0x008424a8: call   0x1402c3a90
0x008424ad: cmp    al,0x6
0x008424af: jg     0x1408424c6
0x008424b1: mov    r8d,0x4
0x008424b7: lea    rdx,[rip+0xe6ee7a]        # 0x1416b1338 ; literal="/Air"
0x008424be: mov    rcx,rsi
0x008424c1: call   0x14006fa10
0x008424c6: movzx  r9d,WORD PTR [rdi+0x14]
0x008424cb: movzx  r8d,WORD PTR [rdi+0x12]
0x008424d0: movzx  edx,WORD PTR [rdi+0x10]
0x008424d4: lea    rcx,[rip+0x1b8f015]        # 0x1423d14f0
0x008424db: call   0x140247d80
0x008424e0: test   al,al
0x008424e2: jle    0x1408424f9
0x008424e4: mov    r8d,0x6
0x008424ea: lea    rdx,[rip+0xe6ee63]        # 0x1416b1354 ; literal="/Water"
0x008424f1: mov    rcx,rsi
0x008424f4: call   0x14006fa10
0x008424f9: movzx  r9d,WORD PTR [rdi+0x14]
0x008424fe: movzx  r8d,WORD PTR [rdi+0x12]
0x00842503: movzx  edx,WORD PTR [rdi+0x10]
0x00842507: lea    rcx,[rip+0x1b8efe2]        # 0x1423d14f0
0x0084250e: call   0x1402c3a90
0x00842513: test   al,al
0x00842515: jle    0x140842570
0x00842517: mov    r8d,0x1
0x0084251d: lea    rdx,[rip+0xda8ff0]        # 0x1415eb514 ; literal="/"
0x00842524: mov    rcx,rsi
0x00842527: call   0x14006fa10
0x0084252c: movzx  r9d,WORD PTR [rdi+0x14]
0x00842531: movzx  r8d,WORD PTR [rdi+0x12]
0x00842536: movzx  edx,WORD PTR [rdi+0x10]
0x0084253a: lea    rcx,[rip+0x1b8efaf]        # 0x1423d14f0
0x00842541: call   0x14007dc40
0x00842546: mov    rcx,rsi
0x00842549: bt     eax,0xf
0x0084254d: jb     0x14084255e
0x0084254f: mov    r8d,0x4
0x00842555: lea    rdx,[rip+0xe6edf0]        # 0x1416b134c ; literal="Lava"
0x0084255c: jmp    0x14084256b
0x0084255e: mov    r8d,0x5
0x00842564: lea    rdx,[rip+0xdb4e39]        # 0x1415f73a4 ; literal="Magma"
0x0084256b: call   0x14006fa10
0x00842570: mov    r8d,0x1
0x00842576: lea    rdx,[rip+0xdd3003]        # 0x141615580 ; literal=")"
0x0084257d: mov    rcx,rsi
0x00842580: call   0x14006fa10
0x00842585: mov    rcx,QWORD PTR [rsp+0x60]
0x0084258a: xor    rcx,rsp
0x0084258d: call   0x141539660
0x00842592: lea    r11,[rsp+0x70]
0x00842597: mov    rbx,QWORD PTR [r11+0x20]
0x0084259b: mov    rsi,QWORD PTR [r11+0x28]
0x0084259f: mov    rsp,r11
0x008425a2: pop    rdi
0x008425a3: ret

# steam PE:6a70a6d9:02711000; adventure_movement_claim_petst+8; RVA 0x8425b0..0x842706
0x008425b0: mov    QWORD PTR [rsp+0x18],rbx
0x008425b5: push   rdi
0x008425b6: sub    rsp,0x70
0x008425ba: mov    rax,QWORD PTR [rip+0x1059a7f]        # 0x14189c040
0x008425c1: xor    rax,rsp
0x008425c4: mov    QWORD PTR [rsp+0x60],rax
0x008425c9: mov    rdi,rdx
0x008425cc: mov    rbx,rcx
0x008425cf: mov    r8d,0x6
0x008425d5: lea    rdx,[rip+0xe6ec5c]        # 0x1416b1238 ; literal="Claim "
0x008425dc: mov    rcx,rdi
0x008425df: call   0x14006f8d0
0x008425e4: xorps  xmm0,xmm0
0x008425e7: movups XMMWORD PTR [rsp+0x40],xmm0
0x008425ec: mov    QWORD PTR [rsp+0x50],0x0
0x008425f5: mov    QWORD PTR [rsp+0x58],0xf
0x008425fe: mov    BYTE PTR [rsp+0x40],0x0
0x00842603: xor    r8d,r8d
0x00842606: lea    rdx,[rsp+0x40]
0x0084260b: mov    rcx,QWORD PTR [rbx+0x20]
0x0084260f: call   0x141330c30
0x00842614: lea    rdx,[rsp+0x40]
0x00842619: cmp    QWORD PTR [rsp+0x58],0xf
0x0084261f: cmova  rdx,QWORD PTR [rsp+0x40]
0x00842625: mov    r8,QWORD PTR [rsp+0x50]
0x0084262a: mov    rcx,rdi
0x0084262d: call   0x14006fa10
0x00842632: mov    eax,0xffff8ad0
0x00842637: cmp    WORD PTR [rbx+0x16],ax
0x0084263b: je     0x140842695
0x0084263d: mov    r8d,0x2
0x00842643: lea    rdx,[rip+0xdd2ef6]        # 0x141615540 ; literal=" ("
0x0084264a: mov    rcx,rdi
0x0084264d: call   0x14006fa10
0x00842652: mov    QWORD PTR [rsp+0x30],rdi
0x00842657: movzx  eax,WORD PTR [rbx+0x14]
0x0084265b: mov    WORD PTR [rsp+0x28],ax
0x00842660: movzx  eax,WORD PTR [rbx+0x12]
0x00842664: mov    WORD PTR [rsp+0x20],ax
0x00842669: movzx  r9d,WORD PTR [rbx+0x10]
0x0084266e: movzx  r8d,WORD PTR [rbx+0x1a]
0x00842673: movzx  edx,WORD PTR [rbx+0x18]
0x00842677: movzx  ecx,WORD PTR [rbx+0x16]
0x0084267b: call   0x14074f220
0x00842680: mov    r8d,0x1
0x00842686: lea    rdx,[rip+0xdd2ef3]        # 0x141615580 ; literal=")"
0x0084268d: mov    rcx,rdi
0x00842690: call   0x14006fa10
0x00842695: mov    r8d,0x7
0x0084269b: lea    rdx,[rip+0xe6eb8e]        # 0x1416b1230 ; literal=" as pet"
0x008426a2: mov    rcx,rdi
0x008426a5: call   0x14006fa10
0x008426aa: nop
0x008426ab: mov    rdx,QWORD PTR [rsp+0x58]
0x008426b0: cmp    rdx,0xf
0x008426b4: jbe    0x1408426eb
0x008426b6: inc    rdx
0x008426b9: mov    rcx,QWORD PTR [rsp+0x40]
0x008426be: mov    rax,rcx
0x008426c1: cmp    rdx,0x1000
0x008426c8: jb     0x1408426e6
0x008426ca: add    rdx,0x27
0x008426ce: mov    rcx,QWORD PTR [rcx-0x8]
0x008426d2: sub    rax,rcx
0x008426d5: add    rax,0xfffffffffffffff8
0x008426d9: cmp    rax,0x1f
0x008426dd: jbe    0x1408426e6
0x008426df: call   QWORD PTR [rip+0xda3443]        # 0x1415e5b28
0x008426e5: int3
0x008426e6: call   0x141539680
0x008426eb: mov    rcx,QWORD PTR [rsp+0x60]
0x008426f0: xor    rcx,rsp
0x008426f3: call   0x141539660
0x008426f8: mov    rbx,QWORD PTR [rsp+0x90]
0x00842700: add    rsp,0x70
0x00842704: pop    rdi
0x00842705: ret

# steam PE:6a70a6d9:02711000; adventure_movement_lead_animalst+8; RVA 0x842710..0x842851
0x00842710: mov    QWORD PTR [rsp+0x18],rbx
0x00842715: push   rdi
0x00842716: sub    rsp,0x70
0x0084271a: mov    rax,QWORD PTR [rip+0x105991f]        # 0x14189c040
0x00842721: xor    rax,rsp
0x00842724: mov    QWORD PTR [rsp+0x60],rax
0x00842729: mov    rdi,rdx
0x0084272c: mov    rbx,rcx
0x0084272f: mov    r8d,0x5
0x00842735: lea    rdx,[rip+0xda63c0]        # 0x1415e8afc ; literal="Lead "
0x0084273c: mov    rcx,rdi
0x0084273f: call   0x14006f8d0
0x00842744: xorps  xmm0,xmm0
0x00842747: movups XMMWORD PTR [rsp+0x40],xmm0
0x0084274c: mov    QWORD PTR [rsp+0x50],0x0
0x00842755: mov    QWORD PTR [rsp+0x58],0xf
0x0084275e: mov    BYTE PTR [rsp+0x40],0x0
0x00842763: xor    r8d,r8d
0x00842766: lea    rdx,[rsp+0x40]
0x0084276b: mov    rcx,QWORD PTR [rbx+0x20]
0x0084276f: call   0x141330c30
0x00842774: lea    rdx,[rsp+0x40]
0x00842779: cmp    QWORD PTR [rsp+0x58],0xf
0x0084277f: cmova  rdx,QWORD PTR [rsp+0x40]
0x00842785: mov    r8,QWORD PTR [rsp+0x50]
0x0084278a: mov    rcx,rdi
0x0084278d: call   0x14006fa10
0x00842792: mov    eax,0xffff8ad0
0x00842797: cmp    WORD PTR [rbx+0x16],ax
0x0084279b: je     0x1408427f6
0x0084279d: mov    r8d,0x2
0x008427a3: lea    rdx,[rip+0xdd2d96]        # 0x141615540 ; literal=" ("
0x008427aa: mov    rcx,rdi
0x008427ad: call   0x14006fa10
0x008427b2: mov    QWORD PTR [rsp+0x30],rdi
0x008427b7: movzx  eax,WORD PTR [rbx+0x14]
0x008427bb: mov    WORD PTR [rsp+0x28],ax
0x008427c0: movzx  eax,WORD PTR [rbx+0x12]
0x008427c4: mov    WORD PTR [rsp+0x20],ax
0x008427c9: movzx  r9d,WORD PTR [rbx+0x10]
0x008427ce: movzx  r8d,WORD PTR [rbx+0x1a]
0x008427d3: movzx  edx,WORD PTR [rbx+0x18]
0x008427d7: movzx  ecx,WORD PTR [rbx+0x16]
0x008427db: call   0x14074f220
0x008427e0: mov    r8d,0x1
0x008427e6: lea    rdx,[rip+0xdd2d93]        # 0x141615580 ; literal=")"
0x008427ed: mov    rcx,rdi
0x008427f0: call   0x14006fa10
0x008427f5: nop
0x008427f6: mov    rdx,QWORD PTR [rsp+0x58]
0x008427fb: cmp    rdx,0xf
0x008427ff: jbe    0x140842836
0x00842801: inc    rdx
0x00842804: mov    rcx,QWORD PTR [rsp+0x40]
0x00842809: mov    rax,rcx
0x0084280c: cmp    rdx,0x1000
0x00842813: jb     0x140842831
0x00842815: add    rdx,0x27
0x00842819: mov    rcx,QWORD PTR [rcx-0x8]
0x0084281d: sub    rax,rcx
0x00842820: add    rax,0xfffffffffffffff8
0x00842824: cmp    rax,0x1f
0x00842828: jbe    0x140842831
0x0084282a: call   QWORD PTR [rip+0xda32f8]        # 0x1415e5b28
0x00842830: int3
0x00842831: call   0x141539680
0x00842836: mov    rcx,QWORD PTR [rsp+0x60]
0x0084283b: xor    rcx,rsp
0x0084283e: call   0x141539660
0x00842843: mov    rbx,QWORD PTR [rsp+0x90]
0x0084284b: add    rsp,0x70
0x0084284f: pop    rdi
0x00842850: ret

# steam PE:6a70a6d9:02711000; adventure_movement_stop_lead_animalst+8; RVA 0x842860..0x84293b
0x00842860: mov    QWORD PTR [rsp+0x18],rbx
0x00842865: push   rdi
0x00842866: sub    rsp,0x50
0x0084286a: mov    rax,QWORD PTR [rip+0x10597cf]        # 0x14189c040
0x00842871: xor    rax,rsp
0x00842874: mov    QWORD PTR [rsp+0x40],rax
0x00842879: mov    rdi,rdx
0x0084287c: mov    rbx,rcx
0x0084287f: mov    r8d,0xd
0x00842885: lea    rdx,[rip+0xe6e9c4]        # 0x1416b1250 ; literal="Stop leading "
0x0084288c: mov    rcx,rdi
0x0084288f: call   0x14006f8d0
0x00842894: xorps  xmm0,xmm0
0x00842897: movups XMMWORD PTR [rsp+0x20],xmm0
0x0084289c: mov    QWORD PTR [rsp+0x30],0x0
0x008428a5: mov    QWORD PTR [rsp+0x38],0xf
0x008428ae: mov    BYTE PTR [rsp+0x20],0x0
0x008428b3: xor    r8d,r8d
0x008428b6: lea    rdx,[rsp+0x20]
0x008428bb: mov    rcx,QWORD PTR [rbx+0x20]
0x008428bf: call   0x141330c30
0x008428c4: lea    rdx,[rsp+0x20]
0x008428c9: cmp    QWORD PTR [rsp+0x38],0xf
0x008428cf: cmova  rdx,QWORD PTR [rsp+0x20]
0x008428d5: mov    r8,QWORD PTR [rsp+0x30]
0x008428da: mov    rcx,rdi
0x008428dd: call   0x14006fa10
0x008428e2: nop
0x008428e3: mov    rdx,QWORD PTR [rsp+0x38]
0x008428e8: cmp    rdx,0xf
0x008428ec: jbe    0x140842923
0x008428ee: inc    rdx
0x008428f1: mov    rcx,QWORD PTR [rsp+0x20]
0x008428f6: mov    rax,rcx
0x008428f9: cmp    rdx,0x1000
0x00842900: jb     0x14084291e
0x00842902: add    rdx,0x27
0x00842906: mov    rcx,QWORD PTR [rcx-0x8]
0x0084290a: sub    rax,rcx
0x0084290d: add    rax,0xfffffffffffffff8
0x00842911: cmp    rax,0x1f
0x00842915: jbe    0x14084291e
0x00842917: call   QWORD PTR [rip+0xda320b]        # 0x1415e5b28
0x0084291d: int3
0x0084291e: call   0x141539680
0x00842923: mov    rcx,QWORD PTR [rsp+0x40]
0x00842928: xor    rcx,rsp
0x0084292b: call   0x141539660
0x00842930: mov    rbx,QWORD PTR [rsp+0x70]
0x00842935: add    rsp,0x50
0x00842939: pop    rdi
0x0084293a: ret

# steam PE:6a70a6d9:02711000; adventure_movement_release_hold_itemst+8; RVA 0x842940..0x842aa3
0x00842940: mov    QWORD PTR [rsp+0x8],rbx
0x00842945: push   rdi
0x00842946: sub    rsp,0x50
0x0084294a: mov    rax,QWORD PTR [rip+0x10596ef]        # 0x14189c040
0x00842951: xor    rax,rsp
0x00842954: mov    QWORD PTR [rsp+0x40],rax
0x00842959: mov    rdi,rdx
0x0084295c: mov    r8d,0xa
0x00842962: lea    rdx,[rip+0xe6e8d7]        # 0x1416b1240 ; literal="Climb down"
0x00842969: mov    rcx,rdi
0x0084296c: call   0x14006f8d0
0x00842971: mov    rax,QWORD PTR [rip+0x1ba2798]        # 0x1423e5110
0x00842978: mov    r10d,DWORD PTR [rax+0x4d4]
0x0084297f: mov    r9,QWORD PTR [rip+0x1ba2ad2]        # 0x1423e5458
0x00842986: mov    r11,QWORD PTR [rip+0x1ba2ac3]        # 0x1423e5450
0x0084298d: sub    r9,r11
0x00842990: sar    r9,0x3
0x00842994: test   r9d,r9d
0x00842997: je     0x1408429d7
0x00842999: cmp    r10d,0xffffffff
0x0084299d: je     0x1408429d7
0x0084299f: xor    edx,edx
0x008429a1: sub    r9d,0x1
0x008429a5: js     0x1408429d7
0x008429a7: nop    WORD PTR [rax+rax*1+0x0]
0x008429b0: lea    ecx,[rdx+r9*1]
0x008429b4: sar    ecx,1
0x008429b6: movsxd rax,ecx
0x008429b9: mov    rbx,QWORD PTR [r11+rax*8]
0x008429bd: cmp    DWORD PTR [rbx+0x1c],r10d
0x008429c1: je     0x1408429d9
0x008429c3: lea    eax,[rcx+0x1]
0x008429c6: cmovle edx,eax
0x008429c9: lea    eax,[rcx-0x1]
0x008429cc: cmovle eax,r9d
0x008429d0: mov    r9d,eax
0x008429d3: cmp    edx,eax
0x008429d5: jle    0x1408429b0
0x008429d7: xor    ebx,ebx
0x008429d9: test   rbx,rbx
0x008429dc: je     0x140842a8b
0x008429e2: mov    r8d,0x6
0x008429e8: lea    rdx,[rip+0xdaaf8d]        # 0x1415ed97c ; literal=" from "
0x008429ef: mov    rcx,rdi
0x008429f2: call   0x14006fa10
0x008429f7: xorps  xmm0,xmm0
0x008429fa: movups XMMWORD PTR [rsp+0x20],xmm0
0x008429ff: mov    QWORD PTR [rsp+0x30],0x0
0x00842a08: mov    QWORD PTR [rsp+0x38],0xf
0x00842a11: mov    BYTE PTR [rsp+0x20],0x0
0x00842a16: mov    r9d,0xffffffff
0x00842a1c: xor    r8d,r8d
0x00842a1f: lea    rdx,[rsp+0x20]
0x00842a24: mov    rcx,rbx
0x00842a27: call   0x140c65450
0x00842a2c: lea    rdx,[rsp+0x20]
0x00842a31: cmp    QWORD PTR [rsp+0x38],0xf
0x00842a37: cmova  rdx,QWORD PTR [rsp+0x20]
0x00842a3d: mov    r8,QWORD PTR [rsp+0x30]
0x00842a42: mov    rcx,rdi
0x00842a45: call   0x14006fa10
0x00842a4a: nop
0x00842a4b: mov    rdx,QWORD PTR [rsp+0x38]
0x00842a50: cmp    rdx,0xf
0x00842a54: jbe    0x140842a8b
0x00842a56: inc    rdx
0x00842a59: mov    rcx,QWORD PTR [rsp+0x20]
0x00842a5e: mov    rax,rcx
0x00842a61: cmp    rdx,0x1000
0x00842a68: jb     0x140842a86
0x00842a6a: add    rdx,0x27
0x00842a6e: mov    rcx,QWORD PTR [rcx-0x8]
0x00842a72: sub    rax,rcx
0x00842a75: add    rax,0xfffffffffffffff8
0x00842a79: cmp    rax,0x1f
0x00842a7d: jbe    0x140842a86
0x00842a7f: call   QWORD PTR [rip+0xda30a3]        # 0x1415e5b28
0x00842a85: int3
0x00842a86: call   0x141539680
0x00842a8b: mov    rcx,QWORD PTR [rsp+0x40]
0x00842a90: xor    rcx,rsp
0x00842a93: call   0x141539660
0x00842a98: mov    rbx,QWORD PTR [rsp+0x60]
0x00842a9d: add    rsp,0x50
0x00842aa1: pop    rdi
0x00842aa2: ret

# steam PE:6a70a6d9:02711000; adventure_movement_pathst+8; RVA 0x842ab0..0x842bcc
0x00842ab0: mov    QWORD PTR [rsp+0x8],rbx
0x00842ab5: push   rdi
0x00842ab6: sub    rsp,0x20
0x00842aba: movzx  eax,BYTE PTR [rcx+0x23]
0x00842abe: mov    rbx,rcx
0x00842ac1: mov    rdi,rdx
0x00842ac4: test   al,al
0x00842ac6: mov    ecx,0xc
0x00842acb: lea    rdx,[rip+0xe6e72e]        # 0x1416b1200 ; literal="Go below hatch"
0x00842ad2: mov    r8d,0xe
0x00842ad8: cmove  r8d,ecx
0x00842adc: lea    rcx,[rip+0xe6e70d]        # 0x1416b11f0 ; literal="Path to here"
0x00842ae3: cmove  rdx,rcx
0x00842ae7: mov    rcx,rdi
0x00842aea: call   0x14006f8d0
0x00842aef: cmp    BYTE PTR [rbx+0x22],0x0
0x00842af3: jne    0x140842b0a
0x00842af5: mov    r8d,0x16
0x00842afb: lea    rdx,[rip+0xe6e716]        # 0x1416b1218 ; literal=" (no climbing/jumping)"
0x00842b02: mov    rcx,rdi
0x00842b05: call   0x14006fa10
0x00842b0a: movzx  eax,WORD PTR [rbx+0x14]
0x00842b0e: cmp    WORD PTR [rbx+0x20],ax
0x00842b12: je     0x140842bc1
0x00842b18: mov    r8d,0x2
0x00842b1e: lea    rdx,[rip+0xdd2a1b]        # 0x141615540 ; literal=" ("
0x00842b25: mov    rcx,rdi
0x00842b28: call   0x14006fa10
0x00842b2d: movsx  edx,WORD PTR [rbx+0x20]
0x00842b31: movsx  eax,WORD PTR [rbx+0x14]
0x00842b35: sub    edx,eax
0x00842b37: mov    ecx,edx
0x00842b39: neg    ecx
0x00842b3b: cmovs  ecx,edx
0x00842b3e: mov    rdx,rdi
0x00842b41: call   0x14052c130
0x00842b46: mov    r8d,0x6
0x00842b4c: lea    rdx,[rip+0xe6e6bd]        # 0x1416b1210 ; literal=" level"
0x00842b53: mov    rcx,rdi
0x00842b56: call   0x14006fa10
0x00842b5b: movsx  eax,WORD PTR [rbx+0x14]
0x00842b5f: movsx  ecx,WORD PTR [rbx+0x20]
0x00842b63: sub    ecx,eax
0x00842b65: mov    eax,ecx
0x00842b67: neg    eax
0x00842b69: cmovs  eax,ecx
0x00842b6c: cmp    eax,0x1
0x00842b6f: jle    0x140842b86
0x00842b71: mov    r8d,0x1
0x00842b77: lea    rdx,[rip+0xda671a]        # 0x1415e9298 ; literal="s"
0x00842b7e: mov    rcx,rdi
0x00842b81: call   0x14006fa10
0x00842b86: movzx  eax,WORD PTR [rbx+0x20]
0x00842b8a: mov    rcx,rdi
0x00842b8d: cmp    WORD PTR [rbx+0x14],ax
0x00842b91: jle    0x140842baf
0x00842b93: mov    r8d,0x4
0x00842b99: lea    rdx,[rip+0xe6e75c]        # 0x1416b12fc ; literal=" up)"
0x00842ba0: mov    rbx,QWORD PTR [rsp+0x30]
0x00842ba5: add    rsp,0x20
0x00842ba9: pop    rdi
0x00842baa: jmp    0x14006fa10
0x00842baf: mov    r8d,0x6
0x00842bb5: lea    rdx,[rip+0xe6e738]        # 0x1416b12f4 ; literal=" down)"
0x00842bbc: call   0x14006fa10
0x00842bc1: mov    rbx,QWORD PTR [rsp+0x30]
0x00842bc6: add    rsp,0x20
0x00842bca: pop    rdi
0x00842bcb: ret

# steam PE:6a70a6d9:02711000; chooser-renderer; RVA 0x884460..0x885768
0x00884460: rex push rbp
0x00884462: push   rbx
0x00884463: push   rsi
0x00884464: push   rdi
0x00884465: push   r12
0x00884467: push   r13
0x00884469: push   r14
0x0088446b: push   r15
0x0088446d: lea    rbp,[rsp-0x8]
0x00884472: sub    rsp,0x108
0x00884479: movaps XMMWORD PTR [rsp+0xf0],xmm6
0x00884481: mov    rax,QWORD PTR [rip+0x1017bb8]        # 0x14189c040
0x00884488: xor    rax,rsp
0x0088448b: mov    QWORD PTR [rbp-0x18],rax
0x0088448f: mov    DWORD PTR [rsp+0x6c],edx
0x00884493: mov    r10,rcx
0x00884496: mov    QWORD PTR [rsp+0x50],rcx
0x0088449b: mov    DWORD PTR [rsp+0x48],0xffffffff
0x008844a3: mov    DWORD PTR [rsp+0x5c],0xffffffff
0x008844ab: cmp    BYTE PTR [rip+0x1b0c123],0x0        # 0x1423905d5
0x008844b2: je     0x1408844c8
0x008844b4: mov    eax,DWORD PTR [rip+0x1dc60f6]        # 0x14264a5b0
0x008844ba: mov    DWORD PTR [rsp+0x48],eax
0x008844be: mov    eax,DWORD PTR [rip+0x1dc60f0]        # 0x14264a5b4
0x008844c4: mov    DWORD PTR [rsp+0x5c],eax
0x008844c8: lea    eax,[r9+r8*1]
0x008844cc: cdq
0x008844cd: sub    eax,edx
0x008844cf: sar    eax,1
0x008844d1: lea    r14d,[rax-0x23]
0x008844d5: mov    DWORD PTR [rsp+0x44],r14d
0x008844da: lea    edi,[rax+0x23]
0x008844dd: mov    r12d,0x14
0x008844e3: mov    edx,DWORD PTR [rip+0x1b4929f]        # 0x1423cd788
0x008844e9: lea    r13d,[rdx-0x5]
0x008844ed: mov    r15d,r13d
0x008844f0: mov    DWORD PTR [rsp+0x40],r13d
0x008844f5: mov    ecx,0x27
0x008844fa: mov    rax,QWORD PTR [r10+0x20]
0x008844fe: sub    rax,QWORD PTR [r10+0x18]
0x00884502: sar    rax,0x3
0x00884506: add    eax,0x2
0x00884509: lea    eax,[rax+rax*2]
0x0088450c: cmp    eax,ecx
0x0088450e: cmovl  ecx,eax
0x00884511: lea    eax,[r13-0x13]
0x00884515: cmp    eax,ecx
0x00884517: jle    0x140884522
0x00884519: mov    r12d,r13d
0x0088451c: sub    r12d,ecx
0x0088451f: inc    r12d
0x00884522: mov    eax,DWORD PTR [r10+0x4]
0x00884526: cmp    eax,0x3
0x00884529: je     0x140884530
0x0088452b: cmp    eax,0x6
0x0088452e: jne    0x14088459a
0x00884530: mov    eax,DWORD PTR [r10+0x10]
0x00884534: lea    r14d,[rax+0x4]
0x00884538: mov    DWORD PTR [rsp+0x44],r14d
0x0088453d: lea    edi,[r14+0x46]
0x00884541: mov    r12d,DWORD PTR [r10+0x14]
0x00884545: sub    r12d,0x2
0x00884549: lea    r15d,[rcx+r12*1]
0x0088454d: mov    DWORD PTR [rsp+0x40],r15d
0x00884552: cmp    edi,DWORD PTR [rip+0x1b4922c]        # 0x1423cd784
0x00884558: jl     0x140884566
0x0088455a: lea    edi,[rax-0x4]
0x0088455d: lea    r14d,[rdi-0x46]
0x00884561: mov    DWORD PTR [rsp+0x44],r14d
0x00884566: cmp    r15d,r13d
0x00884569: jle    0x14088457e
0x0088456b: mov    eax,r15d
0x0088456e: sub    eax,edx
0x00884570: add    eax,0x5
0x00884573: sub    r12d,eax
0x00884576: sub    r15d,eax
0x00884579: mov    DWORD PTR [rsp+0x40],r15d
0x0088457e: cmp    r12d,0x4
0x00884582: jge    0x14088459a
0x00884584: mov    eax,0x4
0x00884589: sub    eax,r12d
0x0088458c: mov    r12d,0x4
0x00884592: add    r15d,eax
0x00884595: mov    DWORD PTR [rsp+0x40],r15d
0x0088459a: cmp    BYTE PTR [r10+0x38],0x0
0x0088459f: je     0x140884e78
0x008845a5: lea    r15d,[rdx-0x13]
0x008845a9: mov    esi,r15d
0x008845ac: cmp    r15d,r13d
0x008845af: jg     0x14088468a
0x008845b5: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x008845c0: mov    ebx,r14d
0x008845c3: cmp    r14d,edi
0x008845c6: jg     0x14088467a
0x008845cc: nop    DWORD PTR [rax+0x0]
0x008845d0: mov    DWORD PTR [rip+0x1dc5e9e],ebx        # 0x14264a474
0x008845d6: mov    DWORD PTR [rip+0x1dc5e9c],esi        # 0x14264a478
0x008845dc: xor    r8d,r8d
0x008845df: xor    edx,edx
0x008845e1: lea    rcx,[rip+0x1dc5e08]        # 0x14264a3f0
0x008845e8: call   0x1400bb190
0x008845ed: cmp    esi,r15d
0x008845f0: jne    0x14088461a
0x008845f2: cmp    ebx,r14d
0x008845f5: jne    0x1408845ff
0x008845f7: mov    edx,DWORD PTR [rip+0x1dc7717]        # 0x14264bd14
0x008845fd: jmp    0x140884664
0x008845ff: lea    rcx,[rip+0x1dc5dea]        # 0x14264a3f0
0x00884606: cmp    ebx,edi
0x00884608: jne    0x140884612
0x0088460a: mov    edx,DWORD PTR [rip+0x1dc771c]        # 0x14264bd2c
0x00884610: jmp    0x14088466b
0x00884612: mov    edx,DWORD PTR [rip+0x1dc7708]        # 0x14264bd20
0x00884618: jmp    0x14088466b
0x0088461a: cmp    esi,r13d
0x0088461d: jne    0x140884647
0x0088461f: cmp    ebx,r14d
0x00884622: jne    0x14088462c
0x00884624: mov    edx,DWORD PTR [rip+0x1dc76f2]        # 0x14264bd1c
0x0088462a: jmp    0x140884664
0x0088462c: lea    rcx,[rip+0x1dc5dbd]        # 0x14264a3f0
0x00884633: cmp    ebx,edi
0x00884635: jne    0x14088463f
0x00884637: mov    edx,DWORD PTR [rip+0x1dc76f7]        # 0x14264bd34
0x0088463d: jmp    0x14088466b
0x0088463f: mov    edx,DWORD PTR [rip+0x1dc76e3]        # 0x14264bd28
0x00884645: jmp    0x14088466b
0x00884647: cmp    ebx,r14d
0x0088464a: jne    0x140884654
0x0088464c: mov    edx,DWORD PTR [rip+0x1dc76c6]        # 0x14264bd18
0x00884652: jmp    0x140884664
0x00884654: cmp    ebx,edi
0x00884656: mov    edx,DWORD PTR [rip+0x1dc76d4]        # 0x14264bd30
0x0088465c: je     0x140884664
0x0088465e: mov    edx,DWORD PTR [rip+0x1dc76c0]        # 0x14264bd24
0x00884664: lea    rcx,[rip+0x1dc5d85]        # 0x14264a3f0
0x0088466b: call   0x140adaad0
0x00884670: inc    ebx
0x00884672: cmp    ebx,edi
0x00884674: jle    0x1408845d0
0x0088467a: inc    esi
0x0088467c: cmp    esi,r13d
0x0088467f: jle    0x1408845c0
0x00884685: mov    r10,QWORD PTR [rsp+0x50]
0x0088468a: lea    esi,[r15+0x2]
0x0088468e: lea    ebx,[r15+0x6]
0x00884692: lea    r15d,[rbx-0x1]
0x00884696: mov    DWORD PTR [rsp+0x40],r15d
0x0088469b: lea    eax,[rdi-0x4]
0x0088469e: mov    DWORD PTR [rsp+0x5c],eax
0x008846a2: lea    eax,[r13-0x4]
0x008846a6: mov    DWORD PTR [rsp+0x44],eax
0x008846aa: lea    r13d,[r14+0x2]
0x008846ae: mov    DWORD PTR [rsp+0x48],r13d
0x008846b3: lea    eax,[rdi-0xd]
0x008846b6: mov    DWORD PTR [rsp+0x58],eax
0x008846ba: mov    DWORD PTR [rip+0x1dc5db8],0x1010007        # 0x14264a47c
0x008846c4: xorps  xmm0,xmm0
0x008846c7: movups XMMWORD PTR [rbp-0x60],xmm0
0x008846cb: movdqa xmm6,XMMWORD PTR [rip+0xf06a4d]        # 0x14178b120
0x008846d3: movdqu XMMWORD PTR [rbp-0x50],xmm6
0x008846d8: mov    BYTE PTR [rbp-0x60],0x0
0x008846dc: movsxd rcx,DWORD PTR [r10+0x3c]
0x008846e0: mov    rax,QWORD PTR [r10+0x18]
0x008846e4: mov    rcx,QWORD PTR [rax+rcx*8]
0x008846e8: mov    rax,QWORD PTR [rcx]
0x008846eb: call   QWORD PTR [rax+0x90]
0x008846f1: test   rax,rax
0x008846f4: je     0x1408847ce
0x008846fa: mov    r9d,0xffffffff
0x00884700: xor    r8d,r8d
0x00884703: lea    rdx,[rbp-0x60]
0x00884707: mov    rcx,rax
0x0088470a: call   0x140c65450
0x0088470f: mov    DWORD PTR [rip+0x1dc5d5e],r13d        # 0x14264a474
0x00884716: mov    DWORD PTR [rip+0x1dc5d5c],esi        # 0x14264a478
0x0088471c: xor    r9d,r9d
0x0088471f: lea    rdx,[rbp-0x60]
0x00884723: lea    rcx,[rip+0x1dc5cc6]        # 0x14264a3f0
0x0088472a: call   0x140ad9960
0x0088472f: mov    DWORD PTR [rip+0x1dc5d3e],r13d        # 0x14264a474
0x00884736: lea    eax,[rsi+0x1]
0x00884739: mov    DWORD PTR [rip+0x1dc5d39],eax        # 0x14264a478
0x0088473f: xorps  xmm0,xmm0
0x00884742: movups XMMWORD PTR [rbp-0x80],xmm0
0x00884746: xorps  xmm1,xmm1
0x00884749: movdqu XMMWORD PTR [rbp-0x70],xmm1
0x0088474e: mov    ecx,0x20
0x00884753: call   0x1400707d0
0x00884758: mov    QWORD PTR [rbp-0x80],rax
0x0088475c: movdqa xmm0,XMMWORD PTR [rip+0xf06b0c]        # 0x14178b270
0x00884764: movdqu XMMWORD PTR [rbp-0x70],xmm0
0x00884769: movups xmm0,XMMWORD PTR [rip+0xe2fe80]        # 0x1416b45f0 ; literal="Pick up how many? (0-"
0x00884770: movups XMMWORD PTR [rax],xmm0
0x00884773: mov    ecx,DWORD PTR [rip+0xe2fe87]        # 0x1416b4600 ; literal="? (0-"
0x00884779: mov    DWORD PTR [rax+0x10],ecx
0x0088477c: movzx  ecx,BYTE PTR [rip+0xe2fe81]        # 0x1416b4604 ; literal="-"
0x00884783: mov    BYTE PTR [rax+0x14],cl
0x00884786: mov    BYTE PTR [rax+0x15],0x0
0x0088478a: lea    rdx,[rbp-0x80]
0x0088478e: mov    rax,QWORD PTR [rsp+0x50]
0x00884793: mov    ecx,DWORD PTR [rax+0x40]
0x00884796: call   0x14052c130
0x0088479b: mov    r8d,0x1
0x008847a1: lea    rdx,[rip+0xd90dd8]        # 0x141615580 ; literal=")"
0x008847a8: lea    rcx,[rbp-0x80]
0x008847ac: call   0x14006fa10
0x008847b1: xor    r9d,r9d
0x008847b4: lea    rdx,[rbp-0x80]
0x008847b8: lea    rcx,[rip+0x1dc5c31]        # 0x14264a3f0
0x008847bf: call   0x140ad9960
0x008847c4: nop
0x008847c5: lea    rcx,[rbp-0x80]
0x008847c9: call   0x14006f850
0x008847ce: lea    eax,[rdi+r14*1]
0x008847d2: cdq
0x008847d3: sub    eax,edx
0x008847d5: sar    eax,1
0x008847d7: dec    eax
0x008847d9: mov    DWORD PTR [rip+0x1dc5c95],eax        # 0x14264a474
0x008847df: mov    DWORD PTR [rip+0x1dc5c93],ebx        # 0x14264a478
0x008847e5: xorps  xmm0,xmm0
0x008847e8: movups XMMWORD PTR [rbp-0x38],xmm0
0x008847ec: movdqu XMMWORD PTR [rbp-0x28],xmm6
0x008847f1: mov    BYTE PTR [rbp-0x38],0x0
0x008847f5: mov    rax,QWORD PTR [rsp+0x50]
0x008847fa: cmp    BYTE PTR [rax+0x48],0x0
0x008847fe: je     0x140884862
0x00884800: lea    rdx,[rax+0x50]
0x00884804: lea    rax,[rbp-0x38]
0x00884808: cmp    rax,rdx
0x0088480b: je     0x140884824
0x0088480d: mov    r8,QWORD PTR [rdx+0x10]
0x00884811: cmp    QWORD PTR [rdx+0x18],0xf
0x00884816: jbe    0x14088481b
0x00884818: mov    rdx,QWORD PTR [rdx]
0x0088481b: lea    rcx,[rbp-0x38]
0x0088481f: call   0x14006f8d0
0x00884824: call   QWORD PTR [rip+0xd609be]        # 0x1415e51e8
0x0088482a: mov    r9d,eax
0x0088482d: mov    eax,0x10624dd3
0x00884832: mul    r9d
0x00884835: shr    edx,0x6
0x00884838: imul   ecx,edx,0x3e8
0x0088483e: sub    r9d,ecx
0x00884841: cmp    r9d,0x1f4
0x00884848: jae    0x14088486e
0x0088484a: mov    r8d,0x1
0x00884850: lea    rdx,[rip+0xd67fd5]        # 0x1415ec82c ; literal="_"
0x00884857: lea    rcx,[rbp-0x38]
0x0088485b: call   0x14006fa10
0x00884860: jmp    0x14088486e
0x00884862: lea    rdx,[rbp-0x38]
0x00884866: mov    ecx,DWORD PTR [rax+0x44]
0x00884869: call   0x14052c2b0
0x0088486e: xor    r9d,r9d
0x00884871: lea    rdx,[rbp-0x38]
0x00884875: lea    rcx,[rip+0x1dc5b74]        # 0x14264a3f0
0x0088487c: call   0x140ad9960
0x00884881: lea    r14d,[rdi-0xb]
0x00884885: mov    esi,r15d
0x00884888: lea    rbx,[rip+0x1dcb3e1]        # 0x14264fc70
0x0088488f: lea    r15d,[rdi-0xa]
0x00884893: nop    DWORD PTR [rax+0x0]
0x00884897: nop    WORD PTR [rax+rax*1+0x0]
0x008848a0: lea    eax,[rdi-0xc]
0x008848a3: mov    DWORD PTR [rip+0x1dc5bcb],eax        # 0x14264a474
0x008848a9: mov    DWORD PTR [rip+0x1dc5bc9],esi        # 0x14264a478
0x008848af: mov    edx,DWORD PTR [rbx-0x18]
0x008848b2: lea    rcx,[rip+0x1dc5b37]        # 0x14264a3f0
0x008848b9: call   0x140adaad0
0x008848be: cmp    DWORD PTR [rip+0x1b48eb3],0x0        # 0x1423cd778
0x008848c5: jle    0x1408848e4
0x008848c7: mov    rax,QWORD PTR [rip+0x1b48ea2]        # 0x1423cd770
0x008848ce: test   BYTE PTR [rax],0x1
0x008848d1: je     0x1408848e4
0x008848d3: mov    r8b,0x1
0x008848d6: xor    edx,edx
0x008848d8: lea    rcx,[rip+0x1dc5b11]        # 0x14264a3f0
0x008848df: call   0x1400bb190
0x008848e4: mov    DWORD PTR [rip+0x1dc5b89],r14d        # 0x14264a474
0x008848eb: mov    DWORD PTR [rip+0x1dc5b87],esi        # 0x14264a478
0x008848f1: mov    edx,DWORD PTR [rbx-0xc]
0x008848f4: lea    rcx,[rip+0x1dc5af5]        # 0x14264a3f0
0x008848fb: call   0x140adaad0
0x00884900: cmp    DWORD PTR [rip+0x1b48e71],0x0        # 0x1423cd778
0x00884907: jle    0x140884926
0x00884909: mov    rax,QWORD PTR [rip+0x1b48e60]        # 0x1423cd770
0x00884910: test   BYTE PTR [rax],0x1
0x00884913: je     0x140884926
0x00884915: mov    r8b,0x1
0x00884918: xor    edx,edx
0x0088491a: lea    rcx,[rip+0x1dc5acf]        # 0x14264a3f0
0x00884921: call   0x1400bb190
0x00884926: mov    DWORD PTR [rip+0x1dc5b47],r15d        # 0x14264a474
0x0088492d: mov    DWORD PTR [rip+0x1dc5b45],esi        # 0x14264a478
0x00884933: mov    edx,DWORD PTR [rbx]
0x00884935: lea    rcx,[rip+0x1dc5ab4]        # 0x14264a3f0
0x0088493c: call   0x140adaad0
0x00884941: cmp    DWORD PTR [rip+0x1b48e30],0x0        # 0x1423cd778
0x00884948: jle    0x140884967
0x0088494a: mov    rax,QWORD PTR [rip+0x1b48e1f]        # 0x1423cd770
0x00884951: test   BYTE PTR [rax],0x1
0x00884954: je     0x140884967
0x00884956: mov    r8b,0x1
0x00884959: xor    edx,edx
0x0088495b: lea    rcx,[rip+0x1dc5a8e]        # 0x14264a3f0
0x00884962: call   0x1400bb190
0x00884967: lea    eax,[rdi-0x9]
0x0088496a: mov    DWORD PTR [rip+0x1dc5b04],eax        # 0x14264a474
0x00884970: mov    DWORD PTR [rip+0x1dc5b02],esi        # 0x14264a478
0x00884976: mov    edx,DWORD PTR [rbx+0xc]
0x00884979: lea    rcx,[rip+0x1dc5a70]        # 0x14264a3f0
0x00884980: call   0x140adaad0
0x00884985: cmp    DWORD PTR [rip+0x1b48dec],0x0        # 0x1423cd778
0x0088498c: jle    0x1408849ab
0x0088498e: mov    rax,QWORD PTR [rip+0x1b48ddb]        # 0x1423cd770
0x00884995: test   BYTE PTR [rax],0x1
0x00884998: je     0x1408849ab
0x0088499a: mov    r8b,0x1
0x0088499d: xor    edx,edx
0x0088499f: lea    rcx,[rip+0x1dc5a4a]        # 0x14264a3f0
0x008849a6: call   0x1400bb190
0x008849ab: inc    esi
0x008849ad: add    rbx,0x4
0x008849b1: lea    rax,[rip+0x1dcb2c4]        # 0x14264fc7c
0x008849b8: cmp    rbx,rax
0x008849bb: jl     0x1408848a0
0x008849c1: lea    r14d,[rdi-0x7]
0x008849c5: mov    esi,DWORD PTR [rsp+0x40]
0x008849c9: lea    rbx,[rip+0x1dcb2d0]        # 0x14264fca0
0x008849d0: lea    r12d,[rdi-0x6]
0x008849d4: lea    r13d,[rdi-0x5]
0x008849d8: lea    r15d,[rdi-0x8]
0x008849dc: nop    DWORD PTR [rax+0x0]
0x008849e0: mov    DWORD PTR [rip+0x1dc5a8d],r15d        # 0x14264a474
0x008849e7: mov    DWORD PTR [rip+0x1dc5a8b],esi        # 0x14264a478
0x008849ed: mov    edx,DWORD PTR [rbx-0x18]
0x008849f0: lea    rcx,[rip+0x1dc59f9]        # 0x14264a3f0
0x008849f7: call   0x140adaad0
0x008849fc: cmp    DWORD PTR [rip+0x1b48d75],0x0        # 0x1423cd778
0x00884a03: jle    0x140884a22
0x00884a05: mov    rax,QWORD PTR [rip+0x1b48d64]        # 0x1423cd770
0x00884a0c: test   BYTE PTR [rax],0x1
0x00884a0f: je     0x140884a22
0x00884a11: mov    r8b,0x1
0x00884a14: xor    edx,edx
0x00884a16: lea    rcx,[rip+0x1dc59d3]        # 0x14264a3f0
0x00884a1d: call   0x1400bb190
0x00884a22: mov    DWORD PTR [rip+0x1dc5a4b],r14d        # 0x14264a474
0x00884a29: mov    DWORD PTR [rip+0x1dc5a49],esi        # 0x14264a478
0x00884a2f: mov    edx,DWORD PTR [rbx-0xc]
0x00884a32: lea    rcx,[rip+0x1dc59b7]        # 0x14264a3f0
0x00884a39: call   0x140adaad0
0x00884a3e: cmp    DWORD PTR [rip+0x1b48d33],0x0        # 0x1423cd778
0x00884a45: jle    0x140884a64
0x00884a47: mov    rax,QWORD PTR [rip+0x1b48d22]        # 0x1423cd770
0x00884a4e: test   BYTE PTR [rax],0x1
0x00884a51: je     0x140884a64
0x00884a53: mov    r8b,0x1
0x00884a56: xor    edx,edx
0x00884a58: lea    rcx,[rip+0x1dc5991]        # 0x14264a3f0
0x00884a5f: call   0x1400bb190
0x00884a64: mov    DWORD PTR [rip+0x1dc5a09],r12d        # 0x14264a474
0x00884a6b: mov    DWORD PTR [rip+0x1dc5a07],esi        # 0x14264a478
0x00884a71: mov    edx,DWORD PTR [rbx]
0x00884a73: lea    rcx,[rip+0x1dc5976]        # 0x14264a3f0
0x00884a7a: call   0x140adaad0
0x00884a7f: cmp    DWORD PTR [rip+0x1b48cf2],0x0        # 0x1423cd778
0x00884a86: jle    0x140884aa5
0x00884a88: mov    rax,QWORD PTR [rip+0x1b48ce1]        # 0x1423cd770
0x00884a8f: test   BYTE PTR [rax],0x1
0x00884a92: je     0x140884aa5
0x00884a94: mov    r8b,0x1
0x00884a97: xor    edx,edx
0x00884a99: lea    rcx,[rip+0x1dc5950]        # 0x14264a3f0
0x00884aa0: call   0x1400bb190
0x00884aa5: mov    DWORD PTR [rip+0x1dc59c8],r13d        # 0x14264a474
0x00884aac: mov    DWORD PTR [rip+0x1dc59c6],esi        # 0x14264a478
0x00884ab2: mov    edx,DWORD PTR [rbx+0xc]
0x00884ab5: lea    rcx,[rip+0x1dc5934]        # 0x14264a3f0
0x00884abc: call   0x140adaad0
0x00884ac1: cmp    DWORD PTR [rip+0x1b48cb0],0x0        # 0x1423cd778
0x00884ac8: jle    0x140884ae7
0x00884aca: mov    rax,QWORD PTR [rip+0x1b48c9f]        # 0x1423cd770
0x00884ad1: test   BYTE PTR [rax],0x1
0x00884ad4: je     0x140884ae7
0x00884ad6: mov    r8b,0x1
0x00884ad9: xor    edx,edx
0x00884adb: lea    rcx,[rip+0x1dc590e]        # 0x14264a3f0
0x00884ae2: call   0x1400bb190
0x00884ae7: inc    esi
0x00884ae9: add    rbx,0x4
0x00884aed: lea    rax,[rip+0x1dcb1b8]        # 0x14264fcac
0x00884af4: cmp    rbx,rax
0x00884af7: jl     0x1408849e0
0x00884afd: lea    esi,[rdi-0x3]
0x00884b00: lea    r14d,[rdi-0x2]
0x00884b04: dec    edi
0x00884b06: lea    rbx,[rip+0x1dcb1c3]        # 0x14264fcd0
0x00884b0d: mov    r15d,DWORD PTR [rsp+0x40]
0x00884b12: mov    r13d,DWORD PTR [rsp+0x48]
0x00884b17: lea    r12d,[r13+0x9]
0x00884b1b: nop    DWORD PTR [rax+rax*1+0x0]
0x00884b20: mov    eax,DWORD PTR [rsp+0x5c]
0x00884b24: mov    DWORD PTR [rip+0x1dc594a],eax        # 0x14264a474
0x00884b2a: mov    DWORD PTR [rip+0x1dc5947],r15d        # 0x14264a478
0x00884b31: mov    edx,DWORD PTR [rbx-0x18]
0x00884b34: lea    rcx,[rip+0x1dc58b5]        # 0x14264a3f0
0x00884b3b: call   0x140adaad0
0x00884b40: cmp    DWORD PTR [rip+0x1b48c31],0x0        # 0x1423cd778
0x00884b47: jle    0x140884b66
0x00884b49: mov    rax,QWORD PTR [rip+0x1b48c20]        # 0x1423cd770
0x00884b50: test   BYTE PTR [rax],0x1
0x00884b53: je     0x140884b66
0x00884b55: mov    r8b,0x1
0x00884b58: xor    edx,edx
0x00884b5a: lea    rcx,[rip+0x1dc588f]        # 0x14264a3f0
0x00884b61: call   0x1400bb190
0x00884b66: mov    DWORD PTR [rip+0x1dc5908],esi        # 0x14264a474
0x00884b6c: mov    DWORD PTR [rip+0x1dc5905],r15d        # 0x14264a478
0x00884b73: mov    edx,DWORD PTR [rbx-0xc]
0x00884b76: lea    rcx,[rip+0x1dc5873]        # 0x14264a3f0
0x00884b7d: call   0x140adaad0
0x00884b82: cmp    DWORD PTR [rip+0x1b48bef],0x0        # 0x1423cd778
0x00884b89: jle    0x140884ba8
0x00884b8b: mov    rax,QWORD PTR [rip+0x1b48bde]        # 0x1423cd770
0x00884b92: test   BYTE PTR [rax],0x1
0x00884b95: je     0x140884ba8
0x00884b97: mov    r8b,0x1
0x00884b9a: xor    edx,edx
0x00884b9c: lea    rcx,[rip+0x1dc584d]        # 0x14264a3f0
0x00884ba3: call   0x1400bb190
0x00884ba8: mov    DWORD PTR [rip+0x1dc58c5],r14d        # 0x14264a474
0x00884baf: mov    DWORD PTR [rip+0x1dc58c2],r15d        # 0x14264a478
0x00884bb6: mov    edx,DWORD PTR [rbx]
0x00884bb8: lea    rcx,[rip+0x1dc5831]        # 0x14264a3f0
0x00884bbf: call   0x140adaad0
0x00884bc4: cmp    DWORD PTR [rip+0x1b48bad],0x0        # 0x1423cd778
0x00884bcb: jle    0x140884bea
0x00884bcd: mov    rax,QWORD PTR [rip+0x1b48b9c]        # 0x1423cd770
0x00884bd4: test   BYTE PTR [rax],0x1
0x00884bd7: je     0x140884bea
0x00884bd9: mov    r8b,0x1
0x00884bdc: xor    edx,edx
0x00884bde: lea    rcx,[rip+0x1dc580b]        # 0x14264a3f0
0x00884be5: call   0x1400bb190
0x00884bea: mov    DWORD PTR [rip+0x1dc5884],edi        # 0x14264a474
0x00884bf0: mov    DWORD PTR [rip+0x1dc5881],r15d        # 0x14264a478
0x00884bf7: mov    edx,DWORD PTR [rbx+0xc]
0x00884bfa: lea    rcx,[rip+0x1dc57ef]        # 0x14264a3f0
0x00884c01: call   0x140adaad0
0x00884c06: cmp    DWORD PTR [rip+0x1b48b6b],0x0        # 0x1423cd778
0x00884c0d: jle    0x140884c2c
0x00884c0f: mov    rax,QWORD PTR [rip+0x1b48b5a]        # 0x1423cd770
0x00884c16: test   BYTE PTR [rax],0x1
0x00884c19: je     0x140884c2c
0x00884c1b: mov    r8b,0x1
0x00884c1e: xor    edx,edx
0x00884c20: lea    rcx,[rip+0x1dc57c9]        # 0x14264a3f0
0x00884c27: call   0x1400bb190
0x00884c2c: inc    r15d
0x00884c2f: add    rbx,0x4
0x00884c33: lea    rax,[rip+0x1dcb0a2]        # 0x14264fcdc
0x00884c3a: cmp    rbx,rax
0x00884c3d: jl     0x140884b20
0x00884c43: mov    ebx,r13d
0x00884c46: mov    esi,DWORD PTR [rsp+0x44]
0x00884c4a: cmp    r13d,r12d
0x00884c4d: jg     0x140884cb3
0x00884c4f: lea    r15,[rip+0x1dcffb6]        # 0x142654c0c
0x00884c56: lea    r14,[rip+0x1dcffbb]        # 0x142654c18
0x00884c5d: nop    DWORD PTR [rax]
0x00884c60: mov    edi,esi
0x00884c62: mov    r11,r15
0x00884c65: data16 data16 nop WORD PTR [rax+rax*1+0x0]
0x00884c70: mov    DWORD PTR [rip+0x1dc57fe],ebx        # 0x14264a474
0x00884c76: mov    DWORD PTR [rip+0x1dc57fc],edi        # 0x14264a478
0x00884c7c: cmp    ebx,r13d
0x00884c7f: jne    0x140884c87
0x00884c81: mov    edx,DWORD PTR [r11-0x18]
0x00884c85: jmp    0x140884c95
0x00884c87: cmp    ebx,r12d
0x00884c8a: jne    0x140884c91
0x00884c8c: mov    edx,DWORD PTR [r11]
0x00884c8f: jmp    0x140884c95
0x00884c91: mov    edx,DWORD PTR [r11-0xc]
0x00884c95: lea    rcx,[rip+0x1dc5754]        # 0x14264a3f0
0x00884c9c: call   0x140adaad0
0x00884ca1: inc    edi
0x00884ca3: add    r11,0x4
0x00884ca7: cmp    r11,r14
0x00884caa: jl     0x140884c70
0x00884cac: inc    ebx
0x00884cae: cmp    ebx,r12d
0x00884cb1: jle    0x140884c60
0x00884cb3: mov    DWORD PTR [rip+0x1dc57bf],0x1010007        # 0x14264a47c
0x00884cbd: lea    eax,[r13+0x3]
0x00884cc1: mov    DWORD PTR [rip+0x1dc57ad],eax        # 0x14264a474
0x00884cc7: lea    r13d,[rsi+0x1]
0x00884ccb: mov    DWORD PTR [rsp+0x48],r13d
0x00884cd0: mov    DWORD PTR [rip+0x1dc57a1],r13d        # 0x14264a478
0x00884cd7: xorps  xmm0,xmm0
0x00884cda: movups XMMWORD PTR [rbp-0x80],xmm0
0x00884cde: movdqa xmm1,XMMWORD PTR [rip+0xf0647a]        # 0x14178b160
0x00884ce6: movdqu XMMWORD PTR [rbp-0x70],xmm1
0x00884ceb: mov    DWORD PTR [rbp-0x80],0x79616b4f ; inline="Okay"
0x00884cf2: mov    BYTE PTR [rbp-0x7c],0x0
0x00884cf6: xor    r9d,r9d
0x00884cf9: lea    rdx,[rbp-0x80]
0x00884cfd: lea    rcx,[rip+0x1dc56ec]        # 0x14264a3f0
0x00884d04: call   0x140ad9960
0x00884d09: nop
0x00884d0a: mov    rdx,QWORD PTR [rbp-0x68]
0x00884d0e: cmp    rdx,0xf
0x00884d12: jbe    0x140884d45
0x00884d14: inc    rdx
0x00884d17: mov    rcx,QWORD PTR [rbp-0x80]
0x00884d1b: mov    rax,rcx
0x00884d1e: cmp    rdx,0x1000
0x00884d25: jb     0x140884d40
0x00884d27: add    rdx,0x27
0x00884d2b: mov    rcx,QWORD PTR [rcx-0x8]
0x00884d2f: sub    rax,rcx
0x00884d32: add    rax,0xfffffffffffffff8
0x00884d36: cmp    rax,0x1f
0x00884d3a: ja     0x140884e53
0x00884d40: call   0x141539680
0x00884d45: mov    r14d,DWORD PTR [rsp+0x58]
0x00884d4a: mov    ebx,r14d
0x00884d4d: lea    esi,[r14+0xb]
0x00884d51: cmp    r14d,esi
0x00884d54: jg     0x140884dc6
0x00884d56: lea    r12,[rip+0x1dcfe8b]        # 0x142654be8
0x00884d5d: lea    r15,[rip+0x1dcfe90]        # 0x142654bf4
0x00884d64: mov    r13d,DWORD PTR [rsp+0x44]
0x00884d69: nop    DWORD PTR [rax+0x0]
0x00884d70: mov    edi,r13d
0x00884d73: mov    r11,r12
0x00884d76: data16 nop WORD PTR [rax+rax*1+0x0]
0x00884d80: mov    DWORD PTR [rip+0x1dc56ee],ebx        # 0x14264a474
0x00884d86: mov    DWORD PTR [rip+0x1dc56ec],edi        # 0x14264a478
0x00884d8c: cmp    ebx,r14d
0x00884d8f: jne    0x140884d97
0x00884d91: mov    edx,DWORD PTR [r11-0x18]
0x00884d95: jmp    0x140884da4
0x00884d97: cmp    ebx,esi
0x00884d99: jne    0x140884da0
0x00884d9b: mov    edx,DWORD PTR [r11]
0x00884d9e: jmp    0x140884da4
0x00884da0: mov    edx,DWORD PTR [r11-0xc]
0x00884da4: lea    rcx,[rip+0x1dc5645]        # 0x14264a3f0
0x00884dab: call   0x140adaad0
0x00884db0: inc    edi
0x00884db2: add    r11,0x4
0x00884db6: cmp    r11,r15
0x00884db9: jl     0x140884d80
0x00884dbb: inc    ebx
0x00884dbd: cmp    ebx,esi
0x00884dbf: jle    0x140884d70
0x00884dc1: mov    r13d,DWORD PTR [rsp+0x48]
0x00884dc6: mov    DWORD PTR [rip+0x1dc56ac],0x1010007        # 0x14264a47c
0x00884dd0: lea    eax,[r14+0x3]
0x00884dd4: mov    DWORD PTR [rip+0x1dc569a],eax        # 0x14264a474
0x00884dda: mov    DWORD PTR [rip+0x1dc5697],r13d        # 0x14264a478
0x00884de1: xorps  xmm0,xmm0
0x00884de4: movups XMMWORD PTR [rbp-0x80],xmm0
0x00884de8: movdqa xmm1,XMMWORD PTR [rip+0xf06390]        # 0x14178b180
0x00884df0: movdqu XMMWORD PTR [rbp-0x70],xmm1
0x00884df5: mov    eax,DWORD PTR [rip+0xd79929]        # 0x1415fe724 ; literal="Cancel"
0x00884dfb: mov    DWORD PTR [rbp-0x80],eax
0x00884dfe: movzx  eax,WORD PTR [rip+0xd79923]        # 0x1415fe728 ; literal="el"
0x00884e05: mov    WORD PTR [rbp-0x7c],ax
0x00884e09: mov    BYTE PTR [rbp-0x7a],0x0
0x00884e0d: xor    r9d,r9d
0x00884e10: lea    rdx,[rbp-0x80]
0x00884e14: lea    rcx,[rip+0x1dc55d5]        # 0x14264a3f0
0x00884e1b: call   0x140ad9960
0x00884e20: nop
0x00884e21: mov    rdx,QWORD PTR [rbp-0x68]
0x00884e25: cmp    rdx,0xf
0x00884e29: jbe    0x140884e60
0x00884e2b: inc    rdx
0x00884e2e: mov    rcx,QWORD PTR [rbp-0x80]
0x00884e32: mov    rax,rcx
0x00884e35: cmp    rdx,0x1000
0x00884e3c: jb     0x140884e5a
0x00884e3e: add    rdx,0x27
0x00884e42: mov    rcx,QWORD PTR [rcx-0x8]
0x00884e46: sub    rax,rcx
0x00884e49: add    rax,0xfffffffffffffff8
0x00884e4d: cmp    rax,0x1f
0x00884e51: jbe    0x140884e5a
0x00884e53: call   QWORD PTR [rip+0xd60ccf]        # 0x1415e5b28
0x00884e59: int3
0x00884e5a: call   0x141539680
0x00884e5f: nop
0x00884e60: lea    rcx,[rbp-0x38]
0x00884e64: call   0x14006f850
0x00884e69: nop
0x00884e6a: lea    rcx,[rbp-0x60]
0x00884e6e: call   0x14006f850
0x00884e73: jmp    0x14088571d
0x00884e78: mov    esi,r12d
0x00884e7b: cmp    r12d,r15d
0x00884e7e: jg     0x140884f45
0x00884e84: mov    ebx,r14d
0x00884e87: cmp    r14d,edi
0x00884e8a: jg     0x140884f3a
0x00884e90: mov    DWORD PTR [rip+0x1dc55de],ebx        # 0x14264a474
0x00884e96: mov    DWORD PTR [rip+0x1dc55dc],esi        # 0x14264a478
0x00884e9c: xor    r8d,r8d
0x00884e9f: xor    edx,edx
0x00884ea1: lea    rcx,[rip+0x1dc5548]        # 0x14264a3f0
0x00884ea8: call   0x1400bb190
0x00884ead: cmp    esi,r12d
0x00884eb0: jne    0x140884eda
0x00884eb2: cmp    ebx,r14d
0x00884eb5: jne    0x140884ebf
0x00884eb7: mov    edx,DWORD PTR [rip+0x1dc6e57]        # 0x14264bd14
0x00884ebd: jmp    0x140884f24
0x00884ebf: lea    rcx,[rip+0x1dc552a]        # 0x14264a3f0
0x00884ec6: cmp    ebx,edi
0x00884ec8: jne    0x140884ed2
0x00884eca: mov    edx,DWORD PTR [rip+0x1dc6e5c]        # 0x14264bd2c
0x00884ed0: jmp    0x140884f2b
0x00884ed2: mov    edx,DWORD PTR [rip+0x1dc6e48]        # 0x14264bd20
0x00884ed8: jmp    0x140884f2b
0x00884eda: cmp    esi,r15d
0x00884edd: jne    0x140884f07
0x00884edf: cmp    ebx,r14d
0x00884ee2: jne    0x140884eec
0x00884ee4: mov    edx,DWORD PTR [rip+0x1dc6e32]        # 0x14264bd1c
0x00884eea: jmp    0x140884f24
0x00884eec: lea    rcx,[rip+0x1dc54fd]        # 0x14264a3f0
0x00884ef3: cmp    ebx,edi
0x00884ef5: jne    0x140884eff
0x00884ef7: mov    edx,DWORD PTR [rip+0x1dc6e37]        # 0x14264bd34
0x00884efd: jmp    0x140884f2b
0x00884eff: mov    edx,DWORD PTR [rip+0x1dc6e23]        # 0x14264bd28
0x00884f05: jmp    0x140884f2b
0x00884f07: cmp    ebx,r14d
0x00884f0a: jne    0x140884f14
0x00884f0c: mov    edx,DWORD PTR [rip+0x1dc6e06]        # 0x14264bd18
0x00884f12: jmp    0x140884f24
0x00884f14: cmp    ebx,edi
0x00884f16: mov    edx,DWORD PTR [rip+0x1dc6e14]        # 0x14264bd30
0x00884f1c: je     0x140884f24
0x00884f1e: mov    edx,DWORD PTR [rip+0x1dc6e00]        # 0x14264bd24
0x00884f24: lea    rcx,[rip+0x1dc54c5]        # 0x14264a3f0
0x00884f2b: call   0x140adaad0
0x00884f30: inc    ebx
0x00884f32: cmp    ebx,edi
0x00884f34: jle    0x140884e90
0x00884f3a: inc    esi
0x00884f3c: cmp    esi,r15d
0x00884f3f: jle    0x140884e84
0x00884f45: xor    ebx,ebx
0x00884f47: lea    r15,[rip+0x1dcfca6]        # 0x142654bf4
0x00884f4e: xchg   ax,ax
0x00884f50: lea    r13d,[rbx-0xc]
0x00884f54: add    r13d,edi
0x00884f57: lea    r11,[rip+0x1dcfc8a]        # 0x142654be8
0x00884f5e: lea    esi,[r12+0x1]
0x00884f63: nop    DWORD PTR [rax+0x0]
0x00884f67: nop    WORD PTR [rax+rax*1+0x0]
0x00884f70: mov    DWORD PTR [rip+0x1dc54fd],r13d        # 0x14264a474
0x00884f77: mov    DWORD PTR [rip+0x1dc54fb],esi        # 0x14264a478
0x00884f7d: test   ebx,ebx
0x00884f7f: jne    0x140884f87
0x00884f81: mov    edx,DWORD PTR [r11-0x18]
0x00884f85: jmp    0x140884f95
0x00884f87: cmp    ebx,0xb
0x00884f8a: jne    0x140884f91
0x00884f8c: mov    edx,DWORD PTR [r11]
0x00884f8f: jmp    0x140884f95
0x00884f91: mov    edx,DWORD PTR [r11-0xc]
0x00884f95: lea    rcx,[rip+0x1dc5454]        # 0x14264a3f0
0x00884f9c: call   0x140adaad0
0x00884fa1: inc    esi
0x00884fa3: add    r11,0x4
0x00884fa7: cmp    r11,r15
0x00884faa: jl     0x140884f70
0x00884fac: inc    ebx
0x00884fae: cmp    ebx,0xc
0x00884fb1: jl     0x140884f50
0x00884fb3: mov    DWORD PTR [rip+0x1dc54bf],0x1010007        # 0x14264a47c
0x00884fbd: lea    eax,[rdi-0x9]
0x00884fc0: mov    DWORD PTR [rip+0x1dc54ae],eax        # 0x14264a474
0x00884fc6: add    r12d,0x2
0x00884fca: mov    DWORD PTR [rip+0x1dc54a7],r12d        # 0x14264a478
0x00884fd1: xorps  xmm0,xmm0
0x00884fd4: movups XMMWORD PTR [rbp-0x80],xmm0
0x00884fd8: movdqa xmm1,XMMWORD PTR [rip+0xf061a0]        # 0x14178b180
0x00884fe0: movdqu XMMWORD PTR [rbp-0x70],xmm1
0x00884fe5: mov    eax,DWORD PTR [rip+0xd79739]        # 0x1415fe724 ; literal="Cancel"
0x00884feb: mov    DWORD PTR [rbp-0x80],eax
0x00884fee: movzx  eax,WORD PTR [rip+0xd79733]        # 0x1415fe728 ; literal="el"
0x00884ff5: mov    WORD PTR [rbp-0x7c],ax
0x00884ff9: mov    BYTE PTR [rbp-0x7a],0x0
0x00884ffd: xor    r9d,r9d
0x00885000: lea    rdx,[rbp-0x80]
0x00885004: lea    rcx,[rip+0x1dc53e5]        # 0x14264a3f0
0x0088500b: call   0x140ad9960
0x00885010: nop
0x00885011: mov    rdx,QWORD PTR [rbp-0x68]
0x00885015: cmp    rdx,0xf
0x00885019: mov    r14d,DWORD PTR [rsp+0x44]
0x0088501e: jbe    0x140885051
0x00885020: inc    rdx
0x00885023: mov    rcx,QWORD PTR [rbp-0x80]
0x00885027: mov    rax,rcx
0x0088502a: cmp    rdx,0x1000
0x00885031: jb     0x14088504c
0x00885033: add    rdx,0x27
0x00885037: mov    rcx,QWORD PTR [rcx-0x8]
0x0088503b: sub    rax,rcx
0x0088503e: add    rax,0xfffffffffffffff8
0x00885042: cmp    rax,0x1f
0x00885046: ja     0x1408853d6
0x0088504c: call   0x141539680
0x00885051: mov    DWORD PTR [rip+0x1dc5421],0x1010007        # 0x14264a47c
0x0088505b: lea    eax,[r14+0x2]
0x0088505f: mov    DWORD PTR [rip+0x1dc540f],eax        # 0x14264a474
0x00885065: mov    DWORD PTR [rip+0x1dc540c],r12d        # 0x14264a478
0x0088506c: mov    rax,QWORD PTR [rsp+0x50]
0x00885071: movsxd rax,DWORD PTR [rax+0x4]
0x00885075: cmp    eax,0x7
0x00885078: ja     0x140885131
0x0088507e: lea    rdx,[rip+0xffffffffff77af7b]        # 0x140000000
0x00885085: mov    ecx,DWORD PTR [rdx+rax*4+0x885748]
0x0088508c: add    rcx,rdx
0x0088508f: jmp    rcx
0x00885091: xorps  xmm0,xmm0
0x00885094: movups XMMWORD PTR [rbp-0x60],xmm0
0x00885098: mov    ecx,0x20
0x0088509d: call   0x1400707d0
0x008850a2: mov    rdx,rax
0x008850a5: mov    QWORD PTR [rbp-0x60],rax
0x008850a9: movdqa xmm0,XMMWORD PTR [rip+0xf061df]        # 0x14178b290
0x008850b1: movdqu XMMWORD PTR [rbp-0x50],xmm0
0x008850b6: movups xmm0,XMMWORD PTR [rip+0xe2f483]        # 0x1416b4540 ; literal="What do you want to do?"
0x008850bd: movups XMMWORD PTR [rax],xmm0
0x008850c0: mov    ecx,DWORD PTR [rip+0xe2f48a]        # 0x1416b4550 ; literal=" to do?"
0x008850c6: mov    DWORD PTR [rax+0x10],ecx
0x008850c9: movzx  ecx,WORD PTR [rip+0xe2f484]        # 0x1416b4554 ; literal="do?"
0x008850d0: mov    WORD PTR [rax+0x14],cx
0x008850d4: movzx  eax,BYTE PTR [rip+0xe2f47b]        # 0x1416b4556 ; literal="?"
0x008850db: mov    BYTE PTR [rdx+0x16],al
0x008850de: mov    BYTE PTR [rdx+0x17],0x0
0x008850e2: xor    r9d,r9d
0x008850e5: lea    rdx,[rbp-0x60]
0x008850e9: lea    rcx,[rip+0x1dc5300]        # 0x14264a3f0
0x008850f0: call   0x140ad9960
0x008850f5: nop
0x008850f6: mov    rdx,QWORD PTR [rbp-0x48]
0x008850fa: cmp    rdx,0xf
0x008850fe: jbe    0x140885131
0x00885100: inc    rdx
0x00885103: mov    rcx,QWORD PTR [rbp-0x60]
0x00885107: mov    rax,rcx
0x0088510a: cmp    rdx,0x1000
0x00885111: jb     0x14088512c
0x00885113: add    rdx,0x27
0x00885117: mov    rcx,QWORD PTR [rcx-0x8]
0x0088511b: sub    rax,rcx
0x0088511e: add    rax,0xfffffffffffffff8
0x00885122: cmp    rax,0x1f
0x00885126: ja     0x1408853d6
0x0088512c: call   0x141539680
0x00885131: lea    r8d,[r14+0x1]
0x00885135: lea    esi,[rdi-0x1]
0x00885138: mov    DWORD PTR [rsp+0x44],esi
0x0088513c: lea    r10d,[r12+0x2]
0x00885141: mov    DWORD PTR [rsp+0x58],r10d
0x00885146: mov    ecx,DWORD PTR [rsp+0x40]
0x0088514a: dec    ecx
0x0088514c: sub    ecx,r10d
0x0088514f: inc    ecx
0x00885151: mov    eax,0x55555556
0x00885156: imul   ecx
0x00885158: mov    r9d,edx
0x0088515b: shr    r9d,0x1f
0x0088515f: add    r9d,edx
0x00885162: mov    DWORD PTR [rsp+0x68],r9d
0x00885167: mov    rdx,QWORD PTR [rsp+0x50]
0x0088516c: mov    rcx,QWORD PTR [rdx+0x20]
0x00885170: sub    rcx,QWORD PTR [rdx+0x18]
0x00885174: sar    rcx,0x3
0x00885178: cmp    ecx,r9d
0x0088517b: jle    0x140885184
0x0088517d: lea    esi,[rdi-0x3]
0x00885180: mov    DWORD PTR [rsp+0x44],esi
0x00885184: mov    ebx,r10d
0x00885187: mov    DWORD PTR [rsp+0x40],ebx
0x0088518b: sub    ecx,r9d
0x0088518e: cmp    DWORD PTR [rdx+0x34],ecx
0x00885191: cmovle ecx,DWORD PTR [rdx+0x34]
0x00885195: xor    eax,eax
0x00885197: test   ecx,ecx
0x00885199: cmovns eax,ecx
0x0088519c: mov    DWORD PTR [rsp+0x70],eax
0x008851a0: movsxd rdi,eax
0x008851a3: mov    DWORD PTR [rsp+0x64],edi
0x008851a7: add    eax,r9d
0x008851aa: mov    DWORD PTR [rsp+0x74],eax
0x008851ae: cmp    edi,eax
0x008851b0: jge    0x1408856a4
0x008851b6: movsxd r13,esi
0x008851b9: movsxd r12,r8d
0x008851bc: lea    r15,[rdi*8+0x0]
0x008851c4: mov    QWORD PTR [rsp+0x78],r15
0x008851c9: nop    DWORD PTR [rax+0x0]
0x008851d0: mov    rdx,QWORD PTR [rdx+0x18]
0x008851d4: mov    rax,QWORD PTR [rsp+0x50]
0x008851d9: mov    rcx,QWORD PTR [rax+0x20]
0x008851dd: sub    rcx,rdx
0x008851e0: sar    rcx,0x3
0x008851e4: movsxd rax,edi
0x008851e7: cmp    rax,rcx
0x008851ea: jae    0x140885695
0x008851f0: mov    rcx,QWORD PTR [rdx+r15*1]
0x008851f4: mov    rax,QWORD PTR [rcx]
0x008851f7: mov    edx,DWORD PTR [rsp+0x6c]
0x008851fb: call   QWORD PTR [rax+0xc8]
0x00885201: mov    edx,eax
0x00885203: mov    DWORD PTR [rsp+0x60],eax
0x00885207: mov    DWORD PTR [rip+0x1dc526b],0x1010007        # 0x14264a47c
0x00885211: lea    r8d,[r14+0x1]
0x00885215: mov    edi,r8d
0x00885218: cmp    r8d,esi
0x0088521b: jg     0x14088549d
0x00885221: lea    eax,[rbx+0x3]
0x00885224: mov    rsi,r12
0x00885227: mov    ecx,DWORD PTR [rsp+0x44]
0x0088522b: nop    DWORD PTR [rax+rax*1+0x0]
0x00885230: mov    r15d,ebx
0x00885233: cmp    ebx,eax
0x00885235: jge    0x140885483
0x0088523b: lea    rbx,[rip+0x1dc6d5a]        # 0x14264bf9c
0x00885242: nop    DWORD PTR [rax+0x0]
0x00885246: data16 nop WORD PTR [rax+rax*1+0x0]
0x00885250: mov    DWORD PTR [rip+0x1dc521e],edi        # 0x14264a474
0x00885256: mov    DWORD PTR [rip+0x1dc521b],r15d        # 0x14264a478
0x0088525d: test   edx,edx
0x0088525f: je     0x14088540e
0x00885265: cmp    rsi,r12
0x00885268: jne    0x1408853dd
0x0088526e: mov    edx,DWORD PTR [rbx-0xc]
0x00885271: jmp    0x14088542e
0x00885276: xorps  xmm0,xmm0
0x00885279: movups XMMWORD PTR [rbp-0x60],xmm0
0x0088527d: mov    ecx,0x20
0x00885282: call   0x1400707d0
0x00885287: mov    rdx,rax
0x0088528a: mov    QWORD PTR [rbp-0x60],rax
0x0088528e: movdqa xmm0,XMMWORD PTR [rip+0xf0605a]        # 0x14178b2f0
0x00885296: movdqu XMMWORD PTR [rbp-0x50],xmm0
0x0088529b: movups xmm0,XMMWORD PTR [rip+0xe2f27e]        # 0x1416b4520 ; literal="Where would you like to move?"
0x008852a2: movups XMMWORD PTR [rax],xmm0
0x008852a5: movsd  xmm0,QWORD PTR [rip+0xe2f283]        # 0x1416b4530 ; literal="like to move?"
0x008852ad: movsd  QWORD PTR [rax+0x10],xmm0
0x008852b2: mov    ecx,DWORD PTR [rip+0xe2f280]        # 0x1416b4538 ; literal="move?"
0x008852b8: mov    DWORD PTR [rax+0x18],ecx
0x008852bb: movzx  eax,BYTE PTR [rip+0xe2f27a]        # 0x1416b453c ; literal="?"
0x008852c2: mov    BYTE PTR [rdx+0x1c],al
0x008852c5: mov    BYTE PTR [rdx+0x1d],0x0
0x008852c9: xor    r9d,r9d
0x008852cc: lea    rdx,[rbp-0x60]
0x008852d0: lea    rcx,[rip+0x1dc5119]        # 0x14264a3f0
0x008852d7: call   0x140ad9960
0x008852dc: nop
0x008852dd: jmp    0x1408850f6
0x008852e2: xorps  xmm0,xmm0
0x008852e5: mov    ecx,0x30
0x008852ea: movups XMMWORD PTR [rbp-0x60],xmm0
0x008852ee: cmp    BYTE PTR [rip+0x1023763],0x0        # 0x1418a8a58
0x008852f5: je     0x140885348
0x008852f7: call   0x1400707d0
0x008852fc: mov    QWORD PTR [rbp-0x60],rax
0x00885300: movdqa xmm0,XMMWORD PTR [rip+0xf06058]        # 0x14178b360 ; literal="$"
0x00885308: movdqu XMMWORD PTR [rbp-0x50],xmm0
0x0088530d: movups xmm0,XMMWORD PTR [rip+0xe2f274]        # 0x1416b4588 ; literal="Who or what would you like to shoot?"
0x00885314: movups XMMWORD PTR [rax],xmm0
0x00885317: movups xmm1,XMMWORD PTR [rip+0xe2f27a]        # 0x1416b4598 ; literal="d you like to shoot?"
0x0088531e: movups XMMWORD PTR [rax+0x10],xmm1
0x00885322: mov    ecx,DWORD PTR [rip+0xe2f280]        # 0x1416b45a8 ; literal="oot?"
0x00885328: mov    DWORD PTR [rax+0x20],ecx
0x0088532b: mov    BYTE PTR [rax+0x24],0x0
0x0088532f: xor    r9d,r9d
0x00885332: lea    rdx,[rbp-0x60]
0x00885336: lea    rcx,[rip+0x1dc50b3]        # 0x14264a3f0
0x0088533d: call   0x140ad9960
0x00885342: nop
0x00885343: jmp    0x1408850f6
0x00885348: call   0x1400707d0
0x0088534d: mov    QWORD PTR [rbp-0x60],rax
0x00885351: movdqa xmm0,XMMWORD PTR [rip+0xf06047]        # 0x14178b3a0 ; literal="("
0x00885359: movdqu XMMWORD PTR [rbp-0x50],xmm0
0x0088535e: movups xmm0,XMMWORD PTR [rip+0xe2f1f3]        # 0x1416b4558 ; literal="At whom or what would you like to throw?"
0x00885365: movups XMMWORD PTR [rax],xmm0
0x00885368: movups xmm1,XMMWORD PTR [rip+0xe2f1f9]        # 0x1416b4568 ; literal="would you like to throw?"
0x0088536f: movups XMMWORD PTR [rax+0x10],xmm1
0x00885373: movsd  xmm0,QWORD PTR [rip+0xe2f1fd]        # 0x1416b4578 ; literal="o throw?"
0x0088537b: movsd  QWORD PTR [rax+0x20],xmm0
0x00885380: mov    BYTE PTR [rax+0x28],0x0
0x00885384: xor    r9d,r9d
0x00885387: lea    rdx,[rbp-0x60]
0x0088538b: lea    rcx,[rip+0x1dc505e]        # 0x14264a3f0
0x00885392: call   0x140ad9960
0x00885397: nop
0x00885398: mov    rdx,QWORD PTR [rbp-0x48]
0x0088539c: cmp    rdx,0xf
0x008853a0: jbe    0x140885131
0x008853a6: inc    rdx
0x008853a9: mov    rcx,QWORD PTR [rbp-0x60]
0x008853ad: mov    rax,rcx
0x008853b0: cmp    rdx,0x1000
0x008853b7: jb     0x14088512c
0x008853bd: add    rdx,0x27
0x008853c1: mov    rcx,QWORD PTR [rcx-0x8]
0x008853c5: sub    rax,rcx
0x008853c8: add    rax,0xfffffffffffffff8
0x008853cc: cmp    rax,0x1f
0x008853d0: jbe    0x14088512c
0x008853d6: call   QWORD PTR [rip+0xd6074c]        # 0x1415e5b28
0x008853dc: int3
0x008853dd: lea    eax,[r14+0x2]
0x008853e1: cmp    edi,eax
0x008853e3: jne    0x1408853e9
0x008853e5: mov    edx,DWORD PTR [rbx]
0x008853e7: jmp    0x14088542e
0x008853e9: lea    eax,[r14+0x3]
0x008853ed: cmp    edi,eax
0x008853ef: jne    0x1408853f5
0x008853f1: mov    edx,DWORD PTR [rbx]
0x008853f3: jmp    0x14088542e
0x008853f5: lea    eax,[r14+0x4]
0x008853f9: cmp    edi,eax
0x008853fb: jne    0x140885401
0x008853fd: mov    edx,DWORD PTR [rbx]
0x008853ff: jmp    0x14088542e
0x00885401: lea    eax,[r14+0x5]
0x00885405: cmp    edi,eax
0x00885407: jne    0x14088541b
0x00885409: mov    edx,DWORD PTR [rbx+0xc]
0x0088540c: jmp    0x14088542e
0x0088540e: cmp    rsi,r12
0x00885411: jne    0x14088541b
0x00885413: mov    edx,DWORD PTR [rbx-0x204]
0x00885419: jmp    0x14088542e
0x0088541b: cmp    rsi,r13
0x0088541e: jne    0x140885428
0x00885420: mov    edx,DWORD PTR [rbx-0x1ec]
0x00885426: jmp    0x14088542e
0x00885428: mov    edx,DWORD PTR [rbx-0x1f8]
0x0088542e: lea    rcx,[rip+0x1dc4fbb]        # 0x14264a3f0
0x00885435: call   0x140adaad0
0x0088543a: cmp    DWORD PTR [rip+0x1b48337],0x0        # 0x1423cd778
0x00885441: jle    0x140885460
0x00885443: mov    rax,QWORD PTR [rip+0x1b48326]        # 0x1423cd770
0x0088544a: test   BYTE PTR [rax],0x1
0x0088544d: je     0x140885460
0x0088544f: mov    r8b,0x1
0x00885452: xor    edx,edx
0x00885454: lea    rcx,[rip+0x1dc4f95]        # 0x14264a3f0
0x0088545b: call   0x1400bb190
0x00885460: inc    r15d
0x00885463: add    rbx,0x4
0x00885467: mov    eax,DWORD PTR [rsp+0x40]
0x0088546b: add    eax,0x3
0x0088546e: cmp    r15d,eax
0x00885471: mov    edx,DWORD PTR [rsp+0x60]
0x00885475: jl     0x140885250
0x0088547b: mov    ebx,DWORD PTR [rsp+0x40]
0x0088547f: mov    ecx,DWORD PTR [rsp+0x44]
0x00885483: inc    edi
0x00885485: inc    rsi
0x00885488: cmp    edi,ecx
0x0088548a: jle    0x140885230
0x00885490: mov    esi,DWORD PTR [rsp+0x44]
0x00885494: mov    r15,QWORD PTR [rsp+0x78]
0x00885499: lea    r8d,[r14+0x1]
0x0088549d: mov    ecx,0x1
0x008854a2: mov    eax,ebx
0x008854a4: lea    ebx,[rcx+rbx*1]
0x008854a7: test   edx,edx
0x008854a9: je     0x1408854e6
0x008854ab: mov    DWORD PTR [rip+0x1dc4fc2],r8d        # 0x14264a474
0x008854b2: mov    eax,DWORD PTR [rsp+0x40]
0x008854b6: mov    DWORD PTR [rip+0x1dc4fbc],eax        # 0x14264a478
0x008854bc: mov    BYTE PTR [rsp+0x30],0x0
0x008854c1: mov    DWORD PTR [rsp+0x28],0x3
0x008854c9: mov    DWORD PTR [rsp+0x20],0x5
0x008854d1: mov    r9d,0x2
0x008854d7: mov    r8d,r9d
0x008854da: lea    rcx,[rip+0x1dc4f0f]        # 0x14264a3f0
0x008854e1: call   0x140adad70
0x008854e6: lea    eax,[r14+0x8]
0x008854ea: mov    DWORD PTR [rip+0x1dc4f84],eax        # 0x14264a474
0x008854f0: mov    DWORD PTR [rip+0x1dc4f82],ebx        # 0x14264a478
0x008854f6: mov    edi,DWORD PTR [rsp+0x64]
0x008854fa: mov    edx,edi
0x008854fc: sub    edx,DWORD PTR [rsp+0x70]
0x00885500: add    edx,0x52
0x00885503: call   0x140c394b0
0x00885508: lea    eax,[r14+0xa]
0x0088550c: mov    DWORD PTR [rip+0x1dc4f62],eax        # 0x14264a474
0x00885512: mov    DWORD PTR [rip+0x1dc4f60],ebx        # 0x14264a478
0x00885518: mov    rbx,QWORD PTR [rsp+0x50]
0x0088551d: mov    rax,QWORD PTR [rbx+0x18]
0x00885521: mov    rcx,QWORD PTR [r15+rax*1]
0x00885525: mov    rax,QWORD PTR [rcx]
0x00885528: call   QWORD PTR [rax+0x118]
0x0088552e: mov    DWORD PTR [rip+0x1dc4f44],0x1010007        # 0x14264a47c
0x00885538: xorps  xmm0,xmm0
0x0088553b: movups XMMWORD PTR [rbp-0x80],xmm0
0x0088553f: mov    QWORD PTR [rbp-0x70],0x0
0x00885547: mov    QWORD PTR [rbp-0x68],0xf
0x0088554f: mov    BYTE PTR [rbp-0x80],0x0
0x00885553: mov    ecx,DWORD PTR [rbx+0x4]
0x00885556: lea    eax,[rcx-0x6]
0x00885559: cmp    eax,0x1
0x0088555c: jbe    0x140885577
0x0088555e: cmp    ecx,0x3
0x00885561: je     0x140885577
0x00885563: mov    rax,QWORD PTR [rbx+0x18]
0x00885567: mov    rcx,QWORD PTR [r15+rax*1]
0x0088556b: mov    rax,QWORD PTR [rcx]
0x0088556e: lea    rdx,[rbp-0x80]
0x00885572: call   QWORD PTR [rax+0x8]
0x00885575: jmp    0x140885589
0x00885577: mov    rax,QWORD PTR [rbx+0x18]
0x0088557b: mov    rcx,QWORD PTR [r15+rax*1]
0x0088557f: mov    rax,QWORD PTR [rcx]
0x00885582: lea    rdx,[rbp-0x80]
0x00885586: call   QWORD PTR [rax+0x10]
0x00885589: mov    eax,esi
0x0088558b: lea    r8d,[r14+0x1]
0x0088558f: sub    eax,r8d
0x00885592: sub    eax,0xe
0x00885595: cdqe
0x00885597: mov    rcx,QWORD PTR [rbp-0x70]
0x0088559b: cmp    rcx,rax
0x0088559e: jb     0x14088561a
0x008855a0: mov    rbx,r13
0x008855a3: sub    rbx,r12
0x008855a6: sub    rbx,0xd
0x008855aa: js     0x1408855db
0x008855ac: cmp    rbx,rcx
0x008855af: ja     0x1408855c9
0x008855b1: mov    QWORD PTR [rbp-0x70],rbx
0x008855b5: lea    rax,[rbp-0x80]
0x008855b9: cmp    QWORD PTR [rbp-0x68],0xf
0x008855be: cmova  rax,QWORD PTR [rbp-0x80]
0x008855c3: mov    BYTE PTR [rax+rbx*1],0x0
0x008855c7: jmp    0x1408855db
0x008855c9: mov    rdx,rbx
0x008855cc: sub    rdx,rcx
0x008855cf: xor    r8d,r8d
0x008855d2: lea    rcx,[rbp-0x80]
0x008855d6: call   0x1400e12b0
0x008855db: cmp    rbx,0x3
0x008855df: jle    0x14088561a
0x008855e1: lea    rax,[rbp-0x80]
0x008855e5: cmp    QWORD PTR [rbp-0x68],0xf
0x008855ea: cmova  rax,QWORD PTR [rbp-0x80]
0x008855ef: mov    BYTE PTR [rbx+rax*1-0x3],0x2e
0x008855f4: lea    rax,[rbp-0x80]
0x008855f8: cmp    QWORD PTR [rbp-0x68],0xf
0x008855fd: cmova  rax,QWORD PTR [rbp-0x80]
0x00885602: mov    BYTE PTR [rax+rbx*1-0x2],0x2e
0x00885607: lea    rax,[rbp-0x80]
0x0088560b: cmp    QWORD PTR [rbp-0x68],0xf
0x00885610: cmova  rax,QWORD PTR [rbp-0x80]
0x00885615: mov    BYTE PTR [rbx+rax*1-0x1],0x2e
0x0088561a: xor    r9d,r9d
0x0088561d: lea    rdx,[rbp-0x80]
0x00885621: lea    rcx,[rip+0x1dc4dc8]        # 0x14264a3f0
0x00885628: call   0x140ad9960
0x0088562d: mov    ebx,DWORD PTR [rsp+0x40]
0x00885631: add    ebx,0x3
0x00885634: mov    DWORD PTR [rsp+0x40],ebx
0x00885638: mov    rdx,QWORD PTR [rbp-0x68]
0x0088563c: cmp    rdx,0xf
0x00885640: jbe    0x14088566f
0x00885642: inc    rdx
0x00885645: mov    rcx,QWORD PTR [rbp-0x80]
0x00885649: mov    rax,rcx
0x0088564c: cmp    rdx,0x1000
0x00885653: jb     0x14088566a
0x00885655: add    rdx,0x27
0x00885659: mov    rcx,QWORD PTR [rcx-0x8]
0x0088565d: sub    rax,rcx
0x00885660: add    rax,0xfffffffffffffff8
0x00885664: cmp    rax,0x1f
0x00885668: ja     0x14088568e
0x0088566a: call   0x141539680
0x0088566f: inc    edi
0x00885671: mov    DWORD PTR [rsp+0x64],edi
0x00885675: add    r15,0x8
0x00885679: mov    QWORD PTR [rsp+0x78],r15
0x0088567e: mov    rdx,QWORD PTR [rsp+0x50]
0x00885683: cmp    edi,DWORD PTR [rsp+0x74]
0x00885687: jge    0x14088569a
0x00885689: jmp    0x1408851d0
0x0088568e: call   QWORD PTR [rip+0xd60494]        # 0x1415e5b28
0x00885694: int3
0x00885695: mov    rdx,QWORD PTR [rsp+0x50]
0x0088569a: mov    r10d,DWORD PTR [rsp+0x58]
0x0088569f: mov    r9d,DWORD PTR [rsp+0x68]
0x008856a4: mov    rcx,QWORD PTR [rdx+0x20]
0x008856a8: sub    rcx,QWORD PTR [rdx+0x18]
0x008856ac: sar    rcx,0x3
0x008856b0: cmp    ecx,r9d
0x008856b3: jle    0x14088571d
0x008856b5: mov    QWORD PTR [rbp-0x68],0x0
0x008856bd: mov    eax,DWORD PTR [rdx+0x34]
0x008856c0: mov    DWORD PTR [rbp-0x80],eax
0x008856c3: mov    DWORD PTR [rbp-0x7c],0x0
0x008856ca: lea    eax,[rcx-0x1]
0x008856cd: mov    DWORD PTR [rbp-0x78],eax
0x008856d0: lea    eax,[r10+0x1]
0x008856d4: mov    DWORD PTR [rbp-0x70],eax
0x008856d7: lea    ecx,[r10-0x2]
0x008856db: lea    ecx,[rcx+r9*2]
0x008856df: add    ecx,r9d
0x008856e2: mov    DWORD PTR [rbp-0x6c],ecx
0x008856e5: mov    DWORD PTR [rbp-0x74],r9d
0x008856e9: lea    rcx,[rbp-0x80]
0x008856ed: call   0x1400bb3b0
0x008856f2: lea    r9d,[rsi+0x1]
0x008856f6: mov    DWORD PTR [rsp+0x28],0x0
0x008856fe: mov    rax,QWORD PTR [rsp+0x50]
0x00885703: movzx  eax,BYTE PTR [rax+0x30]
0x00885707: mov    BYTE PTR [rsp+0x20],al
0x0088570b: mov    r8d,DWORD PTR [rsp+0x5c]
0x00885710: mov    edx,DWORD PTR [rsp+0x48]
0x00885714: lea    rcx,[rbp-0x80]
0x00885718: call   0x14140f4d0
0x0088571d: mov    rcx,QWORD PTR [rbp-0x18]
0x00885721: xor    rcx,rsp
0x00885724: call   0x141539660
0x00885729: movaps xmm6,XMMWORD PTR [rsp+0xf0]
0x00885731: add    rsp,0x108
0x00885738: pop    r15
0x0088573a: pop    r14
0x0088573c: pop    r13
0x0088573e: pop    r12
0x00885740: pop    rdi
0x00885741: pop    rsi
0x00885742: pop    rbx
0x00885743: pop    rbp
0x00885744: ret
0x00885745: nop    DWORD PTR [rax]
0x00885748: xchg   ecx,eax
0x00885749: push   rax
0x0088574a: mov    BYTE PTR [rax],al
0x0088574c: jbe    0x1408857a0
0x0088574e: mov    BYTE PTR [rax],al
0x00885750: jbe    0x1408857a4
0x00885752: mov    BYTE PTR [rax],al
0x00885754: xchg   ecx,eax
0x00885755: push   rax
0x00885756: mov    BYTE PTR [rax],al
0x00885758: loop   0x1408857ac
0x0088575a: mov    BYTE PTR [rax],al
0x0088575c: xchg   ecx,eax
0x0088575d: push   rax
0x0088575e: mov    BYTE PTR [rax],al
0x00885760: xchg   ecx,eax
0x00885761: push   rax
0x00885762: mov    BYTE PTR [rax],al
0x00885764: xchg   ecx,eax
0x00885765: push   rax
0x00885766: mov    BYTE PTR [rax],al

# steam PE:6a70a6d9:02711000; adventure_environment_take_from_pack_animalst+8; RVA 0x8932c0..0x8935f0
0x008932c0: mov    QWORD PTR [rsp+0x18],rbx
0x008932c5: mov    QWORD PTR [rsp+0x20],rsi
0x008932ca: push   rbp
0x008932cb: push   rdi
0x008932cc: push   r12
0x008932ce: push   r14
0x008932d0: push   r15
0x008932d2: lea    rbp,[rsp-0x37]
0x008932d7: sub    rsp,0xa0
0x008932de: mov    rax,QWORD PTR [rip+0x1008d5b]        # 0x14189c040
0x008932e5: xor    rax,rsp
0x008932e8: mov    QWORD PTR [rbp+0x27],rax
0x008932ec: mov    r15,rdx
0x008932ef: mov    r14,rcx
0x008932f2: cmp    QWORD PTR [rcx+0x28],0x0
0x008932f7: je     0x1408935c8
0x008932fd: mov    r8d,0x4
0x00893303: lea    rdx,[rip+0xe21046]        # 0x1416b4350 ; literal="Get "
0x0089330a: mov    rcx,r15
0x0089330d: call   0x14006f8d0
0x00893312: xorps  xmm0,xmm0
0x00893315: movups XMMWORD PTR [rbp+0x7],xmm0
0x00893319: mov    QWORD PTR [rbp+0x17],0x0
0x00893321: mov    QWORD PTR [rbp+0x1f],0xf
0x00893329: mov    BYTE PTR [rbp+0x7],0x0
0x0089332d: mov    r9d,0xffffffff
0x00893333: xor    r8d,r8d
0x00893336: lea    rdx,[rbp+0x7]
0x0089333a: mov    rcx,QWORD PTR [r14+0x28]
0x0089333e: call   0x140c65450
0x00893343: lea    rdx,[rbp+0x7]
0x00893347: cmp    QWORD PTR [rbp+0x1f],0xf
0x0089334c: cmova  rdx,QWORD PTR [rbp+0x7]
0x00893351: mov    r8,QWORD PTR [rbp+0x17]
0x00893355: mov    rcx,r15
0x00893358: call   0x14006fa10
0x0089335d: mov    rsi,QWORD PTR [r14+0x28]
0x00893361: mov    r12d,0xffff8ad0
0x00893367: mov    WORD PTR [rbp-0x29],r12w
0x0089336c: mov    eax,DWORD PTR [rsi+0x10]
0x0089336f: test   al,0x10
0x00893371: jne    0x14089343a
0x00893377: test   al,0x8
0x00893379: je     0x140893422
0x0089337f: mov    rbx,QWORD PTR [rsi+0x38]
0x00893383: mov    rdi,QWORD PTR [rsi+0x40]
0x00893387: cmp    rbx,rdi
0x0089338a: jae    0x1408933ed
0x0089338c: mov    rcx,QWORD PTR [rbx]
0x0089338f: mov    rax,QWORD PTR [rcx]
0x00893392: call   QWORD PTR [rax+0x10]
0x00893395: cmp    eax,0xb
0x00893398: je     0x1408933c3
0x0089339a: cmp    eax,0x12
0x0089339d: jne    0x1408933d1
0x0089339f: mov    rcx,QWORD PTR [rbx]
0x008933a2: mov    rax,QWORD PTR [rcx]
0x008933a5: call   QWORD PTR [rax+0x20]
0x008933a8: test   rax,rax
0x008933ab: je     0x1408933d1
0x008933ad: lea    r9,[rbp-0x25]
0x008933b1: lea    r8,[rbp-0x21]
0x008933b5: lea    rdx,[rbp-0x29]
0x008933b9: mov    rcx,rax
0x008933bc: call   0x141367430
0x008933c1: jmp    0x14089343a
0x008933c3: mov    rcx,QWORD PTR [rbx]
0x008933c6: mov    rax,QWORD PTR [rcx]
0x008933c9: call   QWORD PTR [rax+0x18]
0x008933cc: test   rax,rax
0x008933cf: jne    0x1408933d7
0x008933d1: add    rbx,0x8
0x008933d5: jmp    0x140893387
0x008933d7: lea    r9,[rbp-0x25]
0x008933db: lea    r8,[rbp-0x21]
0x008933df: lea    rdx,[rbp-0x29]
0x008933e3: mov    rcx,rax
0x008933e6: call   0x140c8baa0
0x008933eb: jmp    0x14089343a
0x008933ed: mov    rax,QWORD PTR [rsi+0x20]
0x008933f1: mov    rcx,QWORD PTR [rsi+0x28]
0x008933f5: cmp    rax,rcx
0x008933f8: jae    0x14089343a
0x008933fa: mov    rdx,QWORD PTR [rax]
0x008933fd: cmp    DWORD PTR [rdx],0x7
0x00893400: je     0x140893408
0x00893402: add    rax,0x8
0x00893406: jmp    0x1408933f5
0x00893408: mov    rcx,QWORD PTR [rdx+0x8]
0x0089340c: movzx  eax,WORD PTR [rcx+0x4]
0x00893410: mov    WORD PTR [rbp-0x29],ax
0x00893414: movzx  eax,WORD PTR [rcx+0x6]
0x00893418: mov    WORD PTR [rbp-0x21],ax
0x0089341c: movzx  eax,WORD PTR [rcx+0x8]
0x00893420: jmp    0x140893436
0x00893422: movzx  eax,WORD PTR [rsi+0x8]
0x00893426: mov    WORD PTR [rbp-0x29],ax
0x0089342a: movzx  eax,WORD PTR [rsi+0xa]
0x0089342e: mov    WORD PTR [rbp-0x21],ax
0x00893432: movzx  eax,WORD PTR [rsi+0xc]
0x00893436: mov    WORD PTR [rbp-0x25],ax
0x0089343a: cmp    DWORD PTR [r14+0x8],0x0
0x0089343f: jne    0x1408934e9
0x00893445: cmp    QWORD PTR [r14+0x20],0x0
0x0089344a: je     0x1408934e9
0x00893450: mov    r8d,0x6
0x00893456: lea    rdx,[rip+0xd5a51f]        # 0x1415ed97c ; literal=" from "
0x0089345d: mov    rcx,r15
0x00893460: call   0x14006fa10
0x00893465: xorps  xmm0,xmm0
0x00893468: movups XMMWORD PTR [rbp-0x19],xmm0
0x0089346c: mov    QWORD PTR [rbp-0x9],0x0
0x00893474: mov    QWORD PTR [rbp-0x1],0xf
0x0089347c: mov    BYTE PTR [rbp-0x19],0x0
0x00893480: xor    r8d,r8d
0x00893483: lea    rdx,[rbp-0x19]
0x00893487: mov    rcx,QWORD PTR [r14+0x20]
0x0089348b: call   0x141330c30
0x00893490: lea    rdx,[rbp-0x19]
0x00893494: cmp    QWORD PTR [rbp-0x1],0xf
0x00893499: cmova  rdx,QWORD PTR [rbp-0x19]
0x0089349e: mov    r8,QWORD PTR [rbp-0x9]
0x008934a2: mov    rcx,r15
0x008934a5: call   0x14006fa10
0x008934aa: nop
0x008934ab: mov    rdx,QWORD PTR [rbp-0x1]
0x008934af: cmp    rdx,0xf
0x008934b3: jbe    0x1408934e9
0x008934b5: inc    rdx
0x008934b8: mov    rcx,QWORD PTR [rbp-0x19]
0x008934bc: mov    rax,rcx
0x008934bf: cmp    rdx,0x1000
0x008934c6: jb     0x1408934e4
0x008934c8: add    rdx,0x27
0x008934cc: mov    rcx,QWORD PTR [rcx-0x8]
0x008934d0: sub    rax,rcx
0x008934d3: add    rax,0xfffffffffffffff8
0x008934d7: cmp    rax,0x1f
0x008934db: jbe    0x1408934e4
0x008934dd: call   QWORD PTR [rip+0xd52645]        # 0x1415e5b28
0x008934e3: int3
0x008934e4: call   0x141539680
0x008934e9: movzx  eax,WORD PTR [rbp-0x29]
0x008934ed: cmp    ax,r12w
0x008934f1: je     0x14089358a
0x008934f7: mov    rcx,QWORD PTR [rip+0x1b51c12]        # 0x1423e5110
0x008934fe: cmp    ax,WORD PTR [rcx+0xa8]
0x00893505: jne    0x140893521
0x00893507: movzx  eax,WORD PTR [rcx+0xaa]
0x0089350e: cmp    WORD PTR [rbp-0x21],ax
0x00893512: jne    0x140893521
0x00893514: movzx  eax,WORD PTR [rcx+0xac]
0x0089351b: cmp    WORD PTR [rbp-0x25],ax
0x0089351f: je     0x14089358a
0x00893521: mov    r8d,0x2
0x00893527: lea    rdx,[rip+0xd82012]        # 0x141615540 ; literal=" ("
0x0089352e: mov    rcx,r15
0x00893531: call   0x14006fa10
0x00893536: mov    QWORD PTR [rsp+0x30],r15
0x0089353b: movzx  eax,WORD PTR [rbp-0x25]
0x0089353f: mov    WORD PTR [rsp+0x28],ax
0x00893544: movzx  eax,WORD PTR [rbp-0x21]
0x00893548: mov    WORD PTR [rsp+0x20],ax
0x0089354d: movzx  r9d,WORD PTR [rbp-0x29]
0x00893552: mov    rcx,QWORD PTR [rip+0x1b51bb7]        # 0x1423e5110
0x00893559: movzx  r8d,WORD PTR [rcx+0xac]
0x00893561: movzx  edx,WORD PTR [rcx+0xaa]
0x00893568: movzx  ecx,WORD PTR [rcx+0xa8]
0x0089356f: call   0x14074f220
0x00893574: mov    r8d,0x1
0x0089357a: lea    rdx,[rip+0xd81fff]        # 0x141615580 ; literal=")"
0x00893581: mov    rcx,r15
0x00893584: call   0x14006fa10
0x00893589: nop
0x0089358a: mov    rdx,QWORD PTR [rbp+0x1f]
0x0089358e: cmp    rdx,0xf
0x00893592: jbe    0x1408935c8
0x00893594: inc    rdx
0x00893597: mov    rcx,QWORD PTR [rbp+0x7]
0x0089359b: mov    rax,rcx
0x0089359e: cmp    rdx,0x1000
0x008935a5: jb     0x1408935c3
0x008935a7: add    rdx,0x27
0x008935ab: mov    rcx,QWORD PTR [rcx-0x8]
0x008935af: sub    rax,rcx
0x008935b2: add    rax,0xfffffffffffffff8
0x008935b6: cmp    rax,0x1f
0x008935ba: jbe    0x1408935c3
0x008935bc: call   QWORD PTR [rip+0xd52566]        # 0x1415e5b28
0x008935c2: int3
0x008935c3: call   0x141539680
0x008935c8: mov    rcx,QWORD PTR [rbp+0x27]
0x008935cc: xor    rcx,rsp
0x008935cf: call   0x141539660
0x008935d4: lea    r11,[rsp+0xa0]
0x008935dc: mov    rbx,QWORD PTR [r11+0x40]
0x008935e0: mov    rsi,QWORD PTR [r11+0x48]
0x008935e4: mov    rsp,r11
0x008935e7: pop    r15
0x008935e9: pop    r14
0x008935eb: pop    r12
0x008935ed: pop    rdi
0x008935ee: pop    rbp
0x008935ef: ret

# steam PE:6a70a6d9:02711000; adventure_environment_pick_up_environmentst+8;adventure_environment_pick_up_ground_itemst+8; RVA 0x8935f0..0x893867
0x008935f0: mov    QWORD PTR [rsp+0x18],rbx
0x008935f5: push   rbp
0x008935f6: push   rsi
0x008935f7: push   rdi
0x008935f8: push   r14
0x008935fa: push   r15
0x008935fc: mov    rbp,rsp
0x008935ff: sub    rsp,0x80
0x00893606: mov    rax,QWORD PTR [rip+0x1008a33]        # 0x14189c040
0x0089360d: xor    rax,rsp
0x00893610: mov    QWORD PTR [rbp-0x10],rax
0x00893614: mov    r14,rdx
0x00893617: mov    rsi,rcx
0x0089361a: cmp    QWORD PTR [rcx+0x20],0x0
0x0089361f: je     0x140893844
0x00893625: mov    r8d,0x4
0x0089362b: lea    rdx,[rip+0xe20d1e]        # 0x1416b4350 ; literal="Get "
0x00893632: mov    rcx,r14
0x00893635: call   0x14006f8d0
0x0089363a: xorps  xmm0,xmm0
0x0089363d: movups XMMWORD PTR [rbp-0x30],xmm0
0x00893641: mov    QWORD PTR [rbp-0x20],0x0
0x00893649: mov    QWORD PTR [rbp-0x18],0xf
0x00893651: mov    BYTE PTR [rbp-0x30],0x0
0x00893655: mov    r9d,0xffffffff
0x0089365b: xor    r8d,r8d
0x0089365e: lea    rdx,[rbp-0x30]
0x00893662: mov    rcx,QWORD PTR [rsi+0x20]
0x00893666: call   0x140c65450
0x0089366b: lea    rdx,[rbp-0x30]
0x0089366f: cmp    QWORD PTR [rbp-0x18],0xf
0x00893674: cmova  rdx,QWORD PTR [rbp-0x30]
0x00893679: mov    r8,QWORD PTR [rbp-0x20]
0x0089367d: mov    rcx,r14
0x00893680: call   0x14006fa10
0x00893685: mov    rsi,QWORD PTR [rsi+0x20]
0x00893689: mov    r15d,0xffff8ad0
0x0089368f: mov    WORD PTR [rbp-0x40],r15w
0x00893694: mov    eax,DWORD PTR [rsi+0x10]
0x00893697: test   al,0x10
0x00893699: jne    0x140893806
0x0089369f: test   al,0x8
0x008936a1: je     0x14089374d
0x008936a7: mov    rbx,QWORD PTR [rsi+0x38]
0x008936ab: mov    rdi,QWORD PTR [rsi+0x40]
0x008936af: nop
0x008936b0: cmp    rbx,rdi
0x008936b3: jae    0x140893716
0x008936b5: mov    rcx,QWORD PTR [rbx]
0x008936b8: mov    rax,QWORD PTR [rcx]
0x008936bb: call   QWORD PTR [rax+0x10]
0x008936be: cmp    eax,0xb
0x008936c1: je     0x1408936ec
0x008936c3: cmp    eax,0x12
0x008936c6: jne    0x1408936fa
0x008936c8: mov    rcx,QWORD PTR [rbx]
0x008936cb: mov    rax,QWORD PTR [rcx]
0x008936ce: call   QWORD PTR [rax+0x20]
0x008936d1: test   rax,rax
0x008936d4: je     0x1408936fa
0x008936d6: lea    r9,[rbp-0x3c]
0x008936da: lea    r8,[rbp-0x38]
0x008936de: lea    rdx,[rbp-0x40]
0x008936e2: mov    rcx,rax
0x008936e5: call   0x141367430
0x008936ea: jmp    0x140893765
0x008936ec: mov    rcx,QWORD PTR [rbx]
0x008936ef: mov    rax,QWORD PTR [rcx]
0x008936f2: call   QWORD PTR [rax+0x18]
0x008936f5: test   rax,rax
0x008936f8: jne    0x140893700
0x008936fa: add    rbx,0x8
0x008936fe: jmp    0x1408936b0
0x00893700: lea    r9,[rbp-0x3c]
0x00893704: lea    r8,[rbp-0x38]
0x00893708: lea    rdx,[rbp-0x40]
0x0089370c: mov    rcx,rax
0x0089370f: call   0x140c8baa0
0x00893714: jmp    0x140893765
0x00893716: mov    rax,QWORD PTR [rsi+0x20]
0x0089371a: mov    rcx,QWORD PTR [rsi+0x28]
0x0089371e: xchg   ax,ax
0x00893720: cmp    rax,rcx
0x00893723: jae    0x140893765
0x00893725: mov    rdx,QWORD PTR [rax]
0x00893728: cmp    DWORD PTR [rdx],0x7
0x0089372b: je     0x140893733
0x0089372d: add    rax,0x8
0x00893731: jmp    0x140893720
0x00893733: mov    rcx,QWORD PTR [rdx+0x8]
0x00893737: movzx  eax,WORD PTR [rcx+0x4]
0x0089373b: mov    WORD PTR [rbp-0x40],ax
0x0089373f: movzx  eax,WORD PTR [rcx+0x6]
0x00893743: mov    WORD PTR [rbp-0x38],ax
0x00893747: movzx  eax,WORD PTR [rcx+0x8]
0x0089374b: jmp    0x140893761
0x0089374d: movzx  eax,WORD PTR [rsi+0x8]
0x00893751: mov    WORD PTR [rbp-0x40],ax
0x00893755: movzx  eax,WORD PTR [rsi+0xa]
0x00893759: mov    WORD PTR [rbp-0x38],ax
0x0089375d: movzx  eax,WORD PTR [rsi+0xc]
0x00893761: mov    WORD PTR [rbp-0x3c],ax
0x00893765: movzx  eax,WORD PTR [rbp-0x40]
0x00893769: cmp    ax,r15w
0x0089376d: je     0x140893806
0x00893773: mov    rcx,QWORD PTR [rip+0x1b51996]        # 0x1423e5110
0x0089377a: cmp    ax,WORD PTR [rcx+0xa8]
0x00893781: jne    0x14089379d
0x00893783: movzx  eax,WORD PTR [rcx+0xaa]
0x0089378a: cmp    WORD PTR [rbp-0x38],ax
0x0089378e: jne    0x14089379d
0x00893790: movzx  eax,WORD PTR [rcx+0xac]
0x00893797: cmp    WORD PTR [rbp-0x3c],ax
0x0089379b: je     0x140893806
0x0089379d: mov    r8d,0x2
0x008937a3: lea    rdx,[rip+0xd81d96]        # 0x141615540 ; literal=" ("
0x008937aa: mov    rcx,r14
0x008937ad: call   0x14006fa10
0x008937b2: mov    QWORD PTR [rsp+0x30],r14
0x008937b7: movzx  eax,WORD PTR [rbp-0x3c]
0x008937bb: mov    WORD PTR [rsp+0x28],ax
0x008937c0: movzx  eax,WORD PTR [rbp-0x38]
0x008937c4: mov    WORD PTR [rsp+0x20],ax
0x008937c9: movzx  r9d,WORD PTR [rbp-0x40]
0x008937ce: mov    rcx,QWORD PTR [rip+0x1b5193b]        # 0x1423e5110
0x008937d5: movzx  r8d,WORD PTR [rcx+0xac]
0x008937dd: movzx  edx,WORD PTR [rcx+0xaa]
0x008937e4: movzx  ecx,WORD PTR [rcx+0xa8]
0x008937eb: call   0x14074f220
0x008937f0: mov    r8d,0x1
0x008937f6: lea    rdx,[rip+0xd81d83]        # 0x141615580 ; literal=")"
0x008937fd: mov    rcx,r14
0x00893800: call   0x14006fa10
0x00893805: nop
0x00893806: mov    rdx,QWORD PTR [rbp-0x18]
0x0089380a: cmp    rdx,0xf
0x0089380e: jbe    0x140893844
0x00893810: inc    rdx
0x00893813: mov    rcx,QWORD PTR [rbp-0x30]
0x00893817: mov    rax,rcx
0x0089381a: cmp    rdx,0x1000
0x00893821: jb     0x14089383f
0x00893823: add    rdx,0x27
0x00893827: mov    rcx,QWORD PTR [rcx-0x8]
0x0089382b: sub    rax,rcx
0x0089382e: add    rax,0xfffffffffffffff8
0x00893832: cmp    rax,0x1f
0x00893836: jbe    0x14089383f
0x00893838: call   QWORD PTR [rip+0xd522ea]        # 0x1415e5b28
0x0089383e: int3
0x0089383f: call   0x141539680
0x00893844: mov    rcx,QWORD PTR [rbp-0x10]
0x00893848: xor    rcx,rsp
0x0089384b: call   0x141539660
0x00893850: mov    rbx,QWORD PTR [rsp+0xc0]
0x00893858: add    rsp,0x80
0x0089385f: pop    r15
0x00893861: pop    r14
0x00893863: pop    rdi
0x00893864: pop    rsi
0x00893865: pop    rbp
0x00893866: ret

# steam PE:6a70a6d9:02711000; adventure_environment_pick_up_building_itemst+8; RVA 0x893870..0x893ba1
0x00893870: mov    QWORD PTR [rsp+0x18],rbx
0x00893875: mov    QWORD PTR [rsp+0x20],rsi
0x0089387a: push   rbp
0x0089387b: push   rdi
0x0089387c: push   r12
0x0089387e: push   r14
0x00893880: push   r15
0x00893882: lea    rbp,[rsp-0x37]
0x00893887: sub    rsp,0xa0
0x0089388e: mov    rax,QWORD PTR [rip+0x10087ab]        # 0x14189c040
0x00893895: xor    rax,rsp
0x00893898: mov    QWORD PTR [rbp+0x27],rax
0x0089389c: mov    r15,rdx
0x0089389f: mov    r14,rcx
0x008938a2: cmp    QWORD PTR [rcx+0x20],0x0
0x008938a7: je     0x140893b79
0x008938ad: mov    r8d,0x4
0x008938b3: lea    rdx,[rip+0xe20a96]        # 0x1416b4350 ; literal="Get "
0x008938ba: mov    rcx,r15
0x008938bd: call   0x14006f8d0
0x008938c2: xorps  xmm0,xmm0
0x008938c5: movups XMMWORD PTR [rbp+0x7],xmm0
0x008938c9: mov    QWORD PTR [rbp+0x17],0x0
0x008938d1: mov    QWORD PTR [rbp+0x1f],0xf
0x008938d9: mov    BYTE PTR [rbp+0x7],0x0
0x008938dd: mov    r9d,0xffffffff
0x008938e3: xor    r8d,r8d
0x008938e6: lea    rdx,[rbp+0x7]
0x008938ea: mov    rcx,QWORD PTR [r14+0x20]
0x008938ee: call   0x140c65450
0x008938f3: lea    rdx,[rbp+0x7]
0x008938f7: cmp    QWORD PTR [rbp+0x1f],0xf
0x008938fc: cmova  rdx,QWORD PTR [rbp+0x7]
0x00893901: mov    r8,QWORD PTR [rbp+0x17]
0x00893905: mov    rcx,r15
0x00893908: call   0x14006fa10
0x0089390d: mov    rsi,QWORD PTR [r14+0x20]
0x00893911: mov    r12d,0xffff8ad0
0x00893917: mov    WORD PTR [rbp-0x29],r12w
0x0089391c: mov    eax,DWORD PTR [rsi+0x10]
0x0089391f: test   al,0x10
0x00893921: jne    0x1408939ea
0x00893927: test   al,0x8
0x00893929: je     0x1408939d2
0x0089392f: mov    rbx,QWORD PTR [rsi+0x38]
0x00893933: mov    rdi,QWORD PTR [rsi+0x40]
0x00893937: cmp    rbx,rdi
0x0089393a: jae    0x14089399d
0x0089393c: mov    rcx,QWORD PTR [rbx]
0x0089393f: mov    rax,QWORD PTR [rcx]
0x00893942: call   QWORD PTR [rax+0x10]
0x00893945: cmp    eax,0xb
0x00893948: je     0x140893973
0x0089394a: cmp    eax,0x12
0x0089394d: jne    0x140893981
0x0089394f: mov    rcx,QWORD PTR [rbx]
0x00893952: mov    rax,QWORD PTR [rcx]
0x00893955: call   QWORD PTR [rax+0x20]
0x00893958: test   rax,rax
0x0089395b: je     0x140893981
0x0089395d: lea    r9,[rbp-0x25]
0x00893961: lea    r8,[rbp-0x21]
0x00893965: lea    rdx,[rbp-0x29]
0x00893969: mov    rcx,rax
0x0089396c: call   0x141367430
0x00893971: jmp    0x1408939ea
0x00893973: mov    rcx,QWORD PTR [rbx]
0x00893976: mov    rax,QWORD PTR [rcx]
0x00893979: call   QWORD PTR [rax+0x18]
0x0089397c: test   rax,rax
0x0089397f: jne    0x140893987
0x00893981: add    rbx,0x8
0x00893985: jmp    0x140893937
0x00893987: lea    r9,[rbp-0x25]
0x0089398b: lea    r8,[rbp-0x21]
0x0089398f: lea    rdx,[rbp-0x29]
0x00893993: mov    rcx,rax
0x00893996: call   0x140c8baa0
0x0089399b: jmp    0x1408939ea
0x0089399d: mov    rax,QWORD PTR [rsi+0x20]
0x008939a1: mov    rcx,QWORD PTR [rsi+0x28]
0x008939a5: cmp    rax,rcx
0x008939a8: jae    0x1408939ea
0x008939aa: mov    rdx,QWORD PTR [rax]
0x008939ad: cmp    DWORD PTR [rdx],0x7
0x008939b0: je     0x1408939b8
0x008939b2: add    rax,0x8
0x008939b6: jmp    0x1408939a5
0x008939b8: mov    rcx,QWORD PTR [rdx+0x8]
0x008939bc: movzx  eax,WORD PTR [rcx+0x4]
0x008939c0: mov    WORD PTR [rbp-0x29],ax
0x008939c4: movzx  eax,WORD PTR [rcx+0x6]
0x008939c8: mov    WORD PTR [rbp-0x21],ax
0x008939cc: movzx  eax,WORD PTR [rcx+0x8]
0x008939d0: jmp    0x1408939e6
0x008939d2: movzx  eax,WORD PTR [rsi+0x8]
0x008939d6: mov    WORD PTR [rbp-0x29],ax
0x008939da: movzx  eax,WORD PTR [rsi+0xa]
0x008939de: mov    WORD PTR [rbp-0x21],ax
0x008939e2: movzx  eax,WORD PTR [rsi+0xc]
0x008939e6: mov    WORD PTR [rbp-0x25],ax
0x008939ea: cmp    DWORD PTR [r14+0x8],0x0
0x008939ef: jne    0x140893a9a
0x008939f5: cmp    QWORD PTR [r14+0x28],0x0
0x008939fa: je     0x140893a9a
0x00893a00: mov    r8d,0x6
0x00893a06: lea    rdx,[rip+0xd59f6f]        # 0x1415ed97c ; literal=" from "
0x00893a0d: mov    rcx,r15
0x00893a10: call   0x14006fa10
0x00893a15: xorps  xmm0,xmm0
0x00893a18: movups XMMWORD PTR [rbp-0x19],xmm0
0x00893a1c: mov    QWORD PTR [rbp-0x9],0x0
0x00893a24: mov    QWORD PTR [rbp-0x1],0xf
0x00893a2c: mov    BYTE PTR [rbp-0x19],0x0
0x00893a30: mov    rcx,QWORD PTR [r14+0x28]
0x00893a34: mov    rax,QWORD PTR [rcx]
0x00893a37: lea    rdx,[rbp-0x19]
0x00893a3b: call   QWORD PTR [rax+0x188]
0x00893a41: lea    rdx,[rbp-0x19]
0x00893a45: cmp    QWORD PTR [rbp-0x1],0xf
0x00893a4a: cmova  rdx,QWORD PTR [rbp-0x19]
0x00893a4f: mov    r8,QWORD PTR [rbp-0x9]
0x00893a53: mov    rcx,r15
0x00893a56: call   0x14006fa10
0x00893a5b: nop
0x00893a5c: mov    rdx,QWORD PTR [rbp-0x1]
0x00893a60: cmp    rdx,0xf
0x00893a64: jbe    0x140893a9a
0x00893a66: inc    rdx
0x00893a69: mov    rcx,QWORD PTR [rbp-0x19]
0x00893a6d: mov    rax,rcx
0x00893a70: cmp    rdx,0x1000
0x00893a77: jb     0x140893a95
0x00893a79: add    rdx,0x27
0x00893a7d: mov    rcx,QWORD PTR [rcx-0x8]
0x00893a81: sub    rax,rcx
0x00893a84: add    rax,0xfffffffffffffff8
0x00893a88: cmp    rax,0x1f
0x00893a8c: jbe    0x140893a95
0x00893a8e: call   QWORD PTR [rip+0xd52094]        # 0x1415e5b28
0x00893a94: int3
0x00893a95: call   0x141539680
0x00893a9a: movzx  eax,WORD PTR [rbp-0x29]
0x00893a9e: cmp    ax,r12w
0x00893aa2: je     0x140893b3b
0x00893aa8: mov    rcx,QWORD PTR [rip+0x1b51661]        # 0x1423e5110
0x00893aaf: cmp    ax,WORD PTR [rcx+0xa8]
0x00893ab6: jne    0x140893ad2
0x00893ab8: movzx  eax,WORD PTR [rcx+0xaa]
0x00893abf: cmp    WORD PTR [rbp-0x21],ax
0x00893ac3: jne    0x140893ad2
0x00893ac5: movzx  eax,WORD PTR [rcx+0xac]
0x00893acc: cmp    WORD PTR [rbp-0x25],ax
0x00893ad0: je     0x140893b3b
0x00893ad2: mov    r8d,0x2
0x00893ad8: lea    rdx,[rip+0xd81a61]        # 0x141615540 ; literal=" ("
0x00893adf: mov    rcx,r15
0x00893ae2: call   0x14006fa10
0x00893ae7: mov    QWORD PTR [rsp+0x30],r15
0x00893aec: movzx  eax,WORD PTR [rbp-0x25]
0x00893af0: mov    WORD PTR [rsp+0x28],ax
0x00893af5: movzx  eax,WORD PTR [rbp-0x21]
0x00893af9: mov    WORD PTR [rsp+0x20],ax
0x00893afe: movzx  r9d,WORD PTR [rbp-0x29]
0x00893b03: mov    rcx,QWORD PTR [rip+0x1b51606]        # 0x1423e5110
0x00893b0a: movzx  r8d,WORD PTR [rcx+0xac]
0x00893b12: movzx  edx,WORD PTR [rcx+0xaa]
0x00893b19: movzx  ecx,WORD PTR [rcx+0xa8]
0x00893b20: call   0x14074f220
0x00893b25: mov    r8d,0x1
0x00893b2b: lea    rdx,[rip+0xd81a4e]        # 0x141615580 ; literal=")"
0x00893b32: mov    rcx,r15
0x00893b35: call   0x14006fa10
0x00893b3a: nop
0x00893b3b: mov    rdx,QWORD PTR [rbp+0x1f]
0x00893b3f: cmp    rdx,0xf
0x00893b43: jbe    0x140893b79
0x00893b45: inc    rdx
0x00893b48: mov    rcx,QWORD PTR [rbp+0x7]
0x00893b4c: mov    rax,rcx
0x00893b4f: cmp    rdx,0x1000
0x00893b56: jb     0x140893b74
0x00893b58: add    rdx,0x27
0x00893b5c: mov    rcx,QWORD PTR [rcx-0x8]
0x00893b60: sub    rax,rcx
0x00893b63: add    rax,0xfffffffffffffff8
0x00893b67: cmp    rax,0x1f
0x00893b6b: jbe    0x140893b74
0x00893b6d: call   QWORD PTR [rip+0xd51fb5]        # 0x1415e5b28
0x00893b73: int3
0x00893b74: call   0x141539680
0x00893b79: mov    rcx,QWORD PTR [rbp+0x27]
0x00893b7d: xor    rcx,rsp
0x00893b80: call   0x141539660
0x00893b85: lea    r11,[rsp+0xa0]
0x00893b8d: mov    rbx,QWORD PTR [r11+0x40]
0x00893b91: mov    rsi,QWORD PTR [r11+0x48]
0x00893b95: mov    rsp,r11
0x00893b98: pop    r15
0x00893b9a: pop    r14
0x00893b9c: pop    r12
0x00893b9e: pop    rdi
0x00893b9f: pop    rbp
0x00893ba0: ret

# steam PE:6a70a6d9:02711000; adventure_environment_pick_up_building_item_contentsst+8;adventure_environment_take_item_from_containerst+8; RVA 0x893bb0..0x893ee6
0x00893bb0: mov    QWORD PTR [rsp+0x18],rbx
0x00893bb5: mov    QWORD PTR [rsp+0x20],rsi
0x00893bba: push   rbp
0x00893bbb: push   rdi
0x00893bbc: push   r12
0x00893bbe: push   r14
0x00893bc0: push   r15
0x00893bc2: lea    rbp,[rsp-0x37]
0x00893bc7: sub    rsp,0xa0
0x00893bce: mov    rax,QWORD PTR [rip+0x100846b]        # 0x14189c040
0x00893bd5: xor    rax,rsp
0x00893bd8: mov    QWORD PTR [rbp+0x27],rax
0x00893bdc: mov    r15,rdx
0x00893bdf: mov    r14,rcx
0x00893be2: cmp    QWORD PTR [rcx+0x20],0x0
0x00893be7: je     0x140893ebe
0x00893bed: mov    r8d,0x4
0x00893bf3: lea    rdx,[rip+0xe20756]        # 0x1416b4350 ; literal="Get "
0x00893bfa: mov    rcx,r15
0x00893bfd: call   0x14006f8d0
0x00893c02: xorps  xmm0,xmm0
0x00893c05: movups XMMWORD PTR [rbp+0x7],xmm0
0x00893c09: mov    QWORD PTR [rbp+0x17],0x0
0x00893c11: mov    QWORD PTR [rbp+0x1f],0xf
0x00893c19: mov    BYTE PTR [rbp+0x7],0x0
0x00893c1d: mov    r9d,0xffffffff
0x00893c23: xor    r8d,r8d
0x00893c26: lea    rdx,[rbp+0x7]
0x00893c2a: mov    rcx,QWORD PTR [r14+0x20]
0x00893c2e: call   0x140c65450
0x00893c33: lea    rdx,[rbp+0x7]
0x00893c37: cmp    QWORD PTR [rbp+0x1f],0xf
0x00893c3c: cmova  rdx,QWORD PTR [rbp+0x7]
0x00893c41: mov    r8,QWORD PTR [rbp+0x17]
0x00893c45: mov    rcx,r15
0x00893c48: call   0x14006fa10
0x00893c4d: mov    rsi,QWORD PTR [r14+0x20]
0x00893c51: mov    r12d,0xffff8ad0
0x00893c57: mov    WORD PTR [rbp-0x29],r12w
0x00893c5c: mov    eax,DWORD PTR [rsi+0x10]
0x00893c5f: test   al,0x10
0x00893c61: jne    0x140893d2a
0x00893c67: test   al,0x8
0x00893c69: je     0x140893d12
0x00893c6f: mov    rbx,QWORD PTR [rsi+0x38]
0x00893c73: mov    rdi,QWORD PTR [rsi+0x40]
0x00893c77: cmp    rbx,rdi
0x00893c7a: jae    0x140893cdd
0x00893c7c: mov    rcx,QWORD PTR [rbx]
0x00893c7f: mov    rax,QWORD PTR [rcx]
0x00893c82: call   QWORD PTR [rax+0x10]
0x00893c85: cmp    eax,0xb
0x00893c88: je     0x140893cb3
0x00893c8a: cmp    eax,0x12
0x00893c8d: jne    0x140893cc1
0x00893c8f: mov    rcx,QWORD PTR [rbx]
0x00893c92: mov    rax,QWORD PTR [rcx]
0x00893c95: call   QWORD PTR [rax+0x20]
0x00893c98: test   rax,rax
0x00893c9b: je     0x140893cc1
0x00893c9d: lea    r9,[rbp-0x25]
0x00893ca1: lea    r8,[rbp-0x21]
0x00893ca5: lea    rdx,[rbp-0x29]
0x00893ca9: mov    rcx,rax
0x00893cac: call   0x141367430
0x00893cb1: jmp    0x140893d2a
0x00893cb3: mov    rcx,QWORD PTR [rbx]
0x00893cb6: mov    rax,QWORD PTR [rcx]
0x00893cb9: call   QWORD PTR [rax+0x18]
0x00893cbc: test   rax,rax
0x00893cbf: jne    0x140893cc7
0x00893cc1: add    rbx,0x8
0x00893cc5: jmp    0x140893c77
0x00893cc7: lea    r9,[rbp-0x25]
0x00893ccb: lea    r8,[rbp-0x21]
0x00893ccf: lea    rdx,[rbp-0x29]
0x00893cd3: mov    rcx,rax
0x00893cd6: call   0x140c8baa0
0x00893cdb: jmp    0x140893d2a
0x00893cdd: mov    rax,QWORD PTR [rsi+0x20]
0x00893ce1: mov    rcx,QWORD PTR [rsi+0x28]
0x00893ce5: cmp    rax,rcx
0x00893ce8: jae    0x140893d2a
0x00893cea: mov    rdx,QWORD PTR [rax]
0x00893ced: cmp    DWORD PTR [rdx],0x7
0x00893cf0: je     0x140893cf8
0x00893cf2: add    rax,0x8
0x00893cf6: jmp    0x140893ce5
0x00893cf8: mov    rcx,QWORD PTR [rdx+0x8]
0x00893cfc: movzx  eax,WORD PTR [rcx+0x4]
0x00893d00: mov    WORD PTR [rbp-0x29],ax
0x00893d04: movzx  eax,WORD PTR [rcx+0x6]
0x00893d08: mov    WORD PTR [rbp-0x21],ax
0x00893d0c: movzx  eax,WORD PTR [rcx+0x8]
0x00893d10: jmp    0x140893d26
0x00893d12: movzx  eax,WORD PTR [rsi+0x8]
0x00893d16: mov    WORD PTR [rbp-0x29],ax
0x00893d1a: movzx  eax,WORD PTR [rsi+0xa]
0x00893d1e: mov    WORD PTR [rbp-0x21],ax
0x00893d22: movzx  eax,WORD PTR [rsi+0xc]
0x00893d26: mov    WORD PTR [rbp-0x25],ax
0x00893d2a: cmp    DWORD PTR [r14+0x8],0x0
0x00893d2f: jne    0x140893ddf
0x00893d35: cmp    QWORD PTR [r14+0x28],0x0
0x00893d3a: je     0x140893ddf
0x00893d40: mov    r8d,0x6
0x00893d46: lea    rdx,[rip+0xd59c2f]        # 0x1415ed97c ; literal=" from "
0x00893d4d: mov    rcx,r15
0x00893d50: call   0x14006fa10
0x00893d55: xorps  xmm0,xmm0
0x00893d58: movups XMMWORD PTR [rbp-0x19],xmm0
0x00893d5c: mov    QWORD PTR [rbp-0x9],0x0
0x00893d64: mov    QWORD PTR [rbp-0x1],0xf
0x00893d6c: mov    BYTE PTR [rbp-0x19],0x0
0x00893d70: mov    r9d,0xffffffff
0x00893d76: xor    r8d,r8d
0x00893d79: lea    rdx,[rbp-0x19]
0x00893d7d: mov    rcx,QWORD PTR [r14+0x28]
0x00893d81: call   0x140c65450
0x00893d86: lea    rdx,[rbp-0x19]
0x00893d8a: cmp    QWORD PTR [rbp-0x1],0xf
0x00893d8f: cmova  rdx,QWORD PTR [rbp-0x19]
0x00893d94: mov    r8,QWORD PTR [rbp-0x9]
0x00893d98: mov    rcx,r15
0x00893d9b: call   0x14006fa10
0x00893da0: nop
0x00893da1: mov    rdx,QWORD PTR [rbp-0x1]
0x00893da5: cmp    rdx,0xf
0x00893da9: jbe    0x140893ddf
0x00893dab: inc    rdx
0x00893dae: mov    rcx,QWORD PTR [rbp-0x19]
0x00893db2: mov    rax,rcx
0x00893db5: cmp    rdx,0x1000
0x00893dbc: jb     0x140893dda
0x00893dbe: add    rdx,0x27
0x00893dc2: mov    rcx,QWORD PTR [rcx-0x8]
0x00893dc6: sub    rax,rcx
0x00893dc9: add    rax,0xfffffffffffffff8
0x00893dcd: cmp    rax,0x1f
0x00893dd1: jbe    0x140893dda
0x00893dd3: call   QWORD PTR [rip+0xd51d4f]        # 0x1415e5b28
0x00893dd9: int3
0x00893dda: call   0x141539680
0x00893ddf: movzx  eax,WORD PTR [rbp-0x29]
0x00893de3: cmp    ax,r12w
0x00893de7: je     0x140893e80
0x00893ded: mov    rcx,QWORD PTR [rip+0x1b5131c]        # 0x1423e5110
0x00893df4: cmp    ax,WORD PTR [rcx+0xa8]
0x00893dfb: jne    0x140893e17
0x00893dfd: movzx  eax,WORD PTR [rcx+0xaa]
0x00893e04: cmp    WORD PTR [rbp-0x21],ax
0x00893e08: jne    0x140893e17
0x00893e0a: movzx  eax,WORD PTR [rcx+0xac]
0x00893e11: cmp    WORD PTR [rbp-0x25],ax
0x00893e15: je     0x140893e80
0x00893e17: mov    r8d,0x2
0x00893e1d: lea    rdx,[rip+0xd8171c]        # 0x141615540 ; literal=" ("
0x00893e24: mov    rcx,r15
0x00893e27: call   0x14006fa10
0x00893e2c: mov    QWORD PTR [rsp+0x30],r15
0x00893e31: movzx  eax,WORD PTR [rbp-0x25]
0x00893e35: mov    WORD PTR [rsp+0x28],ax
0x00893e3a: movzx  eax,WORD PTR [rbp-0x21]
0x00893e3e: mov    WORD PTR [rsp+0x20],ax
0x00893e43: movzx  r9d,WORD PTR [rbp-0x29]
0x00893e48: mov    rcx,QWORD PTR [rip+0x1b512c1]        # 0x1423e5110
0x00893e4f: movzx  r8d,WORD PTR [rcx+0xac]
0x00893e57: movzx  edx,WORD PTR [rcx+0xaa]
0x00893e5e: movzx  ecx,WORD PTR [rcx+0xa8]
0x00893e65: call   0x14074f220
0x00893e6a: mov    r8d,0x1
0x00893e70: lea    rdx,[rip+0xd81709]        # 0x141615580 ; literal=")"
0x00893e77: mov    rcx,r15
0x00893e7a: call   0x14006fa10
0x00893e7f: nop
0x00893e80: mov    rdx,QWORD PTR [rbp+0x1f]
0x00893e84: cmp    rdx,0xf
0x00893e88: jbe    0x140893ebe
0x00893e8a: inc    rdx
0x00893e8d: mov    rcx,QWORD PTR [rbp+0x7]
0x00893e91: mov    rax,rcx
0x00893e94: cmp    rdx,0x1000
0x00893e9b: jb     0x140893eb9
0x00893e9d: add    rdx,0x27
0x00893ea1: mov    rcx,QWORD PTR [rcx-0x8]
0x00893ea5: sub    rax,rcx
0x00893ea8: add    rax,0xfffffffffffffff8
0x00893eac: cmp    rax,0x1f
0x00893eb0: jbe    0x140893eb9
0x00893eb2: call   QWORD PTR [rip+0xd51c70]        # 0x1415e5b28
0x00893eb8: int3
0x00893eb9: call   0x141539680
0x00893ebe: mov    rcx,QWORD PTR [rbp+0x27]
0x00893ec2: xor    rcx,rsp
0x00893ec5: call   0x141539660
0x00893eca: lea    r11,[rsp+0xa0]
0x00893ed2: mov    rbx,QWORD PTR [r11+0x40]
0x00893ed6: mov    rsi,QWORD PTR [r11+0x48]
0x00893eda: mov    rsp,r11
0x00893edd: pop    r15
0x00893edf: pop    r14
0x00893ee1: pop    r12
0x00893ee3: pop    rdi
0x00893ee4: pop    rbp
0x00893ee5: ret

# steam PE:6a70a6d9:02711000; adventure_environment_pick_vegetationst+8; RVA 0x893ef0..0x89417d
0x00893ef0: mov    QWORD PTR [rsp+0x18],rbx
0x00893ef5: push   rbp
0x00893ef6: push   rsi
0x00893ef7: push   rdi
0x00893ef8: push   r14
0x00893efa: push   r15
0x00893efc: mov    rbp,rsp
0x00893eff: sub    rsp,0x80
0x00893f06: mov    rax,QWORD PTR [rip+0x1008133]        # 0x14189c040
0x00893f0d: xor    rax,rsp
0x00893f10: mov    QWORD PTR [rbp-0x10],rax
0x00893f14: mov    r14,rdx
0x00893f17: mov    rsi,rcx
0x00893f1a: mov    rcx,QWORD PTR [rcx+0x20]
0x00893f1e: test   rcx,rcx
0x00893f21: je     0x14089415a
0x00893f27: mov    rax,QWORD PTR [rcx]
0x00893f2a: call   QWORD PTR [rax]
0x00893f2c: lea    rcx,[rip+0xe1d439]        # 0x1416b136c ; literal="Pick "
0x00893f33: lea    rdx,[rip+0xe1cdba]        # 0x1416b0cf4 ; literal="Pull "
0x00893f3a: cmp    ax,0x5b
0x00893f3e: cmovne rdx,rcx
0x00893f42: mov    r8d,0x5
0x00893f48: mov    rcx,r14
0x00893f4b: call   0x14006f8d0
0x00893f50: xorps  xmm0,xmm0
0x00893f53: movups XMMWORD PTR [rbp-0x30],xmm0
0x00893f57: mov    QWORD PTR [rbp-0x20],0x0
0x00893f5f: mov    QWORD PTR [rbp-0x18],0xf
0x00893f67: mov    BYTE PTR [rbp-0x30],0x0
0x00893f6b: mov    r9d,0xffffffff
0x00893f71: xor    r8d,r8d
0x00893f74: lea    rdx,[rbp-0x30]
0x00893f78: mov    rcx,QWORD PTR [rsi+0x20]
0x00893f7c: call   0x140c65450
0x00893f81: lea    rdx,[rbp-0x30]
0x00893f85: cmp    QWORD PTR [rbp-0x18],0xf
0x00893f8a: cmova  rdx,QWORD PTR [rbp-0x30]
0x00893f8f: mov    r8,QWORD PTR [rbp-0x20]
0x00893f93: mov    rcx,r14
0x00893f96: call   0x14006fa10
0x00893f9b: mov    rsi,QWORD PTR [rsi+0x20]
0x00893f9f: mov    r15d,0xffff8ad0
0x00893fa5: mov    WORD PTR [rbp-0x40],r15w
0x00893faa: mov    eax,DWORD PTR [rsi+0x10]
0x00893fad: test   al,0x10
0x00893faf: jne    0x14089411c
0x00893fb5: test   al,0x8
0x00893fb7: je     0x140894063
0x00893fbd: mov    rbx,QWORD PTR [rsi+0x38]
0x00893fc1: mov    rdi,QWORD PTR [rsi+0x40]
0x00893fc5: cmp    rbx,rdi
0x00893fc8: jae    0x14089402e
0x00893fca: mov    rcx,QWORD PTR [rbx]
0x00893fcd: mov    rax,QWORD PTR [rcx]
0x00893fd0: call   QWORD PTR [rax+0x10]
0x00893fd3: cmp    eax,0xb
0x00893fd6: je     0x140894004
0x00893fd8: cmp    eax,0x12
0x00893fdb: jne    0x140894012
0x00893fdd: mov    rcx,QWORD PTR [rbx]
0x00893fe0: mov    rax,QWORD PTR [rcx]
0x00893fe3: call   QWORD PTR [rax+0x20]
0x00893fe6: test   rax,rax
0x00893fe9: je     0x140894012
0x00893feb: lea    r9,[rbp-0x3c]
0x00893fef: lea    r8,[rbp-0x38]
0x00893ff3: lea    rdx,[rbp-0x40]
0x00893ff7: mov    rcx,rax
0x00893ffa: call   0x141367430
0x00893fff: jmp    0x14089407b
0x00894004: mov    rcx,QWORD PTR [rbx]
0x00894007: mov    rax,QWORD PTR [rcx]
0x0089400a: call   QWORD PTR [rax+0x18]
0x0089400d: test   rax,rax
0x00894010: jne    0x140894018
0x00894012: add    rbx,0x8
0x00894016: jmp    0x140893fc5
0x00894018: lea    r9,[rbp-0x3c]
0x0089401c: lea    r8,[rbp-0x38]
0x00894020: lea    rdx,[rbp-0x40]
0x00894024: mov    rcx,rax
0x00894027: call   0x140c8baa0
0x0089402c: jmp    0x14089407b
0x0089402e: mov    rax,QWORD PTR [rsi+0x20]
0x00894032: mov    rcx,QWORD PTR [rsi+0x28]
0x00894036: cmp    rax,rcx
0x00894039: jae    0x14089407b
0x0089403b: mov    rdx,QWORD PTR [rax]
0x0089403e: cmp    DWORD PTR [rdx],0x7
0x00894041: je     0x140894049
0x00894043: add    rax,0x8
0x00894047: jmp    0x140894036
0x00894049: mov    rcx,QWORD PTR [rdx+0x8]
0x0089404d: movzx  eax,WORD PTR [rcx+0x4]
0x00894051: mov    WORD PTR [rbp-0x40],ax
0x00894055: movzx  eax,WORD PTR [rcx+0x6]
0x00894059: mov    WORD PTR [rbp-0x38],ax
0x0089405d: movzx  eax,WORD PTR [rcx+0x8]
0x00894061: jmp    0x140894077
0x00894063: movzx  eax,WORD PTR [rsi+0x8]
0x00894067: mov    WORD PTR [rbp-0x40],ax
0x0089406b: movzx  eax,WORD PTR [rsi+0xa]
0x0089406f: mov    WORD PTR [rbp-0x38],ax
0x00894073: movzx  eax,WORD PTR [rsi+0xc]
0x00894077: mov    WORD PTR [rbp-0x3c],ax
0x0089407b: movzx  eax,WORD PTR [rbp-0x40]
0x0089407f: cmp    ax,r15w
0x00894083: je     0x14089411c
0x00894089: mov    rcx,QWORD PTR [rip+0x1b51080]        # 0x1423e5110
0x00894090: cmp    ax,WORD PTR [rcx+0xa8]
0x00894097: jne    0x1408940b3
0x00894099: movzx  eax,WORD PTR [rcx+0xaa]
0x008940a0: cmp    WORD PTR [rbp-0x38],ax
0x008940a4: jne    0x1408940b3
0x008940a6: movzx  eax,WORD PTR [rcx+0xac]
0x008940ad: cmp    WORD PTR [rbp-0x3c],ax
0x008940b1: je     0x14089411c
0x008940b3: mov    r8d,0x2
0x008940b9: lea    rdx,[rip+0xd81480]        # 0x141615540 ; literal=" ("
0x008940c0: mov    rcx,r14
0x008940c3: call   0x14006fa10
0x008940c8: mov    QWORD PTR [rsp+0x30],r14
0x008940cd: movzx  eax,WORD PTR [rbp-0x3c]
0x008940d1: mov    WORD PTR [rsp+0x28],ax
0x008940d6: movzx  eax,WORD PTR [rbp-0x38]
0x008940da: mov    WORD PTR [rsp+0x20],ax
0x008940df: movzx  r9d,WORD PTR [rbp-0x40]
0x008940e4: mov    rcx,QWORD PTR [rip+0x1b51025]        # 0x1423e5110
0x008940eb: movzx  r8d,WORD PTR [rcx+0xac]
0x008940f3: movzx  edx,WORD PTR [rcx+0xaa]
0x008940fa: movzx  ecx,WORD PTR [rcx+0xa8]
0x00894101: call   0x14074f220
0x00894106: mov    r8d,0x1
0x0089410c: lea    rdx,[rip+0xd8146d]        # 0x141615580 ; literal=")"
0x00894113: mov    rcx,r14
0x00894116: call   0x14006fa10
0x0089411b: nop
0x0089411c: mov    rdx,QWORD PTR [rbp-0x18]
0x00894120: cmp    rdx,0xf
0x00894124: jbe    0x14089415a
0x00894126: inc    rdx
0x00894129: mov    rcx,QWORD PTR [rbp-0x30]
0x0089412d: mov    rax,rcx
0x00894130: cmp    rdx,0x1000
0x00894137: jb     0x140894155
0x00894139: add    rdx,0x27
0x0089413d: mov    rcx,QWORD PTR [rcx-0x8]
0x00894141: sub    rax,rcx
0x00894144: add    rax,0xfffffffffffffff8
0x00894148: cmp    rax,0x1f
0x0089414c: jbe    0x140894155
0x0089414e: call   QWORD PTR [rip+0xd519d4]        # 0x1415e5b28
0x00894154: int3
0x00894155: call   0x141539680
0x0089415a: mov    rcx,QWORD PTR [rbp-0x10]
0x0089415e: xor    rcx,rsp
0x00894161: call   0x141539660
0x00894166: mov    rbx,QWORD PTR [rsp+0xc0]
0x0089416e: add    rsp,0x80
0x00894175: pop    r15
0x00894177: pop    r14
0x00894179: pop    rdi
0x0089417a: pop    rsi
0x0089417b: pop    rbp
0x0089417c: ret

# steam PE:6a70a6d9:02711000; adventure_option_drop_itemst+8;adventure_option_eat_drink_itemst+8;adventure_option_interact_with_itemst+8;adventure_option_inventory_itemst+8;adventure_option_put_itemst+8;adventure_option_remove_itemst+8;adventure_option_throw_itemst+8;adventure_option_view_itemst+8;adventure_option_wear_itemst+8; RVA 0x894180..0x894240
0x00894180: rex push rbx
0x00894182: sub    rsp,0x50
0x00894186: mov    rax,QWORD PTR [rip+0x1007eb3]        # 0x14189c040
0x0089418d: xor    rax,rsp
0x00894190: mov    QWORD PTR [rsp+0x40],rax
0x00894195: mov    rbx,rdx
0x00894198: xorps  xmm0,xmm0
0x0089419b: movups XMMWORD PTR [rsp+0x20],xmm0
0x008941a0: mov    QWORD PTR [rsp+0x30],0x0
0x008941a9: mov    QWORD PTR [rsp+0x38],0xf
0x008941b2: mov    BYTE PTR [rsp+0x20],0x0
0x008941b7: mov    r9d,0xffffffff
0x008941bd: xor    r8d,r8d
0x008941c0: lea    rdx,[rsp+0x20]
0x008941c5: mov    rcx,QWORD PTR [rcx+0x10]
0x008941c9: call   0x140c65450
0x008941ce: lea    rdx,[rsp+0x20]
0x008941d3: cmp    QWORD PTR [rsp+0x38],0xf
0x008941d9: cmova  rdx,QWORD PTR [rsp+0x20]
0x008941df: mov    r8,QWORD PTR [rsp+0x30]
0x008941e4: mov    rcx,rbx
0x008941e7: call   0x14006fa10
0x008941ec: nop
0x008941ed: mov    rdx,QWORD PTR [rsp+0x38]
0x008941f2: cmp    rdx,0xf
0x008941f6: jbe    0x14089422d
0x008941f8: inc    rdx
0x008941fb: mov    rcx,QWORD PTR [rsp+0x20]
0x00894200: mov    rax,rcx
0x00894203: cmp    rdx,0x1000
0x0089420a: jb     0x140894228
0x0089420c: add    rdx,0x27
0x00894210: mov    rcx,QWORD PTR [rcx-0x8]
0x00894214: sub    rax,rcx
0x00894217: add    rax,0xfffffffffffffff8
0x0089421b: cmp    rax,0x1f
0x0089421f: jbe    0x140894228
0x00894221: call   QWORD PTR [rip+0xd51901]        # 0x1415e5b28
0x00894227: int3
0x00894228: call   0x141539680
0x0089422d: mov    rcx,QWORD PTR [rsp+0x40]
0x00894232: xor    rcx,rsp
0x00894235: call   0x141539660
0x0089423a: add    rsp,0x50
0x0089423e: pop    rbx
0x0089423f: ret

# steam PE:6a70a6d9:02711000; adventure_option_view_event_detailst+8; RVA 0x894240..0x894255
0x00894240: mov    rcx,rdx
0x00894243: mov    r8d,0x9
0x00894249: lea    rdx,[rip+0xd69940]        # 0x1415fdb90 ; literal="engraving"
0x00894250: jmp    0x14006fa10

# steam PE:6a70a6d9:02711000; adventure_option_view_event_detailst+16; RVA 0x894260..0x894275
0x00894260: mov    rcx,rdx
0x00894263: mov    r8d,0xe
0x00894269: lea    rdx,[rip+0xe200d0]        # 0x1416b4340 ; literal="View engraving"
0x00894270: jmp    0x14006fa10

# steam PE:6a70a6d9:02711000; adventure_option_view_itemst+16; RVA 0x894280..0x894361
0x00894280: mov    QWORD PTR [rsp+0x18],rbx
0x00894285: push   rdi
0x00894286: sub    rsp,0x50
0x0089428a: mov    rax,QWORD PTR [rip+0x1007daf]        # 0x14189c040
0x00894291: xor    rax,rsp
0x00894294: mov    QWORD PTR [rsp+0x40],rax
0x00894299: mov    rdi,rdx
0x0089429c: mov    rbx,rcx
0x0089429f: mov    r8d,0x5
0x008942a5: lea    rdx,[rip+0xde6be0]        # 0x14167ae8c ; literal="View "
0x008942ac: mov    rcx,rdi
0x008942af: call   0x14006fa10
0x008942b4: xorps  xmm0,xmm0
0x008942b7: movups XMMWORD PTR [rsp+0x20],xmm0
0x008942bc: mov    QWORD PTR [rsp+0x30],0x0
0x008942c5: mov    QWORD PTR [rsp+0x38],0xf
0x008942ce: mov    BYTE PTR [rsp+0x20],0x0
0x008942d3: mov    r9d,0x1
0x008942d9: xor    r8d,r8d
0x008942dc: lea    rdx,[rsp+0x20]
0x008942e1: mov    rcx,QWORD PTR [rbx+0x10]
0x008942e5: call   0x140c65450
0x008942ea: lea    rdx,[rsp+0x20]
0x008942ef: cmp    QWORD PTR [rsp+0x38],0xf
0x008942f5: cmova  rdx,QWORD PTR [rsp+0x20]
0x008942fb: mov    r8,QWORD PTR [rsp+0x30]
0x00894300: mov    rcx,rdi
0x00894303: call   0x14006fa10
0x00894308: nop
0x00894309: mov    rdx,QWORD PTR [rsp+0x38]
0x0089430e: cmp    rdx,0xf
0x00894312: jbe    0x140894349
0x00894314: inc    rdx
0x00894317: mov    rcx,QWORD PTR [rsp+0x20]
0x0089431c: mov    rax,rcx
0x0089431f: cmp    rdx,0x1000
0x00894326: jb     0x140894344
0x00894328: add    rdx,0x27
0x0089432c: mov    rcx,QWORD PTR [rcx-0x8]
0x00894330: sub    rax,rcx
0x00894333: add    rax,0xfffffffffffffff8
0x00894337: cmp    rax,0x1f
0x0089433b: jbe    0x140894344
0x0089433d: call   QWORD PTR [rip+0xd517e5]        # 0x1415e5b28
0x00894343: int3
0x00894344: call   0x141539680
0x00894349: mov    rcx,QWORD PTR [rsp+0x40]
0x0089434e: xor    rcx,rsp
0x00894351: call   0x141539660
0x00894356: mov    rbx,QWORD PTR [rsp+0x70]
0x0089435b: add    rsp,0x50
0x0089435f: pop    rdi
0x00894360: ret

# steam PE:6a70a6d9:02711000; adventure_option_drop_itemst+16; RVA 0x894370..0x894451
0x00894370: mov    QWORD PTR [rsp+0x18],rbx
0x00894375: push   rdi
0x00894376: sub    rsp,0x50
0x0089437a: mov    rax,QWORD PTR [rip+0x1007cbf]        # 0x14189c040
0x00894381: xor    rax,rsp
0x00894384: mov    QWORD PTR [rsp+0x40],rax
0x00894389: mov    rdi,rdx
0x0089438c: mov    rbx,rcx
0x0089438f: mov    r8d,0x5
0x00894395: lea    rdx,[rip+0xdb11f0]        # 0x14164558c ; literal="Drop "
0x0089439c: mov    rcx,rdi
0x0089439f: call   0x14006fa10
0x008943a4: xorps  xmm0,xmm0
0x008943a7: movups XMMWORD PTR [rsp+0x20],xmm0
0x008943ac: mov    QWORD PTR [rsp+0x30],0x0
0x008943b5: mov    QWORD PTR [rsp+0x38],0xf
0x008943be: mov    BYTE PTR [rsp+0x20],0x0
0x008943c3: mov    r9d,0x1
0x008943c9: xor    r8d,r8d
0x008943cc: lea    rdx,[rsp+0x20]
0x008943d1: mov    rcx,QWORD PTR [rbx+0x10]
0x008943d5: call   0x140c65450
0x008943da: lea    rdx,[rsp+0x20]
0x008943df: cmp    QWORD PTR [rsp+0x38],0xf
0x008943e5: cmova  rdx,QWORD PTR [rsp+0x20]
0x008943eb: mov    r8,QWORD PTR [rsp+0x30]
0x008943f0: mov    rcx,rdi
0x008943f3: call   0x14006fa10
0x008943f8: nop
0x008943f9: mov    rdx,QWORD PTR [rsp+0x38]
0x008943fe: cmp    rdx,0xf
0x00894402: jbe    0x140894439
0x00894404: inc    rdx
0x00894407: mov    rcx,QWORD PTR [rsp+0x20]
0x0089440c: mov    rax,rcx
0x0089440f: cmp    rdx,0x1000
0x00894416: jb     0x140894434
0x00894418: add    rdx,0x27
0x0089441c: mov    rcx,QWORD PTR [rcx-0x8]
0x00894420: sub    rax,rcx
0x00894423: add    rax,0xfffffffffffffff8
0x00894427: cmp    rax,0x1f
0x0089442b: jbe    0x140894434
0x0089442d: call   QWORD PTR [rip+0xd516f5]        # 0x1415e5b28
0x00894433: int3
0x00894434: call   0x141539680
0x00894439: mov    rcx,QWORD PTR [rsp+0x40]
0x0089443e: xor    rcx,rsp
0x00894441: call   0x141539660
0x00894446: mov    rbx,QWORD PTR [rsp+0x70]
0x0089444b: add    rsp,0x50
0x0089444f: pop    rdi
0x00894450: ret

# steam PE:6a70a6d9:02711000; adventure_option_throw_itemst+16; RVA 0x894460..0x894541
0x00894460: mov    QWORD PTR [rsp+0x18],rbx
0x00894465: push   rdi
0x00894466: sub    rsp,0x50
0x0089446a: mov    rax,QWORD PTR [rip+0x1007bcf]        # 0x14189c040
0x00894471: xor    rax,rsp
0x00894474: mov    QWORD PTR [rsp+0x40],rax
0x00894479: mov    rdi,rdx
0x0089447c: mov    rbx,rcx
0x0089447f: mov    r8d,0x6
0x00894485: lea    rdx,[rip+0xe1fed4]        # 0x1416b4360 ; literal="Throw "
0x0089448c: mov    rcx,rdi
0x0089448f: call   0x14006fa10
0x00894494: xorps  xmm0,xmm0
0x00894497: movups XMMWORD PTR [rsp+0x20],xmm0
0x0089449c: mov    QWORD PTR [rsp+0x30],0x0
0x008944a5: mov    QWORD PTR [rsp+0x38],0xf
0x008944ae: mov    BYTE PTR [rsp+0x20],0x0
0x008944b3: mov    r9d,0x1
0x008944b9: xor    r8d,r8d
0x008944bc: lea    rdx,[rsp+0x20]
0x008944c1: mov    rcx,QWORD PTR [rbx+0x10]
0x008944c5: call   0x140c65450
0x008944ca: lea    rdx,[rsp+0x20]
0x008944cf: cmp    QWORD PTR [rsp+0x38],0xf
0x008944d5: cmova  rdx,QWORD PTR [rsp+0x20]
0x008944db: mov    r8,QWORD PTR [rsp+0x30]
0x008944e0: mov    rcx,rdi
0x008944e3: call   0x14006fa10
0x008944e8: nop
0x008944e9: mov    rdx,QWORD PTR [rsp+0x38]
0x008944ee: cmp    rdx,0xf
0x008944f2: jbe    0x140894529
0x008944f4: inc    rdx
0x008944f7: mov    rcx,QWORD PTR [rsp+0x20]
0x008944fc: mov    rax,rcx
0x008944ff: cmp    rdx,0x1000
0x00894506: jb     0x140894524
0x00894508: add    rdx,0x27
0x0089450c: mov    rcx,QWORD PTR [rcx-0x8]
0x00894510: sub    rax,rcx
0x00894513: add    rax,0xfffffffffffffff8
0x00894517: cmp    rax,0x1f
0x0089451b: jbe    0x140894524
0x0089451d: call   QWORD PTR [rip+0xd51605]        # 0x1415e5b28
0x00894523: int3
0x00894524: call   0x141539680
0x00894529: mov    rcx,QWORD PTR [rsp+0x40]
0x0089452e: xor    rcx,rsp
0x00894531: call   0x141539660
0x00894536: mov    rbx,QWORD PTR [rsp+0x70]
0x0089453b: add    rsp,0x50
0x0089453f: pop    rdi
0x00894540: ret

# steam PE:6a70a6d9:02711000; adventure_option_wear_itemst+16; RVA 0x894550..0x894631
0x00894550: mov    QWORD PTR [rsp+0x18],rbx
0x00894555: push   rdi
0x00894556: sub    rsp,0x50
0x0089455a: mov    rax,QWORD PTR [rip+0x1007adf]        # 0x14189c040
0x00894561: xor    rax,rsp
0x00894564: mov    QWORD PTR [rsp+0x40],rax
0x00894569: mov    rdi,rdx
0x0089456c: mov    rbx,rcx
0x0089456f: mov    r8d,0x5
0x00894575: lea    rdx,[rip+0xe1fddc]        # 0x1416b4358 ; literal="Wear "
0x0089457c: mov    rcx,rdi
0x0089457f: call   0x14006fa10
0x00894584: xorps  xmm0,xmm0
0x00894587: movups XMMWORD PTR [rsp+0x20],xmm0
0x0089458c: mov    QWORD PTR [rsp+0x30],0x0
0x00894595: mov    QWORD PTR [rsp+0x38],0xf
0x0089459e: mov    BYTE PTR [rsp+0x20],0x0
0x008945a3: mov    r9d,0x1
0x008945a9: xor    r8d,r8d
0x008945ac: lea    rdx,[rsp+0x20]
0x008945b1: mov    rcx,QWORD PTR [rbx+0x10]
0x008945b5: call   0x140c65450
0x008945ba: lea    rdx,[rsp+0x20]
0x008945bf: cmp    QWORD PTR [rsp+0x38],0xf
0x008945c5: cmova  rdx,QWORD PTR [rsp+0x20]
0x008945cb: mov    r8,QWORD PTR [rsp+0x30]
0x008945d0: mov    rcx,rdi
0x008945d3: call   0x14006fa10
0x008945d8: nop
0x008945d9: mov    rdx,QWORD PTR [rsp+0x38]
0x008945de: cmp    rdx,0xf
0x008945e2: jbe    0x140894619
0x008945e4: inc    rdx
0x008945e7: mov    rcx,QWORD PTR [rsp+0x20]
0x008945ec: mov    rax,rcx
0x008945ef: cmp    rdx,0x1000
0x008945f6: jb     0x140894614
0x008945f8: add    rdx,0x27
0x008945fc: mov    rcx,QWORD PTR [rcx-0x8]
0x00894600: sub    rax,rcx
0x00894603: add    rax,0xfffffffffffffff8
0x00894607: cmp    rax,0x1f
0x0089460b: jbe    0x140894614
0x0089460d: call   QWORD PTR [rip+0xd51515]        # 0x1415e5b28
0x00894613: int3
0x00894614: call   0x141539680
0x00894619: mov    rcx,QWORD PTR [rsp+0x40]
0x0089461e: xor    rcx,rsp
0x00894621: call   0x141539660
0x00894626: mov    rbx,QWORD PTR [rsp+0x70]
0x0089462b: add    rsp,0x50
0x0089462f: pop    rdi
0x00894630: ret

# steam PE:6a70a6d9:02711000; adventure_option_remove_itemst+16; RVA 0x894640..0x894721
0x00894640: mov    QWORD PTR [rsp+0x18],rbx
0x00894645: push   rdi
0x00894646: sub    rsp,0x50
0x0089464a: mov    rax,QWORD PTR [rip+0x10079ef]        # 0x14189c040
0x00894651: xor    rax,rsp
0x00894654: mov    QWORD PTR [rsp+0x40],rax
0x00894659: mov    rdi,rdx
0x0089465c: mov    rbx,rcx
0x0089465f: mov    r8d,0x7
0x00894665: lea    rdx,[rip+0xe1fdb4]        # 0x1416b4420 ; literal="Remove "
0x0089466c: mov    rcx,rdi
0x0089466f: call   0x14006fa10
0x00894674: xorps  xmm0,xmm0
0x00894677: movups XMMWORD PTR [rsp+0x20],xmm0
0x0089467c: mov    QWORD PTR [rsp+0x30],0x0
0x00894685: mov    QWORD PTR [rsp+0x38],0xf
0x0089468e: mov    BYTE PTR [rsp+0x20],0x0
0x00894693: mov    r9d,0x1
0x00894699: xor    r8d,r8d
0x0089469c: lea    rdx,[rsp+0x20]
0x008946a1: mov    rcx,QWORD PTR [rbx+0x10]
0x008946a5: call   0x140c65450
0x008946aa: lea    rdx,[rsp+0x20]
0x008946af: cmp    QWORD PTR [rsp+0x38],0xf
0x008946b5: cmova  rdx,QWORD PTR [rsp+0x20]
0x008946bb: mov    r8,QWORD PTR [rsp+0x30]
0x008946c0: mov    rcx,rdi
0x008946c3: call   0x14006fa10
0x008946c8: nop
0x008946c9: mov    rdx,QWORD PTR [rsp+0x38]
0x008946ce: cmp    rdx,0xf
0x008946d2: jbe    0x140894709
0x008946d4: inc    rdx
0x008946d7: mov    rcx,QWORD PTR [rsp+0x20]
0x008946dc: mov    rax,rcx
0x008946df: cmp    rdx,0x1000
0x008946e6: jb     0x140894704
0x008946e8: add    rdx,0x27
0x008946ec: mov    rcx,QWORD PTR [rcx-0x8]
0x008946f0: sub    rax,rcx
0x008946f3: add    rax,0xfffffffffffffff8
0x008946f7: cmp    rax,0x1f
0x008946fb: jbe    0x140894704
0x008946fd: call   QWORD PTR [rip+0xd51425]        # 0x1415e5b28
0x00894703: int3
0x00894704: call   0x141539680
0x00894709: mov    rcx,QWORD PTR [rsp+0x40]
0x0089470e: xor    rcx,rsp
0x00894711: call   0x141539660
0x00894716: mov    rbx,QWORD PTR [rsp+0x70]
0x0089471b: add    rsp,0x50
0x0089471f: pop    rdi
0x00894720: ret

# steam PE:6a70a6d9:02711000; adventure_option_put_itemst+16; RVA 0x894730..0x894811
0x00894730: mov    QWORD PTR [rsp+0x18],rbx
0x00894735: push   rdi
0x00894736: sub    rsp,0x50
0x0089473a: mov    rax,QWORD PTR [rip+0x10078ff]        # 0x14189c040
0x00894741: xor    rax,rsp
0x00894744: mov    QWORD PTR [rsp+0x40],rax
0x00894749: mov    rdi,rdx
0x0089474c: mov    rbx,rcx
0x0089474f: mov    r8d,0xd
0x00894755: lea    rdx,[rip+0xe1fcb4]        # 0x1416b4410 ; literal="Put or place "
0x0089475c: mov    rcx,rdi
0x0089475f: call   0x14006fa10
0x00894764: xorps  xmm0,xmm0
0x00894767: movups XMMWORD PTR [rsp+0x20],xmm0
0x0089476c: mov    QWORD PTR [rsp+0x30],0x0
0x00894775: mov    QWORD PTR [rsp+0x38],0xf
0x0089477e: mov    BYTE PTR [rsp+0x20],0x0
0x00894783: mov    r9d,0x1
0x00894789: xor    r8d,r8d
0x0089478c: lea    rdx,[rsp+0x20]
0x00894791: mov    rcx,QWORD PTR [rbx+0x10]
0x00894795: call   0x140c65450
0x0089479a: lea    rdx,[rsp+0x20]
0x0089479f: cmp    QWORD PTR [rsp+0x38],0xf
0x008947a5: cmova  rdx,QWORD PTR [rsp+0x20]
0x008947ab: mov    r8,QWORD PTR [rsp+0x30]
0x008947b0: mov    rcx,rdi
0x008947b3: call   0x14006fa10
0x008947b8: nop
0x008947b9: mov    rdx,QWORD PTR [rsp+0x38]
0x008947be: cmp    rdx,0xf
0x008947c2: jbe    0x1408947f9
0x008947c4: inc    rdx
0x008947c7: mov    rcx,QWORD PTR [rsp+0x20]
0x008947cc: mov    rax,rcx
0x008947cf: cmp    rdx,0x1000
0x008947d6: jb     0x1408947f4
0x008947d8: add    rdx,0x27
0x008947dc: mov    rcx,QWORD PTR [rcx-0x8]
0x008947e0: sub    rax,rcx
0x008947e3: add    rax,0xfffffffffffffff8
0x008947e7: cmp    rax,0x1f
0x008947eb: jbe    0x1408947f4
0x008947ed: call   QWORD PTR [rip+0xd51335]        # 0x1415e5b28
0x008947f3: int3
0x008947f4: call   0x141539680
0x008947f9: mov    rcx,QWORD PTR [rsp+0x40]
0x008947fe: xor    rcx,rsp
0x00894801: call   0x141539660
0x00894806: mov    rbx,QWORD PTR [rsp+0x70]
0x0089480b: add    rsp,0x50
0x0089480f: pop    rdi
0x00894810: ret

# steam PE:6a70a6d9:02711000; adventure_option_eat_drink_itemst+16; RVA 0x894820..0x894924
0x00894820: mov    QWORD PTR [rsp+0x18],rbx
0x00894825: push   rdi
0x00894826: sub    rsp,0x50
0x0089482a: mov    rax,QWORD PTR [rip+0x100780f]        # 0x14189c040
0x00894831: xor    rax,rsp
0x00894834: mov    QWORD PTR [rsp+0x40],rax
0x00894839: mov    rdi,rdx
0x0089483c: mov    rbx,rcx
0x0089483f: mov    rcx,QWORD PTR [rcx+0x10]
0x00894843: mov    rax,QWORD PTR [rcx]
0x00894846: call   QWORD PTR [rax+0x2b0]
0x0089484c: mov    ecx,0x4
0x00894851: mov    r8d,0x6
0x00894857: test   al,al
0x00894859: cmove  r8d,ecx
0x0089485d: lea    rcx,[rip+0xe1c4e4]        # 0x1416b0d48 ; literal="Eat "
0x00894864: lea    rdx,[rip+0xe1c4c1]        # 0x1416b0d2c ; literal="Drink "
0x0089486b: cmove  rdx,rcx
0x0089486f: mov    rcx,rdi
0x00894872: call   0x14006fa10
0x00894877: xorps  xmm0,xmm0
0x0089487a: movups XMMWORD PTR [rsp+0x20],xmm0
0x0089487f: mov    QWORD PTR [rsp+0x30],0x0
0x00894888: mov    QWORD PTR [rsp+0x38],0xf
0x00894891: mov    BYTE PTR [rsp+0x20],0x0
0x00894896: mov    r9d,0x1
0x0089489c: xor    r8d,r8d
0x0089489f: lea    rdx,[rsp+0x20]
0x008948a4: mov    rcx,QWORD PTR [rbx+0x10]
0x008948a8: call   0x140c65450
0x008948ad: lea    rdx,[rsp+0x20]
0x008948b2: cmp    QWORD PTR [rsp+0x38],0xf
0x008948b8: cmova  rdx,QWORD PTR [rsp+0x20]
0x008948be: mov    r8,QWORD PTR [rsp+0x30]
0x008948c3: mov    rcx,rdi
0x008948c6: call   0x14006fa10
0x008948cb: nop
0x008948cc: mov    rdx,QWORD PTR [rsp+0x38]
0x008948d1: cmp    rdx,0xf
0x008948d5: jbe    0x14089490c
0x008948d7: inc    rdx
0x008948da: mov    rcx,QWORD PTR [rsp+0x20]
0x008948df: mov    rax,rcx
0x008948e2: cmp    rdx,0x1000
0x008948e9: jb     0x140894907
0x008948eb: add    rdx,0x27
0x008948ef: mov    rcx,QWORD PTR [rcx-0x8]
0x008948f3: sub    rax,rcx
0x008948f6: add    rax,0xfffffffffffffff8
0x008948fa: cmp    rax,0x1f
0x008948fe: jbe    0x140894907
0x00894900: call   QWORD PTR [rip+0xd51222]        # 0x1415e5b28
0x00894906: int3
0x00894907: call   0x141539680
0x0089490c: mov    rcx,QWORD PTR [rsp+0x40]
0x00894911: xor    rcx,rsp
0x00894914: call   0x141539660
0x00894919: mov    rbx,QWORD PTR [rsp+0x70]
0x0089491e: add    rsp,0x50
0x00894922: pop    rdi
0x00894923: ret

# steam PE:6a70a6d9:02711000; adventure_movement_jumpst+8; RVA 0x8a46d0..0x8a4734
0x008a46d0: mov    QWORD PTR [rsp+0x8],rbx
0x008a46d5: push   rdi
0x008a46d6: sub    rsp,0x40
0x008a46da: cmp    BYTE PTR [rcx+0x20],0x0
0x008a46de: mov    rdi,rdx
0x008a46e1: mov    rbx,rcx
0x008a46e4: je     0x1408a46fb
0x008a46e6: mov    r8d,0xc
0x008a46ec: lea    rdx,[rip+0xe10415]        # 0x1416b4b08 ; literal="Jump to the "
0x008a46f3: mov    rcx,rdi
0x008a46f6: call   0x14006f8d0
0x008a46fb: movzx  eax,WORD PTR [rbx+0x14]
0x008a46ff: movzx  r9d,WORD PTR [rbx+0x10]
0x008a4704: movzx  r8d,WORD PTR [rbx+0x1a]
0x008a4709: movzx  edx,WORD PTR [rbx+0x18]
0x008a470d: movzx  ecx,WORD PTR [rbx+0x16]
0x008a4711: mov    QWORD PTR [rsp+0x30],rdi
0x008a4716: mov    WORD PTR [rsp+0x28],ax
0x008a471b: movzx  eax,WORD PTR [rbx+0x12]
0x008a471f: mov    WORD PTR [rsp+0x20],ax
0x008a4724: call   0x14074f220
0x008a4729: mov    rbx,QWORD PTR [rsp+0x50]
0x008a472e: add    rsp,0x40
0x008a4732: pop    rdi
0x008a4733: ret

# steam PE:6a70a6d9:02711000; adventure_movement_shoot_creaturest+8; RVA 0x8a4890..0x8a49ff
0x008a4890: mov    QWORD PTR [rsp+0x8],rbx
0x008a4895: mov    QWORD PTR [rsp+0x18],rsi
0x008a489a: push   rdi
0x008a489b: sub    rsp,0x60
0x008a489f: mov    rax,QWORD PTR [rip+0xff779a]        # 0x14189c040
0x008a48a6: xor    rax,rsp
0x008a48a9: mov    QWORD PTR [rsp+0x50],rax
0x008a48ae: mov    rsi,rdx
0x008a48b1: mov    rdi,rcx
0x008a48b4: mov    r10d,DWORD PTR [rcx+0x24]
0x008a48b8: mov    r8,QWORD PTR [rip+0x1b407f9]        # 0x1423e50b8
0x008a48bf: mov    r11,QWORD PTR [rip+0x1b407ea]        # 0x1423e50b0
0x008a48c6: sub    r8,r11
0x008a48c9: sar    r8,0x3
0x008a48cd: test   r8d,r8d
0x008a48d0: je     0x1408a490f
0x008a48d2: cmp    r10d,0xffffffff
0x008a48d6: je     0x1408a490f
0x008a48d8: xor    edx,edx
0x008a48da: sub    r8d,0x1
0x008a48de: js     0x1408a490f
0x008a48e0: lea    eax,[rdx+r8*1]
0x008a48e4: sar    eax,1
0x008a48e6: movsxd rcx,eax
0x008a48e9: mov    rbx,QWORD PTR [r11+rcx*8]
0x008a48ed: mov    r9d,DWORD PTR [rbx+0x130]
0x008a48f4: cmp    r9d,r10d
0x008a48f7: je     0x1408a4911
0x008a48f9: lea    ecx,[rax+0x1]
0x008a48fc: cmovle edx,ecx
0x008a48ff: dec    eax
0x008a4901: cmp    r9d,r10d
0x008a4904: cmovle eax,r8d
0x008a4908: mov    r8d,eax
0x008a490b: cmp    edx,eax
0x008a490d: jle    0x1408a48e0
0x008a490f: xor    ebx,ebx
0x008a4911: test   rbx,rbx
0x008a4914: je     0x1408a49df
0x008a491a: movzx  eax,BYTE PTR [rdi+0x38]
0x008a491e: mov    ecx,0xe
0x008a4923: mov    r8d,0x18
0x008a4929: test   al,al
0x008a492b: cmove  r8d,ecx
0x008a492f: lea    rcx,[rip+0xe101ea]        # 0x1416b4b20 ; literal="Quickly shoot "
0x008a4936: lea    rdx,[rip+0xe101ab]        # 0x1416b4ae8 ; literal="Aim carefully and shoot "
0x008a493d: cmove  rdx,rcx
0x008a4941: mov    rcx,rsi
0x008a4944: call   0x14006f8d0
0x008a4949: xorps  xmm0,xmm0
0x008a494c: movups XMMWORD PTR [rsp+0x30],xmm0
0x008a4951: mov    QWORD PTR [rsp+0x40],0x0
0x008a495a: mov    QWORD PTR [rsp+0x48],0xf
0x008a4963: mov    BYTE PTR [rsp+0x30],0x0
0x008a4968: mov    BYTE PTR [rsp+0x20],0x1
0x008a496d: mov    r9b,0x1
0x008a4970: xor    r8d,r8d
0x008a4973: lea    rdx,[rsp+0x30]
0x008a4978: mov    rcx,rbx
0x008a497b: call   0x14132e430
0x008a4980: lea    rdx,[rsp+0x30]
0x008a4985: cmp    QWORD PTR [rsp+0x48],0xf
0x008a498b: cmova  rdx,QWORD PTR [rsp+0x30]
0x008a4991: mov    r8,QWORD PTR [rsp+0x40]
0x008a4996: mov    rcx,rsi
0x008a4999: call   0x14006fa10
0x008a499e: nop
0x008a499f: mov    rdx,QWORD PTR [rsp+0x48]
0x008a49a4: cmp    rdx,0xf
0x008a49a8: jbe    0x1408a49df
0x008a49aa: inc    rdx
0x008a49ad: mov    rcx,QWORD PTR [rsp+0x30]
0x008a49b2: mov    rax,rcx
0x008a49b5: cmp    rdx,0x1000
0x008a49bc: jb     0x1408a49da
0x008a49be: add    rdx,0x27
0x008a49c2: mov    rcx,QWORD PTR [rcx-0x8]
0x008a49c6: sub    rax,rcx
0x008a49c9: add    rax,0xfffffffffffffff8
0x008a49cd: cmp    rax,0x1f
0x008a49d1: jbe    0x1408a49da
0x008a49d3: call   QWORD PTR [rip+0xd4114f]        # 0x1415e5b28
0x008a49d9: int3
0x008a49da: call   0x141539680
0x008a49df: mov    rcx,QWORD PTR [rsp+0x50]
0x008a49e4: xor    rcx,rsp
0x008a49e7: call   0x141539660
0x008a49ec: mov    rbx,QWORD PTR [rsp+0x70]
0x008a49f1: mov    rsi,QWORD PTR [rsp+0x80]
0x008a49f9: add    rsp,0x60
0x008a49fd: pop    rdi
0x008a49fe: ret

# steam PE:6a70a6d9:02711000; adventure_movement_shoot_creaturest+0x118;adventure_movement_throw_item_at_creaturest+0x118; RVA 0x8a54d0..0x8a553b
0x008a54d0: mov    r9,QWORD PTR [rip+0x1b3fbe1]        # 0x1423e50b8
0x008a54d7: mov    r11,QWORD PTR [rip+0x1b3fbd2]        # 0x1423e50b0
0x008a54de: mov    r10d,DWORD PTR [rcx+0x24]
0x008a54e2: sub    r9,r11
0x008a54e5: sar    r9,0x3
0x008a54e9: test   r9d,r9d
0x008a54ec: je     0x1408a553a
0x008a54ee: cmp    r10d,0xffffffff
0x008a54f2: je     0x1408a553a
0x008a54f4: xor    edx,edx
0x008a54f6: sub    r9d,0x1
0x008a54fa: js     0x1408a552f
0x008a54fc: nop    DWORD PTR [rax+0x0]
0x008a5500: lea    eax,[rdx+r9*1]
0x008a5504: sar    eax,1
0x008a5506: movsxd rcx,eax
0x008a5509: mov    rcx,QWORD PTR [r11+rcx*8]
0x008a550d: mov    r8d,DWORD PTR [rcx+0x130]
0x008a5514: cmp    r8d,r10d
0x008a5517: je     0x1408a5531
0x008a5519: lea    ecx,[rax+0x1]
0x008a551c: cmovle edx,ecx
0x008a551f: dec    eax
0x008a5521: cmp    r8d,r10d
0x008a5524: cmovle eax,r9d
0x008a5528: mov    r9d,eax
0x008a552b: cmp    edx,eax
0x008a552d: jle    0x1408a5500
0x008a552f: xor    ecx,ecx
0x008a5531: test   rcx,rcx
0x008a5534: jne    0x1407e4860
0x008a553a: ret

# steam PE:6a70a6d9:02711000; adventure_movement_shoot_tilest+8; RVA 0x8a5540..0x8a563c
0x008a5540: mov    QWORD PTR [rsp+0x18],rbx
0x008a5545: push   rdi
0x008a5546: sub    rsp,0x60
0x008a554a: mov    rax,QWORD PTR [rip+0xff6aef]        # 0x14189c040
0x008a5551: xor    rax,rsp
0x008a5554: mov    QWORD PTR [rsp+0x50],rax
0x008a5559: mov    rdi,rdx
0x008a555c: mov    rbx,rcx
0x008a555f: cmp    BYTE PTR [rcx+0x20],0x0
0x008a5563: je     0x1408a557a
0x008a5565: mov    r8d,0x6
0x008a556b: lea    rdx,[rip+0xe0f5a6]        # 0x1416b4b18 ; literal="Shoot "
0x008a5572: mov    rcx,rdi
0x008a5575: call   0x14006f8d0
0x008a557a: xorps  xmm0,xmm0
0x008a557d: movups XMMWORD PTR [rsp+0x30],xmm0
0x008a5582: mov    QWORD PTR [rsp+0x40],0x0
0x008a558b: mov    QWORD PTR [rsp+0x48],0xf
0x008a5594: mov    BYTE PTR [rsp+0x30],0x0
0x008a5599: mov    BYTE PTR [rsp+0x28],0x0
0x008a559e: movzx  eax,WORD PTR [rbx+0x14]
0x008a55a2: mov    WORD PTR [rsp+0x20],ax
0x008a55a7: movzx  r9d,WORD PTR [rbx+0x12]
0x008a55ac: movzx  r8d,WORD PTR [rbx+0x10]
0x008a55b1: lea    rdx,[rsp+0x30]
0x008a55b6: lea    rcx,[rip+0x1b2bf33]        # 0x1423d14f0
0x008a55bd: call   0x140e7d330
0x008a55c2: lea    rdx,[rsp+0x30]
0x008a55c7: cmp    QWORD PTR [rsp+0x48],0xf
0x008a55cd: cmova  rdx,QWORD PTR [rsp+0x30]
0x008a55d3: mov    r8,QWORD PTR [rsp+0x40]
0x008a55d8: mov    rcx,rdi
0x008a55db: call   0x14006fa10
0x008a55e0: nop
0x008a55e1: mov    rdx,QWORD PTR [rsp+0x48]
0x008a55e6: cmp    rdx,0xf
0x008a55ea: jbe    0x1408a5621
0x008a55ec: inc    rdx
0x008a55ef: mov    rcx,QWORD PTR [rsp+0x30]
0x008a55f4: mov    rax,rcx
0x008a55f7: cmp    rdx,0x1000
0x008a55fe: jb     0x1408a561c
0x008a5600: add    rdx,0x27
0x008a5604: mov    rcx,QWORD PTR [rcx-0x8]
0x008a5608: sub    rax,rcx
0x008a560b: add    rax,0xfffffffffffffff8
0x008a560f: cmp    rax,0x1f
0x008a5613: jbe    0x1408a561c
0x008a5615: call   QWORD PTR [rip+0xd4050d]        # 0x1415e5b28
0x008a561b: int3
0x008a561c: call   0x141539680
0x008a5621: mov    rcx,QWORD PTR [rsp+0x50]
0x008a5626: xor    rcx,rsp
0x008a5629: call   0x141539660
0x008a562e: mov    rbx,QWORD PTR [rsp+0x80]
0x008a5636: add    rsp,0x60
0x008a563a: pop    rdi
0x008a563b: ret

# steam PE:6a70a6d9:02711000; adventure_movement_throw_item_at_creaturest+8; RVA 0x8a5e70..0x8a5fdf
0x008a5e70: mov    QWORD PTR [rsp+0x8],rbx
0x008a5e75: mov    QWORD PTR [rsp+0x18],rsi
0x008a5e7a: push   rdi
0x008a5e7b: sub    rsp,0x60
0x008a5e7f: mov    rax,QWORD PTR [rip+0xff61ba]        # 0x14189c040
0x008a5e86: xor    rax,rsp
0x008a5e89: mov    QWORD PTR [rsp+0x50],rax
0x008a5e8e: mov    rsi,rdx
0x008a5e91: mov    rdi,rcx
0x008a5e94: mov    r10d,DWORD PTR [rcx+0x24]
0x008a5e98: mov    r8,QWORD PTR [rip+0x1b3f219]        # 0x1423e50b8
0x008a5e9f: mov    r11,QWORD PTR [rip+0x1b3f20a]        # 0x1423e50b0
0x008a5ea6: sub    r8,r11
0x008a5ea9: sar    r8,0x3
0x008a5ead: test   r8d,r8d
0x008a5eb0: je     0x1408a5eef
0x008a5eb2: cmp    r10d,0xffffffff
0x008a5eb6: je     0x1408a5eef
0x008a5eb8: xor    edx,edx
0x008a5eba: sub    r8d,0x1
0x008a5ebe: js     0x1408a5eef
0x008a5ec0: lea    eax,[rdx+r8*1]
0x008a5ec4: sar    eax,1
0x008a5ec6: movsxd rcx,eax
0x008a5ec9: mov    rbx,QWORD PTR [r11+rcx*8]
0x008a5ecd: mov    r9d,DWORD PTR [rbx+0x130]
0x008a5ed4: cmp    r9d,r10d
0x008a5ed7: je     0x1408a5ef1
0x008a5ed9: lea    ecx,[rax+0x1]
0x008a5edc: cmovle edx,ecx
0x008a5edf: dec    eax
0x008a5ee1: cmp    r9d,r10d
0x008a5ee4: cmovle eax,r8d
0x008a5ee8: mov    r8d,eax
0x008a5eeb: cmp    edx,eax
0x008a5eed: jle    0x1408a5ec0
0x008a5eef: xor    ebx,ebx
0x008a5ef1: test   rbx,rbx
0x008a5ef4: je     0x1408a5fbf
0x008a5efa: movzx  eax,BYTE PTR [rdi+0x30]
0x008a5efe: mov    ecx,0x11
0x008a5f03: mov    r8d,0x1b
0x008a5f09: test   al,al
0x008a5f0b: cmove  r8d,ecx
0x008a5f0f: lea    rcx,[rip+0xe0ea12]        # 0x1416b4928 ; literal="Quickly throw at "
0x008a5f16: lea    rdx,[rip+0xe0ea23]        # 0x1416b4940 ; literal="Aim carefully and throw at "
0x008a5f1d: cmove  rdx,rcx
0x008a5f21: mov    rcx,rsi
0x008a5f24: call   0x14006f8d0
0x008a5f29: xorps  xmm0,xmm0
0x008a5f2c: movups XMMWORD PTR [rsp+0x30],xmm0
0x008a5f31: mov    QWORD PTR [rsp+0x40],0x0
0x008a5f3a: mov    QWORD PTR [rsp+0x48],0xf
0x008a5f43: mov    BYTE PTR [rsp+0x30],0x0
0x008a5f48: mov    BYTE PTR [rsp+0x20],0x1
0x008a5f4d: mov    r9b,0x1
0x008a5f50: xor    r8d,r8d
0x008a5f53: lea    rdx,[rsp+0x30]
0x008a5f58: mov    rcx,rbx
0x008a5f5b: call   0x14132e430
0x008a5f60: lea    rdx,[rsp+0x30]
0x008a5f65: cmp    QWORD PTR [rsp+0x48],0xf
0x008a5f6b: cmova  rdx,QWORD PTR [rsp+0x30]
0x008a5f71: mov    r8,QWORD PTR [rsp+0x40]
0x008a5f76: mov    rcx,rsi
0x008a5f79: call   0x14006fa10
0x008a5f7e: nop
0x008a5f7f: mov    rdx,QWORD PTR [rsp+0x48]
0x008a5f84: cmp    rdx,0xf
0x008a5f88: jbe    0x1408a5fbf
0x008a5f8a: inc    rdx
0x008a5f8d: mov    rcx,QWORD PTR [rsp+0x30]
0x008a5f92: mov    rax,rcx
0x008a5f95: cmp    rdx,0x1000
0x008a5f9c: jb     0x1408a5fba
0x008a5f9e: add    rdx,0x27
0x008a5fa2: mov    rcx,QWORD PTR [rcx-0x8]
0x008a5fa6: sub    rax,rcx
0x008a5fa9: add    rax,0xfffffffffffffff8
0x008a5fad: cmp    rax,0x1f
0x008a5fb1: jbe    0x1408a5fba
0x008a5fb3: call   QWORD PTR [rip+0xd3fb6f]        # 0x1415e5b28
0x008a5fb9: int3
0x008a5fba: call   0x141539680
0x008a5fbf: mov    rcx,QWORD PTR [rsp+0x50]
0x008a5fc4: xor    rcx,rsp
0x008a5fc7: call   0x141539660
0x008a5fcc: mov    rbx,QWORD PTR [rsp+0x70]
0x008a5fd1: mov    rsi,QWORD PTR [rsp+0x80]
0x008a5fd9: add    rsp,0x60
0x008a5fdd: pop    rdi
0x008a5fde: ret

# steam PE:6a70a6d9:02711000; adventure_movement_throw_item_at_tilest+8; RVA 0x8a64d0..0x8a65cc
0x008a64d0: mov    QWORD PTR [rsp+0x18],rbx
0x008a64d5: push   rdi
0x008a64d6: sub    rsp,0x60
0x008a64da: mov    rax,QWORD PTR [rip+0xff5b5f]        # 0x14189c040
0x008a64e1: xor    rax,rsp
0x008a64e4: mov    QWORD PTR [rsp+0x50],rax
0x008a64e9: mov    rdi,rdx
0x008a64ec: mov    rbx,rcx
0x008a64ef: cmp    BYTE PTR [rcx+0x20],0x0
0x008a64f3: je     0x1408a650a
0x008a64f5: mov    r8d,0x9
0x008a64fb: lea    rdx,[rip+0xe0e486]        # 0x1416b4988 ; literal="Throw at "
0x008a6502: mov    rcx,rdi
0x008a6505: call   0x14006f8d0
0x008a650a: xorps  xmm0,xmm0
0x008a650d: movups XMMWORD PTR [rsp+0x30],xmm0
0x008a6512: mov    QWORD PTR [rsp+0x40],0x0
0x008a651b: mov    QWORD PTR [rsp+0x48],0xf
0x008a6524: mov    BYTE PTR [rsp+0x30],0x0
0x008a6529: mov    BYTE PTR [rsp+0x28],0x0
0x008a652e: movzx  eax,WORD PTR [rbx+0x14]
0x008a6532: mov    WORD PTR [rsp+0x20],ax
0x008a6537: movzx  r9d,WORD PTR [rbx+0x12]
0x008a653c: movzx  r8d,WORD PTR [rbx+0x10]
0x008a6541: lea    rdx,[rsp+0x30]
0x008a6546: lea    rcx,[rip+0x1b2afa3]        # 0x1423d14f0
0x008a654d: call   0x140e7d330
0x008a6552: lea    rdx,[rsp+0x30]
0x008a6557: cmp    QWORD PTR [rsp+0x48],0xf
0x008a655d: cmova  rdx,QWORD PTR [rsp+0x30]
0x008a6563: mov    r8,QWORD PTR [rsp+0x40]
0x008a6568: mov    rcx,rdi
0x008a656b: call   0x14006fa10
0x008a6570: nop
0x008a6571: mov    rdx,QWORD PTR [rsp+0x48]
0x008a6576: cmp    rdx,0xf
0x008a657a: jbe    0x1408a65b1
0x008a657c: inc    rdx
0x008a657f: mov    rcx,QWORD PTR [rsp+0x30]
0x008a6584: mov    rax,rcx
0x008a6587: cmp    rdx,0x1000
0x008a658e: jb     0x1408a65ac
0x008a6590: add    rdx,0x27
0x008a6594: mov    rcx,QWORD PTR [rcx-0x8]
0x008a6598: sub    rax,rcx
0x008a659b: add    rax,0xfffffffffffffff8
0x008a659f: cmp    rax,0x1f
0x008a65a3: jbe    0x1408a65ac
0x008a65a5: call   QWORD PTR [rip+0xd3f57d]        # 0x1415e5b28
0x008a65ab: int3
0x008a65ac: call   0x141539680
0x008a65b1: mov    rcx,QWORD PTR [rsp+0x50]
0x008a65b6: xor    rcx,rsp
0x008a65b9: call   0x141539660
0x008a65be: mov    rbx,QWORD PTR [rsp+0x80]
0x008a65c6: add    rsp,0x60
0x008a65ca: pop    rdi
0x008a65cb: ret
