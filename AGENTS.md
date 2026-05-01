## Learned User Preferences
- Prefer Russian in user-facing communication; use English for commit messages and code comments.
- Keep responses terse and casual.
- Avoid high-level hand-waving; provide concrete code or direct technical explanations immediately.
- Treat the user as an expert and optimize for accuracy, thoroughness, and strong arguments.
- Suggest proactive, non-obvious solutions when useful.
- Respect the user's Prettier formatting preferences when writing or editing code.
- Keep `Profile` / `Summary` to about 2-3 sentences (who you are, strongest combination, current focus), not a chronological retelling.

## Learned Workspace Facts
- This workspace is for building the user's resume.
- The workspace root contains older resume PDFs, including `Gregory_Agapov_Resume.pdf`, as reference material — useful for restoring details when employer blocks were over-compressed.
- `cv.master.yaml` is the canonical source of truth; update it before derived drafts, and refresh top-level Profile/Summary and Key Results/Selected Impact in both drafts when material experience changes.
- Keep Russian and English resume variants in sync when dates, roles, projects, stack, or achievements change.
- Resume structures list dated items newest to oldest; omit employer-level shared dates when dated project or subrole blocks sit underneath (keep dates on sub-blocks only).
- Past tense for closed end dates; present tense only for the active block (`present` / `настоящее время`).
- Role headings use `Title, Project` when a project or subrole exists; in Russian prefer `Русский title (English title)` and `Team Lead` spelling.
- Russian headings, placeholders, narrative in Russian; English for brands, tech names, search-oriented role aliases in parentheses, and established product names when clearer.
- Skills: prefer grouping stacks by current employer versus previous employers (not only flat backend/frontend); within each group keep `.NET` first and `SQL` second among backend items, `React` last among frontend items, and place `Kafka` / `RabbitMQ` under messaging when that layout is used.
- When `cv.master.yaml` gives `alternativeName` for an employer, render `Primary (alternativeName)` in drafts (e.g. Neotech and Paravan 2000).
- Very short roles (~2 months): prefer one line (title | dates | stack) without bullets; when certifications exist, add `## Certifications` / `## Сертификации` between Education and Languages in both drafts.
- Assistant-authored drafts go to `resume-examples/`, analysis to `reviews/`, `ai/` reserved for other AIs; keep `.cursor/hooks/state/continual-learning.json` and `continual-learning-index.json` tracked when the repo uses git.
- Public landing lives in `landing/` as a single-file `index.html` with bilingual i18n dictionary (`dict.ru` / `dict.en`) plus `assets/portrait.jpg` and a `README.md`. Treat it as a third derived artifact alongside the two resume drafts: when `cv.master.yaml` or the `resume-examples/*.md` change (summary, role, dates, metrics, stack, achievements, education, certifications), update both the RU and EN entries in the i18n dictionary and refresh the affected stat cards in the Selected Impact / Ключевые результаты grid. Never invent metrics or dates on the landing.
