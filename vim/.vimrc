" vi 호환 모드 비활성화 (Vim 개선 기능 사용)
set nocompatible

" 파일 타입 감지 및 플러그인 활성화
if has('filetype')
  filetype indent plugin on
endif

" 문법 하이라이팅 활성화
if has('syntax')
  syntax on
endif

" --- 인코딩 ---
" 파일 인코딩을 UTF-8로 설정
set encoding=utf-8
set fileencoding=utf-8

" --- 필수 옵션 ---
" 숨겨진 버퍼 허용 (저장 없이 버퍼 전환 가능)
set hidden

" 향상된 명령줄 자동완성
set wildmenu

" 특정 파일 무시
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~

" 화면 마지막 줄에 부분 명령어 표시
set showcmd

" 검색어 하이라이트
set hlsearch

" 입력하면서 실시간 검색
set incsearch

" --- 사용성 옵션 ---
" smartcase 설정
set ignorecase
set smartcase

" 스크롤 시 여백 유지
set scrolloff=5
set sidescrolloff=5

" 자동 들여쓰기, 줄바꿈, 삽입 시작점에서 백스페이스 허용
set backspace=indent,eol,start

" 윗줄과 동일한 들여쓰기 유지
set autoindent

" 특정 이동 명령이 항상 줄의 첫 문자로 가지 않도록 설정
set nostartofline

" 마지막 줄에 커서 위치 표시
set ruler

" 상태바 항상 표시
set laststatus=2

" 저장되지 않은 변경사항으로 오류 대신 대화상자 표시
set confirm

" 오류 시 비프음 대신 시각적 벨 사용
set visualbell

" 시각적 벨의 터미널 코드 재설정
set t_vb=

" 마우스 사용 활성화
if has('mouse')
  set mouse=a
endif

" 왼쪽에 줄 번호 표시
set number

" 키코드는 빠르게 타임아웃하지만 매핑은 타임아웃하지 않음
set notimeout ttimeout ttimeoutlen=200

" --- 시각적 도우미 ---
" 현재 줄 하이라이트
set cursorline

" 80자 위치에 기준선 표시 (생각보다 별로라 비활성화)
" set colorcolumn=80

" 탭과 후행 공백 시각화
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣

" 짝 맞는 괄호 표시
set showmatch

" --- 들여쓰기 옵션 ---
" 탭 대신 4칸 공백 들여쓰기 설정
set shiftwidth=4
set softtabstop=4
set expandtab

" --- 들여쓰기 옵션 (특정 파일 타입) ---
" 특정 파일 타입에 대해 2칸 공백 사용
autocmd Filetype html,css,javascript,typescript,json,yaml,markdown setlocal shiftwidth=2 softtabstop=2 expandtab

" --- 키 매핑 ---
" Y를 D, C처럼 동작하도록 매핑 (줄 끝까지 복사)
map Y y$

" <C-L> (화면 다시 그리기)이 검색 하이라이트도 끄도록 매핑
nnoremap <C-L> :nohl<CR><C-L>
