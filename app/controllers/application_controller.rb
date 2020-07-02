class ApplicationController < ActionController::Base
  add_flash_types :success

  private

  def complete_company
    return unless current_client
    return if current_client && current_client.company.present?

    redirect_to new_company_path, alert: t('check_company',
                                           scope: %i[company sessions])
  end
  
  def authenticate_visitor
    return if current_client || current_employee

    redirect_to root_path, alert: 'Faça login para continuar'
  end
end
