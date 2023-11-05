class MainController < ApplicationController
  require 'net/http'
  def create_consultation
    @consultation_request = ConsultationRequest.new(consultation_request_params)
    if @consultation_request.save
      render json: @consultation_request, status: :created
    else
      render json: @consultation_request.errors, status: :unprocessable_entity
    end
  end
  private
  def consultation_request_params
    params.permit(:patient, :request_text)
  end

  def create_recomendation
    patient_id = params[:patient_id]
    request_id = params[:request_id]
    test_url = "https://example.com/text?patient_id=#{patient_id}&request_id=#{request_id}"
    text_response = Net::HTTP.get(URI.parse(test_url))
    received_text = text_response
    new_text = "Вам стоит проконсультироваться насчет #{received_text}"
    @recommendation = Recommendation.new(consultation_request: request_id, recommendation_text: new_text)
    if @recommendation.save
      NotificationMailer.patient_notification(consultation_request.patient.email, "Получена рекомендация").deliver_now
      render json: @recommendation, status: :created
    else
      render json: @recommendation.errors, status: :unprocessable_entity
    end
  end

   def find_recomendations
    patient = Person.find(params[:patient_id])
    consultation_requests = ConsultationRequest.where(patient: patient)
    consultation_request_ids = consultation_requests.pluck(:id)
    @recommendations = Recommendation.where(consultation_request: consultation_request_ids)
    render json: @recommendations
  end
end
