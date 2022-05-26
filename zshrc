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



# ### SHELL_COMPLETION
autoload -Uz compinit
compinit



# ### KEY_BINDINGS
bindkey -e



# ### ENVIRONMENT
export LANG=en_IN.UTF-8
export VISUAL=vim
export EDITOR=$VISUAL

# ## paths
# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath
path=("$HOME/.local/bin" $path)
path+=("/usr/local/sbin")
path+=("/usr/sbin")
path+=("/sbin")
manpath=("$HOME/.local/share/man" $manpath)
export MANPATH
cdpath+=("$HOME")



# ### FUNCTIONS
# takedir - oh-my-zsh
function take() {
  mkdir -p $@ && cd ${@:$#}
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
alias l='ls -F'
alias ll='ls -l'
alias la='ls -lA'
alias lsd='ls -ld *(-/DN)' # list only directories and symbolic links that point to directories
alias lsa='ls -ld .*'      # list only file beginning with "."

# ## cd
# TODO: If start using z, then modify accordingly
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

# ## others
alias g='git'
alias j='jobs'
alias c='clear'
alias h='history'
alias pu='pushd'
alias po='popd'
alias ty='type -fa'
alias sudo='sudo '                            # allow alias expansion on sudo commands
alias mount='mount |column -t'
alias rezsh='exec zsh'
alias clswap='sudo swapoff -a;sudo swapon -a' # clear swap



# ### AUTOSUGGESTIONS
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'



# ### SYNTAX_HIGHILIGHTING
# Keep zsh-syntax-highlighting very close to bottom
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
