class Admin::SubCategoryController < AdminController
  before_action :set_sub_category, only: [:edit, :update]

  def index
    @subcategories = SubCategory.all.order(id: :asc)
  end

  def new
    @subcategory = SubCategory.new
  end
  
  def create
    @subcategory = SubCategory.new(set_params)

    respond_to do |format|
      if @subcategory.save!
        format.html { redirect_to admin_sub_category_index_path, notice: "Sub Categoria cadastrada com Sucesso"}
      else
        render :new, notice: "Erro ao Cadastrar Sub Categoria!"
      end
    end
  end

  def edit;end

  def update
    respond_to do |format|
      if @subcategory.update!(set_params)
        format.html { redirect_to admin_category_index_path, notice: "Sub Categoria atualizada com Sucesso"}
      else
        render :edit, notice: "Erro ao Atualizar Sub Categoria!"
      end
    end
  end

  private

  def set_sub_category
    @subcategory = SubCategory.find params[:id]
  end

  def set_params
    params.require(:sub_category).permit(:name, :category_id, :active, :description)
  end
end
