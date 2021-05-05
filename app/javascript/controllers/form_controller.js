import { Controller } from "stimulus"
import * as Turbo from "@hotwired/turbo"

export default class extends Controller {
    connect() {
        this.element.addEventListener("turbo:submit-end", (event) => {
            this.next(event)
        })
    }

    next(event) {
        if (event.detail.success && 303 === event.detail.fetchResponse.response.status) {
            Turbo.visit(event.detail.fetchResponse.response.url)
        }
    }
}