package com.cureapp.Model;

import java.sql.Connection;
import java.sql.SQLException;

public interface DataAccess 
{
	final String db_str_url = "jdbc:mysql://localhost:3308/cureapp";
	final String db_str_user = "root";
	final String db_str_password ="tiger";
	
	Connection getConnection();
	void closeConnection() throws SQLException;
}
