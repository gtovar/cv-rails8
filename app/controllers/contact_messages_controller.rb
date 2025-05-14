class ContactMessagesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    ContactMailer.contact_message(contact_params).deliver_later
    respond_to do |format|
      format.js   # render create.js.erb
      format.html { redirect_to root_path(anchor: "contact"), notice: "Mensaje enviado con éxito." }
    end
  rescue => e
    logger.error "Error al enviar contacto: #{e.message}"
    respond_to do |format|
      format.js   { render js: "alert('Hubo un error al enviar el mensaje.');" }
      format.html { redirect_to root_path(anchor: "contact"), alert: "Hubo un error al enviar el mensaje." }
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :phone, :subject, :message)
  end
end
