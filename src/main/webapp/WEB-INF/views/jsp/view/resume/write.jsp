<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/resume/write.css" />
</head>
<body>
<div class="container">
	<div class="row writeHeader">
		<div class="col-*-*">
		<h2>지원서</h2>
		<h5>HOME > 지원서</h5>
		</div>    	
	</div>
	<div class="row writeBox">
		<div class="col-*-* header">
			<span class="step">STEP.</span><span> 나의 지원서</span>
		</div>
		<hr/>
		<div class="writeDiv">
			<!-- 경력사항 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td colspan="3">경력사항 <span style="color: red;"> *</span></td>
				</tr>
				<tr style="font-size: 15px;">
					<td style="width: 85%;">아르바이트 및 증빙이 불가능한 경력만 있을 경우[경력 없음]을 체크해주세요.<br/>인턴십 기재는 가능하나 경력으로 인정되지는 않습니다.</td>
					<td style="width: 5%; text-align: right;"><input type="checkbox" style="width:30px; height: 30px; margin-right: 10px;"/></td>
					<td style="width: 10%;">경력 없음</td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="input" style="width: 55%;">
							<input type="text" placeholder="회사명" />		
						</div>
						<div class="input" style="width: 11%;">
							<input type="text" placeholder="입사일" />				
						</div>
						<div class="input" style="width: 11%;">
							<input type="text" placeholder="퇴사일" />				
						</div>
						<div class="input" style="width: 16%;">
							<select>
								<option>기타</option>
								<option>정규직</option>
								<option>계약직</option>
								<option>파견직</option>
								<option>인턴</option>
							</select>				
						</div>
						<div class="input" style="width: 7%;">
							<input type="button" value="저장" />				
						</div>
						<div class="input" style="width: 35%;">
							<input type="text" placeholder="직급" />				
						</div>
						<div class="input" style="width: 65%;">
							<input type="text" placeholder="담당업무" />				
						</div>
					</td>
				</tr>
			</table>
			<!-- 프로젝트 수행이력 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td colspan="3">프로젝트 수행이력 <span style="color: red;"> *</span></td>
				</tr>
				<tr style="font-size: 15px;">
					<td style="width: 85%;">프로젝트 수행이력이 없는 지원자는 [수행이력 없음]을 체크해주세요. (프로젝트는 종류/분야의 제한이 없습니다.)</td>
					<td style="width: 5%; text-align: right;"><input type="checkbox" style="width:30px; height: 30px; margin-right: 10px;"/></td>
					<td style="width: 10%;">수행이력 없음</td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="input" style="width: 55%;">
							<input type="text" placeholder="회사명" />		
						</div>
						<div class="input" style="width: 11%;">
							<input type="text" placeholder="입사일" />				
						</div>
						<div class="input" style="width: 11%;">
							<input type="text" placeholder="퇴사일" />				
						</div>
						<div class="input" style="width: 16%;">
							<select>
								<option>기타</option>
								<option>사내프로젝트</option>
								<option>외주</option>
								<option>프리랜서</option>
							</select>				
						</div>
						<div class="input" style="width: 7%;">
							<input type="button" value="저장" />				
						</div>
						<div class="input" style="width: 100%;">
							<input type="text" placeholder="소속회사명" />				
						</div>
						<div class="input" style="width: 100%;">
							<input type="text" placeholder="주사용기술(서비스사업/스탭 직군은 본인의 주요 역할을 기입)" />				
						</div>
						<div class="input" style="width: 100%;">
							<textarea rows="5" placeholder="프로젝트에 대한 소개와 본인이 수행한 역할을 상세히 작성해주세요.(1500자 이내)"></textarea>				
						</div>
					</td>
				</tr>
			</table>
			<!-- 병역정보 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>병역정보 <span style="color: red;"> *</span></td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 40%; font-size: 15px;">
							<select>
								<option>해당없음</option>
								<option>병역필_현역(병)</option>
								<option>병역필_현역(장교)</option>
								<option>병역필_현역(부사관)</option>
								<option>병역필_공익근무요원</option>
								<option>병역필_산업기능요원</option>
								<option>병역필_전문연구요원</option>
								<option>복무중(전직가능)_전문연구요원</option>
								<option>병역면제</option>
								<option>미필</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			<!-- 자기소개 * -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>자기소개 <span style="color: red;"> *</span></td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 100%; font-size: 15px;">
							<textarea rows="8" placeholder="프로젝트에 대한 소개와 본인이 수행한 역할을 상세히 작성해주세요.(1500자 이내)"></textarea>
						</div>
					</td>
				</tr>
			</table>
			<!-- 포트폴리오 -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>포트폴리오</td>
				</tr>
				<tr style="font-size: 15px;">
					<td>포트폴리오 파일은 1개만 첨부됩니다. 복수 파일을 올리실 경우 압축하여 올려주시길 바라며,<br/>용량이 200MB보다 클 경우 클라우드 공유 URL 링크를 추가해주세요.</td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 40%;">
							<input type="text" placeholder="첨부파일" />				
						</div>
						<div class="input" style="width: 10%;">
							<input type="button" value="파일추가" />				
						</div>
						<div class="input" style="width: 40%;">
							<input type="text" placeholder="URL" />				
						</div>
						<div class="input" style="width: 10%;">
							<input type="button" value="주소추가" />				
						</div>
					</td>
				</tr>
			</table>
			<!-- 자격/수상 -->
			<table style="width: 100%; text-align: left; font-size: 20px;">
				<tr>
					<td>자격/수상</td>
				</tr>
				<tr>
					<td>
						<div class="input" style="width: 13%;">
							<select>
								<option>자격증</option>
								<option>수상경력</option>
							</select>				
						</div>
						<div class="input" style="width: 35%;">
							<input type="text" placeholder="시험명" />				
						</div>
						<div class="input" style="width: 20%;">
							<input type="text" placeholder="주최기관" />				
						</div>
						<div class="input" style="width: 10%;">
							<input type="text" placeholder="점수/급" />				
						</div>
						<div class="input" style="width: 15%;">
							<input type="text" placeholder="취득일" />				
						</div>
						<div class="input" style="width: 7%;">
							<input type="button" value="저장" />				
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
			<input class="addBtn" type="button" value="작성완료"/>
		</div>
	</div>
</div>
</body>
</html>
