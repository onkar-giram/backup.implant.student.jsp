<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import=" com.demo.bean.*, com.demo.dao.DemoDao, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fee Structure Master Form</title>
</head>
<body>
	
<%
if(request.getParameter("hiddenField") != null){
	%>
	<jsp:useBean id="obj" class="com.demo.bean.DemoBean" />
				<jsp:setProperty property="*" name="obj" />
	
	<%
	if(request.getParameter("submit").equals("Save")){
		obj.setRegStatus(1);		
		int prog = DemoDao.insertFeeStructureMaster(obj);
		if(prog == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Update")){
		obj.setRegStatus(1);		
		int pr = DemoDao.updateFeeStructureMaster(obj);
		if(pr == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Delete")){
		obj.setRegStatus(0);		
		int pr = DemoDao.updateFeeStructureMaster(obj);
		if(pr == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
}
	%>

	<form method="post" action="">
		<table class="table-striped">
		<tr>
			<td>
			Fees Id:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Fees Id" name="feesId" id="feesId" />
			</td>
		</tr>
		<tr>
			<td>
			Student Class:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Student Class" name="studentClass" id="studentClass" />
			</td>
		</tr>
		<tr>
			<td>
			Parameter:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Parameter" name="parameter" id="parameter" />
			</td>
		</tr>
		<tr>
			<td>
			Amount:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Amount" name="amount" id="amount" />
			</td>
		</tr>
		<tr>
			<td>
			Registration Date:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Registration Date" name="regDate" id="regDate" />
			</td>
		</tr>
		<tr>
			<td>
			Registration :
			</td>
			<td>
			<input class="form-control" type="hidden" name="hiddenField" value="hidden value" />
			</td>
	
		</tr>
	
		<tr>
			<td>
			
			</td>
			<td colspan= 2>
			<input class="btn btn-secondary" type="submit" name="submit" value="Save"/>
			<input class="btn btn-secondary" type="submit" name="submit"  value="Update"/>
			<input class="btn btn-secondary" type="submit" name="submit"  value="Delete"/>
			</td>
		</tr>
		</table>
	</form>
	
	<table class="table table-hover table-striped table-bordered">
	<tr>
		<td>Sr.No</td>	
		<td>Fees Id</td>
		<td>Student Class</td>
		<td>Parameter</td>
		<td>Amount</td>
		<td>Registration Date</td>
		<td>Registration Status</td>
	</tr>
	<%
		ResultSet rs = DemoDao.fetchFeeStructureMaster();
	int i = 1;
		while(rs.next()){
			%>
			<tr>
				<td> <%=i++ %> </td>
				<td> <%=rs.getInt(1) %> </td>
				<td> <%=rs.getString(2) %> </td>
				<td> <%=rs.getString(3) %> </td>
				<td> <%=rs.getFloat(4)  %> </td>
				<td> <%=rs.getString(5) %> </td>
				<td><%if(rs.getInt(6)==1){out.println("Active");}else{out.println("Inactive");} %></td> 
				<td> <button class="btn btn-primary" onclick="myFunction(<%=rs.getInt(1) %>,'<%=rs.getString(2) %>', '<%=rs.getString(3)%>','<%=rs.getFloat(4)%>','<%=rs.getString(5) %>' )"> SET</button></td>
			</tr>			
			<%
		}
	
	%>	
	</table>
</body>
<script>
	function myFunction(feesId, studentClass, parameter, amount, regDate){
	document.getElementById("feesId").value = feesId ;
	document.getElementById("studentClass").value = studentClass ;
	document.getElementById("parameter").value = parameter ;
	document.getElementById("amount").value = amount ;
	document.getElementById("regDate").value = regDate ;
	}
</script>
</html>