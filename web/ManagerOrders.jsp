<%-- 
    Document   : ManagerOrders
    Created on : Feb 25, 2023, 5:33:32 PM
    Author     : admin
--%>

<%@page import="dal.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Orders</title>
        <link href="static/mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <c:import url="header.jsp"></c:import>
            </header>
            <section class="right">
                <div class="container">
                <form action="ManagerOrders.jsp" method="get">
                    <p>From</p><input type="date" name="from" value="${param.from}" ><p>To</p> <input type="date" name="to" value="${param.to}" ><br>
                <p>Account ID</p> <input type="text" name="txtSearch" value="${param.txtSearch}" />
                <input type="submit" value="search">
            </form>
            <h1>Manage Orders</h1>


            <div class="table-users">
            <%
                String from = request.getParameter("from");
                String to = request.getParameter("to");
                String txtSearch = request.getParameter("txtSearch");
                String[] status = {"", "Processing", "completed", "Canceled"};
                ArrayList<Order> list = OrderDAO.getOrders("%%", 0, from, to, txtSearch);
                if (list != null && !list.isEmpty()) {        
            %>
                    
            <table border="1" class="order" >
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Account ID</th>
                        <th>action</th>
                    </tr>
                </thead>
                <% count = 0;
                %>
                <%  for (Order ord : list) {        %>

                <tbody>
                    <tr>
                        <td><%=ord.getOrderID()%></td>
                        <td><%=ord.getOrderDate()%></td>
                        <td><%=ord.getAccID()%></td>
                        <td><a href="orderDetail.jsp?orderid=<%=ord.getOrderID()%>">detail</a> </td>

                    </tr>
                </tbody>

                <%   count++; }      %>
            </table>
            <%
               
            } else {

            %>
            <p>don't have any order</p>

            <%      }

            %>

        </div>
    </div>
        </section>
<div style="height: 2em;"></div>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
