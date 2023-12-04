import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="typed"
export default class extends Controller {
  static values = {
    text: String,
    path: String
  }
  static targets = ['spinner']

  connect() {
    console.log(this.pathValue)
    if (this.textValue.length > 0) {
      this.spinnerTarget.classList.add('d-none');
      const typed = new Typed(this.element, {
        strings: [this.textValue],
        typeSpeed: 5,
      });
    } else {
      fetch(this.pathValue, {
        headers: {
          "Accept": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
        },
        method: 'POST'
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this.spinnerTarget.classList.add('d-none');
        if (data["summary"] == null) return;
        const typed = new Typed(this.element, {
          strings: [data["summary"]],
          typeSpeed: 5,
        });
      })
    }
  }
}
