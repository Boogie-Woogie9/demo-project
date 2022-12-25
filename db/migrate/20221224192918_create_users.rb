# frozen_string_literal: true

# users
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.date :birth_date, null: false
      t.integer :test_passed, default: 0
      t.float :avrg_rate, default: 0

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
