
retAddr3:     file format elf32-i386


Disassembly of section .init:

080483cc <_init>:
 80483cc:	53                   	push   %ebx
 80483cd:	83 ec 08             	sub    $0x8,%esp
 80483d0:	e8 2b 01 00 00       	call   8048500 <__x86.get_pc_thunk.bx>
 80483d5:	81 c3 2b 1c 00 00    	add    $0x1c2b,%ebx
 80483db:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80483e1:	85 c0                	test   %eax,%eax
 80483e3:	74 05                	je     80483ea <_init+0x1e>
 80483e5:	e8 b6 00 00 00       	call   80484a0 <__gmon_start__@plt>
 80483ea:	83 c4 08             	add    $0x8,%esp
 80483ed:	5b                   	pop    %ebx
 80483ee:	c3                   	ret    

Disassembly of section .plt:

080483f0 <.plt>:
 80483f0:	ff 35 04 a0 04 08    	pushl  0x804a004
 80483f6:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80483fc:	00 00                	add    %al,(%eax)
	...

08048400 <printf@plt>:
 8048400:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048406:	68 00 00 00 00       	push   $0x0
 804840b:	e9 e0 ff ff ff       	jmp    80483f0 <.plt>

08048410 <fgets@plt>:
 8048410:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048416:	68 08 00 00 00       	push   $0x8
 804841b:	e9 d0 ff ff ff       	jmp    80483f0 <.plt>

08048420 <popen@plt>:
 8048420:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048426:	68 10 00 00 00       	push   $0x10
 804842b:	e9 c0 ff ff ff       	jmp    80483f0 <.plt>

08048430 <strcpy@plt>:
 8048430:	ff 25 18 a0 04 08    	jmp    *0x804a018
 8048436:	68 18 00 00 00       	push   $0x18
 804843b:	e9 b0 ff ff ff       	jmp    80483f0 <.plt>

08048440 <puts@plt>:
 8048440:	ff 25 1c a0 04 08    	jmp    *0x804a01c
 8048446:	68 20 00 00 00       	push   $0x20
 804844b:	e9 a0 ff ff ff       	jmp    80483f0 <.plt>

08048450 <exit@plt>:
 8048450:	ff 25 20 a0 04 08    	jmp    *0x804a020
 8048456:	68 28 00 00 00       	push   $0x28
 804845b:	e9 90 ff ff ff       	jmp    80483f0 <.plt>

08048460 <pclose@plt>:
 8048460:	ff 25 24 a0 04 08    	jmp    *0x804a024
 8048466:	68 30 00 00 00       	push   $0x30
 804846b:	e9 80 ff ff ff       	jmp    80483f0 <.plt>

08048470 <setreuid@plt>:
 8048470:	ff 25 28 a0 04 08    	jmp    *0x804a028
 8048476:	68 38 00 00 00       	push   $0x38
 804847b:	e9 70 ff ff ff       	jmp    80483f0 <.plt>

08048480 <__libc_start_main@plt>:
 8048480:	ff 25 2c a0 04 08    	jmp    *0x804a02c
 8048486:	68 40 00 00 00       	push   $0x40
 804848b:	e9 60 ff ff ff       	jmp    80483f0 <.plt>

08048490 <strncmp@plt>:
 8048490:	ff 25 30 a0 04 08    	jmp    *0x804a030
 8048496:	68 48 00 00 00       	push   $0x48
 804849b:	e9 50 ff ff ff       	jmp    80483f0 <.plt>

Disassembly of section .plt.got:

080484a0 <__gmon_start__@plt>:
 80484a0:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 80484a6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

