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
- `prototypes/` holds exploratory landing redesigns and is **not** production: it
  sits outside `docs/`, so Pages never serves it. Never treat a prototype as the
  live landing, and never edit `docs/index.html` to match one without being asked.
- Root-level PDFs (`Gregory_Agapov_Resume.pdf`, `Gregory Agapov Results.pdf`) are
  reference material — useful for restoring details when an employer block was
  over-compressed.

## Resume prose

Before changing resume prose, role headings, skills grouping, certifications or
YAML positioning/targetProfiles, read `.codex/resume-writing.md`. It applies to
both drafts and matching landing content; keep RU/EN variants synchronized.

## Landing

`docs/` is the production GitHub Pages root; `docs/index.html` is the third derived
resume artifact. Before landing, PDF or share-card work, read `docs/AGENTS.md`.
Factual changes update both landing languages and affected stat cards alongside
both Markdown drafts.
