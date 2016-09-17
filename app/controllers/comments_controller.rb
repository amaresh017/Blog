class CommentsController < ApplicationController
	def index
		@article = Article.find(params[:article_id])
		@comments = @article.comments
	end

	def new
		@comment = Comment.new
	end

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)
		@comment.user = current_user
    if @comment.save
    	flash[:notice] = "Comment added !"
    	redirect_to article_url(@article)
    else
    render 'new'	
    end
	end

  def show
  	@comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])	
  end

  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update_attributes(comment_params)
  		flash[:notice] = "Comment updated !"
  		redirect_to(comments_path)
  	else
  		render 'edit'
  	end	
  end
  
  def delete
    @comment = Comment.find(params[:id])	
  end

  def destroy	
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted successfully...!"
    redirect_to(comments_path)
  end


	private

    def comment_params
  	params.require(:comment).permit(:content, :user_id, :article_id)
    end
end
