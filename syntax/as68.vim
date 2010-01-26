" Vim syntax file
" Language:	Motorola M68HC11 Assembly
" Maintainer:	Steven Bell <botsnlinux@gmail.com>
" Last Change:	2009 Sep 15

if exists("b:current_syntax")
  finish
endif

syn case match

syn match as11Comment /\*.*/

syn keyword as11Directive org fcb fdb
syn keyword as11Instruction aba abx aby adca adcb adda addb addd anda andb asl asla aslb asld asr asra asrb
syn keyword as11Instruction bcc bclr bcs beq bge bgt bhi bhs bita bitb ble blo bls blt bmi bne bpl bra brclr brn brset bset bsr bvc bvs
syn keyword as11Instruction cba clc cli clr clra clrb clv cmpa cmpb com coma comb cpd cpx cpy
syn keyword as11Instruction daa dec deca decb des dex dey eora eorb fdiv idiv inc inca incb ins inx iny
syn keyword as11Instruction jmp jsr ldaa ldab ldd lds ldx ldy lsl lsla lslb lsld lsr lsra lsrb lsrd
syn keyword as11Instruction mul neg nega negb nop oraa orab psha pshb pshx pshy pula pulb pulx puly
syn keyword as11Instruction rol rola rolb ror rora rorb rti rts sba sbca sbcb sec sei sev staa stab std stop sts stx sty suba subb subd swi
syn keyword as11Instruction tab tap tba test tpa tst tsta tstb tsx tsy txs tys wai xgdx xgdy

syn match binNumber8    /%[0-1]\{8}/
syn match hexNumber8		/\$[0-9A-Fa-f]\{2}/
syn match hexNumber16		/\$[0-9A-Fa-f]\{4}/
syn match immediateHexNumber8		/\#$[0-9A-Fa-f]\{2}/
syn match immediateHexNumber16		/\#$[0-9A-Fa-f]\{4}/


syn keyword as11Todo TODO FIXME BUG XXX


highlight link as11Comment Comment

highlight link as11Directive PreProc
highlight link as11Instruction Statement

highlight link binNumber8 Number
highlight link hexNumber8 Number
highlight link hexNumber16 Number
highlight link immediateHexNumber8 Identifier
highlight link immediateHexNumber16 Identifier

highlight link as11Todo Todo

let b:current_syntax = "as11"

