import request from '@/utils/request'

// 查询北上表單列表
export function listGonorth(query) {
  return request({
    url: '/ks/gonorth/list',
    method: 'get',
    params: query
  })
}

// 查询北上表單详细
export function getGonorth(id) {
  return request({
    url: '/ks/gonorth/' + id,
    method: 'get'
  })
}

// 新增北上表單
export function addGonorth(data) {
  return request({
    url: '/ks/gonorth',
    method: 'post',
    data: data
  })
}

// 修改北上表單
export function updateGonorth(data) {
  return request({
    url: '/ks/gonorth',
    method: 'put',
    data: data
  })
}

// 删除北上表單
export function delGonorth(id) {
  return request({
    url: '/ks/gonorth/' + id,
    method: 'delete'
  })
}
