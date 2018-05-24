<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../ssi/ssi.jsp" %>

<c:set var="map" value="<%=new java.util.HashMap() %>"/>

<c:choose>
<c:when test="${idflag == true }">
<c:set target="${map }" property="str" value="중복된 아이디 입니다."/>
</c:when>
<c:when test="${emailflag == true }">
<c:set target="${map }" property="str" value="중복된 이메일 입니다."/>
</c:when>
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
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">이메일, 아이디 중복 확인</DIV>
 <div class="content">${map.str}
	</div>
  <div class="bottom">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 