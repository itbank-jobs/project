<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var r = true;
	var g = false;
	var b = false;
	$(document).ready(function() {
		$("#1").click(function() {
			if (!h) {
				//setTimeout(','1000');
				$("#r").toggle(1000);
				r = true;
				if (g) {
					$("#g").toggle(1000);
					g = false;
				}
				if (b) {
					$("#b").toggle(1000);
					b = false;
				}
			}
		});
		$("#2").click(function() {

			if (!g) {
				//setTimeout('','1000');
				$("#g").toggle(1000);
				g = true;
				if (r) {
					$("#r").toggle(1000);
					r = false;
				}
				if (b) {
					$("#b").toggle(1000);
					b = false;
				}
			}
		});
		$("#3").click(function() {

			if (!b) {
				//setTimeout('','1000');
				$("#b").toggle(1000);
				b = true;
				if (r) {
					$("#r").toggle(1000);
					r = false;
				}
				if (g) {
					$("#g").toggle(1000);
					g = false;
				}
			}
		});

	});
</script>
</head>
<body>

</body>
</html>