<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/" var="url"/>
<c:url value="/resources/images/" var="urlImg"/>
<c:url value="/resources/js/" var="urlJs"/>
<c:url value="/resources/css/" var="urlCss"/>

<c:choose>
    <c:when test="${pageContext.request.secure}">
        <c:set value="https://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.servletContext.contextPath}/" var="urlCompleta" />
    </c:when>
    <c:otherwise>
        <c:set value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.servletContext.contextPath}/" var="urlCompleta" />
    </c:otherwise>
</c:choose>
