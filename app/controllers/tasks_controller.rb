class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notes
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET notes/1/tasks
  def index
    @tasks = @notes.tasks
  end

  # GET notes/1/tasks/1
  def show
  end

  # GET notes/1/tasks/new
  def new
    @task = @notes.tasks.build
  end

  # GET notes/1/tasks/1/edit
  def edit
  end

  # POST notes/1/tasks
  def create
    @task = @notes.tasks.build(task_params)

    if @task.save
      redirect_to([@task.notes, @task], notice: 'Task was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT notes/1/tasks/1
  def update
    if @task.update_attributes(task_params)
      redirect_to([@task.notes, @task], notice: 'Task was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE notes/1/tasks/1
  def destroy
    @task.destroy

    redirect_to notes_tasks_url(@notes)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notes
      @notes = current_user.notes.find(params[:notes_id])
    end

    def set_task
      @task = @notes.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :notes_id)
    end
end
