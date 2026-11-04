// KTUG 첫 화면: 파란 환영 영역(사이트 이름, 소개 문구, 검색)과 게시판 카드.
// 최신 글 첫 화면(discovery.latest)에서만 보인다. Discourse 기본 환영 배너는 설정(enable welcome banner)에서 끈다.
// 게시판 주소와 색은 Discourse의 게시판 정보(site.categories)에서 slug로 찾는다.
// 아이콘: Lucide(ISC 라이선스) megaphone, message-circle-question-mark, list-checks
import Component from "@glimmer/component";
import { service } from "@ember/service";
import { htmlSafe } from "@ember/template";
import { apiInitializer } from "discourse/lib/api";

const BOARDS = [
  {
    slug: "ktug",
    name: "KTUG 마당",
    description: "TeX과 KTUG 관련 소식과 정보를 나눕니다.",
    icon: `<svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M11 6a13 13 0 0 0 8.4-2.8A1 1 0 0 1 21 4v12a1 1 0 0 1-1.6.8A13 13 0 0 0 11 14H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2z"/><path d="M6 14a12 12 0 0 0 2.4 7.2 2 2 0 0 0 3.2-2.4A8 8 0 0 1 10 14"/><path d="M8 6v8"/></svg>`,
  },
  {
    slug: "qna",
    name: "Q&A 마당",
    description: "TeX을 사용하며 궁금한 점을 묻고 답합니다.",
    icon: `<svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M2.992 16.342a2 2 0 0 1 .094 1.167l-1.065 3.29a1 1 0 0 0 1.236 1.168l3.413-.998a2 2 0 0 1 1.099.092 10 10 0 1 0-4.777-4.719"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><path d="M12 17h.01"/></svg>`,
  },
  {
    slug: "faq",
    name: "FAQ 마당",
    description: "TeX 관련 자주 묻는 질문과 답변을 모읍니다.",
    icon: `<svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M13 5h8"/><path d="M13 12h8"/><path d="M13 19h8"/><path d="m3 17 2 2 4-4"/><path d="m3 7 2 2 4-4"/></svg>`,
  },
];

class KtugHome extends Component {
  @service router;
  @service site;

  get show() {
    return this.router.currentRouteName === "discovery.latest";
  }

  get boards() {
    const categories = this.site.categories || [];
    return BOARDS.map((board) => {
      const category = categories.find((c) => c.slug === board.slug);
      return {
        ...board,
        // 게시판 설명을 Discourse에서 채우면 그 문구를 쓴다
        description: category?.description_text || board.description,
        url: category?.url || `/c/${board.slug}`,
        style: htmlSafe(`--board-color: #${category?.color || "1a6fb0"}`),
        iconHtml: htmlSafe(board.icon),
      };
    });
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
        <div class="ktug-boards">
          {{#each this.boards as |board|}}
            <a class="ktug-board" href={{board.url}} style={{board.style}}>
              <h3><span class="ktug-board__icon">{{board.iconHtml}}</span>{{board.name}}</h3>
              <p>{{board.description}}</p>
              <span class="ktug-board__more">게시판 보기 →</span>
            </a>
          {{/each}}
        </div>
      </section>
    {{/if}}
  </template>
}

export default apiInitializer("1.8.0", (api) => {
  // 상단 탭(list-controls) 바로 앞. 시안처럼 환영 영역이 탭 위에 오게 한다
  api.renderInOutlet("discovery-list-controls-above", KtugHome);
});
