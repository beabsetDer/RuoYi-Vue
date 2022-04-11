package com.ruoyi.kaisheng.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Workbook;
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
import com.ruoyi.kaisheng.domain.KsDownbound;
import com.ruoyi.kaisheng.domain.KsEmployee;
import com.ruoyi.kaisheng.domain.KsExpense;
import com.ruoyi.kaisheng.domain.KsGonorth;
import com.ruoyi.kaisheng.domain.KsOilOrder;
import com.ruoyi.kaisheng.service.IKsClientService;
import com.ruoyi.kaisheng.service.IKsDownboundService;
import com.ruoyi.kaisheng.service.IKsGonorthService;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelWriter;
import cn.hutool.poi.excel.StyleSet;

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
	@Autowired
	private IKsGonorthService gonorthService;
	@Autowired
	private IKsDownboundService downboundService;

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

	@PreAuthorize("@ss.hasPermi('ks:client:list')")
	@GetMapping("/listReportClient")
	public TableDataInfo listReportClient(KsClient vo) {
		startPage();

		List<KsClient> list = ksClientService.selectKsClientList(vo);
		for (KsClient ksClient : list) {
			String clientId = ksClient.getClientId();
			String downboundOutset = (String) vo.getParams().get("outset");
			String downboundYard = (String) vo.getParams().get("yard");
			// 南下
			KsDownbound ksDownbound = new KsDownbound();

			ksDownbound.setDownboundCompany(clientId);
			ksDownbound.setDownboundOutset(downboundOutset);
			ksDownbound.setDownboundYard(downboundYard);
			ksDownbound.setParams(vo.getParams());

			List<KsDownbound> ksDownbounds = downboundService.selectKsDownboundList(ksDownbound);
			ksClient.setDownboundCount(ksDownbounds.size());
			// 南下營業額
			final BigDecimal downBoundsRevenue = ksDownbounds.stream().map(KsDownbound::getDownboundTotal)
					.reduce(BigDecimal.ZERO, BigDecimal::add);
			ksClient.setDownboundRevenue(downBoundsRevenue);

			// 北上
//			KsGonorth ksGonorth = new KsGonorth();
//			ksGonorth.setGonorthCompany(clientId);
//			ksGonorth.setParams(vo.getParams());
//			List<KsGonorth> ksGonorths = gonorthService.selectKsGonorthList(ksGonorth);
//			ksClient.setGonorthCount(ksGonorths.size());

		}
		return getDataTable(list);
	}

	/**
	 * 获取員工表單详细信息
	 */
	@PreAuthorize("@ss.hasPermi('ks:client:clientlistReport')")
	@GetMapping(value = "/clientlistReport/{clientId}")
	public TableDataInfo clientlistReport(@PathVariable("clientId") String clientId, KsClient vo) {
		/**
		 * https://www.it145.com/9/169438.html
		 *
		 * clientId 跟 vo 會自動填充 相同的屬性
		 */

		final List<KsClient> list = new ArrayList<KsClient>();
		final KsClient ksClient = ksClientService.selectKsClientByClientId(clientId);
		// 找不到該廠商
		if (ksClient == null) {
			System.out.println("ksClient = null");
			return null;
		}

		final String selectClientId = ksClient.getClientId();

		// TODO 南下單資料
		final KsDownbound ksDownbound = new KsDownbound();
		ksDownbound.setDownboundCompany(selectClientId);

		String downboundOutset = (String) vo.getParams().get("outset");
		String downboundYard = (String) vo.getParams().get("yard");

		System.out.println("downboundYard:" + downboundYard);
		System.out.println("downboundOutse:" + downboundOutset);

		ksDownbound.setDownboundOutset(downboundOutset);
		ksDownbound.setDownboundYard(downboundYard);

		ksDownbound.setParams(vo.getParams());

		List<KsDownbound> ksDownbounds = downboundService.selectKsDownboundList(ksDownbound);

		ksClient.setDownboundCount(ksDownbounds.size());
		ksClient.setDownboundList(ksDownbounds);
		// 南下營業額
		final BigDecimal downBoundsRevenue = ksDownbounds.stream().map(KsDownbound::getDownboundTotal)
				.reduce(BigDecimal.ZERO, BigDecimal::add);
		ksClient.setDownboundRevenue(downBoundsRevenue);
		// 排序..
		Collections.sort(ksDownbounds, new Comparator<KsDownbound>() {
			@Override
			public int compare(KsDownbound o1, KsDownbound o2) {
				return o1.getDownboundDate().compareTo(o2.getDownboundDate());
			}
		});

//		// TODO 北上單資料
//		final KsGonorth ksGonorth = new KsGonorth();
//		ksGonorth.setGonorthCompany(selectClientId);
//		ksGonorth.setParams(vo.getParams());
//		List<KsGonorth> ksGonorths = gonorthService.selectKsGonorthList(ksGonorth);
//		ksClient.setGonorthList(ksGonorths);
//		ksClient.setGonorthCount(ksGonorths.size());
//		// 北上下營業額
//		final BigDecimal gonorthsRevenue = ksGonorths.stream().map(KsGonorth::getGonorthBillTotal)
//				.reduce(BigDecimal.ZERO, BigDecimal::add);
//		ksClient.setGonorthRevenue(gonorthsRevenue);

		list.add(ksClient);
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
	@PreAuthorize("@ss.hasPermi('ks:client:exportExcel')")
	@Log(title = "廠商請款", businessType = BusinessType.EXPORT)
	@PostMapping(value = "/exportExcel/{clientId}")
	public void ExcelTemplate(@PathVariable("clientId") String clientId, KsClient vo, HttpServletResponse response)
			throws IOException {

		// 搜尋員工
		final KsClient ksClient = ksClientService.selectKsClientByClientId(clientId);

		System.out.println("ksClient.getClientId():" + ksClient.getClientId());

		final String client = ksClient.getClientId();

		// TODO 南下單資料
		final KsDownbound ksDownbound = new KsDownbound();
		ksDownbound.setDownboundCompany(client);
		String downboundOutset = (String) vo.getParams().get("outset");
		String downboundYard = (String) vo.getParams().get("yard");

		System.out.println("downboundYard:" + downboundYard);
		System.out.println("downboundOutse:" + downboundOutset);

		ksDownbound.setDownboundOutset(downboundOutset);
		ksDownbound.setDownboundYard(downboundYard);
		ksDownbound.setParams(vo.getParams());
		List<KsDownbound> ksDownbounds = downboundService.selectKsDownboundList(ksDownbound);
		ksClient.setDownboundCount(ksDownbounds.size());
		ksClient.setDownboundList(ksDownbounds);
		// 南下營業額
		final BigDecimal downBoundsRevenue = ksDownbounds.stream().map(KsDownbound::getDownboundTotal)
				.reduce(BigDecimal.ZERO, BigDecimal::add);
		ksClient.setDownboundRevenue(downBoundsRevenue);

		createExcelFile(response, ksClient);
	}

	public static void createExcelFile(HttpServletResponse response, KsClient ksClient) throws IOException {
		// 通过工具类创建writer，默认创建xls格式
		ExcelWriter writer = cn.hutool.poi.excel.ExcelUtil.getWriter();
		// 樣式
		DataFormat dataFormat = writer.getWorkbook().createDataFormat();
		// date type
		StyleSet style = writer.getStyleSet();
		style.setFont((short) 0, (short) 12, "微軟正黑體", false);
		style.setWrapText();
		// 字體大小
		// writer.getWorkbook().createCellStyle().setFont(setBaseFont(writer.getWorkbook(),
		// true, false, "標楷體", 10));
		CellStyle dateCellStyle = style.getCellStyleForDate();
		dateCellStyle.setDataFormat(dataFormat.getFormat("yyyy-mm-dd"));
		// 寬度
		writer.setColumnWidth(0, 15);
		writer.setColumnWidth(1, 15);
		writer.setColumnWidth(2, 15);
		writer.setColumnWidth(3, 15);
		writer.setColumnWidth(4, 15);
		writer.setColumnWidth(5, 15);
		writer.setColumnWidth(6, 15);
		writer.setColumnWidth(7, 15);
		writer.setColumnWidth(8, 15);
		writer.setColumnWidth(9, 15);
		writer.setColumnWidth(10, 15);
		// 自定义标题别名
		writer.addHeaderAlias("clientId", "廠商編號");
		writer.addHeaderAlias("clientName", "廠商名稱");
		writer.addHeaderAlias("downboundCount", "車趟筆數");
		writer.addHeaderAlias("downboundRevenue", "請款金額");

		// 默认的，未添加alias的属性也会写出，如果想只写出加了别名的字段，可以调用此方法排除之
		writer.setOnlyAlias(true);
		// 合并单元格后的标题行，使用默认标题样式
		writer.merge(3, "廠商請款明細(南下)");
		// writer.merge(0, 1, 0, 12, "員工薪資明細", true);
		// 一次性写出内容，使用默认样式，强制输出标题
		List<KsClient> rows = CollUtil.newArrayList(ksClient);

		writer.write(rows, true);

		// 跳过一行
		writer.passCurrentRow();
		writer.addHeaderAlias("downboundDate", "日期");
		// writer.addHeaderAlias("downboundId", "南下單編號");
		writer.addHeaderAlias("downboundLicensePlateNumber", "車牌");
		writer.addHeaderAlias("downboundSoftOrderNumber", "請款單");
		writer.addHeaderAlias("downboundCouponNumber", "聯單");

		// writer.addHeaderAlias("downboundDriver", "姓名");
		// writer.addHeaderAlias("downboundCompany", "公司");
		writer.addHeaderAlias("downboundOutset", "起點");
		// writer.addHeaderAlias("downboundYard", "堆場");
		// writer.addHeaderAlias("downboundCash", "現金");
		// writer.addHeaderAlias("downboundGoods", "貨物名稱");
		writer.addHeaderAlias("downboundGoodsMt", "貨物噸數");
		writer.addHeaderAlias("downboundGoodsPrice", "貨物單價");
		writer.addHeaderAlias("downboundTotal", "運費");
		// 默认的，未添加alias的属性也会写出，如果想只写出加了别名的字段，可以调用此方法排除之
		writer.setOnlyAlias(true);
		writer.merge(7, "車趟明細(南下)");
		List<KsDownbound> downboundList = ksClient.getDownboundList();

		// 排序..
		Collections.sort(downboundList, new Comparator<KsDownbound>() {
			@Override
			public int compare(KsDownbound o1, KsDownbound o2) {
				return o1.getDownboundDate().compareTo(o2.getDownboundDate());
			}
		});

		// 去小數尾數0的
//		for (int i = 0; i < downboundList.size(); i++) {
//			final KsDownbound ksDownbound = downboundList.get(i);
//			if (ksDownbound != null) {
//
//				final BigDecimal downboundGoodsMt = new BigDecimal(
//						ksDownbound.getDownboundGoodsMt().stripTrailingZeros().toPlainString());
//
//				final BigDecimal downboundGoodsPrice = new BigDecimal(
//						ksDownbound.getDownboundGoodsPrice().stripTrailingZeros().toPlainString());
//
//				final BigDecimal downboundTotal = new BigDecimal(
//						ksDownbound.getDownboundTotal().stripTrailingZeros().toPlainString());
//
//				final BigDecimal downboundGoodsCustomerMt = new BigDecimal(
//						ksDownbound.getDownboundGoodsCustomerMt().stripTrailingZeros().toPlainString());
//
//				final BigDecimal downboundGoodsPriceDriver = new BigDecimal(
//						ksDownbound.getDownboundGoodsPriceDriver().stripTrailingZeros().toPlainString());
//
//				final BigDecimal downboundBillTotal = new BigDecimal(
//						ksDownbound.getDownboundBillTotal().stripTrailingZeros().toPlainString());
//
//				ksDownbound.setDownboundGoodsMt(downboundGoodsMt);
//				ksDownbound.setDownboundGoodsPrice(downboundGoodsPrice);
//				ksDownbound.setDownboundTotal(downboundTotal);
//				ksDownbound.setDownboundGoodsCustomerMt(downboundGoodsCustomerMt);
//				ksDownbound.setDownboundGoodsPriceDriver(downboundGoodsPriceDriver);
//				ksDownbound.setDownboundBillTotal(downboundBillTotal);
//
//			}
//		}

		writer.write(downboundList, true);

		BigDecimal total1 = new BigDecimal("0.0");
		for (KsDownbound downbound : downboundList) {
			total1 = total1.add(downbound.getDownboundTotal());
		}
		// 去除尾數0的
		// total1.stripTrailingZeros().toPlainString();

		BigDecimal totalMT = new BigDecimal("0.0");
		for (KsDownbound downbound : downboundList) {
			totalMT = totalMT.add(downbound.getDownboundGoodsMt());
		}
		// 去除尾數0的
		// totalMT.stripTrailingZeros().toPlainString();

		// 跳过一行
		// writer.passCurrentRow();
		List<String> row1 = CollUtil.newArrayList("", "", "", "", "", "", "", "");
		List<String> row2 = CollUtil.newArrayList("", "", "", "", "總數",
				totalMT.stripTrailingZeros().toPlainString() + " (米)", "總額",
				total1.stripTrailingZeros().toPlainString() + " (元)");
		List<List<String>> line2 = CollUtil.newArrayList(row1, row2);
		// 一次性写出内容，使用默认样式，强制输出标题
		writer.write(line2, false);
		// 跳过一行
		writer.passCurrentRow();

		// response为HttpServletResponse对象
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		// test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
		response.setHeader("Content-Disposition", "attachment;filename=" + ksClient.getClientId() + ".xls");
		response.setHeader("Access-Control-Expose-Headers", "Content-Disposition");
		ServletOutputStream out = response.getOutputStream();

		writer.flush(out, true);
		// 关闭writer，释放内存
		writer.close();
		// 此处记得关闭输出Servlet流
		IoUtil.close(out);

		System.out.println("導出成功");
	}

	/**
	 * 方法描述: 设置基础字体样式字体 这里保留最基础的样式使用
	 *
	 * @param workbook 工作簿
	 * @param bold     是否粗体
	 * @param fontName 字体名称
	 * @param fontSize 字体大小
	 * @return org.apache.poi.ss.usermodel.Font
	 * @author wqf
	 * @date 2021/5/19 15:58
	 */
	public static Font setBaseFont(Workbook workbook, boolean bold, boolean italic, String fontName, int fontSize) {
		Font font = workbook.createFont();
		// 设置字体名称 宋体 / 微软雅黑 /等
		font.setFontName(fontName);
		// 设置是否斜体
		font.setItalic(italic);
		// 设置字体高度
		// font.setFontHeight((short) fontHeight);
		// 设置字体大小 以磅为单位
		font.setFontHeightInPoints((short) fontSize);
		// 设置是否加粗
		font.setBold(bold);
		// 默认字体颜色
		// font.setColor(Font.COLOR_NORMAL);
		// 红色
		// font.setColor(Font.COLOR_RED);
		// 设置下划线样式
		// font.setUnderline(Font.ANSI_CHARSET);
		// 设定文字删除线
		// font.setStrikeout(true);
		return font;
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
