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
import com.ruoyi.kaisheng.domain.KsEmployee;
import com.ruoyi.kaisheng.service.IKsEmployeeService;
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
public class KsEmployeeController extends BaseController
{
    @Autowired
    private IKsEmployeeService ksEmployeeService;

    /**
     * 查询員工表單列表
     */
    @PreAuthorize("@ss.hasPermi('ks:employee:list')")
    @GetMapping("/list")
    public TableDataInfo list(KsEmployee ksEmployee)
    {
        startPage();
        List<KsEmployee> list = ksEmployeeService.selectKsEmployeeList(ksEmployee);
        return getDataTable(list);
    }

    /**
     * 导出員工表單列表
     */
    @PreAuthorize("@ss.hasPermi('ks:employee:export')")
    @Log(title = "員工表單", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, KsEmployee ksEmployee)
    {
        List<KsEmployee> list = ksEmployeeService.selectKsEmployeeList(ksEmployee);
        ExcelUtil<KsEmployee> util = new ExcelUtil<KsEmployee>(KsEmployee.class);
        util.exportExcel(response, list, "員工表單数据");
    }

    /**
     * 获取員工表單详细信息
     */
    @PreAuthorize("@ss.hasPermi('ks:employee:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(ksEmployeeService.selectKsEmployeeById(id));
    }

    /**
     * 新增員工表單
     */
    @PreAuthorize("@ss.hasPermi('ks:employee:add')")
    @Log(title = "員工表單", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody KsEmployee ksEmployee)
    {
        return toAjax(ksEmployeeService.insertKsEmployee(ksEmployee));
    }

    /**
     * 修改員工表單
     */
    @PreAuthorize("@ss.hasPermi('ks:employee:edit')")
    @Log(title = "員工表單", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody KsEmployee ksEmployee)
    {
        return toAjax(ksEmployeeService.updateKsEmployee(ksEmployee));
    }

    /**
     * 删除員工表單
     */
    @PreAuthorize("@ss.hasPermi('ks:employee:remove')")
    @Log(title = "員工表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(ksEmployeeService.deleteKsEmployeeByIds(ids));
    }
}
