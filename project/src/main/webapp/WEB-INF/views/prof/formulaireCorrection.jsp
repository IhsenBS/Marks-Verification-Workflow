<%@include file="../include.jsp" %>
 
<html>
	<sec:authentication var="principal" property="principal" />
	<body>
		<h2>Données supplémentaire</h2>
		<h3>${dresume.toString()}</h3>
		<form action="${flowExecutionUrl}&_eventId=formulaireRempli" method="post"> 
			<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>
			<h3>Note</h3>
			<input type="number" name="note1">
			<br/><br/>			
			<input type="submit" value="Valider" />
		
		</form>
	</body>
</html>