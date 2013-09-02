class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @followable = find_followable
    @follows = @followable.follows
  end
  
  def show
  end
  
  def new
    @follow = Follow.new
  end
  
  def create
    @followable = find_followable
    @follow = @followable.follows.new(:user_id => current_user.id)
    respond_to do |format|
      if @follow.save
        format.html { redirect_to @followable, notice: 'follow was successfully created.' }
        format.json { render action: 'show', status: :created, location: @followable }
      else
        format.html { render action: 'new' }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @follow = Follow.find(params[:id])
  end
  
  def update
    @follow = Follow.find(params[:id])
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'follow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    flash[:notice] = "Successfully destroyed follow."
    redirect_to follows_url
  end
  
  private

  def find_followable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_follow
    @follow = Follow.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def follow_params
    params.require(:follow).permit().merge(user_id: current_user.id)
  end
end