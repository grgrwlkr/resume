# Landing, PDF and share-card guidance

Paths below are relative to the repository root. Root AGENTS.md owns canonical facts, propagation and placement.

## Landing

- Lives in `docs/` because GitHub Pages ("Deploy from a branch") only publishes from
  `/ (root)` or `/docs`. `docs/.nojekyll` disables Jekyll so files are served verbatim.
- `docs/index.html` is a single-file bilingual (RU/EN) landing: pure HTML + inline
  CSS + vanilla JS, no build step, one light "studio" look (no theme toggle). Strings
  live in the `data-i18n` dictionary; lang persists in `localStorage`, mode
  (`?mode=comfort|sport`) does not — Comfort is the short recruiter view and the
  default, Sport the full spec sheet. Content shown in both modes has an i18n key in each.
- `docs/build-pdf.sh` renders it to A4 PDFs (`docs/dist/*.{en,ru}.pdf`) via headless
  Chrome using `?lang=<l>&print=1`, which shows the two designed A4 sheets in `#print`
  instead of the page.
- `docs/assets/og-card.html` is the source of the share image `docs/assets/og.jpg`
  (render command inside it); re-render it when the name, role or headline numbers change.
- The PDFs are a styled rendering of the landing, not a screenshot of the live site.
  Avoid page breaks that split a content block: when a block does not fit on the
  current page, push it whole to the next one. Verify the rendered PDF visually before
  claiming a layout fix works.
- Treat the landing as a third derived artifact alongside the two drafts — see the
  propagation rules above.
