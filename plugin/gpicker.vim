"    Copyright: This program is free software: you can redistribute it and/or 
"               modify it under the terms of the GNU General Public License as
"               published by the Free Software Foundation; either version 3 of the
"               License, or (at your option) any later version.
"
"               This program is distributed in the hope that it will be useful,
"               but WITHOUT ANY WARRANTY; without even the implied warranty of
"               MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
"               General Public License for more details.
"
"               You should have received a copy of the GNU General Public License
"               along with this program.  If not, see
"               `http://www.gnu.org/licenses/'.
"
" Name Of File: gpicker.vim
"  Description: Bindings for gpicker, fast file chooser.
"  Maintainers: Sergey Avseyev <sergey.avseyev@gmail.com>
" Contributors:
"
" Release Date: October 20, 2009
"      Version: 0.1
"     Keywords: autocompletion
"
"      Install: Copy file into ~/.vim/plugin directory or put in .vimrc
"
"                 source /path/to/this/script/gpicker.vim
"
"        Usage: To launch the gpicker:
"
"                 <Leader>lg - Opens the gpicker from current directory.
"                 <Leader>m  - Opens the gpicker to chose from list of current
"                 buffers.
"
"               You can also use the command:
"
"                 ":GPickFile"
"                 ":GPickFile"
"

" Exit quickly when already loaded.
if exists("g:loaded_gpicker")
  finish
endif

command GPickFile :call <SID>GPickFile()
function! s:GPickFile()
  let filename = system('gpicker -t guess .')
  if filereadable(filename)
    execute "edit " . filename
  endif
endfunction

command GPickBuffer :call <SID>GPickBuffer()
function! s:GPickBuffer()
  redir => ls_output
  silent execute 'ls'
  redir END

  let items = strpart(substitute(ls_output, '"\(.\{-}\)"\s\{-}line\s\+\d\+', '\1', 'g'), 1)
  let selected  = system('gpicker --name-separator \\n -', items)
  let g:sel = selected
  let g:result = substitute(selected, '\d\+\s\+[u%#ah=+x-]\+\s+', '', '')
  execute "buffer " . substitute(selected, '\d\+\s\+[u%#ah=+x-]\+\s\+', '', '')
endfunction

nmap <silent> <leader>lg :GPickFile<cr>
nmap <silent> <leader>m :GPickBuffer<cr>

" vim:sw=2:sts=2:et:
