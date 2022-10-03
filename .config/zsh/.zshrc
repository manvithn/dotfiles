# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
unalias run-help
autoload -U run-help

## zgenom config

ZGEN_RESET_ON_CHANGE=(${ZDOTDIR:-$HOME}/.zshrc)

# load zgenom
source "${ZDOTDIR:-$HOME}/.zgenom/zgenom.zsh"

# check for plugin and zgenom updates every 7 days
# runs in background
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then
  zgenom load romkatv/powerlevel10k powerlevel10k
  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zsh-users/zsh-autosuggestions
  # zgenom load marlonrichert/zsh-autocomplete

  # generate the init script from plugins above
  zgenom save
fi

# support bash completion scripts
autoload -U +X bashcompinit && bashcompinit

## key bindings

# Vi key bindings
bindkey -v

# Use up/down arrow keys to search history substrings
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Backspace follows vim behavior instead of vi
bindkey -v '^?' backward-delete-char

# Shift+Tab for reverse menu completion in vi insert mode
bindkey -v '^[[Z' reverse-menu-complete

# zoxide
eval "$(zoxide init zsh)"

# fzf keybindings
FZF_DEFAULT_COMMAND="fd -H -L -t=f -c=always --strip-cwd-prefix"
FZF_CTRL_T_COMMAND="fd -H -L -t=f -t=d -t=l -c=always --strip-cwd-prefix"
FZF_ALT_C_COMMAND="fd -H -L -t=d -c=always --strip-cwd-prefix"
FZF_DEFAULT_OPTS="--ansi"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# change fzf-cd-widget keybinding from alt-c to ctrl-f
bindkey -r '\ec'
bindkey '^F' fzf-cd-widget

## environment and appearance

path=(
  "$HOME/.local/bin"
  $path
)

export VISUAL="/usr/bin/nvim"
alias vim=nvim

export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/rg/ripgreprc"

# add color output
alias diff='diff --color=auto'
alias ip='ip -color=auto -human-readable'
alias ls='ls --color=auto --human-readable'

# kittens
alias kdiff='kitty +kitten diff'

git-clone-bare() {
    # Examples of call:
    # git-clone-bare git@github.com:name/repo.git
    # => Clones to /repo directory
    # git-clone-bare git@github.com:name/repo.git my-repo
    # => Clones to /my-repo directory

    local url="$1"
    local basename="${url##*/}"
    local name="${2:-${basename%.*}}"

    git clone --bare "$url" "$name" &&

    pushd "$name" &&
    git config --local status.showUntrackedFiles no &&
    # Explicitly sets the remote origin fetch so we can fetch remote branches
    git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*" &&
    # Gets all branches from origin
    git fetch origin &&
    popd
}

# dotfile sync
alias dotgit='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# kdesrc-build #################################################################

## Add kdesrc-build to PATH
export PATH="$HOME/kde/src/kdesrc-build:$PATH"

## Autocomplete for kdesrc-run
function _comp-kdesrc-run
{
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"

  # Complete only the first argument
  if [[ $COMP_CWORD != 1 ]]; then
    return 0
  fi

  # Retrieve build modules through kdesrc-run
  # If the exit status indicates failure, set the wordlist empty to avoid
  # unrelated messages.
  local modules
  if ! modules=$(kdesrc-run --list-installed);
  then
      modules=""
  fi

  # Return completions that match the current word
  COMPREPLY=( $(compgen -W "${modules}" -- "$cur") )

  return 0
}

## Register autocomplete function
complete -o nospace -F _comp-kdesrc-run kdesrc-run

################################################################################

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
