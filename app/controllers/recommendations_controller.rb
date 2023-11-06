class RecommendationsController < ApplicationController
  def index
    @patient = Patient.includes(consultation_requests: :recommendations).find(params[:patient_id])

    all_recommendations = []
      
    @patient.consultation_requests.each do |cons|
      all_recommendations += cons.recommendations
    end

    render json: all_recommendations
  end

  def create
    @cons = params[:request_id]
    if !ConsultationRequest.exists?(@cons) 
      render json: "Consultation request with id: #{@cons} doesn't exist.", status: 400
      return;
    end 
    @recommendation_text = params[:recommendation_text]

    @rec = Recommendation.create(consultation_request_id: @cons, recommendation_text: @recommendation_text)

    if Rails.env.production?
      RecommendationMailer.with(
        patient: ConsultationRequest.includes(:patient).find(@cons).patient)
    end

    render json: { created_recommendation_id: @rec.id }, status: 201 
  end
end
