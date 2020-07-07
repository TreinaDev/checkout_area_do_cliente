class ApplicationController < ActionController::Base
  add_flash_types :success

  private

  def complete_company
    return unless current_client
    return if current_client && current_client.company.present?

    redirect_to new_company_path, alert: t('check_company', scope: %i[company sessions])
  end

  def authenticate_visitor
    return if client_signed_in? || employee_signed_in?

    redirect_to root_path, alert: t('authenticate', scope: %i[company sessions])
  end
end
