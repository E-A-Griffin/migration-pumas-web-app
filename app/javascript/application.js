// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//import "@hotwired/turbo-rails"
//= require leaflet-fns
import "controllers"

// Leaflet map state
let map_state = {'map': {}, 'tracks': {}, 'connections': []};

// Takes a function and an initial argument and returns a new function based on
// the function argument being supplied its initial argument
const partial = (fn, ...first_args) => (...args) => fn(...first_args, ...args);

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

// Credit, source code taken from Christian Landgren: 
// https://stackoverflow.com/questions/8847766/how-to-convert-json-to-csv-format-and-store-in-a-variable
const json_to_csv = ((json) => {
  const replacer = (k, v) => v === null ? '' : v // specify how you want to handle null values here
  const header = Object.keys(json[0])
  const csv = [
    header.join(','), // header row first
    json.map(row => header.map(fieldName => 
			       JSON.stringify(row[fieldName], replacer)).join(',')).join('\n')
  ].join('\n')
  
  return csv;
});

let dwnld_col  = document.getElementById("download-col-id");
let dwnld_btn  = dwnld_col.firstElementChild;

const download_csv = () => {
  const json_csv = json_to_csv(JSON.parse($('#sql-res').attr('data-sql')));
 
  let hidden_e = document.createElement('a');
  hidden_e.href = 'data:text/csv;charset=utf-8,' + encodeURI(json_csv);
  hidden_e.target = '_blank';
  hidden_e.download = 'output.csv';
  hidden_e.click();
}

dwnld_btn.addEventListener("click", download_csv);
console.log("download_csv fn added: " + dwnld_btn);

// Updates whether download button is enabled or disabled based on current
// connections drawn
const update_disabled_download = (map_state) => {
    if (connections_exist(map_state))
        dwnld_btn.removeAttribute('disabled');
    else 
        dwnld_btn.addAttribute('disabled', true);
}

// True iff there exists at least one connection currently drawn on map
const connections_exist = (map_state) => map_state['connections'].length > 0

// True iff search column has a (non-default) value selected
const is_city_selected = (search_var, comp) =>
    $(search_var).find(':selected').text() != comp;

// Turn all existing animations on
const turn_animations_off = (map_state) =>
      map_state['connections'].forEach((conn) => conn.stopAnimation());

// Turn all existing animations off
const turn_animations_on = (map_state) =>
      map_state['connections'].forEach((conn) => conn.playAnimation());

// Toggle whether animations play based on current state of animations button
const toggle_animations_button = (btn) => {
    let btn_element = btn.currentTarget;
    if (!btn_element.checked)
        turn_animations_off(map_state);
    else if (btn_element.checked)
        turn_animations_on(map_state);
    else
        console.log("Error toggling animations, wrong checkbox format");
}

let append_btn = $('#append-btn-id')[0];

// True iff (checkbox) input is currently checked
const is_input_checked = (element) => element.checked;

// True iff append button is currently on/checked
const is_append_on = partial(is_input_checked, append_btn);

// Takes in a string of a form_id and returns the values of the respective form
// matching form_id, represented as a string of query parameters
const form_vals_to_q_params = (form_id) => {
    const form_elements = $('#' + form_id).serializeArray();
    const param_object =
          form_elements.reduce((m, obj) => {
              if(obj['value'] !== '') m[obj['name']] = obj['value'];
              return m;}, {});

    return $.param(param_object);
}

const draw_new_conns = async (json, are_animations_on) => {
    const results_arr = get_deduped_arr(json);
    const subset_arr = results_arr.slice(0,10);
    const subset_len = subset_arr.length;

    if (!is_append_on())
        reset_connections(map_state);
    subset_arr.map((arr, index) => {
        console.log([arr['destination-state'],
                     arr['destination-puma'],
                     arr['original-state'],
                     arr['original-puma']]);
        setTimeout(() => {
            map_state['connections'].push(
                draw_connection(map_state['map'], map_state['tracks'],
                                arr['destination-state'],
                                arr['destination-puma'],
                                arr['original-state'],
                                arr['original-puma']));
            if (are_animations_on)
                turn_animations_on(map_state);
            if (index == subset_len-1)
                update_disabled_download(map_state);
        }, 50 + index*2);}); // arbitrary increasing delay rate to keep web app
                             // from crashing
}

// Takes in a set of expected keys and returns true iff the set conforms to
// schema
const has_schema = (schema_keys_set, json_element) => {
    if (json_element === null || json_element === undefined)
        return false;
    const ks = Object.keys(json_element);
    return ks.length === schema_keys_set.size &&
           !ks.map((k) => schema_keys_set.has(k)).some((bool) => !bool);}

const has_outflow_schema = partial(has_schema, new Set(['population',
                                                        'destination_state',
                                                        'destination_puma']));

