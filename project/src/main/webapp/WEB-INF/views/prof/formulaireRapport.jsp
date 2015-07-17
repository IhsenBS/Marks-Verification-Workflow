<%@include file="../include.jsp" %>
 
<html>
	<sec:authentication var="principal" property="principal" />
	<body>
		<h2>Rédiger le rapport</h2>
		<h3>${dresume.toString()}</h3>
		<form action="${flowExecutionUrl}&_eventId=formulaireRempli" method="post"> 
			<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>
			<h3>Rapport</h3>
			<textarea name="rapport" cols="100" rows="8"></textarea>
			<br/><br/>			
			<input type="submit" value="Envoyer" />
		
		</form>
	</body>
</html>