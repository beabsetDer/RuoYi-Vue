package com.ruoyi.kaisheng.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.kaisheng.mapper.KsExpenseMapper;
import com.ruoyi.kaisheng.domain.KsExpense;
import com.ruoyi.kaisheng.service.IKsExpenseService;

/**
 * 日常開支表單Service业务层处理
 * 
 * @author Sheng
 * @date 2022-02-24
 */
@Service
public class KsExpenseServiceImpl implements IKsExpenseService 
{
    @Autowired
    private KsExpenseMapper ksExpenseMapper;

    /**
     * 查询日常開支表單
     * 
     * @param id 日常開支表單主键
     * @return 日常開支表單
     */
    @Override
    public KsExpense selectKsExpenseById(Integer id)
    {
        return ksExpenseMapper.selectKsExpenseById(id);
    }

    /**
     * 查询日常開支表單列表
     * 
     * @param ksExpense 日常開支表單
     * @return 日常開支表單
     */
    @Override
    public List<KsExpense> selectKsExpenseList(KsExpense ksExpense)
    {
        return ksExpenseMapper.selectKsExpenseList(ksExpense);
    }

    /**
     * 新增日常開支表單
     * 
     * @param ksExpense 日常開支表單
     * @return 结果
     */
    @Override
    public int insertKsExpense(KsExpense ksExpense)
    {
        return ksExpenseMapper.insertKsExpense(ksExpense);
    }

    /**
     * 修改日常開支表單
     * 
     * @param ksExpense 日常開支表單
     * @return 结果
     */
    @Override
    public int updateKsExpense(KsExpense ksExpense)
    {
        return ksExpenseMapper.updateKsExpense(ksExpense);
    }

    /**
     * 批量删除日常開支表單
     * 
     * @param ids 需要删除的日常開支表單主键
     * @return 结果
     */
    @Override
    public int deleteKsExpenseByIds(Integer[] ids)
    {
        return ksExpenseMapper.deleteKsExpenseByIds(ids);
    }

    /**
     * 删除日常開支表單信息
     * 
     * @param id 日常開支表單主键
     * @return 结果
     */
    @Override
    public int deleteKsExpenseById(Integer id)
    {
        return ksExpenseMapper.deleteKsExpenseById(id);
    }
}
