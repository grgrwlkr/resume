# CV Master Format

`cv.master.yaml` is the single source of truth for resume data in this workspace.

## Editing Rules

- Update `cv.master.yaml` first. Generated CV variants should never become the canonical source.
- Keep both Russian and English resume variants derived from the same source of truth so they do not drift apart.
- Keep facts separate from positioning. Use `experience`, `projects`, `skills`, `education`, and `certifications` for factual data. Use `positioning` and `targetProfiles` for narrative and emphasis.
- Prefer structured fields and tags over long prose. If a fact may need filtering later, store it as data, not as formatted copy.
- Do not invent missing details. Put uncertain or legacy-only data in `verification`.
- Keep each experience bullet atomic. One bullet should describe one outcome, responsibility, or proof point.
- Reuse existing IDs. If you rename an ID, update all references in `projects` and `targetProfiles`.

## Section Guide

- `metadata`: schema and source-document info.
- `basics`: name, location, contacts, links, languages, and canonical headline.
- `positioning`: reusable narrative blocks, leadership themes, and optional assessment-derived signals.
- `experience`: chronological work history with normalized dates, achievements, stacks, and tags.
- `projects`: reusable project slices that can be selected independently from the full role history.
- `skills`: grouped skill inventory for filtering and summary generation.
- `education`, `certifications`: formal background.
- `targetProfiles`: rules for generating role-specific CV variants.
- `verification`: explicit review queue for anything ambiguous or legacy-sensitive.

## Date Conventions

- Use `YYYY-MM` for known month-level dates.
- Use `unknown` when a role looked active in a legacy source but is not confirmed as current.
- Use `present` for a currently active role only when it is confirmed.
- Preserve legacy wording like `ongoing` only in supporting fields such as `legacyResumeEndLabel`.
- Generated public resume drafts should use present tense only for blocks with `end: present`; any block with a closed end date should be phrased in past tense, even if it sits under a still-active employer.

## Target Profile Conventions

- Keep profile-specific copy under `targetProfiles.<profileId>`.
- `preferredExperienceIds` should point to the roles that stay expanded in that variant.
- `supportingExperienceIds` are good supporting material but can be shortened.
- `optionalCompressedExperienceIds` are mainly for chronology and can be collapsed aggressively.
- `emphasisTags` and `mustIncludeThemes` drive selection and ordering logic for future generators.

## Verification Conventions

- If a value is factually present in a legacy source but should not be trusted blindly, store it once and mark it for review.
- Do not delete `verification` items until the fact is confirmed or intentionally retired.
