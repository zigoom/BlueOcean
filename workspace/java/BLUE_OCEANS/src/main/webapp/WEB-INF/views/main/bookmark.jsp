<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
        />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://code.jquery.com/jquery-3.7.0.js"
            integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
            crossorigin="anonymous"
        ></script>
        <script src="https://unpkg.com/lightweight-charts/dist/lightweight-charts.standalone.production.js"></script>
        <script src="https://kit.fontawesome.com/649b25c1cf.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${CP}/resources/css/header.css" />
        <link rel="stylesheet" href="${CP}/resources/css/footer.css" />
        <style>
            #chart-container {
                width: 200px;
                height: 200px;
                margin: 15px;
            }

            .bookmark-container {
                border: 1px solid black;
                display: flex;
                justify-content: flex-start;
                align-content: center;
            }

            .text-container {
                margin: 15px;
            }

            .text-container p, .text-container a {
                font-size: 15px;
                font-weight: bold;
            }
            .last-close-value{
            	margin-top: 15px;
            }
            .text-container a {
            	text-decoration: none;
            	cursor: pointer;
            	color: black;
            	font-size: 21px;
            }
            .fa-solid{
            	color:gold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:forEach var="item" begin="1" end="5">
	            <form method="get" action="/ehr/BLUEOCEAN/detail.do" class="detail-form">
		        <!-- 주식종목코드 값 담아두는 인풋 -->
                <div class="bookmark-container">
                    <div id="chart-container${item}"></div>
                    <div class="text-container">
                        <a class="stock-name"></a>
                        <input type="hidden" class="stock-code-input" name="stockCode">
                        <input type="hidden" class="stock-name-input" name="stockName">
                        <p class="last-close-value"></p>
                        <p class="high"></p>
                        <p class="volume"></p>
                        <p class="low"></p>
                    </div>
                    <div>
                        <i
                            style="margin-left: 50px; margin-top: 25px"
                            class="fa-regular fa-star fa-2xl bookmark-button"
                        ></i>
                    </div>
                </div>
                </form>

                <p>하는 주식의 Ticker와 시작/종료 날짜를 입력해 주세요.</p>
                <input type="text" class="ui" value="${sessionScope.user}" />
		        <!-- 유저아이디 값 담아두는 인풋 -->
		        <input type="text" class="sn" />
		        <!-- 주식종목이름 값 담아두는 인풋 -->
		        <input type="text" class="sc" />

                <label> 주식값 : <input type="text" name="Ticker" id="Ticker" value="000020" class="Ticker" /> </label>
                <label>
                    시작날짜 :
                    <input type="text" name="StartDate" id="StartDate" class="StartDate" value="1900-01-01" />
                </label>
                <label>
                    종료날짜 : <input type="text" name="EndDate" id="EndDate" class="EndDate"/>
                </label>
                <label> <input class="submit-button" type="button" value="데이터 요청" /> </label>
            </c:forEach>
        </div>
    </body>
    <script>
        // 20200101 등의 값을 2020-01-01 로 변경해주는 함수
        function formatDate(date) {
            const dateString = date.toString();
            const year = dateString.slice(0, 4);
            const month = dateString.slice(4, 6);
            const day = dateString.slice(6, 8);

            return year + '-' + month + '-' + day;
        }

        for (let i = 1; i <= 5; i++) {
            let submitButton = document.querySelectorAll('.submit-button'); // 데이터 제출 버튼
            let ticker_data = document.querySelectorAll('.Ticker'); // 주식종목 코드
            let startDate_data = document.querySelectorAll('.StartDate'); // 시작일
            let endDate_data = document.querySelectorAll('.EndDate'); // 종료일
            
         // 북마크에 이미 등록되어있는지 체크하는 함수
            function checkBookmark() {
                $.ajax({
                    type: 'GET',
                    url: '/ehr/BLUEOCEAN/checkBookmark.do',
                    async: true,
                    dataType: 'html',
                    data: {
                        userId: $('.ui').eq(i-1).val(),
                        stockName: $('.sn').eq(i-1).val(),
                        stockCode: $('.sc').eq(i-1).val(),
                    },
                    success: function (data) {
                        if (data == 1) {
                            bookmarkButton[i-1].classList.remove('fa-regular'); // 체크했을경우 이미 등록되어있을때 색깔있는 별 모양
                            bookmarkButton[i-1].classList.add('fa-solid');
                        } else {
                            bookmarkButton[i-1].classList.remove('fa-solid'); // 체크했을경우 등록되어있지 않을때 색깔없는 별 모양
                            bookmarkButton[i-1].classList.add('fa-regular');
                        }
                    },
                    error: function (data) {
                        console.log('Error check bookmark:', data);
                    },
                });
            }

            // 북마크 버튼 요소 선택
            let bookmarkButton = document.querySelectorAll('.bookmark-button');

            // 북마크 버튼 클릭 이벤트 핸들러 함수
            function handleBookmarkClick() {
                let userId = $('.ui').eq(i-1).val();
                let stockName = $('.sn').eq(i-1).val();
                let stockCode = $('.sc').eq(i-1).val();
                $.ajax({
                    type: 'GET',
                    url: '/ehr/BLUEOCEAN/checkBookmark.do',
                    async: true,
                    dataType: 'html',
                    data: {
                        userId: userId,
                        stockName: stockName,
                        stockCode: stockCode,
                    },
                    success: function (data) {
                        if (data == 1) {
                            bookmarkButton[i-1].classList.add('fa-regular');
                            bookmarkButton[i-1].classList.remove('fa-solid');
                            deleteBookmark(userId, stockName, stockCode);
                        } else {
                            bookmarkButton[i-1].classList.add('fa-solid');
                            bookmarkButton[i-1].classList.remove('fa-regular');
                            addBookmark(userId, stockName, stockCode);
                        }
                    },
                    error: function (data) {
                        console.log('Error check bookmark:', data);
                    },
                });
            }

            // 북마크 추가 함수
            function addBookmark(userId, stockName, stockCode) {
                $.ajax({
                    type: 'GET',
                    url: '/ehr/BLUEOCEAN/addBookmark.do',
                    async: true,
                    dataType: 'html',
                    data: {
                        userId: userId,
                        stockName: stockName,
                        stockCode: stockCode,
                    },
                    success: function (data) {
                    	if (data == 1){
                    		alert("관심목록에 추가되었습니다.")
                    	}
                    	else if (data == 2) {
                            alert("최대 등록 가능갯수를 초과했습니다.")
                            bookmarkButton[i-1].classList.add('fa-regular');
                            bookmarkButton[i-1].classList.remove('fa-solid');
                        }
                    	else if (data == 3) {
                            console.log("이미 관심종목에 등록되어 있습니다.")
                        }
                    },
                    error: function (data) {
                        console.log('Error adding bookmark:', data);
                    },
                });
            }

            // 북마크 삭제 함수
            function deleteBookmark(userId, stockName, stockCode) {
                $.ajax({
                    type: 'GET',
                    url: '/ehr/BLUEOCEAN/deleteBookmark.do',
                    async: true,
                    dataType: 'html',
                    data: {
                        userId: userId,
                        stockName: stockName,
                        stockCode: stockCode,
                    },
                    success: function (data) {
                        alert("관심목록에서 삭제되었습니다.")
                    },
                    error: function (data) {
                        console.log('Error deleting bookmark:', data);
                    },
                });
            }

            // 북마크 버튼 클릭 이벤트 리스너 등록
            bookmarkButton[i-1].addEventListener('click', function () {
                if ($('.ui').val() == null || $('.ui').val() == '') {
                    alert('로그인 후 이용해주세요.');
                } else {
                    handleBookmarkClick();
                }
            });
            

            // 차트 생성
            const chartContainer = document.getElementById('chart-container' + i);
            console.log(chartContainer);
            const chart = LightweightCharts.createChart(chartContainer, {
            	width: 400, height: 300
            });
            // 데이터 설정
            const chartData = [];

            function test(td, sd, ed) {
                // 시리즈 생성
                const lineSeries = chart.addLineSeries();

                // 시간 척도 설정
                const timeScale = chart.timeScale();
                let requestData = {
                    ticker: td,
                    startDate: sd,
                    endDate: ed,
                };

                // ajax를 활용해 http://192.168.0.74:5001/blue-oceans/search-tickers을 호출하여 불러온 데이터를 파싱
                $.ajax({
                    type: 'POST',
                    url: 'http://192.168.0.74:5001/blue-oceans/search-tickers',
                    data: JSON.stringify(requestData),
                    contentType: 'application/json',
                    mode: 'cors',
                    success: function (result) {
                        $('.stock-name').eq(i-1).text(result.stock_name + '(' + result.ticker + ')');
                        $(".Ticker").eq(i-1).val(result.ticker);
                        $(".stock-code-input").eq(i-1).val(result.ticker)
                        $(".stock-name-input").eq(i-1).val(result.stock_name)
                        $('.sn').eq(i-1).val(result.stock_name);
                        $('.sc').eq(i-1).val(result.ticker);
                        let chartData = [];
                        let lastCloseValue; // 마지막 Close값
                        let lastCloseValuePreviousDay; // 마지막 전날 Close값
                        $(".stock-name").eq(i-1).on("click",function(){
                        	$(".detail-form").eq(i-1).submit()
                        })
                        
						
                        result.data.forEach(function (data, index) {
                            chartData.push({
                                time: formatDate(data.Date),
                                value: data.Close,
                            });
                            lastCloseValue = data.Close; // 마지막 Close 값 저장

                            if (index === result.data.length - 2) {
                                lastCloseValuePreviousDay = data.Close; // 마지막 전날 Close 값 저장
                            }
                            // 거래량 , 시가 , 고가, 저가를 불러오고 해당 html에 toLocaleString 으로 천의 자릿수마다 콤마를 찍어준뒤 출력
                            $('.volume').eq(i-1).text("거래량 : "+data.Volume.toLocaleString());
                            $('.open').eq(i-1).text("시가 : "+data.Open.toLocaleString());
                            $('.high').eq(i-1).text("고가 : "+data.High.toLocaleString());
                            $('.low').eq(i-1).text("저가 : "+data.Low.toLocaleString());
                        });
                        // 가져온 데이터 차트에 등록
                        lineSeries.setData(chartData);
                        timeScale.applyOptions({
                            barSpacing: 10,
                        });

                        // lastCloseValue와 lastCloseValuePreviousDay 변수를 이용하여 원하는 작업 수행
                        console.log('마지막 Close 값:', lastCloseValue);
                        $('.last-close-value').eq(i-1).text("현재가 : "+lastCloseValue.toLocaleString());
                        $('.prev-close').text(lastCloseValuePreviousDay.toLocaleString());

                        if (lastCloseValuePreviousDay) {
                            console.log('전날 마지막 Close 값:', lastCloseValuePreviousDay);
                            if (lastCloseValue - lastCloseValuePreviousDay >= 0) {
                                //  마지막날값에서 마지막 전날값을 뺐을때 0보다 크다면
                                //  해당 div색을 상승시 빨간색으로 바꾸고 ▲ 모양과 함께 마지막날값에서 마지막 전날값을 뺀 금액과
                                //  %로 계산한것을 해당 html에 출력 , 하락시 반대로 적용
                                $('.price-changes').text(
                                    '▲' + (lastCloseValue - lastCloseValuePreviousDay).toLocaleString()
                                );
                                $('.price-changes-percent').text(
                                    '▲' +
                                        (
                                            ((lastCloseValue - lastCloseValuePreviousDay) / lastCloseValuePreviousDay) *
                                            100
                                        ).toFixed(2)
                                );
                                $('.price-changes').css('color', 'red');
                                $('.price-changes-percent').css('color', 'red');
                                $('.last-close-value').css('color', 'red');
                                $('#price-change-box').css('background-color', '#FCEDEB');
                            } else {
                                $('.price-changes').text(
                                    '▼' + (lastCloseValue - lastCloseValuePreviousDay).toLocaleString()
                                );
                                $('.price-changes-percent').text(
                                    '▼' +
                                        (
                                            ((lastCloseValue - lastCloseValuePreviousDay) / lastCloseValuePreviousDay) *
                                            100
                                        ).toFixed(2)
                                );
                                $('.price-changes').css('color', 'blue');
                                $('.price-changes-percent').css('color', 'blue');
                                $('.last-close-value').css('color', 'blue');
                                $('#price-change-box').css('background-color', '#ECF3FD');
                            }
                        }checkBookmark()
                    },
                    error: function (xtr, status, error) {
                        alert(xtr + ':' + status + ':' + error);
                    },
                });
            }
            function formatDateToCustomFormat() {
            	  const currentDate = new Date();
            	  const year = currentDate.getFullYear();
            	  const month = String(currentDate.getMonth() + 1).padStart(2, '0');
            	  const day = String(currentDate.getDate()).padStart(2, '0');

            	  return `${year}-${month}-${day}`;
            	}

            	const formattedDate = formatDateToCustomFormat();

			endDate_data[i-1].value = formattedDate
            submitButton[i - 1].addEventListener('click', function () {
                test(ticker_data[i - 1].value, startDate_data[i - 1].value, endDate_data[i - 1].value);
            });
        }
    </script>
    <script src="${CP}/resources/js/header-main.js"></script>
    <script src="${CP}/resources/js/util.js"></script>
</html>
