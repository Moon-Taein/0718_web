<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/mytag" prefix="my" %>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Member 테이블 레코드 삽입</title>
    <link rel="stylesheet" type="text/css" href="practice.css">
  </head>
  <body>
    <form action="insert.jsp" method="post">
      <table border="1" class="container">
        <tr>
          <td>아이디</td>
          <td><input type="text" name="memberId" size="20" />
          	<my:errors fieldName="memberId" errors="${ errors }"></my:errors>
          </td>          
          <td>비밀번호</td>
          <td><input type="text" name="password" size="20" />
          	<my:errors fieldName="password" errors="${ errors }"></my:errors>
          </td>         
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="name" size="20" />
          	<my:errors fieldName="name" errors="${ errors }"></my:errors>
          </td> 
          <td>이메일</td>
          <td><input type="text" name="email" size="20" />
          	<my:errors fieldName="email" errors="${ errors }"></my:errors>
          </td>
        </tr>
        <tr>
          <td colspan="4"><input type="submit" value="삽입" />
          	<my:errors fieldName="idDuplication" errors="${ errors }"></my:errors>
          </td>
        </tr>        
      </table>
  	<%-- <c:if test="${ not empty errors }">
        <c:forEach var="entry" items="${ errors }">
        	<div>${ entry.value }</div>
    	</c:forEach>
    </c:if> --%>
    </form>
  </body>
</html>

<!-- 세션 해제해주기 -->
<%
	session.removeAttribute("errors");
%>
