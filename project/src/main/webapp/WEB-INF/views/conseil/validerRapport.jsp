<%@include file="../include.jsp" %>

<html xmlns:form="http://www.springframework.org/tags/form">
<h2>${dresume.toString()}</h2>
<h3>Rapport: </h3>
${demande.getRapport()}
<br/><br/>
<a href="${flowExecutionUrl}&_eventId=accepter">Valider</a>
<a href="${flowExecutionUrl}&_eventId=rejeter">Rejeter</a>