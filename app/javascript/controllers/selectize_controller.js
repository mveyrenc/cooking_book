import {Controller} from "stimulus"
import $ from 'jquery';
import 'selectize/dist/js/selectize'
import 'selectize/dist/css/selectize.css'
import 'controllers/selectize.css'

export default class extends Controller {
    static values = { maxItems: Number }
    connect() {
        let options = {
            plugins: ['remove_button'],
            sortField: 'text'
        }

        if (this.hasMaxItemsValue) {
            options.maxItems = this.maxItemsValue
        }

        $('select#' + this.element.id).selectize(options);
    }
}