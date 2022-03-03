package com.ruoyi.kaisheng.domain;

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
public class KsClient extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 客戶公司流水號 */
    private Integer id;

    /** 客戶公司編號 */
    @Excel(name = "客戶公司編號")
    private String clinetId;

    /** 客戶公司名稱 */
    @Excel(name = "客戶公司名稱")
    private String clinetName;

    /** 客戶公司電話 */
    @Excel(name = "客戶公司電話")
    private String clinetTel;

    /** 客戶公司手機 */
    @Excel(name = "客戶公司手機")
    private String clinetPhone;

    /** 客戶公司負責人 */
    @Excel(name = "客戶公司負責人")
    private String clinetHead;

    /** 客戶公司地址 */
    @Excel(name = "客戶公司地址")
    private String clinetAddress;

    /** 客戶公司備註 */
    @Excel(name = "客戶公司備註")
    private String clinetNote;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setClinetId(String clinetId) 
    {
        this.clinetId = clinetId;
    }

    public String getClinetId() 
    {
        return clinetId;
    }
    public void setClinetName(String clinetName) 
    {
        this.clinetName = clinetName;
    }

    public String getClinetName() 
    {
        return clinetName;
    }
    public void setClinetTel(String clinetTel) 
    {
        this.clinetTel = clinetTel;
    }

    public String getClinetTel() 
    {
        return clinetTel;
    }
    public void setClinetPhone(String clinetPhone) 
    {
        this.clinetPhone = clinetPhone;
    }

    public String getClinetPhone() 
    {
        return clinetPhone;
    }
    public void setClinetHead(String clinetHead) 
    {
        this.clinetHead = clinetHead;
    }

    public String getClinetHead() 
    {
        return clinetHead;
    }
    public void setClinetAddress(String clinetAddress) 
    {
        this.clinetAddress = clinetAddress;
    }

    public String getClinetAddress() 
    {
        return clinetAddress;
    }
    public void setClinetNote(String clinetNote) 
    {
        this.clinetNote = clinetNote;
    }

    public String getClinetNote() 
    {
        return clinetNote;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("clinetId", getClinetId())
            .append("clinetName", getClinetName())
            .append("clinetTel", getClinetTel())
            .append("clinetPhone", getClinetPhone())
            .append("clinetHead", getClinetHead())
            .append("clinetAddress", getClinetAddress())
            .append("clinetNote", getClinetNote())
            .toString();
    }
}
