<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.demo.dao.DemoDao,com.demo.bean.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Class Test Mst</title>
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
		int prog = DemoDao.insertClassTestMaster(obj);
		if(prog == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Update")){
		obj.setRegStatus(1);		
		int progress = DemoDao.updateClassTestMaster(obj);
		if(progress == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Delete")){
		obj.setRegStatus(0);		
		int progress = DemoDao.updateClassTestMaster(obj);
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
	<table class="table-striped">
	<tr>
			<td>
			Class Test Id: 
			</td>
			<td>
					<input class="form-control" type="text" placeholder ="Class Test Id" name="classTestId" id="classTestId" />
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
			Test Name: 
			</td>
			<td>
				<input class="form-control" type="text" placeholder="Test Name" name="testName" id="testName" />
			</td>
		</tr>

		<tr>	
			<td>
			 Subject:
			</td>
			<td>
				<input class="form-control" type="text" placeholder="Subject" name="subject" id="subject" />
			</td>
		</tr>

		<tr>	
			<td>
			Marks: 
			</td>
			<td>
				<input class="form-control" type="text" placeholder="Marks" name="marks" id="marks" />
			</td>
		</tr>

		<tr>	
			<td>
			Date: 
			</td>
			<td>
				<input class="form-control" type="text" placeholder="Date" name="date" id="date" />
			</td>
		</tr>

		<tr>	
			<td>
				Start Time
			</td>
			<td>
				<input class="form-control" type="text" placeholder="Start Time" name="startTime" id="startTime" />
			</td>
	  </tr>


		<tr>	
			<td>
			End Time
			</td>
			<td>
				<input class="form-control" type="text" placeholder="End Time" name="endTime" id="endTime" />
			</td>
		</tr>

		<tr>	
			<td>
			Registration Date
			</td>
			<td>
				<input class="form-control" type="text" placeholder="Registration Date" name="regDate" id="regDate" />
			</td>
		</tr>

		<tr>	
			<td>
			Registration Status
			</td>
			<td>				
				<input class="form-control" type="hidden" name="hiddenField" value="hidden value" />
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

<table class="table table-hover table-striped table-bordered">
	<tr>
		<td>Sr.No</td>
		<td>Id</td>
		<td>Class Name</td>
		<td>Test Name</td>
		<td>Subject</td>
		<td>Marks</td>
		<td>Date</td>
		<td>Start Time</td>
		<td>End Time</td>
		<td>Registration Date</td>
		<td>Registration Status</td>
	</tr>
	<%
		ResultSet rs = DemoDao.fetchClassTestMaster();
	int i = 0;
		while(rs.next()){

			%>
			<tr>
				<td> <%=i++ %></td>
				<td> <%=rs.getInt(1)%> </td>
				<td> <%=rs.getString(2)%> </td>
				<td> <%=rs.getString(3)%> </td>
				<td> <%=rs.getString(4)%> </td>
				<td> <%=rs.getInt(5)%> </td>
				<td> <%=rs.getString(6)%> </td>
				<td> <%=rs.getString(7)%> </td>
				<td> <%=rs.getString(8)%> </td>
				<td> <%=rs.getString(9)%> </td>
				<td> <%if(rs.getInt(10)==1){out.println("Active");}else{out.println("Inactive");}%> </td>
				<td><button class="btn btn-info"  onclick="myFunction(<%=rs.getInt(1)%>,'<%=rs.getString(2)%>','<%=rs.getString(3)%>','<%=rs.getString(4)%>',<%=rs.getInt(5)%>,'<%=rs.getString(6)%>','<%=rs.getString(7)%>','<%=rs.getString(8)%>','<%=rs.getString(9)%>'  )">SET</button></td>
			</tr>			
			<%
		}
	%>
</table>
</body>
<script type="text/javascript">
function myFunction(classTestId,studentClass,testName,subject,marks,date,startTime,endTime,regDate ){
	document.getElementById("classTestId").value=classTestId ;
	document.getElementById("studentClass").value=studentClass ;
	document.getElementById("testName").value=testName ;
	document.getElementById("subject").value=subject ;
	document.getElementById("marks").value=marks ;
	document.getElementById("date").value=date ;
	document.getElementById("startTime").value=startTime ;
	document.getElementById("endTime").value=endTime ;
	document.getElementById("regDate").value=regDate ;
}
</script>
</html>