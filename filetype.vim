runtime! ftdetect/*.vim

autocmd BufNewFile,BufRead *.less setf less
autocmd BufNewFile,BufRead *.fbml.erb setf eruby
autocmd BufNewFile,BufRead *.json setf json
autocmd BufNewFile,BufRead *.(rdf|xml) setf xml
autocmd BufNewFile,BufRead *.prawn setf ruby
autocmd BufNewFile,BufRead *.ru setf rack
autocmd BufNewFile,BufRead /opt/nginx/conf/* setf nginx
autocmd BufNewFile,BufRead *.as68 setf asm68k
autocmd BufNewFile,BufRead *.feature,*.story setf cucumber
autocmd BufNewFile,BufRead *.m setf octave
autocmd BufNewFile,BufRead *muttatorrc*,*.muttator setf muttator
autocmd BufNewFile,BufRead *.mustache setf mustache
