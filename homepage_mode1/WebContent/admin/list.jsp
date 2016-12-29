<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	// NULL 체크를 안해도 되는 이유는 위에서 Utility에서 Null체크를 먼저 한번 해줬기 때문이다.
	if (col.equals("total")) {
		word = "";
	}

	//페이징 관련
	int nowPage = 1;
	int recordPerPage = 5;
	// getParameter 는 무조건 문자열로 받는다. 인트형으로 보내도.
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	//DB
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int totalRecord = dao.total(col, word);
	List<MemberDTO> list = dao.list(map);
	Iterator<MemberDTO> iter = list.iterator();

	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function read(id) {
	var url = "<%=root%>/member/read.jsp";
	url += "?id="+id;
	url += "&nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	
	location.href = url;
}
</script>
<style type="text/css">
* {
/* 	font-size: 20px; */
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">회원목록</div>
	<div class="search">
		<form name='frm' method='POST' action='./list.jsp'>
			<select name="col">
				<option value="mname" <%if (col.equals("mname"))
				out.print("selected='selected'");%>>성명</option>
				<option value="email" <%if (col.equals("email"))
				out.print("selected='selected'");%>>이메일</option>
				<option value="id" <%if (col.equals("id"))
				out.print("selected='selected'");%>>아이디</option>
				<option value="total">전체출력</option>
			</select>
			<input type="text" name="word" value='<%=word%>'> 
			<input type="submit" class="button_mini" value="검색"> 
			<input type="button" class="button_mini" value="회원가입" onclick="location.href='../member/createForm.jsp'">
		</form>
	</div>
	<%while(iter.hasNext()){
		MemberDTO dto = iter.next();
	%>
	<table>
		<tr>
			<td rowspan="5" width="30%">
			<img src='<%=root%>/member/storage/<%=dto.getFname()%>' style="width:250px">
			</td>
			<th width="20%">아이디</th>
			<td width="50%">
			<a href="javascript:read('<%=dto.getId()%>')"><%=dto.getId()%></a>
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=dto.getMname()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getTel()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dto.getAddress1()%>
				<%=Utility.checkNull(dto.getAddress2()) %></td>

		</tr>
	</table>
	<%} %>
	<div class='bottom'>
		<%=paging %>
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
