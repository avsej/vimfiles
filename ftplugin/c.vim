setlocal autoindent
setlocal cindent
" C-mode options (cinoptions==cino)
" N	number of spaces
" Ns	number of spaces * shiftwidth
" >N	default indent
" eN	extra indent if the { is at the end of a line
" nN	extra indent if there is no {} block
" fN	indent of the { of a function block
" gN  indent of the C++ class scope declarations (public, private, protected)
" {N	indent of a { on a new line after an if,while,for...
" }N	indent of a } in reference to a {
" ^N	extra indent inside a function {}
" :N	indent of case labels
" =N	indent of case body
" lN	align case {} on the case line
" tN	indent of function return type
" +N	indent continued algibreic expressions
" cN	indent of comment line after /*
" )N	vim searches for closing )'s at most N lines away
" *N	vim searches for closing */ at most N lines away
setlocal cinoptions=:0l1t0g0
"setlocal cinoptions=>1s,e0,n0,f0,{0,}0,^0,:0,=2s,l1,g2s,h2s,p2s,t0,+1s,c1s,C0,/0,(0,u0,U0,w1,m1,j1,)20,*30
setlocal tabstop=8
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cOperator likely unlikely
set omnifunc=ccomplete#Complete
"set laststatus=2
set number
set list listchars=tab:\ \ ,trail:·
"set path+=
