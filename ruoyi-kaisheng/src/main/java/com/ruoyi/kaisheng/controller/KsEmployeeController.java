package com.ruoyi.kaisheng.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelWriter;
import cn.hutool.poi.excel.StyleSet;

import com.github.pagehelper.PageHelper;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.kaisheng.domain.*;
import com.ruoyi.kaisheng.service.*;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

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

	/**
	 * excel文件导出接口
	 *
	 * @param response
	 * @param employeeId
	 * @param vo
	 * @throws IOException
	 */
	@PreAuthorize("@ss.hasPermi('ks:employee:exportExcel')")
	@Log(title = "員工薪資", businessType = BusinessType.EXPORT)
	@PostMapping(value = "/exportExcel/{employeeId}")
	public void ExcelTemplate(@PathVariable("employeeId") String employeeId, KsEmployee vo,
			HttpServletResponse response) throws IOException {

		// 搜尋員工
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
		createExcelFile(response, employee);
	}

	public static void createExcelFile(HttpServletResponse response, KsEmployee ksEmployee) throws IOException {
		// 通过工具类创建writer，默认创建xls格式
		ExcelWriter writer = cn.hutool.poi.excel.ExcelUtil.getWriter();
		// 樣式
		DataFormat dataFormat = writer.getWorkbook().createDataFormat();
		// date type
		StyleSet style = writer.getStyleSet();
		style.setWrapText();
		CellStyle dateCellStyle = style.getCellStyleForDate();
		dateCellStyle.setDataFormat(dataFormat.getFormat("yyyy-mm-dd"));
		// 寬度
		writer.setColumnWidth(0, 12);
		writer.setColumnWidth(1, 12);
		writer.setColumnWidth(6, 12);
		writer.setColumnWidth(7, 12);
		writer.setColumnWidth(8, 12);
		writer.setColumnWidth(11, 12);
		// 自定义标题别名
		writer.addHeaderAlias("employeeId", "員工編號");
		writer.addHeaderAlias("name", "員工姓名");
		writer.addHeaderAlias("downboundCount", "南下次數");
		// writer.addHeaderAlias("downboundRevenue", "南下＄");
		writer.addHeaderAlias("gonorthCount", "北上次數");
		// writer.addHeaderAlias("gonorthRevenue", "北上＄");
		writer.addHeaderAlias("revenueTotal", "總營業額");
		writer.addHeaderAlias("expenseCount", "日常單數");
		writer.addHeaderAlias("expenseTotal", "日常＄");
		writer.addHeaderAlias("oliCount", "加油單數");
		// writer.addHeaderAlias("oliAmount", "油錢總額");
		writer.addHeaderAlias("driverRevenue", "司機營業額");
		writer.addHeaderAlias("salary", "薪水");
		// 默认的，未添加alias的属性也会写出，如果想只写出加了别名的字段，可以调用此方法排除之
		writer.setOnlyAlias(true);
		// 合并单元格后的标题行，使用默认标题样式
		writer.merge(12, "員工薪資明細");
		// writer.merge(0, 1, 0, 12, "員工薪資明細", true);
		// 一次性写出内容，使用默认样式，强制输出标题
		List<KsEmployee> rows = CollUtil.newArrayList(ksEmployee);

		writer.write(rows, true);

		// 跳过一行
		writer.passCurrentRow();
		writer.addHeaderAlias("downboundDate", "日期");
		writer.addHeaderAlias("downboundId", "南下單編號");
		writer.addHeaderAlias("downboundLicensePlateNumber", "車牌");
		writer.addHeaderAlias("downboundDriver", "姓名");
		writer.addHeaderAlias("downboundCompany", "公司");
		writer.addHeaderAlias("downboundOutset", "起點");
		writer.addHeaderAlias("downboundYard", "堆場");
		writer.addHeaderAlias("downboundCash", "現金");
		writer.addHeaderAlias("downboundGoods", "貨物名稱");
		writer.addHeaderAlias("downboundGoodsMt", "貨物噸數");
		writer.addHeaderAlias("downboundGoodsPrice", "貨物單價");
		writer.addHeaderAlias("downboundTotal", "此趟運費");
		// 默认的，未添加alias的属性也会写出，如果想只写出加了别名的字段，可以调用此方法排除之
		writer.setOnlyAlias(true);
		writer.merge(11, "南北车趟详细资料");
		List<KsDownbound> downboundList = ksEmployee.getDownboundList();
		// 排序..
		Collections.sort(downboundList, new Comparator<KsDownbound>() {
			@Override
			public int compare(KsDownbound o1, KsDownbound o2) {
				return o1.getDownboundDate().compareTo(o2.getDownboundDate());
			}
		});

		writer.write(downboundList, true);

		BigDecimal total1 = new BigDecimal("0");
		for (KsDownbound downbound : downboundList) {
			total1 = total1.add(downbound.getDownboundDriverPay());
		}
		// 跳过一行
		// writer.passCurrentRow();
		List<String> row1 = CollUtil.newArrayList("", "", "", "", "", "", "", "", "", "", "", "");
		List<String> row2 = CollUtil.newArrayList("", "", "", "", "", "", "", "", "", "", "合计",
				String.valueOf(total1.doubleValue()));
		List<List<String>> line2 = CollUtil.newArrayList(row1, row2);
		// 一次性写出内容，使用默认样式，强制输出标题
		writer.write(line2, false);
		// 跳过一行
		writer.passCurrentRow();

		writer.addHeaderAlias("gonorthDate", "日期");
		writer.addHeaderAlias("gonorthId", "北上單編號");
		writer.addHeaderAlias("gonorthLicensePlateNumber", "車牌");
		writer.addHeaderAlias("gonorthDriver", "姓名");
		writer.addHeaderAlias("gonorthCompany", "公司");
		writer.addHeaderAlias("gonorthOutset", "起點");
		writer.addHeaderAlias("gonorthYard", "堆場");
		writer.addHeaderAlias("gonorthCash", "現金");
		writer.addHeaderAlias("gonorthGoods", "貨物名稱");
		writer.addHeaderAlias("gonorthGoodsMt", "貨物噸數");
		writer.addHeaderAlias("gonorthGoodsPriceCompany", "貨物單價");
		writer.addHeaderAlias("gonorthTotal", "此趟運費");
		// 默认的，未添加alias的属性也会写出，如果想只写出加了别名的字段，可以调用此方法排除之
		writer.setOnlyAlias(true);
		writer.merge(11, "北上車趟資料");
		List<KsGonorth> gonorthList = ksEmployee.getGonorthList();

		// 排序..
		Collections.sort(gonorthList, new Comparator<KsGonorth>() {
			@Override
			public int compare(KsGonorth o1, KsGonorth o2) {
				return o1.getGonorthDate().compareTo(o2.getGonorthDate());
			}
		});

		writer.write(gonorthList, true);

		BigDecimal total2 = new BigDecimal("0");
		for (KsGonorth gonorth : gonorthList) {
			total2 = total2.add(gonorth.getGonorthDriverPay());
		}
		// 跳过一行
		// writer.passCurrentRow();
		List<String> row4 = CollUtil.newArrayList("", "", "", "", "", "", "", "", "", "", "", "");
		List<String> row5 = CollUtil.newArrayList("", "", "", "", "", "", "", "", "", "", "合计",
				String.valueOf(total2.doubleValue()));
		List<List<String>> line4 = CollUtil.newArrayList(row4, row5);
		// 一次性写出内容，使用默认样式，强制输出标题
		writer.write(line4, false);

		// response为HttpServletResponse对象
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		// test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
		response.setHeader("Content-Disposition", "attachment;filename=" + ksEmployee.getEmployeeId() + ".xls");
		response.setHeader("Access-Control-Expose-Headers", "Content-Disposition");
		ServletOutputStream out = response.getOutputStream();

		writer.flush(out, true);
		// 关闭writer，释放内存
		writer.close();
		// 此处记得关闭输出Servlet流
		IoUtil.close(out);

		System.out.println("導出成功");
	}

}
