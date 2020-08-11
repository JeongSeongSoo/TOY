<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/login/login.css" />
</head>
<body>
<div class="container">
	<div class="row loginHeader">
		<div class="col-*-*">
		<h2>로그인</h2>
		<h5>HOME > 로그인</h5>
		</div>    	
	</div>
	<div class="row loginBox">
		<form action="/login/check" method="post">
		<div class="col-*-* header">
			<span class="step">STEP.</span><span> 로그인</span>
		</div>
		<hr/>
		<div class="row login">	
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 span">
	 			<span>아이디</span>
	 		</div>
	 		<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 userId">
	 			<input type="text" name="username" placeholder="아이디를 입력해주세요.">
	 		</div>
	 		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 span">
	 			<span>비밀번호</span>
	 		</div>
	 		<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
	 			<input type="password" name="password" placeholder="비밀번호를 입력해주세요.">
	 		</div>
		</div>
		<hr/>
		<div class="col-*-*">
			<input class="loginSubmit" type="submit" value="로그인"/>
		</div>
		</form>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 find">
				<ul>
					<li>처음 지원하시는 분들은 지원자 등록을 먼저 해주세요. <a href="${joinPath}">신규지원자 등록</a></li>
					<li>비밀번호를 잊어버렸나요? <a href="#">비밀번호 찾기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>
