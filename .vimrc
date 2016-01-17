"设置mapleader
let mapleader="'"
"搜索时高亮显示结果
set hls
"输入搜索命令时，显示目前输入的模式的匹配位置
set is
"显示行号
set number
"开启光标下划线
set cursorline
"文件默认编码
set encoding=utf-8
"打开文件进行解码的猜测列表，优先以utf-8打开
set fileencodings=utf-8,gbk
"文件默认格式unix
set ff=unix
"缩进为4个空格宽度
set tabstop=4
"自动缩进使用的空格数
set shiftwidth=4
"编辑插入tab时，把tab算作的空格数
set softtabstop=4
"缩进使用空格
set expandtab
"自动缩进
set autoindent
"打开语法高亮
syntax on
"背景
let g:solarized_termcolors=256
set background=dark
"主题
colorscheme darkplus 
"设置字典
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
"设置全局粘贴模式
set paste

"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=1
set laststatus=2

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

" visual模式修改缩进时不退出该模式
vnoremap < <gv
vnoremap > >gv

nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

"设置全局复制和全局粘贴
vmap <leader>c :w !pbcopy<CR><CR>
nmap <leader>v :r !pbpaste<CR><CR>

" 设置syntastic_checkers
"let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_exec = 'tidy'
let g:CSSLint_FileTypeList = ['css', 'less', 'sess']

" NERDTreeTabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

nnoremap <leader>u :call BundlesInit()<CR>
"初始化pathogen插件
let pathogen = $HOME . '/.vim/bundle/vim-pathogen/autoload/pathogen.vim'
execute "source " . pathogen
call pathogen#infect()

"初始化所有插件
function! BundlesInit()
    let bundles = {
            \'vim-pathogen' : 'github.com/tpope/vim-pathogen.git',
            \'nerdtree' : 'github.com/scrooloose/nerdtree.git',
            \'snipmate.vim' : 'github.com/msanders/snipmate.vim.git',
            \'emmet-vim' : 'github.com/mattn/emmet-vim.git',
            \'syntastic' : 'github.com/scrooloose/syntastic.git',
            \'vim-fugitive' : 'github.com/tpope/vim-fugitive.git',
            \'vim-powerline' : 'github.com/Lokaltog/powerline.git',
            \'vim-nerdtree-tabs' : 'github.com/jistr/vim-nerdtree-tabs.git',
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
