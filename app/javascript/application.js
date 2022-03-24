// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//import "@hotwired/turbo-rails"
//= require leaflet-fns
import "controllers"

// Leaflet map state
let map_state = {'map': {}, 'tracks': {}, 'connections': []};

// Takes an array (presumably of Objects) and returns an array with duplicates
// removed
const get_deduped_arr =
      (arr) => [...new Set(arr
                           .map((e) =>
                                JSON.stringify({
                                    "destination-puma": e['destination_puma'],
                                    "destination-state": e['destination_state'],
                                    "original-puma": e["original_puma"],
                                    "original-state": e["original_state"]})))]
      .map((s) => JSON.parse(s));

// Updates whether search button is enabled or disabled based on current
// selections
const update_disabled = (o_city_selected, d_city_selected) => {
    $('#search-btn-id').prop('disabled',
                             !(o_city_selected && d_city_selected));
    $('#search-btn-tooltip').text('Search' +
                                  (o_city_selected && d_city_selected ?
                                   '' :
                                   ' disabled'));
}

// True iff search column has a (non-default) value selected
const is_city_selected = (search_var, comp) =>
    $(search_var).find(':selected').text() != comp;

// Turn all existing animations on
const turn_animations_off = (map_state) =>
      map_state['connections'].forEach((conn) => conn.stopAnimation());

// Turn all existing animations off
const turn_animations_on = (map_state) =>
      map_state['connections'].forEach((conn) => conn.playAnimation());

const toggle_animations_button = (btn) => {
    let btn_element = btn.currentTarget;
    let parent = btn_element.parentElement;
    if (btn_element.classList.contains('enabled')) {
        btn_element.classList.replace('enabled', 'disabled');
        btn_element.firstElementChild.innerText = 'Enable Animations';
        parent.children[1].innerText = 'Animations Currently Disabled';
        turn_animations_off(map_state);
    }
    else if (btn_element.classList.contains('disabled')) {
        btn_element.classList.replace('disabled', 'enabled');
        btn_element.firstElementChild.innerText = 'Disable Animations';
        parent.children[1].innerText = 'Animations Currently Enabled';
        turn_animations_on(map_state);
    }
    else
        console.log("Error toggling animations, wrong inner button format");
}

$('#animation-btn-id')[0].addEventListener("click", toggle_animations_button);

const DEFAULT_O_CITY_TEXT = 'Select origin city';
const DEFAULT_D_CITY_TEXT = 'Select destination city';
let o_city_selected = is_city_selected('#o_city', DEFAULT_O_CITY_TEXT);
let d_city_selected = is_city_selected('#d_city', DEFAULT_D_CITY_TEXT);
// Workaround for issue of including download button in rails generated form
let metro_form = document.getElementById("metro-search-id");
let dwnld_col  = document.getElementById("download-col-id");

if (metro_form)
    metro_form.lastElementChild.appendChild(dwnld_col);

// Disable loader
$('div#load-dot').hide();
// Display HTML page after dom moving is finished
$('div#cover').toggle();

// Initialize Leaflet map
const async_init_leaflet = async (map_state) => {
    let promises = await start_leaflet(map_state);
    // For some reason using map after async call returns "undefined"
    // current makeshift solution is using val[val.length-1] in place of map,
    // which works fine, but in the long run is likely not a good idea
    return map_state;
}


// Enable buttons only when applicable
$('#o_city').on('change',
                () => {
                    o_city_selected = is_city_selected('#o_city',
                                                       DEFAULT_O_CITY_TEXT);
                    update_disabled(o_city_selected, d_city_selected);
                });

$('#d_city').on('change',
                () => {
                    d_city_selected = is_city_selected('#d_city',
                                                       DEFAULT_D_CITY_TEXT);
                    update_disabled(o_city_selected, d_city_selected);
                });


map_state = await async_init_leaflet(map_state);


// Check for search results to be added to
const results_html = $('#results-hash')[0];


// FIXME: Certain layers returned by get_track are nested and so don't have
// a getCenter function implemented. Solution is probably to calculate
// center of childLayers on the fly, or to simply choose one layer's center
// arbitrarily
if (results_html) {
    const results_arr = get_deduped_arr(JSON.parse(results_html.innerHTML));
    results_arr.slice(0,1).map((arr, index) => {
        console.log([arr['destination-state'],
                     arr['destination-puma'],
                     arr['original-state'],
                     arr['original-puma']]);
        setTimeout(() =>
                   map_state['connections']
                   .push(
                       draw_connection(map_state['map'], map_state['tracks'],
                                       arr['destination-state'],
                                       arr['destination-puma'],
                                       arr['original-state'],
                                       arr['original-puma'])),
                   50 + index*2);});
    console.log(map_state);
}
else
    console.log("not good");
