class ShowcaseHome < ActiveRecord::Base

  acts_as_indexed :fields => [:address, :custom_teaser, :description, :specifics]
  
  has_many :image_showcase_homes
  has_many :images, :through => :image_showcase_homes, :order => 'position ASC'

  validates :address, :presence => true, :uniqueness => true
  accepts_nested_attributes_for :images, :allow_destroy => false
  attr_accessible :address, :custom_teaser, :description, :specifics, :price, :sale_date, :images_attributes

  def images_attributes=(data)
    ImageShowcaseHome.delete_all(:showcase_home_id => self.id)

    (0..(data.length-1)).each do |i|
      unless (image_data = data[i.to_s]).nil? or image_data['id'].blank?
        image_showcase_home = self.image_showcase_homes.new(:image_id => image_data['id'].to_i, :position => i)
        # Add caption if supported
        if RefinerySetting.find_or_set(:showcase_home_images_captions, false)
          image_showcase_home.caption = image_data['caption']
        end
        self.image_showcase_homes << image_showcase_home
      end
    end
  end

  def caption_for_image_index(index)
    self.image_showcase_homes[index].try(:caption).presence || ""
  end

end
