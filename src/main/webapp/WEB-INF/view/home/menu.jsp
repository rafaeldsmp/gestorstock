<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!-- Menu Superior -->
<div class="top-menu">
    <div class="user-info">
        <img src="${sessionScope.usuario.foto}" alt="Foto do Usuario" class="user-photo">
        <div class="user-details">
            <span class="user-name">${sessionScope.usuario.nome}</span>
            <span class="user-role">${sessionScope.usuario.funcao}</span>
            <span> "provcurando"</span>
        </div>
    </div>
    <div class="menu-links">
        <a href="/logout">Sair</a>
    </div>
</div>
