<%-- 
    Document   : ManagePlants
    Created on : Feb 25, 2023, 7:35:43 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Product</title>
        <link href="static/mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <c:import url="header.jsp"></c:import>         
            </header>
            <section class="right">
            <div class="container">
            <h1>Manage Products</h1>
            <a class="createP" href="createProduct.jsp">Create product</a>
            <div class="table-users">
                <table border="1" class="order" >
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>image</th>
                            <th>description</th>
                            <th>Status</th> 
                            <th>Category</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="plant" items="${requestScope.plantsList}" varStatus="loop">
                        <form action="MainController" method="POST"  enctype="multipart/form-data">
                            <tr>
                                <td>${loop.index}</td>
                                <td><input type="text" name="name" value="${plant.name}" required="" /> </td>
                                <td><input type="number" name="price" value="${plant.price}" required="" min="0"/> </td>
                                <td><img src="${plant.imgPath}" alt="alt" style="width: 50px;height: 50px"/>
                                    <br>
                                    <input type="file" name="file" size="60" accept="image/*" />
                                </td>
                                <td>
                                    <textarea style="height: 88px;width: 301px;" id="id" name="description" required="" rows="5" cols="10">${plant.description}</textarea>
                                </td>    
                                <td>
                                    <select name="status">
                                        <option value="${plant.status}">${plant.status == 1 ? 'available' : 'out of stock'}</option>
                                        <option value="${plant.status == 1 ? '0' : '1'}">${plant.status == 0 ? 'available' : 'out of stock'}</option>
                                    </select>
    
                                </td>    
                                <td>
                                    <select name="cateid" >
                                        <c:forEach var="cate" items="${requestScope.cateList}">
                                            <option ${cate.cateID == plant.cateid ? 'selected' :'' }  value="${cate.cateID}">${cate.cateName}</option>                                 
                                        </c:forEach>
                                    </select>
                                </td>    
                                <td>
                                    <input type="hidden" name="txtsearch" value="${param.txtsearch}" />
                                    <input type="hidden" name="searchby" value="${param.searchby}" />
                                    <input type="hidden" name="id" value="${plant.id}" />
                                    <input type="hidden" name="imgPath" value="${plant.imgPath}" />
                                    <input type="submit" value="updateProduct" name="action" />
                                    <input type="submit" value="deleteProduct" name="action" />
                                </td>
                            </tr>
                        </form>
                </c:forEach>
            </tbody>
        </table>
            </div>

            <c:if test="${empty requestScope.plantsList}">
                <p>don't have any product</p>
            </c:if>
        </div>
        </section>
        <div style="height: 3em;">

        </div>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
