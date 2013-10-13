class XeventsController < ApplicationController
  before_action :set_xevent, only: [:show, :edit, :update, :destroy]

  # GET /xevents
  # GET /xevents.json
  def index
    @xevents = Xevent.all
  end

  # GET /xevents/1
  # GET /xevents/1.json
  def show
  end

  # GET /xevents/new
  def new
    @xevent = Xevent.new
  end

  # GET /xevents/1/edit
  def edit
  end

  # POST /xevents
  # POST /xevents.json
  def create
    @xevent = Xevent.new(xevent_params)

    respond_to do |format|
      if @xevent.save
        format.html { redirect_to @xevent, notice: 'Xevent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @xevent }
      else
        format.html { render action: 'new' }
        format.json { render json: @xevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xevents/1
  # PATCH/PUT /xevents/1.json
  def update
    respond_to do |format|
      if @xevent.update(xevent_params)
        format.html { redirect_to @xevent, notice: 'Xevent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @xevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xevents/1
  # DELETE /xevents/1.json
  def destroy
    @xevent.destroy
    respond_to do |format|
      format.html { redirect_to xevents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xevent
      @xevent = Xevent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xevent_params
      params.require(:xevent).permit(:title, :content, :summary, :location, :time)
    end
end
