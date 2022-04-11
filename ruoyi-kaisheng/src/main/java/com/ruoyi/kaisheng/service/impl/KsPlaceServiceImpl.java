package com.ruoyi.kaisheng.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.kaisheng.mapper.KsPlaceMapper;
import com.ruoyi.kaisheng.domain.KsPlace;
import com.ruoyi.kaisheng.service.IKsPlaceService;

/**
 * 地點表單Service业务层处理
 * 
 * @author sheng
 * @date 2022-04-02
 */
@Service
public class KsPlaceServiceImpl implements IKsPlaceService 
{
    @Autowired
    private KsPlaceMapper ksPlaceMapper;

    /**
     * 查询地點表單
     * 
     * @param id 地點表單主键
     * @return 地點表單
     */
    @Override
    public KsPlace selectKsPlaceById(Integer id)
    {
        return ksPlaceMapper.selectKsPlaceById(id);
    }

    /**
     * 查询地點表單列表
     * 
     * @param ksPlace 地點表單
     * @return 地點表單
     */
    @Override
    public List<KsPlace> selectKsPlaceList(KsPlace ksPlace)
    {
        return ksPlaceMapper.selectKsPlaceList(ksPlace);
    }

    /**
     * 新增地點表單
     * 
     * @param ksPlace 地點表單
     * @return 结果
     */
    @Override
    public int insertKsPlace(KsPlace ksPlace)
    {
        return ksPlaceMapper.insertKsPlace(ksPlace);
    }

    /**
     * 修改地點表單
     * 
     * @param ksPlace 地點表單
     * @return 结果
     */
    @Override
    public int updateKsPlace(KsPlace ksPlace)
    {
        return ksPlaceMapper.updateKsPlace(ksPlace);
    }

    /**
     * 批量删除地點表單
     * 
     * @param ids 需要删除的地點表單主键
     * @return 结果
     */
    @Override
    public int deleteKsPlaceByIds(Integer[] ids)
    {
        return ksPlaceMapper.deleteKsPlaceByIds(ids);
    }

    /**
     * 删除地點表單信息
     * 
     * @param id 地點表單主键
     * @return 结果
     */
    @Override
    public int deleteKsPlaceById(Integer id)
    {
        return ksPlaceMapper.deleteKsPlaceById(id);
    }
}
