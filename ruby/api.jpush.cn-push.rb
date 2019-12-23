require 'json'
require 'net/http'

user = 'xxxx'
pass = 'xxxx'

scheme = 'https'
host = 'api.jpush.cn'
path = '/v3/push'

uri = URI("#{scheme}://#{host}#{path}")
payload = {
  'platform': 'all',
  'audience': 'all',
  'notification': {
    'alert': 'Hello, JiGuang!'
  }
}

http = Net::HTTP.new(uri.host, uri.port)
http.set_debug_output($stdout)
http.use_ssl = true

req = Net::HTTP::Post.new(uri.request_uri)
req.basic_auth(user, pass)
req.content_type = 'application/json'
req.body = payload.to_json
res = http.request(req)

p '----------------------------------------'
p "HTTP/#{res.http_version} #{res.code} #{res.message}"
p res.header.to_hash
p JSON.parse(res.body)
