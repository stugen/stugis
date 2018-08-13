class StugenController < ApplicationController
  before_action :set_stugen, only: [:show, :edit, :update, :destroy]

  # GET /
  def overview
      @faculties = Faculty.all.preload(:stugen)
     render layout: 'overview'
  end

  # GET /stugen
  # GET /stugen.json
  def index
    @stugen = Stuga.all
  end

  # GET /stugen/1
  # GET /stugen/1.json
  def show
  end

  # GET /stugen/new
  def new
    @stugen = Stuga.new
  end

  # GET /stugen/1/edit
  def edit
  end

  # POST /stugen
  # POST /stugen.json
  def create
    @stugen = Stuga.new(stugen_params)

    respond_to do |format|
      if @stugen.save
        format.html { redirect_to @stugen, notice: 'Stuga was successfully created.' }
        format.json { render :show, status: :created, location: @stugen }
      else
        format.html { render :new }
        format.json { render json: @stugen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stugen/1
  # PATCH/PUT /stugen/1.json
  def update
    respond_to do |format|
      if @stugen.update(stugen_params)
        format.html { redirect_to @stugen, notice: 'Stuga was successfully updated.' }
        format.json { render :show, status: :ok, location: @stugen }
      else
        format.html { render :edit }
        format.json { render json: @stugen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stugen/1
  # DELETE /stugen/1.json
  def destroy
    @stugen.destroy
    respond_to do |format|
      format.html { redirect_to stugen_url, notice: 'Stuga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stugen
      @stugen = Stuga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stugen_params
      params.require(:stuga).permit(:label, :abbreviation, :description, :faculty_id, :picture, :website, :email, :telephone, :building, :room, :facebook, :twitter, :youtube, :instagram, :pinterest, :snapchat, :tumblr)
    end
end
