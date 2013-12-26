<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
    pageEncoding="ISO-8859-15"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-15">
<title>XSS vulnerable</title>
<script language="javascript">
function sendPaymentRequest(){
	form = document.getElementById("sendForm");
	alert("Would submit form request...");
	return false;
}
</script>
</head>
<body>

<h3>Inserte los datos de su tarjeta</h3>
<form method="POST" name="sendForm" id="sendForm" onsubmit="return sendPaymentRequest()">

<%
final String amount = request.getParameter("amount");
Enumeration<String> pNames = request.getParameterNames();
while (pNames.hasMoreElements()){
    final String pName = pNames.nextElement();
    final String pVal = request.getParameter(pName);
    
    %>
    <input type="hidden" name="<%=pName%>" value="<%=pVal%>" />
    <% 
}
%>

<table>
<tr>
<td>Tarjeta de crédito</td><td> <input type="text" name="cc" value="" maxlength="16" size="16"/></td>
</tr>
<tr>
<td>Fecha caducidad (mm/yy)</td><td><input type="text" name="expMonth" value="" maxlength="2" size="2"/>
/<input type="text" name="expYear" value="" maxlength="2" size="2"/></td>
</tr>

<tr>
<td>CVV2</td><td><input type="password" name="cvv" value="" maxlength="3" size="3"/></td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="Realizar Pago" name="button1" id="button1" />
</td>
</tr>
</table>

</form>

</body>
</html>