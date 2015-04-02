class BugsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :bug, :through => :project
  def index
    @project = Project.find_by_id(params[:project_id])
    @bugs = @project.bugs 
  end  

  def new
    @developers = User.where(:user_type => "Developer")
    @project = Project.find_by_id(params[:project_id])
    # @developers = @project.developers
    @bug = @project.bugs.build
  end

  def create
    @project = Project.find_by_id(params[:project_id])
    bug = @project.bugs.build(bug_params)
    if bug.save
      flash['success'] = 'Bug added successfully.'
      redirect_to project_bugs_path(@project)
    else
      flash['error'] = 'Something went wrong, please enter valid information.'
      redirect_to (:back)
    end  
  end

  def edit
    @developers = User.where(:user_type => "Developer")
    @project = Project.find_by_id(params[:project_id])
    # @developers = @project.developers
    @bug = @project.bugs.find_by_id(params[:id])
  end  

  def update
    @project = Project.find_by_id(params[:project_id])
    bug =  @project.bugs.find_by_id(params[:id])
    if bug.update(bug_params)
      flash['success'] = 'Bug updated successfully.'
      redirect_to project_bugs_path(@project)
    else
      flash['error'] = 'Something went wrong, please enter valid information.'
      redirect_to (:back)
    end   
  end

  def destroy
    @project = Project.find_by_id(params[:project_id])
    bug = @project.bugs.find_by_id(params[:id])
    bug.destroy
    redirect_to project_bugs_path(@project)
  end 

  def update_bug_status
    @bug = Bug.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update_status
    @project = Project.find_by_id(params[:project_id])
    bug =  @project.bugs.find_by_id(params[:id])
    bug.update(bug_params) 
    flash['success'] = 'Bug updated successfully.'
    redirect_to project_bugs_path(@project)
  end  

  def show
    @bug = Bug.find_by_id(params[:id])
  end  
    
  private 
    def bug_params
      params.require(:bug).permit!
    end  

end
