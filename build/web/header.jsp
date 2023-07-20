.<%-- 
    Document   : header_loginedAdmin
    Created on : Feb 22, 2023, 11:39:22 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="static/mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="header-main">
            <div class="header-info" style="margin-right: 2em;">
                <h1>Cosmetic Store</h1>
                <h5>We bring you guys to best goods <3</h5>
            </div>
            <div class="header-change">
                <ul>
                    <li><a href="FindAllProductServlet"> Home </li>
                        <c:if test="${sessionScope.USER.role == 1}">
                        <li><a href="MainController?action=manageAccounts" > Manage Accounts </li>
                        
                        
                        <li><a href="MainController?action=manageProducts"> Manage products </li>
                        <li><a href="MainController?action=manageCategories"> Manage categories </li>
                        </c:if>
                    <li>
                        <a Welcome ${sessionScope.USER.fullname} </a> | <a href="MainController?action=logout">logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
