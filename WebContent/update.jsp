<%@page import="java.util.Map"%>
<%@page import="member.MemberValidator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("memberId");
    String name = request.getParameter("name");
    
	MemberValidator validator = new MemberValidator();
	Map<String, String> errors = validator.validateName(name);
	session.setAttribute("errors", errors);
	
	if(errors.size() > 0){
		
		response.sendRedirect("updateForm.jsp");	
	} else {	
    
	int updateCount = 0;
    
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = null;
    PreparedStatement stmt = null;

    try{

        String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf8";
        String dbUser = "root";
        String dbPass = "root";

        String query = "update member set name = ? where memberid = ?";

        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stmt = conn.prepareStatement(query);
        stmt.setString(1, name);
        stmt.setString(2, memberId);
        updateCount = stmt.executeUpdate();
    } finally {
        if(stmt != null){
            try {
                stmt.close();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
        if(conn != null){
            try {
                conn.close();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
    }
%>

<html>
<head><title>이름 변경</title></head>
<body>
    <% if(updateCount > 0) { %>
    <%= memberId %>의 이름을 <%= name%>(으)로 변경
    <% } else { %>
    <%= memberId %> 아이디가 존재하지 않음
    <% }} %>
</body>
</html>