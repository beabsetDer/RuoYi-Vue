package com.ruoyi.kaisheng.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
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
import com.ruoyi.kaisheng.domain.KsEmployee;
import com.ruoyi.kaisheng.domain.KsExpense;
import com.ruoyi.kaisheng.domain.KsGonorth;
import com.ruoyi.kaisheng.domain.KsOilOrder;
import com.ruoyi.kaisheng.service.IKsDownboundService;
import com.ruoyi.kaisheng.service.IKsEmployeeService;
import com.ruoyi.kaisheng.service.IKsExpenseService;
import com.ruoyi.kaisheng.service.IKsGonorthService;
import com.ruoyi.kaisheng.service.IKsOilOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 員工表單Controller
 * 
 * @author sheng
 * @date 2022-02-19
 */
@RestController
@RequestMapping("/ks/employee")
public class KsEmployeeController extends BaseController {
	@Autowired
	private IKsEmployeeService ksEmployeeService;
	@Autowired
	private IKsGonorthService gonorthService;
	@Autowired
	private IKsDownboundService downboundService;
	@Autowired
	private IKsOilOrderService oilOrderService;
	@Autowired
	private IKsExpenseService expenseService;

	/**
	 * 查询員工表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:list')")
	@GetMapping("/list")
	public TableDataInfo list(KsEmployee ksEmployee) {
		startPage();
		List<KsEmployee> list = ksEmployeeService.selectKsEmployeeList(ksEmployee);
		return getDataTable(list);
	}

	/**
	 * 查詢員工表單列表(用於下拉框)
	 * 
	 * @param ksEmployee
	 * @return
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:list')")
	@GetMapping("/listUser")
	public List<KsEmployee> listUser(KsEmployee ksEmployee) {
		List<KsEmployee> list = ksEmployeeService.selectKsEmployeeList(ksEmployee);
		return list;
	}

	/**
	 * 导出員工表單列表
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:export')")
	@Log(title = "員工表單", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	public void export(HttpServletResponse response, KsEmployee ksEmployee) {
		List<KsEmployee> list = ksEmployeeService.selectKsEmployeeList(ksEmployee);
		ExcelUtil<KsEmployee> util = new ExcelUtil<KsEmployee>(KsEmployee.class);
		util.exportExcel(response, list, "員工表單数据");
	}

	/**
	 * 获取員工表單详细信息
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:query')")
	@GetMapping(value = "/{id}")
	public AjaxResult getInfo(@PathVariable("id") Integer id) {
		return AjaxResult.success(ksEmployeeService.selectKsEmployeeById(id));
	}

	/**
	 * 新增員工表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:add')")
	@Log(title = "員工表單", businessType = BusinessType.INSERT)
	@PostMapping
	public AjaxResult add(@RequestBody KsEmployee ksEmployee) {
		return toAjax(ksEmployeeService.insertKsEmployee(ksEmployee));
	}

	/**
	 * 修改員工表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:edit')")
	@Log(title = "員工表單", businessType = BusinessType.UPDATE)
	@PutMapping
	public AjaxResult edit(@RequestBody KsEmployee ksEmployee) {
		return toAjax(ksEmployeeService.updateKsEmployee(ksEmployee));
	}

	/**
	 * 删除員工表單
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:remove')")
	@Log(title = "員工表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
	public AjaxResult remove(@PathVariable Integer[] ids) {
		return toAjax(ksEmployeeService.deleteKsEmployeeByIds(ids));
	}

	@PreAuthorize("@ss.hasPermi('ks:employee:list')")
	@GetMapping("/listReport")
	public TableDataInfo listReport(KsEmployee vo) {
		startPage();
		List<KsEmployee> list = ksEmployeeService.selectKsEmployeeList(vo);
		for (KsEmployee employee : list) {
			String name = employee.getName();
			KsDownbound ksDownbound = new KsDownbound();
			ksDownbound.setDownboundDriver(name);
			ksDownbound.setParams(vo.getParams());
			List<KsDownbound> ksDownbounds = downboundService.selectKsDownboundList(ksDownbound);
			employee.setDownboundCount(ksDownbounds.size());

			KsGonorth ksGonorth = new KsGonorth();
			ksGonorth.setGonorthDriver(name);
			ksGonorth.setParams(vo.getParams());

			List<KsGonorth> ksGonorths = gonorthService.selectKsGonorthList(ksGonorth);
			employee.setGonorthCount(ksGonorths.size());

			KsOilOrder ksOilOrder = new KsOilOrder();
			ksOilOrder.setOilDriver(name);
			ksOilOrder.setParams(vo.getParams());

			List<KsOilOrder> ksOilOrders = oilOrderService.selectKsOilOrderList(ksOilOrder);
			BigDecimal add = ksOilOrders.stream().map(KsOilOrder::getOilTotal).reduce(BigDecimal.ZERO, BigDecimal::add);

			employee.setOliAmount(add);

			BigDecimal add1 = ksDownbounds.stream().map(KsDownbound::getDownboundDriverPay).reduce(BigDecimal.ZERO,
					BigDecimal::add);
			BigDecimal add2 = ksGonorths.stream().map(KsGonorth::getGonorthDriverPay).reduce(BigDecimal.ZERO,
					BigDecimal::add);
			employee.setSalary(add1.add(add2));
		}
		return getDataTable(list);
	}

	/**
	 * 获取員工表單详细信息
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:emplistReport')")
	@GetMapping(value = "/emplistReport/{employeeId}")
	public TableDataInfo emplistReport(@PathVariable("employeeId") String employeeId, KsEmployee vo) {
		/**
		 * https://www.it145.com/9/169438.html
		 * 
		 * employeeId 跟 vo 會自動填充 相同的屬性
		 */

