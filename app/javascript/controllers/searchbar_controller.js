import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["searchbar"];

  connect() {
    let lastScroll = window.scrollY;
    window.addEventListener("scroll", () => {
      if (window.scrollY > lastScroll) {
        if (window.scrollY > 140) {
          this.searchbarTarget.style.top = "-70px"
        }
      } else {
        this.searchbarTarget.style.top = "20px"
      }
      lastScroll = window.scrollY;
    })
  }
}
