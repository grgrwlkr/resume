# Team Lead Resume Publication Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build publish-ready Russian and English `Team Lead` resume drafts that follow the approved direct-send positioning, use only confirmed facts from `cv.master.yaml`, and remove all draft-state placeholders.

**Architecture:** Treat `cv.master.yaml` as the only factual authority. Rewrite the Russian draft first because it is the primary selling version, then sync the English draft from the approved Russian structure while preserving natural English phrasing. Validate each pass with cheap shell checks (`rg`, small `python3` snippets, `git diff`) instead of inventing new tooling.

**Tech Stack:** Markdown, YAML, Python 3, ripgrep, git, Cursor ReadFile/ReadLints tools

---

## File Map

- `cv.master.yaml` — canonical facts; modify only if genuinely new confirmed facts arrive during implementation
- `resume-examples/team-lead-resume-example.ru.md` — primary publish-ready Russian resume
- `resume-examples/team-lead-resume-example.en.md` — English mirror with the same facts and ordering
- `docs/superpowers/specs/2026-03-22-team-lead-resume-publication-design.md` — approved design spec; keep open while executing

No new source files are required. Validation is command-based.

### Task 1: Freeze Publication Baseline

**Files:**
- Modify: `resume-examples/team-lead-resume-example.ru.md`
- Modify: `resume-examples/team-lead-resume-example.en.md`
- Modify if needed: `cv.master.yaml`
- Test: `n/a` — use shell validation commands below

- [ ] **Step 1: Scan current drafts for publication blockers**

Run:

```bash
rg -n "подтвердить|Confirm official|TODO|draft|needs_review" "resume-examples/team-lead-resume-example.ru.md" "resume-examples/team-lead-resume-example.en.md" "cv.master.yaml"
```

Expected:
- public drafts show the certification placeholder or any other draft-state wording that must be removed
- `cv.master.yaml` may still contain `needs_review` notes; that is allowed because it is the internal source of truth

- [ ] **Step 2: Confirm which facts are already canonical**

Run:

```bash
rg -n "vk-donations-product|vk-soccom-platform|tinkoff-mentoring-team-lead|tinkoff-performance-review-team-lead|ge-smallworld-certified-developer" "cv.master.yaml"
```

Expected:
- all current `VK` / `Tinkoff` facts needed for the publication pass already exist in `cv.master.yaml`

- [ ] **Step 3: Decide certification handling before editing**

Implementation rule:
- if the exact public certificate wording is still unconfirmed, remove the certification section from both resume drafts entirely
- if the wording is confirmed during execution, update `cv.master.yaml` first and only then keep the certification section in the public drafts

- [ ] **Step 4: Apply the baseline cleanup**

Edit:
- remove placeholder certification wording from the Russian and English drafts, or remove the whole certification section if the wording stays unconfirmed
- remove any other explicit draft-state markers from public drafts
- update `cv.master.yaml` only if new confirmed facts were supplied after the spec was approved

- [ ] **Step 5: Re-run the blocker scan**

Run:

```bash
rg -n "подтвердить|Confirm official|TODO|draft" "resume-examples/team-lead-resume-example.ru.md" "resume-examples/team-lead-resume-example.en.md"
```

Expected:
- no matches in either public draft

- [ ] **Step 6: Commit**

```bash
git add "resume-examples/team-lead-resume-example.ru.md" "resume-examples/team-lead-resume-example.en.md" "cv.master.yaml"
git commit -m "chore: remove publication blockers from team lead resumes"
```

If `cv.master.yaml` did not change, omit it from `git add`.

### Task 2: Rewrite the Russian Top Block

**Files:**
- Modify: `resume-examples/team-lead-resume-example.ru.md`
- Test: `n/a` — use shell validation commands below

- [ ] **Step 1: Rewrite the headline and keep contacts compact**

Edit:
- use the headline `Руководитель команды (Team Lead)` unless the existing line already matches
- keep contacts to city/country, email, GitHub, LinkedIn
- do not add street address or legacy handles

