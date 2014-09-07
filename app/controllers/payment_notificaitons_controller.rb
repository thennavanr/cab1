class PaymentNotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    binding.pry
    PaymentNotification.create!(:params => params, :reservation_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id] )
    render :nothing => true
  end

end
