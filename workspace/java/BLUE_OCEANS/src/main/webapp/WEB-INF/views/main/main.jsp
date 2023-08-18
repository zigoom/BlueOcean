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
		<link rel="stylesheet" href="${CP}/resources/css/header.css">
		<link rel="stylesheet" href="${CP}/resources/css/footer.css">
		<title>Insert title here</title>
	</head>
	
	<body>
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
	                newsHtml += "<h5 style='font-weight:bold;'>" + $('#keyword').val() + ' 뉴스</h5>';
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
	</body>
	<script src="${CP}/resources/js/header-main.js"></script>
	<script src="${CP}/resources/js/util.js"></script>
</html>