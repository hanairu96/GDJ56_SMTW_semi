<%@ page import="com.smtw.country.model.vo.CountryPage" %>
<%
	CountryPage coarea=(CountryPage)request.getAttribute("data");
%>
<pre>
	<%=coarea.getNInfo() %>
</pre>