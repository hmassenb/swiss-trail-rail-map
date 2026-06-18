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

GitHub does not render live iframes inside README files, but the snippet above can be embedded in a website page.

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
