<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ attribute name="errors" type="java.util.Map" required="true"%>
<%@ attribute name="fieldName" required="true" %>

<c:forEach var="entry" items="${ errors }">
	<c:if test="${ fn:startsWith(entry.key, fieldName) }">
		<span>${ entry.value }</span>
	</c:if>          	
</c:forEach>