require 'rubygems'
require 'sinatra'
require 'tropo-webapi-ruby'
require 'json'

set :bind, '0.0.0.0'


  post '/tropo/index.json' do
    json_session = request.env["rack.input"].read
    pretty_print json_session

    params = JSON.parse json_session
    params = params["session"]["parameters"]
    action = params["actions"]
    param_hash = {
      "text_to_number" => method(:text_to_number)
    }
    if param_hash.key?(action)
      param_hash[action].call params
    else
      default_response
    end
  end

  def default_response
    t = Tropo::Generator.new
    t.say "Hello Cisco Live! Isn't tropo awesome?"
    pretty_print t.response
    t.response
  end

  def text_to_number params
    number  = params["number"]
    text    = params["text"]
    network = params["network"]
    t       = Tropo::Generator.new
    t.call :to => number,
           :network => network
    t.say text
    pretty_print t.response
    t.response
  end

  def pretty_print value
    json_response = JSON.parse value
    puts JSON.pretty_generate json_response
  end
