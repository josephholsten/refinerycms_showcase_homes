class ImageShowcaseHome < ActiveRecord::Base
  
  belongs_to :image
  belongs_to :showcase_home

  before_save do |image_page|
    image_page.position = (ImagePage.maximum(:position) || -1) + 1
  end

end