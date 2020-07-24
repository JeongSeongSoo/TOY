var map, marker1;
var lineArr = [];

function initTmap(){
	
 	// 1. 지도 띄우기
	map = new Tmapv2.Map("map_div", {
		center: new Tmapv2.LatLng(37.570028, 126.986072),
		width : "100%",
		height : "400px",
		zoom : 15,
		zoomControl : true,
		scrollwheel : true
		
	});
	// 마커 초기화
 	marker1 = new Tmapv2.Marker({
 		icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
 	});
	
	map.addListener("mouseup", function onMouseUp(evt){
		var centerLonLat = map.getCenter();
		var centerlon = centerLonLat._lng.toFixed(6);
		var centerlat = centerLonLat._lat.toFixed(6);
		
		//지도가 이동이 끝날때마다 지도의 중심좌표를 경도 위도 텍스트 란에 값을 넣어줍니다. 
		$('#longitude').val(centerlon);//중심좌표의 경도입니다.
		$('#latitude').val(centerlat);//중심좌표의 위도입니다.
		
		$("#lon2").text(centerlon);
		$("#lat2").text(centerlat);
		
		$(".over").show();
	});


	$("#btn_select").click(function(){
		$(".over").hide();
		
		var lon = $('#longitude').val();//입력한 경도 입니다.
		var lat = $('#latitude').val();//입력한 위도 입니다.
		
		$("#lon2").text(lon);
		$("#lat2").text(lat);
		
		// 2. 요청 좌표 마커 찍기
		//기존 마커 삭제
		marker1.setMap(null);
		
		var markerPosition = new Tmapv2.LatLng(lat, lon);
		//마커 올리기
	 	marker1 = new Tmapv2.Marker({
	 		position : markerPosition,
	 		icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
			iconSize : new Tmapv2.Size(24, 38),
			map:map
	 	});
		map.setCenter(markerPosition);
		map.setZoom(16);
		
		// 3. API 사용요청
		$.ajax({
			method:"GET",
			//url:"http://223.39.119.112/tmapv20/road/nearToRoad?version=1",//가까운 도로 찾기 api 요청 url입니다.
			url:"https://apis.openapi.sk.com/tmap/road/nearToRoad?version=1",//가까운 도로 찾기 api 요청 url입니다.
			async:false,
			data:{
				"appKey" : "발급AppKey",
				"lon" : lon,
				"lat" : lat
			},
			success:function(response){
				
				var resultHeader, resultlinkPoints;
				
				if(response.resultData.header){
					resultHeader = response.resultData.header;
					resultlinkPoints = response.resultData.linkPoints;
					
					var tDistance = "총 거리 : " + resultHeader.totalDistance + "m,";
					var tTime = " 제한 속도 : " + resultHeader.speed +"km/H,";	
					var rName = " 도로명 : " + resultHeader.roadName +", ";
					var linkId = " linkId : " + resultHeader.linkId + resultHeader.idxName +", ";
					var laneType = " laneType : " + resultHeader.laneType +", ";
					var lane = " lane : " + resultHeader.lane +", ";
					var tlinkId = " tlinkId : " + resultHeader.tlinkId;
					
					$("#result").text(tDistance+tTime+rName+linkId+laneType+lane+tlinkId);
					
					// 기존 라인 지우기
					if(lineArr.length > 0){
						for(var k=0; k<lineArr.length ; k++){
							lineArr[k].setMap(null);
						}
						//지운뒤 배열 초기화
						lineArr = [];
					}
					
					var drawArr = [];
					
					// Tmapv2.LatLng객체로 이루어진 배열을 만듭니다.
					for(var i in resultlinkPoints){
						var lineLatLng = new Tmapv2.LatLng(resultlinkPoints[i].location.latitude, resultlinkPoints[i].location.longitude);
						
						drawArr.push(lineLatLng);
					}
					
					//그리기
					var polyline_ = new Tmapv2.Polyline({
							path : drawArr,	//만든 배열을 넣습니다.
							strokeColor : "#FF0000",
							strokeWeight: 6,
							map : map
					});
					
					//라인 정보를 배열에 담습니다.
					lineArr.push(polyline_);
					
				}else{
					$("#result").text("가까운 도로 검색 결과가 없습니다.");
				}
			},
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		 
	});
} 