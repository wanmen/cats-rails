class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  load_and_authorize_resource

  def index
    @likeable = find_likeable
    @likes = @likeable.likes
  end
  
  def show
  end
  
  def new
    @like = Like.new
  end
  
  def create
    @likeable = find_likeable
    @like = @likeable.likes.where("user_id = ?", current_user.id)

    respond_to do |format|
      if @like != []
        format.html { redirect_to @likeable, notice: '您已喜欢过此条目' }
        format.json { render action: 'show', status: :failed, location: @likeable }
      else
        @like = @likeable.likes.new(:user_id => current_user.id)
        likes_length= @likeable.likes.length
        @likeable.popularity =likes_length;
        if @like.save && @likeable.save
          format.html { redirect_to @likeable, notice: '喜欢已成功' }
          format.json { render action: 'show', status: :created, location: @likeable }
        else
          format.html { render action: 'new' }
          format.json { render json: @like.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'like was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @like.destroy
    flash[:notice] = "删除喜欢已成功"
    redirect_to likes_url
  end
  
  private

  def find_likeable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def like_params
    params.require(:like).permit().merge(user_id: current_user.id)
  end
end
