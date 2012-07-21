class QuizActivitiesController < ApplicationController
  # GET /quiz_activities
  # GET /quiz_activities.json
  def index
    @quiz_activities = QuizActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quiz_activities }
    end
  end

  # GET /quiz_activities/1
  # GET /quiz_activities/1.json
  def show
    @quiz_activity = QuizActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quiz_activity }
    end
  end

  # GET /quiz_activities/new
  # GET /quiz_activities/new.json
  def new
    @quiz_activity = QuizActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quiz_activity }
    end
  end

  # GET /quiz_activities/1/edit
  def edit
    @quiz_activity = QuizActivity.find(params[:id])
  end

  # POST /quiz_activities
  # POST /quiz_activities.json
  def create
 
    @quiz_activity = QuizActivity.new(params[:quiz_activity])
    @quiz_activity.activity.sections << Section.where(params[:section_id])

    respond_to do |format|
      if (@quiz_activity.save)
        format.html { redirect_to Section.find_by_id(params[:section_id]), notice: 'Quiz activity was successfully created.' }
        format.json { render json: Section.find_by_id(params[:section_id]), status: :created, location: Section.find_by_id(params[:section_id]) }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quiz_activities/1
  # PUT /quiz_activities/1.json
  def update
    @quiz_activity = QuizActivity.find(params[:id])

    respond_to do |format|
      if @quiz_activity.update_attributes(params[:quiz_activity])
        format.html { redirect_to @quiz_activity, notice: 'Quiz activity was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @quiz_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_activities/1
  # DELETE /quiz_activities/1.json
  def destroy
    @quiz_activity = QuizActivity.find(params[:id])
    @quiz_activity.destroy

    respond_to do |format|
      format.html { redirect_to quiz_activities_url }
      format.json { head :ok }
    end
  end
end