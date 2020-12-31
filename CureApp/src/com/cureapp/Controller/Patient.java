package com.cureapp.Controller;

import java.io.Serializable;
import java.util.Arrays;

public class Patient implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1202668430438469545L;
	public String PatientID;
	private char[] password;
	private  String name;
	private String dob;
	private String contactNo;
	private Address deliveryAddress;
	private int isAppointed;
	private String docId;
	
	public Patient()
	{
		this.PatientID = null;
		this.password = null;
		this.name = null;
		this.dob=null;
		this.contactNo = null;
		this.deliveryAddress = null;
		this.setIsAppointed(0);
		this.docId = null;
	}
	
	public Patient(String pid,String pswd,String pname,String DOB,String contact,String docid, Address addr)
	{
		this.PatientID=pid;
		this.password=pswd.toCharArray();
		this.name=pname;
		this.dob=DOB;
		this.contactNo=contact;
		this.deliveryAddress = addr;
		this.setIsAppointed(0);
		this.docId=docid;
	}
	
	public Patient(String pid,String pswd,String pname,String DOB,String contact,String docid, Address addr, int isAppointed)
	{
		this.PatientID=pid;
		this.password=pswd.toCharArray();
		this.name=pname;
		this.dob=DOB;
		this.contactNo=contact;
		this.deliveryAddress = addr;
		this.setIsAppointed(isAppointed);
		this.docId=docid;
	}
	
	public String getPatientid()
	{
		return this.PatientID;
	}
	
	public void setPatientid(String id)
	{
		this.PatientID=id;
	}
	
	public char[] getPassword()
	{
		return this.password;
	}
	
	public void setPassword(char[] passwrd)
	{
		this.password=passwrd;
	}
	
	public String getName()
	{
		return this.name;
	}
	
	public void setName(String name)
	{
		this.name=name;
	}
	
	public String getDOB()
	{
		return this.dob;
	}
	
	public void setDOB(String dob)
	{
		this.dob=dob;
	}
	
	public String getContact()
	{
		return this.contactNo;
	}
	
	public void setContact(String contact)
	{
		this.contactNo=contact;
	}
	
	public Address getAddress() {
		return deliveryAddress;
	}

	public void setAddress(Address deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public int getIsAppointed() {
		return isAppointed;
	}

	public void setIsAppointed(int isAppointed) {
		this.isAppointed = isAppointed;
	}

	public String getDocId()
	{
		return this.docId;
	}
	public void setDocId(String docID)
	{
		this.docId=docID;
	}

	@Override
	public String toString() {
		return "Patient [PatientID=" + PatientID + ", password=" + Arrays.toString(password) + ", name=" + name
				+ ", dob=" + dob + ", contactNo=" + contactNo + ", deliveryAddress=" + deliveryAddress
				+ ", isAppointed=" + isAppointed + ", docId=" + docId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((PatientID == null) ? 0 : PatientID.hashCode());
		result = prime * result + ((contactNo == null) ? 0 : contactNo.hashCode());
		result = prime * result + ((deliveryAddress == null) ? 0 : deliveryAddress.hashCode());
		result = prime * result + ((dob == null) ? 0 : dob.hashCode());
		result = prime * result + ((docId == null) ? 0 : docId.hashCode());
		result = prime * result + isAppointed;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + Arrays.hashCode(password);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Patient))
			return false;
		Patient other = (Patient) obj;
		if (PatientID == null) {
			if (other.PatientID != null)
				return false;
		} else if (!PatientID.equals(other.PatientID))
			return false;
		if (contactNo == null) {
			if (other.contactNo != null)
				return false;
		} else if (!contactNo.equals(other.contactNo))
			return false;
		if (deliveryAddress == null) {
			if (other.deliveryAddress != null)
				return false;
		} else if (!deliveryAddress.equals(other.deliveryAddress))
			return false;
		if (dob == null) {
			if (other.dob != null)
				return false;
		} else if (!dob.equals(other.dob))
			return false;
		if (docId == null) {
			if (other.docId != null)
				return false;
		} else if (!docId.equals(other.docId))
			return false;
		if (isAppointed != other.isAppointed)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (!Arrays.equals(password, other.password))
			return false;
		return true;
	}
}
