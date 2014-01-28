class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]
  
  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.where(public: true)
  end

  def online
    #@lectures = Lecture.where(user_name: user_name, password: password).first
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    part = Participation.where(:user_id => current_user.id, :lecture_id => @lecture.id).first_or_initialize
    part.online = true;
    part.save
    topic = redirect_to @lecture.topics.first()
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)
    #if @lecture.password == ""
      @lecture.password = nil
    #end
    
    respond_to do |format|
      if @lecture.save
        top = Topic.new
        top.name = @lecture.name
        top.lecture = @lecture
        top.save
        
        exp = Explanation.new
        exp.author = true
        exp.user = current_user
        exp.topic = top
        exp.save
        
        format.html { redirect_to @lecture }
        format.json { render action: 'show', status: :created, location: @lecture }
      else
        format.html { render action: 'new' }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:name, :password, :public)
    end
end
