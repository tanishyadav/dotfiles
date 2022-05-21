## START POWERLEVEL10K_INSTANT_PROMPT
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
## END POWERLEVEL10K_INSTANT_PROMPT


## START OPTIONS
setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
## END OPTIONS


## START ENVIRONMENT
export LANG=en_IN.UTF-8
export VISUAL=vim
export EDITOR=$VISUAL
## END ENVIRONMENT


## START ALIASES
# color
alias ls="ls --color=auto"
# ls
alias l="ls"
alias ll="ls -l"
alias la="ls -lA"
# productivity
alias cls="clear"
alias clswap="sudo swapoff -a; sudo swapon -a"
alias rezsh="exec zsh"
## END ALIASES


## START PLUGINS
source ~/software/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## END PLUGINS


## START SHELL_COMPLETION
autoload -Uz compinit && compinit
## END SHELL_COMPLETION


## START POWERLEVEL10K
source ~/software/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
## END POWERLEVEL10K
