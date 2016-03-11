// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require_tree .

$(function() {
  $("#listings .pagination a").on("click",
    function() {
      $.getScript(this.href);
      return false;
    });

// listing search on index home page.
  $("#listing-search input").keyup(function() {
    $.get($("#listing-search").attr("action"), $("#listing-search").serialize(), null, "script");
    return false;
  });
});
