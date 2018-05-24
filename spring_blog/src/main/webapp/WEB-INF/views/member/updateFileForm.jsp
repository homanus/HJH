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
</style> 
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">사진수정</DIV>
 
<FORM 	name='frm'
		method='POST'
		action='updateFile'
		enctype="multipart/form-data">
		
		<input type="hidden" name="id" value="${param.id }">
		<input type="hidden" name="oldfile" value="${param.oldfile }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="${root }/storage_member/${param.oldfile }">
      원본파일명:${param.oldfile }
      </TD>
    </TR>
    <tr>
    	<th>변경파일</th>
    	<td>
    	<input type="file" name="filenameMF" accept=".jpg,.gif,.png" required="required">
    	</td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 