<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<div align="center">
<h2>로그인 확인</h2>
		아이디/패스워드를 잘못 입력하셨거나<br>
	 	아이디가 존재하지 않습니다. 회원가입 하셔야 합니다.
</div>
<div align="center">
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='회원가입' onclick="location.href='./agreement'">
</div>
</body>
</html>