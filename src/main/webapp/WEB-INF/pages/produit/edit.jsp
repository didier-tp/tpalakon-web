<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	<form:form action="./save" method="GET" modelAttribute="unProduit">
		<input type="hidden" name="index" value="${index}" />
		<form:label path="nom"><spring:message code="produit.nom" /> :</form:label>
		<form:input path="nom" />
		<br />
		<form:label path="description"><spring:message code="produit.description" /> :</form:label>
		<form:textarea path="description" />
		<br />
		<form:label path="prix"><spring:message code="produit.prix" /> :</form:label>
		<form:input path="prix" />
		<br />
		<input type="submit" value="<spring:message code="produit.edit.envoyer" />" />
		<br />
		<form:errors path="prix"><spring:message code="produit.edit.errprix" /></form:errors>
	</form:form>
</body>
</html>