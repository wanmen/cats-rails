class SearchController < ApplicationController
	def index

		@books=[]
		@videos=[]
		@articles=[]
		@booklists=[]
		@videolists=[]
		@articlelists=[]
		@mixlists=[]
		@type=[]
		@list=[]
		if params[:type]
			@type = params[:type].split(',')
			@type.each do |t|
	 			if (params[:title])
					case t 
					when 'book' 
					  @books += Book.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
					when 'video' 
					  @videos +=  Video.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
				    when 'article' 
					  @articles +=  Article.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
					else # the else clause is optional  
					end 
				else
					case t 
					when 'book' 
					  @books += Book.find(:all)
					when 'video' 
					  @videos +=  Video.find(:all)
				    when 'article' 
					  @articles +=  Article.find(:all)
					else # the else clause is optional  
					end 
				end
			end
		end

		if params[:list]
			@list = params[:list].split(',')
			@list.each do |l|
	 			if (params[:title])
					case l 
					when 'book' 
					  @booklists += List.where(list_type: 1).find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
					when 'video' 
					  @videolists +=  List.where(list_type: 2).find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
				    when 'article' 
					  @articlelists +=  List.where(list_type: 3).find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
				    when 'mix' 
					  @articlelists +=  List.where(list_type: 4).find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
					else # the else clause is optional  
					end 
				else
					case l 
					when 'book' 
					  @booklists += List.where(list_type: 1)
					when 'video' 
					  @videolists +=  List.where(list_type: 2)
				    when 'article' 
					  @articlelists +=  List.where(list_type: 3)
					when 'mix' 
					  @mixlists +=  List.where(list_type: 4)
					else # the else clause is optional  
					end 
				end
			end
		end
		if params[:title]
			@title = params[:title]
		else
			@title = ''
		end
		@results = (@books+@videos+@articles+@booklists+@videolists+@articlelists+@mixlists).sort_by { |k| k["created_at"] }.reverse
	end
end
