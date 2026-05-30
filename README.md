# Terminal Config Reference

A reference document for my terminal environment, shell workflow, aliases, plugins, key bindings, and custom utilities.

## Preview

![Terminal Preview](./assets/terminal-preview.png)

## Table of Contents

- [Overview](#overview)
- [Shell Functions](#shell-functions)
  - [`cdf`](#cdf)
  - [`mkcd`](#mkcd)
  - [`cs`](#cs)
- [Key Bindings](#key-bindings)
  - [History Search](#history-search)
  - [Sudo Previous Command](#sudo-previous-command)
- [Plugins](#plugins)
  - [git](#git)
  - [z](#z)
  - [extract](#extract)
  - [sudo](#sudo)
  - [web-search](#web-search)
  - [fzf](#fzf)
- [Command Line Tools](#command-line-tools)
  - [eza](#eza)
  - [bat](#bat)
  - [zoxide](#zoxide)
  - [lazygit](#lazygit)
  - [btop](#btop)
- [Aliases](#aliases)
  - [Git](#git-1)
  - [Directory Navigation](#directory-navigation)
  - [Tmux](#tmux-1)
  - [Utilities](#utilities)
- [Tmux](#tmux)
  - [Session Management](#session-management)
- [Starship Prompt](#starship-prompt)
- [Command Highlighting](#command-highlighting)
- [Autosuggestions](#autosuggestions)
- [NVM](#nvm)
- [History Configuration](#history-configuration)
- [Common Commands](#common-commands)
- [Terminal Philosophy](#terminal-philosophy)

## Overview

This terminal environment is built around:

- Ghostty
- tmux
- Zsh
- Oh My Zsh
- Starship
- eza
- bat
- fzf
- zoxide
- lazygit
- btop
- NVM (lazy-loaded)

## Shell Functions

### `cdf`

Fuzzy-search for a directory and change into it.

#### Usage

```bash
cdf
```

Type part of a directory name, select it with `fzf`, and press Enter.

### `mkcd`

Create a directory and immediately enter it.

#### Usage

```bash
mkcd my-project
```

Equivalent to:

```bash
mkdir -p my-project && cd my-project
```

### `cs`

Change into a directory and immediately list its contents.

#### Usage

```bash
cs [directory] [flags]
```

Any flags starting with `-` are passed directly to `ls`.

#### Examples

```bash
cs my-project        # cd into my-project and list contents
cs ..                # cd up and list contents
cs ~/dev -la         # cd into ~/dev and list with -la flags
cs -la               # list current directory with -la flags
```

## Key Bindings

### History Search

#### `Ctrl + R`

Fuzzy-search command history using `fzf`.

#### Workflow

1. Press `Ctrl + R`
2. Start typing
3. Select a previous command
4. Press Enter

### Sudo Previous Command

#### `Esc Esc`

Provided by the Oh My Zsh sudo plugin.

Re-runs the previous command with sudo.

Example:

```bash
apt install docker
```

Press:

```text
Esc Esc
```

Becomes:

```bash
sudo apt install docker
```

## Plugins

```zsh
plugins=(
  git
  z
  extract
  sudo
  web-search
  fzf
)
```

### git

Provides Git aliases and shortcuts.

Examples:

```bash
gst
gco
gl
gp
```

### z

Jump to frequently used directories.

Example:

```bash
z projects
```

### extract

Extract many archive formats with a single command.

Example:

```bash
extract archive.zip
extract archive.tar.gz
```

### sudo

Quickly prepend commands with sudo.

Supports:

```text
Esc Esc
```

### web-search

Search the web directly from the terminal.

Examples:

```bash
google nextjs middleware
duckduckgo golang concurrency
```

### fzf

Provides fuzzy searching and history integration.

Examples:

```bash
Ctrl + R
cdf
```

## Command Line Tools

### eza

Modern replacement for `ls`.

#### Aliases

```bash
ls
ll
la
tree
```

#### Features

- Icons
- Git integration support
- Better formatting
- Improved readability

### bat

Modern replacement for `cat`.

#### Alias

```bash
cat
```

#### Features

- Syntax highlighting
- Git integration
- Line numbers

### zoxide

Smarter directory navigation.

#### Examples

```bash
z backend
z nextjs
z automation
```

Jumps to frequently used directories.

### lazygit

Terminal Git UI.

#### Alias

```bash
lg
```

### btop

Modern system monitor.

#### Alias

```bash
top
```

Displays:

- CPU usage
- Memory usage
- Disk activity
- Network activity
- Processes

## Aliases

### Git

| Alias | Command         |
| ----- | --------------- |
| `gs`  | `git status`    |
| `ga`  | `git add .`     |
| `gc`  | `git commit -m` |
| `gco` | `git checkout`  |
| `gpl` | `git pull`      |

### Directory Navigation

| Alias  | Command       |
| ------ | ------------- |
| `..`   | `cd ..`       |
| `...`  | `cd ../..`    |
| `....` | `cd ../../..` |
| `~`    | `cd ~`        |

### Tmux

| Alias | Command             |
| ----- | ------------------- |
| `ta`  | `tmux attach -t`    |
| `tls` | `tmux ls`           |
| `td`  | `tmux detach`       |
| `tk`  | `tmux kill-session` |
| `tn`  | `tmux new -s`       |

### Utilities

| Alias  | Command   |
| ------ | --------- |
| `cat`  | `bat`     |
| `top`  | `btop`    |
| `grep` | `rg`      |
| `lg`   | `lazygit` |

## Tmux

The terminal automatically launches tmux when opening a local shell including SSH sessions.

### Session Management

Create a session:

```bash
tn backend
```

Attach to a session:

```bash
ta backend
```

List sessions:

```bash
tls
```

## Starship Prompt

The shell prompt is powered by Starship.

Displays:

- Current directory
- Git branch
- Git status
- Node.js version
- Command success/failure state

## Command Highlighting

Powered by:

```text
zsh-syntax-highlighting
```

Behavior:

- Valid commands use the default terminal color
- Invalid commands are highlighted in muted red
- Paths are highlighted in blue
- Quoted strings use default text coloring

## Autosuggestions

Powered by:

```text
zsh-autosuggestions
```

Behavior:

- Shows suggestions based on command history
- Suggestions appear in muted gray
- Accept suggestions with the right arrow key

## NVM

Node Version Manager is configured with lazy loading.

NVM is only loaded when one of the following commands is first used:

```bash
node
npm
npx
nvm
```

This improves shell startup time.

## History Configuration

History is shared across terminal sessions.

Enabled features:

- Shared history
- Duplicate removal
- Duplicate expiration
- Ignore commands beginning with a space

History limits:

```text
HISTSIZE  = 10000
SAVEHIST  = 10000
```

## Common Commands

| Command       | Description              |
| ------------- | ------------------------ |
| `pwd`         | Print current directory  |
| `cd`          | Change directory         |
| `touch file`  | Create file              |
| `mkdir dir`   | Create directory         |
| `rm file`     | Remove file              |
| `cp src dest` | Copy file                |
| `mv src dest` | Move file                |
| `cat file`    | View file with bat       |
| `top`         | Open btop                |
| `lg`          | Open lazygit             |
| `ll`          | Detailed file listing    |
| `tree`        | Tree view of directories |

## Terminal Philosophy

This environment prioritizes:

- Fast startup
- Keyboard-first workflow
- Minimal visual clutter
- Modern CLI tooling
- Consistent aesthetics
- Efficient project navigation
- tmux-centered development
