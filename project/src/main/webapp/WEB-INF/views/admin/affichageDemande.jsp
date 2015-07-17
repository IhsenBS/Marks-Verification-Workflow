<%@include file="../include.jsp" %>

<html xmlns:form="http://www.springframework.org/tags/form">
<h2>${dresume.toString()}</h2>
<h3>Nombre de demande effectuées par l'étudiant : ${etudiant.getNbreDemande() }</h3>
<h3>Raison : </h3>
${demande.raison}
<br/><br/>
<a href="${flowExecutionUrl}&_eventId=accepter">Accepter</a>
<a href="${flowExecutionUrl}&_eventId=rejeter">Rejeter</a>