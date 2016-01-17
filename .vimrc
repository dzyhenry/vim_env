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
