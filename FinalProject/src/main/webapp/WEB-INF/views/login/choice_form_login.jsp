<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 선택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myoption.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function() {
	$('div.container').fadeIn(2000);
});	
</script>
</head>
<body style="font-family: 'jua'; background-color: rgba(253, 214, 146, 0.8);">
<!-- header -->
<jsp:include page="../navbar.jsp">
	<jsp:param value="login" name="thisPage"/>
</jsp:include>

<!-- body -->
<div class="container" style="margin-top:4%; display:none;">
	<h1 class="text-center mb-5"style="color: #754F44;">로그인</h1>
	<div class="form-inline " role="form" style="display:flex; justify-content: center; align-items:center">
		<div class="form-group" >
			<button onclick="location.href='${pageContext.request.contextPath}/login/ceo/ceo_loginform.do'" class="btn-lg btn-block btn-primary text-center" type="submit">점주 전용 로그인</button>
			<div class="container border border-primary rounded" >
			<p class="text-center mt-5 mb-5" style="margin: 0 auto; ">점주전용 로그인 입니다.</p>
			</div>
		</div>
		<div class="form-group ml-3" >
			<button onclick="location.href='${pageContext.request.contextPath}/login/user/user_loginform.jsp'" class="btn-lg btn-block  btn-warning text-center" type="submit" >회원 전용 로그인</button>
			<div class="container border border-primary rounded" >
			<p class="text-center mt-5 mb-5" style="margin: 0 auto;">회원전용 로그인 입니다.</p>
			</div>
		</div>
	</div>
</div>

<!-- footer -->
<jsp:include page="../footer.jsp">
	<jsp:param value="login" name="thisPage"/>
</jsp:include>
</body>
</html>