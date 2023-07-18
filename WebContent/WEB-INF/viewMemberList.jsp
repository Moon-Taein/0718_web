<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="practice.css" />
</head>
<body>

<h2 align="center">Member 테이블의 내용</h2>
<table width="100%" border="1">

<thead>
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>이메일</th>
	</tr>
</thead>

<tbody>
	<c:forEach var="member" items="${ list }">
		<tr>
			<td align="center">${ member.name }</td>
			<td align="center">${ member.memberId }</td>
			<td align="center">${ member.email }</td>
		</tr>
	</c:forEach>
</tbody>

</table>
</body>
</html>