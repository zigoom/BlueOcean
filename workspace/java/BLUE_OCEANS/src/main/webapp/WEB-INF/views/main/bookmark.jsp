<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://cdn.jsdelivr.net/npm	/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/lightweight-charts/dist/lightweight-charts.standalone.production.js"></script>
<script src="https://kit.fontawesome.com/649b25c1cf.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css" />
<link rel="stylesheet" href="${CP}/resources/css/footer.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.container {
	width: 60%;
}

.bookmark-container {
	border: 1px solid black;
	display: flex;
	justify-content: space-between;
	align-content: center;
	height: 210px;
}

.text-container {
	margin-top: 7px;
	margin-bottom: 15px;
	margin-left: 50px;
	width: 500px;
	height: 250px;
}

.text-container p {
	font-size: 17px;
	font-weight: bold;
}

.last-close-value {
	margin-top: 15px;
}

.text-container a {
	text-decoration: none;
	cursor: pointer;
	color: black;
	font-size: 18px;
	font-weight: bold;
}

.fa-solid {
	color: gold;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="login-heading mb-4">
			&nbsp;&nbsp;&nbsp;&nbsp;<b>관심페이지</b>
		</h1>
		<div style="margin-bottom: 50px;">
			<hr class="mb-6">
		</div>
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<!-- 로그인 후 이용해주세요 메시지 표시 -->
				<p>로그인 후 이용해주세요.</p>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${empty bookmarkList}">
						<!-- 관심목록이 없는 경우 메시지 표시 -->
						<p>관심목록이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<!-- 로그인 된 경우에만 루프 내용을 표시 -->
						<c:forEach var="item" items="${bookmarkList}" varStatus="loop">
							<div style="margin: 0px auto; width: 80%;">
								<div class="list-container">
									<form method="get" action="/ehr/BLUEOCEAN/detail.do" class="detail-form">
										<!-- 주식종목코드 값 담아두는 인풋 -->
										<div class="bookmark-container">
											<div id="chart-container${loop.index+1}" style="width: 500px; height: 250px;"></div>
											<div class="text-container">
												<a class="stock-name"></a> <input type="hidden" class="stock-code-input" name="stockCode" value="${item}"> <input type="hidden" class="stock-name-input" name="stockName">
												<p class="last-close-value"></p>
												<p class="high"></p>
												<p class="volume"></p>
												<p class="low"></p>
											</div>
											<div style="margin-right: 15px;">
												<i style="margin-left: 50px; margin-top: 25px" class="fa-regular fa-star fa-2xl bookmark-button"></i>
											</div>
										</div>
									</form>

									<input type="hidden" class="ui" value="${sessionScope.user}" />
									<!-- 유저아이디 값 담아두는 인풋 -->
									<input type="hidden" class="sn" />
									<!-- 주식종목이름 값 담아두는 인풋 -->
									<input type="hidden" class="sc" /> <input type="hidden" name="Ticker" id="Ticker" value="${item}" class="Ticker" /> <input type="hidden" name="StartDate" id="StartDate" class="StartDate" value="1900-01-01" /> <input type="hidden" name="EndDate" id="EndDate" class="EndDate" /> <label> <input class="submit-button" type="hidden" value="데이터 요청" />
									</label>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>
</body>


<script>
	// 북마크 버튼 요소 선택

	// 20200101 등의 값을 2020-01-01 로 변경해주는 함수
	function formatDate(date) {
		const dateString = date.toString();
		const year = dateString.slice(0, 4);
		const month = dateString.slice(4, 6);
		const day = dateString.slice(6, 8);

		return year + '-' + month + '-' + day;
	}
	let bookmarkListLengh = "${bookmarkList}";
	console.log(bookmarkListLengh)
	for (let i = 1; i <= bookmarkListLengh.length; i++) {
		let bookmarkButton = document.querySelectorAll('.bookmark-button');
		let submitButton = document.querySelectorAll('.submit-button'); // 데이터 제출 버튼
		let ticker_data = document.querySelectorAll('.Ticker'); // 주식종목 코드
		let startDate_data = document.querySelectorAll('.StartDate'); // 시작일
		let endDate_data = document.querySelectorAll('.EndDate'); // 종료일

		// 북마크에 이미 등록되어있는지 체크하는 함수
		function checkStar() {
			let userId = $('.ui').eq(i - 1).val();
			let stockName = $('.sn').eq(i - 1).val();
			let stockCode = $('.sc').eq(i - 1).val();
			$.ajax({
				type : 'GET',
				url : '/ehr/BLUEOCEAN/checkBookmark.do',
				async : true,
				dataType : 'html',
				data : {
					userId : $('.ui').eq(i - 1).val(),
					stockName : $('.sn').eq(i - 1).val(),
					stockCode : $('.sc').eq(i - 1).val(),
				},
				success : function(data) {
					if (data == 1) {
						bookmarkButton[i - 1].classList.remove('fa-regular');
						bookmarkButton[i - 1].classList.add('fa-solid');

					} else {
						bookmarkButton[i - 1].classList.remove('fa-solid');
						bookmarkButton[i - 1].classList.add('f	a-regular');

					}
				},
				error : function(data) {
					console.log('Error check star:', data);
				},
			});
		}

		// 북마크 버튼 클릭 이벤트 핸들러 함수
		function checkBookmark() {
			let userId = $('.ui').eq(i - 1).val();
			let stockName = $('.sn').eq(i - 1).val();
			let stockCode = $('.sc').eq(i - 1).val();
			$.ajax({
				type : 'GET',
				url : '/ehr/BLUEOCEAN/checkBookmark.do',
				async : true,
				dataType : 'html',
				data : {
					userId : userId,
					stockName : stockName,
					stockCode : stockCode,
				},
				success : function(data) {
					if (data == 1) {
						bookmarkButton[i - 1].classList.add('fa-regular');
						bookmarkButton[i - 1].classList.remove('fa-solid');
						deleteBookmark(userId, stockName, stockCode);
					} else {
						bookmarkButton[i - 1].classList.add('fa-solid');
						bookmarkButton[i - 1].classList.remove('fa-regular');
						addBookmark(userId, stockName, stockCode);
					}
				},
				error : function(data) {
					console.log('Error check bookmark:', data);
				},
			});
		}
		// 북마크 추가 함수
		function addBookmark(userId, stockName, stockCode) {
			$.ajax({
				type : 'GET',
				url : '/ehr/BLUEOCEAN/addBookmark.do',
				async : true,
				dataType : 'html',
				data : {
					userId : userId,
					stockName : stockName,
					stockCode : stockCode,
				},
				success : function(data) {
					if (data == 1) {
						alert("관심목록에 추가되었습니다.");
					} else if (data == 2) {
						alert("최대 등록 가능갯수를 초과했습니다.");
						bookmarkButton[i - 1].classList.add('fa-regular');
						bookmarkButton[i - 1].classList.remove('fa-solid');
					} else if (data == 3) {
						console.log("이미 관심종목에 등록되어 있습니다.");
					}
				},
				error : function(data) {
					console.log('Error adding bookmark:', data);
				},
			});
		}

		// 북마크 삭제 함수
		function deleteBookmark(userId, stockName, stockCode) {
			$.ajax({
				type : 'GET',
				url : '/ehr/BLUEOCEAN/deleteBookmark.do',
				async : true,
				dataType : 'html',
				data : {
					userId : userId,
					stockName : stockName,
					stockCode : stockCode,
				},
				success : function(data) {
					alert("관심목록에서 삭제되었습니다.");
					$(".list-container").eq(i - 1).hide();
				},
				error : function(data) {
					console.log('Error deleting bookmark:', data);
				},
			});
		}

		// 북마크 버튼 클릭 이벤트 리스너 등록
		$(".bookmark-button").eq(i - 1).on("click", function() {
			if ($('.ui').val() == null || $('.ui').val() == '') {
				alert('로그인 후 이용해주세요.');
			} else {
				checkBookmark();
			}
		});

		// 차트 생성
		const chartContainer = document.getElementById('chart-container' + i);
		console.log(chartContainer);
		const chart = LightweightCharts.createChart(chartContainer, {
			width : 450,
			height : 200
		});

		// 데이터 설정
		const chartData = [];

		function test(td, sd, ed) {
			// 시리즈 생성
			const lineSeries = chart.addLineSeries();

			// 시간 척도 설정
			const timeScale = chart.timeScale();
			let requestData = {
				ticker : td,
				startDate : sd,
				endDate : ed,
			};

			// ajax를 활용해 http://125.142.47.191:5001/blue-oceans/search-tickers을 호출하여 불러온 데이터를 파싱
			$
					.ajax({
						type : 'POST',
						url : 'http://125.142.47.191:5001/blue-oceans/search-tickers',
						data : JSON.stringify(requestData),
						contentType : 'application/json',
						mode : 'cors',
						success : function(result) {
							$('.stock-name').eq(i - 1).text(
									result.stock_name + '(' + result.ticker
											+ ')');
							$(".Ticker").eq(i - 1).val(result.ticker);
							//$(".stock-code-input").eq(i - 1).val(result.ticker);
							$(".stock-name-input").eq(i - 1).val(
									result.stock_name);
							$('.sn').eq(i - 1).val(result.stock_name);
							$('.sc').eq(i - 1).val(result.ticker);
							let chartData = [];
							let lastCloseValue; // 마지막 Close값
							let lastCloseValuePreviousDay; // 마지막 전날 Close값

							$(".stock-name").eq(i - 1).on("click", function() {
								$(".detail-form").eq(i - 1).submit();
							});

							result.data
									.forEach(function(data, index) {
										chartData.push({
											time : formatDate(data.Date),
											value : data.Close,
										});
										lastCloseValue = data.Close; // 마지막 Close 값 저장

										if (index === result.data.length - 2) {
											lastCloseValuePreviousDay = data.Close; // 마지막 전날 Close 값 저장
										}

										$('.volume')
												.eq(i - 1)
												.text(
														"거래량 : "
																+ data.Volume
																		.toLocaleString());
										$('.open')
												.eq(i - 1)
												.text(
														"시가 : "
																+ data.Open
																		.toLocaleString());
										$('.high')
												.eq(i - 1)
												.text(
														"고가 : "
																+ data.High
																		.toLocaleString());
										$('.low')
												.eq(i - 1)
												.text(
														"저가 : "
																+ data.Low
																		.toLocaleString());
									});

							// 가져온 데이터 차트에 등록
							lineSeries.setData(chartData);
							timeScale.applyOptions({
								barSpacing : 10,
							});

							// lastCloseValue와 lastCloseValuePreviousDay 변수를 이용하여 원하는 작업 수행
							console.log('마지막 Close 값:', lastCloseValue);
							$('.last-close-value').eq(i - 1).text(
									"현재가 : " + lastCloseValue.toLocaleString());
							$('.prev-close').text(
									lastCloseValuePreviousDay.toLocaleString());

							if (lastCloseValuePreviousDay) {
								console.log('전날 마지막 Close 값:',
										lastCloseValuePreviousDay);
								if (lastCloseValue - lastCloseValuePreviousDay >= 0) {
									$('.price-changes')
											.text(
													'▲'
															+ (lastCloseValue - lastCloseValuePreviousDay)
																	.toLocaleString());
									$('.price-changes-percent')
											.text(
													'▲'
															+ (((lastCloseValue - lastCloseValuePreviousDay) / lastCloseValuePreviousDay) * 100)
																	.toFixed(2));
									$('.price-changes').eq(i - 1).css('color',
											'red');
									$('.price-changes-percent').eq(i - 1).css(
											'color', 'red');
									$('.last-close-value').eq(i - 1).css(
											'color', 'red');
									$('#price-change-box').eq(i - 1).css(
											'background-color', '#FCEDEB');
								} else {
									$('.price-changes')
											.text(
													'▼'
															+ (lastCloseValue - lastCloseValuePreviousDay)
																	.toLocaleString());
									$('.price-changes-percent')
											.text(
													'▼'
															+ (((lastCloseValue - lastCloseValuePreviousDay) / lastCloseValuePreviousDay) * 100)
																	.toFixed(2));
									$('.price-changes').eq(i - 1).css('color',
											'blue');
									$('.price-changes-percent').eq(i - 1).css(
											'color', 'blue');
									$('.last-close-value').eq(i - 1).css(
											'color', 'blue');
									$('#price-change-box').eq(i - 1).css(
											'background-color', '#ECF3FD');
								}
							}

							checkStar();
						},
						error : function(xtr, status, error) {
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
		endDate_data[i - 1].value = formattedDate;

		$(document).ready(
				function() {
					test(ticker_data[i - 1].value, startDate_data[i - 1].value,
							endDate_data[i - 1].value);
				})

	}
</script>

<script src="${CP}/resources/js/header-main.js"></script>
<script src="${CP}/resources/js/util.js"></script>
</html>
