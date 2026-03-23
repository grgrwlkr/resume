## Learned User Preferences
- Prefer Russian in user-facing communication; use English for commit messages and code comments.
- Keep responses terse and casual.
- Avoid high-level hand-waving; provide concrete code or direct technical explanations immediately.
- Treat the user as an expert and optimize for accuracy, thoroughness, and strong arguments.
- Suggest proactive, non-obvious solutions when useful.
- Respect the user's Prettier formatting preferences when writing or editing code.

## Learned Workspace Facts
- This workspace is for building the user's resume.
- The workspace root already contains older resume PDFs that can be used as reference material.
- `cv.master.yaml` is the canonical source of truth for resume facts; update it before derived resume drafts.
- Keep Russian and English resume variants in sync when dates, roles, projects, stack, or achievements change.
- Resume structures should list dated items from the newest to the oldest, and employer-level blocks should omit a shared date line when dated project or subrole blocks are shown underneath; keep dates on the sub-blocks only.
- Resume blocks with a closed end date should use past tense; present tense is only for the currently active block with `present` / `настоящее время`.
- Resume role headings should use a `Title, Project` pattern when a project or subrole name exists; in Russian drafts, prefer `Русский title (English title)` and standardize on `Team Lead` spelling.
- Keep Russian resume headings, placeholders, and narrative text in Russian; use English only for brands, technology names, search-oriented role aliases in parentheses, and established project or product names when that wording is clearer.
- In resume skills sections, keep `.NET` first and `SQL` second in backend lists, place `React` last in frontend lists, and preserve `Kafka` / `RabbitMQ` under inter-service communication or messaging when that positioning is used.
- Material experience updates should trigger a review and refresh of the top-level `Profile` / `Summary` and `Key Results` / `Selected Impact` sections in both resume drafts.
- Assistant-authored resume drafts belong in `resume-examples/`, assistant-authored analysis belongs in `reviews/`, and `ai/` is reserved for materials produced by other AIs.
- Keep `.cursor/hooks/state/continual-learning.json` and `.cursor/hooks/state/continual-learning-index.json` in the project and tracked when the workspace is under git.