080484b0 <_start>:
 80484b0:	31 ed                	xor    %ebp,%ebp
 80484b2:	5e                   	pop    %esi
 80484b3:	89 e1                	mov    %esp,%ecx
 80484b5:	83 e4 f0             	and    $0xfffffff0,%esp
 80484b8:	50                   	push   %eax
 80484b9:	54                   	push   %esp
 80484ba:	52                   	push   %edx
 80484bb:	e8 23 00 00 00       	call   80484e3 <_start+0x33>
 80484c0:	81 c3 40 1b 00 00    	add    $0x1b40,%ebx
 80484c6:	8d 83 a0 e8 ff ff    	lea    -0x1760(%ebx),%eax
 80484cc:	50                   	push   %eax
 80484cd:	8d 83 40 e8 ff ff    	lea    -0x17c0(%ebx),%eax
 80484d3:	50                   	push   %eax
 80484d4:	51                   	push   %ecx
 80484d5:	56                   	push   %esi
 80484d6:	c7 c0 59 87 04 08    	mov    $0x8048759,%eax
 80484dc:	50                   	push   %eax
 80484dd:	e8 9e ff ff ff       	call   8048480 <__libc_start_main@plt>
 80484e2:	f4                   	hlt    
 80484e3:	8b 1c 24             	mov    (%esp),%ebx
 80484e6:	c3                   	ret    
 80484e7:	66 90                	xchg   %ax,%ax
 80484e9:	66 90                	xchg   %ax,%ax
 80484eb:	66 90                	xchg   %ax,%ax
 80484ed:	66 90                	xchg   %ax,%ax
 80484ef:	90                   	nop

080484f0 <_dl_relocate_static_pie>:
 80484f0:	f3 c3                	repz ret 
 80484f2:	66 90                	xchg   %ax,%ax
 80484f4:	66 90                	xchg   %ax,%ax
 80484f6:	66 90                	xchg   %ax,%ax
 80484f8:	66 90                	xchg   %ax,%ax
 80484fa:	66 90                	xchg   %ax,%ax
 80484fc:	66 90                	xchg   %ax,%ax
 80484fe:	66 90                	xchg   %ax,%ax

08048500 <__x86.get_pc_thunk.bx>:
 8048500:	8b 1c 24             	mov    (%esp),%ebx
 8048503:	c3                   	ret    
 8048504:	66 90                	xchg   %ax,%ax
 8048506:	66 90                	xchg   %ax,%ax
 8048508:	66 90                	xchg   %ax,%ax
 804850a:	66 90                	xchg   %ax,%ax
 804850c:	66 90                	xchg   %ax,%ax
 804850e:	66 90                	xchg   %ax,%ax

08048510 <deregister_tm_clones>:
 8048510:	b8 3f a0 04 08       	mov    $0x804a03f,%eax
 8048515:	2d 3c a0 04 08       	sub    $0x804a03c,%eax
 804851a:	83 f8 06             	cmp    $0x6,%eax
 804851d:	76 1a                	jbe    8048539 <deregister_tm_clones+0x29>
 804851f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048524:	85 c0                	test   %eax,%eax
 8048526:	74 11                	je     8048539 <deregister_tm_clones+0x29>
 8048528:	55                   	push   %ebp
 8048529:	89 e5                	mov    %esp,%ebp
 804852b:	83 ec 14             	sub    $0x14,%esp
 804852e:	68 3c a0 04 08       	push   $0x804a03c
 8048533:	ff d0                	call   *%eax
 8048535:	83 c4 10             	add    $0x10,%esp
 8048538:	c9                   	leave  
 8048539:	f3 c3                	repz ret 
 804853b:	90                   	nop
 804853c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048540 <register_tm_clones>:
 8048540:	b8 3c a0 04 08       	mov    $0x804a03c,%eax
 8048545:	2d 3c a0 04 08       	sub    $0x804a03c,%eax
 804854a:	c1 f8 02             	sar    $0x2,%eax
 804854d:	89 c2                	mov    %eax,%edx
 804854f:	c1 ea 1f             	shr    $0x1f,%edx
 8048552:	01 d0                	add    %edx,%eax
 8048554:	d1 f8                	sar    %eax
 8048556:	74 1b                	je     8048573 <register_tm_clones+0x33>
 8048558:	ba 00 00 00 00       	mov    $0x0,%edx
 804855d:	85 d2                	test   %edx,%edx
 804855f:	74 12                	je     8048573 <register_tm_clones+0x33>
 8048561:	55                   	push   %ebp
 8048562:	89 e5                	mov    %esp,%ebp
 8048564:	83 ec 10             	sub    $0x10,%esp
 8048567:	50                   	push   %eax
 8048568:	68 3c a0 04 08       	push   $0x804a03c
 804856d:	ff d2                	call   *%edx
 804856f:	83 c4 10             	add    $0x10,%esp
 8048572:	c9                   	leave  
 8048573:	f3 c3                	repz ret 
 8048575:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048580 <__do_global_dtors_aux>:
 8048580:	80 3d 3c a0 04 08 00 	cmpb   $0x0,0x804a03c
 8048587:	75 13                	jne    804859c <__do_global_dtors_aux+0x1c>
 8048589:	55                   	push   %ebp
 804858a:	89 e5                	mov    %esp,%ebp
 804858c:	83 ec 08             	sub    $0x8,%esp
 804858f:	e8 7c ff ff ff       	call   8048510 <deregister_tm_clones>
 8048594:	c6 05 3c a0 04 08 01 	movb   $0x1,0x804a03c
 804859b:	c9                   	leave  
 804859c:	f3 c3                	repz ret 
 804859e:	66 90                	xchg   %ax,%ax

