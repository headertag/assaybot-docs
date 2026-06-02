# Index Exchange Developer Portal

Public documentation for **Assaybot**, Index Exchange's automated content-analysis
crawler. The site explains the bot to web publishers — its identity, network
sources, crawl behavior, data handling, and how to manage its access.

**Live:** <https://www.indexexchange.dev/bot.html>

## Why this setup

The goal is documentation that is **easy to edit and effortless to ship**:

- **Write Markdown, get a website.** Authors only touch plain Markdown files —
  no HTML, no front-end code.
- **Static and fast.** The site is pre-rendered to static HTML and served by a
  tiny container, so there's nothing to break at request time and pages load
  instantly.
- **Push to publish.** Editing a doc and pushing to `main` rebuilds and deploys
  the live site automatically in about a minute. No manual build or upload step.
- **Cheap to run.** The deployed image is ~21 MB and the host scales to zero
  when idle.

## How it works

```
Markdown (src/)  ──mdBook──▶  static HTML  ──Docker/nginx──▶  Fly.io
        ▲                                                        ▲
        └────────────  git push main → GitHub Actions  ──────────┘
```

- **[mdBook](https://rust-lang.github.io/mdBook/)** renders the Markdown in
  `src/` into a static HTML site.
- A multi-stage **Dockerfile** builds the site and serves it with **nginx**.
- **Fly.io** hosts the container.
- **GitHub Actions** rebuilds and deploys on every push to `main`.

## Editing content

1. Edit (or add) a Markdown file under `src/bot.html/`.
2. If you added a page, list it in `src/SUMMARY.md` (the table of contents).
3. Commit and **push to `main`**.

That's it — the change is live in ~1 minute. (Deploys trigger on pushes that
touch `src/`, `theme/`, or the build config. A push to any other branch does
not deploy; you can also trigger a deploy manually from the Actions tab or with
`gh workflow run deploy.yml`.)

## Preview locally

Install mdBook (a single binary — see the
[mdBook docs](https://rust-lang.github.io/mdBook/guide/installation.html)), then:

```bash
mdbook serve --open   # live-reloading preview at http://localhost:3000
```

To preview the exact production artifact (nginx serving the built site):

```bash
docker build -t assaybot-docs . && docker run --rm -p 8080:80 assaybot-docs
# http://localhost:8080
```

## Project layout

```
src/                     Markdown content (the only thing authors edit)
  SUMMARY.md             Table of contents / page order
  bot.html/              Documentation pages
    README.md            Landing page ("About Assaybot") -> served at /bot.html/
    *.md                 Individual chapters
  assets/                Images
  robots.txt             Crawl policy (permissive)
  llms.txt               Summary + links for AI/LLM crawlers
  sitemap.xml            Sitemap for search engines
theme/                   Site branding/customization
  index.hbs              Page template (logo, analytics tag)
  custom.css             Brand styling (hunter-green accent, header layout)
  favicon.png            Site icon
book.toml                mdBook configuration
Dockerfile               Build (mdBook) + serve (nginx)
nginx.conf               Static-file server config
fly.toml                 Fly.io app configuration
.github/workflows/       CI/CD: build + deploy on push to main
```

## Deployment

Deploys run automatically via GitHub Actions using a Fly deploy token stored as
the `FLY_API_TOKEN` repository secret. To deploy manually:

```bash
flyctl deploy
```

### Custom domain

The site is reachable at its `*.fly.dev` hostname and at the configured custom
domain. To add another domain:

```bash
flyctl certs add <your-domain>
```

Fly will print the DNS records to add; it issues the TLS certificate
automatically once they resolve.
