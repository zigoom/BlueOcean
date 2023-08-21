<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="${encoding}">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
                        var table = '<table border="1" class="table table-sm">' +
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
						    var changesRatio = dataItem.ChagesRatio + '%';
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
						        '<td class="close text-end ' + closeClass + ' font-weight-bold">' + closeIcon + ' ' + dataItem.Close + '&nbsp</td>' +
						        '<td class="high text-end font-weight-bold">' + dataItem.High + '&nbsp</td>' +
						        '<td class="low text-end font-weight-bold">' + dataItem.Low + '&nbsp</td>' +
						        '<td class="changes text-end ' + changesClass + ' font-weight-bold">' + dataItem.Changes + '&nbsp</td>' +
						        '<td class="chagesRatio text-end ' + changesClass + ' font-weight-bold">' + changesRatio + '&nbsp</td>' +
						        '<td class="volume text-end font-weight-bold">' + dataItem.Volume + '&nbsp</td>' +
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
        
    </script>
</head>
<body>	
  <div class="container">
    <div class="row" >    
    
      <!-- 증권시장  -->
      <div id="cards" style="margin-top: 20px; margin-bottom: 20px; display: flex;">
        <div class="card" style="width: 18rem; flex: 1; margin-right: 20px;">        
            <div id="chart1" class="card-img-top"></div>
            <div class="card-body">
                <p class="card-text">Some quickfghf example text for card 1.</p>
            </div>
        </div>
        <div class="card" style="width: 18rem; flex: 1; margin-right: 20px;">        
            <div id="chart2" class="card-img-top"></div>
            <div class="card-body">
                <p class="card-text">Some quiffffck example text for card 2.</p>
            </div>
        </div>
        <div class="card" style="width: 18rem; flex: 1; margin-right: 20px;">        
            <div id="chart2" class="card-img-top"></div>
            <div class="card-body">
                <p class="card-text">Some quiffffck example text for card 2.</p>
            </div>
        </div>
        <div class="card" style="width: 18rem; flex: 1;">        
            <div id="chart3" class="card-img-top"></div>
            <div class="card-body">
                <p class="card-text">Some quick example text for card 3.</p>
            </div>
        </div>
      </div>
	
<script>
$(document).ready(function() {
    // 차트를 생성합니다.
    const chart = LightweightCharts.createChart(document.getElementById('chart1'), {
      /* width: 800, */
      height: 100,
      handleScroll: false, // 스크롤로 확대 비활성화
      layout: {
          backgroundColor: 'transparent', // 캔버스의 배경색을 투명으로 설정
      },
      priceScale: {
          borderColor: 'transparent', // 가격 축의 테두리 색상을 투명으로 설정
      },
      timeScale: {
          borderColor: 'transparent', // 시간 축의 테두리 색상을 투명으로 설정
      },
      grid: {
          vertLines: {
              color: 'transparent', // 수직 라인의 색상을 투명으로 설정
          },
          horzLines: {
              color: 'transparent', // 수평 라인의 색상을 투명으로 설정
          },
      },
      crosshair: {
          vertLine: {
              width: 0, // 교차선의 수직 선 두께를 0으로 설정하여 제거
              color: 'transparent', // 교차선의 수직 선 색상을 투명으로 설정
          },
          horzLine: {
              width: 0, // 교차선의 수직 선 두께를 0으로 설정하여 제거
              color: 'transparent', // 교차선의 수평 선 색상을 투명으로 설정
          },
      },
    });

    // 시간대를 설정합니다.
    const timeScale = chart.timeScale();

    const requestData = {
      "symbol": "KS11",
      "date": "2023-08-17",
      "interval": "10"
    };

    // 데이터를 받아옵니다.
    $.ajax({
      type: 'POST',
      url: 'http://192.168.0.74:5001/blue-oceans/search-stock-market-getinterval',
      data: JSON.stringify(requestData),
      contentType: 'application/json',
      success: function(response) {
        // 받아온 데이터를 가공하여 시간과 값을 분리합니다.
        const data = response.data['10min'];
        const timeSeriesData = [];
        for (const timeKey in data) {
          if (data.hasOwnProperty(timeKey)) {
            const [hours, minutes] = timeKey.split(':');
            const timestamp = new Date(requestData.date);
            timestamp.setHours(parseInt(hours));
            timestamp.setMinutes(parseInt(minutes));
            timeSeriesData.push({ time: timestamp.getTime(), value: data[timeKey] });
          }
        }


	     // 받아온 데이터 중에서 15:30 이후의 데이터를 제거합니다.
	     const cutoffTime = new Date(requestData.date);
	     cutoffTime.setHours(15);
	     cutoffTime.setMinutes(30);
	
	     const filteredTimeSeriesData = timeSeriesData.filter(entry => entry.time <= cutoffTime);


        // 데이터를 차트에 추가합니다.
        const lineSeries = chart.addLineSeries();
        lineSeries.setData(filteredTimeSeriesData);
        
        // 그래프의 외곽선을 없애기 위해 선의 두께를 0으로 설정합니다.
        lineSeries.applyOptions({
            lineWidth: 0,
        });

        // 선 그래프의 색상을 빨간색으로 변경합니다.
        /* lineSeries.applyOptions({
            color: 'red',
        }); */

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

          if (nextDataPoint && dataPoint.value > nextDataPoint.value) {
        	  lineSeries.applyOptions({
                  color: 'blue',
              }); 
          } else if (nextDataPoint && dataPoint.value < nextDataPoint.value) {
        	  lineSeries.applyOptions({
	                 color: 'red',
	          }); 
          }
        }

        // 차트를 렌더링합니다.
        chart.timeScale().fitContent();
      },
      error: function(xhr, status, error) {
        console.error(error);
      },
    });
  }); 


</script>

     
      <!-- 거래량 상위 10개 종목  -->
      <div id="tableContainer" style="margin-top: 20px; margin-bottom: 20px;"> </div>        
      <!--네이버 뉴스 api 정보를 불러오는 영역-->
      <div id="news-container"></div>
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
              newsHtml += "<h5 style='font-weight:bold;'>" /*  $('#keyword').val() */ + '오늘의 주식 뉴스</h5>';
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