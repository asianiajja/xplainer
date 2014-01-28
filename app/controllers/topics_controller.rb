class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy, :comment, :explain, :refresh]
  before_filter :authenticate_user!
  
  def index
    @topics = Topic.all
  end
  
  # GET /topics/1
  # GET /topics/1.json
  def show
    respond_to do |format|
        format.html {  }
        format.js   { render :action => "update_topic" }
        format.json { render json: @topic, location: @topic }
    end
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic }
        format.json { render action: 'show', status: :created, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

  def comment
    @comm = Comment.new(comment_params)
    @comm.topic = @topic
    @comm.user = current_user
    respond_to do |format|
      if @comm.save
        format.html { redirect_to @topic }
        format.js   { render :action => "clear_comm" }
        format.json { render json: @topic, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
      end
    end
  end

  def explain
    @topic.content = topic_params["content"]
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic }
        format.js   { render :action => "update_topic" }
        format.json { render json: @topic, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:content)
    end
    def comment_params
      params.require(:comment).permit(:content)
    end
end
