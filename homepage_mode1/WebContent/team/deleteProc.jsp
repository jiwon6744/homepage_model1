<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int teamno = Integer.parseInt(request.getParameter("teamno"));
	String oldfile = request.getParameter("oldfile");
	boolean flag = tdao.delete(teamno);
	if(flag){
		String upDir = application.getRealPath("/team/storage");
		UploadSave.deleteFile(upDir, oldfile);
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function tlist() {
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">팀 삭제 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.print("팀원 삭제 성공");
			} else {
				out.print("팀원 삭제 실패");
			}
		%>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="목록" onclick="tlist()">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
