<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myoption.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<body style="font-family: 'jua';">

	<!-- header -->
	<jsp:include page="../navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>

	<div class="container">
		<a href="private/insertform.do">새글 작성</a>
		<h1>글 목록 입니다.</h1>
		<table class="table table-striped table-sm">
			<thead class="thead-dark">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td><a href="detail.do?num=${tmp.num }&condition=${condition }&keyword=${encodedK }">${tmp.title }</a></td>
					<td>${tmp.viewCount }</td>
					<td>${tmp.regdate }</td>
				</tr>
			</c:forEach>		
			</tbody>
		</table>
		<div class="page-display">
			<ul class="pagination pagination-sm">
			<c:if test="${startPageNum ne 1 }">
				<li class="page-item"><a class="page-link" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="page-ite\m active"><a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li class="page-item"><a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a></li>
			</c:if>
			</ul>	
		</div>
		<hr style="clear:left;"/>
		<form action="list.do" method="get">
			<label for="condition">검색조건</label>
			<select name="condition" id="condition">
				<option value="title_content" <c:if test="${condition eq 'title_content' }">selected</c:if>>제목+내용</option>
				<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
			</select>
			<input value="${keyword }" type="text" name="keyword" placeholder="검색어..."/>
			<button type="submit">검색</button>
		</form>	
	</div>

	<!-- footer -->
	<jsp:include page="../footer.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>


</body>
</html>
