class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  include AbstractController::Translation

  private

  def not_found(exception)
    render status: :not_found,
           json: {
             error: I18n.t('api.v1.errors.not_found',
                           model: exception.model.constantize.model_name.human)
           }
  end

  def invalid_record(exception)
    render status: :unprocessable_entity,
           json: { error: exception.record.errors.full_messages }
  end
end
