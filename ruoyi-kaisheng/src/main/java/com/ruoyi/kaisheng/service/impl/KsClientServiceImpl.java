package com.ruoyi.kaisheng.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.kaisheng.mapper.KsClientMapper;
import com.ruoyi.kaisheng.domain.KsClient;
import com.ruoyi.kaisheng.service.IKsClientService;

/**
 * 客戶公司表單Service业务层处理
 * 
 * @author Sheng
 * @date 2022-03-03
 */
@Service
public class KsClientServiceImpl implements IKsClientService {
	@Autowired
	private KsClientMapper ksClientMapper;

	/**
	 * 查询客戶公司表單
	 * 
	 * @param id 客戶公司表單主键
	 * @return 客戶公司表單
	 */
	@Override
	public KsClient selectKsClientById(Integer id) {
		return ksClientMapper.selectKsClientById(id);
	}

	/**
	 * 查询客戶公司表單
	 * 
	 * @param id 客戶公司表單主键
	 * @return 客戶公司表單
	 */
	@Override
	public KsClient selectKsClientByClientId(String clinetId) {
		return ksClientMapper.selectKsClientByClientId(clinetId);
	}

	/**
	 * 查询客戶公司表單列表
	 * 
	 * @param ksClient 客戶公司表單
	 * @return 客戶公司表單
	 */
	@Override
	public List<KsClient> selectKsClientList(KsClient ksClient) {
		return ksClientMapper.selectKsClientList(ksClient);
	}

	/**
	 * 新增客戶公司表單
	 * 
	 * @param ksClient 客戶公司表單
	 * @return 结果
	 */
	@Override
	public int insertKsClient(KsClient ksClient) {
		return ksClientMapper.insertKsClient(ksClient);
	}

	/**
	 * 修改客戶公司表單
	 * 
	 * @param ksClient 客戶公司表單
	 * @return 结果
	 */
	@Override
	public int updateKsClient(KsClient ksClient) {
		return ksClientMapper.updateKsClient(ksClient);
	}

	/**
	 * 批量删除客戶公司表單
	 * 
	 * @param ids 需要删除的客戶公司表單主键
	 * @return 结果
	 */
	@Override
	public int deleteKsClientByIds(Integer[] ids) {
		return ksClientMapper.deleteKsClientByIds(ids);
	}

	/**
	 * 删除客戶公司表單信息
	 * 
	 * @param id 客戶公司表單主键
	 * @return 结果
	 */
	@Override
	public int deleteKsClientById(Integer id) {
		return ksClientMapper.deleteKsClientById(id);
	}
}
