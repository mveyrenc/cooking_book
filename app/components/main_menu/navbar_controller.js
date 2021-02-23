import {Controller} from "stimulus"
import $ from 'jquery';
import 'selectize/dist/js/selectize'
import 'selectize/dist/css/selectize.css'
import 'application/form_field/collection_select.css'

export default class extends Controller {
    connect() {
        // Check for click events on the Navbar burger icon
        $(".Navbar-burger").click(function() {

            // Toggle the "is-active" class on both the "Navbar-burger" and the "Navbar-menu"
            $(".Navbar-burger").toggleClass("is-active");
            $(".Navbar-menu").toggleClass("is-active");

        });
    }
}