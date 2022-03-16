import request from '@/utils/request'

// 查询員工表單列表
export function listReport(query) {
  return request({
    url: '/ks/employee/listReport',
    method: 'get',
    params: query
  })
}

// 查询員工表單列表
export function emplistReport(query, str) {
  console.log(str)
  return request({
    url: '/ks/employee/emplistReport/' + str,
    method: 'get',
    params: query
  })
}
