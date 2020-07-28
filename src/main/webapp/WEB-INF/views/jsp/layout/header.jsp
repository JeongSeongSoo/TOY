<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<header>
<div class="container">
	<div class="web">
		<div class="table-row">
			<div class="table-cell logo">
				<a href="/page/daily"><img src="/resources/img/dog.png" style="height: 50px;"></img></a>
			</div>
			<div class="table-cell">
				<a href="/page/daily">크루</a>
			</div>
			<div class="table-cell">
				<a href="/page/chance">지원하기</a>
			</div>
			<div class="table-cell">
				<a href="#">나의 이력서</a>
			</div>
			<div class="table-cell login">
				<sec:authorize access="isAnonymous()">
					<a href="/login/login">로그인</a>
					<span class="category">│</span>
					<a href="/login/join">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.userNm" />님
					<span class="category">│</span>
					<a href="/login/logout">로그아웃</a>
			</sec:authorize>
			</div>
		</div>
		<!-- 
		<div class="menuForm" style="text-align: center;">
			<a href="/page/daily"><img src="/resources/img/dog.png" style="height: 50px;"></img></a>
			<sec:authorize access="isAnonymous()">
				<a href="/page/daily">크루</a>
			    <a href="/page/chance">지원하기</a>
			    <a href="#">나의 이력서</a>
		    </sec:authorize>
			<sec:authorize access="isAnonymous()">
				<a href="/login/login">로그인</a>
				<span class="category">│</span>
				<a href="/login/join">회원가입</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.userNm" />님
				<span class="category">│</span>
				<a href="/login/logout">로그아웃</a>
			</sec:authorize>
		</div>
		 -->
		 
	</div>
	<div class="row app">
		<div class="row">
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
				<a href="/page/daily"><img src="/resources/img/dog.png" style="margin-left:20px; height: 80px;"></img></a>
			</div>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 menuBtn">
				<img src="/resources/img/button.png"></img>
			</div>
		</div>
		<div class="row">
			<div class="navigation-list" id="navigation-list">
				<ul>
					<sec:authorize access="isAuthenticated()">
						<li><a href="#">크루</a></li>
						<li><a href="#">지원하기</a></li>
						<li><a href="#">나의 이력서</a></li>
						<li><a href="/login/logout">로그아웃</a></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="/login/login">로그인</a></li>
						<li><a href="/login/join">회원가입</a></li>
					</sec:authorize>
				</ul>
		    </div>
		</div>
	</div>
</div>
</header>
</body>
</html>