<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/error.css" />
</head>
<body>
<div class="container">
	<div class="row errorHeader">
		<div class="col-*-*">
		<h2>보안</h2>
		<h5>HOME > 에러</h5>
		</div>    	
	</div>
	<div class="row errorBox">
		<div class="col-*-* header">
			<span class="step">STEP.</span><span> 에러 페이지</span>
		</div>
		<hr/>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 webDiv">
				<ul>
					<li>잘못된 접근페이지 입니다. <a href="${defaultPath}">메인 페이지로 이동</a></li>
					<li>자세한 내용은 관리자에게 문의바랍니다. <a href="#">관리자에게 문의</a></li>
				</ul>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 moDiv">
				잘못된 접근페이지 입니다.<br/><br/> 
				<a href="${defaultPath}">메인 페이지로 이동</a><br/><br/><br/>
				자세한 내용은 관리자에게 문의바랍니다.<br/><br/>
				<a href="#">관리자에게 문의</a>
			</div>
		</div>
		<hr/>
	</div>
</div>
</body>
</html>
