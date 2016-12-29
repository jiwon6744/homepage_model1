<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	boolean flag = adao.delete(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function alist() {
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
	<div class="title">회원 삭제 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.println("회원정보 삭제 성공");
			} else {
				out.println("회원정보 삭제 실패");
			}
		%>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="목록" onclick="alist()">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
