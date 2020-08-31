<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myoption.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function() {
	$('div.fadein').fadeIn(2000);
	$('#code').focus();
});	
</script>
</head>
<body style="font-family: 'jua';background-color: rgba(253, 214, 146, 0.8);">
<!-- header -->
<jsp:include page="../../navbar.jsp">
	<jsp:param value="login" name="thisPage"/>
</jsp:include>
<!-- body -->
<div class="container fadein" style="margin-top:4%; margin-bottom:11.3%; display: none;">
	<form id="ceo_loginform" action="ceo_login.do" method="post">
	<input type="hidden" name="url" value="${url }" />
	<div class="login_form fadein">
	<h1 class="text-center" style="color: #754F44;">점주 로그인</h1>
		<div class="form-group text-center">
			<label for="code">ID</label>
			<input type="text" class="form-control mx-auto col-3" name="code" id="code" autofocus/>
		</div>
		<div class="form-group text-center">
			<label for="pwd">PASSWORD</label>
			<input type="password" class="form-control mx-auto col-3" name="pwd" id="pwd"/>
		</div>
		<button id="login_btn"  type="submit" class="btn btn-primary btn-lg btn-block mx-auto col-5">LOGIN</button>
	</div>
	</form>
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/jsp/signup/signup_form_ceo.jsp'" class="btn btn-dark btn-lg btn-block mx-auto col-5 mt-3">회원가입</button>
</div>
<script>
var isNumber = true;
$("#ceo_loginform").on("submit", function(){
	var getcode = $("#code").val();
	if(!$.isNumeric(getcode)){
		alert("아이디 형식이 올바르지 않습니다.");
		return false;
	}else{
		return ture;
	}
});

</script>
<!-- footer -->
<jsp:include page="../../footer.jsp">
	<jsp:param value="login" name="thisPage"/>
</jsp:include>
</body>
</html>