// Function used by search form to asynchronously fetch the results of the given
// query from the backend
const fetch_search_results = async (e) => {
    e.preventDefault();
    const q_params = form_vals_to_q_params('metro-search-id');
    const url = e.target.action + '?' + q_params;

    return fetch(url, {
      headers : {'Accept': 'application/json'}
    }).then((response) => response.json())
      .then((json) => {
          let animations_button = $('#animation-btn-id')[0];
	  // Preserve intermediate results
	  // Check if new connections are to be appended or reset
	  const sql_arr = ($('#append-btn-id').is(':checked') ?
			   JSON.parse($('#sql-res').attr('data-sql')) : [])
	                   .concat(json);
	  $('#sql-res').attr('data-sql', JSON.stringify(sql_arr));
	  draw_new_conns(json, animations_button.checked);
	});
}

$('#animation-btn-id')[0].addEventListener("change", toggle_animations_button);
$('#metro-search-id').submit(fetch_search_results);

// Workaround for issue of including download button in rails generated form
let metro_form = document.getElementById("metro-search-id");

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

// Dynamically filter dropdown list based on input value
const filter_end_years = (start_year_select, end_year_select) => {
    const start_year = parseInt(start_year_select.value);
    let options = end_year_select.getElementsByTagName("option");
    Array.from(options).forEach((op) => {
        if (parseInt(op.value) < start_year)
            op.setAttribute("disabled", "");
        else
            op.removeAttribute("disabled");});
}

// Set lower bound of end year to value of start year. If selected end year is
// less than selected start year than automatically set end year value to lower
// bound
const ensure_start_year_not_after_end = (end_year_select, e) => {
    const start_year_select = e.currentTarget;
    const start_year = parseInt(e.currentTarget.value);
    const end_year = parseInt(end_year_select.value);
    if (end_year < start_year)
        end_year_select.value = e.currentTarget.value;
    filter_end_years(start_year_select, end_year_select);
};

let end_year_select = $('#end_year')[0];

$('#start_year').on('change', partial(ensure_start_year_not_after_end,
                                      end_year_select));
map_state = await async_init_leaflet(map_state);


// Check for search results to be added to
const results_html = $('#results-hash')[0];

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
}


let dropdown_origin_div = $("#dropdown-origin-div-id")[0];
let dropdown_origin_search = $("#dropdown-origin-search-id")[0];
let dropdown_destination_div = $("#dropdown-destination-div-id")[0];
let dropdown_destination_search = $("#dropdown-destination-search-id")[0];

// When the user clicks on the button,
// toggle between hiding and showing the dropdown content */
const toggle_search_fields_visibility = (dropdown_div) =>
  dropdown_div.classList.add("show");

// Dynamically filter dropdown list based on input value
const filter_search_fields = (dropdown_search, dropdown_div) => {
  const filter = dropdown_search.value.toUpperCase();
  let a = dropdown_div.getElementsByTagName("a");
  Array.from(a).forEach((e) => {
      const txt_val = e.txtContent || e.innerText;
      e.style.display =
          txt_val.toUpperCase().indexOf(filter) > -1 ? "" : "none";});
}

// When the user clicks outside the input, remove visibility for the associated
// dropdown filter selection
document.addEventListener('click', (e) => {
  const is_click_inside_origin =
        dropdown_origin_search.contains(e.target);
  const is_click_inside_destination =
        dropdown_destination_search.contains(e.target);
  if (!is_click_inside_origin)
    dropdown_origin_div.classList.remove('show');
  if (!is_click_inside_destination)
    dropdown_destination_div.classList.remove('show');
});

// When input changes, update list of metro cities that match input value
// dynamically
dropdown_origin_search.addEventListener('keyup', partial(filter_search_fields,
                                                         dropdown_origin_search,
                                                         dropdown_origin_div));
dropdown_destination_search.addEventListener('keyup',
                                             partial(filter_search_fields,
                                                     dropdown_destination_search,
                                                     dropdown_destination_div));

// From clicked a tag, set associated parent's input value and 'selected'
// attribute
const set_select_based_on_a_tag = (a, e) => {
    let content = a.txtContent || a.innerText;
    let relevant_parent =
        e.target.parentElement.parentElement.firstElementChild;

    relevant_parent.value = content;
    relevant_parent.setAttribute("selected", content);

    update_disabled(true, true);
}

// Add eventlisteners for every a tag representing each city/metro area
[...dropdown_origin_div.children, ...dropdown_destination_div.children]
     .forEach((a) =>
              a.addEventListener('click',
                                 partial(set_select_based_on_a_tag, a)));

// When input is clicked/selected, populate visible dropdown options for cities
dropdown_origin_search.addEventListener('click',
                                        partial(toggle_search_fields_visibility,
                                                dropdown_origin_div));
dropdown_destination_search
    .addEventListener('click',
                      partial(toggle_search_fields_visibility,
                              dropdown_destination_div));

// When input changes, check to see if value matches 'selected' attribute, and,
// if not, then reset 'selected' attribute and disable search button
[dropdown_origin_search, dropdown_destination_search]
    .map((d) =>
         d.addEventListener('change',
                            (e) => {
                                let relevant_parent =
                                    e.target
                                     .parentElement
                                     .firstElementChild;
                                if (relevant_parent.value !=
                                    relevant_parent.getAttribute("selected")) {
                                    relevant_parent.setAttribute("selected",
                                                                 "");

                                    update_disabled(false, false);}}));
