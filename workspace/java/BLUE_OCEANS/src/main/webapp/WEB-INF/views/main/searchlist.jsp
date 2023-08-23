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
<link rel="stylesheet" href="${CP}/resources/css/admin.css" />
<title>Insert title here</title>
</head>
<style>
      #data-table {
        margin: 0 auto;
        table-layout: fixed;
        width: 100%;
        border-collapse: collapse;
    }
    
	  #data-table th {
		    background-color: #f2f2f2; /* 테이블 헤더의 배경색을 설정합니다. */
		}
		
		.data-tbody {
		    background-color: #ffffff; /* 테이블 본문의 배경색을 설정합니다. */
		}    
    
    .data-tr {
    transition: background-color 0.3s ease; /* 호버 시 배경색 변화를 부드럽게 설정합니다. */
    }
    
    .data-tr:hover {
    background-color: #d3d3d3; /* 호버 시 배경색을 변경합니다. */
    cursor: pointer; /* 호버 시 커서 모양을 변경합니다. */
    }		
		
    
</style>
<body>

<div class="main-container" style="display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div id="body-container" style="background-color: white; width: 80%; height: 77vh; display: flex; flex-direction: column;">
        <form>
            <table style="table-layout: fixed; width: 100%" id="data-table">
                <thead>
                    <tr>
                        <th id="" scope="col">종목명</th>
                        <th id="" scope="col">현재가</th>
                        <th id="" scope="col">전일비</th>
                        <th id="" scope="col">등락률</th>
                        <th id="" scope="col">거래량</th>
                    </tr>
                </thead>
                <tbody class="data-tbody">
                    <!-- 여기에 데이터를 동적으로 추가할 것입니다. -->
                </tbody>
            </table>
        </form>
        <div id="pagination" style="display: flex; justify-content: center; margin-top: auto;">
            <!-- 페이징 버튼이 바닥에 고정됩니다. -->
        </div>
    </div>
</div>





	<script>
		    // 서버에서 받아온 데이터
let searchData = ${searchData}; // searchData 변수에 데이터 할당
let totaldata = searchData.length;
const dataPerPage = 10; // 한 페이지에 보여줄 데이터 개수
let currentPage = 1; // 현재 선택된 페이지

// "code" 부분을 배열로 저장할 변수 선언
let codeArray = [];

// searchData를 순회하면서 "code" 값을 배열에 추가
for (var i = 0; i < searchData.length; i++) {
    codeArray.push(searchData[i].code);
}

// 배열에 저장된 "code" 값을 확인하기 위해 콘솔에 출력
//console.log(codeArray);

$(document).ready(function() {        
    // fetchTickerData 함수 호출 시작
    fetchTickerData(0);
});

