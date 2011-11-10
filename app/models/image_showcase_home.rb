class ImageShowcaseHome < ActiveRecord::Base
  
  belongs_to :image
  belongs_to :showcase_home

  before_save do |image_showcase_home|
    image_showcase_home.position = (ImageShowcaseHome.maximum(:position) || -1) + 1
  end

end
