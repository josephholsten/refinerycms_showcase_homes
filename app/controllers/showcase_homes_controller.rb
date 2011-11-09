class ShowcaseHomesController < ApplicationController

  before_filter :find_all_showcase_homes
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @showcase_home in the line below:
    present(@page)
  end

  def show
    @showcase_home = ShowcaseHome.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @showcase_home in the line below:
    present(@page)
  end

protected

  def find_all_showcase_homes
    @showcase_homes = ShowcaseHome.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/showcase-homes").first
  end

end
