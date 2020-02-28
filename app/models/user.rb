class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :default_image_url
  def default_image_url
    self.image_url ||= "https://static.thenounproject.com/png/961-200.png"
  end         
end
