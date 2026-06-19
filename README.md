# Swiss Trail & Rail Map

A personal GitHub-hosted route diary for tracking completed hikes and train rides across Switzerland.

The app lets you add route waypoints on a topographic map, fit them to mapped paths or rail lines when routing is available, attach route photos, and save completed routes in the browser. New entries are private by default so you can backfill hikes and train routes from past years as your own log.

The app is fully static and works from GitHub Pages. Your route data and compressed photos live in your browser storage unless you export/import JSON backups. Optional public export and Supabase sync remain available if you later decide to share selected routes.

## Live Map

[Open the map](https://hmassenb.github.io/swiss-trail-rail-map/)

```html
<iframe
  src="https://hmassenb.github.io/swiss-trail-rail-map/"
  title="Swiss Trail and Rail Map"
  style="width: 100%; height: 800px; border: 0;">
</iframe>
```

## Overview Log

[Open the overview](https://hmassenb.github.io/swiss-trail-rail-map/overview.html)

The overview page reads the same saved route data as the map page and displays:

- one Switzerland-bounded overview map that opens on all completed hikes
- a searchable route log
- filters for hikes, trains, visibility, tags, and timeframes
- exact custom date ranges with `From` and `To` controls
- cumulative map controls for hikes, optional trains, and private routes
- live map legend with filtered hike, train, private, and currently drawn route counts
- total entries, hiking distance, train distance, and elevation gain
- average route distance, best day distance, active days, and current metric window
- previous-period comparison for hiking distance, hike count, and elevation gain when a bounded timeframe is selected
- adjustable hiking goals for the current filter/timeframe, with progress for distance, hike count, and elevation gain
- cumulative dated progress chart for hiking and train distance within the active filter/timeframe
- route photo thumbnails and selected-route photo galleries
- yearly and monthly distance summaries
- community feed cards with author, likes, captions, tags, duration, elevation, notes, distance, and clicked waypoint coordinates
- social activity sorting by recent updates, likes, comments, or route metrics
- filter-aware highlights for longest route, biggest climb, most liked, most discussed, and top contributor
- top contributors and trending tags for the current filter/timeframe
- estimated canton coverage for the current filter/timeframe
- feed-card route focusing on the cumulative map
- selected-route detail cards with metrics, tags, caption, coordinates, like, and contributor actions
- route-level share links using `overview.html#route=...`
- route comments in the selected-route detail card
- quick timeframe presets for 30 days, 90 days, this year, and all time
- custom timeframe metrics that update the feed, map, contributor summaries, tags, and dashboard cards together
- optional demo community routes to preview the cumulative social map before adding real entries

```html
<iframe
  src="https://hmassenb.github.io/swiss-trail-rail-map/overview.html"
  title="Swiss Trail and Rail Overview"
  style="width: 100%; height: 900px; border: 0;">
</iframe>
```

GitHub does not render live iframes inside README files, but the snippets above can be embedded in a website page.

## Inputs

Routes are entered directly in the browser:

- Choose `Hike` or `Train`.
- Click the map to add waypoints.
- Or load a GPX track as a draft, then review its geometry and add metadata before saving.
- Add a route name, hiker name, visibility, optional date, and optional notes.
- Add optional tags and duration. Elevation gain/loss is calculated automatically for hikes: GPX elevation is used locally when available, and clicked routes use an external elevation lookup.
- Add an optional caption and route photos.
- Save the route.

The map page includes a `Quick post` checklist that updates while you fill in the route name, date, visibility, and clicked map points.

Each route can store its own optional hiker name. There is no separate user profile setup.

The map page also includes `Cloud sync` controls. When Supabase sync is configured, newly saved public routes are pushed to the shared community table automatically; private routes are not pushed.

The app stores:

- `name`: route title
- `author`: hiker or contributor name
- `visibility`: `public` or `private`
- `type`: `hike` or `train`
- `date`: optional completion date
- `tags`: optional route categories
- `durationHours`: optional duration in hours
- `elevationGainM`: optional elevation gain in meters
- `elevationLossM`: optional elevation loss in meters
- `notes`: optional free text
- `caption`: optional route memory or caption
- `photos`: optional compressed image attachments stored with the route
- `likes`: local community likes
- `comments`: local route comments
- `waypoints`: the points clicked by the user
- `points`: the routed geometry displayed on the map
- `metrics`: computed routed distance, direct distance, waypoint count, and geometry point count

## Data Storage

Routes are saved in the browser's local storage. Data is therefore local to the browser and URL where the app is opened.

Use `Export JSON` for backups or to move routes to another browser/device. Use `Import GPX / JSON` to restore or add routes.

Photos are compressed before saving, then stored inside the route JSON as data URLs. This keeps the app static and GitHub Pages friendly, but browser storage is finite. Export JSON regularly if you attach many photos or backfill many years of hikes.

For manually clicked hike routes, the app sends sampled route coordinates to Open-Elevation during save to estimate elevation gain and loss. If that lookup fails, manually entered elevation values are used instead.

## Community Sharing

Without cloud sync, the community map can be shared by exchanging JSON packages:

- Contributors add public routes in their own browser.
- They use `Export community` or `Export public community`.
- Another user imports that `.json` file through `GPX / JSON community import`.
- Public routes from all imported packages are accumulated into the overview map and feed.

Private routes are excluded from the community export.

## Optional Cloud Sync

To make the community feed shared across browsers/users:

1. Create a Supabase project.
2. Run `supabase-schema.sql` in the Supabase SQL editor.
3. Copy the project URL and anon public key.
4. Open the app's `Overview` page.
5. Expand `Cloud sync` on either the map page or the overview page.
6. Paste the URL and anon key.
7. Use `Push public routes` and `Pull community`, or save new public routes from the map page to auto-push them.

The sync table stores each public route as JSON in `community_routes.payload`. Private routes are rejected by the table policies and are not pushed by the app. When cloud sync is configured, new public routes, likes, and comments are pushed back to the shared table automatically. Deleting a public/community route from the map page hides it on that browser so it does not reappear on the next cloud pull. True shared deletion should be added later with authenticated users.

## Map Services

The app uses public web services for:

- Leaflet map rendering
- OpenTopoMap and OpenStreetMap tiles
- Waymarked Trails hiking overlay
- OpenRailwayMap rail overlay
- BRouter route fitting
- OpenStreetMap Nominatim place search

An internet connection is required for maps, routing, and search.

## Suggested Next Steps

To turn this into a more useful distance-tracking tool, the strongest remaining improvements would be:

1. Add GPX-first workflows
   - Import GPX files from Komoot, Strava, Garmin, SchweizMobil, or phone GPS recordings.
   - Prefer GPX geometry over clicked waypoints when available.

2. Improve persistence
   - Keep local browser storage for privacy.
   - Add a visible backup reminder.
   - Consider optional GitHub Gist, JSON file, or small backend sync later if cross-device use becomes important.

3. Add richer progress views
   - Calendar heatmap by date completed.
   - Hikes versus trains comparison.
   - Longest routes and most visited regions.
   - Distance and elevation by tag.

4. Improve route editing
   - Drag waypoints after placing them.
   - Split or merge routes.
   - Duplicate a route and edit the copy.

5. Add geography summaries
   - Cantons visited.
   - Lakes, peaks, towns, and stations passed near a route.
   - Approximate bounding region and altitude range.

6. Add privacy modes
   - Private personal tracker using browser storage.
   - Public read-only export for embedding on a website.
   - Optional hidden notes that are not included in public export.
