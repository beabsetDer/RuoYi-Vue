import request from '@/utils/request'

// 查询加油表單列表
export function listOrder(query) {
  return request({
    url: '/ks/order/list',
    method: 'get',
    params: query
  })
}

// 查询加油表單详细
export function getOrder(id) {
  return request({
    url: '/ks/order/' + id,
    method: 'get'
  })
}

// 新增加油表單
export function addOrder(data) {
  return request({
    url: '/ks/order',
    method: 'post',
    data: data
  })
}

// 修改加油表單
export function updateOrder(data) {
  return request({
    url: '/ks/order',
    method: 'put',
    data: data
  })
}

// 删除加油表單
export function delOrder(id) {
  return request({
    url: '/ks/order/' + id,
    method: 'delete'
  })
}
