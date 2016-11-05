# wrap rpn calculator as a service

require 'sinatra'
require 'json'
require 'rpn_ruby'

include RPN

configure do
  set :port, '3000'
end

get '/' do
  content_type :json
  usage = 
    { :usage =>
      [
        {
          :path => '/calc/*', 
          :description => 'pass values in postfix order, like this: /calc/6/4/5/+/*. To avoid conflicts with URL strings, use "d" instead of "/\" for division.'
        },
      ]
     }
  response['Access-Control-Allow-Origin'] = '*'     
  usage.to_json
end

# Input comes in like this:
# calc/2/5/7/+/*/8/2/d/-
#
# which is interpreted as this expression (postfix):
# 2 5 7 + * 8 2 / -
# 
# 'd' is used for 'division' so that the '/' will not
# conflict with the URL string. The underlying implementation
# accepts '/' as well, so it can be called in other contexts
# without looking funny.
#
get '/calc/*' do
  content_type :json
  @stack = []
  expression = ''
  params['splat'][0].split('/').each do |value|
    enter value
    expression << (value == 'd' ? '/' : value) << ' '
  end
  answer =
    { :rpn =>
      { :input => params['splat'][0],
        :expression => expression,
        :result => result
      }
    }
  response['Access-Control-Allow-Origin'] = '*'
  answer.to_json  
end

