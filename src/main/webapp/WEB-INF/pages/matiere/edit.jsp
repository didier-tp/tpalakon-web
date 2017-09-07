<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><c:choose>
		<c:when test="${empty uneMatiere.code}">
Cr�ation mati�re
</c:when>
		<c:otherwise>
Edition mati�re
</c:otherwise>
	</c:choose></title>
</head>
<body>
	<form:form action="./save" method="post" modelAttribute="uneMatiere">
		<form:label path="code">Code mati�re :</form:label>
		<form:input path="code" readOnly="true" />
		<br />
		<form:label path="libelle">Libell� mati�re :</form:label>
		<form:input path="libelle" />
		<br />
		<form:hidden path="version" />
		<br />
		<input type="submit" value="Envoyer" />
		<br />
	</form:form>
</body>
</html>