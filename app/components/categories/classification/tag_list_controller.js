import {Controller} from "stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
    static values = {relation: String}

    connect() {
        console.log(this.hasRelationValue)
        Sortable.create(this.element, {
            group: {
                name: this.identifier,
                pull: true,
                put: this.hasRelationValue
            },
            draggable: "li",
            animation: 150,
            sort: false,
            ghostClass: 'block',
            onEnd: this.end.bind(this)
        })
    }

    end(event) {
        let id = event.item.dataset.id
        // let data = new FormData()
        // data.append("position", event.newIndex + 1)

        // Rails.ajax({
        //     url: this.data.get("url").replace(":id", id),
        //     type: 'PATCH',
        //     data: data
        // })
    }
}