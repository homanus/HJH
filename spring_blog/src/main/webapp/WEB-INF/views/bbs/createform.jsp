<%@ page contentType="text/html; charset=UTF-8" %> 
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

	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요.")
		f.passwd.focus();
		
		return false;
		}
  if (CKEDITOR.instances['content'].getData() == '') {
      window.alert('내용을 입력해 주세요.');
      CKEDITOR.instances['content'].focus();
      return false;
    }
}

</script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
</head> 
<body>
 		<div class="container">
		<h2><span class="glyphicon glyphicon-pencil"></span></h2>
 
<FORM name='frm' 
	  method='POST'
	  action='./create'
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">

  <TABLE class="table table-bordered">
    <TR>
      <TH>이름</TH>
      <TD><input type="text" name="wname" size="60"></TD>
    </TR>
    <tr>
    	<th>제목</th>
    	<td><input type="text" name="title" size="60"></td>
    </tr>
    <tr>
    	<th>내용</th>
    	<td><textarea rows="5" cols="60" name="content"></textarea></td>
    </tr>
    <tr>
    	<th>비밀번호</th>
    	<td><input type="password" name="passwd"></td>
    </tr>
    <tr>
    	<th>파일등록</th>
    	<td><input type='file' name='filenameMF'></td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </div>
 
</body>
</html> 