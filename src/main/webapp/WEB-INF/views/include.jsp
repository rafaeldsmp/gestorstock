<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- URLs de recursos -->
<c:url value="/" var="url"/>
<c:url value="/resources/css/" var="urlCss"/>
<c:url value="/resources/js/" var="urlJs"/>
<c:url value="/resources/images/" var="urlImg"/>

<% out.clear(); %>

<!-- ==================== HEAD ==================== -->
<head>
    <meta charset="UTF-8">
    <title>${pageTitle != null ? pageTitle : "Meu Projeto"}</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery e Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS custom -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa; /* Plano de fundo padrão */
        }
        .nav-link img {
            margin-right: 5px;
        }
        .container {
            margin-top: 80px; /* espaço para navbar fixa */
        }
    </style>
</head>

<!-- ==================== NAVBAR FIXA ==================== -->
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">
<img src="${urlImg}logoGestorStock.png" height="40" class="d-inline-block align-top" alt="Logo GestorStock">
    GestorStock
  </a>
</nav>