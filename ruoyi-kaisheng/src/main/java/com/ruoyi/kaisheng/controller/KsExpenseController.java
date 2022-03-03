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
import com.ruoyi.kaisheng.domain.KsExpense;
import com.ruoyi.kaisheng.service.IKsExpenseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 日常開支表單Controller
 * 
 * @author Sheng
 * @date 2022-02-24
 */
@RestController
@RequestMapping("/ks/expense")
public class KsExpenseController extends BaseController
{
    @Autowired
    private IKsExpenseService ksExpenseService;

    /**
     * 查询日常開支表單列表
     */
    @PreAuthorize("@ss.hasPermi('ks:expense:list')")
    @GetMapping("/list")
    public TableDataInfo list(KsExpense ksExpense)
    {
        startPage();
        List<KsExpense> list = ksExpenseService.selectKsExpenseList(ksExpense);
        return getDataTable(list);
    }

    /**
     * 导出日常開支表單列表
     */
    @PreAuthorize("@ss.hasPermi('ks:expense:export')")
    @Log(title = "日常開支表單", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, KsExpense ksExpense)
    {
        List<KsExpense> list = ksExpenseService.selectKsExpenseList(ksExpense);
        ExcelUtil<KsExpense> util = new ExcelUtil<KsExpense>(KsExpense.class);
        util.exportExcel(response, list, "日常開支表單数据");
    }

    /**
     * 获取日常開支表單详细信息
     */
    @PreAuthorize("@ss.hasPermi('ks:expense:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(ksExpenseService.selectKsExpenseById(id));
    }

    /**
     * 新增日常開支表單
     */
    @PreAuthorize("@ss.hasPermi('ks:expense:add')")
    @Log(title = "日常開支表單", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody KsExpense ksExpense)
    {
        return toAjax(ksExpenseService.insertKsExpense(ksExpense));
    }

    /**
     * 修改日常開支表單
     */
    @PreAuthorize("@ss.hasPermi('ks:expense:edit')")
    @Log(title = "日常開支表單", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody KsExpense ksExpense)
    {
        return toAjax(ksExpenseService.updateKsExpense(ksExpense));
    }

    /**
     * 删除日常開支表單
     */
    @PreAuthorize("@ss.hasPermi('ks:expense:remove')")
    @Log(title = "日常開支表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(ksExpenseService.deleteKsExpenseByIds(ids));
    }
}
