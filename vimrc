set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'wincent/command-t'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-ruby/vim-ruby'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/VimIM'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'gilligan/vim-lldb'
" 全局配置文件
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"Plugin 'jeaye/color_coded'

"Plugin 'Shougo/vimproc.vim'
"Plugin 'lyuts/vim-rtags'
"Plugin 'elzr/vim-json'
"Plugin 'Shougo/vimshell.vim'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'rust-lang/rust.vim'
"Plugin 'dag/vim2hs'




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
"set background=light
"colorscheme solarized
colorscheme molokai
"set background = dark

"set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular:h14
if has("gui_running")
    set transparency=20
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Inziu\ Iosevka\ SC:h16
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


syn on                      "语法支持

"common conf {{             通用配置
set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
set shiftwidth=2
set tabstop=2
set cursorline              "为光标所在行加下划线
set number                  "显示行号
set relativenumber          "相对行号
set autoread                "文件在Vim之外修改过，自动重新读入
"
set ignorecase              "检索时忽略大小写
set encoding=utf-8
set fileencodings=utf-8,gbk "使用utf-8或gbk打开文件
set hls                     "检索时高亮显示匹配项
set helplang=cn             "帮助系统设置为中文
set autochdir               "自动切换当前目录
"set clipboard=unnamed
"set foldmethod=syntax       "代码折叠
""}}

"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>
"
"
""}}

"Airline 配置
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_powerline_fonts = 1
"let g:airline_theme=molokai

"vim-powerline配置
set laststatus=2
let g:Powerline_symbols='unicode'

"" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
""上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞

nmap <F8> :TagbarToggle<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR> " 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
let g:ycm_key_invoke_completion = '<C-j>'
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;



let g:syntastic_error_symbol = '✗'	"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_enable_balloons = 1	"whether to show balloons
let g:ycm_python_binary_path = '/usr/bin/python3'


"打开自动监测
let g:fencview_autodetect = 1
set mouse=a

"let g:rustfmt_autosave = 1

let g:vimim_plugin=0
let g:vimim_punctuation=2
let g:vimim_toggle='zhengma'
let g:vimim_cloud=-1
"if $TMUX == ''
"    set clipboard+=unnamed
"endif
let g:ycm_rust_src_path = '/Users/yangzj/tmp/rustc-1.13.0/src'
autocmd FileType py set shiftwidth=4 | set expandtab
