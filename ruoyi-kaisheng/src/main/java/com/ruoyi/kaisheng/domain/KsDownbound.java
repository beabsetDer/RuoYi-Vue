package com.ruoyi.kaisheng.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 南下表單对象 ks_downbound
 * 
 * @author Sheng
 * @date 2022-02-22
 */
public class KsDownbound extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 流水號 */
	private Integer id;

	/** 南下單編號 */
	@Excel(name = "南下單編號")
	private String downboundId;

	/** 日期(南下單) */
	@JsonFormat(pattern = "yyyy-MM-dd")
	@Excel(name = "日期(南下單)", width = 30, dateFormat = "yyyy-MM-dd")
	private Date downboundDate;

	/** 司機名稱 */
	@Excel(name = "司機名稱")
	private String downboundDriver;

	/** 車牌號碼 */
	@Excel(name = "車牌號碼")
	private String downboundLicensePlateNumber;

	/** 公司名稱 */
	@Excel(name = "公司名稱")
	private String downboundCompany;

	/** 起點 */
	@Excel(name = "起點")
	private String downboundOutset;

	/** 堆場 */
	@Excel(name = "堆場")
	private String downboundYard;

	/** 現金 */
	@Excel(name = "現金")
	private String downboundCash;

	/** 發票 */
	@Excel(name = "發票")
	private String downboundBill;

	/** 貨物名稱 */
	@Excel(name = "貨物名稱")
	private String downboundGoods;

	/** 貨物噸數 */
	@Excel(name = "貨物噸數")
	private BigDecimal downboundGoodsMt;

	/** 貨物單價 */
	@Excel(name = "貨物單價")
	private BigDecimal downboundGoodsPrice;

	/** 此趟運費 */
	@Excel(name = "此趟運費")
	private BigDecimal downboundTotal;

	/** 聯單編號 */
	@Excel(name = "聯單編號")
	private String downboundCouponNumber;

	/** 收貨噸數 */
	@Excel(name = "收貨噸數")
	private BigDecimal downboundGoodsCustomerMt;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setDownboundId(String downboundId) {
		this.downboundId = downboundId;
	}

	public String getDownboundId() {
		return downboundId;
	}

	public void setDownboundDate(Date downboundDate) {
		this.downboundDate = downboundDate;
	}

	public Date getDownboundDate() {
		return downboundDate;
	}

	public void setDownboundDriver(String downboundDriver) {
		this.downboundDriver = downboundDriver;
	}

	public String getDownboundDriver() {
		return downboundDriver;
	}

	public void setDownboundLicensePlateNumber(String downboundLicensePlateNumber) {
		this.downboundLicensePlateNumber = downboundLicensePlateNumber;
	}

	public String getDownboundLicensePlateNumber() {
		return downboundLicensePlateNumber;
	}

	public void setDownboundCompany(String downboundCompany) {
		this.downboundCompany = downboundCompany;
	}

	public String getDownboundCompany() {
		return downboundCompany;
	}

	public void setDownboundOutset(String downboundOutset) {
		this.downboundOutset = downboundOutset;
	}

	public String getDownboundOutset() {
		return downboundOutset;
	}

	public void setDownboundYard(String downboundYard) {
		this.downboundYard = downboundYard;
	}

	public String getDownboundYard() {
		return downboundYard;
	}

	public void setDownboundCash(String downboundCash) {
		this.downboundCash = downboundCash;
	}

	public String getDownboundCash() {
		return downboundCash;
	}

	public void setDownboundBill(String downboundBill) {
		this.downboundBill = downboundBill;
	}

	public String getDownboundBill() {
		return downboundBill;
	}

	public void setDownboundGoods(String downboundGoods) {
		this.downboundGoods = downboundGoods;
	}

	public String getDownboundGoods() {
		return downboundGoods;
	}

	public void setDownboundGoodsMt(BigDecimal downboundGoodsMt) {
		this.downboundGoodsMt = downboundGoodsMt;
	}

	public BigDecimal getDownboundGoodsMt() {
		return downboundGoodsMt;
	}

	public void setDownboundGoodsPrice(BigDecimal downboundGoodsPrice) {
		this.downboundGoodsPrice = downboundGoodsPrice;
	}

	public BigDecimal getDownboundGoodsPrice() {
		return downboundGoodsPrice;
	}

	public void setDownboundTotal(BigDecimal downboundTotal) {
		this.downboundTotal = downboundTotal;
	}

	public BigDecimal getDownboundTotal() {
		return downboundTotal;
	}

	public void setDownboundCouponNumber(String downboundCouponNumber) {
		this.downboundCouponNumber = downboundCouponNumber;
	}

	/**
	 * 後續新增 聯單號
	 * 
	 * @return
	 */
	public String getDownboundCouponNumber() {
		return downboundCouponNumber;
	}

	public void setDownboundGoodsCustomerMt(BigDecimal downboundGoodsCustomerMt) {
		this.downboundGoodsCustomerMt = downboundGoodsCustomerMt;
	}

	/**
	 * 後續新增 收貨噸數
	 * 
	 * @return
	 */
	public BigDecimal getDownboundGoodsCustomerMt() {
		return downboundGoodsCustomerMt;
	}

	/** 軟單編號 */
	@Excel(name = "軟單編號")
	private String downboundSoftOrderNumber;

	public void setDownboundSoftOrderNumber(String downboundSoftOrderNumber) {
		this.downboundSoftOrderNumber = downboundSoftOrderNumber;
	}

	public String getDownboundSoftOrderNumber() {
		return downboundSoftOrderNumber;
	}

	/** 司機單價 */
	@Excel(name = "司機單價")
	private BigDecimal downboundGoodsPriceDriver;

	/** 扣發票金額(南) */
	@Excel(name = "扣發票金額(南)")
	private BigDecimal downboundBillTotal;

	public void setDownboundGoodsPriceDriver(BigDecimal downboundGoodsPriceDriver) {
		this.downboundGoodsPriceDriver = downboundGoodsPriceDriver;
	}

	public BigDecimal getDownboundGoodsPriceDriver() {
		return downboundGoodsPriceDriver;
	}

	public void setDownboundBillTotal(BigDecimal downboundBillTotal) {
		this.downboundBillTotal = downboundBillTotal;
	}

	public BigDecimal getDownboundBillTotal() {
		return downboundBillTotal;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId())
				.append("downboundId", getDownboundId()).append("downboundDate", getDownboundDate())
				.append("downboundDriver", getDownboundDriver())
				.append("downboundLicensePlateNumber", getDownboundLicensePlateNumber())
				.append("downboundCompany", getDownboundCompany()).append("downboundOutset", getDownboundOutset())
				.append("downboundYard", getDownboundYard()).append("downboundCash", getDownboundCash())
				.append("downboundBill", getDownboundBill()).append("downboundGoods", getDownboundGoods())
				.append("downboundGoodsMt", getDownboundGoodsMt())
				.append("downboundGoodsPrice", getDownboundGoodsPrice()).append("downboundTotal", getDownboundTotal())
				.append("downboundCouponNumber", getDownboundCouponNumber())
				.append("downboundSoftOrderNumber", getDownboundSoftOrderNumber())
				.append("downboundGoodsCustomerMt", getDownboundGoodsCustomerMt())
				.append("downboundGoodsPriceDriver", getDownboundGoodsPriceDriver())
				.append("downboundBillTotal", getDownboundBillTotal()).toString();
	}
}
