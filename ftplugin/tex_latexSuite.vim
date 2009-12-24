" LaTeX filetype
"	  Language: LaTeX (ft=tex)
"	Maintainer: Srinath Avadhanula
"	 Email: srinath@fastmail.fm

if exists('did_latexSuite_disabled')
  finish
endif

if !exists('s:initLatexSuite')
	let s:initLatexSuite = 1
	exec 'so '.fnameescape(expand('<sfile>:p:h').'/latex-suite/main.vim')

	silent! do LatexSuite User LatexSuiteInitPost
endif

silent! do LatexSuite User LatexSuiteFileType
set expandtab
set tabstop=2
set shiftwidth=2
set formatoptions+=t
