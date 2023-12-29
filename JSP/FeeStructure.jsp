<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.demo.dao.DemoDao, com.demo.bean.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap-4.3.1-dist/css/bootstrap.min.css">
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fees Structure </title>
</head>
<body>
<%
if(request.getParameter("hiddenField") != null){
	%>
	<jsp:useBean id="obj" class="com.demo.bean.DemoBean" />
				<jsp:setProperty property="*" name="obj" />
	
	<%

	
	
	if(request.getParameter("submit").equals("Save")){			// if save button is pressed
		obj.setRegStatus(1);		
		int prog = DemoDao.insertStudentFees(obj);
		if(prog == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Update")){		// update button is pressed
		obj.setRegStatus(1);		
		int pr = DemoDao.updateStudentFees(obj);
		if(pr == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
	if(request.getParameter("submit").equals("Delete")){		// delete button is placed
		obj.setRegStatus(0);		
		int pr = DemoDao.updateStudentFees(obj);
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
	<table class="table-striped">				
		<tr>	
			<td  >
&nbsp&nbsp&nbsp			ID
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Id" name="id" id="id" />
			</td>
		</tr>
		<tr>	
			<td>
&nbsp&nbsp&nbsp				Student Id
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Student Id" name="studentId" id="studentId"/>
			</td>
		</tr>
		<tr>	
			<td>
&nbsp&nbsp&nbsp				Student class
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Student Class" name="className" id="className" />
			</td>
		</tr>
				<tr>	
			<td>
&nbsp&nbsp&nbsp				Annual year
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Annual Year" name="annualYr" id="annualYr" />
			</td>
		</tr>
		<tr>	
			<td>
&nbsp&nbsp&nbsp				Amount
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Amount" name="amount" id="amount" />
			</td>
		</tr>
		<tr>	
			<td>
			Registration Date:
			</td>
			<td>				
				<input class="form-control" type="text" placeholder="Registration Date" name="regDate" id="regDate" />
			</td>
		</tr>
		<tr>	
			<td>
&nbsp&nbsp&nbsp				Registration Status:
			</td>
			<td>				
				<input class="form-control" type="hidden" name="hiddenField" value="hidden" />
			</td>
		</tr>
		
				<tr>
		<td colspan="2">
			<input class="btn btn-secondary" type="submit" name="submit"  value="Save"/>					
			<input class="btn btn-secondary" type="submit" name="submit"  value="Update"/>
			<input class="btn btn-secondary" type="submit" name="submit"  value="Delete"/>
		</td>
		</tr>
	</table>	
	</form>
	
	<table class="table table-striped table-hover table-bordered">
	<tr>
		<td>Sr.No</td>	
		<td>Id</td>
		<td>Student Id</td>
		<td>Student Name</td>
		<td>Class</td>
		<td>Annual Year</td>
		<td>Amount</td>
		<td>Registration Date</td>
		<td>Registration Status</td>
	</tr>
	<%
		ResultSet rs = DemoDao.fetchStudentFees();
	int i = 1;
		while(rs.next()){
			%>
			<tr> 
				<td> <%=i++ %> </td>
				<td> <%=rs.getInt(1)%> </td>
				<td> <%=rs.getInt(2) %>
				<td> <%=rs.getString(3)%> </td>
				<td> <%=rs.getString(4)%> </td>
				<td> <%=rs.getString(5)%> </td>
				<td> <%=rs.getFloat(6)%> </td>
				<td> <%=rs.getString(7)%> </td>
				<td> <%if(rs.getInt(8)==1){out.println("Active");}else{out.println("Inactive");} %> </td>   
				<td><button class="btn btn-secondary" onclick="myFunction(<%=rs.getInt(1)%>,'<%=rs.getInt(2)%>','<%=rs.getString(4)%>','<%=rs.getString(5)%>','<%=rs.getFloat(6)%>','<%=rs.getString(7)%>' )">SET</button></td>
			</tr>			
			<%
		}
	%>
</table>
</body>
<script>                                   //Coding for set button
function myFunction(id,studentId,className,annualYr,amount,regDate){
	document.getElementById("id").value=id ;
	document.getElementById("studentId").value=studentId ;
	document.getElementById("className").value=className ;
	document.getElementById("annualYr").value=annualYr ;
	document.getElementById("amount").value=amount ;
	document.getElementById("regDate").value=regDate ;

}
</script>
</html>