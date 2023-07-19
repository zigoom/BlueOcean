<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면에 100% 보여준다.(핸드폰 화면기준으로 축소) -->
<meta name="viewport" content="width=device-width, inital-scale=1">
<title><tiles:getAsString name="title"></tiles:getAsString> </title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
  <table>
    <tr>
      <td colspan="2">
        <tiles:insertAttribute name="header"/>
      </td>
     </tr>
         <tr>
      <td>
        <tiles:insertAttribute name="menu"/>
      </td>
     </tr>
     <tr>
      <td>
        <tiles:insertAttribute name="body"/>
      </td>
     </tr>
       <tr>
      <td colspan="2">
        <tiles:insertAttribute name="footer"/>
      </td>
     </tr>
  </table>
</body>
</html>