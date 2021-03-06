# encoding: UTF-8
class QuizActivitiesController < ApplicationController
  
  def show
    @quiz_activity = QuizActivity.find(params[:id])
    @section = Section.find_by_id(params[:section_id])
    @problem = Problem.new #in case user wants to create a new problem through radio button

    respond_to do |format|
      format.html
      format.json { render json: @quiz_activity }
    end
  end


  def create
    @quiz_activity = QuizActivity.new(params[:quiz_activity])
    section = Section.find_by_id(params[:section_id])
    respond_to do |format|
      if (@quiz_activity.save)
        SectionComponent.create(section_id: section.id, activity_id: @quiz_activity.id, seq: section.activities.size + 1)
        format.html { redirect_to quiz_activity_path(@quiz_activity, :section_id => section.id), notice: '成功创建习题环节' }
        format.json { render json: @quiz_activity, status: :created, location: section }
      else
        format.html { redirect_to section, notice: '出现错误，请重试' }
        format.json { render json: @quiz_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @quiz_activity = QuizActivity.find_by_id(params[:id])
    attr = params[:quiz_activity]

    respond_to do |format|
      if @quiz_activity.update_attributes(attr)
        format.html { redirect_to Section.find_by_id(section_id), notice: '信息已更新' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_activity.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @quiz_activity = QuizActivity.find(params[:id])
    @quiz_activity.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
  
  
  #POST
  def remove_problem
    @quiz_activity = QuizActivity.find(params[:id])
    problem = Problem.find(params[:problem_id])
    section_id = params[:section_id]
    @quiz_activity.problems.delete(problem)
    problem.destroy

    respond_to do |format|
      format.html { redirect_to quiz_activity_path(@quiz_activity, :section_id => section_id) }
      format.json { head :ok }
    end
  end
  
end
