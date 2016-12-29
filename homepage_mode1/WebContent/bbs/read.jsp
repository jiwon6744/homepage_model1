<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	bdao.upViewcnt(bbsno);
	BbsDTO dto = bdao.read(bbsno);

	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
	function bupdate() {
		var url = "updateForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";

		location.href = url;
	}
	function bdelete() {
		var url = "deleteForm.jsp"
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		url += "&oldfile=<%=dto.getFilename()%>";

		location.href = url;
	}
	function breply() {
		var url = "replyForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";

		location.href = url;
	}
	function down(filename) {
		var url = "<%=root%>/download";
		url += "?dir=/bbs/storage";
		url += "&filename="+filename;
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

	<div class="title">게시판 조회</div>

	<table class="table-30">
		<tr>
			<th class="text-c">제목</th>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<th class="text-c">내용</th>
			<td><%=dto.getContent()%></td>
		</tr>
		<tr>
			<th class="text-c">성명</th>
			<td><%=dto.getWname()%></td>
		</tr>
		<tr>
			<th class="text-c">조회수</th>
			<td><%=dto.getViewcnt()%></td>
		</tr>
		<tr>
			<th class="text-c">등록</th>
			<td><%=dto.getWdate().substring(0, 10)%></td>
		</tr>
		<tr>
			<th class="text-c">파일</th>
			<td>
				<%
					if (dto.getFilename() == null) {
						out.print("파일없음");
					} else {
				%>
				<%=dto.getFilename()%>(<%=dto.getFilesize() / 1024%>KB)
				<a href="javascript:down('<%=dto.getFilename() %>')">
				<img src="../menu/images/down.png" >
				</a>
				<%
					}
				%>
			</td>
		</tr>
	</table>

	<div class='bottom'>
		<input type='button' value='등록' class="button" onclick="location.href='./createForm.jsp'"> 
		<input type='button' value='목록' class="button" onclick="blist()"> 
		<input type='button' value='수정' class="button" onclick="bupdate()"> 
		<input type='button' value='삭제' class="button" onclick="bdelete()"> 
		<input type='button' value='답변' class="button" onclick="breply()">
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
