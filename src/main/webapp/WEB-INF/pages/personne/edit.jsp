<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edition</title>
</head>
<body>
	<table>
		<c:choose>
			<c:when
				test="${personne.getClass().name == 'formation.jpa.model.Eleve' }">
				<c:url var="url" value="./saveEleve" />
			</c:when>
			<c:otherwise>
				<c:url var="url" value="./saveFormateur" />
			</c:otherwise>
		</c:choose>
		<form:form action="${url}" method="post" modelAttribute="personne">
			<form:hidden path="version" />
			<form:hidden path="id" />
			<tr>
				<td><form:label path="civilite">Civilité :</form:label></td>
				<td><form:select path="civilite" items="${civilites}"
						itemLabel="titre" /></td>
				<td><form:errors path="civilite"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="prenom">Prénom :</form:label></td>
				<td><form:input path="prenom" /></td>
				<td><form:errors path="prenom"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="nom">Nom :</form:label></td>
				<td><form:input path="nom" /></td>
				<td><form:errors path="nom"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="dtNaiss">Date Naissance :</form:label></td>
				<td><form:input path="dtNaiss" /></td>
				<td><form:errors path="dtNaiss"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="adresse.rue">Rue :</form:label></td>
				<td><form:input path="adresse.rue" /></td>
				<td><form:errors path="adresse.rue"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="adresse.codePostal">Code Postal :</form:label></td>
				<td><form:input path="adresse.codePostal" /></td>
				<td><form:errors path="adresse.codePostal"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="adresse.ville">Ville :</form:label></td>
				<td><form:input path="adresse.ville" /></td>
				<td><form:errors path="adresse.ville"></form:errors></td>
			</tr>
			<c:choose>
				<c:when
					test="${personne.getClass().name == 'formation.jpa.model.Eleve' }">
					<tr>
						<td><form:label path="age">Age :</form:label></td>
						<td><form:input path="age" /></td>
						<td><form:errors path="age"></form:errors></td>
					</tr>
					<tr>
						<td><form:label path="formateur.id">Formateur :</form:label></td>
						<td><form:select path="formateur.id" items="${formateurs}"
								itemValue="id" itemLabel="nom" /></td>
						<td><form:errors path="formateur.id"></form:errors></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td><form:label path="experience">Expérience :</form:label></td>
						<td><form:input path="experience" /></td>
						<td><form:errors path="experience"></form:errors></td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="3"><input type="submit" value="Envoyer" /></td>
			</tr>
		</form:form>
	</table>
</body>
</html>