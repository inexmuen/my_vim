set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'moll/vim-bbye'

call vundle#end()
filetype plugin indent on
syntax enable
set number
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8



" nerdtree设置
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
" let NERDTreeAutoCenter=1
" 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
" let NERDTreeMouseMode=2
" 是否默认显示书签列表
" let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示隐藏文件
" let NERDTreeShowHidden=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=1
" 窗口位置（'left' or 'right'）
" let NERDTreeWinPos='left'
" 窗口宽
let NERDTreeWinSize=31

" taglist设置
let Tlist_Show_One_File=1 " 0为同时显示多个文件函数列表,1则只显示当前文件函数列表
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1 " 非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "如果taglist是最后一个窗口，则退出vim 
let Tlist_Auto_Update=1            "Automatically update the taglist to include newly edited files.
"把taglist窗口放在屏幕的右侧，缺省在左侧
"let Tlist_Use_Right_Window=1 
"显示taglist菜单
"let Tlist_Show_Menu=1
"启动vim自动打开taglist
"let Tlist_Auto_Open=1
" ctags, 指定tags文件的位置,让vim自动在当前或者上层文件夹中寻找tags文件
set tags=tags
" 添加系统调用路径
set tags+=/usr/include/tags
"键绑定，刷新tags
nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:set tags+=./tags<CR>

" Cscope 设置
if has("cscope")
    set csprg=/usr/bin/cscope   "指定用来执行cscope的命令
    set csto=0                  " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库"
    set cst                     " 同时搜索cscope数据库和标签文件"
    set cscopequickfix=s-,c-,d-,i-,t-,e-    " 使用QuickFix窗口来显示cscope查找结果"
    set nocsverb
    if filereadable("cscope.out")    " 若当前目录下存在cscope数据库，添加该数据库到vim
        cs add cscope.out
    elseif $CSCOPE_DB != ""            " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif
map <F4>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
"对:cs find c等Cscope查找命令进行映射
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
" 设定是否使用 quickfix 窗口来显示 cscope 结果
set cscopequickfix=s-,c-,d-,i-,t-,e-

" WinManager设置
" NERD_Tree集成到WinManager
let g:NERDTree_title="[NERDTree]" 
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
 
function! NERDTree_IsValid()
    return 1
endfunction
 
" 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语句
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
" 设置winmanager的宽度，默认为25
let g:winManagerWidth=30 
" 窗口布局
let g:winManagerWindowLayout='NERDTree|TagList'
" 如果所有编辑文件都关闭了，退出vim
let g:persistentBehaviour=0

" airline设置
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" Bbye设置
" 由于原生的:bd在删除当前buffer时会将整个窗口关闭，故使用Bbye的:Bd
nnoremap bd :Bd<CR>
