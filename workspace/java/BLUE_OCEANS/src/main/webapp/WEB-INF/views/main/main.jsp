<%@ page import="com.pcwk.ehr.cmn.StringUtil"%>
<%@ page import="com.pcwk.ehr.domain.BoardVO"%>
<%@ page import="com.pcwk.ehr.cmn.BookmarkVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="CP" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="${encoding}">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://unpkg.com/lightweight-charts@3.3.0/dist/lightweight-charts.standalone.production.js"></script>
	<link rel="stylesheet" href="${CP}/resources/css/header.css">
	<link rel="stylesheet" href="${CP}/resources/css/footer.css">
	<title>Insert title here</title>
	<style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            font-weight: bold;
        }

        .table-primary th {
            background-color: #007bff;
            color: white;
        }

        .negative {
            color: blue;
        }

        .positive {
            color: red;
        }

        .font-weight-bold {
            font-weight: bold;
        }
    </style>
    <script>
        $(document).ready(function() {
            function loadData() {
                $.ajax({
                    type: 'POST',
                    url: 'http://192.168.0.74:5001/blue-oceans/search-top10-stock',
                    headers: {
                        'accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    data: JSON.stringify({}),
                    mode: 'cors',
                    success: function(result) {
                        // Create table and append it to the container
                        var table = "<h5 style='font-size: 26px; font-weight:bold; margin-bottom: 20px;'>" + '거래량 상위 10개 종목</h5>';
                        
                        table += '<table border="1" class="table table-sm">' +
                            '<thead>' +
                                '<tr class="table-primary">' +
                                    '<th class="text-center font-weight-bold">No.</th>' +
                                    '<th class="text-center font-weight-bold">종목</th>' +
                                    '<th class="text-center font-weight-bold">현재가</th>' +
                                    '<th class="text-center font-weight-bold">고가</th>' +
                                    '<th class="text-center font-weight-bold">저가</th>' +
                                    '<th class="text-center font-weight-bold">전일비</th>' +
                                    '<th class="text-center font-weight-bold">등락률</th>' +
                                    '<th class="text-center font-weight-bold">거래량</th>' +
                                '</tr>' +
                            '</thead>' +
                            '<tbody>';

                        // Loop through the data and add rows to the table
                        $.each(result.data, function(index, dataItem) {
						    var changesClass = dataItem.ChagesRatio < 0 ? 'negative' : (dataItem.ChagesRatio > 0 ? 'positive' : '');
						    var changesRatio = "";
						    
						    if (dataItem.ChagesRatio === null) {
                                changesRatio =  "0" + '%';
					        } else {
					        	changesRatio =  dataItem.ChagesRatio + '%';
					        }
						    
						    
						    var closeClass = dataItem.Changes < 0 ? 'negative' : (dataItem.Changes > 0 ? 'positive' : '');
						
						    // 아이콘 추가 로직
						    var closeIcon = '';
						    if (closeClass === 'positive') {
						        closeIcon = '<span class="icon">▲</span>';
						    } else if (closeClass === 'negative') {
						        closeIcon = '<span class="icon">▼</span>';
						    }
						
						    table += '<tr>' +
						        '<td class="no text-center font-weight-bold">' + (index+1) + '</td>' +
						        '<td class="name text-start font-weight-bold">&nbsp' + dataItem.Name + '</td>' +
						        '<td class="close text-end ' + closeClass + ' font-weight-bold">' + closeIcon + ' ' + numberWithCommas(dataItem.Close) + '&nbsp</td>' +
						        '<td class="high text-end font-weight-bold">' + numberWithCommas(dataItem.High) + '&nbsp</td>' +
						        '<td class="low text-end font-weight-bold">' + numberWithCommas(dataItem.Low) + '&nbsp</td>' +
						        '<td class="changes text-end ' + changesClass + ' font-weight-bold">' + numberWithCommas(dataItem.Changes) + '&nbsp</td>' +
						        '<td class="chagesRatio text-end ' + changesClass + ' font-weight-bold">' + changesRatio + '&nbsp</td>' +
						        '<td class="volume text-end font-weight-bold">' + numberWithCommas(dataItem.Volume) + '&nbsp</td>' +
						    '</tr>';
						});
                        table += '</tbody></table>';
                        $('#tableContainer').html(table);
                    },
                    error: function(xhr, status, error) {
                        alert(status + ':' + error);
                    },
                });
            }

            loadData(); // Call the function to load data when the page loads
        });

    // 천단위 쉼표를 추가하는 함수
    function numberWithCommas(x) {
    	if (x === null) {
    		return 0;
    	} else {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	}
    	
    }
    function today(){
    	const today = new Date();
    	const year = today.getFullYear();
    	const month = String(today.getMonth() + 1).padStart(2, '0');
    	const day = String(today.getDate()).padStart(2, '0');
    	const formattedDate = year+"-"+month+"-"+day;
    	return formattedDate;
    }
    </script>
</head>
<body>	
  <div class="container">
    <div class="row" style="padding: 0px 90px 0px 90px;">   
	    <c:choose>
	        <c:when test="${empty sessionScope.user}">
	        <!-- 로그인 후 이용해주세요 메시지 표시 -->
	        </c:when>
	        <c:otherwise>       
            <!-- AI 추천  -->
	        <h5 style='font-size: 26px; font-weight:bold; margin-bottom: 20px'>오늘의 AI 추천</h5>
	        <div class="card-group" style="margin-bottom: 40px;">
	          <div class="card" style="margin-right: 10px">
                <div class="card-body" id="ai_chart1-6" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px;">
                  <h5 id="ai_chart1-1" class="card-title" style='font-weight:bold; font-size: 22px;'></h5>
                  <p id="ai_chart1-2" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p id="ai_chart1-3" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart1-4" style='font-size: 9px;'></small></p>
                </div>
	            <div id="ai_chart1" class="card-img-top"></div>
                <div style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px; padding-left: 10px; padding-bottom: 5px">
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart1-5" style='font-size: 8px;'></small></p>
                </div>
	          </div>
	          <div class="card" style="margin-right: 10px">
                <div class="card-body" id="ai_chart2-6" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px;">
                  <h5 id="ai_chart2-1" class="card-title" style='font-weight:bold; font-size: 22px;'></h5>
                  <p id="ai_chart2-2" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p id="ai_chart2-3" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart2-4" style='font-size: 9px;'></small></p>
                </div>
	            <div id="ai_chart2" class="card-img-top" ></div>
                <div style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px; padding-left: 10px; padding-bottom: 5px">
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart2-5" style='font-size: 8px;'></small></p>
                </div>
	          </div>
	          <div class="card" style="margin-right: 10px">
                <div class="card-body" id="ai_chart3-6" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px;">
                  <h5 id="ai_chart3-1" class="card-title" style='font-weight:bold; font-size: 22px;'></h5>
                  <p id="ai_chart3-2" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p id="ai_chart3-3" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart3-4" style='font-size: 9px;'></small></p>
                </div>
	            <div id="ai_chart3" class="card-img-top" ></div>
                <div style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px; padding-left: 10px; padding-bottom: 5px">
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart3-5" style='font-size: 8px;'></small></p>
                </div>
	          </div>
	          <div class="card" style="margin-right: 10px">
                <div class="card-body" id="ai_chart4-6" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px;">
                  <h5 id="ai_chart4-1" class="card-title" style='font-weight:bold; font-size: 22px;'></h5>
                  <p id="ai_chart4-2" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p id="ai_chart4-3" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart4-4" style='font-size: 9px;'></small></p>
                </div>
	            <div id="ai_chart4" class="card-img-top" ></div>
                <div style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px; padding-left: 10px; padding-bottom: 5px">
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart4-5" style='font-size: 8px;'></small></p>
                </div>
	          </div>
	          <div class="card">
                <div class="card-body" id="ai_chart5-6" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px;">
                  <h5 id="ai_chart5-1" class="card-title" style='font-weight:bold; font-size: 22px;'></h5>
                  <p id="ai_chart5-2" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p id="ai_chart5-3" class="card-text" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart5-4" style='font-size: 9px;'></small></p>
                </div>
	            <div id="ai_chart5" class="card-img-top" ></div>
                <div style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px; padding-left: 10px; padding-bottom: 5px">
                  <p class="card-text"><small class="text-body-secondary" id="ai_chart5-5" style='font-size: 8px;'></small></p>
                </div>
	          </div>
	        </div>   
		        <script>   
		        function formatDateToYYYYMMDD2(date) {
		            const year = date.getFullYear();
		            const month = String(date.getMonth() + 1).padStart(2, '0');
		            const day = String(date.getDate()).padStart(2, '0');
		            return year+"-"+month+"-"+day;
		        }
		        
		        //공휴일 정보 가져오기 함수
		        function getHolidays2(year, countryCode, callback) {
		          $.ajax({
		            type: 'GET',
		            url: "https://date.nager.at/Api/v2/PublicHolidays/"+year+"/"+countryCode,
		            success: function(response) {
		              callback(response);
		            },
		            error: function(xhr, status, error) {
		              console.error(error);
		              callback([]);
		            }
		          });
		        }
		        // 주말 여부 확인 함수 (0: 일요일, 6: 토요일)
		        function isWeekend2(day) {
		          return day === 0 || day === 6;
		        }
		        // 오늘부터 다음 평일 날짜 탐색 함수
		        function findNextValidday2(holidays, currentDate) {
		            const oneDay = 24 * 60 * 60 * 1000; // 1일의 밀리초
		            let nextDate = new Date(currentDate);

		            while (true) {
		                nextDate.setTime(nextDate.getTime() + oneDay); // 하루를 더함
		                const nextDay = nextDate.getDay();

		                if (!holidays.some(holiday => holiday.date === nextDate.toISOString()) && !isWeekend2(nextDay)) {
		                    return nextDate;
		                }
		            }
		        }
		        //오늘이 공휴일이나 주말이 아니라면 오늘 날짜 반환, 아니면 다음 날짜 반환
		        function getValidDate2(holidays, currentDate) {
		          const currentDay = currentDate.getDay();
		          
		        
		          if (!holidays.some(holiday => holiday.date === currentDate.toISOString()) && !isWeekend2(currentDay)) {
		            return currentDate;
		          } else {
		            let nextValidDate = findNextValidday2(holidays, currentDate);
		        
		            // 다음 날자도 휴일이나 주말이면 다시 그 다음 찾기
		            while (holidays.some(holiday => holiday.date === nextValidDate.toISOString()) || isWeekend(nextValidDate.getDay())) {
		            	nextValidDate = findNextValidday2(holidays, new Date(nextValidDate.getTime() + 1));
		            }
		        
		            return nextValidDate;
		          }
		        }
		        $(document).ready(function() {
		            let ai_chart = [];
		            for (var i = 0; i < 5; i++) {
		                ai_chart[(i + 1)] = LightweightCharts.createChart(document.getElementById('ai_chart' + (i + 1)), {
		                    height: 160,
		                    borderVisible: false,
		                    layout: { backgroundColor: 'transparent' },
		                    priceScale: { borderColor: 'transparent' },
		                    timeScale: { borderColor: 'transparent', timeVisible: false },
		                    grid: { vertLines: { color: 'transparent' }, horzLines: { color: 'transparent' } },
		                    crosshair: { vertLine: { width: 0, color: 'transparent' }, horzLine: { width: 0, color: 'transparent' } },
		                    handleScroll: false,
		                });
		            }
	
		            let requestData = { "ticker": "" };
	
		            // 데이터를 받아옵니다.
		            $.ajax({
		                type: 'POST',
		                url: 'http://192.168.0.74:5001/blue-oceans/ai-stock-recommend',
		                data: JSON.stringify(requestData),
		                contentType: 'application/json',
		                success: function(response) {
		                    // 받아온 데이터를 가공하여 시간과 값을 분리합니다.
		                    /* console.log(response); */
		                    
					        const year = new Date().getFullYear(); // 현재 연도
				            const countryCode = 'KR'; // 국가 코드 (한국: KR)
				            
				            // 공휴일 정보 가져오기
				            getHolidays2(year, countryCode, function (holidays) {
				                response.datas.forEach((stockData, index) => {
				                    const chart = ai_chart[(index + 1)]; // 해당 인덱스의 차트 가져오기
				
				                    const prices = [];
				                    const dates = Object.keys(stockData);
				
				                    let firstDate = null;
				                    let lastDate = null;
				                    let beforeLastDate = null;
				
				                    beforeLastValue = null;
				                    lastValue = null;
				
				                    dates.forEach((date, dateIndex) => {
				                        if (!firstDate) {
				                            firstDate = date;
				                        }
				                        beforeLastDate = lastDate;
				                        lastDate = date;
				
				                        const value = stockData[date];
				                        beforeLastValue = lastValue;
				                        lastValue = value;
				                        
				                        if (dateIndex > 0 && dateIndex === dates.length - 1) {
                                            const currentDate = new Date(lastDate);
				                            const validDate = getValidDate2(holidays, currentDate);
				                            let formattedDate = formatDateToYYYYMMDD(validDate);
				
				                            /* while (isWeekend2(currentDate.getDay()) || holidays.some(holiday => holiday.date === currentDate.toISOString())) {
				                                currentDate.setTime(currentDate.getTime() + (24 * 60 * 60 * 1000)); // 하루를 더함
				                            } */
				
				                            lastDate = formattedDate;
				                        }
				
				                        prices.push({
				                            time: lastDate,
				                            value: stockData[date],
				                        });
				                    });

					                var ai_chart1_5Element = document.getElementById("ai_chart"+(index+1)+"-5");
	                                ai_chart1_5Element.innerHTML = "Last Training Date : " + beforeLastDate;
	    
	                                var ai_chart1_1Element = document.getElementById("ai_chart"+(index+1)+"-1");
	                                ai_chart1_1Element.innerHTML = (response.names[index] + "(" + response.tickers[index] + ")");
	    
	                                var ai_chart1_2Element = document.getElementById("ai_chart"+(index+1)+"-2");
	                                ai_chart1_2Element.innerHTML = formattedDate(beforeLastDate) +" 가격: "+ String(beforeLastValue);
	                                
	                                var ai_chart1_3Element = document.getElementById("ai_chart"+(index+1)+"-3");
	                                                            
	                                // 그래프 시리즈 생성
	                                const series = chart.addLineSeries();
	    
	                                // 시리즈 데이터 설정
	                                series.setData(prices);
	                                
	                                if (beforeLastValue > lastValue) {
	                                    series.applyOptions({
	                                        color: 'blue',
	                                    }); 
	                                    ai_chart1_3Element.innerHTML = formattedDate(lastDate) + " 시작가 하락 예상";
	                                    ai_chart1_3Element.style.color = 'blue';
	                                } else if (beforeLastValue < lastValue) {
	                                    series.applyOptions({
	                                        color: 'red',
	                                    }); 
	                                    ai_chart1_3Element.innerHTML = formattedDate(lastDate) + " 시작가 상승 예상";
	                                    ai_chart1_3Element.style.color = 'red';
	                                } else{
	                                    series.applyOptions({
	                                        color: 'black',
	                                    }); 
	                                    ai_chart1_3Element.innerHTML = formattedDate(lastDate) + " 시작가 동일 예상";
	                                    ai_chart1_3Element.style.color = 'black';
	                                }
	    
	                                // 시리즈 이름 설정
	                                series.applyOptions({
	                                    title: response.names[index],
	                                });
	                                
	                                
	                                
	                                $('#ai_chart'+(index+1)+'-6').click(function() {
	                                    var name = response.names[index]; // 해당 인덱스의 이름 가져오기
	                                    var ticker = response.tickers[index]; // 해당 인덱스의 티커 가져오기
	                                    
	                                    
	                                    var newURL = '/ehr/BLUEOCEAN/detail.do?stockName='+encodeURIComponent(name)+'&stockCode='+encodeURIComponent(ticker);
	                                    //var newURL = '/ehr/BLUEOCEAN/detail.do?stockName='+name+'&stockCode='+ticker; //' + encodeURIComponent(name) + '&ticker=' + encodeURIComponent(ticker);
	                                    
	                                    // 새로운 페이지로 이동
	                                    window.location.href = newURL;
	                                });

					            });
					        });
		                },
		                error: function(xhr, status, error) {
		                    console.error(error);
		                },
		            });
		        });
		        
		        function formattedDate (in_date){
		        	var date = new Date(in_date);		        	
		        	var month = (date.getMonth() + 1).toString().padStart(2, "0");
		        	var day = date.getDate().toString().padStart(2, "0");

		        	var formattedDate = month + "/" + day;
		        	return formattedDate;
		        }
		        
		        </script> 
	            <c:choose>
	                <c:when test="${empty bookmarkList}">
	                    <!-- 관심목록이 없는 경우 메시지 표시 -->
	                    <p>관심목록이 없습니다.</p>
	                </c:when>
	                <c:otherwise>
                        <!-- 관심목록  -->
                        <h5 style='font-size: 26px; font-weight:bold; margin-bottom: 20px'>관심목록</h5>
						<!-- 로그인 된 경우에만 루프 내용을 표시 -->
						<div>
							<table class="table table-sm" style="margin-bottom: 40px; border: 1;">
							    <thead>
							        <tr class="table-primary">
							            <th class="text-center font-weight-bold">종목</th>
                                        <th class="text-center font-weight-bold">현재가</th>
                                        <th class="text-center font-weight-bold">전일가</th>
                                        <th class="text-center font-weight-bold">등락률</th>
							            <th class="text-center font-weight-bold">시작가</th>
							            <th class="text-center font-weight-bold">고가</th>
							            <th class="text-center font-weight-bold">저가</th>
							            <th class="text-center font-weight-bold">거래량</th>
							        </tr>
							    </thead>
							    <tbody id="table-body"></tbody>
							</table>
							<c:forEach var="item" items="${bookmarkList}" varStatus="loop">
							    <div class="table-container" data-ticker="${item}"></div>
							</c:forEach>
							<script>
							    $(document).ready(function() {
							        $(".table-container").each(function(index) {
							            const td = $(this).data("ticker");
							            const sd = today();
							
							            const requestData = {
							                "ticker": td,
							                "date": sd
							            };							
							            const tableContainer = $("#table-body"); // 테이블의 tbody에 행 추가
							
							            $.ajax({
							                type: 'POST',
							                url: 'http://192.168.0.74:5001/blue-oceans/search-today-tickers',
							                data: JSON.stringify(requestData),
							                contentType: 'application/json',
							                mode: 'cors',
							                success: function (result) {
							                    const jsonData = result;
							                    const data = jsonData.data[0];
							                    let yesterdayClose = jsonData.yesterdayClose;
							
							                    const row = $("<tr>");
							                    row.append($("<td>").html("&nbsp;" + jsonData.stock_name).addClass("font-weight-bold text-start"));
							
							                    const closeTd = $("<td>").addClass("font-weight-bold text-end");
							                    if (data['Close'] < yesterdayClose) {
							                        closeTd.css("color", "blue").html("▼ " + numberWithCommas(data['Close'])+"&nbsp;");
							                    } else if (data['Close'] > yesterdayClose) {
							                        closeTd.css("color", "red").html("▲ " + numberWithCommas(data['Close'])+"&nbsp;");
							                    } else {
							                        closeTd.html(numberWithCommas(data['Close'])+"&nbsp;");
							                    }                                       
							                    row.append(closeTd);
							                    
							                    const closeTd3 = $("<td>").html(numberWithCommas(yesterdayClose)+"&nbsp;").addClass("font-weight-bold text-end");
                                                if (data['Close'] < yesterdayClose) {
                                                    closeTd3.css("color", "blue");
                                                } else if (data['Close'] > yesterdayClose) {
                                                    closeTd3.css("color", "red");
                                                }
                                                row.append(closeTd3);
                                                
                                                
                                                const closeTd2 = $("<td>").html((((data['Close'] - yesterdayClose) / yesterdayClose) *100).toFixed(2)+"% &nbsp;").addClass("font-weight-bold text-end");
                                                if (data['Close'] < yesterdayClose) {
                                                    closeTd2.css("color", "blue");
                                                } else if (data['Close'] > yesterdayClose) {
                                                    closeTd2.css("color", "red");
                                                }
                                                row.append(closeTd2);

                                                row.append($("<td>").html(numberWithCommas(data['Open'])+"&nbsp;").addClass("font-weight-bold text-end"));
							                    row.append($("<td>").html(numberWithCommas(data['High'])+"&nbsp;").addClass("font-weight-bold text-end"));
							                    row.append($("<td>").html(numberWithCommas(data['Low'])+"&nbsp;").addClass("font-weight-bold text-end"));
							
							
							                    row.append($("<td>").html(numberWithCommas(data['Volume'])+"&nbsp;").addClass("font-weight-bold text-end"));
							
							                    // 클릭 이벤트 추가
							                    row.on("click", function() {
							                        const stockName = jsonData.stock_name;
							                        const ticker = jsonData.ticker;
							                        const url = "/ehr/BLUEOCEAN/detail.do?stockName="+stockName+"&stockCode="+ticker;
							                        window.location.href = url;
							                    });
							
							                    tableContainer.append(row);
							                },
							                error: function (error) {
							                    console.log('Error fetching data:', error);
							                }
							            });
							        });
							    });
							    // 천단위 쉼표를 추가하는 함수
						        function numberWithCommas(x) {
						            if (x === null) {
						                return 0;
						            } else {
						                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						            }
						        }
							</script>  
						</div>            
	                </c:otherwise>
	            </c:choose>
	        </c:otherwise>
	    </c:choose>
      <!-- 국내 시장 동향  -->
      <h5 style='font-size: 26px; font-weight:bold; margin-bottom: 20px'>국내 시장 동향</h5>
      <div class="card-group" style="margin-bottom: 40px;">
		  <div class="card" style="margin-right: 10px">
            <div id="chart1" class="card-img-top" ></div>
		    <div class="card-body" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px">
		      <h5 id="chart1-1" class="card-title text-center" style='font-weight:bold; font-size: 22px; background-color: #007AFE; color: #ffffff;'></h5>
		      <p class="card-text text-center" id="chart1-2" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text" id="chart1-3" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text"><small class="text-body-secondary" id="chart1-4" style='font-size: 9px;'></small></p>
		    </div>
		  </div>
          <div class="card" style="margin-right: 10px">
            <div id="chart2" class="card-img-top" ></div>
            <div class="card-body" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px">
              <h5 id="chart2-1" class="card-title text-center" style='font-weight:bold; font-size: 22px; background-color: #007AFE; color: #ffffff;'></h5>
              <p class="card-text" id="chart2-2" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text" id="chart2-3" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text"><small class="text-body-secondary" id="chart2-4" style='font-size: 9px;'></small></p>
            </div>
          </div>
          <div class="card" style="margin-right: 10px">
            <div id="chart3" class="card-img-top" ></div>
            <div class="card-body" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px">
              <h5 id="chart3-1" class="card-title text-center" style='font-weight:bold; font-size: 22px; background-color: #007AFE; color: #ffffff;'></h5>
              <p class="card-text" id="chart3-2" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text" id="chart3-3" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text"><small class="text-body-secondary" id="chart3-4" style='font-size: 9px;'></small></p>
            </div>
          </div>
          <div class="card" style="margin-right: 10px">
            <div id="chart4" class="card-img-top" ></div>
            <div class="card-body" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px">
              <h5 id="chart4-1" class="card-title text-center" style='font-weight:bold; font-size: 22px; background-color: #007AFE; color: #ffffff;'></h5>
              <p class="card-text" id="chart4-2" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text" id="chart4-3" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text"><small class="text-body-secondary" id="chart4-4" style='font-size: 9px;'></small></p>
            </div>
          </div>
          <div class="card">
            <div id="chart5" class="card-img-top" ></div>
            <div class="card-body" style="border: 1px; outline: 1px solid; outline-width:2px; margin: 2px">
              <h5 id="chart5-1" class="card-title text-center" style='font-weight:bold; font-size: 22px; background-color: #007AFE; color: #ffffff;'></h5>
              <p class="card-text" id="chart5-2" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text" id="chart5-3" style="font-weight:bold; margin-bottom: 0px; font-size: 16px;"></p>
              <p class="card-text"><small class="text-body-secondary" id="chart5-4" style='font-size: 9px;'></small></p>
            </div>
          </div>
		</div>   
	  <script>
		function formatDateToYYYYMMDD(date) {
			  const year = date.getFullYear();
			  const month = String(date.getMonth() + 1).padStart(2, '0');
			  const day = String(date.getDate()).padStart(2, '0');
			  return year+"-"+month+"-"+day;
			}
		
		//공휴일 정보 가져오기 함수
		function getHolidays(year, countryCode, callback) {
		  $.ajax({
		    type: 'GET',
		    url: "https://date.nager.at/Api/v2/PublicHolidays/"+year+"/"+countryCode,
		    success: function(response) {
		      callback(response);
		    },
		    error: function(xhr, status, error) {
		      console.error(error);
		      callback([]);
		    }
		  });
		}
		// 주말 여부 확인 함수 (0: 일요일, 6: 토요일)
		function isWeekend(day) {
		  return day === 0 || day === 6;
		}
		//오늘부터 이전 날짜 탐색 함수
		function findPreviousValidDate(holidays, currentDate) {
		  const oneDay = 24 * 60 * 60 * 1000; // 1일의 밀리초
		  let previousDate = new Date(currentDate);
		
		  while (true) {
		    previousDate.setTime(previousDate.getTime() - oneDay); // 하루를 뺌
		    const previousDay = previousDate.getDay();
		
		    if (!holidays.some(holiday => holiday.date === previousDate.toISOString()) && !isWeekend(previousDay)) {
		      return previousDate;
		    }
		  }
		}
		//오늘이 공휴일이나 주말이 아니라면 오늘 날짜 반환, 아니면 이전 날짜 반환
		function getValidDate(holidays) {
			//주말일때 어떻게 처리하는지 확인용
			/* const today = new Date();
		    const yesterday = new Date(today);
		    yesterday.setDate(today.getDate() - 1); */
		  const currentDate = new Date();
		  const currentDay = currentDate.getDay();
		
		  if (!holidays.some(holiday => holiday.date === currentDate.toISOString()) && !isWeekend(currentDay)) {
		    return currentDate;
		  } else {
		    let previousValidDate = findPreviousValidDate(holidays, currentDate);
		
		    // 이전 날짜도 휴일이나 주말이면 다시 이전 날짜 찾기
		    while (holidays.some(holiday => holiday.date === previousValidDate.toISOString()) || isWeekend(previousValidDate.getDay())) {
		      previousValidDate = findPreviousValidDate(holidays, new Date(previousValidDate.getTime() - 1));
		    }
		
		    return previousValidDate;
		  }
		}
		
		/* $(document).ready(function() {
		  const countryCode = 'KR';
		  const currentYear = new Date().getFullYear();
		  
		  let formattedDate = ""; // 전역 변수로 선언
		
		  getHolidays(currentYear, countryCode, function(holidays) {
			    const validDate = getValidDate(holidays);
			    formattedDate = formatDateToYYYYMMDD(validDate); */
			    /* console.log('Valid Date:', formattedDate); */
			    
			    // 차트 생성 및 데이터 요청
			    /* for(let i=0;i<5;i++){
			        createChartAndFetchData(formattedDate,i);
			    }
			  });
		  });  */
		  
		  $(document).ready(function() {
			    // 초기 실행
			    updateChartsAndData();
			  
			    // 주기적으로 실행
			    setInterval(function() {
			        updateChartsAndData();
			    }, 300000); // 300000ms = 5 minutes
			});
		  

			function updateChartsAndData() {
			    const countryCode = 'KR';
			    const currentYear = new Date().getFullYear();
			    const formattedDate = ""; // 변수 초기화

			    getHolidays(currentYear, countryCode, function(holidays) {
			        const validDate = getValidDate(holidays);
			        let formattedDate = formatDateToYYYYMMDD(validDate);

			        // 차트 생성 및 데이터 요청
			        for (let i = 0; i < 5; i++) {
			            createChartAndFetchData(formattedDate, i);
			        }
			    });
			}
		
		function createChartAndFetchData(formattedDate, no) {
			// 차트를 생성합니다.
			no = no+1;
			const chartElement = document.getElementById('chart' + no);
		    chartElement.innerHTML = ''; // 기존 차트 요소 비우기
			
		    const chart = LightweightCharts.createChart(document.getElementById('chart'+no), {
		      /* width: 800, */
		      height: 160,
		      borderVisible: false,
		      layout: {
		        backgroundColor: 'transparent',
		      },
		      priceScale: {
		        borderColor: 'transparent',
		      },
		      timeScale: {
		        borderColor: 'transparent',
		        timeVisible: false,
		      },
		      grid: {
		        vertLines: {
		          color: 'transparent',
		        },
		        horzLines: {
		          color: 'transparent',
		        },
		      },
		      crosshair: {
		        vertLine: {
		          width: 0,
		          color: 'transparent',
		        },
		        horzLine: {
		          width: 0,
		          color: 'transparent',
		        },
		      },
		      handleScroll: false,
		    });
		
		    // 시간대를 설정합니다.
		    const timeScale = chart.timeScale();
		    let requestData = {
              "symbol": "KS11",
              "date": formattedDate,
              "interval": "5"
            };
		    switch (no) {
		    case 1:
		    	requestData.symbol = "KS11";
		        break;
		    case 2:
                requestData.symbol = "KQ11";
		        break;
            case 3:
                requestData.symbol = "KS200";
                break;
            case 4:
                requestData.symbol = "USD/KRW";
                break;
            case 5:
                requestData.symbol = "JPY/KRW";
                break;
		    default:
		  }
		  // 데이터를 받아옵니다.
		  $.ajax({
		      type: 'POST',
		      url: 'http://192.168.0.74:5001/blue-oceans/search-stock-market-getinterval',
		      data: JSON.stringify(requestData),
		      contentType: 'application/json',
		      success: function(response) {
		    	//console.log(response)
		        // 받아온 데이터를 가공하여 시간과 값을 분리합니다.
		        let startData = "";
		        if(requestData.symbol == "KS11" || requestData.symbol == "KQ11" || requestData.symbol == "KS200"){
		        	startData = parseFloat(response.yesterdayData); 
		        }else{
		        	startData = response.openData;
		        }
		         
		
		        var chart1_1Element = document.getElementById("chart"+no+"-1");
		        chart1_1Element.textContent = response.symbol_name;
		        var chart1_2Element = document.getElementById("chart"+no+"-2");
		        var chart1_3Element = document.getElementById("chart"+no+"-3");
		        var chart1_4Element = document.getElementById("chart"+no+"-4");
		        
		        const data = response.data['5min'];
		        const timeSeriesData = [];
		        for (const timeKey in data) {
		            if (data.hasOwnProperty(timeKey)) {
		                const [hours, minutes] = timeKey.split(':');
		                const timestamp = new Date(requestData.date);
		                timestamp.setHours(parseInt(hours));
		                timestamp.setMinutes(parseInt(minutes));
		                
		                // 5분 단위로 데이터 가져오기 위해 시간 조정
		                if (parseInt(minutes) % 5 === 0) {
		                    timeSeriesData.push({ time: timestamp.getTime(), value: data[timeKey] });
		                }
		            }
		        }
		
		        let date = response.date;
		        // 데이터의 마지막 시간과 값을 찾기
		        let lastTime = null;
		        let lastValue = null;
		        for (const timeKey in data) {
		       	  if (data.hasOwnProperty(timeKey)) {
		       		lastTime = timeKey;
		       		lastValue = data[timeKey];
		       	  }
		       	}		        		        
		        
		        if(requestData.symbol == "KS11" || requestData.symbol == "KQ11" || requestData.symbol == "KS200"){
	                chart1_3Element.textContent = "전일가: "+startData.toFixed(2);
	                chart1_2Element.textContent = "현재가: "+lastValue.toFixed(2) + "("+(lastValue.toFixed(2)-startData.toFixed(2)).toFixed(2)+")";
		        }else{
                    chart1_3Element.textContent = "시작가: "+startData.toFixed(2);
                    chart1_2Element.textContent = "현재가: "+lastValue.toFixed(2) + "("+(lastValue.toFixed(2)-startData.toFixed(2)).toFixed(2)+")";
                }
		        chart1_4Element.textContent = "( last update: "+date +" "+lastTime+" )";
		
		        
		        // 받아온 데이터 중에서 15:50 이후의 데이터를 제거합니다.
		        const cutoffTime = new Date(requestData.date);
		        cutoffTime.setHours(15);
		        cutoffTime.setMinutes(50);
		    
		        const filteredTimeSeriesData = timeSeriesData.filter(entry => entry.time <= cutoffTime);
		
		        // 데이터를 차트에 추가합니다.
		        const lineSeries = chart.addLineSeries();
		        lineSeries.setData(filteredTimeSeriesData);
		        
		        // 그래프의 외곽선을 없애기 위해 선의 두께를 0으로 설정합니다.
		        lineSeries.applyOptions({
		            lineWidth: 0,
		        });
		        
		        // 시간 단위를 분으로 설정합니다.
		        timeScale.setVisibleRange({ from: timeSeriesData[0].time, to: timeSeriesData[timeSeriesData.length - 1].time });
		
		        // x축 눈금에 아무런 텍스트도 표시하지 않도록 설정합니다.
		        timeScale.applyOptions({
		              visible: false,
		        });
		        
		        // 데이터를 순회하면서 색상을 결정하여 설정합니다.
		        for (let i = 0; i < filteredTimeSeriesData.length; i++) {
		          const dataPoint = filteredTimeSeriesData[i];
		          const nextDataPoint = filteredTimeSeriesData[i + 1];
		
		          if (nextDataPoint && startData > nextDataPoint.value) {
		              lineSeries.applyOptions({
		                  color: 'blue',
		              }); 
		          } else if (nextDataPoint && startData < nextDataPoint.value) {
		              lineSeries.applyOptions({
		                  color: 'red',
		              }); 
		          }
		        }
		
		        // subscribeCrosshairMove 이벤트를 사용하여 마우스 휠 스크롤을 무시합니다.
		        chart.subscribeCrosshairMove((param) => {
		          // 아무 작업도 하지 않음 (마우스 휠 동작을 무시)
		          // 빈 함수이므로 아무런 동작도 발생하지 않습니다.
		        });
		
		        // 차트를 렌더링합니다.
		        chart.timeScale().fitContent();        
		      },
		      error: function(xhr, status, error) {
		        console.error(error);
		      },
		    });
		}		
      </script>
      <!-- 거래량 상위 10개 종목  -->
      <div id="tableContainer" style="margin-top: 20px; margin-bottom: 40px;"> </div>        
      <!--네이버 뉴스 api 정보를 불러오는 영역-->
      <div id="news-container" style="margin-bottom: 40px;"></div>
      <script>
      // 네이버 뉴스 api 호출
      $.ajax({
          type: 'GET',
          url: '/ehr/BLUEOCEAN/doNaverSearch.do',
          asyn: 'true',
          dataType: 'html',
          data: {
              keyword: '주식',
          },
          success: function (data) {
              let parsedJson = JSON.parse(data);
              let parsedItems = parsedJson.items;
              // keyword로 불러온 데이터에서 3개 항목에 대해서만 html에 출력
              let newsHtml = '';
              newsHtml += "<h5 style='font-size: 26px; font-weight:bold; margin-bottom: 20px;'>" /*  $('#keyword').val() */ + '오늘의 뉴스</h5>';
              newsHtml +=
                  "<div class='naver-news'><div class='news-image-container'></div><div class='news-text-container'><a href='" +
                  parsedItems[0].link +
                  "' target='_blank'>" +
                  parsedItems[0].title +
                  '</a><p>' +
                  parsedItems[0].description +
                  '</p></div></div>';
              newsHtml +=
                  "<div class='naver-news'><div class='news-image-container'></div><div class='news-text-container'><a href='" +
                  parsedItems[1].link +
                  "' target='_blank'>" +
                  parsedItems[1].title +
                  '</a><p>' +
                  parsedItems[1].description +
                  '</p></div></div>';
              newsHtml +=
                  "<div class='naver-news'><div class='news-image-container'></div><div class='news-text-container'><a href='" +
                  parsedItems[2].link +
                  "' target='_blank'>" +
                  parsedItems[2].title +
                  '</a><p>' +
                  parsedItems[2].description +
                  '</p></div></div>';
              newsHtml +=
                  "<div class='naver-news'><div class='news-image-container'></div><div class='news-text-container'><a href='" +
                  parsedItems[3].link +
                  "' target='_blank'>" +
                  parsedItems[3].title +
                  '</a><p>' +
                  parsedItems[3].description +
                  '</p></div></div>';
              newsHtml +=
                  "<div class='naver-news'><div class='news-image-container'></div><div class='news-text-container'><a href='" +
                  parsedItems[4].link +
                  "' target='_blank'>" +
                  parsedItems[4].title +
                  '</a><p>' +
                  parsedItems[4].description +
                  '</p></div></div>';
              $('#news-container').append(newsHtml);
             
          },
          error: function (data) {
              //실패시 처리
              console.log('error:' + data);
          },
      });
      </script>
    </div>
  </div>
</body>
<script src="${CP}/resources/js/header-main.js"></script>
<script src="${CP}/resources/js/util.js"></script>
</html>