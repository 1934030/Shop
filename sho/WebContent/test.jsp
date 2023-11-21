<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.10.2.min.js"></script>
</head>
<body>
<div>123</div>
<button>加载</button>
<script type="text/javascript">
$(function() {
	$("button").click(function() {
		$.post("/technology/log/ajaxtest",function(date,status){
			$("div").html(date.aaa);
			console.log(status)
		})
	})
})
</script>
</body>
</html>