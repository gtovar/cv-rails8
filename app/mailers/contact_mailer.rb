class ContactMailer < ApplicationMailer
  default to: -> { Resume.first.contact_infos.find_by(kind: "email")&.value }

  def contact_message(params)
    @name    = params[:name]
    @email   = params[:email]
    @phone   = params[:phone]
    @subject = params[:subject]
    @message = params[:message]

    mail(
      from: @email,
      subject: "SITIO WEB te envian un correo de: #{@email}"
    )
  end
end
