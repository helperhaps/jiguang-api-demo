require 'json'
require 'net/http'

user = 'xxxx'
pass = 'xxxx'

scheme = 'https'
host = 'device.jpush.cn'
path = '/v3/tags'
tag = 'x'
platforms = ['ios']

uri = URI("#{scheme}://#{host}#{path}/#{tag}")
params = {
  'platform': platforms.join(',')
}
uri.query = URI.encode_www_form(params)

http = Net::HTTP.new(uri.host, uri.port)
http.set_debug_output($stdout)
http.use_ssl = true

req = Net::HTTP::Delete.new(uri.request_uri)
req.basic_auth(user, pass)
res = http.request(req)

p '----------------------------------------'
p "HTTP/#{res.http_version} #{res.code} #{res.message}"
p res.header.to_hash
p res.body
