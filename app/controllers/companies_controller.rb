class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = current_client.build_company(company_params)
    return passed if @company.save

    render 'new'
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:fantasy_name, :corporate_name, :email, :document_number, :address)
  end

  def passed
    flash[:alert] = 'Empresa criada com sucesso'
    redirect_to @company
  end
end
