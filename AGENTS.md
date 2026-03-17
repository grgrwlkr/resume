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
- This workspace should maintain both Russian and English resume versions.
- `cv.master.yaml` is the canonical source of truth for resume facts; derived resume drafts should stay aligned with it.
- Resume structures should list dated items from the oldest to the newest, including work history, projects, and other chronological sections.
- The `ai/` folder is reserved for answers from other AIs; assistant-authored outputs should live in root-level folders such as `resume-examples/` and `reviews/`.
