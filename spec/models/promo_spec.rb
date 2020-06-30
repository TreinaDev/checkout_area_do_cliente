require 'rails_helper'

describe Promo, type: :model do
  context '#cannot be blank' do
    it 'title cannot be blank' do
      promo = Promo.new

      promo.valid?

      expect(promo.errors[:title]).to include('não pode ficar em branco')
    end

    it 'discount cannot be blank' do
      promo = Promo.new

      promo.valid?

      expect(promo.errors[:discount]).to include('não pode ficar em branco')
    end

    it 'start_date cannot be blank' do
      promo = Promo.new

      promo.valid?

      expect(promo.errors[:start_date]).to include('não pode ficar em branco')
    end

    it 'end_date cannot be blank' do
      promo = Promo.new

      promo.valid?

      expect(promo.errors[:start_date]).to include('não pode ficar em branco')
    end
  end

  context '#numericality' do
    it 'must be less than 101' do
      promo = Promo.create(discount: 101)

      promo.valid?

      expect(promo.errors[:discount]).to include('deve ser menor que 101')
    end
  end

  context '#dates valid' do
    it 'start_date valid' do
      promo = Promo.create(start_date: Date.yesterday)

      promo.valid?

      expect(promo.errors[:start_date]).to include('Não é uma data válida')
    end

    it 'end_date valid' do
      promo = Promo.create(end_date: Time.zone.today)

      promo.valid?

      expect(promo.errors[:end_date]).to include('Não é uma data válida')
    end
  end
end
