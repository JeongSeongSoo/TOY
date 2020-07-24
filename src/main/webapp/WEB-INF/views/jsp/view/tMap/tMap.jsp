<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/tMap.css" />
</head>
<body>
<div class="container">
	<div id="layout_wrap">
	 	<div>
			<span class="tit">경도</span> 
			<input type="text" id="longitude" name="longitude" value="126.9784039920235">
			<span class="tit">위도</span>
			<input type="text" id="latitude" name="latitude" value="37.566627074987274">
			<button id="btn_select">요청</button>
		</div>
		<p id="result"></p>
		<div id="map_wrap" class="map_wrap" style="position: relative;">
			<div id="map_div" class="wrap"></div>
		</div>
		<div class="map_act_btn_wrap clear_box"></div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=ac09ec40-09a2-49e0-afc0-d0d8cf1cba7d"></script>
<script src="/resources/js/tMap.js"></script>
</body>
</html>
