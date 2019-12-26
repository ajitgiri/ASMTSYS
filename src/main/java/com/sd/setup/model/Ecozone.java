package com.sd.setup.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="economic_zone")
public class Ecozone {

	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="eco_code",length=30)
	private String ecomnomic_code;
	
	@Column(name="eco_name",length=30)
	private String ecomnomic_name;
	
	@Column(name="created_by",nullable=true)
	private String createdBy;
	
	@Column(name="created_on",nullable=true)
	private Date createdOn;
		
	@Column(name="update_on",nullable=true)
	private Date updatedOn;
	
	@Column(name="status",nullable=true)
	private int status;

	/**
	 * @return the ecomnomic_code
	 */
	public String getEcomnomic_code() {
		return ecomnomic_code;
	}

	/**
	 * @param ecomnomic_code the ecomnomic_code to set
	 */
	public void setEcomnomic_code(String ecomnomic_code) {
		this.ecomnomic_code = ecomnomic_code;
	}

	/**
	 * @return the ecomnomic_name
	 */
	public String getEcomnomic_name() {
		return ecomnomic_name;
	}

	/**
	 * @param ecomnomic_name the ecomnomic_name to set
	 */
	public void setEcomnomic_name(String ecomnomic_name) {
		this.ecomnomic_name = ecomnomic_name;
	}

	/**
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return createdBy;
	}

	/**
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	/**
	 * @return the createdOn
	 */
	public Date getCreatedOn() {
		return createdOn;
	}

	/**
	 * @param createdOn the createdOn to set
	 */
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	/**
	 * @return the updatedOn
	 */
	public Date getUpdatedOn() {
		return updatedOn;
	}

	/**
	 * @param updatedOn the updatedOn to set
	 */
	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	
}
