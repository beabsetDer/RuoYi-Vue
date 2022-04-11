package com.ruoyi.kaisheng.service.impl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.kaisheng.mapper.KsClientMapper;
import com.ruoyi.kaisheng.mapper.KsDownboundMapper;
import com.ruoyi.kaisheng.mapper.KsGoodsMapper;
import com.ruoyi.kaisheng.mapper.KsPlaceMapper;
import com.ruoyi.kaisheng.domain.KsClient;
import com.ruoyi.kaisheng.domain.KsDownbound;
import com.ruoyi.kaisheng.domain.KsGoods;
import com.ruoyi.kaisheng.domain.KsPlace;
import com.ruoyi.kaisheng.service.IKsDownboundService;

/**
 * 南下表單Service业务层处理
 * 
 * @author Sheng
 * @date 2022-02-22
 */
@Service
public class KsDownboundServiceImpl implements IKsDownboundService {
	@Autowired
	private KsDownboundMapper ksDownboundMapper;

	@Autowired
	private KsGoodsMapper ksGoodsMapper;

	@Autowired
	private KsClientMapper ksClientMapper;

	@Autowired
	private KsPlaceMapper ksPlaceMapper;

	/**
	 * 查询南下表單
	 * 
	 * @param id 南下表單主键
	 * @return 南下表單
	 */
	@Override
	public KsDownbound selectKsDownboundById(Integer id) {
		return ksDownboundMapper.selectKsDownboundById(id);
	}

	/**
	 * 查询南下表單列表
	 * 
	 * @param ksDownbound 南下表單
	 * @return 南下表單
	 */
	@Override
	public List<KsDownbound> selectKsDownboundList(KsDownbound ksDownbound) {
		System.out.println("===========selectKsDownboundList-before===========");
		final List<KsDownbound> selectKsDownboundList = ksDownboundMapper.selectKsDownboundList(ksDownbound);
		System.out.println("***********selectKsDownboundList-after***********");
		// 只用一次..
		final List<KsGoods> ksGoodsList = ksGoodsMapper.selectKsGoodsList(null);
		final Map<String, String> ksGoodsMap = ksGoodsList.stream()
				.collect(Collectors.toMap(KsGoods::getGoodsId, KsGoods::getGoodsName));
		final List<KsClient> KsClientList = ksClientMapper.selectKsClientList(null);
		final Map<String, String> KsClientMap = KsClientList.stream()
				.collect(Collectors.toMap(KsClient::getClientId, KsClient::getClientName));
		final List<KsPlace> ksPlaceList = ksPlaceMapper.selectKsPlaceList(null);
		final Map<String, String> ksPlaceMap = ksPlaceList.stream()
				.collect(Collectors.toMap(KsPlace::getPlaceId, KsPlace::getPlaceName));

		// java 1.8 後的特殊寫法 (有空惡補一下)..
		selectKsDownboundList.forEach(item -> {
			final String ksGoodsName = ksGoodsMap.get(item.getDownboundGoods());
			final String ksClientName = KsClientMap.get(item.getDownboundCompany());
			final String ksPlaceNameOutset = ksPlaceMap.get(item.getDownboundOutset());
			final String ksPlaceNameYard = ksPlaceMap.get(item.getDownboundYard());
			// 文字更換
			item.setDownboundGoods(ksGoodsName + "\n(" + item.getDownboundGoods() + ")");
			item.setDownboundCompany(ksClientName + "\n(" + item.getDownboundCompany() + ")");
			item.setDownboundOutset(ksPlaceNameOutset + "\n(" + item.getDownboundOutset() + ")");
			item.setDownboundYard(ksPlaceNameYard + "\n(" + item.getDownboundYard() + ")");
		});
		return selectKsDownboundList;
	}

	/**
	 * 新增南下表單
	 * 
	 * @param ksDownbound 南下表單
	 * @return 结果
	 */
	@Override
	public int insertKsDownbound(KsDownbound ksDownbound) {
		return ksDownboundMapper.insertKsDownbound(ksDownbound);
	}

	/**
	 * 修改南下表單
	 * 
	 * @param ksDownbound 南下表單
	 * @return 结果
	 */
	@Override
	public int updateKsDownbound(KsDownbound ksDownbound) {
		return ksDownboundMapper.updateKsDownbound(ksDownbound);
	}

	/**
	 * 批量删除南下表單
	 * 
	 * @param ids 需要删除的南下表單主键
	 * @return 结果
	 */
	@Override
	public int deleteKsDownboundByIds(Integer[] ids) {
		return ksDownboundMapper.deleteKsDownboundByIds(ids);
	}

	/**
	 * 删除南下表單信息
	 * 
	 * @param id 南下表單主键
	 * @return 结果
	 */
	@Override
	public int deleteKsDownboundById(Integer id) {
		return ksDownboundMapper.deleteKsDownboundById(id);
	}
}
