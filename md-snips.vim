 "find <+++>
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<+++><CR>:nohlsearch<CR>"_c5l 
"autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <+++><CR>:nohlsearch<CR>"_c5l<CR>  
"分隔符
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
"bold
autocmd Filetype markdown inoremap <buffer> ,b **** <+++><Esc>F*hi

autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <+++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <+++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <+++><Esc>F`i

"代码块
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><+++><Enter>```<Enter><Enter><+++><Esc>4kA
"公式
autocmd Filetype markdown inoremap <buffer> ,e $$<+++><Esc>5hi
autocmd Filetype markdown inoremap <buffer> ,E <Enter>$$<Enter><Enter>$$<Enter><+++><Esc>2kA<Tab>

autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
autocmd Filetype markdown inoremap <buffer> ,p ![](<+++>) <+++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<+++>) <+++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><+++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><+++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><+++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><+++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>

