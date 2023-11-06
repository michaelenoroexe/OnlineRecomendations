class RecommendationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def recommendation_email
    @patient = params[:patient]
    mail(to: @patient.email, subject: 'New Recommendation')
  end
end
