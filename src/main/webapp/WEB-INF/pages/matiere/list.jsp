<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste des Matières</title>
</head>
<body>
	<h1>Liste des Matières</h1>
	<br />
	<table border="1">
		<tr>
			<th>Code matière :</th>
			<th>Libellé matière :</th>
			<th>Version :</th>
		</tr>
		<c:forEach items="${liste}" var="p" varStatus="loop">
			<tr>
				<td><c:out value="${p.code}" /></td>
				<td><c:out value="${p.libelle}" /></td>
				<td><c:out value="${p.version}" /></td>
				<c:url var="edit" value="./edit">
					<c:param name="code">${p.code}</c:param>
				</c:url>
				<c:url var="delete" value="./delete">
					<c:param name="code">${p.code}</c:param>
				</c:url>
				<td><a href='<c:url value="${edit}"/>'>Modifier</a></td>
				<td><a href='<c:url value="${delete}"/>'>Supprimer</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value="./edit" />'>Nouvelle matière</a>
</body>
</html>