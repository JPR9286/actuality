import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="typed"
export default class extends Controller {
  static values = {
    summary: String,
    longSummary: String,
    path: String
  }
  static targets = ['spinner', 'summaryContainer', 'longSummaryContainer', 'longSummaryBtn', 'summaryBtn','toggleSummary']

  connect() {
    this.summarizeLong();
  }

  // connect() {
  //   if (this.summaryValue.length > 0) {
  //     this.spinnerTarget.classList.add('d-none');
  //     const typed = new Typed(this.summaryContainerTarget, {
  //       strings: [this.summaryValue],
  //       typeSpeed: 5,
  //     });
  //   } else {
  //     fetch(this.pathValue, {
  //       headers: {
  //         "Accept": "application/json",
  //         "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
  //       },
  //       method: 'POST'
  //     })
  //     .then(response => response.json())
  //     .then((data) => {
  //       console.log(data)
  //       this.spinnerTarget.classList.add('d-none');
  //       if (data["summary"] == null) return;
  //       const typed = new Typed(this.summaryContainerTarget, {
  //         strings: [data["summary"]],
  //         typeSpeed: 5,
  //       });
  //     })
  //   }
  // }

  summarizeShort(event) {
    this.spinnerTarget.classList.remove('d-none');
    this.longSummaryContainerTarget.classList.add('d-none');
    // this.summaryBtnTarget.classList.add('d-none');

    if (this.summaryValue.length > 0) {
      this.spinnerTarget.classList.add('d-none');
      this.summaryContainerTarget.classList.remove('d-none');
      const typed = new Typed(this.summaryContainerTarget, {
        strings: [this.summaryValue],
        typeSpeed: 0,
        showCursor: false
      });
    } else {
      fetch(this.pathValue, {
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
        },
        method: 'POST',
        body: JSON.stringify({length: 50})
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this.spinnerTarget.classList.add('d-none');
        if (data["summary"] == null) return;

        this.summaryValue = data["summary"];
        this.summaryContainerTarget.classList.remove('d-none');
        const typed = new Typed(this.summaryContainerTarget, {
          strings: [data["summary"]],
          typeSpeed: 0,
          showCursor: false
        });
      })
    }
    // this.longSummaryBtnTarget.classList.remove('d-none');
  }

  summarizeLong(event) {
    this.spinnerTarget.classList.remove('d-none');
    this.summaryContainerTarget.classList.add('d-none');
    // this.longSummaryBtnTarget.classList.add('d-none');

    if (this.longSummaryValue.length > 0) {
      this.spinnerTarget.classList.add('d-none');

      this.longSummaryContainerTarget.classList.remove('d-none');
      // const typed = new Typed(this.longSummaryContainerTarget, {
      //   strings: [this.longSummaryValue],
      //   typeSpeed: -10,
      //   showCursor: false
      // });
      this.longSummaryContainerTarget.innerText = this.longSummaryValue;
    } else {
      fetch(this.pathValue, {
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
        },
        method: 'POST',
        body: JSON.stringify({length: 200})
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this.spinnerTarget.classList.add('d-none');
        if (data["long_summary"] == null) return;

        this.longSummaryValue = data["long_summary"];
        this.longSummaryContainerTarget.classList.remove('d-none');
        this.longSummaryContainerTarget.innerText = data["long_summary"];
        // const typed = new Typed(this.longSummaryContainerTarget, {
        //   strings: [data["long_summary"]],
        //   typeSpeed: 0,
        //   showCursor: false
        // });
      })
    }
    // this.summaryBtnTarget.classList.remove('d-none');
  }
  toggleSummary(event) {
    if (event.target.checked) {
      this.summarizeShort();
    } else {
      this.summarizeLong();
    }
  }
}
