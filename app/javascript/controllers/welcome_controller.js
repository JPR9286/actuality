import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="welcome"
export default class extends Controller {
  connect() {
  }

  toggle() {
    this.element.classList.add('d-none')
  }
}
