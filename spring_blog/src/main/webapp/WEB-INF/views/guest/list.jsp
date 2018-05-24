<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../ssi/ssi.jsp" %>

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
.search{
	width:80%;
	margin:2px auto;
	text-align: center;
}
.bottom{
  margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
.content{
  font-size: 24px;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  margin: 0 auto; /* 가운데 정렬 */
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>

<script type="text/javascript">
function create(){
	var url = "create";
	location.href=url;
	
}
function gupdate(gno){
	var url = "update";
	url+="?gno="+gno;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	location.href=url;
	
}
function gdelete(gno){
	var url = "delete";
	url+="?gno="+gno;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	
	var wr = window.open(url,"음하하하하핳","width=500,height=500");
	wr.moveTo(((window.screen.width-500)/2),((window.screen.height-500)/2));
	
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<script type="text/javascript">
function agreement(){
	var url = "${root}/member/agreement";
	location.href=url;
}
function login(){
	var url="${root}/member/login";
	location.href=url;
}
</script>
<!-- *********************************************** -->
<c:choose>
	<c:when test="${empty id }">
<div class="content">
		비로그인 상태입니다.<br>
		비밀스런 공간은
		<br>로그인 또는 회원가입 후 이용하실 수 있습니다.
		<br><input type='button' value='로그인' onclick='login()'>
		<br><input type='button' value='회원가입' onclick='agreement()'>
		<input type='button' value='뒤로가기' onclick='history.back()'>
</div>
	</c:when>
	<c:otherwise>

<!-- =========================================================== -->
<div class="container">
<h2><span class="glyphicon glyphicon-pencil"></span></h2>
<FORM 	name='frm'
		method='POST'
		action='create'
		enctype="multipart/form-data">
		
		<input type="hidden" name="id" value="${id }">
		<%-- <input type="hidden" name="passwd" value="<%=passwd%>"> --%>
		
  <TABLE class="table table-bordered">
    <TR>
      <tr>
    	<th>사진</th>
    	<td><input type='file' name='fnameMF' accept=".jpg,.png,.gif">
    </tr>
    <tr>
    	<th>작성자</th>
    	<td><input type="text" name="gname" value=""></td>
    </tr>
    <tr>
    	<th>내용</th>
    	<td><textarea rows="5" cols="30" name="content"></textarea></td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='글 작성'>
    <input type="reset" value="리셋">
  </DIV>
</FORM>

<br><br>
<br><br>

<!-- =========================================================== -->






		

		
		<h2><span class="glyphicon glyphicon-th-list"></span>비밀목록</h2>

<c:forEach var="dto" items="${list }">
	<TABLE class="table table-hover">
    <TR>
      <td rowspan="5" width="30%"><img src="${root }/storage_guest/${dto.fname}" width="300px" height="200px"></td>
      <th width="20%">이름</th>
      <td width="50%">${dto.gname }</td>
    </TR>
    <tr>
    	<th>내용</th>
    	<td>${dto.content}</td>
    </tr>
    <tr>
    	<th>작성시간</th>
    	<td>${dto.gdate }</td>
    </tr>
    <tr>
   		<th>수정/삭제</th>
   		<td><a href="javascript:gupdate('${dto.gno }')">수정</a>/
   		<a href="javascript:gdelete('${dto.gno }')">삭제</a>
   		</td> 
    </tr>
    
  </TABLE>
  
  

</c:forEach>
 </div>
 
  <div class="search">
  
<form method="post" action='list'>
		
<select name="col">
<option value="gname"
<c:if test="${col == 'gname' }">selected</c:if>
>이름</option>
<option value="content"
<c:if test="${col == 'content' }">selected</c:if>
>내용</option>
<option value="total">전체출력</option>
</select>
<input type="search" name="word" value="${word }" required>
<button>검색</button>
</form>
</div>
${paging }
 
	</c:otherwise>
</c:choose>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
