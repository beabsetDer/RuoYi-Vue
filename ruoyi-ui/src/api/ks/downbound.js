import request from '@/utils/request'

// 查询南下表單列表
export function listDownbound(query) {
  return request({
    url: '/ks/downbound/list',
    method: 'get',
    params: query
  })
}

// 查询南下表單详细
export function getDownbound(id) {
  return request({
    url: '/ks/downbound/' + id,
    method: 'get'
  })
}

// 新增南下表單
export function addDownbound(data) {
  return request({
    url: '/ks/downbound',
    method: 'post',
    data: data
  })
}

// 修改南下表單
export function updateDownbound(data) {
  return request({
    url: '/ks/downbound',
    method: 'put',
    data: data
  })
}

// 删除南下表單
export function delDownbound(id) {
  return request({
    url: '/ks/downbound/' + id,
    method: 'delete'
  })
}
