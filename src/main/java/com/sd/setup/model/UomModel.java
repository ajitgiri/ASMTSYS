/**
 * @author Ranjan Kumar Sahu
 * created on:26/06/2014
 * Model Page for Database as well as form page for jsp
 */
package com.sd.setup.model;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="uom_table")
public class UomModel {
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@NotEmpty
	@Column(name="uom_code")
	private String uom_code;
	@NotEmpty
	@Size(min=2,max=10)
	@Column(name="uom_name")
	private String uom_name;
	@Column(name="created_by")
	private String created_by;
	@Column(name="created_on")
	private Date created_on;
	@Column(name="status")
	private int status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUom_code() {
		return uom_code;
	}
	public void setUom_code(String uom_code) {
		this.uom_code = uom_code;
	}
	public String getUom_name() {
		return uom_name;
	}
	public void setUom_name(String uom_name) {
		this.uom_name = uom_name;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
