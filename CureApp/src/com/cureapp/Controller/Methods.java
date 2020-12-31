package com.cureapp.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Part;

public class Methods
{	
	public static String charToString(char[] param)
	{
		StringBuilder stringBuilder = new StringBuilder();
		for(int i=0; i<param.length; i++)
			stringBuilder.append(param[i]);
		return stringBuilder.toString();
	}
	
	public static String extractFileName(Part part)
	{
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items)
		{
			if(s.trim().startsWith("filename"))
			{
				return s.substring(s.indexOf("=")+2, s.length()-1);
			}
		}
		return "";
	}
	
	public static boolean checkDates(String mfgDate, String expDate)
	{
		try 
		{
			Date mfg = new SimpleDateFormat("yyyy-MM-dd").parse(mfgDate);
			Date exp = new SimpleDateFormat("yyyy-MM-dd").parse(expDate);
			
			if(mfg.compareTo(exp) < 0)
				return true;	
		} 
		catch (ParseException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public static String convertDatePattern(String dateString)
	{
		if(dateString!=null)
		{
			try
			{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dtInput = sdf.parse(dateString);
				
				sdf.applyPattern("dd MMMM yyyy");
				return sdf.format(dtInput);
			}
			catch (ParseException e) 
			{
				e.printStackTrace();
			}
		}
		return "Unknown";
	}
	
	public static int calculateAge(String dateString)
	{
		if(dateString!=null)
		{
			try
			{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dtInput = sdf.parse(dateString);
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(dtInput);
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				int date = cal.get(Calendar.DATE);
				LocalDate dob = LocalDate.of(year, month, date);
				LocalDate now = LocalDate.now();
				Period ageDiff = Period.between(dob, now);
				return ageDiff.getYears();
			}
			catch (ParseException e) 
			{
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public static String retrieveDateFiveDaysLater()
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 5);
        Date todate1 = cal.getTime();
        String fromdate = sdf.format(todate1);
		
		return fromdate;
	}
	
	public static String retrieveDateTenDaysLater()
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 10);
        Date todate1 = cal.getTime();
        String fromdate = sdf.format(todate1);
		
		return fromdate;
	}
	
	public static String getDayOfTheWeek(String dateString)
	{
		String day = null;
		if(dateString!=null)
		{
			try
			{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = sdf.parse(dateString);
				
				Calendar calendarInstance = Calendar.getInstance();
				calendarInstance.setTime(date);
				int dayOfWeek = calendarInstance.get(Calendar.DAY_OF_WEEK);
				
				switch(dayOfWeek)
				{
				case 1 : day = "Sunday";
						 break;
				case 2 : day = "Monday";
						 break;
				case 3 : day = "Tuesday";
						 break;
				case 4 : day = "Wednesday";
						 break;
				case 5 : day = "Thursday";
						 break;
				case 6 : day = "Friday";
						 break;
				case 7 : day = "Saturday";
						 break;
				default : day = null;
				}
			}
			catch (ParseException e)
			{
				e.printStackTrace();
			}
		}
			
		return day;
	}
	
	public static String formattedDateTenDaysLater()
	{
		return (String)(getDayOfTheWeek(retrieveDateTenDaysLater()) + ", " + convertDatePattern(retrieveDateTenDaysLater()));
	}
	
	public static String formattedDateFiveDaysLater()
	{
		return (String)(getDayOfTheWeek(retrieveDateFiveDaysLater()) + ", " + convertDatePattern(retrieveDateFiveDaysLater()));
	}
	
	public static String formattedAddress(Address address)
	{
		if(address!=null)
		{
			String addr = "<b>Locality: </b>" + address.getLocality() + " <b>City : </b> " + address.getCity() + " <b>State : </b>" + address.getState() + " - "
					+ address.getPinCode();
			return addr;
		}
		
		return "<b>Not disclosed.</b>";
	}
	
	public static void main(String[] args)
	{
		System.out.println(Methods.calculateAge("2002-06-16"));
	}
}
