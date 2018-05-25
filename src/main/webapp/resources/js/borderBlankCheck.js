	function writeSave() {
		if (document.write_view.subject.value == "") {

			document.write_view.subject.focus();
			return false;
		}
		if (document.write_view.content.value == "") {

			document.write_view.content.focus();
			return false;
		}
	};