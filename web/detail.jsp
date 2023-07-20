<%-- 
    Document   : detail
    Created on : Feb 28, 2023, 10:37:40 AM
    Author     : choip
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Cosmetic Store</title>
        <link rel="stylesheet" href="./css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
    </head>
    <body>
        <header>
          <h1>Products</h1>
        </header>
        <form action="AddToCartServlet">
            <section class="store">
                <div class="container_sm">
                    <div class="row row-cols-1 row-cols-sm-2">
                        <div class="col">
                            <div class="card-body image-detail">
                                <img src="${requestScope.PRODUCT.imgPath}">
                            </div>
                        </div>
                        <div class="col">
                            <div class="card-body">
                                <h3>${requestScope.PRODUCT.name}</h3>
                                <p class="card-text">${requestScope.PRODUCT.description}</p>
                                <div class="code">
                                    <strong>Item Code : </strong>
                                    <span style="background-color: #F0AD4E;border: 2px solid #dd9837;color: white; border-radius:
                                          4px;"> ${requestScope.PRODUCT.id} </span>
                                </div>
                                <div class="category">
                                    <strong>category : </strong>
                                    <small style="color:#428BCA">${requestScope.PRODUCT.catename}</small>
                                </div>
                                <p><fmt:formatNumber type="number" pattern="#,###" value="${requestScope.PRODUCT.price}"/> USD</p>
                                <div class="">
                                    <a href="FindAllProductServlet"><button type="button" class="btn btn_back "><i class="fa fa-arrow-alt-circle-left"></i> Back</button></a>
                                    <input type="hidden" name="pid" value="${requestScope.PRODUCT.id}" />
                                    <button type="submit" class="btn btn_order "><i class="fa fa-shopping-cart"></i> Order Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
    </div>
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
<footer class="bg-light py-3">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <ul class="list-inline mb-0">
          <li class="list-inline-item"><a href="https://www.facebook.com/YOUR_PAGE" target="_blank"><i class="fab fa-facebook"></i></a></li>
          <li class="list-inline-item"><a href="https://www.instagram.com/YOUR_ACCOUNT" target="_blank"><i class="fab fa-instagram"></i></a></li>
        </ul>
      </div>
      <div class="col-md-6 text-md-right">
        <ul class="list-inline mb-0">
          <li class="list-inline-item"><i class="fas fa-phone"></i> Phone: 123-456-7890</li>
          <li class="list-inline-item"><i class="fas fa-map-marker-alt"></i> Đại học FPT, cơ sở Hòa Lạc,Thạch Hòa, Thạch Thất, Hà Nội</li>
        </ul>
      </div>
    </div>
  </div>
</footer>
</html>
