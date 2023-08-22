<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="CP" value="${pageContext.request.contextPath}" />
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css">
<link rel="stylesheet" href="${CP}/resources/css/footer.css">
<title>Insert title here</title>
</head>
<body>
	<p>검색페이지</p>

	<div id="admin-container" style="background-color: white; width: 80%; height: 77vh;">
    <form>
        <div id="body-container">
            <table style="margin-left: 50px; table-layout: fixed; width: 100%" id="data-table">
                <thead>
                    <tr>
                        <th scope="col">종목명</th>
                        <th scope="col">현재가</th>
                        <th scope="col">전일비</th>
                        <th scope="col">등락률</th>
                        <th scope="col">거래량</th>
                    </tr>
                </thead>
                <tbody class="data-tbody">
                    <!-- 여기에 데이터를 동적으로 추가할 것입니다. -->
                </tbody>
            </table>
        </div>
        <div id="pagination" style="display: flex; justify-content: center;">
            <!-- 페이지 번호를 동적으로 생성할 영역 -->
        </div>
    </form>
</div>

	<script>
		    // 서버에서 받아온 데이터
let searchData = ${searchData}; // searchData 변수에 데이터 할당

// "code" 부분을 배열로 저장할 변수 선언
let codeArray = [];

// searchData를 순회하면서 "code" 값을 배열에 추가
for (var i = 0; i < searchData.length; i++) {
    codeArray.push(searchData[i].code);
}

// 배열에 저장된 "code" 값을 확인하기 위해 콘솔에 출력
console.log(codeArray);

$(document).ready(function() {        
    // fetchTickerData 함수 호출 시작
    fetchTickerData(0);
});

function fetchTickerData(index) {
    if (index < codeArray.length) {

        let currentDate = new Date();
        currentDate.setDate(currentDate.getDate() - 1);
        let formattedDate = currentDate.toISOString().split('T')[0];

        let requestData1 = {
            ticker: codeArray[index], // 현재 순서의 "code"
            startDate: formattedDate,
            endDate: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>'
        };

        $.ajax({
            type: "POST",
            url: 'http://125.142.47.191:5001/blue-oceans/search-tickers',
            data: JSON.stringify(requestData1),
            contentType: 'application/json',
            success: function(data1) {
            	console.log(`Fetched data for ticker ${requestData1.ticker}:`, data1);
                // 다음 데이터 요청
                let requestData2 = {
                    ticker: codeArray[index], // 현재 순서의 "code"
                    date: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>',
                    interval: 10,
                };

                $.ajax({
                    type: "POST",
                    url: 'http://125.142.47.191:5001/blue-oceans/search-tickers',
                    data: JSON.stringify(requestData2),
                    contentType: 'application/json',
                    success: function(data2) {
                        console.log(`Fetched data for ticker ${requestData2.ticker}:`, data2);

                        // 데이터를 테이블에 추가하는 코드
                        const tbody = document.querySelector('.data-tbody');
                        for (let i = 0; i < data1.data.length; i++) {
                            const newRow = document.createElement('tr');
                            const stockName = data1.stock_name;
                            const open = parseInt(data1.data[i].Open);
                            const close = parseInt(data1.data[i].Close);
                            const change = data1.data[i].Change;
                            const volume = data1.data[i].Volume;
                            
                            console.log(stockName);
                            console.log(close - open);
                            console.log(change);
                            console.log(volume);

                            newRow.innerHTML = `
                                <td>${stockName}</td>
                                <td>${close}</td>
                                <td>${close - open}</td>
                                <td>${((close - open) / open) * 100}%</td>
                                <td>Volume: ${volume}</td>
                            `;
                            tbody.appendChild(newRow);
                        }

                        // 다음 요소에 대한 데이터 가져오기
                        fetchTickerData(index + 1);
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log("error:" + errorThrown);
                        // 다음 요소에 대한 데이터 가져오기
                    }
                });

            },
            error: function(xhr, textStatus, errorThrown) {
                console.log("error:" + errorThrown);
                // 다음 요소에 대한 데이터 가져오기
            }
        });
    }
}



	</script>

</body>
</html>