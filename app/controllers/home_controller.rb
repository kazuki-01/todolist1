class HomeController < ApplicationController
  before_action :login?, only: :home

  def about
  end

  def home
  end

end
