package com.cureapp.Controller;

import java.io.Serializable;

public class Medicine implements Serializable, Comparable<Medicine>
{
	/**
	 * serialVersionUID associates a version number to verify that the loaded classes fot the obejects are compatible w.r.t serialization.
	 */
	private static final long serialVersionUID = 3348588869254269462L;
	private String medicineName;
	private String barCodeNumber;
	private String batchNo;
	private double netWeight;
	private float power;
	private String manufacturerName;
	private String manufacturingDate;
	private String expiryDate;
	private String medImagePath;
	private String ingrImagePath;
	private float costPrice;
	private int stockCount;
	private String chemName;
	private int isActive;
	
	public Medicine()
	{
		this.medicineName = null;
		this.barCodeNumber = null;
		this.batchNo = null;
		this.netWeight = 0.0;
		this.power = 0.0F;
		this.manufacturerName = null;
		this.manufacturingDate = null;
		this.expiryDate = null;
		this.medImagePath = null;
		this.ingrImagePath = null;
		this.costPrice = 0.0F;
		this.stockCount = 0;
		this.chemName = null;
		this.isActive = 1;
	}
	
	public Medicine(String medName, String barCode, String batchNo, double netWgt, float power, String mfdBy, 
			String mfdDate, String expDate, String filename1, String filename2, float cost,int stock , String chemName) throws Exception
	{
		if(Methods.checkDates(mfdDate, expDate) == false)
		{
			throw new Exception("Expiry Date is before Manufacturing Date.");
		}
		
		this.medicineName = medName;
		this.barCodeNumber = barCode;
		this.batchNo = batchNo;
		this.netWeight = netWgt;
		this.power = power;
		this.manufacturerName = mfdBy;
		this.manufacturingDate = mfdDate;
		this.expiryDate = expDate;
		this.medImagePath = filename1;
		this.ingrImagePath = filename2;
		this.costPrice = cost;
		this.stockCount = stock;
		this.chemName = chemName;
		this.isActive = 1;
	}
	
