package com.ruoyi.kaisheng.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 員工表單对象 ks_employee
 * 
 * @author sheng
 * @date 2022-02-19
 */
public class KsEmployee extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 流水號 */
	private Integer id;

	/** 員工編號 */
	@Excel(name = "員工編號")
	private String employeeId;

	/** 員工姓名 */
	@Excel(name = "員工姓名")
	private String name;

	/** 綽號 */
	@Excel(name = "綽號")
	private String aka;

	/** 手機 */
	@Excel(name = "手機")
	private String phoneNumber;

	/** 身分證 */
	@Excel(name = "身分證")
	private String idCard;

	/** 姓別 */
	@Excel(name = "姓別")
	private String sex;

	/** 家電 */
	@Excel(name = "家電")
	private String homeTelephoneNumber;

	/** 住址 */
	@Excel(name = "住址")
	private String address;

	/** 隸屬公司 */
	@Excel(name = "隸屬公司")
	private String company;

	/** 職稱 */
	@Excel(name = "職稱")
	private String staffPositions;

	/** 入職日期 */
	@JsonFormat(pattern = "yyyy-MM-dd")
	@Excel(name = "入職日期", width = 30, dateFormat = "yyyy-MM-dd")
	private Date entryDate;

	/** 離職日期 */
	@JsonFormat(pattern = "yyyy-MM-dd")
	@Excel(name = "離職日期", width = 30, dateFormat = "yyyy-MM-dd")
	private Date resignationDate;

	/** 離職原因 */
	@Excel(name = "離職原因")
	private String reasonForLeaving;

	@Excel(name = "北上單數")
	private int gonorthCount;
	@Excel(name = "北上營業額")
	private BigDecimal gonorthRevenue;
	@Excel(name = "南下單數")
	private int downboundCount;
	@Excel(name = "南下營業額")
	private BigDecimal downboundRevenue;

	@Excel(name = "總營業額")
	private BigDecimal revenueTotal;

	@Excel(name = "日常支出單數")
	private int expenseCount;
	@Excel(name = "日常支出總額")
	private BigDecimal expenseTotal;

	@Excel(name = "加油單數")
	private int oliCount;
	@Excel(name = "油錢總額")
	private BigDecimal oliAmount;

	@Excel(name = "司機營業額")
	private BigDecimal driverRevenue;
	@Excel(name = "司機薪資")
	private BigDecimal salary;

	// 南下單子
	private List<KsDownbound> downboundList;

	public List<KsDownbound> getDownboundList() {
		return downboundList;
	}

	public void setDownboundList(List<KsDownbound> downboundList) {
		this.downboundList = downboundList;
	}

	// 北上單子
	private List<KsGonorth> gonorthList;

	public List<KsGonorth> getGonorthList() {
		return gonorthList;
	}

	public void setGonorthList(List<KsGonorth> gonorthList) {
		this.gonorthList = gonorthList;
	}

	// 日常支出單子
	private List<KsExpense> expenseList;

	public List<KsExpense> getExpenseList() {
		return expenseList;
	}

	public void setExpenseList(List<KsExpense> expenseList) {
		this.expenseList = expenseList;
	}

	public int getGonorthCount() {
		return gonorthCount;
	}

	public void setGonorthCount(int gonorthCount) {
		this.gonorthCount = gonorthCount;
	}

	public int getDownboundCount() {
		return downboundCount;
	}

	public void setDownboundCount(int downboundCount) {
		this.downboundCount = downboundCount;
	}

	public BigDecimal getOliAmount() {
		return oliAmount;
	}

	public void setOliAmount(BigDecimal oliAmount) {
		this.oliAmount = oliAmount;
	}

	public BigDecimal getSalary() {
		return salary;
	}

	public void setSalary(BigDecimal salary) {
		this.salary = salary;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setAka(String aka) {
		this.aka = aka;
	}

	public String getAka() {
		return aka;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSex() {
		return sex;
	}

	public void setHomeTelephoneNumber(String homeTelephoneNumber) {
		this.homeTelephoneNumber = homeTelephoneNumber;
	}

	public String getHomeTelephoneNumber() {
		return homeTelephoneNumber;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompany() {
		return company;
	}

	public void setStaffPositions(String staffPositions) {
		this.staffPositions = staffPositions;
	}

	public String getStaffPositions() {
		return staffPositions;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setResignationDate(Date resignationDate) {
		this.resignationDate = resignationDate;
	}

	public Date getResignationDate() {
		return resignationDate;
	}

	public void setReasonForLeaving(String reasonForLeaving) {
		this.reasonForLeaving = reasonForLeaving;
	}

	public String getReasonForLeaving() {
		return reasonForLeaving;
	}

	public int getExpenseCount() {
		return expenseCount;
	}

	public void setExpenseCount(int expenseCount) {
		this.expenseCount = expenseCount;
	}

	public BigDecimal getGonorthRevenue() {
		return gonorthRevenue;
	}

	public void setGonorthRevenue(BigDecimal gonorthRevenue) {
		this.gonorthRevenue = gonorthRevenue;
	}

	public BigDecimal getDownboundRevenue() {
		return downboundRevenue;
	}

	public void setDownboundRevenue(BigDecimal downboundRevenue) {
		this.downboundRevenue = downboundRevenue;
	}

	public BigDecimal getExpenseTotal() {
		return expenseTotal;
	}

	public void setExpenseTotal(BigDecimal expenseTotal) {
		this.expenseTotal = expenseTotal;
	}

	public int getOliCount() {
		return oliCount;
	}

	public void setOliCount(int oliCount) {
		this.oliCount = oliCount;
	}

	public BigDecimal getRevenueTotal() {
		return revenueTotal;
	}

	public void setRevenueTotal(BigDecimal revenueTotal) {
		this.revenueTotal = revenueTotal;
	}

	public BigDecimal getDriverRevenue() {
		return driverRevenue;
	}

	public void setDriverRevenue(BigDecimal driverRevenue) {
		this.driverRevenue = driverRevenue;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId())
				.append("employeeId", getEmployeeId()).append("name", getName()).append("aka", getAka())
				.append("phoneNumber", getPhoneNumber()).append("idCard", getIdCard()).append("sex", getSex())
				.append("homeTelephoneNumber", getHomeTelephoneNumber()).append("address", getAddress())
				.append("company", getCompany()).append("staffPositions", getStaffPositions())
				.append("entryDate", getEntryDate()).append("resignationDate", getResignationDate())
				.append("reasonForLeaving", getReasonForLeaving()).toString();
	}
}
