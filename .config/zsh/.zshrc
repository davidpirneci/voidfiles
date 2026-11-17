# Prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Options and history
setopt autocd interactive_comments hist_ignore_dups share_history
HISTFILE="$HOME/.cache/zsh_history"
HISTSIZE=10000000 SAVEHIST=10000000

# Completion
autoload -U compinit && compinit -d "$HOME/.cache/zcompdump"
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# Vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# Beam cursor in insert mode, block cursor in normal mode
function zle-keymap-select () {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';;
    viins|main) echo -ne '\e[5 q';;
  esac
}
zle -N zle-keymap-select
zle-line-init() { zle -K viins; echo -ne "\e[5 q" }
zle -N zle-line-init
preexec() { echo -ne '\e[5 q' }

# Ctrl+E opens the current command in nvim
export EDITOR=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Aliases
alias ls='ls --color=auto' ll='ls -lah' vim='nvim'
alias x='sudo xbps-install' q='xbps-query -Rs' r='sudo xbps-remove -R'

# Plugins (keep syntax highlighting last)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
