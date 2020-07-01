class Promo < ApplicationRecord
  validates :title, :discount, :start_date, :end_date, presence: true

  validates :discount, numericality: { less_than_or_equal_to: 100 }

  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past
  validate :end_date_cannot_be_greater_than_start_date

  def start_date_cannot_be_in_the_past
    return unless start_date.present? && start_date < Time.zone.today

    errors.add(:start_date, :in_the_past)
  end

  def end_date_cannot_be_in_the_past
    return unless end_date.present? && end_date <= Time.zone.today

    errors.add(:end_date, :in_the_past)
  end

  def end_date_cannot_be_greater_than_start_date
    return unless end_date.present? && start_date.present? && end_date < start_date

    errors.add(:end_date, :date_compare_error)
  end
end
