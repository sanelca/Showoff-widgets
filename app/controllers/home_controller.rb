class HomeController < ApplicationController
    def index
        
    end
end

 
=begin 
require 'rest-client'
require 'multi_json'

uri = "https://showoff-rails-react-production.herokuapp.com/api/v1/users"
@createUser = MultiJson.load('{
    "client_id": "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe",
    "client_secret": "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352",
    "user": {
        "first_name": "A",
        "last_name": "User",
        "password": "password",
        "email": "sanel122s2@showoff.ie",
        "image_url": "https://static.thenounproject.com/png/961-200.png"
    }
}')  
rest_resource = RestClient::Resource.new(uri)
@answer = rest_resource.post @createUser, :content_type => "application/json" 
=end
