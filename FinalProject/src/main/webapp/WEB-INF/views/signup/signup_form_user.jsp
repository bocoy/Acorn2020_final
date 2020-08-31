<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>회원용 회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myoption.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
</head>
<body style="font-family: 'jua';background-color: rgba(253, 214, 146, 0.8);">
<!-- header -->
<jsp:include page="../navbar.jsp">
	<jsp:param value="signup_form_ceo" name="thisPage"/>
</jsp:include>

<script>
	$(document).ready(function() {
		$('div.container').fadeIn(2000);
	});
	function checkPWD() {
	                if (document.getElementById('pwd').value != '' && document.getElementById('pwd2').value != '') {
	                    if (document.getElementById('pwd').value == document.getElementById('pwd2').value) {
	                        document.getElementById('same').innerHTML = '&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다.';
	                        document.getElementById('same').style.color = 'blue';
	                    } else {
	                        document.getElementById('same').innerHTML = '&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다.';
	                        document.getElementById('same').style.color = 'red';
	                    }
	                }
	            }
            
	var myApp=angular.module("myApp", []);
	myApp.controller("formCtrl", function($scope, $http){
		$scope.idChanged=function(){
			console.log('success');
			$http({
				url:"checkid.do",
				method:"get",
				params:{inputId:$scope.id}
			})
			.success(function(data){
				$scope.user_signup_form.id.$valid = !data.isExist;
				$scope.user_signup_form.id.$invalid = data.isExist;
			});
		};
		$scope.pwdChanged=function(){
			$scope.user_signup_form.pwd.$valid = $scope.pwd==$scope.pwd2;
			$scope.user_signup_form.pwd.$invalid = $scope.pwd!=$scope.pwd2;
		};
	});
</script>
<!-- body -->
<div class="container" ng-controller="formCtrl" style="margin-top:4%; margin-bottom:8%; display:none;">
	<h1 class="text-center" style="margin-bottom: 40px; color: #754F44;">회원용 회원가입</h1>
	<form action="user_signup.do" method ="post" name="user_signup_form" novalidate>
	<div class="form-group row">
		<label for="id" class="col-sm-2 col-form-label col-form-label-lg">아이디</label>
		<div class="col-sm-4">
			<input type="text" class="form-control form-control-lg" name="id" id="id" 
			ng-model="id" ng-required= "true" ng-pattern="/^[a-z].{4,9}$/" ng-class="{'is-invalid':user_signup_form.id.$invalid && user_signup_form.id.$dirty,'is-valid':user_signup_form.id.$valid}"
			ng-change="idChanged()"/>
			<small class="form-text text-muted">영문자 소문자로 시작하고 최소 5글자~10글자 이내로 입력 하세요.</small>
			<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
		</div>
	</div>
	
	<div class="form-group row">
		<label for="pwd" class="col-sm-2 col-form-label col-form-label-lg">비밀번호</label>
		<div class="col-sm-4">
			<input type="password" class="form-control form-control-lg" name="pwd" id="pwd" 
				ng-model="pwd"
				ng-required="true"
				ng-minlength="5"
				ng-maxlength="10"
				ng-pattern="/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/"
				ng-class="{'is-invalid': user_signup_form.pwd.$invalid && user_signup_form.pwd.$dirty , 'is-valid': user_signup_form.pwd.$valid}"
				ng-change="pwdChanged()"/>
			<small class="form-text text-muted">숫자와 문자 포함 6~12자리로 입력하세요.</small>
			<div class="invalid-feedback">비밀번호를 맞게 입력해 주세요.</div>
		</div>
		<div class="col-sm-4">
			<input type="password" class="form-control form-control-lg"  name="pwd2" id="pwd2" ng-model="pwd2" ng-change="pwdChanged()"/> 		
		</div>
	</div>
	
	<div class="form-group row">
		<label for="name" class="col-sm-2 col-form-label col-form-label-lg">이름</label>
		<div class="col-sm-4">
			<input type="text" class="form-control form-control-lg" name="name" id="name" />
		</div>
	</div>
	
	<div class="form-group row">
		<label for="email" class="col-sm-2 col-form-label col-form-label-lg">이메일</label>
		<div class="col-sm-4">
			<input type="text" class="form-control form-control-lg" name="email" id="email" 
				ng-model="email"
				ng-required="true"
				ng-pattern="/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i"
				ng-class="{'is-invalid':user_signup_form.email.$invalid && user_signup_form.email.$dirty, 'is-valid':user_signup_form.email.$valid}"/>
			<div class="invalid-feedback">이메일 형식에 맞게 입력해 주세요.</div>
		</div>
	</div>
	
	<div class="form-group row">
		<label for="birth" class="col-sm-2 col-form-label col-form-label-lg">생년월일</label>
		<div class="col-sm-4">
			<input type="text" class="form-control form-control-lg" name="birth" id="birth" />
			<small id="birthHelp" class="form-text text-muted">6자리 숫자로 입력해주세요. ex)95년 7월 5일 ->"950705"</small>
		</div>
	</div>

	<div class="text-right">
		<button ng-disabled="user_signup_form.$invalid" type="submit" class="btn btn-outline-info">가입하기</button>
	</div>
	</form>
</div>
<!-- footer -->
<jsp:include page="../footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

</body>
</html>