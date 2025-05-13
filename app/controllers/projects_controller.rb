class ProjectsController < ApplicationController
  layout "gorman_template"  # usa tu layout con assets externos
  before_action :set_resume
  before_action :set_project, only: %i[show edit update destroy]

  def new
    @project = @resume.projects.build
  end

  def show
    @project = @resume.projects.find_by!(slug: params[:id])
    projects = @resume.projects.order(start_time: :desc)
    current_index = projects.index(@project)
    @previous_project = projects[current_index + 1]
    @next_project = projects[current_index - 1] if current_index&.positive?
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
    @resume = Resume.find(params[:resume_id])
  end

  def set_project
    @project = @resume.projects.find_by!(slug: params[:id])
  end

  def project_params
    params.require(:project).permit(
      :name, :slug, :position, :start_time, :end_time,
      :description, :activities, :outstanding, :activity_description,
      :tools, :cover, :logo, :link, :category, :actual
    )
  end
end
