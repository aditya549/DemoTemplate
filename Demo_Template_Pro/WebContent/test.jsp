<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="testing" method="post" onsubmit="return func()">
<table cellspacing="0" border="0" cellpadding="8"
style="background-color:#ffcc66;">
<tr><td colspan="2" style="padding-bottom:1px;">
<tr valign="bottom"><td>
<a href="#" onclick="return ReloadCaptchaImage('CaptchaImage');"><span style="font-size:12px;">reload image</span></a><br />
<a href="http://www.snaphost.com/captcha/ReadyForms/EmploymentApplicationForm.aspx"><img id="CaptchaImage"
alt="employment form online" style="border-width:0px;"
title="employment form online"
src="http://www.SnapHost.com/captcha/CaptchaImage.aspx?id=DXA75T43PUUR" /></a>
</td><td>  <br /><i>Enter Captcha code</i><br />
<input id="skip_CaptchaCode" name="skip_CaptchaCode" type="text"
style="width:130px; height:48px; font-size:38px;" maxlength="6" /><br />
</td></tr></table>
<input type="submit" name="Submit">
</form>
<script type="text/javascript">
function ReloadCaptchaImage(captchaImageId) {
var obj = document.getElementById(captchaImageId);
var src = '' + obj.src;
obj.src = '';
var date = new Date();
var pos = src.indexOf('&rad=');
if (pos >= 0) { src = src.substr(0, pos); }
obj.src = src + '&rad=' + date.getTime();
return false; 
}
</script>
<script>
function func() {
	if(document.getElementById(captchaImageId).value == document.getElementById(skip_CaptchaCode))
		{alert("Catptch Must Match");
		return true;
		}
	else{
		alert("Catptch Must Match");
		return false;
	}
}
</script>
</body>
</html>