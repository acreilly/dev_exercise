class OrganizationsController < ApplicationController
  before_action :authorize
  def index
    @organizations = Organization.search(params[:search])
  end

  def show
    @organization = Organization.find(params[:id])
  end
end
