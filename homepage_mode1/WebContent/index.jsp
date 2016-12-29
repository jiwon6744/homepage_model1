<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
	String str = null;
	if(id==null){
		str = "로그인을 해주세요.";
	}else if(id!=null && grade.equals("A")){
		str = "관리자 페이지";
	}
	else{
		str = "안녕하세요. " + id + " 님!";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title"><%=str %> </div>
	<div class="content">
	<h1></h1>
		<%
			if (id == null) {
		%>
		<input type="button" value="로그인" onclick="location.href='member/loginForm.jsp'" class="button">
		<%
			} else {
		%>
		<input type="button" value="로그아웃" onclick="location.href='member/logout.jsp'" class="button">
		<%
			}
		%>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
