class XeventsController < ApplicationController
  before_action :set_xevent, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @xevents = Xevent.all
  end

  # GET /xclubs/1/xevents/1
  # GET /xclubs/1/xevents/1.json
  def show
  end

  # GET /xclubs/1/xevents/new
  def new
    @xevent = Xevent.new
  end

  # GET /xclubs/1/xevents/1/edit
  def edit
  end

  # POST /xclubs/1/xevents
  # POST /xclubs/1/xevents.json
  def create
    @xevent = Xevent.new(xevent_params)

    respond_to do |format|
      if @xevent.save
        format.html { redirect_to xclub_path(find_xclub), notice: '新活动创建成功' }
        format.json { render action: 'show', status: :created, location: @xevent }
      else
        format.html { render action: 'new' }
        format.json { render json: @xevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xclubs/1/xevents/1
  # PATCH/PUT /xclubs/1/xevents/1.json
  def update
    respond_to do |format|
      if @xevent.update(xevent_params)
        format.html { redirect_to xclub_xevent_path(@xevent[:xclub_id], @xevent), notice: '活动更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @xevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xclubs/1/xevents/1
  # DELETE /xclubs/1/xevents/1.json
  def destroy
    @xevent.destroy
    @xclub = find_xclub
    respond_to do |format|
      format.html { redirect_to @xclub }
      format.json { head :no_content }
    end
  end

  private

    def find_xclub
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_xevent
      @xevent = Xevent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xevent_params
      @xclub = find_xclub
      params.require(:xevent).permit(:title, :content, :summary, :location, :time).merge(xclub_id: @xclub[:id])
    end
end
