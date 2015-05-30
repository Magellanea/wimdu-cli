class CreateOffers < ActiveRecord::Migration

  def up
    create_table :offers do |t|
      t.integer :offer_id
      t.string :uid
      t.string :title
      t.string :address
      t.float :nightly_rate_eur
      t.integer :max_guests
      t.string :email
      t.string :phone_number
    end
    add_index :offers, :uid, :unique => true
    puts 'ran up method'
  end 

  def down
    drop_table :offers
    puts 'ran down method'
  end

end
