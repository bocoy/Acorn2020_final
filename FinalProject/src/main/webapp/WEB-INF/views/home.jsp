<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COUKEEP</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myoption.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<style>
	/* 이미지를 작은 원형으로 만든다. */
	#sideImage{
		width: 280px;
		height: 180px;
		border: 1px solid #cecece;	
	}
	.loader{
		position: fixed; /* 좌하단 고정된 위치에 배치 하기 위해 */
		width: 100%;
		left: 0;
		bottom: 0;
		text-align: center; /* 이미지를 좌우로 가운데  정렬 */
		z-index: 1000;
		display: none; /* 일단 숨겨 놓기 */
	}
</style>
</head>
<body style="font-family: 'jua';">

	<!-- header -->
	<jsp:include page="navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<!-- body map -->
	<div class="container.fluid">
		<div id="map" style=" z-index:666; width:auto;height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cb94d4b68f05ba9f51920ea80f18b9b&libraries=services"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/map.js"></script>
	</div>
	
	<script>
	//줌 컨트롤러 추가
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	//로그인한 id세션이 있으면 보유 쿠폰을 보유한 카페만 마커를 출력
	
	//마커 이미지 불러오기
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	for (var i = 0; i < positions.length; i ++) {
	    // 마커 이미지의 이미지 크기 입니다	
	    var imageSize = new kakao.maps.Size(24, 35); 
		// 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	    
		// 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position:positions[i].latlng, // 마커를 표시할 위치
	        //title : positions[i].info, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
	        image : markerImage, // 마커 이미지 
	        clickable: true
	    });
		
	 // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	    	
	        content: positions[i].info // 인포윈도우에 표시할 내용
	    });
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    kakao.maps.event.addListener(marker, 'click', zoomin(map, marker, infowindow));
	}
		function zoomin(map, marker, infowindow) {
			return function() {
				var lat=marker.getPosition().Ha;
				var lng=marker.getPosition().Ga;
				map.setLevel(1, {anchor: new kakao.maps.LatLng(lat, lng),animate: true});
			};
		}
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		    	$("#sidebar_box").empty();
		    	var lat=marker.getPosition().Ha;
				var lng=marker.getPosition().Ga;
				$.ajax({
					method:"post", 
					url:"ajax/msoverView.jsp",
					data:{"lat":lat,"lng":lng},
					success:function(card){
						$("#sidebar_box").append(card);
					}
				})
		    	infowindow.open(map, marker);
		    	var duration = 800;
				var $side = $('#sidebar');
		    	$side.toggleClass('open');
				$side.stop(true).animate({left:'0px'}, duration);
				$side.find('span.btn_t').text('CLOSE');
		        
		    };
		}
		
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		    	$("#sidebar_box").empty();
		        infowindow.close();
		        var duration = 800;
				var $side = $('#sidebar');
		        $side.stop(true).animate({left:'-400px'}, duration);
				$side.find('span.btn_t').text('OPEN');
		    };
		}
	</script>

	<!-- side menu -->
	<aside class="border-left-0" id="sidebar" style="z-index:999; margin-top: 5%; border-radius: 5%; ">	
		<div class="col-sm-10 input-group" style="margin-top:15%; display:flex; justify-content: center; align-items:center;">
			<input type="text" aria-describedby="button1" placeholder="Search" class="form-control form-control-md" name="search_place" id="search_place" autofocus/>
			<button type="submit" id="button1" class="btn btn-info" >search</button>
		</div>	
		<button class="rounded-right" id="side_btn"><span class="btn_t"><img src="${pageContext.request.contextPath }/resources/images/menuIcon.png"/></span></button>

		
		<div id="sidebar_box" style="overflow:auto; width:400px; height:550px;">	
		
		</div>	
			<script>	
			$("#button1").on("click",function(){
				//버튼을 눌렀을때 기존에 카드는 사라지게 한다
				$("#sidebar_box").empty();
				//서치한 내용을 가지고온다
				var search=$("#search_place").val();
				//ajax로 카드를 가지고 온다
				$.ajax({
					url:"${pageContext.request.contextPath}/ajax/sidebar_card.jsp",
					method:"get",
					data:{'search':search},
					success:function(card){
						$("#sidebar_box").append(card);
					}
				});	
			});
		</script>
	</aside>
	<script src="${pageContext.request.contextPath}/resources/js/sidebar.js?v=<%=System.currentTimeMillis() %>"></script>
	
	<section>
		<script> $('.carousel').carousel({ interval: 2000 //기본 5초 }) </script>
		<div class="container"><h2>Carousel practice</h2></div> <div id="demo" class="carousel slide" data-ride="carousel"> <div class="carousel-inner"> <!-- 슬라이드 쇼 --> <div class="carousel-item active"> <!--가로--> <img class="d-block w-100" src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="First slide"> <div class="carousel-caption d-none d-md-block"> <h5>TEST</h5> <p>testtesttest</p> </div> </div> <div class="carousel-item"> <img class="d-block w-100" src="https://images.pexels.com/photos/2355519/pexels-photo-2355519.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="Second slide"> </div> <div class="carousel-item"> <img class="d-block w-100" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide"> </div> <!-- / 슬라이드 쇼 끝 --> <!-- 왼쪽 오른쪽 화살표 버튼 --> <a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <!-- <span>Previous</span> --> </a> <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <!-- <span>Next</span> --> </a> <!-- / 화살표 버튼 끝 --> <!-- 인디케이터 --> <ul class="carousel-indicators"> <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작--> <li data-target="#demo" data-slide-to="1"></li> <li data-target="#demo" data-slide-to="2"></li> </ul> <!-- 인디케이터 끝 --> </div>
	</section>
	
	<!-- footer -->
	<jsp:include page="footer.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>

</body>
</html>