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
plugins=(git rails ruby brew bundler gem pow rvm)

# takes 30 seconds to load, why?
source $ZSH/oh-my-zsh.sh

setopt no_complete_aliases

# Customize to your needs...

# Speed up terminal windows / tabs
# http://osxdaily.com/2010/05/06/speed-up-a-slow-terminal-by-clearing-log-files/

# RVM (load)
# Load RVM if there is a .rvmrc file in the current directory
load_rvm()
{
  if [[ -s $PWD/.rvmrc || -s $PWD/.ruby-version ]] ; then
   [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
    unset rvm_rvmrc_cwd

    if [ -f ".rvmrc" ]; then
      source ".rvmrc"
    elif [ -f ".ruby-gemset" ]; then
      rvm use `cat .ruby-version`@`cat .ruby-gemset` --create
    else
      rvm use `cat .ruby-version`
    fi
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

# Allows for Ctl+O
/bin/stty -iexten

# Make bash check it's window size after a process completes
# shopt -s checkwinsize

# Productivity Aliases
alias cd..="cd .."
alias la="ls -hall"
alias migrate='rake db:migrate && rake db:test:prepare'
alias route='rake routes | grep '
alias reload='. ~/.zshrc'
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias dtp='rake db:test:prepare'
# alias g='hub'
alias rctags='ctags -R --exclude=.git --exclude=log * $GEM_HOME/*'
alias faster='sudo rm -rf /private/var/log/asl/*.asl; dscacheutil -flushcache; purge'

# User Testing
alias ut='cd /Users/peppyheppy/Sites/usertesting'
alias uto='cd /Users/peppyheppy/Sites/usertesting/orders'
alias utm='cd /Users/peppyheppy/Sites/usertesting/wordpress'
alias utc='cd /Users/peppyheppy/Sites/usertesting/authentication'

# User Testing hosts
alias utosx='ssh admin@209.97.200.169'
alias app01='ssh deploy@app01.c45367.blueboxgrid.com'
alias app02='ssh deploy@app02.c45367.blueboxgrid.com'
alias app03='ssh deploy@app03.c45367.blueboxgrid.com'
alias app04='ssh deploy@app04.c45367.blueboxgrid.com'
alias app04su='ssh ${UT_USER}@app04.c45367.blueboxgrid.com'
alias app02su='ssh ${UT_USER}@app02.c45367.blueboxgrid.com'
alias app03su='ssh ${UT_USER}@app03.c45367.blueboxgrid.com'
alias db01='ssh ${UT_USER}@db01.c45367.blueboxgrid.com'
alias db02='ssh ${UT_USER}@db02.c45367.blueboxgrid.com'
alias util01='ssh deploy@util01.c45367.blueboxgrid.com'
alias uttvr='ssh root@174.129.224.216'
alias utconroy='ssh qa@208.83.107.248'
alias qa01='ssh deploy@qa01.c45367.blueboxgrid.com'
alias qa01su='ssh ${UT_USER}@qa01.c45367.blueboxgrid.com'
alias pub01='ssh deploy@pub01.c45367.blueboxgrid.com'
alias staging01='ssh deploy@www.qa1.usertesting.com'
alias remem='sudo launchctl stop org.macports.memcached; sudo launchctl start org.macports.memcached'

#### EXPORTS
export ARCHFLAGS="-arch x86_64"
export GIT_MERGE_AUTOEDIT=no
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export GEM_PRIVATE_KEY='~/.ssh/gem-private_key.pem'
export GEM_CERTIFICATE_CHAIN='~/.ssh/gem-public_cert.pem'

# environment vars for apps, etc
export NODE_PATH="/usr/local/lib/node"
export MEMCACHE_SERVERS='127.0.0.1'

# usertesting specific
export RUN_JS=true
export DO_SAUCE=true

unalias g

# load all user specific aliases and environment vars from .me
[[ -s "$HOME/.me" ]] && . "$HOME/.me" || echo "Unable to load ~/.me profile settings"
