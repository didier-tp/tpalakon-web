<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste des Personnes</title>
</head>
<body>
	<h1>Liste des Personnes</h1>
	<br />
	<table border="1">
		<tr>
			<th>Type :</th>
			<th>Civilité :</th>
			<th>Prénom :</th>
			<th>Nom :</th>
			<th>Date de naissance :</th>
			<th>Rue :</th>
			<th>Code postal :</th>
			<th>Ville :</th>
			<th>Age :</th>
			<th>Expérience :</th>
		</tr>
		<c:forEach items="${list}" var="p">
			<tr>
				<c:choose>
					<c:when test="${p.getClass().name == 'formation.jpa.model.Eleve' }">
						<td><c:out value="E" /></td>
					</c:when>
					<c:otherwise>
						<td><c:out value="F" /></td>
					</c:otherwise>
				</c:choose>
				<td><c:out value="${p.civilite.titre}" /></td>
				<td><c:out value="${p.prenom}" /></td>
				<td><c:out value="${p.nom}" /></td>
				<td><fmt:formatDate value="${p.dtNaiss}" pattern="dd/MM/yyyy" /></td>
				<td><c:out value="${p.adresse.rue}" /></td>
				<td><c:out value="${p.adresse.codePostal}" /></td>
				<td><c:out value="${p.adresse.ville}" /></td>
				<c:choose>
					<c:when test="${p.getClass().name == 'formation.jpa.model.Eleve' }">
						<td><c:out value="${p.age}" /></td>
						<td></td>
					</c:when>
					<c:otherwise>
						<td></td>
						<td><c:out value="${p.experience}" /></td>
					</c:otherwise>
				</c:choose>
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
	<a href='<c:url value="./createEleve" />'>Nouvel élève</a>
	<br />
	<a href='<c:url value="./createFormateur" />'>Nouveau formateur</a>
	<br />
</body>
</html>