# dotfiles

개인용 각종 설정 모음집

## init

```bash
cd ~/
git clone https://github.com/krepe90/dotfiles.git
```

## shell

### bash

```bash
echo source $HOME/dotfiles/bash/.bash_profile >> $HOME/.bash_profile
```

### zsh

TBD

## git

아래 내용을 `~/.gitconfig` 파일에 추가
(credential 및 gpg 등의 설정은 각 환경별로 각자 설정하기)

```
[include]
    path = ~/dotfiles/git/.gitconfig
```

## vim

```bash
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
```

## Firefox

```bash
cd ~/Library/Application Support/Firefox/Profiles/{여기에 프로필 입력}/chrome
ln -s $HOME/dotfiles/firefox/userChrome.css ./userChrome.css
```

## Claude Code

### settings

```bash
# claude code 설정 파일 symlink로 추가
ln -s ~/dotfiles/claude/settings.json ~/.claude/settings.json
```

### slash commands

[Claude Code: Custom slash commands](https://docs.anthropic.com/en/docs/claude-code/slash-commands#custom-slash-commands)

```bash
# 자주 사용하는 명령어 symlink로 추가
# claude code 내에서 `/{command}` 혹은 `/c:{command}` 형태로 사용 가능
# c는 common의 c (별로같기도...)
ln -s ~/dotfiles/claude/commands ~/.claude/commands/c
```

## mise

```bash
curl https://mise.run | sh
```

```bash
mise trust
mkdir -p ~/.config/mise
ln -s ~/dotfiles/mise/config.toml ~/.config/mise/config.toml
mise i
```

## ghostty

```bash
ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config
```
