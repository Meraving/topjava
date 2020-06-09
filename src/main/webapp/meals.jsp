<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>

<html lang="ru">
<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
<table>
    <c:forEach var="meal" items="${mealList}">
        <c:choose>
            <c:when test="${meal.isExcess()}"><c:set var="Color" value="#ff0000"/></c:when>
            <c:otherwise><c:set var="Color" value="#00ff00"/></c:otherwise>
        </c:choose>
        <tr style="color:${Color}">
            <javatime:format value="${meal.getDateTime()}" pattern="dd.MM.yyyy HH:mm" var="Time"/>
            <td><c:out value="${Time}"/></td>
            <td><c:out value="${meal.getDescription()}"/></td>
            <td><c:out value="${meal.getCalories()}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>