	/**
	 * @return the medicineName
	 */
	public String getMedicineName() {
		return medicineName;
	}
	/**
	 * @param medicineName the medicineName to set
	 */
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	/**
	 * @return the barCodeNumber
	 */
	public String getBarCodeNumber() {
		return barCodeNumber;
	}
	/**
	 * @param barCodeNumber the barCodeNumber to set
	 */
	public void setBarCodeNumber(String barCodeNumber) {
		this.barCodeNumber = barCodeNumber;
	}
	/**
	 * @return the batchNo
	 */
	public String getBatchNo() {
		return batchNo;
	}
	/**
	 * @param batchNo the batchNo to set
	 */
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	/**
	 * @return the netWeight
	 */
	public double getNetWeight() {
		return netWeight;
	}
	/**
	 * @param netWeight the netWeight to set
	 */
	public void setNetWeight(double netWeight) {
		this.netWeight = netWeight;
	}
	/**
	 * @return the power
	 */
	public float getPower() {
		return power;
	}
	/**
	 * @param power the power to set
	 */
	public void setPower(float power) {
		this.power = power;
	}
	/**
	 * @return the manufacturerName
	 */
	public String getManufacturerName() {
		return manufacturerName;
	}
	/**
	 * @param manufacturerName the manufacturerName to set
	 */
	public void setManufacturerName(String manufacturerName) {
		this.manufacturerName = manufacturerName;
	}
	/**
	 * @return the manufacturingDate
	 */
	public String getManufacturingDate() {
		return manufacturingDate;
	}
	/**
	 * @param manufacturingDate the manufacturingDate to set
	 */
	public void setManufacturingDate(String manufacturingDate) {
		this.manufacturingDate = manufacturingDate;
	}
	/**
	 * @return the expiryDate
	 */
	public String getExpiryDate() {
		return expiryDate;
	}
	/**
	 * @param expiryDate the expiryDate to set
	 */
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	/**
	 * @return the medImagePath
	 */
	public String getMedImagePath() {
		return medImagePath;
	}
	/**
	 * @param medImagePath the medImagePath to set
	 */
	public void setMedImagePath(String medImagePath) {
		this.medImagePath = medImagePath;
	}
	/**
	 * @return the ingrImagePath
	 */
	public String getIngrImagePath() {
		return ingrImagePath;
	}
	/**
	 * @param ingrImagePath the ingrImagePath to set
	 */
	public void setIngrImagePath(String ingrImagePath) {
		this.ingrImagePath = ingrImagePath;
	}
	/**
	 * @return the costPrice
	 */
	public float getCostPrice() {
		return costPrice;
	}
	/**
	 * @param costPrice the costPrice to set
	 */
	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}
	public int getStockCount() {
		return stockCount;
	}

	public void setStockCount(int stockCount) {
		this.stockCount = stockCount;
	}

	/**
	 * @return the chemName
	 */
	public String getChemName() {
		return chemName;
	}
	/**
	 * @param chemName the chemName to set
	 */
	public void setChemName(String chemName) {
		this.chemName = chemName;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "Medicine [medicineName=" + medicineName + ", barCodeNumber=" + barCodeNumber + ", batchNo=" + batchNo
				+ ", netWeight=" + netWeight + ", power=" + power + ", manufacturerName=" + manufacturerName
				+ ", manufacturingDate=" + manufacturingDate + ", expiryDate=" + expiryDate + ", medImagePath="
				+ medImagePath + ", ingrImagePath=" + ingrImagePath + ", costPrice=" + costPrice + ", stockCount="
				+ stockCount + ", chemName=" + chemName + ", isActive=" + isActive + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((barCodeNumber == null) ? 0 : barCodeNumber.hashCode());
		result = prime * result + ((batchNo == null) ? 0 : batchNo.hashCode());
		result = prime * result + ((chemName == null) ? 0 : chemName.hashCode());
		result = prime * result + Float.floatToIntBits(costPrice);
		result = prime * result + ((expiryDate == null) ? 0 : expiryDate.hashCode());
		result = prime * result + ((ingrImagePath == null) ? 0 : ingrImagePath.hashCode());
		result = prime * result + isActive;
		result = prime * result + ((manufacturerName == null) ? 0 : manufacturerName.hashCode());
		result = prime * result + ((manufacturingDate == null) ? 0 : manufacturingDate.hashCode());
		result = prime * result + ((medImagePath == null) ? 0 : medImagePath.hashCode());
		result = prime * result + ((medicineName == null) ? 0 : medicineName.hashCode());
		long temp;
		temp = Double.doubleToLongBits(netWeight);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + Float.floatToIntBits(power);
		result = prime * result + stockCount;
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
		Medicine other = (Medicine) obj;
		if (barCodeNumber == null) {
			if (other.barCodeNumber != null)
				return false;
		} else if (!barCodeNumber.equals(other.barCodeNumber))
			return false;
		if (batchNo == null) {
			if (other.batchNo != null)
				return false;
		} else if (!batchNo.equals(other.batchNo))
			return false;
		if (chemName == null) {
			if (other.chemName != null)
				return false;
		} else if (!chemName.equals(other.chemName))
			return false;
		if (Float.floatToIntBits(costPrice) != Float.floatToIntBits(other.costPrice))
			return false;
		if (expiryDate == null) {
			if (other.expiryDate != null)
				return false;
		} else if (!expiryDate.equals(other.expiryDate))
			return false;
		if (ingrImagePath == null) {
			if (other.ingrImagePath != null)
				return false;
		} else if (!ingrImagePath.equals(other.ingrImagePath))
			return false;
		if (isActive != other.isActive)
			return false;
		if (manufacturerName == null) {
			if (other.manufacturerName != null)
				return false;
		} else if (!manufacturerName.equals(other.manufacturerName))
			return false;
		if (manufacturingDate == null) {
			if (other.manufacturingDate != null)
				return false;
		} else if (!manufacturingDate.equals(other.manufacturingDate))
			return false;
		if (medImagePath == null) {
			if (other.medImagePath != null)
				return false;
		} else if (!medImagePath.equals(other.medImagePath))
			return false;
		if (medicineName == null) {
			if (other.medicineName != null)
				return false;
		} else if (!medicineName.equals(other.medicineName))
			return false;
		if (Double.doubleToLongBits(netWeight) != Double.doubleToLongBits(other.netWeight))
			return false;
		if (Float.floatToIntBits(power) != Float.floatToIntBits(other.power))
			return false;
		if (stockCount != other.stockCount)
			return false;
		return true;
	}

	@Override
	public int compareTo(Medicine o) 
	{
		if(o.medicineName.compareTo(medicineName) == 0)
			return 0;
		else if(o.medicineName.compareTo(medicineName) == 1)
			return 1;
		else
			return -1;
	}
}
