" init {{{

"init
"コマンド	                 検出	  プラグイン	インデント
":filetype on	             有効	  変化なし	    変化なし
":filetype off	             無効	  変化なし	    変化なし
":filetype plugin on	     有効	  有効	        変化なし
":filetype plugin off	     変化なし 無効	        変化なし
":filetype indent on	     有効	  変化なし	    有効
":filetype indent off	     変化なし 変化なし	    無効
":filetype plugin indent on	 有効	  有効	        有効
":filetype plugin indent off 変化なし 無効	        無効

set nocompatible
autocmd!
filetype off
filetype plugin indent off

set runtimepath&
set path&

set path+=$SPIDER_HOME/include/
set path+=/usr/local/include/
set path+=./
set wildmenu wildmode=list:full

"}}}

" plugin management {{{

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/TagHighlight'
NeoBundle 'vim-scripts/trinity'
NeoBundle 'vim-scripts/SrcExpl'
NeoBundle 'vim-scripts/DirDiff.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite-build'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'kmnk/vim-unite-svn'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/jshint.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'sgur/vim-gf-autoload'
NeoBundle 'osyo-manga/unite-fold'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'zhaocai/unite-scriptnames'
NeoBundle 'basyura/unite-matchers'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/emmet-vim' "http://techblog.yahoo.co.jp/tips/_zencoding/
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'marijnh/tern_for_vim', {
            \ 'build': {
            \   'others': 'npm install'
            \}}
" }}}

" plugin config {{{

"neocomplcache設定
"http://vim-users.jp/2010/10/hack177/
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 4
 
"unitesetup
 "最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 1000
let g:unite_source_directory_mru_limit = 1000
let g:unite_source_grep_max_candidates = 1000
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
"インサートモードで開始
let g:unite_enable_start_insert = 0
let g:unite_source_history_yank_enable = 1
call unite#custom#source('file_mru', 'converters', ["converter_file_directory"])
" unite vimgrep ag
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '-S  --nocolor --nogroup'

" NERDCommenter設定
"let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
" call s:CreateMaps('nx', 'Comment',    'Comment', 'cc')
" call s:CreateMaps('nx', 'Toggle',     'Toggle', 'c<space>')
" call s:CreateMaps('nx', 'Minimal',    'Minimal', 'cm')
" call s:CreateMaps('nx', 'Nested',     'Nested', 'cn')
" call s:CreateMaps('n',  'ToEOL',      'To EOL', 'c$')
" call s:CreateMaps('nx', 'Invert',     'Invert', 'ci')
" call s:CreateMaps('nx', 'Sexy',       'Sexy', 'cs')

" syntastic設定
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ["javaScript", "json"] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']

"easymotion" Lokaltog/vim-easymotion
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key="\\"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget cterm=reverse ctermbg=none ctermfg=red
hi EasyMotionShade  cterm=reverse ctermbg=none ctermfg=blue

" VimShell
let g:vimshell_prompt = "% "
let g:vimshell_secondary_prompt = "> "
let g:vimshell_user_prompt = 'getcwd()'

" SuperTab like snippets behavior.
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
" auto saveを有効に
let g:auto_save = 1

" gist-vim settings
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

" simple-javascript-indenter
let g:SimpleJsIndenter_BriefMode = 1
" }}}

" general config {{{

filetype on
filetype plugin indent on     
syntax on "強調表示(色付け)のON/OFF設定

" %を強化する
source $VIMRUNTIME/macros/matchit.vim

" 色数
set t_Co=256

"View
colorscheme hybrid
set number "行番号を表示する
set title "ウィンドウのタイトルを変更する設定
set ruler "カーソルが何行目の何列目に置かれているかを表示する

" backspace config
set backspace=indent,eol,start "backspaceで何でも消す

"indent 
set tabstop=4
set smartindent
set expandtab
set shiftwidth=4

"無限undo
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

"file
set hidden "編集中でも他のファイルに移動可能
set noswapfile
set nobackup

" foldmethod
set foldmethod=marker

"前回の作業位置を復元
augroup restre_cursor_pos
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""
augroup END

