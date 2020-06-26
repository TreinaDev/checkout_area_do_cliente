class ApplicationController < ActionController::Base
  add_flash_types :success

  # def complete_company
  #   if current_client & current_client.company & client_signed_in?
  #     true
  #   else
  #     if client_signed_in?
  #       redirect_to new_company_path
  #       flash[:alert] = 'Voce ainda nao completou a sua conta, para continuar finalize-a.'
  #     end
  #   end
  # end

  def complete_company
    if current_client & current_client.company & client_signed_in?
      true
    else
      redirect_to new_company_path
      flash[:alert] = 'Voce ainda nao completou a sua conta, para continuar finalize-a.'
    end
  end
end
