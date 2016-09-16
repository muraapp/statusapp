class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(status: 2..3).order(updated_at: :desc)
  end

  def outline
    @tasks = Task.where(status: 1).order(updated_at: :desc)
  end

  def release
    @task = Task.find(params[:task_id])
    @task.status = 2

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'タスクを公開しました' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @tasks = Task.where(status: 4).order(updated_at: :desc)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    if params[:back]
      @task = Task.new(task_params)
    else
      @task = Task.new
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  def confirm
    @task = Task.new(task_params)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'タスクが作成されました' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.status = 3
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'タスクを更新しました。' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:task_id])
    @task.status = 4
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'タスクは削除されました' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title)
    end
end
