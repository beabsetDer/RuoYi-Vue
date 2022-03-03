package com.ruoyi.kaisheng.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.kaisheng.domain.KsClient;
import com.ruoyi.kaisheng.domain.KsEmployee;
import com.ruoyi.kaisheng.service.IKsClientService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 客戶公司表單Controller
 * 
 * @author Sheng
 * @date 2022-03-03
 */
@RestController
@RequestMapping("/ks/client")
public class KsClientController extends BaseController {
	@Autowired
	private IKsClientService ksClientService;

	/**
	 * 查询客戶公司表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:client:list')")
	@GetMapping("/list")
	public TableDataInfo list(KsClient ksClient) {
		startPage();
		List<KsClient> list = ksClientService.selectKsClientList(ksClient);
		return getDataTable(list);
	}

	/**
	 * 查询客戶公司表單列表(用於下拉框)
	 * 
	 * @param ksEmployee
	 * @return
	 */
	@PreAuthorize("@ss.hasPermi('ks:client:list')")
	@GetMapping("/listClientForSelector")
	public List<KsClient> listUser(KsClient ksClient) {
		List<KsClient> list = ksClientService.selectKsClientList(ksClient);
		return list;
	}

	/**
	 * 导出客戶公司表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:client:export')")
	@Log(title = "客戶公司表單", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	public void export(HttpServletResponse response, KsClient ksClient) {
		List<KsClient> list = ksClientService.selectKsClientList(ksClient);
		ExcelUtil<KsClient> util = new ExcelUtil<KsClient>(KsClient.class);
		util.exportExcel(response, list, "客戶公司表單数据");
	}

	/**
	 * 获取客戶公司表單详细信息
	 */
	@PreAuthorize("@ss.hasPermi('ks:client:query')")
	@GetMapping(value = "/{id}")
	public AjaxResult getInfo(@PathVariable("id") Integer id) {
		return AjaxResult.success(ksClientService.selectKsClientById(id));
	}

	/**
	 * 新增客戶公司表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:client:add')")
	@Log(title = "客戶公司表單", businessType = BusinessType.INSERT)
	@PostMapping
	public AjaxResult add(@RequestBody KsClient ksClient) {
		return toAjax(ksClientService.insertKsClient(ksClient));
	}

	/**
	 * 修改客戶公司表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:client:edit')")
	@Log(title = "客戶公司表單", businessType = BusinessType.UPDATE)
	@PutMapping
	public AjaxResult edit(@RequestBody KsClient ksClient) {
		return toAjax(ksClientService.updateKsClient(ksClient));
	}

	/**
	 * 删除客戶公司表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:client:remove')")
	@Log(title = "客戶公司表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
	public AjaxResult remove(@PathVariable Integer[] ids) {
		return toAjax(ksClientService.deleteKsClientByIds(ids));
	}
}