		// 搜尋員工
		final List<KsEmployee> list = new ArrayList<KsEmployee>();
		final KsEmployee employee = ksEmployeeService.selectKsEmployeeByEmpName(employeeId);
		final String name = employee.getName();
		// System.out.println("employee.getParams() " + employee.getParams());
		// System.out.println("vo " + vo.toString());
		// TODO 南下單資料
		final KsDownbound ksDownbound = new KsDownbound();
		ksDownbound.setDownboundDriver(name);
		ksDownbound.setParams(vo.getParams());
		List<KsDownbound> ksDownbounds = downboundService.selectKsDownboundList(ksDownbound);
		employee.setDownboundCount(ksDownbounds.size());
		employee.setDownboundList(ksDownbounds);
		// 南下營業額
		final BigDecimal downBoundsRevenue = ksDownbounds.stream().map(KsDownbound::getDownboundTotal)
				.reduce(BigDecimal.ZERO, BigDecimal::add);
		employee.setDownboundRevenue(downBoundsRevenue);
		// TODO 北上單資料
		final KsGonorth ksGonorth = new KsGonorth();
		ksGonorth.setGonorthDriver(name);
		ksGonorth.setParams(vo.getParams());
		List<KsGonorth> ksGonorths = gonorthService.selectKsGonorthList(ksGonorth);
		employee.setGonorthList(ksGonorths);
		employee.setGonorthCount(ksGonorths.size());
		// 北下營業額
		final BigDecimal gonorthsRevenue = ksGonorths.stream().map(KsGonorth::getGonorthBillTotal)
				.reduce(BigDecimal.ZERO, BigDecimal::add);
		employee.setGonorthRevenue(gonorthsRevenue);

		// TODO 支出單子
		final KsExpense ksExpense = new KsExpense();
		ksExpense.setExpenseDriver(name);
		ksExpense.setParams(vo.getParams());
		List<KsExpense> expenses = expenseService.selectKsExpenseList(ksExpense);
		employee.setExpenseList(expenses);
		employee.setExpenseCount(expenses.size());
		// 日常支出總額
		final BigDecimal expenseTotal = expenses.stream().map(KsExpense::getExpenseTotal).reduce(BigDecimal.ZERO,
				BigDecimal::add);
		employee.setExpenseTotal(expenseTotal);

		// TODO 油錢
		final KsOilOrder ksOilOrder = new KsOilOrder();
		ksOilOrder.setOilDriver(name);
		ksOilOrder.setParams(vo.getParams());
		List<KsOilOrder> ksOilOrders = oilOrderService.selectKsOilOrderList(ksOilOrder);
		final BigDecimal oilTotal = ksOilOrders.stream().map(KsOilOrder::getOilTotal).reduce(BigDecimal.ZERO,
				BigDecimal::add);
		employee.setOliAmount(oilTotal);
		employee.setOliCount(ksOilOrders.size());

		// 總營業額
		final BigDecimal total = downBoundsRevenue.add(gonorthsRevenue);
		employee.setRevenueTotal(total);

		// 司機營業額(扣除日常開銷 土尾,洗車,發泡)
		final BigDecimal driverRevenue = total.subtract(expenseTotal);
		employee.setDriverRevenue(driverRevenue);

		// 司機提成數
		final BigDecimal royalty = new BigDecimal("0.23");
		// 薪資
		final BigDecimal salary = driverRevenue.multiply(royalty);

		employee.setSalary(salary);

		// 放入資料
		System.out.println("E" + employee.getDownboundCount());
		list.add(employee);
		return getDataTable(list);
	}

}
