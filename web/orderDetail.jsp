<%-- 
    Document   : orderDetail.jsp
    Created on : Feb 19, 2023, 3:11:11 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Account"%>
<%@page import="model.OrderDetail"%>
<%@page import="dal.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cosmetic Store</title>
    </head>
    <body>

        <c:import url="header.jsp"></c:import>
            <section>
                <table border="1" class="order" >
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Plant ID</th>
                            <th>Plant Name</th>
                            <th>Image</th>
                            <th>quantity</th>
                        </tr>
                    </thead>
                <%
                    String orderid = request.getParameter("orderid");
                    if (orderid != null) {
                        int orderID = Integer.parseInt(orderid.trim());
                        ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);

                        if (list != null && !list.isEmpty()) {
                            int money = 0;
                            for (OrderDetail ord : list) {

                %>


                <tbody>
                    <tr>
                        <td><%=ord.getOrderID()%></td>
                        <td><%=ord.getPlantID()%></td>
                        <td><%=ord.getPlantName()%></td>
                        <td> <img src="<%=ord.getImgPath()%>" style="width: 50px;height: 50px" class="plantimg" /> <br> <%=ord.getPrice()%> </td>
                        <td><%=ord.getQuantity()%></td>

                    </tr>
                </tbody>

                <%
                        money = money + ord.getPrice() * ord.getQuantity();
                    }
                %>
                <h3>Total money: <%=money%></h3>

                <%    } else {

                %>
                <p>You don't have any order</p>

                <%      }
                    }

                %>
            </table>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>

    </body>
</html>
