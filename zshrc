# ### POWERLEVEL10K
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# ### OPTIONS
setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt



# ### KEY_BINDINGS
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^H' backward-kill-word                   # ctrl + backspace
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action



# ### SHELL_COMPLETION
autoload -Uz compinit
compinit
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'



# ### HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt hist_ignore_all_dups   # https://unix.stackexchange.com/questions/599641/why-do-i-have-duplicates-in-my-zsh-history
setopt hist_find_no_dups      # https://unix.stackexchange.com/questions/599641/why-do-i-have-duplicates-in-my-zsh-history
setopt hist_save_no_dups      # https://unix.stackexchange.com/questions/599641/why-do-i-have-duplicates-in-my-zsh-history
#setopt share_history         # share command history data



# ### ENVIRONMENT
export LANG="en_IN.UTF-8"
export LC_ALL="$LANG"
export VISUAL="vim"
export EDITOR="$VISUAL"
export PAGER="less -RF"
export DELTA_PAGER="less -rf" # hyperlinks don't work with `less -R`
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# ## paths
# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath
path=("$HOME/.local/bin" $path)
path+=("/usr/local/sbin")
path+=("/usr/sbin")
path+=("/sbin")
cdpath+=("$HOME")



# ### FUNCTIONS

# ## autoloads
autoload -U zmv

# takedir - oh-my-zsh
function mkcd take() {
  mkdir -p $@ && cd ${@:$#}
}
function prettymount() {
	if [[ $# = 0 ]]; then
		mount | column -t
	else
		mount $@
	fi
}
function ipshow() {
	if [[ $# = 0 ]]; then
		curl -s ipinfo.io/$(myip)?token=$IPINFO_TOKEN
	else
		curl -s ipinfo.io/$1?token=$IPINFO_TOKEN
	fi
}
function gaaa() {
	git add --all && git commit -m $@ && git push
}
function kcc() {
	gcc -o "$1.out" "$1.c" && ./$1.out
}
function kcr() {
	./$1.out
}
function kg() {
	git add "$(basename $(readlink -f "$1.c"))"
	git commit -m "Add $(basename $(dirname $(readlink -f "$1.c"))): $(basename $(readlink -f "$1.c"))"
	git push
}



# ### COLOR
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi



# ### ALIASES

# ## global
alias -g M='|more'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'

# ## ls
alias l='ls -Fv'
alias ll='ls -lv'
alias la='ls -lAv'
alias lsd='ls -ldv *(-/DN)' # list only directories and symbolic links that point to directories
alias lsa='ls -lvdv .*'      # list only file beginning with "."

# ## bat
alias b='bat'
alias ba='bat --show-all'
alias bathelp='bat --plain --language=help'
alias -g HP='--help 2>&1 |bathelp'

# ## fasd
alias j='fasd_cd -d'
alias v='f -e vim -b viminfo'

# ## cd
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

# ## preserve-root
#alias rm='rm --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# ## others
alias c='clear'
alias h='history'
alias jb='jobs'
alias pu='pushd'
alias po='popd'
alias ty='type -fa'
alias ack='ag'
alias fda='fd --no-ignore --hidden'
alias myip='echo $(curl -s ipinfo.io/ip)'
alias sudo='sudo '                            # allow alias expansion on sudo commands
alias mount='prettymount'
alias rezsh='exec zsh'
alias clswap='sudo swapoff -a;sudo swapon -a' # clear swap



# ### AUTOSUGGESTIONS
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'



# ### SYNTAX_HIGHILIGHTING
# Keep zsh-syntax-highlighting very close to bottom
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)



# ### HISTORY-SUBSTRING-SEARCH
# Keep this after SYNTAX-HIGHLIGHTING
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND
HISTORY_SUBSTRING_SEARCH_PREFIXED=true
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down



# ### MISCELLANEOUS

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi
# credentials
source ~/.credentials
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# sudo.zsh
source ~/.zsh/zsh-sudo/sudo.zsh
# git.zsh
source ~/.zsh/zsh-git/git.zsh
# fasd
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
# FZF
path+=("$HOME/.fzf/bin")
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set terminal-title
case $TERM in
	xterm*)
		set-term-title () {print -Pn '\e]0;%~\e\\'}
		autoload -Uz add-zsh-hook
		add-zsh-hook precmd set-term-title
		;;
esac

# vim: ft=zsh :
