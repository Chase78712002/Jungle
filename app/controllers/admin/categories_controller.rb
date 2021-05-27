class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name:ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD']

  def index
  end

  def new
  end

  def create
  end

end
