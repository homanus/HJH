<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<style type="text/css">
/*
ul#menu li {
	display: inline;
}

ul#menu li a {
	background-color: black;
	color: white;
	padding: 10px;
	text-decoration: none;
	border-radius: 4px 4px 0 0;
}

ul#menu li a:hover {
	background-color: orange;
}

.table {
	width: 100%;
}

.table, .td {
	border-style: none;
}
ul#a li{
	background-color: white;
	padding: 0px;
	text-decoration: none;
	border-radius: 0px 0px 0 0;
}*/
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
</script>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
        <img src="${root }/images/Serious.jpg" width='50%'>
    </td>
  </tr>
  
  <tr>
    <td class="td">
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${root }/"><span class="glyphicon glyphicon-bitcoin"></span></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${root }/"><span class="glyphicon glyphicon-home"></span></a></li>
      
      <li class="dropdown"><a class="dropdown-toggle"
      data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${root }/bbs/create">생성</a></li>
          <li><a href="${root }/bbs/list">목록</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle"
      data-toggle="dropdown" href="#">메모<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${root }/memo/create">생성</a></li>
          <li><a href="${root }/memo/list">목록</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle"
      data-toggle="dropdown" href="#">비밀공간<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${root }/guest/list">목록</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle"
      data-toggle="dropdown" href="#">이미지게시판<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${root }/image/create">생성</a></li>
          <li><a href="${root }/image/list">목록</a></li>
        </ul>
      </li>
      <c:if test="${not empty sessionScope.id && sessionScope.grade != 'A' }">
      <li><a href="${root }/member/delete">회원탈퇴</a></li>
      </c:if>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <c:choose>
    <c:when test="${empty sessionScope.id }">
      <li><a href="${root }/member/agreement">
      <span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${root }/member/login">
      <span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </c:when>
    <c:when test="${not empty sessionScope.id && sessionScope.grade != 'A' }">
      <li><a href="${root }/member/read">
      <span class="glyphicon glyphicon-user"></span> My Info</a></li>
      <li><a href="${root }/member/logout">
      <span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </c:when>
    </c:choose>
    <c:if test="${not empty sessionScope.id && sessionScope.grade =='A'}">
      <li><a href="${root }/admin/list">
      <span class="glyphicon glyphicon-lock"></span> 회원목록</a></li>
      <li><a href="${root }/member/logout">
      <span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </c:if>
    
    </ul>
  </div>
</nav>
    
    
    
    
    
   <%--  <ul id="menu">
     <li><a href="<%=root %>/index.jsp">홈</a></li>
     <%if(id==null) {%>
     <li><a href="<%=root %>/member/agreement.jsp">회원가입</a></li>
     <li><a href="<%=root %>/member/loginForm.jsp">로그인</a></li>
     <%}else{ %>
     <li><a href="<%=root %>/member/read.jsp">정보확인</a></li>   
     <li><a href="<%=root %>/member/deleteForm.jsp">회원탈퇴</a></li>
     <li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li>
     <%} %>
     <li><a href="<%=root %>/bbs/list.jsp">게시판</a></li>
     <li><a href="<%=root %>/memov3/list.jsp">메모</a></li>
    <a href="javascript:rel()"><img src="<%=root %>/19.jpg" align="center" width="50px" height="50px"></a>
    </ul> --%>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style=width:100% padding-top:10px>

</body>
</html>
