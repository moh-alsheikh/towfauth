class AddCountryCodeAndMobileNoToUser < ActiveRecord::Migration
  def change
    add_column :users, :country_code, :string
    add_column :users, :mobile_no, :string
    add_column :users, :sign_up_completed, :boolean,default: false
  end
end
