import http from 'services/http'

export async function fetchCurrentUser() {
  const response = await http.get('/api/me')
  return response.data
}
