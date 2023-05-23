class ConsultationsController < ApplicationController
  def book_consultation
    Consultation.create!(user_id: params[:doctor_id].to_i, patient_id: current_user.id)
    redirect_to root_path
  end

  def update_consultation
    Consultation.find_by(patient_id: params[:recomendation][:patient_id].to_i)
                .update!(recomendation: params[:recomendation][:recomendation], open: false)
    redirect_to root_path
  end
end