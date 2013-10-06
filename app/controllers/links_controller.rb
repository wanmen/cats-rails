class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :at_least_ADMIN_or_redirect, except: [:index, :show]

  def index
    @linkable = find_linkable
    @links = @linkable.links
  end
  
  def show
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @linkable = find_linkable
    @link = @linkable.links.new(link_params)
    respond_to do |format|
      if @link.save
        format.html { redirect_to @linkable, notice: '成功添加到单子' }
        format.json { render action: 'show', status: :created, location: @linkable }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @link = Link.find(params[:id])
    if !qualified_to_edit?(@link,current_user,SUPERADMIN)
      redirect_to "/manage"
    end
  end
  
  def update
    @link = Link.find(params[:id])
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link.list, notice: '成功从单子内删除' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "成功从单子内删除"
    redirect_to @link.list
  end
  
  private

  def find_linkable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:list_id,:description,:order_num).merge(user_id: current_user.id)
  end
end