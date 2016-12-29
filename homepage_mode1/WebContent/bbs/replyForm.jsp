<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.readReply(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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

	<div class="title">게시판 답변</div>

	<form name='frm' 
		  method='POST' 
		  enctype="multipart/form-data" 
		  action='./replyProc.jsp'>
		  
	<!-- 답변을 등록하기 위해서 -->
	<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
	<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
	<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
	<!-- 페이지와 검색 유지를 위해서 -->
	<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
	<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
	<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
	<!-- 부모글 삭제를 막기 위해서 -->
	<input name="bbsno" value="<%=bbsno%>" type="hidden">
		<table>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="wname">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="<%=dto.getTitle()%>">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="45" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td>
					<input type="file" name="filename">
				</td>
			</tr>
		</table>
		<div class='bottom'>
			<input type='submit' value='등록' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
