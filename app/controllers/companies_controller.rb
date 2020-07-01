class CompaniesController < ApplicationController
  before_action :authenticate_client!
  before_action :complete_company, only: %i[show edit]

  def new
    @company = Company.new
  end

  def create
    company_created_msg = t('company_created', scope: %i[company sessions])
    @company = current_client.build_company(company_params)
    return redirect_to @company, alert: company_created_msg if @company.save

    render 'new'
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      flash[:alert] = 'Empresa editada com sucesso'
      redirect_to @company
    else
      render 'edit'
    end
  end

  private

  def company_params
    params.require(:company).permit(:fantasy_name, :corporate_name,
                                    :email, :document_number, :address)
  end
end
