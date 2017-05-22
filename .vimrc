inoremap <tab> <C-n>
"设置非兼容模式
set nocompatible
set nocp
"防止mac中delete键失效 0 :set backspace= (Vi compatible);1“:set backspace=indent,eol”; 2 :set backspace=indent,eol,start
set backspace=2

"使用鼠标，不建议使用
"set mouse=a
"设置光标所在行
":set cursorline 
" dark redish
:hi CursorLine   cterm=NONE ctermbg=52 ctermfg=NONE

"设置mapleader
let mapleader="'"
"搜索相关
set hls
set is
"文件格式相关
set encoding=utf-8
set fileencodings=utf-8,gbk
set ff=unix
"缩进相关
set autoindent
set shiftwidth=2
set expandtab 
set tabstop=2
set softtabstop=2
"打开语法高亮
syntax on
filetype on
filetype plugin on
au BufNewFile,BufRead *.ftl set filetype=html
"代码折叠
set foldenable
set foldmethod=indent
set foldcolumn=0
setlocal foldlevel=1 
set foldlevelstart=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"background
let g:solarized_termcolors=256
set background=dark
colorscheme darkplus 
"cut & paste
vnoremap < <gv
vnoremap > >gv
set pastetoggle=<F2>
vmap <leader>c :w !pbcopy<CR><CR>
nmap <leader>v :r !pbpaste<CR><CR>

"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是; 显示行号,开启光标下划线
set showtabline=1
set laststatus=2
set number

"为文件添加默认的后缀，可以方便地使用`gf`命令进行文件跳转
set suffixesadd=.js
set path+=$PWD/src/**
set path+=$PWD/**

set comments=sl:/*,mb:*,ex:*/

"#########快捷键设置###################
" 重新载入配置
map <leader>b :source ~/.vimrc<CR>

"writeall
map <leader>s :wall<CR>
map <leader>e :wqall<CR>

" 运行nodejs
map <leader>r :!node %<CR>

"映射Ctrl+F12键为行号的开关
map <leader>d :set number!<CR>

nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"###################插件管理###################################################

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" airline setting
let g:airline#extensions#tabline#enabled = 1

" 设置ale syntax checker
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_open_on_console_startup = 1
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>t <plug>NERDTreeTabsFind<CR>
map <Leader>f <plug>NERDTreeFocusToggle<CR>

nnoremap <leader>u :call BundlesInit()<CR>
"初始化pathogen插件
let pathogen = $HOME . '/.vim/bundle/vim-pathogen/autoload/pathogen.vim'
execute "source " . pathogen
call pathogen#infect()

"初始化所有插件
function! BundlesInit()
    let bundles = {
            \'vim-pathogen' : 'github.com/tpope/vim-pathogen.git',
            \'ale' : 'github.com/w0rp/ale.git',
            \'nerdtree' : 'github.com/scrooloose/nerdtree.git',
            \'nerdtree-git-plugin' : 'github.com/Xuyuanp/nerdtree-git-plugin.git',
            \'vim-fugitive' : 'github.com/tpope/vim-fugitive.git',
            \'indentLine' : 'github.com/Yggdroot/indentLine.git',
            \'vim-airline' : 'github.com/vim-airline/vim-airline.git',
            \'vim-nerdtree-tabs' : 'github.com/jistr/vim-nerdtree-tabs.git',
            \'vim-javascript-syntax': 'github.com/jelera/vim-javascript-syntax.git',
            \'vim-instant-markdown': 'github.com/suan/vim-instant-markdown.git',
            \'YouCompleteMe': 'github.com/Valloric/YouCompleteMe.git',
            \'ultisnips': 'github.com/SirVer/ultisnips.git',
            \'snipmate.vim': 'github.com/dzyhenry/snipmate.vim.git',
            \'commentary' : 'github.com/tpope/vim-commentary.git'
        \}
    let bundleDir = $HOME . '/.vim/bundle/'
    if !isdirectory(bundleDir)
        let output = mkdir(bundleDir)
    endif
    for key in keys(bundles)
        let dir = bundleDir . key
        if !isdirectory(dir)
            let cmd = 'git clone git://' . bundles[key] . ' ' . bundleDir . key
            echo 'fetching ' . key . '...'
            let output = system(cmd)
        endif
    endfor
    if exists(':Helptags')
        :Helptags
    endif
    echo 'all bundles are ready.'
endfunction
\'commentary' : 'github.com/tpope/vim-commentary.git&apos;
