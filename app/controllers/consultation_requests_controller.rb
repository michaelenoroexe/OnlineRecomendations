require 'httparty'

class ConsultationRequestsController < ApplicationController
  def create
    patient_params = params.require(:patient).permit(:full_name, :date_of_birth, :phone, :email)
    requests_params = params.require(:consultation_request).permit(:request_text)

    @patient = Patient.new(patient_params)
    if !@patient.save
      render json: @patient.errors.full_messages, status: 400
      return;
    end
    
    @consultation_request = ConsultationRequest.new(patient_id:@patient.id, request_text: requests_params)
    if !@consultation_request.save
      render json: @consultation_request.errors.full_messages, status: 400
      return;
    end

    request_analitics

    render json: { created_request_id: @consultation_request.id }, status: 201 
  end

  private

  def request_analitics
    Thread.new do
      responce = HTTParty.get("https://api.fda.gov/drug/event.json?search=reactionmeddrapt:#{'"'+@consultation_request.request_text+'"'}&limit=1", headers:
      {
        Authorization: "Basic #{ENV['EXTERNAL_API_KEY']}" 
      })
      if responce.code == 200
        takenDrugs = ''
        result = JSON.parse(responce.body)["results"].each do |res|
            takenDrugs += JSON.pretty_generate(res["patient"]["drug"])
        end
        @consultation_request.analytic = takenDrugs
        @consultation_request.save
      end
    end
  end
end
