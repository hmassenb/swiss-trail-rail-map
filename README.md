# Swiss Trail & Rail Map

A personal GitHub-hosted route diary for tracking completed hikes and train rides across Switzerland.

The app lets you add route waypoints on a topographic map, fit them to mapped paths or rail lines when routing is available, attach route photos, and save completed routes in the browser. New entries are private by default so you can backfill hikes and train routes from past years as your own log.

The app is fully static and works from GitHub Pages. Your route data and compressed photos live in your browser storage, so use JSON export/import as your backup and transfer workflow.

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

- one Switzerland-bounded overview map that opens on all saved hikes and train routes
- a searchable route log
- filters for hikes, trains, tags, and timeframes
- exact custom date ranges with `From` and `To` controls
- cumulative map controls for hikes, trains, and saved routes
- live map legend with filtered hike, train, private, and currently drawn route counts
- total entries, hiking distance, train distance, and elevation gain
- complete-route and archive-health counts for backfilling older entries
- average route distance, best day distance, active days, and current metric window
- previous-period comparison for hiking distance, hike count, and elevation gain when a bounded timeframe is selected
- adjustable hiking goals for the current filter/timeframe, with progress for distance, hike count, and elevation gain
- cumulative dated progress chart for hiking and train distance within the active filter/timeframe
- selected-route elevation profiles when GPX imports or clicked hike elevation lookups provide elevation samples
- route photo thumbnails and selected-route photo galleries
- yearly and monthly distance summaries
- route cards with name, caption, tags, duration, pace/speed, elevation, notes, distance, photos, and clicked waypoint coordinates
- sorting by date, recent updates, name, distance, or elevation
- filter-aware highlights for longest route, biggest climb, and most photos
- archive-health and trending-tag summaries for the current filter/timeframe
- estimated canton coverage for the current filter/timeframe
- feed-card route focusing on the cumulative map
- selected-route detail cards with metrics, tags, caption, coordinates, photo count, and name filtering
- route-level share links using `overview.html#route=...`
- direct edit links from overview entries to `index.html?edit=...`
- a backfill checklist for missing dates, duration, hike elevation, and photos
- quick timeframe presets for 30 days, 90 days, this year, and all time
- custom timeframe metrics that update the route log, map, name summaries, tags, and dashboard cards together
- optional demo routes to preview the tracker before adding real entries

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
- Searches, clicked points, GPX drafts, and imported routes are kept inside the Switzerland map bounds; imports outside Switzerland are skipped.
- Add a route name, optional date, and optional notes.
- Add optional tags and duration. Elevation gain/loss is calculated automatically for hikes: GPX elevation is used locally when available, and clicked routes use an external elevation lookup.
- Reuse saved tag chips while entering routes to keep route categories consistent.
- Add an optional caption and route photos.
- Save the route.

The map page includes a `Quick post` checklist that updates while you fill in the route name, date, and clicked map points. Saved route cards and the top stats show completeness for missing date, duration, elevation, and photos. The saved-route list can be filtered by route text and sorted by date, recent edits, name, distance, or elevation.

While a route is being drawn or loaded from GPX, the draft preview shows estimated distance, waypoint count, geometry point count, the latest clicked point, and GPX elevation gain when available.

The app stores:

- `name`: route title
- `visibility`: currently saved as `private` for personal tracking
- `type`: `hike` or `train`
- `date`: optional completion date
- `tags`: optional route categories
- `durationHours`: optional duration in hours
- `pace/speed`: calculated from route distance and duration in the app
- `elevationGainM`: optional elevation gain in meters
- `elevationLossM`: optional elevation loss in meters
- `notes`: optional free text
- `caption`: optional route memory or caption
- `photos`: optional compressed image attachments stored with the route
- `waypoints`: the points clicked by the user
- `points`: the routed geometry displayed on the map
- `metrics`: computed routed distance, direct distance, waypoint count, and geometry point count

## Data Storage

Routes are saved in the browser's local storage. Data is therefore local to the browser and URL where the app is opened.

Use `Export JSON` for backups or to move routes to another browser/device. Use `Import GPX / JSON` to restore or add routes.

Photos are compressed before saving, then stored inside the route JSON as data URLs. This keeps the app static and GitHub Pages friendly, but browser storage is finite. Export JSON regularly if you attach many photos or backfill many years of hikes.

After a JSON export, the app records the backup time and route count in browser storage. The map and overview pages warn you when the current browser data has changed since the last export.

For manually clicked hike routes, the app sends sampled route coordinates to Open-Elevation during save to estimate elevation gain/loss and store profile samples for the overview. If that lookup fails, manually entered elevation values are used instead.

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

6. Add optional publishing modes
   - Keep browser storage as the private working copy.
   - Generate a separate read-only export for embedding selected routes on a website.
   - Add optional hidden notes that are not included in any published export.
