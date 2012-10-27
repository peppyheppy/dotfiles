# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell-mod"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# takes 30 seconds to load, why?
source $ZSH/oh-my-zsh.sh

# SLOAN'S STUFF
GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT

unalias gco
gco()
{
  git checkout $*
  if [[ -s $PWD/.rvmrc ]] ; then
    echo "Reloading rvmrc from $PWD/.rvmrc"
    unset rvm_rvmrc_cwd
    source $PWD/.rvmrc
  fi
}
# EOF SLOAN'S STUFF

# stag() { git stag "$@" }
# compdef _git stag=git-branch

setopt no_complete_aliases

# Customize to your needs...
# export PATH=/usr/local/sbin:/Users/heppy/bin:/usr/local/bin:/Users/heppy/bin:/Users/heppy/.rvm/gems/ruby-1.9.2-p318@copycopter-ut/bin:/Users/heppy/.rvm/gems/ruby-1.9.2-p318@global/bin:/Users/heppy/.rvm/rubies/ruby-1.9.2-p318/bin:/Users/heppy/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# # # # # CUSTOM # # # # #

# Speed up terminal windows / tabs
# http://osxdaily.com/2010/05/06/speed-up-a-slow-terminal-by-clearing-log-files/

# RVM (load)
# Load RVM if there is a .rvmrc file in the current directory
load_rvm()
{
  if [[ -s $PWD/.rvmrc ]] ; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
    unset rvm_rvmrc_cwd
    source $PWD/.rvmrc
  fi
}

# after each cd/pwd, check to see if rvm exists and if it
# doesn't, load_rvm.
function chpwd() {
    emulate -L zsh
    if [[ `type -P rvm &>/dev/null && echo "Found" || echo "Not Found"` = 'Not Found' ]]
    then
      # ls -la
      load_rvm
    fi
}

# Add my personal bin to PATH
export PATH=~/bin:$PATH

# Allows for Ctl+O
/bin/stty -iexten

#### EXPORTS
# Extend PATH
export PATH=/usr/local/Cellar/macvim/7.3-64/bin:/usr/local/sbin:~/bin:/usr/local/bin:$PATH
export GEM_PRIVATE_KEY='~/.ssh/gem-private_key.pem'
export GEM_CERTIFICATE_CHAIN='~/.ssh/gem-public_cert.pem'

# Make bash check it's window size after a process completes
# shopt -s checkwinsize

# Productivity Aliases
alias cd..="cd .."
alias la="ls -hall"
alias migrate='rake db:migrate && rake db:test:prepare'
alias route='rake routes | grep '
alias bu='bundle update'
alias be='bundle exec'
alias bi='bundle install'
alias reload='. ~/.zshrc'
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias dtp='rake db:test:prepare'
alias g='git'
alias rctags='ctags -R --exclude=.git --exclude=log * $GEM_HOME/*'

# User Testing
alias ut='cd /Users/heppy/Sites/usertesting'
alias uto='cd /Users/heppy/Sites/usertesting/orders'
alias utm='cd /Users/heppy/Sites/usertesting/wordpress'
alias utc='cd /Users/heppy/Sites/usertesting/authentication'
alias utprod='ssh deploy@www.usertesting.com'
alias utstag='ssh deploy@www.qa1.usertesting.com'
alias utci='ssh deploy@67.214.218.39'
alias utredis='ssh deploy@67.214.220.189'

# Project Specific
alias mislice='ssh paul@67.207.133.109'
alias ss="export RAILS_ENV=development ; cd /Users/heppy/Sites/simplyscrum.com"
alias eqapp="export RAILS_ENV=development ; cd /Users/heppy/Documents/MyDocuments/church/eqapps/eqapp"
alias projects="cd ~/Documents/MyDocuments/projects"
alias remail="export RAILS_ENV=development ; cd /Users/heppy/Sites/remailed/nonameapp"
alias smt="export RAILS_ENV=development ; cd /Users/heppy/Sites/reccenter/signmeto.roadrunnerrecords.com ; rvm 1.8.7 ; rvm gemset  create smt ; rvm gemset use smt"
alias rrr="cd ~/Sites/reccenter/roadrunner-records-com"

# alias dts4='rake parallel:spec[4]'
alias remem='sudo launchctl stop org.macports.memcached; sudo launchctl start org.macports.memcached'

# environment vars for apps, etc
export NODE_PATH="/usr/local/lib/node"
export MEMCACHE_SERVERS='127.0.0.1'
export RSPEC_FORMAT='nested'
export DONT_OVERRIDE_MY_LOGIN=true
export RUN_JS=true
export DO_SAUCE=true
