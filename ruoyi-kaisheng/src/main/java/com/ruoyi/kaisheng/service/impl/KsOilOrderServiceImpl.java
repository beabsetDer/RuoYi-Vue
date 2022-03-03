package com.ruoyi.kaisheng.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.kaisheng.mapper.KsOilOrderMapper;
import com.ruoyi.kaisheng.domain.KsOilOrder;
import com.ruoyi.kaisheng.service.IKsOilOrderService;

/**
 * 加油表單Service业务层处理
 * 
 * @author Sheng
 * @date 2022-02-22
 */
@Service
public class KsOilOrderServiceImpl implements IKsOilOrderService 
{
    @Autowired
    private KsOilOrderMapper ksOilOrderMapper;

    /**
     * 查询加油表單
     * 
     * @param id 加油表單主键
     * @return 加油表單
     */
    @Override
    public KsOilOrder selectKsOilOrderById(Integer id)
    {
        return ksOilOrderMapper.selectKsOilOrderById(id);
    }

    /**
     * 查询加油表單列表
     * 
     * @param ksOilOrder 加油表單
     * @return 加油表單
     */
    @Override
    public List<KsOilOrder> selectKsOilOrderList(KsOilOrder ksOilOrder)
    {
        return ksOilOrderMapper.selectKsOilOrderList(ksOilOrder);
    }

    /**
     * 新增加油表單
     * 
     * @param ksOilOrder 加油表單
     * @return 结果
     */
    @Override
    public int insertKsOilOrder(KsOilOrder ksOilOrder)
    {
        return ksOilOrderMapper.insertKsOilOrder(ksOilOrder);
    }

    /**
     * 修改加油表單
     * 
     * @param ksOilOrder 加油表單
     * @return 结果
     */
    @Override
    public int updateKsOilOrder(KsOilOrder ksOilOrder)
    {
        return ksOilOrderMapper.updateKsOilOrder(ksOilOrder);
    }

    /**
     * 批量删除加油表單
     * 
     * @param ids 需要删除的加油表單主键
     * @return 结果
     */
    @Override
    public int deleteKsOilOrderByIds(Integer[] ids)
    {
        return ksOilOrderMapper.deleteKsOilOrderByIds(ids);
    }

    /**
     * 删除加油表單信息
     * 
     * @param id 加油表單主键
     * @return 结果
     */
    @Override
    public int deleteKsOilOrderById(Integer id)
    {
        return ksOilOrderMapper.deleteKsOilOrderById(id);
    }
}
