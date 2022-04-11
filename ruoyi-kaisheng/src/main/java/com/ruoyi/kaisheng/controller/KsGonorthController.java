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
import com.ruoyi.kaisheng.domain.KsGonorth;
import com.ruoyi.kaisheng.service.IKsGonorthService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 北上表單Controller
 * 
 * @author Sheng
 * @date 2022-03-30
 */
@RestController
@RequestMapping("/ks/gonorth")
public class KsGonorthController extends BaseController
{
    @Autowired
    private IKsGonorthService ksGonorthService;

    /**
     * 查询北上表單列表
     */
    @PreAuthorize("@ss.hasPermi('ks:gonorth:list')")
    @GetMapping("/list")
    public TableDataInfo list(KsGonorth ksGonorth)
    {
        startPage();
        List<KsGonorth> list = ksGonorthService.selectKsGonorthList(ksGonorth);
        return getDataTable(list);
    }

    /**
     * 导出北上表單列表
     */
    @PreAuthorize("@ss.hasPermi('ks:gonorth:export')")
    @Log(title = "北上表單", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, KsGonorth ksGonorth)
    {
        List<KsGonorth> list = ksGonorthService.selectKsGonorthList(ksGonorth);
        ExcelUtil<KsGonorth> util = new ExcelUtil<KsGonorth>(KsGonorth.class);
        util.exportExcel(response, list, "北上表單数据");
    }

    /**
     * 获取北上表單详细信息
     */
    @PreAuthorize("@ss.hasPermi('ks:gonorth:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(ksGonorthService.selectKsGonorthById(id));
    }

    /**
     * 新增北上表單
     */
    @PreAuthorize("@ss.hasPermi('ks:gonorth:add')")
    @Log(title = "北上表單", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody KsGonorth ksGonorth)
    {
        return toAjax(ksGonorthService.insertKsGonorth(ksGonorth));
    }

    /**
     * 修改北上表單
     */
    @PreAuthorize("@ss.hasPermi('ks:gonorth:edit')")
    @Log(title = "北上表單", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody KsGonorth ksGonorth)
    {
        return toAjax(ksGonorthService.updateKsGonorth(ksGonorth));
    }

    /**
     * 删除北上表單
     */
    @PreAuthorize("@ss.hasPermi('ks:gonorth:remove')")
    @Log(title = "北上表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(ksGonorthService.deleteKsGonorthByIds(ids));
    }
}
