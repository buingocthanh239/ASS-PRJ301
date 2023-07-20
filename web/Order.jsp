<%-- 
    Document   : Order
    Created on : Mar 6, 2023, 7:50:35 PM
    Author     : admin
--%>
<%@page import="dal.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="dal.AccountDAO"%>
<%@page import="model.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cosmetic Store</title>
    </head>
    <body>
        <a href="FindAllProductServlet">home</a>
        <section>
            <%
                Account user = (Account) request.getSession().getAttribute("USER");
                if (user != null) {

                    ArrayList<Order> list = OrderDAO.getOrders(user.getEmail(), 0, null, null, null);
                    if (list != null && !list.isEmpty()) {
            %>
            <table border="1" class="order" >
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>action</th>
                    </tr>
                </thead>
                <%
                    for (Order ord : list) {

                %>


                <tbody>
                    <tr>
                        <td><%=ord.getOrderID()%></td>
                        <td><%=ord.getOrderDate()%></td>
                        <td><a href="orderDetail.jsp?orderid=<%=ord.getOrderID()%>">detail</a> </td>

                    </tr>
                </tbody>

                <%
                    }
                } else {

                %>
                <p>You don't have any order</p>

                <%      }
                } else {

                %>
                <c:redirect url="login.jsp"/>
                <%    }

                %>
            </table>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
