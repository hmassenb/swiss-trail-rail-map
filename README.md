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
- one-click overview filter reset for search, type, tag, time, sort, selected route, and backfill views
- cumulative map controls for hikes, trains, and saved routes
- live map legend with filtered hike, train, private, and currently drawn route counts
- total entries, hiking distance, train distance, and elevation gain
- complete-route and archive-health counts for backfilling older entries
- average route distance, best day distance, active days, and current metric window
- JSON backup status, backed-up route count, last export time, and entries changed since export
- previous-period comparison for hiking distance, hike count, and elevation gain when a bounded timeframe is selected
- adjustable hiking goals for the current filter/timeframe, with progress for distance, hike count, and elevation gain
- cumulative dated progress chart for hiking and train distance within the active filter/timeframe
- hikes-versus-trains comparison for distance share, counts, and average route length
- clickable daily activity calendars by year, with hike/train/mixed-day colors for the active filter/timeframe
- selected-route elevation profiles when GPX imports or clicked hike elevation lookups provide elevation samples
- route photo thumbnails and selected-route photo galleries with full-size photo links
- yearly distance, yearly elevation gain, and monthly distance summaries
- distance and elevation gain by tag in the overview summary
- route cards with name, caption, tags, duration, pace/speed, elevation, completeness badges, notes, distance, photos, and clicked waypoint coordinates
- overview backfill action to batch-recalculate elevation for visible hikes missing elevation
- map-page route selection that keeps the Hikes/Trains sidebar tab aligned with the selected saved route when no draft is active
- map-page status feedback when a saved route is selected
- completeness filtering for all, needs-backfill, or complete entries across metrics, map, and route cards
- sorting by date, recent updates, name, distance, or elevation
- filter-aware highlights for longest route, biggest climb, and most photos
- archive-health and trending-tag summaries for the current filter/timeframe
- estimated local archive size and photo payload size for the current filter/timeframe
- estimated canton coverage, clickable Swiss region coverage, and next uncovered cantons for the current filter/timeframe
- route-envelope summary for north/south/east/west span and altitude sample range
- clickable nearby curated towns, lakes, peaks, passes, huts, and stations touched by filtered routes
- feed-card route focusing on the cumulative map
- selected-route detail cards with metrics, tags, caption, coordinates, photo count, route-level JSON/GPX export, and name filtering
- route-level share links using `overview.html#route=...`
- map-page route deep links using `index.html#route=...`
- direct edit links from overview entries to `index.html?edit=...`
- single active place-search marker that clears when refitting to Switzerland
- place-search marker also clears when focusing a saved route
- main-map legend with saved hike/train counts, distances, and current draft distance
- map-page `Done` control to fit the map to saved routes in the active hike/train view
- map-page Hikes and Trains tabs with live saved-route counts
- map-page latest-saved snapshot with one-click zoom to recent entries
- map-page selected-route detail panel with completeness badges, key metrics, clickable photo thumbnails, and zoom/overview/edit/clear actions
- map-page backfill mode that keeps date, type, and tags after saving a new route
- scrollable logging sidebar with draggable, reversible, insertable, click-to-remove draft points and click-to-insert draft lines while drawing routes
- live draft metrics for routed distance, direct waypoint distance, point counts, elevation status, and last clicked coordinate
- saved-route action key and accessible per-route controls for zoom, overview, edit, copy, merge, live map split picker with clickable split markers, export, hike elevation recalculation, and delete
- map-page saved-route status filter with live counts for all, needs-info, complete, with-photos, and no-photo entries
- map-page saved-route filter reset for text, status, and sorting controls, disabled when already reset
- map-page storage note with estimated archive size, photo count, and photo payload size
- local autosave and restore for unsaved map-page route drafts
- unsaved-draft warnings before leaving the map page or clearing a route draft
- hidden private route notes that stay in private JSON backups and are excluded from public exports
- a backfill checklist for missing dates, duration, hike elevation, and photos
- overview-page JSON export/import controls for backups and moving the private archive between browsers
- overview-page public JSON export for the current filters, excluding notes, captions, photos, and private visibility
- fixed-name `public-routes.json` export for replacing the hosted public viewer dataset
- overview-page public publishing checklist for refreshing the hosted public viewer dataset
- read-only public viewer that loads cleaned public JSON exports without touching the private local browser archive
- overview-page CSV export for the currently visible route log
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

## Public Viewer

