import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'bootstrap'
import $ from 'jquery';
import 'select2'
import 'select2/dist/css/select2.css'

require('jquery')

window.addEventListener('DOMContentLoaded', () => {
  $('.js-states').select2()
})

$(document).ready(function() {
    $('.author-multiple').select2();
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()
