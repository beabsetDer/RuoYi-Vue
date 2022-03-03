package com.ruoyi.kaisheng.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 日常開支表單对象 ks_expense
 * 
 * @author Sheng
 * @date 2022-02-24
 */
public class KsExpense extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 流水號 */
    private Integer id;

    /** 日常開支編號 */
    @Excel(name = "日常開支編號")
    private String expenseId;

    /** 日常開支日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日常開支日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expenseDate;

    /** 機司名稱 */
    @Excel(name = "機司名稱")
    private String expenseDriver;

    /** 車牌 */
    @Excel(name = "車牌")
    private String expenseLicensePlateNumber;

    /** 土尾 */
    @Excel(name = "土尾")
    private BigDecimal expense1;

    /** 發泡 */
    @Excel(name = "發泡")
    private BigDecimal expense2;

    /** 洗車 */
    @Excel(name = "洗車")
    private BigDecimal expense3;

    /** 其他雜項 */
    @Excel(name = "其他雜項")
    private BigDecimal expenseOther;

    /** 日常開支總額 */
    @Excel(name = "日常開支總額")
    private BigDecimal expenseTotal;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setExpenseId(String expenseId) 
    {
        this.expenseId = expenseId;
    }

    public String getExpenseId() 
    {
        return expenseId;
    }
    public void setExpenseDate(Date expenseDate) 
    {
        this.expenseDate = expenseDate;
    }

    public Date getExpenseDate() 
    {
        return expenseDate;
    }
    public void setExpenseDriver(String expenseDriver) 
    {
        this.expenseDriver = expenseDriver;
    }

    public String getExpenseDriver() 
    {
        return expenseDriver;
    }
    public void setExpenseLicensePlateNumber(String expenseLicensePlateNumber) 
    {
        this.expenseLicensePlateNumber = expenseLicensePlateNumber;
    }

    public String getExpenseLicensePlateNumber() 
    {
        return expenseLicensePlateNumber;
    }
    public void setExpense1(BigDecimal expense1) 
    {
        this.expense1 = expense1;
    }

    public BigDecimal getExpense1() 
    {
        return expense1;
    }
    public void setExpense2(BigDecimal expense2) 
    {
        this.expense2 = expense2;
    }

    public BigDecimal getExpense2() 
    {
        return expense2;
    }
    public void setExpense3(BigDecimal expense3) 
    {
        this.expense3 = expense3;
    }

    public BigDecimal getExpense3() 
    {
        return expense3;
    }
    public void setExpenseOther(BigDecimal expenseOther) 
    {
        this.expenseOther = expenseOther;
    }

    public BigDecimal getExpenseOther() 
    {
        return expenseOther;
    }
    public void setExpenseTotal(BigDecimal expenseTotal) 
    {
        this.expenseTotal = expenseTotal;
    }

    public BigDecimal getExpenseTotal() 
    {
        return expenseTotal;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("expenseId", getExpenseId())
            .append("expenseDate", getExpenseDate())
            .append("expenseDriver", getExpenseDriver())
            .append("expenseLicensePlateNumber", getExpenseLicensePlateNumber())
            .append("expense1", getExpense1())
            .append("expense2", getExpense2())
            .append("expense3", getExpense3())
            .append("expenseOther", getExpenseOther())
            .append("expenseTotal", getExpenseTotal())
            .toString();
    }
}
