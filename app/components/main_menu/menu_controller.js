import {Controller} from "stimulus"
import $ from 'jquery';
import 'selectize/dist/js/selectize'
import 'selectize/dist/css/selectize.css'
import 'application/form_field/collection_select.css'

export default class extends Controller {
    connect() {
        // Check for click events on the navbar burger icon
        $(".navbar-burger").click(function() {

            // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
            $(".navbar-burger").toggleClass("is-active");
            $(".navbar-menu").toggleClass("is-active");

        });
    }
}