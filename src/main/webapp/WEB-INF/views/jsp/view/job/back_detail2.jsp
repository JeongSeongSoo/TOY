<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/job/detail.css" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<script src="/resources/js/job/detail.js"></script>
</head>
<body>
<div class="container">
	<div class="row writeHeader">
		<div class="col-*-*">
		<h2>공고</h2>
		<h5>HOME > 채용</h5>
		</div>    	
	</div>
	<input type="hidden" id="jid" name="jid" value="${vo.jid}">
	<div class="row writeBox">
		<div class="col-*-* header">
			<span class="step">STEP.</span><span> 상세</span>
		</div>
		<hr/>
		<div class="writeDiv">
			<!-- 공고명 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr style="font-size: 24px;">
					<td>${vo.title}</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>${vo.company} | ${vo.employStatus} | ${vo.closeDt} | ${vo.location}</td>
				</tr>
			</table>
			<!-- 직원 유형 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>◆ 직원 유형</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>${vo.employStatus}</td>
				</tr>
			</table>
			<!-- 영입 인원 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>◆ 영입 인원</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>${vo.volunteer}명</td>
				</tr>
			</table>
			<!-- 조직소개 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>◆ 조직소개</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>${vo.groupContent}</td>
				</tr>
			</table>
			<!-- 업무내용 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>◆ 업무내용</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>${vo.businessContent}</td>
				</tr>
			</table>
			<!-- 지원자격 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>◆ 지원자격</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>${vo.supportContent}</td>
				</tr>
			</table>
			<!-- 필독사항 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>◆ 필독사항</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>${vo.mustContent}</td>
				</tr>
			</table>
			<!-- 근로제도 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>◆ 근로제도</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>${vo.workContent}</td>
				</tr>
			</table>
		</div>
		<hr/>
		
		<div class="col-*-*">
			<input class="btn" id="empty" type="submit" value="지원"/>
			<input class="btn" id="modifyBtn" onclick="del();" type="button" value="수정"/>
			<input class="btn" id="deleteBtn" onclick="del();" type="button" value="삭제"/>
		</div>
	</div>
</div>
</body>
</html>
