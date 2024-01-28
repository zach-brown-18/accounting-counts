class Scholarship < ApplicationRecord
  belongs_to :client
  belongs_to :provider
  has_many :payments

  after_save :create_payments

  def child_full_name
    child_first_name + " " + child_last_name
  end

  def display_name
    year.to_s + ", " + child_full_name
  end

  def cycle_ccc_pay
    return cycle_tuition - cycle_discount - cycle_state_voucher - cycle_parent_copay \
    unless cycle_tuition.nil? or cycle_discount.nil? or cycle_state_voucher.nil? or cycle_parent_copay.nil?
    0
  end

  def duration_in_weeks
    (end_date.jd - start_date.jd) / 7
  end

  def n_payments
    payments.count
  end

  def remaining_balance
    Rails.cache.fetch("#{cache_key}/remaining_balance", expires_in: 1.day) do
      balance = 0
      payments.each do |payment|
        balance += payment.remaining_balance(cycle_ccc_pay)
      end
      balance
    end
  end

  after_touch do
    Rails.cache.delete("#{cache_key}/remaining_balance")
  end

  private

  def create_payments
    if billing_cycle == 'Weekly'
      create_weekly_payments
    elsif billing_cycle == 'Monthly'
      create_monthly_payments
    end
  end

  def create_weekly_payments
    current_date = start_date
    while current_date <= end_date
      create_payment_for_week(current_date)
      current_date += 1.week
    end
  end

  def create_monthly_payments
    current_date = start_date
    while current_date <= end_date
      create_payment_for_month(current_date)
      current_date += 1.month
    end
  end

  def create_payment_for_week(date)
    Payment.create!(
      scholarship_id: id,
      client_id: client_id,
      week_end_date: date + 6.days,
      month_name: date.strftime('%B'),
      amount_due: cycle_ccc_pay,
      amount_paid: 0,
      date_paid: nil,
      reference: nil
    )
  end

  def create_payment_for_month(date)
    Payment.create!(
      scholarship_id: id,
      client_id: client_id,
      week_end_date: nil,
      month_name: date.strftime('%B'),
      amount_due: cycle_ccc_pay,
      amount_paid: 0,
      date_paid: nil,
      reference: nil
    )
  end
end
