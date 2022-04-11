package com.ruoyi.kaisheng.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 北上表單对象 ks_gonorth
 * 
 * @author Sheng
 * @date 2022-03-30
 */
public class KsGonorth extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 流水號 */
	private Integer id;

	/** 北上單編號 */
	@Excel(name = "北上單編號")
	private String gonorthId;

	/** 聯單編號 */
	@Excel(name = "聯單編號")
	private String gonorthCouponNumber;

	/** 軟單編號 */
	@Excel(name = "軟單編號")
	private String gonorthSoftOrderNumber;

	/** 日期(北上單) */
	@JsonFormat(pattern = "yyyy-MM-dd")
	@Excel(name = "日期(北上單)", width = 30, dateFormat = "yyyy-MM-dd")
	private Date gonorthDate;

	/** 司機名稱 */
	@Excel(name = "司機名稱")
	private String gonorthDriver;

	/** 車牌號碼 */
	@Excel(name = "車牌號碼")
	private String gonorthLicensePlateNumber;

	/** 公司名稱 */
	@Excel(name = "公司名稱")
	private String gonorthCompany;

	/** 起點 */
	@Excel(name = "起點")
	private String gonorthOutset;

	/** 堆場 */
	@Excel(name = "堆場")
	private String gonorthYard;

	/** 現金 */
	@Excel(name = "現金")
	private String gonorthCash;

	/** 票發 */
	@Excel(name = "票發")
	private String gonorthBill;

	/** 貨物名稱 */
	@Excel(name = "貨物名稱")
	private String gonorthGoods;

	/** 司機出貨噸數 */
	@Excel(name = "司機出貨噸數")
	private BigDecimal gonorthGoodsMt;

	/** 收貨噸數 */
	@Excel(name = "收貨噸數")
	private BigDecimal gonorthGoodsCustomerMt;

	/** 司機單價 */
	@Excel(name = "司機單價")
	private BigDecimal gonorthGoodsPriceDriver;

	/** 扣發票金額 */
	@Excel(name = "扣發票金額")
	private BigDecimal gonorthBillTotal;

	/** 公司單價 */
	@Excel(name = "公司單價")
	private BigDecimal gonorthGoodsPriceCompany;

	/** 公司此趟運費 */
	@Excel(name = "公司此趟運費")
	private BigDecimal gonorthTotal;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setGonorthId(String gonorthId) {
		this.gonorthId = gonorthId;
	}

	public String getGonorthId() {
		return gonorthId;
	}

	public void setGonorthCouponNumber(String gonorthCouponNumber) {
		this.gonorthCouponNumber = gonorthCouponNumber;
	}

	public String getGonorthCouponNumber() {
		return gonorthCouponNumber;
	}

	public void setGonorthDate(Date gonorthDate) {
		this.gonorthDate = gonorthDate;
	}

	public void setGonorthSoftOrderNumber(String gonorthSoftOrderNumber) {
		this.gonorthSoftOrderNumber = gonorthSoftOrderNumber;
	}

	public String getGonorthSoftOrderNumber() {
		return gonorthSoftOrderNumber;
	}

	public Date getGonorthDate() {
		return gonorthDate;
	}

	public void setGonorthDriver(String gonorthDriver) {
		this.gonorthDriver = gonorthDriver;
	}

	public String getGonorthDriver() {
		return gonorthDriver;
	}

	public void setGonorthLicensePlateNumber(String gonorthLicensePlateNumber) {
		this.gonorthLicensePlateNumber = gonorthLicensePlateNumber;
	}

	public String getGonorthLicensePlateNumber() {
		return gonorthLicensePlateNumber;
	}

	public void setGonorthCompany(String gonorthCompany) {
		this.gonorthCompany = gonorthCompany;
	}

	public String getGonorthCompany() {
		return gonorthCompany;
	}

	public void setGonorthOutset(String gonorthOutset) {
		this.gonorthOutset = gonorthOutset;
	}

	public String getGonorthOutset() {
		return gonorthOutset;
	}

	public void setGonorthYard(String gonorthYard) {
		this.gonorthYard = gonorthYard;
	}

	public String getGonorthYard() {
		return gonorthYard;
	}

	public void setGonorthCash(String gonorthCash) {
		this.gonorthCash = gonorthCash;
	}

	public String getGonorthCash() {
		return gonorthCash;
	}

	public void setGonorthBill(String gonorthBill) {
		this.gonorthBill = gonorthBill;
	}

	public String getGonorthBill() {
		return gonorthBill;
	}

	public void setGonorthGoods(String gonorthGoods) {
		this.gonorthGoods = gonorthGoods;
	}

	public String getGonorthGoods() {
		return gonorthGoods;
	}

	public void setGonorthGoodsMt(BigDecimal gonorthGoodsMt) {
		this.gonorthGoodsMt = gonorthGoodsMt;
	}

	public BigDecimal getGonorthGoodsMt() {
		return gonorthGoodsMt;
	}

	public void setGonorthGoodsCustomerMt(BigDecimal gonorthGoodsCustomerMt) {
		this.gonorthGoodsCustomerMt = gonorthGoodsCustomerMt;
	}

	public BigDecimal getGonorthGoodsCustomerMt() {
		return gonorthGoodsCustomerMt;
	}

	public void setGonorthGoodsPriceDriver(BigDecimal gonorthGoodsPriceDriver) {
		this.gonorthGoodsPriceDriver = gonorthGoodsPriceDriver;
	}

	public BigDecimal getGonorthGoodsPriceDriver() {
		return gonorthGoodsPriceDriver;
	}

	public void setGonorthBillTotal(BigDecimal gonorthBillTotal) {
		this.gonorthBillTotal = gonorthBillTotal;
	}

	public BigDecimal getGonorthBillTotal() {
		return gonorthBillTotal;
	}

	public void setGonorthGoodsPriceCompany(BigDecimal gonorthGoodsPriceCompany) {
		this.gonorthGoodsPriceCompany = gonorthGoodsPriceCompany;
	}

	public BigDecimal getGonorthGoodsPriceCompany() {
		return gonorthGoodsPriceCompany;
	}

	public void setGonorthTotal(BigDecimal gonorthTotal) {
		this.gonorthTotal = gonorthTotal;
	}

	public BigDecimal getGonorthTotal() {
		return gonorthTotal;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId())
				.append("gonorthId", getGonorthId()).append("gonorthCouponNumber", getGonorthCouponNumber())
				.append("gonorthSoftOrderNumber", getGonorthSoftOrderNumber()).append("gonorthDate", getGonorthDate())
				.append("gonorthDriver", getGonorthDriver())
				.append("gonorthLicensePlateNumber", getGonorthLicensePlateNumber())
				.append("gonorthCompany", getGonorthCompany()).append("gonorthOutset", getGonorthOutset())
				.append("gonorthYard", getGonorthYard()).append("gonorthCash", getGonorthCash())
				.append("gonorthBill", getGonorthBill()).append("gonorthGoods", getGonorthGoods())
				.append("gonorthGoodsMt", getGonorthGoodsMt())
				.append("gonorthGoodsCustomerMt", getGonorthGoodsCustomerMt())
				.append("gonorthGoodsPriceDriver", getGonorthGoodsPriceDriver())
				.append("gonorthBillTotal", getGonorthBillTotal())
				.append("gonorthGoodsPriceCompany", getGonorthGoodsPriceCompany())
				.append("gonorthTotal", getGonorthTotal()).toString();
	}
}
