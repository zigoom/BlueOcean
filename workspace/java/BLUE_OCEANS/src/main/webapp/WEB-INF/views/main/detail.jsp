<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/lightweight-charts/dist/lightweight-charts.standalone.production.js"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css">
<link rel="stylesheet" href="${CP}/resources/css/footer.css">
<style>
#chart-container {
	width: 600px;
	height: 400px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<h2 id="stock-name"></h2>
	<div>
		<h1 id="last-close-value"></h1>
		<h2 id="price-changes"></h2>
		<h2 id="price-changes-percent"></h2>
	</div>
	<div id="chart-container"></div>

	<button id="dayButton">1일</button>
	<button id="weekButton">1주</button>
	<button id="monthButton">1달</button>
	<button id="yearButton">1년</button>

	<p>하는 주식의 Ticker와 시작/종료 날짜를 입력해 주세요.</p>
	<label> 주식값 : <input type="text" name="Ticker" id="Ticker" value="000020" />
	</label>
	<label> 시작날짜 : <input type="text" name="StartDate" id="StartDate" value="2000-01-01" />
	</label>
	<label> 종료날짜 : <input type="text" name="EndDate" id="EndDate" value="2023-07-27" />
	</label>
	<label> <input type="button" value="데이터 요청" onclick="test()" />
	</label>


	<script>
      function formatDate(date) {
        const dateString = date.toString();
        const year = dateString.slice(0, 4);
        const month = dateString.slice(4, 6);
        const day = dateString.slice(6, 8);

        return year+"-"+month+"-"+day;
      }
      // 차트 생성
      const chart = LightweightCharts.createChart(
        document.getElementById("chart-container"),
        {
          layout: {
            textColor: "black",
            backgroundColor: "white",
          },
        }
      );

      // 시리즈 생성
      const lineSeries = chart.addLineSeries();

      // 데이터 설정
      const chartData = [];

      // 시간 척도 설정
      const timeScale = chart.timeScale();

      // 버튼 클릭 시 시간 척도 변경
      const dayButton = document.getElementById("dayButton");
      const weekButton = document.getElementById("weekButton");
      const monthButton = document.getElementById("monthButton");
      const yearButton = document.getElementById("yearButton");

      dayButton.addEventListener("click", function () {
    	    timeScale.applyOptions({
    	    	barSpacing : 100
    	    })
    	  });
      weekButton.addEventListener("click", function () {
  	    timeScale.applyOptions({
  	    	barSpacing : 18
  	    })
  	  });
      monthButton.addEventListener("click", function () {
  	    timeScale.applyOptions({
  	    	barSpacing : 5
  	    })
  	  });

      yearButton.addEventListener("click", function(){
    	  timeScale.applyOptions({
    		  barSpacing : 1
    	  })
      })

    	 
      
      function test() {
        let ticker_data = $("#Ticker").val();
        let startDate_data = $("#StartDate").val();
        let endDate_data = $("#EndDate").val();

        let requestData = {
          ticker: ticker_data, // "005930",
          startDate: startDate_data, // "2023-01-02",
          endtDate: endDate_data, // "2023-01-31"
        };

        $.ajax({
        	  type: "POST",
        	  url: "http://192.168.0.74:5001/blue_oceans/search_ticker",
        	  data: JSON.stringify(requestData),
        	  contentType: "application/json",
        	  mode: "cors",
        	  success: function (result) {
        	    $("#stock-name").text(result.stock_name + "(" + result.ticker + ")")
        	    let parsedData = JSON.parse(result.data);
        	    let lastCloseValue; 
        	    let lastCloseValuePreviousDay;

        	    parsedData.forEach((data, index) => {
        	      console.log(
        	        data.Date,
        	        data.Close,
        	        chartData.push({
        	          time: formatDate(data.Date),
        	          value: data.Close,
        	        })
        	      );
        	      lastCloseValue = data.Close; // 마지막 Close 값 저장

        	      if (index === parsedData.length - 2) {
        	        lastCloseValuePreviousDay = data.Close; // 마지막 전날 Close 값 저장
        	      }
        	    });

        	    lineSeries.setData(chartData);

        	    // lastCloseValue와 lastCloseValuePreviousDay 변수를 이용하여 원하는 작업 수행
        	    console.log("마지막 Close 값:", lastCloseValue);	
        	    $("#last-close-value").text(lastCloseValue);
        	

        	    if (lastCloseValuePreviousDay) {
        	      console.log("전날 마지막 Close 값:", lastCloseValuePreviousDay);
        	      if(lastCloseValue-lastCloseValuePreviousDay >= 0){
        	    	  $("#price-changes").text("▲"+String(lastCloseValue-lastCloseValuePreviousDay));
            	      $("#price-changes-percent").text("▲"+((lastCloseValue - lastCloseValuePreviousDay) / lastCloseValuePreviousDay * 100).toFixed(2));
            	      $("#price-changes").css("color","red")
            	      $("#price-changes-percent").css("color","red")
            	      $("#last-close-value").css("color","red")
        	      }else {
        	    	  $("#price-changes").text("▼"+String(lastCloseValue-lastCloseValuePreviousDay));
            	      $("#price-changes-percent").text("▼"+((lastCloseValue - lastCloseValuePreviousDay) / lastCloseValuePreviousDay * 100).toFixed(2));
            	      $("#price-changes").css("color","blue")
            	      $("#price-changes-percent").css("color","blue")
            	      $("#last-close-value").css("color","blue")
        	      }
        	      
        	      
        	    }
        	    // 다른 함수 호출 등 원하는 처리를 할 수 있습니다.
        	  },
        	  error: function (xtr, status, error) {
        	    alert(xtr + ":" + status + ":" + error);
        	  },
        	});

      }
    </script>
</body>
<script src="${CP}/resources/js/header.js"></script>
</html>
