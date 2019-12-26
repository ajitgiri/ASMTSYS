/**
 * 
 */
package com.sd.setup.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @author Vipin Singh
 *
 */

@Entity
@Table(name="shift_info")
public class Shift {

	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="shift_code",length=30)
	private String shiftCode;
	
	@Column(name="shift_name",length=30)
	private String shiftName;
	
	@Column(name="start_time",length=20)
	private String startTime;
	
	@Column(name="end_time",length=20)
	private String endTime;
	
	@Column(name="created_by")
	private String createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@Column(name="status")
	private int status;

	
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
	 * @return the shiftCode
	 */
	public String getShiftCode() {
		return shiftCode;
	}

	/**
	 * @param shiftCode the shiftCode to set
	 */
	public void setShiftCode(String shiftCode) {
		this.shiftCode = shiftCode;
	}

	/**
	 * @return the shiftName
	 */
	public String getShiftName() {
		return shiftName;
	}

	/**
	 * @param shiftName the shiftName to set
	 */
	public void setShiftName(String shiftName) {
		this.shiftName = shiftName;
	}

	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
