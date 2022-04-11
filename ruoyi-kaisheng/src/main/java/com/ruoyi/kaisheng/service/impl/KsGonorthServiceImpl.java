package com.ruoyi.kaisheng.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.kaisheng.mapper.KsClientMapper;
import com.ruoyi.kaisheng.mapper.KsGonorthMapper;
import com.ruoyi.kaisheng.mapper.KsGoodsMapper;
import com.ruoyi.kaisheng.mapper.KsPlaceMapper;
import com.ruoyi.kaisheng.domain.KsGonorth;
import com.ruoyi.kaisheng.service.IKsGonorthService;

/**
 * 北上表單Service业务层处理
 * 
 * @author Sheng
 * @date 2022-03-30
 */
@Service
public class KsGonorthServiceImpl implements IKsGonorthService {
	@Autowired
	private KsGonorthMapper ksGonorthMapper;

	@Autowired
	private KsGoodsMapper ksGoodsMapper;

	@Autowired
	private KsClientMapper ksClientMapper;

	@Autowired
	private KsPlaceMapper ksPlaceMapper;

	/**
	 * 查询北上表單
	 * 
	 * @param id 北上表單主键
	 * @return 北上表單
	 */
	@Override
	public KsGonorth selectKsGonorthById(Integer id) {
		return ksGonorthMapper.selectKsGonorthById(id);
	}

	/**
	 * 查询北上表單列表
	 * 
	 * @param ksGonorth 北上表單
	 * @return 北上表單
	 */
	@Override
	public List<KsGonorth> selectKsGonorthList(KsGonorth ksGonorth) {

		// 有更好的方法 .. 之後用 這裡等於每次循環發送sql..
		final List<KsGonorth> selectKsGonorthList = ksGonorthMapper.selectKsGonorthList(ksGonorth);
		// java 1.8 後的特殊寫法 (有空惡補一下)..
		selectKsGonorthList.forEach(item -> {
			String ksGoodsName = ksGoodsMapper.selectKsGoodsNameByGoodsId(item.getGonorthGoods());
			String ksClientName = ksClientMapper.selectKsClientNameByClientId(item.getGonorthCompany());
			String ksPlaceNameOutset = ksPlaceMapper.selectKsPlaceNameByPlaceId(item.getGonorthOutset());
			String ksPlaceNameYard = ksPlaceMapper.selectKsPlaceNameByPlaceId(item.getGonorthYard());
			// 文字更換
			item.setGonorthGoods(ksGoodsName + "\n(" + item.getGonorthGoods() + ")");
			item.setGonorthCompany(ksClientName + "\n(" + item.getGonorthCompany() + ")");
			item.setGonorthOutset(ksPlaceNameOutset + "\n(" + item.getGonorthOutset() + ")");
			item.setGonorthYard(ksPlaceNameYard + "\n(" + item.getGonorthYard() + ")");
		});
		return selectKsGonorthList;
	}

	/**
	 * 新增北上表單
	 * 
	 * @param ksGonorth 北上表單
	 * @return 结果
	 */
	@Override
	public int insertKsGonorth(KsGonorth ksGonorth) {
		return ksGonorthMapper.insertKsGonorth(ksGonorth);
	}

	/**
	 * 修改北上表單
	 * 
	 * @param ksGonorth 北上表單
	 * @return 结果
	 */
	@Override
	public int updateKsGonorth(KsGonorth ksGonorth) {
		return ksGonorthMapper.updateKsGonorth(ksGonorth);
	}

	/**
	 * 批量删除北上表單
	 * 
	 * @param ids 需要删除的北上表單主键
	 * @return 结果
	 */
	@Override
	public int deleteKsGonorthByIds(Integer[] ids) {
		return ksGonorthMapper.deleteKsGonorthByIds(ids);
	}

	/**
	 * 删除北上表單信息
	 * 
	 * @param id 北上表單主键
	 * @return 结果
	 */
	@Override
	public int deleteKsGonorthById(Integer id) {
		return ksGonorthMapper.deleteKsGonorthById(id);
	}
}
