<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Gestor de Estoque</title>
    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- CSS externo -->
    <link rel="stylesheet" href="<c:url value='/resources/css/index.css'/>">
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">
<img src="<c:url value='/resources/images/logo.svg'/>" height="190"/>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="clientes.jsp">Clientes</a></li>
            <li class="nav-item"><a class="nav-link" href="fornecedores.jsp">Fornecedores</a></li>
            <li class="nav-item"><a class="nav-link" href="produtos.jsp">Produtos</a></li>
            <li class="nav-item"><a class="nav-link" href="categorias.jsp">Categorias</a></li>
        </ul>
    </div>
</nav>

<!-- Conteúdo principal -->
<div class="container text-center">
<h2 id="saudacao" class="display-4 mb-3 saudacao"></h2>
    <h1 class="dashboard-header">Bem-vindo ao Gestor de Estoque</h1>
    <p class="lead mb-5">Gerencie clientes, fornecedores, produtos e categorias de forma prática.</p>

    <!-- Cards principais -->
    <div class="card-container">
        <div class="card card-hover bg-primary text-white" onclick="window.location.href='clientes.jsp'">
            <div class="card-body">
                <i class="fas fa-users card-icon"></i>
                <h5 class="card-title">Clientes</h5>
                <p class="card-text">Gerencie seus clientes cadastrados.</p>
            </div>
        </div>
        <div class="card card-hover bg-success text-white" onclick="window.location.href='fornecedores.jsp'">
            <div class="card-body">
                <i class="fas fa-truck card-icon"></i>
                <h5 class="card-title">Fornecedores</h5>
                <p class="card-text">Gerencie seus fornecedores.</p>
            </div>
        </div>
        <div class="card card-hover bg-warning text-white" onclick="window.location.href='produtos.jsp'">
            <div class="card-body">
                <i class="fas fa-box-open card-icon"></i>
                <h5 class="card-title">Produtos</h5>
                <p class="card-text">Cadastre e atualize produtos.</p>
            </div>
        </div>
        <div class="card card-hover bg-danger text-white" onclick="window.location.href='categorias.jsp'">
            <div class="card-body">
                <i class="fas fa-tags card-icon"></i>
                <h5 class="card-title">Categorias</h5>
                <p class="card-text">Organize produtos por categorias.</p>
            </div>
        </div>
    </div>

    <!-- Resumo do dashboard -->
    <div class="row mt-5 justify-content-center">
        <div class="col-md-4 mb-4">
            <div class="card card-hover">
                <div class="card-body progress-container">
                    <h5 class="card-title">Produtos em Estoque</h5>
                    <div class="progress mb-2">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
                            70%
                        </div>
                    </div>
                    <small class="text-muted">Atualizado hoje</small>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card card-hover">
                <div class="card-body progress-container">
                    <h5 class="card-title">Pedidos Pendentes</h5>
                    <div class="progress mb-2">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
                            45%
                        </div>
                    </div>
                    <small class="text-muted">Última atualização: hoje</small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS e dependências -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/saudacao.js'/>"></script>

</body>
</html>
