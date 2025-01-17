package com.ruoyi.kaisheng.service;

import java.util.List;
import com.ruoyi.kaisheng.domain.KsClient;

/**
 * 客戶公司表單Service接口
 * 
 * @author Sheng
 * @date 2022-03-03
 */
public interface IKsClientService {
	/**
	 * 查询客戶公司表單
	 * 
	 * @param id 客戶公司表單主键
	 * @return 客戶公司表單
	 */
	public KsClient selectKsClientById(Integer id);

	/**
	 * 查询客戶公司表單
	 * 
	 * @param clinetId
	 * @return
	 */
	public KsClient selectKsClientByClientId(String clinetId);

	/**
	 * 查询客戶公司表單列表
	 * 
	 * @param ksClient 客戶公司表單
	 * @return 客戶公司表單集合
	 */
	public List<KsClient> selectKsClientList(KsClient ksClient);

	/**
	 * 新增客戶公司表單
	 * 
	 * @param ksClient 客戶公司表單
	 * @return 结果
	 */
	public int insertKsClient(KsClient ksClient);

	/**
	 * 修改客戶公司表單
	 * 
	 * @param ksClient 客戶公司表單
	 * @return 结果
	 */
	public int updateKsClient(KsClient ksClient);

	/**
	 * 批量删除客戶公司表單
	 * 
	 * @param ids 需要删除的客戶公司表單主键集合
	 * @return 结果
	 */
	public int deleteKsClientByIds(Integer[] ids);

	/**
	 * 删除客戶公司表單信息
	 * 
	 * @param id 客戶公司表單主键
	 * @return 结果
	 */
	public int deleteKsClientById(Integer id);
}
