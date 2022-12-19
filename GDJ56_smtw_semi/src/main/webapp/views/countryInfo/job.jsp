<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.country.model.vo.CountryPage" %>
<%
	CountryPage coarea=(CountryPage)request.getAttribute("data");
%>

	<div>
		<%=coarea.getNJob() %>
	</div>

