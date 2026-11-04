# discourse-ktug-theme

한글텍사용자모임(KTUG) 포럼(Discourse)을 KTUG 사이트와 같은 색, 글꼴, 로고로 맞추는 테마.

- `about.json`: 테마 정보와 색 구성 "KTUG"(사이트 `_sass/_variables.scss`와 같은 색)
- `common/common.scss`: 글꼴, 헤더 모양
- `branding/`: 관리자 → 브랜딩에 올리는 로고 이미지(테마에 포함되지 않는다)
  - `ktug-logo.png`: logo(가로 로고, 높이 240px)
  - `ktug-logo-small.png`: logo small(정사각형, 240px)
  - `favicon.ico`: favicon(사이트와 같은 것)
  - 로고 원본은 ktug-main-site 저장소의 `_design/logo/`(TikZ)이고, `build.sh`가 `out/discourse/`에 만든다

## 설치

관리자 → 사용자 정의 → 테마 → 설치 → 기기에서 업로드(이 폴더를 zip으로 묶은 파일),
또는 git 저장소 주소로 설치한다. 설치 뒤 기본 테마로 지정하고, 색 구성 "KTUG"를 고른다.
