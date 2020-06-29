class ApplicationController < ActionController::Base
  add_flash_types :success

  private

  def complete_company
    if current_client && current_client.company.nil?
      redirect_to new_company_path
      flash[:alert] = I18n.t('check_company', scope: %i[company sessions])
    else
      true
    end
  end
end
