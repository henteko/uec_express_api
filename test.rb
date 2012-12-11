require File.expand_path(File.dirname(__FILE__) + '/lib/uec_express_api')
require 'json'

faculty = UECExpressApi.new()
gs      = UECExpressApi.new(2)

faculty.to_s
gs.to_s

puts faculty.to_hash.to_json
puts gs.to_hash.to_json
