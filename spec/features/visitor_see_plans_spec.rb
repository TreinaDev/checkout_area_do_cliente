require 'rails_helper'

feature 'Visitor see plans in home page' do
  scenario 'successfully' do
    plans = [Plan.new(id: '1', name: 'Para Conectar', platforms: 'Facebook', limit_daily_chat: 100,
                      limit_monthly_chat: 200, limit_daily_messages: 300, limit_monthly_messages: 500,
                      extra_message_price: 0.60, extra_chat_price: 0.50, current_price: 60.00),
             Plan.new(id: '2', name: 'Para Conversar', platforms: 'Whatsapp', limit_daily_chat: 200,
                      limit_monthly_chat: 300, limit_daily_messages: 600, limit_monthly_messages: 100,
                      extra_message_price: 0.50, extra_chat_price: 0.40, current_price: 100.00)]

    allow(Plan).to receive(:all).and_return(plans)

    visit root_path

    (0..1).each do |index|
      expect(page).to have_content(plans[index].name)
      expect(page).to have_content(plans[index].platforms)
      expect(page).to have_content(plans[index].limit_daily_chat)
      expect(page).to have_content(plans[index].limit_monthly_chat)
      expect(page).to have_content(plans[index].limit_daily_messages)
      expect(page).to have_content(plans[index].limit_monthly_messages)
      expect(page).to have_content(plans[index].extra_message_price)
      expect(page).to have_content(plans[index].extra_chat_price)
      expect(page).to have_content(plans[index].current_price)
    end
  end

  scenario 'by have not any plan register' do
    allow(Plan).to receive(:all).and_return([])
    visit root_path
    expect(page).to have_content('Sem planos cadastrados')
  end

  scenario 'and cannot visit history unless be logged' do
    visit plans_path

    expect(current_path).to eq(new_client_session_path)
  end

  scenario 'and cannot view order clients path unless be logged' do
    visit order_clients_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Faça login para continuar')
  end

  scenario 'and cannot view history unless be logged' do
    visit root_path

    expect(page).not_to have_link('Histórico de pedidos')
  end
end
