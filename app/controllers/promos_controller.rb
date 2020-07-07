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

  def approve
    @promo = Promo.find(params[:id])
    @promo.accepted!
    redirect_to promos_path, notice: t('.success')
  end

  def promo_model_params
    params.require(:promo).permit(:title, :discount, :start_date, :end_date,
                                  :limit_order, :employee_id)
  end
end
