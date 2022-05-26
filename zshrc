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
autoload -Uz compinit && compinit


# ### KEY_BINDINGS
bindkey -v


# ### ENVIRONMENT
export LANG=en_IN.UTF-8
export VISUAL=vim
export EDITOR=$VISUAL
# PATH
path_prepend() {
    if [ -d "$1" ]; then
        PATH=${PATH//":$1:"/:}     #delete all instances in the middle
        PATH=${PATH/%":$1"/}       #delete any instance at the end
        PATH=${PATH/#"$1:"/}       #delete any instance at the beginning
        PATH="$1${PATH:+":$PATH"}" #prepend $1 or if $PATH is empty set to $1
    fi
}
path_append() {
    if [ -d "$1" ]; then
        PATH=${PATH//":$1:"/:}     #delete all instances in the middle
        PATH=${PATH/%":$1"/}       #delete any instance at the end
        PATH=${PATH/#"$1:"/}       #delete any instance at the beginning
        PATH="${PATH:+"$PATH:"}$1" #append $1 or if $PATH is empty set to $1
    fi
}
path_prepend "$HOME/.local/bin"
path_append "/usr/local/sbin"
path_append "/usr/sbin"
path_append "/sbin"


# ### ALIASES
# color
alias ls="ls --color=auto"
# ls
alias l="ls"
alias ll="ls -l"
alias la="ls -lA"
# others
alias cls="clear"
alias clswap="sudo swapoff -a; sudo swapon -a"
alias rezsh="exec zsh"
alias g="git"


# ### AUTOSUGGESTIONS
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'


# ### SYNTAX_HIGHILIGHTING
# Keep zsh-syntax-highlighting very close to bottom
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
