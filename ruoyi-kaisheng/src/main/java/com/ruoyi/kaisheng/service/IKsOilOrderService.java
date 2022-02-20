package com.ruoyi.kaisheng.service;

import java.util.List;
import com.ruoyi.kaisheng.domain.KsOilOrder;

/**
 * 加油表單Service接口
 * 
 * @author Sheng
 * @date 2022-02-20
 */
public interface IKsOilOrderService 
{
    /**
     * 查询加油表單
     * 
     * @param id 加油表單主键
     * @return 加油表單
     */
    public KsOilOrder selectKsOilOrderById(Integer id);

    /**
     * 查询加油表單列表
     * 
     * @param ksOilOrder 加油表單
     * @return 加油表單集合
     */
    public List<KsOilOrder> selectKsOilOrderList(KsOilOrder ksOilOrder);

    /**
     * 新增加油表單
     * 
     * @param ksOilOrder 加油表單
     * @return 结果
     */
    public int insertKsOilOrder(KsOilOrder ksOilOrder);

    /**
     * 修改加油表單
     * 
     * @param ksOilOrder 加油表單
     * @return 结果
     */
    public int updateKsOilOrder(KsOilOrder ksOilOrder);

    /**
     * 批量删除加油表單
     * 
     * @param ids 需要删除的加油表單主键集合
     * @return 结果
     */
    public int deleteKsOilOrderByIds(Integer[] ids);

    /**
     * 删除加油表單信息
     * 
     * @param id 加油表單主键
     * @return 结果
     */
    public int deleteKsOilOrderById(Integer id);
}
