package com.cureapp.Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cureapp.Controller.Address;
import com.cureapp.Controller.Doctor;
import com.cureapp.Controller.Methods;

public class DoctorDao implements DataAccess
{

	Connection con = null;
	private static DoctorDao instance = null;
	
	private DoctorDao()
	{
		
	}
	
	public static DoctorDao getInstance()
	{
		if(instance == null)
		{
			synchronized(DoctorDao.class)
			{
				if(instance == null)
					instance = new DoctorDao();
			}
		}
		
		return instance;
	}
	
	@Override
	public Connection getConnection() 
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(db_str_url, db_str_user, db_str_password);
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("Unable to load the JDBC bridge. " + e);
		}
		catch (SQLException error)
		{
			System.out.println("Cannot connect to the database. " + error);
	
		}
		
		return null;
	}

	@Override
	public void closeConnection() throws SQLException 
	{
		if(con != null)
			con.close();
	}

	public boolean validateLogin(String uname, String password)
	{
		int int_count = 0;
		CallableStatement cs_login = null;
		boolean bool_isValidate = false;
		con = getConnection();
		
		if(con != null)
		{
			try
			{
				cs_login = con.prepareCall("{CALL DocLogin(?,?,?)}");
				cs_login.setString(1, uname);
				cs_login.setString(2, password);
				cs_login.registerOutParameter(3, java.sql.Types.INTEGER);
				cs_login.executeUpdate();
				
				int_count = cs_login.getInt(3);
				
				if(int_count == 1)
					bool_isValidate = true;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs_login.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		
		return bool_isValidate;
	}
	
	public boolean register(Doctor doc_data)
	{
		CallableStatement cs_signup = null;
		con = getConnection();
		int var_count = 2;
		boolean var_isOkay = false;
		
		if(con != null)
		{
			try
			{
				cs_signup = con.prepareCall("{CALL DoctorSignup2(?,?,?,?,?,?,?,?,?,?,?)}");
				cs_signup.setString(1, doc_data.getDoctorID());
				cs_signup.setString(2, Methods.charToString(doc_data.getPassword()));
				cs_signup.setString(3, doc_data.getName());
				cs_signup.setString(4, doc_data.getSpecialization());
				cs_signup.setString(5, doc_data.getQualifications());
				cs_signup.setString(6, doc_data.getContactNo());
				cs_signup.setString(7, doc_data.getHospitalName());
				cs_signup.setString(8, doc_data.getDocAddress().getLocality());
				cs_signup.setString(9, doc_data.getDocAddress().getCity());
				cs_signup.setString(10, doc_data.getDocAddress().getState());
				cs_signup.setDouble(11, doc_data.getConsultationFees());
				var_count = cs_signup.executeUpdate();
				
				if(var_count == 1)
					var_isOkay = true;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs_signup.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
		return var_isOkay;
	}
	
	public ArrayList<Doctor> selectDoctor(String specialization)
	{
		CallableStatement cs_fetch = null;
		ResultSet rs_docResults = null;
		ArrayList<Doctor> doctorList = new ArrayList<Doctor>();
		con = getConnection();
		
		if(con != null)
		{
			try
			{
				cs_fetch = con.prepareCall("{CALL SelectDoctor(?)}");
				cs_fetch.setString(1, specialization);
				rs_docResults = cs_fetch.executeQuery();
				
				while(rs_docResults.next())
				{
					Doctor docTuple = new Doctor();
					docTuple.setDoctorID(rs_docResults.getString("DocId"));
					docTuple.setPassword(rs_docResults.getString("DPassword").toCharArray());
					docTuple.setName(rs_docResults.getString("Name"));
					docTuple.setSpecialization(specialization);
					docTuple.setQualifications(rs_docResults.getString("Qualification"));
					docTuple.setContactNo(rs_docResults.getString("ContactNo"));
					docTuple.setHospitalName(rs_docResults.getString("Hosp_Name"));
					
					Address docAddress = new Address();
					docAddress.setLocality(rs_docResults.getString("Hosp_Locality"));
					docAddress.setCity(rs_docResults.getString("Hosp_City"));
					docAddress.setState(rs_docResults.getString("Hosp_State"));
					docTuple.setDocAddress(docAddress);
					docTuple.setConsultationFees(rs_docResults.getDouble("prescription_fee"));
					doctorList.add(docTuple);
				}
				return doctorList;
			} 
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs_fetch.close();
					rs_docResults.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return null;
	}
	
	public boolean assignAppointment(String patientID, String doctorID)
	{
		CallableStatement cs_assign = null;
		con = getConnection();
		int var_count = 2;
		boolean var_isOkay = false;
		
		if(con != null)
		{
			try
			{
				cs_assign = con.prepareCall("{CALL GetAppointment(?,?)}");
				cs_assign.setString(1, patientID);
				cs_assign.setString(2, doctorID);
				var_count = cs_assign.executeUpdate();
				
				System.out.println(var_count);
				if(var_count == 1)
					var_isOkay = true;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs_assign.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		return var_isOkay;
	}
	
	public Doctor retrieveMyData(String doctorID)
	{
		CallableStatement cstmt_myData = null;
		ResultSet rs_docResult = null;
		Doctor docTuple = null;
		con = getConnection();
		
		if(con != null)
		{
			try
			{
				cstmt_myData = con.prepareCall("{CALL RetrieveDoctor(?)}");
				cstmt_myData.setString(1, doctorID);
				rs_docResult = cstmt_myData.executeQuery();
				
				while(rs_docResult.next())
				{
					docTuple = new Doctor();
					docTuple.setDoctorID(rs_docResult.getString("DocId"));
					docTuple.setPassword(rs_docResult.getString("DPassword").toCharArray());
					docTuple.setName(rs_docResult.getString("Name"));
					docTuple.setSpecialization(rs_docResult.getString("Specialization"));
					docTuple.setQualifications(rs_docResult.getString("Qualification"));
					docTuple.setContactNo(rs_docResult.getString("ContactNo"));
					docTuple.setHospitalName(rs_docResult.getString("Hosp_Name"));
					
					Address docAddress = new Address();
					docAddress.setLocality(rs_docResult.getString("Hosp_Locality"));
					docAddress.setCity(rs_docResult.getString("Hosp_City"));
					docAddress.setStateAndPin(rs_docResult.getString("Hosp_State"));
					docTuple.setDocAddress(docAddress);
					docTuple.setConsultationFees(rs_docResult.getDouble("prescription_fee"));
				}
				return docTuple;
			} 
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cstmt_myData.close();
					rs_docResult.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	public boolean dismissAppointment(String patientID, String doctorID)
	{
		CallableStatement cs_dismiss = null;
		con = getConnection();
		int var_count = 2;
		boolean var_isOkay = false;
		
		if(con != null)
		{
			try
			{
				System.out.println(patientID + " " + doctorID);
				cs_dismiss = con.prepareCall("{CALL DismissAppointment(?,?)}");
				cs_dismiss.setString(1, patientID);
				cs_dismiss.setString(2, doctorID);
				var_count = cs_dismiss.executeUpdate();
				
				System.out.println(var_count);
				if(var_count == 1)
					var_isOkay = true;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs_dismiss.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		return var_isOkay;
	}
	
	public void allottedPrescription(String patientID, String doctorID)
	{
		CallableStatement cs_prescibe = null;
		con = getConnection();
		int var_count = 2;
		
		if(con != null)
		{
			try
			{
				System.out.println(patientID + " " + doctorID);
				cs_prescibe = con.prepareCall("{CALL AllottedPrescription(?,?)}");
				cs_prescibe.setString(1, patientID);
				cs_prescibe.setString(2, doctorID);
				var_count = cs_prescibe.executeUpdate();
				
				System.out.println(var_count);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs_prescibe.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	/*
	public void prescriptionDone(String patientID, String doctorID)
	{
		CallableStatement cs_prescibe = null;
		con = getConnection();
		int var_count = 2;
		
		if(con != null)
		{
			try
			{
				System.out.println(patientID + " " + doctorID);
				cs_prescibe = con.prepareCall("{CALL AllottedPrescription(?,?)}");
				cs_prescibe.setString(1, patientID);
				cs_prescibe.setString(2, doctorID);
				var_count = cs_prescibe.executeUpdate();
				
				System.out.println(var_count);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs_prescibe.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	*/
	
	public boolean update(Doctor doc_data)
	{
		CallableStatement cs_update = null;
		con = getConnection();
		int var_count = 2;
		boolean var_isOkay = false;
		
		if(con != null)
		{
			try
			{
				cs_update = con.prepareCall("{ CALL updateDoctor(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }");
				cs_update.setString(1, doc_data.getDoctorID());
				cs_update.setString(2, Methods.charToString(doc_data.getPassword()));
				cs_update.setString(3, doc_data.getName());
				cs_update.setString(4, doc_data.getSpecialization());
				cs_update.setString(5, doc_data.getQualifications());
				cs_update.setString(6, doc_data.getContactNo());
				cs_update.setString(7, doc_data.getHospitalName());
				cs_update.setString(8, doc_data.getDocAddress().getLocality());
				cs_update.setString(9, doc_data.getDocAddress().getCity());
				cs_update.setString(10, doc_data.getDocAddress().getState());
				cs_update.setDouble(11, doc_data.getConsultationFees());
				
				var_count = cs_update.executeUpdate();
				
				if(var_count == 1)
					var_isOkay = true;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs_update.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
		return var_isOkay;
	}
	
	public static void main(String...args)
	{
		/*
		ArrayList<Doctor> doc = getInstance().selectDoctor("Dermatologist");
		System.out.println(doc.size());
		for(Doctor d : doc)
		{
			System.out.println(d.doctorID);
		}
		*/
		char[] pass = {'S', 'h', 'u', 'b', 'h', 'a', 'm', '#', '9', '9'};
		Doctor dr = new Doctor("sanni30", pass, "Narayani", "Dermatologist", "MBBS", 
				"9958075341", "E.S.I.", new Address("Basai Darapur","New Delhi","Delhi-110055"), 50.00);
		if(getInstance().update(dr))
			System.out.println("Registered");
		else
			System.out.println("Not registered");	
	}

}
