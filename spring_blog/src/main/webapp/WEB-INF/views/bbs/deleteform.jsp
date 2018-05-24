<%@ page contentType="text/html; charset=UTF-8" %> 
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
.bottom{
  margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style> 
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function blist(){
	var url ="list";
	url+="?con=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<div class="content">
<c:choose>
	<c:when test="${flag == true }">
		답변 글이 있으므로 삭제할 수 없습니다.
		<br>
		<button type="button" onclick="history.back()">뒤로가기</button>
	</c:when>
	<c:otherwise>
		<DIV class="title">비밀번호 입력</DIV>
 
		<FORM name='frm' method='POST' action='delete'>
		<input type="hidden" name="bbsno" value="${param.bbsno }"/>
		<input type="hidden" name="col" value="${param.col }"/>
		<input type="hidden" name="word" value="${param.word }"/>
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		<input type="hidden" name="oldfile" value="${param.oldfile }"/>
		  <TABLE>
		    <TR>
		      <TH>패스워드</TH>
		      <TD><input type="password" name="passwd" placehorder="비밀번호 입력" required></TD>
		    </TR>
		  </TABLE>
		  
		  <DIV class='bottom'>
		    <input type='submit' value='삭제'>
		    <input type='button' value='목록' onclick="blist()">
		  </DIV>
		</FORM>
		
	</c:otherwise>
</c:choose>

	 </div>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 