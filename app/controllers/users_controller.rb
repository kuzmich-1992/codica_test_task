class UsersController < ApplicationController
  def index
    if current_user.role == 'doctor'
      @patients = User.where(role: 'patient').all
    elsif current_user.role == 'patient'
      @categories = Category.all
      if params[:category_id]
        @category = Category.includes(:users)
                            .find(params[:category_id])
        @doctors = @category.users.where(role: 'doctor').all
      else
        @doctors = User.where(role: 'doctor').all
      end
    end
  end
end
