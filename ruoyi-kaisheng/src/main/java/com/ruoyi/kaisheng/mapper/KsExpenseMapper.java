package com.ruoyi.kaisheng.mapper;

import java.util.List;
import com.ruoyi.kaisheng.domain.KsExpense;

/**
 * 日常開支表單Mapper接口
 * 
 * @author Sheng
 * @date 2022-02-24
 */
public interface KsExpenseMapper 
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
     * 删除日常開支表單
     * 
     * @param id 日常開支表單主键
     * @return 结果
     */
    public int deleteKsExpenseById(Integer id);

    /**
     * 批量删除日常開支表單
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteKsExpenseByIds(Integer[] ids);
}
