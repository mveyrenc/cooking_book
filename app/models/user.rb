require 'role_model'

class User < ActiveRecord::Base
  
  include RoleModel
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  roles_attribute :roles_mask
  
  roles :admin, :manager, :moderator, :contributor, :reader
  
  ratyrate_rater
  
  def to_s
    email
  end
end
