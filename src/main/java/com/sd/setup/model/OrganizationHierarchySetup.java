package com.sd.setup.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "org_hier_setup_info")
public class OrganizationHierarchySetup {

	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(name = "Organization_Name")
	private String levelNames;
	@Column(name = "Ownership_tracking")
	private String ownerShipTracking;
	@Column(name = "usage_tracking")
	private String usageTracking;
	@Column(name = "employee_mapping")
	private String employeeMapping;
	@Column(name = "support_function")
	private String supportFunctionAtLevel;
	@Column(name = "head_of_level")
	private String headOFLevelAppCable;
	@Column(name = "head_of_level_one")
	private String manyHdToOneLevel;
	@Column(name = "head_of_level_many")
	private String oneHdToManyLevel;
	@Column(name = "spoc_applicable")
	private String spocAppCable;
	@Column(name = "spoc_many")
	private String manySpocToOneLevel;
	@Column(name = "spoc_one")
	private String oneSpocToManyLevel;
	@Column(name = "asset_manager_applicable")
	private String amsAppCable;
	@Column(name = "asset_manager_one")
	private String manyAmsToOneLevel;
	@Column(name = "asset_manager_many")
	private String oneAmsToManyLevel;
	@Column(name = "validity_period_applicable")
	private String validityPeriodAppCabl;
	@Column(name = "depreciation_reporting")
	private String depritiationRepAppCabl;
	@Column(name="ownership_track_not_appcabl")
	private String ownerShipTrackingNotAppCabl;
	@Column(name="sf_track_not_appcabl")
	private String sfTrackingNotAppCabl;
	@Column(name="status")
	private int status;
	@Column(name="created_by")
	private String createdBy;
	@Column(name="created_date")
	private String createdOn;
	
	/*@OneToMany(mappedBy="setUpId")
	private Set<OrganizationMaster> organizationMaster;*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLevelNames() {
		return levelNames;
	}

	public void setLevelNames(String levelNames) {
		this.levelNames = levelNames;
	}

	public String getOwnerShipTracking() {
		return ownerShipTracking;
	}

	public void setOwnerShipTracking(String ownerShipTracking) {
		this.ownerShipTracking = ownerShipTracking;
	}

	public String getUsageTracking() {
		return usageTracking;
	}

	public void setUsageTracking(String usageTracking) {
		this.usageTracking = usageTracking;
	}

	public String getEmployeeMapping() {
		return employeeMapping;
	}

	public void setEmployeeMapping(String employeeMapping) {
		this.employeeMapping = employeeMapping;
	}

	public String getSupportFunctionAtLevel() {
		return supportFunctionAtLevel;
	}

	public void setSupportFunctionAtLevel(String supportFunctionAtLevel) {
		this.supportFunctionAtLevel = supportFunctionAtLevel;
	}

	public String getHeadOFLevelAppCable() {
		return headOFLevelAppCable;
	}

	public void setHeadOFLevelAppCable(String headOFLevelAppCable) {
		this.headOFLevelAppCable = headOFLevelAppCable;
	}

	public String getManyHdToOneLevel() {
		return manyHdToOneLevel;
	}

	public void setManyHdToOneLevel(String manyHdToOneLevel) {
		this.manyHdToOneLevel = manyHdToOneLevel;
	}

	public String getOneHdToManyLevel() {
		return oneHdToManyLevel;
	}

	public void setOneHdToManyLevel(String oneHdToManyLevel) {
		this.oneHdToManyLevel = oneHdToManyLevel;
	}

	public String getSpocAppCable() {
		return spocAppCable;
	}

	public void setSpocAppCable(String spocAppCable) {
		this.spocAppCable = spocAppCable;
	}

	public String getManySpocToOneLevel() {
		return manySpocToOneLevel;
	}

	public void setManySpocToOneLevel(String manySpocToOneLevel) {
		this.manySpocToOneLevel = manySpocToOneLevel;
	}

	public String getOneSpocToManyLevel() {
		return oneSpocToManyLevel;
	}

	public void setOneSpocToManyLevel(String oneSpocToManyLevel) {
		this.oneSpocToManyLevel = oneSpocToManyLevel;
	}

	public String getAmsAppCable() {
		return amsAppCable;
	}

	public void setAmsAppCable(String amsAppCable) {
		this.amsAppCable = amsAppCable;
	}

	public String getManyAmsToOneLevel() {
		return manyAmsToOneLevel;
	}

	public void setManyAmsToOneLevel(String manyAmsToOneLevel) {
		this.manyAmsToOneLevel = manyAmsToOneLevel;
	}

	public String getOneAmsToManyLevel() {
		return oneAmsToManyLevel;
	}

	public void setOneAmsToManyLevel(String oneAmsToManyLevel) {
		this.oneAmsToManyLevel = oneAmsToManyLevel;
	}

	public String getValidityPeriodAppCabl() {
		return validityPeriodAppCabl;
	}

	public void setValidityPeriodAppCabl(String validityPeriodAppCabl) {
		this.validityPeriodAppCabl = validityPeriodAppCabl;
	}

	public String getDepritiationRepAppCabl() {
		return depritiationRepAppCabl;
	}

	public void setDepritiationRepAppCabl(String depritiationRepAppCabl) {
		this.depritiationRepAppCabl = depritiationRepAppCabl;
	}

	public String getOwnerShipTrackingNotAppCabl() {
		return ownerShipTrackingNotAppCabl;
	}

	public void setOwnerShipTrackingNotAppCabl(String ownerShipTrackingNotAppCabl) {
		this.ownerShipTrackingNotAppCabl = ownerShipTrackingNotAppCabl;
	}

	public String getSfTrackingNotAppCabl() {
		return sfTrackingNotAppCabl;
	}

	public void setSfTrackingNotAppCabl(String sfTrackingNotAppCabl) {
		this.sfTrackingNotAppCabl = sfTrackingNotAppCabl;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}

	/*public Set<OrganizationMaster> getOrganizationMaster() {
		return organizationMaster;
	}

	public void setOrganizationMaster(Set<OrganizationMaster> organizationMaster) {
		this.organizationMaster = organizationMaster;
	}*/
	
}
