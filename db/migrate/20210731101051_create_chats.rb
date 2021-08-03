class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.integer :area_id,           null: false
      t.integer :price_id,          null: false
      t.string  :sauna_name,        null: false
      t.text    :description,       null: false
      t.references :user,           foregin_key: true
      t.timestamps
    end
  end
end
