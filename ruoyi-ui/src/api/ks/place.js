import request from '@/utils/request'

// 查询地點表單列表
export function listPlace(query) {
  return request({
    url: '/ks/place/list',
    method: 'get',
    params: query
  })
}

// 查詢地點列表(下拉選項)
export function listPlaceForSelector(query) {
  return request({
    url: '/ks/place/listPlaceForSelector',
    method: 'get',
    params: query
  })
}


// 查询地點表單详细
export function getPlace(id) {
  return request({
    url: '/ks/place/' + id,
    method: 'get'
  })
}

// 新增地點表單
export function addPlace(data) {
  return request({
    url: '/ks/place',
    method: 'post',
    data: data
  })
}

// 修改地點表單
export function updatePlace(data) {
  return request({
    url: '/ks/place',
    method: 'put',
    data: data
  })
}

// 删除地點表單
export function delPlace(id) {
  return request({
    url: '/ks/place/' + id,
    method: 'delete'
  })
}
