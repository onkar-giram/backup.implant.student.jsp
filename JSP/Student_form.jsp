<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.demo.bean.*, com.demo.dao.DemoDao , java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap-4.3.1-dist/css/bootstrap.min.css">
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STUDENT FORM</title>
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
		int prog = DemoDao.insertStudentMaster(obj) ;
		if(prog == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Update")){
		obj.setRegStatus(1);		
		int progress = DemoDao.updateStudentMaster(obj);
		if(progress == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Delete")){
		obj.setRegStatus(0);		
		int progress = DemoDao.updateStudentMaster(obj);
		if(progress == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
}
 %>

	<form method="post" action="">
		<table>
			<tr >
			<td>
			Student Id:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Student Id" name="studId" id="studId" />
			</td>
			</tr>
			
			<tr>
			<td>
			Student Name:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Student Name" name="studName" id="studName"/>
			</td>
			</tr>
			
			<tr>
			<td>
			Mobile Number:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Mobile Number" name="mobNo" id="mobNo" />
			</td>
			</tr>
			<tr>
			<td>
			Mail Id:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Mail Id" name="mailId" id="mailId" />
			</td>
			</tr>

			<tr>
			<td>
			Address:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Address" name="address" id="address"/>
			</td>
			</tr>
			
			<tr>
			<td>
			Registration Date:
			</td>
			<td>
				<input class="form-control" type="text" placeholder ="Registration Date" name="regDate" id="regDate"/>  
			</td>
			</tr>
			
			<tr>
			<td>
			Registration Status:
			</td>
			<td>
				<input class="form-control" type="hidden" name ="hiddenField" value="hidden value" id="hiddenField" />
			</td>
			</tr>
			
			<tr>
			<td colspan="2">
			<input class="btn btn-secondary" type="submit" name="submit" value="Save"/>
			<input class="btn btn-secondary" type="submit" name="submit"  value="Update"/>
			<input class="btn btn-secondary" type="submit" name="submit"  value="Delete"/>
			</td>
			</tr>												


		</table>
		
	</form>
	 
	<table class="table table-bordered table-hover table-striped">
	<tr>
		<td>Sr.No</td>
		<td>Student Id</td>
		<td>Student Name</td>
		<td>Mobile Number</td>
		<td>Mail Id</td>
		<td>Address</td>
		<td>Registration Date</td>
		<td>Registration Status</td>
		<td>Action</td>
	</tr>
	
	
	<% 
		ResultSet rs = DemoDao.fetchStudentMaster();
	int i = 1;
		while(rs.next()){
			%>
			<tr>
				<td><%=i++ %></td>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%if(rs.getInt(7)==1){out.println("Active");}else{out.println("Inactive");} %></td>
				<td><button class="btn btn-secondary" onclick="myFunction(<%=rs.getInt(1) %>,'<%=rs.getString(2) %>','<%=rs.getString(3) %>',' <%=rs.getString(4) %>','<%=rs.getString(5)%>','<%=rs.getString(6) %>')"> SET</button><td>
			</tr>
			<%
		}
	
	%>
</table>
</body>
<script> 
	function myFunction(studId, studName,mobNo,mailId, address,regDate){
	document.getElementById("studId").value = studId ;
	document.getElementById("studName").value=studName ; 
	document.getElementById("mobNo").value=mobNo ;
	document.getElementById("mailId").value=mailId ;
	document.getElementById("address").value=address ;
	document.getElementById("regDate").value=regDate ;
	}
	
</script>
</html>