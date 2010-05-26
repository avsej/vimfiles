augroup markdown
	au! BufRead,BufNewFile *.mkd   setfiletype mkd
	au! BufRead,BufNewFile *.text   setfiletype mkd
augroup END

augroup mkd
	autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:> wrap
	autocmd BufRead *.text  set ai formatoptions=tcroqn2 comments=n:> wrap
augroup END
