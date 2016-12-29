<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	boolean flag = dao.update(dto);
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function mlist() {
		var url = "<%=root%>/admin/list.jsp";
		url += "?col=<%=request.getParameter("col")%>";	
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
}
	function read() {
		var url = "read.jsp";
		url += "?id=<%=dto.getId()%>";
		location.href = url;
	}
</script>
<style type="text/css">
* {
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title"></div>

	<div class="content">
		<%
			if (flag) {
				out.print("정보 수정 성공");
			} else {
				out.print("정보 수정 실패");
			}
		%>
	</div>
	<div class='bottom'>
		<%
			if (id != null && grade.equals("A")) {
		%>
		<input type='button' value='회원목록' class="button" onclick="mlist()">
		<%
			} else {
		%>
		<input type='button' value='정보확인' class="button" onclick="read()"> 
		<input type='button' value='다시시도' class="button" onclick="history.back()">
		<%
			}
		%>
	</div>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
