<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajax Example Program</title>
</head>
<body>
<p id="test" style="text-align: center;"></p>
Please Select You'r Choice:<select name="opt" id="check">
<optgroup label="Programming">
<option value="java">Java</option>
<option value="DotNet">DotNet</option>
</optgroup>
<optgroup label="Testing">
<option value="Testing">Testing</option>
</optgroup>
<optgroup label="Others">
<option value="Web Designing">Web Designing</option>
<option value="Web Site Design">Web Site Design</option>
</optgroup>
</select>
<br><button onclick="func()">Click Here To See What you Selected</button>
<button onclick="func1()">Strat Timer</button>
<script>
function func(){
document.getElementById("test").innerHTML= document.getElementById("check").value;
}
</script>
<script>
var s=60;
var m=1;
function func1(){
	func2();
}
function func2(){
s-=1;
if(s==0){
	m-=1;
	s=60;
}
if(m==0){
	document.getElementById("test").innerHTML= "<h1>Count Down Over</h1>";
	return;
}

document.getElementById("test").innerHTML= "Count Down::"+m+"Min:"+s+"Sec";
setTimeout(func2,1000);
}
</script>
</body>
</html>