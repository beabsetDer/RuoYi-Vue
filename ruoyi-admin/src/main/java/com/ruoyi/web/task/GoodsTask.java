package com.ruoyi.web.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ruoyi.kaisheng.domain.KsGoods;
import com.ruoyi.kaisheng.service.IKsGoodsService;

@Component("goodsTask")
public class GoodsTask {
	
	@Autowired
	private IKsGoodsService goodsService;
	
	
	public void fun1() {
		List<KsGoods> list = goodsService.selectKsGoodsList(new KsGoods());
	
		list.forEach(System.out::println);
	}
	

}
