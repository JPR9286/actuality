import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-chats"
export default class extends Controller {
  static targets = ['form', 'rooms']
  // connect() {
  //   console.log("coucou")
  // }

  async update(evt) {
    evt.preventDefault();
    evt.stopPropagation();

    const value = evt.target.value
    const response = await fetch(`/filter_chatrooms?query=${value}`)
    const data = await response.json();
    this.roomsTarget.innerHTML = data.html;
  }
}
