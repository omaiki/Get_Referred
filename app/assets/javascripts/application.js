// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-material-design
//= require_tree .
//= require jquery.turbolinks
//= require chosen-jquery
//= require messages


$(function() {
  $("#profiles th a, #profiles .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#profiles_search input").on(function() {
    $.get($("#profiles_search").attr("action"), $("#profiles_search").serialize(), null, "script");
    return false;
  });
});

// attach class "active" on click to remove default Bootstrap active button styling
$('.btn-primary').click(function() {
  $(this).toggleClass('active');
});


// attach class "active" on click to remove default Bootstrap active button styling
$('.btn-danger').click(function() {
  $(this).toggleClass('active');
});

// toggling classes for toggle-button
$(document).on('click', '.toggle-button', function() {
    $(this).toggleClass('toggle-button-selected');
});

$(document).on('click', '.toggle-button-button', function() {
    $(this).toggleClass('toggle-button-selected-button');
});

