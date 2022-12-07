import { Controller } from "@hotwired/stimulus"

import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import moment from 'moment'
window.moment = moment

// Connects to data-controller="calendar"
export default class extends Controller {
  connect() {
    console.log(this.element)
    const calendar = new Calendar(this.element,{
      events: '/events.json',
      plugins: [ dayGridPlugin ]
    });
    calendar.render();
  }
}
