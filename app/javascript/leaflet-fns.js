// Higher order fn which returns a predicate function testing whether html_s
// is enclosed by <tag_str></tag_str> delimiters
const valid_row_fn = (tag_str) => (html_s) =>
    html_s.startsWith('<' + tag_str + '>') &&
    html_s.endsWith('</' + tag_str + '>');

// true iff html_s is a valid row header
const is_row_header = valid_row_fn('th');

// true iff html_s is a valid row content
const is_row_content = valid_row_fn('td');

// Higher order fn which returns a function that retrieves the text content
// in html_s enclosed between <tag_str></tag_str> delimiters
const get_row_fn = (tag_str) => (html_s) =>
    html_s.substring(html_s.indexOf('<' + tag_str + '>') +
                     ('<' + tag_str + '>').length,
                     html_s.indexOf('</' + tag_str + '>'));

// Takes an html string with <th>*</th> and returns *
const get_row_header = get_row_fn('th');

// Takes an html string with <td>*</td> and returns *
const get_row_content = get_row_fn('td');

// Takes an html string with <table>*</table> and returns *
const get_table = get_row_fn('table');

// Need function that takes (state, puma) pair and returns respective track
// in tracks
const get_track = (map, tracks, state, puma) => {
    const track_id = tracks[state]['metadata'][parseInt(puma)]['_leaflet_id'];
    return map['_layers'][track_id];
};

// Append new track to tracks, while also modifying format of track for easier
// retrieval later based on metadata
const append_track = (track, tracks) => {
    // Get metadata for tracks stored in HTML of associated popup
    const TRACK_LAYERS_METADATA =
          track.getLayers()[0]
               .getLayers()
               .map((l) =>
                    [get_table(l.getPopup().getContent()),
                     l['_leaflet_id']]);

    // Split HTML table string into array of arrays for table
    // entries
    const METADATA_ARRS =
          TRACK_LAYERS_METADATA.map(([s, leaflet_id]) =>
                                    [s
                                     .split('\n')
                                     .filter((s) =>
                                             is_row_header(s) ||
                                             is_row_content(s))
                                     .map((s) => is_row_header(s) ?
                                          get_row_header(s) :
                                          get_row_content(s)),
                                     leaflet_id]);


    // 2D arrays => array of equivalent objects
    const METADATA_OBJS =
          METADATA_ARRS.map(([arr, leaflet_id]) =>
                            {let m = arrs_to_obj(arr);
                             m['_leaflet_id'] = leaflet_id;
                             return m;});

    const TRACK_STATE_CODE = parseInt(METADATA_OBJS[0]['STATEFP10']);
    tracks[TRACK_STATE_CODE] = {'track': track,
                                'metadata':
                                METADATA_OBJS
                                .reduce((m, obj) => {
                                    m[parseInt(obj['PUMACE10'])] = obj;
                                    return m;}, {})};
}

// 2D array => equivalent object
const arrs_to_obj = (arr) => [...arr.keys()].reduce((m, i) => {
    if (i % 2)
        m[arr[i-1]] = arr[i];
    return m;}, {});

// True iff obj has a getCenter method defined
const has_center = (obj) => typeof obj['getCenter'] !== 'undefined';

// Gets center of possibly nested track
const get_center = (track) => {
    if (has_center(track))
        return track.getCenter();
    else
        return Object.entries(track
                              ._layers)
                              .map(([k, v]) =>
                                   v.getCenter())
                              .reduce((acc, {lat, lng}, index, arr) => {
                                      acc['lat'] += lat;
                                      acc['lng'] += lng;
                                      if (index === arr.length - 1) {
                                          acc['lat'] /= arr.length;
                                          acc['lng'] /= arr.length;
                                      }
                                      return acc;},
                                      {'lat': 0, 'lng': 0});
}

