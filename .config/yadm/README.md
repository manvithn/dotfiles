# Dotfiles

Personal configuration for macOS and Arch Linux, managed with
[yadm](https://yadm.io/). The repository uses `$HOME` as its work tree, so
tracked paths are the paths where the files are used.

## Supported systems

- macOS with Homebrew
- Arch Linux with `pacman`

## First installation

Install yadm with the platform package manager.

On macOS:

```sh
brew install yadm
```

On Arch Linux:

```sh
sudo pacman -Syu yadm
```

Arch Linux supports full system upgrades rather than partial upgrades. Before
later bootstrap runs that may install new packages, first complete a normal
`sudo pacman -Syu`; do not refresh the package database with `pacman -Sy`
alone.

Back up any existing dotfiles that overlap with files in this repository, then
clone without immediately executing the bootstrap:

```sh
yadm clone --no-bootstrap https://github.com/manvithn/dotfiles.git
yadm status
```

yadm leaves an existing file unmodified when its content conflicts with the
repository. Review and resolve any such files before continuing.

Preview the bootstrap, then run it:

```sh
DOTFILES_BOOTSTRAP_DRY_RUN=1 yadm bootstrap
yadm bootstrap
```

The bootstrap:

1. Installs the packages declared in
   `~/.config/yadm/packages/macos.Brewfile` on macOS or
   `~/.config/yadm/packages/arch.txt` on Arch Linux.
2. Installs Zgenom under `~/.config/zsh/.zgenom`.
3. Installs vim-plug and the missing Neovim plugins.

Package installation is interactive. On macOS, the bootstrap displays the
Homebrew dependency tree and asks for confirmation before running
`brew bundle`. On Arch Linux, pacman displays its resolved transaction and
uses its normal confirmation prompt. Pacman reports optional dependencies but
does not install them automatically.

Homebrew Bundle installs missing Brewfile entries and upgrades outdated ones.
It does not run a blanket upgrade of every installed package, although Homebrew
may update dependencies or installed dependents needed to keep a Brewfile entry
compatible. Homebrew may also refresh its formula and cask metadata; messages
about updated taps or newly available packages do not mean that installed
software was upgraded.

On Arch Linux, review pacman's optional-dependency notices during installation.
After the transaction, relevant optional features for this configuration can
be enabled while recording their installation reason as a dependency:

```sh
# Neovim system clipboard integration on Wayland
sudo pacman -S --needed --asdeps wl-clipboard

# Syntax highlighting for kitten diff
sudo pacman -S --needed --asdeps python-pygments
```

The bootstrap is idempotent and can be run again after pulling changes. It does
not install Homebrew, authenticate GitHub CLI, or change the login shell.

After bootstrap, authenticate GitHub if necessary:

```sh
gh auth login
```

The tracked Git configuration already connects Git's HTTPS credential flow to
GitHub CLI. On Arch Linux, make Zsh the login shell if desired:

```sh
chsh -s "$(command -v zsh)"
```

Start a new Zsh session to let Zgenom install the configured shell plugins. Run
`p10k configure` to create a prompt configuration, then track it if the result
should be shared:

```sh
yadm add ~/.config/zsh/.p10k.zsh
yadm commit -m "Configure Powerlevel10k prompt"
```

## Platform-specific files

yadm selects files whose names end in an alternate suffix. For example:

```text
platform.zsh##os.Darwin -> platform.zsh on macOS
platform.zsh##os.Linux  -> platform.zsh on Linux
```

The generated symlink is intentionally not tracked. Edit either the symlink or
its selected source file, then use `yadm status` to see the managed source that
changed. Keep settings shared unless they genuinely differ by operating system.

## Daily workflow

Inspect and commit a change:

```sh
yadm status
yadm diff
yadm add ~/.config/zsh/.zshrc
yadm diff --cached
yadm commit -m "Describe the change"
yadm push
```

Receive changes made on another machine:

```sh
yadm pull --ff-only
yadm alt
DOTFILES_BOOTSTRAP_DRY_RUN=1 yadm bootstrap
yadm bootstrap
```

List every managed file:

```sh
yadm list -a
```

Do not track GitHub tokens, `~/.config/gh/hosts.yml`, SSH private keys, or other
credentials in this public repository.
