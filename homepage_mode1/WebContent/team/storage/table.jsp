<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

table {
	margin: 0 auto;
	border: 1px solid black;
	cellpadding: 20px;
	cellspacing: 5px;
}

tr {
	background-color: #aaffaa;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th rowspan='5'>6%</th>
		</tr>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th rowspan='4'>5%</th>
		</tr>
		<tr>
			<th></th>
			<th></th>
			<th rowspan='3'>3%</th>
			<th></th>

		</tr>
		<tr>
			<th></th>
			<th rowspan='2'>2%</th>
			<th rowspan='2'>4%</th>
		</tr>
		<tr>
			<th rowspan='1'>1%</th>
		</tr>
	</table>
</body>
</html>
