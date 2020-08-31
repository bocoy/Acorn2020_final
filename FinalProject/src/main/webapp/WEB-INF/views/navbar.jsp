<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	/* 이미지를 작은 원형으로 만든다. */
	#navIcon{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}

</style>

	<nav style=" background-color: rgba(251, 255, 185, 0.8);" class="navbar navbar-expand-sm sticky-top ">
		<a class="navbar-brand mt-2 mb-2" style="font-family: 'jua'; color: #FFBF00; margin-left:15%; font-size: 25px;"  href="${pageContext.request.contextPath}/index.jsp">COUPKEEP</a>
		<ul class="navbar-nav" >
			<li class="nav-item"><a id="menu1" class="nav-link " href="${pageContext.request.contextPath}/jsp/login/user/private/coupkeep.do" style="font-family: 'jua';color: #754F44; font-size: 18px;">CoupKeep</a></li>
			<li class="nav-item"><a id="menu2" class="nav-link" href="${pageContext.request.contextPath}/jsp/login/ceo/private/coupgive.do"style="font-family: 'jua';color: #754F44; font-size: 18px;">CoupGive</a></li>
			<li class="nav-item"><a id="menu2" class="nav-link" href="${pageContext.request.contextPath}/cafe/list.do"style="font-family: 'jua';color: #754F44; font-size: 18px;">게시글</a></li>
		</ul>


		<div class="nav-item justify-content-end" style="margin-left: 45%;">
			<button onclick="location.href='${pageContext.request.contextPath}/login/choice_form_login.do'" class="btn btn-outline-primary mr-2 " type="submit">로그인</button>
      		<button onclick="location.href='${pageContext.request.contextPath}/signup/choice_form_signup.do'" class="btn btn-outline-warning " type="submit">회원가입</button>
		</div>

	</nav>
	