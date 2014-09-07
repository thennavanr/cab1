class SitesController < ApplicationController

  respond_to :html, :js, :xml, :css, :txt

  def robots
    @site = Site.find_by_subdomain 
  end

end