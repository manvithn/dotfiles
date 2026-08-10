# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## environment

# yadm creates this symlink from the matching OS-specific alternate.
[[ -r "$ZDOTDIR/conf.d/platform.zsh" ]] &&
  source "$ZDOTDIR/conf.d/platform.zsh"

# Give user-installed commands highest priority. The `-U` attribute keeps only
# the first occurrence of each directory in zsh's path array, which is tied to
# the exported PATH scalar.
typeset -U path
[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)
export PATH

## shell settings

# Keep background processes at full speed
setopt NO_BG_NICE

# Split unquoted parameter expansions to be compatible with Bash
#setopt SH_WORD_SPLIT

# History settings
HISTFILE="${ZDOTDIR:-$HOME}/.histfile"
HISTSIZE=1000
SAVEHIST=1000

# Share history between zsh processes
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

# History ignores consecutive duplicate commands
setopt HIST_IGNORE_DUPS

# Insert first match immediately on ambiguous completion
setopt MENU_COMPLETE

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# set up run-help
unalias run-help 2>/dev/null
autoload -U run-help

## zgenom config

ZGEN_RESET_ON_CHANGE=(${ZDOTDIR:-$HOME}/.zshrc)

# Load plugins after bootstrap has installed zgenom. Until then, the shell still
# starts with its built-in prompt and completion support.
if [[ -r "${ZDOTDIR:-$HOME}/.zgenom/zgenom.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zgenom/zgenom.zsh"

  # Check for plugin and zgenom updates every 7 days (in the background).
  zgenom autoupdate

  if ! zgenom saved; then
    zgenom load romkatv/powerlevel10k powerlevel10k
    zgenom load zsh-users/zsh-completions
    zgenom load zsh-users/zsh-history-substring-search
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    zgenom save
  fi
fi

# support bash completion scripts
autoload -U +X bashcompinit && bashcompinit

## environment and appearance

[[ -r "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

if (( $+commands[nvim] )); then
  export EDITOR="nvim"
  export VISUAL="$EDITOR"
  alias vim=nvim
elif (( $+commands[vim] )); then
  export EDITOR="vim"
  export VISUAL="$EDITOR"
fi

export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/rg/ripgreprc"

# kittens
alias kdiff='kitty +kitten diff'
alias kssh='kitty +kitten ssh'

## key bindings

# Vi key bindings
bindkey -v

# Use up/down arrow keys to search history substrings when the plugin is loaded.
if (( ${+widgets[history-substring-search-up]} )); then
  bindkey "^[[A" history-substring-search-up
  bindkey "^[[B" history-substring-search-down
fi

# Backspace follows vim behavior instead of vi
bindkey -v '^?' backward-delete-char

# Shift+Tab for reverse menu completion in vi insert mode
bindkey -v '^[[Z' reverse-menu-complete

# zoxide
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# fzf keybindings
if (( $+commands[fzf] )); then
  export FZF_DEFAULT_OPTS="--ansi"

  if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND="fd -H -L -t=f -c=always --strip-cwd-prefix"
    export FZF_CTRL_T_COMMAND="fd -H -L -t=f -t=d -t=l -c=always --strip-cwd-prefix"
    export FZF_ALT_C_COMMAND="fd -H -L -t=d -c=always --strip-cwd-prefix"
  fi

  # Current fzf releases generate the zsh integration on demand.
  source <(fzf --zsh 2>/dev/null)

  if (( ${+widgets[fzf-cd-widget]} )); then
    # Change the fzf directory widget from Alt-C to Ctrl-F.
    bindkey -r '\ec'
    bindkey '^F' fzf-cd-widget
  fi
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
