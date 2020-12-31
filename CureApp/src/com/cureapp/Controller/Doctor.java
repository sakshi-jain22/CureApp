package com.cureapp.Controller;

import java.io.Serializable;
import java.util.Arrays;

public class Doctor implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6284902995129804690L;

	public Doctor() {
		super();
		doctorID = null;
		password = null;
		name = null;
		specialization = null;
		qualifications = null;
		contactNo = null;
		hospitalName = null;
		docAddress = null;
		this.consultationFees = 0.0;
	}
	
	public Doctor(String doctorID, char[] password, String name, String specialization, String qualifications,
			String contactNo, String hospitalName, Address docAddress, double fees) {
		super();
		this.doctorID = doctorID;
		this.password = password;
		this.name = name;
		this.specialization = specialization;
		this.qualifications = qualifications;
		this.contactNo = contactNo;
		this.hospitalName = hospitalName;
		this.docAddress = docAddress;
		this.consultationFees = fees;
	}
	
	private String doctorID;
	private char[] password;
	private String name;
	private String specialization;
	private String qualifications;
	private String contactNo;
	private String hospitalName;
	private Address docAddress;
	private double consultationFees;
	
	public String getDoctorID() {
		return doctorID;
	}
	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}
	public char[] getPassword() {
		return password;
	}
	public void setPassword(char[] password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getQualifications() {
		return qualifications;
	}
	public void setQualifications(String qualifications) {
		this.qualifications = qualifications;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public Address getDocAddress() {
		return docAddress;
	}
	public void setDocAddress(Address docAddress) {
		this.docAddress = docAddress;
	}
	
	public double getConsultationFees() {
		return consultationFees;
	}

	public void setConsultationFees(double consultationFees) {
		this.consultationFees = consultationFees;
	}

	@Override
	public String toString() {
		return "Doctor [doctorID=" + doctorID + ", password=" + Arrays.toString(password) + ", name=" + name
				+ ", specialization=" + specialization + ", qualifications=" + qualifications + ", contactNo="
				+ contactNo + ", hospitalName=" + hospitalName + ", docAddress=" + docAddress + ", consultationFees="
				+ consultationFees + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(consultationFees);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((contactNo == null) ? 0 : contactNo.hashCode());
		result = prime * result + ((docAddress == null) ? 0 : docAddress.hashCode());
		result = prime * result + ((doctorID == null) ? 0 : doctorID.hashCode());
		result = prime * result + ((hospitalName == null) ? 0 : hospitalName.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + Arrays.hashCode(password);
		result = prime * result + ((qualifications == null) ? 0 : qualifications.hashCode());
		result = prime * result + ((specialization == null) ? 0 : specialization.hashCode());
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
		Doctor other = (Doctor) obj;
		if (Double.doubleToLongBits(consultationFees) != Double.doubleToLongBits(other.consultationFees))
			return false;
		if (contactNo == null) {
			if (other.contactNo != null)
				return false;
		} else if (!contactNo.equals(other.contactNo))
			return false;
		if (docAddress == null) {
			if (other.docAddress != null)
				return false;
		} else if (!docAddress.equals(other.docAddress))
			return false;
		if (doctorID == null) {
			if (other.doctorID != null)
				return false;
		} else if (!doctorID.equals(other.doctorID))
			return false;
		if (hospitalName == null) {
			if (other.hospitalName != null)
				return false;
		} else if (!hospitalName.equals(other.hospitalName))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (!Arrays.equals(password, other.password))
			return false;
		if (qualifications == null) {
			if (other.qualifications != null)
				return false;
		} else if (!qualifications.equals(other.qualifications))
			return false;
		if (specialization == null) {
			if (other.specialization != null)
				return false;
		} else if (!specialization.equals(other.specialization))
			return false;
		return true;
	}

}
