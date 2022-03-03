package com.ruoyi.kaisheng.service;

import java.util.List;
import com.ruoyi.kaisheng.domain.KsExpense;

/**
 * 日常開支表單Service接口
 * 
 * @author Sheng
 * @date 2022-02-24
 */
public interface IKsExpenseService 
{
    /**
     * 查询日常開支表單
     * 
     * @param id 日常開支表單主键
     * @return 日常開支表單
     */
    public KsExpense selectKsExpenseById(Integer id);

    /**
     * 查询日常開支表單列表
     * 
     * @param ksExpense 日常開支表單
     * @return 日常開支表單集合
     */
    public List<KsExpense> selectKsExpenseList(KsExpense ksExpense);

    /**
     * 新增日常開支表單
     * 
     * @param ksExpense 日常開支表單
     * @return 结果
     */
    public int insertKsExpense(KsExpense ksExpense);

    /**
     * 修改日常開支表單
     * 
     * @param ksExpense 日常開支表單
     * @return 结果
     */
    public int updateKsExpense(KsExpense ksExpense);

    /**
     * 批量删除日常開支表單
     * 
     * @param ids 需要删除的日常開支表單主键集合
     * @return 结果
     */
    public int deleteKsExpenseByIds(Integer[] ids);

    /**
     * 删除日常開支表單信息
     * 
     * @param id 日常開支表單主键
     * @return 结果
     */
    public int deleteKsExpenseById(Integer id);
}
