import {Controller} from "stimulus"

export default class extends Controller {
    close(event) {
        let notification = event.currentTarget.parentNode.parentNode;
        notification.parentNode.removeChild(notification)
    }
}