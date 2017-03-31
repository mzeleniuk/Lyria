$(document).ready(function () {
  $('.carousel').carousel({
    interval: 5000
  });
});

$(document).on('turbolinks:load', function () {
  $('[data-toggle="popover"]').popover();
});
