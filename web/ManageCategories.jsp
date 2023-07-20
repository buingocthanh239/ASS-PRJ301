<%-- 
    Document   : ManageCategories
    Created on : Feb 25, 2023, 6:22:45 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Categories</title>
        <link href="static/mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <c:import url="header.jsp"></c:import>
            </header>
            <section class="right">
            <div class="container">
                <form action="MainController" method="get">
                <input type="text" name="txtSearch" value="${param.txtSearch}" />
                <input type="submit" value="searchCategory" name="action">
                </form>
            <h1>Manager Category</h1>

            <div class="table-users">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Category ID</th>
                            <th>Category Name</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody class="tcate-list">
                        <c:forEach var="cate" items="${requestScope.categoryList}" varStatus="loop">
                        <form action="MainController">
                            <tr>
                                <td>${loop.index}</td>
                                <td><input type="text" name="cateName" value="${cate.cateName}" required="" /> </td>
                                <td>
                                    <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                                    <input type="hidden" name="cateID" value="${cate.cateID}" />
                                    <input type="submit" value="updateCategory" name="action" />
                                    <input type="submit" value="deleteCategory" name="action" />
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            

            <c:if test="${empty requestScope.categoryList}">
                <p>don't have any category</p>
            </c:if>
            <form action="MainController">
                <p>Category name:</p><input type="text" name="cateName" required=""/>
                <input type="submit" value="createCategory" name="action" />
            </form>
            </div>
            <div style="height: 2em;">

            </div>
        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
