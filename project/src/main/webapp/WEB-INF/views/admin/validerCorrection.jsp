<%@include file="../include.jsp" %>

<html xmlns:form="http://www.springframework.org/tags/form">
<h2>${dresume.toString()}</h2>
<h3>Premiere note: </h3>
${demande.getNote1()}
<h3>Deuxième note: </h3>
${demande.getNote2()}
<br/><br/>
<a href="${flowExecutionUrl}&_eventId=accepter">Valider</a>
<a href="${flowExecutionUrl}&_eventId=rejeter">Demander Rapport</a>