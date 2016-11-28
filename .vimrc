inoremap <tab> <C-n>
"设置非兼容模式
set nocompatible
set nocp
"防止mac中delete键失效 0 :set backspace= (Vi compatible);1“:set backspace=indent,eol”; 2 :set backspace=indent,eol,start
set backspace=2

"使用鼠标，不建议使用
"set mouse=a

"设置光标所在行
:set cursorline 
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

"背景主题相关
let g:solarized_termcolors=256
set background=dark
colorscheme darkplus 
"粘贴相关,设置全局粘贴模式, visual模式修改缩进时不退出该模式,
vnoremap < <gv
vnoremap > >gv
set pastetoggle=<F2>
vmap <leader>c :w !pbcopy<CR><CR>
nmap <leader>v :r !pbpaste<CR><CR>

"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是; 显示行号,开启光标下划线
set showtabline=1
set laststatus=2
set number
"set cursorline

set comments=sl:/*,mb:*,ex:*/

"#########快捷键设置###################
" 重新载入配置
map <leader>b :source ~/.vimrc<CR>

"关闭窗口, writeall
map <leader>w :w<CR>
map <leader>s :wall<CR>
map <leader>q :qall<CR>
map <leader>e :wqall<CR>

" 运行nodejs
map <leader>r :!node --harmony %<CR>

"映射Ctrl+F12键为行号的开关
map <leader>d :set number!<CR>

nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" 设置syntastic_checkers
"let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_exec = 'tidy'
let g:CSSLint_FileTypeList = ['css', 'less', 'sess']

" NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_open_on_console_startup = 1
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>t <plug>NERDTreeTabsFind<CR>
map <Leader>f <plug>NERDTreeFocusToggle<CR>

"imstart set default keylayout
let g:smartim_default = 'com.apple.keylayout.US'

"初始化pathogen插件
let pathogen = $HOME . '/.vim/bundle/vim-pathogen/autoload/pathogen.vim'
execute "source " . pathogen
call pathogen#infect()

nnoremap <leader>u :call BundlesInit()<CR>
"初始化所有插件
function! BundlesInit()
    let bundles = {
            \'vim-pathogen' : 'github.com/tpope/vim-pathogen.git',
            \'nerdtree' : 'github.com/scrooloose/nerdtree.git',
            \'snipmate.vim' : 'github.com/dzyhenry/snipmate.vim.git',
            \'syntastic' : 'github.com/scrooloose/syntastic.git',
            \'vim-fugitive' : 'github.com/tpope/vim-fugitive.git',
            \'indentLine' : 'github.com/Yggdroot/indentLine.git',
            \'vim-powerline' : 'github.com/Lokaltog/powerline.git',
            \'vim-nerdtree-tabs' : 'github.com/jistr/vim-nerdtree-tabs.git',
            \'vim-javascript-syntax': 'github.com/jelera/vim-javascript-syntax.git',
            \'vim-instant-markdown': 'github.com/suan/vim-instant-markdown.git',
            \'commentary' : 'github.com/tpope/vim-commentary.git',
            \'smartim' : 'github.com/ybian/smartim.git'
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
