class EdgesController < ApplicationController
  # GET /edges
  # GET /edges.json
  def index
    @edges = Edge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @edges }
    end
  end

  # GET /edges/1
  # GET /edges/1.json
  def show
    @edge = Edge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @edge }
    end
  end

  # GET /edges/new
  # GET /edges/new.json
  def new
    @edge = Edge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @edge }
    end
  end

  # GET /edges/1/edit
  def edit
    @edge = Edge.find(params[:id])
  end

  # POST /edges
  # POST /edges.json
  def create    
    @edge = Edge.new(params[:edge])
    @edge.save_condition_string(@edge.condition, params[:cond1], params[:cond2])

    respond_to do |format|
      if @edge.save
        format.html { redirect_to Section.find(@edge.section_id) }
        format.json { render json: @edge, status: :created, location: @edge }
      else
        format.html { render action: "new" }
        format.json { render json: @edge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /edges/1
  # PUT /edges/1.json
  def update
    @edge = Edge.find(params[:id])

    respond_to do |format|
      if @edge.section_id and @edge.update_attributes(params[:edge])
        format.html {redirect_to Section.find_by_id(@edge.section_id)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @edge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edges/1
  # DELETE /edges/1.json
  def destroy        
    @edge = Edge.find(params[:id])
    section_id = @edge.section_id    
    @edge.destroy

    respond_to do |format|
      format.html { redirect_to Section.find(section_id) }
      format.json { head :ok }
    end
  end
end
