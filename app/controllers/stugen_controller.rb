class StugenController < ApplicationController
  before_action :set_stugen, only: [:show, :edit, :update, :destroy, :edit_verify, :verify]
  before_action :verify_key, only: [:edit_verify, :verify]

  # GET /
  def overview
    @stugen = Stuga.all.order(:faculty_id, :label).joins(:faculty).select('stugen.*, faculties.label AS faculty_label').group_by{|s| s.faculty_id}
     render layout: 'overview'
  end

  # GET /admin
  # GET /admin.json
  # GET /admin/stugen
  # GET /admin/stugen.json
  def index
    @stugen = Stuga.all.order(:faculty_id, :label)
  end

  # GET /admin/stugen/mails.json
  def mails
    render json: Stuga.all.order(:faculty_id, :label).map{|s|s.email}
  end

  # GET /admin/stugen/1
  # GET /admin/stugen/1.json
  def show
  end

  # GET /admin/stugen/new
  def new
    @stugen = Stuga.new
  end

  # GET /admin/stugen/1/edit
  def edit
  end

  # GET /verify/1/edit
  def edit_verify
    render :edit
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
  # PATCH/PUT/GET /verify/1
  # PATCH/PUT /verify/1.json
  def verify
    if params.include?(:stuga)
      @sp = stugen_params.except(:label, :abbreviation, :faculty_id, :email)
      msg = 'updated'
    else
      @sp = Hash.new
      msg = 'verified'
    end
    @sp[:confirmed] = true
    respond_to do |format|
      if @stugen.update(@sp)
        format.html { redirect_to :root, notice: t("view.messages.#{msg}", stuga: @stugen.label, email: @stugen.email) }
        format.json { render :show, status: :ok, location: :root }
      else
        format.html { render :edit }
        format.json { render json: @stugen.errors, status: :unprocessable_entity }
      end
    end
    #render :edit
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
    def verify_key
      redirect_to :root unless @stugen.verification_token == params[:key]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stugen_params
      params.require(:stuga).permit(:label, :abbreviation, :information, :faculty_id, :website, :email, :telephone, :building, :room, :facebook, :twitter, :youtube, :instagram, :pinterest, :snapchat, :tumblr, :confirmed)
    end
end
