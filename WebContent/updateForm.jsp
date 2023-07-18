<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>이름 변경폼</title>
  </head>
  <body>
    <form action="update.jsp" method="post">
      <table border="1">
        <tr>
          <td>아이디</td>
          <td><input type="text" name="memberId" size="10" /></td>
          <td>이름</td>
          <td><input type="text" name="name" size="10" /></td>
          	<c:if test="${ not empty errors }">
          		<c:forEach var="entry" items="${ errors }">
          			<span>${ entry.value }</span>
          		</c:forEach>
          	</c:if>
        </tr>
        <tr>
          <td colspan="4"><input type="submit" value="변경" /></td>
        </tr>
      </table>
    </form>
  </body>
</html>

<!-- 세션 속성 일회성으로 사용하고 지워주기 -->
<%
	session.removeAttribute("errors");
%>
