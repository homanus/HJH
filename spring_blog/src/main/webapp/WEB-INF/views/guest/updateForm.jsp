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
.content{
  font-size: 24px;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
  margin: 0 auto; /* 가운데 정렬 */
}
 
/* 하단 메뉴 */
.bottom{
  margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
		<div class="container">
		<h2><span class="glyphicon glyphicon-pencil"></span></h2>
<c:choose>
<c:when test="${flag == true }">
<FORM 	name='frm'
		method='POST'
		action='update'
		enctype="multipart/form-data">
		<input type="hidden" name="gno" value="${param.gno }">
		<input type="hidden" name="oldfile" value="${oldfile }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
  <TABLE class="table table-bordered">
  	<tr>
  		<th>예전 사진</th>
  		<td><img src="${root }/storage_guest/${oldfile }">
    		  원본파일명:${oldfile }
      </td>
  	
  	</tr>
    <TR>
      <tr>
    	<th>변경할 사진</th>
    	<td><input type="file" name="fnameMF" accept=".jpg,.png,.gif">
    </tr>
    <tr>
    	<th>작성자</th>
    	<td><input type="text" name="gname" value="${dto.gname }"></td>
    </tr>
    <tr>
    	<th>내용</th>
    	<td><textarea rows="5" cols="30" name="content">${dto.content }</textarea></td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='방명록 수정'>
    <input type="button" value="취소" onclick="history.back()">
  </DIV>
</FORM>
</c:when>
<c:otherwise>
<div class="content">
 		본인이 작성한 글이 아닙니다.
 		<br><input type='button' value='확인' onclick='history.back()'>
</div>
</c:otherwise>
</c:choose>
 </div>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 