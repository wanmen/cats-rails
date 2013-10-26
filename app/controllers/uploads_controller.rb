class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  load_and_authorize_resource

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    render layout: false
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      render layout: false
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy

    # redirect to different page according to upload type
    @redirect = "/"

    respond_to do |format|
      format.html { redirect_to @redirect, notice: '删除上传历史成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white upload through.
    def upload_params
      params.require(:upload).permit(:file).merge(user_id: current_user.id)
    end
end
