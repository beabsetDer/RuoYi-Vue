import request from '@/utils/request'

// 查询日常開支表單列表
export function listExpense(query) {
  return request({
    url: '/ks/expense/list',
    method: 'get',
    params: query
  })
}

// 查询日常開支表單详细
export function getExpense(id) {
  return request({
    url: '/ks/expense/' + id,
    method: 'get'
  })
}

// 新增日常開支表單
export function addExpense(data) {
  return request({
    url: '/ks/expense',
    method: 'post',
    data: data
  })
}

// 修改日常開支表單
export function updateExpense(data) {
  return request({
    url: '/ks/expense',
    method: 'put',
    data: data
  })
}

// 删除日常開支表單
export function delExpense(id) {
  return request({
    url: '/ks/expense/' + id,
    method: 'delete'
  })
}