"Search
set ignorecase "検索で、大文字小文字を区別しない
set smartcase "検索で小文字なら大文字を無視、大文字なら無視しない設定
set wrapscan "検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set hlsearch "検索結果をハイライトする
set incsearch "インクリメンタルサーチ

"mouse on
set mouse=a

"wrap
set nowrap

"clipboard
set clipboard&
set clipboard+=unnamed
    
"開いたファイルがあるdirectoryをcurrent directoryに 
augroup set_current_dir_by_opend_file
    autocmd!
    autocmd BufEnter * execute ':silent! lcd' fnameescape(expand('%:p:h'))
augroup END

" 特定のcommand実行時にquickfixを開くmodifiableに
function! OpenQF()
    cw
    set modifiable
    set nowrap
endfunction
augroup open_with_quickfix
    autocmd!
    autocmd QuickfixCmdPost grep call OpenQF()
    autocmd QuickfixCmdPost vimgrep call OpenQF()
    autocmd QuickfixCmdPost make call OpenQF()
    autocmd QuickfixCmdPost jshint call OpenQF()
augroup END

"全角文字を強調表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd BufEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif        

"ctags ルートで ctags -R * .tags生成
"set tags=.tags;
set tags=.tags;

" make 
set makeprg=env\ LANG=C\ make\ install

" statusline
set laststatus=2

" tab http://qiita.com/wadako111/items/755e753677dd72d8036d
 " Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

" "statusline change when insert mode
" let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
" if has('syntax')
    " augroup InsertHook
        " autocmd!
        " autocmd InsertEnter * call s:StatusLine('Enter')
        " autocmd InsertLeave * call s:StatusLine('Leave')
    " augroup END
" endif

" let s:slhlcmd = ''
" function! s:StatusLine(mode)
    " if a:mode == 'Enter'
        " silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        " silent exec g:hi_insert
    " else
        " highlight clear StatusLine
        " silent exec s:slhlcmd
    " endif
" endfunction

" function! s:GetHighlight(hi)
    " redir => hl
    " exec 'highlight '.a:hi
    " redir END
    " let hl = substitute(hl, '[\r\n]', '', 'g')
    " let hl = substitute(hl, 'xxx', '', '')
    " return hl
" endfunction
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" " cindent
" augroup mycindent
    " au!
    " au FileType c,cpp set cindent
" augroup END

" }}}

" my commands {{{

" cursorの下の単語を:helpで検索する
function! ShowHelpOnWord()
    let word = expand("<cword>")
    exec ":h " . word
endfunction
command! ShowHelpOnWord :call ShowHelpOnWord()
function! ShowHelpOnWordV() range
    let tmp = @@
    silent normal gvy "gv は最後に選択していた範囲を復元する
    let selected = @@
    let @@ = tmp
    exec ":h " . selected
endfunction
command! -range ShowHelpOnWordV :call ShowHelpOnWordV()
" VimShowHlGroup: Show highlight group name under a curso
command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
" http://cohama.hateblo.jp/entry/2013/08/11/020849
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" vimprocで結果を変数に代入
" http://vim-users.jp/2010/08/hack168/
" cursorの下の単語にresourcepickerを実行
" arg type(t, i), locale(ja_JP, en_US)
function! ResourcePicker(...)
    if a:0 != 2
        echo "arg error. input type and locale"
        return 
    endif
    
    let type = ""
    if a:1 == "t"
        let type = "-t"
    else
        let type = "-i"
    endif
   
    let locale = ""
    if a:2 == ""
        let locale = "ja_JP"
    else
        let locale = a:2 
    endif
    
    let id = expand("<cword>")
    let cmd = "resourcepicker " . type . " -l " . locale . " " . id
    let res = vimproc#system(cmd)
    echo res
endfunction
command! -nargs=* ResourcePicker :call ResourcePicker(<f-args>)

" }}}

" keymaps {{{

