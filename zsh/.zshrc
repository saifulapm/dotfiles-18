# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Base plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Terminal encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Custom PATH
export PATH=$PATH:$HOME/go/bin

# Store your own aliases in your $HOME directory and load them here
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
alias ls="lsd"
alias la="lsd -A"
alias ll="lsd -l"
alias lsa="lsd -lA"
alias lt="lsd -A --tree --depth=3"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
