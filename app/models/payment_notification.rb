class PaymentNotification < ActiveRecord::Base
  belongs_to :reservation
  serialize :params
  after_create :mark_reservation_purchased

  private
  def mark_reservation_purchased
    if status == "Completed"
      reservation.update_attribute(:purchased_at, Time.now)
    end
  end
end
