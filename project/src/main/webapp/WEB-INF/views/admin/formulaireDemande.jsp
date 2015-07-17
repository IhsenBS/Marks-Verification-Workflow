<%@include file="../include.jsp" %>
 
<html>
	<sec:authentication var="principal" property="principal" />
	<body>
		<h2>Données supplémentaire</h2>
		<h3>${dresume.toString()}</h3>
		<form action="${flowExecutionUrl}&_eventId=formulaireRempli" method="post"> 
			<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>
			<h3>Professeur de la premiere correction :</h3>
			<select name="prof1" size="5">
				<c:forEach items="${listeProf.getListe()}" var="prof">
					<option value="${prof.getCIN()}">${prof.getNom()} ${prof.getPrenom()}</option>
				</c:forEach>
			</select>
			<h3>Professeur de la deuxième correction :</h3>
			<select name="prof2" size="5">
				<c:forEach items="${listeProf.getListe()}" var="prof">
					<option value="${prof.getCIN()}">${prof.getNom()} ${prof.getPrenom()} (${prof.getNbreDCorrection()})</option>
				</c:forEach>
			</select>
			<br/>
			<h3>Note</h3>
			<input type="number" name="note1">
			<br/><br/>			
			<input type="submit" value="Valider" />
		
		</form>
	</body>
</html>