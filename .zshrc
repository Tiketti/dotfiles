# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable completions
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit 

# Enable batch file move
autoload -U zmv

complete -C '/opt/homebrew/bin/aws_completer' aws

# auto cd into directory without explicit 'cd'
setopt autocd autopushd pushdignoredups

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Stop less from clearing the screen
export LESS="-Xr"

# make git use simple cat instead of paging
export GIT_PAGER="cat"

# use bat as colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf git npm wd yarn zsh-autosuggestions zsh-syntax-highlighting pnpm-shell-completion)

source $ZSH/oh-my-zsh.sh

# Enable Git commit signing with GPG
# https://github.com/Homebrew/homebrew-core/issues/14737#issuecomment-309848851
GPG_TTY=$(tty)
export GPG_TTY

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source $DOTFILES/.alias

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/usr/local/sbin:$PATH"

# pnpm
export PNPM_HOME="/Users/perttu/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Use .nvmrc file when cd'ing into a directory
eval "$(fnm env --use-on-cd)"

eval "$(direnv hook zsh)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
