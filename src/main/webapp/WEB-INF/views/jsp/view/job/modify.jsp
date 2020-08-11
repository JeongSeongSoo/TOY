<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/job/write.css" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<script src="/resources/js/job/modify.js"></script>
</head>
<body>
<div class="container">
	<div class="row writeHeader">
		<div class="col-*-*">
		<h2>공고</h2>
		<h5>HOME > 채용</h5>
		</div>    	
	</div>
	<form action="/job/add" id="addForm" method="post">
	<div class="row writeBox">
		<div class="col-*-* header">
			<span class="step">STEP.</span><span> 수정</span>
		</div>
		<hr/>
		<div class="writeDiv">
			<!-- 공고명 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>공고명 <span style="color: red;"> *</span></td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="input" style="width: 100%;">
							<input type="text" name="title" placeholder="공고명" check title="공고명" value="${vo.title}" />		
						</div>
						<div class="input" style="width: 30%;">
							<input type="text" name="company" placeholder="회사명" check title="회사명" value="${vo.company}" />				
						</div>
						<div class="input" style="width: 15%;">
							<select name="employStatus" check title="고용형태" >
								<option value="0" <c:if test="${vo.employStatus eq '기타'}">selected</c:if>>기타</option>
								<option value="1" <c:if test="${vo.employStatus eq '정규직'}">selected</c:if>>정규직</option>
								<option value="2" <c:if test="${vo.employStatus eq '계약직'}">selected</c:if>>계약직</option>
								<option value="3" <c:if test="${vo.employStatus eq '파견직'}">selected</c:if>>파견직</option>
								<option value="4" <c:if test="${vo.employStatus eq '인턴'}">selected</c:if>>인턴</option>
							</select>				
						</div>
						<div class="input" style="width: 15%;">
							<!-- <input type="text" name="closeDt" placeholder="마감일" check title="마감일" /> -->
							<input type="text" name="closeDt" id="datepicker" class="datepicker" check title="마감일" value="${vo.closeDt}" />				
						</div>
						<div class="input" style="width: 25%;">
							<input type="text" name="location" placeholder="지역" check title="지역" value="${vo.location}" />				
						</div>
						<div class="input" style="width: 15%;">
							<select name="volunteer" check title="모집 인원" >
								<option value="1" <c:if test="${vo.volunteer == 1}">selected</c:if>>1명</option>
								<option value="2" <c:if test="${vo.volunteer == 2}">selected</c:if>>2명</option>
								<option value="3" <c:if test="${vo.volunteer == 3}">selected</c:if>>3명</option>
								<option value="4" <c:if test="${vo.volunteer == 4}">selected</c:if>>4명</option>
								<option value="5" <c:if test="${vo.volunteer == 5}">selected</c:if>>5명</option>
							</select>				
						</div>
					</td>
				</tr>
			</table>
			<!-- 조직소개 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>조직소개 <span style="color: red;"> *</span></td>
				</tr>
				<tr style="font-size: 15px;">
					<td>조직소개에 대해 상세히 작성해주세요.(2000자 이내)</td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 100%;">
							<textarea id="groupContent" name="groupContent" check title="조직소개" >${vo.groupContent}</textarea>
						</div>
					</td>
				</tr>
			</table>
			<!-- 업무내용 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>업무내용 <span style="color: red;"> *</span></td>
				</tr>
				<tr style="font-size: 15px;">
					<td>업무내용에 대해 상세히 작성해주세요.(2000자 이내)</td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 100%;">
							<textarea id="businessContent" name="businessContent" check title="업무내용" >${vo.businessContent}</textarea>				
						</div>
					</td>
				</tr>
			</table>
			<!-- 지원자격 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>지원자격 <span style="color: red;"> *</span></td>
				</tr>
				<tr style="font-size: 15px;">
					<td>지원자격에 대해 상세히 작성해주세요.(1000자 이내)</td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 100%;">
							<textarea id="supportContent" name="supportContent" check title="지원자격" >${vo.supportContent}</textarea>				
						</div>
					</td>
				</tr>
			</table>
			<!-- 필독사항 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>필독사항 <span style="color: red;"> *</span></td>
				</tr>
				<tr style="font-size: 15px;">
					<td>필독사항에 대해 상세히 작성해주세요.(100자 이내)</td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 100%;">
							<textarea id="mustContent" name="mustContent" check title="필독사항" >${vo.mustContent}</textarea>
						</div>
					</td>
				</tr>
			</table>
			<!-- 근로제도 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>근로제도 <span style="color: red;"> *</span></td>
				</tr>
				<tr style="font-size: 15px;">
					<td>근로제도에 대해 상세히 작성해주세요.(1000자 이내)</td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 100%;">
							<textarea id="workContent" name="workContent" check title="근로제도" >${vo.workContent}</textarea>		
						</div>
					</td>
				</tr>
			</table>
			<table style="width: 100%; text-align: center; font-size: 20px; margin-bottom: 30px;">
				<tr>
					<td colspan="2">지원서가 블루칩 상시 영입에 활용될 수 있도록 등록하시겠습니까?</td>
				</tr>
				<tr style="font-size: 16px;">
					<td style="text-align: right; width: 42%;"><input type="checkbox" style="width:30px; height: 30px; margin-right: 10px;"/></td>
					<td style="text-align: left; width: 58%;">상시 영입 활용 동의(선택)</td>
				</tr>
			</table>
		</div>
		<hr/>
		
		<div class="col-*-*">
			<input class="addBtn" id="addBtn" type="button" onclick="add();" value="작성완료"/>
		</div>
	</div>
	</form>			
</div>
</body>
</html>
