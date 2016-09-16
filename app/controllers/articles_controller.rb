class ArticlesController < ApplicationController
	def index
		@articles = Article.all # it will fetch all article present in sorted order by their id;
	end

  def show
    @article = Article.find(params[:id])
    #@subcategories = @article.sub_categories
  end

	def new
		@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
    @article.user = current_user
  	if @article.save
  		flash[:notice] = "New article created successfully...!"
  		redirect_to(:action => 'show', :id => @article.id)
  	else
  	  render 'new'	
  	end
  end

  def edit
    @article = Article.find(params[:id])	
  end

  def update
  	 @article = Article.find(params[:id])
  	if @article.update_attributes(article_params)
  		flash[:notice] = "Article updated successfully."
  		redirect_to(:action => 'show', :id => @article.id)
  	else
  		render 'edit'
  	end	
  end
  
  def delete
    @article = Article.find(params[:id])	
  end

  def destroy	
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "article #{@article.title} deleted successfully."
    redirect_to(:action => 'index')
  end

  private
    def article_params
    	params.require(:article).permit(:user_id, :title, :content)
    end
end
