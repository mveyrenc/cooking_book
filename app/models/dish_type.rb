class DishType < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "300", :thumb => "100", :thumb_gray => "100" }, :convert_options => { :thumb_gray => '-colorspace Gray' }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  
  validates :name, presence: true
  
  has_many :recipes
  
  def to_s
    name
  end
end
