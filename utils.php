<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-15
 * Time: 18:20
 */


// UI utility functions

function page_title($value) {
    return '<div class="text-center"><h3 class="display-5">' . $value . '</h3></div>';
}

function section_heading($value) {
    return '<h6 class="section-heading">' . $value . '</h6>' . '<hr />';
}

function section_subheading($value) {
    return '<h6 class="section-subheading my-3">' . $value . '</h6>';
}

function subsection_heading($name, $value, $directive) {
    return '<label class="mt-3" for="' .$name . '">' . $value . '<span class="directive">' . $directive . '</span></label>';
}

function radio_button_util($id, $value) {
    return '<label class="label-container w-100">
                 <input id="' . $id . '" type="checkbox" data-value="'. $value .    '">
                 <span class="checkmark"></span>
                    ' . $value . '
            </label>';
}

function radio_buttons($array) {
    $res = '';
    foreach ($array as $key => $value) {
        $res .= radio_button_util($key, $value);
    }
    return $res;
}

function slider_js_onchange($source_id, $target_id) {
    $jquery_val = '$(\'#' . $source_id .'\').val()';
    return '$(\'#' . $target_id . '\').val(' . $jquery_val . ');';
}


function slider($title, $class, $id, $value, $min, $max, $step) {
    $source_id = $id . '-slider';
    $target_id = $id . '-display';
    $price_display = '<h6 class="section-subheading">' . $title . ': $<input class="slider-value-display" type="number" name="' . $target_id . '" id="' . $target_id . '" value="' . $value . '" disabled /></h6>';
    $slider = '<input class="price-range-slider ' . $class . '" id="' . $source_id . '" type="range" min="'. $min . '" max="' . $max . '" step="' . $step .'" onchange="'. slider_js_onchange($source_id, $target_id) . '" />';
    return $price_display . $slider;
}

function fieldset_item($name, $type, $value) {
    return '<div>
              <label class="col-lg-2 col-md-2 col-sm-1" for="' . $name . '">' . $value . ': </label>
              <input class="col-lg-9 col-md-6 col-sm-8 px-1" type="' . $type . '" name="' . $name . '" id="' . $name . '" />
            </div>';
}

function get_regions() {
    return array('North America', 'Mexico / Central America', 'South America', 'Europe', 'Middle East / North Africa', 'Sub-Saharan Africa', 'India', 'China', 'Other');
}

function get_countries() {
    // GET https://restcountries.eu/rest/v2/all
}

function get_languages() {
    // GET https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry
}
