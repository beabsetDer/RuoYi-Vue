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
import com.ruoyi.kaisheng.domain.KsCar;
import com.ruoyi.kaisheng.domain.KsEmployee;
import com.ruoyi.kaisheng.service.IKsCarService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 車輛表單Controller
 * 
 * @author Sheng
 * @date 2022-02-20
 */
@RestController
@RequestMapping("/ks/car")
public class KsCarController extends BaseController {
	@Autowired
	private IKsCarService ksCarService;

	/**
	 * 查询車輛表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:car:list')")
	@GetMapping("/list")
	public TableDataInfo list(KsCar ksCar) {
		startPage();
		List<KsCar> list = ksCarService.selectKsCarList(ksCar);
		return getDataTable(list);
	}

	/**
	 * 查询車輛表單列表(用於下拉框)
	 * 
	 * @param ksCar
	 * @return
	 */
	@PreAuthorize("@ss.hasPermi('ks:car:list')")
	@GetMapping("/listCarid")
	public List<KsCar> listCar(KsCar ksCar) {
		List<KsCar> list = ksCarService.selectKsCarList(ksCar);
		return list;
	}

	/**
	 * 导出車輛表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:car:export')")
	@Log(title = "車輛表單", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	public void export(HttpServletResponse response, KsCar ksCar) {
		List<KsCar> list = ksCarService.selectKsCarList(ksCar);
		ExcelUtil<KsCar> util = new ExcelUtil<KsCar>(KsCar.class);
		util.exportExcel(response, list, "車輛表單数据");
	}

	/**
	 * 获取車輛表單详细信息
	 */
	@PreAuthorize("@ss.hasPermi('ks:car:query')")
	@GetMapping(value = "/{id}")
	public AjaxResult getInfo(@PathVariable("id") Integer id) {
		return AjaxResult.success(ksCarService.selectKsCarById(id));
	}

	/**
	 * 新增車輛表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:car:add')")
	@Log(title = "車輛表單", businessType = BusinessType.INSERT)
	@PostMapping
	public AjaxResult add(@RequestBody KsCar ksCar) {
		return toAjax(ksCarService.insertKsCar(ksCar));
	}

	/**
	 * 修改車輛表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:car:edit')")
	@Log(title = "車輛表單", businessType = BusinessType.UPDATE)
	@PutMapping
	public AjaxResult edit(@RequestBody KsCar ksCar) {
		return toAjax(ksCarService.updateKsCar(ksCar));
	}

	/**
	 * 删除車輛表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:car:remove')")
	@Log(title = "車輛表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
	public AjaxResult remove(@PathVariable Integer[] ids) {
		return toAjax(ksCarService.deleteKsCarByIds(ids));
	}
}
