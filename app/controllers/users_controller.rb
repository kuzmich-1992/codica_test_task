class UsersController < ApplicationController
  def index
    if current_user.role == 'doctor'
      @patient_ids = current_user.consultations.map(&:patient_id)
      @patients = User.where(id: @patient_ids)
    elsif current_user.role == 'patient'
      @categories = Category.all
      if params[:category_id]
        @category = Category.includes(:users)
                            .find(params[:category_id])
        @doctors = @category.users.where(role: 'doctor').all
      else
        @doctors = User.where(role: 'doctor').all
      end
    elsif current_user.role == 'admin'
      @users = User.where(role: 'patient').all
      @doctors = User.where(role: 'doctor').all
      @categories = Category.all
    end
  end
end
