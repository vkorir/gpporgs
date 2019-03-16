<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-15
 * Time: 18:20
 */

function page_title($value) {
    return '<div class="mx-auto"><h3 class="display-5">' . $value . '</h3></div>';
}

function section_heading($value) {
    return '<h6 class="section-heading">' . $value . '</h6>' . '<hr class="my-2">';
}

function section_subheading($value) {
    return '<h6 class="section-subheading">' . $value . '</h6>';
}

function subsection_heading($value) {

}

function radio_button_util($id, $value) {
    return '<label class="label-container w-100" id="' . $id . '">
                 <input type="checkbox">
                 <span class="checkmark"></span>
                    ' . $value . '
            </label>
    
    ';
}

function radio_buttons($array) {
    $res = '';
    foreach ($array as $key => $value) {
        $res .= radio_button_util($key, $value);
    }
    return $res;
}

function slider_js_onchange($source_id, $target_id) {
    $jquery_val = '$(#' . $source_id .').$val()';
    return '$(#' . $target_id . ').text(' . $jquery_val . ')';
}


function slider($title, $id, $value, $min, $max, $step) {
    $source_id = $id . '-slider';
    $target_id = $id . '-display';
    $price_display = '<h5 class="section-header">' . $title . ': $ <input type="number" name="' . $target_id . '" id="' . $target_id . '" value="' . $value . '" disabled /></h5>';
    $slider = '<div class="price-range-slider">
                    <input class="' . $source_id . '" id="' . $source_id . '" type="range" min="'. $min . '" max="' . $max . '" step="' . $step .'" onchange="'. slider_js_onchange($source_id, $target_id) . '" />
                </div>';
    return $price_display . $slider;
}
