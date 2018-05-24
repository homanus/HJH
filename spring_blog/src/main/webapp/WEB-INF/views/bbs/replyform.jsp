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
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function incheck(f){
	if(f.wname.value==""){
		alert("이름을 입력해주세요.")
		f.wname.focus();
		
		return false;
		}
	if(f.title.value==""){
		alert("제목을 입력해주세요.")
		f.title.focus();
		
		return false;
		}
	if(f.content.value==""){
		alert("내용을 입력해주세요.")
		f.content.focus();
		
		return false;
		}

	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요.")
		f.passwd.focus();
		
		return false;
		}
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
 		<div class="container">
		<h2><span class="glyphicon glyphicon-pencil"></span></h2>
		
<FORM name='frm' 
	  method='POST'
	  action='./reply'
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
	  <input type='hidden' name='nowPage' value='${param.nowPage }'>
	  <input type='hidden' name='col' value='${param.col }'>
	  <input type='hidden' name='word' value='${param.word }'>
	  <input type='hidden' name='bbsno' value='${dto.bbsno }'>
	  <input type='hidden' name='grpno' value='${dto.grpno }'>
	  <input type='hidden' name='indent' value='${dto.indent }'>
	  <input type='hidden' name='ansnum' value='${dto.ansnum }'>

  <TABLE class="table table-bordered">
    <TR>
      <TH>작성자</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <tr>
    	<th>제목</th>
    	<td><input type="text" name="title" value="re:${dto.title }"></td>
    </tr>
    <tr>
    	<th>내용</th>
    	<td><textarea rows="5" cols="30" name="content"></textarea></td>
    </tr>
    <tr>
    	<th>비밀번호</th>
    	<td><input type="password" name="passwd"></td>
    </tr>
    <tr>
    	<th>파일등록</th>
    	<td><input type="file" name="filenameMF"></td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='답변'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</div>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 