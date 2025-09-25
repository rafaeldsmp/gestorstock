<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Categorias</title>
</head>
<body>
<h2>Categorias LEU O CATEGORIA-LISTA</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descrição</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${categorias}" var="c">
            <tr>
                <td>${c.id}</td>
                <td>${c.nome}</td>
                <td>${c.descricao}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
