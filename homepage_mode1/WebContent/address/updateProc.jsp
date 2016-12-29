<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="address.AddressDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	boolean flag = adao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">회원정보 수정 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.println("회원정보 수정 성공");
			} else {
				out.println("회원정보 수정실패");
			}
		%>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="목록" onclick="location.href='./list.jsp'">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
