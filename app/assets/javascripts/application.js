// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require 'greensock/TweenLite'
//= require 'greensock/easing/EasePack'
//= require foundation
//= require_tree .
 
$(function() {

	$(document).foundation();

	TweenMax.fromTo($('.heart img'), 0.45, {
	    scale: 1
	}, {
	    repeatDelay: 0.5,
	    scale: 1,
	    repeat: -1,
	    ease: Back.easeOut
	});

});