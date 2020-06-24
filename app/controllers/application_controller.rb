class ApplicationController < ActionController::Base
  add_flash_types :success
  before_action :complete_company

  private

  def complete_company
    if current_client
      unless current_client.company
        redirect_to new_company_path
        flash[:alert] = "Você ainda não completou a sua contapara continuar finalize-a."        
      end
    end
  end
end
