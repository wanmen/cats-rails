class TaglinksController < ApplicationController
  before_action :set_taglink, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @taglinkable = find_taglinkable
    @taglinks = @taglinkable.taglinks
  end
  
  def show
    redirect_to @taglink.tagable
  end
  
  def new
    @taglink = Taglink.new
  end
  
  def create
    @taglinkable = find_taglinkable
    @taglink = @taglinkable.taglinks.new(taglink_params)
    respond_to do |format|
      if @taglink.save
        format.html { redirect_to @taglinkable, notice: 'taglink was successfully created.' }
        format.json { render action: 'show', status: :created, location: @taglinkable }
      else
        format.html { render action: 'new' }
        format.json { render json: @taglink.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @taglink = Taglink.find(params[:id])
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
    @taglink = Taglink.find(params[:id])
    @taglink.destroy
    flash[:notice] = "Successfully destroyed taglink."
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
    params.require(:taglink).permit(:tag_id)
  end
end