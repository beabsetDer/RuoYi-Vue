package com.ruoyi.kaisheng.domain;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 客戶公司表單对象 ks_client
 * 
 * @author Sheng
 * @date 2022-03-03
 */
public class KsClient extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/**  */
	private Integer id;

	/** 客戶公司編號 */
	@Excel(name = "客戶公司編號")
	private String clientId;

	/** 客戶公司名稱 */
	@Excel(name = "客戶公司名稱")
	private String clientName;

	/** 客戶公司電話 */
	@Excel(name = "客戶公司電話")
	private String clientTel;

	/** 客戶公司手機 */
	@Excel(name = "客戶公司手機")
	private String clientPhone;

	/** 客戶公司負責人 */
	@Excel(name = "客戶公司負責人")
	private String clientHead;

	/** 客戶公司地址 */
	@Excel(name = "客戶公司地址")
	private String clientAddress;

	/** 客戶公司備註 */
	@Excel(name = "客戶公司備註")
	private String clientNote;

	@Excel(name = "北上單數")
	private int gonorthCount;
	@Excel(name = "北上營業額")
	private BigDecimal gonorthRevenue;
	@Excel(name = "南下單數")
	private int downboundCount;
	@Excel(name = "南下營業額")
	private BigDecimal downboundRevenue;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientTel(String clientTel) {
		this.clientTel = clientTel;
	}

	public String getClientTel() {
		return clientTel;
	}

	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}

	public String getClientPhone() {
		return clientPhone;
	}

	public void setClientHead(String clientHead) {
		this.clientHead = clientHead;
	}

	public String getClientHead() {
		return clientHead;
	}

	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}

	public String getClientAddress() {
		return clientAddress;
	}

	public void setClientNote(String clientNote) {
		this.clientNote = clientNote;
	}

	public String getClientNote() {
		return clientNote;
	}

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

	public int getGonorthCount() {
		return gonorthCount;
	}

	public void setGonorthCount(int gonorthCount) {
		this.gonorthCount = gonorthCount;
	}

	public BigDecimal getGonorthRevenue() {
		return gonorthRevenue;
	}

	public void setGonorthRevenue(BigDecimal gonorthRevenue) {
		this.gonorthRevenue = gonorthRevenue;
	}

	public int getDownboundCount() {
		return downboundCount;
	}

	public void setDownboundCount(int downboundCount) {
		this.downboundCount = downboundCount;
	}

	public BigDecimal getDownboundRevenue() {
		return downboundRevenue;
	}

	public void setDownboundRevenue(BigDecimal downboundRevenue) {
		this.downboundRevenue = downboundRevenue;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId())
				.append("clientId", getClientId()).append("clientName", getClientName())
				.append("clientTel", getClientTel()).append("clientPhone", getClientPhone())
				.append("clientHead", getClientHead()).append("clientAddress", getClientAddress())
				.append("clientNote", getClientNote()).toString();
	}
}
