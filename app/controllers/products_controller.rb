class ProductsController <ApplicationController
    before_action :set_category
   
  
      def show
        @category = Category.find(params[:category_id])
       @product = @category.products.find(params[:id])
    
        end
      
        def new
          @product = @category.products.build
          respond_with(@product)
        end
      
        def create
          @category = Category.find(params[:category_id])
          @product = @category.products.new(product_params) # Use new to build the product with the associated category
          
          if @product.save
            redirect_to category_path(@category), notice: "Product created successfully."
          else
            render :new # Render the new template if there's an error
          end
      
          # @category = Category.find(params[:category_id])
          # @product = @category.products.create(params[:id]) # Use @category here
          # redirect_to category_path(@category), status: :see_other
          
        end
  
        def destroy
          @product.destroy
    redirect_to category_path(@category), notice: "Product was successfully deleted.", status: :see_other

          # @category = Category.find(params[:category_id])
          # @product = @Category.products.find(params[:id])
          # @product.destroy
          # redirect_to category_path(@category), status: :see_other
        end
  
      
      
        private
      
        def set_category
          @category = Category.find(params[:category_id])
        rescue ActiveRecord::RecordNotFound
          flash[:alert] = 'Category not found.'
          
          
        end
      
        def product_params
          params.require(:product).permit(:name, :price, :image) 
        end
  end