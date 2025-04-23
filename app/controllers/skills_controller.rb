class SkillsController < ApplicationController
  before_action :set_resume
  before_action :set_skill, only: %i[ edit update destroy ]

  def new
    @skill = @resume.skills.build
  end

  def create
    @skill = @resume.skills.build(skill_params)
    if @skill.save
      redirect_to resume_path(@resume), notice: "Habilidad agregada correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @skill.update(skill_params)
      redirect_to resume_path(@resume), notice: "Habilidad actualizada correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy
    redirect_to resume_path(@resume), notice: "Habilidad eliminada correctamente."
  end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:resume_id])
  end

  def set_skill
    @skill = @resume.skills.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :level)
  end
end

