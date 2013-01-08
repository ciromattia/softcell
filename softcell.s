  	    	##################################################
			#   SoftCell - A Nokia 3310 Software emulator	 #
			#						--						 #
			# Version 0.4 - (C) Wed Feb 11 00:54:24 CET 2004 #
			# Authors:					 					 #
			#	Matteo Chiarion  <matteo@winged.it>          #
			#	Ciro Mattia Gonano <ciromattia@gmail.com>	 #
			#						--						 #
			# This software is copyrighted under the GNU	 #
			# General Public License v. 2.0					 #
			##################################################

	########################### REGISTER USE ########################
	# $s0-$s3	store the mutable display lines' addresses			#
	# $s4		stores last pressed button's ID						#
	# $s5		is used to store the current buffer's pointer		#
	# $s6		is mainly used to register how many times a button	#
	#			has been pressed, sometimes used also to store		#
	#			indexes												#
	# $s7		is mainly used to store current display's status	#
	# $s8		is used together with $ra to manage return jumps    #
	#################################################################

### Data space
.data
	microbuf:	.byte	0
	minibuf:	.space	8
	ringbufn:	.word	15
	ringbuf:	.space	16
	phbbufn:	.word	11
	phbbuf:		.space	12
	phbtmpbuf1:	.space	32
	phbtmpbuf2:	.space	32
	smsbufn:	.word	160
	smsbuf:		.space	164
	linebufn:	.word	21
	line0buf:	.asciiz "                      "
	line1buf:	.asciiz "                      "
	line2buf:	.asciiz "                      "
	inputbufn:	.word	23
	inputbuf:	.space	24

	message01:	.asciiz	"# Assembly exercitation: SoftCell #\n"
	message02:	.asciiz	"# A Nokia 3310 software emulator  #\n"

	# The "display" strings are for drawing the display. Of course ;)
	display01:	.asciiz	" /----------------------\\n"
	display02:	.asciiz	" \----------------------/\n"
	#display01:	.asciiz	" ************************\n"
	#display02:	.asciiz	" ************************\n"
	display03:	.asciiz " C          Ok    Down/Up\n"
	display04:	.asciiz " 1         2abc     3def \n"
	display05:	.asciiz " 4ghi      5jkl     6mno \n"
	display06:	.asciiz " 7pqrs     8tuv     9wxyz\n"
	display07:	.asciiz " [#]        0_       [*] \n"
	display10:	.asciiz "                         \n"
	dispartA:	.asciiz " |"
	dispartZ:	.asciiz "|\n"

	# "login" display
	display0:	.asciiz	"                      "
	
	display1p:	.asciiz "   +---+---+ Phone    "
	display2p:	.asciiz "   |   |===| book     "
	display3p:	.asciiz "   +---+---+          "
	
	display1m:	.asciiz "    +-----+           "
	display2m:	.asciiz "    | \_/ | Messages  "
	display3m:	.asciiz "    +-----+           "
	
	display1y:	.asciiz "  \   /  Successfully "
	display2y:	.asciiz "   | /      saved     "
	display3y:	.asciiz "   |/                 "
	
	display1n:	.asciiz "   \ /  No more space "
	display2n:	.asciiz "    x     available   "
	display3n:	.asciiz "   / \                "
	
	display1d:	.asciiz " +-----+ No data has  "
	display2d:	.asciiz " |  ?  | been stored  "
	display3d:	.asciiz " +-----+     yet      "
		
	display1N:	.asciiz " Name:                "
	display1x:	.asciiz " Number:              "
	display2w:	.asciiz	"    W E L C O M E     "
	
	display4m:	.asciiz "         Menu         "
	display4c:	.asciiz "         Call         "
	display4s:	.asciiz "        Select        "
	display4S:	.asciiz "         Save         "
	display4k:	.asciiz "       Calling...     "
	display4D:	.asciiz	"        Delete        "
	display4e:	.asciiz	"         Edit         "
	display4E:	.asciiz	"         Exit         "
	ringoutno:	.word	2
	ringouttab:	.word	display4c,display4S

	charspace:	.asciiz	" "
	charselect:	.asciiz	"*"
	phbmenu01:	.asciiz	" Browse               "
	phbmenu02:	.asciiz " Search               "
	phbmenu03:	.asciiz " Add name             "
	phbmenu04:	.asciiz " Erase one by one     "
	phbmenu05:	.asciiz " Erase all            "
	phbmenu06:	.asciiz " Edit                 "
	phbmenuno:	.word	6
	phbmenutab:	.word	phbmenu01,phbmenu02,phbmenu03,phbmenu04,phbmenu05,phbmenu06
	phbmenuref:	.word	phbookbrowse,phbooksearch,phbookadd,phbookdel,phbookclean,phbookedit

	smsmenu01:	.asciiz " Write messages       "
	smsmenu02:	.asciiz " Read messages        "
	smsmenu03:	.asciiz " Erase messages       "
	smsmenuno:	.word	3
	smsmenutab:	.word	smsmenu01,smsmenu02,smsmenu03
	smsmenuref:	.word	smswrite,smsread,smserase
	
	# MISC
	display1V:	.asciiz " V 00.01              "
	display2V:	.asciiz " 03-02-04             "
	display3V:	.asciiz " CMG-3                "

	msgRingout:	.asciiz "You're calling out!\n"
	msgReq:		.asciiz "Press a button to continue...\n"
	msgNoneg:	.asciiz "Negative buttons doesn't exists! Bug!!!\n"
	msgInvalid:	.asciiz "Selected button doesn't exist!!!\n\n"
	msgHappy:	.asciiz "Yeah!!!\n\n"
	
	newline:	.asciiz "\n"
	backspace:	.word 8
	
	buttons:	.asciiz "#*0123456789CDOUcdou"
	but1:		.asciiz "1"
	but2:		.asciiz "abc2à"
	but3:		.asciiz "def3èé"
	but4:		.asciiz "ghi4ì"
	but5:		.asciiz "jkl5"
	but6:		.asciiz "mno6ò"
	but7:		.asciiz "pqrs7"
	but8:		.asciiz "tuv8ù"
	but9:		.asciiz "wxyz9"
	but0:		.asciiz " 0"
	buth:		.asciiz "#"
	buts:		.asciiz ".,?!:;"

	# Memory management: entries and indexes
	phbentry:	.word	28	# 'phbbufn' for name, 'ringbufn' for number, 1 to avoid overruns + align

	smsentry:	.word	180	# 'smsbufn' for message, 'ringbufn' for number, 1 to avoid overruns + align
	
	phblistn:	.word	80
	phblist:	.space	80
	phblists:	.word	0
	smslistn:	.word	40
	smslist:	.space	40
	smslists:	.word	0
	
	# Switch tables
	stab01:		.word mmenu00,mmenu01,mmenu02,mmenu03,mmenu04,mmenu05,mmenu06,mmenu07,mmenu08,mmenu09,mmenu10,mmenu11,mmenu12,mmenu13,mmenu14,mmenu15
	stab02:		.word rmenu00,rmenu01,rmenu02,rmenu03,rmenu04,rmenu05,rmenu06,rmenu07,rmenu08,rmenu09,rmenu10,rmenu11,rmenu12,rmenu13,rmenu14,rmenu15
	spbmenutab:	.word pbmenu00,pbmenu01,pbmenu02,pbmenu03,pbmenu04,pbmenu05,pbmenu06,pbmenu07,pbmenu08,pbmenu09,pbmenu10,pbmenu11,pbmenu12,pbmenu13,pbmenu14,pbmenu15
	sphbmenubrtab:	.word phbmenubr00,phbmenubr01,phbmenubr02,phbmenubr03,phbmenubr04,phbmenubr05,phbmenubr06,phbmenubr07,phbmenubr08,phbmenubr09,phbmenubr10,phbmenubr11,phbmenubr12,phbmenubr13,phbmenubr14,phbmenubr15
	ssmsmenutab:	.word smmenu00,smmenu01,smmenu02,smmenu03,smmenu04,smmenu05,smmenu06,smmenu07,smmenu08,smmenu09,smmenu10,smmenu11,smmenu12,smmenu13,smmenu14,smmenu15
	ssmsmenubrtab:	.word smsmenubr00,smsmenubr01,smsmenubr02,smsmenubr03,smsmenubr04,smsmenubr05,smsmenubr06,smsmenubr07,smsmenubr08,smsmenubr09,smsmenubr10,smsmenubr11,smsmenubr12,smsmenubr13,smsmenubr14,smsmenubr15
	ssmsreadtab:	.word smsread00,smsread01,smsread02,smsread03,smsread04,smsread05,smsread06,smsread07,smsread08,smsread09,smsread10,smsread11,smsread12,smsread13,smsread14,smsread15
	sringout:	.word ringout00,ringout01,ringout02,ringout03,ringout04,ringout05,ringout06,ringout07,ringout08,ringout09,ringout10,ringout11,ringout12,ringout13,ringout14,ringout15
	sinputtab:	.word input00,input01,input02,input03,input04,input05,input06,input07,input08,input09,input10,input11,input12,input13,input14,input15
	sinputnumbtab:	.word inputnumb00,inputnumb01,inputnumb02,inputnumb03,inputnumb04,inputnumb05,inputnumb06,inputnumb07,inputnumb08,inputnumb09,inputnumb10,inputnumb11,inputnumb12,inputnumb13,inputnumb14,inputnumb15