"nnoremap ; 0i<CR><ESC>k
nnoremap <enter> i<CR><ESC>
nnoremap <C-h> 5zh
nnoremap <C-l> 5zl
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
nnoremap Y y$
nnoremap <C-p> "0p
inoremap <C-p> <C-r>0 
nnoremap M :set modifiable!<CR>
nnoremap <C-]> g<C-]>
nnoremap gr :Unite grep:.<CR>
" 最後に検索した文字列を検索
nnoremap g/ :Unite grep:. <CR><C-r>/<CR> 
" カーソル位置の単語をgrep検索
nnoremap gw :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" 最後に選択した文字列をgrep検索
nnoremap gv :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R>*<CR>
nnoremap fi :normal gc<CR>:Unite find:.<CR>
nnoremap ba :UniteBookmarkAdd<CR>
nnoremap vs :VimShell -split<CR>
nnoremap <Space>t :Tlist<CR>
nnoremap <Space>n :NERDTreeToggle<CR>
" nnoremap <Space>h :e %:r.h<CR>
" nnoremap <Space>c :e %:r.cpp<CR>
nnoremap <Space>b :Unite buffer<CR>
nnoremap <Space>r :Unite register<CR>
nnoremap <Space>l :Unite file_mru -truncate<CR>
nnoremap <Space>d :Unite directory_mru -default-action=vimfiler<CR>
"nnoremap <Space>D :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <Space>s :Unite bookmark -default-action=vimfiler<CR>
nnoremap <Space>y :Unite history/yank<CR>
nnoremap <Space>m :Unite mark<CR>
nnoremap <Space>S :Unite svn/status<CR>
nnoremap <Space>L :VCSLog<CR>
nnoremap <Space>D :!svn diff<CR>
nnoremap <Space>u :GundoToggle<CR>
nnoremap <Space>f :VimFilerCurrentDir <CR>
nnoremap <Space>e :e .<CR>
nnoremap <Space>B :buffers<CR>
nnoremap <Space>R :ResourcePicker t ja_JP<CR>
nnoremap <Space>F :Unite file<CR>
nnoremap <Space>h :ShowHelpOnWord<CR>
nnoremap <Space>uf :Unite fold<CR>
nnoremap <Space>ur :Unite file_rec<CR>
nnoremap <C-@> :<Up><CR>
nnoremap <C-a> <HOME>
nnoremap <C-e> <END>
nnoremap :w :w<CR>
nnoremap sc :SyntasticCheck<CR>
nnoremap ma :Unite build:! -default-action=preview -auto-highlight<CR>
"vimrc 編集、適用
nnoremap <Space>v :e $VIMRC<CR>
nnoremap <Space>V :source $VIMRC<CR>
nnoremap <C-w>v :vs<CR><C-w><C-w><CR>:VimFilerCurrentDir<CR>
nnoremap <C-w>s :sp<CR><C-w><C-w><CR>:VimFilerCurrentDir<CR>

"insert mode
"カーソル移動
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
"insert mode 抜ける
inoremap jj <ESC>
inoremap kk <ESC>==
"insert mode かっこ
"inoremap { {}<LEFT>
"inoremap ( ()<LEFT>
inoremap :w <ESC>:w<CR>
" inoremap ( (<Space>
" inoremap ) <Space>)
"command mode
"emacs風
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>

"visual mode
vnoremap <Space>H :ShowHelpOnWordV<CR>

"vnoremap <Space>H :<C-u>h <C-R>*<CR>
vnoremap gr :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R>*<CR>

"for snippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" }}}

" test general {{{
let g:mysc_hstate = 0
function! ToggleTest()
    if g:mysc_hstate == 1
        let g:mysc_hstate = 0
        call unite#custom#source('file_mru', 'converters', ["converter_file_directory"])
    else
        let g:mysc_hstate = 1
        call unite#custom#source('file_mru', 'converters', ["converter_smart_path"])
    endif
endfunction

command! Testecho :call test#Testecho()
"test keymap
nnoremap <Space>T :call ToggleTest()<CR>
"autoload test
nnoremap <Space>Te :call test#Testecho()<CR>
" }}}

" ruby test {{{

" https://sites.google.com/site/hymd3a/vim/vim-ruby-interface
" ruby interface
function! VRtest1()
ruby << EOC
    require "date"
    print Date.today.to_s
EOC
endfunction
"call VRtest1()

function! VRtest2()
ruby << EOC
    require "date"
    buf = VIM::Buffer.current
    buf.append(buf.count, Date.today.to_s)
EOC
endfunction
"call VRtest2()