- [ ] **Step 2: Rewrite `## Профиль` into 3-4 dense sentences**

Target content outline:
1. current `VK Donations` scope and `8` direct reports
2. strongest `SocCom` proof point with `3 teams`, `20 тыс. -> миллионы`, `40` sellers, `~3 млн` products
3. `Tinkoff` turnaround / mentoring signal
4. short hands-on credibility sentence grounded in delivery / architecture / backend / frontend / platform work

Do not include:
- a `Сильные стороны:` sentence
- generic self-labels without evidence
- a full career retelling
- wording that simply repeats a `Ключевые результаты` bullet verbatim

- [ ] **Step 3: Rewrite `## Ключевые результаты` to exactly 4 bullets**

The 4 bullets must cover exactly these proof points:
1. `VK Donations`
2. `VK SocCom scaling + seller integrations`
3. `Critical migration + client/platform modernization`, including the Hadoop shutdown deadline, incident response, `VKUI 35% -> 64%` on iOS, and `84%` on Android
4. `Tinkoff mentoring MVP + Performance Review turnaround`

- [ ] **Step 4: Verify the Russian top block shape**

Run:

```bash
python3 - <<'PY'
from pathlib import Path
text = Path("resume-examples/team-lead-resume-example.ru.md").read_text()
section = text.split("## Ключевые результаты", 1)[1].split("## Опыт работы", 1)[0]
bullets = [line for line in section.splitlines() if line.startswith("- ")]
print({"bullets": len(bullets), "items": bullets})
PY
```

Expected:
- `{'bullets': 4, ...}` with the four intended proof points

- [ ] **Step 5: Diff-check for repeated narrative**

Run:

```bash
git diff --word-diff -- "resume-examples/team-lead-resume-example.ru.md"
```

Expected:
- the top block is denser and shorter than before
- the phrase `Сильные стороны:` is gone
- the top block does not simply duplicate the first `VK` role paragraph word-for-word

- [ ] **Step 6: Commit**

```bash
git add "resume-examples/team-lead-resume-example.ru.md"
git commit -m "refactor: tighten russian resume top block"
```

### Task 3: Rewrite Russian Experience and Compression

**Files:**
- Modify: `resume-examples/team-lead-resume-example.ru.md`
- Test: `n/a` — use shell validation commands below

- [ ] **Step 1: Rework `VK Donations` to 4 bullets**

Each bullet should prove one thing only:
1. team scope and direct reports
2. rebrand + launch into `VK` profiles
3. monolith -> microservices acceleration through coordination with the migration team
4. audience reach / product-metric growth in cautious wording, without inventing a numeric `DAU/MAU` claim

- [ ] **Step 2: Rework `VK SocCom` to 4-5 bullets**

Required proof points:
1. platform-team scope plus cross-team leadership over `3 teams` and `3` extra backend engineers
2. goods scaling from `20 тыс.` to millions
3. `40` Ozon sellers, `~3 млн` imported products, `~1 млн` AdBlogger offers
4. critical recommendation migration under the Hadoop shutdown deadline
5. frontend unification / VKUI modernization, unless that proof is already sufficiently carried by the top block

Handling rule:
- replace bare internal wording like `K2` with a descriptive phrase, or drop the detail if it overloads the section

- [ ] **Step 3: Compress `Tinkoff` and legacy sections to the approved budgets**

Target budgets:
- Mentoring: `2-3` bullets
- Performance Review TL: `2-3` bullets
- Organization Structure Senior: `2` bullets
- Performance Review Middle: `1-2` bullets
- Neotech: `1-2` bullets
- CINIMEX / AISA: minimal supporting credibility only

Keep:
- leadership and people-growth signal in `Tinkoff`
- one clearly hands-on senior case
- reverse-engineering / enterprise depth in `Neotech`

- [ ] **Step 4: Verify the role sections are free of internal jargon**

Run:

