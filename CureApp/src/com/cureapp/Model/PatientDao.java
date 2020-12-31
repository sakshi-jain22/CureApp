package com.cureapp.Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import com.cureapp.Controller.Address;
import com.cureapp.Controller.Methods;
import com.cureapp.Controller.Patient;

public class PatientDao implements DataAccess 
{
	private PatientDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	Connection con = null;
	private static PatientDao instance = null;
	public static PatientDao getInstance()
	{
		if(instance == null)
		{
			synchronized(PatientDao.class)
			{
				if(instance == null)
					instance = new PatientDao();
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
		int count = 0;
		CallableStatement cs = null;
		boolean isValidate = false;
		con = getConnection();
		
		if(con != null)
		{
			try
			{
				cs = con.prepareCall("{CALL PatientLogin(?,?,?)}");
				cs.setString(1, uname);
				cs.setString(2, password);
				cs.registerOutParameter(3, java.sql.Types.INTEGER);
				cs.executeUpdate();
				
				count = cs.getInt(3);
				
				if(count == 1)
					isValidate = true;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cs.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		
		return isValidate;
	}
	
	public boolean addPatient(Patient p) throws SQLException
	{
		CallableStatement cs = null;
		con=getConnection();
		boolean addedNew = false;
		int count = 0;
		try {
		if(con!=null)
		{
			cs = con.prepareCall("{CALL PatientSignUp(?,?,?,?,?,?,?,?)}");
			String pass=Methods.charToString(p.getPassword());
			Address addr=p.getAddress();
			cs.setString(1, p.getPatientid());
			cs.setString(2, pass);
			cs.setString(3, p.getName());
			cs.setString(4, p.getDOB());
			cs.setString(5, addr.getLocality());
			cs.setString(6, addr.getCity());
			cs.setString(7, addr.getState());
			cs.setString(8,p.getContact());
			count=cs.executeUpdate();
			if(count == 1)
				addedNew = true;
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				cs.close();
				closeConnection();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return addedNew;
		
	}
	
	public boolean assignDoctor(String doctorID, String patientID)
	{
		CallableStatement cs = null;
		con=getConnection();
		int count = 2;
		
		try
		{
			if(con != null)
			{
				cs = con.prepareCall("{CALL AssignDoctor(?,?)}");
				cs.setString(1, doctorID);
				cs.setString(2, patientID);
				count=cs.executeUpdate();
				
				if(count == 1)
					return true;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				cs.close();
				closeConnection();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		
		return false;
	}
	
	public ArrayList<Patient> getPatientsList(String doctorID)
	{
		CallableStatement csPatients = null;
		ResultSet rsPatientRows = null;
		ArrayList<Patient> patientList = new ArrayList<Patient>();
		con = getConnection();
		
		if(con != null)
		{
			try
			{
				csPatients = con.prepareCall("{CALL GetMyPatients(?)}");
				csPatients.setString(1, doctorID);
				rsPatientRows = csPatients.executeQuery();
				
				while(rsPatientRows.next())
				{
					Patient patientTuple = new Patient();
					patientTuple.setPatientid(rsPatientRows.getString("PatientID"));
					patientTuple.setName(rsPatientRows.getString("Name"));
					patientTuple.setContact(rsPatientRows.getString("ContactNo"));
					patientTuple.setDocId(rsPatientRows.getString("DocID"));
					Address patientAddress = new Address();
					patientAddress.setLocality(rsPatientRows.getString("locality"));
					patientAddress.setCity(rsPatientRows.getString("city"));
					patientAddress.setStateAndPin(rsPatientRows.getString("state"));
					patientTuple.setAddress(patientAddress);
					patientTuple.setDOB(rsPatientRows.getString("DOB"));
					patientTuple.setIsAppointed(rsPatientRows.getInt("isAppointed"));
					patientList.add(patientTuple);
				}
				return patientList;
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					rsPatientRows.close();
					csPatients.close();
					closeConnection();
				} 
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return null;
	}
	
	public int appointmentStatus(String patientID)
	{
		con = getConnection();
		CallableStatement cstmtPatient = null;
		int appointmentStatus = -2;
		
		if(con!=null)
		{
			try
			{
				cstmtPatient = con.prepareCall("{ ? = CALL RetrieveAppointment(?)}");
				cstmtPatient.registerOutParameter(1, Types.INTEGER);
				cstmtPatient.setString(2, patientID);
				cstmtPatient.execute();
				appointmentStatus = cstmtPatient.getInt(1);
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					cstmtPatient.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		
		return appointmentStatus;
	}
	
	public Patient retrieveMyData(String patientID)
	{
		CallableStatement csPatients = null;
		ResultSet rsPatient = null;
		Patient patientTuple = null;
		con = getConnection();
		
		if(con != null)
		{
			try
			{
				csPatients = con.prepareCall("{CALL RetrievePatient(?)}");
				csPatients.setString(1, patientID);
				rsPatient = csPatients.executeQuery();
				
				while(rsPatient.next())
				{
					patientTuple = new Patient();
					patientTuple.setPatientid(rsPatient.getString("PatientID"));
					char[] passwrd = rsPatient.getString("ppassword").toCharArray();
					patientTuple.setPassword(passwrd);
					patientTuple.setName(rsPatient.getString("Name"));
					patientTuple.setContact(rsPatient.getString("ContactNo"));
					patientTuple.setDocId(rsPatient.getString("DocID"));
					Address patientAddress = new Address();
					patientAddress.setLocality(rsPatient.getString("locality"));
					patientAddress.setCity(rsPatient.getString("city"));
					patientAddress.setStateAndPin(rsPatient.getString("state"));
					patientTuple.setAddress(patientAddress);
					patientTuple.setDOB(rsPatient.getString("DOB"));
					patientTuple.setIsAppointed(rsPatient.getInt("isAppointed"));
				}
				return patientTuple;
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			finally
			{
				try 
				{
					rsPatient.close();
					csPatients.close();
					closeConnection();
				} 
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return null;
	}
	
	
	public static void main(String args[])
	{
		PatientDao obj = new PatientDao();
		obj.con = obj.getConnection();
		PreparedStatement  pstmt = null;
		String query = "SELECT * FROM PATIENT";
		try {
			pstmt = obj.con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				System.out.println(rs.getString("Name") + "  " + rs.getString("Ppassword"));
			}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try
			{
			pstmt.close();
			obj.closeConnection();
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	} 
}
