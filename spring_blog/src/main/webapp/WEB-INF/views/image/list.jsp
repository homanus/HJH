<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../ssi/ssi.jsp" %>

<c:set var="list" value="${list }"></c:set>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
TABLE{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
  font-size: 20px;
  border-spacing:0px;
  border-style:none;
  padding:0px;
}
.search{
	width:80%;
	margin:2px auto;
	text-align: center;
}
h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
body {font-family: "Open Sans"}
th{
text-align: center;
}
</style> 
<script type="text/javascript">
function icreate(){
	var url = "create";
	location.href=url;
}
function filedown(fname){
	var url = "${root}/download";
	url+="?filename="+fname;
	url+="&dir=/storage_image";
	
	location.href=url;
	
}
function idelete(fname,ino){
	var url="delete";
	url+="?ino="+ino;
	url+="&fname="+fname;
	url+="&nowPage=${nowPage}";
	url+="&col=${col}";
	url+="&word=${word}";
	location.href=url;
}
function iupdate(ino){
	var url="update";
	url+="?ino="+ino;
	url+="&nowPage=${nowPage}";
	url+="&col=${col}";
	url+="&word=${word}";
	location.href=url;
}
function read(ino){
	var url = "read";
	url+="?ino="+ino;
	url+="&nowPage=${nowPage}";
	url+="&col=${col}";
	url+="&word=${word}";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<div class="w3-white">
<div class="container">
<h2><span class="glyphicon glyphicon-film"></span>이미지 게시판</h2>

<table class="table table-hover">
	<tr>
		<th><div style="margin:10px">사진</div></th>
		<th><div style="margin:10px">제목</div></th>
		<th><div style="margin:10px">이름</div></th>
		<th><div style="margin:10px">작성날짜</div></th>
		<th><div style="margin:10px">수정/삭제</div></th>
	</tr>
	<c:choose>
		<c:when  test="${empty list }">
			<tr>
				<td colspan="5">작성된 글이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td><div style="margin:10px"><a href="javascript:filedown('${dto.fname }')"${dto.fname }><img src="${root }/storage_image/${dto.fname }" width="100px" height="80px"></a></div></td>
					<td><div style="margin:10px"><a href="javascript:read('${dto.ino }')">${dto.title }</a></div></td>
					<td><div style="margin:10px">${dto.mname }</div></td>
					<td><div style="margin:10px">${dto.wdate }</div></td>
					<td><div style="margin:10px"><a href="javascript:iupdate('${dto.ino }')">수정</a>/
					<a href="javascript:idelete('${dto.fname }','${dto.ino }')">삭제</a></div></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
<%-- 	<%if(list.size()==0){ %>
	<tr>
		<td colspan="5">작성된 글이 없습니다.</td>
	</tr>
	<%}else{
		for(int i=0; i<list.size(); i++){
			ImageDTO dto = list.get(i);
		
	
	%>
 --%>	

</table>
 <div class="search">
${paging }

<form name='frm' action='list' method='post'>
<select name="col">
	<option value="title"
	<c:if test="${col=='title'}">
	selected
	</c:if>	
	>제목</option>
	<option value="mname"
	<c:if test="${col=='mname'}">
	selected
	</c:if>
	>이름</option>
	<option value="total">전체</option>
</select>
<input type="search" name="word" value="${word }" required>
<button  class="w3-button w3-white w3-border">검색</button>
<button type="button" class="w3-button w3-red" onclick="icreate()">등록</button>
</form>
</div>

 </div>
 </div> 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 