# Joseph's Dotfiles

## Getting Started

### Prerequisites

Execute this command in order to execute dependencies:

```bash
sudo apt update
sudo apt install -y tmux git curl zsh zsh-syntax-highlighting xclip ripgrep libfuse2 direnv

```

Initialize git for Dotfiles following the procedure from [Atlassian](https://www.atlassian.com/git/tutorials/dotfiles):

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Then link the Dotfiles git to this repository:

```
source ~/.bashrc
config remote  add origin https://github.com/JosephPenaQuino/dotfiles.git
config checkout master
config branch --set-upstream-to=origin/master master
config pull origin master
```

### Directory structure

Execute the commands below:

```bash
mkdir -p ~/programs
mkdir -p ~/projects
```

### Installing Packages

#### NVM

https://github.com/nvm-sh/nvm?tab=readme-ov-file#git-install

Then check in https://nodejs.org/en and install the latest version

```bash
nvm install vX.Y.Z
```

#### Neovim

Based on [Neovim's repository](https://github.com/neovim/neovim/releases):

```bash
cd ~/programs
wget https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage nvim.appimage
chmod u+x nvim.appimage
sudo ln -s $HOME/programs/nvim.appimage /usr/local/bin/nvim
sudo ln -s $HOME/programs/nvim.appimage /usr/local/bin/v
```

Based on [packer's repository](https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#quickstart)

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then, open Neovim and run:
```
:PackerInstall
```

Finally, restart Neovim.


#### Alacritty

Follow the steps to install Alacritty from [repository](https://github.com/alacritty/alacritty/blob/master/INSTALL.md),
but clone the repository in `~/programs`

```bash
config submodule update --init --remote
# set as default
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50
sudo update-alternatives --config x-terminal-emulator
```

#### PYENV

Follow the steps to install PYENV from [repository](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation)

```bash
sudo apt install -y python3-notcurses libffi-dev libreadline-dev libssl-dev libsqlite3-dev python3-tk tk-dev lzma liblzma-dev libbz2-dev

pyenv install 3.12
pyenv global 3.12
```

#### Poetry

From [Poetry's documentation](https://python-poetry.org/docs/#installing-with-the-official-installer):

```
curl -sSL https://install.python-poetry.org | python -
```


#### Oh-my-zsh

Follow the steps to install oh-my-zsh from [repository](https://ohmyz.sh/#install)

- https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
- https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
- https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh

#### TMUX

This section is based on the [TMUX plugin manager repository](https://github.com/tmux-plugins/tpm).

Install tmux plugin manager:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```


Go to the TMUX file:

```
v ~/.tmux.conf
```

Execute <C-a><S-i> to install the plugins.

#### Fuzzy finder
In order to use the `zsh` fuzzy finder, you must clone their [repository](https://github.com/junegunn/fzf).
Remember, install `fzf` from the repository instead of using the apt source.
the repository version is higher than the apt source.


#### Latex

Install Perl and full-texlive

```bash
sudo apt install -y perl texlive-full
cargo install tree-sitter-cli # for nvim-treesitter with vimtex
```

Then, follow latexmk's [repository](https://www.cantab.net/users/johncollins/latexmk/index.html) to install it.

### Vale

From [Vale's documentation](https://vale.sh/docs/vale-cli/installation/):

```bash
sudo snap install vale
```

### Lazy git

Follow [doc](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#debian-and-ubuntu)
