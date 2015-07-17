<%@include file="../include.jsp" %>
 
<html xmlns:form="http://www.springframework.org/tags/form">
<h2>Liste de rapport à rediger</h2>
<c:forEach items="${listeDemande.getListe()}" var="demande">
			<p>${demande.toString()}<a href="redigerRapport?id=${demande.getId()}">   -></a></p>
</c:forEach>