function fetchTickerData(index) {
    if (index < codeArray.length) {

        let currentDate = new Date();
        currentDate.setDate(currentDate.getDate() - 1);
        let formattedDate = currentDate.toISOString().split('T')[0];

                // 다음 데이터 요청
                let requestData = {
                    ticker: codeArray[index], // 현재 순서의 "code"
                    date: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>',
                    interval: 10,
                }; 

                $.ajax({
                    type: "POST",
                    url: 'http://125.142.47.191:5001/blue-oceans/search-tickers',
                    data: JSON.stringify(requestData),
                    contentType: 'application/json',
                    success: function(data) {
                        console.log(`Fetched data for ticker ${requestData.ticker}:`, data);
                        let stockName = data.stock_name;;
                        const yesterdayIndex = data.data.length-2;
                        const todayIndex = data.data.length-1;
                        let yesterdayClose = data.data[yesterdayIndex].Close;
                        let todayClose = data.data[todayIndex].Close;
                        let todayOpen = data.data[todayIndex].Open;
                        let change = todayClose - yesterdayClose;
                        let volume = data.data[todayIndex].Volume;
                        
                        
                        
                        
                        
                        const tbody = document.querySelector('.data-tbody');
                        for (let i = 0; i < 1; i++) {

                            let tbody = $(".data-tbody");
                            let tr = $("<tr class='data-tr'></tr>");
                            tr.append("<td>"+stockName+"</td>")
                            tr.append("<td>"+numberWithCommas(todayClose)+"</td>");
				                    // 전일비에 따라서 화살표와 색상 표시
				                    if (change > 0) {
				                        tr.append("<td><span style='color: red;'>&#9650; +"+ change + "</span></td>");
				                    } else if (change < 0) {
				                        tr.append("<td><span style='color: blue;'>&#9660; " + change + "</span></td>");
				                    } else {
				                        tr.append("<td>" + change + "</td>");
				                    }
				                    
				                    // 등락률에 따라서 화살표와 색상 표시
				                    let rateChange = ((todayClose - yesterdayClose) / yesterdayClose * 100).toFixed(2);
				                    if (rateChange > 0) {
				                        tr.append("<td><span style='color: red;'>&#9650;"+"+" + rateChange + "%</span></td>");
				                    } else if (rateChange < 0) {
				                        tr.append("<td><span style='color: blue;'>&#9660; " + rateChange + "%</span></td>");
				                    } else {
				                        tr.append("<td>" + rateChange + "%</td>");
				                    }
                            tr.append("<td>"+volume+"</td>");
                            tbody.append(tr);   
				                            
				                    // 클릭 이벤트 리스너 추가
				                    tr.on("click", function() {
				                        // 클릭한 데이터에 대한 정보를 콘솔에 출력
				                        console.log("Clicked Data:");
				                        console.log("Stock Name:", stockName);
				                        console.log("Today Close:", todayClose);
				                        console.log("Change:", change);
				                        console.log("Rate Change:", rateChange + "%");
				                        console.log("Volume:", volume);
				                        
				                        
							                  let requestData = {
							                      name: stockName
							                  };
							          
							                  $.ajax({
							                      type: "POST",
							                      url: 'http://125.142.47.191:5001/blue-oceans/search-stocks-list',
							                      data: JSON.stringify(requestData),
							                      contentType: 'application/json',
							                      success: function(data) {
							                    	  console.log("data :", data);

													            let value = stockName; // 클릭한 주식 이름
													            let code = data.data[0].Code; // 클릭한 주식의 코드							                    	  
							          
					                                                                             //--------------------------------------------------------------------
                                                $.ajax({
                                                    type: "GET",
                                                    url: '/ehr/BLUEOCEAN/detail.do',
                                                    async: true,
                                                    dataType: 'html',                      
                                                    success: function(data) {
                                                      window.location.href = '/ehr/BLUEOCEAN/detail.do?' + $.param({ stockName: value, stockCode: code });
                                                    },
                                                    
                                                  error: function(xhr, textStatus, errorThrown) {
                                                      console.log("error:" + errorThrown);
                                                  }
                                        
                                                }); 
											                          
											                      },
											                      error: function(xhr, textStatus, errorThrown) {
											                          console.log("error:" + errorThrown);
											                      }
											                  });
							                  

							                  

							              				                        
				                        
				                    });     
				                    
                        
                        }
                        
                        
                        
                        
                        
                        
                        // 다음 요소에 대한 데이터 가져오기
                        fetchTickerData(index + 1);
                        
                        createPagination(totaldata);
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log("error:" + errorThrown);
                        // 다음 요소에 대한 데이터 가져오기
                        fetchTickerData(index + 1);
                    }
                });

                          

    }
}     

function showDataForPage(page) {
    currentPage = page;
    const startIndex = (page - 1) * dataPerPage;
    const endIndex = startIndex + dataPerPage;
    //updateTableWithData(searchData.slice(startIndex, endIndex));
}

//페이지 번호를 동적으로 생성하는 함수
function createPagination(totalDataCount) {
    const totalPages = Math.ceil(totalDataCount / dataPerPage);
    const pagination = document.getElementById("pagination");
    pagination.innerHTML = "";

    for (let i = 1; i <= totalPages; i++) {
        const button = document.createElement("button");
        button.textContent = i;
        button.type = "button";
        button.classList.add("page_nation", "btn", "btn-primary"); // 클래스 추가
        button.style.margin = "5px";
        button.addEventListener("click", function () {
            showDataForPage(i);
        });

        pagination.appendChild(button);
    }

    // 처음 페이지 설정
    showDataForPage(1);
}

// 페이지 번호를 클릭했을 때 해당 페이지의 데이터를 표시하는 함수
function showDataForPage(page) {
    currentPage = page;
    const startIndex = (page - 1) * dataPerPage;
    const endIndex = startIndex + dataPerPage;
    //updateTableWithData(totalData.slice(startIndex, endIndex));
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}



	</script>

</body>
</html>