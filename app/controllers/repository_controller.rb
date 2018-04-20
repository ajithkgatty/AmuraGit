class RepositoryController < ApplicationController
  require 'uri'
  require 'net/http'

  def index
  	username = params[:username]
  	url = URI("https://api.github.com/users/#{username}/repos")

	http = Net::HTTP.new(url.host, url.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE

	request = Net::HTTP::Get.new(url, 'Content-Type' => 'application/json')

	request["cache-control"] = 'no-cache'
	# request['access_token'] = session[:token]
	 @response = JSON.parse(http.request(request).read_body)
	
	
  end

  def show
  	@details = session[params[:id]]
  end
end