.text
.globl main
  
  # Cleardisp - fills all display's buffers with spaces
  cleardisp:
	li		$t0, 21
   cleardisploop:
    bltz	$t0, cleardispend
	lb		$t1, display0($t0)
	sb		$t1, line0buf($t0)
	sb		$t1, line1buf($t0)
	sb		$t1, line2buf($t0)
	addi	$t0, -1
	j		cleardisploop
   cleardispend:
	jr		$ra

  # Load0display - loads "Welcome" screen
  load0display:
	li		$t0, 21
   load0disploop:
	bltz	$t0, load0dispend
	lb		$t1, display0($t0)
	sb		$t1, line0buf($t0)
	sb		$t1, line2buf($t0)
	lb		$t1, display2w($t0)
	sb		$t1, line1buf($t0)
	addi	$t0, -1
	j		load0disploop
   load0dispend:
	jr		$ra

  # Loadpbdisplay - Load "Phone book" screen
  loadpbdisplay:
	li		$t0, 21
   loadpbdisploop:
	bltz	$t0, loadpbdispend
	lb		$t1, display1p($t0)
	sb		$t1, line0buf($t0)
	lb		$t1, display2p($t0)
	sb		$t1, line1buf($t0)
	lb		$t1, display3p($t0)
	sb		$t1, line2buf($t0)
	addi	$t0, -1
	j		loadpbdisploop
   loadpbdispend:
	jr		$ra

  # Loadsmsdisplay - Loads "Messages" screen
  loadsmsdisplay:
	li		$t0, 21
   loadsmsdisploop:
	bltz	$t0, loadsmsdispend
	lb		$t1, display1m($t0)
	sb		$t1, line0buf($t0)
	lb		$t1, display2m($t0)
	sb		$t1, line1buf($t0)
	lb		$t1, display3m($t0)
	sb		$t1, line2buf($t0)
	addi	$t0, -1
	j		loadsmsdisploop
   loadsmsdispend:
	jr		$ra

  # Clearbuf - cleans up a buffer filling it with zeroes
  # Takes:
  #  $a0 - buffer
  #  $a1 - buffer length
  clearbuf:
	li		$t0, 0
	move	$t1, $a0
	move	$t2, $a1
   clearbufloop:
	bltz	$t2, clearbufend
	sb		$t0, ($t1)
	addi	$t1, 1
	addi	$t2, -1
	j		clearbufloop
   clearbufend:
	jr		$ra

  # Copybuf - copies from buffer1 to buffer2
  #  - if (src length < dst length), the copy is completed filling
  #    dst buffer with spaces
  # Takes:
  #  $a0 - src buffer address
  #  $a1 - dst buffer address
  #  $a2 - src buf length
  #  $a3 - dst buf length
  # Returns:
  #  $v0 - copied bytes OF THE BUFFER (we already know dst's bytes)
  copybuf:
	move	$t0, $a3
	li		$t1, 0
	move	$t4, $a2
   copybufloop:
	bltz	$t4, copybufcomplete	# end of src buffer - complete copy
	copybufloop2:
	bltz	$t0, copybufend			# we're ran out of space
	addu	$t2, $t1, $a0
	lb		$t3, ($t2)
	beqz	$t3, copybufcomplete	# src buffer end
	addu	$t2, $t1, $a1
	sb		$t3, ($t2)
	addi	$t1, 1
	addi	$t0, -1
	addi	$t4, -1
	j		copybufloop
   copybufcomplete:
	move	$v0, $t1
	lb		$t9, display0
   copybufcompleteloop:
	bltz	$t0, copybufend
	addu	$t2, $t1, $a1
	sb		$t9, ($t2)
	addi	$t1, 1
	addi	$t0, -1
	j		copybufcompleteloop
   copybufend:
	jr		$ra

  # Countnumbers - count how many numbers are in a string
  # Takes:
  #  $a0 - string to parse
  # Returns:
  #  $v0 - number of numbers ^_^
  countnumbers:
	li		$v0, -1
	lb		$t1, charspace
   countnumbersloop:
	addi	$v0, 1
	add		$t0, $a0, $v0
	lb		$t0, ($t0)
	beqz	$t0, countnumbersend
	bne		$t1, $t2, countnumbersloop
   countnumbersend:
	jr		$ra

  # Drawdisplay: draws display and buttons based on the values of
  #  $s0-$s3
  drawdisplay:
  	# Draw display
	li		$v0, 4
	la		$a0, newline
	li		$t0, 20
   drawdispnewline:
	beqz	$t0, drawdisplayreal
	syscall
	addi	$t0, -1
	j		drawdispnewline
   drawdisplayreal:
	la		$a0, display01
	syscall
   	la		$a0, dispartA
	syscall
   	la		$a0, ($s0)
	syscall
   	la		$a0, dispartZ
	syscall
   	la		$a0, dispartA
	syscall
   	la		$a0, ($s1)
	syscall
   	la		$a0, dispartZ
	syscall
   	la		$a0, dispartA
	syscall
   	la		$a0, ($s2)
	syscall
   	la		$a0, dispartZ
	syscall
   	la		$a0, dispartA
	syscall
   	la		$a0, ($s3)
	syscall
   	la		$a0, dispartZ
	syscall
   	la		$a0, display02
	syscall
   	la		$a0, display03
	syscall
   	la		$a0, display04
	syscall
   	la		$a0, display05
	syscall
   	la		$a0, display06
	syscall
   	la		$a0, display07
	syscall
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		printNL
	lw		$ra, ($sp)
	addiu	$sp, 4
   	li		$v0, 0
	jr		$ra

  # printNL - prints a newline
  printNL:
	la		$a0, newline
	li		$v0, 4
	syscall
	jr		$ra
	
  # Prints a "No more space in memory" message
  printnomorespace:
	subu	$sp, 4
	sw		$ra, ($sp)
	la		$a0, display1n
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	la		$a0, display2n
	move	$a1, $s1
	jal		copybuf
	la		$a0, display3n
	move	$a1, $s2
	jal		copybuf
	la		$s3, display0
	jal		drawdisplay
	lw		$ra, ($sp)
	addiu	$sp, 4
	jr		$ra

  # Prints a "Succesfully saved" message
  printsaved:
	subu	$sp, 4
	sw		$ra, ($sp)
	la		$a0, display1y
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	la		$a0, display2y
	move	$a1, $s1
	jal		copybuf
	la		$a0, display3y
	move	$a1, $s2
	jal		copybuf
	la		$s3, display0
	jal		drawdisplay
	lw		$ra, ($sp)
	addiu	$sp, 4
	jr		$ra
  
  # Prints a "No data" message
  printnodata:
	subu	$sp, 4
	sw		$ra, ($sp)
	la		$a0, display1d
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	la		$a0, display2d
	move	$a1, $s1
	jal		copybuf
	la		$a0, display3d
	move	$a1, $s2
	jal		copybuf
	la		$s3, display0
	jal		drawdisplay
	lw		$ra, ($sp)
	addiu	$sp, 4
	jr		$ra

  # This function is used to compare user input.
  # Return value (in $v0) can be a 0-16 value (resembling
  # the key that has been pressed) or -1 if the value is an
  # unknown one.
  # Takes:
  #  $a0 - input char
  # Returns:
  #  $v0 - match
  comppress:
	move	$t0, $a0
	li		$v0, 19
   comploop:
	lbu		$t1, buttons($v0)
    beq		$t0, $t1, compRET
	addi	$v0, $v0, -1
	bltz	$v0, compRET
	addiu	$a0, $a0, 1
	j		comploop
   compRET:
    li		$t2, 96
	sgtu	$t2, $t0, $t2
	sll		$t2, $t2, 2
	subu	$v0, $v0, $t2
	jr		$ra

  # Phbins - Inserts a new entry in phb, sorting it
  #  (remind: phbins doesn't check for overflow. If it is given a valid
  #   phbentry address, phbins assumes that checks and other stuff have
  #   already been make)
  # Takes:
  #  $a0 - new element (string/buffer) address
  phbins:
	subu	$sp, 8
	sw		$ra, ($sp)
	sw		$a0, 4($sp)
	move	$t0, $a0		# $t0 contains new element
	lb		$t9, ($t0)		# $t9 contains new element first char
	lw		$t2, phblists
	li		$t3, 0
	li		$t7, 0
   phbinsloop:
	beq		$t3, $t2, phbinsert	# array end reached
	mul		$t5, $t3, 4
	lw		$t4, phblist($t5)	# entry address of current index
	lb		$t9, ($t0)
	lb		$t8, ($t4)
	phbinsloop2:
	blt		$t9, $t8, phbinsert
	beq		$t9, $t8, phbinsfurthchars
	li		$t7, 0
	addi	$t3, 1
	j		phbinsloop
   phbinsert:
	mul		$t5, $t3, 4
	sw		$t0, phblist($t5)
	move	$t0, $t4
	addi	$t3, 1
	bgt		$t3, $t2, phbinsend
	lw		$t4, phblist($t5)
	j		phbinsert
   phbinsend:
	lw		$a1, phbentry
	la		$a0, phbtmpbuf1
	jal		clearbuf
	la		$a0, phbtmpbuf2
	jal		clearbuf
	lw		$a0, 4($sp)
	lw		$ra, ($sp)
	addiu	$sp, 8
	lw		$t2, phblists
	addi	$t2, 1
	sw		$t2, phblists
	li		$v0, 0
	jr		$ra
   phbinsfurthchars:
	addi	$t7, 1
	add		$t6, $t0, $t7
	lb		$t9, ($t6)
	add		$t6, $t4, $t7
	lb		$t8, ($t6)
	j		phbinsloop2

  # Phbdel - deletes an entry
  # Takes:
  #  $a0 - number of entry to delete
  phbdel:
	move	$t0, $a0
	lw		$t1, phblists
	addi	$t1, -1
   phbdelloop:
	beq		$t0, $t1, phbdelend
	addi	$t2, $t0, 1
	sll		$t2, $t2, 2
	lw		$t2, phblist($t2)
	mul		$t3, $t0, 4
	sw		$t2, phblist($t3)
	addi	$t0, 1
	j		phbdelloop
   phbdelend:
	li		$t2, 0
	mul		$t3, $t0, 4
	sw		$t2, phblist($t3)
	sw		$t1, phblists
	jr		$ra

  # Phbsearch
  # Takes:
  #  $a0 - string to search's address
  phbsearch:
 	subu	$sp, 8
	sw		$ra, ($sp)
	sw		$a0, 4($sp)
	move	$t0, $a0		# $t0 contains search element
	lb		$t9, ($t0)		# $t9 contains search element first char
	lw		$t2, phblists
	li		$t3, 0
	li		$t7, 0
   phbsearchloop:
	beq		$t3, $t2, phbsearchnotfound	# array end reached
	mul		$t5, $t3, 4
	lw		$t4, phblist($t5)	# entry address of current index
	lb		$t9, ($t0)
	lb		$t8, ($t4)
	phbsearchloop2:
	beq		$t9, $t8, phbsearchfurthchars
	bgt		$t9, $t8, phbsearchnotfound
	li		$t7, 0
	addi	$t3, 1
	j		phbsearchloop
   phbsearchfurthchars:
	addi	$t7, 1
	add		$t6, $t0, $t7
	lb		$t9, ($t6)
	add		$t6, $t4, $t7
	lb		$t8, ($t6)
	beqz	$t9, phbsearchfound
	j		phbsearchloop2
   phbsearchfound:
	move	$v0, $t3
	j		phbsearchend
   phbsearchnotfound:
	li		$v0, 0
   phbsearchend:
	lw		$a0, 4($sp)
	lw		$ra, ($sp)
	addiu	$sp, 8
	jr		$ra

  # Smspush - Push an sms entry in smslist
  #  - doesn't check for overflow
  # Takes:
  #  $a0 - new entry's address
  smspush:
	move	$t0, $a0
	lw		$t1, smslists
	mul		$t2, $t1, 4
	sw		$t0, smslist($t2)
	addi	$t1, 1
	sw		$t1, smslists
	jr		$ra

  # Smsdel - Deletes an sms entry from smslist
  # Takes:
  #  $a0 - entry's index
  smsdel:
	move	$t0, $a0
	lw		$t9, smslists
	bge		$t0, $t9, smsdelerr
   smsdelloop:
	beq		$t0, $t9, smsdelend
	add		$t1, $t0, 1
	sll		$t1, $t1, 2
	mul		$t3, $t0, 4
	lw		$t2, smslist($t1)
	sw		$t2, smslist($t3)
	addi	$t0, 1
	j		smsdelloop
   smsdelend:
	addi	$t9, -1
	mul		$t0, $t9, 4
	sw		$0, smslist($t0)
	sw		$t9, smslists
	jr		$ra
   smsdelerr:
	jr		$ra

  # Input - Takes an input until 'Ok' button is pressed
  #  or /lenght/ is reached. Calls drawdisplay after every
  #  input char
  # Takes:
  #  $a0 - buffer to store input
  #  $a1 - maximum input's length
  #  $a2 - display's line to modify
  # Returns:
  #  $v0 - -1 if max input's length is reached, otherwise the number of inputted chars
  input:
	subu	$sp, 20
	sw		$ra, ($sp)
	sw		$a0, 4($sp)
	sw		$a1, 8($sp)
	sw		$a2, 12($sp)
	sw		$s6, 16($sp)
	li		$s5, -1
	li		$s6, 0
	li		$s4, 0
	inputresume:
	addi	$t0, $s5, 1	
	lb		$t1, inputbuf($t0)
	beqz	$t1, inputresumend
	add		$t2, $a0, $t0
	sb		$t1, ($t2)
	add		$t2, $a2, $t0
	sb		$t1, ($t2)
	move	$s4, $t1
	addi	$s5, 1
	j		inputresume
	inputresumend:
	jal		drawdisplay
   inputloop:
	# If return address in $s8 is our address, reload
	# last address
	la		$t0, inputloop
  	bne		$s8, $t0, inputloop0
	lw		$s8, ($sp)
	addiu	$sp, 4
	inputloop0:
	lw		$a1, 8($sp)
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	move	$t8, $s4
	lbu		$s4, ($a0)
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	lw		$ra, ($sp)
	move	$t0, $v0
	sw		$s8, ($sp)
	la		$s8, inputloop
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, sinputtab($t0)
	jr		$t0
   input00:
	la		$t9, buth
	li		$t7, 1
	j		inputno
   input01:
	la		$t9, buts
	li		$t7, 6
	j		inputno
   input02:
	la		$t9, but0
	li		$t7, 2
	j		inputno
   input03:
	la		$t9, but1
	li		$t7, 1
	j		inputno
   input04:
	la		$t9, but2
	li		$t7, 5
	j		inputno
   input05:
	la		$t9, but3
	li		$t7, 6
	j		inputno
   input06:
	la		$t9, but4
	li		$t7, 5
	j		inputno
   input07:
	la		$t9, but5
	li		$t7, 4
	j		inputno
   input08:
	la		$t9, but6
	li		$t7, 5
	j		inputno
   input09:
	la		$t9, but7
	li		$t7, 5
	j		inputno
   input10:
	la		$t9, but8
	li		$t7, 5
	j		inputno
   input11:
	la		$t9, but9
	li		$t7, 5
   inputno:
	lw		$a0, 4($sp)				# reload $a0
	lw		$a1, 8($sp)				# reload $a1
	lw		$a2, 12($sp)			# reload $a2
	beq		$t8, $s4, inputnorepress
	li		$s6, 0
	addi	$s5, 1
	beq		$s5, $a1, inputmaxreach
	addu	$t0, $t9, $t6
	lb		$t0, ($t0)
	addu	$t1, $a0, $s5
	sb		$t0, ($t1)
	addu	$t1, $a2, $s5
	sb		$t0, ($t1)
	jal		drawdisplay
	j		inputloop
   inputnorepress:
	addiu	$s6, 1
	remu	$s6, $s6, $t7
	add		$t0, $t9, $s6
	lb		$t0, ($t0)
	add		$t1, $a0, $s5
	sb		$t0, ($t1)
	add		$t1, $a2, $s5
	sb		$t0, ($t1)
	jal		drawdisplay
	j		inputloop
   input12:	# C - delete last pressed char
   			#	- return if there's no chars on buffer
	bltz	$s5, inputC
	lw		$a0, 4($sp)				# reload $a0
	lw		$a2, 12($sp)			# reload $a2
	add		$t1, $a0, $s5
	sb		$0, ($t1)
	add		$t1, $a2, $s5
	lb		$t0, charspace
	sb		$t0, ($t1)
	addi	$s5, -1
	li		$s6, 0
	jal		drawdisplay
	j		inputloop
   input13:	# Down - do nothing
	j		inputloop
   input14:	# Ok - return
	la		$a0, inputbuf
	lw		$a1, inputbufn
	jal		clearbuf
	move	$v0, $s5
   input14bis:
	lw		$s6, 16($sp)
	lw		$a2, 12($sp)
	lw		$a1, 8($sp)
	lw		$a0, 4($sp)
	lw		$ra, ($sp)
	addiu	$sp, 20
	jr		$ra
   input15: # Up - next char
	li		$s6, 0
	li		$s4, 0
	jal		drawdisplay
	j		inputloop
   inputC:	# jump back to last menu
	# clear buffers
	la		$a0, inputbuf
	lw		$a1, inputbufn
	jal		clearbuf
	lw		$s6, 16($sp)
	lw		$a2, 12($sp)
	lw		$a1, 8($sp)
	lw		$a0, 4($sp)
	jal		clearbuf
	lw		$ra, ($sp)
	addiu	$sp, 20
	jr		$s8
   inputmaxreach:
	la		$a0, inputbuf
	lw		$a1, inputbufn
	jal		clearbuf
	sb		$s4, inputbuf
	li		$v0, -1
	j		input14bis
  
  # Inputnumber - like 'input', but it manages only 0-9 values
  # Takes and return the same of 'input'
  inputnumber:
	subu	$sp, 20
	sw		$ra, ($sp)
	sw		$a0, 4($sp)
	sw		$a1, 8($sp)
	sw		$a2, 12($sp)
	sw		$s6, 16($sp)
	li		$s4, 0
	li		$s5, -1
	inputnumberresume:
	addi	$t0, $s5, 1
	lb		$t1, inputbuf($t0)
	beqz	$t1, inputnumberresumend
	sb		$t1, ($a0)
	sb		$t1, ($a2)
	addi	$s5, 1
	j		inputnumberresume
	inputnumberresumend:
	jal		drawdisplay
  inputnumberloop:
	# If return address in $s8 is our address, reload
	# last address
	la		$t0, inputnumberloop
  	bne		$s8, $t0, inputnumberloop0
	lw		$s8, ($sp)
	addiu	$sp, 4
	inputnumberloop0:
	lw		$a1, 8($sp)
	beq		$s5, $a1, input14
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	lw		$ra, ($sp)
	addiu	$sp, 4
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, inputnumberloop
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, sinputnumbtab($t0)
	jr		$t0
   inputnumb00:
   inputnumb01:
   inputnumb02:
   inputnumb03:
   inputnumb04:
   inputnumb05:
   inputnumb06:
   inputnumb07:
   inputnumb08:
   inputnumb09:
   inputnumb10:
   inputnumb11:
	lw		$a0, 4($sp)
	lw		$a2, 12($sp)
	addi	$s5, 1
	add		$t0, $a0, $s5
	sb		$s4, ($t0)
	add		$t0, $a2, $s5
	sb		$s4, ($t0)
	jal		drawdisplay
	j		inputnumberloop
   inputnumb12:	# C - delete last number - if it's the first, return to main menu
	bltz	$s5, inputnumberC
	lw		$a0, 4($sp)
	lw		$a2, 12($sp)
	add		$t0, $a0, $s5
	sb		$0, ($t0)
	add		$t0, $a2, $s5
	lb		$t1, charspace
	sb		$t1, ($t0)
	addi	$s5, -1
	jal		drawdisplay
	j		inputnumberloop
   inputnumb13:	# Down - do nothing
	j		inputnumberloop
   inputnumb14:	# Ok - Return
	lw		$s6, 16($sp)
	lw		$a2, 12($sp)
	lw		$a1, 8($sp)
	lw		$a0, 4($sp)
	lw		$ra, ($sp)
	addiu	$sp, 20
	move	$v0, $s5
	jr		$ra
   inputnumb15:	# Up - do nothing
	j		inputnumberloop
   inputnumberC:  # jump back to last menu
	# clear buffers
	lw		$s6, 16($sp)
	lw      $a2, 12($sp)
	lw      $a1, 8($sp)
	lw      $a0, 4($sp)
	jal     clearbuf
	lw      $ra, ($sp)
	addiu   $sp, 16
	jr      $s8

