import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["searchbar"];

  connect() {
    console.log('got it')
  }
      // console.log(window.scrollY)
      // window.addEventListener("scroll", this.changeColor.bind(this));
      // this.handleScroll = this.handleScroll.bind(this);
      // window.removeEventListener("scroll", this.handleScroll);
    // }

    // changeColor(){
    //   console.log(this.searchbarTarget);
    //   const searchbar = this.searchbarTarget;
    //   const scrollPosition = window.scrollY;
    //   if (scrollPosition > 300) {
    //     console.log("scroll")
    //     this.searchbarTarget.style.background = "blue";
    //   } else {
    //     this.searchbarTarget.style.background = "#333";
    //   }
    // }

    connect() {
      window.addEventListener("scroll", this.changeColor.bind(this));
      console.log("Controller connected:", this.element);
    }

    disconnect() {
      window.removeEventListener("scroll", this.changeColor.bind(this));
    }

    changeColor() {
      const searchbar = this.searchbarTarget;

      if (!searchbar) {
        console.warn("Searchbar target not found");
        return;
      }

      const scrollPosition = window.scrollY;

      if (scrollPosition > 300) {
        searchbar.style.background = "blue";
      } else {
        searchbar.style.background = "#333";
      }
    }
  }
