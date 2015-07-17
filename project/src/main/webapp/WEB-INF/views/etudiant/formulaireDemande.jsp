<%@include file="../include.jsp" %>
 
<html>
	<sec:authentication var="principal" property="principal" />
	<body>
		<form action="${flowExecutionUrl}&_eventId=formulaireDemandeRempli" method="post"> 
			<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>
			<select name="matiere" size="5">
				<c:forEach items="${choixMatiere.getListe()}" var="matiere">
					<option value="${matiere.getId()}">${matiere.getIntitulé()}</option>
				</c:forEach>
			</select>
			<br/>
			<input type="radio" name="devoir" value="1">Devoir Surveillé
			<br/>
			<input type="radio" name="devoir" value="2">Examen
			<br/>
			<textarea name="raison" cols="100" rows="8"></textarea>
			<br/>
			<br/>			
			<input type="submit" value="Demande" />
		
		</form>
	</body>
</html>