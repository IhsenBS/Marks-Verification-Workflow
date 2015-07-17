<%@include file="../include.jsp" %>
 
<html xmlns:form="http://www.springframework.org/tags/form">
<h2>Demandes à traiter</h2>
<c:forEach items="${listeDemande.getListe()}" var="demande">
			<p>${demande.toString()}<a href="traiterDemande?id=${demande.getId()}">   -></a></p>
</c:forEach>