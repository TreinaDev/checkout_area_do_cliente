class Promo < ApplicationRecord
  validates :title, :discount, :start_date, :end_date, presence: true

  validates :discount, numericality: { less_than: 101 }

  validate :start_date_must_be_valid
  validate :end_date_must_be_valid

  def start_date_must_be_valid
    if start_date.present? && start_date < Time.zone.today
      errors.add(:start_date, 'Não é uma data válida')
    end
  end

  def end_date_must_be_valid
    if end_date.present? && end_date <= Time.zone.today
      errors.add(:end_date, 'Não é uma data válida')
    end
  end
end
