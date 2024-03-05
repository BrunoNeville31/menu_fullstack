class Admin::CategoryController < AdminController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.all.order(id: :asc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(set_params)

    respond_to do |format|
      if @category.save!
        format.html { redirect_to admin_category_index_path, notice: "Categoria cadastrada com Sucesso"}
      else
        render :new, notice: "Erro ao Cadastrar Categoria!"
      end
    end
  end

  def edit;end

  def update
    respond_to do |format|
      if @category.update!(set_params)
        format.html { redirect_to admin_category_index_path, notice: "Categoria atualizada com Sucesso"}
      else
        render :edit, notice: "Erro ao Atualizar Categoria!"
      end
    end
  end

  private

  def set_category
    @category = Category.find params[:id]
  end

  def set_params
    params.require(:category).permit(:name, :sub_category, :description, :active)
  end
end
