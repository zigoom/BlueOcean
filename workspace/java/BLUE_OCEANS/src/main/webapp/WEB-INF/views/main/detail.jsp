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
	width: 90%;
	height: 400px;
}

#stock-name {
	font-weight: bold;
}

#price-box {
	display: flex;
	margin-left: 20px;
}

#price-change-box {
	display: flex;
	align-items: center;
	border-radius: 5px;
	margin-left: 15px;
	padding: 0px 15px;
}

#chart-container-main {
	display: flex;
	justify-content: center;
}

#chart-button-container {
	display: flex;
	justify-content: center;
}

#chart-button-container button {
	width: 23%;
	margin: 10px;
	border: 1px solid black;
}

#table-container {
	display: flex;
	justify-content: center;
}

#table-container table tr th {
	border-bottom: 1px solid black;
	background-color: #FAFAFA;
}

#table-container table tr td {
	text-align: right;
}

#table-container table {
	width: 35%;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div style="display: flex;">
		<h1 id="stock-name"></h1>
		<div id="price-box">
			<h1 class="last-close-value"></h1>
			<div id="price-change-box">
				<h2 class="price-changes"></h2>
				<h2 class="price-changes-percent"></h2>
			</div>
		</div>
	</div>
	<div id="chart-and-button-container">
		<div id="chart-container-main">
			<div id="chart-container"></div>
		</div>
		<div id="chart-button-container">
			<button class="btn btn-light" id="dayButton">1일</button>
			<button class="btn btn-light" id="weekButton">1주</button>
			<button class="btn btn-light" id="monthButton">1달</button>
			<button class="btn btn-light" id="yearButton">1년</button>
		</div>
	</div>
	<div id="table-container">
		<table style="border-bottom: 1px solid black; border-top: 1px solid black;">
			<tr>
				<th>현재가</th>
				<td class="last-close-value"></td>
			</tr>
			<tr>
				<th>전일대비</th>
				<td class="price-changes"></td>
			</tr>
			<tr>
				<th>등락률</th>
				<td class="price-changes-percent"></td>
			</tr>
			<tr>
				<th style="border-bottom: 2px solid black;">거래량</th>
				<td class="volume"></td>
			</tr>
		</table>
		<table style="border-bottom: 1px solid black; border-top: 1px solid black;">
			<tr>
				<th>전일가</th>
				<td class="prev-close"></td>
			</tr>
			<tr>
				<th>시가</th>
				<td class="open"></td>
			</tr>
			<tr>
				<th>고가</th>
				<td class="high"></td>
			</tr>
			<tr>
				<th style="border-bottom: 2px solid black;">저가</th>
				<td class="low"></td>
			</tr>
		</table>
	</div>

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

    return year + "-" + month + "-" + day;
  }

  function dayButtonClick() {
    const timeScale = chart.timeScale();
    timeScale.applyOptions({
      barSpacing: 100,
    });
  }

  function weekButtonClick() {
    const timeScale = chart.timeScale();
    timeScale.applyOptions({
      barSpacing: 18,
    });
  }

  function monthButtonClick() {
    const timeScale = chart.timeScale();
    timeScale.applyOptions({
      barSpacing: 5,
    });
  }

  function yearButtonClick() {
    const timeScale = chart.timeScale();
    timeScale.applyOptions({
      barSpacing: 1,
    });
  }

  function test() {
    let ticker_data = $("#Ticker").val();
    let startDate_data = $("#StartDate").val();
    let endDate_data = $("#EndDate").val();

    let requestData = {
      ticker: ticker_data, // "005930",
      startDate: startDate_data, // "2023-01-02",
      endDate: endDate_data, // "2023-01-31"
    };

    $.ajax({
      type: "POST",
      url: "http://192.168.0.74:5001/blue_oceans/search_ticker",
      data: JSON.stringify(requestData),
      contentType: "application/json",
      mode: "cors",
      success: function (result) {
        $("#stock-name").text(result.stock_name + "(" + result.ticker + ")");
        let parsedData = JSON.parse(result.data);
        let lastCloseValue;
        let lastCloseValuePreviousDay;

        parsedData.forEach(function (data, index) {
          console.log(
            data.Volume,
            chartData.push({
              time: formatDate(data.Date),
              value: data.Close,
            })
          );
          lastCloseValue = data.Close; // 마지막 Close 값 저장

          if (index === parsedData.length - 2) {
            lastCloseValuePreviousDay = data.Close; // 마지막 전날 Close 값 저장
          }

          $(".volume").text(data.Volume.toLocaleString());
          $(".open").text(data.Open.toLocaleString());
          $(".high").text(data.High.toLocaleString());
          $(".low").text(data.Low.toLocaleString());
        });

        lineSeries.setData(chartData);

        // lastCloseValue와 lastCloseValuePreviousDay 변수를 이용하여 원하는 작업 수행
        console.log("마지막 Close 값:", lastCloseValue);
        $(".last-close-value").text(lastCloseValue.toLocaleString());
        $(".prev-close").text(lastCloseValuePreviousDay.toLocaleString());

        if (lastCloseValuePreviousDay) {
          console.log("전날 마지막 Close 값:", lastCloseValuePreviousDay);
          if (lastCloseValue - lastCloseValuePreviousDay >= 0) {
            $(".price-changes").text("▲" + (lastCloseValue - lastCloseValuePreviousDay).toLocaleString());
            $(".price-changes-percent").text("▲" + ((lastCloseValue - lastCloseValuePreviousDay) / lastCloseValuePreviousDay * 100).toFixed(2));
            $(".price-changes").css("color", "red");
            $(".price-changes-percent").css("color", "red");
            $(".last-close-value").css("color", "red");
            $("#price-change-box").css("background-color", "#FCEDEB");
          } else {
            $(".price-changes").text("▼" + (lastCloseValue - lastCloseValuePreviousDay).toLocaleString());
            $(".price-changes-percent").text("▼" + ((lastCloseValue - lastCloseValuePreviousDay) / lastCloseValuePreviousDay * 100).toFixed(2));
            $(".price-changes").css("color", "blue");
            $(".price-changes-percent").css("color", "blue");
            $(".last-close-value").css("color", "blue");
            $("#price-change-box").css("background-color", "#ECF3FD");
          }
        }
        // 다른 함수 호출 등 원하는 처리를 할 수 있습니다.
      },
      error: function (xtr, status, error) {
        alert(xtr + ":" + status + ":" + error);
      },
    });
  }

  // Remain the rest of the code unchanged
</script>

</body>
<script src="${CP}/resources/js/header.js"></script>
</html>
