<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/cart.css">
<title>Cart</title>
</head>
<body>
<div class="container">

	<h1>Shopping Cart</h1><hr>
	<table class="table table-striped table-hover table-bordered">
        <tbody>
            <tr>
                <th>Item</th>
                <th>QTY</th>
                <th>Unit Price</th>
                <th>Total Price</th>
            </tr>
            <tr>
                <td>Awesome Product</td>
                <td>1 <a href="#">X</a></td>
                <td>£250.00</td>
                <td>£250.00</td>
            </tr>
            <tr>
                <th colspan="3"><span class="pull-right">Sub Total</span></th>
                <th>£250.00</th>
            </tr>
            <tr>
                <th colspan="3"><span class="pull-right">VAT 20%</span></th>
                <th>£50.00</th>
            </tr>
            <tr>
                <th colspan="3"><span class="pull-right">Total</span></th>
                <th>£300.00</th>
            </tr>
            <tr>
                <td><a href="#" class="btn btn-primary">Continue Shopping</a></td>
                <td colspan="3"><a href="#" class="pull-right btn btn-success">Checkout</a></td>
            </tr>
        </tbody>
    </table>          
      
</div>

</body>
</html>