import request from '@/utils/request'

// 查询車輛表單列表
export function listCar(query) {
  return request({
    url: '/ks/car/list',
    method: 'get',
    params: query
  })
}

// 查询車輛表單列表(用於下拉框)
export function listCarid(query) {
  return request({
    url: '/ks/car/listCarid',
    method: 'get',
    params: query
  })
}

// 查询車輛表單详细
export function getCar(id) {
  return request({
    url: '/ks/car/' + id,
    method: 'get'
  })
}

// 新增車輛表單
export function addCar(data) {
  return request({
    url: '/ks/car',
    method: 'post',
    data: data
  })
}

// 修改車輛表單
export function updateCar(data) {
  return request({
    url: '/ks/car',
    method: 'put',
    data: data
  })
}

// 删除車輛表單
export function delCar(id) {
  return request({
    url: '/ks/car/' + id,
    method: 'delete'
  })
}
