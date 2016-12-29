<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	// request.setCharacterEncoding("utf-8");
	// int memono = Integer.parseInt(request.getParameter("memono"));
	// sql.append(" DELETE FROM memo ");
	// sql.append(" WHERE memono = ? ");
	// pstmt = con.prepareStatement(sql.toString());
	// pstmt.setInt(1, memono);
	// int cnt = pstmt.executeUpdate();
	int memono = Integer.parseInt(request.getParameter("memono"));
	boolean flag = mdao.delete(memono);
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
	<div class="title">메모 삭제 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.print("메모 삭제 성공");
			} else {
				out.print("메모 삭제 실패");
			}
		%>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="목록" onclick="mlist()">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
