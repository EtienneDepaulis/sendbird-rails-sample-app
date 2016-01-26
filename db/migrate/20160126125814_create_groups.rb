class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :sendbird_channel_url

      t.timestamps null: false
    end
  end
end
