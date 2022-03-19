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
import com.ruoyi.kaisheng.domain.KsDownbound;
import com.ruoyi.kaisheng.service.IKsDownboundService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 南下表單Controller
 * 
 * @author Sheng
 * @date 2022-02-22
 */
@RestController
@RequestMapping("/ks/downbound")
public class KsDownboundController extends BaseController {
	@Autowired
	private IKsDownboundService ksDownboundService;

	/**
	 * 查询南下表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:downbound:list')")
	@GetMapping("/list")
	public TableDataInfo list(KsDownbound ksDownbound) {
		startPage();
		List<KsDownbound> list = ksDownboundService.selectKsDownboundList(ksDownbound);
		return getDataTable(list);
	}

	/**
	 * 导出南下表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:downbound:export')")
	@Log(title = "南下表單", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	public void export(HttpServletResponse response, KsDownbound ksDownbound) {
		List<KsDownbound> list = ksDownboundService.selectKsDownboundList(ksDownbound);
		ExcelUtil<KsDownbound> util = new ExcelUtil<KsDownbound>(KsDownbound.class);
		util.exportExcel(response, list, "南下表單数据");
	}

	/**
	 * 获取南下表單详细信息
	 */
	@PreAuthorize("@ss.hasPermi('ks:downbound:query')")
	@GetMapping(value = "/{id}")
	public AjaxResult getInfo(@PathVariable("id") Integer id) {
		return AjaxResult.success(ksDownboundService.selectKsDownboundById(id));
	}

	/**
	 * 新增南下表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:downbound:add')")
	@Log(title = "南下表單", businessType = BusinessType.INSERT)
	@PostMapping
	public AjaxResult add(@RequestBody KsDownbound ksDownbound) {
		return toAjax(ksDownboundService.insertKsDownbound(ksDownbound));
	}

	/**
	 * 修改南下表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:downbound:edit')")
	@Log(title = "南下表單", businessType = BusinessType.UPDATE)
	@PutMapping
	public AjaxResult edit(@RequestBody KsDownbound ksDownbound) {
		return toAjax(ksDownboundService.updateKsDownbound(ksDownbound));
	}

	/**
	 * 删除南下表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:downbound:remove')")
	@Log(title = "南下表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
	public AjaxResult remove(@PathVariable Integer[] ids) {
		return toAjax(ksDownboundService.deleteKsDownboundByIds(ids));
	}
}
