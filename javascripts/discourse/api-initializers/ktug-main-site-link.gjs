// 머리글 오른쪽(검색 아이콘 앞)에 KTUG 메인 사이트로 가는 링크를 둔다.
// 주소는 테마 설정 main_site_url. 넓은 화면에서는 아이콘과 '메인 사이트' 글자, 좁은 화면에서는 아이콘만 보인다.
// 아이콘: Lucide(ISC 라이선스) house
import { htmlSafe } from "@ember/template";
import { apiInitializer } from "discourse/lib/api";

const HOUSE_ICON = htmlSafe(
  `<svg class="ktug-main-site-link__icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"/><path d="M3 10a2 2 0 0 1 .709-1.528l7-6a2 2 0 0 1 2.582 0l7 6A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>`
);

export default apiInitializer("1.8.0", (api) => {
  const url = settings.main_site_url;

  api.headerIcons.add(
    "ktug-main-site",
    <template>
      <li class="header-dropdown-toggle ktug-main-site-link">
        <a
          class="icon btn-flat"
          href={{url}}
          title="KTUG 메인 사이트로 가기"
          aria-label="KTUG 메인 사이트로 가기"
        >{{HOUSE_ICON}}<span class="ktug-main-site-link__label">메인 사이트</span></a>
      </li>
    </template>,
    { before: "search" }
  );
});
