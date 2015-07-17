<%@include file="include.jsp" %>
<div id="wrap">

<div id="header">
<h1></h1>
</div>

<div id="top"> </div>
<div id="contentt">
<div id="headermenu"> 
<div class="headerm">
<ul>
<li><a href="">Webflow double correction</a></li>
</ul>
</div>
</div>

<div class="left">
<h2>Menu </h2>
<ul>
	<sec:authorize access="isAnonymous()">
		<li><a href="spring_security_login">Login</a></li>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<li><a href="j_spring_security_logout">Logout</a></li>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ETUDIANT')">
 		<li><a href="demande">Saisir demande</a></li>
 	</sec:authorize>
 	
 	<sec:authorize access="hasRole('ROLE_ADMIN')">
 		<li><a href="affichageDemande">Liste demande</a></li>
 		<li><a href="affichageCorrection">Liste correction</a></li>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_PROF')">
		<li><a href="listeDemandeProf">Liste devoirs à corriger</a></li>
  		<li><a href="listeRapportProf">Liste rapport à rediger</a></li>
 	</sec:authorize>
 	
 	<sec:authorize access="hasRole('ROLE_CONSEIL')">
 		<li><a href="listeRapportConseil">Liste des rapport à valider</a></li>
 	</sec:authorize>
</ul>
</div>

<div class="middle">


