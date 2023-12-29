/**
 * 
 */
package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.demo.bean.DemoBean;
import com.demo.db.ConnectionProvider;

/**
 * @author IT development
 *
 */
public class DemoDao {
	
// For Result
	
	//INSERT 
			public static int insertResult(DemoBean obj){
			int st = 0;
			try{
				Connection con = ConnectionProvider.getConnection();
				PreparedStatement pst = con.prepareStatement("insert into result values(?,?,?,?,?)");
			
				pst.setInt(1, obj.getStudentId());
				pst.setInt(2, obj.getClassTestId());
				pst.setFloat(3, obj.getObtainedMarks());;
				pst.setString(4, obj.getRegDate());
				pst.setInt(5, obj.getRegStatus());
				st = pst.executeUpdate();
			}
			catch(Exception ex){System.out.println(ex.toString());}
			return st;
		}
	
	//UPDATE		
			public static int updateResult(DemoBean obj){
				int pr = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("update result SET student_id=?, class_test_id = ?, obtained_marks= ?, reg_date = ?,reg_status = ? where result_id = ?");
					pst.setInt(1, obj.getStudentId());
					pst.setInt(2, obj.getClassTestId());
					pst.setFloat(3, obj.getObtainedMarks());
					pst.setString(4, obj.getRegDate());
					pst.setInt(5, obj.getRegStatus());
					pst.setInt(6, obj.getResultId());
					
					
					pr = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return pr;
			}
			
	//FETCH
			public static ResultSet fetchResult(){
				ResultSet rs = null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select sr.result_id, sr.class_test_id ,sr.student_id ,sm.stud_name, sr.obtained_marks, sr.reg_date, sr.reg_status from student_mst sm, result sr where sm.stud_id = sr.student_id");
					rs = pst.executeQuery();

				}
				catch(Exception ex){System.out.println(ex.toString());}
				return rs;
			}
	

//FOR CLASS TEST MASTER
			
	//INSERT 
			public static int insertClassTestMaster(DemoBean obj){
				int status = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("insert into class_test_mst values(?,?,?,?,?,?,?,?,?)");
					pst.setString(1, obj.getStudentClass());
					pst.setString(2, obj.getTestName());
					pst.setString(3, obj.getSubject());
					pst.setFloat(4, obj.getMarks());
					pst.setString(5, obj.getDate());
					pst.setString(6, obj.getStartTime());
					pst.setString(7, obj.getEndTime());
					pst.setString(8, obj.getRegDate());
					pst.setInt(9, obj.getRegStatus());

					status = pst.executeUpdate();
				}
				catch(Exception ex){System.out.println(ex.toString());}
				return status;
			}
	
	//UPDATE
			public static int updateClassTestMaster(DemoBean obj){
				int progress = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("update class_test_mst SET student_class = ?, test_name =?, subject=?, marks =?,date=?,start_time=?,endtime=? ,reg_date=?,reg_status=? where class_test_id=?");
					pst.setString(1, obj.getStudentClass());
					pst.setString(2, obj.getTestName());
					pst.setString(3, obj.getSubject());
					pst.setFloat(4, obj.getMarks());
					pst.setString(5, obj.getDate());
					pst.setString(6, obj.getStartTime());
					pst.setString(7, obj.getEndTime());
					pst.setString(8,obj.getRegDate());
					pst.setInt(9, obj.getRegStatus());
					pst.setInt(10, obj.getClassTestId());
					
					progress = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return progress;
			}
			
	//FETCH
			public static ResultSet fetchClassTestMaster(){
				ResultSet rs=null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select * from class_test_mst");
					rs = pst.executeQuery();

				}
				catch(Exception ex){System.out.println(ex.toString());}
				return rs;
			}
			
			
