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
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
// Loads all Semantic javascripts
//= require semantic-ui
//= require_tree .

$(document).ready(function () {
  $(".search_button").hover(
    function () {
      $(this).transition("jiggle");
    },
    function () {}
  );
});

$(document).ready(function () {
  $(".start_button").hover(
    function () {
      $(this).transition("jiggle");
    },
    function () {}
  );
});

$(document).ready(function () {
  $(".header_item").hover(
    function () {
      $(this).transition("jiggle");
    },
    function () {}
  );
});

$(document).ready(function () {
  $("attachment user profile_image ui image medium fallback").dimmer({
    on: "hover",
  });
});
