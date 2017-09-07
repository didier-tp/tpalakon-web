<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste des Vols</title>
</head>
<body>
	<h1>Liste des Vols</h1>
	<br />
	<table border="1">
		<tr>
			<th>Id :</th>
			<th>Date de départ :</th>
			<th>Date d'arrivée :</th>
			<th>Heure de départ :</th>
			<th>Heure d'arrivée :</th>
			<th>Aéroport de départ :</th>
			<th>Aéroport d'arrivée :</th>
			<th>Version :</th>
		</tr>
		<c:forEach items="${liste}" var="p">
			<tr>
				<td><c:out value="${p.id}" /></td>
				<td><c:out value="${p.dateDepart}" /></td>
				<td><c:out value="${p.dateArrivee}" /></td>
				<td><c:out value="${p.heureDepart}" /></td>
				<td><c:out value="${p.heureArrivee}" /></td>
				<td><c:out value="${p.depart.nom}" /></td>
				<td><c:out value="${p.arrivee.nom}" /></td>
				<td><c:out value="${p.version}" /></td>
				<c:url var="edit" value="./edit">
					<c:param name="id">${p.id}</c:param>
				</c:url>
				<c:url var="delete" value="./delete">
					<c:param name="id">${p.id}</c:param>
				</c:url>
				<td><a href='<c:url value="${edit}"/>'>Modifier</a></td>
				<td><a href='<c:url value="${delete}"/>'>Supprimer</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value="./edit" />'>Nouveau Vol</a>
</body>
</html>