$(document).ready(function () {
  $('.carousel').carousel({
    interval: 5000
  });
});

$(document).on('turbolinks:load', function () {
  $('[data-toggle="popover"]').popover();

  $(".show-users-list").on("click", function () {
    $(this).find($(".glyphicon")).toggleClass('glyphicon-menu-down').toggleClass('glyphicon-menu-up');
  });
});
