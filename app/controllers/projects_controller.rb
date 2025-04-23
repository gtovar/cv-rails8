class ProjectsController < ApplicationController
  before_action :set_resume
  before_action :set_project, only: %i[ edit update destroy ]

  def new
    @project = @resume.projects.build
  end

  def create
    @project = @resume.projects.build(project_params)
    if @project.save
      redirect_to resume_path(@resume), notice: "Proyecto creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to resume_path(@resume), notice: "Proyecto actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to resume_path(@resume), notice: "Proyecto eliminado."
  end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:resume_id])
  end

  def set_project
    @project = @resume.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end

