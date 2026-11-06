// 머리글의 '홈으로' 버튼: KTUG 메인 사이트로 간다. '회원가입'·'로그인'과 같은 모양(btn-primary btn-small)으로
// 그 왼쪽에 둔다(headerButtons의 auth 앞). 로그인한 사용자에게는 검색·메뉴 아이콘 왼쪽에 보인다.
// 주소는 테마 설정 main_site_url(settings.yml).
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.8.0", (api) => {
  const url = settings.main_site_url;

  api.headerButtons.add(
    "ktug-main-site",
    <template>
      <a
        class="btn btn-primary btn-small ktug-main-site-button"
        href={{url}}
        title="KTUG 메인 사이트로 가기"
      >홈으로</a>
    </template>,
    { before: "auth" }
  );
});
