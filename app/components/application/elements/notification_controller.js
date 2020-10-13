import {Controller} from "stimulus"

export default class extends Controller {
  static targets = [ "notification" ]

    close(event) {
        const notification = this.notificationTarget
        notification.parentNode.removeChild(notification)
    }
}