import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["searchbar"];

  connect() {
      console.log(window.scrollY)
      window.addEventListener("scroll", this.changeColor.bind(this));
      // this.handleScroll = this.handleScroll.bind(this);

      // window.removeEventListener("scroll", this.handleScroll);

    }

    changeColor(){
      const searchbar = this.searchbarTarget;
      const scrollPosition = window.scrollY;
      if (scrollPosition > 300) {
        console.log("scroll")
        this.searchbarTarget.style.background = "blue";
      } else {
        this.searchbarTarget.style.background = "#333";
      }
    }
  }
