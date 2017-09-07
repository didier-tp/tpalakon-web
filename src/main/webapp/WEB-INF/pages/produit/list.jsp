<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="titre" /></title>
</head>
<body>
	<h1>
		<spring:message code="produit.list.h1" />
	</h1>
	<br />
	<table>
		<tr>
			<th><spring:message code="produit.nom" /></th>
			<th><spring:message code="produit.description" /></th>
			<th><spring:message code="produit.prix" /></th>
		</tr>
		<c:forEach items="${liste}" var="p" varStatus="loop">
			<tr>
				<td><c:out value="${p.nom }" /></td>
				<td><c:out value="${p.description}" /></td>
				<td><c:out value="${p.prix}" /></td>
				<c:url var="edit" value="./edit">
					<c:param name="id">${loop.index}</c:param>
				</c:url>
				<c:url var="delete" value="./delete">
					<c:param name="id">${loop.index}</c:param>
				</c:url>
				<td><a href='<c:url value="${edit}"/>'><spring:message
							code="produit.list.modifier" /></a></td>
				<td><a href='<c:url value="${delete}"/>'><spring:message
							code="produit.list.supprimer" /></a></td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value="./edit" />'><spring:message
			code="produit.list.nouveau" /></a>
</body>
</html>