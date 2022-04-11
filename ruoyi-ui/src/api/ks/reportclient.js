import request from '@/utils/request'

// 查询廠商整體資料
export function listReportClient(query) {
  return request({
    url: '/ks/client/listReportClient',
    method: 'get',
    params: query
  })
}

// 查询廠商報表
export function clientlistReport(query, str) {
  console.log(str)
  return request({
    url: '/ks/client/clientlistReport/' + str,
    method: 'get',
    params: query
  })
}
