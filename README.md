# discourse-ktug-theme

한글텍사용자모임(KTUG) 포럼(Discourse)을 [KTUG 사이트](https://koreantug.github.io/ktug-main-site/)와 같은 색, 글꼴, 로고로 맞추는 테마.

- `about.json`: 테마 정보와 색 구성 "KTUG"(사이트 `_sass/_variables.scss`와 같은 색)
- `common/common.scss`: 글꼴, 헤더, 메뉴 정리, 첫 화면 스타일
- `javascripts/discourse/api-initializers/ktug-main-site-link.gjs`: 머리글의 '홈으로' 버튼(메인 사이트로 간다. 주소는 테마 설정 `main_site_url`, `settings.yml`)
- `javascripts/discourse/api-initializers/ktug-home.gjs`: 첫 화면(최신 글)의 파란 환영 영역(사이트 이름, 소개 문구, 검색)
  - 함께 바꿀 설정: `enable welcome banner` 끄기, `top menu`에서 `latest`를 맨 앞으로 모양
- `branding/`: 관리자 → 브랜딩에 올리는 로고 이미지(테마에 포함되지 않는다)
  - `ktug-logo.png`: logo(가로 로고, 높이 240px)
  - `ktug-logo-small.png`: logo small(정사각형, 240px)
  - `favicon.ico`: favicon(사이트와 같은 것)
  - 로고 원본은 ktug-main-site 저장소의 `_design/logo/`(TikZ)이고, `build.sh`가 `out/discourse/`에 만든다

## 설치

관리자 → 사용자 정의 → 테마 → 설치 → **git 저장소에서**를 고르고
`https://github.com/KoreanTUG/discourse-ktug-theme` 를 넣는다.
(또는 이 폴더를 zip으로 묶어 기기에서 업로드한다.) 설치 뒤 기본 테마로 지정하고, 색 구성 "KTUG"를 고른다.
