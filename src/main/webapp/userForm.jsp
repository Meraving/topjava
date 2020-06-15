<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>User</title>
    <style>
        dl {
            background: none repeat scroll 0 0 #FAFAFA;
            margin: 8px 0;
            padding: 0;
        }

        dt {
            display: inline-block;
            width: 170px;
        }

        dd {
            display: inline-block;
            margin-left: 8px;
            vertical-align: top;
        }
    </style>
</head>
<body>
<section>
    <h3><a href="index.html">Home</a></h3>
    <hr>
    <h2>${param.action == 'create' ? 'Create user' : 'Edit user'}</h2>
    <jsp:useBean id="user" type="ru.javawebinar.topjava.model.User" scope="request"/>
    <form method="post" action="users">
        <input type="hidden" name="id" value="${user.id}">
        <input type="hidden" name="registered" value="${Date}">
        <dl>
            <dt>Name:</dt>
            <dd><input type="text" value="${user.name}" name="name" required></dd>
        </dl>
        <dl>
            <dt>eMail:</dt>
            <dd><input type="email" value="${user.email}" name="eMail" required></dd>
        </dl>
        <dl>
            <dt>Password:</dt>
            <dd><input type="password" value="${user.password}" name="Password" required></dd>
        </dl>
        <dl>
            <dt>CaloriesPerDay:</dt>
            <dd><input type="text" value="${user.caloriesPerDay}" name="Calories per day" required></dd>
        </dl>
        <dl>
            <dt>Enabled:</dt>
            <dd><input type="radio" value="${user.enabled}" name="Enabled" required></dd>
        </dl>
        <dl>
            <dt>Roles:</dt>
            <dd><input type="number" value="${user.enabled}" name="Enabled" required></dd>
        </dl>
        <button type="submit">Save</button>
        <button onclick="window.history.back()" type="button">Cancel</button>
    </form>
</section>
</body>
</html>
