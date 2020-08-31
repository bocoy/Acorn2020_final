<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주용 회원가입</title>
<style>
	/* 프로필 업로드 폼을 화면에서 숨긴다. */
	#profileForm{
		display:none;
	}
	/* 이미지를 작은 원형으로 만든다. */
	#profileImage{
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 10%;
		cursor: pointer;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/js/bootstrap.min.js" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myoption.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body style="font-family: 'jua';background-color: rgba(253, 214, 146, 0.8);">

<script>
function make_code(){
	$("#code").val('${code}');
};
</script>

<!-- header -->
<jsp:include page="../navbar.jsp">
	<jsp:param value="signup_form_ceo" name="thisPage"/>
</jsp:include>

<!-- body -->
<div class="container" style="margin-top:4%; margin-bottom:8%;">
	<form id="ceo_signup_form" action="ceo_signup.do" method="post" >
	<h1 class="text-center mb-5"style="color: #754F44;">점주용 회원가입</h1>

	<div class="form-group row">
		<label for="pwd" class="col-sm-2 col-form-label col-form-label-lg">매장 코드</label>
		<div class="col-sm-5 mb-2">
		<div class="input-group">
			<input type="text" class="form-control form-control-lg" name="code" id="code"  disabled/>	
			<button style="background-color: #754F44; color:white;" class="btn " type="button"  onclick="make_code()">코드 발급</button>
		</div>	
			<small class="row form-text text-primary">&nbsp;&nbsp;&nbsp;&nbsp;로그인 할때 필요한 코드 입니다.</small>
		</div>
	
	</div>
	<div class="form-group row">
		<label for="profile" class="col-sm-2 col-form-label col-form-label-lg">이미지설정</label>
		<input type="hidden" name="profile" id="profile" value="${Profile }"/>
		<c:choose>
			<c:when test="${profile eq null }">
				<a id="profileLink" href="javascript:">&emsp;<img id="profileImage" src="${pageContext.request.contextPath }/images/yellowbird.png"/></a>
			</c:when>
			<c:otherwise>
				<a id="profileLink" href="javascript:">&emsp;<img id="profileImage" src="${pageContext.request.contextPath }${profile }"/></a>
			</c:otherwise>
		</c:choose>
		<label for="cname" class="col-sm-2 col-form-label col-form-label-lg">이미지를 클릭하세요.</label>	
	</div>
	<div class="form-group row">
		<label for="cname" class="col-sm-2 col-form-label col-form-label-lg">매장 이름</label>
		<div class="col-sm-10">
			<input type="text" class="form-control form-control-lg" name="cname" id="cname" />
		</div>
	</div>
	
	<div class="form-group row">
		<label for="pwd" class="col-sm-2 col-form-label col-form-label-lg">비밀번호</label>
		<div class="col-sm-4">
			<input type="password" class="form-control form-control-lg" name="pwd" id="pwd"/>
		</div>
		<div class="col-sm-4">
				<input type="password" class="form-control form-control-lg" name="pwd2" id="pwd2"/> <!-- 비밀번호가 같아야함. -->
				<small id="pwd_confirm_text" class="form-text" style="color:blue;">&nbsp;처음 입력한 비밀번호와 똑같이 입력해주세요.</small>		
		</div>
	</div>
	
	<div class="form-group row">
		<label for="ceo_name" class="col-sm-2 col-form-label col-form-label-lg">점주명</label>
		<div class="col-sm-10">
			<input type="text" class="form-control form-control-lg" name="ceo_name" id="ceo_name" />
		</div>
	</div>
	
	<div class="form-group row">
		<label for="addr" class="col-sm-2 col-form-label col-form-label-lg">매장 주소</label>
		<div class="col-sm-10">
			<input type="text" class="form-control form-control-lg" name="addr" id="addr" />
		</div>
	</div>
	<div class="form-group row">
		<label for="addr" class="col-sm-2 col-form-label col-form-label-lg">카페 소개글</label>
		&emsp;<textarea class="form-control" name="context" id="context" cols="45" rows="3"></textarea><br/>
		<br/><small id="ct_confirm_text" style="color:#754F44;"class="form-text ">&nbsp;&nbsp;70자 이내로 작성해주세요</small>
	</div>
		<input type="hidden" name = "lat" id="lat" value= "" />
		<input type="hidden" name = "lng" id="lng" value= "" />
		<div class="text-right">
			<button id="submit_btn" type="submit" class="btn btn-primary">가입하기</button>
			<button type="reset" class="btn btn-warning">취소하기</button>
		</div>
	</form>

