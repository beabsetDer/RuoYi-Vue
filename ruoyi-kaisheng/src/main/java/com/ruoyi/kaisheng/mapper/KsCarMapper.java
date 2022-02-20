package com.ruoyi.kaisheng.mapper;

import java.util.List;
import com.ruoyi.kaisheng.domain.KsCar;

/**
 * 車輛表單Mapper接口
 * 
 * @author Sheng
 * @date 2022-02-20
 */
public interface KsCarMapper 
{
    /**
     * 查询車輛表單
     * 
     * @param id 車輛表單主键
     * @return 車輛表單
     */
    public KsCar selectKsCarById(Integer id);

    /**
     * 查询車輛表單列表
     * 
     * @param ksCar 車輛表單
     * @return 車輛表單集合
     */
    public List<KsCar> selectKsCarList(KsCar ksCar);

    /**
     * 新增車輛表單
     * 
     * @param ksCar 車輛表單
     * @return 结果
     */
    public int insertKsCar(KsCar ksCar);

    /**
     * 修改車輛表單
     * 
     * @param ksCar 車輛表單
     * @return 结果
     */
    public int updateKsCar(KsCar ksCar);

    /**
     * 删除車輛表單
     * 
     * @param id 車輛表單主键
     * @return 结果
     */
    public int deleteKsCarById(Integer id);

    /**
     * 批量删除車輛表單
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteKsCarByIds(Integer[] ids);
}