function! VRtest3(str)
ruby << EOC
    buf = VIM::Buffer.current
    buf.append(buf.count, VIM.evaluate('a:str'))
EOC
endfunction
" call VRtest3("hoge")

function! VRtest4(str)
    let num = 0
ruby << EOC
    result = eval(VIM.evaluate('a:str'))
    VIM.command("let num = #{result}")
EOC
    echo num
endfunction
" call VRtest4("1+2")

"}}}

" unite filters {{{l

" :h unite-filters
" let s:filters = {
    " \   "name" : "converter_add_updatetime",
    " \   "description" : "add updatetime"
" \}
" function! s:filters.filter(candidates, context)
    " for candidate in a:candidates
        " let updatetime = strftime("(%Y/%m/%d %H:%M:%S) ", getftime(candidate.action__path))
        " " abbr に更新日を追加する
        " let candidate.abbr = updatetime . candidate.abbr
    " endfor
    " return a:candidates
" endfunction
" call unite#define_filter(s:filters)
" unlet s:filters

let s:filters = {
    \   "name" : "converter_add_updatetime",
    \   "description" : "add updatetime"
\}
function! s:filters.filter(candidates, context)
    for candidate in a:candidates
        echo candidate
        "let candidate.word = "gori"
        " let candidate.abbr = "hage"
        "let candidate.abbr = "aaa"
    endfor
    return a:candidates
endfunction
call unite#define_filter(s:filters)
unlet s:filters

" }}}

" unite source {{{

"http://d.hatena.ne.jp/thinca/20101105/1288896674
let s:unite_source = {
\   'name': 'lines',
\ }
function! s:unite_source.gather_candidates(args, context)
  let path = expand('%:p')
  let lines = getbufline('%', 1, '$')
  let format = '%' . strlen(len(lines)) . 'd: %s'
  return map(lines, '{
  \   "word": printf(format, v:key + 1, v:val),
  \   "source": "lines",
  \   "kind": "jump_list",
  \   "action__path": path,
  \   "action__line": v:key + 1,
  \ }')
endfunction
call unite#define_source(s:unite_source)
unlet s:unite_source

"call unite#custom#source('file', 'converters', ['converter_add_updatetime'])
call unite#custom#source('file_mru', 'matchers', ['matcher_file_name'])
" let g:unite_source_file_mru_ignore_pattern = '\.svn-base$\|\.jax$\|\.log\.\|\.log$\|\.d$\|\.o$' "おそらくmru.vimのデフォルト値おかしい
" default に追加
call unite#custom#source('file_mru', 'ignore_pattern', unite#sources#rec#define()[0]['ignore_pattern'] .'\|\.svn-base$\|\.jax$\|\.log\.\|\.log$\|\.d$\|\.o$')
call unite#custom#source('file_rec', 'ignore_pattern', unite#sources#rec#define()[0]['ignore_pattern'] . '\|\/lcov\/\|\.\d$')
"}}}

" memo {{{

" vim最新版インストール　http://yuheikagaya.hatenablog.jp/entry/2013/04/23/211530
" Mercurial(hg)コマンド を利用　最新にする際は hg pull; hg update;
" configureの失敗時は src/auto/config.logをみる soが無いと言われたのでシンボリックリンク作成→OK→コンパイルエラー Python.hがない　→　zypper in python-develで /usr/include/python2.6に　→　OK
" ./configure --enable-rubyinterp --enable-cscope --enable-gui --enable-gtk2-check --enable-gnome-check --with-x --enable-perlinterp --enable-pythoninterp --enable-python3interp --enable-xim --enable-rubyinterp --enable-multibyte --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.6/config --enable-luainterp
" export CPPFLAGS=-I/usr/include/ export LDFLAGS=-I/usr/lib/ 改めてconfigureする前に、キャッシュファイルauto/config.cacheを削除する必要がある。
" --enable-gui で失敗したら libx11-dev libxt-dev
"  perl ruby python あたりのdevelも確認
"  libgtk2.0-devなどのinstallを確認
" suseではmercurialのバージョンが低いのでubuntuからソースをもらいましょう
" gitでvimdiff svnも同じ感じ
" http://rubyonrails.gachinko.org/git/vimdiff/

" }}}

j
