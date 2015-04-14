# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate git rbenv)

source $ZSH/oh-my-zsh.sh
export SHELL=/bin/zsh
export EDITOR=vim
# Android Cordova: https://issues.apache.org/jira/browse/CB-5422
# export JAVA_HOME=$(/usr/libexec/java_home)

# Override sourcing of /etc/profile (http://superuser.com/questions/544989/does-tmux-sort-the-path-variable)
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# Aliases!
alias ngrok='/Users/michaeldupuisjr/./ngrok'
alias nom='rm -rf node_modules/ && npm cache clear && npm install'
alias rspec='nocorrect rspec' # nocorrect to disable autocorrect (http://superuser.com/questions/439209/how-to-partially-disable-the-zshs-autocorrect)

export PATH="/usr/local/sbin:$PATH" # contains Homebrew system executables
export PATH="/usr/local/bin:$PATH" # Load Homebrew-prodivded programs instead of system-provide ones (via 'brew doctor')
export PATH="/usr/local/heroku/bin:$PATH" # Heroku
export PATH="/Users/michaeldupuisjr/Development/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:/Users/michaeldupuisjr/Development/adt-bundle-mac-x86_64-20131030/sdk/tools:$PATH" # Android
export PATH="/Users/michaeldupuisjr/.rbenv/bin:$PATH" #rbenv - access to command-line utility (https://github.com/sstephenson/rbenv#installation)
export PATH="/Users/michaeldupuisjr/.rbenv/shims:$PATH"
export PATH="./bin:$PATH" # Project-specific binstubs (https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs#adding-project-specific-binstubs-to-path)

# added by travis gem
[ -f /Users/michaeldupuisjr/.travis/travis.sh ] && source /Users/michaeldupuisjr/.travis/travis.sh

# set vmware as default provider for Vagrant
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

eval "$(rbenv init -)"

mkcd() { mkdir $*; cd $*; }
