# .dotfiles
Inspired by the groundbreaking working being done by
[duggiefresh](https://github.com/duggiefresh/dotfiles).

## neovim
I'm using neovim without a `.vimrc`. The configuration file is
`init.vim` and it gets symlinked to `~/.config/nvim/` where neovim
expects to find it. Plugins get installed to `~/.nvim/bundle` rather than
`~/.vim/bundle`.
