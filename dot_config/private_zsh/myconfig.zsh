#ALiases
alias config="chezmoi edit"
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias df='df -h'                          # human-readable sizes
alias rm="rm -i"
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias pacs="pacman -Ss"
alias paci="sudo pacman -S"
alias pacu="sudo pacman -Syu"
alias pacr="sudo pacman -Rns"
alias yays="yay -Ss"
alias yayi="yay -S"
alias yayu="yay -Syu"
alias yayr="yay -Rns"
alias ls="exa --icons --group-directories-first"
alias lsn="exa --group-directories-first"
alias la="exa --all --long --group-directories-first"
alias zz="z -"
alias ..="z .."
alias cat="bat"
alias share="cd $HOME/.local/share/"
alias find="fd"
alias pn="pnpm"
alias nrd="npm run dev"
alias pnd="pnpm dev"
alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"
alias gor="go run"
alias goi="go install"
alias gob="go build"

alias gitalias="git config --list | grep 'alias'"

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

lazyvim () {
  export NVIM_APPNAME="lazyvim"
  /bin/nvim $1
}
advim () {
  export NVIM_APPNAME="advim"
  /bin/nvim $1
}

cs () {
  curl cheat.sh/$1/$2
}

hsearch() { fc -lim "*$@*" 1 }

newd () {
  mkdir -p -- "$1" && cd -P -- "$1"
}

vmrss () {
   cat /proc/"$1"/status | grep VmRSS
}

hotkeys() {
  eog "/home/lucio/Pictures/zshhk/hk.png"
}

#Asdf
. /home/lucio/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
fpath=($HOME/.dotfiles/zsh/plugins/zsh-completions/src $fpath)
# initialise completions with ZSH's compinit

bindkey -v
source $HOME/.config/zsh/completion.zsh
eval "$(zoxide init zsh)"

autoload -Uz compinit && compinit

#Dir Settings

# setxkbmap  -layout br
PATH=/home/lucio/.asdf/shims:/home/lucio/.asdf/bin:/home/lucio/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

export PICTURES=$HOME/Pictures
export BROWSER=brave

export NVIM_APPNAME="lazyvim"
export EDITOR='nvim'
export TERM='ghostty'

export ERL_AFLAGS="-kernel shell_history enabled"

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
set -o HIST_IGNORE_ALL_DUPS


 export PNPM_HOME="/home/lucio/.local/share/pnpm"
 export PATH="$PNPM_HOME:$PATH"
#GOPROXY environment variable is used by Go to determine where to download modules from
 export GOPROXY=direct
#The GOSUMDB environment variable is used by Go to verify the integrity of downloaded modules.
 export GOSUMDB=sum.golang.org
 export GOPATH="$HOME/go"
 export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

 #BEGIN_KITTY_SHELL_INTEGRATION
 if test -n "$KITTY_INSTALLATION_DIR"; then
     export KITTY_SHELL_INTEGRATION="enabled"
     autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
     kitty-integration
     unfunction kitty-integration
 fi

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
source <(carapace _carapace)

