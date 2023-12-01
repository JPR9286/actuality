import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatrooms-select-image"
export default class extends Controller {
  static targets = [ "category", "imageSelectContainer" ]

  connect() {
    console.log("Hello from chatrooms_select_image_controller.js");
    console.log(this.categoryTarget);
    console.log(this.imageSelectContainerTarget);
  }

  categoryChanged() {
    console.log("categoryChanged")
    fetch('/select_image')
      .then(response => response.text())
      .then(html => {
        this.imageSelectContainerTarget.innerHTML = html;
      });
  }

  
}
