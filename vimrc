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
" ==> virtualenv.vim
" -----------------------
" 退出虚拟环境
" :VirtualEnvDeactivate
" 显示所有虚拟环境
" :VirtualEnvList
" 激活虚拟环境
" :VirtualEnvActivate venv
" 可以使用tab选择要激活的虚拟环境
" :VirtualEnvActivate <tab>
" 显示帮助
" :help virtualenv
"

" ----------------------------
" ==> plug manager for coc.vim and its configuration
" https://mp.weixin.qq.com/s/ehzMVGVS1PiVSt5CP-EqWA
" https://github.com/neoclide/coc.nvim
" to generate compile_commands.json for clangd => http://www.voidcc.com/project/bear
" set diagnostic.enable : false via CocConfig better UX when not compiled
" --------------------------
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" let g:coc_disable_startup_warning = 1
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
