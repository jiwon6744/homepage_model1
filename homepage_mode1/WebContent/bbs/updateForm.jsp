<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.read(bbsno);
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
<script type="text/javascript">
	function incheck(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("패스워드를 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">게시판 수정</div>

	<form name='frm' 
		  method='POST' 
		  action='./updateProc.jsp' 
		  enctype="multipart/form-data"
		  onsubmit="return incheck(this)">
		<input name="bbsno" value="<%=bbsno%>" type="hidden">
		<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
		<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
		<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
		<input name="oldfile" value="<%=dto.getFilename()%>" type="hidden">
		<table>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="wname" value="<%=dto.getWname()%>">
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
					<textarea rows="10" cols="45" name="content"><%=dto.getContent()%></textarea>
					<!-- textarea 를 사용할때는 value값을 넣을 수 없다. -->
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
					<input type="file" name="filename">(<%=Utility.checkNull(dto.getFilename()) %>)
				</td>
			</tr>
		</table>
		<div class='bottom'>
			<input type='submit' value='수정' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
