class CategoriesController < ApplicationController
  before_filter :set_category, except: [:index, :create]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
    if @category.save
    	flash[:notice] = "New category added successfully!"
    	redirect_to categories_path
    else
    render 'new'	
    end
	end

  def show
  end

  def edit
    @category = Category.find(params[:id])	
  end

  def update
  	@category = Category.find(params[:id])
  	if @category.update_attributes(category_params)
  		flash[:notice] = "category updated successfully."
  		redirect_to(categories_path)
  	else
  		render 'edit'
  	end	
  end
  
  def delete
    @category = Category.find(params[:id])	
  end

  def destroy	
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category #{@category.name} deleted successfully...!"
    redirect_to(categories_path)
  end


	private
    def category_params
  		params.require(:category).permit(:name, sub_categories_attributes: [:id, :name, :category_id, :_destroy])
    end

    def set_category
      @category = Category.find(params[:id])
    end

end