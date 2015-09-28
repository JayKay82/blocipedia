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
//= require jquery.turbolinks
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require 'epiceditor'
//= require_tree .

$(function(){ $(document).foundation(); });

// Javascript for tracking events in this app with Blocmetrics
// Create a namespace for Blocmetrics related code
var blocmetrics = {};

// Create a report function to make an ajax request with the Blocmetrics API
blocmetrics.report = function(eventName) {
  var event = { name: eventName };
  var request = new XMLHttpRequest();
  request.open('POST', 'http://localhost:3000/api/events', true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};

// Listen for click events for wiki save and delete
$(document).ready(function(){
  blocmetrics.report('page view');
  $('#save-wiki').click(function() {
    console.log('Reporting a wiki save.');
    blocmetrics.report('save wiki');
  });
  $('#delete-wiki').click(function() {
    console.log('Reporting a wiki delete.');
    blocmetrics.report('delete wiki');
  });
});
