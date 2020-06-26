class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.client = current_client
    if @company.save
      flash[:alert] = 'Empresa criada com sucesso'
      redirect_to @company
    else
      render 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:fantasy_name, :corporate_name, :email, :document_number, :address)
  end
end
