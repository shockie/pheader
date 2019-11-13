import http from 'services/http'

export async function create(params) {
  const response = await http.post("/api/feeds", {
    feed: params
  })
  return response.data
}
