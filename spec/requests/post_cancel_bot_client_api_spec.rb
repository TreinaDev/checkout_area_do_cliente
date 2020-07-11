require 'rails_helper'

describe 'Purchase cancellation requests' do
  context 'POST /api/v1/purchase/:id/cancel' do
    xit 'should create an purchase cancellation request' do
      purchase = create(:purchase)

      post api_v1_purchase_cancellations_path,
           params: { purchase: { token: purchase.token } }

      expect(response).to have_http_status(:no_content)
      expect(purchase.cancellation_requests.count).to eq(1)
    end

    xit 'should save the reason for cancellation' do
      purchase = create(:purchase)

      post api_v1_purchase_cancellations_path,
           params: { purchase: { token: purchase.token },
                     reason: 'Não preciso mais deste serviço.' }

      expect(response).to have_http_status(:no_content)
      expect(purchase.cancellation_requests.count).to eq(1)
      expect(purchase.cancellation_requests.first.reason).to eq('Não preciso mais deste serviço.')
    end

    xit 'should return not found for an invalid purchase id' do
      post api_v1_purchase_cancellations_path,
           params: { purchase: { token: 'AM82CO' } }

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:not_found)
      expect(json_response[:error]).to eq 'Compra não encontrada(o).'
    end

    xit 'should return unprocessable entity if threre is an open cancellation request' do
      purchase = create(:purchase)
      create(:purchase_cancellation, purchase: purchase)

      post api_v1_purchase_cancellations_path,
           params: { purchase: { token: purchase.token } }

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(purchase.cancellation_requests.count).to eq(1)
      expect(json_response[:error]).to eq ['Compra já possui uma solicitação de cancelamento em aberto.']
    end
  end
end
