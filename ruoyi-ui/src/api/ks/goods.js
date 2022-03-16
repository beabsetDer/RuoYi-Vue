import request from '@/utils/request'

// 查询貨物表單列表
export function listGoods(query) {
  return request({
    url: '/ks/goods/list',
    method: 'get',
    params: query
  })
}

// 查询貨物表單列表
export function listGoodsForSelector(query) {
  return request({
    url: '/ks/goods/listGoodsForSelector',
    method: 'get',
    params: query
  })
}

// 查询貨物表單详细
export function getGoods(id) {
  return request({
    url: '/ks/goods/' + id,
    method: 'get'
  })
}

// 新增貨物表單
export function addGoods(data) {
  return request({
    url: '/ks/goods',
    method: 'post',
    data: data
  })
}

// 修改貨物表單
export function updateGoods(data) {
  return request({
    url: '/ks/goods',
    method: 'put',
    data: data
  })
}

// 删除貨物表單
export function delGoods(id) {
  return request({
    url: '/ks/goods/' + id,
    method: 'delete'
  })
}
