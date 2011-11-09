class ShowcaseHome < ActiveRecord::Base

  acts_as_indexed :fields => [:address, :custom_teaser, :description, :specifics]
  
  has_many :image_showcase_homes
  has_many :images, :through => :image_showcase_homes, :order => 'position ASC'
  accepts_nested_attributes_for :images, :allow_destroy => false
  

  validates :address, :presence => true, :uniqueness => true
  
end
