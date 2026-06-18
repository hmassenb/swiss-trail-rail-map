# Swiss Trail & Rail Map

A personal web map for tracking completed hikes and train rides across Switzerland.

The app lets you add route waypoints on a topographic map, fit them to mapped paths or rail lines when routing is available, and save completed routes in your browser.

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

- all logged hikes and train rides on one overview map
- a searchable route log
- filters for hikes and trains
- total entries, hiking distance, train distance, and waypoint count
- each entry's name, date, notes, distance, and clicked waypoint coordinates

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
- Add a route name, optional date, and optional notes.
- Save the route.

The app stores:

- `name`: route title
- `type`: `hike` or `train`
- `date`: optional completion date
- `notes`: optional free text
- `waypoints`: the points clicked by the user
- `points`: the routed geometry displayed on the map

## Data Storage

Routes are saved in the browser's local storage. Data is therefore local to the browser and URL where the app is opened.

Use `Export JSON` for backups or to move routes to another browser/device. Use `Import GPX / JSON` to restore or add routes.

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

To turn this into a more useful distance-tracking tool, the strongest improvements would be:

1. Add explicit route metrics
   - Store routed distance, direct distance, elevation gain, elevation loss, and duration.
   - Show lifetime totals and yearly/monthly totals.

2. Add route categories and tags
   - Tags such as `with friends`, `solo`, `summer`, `winter`, `SBB`, `mountain`, `lake`, or canton names.
   - Filter the overview by tags.

3. Add GPX-first workflows
   - Import GPX files from Komoot, Strava, Garmin, SchweizMobil, or phone GPS recordings.
   - Prefer GPX geometry over clicked waypoints when available.

4. Improve persistence
   - Keep local browser storage for privacy.
   - Add a visible backup reminder.
   - Consider optional GitHub Gist, JSON file, or small backend sync later if cross-device use becomes important.

5. Add progress views
   - Calendar heatmap by date completed.
   - Distance by month/year.
   - Hikes versus trains comparison.
   - Longest routes and most visited regions.

6. Improve route editing
   - Drag waypoints after placing them.
   - Split or merge routes.
   - Duplicate a route and edit the copy.

7. Add geography summaries
   - Cantons visited.
   - Lakes, peaks, towns, and stations passed near a route.
   - Approximate bounding region and altitude range.

8. Add privacy modes
   - Private personal tracker using browser storage.
   - Public read-only export for embedding on a website.
   - Optional hidden notes that are not included in public export.
