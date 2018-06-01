
	$(function() {

		$('#table').searchable({
			searchField : '#search',
			selector : '.a',
			childSelector : 'td',
			show : function(elem) {
				elem.slideDown(100);
			},
			hide : function(elem) {
				elem.slideUp(100);
			}
		})
	});