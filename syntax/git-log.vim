runtime syntax/git-diff.vim

syntax match gitLogCommit +^commit \x\{40}+

highlight link gitLogCommit Statement