// Returns a Feature Point from the respective tracks associated with
// src_track_id and dest_track_id, from the former to the latter
const tracks_to_feature = (src_track, dest_track) => {
    return {
    "type": "Feature",
    "geometry": {
        "type": "Point",
        "coordinates": {
            "lat": get_center(src_track)['lat'],
            "lng": get_center(src_track)['lng']
        }
    },
    "properties": {
        "origin_id": src_track['_leaflet_id'],
        "origin_country": "USA",
        "origin_lat": get_center(src_track)['lat'],
        "origin_lng": get_center(src_track)['lng'],
        "destination_id": dest_track['_leaflet_id'],
        "destination_country": "USA",
        "destination_lat": get_center(dest_track)['lat'],
        "destination_lng": get_center(dest_track)['lng']
    }
    }};

const add_flow_map_layer = (map, geo_json_feature_collection) =>
    L.canvasFlowmapLayer(geo_json_feature_collection, {
        originAndDestinationFieldIds: {
            originUniqueIdField: 'origin_id',
            originGeometry: {
                x: 'origin_lng',
                y: 'origin_lat'
            },
            destinationUniqueIdField: 'destination_id',
            destinationGeometry: {
                x: 'destination_lng',
                y: 'destination_lat'
            }
        },

        // some custom options
        style: (geoJsonFeature) => {
            // use leaflet's path styling options

            // since the GeoJSON feature properties are modified by the layer,
            // developers can rely on the "isOrigin" property to set
            // different symbols for origin vs destination CircleMarker
            // stylings
            if (geoJsonFeature.properties.isOrigin) {
                return {
                    renderer: L.canvas(),
                    radius: 7,
                    weight: 2,
                    color: 'rgb(195, 255, 62)',
                    fillColor: 'rgba(195, 255, 62, 0.6)',
                    fillOpacity: 0.8
                };
            } else {
                return {
                    renderer: L.canvas(),
                    radius: 6,
                    weight: 0.5,
                    color: 'rgb(17, 142, 170)',
                    fillColor: 'rgb(17, 142, 170)',
                    fillOpacity: 0.7
                };
            }
        },
        canvasBezierStyle: {
            type: 'simple',
            symbol: {
                strokeStyle: 'rgba(217, 108, 26, 0.9)',
                shadowBlur: 1.5,
                lineWidth: 1.8,
                shadowColor: 'rgb(207, 66, 17)',
                lineCap: 'round'
            }
        },
        animationStarted: false,
        animationEasingFamily: 'Cubic',
        animationEasingType: 'In',
        animationDuration: 2000
    }).addTo(map);

// Draw line from dest->src on map
const draw_connection =
      (map, tracks, dest_state, dest_puma, src_state, src_puma) => {
          const src_track = get_track(map, tracks, src_state, src_puma);
          const dest_track = get_track(map, tracks, dest_state, dest_puma);

          let geo_json_feature_collection = {
              "type": "FeatureCollection",
              "features": [
                  tracks_to_feature(src_track, dest_track)
              ]
          };

          return add_flow_map_layer(map, geo_json_feature_collection);
      };



