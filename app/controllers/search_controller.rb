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
		@tags=[]
		if (params[:title]&&params[:title]!='')
			@tags = Tag.find(:all, :conditions => ["name LIKE ?", "%"+params[:title]+"%"])
		end
		if params[:type]
			@type = params[:type].split(',')
			@type.each do |t|
	 			if (params[:title])
					case t 
					when 'book' 
					  @books += Book.find(:all, :conditions => ["title LIKE ? OR author LIKE ?", "%"+params[:title]+"%", "%"+params[:title]+"%"])
					when 'video' 
					  @videos +=  Video.find(:all, :conditions => ["title LIKE ? OR lecturer LIKE ?", "%"+params[:title]+"%", "%"+params[:title]+"%"])
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
					  @booklists += List.where(list_type: BOOKLIST).find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
					when 'video' 
					  @videolists +=  List.where(list_type: VIDEOLIST).find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
				    when 'article' 
					  @articlelists +=  List.where(list_type: ARTICLELIST).find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
				    when 'mix' 
					  @articlelists +=  List.where(list_type: MIXLIST).find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
					else # the else clause is optional  
					end 
				else
					case l 
					when 'book' 
					  @booklists += List.where(list_type: BOOKLIST)
					when 'video' 
					  @videolists +=  List.where(list_type: VIDEOLIST)
				    when 'article' 
					  @articlelists +=  List.where(list_type: ARTICLELIST)
					when 'mix' 
					  @mixlists +=  List.where(list_type: MIXLIST)
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
		@allresults = (@books+@videos+@articles+@booklists+@videolists+@articlelists+@mixlists).sort_by { |k| k["created_at"] }.reverse
		numperpage = 5
		@page = 0
		if params[:page]
			@page = params[:page].to_i-1
		end
		@numberofpages= @allresults.length/numperpage +(@allresults.length%numperpage>0? 1:0)-1
		@results = @allresults[@page*numperpage,numperpage]
		if (@results==nil) 
			@results =[]
		end
	end
end
