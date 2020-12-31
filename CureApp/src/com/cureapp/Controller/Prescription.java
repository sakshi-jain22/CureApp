package com.cureapp.Controller;

import java.util.TreeSet;

public class Prescription 
{
	private Doctor doctor;
	private Patient patient;
	private TreeSet<Medicine> medicineList;
	
	public Prescription()
	{
		doctor = new Doctor();
		patient = new Patient();
		medicineList = new TreeSet<Medicine>();
	}
	
	public Doctor getDoctor() 
	{
		return doctor;
	}
	public void setDoctor(Doctor doctor) 
	{
		this.doctor = doctor;
	}
	public Patient getPatient() 
	{
		return patient;
	}
	public void setPatient(Patient patient) 
	{
		this.patient = patient;
	}
	public TreeSet<Medicine> getMedicineList() 
	{
		return medicineList;
	}
	public void setMedicineList(TreeSet<Medicine> medicineList) 
	{
		this.medicineList = medicineList;
	}
}
