class Admin::ProductController < AdminController
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(set_params)

    respond_to do |format|
      if @product.save!
        format.html { redirect_to admin_product_index_path, notice: "Produto cadastrado com Sucesso"}
      else
        render :new, notice: "Erro ao Cadastrar Produto!"
      end
    end
  end

  def edit;end

  def update
    respond_to do |format|
      if @product.update!(set_params)
        format.html { redirect_to admin_category_index_path, notice: "Produto atualizado com Sucesso"}
      else
        render :edit, notice: "Erro ao Atualizar Produto!"
      end
    end
  end

  private

  def set_product
    @product = Product.find params[:id]
  end

  def set_params
    params.require(:product).permit(:category_id, :sub_category, :price, :description, 
                                    :name, :rating, :promotional_price, :is_promotional
                                    )
  end
end
