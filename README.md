# Swiss Trail & Rail Map

A lightweight social route map for tracking and sharing completed hikes and train rides across Switzerland.

The app lets people add route waypoints on a topographic map, fit them to mapped paths or rail lines when routing is available, and save completed routes in the browser. Public entries are accumulated into a community overview map and feed.

This is currently a browser-local social prototype: public/community entries are shared within the same browser storage. A real multi-user deployment would need an authentication and database backend.

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
- filters for hikes, trains, visibility, tags, and timeframes
- cumulative map controls for hikes, trains, and private routes
- total entries, hiking distance, train distance, and elevation gain
- yearly and monthly distance summaries
- community feed cards with author, likes, captions, tags, duration, elevation, notes, distance, and clicked waypoint coordinates
- top contributors and trending tags for the current filter/timeframe
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
- Add a route name, hiker name, visibility, optional date, and optional notes.
- Add optional tags, duration, elevation gain, and elevation loss.
- Add an optional public feed caption.
- Save the route.

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
- `caption`: optional public feed caption
- `likes`: local community likes
- `waypoints`: the points clicked by the user
- `points`: the routed geometry displayed on the map
- `metrics`: computed routed distance, direct distance, waypoint count, and geometry point count

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
