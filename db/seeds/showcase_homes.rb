if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'showcase_homes').blank?
      user.plugins.create(:name => 'showcase_homes',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Our Homes',
    :link_url => '/showcase-homes',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/showcase-homes(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end