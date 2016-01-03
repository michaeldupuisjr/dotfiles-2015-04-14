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
Plugin 'tpope/vim-fugitive'                     " git wrapper
Plugin 'tpope/vim-surround'                     " provides mappings for parentheses, brackets, etc.
Plugin 'vim-ruby/vim-ruby'                      " vim/ruby configuration files

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


" ---------------------------------------------------------------------------
" Highlighting
" ---------------------------------------------------------------------------

syntax on       " switch syntax highlighting on, when the terminal has colors
set hlsearch    " also switch on highlighting the last used search pattern.


" ---------------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------------

set backspace=indent,eol,start                " allow backspacing over everything in insert mode
set nowrap                                    " Switch wrap off for everything
set number                                    " line numbers
set pastetoggle=<F7>                          " Toggle paste-mode
set ruler                                     " show the cursor position all the time
set showcmd                                   " display incomplete commands
set statusline+=%F                            " display full path of file
set timeout timeoutlen=1000 ttimeoutlen=100   " prevents pause before inserting a new line above and entering insert mode
set whichwrap+=<,>,h,l,[,]                    " backspace and cursor keys wrap to
set wildignore+=*/tmp/*,*.so,*.swp,*.zip      " exclude files and directories
set wildmenu                                  " turn on wild menu
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
