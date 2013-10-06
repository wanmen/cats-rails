class TaglinksController < ApplicationController
  before_action :set_taglink, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @taglinkable = find_taglinkable
    @taglinks = @taglinkable.taglinks
  end
  
  def show
  end
  
  def new
    @taglink = Taglink.new
  end
  
  def create
    @taglinkable = find_taglinkable
    @taglink = Taglink.where("tag_id = ? AND tagable_id = ? AND tagable_type = ?", params[:taglink][:tag_id], @taglinkable.id, @taglinkable.class).take

    respond_to do |format|
      if @taglink != nil
        format.html { redirect_to @taglinkable, notice: '标签已存在'}
        format.json { render action: 'show', status: failed, location: @taglinkable }
      else
        @taglink = @taglinkable.taglinks.new(taglink_params)
        if @taglink.save
          format.html { redirect_to @taglinkable, notice: '添加标签成功' }
          format.json { render action: 'show', status: :created, location: @taglinkable }
        else
          format.html { render action: 'new' }
          format.json { render json: @taglink.errors, status: :unprocessable_entity }
        end
      end
    end

  end
  
  def edit
    @taglink = Taglink.find(params[:id])
    if !qualified_to_edit?(@taglink,current_user,SUPERADMIN)
      redirect_to "/manage"
    end
  end
  
  def update
    @taglink = Taglink.find(params[:id])
    respond_to do |format|
      if @taglink.update(taglink_params)
        format.html { redirect_to @taglink, notice: 'taglink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @taglink.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @taglink.destroy
    flash[:notice] = "删除标签成功"
    redirect_to @taglink.tagable
  end
  
  private

  def find_taglinkable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_taglink
    @taglink = Taglink.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def taglink_params
    params.require(:taglink).permit(:tag_id).merge(user_id: current_user.id)
  end
end