080485a0 <frame_dummy>:
 80485a0:	b8 10 9f 04 08       	mov    $0x8049f10,%eax
 80485a5:	8b 10                	mov    (%eax),%edx
 80485a7:	85 d2                	test   %edx,%edx
 80485a9:	75 05                	jne    80485b0 <frame_dummy+0x10>
 80485ab:	eb 93                	jmp    8048540 <register_tm_clones>
 80485ad:	8d 76 00             	lea    0x0(%esi),%esi
 80485b0:	ba 00 00 00 00       	mov    $0x0,%edx
 80485b5:	85 d2                	test   %edx,%edx
 80485b7:	74 f2                	je     80485ab <frame_dummy+0xb>
 80485b9:	55                   	push   %ebp
 80485ba:	89 e5                	mov    %esp,%ebp
 80485bc:	83 ec 14             	sub    $0x14,%esp
 80485bf:	50                   	push   %eax
 80485c0:	ff d2                	call   *%edx
 80485c2:	83 c4 10             	add    $0x10,%esp
 80485c5:	c9                   	leave  
 80485c6:	e9 75 ff ff ff       	jmp    8048540 <register_tm_clones>

080485cb <function>:
 80485cb:	55                   	push   %ebp
 80485cc:	89 e5                	mov    %esp,%ebp
 80485ce:	83 ec 58             	sub    $0x58,%esp
 80485d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80485d4:	8b 55 0c             	mov    0xc(%ebp),%edx
 80485d7:	8b 45 10             	mov    0x10(%ebp),%eax
 80485da:	88 4d b4             	mov    %cl,-0x4c(%ebp)
 80485dd:	88 55 b0             	mov    %dl,-0x50(%ebp)
 80485e0:	88 45 ac             	mov    %al,-0x54(%ebp)
 80485e3:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
 80485ea:	66 c7 45 f2 18 00    	movw   $0x18,-0xe(%ebp)
 80485f0:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
 80485f7:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
 80485fe:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
 8048605:	c7 45 ea 00 00 00 00 	movl   $0x0,-0x16(%ebp)
 804860c:	c7 45 ee 00 00 00 00 	movl   $0x0,-0x12(%ebp)
 8048613:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
 804861a:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
 8048621:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
 8048628:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
 804862f:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
 8048636:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
 804863d:	83 ec 08             	sub    $0x8,%esp
 8048640:	ff 75 14             	pushl  0x14(%ebp)
 8048643:	8d 45 ce             	lea    -0x32(%ebp),%eax
 8048646:	50                   	push   %eax
 8048647:	e8 e4 fd ff ff       	call   8048430 <strcpy@plt>
 804864c:	83 c4 10             	add    $0x10,%esp
 804864f:	90                   	nop
 8048650:	c9                   	leave  
 8048651:	c3                   	ret    

