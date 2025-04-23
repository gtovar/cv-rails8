class ContactInfosController < ApplicationController
  before_action :set_resume
  before_action :set_contact_info, only: %i[ edit update destroy ]

  def new
    @contact_info = @resume.build_contact_info
  end

  def create
    @contact_info = @resume.build_contact_info(contact_info_params)
    if @contact_info.save
      redirect_to resume_path(@resume), notice: "Información de contacto creada."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @contact_info.update(contact_info_params)
      redirect_to resume_path(@resume), notice: "Información de contacto actualizada."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact_info.destroy
    redirect_to resume_path(@resume), notice: "Información de contacto eliminada."
  end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:resume_id])
  end

  def set_contact_info
    @contact_info = @resume.contact_info
  end

  def contact_info_params
    params.require(:contact_info).permit(:email, :phone, :address)
  end
end

