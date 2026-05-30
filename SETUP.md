# Setup Guide

A complete guide for installing and configuring this terminal environment on macOS and Linux.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [macOS](#macos)
    - [Install Homebrew](#install-homebrew)
    - [Install Required Packages](#install-required-packages)
    - [Install Ghostty](#install-ghostty)
    - [Install JetBrains Mono Nerd Font](#install-jetbrains-mono-nerd-font)
    - [Install Oh My Zsh](#install-oh-my-zsh)
    - [Install Zsh Plugins](#install-zsh-plugins)
    - [Install fzf Keybindings](#install-fzf-keybindings)
    - [Install NVM](#install-nvm)
  - [Linux](#linux)
    - [Ubuntu / Debian](#ubuntu--debian)
    - [Install Starship](#install-starship)
    - [Install eza](#install-eza)
    - [Install bat](#install-bat)
    - [Install zoxide](#install-zoxide)
    - [Install lazygit](#install-lazygit)
    - [Install Fastfetch](#install-fastfetch)
    - [Install Oh My Zsh](#install-oh-my-zsh-1)
    - [Install zsh-autosuggestions](#install-zsh-autosuggestions-1)
    - [Install zsh-syntax-highlighting](#install-zsh-syntax-highlighting-1)
    - [Install NVM](#install-nvm-1)
- [Local Configuration](#local-configuration)
- [Configuration](#configuration)
  - [Clone Repository](#clone-repository)
  - [Backup Existing Files](#backup-existing-files)
  - [Install Configuration Files](#install-configuration-files)
    - [Zsh](#zsh)
    - [tmux](#tmux-1)
    - [Starship](#starship)
    - [Fastfetch](#fastfetch)
    - [btop](#btop)
    - [htop](#htop)
    - [Ghostty](#ghostty)
- [Features](#features)
  - [Shell](#shell)
  - [Terminal](#terminal)
  - [tmux](#tmux)
  - [CLI Tools](#cli-tools)
    - [eza](#eza-1)
    - [bat](#bat-1)
    - [lazygit](#lazygit-1)
    - [btop](#btop-1)
    - [htop](#htop-1)
    - [Fastfetch](#fastfetch-1)
- [Troubleshooting](#troubleshooting)
- [Post Installation](#post-installation)

## Prerequisites

Before installing, ensure you have:

- Git
- Zsh
- curl or wget
- A Nerd Font

Recommended font:

```text
JetBrainsMono Nerd Font
```

## Installation

### macOS

#### Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Install Required Packages

```bash
brew install \
git \
tmux \
starship \
eza \
bat \
fzf \
zoxide \
ripgrep \
fd \
btop \
htop \
lazygit \
fastfetch \
nvm
```

#### Install Ghostty

```bash
brew install --cask ghostty
```

#### Install JetBrains Mono Nerd Font

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

#### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Install Zsh Plugins

##### zsh-autosuggestions

```bash
brew install zsh-autosuggestions
```

##### zsh-syntax-highlighting

```bash
brew install zsh-syntax-highlighting
```

#### Install fzf Keybindings

```bash
$(brew --prefix)/opt/fzf/install
```

#### Install NVM

```bash
mkdir ~/.nvm
nvm install --lts
```

### Linux

#### Ubuntu / Debian

```bash
sudo apt update

sudo apt install \
git \
tmux \
zsh \
ripgrep \
fd-find \
fzf \
curl \
wget \
btop
```

#### Install Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

#### Install eza

Follow the latest instructions:

https://github.com/eza-community/eza

#### Install bat

```bash
sudo apt install bat
```

#### Install zoxide

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

#### Install lazygit

Follow:

https://github.com/jesseduffield/lazygit

#### Install Fastfetch

```bash
sudo apt install fastfetch
```

#### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Install zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### Install zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### Install NVM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

```bash
nvm install --lts
```

## Local Configuration

Machine-specific settings such as:

- Custom PATH entries
- API keys
- Work-specific configuration
- OS-specific binaries
- Personal environment variables

must be added to `.zshrc.local`.

Create:

```bash
touch ~/.zshrc.local
```

and place machine-specific configuration there.

Example:

```zsh
# ~/.zshrc.local

export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.13/bin"

export OPENAI_API_KEY="..."

export COMPANY_VPN_CONFIG="..."
```

The main `.zshrc` automatically loads this file if it exists:

```zsh
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
```

## Configuration

### Clone Repository

```bash
git clone https://github.com/ArchieTansaria/dotfiles.git
cd dotfiles
```

### Backup Existing Files

```bash
mv ~/.zshrc ~/.zshrc.backup
mv ~/.tmux.conf ~/.tmux.conf.backup
```

### Install Configuration Files

#### Zsh

```bash
cp zsh/.zshrc ~/.zshrc
```

#### tmux

```bash
cp tmux/.tmux.conf ~/.tmux.conf
```

#### Starship

```bash
mkdir -p ~/.config

cp starship/starship.toml ~/.config/starship.toml
```

#### Fastfetch

```bash
mkdir -p ~/.config/fastfetch

cp -r fastfetch/* ~/.config/fastfetch/
```

#### btop

```bash
mkdir -p ~/.config/btop

cp -r btop/* ~/.config/btop/
```

#### htop

```bash
mkdir -p ~/.config/htop

cp -r htop/* ~/.config/htop/
```

#### Ghostty

```bash
mkdir -p ~/.config/ghostty

cp -r ghostty/* ~/.config/ghostty/
```

## Features

### Shell

- Oh My Zsh
- Shared command history
- Autosuggestions
- Syntax highlighting
- Lazy-loaded NVM
- Smart directory navigation with zoxide

### Terminal

- Ghostty
- JetBrains Mono Nerd Font
- Transparent background
- Blur effects
- Custom cursor styling

### tmux

- Automatic startup
- Mouse support
- Vi keybindings
- Session management aliases
- Current-directory aware splits

### CLI Tools

#### eza

Modern replacement for:

```bash
ls
```

#### bat

Modern replacement for:

```bash
cat
```

#### lazygit

Terminal Git UI.

#### btop

Modern resource monitor.

#### htop

Interactive process viewer.

#### Fastfetch

Custom system information dashboard.

## Troubleshooting

### Reload Zsh

```bash
source ~/.zshrc
```

### Reload tmux

```bash
tmux source-file ~/.tmux.conf
```

### Verify Node Installation

```bash
which node
which npm
```

Expected output:

```text
~/.nvm/versions/node/<version>/bin/node
~/.nvm/versions/node/<version>/bin/npm
```

### Verify Installed Tools

```bash
zsh --version
tmux -V
starship --version
eza --version
bat --version
fzf --version
zoxide --version
lazygit --version
btop --version
htop --version
fastfetch --version
node --version
npm --version
```

## Post Installation

Open a new terminal window.

Expected behavior:

- Ghostty loads with custom styling
- tmux starts automatically
- Starship prompt loads
- eza replaces ls
- bat replaces cat
- zoxide is available
- autosuggestions work
- syntax highlighting works
- NVM loads on demand
- Fastfetch configuration is available

Happy coding.
