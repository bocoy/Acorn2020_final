<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 String thisPage = request.getParameter("thisPage");
%>
<div style="width:100%">
	<div class="jumbotron text-center mb-0 <%if(!thisPage.equals("index")&&!thisPage.equals("signup_form_ceo")){%>fixed-bottom <%} %>" style="background-color: rgba(236, 115, 87, 0.8);"> 
		<h3 class="text-secondary">CoupKeep</h3> 
		<p>CoupKeep <span class="text-primary">Boseong</span> / Designed by <span class="text-primary">Boseong</span></p> 
	</div>
</div>