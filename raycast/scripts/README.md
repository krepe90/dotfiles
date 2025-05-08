# Raycast Scripts

> [!NOTE]  
> Add Script Directory 에 `~/dotfiles/raycast/scripts` 추가해서 사용

## move-mouse

멀티 모니터 환경에서 키보드 단축키만으로 마우스 포인터를 이동하기 위한 스크립트 모음.
Swift 코드를 그대로 스크립트 형태로 실행하면 반응속도가 느려서 빌드 후 bash 스크립트 파일 형태로 실행하도록 구성.

### usage

```shell
# 다음 모니터의 중앙으로 마우스 포인터를 이동
./move_mouse

# n번 모니터의 중앙으로 마우스 포인터를 이동
# 단 모니터의 번호는 1부터 시작
./move_mouse -m 1
```

### files

```
scripts
├── bin
│   └── move_mouse
├── src
│   └── move_mouse.swift
├── move-mouse-left.sh
└── move-mouse-right.sh
```

> `move-mouse-left.sh`, `move-mouse-right.sh` 가 실제 raycast script 파일.

### build

```bash
cd ./raycast/scripts

mkdir bin
swiftc -O ./src/move_mouse.swift -o ./bin/move_mouse
```
