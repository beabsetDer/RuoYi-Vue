import request from '@/utils/request'

// 查询客戶公司表單列表
export function listClient(query) {
  return request({
    url: '/ks/client/list',
    method: 'get',
    params: query
  })
}

export function listClientForSelector(query) {
  return request({
    url: '/ks/client/listClientForSelector',
    method: 'get',
    params: query
  })
}

// 查询客戶公司表單详细
export function getClient(id) {
  return request({
    url: '/ks/client/' + id,
    method: 'get'
  })
}

// 新增客戶公司表單
export function addClient(data) {
  return request({
    url: '/ks/client',
    method: 'post',
    data: data
  })
}

// 修改客戶公司表單
export function updateClient(data) {
  return request({
    url: '/ks/client',
    method: 'put',
    data: data
  })
}

// 删除客戶公司表單
export function delClient(id) {
  return request({
    url: '/ks/client/' + id,
    method: 'delete'
  })
}
