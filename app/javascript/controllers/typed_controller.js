import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="typed"
export default class extends Controller {
  static values = {
    text: String
  }

  connect() {
    const typed = new Typed(this.element, {
      strings: [this.textValue],
      typeSpeed: 10,
    });
  }
}
