class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :at_least_ADMIN_or_redirect, except: [:index, :show]

  load_and_authorize_resource

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
    @tagInfo = {}
    @tags.each do |tag|
      if tag.parent == 0
        @tagInfo[tag.id] = [tag.name, 1, []]
        @tagInfo[tag.id][TAGCHILD].push(tag)
      else
        @tagInfo[tag.parent][TAGCOUNT] += 1
        @tagInfo[tag.parent][TAGCHILD].push(tag)
      end
    end
    @levelOneTags = Tag.where(parent: 0)
    puts @tagInfo.inspect
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @likeable = @tag
    @likes = @likeable.likes
    @like = Like.new
    @followable = @tag
    @follows = @followable.follows
    @follow = Follow.new
    @childTags = Tag.where(parent: params[:id])
  end

  # GET /tags/new
  def new
    @tag = Tag.new
    @parentTags = Tag.where(parent: 0).unshift(Tag.new(id: 0, name: ' '))
    @selected = ' '
  end

  # GET /tags/1/edit
  def edit
    @parentTags = Tag.where(parent: 0).unshift(Tag.new(id: 0, name: ' '))
    @selected = @tag.parent
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.where(name: params[:tag][:name]).first

    respond_to do |format|
      if @tag != nil
        format.html { redirect_to @tag, notice: '标签已存在' }
        format.json { render action: 'show', status: failed, location: @tag }
      else
        @tag = Tag.new(tag_params)
        if @tag.save
          format.html { redirect_to @tag, notice: '添加标签成功' }
          format.json { render action: 'show', status: :created, location: @tag }
        else
          format.html { render action: 'new' }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if params[:delete]
        @tag.destroy
        format.html { redirect_to tags_url, notice: '删除标签成功' }
        format.json { head :no_content }
      elsif @tag.update(tag_params)
        format.html { redirect_to @tag, notice: '修改标签成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: '删除标签成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

  

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name, :parent)
    end
end
