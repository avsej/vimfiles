" Vim syntax file
" Language:	Scheme (R5RS)
" Last Change:	2007 Jun 16
" Maintainer:	Sergey Khorev <sergey.khorev@gmail.com>
" Original author:	Dirk van Deun <dirk@igwe.vub.ac.be>

" Modifier:	yamada <yamada-remove-this-part@tir.jp>
"		( http://e.tir.jp/wiliki?vim:scheme.vim )
" $Id$

" This script incorrectly recognizes some junk input as numerals:
" parsing the complete system of Scheme numerals using the pattern
" language is practically impossible: I did a lax approximation.

" MzScheme extensions can be activated with setting is_mzscheme variable
" Gauche extensions can be activated with setting is_gauche variable

" Initializing:

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" this defines first for nested srfi-62 comment
" ( http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/syntax.html#:syn-priority )
syn region schemeSrfi62CommentParen start="(" end=")" contains=schemeSrfi62CommentParen transparent
syn region schemeSrfi62CommentParen start="\[" end="\]" contains=schemeSrfi62CommentParen transparent

" Quoted and backquoted stuff

syn region schemeQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

" Popular Scheme extension:
" using [] as well as ()
syn region schemeQuoted matchgroup=Delimiter start="['`]\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeQuoted matchgroup=Delimiter start="['`]#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

syn region schemeUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL

syn region schemeUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

" R5RS Scheme Functions and Syntax:

if version < 600
  set iskeyword=33,35-38,42,43,45-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-38,42,43,45-58,60-90,94,95,97-122,126,_
endif

set lispwords=
set lispwords+=lambda,and,or,if,cond,case,define,let,let*,letrec
set lispwords+=begin,do,delay,set!,else,=>
set lispwords+=quote,quasiquote,unquote,unquote-splicing
set lispwords+=define-syntax,let-syntax,letrec-syntax,syntax-rules
syn keyword schemeSyntax lambda and or if cond case define let let* letrec
syn keyword schemeSyntax begin do delay set! else =>
syn keyword schemeSyntax quote quasiquote unquote unquote-splicing
syn keyword schemeSyntax define-syntax let-syntax letrec-syntax syntax-rules

" ... so that a single + or -, inside a quoted context, would not be
" interpreted as a number (outside such contexts, it's a schemeFunc)

syn match	schemeDelimiter	    !\.[ \t\[\]()";]!me=e-1
syn match	schemeDelimiter	    !\.$!
" ... and a single dot is not a number but a delimiter

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:

syn match	schemeOther	    ,[a-z!$%&*/:<=>?^_~+@%-][-a-z!$%&*/:<=>?^_~0-9+.@%]*,
syn match	schemeError	    ,[a-z!$%&*/:<=>?^_~+@%-][-a-z!$%&*/:<=>?^_~0-9+.@%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	schemeOther	    "\.\.\."
syn match	schemeError	    !\.\.\.[^ \t\[\]()";]\+!
" ... a special identifier

syn match	schemeConstant	    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[ \t\[\]()";],me=e-1
syn match	schemeConstant	    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*$,
syn match	schemeError	    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	schemeConstant	    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match	schemeConstant	    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match	schemeError	    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" Non-quoted lists, and strings:

syn region schemeStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL

syn region schemeStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" Simple literals:
syn region schemeString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+ fold

syn match	schemeFunc	   "(\@<=[a-zA-Z0-9!$%&*+,/:<=>?@^_~|-]\+"

" Comments:

syn match	schemeSrfi62Comment	    ,#;[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	schemeError		    ,#;[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,
syn match	schemeSrfi62Comment	    ,#;['`][a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	schemeError		    ,#;['`][a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,
syn region schemeSrfi62Comment matchgroup=Comment start="#;(" matchgroup=Comment end=")" contains=schemeSrfi62CommentParen
syn region schemeSrfi62Comment matchgroup=Comment start="#;\[" matchgroup=Comment end="\]" contains=schemeSrfi62CommentParen
syn region schemeSrfi62Comment matchgroup=Comment start="#;['`](" matchgroup=Comment end=")" contains=schemeSrfi62CommentParen
syn region schemeSrfi62Comment matchgroup=Comment start="#;['`]\[" matchgroup=Comment end="\]" contains=schemeSrfi62CommentParen
syn match	schemeComment	";.*$"

" Writing out the complete description of Scheme numerals without
" using variables is a day's work for a trained secretary...

syn match	schemeOther	    ![+-][ \t\[\]()";]!me=e-1
syn match	schemeOther	    ![+-]$!
"
" This is a useful lax approximation:
syn match	schemeNumber	    "[-+]\?[0-9.][-#+/0-9a-f@i.boxesfdl]*"
syn match	schemeNumber	    "#[-#+/0-9a-f@i.boxesfdl]+"
syn match	schemeNumber	    "[-+]inf\.0"
syn match	schemeNumber	    "+nan\.0"

syn match	schemeBoolean	    "#[tf]"
syn match	schemeError	    !#[tf][^ \t\[\]()";]\+!

syn match	schemeChar	    "#\\"
syn match	schemeChar	    "#\\."
syn match	schemeError	    !#\\.[^ \t\[\]()";]\+!
syn match	schemeChar	    "#\\space"
syn match	schemeError	    !#\\space[^ \t\[\]()";]\+!
syn match	schemeChar	    "#\\newline"
syn match	schemeError	    !#\\newline[^ \t\[\]()";]\+!


" meddlesome
set ts=8 sts=2 sw=2 et nocindent lisp


" Synchronization and the wrapping up...
syn sync fromstart

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scheme_syntax_inits")
  if version < 508
    let did_scheme_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink schemeSyntax		Statement
  HiLink schemeFunc		    Function

  HiLink schemeString		String
  HiLink schemeChar		    Character
  HiLink schemeNumber		Number
  HiLink schemeBoolean		Boolean

  HiLink schemeDelimiter	Delimiter
  HiLink schemeConstant		Constant

  HiLink schemeComment		    Comment
  HiLink schemeMultilineComment	Comment
  HiLink schemeError		    Error

  HiLink schemeExtSyntax	    Type
  HiLink schemeExtFunc		    PreProc

  HiLink schemeRegexp		    schemeString
  HiLink schemeSrfi62Comment	schemeComment
  HiLink schemeSharpBang	    Special
  HiLink schemeInclude		    Include
  HiLink schemeInterpolation	Debug

  delcommand HiLink
endif

let b:current_syntax = "scheme"
