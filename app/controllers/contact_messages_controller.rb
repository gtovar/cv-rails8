class ContactMessagesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    ContactMailer.contact_message(contact_params).deliver_later

    render plain: "Mensaje enviado con éxito.", status: :ok
  rescue => e
    logger.error "Error al enviar contacto: #{e.message}"
    render plain: "Hubo un error al enviar el mensaje.", status: :internal_server_error
  end

  private

  def contact_params
    params.permit(:name, :email, :phone, :subject, :message)
  end
end
