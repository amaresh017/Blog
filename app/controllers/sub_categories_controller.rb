class SubCategoriesController < ApplicationController
  
  def index
		@sub_categories = SubCategory.all # it will fetch all user present in sorted order by their id;
	end

  def show
    @sub_category = SubCategory.find(params[:id])
    @category = @sub_category.category	
  end

	def new
		@sub_category = SubCategory.new
  end

  def create
  	@sub_category = SubCategory.new(sub_category_params)
  	if @sub_category.save
  		flash[:notice] = "New sub category created successfully...!"
  		redirect_to (sub_categories_path)
  	else
  	  render 'new'
  	end
  end

  def edit
  @sub_category = SubCategory.find(params[:id])	
  end

  def update
  	@sub_category = SubCategory.find(params[:id])
  	if @sub_category.update_attributes(sub_category_params)
  		flash[:notice] = "sub_category updated successfully."
  		redirect_to(sub_categories_path)
  	else
  		render 'edit'
  	end	
  end
  
  def delete
    @sub_category = SubCategory.find(params[:id])	
  end

  def destroy	
    sub_category = SubCategory.find(params[:id])
    sub_category.destroy
    flash[:notice] = "SubCategory deleted successfully."
    redirect_to(:action => 'index')
  end

  private

  def sub_category_params
  	params.require(:sub_category).permit(:name, :category_id)
  end
end
