<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/join.css" />
<script src="/resources/js/join.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-*-*">
			<h2>회원가입</h2>
			<h5>HOME > 회원가입</h5>
		</div>
	</div>
	<div class="row loginBox">
		<form action="/login/join/add" method="post" id="joinForm">
			<div class="col-*-* header">
				<span class="step">STEP.</span><span> 정보 입력</span>
			</div>
			<hr />
			<div class="row login">
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 span">
					<span>아이디</span>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 input">
					<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요." maxlength="15">
					<span class="userIdError"></span>
					<div class="txt_msg">
						6자 ~ 15자 이내의 영문 소문자, 숫자, 특수문자@, ., _, - 만<br>사용할 수 있습니다.
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 span">
					<span>비밀번호 입력</span>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 input">
					<input type="password" class="userPw" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요." maxlength="20">
					<span class="userPwError"></span>
					<div class="txt_msg">
						영문, 숫자, 특수문자 중 세 가지 조합 : 9자 ~ 20자 사용 가능<br>
						사용가능특수문자 : ! " # $ % & '( ) * + , - . / : ; &gt; = &lt; ? @ [ \ ] ^ _ { | } ~<br>
						영문 대소문자 구분 / 아이디 재사용 불가<br>
						3자 이상 연속 영문 / 숫자 조합 불가 (ex: aaa, 111)
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 span">
					<span>비밀번호 확인</span>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 input">
					<input type="password" id="userPwCheck" placeholder="비밀번호를 입력해주세요." maxlength="20">
					<span class="userPwCheckError"></span>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 span">
					<span>이름</span>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 input">
					<input type="text" id="userNm" name="userNm" placeholder="성명을 입력해주세요." maxlength="10">
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 span">
					<span>이메일</span>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 input">
					<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요." maxlength="40">
					<span class="emailError"></span>
					<div class="txt_msg">
						이메일 형식에 맞게 작성해야 사용할 수 있습니다.<br>예) ss.jeong@bluechip.com
					</div>
				</div>
			</div>
			<hr />
			<div class="col-*-*">
				<input class="loginSubmit" id='loginSubmit' type="button" value="가입"/>
			</div>
		</form>
	</div>
</div>
</body>
</html>