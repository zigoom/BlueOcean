<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath}"></c:set>
<c:url value="/user/doRetrieve.do" var="user"/>
<c:url value="/board/boardView.do" var="freeboardURL">
  <c:param name="div" value="10"></c:param>
</c:url>

<c:url value="/board/boardView.do" var="boardURL">
  <c:param name="div" value="20"></c:param>
</c:url>
<!-- //메뉴생성 -->
  <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
  </div>
</nav>
