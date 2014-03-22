class TaskSeekersController < ApplicationController
  before_action :set_task_seeker, only: [:show, :edit, :update, :destroy]

  # GET /task_seekers
  # GET /task_seekers.json
  def index
    @task_seekers = TaskSeeker.all
  end

  # GET /task_seekers/1
  # GET /task_seekers/1.json
  def show
  end

  # GET /task_seekers/new
  def new
    @task_seeker = TaskSeeker.new
  end

  # GET /task_seekers/1/edit
  def edit
  end

  # POST /task_seekers
  # POST /task_seekers.json
  def create
    @task_seeker = TaskSeeker.new(task_seeker_params)

    respond_to do |format|
      if @task_seeker.save
        format.html { redirect_to @task_seeker, notice: 'Task seeker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task_seeker }
      else
        format.html { render action: 'new' }
        format.json { render json: @task_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_seekers/1
  # PATCH/PUT /task_seekers/1.json
  def update
    respond_to do |format|
      if @task_seeker.update(task_seeker_params)
        format.html { redirect_to @task_seeker, notice: 'Task seeker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_seekers/1
  # DELETE /task_seekers/1.json
  def destroy
    @task_seeker.destroy
    respond_to do |format|
      format.html { redirect_to task_seekers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_seeker
      @task_seeker = TaskSeeker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_seeker_params
      params[:task_seeker]
    end
end