```bash
rg -n "\\bK2\\b|\\bEKP\\b|\\bЕКП\\b|распильн" "resume-examples/team-lead-resume-example.ru.md"
```

Expected:
- no matches; internal abbreviations or slang should be removed or rewritten for an external reader

- [ ] **Step 5: Review the Russian experience diff**

Run:

```bash
git diff --word-diff -- "resume-examples/team-lead-resume-example.ru.md"
```

Expected:
- each bullet reads as `scope -> action -> result`
- the newest `VK` / `Tinkoff` years dominate by volume
- early roles no longer compete with current leadership narrative

- [ ] **Step 6: Commit**

```bash
git add "resume-examples/team-lead-resume-example.ru.md"
git commit -m "refactor: align russian experience with leadership narrative"
```

### Task 4: Rebalance Russian Skills and Footer Sections

**Files:**
- Modify: `resume-examples/team-lead-resume-example.ru.md`
- Test: `n/a` — use shell validation commands below

- [ ] **Step 1: Rebuild `## Навыки` into 5 role-aligned groups**

Use these groups:
- `Лидерство и delivery`
- `Архитектура и системы`
- `Бэкенд`
- `Фронтенд`
- `Платформа и данные`

Keep the content tight and market-relevant:
- leadership / mentoring / stakeholders / roadmap / cross-functional delivery
- monolith decomposition / microservices / DDD / CQRS / API
- PHP / Go / .NET / Java / SQL
- React / Angular / TypeScript / JavaScript
- Postgres / Docker / Kubernetes / CI/CD

- [ ] **Step 2: Remove or compress the legacy-heavy skill dump**

Implementation rule:
- deep legacy stack should stay in the experience bullets where it provides credibility
- it should not dominate a long standalone `Навыки` section

- [ ] **Step 3: Finalize footer sections**

Edit:
- keep `Образование` compact
- keep `Языки` compact
- keep `Сертификации` only if the wording is now confirmed and placeholder-free; otherwise omit the whole section

- [ ] **Step 4: Validate the Russian footer**

Run:

```bash
rg -n "подтвердить|TODO|General Electric \\| \\[подтвердить|Legacy и доменные технологии" "resume-examples/team-lead-resume-example.ru.md"
```

Expected:
- no placeholder text
- no oversized legacy skill bucket with the old wording

- [ ] **Step 5: Commit**

```bash
git add "resume-examples/team-lead-resume-example.ru.md"
git commit -m "refactor: rebalance russian skills and footer sections"
```

### Task 5: Sync the English Draft

**Files:**
- Modify: `resume-examples/team-lead-resume-example.en.md`
- Test: `n/a` — use shell validation commands below

- [ ] **Step 1: Mirror the Russian structure and role ordering**

Edit the English draft so it matches the Russian draft in:
- block order
- role order
- bullet budgets
- key proof points

Set the headline explicitly to:
- `Engineering Team Lead`

Allowed differences:
- natural English phrasing
- more concise summary wording
- localized handling of internal team names and abbreviations

- [ ] **Step 2: Rewrite `## Summary` and `## Selected Impact`**

Requirements:
- `Summary` stays sharp, not literal translation
- `Selected Impact` contains exactly `4` bullets, matching the Russian proof-point set

The 4 English proof points must cover exactly:
1. `VK Donations`
2. `VK SocCom scaling + seller integrations`
3. `Critical migration + client/platform modernization`, including the Hadoop shutdown deadline, incident response, `VKUI 35% -> 64%` on iOS, and `84%` on Android
4. `Tinkoff mentoring MVP + Performance Review turnaround`

- [ ] **Step 3: Rewrite English experience sections**

Requirements:
- `VK Donations` and `VK SocCom` mirror the Russian budgets and proofs
- remove or rewrite unexplained internal abbreviations (`K2`, `EKP`, etc.)
- keep `Tinkoff` / `Neotech` compressed the same way the Russian version is compressed

