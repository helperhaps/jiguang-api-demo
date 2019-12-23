require 'json'
require 'net/http'

user = 'xxxx'
pass = 'xxxx'

scheme = 'https'
host = 'api.jpush.cn'
path = '/v3/files'
type = 'alias'
file = '../x.txt'

uri = URI("#{scheme}://#{host}#{path}/#{type}")
data = [
  ['filename', open(file)]
]

http = Net::HTTP.new(uri.host, uri.port)
http.set_debug_output($stdout)
http.use_ssl = true

req = Net::HTTP::Post.new(uri.request_uri)
req.basic_auth(user, pass)
req.set_form(data, 'multipart/form-data')
res = http.request(req)

p '----------------------------------------'
p "HTTP/#{res.http_version} #{res.code} #{res.message}"
p res.header.to_hash
p JSON.parse(res.body)
