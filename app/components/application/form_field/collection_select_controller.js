import {Controller} from "stimulus"
import $ from 'jquery';
import 'selectize/dist/js/selectize'
import 'selectize/dist/css/selectize.css'
import 'application/form_field/collection_select.css'

export default class extends Controller {
    static targets = ["select"]

    connect() {
        $('select#' + this.element.id).selectize({
            sortField: 'text'
        });
    }
}