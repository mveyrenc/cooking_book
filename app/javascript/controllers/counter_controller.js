import { Controller } from 'stimulus';
import StimulusReflex from 'stimulus_reflex';

export default class extends Controller {
    connect() {
        StimulusReflex.register(this)
    }

    increment(event) {
        event.preventDefault()
        this.stimulate('Counter#increment', 1)
    }
}