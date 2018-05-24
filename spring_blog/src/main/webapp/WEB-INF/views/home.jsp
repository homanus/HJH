<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="ssi/ssi.jsp" %>
<c:set var="title" value="얍얍얍"></c:set>
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A' }">
<c:set var="title" value="관리자 페이지 입니다."></c:set>
</c:if>

<c:choose>
	<c:when test="${empty sessionScope.id }">
	<c:set var="str" value="메인페이지 입니다."/>
	</c:when>
	<c:otherwise>
	<c:set var="str" value="환영합니다! ${sessionScope.id } 회원님 "/>
	<c:if test="${sessionScope.grade == 'A' }">
	<c:set var="str" value=""/>
	</c:if>
	</c:otherwise>
</c:choose>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 
<div class="title">${title }</div>

<div class="content">
<h1>${str }</h1>
<img src="${root }/images/main.jpg" width="50%"><br>

<c:choose>
<c:when test="${empty sessionScope.id }">
<input type="button" value="로그인"
onclick="location.href='${root}/member/login'">
</c:when>
<c:otherwise>
<input type="button" value="로그아웃"
onclick="location.href='${root}/member/logout'">
</c:otherwise>
</c:choose>
<embed height="200" width="90%" src="http://www.gagalive.kr/livechat1.swf?chatroom=~~~new_08217"></embed>
</div>
</body> 
</html> 
