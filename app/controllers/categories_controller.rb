class CategoriesController < ApplicationController
  def create
    @category = Category.create(name: params.dig(:category,:name))
    if @category.save
      flash[:success] = "category created successfully."
      redirect_to root_path
    else
      flash[:alert] = "Already in use"
      redirect_back(fallback_location: root_path)
    end
  end

  def assign_user_to_category
    @category = Category.find_by(id: params[:assign_user_to_category][:category_id].to_i).users
    @doctor = User.find_by(id: params[:assign_user_to_category][:doctor_id].to_i)
    if @category.count < 1
      @category << @doctor
    end
    redirect_to root_path
  end
end
