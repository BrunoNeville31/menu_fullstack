class Admin::CompanyController < AdminController
  before_action :set_company, only: [:show, :edit, :update]

  def show
    qrcode = RQRCode::QRCode.new("http://localhost:3000")
    @qr = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
  end

  def edit;end

  def update
    respond_to do |format|
      if @company.update!(set_params)
        format.html { redirect_to admin_company_path(@company.id), notice: "Empresa atualizada com Sucesso"}
      else
        render :edit, notice: "Erro ao Atualizar Empresa!"
      end
    end
  end

  private

  def set_company
    @company = Company.find params[:id]
  end

  def set_params
    params.require(:company).permit( :name, :logo_name, :logo )
  end
end
