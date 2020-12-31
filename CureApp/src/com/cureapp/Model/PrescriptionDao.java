package com.cureapp.Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cureapp.Controller.Address;
import com.cureapp.Controller.Doctor;
import com.cureapp.Controller.Medicine;
import com.cureapp.Controller.Prescription;

public class PrescriptionDao implements DataAccess 
{
	Connection con = null;
	CallableStatement cstmt = null;
	ResultSet rset = null;
	
	private static PrescriptionDao instance = null;
	public static PrescriptionDao getInstance()
	{
		if(instance == null)
		{
			synchronized(PrescriptionDao.class)
			{
				if(instance == null)
					instance = new PrescriptionDao();
			}
		}
		return instance;
	}
	
	private PrescriptionDao() 
	{
		super();
		// TODO Auto-generated constructor stub
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
		if(rset != null)
			rset.close();
		if(cstmt != null)
			cstmt.close();
		if(con != null)
			con.close();
	}
	
	public Doctor getPatientwiseDoctor(String patientID)
	{
		try
		{
			con = getConnection();
			cstmt = con.prepareCall("{ CALL GetMyDoctor(?) }");
			cstmt.setString(1, patientID);
			rset = cstmt.executeQuery();
			if(rset.next())
			{
				Doctor doctorData = new Doctor();
				doctorData.setDoctorID(rset.getString(1));
				doctorData.setSpecialization(rset.getString(2));
				doctorData.setQualifications(rset.getString(3));
				doctorData.setContactNo(rset.getString(4));
				doctorData.setHospitalName(rset.getString(5));
				
				Address docAddress = new Address();
				docAddress.setLocality(rset.getString(6));
				docAddress.setCity(rset.getString(7));
				docAddress.setStateAndPin(rset.getString(8));
				
				doctorData.setDocAddress(docAddress);
				doctorData.setConsultationFees(rset.getDouble(9));
				return doctorData;
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
				closeConnection();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	public boolean addPrescription(String patientID, String doctorID, String medicineName)
	{
		int var_count = 2;
		boolean var_isOkay = false;
		System.out.println(patientID + " " + doctorID + " " + medicineName);
		try
		{
			
			con = getConnection();
			cstmt = con.prepareCall("{ CALL AddPrescription(?,?,?) }");
			cstmt.setString(1, patientID);
			cstmt.setString(2, doctorID);
			cstmt.setString(3, medicineName);
			var_count = cstmt.executeUpdate();
			
			if(var_count == 1)
				var_isOkay = true;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				closeConnection();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return var_isOkay;
	}
	
	public Prescription retrievePrescription(String patientID, String doctorID)
	{
		Prescription listOfMedicines = new Prescription();;
		listOfMedicines.getDoctor().setDoctorID(doctorID);
		listOfMedicines.getPatient().setPatientid(patientID);
		
		try
		{
			con = getConnection();
			cstmt = con.prepareCall("{ CALL RetrievePrescriptionByDoctor(?,?) }");
			cstmt.setString(1, patientID);
			cstmt.setString(2, doctorID);
			rset = cstmt.executeQuery();
			while(rset.next())
			{
				Medicine medicine = new Medicine();
				medicine.setMedicineName(rset.getString(1));
				medicine.setNetWeight(rset.getDouble(2));
				medicine.setPower(rset.getFloat(3));
				medicine.setManufacturingDate(rset.getString(4));
				medicine.setExpiryDate(rset.getString(5));
				listOfMedicines.getMedicineList().add(medicine);
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
				closeConnection();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		
		return listOfMedicines;
	}

}