// leaflet initialization function for creating/rendering map with kml layers
const start_leaflet = async (map_state) => {
    let map = L.map('map').setView([38.635, -100.200], 3);
    let tracks = {};

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution:
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
        maxZoom: 18,
        id: 'mapbox/streets-v11',
        tileSize: 512,
        zoomOffset: -1,
    }).addTo(map);


    let kmls = $('#kmls-arr-id').data('kmls');
    let timeout_q = 0;

    let set_q_delta = 50;
    let reset_time = 110;

    let track_style = {color: '#049660', fillColor: 'green',
                       opacity: 0.2, fillOpacity: 0.2};

    const parser = new DOMParser();

    let promises = kmls.map(e => {
        return new Promise((resolve, reject) => {
        setTimeout(() => {
            let track_added = false;
            fetch(e)
                .then(res => res.text())
                .then(kmltext => {
                    // Create new kml overlay
                    const kml = parser.parseFromString(kmltext, 'text/xml');
                    const track = new L.KML(kml);
                    track.setStyle(track_style);
                    map.addLayer(track);
                    append_track(track, tracks);

                    // Used to prevent track from being set twice in the event
                    // of an error
                    track_added = true;

                    if (Object.keys(tracks).length > 51) {
                        console.log("tracks: ");
                        console.log(tracks);
                        console.log("map: ");
                        console.log(map);
                    }

                    resolve(map);
                })
                .catch(err => {
                    setTimeout(() => {
                        fetch(e)
                            .then(res => res.text())
                            .then(kmltext => {
                                if (!track_added) {
                                    // Create new kml overlay
                                    const kml =
                                          parser
                                          .parseFromString(kmltext,
                                                           'text/xml');
                                    const track = new L.KML(kml);
                                    track.setStyle(track_style);
                                    map.addLayer(track);
                                    append_track(track, tracks);
                                }

                                if (Object.keys(tracks).length > 51) {
                                    console.log("tracks: ");
                                    console.log(tracks);
                                    console.log("map: ");
                                    console.log(map);
                                    let geoJsonFeatureCollection = {
                                        "type": "FeatureCollection",
                                        "features":[
                                            {
                                                "type": "Feature",
                                                "geometry": {
                                                    "type": "Point",
                                                    "coordinates": {
                                                        "lat": 18.0918165,
                                                        "lng": -66.6043598068824
                                                    }
                                                },
                                                "properties": {
                                                    "origin_id": 41,
                                                    "origin_country": "USA",
                                                    "destination_lat": 18.251952013996252,
                                                    "destination_lng": -65.54870650000001,
                                                    "destination_id": 44,
                                                    "origin_lat": 18.0918165,
                                                    "origin_lng": -66.6043598068824
                                                }
                                            }
                                        ]
                                    };

                                    let exampleFlowmapLayer =
                                        L.canvasFlowmapLayer(geoJsonFeatureCollection, {
                                            originAndDestinationFieldIds: {
                                                originUniqueIdField: 'origin_id',
                                                originGeometry: {
                                                    x: 'origin_lng',
                                                    y: 'origin_lat'
                                                },
                                                destinationUniqueIdField: 'destination_id',
                                                destinationGeometry: {
                                                    x: 'destination_lng',
                                                    y: 'destination_lat'
                                                }
                                            },

                                            // some custom options
                                            style: (geoJsonFeature) => {
                                                // use leaflet's path styling options

                                                // since the GeoJSON feature properties are modified by the layer,
                                                // developers can rely on the "isOrigin" property to set different
                                                // symbols for origin vs destination CircleMarker stylings
                                                if (geoJsonFeature.properties.isOrigin) {
                                                    return {
                                                        renderer: L.canvas(),
                                                        radius: 7,
                                                        weight: 2,
                                                        color: 'rgb(195, 255, 62)',
                                                        fillColor: 'rgba(195, 255, 62, 0.6)',
                                                        fillOpacity: 0.8
                                                    };
                                                } else {
                                                    return {
                                                        renderer: L.canvas(),
                                                        radius: 6,
                                                        weight: 0.5,
                                                        color: 'rgb(17, 142, 170)',
                                                        fillColor: 'rgb(17, 142, 170)',
                                                        fillOpacity: 0.7
                                                    };
                                                }
                                            },
                                            canvasBezierStyle: {
                                                type: 'simple',
                                                symbol: {
                                                    strokeStyle: 'rgba(217, 108, 26, 0.9)',
                                                    shadowBlur: 1.5,
                                                    lineWidth: 1.8,
                                                    shadowColor: 'rgb(207, 66, 17)',
                                                    lineCap: 'round'
                                                }
                                            },
                                            animationStarted: true,
                                            animationEasingFamily: 'Cubic',
                                            animationEasingType: 'In',
                                            animationDuration: 2000
                                        }).addTo(map);
                                }
                                console.log(err);
                                console.log(`Reset! for ${e}`);

                                resolve(map);
                            })
                    }, (reset_time += 30))
                })
        }, timeout_q += (set_q_delta > 0 ? set_q_delta-- : 1))
        })
    });

    map_state['map'] = map;
    map_state['tracks'] = tracks;
    return Promise.all(promises);
}

// Remove all existing connections from map_state
const reset_connections = (map_state) => {
    let connections = map_state['connections'];
    connections.forEach((conn) => map_state['map'].removeLayer(conn));
    map_state['connections'] = [];
}
