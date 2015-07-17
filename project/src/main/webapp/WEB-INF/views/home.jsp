<%@include file="include.jsp" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" media="screen" />
</head>
<body>
<%@include file="menu.jsp" %>

<h2><a href="#">Bienvenue!</a></h2>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.prenom" />
	<sec:authentication property="principal.nom" />
	<sec:authentication property="principal.CIN" />
</sec:authorize>


<%@include file="footer.jsp" %>
</body>
</html>
