import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-article"
export default class extends Controller {
  static targets = ['commentForm']
  connect() {
  }

  setChatroom() {
    console.log(event.currentTarget.value)
    this.commentFormTarget.action = `/chatrooms/${event.currentTarget.value}/messages`
  }
}
