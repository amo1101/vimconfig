" =======================
" vimrc配置
" =======================
" -----------------------
" => 基本
" -----------------------
" 显示行号
set nu
" 高亮关键字
syntax on
" 使用鼠标
set mouse=a
if has('mouse')
    set mouse-=a
endif
" 搜索结果高亮显示
set hlsearch
" 一个tab等于4个空格
set tabstop=4
set shiftwidth=4
" 表示Tab自动转换成空格
set expandtab
" 智能对齐
set autoindent
set smartindent
" 解决删除键不生效
set backspace=indent,eol,start
" 行尾结束符, 设置为unix
set fileformat=unix
set encoding=utf-8
" 文件编码
" fenc=utf-8
" 配置粘贴不自动换行的快捷键
set pastetoggle=
" 允许折叠
set foldenable
" 手动折叠
set foldmethod=manual
" 自动保存
set autowrite
" 记录历史的行数
set history=10000
" 设置搜索时忽略大小写
set ignorecase
" 高亮显示光标所在的行和列
" 显示颜色
set t_Co=256
set bg=dark
"set cursorline
"set cursorcolumn
" 自定义光标样式
highlight CursorLine cterm=NONE ctermbg=black ctermfg=brown guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=brown guibg=NONE guifg=NONE
" 显示tab和空格
"set list
" 设置tab和空格样式
set listchars=tab:\|\ ,nbsp:%,trail:·
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首
tab match LeaderTab /^\t/
" 输入的命令显示出来
set showcmd
" 启动显示状态行(1),总是显示状态行(2)
set laststatus=2
" leader设置
let mapleader = ","

" ctags设置
set tags=tags;
set autochdir

"cscope设置
if has("cscope")
    set csprg=/usr/bin/cscope
    set cscoperelative
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
    endif
set csverb
endif

" -----------------------
" => 安装插件
" => Setup vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" => Install: :PluginInstall
" -----------------------
" 关闭vi兼容模式
set nocompatible
" 关闭文件类型检测
filetype off
" 运行时路径, 插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 插件管理器 
Plugin 'VundleVim/Vundle.vim'

" -----------------------
" => github 仓库中的插件
" -----------------------
" 底栏和顶栏
Plugin 'vim-airline/vim-airline'
" 侧边栏显示git修改
Plugin 'airblade/vim-gitgutter'
" 目录树显示文件的git修改
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" commenter
Plugin 'scrooloose/nerdcommenter'
" -----------------------
" => vim-scripts 中的插件
" -----------------------
" 显示文件中所有的函数和变量
Plugin 'Tagbar'
" 目录树
Plugin 'The-NERD-tree'
" 显示tab对齐线
Plugin 'indentLine.vim'
" 符号自动补全
Plugin 'delimitMate.vim'
" 标签提取
Plugin 'ctags.vim'
" 颜色主题
Plugin 'desert.vim'
" 显示Python的虚拟环境
Plugin 'virtualenv.vim'
" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'lervag/vimtex'
" for python
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'


call vundle#end()
filetype plugin indent on

" -----------------------
" => 插件安装完成后的配置
" -----------------------
" -----------------------
" ==> airline 标签栏配置
" -----------------------
" 启用powerline字体
" let g:airline_powerline_fonts = 1
" 开启标签栏
let g:airline#extensions#tabline#enabled = 1
" let g:airline_section_b = '%{strftime("%c")}'
" 标签栏路径显示
let g:airline#extensions#tabline#formatter = "default"
" let g:airline#extensions#tabline#formatter = "jsformatter"
" let g:airline#extensions#tabline#formatter = "unique_tail_improved"
" let g:airline#extensions#tabline#formatter = "unique_tail"

" -----------------------
" ==> Tagbar配置
" -----------------------
" 函数变量窗口, F3开启和关闭
nmap <F3> :TagbarToggle<CR>
"let tagbar_ctags_bin = '~/usr/local/bin/ctags-exuberant'
let tagbar_right = 1
let g:tagbar_width = 30
" tagbar一打开, 光标就在tagbar页面内
let g:tagbar_autofocus = 1
" 设置标签不排序，默认排序
let g:tagbar_sort = 0

" -----------------------
" ==> The-NERD-tree配置
" -----------------------
" 目录树, 使用F2开启或关闭
nmap <F2> :NERDTreeToggle<CR>
nnoremap <c-\> <c-w>w
let NERDTreeWinSize=30
" 自动开启
" autocmd vimenter * NERDTree
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" -----------------------
" ==> NerdCommenter
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断
" <leader>cy   先复制, 再注解(p可以进行黏贴)
" -----------------------
let g:NERDSpaceDelims=1

" -----------------------
" ==> utlisnips
" -----------------------
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops

" -----------------------
" ==> vimtex
" -----------------------
let g:vimtex_view_method = 'zathura'
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_compiler_latexmk = {
        \ 'aux_dir' : 'build',
        \ 'out_dir' : 'build',
        \ 'continuous' : 1,
        \}
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif


" -----------------------
" ==> python IDE 
" -----------------------
let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1

au Filetype python set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

let python_highlight_all=1
syntax on

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
