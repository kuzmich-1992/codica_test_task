class ConsultationsController < ApplicationController
  def book_consultation
    Consultation.create!(user_id: params[:doctor_id].to_i, patient_id: current_user.id)
    redirect_to root_path
  end
end