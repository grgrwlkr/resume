# Resume Workspace

Data-driven resume system. `cv.master.yaml` is the canonical source of truth; the
two markdown drafts and the public landing are all derived from it. There is no
application code here — only resume content, generation rules, and one static landing.

```
cv.master.yaml                              # canonical facts (source of truth)
  ├── resume-examples/*.en.md               # derived draft (English)
  ├── resume-examples/*.ru.md               # derived draft (Russian)
  └── docs/index.html                       # derived single-file landing (RU/EN i18n)
        └── build-pdf.sh → dist/*.{ru,en}.pdf  # docs/ is the GitHub Pages publish root
```

## Source of truth & propagation

- Treat `cv.master.yaml` as the single source of truth for resume facts. Update it
  **first**; derived variants must never become the canonical source.
- After factual changes in `cv.master.yaml`, update **all three** derived artifacts:
  both `resume-examples/*.{en,ru}.md` drafts and `docs/index.html`.
- Keep the Russian and English variants in sync whenever dates, roles, projects,
  stack, or achievements change. Never edit only one language.
- When resume facts change (summary, roles, dates, metrics, stack, achievements,
  education, certifications), also update the landing: both RU and EN entries in the
  i18n dictionary, plus any affected stat cards in the Selected Impact / Ключевые
  результаты grid.
- When material updates change current scope, leadership level, or impact, refresh
  the top-level `Summary` / `Профиль` and `Selected Impact` / `Ключевые результаты`
  in both drafts (and the matching landing strings).
- Keep facts separate from positioning: factual updates belong in `cv.master.yaml`
  (`experience`, `projects`, `skills`, `education`, `certifications`); summary and
  emphasis belong in `positioning` / `targetProfiles` and the draft `Summary` blocks.

## Never invent

- Do not invent titles, dates, metrics, team sizes, stack details, or achievements.
- If a fact is incomplete, keep a visible placeholder in the drafts and record the
  missing detail in `cv.master.yaml` (e.g. under `verification`) instead of guessing.
  The same applies to the landing — never invent metrics or dates there either.

## File placement

- Assistant-authored resume drafts → `resume-examples/`.
- Assistant-authored analysis / reviews → `reviews/`.
- `ai/` is reserved for materials produced by other AIs — do not write there.
- Root-level PDFs (`Gregory_Agapov_Resume.pdf`, `Gregory Agapov Results.pdf`) are
  reference material — useful for restoring details when an employer block was
  over-compressed.

## Resume writing standards

- Keep public drafts ATS-friendly, concise, and outcome-focused.
- Prefer bullet structure `scope + action + result` over generic traits or vague claims.
- Keep `Summary` / `Профиль` to ~2-3 sentences (who you are, strongest combination,
  current focus) — not a chronological retelling.
- Order dated entries reverse-chronologically, newest first in each section.
- When an employer block is split into dated project/subrole blocks, omit the parent
  date line and keep dates only on the sub-blocks.
- Use present tense only for blocks whose end date is `present` / `настоящее время`;
  use past tense for every closed-end block, even when nested under an active employer.
- Format dated role headings as `Title, Project` when a project or subrole name exists.
- Keep recent leadership roles detailed; compress older supporting roles when space
  is tight. Very short roles (~2 months): a single line (`title | dates | stack`)
  without bullets.
- When `cv.master.yaml` gives an employer `alternativeName`, render
  `Primary (alternativeName)` in drafts (e.g. `Neotech (Paravan 2000)`).
- Skills: group stacks by current employer vs previous employers (not a flat
  backend/frontend split). Within each group keep `.NET` first and `SQL` second among
  backend items, `React` last among frontend items, and place `Kafka` / `RabbitMQ`
  under messaging.
- When certifications exist, add a `## Certifications` / `## Сертификации` section
  between Education and Languages in both drafts.

## Russian-language drafts

- Keep headings, placeholders, and narrative text in Russian.
- Allow English for brands, technology names, search-oriented role aliases in
  parentheses, and established product names when that wording is clearer than a
  forced translation.
- For role names, prefer `Русский title (English title)` when it improves
  searchability. Use the spelling `Team Lead` (not `Teamlead`).
- English drafts stay fully English; Russian drafts stay fully Russian. User-facing
  chat stays in Russian.

## Landing

- Lives in `docs/` because GitHub Pages ("Deploy from a branch") only publishes from
  `/ (root)` or `/docs`. `docs/.nojekyll` disables Jekyll so files are served verbatim.
- `docs/index.html` is a single-file bilingual (RU/EN) landing: pure HTML +
  Tailwind Play CDN + vanilla JS, no build step. Strings live in a `data-i18n` i18n
  dictionary; theme and language persist in `localStorage`.
- `docs/build-pdf.sh` renders it to A4 PDFs (`docs/dist/*.{en,ru}.pdf`) via headless
  Chrome using `?lang=<l>&theme=light&print=1`.
- Treat the landing as a third derived artifact alongside the two drafts — see the
  propagation rules above.
