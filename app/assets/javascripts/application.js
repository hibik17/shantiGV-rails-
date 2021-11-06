// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require rails-ujs
//= require turbolinks
// Loads all Semantic javascripts
//= require semantic-ui
//= require_tree .

$(document).on("turbolinks:load", function () {
  $(".column.special .image").dimmer({
    on: "hover",
  });
});

$(document).on("turbolinks:load", function () {
  $(".usershow .image").dimmer({
    on: "hover",
  });
});

$("#modalbutton").click("turbolinks:load", function () {
  $(".ui.modal").modal("show");
});

$(document).on("turbolinks:load", function () {
  $(".posts_dimmer").dimmer({
    on: "hover",
  });
});

$(document).on("turbolinks:load", function () {
  $(".full-screen").slick({
    centerMode: true,
    centerPadding: "5%",
    dots: true,
    autoplay: true,
    autoplaySpeed: 2000,
    speed: 1000,
    infinite: true,
  });
});
