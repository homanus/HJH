<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <link href="../css/style.css" rel="stylesheet"> -->

<script type="text/javascript">
function incheck(){
	var f = document.frm;
	
	if(f.title.value==""){
		alert("제목을 입력하세요.")
		f.title.focus();
		return;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요.")
		f.content.focus();
		return;
	}
	f.submit();
}

</script>
</head>

	<body>
		<div class="container">
		<h2><span class="glyphicon glyphicon-pencil"></span></h2>
		
		
		
		<form action="update"
			  name="frm"
			  method="post">
			<input type="hidden" name="memono" value="${dto.memono }">
			<input type="hidden" name="col" value="${param.col }">
			<input type="hidden" name="word" value="${param.word }">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
				<table class="table table-bordered">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" size="24" value='${dto.title }'></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="35" name="content">${dto.content }</textarea>
						</td>
					</tr>
				</table>
		
			<div class="bottom">
				<button type="button" onclick="incheck()">
				 	전송
				</button>
		</div>
		</form>
		</div>
	</body>
</html>