[Open the public viewer](https://hmassenb.github.io/swiss-trail-rail-map/public.html)

[Open the hosted public demo](https://hmassenb.github.io/swiss-trail-rail-map/public.html?data=public-routes.json)

Use this page for a read-only public or embedded view. It does not load your private browser archive. Preview it with `Load demo routes`, open the hosted demo above, or export a cleaned subset with `Export public JSON` on the overview page and load that file into the viewer. If you host the cleaned JSON file next to the app, you can open it directly with a data URL:

```html
<iframe
  src="https://hmassenb.github.io/swiss-trail-rail-map/public.html?data=public-routes.json"
  title="Swiss Trail and Rail Public Viewer"
  style="width: 100%; height: 800px; border: 0;">
</iframe>
```

GitHub does not render live iframes inside README files, but the snippets above can be embedded in a website page.

## Inputs

Routes are entered directly in the browser:

- Choose `Hike` or `Train`.
- Click the map to add waypoints.
- Or load a GPX track as a draft, then review its geometry and add metadata before saving.
- Searches, clicked points, GPX drafts, and imported routes are kept inside the Switzerland map bounds; imports outside Switzerland are skipped on both the map and overview pages.
- Add a route name, optional date, and optional notes.
- Add optional tags and duration. Elevation gain/loss is calculated automatically for hikes: GPX elevation is used locally when available, and clicked routes use an external elevation lookup.
- Reuse saved tag chips while entering routes to keep route categories consistent.
- Add an optional caption and route photos.
- Save the route.

The map page includes a `Quick post` checklist that updates while you fill in the route name, date, and clicked map points. Saved route cards and the top stats show completeness for missing date, duration, elevation, and photos. The saved-route list can be filtered by route text and sorted by date, recent edits, name, distance, or elevation.

Saved route cards can be clicked or focused with the keyboard to zoom the route on the map. Existing route cards can also be opened in the overview detail view, duplicated, merged into another same-type route, split into two route parts with a live map slider and clickable sample split markers that preview distance and geometry points before the edit is committed, exported as individual JSON or GPX files, or edited, which is useful when backfilling similar hikes or train rides from older years.

While a route is being drawn or loaded from GPX, the draft preview shows estimated distance, waypoint count, geometry point count, the latest clicked point, and GPX elevation gain when available. Unsaved route drafts are autosaved locally and restored when you reopen the map page, unless you are opening a specific route link or edit link.

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
- `privateNotes`: optional hidden notes for private context only
- `photos`: optional compressed image attachments stored with the route
- `waypoints`: the points clicked by the user
- `points`: the routed geometry displayed on the map
- `metrics`: computed routed distance, direct distance, waypoint count, and geometry point count

## Data Storage

Routes are saved in the browser's local storage. Data is therefore local to the browser and URL where the app is opened.

Unsaved route drafts are also saved in local browser storage while you work. They are cleared after you save or clear the route draft.

Use `Export JSON` on the map page or `Export JSON backup` on the overview page for private backups or to move routes to another browser/device. New JSON exports are versioned backup packages with export time, route count, saved timestamp, and the full `routes` array, including notes, private hidden notes, and compressed photos; filenames include the export date to avoid overwriting older backups. Older raw route-array backups still import. Use `Import GPX / JSON` on the map page, or `Import JSON` on the overview page, to restore or add routes. Use `Export CSV log` on the overview page when you want the currently filtered log in a spreadsheet.

Use `Export public JSON` on the overview page when you want a dated cleaned subset for a read-only embed or public map. Use `Export public-routes.json` when you want the fixed filename used by the hosted public viewer. Both public exports include only the currently visible routes and remove personal notes, hidden private notes, captions, photos, and private visibility while keeping route geometry, dates, tags, distance metrics, and elevation fields. Load the file in `public.html`, or host it as a static JSON file and open `public.html?data=public-routes.json`.

Photos are compressed before saving, then stored inside the route JSON as data URLs. This keeps the app static and GitHub Pages friendly, but browser storage is finite. Export JSON regularly if you attach many photos or backfill many years of hikes.

After a JSON export, the app records the backup time and route count in browser storage. The map and overview pages warn you when the current browser data has changed since the last export.

For manually clicked hike routes, the app sends sampled route coordinates to Open-Elevation during save to estimate elevation gain/loss and store profile samples for the overview. GPX elevation is used locally when present. Manual elevation fields are kept as an advanced override for old backfilled hikes or failed lookups.

## Publishing Public Routes

Use the private map and overview pages as your working archive. When you want to refresh the public embedded map:

1. Open the overview page and filter to the routes you want to publish.
2. Click `Export public-routes.json`.
3. Replace the repository file `public-routes.json` with the downloaded file.
4. Commit and push the replacement to GitHub.
5. Open `https://hmassenb.github.io/swiss-trail-rail-map/public.html?data=public-routes.json` after GitHub Pages redeploys.

This keeps the full private archive in browser storage while the hosted public viewer receives only the cleaned route geometry, dates, tags, distance metrics, and elevation fields.

The overview page also shows these publishing steps next to the export controls so the update workflow is visible while exporting the fixed public dataset.

## Map Services

The app uses public web services for:

- Leaflet map rendering
- OpenTopoMap and OpenStreetMap tiles
- Waymarked Trails hiking overlay
- OpenRailwayMap rail overlay
- BRouter route fitting
- OpenStreetMap Nominatim place search
- Open-Elevation hike elevation estimates

An internet connection is required for maps, routing, and search.

## Suggested Next Steps

To turn this into a more useful distance-tracking tool, the strongest remaining improvements would be:

1. Improve persistence
   - Keep local browser storage for privacy.
   - Consider optional GitHub Gist, JSON file, or small backend sync later if cross-device use becomes important.

2. Improve route editing
   - Snap new waypoints to nearby hiking paths or rail stations.
   - Add denser route geometry editing tools for moving or deleting saved-route geometry points.

3. Add exact geography summaries
   - Add map overlays or boundary data for more exact regional coverage.

4. Make optional sync safer
   - If cross-device use becomes important, add a private sync target with explicit import/export conflict handling.
   - Keep browser storage as the private working copy unless the sync target is intentionally enabled.
