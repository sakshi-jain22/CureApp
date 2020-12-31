package com.cureapp.Controller;

public class Address 
{
	public Address() 
	{
		super();
		locality = "";
		city = "";
		state = "";
		pinCode = "";
	}
	
	public Address(String locality, String city, String state) 
	{
		super();
		this.locality = locality;
		this.city = city;
		this.state = state;
		this.pinCode = "";
	}
	
	public Address(String locality, String city, String state, String pincode) 
	{
		super();
		this.locality = locality;
		this.city = city;
		this.state = state;
		this.pinCode = pincode;
	}
	
	public void setStateAndPin(String stateSplitPincode)
	{
		String[] stateAndPinArray = stateSplitPincode.split("-");
		if(stateAndPinArray.length == 1)
		{
			state = stateAndPinArray[0];
			pinCode = "";
		}
		else if(stateAndPinArray.length > 1)
		{
			state = stateAndPinArray[0];
			pinCode = stateAndPinArray[1];
		}
	}
	
	private String locality;
	private String city;
	private String state;
	private String pinCode;
	
	public String getLocality() 
	{
		return locality;
	}
	public void setLocality(String locality) 
	{
		this.locality = locality;
	}
	public String getCity() 
	{
		return city;
	}
	public void setCity(String city) 
	{
		this.city = city;
	}
	public String getState() 
	{
		return state;
	}
	public void setState(String state) 
	{
		this.state = state;
	}
	
	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	@Override
	public String toString() {
		return "Address [locality=" + locality + ", city=" + city + ", state=" + state + ", pinCode=" + pinCode + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((locality == null) ? 0 : locality.hashCode());
		result = prime * result + ((pinCode == null) ? 0 : pinCode.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (locality == null) {
			if (other.locality != null)
				return false;
		} else if (!locality.equals(other.locality))
			return false;
		if (pinCode == null) {
			if (other.pinCode != null)
				return false;
		} else if (!pinCode.equals(other.pinCode))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		return true;
	}
	
}
