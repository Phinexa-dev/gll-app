// lib/data/local/map_custom_style.dart

const String mapStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [{"color": "#f5f5f5"}]
  },
  {
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#cdd6da"},
      {"saturation": -30},
      {"weight": 1.5}
    ]
  },
  {
    "elementType": "geometry.stroke",
    "stylers": [{"visibility": "on"}]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": 5},
      {"visibility": "off"}
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#616161"}]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [{"color": "#f5f5f5"}]
  },

  // (other administrative / POI / road styles…)

  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [{"color": "#ffffff"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [{"color": "#dadada"}]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [{"color": "#e5e5e5"}]
  },

  // ─── WATER OVERRIDES ────────────────────────────────────
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#ffffff" },
      { "visibility": "on" }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.stroke",
    "stylers": [
      { "color": "#ffffff" },
      { "visibility": "on" }
    ]
  },
  {
    "featureType": "water",
    "elementType": "all",
    "stylers": [
      { "color": "#ffffff" },
      { "visibility": "on" }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels",
    "stylers": [
      { "visibility": "off" }
    ]
  }
]
''';
