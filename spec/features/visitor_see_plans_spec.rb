require 'rails_helper'

feature 'Visitor see plans in home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('totam')
    expect(page).to have_content('non')
    expect(page).to have_content('Whatsapp')
    expect(page).to have_content('Facebook')
    expect(page).to have_content(/1/)
    expect(page).to have_content(/10/)
    expect(page).to have_content(/55/)
    expect(page).to have_content(/65/)
    expect(page).to have_content(/21/)
    expect(page).to have_content(/22/)
    expect(page).to have_content('R$ 1,60')
    expect(page).to have_content('R$ 1,50')
    expect(page).to have_content('R$ 1,80')
    expect(page).to have_content('R$ 1,70')
    expect(page).to have_content('R$ 67,27')
    expect(page).to have_content('R$ 57,89')
  end

  scenario 'by have not any plan register' do
    stub_request(:get, 'http://exemplo.com/api/v1/plans')
      .to_return(status: 200, body: '[]')

    visit root_path
    expect(page).to have_content('Sem planos cadastrados')
  end

  scenario 'and cannot view order clients path unless be logged' do
    visit order_clients_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Faça login para continuar')
  end
end
