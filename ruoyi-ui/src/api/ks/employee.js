import request from '@/utils/request'

// 查询員工表單列表
export function listEmployee(query) {
  return request({
    url: '/ks/employee/list',
    method: 'get',
    params: query
  })
}

// 查询員工表單列表(用於下拉框)
export function listUser(query) {
  return request({
    url: '/ks/employee/listUser',
    method: 'get',
    params: query
  })
}

// 查询員工表單详细
export function getEmployee(id) {
  return request({
    url: '/ks/employee/' + id,
    method: 'get'
  })
}

// 新增員工表單
export function addEmployee(data) {
  return request({
    url: '/ks/employee',
    method: 'post',
    data: data
  })
}

// 修改員工表單
export function updateEmployee(data) {
  return request({
    url: '/ks/employee',
    method: 'put',
    data: data
  })
}

// 删除員工表單
export function delEmployee(id) {
  return request({
    url: '/ks/employee/' + id,
    method: 'delete'
  })
}
