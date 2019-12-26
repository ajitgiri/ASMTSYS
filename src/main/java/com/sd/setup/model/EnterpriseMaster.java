package com.sd.setup.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table (name="enterprise_master")
public class EnterpriseMaster {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(name="entrprise_name")
	private String enterpriseName;
	@Column(name="address1")
	private String addressLineFirst;
	@Column(name="address2")
	private String addressLineSecond;
	@Column(name="address3")
	private String addressLineThird;
	@Column(name="address4")
	private String addressLineFour;
	@Column(name="city_name")
	private String cityName;
	@Column(name="state_name")
	private String stateName;
	@ManyToOne
	@JoinColumn(name="country_id")
	private Country countryId;
	@Column(name="zip_code")
	private String pinZipCode;
	@Column(name="port_no")
	private String portNo;
	@Column(name="mail_server")
	private String mailServer;
	@Column(name="servc_acc_pass")
	private String serviceAccPassword;
	@Column(name="servc_acc")
	private String serviceAccount;
	
	@Column(name="created_by", nullable=true)
	private String createdBy;
	
	@Column(name="created_on", nullable=true)
	@Temporal(TemporalType.DATE)
	private Date createdOn;
		
	@Column(name="update_on", nullable=true)
	@Temporal(TemporalType.DATE)
	private Date updatedOn;
	
	@Column(name="status", nullable=true)
	private int status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEnterpriseName() {
		return enterpriseName;
	}

	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}

	public String getAddressLineFirst() {
		return addressLineFirst;
	}

	public void setAddressLineFirst(String addressLineFirst) {
		this.addressLineFirst = addressLineFirst;
	}

	public String getAddressLineSecond() {
		return addressLineSecond;
	}

	public void setAddressLineSecond(String addressLineSecond) {
		this.addressLineSecond = addressLineSecond;
	}

	public String getAddressLineThird() {
		return addressLineThird;
	}

	public void setAddressLineThird(String addressLineThird) {
		this.addressLineThird = addressLineThird;
	}

	public String getAddressLineFour() {
		return addressLineFour;
	}

	public void setAddressLineFour(String addressLineFour) {
		this.addressLineFour = addressLineFour;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public Country getCountryId() {
		return countryId;
	}

	public void setCountryId(Country countryId) {
		this.countryId = countryId;
	}

	public String getPinZipCode() {
		return pinZipCode;
	}

	public void setPinZipCode(String pinZipCode) {
		this.pinZipCode = pinZipCode;
	}

	public String getPortNo() {
		return portNo;
	}

	public void setPortNo(String portNo) {
		this.portNo = portNo;
	}

	public String getMailServer() {
		return mailServer;
	}

	public void setMailServer(String mailServer) {
		this.mailServer = mailServer;
	}

	public String getServiceAccPassword() {
		return serviceAccPassword;
	}

	public void setServiceAccPassword(String serviceAccPassword) {
		this.serviceAccPassword = serviceAccPassword;
	}

	public String getServiceAccount() {
		return serviceAccount;
	}

	public void setServiceAccount(String serviceAccount) {
		this.serviceAccount = serviceAccount;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
