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
@Table(name="tagprefix_info")
public class TagPrefix {
	
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="asset_prefix")
	private String assetPrefix;
	@Column(name="accessory_prefix")
	private String accessoryPrefix;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="asset_major_category_id")
	private AssetMajorCategory assetMajorCategory;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="asset_minor_category_id")
	private AssetMinorCategory assetMinorCategory;

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
	 * @return the assetPrefix
	 */
	public String getAssetPrefix() {
		return assetPrefix;
	}

	/**
	 * @param assetPrefix the assetPrefix to set
	 */
	public void setAssetPrefix(String assetPrefix) {
		this.assetPrefix = assetPrefix;
	}

	/**
	 * @return the accessoryPrefix
	 */
	public String getAccessoryPrefix() {
		return accessoryPrefix;
	}

	/**
	 * @param accessoryPrefix the accessoryPrefix to set
	 */
	public void setAccessoryPrefix(String accessoryPrefix) {
		this.accessoryPrefix = accessoryPrefix;
	}

	/**
	 * @return the assetMajorCategory
	 */
	public AssetMajorCategory getAssetMajorCategory() {
		return assetMajorCategory;
	}

	/**
	 * @param assetMajorCategory the assetMajorCategory to set
	 */
	public void setAssetMajorCategory(AssetMajorCategory assetMajorCategory) {
		this.assetMajorCategory = assetMajorCategory;
	}

	/**
	 * @return the assetMinorCategory
	 */
	public AssetMinorCategory getAssetMinorCategory() {
		return assetMinorCategory;
	}

	/**
	 * @param assetMinorCategory the assetMinorCategory to set
	 */
	public void setAssetMinorCategory(AssetMinorCategory assetMinorCategory) {
		this.assetMinorCategory = assetMinorCategory;
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
