require 'rails_helper'

feature 'Client cancel bot' do
  scenario 'sucessfully' do
    create(:client, email: 'teste@teste.com', password: '123456')

    visit root_path

  end
end
