import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      // enableTime: true,
      // more options available on the documentation!
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
    });
  }
}
