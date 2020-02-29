class User < ApplicationRecord
  require 'rest-client'
  require 'multi_json'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :access_grants,
         class_name: 'Doorkeeper::AccessGrant',
         foreign_key: :resource_owner_id,
         dependent: :delete_all # or :destroy if you need callbacks

        has_many :access_tokens,
        class_name: 'Doorkeeper::AccessToken',
        foreign_key: :resource_owner_id,
        dependent: :delete_all # or :destroy if you need callbacks
         
  before_create :default_image_url
  

  after_create do | user |
    # uri = "https://showoff-rails-react-production.herokuapp.com/api/v1/users"
    # @createUser = MultiJson.load('{
    #     "client_id": "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe",
    #     "client_secret": "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352",
    #     "user": {
    #         "first_name": "' + user.first_name + '",
    #         "last_name": "' + user.last_name + '",
    #         "password": "' + user.password + '",
    #         "email": "' + user.email + '",
    #         "image_url": "https://static.thenounproject.com/png/961-200.png"
    #     }
    # }')  
    # rest_resource = RestClient::Resource.new(uri)
    # rest_resource.post @createUser, :content_type => "application/json"   
  end

  def default_image_url
    self.image_url ||= "https://static.thenounproject.com/png/961-200.png"
  end         
end
