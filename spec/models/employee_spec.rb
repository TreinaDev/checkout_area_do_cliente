require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'successfully' do
    let(:employee) { build(:employee, email: 'larissa@gmail.com', password: 'senha123') }
    it 'and must be valid' do
      expect(employee).to be_valid
    end
  end
  context 'email must be uniq' do
    let(:employee) { build(:employee, email: 'vendedor@empresa.com', password: 'senha123') }
    it 'and can not be valid' do
      create(:employee, email: 'vendedor@empresa.com', password: '123456')
      expect(employee).to_not be_valid
    end
  end
  context 'can not be blank' do
    context 'email' do
      let(:employee) { build(:employee, email: '') }
      it 'and can not be valid' do
        expect(employee).to_not be_valid
      end
    end
    context 'password' do
      let(:employee) { build(:employee, password: '') }
      it 'and can not be valid' do
        expect(employee).to_not be_valid
      end
    end
  end
end
