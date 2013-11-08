class XclubsController < ApplicationController
  before_action :set_xclub, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /xclubs
  # GET /xclubs.json
  def index
    @xclubs = Xclub.all
    @latest = Xevent.latest5
  end

  # GET /xclubs/1
  # GET /xclubs/1.json
  def show
    # get the latest 3 event of the current xclub
    @latest = Xevent.where("xclub_id = ?", @xclub.id).order("created_at DESC").limit(3)
  end

  # GET /xclubs/new
  def new
    @xclub = Xclub.new
  end

  # GET /xclubs/1/edit
  def edit
  end

  # POST /xclubs
  # POST /xclubs.json
  def create
    @xclub = Xclub.new(xclub_params)

    respond_to do |format|
      if @xclub.save
        format.html { redirect_to @xclub, notice: 'Xclub was successfully created.' }
        format.json { render action: 'show', status: :created, location: @xclub }
      else
        format.html { render action: 'new' }
        format.json { render json: @xclub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xclubs/1
  # PATCH/PUT /xclubs/1.json
  def update
    respond_to do |format|
      if @xclub.update(xclub_params)
        format.html { redirect_to @xclub, notice: 'Xclub was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @xclub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xclubs/1
  # DELETE /xclubs/1.json
  def destroy
    @xclub.destroy
    respond_to do |format|
      format.html { redirect_to xclubs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xclub
      @xclub = Xclub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xclub_params
      params.require(:xclub).permit(:name, :started, :summary, :thumbnail)
    end

    #
    def transform_date(date)
      puts date
      date[4] = '年'
      date[7] = '月'
      date << '日'
      date
    end

  helper_method :transform_date
end
