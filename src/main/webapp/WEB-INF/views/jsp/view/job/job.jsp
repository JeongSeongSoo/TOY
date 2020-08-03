<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/job/job.css" />
<script src="/resources/js/job/job.js"></script>
</head>
<body>
<div class="container">
	<div class="row jobHeader">
		<div class="col-*-*">
		<h2>공고</h2>
		<h5>HOME > 채용</h5>
		</div>    	
	</div>
	<div class="row jobBox">
		<div class="col-*-* header">
			<span class="step">STEP.</span><span> 채용</span>
		</div>
		<hr/>
		<div class="row">	
	 		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<table id="jobList" style="width: 100%"></table>
	 		</div>
		</div>
		<hr/>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="col-*-*">
				<input class="addBtn" id="addBtn" type="button" value="추가"/>
			</div>
		</sec:authorize>
	</div>
</div>
</body>
</html>