<!-- MAP -->
		
		

		<h1 class="text-center">매장 검색</h1>
		<div class="col-sm-4 input-group mb-2" style="margin-top:2%; margin: 0 auto;">
				<input type="text"  placeholder="Search" class="form-control " name="search_place" id="search_place" />
				<button type="button" id="button1" class="btn btn-info" onclick="search()">search</button>
		</div>
			
			
		<div class="container">
			<div class="mb-5" id="map" style=" z-index:666; width:auto;height:500px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cb94d4b68f05ba9f51920ea80f18b9b&libraries=services"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/map.js"></script>
		</div>

	<form action="profile_upload.do" method="post" 
		enctype="multipart/form-data" id="profileForm">
	<input type="file" name="image" 
		accept=".jpg, .jpeg, .png, .JPG, .JPEG" id="image"/>
	</form>

	</div>
		<script>
		//비밀번호를 검증할 정규 표현식
		var reg_pwd=/^.{5,10}$/;
		$("#pwd, #pwd2").on("input", function(){
			//입력한 비밀번호를 읽어온다. 
			var inputPwd=$("#pwd").val();
			var inputPwd2=$("#pwd2").val();
			//형식에 맞게 입력했는지 여부
			var result=reg_pwd.test(inputPwd);
			$("#pwd").removeClass("is-valid is-invalid");
			if(result){//형식에 맞게 입력 했다면
				if(inputPwd==inputPwd2){//비밀번호 확인란과 동일하게 입력했다면
					isPwdValid=true;
					$("#pwd").addClass("is-valid ");
				}else{//확인란과 다르게 입력했다면
					isPwdValid=false;
					$("#pwd").addClass("is-invalid");
				}
			}else{//형식에 맞게 입력 하지 않았다면
				isPwdValid=false;
				$("#pwd").addClass("is-invalid");
			}
		});
		
		function search(){
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			var input = document.getElementById("search_place").value;
			console.log(input);
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(); 

			// 키워드로 장소를 검색합니다
			ps.keywordSearch(input, placesSearchCB); 

			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new kakao.maps.LatLngBounds();

			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			        }       

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}

			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(place.y, place.x) 
			    });

			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
		            var lat=marker.getPosition().Ha; 
		            var lng=marker.getPosition().Ga;
		            document.getElementById("lat").value=lat;
		            document.getElementById("lng").value=lng;
		            //String lng = place.x;
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
		}
			

			$("#ceo_signup_form").on("submit", function(){
				var cname = $("input#cname").val();
				var pwd=$("input#pwd").val();
				var pwd2=$("input#pwd2").val();
				var ceoname=$("input#ceo_name").val();
				var addr=$("input#addr").val();
				var lat = $("input#lat").val();
				var lng = $("input#lng").val();
				var context= $("#context").val();
				console.log(cname,pwd,pwd2,ceoname,addr,lat,lng);
				if(cname==""||pwd==""||pwd2==""||ceoname==""||addr==""||lat==""||lng==""||context==""){
					alert("입력 양식을 채워주세요");
					return false;
				}else{
					if(pwd!=pwd2){
						alert("비밀번호를 확인해주세요");
						$("#pwd_confirm_text").css("color","red");
						return false;
					}else if(context.length>70){
						alert("소개글이 너무 깁니다.");
						$("#ct_confirm_text").css("color","red");
						return false;
					}else{
						var signup= confirm("정말로 가입하시겠습니까?");
						if(signup){
							return true;
						}else{
							return false;
						}
					}
				}
			});
			
			
		</script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로필 링크를 클릭했을때 실행할 함수 등록 
	$("#profileLink").on("click", function(){
		//input type="file" 을 강제 클릭한다.
		$("#image").click();
	});
	
	//이미지를 선택했을때 실행할 함수 등록
	$("#image").on("change", function(){
		//폼을 강제 제출한다.
		$("#profileForm").submit();
	});
	
	//폼이 ajax 로 제출될수 있도록 플러그인을 동작 시킨다.
	$("#profileForm").ajaxForm(function(data){
		//프로필 이미지를 업데이트 한다. data => {imageSrc:"/upload/xxx.jpg"}
		$("#profileImage")
		.attr("src","${pageContext.request.contextPath }"+data.imageSrc);
		//회원정보 수정폼 전송될때 같이 전송 되도록한다.
		$("#profile").val(data.imageSrc);// input type="hidden" 의 value값
	})
</script>
<!-- footer -->
<jsp:include page="../footer.jsp">
	<jsp:param value="signup_form_ceo" name="thisPage"/>
</jsp:include>
	
</body>
</html>