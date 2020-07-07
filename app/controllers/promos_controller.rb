class PromosController < ApplicationController
  def index
    @promos = Promo.all
  end

  def new
    @promo = Promo.new
  end

  def create
    @promo = Promo.new(promo_model_params)
    @promo.employee_id = current_employee.id
    if @promo.save
      redirect_to promos_path, notice: t('.notice')
    else
      render :new
    end
  end

  def promo_model_params
    params.require(:promo).permit(:title, :discount, :start_date, :end_date,
                                  :limit_order, :employee_id)
  end
end
