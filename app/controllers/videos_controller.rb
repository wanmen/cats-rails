class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :at_least_ADMIN_or_redirect, except: [:index, :show]
  # GET /videos
  # GET /videos.json
  def index
    @newest = Video.newest6
    @popular = Video.top10
    @best = Video.best6
    @popularVideolist = List.top10Videolist
    @bestVideolist = List.best6Videolist
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @commentable = @video
    @comments = @commentable.comments
    @comment = Comment.new
    @likeable = @video
    @likes = @likeable.likes
    @like = Like.new
    @rateable = @video
    @rates = @rateable.rates
    @rate = Rate.new
    @taglinkable = @video
    @taglinks = @taglinkable.taglinks
    @taglink = Taglink.new
    @linkable = @video
    @links = @linkable.links
    @link = Link.new
    if (current_user)
      @lists = List.where("user_id = ? AND list_type = ?", current_user[:id], 2)
    else
      @lists = []
    end
    @tags = Tag.all
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    if !qualified_to_edit?(Video.find(params[:id]),current_user,SUPERADMIN)
      redirect_to help_manage_path
    end
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: '添加视频成功' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: '修改视频成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: '删除视频成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :cover, :summary, :url, :lecturer).merge(user_id: current_user.id)
    end
end
