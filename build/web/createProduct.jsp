<%-- 
    Document   : createProduct
    Created on : Mar 2, 2023, 4:02:17 PM
    Author     : choip
--%>

<%@page import="dal.CategoryDAO"%>
<%@page import="model.Categorie"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cosmetic Store</title>
        <link rel="stylesheet" href="./css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
    </head>
    <body>

        <header>
            <div class="header-title">
                <h1>Products</h1>
                <h5>Add products</h5>
            </div>
            <div class="logout"><a href="FindAllProductServlet"> <button type="button" class="btn btn_back "><i class="fa fa-arrow-alt-circle-left"></i> Back</button></a></div>
        </header>

        <section class="product">
            <div class="container">
                <h4 class="mb-3">Add New Product</h4>
                <hr class="my-4">
                <form action="MainController" style="text-align: right;" method="post"  enctype="multipart/form-data">
                    <div class="row mb-3">
                        <label for="ProductName" class="col-sm-2 col-form-label">Product Name</label>
                        <div class="col-sm-3">
                            <input type="text" name="name"  required="" class="form-control" id="ProductName">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="ProductName" class="col-sm-2 col-form-label">Price</label>
                        <div class="col-sm-3">
                            <input type="number" name="price"  required="" class="form-control" id="ProductName">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="ProductName" class="col-sm-2 col-form-label">Description</label>
                        <div class="col-sm-3">
                            <textarea class="form-control" name="description"  required="" id="exampleFormControlTextarea1" rows="2"></textarea>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label for="ProductName" class="col-sm-2 col-form-label">Category</label>
                        <div class="col-sm-3">
                            <select class="form-control" id="ProductName" name="cateid" >
                                <% List<Categorie> list = CategoryDAO.getCategories("");
                                    for (Categorie cate : list) {
                                %>

                                <option value="<%=cate.getCateID()%>"><%=cate.getCateName()%></option>

                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <fieldset class="row mb-3">
                        <legend class="col-form-label col-sm-2 pt-0">Status</legend>
                        <div style="display:flex" class="col-sm-10">
                            <div style="padding: 0 15px;" class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="gridRadios1"
                                       value="1" checked>
                                <label class="form-check-label" for="gridRadios1">
                                    available
                                </label>
                            </div>
                            <div style="padding: 0 15px;" class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="gridRadios2"
                                       value="0">
                                <label class="form-check-label" for="gridRadios2">
                                    not available
                                </label>
                            </div>
                        </div>
                    </fieldset>
                    <div class="row mb-3">
                        <label for="ProductName" class="col-sm-2 col-form-label">Product image file</label>
                        <div class="col-sm-4">
                            <input type="file" name="file" size="60" accept="image/*" required="" class="form-control" id="ProductName">
                        </div>
                    </div>
                    <button style="margin-right: 963px;background-color: #428BCA"  type="submit" value="createProduct" name="action"  class="btn btn-primary">Add
                        Product</button>
                </form>

            </div>
        </section>





    </body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
            integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
            integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous">
    </script>

</html>
