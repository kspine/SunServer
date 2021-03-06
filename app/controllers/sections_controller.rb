# encoding: UTF-8
class SectionsController < ApplicationController

  include SectionsHelper

  def index
    @sections = Section.all

    respond_to do |format|
      format.html
      format.json { render json: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @section = Section.find_by_id(params[:id])
    @lesson = @section.lesson
    @activities = @section.activities

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    @section = Section.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render json: @section, status: :created, location: @section }
      else
        format.html { render action: "new" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
  
  def relink
    @section = Section.find(params[:id])
  end
  
  def relink_post
    @section = Section.find(params[:id])
    lesson = Lesson.find(params[:lesson_id])
    @section.lesson = lesson
    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: '成功转移' }
        format.json { head :ok }
      else
        format.html { redirect_to @section, error: '转移失败' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
end
