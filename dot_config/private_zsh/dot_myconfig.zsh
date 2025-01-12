#ALiases
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias rm="rm -i"
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias pacman="sudo pacman"
alias ls="exa --icons --group-directories-first"
alias lsn="exa --no-icons --group-directories-first"
alias zz="z -"
alias ..="z .."
alias cat="bat"
alias nvim="$HOME/Apps/nvim-linux64/bin/nvim"
alias share="cd $HOME/.local/share/"
alias find="fd"

alias pa="php artisan"
alias pas="php artisan serve"

alias nrd="npm run dev"

#Funtions
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

cs () {
  curl cheat.sh/$1/$2
}

hsearch() { fc -lim "*$@*" 1 }

hotkeys() {
  eog "/home/lucio/Pictures/zshhk/hk.png"
}

export pgadmin() {
  source $HOME/pgadmin4/bin/activate
  sudo pgadmin4
}

#Asdf
. /home/lucio/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

#Dir Settings

# setxkbmap  -layout br
PATH=/home/lucio/.asdf/shims:/home/lucio/.asdf/bin:/home/lucio/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/lucio/.bin/go
INSTALL4J_JAVA_HOME=/home/lucio/.asdf/installs/java/java-se-ri-8u41-b04/
export INSTALL4J_JAVA_HOME

export PICTURES=$HOME/Pictures
export BROWSER=firefox

export EDITOR='nvim'
asdf shell nodejs 16.11.1 lua 5.4.3 luaJIT 2.0.5--2.4.4 python 3.9.7

export ERL_AFLAGS="-kernel shell_history enabled"

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
set -o HIST_IGNORE_ALL_DUPS

autoload -U compinit; compinit
# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi
eval "$(zoxide init zsh)"
export RANGER_LOAD_DEFAULT_RC=false
echo "" # Stop printing the '%' character on startup
