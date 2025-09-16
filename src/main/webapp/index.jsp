<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>GestorStock - Home</title>
    <!-- CSS do menu -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/home/menu.css">
</head>
<body>
    <!-- Menu Superior -->
    <div class="top-menu">
        <div class="user-info">
            <img src="<c:choose>
                          <c:when test='${not empty sessionScope.usuario.foto}'>
                              ${pageContext.request.contextPath}/resource/images/${sessionScope.usuario.foto}
                          </c:when>
                          <c:otherwise>
                              ${pageContext.request.contextPath}/resource/images/default.png
                          </c:otherwise>
                      </c:choose>"
                 alt="Foto do Usuário" class="user-photo">
            <div class="user-details">
                <span class="user-name">
                    <c:out value="${sessionScope.usuario.nome}" />
                </span>
                <span class="user-role">
                    <c:out value="${sessionScope.usuario.funcao}" />
                </span>
            </div>
        </div>
        <div class="menu-links">
            <a href="${pageContext.request.contextPath}/logout">Sair</a>
        </div>
    </div>

    <!-- Conteúdo principal -->
    <div class="main-content">
        <h1>Bem-vindo, <c:out value="${sessionScope.usuario.nome}" />!</h1>
        <p>Sua função: <c:out value="${sessionScope.usuario.funcao}" /></p>
    </div>
</body>
</html>
