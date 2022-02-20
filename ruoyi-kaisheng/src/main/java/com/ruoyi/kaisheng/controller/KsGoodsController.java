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
import com.ruoyi.kaisheng.domain.KsGoods;
import com.ruoyi.kaisheng.service.IKsGoodsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 貨物表單Controller
 * 
 * @author Sheng
 * @date 2022-02-20
 */
@RestController
@RequestMapping("/ks/goods")
public class KsGoodsController extends BaseController
{
    @Autowired
    private IKsGoodsService ksGoodsService;

    /**
     * 查询貨物表單列表
     */
    @PreAuthorize("@ss.hasPermi('ks:goods:list')")
    @GetMapping("/list")
    public TableDataInfo list(KsGoods ksGoods)
    {
        startPage();
        List<KsGoods> list = ksGoodsService.selectKsGoodsList(ksGoods);
        return getDataTable(list);
    }

    /**
     * 导出貨物表單列表
     */
    @PreAuthorize("@ss.hasPermi('ks:goods:export')")
    @Log(title = "貨物表單", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, KsGoods ksGoods)
    {
        List<KsGoods> list = ksGoodsService.selectKsGoodsList(ksGoods);
        ExcelUtil<KsGoods> util = new ExcelUtil<KsGoods>(KsGoods.class);
        util.exportExcel(response, list, "貨物表單数据");
    }

    /**
     * 获取貨物表單详细信息
     */
    @PreAuthorize("@ss.hasPermi('ks:goods:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(ksGoodsService.selectKsGoodsById(id));
    }

    /**
     * 新增貨物表單
     */
    @PreAuthorize("@ss.hasPermi('ks:goods:add')")
    @Log(title = "貨物表單", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody KsGoods ksGoods)
    {
        return toAjax(ksGoodsService.insertKsGoods(ksGoods));
    }

    /**
     * 修改貨物表單
     */
    @PreAuthorize("@ss.hasPermi('ks:goods:edit')")
    @Log(title = "貨物表單", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody KsGoods ksGoods)
    {
        return toAjax(ksGoodsService.updateKsGoods(ksGoods));
    }

    /**
     * 删除貨物表單
     */
    @PreAuthorize("@ss.hasPermi('ks:goods:remove')")
    @Log(title = "貨物表單", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(ksGoodsService.deleteKsGoodsByIds(ids));
    }
}
