<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="team.TeamDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	// int teamno = Integer.parseInt(request.getParameter("teamno"));
	// String phone = request.getParameter("phone");
	// String zipcode = request.getParameter("zipcode");
	// String address1 = request.getParameter("address1");
	// String address2 = request.getParameter("address2");
	// String[] skill = request.getParameterValues("skill");
	// String hobby = request.getParameter("hobby");
	// 	String filename = dto.getFilename();
	// 	if (filename == null || filename.length() == 0)
	// 		dto.setFilename("member.jpg");

	//	<jsp:setProperty property="*" name="dto" /> 이걸로 해결함.

	boolean flag = tdao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function tlist() {
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
	<div class="title">팀 수정 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.println("팀정보 수정 성공");
			} else {
				out.println("팀정보 수정 실패");
			}
		%>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="목록" onclick="tlist()">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
