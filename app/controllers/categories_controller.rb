class CategoriesController < ApplicationController
  def create
    Category.create!(name: params.dig(:category,:name))
    redirect_to root_path
  end
end