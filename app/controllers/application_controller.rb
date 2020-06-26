class ApplicationController < ActionController::Base
  add_flash_types :success

  def complete_company
    if current_client
      if current_client.company
        true
      else
        redirect_to new_company_path
        flash[:alert] = I18n.t('check_company', scope: %i[company sessions])
      end
    else
      true
    end
  end
end
