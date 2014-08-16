class AddCompanyNameToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :company_name, :string
  end
end
