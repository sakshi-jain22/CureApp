package com.cureapp.Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.cureapp.Controller.Chemist;

public class ChemistDao implements DataAccess
{
	Connection con = null;
	private static ChemistDao instance = null;
	
	private ChemistDao()
	{
		super();
	}
	
	public static ChemistDao getInstance()
	{
		if(instance == null)
		{
			synchronized(ChemistDao.class)
			{
				if(instance == null)
					instance = new ChemistDao();
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
	
	public boolean authentication(Chemist dao_chemistData)
	{
		int int_count = 0;
		CallableStatement cs_login = null;
		boolean bool_isValidate = false;
		con = getConnection();
		
		if(con != null)
		{
			try
			{
				cs_login = con.prepareCall("{CALL ChemLogin(?,?,?)}");
				cs_login.setString(1, dao_chemistData.getUsername());
				cs_login.setString(2, charToString(dao_chemistData.getPasswd()));
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
	
	private String charToString(char[] param)
	{
		StringBuilder stringBuilder = new StringBuilder();
		for(int i=0; i<param.length; i++)
			stringBuilder.append(param[i]);
		return stringBuilder.toString();
	}
}
