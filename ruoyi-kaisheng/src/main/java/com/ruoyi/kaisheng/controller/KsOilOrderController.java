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
import com.ruoyi.kaisheng.domain.KsOilOrder;
import com.ruoyi.kaisheng.service.IKsOilOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 加油表單Controller
 * 
 * @author Sheng
 * @date 2022-02-22
 */
@RestController
@RequestMapping("/ks/order")
public class KsOilOrderController extends BaseController {
	@Autowired
	private IKsOilOrderService ksOilOrderService;

	/**
	 * 查询加油表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:order:list')")
	@GetMapping("/list")
	public TableDataInfo list(KsOilOrder ksOilOrder) {
		startPage();
		List<KsOilOrder> list = ksOilOrderService.selectKsOilOrderList(ksOilOrder);
		return getDataTable(list);
	}

	/**
	 * 导出加油表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:order:export')")
	@Log(title = "加油表單", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	public void export(HttpServletResponse response, KsOilOrder ksOilOrder) {
		List<KsOilOrder> list = ksOilOrderService.selectKsOilOrderList(ksOilOrder);
		ExcelUtil<KsOilOrder> util = new ExcelUtil<KsOilOrder>(KsOilOrder.class);
		util.exportExcel(response, list, "加油表單数据");
	}

	/**
	 * 获取加油表單详细信息
	 */
	@PreAuthorize("@ss.hasPermi('ks:order:query')")
	@GetMapping(value = "/{id}")
	public AjaxResult getInfo(@PathVariable("id") Integer id) {
		return AjaxResult.success(ksOilOrderService.selectKsOilOrderById(id));
	}

	/**
	 * 新增加油表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:order:add')")
	@Log(title = "加油表單", businessType = BusinessType.INSERT)
	@PostMapping
	public AjaxResult add(@RequestBody KsOilOrder ksOilOrder) {
		return toAjax(ksOilOrderService.insertKsOilOrder(ksOilOrder));
	}

	/**
	 * 修改加油表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:order:edit')")
	@Log(title = "加油表單", businessType = BusinessType.UPDATE)
	@PutMapping
	public AjaxResult edit(@RequestBody KsOilOrder ksOilOrder) {
		return toAjax(ksOilOrderService.updateKsOilOrder(ksOilOrder));
	}

	/**
	 * 删除加油表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:order:remove')")
	@Log(title = "加油表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
	public AjaxResult remove(@PathVariable Integer[] ids) {
		return toAjax(ksOilOrderService.deleteKsOilOrderByIds(ids));
	}
}
