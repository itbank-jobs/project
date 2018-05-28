function writeSave() {
		if ($('#author').val() == "") {

			$('#author').focus();
			return false;
		}
		if ($('#title').val() == "") {

			$('#title').focus();
			return false;
		}
		if ($('#content').val() == "") {

			$('#content').focus();
			return false;
		}
	};