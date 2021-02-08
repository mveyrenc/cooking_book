import {Controller} from "stimulus"

export default class extends Controller {
    static targets = ["form"]

    storeParameters(event) {
        event.preventDefault();
        console.log(this.element);
    }
}