//FOR INSERT FEE STRUCTURE MASTER	
			
	//INSERT
			public static int insertFeeStructureMaster(DemoBean obj){
				int stat = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("insert into fees_structure_mst values(?,?,?,?,?)");
					pst.setString(1,obj.getStudentClass() );
					pst.setString(2, obj.getParameter());
					pst.setFloat(3, obj.getAmount());
					pst.setString(4, obj.getRegDate());
					pst.setInt(5, obj.getRegStatus());
					stat = pst.executeUpdate();
				
				}
				catch(Exception ex){
					System.out.println(ex);
				}
				return stat;
			}

	//UPDATE
			public static int updateFeeStructureMaster(DemoBean obj){
				int pr = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("update fees_structure_mst SET student_class=?,parameter=?,amount=?,reg_date=?,reg_status=? where fees_id = ?");
					pst.setString(1, obj.getStudentClass());
					pst.setString(2, obj.getParameter());
					pst.setFloat(3, obj.getAmount());
					pst.setString(4, obj.getRegDate());
					pst.setInt(5, obj.getRegStatus());
					pst.setInt(6, obj.getFeesId());
					
					
					pr = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return pr;
			}
	
	//FETCH
			public static ResultSet fetchFeeStructureMaster(){
				ResultSet rs=null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select fees_id , student_class,parameter,amount,reg_date,reg_status from fees_structure_mst");
					rs = pst.executeQuery();

				}
				catch(Exception ex){System.out.println(ex.toString());}
				return rs;
			}
			
			
//FOR UPDATE STUDENT FEES
			
	//INSERT
			public static int insertStudentFees (DemoBean obj){
				int prog=0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("insert into student_fees values(?,?,?,?,?,?)");
					pst.setInt(1,obj.getStudentId());
					pst.setString(2, obj.getClassName()); 
					pst.setString(3, obj.getAnnualYr());
					pst.setFloat(4, obj.getAmount());
					pst.setString(5, obj.getRegDate());
					pst.setInt(6, obj.getRegStatus());
					
					prog = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return prog;
				}
				
	//UPDATE
			public static int updateStudentFees(DemoBean obj){
				int pr = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("update student_fees SET student_id=?, class_name =?, annual_yr=?,amount=?,reg_date=?,reg_status=? where id=?");
					pst.setInt(1, obj.getStudentId());
					pst.setString(2, obj.getClassName());
					pst.setString(3, obj.getAnnualYr());
					pst.setFloat(4, obj.getAmount());
					pst.setString(5, obj.getRegDate());
					pst.setInt(6, obj.getRegStatus());
					pst.setInt(7, obj.getId());
					
					
					pr = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return pr;
			}
			
	//FETCH
			public static ResultSet fetchStudentFees(){
				ResultSet rs=null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select sf.id ,sf.student_id , sm.stud_name, sf.class_name, sf.annual_yr, sf.amount, sf.reg_date, sf.reg_status from student_mst sm, student_fees sf where sm.stud_id=sf.student_id");
					rs = pst.executeQuery();

				}
				catch(Exception ex){System.out.println(ex.toString());}
				return rs;
			}
			
	
//FOR STUDENT MASTER
			
	//INSERT
			public static int insertStudentMaster (DemoBean obj){
				int prog=0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("insert into student_mst values(?,?,?,?,?,?)");
					pst.setString(1,obj.getStudName()); 
					pst.setString (2, obj.getMobNo());
					pst.setString(3, obj.getMailId());
					pst.setString(4, obj.getAddress());
					pst.setString(5, obj.getRegDate());
					pst.setInt(6, obj.getRegStatus());
					
					prog = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return prog;
			}
			
	//UPDATE
			public static int updateStudentMaster(DemoBean obj){
				int progress = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("update student_mst SET stud_name=?, mob_no=?, mail_id=?, address=?, reg_date=?, reg_status=? where stud_id=?");
					pst.setString(1, obj.getStudName());
					pst.setString(2, obj.getMobNo());
					pst.setString(3, obj.getMailId());
					pst.setString(4, obj.getAddress());
					pst.setString(5,obj.getRegDate());
					pst.setInt(6,obj.getRegStatus());
					pst.setInt(7, obj.getStudentId());
					
					progress = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return progress;
			}
			
	//FETCH
			public static ResultSet fetchStudentMaster(){
				ResultSet rs=null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select * from student_mst");
					rs = pst.executeQuery();

				}
				catch(Exception ex)
				{System.out.println(ex.toString());}
				return rs;
			}
			
