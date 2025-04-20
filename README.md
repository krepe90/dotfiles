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

## Firefox

```bash
cd ~/Library/Application Support/Firefox/Profiles/{여기에 프로필 입력}/chrome
ln -s $HOME/dotfiles/firefox/userChrome.css ./userChrome.css
```
