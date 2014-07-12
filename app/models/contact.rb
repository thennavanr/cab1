class Contact < ActiveRecord::Base

validates :name, :presence => true
validates :email, :presence => true
validates :phone, :presence => true
validates :address, :presence => true
validates :subject, :presence => true
validates :message, :presence => true


end
