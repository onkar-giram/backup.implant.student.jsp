<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.demo.bean.*, com.demo.dao.DemoDao , java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap-4.3.1-dist/css/bootstrap.min.css">
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
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
		int prog = DemoDao.insertResult(obj) ;
		if(prog == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Update")){
		obj.setRegStatus(1);		
		int pr = DemoDao.updateResult(obj);
		if(pr == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Delete")){
		obj.setRegStatus(0);		
		int pr = DemoDao.updateResult(obj);
		if(pr == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
}
 %>	
	<form>
	<table >
		<tr>
			<td>
			Result Id
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Result Id" name="resultId" id="resultId"/>
			</td>
		</tr>
		<tr>	
			<td>
			Student Id
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Student Id" name="studentId" id="studentId" />
			</td>
		</tr>		
		<tr>	
			<td>
			Class Test Id
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Class Test Id" name="classTestId" id="classTestId"/>
			</td>
		</tr>
		<tr>	
			<td>
			Obtained Marks
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Obtained Marks" name="obtainedMarks" id="obtainedMarks" />
			</td>
		</tr>
		<tr>	
			<td>
			Registration Date
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Registration Date" name="regDate" id="regDate"/>
			</td>
		</tr>
		<tr>	
			<td>
			Registration Status
			</td>
			<td>				
				<input class="form-control" type="hidden" name="hiddenField" value="hidden" />
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
		

	<table class="table table-hover table-bordered table-striped">
	<tr>
		<td>Sr.No</td>	
		<td>Result Id</td>
		<td>Class Test Id</td>
		<td>Student Id</td>
		<td>Student Names</td>
		<td>Obtained Marks</td>
		<td>Registration Date</td>
		<td>Registration Status</td>
	</tr>
	<%
		ResultSet rs = DemoDao.fetchResult();
	int i = 1;
		while(rs.next()){
			%>
			<tr>
				<td> <%=i++ %> </td>
				<td> <%=rs.getInt(1) %> </td>
				<td> <%=rs.getInt(2) %> </td>
				<td> <%=rs.getInt(3) %> </td>
				<td> <%=rs.getString(4)%> </td>
				<td> <%=rs.getFloat(5) %></td>
				<td> <%=rs.getString(6)%> </td>
				<td> <%if(rs.getInt(7)==1){out.println("Active");}else{out.println("Inactive");} %></td>
				<td> <button class="btn btn-secondary" onclick="myFunction( <%=rs.getInt(1) %>, <%=rs.getInt(2) %>, <%=rs.getInt(3) %>,' <%=rs.getFloat(5) %>',' <%=rs.getString(6)%>')"> SET </button> </td>
			</tr>			
			<%
		}
	
	%>
</table>						
</body>
<script>
function myFunction(resultId, classTestId, studentId, obtainedMarks,regDate ){
	document.getElementById("resultId").value = resultId ;	
	document.getElementById("classTestId").value = classTestId ;
	document.getElementById("studentId").value = studentId ;
	document.getElementById("obtainedMarks").value = obtainedMarks ;
	document.getElementById("regDate").value = regDate ;
}
</script>
</html>