#### MAIN SECTION ####
  main:
	subu	$sp, 4			# create the stack
	sw		$ra, ($sp)

	# init lists - Make sure all is 0
	li		$t0, 0
	lw		$t1, phblistn	# phblist number
	lw		$t2, smslistn	# smslist number
   phblistloop:
	bltz	$t1, smslistloop
	sw		$t0, phblist($t1)
	addi	$t1, -4
	j		phblistloop
   smslistloop:
	bltz	$t2, initlistsend
	sw		$t0, smslist($t2)
	addi	$t2, -4
	j		smslistloop
   initlistsend:
   # init buffers
	la		$a0, phbbuf
	lw		$a1, phbbufn
	jal		clearbuf
	la		$a0, smsbuf
	lw		$a1, smsbufn
	jal		clearbuf
	la		$a0, ringbuf
	lw		$a1, ringbufn
	jal		clearbuf
	la		$a0, inputbuf
	lw		$a1, inputbufn
	jal		clearbuf
	
	la		$a0, message01
	li		$v0, 4
	syscall
	la		$a0, message02
	syscall
	jal		printNL
	lw		$ra, ($sp)
  	la		$s8, mainmenu
  mainmenu:
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		load0display
	la		$s3, display4m
	jal		drawdisplay
	lw		$ra, ($sp)
	addiu	$sp, 4

  mainchoice:
	# If return address in $s8 is our address, reload
	# last address
	la		$t0, mainchoice
  	bne		$s8, $t0, mainchoice0
	lw		$s8, ($sp)
	addiu	$sp, 4
	mainchoice0:
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	lw		$ra, ($sp)
	addiu	$sp, 4
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, mainchoice
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, stab01($t0)
	jr		$t0
   mmenu00: # #
   mmenu01: # *
   # 02-11: number, goto ringout
   mmenu02:
   mmenu03:
   mmenu04:
   mmenu05:
   mmenu06:
   mmenu07:
   mmenu08:
   mmenu09:
   mmenu10:
   mmenu11:
	li		$s5, 0
	li		$s7, 0
	sb		$s4, ringbuf($s5)
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, mainchoice
	j		ringout
   mmenu12:	# C - return to main menu
	jr		$s8
   mmenu13:	# Down - goto phone book browse
	li		$s7, 0
	j		phbookbrowse
   mmenu14:	# Ok - open menu
  	la		$s7, loadsmsdisplay
	subu	$sp, 8
	sb		$s8, 4($sp)
	sb		$s7, ($sp)
	j		realmenu
   mmenu15: # Up - open last calls
	j		lastcalls

  invalidbutton:
	la		$a0, msgInvalid
	li		$v0, 4
	syscall
	jr		$s8
	
  ringout:
  	# If return address in $s8 is our address, reload
	# last address
	la		$t0, ringout
  	bne		$s8, $t0, ringoutloop
	lw		$s8, ($sp)
	addiu	$sp, 4
	ringoutloop:
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		cleardisp
	mul		$t0, $s7, 4
  	lw		$s3, ringouttab($t0)
	move	$a0, $s1
	lw		$a1, linebufn
	jal		clearbuf
	la		$a0, ringbuf
	move	$a1, $s1
	lw		$a2, ringbufn
	lw		$a3, linebufn
	jal		copybuf
	jal		drawdisplay
	lw		$ra, ($sp)
	addiu	$sp, 4
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	lw		$ra, ($sp)
	addiu	$sp, 4
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, ringout
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, sringout($t0)
	jr		$t0
   ringout00: # #
   ringout01: # * - ???
   # 02-11: number, add a number
   ringout02:
   ringout03:
   ringout04:
   ringout05:
   ringout06:
   ringout07:
   ringout08:
   ringout09:
   ringout10:
   ringout11:
	addi	$s5, 1
	sb		$s4, ringbuf($s5)
	j		ringoutloop
   ringout12:	# C - delete last number - if it's the first, return to main menu
	beqz	$s5, ringoutexit
	sb		$0, ringbuf($s5)
	addi	$s5, -1
	j		ringoutloop
   ringout13:	# Down - goto ringout15
	j		ringout15
   ringout14:	# Ok - Call/Save
	la		$t0, display4c
	beq		$s3, $t0, ringoutcall
	la		$t0, display4S
	beq		$s3, $t0, ringoutsave
   ringout15:	# Up - Call -> Save -> Call
	lw		$t3, ringoutno
	addi	$s7, 1
	remu	$s7, $s7, $t3
	j		ringoutloop
   ringoutcall:
	la		$s3, display4k
	jal		drawdisplay
	la		$a0, msgRingout
	li		$v0, 4
	syscall
	jal		printNL
	la		$a0, msgReq
	li		$v0, 4
	syscall
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	la		$s8, mainmenu
	j		mainmenu
   ringoutsave:
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, ringout
	j		phbookaddname
   ringoutexit:
	jr		$s8

  realmenu:
	# Load display
	lw		$s7, ($sp)
	addiu	$sp, 4
  	la		$t9, loadpbdisplay
	bne		$s7, $t9, realmenuload01
	la		$t9, loadsmsdisplay
	j		realmenuload02
   realmenuload01:
	la		$s7, loadsmsdisplay
   realmenuload02:
	# If return address in $s8 is our address, reload
	# last address
	la		$t0, realmenu
  	bne		$s8, $t0, realmenuloop
	lw		$s8, ($sp)
	addiu	$sp, 4
   realmenuloop:
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	jal		$t9
	la		$s3, display4s
	jal		drawdisplay
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	lw		$ra, ($sp)
	addiu	$sp, 4
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, realmenu
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, stab02($t0)
	jr		$t0
   # here, only letter buttons are valid
   rmenu00:
   rmenu01:
   rmenu02:
   rmenu03:
   rmenu04:
   rmenu05:
   rmenu06:
   rmenu07:
   rmenu08:
   rmenu09:
   rmenu10:
   rmenu11:
	j		realmenuloop
   rmenu12:	# C - return to main menu
	jr		$s8
   rmenu13:	# Down - goto rmenu15
	j		rmenu15
   rmenu14:	# Ok - open phonebook/sms menu
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, realmenu
	la		$t0, loadpbdisplay
	bne		$t0, $s7, phbookmenu
	j		smsmenu
   rmenu15: # Up - switch phonebook/sms menu
	move	$t8, $t9
	move	$t9, $s7
	move	$s7, $t8
	j		realmenuloop

  lastcalls:
	jr		$s8

  phbookmenu:
	li		$s7, 0
	# If return address in $s8 is our address, reload
	# last address
	la		$t0, phbookmenu
  	bne		$s8, $t0, phmenusel
	lw		$s8, ($sp)
	addiu	$sp, 4
   phmenusel:
	lw		$t3, phbmenuno
	move	$t0, $s7
	addi	$t1, $t0, 1
	addi	$t2, $t1, 1
	remu	$t1, $t1, $t3
	remu	$t2, $t2, $t3
	sll		$t0, $t0, 2
	sll		$t1, $t1, 2
	sll		$t2, $t2, 2
	lw		$s0, phbmenutab($t0)
	lw		$s1, phbmenutab($t1)
	lw		$s2, phbmenutab($t2)
	la		$s3, display4s
	lb		$t9, charselect
	sb		$t9, ($s0)
	jal		drawdisplay
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	lw		$ra, ($sp)
	addiu	$sp, 4
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, phbookmenu
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, spbmenutab($t0)
	jr		$t0
   # here, only letter buttons are valid
   pbmenu00:
   pbmenu01:
   pbmenu02:
   pbmenu03:
   pbmenu04:
   pbmenu05:
   pbmenu06:
   pbmenu07:
   pbmenu08:
   pbmenu09:
   pbmenu10:
   pbmenu11:
	j		phmenusel
   pbmenu12:	# C - return to main menu
	lb		$t9, charspace
	sb		$t9, ($s0)
	la      $t9, loadsmsdisplay
	jr		$s8
   pbmenu13:	# Down - 
	lb		$t9, charspace
	sb		$t9, ($s0)
	lw		$t3, phbmenuno
	addi	$s7, 1
	remu	$s7, $s7, $t3
	j		phmenusel
   pbmenu14:	# Ok - open submenu
	lb		$t9, charspace
	sb		$t9, ($s0)
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, phbookmenu
	move	$t0, $s7
	sll		$t0, $t0, 2
	lw      $t0, phbmenuref($t0)
	jr      $t0
   pbmenu15: # Up - 
	lb		$t9, charspace
	sb		$t9, ($s0)
	addi	$s7, -1
	bgez	$s7, pbmenu15bis
	lw		$s7, phbmenuno
	addi	$s7, -1
   pbmenu15bis:
	j		phmenusel

  phbookbrowse:
	# If return address in $s8 is our address, reload
	# last address
	la		$t0, phbookbrowse
  	bne		$s8, $t0, phbookbrowse0
	lw		$s8, ($sp)
	addiu	$sp, 4
	phbookbrowse0:
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4c
	la		$s6, ringoutcall
   phbookbrowseloop:
	lw		$t3, phblists
	blez	$t3, phbookbrowsenodata
	move	$t0, $s7
	subu	$sp, 4
	sw		$t0, ($sp)
	jal		cleardisp	
	lw		$t0, ($sp)
	addiu	$sp, 4
	mul		$t5, $t0, 4
	lw		$a0, phblist($t5)
	move	$a1, $s0
	addi	$a1, 1
	lw		$a2, phbbufn
	lw		$a3, linebufn
	addi	$a3, -1
	jal		copybuf
	lw		$a2, phbbufn
	add		$a0, $a0, $a2
	move	$a1, $s1
	addi	$a1, 4
	lw		$a2, ringbufn
	lw		$a3, linebufn
	addi	$a3, -4
	jal		copybuf
	lb		$t9, charspace
	sb		$t9, ($s0)
	sb		$t9, ($s1)
	sb		$t9, 1($s1)
	sb		$t9, 2($s1)
	sb		$t9, 3($s1)
	jal		drawdisplay
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, phbookbrowse
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, sphbmenubrtab($t0)
	jr		$t0
   # here, only letter buttons are valid
   phbmenubr00:
   phbmenubr01:
   phbmenubr02:
   phbmenubr03:
   phbmenubr04:
   phbmenubr05:
   phbmenubr06:
   phbmenubr07:
   phbmenubr08:
   phbmenubr09:
   phbmenubr10:
   phbmenubr11:
	j		phbookbrowseloop
   phbmenubr12:	# C - return to main menu
	jr		$s8
   phbmenubr13:	# Down - 
	lw		$t3, phblists
	addi	$s7, 1
	remu	$s7, $s7, $t3
	j		phbookbrowseloop
   phbmenubr14:	# Ok - Call/Edit/Delete or whatever else
	mul		$t0, $s7, 4
	lw		$t0, phblist($t0)
	lb		$t2, newline
	lw		$t1, phbbufn
	add		$t0, $t0, $t1
	move	$a0, $t0
	move	$a1, $s1
	lw		$a2, ringbufn
	lw		$a3, linebufn
	jal		copybuf
	j		$s6
   phbmenubr15: # Up - 
	addi	$s7, -1
	bltz	$s7, phbmenubr15bis
	j		phbookbrowseloop
   phbmenubr15bis:
	lw		$s7, phblists
	addi	$s7, -1
	j		phbookbrowse
   phbookbrowsenodata:
	jal		printnodata
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
   phbookbrowseclearup:
	jal		cleardisp
	lw		$t0, ($sp)
	addiu	$sp, 4
	# return to last menu
	jr		$s8
	
  phbooksearch:
   phbooksearchname:		# write name and store it in phbbuf
	subu	$sp, 4
	sw		$ra, ($sp)
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4s
	jal		cleardisp
	la		$a0, display1N
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	jal		drawdisplay
	la		$a0, phbbuf
	lw		$a1, phbbufn
	move	$a2, $s1
	sb		$0, inputbuf
	jal		input
	lw		$ra, ($sp)
	addiu	$sp, 4
	la		$a0, phbbuf
	jal		phbsearch
	move	$s7, $v0
	j		phbookbrowse
	
  phbookadd:
   phbookaddnumber:		# write number and store it in ringbuf
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4s
	jal		cleardisp
	la		$a0, display1x
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	jal		drawdisplay
	la		$a0, ringbuf
	lw		$a1, ringbufn
	move	$a2, $s1
	jal		inputnumber
	addi	$t0, $v0, 1
	sb		$0, ringbuf($t0)
   phbookaddname:		# write name and store it in phbbuf
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4s
	jal		cleardisp
	la		$a0, display1N
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	jal		drawdisplay
	la		$a0, phbbuf
	lw		$a1, phbbufn
	move	$a2, $s1
	sb		$0, inputbuf
	la		$s8, phbookaddC
	jal		input
	addi	$t0, $v0, 1
	sb		$0, phbbuf($t0)
	lw		$s8, ($sp)
	addiu	$sp, 4
   phbookaddinsert:
	lw		$t0, phblistn
	lw		$t1, phblists
	beq		$t0, $t1, phbookaddnomorespace
	# alloc space for the new entry
	lw		$a0, phbentry
	addi	$a0, 1
	li		$v0, 9
	syscall
	move	$t9, $v0		# new entry's address
	subu	$sp, 8
	sw		$t9, ($sp)
	la		$a0, phbbuf
	move	$a1, $t9
	lw		$a2, phbbufn
	lw		$a3, phbentry
	jal		copybuf
	add		$t0, $a1, $v0
	addi	$t0, 1
	sb		$0, ($t0)
	lw		$a2, phbbufn
	addi	$a2, 1
	lw		$t9, ($sp)
	add		$a1, $a2, $t9	# increase offset
	lw		$a3, phbentry
	sub		$a3, $a3, $a2	# decrease memory capacity
	la		$a0, ringbuf
	lw		$a2, ringbufn
	jal		copybuf
	add		$t0, $a1, $v0
	addi	$t0, 1
	sb		$0, ($t0)
	lw		$t9, ($sp)
	addiu	$sp, 8
	move	$a0, $t9
	jal		phbins
	# all done, print successful message
	jal		printsaved
	j		phbookaddclean
   phbookaddnomorespace:
	jal		printnomorespace
   phbookaddclean:
	# wait for keypress
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
   phbookaddC0:
	# clear buffers
	la		$a0, ringbuf
	lw		$a1, ringbufn
	jal		clearbuf
	la		$a0, phbbuf
	lw		$a1, phbbufn
	jal		clearbuf
	# return to last menu
	jr		$s8
   phbookaddC:
	lw		$s8, ($sp)
	addiu	$sp, 4
	j		phbookaddC0
	
  phbookdel:
  	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4D
	lw		$t3, phblists
	blez	$t3, phbookbrowsenodata
	la		$s6, phbookdelreal
	li		$s7, 0
	subu	$sp, 4
	sw		$s8, ($sp)
	j		phbookbrowseloop
   phbookdelreal:
	lw		$s8, ($sp)
	addiu	$sp, 4
	move	$a0, $s7
	jal		phbdel
	jr		$s8
	
  phbookclean:
	lw		$t0, phblists
	bltz	$t0, phbookcleanend
	addi	$t0, -1
	mul		$t1, $t0, 4
	sw		$0, phblist($t0)
	sw		$t0, phblists
	j		phbookclean
   phbookcleanend:
	jr		$s8
	
  phbookedit:
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4e
	lw		$t3, phblists
	blez	$t3, phbookbrowsenodata
	la		$s6, phbookeditreal
	li		$s7, 0
	subu	$sp, 4
	sw		$s8, ($sp)
	j		phbookbrowseloop
   phbookeditreal:
	la		$s3, display4s
	jal		cleardisp
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$s7, $s7, 2
	lw		$a0, phblist($s7)
	subu	$sp, 4
	sw		$a0, ($sp)
	la		$a1, phbbuf
	lw		$a2, phbbufn
	lw		$a3, phbbufn
	jal		copybuf
	sb		$0, phbbuf($v0)
	lw		$a2, phbbufn
	lw		$a0, ($sp)
	add		$a0, $a0, $a2
	la		$a1, ringbuf
	lw		$a2, ringbufn
	lw		$a3, ringbufn
	jal		copybuf
	sb		$0, ringbuf($v0)
   phbookeditnumber:		# edit number and store it in ringbuf
	jal		cleardisp
	la		$a0, display1x
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	la		$a0, ringbuf
	move	$a1, $s1
	lw		$a2, ringbufn
	lw		$a3, linebufn
	jal		copybuf
	jal		drawdisplay
	la		$a0, ringbuf
	la		$a1, inputbuf
	lw		$a2, ringbufn
	lw		$a3, inputbufn
	jal		copybuf
	sb		$0, inputbuf($v0)
	la		$a0, ringbuf
	lw		$a1, ringbufn
	move	$a2, $s1
	jal		inputnumber
   phbookeditname:		# edit name and store it in phbbuf
	jal		cleardisp
	la		$a0, display1N
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	la		$a0, phbbuf
	move	$a1, $s1
	lw		$a2, phbbufn
	lw		$a3, linebufn
	jal		copybuf
	jal		drawdisplay
	la		$a0, phbbuf
	la		$a1, inputbuf
	lw		$a2, phbbufn
	lw		$a3, inputbufn
	jal		copybuf
	sb		$0, inputbuf($v0)
	la		$a0, phbbuf
	lw		$a1, phbbufn
	move	$a2, $s1
	jal		input
	# save changes
	la		$a0, phbbuf
	lw		$a1, ($sp)
	lw		$a2, phbbufn
	lw		$a3, phbentry
	jal		copybuf
	lw		$a2, phbbufn
	addi	$a2, 1
	lw		$a1, ($sp)
	add		$a1, $a2, $a1	# increase offset
	lw		$a3, phbentry
	sub		$a3, $a3, $a2	# decrease memory capacity
	la		$a0, ringbuf
	lw		$a2, ringbufn
	jal		copybuf
	addiu	$sp, 4
	# all done, print successful message
	jal		printsaved
	j		phbookaddclean

  smsmenu:
	li		$s7, 0
	# If return address in $s8 is our address, reload
	# last address
	la		$t0, smsmenu
  	bne		$s8, $t0, smsmenusel
	lw		$s8, ($sp)
	addiu	$sp, 4
   smsmenusel:
	lw		$t3, smsmenuno
	move	$t0, $s7
	addi	$t1, $t0, 1
	addi	$t2, $t1, 1
	remu	$t1, $t1, $t3
	remu	$t2, $t2, $t3
	sll		$t0, $t0, 2
	sll		$t1, $t1, 2
	sll		$t2, $t2, 2
	lw		$s0, smsmenutab($t0)
	lw		$s1, smsmenutab($t1)
	lw		$s2, smsmenutab($t2)
	lb		$t9, charselect
	sb		$t9, ($s0)
	jal		drawdisplay
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	subu	$sp, 4
	sw		$ra, ($sp)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	lw		$ra, ($sp)
	addiu	$sp, 4
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, smsmenu
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, ssmsmenutab($t0)
	jr		$t0
   # here, only letter buttons are valid
   smmenu00:
   smmenu01:
   smmenu02:
   smmenu03:
   smmenu04:
   smmenu05:
   smmenu06:
   smmenu07:
   smmenu08:
   smmenu09:
   smmenu10:
   smmenu11:
	j		smsmenusel
   smmenu12:	# C - return to main menu
	lb		$t9, charspace
	sb		$t9, ($s0)
	la		$t9, loadpbdisplay
	jr		$s8
   smmenu13:	# Down - 
	lb		$t9, charspace
	sb		$t9, ($s0)
	lw		$t3, smsmenuno
	addi	$s7, 1
	remu	$s7, $s7, $t3
	j		smsmenusel
   smmenu14:	# Ok - open submenu
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, smsmenu
	lb		$t9, charspace
	sb		$t9, ($s0)
	move	$t0, $s7
	sll		$t0, $t0, 2
	lw      $t0, smsmenuref($t0)
	li		$s7, 0
	jr      $t0
   smmenu15: # Up - 
	lb		$t9, charspace
	sb		$t9, ($s0)
	addi	$s7, -1
	bgez	$s7, smmenu15bis
	lw		$s7, smsmenuno
	addi	$s7, -1
   smmenu15bis:
	j		smsmenusel

  smsbrowse:
	# If return address in $s8 is our address, reload
	# last address
	la		$t0, smsbrowse
  	bne		$s8, $t0, smsbrowsereal
	lw		$s8, ($sp)
	addiu	$sp, 4
	smsbrowsereal:
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4s
   smsbrowseloop:
	lw		$t3, smslists
	blez	$t3, smsbrowsenodata
	move	$t0, $s7
	subu	$sp, 4
	sw		$t0, ($sp)
	jal		cleardisp
	lw		$t0, ($sp)
	sll		$t0, $t0, 2
	lw		$a0, smslist($t0)
	move	$a1, $s0
	addi	$a1, 1
	lw		$a2, linebufn
	lw		$a3, linebufn
	addi	$a2, -3
	addi	$a3, -2
	jal		copybuf
	lw		$t0, ($sp)
	lw		$t3, smslists
	li		$t2, 3
	blt		$t3, $t2, smsbrowseloop2
	addi	$t2, $t0, 2
	remu	$t2, $t2, $t3
	sll		$t2, $t2, 2
	lw		$a0, smslist($t2)
	move	$a1, $s1
	addi	$a1, 1
	lw		$a2, linebufn
	lw		$a3, linebufn
	addi	$a2, -2
	addi	$a3, -1
	jal		copybuf
	smsbrowseloop2:
	lw		$t3, smslists
	li		$t1, 2
	blt		$t3, $t1, smsbrowseloop1
	addi	$t1, $t0, 1
	remu	$t1, $t1, $t3
	sll		$t1, $t1, 2
	lw		$a0, smslist($t1)
	move	$a1, $s1
	addi	$a1, 1
	lw		$a2, linebufn
	lw		$a3, linebufn
	addi	$a2, -2
	addi	$a3, -1
	jal		copybuf
	smsbrowseloop1:
	lw		$t0, ($sp)
	addiu	$sp, 4
	lb		$t9, charselect
	sb		$t9, ($s0)
	jal		drawdisplay
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, smsbrowse
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, ssmsmenubrtab($t0)
	jr		$t0
   # here, only letter buttons are valid
   smsmenubr00:
   smsmenubr01:
   smsmenubr02:
   smsmenubr03:
   smsmenubr04:
   smsmenubr05:
   smsmenubr06:
   smsmenubr07:
   smsmenubr08:
   smsmenubr09:
   smsmenubr10:
   smsmenubr11:
	j		smsbrowseloop
   smsmenubr12:	# C - return to main menu
	lw		$t0, ($sp)
	addiu	$sp, 4
	jr		$s8
   smsmenubr13:	# Down - 
	lw		$t3, smslists
	addi	$s7, 1
	remu	$s7, $s7, $t3
	j		smsbrowseloop
   smsmenubr14:	# Ok - Store values and jump to $s6
	lb		$t9, charspace
	sb		$t9, ($s0)
	lw		$t0, ($sp)
	sw		$s8, ($sp)
	la		$s8, smsbrowse
	j		$s6
   smsmenubr15: # Up - 
	addi	$s7, -1
	bltz	$s7, smsmenubr15bis
	j		smsbrowseloop
   smsmenubr15bis:
	lw		$s7, smslists
	addi	$s7, -1
	j		smsbrowse
   smsbrowsenodata:
	jal     printnodata
	la      $a0, microbuf
	li      $a1, 2
	li      $v0, 8
	syscall
   smsbrowseclearup:
	lb		$t9, charspace
	sb		$t9, ($s0)
	jal		cleardisp
	# return to main menu
	jr		$s8

  smswrite:
	subu	$sp, 20
	sw		$ra, ($sp)
	li		$s6, 0
   	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4S
	move	$t9, $s0
	sw		$t9, 12($sp)
	jal		cleardisp
   smswriteloop:
	jal		drawdisplay
	la		$a0, smsbuf
	lw		$a1, linebufn
	mul		$t0, $s6, $a1
	add		$a0, $a0, $t0
	# check for overflows
	li		$t1, 160
	sub		$t1, $t1, $t0
	sw		$t1, 8($sp)				# available chars
	bge		$t1, $a1, smswriteloop2
	move	$a1, $t1
	sw		$a1, 16($sp)
	smswriteloop2:
	lw		$a2, 12($sp)
	sw		$s6, 4($sp)
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, smswriteback
	jal		input
	lw		$s8, ($sp)
	addiu	$sp, 4
	move	$t0, $v0
	bgez	$t0, smswritenumber
	addi	$s6, 1
	lw		$t1, 8($sp)
	lw		$t2, 16($sp)
	beq		$t1, $t2, smswritenumber
	lw		$t9, 12($sp)
	beq		$t9, $s2, smswriteloopS2
	beq		$t9, $s1, smswriteloopS1
	sw		$s1, 12($sp)
	j		smswriteloop
	smswriteloopS1:
	sw		$s2, 12($sp)
	j		smswriteloop
	smswriteloopS2:
	jal		cleardisp
	sw		$s0, 12($sp)
	j		smswriteloop
   smswriteback:
	lw		$s8, ($sp)
	addiu	$sp, 4
	beqz	$s6, smswritecleanup
	addi	$s6, -1
	la		$a0, smsbuf
	lw		$a2, linebufn
	mul		$t0, $s6, $a2
	add		$a0, $a0, $t0
	la		$a1, inputbuf
	lw		$a3, inputbufn
	jal		copybuf
	sb		$0, inputbuf($a2)
	lw		$t9, 12($sp)
	beq		$t9, $s2, smswritebackS2
	beq		$t9, $s1, smswritebackS1
	jal		cleardisp
	sub		$t0, $s6, 2
	la		$a0, smsbuf
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	mul		$t0, $t0, $a2
	add		$a0, $a0, $t0
	jal		copybuf
	sub		$t0, $s6, 2
	la		$a0, smsbuf
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	mul		$t0, $t0, $a2
	add		$a0, $a0, $t0
	jal		copybuf
	sw		$s2, 12($sp)
	lw		$a1, linebufn
	j		smswriteloop2
	smswritebackS1:
	sw		$s0, 12($sp)
	lw		$a1, linebufn
	j		smswriteloop2
	smswritebackS2:
	sw		$s1, 12($sp)
	lw		$a1, linebufn
	j		smswriteloop2
   smswritenumber:
	lw		$a1, linebufn
	mul		$t1, $s6, $a1
	bltz	$t0, smswritenumber1
	add		$t1, $t1, $t0
	j		smswritenumber0
	smswritenumber1:
	sub		$t1, $t1, $a1
	lw		$t2, 20($sp)
	add		$t1, $t1, $t2
	smswritenumber0:
	addi	$t1, 1
	sb		$0, smsbuf($t1)
	addiu	$sp, 20
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	la		$s3, display4s
	jal		cleardisp
	la		$a0, display1x
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	jal		copybuf
	jal		drawdisplay
	la		$a0, ringbuf
	lw		$a1, ringbufn
	move	$a2, $s1
	jal		inputnumber
	la		$a0, ringbuf
	jal		countnumbers
	sb		$0, ringbuf($v0)
   smswritesave:
	lw		$t0, smslistn
	lw		$t1, smslists
	beq		$t0, $t1, smswritenomorespace
	lw		$a0, smsentry
	addi	$a0, 1
	li		$v0, 9
	syscall			# sbrk
	move	$t9, $v0
	subu	$sp, 8
	sw		$t9, ($sp)
	la		$a0, smsbuf
	move	$a1, $t9
	lw		$a2, smsbufn
	lw		$a3, smsentry
	jal		copybuf
	add		$t0, $a1, $v0
	addi	$t0, 1
	sb		$0, ($t0)
	lw		$a2, smsbufn
	addi	$a2, 1
	lw		$t9, ($sp)
	add		$a1, $a2, $t9	# increase offset
	lw		$a3, smsentry
	sub		$a3, $a3, $a2	# decrease capacity
	la		$a0, ringbuf
	lw		$a2, ringbufn
	jal		copybuf
	add		$t0, $a1, $v0
	addi	$t0, 1
	sb		$0, ($t0)
	lw		$t9, ($sp)
	addiu	$sp, 8
	move	$a0, $t9
	jal		smspush
	jal		printsaved
	j		smswriteclean
   smswritenomorespace:
	jal		printnomorespace
   smswriteclean:
	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
   smswritecleanup:
	# clean up buffers
	la		$a0, ringbuf
	lw		$a1, ringbufn
	jal		clearbuf
	la		$a0, smsbuf
	lw		$a1, smsbufn
	jal		clearbuf
	jr		$s8

  smserase:
	la		$s6, smserasereal
	j		smsbrowse
   smserasereal:
	move	$a0, $s7
	jal		smsdel
	jr		$s8

  smsread:
	la		$s6, smsreadreal
	j		smsbrowse
   smsreadreal:
	subu	$sp, 12
	# $s7 contains selected sms' index
	sll		$s7, $s7, 2
	lw		$a0, smslist($s7)	# selected sms's address
	sw		$a0, ($sp)
	la		$a1, smsbuf
	lw		$a2, smsbufn
	lw		$a3, smsbufn
	jal		copybuf
	sb		$0, smsbuf($v0)
	add		$a0, $a0, $a3
	addi	$a0, 1
	la		$a1, ringbuf
	lw		$a2, ringbufn
	lw		$a3, ringbufn
	jal		copybuf
	sb		$0, ringbuf($v0)
	la		$s0, line0buf
	la		$s1, line1buf
	la		$s2, line2buf
	jal		cleardisp
	la		$s3, display4E
	li		$s7, 0
	li		$t1, 0
	smsreadcount:
	lb		$t2, smsbuf($t1)
	addi	$t1, 1
	bnez	$t2, smsreadcount
	smsreadcountend:
	lw		$t2, linebufn
	div		$t0, $t1, $t2
	sw		$t0, 4($sp)
	remu	$t0, $t1, $t2
	sw		$t0, 8($sp)
   smsreadloop:
	# first row
	lw		$a0, ($sp)
	move	$a1, $s0
	lw		$a2, linebufn
	lw		$a3, linebufn
	lw		$t1, 4($sp)
	bgt		$t1, $s7, smsreadloop1row0
	lw		$a2, 8($sp)
	smsreadloop1row0:
	mul		$t0, $s7, $a3
	add		$a0, $a0, $t0
	jal		copybuf
	# second row
	lw		$a0, ($sp)
	move	$a1, $s1
	lw		$a2, linebufn
	lw		$a3, linebufn
	lw		$t1, 4($sp)
	addi	$t0, $s7, 1
	bgt		$t1, $t0, smsreadloop2row0
	beq		$t1, $t0, smsreadloop2row1
	# display "Number: "
	la		$a0, display1x
	j		smsreadloop2rowdone
	smsreadloop2row1:
	lw		$a2, 8($sp)
	smsreadloop2row0:
	mul		$t0, $t0, $a3
	add		$a0, $a0, $t0
	smsreadloop2rowdone:
	move	$a1, $s1
	jal		copybuf
	# third row
	lw		$a0, ($sp)
	move	$a1, $s2
	lw		$a2, linebufn
	lw		$a3, linebufn
	lw		$t1, 4($sp)
	addi	$t0, $s7, 2
	bgt		$t1, $t0, smsreadloop3row0
	beq		$t1, $t0, smsreadloop3row1
	addi	$t0, -1
	beq		$t0, $t1 smsreadloop3row2
	la		$a0, ringbuf
	lw		$a2, ringbufn
	j		smsreadloop3rowdone
	smsreadloop3row2:
	la		$a0, display1x
	j		smsreadloop3rowdone
	smsreadloop3row1:
	lw		$a2, 8($sp)
	smsreadloop3row0:
	mul		$t0, $t0, $a3
	add		$a0, $a0, $t0
	smsreadloop3rowdone:
	move	$a1, $s2
	jal		copybuf
	jal		drawdisplay
   	la		$a0, microbuf
	li		$a1, 2
	li		$v0, 8
	syscall
	lbu		$s4, ($a0)
	jal		printNL
	move	$a0, $s4
	jal		comppress
	move	$t0, $v0
	subu	$sp, 4
	sw		$s8, ($sp)
	la		$s8, smsbrowse
	bltz	$t0, invalidbutton
	lw		$s8, ($sp)
	addiu	$sp, 4
	sll		$t0, $t0, 2
	lw		$t0, ssmsreadtab($t0)
	jr		$t0
   # here, only letter buttons are valid
   smsread00:
   smsread01:
   smsread02:
   smsread03:
   smsread04:
   smsread05:
   smsread06:
   smsread07:
   smsread08:
   smsread09:
   smsread10:
   smsread11:
	j		smsreadloop
   smsread12:	# C - return to main menu
	addiu	$sp, 12
	jr		$s8
   smsread13:	# Down - down!
	lw		$t1, 4($sp)
	lw		$t0, 8($sp)
	beqz	$t0, smsread13bis
	addi	$t1, 1
	smsread13bis:
	beq		$t1, $s7, smsreadloop
	addi	$s7, 1
	j		smsreadloop
   smsread14:	# Ok - exit
	addiu	$sp, 12
	jr      $s8
   smsread15: # Up - up!
	beqz	$s7, smsreadloop
	addi	$s7, -1
	j		smsreadloop
	

  # A negative number has been pressed: this is a BUG!
  noneg:
  	la		$a0, msgNoneg
	li		$v0, 4
	syscall
	j		mainmenu

# End of file - editor informations
# vim: ts=4

