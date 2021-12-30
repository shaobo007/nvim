"
"__  __               _
"|  \/  |_   _  __   _(_)_ __ ___  _ __ ___
"| |\/| | | | | \ \ / / | '_ ` _ \| '__/ __|
"| |  | | |_| |  \ V /| | | | | | | | | (__
"|_|  |_|\__, |   \_/ |_|_| |_| |_|_|  \___|
"|___/

if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let mapleader=" " "使leader键为空格
set t_Co=256
syntax enable
syntax on
set number
set cursorline
set wrap
set linebreak
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set showcmd
set hlsearch
set incsearch
set relativenumber
set ignorecase
set smartcase
exec "nohlsearch"

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
"set tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=8
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set updatetime=100
set colorcolumn=100
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.config/nvim/tmp/undo,.
endif

"searching
noremap = nzz
noremap - Nzz

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map s <nop>
map J <nop>
map S :w<CR>
map R :source $MYVIMRC<CR>
map Q :q<CR>

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"分屏操作"
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
"分屏之间切换
noremap <LEADER>l <C-w>l
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>q <C-w>o  "关闭所有分屏
"调整分屏大小
noremap <LEADER><up> :res +4<CR>
noremap <LEADER><down> :res -4<CR>
noremap <LEADER><left> :vertical resize-4<CR>
noremap <LEADER><right> :vertical resize+4<CR>

"标签页"
map tn :tabe<CR>
map th :-tabnext<CR>  "标签页切换
map tl :+tabnext<CR>
map tmh :-tabmove<CR>  "移动标签页
map tml :+tabmove<CR>

"faster line navigation"
"word
noremap W 5w
noremap B 5b
"lines
noremap J 5j
noremap K 5k

" Copy to system clipboard
vnoremap Y "+y
noremap P "+gp
inoremap <silent><C-v> <Esc>"+gpa

"figlet"
noremap tx :r !figlet

"turnoff highlight"
noremap <silent><LEADER><CR> :nohlsearch<CR>

"open a terminal windownoremap <LEADER>/ :set splitbelow<CR>:sp<CR>:res -6:<CR>term<CR>
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:res -5<CR>:term<CR>i

"edit config file anywhere
noremap <LEADER>e :tabe<CR>:e ~/.config/nvim/init.vim<CR>
noremap <LEADER>ra :tabe<CR>:e ~/.config/ranger/rc.conf<CR>
noremap <LEADER>rc :tabe<CR>:e ~/.config/fish/config.fish<CR>

" Press space twice to jump to the next '<+++>' and edit it
noremap <LEADER>z <Esc>/<+++><CR>:nohlsearch<CR>c5l

