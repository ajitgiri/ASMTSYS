/**
 * 
 */
package com.sd.setup.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author SONY
 *
 */

@Entity
@Table(name="unit_info")
public class Unit{
	
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="unit_type")
	private String unitType;
	@Column(name="unit_code")
	private String unitCode;
	@Column(name="unit_no")
	private String unitNo;
	@Column(name="created_on")
	private Date createdOn;
	@Column(name="created_by")
	private String createdBy;
	@Column(name="status")
	private int status;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="emp_id")
	private Ecozone ecozone;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="legal_id")
	private LegalEntityMaster legalentityMaster;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the unitType
	 */
	public String getUnitType() {
		return unitType;
	}
	/**
	 * @param unitType the unitType to set
	 */
	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}
	/**
	 * @return the unitCode
	 */
	public String getUnitCode() {
		return unitCode;
	}
	/**
	 * @param unitCode the unitCode to set
	 */
	public void setUnitCode(String unitCode) {
		this.unitCode = unitCode;
	}
	/**
	 * @return the unitNo
	 */
	public String getUnitNo() {
		return unitNo;
	}
	/**
	 * @param unitNo the unitNo to set
	 */
	public void setUnitNo(String unitNo) {
		this.unitNo = unitNo;
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
	/**
	 * @return the ecozone
	 */
	public Ecozone getEcozone() {
		return ecozone;
	}
	/**
	 * @param ecozone the ecozone to set
	 */
	public void setEcozone(Ecozone ecozone) {
		this.ecozone = ecozone;
	}
	/**
	 * @return the legalentityMaster
	 */
	public LegalEntityMaster getLegalentityMaster() {
		return legalentityMaster;
	}
	/**
	 * @param legalentityMaster the legalentityMaster to set
	 */
	public void setLegalentityMaster(LegalEntityMaster legalentityMaster) {
		this.legalentityMaster = legalentityMaster;
	}
	
	
	
	
}
