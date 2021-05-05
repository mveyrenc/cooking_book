require 'role_model'

class User < ActiveRecord::Base
  
  ROLES = %w[admin manager moderator contributor reader banned].freeze
  DEFAULT_ROLE = 'banned'
  
  include RoleModel
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  
  before_save :default_role
  
  ratyrate_rater

  default_scope { order(:name) }

  def role?(base_role)
    logger.debug self.inspect
    if self.role.nil? || self.role.blank?
      false
    else
      ROLES.index(base_role.to_s) >= ROLES.index(self.role)
    end
  end

  def default_role
    self.role ||= 'banned'
  end
  
  def to_s
    email
  end
end
