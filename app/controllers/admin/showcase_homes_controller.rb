class Admin::ShowcaseHomesController < Admin::BaseController

  crudify :showcase_home,
          :title_attribute => 'address', :xhr_paging => true

end
