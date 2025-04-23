class ResumesController < ApplicationController
  before_action :set_resume, only: %i[ show edit update destroy ]

  def index
    @resumes = current_user.resumes
  end

  def show
  end

  def new
    @resume = current_user.resumes.build
  end

  def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save
      redirect_to @resume, notice: 'Resume was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to @resume, notice: 'Resume was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resume.destroy
    redirect_to resumes_path, notice: 'Resume was successfully deleted.'
  end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resume_params
    # Por ahora sin campos adicionales, puedes agregar campos específicos si tu modelo Resume los tiene
    params.require(:resume).permit()
  end
end

