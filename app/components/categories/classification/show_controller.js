import {Controller} from "stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
    static targets = ["relationList"]

    connect() {
        // this.relationListTargets.forEach(function(target) {
        //     console.log(target)
        //
        //     Sortable.create(target, {
        //         group: 'sortable-list',
        //         pull: true,
        //         push: true,
        //         draggable: ".list-item",
        //         animation: 150,
        //         onEnd: this.end.bind(this)
        //     })
        // }, this)
    }

    end(event) {
        let id = event.item.dataset.id
        let data = new FormData()
        data.append("position", event.newIndex + 1)

        Rails.ajax({
            url: this.data.get("url").replace(":id", id),
            type: 'PATCH',
            data: data
        })
    }
}