<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	AddressDTO dto = adao.read(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function pre(no) {
		var url = "read.jsp";
		url += "?no=" + (parseInt(no) - 1);
		location.href = url;
	}
	function next(no) {
		var url = "read.jsp";
		url += "?no=" + (parseInt(no) + 1);
		location.href = url;
	}
	function acreateForm() {
		var url = "createForm.jsp"
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function alist(){
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
	<div class="title">
		주소 조회
	</div>
	<table>
		<tr>
			<th>이름</th>
			<td><%=dto.getName()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getPhone()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dto.getAddress1()%><br>
				<%=dto.getAddress2()%><br> 우(<%=dto.getZipcode()%>)
			</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td><%=dto.getWdate()%></td>
		</tr>
	</table>
	<div class="bottom">
		<a href="javascript:pre('<%=dto.getNo()%>')" class="button">이전</a> 
		<input type="button" class="button" value="글쓰기" onclick="acreateForm()"> 
		<input type="button" class="button" value="목록" onclick="alist()"> 
		<a href="javascript:next('<%=dto.getNo()%>')" class="button">다음</a>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
