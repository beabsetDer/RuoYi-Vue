package com.ruoyi.kaisheng.mapper;

import java.util.List;
import com.ruoyi.kaisheng.domain.KsPlace;

/**
 * 地點表單Mapper接口
 * 
 * @author sheng
 * @date 2022-04-02
 */
public interface KsPlaceMapper {
	/**
	 * 查询地點表單
	 * 
	 * @param id 地點表單主键
	 * @return 地點表單
	 */
	public KsPlace selectKsPlaceById(Integer id);

	/**
	 * 查询地點表單列表
	 * 
	 * @param ksPlace 地點表單
	 * @return 地點表單集合
	 */
	public List<KsPlace> selectKsPlaceList(KsPlace ksPlace);

	/**
	 * 查詢 PlaceName
	 * 
	 * @param placeId
	 * @return
	 */
	public String selectKsPlaceNameByPlaceId(String placeId);

	/**
	 * 新增地點表單
	 * 
	 * @param ksPlace 地點表單
	 * @return 结果
	 */
	public int insertKsPlace(KsPlace ksPlace);

	/**
	 * 修改地點表單
	 * 
	 * @param ksPlace 地點表單
	 * @return 结果
	 */
	public int updateKsPlace(KsPlace ksPlace);

	/**
	 * 删除地點表單
	 * 
	 * @param id 地點表單主键
	 * @return 结果
	 */
	public int deleteKsPlaceById(Integer id);

	/**
	 * 批量删除地點表單
	 * 
	 * @param ids 需要删除的数据主键集合
	 * @return 结果
	 */
	public int deleteKsPlaceByIds(Integer[] ids);
}
