package com.sd.setup.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="enterprise_setup")
public class EnterpriseSetup {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="multiple_legal_entitys", nullable=false)
	private String multipleLegalEntitys;
	
	@Column(name="no_of_legal_entitys")
	private int noOfLegalEntitys;
	
	@Column(name="email_accross")
	private String emailAccross;
	
	@Column(name="server_accross")
	private String serverAccross;
	
	@Column(name="created_by",nullable=true)
	private String createdBy;
	
	@Column(name="created_on",nullable=true)
	@Temporal(TemporalType.DATE)
	private Date createdOn;
		
	@Column(name="update_on",nullable=true)
	@Temporal(TemporalType.DATE)
	private Date updatedOn;
	
	@Column(name="tracking")
	private String tracking;
	
	@Column(name="deperciation")
	private String depreciation;
	
	@Column(name="status",nullable=true)
	private int status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMultipleLegalEntitys() {
		return multipleLegalEntitys;
	}

	public void setMultipleLegalEntitys(String multipleLegalEntitys) {
		this.multipleLegalEntitys = multipleLegalEntitys;
	}

	public int getNoOfLegalEntitys() {
		return noOfLegalEntitys;
	}

	public void setNoOfLegalEntitys(int noOfLegalEntitys) {
		this.noOfLegalEntitys = noOfLegalEntitys;
	}

	public String getEmailAccross() {
		return emailAccross;
	}

	public void setEmailAccross(String emailAccross) {
		this.emailAccross = emailAccross;
	}

	public String getServerAccross() {
		return serverAccross;
	}

	public void setServerAccross(String serverAccross) {
		this.serverAccross = serverAccross;
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

	public String getTracking() {
		return tracking;
	}

	public void setTracking(String tracking) {
		this.tracking = tracking;
	}

	public String getDepreciation() {
		return depreciation;
	}

	public void setDepreciation(String depreciation) {
		this.depreciation = depreciation;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
}
