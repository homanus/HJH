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
.bottom{
  margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;
}

</style>
<!-- <link href="../css/style.css" rel="stylesheet"> -->

<script type="text/javascript">
	function mcreate() {
		var url = "create";
		location.href=url;
	}
	function mlist() {
	 	var url ="list";
	 	url+="?col=${param.col}"
	 	url+="&word=${param.word}"
	 	url+="&nowPage=${param.nowPage}"
	 	location.href=url;
	}
	function mupdate(memono){
		var url="update";
		url+="?memono="+memono;
	 	url+="&col=${param.col}"
	 	url+="&word=${param.word}"
	 	url+="&nowPage=${param.nowPage}"
		location.href=url;
	}
	function mdelete(memono) {
		var url="delete";
		url+="?memono="+memono;
	 	url+="&col=${param.col}"
	 	url+="&word=${param.word}"
	 	url+="&nowPage=${param.nowPage}"
		location.href=url;
	}
	function mreply(memono){
		var url="reply";
		url+="?memono="+memono;
	 	url+="&col=${param.col}"
	 	url+="&word=${param.word}"
	 	url+="&nowPage=${param.nowPage}"
		location.href=url;
	}
	
	 
</script> 
</head> 
	<body> 
	
		<div class="container">
		<h2><span class="glyphicon glyphicon-th-list"></span>비밀목록</h2>
		
		<table class="table table-hover">
			<tr>
				<th>제목</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.viewcnt }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${dto.wdate }</td>
			</tr>
		</table>
		
		<div class="bottom">
			<button type="button" onclick="mreply('${dto.memono}')">답변</button>
			<button type="button" onclick="mcreate()">등록</button>
			<button type="button" onclick="mupdate('${dto.memono}')">수정</button>
			<button type="button" onclick="mdelete('${dto.memono}')">삭제</button>
			<button type="button" onclick="mlist()">목록</button>
		</div>
		</div>
	</body> 
</html> 