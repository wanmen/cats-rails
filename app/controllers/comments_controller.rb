class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  load_and_authorize_resource

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end
  
  def show
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: '评论成功' }
        format.json { render action: 'show', status: :created, location: @commentable }
      else
        format.html { render action: 'new', notice: '评论失败' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: '修改评论成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: '失败' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @comment.destroy
    flash[:notice] = "删除评论成功"
    redirect_to @comment.commentable
  end
  
  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
