class CompaniesController < ApplicationController
  before_action :authenticate_client!

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

  private

  def company_params
    params.require(:company).permit(:fantasy_name, :corporate_name,
                                    :email, :document_number, :address)
  end
end
