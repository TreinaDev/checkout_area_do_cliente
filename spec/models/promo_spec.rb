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

      expect(promo.errors[:discount]).to include('deve ser menor ou igual a 100')
    end
  end

  context '#dates valid' do
    it 'start_date valid' do
      promo = Promo.create(start_date: Date.yesterday, end_date: 7.days.from_now)

      promo.valid?

      expect(promo.errors[:start_date]).to include('não pode estar no passado')
    end

    it 'dates in the past valid' do
      promo = Promo.create(start_date: Date.yesterday, end_date: 2.days.ago)

      promo.valid?

      expect(promo.errors[:start_date]).to include('não pode estar no passado')
      expect(promo.errors[:end_date]).to include('não pode estar no passado')
      expect(promo.errors[:end_date]).to include('não pode ser menor que Data de Início')
    end

    it 'end_date valid' do
      promo = Promo.create(end_date: Time.zone.today)

      promo.valid?

      expect(promo.errors[:end_date]).to include('não pode estar no passado')
    end

    it 'end_date greater than start_date' do
      promo = Promo.create(end_date: Time.zone.today,
                           start_date: 7.days.from_now)

      promo.valid?

      expect(promo.errors[:end_date]).to include('não pode ser menor que Data de Início')
    end

    it 'end_date greater than start_date' do
      promo = Promo.create(end_date: 100.days.from_now,
                           start_date: 200.days.from_now)

      promo.valid?

      expect(promo.errors[:end_date]).to include('não pode ser menor que Data de Início')
    end
  end
end