08048652 <verifyLevelDecryption>:
 8048652:	55                   	push   %ebp
 8048653:	89 e5                	mov    %esp,%ebp
 8048655:	53                   	push   %ebx
 8048656:	83 ec 14             	sub    $0x14,%esp
 8048659:	89 e0                	mov    %esp,%eax
 804865b:	89 c3                	mov    %eax,%ebx
 804865d:	c7 45 f4 41 00 00 00 	movl   $0x41,-0xc(%ebp)
 8048664:	83 ec 08             	sub    $0x8,%esp
 8048667:	68 c0 88 04 08       	push   $0x80488c0
 804866c:	68 c4 88 04 08       	push   $0x80488c4
 8048671:	e8 aa fd ff ff       	call   8048420 <popen@plt>
 8048676:	83 c4 10             	add    $0x10,%esp
 8048679:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804867c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804867f:	83 e8 01             	sub    $0x1,%eax
 8048682:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048685:	b8 10 00 00 00       	mov    $0x10,%eax
 804868a:	8d 50 ff             	lea    -0x1(%eax),%edx
 804868d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048690:	01 d0                	add    %edx,%eax
 8048692:	b9 10 00 00 00       	mov    $0x10,%ecx
 8048697:	ba 00 00 00 00       	mov    $0x0,%edx
 804869c:	f7 f1                	div    %ecx
 804869e:	6b c0 10             	imul   $0x10,%eax,%eax
 80486a1:	29 c4                	sub    %eax,%esp
 80486a3:	89 e0                	mov    %esp,%eax
 80486a5:	83 c0 00             	add    $0x0,%eax
 80486a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80486ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80486ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80486b1:	83 ec 04             	sub    $0x4,%esp
 80486b4:	ff 75 f0             	pushl  -0x10(%ebp)
 80486b7:	52                   	push   %edx
 80486b8:	50                   	push   %eax
 80486b9:	e8 52 fd ff ff       	call   8048410 <fgets@plt>
 80486be:	83 c4 10             	add    $0x10,%esp
 80486c1:	83 ec 0c             	sub    $0xc,%esp
 80486c4:	ff 75 f0             	pushl  -0x10(%ebp)
 80486c7:	e8 94 fd ff ff       	call   8048460 <pclose@plt>
 80486cc:	83 c4 10             	add    $0x10,%esp
 80486cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80486d2:	83 ec 04             	sub    $0x4,%esp
 80486d5:	ff 75 f4             	pushl  -0xc(%ebp)
 80486d8:	68 00 89 04 08       	push   $0x8048900
 80486dd:	50                   	push   %eax
 80486de:	e8 ad fd ff ff       	call   8048490 <strncmp@plt>
 80486e3:	83 c4 10             	add    $0x10,%esp
 80486e6:	89 dc                	mov    %ebx,%esp
 80486e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80486eb:	c9                   	leave  
 80486ec:	c3                   	ret    

080486ed <getLevel2Password>:
 80486ed:	55                   	push   %ebp
 80486ee:	89 e5                	mov    %esp,%ebp
 80486f0:	83 ec 28             	sub    $0x28,%esp
 80486f3:	83 ec 08             	sub    $0x8,%esp
 80486f6:	68 ec 03 00 00       	push   $0x3ec
 80486fb:	68 ec 03 00 00       	push   $0x3ec
 8048700:	e8 6b fd ff ff       	call   8048470 <setreuid@plt>
 8048705:	83 c4 10             	add    $0x10,%esp
 8048708:	83 ec 08             	sub    $0x8,%esp
 804870b:	68 c0 88 04 08       	push   $0x80488c0
 8048710:	68 44 89 04 08       	push   $0x8048944
 8048715:	e8 06 fd ff ff       	call   8048420 <popen@plt>
 804871a:	83 c4 10             	add    $0x10,%esp
 804871d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048720:	83 ec 04             	sub    $0x4,%esp
 8048723:	ff 75 f4             	pushl  -0xc(%ebp)
 8048726:	6a 19                	push   $0x19
 8048728:	8d 45 db             	lea    -0x25(%ebp),%eax
 804872b:	50                   	push   %eax
 804872c:	e8 df fc ff ff       	call   8048410 <fgets@plt>
 8048731:	83 c4 10             	add    $0x10,%esp
 8048734:	83 ec 08             	sub    $0x8,%esp
 8048737:	8d 45 db             	lea    -0x25(%ebp),%eax
 804873a:	50                   	push   %eax
 804873b:	68 64 89 04 08       	push   $0x8048964
 8048740:	e8 bb fc ff ff       	call   8048400 <printf@plt>
 8048745:	83 c4 10             	add    $0x10,%esp
 8048748:	83 ec 0c             	sub    $0xc,%esp
 804874b:	ff 75 f4             	pushl  -0xc(%ebp)
 804874e:	e8 0d fd ff ff       	call   8048460 <pclose@plt>
 8048753:	83 c4 10             	add    $0x10,%esp
 8048756:	90                   	nop
 8048757:	c9                   	leave  
 8048758:	c3                   	ret    

