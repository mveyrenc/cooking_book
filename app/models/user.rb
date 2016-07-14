require 'role_model'

class User < ActiveRecord::Base
  
  ROLES = %w[admin manager moderator contributor reader banned].freeze
  
  include RoleModel
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  ratyrate_rater
  
  def to_s
    email
  end
end
