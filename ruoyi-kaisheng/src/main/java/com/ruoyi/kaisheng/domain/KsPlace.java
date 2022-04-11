package com.ruoyi.kaisheng.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 地點表單对象 ks_place
 * 
 * @author sheng
 * @date 2022-04-02
 */
public class KsPlace extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 流水號 */
    private Integer id;

    /** 地點編號 */
    @Excel(name = "地點編號")
    private String placeId;

    /** 地點名稱 */
    @Excel(name = "地點名稱")
    private String placeName;

    /** 地點類型 */
    @Excel(name = "地點類型")
    private String placeType;

    /** 場地負責人 */
    @Excel(name = "場地負責人")
    private String placePrincipal;

    /** 負責人電話 */
    @Excel(name = "負責人電話")
    private String placePrincipalTel;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setPlaceId(String placeId) 
    {
        this.placeId = placeId;
    }

    public String getPlaceId() 
    {
        return placeId;
    }
    public void setPlaceName(String placeName) 
    {
        this.placeName = placeName;
    }

    public String getPlaceName() 
    {
        return placeName;
    }
    public void setPlaceType(String placeType) 
    {
        this.placeType = placeType;
    }

    public String getPlaceType() 
    {
        return placeType;
    }
    public void setPlacePrincipal(String placePrincipal) 
    {
        this.placePrincipal = placePrincipal;
    }

    public String getPlacePrincipal() 
    {
        return placePrincipal;
    }
    public void setPlacePrincipalTel(String placePrincipalTel) 
    {
        this.placePrincipalTel = placePrincipalTel;
    }

    public String getPlacePrincipalTel() 
    {
        return placePrincipalTel;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("placeId", getPlaceId())
            .append("placeName", getPlaceName())
            .append("placeType", getPlaceType())
            .append("placePrincipal", getPlacePrincipal())
            .append("placePrincipalTel", getPlacePrincipalTel())
            .toString();
    }
}
