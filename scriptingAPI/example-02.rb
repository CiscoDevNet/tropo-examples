require 'net/http'
require 'json'

auth_key     = ""  # authentication header name
auth_token   = ""  # authentication token, in this case it's a Bearer token
host         = ""  # host for the api
port         = ""  # port the api is accepting connections on

text    = URI::encode($currentCall.initialText)             # encoding the text message that was sent
                                                            # so that it will be URI safe

URL     = "#{host}:#{port}/query?text=#{text}"              # url for the api call to api.ai service
uri     = URI.parse URL                                     # parse the url into a URI object
http    = Net::HTTP.new(uri.host, uri.port)                 # create a new http object
headers = { auth_key => auth_token }                        # set headers for the api request
res     = http.get(uri.request_uri, initheader=headers)     # send the api request as a GET

body    = JSON.parse(res.body)                              # parse the body of the response
                                                            # into JSON


if body["control"] == "speech"
  say body["speech"]["text"]
else
  say "Sorry i didn't quite catch that"
end
