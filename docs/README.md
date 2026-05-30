# Gregory Agapov — Landing

Single-file bilingual (RU/EN) personal landing. Pure HTML + Tailwind Play CDN + vanilla JS. No build, no npm.

Lives in `docs/` so GitHub Pages can publish it (Pages "Deploy from a branch" only
serves from `/ (root)` or `/docs`). `docs/.nojekyll` disables Jekyll.

## Files

```
docs/
├── index.html             # everything: markup, styles, i18n dict, theme, reveal
├── README.md
├── build-pdf.sh           # renders index.html → dist/*.{en,ru}.pdf (headless Chrome)
├── .nojekyll              # serve files verbatim, no Jekyll processing
├── assets/
│   ├── portrait.jpg
│   ├── og.jpg             # 1200×630 social card
│   └── og-card.html       # source template for og.jpg
└── dist/
    ├── Gregory_Agapov_Resume.en.pdf
    └── Gregory_Agapov_Resume.ru.pdf
```

## Run locally

Just open the file:

```bash
open /Users/xawkay/Develop/resume/docs/index.html
```

Or serve it (recommended — some browsers block `localStorage` on `file://`):

```bash
cd /Users/xawkay/Develop/resume/docs
python3 -m http.server 8000
# → http://localhost:8000
```

## Deploy

### GitHub Pages (current)

The site already lives in `docs/` on `main` of `github.com/grgrwlkr/resume`. Enable it once:

```
Repo → Settings → Pages → Deploy from a branch → Branch: main / folder: /docs → Save
```

After that, every `git push` to `main` republishes. Default URL: `https://grgrwlkr.github.io/resume/`.

### Vercel / Netlify (alt)

Static, no framework — point the project's output/publish directory at `docs/`.

## Notes

- Theme (`theme`) and language (`lang`) persist in `localStorage`. First visit respects `prefers-color-scheme` and `navigator.language`.
- Tailwind dark mode is class-based; the pre-paint script in `<head>` sets the correct class before first render to avoid flicker.
- Fonts (Fraunces display + Hanken Grotesk body) load from Google Fonts. If embedding offline, swap to a local `@font-face`.
- `assets/og.jpg` is the 1200×630 social-share card, generated from `assets/og-card.html` via headless Chrome (see the render command in that file). Regenerate it when the hero copy changes.
- `og:url` / `canonical` / absolute `og:image` are commented out in `index.html` — fill them in with the real domain at deploy time.
