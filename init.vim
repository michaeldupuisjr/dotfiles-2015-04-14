" Thanks:
" https://github.com/rtomayko/dotfiles/blob/rtomayko/.vimrc
" http://github.com/ryanb/dotfiles/master/vimrc

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

set nocompatible      " use Vim settings, rather then Vi settings
filetype off          " no filetype detection (Vundle required)
set history=100       " lines of command line history to keep


" ---------------------------------------------------------------------------
" Vundle Plugins - to install, relaunch nvim and run :PluginInstall
" ---------------------------------------------------------------------------

set rtp+=~/.nvim/bundle/Vundle.vim              " set the runtime path to include Vundle

call vundle#begin('~/.nvim/bundle/')            " initialize Vundle (Vundle required)
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gmarik/Vundle.vim'                      " let Vundle manage Vundle (Vundle required)
Plugin 'mileszs/ack.vim'                        " fuzzy file, buffer, mru, tag, etc finder
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-endwise'                      " wisely add `end` in ruby, endfunction/endif/more in vim script, etc
Plugin 'tpope/vim-fugitive'                     " git wrapper
Plugin 'tpope/vim-surround'                     " provides mappings for parentheses, brackets, etc.
Plugin 'vim-ruby/vim-ruby'                      " vim/ruby configuration files

" themes
Plugin 'altercation/vim-colors-solarized'       " colors - Solarized
Plugin 'chriskempson/base16-vim'                " colors - base16

" syntax plugins
Plugin 'elixir-lang/vim-elixir'                 " configuration files for Elixir
Plugin 'mustache/vim-mustache-handlebars'       " mustache and handlebars mode for vim
Plugin 'pangloss/vim-javascript'                " vastly improved Javascript indentation and syntax support in Vim
Plugin 'scrooloose/syntastic'                   " syntax checking hacks for vim
call vundle#end()                               " plugins above here (Vundle required)

filetype plugin indent on                       " (Vundle required)

" scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_html_tidy_exec = 'tidy5'        " needed to brew install tidy-html5 for this

" begin NERDTree from Janus
" (https://github.com/carlhuda/janus/blob/fe6d16f778ba08380168370d099725e852384f6d/janus/vim/tools/janus/after/plugin/nerdtree.vim)
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction
" end NERDTree from Janus


" ---------------------------------------------------------------------------
" Colors & Highlighting
" ---------------------------------------------------------------------------

syntax enable                   " switch syntax highlighting on, when the terminal has colors
" colorscheme base16-atelierforest
" colorscheme solarized
colorscheme base16-tomorrow     
set hlsearch                    " also switch on highlighting the last used search pattern.

" sets vim background color based on terminal profile colors
if $COLORFGBG  == '12;8' || $COLORFGBG == '7;0'
  set background=dark           " https://github.com/altercation/vim-colors-solarized#modify-vimrc
else
  set background=light
end


" ---------------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------------

set backspace=indent,eol,start                                                        " allow backspacing over everything in insert mode
set nowrap                                                                            " Switch wrap off for everything
set number                                                                            " line numbers
set pastetoggle=<F7>                                                                  " Toggle paste-mode
set ruler                                                                             " show the cursor position all the time
set showcmd                                                                           " display incomplete commands
set statusline+=%F                                                                    " display full path of file
set timeout timeoutlen=1000 ttimeoutlen=100                                           " prevents pause before inserting a new line above and entering insert mode
set whichwrap+=<,>,h,l,[,]                                                            " backspace and cursor keys wrap to
set wildignore+=*/tmp/*,*.o,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*    " exclude files and directories
set wildmenu                                                                          " turn on wild menu
set wildmode=list:longest,full


" ---------------------------------------------------------------------------
" Visual Cues
" ---------------------------------------------------------------------------

set incsearch       " do incremental searching


" ---------------------------------------------------------------------------
" Text Formatting
" ---------------------------------------------------------------------------

let NERDSpaceDelims=1             " NERDCommenter - Specifies whether to add extra spaces around delimiters when commenting, and whether to remove them when uncommenting.

set autoindent                    " automatic indent new lines
set expandtab                     " expand tabs to spaces
set shiftwidth=2                  " indents will have a width of 2
set smartindent                   " be smart about it
set softtabstop=2                 " uses a mix of spaces and <Tab>s to simulate tabs.
set tabstop=2                     " the number of spaces that a <Tab> counts for.
set textwidth=72                  " wrap at 72 chars by default


" ---------------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------------

" remap <LEADER> to ',' (instead of '\')
let mapleader = ","
let g:mapleader = ','

" NERDTree
nmap <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>


" ---------------------------------------------------------------------------
" Auto Commands
" ---------------------------------------------------------------------------

autocmd FileType javascript setlocal nocindent	          " don't use cindent for javascript
autocmd Filetype gitcommit setlocal spell textwidth=72    " turn on spell-check for git commit

autocmd VimEnter * NERDTree                               " http://stackoverflow.com/questions/1979520/auto-open-nerdtree-in-every-tab/7640505#7640505
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

" ---------------------------------------------------------------------------
" File Types
" ---------------------------------------------------------------------------

autocmd BufNewFile,BufReadPost *.md set filetype=markdown   " force *.md as markdown (https://github.com/tpope/vim-markdown)


" ---------------------------------------------------------------------------
" Backups
" ---------------------------------------------------------------------------

set nobackup                                      " do not keep backups after close
set nowritebackup                                 " do not keep a backup while working
set noswapfile                                    " don't keep swp files either
set backupdir=$HOME/.nvim/backup                  " store backups under ~/.nvim/backup
set backupcopy=yes                                " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.nvim/swap,~/tmp,.                " keep swp files under ~/.nvim/swap
