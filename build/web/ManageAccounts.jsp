<%-- 
    Document   : ManageAccounts
    Created on : Feb 22, 2023, 11:51:08 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Account</title>\

        <link href="static/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="images/favicon.png">
    </head>
    <body>
        <header>
            <c:import url="header.jsp"></c:import>
            </header>
            <section class="right">
                <div class="container">
                <form action="MainController" method="POST">
                    <input type="text" name="txtSearch" value="${param.txtSearch}" />
                <input type="submit" value="searchAccount" name="action" />
            </form>
            <h1>Manage Accounts</h1>
            <div class="table-users">
                <table border="1" class="order" class="table table-bordered table-striped table-responsive-stack tacc"  id="tableOne">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Full Name</th>
                        <th>status</th>
                        <th>phone</th>
                        <th>role</th>
                        <th>action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="acc" items="${requestScope.accountList}" varStatus="loop">
                        <tr>
                            <td><c:out value="${loop.index}"></c:out></td>
                            <td><c:out value="${acc.email}"></c:out></td>
                           
                                <td>
                                <c:choose>
                                    <c:when test="${acc.status eq 1}">active</c:when>
                                    <c:otherwise>inActive</c:otherwise>
                                </c:choose>         
                            </td>
                            <td><c:out value="${acc.phone}"></c:out></td>
                                <td>
                                <c:choose>
                                    <c:when test="${acc.role eq 1}">admin</c:when>
                                    <c:otherwise>user</c:otherwise>
                                </c:choose>    

                            </td>
                            <td>
                                <c:if test="${acc.role eq 0}">
                                    <c:url var="mylink" value="MainController"> 
                                        <c:param name="email" value="${acc.email}"></c:param>
                                        <c:param name="status" value="${acc.status}"></c:param>
                                        <c:param name="action" value="updateStatusAccount"></c:param>
                                        <c:param name="txtSearch" value="${param.txtSearch}"></c:param>
                                    </c:url>
                                    <a href="${mylink}">Block/Unlock</a>

                                </c:if>


                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        </section>
                <div style="height: 3rem"></div>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
        
    </body>
</html>