- [ ] **Step 4: Rebuild English skills and footer**

Requirements:
- keep the same role-aligned skill strategy as the Russian version
- do not leave the old certification placeholder
- do not keep an oversized `Legacy and Domain Technologies` dump if it fights the target role

- [ ] **Step 5: Validate the English draft**

Run:

```bash
python3 - <<'PY'
from pathlib import Path
text = Path("resume-examples/team-lead-resume-example.en.md").read_text()
section = text.split("## Selected Impact", 1)[1].split("## Work Experience", 1)[0]
bullets = [line for line in section.splitlines() if line.startswith("- ")]
print({"bullets": len(bullets), "items": bullets})
PY
```

Expected:
- `{'bullets': 4, ...}` with the four intended proof points

Run:

```bash
rg -n "Confirm official|TODO|\\bK2\\b|\\bEKP\\b" "resume-examples/team-lead-resume-example.en.md"
```

Expected:
- no matches

- [ ] **Step 6: Commit**

```bash
git add "resume-examples/team-lead-resume-example.en.md"
git commit -m "refactor: sync english team lead resume"
```

### Task 6: Final Cross-Version Verification

**Files:**
- Modify if needed: `resume-examples/team-lead-resume-example.ru.md`
- Modify if needed: `resume-examples/team-lead-resume-example.en.md`
- Test: `n/a` — use shell validation commands below

- [ ] **Step 1: Run the final blocker scan**

Run:

```bash
rg -n "подтвердить|Confirm official|TODO|\\bK2\\b|\\bEKP\\b|\\bЕКП\\b" "resume-examples/team-lead-resume-example.ru.md" "resume-examples/team-lead-resume-example.en.md"
```

Expected:
- no matches

- [ ] **Step 2: Run a numeric proof-point scan**

Run:

```bash
rg -n "8|20 тыс\\.|20K|40|3 млн|3M|1 млн|1M|35%|64%|84%" "resume-examples/team-lead-resume-example.ru.md" "resume-examples/team-lead-resume-example.en.md"
```

Expected:
- the main proof metrics appear in both drafts
- wording may differ, but the same factual story is still present

- [ ] **Step 3: Review both files against the spec**

Open side-by-side or read sequentially with the spec:
- `docs/superpowers/specs/2026-03-22-team-lead-resume-publication-design.md`
- `resume-examples/team-lead-resume-example.ru.md`
- `resume-examples/team-lead-resume-example.en.md`

Manual checklist:
- top block explains the profile in `6-10` seconds
- `Selected Impact` / `Ключевые результаты` has exactly `4` bullets in both versions
- `VK` and `Tinkoff` roles no longer repeat the same story across sections
- the newest `7-10` years dominate the space
- closed roles use past tense; present tense appears only in the current role
- employer-level blocks with subroles do not repeat a parent date range above the project blocks

- [ ] **Step 4: Review the final diff surface**

Run:

```bash
git status --short
git diff --stat -- "cv.master.yaml" "resume-examples/team-lead-resume-example.ru.md" "resume-examples/team-lead-resume-example.en.md"
git diff --word-diff -- "resume-examples/team-lead-resume-example.ru.md"
git diff --word-diff -- "resume-examples/team-lead-resume-example.en.md"
```

Expected:
- `git status --short` shows only the intended resume files, or no changes if all task-level work was already committed
- only the intended resume files changed, or the diff is empty because all task-level edits were already committed
- no unrelated workspace files were modified

- [ ] **Step 5: Use `@superpowers:verification-before-completion`**

Before claiming the pass is complete, run one last evidence-based verification pass. Do not rely on memory or on a quick skim.

- [ ] **Step 6: Commit final polish if needed**

```bash
git add "resume-examples/team-lead-resume-example.ru.md" "resume-examples/team-lead-resume-example.en.md" "cv.master.yaml"
git commit -m "refactor: finalize publish-ready team lead resumes"
```

If there are no final edits after verification, skip this commit.
