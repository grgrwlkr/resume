# Gregory Agapov — Landing

Single-file bilingual (RU/EN) personal landing. Pure HTML + Tailwind Play CDN + vanilla JS. No build, no npm.

## Files

```
landing/
├── index.html             # everything: markup, styles, i18n dict, theme, reveal
├── README.md
└── assets/
    └── portrait.jpg
```

## Run locally

Just open the file:

```bash
open /Users/xawkay/Documents/Resume/landing/index.html
```

Or serve it (recommended — some browsers block `localStorage` on `file://`):

```bash
cd /Users/xawkay/Documents/Resume/landing
python3 -m http.server 8000
# → http://localhost:8000
```

## Deploy

### GitHub Pages

```bash
cd /Users/xawkay/Documents/Resume/landing
git init && git add . && git commit -m "Initial landing"
git branch -M main
git remote add origin git@github.com:grgrwlkr/landing.git
git push -u origin main
# Repo → Settings → Pages → Deploy from branch: main / root
```

### Vercel

```bash
npx vercel --prod   # static project, no framework, output is the folder itself
```

### Netlify drop

Drag the `landing/` folder into the Netlify dashboard — done.

## Notes

- Theme (`theme`) and language (`lang`) persist in `localStorage`. First visit respects `prefers-color-scheme` and `navigator.language`.
- Tailwind dark mode is class-based; the pre-paint script in `<head>` sets the correct class before first render to avoid flicker.
- Inter is loaded from Google Fonts. If embedding offline, swap to a local `@font-face`.