" Spelling Check with <space>sc
map <LEADER>ss :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
map ` ~

" quit compile
noremap <LEADER>b :q<CR>:q<CR>
"居中
imap <C-c> <Esc>zza
nmap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" find and replace
noremap \s :%s//g<left><left>

"安装插件"
call plug#begin('~/.config/nvim/plugged')
"vim主题插件"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'connorholyday/vim-snazzy'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'
"Plug 'bling/vim-bufferline'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Error checking
Plug 'vim-autoformat/vim-autoformat'

"Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'

" Git
Plug 'rhysd/conflict-marker.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'

" HTML, CSS, JavaScript, PHP, JSON, etc.
"Plug 'elzr/vim-json'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
"Plug 'mattn/emmet-vim'

" Python
"Plug 'vim-scripts/indentpython.vim'
Plug 'honza/vim-snippets'
"Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Debugger
Plug 'puremourning/vimspector' 
Plug 'szw/vim-maximizer'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
"Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

"Other useful plug
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/vim-peekaboo'

" Other visual enhancement
Plug 'luochen1990/rainbow'
"Plug 'mg979/vim-xtabline'
"Plug 'ryanoasis/vim-devicons'  "nerdtree文件类型图标
Plug 'wincent/terminus'

" Vim Applications
"Plug 'itchyny/calendar.vim'

"other util
Plug 'makerj/vim-pdf'
Plug 'liuchengxu/vista.vim'
"Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
"Plug 'kshenoy/vim-signature'
Plug 'MattesGroeger/vim-bookmarks'

call plug#end()

"设置主题"
"let g:SnazzyTransparent = 1
set background=dark
colorscheme snazzy
"colorscheme molokai
"colorscheme dracula
"colorscheme PaperColor
"colorscheme deus
"colorscheme gruvbox
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0


" ==
" == python-format
" ==
let g:formatter_yapf_style = 'google'
noremap \f :Autoformat<CR>
autocmd FileType vim,tex,markdown let b:autoformat_autoindent=0


" ===
" === COC
" ===
let g:coc_global_extensions = [
  \ 'coc-vimlsp',
  \ 'coc-marketplace',
  \ 'coc-json',
  \ 'coc-explorer',
  \ 'coc-clangd',
  \ 'coc-jedi',
  \ 'coc-pydocstring',
	\ 'coc-diagnostic',
	\ 'coc-gitignore',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-snippets',
  \ 'coc-pairs',
	\ 'coc-translator']
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <C-o> coc#refresh()
"jump to the next or previous error
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" coc-translator
nmap <silent><LEADER>t <Plug>(coc-translator-p)

" Use <leader>d to show documentation in preview window.
nnoremap <silent> <LEADER>sd :call <SID>show_documentation()<CR>

function! s:show_documentation()
 if (index(['vim','help'], &filetype) >= 0)
   execute 'h '.expand('<cword>')
 elseif (coc#rpc#ready())
   call CocActionAsync('doHover')
 else
   execute '!' . &keywordprg . " " . expand('<cword>')
 endif
endfunction
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
"xmap <leader>fs  <Plug>(coc-format-selected)
"nmap <leader>fs  <Plug>(coc-format-selected)
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-w>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'Shaobo Zhang'
nmap <silent>tt :CocCommand explorer<CR>

nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)

" ===
" === Vista.vim
" ===
noremap <silent><LEADER>v :Vista!!<CR>
"noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === Rainbow
" ===
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


" ==
" == GitGutter
" ==
"let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

"===
"=== MarkdownPreview
"===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
  \ 'mkit': {},
  \ 'katex': {},
  \ 'uml': {},
  \ 'maid': {},
  \ 'disable_sync_scroll': 0,
  \ 'sync_scroll_type': 'middle',
  \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

source ~/.config/nvim/md-snips.vim
autocmd BufRead,BufNewFile *.md setlocal spell
" ===
" === Python-syntax
" ===
"let g:python_highlight_all = 1


" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ===
" === FZF
" ===
let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.85 } }
noremap <silent><LEADER>f  :Files<CR>
noremap <silent><LEADER>F :History<CR>


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1


" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
"let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
"let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
"let g:VM_maps['i']                  = 'k'
"let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
"let g:VM_maps['Find Next']          = ''
"let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
"let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>


" ===
" === Vimspector
" ===
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
" Set the basic sizes
let g:vimspector_sidebar_width = 50
let g:vimspector_code_minwidth = 85
let g:vimspector_terminal_minwidth = 40
"nnoremap <Leader>dl :call vimspector#Launch()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
"nnoremap <Leader>dc :call vimspector#Continue()<CR>

"nnoremap <Leader>b :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dc :call vimspector#ClearBreakpoints()<CR>

"nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver


" ===
" === Maximizer
" ===
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>


" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappings = 1
nmap mm <Plug>BookmarkToggle
nmap mi <Plug>BookmarkAnnotate
nmap ma <Plug>BookmarkShowAll
nmap mh <Plug>BookmarkNext
nmap ml <Plug>BookmarkPrev
nmap mC <Plug>BookmarkClear
nmap mX <Plug>BookmarkClearAll
nmap mk <Plug>BookmarkMoveUp
nmap mj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1


" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent><C-t> :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 0.8, 'height': 0.8}]


" ===
" === Terminal Colors
" ===
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" Compile function,press <F5> to run code
" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :res -4
    :term python %
    set splitright
    :vsplit
    :term watch -n 1 nvidia-smi
  elseif &filetype == 'html'
    exec "!chrome % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc
