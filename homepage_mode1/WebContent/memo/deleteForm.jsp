<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function mlist() {
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
<div class="title">메모 삭제</div>
	<form method="post" action="deleteProc.jsp">
		<input type="hidden" name="memono" value="<%=memono%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
		<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
		<div class="content">
			삭제를 하면 복구 될 수 없습니다.<br>
			<br> 삭제하시려면 삭제버튼을 클릭하세요.<br>
			<br> 취소는 '목록' 버튼을 누르세요.<br>
		</div>
		<div class="bottom">
			<input type="submit" class="button" value="삭제처리"> 
			<input type="button" class="button" value="목록" onclick="mlist()">
		</div>
	</form>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
