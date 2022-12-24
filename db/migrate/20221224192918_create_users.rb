# frozen_string_literal: true

# users
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.date :birth_date, null: false
      t.integer :test_passed
      t.float :avrg_rate

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
