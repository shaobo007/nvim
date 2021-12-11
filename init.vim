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
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
set ttyfast "should make scrolling faster
set lazyredraw "same as above
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

" 括号自动补全"
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

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
" Indentation
"nnoremap < <<
"nnoremap > >>

"figlet"
noremap tx :r !figlet

"turnoff highlight"
noremap <LEADER><CR> :nohlsearch<CR>

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
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
"Plug 'bling/vim-bufferline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
" Taglist 显示函数列表"
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Error checking
"Plug 'w0rp/ale'
Plug 'vim-autoformat/vim-autoformat'
"Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'kdheepak/lazygit.nvim'
" HTML, CSS, JavaScript, PHP, JSON, etc.
"Plug 'elzr/vim-json'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
"Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
"Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
"Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'cjrh/vim-conda'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

"Other useful plug
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/vim-peekaboo'
Plug 'voldikss/vim-translator'

" Other visual enhancement
"Plug 'luochen1990/rainbow'
"Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'  "nerdtree文件类型图标
Plug 'wincent/terminus'

"other util
Plug 'makerj/vim-pdf'
Plug 'junegunn/goyo.vim'

call plug#end()

"设置主题"
let g:SnazzyTransparent = 1
colorscheme snazzy
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0

" ===
" === NERDTree
" ===
map <silent>tt :NERDTreeToggle<CR>
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == python-format
" ==
"let g:formatter_yapf_style = 'google'
"noremap <F3> :Autoformat<CR>
"autocmd FileType vim,tex,markdown let b:autoformat_autoindent=0

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ "Unknown"   : "?"
    \ }

" ===
" === COC
" ===
let g:coc_global_extensions = [
  \ 'coc-vimlsp',
  \ 'coc-marketplace',
  \ 'coc-json',
  \ 'coc-jedi',
	\ 'coc-diagnostic',
	\ 'coc-gitignore',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-snippets',
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
nmap ts <Plug>(coc-translator-p)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
 if (index(['vim','help'], &filetype) >= 0)
 ""execute 'h '.expand('<cword>')
 elseif (coc#rpc#ready())
 ""call CocActionAsync('doHover')
 else
 ""execute '!' . &keywordprg . " " . expand('<cword>')
 endif
endfunction
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)

" ===
" === Snippets
" ===
inoremap <c-e> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips', 'UltiSnips']

" ===
" === ale
" ===
"let g:airline#extensions#ale#enabled = 1
"let g:ale_linters_explicit = 1
"" Write this in your vimrc file
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_insert_leave = 1
"" if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0

" ===
" === MarkdownPreview
" ===
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
" === goyo
" ===
noremap <LEADER>gy :Goyo<CR>


" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


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
" === Tanslator
" ===
" Echo translation in the cmdline
"nmap <silent><Leader>t :Translate<CR>
"vmap <silent><Leader>t :TranslateV<CR>
"" Display translation in a window
"" Replace the text with translation
""nmap <silent><Leader>z :TranslateR<CR>
""vmap <silent><Leader>z :TranslateRV<CR>
"" Translate the text in clipboard
"nmap <silent><Leader>x :TranslateX<CR>

" Compile function,press <F5> to run code
" Compile function
map <F5> :call CompileRunGcc()<CR>
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
  :res -10
  :term python %
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc
set showcmd
