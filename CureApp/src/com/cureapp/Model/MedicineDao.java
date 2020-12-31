package com.cureapp.Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cureapp.Controller.Medicine;

public class MedicineDao implements DataAccess 
{
	Connection con = null;
	private static MedicineDao instance = null;

	private MedicineDao() {
		// TODO Auto-generated constructor stub
	}
	
	public static MedicineDao getInstance()
	{
		if(instance == null)
		{
			synchronized(MedicineDao.class)
			{
				if(instance == null)
					instance = new MedicineDao();
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
	
	public ArrayList<Medicine> countRows()
	{
		CallableStatement cs_countRow=null;
		con= getConnection();
		ResultSet rs = null;
		ArrayList<Medicine> medicineList=new ArrayList<Medicine>();
		if(con !=null)
		{
			try 
			{
				cs_countRow=con.prepareCall("{CALL getAllMedicines()}");
				cs_countRow.executeQuery();
				rs=cs_countRow.getResultSet();
				while(rs.next())
				{
					Medicine med_obj=new Medicine();
					med_obj.setBarCodeNumber(rs.getString("BarcodeNumber"));
					med_obj.setMedicineName(rs.getString("MedName"));
					med_obj.setBatchNo(rs.getString("BatchNo"));
					med_obj.setNetWeight(rs.getFloat("NetWeight"));
					med_obj.setPower(rs.getFloat("Power"));
					med_obj.setManufacturingDate(rs.getString("MfdDate"));
					med_obj.setManufacturerName(rs.getString("MfdBy"));
					med_obj.setExpiryDate(rs.getString("ExpDate"));
					med_obj.setCostPrice(rs.getFloat("Cost"));
					med_obj.setIngrImagePath(rs.getString("ingredientImg"));
					med_obj.setMedImagePath(rs.getString("image"));
					med_obj.setStockCount(rs.getInt("stock"));
					medicineList.add(med_obj);
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
					cs_countRow.close();
					rs.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		} // if 
		return medicineList;
		
	}
	
	public boolean addMedicine(Medicine obj_medicine)
	{
		CallableStatement cs_addNewMed = null;
		con = getConnection();
		int var_count = 2;
		boolean var_isOkay = false;
		
		if(con != null)
		{
			try 
			{
				cs_addNewMed = con.prepareCall("{ CALL addMedicine(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }");
				cs_addNewMed.setString(1, obj_medicine.getMedicineName());
				cs_addNewMed.setString(2, obj_medicine.getBarCodeNumber());
				cs_addNewMed.setString(3, obj_medicine.getBatchNo());
				cs_addNewMed.setDouble(4, obj_medicine.getNetWeight());
				cs_addNewMed.setFloat(5, obj_medicine.getPower());
				cs_addNewMed.setString(6, obj_medicine.getManufacturerName());
				cs_addNewMed.setString(7, obj_medicine.getManufacturingDate());
				cs_addNewMed.setString(8, obj_medicine.getExpiryDate());
				cs_addNewMed.setString(9, obj_medicine.getMedImagePath());
				cs_addNewMed.setString(10,  obj_medicine.getIngrImagePath());
				cs_addNewMed.setFloat(11, obj_medicine.getCostPrice());
				cs_addNewMed.setString(12, obj_medicine.getChemName());
				cs_addNewMed.setInt(13, obj_medicine.getStockCount());
				var_count = cs_addNewMed.executeUpdate();
				
				if(var_count == 1)
					var_isOkay = true;
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
					cs_addNewMed.close();
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
	
	public boolean updateMedicineMethod(Medicine obj_medicine)
	{
		CallableStatement cs_updateExistingMedicine = null;
		con = getConnection();
		int var_count = 2;
		boolean var_isOkay = false;
		
		if(con != null)
		{
			try 
			{
				cs_updateExistingMedicine = con.prepareCall("{ CALL updateMedicine(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }");
				cs_updateExistingMedicine.setString(1, obj_medicine.getMedicineName());
				cs_updateExistingMedicine.setString(2, obj_medicine.getBarCodeNumber());
				cs_updateExistingMedicine.setString(3, obj_medicine.getBatchNo());
				cs_updateExistingMedicine.setDouble(4, obj_medicine.getNetWeight());
				cs_updateExistingMedicine.setFloat(5, obj_medicine.getPower());
				cs_updateExistingMedicine.setString(6, obj_medicine.getManufacturerName());
				cs_updateExistingMedicine.setString(7, obj_medicine.getManufacturingDate());
				cs_updateExistingMedicine.setString(8, obj_medicine.getExpiryDate());
				cs_updateExistingMedicine.setFloat(9, obj_medicine.getCostPrice());
				cs_updateExistingMedicine.setString(10, obj_medicine.getChemName());
				cs_updateExistingMedicine.setInt(11, obj_medicine.getStockCount());
				var_count = cs_updateExistingMedicine.executeUpdate();
				
				if(var_count == 1)
					var_isOkay = true;
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
					cs_updateExistingMedicine.close();
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
	
	public Medicine getMedicine(String medName)
	{
		CallableStatement cs_fetchMedicine=null;
		con= getConnection();
		ResultSet rs_medicine = null;
		Medicine med_obj = null;
		if(con != null)
		{
			try 
			{
				cs_fetchMedicine=con.prepareCall("{ CALL GetMedicineInfo(?) }");
				cs_fetchMedicine.setString(1, medName);
				rs_medicine=cs_fetchMedicine.executeQuery();
				
				if(rs_medicine.next())
				{
					med_obj = new Medicine();
					med_obj.setBarCodeNumber(rs_medicine.getString("BarcodeNumber"));
					med_obj.setMedicineName(rs_medicine.getString("MedName"));
					med_obj.setBatchNo(rs_medicine.getString("BatchNo"));
					med_obj.setNetWeight(rs_medicine.getFloat("NetWeight"));
					med_obj.setPower(rs_medicine.getFloat("Power"));
					med_obj.setManufacturingDate(rs_medicine.getString("MfdDate"));
					med_obj.setManufacturerName(rs_medicine.getString("MfdBy"));
					med_obj.setExpiryDate(rs_medicine.getString("ExpDate"));
					med_obj.setCostPrice(rs_medicine.getFloat("Cost"));
					med_obj.setIngrImagePath(rs_medicine.getString("ingredientImg"));
					med_obj.setMedImagePath(rs_medicine.getString("image"));
					med_obj.setStockCount(rs_medicine.getInt("stock"));
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
					cs_fetchMedicine.close();
					rs_medicine.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		} // if
		
		return med_obj;
	}
	
	public boolean deleteMedicine(String medName)
	{
		CallableStatement cs_deleteMedicine = null;
		con = getConnection();
		int var_count = 2;
		boolean var_isOkay = false;
		
		if(con != null)
		{
			try
			{
				cs_deleteMedicine = con.prepareCall("{ CALL DeleteMedicine(?) }");
				cs_deleteMedicine.setString(1, medName);
				var_count = cs_deleteMedicine.executeUpdate();
				
				System.out.println(var_count);
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
					cs_deleteMedicine.close();
					closeConnection();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		
		return var_isOkay;
	}
}