08048759 <main>:
 8048759:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 804875d:	83 e4 f0             	and    $0xfffffff0,%esp
 8048760:	ff 71 fc             	pushl  -0x4(%ecx)
 8048763:	55                   	push   %ebp
 8048764:	89 e5                	mov    %esp,%ebp
 8048766:	53                   	push   %ebx
 8048767:	51                   	push   %ecx
 8048768:	83 ec 10             	sub    $0x10,%esp
 804876b:	89 cb                	mov    %ecx,%ebx
 804876d:	c7 45 f4 94 89 04 08 	movl   $0x8048994,-0xc(%ebp)
 8048774:	e8 d9 fe ff ff       	call   8048652 <verifyLevelDecryption>
 8048779:	85 c0                	test   %eax,%eax
 804877b:	74 1d                	je     804879a <main+0x41>
 804877d:	83 ec 08             	sub    $0x8,%esp
 8048780:	ff 75 f4             	pushl  -0xc(%ebp)
 8048783:	68 28 8a 04 08       	push   $0x8048a28
 8048788:	e8 73 fc ff ff       	call   8048400 <printf@plt>
 804878d:	83 c4 10             	add    $0x10,%esp
 8048790:	83 ec 0c             	sub    $0xc,%esp
 8048793:	6a 00                	push   $0x0
 8048795:	e8 b6 fc ff ff       	call   8048450 <exit@plt>
 804879a:	83 3b 01             	cmpl   $0x1,(%ebx)
 804879d:	7f 20                	jg     80487bf <main+0x66>
 804879f:	8b 43 04             	mov    0x4(%ebx),%eax
 80487a2:	8b 00                	mov    (%eax),%eax
 80487a4:	83 ec 08             	sub    $0x8,%esp
 80487a7:	50                   	push   %eax
 80487a8:	68 2b 8a 04 08       	push   $0x8048a2b
 80487ad:	e8 4e fc ff ff       	call   8048400 <printf@plt>
 80487b2:	83 c4 10             	add    $0x10,%esp
 80487b5:	83 ec 0c             	sub    $0xc,%esp
 80487b8:	6a 00                	push   $0x0
 80487ba:	e8 91 fc ff ff       	call   8048450 <exit@plt>
 80487bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 80487c6:	8b 43 04             	mov    0x4(%ebx),%eax
 80487c9:	83 c0 04             	add    $0x4,%eax
 80487cc:	8b 00                	mov    (%eax),%eax
 80487ce:	50                   	push   %eax
 80487cf:	6a 03                	push   $0x3
 80487d1:	6a 02                	push   $0x2
 80487d3:	6a 01                	push   $0x1
 80487d5:	e8 f1 fd ff ff       	call   80485cb <function>
 80487da:	83 c4 10             	add    $0x10,%esp
 80487dd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 80487e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80487e8:	75 12                	jne    80487fc <main+0xa3>
 80487ea:	83 ec 0c             	sub    $0xc,%esp
 80487ed:	68 3f 8a 04 08       	push   $0x8048a3f
 80487f2:	e8 49 fc ff ff       	call   8048440 <puts@plt>
 80487f7:	83 c4 10             	add    $0x10,%esp
 80487fa:	eb 2d                	jmp    8048829 <main+0xd0>
 80487fc:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
 8048800:	75 17                	jne    8048819 <main+0xc0>
 8048802:	83 ec 0c             	sub    $0xc,%esp
 8048805:	68 50 8a 04 08       	push   $0x8048a50
 804880a:	e8 31 fc ff ff       	call   8048440 <puts@plt>
 804880f:	83 c4 10             	add    $0x10,%esp
 8048812:	e8 d6 fe ff ff       	call   80486ed <getLevel2Password>
 8048817:	eb 10                	jmp    8048829 <main+0xd0>
 8048819:	83 ec 0c             	sub    $0xc,%esp
 804881c:	68 3f 8a 04 08       	push   $0x8048a3f
 8048821:	e8 1a fc ff ff       	call   8048440 <puts@plt>
 8048826:	83 c4 10             	add    $0x10,%esp
 8048829:	90                   	nop
 804882a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 804882d:	59                   	pop    %ecx
 804882e:	5b                   	pop    %ebx
 804882f:	5d                   	pop    %ebp
 8048830:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048833:	c3                   	ret    
 8048834:	66 90                	xchg   %ax,%ax
 8048836:	66 90                	xchg   %ax,%ax
 8048838:	66 90                	xchg   %ax,%ax
 804883a:	66 90                	xchg   %ax,%ax
 804883c:	66 90                	xchg   %ax,%ax
 804883e:	66 90                	xchg   %ax,%ax

