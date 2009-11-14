augroup markdown
	au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END

augroup mkd
	autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END