//FOR VIEW_RECORDS TO FETCH TOUR_DETAILS
			public static ResultSet fetchTourMaster(String fDate , String tDate){
				ResultSet rs=null;
				try{

					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select td.emp_id, td.from_date, td.to_date, td.reason, vm.vehicle_no, vm.vehicle_name, vrm.rate, td.km from vehicle_mst vm, vehicle_rate_mst vrm, tour_details td where vm.vehicle_id = vrm.vehicle_id and vm.vehicle_id = td.vehicle_id and td.from_date between ? and ?");
					pst.setString(1, fDate);
					pst.setString(2, tDate);
					rs = pst.executeQuery();

				}
				catch(Exception ex)
				{System.out.println(ex.toString());}
				return rs;
			}		
						
			
		
// For Tour  Details
			
	//INSERT
			public static int insertTourDetails(DemoBean obj){
				int prog=0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("insert into tour_details values(?,?,?,?,?,?,?,?,?,?,?)");
					pst.setInt(1,obj.getEmpId()); 
					pst.setString (2, obj.getFromDate());
					pst.setString(3, obj.getToDate());
					pst.setString(4, obj.getAlongWith());
					pst.setString(5, obj.getReason());
					pst.setInt(6, obj.getVehicleId());
					pst.setString(7, obj.getBillNo());
					pst.setFloat(8, obj.getKm());
					pst.setInt(9, obj.getRegBy());
					pst.setString(10, obj.getRegDateTime());
					pst.setInt(11, obj.getRegStatus());
					
					prog = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return prog;
			}
	//UPDATE
			public static int updateTourDetails(DemoBean obj){
				int progress = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("update tour_details SET emp_id=?,from_date=?,to_date=?,along_with=?,reason=?,vehicle_id=?,bill_no=?,km=?,reg_by=?,reg_date_time=?, reg_status=? where id=?");
					pst.setInt(1,obj.getEmpId()); 
					pst.setString (2, obj.getFromDate());
					pst.setString(3, obj.getToDate());
					pst.setString(4, obj.getAlongWith());
					pst.setString(5, obj.getReason());
					pst.setInt(6, obj.getVehicleId());
					pst.setString(7, obj.getBillNo());
					pst.setFloat(8, obj.getKm());
					pst.setInt(9, obj.getRegBy());
					pst.setString(10, obj.getRegDateTime());
					pst.setInt(11, obj.getRegStatus());
					pst.setInt(12, obj.getId());
					 
					progress = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return progress;
			}
	//FETCH
			public static ResultSet fetchTourDetails(){
				ResultSet rs=null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select * from tour_details");
					
					rs = pst.executeQuery();

				}
				catch(Exception ex)
				{System.out.println(ex.toString());}
				return rs;
			}		

//FOR VEHICLE MASTER
	
//FETCH
			public static ResultSet fetchVehicleMaster(){
				ResultSet rs=null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select * from vehicle_mst");
					rs = pst.executeQuery();

				}
				catch(Exception ex)
				{System.out.println(ex.toString());}
				return rs;
			}		


			
//VOID MAIN	
//VOID MAIN
															
			public static void main(String args[]){
				DemoBean obj = new DemoBean();
				
				
			/*	//for classTestMaster
				obj.setStudentClass("TY Polytechnic");
				obj.setTestName("Test");
				obj.setSubject("Test Subject");
				obj.setMarks(70);
				obj.setDate("2019-05-31");
				obj.setStartTime("11:00");
				obj.setEndTime("12:00");
				obj.setRegDate("2019-05-28");
				obj.setRegStatus(1);
				
				int status = insertClassTestMaster(obj);
				if(status == 1)
					System.out.println("Success");
				else
					System.out.println("Failed");
				
				
				//for feeStructureMaster
				
				obj.setClassName("FY Polytechnic");
				obj.setParameter("Trasnsportation Fees");
				obj.setAmount(1000.50f);
				obj.setRegDate("2019-05-29");
				obj.setRegStatus(1);
				
				int stat = insertfeeStructureMaster(obj);
				if(stat == 1)
					System.out.println("Success");
				else
					System.out.println("Failed");
				
				//for updating classTesrMaster
				
				obj.setSubject("Science");
				int progress = updateClassTestMaster(obj);     
				if(progress == 1)
				System.out.println("Success");				
				else
				System.out.println("Failed");
				
				int prog = insertStudentMaster(obj);
				if(prog == 1)
					System.out.println("Success");				
				else
					System.out.println("Failed");*/
			}
		}