08048840 <__libc_csu_init>:
 8048840:	55                   	push   %ebp
 8048841:	57                   	push   %edi
 8048842:	56                   	push   %esi
 8048843:	53                   	push   %ebx
 8048844:	e8 b7 fc ff ff       	call   8048500 <__x86.get_pc_thunk.bx>
 8048849:	81 c3 b7 17 00 00    	add    $0x17b7,%ebx
 804884f:	83 ec 0c             	sub    $0xc,%esp
 8048852:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 8048856:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 804885c:	e8 6b fb ff ff       	call   80483cc <_init>
 8048861:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048867:	29 c6                	sub    %eax,%esi
 8048869:	c1 fe 02             	sar    $0x2,%esi
 804886c:	85 f6                	test   %esi,%esi
 804886e:	74 25                	je     8048895 <__libc_csu_init+0x55>
 8048870:	31 ff                	xor    %edi,%edi
 8048872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048878:	83 ec 04             	sub    $0x4,%esp
 804887b:	55                   	push   %ebp
 804887c:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048880:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048884:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 804888b:	83 c7 01             	add    $0x1,%edi
 804888e:	83 c4 10             	add    $0x10,%esp
 8048891:	39 fe                	cmp    %edi,%esi
 8048893:	75 e3                	jne    8048878 <__libc_csu_init+0x38>
 8048895:	83 c4 0c             	add    $0xc,%esp
 8048898:	5b                   	pop    %ebx
 8048899:	5e                   	pop    %esi
 804889a:	5f                   	pop    %edi
 804889b:	5d                   	pop    %ebp
 804889c:	c3                   	ret    
 804889d:	8d 76 00             	lea    0x0(%esi),%esi

080488a0 <__libc_csu_fini>:
 80488a0:	f3 c3                	repz ret 

Disassembly of section .fini:

080488a4 <_fini>:
 80488a4:	53                   	push   %ebx
 80488a5:	83 ec 08             	sub    $0x8,%esp
 80488a8:	e8 53 fc ff ff       	call   8048500 <__x86.get_pc_thunk.bx>
 80488ad:	81 c3 53 17 00 00    	add    $0x1753,%ebx
 80488b3:	83 c4 08             	add    $0x8,%esp
 80488b6:	5b                   	pop    %ebx
 80488b7:	c3                   	ret    
