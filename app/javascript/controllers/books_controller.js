import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['form', 'input', 'results'];

  search() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.resultsTarget.outerHTML = data;
      })
  }
}
