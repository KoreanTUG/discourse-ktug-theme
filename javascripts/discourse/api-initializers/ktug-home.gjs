// KTUG 첫 화면: 파란 환영 영역(사이트 이름, 소개 문구, 검색).
// 최신 글 첫 화면(discovery.latest)에서만 보인다. Discourse 기본 환영 배너는 설정(enable welcome banner)에서 끈다.
// 공개 게시판이 KTUG 마당 하나뿐이라(2026-11-06 통합) 게시판 카드는 두지 않는다.
import Component from "@glimmer/component";
import { service } from "@ember/service";
import { apiInitializer } from "discourse/lib/api";

class KtugHome extends Component {
  @service router;

  get show() {
    return this.router.currentRouteName === "discovery.latest";
  }

  <template>
    {{#if this.show}}
      <section class="ktug-home">
        <div class="ktug-hero">
          <h1 class="ktug-hero__title">한글
            <span class="tex-logo" role="img" aria-label="TeX">T<span
                class="tex-logo-e"
              >e</span>X</span>
            사용자 모임</h1>
          <p class="ktug-hero__lead"><span
              class="tex-logo"
              role="img"
              aria-label="TeX"
            >T<span class="tex-logo-e">e</span>X</span>은 생각을 가장 정확하고
            아름답게 표현하는 사람들의 언어입니다.</p>
          <form class="ktug-hero__search" action="/search" method="get">
            <input
              type="search"
              name="q"
              placeholder="검색"
              aria-label="검색"
              autocomplete="off"
            />
          </form>
        </div>
      </section>
    {{/if}}
  </template>
}

export default apiInitializer("1.8.0", (api) => {
  // 상단 탭(list-controls) 바로 앞. 시안처럼 환영 영역이 탭 위에 오게 한다
  api.renderInOutlet("discovery-list-controls-above", KtugHome);
});
