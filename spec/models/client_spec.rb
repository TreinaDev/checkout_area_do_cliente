require 'rails_helper'

RSpec.describe Client, type: :model do
  context 'successfully' do
    it 'successfully' do
      client = create(:client)

      result = Client.find(client.id)

      expect(result).to eq(client)
      expect(result.email).to eq(client.email)
    end
  end
  context 'validation' do
    it 'email must be unique' do
      client = create(:client)
      client_two = Client.new(email: client.email, password: '12345678')

      client_two.valid?

      expect(client_two.errors[:email]).to include('já está em uso')
    end

    it 'email and password incorrect' do
      client = Client.new(email: 'testegmail.co', password: '123')

      client.valid?

      expect(client.errors[:email]).to include('não é válido')
      expect(client.errors[:password]).to include('é muito curto (mínimo: 6 caracteres)')
    end

    it 'email and password incorrect' do
      client = Client.new(email: '', password: '')

      client.valid?

      expect(client.errors[:email]).to include('não pode ficar em branco')
      expect(client.errors[:password]).to include('não pode ficar em branco')
    end
  end
end
