<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="address.AddressDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	boolean flag = adao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">회원가입 등록 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.println("회원정보 등록 성공");
			} else {
				out.println("회원정보 등록 실패");
			}
		%>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="계속 등록" onclick="location.href='./createForm.jsp'"> 
		<input type="button" class="button" value="목록" onclick="location.href='./list.jsp'">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
