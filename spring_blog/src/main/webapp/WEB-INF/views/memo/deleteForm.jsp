<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../ssi/ssi.jsp" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="stylesheet">
<script type="text/javascript">
	function mlist() {
		var url ="list";
		url+="?col=${param.col}";
		url+="&word=${param.word}"
		url+="&nowPage=${param.nowPage}"
		
		location.href=url;
	}
</script>
</head> 
	<body>
	<div class="title">삭제 확인</div>
	<c:choose>
	 <c:when test="${flag == true }">
	<div class="content">
		답변글이 있으므로 삭제하실 수 없습니다
		out.print("답변글이 있으므로 삭제하실 수 없습니다.");
	
	<br>
	<button type="button" onclick="history.back()">뒤로가기</button>
	</div>
	</c:when>
	<c:otherwise>
		<div class="content">
			<form method="post" action="delete">
				<input type="hidden" name="memono" value="${param.memono }"><br>
				<input type="hidden" name="col" value="${param.col }"><br>
				<input type="hidden" name="word" value="${param.word }"><br>
				<input type="hidden" name="nowPage" value="${param.nowPage }">
					<h2>삭제를 하면 복구가 될 수 없어요!<br>
					삭제 하려면 삭제 버튼을 클릭하세요!<br>
					취소는 목록 버튼을 누르세요!<br><br></h2>
					<button>삭제처리</button>
					<button type="button" onclick="mlist()">목록</button>
			</form>
		</div>
		</c:otherwise>
	</c:choose>
	</body> 
</html> 
