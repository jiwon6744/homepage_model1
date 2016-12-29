<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<%
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile");

	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);
	boolean pflag = bdao.passCheck(map);
	boolean flag = false;
	if (pflag) {
		flag = bdao.delete(bbsno);
	}
	if (flag){
		String upDir = application.getRealPath("/bbs/storage"); // 이게 뭐하는 코드?
		UploadSave.deleteFile(upDir, oldfile);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
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

	<div class="title">게시판 삭제 결과</div>
	<div class="content">
		<%
			if (pflag == false) {
				out.print("패스워드가 일치하지 않습니다.");
			} else if (flag) {
				out.print("글을 삭제했습니다.");
			} else {
				out.print("글을 삭제하지 못했습니다(ERROR)");
			}
		%>
	</div>
	<%
		if (pflag == false) {
	%>
	<div class='bottom'>
		<input type='button' value='다시 시도' onclick="history.back()" class="button"> 
		<input type='button' value='목록' onclick="blist()" class="button">
	</div>
	<%
		} else {
	%>
	<div class='bottom'>
		<input type='button' value='다시 등록' onclick="location.href='createForm.jsp'" class="button"> 
		<input type='button' value='목록' onclick="blist()" class="button">
	</div>
	<%
		}
	%>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
