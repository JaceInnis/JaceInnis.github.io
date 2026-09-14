# Portfolio Overhaul Plan

This document tracks the work needed to refresh the portfolio site while keeping the R Markdown source files as the source of truth and the `docs` directory as the published output.

## Implementation sequence

### Current phase

1. [x] Install the required R Markdown packages and verify that the existing site can render.
2. [x] Remove duplicated or obsolete generated output and keep `docs` as the single published directory.
3. [x] Add a reproducible render script for the retained R Markdown pages (`render_site.R`).
4. [x] Build the compact visualization gallery with ocean dynamics, shark tracking, GEE rasters, and topographic field cartography (`visualizations.Rmd`).
5. [x] Simplify and modernize navigation in `_site.yml` (Home, Projects dropdown for HAB & Shark modeling, Data Visualizations, About).
6. [x] Create modern responsive stylesheet `styles.css` with card layouts, hero header, and tag badges.
7. [x] Redesign homepage (`index.Rmd`) featuring the two primary projects and a link to the visualization gallery.
8. [x] Modernize About page (`aboutme.Rmd`) with responsive 2-column layout and core toolkit.
9. [x] Remove obsolete Dive logs, fieldwork surveys, unused images/documents, and unused HTML pages from the repository.

### Next phase

- Refine and finalize content in `DavosSixWeekPrediction.Rmd` / `Shellfish.Rmd` when ready.
- Add additional machine learning or telemetry case studies as they become available.

## Goals

- Give the homepage a clear introduction and a stronger visual hierarchy.
- Feature two machine-learning projects prominently on the homepage.
- Move the data visualizations into a dedicated gallery page.
- Make each gallery item scannable with an image, title, and one-sentence description.
- Rewrite the About page so it reflects Jace's current background, interests, and technical experience.
- Keep the site usable on phones, tablets, and large screens.

## Content decisions to confirm

- Confirm the two featured machine-learning projects:
  - HAB tracking/prediction using the existing neural network/LSTM project.
  - A new machine-learning project to be supplied later.
- Keep the new machine-learning project as the second featured homepage item until its title, image, description, and detail page are available.
- Confirm the current About page biography, location, education, employment, interests, and preferred contact links.
- Confirm the final project titles and one- or two-sentence summaries.
- Decide whether the homepage should also show a small secondary link to the dive, remote-data, and statistics projects, or leave those in navigation.

## About page

- Rewrite `aboutme.Rmd` with current biographical content rather than the dated 2022 paragraph.
- Use a responsive profile image with meaningful alt text and a sensible maximum width.
- Add a short section describing the intersection of marine science, statistics, spatial data, and machine learning.
- Add concise links for GitHub, email, resume, or other professional profiles that Jace wants public.
- Replace inline layout markup with a small reusable CSS layout where practical.
- Check spelling, grammar, accessibility, and mobile wrapping.

## Homepage

- Rewrite `index.Rmd` around two featured machine-learning project blocks.
- Give each featured project an image, title, short description, method label, and link to its full page.
- Use the existing shellfish toxicity and shark-tracking assets only after checking that each image is a useful representative thumbnail.
- Add a prominent button or link to the new visualization gallery page.
- Keep the homepage focused; avoid repeating every project that will be available through navigation or the gallery.
- Add a short supporting introduction that explains the portfolio's focus on marine science and quantitative analysis.
- Use semantic headings and accessible image alt text instead of relying on centered paragraphs and floating spans.

## Visualization gallery page

- Add a new source page, probably `visualizations.Rmd`, and generate `docs/visualizations.html`.
- Create one gallery entry for each visualization currently represented by a project page:
  - Ocean movement visualization: visualize ocean-current movement over time with animated spatial data.
  - Shark tracking visualization: show observed shark movement and tracking patterns through an interactive visualization.
  - Ocean variables: compare mapped ocean conditions and environmental variables collected from remote data sources.
- Decide whether Santa Lucia and Rancho El Potrero maps belong in this gallery or in a separate remote-data gallery.
- Give every entry a title, thumbnail, one-sentence description, and subject or dataset label.
- Remove the separate visualization project-page links from the gallery and navigation.
- Preserve any valuable source text or image references from the old visualization pages before removing them.
- Remove the obsolete visualization source files and generated HTML pages after the gallery replacement has been rendered and checked. The former `GEEvis`, `OceanMovment`, and `sharkvis` pages are now retired.
- Use a responsive CSS grid with stable image containers so mixed aspect ratios do not cause layout shifts.
- Preserve original images as source assets; do not make the browser load a multi-megabyte animation when a smaller preview will work.
- Prefer generated thumbnails or appropriately sized derivatives for large GIF/JPG/PNG files. Keep original assets only when they are still needed by the gallery or another retained page.
- Add `loading="lazy"` for below-the-fold gallery images and meaningful alt text for every image.
- Use responsive image attributes such as `srcset` and `sizes` when derivative files are available.
- Check animated GIF behavior, transparent PNG backgrounds, JPEG compression, and image cropping before publishing.

## Navigation and styling

- Add the visualization gallery to `_site.yml` with a clear label such as `Data visualizations`.
- Add a homepage link to the gallery that remains obvious on mobile.
- Keep full navigation entries for the two main machine-learning project pages.
- Remove navigation entries that point to the retired visualization project pages.
- Correct visible spelling and naming issues while touching navigation, including `Neural` and `Toxicity`.
- Review `styles.css` and add focused styles for featured projects, gallery cards, buttons, responsive images, and the About layout.
- Keep the existing Distill styling conventions unless a deliberate redesign is approved.
- Verify keyboard focus, color contrast, heading order, link purpose, and mobile navigation.

## Build and verification

- Confirm R, RStudio/Quarto-compatible tooling as needed, and the `distill` package are available.
- Use the render script from task 3 instead of relying on undocumented manual rendering steps.
- Install the packages used by the current source pages, including `ggplot2`, `lubridate`, `ggpubr`, `dplyr`, and `stringr`.
- On this Windows setup, use RStudio's bundled Pandoc path when rendering from a terminal.
- Render the changed R Markdown pages into `docs`.
- Check that all generated links and image paths work from the published `docs` directory.
- Open the homepage, About page, and visualization gallery at desktop and mobile widths.
- Check that large images do not create horizontal scrolling or excessive initial loading.
- Review the generated diff and make sure unrelated generated files are not changed accidentally.
- Run `git diff --check` and inspect the final working tree before committing.

## Git workflow

1. Make and review source changes locally.
2. Render the affected pages.
3. Test the local output and review the generated files.
4. Run `git status` and `git diff --check`.
5. Commit with a focused message, for example `Overhaul portfolio homepage and add visualization gallery`.
6. Push to `origin/main` only after the changes are reviewed.
7. Confirm the GitHub Pages deployment and check the live site.

## Acceptance criteria

- The homepage clearly prioritizes exactly two machine-learning projects.
- A visible gallery link leads to a dedicated visualization page.
- The gallery contains brief descriptions and image entries for the selected visualizations without requiring separate project pages.
- Images of different formats, dimensions, and file sizes display without distortion, layout jumping, or horizontal scrolling.
- The About page is current, readable, responsive, and accessible.
- Navigation is consistent across the source and generated pages.
- The rendered site passes the link, asset, visual, and Git checks above.