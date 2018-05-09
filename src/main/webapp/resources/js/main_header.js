 
(function($, undefined) {

});



$(document).ready(function() {
		$('#home').click(function() {
			location.href = 'main';
		});
		$('#news').click(function() {
			location.href = 'news';
		});
		$('#schedule').click(function() {
			location.href = 'schedule';
		});
		$('#1team').click(function() {
			location.href = 'team?home=1';
		});
		$('#2team').click(function() {
			location.href = 'team?home=2';
		});
		$('#3team').click(function() {
			location.href = 'team?home=3';
		});
		$('#4team').click(function() {
			location.href = 'team?home=4';
		});

		$('#messenser').click(function() {
			location.href = 'messenser';
		});
		$('#about').click(function() {
			location.href = 'about';
		});
		$('#settings').click(function() {
			location.href = 'settings';
		});
		$('#logout').click(function() {
			location.href = 'logout';
		});

});
	window.onload = function() {
		$('.dropdown').click(function() {
			$(this).siblings(".submenu").toggleClass('hide');

		});
	}
