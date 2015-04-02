class ProjectsController < ApplicationController
  load_and_authorize_resource
  def index
    @projects = Project.all
  end

  def new
    @developers = User.where(:user_type => "Developer")
    @project = Project.new
  end

  def create
    project = current_user.projects.create(project_params)
    user_project_association(project)
    validate_project_params(project) 
  end  

  def edit
    @developers = User.where(:user_type => "Developer")
    @project = Project.find_by_id(params[:id])
  end  

  def update
    project = Project.find_by_id(params[:id])
    project.developers.clear
    user_project_association(project)
    project.update(project_params)
    validate_project_params(project)
  end  

  def destroy
    project = Project.find_by_id(params[:id])
    project.destroy
    redirect_to root_path
  end  

  def show
    @project = Project.find_by_id(params[:id])
  end  

  private
    def project_params
      params.require(:project).permit(:title,:description)
    end 

    def user_project_association(project)
      devs = clean_params
      devs.each do |developer|
          user = User.find(developer)
          project.developers << user
      end 
    end

    def clean_params
      developers = params[:project][:developers]
      developers.reject! { |a| a if a.empty? }
    end   

    def validate_project_params(project)
      if project.errors.present?
        if project.errors.messages[:title].present?
          flash['error'] = "You already have a project with an existing name."
        end
        redirect_to (:back)
      else  
        flash['success'] = "Project created successfully!"
        redirect_to root_path
      end
    end  
end
