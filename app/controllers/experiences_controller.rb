class ExperiencesController < ApplicationController
  layout "gorman_template"  # usa tu layout con assets externos
  before_action :set_resume
  before_action :set_experience

  def new
    @experience = @resume.experiences.build
  end

  def show
  end

  def create
    @experience = @resume.experiences.build(experience_params)
    if @experience.save
      redirect_to resume_path(@resume), notice: "Experiencia creada correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @experience.update(experience_params)
      redirect_to resume_path(@resume), notice: "Experiencia actualizada correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy
    redirect_to resume_path(@resume), notice: "Experiencia eliminada."
  end

  private

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def set_experience
    @experience = @resume.experiences.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:company, :role, :start_date, :end_date)
  end
end
