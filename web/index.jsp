<%-- 
    Document   : index.jsp
    Created on : Feb 28, 2023, 10:07:14 AM
    Author     : choip
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Cosmetic Store</title>   
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
            <div class="header-title">
                <h1>Products</h1>
                <h5>All the available products in our store</h5>
            </div>
            <div class="view-cart">  
                <c:if test="${sessionScope.USER == null}">
                    <a href="login.jsp" ><button type="button" class="btn btn-light"> Login </button></a>
                </c:if>
                <c:if test="${sessionScope.USER != null}">
                    <a href="LogoutServlet" ><button type="button" class="btn btn-light"> Logout </button></a>
                    <a href="profile.jsp" ><button type="button" class="btn btn-light"> Profile </button></a>
                </c:if>
                <c:if test="${sessionScope.USER.role == 1}">
                    <a href="MainController?action=manageAccounts" ><button type="button" class="btn btn-light"> dashboard </button></a>
                    <a href="createProduct.jsp" ><button type="button" class="btn btn-light"> Add product</button></a>
                </c:if>

                <a href="cart.jsp" ><button type="button" class="btn btn-light"><i class="fa fa-shopping-cart"></i> view cart</button></a>
            </div>

        </header>

        <section>
            <div class="container">
                <div class="nav-search">
                    <div class="nav-list">
                        <form id="categoryForm">
                            <select id="category" name="category" onchange="changeCategory()" class="cate-list">
                                <option value="-">Category</option>
                                <option value="0">All</option>
                                <c:forEach var="c" items="${requestScope.cateList}">
                                    <option value="${c.cateID}">${c.cateName}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                    <div class="search-bar">
                            <input  placeholder="Search" id="txtsearch" type="text" name="txtsearch">
                            <input type="submit" value="Search" onclick="changeSearch()">
                    </div>
                </div>
                <div class="text-center">
                    <div class="row">
                        <c:forEach var="p" items="${requestScope.PList}">
                            <div class="col-lg-3 col-md-6 mb-4 products-list">
                                <a href="FindOneProductServlet?id=${p.id}">
                                    <div class="card">
                                        <a href="FindOneProductServlet?id=${p.id}">
                                            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                                                 data-mdb-ripple-color="light">
                                                <img class="w-100" src="${p.imgPath}">
                                                <a href="FindOneProductServlet?id=${p.id}">
                                                    <div class="mask">
                                                        <div class="d-flex justify-content-start align-items-end h-100">
                                                            <h5><span class="badge bg-dark ms-2">NEW</span></h5>
                                                        </div>
                                                    </div>
                                                    <div class="hover-overlay">
                                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                                    </div>
                                                </a>
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <a href="FindOneProductServlet?id=${p.id}" class="text-reset">
                                            <h5 class="card-title mb-2">${p.name}</h5>
                                        </a
                                        <a href="FindOneProductServlet?id=${p.id}"class="text-reset ">
                                            <p>${p.catename}</p>
                                        </a>
                                        <span class="mb-3"><fmt:formatNumber type="number" pattern="#,###" value="${p.price}"/> USD</span>
                                        <div class="">
                                            <a href="FindOneProductServlet?id=${p.id}"><button type="button" class="btn btn_detail "><i class="fa fa-info-circle"></i>
                                                    Details</button></a>
                                            <a href="AddToCartServlet?pid=${p.id}"> <button type="button" class="btn btn_order "><i class="fa fa-shopping-cart"></i> Order
                                                    Now</button></a>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </c:forEach>  
                </div>
            </div>
            <c:if test="${requestScope.PList.size() == 0}">
                <div style="height: 30rem;font-size: 2em">
                    NOT FOUND ANY PRODUCTS!!!
                </div>
            </c:if>
            <c:if test="${requestScope.PList.size() != 0}">
                <nav aria-label="...">
                    <ul class="pagination" style="justify-content: end;margin-top: 20px;">
                        <li class="page-item ${page == 1 ? 'disabled':''}">
                            <a class="page-link" href="FindAllProductServlet?page=${page-1}">Previous</a>
                        </li>
                        <c:forEach begin="1" end="${requestScope.totalPage}" var="p" >
                            <c:choose>
                                <c:when test="${p == requestScope.page}">
                                    <li class="page-item active">
                                        <span class="page-link">
                                            ${p}
                                            <span class="sr-only">(current)</span>
                                        </span>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="FindAllProductServlet?page=${p}">${p}</a></li>    
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        <li class="page-item ${page == totalPage ? 'disabled':''}">
                            <a class="page-link" href="FindAllProductServlet?page=${page+1}">Next</a>
                        </li>
                    </ul>
                </nav>
            </c:if>
            <br />

        </form>

    </div>

</section>


</body>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
        integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
        integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>
                                function changeCategory() {
                                    // Retrieve the selected category value
                                    var category = document.getElementById("category").value;

                                    // Modify the URL parameters with the new category value
                                    var urlParams = new URLSearchParams(window.location.search);
                                    urlParams.set("category", category);

                                    // Reload the page with the new URL parameters
                                    //            var options = document.getElementById("category").options;

                                    //            window.location.href = window.location.pathname + "?" + urlParams.toString();
                                    window.location.href = "FindAllProductServlet" + "?category=" + category;
                                    for (var i = 0; i < options.length; i++) {
                                        if (options[i].value === category) {
                                            options[i].selected = true;
                                        } else {
                                            options[i].selected = false;
                                        }
                                    }
                                }

                                function changeSearch() {
                                    var txtsearch = document.getElementById("txtsearch").value;
                                    window.location.href = "FindAllProductServlet" + "?txtSearch=" + txtsearch;
                                }

</script>

</html>
